#SingleInstance Force
#NoEnv
#KeyHistory 0
#Persistent
Process, Priority,, High
SetTitleMatchMode, 2
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
sendmode input
#IfWinActive Warcraft III
Gui, +AlwaysOnTop
Gui, Add, Button, x100 y9 w80 h40 gsee, 가재
Gui, Add, Button, x4 y9 w80 h40 gre, 리로드
Gui, Add, Button, x4 y50 w80 h40 gclip, 복사
Gui, Add, Button, x100 y50 w80 h40 gclip1, 복붙

; Generated using SmartGUI Creator 4.0
Gui, Show, x498 y365 h68 w200, New GUI Window
Return

GuiClose:
ExitApp

s = 100
Insert::
re: 
Reload
clip:
WinActivate, Warcraft
SendInput, {ShiftDown}{Home}{ShiftUp}^c
clip1:
WinActivate, Warcraft
SendInput, ^v
Return
/*
x := 501
y := 800
i := x|y<<16
sleep, 2500
PostMessage, 0x202, 0,%i%,, Warcraft
*/

see: loop { WinActivate, Warcraft MouseMove, 222, 762 sleep, 250 Click sleep,
250 SendInput, {F1} sleep, 250 Click sleep, 250 MouseMove, 788, 439 SendInput,
m  sleep, 250 Click Sleep, 22w000 loop {     PixelSearch, x, y, 500, 800, 501,
801, #ffffff     if (ErrorLevel = 0)     {         Break     }     else     {
	
MouseMove, 500, 800
Sleep, 250
SendInput, {ShiftDown}
sleep, 250
SendInput, we
sleep, 250w
SendInput, {ShiftUp}
sleep, 250
SendInput, {ShiftDown}
sleep, 250
SendInput, q
sleep, 250
Click
sleep, 250
SendInput, {ShiftUp}
sleep, 250
SendInput, {ShiftDown}
sleep, 250
SendInput, r
sleep, 250
Click
sleep, 250
SendInput, {ShiftUp}
sleep, 250
SendInput, e
}
}
Sleep, 5000
}
Return

Home::
WinActivate, Warcraft
Sleep, 100
SendInput, {F1}
Sleep, 100
SendInput, a
sleep, 100
Click
/*WinActivate, Warcraft
MouseGetPos, x, y
SendInput, `nx=%x%,y=%y%`n*/
Return

1::
SendInput, {ShiftUp}{AltUp}{CtrlUp}
Return