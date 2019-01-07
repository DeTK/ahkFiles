Gui, +LastFound
Gui, Add, DDL, Hidden gl, Option A|Option B|There is no option "C"
ControlGetPos,,, w, h, ComboBox1
Gui, Add, Button, xp yp w%w% h%h% gdoit, You have two options.
; Gui, Add, Button, xp yp w10 h10 gdoit, You have two options.
Gui, Show
Return
GuiClose:
Exitapp
doit:
	Gui, +LastFound
	SendMessage, 0x14F, 1, 0, ComboBox1 ; CB_SHOWDROPDOWN = 0x14F
Return

l:
ToolTip, 들어왓어
Return