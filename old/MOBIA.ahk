;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MOBIA ;;;
;; Author: Ethan Schoultz ;;
; Last Modified: 3/1/2023 2:59 PM ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONFIG ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#NoEnv
#SingleInstance Force
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,81
;SendMode Input
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 0
SetTitleMatchMode, 2
;;; Includes
#Include %A_ScriptDir%\Hotstrings.ahk
#Include %A_ScriptDir%\Searches.ahk
;#Include %A_ScriptDir%\__TESTING__.ahk
;
;;; GLOBAL
#F1::run, notepad++.exe "%A_ScriptFullPath%"
;
#F2::Reload
;
#F3::Suspend
;
#F4::ExitApp
;
;;; WINDOWS SHORTCUTS
; Close Window | ctrl+rbutton
^RButton::Send, !{F4}
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
; EMPTY RECYCLE BIN | win+del
#Del::FileRecycleEmpty
;
; Minimize window | shift+mbutton
!RButton::WinMinimize, A
;
; Auto-Reload on save if Notepad++ open | ctrl+s
#IfWinActive ahk_exe notepad++.exe
{
	~^s::
		;MsgBox, Reloading Script %A_ScriptFullPath%
		;Sleep, 200
		Reload
}
#IfWinActive
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VIRTUAL DESKTOP NAVIAGATION ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!WheelUp:: send ^#{Left}
!WheelDown:: send ^#{Right}
;
#If MouseIsOver("ahk_class Shell_TrayWnd") 
OR MouseIsOver("ahk_class Shell_SecondaryTrayWnd")
{
	WheelUp::SendInput #^{Left}
	WheelDown::SendInput #^{Right}
}
; Helper function
MouseIsOver(WinTitle) 
	{
		MouseGetPos,,, Win
		return WinExist(WinTitle . " ahk_id " . Win)
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Alt-2 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!2::
	menu, Macros, add, 1 ethanschoultz@gmail, macroES
	menu, Macros, add, 2 address, macroAdr
	menu, Macros, add, 3 ethan.schoultz@mobia.io, macroMob
	menu, Macros, show
	return
	macroES:
		send, ethanschoultz@gmail.com
	return
	macroAdr:
		send, 292 Woodside Cir, NW, Airdrie, T4B 2M3
	return
	macroMob:
		send, ethan.schoultz@mobia.io
return
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KEYS																		 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; + | Shift Modifier
; ^ | Ctrl Modifier
; # | Windows
; ! | Alt Modifier
; LBUTTON | Left Click
; RBUTTON | Right Click
; MBUTTON | Scroll Click
; WHEELUP | Scroll Up
; WHEELDOWN | Scroll Down
; CapsLock | CapsLock
; Space | Space
; Tab | Tab
; Enter | Enter
; Esc | Escape
; Del | Delete
; Backspace | Backspace
; LWin | Left Windows
; RWin | Right Windows
; LAlt | Left Alt
; RAlt | Right Alt
; LShift | Left Shift
; RShift | Right Shift
; LCtrl | Left Control
; RCtrl | Right Control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;