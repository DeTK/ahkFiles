SetTitleMatchMode, 2

F1::
#SingleInstance Force
URl = %Clipboard%
MsgBox, % URl
Output := ReadURL(URL)
var = title
s := RegExMatch(output, "<meta property=""og:" var """ content=""(.*)""/>", arr)
MsgBox, % arr1
return

ReadURL(URL)
{
Win := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Win.Open("GET",URL) 
Win.Send()
Win.WaitForResponse
return, Win.Responsetext
}
Class Name1 {
    3 := "이름"
}
F3::
Name := {1 : "이름", 2 : "나이"}
s := (new Name1).3
ss := Name.2
MsgBox, %s%
Value1 := 500|500
DllCall("mouse_event", "UInt", 2, "Int", 0, "Int", 0, "UInt", 0, "Int", 0)
return
F2::
Reload