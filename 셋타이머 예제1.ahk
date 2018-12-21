flag = 1
home::
num1 = 1
num2 = 1
time := A_TickCount
if (flag == 1)
{
    flag = 0
}
else
{
    flag = 1
}
SetTimer, start, on
return

start:
SetTimer, start, off
Loop
{
    if (flag = 1){
        Break
    }
    if (A_TickCount - time >= 5000 * num1){
        num1++
        SendInput, 12
    }
    if (A_TickCount - time >= 1650 * num2)
    {
        num2++
        SendInput, 3
    }
}
return

