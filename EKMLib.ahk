#NoEnv
#Persistent
;**************** EKMLib 매크로 라이브러리 ********************
;****************** 작성자 - 킴영감 ***************************
; 매크로를 만들기 위해 필요한 요소들을 함수로 구현해 놓았습니다.
; EKMLib 라이브러리에 대한 모든 저작권은 funlecture.com에 있으며
; 수정 및 무단배포를 금지합니다.
; Copyrightⓒ 2016 by 킴영감. All right reversed.
; http://elderlykims.tistory.com 을 통해서만 다운로드 받으실 수 있습니다.
;*************************************************************
;*********************** 구현된 함수들 ************************
; 1) EKMLib_Start(user_id, user_pw) - EKMLib 를 사용할 수 있도록 로그인 및 환경을 설정합니다.
; 2) error := EKMLib_findHWND(winTitle, _hWnd) - 윈도우의 핸들을 얻어오는 함수. 핸들은 비활성 함수들에 사용됩니다.
; 3) error := EKMLib_findChildHWND(_hWnd, num) - 자식윈도우의 핸들을 검색하는 함수.
; 4) error := EKMLib_findChildHWND(_hWnd, index) - 자식윈도우의 핸들을 받아오는 함수.
; 5) error := EKMLib_getChildHWNDEx(_hWnd, title, ClassNN) - 윈도우 타이틀과 클래스명으로 자식윈도우의 핸들을 받아오는 함수.
; 6) EKMLib_click(x, y, _hWnd) - 비활성 마우스 좌클릭 함수. 
; 7) EKMLib_clickDown(x, y, _hWnd) - 비활성 마우스 좌클릭 다운 함수.
; 8) EKMLib_clickUp(x, y, _hWnd) - 비활성 마우스 좌클릭 업 함수.
; 9) error := EKMLib_inactiveMouseDrag(s_x, s_y, e_x, e_y, step, num, _hWnd) - 비활성 마우스 드래그 함수.
; 10) EKMLib_keyInput(wParam, lParam, _hWnd) - 비활성 키보드 입력 함수.
; 11) EKMLib_keyDown(wParam, lParam, _hWnd) - 비활성 키 다운 함수.
; 12) EKMLib_keyUp(wParam, lParam, _hWnd) - 비활성 키 업 함수.
; 13) EKMLib_sendText(myStr, _hWnd) - 비활성으로 윈도우에 문자열을 입력하는 함수.
; 14) error := EKMLib_inactiveImageSearchAndClick(loc, image, x, y, _hWnd, acc, click_flag) - 비활성 이미지서치 및 클릭 함수. (최소화 상태에서는 동작하지 않습니다.)
; 15) error := EKMLib_inactiveImageSearchAndClickA(loc, image, x1, y1, x2, y2, _hWnd, acc, click_flag) - 비활성 이미지서치 및 클릭 함수. (최소화 상태에서는 동작하지 않습니다.)
; 16) error := EKMLib_inactiveImageSearch(loc, image, x1, y1, x2, y2, _hWnd, acc) - 비활성 이미지서치 함수. (최소화 상태에서는 동작하지 않습니다.)
; 17) error := EKMLib_inactivePixelSearch(OutX, OutY, x1, y1, x2, y2, RGB_value, _hWnd, acc) - 비활성 픽셀서치 함수. (최소화 상태에서는 동작하지 않습니다.)
; 18) EKMLib_hideWindow(_hWnd) - 윈도우를 숨김/원위치 시키는 함수. 윈도우를 모니터 밖으로 이동시켜서 숨길 수 있습니다.
; 19) EKMLib_setWinList() - 실행중인 윈도우를 검색합니다. 검색 후, getWinList를 사용해서 윈도우 이름을 받아올 수 있습니다.
; 20) title := EKMLib_getWinList(index) - 실행중인 윈도우의 이름을 받아옵니다. 
;										 해당 인덱스에 해당하는 하나의 값만 받아오며, Loop를 사용해서 모두 받아오시면 됩니다.
;										 ListView와 함께 사용하는 방법을 funlecture.com에서 확인할 수 있습니다.
; 21) EKMLib_Shutdown() - EKMLib 를 종료합니다.
;*************************************************************

;*************************************************************
; 함수 명 - EKMLib_start
; 설명 - EKMLib 를 사용할 수 있도록 환경을 설정합니다.
; 사용 형태 EKMLib_start(user_id, user_pw)
; 변수 설명
; 	user_id - EKMLib를 사용하기위한 사용자 ID 입니다. 
; 	user_pw - EKMLib를 사용하기위한 사용자 PASSWORD 입니다.

EKMLib_Start(user_id, user_pw)
{
	if !DllCall("GetModuleHandle", str, "EKMLib.dll")
		DllCall("LoadLibrary", str, "EKMLib.dll")
	r := DllCall("EKMLib\EKMLib_Start", str, user_id, str, user_pw)
	return r
}

;*************************************************************
; 함수 명 - EKMLib_findHWND
; 설명 - 윈도우의 핸들을 얻어옵니다. 윈도우 핸들은 EKMLib를 사용하기 위해서 필요한 윈도우의 ID 값입니다.
;        다른 함수를 사용하기 전에 이 함수를 사용해서 윈도우 핸들을 받아와야 합니다.
; 사용 형태 _hWnd := EKMLib_findHWND(winTitle)
; 변수 설명
;   e - 0 : 핸들 찾음, -1 : 핸들 못찾음
; 	winTitle - 핸들을 얻어오려는 윈도우의 이름을 입력합니다.
;   _hWnd - 함수를 통해 얻어온 윈도우 핸들값이 저장됩니다.

EKMLib_findHWND(winTitle, ByRef _hWnd)
{
	e := DllCall("EKMLib\EKMLib_findHWND", str, winTitle, "int*", _hWnd)
	return e
}

;*************************************************************
; 함수 명 - EKMLib_findChildHWND
; 설명 - 윈도우의 자식 윈도우의 핸들을 검색합니다. 윈도우 핸들은 EKMLib를 사용하기 위해서 필요한 윈도우의 ID 값입니다.
;        EKMLib_findHWND를 통해 얻어온 핸들을 사용해 얻어온 핸들로 비활성 입력이 되지 않을 때 사용합니다.
;        EKMLib_findHWND를 통해 얻어온 핸들을 _hWnd 부분에 넣으시면 됩니다.
; 사용 형태 _hWnd := EKMLib_findChildHWND(_hWnd, num)
; 변수 설명
;   e - 0 : 핸들 찾음, -1 : 핸들 못찾음
; 	_hWnd - EKMLib_findHWND를 통해 얻어온 핸들을 입력합니다.
;   num - 자식 윈도우의 핸들 개수를 받아옵니다.

EKMLib_findChildHWND(_hWnd, ByRef num)
{
	e := DllCall("EKMLib\EKMLib_findChildHWND", int, _hWnd, "int*", num)
	return e
}


;*************************************************************
; 함수 명 - EKMLib_getChildHWND
; 설명 - EKMLib_findChildHWND. 윈도우 핸들은 EKMLib를 사용하기 위해서 필요한 윈도우의 ID 값입니다.
;        검색된 윈도우 핸들 중 index(숫자) 번째에 해당하는 자식창의 핸들을 얻어옵니다.
;        인덱스는 0번부터 시작합니다.
; 사용 형태 _hWnd := EKMLib_findChildHWND(_hWnd, index)
; 변수 설명
;   e - 0 : 핸들 찾음, -1 : 핸들 못찾음
; 	_hWnd - 함수를 통해 얻어온 자식 윈도우의 핸들값이 저장됩니다.
;   index - 검색된 자식윈도우의 핸들 중 몇번째 핸들을 받아올지에 대한 숫자를 입력합니다.

EKMLib_getChildHWND(ByRef _hWnd, index)
{
	e := DllCall("EKMLib\EKMLib_getChildHWND", "int*", _hWnd, int, index)
	return e
}

;*************************************************************
; 함수 명 - EKMLib_getChildHWNDEx
; 설명 - 윈도우의 이름과 클래스를 사용해 자식윈도우의 핸들을 얻어옵니다. 윈도우 핸들은 EKMLib를 사용하기 위해서 필요한 윈도우의 ID 값입니다.
;        EKMLib_findHWND를 통해 얻어온 핸들을 사용해 얻어온 핸들로 비활성 입력이 되지 않을 때 사용합니다.
; 사용 형태 error := EKMLib_getChildHWNDEx(_hWnd, title, ClassNN)
; 변수 설명
;   e - 0 : 핸들 찾음, -1 : 핸들 못찾음
; 	_hWnd - 찾은 자식윈도우의 핸들을 저장하는 변수
;   winTitle - 핸들을 얻어오려는 윈도우의 이름을 입력합니다.
;   ClassNN - 자식 윈도우의 클래스 명을 입력합니다.

EKMLib_getChildHWNDEx(ByRef _hWnd, title, ClassNN)
{
	e := DllCall("EKMLib\EKMLib_getChildHWNDEx", "int*", _hWnd, str, title, str, ClassNN)
	return e
}

;*************************************************************
; 함수 명 - EKMLib_click
; 설명 - 특정 윈도우에 비활성 마우스 좌클릭을 하는 함수입니다.
; 사용 형태 EKMLib_click(x, y, _hWnd)
; 변수 설명
; 	x - 클릭할 지점의 x 좌표
;   y - 클릭할 지점의 y 좌표
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_click(x, y, _hWnd)
{
	DllCall("EKMLib\EKMLib_inactiveClick", int, x, int, y, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_clickDown
; 설명 - 특정 윈도우에 비활성 마우스 좌클릭 다운을 하는 함수입니다.
; 사용 형태 EKMLib_clickDown(x, y, _hWnd)
; 변수 설명
; 	x - 클릭할 지점의 x 좌표
;   y - 클릭할 지점의 y 좌표
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_clickDown(x, y, _hWnd)
{
	DllCall("EKMLib\EKMLib_inactiveClickDown", int, x, int, y, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_clickUp
; 설명 - 특정 윈도우에 비활성 마우스 좌클릭 업을 하는 함수입니다.
; 사용 형태 EKMLib_clickUp(x, y, _hWnd)
; 변수 설명
; 	x - 클릭할 지점의 x 좌표
;   y - 클릭할 지점의 y 좌표
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_clickUp(x, y, _hWnd)
{
	DllCall("EKMLib\EKMLib_inactiveClickUp", int, x, int, y, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_inactiveMouseDrag
; 설명 - 특정 윈도우에 비활성 마우스 드래그를 하는 함수입니다.
; 사용 형태 EKMLib_inactiveMouseDrag(s_x, s_y, e_x, e_y, num, _hWnd)
; 변수 설명
; 	s_x - 드래그 시작 지점의 x 좌표
;   s_y - 드래그 시작 지점의 y 좌표
;   e_x - 드래그 끝 지점의 x좌표
;   e_y - 드래그 끝 지점의 y좌표
;   num - 드래그 횟수
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_inactiveMouseDrag(s_x, s_y, e_x, e_y, step, num, _hWnd)
{
	DllCall("EKMLib\EKMLib_inactiveMouseDrag", int, s_x, int, s_y, int, e_x, int, e_y, int, step, int, num, uint, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_keyInput(wParam, lParam, _hWnd)
; 설명 - 특정 윈도우에 비활성 키보드 입력을 하는 함수입니다.
; 사용 형태 EKMLib_keyInput(wParam, lParam, _hWnd)
; 변수 설명
; 	wParam - 해당 키의 wParam
;   lParam - 해당 키의 lParam
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_keyInput(wParam, lParam, _hWnd)
{
	DllCall("EKMLib\EKMLib_keyInput", uint, wParam, uint, lParam, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_keyDown(wParam, lParam, _hWnd)
; 설명 - 특정 윈도우에 비활성 키 다운을 하는 함수입니다.
; 사용 형태 EKMLib_keyInput(wParam, lParam, _hWnd)
; 변수 설명
; 	wParam - 해당 키의 wParam
;   lParam - 해당 키의 lParam
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_keyDown(wParam, lParam, _hWnd)
{
	DllCall("EKMLib\EKMLib_keyDown", uint, wParam, uint, lParam, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_keyUp(wParam, lParam, _hWnd)
; 설명 - 특정 윈도우에 비활성 키 업을 하는 함수입니다.
; 사용 형태 EKMLib_keyUp(wParam, lParam, _hWnd)
; 변수 설명
; 	wParam - 해당 키의 wParam
;   lParam - 해당 키의 lParam
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_keyUp(wParam, lParam, _hWnd)
{
	DllCall("EKMLib\EKMLib_keyUp", uint, wParam, uint, lParam, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_sendText(myStr, _hWnd)
; 설명 - 특정 윈도우에 비활성으로 텍스트를 입력하는 함수입니다.
; 사용 형태 EKMLib_sendText(myStr, _hWnd)
; 변수 설명
; 	myStr - 입력할 문자열
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_sendText(myStr, _hWnd)
{
	DllCall("EKMLib\EKMLib_sendText", str, myStr, int, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_inactiveImageSearchAndClick
; 설명 - 특정 윈도우에서 비활성 이미지 검색을 하고 이미지가 있으면 클릭을 하는 함수입니다. 
;		윈도우가 가려져 있어도 찾을 수 있습니다. (최소화 상태에서는 동작하지 않습니다.)
;		24bit 이상의 bmp 파일만 사용가능합니다.
; 사용 형태 error := EKMLib_inactiveImageSearchAndClick(loc, image, x, y, _hWnd, acc, click_flag)
; 변수 설명
;	error - 0: 이미지를 찾음, -1: 이미지를 못찾음
; 	loc - 이미지가 있는 폴더 명. 라이브러리 파일이 있는 경로의 아래경로
;   image - 이미지 파일명 (확장자 제외)
;   x - 찾을 이미지의 왼쪽 상단 x 좌표 (이미지 찾아드립니다 프로그램으로 확인가능합니다.)
;   y - 찾을 이미지의 왼쪽 상단 y 좌표 (이미지 찾아드립니다 프로그램으로 확인가능합니다.)
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들
;	acc - 이미지 인식 정확도. 1 ~ 0.5 사이의 값을 입력. 권장 값: 0.95
;   click_flag - 이미지를 찾았을때 클릭을 할지/안할지 를 결정. 0: 클릭 안함, 1: 클릭 함

EKMLib_inactiveImageSearchAndClick(loc, image, x, y, _hWnd, acc, click_flag){
	e := DllCall("EKMLib\EKMLib_inactiveImageSearchAndClick", str, loc, str, image, int, x, int, y, uint, _hWnd, double, acc, int, click_flag)
	return e
}

;*************************************************************
; 함수 명 - EKMLib_inactiveImageSearchAndClickA
; 설명 - 특정 윈도우에서 비활성 이미지 검색을 하고 이미지가 있으면 클릭을 하는 함수입니다. 
;		윈도우가 가려져 있어도 찾을 수 있습니다. (최소화 상태에서는 동작하지 않습니다.)
;		24bit 이상의 bmp 파일만 사용가능합니다.
; 사용 형태 error := EKMLib_inactiveImageSearchAndClickA(loc, image, x1, y1, x2, y2, _hWnd, acc, click_flag)
; 변수 설명
;	error - 0: 이미지를 찾음, -1: 이미지를 못찾음
; 	loc - 이미지가 있는 폴더 명. 라이브러리 파일이 있는 경로의 아래경로
;   image - 이미지 파일명 (확장자 제외)
;   x1 - 이미지를 찾을 영역의 왼쪽 상단 x 좌표
;   y1 - 이미지를 찾을 영역의 왼쪽 상단 y 좌표
;   x2 - 이미지를 찾을 영역의 오른쪽 하단 x 좌표
;   y2 - 이미지를 찾을 영역의 오른쪽 하단 y 좌표
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들
;	acc - 이미지 인식 정확도. 1 ~ 0.5 사이의 값을 입력. 권장 값: 0.95
;   click_flag - 이미지를 찾았을때 클릭을 할지/안할지 를 결정. 0: 클릭 안함, 1: 클릭 함

EKMLib_inactiveImageSearchAndClickA(loc, image, x1, y1, x2, y2, _hWnd, acc, click_flag){
	e := DllCall("EKMLib\EKMLib_inactiveImageSearchAndClickA", str, loc, str, image, int, x1, int, y1, int, x2, int, y2, uint, _hWnd, double, acc, int, click_flag)
	return e
}

;*************************************************************
; 함수 명 - EKMLib_inactiveImageSearch
; 설명 - 특정 윈도우에서 비활성 이미지 검색을 하고 좌표값을 받아오는 함수 입니다.
;		윈도우가 가려져 있어도 찾을 수 있습니다. (최소화 상태에서는 동작하지 않습니다.)
;		24bit 이상의 bmp 파일만 사용가능합니다.
; 사용 형태 error := EKMLib_inactiveImageSearch(loc, image, x1, y1, x2, y2, _hWnd, acc)
; 변수 설명
;	error - 0: 이미지를 찾음, -1: 이미지를 못찾음
; 	loc - 이미지가 있는 폴더 명. 라이브러리 파일이 있는 경로의 아래경로
;   image - 이미지 파일명 (확장자 제외)
;   x1 - 찾은 이미지의 왼쪽 상단 x 좌표 반환
;   y1 - 찾은 이미지의 왼쪽 상단 y 좌표 반환
;   x2 - 찾은 이미지의 오른쪽 하단 x 좌표 반환
;   y2 - 찾은 이미지의 오른쪽 하단 y 좌표 반환
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들
;	acc - 이미지 인식 정확도. 1 ~ 0.5 사이의 값을 입력. 권장 값: 0.95

EKMLib_inactiveImageSearch(loc, image, ByRef x1, ByRef y1, ByRef x2, ByRef y2, _hWnd, acc){
	e := DllCall("EKMLib\EKMLib_inactiveImageSearch", str, loc, str, image, "int*", x1, "int*", y1, "int*", x2, "int*", y2, uint, _hWnd, double, acc, "Cdecl int")
	return e
}

;*************************************************************
; 함수 명 - EKMLib_inactivePixelSearch
; 설명 - 특정 윈도우에서 비활성 픽셀 검색을 하고 좌표값을 받아오는 함수 입니다.
;		윈도우가 가려져 있어도 찾을 수 있습니다. (최소화 상태에서는 동작하지 않습니다.)
;		RGB값으로 픽셀을 찾습니다.
; 사용 형태 error := EKMLib_inactivePixelSearch(OutX, OutY, x1, y1, x2, y2, RGB_value, _hWnd, acc)
; 변수 설명
;	error - 0: 픽셀을 찾음, -1: 픽셀을 못찾음
; 	OutX - 찾은 픽셀의 x좌표를 반환
;   OutY - 찾은 픽셀의 y좌표를 반환
;   x1 - 픽셀을 찾을 영역의 왼쪽 상단 x 좌표
;   y1 - 픽셀을 찾을 영역의 왼쪽 상단 y 좌표
;   x2 - 픽셀을 찾을 영역의 오른쪽 하단 x 좌표
;   y2 - 픽셀을 찾을 영역의 오른쪽 하단 y 좌표
;   RGB_value - 찾을 픽셀의 RGB 값
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들
;	acc - 픽셀 값 정확도. 0 ~ 50 사이의 값을 입력. 권장 값: 0

EKMLib_inactivePixelSearch(ByRef OutX, ByRef OutY, x1, y1, x2, y2, RGB_value,_hWnd, acc){
	e := DllCall("EKMLib\EKMLib_inactivePixelSearch", "int*", OutX, "int*", OutY, int, x1, int, y1, int, x2, int, y2, int, RGB_value, uint, _hWnd, double, acc, "Cdecl int")
	return e
}

;*************************************************************
; 함수 명 - EKMLib_hideWindow
; 설명 - 특정 윈도우를 숨기는 함수입니다. 
;		프로그램 화면이 모니터 안에 있을 경우 모니터 밖으로 보내며, 
;       다시한번 실행시킬 경우 원래의 자리로 돌아옵니다.
; 사용 형태 EKMLib_hideWindow(_hWnd)
; 변수 설명
;	_hWnd - EKMLib_findHWND로 얻어온 윈도우 핸들

EKMLib_hideWindow(_hWnd)
{
	DllCall("EKMLib\EKMLib_hideWindow", uint, _hWnd)
}

;*************************************************************
; 함수 명 - EKMLib_setWinList
; 설명 - 실행중인 윈도우를 검색합니다.
;		검색 후, getWinList를 사용해서 윈도우 이름을 받아올 수 있습니다.
; 사용 형태 EKMLib_setWinList()

EKMLib_setWinList()
{	
	DllCall("EKMLib\EKMLib_winList")	
}

;*************************************************************
; 함수 명 - EKMLib_getWinList
; 설명 - 실행중인 윈도우의 이름을 받아옵니다.
;		해당 인덱스에 해당하는 하나의 값만 받아오며
;		Loop를 사용해서 모두 받아오시면 됩니다.
;		ListView와 함께 사용하는 방법을 funlecture.com에서 확인할 수 있습니다.
;		받아온 값이 end 일 경우에 모든 윈도우 이름을 받아온 것입니다.
;		총 30개 까지 가능합니다.
; 사용 형태 EKMLib_getWinList(index)
; 변수 설명
;	index - 검색된 윈도우 중 받아올 index값

EKMLib_getWinList(index)
{
	title := DllCall("EKMLib\EKMLib_getWinList", int, index, "Cdecl str")
	return title
}

;*************************************************************
; 함수 명 - EKMLib_Shutdown
; 설명 - EKMLib 를 종료합니다.
; 사용 형태 EKMLib_Shutdown()

EKMLib_Shutdown()
{
	DllCall("EKMLib\EKMLib_Exit")
	if hModule := DllCall("GetModuleHandle", "str", "EKMLib.dll")
		DllCall("FreeLibrary", "uint", hModule)
	return 0
}