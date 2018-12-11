
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
활동정지:
Loop
{
ImageSearch, x1, y1, 1, 1, A_ScreenWidth, A_ScreenHeight, *25 활동정지.png
IF ErrorLevel = 0
{
	mousemove x1+23,y1+8
	Click
	Break
}
IF ErrorLevel = 1
{
	Goto 활동정지
}
}



next:
Loop 
{
ImageSearch, x1,y1,666,1,800,1080, *25 다음글.png
IF ErrorLevel = 0 
{
	mousemove x1+28,y1+11
	click
	Goto 활동정지
	
}
IF ErrorLevel = 1
{
	Goto next
}
}

;--------------------------------------------------------------------------------------	
^]::ExitApp

	


