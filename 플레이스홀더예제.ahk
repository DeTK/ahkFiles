Gui, add, Edit, hwndEdit1,
플레이스홀더(Edit1, "ID")
Gui, add, Edit, hwndEdit2,
플레이스홀더(Edit2, "비밀번호")
Gui, Show
Return



플레이스홀더(f_ID, f_str)
{
	DllCall("user32.dll\SendMessage", "Ptr", f_ID, "UInt", 0x1501, "Ptr", True, "Str", f_str, "Ptr")
}