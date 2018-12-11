#SingleInstance, force

var :=

Gui, Add, Button,, 버튼
Gui, Add, Button,, 테스트
Gui, Add, Button,, 리로드
Gui, Show, w500 h500
Return

Button버튼:
num++
Gui, Add, Text, x10 w30 h20 v텍스트%num%, 생성
Return

Button테스트:
Gui, Submit, NoHide

Loop {
    상태 := 텍스트%A_Index%

    if (!상태) {
        GuiControl,, 텍스트%num%, 끝
        Break
    } else {
        GuiControl,, 텍스트%A_Index%, 존재
        num := %A_Index%
        
    }
}
Return

Button리로드:
Reload

GuiClose:
ExitApp

