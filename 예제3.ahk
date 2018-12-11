;#inclue ReadURL.ahk 
URL := "http://knowledgeisfree.tistory.com/1"
Version := 2.5

Address := ReadURL(URL)
IfInString, Address, Server/is/Online ;서버가 Online 상태인지 확인한다
{
    RegExMatch(Address,"@ProgramVersion/(.*?)@",Latest)
    RegExMatch(Address,"@Announce/(.*?)@",Notice)
    if (Latest1 > Version)
        MsgBox, 4164, , % "최신버전 " Latest1 "이 존재합니다`n다운받으시겠어요?"
        IfMsgBox, Yes
        {

RegExMatch(Address,"@Update/(.*?)@",Patch)
Run, %Patch1%

 }

MsgBox, % Notice1
}
