#SingleInstance Force

Gui +AlwaysOnTop
Gui Add, Text,, Automatic sound profile change
Gui Add, Radio, gHookRadioHandler Checked, On
Gui Add, Radio, gHookRadioHandler X+, Off
Gui Font,, Consolas
Gui Add, Edit, HwndhLog xm w800 r30 ReadOnly -Wrap -WantReturn

ftspsActive := false

fcAddr := RegisterCallback(Func("FgCallback"))

if (!SetHook(true)) {
    GuiControl,, Off, 1
}

Gui Show


GuiClose() {
    ExitApp
}

; Dummy implementation that logs the changes to an edit control for demonstration purposes
Run_Peace_Profile(profile) {
    Println("Switched to " profile)
}

; Sets whether the foreground hook is installed
SetHook(state) {
    global fcAddr
    static hook, fgHookInstalled := false

    if (!fgHookInstalled and state) {
        ; EVENT_SYSTEM_FOREGROUND = 3, WINEVENT_OUTOFCONTEXT = 0
        hook := DllCall("SetWinEventHook", "UInt", 3, "UInt", 3, "Ptr", 0, "Ptr", fcAddr, "Int", 0, "Int", 0, "UInt", 0, "Ptr")
        if (!hook) {
            Println("Failed to set foreground hook")
            return false
        }
        Println("Set foreground hook")
        fgHookInstalled := true
    }
    else if (fgHookInstalled and !state) {
        if (!DllCall("UnhookWinEvent", "Ptr", hook)) {
            Println("Failed to unset foreground hook")
            return false
        }
        Println("Unset foreground hook")
        fgHookInstalled := false
    }

    return true
}

; Radio button handler that controls installation of the sound profile hook
HookRadioHandler() {
    state := A_GuiControl == "On"
    if (!SetHook(state)) {
        GuiControl,, % (state ? "Off" : "On"), 1
    }
}

; Foreground window change callback
FgCallback(hWinEventHook, event, hWnd, idObject, idChild, dwEventThread, dwmsEventTime) {
    global ftspsActive
    WinGet fnHWnd, ID, Fortnite

    WinGetTitle t, ahk_id %hWnd%
    Println("fg window: " t)

    if (!ftspsActive and fnHWnd = hWnd) {
        Run_Peace_Profile("Ftsps")
        ftspsActive := true
    }
    else if (ftspsActive and fnHWnd != hWnd) {
        Run_Peace_Profile("Graphic EQ")
        ftspsActive := false
    }
}

; Prints a line to the logging edit box
Println(s) {
    global hLog
    static MAX_LINES := 1000, LINE_ADJUST := 200, nLines := 0
    ; EM_SETSEL = 0xB1, EM_REPLACESEL = 0xC2, EM_LINEINDEX = 0xBB
    if (nLines = MAX_LINES) {
        ; Delete the oldest LINE_ADJUST lines
        SendMessage 0xBB, LINE_ADJUST,,, ahk_id %hLog%
        SendMessage 0xB1, 0, ErrorLevel,, ahk_id %hLog%
        SendMessage 0xC2, 0, 0,, ahk_id %hLog%
        nLines -= LINE_ADJUST
    }
    ++nLines
    ; Move to the end by selecting all and deselecting
    SendMessage 0xB1, 0, -1,, ahk_id %hLog%
    SendMessage 0xB1, -1, -1,, ahk_id %hLog%
    ; Add the line
    str := "[" A_Hour ":" A_Min "] " s "`r`n"
    SendMessage 0xC2, 0, &str,, ahk_id %hLog%
}