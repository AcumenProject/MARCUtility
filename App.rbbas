#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ' Create Automation Menu
		  dim item as menuItem
		  dim i as integer
		  dim f, file as folderItem
		  dim m as EncodingMenuItem
		  dim enc as TextEncoding
		  dim encName as string
		  
		  f = GetScriptFolder()
		  
		  ' Build Automation Menu
		  for i = 1 to f.count
		    file = f.item(i)
		    if file.name.right(4) = ".txt" then
		      item = new ScriptMenuItem( file )
		      
		      Automation.Append item
		    end if
		  next
		  
		  ' Build Encodings Menus
		  for i = 0 to Encodings.Count - 1
		    enc = encodings.item(i)
		    encName = enc.internetName
		    m = new EncodingMenuItem
		    m.encoding = enc
		    m.text = encName
		    if encName = "UTF-8" then
		      m.checked = true
		      EncodingMenuItem.checkedItem = m
		    end if
		    
		    if encName.instr("ISO") > 0 then
		      DefaultEncodingISO.Append m
		    elseif encName.instr("mac") > 0 then
		      DefaultEncodingMac.Append m
		    elseif encName.instr("dos") > 0 then
		      DefaultEncodingDOS.Append m
		    elseif encName.instr("win") > 0 then
		      DefaultEncodingWindows.Append m
		    elseif encName.instr("utf") > 0 then
		      DefaultEncodingUTF.Append m
		    else
		      FileDefaultEncoding.Append m
		    end if
		  next
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim w as wndMARC
		  
		  if window(0) isA wndMARC then
		    w = wndMARC(window(0))
		    if w.file <> nil then
		      w = new wndMARC
		    end if
		  else
		    w = new wndMARC
		  end if
		  
		  if item <> nil then
		    if SniffMARC(item) or Confirm( "Warning: this does not look like a valid MARC file, sorry." ) then
		      w.load item
		    end if
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  ReportException( error )
		  return true
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function EditPreferences() As Boolean Handles EditPreferences.Action
			MsgBox "Sorry, no preferences yet."
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			window(0).close
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewBatchJob() As Boolean Handles FileNewBatchJob.Action
			dim w as window
			dim b as wndBatch
			
			w = window(0)
			
			b = new wndBatch
			
			if w isa wndMARC and wndMARC(w).file = nil then
			w.close
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			dim f as folderItem
			f = GetOpenFolderItem(MARCfiletypes.any)
			
			if f <> nil then
			OpenDocument( f )
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileViewVoyagerRecord() As Boolean Handles FileViewVoyagerRecord.Action
			dim params() as string = split( "BIB_ID,035a (Number Only)", "," )
			dim bib_id as int64
			dim oclc as string
			
			dim d as new wndVoyagerQuery
			
			d.ShowModal
			
			if not d.cancelled then
			select case d.popMethod.ListIndex
			case 0 ' 035a
			oclc = d.txtSearchValue.text.Trim
			bib_id = GetBibIdFromOCLC( oclc )
			if bib_id > 0 then
			wndMARC.load( bib_id )
			else
			msgbox "Record not found"
			end if
			case 1 ' BIB_ID
			bib_id = val( d.txtSearchValue.text )
			wndMARC.load( bib_id )
			end select
			end if
			
			d.close
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			AboutBox.showModal
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function GetScriptFolder() As FolderItem
		  dim f as folderItem
		  
		  #if DebugBuild
		    f = GetFolderItem("C:\Documents and Settings\taloewald\Desktop\Utilities\MARC Utility")
		  #else
		    f = GetFolderItem("")
		  #endif
		  f = f.child("Voyager Macros")
		  
		  return f
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DefaultEncoding As TextEncoding
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
