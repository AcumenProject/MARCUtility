;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       WinXP and later
; Author:         Tonio Loewald <taloewald@ua.edu>
;
; Script Function:
;	Demonstrate that we can launch Voyager's Catalog.exe and log in
;  This version requires parameters (username and password)

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ======
; LAUNCH
; ======

IfWinExist Voyager Cataloging
{
	WinActivate
}
else
{
	Run c:\Voyager\Catalog.exe
	WinActivate
	WinWait Voyager Cataloging
	sleep 5000
	send %1%{TAB}%2%{ENTER}
	sleep 500
	send {ENTER}
}
clipboard = success
exit
