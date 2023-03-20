; --- MOBIA --- ;

; --- CONFIG --- ;
	Suspend
	#NoEnv
	#SingleInstance Force
	Menu, Tray, Icon, C:\Windows\system32\shell32.dll,215
	SendMode Input
	SetWorkingDir %A_ScriptDir%
	SetKeyDelay, 0
	SetTitleMatchMode, 2

; --- GLOBAL --- ;

	#F1::
	#F2::Reload

; ----- WINDOWS SHORTCUTS ----- ;
;------------------------------ ;
; CLOSE WINDOW
; CTRL+R-CLICK | CLOSE WINDOW
^RButton::Send, !{f4}
; META+DEL | EMPTY RECYCLE BIN
#Del::FileRecycleEmpty
; PAUSE | SUSPEND
Pause::Suspend
; SCROLLOCK | RELOAD
ScrollLock::Reload
; CALC | EDIT
Launch_App2::Edit
#F4::ExitApp

; ----- EDIT ----- ;
; ---------------- ;
#Esc::
ScriptOptions() {
	menu, ScriptOptionsMenu, add, 1 'Edit', editScript
	menu, ScriptOptionsMenu, add, 2 'Reload', reloadScript
	menu, ScriptOptionsMenu, add, 3 'Suspend', suspendScript
	menu, ScriptOptionsMenu, add, 0 'Exit', exitScript
	menu, ScriptOptionsMenu, show
	return
	editScript:
		Edit
	return
	reloadScript:
		Reload
	return
	suspendScript:
		Suspend
	return
	exitScript:
		ExitApp
	return
}

; ----- APP LAUNCHER ----- ;
; ------------------------ ;
#`::
runAppLauncher() {
	menu, AppLauncher, Add, 1 Launch Chrome Launcher, chromeLauncher
	menu, AppLauncher, Add, 2 Launch Notepad++, launchNotepadPlusPlus
	menu, AppLauncher, Add, 3 Launch Empty Recycle Bin, emptyRecycleBin
	menu, AppLauncher, Add, 0 Script Options, scriptOptions
	menu, AppLauncher, Show
	return

	chromeLauncher:
		runChromeLauncher()
	return

	emptyRecycleBin:
		FileRecycleEmpty
	return
}

; ----- CHROME LAUNCHER ----- ;
; --------------------------- ;
runChromeLauncher() {
	menu, ChromeLauncher, Add, 1 Open GMail, openGmail
	menu, ChromeLauncher, Add, 2 Open GCal, openGcal
	menu, ChromeLauncher, Add, 3 Open GDrive, openGdrive
	menu, ChromeLauncher, Add, 4 Open OneNote, openOneNote
	menu, ChromeLauncher, Add, 0 "Main Menu", mainMenu
	menu, ChromeLauncher, Show
	return
	openGmail:
		run chrome.exe "https://mail.google.com/mail/u/0/#inbox"
	return
	openGcal:
		run chrome.exe "https://calendar.google.com/calendar/u/0/r?pli=1"
	return
	openGdrive:
		run chrome.exe "https://drive.google.com/drive/my-drive"
	return
	openOneNote:
		run chrome.exe "https://onenote.com/"
	return
	mainMenu:
		runAppLauncher()
	return
}

; ----- SEARCHES ----- ;
; -------------------- ;
; MENU
#q::
runSearchMenu() {
	menu, Searches, add, 1 Google Search, googleSearch
	menu, Searches, add, 2 Duck Duck Go Search, duckSearch
	menu, Searches, add, 3 Youtube Search, youtubeSearch
	menu, Searches, add, 4 Wiki Search, wikiSearch
	menu, Searches, add, 5 Audiobook Search, audiobookSearch
	menu, Searches, add, 6 Fandom Search, fandomSearch
	menu, Searches, add, 9 Highlight Search, highLightSearch
	menu, Searches, show
	return
	; GOOGLE SEARCH
	googleSearch:	{
		InputBox, SearchTerm, Search Google, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				Run https://www.google.com/search?q=%SearchTerm%
		}
	}
	return
	; DUCK DUCK GO SEARCH
	duckSearch:{
		InputBox, SearchTerm, Search Duck Duck Go, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				Run https://duckduckgo.com/?q=%SearchTerm%
		}
	}
	return
	; YOUTUBE SEARCH
	youtubeSearch:
	{
		Inputbox, SearchTerm, Search Youtube, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				run, https://www.youtube.com/results?search_query=%SearchTerm%
		}
	}
	return
	; WIKI SEARCH
	wikiSearch:
	{
		InputBox, SearchTerm, Search Wikipedia, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				Run https://en.wikipedia.org/w/index.php?title=Special:Search&search=%SearchTerm%
		}
	}
	return
	; AUDIOBOOK SEARCH
	audiobookSearch:
	{
		Inputbox, Audiobook_Name, Audiobook Search, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				run, http://audiobookbay.fi/?s=%Audiobook_Name%
				run, https://thepiratebay.org/search.php?q=%Audiobook_Name%&cat=102
		}
	}
	return
	; FANDOM SEARCH
	fandomSearch:
	{
		InputBox, SearchTerm, Search Fandom, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://www.fandom.com/?s=%SearchTerm%
		}
	}
	return
	
	; HIGHLIGHT SEARCH
	highLightSearch:
	{
		clipboard=
		Send, ^c
		Sleep 500
		Run, http://www.google.com/search?q=%clipboard%
	}

}

; HIGHLIGHT SEARCH ;
; ---------------- ;
^+g::
	{
		clipboard=
		Send, ^c
		Sleep 500
		Run, http://www.google.com/search?q=%clipboard%
	} return

; ----- MACROS ----- ;
; ------------------ ;
; EMAIL
:*o:@es::ethanschoultz@gmail.com
; ADDRESS
:*o:@adr::292 Woodside Cir, NW, Airdrie, T4B 2M3
; SIGNATURE
:*o:@sig::Ethan Schoultz `nethanschoultz@gmail.com `n403-613-8195
; AT-MENU
:*o:@@::
; MENU
	menu, Macros, add, 1 @es, macroES
	menu, Macros, add, 2 @adr, macroAdr
	menu, Macros, add, 3 @sig, macroSig
	menu, Macros, show
return
; macroES
macroES:
	send, ethanschoultz@gmail.com
return
; macroAdr
macroAdr:
	send, 292 Woodside Cir, NW, Airdrie, T4B 2M3
return
; macroSig
macroSig:
	send, Ethan Schoultz `nethanschoultz@gmail.com `n403-613-8195
return

; --- VOLUME CONTROL --- ;
#F3::volumeControl()
volumeControl() {
	menu, volumeControl, add, 1 Volume+, volumeUp
	menu, volumeControl, add, 2 Volume-, volumeDown
	menu, volumeControl, add, 3 Mute, volumeMute
	menu, volumeControl, show
		return
}

volumeUp:
	SoundSet, +10
	volumeControl()
return

volumeDown:
	SoundSet, -10
	volumeControl()
return

volumeMute:
	SoundSet, 0
return

; --- TESTING --- ;
AppsKey+g::{
	clipboard=
	Send, ^c
	Sleep 500
	Run, http://www.google.com/search?q=%clipboard%
}

; --- KEYS --- ;
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