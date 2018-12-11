
;2017-02-20 23:55:27

DllCall("psapi.dll\EmptyWorkingSet", "Ptr", -1)
Process, Priority,, High
#SingleInstance Force
SetTitleMatchMode, 2 
SetBatchLines, -1
ListLines, Off
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
;VarSetCapacity
#Persistent
#KeyHistory 0
#NoEnv

;1번은 보더
;2번은 보더 누름
;3번은 보더 비활성화누름
;4번은 보더 비활성화

FileCopy, 1.blp,GlueScreen-Scrollbar-BackdropBorder.blp,1
FileCopy, 1.blp,GlueScreen-CampaignButton-BackdropBorder.blp,1
FileCopy, 1.blp,GlueScreen-Button2-BackdropBorder.blp,1
FileCopy, 1.blp,GlueScreen-Button1-TeamColorBackdropBorder.blp,1
FileCopy, 1.blp,GlueScreen-Button1-PopupBackdropBorder.blp,1
FileCopy, 1.blp,GlueScreen-Button1-BorderedBackdropBorder.blp,1
FileCopy, 1.blp,GlueScreen-Button1-BackdropBorder.blp,1

FileCopy, 2.blp,GlueScreen-CampaignButton-BackdropBorder-Down.blp,1
FileCopy, 2.blp,GlueScreen-Button2-BackdropBorder-Down.blp,1
FileCopy, 2.blp,GlueScreen-Button1-PopupBackdropBorder-Down.blp,1
FileCopy, 2.blp,GlueScreen-Button1-BorderedBackdropBorder-Down.blp,1
FileCopy, 2.blp,GlueScreen-Button1-BackdropBorder-Down2.blp,1
FileCopy, 2.blp,GlueScreen-Button1-BackdropBorder-Down.blp,1

FileCopy, 3.blp,GlueScreen-CampaignButton-BackdropBorder-DisabledDown.blp,1
FileCopy, 3.blp,GlueScreen-Button2-BackdropBorder-DisabledDown.blp,1
FileCopy, 3.blp,GlueScreen-Button1-BorderedBackdropBorder-DisabledDown.blp,1
FileCopy, 3.blp,GlueScreen-Button1-BackdropBorder-DisabledDown2.blp,1
FileCopy, 3.blp,GlueScreen-Button1-BackdropBorder-DisabledDown.blp,1

FileCopy, 4.blp,GlueScreen-CampaignButton-BackdropBorder-Disabled.blp,1
FileCopy, 4.blp,GlueScreen-Button2-BackdropBorder-Disabled.blp,1
FileCopy, 4.blp,GlueScreen-Button1-BorderedBackdropBorder-Disabled.blp,1
FileCopy, 4.blp,GlueScreen-Button1-BackdropBorder-Disabled.blp,1




