;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONFIG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#NoEnv
#SingleInstance Force
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,138
SetKeyDelay, 0
SetTitleMatchMode, 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HOTKEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Edit in Notepad++ | win+shift+f1
+#F1::run, notepad++.exe "%A_ScriptFullPath%"
;
; Reload script | win+shift+f2
+#F2::Reload
; Suspend script | win+shift+f3
+#F3::Suspend
; Exit script | win+shift+f4
+#F4::ExitApp
;
; Helper Function
MouseIsOver(WinTitle) 
{
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
} return
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VOLUME CONTROLS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Volume Up | shift+wheelup
+WheelUp::Send {Volume_Up}
; Volume Down | shift+wheeldown
+WheelDown::Send {Volume_Down}
; Mute | shift+mbutton
+MButton::SendInput, {Volume_Mute}
; Next | ctrl+shift+wheelup
^+WheelUp::Send {Media_Next}
; Previous | ctrl+shift+wheeldown
^+WheelDown::Send {Media_Prev}
; Play/Pause | ctrl+shift+mbutton
^+MButton::Send {Media_Play_Pause}
;
; Auto-reload on save | ctrl+s
#IfWinActive ahk_exe notepad++.exe
	~^s::
		;MsgBox, ,,Reloading %A_ScriptFullPath%,1
		Sleep, 200
		Reload
	return
#IfWinActive