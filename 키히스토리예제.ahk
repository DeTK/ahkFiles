#NoEnv
Process Priority,,High
SetBatchLines -1

#InstallKeybdHook
#InstallMouseHook
SetKeyDelay 0,0
#KeyHistory 25       ; max #key events
                     ; Settings depend on the standard font
Width  = 400         ; width of key history list
Height = 550         ; depends on #key events
TopCut = 280         ; removed height from original window, depends on script info

F1::
   shown := !shown
   If (!shown) {
      SetTimer RThistory, OFF
      WinHide ahk_id %KHID%
      Return
   }
   KeyHistory
   WinGet KHID, ID, %A_ScriptFullPath% - AutoHotkey v
   WinSet AlwaysOnTop, ON, ahk_id %KHID%
   WinSet ExStyle,-0x80, ahk_id %KHID% ; removes window from the alt-tab list
   WinSet Region,% "W" Width " H" Height " 4-" TopCut, ahk_id %KHID%
   WinMove ahk_id %KHID%,,% A_S21creenWidth-Width, -TopCut
   SetTimer RThistory, 500
Return

RThistory:
   WinGet ID, ID, A                    ; current window
   ControlSend,,{F5}, ahk_id %KHID%    ; refresh key history
   WinActivate ahk_id %ID%             ; return to current window
Return