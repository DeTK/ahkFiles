#SingleInstance, Force

; GUI 1 만들기

Gui, 1: New, -Caption
Gui, Add, Text, w100 h100 Border, Drag to move
Gui, Show, x500, Gui 1

; GUI 2 만들기

Gui, 2: New, -Caption
Gui, Add, Text, w100 h100 Border, Will move too
Gui, Add, Radio, w50 h50 vradio1
Gui, Add, Radio, w50 h50 vradio2
Gui, Show, x725, Gui 2

; 0x201이 마우스 왼쪽 아래에 있습니다.
; 그러면 GUI에서 마우스 왼쪽 버튼이 눌러 지는지 확인할 수 있습니까?
; 이를 감지하면 WM_LBUTTONDOWN 함수가 실행됩니다.

OnMessage(0x201, "WM_LBUTTONDOWN")

; 0x47은 창 메시지입니다 WINDOW POSition CHANGED
; 창 위치가 바뀔 때마다이 기능이 실행됩니까?
; 그래도 창은 뭐야? 이것은 모든 GUI에 적용됩니까?

OnMessage(0x47, "WM_WINDOWPOSCHANGED")

; 마우스 왼쪽 버튼이 감지되면 다음을 수행하십시오.

WM_LBUTTONDOWN(){

    ; 구문 : PostMessage, 메시지 [, wParam, lParam, 컨트롤, WinTitle, WinText, ExcludeTitle, ExcludeText]
    ; "windows"에 메시지를 보냅니다. 0xA1은 WM_NCLBUTTONDOWN입니다 (Windows 메시지 비 클라이언트 Left BUTTONDOWN).
    ; 이것은 투쟁의 핵심입니다. 여기 무슨 일 이니? 왜 WM_NCLBUTTONDOWN인가?
    ; 그리고 WMLBUTTONDOWN과 어떻게 다른가요? 비 클라이언트 왼쪽과 왼쪽의 차이점은 무엇입니까?

    PostMessage, 0xA1, 2,,, Gui 1
}

WM_WINDOWPOSCHANGED(){
    ; 표준 get / set.
    ; GUI 1의 속성을 가져옵니다.
    WinGetPos, x, y, w, h, Gui 1
    ; GUI 2를 GUI 1과 일치하도록 이동하십시오.
    WinMove, Gui 2,, x + 225, y
}

Esc:: ExitApp