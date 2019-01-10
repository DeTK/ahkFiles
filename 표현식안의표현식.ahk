


arr1 := ["일이였다"]
arr2 := ["그럼 2인가?","나만있는거지롱"]
arr3 := ["그럼 3이지"]
arr4 := ["결국 4였다"]


    

F1::

Loop, 4
{
    var := arr%A_Index%[2]
    ToolTip, % var
    Sleep, 500
}
Return