#SingleInstance force
global WEB := ComObjCreate("InternetExplorer.Application")
Gui, Add, Edit, x12 y9 w100 h20 vid, 아이디
Gui, Add, Edit, x12 y39 w100 h20 vpw Password, 비밀번호
Gui, Add, Button, x122 y9 w60 h50 ggo, 출석
; Generated using SmartGUI Creator for SciTE
Gui, Show, w199 h78, Untitled GUI
return

GuiClose:
WEB.quit()
ExitApp

go:
Gui,Submit,NoHide
id =%id%
pw =%pw%
str := "<p>같은아이피로 설정된 횟수 이상 중복출석하실 수 없습니다.</p>"
try {
   WEB.Navigate("https://m16.me/")
   Check()
   WEB.document.getElementById("user_id").value:=id
   WEB.document.getElementById("password").value:=pw

   WEB.document.querySelectorAll("button[class='btn btn-primary btn-block omdoll_member_button']")[0].click()
   WEB.Navigate("https://m16.me/attendance")
   Check()
   WEB.document.getElementsByClassName("x_btn x_btn-inverse sm-btn")[0].click()
   Check()
   checks := WEB.document.getElementsByClassName("sat")[1].getElementsByClassName("message error")[0].children[0].outerHTML
   Check()
   if(checks != str) {
      MsgBox,,,출석체크완료!,1
   } else {
      MsgBox,,,이미 출석하셨거나 없는 아이디이거나 틀린 비밀번호 입니다.,1
   }
} catch {
   MsgBox,,,현재 IP는 오늘 이미 사용한 IP입니다!,1
} finally {
   WEB.Visible:=false
   WEB.quit()
   ExitApp
}


;-----------------------------------------------------------------
Check() {
   Loop {
      Sleep, 500
      if(WEB.ReadyState == 4) {
         break 
      }
   } 
}
;-----------------------------------------------------------------
