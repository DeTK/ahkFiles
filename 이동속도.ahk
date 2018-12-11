F4::Exitapp
F3::Pause
space::

Mousemove 1345, 793
Click
sleep 100
Mousemove 1271, 729
click
Return

t::
Loop
{
;PostMessage 0x100, 83, 2031617, , Warcraft
;sleep 200
PostMessage 0x100, 84, 1310721, , Warcraft
PostMessage 0x101, 84, 1310721, , Warcraft
Click
;PostMessage 0x100, 83, 2031617, , Warcraft
;PostMessage 0x101, 83, 2031617, , Warcraft
;PostMessage 0x100, 112, 3866625, , Warcraft
;PostMessage 0x101, 112, 3866625, , Warcraft
Sendinput {F1}
sleep 30
;return

;w::
PostMessage 0x100, 87, 1114113, , Warcraft
PostMessage 0x101, 87, 1114113, , Warcraft
click
Sendinput {F1}
sleep 30
}
return