#MaxThreadsPerHotkey 1
~F7::
IfWinActive, Path of Exile
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
while (getkeystate("F7", "P")) {
    PixelSearch, Px, Py, 1273, 592, 1897, 842, 0x6d768c, 2, Fast
    MouseMove, Px, Py
    Sleep, 20
    Click, right
    Sleep, 50
        MouseClick, left, 935, 389
        Sleep, 50
}
MouseMove, base_X,base_Y
Return