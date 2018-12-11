SetTitleMatchMode, 2
#InstallKeybdHook
F1::
postmessage, 0x300, 1, 0, Edit1,  제목 없음 - 메모장 
;잘라내기 
Return

F2::
postmessage, 0x301, 1, 0, Edit1,  제목 없음 - 메모장 
;복사 
Return

F3::
postmessage, 0x302, 1, 0, Edit1,  제목 없음 - 메모장 
;붙여넣기 
Return

F4::
postmessage, 0x100, 3, 0, Edit1,  제목 없음 - 메모장 
;복사
Return

F5::
postmessage, 0x100, 0xA2, 1|1|29|1 << 16, Edit1,  제목 없음 - 메모장
postmessage, 0x100, 0x48, 1|1|35|1 << 16, Edit1,  제목 없음 - 메모장
;붙여넣기
Return
msg = 0
F6::
ToolTip, % msg
postmessage, 0x100, msg, ‭0x40230001‬, Edit1,  제목 없음 - 메모장
msg++

;붙여넣기
Return

; 31|30|29|28 27 26 25|24|23 22 21 20 19 18 17 16|15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00 << 16
; 키가 눌려지면 1 떼어지면 0
; 메세지를 보내기전에 키가 눌려져있으면 1
; 알트키가 눌려졌을때 1
; 사용안함
; 확장키가 눌려졌을때 1
; 스캔코드
; 키의 반복되는 카운트