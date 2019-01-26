#SingleInstance, force
#NoEnv
ListLines, off
#KeyHistory, 10
Process, priority,, High
SetBatchLines, -1
SetWinDelay, -1
SetControlDelay, -1
#Persistent
; Gui Color, 0,0                  ; 검은
; Gui -Caption +ToolWindow +E0x20 ; 제목 표시 줄 없음, 작업 표시 줄 단추 없음, 투명
; Gui Show, x0 y0 W%A_ScreenWidth% H%A_ScreenHeight%             ; 반투명 창 만들기
; WinGet ID, ID, A                ; ... HWND / 핸들 ID 포함
; Winset AlwaysOnTop, ON, ahk_id %ID%     ; 언제나 맨 위에 올려 놓으십시오.
; WinSet Transparent, 0, ahk_id %ID%
; Return

#InstallKeybdHook
#InstallMouseHook




Loop 
{
    ToolTip, % A_PriorKey
}

    ; Sleep, 1
    ; ctrlkey := GetKeyState("LControl", "P")  ; 현재왼쪽컨트롤의 상태 1 = 눌림 0 = 뗌
    ; altkey := GetKeyState("LAlt", "P")  ; 현재왼쪽알트의 상태 1 = 눌림 0 = 뗌
        
    ; OnMessage(0x20a, "휠")    
    
    ; ToolTip, % wheelnum
    ; if (tempkey != A_PriorKey)  ; 이전키와 현재키가 다른경우
    ; {        
    ;     ; wheelupkey := GetKeyState("WheelUp", "P")  ; 현재휠업키의 상태 1 = 눌림 0 = 뗌
    ;     ; wheeldownkey := GetKeyState("WheelDown", "P")  ; 현재휠다운키의 상태 1 = 눌림 0 = 뗌

    ;     ;~ ToolTip, % "ctrl = " ctrlkey " alt = " altkey " wheelup = " wheelupkey " wheeldown = " wheeldownkey
    ;     ;          컨트롤키가 눌려있으면서  다음에 눌린키가 컨트롤키가 아닌경우    알트키가 눌려있으면서  다음에 눌린키가 알트키가 아닌경우
    ;     tempstr := ctrlkey == 1 && A_PriorKey != "LControl" ? "LControl + " : altkey == 1 && A_PriorKey != "LAlt" ? "LAlt + " :

       
    ;     Critical, on
    ;     SplashImageGUI(tempstr A_PriorKey, false)
    ;     Critical, off
    ;     tempkey := A_PriorKey  ; 현재키를 저장 해서 다음에 누른키와 비교하기위해
    ; }
; 휠(wParam, lParam, message, hwnd)
; {
;     wheelnum := wParam
; }

SplashImageGUI(Str, Transparent = false)
{
    CoordMode, Mouse, Screen
    Gui, XPT99:Destroy
    Gui, XPT99:Margin, 10, 5
    Gui, XPT99:font, s30 cwhite, 고딕체
    Gui, XPT99:Add, Text, center, %Str%
    Gui, XPT99:Color, 333333
    Gui, XPT99:+LastFound -Caption +AlwaysOnTop +ToolWindow -Border
    If Transparent
    {
        Winset, TransColor, 333333
    }
    X = center
    Y = 1000
    Gui, XPT99:Show, x%X% y%Y% NoActivate AutoSize    
    return
}