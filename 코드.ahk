#SingleInstance force
#Hotstring NoMouse
#IfWinActive Warcraft III
SetKeyDelay -1, -1

Gui, Add, DropDownList, vFileSelected gFileChanged, % GUIMakeDropdownList( ReadFile(), FileName)
Gui, Show
Return

GuiClose:
ExitApp
Return

FileChanged:
Gui, Submit, NoHide
msgbox,%FileSelected%
Linum=4
FileReadLine, List, %FileSelected%.txt, %Linum%        ; 좌표.txt 파일안의 %Linum%번째 줄을 읽어서 List변수에 저장. 
StringGetPos,pos,List,:,                ; List변수에서 comma의 위치를 pos에 저장. 
SearchY:=pos+2                          ; pos+2를 SearchY에 대입. 
                                        ; ( 콤마 오른쪽에 있는 숫자들을 읽기위해) 

StringLeft, mx, List, %Pos%              ;List의 %Pos% 위치의 왼쪽 문자열을 mx에 저장. 
StringMid, my, List, %SearchY%,      ;List의 %SearchY%위치부터 2글자의 문자열을 my에 저장. 
StringTrimRight,my,my,4
Code1=%my%    
Linum=5
FileReadLine, List, %FileSelected%.txt, %Linum%        ; 좌표.txt 파일안의 %Linum%번째 줄을 읽어서 List변수에 저장. 
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
    StringReplace, tmp, list, %string%, %string%|
    Return tmp
}
ReadFiles( pattern, folders=0, recurse=0) {
    FileList =
    Loop, %pattern%, %folders%, %recurse%
    {
        SplitPath, A_LoopFileName, , , , FileName
        FileList := FileList FileName "|"
    }
    Return FileList
}

; 여기까지  파일 선택 부분



return
return




:*B0:123123`n::                 ;여기부터 매크로 부분 위에 내용은 텍스트 파일 분석해서 변수 지정시키고 파일목록 불러오는내용
sendinput,{Enter}
sendinput,{Enter}
sendinput,{vk15}-load
sendinput,{Enter}
sleep,300
sendinput,{Enter}
clipboard=%Code1%
sendinput,^v
sendinput,{Enter}
sleep,300
sendinput,{Enter}
clipboard=%Code2%
sendinput,^v
sendinput,{Enter}
sleep,1700
sendinput,{Enter}
sendinput,-on
sendinput,{Enter}
sendinput,{Enter}
sendinput,{vk15}-tldi 200
sendinput,{Enter}
sendinput,{Enter}
sendinput,-cldgh
sendinput,{Enter}
sendinput,{Enter}
sendinput,-dhfals
sendinput,{Enter}
sleep,1250
sendinput,{F8}
sleep,250
sendinput,^2
sleep,250
sendinput,{F1}
sendinput,{F1}
sendinput,{F1}
sendinput,{Pgup}
sendinput,{Pgup}
sleep,500
sendinput,orewq




return 
return






