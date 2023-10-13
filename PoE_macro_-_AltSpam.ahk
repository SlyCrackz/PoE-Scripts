#MaxThreadsPerHotkey 2
F7::
IfWinActive, Path of Exile
Clipboard := ""
Sleep, 10
Send, {RShift Down}
Sleep, 10
outer:
	Loop 100
    {
		inner:
		Loop
		{
			Send ^c
			Sleep, 20
			if(Clipboard!=oldclip)
			break inner
		}
		IF Clipboard contains cold
		{
		break outer
		}
		Click, Left, 1
		Sleep, 20
		oldclip:=Clipboard
		if GetKeyState("F7", "P") 
        break outer
    }
Send, {RShift Up}
Sleep, 10
Return

