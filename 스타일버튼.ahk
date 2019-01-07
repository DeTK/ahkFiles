#NoEnv
SetBatchLines, -1
#Include Class_ImageButton.ahk
; ----------------------------------------------------------------------------------------------------------------------
Gui, DummyGUI:Add, Pic, hwndHPIC, PIC1.jpg
SendMessage, 0x0173, 0, 0, , ahk_id %HPIC% ; STM_GETIMAGE
HPIC1 := ErrorLevel
GuiColor := "0xffffff"
Gui, Margin, 50, 20
Gui, Font, s10
Gui, Color, %GuiColor%
ImageButton.SetGuiColor(GuiColor)
Gui, Add, Button, vBT1 w200 hwndHBT1, Button 1`nLine 2
Opt1 := [0, 0x80CF0000, , "0xcdcdcdcd", "H", , "0x00ff00", 2]         ; 평평한 배경 및 텍스트 색상
Opt2 := [ "0x12121212", "0x0000ff"]                                          ; 호버
Opt5 := [ , , ,"Gray"]                                      ; 기본 텍스트 색상 -> 애니메이션
If !ImageButton.Create(HBT1, Opt1, Opt2, , , Opt5)
   MsgBox, 0, ImageButton Error Btn1, % ImageButton.LastError
Gui, Show, , Image Buttons
Return
; ----------------------------------------------------------------------------------------------------------------------
GuiClose:
GuiEscape:
ExitApp