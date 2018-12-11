#SingleInstance, force
SetBatchLines, -1  ; 최대 속도로 연산을 실행합니다.
CoordMode, Mouse, Screen
#Persistent
global PosX
global PosY


F3::
MouseGetPos, x, y
Return

F2::
MouseGetPos, x, y
tempX := x
tempY := y
PosY := y
PosX := x

MouseClick, Left, %tempX%, %tempY%,, 1, D
MouseClick, Left, %PosX%, %PosY%,, 1, U
Click
MouseMove, %tempX%, %tempY%, 0 
Return