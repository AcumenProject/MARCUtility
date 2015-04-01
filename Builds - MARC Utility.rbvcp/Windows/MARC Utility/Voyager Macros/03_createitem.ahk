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
sleep 100
send {Alt}rt
sleep 100
send {Enter}
sleep 100
send !n
sleep 100

; Enter the parameter passed
send %1%
sleep 200

; save and close
send ^q
sleep 200
send {ENTER}
sleep 200

clipboard = success

exit