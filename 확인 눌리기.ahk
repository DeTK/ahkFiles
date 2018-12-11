
;수정 2017-04-23 19:6
;    2017-05-21 19:18
;    2017-08-28 01:26
	 
#NoTrayIcon
#SingleInstance Force
#NoEnv
#KeyHistory 0
#Persistent
DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
Process, Priority,, High
SetTitleMatchMode, 2
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
sendmode input
;#IfWinActive Warcraft III
;VarSetCapacity
SetTimer, 척살, 1
Return

척살:
Winwait, 웹 페이지 메시지
WinActivate, 웹 페이지 메시지
Send, `n
Return
F1::
Loop
{
ImageSearch x, y, 0, 0, A_ScreenHeight, A_ScreenWidth, *25 글쓰기.png
IF ErrorLevel = 0
{
	MouseMove x+8, y-40
	click
}
Break
}

Send 확인
sleep 250
Send {Tab}
send {Enter}

Next = 0
Gosub, 2
Return

F2::
Loop
{
ImageSearch x, y, 0, 0, A_ScreenHeight, A_ScreenWidth, *25 글쓰기.png
IF ErrorLevel = 0
{
	MouseMove x+8, y-40
	click
}
Break
}
Send 서버와 아이디 올바르게 작성해주세요
sleep 100
Send {Tab}
sleep 100
send {Enter}
Next = 0
Gosub, 2
Return


F4::
Winwait, 이즈나인 RPG
WinActivate, 이즈나인 RPG
Loop 4
{
Send {Tab}
Sleep 50
}
Send, 가입인사 댓글
Sleep, 50
Send, {Tab}
Sleep, 50
Loop, 6
{
Send, {Up}
}
Sleep, 50
Send, +{Tab}
Send, {Enter}
Return
		
2:
Loop
{
ImageSearch x, y, 0, 0, A_ScreenHeight, A_ScreenWidth, *50 다음글.png
IF ErrorLevel = 0
	{
	MouseMove x+15, y+5
	Next = 1
	}
IF ErrorLevel = 1
	{
	Next = 0
	}
If Next = 1
	{
		Click
		Next = 0
	}
Else
	{
	ImageSearch x, y, 0, 0, A_ScreenHeight, A_ScreenWidth, *25 글쓰기.png
	IF ErrorLevel = 0
		{
			Sleep 500
			Goto, 2
		}
	}
Break
}
Return

F12::
ExitApp

