;#IfWinActive Warcraft III


SetDefaultMouseSpeed,0 
SetKeyDelay,-1
SetControlDelay,-1
SetBatchLines -1 
SetWinDelay,-1
SetMouseDelay,-1

Winhide

^[::Reload ;재시작
^]::Exitapp ;끄기

;##############################################



;############################################## 왕궁레이드

F3::
	sendinput `n-dhkdrndfpdlem`n 
	sleep 3000
	return

;############################################## 자살

F4::
	sendinput `n-wktkf`n
	sleep 3000
	return

;############################################## 말티엘

F5::
	loop
		{
			sendinput `n-akfxldpf`n
			sleep 3150
		}

;############################################## 스파이더

F6::
	loop
		{
			sendinput `n-tmvkdlej`n
			sleep 3000
		}

;############################################## 주사위

F7::
	sendinput `n-wntkdnl`n
	sleep 500
	return

;############################################## 조합

F8::
	sendinput `n-whgkq`n
	sleep 500
	return