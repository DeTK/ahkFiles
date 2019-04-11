global WEB := ComObjCreate("InternetExplorer.Application")
WEB.visible := True
WEB.Navigate("https://appzzang.me/bbs/login.php?url=%2F")
Check()
WEB.document.querySelector("#login_id").value := "아디"
WEB.document.querySelector("#login_pw").value := "비번"
WEB.document.querySelector("body > div.row.login-main > div > div > div.form-body > form > div:nth-child(5) > div > button").click()
WEB.Navigate("방명록주소")
Check()
WEB.document.querySelector("#my_frame").contentWindow.document.querySelector("#wr_content").innerHTML := "djsaklfjasdlkf"






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