; Custom Colemak Mod (ISO)
; Author: Qeris
; Version 1.0
; Date: 2022-04-21

menu, tray, icon, C:\Windows\system32\shell32.dll,74
;Suspend

#End::Edit
RShift & Del::Suspend
RAlt & Del::Reload
#Space::ExitApp

;SC010::q
;SC011::w
SC012::f ;e
SC013::p ;r
SC014::b ;t
SC015::j ;y
SC016::l ;u
SC017::u ;i
SC018::y ;o
SC019::; ;p

;SC01E::a
SC01F::r ;s
SC020::s ;d
SC021::t ;f
;SC022::g
SC023::m ;h
SC024::n ;j
SC025::e ;k
SC026::i ;l
SC027::o ;;

;SC02c::z
;SC02d::x
SC02e::d ;c
~LControl & SC02e::send, ^{c} ;^c
SC02f::c ;v
~LControl & SC02f::send, ^{v} ; ^v
SC030::v ;b
SC031::k ;n
SC032::h ;m

; set Backspace to CapsLock key
sc03a::backspace

; |P|R|M|F|F| |F|F|M|R|P|
; ----------- -----------
; |q|w|e|r|t| |y|u|i|o|p|
; |a|s|d|f|g| |h|j|k|l|;|
; |z|x|c|v|b| |n|m|,|,|.|

; |P|R|M|F|F| |F|F|M|R|P|
; ----------- -----------
; |q|w|f|p|b| |j|l|u|y|;|
; |a|r|s|t|g| |m|n|e|i|o|
; |z|x|d|c|v| |k|h|,|.|/|