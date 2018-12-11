#SingleInstance Force
$space::

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight,*50 파일이름.png
if ErrorLevel = 0
{
	Mousemove, x+400, y+270
	click
	Break
}
}

	Gosub 파일이름클릭후

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight,*50 예.png
if ErrorLevel = 0
{
	Gosub 예눌린후
	Break
}
if ErrorLevel = 1
{
	Gosub 예눌린후1
	Break
}
}
	
Return

;-------------------------------------------------------------

파일이름클릭후:

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

예눌린후:
sendinput y
sleep 100
예눌린후1:
sendinput `n
sleep 100
sendinput 100
sleep 200
sendinput {Enter 3}
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 마지막확인.png
If ErrorLevel = 0
{
	Break
}
}
Sendinput {Enter}
sendinput {o}

Return

^]::exitapp