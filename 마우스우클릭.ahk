  /*
������ : png  (dnstlr14@naver.com)

��� : AutoHotkey




��Ÿ :

���̹� ����ī�信��

http://cafe.naver.com/gogoomas/300284

�� ������� ������Ű�� ������.

AutoHotkey �ڵ��ϸ鼭 �𸣴°� ������

1:1 ���� �ֽø� �亯�ص帲




key1 = sessionKey

key2 = keyName

key3 = eValue

key4 = nValue

*/

#SingleInstance Force

#NoEnv




title = Naver RSA Login

Gui,Add,Edit, x15 y20 w100 h20 vEdit_id +Center

Gui,Add,Edit, xp yp+30 wp hp vEdit_pw +Password* +Center

Gui,Add,Button, xp yp+35 w80 h35 gFlag_run, Ȯ��

Gui, show, w250 h200, %title%

return




F2::

Flag_run:

Gui,submit,nohide ; GUI ���� ��� ȣ��

if (Naver_Login(Edit_id,Edit_pw) = true)

 MsgBox �α��� ����

else

 MsgBox �α��� ����

return




Naver_Login(user_id, user_pw)

{

 global Winhttp

FileEncoding, UTF-8

id := user_id

pw := user_pw

;// ScriptControl

sc :=  ComObjCreate("ScriptControl")

sc.Language := "JavaScript" ;// �ڹٽ�ũ��Ʈ

FileRead, js_script, %A_ScriptDir%\rsa_lib.txt

sc.reset

sc.AddCode(js_script)

;// WinHttpRequest

Winhttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")

Winhttp.Open("GET","http://static.nid.naver.com/enclogin/keys.nhn")

Winhttp.Send

SendKey := StrSplit(Winhttp.responsetext, "`,")

;// .= �����ڴ� ����

vData =

vData .= "enctp=1"

vData .= "&encpw=" . sc.run("createRsaKey", Id, pw, SendKey[1], SendKey[2], SendKey[3], SendKey[4]) 

vData .= "&encnm=" . SendKey[2]

vData .= "&svctype=" . "0"

vData .= "&id="

vData .= "&pw="

vData .= "&x=" . "35"

HeaderString .= "&y=" . "14"

Winhttp.Open("POST","https://nid.naver.com/nidlogin.login")

Winhttp.SetRequestHeader("Referer","http://static.nid.naver.com/login.nhn?svc=wme&amp;url=http%3A%2F%2Fwww.naver.com&amp;t=20120425")

Winhttp.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")

Winhttp.Send(vData)

Winhttp.WaitForResponse

txt_str := Winhttp.Responsetext

IfInString, txt_str, /sso/

 return true

else

 return false

}

return







F3::ExitApp













/*

JScript Example

sc := ComObjCreate("ScriptControl")




;// define the Language

sc.Language := "JScript"




;// define the JScript

script =

(

string = '';

obj = { 'Name':'AutoHotkey', 'URL':'www.AutoHotkey.com', 'Color':'Green' };

for (i in obj)

string += i + ' = ' + obj[i] + '\n';

)




;// execute the JScript

sc.ExecuteStatement(script)




;// extract a value from the JScript

MsgBox, 0, JScript Variable "string":, % sc.Eval("string")




;// extract an Object from the JScript

obj := sc.Eval("obj")

MsgBox, 0, Elements from the JScript Object:, % "Name: " obj.Name "`nURL: " obj.URL

[��ó] [1] ������Ű - ���̹� RSA �α���|�ۼ��� ��ƾ��
