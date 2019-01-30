

Block_Hotkey("Space")
; Sleep, 500
MouseGetPos, x, y
ToolTip, % "x = " x " y = " y " (해당키가 눌려야 나온다.)"
return

Block_Hotkey(Hotkey) 
{
    Hotkey, % Hotkey, re
    Keywait, % Hotkey, D  ; 해당키의 다운을 기다림
    Keywait, % Hotkey     ; 해당키의 업을 기다림
    Hotkey, % Hotkey, off ; 이키가 다시 키로서 역활을 하게하기위해서 오프시켜준다.
    return

    re:
    ; ToolTip, % Hotkey " 눌림"
    return
}

; 이렇게 사용하면 해당키의 입력을 막으면서 핫키로써 역활을 수행할수있다.
; 예제에 나온 대로 스크립트 실행후 스페이스를 눌려보면 스페이스를 눌렸는데도 스페이스가 작동을 안한다.