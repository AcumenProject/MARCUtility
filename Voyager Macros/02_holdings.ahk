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

; We need to update the holdings record
sleep 1000
send ^r
sleep 1000

; MANUALLY --- assumes we've been passed 50|0|0|a as argument 1 and 50|0|0|b as argument 2
;send {TAB}{TAB}{TAB}{TAB}{RIGHT}{RIGHT}{RIGHT}
;send {ENTER}
;send {F9}h
;send %1%
;send {f9}i
;send %2%
;send {ENTER}

; Use values already in Voyager
send ^n
sleep 1000

; Detect dialog and hit YES if present
IfWinExist,Voyager Cataloging,holding record already
{
	send {ENTER}
	sleep 1000
}

; Save to Database and Close
send ^q
sleep 1000
send {ENTER}
sleep 2000

clipboard = success

exit