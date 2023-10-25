global PoEWindow
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_KG.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_EGS.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExileEGS.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExileSteam.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64_KG.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64EGS.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExilex64EGS.exe
GroupAdd, PoEWindow, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64Steam.exe

global resoffsetX,resoffsetY,WindowWidth,WindowHeight, ScreenFactor_W, ScreenFactor_H

WinGetClientPos(ByRef X:="", ByRef Y:="", ByRef Width:="", ByRef Height:="", WinTitle:="", WinText:="", ExcludeTitle:="", ExcludeText:="") {
    local hWnd, RECT
    hWnd := WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText)
    VarSetCapacity(RECT, 16, 0)
    DllCall("user32\GetClientRect", Ptr,hWnd, Ptr,&RECT)
    DllCall("user32\ClientToScreen", Ptr,hWnd, Ptr,&RECT)
    X := NumGet(&RECT, 0, "Int"), Y := NumGet(&RECT, 4, "Int")
    Width := NumGet(&RECT, 8, "Int"), Height := NumGet(&RECT, 12, "Int")
}

WinGetClientPos(resoffsetX,resoffsetY,WindowWidth,WindowHeight,"ahk_group PoEWindow")

POE_WindowHeight:= WindowHeight
POE_WindowWidth:= WindowWidth


; General coordinates
ScaleH := POE_WindowHeight / 1080
Screen_Middle:= POE_WindowWidth / 2
Stash_coord_x1:= 15*ScaleH
Stash_coord_y1:= 120*ScaleH
Stash_coord_y2:= 800*ScaleH
Stash_coord_x2:= 650*ScaleH
Inv_x:= % POE_WindowWidth - 630*ScaleH
Inv_y:= % 600*ScaleH
Inventory_x1:= % POE_WindowWidth - 650*ScaleH
Inventory_y1:= % 590*ScaleH
Inventory_x2:= % POE_WindowWidth - 20*ScaleH
Inventory_y2:= % 850*ScaleH
Inv_space:= % 53*ScaleH

; AltSpam-Specific Coordinates

; DivCards-Specific Coordinates
TradeButton_x1:= % Screen_middle - 380*ScaleH
TradeButton_y1:= % 720*ScaleH
TradeButton_x2:= % Screen_Middle - 280*ScaleH
TradeButton_y2:= % 750*ScaleH
ResultWindow_x:= % Screen_Middle - 330*ScaleH
ResultWindow_y:= % POE_WindowHeight / 2

; Harvest-Specific Coordinates
Button_x:= % Screen_Middle
Button_y:= % 600*ScaleH
Window_x:= % Screen_Middle
Window_y:= % 450*ScaleH
Lifeforce_x1:= % Screen_Middle - 200*ScaleH
Lifeforce_y1:= % 330*ScaleH
Lifeforce_x2:= % Screen_Middle - 175*ScaleH
Lifeforce_y2:= % 350*ScaleH

; MapRolling-Specific Coordinates
Scour_x:= % 430*ScaleH
Scour_y:= % 510*ScaleH
Alch_x:= % 500*ScaleH
Alch_y:= % 280*ScaleH

; Remnant-Specific Coordinates
ActiveMap_x1:= % 0 
ActiveMap_y1:= % 170*ScaleH
ActiveMap_x2:= % POE_WindowWidth - 700*ScaleH
ActiveMap_y2:= % 1080*ScaleH
Inventory_check_x:= POE_WindowWidth - 400*ScaleH
Inventory_check_y:= 66*ScaleH

; SextantSpam-Specific Coordinates

; StackedDecks-Specific Coordinates
Drop_x:= 280*ScaleH
Drop_y:= POE_WindowHeight / 2