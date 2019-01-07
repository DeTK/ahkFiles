; 예제 1: 태스크 바 위에서 마우스 휠을 스크롤해서 볼륨을 조절합니다.
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

; 예제 2: 모든 편집 콘트롤을 위한 간단한 단어-삭제 단축키.
#If ActiveControlIsOfClass("Edit")
^BS::Send ^+{Left}{Del}
^Del::Send ^+{Right}{Del}

ActiveControlIsOfClass(Class) {
    ControlGetFocus, FocusedControl, A
    ControlGet, FocusedControlHwnd, Hwnd,, %FocusedControl%, A
    WinGetClass, FocusedControlClass, ahk_id %FocusedControlHwnd%
    return (FocusedControlClass=Class)
}

; 예제 3: 문맥-감지 핫키.
#If
Esc::ExitApp

; 예제 4: 동적인 핫키. 예제 1을 필요로 함.
NumpadAdd::
Hotkey, If, MouseIsOver("ahk_class Shell_TrayWnd")
if (doubleup := !doubleup)
    Hotkey, WheelUp, DoubleUp
else
    Hotkey, WheelUp, WheelUp
return

DoubleUp:
Send {Volume_Up 2}
return