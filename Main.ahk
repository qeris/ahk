; GLOBAL
;-------
; VARIABLES
;----------
LNK := "C:\shortcuts"
X86 := "C:\Program Files (x86)"
ALOCAL := "C:\Users\669385\AppData\Local"
TCMD := "C:\totalcmd"
;

; LAUNCH CHROME
#w::
run, "%X86%\Google\Chrome\Application\chrome.exe"
WinActivate
return

; LAUNCH TOTAL COMMANDER
#q::
Run, "%TCMD%\TOTALCMD64.EXE"
WinActivate
return

; LAUNCH DISCORD
#d::
Run, C:\Users\669385\AppData\Local\Discord\Update.exe --processStart Discord.exe
WinActivate
return

; LAUNCH WSL
#z::
Run, "%LNK%\Ubuntu.lnk"
WinActivate
return

; LAUNCH SNIPPING TOOL
#s::
Run, "%LNK%\Snipping Tool.lnk"
WinActivate
return

; LAUNCH NOTEPAD++
>!n::
WinActivate
Run, "%X86%\Notepad++\notepad++.exe"

; SUSPEND
!+Esc::
Suspend
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