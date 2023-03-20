; Created by Asger Juul Brunshøj


;-------------------------------------------------------------------------------
;;; SEARCH STUFF ;;;
;-------------------------------------------------------------------------------
if Aleph = g%A_Space% ; Search DuckDuckGo
{
    execute_command_title = DuckDuckGo
    execute_command("https://duckduckgo.com/?q=REPLACEME")
}
else if Aleph = a%A_Space%
{
	execute_command_title = Search Anime
	execute_command("https://zoro.to/search?keyword=REPLACEME")
}
else if Aleph = ahk%A_Space% ; Search Google for AutoHotkey related stuff
{
    execute_command_title = Autohotkey Google Search
    execute_command("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Aleph = l%A_Space% ; Search Google with ImFeelingLucky
{
    execute_command_title = I'm Feeling Lucky
    execute_command("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if Aleph = m%A_Space% ; Open more than one URL
{
    execute_command_title = multiple
    execute_command("https://www.google.com/search?&q=REPLACEME")
    execute_command("https://www.bing.com/search?q=REPLACEME")
    execute_command("https://duckduckgo.com/?q=REPLACEME")
}
else if Aleph = x%A_Space% ; Search Google as Chrome Incognito
;   A note on how this works:
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    execute_command_title = Google Search as Incognito 
    execute_command("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}
else if Aleph = w%A_Space% ; Search Wikipedia
{
    execute_command_title = Search Wikipedia
    execute_command("https://en.wikipedia.org/w/index.php?search=REPLACEME")
}
else if Aleph = y%A_Space% ; Search Youtube
{
    execute_command_title = Search Youtube
    execute_command("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Aleph = t%A_Space% ; Search torrent networks
{
    execute_command_title = Sharing is caring
    execute_command("https://kickass.to/usearch/REPLACEME")
}
else if Aleph = abb%A_Space% ; Search AudiobookBay
{
	execute_command_title = Audiobook to Find
    execute_command("https://audiobookbay.li/?s=REPLACEME&cat=undefined%2Cundefined")
}
else if Aleph = tlfr ; Translate English to French
{
	execute_command_title = Translate to French
    execute_command("https://translate.google.com/?sl=en&tl=fr&text=REPLACEME%0A&op=translate")
}
else if Aleph = tljp ; Translate English to Japanese
{
	execute_command_title = Translate to Japanese
    execute_command("https://translate.google.com/?sl=en&tl=ja&text=REPLACEME%0A&op=translate")
}
else if Aleph = tlaf ; Translate English to Afrikaans
{
	execute_command_title = Translate to Afrikaans
    execute_command("https://translate.google.com/?sl=en&tl=af&text=REPLACEME%0A&op=translate")
}
else if Aleph = test
{
	gui_destroy()
	msgbox, Hi
}

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Aleph = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    execute_command_title := "/r/"
    execute_command("https://www.reddit.com/r/REPLACEME")
}
else if Aleph = face ; facebook.com
{
    gui_destroy()
    run www.facebook.com
}
else if Aleph = red ; reddit.com
{
    gui_destroy()
    run www.reddit.com
}
else if Aleph = cal ; Google Calendar
{
    gui_destroy()
    run https://www.google.com/calendar
}
else if Aleph = maps ; Google Maps focused on the Technical University of Denmark, DTU
{
    gui_destroy()
    run "https://www.google.com/maps/@55.7833964`,12.5244754`,12z"
}
else if Aleph = inbox ; Open google inbox
{
    gui_destroy()
    run chrome.exe https://inbox.google.com/u/0/
    ; run chrome.exe https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
else if Aleph = cmail
{
	gui_destroy()
	run chrome.exe https://mail.google.com/mail/u/0/#inbox?compose=new
}
else if Aleph = mes ; Opens Facebook unread messages
{
    gui_destroy()
    run https://www.facebook.com/messages?filter=unread&action=recent-messages
}
else if Aleph = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    run %ClipBoard%
}
else if Aleph = dl ; Downloads
{
    gui_destroy()
    run C:\Users\%A_Username%\Downloads
}
else if Aleph = drop ; Dropbox folder (works when it is in the default directory)
{
    gui_destroy()
    run, C:\Users\%A_Username%\Dropbox\
}
else if Aleph = obs ; Open Obsidian
{
    gui_destroy()
    run "C:\Users\Ethan.Schoultz\AppData\Local\Obsidian\Obsidian.exe"
}
else if Aleph = sp ; Launch Spotify
{
	gui_destroy()
	run spotify.exe
}
else if Aleph = gdrive
{
	gui_destroy()
	run chrome.exe "https://drive.google.com/drive/my-drive"
}
else if Aleph = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}
else if Aleph = eip
{
	gui_destroy()
	run ms-paint:
	sleep 4000
	send, ^v
}
else if Aleph = run ; Use Windows Run
{
	execute_command_title = "Run"
	execute_command("")
}

;-------------------------------------------------------------------------------
;;; HOTSTRINGS (TYPE RAW TEXT) ;;;
;-------------------------------------------------------------------------------
else if Aleph = @ ; Email address
{
    gui_destroy()
    Send, ethanschoultz@gmail.com
}
else if Aleph = name ; My name
{
    gui_destroy()
    SendRaw, Ethan Schoultz
}
else if Aleph = phone ; My phone number
{
    gui_destroy()
    SendRaw, +1(403)613-8195
}
else if Aleph = mob ; Mobie Email
{
	gui_destroy()
	SendRaw, ethan.schoultz@mobia.io
}
else if Aleph = dt ; Insert Current Date/Time
{
	gui_destroy()
	FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt
	SendInput %CurrentDateTime%
}
else if Aleph = paste ; Paste clipboard content without formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
}
; Imorted from Hotstrings.ahk
else if Aleph = --- ; Insert YML Frontmatter
{
	gui_destroy()
	Send ---{Enter 4}---{up 2}
}
;
else if Aleph = _ ; Insert HR
{
	gui_destroy()
	Send ___{Enter 3}{up 1} 
}
;
else if Aleph = # ; Insert Code Block
{
	gui_destroy()
	Send ``````{Enter 3}{up 1}
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Aleph = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
else if Aleph = hosts ; Open hosts file in Notepad
{
    gui_destroy()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
}
else if Aleph = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if Aleph = week ; Which week is it?
{
    gui_destroy()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}
else if Aleph = ? ; Tooltip with list of commands
{
    GuiControl,, Aleph, ; Clear the input box
    Gosub, gui_commandlibrary
}
else if Aleph = aot
{	
	gui_destroy()
	global _cpActiveWindowID
	WinSet, AlwaysOnTop, On, ahk_id %_cpActiveWindowID%
}
else if Aleph = naot
{	
	gui_destroy()
	global _cpActiveWindowID
	WinSet, AlwaysOnTop, Off, ahk_id %_cpActiveWindowID%
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Aleph = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if Aleph = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if Aleph = host ; Edit host script
{
    gui_destroy()
    run, notepad.exe "%A_ScriptFullPath%"
}
else if Aleph = gui ; Edit GUI
{
    gui_destroy()
    run, notepad++.exe "%A_ScriptDir%\GUI\GUI.ahk"
}
else if Aleph = user ; Edit GUI user commands
{
    gui_destroy()
    run, notepad++.exe "%A_ScriptDir%\GUI\UserCommands.ahk"
}
else if Aleph = %A_Space% ; Space
{
	gui_destroy()
    run, notepad++.exe "%A_ScriptDir%\GUI\UserCommands.ahk"
}