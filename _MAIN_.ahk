;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONFIG ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#NoEnv
#SingleInstance Force
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,81
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 0
SetTitleMatchMode, 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; INCLUDES ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Include %A_ScriptDir%\Hotstrings.ahk
#Include %A_ScriptDir%\Searches.ahk
#Include %A_ScriptDir%\Media Controls.ahk
;#Include %A_ScriptDir%\_includes.ahk
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SCRIPT CONTROLS ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#F1::run, notepad++.exe "%A_ScriptFullPath%"
#F2::Reload
#F3::Suspend
#F4::ExitApp
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WIN CONTROLS ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Close Window | ctrl+rbutton
^RButton::SendInput, !{F4}
;
;; Close tab if Notepad open | ctrl+rbutton
#IfWinActive ahk_exe notepad++.exe
	^RBUTTON::Send, ^w
	^+RButton::Send, !{F4}
#IfWinActive
;
; Close tab if Edge open | ctrl+rbutton
#IfWinActive ahk_exe msedge.exe
	^RBUTTON::Send, ^w
	^+RButton::Send, !{F4}
#IfWinActive
;
; Close tab if Chrome open | ctrl+rbutton
#IfWinActive ahk_exe chrome.exe
	^RBUTTON::Send, ^w
	^+RButton::Send, !{F4}
#IfWinActive
;
#Del::FileRecycleEmpty
!MButton::WinMinimize, A
;
;;; VIRTUAL DESKTOP CONTROL ;;;
!WheelDown:: Send, ^#{Right}
!WheelUp:: Send, ^#{Left}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VOLUME CONTROL ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If MouseIsOver("ahk_class Shell_TrayWnd") 
OR MouseIsOver("ahk_class Shell_SecondaryTrayWnd")
{
	WheelUp::SendInput, {Volume_Up}
	WheelDown::SendInput, {Volume_Down}
}
#If
;
!3::
{
	menu, Macros, add, 1 ethanschoultz@gmail.com, macroESPS
	menu, Macros, add, 2 ethan.schoultz@mobia.io, macroMOBPS
	menu, Macros, show
	return
}
;
:*:]pass::
{
	macroESPS:
	{
		send, {raw}|3@DM+KPnPj,jH3B
		return
	}
}
;
:*:]mpass::
{
macroMOBPS:	
	{
		send, {raw}d-dZPpd52_MjGYR*
		return
	}
}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TESTING ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HELPER FUNCTIONS ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto-Reload on save if Notepad++ open | ctrl+s
#IfWinActive ahk_exe notepad++.exe
	~^s::
		;MsgBox, ,,reloading %A_ScriptFullPath%,1
		Sleep, 200
		Reload
#IfWinActive

; MOUSEISOVER
MouseIsOver(WinTitle) 
{
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
}