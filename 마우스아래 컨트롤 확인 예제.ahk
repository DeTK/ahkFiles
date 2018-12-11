#SingleInstance, force
SetTitleMatchMode, 2

F1::
ControlGet, out1, Hwnd ,, Button3, 다른 이름으로 저장
ControlGet, out2, Enabled,, Button3, 다른 이름으로 저장
; ControlGet, out3, Selected,, Button3, 다른 이름으로 저장
ToolTip, % out1 "  " out2
눌림 = 0
loop
{
    GetKeyState, key1, Enter, P
    GetKeyState, key2, LButton, P
    MouseGetPos,,,,cid
    ToolTip, % cid
    if ((key1 || key2 == "D") && cid == "Button3")
    {
        눌림 = 1
    }
    else if ((key1 || key2 == "U") && 눌림 == 1)
    {
        MsgBox, 취소가 눌렸습니다.
        Break
    }
}
Return

