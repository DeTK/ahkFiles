Gui, Add, Text, x5 y10 w100 h20 v요일1
Gui, Add, Text, x110 y10 w110 h20 v요일2
Gui, Add, Button, x5 y30 w30 h30 g요일체크, 월
Gui, Add, Button, x40 y30 w30 h30 g요일체크, 화
Gui, Add, Button, x75 y30 w30 h30 g요일체크, 수
Gui, Add, Button, x110 y30 w30 h30 g요일체크, 목
Gui, Add, Button, x145 y30 w30 h30 g요일체크, 금
Gui, Add, Button, x180 y30 w30 h30 g요일체크, 토
Gui, Add, Button, x215 y30 w30 h30 g요일체크, 일
Gui, show, w250 h65, 요일
return



요일체크:
for i, day in ["월","화","수","목","금","토","일"] {
    if (A_GuiControl == day){
        gosub, A
        sleep, 1000
        clipboard := day "도출가" ; 요일 구분
        sleep, 1000
        gosub, B
        sleep, 1000
        clipboard := day "소수절가" ; 요일 구분
        sleep, 1000
        gosub, C
    }
}
return


A:
GuiControl,, 요일1,
GuiControl,, 요일2,
return
B:
GuiControl,, 요일1, %clipboard% 입니다.
return
C:
GuiControl,, 요일2, %clipboard% 입니다.
return
