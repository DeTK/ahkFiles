
f1::
소스  := "2018-05-11&nbsp; 포인트2018-05-10&nbsp; 포인트2018-05-08&nbsp; 접수2018-05-08&nbsp; 전화2018-05-02&nbsp; ★★2018-05-02&nbsp; 2018년2018-04-17&nbsp; 접수"
ss := RegExReplace(소스, "m)^\s*(.*)&nbsp;\s", $1)
StringReplace, 소스, ss, &nbsp;%A_Space%,  `r`n, all
return