#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

:*:;ph::4803898128

^u::
clipboard = .\corpsupport
Return

^p::
clipboard = VaDmZ1nUxJkX
Return

^h::
    Send, ^{Left}
    Return

^l::
    Send, ^{Right}
    Return

^j::
    Send, ^{Down}
    Return

^k::
    Send, ^{Up}
    Return

; SetCapsLockState Off
; CapsLock::
; 	key=
; 	Input, key, B C L1 T1, {Esc}
; 	if (ErrorLevel = "Max")
; 		Send {Ctrl Down}%key%
; 	KeyWait, CapsLock
; 	Return
; CapsLock up::
; 	If key
; 		Send {Ctrl Up}
; 	else
; 		if (A_TimeSincePriorHotkey < 1000)
; 			Send, {Esc 2}
; 	Return

*CapsLock::
Send {Blind}{Ctrl Down}
cDown := A_TickCount
Return

*CapsLock up::
; Modify the threshold time (in milliseconds) as necessary
If ((A_TickCount-cDown) < 150)
  Send {Blind}{Ctrl Up}{Esc}
Else
  Send {Blind}{Ctrl Up}
  Return