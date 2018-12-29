;로드
#IfWinActive Warcraft III
SetBatchLines -1

F3::
send {Enter}{vk15}-load
return

;자살
F4::
sendinput {Enter}-wktkf{Enter}
gosub sleep
return

;말티엘
F5::
sendinput {Enter}-akfxldpf{Enter}
gosub sleep
return

;스파이더
F6::
sendinput {Enter}-tmvkdlej{Enter}
gosub sleep
return

;주사위
F7::
sendinput {Enter}-wntkdnl{Enter}
gosub sleep
return

;조합
F8::
sendinput {Enter}-whgkq{Enter}
gosub sleep
return

sleep:
sleep 1

;종료
F9::
Exitapp