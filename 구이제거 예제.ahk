
gui,add,edit,hwnde1, 난 파괴될꺼야 ㅠㅠ
gui,show,, 난파괴될듯
return

F1::
WinExist("난파괴될듯")
DllCall("DestroyWindow",UInt,e1) ; 다 파괴해버린다 ㅂㄷㅂㄷ
return

GuiClose:
ExitApp