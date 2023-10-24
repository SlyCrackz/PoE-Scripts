#Include Config
#Include Coordinates.ahk
#Include Settings.ahk


#MaxThreadsPerHotkey 1
~Sc029::   ;    Remnant of Corruption
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
REx = base_X
REy = base_Y
ESx = base_X
ESy = base_Y
MouseMove, A_ScreenWidth,A_ScreenHeight
Send, {i}
sleep, 100
loop
{
PixelGetColor, color1, Inventory_check_x, Inventory_check_y
    if (A_Index > 50)
        return
    If (color1=0x66A6CC)
        PixelSearch, REx, REy, Inventory_x1, Inventory_y1, Inventory_x2, Inventory_y2, 0x110DB9, 3, fast
        if ErrorLevel   
            {
            Send, {i}
            MouseMove, base_X,base_Y
            Return
            }
        PixelSearch, ESx, ESy, ActiveMap_x1, ActiveMap_y1, ActiveMap_x2, ActiveMap_y2, 0xFE8787, 0, fast
        if ErrorLevel   
            {
            Send, {i}
            MouseMove, base_X,base_Y
            Return
            }
        Click, %REx% %REy% right
        Sleep, 100
        Click, %ESx% %ESy% left
        break
    sleep, 100
}
Send, {i}
MouseMove, base_X,base_Y
}
Return