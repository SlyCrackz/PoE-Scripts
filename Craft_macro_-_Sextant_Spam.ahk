#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1



F3::
Macro1:
IfWinActive, Path of Exile
scaleW := A_screenwidth / 3840
scaleH := A_screenHeight / 2160
buf_x:= 0
buf_y:= 0

Loop 9
{
MouseMove, % 860*scaleW, % 780*scaleH , 0    			    ; Move mouse to the sextant
Sleep, 50
Click, Right, 1  											; Right click on the sextant
Sleep, 50
MouseMove, % 2060*scaleW, % 1520*scaleH , 0					; Move the mouse to the voidstone
Sleep, 50
Send, {LShift Down}
Sleep, 50
outer:
	Loop
    {
		inner:
		Loop 50
		{ 													; Check the sextant mod
			Send ^c
			Sleep, 30 ;50
			if(Clipboard!=oldclip)
			break inner
		}
		IF Clipboard contains Delirium, mirror of, 100, Allu, Alva, Beyond, Chayula, Gilded, Grove, Harbi, Hunted, Jun, Legion, are Corrupted, enrage
		{
		Send, {LShift Up}
			MouseMove, % 300*scaleW, % 1200*scaleH , 0		; Move mouse to the compass
			Sleep, 100
			Click, right, 1 								; Pick the compass
			Sleep, 100
			MouseMove, % 2060*scaleW, % 1520*scaleH , 0		; Move mouse to the voidstone
			Sleep, 100
			Click, left, 1 									; Seal the compass
			Sleep, 100
			MouseMove, 1300 + buf_x * 53, 600 + buf_y * 53 	; Move mouse to the inventory slot
    		Sleep 100
    		Click, up 										; Put sextant in the inventory
    		Sleep 50
    		buf_y:=buf_y+1
    		if (buf_y = 5) {
        		buf_x:=buf_x+1
        		buf_y:=0
        		if (buf_x = 12) {
        		buf_x:=0
        		Break
        		}	
    		}
    		MouseMove, % 860*scaleW, % 780*scaleH , 0 		; Move mouse to the sextant
    		Sleep, 100
			Click, Right, 1  								; Right click on the sextant
			Sleep, 100
			MouseMove, % 2060*scaleW, % 1520*scaleH , 0		; Move mouse to the voidstone
		}
		Send, {LShift Down}
		Sleep, 100 ;100
		Click, left, 1 										; Apply sextant to the voidstone
		Sleep, 100 ;100
		oldclip:=Clipboard
		if GetKeyState("F6", "P") 
        break outer
    }

				Send, {Control Down}
				Sleep, 30
				Send, {Right}
				Sleep, 75
				Send, {Control Up}
				Sleep, 50
				
				{
					MouseGetPos, newx, newy
					Send, {LControl Down}
					Sleep, 7
					MouseMove,% 2610*scaleW, % 1228*scaleH, 0
					Sleep, 30
					Click, Left, 1
					Sleep, 7
						Loop, 4
							{
							MouseMove,% 0*scaleW, % 100*scaleH, 0, R
							Sleep, 30
							Click, Left, 1
							Sleep, 10
							}
						MouseMove,% 100*scaleW, % -400*scaleH, 0, R
						Sleep, 30
						Click, Left, 1
						Sleep, 10
					Loop, 11
					{
						Loop, 4
						{
						MouseMove,% 0*scaleW, % 100*scaleH, 0, R
						Sleep, 30
						Click, Left, 1
						Sleep, 10
						if GetKeyState("F10", "P") 
						break
						}
						MouseMove,% 100*scaleW, % -400*scaleH, 0, R
						Sleep, 30
						Click, Left, 1
						Sleep, 10
						

					}
					Send, {LControl Up}
					Sleep, 30
					WinActivate, Path of Exile
					Sleep, 50
					WinWaitActive, Path of Exile
					Sleep, 50
					Mousemove,% 2610*scaleW, % 1228*scaleH, 0
					Sleep, 50
					Send, {Control Down}
					Sleep, 30
					Send, {Left}
					Sleep, 75
					Send, {Control Up}					
				}	
}
Send, {LShift Up}
Sleep, 10
MouseMove, % 860*scaleW, % 780*scaleH , 0
Sleep, 10
Return

~*F5::ExitApp


