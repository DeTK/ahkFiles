Gui, +Border AlwaysOnTop
Gui, Add, ListBox, x112 y-91 w100 h26, ListBox
Gui, Add, Button, x12 y9 w140 h20 gBtn vBtn,���
Gui, Add, Button, x12 y39 w140 h20 gBtn1 vBtn1,����x
Gui, Add, Button, x12 y69 w140 h20 gBtn2 vBtn2,���x
Gui, Add, Button, x12 y99 w140 h20 gBtn3 vBtn3,���`,����x
Gui, Add, Button, x12 y129 w140 h20 gBtn4 vBtn4,����x`,���x
Gui, Add, Button, x12 y159 w140 h20 gBtn5 vBtn5,���x`,���
Gui, Add, Button, x12 y189 w140 h20 gBtn6 vBtn6,���`,����x`,���x
Gui, Show, x696 y543 h224 w167, New GUI Window
Return
GuiClose:
ExitApp


Ȱ��1��:
Sleep, 200
		Send, {Tab}
		Sleep, 200
		Loop, 6
		{
		Send, {Up}
		}
		Sleep, 200
		Send, +{Tab}
		Send, `n,`n
Return
	
Ȱ��2��:
Sleep, 200
		Send, {Tab}
		Sleep, 200
		Loop, 5
		{
		Send, {Up}
		}
		Sleep, 200
		Send, +{Tab}
		Send, `n,`n
Return

Ȱ��3��:
Sleep, 200
		Send, {Tab}
		Sleep, 200
		Loop, 4
		{
		Send, {Up}
		}
		Sleep, 200
		Send, +{Tab}
		Send, `n,`n
Return

Btn: ;���
Gui,Submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ���
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��1��
		Return
		
Btn1: ;����x
Gui,Submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ����x
	}	
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��1��
		Return
		
Btn2: ;���x
Gui,Submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ���x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��1��
		Return
;-------------------------------------------------------------------------------------------------------------

Btn3: ;���,����x
Gui,Submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ���,����x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��2��
		Return
Btn4: ;����x,���x
Gui,Submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ����x,���x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��2��
		Return
Btn5: ;���x,���
Gui,Submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ���x,���
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��2��
		Return
Btn6: ;���,����x,���x
Gui,submit,nohide
WinActivate, ����� RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 Ȱ������.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, ���,����x,���x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, Ȱ��3��
		Return
