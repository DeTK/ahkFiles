DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
Process, Priority,, High
#SingleInstance Force
SetTitleMatchMode, 2 
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
;VarSetCapacity
#Persistent
#KeyHistory 0
#NoEnv
#IfWinActive Warcraft III

1:

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 해골.png
IF ErrorLevel = 0
{
	Sendinput, w
	sleep 3000
	Break
}
IF ErrorLevel = 1
{
	Break
}
}
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 스작몬.png
IF ErrorLevel = 0
{	
	Sendinput, e
	sleep 7000
	Break
}
IF ErrorLevel = 1
{
	Break
}
}

Goto 1
