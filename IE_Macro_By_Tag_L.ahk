IE_Macro( pwb , method , method_value , method_usage_type , tag_type , tag_option_name, tag_option_value , tag_search_count=1 , tag_search_Exact=1, frame="")
{
;http://www.autohotkey.co.kr/cgi/board.php?bo_table=script&wr_id=1938
/*
->>	[ method ]
	이 값을 통해 명령을 발생 시킴
	click()			:	대부분 태그에 사용
						해당 태그부분을 클릭
	focus()			:	대부분 태그에 사용
						초점을 맞춰주는 역할
	checked			:	주로 checkbox에 사용
						method_value = true,false or 1,0
	value			:	대부분 태그에 사용
						method_value = 입력할값
						* 입출력 모두가능
	outerHTML		:	찾아진 노드의 태그
						method_value = 입력할태그
						* 입출력 모두가능
	outerText		:	찾아진 노드의 태그의 텍스트
						method_value = 입력할 텍스트
						* 입출력 모두가능
	innerHTML		:	찾아진 노드의 하위 노드의 태그
						method_value = 입력할태그
						* 입출력 모두가능
	innerText		:	찾아진 노드의 하위 노드의 텍스트
						method_value = 입력할 텍스트
						* 입출력 모두가능
	selectedIndex	:	SELECT태그에 사용
						method_value = 0~[n-1]
						* 입출력 모두가능
	table			:	table 태그관련 설명
						rows.length
						cells.length
						rows.item(var)		:	var = index or id or name
						cells.item(var)		:	var = index or id or name
						ex)		rows.item(0).cells.item(0).innerHTML
						*입출력 모두가능
	기타 속성 가능	:	src,href,width,height,length ...
	
->>	[ method_value ]
	method중에 값을 입력시킬경우 사용한다.
	method_usage_type=1 or 2를 사용한다.
	
->>	[ method_usage_type ]
	0	:	method에 따라 값을 반환받음 (출력)
	1	:	method에 따라 method_value를 입력 (입력)
			click(),focus()를 할때도 사용 (이경우 method_value 값은 불필요)
	2	:	execScript
			이 명령을 사용할땐, tag series,frame변수 전부 무의미
			ex)	method=javascript
				method_value=alert('hello')


->>	[ tag_type ],[ tag_option_name ],[ tag_option_value ],[ tag_search_count ],[tag_search_Exact]
	간단한 예시로 설명을 시작
	ex)		tag_type=INPUT
			tag_option_name=src
			tag_option_value=http://www.test.com/test.gif
			tag_search_Exact:=1
			tag_search_count:=1
		의미)
		현재 HTML document내에서
		<INPUT> 태그들중							-	tag_type=INPUT
		속성 <src>값이 								-	tag_option_name=src
		<http://www.test.com/test.gif> 과			-	tag_option_value=http://www.test.com/test.gif
		첫번째로									-	tag_search_count:=1
		정확히 일치하는	것을 찾는다.				-	tag_search_Exact:=1
	
	-	[ tag_type ]
		method를 진행하기위해서 이용할 Tag Element
	
	-	[ tag_option_name ]
		1. id,name이 가정 정확하게 원하는 Tag Element에 접근이 쉽다.
		2. index는 값이 원하는 페이지들 내에서 변하지 않는다면 이용할만 하다.
		3. 나머지 tag_option_name은 in,name,index로 접근이 어려우나,
		원하는 페이지들 내에서 이용할만하다고 판단되면 이용한다.
		
		index			:	Tag_type과 같은 이름의 Tag중 몇번째에 해당되는지
							0 ~ [n-1]
							getElementsByTagName()과 같음
		id				:	id명
		name			:	name명
							id명 혹은 name명이 정확하게 주어질경우
							tag_type과 같은 tag명을 가진 Element 중 원하는것에 정확하게 접근가능하다
		className,	type,	width,	src,	href	...등 모든 속성 가능
	
	-	[ tag_option_value ]
		tag_option_name에 해당되는 검색할값
		
	-	[ tag_search_count ]
		몇번째 일치하는 것을 찾는지 지정
		
	-	[ tag_search_Exact ]
		1 - 정확한것을 찾음
		0 - ifinstring을 통해 포함된것을 찾음
	
	
->>	[ frame ]
	이값을 통해서 frame내부의 HTML document에 접근이 가능하다
	index or name or id
	ex) frame=FRAME=jsright,FRAME=jsmain
		frame=FRAME=1,FRAME=1
		frame=IFRAME=loginframe
*/
	
	;~ 디버깅이 필요할땐 Com_Error(true)
	Com_Error(false)
	
	if ( pwb = "" ) or ( method = "" )
		return false
	
	if (method_usage_type = 2)
		return COM_Invoke(pwb,	"document.parentWindow.execScript", method_value	, method)
	
	if ( frame <> "" )
	{
		Loop,parse,frame,`,
		{
			StringSplit,frame_var,A_Loopfield,=
			if frame_var2 is integer
				frame_code .= "document.all.tags('" frame_var1 "').item(" frame_var2 ").contentWindow."
			else
				frame_code .= "document.all.tags('" frame_var1 "').item('" frame_var2 "').contentWindow."
		}
		StringTrimRight,frame_code,frame_code,1
		found_pwb:=COM_Invoke(pwb, frame_code)
		if (found_pwb="")
			return false
	}
	else
		found_pwb:=pwb
	
	Found_Element	:=	Find_Correspond_Java(found_pwb , tag_type , tag_option_name , tag_option_value , search_value , tag_search_count , tag_search_Exact)
	if (Found_Element="")
		return false
	
	;~ Clipboard:="javascript:" frame_code "." Found_Element
	if (method_usage_type = 1)
		return COM_Invoke(Found_pwb,	Found_Element		"." method, method_value)
	else
		return COM_Invoke(Found_pwb,	Found_Element		"." method)
}


IE_Loading_Check(pwb, frame="")
{
	;~ 설정	로딩대기 최대시간 (단위 : 초)
	Loading_Maximum:=10
	
	Com_Error(false)
	if ( pwb = "" )
		return false
	if ( frame <> "" )
	{
		Loop,parse,frame,`,
		{
			StringSplit,frame_var,A_Loopfield,=
			if frame_var2 is integer
				frame_code .= "document.all.tags('" frame_var1 "').item(" frame_var2 ").contentWindow."
			else
				frame_code .= "document.all.tags('" frame_var1 "').item('" frame_var2 "').contentWindow."
		}
		StringTrimRight,frame_code,frame_code,1
		found_pwb:=COM_Invoke(pwb, frame_code)
		if (found_pwb="")
			return false
	}
	else
		found_pwb:=pwb
	
	Loop % Loading_Maximum*10
	{
		sleep 100
		Loading_state:=COM_Invoke(found_pwb,"document.readyState")
		;~ if (Loading_state="interactive") or Loading_state="complete") 로 사용하거나 선택
		if (Loading_state="complete")
			return true
	}
	return false
}





Find_Correspond_Java(pwb , tag_type , tag_option_name , tag_option_value , search_value , tag_search_count , tag_search_Exact)
{
	if tag_option_name in name,id,index
	{
		if ( tag_option_name = "index" )
			return "document.all.tags('" tag_type "').item(" tag_option_value ")"
		else
			Found_Element:="document.all.tags('" tag_type "').item('" tag_option_value "')"
		if tag_option_name in name,id
		{
			if COM_Invoke(pwb, Found_Element "." tag_option_name) = tag_option_value
				return Found_Element
			else
				Found_Element:=""
				;~ 여기에 진입되는 경우는 id와 name이 중복되게 다른 Element에서 사용되어서 발생
				;~ 찾지 못함으로 판단되므로 검색으로 넘어가게함
		}
	}
	if (Found_Element="")
	{
		Loop % COM_Invoke(pwb, "document.all.tags(" tag_type ").length")
		{
			search_value:=COM_Invoke(pwb, "document.all.tags(" tag_type ").item(" A_index-1 ")." tag_option_name)
			if ( tag_search_Exact )    AND    ( search_value = tag_option_value )
				search_found++
			else if ( tag_search_Exact = 0 )
			{
				IfInString,search_value,% tag_option_value
					search_found++
			}
			if ( search_found = tag_search_count )
				return "document.all.tags('" tag_type "').item(" A_index-1 ")"
		}
	}
	return
}

Get_pwb(ByRef pwb,Wintitle="A")
{
	;	by Sean
    ;   http://www.autohotkey.com/forum/topic19256.html
    ControlGet, hIESvr, hWnd, , Internet Explorer_Server1, %Wintitle%
    if (hIESvr ="")
        return 0
    return_val:=DllCall("SendMessageTimeout", "Uint", hIESvr, "Uint", DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT"), "Uint", 0, "Uint", 0, "Uint", 2, "Uint", 1000, "UintP", lResult) 
   &&   DllCall("oleacc\ObjectFromLresult", "Uint", lResult, "Uint", COM_GUID4String(IID_IHTMLDocument2,"{332C4425-26CB-11D0-B483-00C04FD90119}"), "int", 0, "UintP", pdoc)=0 
   &&   pdoc && pwb:=COM_QueryService(pdoc,IID_IWebBrowserApp:="{0002DF05-0000-0000-C000-000000000046}")
    COM_Release(pdoc)
    
    return return_val
}