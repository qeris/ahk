; UNIVERSAL
;---------------

;Suspend
#SingleInstance Force
Menu, Tray, Icon, C:\WINDOWS\system32\shell32.dll,215
SetKeyDelay, 0
SetTitleMatchMode, 2


; EDIT
#`::Edit
; RELOAD
^`::Reload
; SUSPEND
#Space::suspend

; WINDOWS SHORTCUTS
;---------------
; CLOSE WINDOW
^RButton::Send, !{f4}
; REFRESH WINDOW
^MButton::Send, f5

; PROGRAM SHORTCUTS
;---------------
; EMPTY RECYCLEBIN
#Del::FileRecycleEmpty

; CHROME SHORTCUTS
;---------------
; LAUNCH MAIL IN CHROME
^F1::run, chrome.exe "https://mail.google.com/mail/u/0/#inbox"
; LAUNCH CALENDAR IN CHROME
^F2::run, chrome.exe "https://calendar.google.com/calendar/u/0/r?pli=1"
; LAUNCH DRIVE IN CHROME
^F3::run, chrome.exe "https://drive.google.com/drive/my-drive"
; LAUNCH NOTION IN CHROME
^F4::run, chrome.exe "https://onenote.com/"
^F5::run, "C:\Users\Qeris\AppData\Local\Programs\Notion\Notion.exe"

; NOTEPAD++
#+n::run, "C:\Program Files\Notepad++\notepad++.exe"

; FOR CHROME'
; NEW TAB
+RButton::^t
; CLOSE TAB
^RButton::^w
; RESTORE TAB
!MButton::^+t

; MACROS
;---------------
; EMAIL
:*o:@es::ethanschoultz@gmail.com
:*o:@adr::292 Woodside Cir, NW, Airdrie, T4B 2M3
:*o:@sig::Ethan Schoultz `nethanschoultz@gmail.com `n403-613-8195

; MISC
;---------------
#WheelUp::SoundSet, +5
#WheelDown::SoundSet, -5

; HIGHLIGHT SEARCH
#q::
{
	clipboard=
	Send, ^c
	Sleep 500
	Run, http://www.google.com/search?q=%clipboard%
	Return
}

; GOOGLE SEARCH BOX
#+q::
InputBox, SearchTerm, Search Google,Search:
if not ErrorLevel
{
    if SearchTerm <> ""
        Run https://www.google.com/search?q=%SearchTerm%
} return

; AUDIOBOOK SEARCH
^+a::
Inputbox, Audiobook_Name, Audiobook Search,Search:
if not ErrorLevel
{
	if SearchTerm <> ""
		run, http://audiobookbay.fi/?s=%Audiobook_Name%
		run, https://thepiratebay.org/search.php?q=%Audiobook_Name%&cat=102
} return

; TOGGLE HIDDEN FILES
#h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
If HiddenFiles_Status = 2
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
		else
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
WinGetClass, ehClass,A
if (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA")
	send, {F5}
else, PostMessage, 0x111, 28931,,, A
return

