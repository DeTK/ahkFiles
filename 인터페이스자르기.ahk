#NoEnv ;�������� ȯ�溯������ üũ�ϴ°� ����, ��ũ��Ʈ �ӵ� ��°� ȯ�溯�� ȥ������ ���� ���� ����
#Singleinstance Force ;��ũ��Ʈ�� ���ÿ� �Ѱ��� ����
#Persistent ;��Ű�� ������ ��ũ��Ʈ ������ ����
SetBatchLines,-1 ;���ΰ� �����̸� ���ּ� �ӵ� ���
ListLines, Off ;��ũ��Ʈ�� �ֱ� ������ Ŀ�ǵ� ǥ�� ���� = ��ũ��Ʈ �ӵ� ���
CoordMode, Pixel, Relative ;�ȼ� ��ġ ������ ��� ��ǥ�� ����
CoordMode, Mouse, Relative ;���콺 ��ġ ������ ��� ��ǥ�� ����
SetTitleMatchMode, 2 ;Ÿ��Ʋ ��ġ ��带 2�� ���� = â ���� �̸��� �Ϻθ� �¾Ƶ� ����
;WinGetActiveTitle


ime_status := % IME_CHECK("A") 
if (ime_status = "0") { 
 
} else { 
 Send, {vk15}  
} 
 
IME_CHECK(WinTitle) 
{ 
 WinGet,hWnd,ID,%WinTitle% 
 Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"") 
} 
 
Send_ImeControl(DefaultIMEWnd, wParam, lParam) 
{ 
 DetectSave := A_DetectHiddenWindows 
 DetectHiddenWindows,ON 
 SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd% 
 if (DetectSave <> A_DetectHiddenWindows) 
 DetectHiddenWindows,%DetectSave% 
 return ErrorLevel 
} 
 
ImmGetDefaultIMEWnd(hWnd) 
{ 
 return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint) 
}
F2::Pause
F1::
Sendinput ^!+s
Winwait �������� ����
Send input {Enter}
winwait ����ȭ �ٸ� �̸����� ����
Sendinput {Enter}
Winwait ���� ��ü,,0
IF ErrorLevel = 0
{
	Sendinput {Enter}
}
IF ErrorLevel = 1
{
}
Winwaitclose �������� ����
Sendinput ^0
winwait ���� ���� �ҷ�����
Winwaitclose ���� ���� �ҷ�����
Sendinput ^f ;�ڸ���
Sendinput ^b ;������������
Winwait �ٸ� �̸����� ����
sleep 200
Send in6.png ;�����̸�
sleep 200
sendinput {Enter}
sleep 200
Winwait �ٸ� �̸����� ���� Ȯ��,,0
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
}
sleep 1500
sendinput ^!z ;�������
sendinput ^!z ;�������
Sendinput ^0
Pause
Sendinput m
Winwaitclose ���� ���� �ҷ�����
Sendinput ^f ;�ڸ���
Sendinput ^b ;������������
Winwait �ٸ� �̸����� ����
sleep 200
Send in5.png ;�����̸�
sleep 200
sendinput {enter}
sleep 200
Winwait �ٸ� �̸����� ���� Ȯ��,,0
IF ErrorLevel = 0
{
	Sendinput y
}
IF ErrorLevel = 1
{
}
sleep 1500
sendinput ^!z ;�������
sendinput ^!z ;�������
Exitapp