#tag Window
Begin Window wndMARC
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.14e+2
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   212363263
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "MARC Utility | Viewer"
   Visible         =   True
   Width           =   6.84e+2
   Begin Listbox record_display
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   ""
      ColumnWidths    =   "100,60,60,1*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   390
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   169
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   4
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   511
      _ScrollWidth    =   -1
   End
   Begin Listbox lstRecords
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   390
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   4
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   4
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   160
      _ScrollWidth    =   -1
   End
   Begin StaticText txtStatus
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   4
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Status Info"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   394
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   676
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  dim i as integer
		  
		  for i = 0 to Automation.Count - 1
		    Automation.item(i).enabled = true
		  next
		  
		  VerifyEachRecord.enabled = true
		  
		  if lstRecords.NumberSelected > 0 then
		    EditClear.enabled = true
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
			dim i as integer
			
			for i = lstRecords.ListCount - 1 downTo 0
			if lstRecords.selected(i) then
			lstRecords.RemoveRow(i)
			file.records.remove(i)
			end if
			next
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSortByCallout() As Boolean Handles EditSortByCallout.Action
			dim d as dlgSort
			dim r as MARC_Record
			dim subfield as string
			dim ignore as string
			dim sortOrder as integer
			
			if file = nil or file.records.Ubound = 0 then
			return true
			end if
			
			d = new dlgSort
			
			d.CenterInWindow self
			
			if lstRecords.listindex < 0 then
			r = file.records(0)
			else
			r = file.records(lstRecords.listindex)
			end if
			
			d.load_callouts( r )
			
			d.showModal
			
			if d.Pressed_OK then
			subfield = d.cmbSubfield.text
			
			if subfield.len > 1 then
			subfield = ""
			end if
			
			if d.chkIgnoreLeading.Value then
			ignore = d.edtIgnoreLeading.text
			end if
			
			if d.popOrder.text = "ascending" then
			sortOrder = file.ascending
			else
			sortOrder = file.descending
			end if
			
			file.Sort_Records( d.popCallout.Text, sortOrder, subfield, ignore )
			end if
			
			d.close
			
			UpdateRecordList
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
			if file.file <> nil then
			file.Save_To_File( file.file )
			else
			DoFileSaveAs
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
			DoFileSaveAs
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VerifyEachRecord() As Boolean Handles VerifyEachRecord.Action
			dim d as new dlgVerifyRecords
			dim record as MARC_Record
			dim whichRec, whichField as integer
			dim fields() as string
			dim badFileCount as integer
			
			d.CenterInWindow self
			
			d.ShowModal
			
			if d.cancelled then
			return true
			end if
			
			fields = d.fldFieldList.text.split(",")
			
			d.close
			
			for whichRec = 0 to file.records.Ubound
			record = file.records(whichRec)
			for whichField = 0 to fields.ubound
			record.flag_color = &cffffff
			if record.get_field( fields(whichField) ) = "" then
			badFileCount = badFileCount + 1
			record.flag_color = &cff8080
			continue
			end if
			next
			next
			
			lstRecords.visible = false
			lstRecords.visible = true
			
			if badFileCount = 0 then
			MsgBox "No problems found"
			else
			MsgBox str( badFileCount ) + " of " + str( file.RecordCount ) + " records were missing at least one specified field and have been flagged red"
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VerifyFieldValuesMatch() As Boolean Handles VerifyFieldValuesMatch.Action
			dim d as new dlgVerifyFieldValuesMatch
			dim record as MARC_Record
			dim i as integer
			dim field, value, subfield as string
			
			d.CenterInWindow self
			
			if lstRecords.listindex = -1 then
			if lstRecords.listcount > 0 then
			record = lstRecords.cellTag(0, 0)
			else
			return true
			end if
			else
			record = lstRecords.cellTag(lstRecords.listindex, 0)
			end if
			
			d.record = record
			for i = 0 to record.directory_entries.Ubound
			d.popCallouts.addRow record.tags(i)
			d.edtValue.text = record.fields(i)
			next
			
			d.popCallouts.listindex = record_display.listindex
			
			d.showModal
			
			if not d.cancelled then
			subfield = d.popSubfields.text
			if subfield = "Entire Field" then
			subfield = ""
			end if
			VerifyField d.popCallouts.Text, subfield, d.edtValue.text, d.popCriterion.text, d.chkFixBadValues.value
			end if
			
			d.close
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub DoFileSaveAs()
		  dim f as folderItem
		  dim name as string = "Untitled"
		  
		  if file.file <> nil then
		    name = "OUT_" + file.file.name
		  end if
		  
		  f = GetSaveFolderItem( MARCfiletypes.any, name )
		  
		  if f <> nil then
		    file.Save_To_File( f )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(f as FolderItem)
		  self.Show
		  self.Refresh
		  
		  ProgressStart(self, "loading", 0)
		  
		  file = new MARC_File(f)
		  
		  self.title = "MARC Utility | Viewer | " + f.name
		  
		  UpdateRecordList
		  
		  ProgressEnd()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(bib_id as int64)
		  dim rec as MARC_Record
		  
		  self.Show
		  self.Refresh
		  
		  ProgressStart(self, "loading", 0)
		  
		  file = GetBibRecord( bib_id )
		  
		  self.title = "MARC Utility | Viewer | BIB_ID = " + str(bib_id)
		  
		  UpdateRecordList
		  
		  ProgressEnd()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRecordList()
		  dim i as integer
		  dim s as string
		  
		  lstRecords.listindex = -1
		  lstRecords.DeleteAllRows
		  
		  for i = 0 to file.records.Ubound
		    if file.records(i).main_title <> "" then
		      s = NthField( file.records(i).main_title, unit_separator, 1 )
		      while right(s, 1) = " " or right(s, 1) = "/"
		        s = left(s, s.len - 1)
		      wend
		      s = mid( s, 2 )
		    end if
		    lstRecords.addRow s
		    lstRecords.cellTag( lstRecords.LastIndex, 0 ) = file.records(i)
		  next
		  
		  if lstRecords.listCount > 0 then
		    lstRecords.listindex = 0
		  end if
		  
		  UpdateStatus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateStatus()
		  select case lstRecords.SelCount
		  case 0
		    txtStatus.caption = str(lstRecords.listCount) + " records"
		  case 1
		    txtStatus.caption = "One record (" + str(lstRecords.ListIndex + 1) + ") selected of " + str(lstRecords.ListCount) + " total."
		  case else
		    txtStatus.caption = str(lstRecords.selCount) + " selected of " + str(lstRecords.ListCount) + " total"
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VerifyField(callout as string, subfield as string, value as string, criterion as string, fixBadValues as boolean)
		  dim record as MARC_Record
		  dim which_record, callout_index as integer
		  dim s as string
		  dim missingCount as integer = 0
		  dim mismatchCount as integer = 0
		  
		  // criterion may be MATCHES or CONTAINS
		  
		  for which_record = 0 to lstRecords.ListCount - 1
		    record = lstRecords.cellTag(which_record, 0)
		    callout_index = -1
		    
		    s = record.get_field( callout, subfield )
		    if s = "" then
		      record.flag_color = &cff8080 // red -> field absent
		      if fixBadValues then
		        record.set_field( callout, value, subfield )
		      end if
		    elseif s = value or (criterion = "contains" and instr(s, value) > 0) then
		      record.flag_color = &c80ff80 // green -> OK
		    else
		      mismatchCount = mismatchCount + 1
		      record.flag_color = &cffff80 // yellow -> field wrong
		      if fixBadValues then
		        record.set_field( callout, value, subfield )
		      end if
		    end if
		    
		    lstRecords.invalidateCell( which_record, 0 )
		  next
		  
		  s = str(lstRecords.listcount) + " records examined." + chr(13) + chr(13)
		  if mismatchCount = 0 and missingCount = 0 then
		    s = s + "No problems were found."
		  else
		    s = s + str(mismatchCount) + " records had incorrect values." + chr(13)
		    s = s + str(missingCount) + " records had missing fields."
		    if fixBadValues then
		      s = s + chr(13) + chr(13) + "A total of " + str(mismatchCount + missingCount) + " records were modified."
		    end if
		  end if
		  MsgBox s
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		file As MARC_File
	#tag EndProperty

	#tag Property, Flags = &h0
		record As MARC_Record
	#tag EndProperty


#tag EndWindowCode

#tag Events record_display
	#tag Event
		Sub Open()
		  me.heading(0) = "Directory"
		  me.heading(1) = "Tag"
		  me.heading(2) = "Indicators"
		  me.heading(3) = "Field"
		  me.ColumnAlignment(1) = 2
		  
		  #if TargetMacOS
		    me.height = me.height - 16
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  dim s as string
		  dim c as string
		  dim fields() as string
		  
		  if column = 3 then
		    s = me.cell(row, column)
		    if val(me.cell(row, 1)) < 10 then
		      g.DrawString( s, x, y )
		    else
		      ' It seems that all fields with call numbers 10+ have marked subfields
		      fields = s.split(unit_separator)
		      for each f as string in fields
		        c = f.left(1)
		        g.foreColor = rgb(255,0,0)
		        g.bold = true
		        g.DrawString(c, x, y)
		        g.foreColor = rgb(0,0,0)
		        x = x + g.StringWidth(c) + 2
		        g.bold = false
		        f = f.mid(2)
		        g.DrawString( f, x, y )
		        x = x + g.StringWidth(f) + g.StringWidth(" ")
		      next
		    end if
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  // VerifyFieldValuesMatch.enabled = me.listindex > -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstRecords
	#tag Event
		Sub Change()
		  dim i as integer
		  
		  record_display.DeleteAllRows
		  
		  if me.listindex < 0 then
		    record_display.enabled = false
		    return
		  end if
		  
		  record = lstRecords.cellTag(lstRecords.ListIndex, 0)
		  for i = 0 to record.directory_entries.Ubound
		    record_display.addRow record.parsed_directory_entry(i)
		    record_display.cell( record_display.lastIndex, 1 ) = record.tags(i)
		    record_display.cell( record_display.lastIndex, 2 ) = record.indicators(i)
		    record_display.cell( record_display.LastIndex, 3 ) = record.fields(i)
		  next
		  
		  record_display.enabled = true
		  
		  UpdateStatus
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.heading(0) = "Record Titles"
		  
		  #if TargetMacOS
		    me.height = me.height - 16
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  dim record as MARC_Record
		  dim c as color
		  
		  if row > -1 and row < me.listcount then
		    record = me.CellTag( row, column )
		    c = record.flag_color
		    if me.Selected(row) then
		      c = hsv( c.Hue, c.Saturation, c.Value * 0.75 )
		    end if
		    g.foreColor = c
		    g.FillRect 0, 0, g.width, g.height
		    return true
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
