#Include Config
#Include Coordinates.ahk
#Include Settings.ahk


#MaxThreadsPerHotkey 1
~F7::
IfWinActive, Path of Exile
ScaleH := A_screenHeight / 1080
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
Random, rand, 10, 15
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
while (getkeystate("F7", "P")) {
    PixelSearch, Px, Py, Inventory_x1, Inventory_y1, Inventory_x2, Inventory_y2, 0x6d768c, 3, Fast
    MouseMove, Px, Py
    Sleep, rand_StackedDecks
    Click, right
    Sleep, rand_StackedDecks
        MouseClick, left, Drop_x, Drop_y
        Sleep, rand_StackedDecks
}
MouseMove, base_X,base_Y
Return