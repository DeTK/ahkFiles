
; 사용한 라이브러리
; #Include Gdip.ahk
; #Include Gdip_ImageSearch.ahk

; ====================================================================================================
; 비활성으로 해당 좌표 클릭하기
; 함수명 = Inactive_Click (비활성 클릭)
;
; 인  자
; f_Lparam     = x|y<<16 예) 500|500<<16
; f_Title      = 문자열로 이루어진 타이틀
; f_ClickCount = 클릭하고 싶은횟수
;
; 리턴값 = 없음
; ====================================================================================================
Inactive_Click(f_Lparam, f_Title, f_ClickCount = 1)
{
    while (f_ClickCount) ; 넘어온값이 0이면 진입안함
    {
        PostMessage, 0x201, 1, %f_Lparam%,, %f_Title% ; 마우스 왼클릭 다운
        Sleep, 50
        PostMessage, 0x202, 0, %f_Lparam%,, %f_Title% ; 마우스 왼클릭 업
        f_ClickCount--
    }
	return
}
; ====================================================================================================
; 비활성으로 이미지 검색하기
; 함수명 = Inactive_Search (비활성 검색)
;
; 인  자
; f_ID   = 검색하고자 하는창의 고유 아이디(핸들)
; f_File = 찾고자하는 이미지 파일
; f_X    = 찾은 이미지의 추가적으로 좌표x를 추가하고자하는 값
; f_Y    = 찾은 이미지의 추가적으로 좌표y를 추가하고자하는 값
;
; 리턴값 = [찾은갯수, [이미지길이, 이미지높이], 찾은이미지좌표lparam...] 또는 "NoList"
; ====================================================================================================
Inactive_Search(f_ID, f_File, f_X = 0, f_Y = 0)
{	
    Token := Gdip_Startup() ; gdip을 라이브러리를 사용한다.
    haystack := Gdip_BitmapFromHWND(f_ID) ; 검색할 화면 [Gdip_BitmapFromScreen() ; 전체화면]
    needle := Gdip_CreateBitmapFromFile(f_File) ; 찾고자하는 이미지
    Gdip_GetImageDimensions(needle, W, H) ; 찾고자하는 이미지의 길이와 높이를 가져온다.
    imageFoundNum := Gdip_ImageSearch(haystack, needle, LIST, 0, 0, 0, 0, 0, 0xFFFFFF, 1, 0) ; 이미지 찾은갯수를 반환
    Gdip_DisposeImage(haystack) ;초기화 해준다.
    Gdip_DisposeImage(needle) ; 초기화 해준다.
    Gdip_Shutdown(Token) ; 꺼준다

	if (imageFoundNum > 0)  ; 이미지를 하나이상 찾은 경우
	{
        makeLparamList := [imageFoundNum,[W,H]]

        for i, v in StrSplit(LIST, "`n") ; 엔터를 기준으로 배열화 한다.
        {
            StringSplit, location, v, `, ; , 기준으로 나눠준다.
            makeLparamList.insert(Make_Lparam(location1 + f_X, location2 + f_Y)) ; x or y 의 비트를 왼쪽으로 2번 이동한 lparam으로 바꿔준다.
            ;OutputDebug, % "x = " (location1 + f_X) " y = " (location2 + f_Y) " lparam = " makeLparamList[i + 2]
        }
		return makeLparamList ; 찾은 이미지의 lparam 리스트
	}

    return "NoList" ; 못찾았으므로 NoList 반환
}
; ====================================================================================================
; GDI 생성
; 함수명 = Create_GDI (GDI 생성)
; 인  자 = 없음
; 리턴값 = 없음
; ====================================================================================================
Create_GDI() 
{
    global
	Gui, GUI_Drawing: +AlwaysOnTop +E0x20 -Caption +E0x80000 -Border +ToolWindow +OwnDialogs +Owner  +LastFound
	Gui, GUI_Drawing: Show, NA, GUI_Drawing
	CG_Token := Gdip_Startup()
	CG_hwnd := WinExist("GUI_Drawing") ; 현재 구이의 고유 아이디
	CG_hbm := CreateDIBSection(A_ScreenWidth, A_ScreenHeight)
	CG_hdc := CreateCompatibleDC()
	CG_obm := SelectObject(CG_hdc, CG_hbm)
	CG_G := Gdip_GraphicsFromHDC(CG_hdc)
	Gdip_SetSmoothingMode(CG_G, 4) ; 안티
	Random, R, 0, 255
	Random, G, 0, 255
	Random, B, 0, 255	
	CG_Pen := Gdip_CreatePen(0xff ConvertBase(10, 16, R) ConvertBase(10, 16, G) ConvertBase(10, 16, B), 2)
	return
}
; ====================================================================================================
; 이미지 주변을 감싸는 사각형 생성
; 함수명 = Create_Square (사각형 생성)
;
; 인  자
; f_ID   = 현재창의위치를 알기위해서 고유 아이디를(핸들)
; f_List = Inactive_Search 함수의 리턴값
; f_Num  = 사각형을 그릴 이미지 순서
;
; 리턴값 = 없음
; ====================================================================================================
Create_Square(f_ID, f_List, f_Num)
{
	global
	WinGetPos, wx, wy,,, ahk_id %f_ID%
	; 마우스의좌표인 lparam을 x와y로 분리하는방법
	x := (f_List[f_Num + 2] & 0xffff) + wx 		           ; 찾은 x좌표 + 현재창의 x
	y := ((f_List[f_Num + 2] >> 16) & 0xffff) + wy         ; 찾은 y좌표 + 현재창의 y
	w := f_List[2][1]                                  ; 이미지 길이
	h := f_List[2][2]                                  ; 이미지 높이
	Gdip_GraphicsClear(CG_G)  ; 이것은 그래픽의 전체 영역을 'transparent'로 설정합니다.
	Gdip_DrawRectangle(CG_G, CG_Pen, x - 5, y - 5, w + 9, h + 9)
	Gdip_DeletePen(CG_Pen)
	UpdateLayeredWindow(CG_hwnd, CG_hdc, 0, 0, A_ScreenWidth, A_ScreenHeight)
	
	return
}
; GDI 제거
; 함수명 = Delete_GDI (GDI 제거)
; 인  자 = 없음
; 리턴값 = 없음
Delete_GDI()
{
	global
	SelectObject(CG_hdc, CG_obm)
	DeleteObject(CG_hbm)
	DeleteDC(CG_hdc)
	Gdip_DeleteGraphics(CG_G)
	Gdip_Shutdown(CG_Token)
}
; ====================================================================================================
; 일정시간만큼 넘었는지 안넘었는지 체크
; 함수명 = Check_TimeOver (시간초과 확인)
;
; 인  자
; f_First  = 시간을 체크하고 싶은 지점에서 A_TickCount 를 담은 변수
; f_Second = 원하는 초
;
; 리턴값 = "넘음" 또는 "안넘음"
; ====================================================================================================
Check_TimeOver(f_First,f_Second)
{
	return A_TickCount - f_First > f_Second * 1000 ? "넘음" : "안넘음"
}
; ====================================================================================================
; 단축키를 잠궛다 풀기
; 함수명 = Lock_Hotkey (단축키 잠금)
;
; 인  자
; f_Hotkey = 해당단축키
;
; 리턴값 = 없음
; ====================================================================================================
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

; ====================================================================================================
; 마우스좌표lparam만들기
; 함수명 = Make_Lparam (Lparam 만들기)
;
; 인  자
; f_X = x좌표
; f_Y = y좌표
;
; 리턴값 = lparam
; ====================================================================================================
Make_Lparam(f_X, f_Y)
{
	return f_X | f_Y << 16
}
; 진수변환    3번째인자의진수   바꿀진수   바꿀숫자
ConvertBase(f_Input, f_Output, f_Number)
{
    static u := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static v := A_IsUnicode ? "_i64tow"    : "_i64toa"
    VarSetCapacity(s, 65, 0) ; 변수의 가용 능력을 키우거나 그의 메모리를 해제합니다
    value := DllCall("msvcrt.dll\" u, "Str", f_Number, "UInt", 0, "UInt", f_Input, "CDECL Int64")
    DllCall("msvcrt.dll\" v, "Int64", value, "Str", s, "UInt", f_Output, "CDECL")
    return f_Number < 16 ? "0" s : s
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