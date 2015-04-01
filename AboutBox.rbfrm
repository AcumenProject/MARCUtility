#tag Window
Begin Window AboutBox
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   2
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   290
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   47314943
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   256
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      UseFocusRing    =   True
      Visible         =   True
      Width           =   256
   End
   Begin StaticText StaticText1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   161
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   288
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Version %1\r\nBuilt: %3\r\n\r\nWritten by Tonio Loewald (taloewald@ua.edu)\r\n\r\nCopyright ©2009%2 University of Alabama"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   71
      Underline       =   ""
      Visible         =   True
      Width           =   292
   End
   Begin PushButton btnOK
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   500
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
      Top             =   250
      Underline       =   ""
      Visible         =   True
      Width           =   80
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
      Left            =   288
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "MARC Utility"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   292
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events StaticText1
	#tag Event
		Sub Open()
		  dim s as string
		  dim d as date
		  
		  d = new date
		  s = me.caption
		  
		  s = replaceall(s, "%1", str(app.MajorVersion) + "." + str(app.MinorVersion) + "." + str(app.BugVersion) )
		  if d.year > 2009 then
		    s = replaceall(s, "%2", "-" + str(d.year))
		  else
		    s = replaceall(s, "%2", "")
		  end if
		  s = replaceall(s, "%3", app.BuildDate.ShortDate + " " + app.BuildDate.ShortTime )
		  
		  me.caption = s
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOK
	#tag Event
		Sub Action()
		  self.close
		End Sub
	#tag EndEvent
#tag EndEvents
