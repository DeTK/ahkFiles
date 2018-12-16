
SetTitleMatchMode, 2

global thisLabel, fw, sw

F1::
fw = 65
sw = 66
thisLabel := A_ThisLabel
SetTimer, start, on
Return

F2::
fw = 67
sw = 68
thisLabel := A_ThisLabel
SetTimer, start, on
Return

start:
postM(fw, sw, "제목 없음 - 메모장")
Return

F3::Reload
F4::ExitApp

PostM(firstW, secondW, title)
{
    SetTimer, start, off
    tempLabel := thisLabel
    postmessage, 0x100, firstW, 0, Edit1, %title%
    Sleep, 20
    Loop
    {
        if (tempLabel != thisLabel)
        { 
            break
        }
        postmessage, 0x100, secondW, 0, Edit1, %title%
        Sleep, 40
    } 
}

