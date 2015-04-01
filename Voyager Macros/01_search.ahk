;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       WinXP and later
; Author:         Tonio Loewald <taloewald@ua.edu>
;
; Script Function:
; Uses Record > Search and navigates dialog to find a specific record

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ===========
; FIND RECORD
; ===========

IfWinExist Voyager Cataloging
{
	WinActivate
}
else
{
	msgbox Macro failed: "Voyager Cataloging" could not be found (not running?).
	clipboard = failed
	exit
}

sleep 100
send {Alt}RS
WinWait Search
; Enter parameter 1, the value we're searching for
send %1%

sleep 100
; Select the correct field
Click 180, 140
; Select "System Number (035a)"
send {Home}{Down 8}{Enter}
; Perform the Search
send {Enter}
sleep 500

clipboard = success
exit