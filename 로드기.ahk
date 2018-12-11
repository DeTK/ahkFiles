DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0
#NoTrayIcon
#Persistent
#NoEnv

CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
BlockInput, SendAndMouse
Process, Priority,, High
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, 0, 0, play
SetBatchLines, -1
SendMode, input
ListLines, off

Gui, Add, Text, x0 y0 w220 h10 , Text
Gui, Add, Button, x2 y11 w20 h20 gFolder, F
Gui, Add, DropDownList, x22 y11 w180 h20 , % DDL( ReadFile())
Gui, Add, Edit, x192 y39 w30 h20 , Edit
Gui, Add, Text, x162 y39 w30 h20 , 시야
Gui, Add, Button, x202 y11 w20 h20 , R
Gui, Add, CheckBox, x32 y39 w20 h20 , 
Gui, Add, Text, x2 y39 w30 h20 , 복사

; Generated using SmartGUI Creator 4.0
Gui, Show, x610 y603 h65 w220, New GUI Window
Return
;---------------------------------------------------------------------------------------------------
;--------------------------------------------폴더 경로 설정----------------------------------------------
;---------------------------------------------------------------------------------------------------
Folder:
Gui, Submit, Nohide
Gui, Submit, NoHide
F = D:\Documents\Warcraft III
FileSelectFolder, Route, %F%, 0
SetWorkingDir, %Route%
GuiControl,, FileSelected, |
GuiControl,, FileSelected,% DDL( ReadFile())
GuiControl, Choose, FileSelected, %count%
Return

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

GuiClose:
ExitApp