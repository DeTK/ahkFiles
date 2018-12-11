
DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force                                    ;스크립트 재실행 허용
#Hotstring NoMouse                                       ;마우스클릭시 NO 리셋
#KeyHistory 0                                            ;키로그 0
#NoTrayIcon                                              ;트레이아이콘 끄기
#Persistent                                              ;끄거나 Exitapp 만나기 직전 까지 실행
#NoEnv                                                   ;빈 문자열이 환경변수인지 점검하는걸 패스
BlockInput, SendAndMouse                                 ;실행중인 스크립트중에 Send&Mouse 입력 방지
Process, Priority,, High                                 ;우선순위를 윈도우즈의 작업 관리자에 보여주는 순위로 변경
SetTitleMatchMode, 2                                     ;창 제목에 WinTitle 일부분만 입력해도 부합
SetControlDelay -1                                       ;각 콘트롤 변경 명령어다음에 올 지연시간 0
SetKeyDelay, 0, 0, play                                  ;Send&ContolSend에 의한 각 키눌림 지연시간 0
SetBatchLines, -1                                        ;스크립트 실행시간 최고속도
SendMode, input                                          ;Send만 입력해도 Sendinput으로 인식
ListLines, off                                           ;최근에 실행된 스크립트 줄 안보여줌

WinWait Warcraft III
WinWaitClose Warcraft III


Process, close, 워크.exe
Process, close, Warcraft III.exe
Process, close, Warcraft III(32비트).exe
Process, close, 킬.exe
Exitapp