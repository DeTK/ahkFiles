

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

; GuiControl,, posList, |
; if (G_List[1] != 0)
; {
; 	tempPosList =
; 	for i, v in G_list
; 	{
; 		if (i > 2)
; 		{
; 			tempPosList .= i - 2 "|"
; 		}
; 	}
; 	GuiControl,, Edit1, % imageFoundNum
; }
; GuiControl,, posList, % tempPosList
; GuiControl, Choose, posList, 1

; xw := x + w + 3
; yh := y + h + 4
;                          ARGB    팬두깨
; pen := Gdip_CreatePen("0xFFFF0000", 2)
; 이미지 를 감싸는 사각형 을 그린다.
;            DC  팬 시작점[x1 y1]    끝점[x2 y2]
; Gdip_DrawLine(CS_G, pen, x - 3,  y - 4, xw,     y - 4)  ; 위
; Gdip_DrawLine(CS_G, pen, xw + 1, y - 5, xw + 1, yh + 1) ; 오른쪽
; Gdip_DrawLine(CS_G, pen, x - 3,  yh,    xw,     yh)     ; 아래
; Gdip_DrawLine(CS_G, pen, x - 4,  y - 5, x - 4,  yh + 1) ; 왼쪽


;Gdip_GraphicsClear(CS_G) ; 이전의 그려진 그랙픽을 지워준다.

	; brush := Gdip_BrushCreateSolid(0x77ff0000) ; 브러쉬 색상 ARGB
	; Gdip_FillRectangle(G, brush, position1 + xx, position2 + yy, imageW, imageH) ; 사각형의 도형을 그려준다.
	
	; 현재창의 스크린좌표상 위치
	

	; 방금 생성 한 펜을 사용하여 비트 맵의 ​​그래픽 위에 사각형을 그립니다.
	;Gdip_DrawRectangle(CS_G, pPen, x - 5, y - 5, w + 9, h + 9)
	;Gdip_DeletePen(pPen)
	;UpdateLayeredWindow(CS_hwnd, CS_hdc, 0, 0, A_ScreenWidth, A_ScreenHeight) ; 업데이트해줘서 실제로 보여준다.