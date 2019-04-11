F1::

WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
    if (InStr(this_title, "이용자정보 입력") != 0)
    {
        WinActivate, ahk_id %this_id%
    }
}

return