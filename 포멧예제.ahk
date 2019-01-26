F1::
arr := [Random(0, 255), Random(0, 255), Random(0, 255)]
tooltip, % convert("X", arr)
return


/*
    
*/
; 링크 = http://autohotkeykr.sourceforge.net/docs/commands/Format.htm
; 포맷
; 함수명 = Convert (변환)
; 인  자
; c_Type = 포맷타입
; c_Arr = 리스트
; 리턴값 = 포맷후 반환
Convert(c_Type, c_Arr)
{
    while (c_Arr[A_index])
    {
        c_String .= "{:" c_Type "}"
    }
    Return Format(c_String , c_Arr*)
}



Random(min, max)
{
    Random, r, min, max
    Return r
}


F2::
Reload