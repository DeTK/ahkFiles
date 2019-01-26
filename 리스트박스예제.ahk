Gui, Add, ListBox, x10 y160 w400 h100 vl_b
Gui, Show
Return


F1::
printLog("빨강", 100, 100)
Return

printLog(str, x2, y2)
{
    formattime , nowtime,,yyyy-MM-dd HH:mm:ss
    guicontrol ,,l_b, % nowtime " : " str "("  x2 ", " y2 ")||"
}


