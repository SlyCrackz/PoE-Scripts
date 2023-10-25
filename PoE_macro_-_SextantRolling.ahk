#Include Config
#Include Coordinates.ahk
#Include Settings.ahk


F7::
IfWinActive, Path of Exile
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_y:= 0

Loop 9
{
MouseMove, Sextant_x, Sextant_y
Sleep, rand_SextantRolling
Click, Right
Sleep, rand_SextantRolling
MouseMove, Voidstone_x, Voidstone_y
Sleep, rand_SextantRolling
SendEvent, {LShift Down}
Sleep, rand_SextantRolling
outer:
	Loop
    {
		inner:
		Loop 50
		{
			Send ^c
			Sleep, 10
			if(Clipboard!=oldclip)
			break inner
		}
		If RegExMatch(Clipboard, Regex_SextantRolling)
		{
		SendEvent, {LShift Up}
			MouseMove, Compass_x, Compass_y
			Sleep, rand_SextantRolling
			Click, right
			Sleep, rand_SextantRolling
			MouseMove, Voidstone_x, Voidstone_y
			Sleep, rand_SextantRolling
			Click, left
			Sleep, rand_SextantRolling
			MouseMove, Inv_x + buf_x * Inv_space, Inv_y + buf_y * Inv_space
    		Sleep, 2 * rand_SextantRolling
    		Click, left
    		Sleep rand_SextantRolling
    		buf_y:=buf_y+1
    		if (buf_y = 5) {
        		buf_x:=buf_x+1
        		buf_y:=0
        		if (buf_x = 12) {
        		buf_x:=0
        		Break outer
        		}	
    		}
    		Sleep, rand_SextantRolling
    		MouseMove, Sextant_x, Sextant_y
    		Sleep, rand_SextantRolling
			Click, Right
			Sleep, rand_SextantRolling
			MouseMove, Voidstone_x, Voidstone_y
		}
		SendEvent, {LShift Down}
		Sleep, rand_SextantRolling
		Click, left
		Sleep, rand_SextantRolling
		oldclip:=Clipboard
    }
		SendEvent, {Control Down}
		Sleep, rand_SextantRolling
		Send, {Right}
		Sleep, rand_SextantRolling

		Loop
		{
		    x_coord2:= inv_X + buf_x * Inv_space
		    y_coord2:= inv_Y + buf_y * Inv_space
		    Sleep rand_Main
		    MouseMove x_coord2, y_coord2
		    Sleep rand_Main
		    Click, up
		    Sleep rand_Main
		    buf_y:=buf_y+1
		    if (buf_y = 5) 
		    {
		        buf_x:=buf_x+1
		        buf_y:=0
		        if (buf_x = 12) 
		        {
		        buf_x:=0
		        Break
		        }
    		}
		}
		SendEvent, {Control Down}
		Sleep, rand_SextantRolling
		Send, {Left}
		Sleep, rand_SextantRolling
		SendEvent, {Control Up}					
}
SendEvent, {LShift Up}
Sleep, rand_SextantRolling
MouseMove, % 860*scaleW, % 780*scaleH , 0
Sleep, rand_SextantRolling
Return

~*F5::ExitApp