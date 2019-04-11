class ajdflks
{
    GetAsyncKeyState(key)
    {
        key := GetKeyVK(Key)
        return (Format("{:X}", DllCall("user32\GetAsyncKeyState", "int", key) & 0x8000) == 8000) ? 1 :
    }

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
    createSquare(winId, posList, imageNum)
    {
        global
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
        ; winX := (posList[imageNum + 2] & 0xffff) + winX                  ; 찾은 x좌표 + 현재창의 x
        ; winY := ((posList[imageNum + 2] >> 16) & 0xffff) + winY         ; 찾은 y좌표 + 현재창의 y
        WinGetPos, winX, winY,,, ahk_id %winId%
        winX := posList[imageNum + 2][1] + winX                ; 찾은 x좌표 + 현재창의 x
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
}