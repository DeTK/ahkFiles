#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0 
;#NoTrayIcon
#Persistent
#NoEnv
#InstallMouseHook
#InstallKeybdHook

SetTitleMatchMode, 2
;BlockInput, On
CoordMode, Mouse, Relative
CoordMode, Pixel, Relative

Loop {
  MouseGetPos, x, y
  PixelGetColor, color, %x%, %y%, Slow RGB
  ToolTip, x=%x%`ny=%y%`n%color%
}


f2:: ExitApp
f3:: 
Clipboard = PixelSearch, x, y, %x%, %y%, %x%+1, %y%+1, %color%`nif ( ErrorLevel == 0 ) {`n`n}
Reload