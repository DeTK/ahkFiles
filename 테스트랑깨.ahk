
;수정 2017-02-20 05:24
;수정 2017-02-25 05:09
;수정 2017-03-02 10:50

DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
Process, Priority,, High
#SingleInstance Force
SetTitleMatchMode, 2 
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
;VarSetCapacity
#Persistent
#KeyHistory 0
#NoEnv
;fileselectfile,File, 3, , ,(*.ini)
Gui,Submit,Nohide

Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
Gui, Add, Text, x0 y0 w895 h15 gbar Center , ;바
Gui, Add, Button, x0 y15 w60 h20 gin , 불러오기
Gui, Add, Button, x0 y35 w60 h20 gFDelete , 원본삭제
Gui, Add, Button, x0 y55 w60 h20 gRFDelete , 파일삭제
Gui, Add, Button, x0 y75 w60 h20 ggui2 , 만들기
Gui, Add, Button, x0 y95 w60 h20 g변환 , 적  용
Gui, Add, Button, x0 y115 w60 h20 gGuiClose , 끄  기
Gui, Show, Center w61 h135 , New GUI Window
Return

gui2:
IniRead, filename1,%File%,파일a,파일1
IniRead, filename2,%File%,파일a,파일2
IniRead, filename3,%File%,파일a,파일3
IniRead, filename4,%File%,파일a,파일4
IniRead, filename5,%File%,파일a,파일5
IniRead, filename6,%File%,파일a,파일6
a := 1
IniRead, filename1%a%,%File%,파일b,파일1
IniRead, filename2%a%,%File%,파일b,파일2
IniRead, filename3%a%,%File%,파일b,파일3
IniRead, filename4%a%,%File%,파일b,파일4
IniRead, filename5%a%,%File%,파일b,파일5
IniRead, filename6%a%,%File%,파일b,파일6
a := 2
IniRead, filename1%a%,%File%,파일c,파일1
IniRead, filename2%a%,%File%,파일c,파일2
IniRead, filename3%a%,%File%,파일c,파일3
IniRead, filename4%a%,%File%,파일c,파일4
IniRead, filename5%a%,%File%,파일c,파일5
IniRead, filename6%a%,%File%,파일c,파일6
a := 3
IniRead, filename1%a%,%File%,파일d,파일1
IniRead, filename2%a%,%File%,파일d,파일2
IniRead, filename3%a%,%File%,파일d,파일3
IniRead, filename4%a%,%File%,파일d,파일4
IniRead, filename5%a%,%File%,파일d,파일5
IniRead, filename6%a%,%File%,파일d,파일6
a := 4
IniRead, filename1%a%,%File%,파일e,파일1
IniRead, filename2%a%,%File%,파일e,파일2
IniRead, filename3%a%,%File%,파일e,파일3
IniRead, filename4%a%,%File%,파일e,파일4
IniRead, filename5%a%,%File%,파일e,파일5
IniRead, filename6%a%,%File%,파일e,파일6

IniRead, filesave,%File%,이름,파일이름

Gui,2: Destroy
Gui,2:Submit,Nohide
Gui,2: +LastFound +ToolWindow  -Resize -MaximizeBox -caption
Gui,2: Add, Text, x0 y0 w895 h10 gbar Center , ;바
Gui,2: Add, Edit, x2 y54 w440 h20 vfilename1 , %filename1%
Gui,2: Add, Edit, x462 y11 w440 h20 vfilename11 , %filename11%
Gui,2: Add, Edit, x462 y32 w440 h20 vfilename21 , %filename21%
Gui,2: Add, Edit, x462 y53 w440 h20 vfilename31 , %filename31%
Gui,2: Add, Edit, x462 y74 w440 h20 vfilename41 , %filename41%
Gui,2: Add, Edit, x462 y95 w440 h20 vfilename51 , %filename51%
Gui,2: Add, Edit, x462 y116 w440 h20 vfilename61 , %filename61%
Gui,2: Add, Edit, x2 y184 w440 h20 vfilename2 , %filename2%
Gui,2: Add, Edit, x462 y141 w440 h20 vfilename12 , %filename12%
Gui,2: Add, Edit, x462 y162 w440 h20 vfilename22 , %filename22%
Gui,2: Add, Edit, x462 y183 w440 h20 vfilename32 , %filename32%
Gui,2: Add, Edit, x462 y204 w440 h20 vfilename42 , %filename42%
Gui,2: Add, Edit, x462 y225 w440 h20 vfilename52 , %filename52%
Gui,2: Add, Edit, x462 y246 w440 h20 vfilename62 , %filename62%
Gui,2: Add, Edit, x2 y314 w440 h20 vfilename3 , %filename3%
Gui,2: Add, Edit, x462 y271 w440 h20 vfilename13 , %filename13%
Gui,2: Add, Edit, x462 y292 w440 h20 vfilename23 , %filename23%
Gui,2: Add, Edit, x462 y313 w440 h20 vfilename33 , %filename33%
Gui,2: Add, Edit, x462 y334 w440 h20 vfilename43 , %filename43%
Gui,2: Add, Edit, x462 y355 w440 h20 vfilename53 , %filename53%
Gui,2: Add, Edit, x462 y376 w440 h20 vfilename63 , %filename63%
Gui,2: Add, Edit, x2 y444 w440 h20 vfilename4 , %filename4%
Gui,2: Add, Edit, x462 y401 w440 h20 vfilename14 , %filename14%
Gui,2: Add, Edit, x462 y422 w440 h20 vfilename24 , %filename24%
Gui,2: Add, Edit, x462 y443 w440 h20 vfilename34 , %filename34%
Gui,2: Add, Edit, x462 y464 w440 h20 vfilename44 , %filename44%
Gui,2: Add, Edit, x462 y485 w440 h20 vfilename54 , %filename54%
Gui,2: Add, Edit, x462 y506 w440 h20 vfilename64 , %filename64%
Gui,2: Add, Edit, x5 y530 w440 h20 Center vfilesave,%filesave%
Gui,2: Add, Button, x462 y530 w440 h20 gMake , 적    용
Gui,2: Show, Center h555 w910, New GUI Window
Return

in:
gui,submit,nohide
fileselectfile,File, 3, , ,(*.ini)
Return
bar:
PostMessage, 0xa1,2,,,A
Return

변환:
Gui,Submit,NoHide
;--------------------------------------------공통되는파일이름
IniRead, filename1,%File%,파일a,파일1
IniRead, filename2,%File%,파일a,파일2
IniRead, filename3,%File%,파일a,파일3
IniRead, filename4,%File%,파일a,파일4
IniRead, filename5,%File%,파일a,파일5
IniRead, filename6,%File%,파일a,파일6
;--------------------------------------------첫번째로바꿀이름
a := 1
IniRead, filename1%a%,%File%,파일b,파일1
IniRead, filename2%a%,%File%,파일b,파일2
IniRead, filename3%a%,%File%,파일b,파일3
IniRead, filename4%a%,%File%,파일b,파일4
IniRead, filename5%a%,%File%,파일b,파일5
IniRead, filename6%a%,%File%,파일b,파일6
;--------------------------------------------두번째로바꿀이름
a := 2
IniRead, filename1%a%,%File%,파일c,파일1
IniRead, filename2%a%,%File%,파일c,파일2
IniRead, filename3%a%,%File%,파일c,파일3
IniRead, filename4%a%,%File%,파일c,파일4
IniRead, filename5%a%,%File%,파일c,파일5
IniRead, filename6%a%,%File%,파일c,파일6
;--------------------------------------------세번째로바꿀이름
a := 3
IniRead, filename1%a%,%File%,파일d,파일1
IniRead, filename2%a%,%File%,파일d,파일2
IniRead, filename3%a%,%File%,파일d,파일3
IniRead, filename4%a%,%File%,파일d,파일4
IniRead, filename5%a%,%File%,파일d,파일5
IniRead, filename6%a%,%File%,파일d,파일6
;--------------------------------------------네번째로바꿀이름
a := 4
IniRead, filename1%a%,%File%,파일e,파일1
IniRead, filename2%a%,%File%,파일e,파일2
IniRead, filename3%a%,%File%,파일e,파일3
IniRead, filename4%a%,%File%,파일e,파일4
IniRead, filename5%a%,%File%,파일e,파일5
IniRead, filename6%a%,%File%,파일e,파일6

;--------------------------------------------------------------

Filecopy, %filename1%,%filename11%,1
Filecopy, %filename2%,%filename21%,1
Filecopy, %filename3%,%filename31%,1
Filecopy, %filename4%,%filename41%,1
Filecopy, %filename5%,%filename51%,1
Filecopy, %filename6%,%filename61%,1

Filecopy, %filename1%,%filename12%,1
Filecopy, %filename2%,%filename22%,1
Filecopy, %filename3%,%filename32%,1
Filecopy, %filename4%,%filename42%,1
Filecopy, %filename5%,%filename52%,1
Filecopy, %filename6%,%filename62%,1

Filecopy, %filename1%,%filename13%,1
Filecopy, %filename2%,%filename23%,1
Filecopy, %filename3%,%filename33%,1
Filecopy, %filename4%,%filename43%,1
Filecopy, %filename5%,%filename53%,1
Filecopy, %filename6%,%filename63%,1

Filecopy, %filename1%,%filename14%,1
Filecopy, %filename2%,%filename24%,1
Filecopy, %filename3%,%filename34%,1
Filecopy, %filename4%,%filename44%,1
Filecopy, %filename5%,%filename54%,1
Filecopy, %filename6%,%filename64%,1

Progress, B1 zh0 fs18 Center , 완      료  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
Return

FDelete:
FileDelete %filename1%
FileDelete %filename2%
FileDelete %filename3%
FileDelete %filename4%
FileDelete %filename5%
FileDelete %filename6%

Progress, B1 zh0 fs18 Center , 삭 제 완 료  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
Return

RFDelete:
FileDelete %filename11%
FileDelete %filename21%
FileDelete %filename31%
FileDelete %filename41%
FileDelete %filename51%
FileDelete %filename61%

FileDelete %filename12%
FileDelete %filename22%
FileDelete %filename32%
FileDelete %filename42%
FileDelete %filename52%
FileDelete %filename62%

FileDelete %filename13%
FileDelete %filename23%
FileDelete %filename33%
FileDelete %filename43%
FileDelete %filename53%
FileDelete %filename63%

FileDelete %filename14%
FileDelete %filename24%
FileDelete %filename34%
FileDelete %filename44%
FileDelete %filename54%
FileDelete %filename64%

Progress, B1 zh0 fs18 Center , 원 본 삭 제 완 료;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
Return

Make:
Gui,2:Submit,NoHide
IniWrite, %filename1%,%filesave%.ini,파일a,파일1
IniWrite, %filename2%,%filesave%.ini,파일a,파일2
IniWrite, %filename3%,%filesave%.ini,파일a,파일3
IniWrite, %filename4%,%filesave%.ini,파일a,파일4
IniWrite, %filename5%,%filesave%.ini,파일a,파일5
IniWrite, %filename6%,%filesave%.ini,파일a,파일6

IniWrite, %filename11%,%filesave%.ini,파일b,파일1
IniWrite, %filename21%,%filesave%.ini,파일b,파일2
IniWrite, %filename31%,%filesave%.ini,파일b,파일3
IniWrite, %filename41%,%filesave%.ini,파일b,파일4
IniWrite, %filename51%,%filesave%.ini,파일b,파일5
IniWrite, %filename61%,%filesave%.ini,파일b,파일6

IniWrite, %filename12%,%filesave%.ini,파일c,파일1
IniWrite, %filename22%,%filesave%.ini,파일c,파일2
IniWrite, %filename32%,%filesave%.ini,파일c,파일3
IniWrite, %filename42%,%filesave%.ini,파일c,파일4
IniWrite, %filename52%,%filesave%.ini,파일c,파일5
IniWrite, %filename62%,%filesave%.ini,파일c,파일6

IniWrite, %filename13%,%filesave%.ini,파일d,파일1
IniWrite, %filename23%,%filesave%.ini,파일d,파일2
IniWrite, %filename33%,%filesave%.ini,파일d,파일3
IniWrite, %filename43%,%filesave%.ini,파일d,파일4
IniWrite, %filename53%,%filesave%.ini,파일d,파일5
IniWrite, %filename63%,%filesave%.ini,파일d,파일6

IniWrite, %filename14%,%filesave%.ini,파일e,파일1
IniWrite, %filename24%,%filesave%.ini,파일e,파일2
IniWrite, %filename34%,%filesave%.ini,파일e,파일3
IniWrite, %filename44%,%filesave%.ini,파일e,파일4
IniWrite, %filename54%,%filesave%.ini,파일e,파일5
IniWrite, %filename64%,%filesave%.ini,파일e,파일6

IniWrite, %filesave%,%filesave%.ini,이름,파일이름

Gui,2: Destroy

Progress, B1 zh0 fs18 Center , 저 장 완 료  ;옵션,글꼴두깨,텍스트
	Sleep, 250
	Progress, Off
Return

GuiClose:
ExitApp
