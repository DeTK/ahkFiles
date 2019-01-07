Gui, Add, Tab2,, 첫번째텝|두번째텝|세번째텝|네번째텝  ; Tab2 vs. Tab requires v1.0.47.05.
; 첫번째 텝 구이 작성
Gui, Add, Checkbox,, 첫번쨰텝
Gui, Add, Text,, 첫번째텝의 텍스트
Gui, Tab, 2
; 두번째 텝 구이 작성
Gui, Add, Checkbox,, 두번쨰텝
Gui, Add, Text,, 두번째텝의 텍스트
Gui, Tab, 3
; 세번째 텝 구이 작성
Gui, Add, Checkbox,, 세번쨰텝
Gui, Add, Text,, 세번째텝의 텍스트
Gui, Tab, 4
; 네번째 텝 구이 작성
Gui, Add, Checkbox,, 네번쨰텝
Gui, Add, Text,, 네번째텝의 텍스트
Gui, Show
return


GuiClose: ; 구이창 끌때 스크립 종료
GuiEscape: ; esc키로 스크립 종료
ExitApp  