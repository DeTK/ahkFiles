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
	send HumanUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send NightElfUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send OrcUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send UndeadUITile01.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send HumanUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send NightElfUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send OrcUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send UndeadUITile02.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send HumanUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send NightElfUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send OrcUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send UndeadUITile03.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send HumanUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send NightElfUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send OrcUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send UndeadUITile04.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send HumanUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send NightElfUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send OrcUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send UndeadUITile-InventoryCover.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send HumanUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send NightElfUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send OrcUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
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
	send UndeadUITile-TimeIndicatorFrame.blp
	sleep 200	
	send {Enter}
	sleep 200
	send !y
	sleep 200	
	send 100
	sleep 200	
	send {Enter}
	sleep 200	
	send {Enter}
return