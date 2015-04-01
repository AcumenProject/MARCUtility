#tag Window
Begin Window dlgVerifyFieldValuesMatch
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   2
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   218
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Verify Field Values Match"
   Visible         =   False
   Width           =   600
   Begin PopupMenu popCallouts
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   20
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   70
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin TextField edtValue
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   356
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   68
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   220
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
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Callout"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu popCriterion
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "matches\r\ncontains"
      Italic          =   ""
      Left            =   244
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   70
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin StaticText StaticText2
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
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Verify that for each record in this file:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   556
   End
   Begin StaticText StaticText4
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Records found to be missing the [sub]field will be marked in RED, those with incorrect values will be marked in YELLOW, verified records will be marked in GREEN."
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   102
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   556
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Verify Fields"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   480
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   176
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   388
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   176
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox chkFixBadValues
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Set the field to this value if it does not match (use with caution!)"
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
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   144
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   449
   End
   Begin PopupMenu popSubfields
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Entire Field"
      Italic          =   ""
      Left            =   132
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   70
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin StaticText StaticText5
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
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Subfield"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin StaticText StaticText6
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
      Left            =   244
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      Text            =   "Criterion"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin StaticText StaticText7
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
      Left            =   356
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      Text            =   "Value"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   44
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   220
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub SetDefaultValue()
		  dim subfield as string
		  
		  if popCallouts.listindex = -1 then
		    edtValue.text = ""
		  else
		    subfield = popSubfields.text
		    if subfield = "Entire Field" then
		      subfield = ""
		    end if
		    edtValue.text = record.get_field(popCallouts.listindex, subfield)
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cancelled As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		record As MARC_Record
	#tag EndProperty


#tag EndWindowCode

#tag Events popCallouts
	#tag Event
		Sub Change()
		  dim i as integer
		  
		  if me.listindex > -1 then
		    popSubfields.DeleteAllRows
		    popSubfields.AddRow "Entire Field"
		    popSubfields.listindex = 0
		    for i = 1 to record.get_subfield_count(me.listindex)
		      popSubfields.addRow record.get_subfield_id(me.listindex, i)
		    next
		  end if
		  
		  SetDefaultValue
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popCriterion
	#tag Event
		Sub Change()
		  if me.text = "matches" then
		    chkFixBadValues.enabled = true
		  else
		    chkFixBadValues.enabled = false
		    chkFixBadValues.value = false
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  self.hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  cancelled = true
		  self.hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popSubfields
	#tag Event
		Sub Change()
		  SetDefaultValue
		End Sub
	#tag EndEvent
#tag EndEvents
