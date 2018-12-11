stop = 0
Gui,2: +LastFound +AlwaysOnTop  +LastFound -caption
Gui,2: Add, Text,w15 h15 
gui,2:add,progress,xp yp+2 w592 h215  backgroundblack ,0
SplashImage,2:, b x1212 y55 w200 h100 영상전용
SetMouseDelay, 0

WinSet,TransColor,black 255
Gui,2:Color,035bc4
WinGet,vid,id
WinGetPos,winX,winY,,,ahk_id %vid%
return

GuiClose:
exitapp

F5::
Gui,2:Show, x462 y293 w615 h230, % title
Loop{


Loop{
if stop = 1
 break
GetKeyState, Mouse2, LButton, P
If ( Mouse2 == "U" )
 break

PixelSearch, Px, Py, 320, 307, 1050,522, 0x1300FD, 5,fast
if errorlevel = 0
{
mousegetpos,mx,my
Px := Px+40

if Px >= %mx%
{
re := Px-mx
tooltip, %mx%/%my%`n%Px%/%Py%`n%re%,0,0
DllCall("mouse_event", uint, 1, int, re, int, 0, uint, 0, int, 0)
break
}
else if Px <= %mx%
{
re := mx-Px
tooltip, %mx%/%my%`n%Px%/%Py%`n%re%,0,0
DllCall("mouse_event", uint, 1, int, -re, int, 0, uint, 0, int, 0)
break
}
} ;; pixel

} ;; 2Loop

Loop { ;3loop
if stop = 1
 break
GetKeyState, Mouse2, LButton, P
If ( Mouse2 == "U" )
 break
PixelSearch, Px, Py, 320, 307, 1050,522, 0x1300FD, 5,fast
if errorlevel = 0
{
Py := Py+65
if Py <= %my%
{
re := my-Py
tooltip, %mx%/%my%`n%Px%/%Py%`n%re%,0,0
DllCall("mouse_event", uint, 1, int, 0, int, -re, uint, 0, int, 0)
break
}
else if Py >= %my%
{
re := Py-my
tooltip, %mx%/%my%`n%Px%/%Py%`n%re%,0,0
DllCall("mouse_event", uint, 1, int, 0, int, re, uint, 0, int, 0)
break
}
}
} ;; 3loop


} ;; 1Loop

F7::
;msgbox, % stop
if stop = 0
{
 stop = 1
 gui,2:hide
}
else if stop = 1
{
 stop = 0
 Gui,2:Show, x688 y293 w205 h230, % title
}
return

F6::exitapp

F8::
DllCall("mouse_event", uint, 1, int, 0, int, 10, uint, 0, int, 0)



