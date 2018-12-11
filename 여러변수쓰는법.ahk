
변수_1 = 변수1인가?     
변수_2 = 변수2였나?
변수_3 = 변수3이였던거같아
F1::
Loop
{
  VAR := 변수_%A_INDEX%
  ToolTip % VAR
  if (A_Index > 3) {
      Break
  } else {
      Sleep, 300
  }
Return

;이렇게하면 루프한번에 모든변수를 읽을수있다.?
