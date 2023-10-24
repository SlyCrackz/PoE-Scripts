#MaxThreadsPerHotkey 1
~F7::
IfWinActive, Path of Exile
ScaleH := A_screenHeight / 1080
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
Random, rand, 10, 15
Inventory_x1:= % A_screenWidth - 650*ScaleH
Inventory_y1:= % 590*ScaleH
Inventory_x2:= % A_screenWidth - 20*ScaleH
Inventory_y2:= % 850*ScaleH
Drop_x:= 280*ScaleH
Drop_y:= A_screenHeight / 2
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
while (getkeystate("F7", "P")) {
    PixelSearch, Px, Py, Inventory_x1, Inventory_y1, Inventory_x2, Inventory_y2, 0x6d768c, 3, Fast
    MouseMove, Px, Py
    Sleep, %rand%
    Click, right
    Sleep, %rand%
        MouseClick, left, Drop_x, Drop_y
        Sleep, %rand%
}
MouseMove, base_X,base_Y
Return