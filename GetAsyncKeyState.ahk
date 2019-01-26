
#Include, MyLib.ahk

F1::
tooltip, % GetAsyncKeyState(0x25)
Return

; 실시간 키상태 확인 예제
GetAsyncKeyState(key)
{
    return Format("{:X}", DllCall("user32\GetAsyncKeyState", "int", 0x25) & 0x8000)
}

F2::
arr := 13
MsgBox % Format("{1:X}", arr)
Return

F3::Reload