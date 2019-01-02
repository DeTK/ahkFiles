#Include Gdip.ahk
#Include Gdip_ImageSearch.ahk

CoordMode, mouse, Relative
CoordMode, Pixel, Relative

SetTitleMatchMode, 2
#SingleInstance, force
SetBatchLines, -1
 
global 타이틀 =


Gui, Add, Edit, x180 y41 w50 h20 vt, 일테스트
Gui, show, w270, 퀘스트 진행
return

F5::
Gui, Submit, NoHide
ToolTip
WinGet, hwnd, ID, %t% ; 해당 타이틀에 맞는창의 핸들을 hwnd에 담아준다.

타이틀 := t

클릭(hwnd, "삼", "구글") ; 앞에 삼이미지만 클릭하고 구글은 이미지만 찾아지게끔
tempText := 클릭(hwnd, "구글", "공지사항", "게임") ; 구글이미지를 클릭했는데 공지가 뜰수도있고 게임이 보일수있는 경우
if (tempText == "공지사항")
{
	포스트클릭((128|277<<16)) ; 오늘하루 공지안보기 클릭
	포스트클릭((266|279<<16)) ; 닫기 클릭
}
클릭(hwnd, "게임","게임",,,,1) ; 게임을 누르고 이벤끄기 전 로딩시간중에 무한클릭방지 위해서 클릭여부 1이 들어간다
포스트클릭((265|295<<16)) ; 게임 시작 클릭
클릭(hwnd, "이벤끄기","이벤끄기")
	
return


F6:: Reload

클릭(핸들, 이미지1, 이미지2, 이미지3 = "", x = 0, y = 0, 클릭여부 = 0)
{
	tempc = 1
	Loop
	{
		if (이미지서치(핸들, 이미지1, lparam, x, y) == 0) ; 만약에 첫번째 이미지를 찾은경우
		{
			
			Sleep, 10 ; 과부화 방지
			
			다시한번클릭: ; goto문 라벨
			포스트클릭(lparam,, 클릭여부) ; 해당이미지를 클릭한다.
			if (이미지3 == "") ; 만약에 이미지3이 비어있다면
			{
				if (이미지1 == 이미지2 && tempc == 0)
				{
					break
				}
				if (이미지서치(핸들, 이미지2) == 1) ; 만약에 이미지2를 찾지 못한경우
				{
					tempc = 0
					goto, 다시한번클릭 ; 이미지2가 안보인다는 의미는 이미지1이 클릭이 안됬다는의미 이므로 한번더 클릭
				}
			}
			else
			{
				sleep, 1000
				f1 = 0
				f2 = 0				
				loop, 5
				{
					f1 := 이미지서치(핸들, 이미지2) == 0 ? f1 := f1 + 1 : 0 ; 이미지2를 찾은경우에는 증가시켜준다.
					sleep, 75
					f2 := 이미지서치(핸들, 이미지3) == 0 ? f2 := f2 + 1 : 0 ; 이미지3를 찾은경우에는 증가시켜준다.
				}
				return f1 > f2 ? 이미지2 : 이미지3 ; 큰쪽의 이름을 넘겨준다.				
			}
			break ; 루프안이기 때문에 나가기위해서
		}
	}
	return
}


포스트클릭(L, 반복횟수 = 1, 클릭여부 = 0)
{
	if (클릭여부 == 0)
	{
		loop, %반복횟수%
		{
			PostMessage, 0x201, 1, %L%,, %타이틀% ; 마우스 왼클릭 다운
			Sleep, 50
			PostMessage, 0x202, 0, %L%,, %타이틀% ; 마우스 왼클릭 업
		}
	}	
	return
}





; 
이미지서치(핸들, 이미지, ByRef LP = 0, x = 0, y = 0)
{	
	Critical, on
	gdipToken := Gdip_Startup() ; gdip을 라이브러리를 사용한다.
	; Haystack := Gdip_BitmapFromScreen() ; 전체화면
	Haystack := Gdip_BitmapFromHWND(핸들) ; 검색할 화면
	Needle := Gdip_CreateBitmapFromFile("F:\게임\삼국지대전m\a\" 이미지 ".bmp") ; 찾고자하는 이미지
	Gdip_GetImageDimensions(Needle, posX, posY) ; 찾고자하는 이미지의 길이와 넓이를 가져온다.
	Gdip_SetBitmapToClipboard(Haystack) ; 해당화면의 캡쳐한다. (뭔가 안될때 잘캡쳐되나 확인할때)
	; Gdip_SetBitmapToClipboard(Needle) ; 해당화면의 캡쳐한다. (뭔가 안될때 잘캡쳐되나 확인할때)
	; Gdip_ImageSearch(핸들,이미지,ByRef 리스트,X1,Y1,X2,Y2,오차값,투명도,검색방향,찾고자하는수,[라인피드",구분자]) 현재 라인피드와 구분자는 안넣은 상태다
	RET := Gdip_ImageSearch(Haystack,Needle,LIST,0,0,0,0,0,0xFFFFFF,1,0) ; 여기가 서치부분 인자부분은 이의 설명대로
	Gdip_DisposeImage(Haystack) ;초기화 해준다.
	Gdip_DisposeImage(Needle) ; 초기화 해준다.
	Gdip_Shutdown(gdipToken) ; 꺼준다
	
	if (RET == 1)  ; 이미지를 하나라도 찾은경우		
	{
		StringSplit, position, LIST, `, ; 문자열에서 , 기준으로 나눠준다. , 의 갯수만큼 +n이 붙어서 생성된다.
		
		LP := position1 + x|position2 + y<<16 ; x y 를 lparam으로 바꿔준다.
		OutputDebug, % "x = " position1 " y = " position2 " lparam = " LP
		Critical, off
		return 0
	}
	else
	{
		Gdip_DisposeImage(Haystack) ;초기화 해준다.
		Gdip_DisposeImage(Needle) ; 초기화 해준다.
		Gdip_Shutdown(gdipToken) ; 꺼준다
		Critical, off
		return 1
	}
}