program=starcraft.exe





scan1:=0x00000000
;base:=0x010A0000
;base:=0x00D60000
ore:=0x8B1ED8
gas:=0x8B1F08
sight:=0x8B1FD4

testbase:=0x712B78

team1:=0x713104
team2:=0x713108
team3:=0x713110
team4:=0x713114
team5:=0x8F35C8
team6:=0x8F35F8

ReadMemory(MADDRESS) 
{
global PID
VarSetCapacity(MVALUE,4,0)
ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", PID, "UInt")
 DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Str",MVALUE,"UInt",4,"UInt *",0)
 
Loop 4 
result += *(&MVALUE + A_Index-1) << 8*(A_Index-1) 

return, result 
}

WriteMemory(MADDRESS,WVALUE) 
{ 
global PID
ProcessHandle := DllCall("OpenProcess", "int", 2035711, "char", 0, "UInt", PID, "UInt") 
DllCall("WriteProcessMemory", "UInt", ProcessHandle, "UInt", MADDRESS, "Uint*", WVALUE, "Uint", 4, "Uint *", 0) 

DllCall("CloseHandle", "int", ProcessHandle) 
return 
} 


Gui, Add, Text, x12 y9 w160 h20 v1p미네랄, 1p미네랄 : 
Gui, Add, Text, x12 y29 w160 h20 v1p가스, 1p가　스 :
Gui, Add, Text, x12 y49 w160 h20 v2p미네랄, 2p미네랄 :
Gui, Add, Text, x12 y69 w160 h20 v2p가스, 2p가　스 :
Gui, Add, Text, x12 y89 w160 h20 v3p미네랄, 3p미네랄 :
Gui, Add, Text, x12 y109 w160 h20 v3p가스, 3p가　스 :
Gui, Add, Text, x12 y129 w160 h20 v4p미네랄, 4p미네랄 :
Gui, Add, Text, x12 y149 w160 h20 v4p가스, 4p가　스 :
Gui, Add, Text, x12 y169 w160 h20 v5p미네랄, 5p미네랄 :
Gui, Add, Text, x12 y189 w160 h20 v5p가스, 5p가　스 :
Gui, Add, Text, x12 y209 w160 h20 v6p미네랄, 6p미네랄 :
Gui, Add, Text, x12 y229 w160 h20 v6p가스, 6p가　스 :
Gui, Add, Text, x12 y249 w160 h20 v7p미네랄, 7p미네랄 :
Gui, Add, Text, x12 y269 w160 h20 v7p가스, 7p가　스 :
Gui, Add, Text, x12 y289 w160 h20 v8p미네랄, 8p미네랄 :
Gui, Add, Text, x12 y309 w160 h20 v8p가스, 8p가　스 :

Gui, Add, Text, x12 y329 w160 h20 v팀,몇픽인지 알려주는곳
Gui, Add, Edit, x175 y326 w100 h18 Number v팀수정,
Gui, Add, button, x280 y326 w28 h18  gteamfix,수정


Gui, Add, button, x12 y355 w76 h28  gsightfix1,시야끊기
Gui, Add, button, x92 y355 w76 h28  gsightfix2,시야동맹



Gui, Add, Text, x2 y399 w200 h20 v상태, 스타크래프트가 실행중이 아닙니다.
Gui, Add, Text, x202 y399 w150 h20 v베이스어드레스,

Gui, Add, Edit, x175 y6 w100 h18 Number v1p미네랄수정, 
Gui, Add, Edit, x175 y26 w100 h18 Number v1p가스수정, 
Gui, Add, Edit, x175 y46 w100 h18 Number v2p미네랄수정, 
Gui, Add, Edit, x175 y66 w100 h18 Number v2p가스수정, 
Gui, Add, Edit, x175 y86 w100 h18 Number v3p미네랄수정, 
Gui, Add, Edit, x175 y106 w100 h18 Number v3p가스수정, 
Gui, Add, Edit, x175 y126 w100 h18 Number v4p미네랄수정, 
Gui, Add, Edit, x175 y146 w100 h18 Number v4p가스수정, 
Gui, Add, Edit, x175 y166 w100 h18 Number v5p미네랄수정, 
Gui, Add, Edit, x175 y186 w100 h18 Number v5p가스수정, 
Gui, Add, Edit, x175 y206 w100 h18 Number v6p미네랄수정, 
Gui, Add, Edit, x175 y226 w100 h18 Number v6p가스수정, 
Gui, Add, Edit, x175 y246 w100 h18 Number v7p미네랄수정, 
Gui, Add, Edit, x175 y266 w100 h18 Number v7p가스수정, 
Gui, Add, Edit, x175 y286 w100 h18 Number v8p미네랄수정, 
Gui, Add, Edit, x175 y306 w100 h18 Number v8p가스수정, 





Gui, Add, button, x280 y6 w28 h18  g1porefix,수정
Gui, Add, button, x280 y26 w28 h18  g1pgasfix,수정
Gui, Add, button, x280 y46 w28 h18  g2porefix,수정
Gui, Add, button, x280 y66 w28 h18  g2pgasfix,수정
Gui, Add, button, x280 y86 w28 h18  g3porefix,수정
Gui, Add, button, x280 y106 w28 h18  g3pgasfix,수정
Gui, Add, button, x280 y126 w28 h18  g4porefix,수정
Gui, Add, button, x280 y146 w28 h18  g4pgasfix,수정
Gui, Add, button, x280 y166 w28 h18  g5porefix,수정
Gui, Add, button, x280 y186 w28 h18  g5pgasfix,수정
Gui, Add, button, x280 y206 w28 h18  g6porefix,수정
Gui, Add, button, x280 y226 w28 h18  g6pgasfix,수정
Gui, Add, button, x280 y246 w28 h18  g7porefix,수정
Gui, Add, button, x280 y266 w28 h18  g7pgasfix,수정
Gui, Add, button, x280 y286 w28 h18  g8porefix,수정
Gui, Add, button, x280 y306 w28 h18  g8pgasfix,수정


Gui, Show, x581 y621 w340 h420, Starcraft Trainer



settimer,statetimer,500
sleep,500
settimer,statemonitor,100
sleep,500
settimer,basefind,10
return

guiclose:
exitapp

basefind:

if state=2
return

if state=1
{
SetFormat, IntegerFast, hex
GuiControl,,베이스어드레스,프로그램 준비중 %scan1%


testvalue1:=readmemory(scan1)
testvalue2:=readmemory(scan1+testbase)
if (testvalue1=9460301) and (testvalue2=942747185)
{
base:=scan1
GuiControl,,베이스어드레스,준비완료 %base%
;scan1:=scan1+0x10000
settimer,basefind,off
state=1
}
else
{
scan1:=scan1+0x10000
}


}

statetimer:
Process, wait, %program%, 0.5
PID= %ErrorLevel% 

if PID = 0
{ 
GuiControl,,상태, 스타크래프트가 실행중이 아닙니다.
state=0
} 

else
{
GuiControl,,상태, 스타크래프트가 실행중입니다.

state=1
}
return

statemonitor:
if state=0
{
return
}
else
{

1pore:=readmemory(base+ore)
2pore:=readmemory(base+ore+4)
3pore:=readmemory(base+ore+8)
4pore:=readmemory(base+ore+12)
5pore:=readmemory(base+ore+16)
6pore:=readmemory(base+ore+20)
7pore:=readmemory(base+ore+24)
8pore:=readmemory(base+ore+28)

1pgas:=readmemory(base+gas)
2pgas:=readmemory(base+gas+4)
3pgas:=readmemory(base+gas+8)
4pgas:=readmemory(base+gas+12)
5pgas:=readmemory(base+gas+16)
6pgas:=readmemory(base+gas+20)
7pgas:=readmemory(base+gas+24)
8pgas:=readmemory(base+gas+28)

GuiControl,,1p미네랄,1p미네랄 : %1pore%
GuiControl,,2p미네랄,2p미네랄 : %2pore%
GuiControl,,3p미네랄,3p미네랄 : %3pore%
GuiControl,,4p미네랄,4p미네랄 : %4pore%
GuiControl,,5p미네랄,5p미네랄 : %5pore%
GuiControl,,6p미네랄,6p미네랄 : %6pore%
GuiControl,,7p미네랄,7p미네랄 : %7pore%
GuiControl,,8p미네랄,8p미네랄 : %8pore%


GuiControl,,1p가스,1p가　스 : %1pgas%
GuiControl,,2p가스,2p가　스 : %2pgas%
GuiControl,,3p가스,3p가　스 : %3pgas%
GuiControl,,4p가스,4p가　스 : %4pgas%
GuiControl,,5p가스,5p가　스 : %5pgas%
GuiControl,,6p가스,6p가　스 : %6pgas%
GuiControl,,7p가스,7p가　스 : %7pgas%
GuiControl,,8p가스,8p가　스 : %8pgas%

GuiControl,,시야1,%1psight%
GuiControl,,시야2,%2psight%
GuiControl,,시야3,%3psight%
GuiControl,,시야4,%4psight%
GuiControl,,시야5,%5psight%
GuiControl,,시야6,%6psight%
GuiControl,,시야7,%7psight%
GuiControl,,시야8,%8psight%

whatteam:=readmemory(base+team6) + 1
GuiControl,,팀,현재 당신은 p%whatteam%입니다.

}
return


1porefix:
gui,Submit,nohide
if 1p미네랄수정=
return
writememory(base+ore,1p미네랄수정)
return
1pgasfix:
gui,Submit,nohide
if 1p미네랄수정=
return
writememory(base+gas,1p가스수정)
return

2porefix:
gui,Submit,nohide
if 2p미네랄수정=
return
writememory(base+ore+4,2p미네랄수정)
return
2pgasfix:
gui,Submit,nohide
if 2p가스수정=
return
writememory(base+gas+4,2p가스수정)
return

3porefix:
gui,Submit,nohide
if 3p미네랄수정=
return
writememory(base+ore+8,3p미네랄수정)
return
3pgasfix:
gui,Submit,nohide
if 3p가스수정=
return
writememory(base+gas+8,3p가스수정)
return

4porefix:
gui,Submit,nohide
if 4p미네랄수정=
return
writememory(base+ore+12,4p미네랄수정)
return
4pgasfix:
gui,Submit,nohide
if 4p가스수정=
return
writememory(base+gas+12,4p가스수정)
return

5porefix:
gui,Submit,nohide
if 5p미네랄수정=
return
writememory(base+ore+16,5p미네랄수정)
return
5pgasfix:
gui,Submit,nohide
if 5p가스수정=
return
writememory(base+gas+16,5p가스수정)
return

6porefix:
gui,Submit,nohide
if 6p미네랄수정=
return
writememory(base+ore+20,6p미네랄수정)
return
6pgasfix:
gui,Submit,nohide
if 6p가스수정=
return
writememory(base+gas+20,6p가스수정)
return

7porefix:
gui,Submit,nohide
if 7p미네랄수정=
return
writememory(base+ore+24,7p미네랄수정)
return
7pgasfix:
gui,Submit,nohide
if 7p가스수정=
return
writememory(base+gas+24,7p가스수정)
return

8porefix:
gui,Submit,nohide
if 8p미네랄수정=
return
writememory(base+ore+28,8p미네랄수정)
return
8pgasfix:
gui,Submit,nohide
if 8p가스수정=
return
writememory(base+gas+28,8p가스수정)
return

teamfix:
gui,Submit,nohide
if 팀수정=
return
writememory(base+team1,팀수정-1)
writememory(base+team2,팀수정-1)
writememory(base+team3,팀수정-1)
writememory(base+team4,팀수정-1)
writememory(base+team5,팀수정-1)
writememory(base+team6,팀수정-1)
return


sightfix1:
writememory(base+sight,0)
writememory(base+sight+4,0)
writememory(base+sight+8,0)
writememory(base+sight+12,0)
writememory(base+sight+16,0)
writememory(base+sight+20,0)
writememory(base+sight+24,0)
writememory(base+sight+28,0)
return

sightfix2:
if whatteam=1
{
writememory(base+sight,1)
writememory(base+sight+4,2+1)
writememory(base+sight+8,4+1)
writememory(base+sight+12,8+1)
writememory(base+sight+16,16+1)
writememory(base+sight+20,32+1)
writememory(base+sight+24,64+1)
writememory(base+sight+28,128+1)
}

if whatteam=2
{
writememory(base+sight,1+2)
writememory(base+sight+4,2)
writememory(base+sight+8,4+2)
writememory(base+sight+12,8+2)
writememory(base+sight+16,16+2)
writememory(base+sight+20,32+2)
writememory(base+sight+24,64+2)
writememory(base+sight+28,128+2)
}

if whatteam=3
{
writememory(base+sight,1+4)
writememory(base+sight+4,2+4)
writememory(base+sight+8,4)
writememory(base+sight+12,8+4)
writememory(base+sight+16,16+4)
writememory(base+sight+20,32+4)
writememory(base+sight+24,64+4)
writememory(base+sight+28,128+4)
}

if whatteam=4
{
writememory(base+sight,1+8)
writememory(base+sight+4,2+8)
writememory(base+sight+8,4+8)
writememory(base+sight+12,8)
writememory(base+sight+16,16+8)
writememory(base+sight+20,32+8)
writememory(base+sight+24,64+8)
writememory(base+sight+28,128+8)
}

if whatteam=5
{
writememory(base+sight,1+16)
writememory(base+sight+4,2+16)
writememory(base+sight+8,4+16)
writememory(base+sight+12,8+16)
writememory(base+sight+16,16)
writememory(base+sight+20,32+16)
writememory(base+sight+24,64+16)
writememory(base+sight+28,128+16)
}

if whatteam=6
{
writememory(base+sight,1+32)
writememory(base+sight+4,2+32)
writememory(base+sight+8,4+32)
writememory(base+sight+12,8+32)
writememory(base+sight+16,16+32)
writememory(base+sight+20,32)
writememory(base+sight+24,64+32)
writememory(base+sight+28,128+32)
}

if whatteam=7
{
writememory(base+sight,1+64)
writememory(base+sight+4,2+64)
writememory(base+sight+8,4+64)
writememory(base+sight+12,8+64)
writememory(base+sight+16,16+64)
writememory(base+sight+20,32+64)
writememory(base+sight+24,64)
writememory(base+sight+28,128+64)
}

if whatteam=8
{
writememory(base+sight,1+128)
writememory(base+sight+4,2+128)
writememory(base+sight+8,4+128)
writememory(base+sight+12,8+128)
writememory(base+sight+16,16+128)
writememory(base+sight+20,32+128)
writememory(base+sight+24,64+128)
writememory(base+sight+28,128)
}
return