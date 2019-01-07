; gdi + ahk tutorial 2 tic (Tariq Porter)에 의해 작성되었습니다.
; Lib 폴더에 표준 라이브러리 또는 #Include를 사용하여 Gdip.ahk이 필요합니다.
;
; 자습서는 하나의 타원과 직사각형을 화면에 그리지 만이 도형의 윤곽선 만 나타냅니다.

#SingleInstance, Force
#NoEnv
SetBatchLines, -1

; Gdip.ahk가 표준 라이브러리에없는 경우 주석 처리를 제거하십시오.
#Include, Gdip.ahk

; 시작 위치 +
If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}
OnExit, Exit

; 그리기 영역으로 원하는 너비와 높이를 설정하여 모든 것을 그립니다. 비트 맵의 ​​크기가됩니다.
Width := 600, Height := 400

; 항상 최상위 (+ AlwaysOnTop)에 있고 작업 표시 줄 항목 또는 캡션이없는 계층화 된 창 만들기 (+ E0x80000 : UpdateLayeredWindow를 사용해야 함!)
Gui, 1: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs

; 창 표시
Gui, 1: Show, NA

; 나중에 업데이트하기 위해 만든이 윈도우의 핸들을 가져옵니다.
hwnd1 := WinExist()

; 폭과 높이로 그려 넣을 gdi 비트 맵을 만듭니다. 이것은 모든 것에 대한 전체 도면 영역입니다.
hbm := CreateDIBSection(Width, Height)

; 화면과 호환되는 장치 컨텍스트 가져 오기
hdc := CreateCompatibleDC()

; 장치 컨텍스트로 비트 맵을 선택하십시오.
obm := SelectObject(hdc, hbm)

; 그리기 함수와 함께 사용하기 위해 비트 맵의 ​​그래픽에 대한 포인터를 얻습니다.
G := Gdip_GraphicsFromHDC(hdc)

; smoothing 모드를 antialias = 4로 설정하면 모양이 더러워 보입니다 (벡터 그리기 및 채우기에만 사용됨).
Gdip_SetSmoothingMode(G, 4)

; 원을 그리기 위해 너비 3 (펜이 그리는 두께)의 완전히 불투명 한 빨간색 펜 (ARGB = 투명도, 빨강, 녹색, 파랑)을 만듭니다.
pPen := Gdip_CreatePen(0xffff0000, 3)

; 생성 된 펜을 사용하여 비트 맵의 ​​그래픽에 타원을 그립니다 (이것은 모양의 외곽선 일뿐입니다).
; 이 펜은 너비가 3이며 좌표 (100,50)에서 200x300의 타원을 그립니다.
;Gdip_DrawEllipse(G, pPen, 100, 50, 200, 300)

; 펜이 더 이상 필요 없으며 메모리를 낭비하지 않도록 삭제하십시오.
Gdip_DeletePen(pPen)

; 직사각형을 그리기 위해 약간 투명한 (66) 파란색 펜 (ARGB = 투명, 빨강, 녹색, 파랑)을 만듭니다.
; 이 펜은 두께가 10 인 마지막 펜보다 넓습니다.
pPen := Gdip_CreatePen(0x660000ff, 3)

; 방금 생성 한 펜을 사용하여 비트 맵의 ​​그래픽 위에 사각형을 그립니다.
; 좌표 (250,80)의 직사각형을 300x200의 직사각형과 외곽선 폭 10 (펜을 만들 때 지정됨)으로 그립니다.
Gdip_DrawRectangle(G, pPen, 250, 80, 300, 200)

; 브러시가 더 이상 필요 없으며 메모리를 낭비하지 않도록 브러시 삭제
Gdip_DeletePen(pPen)

; 우리가 만든 지정된 창 (hwnd1)을 우리의 비트 맵 (hdc)에 대한 핸들로 업데이트하여 화면에 배치 할 x, y, w, h를 지정합니다.
; 이렇게하면 앞에서 지정한 너비와 높이로 (0,0)에 gui가 위치합니다.
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)


; hdc로 객체를 다시 선택하십시오.
SelectObject(hdc, obm)

; 이제 비트 맵을 삭제할 수 있습니다.
DeleteObject(hbm)

; 또한 비트 맵과 관련된 장치 컨텍스트가 삭제 될 수 있습니다.
DeleteDC(hdc)

; 이제 그래픽이 삭제 될 수 있습니다.
Gdip_DeleteGraphics(G)
Return

;#######################################################################

Exit:
; 프로그램을 종료 할 때 gdi +가 종료 될 수 있습니다.
Gdip_Shutdown(pToken)
ExitApp
Return