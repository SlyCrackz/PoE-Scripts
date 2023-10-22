#MaxThreadsPerHotkey 1
~*F7::   ;   Map Rolling
IfWinActive, Path of Exile
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
Random, rand, 6, 12
ScaleH := A_screenHeight / 1080
Screen_Middle:= A_screenWidth / 2
Inv_x:= % A_screenwidth - 630*ScaleH
Inv_y:= % 600*ScaleH
Inv_space:= % 53*ScaleH
Stash_coord_x1:= % 15*ScaleH
Stash_coord_y1:= % 120*ScaleH
Stash_coord_y2:= % 800*ScaleH
Stash_coord_x2:= % 650*ScaleH
Scour_x:= % 430*ScaleH
Scour_y:= % 510*ScaleH
Alch_x:= % 500*ScaleH
Alch_y:= % 280*ScaleH
buf_x:= 0
buf_x2:= 0
buf_x3:=0
buf_y:= 0
buf_y2:= 0
buf_y3:=0
x_coord:= 0
x_coord2:= 0
x_coord3:=0
y_coord:= 0
y_coord2:= 0
y_coord3:=0
base_X:= 0
base_Y:= 0
{
SendEvent {LControl down}
Loop
{
    PixelSearch, Px, Py, Stash_coord_x1, Stash_coord_y2, Stash_coord_x2, Stash_coord_y1, 0x77b4e7, 2, Fast
        if (ErrorLevel) {
            Break
        }
    Sleep %rand%
    MouseMove, Px+4, Py-4
    Sleep %rand%
    Click, Up
    Sleep %rand%
}
Send, {Left}
MouseMove, Scour_x, Scour_y
Sleep, 50
Click, right
Sleep, 150
Sleep, 50
SendEvent {LShift down}
Loop
{   
    Clipboard:=
    x_coord:= Inv_x + buf_x * Inv_space
    y_coord:= Inv_y + buf_y * Inv_space
    Sleep %rand%
    MouseMove x_coord, y_coord
    Sleep %rand%
    Send c
    Sleep %rand%
    Click, left
    Sleep %rand%
        if clipboard = 
        break
    Sleep %rand%
    buf_y:=buf_y+1
    if (buf_y = 5) {
        buf_x:=buf_x+1
        buf_y:=0
        if (buf_x = 12)
        break
        }
}
SendEvent {LShift up}
MouseMove, Alch_x, Alch_y
Sleep, 50
Click, right
Sleep, 150
Send, {Right}
Sleep, 50
SendEvent {LShift down}
Loop
{
    Clipboard:=
    x_coord2:= Inv_x + buf_x2 * Inv_space
    y_coord2:= Inv_y + buf_y2 * Inv_space
    Sleep %rand%
    MouseMove x_coord2, y_coord2
    Sleep %rand%
    Send c
    Sleep %rand%
    Click, left
    Sleep %rand%
        if clipboard = 
        break
    Sleep %rand%
    buf_y2:=buf_y2+1
    if (buf_y2 = 5) {
        buf_x2:=buf_x2+1
        buf_y2:=0
        if (buf_x2 = 12)
        break
        }
}
SendEvent {LShift up}
Sleep, 150
Loop
{
    Clipboard:=
    x_coord3:= Inv_x + buf_x3 * Inv_space
    y_coord3:= Inv_y + buf_y3 * Inv_space
    Sleep %rand%
    MouseMove x_coord3, y_coord3
    Sleep %rand%
    Send c
    Sleep %rand%
    Click, left
    Sleep %rand%
        if clipboard = 
        break
    Sleep %rand%
    buf_y3:=buf_y3+1
    if (buf_y3 = 5) {
        buf_x3:=buf_x3+1
        buf_y3:=0
        if (buf_x3 = 12)
        break
        }
}
SendEvent {LControl up}
}
Return