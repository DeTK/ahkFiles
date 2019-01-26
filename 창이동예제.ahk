OnMessage(0xa0, "클릭")

기본경로 := A_WorkingDir "\창\"
global 설정파일경로 := 기본경로 "설정.ini"
global temppos :=
IfnotExist, %기본경로%
{
    FileCreateDir, %기본경로%
}
IfnotExist, %설정파일경로%
{
    IniWrite, center, %설정파일경로%, 창위치, 가로
    IniWrite, center, %설정파일경로%, 창위치, 세로
}

IniRead, 창위치x, %설정파일경로%, 창위치, 가로
IniRead, 창위치y, %설정파일경로%, 창위치, 세로

Gui, 메인:Show, x%창위치x% y%창위치y% w200 h100, 창

Return

클릭()
{
    
    WinGetPos, 위치x, 위치y,,, A ; 현재 창의 위치
    if (temppos[1] == 위치x && temppos[2] == 위치y)
    {
        Return
    }
    temppos[1] := 위치x
    temppos[2] := 위치y
    IniWrite, %위치x%, %설정파일경로%, 창위치, 가로 ; 다음에 이위치로 생성하기위해
    IniWrite, %위치y%, %설정파일경로%, 창위치, 세로 ; 다음에 이위치로 생성하기위해
    Return
}


메인GuiClose:
ExitApp