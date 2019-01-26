GList = 뒤로;(Alt+Left);!{Left}|앞으로;(Alt+Right);!{Right}|새로고침;(F5);{F5}|전체 선택;(Ctrl+A);^a|잘라내기;(Ctrl+X);^x|복사;(Ctrl+C);^c|붙여넣기;(Ctrl+V);^v|실행취소;(Ctrl+Z);^z|되살리기;(Ctrl+Y);^y|삭제;(Delete);{Del}|영구삭제;(Shift+Delete);+{Del}|윈도우 탐색기;(Win+E);#e|바탕화면 보기;(Win+D);#d|모든창 최소화;(Win+M);#m|최소화;(Alt+Space+N);!{Space}n|최대화;(Alt+Space+X);!{Space}x|종료;(Alt+F4);!{F4}|사용 안 함;;

Menu, Tray, NoStandard
Menu, Tray, DeleteAll
Menu, Tray, Add, Option
Menu, Tray, Default, Option
Menu, Tray, Add, Exit

Loop, Parse, GList, |
{
   intList ++
   StringSplit, GList, A_LoopField, `;
   DdList = %DdList%%GList1%%GList2%|
   TList = %TList%%GList1%`;
   GstList = %GstList%%GList3%`;
}
StringSplit, GstList, GstList, `;
StringSplit, TList, TList, `;
Loop %intList% {
   G := GstList%A_Index%
   T := TList%A_Index%
   Ges%A_Index% = %G%|%T%
}

Gui, Font, S85, Calibri
Gui, Add, Text, x10 y10 w150 h150 Center Border CRed vArrow
Gui, Font
Gui, Add, Text, xp y+6 wp CBlue, 마우스 오른쪽버튼 드래그 시 사용할 동작을 목록에서 선택해 주세요.

Gui, Add, Text, x170 y10 w180, 위:
Gui, Add, DropDownList, xp y+2 wp vDdL1 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 아래:
Gui, Add, DropDownList, xp y+2 wp vDdL2 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 왼쪽:
Gui, Add, DropDownList, xp y+2 wp vDdL3 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 오른쪽:
Gui, Add, DropDownList, xp y+2 wp vDdL4 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 왼쪽 위:
Gui, Add, DropDownList, xp y+2 wp vDdL5 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 오른쪽 위:
Gui, Add, DropDownList, xp y+2 wp vDdL6 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 왼쪽 아래:
Gui, Add, DropDownList, xp y+2 wp vDdL7 AltSubmit, %DdList%
Gui, Add, Text, xp y+6 wp, 오른쪽 아래:
Gui, Add, DropDownList, xp y+2 wp vDdL8 AltSubmit, %DdList%

Gui, Add, Checkbox, x10 y263 w150 vToolTip, 툴팁 사용 안함
Gui, Add, Button, xp y+5 wp h20 gAdd, 키입력 추가하기(미지원)
Gui, Add, Button, xp y+5 wp h20 gDefault, 기본값 복원
Gui, Add, Button, xp y+5 w81 gConfirmation, 확인(&O)
Gui, Add, Button, x+5 yp wp gCancel, 취소(&C)
Gui, Add, Button, x+5 yp wp gApplication, 적용(&A)
Gui, Add, Button, x+5 yp wp gHelp, 만든이
Gui, Show, h358 w358, Mouse Gesture v1

if (FileExist("Mouse Gesture v1.ini")) {
   Loop 8 {
      IniRead, list%A_Index%, Mouse Gesture v1.ini, Gesture, Num%A_Index%
   }
} Else {
   list1:=3, list2:=10, list3:=1, list4:=2, list5:=13, list6:=7, list7:=6, list8:=17
}
Loop 8 {
   list := list%A_Index%
   GuiControl, Choose, DdL%A_Index%, %list%
}
Gosub, Setting

OnMessage(0x200, "MouseOver")
Return

MouseOver() {
if A_GuiControl = ddl1
GuiControl, Text, Arrow, ↑
Else if A_GuiControl = ddl2
GuiControl, Text, Arrow, ↓
Else if A_GuiControl = ddl3
GuiControl, Text, Arrow, ←
Else if A_GuiControl = ddl4
GuiControl, Text, Arrow, →
Else if A_GuiControl = ddl5
GuiControl, Text, Arrow, ↖
Else if A_GuiControl = ddl6
GuiControl, Text, Arrow, ↗
Else if A_GuiControl = ddl7
GuiControl, Text, Arrow, ↙
Else if A_GuiControl = ddl8
GuiControl, Text, Arrow, ↘
}
GAction(ByRef Str, ddl, GstList, TList) {

}

Setting:
Gui, Submit, NoHide
Loop 8 {
   int ++
   Loop %intList% {
      if DdL%int% = %A_Index%
      Gesture%int% := Ges%A_Index%
   }
}
Return

RButton::
Gui, Submit, NoHide
WinGetClass, Class, A
CoordMode, Mouse, Screen
if Not GetKeyState(RButton, "P")
MouseGetPos, 1x, 1y
KeyWait, RButton
MouseGetPos, 2x, 2y
g:=50, u:=1y-g, d:=1y+g, l:=1x-g, r:=1x+g
if (u<2y and 2y<d and 2x<l)
Action = %Gesture3%
Else if (u<2y and 2y<d and 2x>r)
Action = %Gesture4%
Else if (l<2x and 2x<r and 2y<u)
Action = %Gesture1%
Else if (l<2x and 2x<r and 2y>d)
Action = %Gesture2%
Else if (l>2x and 2y<u)
Action = %Gesture5%
Else if (r<2x and 2y<u)
Action = %Gesture6%
Else if (l>2x and 2y>d)
Action = %Gesture7%
Else if (r<2x and 2y>d)
Action = %Gesture8%
Else
Action = {RButton}
StringSplit, Action, Action, |
SendInput, %Action1%
if ToolTip = 0
ToolTip, %Action2%
Action2 =
SetTimer, Timeout, 700
Return

Timeout:
SetTimer, Timeout, Off
ToolTip
Return

Add:
MsgBox, 0, 키입력 추가하기, 아직 지원하지 않는 기능입니다.   `n
Return

Default:
list1:=3, list2:=10, list3:=1, list4:=2, list5:=13, list6:=7, list7:=6, list8:=17
Loop 8 {
   list := list%A_Index%
   GuiControl, Choose, DdL%A_Index%, %list%
}
Gosub, Setting
Return

Confirmation:
Gui, Submit, NoHide
Gui, Cancel
Loop 8 {
   Key := DdL%A_Index%
   IniWrite, %Key%, Mouse Gesture v1.ini, Gesture, Num%A_Index%
}
Gosub, Setting
Return

Cancel:
Gui, Submit, NoHide
Gui, Cancel
Loop 8 {
   list := list%A_Index%
   GuiControl, Choose, DdL%A_Index%, %list%
}
Return

Application:
Gui, Submit, NoHide
Loop 8 {
   Key := DdL%A_Index%
   IniWrite, %Key%, Mouse Gesture v1.ini, Gesture, Num%A_Index%
}
Gosub, Setting
Return

Help:
MsgBox, 0, 도움말, 오류가 있으면 연락주세요 :D      `nletsbe52@nate.com (네이트온)
Return

Option:
Gui, Show
Return

Exit:
ExitApp