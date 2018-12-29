/*
	MGP = 마우스 겟 포스
	str = 텍스트
	quotient = 몫
	x1 = 이미지서치의 첫번째 x 좌표
	y1 = 이미지서치의 첫번째 y 좌표
	x2 = 이미지서치의 두번째 x 좌표
	y2 = 이미지서치의 두번째 y 좌표
	UD = 마우스 업 다운


	18 12 30 0.1
	
	# 추가할것 #
	# 전체화면 활성화면 나누기
	# 비활성 클릭추가
	# 리스트목록 클릭시 좌표따기
*/ 

Hotkey, LButton, off
Hotkey, RButton, off

; if (!A_IsAdmin)
; {
;   Run *RunAs "%A_ScriptFullPath%"
;   ExitApp

; }

#Include Gdip.ahk
#Include Gdip_ImageSearch.ahk

#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0 
;#NoTrayIcon
#Persistent
#NoEnv
#WinActivateForce
;#InstallMouseHook
;#InstallKeybdHook
SetTitleMatchMode, 2
;BlockInput, On
CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
CoordMode, ToolTip, Relative
SetBatchLines, -1
Process, Priority,, High 

global firstTick =
global str =
quotient := 1


Gui, +AlwaysOnTop +Owner -SysMenu 
Gui, Add, Button, x5 y5 w60 h20, 창
; Gui, Add, Button, x75 y5 w60 h20, 검색
Gui, Add, Button, x145 y5 w60 h20 Disabled, 파일선택
Gui, Add, Button, x285 y5 w60 h20 gGuiClose, 닫기
Gui, Add, DropDownList, x180 y30 w60 vposList gmove Choose1 , 선택
Gui, Add, Edit, x5 y30 w80 h20 Disabled center, %x1%%y1% 
Gui, Add, Edit, x90 y30 w80 h20 Disabled center, %x2%%y2%
;Gui, Add, Pic, x5 y55 Border

;Gui, Add, Button, x145 y5 w60 h20 gMGP, 처음
;Gui, Add, Button, x215 y5 w60 h20 gMGP, 마지막
Gui, Show, AutoSize, >  
Return
    
move:
Gui, Submit
if (posList == "선택")
{
        Return
}
else
{
	WinActivate, %title%
	{
		temppos := LISTArray[posList]
		StringSplit, position, temppos, `,
		ToolTip, % "↓", position1 + (xx / 2) - 12, position2 - 25, 1
		ToolTip, % "↑", position1 + (xx / 2) - 12, position2 + yy + 5, 2
	}
} 
Gui, show,, % "x = " position1 " y = " position2
Return

LButton::Return
RButton::Return

Button창:
Gui, Show,, > 원하는창 선택후 마우스 오른클릭
Hotkey, RButton, on
Keywait, RButton, D 
Keywait, RButton
Hotkey, RButton, off
hwnd := WinExist("A")
WinGetActiveTitle, title
GuiControl, Enable, Button2
Gui, Show,, > %title%
return
global LISTArray =
Button파일선택:    
Gui, Submit 
FileSelectFile, p
gdipToken := Gdip_Startup()
; Haystack := Gdip_BitmapFromScreen() ; 전체화면
Haystack := Gdip_BitmapFromHWND(hwnd) ; 건초더미
Needle := Gdip_CreateBitmapFromFile(p) ; 바늘
Gdip_GetImageDimensions(Needle, xx, yy)
; Gdip_SetBitmapToClipboard(Haystack) 
; Gdip_ImageSearch(핸들,이미지,ByRef 리스트,X1,Y1,X2,Y2,오차값,투명도,검색방향,찾고자하는수,라인피드",구분자) 
RET := Gdip_ImageSearch(Haystack,Needle,LIST,0,0,0,0,0,0xFFFFFF,1,0)
Gdip_DisposeImage(Haystack)
Gdip_DisposeImage(Needle)
Gdip_Shutdown(gdipToken)
if (RET != 0)
{
	WinActivate, %title%
	ToolTip
	LISTArray := StrSplit(LIST,"`n")
	for i, v in LISTArray
	{
		tempPosList .= "|" i
		StringSplit, position, v, `,
	}
}
GuiControl,, Edit1, Width = %xx%
GuiControl,, Edit2, Height = %yy%
GuiControl,,posList, %tempPosList%
Gui, Show,, > %RET% 개 찾음
ToolTip,,,,1
ToolTip,,,,2
Sleep, 750
Gui, Show,, >
Return


str =

Loop,100
{
	ImageSearch, x, y, x1, y1, x2, y2, *%A_Index% %p% 
	if (ErrorLevel == 0) ;참인 경우
	{
		str .= A_Index " "
		tempx := x+100
		ToolTip % str, tempx, y
	}
	if (Mod(A_Index, 10) == 0)
	{
		str .= "`n"
	}
	
}
Gui, Show
Return






GuiClose:
Gdip_Shutdown(gdipToken)
ExitApp
Reload




timer(n)
{
	return A_TickCount - firstTick > n * 1000 ? 0 : 1 ; 맞는경우 0 아닌경우 1
}


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