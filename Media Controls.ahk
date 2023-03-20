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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MEDIA MENU
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#Esc::
mediaControl()
{
	menu, Media, add, 1 Volume Up, mediaVolumeUp
	menu, Media, add, 2 Volume Down, mediaVolumeDown
	menu, Media, add, 3 Volume Mute, mediaVolumeMute
	menu, Media, add, 4 Media Next, mediaMediaNext
	menu, Media, add, 5 Media Previous, mediaMediaPrevious
	menu, Media, add, 6 Play/Pause, mediaPlayPause
	menu, Media, add, 0 Exit, mediaQuit
	menu, Media, show
	return
}
	
mediaVolumeUp:
	Send, {Volume_Up)
	mediaControl()
	
mediaVolumeDown:
	Send, {Volume_Down}
	mediaControl()

mediaVolumeMute:
	Send, {Volume_Mute}
	mediaControl()

mediaMediaNext:
	Send, {Media_Next}
	mediaControl()

mediaMediaPrevious:
	Send, {Media_Prev}
	mediaControl()
	
mediaPlayPause:
	Send, {Media_Play_Pause}
	mediaControl()

mediaQuit:
	return

