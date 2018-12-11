DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

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

IniRead, 위치x, save.ini, 위치, 가로
IniRead, 위치y, save.ini, 위치, 세로

X1A = 1

Gui,Submit,NoHide
Gui, +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption

Gui, Add, Text, x0 y0 w96 h20 gbar,
Gui, Add, Text, x96 y3 w30 h15 gGuiClose, 끄기
Gui, Add, Edit, x2 y19 w110 h20 vY1A,%Y1A%

; Generated using SmartGUI Creator 4.0
Gui, Show, w120 h45, 화면찍기
WinMove, %위치x%, %위치y%
Return

GuiClose:
ExitApp


bar:
Gui,Submit,NoHide
PostMessage, 0xa1,2,,,A
GetKeyState, 클릭, LButton, P
	
	IF 클릭 = D
	{
		Sleep, 1
		
		WinGetPos, 위치x, 위치y, , , 화면찍기

		IniWrite, %위치x%, save.ini, 위치, 가로
		IniWrite, %위치y%, save.ini, 위치, 세로

		Reload
		
	}

Return

;--------------------------------------화면찍기


F3::
Gui, Submit, NoHide

sa := 1
sb := 1

X1B := X1A * 13
Y1B := Y1A * 3


Sleep, %sa%

If X1A <= 21
{
	MouseMove, 312-X1B, 686+Y1B
	Sleep, %sa%
	Click
	Sleep, %sb%
	X1A++
	Return
}

Else If X1A <= 22
{
	MouseMove, 28, 686+Y1B
	Sleep, %sa%
	Click
	Sleep, %sb%
	X1A = 1
	Y1A++
	GuiControl,, Y1A, %Y1A%
	Return
}

F5:: ExitApp
