DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0
#NoTrayIcon
#Persistent
#NoEnv

CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
BlockInput, SendAndMouse
Process, Priority,, High
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, 0, 0, play
SetBatchLines, -1
SendMode, input
ListLines, off

ScrollLock::
send, {vk15}
Return

F5::ExitApp