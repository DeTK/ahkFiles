

; str =

; Loop,100
; {
; 	ImageSearch, x, y, x1, y1, x2, y2, *%A_Index% %p% 
; 	if (ErrorLevel == 0) ;참인 경우
; 	{
; 		str .= A_Index " "
; 		tempx := x+100
; 		ToolTip % str, tempx, y
; 	}
; 	if (Mod(A_Index, 10) == 0)
; 	{
; 		str .= "`n"
; 	}
	
; }
; Gui, Show
; Return



; MGP:
; ToolTip
; Gui, Submit, NoHide
; Hotkey, LButton, on
; firstTick := A_TickCount
; Gui, Show,, > 마우스를 클릭해서 좌표를 지정해주세요
; Loop
; {
; 	GetKeyState, UD, LButton, P	
; 	if (UD == "D")
; 	{
; 		MouseGetPos, x, y
; 		if (A_GuiControl == "처음")
; 		{
; 			x1 := x
; 			y1 := y
; 			GuiControl,, Edit1, X=%x1% Y=%y1%
; 		}
; 		else if (A_GuiControl == "마지막")
; 		{
; 			x2 := x
; 			y2 := y
; 			GuiControl,, Edit2, X=%x2% Y=%y2%
; 		}
; 		break
; 	}
; 	else if (timer(5) == 0)
; 	{
; 		ToolTip, 아무것도 클릭하지 않아서 처음으로 돌아감
; 		break
; 	}
; }
; Hotkey, LButton, off
; Gui, show,, >
; Return