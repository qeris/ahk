; GLOBAL
;-------
; LAUNCH CHROME
#w::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
return

; LAUNCH TOTAL COMMANDER
#q::
Run, "C:\totalcmd\TOTALCMD64.EXE"
return

; LAUNCH DISCORD
#d::
Run, "C:\Users\669385\AppData\Local\Discord\Update.exe --processStart Discord.exe"
return

; LAUNCH WSL
#z::
Run, "C:\shortcuts\Ubuntu.lnk"
return

; LAUNCH SNIPPING TOOL
#s::
Run, "C:\shortcuts\Snipping Tool.lnk"
return

; LAUNCH NOTEPAD++
>!n::
Run, "C:\Program Files (x86)\Notepad++\notepad++.exe"

; SUSPEND
Shift & End::
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