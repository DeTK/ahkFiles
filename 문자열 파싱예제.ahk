
Array := Object()

ToolTip, %arr%
Sleep 250
gui, +AlwaysOnTop
gui, add, Edit, x10 y10 w50 h25 vstr, a,s,d,f,1,2,3,4
gui, add, button, x60 y10 w50 h25 gok, 확인
gui, add, button, x10 y50 w50 h25 greset, 리셋
gui, show, center w200 h100, test
Return

reset:
Reload

ok:
Gui, Submit, NoHide
arr =
tempArray := StrSplit(str, ",")
Loop % tempArray.MaxIndex()
{
    ;ToolTip, % 배열은 tempArray[A_Index]
    Sleep, 100
    Array.push(tempArray[A_Index])
    
    
    arr := "[" """" regexreplace(str, ",", """,""") """" "]"
    ToolTip, % arr
    Sleep 250
}
ToolTip, %arr%
Sleep 250
Return

F1::
for i, v in Array
{
    ToolTip % 배열 i " = " v " = " arr
    Sleep 250
}
Return





