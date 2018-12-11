WinHttpHeader(RequestHeader:="") {
	global WinHttp
	count:=0
	for index,element in RequestHeader
		WinHttp.SetRequestHeader(index,element),count++
	return count
}

WinHttpDownload(url,file,RequestHeader:="") {
	global WinHttp
	WinHttp:=WinHttp?WinHttp:ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WinHttp.Open("GET",url)
	WinHttpHeader(RequestHeader)
	WinHttp.Send()
	p:=ComObjQuery(WinHttp.ResponseStream,"{0000000c-0000-0000-C000-000000000046}")
	f:=fileopen(file,"w")
	loop{
		varsetcapacity(b,8192)
		r:=dllcall(numget(numget(p+0)+3*a_ptrsize),ptr,p,ptr,&b,uint,8192, "ptr*",c)
		f.rawwrite(&b,c)
	}until (c=0)
	objrelease(p)
	f.close()
	return WinHttp.ResponseText
}