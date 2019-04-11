#Include, MyGdip.ahk
SetTitleMatchMode, 2
global thisID :=
F1::
; WinActivate, ahk_id %thisID%
Click
loop
{
    ImageList := searchInactiveImage(thisID, "D:\Desktop\re.png")
    if (ImageList[1] == 3)
    {
        ImageList := searchInactiveImage(thisID, "D:\Desktop\8-1.png")
        ; ImageList := searchInactiveImage(thisID, "D:\Desktop\8-1.png")
        ToolTip, % 아님
        if (ImageList[1] > 0)
        {
            ToolTip, % "8 보임"
            SoundBeep
            return
        }
        else
        {
            Click
        }
    }
}
return
F2::
WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
    ; ToolTip, % this_title
    ; Clipboard .= this_title
    if (InStr(this_title, "Oxygen") != 0)
    {
        thisID := this_id
    }
}


return

