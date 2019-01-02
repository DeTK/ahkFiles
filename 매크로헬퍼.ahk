#SingleInstance force
gui, font, s12, Verdana
randcolor := randomcolor()
GUI,ADD,TEXT,x10 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x30 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x50 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x70 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x90 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x110 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x130 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x150 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x170 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x190 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x210 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x230 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x250 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x270 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x290 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x310 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x330 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x350 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x370 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x390 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x410 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x430 y5 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x450 y5 right  %randcolor%,★

gui, font, s9, 새굴림
Gui, Add, GroupBox, x6 y37 w460 h50 , 사용법
GUI,ADD,TEXT,X15 Y60 W100 H20 Cblue, F2:현재상태확인  
GUI,ADD,TEXT,X115 Y60 W150 H20 Cblue, Ctrl+I : 이미지서치  테스트
GUI,ADD,TEXT,X265 Y60 W150 H20 Cblue, Ctrl+P : 픽셀서치5 테스트
Gui, Add, GroupBox, x6 y97 w460 h100 , 실시간 정보 
GUI, ADD, TEXT,X10 Y120 W400 H75 VINFO,

GUI, ADD, GroupBox,X6 Y205 W460 H140 , 상태저장 정보 
Gui, Add, Edit, x10 y225 w430 h90 Cred -VScroll VEDIT, 


Gui, Add, GroupBox, x6 y327 w460 h70 , 이미지서치 
GUI,ADD,TEXT,X10 Y345 w400 H20 left ,사용법 : 이미지를 불러온 후 컨트롤 + I 눌러 검색한다
GUI,ADD,TEXT,X10 Y375 w70 H20 left , 이미지 파일:
GUI,ADD,EDIT,X90 Y370 w100 H20 -VScroll vimage,이미지
GUI,ADD,BUTTON,X195 Y370 w60 H20 GIMAGELOAD ,Load


Gui, Add, GroupBox, x6 y407 w460 h100 , 픽셀서치
GUI,ADD,TEXT,X10 Y425 w400 H20 left , 사용법 : 픽셀값과 검색좌표를 입력한 후 컨트롤 + P 를 눌러 검색한다.
GUI,ADD,TEXT,X10 Y450 w40 H20 left ,픽셀값:
GUI,ADD,EDIT,X50 Y445 w160 H20 -VScroll vcolor,color값
GUI,ADD,TEXT,X10 Y475 w40 H20 left ,좌표값:
GUI,ADD,EDIT,X50 Y470 w40 H20 -VScroll vx1,X1값
GUI,ADD,EDIT,X90 Y470 w40 H20 -VScroll vy1,Y1값
GUI,ADD,EDIT,X130 Y470 w40 H20 -VScroll vx2,X2값
GUI,ADD,EDIT,X170 Y470 w40 H20 -VScroll vy2,y2값

Gui, Add, GroupBox, x6 y510 w460 h40 , 서치결과
GUI,ADD,TEXT,X14 Y530 w440 H15 left vresult cred,

gui, font, s12, Verdana

randcolor := randomcolor()
GUI,ADD,TEXT,x10 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x30 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x50 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x70 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x90 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x110 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x130 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x150 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x170 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x190 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x210 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x230 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x250 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x270 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x290 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x310 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x330 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x350 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x370 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x390 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x410 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x430 y550 right  %randcolor%,★
randcolor := randomcolor()
GUI,ADD,TEXT,x450 y550 right  %randcolor%,★


gui, -Resize -MaximizeBox 
GUI,SHOW,AutoSize, Macro Helper Version 2.0.0

Loop
{
    sleep, 10
    CoordMode,Mouse,Screen
    sleep, 10
    MouseGetPos, smX,smY
    sleep, 10
    CoordMode,Mouse,Relative
    sleep, 10
    MouseGetPos,RmX,RmY
    sleep, 10
    PixelGetColor,RmC,RmX,RmY
    sleep, 10
    WinGetActiveTitle,wT
    sleep, 10
    WinGetClass,wC,%wT%
    sleep, 10
    GUICONTROL,,INFO,전체화면 : X = %smX% Y = %smY%`n활성화면 : X = %RmX% Y = %RmY%`n픽셀정보 : %RmC%`n타이틀명 : %wT% `n클래스    : %wC%
    SLEEP, 300
}
return

F2::
Clipboard =  전체화면 : X = %smX% Y = %smY%`n활성화면 : X = %RmX% Y = %RmY%`n픽셀정보 : %RmC%`n타이틀명 : %wT% `n클래스    : %wC%
GUICONTROL,,EDIT,%Clipboard%
return

f3::
Reload
return
GUICLOSE:
ExitApp

^p::
GUI,SUBMIT,NOHIDE
Loop , 10
{
    CoordMode,Mouse,Relative
    if pixsearch(color,x1,y1,x2,y2) = 0
    {
        GUICONTROL,,result, X = %x% Y = %y% 에서 %color% 발견
        mousemove, %x% , %y%
        break
    }
    else
    {
        GUICONTROL,,result,픽셀 발견 실패
    }
}
return

^I::
GUI,SUBMIT,NOHIDE
Loop , 10 
{
    CoordMode,Mouse,Relative
    ImageSearch, X, Y, 0, 0, *10 A_ScreenWidth, A_ScreenHeight,%image%
    if ErrorLevel = 2
    {
        GUICONTROL,,result,이미지 발견 실패
        RETURN
    }
    else if ErrorLevel = 1
    {
        GUICONTROL,,result,이미지 발견 실패
        RETURN
    }
    else
    {
        GuiControl,,result , X = %x% Y = %y% 에서 %iMAGE% 발견 
        mousemove, %x% , %y%
        break
    }
}
RETURN

IMAGELOAD:
FileSelectfile, OutputVar, , 이미지를 선택해주세요
if OutputVar = '' or OutputVar =
    RETURN
else
    GUICONTROL,,IMAGE,%OutputVar%

RETURN

;###################################################################################################################;
;~ FUNCTION NAME : SEARCH
;~ FUNCTION 사용이유 : 이미지서치 간결화
;~ FUNCTION 변수 :
 ;~ 1. 검색할 이미지의 이름을 확인한다.
 ;~ 2. 
 ;~ 3. 
 ;~ 4. 
;~ FUNCTION 설명 : 소스폴더 밑의 IMAGE폴더안의 이미지를 순차적으로 검색한다.
;~                이미지 저장 요령( 입장1.PNG,입장2.PNG,입장3.PNG 순으로 저장)
;~ FUNCTION 사용법 : IF SEARCH("입장") = 0 { ... }
;####################################################################################################################;
SEARCH(NAME)
{
 GLOBAL X 
 GLOBAL Y   
 ERROR=1    
 NUM = 1  

 LOOP
 {
  IFEXIST,%A_WORKINGDIR%\%NAME%%NUM%.PNG 
  IMAGESEARCH,X,Y,0,0, *10  A_SCREENWIDTH,A_SCREENHEIGHT,%A_WORKINGDIR%\%NAME%%NUM%.PNG
  ELSE
  {
  IF NUM=1               
  RETURN 1
  ELSE
  RETURN ERRORLEVEL
  }
  IF ERRORLEVEL=1     
  NUM+=1
  ELSE
  { 
  ERROR=0     
  RETURN ERRORLEVEL
  }
 }
}
RETURN

;####################################################################################################################;
;~ FUNCTION NAME : PIXSEARCH
;~ FUNCTION 사용이유 : 범위지정 픽셀서치
;~ FUNCTION 변수 :
 ;~ 1. 검색할 픽셀 색상
 ;~ 2. 시작X좌표
 ;~ 3. 시작Y좌표
 ;~ 4. 끝X좌표
 ;~ 5. 끝Y좌표
 ;~ 6.
;~ FUNCTION 설명 : 0,0부터찾으면 너무 많이나와서..
;~ FUNCTION 사용법 :IF PIXSEARCH(0XDCCE79,311,275,392,301) = 0 { ... } 
;####################################################################################################################;

PIXSEARCH(COLOR,X1,Y1,X2,Y2)
{
    GLOBAL X
    GLOBAL Y
    LOOP 
    {
        PIXELSEARCH, X, Y, X1, Y1, X2 ,Y2 , COLOR, 3, FAST
        IF ERRORLEVEL 
        {
            RETURN 1
        }
        ELSE
        {
            RETURN 0
        }
    }
}
RETURN

;####################################################################################################################;
;~ FUNCTION NAME : RANDOMCOLOR
;~ FUNCTION 사용이유 : 랜덤색상을 보여준다.
;~ FUNCTION 변수 :
 ;~ 1. 
 ;~ 2. 
 ;~ 3. 
 ;~ 4. 
;~ FUNCTION 설명 : GUI에 적용해보려고 랜덤색상 만들어봄...
;~ FUNCTION 사용법 : RANDOMCOLOR() COLOR값을 리턴한다.
;####################################################################################################################;

RANDOMCOLOR()
{
 0 = 0
 1 = 1
 2 = 2
 3 = 3
 4 = 4
 5 = 5
 6 = 6
 7 = 7
 8 = 8
 9 = 9
 10 = A
 11 = B
 12 = C
 13 = D
 14 = E
 15 = F
 Random, Code0, 0, 15
 Random, Code1, 0, 15
 Random, Code2, 0, 15
 Random, Code3, 0, 15
 Random, Code4, 0, 15
 Random, Code5, 0, 15
 Code0 := %Code0%
 Code1 := %Code1%
 Code2 := %Code2%
 Code3 := %Code3%
 Code4 := %Code4%
 Code5 := %Code5%
 Color = c%Code0%%Code1%%Code2%%Code3%%Code4%%Code5%
 return COLOR 
}
RETURN