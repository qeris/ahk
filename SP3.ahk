;--------------------------------------------------------------------------------
; SURFACE PRO 3 CONFIGURATION
; *Errandur <https://github.com/Errandur?tab=repositories>
;--------------------------------------------------------------------------------
;
;--------------------------------------------------------------------------------
; DEFAULTS
;--------------------------------------------------------------------------------
;
; LAUNCH CHROME |
#f::Run Chrome
;-------------
;
; LAUNCH SNIPPING TOOL |
#s::Run SnippingTool
;---------------------
;
; GOOGLE SEARCH |
^+c::
{
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%clipboard%
	Return
}
;
;-----------------------------------------------

; LAUNCH NOTEPAD++ |
#!n::Run Notepad

;------------------

; CLOSE |
^RButton::
{
	Send, !{F4}
	Return
}
;-------------------

;--------------------------------------------------------------------------------
; FOR TOTAL COMMANDER ONLY!
;--------------------------------------------------------------------------------
#IfWinActive ahk_class TTOTAL_CMD
{
	; COPY |
	+LButton::
	{
		Send, {F5}
		Return
	}
	;----------

	; RENAME |
	+RButton::
	{
		Send, +{F6}
		Return
	}
	;-----------

	; CLOSE |v
	^RButton::
	{
		Send, !{F4}
		Return
	}
	;-----------
}
;
;--------------------------------------------------------------------------------
; FOR CHROME ONLY!
;--------------------------------------------------------------------------------
#IfWinActive ahk_class Chrome_WidgetWin_1
{
	; NEW TAB |
	+MButton::
	{
		Send, ^t
		Return
	}
	;-----------

	; CLOSE TAB |
	^RButton::
	{
		Send, ^w
		Return
	}
	;-----------

	; RESTORE TAB |
	+RButton::
	{
		Send, ^t
		Return
	}
	;------------

	; INCOGNITO |
	^MButton::
	{
		Send, ^+n
		Return
	}
	;----------
}

;--------------------------------------------------------------------------------
; KEYS
;--------------------------------------------------------------------------------
; + - Shift Modifier
; ^ - Ctrl Modifier
; # - Windows
; ! - Alt Modifier
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

;--------------------------------------------------------------------------------