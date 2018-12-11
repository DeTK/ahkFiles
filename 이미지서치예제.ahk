global movePos := 2
global xPos, yPos

Home::
Sleep, 2000
Loop {
    Loop {
        ImageSearch, getX, getY, 10, 10, A_ScreenWidth, A_ScreenHeight, *50 충돌향상제z.png
        if (ErrorLevel == 0) { ;            충돌향상제z 이미지를 찾았다면
            setPos(getX, getY) ;            setPos함수(메소드)를  호출한다.
            Click, Down, %xPos%, %yPos% ;   찾은 좌표로 이동하여 누른다.
            Sleep, 800
            MouseMove, 890, 226 ;           x890 y226 좌표로 이동한다.
            Sleep, 500
            Click, Up ;                     클릭을 뗀다.
            Sleep, 1500
            Break ;                         루프를 나간다.
        }
    }
    Loop {
        ImageSearch, getX, getY, 20, 20, A_ScreenWidth, A_ScreenHeight, *50 맥스.png
        if (ErrorLevel == 0) { ;            맥스 이미지를 찾았다면
            setPos(getX, getY) ;            setPos함수(메소드)를  호출한다.
            Click, %xPos%, %yPos% ;         찾은 좌표를 클릭한다.
            Sleep, 1500
            SendInput, {Enter Down} ;       엔터를 누른다.
            Sleep, 340
            sendinput, {Enter Up} ;         엔터를 뗀다.
            Sleep, 2000
            Break ;                         루프를 나간다.
        }
    }
    ; break ;                               루프를 나간다.
}
return

setPos(getX, getY) { ;                      함수(메소드) 매개변수로는 두개가 있다
    xPos := getX + movePos
    yPos := getY + movePos
}

End::ExitApp