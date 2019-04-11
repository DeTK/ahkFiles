#NoEnv                                                   ;빈 문자열이 환경변수인지 점검하는걸 패스
#Persistent                                              ;끄거나 Exitapp 만나기 직전 까지 실행된
#KeyHistory 0                                            ;키로그 0
#SingleInstance Force                                    ;스크립트 재실행 허용

SetControlDelay -1                                       ;각 콘트롤 변경 명령어다음에 올 지연시간 0
SetKeyDelay, 0, 0, play                                  ;Send&ContolSend에 의한 각 키눌림 지연시간 0
SetBatchLines, -1  										 ;스크립트 실행시간 최고속도
CoordMode, Mouse, Relative                               ;활성창의 마우스 좌표모드 Relative 절대적
CoordMode, Pixel, Relative                               ;활성창의  픽셀 좌표모드 Relative 절대적
BlockInput, SendAndMouse                                 ;실행중인 스크립트중에 Send&Mouse 입력 방지
Process, Priority,, High                                 ;우선순위를 윈도우즈의 작업 관리자에 보여주는 순위로 변경
SetTitleMatchMode, 2                                     ;창 제목에 WinTitle 일부분만 입력해도 부합
SetControlDelay -1                                       ;각 콘트롤 변경 명령어다음에 올 지연시간 0
;SendMode, input                                          ;Send만 입력해도 Sendinput으로 인식
ListLines, off                                           ;최근에 실행된 스크립트 줄 안보여줌

Gui, +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
 

;Gui, Add, Picture, x0 y0 w18 h18 ,D:\새 폴더 (4)\Users\DeTK\Documents\투명.png
; Generated using SmartGUI Creator 4.0
Gui, Show, x957 y537 h6 w6, 배틀
Gui, Color, FF0000
Gui +LastFound  ; GUI 창을 마지막 발견 창으로 만들어 아래 줄에 사용합니다.
; WinSet, TransColor, FFFFF0

Return
; F6::
; x = 100
; y = 100
; send, {Click, %x% %y%}
; Return
; F1::
; x := (A_ScreenWidth / 2) - 5
; y := (A_ScreenHeight / 2) - 5
; splashimage, 1:,B X%x% Y%y% W5 H5 CWff00004
; Return


F3:: Reload
;캡쳐 범위


F12:: 
GuiClose:
ExitApp

pixelclick(num,color,error)
{
MouseGetPos, px, py
PixelGetColor, colortext, px, py,RGB
PixelSearch, Px1, Py1, px-num, py-num, px+num, py+num, color, error, Fast, RGB
if ErrorLevel = 0
{
	;MouseMove, %px1%, %py1%
	;MsgBox, ,,%colortext%,1
	Clipboard = %colortext%
}
Return %colortext%
}
