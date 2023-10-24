#Include Config
#Include Coordinates.ahk
#Include Settings.ahk


#MaxThreadsPerHotkey 1
F7::
IfWinActive, Path of Exile				; Нужные эссенции/скарабы/орбы/фоссили дописывать в 68 строку через запятую без пробела	
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
SendEvent {Control down}
Loop 60
{
	Clipboard:=
	x_coord:= Inv_x + buf_x * Inv_space
    y_coord:= Inv_y + buf_y * Inv_space
	MouseMove, x_coord, y_coord
	Sleep, rand_Harvest
	Send ^c
	Sleep, rand_Harvest
		If !Clipboard
		{
		SendEvent {ControlUp}
		return
		}
	Click, left
	Sleep, rand_Harvest
	MouseMove, %Button_x%, %Button_y%
	Sleep, rand_Harvest
	Click, left
	sleep, rand_Harvest
	outer:
		Loop 50
			{
			PixelSearch,,, Lifeforce_x1, Lifeforce_y1, Lifeforce_x2, Lifeforce_y2, 0xFEDCDE, 130, Fast
				if ErrorLevel   
            	{
            	SendEvent {Control up}
            	Return
            	}
			MouseMove, %Window_x%, %Window_y%
			oldclip:=Clipboard																							
			Sleep, rand_Harvest
			inner:
				Loop 500 	
				{
					Send ^c
					Sleep, rand_Harvest
					if(Clipboard!=oldclip)
					break inner
				}
				Send ^c
				Sleep, rand_Harvest
			    IF Clipboard contains Woe,Contempt,Hatred,Of Anger,Wrath,Rage,Sorrow,Spite,Loathing,Zeal,Scorn,Of Torment,Envy,Horror,Divination,Ambush,Harbinger,Reliquary,Fine,Skittering,Diviner
			    Break outer
			    MouseMove, %Button_x%, %Button_y%
				Sleep, rand_Harvest
				Click, left
			    sleep, rand_Harvest
			}
	MouseMove, %Window_x%, %Window_y%
	Sleep, rand_Harvest
	Click, left
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
}
SendEvent {Control up}
Return