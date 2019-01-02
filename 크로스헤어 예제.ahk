#Singleinstance force
#NoEnv
#Include Gdip.ahk

detectHiddenWindows, On
gui +hwndgHwnd
gui,show,hide w1 h1
winset,transparent,1,ahk_id %gHwnd%
gui +alwaysOnTop +toolWindow -caption +0x80000000
CoordMode, Mouse, Screen
mouse_blocked := false
SetTimer, update_DrawingGUI, 10
return

ScrollLock::
while(a_timeidlephysical>300000) ; 5-minutes
    sleep 100
tog:=!tog
;ToolTip, %tog%
if(tog){
    ;blockinput,mousemove
    dllcall("ShowCursor","uint",0)
    mousegetpos,mx,my,active
    gui +Owner%active%
    gui,show,x%mx% y%my% noactivate
} else {
    ;blockinput,mousemoveoff
    gui,cancel
    dllcall("ShowCursor","uint",1)
}
return
 
update_DrawingGUI:

if (!mouse_blocked) ;  ; This is the first time the update_DrawingGUI is run.
{

 mouse_blocked := true
 ; Prepare Drawing GUI for crosshair
 GUI, GUI_Drawing:+AlwaysOnTop +E0x20 -Caption +E0x80000 -Border +ToolWindow +OwnDialogs +Owner  +LastFound
 GUI, GUI_Drawing: Show, NA, GUI_Drawing
 pToken := Gdip_Startup()
 hwnd1 := WinExist("GUI_Drawing")
 hbm := CreateDIBSection(A_ScreenWidth, A_ScreenHeight)
 hdc := CreateCompatibleDC()
 obm := SelectObject(hdc, hbm)
 G := Gdip_GraphicsFromHDC(hdc)
 pPen := Gdip_CreatePen("0xFFFAAA3C", 1)
}
else ; Update crosshair according to mouse position
{
 MouseGetPos, now_x, now_y
 Gdip_GraphicsClear(G) ; Delete old graphics
 Gdip_DrawLine(G, pPen, now_x, 0, now_x, A_ScreenHeight) ; Vertical Line of Crosshair
 Gdip_DrawLine(G, pPen, 0, now_y, A_ScreenWidth, now_y) ; Horizontal Line of Crosshair
; Draw everything
 UpdateLayeredWindow(hwnd1, hdc, 0, 0, A_ScreenWidth, A_ScreenHeight)
}
return
 
ESC::
exitapp