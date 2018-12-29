; 18/07/08/04/19 v0.1
; 18/07/09/12/57 v0.2
; 18/07/13/09/29 v0.3
;
;
;
;
;
;
;
;

#SingleInstance, force
;#NoTrayIcon
#NoEnv
SetBatchLines, -1  ; 최대 속도로 연산을 실행합니다.

SetTitleMatchMode, 2
CoordMode, Mouse, Client
CoordMode, Pixel, Client

Hotkey, Up, off
Hotkey, Down, off
Hotkey, Left, off
Hotkey, Right, off
Hotkey, Space, off
Hotkey, Esc, off


global 숫자 := 1 ; 현재 에딧창 갯수
y위치 := 48 ; 유동하는y좌표의 위치
넓이 := 220 ; 구이창의 넓이
global 높이 := 70 ; 구이창의 높이

기본경로 := A_WorkingDir "\깃발꼽기\" ; 저장/불러오기의 기본위치
설정파일경로 := 기본경로 "설정.ini" ; 설정파일

IniRead, 처음시작, %설정파일경로%, 설정, 처음시작
IniRead, 창위치x, %설정파일경로%, 창위치, 가로
IniRead, 창위치y, %설정파일경로%, 창위치, 세로

if (처음시작 != "1") { ; 프로그램을 처음 구동 할경우에만
        FileCreateDir, %기본경로% ; 처음에는 깃발꼽기 폴더가 없으므로 생성
        MsgBox, 처음 구동하셨음?ㅋ?
        Sleep, 1
        IniWrite, 1, %설정파일경로%, 설정, 처음시작 ; 다음에 안들어오기 위해
}

Gui, 메인:Color, ffffff ; 구이 창의 배경을 하얀색으로
Gui, 메인:+LastFound -Caption +AlwaysOnTop ; 마지막으로 찾은창을 활성 및 캡션제거 항상 최상위
;WinSet, TransColor, EEAA99
Gui, 메인:Font, s17 ; 폰트 17
Gui, 메인:Add, Text, x199 y-2 v바1 g위치저장, ▩ ; 창을 움직이기 위해서
Gui, 메인:Add, Text, x-2 y-2 v바3 g창최소화, ▩ ; 창을 최소화
Gui, 메인:Add, Text, x-2 y-2 v바2 g창최대화 Hide, ▩ ; 창을 최대화
Gui, 메인:Font, s9 ; 폰트 9
Gui, 메인:Add, Edit, x45 y25 w35 h18 -Border Number Limit2 v루프횟수, 숫자 ; 숫자 1~2 자리 까지만 허용
Gui, 메인:Add, UpDown, Range1-99 Wrap ; 1~99 순환
Gui, 메인:Add, Checkbox, x0 y0 w0 h0 v체크1 Checked Disabled ; 체크한상태로 생성
Gui, 메인:Add, Checkbox, x0 y0 w0 h0 v도움말체크 Disabled ; 체크안한채로 생성
;GuiControl,, 체크1, 1 ; 1번만 체크
Gui, 메인:Add, Text, x10 y28, 횟수 : ; 그냥 텍스트
Gui, 메인:Add, Text, x85 y27 w15 +Border Center g추가, ▼ ; 클릭시 에딧창이 늘어난다
Gui, 메인:Add, Text, x105 y27 w15 +Border Center g제거, ▲ ; 클릭시 에딧창이 줄어든다
Gui, 메인:Add, Button, x125 y24 w40 h20 g저장, Save ; 클릭시 저장
Gui, 메인:Add, Button, x170 y50 w50 h20 g도움말, 도움말 ; 클릭시 도움말
Gui, 메인:Add, Button, x170 y24 w20 h20 g재시작, R ; 클릭시 재시작
Gui, 메인:Add, Button, x195 y24 w20 h20 g끄기, X ; 클릭시 종료
Gui, 메인:Add, DropDownList, x20 y0 w180 v파일선택 g불러오기,% 드롭다운리스트추가(기본경로) ;리스트에서 바로선택후 불러오기
GuiControl, 메인:Choose, 파일선택, 1 ; 기본선택을 1번째것으로
Gui, 메인:Add, Edit, x10 y%y위치% w50 h18 Number Limit4 vx1, x1좌표 ; 숫자 1~4자리만
Gui, 메인:Add, Edit, x70 y%y위치% w50 h18 Number Limit4 vy1, y1좌표 ; 숫자 1~4자리만
try {
    Gui, 메인:Show, x%창위치x% y%창위치y% w%넓이% h%높이%, new깃발꼽기 ; 한번이라도 창을 움직였을 경우
} Catch {
    Gui, 메인:Show, Center w%넓이% h%높이%, new깃발꼽기 ; 처음 구동하거나 처음 구동뒤 창을 안 움직였을 경우
}
Return

도움말:
    Gui, 메인:Submit, Nohide
    GuiControl,, 도움말체크, 1 ; 도움말이 켜져있는 상태를 표시하기 위함
    Gui, 도움말:-Caption
    Gui, 도움말:Add, Text,, 마우스커서를 미니맵상에 현재본인의 위치나
    Gui, 도움말:Add, Text,, 원하는 위치에 위치후 F2 클릭해주세요
    Gui, 도움말:Add, Text,, 그다음부터는 신나게 방향키로 움직인후
    Gui, 도움말:Add, Text,, 원하는 좌표에 스페이스 누르세요
    Gui, 도움말:Add, Text,, 다 지정했으면 esc
    Gui, 도움말:Add, Text,, 실행은 미니맵에 마우스를위치 시킨후 F8클릭
    Gui, 도움말:Add, Text,, 왼쪽 문자는 창최소화 최대화
    Gui, 도움말:Add, Text,, 오른쪽 문자는 이동바
    Gui, 도움말:Add, Text,, 추가적으로 수정할부분 댓글로 남겨주세요....
    Gui, 도움말:Add, Text,, 창닫기 esc
    Gui, 도움말:Show, Center w250 h255, 도움말
    Hotkey, Esc, on
Return


창최소화:
    Gui, 메인:Submit, Nohide
    IniRead, 창위치x, %설정파일경로%, 창위치, 가로
    IniRead, 창위치y, %설정파일경로%, 창위치, 세로
    Gui, 메인:Show, x%창위치x% y%창위치y% w19 h20, new깃발꼽기 ; 한번이라도 창을 움직였을 경우
    GuiControl, 메인:Hide, 바3
    GuiControl, 메인:Show, 바2
Return

창최대화:
    IniRead, 창위치x, %설정파일경로%, 창위치, 가로
    IniRead, 창위치y, %설정파일경로%, 창위치, 세로
    Gui, 메인:Show, x%창위치x% y%창위치y% w%넓이% h%높이%, new깃발꼽기 ; 한번이라도 창을 움직였을 경우
    GuiControl, 메인:Show, 바3
    GuiControl, 메인:Hide, 바2
Return

위치저장:
Gui,메인:Submit,NoHide
PostMessage, 0xa1,2,,,A ; 텍스트를 캡션으로 바꿔주는
GetKeyState, 클릭, LButton, P ; 마우스왼쪽클릭이 물리적으로 변화했을때 상태를 클릭변수에 저장
if (클릭 == "D") { ; 저장한 상태가 D(눌림) 일 경우
    Sleep, 1 ; 저장이 잘되도록 약간의 텀을준다 안넣으면 저장안됨?
    WinGetPos, 위치x, 위치y,,, new깃발꼽기 ; 현재 창의 위치
    IniWrite, %위치x%, %설정파일경로%, 창위치, 가로 ; 다음에 이위치로 생성하기위해
    IniWrite, %위치y%, %설정파일경로%, 창위치, 세로 ; 다음에 이위치로 생성하기위해
}

Return

추가:
    Gui, 메인:Submit, NoHide
    임시y위치 := y위치+(숫자*23) ; 추가될때마다 에딧창의 위치를 바꾸기위해
    숫자 ++
    체크변수 = 체크%숫자% 
    x변수 = x%숫자%
    y변수 = y%숫자%

    
    try {
        Gui, 메인:Add, Checkbox, x0 y0 w0 h0 v%체크변수% Checked Disabled
        Gui, 메인:Add, Edit, x10 y%임시y위치% w50 h18 Number Limit4 v%x변수%, x%숫자%좌표
        Gui, 메인:Add, Edit, x70 y%임시y위치% w50 h18 Number Limit4 v%y변수%, y%숫자%좌표
    } Catch {
        GuiControl, 메인:Show, %x변수%
        GuiControl, 메인:Show, %y변수%
        GuiControl, 메인:, %체크변수%, 1
    }
    높이수정(1)
    Gui, 메인:Show, w%넓이% h%높이%, new깃발꼽기
    Return

제거:
    Gui, 메인:Submit, NoHide
    체크변수 = 체크%숫자% 
    x변수 = x%숫자%
    y변수 = y%숫자%
    if (숫자 == 1) {
        Return
    }
    GuiControl, 메인:Hide, %x변수%
    GuiControl, 메인:Hide, %y변수%
    GuiControl, 메인:, %체크변수%, 0
    숫자--
    높이수정(2)
    Gui, 메인:Show, w%넓이% h%높이%, new깃발꼽기
    Return

불러오기:
    Gui, 메인:Submit, NoHide
    if (A_GuiControl == "파일 선택") {
        Return
    }
    Gui, 메인:Show, w%넓이% h40, new깃발꼽기
    체크변수 = 체크%A_Index%
    Loop { ; 불러오기 좋은 상황으로 만든다
        x변수 = x%A_Index%
        y변수 = y%A_Index%
        if (체크%A_Index% == 1) {
            GuiControl, 메인:Hide, %x변수%
            GuiControl, 메인:Hide, %y변수%
            GuiControl, 메인:, %체크변수%, 0
        } else {
            Break
        }
    }
    파일이름 := 기본경로 파일선택 ".ini"
    IniRead, 불러온숫자, %파일이름%, 체크박스, 갯수
    임시y위치 := y위치
    Loop, %불러온숫자% {
        IniRead, 불러온x변수, %파일이름%, 모든 좌표, x%A_Index%좌표
        IniRead, 불러온y변수, %파일이름%, 모든 좌표, y%A_Index%좌표
        x변수 = x%A_Index%
        y변수 = y%A_Index%
        
        try {
            Gui, 메인:Add, Edit, x10 y%임시y위치% w50 h18 Number Limit4 v%x변수%, %불러온x변수%
            Gui, 메인:Add, Edit, x70 y%임시y위치% w50 h18 Number Limit4 v%y변수%, %불러온y변수%
            Gui, 메인:Add, Checkbox, x0 y0 w0 h0 v체크%A_Index% Checked
        } catch {
            GuiControl, 메인:Show, %x변수%
            GuiControl, 메인:Show, %y변수%
            GuiControl, 메인:, %체크변수%, 1
        }

        GuiControl, 메인:, %x변수%, %불러온x변수%
        GuiControl, 메인:, %y변수%, %불러온y변수%        
        임시y위치 := y위치+(A_Index*23)
    }
    높이수정(, 불러온숫자)
    Gui, 메인:Show, w%넓이% h%높이%, new깃발꼽기
    숫자 := 불러온숫자
    Return

저장:
    Gui, 메인:Submit, NoHide
    GuiControl, 메인:Disable, Button15 ; 저장버튼 비활성화    
    Loop {
        체크변수 := 체크%A_Index%
        if (체크변수 == ""){
            Break
        }
        x변수 = x%A_Index%
        y변수 = y%A_Index%
        GuiControl, 메인:Disable, %x변수%
        GuiControl, 메인:Disable, %y변수%
    }
    Sleep, 500
    Gui, 저장용:-Caption
    Gui, 저장용:Add, Edit,v파일이름, 파일이름
    Gui, 저장용:Show
    SetTimer, 엔터체크, 1
    Return

    엔터체크:
    Gui, 메인:Submit, Nohide
    Gui, 저장용:Submit, Nohide

    GetKeyState, 상태, Enter, P
    if (상태 == "D") {
        SetTimer, 엔터체크, off
        Gui, 저장용:Destroy ; 이제 쓸모 없으므로 제거한다
        최종파일경로 := 기본경로 파일이름 ".ini"
        
        Loop {
            체크변수 := 체크%A_Index%
            if (체크변수 == 1) {
                x변수 := x%A_Index%
                y변수 := y%A_Index%
                Sleep, 1
                IniWrite, %x변수%, %최종파일경로%, 모든 좌표, x%A_Index%좌표
                IniWrite, %y변수%, %최종파일경로%, 모든 좌표, y%A_Index%좌표
                IniWrite, %숫자%, %최종파일경로%, 체크박스, 갯수
                Loop, {
                    체크변수 := 체크%A_Index%
                    if (체크변수 == ""){
                        Break
                    }
                    x변수 = x%A_Index%
                    y변수 = y%A_Index%
                    GuiControl, 메인:Enable, %x변수%
                    GuiControl, 메인:Enable, %y변수%
                }
            } else {
                Break
            }
        }    
        GuiControl, 메인:Enable, Button15 ; 저장버튼 활성화
    }
    GuiControl, 메인:,파일선택, |
    임시 := 드롭다운리스트추가(기본경로)
    GuiControl, 메인:,파일선택, %임시%
    GuiControl, 메인:Choose, 파일선택, 1
    Return

F8::
    Gui, 메인:Submit, NoHide
    WinExist("A")
    WinGetTitle, 타이틀w

    ;Clipboard := 타이틀

    PostMessage, 0x100, 65, 1966081,, Warcraft III ; a 눌림
    PostMessage, 0x101, 65, 1966081,, Warcraft III ; a 땜
    PostMessage, 0x100, 16, 2752513,, Warcraft III ; 쉬프트 눌림
    ;PostMessage, Msg, [wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]

    Loop, %루프횟수% { ; 총 횟수
        Loop, { ; 활성화된 좌표만?
            if (체크%A_Index% == 1) { ; 체크박스가 체크된 좌표인 경우
                마우스클릭(x%A_Index%, y%A_Index%) ; 마우스클릭
            } else {
                Break
            }
            
        }
    }
    PostMessage, 0x101, 16, 2752513,, Warcraft III ; 쉬프트 땜
    Return


F2::
    Gui, 메인:Submit, Nohide
    
;     범위가져오기(범위x1, 범위y1, 범위x2, 범위y2)
;     global 픽셀x :=
;     global 픽셀y :=
;     PixelSearch, 임시픽셀x, 임시픽셀y, %범위x1%, %범위y1%, %범위x2%, %범위y2%, 0XFFFFFF, RGB
;     if (ErrorLevel == 0) { ; 찾은경우
; ;        MouseMove, %임시픽셀x%, %임시픽셀y%
;         픽셀x := 임시픽셀x
;         픽셀y := 임시픽셀y

;         임시픽셀x1 := 픽셀x
;         임시픽셀y1 := 픽셀y + 1
;         임시픽셀x2 := 픽셀x
;         임시픽셀y2 := 픽셀y + 1
;         Loop { 
;             PixelSearch, 임시픽셀x, 임시픽셀y, %임시픽셀x1%, %임시픽셀y1%, %임시픽셀x2%, %임시픽셀y2%, 0XFFFFFF, RGB
;             if (ErrorLevel == 0) { ; 찾은경우
;                 픽셀이동(임시픽셀x1, 임시픽셀y1, 임시픽셀x2, 임시픽셀y2, "아")
; ;                MouseMove, %임시픽셀x%, %임시픽셀y%
;             } else {
;                 픽셀이동(임시픽셀x1, 임시픽셀y1, 임시픽셀x2, 임시픽셀y2, "위")
;                 픽셀y := Floor(픽셀y + (임시픽셀y1 - 픽셀y)/2)
;                 픽셀이동(임시픽셀x1, 임시픽셀y1, 임시픽셀x2, 임시픽셀y2, "오")
;                 Loop {
;                     PixelSearch, 임시픽셀x, 임시픽셀y, %임시픽셀x1%, %임시픽셀y1%, %임시픽셀x2%, %임시픽셀y2%, 0XFFFFFF, RGB
;                     if (ErrorLevel == 0) { ; 찾은경우
;                         픽셀이동(임시픽셀x1, 임시픽셀y1, 임시픽셀x2, 임시픽셀y2, "오")
; ;                        MouseMove, %임시픽셀x%, %임시픽셀y%
;                     } else {
;                         픽셀x := Floor(픽셀x + (임시픽셀x1 - 픽셀x)/2)
;                         Break
;                     }
;                 }
;                 Break
;             }
;         }
;     }
    MouseGetPos, 이동x, 이동y
    ToolTip, 좌표따기, %이동x%, %이동y%
    global 이동x := 이동x
    global 이동y := 이동y
    
    WinActivate, Warcraft III
    ; 창크기가져오기(WinExist("A"), w, h)
    ; WinGetPos, wX, wY, wW, wH
    ; wX := wX + 100
    ; wY := (h + wY) - 100
    ; Gui, 이동용: Color, 0xEEAA99
    ; WinSet, TransColor, 0xEEAA99
    ; Gui, 이동용: +AlwaysOnTop -Caption
    ; Gui, 이동용: Add, Button, x16 y0 w20 h20 g위, ↑
    ; Gui, 이동용: Add, Button, x16 y40 w20 h20 g아, ↓
    ; Gui, 이동용: Add, Button, x36 y20 w20 h20 g오, →
    ; Gui, 이동용: Add, Button, x-4 y20 w20 h20 g왼, ←
    ; Gui, 이동용: Add, Button, x56 y20 w60 h20 g확정, 확정
    ; Gui, 이동용: Add, Button, x56 y40 w60 h20 g끝, 끝
    ; Gui, 이동용: Add, Text, x56 y0 g이동, ▩
    ; Gui, 이동용: Show, x%wX% y%wY% w121 h65, 설정용
    sleep, 500
    Hotkey, Up, on
    Hotkey, Down, on
    Hotkey, Left, on
    Hotkey, Right, on
    Hotkey, Space, on
    Hotkey, Esc, on
    ToolTip
    Return
; 이동:
;     PostMessage, 0xa1,2,,,A ; 텍스트를 캡션으로 바꿔주는
;     Return

UP::
    이동y -= 1
    마우스클릭(이동x, 이동y, 1)
;    WinActivate, Warcraft III
    Return

Down::
    이동y += 1
    마우스클릭(이동x, 이동y, 1)
;    WinActivate, Warcraft III
    Return

Left::
    이동x -= 1
    마우스클릭(이동x, 이동y, 1)
;    WinActivate, Warcraft III
    Return

Right::
    이동x += 1
    마우스클릭(이동x, 이동y, 1)
;    WinActivate, Warcraft III
    Return

Space::
    Gui, 메인:Submit, Nohide
    GuiControl, 메인:, x%숫자%, %이동x%
    GuiControl, 메인:, y%숫자%, %이동y%
    Gosub, 추가
    Return

Esc::
    Gui, 메인:Submit, Nohide

    if (도움말체크 == 1){
        Gui, 도움말:Destroy
        GuiControl,, 도움말체크, 0
        Return
    }
    Gui, 이동용:Destroy
    Hotkey, Up, off
    Hotkey, Down, off
    Hotkey, Left, off
    Hotkey, Right, off
    Hotkey, Space, off
    Hotkey, Esc, off
    Gosub, 제거
    Gosub, 저장
    return


픽셀이동(ByRef 임시픽셀x1, ByRef 임시픽셀y1, ByRef 임시픽셀x2, ByRef 임시픽셀y2, 방위) {
    if (방위 == "위") {
        임시픽셀y1--
        임시픽셀y2--
    }
    if (방위 == "아") {
        임시픽셀y1++
        임시픽셀y2++
    }
    if (방위 == "오") {
        임시픽셀x1++
        임시픽셀x2++
    }
    if (방위 == "왼") {
        임시픽셀x1--
        임시픽셀x2--
    }
    Return
}


창크기가져오기(hWnd, ByRef w := "", ByRef h := "")
{
    VarSetCapacity(rect, 16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", &rect)
    w := NumGet(rect, 8, "int")
    h := NumGet(rect, 12, "int")
    Return
}


범위가져오기(ByRef 범위x1, ByRef 범위y1, ByRef 범위x2, ByRef 범위y2) {
    Loop {
        GetKeyState, 상태, CapsLock, T
        if (상태 == "D") {
            Loop {
                GetKeyState, 상태, CapsLock, T
                if (상태 == "U") {
                    MouseGetPos, 범위x1, 범위y1
                    Break
                }
                Sleep, 50
            }
            Break
        } else {
            Loop {
                GetKeyState, 상태, CapsLock, T
                if (상태 == "D") {
                    MouseGetPos, 범위x1, 범위y1
                    Break
                }
                Sleep, 50
            }
            Break
        }
    }
    Sleep, 500
    GetKeyState, 상태, CapsLock, T
    Loop {
         if (상태 == "D") {
            Loop {
                GetKeyState, 상태, CapsLock, T
                if (상태 == "U") {
                    MouseGetPos, 범위x2, 범위y2
                    Break
                }
                Sleep, 50
            }
            Break
        } else {
            Loop {
                GetKeyState, 상태, CapsLock, T
                if (상태 == "D") {
                    MouseGetPos, 범위x2, 범위y2
                    Break
                }
                Sleep, 50
            }
            Break
        }
    }
    Return
}

마우스클릭(x, y, a = 0) {
    
    lpararm := x|y<<16
    if (a == 1) {
        PostMessage, 0x100, 65, 1966081,, Warcraft III ; a 눌림
        PostMessage, 0x101, 65, 1966081,, Warcraft III ; a 땜
        PostMessage, 0x201, 1, %lpararm%,, Warcraft III
        PostMessage, 0x202, 0, %lpararm%,, Warcraft III
    }
    PostMessage, 0x201, 1, %lpararm%,,
    PostMessage, 0x202, 0, %lpararm%,,
    Return
}

드롭다운리스트추가(경로) {
    Loop, Files, %경로%*.ini
    {        
        임시 =  %A_LoopFileName%
        리스트 := 리스트 임시
    }
    Return, 이름수정(리스트)
}

이름수정(파일이름) {
    StringReplace, 파일이름, 파일이름, .ini, |,, A
    StringReplace, 파일이름, 파일이름, 설정
    Return, "파일 선택|"파일이름
}

높이수정(f = 0,불러온숫자 = 0) {

    if (f == 1) {        ; 추가 한 경우
        높이 += 23 ;
    } else if (f == 2) { ; 제거 한 경우
        높이 -= 23 ;
    } else {               ; 불러오기 한 경우
        높이 := 70 + (23*(불러온숫자-1))
    }
    Return 
}

재시작:
    Reload

끄기:
GuiClose:
    ExitApp