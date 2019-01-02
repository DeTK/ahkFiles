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
;#NoIcon
Sendmode, input

~s::

Winwait, 사진 저
WinActivate, 사진 저
Send, {Enter}
Winwait, 다른 이름으로 저장 확인,,0

WinActivate, 다른 이름으로 저장 확인
Send, y

Return