SetTitleMatchMode, 2
DetectHiddenText, On
#WinActivateForce
SetBatchLines, -1
CoordMode, Mouse, Client
CoordMode, Pixel, Client
SetMouseDelay, 1
ToolTip, 실행됨
Sleep, 100
ToolTip

F2::Reload

F1::
ToolTip, 시작
sleep, 1000
ToolTip
Loop
{   
    WinActivate, 이용자정보
    WinGetTitle, this_title, 이용자정보 입력
    if (InStr(this_title, "이용자정보 입력") != 0)
    {
        WinActivate, 이용자정보 입력
        ImageSearch, x, y, 100, 200, 200, 300, *50 D:\Desktop\개인.png
        if (ErrorLevel == 0)
        {
            b := 0
            Click, %x% %y%
            
            Loop,100
            {
                Click, 350 480
            }
            Break
        }
    }
}
