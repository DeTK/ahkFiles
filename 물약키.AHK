DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force
#Hotstring NoMousel
#KeyHistory 0
;#NoTrayIcon
#Persistent
#NoEnv

CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
BlockInput, SendAndMouse
Process, Priority,, High
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, 0, 0, play
SetBatchLines, -1
SendMode, input
ListLines, off

1::
ControlSend,, {Numpad1}, ahk_class Warcraft III
sleep 10
MouseGetpos, bx, by
sleep 10
MC(bx,by)
Return

3::
s = 215
ControlSend,, t, ahk_class Warcraft III
sleep 10
Click
sleep %s%
ControlSend,, s, ahk_class Warcraft III
Return

F2::
Exitapp

MC(x,y)
{
xx := x
yy := y
ControlClick, x%xx% y%yy%, ahk_class Warcraft III
}