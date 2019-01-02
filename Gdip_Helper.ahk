JustTheBasics() {
	global
	
	; Start gdi+
	If !pToken := Gdip_Startup()
	{
		MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
		ExitApp
	}
	OnExit, Exit
	return
	
	
	Exit:
	; 프로그램을 종료 할 때 gdi +가 종료 될 수 있습니다.
	Gdip_Shutdown(pToken)
	ExitApp
	Return

}

SetUpGDIP(iWidth=-1, iHeight=-1) {
	global
	Width := iWidth
	Height := iHeight
	If (iWidth < 0) {
		Width := A_ScreenWidth
	}
	if (iHeight < 0) {
		height := A_ScreenHeight
	}
	
	
	JustTheBasics()
	
	; 항상 최상위 (+ AlwaysOnTop)에 있고 작업 표시 줄 항목 또는 캡션이없는 계층화 된 창 만들기 (+ E0x80000 : UpdateLayeredWindow를 사용해야 함!)
	Gui, +E0x80000 -Caption +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs

	; 창 표시
	Gui, Show, NA

	; 나중에 업데이트하기 위해 만든이 윈도우의 핸들을 가져옵니다.
	hwnd1 := WinExist()
	return
}

StartDrawGDIP() {
	global
	
	; 폭과 높이로 그려 넣을 gdi 비트 맵을 만듭니다. 이것은 모든 것에 대한 전체 도면 영역입니다.
	hbm := CreateDIBSection(Width, Height)

	; 화면과 호환되는 장치 컨텍스트 가져 오기
	hdc := CreateCompatibleDC()

	; 장치 컨텍스트로 비트 맵을 선택하십시오.
	obm := SelectObject(hdc, hbm)

	; 그리기 함수와 함께 사용하기 위해 비트 맵의 ​​그래픽에 대한 포인터를 얻습니다.
	G := Gdip_GraphicsFromHDC(hdc)	
}

EndDrawGDIP() {
	global
	
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
}

ClearDrawGDIP() {
	global
	Gdip_GraphicsClear(G)
}