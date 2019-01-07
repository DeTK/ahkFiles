#SingleInstance, Force
#NoEnv
SetBatchLines, -1


#Include, Gdip.ahk ; Gdip.ahk가 표준 라이브러리에없는 경우 주석 처리를 제거하십시오.

; 시작 위치 +
If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}
OnExit, Exit


Width :=1920, Height := 1080
Gui, 1: -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs 
Gui, 1: Show, NA


hwnd1 := WinExist() ; 나중에 업데이트하기 위해 만든이 윈도우의 핸들을 가져옵니다.
hbm := CreateDIBSection(Width, Height) ; 폭과 높이로 그려 넣을 gdi 비트 맵을 만듭니다. 이것은 모든 것에 대한 전체 도면 영역입니다.
hdc := CreateCompatibleDC() ; 화면과 호환되는 장치 컨텍스트 가져 오기
obm := SelectObject(hdc, hbm) ; 장치 컨텍스트로 비트 맵을 선택하십시오.
G := Gdip_GraphicsFromHDC(hdc) ; 그리기 함수와 함께 사용하기 위해 비트 맵의 ​​그래픽에 대한 포인터를 얻습니다.
Gdip_SetSmoothingMode(G, 4) ; smoothing 모드를 antialias = 4로 설정하면 모양이 더러워 보입니다 (벡터 그리기 및 채우기에만 사용됨).

pBrush := Gdip_BrushCreateSolid(0x660000ff) ; 직사각형을 그리기 위해 약간 투명한 (66) 파란색 브러시 (ARGB = 투명도, 빨강, 녹색, 파랑)를 만듭니다.
;Gdip_FillRectangle(G, pBrush, 250, 80, 300, 200)


; 우리가 만든 지정된 창 (hwnd1)을 비트 맵 (hdc)에 대한 핸들로 업데이트하여 화면에 배치 할 x, y, w, h를 지정합니다. 이렇게하면 우리 gui가 (0,0)에 앞에서 지정한 너비와 높이
;UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)

Return



Exit:
; 정리 코드는 여기로 이동됩니다. 왜냐하면 함수
;단축키에서 이러한 리소스가 여전히 필요합니다.

Gdip_DeleteBrush(pBrush) ; 브러시가 더 이상 필요 없으며 메모리를 낭비하지 않도록 브러시 삭제
SelectObject(hdc, obm) ; hdc로 객체를 다시 선택하십시오.
DeleteObject(hbm) ; 이제 비트 맵을 삭제할 수 있습니다.
DeleteDC(hdc) ; 또한 비트 맵과 관련된 장치 컨텍스트가 삭제 될 수 있습니다.
Gdip_DeleteGraphics(G) ; 이제 그래픽이 삭제 될 수 있습니다.
; 프로그램을 종료 할 때 gdi +가 종료 될 수 있습니다.
Gdip_Shutdown(pToken)
ExitApp
Return

^d::   ;사각형 지우기
Gdip_GraphicsClear(G)  ; 이것은 그래픽의 전체 영역을 'transparent'로 설정합니다.
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)  ; 이것은 디스플레이를 실제로 변경하는 것입니다.
return

^b::  ;원래 사각형을 다시 그립니다.
Gdip_FillRectangle(G, pBrush, 250, 80, 300, 200)
UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
return


~LButton::   ;마우스로 직사각형 그리기
CoordMode, Mouse, Screen
MouseGetPos, x1, y1
while getKeyState("LButton", "P")
{
  MouseGetPos, x2, y2
  Gdip_GraphicsClear(G)
  ; FillRect는 전달 된 (x, y) 좌표가 항상 왼쪽 위 모퉁이이고 width, height가 양수인 것으로 기대합니다.
  Gdip_FillRectangle(G, pBrush, min(x1,x2), min(y1,y2), abs(x2-x1), abs(y2-y1))
  UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)
  sleep, 50
}
return

min(a,b)
{
  return a < b ? a : b
}