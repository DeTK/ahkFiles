Gui, +Border AlwaysOnTop
Gui, Add, ListBox, x112 y-91 w100 h26, ListBox
Gui, Add, Button, x12 y9 w140 h20 gBtn vBtn,댓글
Gui, Add, Button, x12 y39 w140 h20 gBtn1 vBtn1,정보x
Gui, Add, Button, x12 y69 w140 h20 gBtn2 vBtn2,양식x
Gui, Add, Button, x12 y99 w140 h20 gBtn3 vBtn3,댓글`,정보x
Gui, Add, Button, x12 y129 w140 h20 gBtn4 vBtn4,정보x`,양식x
Gui, Add, Button, x12 y159 w140 h20 gBtn5 vBtn5,양식x`,댓글
Gui, Add, Button, x12 y189 w140 h20 gBtn6 vBtn6,댓글`,정보x`,양식x
Gui, Show, x696 y543 h224 w167, New GUI Window
Return
GuiClose:
ExitApp


활정1일:
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
	
활정2일:
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

활정3일:
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

Btn: ;댓글
Gui,Submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 댓글
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정1일
		Return
		
Btn1: ;정보x
Gui,Submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 정보x
	}	
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정1일
		Return
		
Btn2: ;양식x
Gui,Submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 양식x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정1일
		Return
;-------------------------------------------------------------------------------------------------------------

Btn3: ;댓글,정보x
Gui,Submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 댓글,정보x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정2일
		Return
Btn4: ;정보x,양식x
Gui,Submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 정보x,양식x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정2일
		Return
Btn5: ;양식x,댓글
Gui,Submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 양식x,댓글
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정2일
		Return
Btn6: ;댓글,정보x,양식x
Gui,submit,nohide
WinActivate, 이즈나인 RPG

ImageSearch, x1,y1,1,1,1920,1080,*50 활동정지.png
	If ErrorLevel = 0
	{
		MouseMove, x1 +100,y1 +110
		MouseClick
		SendInput, 댓글,정보x,양식x
	}
	If ErrorLevel = 1
	{
		return
	}
		Gosub, 활정3일
		Return
