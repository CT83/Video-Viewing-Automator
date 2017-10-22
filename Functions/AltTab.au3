#RequireAdmin
HotKeySet("{PAUSE}", "TogglePause")
Global $Paused
Global $i=1
Switch_Windows()
Func TogglePause()
	ToolTip("Script Paused!")
	$Paused = NOT $Paused
    While $Paused
	    ToolTip('',0,0,"Script Paused",1)
	    ToolTip('',0,0,"Script Paused",1)
		sleep(2000)
    WEnd

EndFunc


Func Switch_Windows()
while $i=1
ToolTip("Switching to next Window",0,0)
Send("{ALTDOWN}")
Send("{TAB}")
Sleep(1000)
Send("{TAB}")
Send("{ALTUP}")
Sleep(5000)
WEnd
EndFunc