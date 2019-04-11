; #Include Gdip.ahk
; #Include Gdip_ImageSearch.ahk
#Include MyLib.ahk
#Include MyGdip.ahk

OnMessage(0x20a, "WM_MOUSEWHEEL")
OnMessage(0x203, "WM_LBUTTONDBLCLK")

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
global G_GuiHwnd :=
global MyGdip := new MyGdip()
Gui, +hwndhMyGUI
Gui, +AlwaysOnTop +Owner -SysMenu
Gui, Add, Button, x150 y5 w60 h20 gGuiClose, 닫기
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
G_GuiHwnd := WinExist("A")
Return 
 
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
	ControlFocus
	ControlFocus, ahk_id %G_GuiHwnd%
	; SendMessage, 0x7, 0, 0,,A

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
		if (GetAsyncKeyState("LCtrl"))  ; 첫번째순번 아래일 경우
		{
			MyGdip.createSquare()
			return
		}
		if (wParam == 7864320) ; 휠 올림
		{
			G_Num := GetAsyncKeyState("LAlt") ? (G_Num - 10) : (G_Num - 1)

			While (G_Num <= 0)
			{
				G_Num := G_List[1] + G_Num
			}
			
		}
		else if (wParam == 4287102976) ; 휠 내림
		{
			G_Num := GetAsyncKeyState("LAlt") ? (G_Num + 10) : (G_Num + 1)

			While (G_List[1] < G_Num)
			{
				G_Num := G_Num - G_List[1]
			}
		}
		MyGdip.createSquare(G_Hwnd, G_List, G_Num)
	}
	return
}
 


Button창선택:
Gui, Show,, > 원하는창 선택후 스페이스를 눌려주세요
GuiControl,, Edit1,
blockHotkey("Space") ; 해당키가 눌려야 다음으로 진행
G_Hwnd := WinExist("A") ; 현재 활성화된 창의 고유아이디를 가져온다. 
if (G_GuiHwnd == G_Hwnd) 
{
	GuiControl,, Edit1, % "현재창 말고 다른창을 선택해주세요"
	Gui, Show,, >
	return
}
WinGetActiveTitle, G_Title
GuiControl, Enable, Button4
GuiControl,, Edit1, % G_Title
Gui, Show,, % ">"  
return

Button파일선택:    
Gui, Submit
GuiControl,, Edit2,
tempfile := G_File
FileSelectFile, G_File
if (!G_File) ; 비어있을경우
{
	if (!tempfile) 
	{
		GuiControl,, Edit2, % "찾고자하는 이미지파일을 선택해주세요"
		Gui, Show
		return
	}
	G_File := tempfile
}
else
{
	GuiControl, Enable, Button5 
}
Guicontrol,, Static1,
GuiControl,, Edit2, % G_File
Gui, Show
return


Button검색:
Gui, Submit, NoHide
; 핸들, 파일이름
Gui, Show,, % "> 찾는중..." 
G_List := MyGdip.searchInactiveImage(G_Hwnd, G_File)
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

GuiClose:
ExitApp


F5::
GetAsyncKeyState("lalt")
return