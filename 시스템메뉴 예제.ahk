/*
     __    __  __          __ __       __    __                 _       __                   
    / /_  / /_/ /_____  _ / // /____ _/ /_  / /________________(_)___  / /_ ____  _______
   / __ \/ __/ __/ __ \(_) // // __ '/ __ \/ //_/ ___/ ___/ __/ / __ \/ __// __ \/ __/ _ \
  / / / / /_/ /_/ /_/ / / // // /_/ / / / / ,< (__  ) /__/ / / / /_/ / /__/ /_/ / / / // / 
 /_/ /_/\__/\__/ .___(_) // / \__,_/_/ /_/_/|_/____/\___/_/ /_/ .___/\__(_)____/_/  \__ /  
              /_/     /_//_/                                 /_/                   (___/   
              
  Script  :  System Menu : Add custom and/or remove standard items  
  Author  :  SKAN ( arian.suresh@gmail.com ),  Created: 19-Dec-2013 
  Topic   :  http://ahkscript.org/boards/viewtopic.php?p=7630#p7630
  
*/


#SingleInstance, Off
#NoTrayIcon
SetWorkingDir %A_ScriptDir%
Menu, Tray, UseErrorLevel
Menu, Tray, Icon, inetcpl.cpl, 50
Menu, Tray, NoStandard
Menu, Tray, Add, &Show, ShowHideGUI
Menu, Tray, Add, E&xit, GuiClose
Menu, Tray, Default, &Show
Menu, Tray, Click, 1

OnMessage( 0x112, "WM_SYSCOMMAND" )

SysMenuItems=
( LTrim Comments 
  -----------------------------
  "Always On &Top",        1025
  "&Minimize to TNA",      1026
  "&ListVars",           130943 ; 130943 = 0x10000|65407 > Add 0x10000 for new menu column
  "&Help",                65411
  -----------------------------
  "&Window Spy",          65402
  "&Reload",              65400
  "&Edit",                65401
  -----------------------------
  "&Suspend Hotkeys",     65404
  "&Pause",               65403                                  
  -----------------------------
  "E&xit",                65405
)

Gui +LastFound 
hGui1 := WinExist()
hSysMenu := Menu_SetSysMenu( hGui1, SysMenuItems, "Reset" )
Menu_CheckItem( hSysMenu, 1026, False, 1 )
Gui, Show, W400 h300, Demo :: Menu_SetSysMenu()
Return

ShowHideGUI:
  Gui,  Show, % IsVis := DllCall( "IsWindowVisible", UInt,hGui1 )  ?  "Hide" : ""
  Menu, Tray, % IsVis ? "Icon" : "NoIcon"
  TrayTip,,   % IsVis ? "Windows was minimized to TNA`nClick Icon to unhide" : ""  
Return

GuiClose:
 ExitAPP

WM_SYSCOMMAND(  wParam, lParam, Msg, hWnd ) {      ; WM_SYSCOMMAND()         goo.gl/kDL6uM

 hSysMenu := Menu_SetSysMenu( hWnd )               ; Get a Handle to SYSMENU
                                                   
 If wParam in 1025,1026,65403,65404                ; Items that require checkmark toggle
    Menu_CheckItem( hSysMenu, wParam, False, -1 )  ; Toggle Checkmark

 If ( wParam >= 65400 )  {               ; One of AHK commands, so repost it as WM_COMMAND
    DllCall( "PostMessage", UInt,hWnd, UInt,0x111, UInt,wParam, UInt,0 )
    Return 0                                       
 }  

 If ( wParam = 1025 ) {
    WinSet, AlwaysOnTop, Toggle, ahk_id %hWnd%
    Return 0
 }

 SC := wParam & 0xFFF0                             ; Ignore 4 low-order bits of the wParam

 If ( SC = 0xF020 ) ; SC_MINIMIZE
    If Menu_GetState( hSysMenu, 1026, False ) {  
      SetTimer, ShowHideGUI, -1
      Return 0
    }

}


Menu_CheckItem( hMenu, ItemRef=0, ByPos=1, CheckState=1 ) {
Static MF_BYCOMMAND := 0, MF_BYPOSITION := 0x400,   MF_CHECKED := 0x8, MF_UNCHECKED := 0

  Flag    := ByPos ? MF_BYPOSITION : MF_BYCOMMAND,     
  ItemRef := ItemRef - ( ByPos ? 1 : 0 ) 
 
  Flag |= ( !CheckState     ) ? MF_UNCHECKED            ;   GetMenuState()   goo.gl/SjVKK8 
       :  (  CheckState > 0 ) ? MF_CHECKED 
       :  (  DllCall( "GetMenuState", UInt,hMenu, UInt,ItemRef, UInt,Flag ) & MF_CHECKED 
                                                             ? MF_UNCHECKED : MF_CHECKED )

Return DllCall( "CheckMenuItem", UInt,hMenu, UInt,ItemRef, UInt,Flag ) ;     goo.gl/L4FlQy
}


Menu_GetState( hMenu, ItemRef=0, ByPos=1, MF=0x8 ) {
Static MF_BYCOMMAND := 0, MF_BYPOSITION := 0x400, MF_POPUP := 0x10

  Flag    := ByPos ? MF_BYPOSITION : MF_BYCOMMAND     
  ItemRef := ItemRef - ( ByPos ? 1 : 0 ) 

  R := DllCall( "GetMenuState", UInt,hMenu, UInt,ItemRef, UInt,Flag )  ; goo.gl/PdRLR9

Return ( MF=MF_POPUP ? ( R&16 ? R>>8 : 0 ) : MF>0 ? ( R & MF = MF ) : R ) 
}


Menu_SetSysMenu( hWnd, AddItems="", Options="" ) {
Static MF_MENUBARBREAK := 0x20, MF_SEPARATOR := 0x800, MF_STRING := 0  ;     goo.gl/ggTuwF
Static SWP_Flag := 0x33 ; SWP_DRAWFRAME|SWP_NOMOVE|SWP_NOSIZE|SWP_NOACTIVATE goo.gl/sah2Dm

  InStr( Options, "Reset"  ) ? DllCall( "GetSystemMenu", UInt,hWnd, UInt,True )

  hMenu := DllCall( "GetSystemMenu", UInt,hWnd, UInt,0 )   ; GetSystemMenu() goo.gl/cfW40p
                                                           
  InStr( Options, "-Close" ) ? DllCall( "RemoveMenu", UInt,hMenu, UInt,0xF060, UInt,0 )
  InStr( Options, "-Move"  ) ? DllCall( "RemoveMenu", UInt,hMenu, UInt,0xF010, UInt,0 )   
                                                           ; RemoveMenu()    goo.gl/KzP0Yg
  Loop, Parse, AddItems,`n, `r`t%A_Space%                  
  {
    Item := A_LoopField, F1 := "", F2 := 0

    Loop, Parse, Item, CSV, %A_Space%`t 
      F%A_Index% := A_LoopField
                                                            
    DllCall( "AppendMenu", UInt, hMenu                     ; AppendMenu()    goo.gl/ggTuwF               
                         , UInt, !F2 ? MF_SEPARATOR : F2>>16 ? MF_MENUBARBREAK : MF_STRING 
                         , UInt, F2 & 0xFFFF
                         , UInt, F2 ? &F1 : F2 )                     
  }

  If InStr( Options, "Redraw"  )                           ; SetWindowPos()  goo.gl/sah2Dm
    DllCall( "SetWindowPos", UInt,hWnd, Int,0, Int,0, Int,0, Int,0, Int,0, UInt,SWP_Flag ) 

Return hMenu, DllCall( "SetLastError", UInt,DllCall( "GetMenuItemCount", UInt,hMenu ) )
} 