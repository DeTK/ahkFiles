SetTitleMatchMode, 2
DetectHiddenText, On
#WinActivateForce
CoordMode, Mouse, Relative
SetMouseDelay, -1
ToolTip, 실행됨
Sleep, 1000
ToolTip

F1::
b := 1
while (b != 0)
{
    WinGet, id, list,,, Program Manager
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGetTitle, this_title, ahk_id %this_id%
        if (InStr(this_title, "이용자정보 입력") != 0)
        {
            WinActivate, ahk_id %this_id%
            ImageSearch, x, y, 1, 1, A_ScreenWidth, A_ScreenHeight, D:\Desktop\ok.png
            if (ErrorLevel == 0)
            {
                b := 0
                Click, %x% %y%
                ImageSearch, x, y, 1, 1, A_ScreenWidth, A_ScreenHeight, D:\Desktop\end.png
                if (ErrorLevel == 0)
                {
                    Click, %x% %y%
                    Break
                }       
            }       
        }
    }
    Break
}
return

1::
ToolTip, 1번 10일,,,2
SendInput, {Numpad1}{Numpad0}{tab}{Numpad1}{Numpad4}{tab}{enter}
return
2::
ToolTip, 2번 31일,,,2
SendInput, {Numpad3}{Numpad1}{tab}{Numpad1}{Numpad4}{tab}{enter}
return
3::
ToolTip, 3번 3일,,,2
SendInput, {Numpad3}{tab}{Numpad1}{Numpad4}{tab}{enter}
return
4::
ToolTip, 2번 14일,,,2
SendInput, {Numpad1}{Numpad4}{tab 2}{enter}
return
5::
ToolTip, 5번 6일,,,2
SendInput, {Numpad6}{tab 2}{enter}
return
6::
ToolTip, 6번 13일,,,2
SendInput, {Numpad1}{Numpad3}{tab 2}{enter}
return
7::
ToolTip, 7번 20일,,,2
SendInput, {Numpad2}{Numpad0}{tab 2}{enter}
return
8::
ToolTip, 8번 27일,,,2
SendInput, {Numpad2}{Numpad7}{tab 2}{enter}
return

[::
ToolTip, 대림 주말 공휴일 10일 = 1번 3일 = 3번,,,3
Clipboard := "reservationApp('S181228141559214841')"
SendInput, ^v{enter}
return

]::
ToolTip, 대림 평일 31일 = 2번,,,3
Clipboard := "reservationApp('S181228131607891777')"
SendInput, ^v{enter}
return