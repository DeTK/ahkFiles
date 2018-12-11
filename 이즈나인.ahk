;#########
;전 처리문 선언
;#########

DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force                                    ;스크립트 재실행 허용
#Hotstring NoMouse                                       ;마우스클릭 NO 리셋
#KeyHistory 0                                            ;키로그 0
#NoTrayIcon                                              ;트레이아이콘 끄기
#Persistent                                              ;끄거나 Exitapp 만나기 직전 까지 실행
#NoEnv                                                   ;빈 문자열이 환경변수인지 점검하는걸 패스

CoordMode, Mouse, Relative                               ;활성창의 마우스 좌표모드 Relative 절대적
CoordMode, Pixel, Relative                               ;활성창의  픽셀 좌표모드 Relative 절대적
BlockInput, SendAndMouse                                 ;실행중인 스크립트중에 Send&Mouse 입력 방지
Process, Priority,, High                                 ;우선순위를 윈도우즈의 작업 관리자에 보여주는 순위로 변경
SetTitleMatchMode, 2                                     ;창 제목에 WinTitle 일부분만 입력해도 부합
SetControlDelay -1                                       ;각 콘트롤 변경 명령어다음에 올 지연시간 0
SetKeyDelay, 0, 0, play                                  ;Send&ContolSend에 의한 각 키눌림 지연시간 0
SetBatchLines, -1                                        ;스크립트 실행시간 최고속도
SendMode, input                                          ;Send만 입력해도 Sendinput으로 인식
ListLines, off                                           ;최근에 실행된 스크립트 줄 안보여줌

;#############
;한영 구분 함수 선언
;#############

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
;######
;구이 선언
;######

RegRead, See, HKEY_CURRENT_USER\SOFTWARE\save, 시야

Gui, Submit, NoHide
Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption  
Gui, Add, Button, x-1 y-1 w22 h22 gFolder, F
Gui, Add, DropDownList, x21 y0 w200 vFileSelected gFileChanged, % DDL(ReadFile())
GuiControl, Choose, FileSelected, %count%
Gui, Add, Button, x221 y-1 w22 h22 g리셋, R
Gui, Add, Checkbox, x3 y20 w40 h20 v복사 g복사, 복사
Gui, Add, Text, x170 y24 w25 h20 gbar, 시야
Gui, Add, Edit, x195 y22 w25 h15 vSee g시야저장, %See%
Gui, Add, Button, x221 y20 w22 h22 gButton끄기, X
Gui, Show, x812 y100 w242 h40, 로드
		
Return
;######
;변수 선언
;######

;이동 가능하게 해줌
bar:                                                         
Gui, Submit, NoHide 
PostMessage, 0xa1,2,,,A
Return
;폴더 선택 하기
Folder:                                                      
Gui, Submit, NoHide
F = C:\Users\DeTK\Documents\Warcraft III
FileSelectFolder, Route, %F%, 0
SetWorkingDir, %Route%
GuiControl,, FileSelected, |
GuiControl,, FileSelected,% DDL( ReadFile())
Return
;내용 저장
시야저장:                                                       
Gui, Submit, NoHide
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\save, 시야, %See%
Return
;드롭다운리스트 갱신
리셋:                                                         
Gui, Submit, NoHide
GuiControl,, FileSelected, |
GuiControl,, FileSelected,% DDL( ReadFile())
GuiControl, Choose, FileSelected, %count%
Return
;######
;함수 선언
;######
DDL(list, string="") 
{
    StringReplace, tmp, list, %string%, %string%"|"
    Return tmp
}
ReadFile() {
    Return ReadFiles( "*.txt", 0)
}



ReadFiles( pattern, folder=0, recurse=0) {
    FileList =
    Loop, %pattern%, %folder%, %recurse%
    {
        FileName=%A_LoopFileTimeCreated%-%A_LoopFileName%
        FileList := FileList FileName "|"
		
    }
_ = 
( 
%FileList%
) 
@ := _ 
Sort, @,D| ,R
FileList:=RegExReplace(@,"\d{014}-","",ALL)
    Return FileList
}
return
;####################
;복사 및 텍스트 파일명 불러오기
;####################

복사:
FileChanged:
Code1:= Code2:= Code3:= List:= mx:= my:= pos:=
Gui, Submit, NoHide
IF 복사 = 1
{   
    FileEncoding, UTF-8
    FileRead, List, %FileSelected%
    clipboard = %List%
    Return
}
IF 복사 = 0
{
    clipboard =
}
Linum = 4
FileReadLine, List, %FileSelected%, %Linum%
StringGetPos, pos, List, :, 
SearchY := pos+2
StringLeft, mx, List, %Pos%
StringMid, my, List, %SearchY%,
StringTrimRight, my, my, 4
Code1 = %my%    
Linum = 5
FileReadLine, List, %FileSelected%, %Linum%        
StringGetPos, pos, List, :,                
SearchY := pos+2                          
                                        
StringLeft, mx, List, %Pos%            
StringMid, my, List, %SearchY%,      
StringTrimLeft,mx,mx,16
StringTrimRight,my,my,4
if mx=Code2
{
Code2=%my%
}
Linum=6
FileReadLine, List, %FileSelected%, %Linum%    
StringGetPos,pos,List,:,               
SearchY:=pos+2                          
                                  
StringLeft, mx, List, %Pos%           
StringMid, my, List, %SearchY%,      
StringTrimLeft,mx,mx,16
StringTrimRight,my,my,3
if mx=Code3
{
Code3=%my%
}
Return
;###
;로 드
;###
F4::
Gui, Submit, NoHide
s:= 25 ret:=0
WinActivate, Warcraft
#IfWinActive Warcraft III
Send,`n
WinGetActiveTitle, tmp1
if (tmp1 = "Warcraft III") {
Loop 5
{
ret := IME_CHECK("Warcraft III") 
}
if %ret%<>0 
{ 
Send,{vk15}
}
}
Send,-load`n
sleep %s%
clipboard = %Code1%
sleep %s%
Send,`n^v`n
sleep %s%
clipboard = %Code2%
sleep %s%
Send, `n^v`n
sleep %s%
clipboard = %Code3%
sleep %s%
Send, `n^v`n
Send, `n{vk15}`n
Send, `n-tldi %See%`n
Send, `n-cldgh`n
Send, `n-gyrhk Rmrl`n
return
;###
;끄 기
;###
Button끄기:
Exitapp
