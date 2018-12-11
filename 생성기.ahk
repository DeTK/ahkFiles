#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1

try
{
    if (a_isadmin == 0)
    {
        run *runas "%a_scriptfullpath%"
        exitapp
    }
}
catch
{
    exitapp
}


useDir := "폴더이름 뽑는경로"
useFile := "파일이름 뽑는경로"
useNewDir := "폴더 생성경로"

Gui, +AlwaysOnTop ; 항상 최상위에 보이게 해준다.
Gui, Add, Edit, x16 y10 w270 h20 voDir_Edit, 파일명 뽑는경로 ; 기본 경로
Gui, Add, Progress, x15 y30 w272 h20 cgreen vMyProgress ; 프로그래스바
Gui, Add, Edit, x16 y50 w270 h20 vnDir_Edit Disabled, ; 새로운 경로
Gui, Add, CheckBox, x296 y14 w50 vfileAndFolder_Check gfileAndFolder_Check, 파일 ; 파일 또는 폴더 체크
Gui, Add, CheckBox, x350 y14 w50 vdir_Check , 경로 ; 파일 뽑기중에 경로 추가할지 안할지
Gui, Add, CheckBox, x400 y14 w60 vext_Check gext_Check, 확장자 ; 파일 뽑기중에 확장자 추가할지 안할지
Gui, Add, CheckBox, x280 y33 vcustomExt_Check gcustomExt_Check Hidden Right ; 사용자정의 확장자 체크
Gui, Add, Edit, x310 y30 w85 h18 vcustomExtName_Edit Hidden Disabled, 원하는 확장자 ; 사용자 정의 확장자 쓰는곳 예) blp|png|txt.... 이렇게 쓰면됨 물론 한개만 써도됨
Gui, Add, CheckBox, x400 y33 w60 vsort_Check, 정   렬 ; 정렬 유무 체크
Gui, Add, Button, x300 y49 w150 h22 gcreate_Button vcreate_Button, 복사 ; 생성 또는 복사 버튼
Gui, Add, Text, x15 y33 w270 vinfo_Text +center, ; 상태정보 텍스트
Gui, Show, w470 h80, 폴더 복제  및 파일명 뽑기
return

GuiClose:
ExitApp

create_Button:
Gui, Submit, NoHide ; 구이에 있는 내용을 각 구이변수에 담아준다
GuiControl, Disable, oDir_Edit ; 비활성화
GuiControl, Disable, nDir_Edit ; 비활성화
GuiControl, Disable, dir_Check ; 비활성화
GuiControl, Disable, fileAndFolder_Check ; 비활성화
GuiControl, Disable, ext_Check ; 비활성화
GuiControl, Disable, create_Button ; 비활성화
GuiControl, Disable, customExt_Check ; 비활성화
GuiControl, Disable, customExtName_Edit ; 비활성화
GuiControl, Disable, sort_Check ; 비활성화

allFiles := {} ; 모든 파일이름을 담기위한 객체
fileExtNames := {} ; 파일의 확장자를 담기위한 객체
progressbar := 1 ; 프로그래스바의 진행도를 위한 변수
tempstr := ; 클립보드에 담기전 임시 변수

Loop, %oDir_Edit%\*, 1, 1 ; 현재 폴더의  모든 서브폴더를 회귀한다
{
    allFiles[A_Index] := [A_LoopFileName, A_LoopFileLongPath] ; 순차적으로 파일의 이름과 풀경로를 객체에 담아준다.
    GuiControl,, info_Text, 리스트뽑는중 [%A_index%] ; 눈으로 보기위해
    extName_Bool = 0 ; 같은게 없으므로 0
    for i, v in fileExtNames ; 파일의 확장자리스트의 길이만큼
    {
        IfInString, v, %A_LoopFileExt% ; 파일의확장자리스트안에 현재확장자가 같은경우
        {
            extName_Bool = 1 ; 같은게 있으므로 1
            break ; 쓸모없는 반복을 중지하기위해
        }
    }
    if (extName_Bool == 0 && A_LoopFileExt != "") ; 같은게 없으면서 현재확장자가 빈값이 아닐경우에만
    {
        fileExtNames.push(A_LoopFileExt) ; 파일확장자리스트에 추가해준다.
    }
}
regExStr := "(?i)[.](" arrayToString(fileExtNames) ")$" ; 정규표현식 대소문자구별없이 .파일확장자리스트(blp|txt|tga....)
if (fileAndFolder_Check == 0 && customExt_Check == 1) ; 확장자를 추가하면서 사용자정의확장자인 경우
{
    regExStr := "(?i)[.](" customExtName_Edit ")$" ; 현재 사용자정의확장자내용을 가져와서 정규표현식을 대소문자구별없이 .(blp|txt|tga....)
}
GuiControl,, info_Text, ; 내용지우기
for i in allFiles ; 모든파일의 길이만큼
{
    FoundPos := RegExMatch(allFiles[i][1], regExStr) ; 현재 파일의이름에 .확장자가 있는경우 .확장의 위치를 FoundPos변수에 담는다 없는경우는 0
    if (fileAndFolder_Check == 1 && FoundPos == 0) ; 폴더이면서 확장자가 없는경우
    {  
        FileCreateDir, % RegExReplace(allFiles[i][2], RegExReplace(oDir_Edit, "\\", "\\"), nDir_Edit) ; 폴더를 새로운곳에 생성한다
    }
    else if (fileAndFolder_Check == 0 && FoundPos != 0) ; 파일이면서 확장자인경우
    {
        if (ext_Check == 0) ; 확장자가 체크안된경우
        {
            tempstr .= RegExReplace(allFiles[i][dir_Check + 1], regExStr, "") ; .확장자를 공백으로 바꿔준다.
        }
        else ; 확장자가 체크된경우
        {
            tempstr .= allFiles[i][dir_Check + 1] ; 전체경로
        }
        if (allfiles.Length() != i) ; 모든파일리스트길이의 마지막이 아닐때만
        {
            tempstr .= "`n" ; 개행
        }
    }
    if (Floor(allFiles.length() / 100) * progressbar == i) ; 1퍼정도 진행했을경우
    {
        progressbar++ ; 다음퍼센트를위해 1증가
        GuiControl,, MyProgress, +1 ; 프로그레스바 1%증가
    }
}
if (sort_Check == 1) ; 정렬이 체크된경우
{
    Sort, tempstr, CL \ ; 정렬을 해준다.
}
Clipboard := tempstr
SetTimer, textlabel, on
return

textlabel:
Gui, Submit, NoHide
SetTimer, textlabel, off
GuiControl,, MyProgress, -100 ; 다 됬으니까 0%로
GuiControl,, info_Text, 완               료
Sleep, 500
GuiControl, Enable, oDir_Edit ; 활성화
GuiControl, Enable, fileAndFolder_Check ; 활성화
GuiControl, Enable, create_Button ; 활성화
GuiControl,, info_Text,
if (fileAndFolder_Check == 1) ; 폴더인 경우
{
    GuiControl,Enable, nDir_Edit  ; 활성화
}
else ; 파일인 경우
{
    GuiControl, Enable, dir_Check ; 활성화
    GuiControl, Enable, ext_Check ; 활성화
    GuiControl, Enable, customExt_Check ; 활성화
    GuiControl, Enable, sort_Check ; 활성화
    if (customExt_Check == 1) ; 사용자정의확장자가 체크된 경우
    {
        GuiControl, Enable, customExtName_Edit ; 활성화
    }
}
return

fileAndFolder_Check:
Gui, Submit, NoHide
if (fileAndFolder_Check == 1) ; 폴더인 경우
{        
    GuiControl,, fileAndFolder_Check, 폴더
    GuiControl,, create_Button, 생성
    GuiControl, Disable, dir_Check ; 비활성화
    GuiControl, Disable, ext_Check ; 비활성화
    GuiControl, Enable, nDir_Edit ; 활성화
    GuiControl, Disable, customExt_Check ; 비활성화
    GuiControl, Disable, customExtName_Edit ; 비활성화
    GuiControl, Disable, sort_Check ; 비활성화
    GuiControl,, oDir_Edit, %useDir%
    GuiControl,, nDir_Edit, %useNewDir%
    useFile := oDir_Edit
}
else ; 파일인 경우
{
    useNewDir := nDir_Edit
    GuiControl,, fileAndFolder_Check, 파일
    GuiControl,, create_Button, 복사
    GuiControl, Enable, dir_Check
    GuiControl, Enable, ext_Check
    GuiControl, Enable, sort_Check
    GuiControl, Disable, nDir_Edit
    GuiControl,, oDir_Edit, %useFile%
    GuiControl,, nDir_Edit,
    useDir := oDir_Edit
    if (ext_Check == 1) ; 확장자 체크된 경우
    {
        GuiControl, Enable, customExt_Check
        if (customExt_Check == 1) ; 사용자정의 확장자 체크된 경우
        {
            GuiControl, Enable, customExtName_Edit
        }
    }
}
Return

ext_Check:
Gui, Submit, NoHide
if (ext_Check == 0) ; 확장자 체크안된 경우
{
    GuiControl, Disable, customExt_Check
    GuiControl, Hide, customExt_Check
    GuiControl, Hide, customExtName_Edit
}
else ; 확장자 체크된 경우
{
    GuiControl, Enable, customExt_Check
    GuiControl, Show, customExt_Check
    GuiControl, Show, customExtName_Edit
}
Return

customExt_Check:
Gui, Submit, NoHide
if (customExt_Check == 0) ; 사용자 정의 확장자 체크 안된 경우
{
    GuiControl, Disable, customExtName_Edit
}
else ; 사용자 정의 확장자 체크 된 경우
{
    GuiControl, Enable, customExtName_Edit
}
Return

arrayToString(array) { ; 배열을 문자열로 바꿔주는 함수(메소드)
    string :=
    for key, value in array ; 배열길이만큼
    {
        if(key != 1) ; 인덱스가 1이 아닌경우에만
        {
            string .= "|" ; |추가해준다.
        }
        string .= value ; 배열안에 값을 추가해준다.
    }
    return string ; 다추가한 문자열을 보내준다.
}