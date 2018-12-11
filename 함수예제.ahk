


gui, +AlwaysOnTop
gui, add, Edit, x10 y10 w50 h25,
gui, add, button, x10 y50 w70 h25 gset1, 셋타이머1
gui, add, button, x10 y90 w70 h25 gset2, 셋타이머2
gui, add, button, x100 y50 w50 h25 greset, 리셋
gui, show, center w200 h150, test
Return
reset:
Reload

global masterNum = 

set1:
ToolTip, %  A_ThisLabel,50,, 3
masterNum = 1
SetTimer, test, on

Return


set2:
ToolTip, %  A_ThisLabel,50,, 3
masterNum = 2
SetTimer, test, on

Return




test:
ToolTip, %  A_ThisLabel,50,, 1
함수(masterNum)
Return



함수(num){
ToolTip, % num "," A_ThisLabel,,, 2
SetTimer, test, off
Return
}




GuiClose:
ExitApp