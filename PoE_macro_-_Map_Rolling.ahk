#MaxThreadsPerHotkey 1
~*F7::   ;   Map Rolling
IfWinActive, Path of Exile
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_x2:= 0
buf_y:= 0
buf_y2:= 0
x_coord:= 0
x_coord2:= 0
y_coord:= 0
y_coord2:= 0
base_X:= 0
base_Y:= 0

{
Send, {Left}
MouseMove, 430, 510
Sleep, 50
Click, right
Sleep, 150
Send, {Right}
Sleep, 50
SendEvent {LShift down}
Loop
{   
    if GetKeyState("F7", "U") 
    break
    x_coord:= 1300 + buf_x * 53
    y_coord:= 600 + buf_y * 53
    Sleep 3
    MouseMove x_coord, y_coord
    Sleep 5
    Click, left
    Sleep 3
    buf_y:=buf_y+1
    if (buf_y = 5) {
        buf_x:=buf_x+1
        buf_y:=0
        if (buf_x = 12)
        break
        }
}
SendEvent {LShift up}
Send, {Left}
MouseMove, 500, 280
Sleep, 50
Click, right
Sleep, 150
Send, {Right}
Sleep, 50
SendEvent {LShift down}
Loop
{
    if GetKeyState("F7", "U") 
    break
    x_coord2:= 1300 + buf_x2 * 53
    y_coord2:= 600 + buf_y2 * 53
    Sleep 3
    MouseMove x_coord2, y_coord2
    Sleep 5
    Click, left
    Sleep 3
    buf_y2:=buf_y2+1
    if (buf_y2 = 5) {
        buf_x2:=buf_x2+1
        buf_y2:=0
        if (buf_x2 = 12)
        break
        }
}
SendEvent {LShift up}
}
Return