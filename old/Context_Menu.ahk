^F2::
Menu MyMenu, Add, 1 Open GMail, openGmail
Menu MyMenu, Add, 2 Open GCal, openGcal
Menu MyMenu, Add, 3 Open GDrive, openGdrive
Menu MyMenu, Add, 4 Open OneNote, openOneNote
Menu MyMenu, Show

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
