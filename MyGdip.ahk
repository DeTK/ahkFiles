
; 사용한 라이브러리
#Include Gdip.ahk
#Include Gdip_ImageSearch.ahk
#Include, MyLib.ahk


	; ########################################################################################################################################################################################################
	; ########################################################################################################################################################################################################
	; 이미지 주변을 감싸는 사각형 생성
	; Funtion Name = createSquare

	; wId          = 현재창의위치를 알기위해서 고유 아이디를(핸들)
	; posList      = Inactive_Search 함수의 Return
	; imageNum     = 사각형을 그릴 이미지 순서
createSquare(winId := 0, posList := 0, imageNum := 0)
{
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
	GDI_Pen := Gdip_CreatePen(0xFF Convert("X", [Random(200, 255), Random(200, 255), Random(200, 255)]), 3)
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
			makePosList.insert([location1 + x, location2 + y])
		}
	}
	return makePosList
}