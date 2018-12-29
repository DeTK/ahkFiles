#SingleInstance, force

url := "https://www.instagram.com/accounts/login/ajax/"
F1::
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.open("POST", url, false)
http.SetTimeouts(6000,6000,6000,6000) ;제한 시간을 6 초로 설정하십시오.
http.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36")
http.SetRequestHeader("Referer", "https://www.instagram.com/")
http.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
http.SetRequestHeader("CooKie","mid=XBybjgALAAHrhiD-aOlTtM_3udmg; mcd=3; fbm_124024574287414=base_domain=.instagram.com; shbid=8964; shbts=1545384125.6682591; rur=FRC; fbsr_124024574287414=rBZjZGRmLIV-153Uo553TLyt0zMaZv3lvuqIvE2lMGk.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUNqdkJnb0hGek83eXFaQWtZd2dGRmszQU1wSVQtNGcxSE1LYjFSdFhUWWtubGNSbkZvZ25FNXpEZkRKUUJEYmQyMnotdEFQV1laZUQ2Rjl6eThTRnF3a2NYSkxFU1MwVkg1cUUyaE1pTWNod0RiZ29FYURsMmhEd3lsdnBfQkg4MTBnaXg2dk5tQkh2Ukw1dU1ET3B3TWJjcTRXQ0prRi1McmVwSm9mQnhoMnBfZ0c4b28xbEtaTE9QeW4wd0Fxb2hQMFlhRGFLWkRmS2NON2pXWTROaWljU2IwSXBJeVBNQTNMQU5BbGxZYWhtWEctVUFoTkFudWFhZzBTZEZnYmQxSFF0QnBDS3gyUkw2NDd2NVZMY1pmby1uODJHdmExNXdVZnlPbHlMWXpZV2czZ1hFLVJUVXA4US16bU1kTnIxUUg0ejlDSzVJNXZwYlhpaWthTnRTaSIsImlzc3VlZF9hdCI6MTU0NTQwMjY0MiwidXNlcl9pZCI6IjEwMDAwNDAxODc0MjQxNCJ9; ds_user_id=3262833024; urlgen=""{\""119.197.14.25\"": 4766}:1gaLp5:NTPYdjfBPeObHKWm6SEo7tDeiwM""; sessionid=3262833024%3AE1kV2xezWRJmGv%3A3; csrftoken=dTZlDfeGnpQ3iuwvc3hGhZKqb47U8YNI")
http.send("username=sda2225%40gmail.com&password=skaltk12&queryParams=%7B%7D")

JSONString = "{""method"":""submit"",""params"":{""id"":""5fed9ef5-0d8d-4ba6-aa80-e03f56e0b585"",""job_id"":""Tom81VP3/jpsj30UkNR6KULXSYKi"",""nonce"":""c0030000"",""result"":""e7a80d979f44b5538912f98bd9e780188e6f47d1aa58085d6ac9d7cdb4a82600""},""id"":1}"
;http.WinH
http.WaitForResponse()
Loop
{
    ToolTip,% http.status
    if (http.status == 200)
    {
        ToolTip, 끝
        break
    }
}

return
