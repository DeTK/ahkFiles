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

;--------------------------------------조합

F2::
Send, {Enter}
Send, -whgkq
Send, {Enter}
Return

;--------------------------------------화면찍기

F3::
se := 100
MouseMove, 299, 880
Sleep, %se%
Click
Sleep, %se%
MouseMove, 1061, 757
Sleep, %se%
Click
Sleep, 150
Send, {PrintScreen}
Sleep, %se%
WinActivate, ahk_exe Photoshop.exe
Sleep, %se%
Send, ^v
Sleep, %se%
Click
Sleep, %se%
MouseMove, 519,389  ;메뉴
Sleep, %se%
MouseClick, Right
Sleep, %se%
MouseMove, 604,635 ;선택영역불러오기
Sleep, %se%
click
winwait 선택 영역 불러오기
;Sleep, %se%
ControlFocus, ComboBox2, 선택 영역 불러오기
Sleep, %se%
Send, {Down}`n
Sleep, %se%
Send, ^c
Send, ^d
Send, {Del}
Send, ^v
Return

F5:: ExitApp
