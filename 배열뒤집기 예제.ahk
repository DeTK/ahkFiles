


배열 := ["일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
F1::
ToolTip, 배열 뒤집기전
Sleep, 500
for index, value in 배열
{
    ToolTip, % value
    Sleep, 500
}
배열뒤집기(배열)
ToolTip, 배열 뒤집기후
Sleep, 500
for index, value in 배열
{
    ToolTip, % value
    Sleep, 500
}
ToolTip
return




배열뒤집기(ByRef f_Arr)
{
    loop % len := f_Arr.MaxIndex()
        f_Arr.Push(f_Arr.RemoveAt(len - (A_Index - 1)))
    return
}

F2::
ExitApp