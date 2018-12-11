;#########
;전 처리문 선언
;#########

DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force                                    ;스크립트 재실행 허용
#Hotstring NoMouse                                       ;마우스클릭 NO 리셋
#KeyHistory 0                                            ;키로그 0
#NoTrayIcon                                              ;트레이아이콘 끄기
#Persistent                                              ;끄거나 Exitapp 만나기 직전 까지 실행
#NoEnv                                                   ;빈 문자열이 환경변수인지 점검하는걸 패스

CoordMode, Mouse, Relative                               ;활성창의 마우스 좌표모드 Relative 절대적
CoordMode, Pixel, Relative                               ;활성창의  픽셀 좌표모드 Relative 절대적
BlockInput, SendAndMouse                                 ;실행중인 스크립트중에 Send&Mouse 입력 방지
Process, Priority,, High                                 ;우선순위를 윈도우즈의 작업 관리자에 보여주는 순위로 변경
SetTitleMatchMode, 2                                     ;창 제목에 WinTitle 일부분만 입력해도 부합
SetControlDelay -1                                       ;각 콘트롤 변경 명령어다음에 올 지연시간 0
SetKeyDelay, 0, 0, play                                  ;Send&ContolSend에 의한 각 키눌림 지연시간 0
SetBatchLines, -1                                        ;스크립트 실행시간 최고속도
SendMode, input                                          ;Send만 입력해도 Sendinput으로 인식
ListLines, off                                           ;최근에 실행된 스크립트 줄 안보여줌

F1::

	Sleep, %s%
	FileEncoding, CP437	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%437`n
	Sleep, %s%
	FileEncoding, CP500	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%500`n
	Sleep, %s%
	FileEncoding, CP708	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%708`n
	Sleep, %s%
		FileEncoding, CP709	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%709`n
	Sleep, %s%
		FileEncoding, CP710	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%710`n
	Sleep, %s%
		FileEncoding, CP720
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%720`n
	Sleep, %s%
		FileEncoding, CP737	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%737`n
	Sleep, %s%
		FileEncoding, CP775	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%775`n
	Sleep, %s%
		FileEncoding, CP850	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%850`n
	Sleep, %s%
		FileEncoding, CP852	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%852`n
	Sleep, %s%
		FileEncoding, CP855	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%855`n
	Sleep, %s%
		FileEncoding, CP857	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%857`n
	Sleep, %s%
		FileEncoding, CP858	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%858`n
	Sleep, %s%
		FileEncoding, CP860	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%860`n
	Sleep, %s%
		FileEncoding, CP861	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%861`n
	Sleep, %s%
		FileEncoding, CP862	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%862`n
	Sleep, %s%
		FileEncoding, CP863	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%863`n
	Sleep, %s%
		FileEncoding, CP864	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%864`n
	Sleep, %s%
		FileEncoding, CP865
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%865`n
	Sleep, %s%
		FileEncoding, CP866	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%866`n
	Sleep, %s%
		FileEncoding, CP869	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%869`n
	Sleep, %s%
		FileEncoding, CP870	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%870`n
	Sleep, %s%
		FileEncoding, CP874	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%874`n
	Sleep, %s%
		FileEncoding, CP875	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%875`n
	Sleep, %s%
		FileEncoding, CP932	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%932`n
	Sleep, %s%
		FileEncoding, CP936	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%936`n
	Sleep, %s%
		FileEncoding, CP949	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%949`n
	Sleep, %s%
		FileEncoding, CP950	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%950`n
	Sleep, %s%
		FileEncoding, CP1026	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1026`n
	Sleep, %s%
		FileEncoding, CP1047	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1047`n
	Sleep, %s%
		FileEncoding, CP1140	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1140`n
	Sleep, %s%
		FileEncoding, CP1141
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1141`n
	Sleep, %s%
		FileEncoding, CP1142
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1142`n
	Sleep, %s%
		FileEncoding, CP1143
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1143`n
	Sleep, %s%
		FileEncoding, CP1144
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1144`n
	Sleep, %s%
		FileEncoding, CP1145	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1145`n
	Sleep, %s%
	FileEncoding, CP1146
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1146`n
	Sleep, %s%
	FileEncoding, CP1147
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1147`n
	Sleep, %s%
	FileEncoding, CP1148	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1148`n
	Sleep, %s%
	FileEncoding, CP1149	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1149`n
	Sleep, %s%
	FileEncoding, CP1200	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1200`n
	Sleep, %s%
	FileEncoding, CP1201	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1201`n
	Sleep, %s%
	FileEncoding, CP1250	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1250`n
	Sleep, %s%
	FileEncoding, CP1251	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1251`n
	Sleep, %s%
	FileEncoding, CP1252	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1252`n
	Sleep, %s%
	FileEncoding, CP1253	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1253`n
	Sleep, %s%
	FileEncoding, CP1254	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1254`n
	Sleep, %s%
	FileEncoding, CP1255	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1255`n
	Sleep, %s%
	FileEncoding, CP1256	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1256`n
	Sleep, %s%
	FileEncoding, CP1257	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1257`n
	Sleep, %s%
	FileEncoding, CP1258	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1258`n
	Sleep, %s%
	FileEncoding, CP1361	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%1361`n
	Sleep, %s%
	FileEncoding, CP10000	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10000`n
	Sleep, %s%
	FileEncoding, CP10001	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10001`n
	Sleep, %s%
	FileEncoding, CP10002	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10002`n
	Sleep, %s%
	FileEncoding, CP10003	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10003`n
	Sleep, %s%
	FileEncoding, CP10004	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10004`n
	Sleep, %s%
	FileEncoding, CP10005	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10005`n
	Sleep, %s%
	FileEncoding, CP10006	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10006`n
	Sleep, %s%
	FileEncoding, CP10007	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10007`n
	Sleep, %s%
	FileEncoding, CP10008	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10008`n
	Sleep, %s%
	FileEncoding, CP10010	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10010`n
	Sleep, %s%
	FileEncoding, CP10017	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10017`n
	Sleep, %s%
	FileEncoding, CP10021	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10021`n
	Sleep, %s%
	FileEncoding, CP10029	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10029`n
	Sleep, %s%
	FileEncoding, CP10079	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10079`n
	Sleep, %s%
	FileEncoding, CP10081	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10081`n
	Sleep, %s%
	FileEncoding, CP10082	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%10082`n
	Sleep, %s%
	FileEncoding, CP12000	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%12000`n
	Sleep, %s%
	FileEncoding, CP12001	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%12001`n
	Sleep, %s%
	FileEncoding, CP20000	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20000`n
	Sleep, %s%
	FileEncoding, CP20001	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20001`n
	Sleep, %s%
	FileEncoding, CP20002	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20002`n
	Sleep, %s%
	FileEncoding, CP20003	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20003`n
	Sleep, %s%
	FileEncoding, CP20004	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20004`n
	Sleep, %s%
	FileEncoding, CP20005	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20005`n
	Sleep, %s%
	FileEncoding, CP20105	
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20105`n
	Sleep, %s%
	FileEncoding, CP20106
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20106`n
	Sleep, %s%
	FileEncoding, CP20107
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20107`n
	Sleep, %s%
	FileEncoding, CP20108
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20108`n
	Sleep, %s%
	FileEncoding, CP20127
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20127`n
	Sleep, %s%
	FileEncoding, CP20261
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20261`n
	Sleep, %s%
	FileEncoding, CP20269
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20269`n
	Sleep, %s%
	FileEncoding, CP20273
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20273`n
	Sleep, %s%
	FileEncoding, CP20277
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20277`n
	Sleep, %s%
	FileEncoding, CP20278
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20278`n
	Sleep, %s%
	FileEncoding, CP20280
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20280`n
	Sleep, %s%
	FileEncoding, CP20284
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20284`n
	Sleep, %s%
	FileEncoding, CP20285
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20285`n
	Sleep, %s%
	FileEncoding, CP20290
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20290`n
	Sleep, %s%
	FileEncoding, CP20297
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20297`n
	Sleep, %s%
	FileEncoding, CP20420
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20420`n
	Sleep, %s%
	FileEncoding, CP20423
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20423`n
	Sleep, %s%
	FileEncoding, CP20424
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20424`n
	Sleep, %s%
	FileEncoding, CP20833
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20833`n
	Sleep, %s%
	FileEncoding, CP20838
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20838`n
	Sleep, %s%
	FileEncoding, CP20866
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20866`n
	Sleep, %s%
	FileEncoding, CP20871
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20871`n
	Sleep, %s%
	FileEncoding, CP20880
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20880`n
	Sleep, %s%
	FileEncoding, CP20905
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20905`n
	Sleep, %s%
	FileEncoding, CP20924
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20924`n
	Sleep, %s%
	FileEncoding, CP20932
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20932`n
	Sleep, %s%
	FileEncoding, CP20936
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20936`n
	Sleep, %s%
	FileEncoding, CP20949
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%20949`n
	Sleep, %s%
	FileEncoding, CP21025
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%21025`n
	Sleep, %s%
	FileEncoding, CP21027
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%21027`n
	Sleep, %s%
	FileEncoding, CP21866
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%21866`n
	Sleep, %s%
	FileEncoding, CP28591
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28591`n
	Sleep, %s%
	FileEncoding, CP28592
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28592`n
	Sleep, %s%
	FileEncoding, CP28593
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28593`n
	Sleep, %s%
	FileEncoding, CP28594
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28594`n
	Sleep, %s%
	FileEncoding, CP28595
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28595`n
	Sleep, %s%
	FileEncoding, CP28596
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28596`n
	Sleep, %s%
	FileEncoding, CP28597
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28597`n
	Sleep, %s%
	FileEncoding, CP28598
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28598`n
	Sleep, %s%
	FileEncoding, CP28599
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28599`n
	Sleep, %s%
	FileEncoding, CP28603
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28603`n
	Sleep, %s%
	FileEncoding, CP28605
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%28605`n
	Sleep, %s%
	FileEncoding, CP29001
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%29001`n
	Sleep, %s%
	FileEncoding, CP38598
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%38598`n
	Sleep, %s%
	FileEncoding, CP50220
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50220`n
	Sleep, %s%
	FileEncoding, CP50221
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50221`n
	Sleep, %s%
	FileEncoding, CP50222
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50222`n
	Sleep, %s%
	FileEncoding, CP50225
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50225`n
	Sleep, %s%
	FileEncoding, CP50227
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50227`n
	Sleep, %s%
	FileEncoding, CP50229
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50229`n
	Sleep, %s%
	FileEncoding, CP50930
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50930`n
	Sleep, %s%
	FileEncoding, CP50931
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50931`n
	Sleep, %s%
	FileEncoding, CP50933
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50933`n
	Sleep, %s%
	FileEncoding, CP50935
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50935`n
	Sleep, %s%
	FileEncoding, CP50936
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50936`n
	Sleep, %s%
	FileEncoding, CP50937
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50937`n
	Sleep, %s%
	FileEncoding, CP50939
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%50939`n
	Sleep, %s%
	FileEncoding, CP51932
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%51932`n
	Sleep, %s%
	FileEncoding, CP51936
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%51936`n
	Sleep, %s%
	FileEncoding, CP51949
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%51949`n
	Sleep, %s%
	FileEncoding, CP51950
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%51950`n
	Sleep, %s%
	FileEncoding, CP52936
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%52936`n
	Sleep, %s%
	FileEncoding, CP54936
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%54936`n
	Sleep, %s%
	FileEncoding, CP57002
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57002`n
	Sleep, %s%
	FileEncoding, CP57003
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57003`n
	Sleep, %s%
	FileEncoding, CP57004
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57004`n
	Sleep, %s%
	FileEncoding, CP57005
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57005`n
	Sleep, %s%
		FileEncoding, CP57006
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57006`n
	Sleep, %s%
	FileEncoding, CP57007
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57007`n
	Sleep, %s%
	FileEncoding, CP57008
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57008`n
	Sleep, %s%
	FileEncoding, CP57009
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57009`n
	Sleep, %s%
	FileEncoding, CP57010
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57010`n
	Sleep, %s%
	FileEncoding, CP57011
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%57011`n
	Sleep, %s%
	FileEncoding, CP65000
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%65000`n
	Sleep, %s%
	FileEncoding, CP65001
	FileRead, money, 나무.txt
	Clipboard = %money%
	;Send, `n%money%65001`n
	Sleep, %s%
	
sleep 1000
ImageSearch, x, y, 1249, 865, 1310, 914, *50 힐.png
IF ErrorLevel = 0
{
	MouseMove, x, y
}
sleep 1000
ImageSearch, x, y, 1431, 871, 1490, 914, *50 이너.png
IF ErrorLevel = 0
{
	MouseMove, x, y
}
sleep 1000
ImageSearch, x, y, 1509, 865, 1572, 914, *50 프로스트.png
IF ErrorLevel = 0
{
	MouseMove, x, y
}

Return
F2::
Exitapp