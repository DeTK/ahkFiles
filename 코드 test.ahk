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
;###########�ѿ� ���� �Լ�##########
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
;##########������ �� �ؽ�Ʈ���ϸ� �ҷ������۾�#############
;##################################################################

Count:=0
Loop,*.txt,0,0
    {
        FileNameT=%A_LoopFileName%
        FileListT := FileListT FileNameT "|"
	Count++
    }



CO:=     ;1��° ���� ī��Ʈ
CO1:=     ;2��° ���� ī��Ʈ

SEE:=
iniRead,SEE,save.ini,����,�þ�
STAT:=
iniRead,STAT,save.ini,����,����
ST:=
iniRead,ST,save.ini,����,��������
STN:=
iniRead,STN,save.ini,����,���Ȱ�
ST1:=
iniRead,ST1,save.ini,����,��������1
STN1:=
iniRead,STN1,save.ini,����,���Ȱ�1
Skq:=
iniRead,Skq,save.ini,����,��ųq
Skw:=
iniRead,Skw,save.ini,����,��ųw
Ske:=
iniRead,Ske,save.ini,����,��ųe
Skr:=
iniRead,Skr,save.ini,����,��ųr
Skt:=
iniRead,Skt,save.ini,����,��ųt
Stck:=
iniRead,Stck,save.ini,����,����üũ
Skck:=
iniRead,Skck,save.ini,����,��ųüũ
Ching:=
iniRead,Ching,save.ini,����,Īȣüũ
Wing:=
iniRead,Wing,save.ini,����,����üũ

;########################################################################################


;########################################################################################
;####################���� ���¶� ������ ����###################################
;########################################################################################

Gui, Add, DropDownList, x172 y-51 w130 h90 , 
Gui, Add, DropDownList, x62 y39 w310 h300 vFileSelected gFileChanged, % GUIMakeDropdownList( ReadFile(), FileName)
GuiControl,Choose,FileSelected,%Count%
gosub FileChanged
Gui, Add, Edit, x62 y89 w100 h20 vSEE gSEE, %SEE%

Gui, Add, ComboBox, x232 y89 w110 h400 vSTAT gSTAT Choose%STAT% altsubmit, ����|�ù�|����|x
Gui, Add, Button, x152 y290 w100 h40 vSAVE gSAVE, ����
Gui, Add, Text, x42 y69 w70 h20 , �þ�
Gui, Add, CheckBox, x212 y69 w90 h20 vStck gStck Checked%Stck%, ����

Gui, Add, ComboBox, x212 y129 w40 h300 vST gST Choose%ST% altsubmit, ��|��|��|x
Gui, Add, ComboBox, x212 y159 w40 h300 vST1 gST1 Choose%ST1% altsubmit, ��|��|��|x
Gui, Add, Edit, x272 y129 w100 h20 vSTN gSTN,%STN%
Gui, Add, Edit, x272 y159 w100 h20 vSTN1 gSTN1,%STN1%

Gui, Add, CheckBox, x32 y129 w30 h20 vSkq gSkq Checked%Skq%, q
Gui, Add, CheckBox, x32 y153 w30 h35 vChing gChing Checked%Ching%, Īȣ
Gui, Add, CheckBox, x62 y129 w30 h20 vSkw gSkw Checked%Skw%, w
Gui, Add, CheckBox, x62 y153 w30 h35 vWing gWing Checked%Wing%, ����
Gui, Add, CheckBox, x92 y129 w30 h20 vSke gSke Checked%Ske%, e
Gui, Add, CheckBox, x122 y129 w30 h20 vSkr gSkr Checked%Skr%, r
Gui, Add, CheckBox, x152 y129 w30 h20 vSkt gSkt Checked%Skt%, t
Gui, Add, CheckBox, x32 y109 w40 h20  vSkck gSkck Checked%Skck%, ��ų

Gui, Add, Text, x5 y202 w70 h20 , Num1
Gui, Add, Text, x5 y235 w70 h20 , Num2
Gui, Add, Text, x250 y202 w50 h20 , �ð�:
Gui, Add, Text, x250 y238 w50 h20 , �ð�:
Gui, Add, Text, x15 y260 w300 h13 , ��Ʈ ���е�Ű ������ �ܹ� ��Ʈ�� ���е� �ݺ�
Gui, Add, Text, x15 y275 w300 h13 , ���뿡"{"�Է½� ���͵ι������ν� 
Gui, Add, Text, x15 y290 w130 h13 , ��Ʈ�� ���е�0�ݺ�����

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
Gui, Show, x127 y87 h340 w400,�ڵ��ε�
Return

GuiClose:
ExitApp
Return



;#############################################################################################


;########################################################################################
;############���� �����ϴ°�#################################
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
iniWrite,%SEE%,Save.ini,����,�þ�
iniWrite,%STAT%,Save.ini,����,����
iniWrite,%ST%,save.ini,����,��������
iniWrite,%STN%,save.ini,����,���Ȱ�
iniWrite,%ST1%,save.ini,����,��������1
iniWrite,%STN1%,save.ini,����,���Ȱ�1
iniWrite,%Skq%,save.ini,����,��ųq
iniWrite,%Skw%,save.ini,����,��ųw
iniWrite,%Ske%,save.ini,����,��ųe
iniWrite,%Skr%,save.ini,����,��ųr
iniWrite,%Skt%,save.ini,����,��ųt
iniWrite,%Stck%,save.ini,����,����üũ
iniWrite,%Skck%,save.ini,����,��ųüũ
iniWrite,%Ching%,save.ini,����,Īȣüũ
iniWrite,%Wing%,save.ini,����,����üũ




return
return



;############################################################

;########################################################################
;##########�þ� �� #############
;########################################################################

SEE:
Gui,submit,nohide 
Guicontrolget,SEE

return
return

;#######################################################################
;##########���� üũȮ��#############
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
;##########Īȣ üũȮ��#############
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
;##########���� üũȮ��#############
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
iniRead,STAT,save.ini,����,����
ST:=
iniRead,ST,save.ini,����,��������
ST1:=
iniRead,ST1,save.ini,����,��������1

Guicontrol,Choose,STAT,%STAT%
Guicontrol,Choose,ST,%ST%
Guicontrol,Choose,ST1,%ST1%

gosub ST1
}

return
return


;########################################################################
;##########���ȼ��ý� ��Ÿ�� ������ �ִ��۾�#############
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
;#########��ųüũ Ȯ���ϴ°�##############
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
;##########��ų üũ�Ȱ�Ȯ���ؼ� ������ �־��######################
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
;######���̺��ڵ� �м� �ڵ�1 �ڵ�2 ���� �����صδ°�####
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
FileReadLine, List, %FileSelected%, %Linum%        ; ��ǥ.txt ���Ͼ��� %Linum%��° ���� �о List������ ����. 
StringGetPos,pos,List,:,                ; List�������� comma�� ��ġ�� pos�� ����. 
SearchY:=pos+2                          ; pos+2�� SearchY�� ����. 
                                        ; ( �޸� �����ʿ� �ִ� ���ڵ��� �б�����) 
StringLeft, mx, List, %Pos%            ;List�� %Pos% ��ġ�� ���� ���ڿ��� mx�� ����. 
StringMid, my, List, %SearchY%,      ;List�� %SearchY%��ġ���� 2������ ���ڿ��� my�� ����. 
StringTrimLeft,mx,mx,16
StringTrimRight,my,my,4
if mx=Code2
{
Code2=%my%
}

Return




;######################################################################################
;######���̺�� �ֱٰɷ� ����####
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
FileReadLine, List, %FileSelected%, %Linum%        ; ��ǥ.txt ���Ͼ��� %Linum%��° ���� �о List������ ����. 
StringGetPos,pos,List,:,                ; List�������� comma�� ��ġ�� pos�� ����. 
SearchY:=pos+2                          ; pos+2�� SearchY�� ����. 
                                        ; ( �޸� �����ʿ� �ִ� ���ڵ��� �б�����) 
StringLeft, mx, List, %Pos%            ;List�� %Pos% ��ġ�� ���� ���ڿ��� mx�� ����. 
StringMid, my, List, %SearchY%,      ;List�� %SearchY%��ġ���� 2������ ���ڿ��� my�� ����. 
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
;######�ڵ��ε� ��ũ�� ####
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
;######���̺�####
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
;######�ε��ڵ� Ȯ�ο� ä��####
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
;######â ����####
;########################################################################################
F6::
Gui,submit
Gui, Show

return
return
;########################################################################################




;######################################################################################
;######�ڵ����ı�####
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
;######���Ȱ�9999�Ѵ°� ����#########
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
;#####ä�ø�ũ�κκ�################
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
;############���� �м��ؼ� �ѱ� ���� �Է��ϰ��ϴºκ�#########
;########################################################################################


Input:
sendinput,{Enter}
����:=
$:=
����=%String%
SetFormat, IntegerFast, H 
Loop, Parse, ���� 
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
�ѱ�:=0
if _ between 44032 and 55291
{
gosub Change
�ѱ�:=1
StringRight,�ѱ�,�ѱ�,1
goto �Է�
}
if _ between 43360 and 43391
{
gosub Change
�ѱ�:=1
StringRight,�ѱ�,�ѱ�,1
goto �Է�
}
if _ between 55216 and 55295
{
gosub Change
�ѱ�:=1
StringRight,�ѱ�,�ѱ�,1
goto �Է�
}
if _ between 12593 and 12687
{
gosub Change
�ѱ�:=1
StringRight,�ѱ�,�ѱ�,1
goto �Է�
}
if _ between 4352 and 4607
{
gosub Change
�ѱ�:=1
StringRight,�ѱ�,�ѱ�,1
goto �Է�
}

�Է�:

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


if �ѱ�=1
{

send,{vk15}
sleep,5
}
if �ѱ�=0
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
���� := asc(@)
�ʼ� := Floor((����-44032)/588) 
�ʼ� := Chr(12593+�ʼ�+(�ʼ�<2?0:�ʼ�<3?1:�ʼ�<6?3:�ʼ�<9?10:11)) 
�߼� := Chr(Floor(Mod((����-44032),588)/28)+12623) 
���� := Mod((����-44032),28) 
���� := ����?Chr(12592+����+(����<8?0:����<18?1:����<23?2:3)):"" 
if @=��	
{
@=r
return
}
if @=��	
{
@=R
return
}
if @=��	
{
@=s
return
}
if @=��	
{
@=e
return
}
if @=��	
{
@=E
return
}
if @=��	
{
@=f
return
}
if @=��	
{
@=a
return
}
if @=��	
{
@=q
return
}
if @=��	
{
@=Q
return
}
if @=��	
{
@=t
return
}
if @=��	
{
@=T
return
}
if @=��	
{
@=d
return
}
if @=��	
{
@=w
return
}
if @=��	
{
@=W 
return
}
if @=��	
{
@=c 
return
}
if @=��	
{
@=z 
return
}
if @=��	
{
@=x 
return
}
if @=��	
{
@=v 
return
}
if @=��	
{
@=g 
return
}
if @=��	
{
@=k 
return
}
if @=��	
{
@=o 
return
}
if @=��	
{
@=i 
return
}
if @=��	
{
@=O 
return
}
if @=��	
{
@=j 
return
}
if @=��	
{
@=p 
return
}
if @=��	
{
@=u 
return
}
if @=��	
{
@=P 
return
}
if @=��	
{
@=h 
return
}
if @=��	
{
@=hk 
return
}
if @=��	
{
@=ho 
return
}
if @=��	
{
@=hl 
return
}
if @=��	
{
@=y 
return
}
if @=��	
{
@=n 
return
}
if @=��	
{
@=nj
return
}
if @=��	
{
@=np 
return
}
if @=��	
{
@=nl 
return
}
if @=��	
{
@=b 
return
}
if @=��	
{
@=m 
return
}
if @=��	
{
@=ml 
return
}
if @=��	
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
if @=��	
{
@=r 
return
}
if @=��	
{
@=R 
return
}
if @=��	
{
@=rt 
return
}
if @=��	
{
@=s 
return
}
if @=��	
{
@=sw 
return
}
if @=��	
{
@=sg 
return
}
if @=��	
{
@=e 
return
}
if @=��	
{
@=f 
return
}
if @=��	
{
@=fr 
return
}
if @=��	
{
@=fq 
return
}
if @=��	
{
@=ft 
return
}
if @=��	
{
@=fx 
return
}
if @=��	
{
@=fv
return
}
if @=��	
{
@=fg 
return
}
if @=��	
{
@=a 
return
}
if @=��	
{
@=q
return
}
if @=��	
{
@=qt 
return
}
if @=��	
{
@=Q 
return
}
if @=��	
{
@=t 
return
}
if @=��	
{
@=T 
return
}
if @=��	
{
@=d 
return
}
if @=��	
{
@=w 
return
}
if @=��	
{
@=c 
return
}
if @=��	
{
@=z 
return
}
if @=��	
{
@=x 
return
}
if @=��	
{
@=v 
return
}
if @=��	
{
@=g 
return
}





if �ʼ�=��	
{
�ʼ�=r
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=R
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=s
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=e
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=E
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=f
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=a
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=q
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=Q
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=t
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=T
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=d
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=w
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=W 
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=c 
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=z 
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=x 
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=v 
gosub �߼�
}
if �ʼ�=��	
{
�ʼ�=g 
gosub �߼�
}

�߼�:

if �߼�=��	
{
�߼�=k 
gosub ����
}
if �߼�=��	
{
�߼�=o 
gosub ����
}
if �߼�=��	
{
�߼�=i 
gosub ����
}
if �߼�=��	
{
�߼�=O 
gosub ����
}
if �߼�=��	
{
�߼�=j 
gosub ����
}
if �߼�=��	
{
�߼�=p 
gosub ����
}
if �߼�=��	
{
�߼�=u 
gosub ����
}
if �߼�=��	
{
�߼�=P 
gosub ����
}
if �߼�=��	
{
�߼�=h 
gosub ����
}
if �߼�=��	
{
�߼�=hk 
gosub ����
}
if �߼�=��	
{
�߼�=ho 
gosub ����
}
if �߼�=��	
{
�߼�=hl 
gosub ����
}
if �߼�=��	
{
�߼�=y 
gosub ����
}
if �߼�=��	
{
�߼�=n 
gosub ����
}
if �߼�=��	
{
�߼�=nj
gosub ����
}
if �߼�=��	
{
�߼�=np 
gosub ����
}
if �߼�=��	
{
�߼�=nl 
gosub ����
}
if �߼�=��	
{
�߼�=b 
gosub ����
}
if �߼�=��	
{
�߼�=m 
gosub ����
}
if �߼�=��	
{
�߼�=ml 
gosub ����
}
if �߼�=��	
{
�߼�=l 
gosub ����
}
if �߼�=	
{
�߼�=
gosub ����
}

����:

if ����=	
{
����= 
gosub ��ġ��
}
if ����=��	
{
����=r 
gosub ��ġ��
}
if ����=��	
{
����=R 
gosub ��ġ��
}
if ����=��	
{
����=rt 
gosub ��ġ��
}
if ����=��	
{
����=s 
gosub ��ġ��
}
if ����=��	
{
����=sw 
gosub ��ġ��
}
if ����=��	
{
����=sg 
gosub ��ġ��
}
if ����=��	
{
����=e 
gosub ��ġ��
}
if ����=��	
{
����=f 
gosub ��ġ��
}
if ����=��	
{
����=fr 
gosub ��ġ��
}
if ����=��	
{
����=fq 
gosub ��ġ��
}
if ����=��	
{
����=ft 
gosub ��ġ��
}
if ����=��	
{
����=fx 
gosub ��ġ��
}
if ����=��	
{
����=fv
gosub ��ġ��
}
if ����=��	
{
����=fg 
gosub ��ġ��
}
if ����=��	
{
����=a 
gosub ��ġ��
}
if ����=��	
{
����=q
gosub ��ġ��
}
if ����=��	
{
����=qt 
gosub ��ġ��
}
if ����=��	
{
����=Q 
gosub ��ġ��
}
if ����=��	
{
����=t 
gosub ��ġ��
}
if ����=��	
{
����=T 
gosub ��ġ��
}
if ����=��	
{
����=d 
gosub ��ġ��
}
if ����=��	
{
����=w 
gosub ��ġ��
}
if ����=��	
{
����=c 
gosub ��ġ��
}
if ����=��	
{
����=z 
gosub ��ġ��
}
if ����=��	
{
����=x 
gosub ��ġ��
}
if ����=��	
{
����=v 
gosub ��ġ��
}
if ����=��	
{
����=g 
gosub ��ġ��
}


��ġ��:
@=%�ʼ�%%�߼�%%����%

return
return







