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
FileReadLine, List, %FileSelected%.txt, %Linum%        ; ��ǥ.txt ���Ͼ��� %Linum%��° ���� �о List������ ����. 
StringGetPos,pos,List,:,                ; List�������� comma�� ��ġ�� pos�� ����. 
SearchY:=pos+2                          ; pos+2�� SearchY�� ����. 
                                        ; ( �޸� �����ʿ� �ִ� ���ڵ��� �б�����) 

StringLeft, mx, List, %Pos%              ;List�� %Pos% ��ġ�� ���� ���ڿ��� mx�� ����. 
StringMid, my, List, %SearchY%,      ;List�� %SearchY%��ġ���� 2������ ���ڿ��� my�� ����. 
StringTrimRight,my,my,4
Code1=%my%    
Linum=5
FileReadLine, List, %FileSelected%.txt, %Linum%        ; ��ǥ.txt ���Ͼ��� %Linum%��° ���� �о List������ ����. 
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

; �������  ���� ���� �κ�



return
return




:*B0:123123`n::                 ;������� ��ũ�� �κ� ���� ������ �ؽ�Ʈ ���� �м��ؼ� ���� ������Ű�� ���ϸ�� �ҷ����³���
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






