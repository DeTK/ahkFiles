#NoEnv ; 변수명이 환경변수인지 체크하는걸 무시, 스크립트 속도 상승과 환경변수 혼동으로 인한 버그 방지

#SingleInstance force
;#SingleInstance off


;#SingleInstance off ; #SingleInstance [force|ignore|off] 한개만,불가,여러개
#Persistent ; 핫키가 없더라도 스크립트 실행을 유지
SetBatchLines,-1 ; 라인간 딜레이를 없애서 속도 상승
ListLines, Off ; 스크립트가 최근 실행한 커맨드 표시 안함 = 스크립트 속도 상승
CoordMode, Pixel, Relative ; 픽셀 위치 기준을 상대 좌표로 정함
CoordMode Mouse, Relative ; 마우스 위치 기준을 상대 좌표로 정함
;SetTitleMatchMode, 2 ; 타이틀 매치 모드를 2로 설정 = 창 제목 이름을 일부만 맞아도 적용
;FileInstall, img\pathnclear.bmp, %A_Temp%\pathnclear.bmp, 1 ; 컴파일시 그림파일을 실행파일에 저장
#include Gdip.ahk
#include Gdip_imagesearch.ahk
;#Include 비활성매크로_클래스.ahk ;외부파일임포트
SetWorkingDir, %A_ScriptDir% ;스크립트가있는폴더가 매개체
SetFormat, float , 0.0 ;소수점첫째짜리에서 반올림처리
#KeyHistory 0 ;키로그남기기중지
Gui , +Resize   +LastFound  ;+MinSize

gui, submit, nohide


IniRead, inivar, setting.ini, "기본설정", "윈도우위치x"
윈도우위치x := inivar
IniRead, inivar, setting.ini, "기본설정", "윈도우위치Y"
윈도우위치y := inivar
IniRead, inivar, setting.ini, "기본설정", "윈도우크기x"
윈도우크기x := inivar
IniRead, inivar, setting.ini, "기본설정", "윈도우크기y"
윈도우크기y := inivar

윈도우위치Sx := "x" + 윈도우위치x
윈도우위치Sy := "y" + 윈도우위치y
윈도우크기Sx := "w" + 윈도우크기x
윈도우크기Sy := "h" + 윈도우크기y

Gui Show, % 윈도우위치Sx 윈도우위치Sy 윈도우크기Sx 윈도우크기Sy , 멀티보기



Gui Add, ComboBox, x0 y0 w70 v해상도, 200*120|250*150|300*180|350*210|400*240|450*270|500*300|550*330|600*360|650*390|700*420|750*450|800*480

IniRead, inivar, setting.ini, "기본설정", "해상도"
GuiControl, ChooseString, 해상도, %inivar%


Gui Add, Button, x75 y0 w23 h21 , S
Gui Add, Button, x100 y0 w23 h21, R
Gui Add, Button, x125 y0 w23 h21 g전체숨김, ▼
Gui Add, Button, x150 y0 w23 h21 g전체오픈, ▲

;667 413
윈도우크기x := 윈도우크기x - 18
윈도우크기y := 윈도우크기y - 30
윈도우크기Sx1 := "w" + 윈도우크기x
윈도우크기Sy1 := "h" + 윈도우크기y 
Gui Add, Tab,  x8 y20 w%윈도우크기x% h%윈도우크기y% vgui탭, 뷰|설정




Gui Tab, 뷰

;윈도우크기x := 윈도우크기x - 20
;윈도우크기y := 윈도우크기y - 40 
;Gui, Add, Picture, x18 y50 w%윈도우크기x% h%윈도우크기y% , 배경.bmp

Gui Tab, 설정
varX := 18
varX2 := 120
varY := 55
varY2 :=51
counts := 0
global guiArray := Object()

 
 
Gui Add, CheckBox, x%varX% y%varY% vgui1번윈도우체크, 1번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui1번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui2번윈도우체크, 2번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui2번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui3번윈도우체크, 3번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui3번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui4번윈도우체크, 4번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui4번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui5번윈도우체크, 5번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui5번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui6번윈도우체크, 6번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui6번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui7번윈도우체크, 7번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui7번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui8번윈도우체크, 8번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui8번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui9번윈도우체크, 9번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui9번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui10번윈도우체크, 10번윈도우 :
Gui Add, Edit, x%varX2% y%varY2% w80 vgui10번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30



varX := 218
varX2 := 320
varY := 55
varY2 :=51
counts := 10

Gui Add, CheckBox, x%varX% y%varY% vgui11번윈도우체크, 11번윈도우 : 
Gui Add, Edit, x%varX2% y%varY2% w80 vgui11번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vgui12번윈도우체크, 12번윈도우 : 
Gui Add, Edit, x%varX2% y%varY2% w80 vgui12번윈도우 Right, 윈도우명
varY := varY + 30
varY2 := varY2 + 30

Gui Add, CheckBox, x%varX% y%varY% vgui윈10 , 윈10
IniRead, inivar, setting.ini, "기본설정", "gui윈10"
GuiControl, , gui윈10 , %inivar%
global isWin10 := gui윈10

varY := varY + 30
varY2 := varY2 + 30
Gui Add, CheckBox, x%varX% y%varY% vis매크로도함께 , 매크로도함께
IniRead, inivar, setting.ini, "기본설정", "is매크로도함께"
GuiControl, , is매크로도함께 , %inivar%



varY := varY + 30
varY2 := varY2 + 30
varY := varY - 2
Gui Add, Text, x%varX% y%varY% w60 h18 , 반복시간 :
varX := varX + 65
varY := varY - 4
Gui Add, Edit, x%varX% y%varY%  w50 h18 v반복시간, 1000
varX := varX + 55
varY := varY + 5
Gui Add, Text, x%varX% y%varY% w50 h18 , (ms)
varX := varX + 55



IniRead, inivar, setting.ini, "기본설정", "반복시간"
GuiControl, , 반복시간, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui1번윈도우체크
GuiControl, , gui1번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui2번윈도우체크
GuiControl, , gui2번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui3번윈도우체크
GuiControl, , gui3번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui4번윈도우체크
GuiControl, , gui4번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui5번윈도우체크
GuiControl, , gui5번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui6번윈도우체크
GuiControl, , gui6번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui7번윈도우체크
GuiControl, , gui7번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui8번윈도우체크
GuiControl, , gui8번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui9번윈도우체크
GuiControl, , gui9번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui10번윈도우체크
GuiControl, , gui10번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui11번윈도우체크
GuiControl, , gui11번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui12번윈도우체크
GuiControl, , gui12번윈도우체크, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui1번윈도우
GuiControl, , gui1번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui2번윈도우
GuiControl, , gui2번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui3번윈도우
GuiControl, , gui3번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui4번윈도우
GuiControl, , gui4번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui5번윈도우
GuiControl, , gui5번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui6번윈도우
GuiControl, , gui6번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui7번윈도우
GuiControl, , gui7번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui8번윈도우
GuiControl, , gui8번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui9번윈도우
GuiControl, , gui9번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui10번윈도우
GuiControl, , gui10번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui11번윈도우
GuiControl, , gui11번윈도우, %inivar%
IniRead, inivar, setting.ini, "기본설정", gui12번윈도우
GuiControl, , gui12번윈도우, %inivar%

global varW := 350
global varH := 210
global isNewGUI = true

global is매크로도함께 = true


gui, submit, nohide
Gui Show,  , Window

Return

GuiEscape:
GuiClose:
gui, submit, nohide
WinGetActiveTitle, title
WinGetPos, varX , varY , varW , varH , %title%
IniWrite, %varX% , setting.ini, "기본설정", "윈도우위치x"
IniWrite, %varY% , setting.ini, "기본설정", "윈도우위치y"
IniWrite, %varW% , setting.ini, "기본설정", "윈도우크기x"
IniWrite, %varH% , setting.ini, "기본설정", "윈도우크기y"
IniWrite, %해상도%, setting.ini, "기본설정", "해상도"
IniWrite, %gui윈10%, setting.ini, "기본설정", "gui윈10"
IniWrite, %is매크로도함께%, setting.ini, "기본설정", "is매크로도함께"
IniWrite, %반복시간%, setting.ini, "기본설정", "반복시간"
IniWrite, %gui1번윈도우체크%  , setting.ini, "기본설정", gui1번윈도우체크
IniWrite, %gui1번윈도우% , setting.ini, "기본설정", gui1번윈도우   
IniWrite, %gui2번윈도우체크%  , setting.ini, "기본설정", gui2번윈도우체크
IniWrite, %gui2번윈도우% , setting.ini, "기본설정", gui2번윈도우   
IniWrite, %gui3번윈도우체크%  , setting.ini, "기본설정", gui3번윈도우체크
IniWrite, %gui3번윈도우% , setting.ini, "기본설정", gui3번윈도우   
IniWrite, %gui4번윈도우체크%  , setting.ini, "기본설정", gui4번윈도우체크
IniWrite, %gui4번윈도우% , setting.ini, "기본설정", gui4번윈도우   
IniWrite, %gui5번윈도우체크%  , setting.ini, "기본설정", gui5번윈도우체크
IniWrite, %gui5번윈도우% , setting.ini, "기본설정", gui5번윈도우   
IniWrite, %gui6번윈도우체크%  , setting.ini, "기본설정", gui6번윈도우체크
IniWrite, %gui6번윈도우% , setting.ini, "기본설정", gui6번윈도우   
IniWrite, %gui7번윈도우체크%  , setting.ini, "기본설정", gui7번윈도우체크
IniWrite, %gui7번윈도우% , setting.ini, "기본설정", gui7번윈도우   
IniWrite, %gui8번윈도우체크%  , setting.ini, "기본설정", gui8번윈도우체크
IniWrite, %gui8번윈도우% , setting.ini, "기본설정", gui8번윈도우   
IniWrite, %gui9번윈도우체크%  , setting.ini, "기본설정", gui9번윈도우체크
IniWrite, %gui9번윈도우% , setting.ini, "기본설정", gui9번윈도우   
IniWrite, %gui10번윈도우체크%  , setting.ini, "기본설정", gui10번윈도우체크
IniWrite, %gui10번윈도우% , setting.ini, "기본설정", gui10번윈도우   
IniWrite, %gui11번윈도우체크%  , setting.ini, "기본설정", gui11번윈도우체크
IniWrite, %gui11번윈도우% , setting.ini, "기본설정", gui11번윈도우   
IniWrite, %gui12번윈도우체크%  , setting.ini, "기본설정", gui12번윈도우체크
IniWrite, %gui12번윈도우% , setting.ini, "기본설정", gui12번윈도우   




    ExitApp
return

ButtonS:

gui, submit, nohide
IniRead, inivar, setting.ini, "기본설정", "gui윈10"
GuiControl, , gui윈10 , %inivar%
isWin10 := gui윈10

WinGetActiveTitle, title
WinGetPos, varX , varY , varW , varH , %title%
IniWrite, %varX% , setting.ini, "기본설정", "윈도우위치x"
IniWrite, %varY% , setting.ini, "기본설정", "윈도우위치y"
IniWrite, %varW% , setting.ini, "기본설정", "윈도우크기x"
IniWrite, %varH% , setting.ini, "기본설정", "윈도우크기y"
IniWrite, %해상도%, setting.ini, "기본설정", "해상도"
IniWrite, %gui윈10%, setting.ini, "기본설정", "gui윈10"
IniWrite, %is매크로도함께%, setting.ini, "기본설정", "is매크로도함께"
IniWrite, %반복시간%, setting.ini, "기본설정", "반복시간"
IniWrite, %gui1번윈도우체크%  , setting.ini, "기본설정", gui1번윈도우체크
IniWrite, %gui1번윈도우% , setting.ini, "기본설정", gui1번윈도우   
IniWrite, %gui2번윈도우체크%  , setting.ini, "기본설정", gui2번윈도우체크
IniWrite, %gui2번윈도우% , setting.ini, "기본설정", gui2번윈도우   
IniWrite, %gui3번윈도우체크%  , setting.ini, "기본설정", gui3번윈도우체크
IniWrite, %gui3번윈도우% , setting.ini, "기본설정", gui3번윈도우   
IniWrite, %gui4번윈도우체크%  , setting.ini, "기본설정", gui4번윈도우체크
IniWrite, %gui4번윈도우% , setting.ini, "기본설정", gui4번윈도우   
IniWrite, %gui5번윈도우체크%  , setting.ini, "기본설정", gui5번윈도우체크
IniWrite, %gui5번윈도우% , setting.ini, "기본설정", gui5번윈도우   
IniWrite, %gui6번윈도우체크%  , setting.ini, "기본설정", gui6번윈도우체크
IniWrite, %gui6번윈도우% , setting.ini, "기본설정", gui6번윈도우   
IniWrite, %gui7번윈도우체크%  , setting.ini, "기본설정", gui7번윈도우체크
IniWrite, %gui7번윈도우% , setting.ini, "기본설정", gui7번윈도우   
IniWrite, %gui8번윈도우체크%  , setting.ini, "기본설정", gui8번윈도우체크
IniWrite, %gui8번윈도우% , setting.ini, "기본설정", gui8번윈도우   
IniWrite, %gui9번윈도우체크%  , setting.ini, "기본설정", gui9번윈도우체크
IniWrite, %gui9번윈도우% , setting.ini, "기본설정", gui9번윈도우   
IniWrite, %gui10번윈도우체크%  , setting.ini, "기본설정", gui10번윈도우체크
IniWrite, %gui10번윈도우% , setting.ini, "기본설정", gui10번윈도우   
IniWrite, %gui11번윈도우체크%  , setting.ini, "기본설정", gui11번윈도우체크
IniWrite, %gui11번윈도우% , setting.ini, "기본설정", gui11번윈도우   
IniWrite, %gui12번윈도우체크%  , setting.ini, "기본설정", gui12번윈도우체크
IniWrite, %gui12번윈도우% , setting.ini, "기본설정", gui12번윈도우 

해상도설정( 해상도 )
WinGetActiveTitle, title
WinGetPos, x , y , maxX , maxY , %title%
maxX := maxX - 40
maxY := maxY - 75
Gui Tab, 뷰
initX := maxX
initY := maxY
winX := varW
winY := varH
posX := 18
posY := 45





if( isNewGUI = true){
    isNewGUI = false
    counts := 0
    Loop, 12{
        counts++
        if( gui%counts%번윈도우체크 = false ){
            continue
        }
        Gui, Add, Picture, x%posX% y%posY% w%winX% h%winY%  v스샷%counts% , 스샷%counts%.bmp
        xx := posX + 2
        yy := posY + varH - 27
        Gui Add, Button, x%xx% y%yy% w23 h23 g숨김%counts% , ▼
        xx := xx + 23 + 2
        Gui Add, Button, x%xx% y%yy% w23 h23 g오픈%counts% , ▲
        xx := xx + 23 + 2
        Gui Add, Button, x%xx% y%yy% w23 h23 g한개만오픈%counts% , ■
        
        maxY := maxY - varH - 10
        if( maxY - varH > 0 ){
            posY := posY + winY + 10
            continue
        }
        maxX := maxX - varW - 10
        if( maxX - varW > 0 ){
            posX := posX + winX + 10
            posY := 45
            maxY := initY
            continue
        }
        break
        ;maxW = maxW - varW
    }
}



Loop{
    num := 0
    hwndss := 0
    loop, 12{
        num++
        if( gui%num%번윈도우체크 = true ){
            
            hwndss := WinExist( gui%num%번윈도우 )
            스샷( hwndss , num )
            GuiControl, , 스샷%num% , 스샷%num%.bmp
            Sleep, 100
        }
    }
    Sleep, %반복시간%
}
return
    
해상도설정( 해상도 ){
if( 해상도 = "200*120" ){
    varW := 200
    varH := 120
}else if( 해상도 = "250*150" ){
    varW := 250
    varH := 150
}else if( 해상도 = "300*180" ){
    varW := 300
    varH := 180
}else if( 해상도 = "350*210" ){
    varW := 350
    varH := 210
}else if( 해상도 = "400*240" ){
    varW := 400
    varH := 240
}else if( 해상도 = "450*270" ){
    varW := 450
    varH := 270
}else if( 해상도 = "500*300" ){
    varW := 500
    varH := 300
}else if( 해상도 = "550*330" ){
    varW := 550
    varH := 330
}else if( 해상도 = "600*360" ){
    varW := 600
    varH := 360
}else if( 해상도 = "450*270" ){
    varW := 450
    varH := 270
}else if( 해상도 = "650*390" ){
    varW := 650
    varH := 390
}else if( 해상도 = "700*420" ){
    varW := 700
    varH := 420
}else if( 해상도 = "750*450" ){
    varW := 750
    varH := 450
}else if( 해상도 = "800*480" ){
    varW := 800
    varH := 480
}else{
    varW := 350
    varH := 210    
}
}

    
숨김1:
    WinMove, %gui1번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui1번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈1:
    WinMove, %gui1번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui1번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%    
    }
    hwndss := WinExist( gui1번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%    
return

숨김2:
    WinMove, %gui2번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui2번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈2:
    WinMove, %gui2번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui2번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui2번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%    
return

숨김3:
    WinMove, %gui3번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui3번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈3:
    WinMove, %gui3번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui3번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui3번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김4:
    WinMove, %gui4번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui4번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈4:
    WinMove, %gui4번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui4번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui4번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김5:
    WinMove, %gui5번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui5번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈5:
    WinMove, %gui5번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui5번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui5번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김6:
    WinMove, %gui6번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui6번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈6:
    WinMove, %gui6번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui6번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui6번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김7:
    WinMove, %gui7번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui7번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈7:
    WinMove, %gui7번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui7번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui7번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김8:
    WinMove, %gui8번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui8번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈8:
    WinMove, %gui8번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui8번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui8번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김9:
    WinMove, %gui9번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui9번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈9:
    WinMove, %gui9번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui9번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui9번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김10:
    WinMove, %gui10번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui10번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈10:
    WinMove, %gui10번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui10번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui10번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김11:
    WinMove, %gui11번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui11번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈11:
    WinMove, %gui11번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui11번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui11번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

숨김12:
    WinMove, %gui12번윈도우% , , -800 , 0
    if( is매크로도함께 = true){
        a := gui12번윈도우
        s = [ %a% ]
        WinMove, %s% , , -801 , 0
    }
return

오픈12:
    WinMove, %gui12번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui12번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%  
    }
    hwndss := WinExist( gui12번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈1:
gosub, 전체숨김
    WinMove, %gui1번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui1번윈도우% ]
        WinMove, %s% , ,0 , 520   
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui1번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈2:
gosub, 전체숨김
    WinMove, %gui2번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui2번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui2번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈3:
gosub, 전체숨김
    WinMove, %gui3번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui3번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui3번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈4:
gosub, 전체숨김
    WinMove, %gui4번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui4번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui4번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈5:
gosub, 전체숨김
    WinMove, %gui5번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui5번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui5번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈6:
gosub, 전체숨김
    WinMove, %gui6번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui6번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui6번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈7:
gosub, 전체숨김
    WinMove, %gui7번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui7번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui7번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈8:
gosub, 전체숨김
    WinMove, %gui8번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui8번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui8번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈9:
gosub, 전체숨김
    WinMove, %gui9번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui9번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui9번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈10:
gosub, 전체숨김
    WinMove, %gui10번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui10번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui10번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈11:
gosub, 전체숨김
    WinMove, %gui11번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui11번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui11번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return

한개만오픈12:
gosub, 전체숨김
    WinMove, %gui12번윈도우% , ,0 , 0
    if( is매크로도함께 = true){
        s = [ %gui12번윈도우% ]
        WinMove, %s% , ,0 , 520
        hwndss := WinExist( s )
        WinSet, AlwaysOnTop, On, ahk_id %hwndss%
        Sleep, 100
        WinSet, AlwaysOnTop, off, ahk_id %hwndss%           
    }
    hwndss := WinExist( gui12번윈도우 )
    WinSet, AlwaysOnTop, On, ahk_id %hwndss%
    Sleep, 100
    WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
return



ButtonR:
gui, submit, nohide
WinGetActiveTitle, title
WinGetPos, varX , varY , varW , varH , %title%
IniWrite, %varX% , setting.ini, "기본설정", "윈도우위치x"
IniWrite, %varY% , setting.ini, "기본설정", "윈도우위치y"
IniWrite, %varW% , setting.ini, "기본설정", "윈도우크기x"
IniWrite, %varH% , setting.ini, "기본설정", "윈도우크기y"
IniWrite, %해상도%, setting.ini, "기본설정", "해상도"
IniWrite, %gui윈10%, setting.ini, "기본설정", "gui윈10"
IniWrite, %is매크로도함께%, setting.ini, "기본설정", "is매크로도함께"
IniWrite, %반복시간%, setting.ini, "기본설정", "반복시간"
IniWrite, %gui1번윈도우체크%  , setting.ini, "기본설정", gui1번윈도우체크
IniWrite, %gui1번윈도우% , setting.ini, "기본설정", gui1번윈도우   
IniWrite, %gui2번윈도우체크%  , setting.ini, "기본설정", gui2번윈도우체크
IniWrite, %gui2번윈도우% , setting.ini, "기본설정", gui2번윈도우   
IniWrite, %gui3번윈도우체크%  , setting.ini, "기본설정", gui3번윈도우체크
IniWrite, %gui3번윈도우% , setting.ini, "기본설정", gui3번윈도우   
IniWrite, %gui4번윈도우체크%  , setting.ini, "기본설정", gui4번윈도우체크
IniWrite, %gui4번윈도우% , setting.ini, "기본설정", gui4번윈도우   
IniWrite, %gui5번윈도우체크%  , setting.ini, "기본설정", gui5번윈도우체크
IniWrite, %gui5번윈도우% , setting.ini, "기본설정", gui5번윈도우   
IniWrite, %gui6번윈도우체크%  , setting.ini, "기본설정", gui6번윈도우체크
IniWrite, %gui6번윈도우% , setting.ini, "기본설정", gui6번윈도우   
IniWrite, %gui7번윈도우체크%  , setting.ini, "기본설정", gui7번윈도우체크
IniWrite, %gui7번윈도우% , setting.ini, "기본설정", gui7번윈도우   
IniWrite, %gui8번윈도우체크%  , setting.ini, "기본설정", gui8번윈도우체크
IniWrite, %gui8번윈도우% , setting.ini, "기본설정", gui8번윈도우   
IniWrite, %gui9번윈도우체크%  , setting.ini, "기본설정", gui9번윈도우체크
IniWrite, %gui9번윈도우% , setting.ini, "기본설정", gui9번윈도우   
IniWrite, %gui10번윈도우체크%  , setting.ini, "기본설정", gui10번윈도우체크
IniWrite, %gui10번윈도우% , setting.ini, "기본설정", gui10번윈도우   
IniWrite, %gui11번윈도우체크%  , setting.ini, "기본설정", gui11번윈도우체크
IniWrite, %gui11번윈도우% , setting.ini, "기본설정", gui11번윈도우   
IniWrite, %gui12번윈도우체크%  , setting.ini, "기본설정", gui12번윈도우체크
IniWrite, %gui12번윈도우% , setting.ini, "기본설정", gui12번윈도우 
    Reload
return

전체숨김:
    num := 0
    loop, 12{
        num++
        if( gui%num%번윈도우체크 = true ){
            a := gui%num%번윈도우
            WinMove, %a% , , -800 , 0
        }
        if( is매크로도함께 = true){
            a := gui%num%번윈도우
            s = [ %a% ]
            WinMove, %s% , , -801 , 0
        }
    }
return


전체오픈:
    num := 0
    x := 0
    y := 0
    x2 := 0
    y2 := 80
    loop, 12{
        num++
        /*
        if( is매크로도함께 = true){
            a := gui%num%번윈도우
            s = [ %a% ]
            x2 := x2 + 40
            y2 := y2 + 40
            WinMove, %s% , ,%x2% , %y2%
        }
        */
        if( gui%num%번윈도우체크 = true ){
            a := gui%num%번윈도우
            WinMove, %a% , ,%x% , %y%
            x := x + 40
            y := y + 40
            hwndss := WinExist( a )
            WinSet, AlwaysOnTop, On, ahk_id %hwndss%
            Sleep, 100
            WinSet, AlwaysOnTop, off, ahk_id %hwndss%   
            
        }  
    }
return

GuiSize:
;--------------------------------------------
; 창크기에 변화가 있을 경우 같이 크기가 변할
; 오브젝트 지정
;--------------------------------------------
Anchor( "gui탭", "wh")

Return

;--------------------------------------------
; 크기 자동함수
;--------------------------------------------
Anchor(i, a = "", r = false) {
static c, cs = 12, cx = 255, cl = 0, g, gs = 8, gl = 0, gpi, gw, gh, z = 0, k = 0xffff
If z = 0
VarSetCapacity(g, gs * 99, 0), VarSetCapacity(c, cs * cx, 0), z := true
If (!WinExist("ahk_id" . i)) {
GuiControlGet, t, Hwnd, %i%
If ErrorLevel = 0
i := t
Else ControlGet, i, Hwnd, , %i%
}
VarSetCapacity(gi, 68, 0), DllCall("GetWindowInfo", "UInt", gp := DllCall("GetParent", "UInt", i), "UInt", &gi)
, giw := NumGet(gi, 28, "Int") - NumGet(gi, 20, "Int"), gih := NumGet(gi, 32, "Int") - NumGet(gi, 24, "Int")
If (gp != gpi) {
gpi := gp
Loop, %gl%
If (NumGet(g, cb := gs * (A_Index - 1)) == gp) {
gw := NumGet(g, cb + 4, "Short"), gh := NumGet(g, cb + 6, "Short"), gf := 1
Break
}
If (!gf)
NumPut(gp, g, gl), NumPut(gw := giw, g, gl + 4, "Short"), NumPut(gh := gih, g, gl + 6, "Short"), gl += gs
}
ControlGetPos, dx, dy, dw, dh, , ahk_id %i%
Loop, %cl%
If (NumGet(c, cb := cs * (A_Index - 1)) == i) {
If a =
{
cf = 1
Break
}
giw -= gw, gih -= gh, as := 1, dx := NumGet(c, cb + 4, "Short"), dy := NumGet(c, cb + 6, "Short")
, cw := dw, dw := NumGet(c, cb + 8, "Short"), ch := dh, dh := NumGet(c, cb + 10, "Short")
Loop, Parse, a, xywh
If A_Index > 1
avs := SubStr(a, as, 1), as += 1 + StrLen(A_LoopField)
, d%avs% += (InStr("yh", av) ? gih : giw) * (A_LoopField + 0 ? A_LoopField : 1)
DllCall("SetWindowPos", "UInt", i, "Int", 0, "Int", dx, "Int", dy
, "Int", InStr(a, "w") ? dw : cw, "Int", InStr(a, "h") ? dh : ch, "Int", 4)
If r != 0
DllCall("RedrawWindow", "UInt", i, "UInt", 0, "UInt", 0, "UInt", 0x0101)
Return
}
If cf != 1
cb := cl, cl += cs
bx := NumGet(gi, 48), by := NumGet(gi, 16, "Int") - NumGet(gi, 8, "Int") - gih - NumGet(gi, 52)
If cf = 1
dw -= giw - gw, dh -= gih - gh
NumPut(i, c, cb), NumPut(dx - bx, c, cb + 4, "Short"), NumPut(dy - by, c, cb + 6, "Short")
, NumPut(dw, c, cb + 8, "Short"), NumPut(dh, c, cb + 10, "Short")
Return, true
}


스샷( hwnds , num ){
	좌표1 := 0
	좌표2 := 35
	좌표3 := 800
	좌표4 := 515
	토큰 :=Gdip_Startup()
	전체이미지 :=Gdip_BitmapFromhwnd(hwnds)
	좌표3 := 좌표3 - 좌표1
	좌표4 := 좌표4 - 좌표2
	자른이미지 := Gdip_CropImage( 전체이미지 , 좌표1, 좌표2, 좌표3, 좌표4)
	전체이미지 :=Gdip_BitmapFromhwnd(hwnds)
    Gdip_SaveBitmapToFile( 자른이미지 , "스샷" num ".bmp")
    Gdip_DisposeImage( 자른이미지 )
    Gdip_DisposeImage( 전체이미지 )
	Gdip_Shutdown( 토큰 )
}


Gdip_CropImage(pBitmap, x, y, w, h){
	pBitmap2 := Gdip_CreateBitmap(w, h), G2 := Gdip_GraphicsFromImage(pBitmap2) 
	Gdip_DrawImage(G2, pBitmap, 0, 0, w, h, x, y, w, h) 
	Gdip_DeleteGraphics(G2)
	Gdip_DisposeImage(G2)
	return pBitmap2 
}










