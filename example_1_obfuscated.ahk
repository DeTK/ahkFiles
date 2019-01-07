obf_copyright := " Date: 오후 2:40 2019년 1월 4일 금요일                  "
obf_copyright := "                                                "
obf_copyright := " THE FOLLOWING AUTOHOTKEY SCRIPT WAS OBFUSCATED "
obf_copyright := " BY DYNAMIC OBFUSCATER FOR AUTOHOTKEY           "
obf_copyright := "                                                "
obf_copyright := " Copyright (C) 2011-2013  David Malia           "
obf_copyright := " DYNAMIC OBFUSCATER is released under           "
obf_copyright := " the Open Source GPL License                    "


;AUTOEXECUTE ORIGINAL NAME: autoexecute
;autoexecute
;$OBFUSCATOR: $FUNCS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $PARAMS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $LABELS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $GLOBVARS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $LOSVARS_CHANGE_DEFAULTS: ,, -1 


OnMessage(0x20a, "WM_MOUSEWHEEL")
OnMessage(0x203, "WM_LBUTTONDBLCLK")

#Include MyLib.ahk
#Include Gdip.ahk
#Include Gdip_ImageSearch.ahk
#ErrorStdOut
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

global G_List := 
global G_Hwnd := 
global G_File := 
global G_Num :=
global G_Title :=

Gui, +hwndhMyGUI
Gui, +AlwaysOnTop +Owner -SysMenu
Gui, Add, Button, x150 y5 w60 h20 gkffff@f%k#k#f@kff@ffk#fkk#%@%k#f@kfk#f@kffk%fkf%fkk#ffk#f@fkfkf@kff@k#%@k#ffkffkf@k#kf, 닫기
Gui, Add, Button, xp+60 yp w60 h20, 컨트롤
 
Gui, Add, Tab2,x5 y5 w325, 이미지찾기|다음

Gui, Add, Button, x11 y31 w60 h22, 창선택
Gui, Add, Edit, xp+1 yp+26 w300 h20 0x800,
Gui, Add, Button, xp-1 yp+24 w60 h22 Disabled, 파일선택
Gui, Add, Text, xp+100 yp+6 w200 h15,
Gui, Add, Edit, xp-99 yp+20 w300 h20 0x800,
Gui, Add, Button, xp-1 yp+24 w60 h22 Disabled, 검색
;Gui, Add, StatusBar,, 상태바이다
Gui, Show, x1400 w350, >
OnMessage(0x201, "cl")
OnMessage(0x202, "cl")
Return 
 
cl(wParam, lParam, message, hwnd)
{
	MouseGetPos,,,, Gui
	if (Gui == "Edit1" || Gui == "Edit2")
	{
		ToolTip, 무시하라고
		return
	}
}

WM_LBUTTONDBLCLK(wParam, lParam, message, hwnd)
{
	MouseGetPos,,,, Gui
	if (Gui == "Edit1" && G_Title) ; 컨트롤이름이 Edit1이면서 G_Title가 안비어져 있을때
	{
		Clipboard := G_Title
		ToolTip, 타이틀 복사됨
		Sleep, 500
		ToolTip
	}
	else if (Gui == "Edit2" && G_File)
	{
		Clipboard := G_File
		ToolTip, 파일명 복사됨
		Sleep, 500
		ToolTip
	}

}




Button컨트롤:
if (flag := !flag)
	OnMessage(0x200, "WM_MOUSEMOVE")
else
{
	OnMessage(0x200, "WM_MOUSEMOVE", 0)
	ToolTip,,,,20
}
return

WM_MOUSEMOVE(wParam, lParam, message, hwnd)
{
	MouseGetPos,,,, Gui
	ToolTip, % Gui,,,20
}


WM_MOUSEWHEEL(wParam, lParam, message, hwnd)
{
	;ToolTip, % wParam " " lParam " " message " " hwnd " " Gui
	MouseGetPos,,,, Gui
	if (Gui == "Button5" && G_List) ; 현재 컨트롤의 이름 리스트가 빈값이 아닐때
	{
		Create_GDI()
		GetKeyState, key, LAlt, P
		if (wParam == 7864320) ; 휠 올림
		{
			if (key == "D")
				G_Num -= 10
			else
				G_Num--
		}
		else if (wParam == 4287102976) ; 휠 내림
		{
			if (key == "D")
				G_Num += 10
			else
				G_Num++
			if (G_List[1] < G_Num)
				G_Num := G_List[1]
		}		
		if (G_Num <= 0)
			Create_Square(0,0,0), Delete_GDI(), G_Num := 0
		else if (G_Num > 0)
			Create_Square(G_Hwnd, G_List, G_Num)
		Delete_GDI()
	}
	return
}



Button창선택:
Gui, Show,, > 원하는창 선택후 스페이스를 눌려주세요
Block_Hotkey("Space") ; 해당키가 눌려야 다음으로 진행
G_Hwnd := WinExist("A") ; 현재 활성화된 창의 고유아이디를 가져온다.
WinGetActiveTitle, G_Title
GuiControl, Enable, Button4
GuiControl,, Edit1, % G_Title
Gui, Show,, % ">"
return

Button파일선택:    
Gui, Submit 
tempfile := G_File
FileSelectFile, G_File
if (!G_File) ; 비어있을경우
	G_File := tempfile
else
	GuiControl, Enable, Button5
Guicontrol,, Static1,
GuiControl,, Edit2, % G_File

Gui, Show
return


Button검색:
Gui, Submit, NoHide
; 핸들, 파일이름
G_List := Inactive_Search(G_Hwnd, G_File)
G_Num := 0
Guicontrol,, Static1,
if (G_List[1])
{
	Guicontrol,, Static1, % "길이 = " G_List[2][1] " 높이 = " G_List[2][2]
	Gui, Show,, % "> " G_List[1] "개 찾음"
}
else
{
	Gui, Show,, % "> 못 찾음"
}
Return

kffff@%kffffkfkf@kffkffffk#%f@fkf%f@k#ffkfkfkffffkffkff@%@k#ff%f@kffkkff@fkfkffk#fff@%kffkf@k#kf:
ExitApp

