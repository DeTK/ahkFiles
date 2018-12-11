/*
	MGP = 마우스 겟 포스
	str = 텍스트
	quotient = 몫
	x1 = 이미지서치의 첫번째 x 좌표
	y1 = 이미지서치의 첫번째 y 좌표
	x2 = 이미지서치의 두번째 x 좌표
	y2 = 이미지서치의 두번째 y 좌표
	UD = 마우스 업 다운
*/

#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0 
;#NoTrayIcon
#Persistent
#NoEnv
#InstallMouseHook
#InstallKeybdHook

SetTitleMatchMode, 2
;BlockInput, On
CoordMode, Mouse, Relative
CoordMode, Pixel, Relative

global str :=
quotient := 1

Gui, +AlwaysOnTop
Gui, Add, Button, x0 y0 w60 h20, 파일선택
Gui, Add, Button, x70 y0 w60 h20, 검색
Gui, Add, Button, x140 y0 w60 h20 gMGP, 처음
Gui, Add, Button, x210 y0 w60 h20 gMGP, 마지막
Gui, Add, Button, x280 y0 w60 h20 gGuiClose, 닫기
Gui, Add, Edit, x0 y25 w100 h20, %x1%%y1%
Gui, Add, Edit, x105 y25 w100 h20, %x2%%y2%
Gui, Add, Pic, x0 y50
Gui, Show, x208 y238 AutoSize
Return

Button파일선택:
Gui, Submit
FileSelectFile, p
GuiControl,, Static1, *w150 *h150 %p%
Gui, Show, xCenter AutoSize, %p%
Return

Button검색:
Gui, Submit

str =

Loop
{
	if (A_Index == 101)
	{
		Break
	}
	ImageSearch, x, y, x1, y1, x2, y2, *%A_Index% %p%

	if (ErrorLevel == 0) ;참인 경우
	{
		countx("O")
		MouseMove, x, y
	}
	else ;거짓인 경우
	{
		countx("X")
	}

	if (A_Index/10 == quotient)
	{
		
		quotient++
		str = %str%`n
	}
}
MsgBox, %str%
Gui, Show
Return

MGP:
Gui, Submit, NoHide
Loop
{
	GetKeyState, UD, LButton, P
	if (A_GuiControl == "처음")
	{
		if (UD == "D")
		{
			MouseGetPos, x, y
			x1 := x
			y1 := y
			GuiControl,, Edit1, X=%x1% Y=%y1%
			;MsgBox % x1 A_Space y1 A_Space
			break
		}
	}
	else if (A_GuiControl == "마지막")
	{
		if (UD == "D")
		{
			MouseGetPos, x, y
			x2 := x
			y2 := y
			GuiControl,, Edit2, X=%x2% Y=%y2%
			;MsgBox % x2 A_Space y2 A_Space
			break
		}
	}
}
Return

countx(text)
{
	str = %str% %A_Index%%text%
	Return
}

GuiClose:
Reload
ExitApp