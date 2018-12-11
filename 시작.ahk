#NoEnv
WM_NOTIFY := 0x004E
HDS_FLAT  := 0x0200
; Create a GUI with a ListView
Gui, Margin, 20, 20
Gui, Add, ListView, w600 r20 hwndHLV Grid C0000FF NoSort, Message         |State           |Item            |TickCount
LV_ModifyCol(0, "AutoHdr")
; Get the HWND of the ListView's Header control
SendMessage, LVM_GETHEADER := 0x101F, 0, 0, , ahk_id %HLV%
HHEADER := ErrorLevel
; ----------------------------------------------------------------------------------------------------------------------
; DllCall("UxTheme.dll\SetWindowTheme", "Ptr", HHEADER, "Ptr", 0, "Str", "")     ; Win XP
; Control, Style, +0x0200, , ahk_id %HHEADER%                                    ; Win XP (HDS_FLAT = 0x0200)
; ----------------------------------------------------------------------------------------------------------------------
; Create an object containing the color for each Header control
HeaderColor := {}

HeaderColor[HHEADER] := {Color: c()} ; Note: It's BGR instead of RGB!
Gui, Show, , Color LV Header
; Register message handler for WM_NOTIFY (-> NM_CUSTOMDRAW)
OnMessage(WM_NOTIFY, "On_NM_CUSTOMDRAW")
; Redraw the Header to get the notfications for all Header items
WinSet, Redraw, , ahk_id %HHEADER%
Return
GuiClose:
GuiEscape:
ExitApp
; ======================================================================================================================
On_NM_CUSTOMDRAW(W, L, M, H) {
   Global HeaderColor
   Static NM_CUSTOMDRAW          := -12
   Static CDRF_DODEFAULT         := 0x00000000
   Static CDRF_NEWFONT           := 0x00000002
   Static CDRF_NOTIFYITEMDRAW    := 0x00000020
   Static CDRF_NOTIFYSUBITEMDRAW := 0x00000020
   Static CDDS_PREPAINT          := 0x00000001
   Static CDDS_ITEMPREPAINT      := 0x00010001
   Static CDDS_SUBITEM           := 0x00020000
   Static OHWND      := 0
   Static OMsg       := (2 * A_PtrSize)
   Static ODrawStage := OMsg + 4 + (A_PtrSize - 4)
   Static OHDC       := ODrawStage + 4 + (A_PtrSize - 4)
   Static OItemSpec  := OHDC + 16 + A_PtrSize
   Critical 1000
   ; Get sending control's HWND
   HWND := NumGet(L + 0, OHWND, "Ptr")
   ; If HeaderColor contains appropriate key ...
   If (HeaderColor.HasKey(HWND)) {
      ; If the message is NM_CUSTOMDRAW ...
      If (NumGet(L + 0, OMsg, "Int") = NM_CUSTOMDRAW) {
         ; ... do the job!
         DrawStage := NumGet(L + 0, ODrawStage, "UInt")
         ; -------------------------------------------------------------------------------------------------------------
         Item := NumGet(L + 0, OItemSpec, "Int")                                       ; for testing
         LV_Modify(LV_Add("", NM_CUSTOMDRAW, DrawStage, Item, A_TickCount), "Vis")     ; for testing
         ; -------------------------------------------------------------------------------------------------------------
         If (DrawStage = CDDS_ITEMPREPAINT) {
            HDC := NumGet(L + 0, OHDC, "Ptr")
            DllCall("Gdi32.dll\SetTextColor", "Ptr", HDC, "UInt", HeaderColor[HWND].Color)
            Return CDRF_NEWFONT
         }
         If (DrawStage = CDDS_PREPAINT) {
            Return CDRF_NOTIFYITEMDRAW
         }
         Return CDRF_DODEFAULT
      }
   }
}

c(){
Random, r, 0, ‭16777215‬
return r
}
