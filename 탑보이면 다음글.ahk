start:
Loop
{
ImageSearch, x1,y1,877, 994,1044, 1016, *50 탑.png
IF ErrorLevel = 0 
{
Break
}
}
	Gosub 1
Loop 
{
ImageSearch, x1,y1,700,1,800,1080, *50 다음글.png
IF ErrorLevel = 0 
{
	mousemove x1+28,y1+11
	click
	Reload
}
}
	
;--------------------------------------------------------------------------------------	
1:
	Sendinput {Home}
	sleep 100
	Return
	
^]::ExitApp

