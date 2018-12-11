OnMessage(0x201, "WM_LBUTTONDOWN")
OnMessage(0x84, "WM_NCHITTEST")
OnMessage(0x83, "WM_NCCALCSIZE")
OnMessage(0x86, "WM_NCACTIVATE")
Gui, -Caption +Resize
Gui, Add, Text, Border vBorder
Gui, Show, W100 H100
; Gui,Show sizes the GUI incorrectly, since it assumes there is a non-client area.
Gui, +LastFound
WinMove,,,,, 100, 100
; Alternatively, you can position, size, and show it all at once:
;   DllCall("SetWindowPos","uint",WinExist(),"uint",0
;       ,"int",A_ScreenWidth/2-50,"int",A_ScreenHeight/2-50,"int",100,"int",100
;       ,"uint",0x40)
return

GuiSize:
    GuiControl, Move, Border, X0 Y0 W%A_GuiWidth% H%A_GuiHeight%
return

; Allow moving the GUI by dragging any point in its client area.
WM_LBUTTONDOWN()
{
    if A_Gui
{
        PostMessage, 0xA1, 2 ; WM_NCLBUTTONDOWN
}
}

; Sizes the client area to fill the entire window.
WM_NCCALCSIZE()
{
    if A_Gui
        return 0
}

; Prevents a border from being drawn when the window is activated.
WM_NCACTIVATE()
{
    if A_Gui
        return 1
}

; Redefine where the sizing borders are.  This is necessary since
; returning 0 for WM_NCCALCSIZE effectively gives borders zero size.
WM_NCHITTEST(wParam, lParam)
{
    static border_size = 6
    
    if !A_Gui
        return
    
    WinGetPos, gX, gY, gW, gH
    
    x := lParam<<48>>48, y := lParam<<32>>48
    
    hit_left    := x <  gX+border_size
    hit_right   := x >= gX+gW-border_size
    hit_top     := y <  gY+border_size
    hit_bottom  := y >= gY+gH-border_size
    
    if hit_top
    {
        if hit_left
            return 0xD
        else if hit_right
            return 0xE
        else
            return 0xC
    }
    else if hit_bottom
    {
        if hit_left
            return 0x10
        else if hit_right
            return 0x11
        else
            return 0xF
    }
    else if hit_left
        return 0xA
    else if hit_right
        return 0xB
    
    ; else let default hit-testing be done
}

GuiClose:
ExitApp