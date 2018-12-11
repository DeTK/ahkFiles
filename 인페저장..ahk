;------------------------------------첫번째파일----------------------------------
F1::
;휴먼
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+100 ;휴먼
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click
	sleep 200
}
	send {Del}
	sleep 200
	sendinput HumanUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;나이트엘프
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+110 ;엘프
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput NightElfUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;오크
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+130 ;오크
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
}
	send {Del}
	sleep 200
	sendinput OrcUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;언데드
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click 
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+145 ;언데드
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput UndeadUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
return
;------------------------------------두번째파일----------------------------------
F2::
;휴먼
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+100 ;휴먼
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click
	sleep 200
}
	send {Del}
	sleep 200
	sendinput HumanUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;나이트엘프
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+110 ;엘프
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput NightElfUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;오크
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+130 ;오크
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
}
	send {Del}
	sleep 200
	sendinput OrcUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;언데드
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click 
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+145 ;언데드
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput UndeadUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
return
;------------------------------------세번째파일----------------------------------
F3::
;휴먼
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+100 ;휴먼
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click
	sleep 200
}
	send {Del}
	sleep 200
	sendinput HumanUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;나이트엘프
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+110 ;엘프
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput NightElfUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;오크
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+130 ;오크
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
}
	send {Del}
	sleep 200
	sendinput OrcUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;언데드
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click 
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+145 ;언데드
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput UndeadUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
return
;------------------------------------네번째파일----------------------------------
F4::
;휴먼
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+100 ;휴먼
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click
	sleep 200
}
	send {Del}
	sleep 200
	sendinput HumanUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;나이트엘프
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+110 ;엘프
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput NightElfUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;오크
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+130 ;오크
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
}
	send {Del}
	sleep 200
	sendinput OrcUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;언데드
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click 
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+145 ;언데드
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput UndeadUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
return
;------------------------------------다섯번째파일----------------------------------
F5::
;휴먼
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+100 ;휴먼
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click
	sleep 200
}
	send {Del}
	sleep 200
	sendinput HumanUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;나이트엘프
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+110 ;엘프
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput NightElfUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;오크
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+130 ;오크
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
}
	send {Del}
	sleep 200
	sendinput OrcUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;언데드
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click 
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+145 ;언데드
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput UndeadUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
return
;------------------------------------여섯번째파일----------------------------------
F6::
;휴먼
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+100 ;휴먼
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click
	sleep 200
}
	send {Del}
	sleep 200
	sendinput HumanUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;나이트엘프
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+110 ;엘프
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput NightElfUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;오크
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+130 ;오크
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
}
	send {Del}
	sleep 200
	sendinput OrcUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
	sleep 200
;언데드
send !c
sleep 200
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+460,y1+42
	Click 
	sleep 200
}
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	Mousemove, x1+250,y1+145 ;언데드
	sleep 200
}
Click 2
ImageSearch, x1, y1, 1,1, 1920, 1080, *50 B.png
if ErrorLevel = 0
{
	sleep 200
	Mousemove, x1+300,y1+338
	Click 
	sleep 200
}
	send {Del}
	sleep 200
	sendinput UndeadUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	;send y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}

Exitapp
F7::Exitapp
return