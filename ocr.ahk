#include <Vis2>
CoordMode, mouse, Screen
CoordMode, Pixel, Screen
SetBatchLines, -1
SetDefaultMouseSpeed, 0
SetTitleMatchMode, 2
F1::
WinActivate, 이용자정보
WinGetTitle, this_title, 이용자정보 입력
if (InStr(this_title, "이용자정보 입력") != 0)
{
    WinGetPos, wx, wy,,, ahk_id %this_id%
        wx := wx + 163
        wy := wy + 422
        ; tooltip, %  wx "  " wy
        ; MouseMove, %wx%, %wy%
    a:
    Loop
    {
        text := OCR([wx, wy, 140, 52])
        RegEx := RegExReplace(text, "\D")
        ; ToolTip, % RegEx,1000,,5
        if (StrLen(RegEx) == 6)
        {
            tempx := wx + 75
            tempy := wy + 60    
            Click, %tempx% %tempy%
            SendInput, ^a{Del}%RegEx%
            tempx := wx + 150
            tempy := wy + 60
            sleep, 50
            Click, %tempx% %tempy%
            tempx := wx + 700
            tempy := wy + 190
            Click, %tempx% %tempy%
            sleep, 50
            ImageSearch, x, y, 1, 1, A_ScreenWidth, A_ScreenHeight, D:\Desktop\end.png
            if (ErrorLevel == 0)
            {
                Click, %x% %y%
            }       
            break a
        }
        else
        {
            tempx := wx + 142
            tempy := wy + 15
            Click, %tempx% %tempy%
            sleep, 15
        }
    }
}    
return

F2::Reload