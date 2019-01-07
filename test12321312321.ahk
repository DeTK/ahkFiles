SetKeyDelay,200 
gui,1: show, w400 h150, 채팅 Macro
gui,1: add,Groupbox,x10 y29 w380 h110, 채팅 Macro
gui,1: add,text,cred x105 y10,::: 채팅 Macro Ver 0 :::
gui,1: add,text,x20 y47,    채팅1   
gui,1: add,checkbox,x70 y44 w20 h20 vCheck1
gui,1: add,edit,x90 y44 w290 h20 vEdit1, 내용
gui,1: add,text,x20 y67,    채팅2  
gui,1: add,checkbox,x70 y64 w20 h20 vCheck2
gui,1: add,edit,x90 y64 w290 h20 vEdit2, 내용
gui,1: add,text,x20 y87,    채팅3   
gui,1: add,checkbox,x70 y84 w20 h20 vCheck3
gui,1: add,edit,x90 y84 w290 h20 vEdit3, 내용
Gui,1: Add, Button, x10 y107 w77 h23 vpause Disabled Hidden, Pause
Gui,1: Add, Button, x10 y107 w77 h23 vstart, Start
return

ButtonPause:
Gui,Submit,nohide
GuiControl,disable,pause
GuiControl,hide,pause
GuiControl,enable,start
GuiControl,Show,start
pause on
return

ButtonStart:
Gui,Submit,nohide
GuiControl,disable,start
GuiControl,hide,start
GuiControl,enable,pause
GuiControl,Show,pause
Pause off 

loop 
{ 
 gui,submit,nohide
 guicontrolget, Check1
 if Check1=1 
 {
 Send, %Edit1%
 Sleep 1500
 }
 gui,submit,nohide
 guicontrolget, Check2
 if Check2=1 
 {
Send, %Edit2%
 Sleep 1500
 }
 gui,submit,nohide
 guicontrolget, Check3
 if Check3=1 
 {
 Send, %Edit3%
 Sleep 1500
 } 
 
}
Return

GuiClose:
exitapp

Button클릭:
return

F2::
Pause
return
