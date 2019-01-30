
; 사용한 라이브러리
; #Include Gdip.ahk
; #Include Gdip_ImageSearch.ahk

class MyLib
{

	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 이미지 주변을 감싸는 사각형 생성
	; Funtion Name = createSquare

	; wId          = 현재창의위치를 알기위해서 고유 아이디를(핸들)
	; posList      = Inactive_Search 함수의 Return
	; imageNum     = 사각형을 그릴 이미지 순서
	createSquare(winId, posList, imageNum)
	{
		global
		Gui, GUI_Drawing: Destroy
		Gui, GUI_Drawing: +AlwaysOnTop +E0x20 -Caption +E0x80000 -Border +ToolWindow +OwnDialogs +Owner  +LastFound
		Gui, GUI_Drawing: Show, NA, GUI_Drawing
		GDI_Token := Gdip_Startup()
		GDI_Hwnd := WinExist("GUI_Drawing") ; 현재 구이의 고유 아이디
		GDI_Hbm := CreateDIBSection(A_ScreenWidth, A_ScreenHeight)  ; 영역 지정
		GDI_Hdc := CreateCompatibleDC()
		GDI_Obm := SelectObject(GDI_Hdc, GDI_Hbm)
		GDI_G := Gdip_GraphicsFromHDC(GDI_Hdc)
		Gdip_GraphicsClear(GDI_G)  ; 이것은 그래픽의 전체 영역을 'transparent'로 설정합니다.
		Gdip_SetSmoothingMode(GDI_G, 4) ; 안티
		GDI_Pen := Gdip_CreatePen(0xFF this.Convert("X", [this.Random(200, 255), this.Random(200, 255), this.Random(200, 255)]), 3)
		; 마우스의좌표인 lparam을 x와y로 분리하는방법
		; winX := (posList[imageNum + 2] & 0xffff) + winX		           ; 찾은 x좌표 + 현재창의 x
		; winY := ((posList[imageNum + 2] >> 16) & 0xffff) + winY         ; 찾은 y좌표 + 현재창의 y
		WinGetPos, winX, winY,,, ahk_id %winId%
		winX := posList[imageNum + 2][1] + winX		           ; 찾은 x좌표 + 현재창의 x
		winY := posList[imageNum + 2][2] + winY         ; 찾은 y좌표 + 현재창의 y
		Gdip_DrawRectangle(GDI_G, GDI_Pen, winX - 5, winY - 5, posList[2][1] + 9, posList[2][2] + 9)
		Gdip_DeletePen(GDI_Pen)
		UpdateLayeredWindow(GDI_Hwnd, GDI_Hdc, 0, 0, A_ScreenWidth, A_ScreenHeight)
		SelectObject(GDI_Hdc, GDI_Obm)
		DeleteObject(GDI_Hbm)
		DeleteDC(GDI_Hdc)
		Gdip_DeleteGraphics(GDI_G)
		Gdip_Shutdown(GDI_Token)
		return
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 비활성으로 해당 좌표 클릭하기
	; Funtion Name   = clickInactive

	; lParam         = x|y<<16 예) 500|500<<16
	; title          = 문자열로 이루어진 타이틀
	; clickCount     = 클릭하고 싶은횟수
	clickInactive(lParam, title, clickCount = 1)
	{
		while (clickCount--) ; 넘어온값이 0이면 진입안함
		{
			PostMessage, 0x201, 1, %lParam%,, %title% ; 마우스 왼클릭 다운
			Sleep, 50
			PostMessage, 0x202, 0, %lParam%,, %title% ; 마우스 왼클릭 업
		}
		return
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 비활성으로 이미지 검색하기
	; Funtion Name = searchInactiveImage

	; wId           = 검색하고자 하는창의 고유 아이디(핸들)
	; file         = 찾고자하는 이미지 파일
	; x            = 찾은 이미지의 추가적으로 좌표x를 추가하고자하는 값
	; y            = 찾은 이미지의 추가적으로 좌표y를 추가하고자하는 값

	; Return       = [찾은갯수, [이미지길이, 이미지높이], 찾은이미지좌표lparam...] 또는 "NoList"
	searchInactiveImage(winId, fileName, x = 0, y = 0)
	{	
		image_Token := Gdip_Startup() ; gdip을 라이브러리를 사용한다.
		image_Haystack := Gdip_BitmapFromHWND(winId) ; 검색할 화면 [Gdip_BitmapFromScreen() ; 전체화면]
		image_Needle := Gdip_CreateBitmapFromFile(fileName) ; 찾고자하는 이미지
		Gdip_GetImageDimensions(image_Needle, imageW, imageH) ; 찾고자하는 이미지의 길이와 높이를 가져온다.
		image_NumFoundImage := Gdip_ImageSearch(image_Haystack, image_Needle, posList, 0, 0, 0, 0, 0, 0xFFFFFF, 1, 0) ; 이미지 찾은갯수를 반환
		Gdip_DisposeImage(image_Haystack) ;초기화 해준다.
		Gdip_DisposeImage(image_Needle) ; 초기화 해준다.
		Gdip_Shutdown(image_Token) ; 꺼준다

		makePosList :=
		if (image_NumFoundImage > 0)  ; 이미지를 하나이상 찾은 경우
		{
			makePosList := [image_NumFoundImage, [imageW, imageH]]

			for i, v in StrSplit(posList, "`n") ; 엔터를 기준으로 배열화 한다.
			{
				StringSplit, location, v, `, ; , 기준으로 나눠준다.
				makePosList.insert([location1 + x, location2 + y]) ; x or y 의 비트를 왼쪽으로 2번 이동한 lparam으로 바꿔준다.
			}
		}

		return makePosList
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 타입변환
	; Funtion Name = Convert

	; numType      = 포맷타입 (http://autohotkeykr.sourceforge.net/docs/commands/Format.htm)
	; numList      = 리스트

	; Return       = 포맷후 반환
	convert(numType, numList)
	{
		str :=
		while (numList[A_index])
		{
			str .= "{:" numType "}"
		}
		Return Format(str , numList*)
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 랜덤함수
	; Funtion Name = random

	; numMin       = 최소 숫자
	; numMax       = 최대 숫자
	
	; return       = 범위안의 랜덤한 숫자
	random(numMin, numMax)
	{
		Random, num, numMin, numMax
		Return num
	}

	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 일정시간만큼 넘었는지 안넘었는지 체크
	; Funtion Name = checkTimeOver

	; firstTime    = 시간을 체크하고 싶은 지점에서 A_TickCount 를 담은 변수
	; second       = 원하는 초

	; Return       = "Yes" 또는 "No"
	checkTimeOver(firstTime, second)
	{
		return ((A_TickCount - firstTime) > (second * 1000)) ? "Yes" : "No"
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 단축키를 잠궛다 풀기
	; Funtion Name = blockHotkey

	; key     = 해당단축키
	blockHotkey(key)
	{
		Hotkey, % key, a
		Keywait, % key, D 
		Keywait, % key
		Hotkey, % key, off
		return

		a:
		return
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 마우스좌표lparam만들기
	; Funtion Name = makeLparam

	; x            = x좌표
	; y            = y좌표

	; Return       = lparam (마우스좌표)
	makeLparam(x, y)
	{
		return x | y << 16
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 컨트롤 미리보기 생성
	; Funtion Name = makePlaceholder

	; cId          =  현재 컨트롤의 핸들값
	; str          =  현재 컨트롤의 미리보기 문자열
	makePlaceholder(cId, str)
	{
		DllCall("user32\SendMessage", "Ptr", cId, "UInt", 0x1501, "Ptr", True, "Str", str, "Ptr")
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 리스트 뒤집기
	; Funtion Name = flipList

	; originalList = 뒤집기 할 리스트
	flipList(ByRef originalList)
	{
		loop % len := originalList.MaxIndex()
			originalList.Push(f_Arr.RemoveAt(len - (A_Index - 1)))
		return
	}
}

; ########################################################################################################################################################################################################
; ########################################################################################################################################################################################################
; 실시간 키눌림 확인
; Funtion Name = GetAsyncKeyState

; key = 키이름
GetAsyncKeyState(key)
{
	key := GetKeyVK(Key)
	return (Format("{:X}", DllCall("user32\GetAsyncKeyState", "int", key) & 0x8000) == 8000) ? 1 :
}

; 진수변환    3번째인자의진수   바꿀진수   바꿀숫자
; ConvertBase(f_Input, f_Output, f_Number)
; {
; 	static u := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
; 	static v := A_IsUnicode ? "_i64tow"    : "_i64toa"
; 	VarSetCapacity(s, 65, 0) ; 변수의 가용 능력을 키우거나 그의 메모리를 해제합니다
; 	value := DllCall("msvcrt.dll\" u, "Str", f_Number, "UInt", 0, "UInt", f_Input, "CDECL Int64")
; 	DllCall("msvcrt.dll\" v, "Int64", value, "Str", s, "UInt", f_Output, "CDECL")
; 	return f_Number < 16 ? "0" s : s
; }