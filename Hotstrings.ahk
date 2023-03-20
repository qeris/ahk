;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; HOTSTRINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Email
:o:]es::ethanschoultz@gmail.com
; Mobia Email
:o:]mob::ethan.schoultz@mobia.io
; Address
:*o:]adr::292 Woodside Cir, NW, Airdrie, T4B 2M3
;;; Responses ;;;
!+r:: ; alt-shift-r
; MENU
menu, Responses, add, 1 "Access Granted", respGranted
menu, Responses, add, 2 "Duplicate Removed", respDuplicateRemoved
menu, Responses, add, 3 "Support Signature", respSupportSignature
menu, Responses, show
return
;
respGranted:
	{
		!+q::
		InputBox, userName, Enter User, Name:
		Send, Hi %userName%,
		Send, {Enter}
		sleep 100
		Send, {Enter}
		Send, Access has been granted.
		sleep 500
		Send, {Enter}
		Send, !+a
		return
	}

respDuplicateRemoved:
{
	InputBox, userName, Enter User, Name:
	Send, Hi %userName%,
	Send, {Enter}
	sleep 100
	Send, {Enter}
	Send, Duplicate entry has been removed.
	sleep 500
	Send, {Enter}
	Send, !+a
	return
}
!+a::
respSupportSignature:
{
	send, {alt down}{n}{alt up}{a}{s}{enter}{down}{down}{del}{del}
	return
}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Misc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Date/Time
; Ex: 9/1/2005 3:53 PM
:*:]dt::
{
	FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt
	SendInput %CurrentDateTime%
	return
}
;
; Date only
; Ex: 9/1/2005
::]d::
{
	FormatTime, CurrentDate,, MM/dd/yyyy  
	SendInput %CurrentDate%
	return
}
;
; Time only (24-hr)
; Ex: 09:12
:*:]t::
{
	FormatTime, Time,, HH:mm 
	sendinput %Time%
	return
}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Obsidian
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Insert yaml metadata struct
:*:]-::---{Enter 4}---{up 2}
;
; Insert horizontal-rule
:*:]_::___{Enter 3}{up 1}
;
; Insert code-block
:*:]code::``````{Enter 3}{up 1}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Lines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:*:]80-::;-------------------------------------------------------------------------------
:*:]80;::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
menu Lines, add, 1 80;, linesSemiColon
menu Lines, show
return

RAlt & '::
linesSemiColon:
	Send, `;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	return
