;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       WinXP and later
; Author:         Tonio Loewald <taloewald@ua.edu>
;
; Script Function:
; Uses Record > Retrieve Holdings to update current holding
; We need to pass the appropriate entry as the argument, e.g. ‡b gorg ‡h PZ4 ‡i .V2215 Ei

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ==================
; CREATE ITEM RECORD
; ==================
IfWinExist Voyager Cataloging
{
	WinActivate
}
else
{
	msgbox Macro failed: Voyager Cataloging is not running.
	clipboard = failed
	exit
}

; Select Barcode Field
sleep 1000
send {Alt}rt
sleep 1000
send {Enter}
sleep 1000
send !n
sleep 1000

; Enter the parameter passed
send %1%
sleep 1000

; save and close
send ^q
sleep 1000
send {ENTER}
sleep 2000

clipboard = success

exit