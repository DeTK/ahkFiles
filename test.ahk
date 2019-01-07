F1::
WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
WebRequest.Open("GET", "https://www.coinbit.co.kr/customer/main")
WebRequest.Send()
;RegExMatch(WebRequest.ResponseText, "(?<=<h2>).*?(?=</h2>)", ver)
;MsgBox % ver
;WebRequest := ""
Clipboard := WebRequest.ResponseText
Return이거 닌거같