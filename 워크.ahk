SetBatchLines -1
WinWaitActive Warcraft III
#IfWinActive Warcraft III
#SingleInstance force
#Hotstring NoMouse
SetKeyDelay -1, -1
winmove Warcraft III ,,160,90,1600,900
;---------------------------------------------------------------------------------------------------------------------------------------------------------

Loop ;배넷버튼
{
ImageSearch, x1, y1, 1,1, A_ScreenWidth,A_ScreenHeight, *50 Battle.png
if ErrorLevel = 0
{
	sendinput b
	Break
}
}

;---------------------------------------------------------------------------------------------------------------------------------------------------------

Loop ;비밀번호 입력
{
ImageSearch, x1, y1, 1,1, A_ScreenWidth,A_ScreenHeight, *50 비밀번호.png
if ErrorLevel = 0
{
	sendinput 123
	sendinput {Enter}
	Break
}
}

;---------------------------------------------------------------------------------------------------------------------------------------------------------

Loop ;채널 입장
{
ImageSearch, x1, y1, 1,1, A_ScreenWidth,A_ScreenHeight, *50 대화 시작.png
if ErrorLevel = 0
{
	sendinput c
	Break
}
}
Exitapp
