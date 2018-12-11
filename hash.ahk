FileSelectFolder, Input, , , 아래에서 해시 할 파일이나 폴더를 선택하십시오.
FileSelectFolder, Output, , , 결과 파일을 저장할 위치 :
Gui, Add, Text,, 해시 할 파일 경로 또는 폴더 : %Input%
Gui, Add, Text,, Enter 출력 파일 이름: %Output%
Gui, Add, Edit, W350 vFile
Gui, Add, Button, default, OK ; 버튼이 눌려 졌을 때 ButtonOK라는 레이블 (존재한다면)이 실행됩니다..
Gui, Show,, Hashdeep 사용자 인터페이스
return ; 자동 실행 섹션의 끝. 스크립트는 사용자가 무언가를하기 전까지는 유휴 상태입니다.
GuiClose:
ButtonOK:
Gui, Submit ; 사용자의 입력을 각 컨트롤과 연결된 변수에 저장합니다.
;CMD 창 열기
Run cmd.exe
Sleep, 70
WinWait, C:\WINDOWS\system32\cmd.exe,
IfWinNotActive, C:\WINDOWS\system32\cmd.exe, , WinActivate, C:\WINDOWS\system32\cmd.exe,
WinWaitActive, C:\WINDOWS\system32\cmd.exe,
SendInput, PushD \\server\share\Software\md5deep-4.2\{ENTER}
SendInput, hashdeep.exe -r -c md5,sha256,tiger -eb "%Input%" > "%Output%\%File%"
Sleep, 20
Send {ENTER}
Send PopD{ENTER}
Sleep, 370
ExitApp