#SingleInstance Force                                    ;스크립트 재실행 허용
#Hotstring NoMouse                                       ;마우스클릭 NO 리셋
#KeyHistory 0                                            ;키로그 0
#NoTrayIcon                                              ;트레이아이콘 끄기
#Persistent                                              ;끄거나 Exitapp 만나기 직전 까지 실행
#NoEnv                                                   ;빈 문자열이 환경변수인지 점검하는걸 패스

BlockInput, SendAndMouse                                 ;실행중인 스크립트중에 Send&Mouse 입력 방지
Process, Priority,, High                                 ;우선순위를 윈도우즈의 작업 관리자에 보여주는 순위로 변경
SetTitleMatchMode, 2                                     ;창 제목에 WinTitle 일부분만 입력해도 부합
SetControlDelay -1                                       ;각 콘트롤 변경 명령어다음에 올 지연시간 0
SetBatchLines, -1                                        ;스크립트 실행시간 최고속도
ListLines, off                                           ;최근에 실행된 스크립트 줄 안보여줌


FileCreateDir, ui
FileCreateDir, ui\console
FileCreateDir, ui\console\Human
FileCreateDir, ui\console\NightElf
FileCreateDir, ui\console\Orc
FileCreateDir, ui\console\Undead

FileMove 1.blp,ui\console\Human\HumanUITile01.blp,1
FileMove 2.blp,ui\console\Human\HumanUITile02.blp,1
FileMove 3.blp,ui\console\Human\HumanUITile03.blp,1
FileMove 4.blp,ui\console\Human\HumanUITile04.blp,1
FileMove 5.blp,ui\console\Human\HumanUITile-InventoryCover.blp,1
FileMove 6.blp,ui\console\Human\HumanUITile-TimeIndicatorFrame.blp,1

FileCopy ui\console\Human\HumanUITile01.blp, ui\console\NightElf\NightElfUITile01.blp,1
FileCopy ui\console\Human\HumanUITile02.blp, ui\console\NightElf\NightElfUITile02.blp,1
FileCopy ui\console\Human\HumanUITile03.blp, ui\console\NightElf\NightElfUITile03.blp,1
FileCopy ui\console\Human\HumanUITile04.blp, ui\console\NightElf\NightElfUITile04.blp,1
FileCopy ui\console\Human\HumanUITile-InventoryCover.blp, ui\console\NightElf\NightElfUITile-InventoryCover.blp,1
FileCopy ui\console\Human\HumanUITile-TimeIndicatorFrame.blp, ui\console\NightElf\NightElfUITile-TimeIndicatorFrame.blp,1

FileCopy ui\console\Human\HumanUITile01.blp, ui\console\Orc\OrcUITile01.blp,1
FileCopy ui\console\Human\HumanUITile02.blp, ui\console\Orc\OrcUITile02.blp,1
FileCopy ui\console\Human\HumanUITile03.blp, ui\console\Orc\OrcUITile03.blp,1
FileCopy ui\console\Human\HumanUITile04.blp, ui\console\Orc\OrcUITile04.blp,1
FileCopy ui\console\Human\HumanUITile-InventoryCover.blp, ui\console\Orc\OrcUITile-InventoryCover.blp,1
FileCopy ui\console\Human\HumanUITile-TimeIndicatorFrame.blp, ui\console\Orc\OrcUITile-TimeIndicatorFrame.blp,1

FileCopy ui\console\Human\HumanUITile01.blp, ui\console\Undead\UndeadUITile01.blp,1
FileCopy ui\console\Human\HumanUITile02.blp, ui\console\Undead\UndeadUITile02.blp,1
FileCopy ui\console\Human\HumanUITile03.blp, ui\console\Undead\UndeadUITile03.blp,1
FileCopy ui\console\Human\HumanUITile04.blp, ui\console\Undead\UndeadUITile04.blp,1
FileCopy ui\console\Human\HumanUITile-InventoryCover.blp, ui\console\Undead\UndeadUITile-InventoryCover.blp,1
FileCopy ui\console\Human\HumanUITile-TimeIndicatorFrame.blp, ui\console\Undead\UndeadUITile-TimeIndicatorFrame.blp,1

Gui,2: -Caption +Border AlwaysOnTop
Gui,2: font, s30, 고딕체,
Gui,2: Add, Text, x1 y1 w80 h40 , 완료
Gui,2: Show, Center w80 h40, New GUI Window
Sleep 500
2GuiClose:
ExitApp






