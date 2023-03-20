; Created by Asger Juul Brunshøj

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,8

SetCapsLockState, AlwaysOff

; #InstallKeybdHook

; Keybinds
#+h::Reload

;-------------------------------------------------------
; AUTO EXECUTE SECTION FOR INCLUDED SCRIPTS
; Scripts being included need to have their auto execute
; section in a function or subroutine which is then
; executed below.
;-------------------------------------------------------
Gosub, gui_autoexecute
;-------------------------------------------------------
; END AUTO EXECUTE SECTION
return
;-------------------------------------------------------

; Load the GUI code
#Include %A_ScriptDir%\GUI\GUI.ahk

; General settings
#Include %A_ScriptDir%\Miscellaneous\miscellaneous.ahk


;;; AUTO-RELOAD
#IfWinActive ahk_exe notepad++.exe
	~^s::
		;MsgBox, 4096,, Reloading Media Script. Please Wait, 1
		Sleep, 200
		Reload
	return
#IfWinActive