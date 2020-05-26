; LAUNCH CHROME
#w::
run, "c:\Users\Eri\AppData\Local\Google\Chrome\Application\chrome.exe"
return

; LAUNCH TOTAL COMMANDER
#q::
Run, "c:\totalcmd\TOTALCMD.EXE"
return

; LAUNCH WSL
#z::
Run, "c:\lnk\Ubuntu.lnk"
return

; LAUNCH SNIPPING TOOL
#s::
Run, "%windir%\system32\SnippingTool.exe"
return

; LAUNCH NOTEPAD++
#!n::
Run, "c:\Program Files (x86)\Notepad++\notepad++.exe"
return

; CLOSE
^RButton::
Send, !{F4}
return

; FOR TOTAL COMMANDER ONLY!
;--------------------------
#IfWinActive ahk_class TTOTAL_CMD
{
; COPY
+LButton::
Send, {F5}
return

; RENAME
+RButton::
Send, +{F6}
return

; CLOSE
^RButton::
Send, !{F4}
return
}

; FOR CHROME ONLY!
;-----------------
#IfWinActive ahk_class Chrome_WidgetWin_1
{
; NEW TAB
+MButton::
Send, ^t
return

; CLOSE TAB
^RButton::
Send, ^w
return

; RESTORE TAB
+RButton::
Send, ^t
return

; INCOGNITO
^MButton::
Send, ^+n
return
}

; KEYS
;-------
; LBUTTON - Left Click
; RBUTTON - Right Click
; MBUTTON - Scroll Click
; WHEELUP - Scroll Up
; WHEELDOWN - Scroll Down
; CapsLock - CapsLock
; Space - Space
; Tab - Tab
; Enter - Enter
; Esc - Escape
; Backspace - Backspace
; LWin - Left Windows
; RWin - Right Windows
; LAlt - Left Alt
; RAlt - Right Alt
; LShift - Left Shift
; RShift - Right Shift
; LCtrl - Left Control
; RCtrl - Right Control
; + - Shift Modifier
; ^ - Ctrl Modifier
; # - Windows
; ! - Alt Modifier