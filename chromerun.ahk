#SingleInstance, force
DetectHiddenText, On
#NoEnv
CoordMode, Mouse, Relative
SetTitleMatchMode, 2
#WinActivateForce
SetBatchLines, -1
daylist := [1,2,3,4,5,8,9,10,11,12,15,16,17,18,19,22,23,24,25,26,29,30]

Gui, +AlwaysOnTop
Gui, Add, Button, x10 y10 w50 h20 gchromerun, 실행
Gui, Add, Button, xp0 yp25 w60 h20 glistget, 크롬목록
Gui, Add, Button, xp0 yp25 w50 h20 gbora, 보라매
Gui, Add, Edit, xp0 yp25 w50 h20 vnumber, 10
Gui, Add, Button, xp0 yp25 w50 h20 genter, 엔터
Gui, Add, Button, xp0 yp25 w50 h20 gyeyak, 예약
Gui, Add, Button, xp0 yp25 w50 h20 glastpage, 신청
Gui, Add, Button, xp0 yp25 w50 h20 gnext, 다음클릭
Gui, show, w500 h500, 멀티
return


; 크롬실행
chromerun:
loop, % daylist.MaxIndex()
{
    sleep, 750
    day := daylist[A_Index]
    Run, chrome.exe https://yeyak.seoul.go.kr/reservation/login/login.web --user-data-dir="D:\chrome\user"%day%
}
return

listget:
global chrome_list := []
WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
    if (InStr(this_title, "예약"))
    {
        chrome_list.insert(this_id)
    }
}
ToolTip, 리스트
x1 = -500
x2 = -500
Loop, % len := chrome_list.MaxIndex()
{
    i := chrome_list[A_Index]
    if (A_Index > len/2)
    {
        x2 := x2 + 200
        WinMove, ahk_id %i%,, %x2%, 700, 950, 300
    }
    else
    {
        x1 := x1 + 200
        WinMove, ahk_id %i%,, %x1%, 100, 950, 300
    }
    
}
return

bora:
Loop, % chrome_list.MaxIndex()
{
    i := chrome_list[A_Index]
    ;WinActivate, ahk_id %i%
    PostMessage, 0x201, 1, makeLparam(790, 195),, ahk_id %i%
    PostMessage, 0x202, 0, makeLparam(790, 195),, ahk_id %i%
    sleep,100
}
ToolTip, 보라
return
enter:
Loop, % len := chrome_list.MaxIndex()
{
    i := chrome_list[A_Index]
    ;WinActivate,  ahk_id %i%
    PostMessage, 0x100, 0xD, 0x1c0001,,  ahk_id %i%
    PostMessage, 0x101, 0xD, 0xc01c0001,,  ahk_id %i%
    Sleep, number
}

return
yeyak:
Gui, Submit, NoHide
num1 := 1
Loop, % len := chrome_list.MaxIndex()
{
    i := chrome_list[A_Index]
    ;WinActivate,  ahk_id %i%
    PostMessage, 0x201, 1, makeLparam(900, 195),,  ahk_id %i%
    PostMessage, 0x202, 0, makeLparam(900, 195),,  ahk_id %i%
    Sleep, number
}
ToolTip, 20
return

F7::
ToolTip, 로그인
Loop, % chrome_list.MaxIndex()
{
    i := chrome_list[A_Index]
    ;WinActivate,  ahk_id %i%
    PostMessage, 0x201, 1, makeLparam(811, 146),,  ahk_id %i%
    PostMessage, 0x202, 0, makeLparam(811, 146),,  ahk_id %i%
    sleep,1
}
return

F6::
MouseGetPos, x, y
ToolTip, % x "  " y
Clipboard := "makeLparam(" x ", " y ")"
return

makeLparam(x, y)
{
	return x | y << 16
}

GuiClose:
ExitApp


lastpage:
SetTimer, start, 1
return


start:
PostMessage, 0x201, 1, makeLparam(175, 210),,  이용자정보
PostMessage, 0x202, 0, makeLparam(175, 210),,  이용자정보
PostMessage, 0x201, 1, makeLparam(192, 541),,  이용자정보
PostMessage, 0x202, 0, makeLparam(192, 541),,  이용자정보
return

next:
WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
    if (InStr(this_title, "날짜/회차"))
    {
        PostMessage, 0x201, 1, makeLparam(851, 624),,  날짜/회차
        PostMessage, 0x202, 0, makeLparam(851, 624),,  날짜/회차
    }
}
return

