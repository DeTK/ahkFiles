#SingleInstance, force
SetTitleMatchMode, 2
global gx :=
global gy :=
global gwin :=
global gcon :=


F1::
WinGet, hwnd, ID, 제목 없음
ToolTip, % hwnd
; strs := StrSplit("테스트중 입니다. 아마도 그럴듯 ֍")
; strs := StrSplit("😃")
; Loop, % strs.MaxIndex()
; {
;     ; PostMessage, 0x102, UriEncode(strs[A_index]), 0x0, Edit1, 메모장
;     PostMessage, 0x102, 0x0, 0x1f603,Edit1, 메모장
; }
str =
(
이렇게하면 여려줄을 출력할수있다
계속 써 내려가면된다.
 ☺ ☻ 😃 😄 😅 😆 😊 😎
😇 😈 😋 😏 😌 😁 😀 😂
🤣 🤠 🤡 🤑 🤩 🤪
😳 😉 😗 😚 😘 😙 😍

)
; MouseGetPos, x, y, win, con
return


F2::
MouseGetPos, x, y, win, con, 3
gx := x
gy := y
gwin := win
gcon := con
ToolTip, % x " " y " " win " " con
return

F3::
비활성마우스좌클릭(700, 700, win)
return



비활성마우스드래그(x1, y1, x2, y2, 드래그이동칸수step, 드래그횟수num, _hWnd)
{
	lParam1 := x1 | y1 << 16
	lParam2 := x2 | y2 << 16
	PostMessage, 0x201, 1, %lParam1%,, ahk_id %_hwnd% ; 마우스 왼클릭 다운
	PostMessage, 0x200, 1, %lParam2%,, ahk_id %_hwnd% ; 마우스 왼클릭 다운
	PostMessage, 0x202, 1, %lParam2%,, ahk_id %_hwnd% ; 마우스 왼클릭 다운

}



비활성마우스좌클릭(x, y, _hwnd, clickCount := 1)
{
	lParam := x | y << 16
	while (clickCount--) ; 넘어온값이 0이면 진입안함
	{
		DllCall("PostMessage", "Int", _hwnd, "UInt", 0x201, "Int", 1, "Int", lParam)
		DllCall("PostMessage", "Int", _hwnd, "UInt", 0x202, "Int", 0, "Int", lParam)
	}
	return

}


윈도우의핸들을얻어오는함수(winTitle, _hWnd)
{
return
}

postMessageString(문자열,핸들)
{ 
strArray := StrSplit(문자열)
Loop, % strArray.MaxIndex()
{ 
    DllCall("PostMessage", "Int", 핸들, "UInt", 0x102, "Int", ASC(strArray[A_index]), "Int", 0x0)
}
return 
}

F4::

비활성마우스좌클릭(378, 790, win)
str =
(
이렇게하면 여려줄을 출력할수있다
계속 써 내려가면된다.
 ☺ ☻ 😃 😄 😅 😆 😊 😎
😇 😈 😋 😏 😌 😁 😀 😂
🤣 🤠 🤡 🤑 🤩 🤪
😳 😉 😗 😚 😘 😙 😍

)
postMessageString(str, win)
return

F5::
e := FindWindowEx(0, 0, "NotePad", ahk_id %win%)
ToolTip, % e, 100,, 10
return
; hw_ahk := FindWindowEx( 0, 0, "AutoHotkey", a_ScriptFullPath " - AutoHotkey v" a_AhkVersion )
FindWindowEx(부모핸들, 자식핸들, 클래스, 타이틀)
{
   return, DllCall("FindWindowEx", "UInt", 부모핸들, "UInt", 자식핸들, "Str", 클래스, "Str", 타이틀 )
}


F6::
wheel("")
return

wheel(w)
{
CoordMode, Mouse, Screen

wp :=
if (w == "위")
{
	wp := 0x00780000
}
else
{
	wp := 0xFF880000
}
lp := gy << 16 | gx
DllCall("PostMessage", "Int", gcon, "UInt", 0x20A, "Int", wp, "Int", lp)
return
}