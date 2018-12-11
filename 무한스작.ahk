;수정 2017-03-10 02:09

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

F2::
Loop
{
1:
Loop			
{
PixelSearch, x, y, 1329, 86, 1329+1, 86+1, 0xEDD246, 0, Fast, RGB			
IF ErrorLevel = 0
{
	Goto, 1
}
IF ErrorLevel = 1
{
}
sleep 75000
z := 100
PostMessage 0x100, 97, 5177345,, Warcraft ;엔터
Sleep, %z%
PostMessage 0x101, 13, 18612225,, Warcraft	
		
;PostMessage 0x100, 109, 4849665,, Warcraft ;-
Sleep, %z%
PostMessage 0x101, 109, 4849665,, Warcraft

PostMessage 0x100, 97, 5177345,, Warcraft ;1
Sleep, %z%
PostMessage 0x101, 97, 5177345,, Warcraft

PostMessage 0x100, 13, 18612225,, Warcraft ;엔터
Sleep, %z%
PostMessage 0x101, 13, 18612225,, Warcraft

Sleep, %z%
Send,a
Sleep, %z%
MouseMove, 144, 873
Sleep, %z%
Click
Sleep, 6000
-LOAD 4OQZT-W1O5K-3W7J1-17YS6-YYFMY-2OXC3-11﻿ 60
Send,a
Sleep, %z%
MouseMove, 304, 124
Sleep, %z%
Click
Sleep, 4500

Send,a
Sleep, %z%
MouseMove, 141, 688
Sleep, %z%
Click
Break
}
}
F3::
Exitapp
