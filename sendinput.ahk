F1::
VarSetCapacity( keybinput, 20, 0 )
NumPut( 0x0001, keybinput, 0, "UInt" )
NumPut( 0x57, keybinput, 4, "Short" ) 
DllCall("SendInput", "UInt", 1, "UInt", &keybinput, "Int", 20 )
return
