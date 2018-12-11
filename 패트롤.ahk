#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0 
#NoTrayIcon
#Persistent
#NoEnv
#InstallMouseHook
#InstallKeybdHook

CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
Blockinput, SendAndMouse
Process, Priority,, High
SetTitleMatchMode, 2 
SetKeyDelay,0,0,play
SetBatchLines, -1
SendMode, Input
ListLines, Off 
;VarSetCapacity


iniRead, 초, save.ini, 초, 초
iniRead, 가로, save.ini, 해상도, 가로
iniRead, 세로, save.ini, 해상도, 세로
iniRead, 추가x, save.ini, 좌표, 추가x
iniRead, 추가y, save.ini, 좌표, 추가y
iniRead, 간편적용, save.ini, 체크, 간편적용
iniRead, 정사각형, save.ini, 체크, 정사각형
IniRead, 위치x, save.ini, 위치, 가로
IniRead, 위치y, save.ini, 위치, 세로

	settimer,x1,1
	settimer,y1,1
	settimer,추가x,1

If (간편적용 == 0) {
	iniRead, x1, save.ini, 좌표, x1
	iniRead, y1, save.ini, 좌표, y1
	iniRead, x2, save.ini, 좌표, x2
	iniRead, y2, save.ini, 좌표, y2
	iniRead, x3, save.ini, 좌표, x3
	iniRead, y3, save.ini, 좌표, y3
	iniRead, x4, save.ini, 좌표, x4
	iniRead, y4, save.ini, 좌표, y4
}
If (간편적용 == 1) {
	iniRead, x1, save.ini, 좌표1, x1
	iniRead, y1, save.ini, 좌표1, y1
	iniRead, x2, save.ini, 좌표1, x2
	iniRead, y2, save.ini, 좌표1, y2
	iniRead, x3, save.ini, 좌표1, x3
	iniRead, y3, save.ini, 좌표1, y3
	iniRead, x4, save.ini, 좌표1, x4
	iniRead, y4, save.ini, 좌표1, y4
	settimer,추가x,1
}

Gui,Submit,NoHide
Gui, +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
Gui, Add, Text, x40 y0 w200 h20 gbar,
Gui, Add, Button, x0 y0 w40 h20, 시작
Gui, Add, Text, x232 y3 w30 h20 gGuiClose, 끄기
Gui, Add, Text, x4 y23 w20 h20 , x1
Gui, Add, Edit, x21 y19 w40 h20 vx1 gx1, %x1%
Gui, Add, Text, x64 y23 w20 h20 , y1
Gui, Add, Edit, x82 y19 w40 h20 vy1 gy1, %y1%
Gui, Add, Text, x65 y42 w11 h11 , ↓
Gui, Add, Text, x4 y63 w20 h20 , x2
Gui, Add, Edit, x21 y59 w40 h20 vx2, %x2%
Gui, Add, Text, x64 y63 w20 h20 , y2
Gui, Add, Edit, x82 y59 w40 h20 vy2, %y2%
Gui, Add, Text, x127 y64 w11 h11 , →
Gui, Add, Text, x142 y63 w20 h20 , x3
Gui, Add, Edit, x162 y59 w40 h20 vx3, %x3%
Gui, Add, Text, x205 y63 w20 h20 , y3
Gui, Add, Edit, x222 y59 w40 h20 vy3, %y3%
Gui, Add, Text, x206 y42 w11 h11 , ↑
Gui, Add, Text, x142 y23 w20 h20 , x4
Gui, Add, Edit, x162 y19 w40 h20 vx4, %x4%
Gui, Add, Text, x205 y23 w20 h20 , y4
Gui, Add, Edit, x222 y19 w40 h20 vy4, %y4%
Gui, Add, Text, x127 y23 w11 h11 , ←
Gui, Font, s10 
Gui, Add, Text, x5 y89 w20 h20 , 초
Gui, Add, Edit, x21 y84 w40 h20 v초, %초%
Gui, Add, CheckBox, x70 y86 w70 h20 v간편적용 g간편적용 Checked%간편적용%, 간편적용
Gui, Add, Text, x140 y89 w30 h20 , X
Gui, Add, Edit, x150 y84 w40 h20 v추가x g거리, %추가x%
Gui, Add, Text, x193 y89 w30 h20 , Y
Gui, Add, Edit, x203 y84 w40 h20 v추가y g거리, %추가y%
Gui, Add, CheckBox, x248 y86 w15 h15 v정사각형 g정사각형 Checked%정사각형%,
Gui, Font, s12
Gui, Add, Text, x4 y115 w50 h20 , 해상도
Gui, Font, s14 w700
Gui, Add, Text, x54 y113 w40 h30 , 가로
Gui, Font, s10
Gui, Add, Edit, x94 y113 w40 h20 v가로, %가로%
Gui, Font, s14 w700
Gui, Add, Text, x138a y113 w40 h30 , 세로
Gui, Font, s10
Gui, Add, Edit, x178 y113 w40 h20 v세로, %세로%
Gui, Font, s10
Gui, Add, Button, x222 y113  w35 h20 g적용, 적용
Gui, Add, Button, x5 y140 w254 h20 g저장, 저    장
Gui, Show, h164 w265, 깃발꼽기

If 간편적용 = 0
{
	GuiControl,Disable,추가x
    GuiControl,Disable,추가y
    GuiControl,Disable,정사각형
}
If 간편적용 = 1
{
	GuiControl,Disable,x2
	GuiControl,Disable,y2
	GuiControl,Disable,x3
	GuiControl,Disable,y3
	GuiControl,Disable,x4
	GuiControl,Disable,y4
	GuiControl,Enable,추가x
    GuiControl,Enable,추가y
    GuiControl,Enable,정사각형
	If 정사각형 = 0
	{
    	GuiControl,Enable,추가y
    }
    If 정사각형 = 1
	{
    	GuiControl,Disable,추가y
    }
}
WinMove, %위치x%, %위치y%

Return

x1:
Gui, Submit, NoHide

IF 간편적용 = 0
{
	SetTimer, x1, Off
}
IF 간편적용 = 1
{
	settimer,x1,1 
	xx1 = %x1%	
	xx1 +=%추가x%
	GuiControl,, x2, %x1%
	GuiControl,, x3, %xx1%
	GuiControl,, x4, %xx1%
}
Return

y1:
Gui, Submit, NoHide
IF 간편적용 = 0
{
	SetTimer, y1, Off
}
IF 간편적용 = 1
{
	settimer,y1,1
	yy1 = %y1%	
	yy1 +=%추가y%
	GuiControl,, y2, %yy1%
	GuiControl,, y3, %yy1%
	GuiControl,, y4, %y1%
}
Return

추가x:
Gui, Submit, NoHide

IF 정사각형 = 0
{
	SetTimer, 추가x, Off
}
IF 정사각형 = 1
{
	settimer,추가x,1 
	GuiControl,, 추가y, %추가x%
}
Return

bar:
Gui,Submit,NoHide
PostMessage, 0xa1,2,,,A
GetKeyState, 클릭, LButton, P
	
IF 클릭 = D
{
	Sleep, 1
	WinGetPos, 위치x, 위치y, , , 깃발꼽기
	IniWrite, %위치x%, save.ini, 위치, 가로
	IniWrite, %위치y%, save.ini, 위치, 세로
	
}

Return

적용:
Gui,Submit,NoHide
WinActivate, Warcraft III
winmove Warcraft III ,,160,90,%가로%,%세로%
Return

저장:
Gui,Submit,NoHide

IF 간편적용 = 0
{
	IniWrite, %x1%, save.ini, 좌표, x1
	IniWrite, %y1%, save.ini, 좌표, y1
	IniWrite, %x2%, save.ini, 좌표, x2
	IniWrite, %y2%, save.ini, 좌표, y2
	IniWrite, %x3%, save.ini, 좌표, x3
	IniWrite, %y3%, save.ini, 좌표, y3
	IniWrite, %x4%, save.ini, 좌표, x4
	IniWrite, %y4%, save.ini, 좌표, y4
}
If 간편적용 = 1
{
	IniWrite, %x1%, save.ini, 좌표1, x1
	IniWrite, %y1%, save.ini, 좌표1, y1
	IniWrite, %x2%, save.ini, 좌표1, x2
	IniWrite, %y2%, save.ini, 좌표1, y2
	IniWrite, %x3%, save.ini, 좌표1, x3
	IniWrite, %y3%, save.ini, 좌표1, y3
	IniWrite, %x4%, save.ini, 좌표1, x4
	IniWrite, %y4%, save.ini, 좌표1, y4
}
IniWrite, %초%, save.ini, 초, 초
IniWrite, %가로%, save.ini, 해상도, 가로
IniWrite, %세로%, save.ini, 해상도, 세로
거리:
IniWrite, %추가x%, save.ini, 좌표, 추가x
IniWrite, %추가y%, save.ini, 좌표, 추가y
Return

간편적용:
Gui,Submit,NoHide

If 간편적용 = 0
{	
	iniRead, x1, save.ini, 좌표, x1
	iniRead, y1, save.ini, 좌표, y1
	iniRead, x2, save.ini, 좌표, x2
	iniRead, y2, save.ini, 좌표, y2
	iniRead, x3, save.ini, 좌표, x3
	iniRead, y3, save.ini, 좌표, y3
	iniRead, x4, save.ini, 좌표, x4
	iniRead, y4, save.ini, 좌표, y4
	GuiControl,, x1, %x1%
	GuiControl,, y1, %y1%
	GuiControl,, x2, %x2%
	GuiControl,, y2, %y2%
	GuiControl,, x3, %x3%
	GuiControl,, y3, %y3%
	GuiControl,, x4, %x4%
	GuiControl,, y4, %y4%
	GuiControl, Enable, x2
	GuiControl, Enable, y2
	GuiControl, Enable, x3
	GuiControl, Enable, y3
	GuiControl, Enable, x4
	GuiControl, Enable, y4
	GuiControl, Disable, 추가x
    GuiControl, Disable, 추가y
    GuiControl, Disable, 정사각형
}
If 간편적용 = 1
{
	iniRead, x1, save.ini, 좌표1, x1
	iniRead, y1, save.ini, 좌표1, y1
	iniRead, x2, save.ini, 좌표1, x2
	iniRead, y2, save.ini, 좌표1, y2
	iniRead, x3, save.ini, 좌표1, x3
	iniRead, y3, save.ini, 좌표1, y3
	iniRead, x4, save.ini, 좌표1, x4
	iniRead, y4, save.ini, 좌표1, y4
	xx1 = %x1%	
	yy1 = %y1%	
	xx1 +=%추가x%	
	yy1 +=%추가y%	
	GuiControl,, x1, %x1%
	GuiControl,, y1, %y1%
	GuiControl,, x2, %x1%
	GuiControl,, y2, %yy1%
	GuiControl,, x3, %xx1%
	GuiControl,, y3, %yy1%
	GuiControl,, x4, %xx1%
	GuiControl,, y4, %y1%
	If 정사각형 = 0
	{
    	GuiControl,Enable,추가y
    }
    If 정사각형 = 1
	{
    	GuiControl,Disable,추가y
    }	
	GuiControl,Disable,x2
	GuiControl,Disable,y2
	GuiControl,Disable,x3
	GuiControl,Disable,y3
	GuiControl,Disable,x4
	GuiControl,Disable,y4
	GuiControl,Enable,추가x
    GuiControl,Enable,추가y
    GuiControl,Enable,정사각형
}
IniWrite, %간편적용%, save.ini, 체크, 간편적용
Return

정사각형:
Gui,Submit,NoHide
If 정사각형 = 0
	{
		settimer,추가x,off
    	GuiControl,Enable,추가y
    }
    If 정사각형 = 1
	{
		settimer,추가x,1
    	GuiControl,Disable,추가y
    }
IniWrite, %정사각형%, save.ini, 체크, 정사각형
Return

GuiClose:
ExitApp

F2::

Gui,Submit,NoHide
WinActivate, Warcraft III
Send, a
PostMessage 0x100, 16, 2752513,, Warcraft ;쉬프트
IF 간편적용 = 0
{
	Loop, 10
	{
		MouseMove, %x1%, %y1%
		Click
		sleep %초%
	
		MouseMove, %x2%, %y2%
		Click
		sleep %초%

		MouseMove, %x3%, %y3%
		Click
		sleep %초%
	
		MouseMove, %x4%, %y4%
		Click
		sleep %초%
	}
}

IF 간편적용 = 1
{
	xx1 = %x1%
	yy1 = %y1%
	xx1 +=%추가x%
	IF 정사각형 = 0
	{
		yy1 +=%추가y%	
	}
	IF 정사각형 = 1
	{
		yy1 +=%추가x%
	}
	Loop, 10
	{
		MouseMove, %x1%, %y1%
		Click
		sleep %초%
	
		MouseMove, %x1%, %yy1%
		Click
		sleep %초%

		MouseMove, %xx1%, %yy1%
		Click
		sleep %초%
	
		MouseMove, %xx1%, %y1%
		Click
		sleep %초%
	}
}
Return

F3:: 
PostMessage 0x101, 16, 2752513,, Warcraft ;쉬프 땜
Reload

!1::
Gui, Submit, NoHide
MouseGetPos, x, y
GuiControl, , x1, %x%
GuiControl, , y1, %y%
IF 간편적용 = 1
{
	xx1 = %x1%
	yy1 = %y1%
	xx1 +=%추가x%
	yy1 +=%추가y%

	GuiControl, , x2, %x%
	GuiControl, , y2, %yy1%
	GuiControl, , x3, %xx1%
	GuiControl, , y3, %yy1%
	GuiControl, , x4, %xx1%
	GuiControl, , y4, %y%
}

Return

!2::
Gui, Submit, NoHide
MouseGetPos, x, y
GuiControl, , x2, %x%
GuiControl, , y2, %y% 
Return

!3::
Gui, Submit, NoHide
MouseGetPos, x, y
GuiControl, , x3, %x%
GuiControl, , y3, %y% 
Return

!4::
Gui, Submit, NoHide
MouseGetPos, x, y
GuiControl, , x4, %x%
GuiControl, , y4, %y% 
Return