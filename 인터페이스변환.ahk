iniread name1,save.ini,설정,이름1
iniread name2,save.ini,설정,이름2
iniread name3,save.ini,설정,이름3
iniread name4,save.ini,설정,이름4
iniread name5,save.ini,설정,이름5
iniread name6,save.ini,설정,이름6

Gui,Submit,Nohide
Gui +LastFound +AlwaysOnTop +ToolWindow  -Resize -MaximizeBox -caption
Gui, Add, Text, x0 y3 w150 h20 gbar Center , 1~6까지의 이름을 적으시오 ;바
Gui, Add, Edit, x2 y19 w150 h20  Center vname1 , %name1%
Gui, Add, Edit, x2 y39 w150 h20  Center vname2 , %name2%
Gui, Add, Edit, x2 y59 w150 h20  Center vname3 , %name3%
Gui, Add, Edit, x2 y79 w150 h20  Center vname4 , %name4%
Gui, Add, Edit, x2 y99 w150 h20  Center vname5 , %name5%
Gui, Add, Edit, x2 y119 w150 h20  Center vname6 , %name6%
Gui, Add, Button, x1 y139 w152 h20 gsave , 적 용
; Generated using SmartGUI Creator 4.0
Gui, Show, x742 y403 w154 h160 , New GUI Window
Return

save:
Gui,Submit,Nohide
iniwrite %name1%,save.ini,설정,이름1
iniwrite %name2%,save.ini,설정,이름2
iniwrite %name3%,save.ini,설정,이름3
iniwrite %name4%,save.ini,설정,이름4
iniwrite %name5%,save.ini,설정,이름5
iniwrite %name6%,save.ini,설정,이름6

Return

bar:
PostMessage, 0xa1,2,,,A
Return

Guicolse:
Exitapp