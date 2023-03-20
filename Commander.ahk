#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,80
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------------------------
; AUTO EXECUTE
;-------------------------------------------------------------------------------
gui_autoexecute:
    ; Tomorrow Night Color Definitions:
    cBackground := "c" . "1d1f21"
    cCurrentLine := "c" . "282a2e"
    cSelection := "c" . "373b41"
    cForeground := "c" . "c5c8c6"
    cComment := "c" . "969896"
    cRed := "c" . "cc6666"
    cOrange := "c" . "de935f"
    cYellow := "c" . "f0c674"
    cGreen := "c" . "b5bd68"
    cAqua := "c" . "8abeb7"
    cBlue := "c" . "81a2be"
    cPurple := "c" . "b294bb"

    gui_control_options := "xm w220 " . cForeground . " -E0x200"
    ; -E0x200 removes border around Edit controls

    ; Initialize variable to keep track of the state of the GUI
    gui_state = closed

    ; Initialize search_urls as a variable set to zero
    search_urls := 0
    return

;-------------------------------------------------------------------------------
; LAUNCH GUI
;-------------------------------------------------------------------------------
CapsLock & Space::
gui_spawn:
    if gui_state != closed
    {
        ; If the GUI is already open, close it.
        gui_destroy()
        return
    }

    gui_state = main

    Gui, Margin, 16, 16
    Gui, Color, white, white
	;1d1f21, 282a2e
    Gui, +AlwaysOnTop -SysMenu +ToolWindow -caption +Border
    Gui, Font, s11, Segoe UI
    Gui, Add, Text, %gui_control_options% vgui_main_title, Slickrun PE
    Gui, Font, s10, Segoe UI
    Gui, Add, Edit, %gui_control_options% vAleph gFindus
    Gui, Show,, myGUI
    return

;-------------------------------------------------------------------------------
; GUI FUNCTIONS AND SUBROUTINES
;-------------------------------------------------------------------------------
; Automatically triggered on Escape key:
GuiEscape:
    gui_destroy()
    return

; The callback function when the text changes in the input field.
Findus:
    Gui, Submit, NoHide
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
    execute_command("https://duckduckgo.com/?q=!gREPLACEME&t=h_&ia=web")
	;execute_command("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
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
else if Aleph = ter ; Search Terraria Wiki
{
	execute_command_title := "Search Terraria Wiki"
	execute_command("https://terraria.fandom.com/wiki/Special:Search?query=REPLACEME&scope=internal&navigationSearch=true")
}
else if Aleph = keep ; Launch Google Keep
{
	gui_destroy()
	run chrome.exe https://keep.google.com
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
else if Aleph = hotstrings ; Edit GUI user commands
{
    gui_destroy()
    run, notepad++.exe "%A_ScriptDir%\Hotstrings.ahk"
}
else if Aleph = %A_Space% ; Space
{
	gui_destroy()
    run, notepad++.exe "%A_ScriptFullPath%"
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    return

;
; gui_destroy: Destroy the GUI after use.
;
#WinActivateForce
gui_destroy() {
    global gui_state
    global execute_command_title

    gui_state = closed
    ; Forget search title variable so the next search does not re-use it
    ; in case the next search does not set its own:
    execute_command_title =

    ; Clear the tooltip
    Gosub, gui_tooltip_clear

    ; Hide GUI
    Gui, Destroy

    ; Bring focus back to another window found on the desktop
    WinActivate
}

gui_change_title(message,color = "") {
    ; If parameter color is omitted, the message is assumed to be an error
    ; message, and given the color red.
    If color =
    {
        global cRed
        color := cRed
    }
    GuiControl,, gui_main_title, %message%
    Gui, Font, s11 %color%
    GuiControl, Font, gui_main_title
    Gui, Font, s10 cffffff ; reset
}

;-------------------------------------------------------------------------------
; SEARCH ENGINES
;-------------------------------------------------------------------------------
;
; execute_command_add_elements: Add GUI controls to allow typing of a search query.
;
execute_command_add_elements:
    Gui, Add, Text, %gui_control_options% %cYellow%, %execute_command_title%
    Gui, Add, Edit, %gui_control_options% %cYellow% vexecute_commandEdit -WantReturn
    Gui, Add, Button, x-10 y-10 w1 h1 +default gexecute_commandEnter ; hidden button
    GuiControl, Disable, Aleph
    Gui, Show, AutoSize
    return

execute_command(url) {
    global
    if gui_state != search
    {
        gui_state = search
        ; if gui_state is "main", then we are coming from the main window and
        ; GUI elements for the search field have not yet been added.
        Gosub, execute_command_add_elements
    }

    ; Assign the url to a variable.
    ; The variables will have names search_url1, search_url2, ...

    search_urls := search_urls + 1
    search_url%search_urls% := url
}

execute_commandEnter:
    Gui, Submit
    gui_destroy()
    query_safe := uriEncode(execute_commandEdit)
    Loop, %search_urls%
    {
        StringReplace, search_final_url, search_url%A_Index%, REPLACEME, %query_safe%
        run chrome.exe %search_final_url%
    }
    search_urls := 0
    return

;-------------------------------------------------------------------------------
; TOOLTIP
; The tooltip shows all defined commands, along with a description of what
; each command does. It gets the description from the comments in UserCommands.ahk.
; The code was improved and fixed for Windows 10 with the help of schmimae.
;-------------------------------------------------------------------------------
gui_tooltip_clear:
    ToolTip
    return

gui_commandlibrary:
    ; hidden GUI used to pass font options to tooltip:
    CoordMode, Tooltip, Screen ; To make sure the tooltip coordinates is displayed according to the screen and not active window
    Gui, 2:Font,s10, Lucida Console
    Gui, 2:Add, Text, HwndhwndStatic

    tooltiptext =
    maxpadding = 0
    StringCaseSense, Off ; Matching to both if/If in the IfInString command below
    Loop, read, %A_ScriptDir%/GUI/UserCommands.ahk
    {
        ; search for the string If Aleph =, but search for each word individually because spacing between words might not be consistent. (might be improved with regex)
        If Substr(A_LoopReadLine, 1, 1) != ";" ; Do not display commented commands
        {
            If A_LoopReadLine contains if
            {
                IfInString, A_LoopReadLine, Aleph
                    IfInString, A_LoopReadLine, =
                    {
                        StringGetPos, setpos, A_LoopReadLine,=
                        StringTrimLeft, trimmed, A_LoopReadLine, setpos+1 ; trim everything that comes before the = sign
                        StringReplace, trimmed, trimmed, `%A_Space`%,{space}, All
                        tooltiptext .= trimmed
                        tooltiptext .= "`n"

                        ; The following is used to correct padding:
                        StringGetPos, commentpos, trimmed,`;
                        if (maxpadding < commentpos)
                            maxpadding := commentpos
                    }
            }
        }
    }
    tooltiptextpadded =
    Loop, Parse, tooltiptext,`n
    {
        line = %A_LoopField%
        StringGetPos, commentpos, line, `;
        spaces_to_insert := maxpadding - commentpos
        Loop, %spaces_to_insert%
        {
            StringReplace, line, line,`;,%A_Space%`;
        }
        tooltiptextpadded .= line
        tooltiptextpadded .= "`n"
    }
    Sort, tooltiptextpadded
    ToolTip %tooltiptextpadded%, 3, 3, 1
    return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Allow normal CapsLock functionality to be toggled by Alt+CapsLock:
+CapsLock::
    GetKeyState, capsstate, CapsLock, T ;(T indicates a Toggle. capsstate is an arbitrary varible name)
    if capsstate = U
        SetCapsLockState, AlwaysOn
    else
        SetCapsLockState, AlwaysOff
    return


; A function to escape characters like & for use in URLs.
uriEncode(str) {
    f = %A_FormatInteger%
    SetFormat, Integer, Hex
    If RegExMatch(str, "^\w+:/{0,2}", pr)
        StringTrimLeft, str, str, StrLen(pr)
    StringReplace, str, str, `%, `%25, All
    Loop
        If RegExMatch(str, "i)[^\w\.~%/:]", char)
           StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
        Else Break
    SetFormat, Integer, %f%
    Return, pr . str
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; AUTO-RELOAD
#IfWinActive ahk_exe notepad++.exe
	~^s::
		;MsgBox, 4096,, Reloading Media Script. Please Wait, 1
		Sleep, 200
		Reload
	return
#IfWinActive
