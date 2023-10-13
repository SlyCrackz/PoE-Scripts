~*F2::   ;  Inventory
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
SendEvent {Control down}
while (getkeystate("F2", "P")) {
    x_coord:= base_X + buf_x * 53
    y_coord:= base_Y + buf_y * 53
    Sleep 6
    MouseMove x_coord, y_coord
    Sleep 10
    Click, up
    Sleep 5
    buf_y:=buf_y+1
    if (buf_y = 5) {
        buf_x:=buf_x+1
        buf_y:=0
        if (buf_x = 12) {
        buf_x:=0
        Break
        }
    }
}
SendEvent {Control up}
MouseMove, base_X,base_Y
buf_x:= 0
buf_y:= 0
}
Return


~*F3::  ;   Stash
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
SendEvent {Control down}
while (getkeystate("F3", "P")) {
    x_coord:= base_X + buf_x * 53
    y_coord:= base_Y + buf_y * 53
    Sleep 6
    MouseMove x_coord, y_coord
    Sleep 10
    Click, up
    Sleep 5
    buf_y:=buf_y+1
    if (buf_y = 12) {
        buf_x:=buf_x+1
        buf_y:=0
    }
}
SendEvent {Control up}
MouseMove, base_X,base_Y
}
Return


~*F4::  ;   Quad Stash
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
while (getkeystate("F4", "P")) {
    x_coord:= base_X + buf_x*26,5
    y_coord:= base_Y + buf_y*26,5
    SendEvent {Control down}
    Sleep 6
    MouseMove x_coord, y_coord
    Sleep 10
    Click, up
    Sleep 5
    SendEvent {Control up}
    buf_y:=buf_y+1
    while (buf_y = 24) {
        buf_x:=buf_x+1
        buf_y:=0
    }
}
MouseMove, base_X,base_Y
}
Return


~*F5::  ;   Take from regex
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
MouseGetPos, base_X,base_Y
BlockInput On
SendInput {LControl down}
while (getkeystate("F5", "P")) {
    PixelSearch, Px, Py, 15, 120, 650, 800, 0x77b4e7, 2, Fast
    if (ErrorLevel) {
        Break
    }
    Sleep 3
    MouseMove, Px+4, Py+4
    Sleep 10
    Click, Up
    Sleep 3
}
Sleep 30
SendInput {LControl up}
SendInput {LShift up}
MouseMove, base_X,base_Y
BlockInput Off
}
Return


#MaxThreadsPerHotkey 1
~F6::   ;    Div Cards
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
while (getkeystate("F6", "P")) {
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
MouseMove, 960,540
Send, {i}
sleep, 100
loop
{
PixelGetColor, color1, 1520, 66
    if (A_Index > 50)
        return
    If (color1=0x66A6CC)
        PixelSearch, REx, REy, 1270, 590, 1908, 850, 0x110DB9, 3, fast
        if ErrorLevel   
            {
            Send, {i}
            Return
            }
        PixelSearch, ESx, ESy, 0, 200, 1200, 1000, 0xFE8787, 0, fast
        if ErrorLevel   
            {
            Send, {i}
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


#MaxThreadsPerHotkey 2
^XButton1::   ;    Spam LMB
IfWinActive, Path of Exile
{
while (getkeystate("XButton1", "P"))
{
    click, up
    Sleep 30
}
}
Return

#MaxThreadsPerHotkey 2
+XButton1::   ;    Spam LMB
IfWinActive, Path of Exile
{
while (getkeystate("XButton1", "P"))
{
    click, up
    Sleep 30
}
}
Return