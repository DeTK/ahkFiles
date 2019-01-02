CoordMode, Mouse, Screen 
Gui +ToolWindow -Caption +AlwaysOnTop 
Gui Color, 0xFF0000 
Gui Show, x400 y400 w3 h3, Origin Point
; 온 메세지 쓰는법
OnMessage(0x201, "WM_LBUTTONDOWN") 
SetTimer,Check,50 
return 

Check: 
WinGetPos, wX, wY,,, Origin Point 
MouseGetPos, mX, mY 
rX:=mX-wX-1 
rY:=wY-mY+1 
pi=3.141592653589793 
Angle:=round(atan2(rX,rY)<0 ? atan2(rX,rY)*180/pi+360:atan2(rX,rY)*180/pi,2) 
tooltip %rx% `, %ry% `, %Angle% 
return 
; 각도 알아올때
atan2(x,y) 
{ 
Return dllcall("msvcrt\atan2","Double",y, "Double",x, "CDECL Double") 
} 

WM_LBUTTONDOWN(wParam, lParam) 
{ 
PostMessage, 0xA1, 2,,, A 
return 
}