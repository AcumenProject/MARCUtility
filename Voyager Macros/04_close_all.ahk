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

; Close all open windows
sleep 1000
send {Alt}fo
sleep 500

clipboard = success
exit