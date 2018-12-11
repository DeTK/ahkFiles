com_init()
ie := com_CreateObject("chrome.Application.1") 
; 인터넷 익스플로어 응용프로그램 객체생성

com_invoke(ie, "top=", 0)
com_invoke(ie, "left=", 0)
com_invoke(ie, "width=", 800)
com_invoke(ie, "height=", 600)
com_invoke(ie, "visible=", 1) 
; 인터넷 익스프롤어 속성중 visible 속성은 1로(즉, 보이게 만듬)

com_invoke(ie, "navigate", "http://www.autohotkey.com") 
; ie 의 메소드(함수) 중 navigate 함수를 실행(파라미터로 주소를 써주면 된다.)

Loop
{
if not (com_invoke(ie, "busy"))   ; 페이지 로드때까지 기둘려
  break
sleep, 100
}

Doc := com_invoke(ie, "Document")
body := com_invoke(doc, "body")
innerhtml := com_invoke(body, "innerHtml")
outerhtml := com_invoke(body, "outerHtml")
;msgbox, %outerhtml%   ; html 소스구하기

msgbox, 화면확대, 축소 신공이 이어집니다.
bodystyle := com_invoke(body, "style")
com_invoke(ie, "width=", A_ScreenWidth)
com_invoke(ie, "height=", A_screenHeight)
com_invoke(bodystyle, "zoom=", "150%") ; 화면을 확대하시겠습니다.
sleep, 2000
com_invoke(bodystyle, "zoom=", "300%") ; 화면을 확대하시겠습니다.
sleep, 2000
com_invoke(bodystyle, "zoom=", "100%") ; 화면을 확대하시겠습니다.
sleep, 2000
msgbox, 이번에는 현재 페이지에서 링크 5개만 찾아내겠습니다.

links := com_invoke(doc, "getElementsByTagName", "a") ; a 태그만 잡아내자
count_links := com_invoke(links, "length")   ; a 태그로 잡힌 개수

Loop, %count_links%
{
  if A_index = 6
    break
  A_link  := com_invoke(links, A_index) ; 이제 a 태그로 된 것 항목하나하나 얻는다.
  url     := com_invoke(A_link, "href") ; 링크항목에 걸린 url 을 얻는다.
  msgbox, %url%
}

com_invoke(doc, "writeln", "<h1>이것 이외에도 많은 메소드가 있습니다.</h1><br>")
sleep, 2000
com_invoke(doc, "writeln", "나머지는 여러분들이 연구해서 나두좀 알려주셈~<br>")
sleep, 3000
com_invoke(doc, "writeln", "<h1><font color='#0000FF'><strong>이제까지 좀비영문이었습니다. </strong></font></h1><br> ")
sleep, 3000
com_invoke(doc, "writeln", "<h1><font color='#0000FF'><strong>이젠 강좌는 없습니다. 넘힘들어요~ </strong></font></h1><br> ")
sleep, 2000
com_invoke(doc, "writeln", "<h1><font color='#0000FF'><strong>대신 기회나면 포럼에서 좋은글 소개하는 방향으로 하겠습니다.</strong></font></h1><br><br> ")
sleep, 3000
com_invoke(doc, "writeln", "<h1><font color='#FF0000'><strong>자네들이 보고 있는 익스플로어는 잠시후 자동폭파하네~ </strong></font></h1> ")
sleep, 5000
com_invoke(ie, "quit")
com_release(ie) ; 객체를 참조하는 객체카운트를 하나 줄여준다. 만약 하나밖에 없으면 소멸히켜준다. 사실상 필요없음.