;==Script 내용==

#SingleInstance Force
Gui,Font,bold
Gui,Font,S15 bold
Gui, Add, ListView, x0 y0 w700 h640 Choose vbox gbbb,번호|제목
Gui, Add, Edit, x312 y-1 w0 h0 hwndh제목 Center vDATA, Edit
Gui, Add, Edit, x312 y49 w0 h0 -VScroll vDATA2, Edit
Gui, Add, Button, x562 y9 w140 h70 gWrite, 글쓰기
; Generated using SmartGUI Creator for SciTE
Gui, Show, w752 h645, Untitled GUI
return

bbb:
Gui,Submit,Nohide
MsgBox % box
Return

GuiClose:
WinKill, ielowutil
WinKill, iexplore
ExitApp

Write:
Gui,Submit,Nohide

global pos := 0

DATA = %DATA%
DATA2 = %DATA2%

global WEB := ComObjCreate("InternetExplorer.Application")
WEB.Navigate("https://nid.naver.com/nidlogin.login?url=http://www.naver.com") 
Check()
WEB.document.getElementById("id").value:="wmf2225"
WEB.document.getElementById("pw").value:="guswnd7606"
WEB.document.getElementsByClassName("login_form")[0].children[5].click()
Check()
WEB.Navigate("http://cafe.naver.com/CafeMemberNetworkView.nhn?m=view&clubid=29272399&memberid=wmf2225&networkSearchKey=Article&networkSearchType=7")
Check()

index := 0
pageindex := 1
length := WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("innerNetwork").contentWindow.document.getElementsByClassName("board-box board-reply")[0].children[2].querySelectorAll("a[class='m-tcol-c ']").length

Loop {
	str1 := WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("innerNetwork").contentWindow.document.getElementsByClassName("board-box board-reply")[0].children[2].querySelectorAll("a[class='m-tcol-c ']")[index].outerHTML

	
	if (index == 0) {			; 현제페이지의 게시물이 첫번째일때
		if (str1 == str2) {		; 현제 게시물이 임시공간에 있는거랑 같으면 
			break				; 루프 탈출
		}
		str2 := str1
	}
	;<a class=""m-tcol-c "" href=""javascript:goArticle((.*?));"">(.*?)</a>
	pos++
	if (pos != 0) 	; 처음 시작할때

	{	RegExMatch(str1,"(.*?))(.*?)>(.*?)</a>",Output, pos)
		LV_Add(, Output1, Output2)
		pos = 0
	}
		
	
	if(index == (length-1)) {	; 현제 페이지의 게시물의 마지막에 도달하면
		; 다음페이지클릭
		WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("innerNetwork").contentWindow.document.getElementsByClassName("Nnavi")[0].children[1].children[0].children[pageindex].children[0].click()
		Check()
		pageindex++
		index := 0
		; 현제 게시물의 길이
		length := WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("innerNetwork").contentWindow.document.getElementsByClassName("board-box board-reply")[0].children[2].querySelectorAll("a[class='m-tcol-c ']").length
		Check()
	} else {
		index++	; 현제페이지의 마지막 페이지에 도달할때까지
	}
	
	
	;MsgBox % str1
}


;msgbox % WEB.document.body
;Check()
;WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("replyFormBtn").click()
;Check()
;WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("subject").click()
;WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("subject").value:=DATA
;WEB.document.getElementById("cafe_main").contentWindow.document.querySelectorAll("iframe[src='/common/editor/default.html']")[0].contentWindow.document.body.innerHTML := DATA2
;WEB.document.getElementById("cafe_main").contentWindow.document.getElementById("cafewritebtn").click() 
;Check()
;Check()
;WEB.Visible:=true 
;Sleep, 5000
;WEB.quit()
Return

;WEB Load Check
Check()
{
Loop
{
   Sleep, 500
   if(WEB.ReadyState = 4)
   {
      break 
   }
} 
}

;EditType
;Type1_Edit(hwnd, Cue) { 
;Static EM_SETCUEBANNER := (0x1500 + 1)
;Return DllCall("User32.dll\SendMessageW", "Ptr", hwnd, "Uint", EM_SETCUEBANNER, "Ptr", True, "WStr", Cue)
;}