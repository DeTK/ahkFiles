SetTitleMatchMode, 2
#InstallKeybdHook
F1::
postmessage, 0x300, 1, 0, Edit1,  제목 없음 - 메모장 
;잘라내기 
Return

F2::
postmessage, 0x301, 1, 0, Edit1,  제목 없음 - 메모장 
;복사 
Return

F3::
postmessage, 0x302, 1, 0, Edit1,  제목 없음 - 메모장 
;붙여넣기 
Return

F4::
postmessage, 0x100, 3, 0, Edit1,  제목 없음 - 메모장 
;복사
Return

F5::
postmessage, 0x100, 0xA2, 1|1|29|1 << 16, Edit1,  제목 없음 - 메모장
postmessage, 0x100, 0x48, 1|1|35|1 << 16, Edit1,  제목 없음 - 메모장
;붙여넣기
Return
msg = 0
F6::
ToolTip, % msg
postmessage, 0x100, msg, ‭0x40230001‬, Edit1,  제목 없음 - 메모장
msg++
;붙여넣기
Return

F7::
h =
ControlGet, h, Hwnd,,, 제목 없음 - 메모장
; Loop
; {
;     GetKeyState, key3, LControl, P  
;     if (key3 == "D")
;     {
;         ToolTip "눌림"
;         Break
;     }
; }
Critical, on
post(h, 0x100, 11)
post(h, 0x100, 0x48)
post(h, 0x101, 0x48)
post(h, 0x101, 11)
Critical, off
Return
uModule = DllCall("LoadLibrary", "Str", "User32.dll", "Ptr")
post(hWnd, Msg, wParam)
{
    DllCall("User32\PostMessage", "int", hWnd, "UInt", Msg, "int", wParam, "int", mvk(wParam, 0))
    DllCall("FreeLibrary", "Ptr", uModule)
}

mvk(ucode, uMapType)
{
    Return DllCall("User32\MapVirtualKey", "UInt", ucode, "UInt", uMapType)
}

rev(str){
return % DllCall("msvcrt.dll\_strrev", "str", str, "cdecl str")
}
F10::


Loop 4
MsgBox, % rev("AaBbCcDd01234")
Return


bitsum(str)
{
    for i, v in StrSplit(str)
    {
        ToolTip % i "  " v
        Sleep, 250
    }
    Return
}
; 31|30|29|28 27 26 25|24|23 22 21 20 19 18 17 16|15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00 << 16
; 키가 눌려지면 1 떼어지면 0    0x8000 0000
; 메세지를 보내기전에 키가 눌려져있으면 1 0x‭4000 0000‬
; 알트키가 눌려졌을때 1 0x‭2000 0000‬
; 사용안함 0x‭1000 0000‬ ~ 0x100 0000
; 확장키가 눌려졌을때 1 0x80 0000
; 스캔코드 0x40 0000 ~ 0x1 0000

; 키의 반복되는 카운트 0x8000 ~ 0x0