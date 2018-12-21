#SingleInstance, force

url := "https://www.instagram.com"
F1::
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.SetTimeouts(6000,6000,6000,6000) ;제한 시간을 6 초로 설정하십시오.
http.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36")
http.SetRequestHeader("Referer", url)

http.open("GET", url, true)
JSONString = "{""method"":""submit"",""params"":{""id"":""5fed9ef5-0d8d-4ba6-aa80-e03f56e0b585"",""job_id"":""Tom81VP3/jpsj30UkNR6KULXSYKi"",""nonce"":""c0030000"",""result"":""e7a80d979f44b5538912f98bd9e780188e6f47d1aa58085d6ac9d7cdb4a82600""},""id"":1}"
http.send(JSONString)
;http.WaitForResponse()
Loop
{
    if (http.status == 200)
    {
        Clipboard := http.ResponseText
        ToolTip, 끝
        break
    }
}


return
