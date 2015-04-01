#tag Menu
Begin Menu MARC_Menu
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileOpen
         SpecialMenu = 0
         Text = "Open..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileSave
         SpecialMenu = 0
         Text = "Save"
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileSaveAs
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+Shift+S"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileClose
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileDefaultEncoding
         SpecialMenu = 0
         Text = "Default Encoding"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem DefaultEncodingUTF
            SpecialMenu = 0
            Text = "UTF"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
         End
         Begin MenuItem DefaultEncodingISO
            SpecialMenu = 0
            Text = "ISO"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
         End
         Begin MenuItem DefaultEncodingDOS
            SpecialMenu = 0
            Text = "DOS"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
         End
         Begin MenuItem DefaultEncodingWindows
            SpecialMenu = 0
            Text = "Windows"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
         End
         Begin MenuItem DefaultEncodingMac
            SpecialMenu = 0
            Text = "Mac"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
         End
      End
      Begin MenuItem UntitledSeparator3
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileViewVoyagerRecord
         SpecialMenu = 0
         Text = "View Voyager Record"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileNewBatchJob
         SpecialMenu = 0
         Text = "New Batch Job"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSortByCallout
         SpecialMenu = 0
         Text = "Sort by Callout..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin PrefsMenuItem EditPreferences
         SpecialMenu = 0
         Text = "Preferences..."
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem Verify
      SpecialMenu = 0
      Text = "Verify"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem VerifyFieldValuesMatch
         SpecialMenu = 0
         Text = "Field Values Match..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem VerifyEachRecord
         SpecialMenu = 0
         Text = "Each Record Has Fields..."
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem Automation
      SpecialMenu = 0
      Text = "Automation"
      Index = -2147483648
      AutoEnable = True
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "Help"
      Index = -2147483648
      AutoEnable = True
      Begin AppleMenuItem HelpAbout
         SpecialMenu = 0
         Text = "About"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
