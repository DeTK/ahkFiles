obf_copyright := " Date: ���� 2:40 2019�� 1�� 4�� �ݿ���                  "
obf_copyright := "                                                "
obf_copyright := " THE FOLLOWING AUTOHOTKEY SCRIPT WAS OBFUSCATED "
obf_copyright := " BY DYNAMIC OBFUSCATER FOR AUTOHOTKEY           "
obf_copyright := "                                                "
obf_copyright := " Copyright (C) 2011-2013  David Malia           "
obf_copyright := " DYNAMIC OBFUSCATER is released under           "
obf_copyright := " the Open Source GPL License                    "


;AUTOEXECUTE ORIGINAL NAME: autoexecute
;autoexecute
;$OBFUSCATOR: $FUNCS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $PARAMS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $LABELS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $GLOBVARS_CHANGE_DEFAULTS: ,, -1

;$OBFUSCATOR: $LOSVARS_CHANGE_DEFAULTS: ,, -1 


OnMessage(0x20a, "WM_MOUSEWHEEL")
OnMessage(0x203, "WM_LBUTTONDBLCLK")

#Include MyLib.ahk
#Include Gdip.ahk
#Include Gdip_ImageSearch.ahk
#ErrorStdOut
#SingleInstance Force
#Hotstring NoMouse
#KeyHistory 0 
;#NoTrayIcon
#Persistent
#NoEnv
#WinActivateForce
;#InstallMouseHook
;#InstallKeybdHook
SetTitleMatchMode, 2
;BlockInput, On
CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
CoordMode, ToolTip, Relative
SetBatchLines, -1
Process, Priority,, High 
ListLines, Off 

global G_List := 
global G_Hwnd := 
global G_File := 
global G_Num :=
global G_Title :=

Gui, +hwndhMyGUI
Gui, +AlwaysOnTop +Owner -SysMenu
Gui, Add, Button, x150 y5 w60 h20 gkffff@f%k#k#f@kff@ffk#fkk#%@%k#f@kfk#f@kffk%fkf%fkk#ffk#f@fkfkf@kff@k#%@k#ffkffkf@k#kf, �ݱ�
Gui, Add, Button, xp+60 yp w60 h20, ��Ʈ��
 
Gui, Add, Tab2,x5 y5 w325, �̹���ã��|����

Gui, Add, Button, x11 y31 w60 h22, â����
Gui, Add, Edit, xp+1 yp+26 w300 h20 0x800,
Gui, Add, Button, xp-1 yp+24 w60 h22 Disabled, ���ϼ���
Gui, Add, Text, xp+100 yp+6 w200 h15,
Gui, Add, Edit, xp-99 yp+20 w300 h20 0x800,
Gui, Add, Button, xp-1 yp+24 w60 h22 Disabled, �˻�
;Gui, Add, StatusBar,, ���¹��̴�
Gui, Show, x1400 w350, >
OnMessage(0x201, "cl")
OnMessage(0x202, "cl")
Return 
 
cl(wParam, lParam, message, hwnd)
{
	MouseGetPos,,,, Gui
	if (Gui == "Edit1" || Gui == "Edit2")
	{
		ToolTip, �����϶��
		return
	}
}

WM_LBUTTONDBLCLK(wParam, lParam, message, hwnd)
{
	MouseGetPos,,,, Gui
	if (Gui == "Edit1" && G_Title) ; ��Ʈ���̸��� Edit1�̸鼭 G_Title�� �Ⱥ���� ������
	{
		Clipboard := G_Title
		ToolTip, Ÿ��Ʋ �����
		Sleep, 500
		ToolTip
	}
	else if (Gui == "Edit2" && G_File)
	{
		Clipboard := G_File
		ToolTip, ���ϸ� �����
		Sleep, 500
		ToolTip
	}

}




Button��Ʈ��:
if (flag := !flag)
	OnMessage(0x200, "WM_MOUSEMOVE")
else
{
	OnMessage(0x200, "WM_MOUSEMOVE", 0)
	ToolTip,,,,20
}
return

WM_MOUSEMOVE(wParam, lParam, message, hwnd)
{
	MouseGetPos,,,, Gui
	ToolTip, % Gui,,,20
}


WM_MOUSEWHEEL(wParam, lParam, message, hwnd)
{
	;ToolTip, % wParam " " lParam " " message " " hwnd " " Gui
	MouseGetPos,,,, Gui
	if (Gui == "Button5" && G_List) ; ���� ��Ʈ���� �̸� ����Ʈ�� ���� �ƴҶ�
	{
		Create_GDI()
		GetKeyState, key, LAlt, P
		if (wParam == 7864320) ; �� �ø�
		{
			if (key == "D")
				G_Num -= 10
			else
				G_Num--
		}
		else if (wParam == 4287102976) ; �� ����
		{
			if (key == "D")
				G_Num += 10
			else
				G_Num++
			if (G_List[1] < G_Num)
				G_Num := G_List[1]
		}		
		if (G_Num <= 0)
			Create_Square(0,0,0), Delete_GDI(), G_Num := 0
		else if (G_Num > 0)
			Create_Square(G_Hwnd, G_List, G_Num)
		Delete_GDI()
	}
	return
}



Buttonâ����:
Gui, Show,, > ���ϴ�â ������ �����̽��� �����ּ���
Block_Hotkey("Space") ; �ش�Ű�� ������ �������� ����
G_Hwnd := WinExist("A") ; ���� Ȱ��ȭ�� â�� �������̵� �����´�.
WinGetActiveTitle, G_Title
GuiControl, Enable, Button4
GuiControl,, Edit1, % G_Title
Gui, Show,, % ">"
return

Button���ϼ���:    
Gui, Submit 
tempfile := G_File
FileSelectFile, G_File
if (!G_File) ; ����������
	G_File := tempfile
else
	GuiControl, Enable, Button5
Guicontrol,, Static1,
GuiControl,, Edit2, % G_File

Gui, Show
return


Button�˻�:
Gui, Submit, NoHide
; �ڵ�, �����̸�
G_List := Inactive_Search(G_Hwnd, G_File)
G_Num := 0
Guicontrol,, Static1,
if (G_List[1])
{
	Guicontrol,, Static1, % "���� = " G_List[2][1] " ���� = " G_List[2][2]
	Gui, Show,, % "> " G_List[1] "�� ã��"
}
else
{
	Gui, Show,, % "> �� ã��"
}
Return

kffff@%kffffkfkf@kffkffffk#%f@fkf%f@k#ffkfkfkffffkffkff@%@k#ff%f@kffkkff@fkfkffk#fff@%kffkf@k#kf:
ExitApp

