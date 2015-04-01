#tag Class
Protected Class ScriptMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  dim i as integer
		  dim errors as string
		  dim r as MARC_Record
		  dim w as wndMARC
		  dim macro as folderItem
		  dim macro_text as string
		  dim macro_lines() as string
		  dim block() as string
		  dim line as integer
		  dim chunks() as string
		  dim first_rec, last_rec as integer
		  dim comment_start as integer
		  dim rec as integer
		  
		  if window(0) isA wndMARC then
		    w = wndMARC( window(0) )
		    marcFile = w.file
		  else
		    return true
		  end if
		  
		  info = "Processing"
		  
		  variables = new dictionary
		  sh = new shell
		  sh.Mode = 0 ' synchronous
		  sh.TimeOut = 15000
		  
		  macroFolder = app.GetScriptFolder()
		  macro = me.tag
		  macro_text = macro.loadTextFile
		  
		  ' Make sure we have credentials and avoid nesting modal dialogs before we start
		  if instr( macro_text, "voyager" ) > 0 then
		    if not GetVoyagerSettings() then
		      return true
		    end if
		  end if
		  
		  macro_lines() = split(macro_text, chr(10))
		  
		  if macro_lines(0) <> "once" and macro_lines(0) <> "each" then
		    macro_lines.insert( 0, "once" )
		  end if
		  
		  ProgressStart w, "Running: " + macro.name, 100
		  
		  for line = 0 to macro_lines.Ubound
		    select case macro_lines(line).trim
		    case "once"
		      get_block( macro_lines, line, block )
		      execute_block( block, w.lstRecords.ListIndex )
		    case "each"
		      dim number_to_process as integer = w.lstRecords.NumberSelected
		      dim number_processed as integer = 0
		      
		      ProgressNewMax number_to_process
		      get_block( macro_lines, line, block )
		      for rec = 0 to w.lstRecords.listCount - 1
		        if w.lstRecords.selected(rec) then
		          execute_block( block, rec )
		          w.lstRecords.selected(rec) = false
		          number_processed = number_processed + 1
		          ProgressUpdate info + " (" + str(number_processed) + " / " + str(number_to_process) + ")", number_processed
		          if progressDialog.cancelled then
		            MsgBox "User Cancelled"
		            ProgressEnd
		            return true
		          end if
		          if errors <> "" then
		            MsgBox "Something went wrong..." + chr(13) + chr(13) + errors
		            ProgressEnd
		            return true
		          end if
		        end if
		      next
		    case else
		      ' do nothing
		    end select
		  next
		  
		  ProgressEnd
		  
		  Return True
		  
		Exception Err
		  MsgBox "Error" + chr(13) + chr(13) + "Script failed with message: " + Err.message
		  ProgressEnd
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  if window(0) isA wndMARC then
		    me.enabled = true
		  else
		    me.enabled = false
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(file as folderitem)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(Text As String, Tag As Variant=Nil) -- From MenuItem
		  // Constructor() -- From MenuItem
		  Super.Constructor
		  
		  me.Text = file.name.left(file.name.len - 4)
		  me.Tag = file
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function evaluate_parameter(param as String) As string
		  if param = "" then
		    return ""
		  elseif param.left(1) = """" and param.right(1) = """" then
		    ' literal
		    return param.mid(2, param.len - 2)
		  else
		    ' variable
		    if variables.hasKey( param ) then
		      return variables.value( param )
		    else
		      ' Badness!
		      raise_exception "Unknown variable: " + param
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute_block(block() as string, rec as integer)
		  ' Implement macro commands here
		  
		  dim line as integer
		  dim chunks() as string
		  dim command as string
		  dim response as dictionary
		  
		  for line = 0 to block.ubound
		    redim chunks(-1)
		    make_chunks( rec, block(line), chunks )
		    if chunks.ubound >= 0 then
		      command = chunks(0)
		      chunks.remove(0)
		      select case command
		      case "alert"
		        msgbox unquoted( chunks )
		      case "info"
		        info = unquoted( chunks )
		      case "report"
		        report.append( unquoted( chunks ) )
		      case "savereport"
		        dim d as new date
		        dim f as folderItem = new FolderItem("marc_utility_report.txt")
		        #if TargetWin32
		          f.saveTextFile( implode( report, chr(13) ) )
		        #else
		          f.saveTextFile( implode( report, chr(10) ) )
		        #endif
		        f.Launch
		      case "ask"
		        command = chunks(0)
		        chunks.remove(0)
		        response = ask( evaluate_parameter(command), chunks )
		        if response = nil then
		          raise_exception "User Cancelled"
		        else
		          variables.addValuesFrom( response )
		        end if
		      case "run"
		        command = chunks(0)
		        chunks.remove(0)
		        shell_run command, chunks
		      end select
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub get_block(macro_lines() as string, Byref line as integer, ByRef block() as string)
		  ' implement new block controls (e.g. looping constructs, conditionals) here
		  
		  redim block(-1)
		  while line < macro_lines.ubound
		    line = line + 1
		    if macro_lines(line).trim = "once" or macro_lines(line).trim = "each" then
		      line = line - 1
		      return
		    else
		      block.append macro_lines(line)
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function macro_function(current_record as integer, function_name as string, params() as string) As string
		  ' Implement new macro functions here
		  
		  dim i as integer
		  for i = 0 to params.ubound
		    params(i) = evaluate_parameter( params(i) )
		  next
		  
		  select case function_name
		  case "voyager"
		    if params.ubound < 0 then
		      MsgBox "Bad function call -- voyager( field [, subfield[, regex_filter] )"
		      return ""
		    else
		      ' make sure we have at least three params
		      params.append ""
		      params.append ""
		      dim oclc as string = marcFile.records( current_record ).get_field( "035", "a", "([0-9]+)" )
		      dim bib_id as uint64 = GetBibIdFromOCLC( oclc )
		      return voyager_query( bib_id, params(0), params(1), params(2) ).quoted
		    end if
		  case "marc"
		    if params.ubound < 0 then
		      MsgBox "Bad function call -- marc( field [, subfield[, regex_filter] )"
		      return ""
		    else
		      ' make sure we have at least three params
		      params.append ""
		      params.append ""
		    end if
		    return marcFile.records( current_record ).get_field(params(0), params(1), params(2)).quoted
		  case else
		    MsgBox "Unknown macro function: " + function_name
		    return ""
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub make_chunks(current_record as integer, s as string, byref chunks() as string)
		  ' splits a string into chunks along word boundaries, but respecting function calls, quoted strings, and comments
		  
		  dim rg as new RegEx
		  dim match as RegExMatch
		  dim params() as string
		  dim found as string
		  
		  s = s + " "
		  
		  ' Tokenizer:
		  rg.SearchPattern = "((\""[^\""]*\"")\s)|({(\w+)\s([^}]*)}\s)|(--)|(([^\s]+)\s)"
		  ' \1 matches a quoted string, \2 is string sans trailing space
		  ' \3 matches a function call "{foo p1 p2 ...}", \4 is the function name, \5 is the parameter list
		  ' \6 indicates that a comment has started ("--...")
		  ' \7 matches a space-delimited token and \8 is the token itself
		  
		  ' Note that we don't cope with nested functions although if we did it would rock
		  
		  match = rg.search( s )
		  while match <> nil
		    found = match.SubExpressionString(0)
		    if match.SubExpressionString(1) <> "" then
		      chunks.append match.SubExpressionString(2)
		    elseif match.SubExpressionString(3) <> "" then
		      redim params(-1)
		      make_chunks(current_record, match.SubExpressionString(5), params)
		      chunks.append macro_function( current_record, match.SubExpressionString(4), params )
		    elseif match.SubExpressionString(6) = "--" then
		      ' we're done -- everything from here on in is a comment
		      return
		    elseif match.SubExpressionString(7) <> "" then
		      chunks.append match.SubExpressionString(8)
		    else
		      ' Badness!
		      raise_exception "Error parsing macro command: " + s
		      return
		    end if
		    match = rg.search
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub make_params(s as string, byref params() as string)
		  '' splits a string into chunks along word boundaries, but respecting function calls and quoted strings
		  '
		  'dim rg as new RegEx
		  'dim match as RegExMatch
		  '
		  's = s + " "
		  '' Tokenizer:
		  'rg.SearchPattern = "((\""[^\""]*\"")\s)|(([^\s]+)\s)"
		  '' \1 is quoted string \2 is string without trailing space
		  '' \3 is a delimited token with delimiter \4 is the token itself
		  '
		  'match = rg.search( s )
		  'while match <> nil
		  's = match.SubExpressionString(0)
		  'if match.SubExpressionString(1) <> "" then
		  'params.append match.SubExpressionString(2)
		  'elseif match.SubExpressionString(3) <> "" then
		  'params.append match.SubExpressionString(4)
		  'else
		  'msgbox "Error parsing method parameters"
		  'return
		  'end if
		  'match = rg.search
		  'wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub raise_exception(msg as string)
		  dim r as New RuntimeException
		  
		  r.ErrorNumber = -1
		  r.Message = msg
		  Raise r
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shell_run(script_name as string, params() as string)
		  dim s as string = ""
		  dim script as folderItem
		  dim c as clipboard
		  
		  // get the script
		  script = macroFolder.child( script_name )
		  s = """" + script.shellPath + """"
		  for each param as string in params
		    s = s + " " + evaluate_parameter(param)
		  next
		  
		  c = new clipboard
		  c.Text = ""
		  c.close
		  
		  sh.execute s
		  
		  // report the result
		  c = new Clipboard
		  if c.Text <> "success" then
		    raise_exception "Command (" + s + ") failed with result: " + c.Text
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		info As string
	#tag EndProperty

	#tag Property, Flags = &h0
		macroFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		marcFile As MARC_File
	#tag EndProperty

	#tag Property, Flags = &h0
		report(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		sh As shell
	#tag EndProperty

	#tag Property, Flags = &h0
		variables As dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="info"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Bold"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Italic"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Underline"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
