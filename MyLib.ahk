
; 사용한 라이브러리
#Include Gdip.ahk
#Include Gdip_ImageSearch.ahk

class MyLib
{
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 비활성으로 해당 좌표 클릭하기
	; Funtion Name   = click_Inactive

	; lParam       = x|y<<16 예) 500|500<<16
	; title        = 문자열로 이루어진 타이틀
	; clickCount   = 클릭하고 싶은횟수
	click_Inactive(lParam, title, clickCount = 1)
	{
		while (clickCount) ; 넘어온값이 0이면 진입안함
		{
			PostMessage, 0x201, 1, %lParam%,, %title% ; 마우스 왼클릭 다운
			Sleep, 50
			PostMessage, 0x202, 0, %lParam%,, %title% ; 마우스 왼클릭 업
			clickCount--
		}
		return
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 비활성으로 이미지 검색하기
	; Funtion Name = search_InactiveImage

	; id         = 검색하고자 하는창의 고유 아이디(핸들)
	; file       = 찾고자하는 이미지 파일
	; x          = 찾은 이미지의 추가적으로 좌표x를 추가하고자하는 값
	; y          = 찾은 이미지의 추가적으로 좌표y를 추가하고자하는 값

	; Return       = [찾은갯수, [이미지길이, 이미지높이], 찾은이미지좌표lparam...] 또는 "NoList"
	search_InactiveImage(id, file, x = 0, y = 0)
	{	
		token := Gdip_Startup() ; gdip을 라이브러리를 사용한다.
		haystack := Gdip_BitmapFromHWND(id) ; 검색할 화면 [Gdip_BitmapFromScreen() ; 전체화면]
		needle := Gdip_CreateBitmapFromFile(file) ; 찾고자하는 이미지
		Gdip_GetImageDimensions(needle, w, h) ; 찾고자하는 이미지의 길이와 높이를 가져온다.
		numFoundImage := Gdip_ImageSearch(haystack, needle, posList, 0, 0, 0, 0, 0, 0xFFFFFF, 1, 0) ; 이미지 찾은갯수를 반환
		Gdip_DisposeImage(haystack) ;초기화 해준다.
		Gdip_DisposeImage(needle) ; 초기화 해준다.
		Gdip_Shutdown(token) ; 꺼준다

		makeLparamList :=
		if (numFoundImage > 0)  ; 이미지를 하나이상 찾은 경우
		{
			makeLparamList := [numFoundImage,[w,h]]

			for i, v in StrSplit(posList, "`n") ; 엔터를 기준으로 배열화 한다.
			{
				StringSplit, location, v, `, ; , 기준으로 나눠준다.
				makeLparamList.insert(this.Make_Lparam(location1 + x, location2 + y)) ; x or y 의 비트를 왼쪽으로 2번 이동한 lparam으로 바꿔준다.
				;OutputDebug, % "x = " (location1 + f_X) " y = " (location2 + f_Y) " lparam = " makeLparamList[i + 2]
			}
		}

		return (makeLparamList) ? makeLparamList : "NoList"
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; GDI 생성
	; Funtion Name = Create_GDI
	create_GDI() 
	{
		global
		Gui, GUI_Drawing: +AlwaysOnTop +E0x20 -Caption +E0x80000 -Border +ToolWindow +OwnDialogs +Owner  +LastFound
		Gui, GUI_Drawing: Show, NA, GUI_Drawing
		token := Gdip_Startup()
		hwnd := WinExist("GUI_Drawing") ; 현재 구이의 고유 아이디
		hbm := CreateDIBSection(A_ScreenWidth, A_ScreenHeight)
		hdc := CreateCompatibleDC()
		obm := SelectObject(hdc, hbm)
		g := Gdip_GraphicsFromHDC(hdc)
		Gdip_SetSmoothingMode(g, 4) ; 안티
		pen := Gdip_CreatePen(0xFF this.Convert("X", [this.Random(200, 255), this.Random(200, 255), this.Random(200, 255)]), 3)
		return
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 타입변환
	; Funtion Name = Convert

	; numType       = 포맷타입 (http://autohotkeykr.sourceforge.net/docs/commands/Format.htm)
	; numList        = 리스트

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
	random(numMin, numMax)
	{
		Random, num, numMin, numMax
		Return num
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 이미지 주변을 감싸는 사각형 생성
	; Funtion Name = Create_Square

	; id         = 현재창의위치를 알기위해서 고유 아이디를(핸들)
	; posList       = Inactive_Search 함수의 Return
	; imageNum        = 사각형을 그릴 이미지 순서
	create_Square(id, posList, imageNum)
	{
		global
		WinGetPos, x, y,,, ahk_id %id%
		; 마우스의좌표인 lparam을 x와y로 분리하는방법
		x := (posList[imageNum + 2] & 0xffff) + x 		           ; 찾은 x좌표 + 현재창의 x
		y := ((posList[imageNum + 2] >> 16) & 0xffff) + y         ; 찾은 y좌표 + 현재창의 y
		w := posList[2][1]                                  ; 이미지 길이
		h := posList[2][2]                                  ; 이미지 높이
		Gdip_GraphicsClear(g)  ; 이것은 그래픽의 전체 영역을 'transparent'로 설정합니다.
		Gdip_DrawRectangle(g, pen, x - 5, y - 5, w + 9, h + 9)
		Gdip_DeletePen(pen)
		UpdateLayeredWindow(hwnd, hdc, 0, 0, A_ScreenWidth, A_ScreenHeight)
		
		return
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; GDI 제거
	; Funtion Name = Delete_GDI
	Delete_GDI()
	{
		global
		SelectObject(hdc, obm)
		DeleteObject(hbm)
		DeleteDC(hdc)
		Gdip_DeleteGraphics(g)
		Gdip_Shutdown(token)
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 일정시간만큼 넘었는지 안넘었는지 체크
	; Funtion Name = Check_TimeOver (시간초과 확인)

	; f_First      = 시간을 체크하고 싶은 지점에서 A_TickCount 를 담은 변수
	; f_Second     = 원하는 초

	; Return       = "넘음" 또는 "안넘음"
	Check_TimeOver(f_First,f_Second)
	{
		return ((A_TickCount - f_First) > (f_Second * 1000)) ? "넘음" : "안넘음"
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 단축키를 잠궛다 풀기
	; Funtion Name = Lock_Hotkey (단축키 잠금)

	; f_Hotkey     = 해당단축키
	Block_Hotkey(f_Hotkey)
	{
		Hotkey, % f_Hotkey, re
		Keywait, % f_Hotkey, D 
		Keywait, % f_Hotkey
		Hotkey, % f_Hotkey, off
		return

		re:
		return
	}
	On_Msg()
	{
		OnMessage(0x100, "Get_Params")
	}
	off_Msg()
	{
		OnMessage(0x100, "Get_Params", 0)
	}
	Get_Params(wParam, lParam) 
	{  
		ToolTip, % wParam "  " lparam
		return 
	}
	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 마우스좌표lparam만들기
	; Funtion Name = Make_Lparam (Lparam 만들기)

	; f_X          = x좌표
	; f_Y          = y좌표

	; Return       = lparam
	Make_Lparam(f_X, f_Y)
	{
		return f_X | f_Y << 16
	}

	플레이스홀더(f_ID, f_str)
	{
		DllCall("user32.dll\SendMessage", "Ptr", f_ID, "UInt", 0x1501, "Ptr", True, "Str", f_str, "Ptr")
	}

	리스트뒤집기(ByRef f_Arr)
	{
		loop % len := f_Arr.MaxIndex()
			f_Arr.Push(f_Arr.RemoveAt(len - (A_Index - 1)))
		return
	}
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