#NoEnv ;변수명이 환경변수인지 체크하는걸 무시, 스크립트 속도 상승과 환경변수 혼동으로 인한 버그 방지
#Singleinstance Force ;스크립트를 동시에 한개만 실행
#Persistent ;핫키가 없더라도 스크립트 실행을 유지
SetBatchLines,-1 ;라인간 딜레이를 없애서 속도 상승
ListLines, Off ;스크립트가 최근 실행한 커맨드 표시 안함 = 스크립트 속도 상승
CoordMode, Pixel, Relative ;픽셀 위치 기준을 상대 좌표로 정함
CoordMode, Mouse, Relative ;마우스 위치 기준을 상대 좌표로 정함
SetTitleMatchMode, 2 ;타이틀 매치 모드를 2로 설정 = 창 제목 이름을 일부만 맞아도 적용
F2::Pause
F1::
Sendinput ^!+s
sleep 1500
loop 3
{
	sendinput `n
	sleep 500
}
sleep 1500
Sendinput ^0
sleep 1500
mousemove 519,389  ;메뉴
mouseclick,Right
mousemove 604,635 ;선택영역불러오기
click
winwait 선택 영역 불러오기
mousemove 184,103 ;채널
click
MouseMove 190,149 ;시계커버
click
mousemove 374,60 ;확인
click
Sendinput ^f ;자르기
sleep 1500
Sendinput ^b ;빠른내보내기
sleep 1000
Sendinput 6.png ;파일이름
sleep 1000
sendinput `n
sendinput y
sendinput ^!z ;실행취소
sendinput ^!z ;실행취소
Sendinput ^0
sleep 2000
mousemove 519,389 ;메뉴
mouseclick,Right
mousemove 604,635 ;선택영역불러오기
click
winwait 선택 영역 불러오기
mousemove 184,103 ;채널
click
MouseMove 187,160 ;인벤커버
click
mousemove 374,60 ;확인
click
Sendinput ^f ;자르기
sleep 1500
Sendinput ^b ;빠른내보내기
sleep 1000
Sendinput 5.png ;파일이름
sleep 1000
sendinput `n
sendinput y
sendinput ^!z ;실행취소
sendinput ^!z ;실행취소
Exitapp