;수정 2017/04/01 23:37
;수정 2017/04/02 06:25
;수정 2017/04/02 06:37

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
#IfWinActive Warcraft III
WinActivate Warcraft

SetTimer, Blood, 100
SetTimer, Skill, 100
Return

Blood:
Loop
{

PixelSearch, x, y, 44, 127, 45, 128, 0x000000, 0, Fast, RGB

IF ErrorLevel = 0
{
Break
}
IF ErrorLevel = 1
{
Break
}
}
sleep 500
Loop
{
PixelSearch, x, y, 50, 127, 51, 128, 0x000000, 0, Fast, RGB

IF ErrorLevel = 0
{
PostMessage 0x100, 97, 5177345,, Warcraft ;디패드1
PostMessage 0x101, 97, 5177345,, Warcraft ;디패드1
Break
}
IF ErrorLevel = 1
{
Break
}
}
Return

Skill:
Loop
{
ImageSearch, x, y, 1300, 750, 1410, 850, *50 새크리.png
IF ErrorLevel = 0
{
PostMessage 0x100, 69, 1179649,, Warcraft ;e D
PostMessage 0x101, 69, 1179649,, Warcraft ;e U
PostMessage 0x100, 87, 1114113,, Warcraft ;w D
PostMessage 0x101, 87, 1114113,, Warcraft ;w U
PostMessage 0x100, 98, 5242881,, Warcraft ;다이얼패드2 D
PostMessage 0x101, 98, 5242881,, Warcraft ;다이얼패드2 U
}
Break
}
Return

F5::
Send, `n-whgkq`n ;-조합
Return

^[::Reload
^]::ExitApp


