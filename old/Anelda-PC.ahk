; Name: Anelda-PC
; Author: Qeris
; Version: 2.0
; Date: 2022-05-04

; Configs
#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 0
SetTitleMatchMode, 2

; Tray Icon
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,215

; Launch Colemak
RShift & Media_Play_Pause::
RShift & Del::run, g:\my drive\documents\ahk\colemak-dh.ahk

; === WINDOWS SHORTCUTS === ;
; Close Window
#F1::Edit
Media_Play_Pause::
#F2::Reload
#F3::Suspend
Media_Stop::
#F4::ExitApp
#Del::FileRecycleEmpty
Insert::send, ^{s}
Media_Prev::
SC173::Edit

; Ctrl+Right-Click to Close
^RButton::Send, !{f4}

; Alt+Tab - Right Hand
RAlt & Shift::AltTab
RAlt & Enter::ShiftAltTab

; === EDIT === ;
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

; === Search_Menu === ;
#q:: Run_Search_Menu()
Run_Search_Menu() {
	menu, Search_Menu, add, 1 Google Search, Google_Search
	menu, Search_Menu, add, 2 Duck Duck Go Search, Duck_Duck_Search
	menu, Search_Menu, add, 3 Youtube Search, YouTube_Search
	menu, Search_Menu, add, 4 Wiki Search, Wiki_Search
	menu, Search_Menu, add, 5 Audiobook Search, Audiobook_Search
	menu, Search_Menu, add, 6 Fandom Search, Fandom_Search
	menu, Search_Menu, add, 7 Rarbg Search, Rarbg_Search
	menu, Search_Menu, show
	return
	; Google Search
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
	; Duck Duck Go Search
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
	; YouTube Search
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
	; Wiki Search
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
	; Audiobook Search
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
	; Fandom Search
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
	; Rarbg Search
	Rarbg_Search:
	{
		InputBox, SearchTerm, Search Fandom, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://rarbg.to/torrents.php?search=%SearchTerm%&category%5B%5D=54
		}
	}
	return
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
