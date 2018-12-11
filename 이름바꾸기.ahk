

;2017-02-20 05:24



DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
Process, Priority,, High
#SingleInstance Force
SetTitleMatchMode, 2 
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
;VarSetCapacity
#Persistent
#KeyHistory 0
#NoEnv


Gui,Submit,Nohide
Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
Gui, Add, Text, x0 y0 w895 h10 gbar Center , ;바
Gui, Add, Edit, x2 y54 w440 h20 vfilename1 
Gui, Add, Edit, x462 y11 w440 h20 vfilename11
Gui, Add, Edit, x462 y32 w440 h20 vfilename21
Gui, Add, Edit, x462 y53 w440 h20 vfilename31
Gui, Add, Edit, x462 y74 w440 h20 vfilename41
Gui, Add, Edit, x462 y95 w440 h20 vfilename51
Gui, Add, Edit, x462 y116 w440 h20 vfilename61
Gui, Add, Edit, x2 y184 w440 h20 vfilename2
Gui, Add, Edit, x462 y141 w440 h20 vfilename12
Gui, Add, Edit, x462 y162 w440 h20 vfilename22
Gui, Add, Edit, x462 y183 w440 h20 vfilename32
Gui, Add, Edit, x462 y204 w440 h20 vfilename42
Gui, Add, Edit, x462 y225 w440 h20 vfilename52
Gui, Add, Edit, x462 y246 w440 h20 vfilename62
Gui, Add, Edit, x2 y314 w440 h20 vfilename3
Gui, Add, Edit, x462 y271 w440 h20 vfilename13
Gui, Add, Edit, x462 y292 w440 h20 vfilename23
Gui, Add, Edit, x462 y313 w440 h20 vfilename33
Gui, Add, Edit, x462 y334 w440 h20 vfilename43
Gui, Add, Edit, x462 y355 w440 h20 vfilename53
Gui, Add, Edit, x462 y376 w440 h20 vfilename63
Gui, Add, Edit, x2 y444 w440 h20 vfilename4
Gui, Add, Edit, x462 y401 w440 h20 vfilename14
Gui, Add, Edit, x462 y422 w440 h20 vfilename24
Gui, Add, Edit, x462 y443 w440 h20 vfilename34
Gui, Add, Edit, x462 y464 w440 h20 vfilename44
Gui, Add, Edit, x462 y485 w440 h20 vfilename54
Gui, Add, Edit, x462 y506 w440 h20 vfilename64
Gui, Add, Edit, x5 y530 w440 h20 Center vfilesave, 파일이름
Gui, Add, Button, x462 y530 w440 h20 g변환 , 적    용
Gui, Show, Center h555 w910, New GUI Window
Return

bar:
PostMessage, 0xa1,2,,,A
Return

변환:
Gui,Submit,NoHide
EXITAPP
IniWrite, %filename1%,%filesave%.ini,파일a,파일1
IniWrite, %filename2%,%filesave%.ini,파일a,파일2
IniWrite, %filename3%,%filesave%.ini,파일a,파일3
IniWrite, %filename4%,%filesave%.ini,파일a,파일4
IniWrite, %filename5%,%filesave%.ini,파일a,파일5
IniWrite, %filename6%,%filesave%.ini,파일a,파일6

IniWrite, %filename11%,%filesave%.ini,파일b,파일1
IniWrite, %filename21%,%filesave%.ini,파일b,파일2
IniWrite, %filename31%,%filesave%.ini,파일b,파일3
IniWrite, %filename41%,%filesave%.ini,파일b,파일4
IniWrite, %filename51%,%filesave%.ini,파일b,파일5
IniWrite, %filename61%,%filesave%.ini,파일b,파일6

IniWrite, %filename12%,%filesave%.ini,파일c,파일1
IniWrite, %filename22%,%filesave%.ini,파일c,파일2
IniWrite, %filename32%,%filesave%.ini,파일c,파일3
IniWrite, %filename42%,%filesave%.ini,파일c,파일4
IniWrite, %filename52%,%filesave%.ini,파일c,파일5
IniWrite, %filename62%,%filesave%.ini,파일c,파일6

IniWrite, %filename13%,%filesave%.ini,파일d,파일1
IniWrite, %filename23%,%filesave%.ini,파일d,파일2
IniWrite, %filename33%,%filesave%.ini,파일d,파일3
IniWrite, %filename43%,%filesave%.ini,파일d,파일4
IniWrite, %filename53%,%filesave%.ini,파일d,파일5
IniWrite, %filename63%,%filesave%.ini,파일d,파일6

IniWrite, %filename14%,%filesave%.ini,파일e,파일1
IniWrite, %filename24%,%filesave%.ini,파일e,파일2
IniWrite, %filename34%,%filesave%.ini,파일e,파일3
IniWrite, %filename44%,%filesave%.ini,파일e,파일4
IniWrite, %filename54%,%filesave%.ini,파일e,파일5
IniWrite, %filename64%,%filesave%.ini,파일e,파일6

GuiClose:
ExitApp





























