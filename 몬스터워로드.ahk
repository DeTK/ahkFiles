DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
#Include, C:\Users\DeTK\Documents\AutoHotkey\Lib\Gdip.ahk
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
SetKeyDelay, 0, 0, play                                  ;Send&ContolSend에 의한 각 키눌림 지연시간 0
SetBatchLines, -1                                        ;스크립트 실행시간 최고속도
SendMode, input                                          ;Send만 입력해도 Sendinput으로 인식
ListLines, off  		     
                            ;최근에 실행된 스크립트 줄 안보여줌
SetWorkingDir, %A_WorkingDir%
Return

ImageSearch_Inactive(Title, ImgFileName, ByRef Pos_X, ByRef Pos_Y, DebugMode=false)

{

 If !pToken := Gdip_Startup()

 {

  MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system

  ExitApp

 }

 OnExit, Exit




 pBitmapHayStack := Gdip_BitmapFromHWND(hwnd := WinExist(Title)) 

 pBitmapNeedle := Gdip_CreateBitmapFromFile(ImgFileName)




 Width1 := Gdip_GetImageWidth(pBitmapHayStack), Height1 := Gdip_GetImageHeight(pBitmapHayStack)

 Width2 := Gdip_GetImageWidth(pBitmapNeedle), Height2 := Gdip_GetImageHeight(pBitmapNeedle)

 E1 := Gdip_LockBits(pBitmapHayStack, 0, 0, Width1, Height1, Stride1, Scan01,BitmapData1)

 E2 := Gdip_LockBits(pBitmapNeedle, 0, 0, Width2, Height2, Stride2, Scan02,BitmapData2)




 MCode(Gdip_ImageSearch, "83EC148B4424309983E20303C28BC88B442434995383E2035503C2C1F80256C1F902837C24"

 . "30005789442420C7442410000000000F8EBE0000008B5C24288B7C24388D048D00000000894424188B442430895C241CE"

 . "B098DA424000000008BFFC74424440000000085C07E6D895C24148B6C242CC7442440000000008D6424008B4C24403B4C"

 . "243C0F8D8600000033C985FF7E158BD58BF38B063B02751F4183C20483C6043BCF7CEF8B442420035C2418FF44244003C"

 . "003C003E8EBC38B4C24448B5C24148B4424304183C3043BC8894C2444895C24147C978B4C24108B5C241C035C2418413B"

 . "4C2434894C2410895C241C0F8C68FFFFFF8B5424488B44244C5F5E5DC702FFFFFFFFC700FFFFFFFF5B83C414C38B4C244"

 . "48B5424488B44244C5F495E890A8B4C24085D89085B83C414C3")




 Time1 := A_TickCount

 VarSetCapacity(x, 8, 0), VarSetCapacity(y, 8, 0)

 Loop, 100

  DllCall(&Gdip_ImageSearch, "uint", Scan01, "uint", Scan02, "int", Width1, "int", Height1, "int", Width2, "int", Height2, "int", Stride1, "int", Stride2, "int*", x, "int*", y)

 Pos_X := X, Pos_Y := Y

 if (DebugMode = true)

  MsgBox, % "Time for 100 searches: " A_TickCount-Time1 "ms`nx: " x "`ny: " y ; 디버깅용

 

 Gdip_UnlockBits(pBitmapHayStack,BitmapData1), Gdip_UnlockBits(pBitmapNeedle,BitmapData2)

 Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)

 return

}




MCode(ByRef code, hex)

{

 VarSetCapacity(code, StrLen(hex)//2)

 Loop % StrLen(hex)//2 ;%

  NumPut("0x" SubStr(hex, 2*A_Index-1, 2), code, A_Index-1, "char")

}




*/
F1::
Doitx := Doity := 
Random, Doitx, 73, 83
Random, Doitx, 0.0, 1.0
Random, Doity, 181, 191
Random, Doity, 0.0, 1.0
ImageSearch_Inactive("","Doit.bmp", x, y)

	Controlmove,, %x%, %y%, ahk_class Qt5QWindowIcon
	Msgbox, %x% %y%
Return
F2::
Normalx := Normaly := 
Random, Normalx, 59, 69
Random, Normalx, 0.0, 1.0
Random, Normaly, 13, 23
Random, Normaly, 0.0, 1.0

ImageSearch_Inactive("ahk_class Qt5QWindowIcon","Normal.png", x, y)
	ControlClick, %x%+%Normalx%, %y%+%Normaly%
	Sleep 1000
	ControlClick, %x%+%Normalx%, %y%+%Normaly%
Return
F3::
Exitx := Exity :=
Random, Exitx, 23, 33
Random, Exitx, 0.0, 1.0
Random, Exity, 12, 22
Random, Exity, 0.0, 1.0
ImageSearch_Inactive("ahk_class Qt5QWindowIcon","Exit.png", x, y)
	ControlClick, %x%+%Exitx%, %y%+%Exity%
Return
F4::
Exit:

 Gdip_Shutdown(pToken)

 ExitApp

 return
 
 /*
F2:: ;시작키임

 ImageSearch_Inactive("ahk_class Photoshop","a.bmp", x, y)

 Mousemove %x%,%y%
 MsgBox %x%/%y%
 

 return
*/




/*
F2::
SetTimer, Doit, on, 1
SetTimer, Normal, on, 1
SetTimer, Exit1, on, 1
Return

F3::
SetTimer, Doit, off
SetTimer, Normal, off
SetTimer, Exit1, off
Return
