
SetTitleMatchMode, 2
CoordMode, Mouse, Relative
x := 600
y := 560
lpararm := x|y<<16

F1::
PostMessage, 0x201, 1, %lpararm%,, Click
PostMessage, 0x202, 0, %lpararm%,, Click
return