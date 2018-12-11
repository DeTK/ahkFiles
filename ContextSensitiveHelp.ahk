; 상황에 맞는 도움말 - 모든 편집기에서 상황에 맞는 도움말 - Rajat 제공
; http://www.autohotkey.com
; 이 스크립트는 Ctrl + 2 (또는 선택한 다른 단축키)에 도움말 파일을 표시합니다.
; 페이지에서 선택한 AutoHotkey 명령 또는 키워드를 찾습니다. 아무것도 선택하지 않으면,
; 명령 이름은 현재 행의 시작 부분에서 추출됩니다.

; 아래 단축키는 클립 보드를 사용하여 최대 값과의 호환성을 제공합니다. 편집자 수 (ControlGet이 대부분의 고급 편집자와 작동하지 않기 때문에)
; 이후에 원본 클립 보드 내용을 복원하지만 일반 텍스트로,
; 그것은 아무것도없는 것보다 낫다.
$^2::
; 다음 값은이 단축키 스레드의 지속 기간 동안에 만 유효합니다.
; 따라서 원래 값으로 다시 변경할 필요가 없습니다.
; 스레드가 끝날 때 자동으로 수행되기 때문입니다.
SetWinDelay 10
SetKeyDelay 0
AutoTrim, On

if A_OSType = WIN32_WINDOWS  ; Windows 9x
	Sleep, 500  ; Give time for the user to release the key.

C_ClipboardPrev = %clipboard%
clipboard =
; Use the highlighted word if there is one (since sometimes the user might
; intentionally highlight something that isn't a command):
Send, ^c
ClipWait, 0.1
if ErrorLevel <> 0
{
	; Get the entire line because editors treat cursor navigation keys differently:
	Send, {home}+{end}^c
	ClipWait, 0.2
	if ErrorLevel <> 0  ; Rare, so no error is reported.
	{
		clipboard = %C_ClipboardPrev%
		return
	}
}
C_Cmd = %clipboard%  ; This will trim leading and trailing tabs & spaces.
clipboard = %C_ClipboardPrev%  ; Restore the original clipboard for the user.
Loop, parse, C_Cmd, %A_Space%`,  ; The first space or comma is the end of the command.
{
	C_Cmd = %A_LoopField%
	break ; i.e. we only need one interation.
}
IfWinNotExist, AutoHotkey Help
{
	; Determine AutoHotkey's location:
	RegRead, ahk_dir, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey, InstallDir
	if ErrorLevel  ; Not found, so look for it in some other common locations.
	{
		if A_AhkPath
			SplitPath, A_AhkPath,, ahk_dir
		else IfExist ..\..\AutoHotkey.chm
			ahk_dir = ..\..
		else IfExist %A_ProgramFiles%\AutoHotkey\AutoHotkey.chm
			ahk_dir = %A_ProgramFiles%\AutoHotkey
		else
		{
			MsgBox Could not find the AutoHotkey folder.
			return
		}
	}
	Run %ahk_dir%\AutoHotkey.chm
	WinWait AutoHotkey Help
}
; The above has set the "last found" window which we use below:
WinActivate
WinWaitActive
StringReplace, C_Cmd, C_Cmd, #, {#}
send, !n{home}+{end}%C_Cmd%{enter}
return
