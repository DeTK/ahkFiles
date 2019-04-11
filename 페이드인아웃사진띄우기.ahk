Gui, 2:Margin, 0,0
Gui 2:+LastFound
GUI_ID:=WinExist() 
Gui, 2:-Caption +AlwaysOnTop +Border
Gui, 2:Add, Picture, , hyeok.png
Gui,2:Show, AutoSize Hide, HyeokSoft beta

DllCall("AnimateWindow","UInt",GUI_ID,"Int",1000,"UInt","0xa0000")
Sleep 2000
DllCall("AnimateWindow","UInt",GUI_ID,"Int",1000,"UInt","0x90000")
Gui, Show, x1040 y0 h100 w300,HyeokSoft beta