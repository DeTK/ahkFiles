if not A_IsAdmin

{

  Run *RunAs "%A_ScriptFullPath%"

  ExitApp

}
 
; ========================

#SingleInstance, force

#InstallKeybdHook

#InstallMouseHook

DetectHiddenWindows, On

CoordMode, Mouse, Relative ; needed for mouseclickdrag

CoordMode, Tooltip, Screen

SetTitleMatchMode, 2

SetKeyDelay, 200,200

SetWinDelay, 300

SetControlDelay, 300

SetBatchLines, 300ms

Version := "v4.1"

RunHotkey := 0 ; Hotkeys disabled until run button pressed.

; ========================================================================================

Gui, Main:Add, Tab2, x5  y5 w510 h520, 정보 | 설정

; Info Tab

Gui, Main:Add, Text, x170 y35  w180 h20, Send 와 Click 커맨드 테스트 툴 %Version%

Gui, Main:Add, Text, x25  y67  w400 h25, 본 프로그램은 관리자 권한으로 실행 되어야 합니다. 그렇지 않으면 오작동 하거나 작동 안될수 있습니다.

Gui, Main:Add, Text, x25  y97  w470 h20, 게임이나 프로그램은 창모드에서 실행 하시는 것을 추천 합니다.

Gui, Main:Add, Text, x25  y127 w470 h20, 각각의 명령어를 테스트 할때는 2000~4000 정도의 딜레이 값을 주는 것이 적당 합니다.

Gui, Main:Add, Text, x25  y157 w470 h20, ** F1과 F3키는 테스트 키로 사용 할수 없습니다. **

Gui, Main:Add, Text, x15  y447 w280 h20, 이 툴의 스크립트 원본은 아래에서 확인 가능 합니다:

Gui, Main:Add, Link, x15  y467      h20, <a href="http://www.autohotkey.com/board/topic/95653--/">Send and Click Tool %Version%</a>

Gui, Main:Add, Link, x15  y487      h20, <a href="http://www.autohotkey.com/board/user/21149--/">SnowFlake Profile Page</a>

Gui, Main:Add, Text, x380 y427 h20, AHK Version %A_AhkVersion%

Gui, Main:Add, Text, x380 y447 h20, System:  %A_OSVersion%

Gui, Main:Add, Text, x380 y467 h20, Version: %Version%

Gui, Main:Add, Text, x380 y487 h20, Date: %A_DD%/%A_MM%/%A_YYYY%

; ========================================================================================

Gui, Main:Tab,2

; Config Tab

Gui, Main:Add, Button, x15  y37  w100 h30 gStart            , 원하는 창 선택

Gui, Main:Add,   Text, x20  y77  w90  h20                   , 선택 되어진 창 :

Gui, Main:Add,   Edit, x115 yp-2 w250 h20 vwinid

Gui, Main:Add,   Text, x50  y117 w60  h20                   , 딜레이 값 :

Gui, Main:Add,   Edit, x115 yp-2 w70  h20 vWaitTime Number  , 2000

Gui, Main:Add,   Text, x30  y157 w80  h20                   , 테스트 키 입력 :

Gui, Main:Add, Hotkey, x115 yp-2 w20  h20 vkex              , Q

Gui, Main:Add, Button, x15  y187 w100 h30 gCord             , 원하는 마우스 좌표 선택

Gui, Main:Add,   Text, x60  y227 w50  h20                   , 좌표 X :

Gui, Main:Add,   Edit, x115 yp-2 w50  h20 Vxx Number

Gui, Main:Add,   Text, x60  y257 w50  h20                   , 좌표 Y :

Gui, Main:Add,   Edit, x115 yp-2 w50  h20 Vyy Number

Gui, Main:Add,  Radio, x15  y300 w110 h30 Checked vRadio_all, 모든 Send/Click 명령어 테스트

Gui, Main:Add,  Radio, x136 y300 w110 h30 gRadio_advanced   , 명령어 선택 (고급설정)

Gui, Main:Add, Button, x15  y350 w100 h30 gsave             , 시작

; ========================================================================================

Gui, AdvanceClick:Add, Text,     x165  y10  w170 h20     , Click 명령어 고급 설정

Gui, AdvanceClick:Add, GroupBox, x5   y35  w470 h515     , Click 명령어 목록

Gui, AdvanceClick:Add, CheckBox, x15  y67  w100 h30      , 테스트 - click

Gui, AdvanceClick:Add, CheckBox, x15  y107 w100 h30 vMC1 , 테스트 - MouseClick

Gui, AdvanceClick:Add, CheckBox, x15  y147 w150 h30 vMC2 , 테스트 - MouseClickDrag Fast

Gui, AdvanceClick:Add, CheckBox, x15  y187 w170 h30 vMC3 , 테스트 - MouseClickDrag Slow

Gui, AdvanceClick:Add, CheckBox, x15  y227 w130 h30 vMC4 , 테스트 - ControlClick

Gui, AdvanceClick:Add, CheckBox, x15  y267 w130 h30 vMC5 , 테스트 - Send Click

Gui, AdvanceClick:Add, CheckBox, x15  y307 w130 h30 vMC6 , 테스트 - SendRaw Click

Gui, AdvanceClick:Add, CheckBox, x15  y347 w130 h30 vMC7 , 테스트 - SendPlay Click

Gui, AdvanceClick:Add, CheckBox, x15  y387 w130 h30 vMC8 , 테스트 - SendEvent Click

Gui, AdvanceClick:Add, CheckBox, x15  y427 w130 h30 vMC9 , 테스트 - SendInput Click

Gui, AdvanceClick:Add, CheckBox, x15  y467 w130 h30 vMC10, 테스트 - ControlSend Click

Gui, AdvanceClick:Add, CheckBox, x15  y507 w160 h30 vMC12, 테스트 - ControlSendRaw Click

Gui, AdvanceClick:Add, CheckBox, x235 y67  w160 h30 vMC13, 테스트 - ControlClick v2

Gui, AdvanceClick:Add, CheckBox, x235 y107 w160 h30 vMC14, 테스트 - PostMessage Click

Gui, AdvanceClick:Add, CheckBox, x235 y147 w160 h30 vMC15, 테스트 - SendMessage Click

Gui, AdvanceClick:Add, CheckBox, x235 y187 w160 h30 vMC16, 테스트 - DllCall Mouse_event

; ========================================================================================

Gui, AdvanceSend:Add, Text,     x95 y10  w170 h20     , Send 명령어 고급 설정

Gui, AdvanceSend:Add, GroupBox, x5  y35  w330 h400    , Send 명령어 목록

Gui, AdvanceSend:Add, Checkbox, x15 y65  w100 h30 vKS1, 테스트 - Send

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w100 h30 vKS2, 테스트 - SendRaw

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w150 h30 vKS3, 테스트 - SendInput

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w170 h30 vKS4, 테스트 - SendPlay

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w130 h30 vKS5, 테스트 - SendEvent

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w130 h30 vKS6, 테스트 - ControlSend

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w130 h30 vKS7, 테스트 - ControlSendRaw

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w260 h30 vKS8, 테스트 - Dllcall keybd_event

Gui, AdvanceSend:Add, Checkbox, x15 y+10 w160 h30 vKS9, 테스트 - Send Wscript(COM)

; ========================================================================================

Gui, Main:Show, w520 h530 Center, Send & Click 명령어 툴 %Version%

return




Radio_advanced:

  MsgBox, 4160, 명령어 선택, 테스트 하고자 하는 명령어를 선택해 주세요.

  IfMsgBox OK

  {

   Gui, AdvanceClick:Show, w480 h555, Click 고급설정

   Gui, AdvanceSend:Show, w340 h440, Send 고급설정

  }

  RunHotkey := 0    ; Reset to prevent hotkey use until Run Button pressed.

return




Start:

  gui,hide

  MsgBox, 4160, 창 선택, 창 선택을 시작하려면 OK를 누른후`n마우스 커서를 원하는 창에 올린뒤 "스페이스 바"를 눌러 주시면 됩니다. 

  IfMsgBox No
 
   goto, Start    

  keywait, Space, D
 
  keywait, Space

  WinGetActiveTitle, winidX

  MsgBox, 4132, 창 선택 완료, 선택하신 창은: `n`n %winidX% `n`n이대로 진행 하시겠습니까?

  IfMsgBox No

   goto, Start   

  GuiControl,, winid, %winidX%

  Gui, Submit  

  Gui,Show, w520 h530 Center, Send and Click Tool %Version%

  RunHotkey := 0    ; Reset to prevent hotkey use until Run Button pressed.

return




Cord:

  gui,hide

  MsgBox, 4160, 좌표 선택, 좌표 선택을 시작하려면 OK를 누른후`n마우스 커서를 원하는 좌표에 올린뒤 "스페이스 바"를 눌러 주시면 X/Y 값이 저장 됩니다.

  keywait, Space, D

  keywait, Space

  mousegetpos, XXX, YYY

  MsgBox, 4132,좌표 선택 완료, 다음의 X / Y 좌표를 설정 하셨습니다.`n`nX = %XXX%`n`nY = %YYY%`n`n이대로 진행 하시겠습니까?

  IfMsgBox No

   goto, Cord 

  GuiControl,, xx, %XXX%

  GuiControl,, yy, %YYY%

  Gui, Submit  

  Gui, Show, w520 h530 Center, Send and Click Tool %Version%

  RunHotkey := 0    ; Reset to prevent hotkey use until Run Button pressed.

return




save:    ; Run Button, Do all Checks here since we have hotkeys disabled until Run is clicked.
 
  Gui, Submit

  Gui, AdvanceSend:Submit

  Gui, AdvanceClick:Submit

  if (winid = "")            ; Check Window

  {

   MsgBox, 16, 창 선택 오류!, 프로그램을 사용할 창을 선택해 주세요.

   Gui, Main:Show, w520 h530 Center, Send and Click Tool %Version%

   return

  }

  if (xx = "")               ; Check Coords

  {

   MsgBox, 16, 좌표 선택 오류!, 프로그램을 사용할 좌표를 선택해 주세요.

   Gui, Main:Show, w520 h530 Center, Send and Click Tool %Version%

   return

  }

  if (radio_all)             ; Check Radio Button

  {

   MC1 := MC2 := MC3 := MC4 := MC5 := MC6 := MC7 := MC8 := MC9 := MC10 := MC11 := MC12 := MC13 := MC14 := MC15 := MC16 := MC17 := 1

   KS1 := KS2 := KS3 := KS4 := KS5 := KS6 := KS7 := KS8 := KS9 := 1

  }

  if !(WaitTime >= 10)       ; Check Delay

  {

   GuiControl,, WaitTime, 10

   Gui, Submit

  }

  if (Kex = "")  ; Check kex value because using backspace will set hotkey to nothing!

  {

   GuiControl,, Kex, Q    ;set to default

   Gui, Submit

  }

  MsgBox, 4148, 최종 설정, 선택된 창 = %winid%`n`n 보낼 키 = %kex% `n`n각 명령어 사이의 딜레이 = %WaitTime%`n`n마우스 X 좌표 = %XXX%`n`n마우스 Y 좌표 = %YYY%

  IfMsgBox No

  {

   Gui,Show, w520 h530 Center, Send and Click Tool %Version%

   return

  }

  MsgBox, 4160, 옵션 선택, 키 값을 보낼지 (SEND), 혹은 마우스 좌표를 클릭 (CLICK)할지 정해주세요`n`nF1 = 마우스 클릭 명령어 테스트`n`nF3 = SEND 키 명령어 테스트 `n`ESC를 누르면 프로그램을 종료 합니다.

  RunHotkey := 1

return




$F1::             ; Press F1 to run Click test.

  KeyWait, F1

  if !RunHotkey

   return

  RunHotkey := 0

  SoundBeep

ClickTest: ; ========================================================================================

  sleep, WaitTime

  ToolTip, Click 테스트 중,0,0

  WinActivate, %winid%

  WinSet, AlwaysOnTop, ON, %winid%

  IF (MC1)

  {

   ToolTip, Testing Click,0,0

   sleep, WaitTime

   Click, %XX%, %YY%

  }

  IF (MC2)

  {

   ToolTip, Testing MouseClick,0,0

   sleep, WaitTime

   MouseClick, Left, %XX%, %YY%

  }

  IF (MC3)

  {

   ToolTip, Testing MouseClickDrag Fast,0,0

   sleep, WaitTime

   MouseClickDrag, left, 0, XX, YY, 0, 20

  }

  IF (MC4)

  {

   ToolTip, Testing MouseClickDrag Slow,0,0

   sleep, WaitTime

   MouseClickDrag, left, 0, XX, YY, 0, 30

  }

  IF (MC5)

  {

   ToolTip, Testing ControlClick,0,0

   sleep, WaitTime

   ControlClick, x%XX% y%YY%, %winid%, Left

  }

  IF (MC6)

  {

   ToolTip, Testing Send Click,0,0

   sleep, WaitTime

   Send, {Click %XX%, %YY%}

  }

  IF (MC7)

  {

   ToolTip, Testing SendRaw Click,0,0

   sleep, WaitTime

   SendRaw, {LButton}

  }

  IF (MC8)

  {

   ToolTip, Testing SendPlay Click,0,0

   sleep, WaitTime

   SendPlay, {LButton}

  }

  IF (MC9)

  {

   ToolTip, Testing SendEvent Click,0,0

   sleep, WaitTime

   SendEvent, {LButton}

  }

  IF (MC10)

  {

   ToolTip, Testing SendInput Click,0,0

   sleep, WaitTime

   SendInput, {LButton}

  }

  IF (MC11)

  {

   ToolTip, Testing ControlSend Click,0,0

   sleep, WaitTime

   ControlSend,,{Click %XX%, %YY%},%winid%

  }

  IF (MC12)

  {

   ToolTip, Testing ControlSendRaw Click,0,0

   sleep, WaitTime

   ControlSendRaw,,{Click %XX%, %YY%},%winid%

  }

  IF (MC13)

  {

   ToolTip, Testing ControlClick v2 Left Mouse,0,0

   AFK_Click(XX,YY, winid)

   sleep, 500

  }

  IF (MC14)

  {

   ToolTip, Testing PostMessage Click,0,0

   sleep, WaitTime

   PostMessage, 0x201, 0x00000000, 0x01f0010f, , %winid% ; Down

   sleep, 500

   PostMessage, 0x202, 0x00000000, 0x01f0010f, , %winid% ; UP

  }

  IF (MC15)

  {

   ToolTip, Testing SendMessage Click,0,0

   sleep, WaitTime

   SendMessage, 0x201, 0x00000000, 0x01f0010f, , %winid% ; Down

   sleep, 500

   SendMessage, 0x202, 0x00000000, 0x01f0010f, , %winid% ; UP

  }

  IF (MC16)

  {

   ToolTip, Testing DllCall Mouse_event,0,0

   sleep, WaitTime

  MouseMove, XX, YY

  dllcall("mouse_event", Uint, 0x02, Uint, 0, Uint, 0, Uint, 0, UPtr, 0) ; Down

  sleep, 500

  dllcall("mouse_event", Uint, 0x04, Uint, 0, Uint, 0, Uint, 0, UPtr, 0) ; UP

  }

  ToolTip, Click 테스트 완료,0,0

  sleep, WaitTime

  SoundBeep

  ToolTip

  WinSet, AlwaysOnTop, OFF, %winid%

  MsgBox, 4160, 옵션 선택, 키 값을 보낼지 (SEND), 혹은 마우스 좌표를 클릭 (CLICK)할지 정해주세요`n`nF1 = 마우스 클릭 명령어 테스트`n`nF3 = SEND 키 명령어 테스트`n`nCtrl + Escape를 누르면 프로그램 초기 화면으로 돌아 갑니다.`n`n

  RunHotkey := 1

return

; ========================================================================================

$F3::              ; Press F3 to run Send test.

  KeyWait, F3

  if !RunHotkey

   return

  RunHotkey := 0

  SoundBeep

SendTest:

  sleep, WaitTime

  ToolTip, Send 테스트 중,0,0

  WinActivate, %winid%

  WinSet, AlwaysOnTop, ON, %winid%

  IF (KS1)

  {

   ToolTip, Testing %Kex% With Send,0,0

   sleep, WaitTime

   Send, %Kex%

  }

  IF (KS2)

  {

   ToolTip, Testing %Kex% With SendRaw,0,0

   sleep, WaitTime

   SendRaw, %Kex%

  }

  IF (KS3)

  {

   ToolTip, Testing %Kex% With SendInput,0,0

   sleep, WaitTime

   SendInput, %Kex%

  }

  IF (KS4)

  {

   ToolTip, Testing %Kex% With SendPlay,0,0

   sleep, WaitTime

   SendPlay, %Kex%

  }

  IF (KS5)

  {

   ToolTip, Testing %Kex% With SendEvent,0,0

   sleep, WaitTime

   SendEvent, %Kex%

  }

  IF (KS6)

  {

   ToolTip, Testing %Kex% With ControlSend,0,0

   sleep, WaitTime

   ControlSend,,%Kex%, %winid%

  }

  IF (KS7)

  {

   ToolTip, Testing %Kex% With ControlSendRaw,0,0

   sleep, WaitTime

   ControlSendRaw,,%Kex%, %winid%

  }

  IF (KS8)

  {

   ToolTip, Testing %Kex% With Dllcall keybd_event,0,0

   VK := Format("0x{:02X}", GetKeyVK(Kex))

   SC := Format("0x{:03X}", GetKeySC(Kex))

   sleep, WaitTime

   dllcall("keybd_event", UChar, VK, UChar, SC, Uint, 0, UPtr, 0) ; Down

   sleep, 500

   dllcall("keybd_event", UChar, VK, UChar, SC, Uint, 2, UPtr, 0) ; UP

  }

  IF (KS9)

  {

   ToolTip, Testing %Kex% With Wscript will send 1,0,0

   sleep, WaitTime

   ComObjCreate("wscript.shell").SendKeys(Chr(49))

  }




  ToolTip, Send 테스트 완료

  sleep, WaitTime

  SoundBeep

  ToolTip

  WinSet, AlwaysOnTop, OFF, %winid%

  MsgBox, 4160, 옵션 선택, 키 값을 보낼지 (SEND), 혹은 마우스 좌표를 클릭 (CLICK)할지 정해주세요`n`nF1 = 마우스 클릭 명령어 테스트`n`nF3 = SEND 키 명령어 테스트`n`nCtrl + Escape를 누르면 프로그램 초기 화면으로 돌아 갑니다.`n`n

  RunHotkey := 1

return




AFK_Click(X, Y, WinTitle="", WinText="", ExcludeTitle="", ExcludeText=""){

  SetControlDelay -1

  hwnd:=ControlFromPoint(X, Y, WinTitle, WinText, cX, cY, ExcludeTitle, ExcludeText)

  PostMessage, 0x201, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDOWN

  PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP

  PostMessage, 0x203, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDBLCLCK

  PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP

}




ControlFromPoint(X, Y, WinTitle="", WinText="", ByRef cX="", ByRef cY="", ExcludeTitle="", ExcludeText=""){

  static EnumChildFindPointProc=0

  if !EnumChildFindPointProc

   EnumChildFindPointProc := RegisterCallback("EnumChildFindPoint","Fast")

  

  if !(target_window := WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText))

   return false

  

  VarSetCapacity(rect, 16)

  DllCall("GetWindowRect","uint",target_window,"uint",&rect)

  VarSetCapacity(pah, 36, 0)

  NumPut(X + NumGet(rect,0,"int"), pah,0,"int")

  NumPut(Y + NumGet(rect,4,"int"), pah,4,"int")

  DllCall("EnumChildWindows","uint",target_window,"uint",EnumChildFindPointProc,"uint",&pah)

  control_window := NumGet(pah,24) ? NumGet(pah,24) : target_window

  DllCall("ScreenToClient","uint",control_window,"uint",&pah)

  cX:=NumGet(pah,0,"int"), cY:=NumGet(pah,4,"int")

  return control_window

}




^Esc::Gui, Main:Show, w520 h530 Center, Send and Click Tool %Version%




Esc::

MainGuiClose:

  if (winid !="")   ; Turn off AllwaysOnTop in case script is closed while test is running.

   WinSet, AlwaysOnTop, OFF, %winid%

  ExitApp
