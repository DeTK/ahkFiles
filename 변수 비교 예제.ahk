x:=15
y:=15
d=0
iarr := [[1],[2,16],[3,10]] ;

A::
Loop
{
    arr := [d==0] ; 첫번째 표현식
    while(arr[A_index]) {   
        if (arr[4]){
            d = 0
            break
        }
        ToolTip, % d
        d:=iarr[A_index][1]
        x := iarr[A_index][2]
        Sleep, 500
        arr := [d==0, d==1, d==2 and x==16, d==3] ;
    }
}
return