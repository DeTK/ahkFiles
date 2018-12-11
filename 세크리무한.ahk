
;수정 2017-03-08 05:34
;수정 2017-03-09 03:59

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
#IfWinActive Warcraft III
;VarSetCapacity
SendMode, Input
F5::
Loop
{
ImageSearch, x1, y1, 1307, 823, A_ScreenWidth, A_ScreenHeight, *50 세크.png
If ErrorLevel = 0
{
PostMessage 0x100, 87, 1114113,, Warcraft
PostMessage 0x101, 87, 1114113,, Warcraft
}
If ErrorLevel = 1
{
PostMessage 0x100, 87, 1114113,, Warcraft
PostMessage 0x101, 87, 1114113,, Warcraft
PostMessage 0x100, 98, 5242881,, Warcraft
PostMessage 0x101, 98, 5242881,, Warcraft
}
}
F6::
Reload

