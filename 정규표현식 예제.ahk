
f1::
소스  := "2018-05-11&nbsp; 포인트2018-05-10&nbsp; 포인트2018-05-08&nbsp; 접수2018-05-08&nbsp; 전화2018-05-02&nbsp; ★★2018-05-02&nbsp; 2018년2018-04-17&nbsp; 접수"
ss := RegExReplace(소스, "m)^\s*(.*)&nbsp;\s", $1)
StringReplace, 소스, ss, &nbsp;%A_Space%,  `r`n, all
Return

F2::
html코드=
(
<title>
정규식 파싱연습</title>
<meta property="og:type" content="test"/>
<meta property="og:title" content="제목1"/>
<meta property="og:title" content="제목2"/>
<meta property="og:title" content="제목3"/>
<meta property="og:url" content="http://naver.com"/>
<meta property="og:image" content="1.jpg"/>
<meta property="og:description" content="안녕하세요"/>
)
ToolTip, %html코드%
Sleep, 1000
c  := "og:title(.*?)content=""(.*?)""(.*?)"
RegExMatch(html코드, c c c, arr)
ToolTip, % arr2 "`n" arr5 "`n" arr8
return