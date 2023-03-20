; Surface Pro 3
; Author: Qeris
; Version 7.0
; Date: 2022-04-21
; ================ ;

; === CONFIGS === ;
#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 0
SetTitleMatchMode, 2

; TRAY ICON
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,215

; === WINDOWS SHORTCUTS === ;
; Close Window
#F1::Edit
#F2::Reload
#F3::Suspend
#F4::ExitApp
Media_Play_Pause::Suspend
#Del::FileRecycleEmpty

; Ctrl+Right-Click to Close
^RButton::Send, !{f4}

; RIGHT HAND ALT+TAB
RAlt & Shift::AltTab
RAlt & Enter::ShiftAltTab

; LAUNCH COLEMAK
RShift & Del::run, g:\my drive\documents\ahk\colemak-dh.ahk

; EDIT ;
#Esc::Run_Global_Options()
Run_Global_Options() {
	menu, Global_Options_Menu, add, 1 'Edit', Edit_Script
	menu, Global_Options_Menu, add, 2 'Reload', Reload_Script
	menu, Global_Options_Menu, add, 3 'Suspend', Suspend_Script
	menu, Global_Options_Menu, add, 0 'Exit', Exit_Script
	menu, Global_Options_Menu, show
	return
	Edit_Script:
		Edit
	return
	Reload_Script:
		Reload
	return
	Suspend_Script:
		Suspend
	return
	Exit_Script:
		ExitApp
	return
}
#End::Suspend


; === APP LAUNCHER === ;
CapsLock::Run_App_Launcher_Menu()
Run_App_Launcher_Menu() {
	menu, App_Launcher_Menu, Add, 1 Launch Chrome Launcher, Chrome_Launcher
	menu, App_Launcher_Menu, Add, 2 Launch Calculator, Launch_Calculator
	menu, App_Launcher_Menu, Add, 3 Launch Notepad++, Launch_Notepad++
	menu, App_Launcher_Menu, Add, 4 Launch Zoomit, Launch_ZoomIt
	menu, App_Launcher_Menu, Add, 5 Launch LightScreen, Launch_LighScreen
	menu, App_Launcher_Menu, Add, 9 Launch Empty Recycle Bin, Empty_Recycle_Bin
	menu, App_Launcher_Menu, Add, 0 "More Options", More_Options
	menu, App_Launcher_Menu, Show
	return
	Chrome_Launcher:
		Run_Chrome_Launcher()
	return
	Launch_Calculator:
		run calc.exe
	return
	Launch_Notepad++:
		run notepad++.exe
	return
	Launch_ZoomIt:
		run zoomit.exe
	return
	Launch_LighScreen:
		menu, lightscreenMenu, add, 1 Area, LightScreen_Area
		menu, lightscreenMenu, add, 2 Fullscreen, LightScreen_FullScreen
		menu, lightscreenMenu, add, 3 Active Window, LightScreen_Active_Window
		menu, lightscreenMenu, show
		return
		LightScreen_Area:
			send, ^!{8}
		return
		LightScreen_FullScreen:
			send, ^!{0}
		return
		LightScreen_Active_Window:
			send, ^!{9}
		return
		Empty_Recycle_Bin:
			FileRecycleEmpty
		return
		More_Options:
			MsgBox Not Implemented Yet!
			return
}

; === CHROME LAUNCHER === ;
Run_Chrome_Launcher() {
	menu, Chrome_Launcher, Add, 1 Open GMail, Open_GMail
	menu, Chrome_Launcher, Add, 2 Open Google Calendar, Open_Calendar
	menu, Chrome_Launcher, Add, 3 Open Google Drive, Open_Google_Drive
	menu, Chrome_Launcher, Add, 4 Open OneNote, Open_OneNote
	menu, Chrome_Launcher, Add, 0 "Main Menu", Main_Menu
	menu, Chrome_Launcher, Show
	return
	Open_GMail:
		run chrome.exe "https://mail.google.com/mail/u/0/#inbox"
	return
	Open_Google_Calendar:
		run chrome.exe "https://calendar.google.com/calendar/u/0/r?pli=1"
	return
	Open_Google_Drive:
		run chrome.exe "https://drive.google.com/drive/my-drive"
	return
	Open_OneNote:
		run chrome.exe "https://onenote.com/"
	return
	Main_Menu:
		Run_App_Launcher_Menu()
	return
}

; === Search_Menu === ;
; MENU
#q:: Run_Search_Menu()
Run_Search_Menu() {
	menu, Search_Menu, add, 1 Google Search, Google_Search
	menu, Search_Menu, add, 2 Duck Duck Go Search, Duck_Duck_Search
	menu, Search_Menu, add, 3 Youtube Search, YouTube_Search
	menu, Search_Menu, add, 4 Wiki Search, Wiki_Search
	menu, Search_Menu, add, 5 Audiobook Search, Audiobook_Search
	menu, Search_Menu, add, 6 Fandom Search, Fandom_Search
	menu, Search_Menu, show
	return
	; GOOGLE SEARCH
	Google_Search:
	{
		InputBox, SearchTerm, Search Google, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://www.google.com/search?q=%SearchTerm%
		}
	}
	return
	; DUCK DUCK GO SEARCH
	Duck_Duck_Search:
	{
		InputBox, SearchTerm, Search Duck Duck Go, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://duckduckgo.com/?q=%SearchTerm%
		}
	}
	return
	; YOUTUBE SEARCH
	YouTube_Search:
	{
		Inputbox, SearchTerm, Search Youtube, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				run, https://www.youtube.com/results?search_query=%SearchTerm%
		}
	}
	return
	; WIKI SEARCH
	Wiki_Search:
	{
		InputBox, SearchTerm, Search Wikipedia, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://en.wikipedia.org/w/index.php?title=Special:Search&search=%SearchTerm%
		}
	}
	return
	; AUDIOBOOK SEARCH
	Audiobook_Search:
	{
		Inputbox, Audiobook_Name, Audiobook Search, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				run, http://audiobookbay.fi/?s=%Audiobook_Name%
				run, https://thepiratebay.org/search.php?q=%Audiobook_Name%&cat=102
		}
	}
	return
	; FANDOM SEARCH
	Fandom_Search:
	{
		InputBox, SearchTerm, Search Fandom, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://www.fandom.com/?s=%SearchTerm%
		}
	}
	return
}

; === HIGHLIGHT SEARCH === ;
^+g::
{
	clipboard=
	Send, ^c
	Sleep 500
	Run, http://www.google.com/search?q=%clipboard%
}

; Macros_Menu ;
; ------ ;
; EMAIL
:*o:@es::ethanschoultz@gmail.com
; ADDRESS
:*o:@adr::292 Woodside Cir, NW, Airdrie, T4B 2M3
; SIGNATURE
:*o:@sig::Ethan Schoultz `nethanschoultz@gmail.com `n403-613-8195
; AT-MENU
:*o:@@::
; MENU
	menu, Macros_Menu, add, 1 @es, Macro_ES
	menu, Macros_Menu, add, 2 @adr, Macro_Address
	menu, Macros_Menu, add, 3 @sig, Macro_Signature
	menu, Macros_Menu, show
return
; Macro_ES
Macro_ES: 
	send, ethanschoultz@gmail.com 
return
; Macro_Address
Macro_Address: 
	send, 292 Woodside Cir, NW, Airdrie, T4B 2M3 
return
; Macro_Signature
Macro_Signature: 
	send, Ethan Schoultz `nethanschoultz@gmail.com `n403-613-8195 
return

; VOLUME CONTROL ;
; -------------- ;
#F5::
volumeControl() {
	menu, volumeControl, add, 1 Volume+, Volume_Up
	menu, volumeControl, add, 2 Volume-, Volume_Down
	menu, volumeControl, add, 3 Mute, Volume_Mute
	menu, volumeControl, show
		return
}
Volume_Up:
	SoundSet, +10
	volumeControl()
return
Volume_Down:
	SoundSet, -10
	volumeControl()
return
Volume_Mute:
	SoundSet, 0
return

; --- TESTING --- ;
; --------------- ;
SendInput_Preserve_Modifiers(input)
{
    SendInputString = %input%
    if (GetKeyState("Shift") = 1)
    {
        SendInputString = {Shift Down}%SendInputString%{Shift Up}
    }
    
    if (GetKeyState("Control") = 1)
    {
        SendInputString = {Control Down}%SendInputString%{Control Up}
    }
    
    if (GetKeyState("Alt") = 1)
    {
        SendInputString = {Alt Down}%SendInputString%
    }

    SendInput, %SendInputString%
}

~Space & h::SendInput_Preserve_Modifiers("{Left}") 
~Space & j::SendInput_Preserve_Modifiers("{Down}")
~Space & k::SendInput_Preserve_Modifiers("{Up}")
~Space & l::SendInput_Preserve_Modifiers("{Right}")

; KEYS ;
; ---- ;
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
; RCtrl - Right Control`