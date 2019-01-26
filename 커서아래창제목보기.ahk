MouseGetPos, xpos, ypos 
Msgbox, The cursor is at X%xpos% Y%ypos%. 

; 이 예제에서 마우스를 이동시켜서 현재 마우스 아래에 있는
; 창의 제목을 볼 수 있습니다:
#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%
return