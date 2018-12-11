NaverID2= wmf2225
NaverPW2= guswnd7606
gui,color,B0e0e6,white
GuiControl,,List,|
Gui, Add, GroupBox, x2 y9 w290 h260 , 포스팅
Gui, Add, GroupBox, x2 y260 w290 h160 , 로그기록
Gui, Add, Button, x12 y29 w50 h20 , 메뉴
Gui, Add, Button, x12 y49 w50 h20 Disabled, 제목
Gui, Add, Button, x12 y69 w50 h20 Disabled, 태그
Gui, Add, Button, x12 y89 w50 h20 Disabled, 설정
Gui, Add, Button, x12 y199 w270 h20 , 작성하기
Gui, Add, Button, x12 y219 w270 h20 Disabled, 수정하기
Gui, Add, Button, x12 y239 w270 h20 , 설정초기화
Gui, Add, Edit, x62 y49 w220 h20 vtitle, 
Gui, Add, Edit, x62 y69 w220 h20 v태그, 
Gui, Add, Edit, x12 y109 w270 h90 vsource, 
Gui, Add, DropDownList, x62 y29 w220 h500 vlist, 
Gui, Add, DropDownList, x62 y89 w220 h100 v설정, 전체공개|이웃공개|서로이웃공개|비공개
Gui, Add, ListBox, x12 y280 w270 h140 vlog, 
Gui, Show, x1000 y300 h433 w301, 블로그작성기


button메뉴:
winHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")
winhttp.Open("POST", "https://nid.naver.com/nidlogin.login")
winhttp.SetRequestHeader( "Referer", "https://nid.naver.com/nidlogin.login")
winhttp.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
winhttp.Send("enctp=2&svctype=0&id=" . NaverID2 . "&pw=" . NaverPW2)
winhttp.Open("GET", "http://admin.blog.naver.com/AdminCategoryView.nhn?blogId=" . NaverID2)
winhttp.Send("")
winhttp.WaitforResponse
a := winHttp.ResponseText
loop {
    RegExMatch(a,"categoryName"":"".*?"".*?postup", b)
    RegExMatch(a,"categoryNo.*?parentCategoryName""", c)
    StringTrimLeft,b,b,15
    StringTrimLeft,c,c,12
    제목 := ID%a_index%,코드 := Code%a_index%
    StringTrimRight,제목,b,9
    StringTrimRight,코드,c,20
    if 제목 =
    {
        break
    }
    stringgetpos,pos,a,%제목%
    StringTrimLeft,a,a,%pos%
    a := RegExReplace(a, "" . 제목 . """", ""),a := RegExReplace(a, """categoryNo"":" . 코드, ""),코드 := RegExReplace(코드, ",", "")
    GuiControl,,List,%제목% : %코드%
}
guicontrol,,log,카테고리불러오기완료||
return


GuiClose:
ExitApp
button작성하기:
gui,submit,nohide
stringgetpos,list1,list,:
li:=list1+2
stringtrimleft,list,list,li
winhttp.open("post","http://m.blog.naver.com/PostWrite.nhn")
winhttp.setrequestheader("Referer","http://m.blog.naver.com/" . NaverID2 . "/postwrite?categoryNo=0")
winhttp.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
sou:=encode(source)
ti:=encode(title)
sos=blogId=%NaverID2%&ir1=%sou%&post.category.categoryNo=%list%&post.contents.contentsValue=%sou%&post.title=%ti%
winhttp.Send(sos)
guicontrol,,log,작성성공||
return




encode(string) {
    formatInteger := A_FormatInteger
    SetFormat, IntegerFast, H
    VarSetCapacity(utf8, StrPut(string, "UTF-8"))
    Loop % StrPut(string, &utf8, "UTF-8") - 1
    {
        byte := NumGet(utf8, A_Index-1, "UChar")
        encoded .= byte > 127 ? "%" Substr(byte, 3) : Chr(byte)
    }
    SetFormat, IntegerFast, %formatInteger%
    return encoded
}

