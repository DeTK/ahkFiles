#NoEnv ;�������� ȯ�溯������ üũ�ϴ°� ����, ��ũ��Ʈ �ӵ� ��°� ȯ�溯�� ȥ������ ���� ���� ����
#Singleinstance Force ;��ũ��Ʈ�� ���ÿ� �Ѱ��� ����
#Persistent ;��Ű�� ������ ��ũ��Ʈ ������ ����
SetBatchLines,-1 ;���ΰ� �����̸� ���ּ� �ӵ� ���
ListLines, Off ;��ũ��Ʈ�� �ֱ� ������ Ŀ�ǵ� ǥ�� ���� = ��ũ��Ʈ �ӵ� ���
CoordMode, Pixel, Relative ;�ȼ� ��ġ ������ ��� ��ǥ�� ����
CoordMode, Mouse, Relative ;���콺 ��ġ ������ ��� ��ǥ�� ����
SetTitleMatchMode, 2 ;Ÿ��Ʋ ��ġ ��带 2�� ���� = â ���� �̸��� �Ϻθ� �¾Ƶ� ����
#KeyHistory 0 
Process, Priority,, High
#Hotstring NoMouse
ret:=0
SetKeyDelay,0,0,play
Blockinput, SendAndMouse
F1::
ifwinactive,BLP??��?
	gosub,1
else
	return

;�𵥵�1��
1:
sendinput,c
sleep,300 ;�����������
sendinput,UndeadUITile01.blp
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,y
sleep,300 ;�������� ����
sendinput,100
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����

;------------------------------------------------------------------------------------

;2�����Ϻҷ�����

sendinput,o
sleep,300 ;�������� ����
sendinput,2.png
sleep,300 ;�������� ����
send,{Enter}
sleep,650

;�𵥵�2��

sendinput,c
sleep,300 ;�����������
sendinput,UndeadUITile02.blp
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,y
sleep,300 ;�������� ����
sendinput,100
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����

;------------------------------------------------------------------------------------

;3�����Ϻҷ�����
sleep,300 ;�������� ����
sendinput,o
sleep,300 ;�������� ����
sendinput,3.png
sleep,300 ;�������� ����
send,{Enter}
sleep,650


;�𵥵�3��

sendinput,c
sleep,300 ;�����������
sendinput,UndeadUITile03.blp
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,y
sleep,300 ;�������� ����
sendinput,100
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
;------------------------------------------------------------------------------------

;4�����Ϻҷ�����
sleep,300 ;�������� ����
sendinput,o
sleep,300 ;�������� ����
sendinput,4.png
sleep,300 ;�������� ����
send,{Enter}
sleep,650

;�𵥵�4��

sendinput,c
sleep,300 ;�����������
sendinput,UndeadUITile04.blp
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,y
sleep,300 ;�������� ����
sendinput,100
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
;------------------------------------------------------------------------------------

;5�����Ϻҷ�����
sleep,300 ;�������� ����
sendinput,o
sleep,300 ;�������� ����
sendinput,5.png
sleep,300 ;�������� ����
send,{Enter}
sleep,650

;�𵥵�5��

sendinput,c
sleep,300 ;�����������
sendinput,UndeadUITile-InventoryCover.blp
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,y
sleep,300 ;�������� ����
sendinput,100
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
;------------------------------------------------------------------------------------

;6�����Ϻҷ�����
sleep,300 ;�������� ����
sendinput,o
sleep,300 ;�������� ����
sendinput,6.png
sleep,300 ;�������� ����
send,{Enter}
sleep,650

;�𵥵�6��

sendinput,c
sleep,300 ;�����������
sendinput,UndeadUITile-TimeIndicatorFrame.blp
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,y
sleep,300 ;�������� ����
sendinput,100
sleep,300 ;�������� ����
sendinput,{Enter}
sleep,300 ;�������� ����
sendinput,{Enter}
exitapp
F3::
exitapp