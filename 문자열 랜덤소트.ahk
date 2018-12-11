str = a,b,c,d
Loop, 10
{
Sort, str, Random D,	; ,로 구분되는 문자열을 랜덤 소트
MsgBox, %A_Index% : %str%
}