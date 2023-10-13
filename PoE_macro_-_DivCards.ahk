#MaxThreadsPerHotkey 1
~F7::   ;    Div Cards
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
ScaleH := A_screenHeight / 1080
Screen_Middle:= A_screenWidth / 2
Inventory_x1:= % A_screenWidth - 650*ScaleH
Inventory_y1:= % 590*ScaleH
Inventory_x2:= % A_screenWidth - 20*ScaleH
Inventory_y2:= % 850*ScaleH
TradeButton_x1:= % Screen_middle - 380*ScaleH
TradeButton_y1:= % 720*ScaleH
TradeButton_x2:= % Screen_Middle - 280*ScaleH
TradeButton_y2:= % 750*ScaleH
ResultWindow_x:= % Screen_Middle - 330*ScaleH
ResultWindow_y:= % A_screenHeight / 2
base_X:= 0
base_Y:= 0
Px1:=base_X
Py1:=base_Y
Px2:=base_X
Py2:=base_Y
MouseGetPos, base_X,base_Y
while (getkeystate("F7", "P")) {
    PixelSearch, Px1, Py1, Inventory_x1, Inventory_y1, Inventory_x2, Inventory_y2, 0x8B6400, 2, Fast
    MouseMove %Px1%, %Py1%
    Send, {Control down}
    Click, up
    Send, {Control up}
    Sleep 10
    MouseMove A_screenWidth, A_screenHeight
    PixelSearch, Px2, Py2, TradeButton_x1, TradeButton_y1, TradeButton_x2, TradeButton_y2, 0x21430, 20, Fast
        if ErrorLevel   
        {
        MouseMove, base_X,base_Y
        Return
        }
    Sleep 10
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