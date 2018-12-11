#SingleInstance
#NoEnv
#KeyHistory 0 
global pX:=0, pY:=0, eX:=0 ,eY:=0 ,rX:=0 ,rY:=0
SetDefaultMouseSpeed, 0
;SetKeyDelay, 10
;SetMouseDelay, 1
;SetWinDelay, 1
;SetControlDelay, 1
SetBatchLines, -1
ListLines, Off
;CoordMode, Pixel, Screen

Q::
HotKey, Q, Off
name=PlayerHP
ImSea1(name)
If (errorlevel=0)
{
	name=EnemyHP
	ImSea2(name)
	If (errorlevel=0)
	{
		mousegetpos, xx, yy
		upX:=pX+45
		upY:=pY+101
		ueX:=eX+45
		ueY:=eY+101
		tooltip ., %ueX%, %ueY%
		rX:=ueX-upX
		rY:=ueY-upY
		pi=3.141592653589793 
		;Angle:=round(atan2(rX,rY)<0 ? atan2(rX,rY)*180/pi+360:atan2(rX,rY)*180/pi,2) 
		;Angle:=atan2(rX,rY)*180/pi
		;tX:=round(Cos(-Angle)*135,0)+upX
		;tY:=round(Sin(-Angle)*115,0)+upY
		;tooltip %pX% `, %pY% `, %eX% `, %eY% `, %rX% `, %rY% `, %tX% `, %tY% `, %Angle%, 50,50
		if (rX > 0) {
			tX:=upX+100
		}
		else if (rX == 0) {
			tX:=upX
		}
		else {
			tX:=upX-100
		}
		if (rY > 0) {
			tY:=upY+100
		}
		else if (rY == 0) {
			tY:=upY
		}
		else {
			tY:=upY-100
		}
			
		SendInput, q
		MouseClick, left, %tX%, %tY%
		sleep, 70
		MouseClick, Right, %tX%, %tY%
		MouseClick, Right, %tX%, %tY%
		sleep, 70
		MouseClick, Right, %ueX%, %ueY%
		MouseClick, Right, %ueX%, %ueY%
		MouseClick, Right, %ueX%, %ueY%
		mouseMove, %xx%, %yy%
		HotKey, Q, On
	}
	else
	{
		SendInput, q
		MouseClick
		sleep, 70
		MouseClick, Right
		HotKey, Q, On
	}
}
else
{
	SendInput, q
	MouseClick
	sleep, 70
	MouseClick, Right
	HotKey, Q, On
}
return

W::
HotKey, W, Off
name=PlayerHP
ImSea1(name)
If (errorlevel=0)
{
	name=EnemyHP
	ImSea2(name)
	If (errorlevel=0)
	{
		mousegetpos, xx, yy
		upX:=pX+45
		upY:=pY+101
		ueX:=eX+45
		ueY:=eY+101
		tooltip ., ueX+1, ueY+1
		rX:=ueX-upX
		rY:=ueY-upY
		pi=3.141592653589793 
		;Angle:=round(atan2(rX,rY)<0 ? atan2(rX,rY)*180/pi+360:atan2(rX,rY)*180/pi,2) 
		;Angle:=atan2(rX,rY)*180/pi
		;tX:=round(Cos(-Angle)*135,0)+upX
		;tY:=round(Sin(-Angle)*115,0)+upY
		;tooltip %pX% `, %pY% `, %eX% `, %eY% `, %rX% `, %rY% `, %tX% `, %tY% `, %Angle%, 50,50
		if (rX > 0) {
			tX:=upX+100
		}
		else if (rX == 0) {
			tX:=upX
		}
		else {
			tX:=upX-100
		}
		if (rY > 0) {
			tY:=upY+100
		}
		else if (rY == 0) {
			tY:=upY
		}
		else {
			tY:=upY-100
		}
			
		SendInput, w
		MouseClick, left, %tX%, %tY%
		sleep, 50
		MouseClick, Right, %tX%, %tY%
		sleep, 75
		MouseClick, Right, %ueX%, %ueY%
		;mouseMove, %xx%, %yy%
		HotKey, W, On
	}
	else
	{
		SendInput, w
		MouseClick
		sleep, 70
		MouseClick, Right
		HotKey, W, On
	}
}
else
{
	SendInput, w
	MouseClick
	sleep, 70
	MouseClick, Right
	HotKey, W, On
}
return

E::
HotKey, E, Off
name=PlayerHP
ImSea1(name)
If (errorlevel=0)
{
	name=EnemyHP
	ImSea2(name)
	If (errorlevel=0)
	{
		mousegetpos, xx, yy
		upX:=pX+45
		upY:=pY+101
		ueX:=eX+45
		ueY:=eY+101
		rX:=ueX-upX
		rY:=ueY-upY
		pi=3.141592653589793 
		;Angle:=round(atan2(rX,rY)<0 ? atan2(rX,rY)*180/pi+360:atan2(rX,rY)*180/pi,2) 
		;Angle:=atan2(rX,rY)*180/pi
		;tX:=round(Cos(-Angle)*135,0)+upX
		;tY:=round(Sin(-Angle)*115,0)+upY
		;tooltip %pX% `, %pY% `, %eX% `, %eY% `, %rX% `, %rY% `, %tX% `, %tY% `, %Angle%, 50,50
		if (rX > 0) {
			tX:=upX+100
		}
		else if (rX == 0) {
			tX:=upX
		}
		else {
			tX:=upX-100
		}
		if (rY > 0) {
			tY:=upY+100
		}
		else if (rY == 0) {
			tY:=upY
		}
		else {
			tY:=upY-100
		}
			
		SendInput, e
		MouseClick, left, %tX%, %tY%
		sleep, 70
		MouseClick, Right, %tX%, %tY%
		MouseClick, Right, %tX%, %tY%
		sleep, 70
		MouseClick, Right, %ueX%, %ueY%
		MouseClick, Right, %ueX%, %ueY%
		MouseClick, Right, %ueX%, %ueY%
		mouseMove, %xx%, %yy%
		HotKey, E, On
	}
	else
	{
		SendInput, e
		MouseClick
		sleep, 70
		MouseClick, Right
		HotKey, E, On
	}
}
else
{
	SendInput, e
	MouseClick
	sleep, 70
	MouseClick, Right
	HotKey, E, On
}
return


ImSea1(name)
{
	imagesearch,pX,pY,0,0,A_screenwidth,A_screenheight,*50 %A_Workingdir%\%name%.png
}

ImSea2(name)
{
	;tiX:=pX-135
	;tiY:=pY-115
	;taX:=pX+135
	;taY:=pY+115
	imagesearch,eX,eY,0,0,A_screenwidth,A_screenheight,*50 %A_Workingdir%\%name%.png
	;imagesearch,eX,eY,%tiX%,%tiY%,%taX%,%taY%,*50 %A_Workingdir%\%name%.png
}

atan2(x,y) 
{ 
Return dllcall("msvcrt\atan2","Double",y, "Double",x, "CDECL Double") 
} 
