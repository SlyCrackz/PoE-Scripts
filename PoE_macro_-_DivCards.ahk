#Include Config
#Include Coordinates.ahk
#Include Settings.ahk


#MaxThreadsPerHotkey 1
~F7::   ;    Div Cards
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
base_X:= 0
base_Y:= 0
Px1:=0
Py1:=0
Px2:=0
Py2:=0
MouseGetPos, base_X,base_Y
while (getkeystate("F7", "P")) {
    PixelSearch, Px1, Py1, Inventory_x1, Inventory_y1, Inventory_x2, Inventory_y2, 0x8B6400, 0, Fast
    MouseMove %Px1%, %Py1%
    Send, {Control down}
    Click, up
    Send, {Control up}
    Sleep rand_DivCards
    MouseMove A_screenWidth, A_screenHeight
    PixelSearch, Px2, Py2, TradeButton_x1, TradeButton_y1, TradeButton_x2, TradeButton_y2, 0x21430, 20, Fast
        if ErrorLevel   
        {
        MouseMove, base_X,base_Y
        Return
        }
    Sleep rand_DivCards
    Click, %Px2%, %Py2%
    PixelSearch,,, TradeButton_x1, TradeButton_y1, TradeButton_x2, TradeButton_y2, 0x01B1B1B, 20, Fast
        if ErrorLevel   
        {
        MouseMove, base_X,base_Y
        Return
        }
    Send, {Control down}
        Click, left, %ResultWindow_x%, %ResultWindow_y%
    Send, {Control up}
    }
MouseMove, base_X,base_Y
}
Return