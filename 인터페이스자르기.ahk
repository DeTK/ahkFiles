#NoEnv ;변수명이 환경변수인지 체크하는걸 무시, 스크립트 속도 상승과 환경변수 혼동으로 인한 버그 방지
#Singleinstance Force ;스크립트를 동시에 한개만 실행
#Persistent ;핫키가 없더라도 스크립트 실행을 유지
SetBatchLines,-1 ;라인간 딜레이를 없애서 속도 상승
ListLines, Off ;스크립트가 최근 실행한 커맨드 표시 안함 = 스크립트 속도 상승
CoordMode, Pixel, Relative ;픽셀 위치 기준을 상대 좌표로 정함
CoordMode, Mouse, Relative ;마우스 위치 기준을 상대 좌표로 정함
SetTitleMatchMode, 2 ;타이틀 매치 모드를 2로 설정 = 창 제목 이름을 일부만 맞아도 적용
;WinGetActiveTitle


ime_status := % IME_CHECK("A") 
if (ime_status = "0") { 
 
} else { 
 Send, {vk15}  
} 
 
IME_CHECK(WinTitle) 
{ 
 WinGet,hWnd,ID,%WinTitle% 
 Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"") 
} 
 
Send_ImeControl(DefaultIMEWnd, wParam, lParam) 
{ 
 DetectSave := A_DetectHiddenWindows 
 DetectHiddenWindows,ON 
 SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd% 
 if (DetectSave <> A_DetectHiddenWindows) 
 DetectHiddenWindows,%DetectSave% 
 return ErrorLevel 
} 
 
ImmGetDefaultIMEWnd(hWnd) 
{ 
 return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint) 
}
F2::Pause
F1::
Sendinput ^!+s
Winwait 웹용으로 저장
Send input {Enter}
winwait 최적화 다른 이름으로 저장
Sendinput {Enter}
Winwait 파일 대체,,0
IF ErrorLevel = 0
{
	Sendinput {Enter}
}
IF ErrorLevel = 1
{
}
Winwaitclose 웹용으로 저장
Sendinput ^0
winwait 선택 영역 불러오기
Winwaitclose 선택 영역 불러오기
Sendinput ^f ;자르기
Sendinput ^b ;빠른내보내기
Winwait 다른 이름으로 저장
sleep 200
Send in6.png ;파일이름
sleep 200
sendinput {Enter}
sleep 200
Winwait 다른 이름으로 저장 확인,,0
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
}
sleep 1500
sendinput ^!z ;실행취소
sendinput ^!z ;실행취소
Sendinput ^0
Pause
Sendinput m
Winwaitclose 선택 영역 불러오기
Sendinput ^f ;자르기
Sendinput ^b ;빠른내보내기
Winwait 다른 이름으로 저장
sleep 200
Send in5.png ;파일이름
sleep 200
sendinput {enter}
sleep 200
Winwait 다른 이름으로 저장 확인,,0
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
}
sleep 1500
sendinput ^!z ;실행취소
sendinput ^!z ;실행취소
Exitapp