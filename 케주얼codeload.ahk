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
;---------------------------------------------�ѿ� ���� �Լ�
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
;---------------------------------------------������ �� �ؽ�Ʈ���ϸ� �ҷ������۾�
Count:=0
Loop,*.txt,0,0
    {
        FileNameT=%A_LoopFileName%
        FileListT := FileListT FileNameT "|"
	Count++
    }
;---------------------------------------------�ҷ�����
iniRead,SEE,save.ini,����,�þ�
iniRead,������,save.ini,����,��
iniRead,��Ÿ��,save.ini,����,������
;---------------------------------------------���� ���¶� ������ ����
Gui,Submit
Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
Gui, Color, EEAA99
gui, font, s10, ����
;Gui, Add, Picture, x0 y0 w255 h100,���.png ;���
;Gui, Add, Picture, x240 y0 w15 h14gx,����.png ;��ư	
Gui, Add, DropDownList, x0 y0 w250 vFileSelected gFileChanged, % GUIMakeDropdownList( ReadFile(), FileName)
GuiControl,Choose,FileSelected,%Count%
gosub FileChanged
Gui, Add, Text, x1 y25 w15 h15 cffffff +BackgroundTrans, ��
Gui, Add, Edit, x18 y24 w50 h15 -e0x200 +BackgroundTrans v������ g������, %������%
Gui, Add, CheckBox, x75 y24 w15 h15 cffffff +border v��Ÿ�� g��Ÿ�� Checked%��Ÿ��%,
Gui, Add, DropDownList, x100 y23 w48 v�ο��� G���ε�,����|2|3|4|5|6|7|8|9|10|11
;Gui, Add, Button, x200 y18 w40 h20 v���ο�üũ g���ο�üũ, ����
Gui, Add, Text, x160 y24 w150 h15 cffffff , -������ DeTK
Gui, Show, x812 y100 w255 h40,
WinSet, TransColor, EEAA99
;Gui, Add, Text, x0 y0 w240 h16 cffffff gbar +Border, ;��
iniread, �ο���,save.ini,����,�ο���
Guicontrol, Choose, �ο���, %�ο���%
Return
GuiClose:
Gui,Submit,Nohide
iniwrite, %�ο���%,save.ini,����,�ο���
ExitApp
;---------------------------------------------�漳������� ���ı�
::rhrh:: ;����
Gui,Submit,nohide
Iniwrite,%��Ÿ��%,Save.ini,����,������
If ��Ÿ�� = 1
{
Goto ������2 ;üũ������ ���ı�
}
If ��Ÿ�� = 0
{
Goto ������1 ;��üũ������ �����
}
Return
;---------------------------------------------��ƮȮ��
Man := 1
;---------------------------------------------�ٿ��� ���ӽ���
start:
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\������Ȯ��.png
If ErrorLevel = 0
{
	Break
}
If ErrorLevel = 1
{
	Gosub ���ο�üũ
	Goto start
}
}
Sendinput, !s
sleep 1000
���ε�:
Gui,Submit,Nohide
iniwrite, %�ο���%,save.ini,����,�ο���
Reload
Return
;---------------------------------------------�����ư
x:
^]:: ;����
Gui,Submit,Nohide
iniwrite, %�ο���%,save.ini,����,�ο���
Exitapp
Return
;---------------------------------------------�̵������ϰ� ���ִ¹�
bar:
PostMessage, 0xa1,2,,,A
Return
;--------------------------------------------- ���̸� ����
������:
Gui,submit,nohide 
Guicontrolget,������
Iniwrite,%������%,save.ini,����,��
Return
;---------------------------------------------��Ÿ�� ����
��Ÿ��:
Gui,submit,nohide 
Iniwrite,%��Ÿ��%,save.ini,����,������
Return
;---------------------------------------------���ı�
������2:
WinActivate Warcraft III
	sendinput !g
sleep 2500
	sendinput !c
sleep,3000
Clipboard=%������%
	Sendinput ^v
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\�����.png
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
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\üũ.png
If ErrorLevel = 0
{
	MouseMove x,y
	Break
}
}
	Goto ���ο�üũ
Return
;----------------------------------------------�����
������1:
WinActivate Warcraft III
	sendinput !g
sleep 2500
Clipboard=%������%
	Sendinput ^v`n
	Reload
Return
;---------------------------------------------����
Ȯ��:
#Persistent
ToolTip, ����
SetTimer, A, 500
return
A:
SetTimer, A, Off
ToolTip
return
��Ȯ��:
#Persistent
ToolTip, �ȵ���
SetTimer, B, 500
return
B:
SetTimer, B, Off
ToolTip
return
;---------------------------------------------�ο���
���ο�üũ:
Gui,Submit,nohide
If �ο��� = 2
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 3
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 4
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 5
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 6
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 7
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 8
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 9
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 10
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
If �ο��� = 11
{
	WinActivate Warcraft III
	Goto �ο���Ȯ��
}
;---------------------------------------------�ο���üũ

�ο���Ȯ��:
Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\2.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\3.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\4.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\5.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\6.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\7.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\8.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\9.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\10.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

Loop
{
ImageSearch, x,y,1,1,A_ScreenWidth,A_ScreenHeight, *50 �̹���\11.png
if ErrorLevel = 0
{
	gosub ��Ȯ��
	Break
}
if ErrorLevel = 1
{
	Man++
	gosub Ȯ��
	Break
}
}

If (Man = �ο���)
	Goto start
Else
	Man := 1
	Goto �ο���Ȯ��

;---------------------------------------------���̺��ڵ� �м� �ڵ�1 �ڵ�2 ���� �����صδ°�
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

;---------------------------------------------���̺�� �ֱٰɷ� ����

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
;---------------------------------------------�ڵ��ε� ��ũ��
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

;---------------------------------------------���� �м��ؼ� �ѱ� ���� �Է��ϰ��ϴºκ�
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
Return

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
Return
}
if @=��	
{
@=R
Return
}
if @=��	
{
@=s
Return
}
if @=��	
{
@=e
Return
}
if @=��	
{
@=E
Return
}
if @=��	
{
@=f
Return
}
if @=��	
{
@=a
Return
}
if @=��	
{
@=q
Return
}
if @=��	
{
@=Q
Return
}
if @=��	
{
@=t
Return
}
if @=��	
{
@=T
Return
}
if @=��	
{
@=d
Return
}
if @=��	
{
@=w
Return
}
if @=��	
{
@=W 
Return
}
if @=��	
{
@=c 
Return
}
if @=��	
{
@=z 
Return
}
if @=��	
{
@=x 
Return
}
if @=��	
{
@=v 
Return
}
if @=��	
{
@=g 
Return
}
if @=��	
{
@=k 
Return
}
if @=��	
{
@=o 
Return
}
if @=��	
{
@=i 
Return
}
if @=��	
{
@=O 
Return
}
if @=��	
{
@=j 
Return
}
if @=��	
{
@=p 
Return
}
if @=��	
{
@=u 
Return
}
if @=��	
{
@=P 
Return
}
if @=��	
{
@=h 
Return
}
if @=��	
{
@=hk 
Return
}
if @=��	
{
@=ho 
Return
}
if @=��	
{
@=hl 
Return
}
if @=��	
{
@=y 
Return
}
if @=��	
{
@=n 
Return
}
if @=��	
{
@=nj
Return
}
if @=��	
{
@=np 
Return
}
if @=��	
{
@=nl 
Return
}
if @=��	
{
@=b 
Return
}
if @=��	
{
@=m 
Return
}
if @=��	
{
@=ml 
Return
}
if @=��	
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
if @=��	
{
@=r 
Return
}
if @=��	
{
@=R 
Return
}
if @=��	
{
@=rt 
Return
}
if @=��	
{
@=s 
Return
}
if @=��	
{
@=sw 
Return
}
if @=��	
{
@=sg 
Return
}
if @=��	
{
@=e 
Return
}
if @=��	
{
@=f 
Return
}
if @=��	
{
@=fr 
Return
}
if @=��	
{
@=fq 
Return
}
if @=��	
{
@=ft 
Return
}
if @=��	
{
@=fx 
Return
}
if @=��	
{
@=fv
Return
}
if @=��	
{
@=fg 
Return
}
if @=��	
{
@=a 
Return
}
if @=��	
{
@=q
Return
}
if @=��	
{
@=qt 
Return
}
if @=��	
{
@=Q 
Return
}
if @=��	
{
@=t 
Return
}
if @=��	
{
@=T 
Return
}
if @=��	
{
@=d 
Return
}
if @=��	
{
@=w 
Return
}
if @=��	
{
@=c 
Return
}
if @=��	
{
@=z 
Return
}
if @=��	
{
@=x 
Return
}
if @=��	
{
@=v 
Return
}
if @=��	
{
@=g 
Return
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

Return