F1::
/*
Google Play 기프트 코드 

500,000원
상품명 Google Play 기프트 코드 500,000원
구매수량 5매
기프트 코드번호  
90JP M656 WWHL LXVK 
(카드번호 : 6369332205434516335)
6Z4A WTWL ZWGJ 7RB8 
(카드번호 : 6369330369643651015)
F7PZ DAFU 1744 1EZM 
(카드번호 : 6369333505498609359)
GSD9 Y7MR ZFVB 9DBU 
(카드번호 : 6369330568121231126)
ENDG VHZK C63E HJFK 
(카드번호 : 6369332813091603799)
기프트코드 자동입력하기
기프트코드 자동입력하기
기프트코드 자동입력하기
기프트코드 자동입력하기
기프트코드 자동입력하기
*/
str =
pos=1
while pos := RegExMatch(Clipboard, "([A-Z0-9\s]{21}\n\((.*)\))", SubPat, pos+StrLen(SubPat))
    str .= SubPat "`n"
msgbox %str%
return
