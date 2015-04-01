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
; MARK ITEM RECEIVED
; ==================

; Need to check for Voyager Acquisitions too

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

; Bib Record > Record > View Line Item (should jump to Acquisitions)
sleep 1000
send ^m
WinWait Line Item
sleep 1000
; Receive/Mark tab
send !vr{Enter}
sleep 1000
; Go down to the line item and mark it received
send {Down}{Space}
sleep 1000
; Hit "Receive" button
send {Tab 3}{Enter}
sleep 1000

; save and close
send !fa

clipboard = success

exit