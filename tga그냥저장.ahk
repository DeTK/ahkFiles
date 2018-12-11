space::
sendinput,^+s
sleep,300
sendinput,{Enter}
sleep,300
sendinput,y
sleep,1000
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 »Æ¿Œ.png
if ErrorLevel = 0
{
	mousemove,x1+10,y1+10
	mouseclick
}
return

F1::Exitapp