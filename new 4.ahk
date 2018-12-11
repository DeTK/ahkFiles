#singleinstance force
NewStr := RegExReplace("abc123abc456", "abc\d+", "", ReplacementCount)  ; ""를 돌려주고 2를 ReplacementCount에 저장합니다.

MsgBox, %ReplacementCount%
Return
