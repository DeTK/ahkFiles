
;수정 2017-03-10 01:21

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
;#IfWinActive Warcraft III
;VarSetCapacity
SendMode, Input

F4::


PixelGetColor, e, x, y, RGB
MouseGetPos, x, y

Clipboard = PixelSearch, x, y, %x%, %y%, %x%+1, %y%+1, %e%, 0, Fast, RGB
Return
F1::
ExitApp
