; 보기 좋게 한글로 다 바꿔 보았어요

#SingleInstance, Force ; 단일 실행 다중실행안됨

SetTitleMatchMode, 2 ;  창 제목 어디든 타이틀이 포함되어 있으면 부합
SetDefaultMouseSpeed, 0 ; 마우스커서 이동 속도

CoordMode, Mouse, Screen ; 마우스 영역을 전체화면으로

; 글로벌은 함수에서는 구이변수를 접근이 안되기 때문에 접근가능 하도록 해주기위해 쓰인다.
global 초,핸들,멈춤체크,툴팁유무
global 좌표 := []
global 목록 := ["1","2","3","4","5","6"]
global 설정파일경로 := A_WorkingDir "\설정.ini" ; 설정파일
OutputDebug, 전역변수 설정 완료
Gui, +AlwaysOnTop ; 항상 최상위
Gui, Add, Button, x10 y10 w50 h50 g버튼, 1
Gui, Add, Button, x70 y10 w50 h50 g버튼, 2
Gui, Add, Button, x130 y10 w50 h50 g버튼, 3
Gui, Add, Button, x10 y70 w50 h50 g버튼, 4
Gui, Add, Button, x70 y70 w50 h50 g버튼, 5
Gui, Add, Button, x130 y70 w50 h50 g버튼, 6
;Gui, Add, Button, x20 y150 w75 h25 gtest, 배열보기 ; ggetPos는 getPos:로 가는 고투?
Gui, Add, Edit, x23 y130 w20 h18 g초설정 v구이_초 Number, 59 ; 옵션인 Number = 숫자만 입력가능
Gui, Add, Text, x48 y134, 초
Gui, Add, DropDownList, x105 y128 w75 g좌표설정 v이름 Choose1, 좌표따기|1|2|3|4|5|6
Gui, Add, ListView, x190 y10 w120 h140 hwnd리스트뷰핸들 Disabled,확인
Gui, Add, Checkbox, x60 y134 Checked V구이_체크 g툴팁설정, 툴팁
;Gui, Add, Button, x190 y100 w10 h10 gre, 새로고침 ;
Gui, show, w320 h160, 프로그램
OutputDebug, 구이 구성 완료
loop, 6
{
    IniRead, x1좌표, %설정파일경로%, pos%A_Index%, x ; ex) [pos1] 의 x 의 값을  x1좌표(지역변수) 에 넣어준다.
    IniRead, y1좌표, %설정파일경로%, pos%A_Index%, y ; ex) [pos1] 의 y 의 값을  y1좌표(지역변수) 에 넣어준다.
    if (x1좌표 == "ERROR") ; 파일이 없거나 있는데 값이 없는경우
    {
        좌표[A_Index] := [500, 500] ; 기본값으로 500을 준다 수정하셔도되요
    }
    else ; 아니면
    {
        좌표[A_Index] := [x1좌표, y1좌표] ; 있을경우에는 저장되있는 값을 넣어준다.
        OutputDebug, 저장된 %A_Index%번 좌표는 = x%x1좌표%, y%y1좌표%
    }
    
}
gosub, 리스트뷰핸들설정 ; 콘트롤아이디를 저장 하고 돌아온다.
gosub, 초설정 ; 시간을 저장 하고 돌아온다.
gosub, 툴팁설정 ; 툴팁유무를 저장하고 돌아온다.
return
;==============================================================================
;re:
;Reload
;==============================================================================

Numpad1::
Numpad2::
Numpad3::
Numpad4::
Numpad5::
Numpad6::
버튼:
OutputDebug, 버튼 진입 %A_ThisLabel%
Gui, Submit, NoHide
if (A_ThisLabel == "버튼") {
    for i, v in 목록 {
        if (A_GuiControl == v){
            OutputDebug, 멈춤체크 = %i%
            멈춤체크 := i
        }
    }
}
else {
    for i, v in ["Numpad1","Numpad2","Numpad3","Numpad4","Numpad5","Numpad6"] {
        if (A_ThisLabel == v) {
            OutputDebug, 멈춤체크 = %i%
            멈춤체크 := i
        }
    }
}
SetTimer, 라벨, on
return
;==============================================================================
버튼클릭(버튼번호) { ; 버튼클릭하면 실행되는 함수(메소드) 인자(매개변수)는 버튼번호
    OutputDebug, 버튼클릭 함수 시작======================================
    리스트추가(목록[버튼번호]"접수대기")
    if (버튼번호 == 3 || 버튼번호 == 6) {
        tempx := 좌표[버튼번호][1]
        tempy := 좌표[버튼번호][2]
        OutputDebug, 버튼%버튼번호%의좌표 = %tempx%,%tempy%
        BlockInput, on ; 모든 입력을 비허용
        click %tempx% %tempy% ; 버튼번호에 숫자에따라 다른좌표 클릭
        BlockInput, Off ; 모든 입력을 허용
        SetTimer, 라벨, off
    }
    else {
        loop {
            
            if (멈춤체크 != 버튼번호) { ; 만약에  다른버튼을 눌렷다면 
                Break ; 루프탈출
            }
            else if (A_Sec == 초) { ; 아니면 현재 시스템 초가   "초" 변수랑 같으면
                BlockInput, on ; 모든 입력을 비허용
                tempx := 좌표[버튼번호][1]
                tempy := 좌표[버튼번호][2]
                OutputDebug, 버튼%버튼번호%의 클릭된 좌표 = %tempx%,%tempy%
                click %tempx% %tempy% ; 버튼번호에 숫자에따라 다른좌표 클릭
                BlockInput, Off ; 모든 입력을 허용
                SetTimer, 라벨, off
                Break ; 루프탈출
            }
            else {
                if (툴팁유무 == 1) {
                    ToolTip, % A_Sec " 초"
                }
            }
        }
    }
    ToolTip ; 툴팁의 내용을 제거
    OutputDebug, 버튼클릭 함수 끝======================================
    return
}

좌표따기(숫자) {
    OutputDebug, 좌표따기 함수 시작======================================
    WinSetTitle, % 숫자 "번 좌표 따기"
    Loop {
        GetKeyState, 클릭, LButton, P ; 현재 마우스왼클릭의 물리적상태가 클릭 변수에 담긴다.
        if (클릭 == "D") { ; 클릭변수에 담긴 값이 "D" 일때
            break
        }
    }
    MouseGetPos, x1, y1
    OutputDebug, 현재마우스좌표 = %x1%,%y1%
    좌표[숫자] :=  [x1, y1]
    IniWrite, %x1%, %설정파일경로%, pos%숫자%, x
    IniWrite, %y1%, %설정파일경로%, pos%숫자%, y
    OutputDebug, 좌표따기 함수 끝======================================
    return 
}

리스트추가(문자열) {
    OutputDebug, 리스트추가 함수 시작======================================
    LV_Add("",문자열)
    SendMessage, 0x1014, 0, 1000,,ahk_id %핸들% ; 스크롤을 내려준다.
    OutputDebug, 리스트추가 함수 끝======================================
    return
}
;==============================================================================
툴팁설정:
Gui, Submit, NoHide
툴팁유무 := 구이_체크
OutputDebug, 툴팁유무 = %구이_체크%
ToolTip
Return

초설정:

Gui, Submit, NoHide
초 := 구이_초 ; 전역변수로 등록하기위해서
OutputDebug, 초 = %구이_초%
return

리스트뷰핸들설정:
Gui, Submit, NoHide
핸들 := 리스트뷰핸들 ; 전역변수로 등록하기위해서
OutputDebug, 핸들 = %리스트뷰핸들%
return

좌표설정:
Gui, Submit, NoHide
;ToolTip, % A_Gui "," A_GuiControl "," A_GuiControlEvent "," A_GuiEvent "," x "," 이름
for i, v in 목록 {
    if (v == 이름) { ; 드롭다운리스트에 현재 선택된 값 이 목록중에  있다면
        좌표따기(i) ; 그 순서의 값을 인자로 넘겨준다.
        WinSetTitle, 완료
        Sleep, 200
        WinSetTitle, 
        break
    }
}
return

라벨:
버튼클릭(멈춤체크)
return
;==============================================================================
;test: 
;for i1, v1 in 좌표 {
;    for i2, v2 in v1 {
;        ToolTip % i1 "번 좌표 = " v2
;        Sleep 250
;    }
;}
;return
;==============================================================================
GuiClose:
ExitApp