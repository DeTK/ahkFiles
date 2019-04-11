물약리스트 := ["체력", "마력", "공증", "마증", "피흡", "시향", "방관", "방무", "직타", "방어"]

gui:
gui, submit,nohide
gui,destroy
Gui, Add, GroupBox, x26 y20 w130 h130 +Center, 시약 선택
Gui, Add, CheckBox, x36 y40 w55 h20 vsa1 , 체력
Gui, Add, CheckBox, x36 y60 w55 h20 vsa2 , 마력
Gui, Add, CheckBox, x36 y80 w55 h20 vsa3 , 공증
Gui, Add, CheckBox, x36 y100 w55 h20 vsa4 , 마증
Gui, Add, CheckBox, x36 y120 w55 h20 vsa5 , 피흡
Gui, Add, CheckBox, x96 y40 w55 h20 vsa6 , 시향
Gui, Add, CheckBox, x96 y60 w55 h20 vsa7 , 방관
Gui, Add, CheckBox, x96 y80 w55 h20 vsa8 , 방무
Gui, Add, CheckBox, x96 y100 w55 h20 vsa9 , 직타
Gui, Add, CheckBox, x96 y120 w55 h20 vsa10 , 방어
Gui, Add, Button, x175 y40 w70 h30 g시작, 시작
Gui, Add, Button, x175 y75 w70 h30 g정지, 정지
Gui, Show, xCenter yCenter h170 w265, 시약제조기
return

시작:
GuiControl, Disable, 시작
Gui, Submit, nohide
Loop
{
    sa := sa%A_Index%
    if (sa == 1)
    {
        시약(물약리스트[A_Index])
        
    }
    else if (sa != 0 )
    {
        break
    }
}
return

정지:
GuiControl, Disable, 정지
gui, submit,nohide
pause
return

시약(물약이름)
{
    if (물약이름 == "체력")
    {

    }
    else if (물약이름 == "마력")
    {

    }
    else if (물약이름 == "공증")
    {

    }
    else if (물약이름 == "마증")
    {

    }
    else if (물약이름 == "피흡")
    {

    }
    else if (물약이름 == "시향")
    {

    }
    else if (물약이름 == "방관")
    {

    }
    else if (물약이름 == "방무")
    {

    }
    else if (물약이름 == "직타")
    {

    }
    else if (물약이름 == "방어")
    {

    }
}

GuiClose:
ExitApp