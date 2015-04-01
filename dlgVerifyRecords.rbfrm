#tag Window
Begin Window dlgVerifyRecords
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   131
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
   Placement       =   0
   Resizeable      =   False
   Title           =   "Verify Records"
   Visible         =   True
   Width           =   400
   Begin StaticText StaticText1
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
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Verify each record in current file:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   360
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
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Contains fields:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Underline       =   ""
      Visible         =   True
      Width           =   120
   End
   Begin TextField fldFieldList
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   "Enter fields separated by commas"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   152
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   024,960,961,949
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   228
   End
   Begin PushButton btnOK
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   300
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
      Top             =   89
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnCancel
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   208
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   89
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer tmrEnable
      Height          =   32
      Index           =   -2147483648
      Left            =   -59
      LockedInPosition=   False
      Mode            =   2
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   79
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		cancelled As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events fldFieldList
	#tag Event
		Sub Open()
		  me.SelectAll
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOK
	#tag Event
		Sub Action()
		  cancelled = false
		  self.hide
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Action()
		  cancelled = true
		  self.hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrEnable
	#tag Event
		Sub Action()
		  btnOK.enabled = fldFieldList.text <> ""
		End Sub
	#tag EndEvent
#tag EndEvents
