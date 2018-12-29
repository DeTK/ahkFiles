F1::
x(1)
return

x(n)
{
    ToolTip,% "t" n, 500, 500, 1
    if (n == 1)
    {
        ToolTip,% "t" n, 600, 500, 2
        x(3)

    }
    if (n == 3)
    {
        ToolTip,% "t" n, 650, 500, 3
    }
}