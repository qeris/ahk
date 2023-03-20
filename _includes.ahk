;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VIRTUAL DESKTOP NAVIAGATION ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If MouseIsOver("ahk_class Shell_TrayWnd") 
OR MouseIsOver("ahk_class Shell_SecondaryTrayWnd")
{
	WheelUp::SendInput #^{Left}
	WheelDown::SendInput #^{Right}
}
; Helper function
MouseIsOver(WinTitle) 
	{
		MouseGetPos,,, Win
		return WinExist(WinTitle . " ahk_id " . Win)
	}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TESTING ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
