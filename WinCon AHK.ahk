#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#KeyHistory 0
SetBatchLines, -1

Sysget, Mon, MonitorWorkArea,1
;~ MsgBox, Left: %MonLeft% -- Top: %MonTop% -- Right: %MonRight% -- Bottom %MonBottom%.
return

^!NumPad4:: ;좌 정렬
WinGetPos, x, y, w, h, A
If Not ((x = 0) & (y = 0) & (w = MonRight/2) & (h = MonBottom))
	WinMove, A,,0,0,MonRight/2, MonBottom
return

^!NumPad6:: ;우 정렬
WinGetPos, x, y, w, h, A
If Not ((x = MonRight/2) & (y = 0) & (w = MonRight/2) & (h = MonBottom))
	WinMove, A,,MonRight/2,0,MonRight/2, MonBottom
return

^!NumPad8:: ;상 정렬
WinGetPos, x, y, w, h, A
If Not ((x = 0) & (y = 0) & (w = MonRight) & (h = MonBottom/2))
	WinMove, A,,0,0,MonRight, MonBottom/2
return

^!NumPad2:: ;하 정렬
WinGetPos, x, y, w, h, A
If Not ((x = 0) & (y = MonBottom/2) & (w = MonRight) & (h = MonBottom/2))
	WinMove, A,,0,MonBottom/2,MonRight, MonBottom
return

^!NumPad7:: ;좌상 정렬
WinGetPos, x, y, w, h, A
If Not ((x = 0) & (y = 0) & (w = MonRight/2) & (h = MonBottom/2))
	WinMove, A,,0,0,MonRight/2, MonBottom/2
return

^!NumPad9:: ;우상 정렬
WinGetPos, x, y, w, h, A
If Not ((x = MonRight/2) & (y = 0) & (w = MonRight/2) & (h = MonBottom/2))
	WinMove, A,,MonRight/2,0,MonRight/2, MonBottom/2
return

^!NumPad1:: ;좌하 정렬
WinGetPos, x, y, w, h, A
If Not ((x = 0) & (y = MonBottom/2) & (w = MonRight/2) & (h = MonBottom/2))
	WinMove, A,,0,MonBottom/2,MonRight/2, MonBottom/2
return

^!NumPad3:: ;우하 정렬
WinGetPos, x, y, w, h, A
If Not ((x = MonRight/2) & (y = MonBottom/2) & (w = MonRight/2) & (h = MonBottom/2))
	WinMove, A,,MonRight/2,MonBottom/2,MonRight/2, MonBottom/2
return

^!+x::
ExitApp