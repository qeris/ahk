^F1::
Toggle := !Toggle
If Toggle
{
		Gui,+AlwaysOnTop
		Gui, Add, Button, x12 y9 w50 h30 gOpenGmail, Open GMail
		Gui, Add, Button, x72 y9 w50 h30 gOpenGCal, Open GCAl
		Gui, Add, Button, x132 y9 w50 h30 gOpenGDrive, Open GDrive
		Gui, Add, Button, x192 y9 w50 h30 gOpenOneNote, Open OneNote
		Gui, Show, x852 y406 h97 w257, "Chrome Launcher"
}
else
{
		Gui, Destroy
}
return

OpenGmail:
	run chrome.exe www.gmail.com
	Gui, Destroy
return

OpenGCal:
	run chrome.exe https://calendar.google.com/calendar/u/0/r?pli=1
	Gui, Destroy
return
	
OpenGDrive:
	run chrome.exe https://drive.google.com/drive/my-drive
	Gui, Destroy
return
	
OpenOneNote:
	run chrome.exe https://www.onenote.com/hrd?wdorigin=ondcauth2&wdorigin=poc
	Gui, Destroy
return
	

	