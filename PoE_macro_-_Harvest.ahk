#MaxThreadsPerHotkey 1
F7::
IfWinActive, Path of Exile																					; Нужные эссенции/скарабы/орбы/фоссили дописывать в 68 строку через запятую без пробела	
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
Random, rand, 6, 12																							; Случайная задержка в несколько милисекунд, если скрипт тупит ее надо увеличить
ScaleH := A_screenHeight / 1080
Screen_Middle:= A_screenWidth / 2
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
Button_x:= % Screen_Middle																					; X-координата кнопки свапа
Button_y:= % 600*ScaleH																						; Y-координата кнопки свапа
Window_x:= % Screen_Middle																					; X-координата окна предмета в харвесте
Window_y:= % 450*ScaleH																						; Y-координата окна предмета в харвесте
Inv_x:= % A_screenwidth - 630*ScaleH																		; X-координата инвентаря
Inv_y:= % 600*ScaleH																						; Y-координата инвентаря	
Inv_space:= % 53*ScaleH																						; Размер ячейки инвентаря в пикселях
Lifeforce_x1:= % Screen_Middle - 200*ScaleH																	; Координаты надписи количества лайффорса
Lifeforce_y1:= % 330*ScaleH																						
Lifeforce_x2:= % Screen_Middle - 175*ScaleH																									
Lifeforce_y2:= % 350*ScaleH																										
SendEvent {Control down}
Loop 60
{
	Clipboard:=
	x_coord:= Inv_x + buf_x * Inv_space
    y_coord:= Inv_y + buf_y * Inv_space
	MouseMove, x_coord, y_coord
	Sleep, %rand%
	Send ^c 																								; Сохраняет название эссенции
	Sleep, %rand%
		If !Clipboard																						; Если навелось на пустую клетку то скрипт останавливается
		{
		SendEvent {ControlUp}
		return
		}
	Click, left																								; Перемещает эссенцию в станок
	Sleep, %rand%
	MouseMove, %Button_x%, %Button_y%
	Sleep, %rand%
	Click, left																								; Свапает эссенцию
	sleep, %rand%
	outer:
		Loop 50
			{
			PixelSearch,,, Lifeforce_x1, Lifeforce_y1, Lifeforce_x2, Lifeforce_y2, 0xFEDCDE, 130, Fast		; Проверяет есть-ли лайффорс
				if ErrorLevel   
            	{
            	SendEvent {Control up}
            	Return
            	}
			MouseMove, %Window_x%, %Window_y%																; Перемещает курсор к свапнутой эссенции
			oldclip:=Clipboard																							
			Sleep, %rand%
			inner:
				Loop 500 	
				{																							; Ждет пока эссенция на станке поменяется
					Send ^c
					Sleep, %rand%
					if(Clipboard!=oldclip)
					break inner
				}
				Send ^c 																					; Проверяет измененную эссенцию
				Sleep, %rand%
			    IF Clipboard contains Contempt,Hatred,Of Anger,Rage,Sorrow,Greed,Woe,Wrath,Loathing,Zeal,Spite,Scorn,Of Torment,Envy,Horror,Divination,Ambush,Harbinger,Reliquary,Fine,Skittering,Diviner
			    Break outer
			    MouseMove, %Button_x%, %Button_y%
				Sleep, %rand%
				Click, left			 																		; Если эссенция изменилась на хуевую, снова меняет ее
			    sleep, %rand%
			}
	MouseMove, %Window_x%, %Window_y%
	Sleep, %rand%
	Click, left 																							; Если эссенция изменилась на хорошую, забирает ее
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