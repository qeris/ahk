;-----------------------------------------------------------------;
;---------------------HOGWARTS CONFIGURATION----------------------;
;----*Errandur <https://github.com/Errandur?tab=repositories>-----;
;-----------------------------------------------------------------;

;-----------------------------------------------------------------;
;-----------------DEFAULT CONFIGURATION SETTINGS------------------;
;-----------------------------------------------------------------;
		; LAUNCH CHROME |
			#f::Run Chrome

		; LAUNCH SNIPPING TOOL |
			#s::Run SnippingTool

		; LAUNCH NOTEPAD++ |
			#!n::Run Notepad

		; CLOSE |
			^RButton::!F4
			
		; CUSTOM GOOGLE SEARCH |
			^+z::
		
		; PAUSE
			^+`::Suspend

;-----------------------------------------------------------------;
;-------------------------FUNCTION KEYS---------------------------;
;-----------------------------------------------------------------;
	; F1 - GOOGLE SEARCH |
		+F1::
			{
				Send, ^c
				Sleep 50
				Run, http://www.google.com/search?q=%clipboard%
				Return
			}
		
	; F2 - LAUNCH SNIPPINGTOOL |
		+F2::Run SnippingTool
		return
		
	; F3 - LAUNCH NOTEPAD++ |
		+F3:: Run Notepad++
		return
	
	; F4 -  |
		+F4::
		{
			InputBox, GOOGLESEARCH
			if GOOGLESEARCH <> ""
					Run https://www.google.com/search?q=%GOOGLESEARCH%
			return
		}
		
	; F5 -  |
		+F5:: ;
		return
		
	; F6 -  |
		+F6:: ;
		return
		
	; F7 -  |
		+F7:: ;
		return
		
	; F8 -  |
		+F8:: ;
		return
		
	; F9 -  |
		+F9:: ;
		return
		
	; F10 -  |
		+F10:: ;
		return
		
	; F11 -  |
		+F11:: ;
		return
		
	; F12 -  |
		+F12:: ;
		return
	
	; LAUNCH MINECRAFT CUSTOM KEYBINDS
	^+m::Run "c:\ahk\Minecraft.ahk"
	return
	
;-----------------------------------------------------------------;
;-------------------FOR TOTAL COMMANDER ONLY!---------------------;
;-----------------------------------------------------------------;
			#IfWinActive ahk_exe totalcmd.exe
			{
				; COPY |
					+RButton::F5

				; RENAME |
					^MButton::+F6

				; CLOSE |
					^RButton::!F4
			}

;--------------------------------------------------------;
;--------------------FOR CHROME ONLY!--------------------;
;--------------------------------------------------------;
		#IfWinActive ahk_exe chrome.exe
		{
			; NEW TAB |
			+RButton::^t
			return
			
			; CLOSE TAB |
			^RButton::^w
			return
			
			; NEW TAB
			+MButton::^t
			return
			
			; RETORE TAB
			^MButton::^+t
			return
		}

;-----------------------KEYS-----------------------------;
;--------------------------------------------------------;
;--------------------+ - Shift---------------------------;
;--------------------^ - Ctrl----------------------------;
;--------------------# - Windows-------------------------;
;--------------------! - Alt-----------------------------;
;--------------LBUTTON - Left Click----------------------;
;--------------RBUTTON - Right Click---------------------;
;--------------MBUTTON - Scroll Click--------------------;
;--------------WHEELUP - Scroll Up-----------------------;
;------------WHEELDOWN - Scroll Down---------------------;
;-------------CapsLock - CapsLock------------------------;
;----------------Space - Space---------------------------;
;------------------Tab - Tab-----------------------------;
;----------------Enter - Enter---------------------------;
;------------------Esc - Escape--------------------------;
;------------Backspace - Backspace-----------------------;
;-----------------LWin - Left Windows--------------------;
;-----------------RWin - Right Windows-------------------;
;-----------------LAlt - Left Alt------------------------;
;-----------------RAlt - Right Alt-----------------------;
;---------------LShift - Left Shift----------------------;
;---------------RShift - Right Shift---------------------;
;----------------LCtrl - Left Control--------------------;
;----------------RCtrl - Right Control-------------------;
;--------------------------------------------------------;