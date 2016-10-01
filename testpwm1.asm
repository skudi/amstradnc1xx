
INCLUDE "nc1xx.def"

DEFC PWMMSK=$01 ;data0/pin1

;pwm cycle b/c - b=busy time / c = total cycle time 
.pwmcycle 
	; calculate rest time = cycle - duty
	ld a,c
	sub b
	ld c,a
lpwmcycle:
; b = duty, c = rest
	ld a,PWMMSK
	out (PARDATA),a
lduty:
	djnz lduty
	xor a
	out (PARDATA),a
	ld b,c
lrest:
	djnz lrest
	ret

