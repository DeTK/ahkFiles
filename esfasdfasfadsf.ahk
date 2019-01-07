#Include Gdip.ahk

Create_Square(f_ID, f_list, f_num) ; 핸들, [0,[이미지길이, 이미지높이], x좌표|y좌표<<16....], 1
{
    Gui, GUI_Drawing:+AlwaysOnTop +E0x20 -Caption +E0x80000 -Border +ToolWindow +OwnDialogs +Owner  +LastFound
    Gui, GUI_Drawing: Show, NA, GUI_Drawing

    pToken := Gdip_Startup()
    hwnd := WinExist("GUI_Drawing") ; 현재 구이의 고유 아이디
    hbm := CreateDIBSection(A_ScreenWidth, A_ScreenHeight)
    hdc := CreateCompatibleDC()
    obm := SelectObject(hdc, hbm)
    G := Gdip_GraphicsFromHDC(hdc)
    ;Gdip_SetSmoothingMode(CS_G, 4)
    Gdip_GraphicsClear(G) ; 이전의 그려진 그랙픽을 지워준다.

    ; 현재창의 스크린좌표상 위치
    WinGetPos, wx, wy,,, ahk_id %f_ID%
    x := (f_list[f_num + 2] & 0xffff) + wx                ; 찾은 x좌표 + 현재창의 x
    y := ((f_list[f_num + 2] >> 16) & 0xffff) + wy        ; 찾은 y좌표 + 현재창의 y
    w := f_list[2][1]                                     ; 이미지 길이
    h := f_list[2][2]                                     ; 이미지 높이
    ;                          ARGB    팬두깨
    pPen := Gdip_CreatePen("0xFFFF0000", 2)
    ; 이미지 를 감싸는 사각형 을 그린다.
    ;            DC  팬 시작점[x1 y1]    끝점[x2 y2]
    Gdip_DrawRectangle(G, pPen, x - 5, y - 5, w + 9, h + 9)
    UpdateLayeredWindow(hwnd, hdc, 0, 0, A_ScreenWidth, A_ScreenHeight) ; 업데이트해줘서 실제로 보여준다.
}

F5::
Create_Square(WinExist("A"), [1,[100,100],500|500<<16], 1)
return