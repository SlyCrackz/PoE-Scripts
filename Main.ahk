#Include Config
#Include Coordinates.ahk
#Include Settings.ahk

; Global variable for toggle state
global remapActive := false
global antiAFKActive := false
global timerInterval := 1000 ; Initial interval in milliseconds (1 second)

; Toggle anti-AFK with Ctrl + o
^o::  ; Ctrl + o
{
    antiAFKActive := !antiAFKActive  ; Toggle state
    if (antiAFKActive) {
        SoundBeep, 1000, 200  ; High beep for ON
        SetTimer, PressX, %timerInterval%
    } else {
        SoundBeep, 500, 200   ; Low beep for OFF
        SetTimer, PressX, Off
    }
}
Return


PressX:
    if WinActive("ahk_exe PathOfExile.exe") ; Check if Path of Exile is active
    {
        Send, x  ; Simulate pressing 'X'
    }
    timerInterval := RandomInterval(15000, 45000) ; Random interval between 15 to 45 seconds
    SetTimer, PressX, %timerInterval%
Return


RandomInterval(min, max) {
    Random, rand, %min%, %max%
    return rand
}

; Toggle remapping with Shift + Middle Mouse Button
+MButton::  ; Shift + Middle Mouse Button
{
    remapActive := !remapActive  ; Toggle state
    if (remapActive)
        SoundBeep, 1000, 200  ; High beep for ON
    else
        SoundBeep, 500, 200   ; Low beep for OFF
}
Return

; Function to check if the mouse is over the Path of Exile window
IsPoEWindowUnderMouse() {
    MouseGetPos, , , windowUnderMouse
    WinGetTitle, titleUnderMouse, ahk_id %windowUnderMouse%
    return (titleUnderMouse = "Path of Exile")  ; Adjust if the window title is different
}

#If (remapActive && IsPoEWindowUnderMouse())

    q::LButton
    LButton::q

#If




; ~*NumpadDiv::    ; Bind to Keypad Slash
; IfWinActive, Path of Exile
; {
;     Process, Priority,, High  ; Increase script priority

;     ; Open the inventory
;     SendInput "``"
;     Sleep, 100  ; Initial sleep time to allow for inventory opening

;     ; Define the search area (right side of the screen)
;     searchAreaX1 := A_ScreenWidth * 0.5
;     searchAreaY1 := 0
;     searchAreaX2 := A_ScreenWidth
;     searchAreaY2 := A_ScreenHeight

;     ; Dynamically loop until inventory image is found or max attempts reached
;     inventoryFound := false
;     maxAttempts := 20  ; Max number of attempts to find the inventory
;     attempts := 0

;     while (!inventoryFound and attempts < maxAttempts)
;     {
;         ImageSearch, foundX, foundY, searchAreaX1, searchAreaY1, searchAreaX2, searchAreaY2, *15 InventoryImageDX12.png
;         if (ErrorLevel = 0)
;         {
;             inventoryFound := true
;         }
;         else
;         {
;             attempts++
;         }

;         ; Check for manual exit key
;         if GetKeyState("Ctrl") && GetKeyState("NumpadDiv")
;         {
;             break  ; Exit the loop
;         }
;     }

;     if (inventoryFound)
;     {
;         ; Release the left mouse button if it's being held down
;         if (GetKeyState("LButton", "P"))
;         {
;             Send, {LButton Up}
;             Sleep, 50  ; Short pause to ensure the release is registered
;         }

;         ; Once the inventory is found, click on the portal scroll
;         MouseGetPos, originalX, originalY  ; Save original mouse position

;         ; Define central coordinates of the portal scroll and randomize click within a small area
;         centralPortalX := 1410  ; Central X-coordinate (adjust as needed)
;         centralPortalY := 820   ; Central Y-coordinate (adjust as needed)
;         randomX := centralPortalX + Random(-10, 10)  ; Randomize X within a 20-pixel range
;         randomY := centralPortalY + Random(-10, 10)  ; Randomize Y within a 20-pixel range

;         ; Move the mouse to the randomized portal scroll location and right-click
;         MouseMove, randomX, randomY, 0
;         MouseClick, right
;         MouseMove, originalX, originalY, 0  ; Move back to original position

;         Sleep, 50  ; Brief pause before closing the inventory
;         SendInput "``"  ; Close the inventory
;     }
; }
; Return

; Random(min, max) {
;     Random, rand, %min%, %max%
;     return rand
; }


~*NumpadDiv::    ; Bind to Keypad Slash
IfWinActive, Path of Exile
{
    Process, Priority,, High  ; Increase script priority
    ; Swap to the weapon set with the portal gem
    SendInput {X}
    Sleep, 150  ; Short pause after weapon swap

    ; Hold down the T key for half a second to cast the portal spell
    SendInput {T Down}
    Sleep, 500  ; Hold T for half a second
    SendInput {T Up}

    ; Wait rq before going back
    Sleep 150

    ; Swap back to the original weapon set
    SendInput {X}
    Sleep, 100  ; Short pause after swapping back

    ; Turn on auras bound to A, S, D, F, G
    SendInput {A}
    SendInput {S}
    SendInput {D}
}
Return




macroRunning := false  ; Variable to track the state of the macro

#IfWinActive, Path of Exile
*X::  ; This is the hotkey for X within Path of Exile
{
    if (!macroRunning)  ; Check if the macro is not already running
    {
        macroRunning := true  ; Set the macro as running

        ; Send 'X' or 'Shift+X' based on whether Shift is held down
        if GetKeyState("Shift", "P")
            SendInput, +x  ; Send 'Shift+X'
        else
            SendInput, x  ; Send 'X'

        Sleep 250
        ; Macro actions here
        SendInput {Blind}{A Down}{S Down}{D Down}
        Sleep, 100
        SendInput {Blind}{A Up}{S Up}{D Up}

        macroRunning := false  ; Reset the macro state
    }
    return
}
#IfWinActive



^Space::
IfWinActive, Path of Exile
{

    if (!macroRunning)
    {
        macroRunning := true  ; Set the macro as running

        Sleep 250
        ; Prevents the Space input from being sent to the game
        SendInput {Blind}{A Down}{S Down}{D Down}{F Down}{G Down}
        Sleep, 100  ; You can adjust this duration as needed
        SendInput {Blind}{A Up}{S Up}{D Up}{F Up}{G Up}
        macroRunning := false  ; Reset the macro state

    }
}
Return






~*NumpadMult:: 
Send {Enter}
Send /remaining
Send {Enter}
return

; Bind F1 to /hideout
~*F1:: 
Send {Enter}
Send /hideout
Send {Enter}
return


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