DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)

#SingleInstance Force
#Hotstring NoMousel
#KeyHistory 0
;#NoTrayIcon
#Persistent
#NoEnv

CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
BlockInput, SendAndMouse
Process, Priority,, High
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, 0, 0, play
SetBatchLines, -1
SendMode, input
ListLines, off



:*?cz:r::a 
Return
:*?cz:R::A
Return

:*?cz:s::b 
Return

:*?cz:e::c 
Return
:*?cz:E::C 
Return

:*?cz:f::d 
Return

:*?cz:a::e 
Return

:*?cz:q::f 
Return
:*?cz:Q::F 
Return

:*?cz:t::g 
Return
:*?cz:T::G 
Return

:*?cz:d::h 
Return

:*?cz:w::i
Return
:*?cz:W::I
Return

:*?cz:c::j
Return

:*?cz:z::k
Return

:*?cz:x::l
Return

:*?cz:v::m 
Return

:*?cz:g::n
Return

:*?cz:k::o
Return
:*?cz:i::p
Return
:*?cz:j::q
Return
:*?cz:u::r
Return
:*?cz:h::s
Return
:*?cz:y::t
Return
:*?cz:n::u
Return
:*?cz:b::v 
Return
:*?cz:m::w
Return
:*?cz:l::x 
Return
:*?cz:?::y 
Return
:*?cz:!::z 
Return
:*?cz:.::! 
Return
:*?cz:,::? 
Return
:*?cz:o::¡Ù
Return
:*?cz:O::¡Ú 
Return
:*?cz:p::¡Û 
Return
:*?cz:P::¡Ü 
Return
F2::
Send, ^+{Home}{Del}
Return
F1::

Send, ^+{Home}
Send, ^c

Sleep 100

StringCaseSense,on
¤¡:=Chr(12593)
¤¿:=Chr(12623)

StringReplace, Clipboard,Clipboard, a,%¤¡%,All
StringReplace, Clipboard,Clipboard, A,¤¢,All
StringReplace, Clipboard,Clipboard, b,¤¤,All
StringReplace, Clipboard,Clipboard, c,¤§,All
StringReplace, Clipboard,Clipboard, C,¤¨,All
StringReplace, Clipboard,Clipboard, d,¤©,All
StringReplace, Clipboard,Clipboard, e,¤±,All
StringReplace, Clipboard,Clipboard, f,¤²,All
StringReplace, Clipboard,Clipboard, F,¤³,All
StringReplace, Clipboard,Clipboard, g,¤µ,All
StringReplace, Clipboard,Clipboard, G,¤¶,All
StringReplace, Clipboard,Clipboard, h,¤·,All
StringReplace, Clipboard,Clipboard, i,¤¸,All
StringReplace, Clipboard,Clipboard, I,¤¹,All
StringReplace, Clipboard,Clipboard, j,¤º,All
StringReplace, Clipboard,Clipboard, k,¤»,All
StringReplace, Clipboard,Clipboard, l,¤¼,All
StringReplace, Clipboard,Clipboard, m,¤½,All
StringReplace, Clipboard,Clipboard, n,¤¾,All
StringReplace, Clipboard,Clipboard, o,%¤¿%,All
StringReplace, Clipboard,Clipboard, p,¤Á,All
StringReplace, Clipboard,Clipboard, q,¤Ã,All
StringReplace, Clipboard,Clipboard, r,¤Å,All
StringReplace, Clipboard,Clipboard, s,¤Ç,All
StringReplace, Clipboard,Clipboard, t,¤Ë,All
StringReplace, Clipboard,Clipboard, u,¤Ì,All
StringReplace, Clipboard,Clipboard, v,¤Ð,All
StringReplace, Clipboard,Clipboard, w,¤Ñ,All
StringReplace, Clipboard,Clipboard, x,¤Ó,All
StringReplace, Clipboard,Clipboard, y,?,All
StringReplace, Clipboard,Clipboard, z,!,All
StringReplace, Clipboard,Clipboard, !,.,All
StringReplace, Clipboard,Clipboard, ?,,,All
StringReplace, Clipboard,Clipboard, ¡Ù,¤À,All
StringReplace, Clipboard,Clipboard, ¡Ú,¤Â,All
StringReplace, Clipboard,Clipboard, ¡Û,¤Ä,All
StringReplace, Clipboard,Clipboard, ¡Ü,¤Æ,All

Send, %Clipboard%

Return
F5::
3:= ASC("¤¿")
Send, %3%
4:= Chr(%3%)
Send, %4%
Return