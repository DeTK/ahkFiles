SetBatchLines -1
WinWaitActive Warcraft III
#IfWinActive Warcraft III
#SingleInstance force
#Hotstring NoMouse
SetKeyDelay -1, -1
winmove Warcraft III ,,160,90,1600,900
;---------------------------------------------------------------------------------------------------------------------------------------------------------

Loop ;��ݹ�ư
{
ImageSearch, x1, y1, 1,1, A_ScreenWidth,A_ScreenHeight, *50 Battle.png
if ErrorLevel = 0
{
	sendinput b
	Break
}
}

;---------------------------------------------------------------------------------------------------------------------------------------------------------

Loop ;��й�ȣ �Է�
{
ImageSearch, x1, y1, 1,1, A_ScreenWidth,A_ScreenHeight, *50 ��й�ȣ.png
if ErrorLevel = 0
{
	sendinput 123
	sendinput {Enter}
	Break
}
}

;---------------------------------------------------------------------------------------------------------------------------------------------------------

Loop ;ä�� ����
{
ImageSearch, x1, y1, 1,1, A_ScreenWidth,A_ScreenHeight, *50 ��ȭ ����.png
if ErrorLevel = 0
{
	sendinput c
	Break
}
}
Exitapp
