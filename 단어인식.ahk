﻿

s1 := [[1604, 226], [1405, 214], [1136, 794], [1134, 840], [1094,994]]
s2 := [[1101, 673], [1406, 722], [1131, 793], [1132, 840], [1093, 994]]

ss := s2
F1::

while(ss[A_Index]) ; 0이 나오면 브레이크
{
    mouseclick, left , ss[A_Index][1],ss[A_Index][2],1,2
    Sleep, 500
}
ToolTip


Return