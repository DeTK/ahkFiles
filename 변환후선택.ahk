#SingleInstance Force
$space::

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight,*50 �����̸�.png
if ErrorLevel = 0
{
	Mousemove, x+400, y+270
	click
	Break
}
}

	Gosub �����̸�Ŭ����

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight,*50 ��.png
if ErrorLevel = 0
{
	Gosub ��������
	Break
}
if ErrorLevel = 1
{
	Gosub ��������1
	Break
}
}
	
Return

;-------------------------------------------------------------

�����̸�Ŭ����:

sleep 200
sendinput ^c
sleep 200
sendinput {enter}
sleep 300
sendinput {c}
sleep 400
sendinput ^v
sleep 200
sendinput {BS 4}
sleep 200
sendinput {enter}
sleep 150

Return

��������:
sendinput y
sleep 100
��������1:
sendinput `n
sleep 100
sendinput 100
sleep 200
sendinput {Enter 3}
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 ������Ȯ��.png
If ErrorLevel = 0
{
	Break
}
}
Sendinput {Enter}
sendinput {o}

Return

^]::exitapp