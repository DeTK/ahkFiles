#NoEnv ;변수명이 환경변수인지 체크하는걸 무시, 스크립트 속도 상승과 환경변수 혼동으로 인한 버그 방지
#Singleinstance Force ;스크립트를 동시에 한개만 실행
#Persistent ;핫키가 없더라도 스크립트 실행을 유지
SetBatchLines,-1 ;라인간 딜레이를 없애서 속도 상승
ListLines, Off ;스크립트가 최근 실행한 커맨드 표시 안함 = 스크립트 속도 상승
CoordMode, Pixel, Relative ;픽셀 위치 기준을 상대 좌표로 정함
CoordMode, Mouse, Relative ;마우스 위치 기준을 상대 좌표로 정함
SetTitleMatchMode, 2 ;타이틀 매치 모드를 2로 설정 = 창 제목 이름을 일부만 맞아도 적용
#KeyHistory 0 
Process, Priority,, High
#Hotstring NoMouse
ret:=0
SetKeyDelay,0,0,play
Blockinput, SendAndMouse
F1::
ifwinactive,BLP??精?
	gosub,1
else
	return

;언데드1번
1:
sendinput,c
sleep,300 ;저장다음슬립
sendinput,UndeadUITile01.blp
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,y
sleep,300 ;전반적인 슬립
sendinput,100
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립

;------------------------------------------------------------------------------------

;2번파일불러오기

sendinput,o
sleep,300 ;전반적인 슬립
sendinput,2.png
sleep,300 ;전반적인 슬립
send,{Enter}
sleep,650

;언데드2번

sendinput,c
sleep,300 ;저장다음슬립
sendinput,UndeadUITile02.blp
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,y
sleep,300 ;전반적인 슬립
sendinput,100
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립

;------------------------------------------------------------------------------------

;3번파일불러오기
sleep,300 ;전반적인 슬립
sendinput,o
sleep,300 ;전반적인 슬립
sendinput,3.png
sleep,300 ;전반적인 슬립
send,{Enter}
sleep,650


;언데드3번

sendinput,c
sleep,300 ;저장다음슬립
sendinput,UndeadUITile03.blp
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,y
sleep,300 ;전반적인 슬립
sendinput,100
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
;------------------------------------------------------------------------------------

;4번파일불러오기
sleep,300 ;전반적인 슬립
sendinput,o
sleep,300 ;전반적인 슬립
sendinput,4.png
sleep,300 ;전반적인 슬립
send,{Enter}
sleep,650

;언데드4번

sendinput,c
sleep,300 ;저장다음슬립
sendinput,UndeadUITile04.blp
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,y
sleep,300 ;전반적인 슬립
sendinput,100
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
;------------------------------------------------------------------------------------

;5번파일불러오기
sleep,300 ;전반적인 슬립
sendinput,o
sleep,300 ;전반적인 슬립
sendinput,5.png
sleep,300 ;전반적인 슬립
send,{Enter}
sleep,650

;언데드5번

sendinput,c
sleep,300 ;저장다음슬립
sendinput,UndeadUITile-InventoryCover.blp
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,y
sleep,300 ;전반적인 슬립
sendinput,100
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
;------------------------------------------------------------------------------------

;6번파일불러오기
sleep,300 ;전반적인 슬립
sendinput,o
sleep,300 ;전반적인 슬립
sendinput,6.png
sleep,300 ;전반적인 슬립
send,{Enter}
sleep,650

;언데드6번

sendinput,c
sleep,300 ;저장다음슬립
sendinput,UndeadUITile-TimeIndicatorFrame.blp
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,y
sleep,300 ;전반적인 슬립
sendinput,100
sleep,300 ;전반적인 슬립
sendinput,{Enter}
sleep,300 ;전반적인 슬립
sendinput,{Enter}
exitapp
F3::
exitapp