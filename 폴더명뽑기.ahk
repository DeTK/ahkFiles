#SingleInstance Force                                    ;스크립트 재실행 허용
#Hotstring NoMouse                                       ;마우스클릭 NO 리셋
#KeyHistory 0                                            ;키로그 0
;#NoTrayIcon                                              ;트레이아이콘 끄기
#Persistent                                              ;끄거나 Exitapp 만나기 직전 까지 실행
#NoEnv                                                   ;빈 문자열이 환경변수인지 점검하는걸 패스

BlockInput, SendAndMouse                                 ;실행중인 스크립트중에 Send&Mouse 입력 방지
Process, Priority,, High                                 ;우선순위를 윈도우즈의 작업 관리자에 보여주는 순위로 변경
SetControlDelay 0                                        ;각 콘트롤 변경 명령어다음에 올 지연시간 0
SetBatchLines, -1                                        ;스크립트 실행시간 최고속도
ListLines, off                                           ;최근에 실행된 스크립트 줄 안보여줌



F1::
o = D:\워크파일\
n = 이거야\
o := RegExReplace(o, "\\", "\\")
clipboard := RegExReplace(clipboard, o, n)
Return

clipboard =
Folder := 
Folder1 := 0
Folder2 :=
FileSelectFolder, Folder
Loop,%Folder%\*,0,1 
{
	Folder2 = %A_LoopFileDir%
	if (Folder1 != Folder2) {
		s = %clipboard%%A_LoopFileDir%`n
		clipboard = %s%
 	}
	Folder1 = %A_LoopFileDir% 
}
MsgBox, 완료
