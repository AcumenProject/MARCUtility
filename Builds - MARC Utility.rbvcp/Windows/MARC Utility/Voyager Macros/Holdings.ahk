;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       WinXP and later
; Author:         Tonio Loewald <taloewald@ua.edu>
;
; Script Function:
; Uses Record > Retrieve Holdings to update current holding

clipboard = ‡b gorg ‡h PZ4 ‡i .V2215 Ei

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ===============
; UPDATE HOLDINGS
; ===============

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
; FIRST we need to get 050 from the record

; THEN we need to update the holdings record
sleep 100
send ^r
sleep 100
send {TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{DOWN}{DOWN}
send {ENTER}
; Select everything in the field
send +{HOME}

; Enter the value we were passed
send ^v
sleep 100

; Save and Close
; send ^s
; sleep 100
; send {ALT}fc

clipboard = success

exit