Gui, Add, Edit, vMyEdit
MyEdit_TT := "변수가 MyEdit 인 컨트롤에 대한 툴팁입니다."
Gui, Add, DropDownList, vMyDDL, Red|Green|Blue
MyDDL_TT := "드롭 다운 목록에서 색상을 선택하십시오."
Gui, Add, Checkbox, vMyCheck, 이 컨트롤에는 툴팁이 없습니다.
Gui, Show
OnMessage(0x200, "WM_MOUSEMOVE")
return

WM_MOUSEMOVE()
{
    static CurrControl, PrevControl, _TT  ; _TT is kept blank for use by the ToolTip command below.
    CurrControl := A_GuiControl
    If (CurrControl <> PrevControl and not InStr(CurrControl, " "))
    {
        ToolTip  ; Turn off any previous tooltip.
        SetTimer, DisplayToolTip, 1000
        PrevControl := CurrControl
    }
    return

    DisplayToolTip:
    SetTimer, DisplayToolTip, Off
    ToolTip % %CurrControl%_TT  ; The leading percent sign tell it to use an expression.
    SetTimer, RemoveToolTip, 3000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}


GuiClose:
ExitApp