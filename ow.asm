INCLUDE "nc1xx.def"

DEFC POWO=PARDATA ;i/o port with 1wire output pin
DEFC BOWO=$01 		;1wire output bit mask
DEFC POWI=SYSSTAT ;i/o port with 1wire input pin
DEFC BOWI=BPARACK	;1wire input mask


;reset line
; set line low for ~400us
.owreset
	xor a
	out (POWO), a ;pull 1wire low
	ld b,400/3.25
	djnz ASMPC 
	ld a, BOWO
	out (POWO), a ;stop pulling low
	ret

;send one bit (A & 0x01)
.owsendbit
	;pull 1wire low for ~5us
	push AF
	xor a
	out (POWO), a ;pull 1wire low
	ld a, BOWO
	out (POWO), a ;stop pulling low



