
SetTitleMatchMode, 2

x := 1000
y := 1000


F1::
lpararm := x|y<<16
PostMessage, 0x201, 1, %lpararm%,, Photoshop
PostMessage, 0x202, 0, %lpararm%,, Photoshop
return