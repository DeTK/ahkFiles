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

Hotkey, LButton, off

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
;#InstallMouseHook
;#InstallKeybdHook
SetTitleMatchMode, 2
;BlockInput, On
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SetBatchLines, -1
Process, Priority,, High 

global firstTick =
global str =
quotient := 1


Gui, +AlwaysOnTop +Owner -SysMenu 
Gui, Add, Button, x5 y5 w60 h20, 파일선택
Gui, Add, Button, x75 y5 w60 h20, 검색
;Gui, Add, Button, x145 y5 w60 h20 gMGP, 처음
;Gui, Add, Button, x215 y5 w60 h20 gMGP, 마지막
Gui, Add, Button, x285 y5 w60 h20 gGuiClose, 닫기 

Gui, Add, Edit, x5 y30 w100 h20 Disabled, %x1%%y1% 
Gui, Add, Edit, x110 y30 w100 h20 Disabled, %x2%%y2%


Gui, Add, Pic, x5 y55
Gui, Show, AutoSize, >  
Return
    
Button파일선택:    
Gui, Submit 
FileSelectFile, p
if (ErrorLevel == 0)
{
	GuiControl,, Static1, *w150 *h150 %p%	 
} 
Gui, Show, AutoSize
Return

LButton::Return

 
 

   
Button검색: 
ToolTip
Gui, Submit, NoHide
Gui, Show,, > 원하는창 선택후 스페이스  
Keywait, Space, D 
Keywait, Space
hwnd := WinExist("A")
gdipToken := Gdip_Startup() 
Haystack := Gdip_BitmapFromHWND(hwnd) ; 건초더미
; Haystack := Gdip_BitmapFromScreen() ; 전체화면
Gdip_SetBitmapToClipboard(Haystack) 
Needle := Gdip_CreateBitmapFromFile(p) ; 바늘
; Gdip_ImageSearch(핸들,이미지,ByRef 리스트,X1,Y1,X2,Y2,오차값,투명도,검색방향,찾고자하는수,라인피드",구분자) 
RET := Gdip_ImageSearch(Haystack,Needle,LIST,0,0,0,0,0,0xFFFFFF,1,0)
Gdip_DisposeImage(bmpHaystack)
Gdip_DisposeImage(bmpNeedle) 
Gdip_Shutdown(gdipToken)
LISTArray := StrSplit(LIST,"`n")
for i, v in LISTArray
{
	StringSplit, position, v, `,
	MouseMove, position1, position2
	ToolTip, % v
	sleep, 500
}
ToolTip, % RET
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