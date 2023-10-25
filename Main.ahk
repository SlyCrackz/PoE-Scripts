#Include Config
#Include Coordinates.ahk
#Include Settings.ahk

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
    x_coord:= base_X + buf_x * Inv_space
    y_coord:= base_Y + buf_y * Inv_space
    Sleep rand_Main / 3
    MouseMove x_coord, y_coord
    Sleep rand_Main
    Click, up
    Sleep rand_Main / 3
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
    x_coord:= base_X + buf_x * Inv_space
    y_coord:= base_Y + buf_y * Inv_space
    Sleep rand_Main / 3
    MouseMove x_coord, y_coord
    Sleep rand_Main
    Click, up
    Sleep rand_Main / 3
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
    x_coord:= base_X + buf_x * Inv_space / 2
    y_coord:= base_Y + buf_y * Inv_space / 2
    SendEvent {Control down}
    Sleep rand_Main / 3
    MouseMove x_coord, y_coord
    Sleep rand_Main
    Click, up
    Sleep rand_Main / 3
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
    PixelSearch, Px, Py, Stash_coord_x1, Stash_coord_y2, Stash_coord_x2, Stash_coord_y1, 0x77b4e7, 2, Fast
    if (ErrorLevel) {
        Break
    }
    Sleep rand_Main / 3
    MouseMove, Px+4, Py-4
    Sleep rand_Main
    Click, Up
    Sleep rand_Main / 3
}
Sleep 30
SendInput {LControl up}
SendInput {LShift up}
MouseMove, base_X,base_Y
BlockInput Off
}
Return


#MaxThreadsPerHotkey 2
^XButton1::   ;    Spam LMB
IfWinActive, Path of Exile
{
while (getkeystate("XButton1", "P"))
{
    click, up
    Sleep 10
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
    Sleep 50
}
}
Return