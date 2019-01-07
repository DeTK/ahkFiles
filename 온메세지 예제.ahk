CoordMode, Mouse, Screen 
Gui +ToolWindow -Caption +AlwaysOnTop 
Gui Color, 0xFF0000 
Gui, Add, button, x0 y0 w30 h30 gon, on
Gui, Add, button, x100 y0 w30 h30 goff, off
Gui Show, x400 y400 w300 h30, Origin Point
; 온 메세지 쓰는법
return


on:
OnMessage(0x100, "KeyGet") ; 해당 이벤트에 함수 연결
return   

off:
OnMessage(0x100, "KeyGet", 0) ; 해당 이벤트에 함수 해제
return

KeyGet(wParam, lParam) 
{  
	ToolTip, % wParam "  " lparam
	return 
}