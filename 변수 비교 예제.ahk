x:=15
y:=15
d=0
iarr := [[15,15,1],[14,14,2],[16,16,3],[0,0,1]] ;
t=1
A::
arr := [d==0] ; 첫번째 표현식
Loop
{
    
    while(arr[A_index])
    {   
        t := iarr[A_index][3]
        if (!arr[4])
        {
            ax := iarr[A_index][1]
            ay := iarr[A_index][2]
        }
        else
        {
            Break
        }
        Sleep, 500
        ToolTip, % ax " " ay " " t
        arr := [d==0, ax=x and ay=y and t=1, ax=x and ay=x and t=2, ax=x and ax=y and t=3] ;
    }
}
return