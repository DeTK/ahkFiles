/*
	MGP = 마우스 겟 포스
	str = 텍스트
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

Hotkey, Space, off

; if (!A_IsAdmin)
; {
;   Run *RunAs "%A_ScriptFullPath%"
;   ExitApp

; }

#Include MyLib.ahk
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
ListLines, Off 

global G_List := G_Num := G_Hwnd := G_File :=
Gui, +AlwaysOnTop +Owner -SysMenu
Gui, Add, Button, x5 y5 w60 h20, 창
; Gui, Add, Button, x75 y5 w60 h20, 검색
Gui, Add, Button, x145 y5 w60 h20 Disabled, 파일선택
Gui, Add, Button, x220 y5 w60 h20 Disabled, 재검색
Gui, Add, Button, x285 y5 w60 h20 gGuiClose, 닫기
Gui, Add, DropDownList, x180 y30 w60 vposList gposSquare,
Gui, Add, Edit, x5 y30 w80 h20 Disabled center, 
;Gui, Add, Pic, x5 y55 Border

;Gui, Add, Button, x145 y5 w60 h20 gMGP, 처음
;Gui, Add, Button, x215 y5 w60 h20 gMGP, 마지막
Gui, Show, AutoSize, >
Return




posSquare:
Gui, Submit, NoHide
G_Num := posList
Create_Square(G_Hwnd, G_List, G_Num)
return

Space::Return

Button창:
Gui, Show,, > 원하는창 선택후 스페이스를 눌려주세요
Lock_Hotkey("Space")
G_Hwnd := WinExist() ; 현재 활성화된 창의 고유아이디를 가져온다.
WinGetActiveTitle, title
GuiControl, Enable, Button2
Gui, Show,, % "> " title
return


Button파일선택:    
Gui, Submit 
tempfile := G_File
FileSelectFile, G_File
if (G_File == "")
{
	G_File := tempfile
}
Button재검색:
if (A_ThisLabel == "Button재검색")
{
	Gdip_GraphicsClear(CS_G)
	UpdateLayeredWindow(CS_hwnd, CS_hdc)
	Gdip_Shutdown(CS_Token)
}
; 핸들, 파일이름
G_List := Inactive_Search(G_Hwnd, G_File)
Gui, show,, % "> w = " G_List[2][1] " h = " G_List[2][2]
GuiControl,, posList, |
if (G_List[1] != 0)
{
	tempPosList =
	for i, v in G_list
	{
		if (i > 2)
		{
			tempPosList .= i - 2 "|"
		}
	}
	GuiControl,, Edit1, % imageFoundNum
}
GuiControl,, posList, % tempPosList
GuiControl, Choose, posList, 1
GuiControl, Enable, Button3
Gui, Show,, % "> " G_List[1] "개 찾음"

Sleep, 750
Gui, Show,, >
Return

GuiClose:
ExitApp






