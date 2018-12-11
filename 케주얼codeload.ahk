#SingleInstance Force
#NoEnv
#KeyHistory 0 
ListLines, Off 
Process, Priority,, High
SetBatchLines, -1
#Hotstring NoMouse
;#IfWinActive Warcraft III
t1000:=1000
String:=
ret:=0
SetKeyDelay,0,0,play
Blockinput, SendAndMouse
;---------------------------------------------한영 구분 함수
IME_CHECK(WinTitle)

{
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
 
Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    DetectSave := A_DetectHiddenWindows       
    DetectHiddenWindows,ON                          
     SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
    if (DetectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd)
{
    Return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}
;---------------------------------------------설정값 및 텍스트파일명 불러오는작업
Count:=0
Loop,*.txt,0,0
    {
        FileNameT=%A_LoopFileName%
        FileListT := FileListT FileNameT "|"
	Count++
    }
;---------------------------------------------불러오기
iniRead,SEE,save.ini,설정,시야
iniRead,방제목,save.ini,설정,방
iniRead,방타입,save.ini,설정,방종류
;---------------------------------------------구이 형태랑 변수등 설정
Gui,Submit
Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
Gui, Color, EEAA99
gui, font, s10, 굴림
;Gui, Add, Picture, x0 y0 w255 h100,배경.png ;배경
;Gui, Add, Picture, x240 y0 w15 h14gx,끄기.png ;버튼	
Gui, Add, DropDownList, x0 y0 w250 vFileSelected gFileChanged, % GUIMakeDropdownList( ReadFile(), FileName)
GuiControl,Choose,FileSelected,%Count%
gosub FileChanged
Gui, Add, Text, x1 y25 w15 h15 cffffff +BackgroundTrans, 방
Gui, Add, Edit, x18 y24 w50 h15 -e0x200 +BackgroundTrans v방제목 g방제목, %방제목%
Gui, Add, CheckBox, x75 y24 w15 h15 cffffff +border v방타입 g방타입 Checked%방타입%,
Gui, Add, DropDownList, x100 y23 w48 v인원수 G리로드,선택|2|3|4|5|6|7|8|9|10|11
;Gui, Add, Button, x200 y18 w40 h20 v방인원체크 g방인원체크, 적용
Gui, Add, Text, x160 y24 w150 h15 cffffff , -제작자 DeTK
Gui, Show, x812 y100 w255 h40,
WinSet, TransColor, EEAA99
;Gui, Add, Text, x0 y0 w240 h16 cffffff gbar +Border, ;바
iniread, 인원수,save.ini,설정,인원수
Guicontrol, Choose, 인원수, %인원수%
Return
GuiClose:
Gui,Submit,Nohide
iniwrite, %인원수%,save.ini,설정,인원수
ExitApp
;---------------------------------------------방설정저장겸 방파기
::rhrh:: ;고고고
Gui,Submit,nohide
Iniwrite,%방타입%,Save.ini,설정,방종류
If 방타입 = 1
{
Goto 방제목2 ;체크했을때 방파기
}
If 방타입 = 0
{
Goto 방제목1 ;비체크했을때 방들어가기
}
Return
;---------------------------------------------라스트확인
Man := 1
;---------------------------------------------다오면 게임시작
start:
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\마지막확인.png
If ErrorLevel = 0
{
	Break
}
If ErrorLevel = 1
{
	Gosub 방인원체크
	Goto start
}
}
Sendinput, !s
sleep 1000
리로드:
Gui,Submit,Nohide
iniwrite, %인원수%,save.ini,설정,인원수
Reload
Return
;---------------------------------------------끄기버튼
x:
^]:: ;끄기
Gui,Submit,Nohide
iniwrite, %인원수%,save.ini,설정,인원수
Exitapp
Return
;---------------------------------------------이동가능하게 해주는바
bar:
PostMessage, 0xa1,2,,,A
Return
;--------------------------------------------- 방이름 저장
방제목:
Gui,submit,nohide 
Guicontrolget,방제목
Iniwrite,%방제목%,save.ini,설정,방
Return
;---------------------------------------------방타입 저장
방타입:
Gui,submit,nohide 
Iniwrite,%방타입%,save.ini,설정,방종류
Return
;---------------------------------------------방파기
방제목2:
WinActivate Warcraft III
	sendinput !g
sleep 2500
	sendinput !c
sleep,3000
Clipboard=%방제목%
	Sendinput ^v
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\비공개.png
if ErrorLevel = 0
{
	MouseMove x+18,y+42
	Sleep 300
			Click
	sleep 300
			click
	SendInput {Enter}
			click
			Break
}
}
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\체크.png
If ErrorLevel = 0
{
	MouseMove x,y
	Break
}
}
	Goto 방인원체크
Return
;----------------------------------------------방들어가기
방제목1:
WinActivate Warcraft III
	sendinput !g
sleep 2500
Clipboard=%방제목%
	Sendinput ^v`n
	Reload
Return
;---------------------------------------------툴팁
확인:
#Persistent
ToolTip, 들어옴
SetTimer, A, 500
return
A:
SetTimer, A, Off
ToolTip
return
미확인:
#Persistent
ToolTip, 안들어옴
SetTimer, B, 500
return
B:
SetTimer, B, Off
ToolTip
return
;---------------------------------------------인원수
방인원체크:
Gui,Submit,nohide
If 인원수 = 2
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 3
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 4
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 5
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 6
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 7
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 8
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 9
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 10
{
	WinActivate Warcraft III
	Goto 인원수확인
}
If 인원수 = 11
{
	WinActivate Warcraft III
	Goto 인원수확인
}
;---------------------------------------------인원수체크

인원수확인:
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\2.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\3.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\4.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\5.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\6.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\7.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\8.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\9.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\10.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 이미지\11.png
if ErrorLevel = 0
{
	gosub 미확인
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub 확인
	Break
}
}

If (Man = 인원수)
	Goto start
Else
	Man := 1
	Goto 인원수확인

;---------------------------------------------세이브코드 분석 코드1 코드2 변수 지정해두는곳
FileChanged:
Code1:=
Code2:=
List:=
mx:=
my:=
pos:=
Gui,Submit,nohide
Linum=4
FileReadLine, List, %FileSelected%, %Linum%
StringGetPos,pos,List,:, 
SearchY:=pos+2
StringLeft, mx, List, %Pos%
StringMid, my, List, %SearchY%,
StringTrimRight,my,my,4
Code1=%my%    
Linum=5
FileReadLine, List, %FileSelected%, %Linum%        ; 좌표.txt 파일안의 %Linum%번째 줄을 읽어서 List변수에 저장. 
StringGetPos,pos,List,:,                ; List변수에서 comma의 위치를 pos에 저장. 
SearchY:=pos+2                          ; pos+2를 SearchY에 대입. 
                                        ; ( 콤마 오른쪽에 있는 숫자들을 읽기위해) 
StringLeft, mx, List, %Pos%            ;List의 %Pos% 위치의 왼쪽 문자열을 mx에 저장. 
StringMid, my, List, %SearchY%,      ;List의 %SearchY%위치부터 2글자의 문자열을 my에 저장. 
StringTrimLeft,mx,mx,16
StringTrimRight,my,my,4
if mx=Code2
{
Code2=%my%
}

Return

;---------------------------------------------세이브시 최근걸로 선택

FileChangedL:
Code1:=
Code2:=
List:=
mx:=
my:=
pos:=
GuiControl,Choose,FileSelected,%Count%
Gui,Submit,nohide
Linum=4
FileReadLine, List, %FileSelected%, %Linum%
StringGetPos,pos,List,:, 
SearchY:=pos+2
StringLeft, mx, List, %Pos%
StringMid, my, List, %SearchY%,
StringTrimRight,my,my,4
Code1=%my%    
Linum=5
FileReadLine, List, %FileSelected%, %Linum%        ; 좌표.txt 파일안의 %Linum%번째 줄을 읽어서 List변수에 저장. 
StringGetPos,pos,List,:,                ; List변수에서 comma의 위치를 pos에 저장. 
SearchY:=pos+2                          ; pos+2를 SearchY에 대입. 
                                        ; ( 콤마 오른쪽에 있는 숫자들을 읽기위해) 
StringLeft, mx, List, %Pos%            ;List의 %Pos% 위치의 왼쪽 문자열을 mx에 저장. 
StringMid, my, List, %SearchY%,      ;List의 %SearchY%위치부터 2글자의 문자열을 my에 저장. 
StringTrimLeft,mx,mx,16
StringTrimRight,my,my,4
if mx=Code2
{
Code2=%my%
}
Return



ReadFile() {
    Return ReadFiles( "*.txt", 0)
}

GUIMakeDropdownList(list, string="") {
    StringReplace, tmp, list, %string%, %string%"|"
    Return tmp
}
ReadFiles( pattern, folders=0, recurse=0) {
    FileList =
    Loop, %pattern%, %folders%, %recurse%
    {
        FileName=%A_LoopFileTimeCreated%-%A_LoopFileName%
        FileList := FileList FileName "|"
    }
_ = 
( 
%FileList%
) 
@ := _ 
Sort, @,D| P1
FileList:=RegExReplace(@,"\d{014}-","",ALL)
    Return FileList
}
return
;---------------------------------------------자동로드 매크로
F4::
WinActivate Warcraft III
Gosub FileChanged
Gosub FileChangedL
sendinput,{Enter}
WinGetActiveTitle, tmp1
if (tmp1 = "Warcraft III") {
Loop 5
{
ret := IME_CHECK("Warcraft III") 
}
if %ret%<>0 
{ 
sleep,100
sendinput,{vk15}
}
}

sendinput,-load

:*B0:-load`n::
sendinput,{Enter}
sleep,500
sendinput,{Enter}
clipboard=%Code1%
sendinput,^v
sendinput,{Enter}
sleep,700
sendinput,{Enter}
clipboard=%Code2%
sendinput,^v
sendinput,{Enter}
sleep,800
sendinput,{F1}

WinGetActiveTitle, tmp1
Send,{Enter}
if (tmp1 = "Warcraft III") {
Loop 5
{
ret := IME_CHECK("Warcraft III") 
}
if %ret%=0 
{ 
sendinput,{vk15}
}
}
sendinput,{Enter}
sendinput,{Enter}
sendinput,-tldi %SEE%
sendinput,{Enter}
sendinput,{F1}
sleep 500
Sendinput,{Pgdn}
sleep 500
Sendinput,{Pgdn}
Exitapp 

;---------------------------------------------문장 분석해서 한글 영어 입력하게하는부분
Input:
sendinput,{Enter}
문장:=
$:=
문장=%String%
SetFormat, IntegerFast, H 
Loop, Parse, 문장 
$.=(StrLen(Asc(A_LoopField))<6?"00":"")RegExReplace(Asc(A_LoopField),"0x") 
Loop, Parse, $ 
{ 
_.=A_LoopField 
If ! Mod(A_Index,4) 
{ 
@=
@.=Chr("0x"_) 
_:= "0x" _
_:= _ >> 0
한글:=0
if _ between 44032 and 55291
{
gosub Change
한글:=1
StringRight,한글,한글,1
goto 입력
}
if _ between 43360 and 43391
{
gosub Change
한글:=1
StringRight,한글,한글,1
goto 입력
}
if _ between 55216 and 55295
{
gosub Change
한글:=1
StringRight,한글,한글,1
goto 입력
}
if _ between 12593 and 12687
{
gosub Change
한글:=1
StringRight,한글,한글,1
goto 입력
}
if _ between 4352 and 4607
{
gosub Change
한글:=1
StringRight,한글,한글,1
goto 입력
}

입력:

WinGetActiveTitle, tmp1
if (tmp1 = "Warcraft III") {
ret := IME_CHECK("Warcraft III") 
ret := IME_CHECK("Warcraft III") 
StringRight,ret,ret,1
if %ret%<>0 
{ 
send,{vk15}
}
}


if @={
{
@=
sendinput,{Enter}
sendinput,{Enter}
}


if 한글=1
{

send,{vk15}
sleep,5
}
if 한글=0
{
}
sendinput,{Raw}%@%
_= 
} 
}
sleep,3
sendinput,{Enter}
Return

Change:
음절 := asc(@)
초성 := Floor((음절-44032)/588) 
초성 := Chr(12593+초성+(초성<2?0:초성<3?1:초성<6?3:초성<9?10:11)) 
중성 := Chr(Floor(Mod((음절-44032),588)/28)+12623) 
종성 := Mod((음절-44032),28) 
종성 := 종성?Chr(12592+종성+(종성<8?0:종성<18?1:종성<23?2:3)):"" 
if @=ㄱ	
{
@=r
Return
}
if @=ㄲ	
{
@=R
Return
}
if @=ㄴ	
{
@=s
Return
}
if @=ㄷ	
{
@=e
Return
}
if @=ㄸ	
{
@=E
Return
}
if @=ㄹ	
{
@=f
Return
}
if @=ㅁ	
{
@=a
Return
}
if @=ㅂ	
{
@=q
Return
}
if @=ㅃ	
{
@=Q
Return
}
if @=ㅅ	
{
@=t
Return
}
if @=ㅆ	
{
@=T
Return
}
if @=ㅇ	
{
@=d
Return
}
if @=ㅈ	
{
@=w
Return
}
if @=ㅉ	
{
@=W 
Return
}
if @=ㅊ	
{
@=c 
Return
}
if @=ㅋ	
{
@=z 
Return
}
if @=ㅌ	
{
@=x 
Return
}
if @=ㅍ	
{
@=v 
Return
}
if @=ㅎ	
{
@=g 
Return
}
if @=ㅏ	
{
@=k 
Return
}
if @=ㅐ	
{
@=o 
Return
}
if @=ㅑ	
{
@=i 
Return
}
if @=ㅒ	
{
@=O 
Return
}
if @=ㅓ	
{
@=j 
Return
}
if @=ㅔ	
{
@=p 
Return
}
if @=ㅕ	
{
@=u 
Return
}
if @=ㅖ	
{
@=P 
Return
}
if @=ㅗ	
{
@=h 
Return
}
if @=ㅘ	
{
@=hk 
Return
}
if @=ㅙ	
{
@=ho 
Return
}
if @=ㅚ	
{
@=hl 
Return
}
if @=ㅛ	
{
@=y 
Return
}
if @=ㅜ	
{
@=n 
Return
}
if @=ㅝ	
{
@=nj
Return
}
if @=ㅞ	
{
@=np 
Return
}
if @=ㅟ	
{
@=nl 
Return
}
if @=ㅠ	
{
@=b 
Return
}
if @=ㅡ	
{
@=m 
Return
}
if @=ㅢ	
{
@=ml 
Return
}
if @=ㅣ	
{
@=l 
Return
}
if @=	
{
@=
Return
}
if @=	
{
@= 
Return
}
if @=ㄱ	
{
@=r 
Return
}
if @=ㄲ	
{
@=R 
Return
}
if @=ㄳ	
{
@=rt 
Return
}
if @=ㄴ	
{
@=s 
Return
}
if @=ㄵ	
{
@=sw 
Return
}
if @=ㄶ	
{
@=sg 
Return
}
if @=ㄷ	
{
@=e 
Return
}
if @=ㄹ	
{
@=f 
Return
}
if @=ㄺ	
{
@=fr 
Return
}
if @=ㄼ	
{
@=fq 
Return
}
if @=ㄽ	
{
@=ft 
Return
}
if @=ㄾ	
{
@=fx 
Return
}
if @=ㄿ	
{
@=fv
Return
}
if @=ㅀ	
{
@=fg 
Return
}
if @=ㅁ	
{
@=a 
Return
}
if @=ㅂ	
{
@=q
Return
}
if @=ㅄ	
{
@=qt 
Return
}
if @=ㅃ	
{
@=Q 
Return
}
if @=ㅅ	
{
@=t 
Return
}
if @=ㅆ	
{
@=T 
Return
}
if @=ㅇ	
{
@=d 
Return
}
if @=ㅈ	
{
@=w 
Return
}
if @=ㅊ	
{
@=c 
Return
}
if @=ㅋ	
{
@=z 
Return
}
if @=ㅌ	
{
@=x 
Return
}
if @=ㅍ	
{
@=v 
Return
}
if @=ㅎ	
{
@=g 
Return
}





if 초성=ㄱ	
{
초성=r
gosub 중성
}
if 초성=ㄲ	
{
초성=R
gosub 중성
}
if 초성=ㄴ	
{
초성=s
gosub 중성
}
if 초성=ㄷ	
{
초성=e
gosub 중성
}
if 초성=ㄸ	
{
초성=E
gosub 중성
}
if 초성=ㄹ	
{
초성=f
gosub 중성
}
if 초성=ㅁ	
{
초성=a
gosub 중성
}
if 초성=ㅂ	
{
초성=q
gosub 중성
}
if 초성=ㅃ	
{
초성=Q
gosub 중성
}
if 초성=ㅅ	
{
초성=t
gosub 중성
}
if 초성=ㅆ	
{
초성=T
gosub 중성
}
if 초성=ㅇ	
{
초성=d
gosub 중성
}
if 초성=ㅈ	
{
초성=w
gosub 중성
}
if 초성=ㅉ	
{
초성=W 
gosub 중성
}
if 초성=ㅊ	
{
초성=c 
gosub 중성
}
if 초성=ㅋ	
{
초성=z 
gosub 중성
}
if 초성=ㅌ	
{
초성=x 
gosub 중성
}
if 초성=ㅍ	
{
초성=v 
gosub 중성
}
if 초성=ㅎ	
{
초성=g 
gosub 중성
}

중성:

if 중성=ㅏ	
{
중성=k 
gosub 종성
}
if 중성=ㅐ	
{
중성=o 
gosub 종성
}
if 중성=ㅑ	
{
중성=i 
gosub 종성
}
if 중성=ㅒ	
{
중성=O 
gosub 종성
}
if 중성=ㅓ	
{
중성=j 
gosub 종성
}
if 중성=ㅔ	
{
중성=p 
gosub 종성
}
if 중성=ㅕ	
{
중성=u 
gosub 종성
}
if 중성=ㅖ	
{
중성=P 
gosub 종성
}
if 중성=ㅗ	
{
중성=h 
gosub 종성
}
if 중성=ㅘ	
{
중성=hk 
gosub 종성
}
if 중성=ㅙ	
{
중성=ho 
gosub 종성
}
if 중성=ㅚ	
{
중성=hl 
gosub 종성
}
if 중성=ㅛ	
{
중성=y 
gosub 종성
}
if 중성=ㅜ	
{
중성=n 
gosub 종성
}
if 중성=ㅝ	
{
중성=nj
gosub 종성
}
if 중성=ㅞ	
{
중성=np 
gosub 종성
}
if 중성=ㅟ	
{
중성=nl 
gosub 종성
}
if 중성=ㅠ	
{
중성=b 
gosub 종성
}
if 중성=ㅡ	
{
중성=m 
gosub 종성
}
if 중성=ㅢ	
{
중성=ml 
gosub 종성
}
if 중성=ㅣ	
{
중성=l 
gosub 종성
}
if 중성=	
{
중성=
gosub 종성
}

종성:

if 종성=	
{
종성= 
gosub 합치기
}
if 종성=ㄱ	
{
종성=r 
gosub 합치기
}
if 종성=ㄲ	
{
종성=R 
gosub 합치기
}
if 종성=ㄳ	
{
종성=rt 
gosub 합치기
}
if 종성=ㄴ	
{
종성=s 
gosub 합치기
}
if 종성=ㄵ	
{
종성=sw 
gosub 합치기
}
if 종성=ㄶ	
{
종성=sg 
gosub 합치기
}
if 종성=ㄷ	
{
종성=e 
gosub 합치기
}
if 종성=ㄹ	
{
종성=f 
gosub 합치기
}
if 종성=ㄺ	
{
종성=fr 
gosub 합치기
}
if 종성=ㄼ	
{
종성=fq 
gosub 합치기
}
if 종성=ㄽ	
{
종성=ft 
gosub 합치기
}
if 종성=ㄾ	
{
종성=fx 
gosub 합치기
}
if 종성=ㄿ	
{
종성=fv
gosub 합치기
}
if 종성=ㅀ	
{
종성=fg 
gosub 합치기
}
if 종성=ㅁ	
{
종성=a 
gosub 합치기
}
if 종성=ㅂ	
{
종성=q
gosub 합치기
}
if 종성=ㅄ	
{
종성=qt 
gosub 합치기
}
if 종성=ㅃ	
{
종성=Q 
gosub 합치기
}
if 종성=ㅅ	
{
종성=t 
gosub 합치기
}
if 종성=ㅆ	
{
종성=T 
gosub 합치기
}
if 종성=ㅇ	
{
종성=d 
gosub 합치기
}
if 종성=ㅈ	
{
종성=w 
gosub 합치기
}
if 종성=ㅊ	
{
종성=c 
gosub 합치기
}
if 종성=ㅋ	
{
종성=z 
gosub 합치기
}
if 종성=ㅌ	
{
종성=x 
gosub 합치기
}
if 종성=ㅍ	
{
종성=v 
gosub 합치기
}
if 종성=ㅎ	
{
종성=g 
gosub 합치기
}


합치기:
@=%초성%%중성%%종성%

Return