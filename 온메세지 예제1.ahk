global n :=
Gui, Show, w300 h300,
OnMessage(0x200, "마우스무브") ; 앞에인자는 메세지값이고 뒤에인자는 함수명이다. 함수명이므로 아무렇게 지워도 무관하다.
OnMessage(0x201, "클릭")
OnMessage(0x20a, "휠")
; OnMessage(0x20a, "휠", 0) ; 세번째 인자로 0을 주면 해당함수와의 연결을 해제한다.
Return

마우스무브(wParam, lParam, message, hwnd) ; 기본적으로 이벤트에서 가져올수있는 인자들
{
    MouseGetPos, x, y
    ToolTip, % "x = " x " y = " y
}

클릭(wParam, lParam, message, hwnd)
{
    ToolTip, 클릭햇구나?,,,2
}
휠(wParam, lParam, message, hwnd)
{
    if (wParam == 7864320)
    {
        n++
        ToolTip, % n " 번",,,3
    }
    else if (wParam == 4287102976)
    {
        n--
        ToolTip, % n " 번",,,3
    }
}   
