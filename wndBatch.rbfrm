#tag Window
Begin Window wndBatch
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   444
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   212363263
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   720
   Placement       =   0
   Resizeable      =   True
   Title           =   "MARC Utility | Batch Job"
   Visible         =   True
   Width           =   786
   Begin Listbox lstFiles
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
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
      Height          =   148
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   80
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   746
      _ScrollWidth    =   -1
   End
   Begin CheckBox chkStripTags
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Strip Tags"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      State           =   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   322
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin ComboBox cmbTags
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   050,051,052,055,060,061,066,070,071,072,074,080,082,084,086,088,090,099
      Italic          =   ""
      Left            =   132
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   322
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   634
   End
   Begin StaticText StaticText1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select Batch Operation"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   290
      Underline       =   ""
      Visible         =   True
      Width           =   207
   End
   Begin StaticText StaticText2
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select Files to Process"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   453
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   274
      Visible         =   True
      Width           =   746
   End
   Begin StaticText StaticText3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   244
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "You can also drag and drop files direct to the list below."
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   47
      Underline       =   ""
      Visible         =   True
      Width           =   390
   End
   Begin Separator Separator2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   386
      Visible         =   True
      Width           =   746
   End
   Begin PushButton btnSetDestination
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Set &Destination Folder"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   240
      Underline       =   ""
      Visible         =   True
      Width           =   160
   End
   Begin StaticText DestFolderPath
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   192
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select a destination folder (or drag destination here)"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   241
      Underline       =   ""
      Visible         =   True
      Width           =   574
   End
   Begin PushButton btnRemove
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "&Remove Item(s)"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   646
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   46
      Underline       =   ""
      Visible         =   True
      Width           =   120
   End
   Begin PushButton btnProcess
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "&Process Files"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   402
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btnAddFolder
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Add &Folder"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   46
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btnAddFile
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "&Add File"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   46
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox chkSortRecords
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Sort Records"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      State           =   1
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   354
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu popSortOrder
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Ascending\r\nDescending"
      Italic          =   ""
      Left            =   404
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   354
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin StaticText StaticText4
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
      Left            =   132
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Callout:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   354
      Underline       =   ""
      Visible         =   True
      Width           =   48
   End
   Begin StaticText StaticText5
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
      Left            =   357
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Order:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   354
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
   Begin TextField edtSortTag
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   192
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Multiline       =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   ""
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   245
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   352
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   40
   End
   Begin TextField edtSortIgnoreLeading
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   610
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Mask            =   ""
      Multiline       =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   ""
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "a,an,the"
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   352
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   156
   End
   Begin ComboBox cmbSortSubfield
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "Entire Field\r\n-\r\na\r\nb\r\nc\r\nd\r\ne\r\nf\r\ng\r\nh\r\ni\r\nj"
      Italic          =   ""
      Left            =   244
      ListIndex       =   2
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   352
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   101
   End
   Begin CheckBox chkSortIgnoreLeading
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Ignore Leading:"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   496
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   354
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   102
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddFile(f as FolderItem)
		  dim i as integer
		  
		  if f = nil then
		    return
		  end if
		  
		  if f.directory then
		    ProgressNewMax( f.count )
		    for i = 1 to f.count
		      AddFile f.item(i)
		      ProgressUpdate( f.item(i).name, i )
		    next
		    return
		  end if
		  
		  if sniffMARC(f) then
		    lstFiles.AddRow f.name
		    lstFiles.cellTag( lstFiles.lastIndex, 0 ) = f
		    lstFiles.cell( lstFiles.lastIndex, 1 ) = "OUT_" + f.name
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set_Dest_Folder(f as FolderItem)
		  if f.directory then
		    dest_folder = f
		    DestFolderPath.caption = f.AbsolutePath
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dest_folder As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events lstFiles
	#tag Event
		Sub Open()
		  me.heading(0) = "Input File"
		  me.heading(1) = "Output File"
		  me.AcceptFileDrop("????")
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  dim f as folderItem
		  
		  if me.listindex > -1 then
		    f = me.cellTag(me.listindex, 0)
		    app.OpenDocument(f)
		    
		    f = me.cellTag(me.listindex, 1)
		    if f <> nil then
		      app.OpenDocument(f)
		      
		      ' Line up the two windows
		      window(1).left = self.left + 32
		      window(0).left = window(1).left + window(1).width + 32
		      window(1).top = self.top + 32
		      window(0).top = window(1).top
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  btnRemove.enabled = me.selCount > 0
		  btnProcess.enabled = me.ListCount > 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  ProgressStart( self, "Adding File(s)", 0 )
		  do
		    if obj.FolderItemAvailable then
		      AddFile obj.folderItem
		      ProgressUpdate( obj.folderItem.name, 0 )
		    end if
		  loop until not obj.NextItem
		  ProgressEnd()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetDestination
	#tag Event
		Sub Action()
		  dim f as FolderItem
		  
		  f = SelectFolder()
		  
		  Set_Dest_Folder f
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DestFolderPath
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  if obj.FolderItemAvailable then
		    if obj.folderItem.directory then
		      Set_Dest_Folder obj.folderItem
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AcceptFileDrop("????")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRemove
	#tag Event
		Sub Action()
		  dim i as integer
		  
		  for i = lstFiles.ListCount - 1 downTo 0
		    if lstFiles.Selected(i) then
		      lstFiles.RemoveRow(i)
		    end if
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnProcess
	#tag Event
		Sub Action()
		  dim i as integer
		  dim src, dest as folderItem
		  dim m as MARC_File
		  dim subfield, ignore as string
		  dim sortOrder as integer
		  
		  if dest_folder = nil then
		    MsgBox "You need to select a destination folder first."
		    return
		  end if
		  
		  ProgressStart( self, "Processing Files", lstFiles.ListCount )
		  
		  subfield = cmbSortSubfield.text
		  
		  if subfield.len > 1 then
		    subfield = ""
		  end if
		  
		  if chkSortIgnoreLeading.value then
		    ignore = edtSortIgnoreLeading.text
		  end if
		  
		  if popSortOrder.text = "Ascending" then
		    sortOrder = m.ascending
		  else
		    sortOrder = m.descending
		  end if
		  
		  for i = 0 to lstFiles.ListCount - 1
		    
		    src = lstFiles.cellTag(i, 0)
		    m = new MARC_File( src )
		    
		    ProgressUpdate( m.file.name, i )
		    
		    if chkStripTags.value then
		      m.Remove_Tags( cmbTags.Text )
		    end if
		    
		    if chkSortRecords.value and edtSortTag.text <> "" then
		      m.Sort_Records( edtSortTag.text, sortOrder, subfield, ignore)
		    end if
		    
		    dest = dest_folder.child( lstFiles.cell(i, 1) )
		    lstFiles.cellTag(i, 1) = dest
		    
		    m.Save_To_file(dest)
		  next
		  
		  ProgressEnd()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddFolder
	#tag Event
		Sub Action()
		  dim f as FolderItem
		  
		  f = SelectFolder()
		  
		  ProgressStart( self, "Adding Folder", 0 )
		  
		  AddFile f
		  
		  ProgressEnd()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddFile
	#tag Event
		Sub Action()
		  dim f as folderItem
		  
		  f = GetOpenFolderItem(MARCfiletypes.any)
		  
		  AddFile f
		End Sub
	#tag EndEvent
#tag EndEvents
