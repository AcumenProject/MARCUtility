#tag Module
Protected Module Utilities
	#tag Method, Flags = &h0
		Sub addValuesFrom(extends d as dictionary, fromdict as dictionary)
		  dim i as integer
		  
		  for i = 0 to fromdict.Count - 1
		    d.value( fromdict.Key(i) ) = fromdict.Value( fromdict.Key(i) )
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ask(prompt as String, params() as string) As dictionary
		  dim d as new wndAsk
		  dim i as integer
		  dim param as string
		  
		  while params.ubound < 3
		    params.append ""
		  wend
		  
		  d.prompt.text = prompt
		  for i = 3 downTo 0
		    param = params(i).Titlecase
		    if param = "" then
		      d.param(i).text = ""
		      d.param(i).Visible = false
		      d.response(i).Visible = false
		      d.btnOK.top = d.response(i).top + 42
		      d.btnCancel.top = d.response(i).top + 42
		      d.height = d.response(i).top + 84
		    else
		      if param.right(1) = "*" then
		        d.response(i).Password = true
		        param = param.left(param.len - 1)
		      end if
		      d.param(i).text = param
		    end if
		  next
		  
		  d.showModal
		  
		  if d.cancelled then
		    return nil
		  else
		    dim dict as new Dictionary
		    for i = 0 to 3
		      if d.param(i).visible then
		        dict.value(params(i)) = d.response(i).text
		      end if
		    next
		    return dict
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Assert(test as Boolean, description as string)
		  dim r as RuntimeException
		  
		  if not test then
		    r = new RuntimeException
		    r.ErrorNumber = 0
		    r.Message = "Assetion failed: " + description
		    raise r
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CenterInWindow(Extends w as window, parent as window)
		  w.left = parent.left + (parent.width - w.width) * 0.5
		  w.top = parent.top + (parent.height - w.height) * 0.5
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Confirm(msg as string, title_caption as string = "Warning", ok_caption as string = "Proceed", cancel_caption as string = "Cancel") As boolean
		  dim d as MessageDialog
		  dim b as MessageDialogButton
		  
		  d = new MessageDialog
		  
		  d.ActionButton.caption = ok_caption
		  d.CancelButton.caption = cancel_caption
		  d.CancelButton.visible = true
		  d.CancelButton.default = true
		  d.AlternateActionButton.Visible = false
		  d.title = title_caption
		  d.Message = msg
		  d.Icon = MessageDialog.GraphicCaution
		  
		  b = d.ShowModal
		  
		  if b.caption = "Cancel" then
		    return false
		  else
		    return true
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertString(s as string, fromEncoding as TextEncoding, toEncoding as TextEncoding) As String
		  static c as TextConverter
		  static lastFrom as TextEncoding
		  static lastTo as TextEncoding
		  
		  if c = nil or lastFrom <> fromEncoding or lastTo <> toEncoding then
		    c = GetTextConverter( fromEncoding, toEncoding )
		    lastFrom = fromEncoding
		    lastTo = toEncoding
		  end if
		  
		  return c.convert(s)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function grep(s as string, regex_filter as String, which_subexpression as integer = 1) As String
		  dim rg as new regex
		  dim match as RegExMatch
		  
		  rg.SearchPattern = regex_filter
		  match = rg.search( s )
		  if match <> nil then
		    return match.SubExpressionString( which_subexpression  )
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function implode(a() as String, glue as string = " ") As String
		  dim s as string = ""
		  
		  if a.ubound > -1 then
		    s = a.pop
		    while a.ubound > -1
		      s = s + glue + a.pop
		    wend
		  end if
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function loadTextFile(extends f as FolderItem) As String
		  dim input as TextInputStream
		  dim s as string
		  
		  if not f.exists then
		    return ""
		  else
		    input = f.OpenAsTextFile
		    s = input.ReadAll
		    input.close
		    
		    s = replaceAll( s, chr(13) + chr(10), chr(10) )
		    s = replaceAll( s, chr(13), chr(10) )
		    
		    return s
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberSelected(extends L as Listbox) As integer
		  dim i, c as integer = 0
		  
		  for i = 0 to L.ListCount - 1
		    if L.selected(i) then
		      c = c + 1
		    end if
		  next
		  
		  return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProgressEnd()
		  if progressDialog <> nil then
		    progressDialog.close
		    progressDialog = nil
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProgressNewMax(max as integer)
		  if progressDialog <> nil then
		    progressDialog.bar.Maximum = max
		    progressDialog.bar.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProgressStart(w as window, task as string, max as integer)
		  if progressDialog = nil then
		    progressDialog = new dlgProgress
		    progressDialogNextUpdate = microseconds
		  end if
		  
		  progressDialog.left = w.left + (w.width - progressDialog.width) * 0.5
		  progressDialog.top = w.top + (w.height - progressDialog.height) * 0.5
		  progressDialog.txtTask.caption = task
		  progressDialog.txtActivity.caption = ""
		  progressDialog.bar.value = 0
		  progressDialog.bar.Maximum = max
		  progressDialog.show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProgressUpdate(activity as String, val as integer)
		  if progressDialog <> nil then
		    progressDialog.txtActivity.caption = activity
		    progressDialog.bar.value = val
		    
		    // Only refresh four times per second
		    if Microseconds < progressDialogNextUpdate then
		      return
		    else
		      progressDialogNextUpdate = microseconds + 250000
		    end if
		    
		    progressDialog.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function quoted(extends s as string, quote as string = """") As String
		  return quote + s + quote
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportException(e as RuntimeException)
		  dim d as MessageDialog
		  dim b as MessageDialogButton
		  dim s() as string
		  dim method_name as string
		  
		  s = e.Stack
		  d = new MessageDialog
		  d.title = "Something Bad Happened"
		  d.ActionButton.caption = "So it goes"
		  d.ActionButton.default = true
		  'd.AlternateActionButton.caption = "Tell me more"
		  d.AlternateActionButton.visible = false
		  d.CancelButton.visible = false
		  if s(0) = "Assert" and ubound(s) > 0 then
		    method_name = s(1)
		  else
		    method_name = s(0)
		  end if
		  d.Message = "Exception in " + method_name + ": " + e.Message + " (" + str(e.ErrorNumber) + ")"
		  
		  b = d.showModal
		  
		  ProgressEnd()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveTextFile(extends f as folderItem, s as String)
		  dim out as TextOutputStream
		  
		  out = TextOutputStream.Create(f)
		  out.Write s
		  out.close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SniffMARC(f as FolderItem) As boolean
		  dim s as string
		  dim input as TextInputStream
		  dim rg as new RegEx
		  dim match as new RegExMatch
		  
		  input = f.OpenAsTextFile
		  s = input.read(24)
		  
		  rg.SearchPattern = "\d{5}[a-z]{3}[\#a ]{2}..\d{5}...4500"
		  match = rg.search(s)
		  if match = nil then
		    return false
		  else
		    return true
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub trimStringArray(byRef a() as String)
		  dim i as integer
		  
		  for i = 0 to a.ubound
		    a(i) = a(i).trim
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function unquoted(extends s as String) As String
		  if (s.left(1) = """" or s.left(1) = "'") and s.left(1) = s.right(1) then
		    return s.mid(2, s.len - 2)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function unquoted(s() as String) As string
		  dim t, u as string
		  
		  u = ""
		  
		  for each t in s
		    u = u + t.unquoted
		  next
		  
		  return u
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		progressDialog As dlgProgress
	#tag EndProperty

	#tag Property, Flags = &h0
		progressDialogNextUpdate As double
	#tag EndProperty


	#tag Constant, Name = dagger, Type = String, Dynamic = False, Default = \"\xE2\x80\xA0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = double_dagger, Type = String, Dynamic = False, Default = \"\xE2\x80\xA1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = group_separator, Type = String, Dynamic = False, Default = \"\x1D", Scope = Public
	#tag EndConstant

	#tag Constant, Name = record_separator, Type = String, Dynamic = False, Default = \"\x1E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = unit_separator, Type = String, Dynamic = False, Default = \"\x1F", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
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
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="progressDialogNextUpdate"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
