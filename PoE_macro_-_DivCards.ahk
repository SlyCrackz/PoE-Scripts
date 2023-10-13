#MaxThreadsPerHotkey 1
~F7::   ;    Div Cards
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 30
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
while (getkeystate("F7", "P")) {
    PixelSearch, Px, Py, 1270, 590, 1908, 850, 0x8B6400, 2, Fast
    MouseMove Px, Py
    Send, {Control down}
    Click, up
    Send, {Control up}
        Sleep 10
        MouseMove 632, 727
            Loop
            {
                PixelGetColor, color1, 498, 643
                    if (A_Index > 50)
                        return
                    If (color1=0x23211E)
                        break
                    Sleep 10
            }
        Sleep 10
        Click, left
            Loop
                {
                   PixelGetColor, color2, 619, 741
                    If (color2=0x063A84)
                        break
                    Sleep 10
                }
            Send, {Control down}
               Click, left, 629, 578
            Send, {Control up}
    }
MouseMove, base_X,base_Y
}
Return