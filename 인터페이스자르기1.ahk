#NoEnv ;�������� ȯ�溯������ üũ�ϴ°� ����, ��ũ��Ʈ �ӵ� ��°� ȯ�溯�� ȥ������ ���� ���� ����
#Singleinstance Force ;��ũ��Ʈ�� ���ÿ� �Ѱ��� ����
#Persistent ;��Ű�� ������ ��ũ��Ʈ ������ ����
SetBatchLines,-1 ;���ΰ� �����̸� ���ּ� �ӵ� ���
ListLines, Off ;��ũ��Ʈ�� �ֱ� ������ Ŀ�ǵ� ǥ�� ���� = ��ũ��Ʈ �ӵ� ���
CoordMode, Pixel, Relative ;�ȼ� ��ġ ������ ��� ��ǥ�� ����
CoordMode, Mouse, Relative ;���콺 ��ġ ������ ��� ��ǥ�� ����
SetTitleMatchMode, 2 ;Ÿ��Ʋ ��ġ ��带 2�� ���� = â ���� �̸��� �Ϻθ� �¾Ƶ� ����
F2::Pause
F1::
Sendinput ^!+s
sleep 1500
loop 3
{
	sendinput `n
	sleep 500
}
sleep 1500
Sendinput ^0
sleep 1500
mousemove 519,389  ;�޴�
mouseclick,Right
mousemove 604,635 ;���ÿ����ҷ�����
click
winwait ���� ���� �ҷ�����
mousemove 184,103 ;ä��
click
MouseMove 190,149 ;�ð�Ŀ��
click
mousemove 374,60 ;Ȯ��
click
Sendinput ^f ;�ڸ���
sleep 1500
Sendinput ^b ;������������
sleep 1000
Sendinput 6.png ;�����̸�
sleep 1000
sendinput `n
sendinput y
sendinput ^!z ;�������
sendinput ^!z ;�������
Sendinput ^0
sleep 2000
mousemove 519,389 ;�޴�
mouseclick,Right
mousemove 604,635 ;���ÿ����ҷ�����
click
winwait ���� ���� �ҷ�����
mousemove 184,103 ;ä��
click
MouseMove 187,160 ;�κ�Ŀ��
click
mousemove 374,60 ;Ȯ��
click
Sendinput ^f ;�ڸ���
sleep 1500
Sendinput ^b ;������������
sleep 1000
Sendinput 5.png ;�����̸�
sleep 1000
sendinput `n
sendinput y
sendinput ^!z ;�������
sendinput ^!z ;�������
Exitapp