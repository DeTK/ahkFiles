
;수정 2017-03-04 06:07

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
;VarSetCapacity

IniRead, xe, save.ini, 축, x
IniRead, ye, save.ini, 축, y
IniRead, sleep, save.ini, time, sleep

Gui, Submit, Nohide
Gui, -caption +AlwaysOnTop
Gui, Add, Text, x270 y2 w40 h20 gbar Center, 체력바 ;바
Gui, Add, Text, x1 y6 w10 h10 gGuiClose, X
Gui, Add, Edit, x220 y2 w50 h20 vsleep, %sleep%
Gui, Add, Edit, x11 y2 w50 h20 vxe, %xe%
Gui, Add, UpDown, Range0-999, %xe%
Gui, Add, Text, x63 y6 w10 h10, Y
Gui, Add, Edit, x73 y2 w50 h20 vye, %ye%
Gui, Add, UpDown, Range0-999, %ye%
Gui, Add, Button, x126 y2 w40 h20, 실행
Gui, Add, Button, x168 y2 w50 h20, 재시작
Gui, Add, Slider, x0 y25 w310 h30 Thick18 TickInterval7.5 Range0-75 vA, 75
; Generated using SmartGUI Creator 4.0
Gui, Show, x750 y1000 w310 h50, New GUI Window
Return

bar:
PostMessage, 0xa1, 2,,,A
Return
;----------------------------------------시작부

Button실행:

Gui, Submit, Nohide
IniWrite, %xe%, save.ini, 축, x
IniWrite, %ye%, save.ini, 축, y
IniWrite, %sleep%, save.ini, time, sleep
xe += %A%

Loop
{
sleep %sleep%
PixelSearch, x, y, %xe%, %ye%, %xe%+1, %ye%+1, 0x000000, 0, Fast, RGB
IF ErrorLevel = 0
{
PostMessage 0x100, 50, 196609,, Warcraft ;2
PostMessage 0x101, 50, 196609,, Warcraft ;2
sleep 100
PostMessage 0x100, 97, 5177345,, Warcraft ;디패드1
PostMessage 0x101, 97, 5177345,, Warcraft ;디패드1
sleep 100
Loop 3
{
PostMessage 0x100, 112, 3866625,, Warcraft ;F1
PostMessage 0x101, 112, 3866625,, Warcraft ;F1
}
}
}

Button재시작:
Reload

F4::
Gui, Submit, NoHide
MouseGetPos, x, y
GuiControl, , xe, %x%
GuiControl, , ye, %y% 
Return

F5::
Loop
{
MouseClick
}
F6:: Reload

GuiClose:
ExitApp
