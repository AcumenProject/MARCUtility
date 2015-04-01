#tag Window
Begin Window dlgProgress
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   2
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.18e+2
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
   Title           =   "Progress"
   Visible         =   False
   Width           =   3.92e+2
   Begin ProgressBar bar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   46
      Value           =   0
      Visible         =   True
      Width           =   260
   End
   Begin StaticText txtTask
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
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   260
   End
   Begin StaticText txtActivity
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
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   260
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
      Left            =   292
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   44
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		cancelled As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events btnCancel
	#tag Event
		Sub Action()
		  cancelled = true
		  me.enabled = false
		End Sub
	#tag EndEvent
#tag EndEvents
