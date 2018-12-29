test := "ab1.1 22 33 44 55 66 77 88 99 0.0yz"

Pos=1
While Pos :=    RegExMatch(test, "[\d\.]+", m,Pos+StrLen(m))
   str .= ((A_Index=1) ? "" : "`n") "Match #" A_Index " = " m
msgbox, %str%
return