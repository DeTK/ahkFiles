
F1::
first_Time := A_TickCount ; first_Time 변수에 구동시간을 대입한다.
SetTimer, Timer, 1 ; 셋타이머를 1ms 간격으로 실행한다.
Return

Timer:
{
    MouseGetPos, x, y ; 현재 마우스의 위치를 가져온다.
    ToolTip, %A_TickCount%, %x%, %y% ; 툴팁을 띄운다.
    if(A_tickcount - first_Time >= 5000) ;현재 구동시간에서 처음 저장해둔구동시간을 빼서 5초가 지난다면
    {
        ToolTip, 끝, %x%, %y% ; 툴팁을 띄우고
        SetTimer, timer, off ; 셋타이머를 끈다.
    }
    Return
}