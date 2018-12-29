#NoEnv
#KeyHistory 0 
ListLines, Off 
Process, Priority,, High
SetBatchLines, -1
#SingleInstance force
#Hotstring NoMouse
;#IfWinActive Warcraft III
t1000:=1000
String:=
ret:=0
SetKeyDelay,0,0,play
Blockinput, SendAndMouse




;#######################################################
;###########한영 구분 함수##########
;######################################################



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
    return ErrorLevel
}
 
ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}


;##################################################################




;##################################################################
;##########설정값 및 텍스트파일명 불러오는작업#############
;##################################################################

Count:=0
Loop,*.txt,0,0
    {
        FileNameT=%A_LoopFileName%
        FileListT := FileListT FileNameT "|"
	Count++
    }



CO:=     ;1번째 스탯 카운트
CO1:=     ;2번째 스탯 카운트

SEE:=
iniRead,SEE,save.ini,설정,시야
STAT:=
iniRead,STAT,save.ini,설정,스탯
ST:=
iniRead,ST,save.ini,설정,설정스탯
STN:=
iniRead,STN,save.ini,설정,스탯값
ST1:=
iniRead,ST1,save.ini,설정,설정스탯1
STN1:=
iniRead,STN1,save.ini,설정,스탯값1
Skq:=
iniRead,Skq,save.ini,설정,스킬q
Skw:=
iniRead,Skw,save.ini,설정,스킬w
Ske:=
iniRead,Ske,save.ini,설정,스킬e
Skr:=
iniRead,Skr,save.ini,설정,스킬r
Skt:=
iniRead,Skt,save.ini,설정,스킬t
Stck:=
iniRead,Stck,save.ini,설정,스탯체크
Skck:=
iniRead,Skck,save.ini,설정,스킬체크
Ching:=
iniRead,Ching,save.ini,설정,칭호체크
Wing:=
iniRead,Wing,save.ini,설정,날개체크

;########################################################################################


;########################################################################################
;####################구이 형태랑 변수등 설정###################################
;########################################################################################

Gui, Add, DropDownList, x172 y-51 w130 h90 , 
Gui, Add, DropDownList, x62 y39 w310 h300 vFileSelected gFileChanged, % GUIMakeDropdownList( ReadFile(), FileName)
GuiControl,Choose,FileSelected,%Count%
gosub FileChanged
Gui, Add, Edit, x62 y89 w100 h20 vSEE gSEE, %SEE%

Gui, Add, ComboBox, x232 y89 w110 h400 vSTAT gSTAT Choose%STAT% altsubmit, 올힘|올민|올지|x
Gui, Add, Button, x152 y290 w100 h40 vSAVE gSAVE, 적용
Gui, Add, Text, x42 y69 w70 h20 , 시야
Gui, Add, CheckBox, x212 y69 w90 h20 vStck gStck Checked%Stck%, 스탯

Gui, Add, ComboBox, x212 y129 w40 h300 vST gST Choose%ST% altsubmit, 힘|민|지|x
Gui, Add, ComboBox, x212 y159 w40 h300 vST1 gST1 Choose%ST1% altsubmit, 힘|민|지|x
Gui, Add, Edit, x272 y129 w100 h20 vSTN gSTN,%STN%
Gui, Add, Edit, x272 y159 w100 h20 vSTN1 gSTN1,%STN1%

Gui, Add, CheckBox, x32 y129 w30 h20 vSkq gSkq Checked%Skq%, q
Gui, Add, CheckBox, x32 y153 w30 h35 vChing gChing Checked%Ching%, 칭호
Gui, Add, CheckBox, x62 y129 w30 h20 vSkw gSkw Checked%Skw%, w
Gui, Add, CheckBox, x62 y153 w30 h35 vWing gWing Checked%Wing%, 날개
Gui, Add, CheckBox, x92 y129 w30 h20 vSke gSke Checked%Ske%, e
Gui, Add, CheckBox, x122 y129 w30 h20 vSkr gSkr Checked%Skr%, r
Gui, Add, CheckBox, x152 y129 w30 h20 vSkt gSkt Checked%Skt%, t
Gui, Add, CheckBox, x32 y109 w40 h20  vSkck gSkck Checked%Skck%, 스킬

Gui, Add, Text, x5 y202 w70 h20 , Num1
Gui, Add, Text, x5 y235 w70 h20 , Num2
Gui, Add, Text, x250 y202 w50 h20 , 시간:
Gui, Add, Text, x250 y238 w50 h20 , 시간:
Gui, Add, Text, x15 y260 w300 h13 , 알트 넘패드키 누를시 단발 컨트롤 넘패드 반복
Gui, Add, Text, x15 y275 w300 h13 , 내용에"{"입력시 엔터두번으로인식 
Gui, Add, Text, x15 y290 w130 h13 , 컨트롤 넘패드0반복끄기

Gui, Add, Edit, x50 y199 w180 h20 vF1n,
Gui, Add, Edit, x50 y235 w180 h20 vF2n,
Gui, Add, Edit, x282 y199 w100 h20 vF1t,
Gui, Add, Edit, x282 y235 w100 h20 vF2t,



gosub Ching
gosub Wing
gosub Stck
gosub Skck
gosub Skq
gosub STAT
Gui,Submit
Gui, Show, x127 y87 h340 w400,자동로드
Return

GuiClose:
ExitApp
Return



;#############################################################################################


;########################################################################################
;############설정 저장하는곳#################################
;########################################################################################

SAVE:
Guicontrolget,STAT
Guicontrolget,SEE
Guicontrolget,ST
Guicontrolget,STN
Guicontrolget,ST1
Guicontrolget,STN1
Guicontrolget,Skq
Guicontrolget,Skw
Guicontrolget,Ske
Guicontrolget,Skr
Guicontrolget,Skt
Guicontrolget,Stck
Guicontrolget,Skck
Gui,Submit,nohide
gosub STAT
gosub Skq
iniWrite,%SEE%,Save.ini,설정,시야
iniWrite,%STAT%,Save.ini,설정,스탯
iniWrite,%ST%,save.ini,설정,설정스탯
iniWrite,%STN%,save.ini,설정,스탯값
iniWrite,%ST1%,save.ini,설정,설정스탯1
iniWrite,%STN1%,save.ini,설정,스탯값1
iniWrite,%Skq%,save.ini,설정,스킬q
iniWrite,%Skw%,save.ini,설정,스킬w
iniWrite,%Ske%,save.ini,설정,스킬e
iniWrite,%Skr%,save.ini,설정,스킬r
iniWrite,%Skt%,save.ini,설정,스킬t
iniWrite,%Stck%,save.ini,설정,스탯체크
iniWrite,%Skck%,save.ini,설정,스킬체크
iniWrite,%Ching%,save.ini,설정,칭호체크
iniWrite,%Wing%,save.ini,설정,날개체크




return
return



;############################################################

;########################################################################
;##########시야 값 #############
;########################################################################

SEE:
Gui,submit,nohide 
Guicontrolget,SEE

return
return

;#######################################################################
;##########날개 체크확인#############
;########################################################################

Wing:
Wings:=
Guicontrolget,Wing
if Wing=0
{
Wings=0
}
if Wing=1
{
Wings=1
}

return
return

;########################################################################
;##########칭호 체크확인#############
;########################################################################

Ching:
Chings:=
Guicontrolget,Ching
if Ching=0
{
Chings=0
}
if Ching=1
{
Chings=1
}

return
return


;########################################################################
;##########스탯 체크확인#############
;########################################################################

Stck:
Guicontrolget,Stck
if Stck=0
{
STAT=
ST=
ST1=
Guicontrol,Choose,STAT,4
Guicontrol,Choose,ST,4
Guicontrol,Choose,ST1,4
gosub ST1
Guicontrol,Disable,STAT,
Guicontrol,Disable,ST,
Guicontrol,Disable,ST1,
}
if Stck=1
{
STAT=
ST=
ST1=
Guicontrol,enable,STAT,
Guicontrol,enable,ST,
Guicontrol,enable,ST1,

STAT:=
iniRead,STAT,save.ini,설정,스탯
ST:=
iniRead,ST,save.ini,설정,설정스탯
ST1:=
iniRead,ST1,save.ini,설정,설정스탯1

Guicontrol,Choose,STAT,%STAT%
Guicontrol,Choose,ST,%ST%
Guicontrol,Choose,ST1,%ST1%

gosub ST1
}

return
return


;########################################################################
;##########스탯선택시 영타로 변수값 넣는작업#############
;########################################################################

ST1:
ST:
STAT:
STATs:=
STs:=
ST1s:=
Gui,submit,nohide 
Guicontrolget,STAT
if STAT=1
{
STATs=-dhfgla
}
if STAT=2
{
STATs=-dhfals
}
if STAT=3
{
STATs=-dhfwl
}
if STAT=4
{
STATs=
}

Guicontrolget,ST
if ST=1
{
STs=-gla
}
if ST=2
{
STs=-als
}
if ST=3
{
STs=-wl
}
if ST=4
{
STs=
}
Guicontrolget,ST1
if ST1=1
{
ST1s=-gla
}
if ST1=2
{
ST1s=-als
}
if ST1=3
{
ST1s=-wl
}
if ST1=4
{
ST1s=
}


return
return



;############################################################
;#########스킬체크 확인하는곳##############
;##########################################################

Skck:
Guicontrolget,Skck
Guicontrolget,Skq
Guicontrolget,Skw
Guicontrolget,Ske
Guicontrolget,Skr
Guicontrolget,Skt
if Skck=0
{
Guicontrol,,Skq,0
Guicontrol,,Skw,0
Guicontrol,,Ske,0
Guicontrol,,Skr,0
Guicontrol,,Skt,0
gosub Skq
}
if Skck=1
{

if Skq=0
{
if Skw=0
{
if Ske=0
{
if Skr=0
{
if Skt=0
{
Guicontrol,,Skq,1
Guicontrol,,Skw,1
Guicontrol,,Ske,1
Guicontrol,,Skr,1
Guicontrol,,Skt,1
gosub Skq
}}}}}



Guicontrol,,Skq,%Skq%
Guicontrol,,Skw,%Skw%
Guicontrol,,Ske,%Ske%
Guicontrol,,Skr,%Skr%
Guicontrol,,Skt,%Skt%
gosub Skq
}

return
return


;########################################################################
;##########스킬 체크된것확인해서 변수로 넣어둠######################
;########################################################################

Skq:
Skw:
Ske:
Skr:
SKt:
Skqs:=
Skws:=
Skes:=
Skrs:=
Skts:=

Gui,submit,nohide 
Guicontrolget,Skq
if Skq=1
{
Skqs=qqqq
}
if Skq=0
{
Skqs=
}

Guicontrolget,Skw
if Skw=1
{
Skws=wwww
}
if Skw=0
{
Skillqw=
}

Guicontrolget,Ske
if Ske=1
{
Skes=eeee
}
if Ske=0
{
Skes=
}

Guicontrolget,Skr
if Skr=1
{
Skrs=rrrr
}
if Skr=0
{
Skrs=
}

Guicontrolget,Skt
if Skt=1
{
Skts=tt
}
if Skt=0
{
Skts=
}


return
return





;######################################################################################
;######세이브코드 분석 코드1 코드2 변수 지정해두는곳####
;########################################################################################


FileChanged:
Code1:=
Code2:=
List:=
mx:=
my:=
pos:=
Gui,Submit
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




;######################################################################################
;######세이브시 최근걸로 선택####
;########################################################################################

FileChangedL:
Code1:=
Code2:=
List:=
mx:=
my:=
pos:=
GuiControl,Choose,FileSelected,%Count%
Gui,Submit
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
return
;######################################################################################



;######################################################################################
;######자동로드 매크로 ####
;########################################################################################


F4::
gosub FileChangedL
sendinput,{Enter}
WinGetActiveTitle, tmp1
if (tmp1 = "Warcraft III") {
Loop,5
{
ret := IME_CHECK("Warcraft III") 
}
if %ret%<>0 
{ 
sleep,1
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
if Wings=1
{
sendinput,{Enter}
send,-on
sendinput,{Enter}
}
sleep,10
sendinput,{F1}

WinGetActiveTitle, tmp1
Send,{Enter}
if (tmp1 = "Warcraft III") {
Loop,5
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
if Chings=1
{
sendinput,{Enter}
sendinput,-cldgh
sendinput,{Enter}
}
sleep,100

gosub STN

if (ST<>4){
Loop,%CO%{
sendinput,{Enter}
send,%STs% 9999
sendinput,{Enter}
}
if (STNs=0)
{
goto STNspace
}
sendinput,{Enter}
send,%STs% %STNs%
sendinput,{Enter}
}

STNspace:

gosub STN1

if (ST1<>4){
Loop,%CO1%{
sendinput,{Enter}
send,%ST1s% 9999
sendinput,{Enter}
}
if (STN1s=0)
{
goto STNspace1
}
sendinput,{Enter}
send,%ST1s% %STN1s%
sendinput,{Enter}
}
STNspace1:

sendinput,{Enter}
send,%STATs%
sendinput,{Enter}
sendinput,{F1}
sleep,100
sendinput,o%Skqs%%Skws%%Skes%%Skrs%%Skts%{esc}

gosub FileChanged

return 
return


;######################################################################################
;######세이브####
;########################################################################################

F5::
Loop,5{
WinGetActiveTitle, tmp1
Send,{Enter}
sleep,10
if (tmp1 = "Warcraft III") {
ret := IME_CHECK("Warcraft III") 
if %ret%<>0 
{ 
sleep,10
sendinput,{vk15}
sleep,10
}
}
Send,{Enter}
}
sendinput,{Enter}
sendinput,-save
sendinput,{Enter}

:*B0:-save`n::
sleep,4000
CountT:=0
FileListT:=
Loop,*.txt,0,0
    {
        FileNameT=%A_LoopFileTimeCreated%-%A_LoopFileName%
        FileListT := FileListT FileNameT "|"
	CountT++
    }
__ = 
( 
%FileListT%
) 
@@ := __ 
Sort, @@,D| P1
FileListT:=RegExReplace(@@,"\d{014}-","",ALL)
CountT--
Loop,%CountT%
{
StringGetPos,posT,FileListT,|,                 
StringTrimLeft,FileListT,FileListT,posT+1
}
Guicontrol,,FileSelected,%FileListT%
Count++
gosub FileChangedL
return
return
;######################################################################################




;######################################################################################
;######로드코드 확인용 채팅####
;########################################################################################
F3::
sendinput,{Enter}
WinGetActiveTitle, tmp1
if (tmp1 = "Warcraft III") {
Loop,5
{
ret := IME_CHECK("Warcraft III") 
}
if %ret%<>0 
{ 
sendinput,{vk15}
}
}
sendinput,Text File=%FileSelected%
sendinput,{Enter}
sendinput,{Enter}
sendinput,{Raw}Code1:=
sendinput,{Raw}%Code1%
sendinput,{Enter}
if !(Code2=""){
sendinput,{Enter}
sendinput,{Raw}Code2:=
sendinput,{Raw}%Code2%
sendinput,{Enter}
}
return
return


;######################################################################################





;######################################################################################
;######창 띄우기####
;########################################################################################
F6::
Gui,submit
Gui, Show

return
return
;########################################################################################




;######################################################################################
;######자동방파기####
;########################################################################################

^LButton::
clipboard:=
send,+{HOME}
send,^c
send,{Enter}
send,!g
sleep,2600
send,!c
sleep,2700
send,^v
send,!c

return
return
;########################################################################################




;########################################################################################
;######스탯값9999넘는것 계산식#########
;########################################################################################

STN:
CO:=-1
STNs:=
STNs=%STN%
Loop{
CO++
if(STNs<9999)
{
break
}
STNs-=9999
}
return
return

STN1:
CO1:=-1
STN1s:=
STN1s=%STN1%
Loop{
CO1++
if(STN1s<9999)
{
break
}
STN1s-=9999
}
return
return


;########################################################################



;########################################################################
;#####채팅매크로부분################
;########################################################################

!Numpad1::
F1L:
F1n=
F1t=
Guicontrolget,F1t
Guicontrolget,F1n
F1t:=t1000*F1t
String=%F1n%
gosub Input
sleep,%F1t%
return
return

^Numpad1::
Settimer,F1L,on
return
return

!Numpad2::
F2L:
F2n=
F2t=
Guicontrolget,F2t
Guicontrolget,F2n
F2t:=t1000*F2t
String=%F2n%
gosub Input
sleep,%F2t%
return
return

^Numpad2::
Settimer,F2L,on
return
return


^Numpad0::
Settimer,F1L,Off
Settimer,F2L,Off
return
return







;########################################################################################
;############문장 분석해서 한글 영어 입력하게하는부분#########
;########################################################################################


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
return
return














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
return
}
if @=ㄲ	
{
@=R
return
}
if @=ㄴ	
{
@=s
return
}
if @=ㄷ	
{
@=e
return
}
if @=ㄸ	
{
@=E
return
}
if @=ㄹ	
{
@=f
return
}
if @=ㅁ	
{
@=a
return
}
if @=ㅂ	
{
@=q
return
}
if @=ㅃ	
{
@=Q
return
}
if @=ㅅ	
{
@=t
return
}
if @=ㅆ	
{
@=T
return
}
if @=ㅇ	
{
@=d
return
}
if @=ㅈ	
{
@=w
return
}
if @=ㅉ	
{
@=W 
return
}
if @=ㅊ	
{
@=c 
return
}
if @=ㅋ	
{
@=z 
return
}
if @=ㅌ	
{
@=x 
return
}
if @=ㅍ	
{
@=v 
return
}
if @=ㅎ	
{
@=g 
return
}
if @=ㅏ	
{
@=k 
return
}
if @=ㅐ	
{
@=o 
return
}
if @=ㅑ	
{
@=i 
return
}
if @=ㅒ	
{
@=O 
return
}
if @=ㅓ	
{
@=j 
return
}
if @=ㅔ	
{
@=p 
return
}
if @=ㅕ	
{
@=u 
return
}
if @=ㅖ	
{
@=P 
return
}
if @=ㅗ	
{
@=h 
return
}
if @=ㅘ	
{
@=hk 
return
}
if @=ㅙ	
{
@=ho 
return
}
if @=ㅚ	
{
@=hl 
return
}
if @=ㅛ	
{
@=y 
return
}
if @=ㅜ	
{
@=n 
return
}
if @=ㅝ	
{
@=nj
return
}
if @=ㅞ	
{
@=np 
return
}
if @=ㅟ	
{
@=nl 
return
}
if @=ㅠ	
{
@=b 
return
}
if @=ㅡ	
{
@=m 
return
}
if @=ㅢ	
{
@=ml 
return
}
if @=ㅣ	
{
@=l 
return
}
if @=	
{
@=
return
}
if @=	
{
@= 
return
}
if @=ㄱ	
{
@=r 
return
}
if @=ㄲ	
{
@=R 
return
}
if @=ㄳ	
{
@=rt 
return
}
if @=ㄴ	
{
@=s 
return
}
if @=ㄵ	
{
@=sw 
return
}
if @=ㄶ	
{
@=sg 
return
}
if @=ㄷ	
{
@=e 
return
}
if @=ㄹ	
{
@=f 
return
}
if @=ㄺ	
{
@=fr 
return
}
if @=ㄼ	
{
@=fq 
return
}
if @=ㄽ	
{
@=ft 
return
}
if @=ㄾ	
{
@=fx 
return
}
if @=ㄿ	
{
@=fv
return
}
if @=ㅀ	
{
@=fg 
return
}
if @=ㅁ	
{
@=a 
return
}
if @=ㅂ	
{
@=q
return
}
if @=ㅄ	
{
@=qt 
return
}
if @=ㅃ	
{
@=Q 
return
}
if @=ㅅ	
{
@=t 
return
}
if @=ㅆ	
{
@=T 
return
}
if @=ㅇ	
{
@=d 
return
}
if @=ㅈ	
{
@=w 
return
}
if @=ㅊ	
{
@=c 
return
}
if @=ㅋ	
{
@=z 
return
}
if @=ㅌ	
{
@=x 
return
}
if @=ㅍ	
{
@=v 
return
}
if @=ㅎ	
{
@=g 
return
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

return
return







