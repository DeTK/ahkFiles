#NoTrayIcon
Gui, +AlwaysOnTop
Gui, Add, Text, x6 y0 w70 h20 , snippet
Gui, Add, Text, x6 y30 w70 h20 , prefix
Gui, Add, Text, x6 y60 w70 h20 , body
Gui, Add, Text, x6 y90 w70 h20 , description
Gui, Add, Edit, x86 y0 w490 h20 vs, Edit
Gui, Add, Edit, x86 y30 w490 h20 vp, Edit
Gui, Add, Edit, x86 y60 w490 h20 vb, Edit
Gui, Add, Edit, x86 y90 w490 h180 vd, Edit
Gui, Show, w586 h289, Untitled GUI
Return

GuiClose:
ExitApp

F2::
Gui, Submit, NoHide

str = "%s%" : {{}`n"prefix" : "%p%",`n"body" : [`n"%b%",`n],`n"description" : "%d%"{Down},
SendInput, %str%
return


