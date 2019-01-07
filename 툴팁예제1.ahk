Gui, add, button, w100

Gui, add, button, w100

Gui, add, button, w100

gui, show,w200, AHK Rocks

OnMessage(0x200, "Help")

return

Help(wParam, lParam, Msg) {

MouseGetPos,,,, OutputVarControl

IfEqual, OutputVarControl, Button1

	Help := "my button 1"

else IfEqual, OutputVarControl, Button2

	Help := "my button 2"

else IfEqual, OutputVarControl, Button3

	Help := "my button 3"

ToolTip % Help

}