; === CONFIG === ;
#SingleInstance Force
Menu, Tray, Icon, C:\WINDOWS\system32\shell32.dll,22

; === GUI LAYOUT === ;
CoordMode, Mouse, Screen
SysGet, Mon2, Monitor, 2
Mon2Right := Mon2Right - Mon2Left
Mon2Bottom := Mon2Bottom - Mon2Top

GUI, Destroy
GUI, +AlwaysOnTop
GUI, Color, White
GUI, Font, cBlack ;cColour

; === BUTTONS === ;
;GUI, Add, Text, x10 y10, I'm Text!
; Increase font
gui, font, s40, Arial
; Main Menu Button
GUI, Add, Button, h300 w600 vMainScreen gMainScreen, Main Menu
; Media Button
GUI, Add, Button, x+20 h300 w600 vMedia gMedia, Media
; Internet Button
GUI, Add, Button, x+20 h300 w600 vInternet gInternet, Internet

; Main Controls
GUI, Add, Button, x50 h300 w600 vExitOption gExitOption Hidden, Quit

; Media Controls
GUI, Add, Button, x50 y360 h300 w600 vPrevious gPrevious Hidden, Previous
GUI, Add, Button, x+20 h300 w600 vPlayPause gPlayPause Hidden, Play | Pause
GUI, Add, Button, x+20 h300 w600 vNext gNext Hidden, Next
; Next Row
GUI, Add, Button, x50 y+10 h300 w600 vVolumeDown gVolumeDown Hidden, Volume -
GUI, Add, Button, x+20 h300 w600 vMute gMute Hidden, Mute
GUI, Add, Button, x+20 h300 w600 vVolumeUp gVolumeUp Hidden, Volume +


; Internet Controls
GUI, Add, Button, x50 y360 h300 w600 vGoogle gGoogle Hidden, Google
GUI, Add, Button, x+20 h300 w600 vGmail gGMail Hidden, GMail
GUI, Add, Button, x+20 h300 w600 vYouTube gYouTube Hidden, YouTube

; === SHOW === ;
Gui, Show, x%Mon2Left% y%Mon2Top% w%Mon2Right% h%Mon2Bottom%, AutoHotDeck
return

; === LABELS === ;
MainScreen:
	; Show
	GuiControl, Show, ExitOption
	; Hide
	GuiControl, Hide, Previous
	GuiControl, Hide, PlayPause
	GuiControl, Hide, Next
	GuiControl, Hide, VolumeDown
	GuiControl, Hide, Mute
	GuiControl, Hide, VolumeUp
	GuiControl, Hide, Google
	GuiControl, Hide, GMail
	GuiControl, Hide, YouTube
return

Media:
	; Show
	GuiControl, Show, Previous
	GuiControl, Show, PlayPause
	GuiControl, Show, Next
	GuiControl, Show, VolumeDown
	GuiControl, Show, Mute
	GuiControl, Show, VolumeUp
	; Hide
	GuiControl, Hide, ExitOption
	GuiControl, Hide, Google
	GuiControl, Hide, GMail
	GuiControl, Hide, YouTube
return

Internet:
	; Show
	GuiControl, show, Google
	GuiControl, show, GMail
	GuiControl, show, YouTube
	; Hide
	GuiControl, hide, ExitOption
	GuiControl, Hide, Previous
	GuiControl, Hide, PlayPause
	GuiControl, Hide, Next
	GuiControl, Hide, VolumeDown
	GuiControl, Hide, Mute
	GuiControl, Hide, VolumeUp
return

; Main
Google:
run, www.google.com
return
GMail:
run, www.gmail.com
return
YouTube:
run, www.youtube.com
return

; Media
Previous:
Send, Media_Prev
return

PlayPause:
Send, {Media_Play_Pause}
return

Next:
Send, {Media_Next}
return

VolumeDown:
send, {volume_down}
return

Mute:
send, {Volume_Mute}
return

VolumeUp:
send, {Volume_Up}
return

; Exit
ExitOption:
ExitApp

GuiClose:
ExitApp