Gui, Add, Text, x12 y19 w100 h30 , %t%
Gui, Add, Button, x122 y19 w60 h30 ghide, 찾기
Gui, Add, Button, x182 y19 w60 h30 , 숨기기
; Generated using SmartGUI Creator 4.0
Gui, Show, x344 y236 h63 w253, New GUI Window
Return


hide:
Gui, Submit, NoHide
loop
{
GetKeyState, UP, LButton, P
if (UP == "D")
{
	WinGetTitle, t
	MsgBox % t
	GuiControl, , Text1, %t%
	WinHide,%t%
	Break
}
}
Return



GuiClose:
ExitApp