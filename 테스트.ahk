DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
Process, Priority,, High
#SingleInstance Force
SetTitleMatchMode, 2 
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
;VarSetCapacity
#Persistent
#KeyHistory 0
#NoEnv

;-----------------------------------------------------------------------------------------------------------
;------------------------------------------------구   이-----------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

Gui,Submit,Nohide
Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
;Gui, Color, EEAA99
gui, font, s10, 굴림
Gui, Add, Text, x0 y0 w82 h20 gbar
;Gui, Add, Text, x56 y0 w15 h15 Right ,|
Gui, Add, Text, x89 y0 w15 h15 gx Left , ⓧ
Gui, Add, DDL, x1 y13 w100 vF gname , 선택|인터페이스|배경화면|로그인화면|스코어스크린
Gui, Show, x812 y100 w102 h35 ,
;WinSet, TransColor, EEAA99
Return

;-----------------------------------------------------------------------------------------------------------
bar:

PostMessage, 0xa1,2,,,A
Return
;-----------------------------------------------------------------------------------------------------------
name:

Gui,Submit,Nohide
IF F = 인터페이스
{
	Progress, B1 zh0 fs18 Center , 인터페이스선택  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
}
IF F = 배경화면
{
	Progress, B1 zh0 fs18 Center , 배경화면선택  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
}
IF F = 로그인화면
{
	Progress, B1 zh0 fs18 Center , 로그인화면선택  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
}
IF F = 스코어스크린
{
	Progress, B1 zh0 fs18 Center , 스코어스크린선택  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
}
;-----------------------------------------------------------------------------------------------------------
F1::

Gui,Submit,Nohide

IF F = 인터페이스
{
	goto 인터페이스1
}
IF F = 배경화면
{
	goto 배경화면1
}
IF F = 로그인화면
{
	goto 로그인화면1
}
IF F = 스코어스크린
{
	goto 스코어스크린1
}
;-----------------------------------------------------------------------------------------------------------1번파일

인터페이스1:

Sendinput o
Winwait 열기
Sendinput in1.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in1
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------2번파일
Sendinput o
Winwait 열기
Sendinput in2.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in2
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------3번파일
Sendinput o
Winwait 열기
Sendinput in3.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in3
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------4번파일
Sendinput o
Winwait 열기
Sendinput in4.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in4
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------5번파일
Sendinput o
Winwait 열기
Sendinput in5.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in5
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------6번파일
Sendinput o
Winwait 열기
Sendinput in6.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in6
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼

Return
;-----------------------------------------------------------------------------------------------------------
배경화면1:

Return
;-----------------------------------------------------------------------------------------------------------1번파일
Sendinput o
Winwait 열기
Sendinput in6.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in6
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------2번파일
Sendinput o
Winwait 열기
Sendinput in6.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in6
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------3번파일
Sendinput o
Winwait 열기
Sendinput in6.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in6
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼
;-----------------------------------------------------------------------------------------------------------4번파일
Sendinput o
Winwait 열기
Sendinput in6.png
Sendinput {Enter}
Winwaitclose 열기
Sendinput  c
Winwait 다른 이름으로 저장
Sendinput in6
Sendinput {Enter}
Winwait 다른 이름으로 저장 확인,,1
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
	
}
Winwait 暠튬醴좆 ;퀄리티
Sendinput 100
sleep 200 ;퀄리티
Sendinput {Enter}
Winwaitclose 暠튬醴좆

Winwait 色深??,,0 ;24비트인지 32비트인지 선택(blp→??)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}
Winwait 透明度?置,,0 ;RGB(jpg,tga→blp)
IF ErrorLevel = 0
{
	Sendinput o
}
IF ErrorLevel = 1
{
}

Winwait BLP瘻뻣蘿刻넋埼 ;마지막창
Winclose BLP瘻뻣蘿刻넋埼

;-----------------------------------------------------------------------------------------------------------
로그인화면1:

Return

;-----------------------------------------------------------------------------------------------------------

스코어스크린1:

Return

;-----------------------------------------------------------------------------------------------------------

	
;-----------------------------------------------------------------------------------------------------------

^]::
x:
GuiClose:
Gui,Submit,Nohide
ExitApp
