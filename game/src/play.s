.globl cpct_akp_musicPlay_asm

_play::
	exx
	ex af' , af
	push af
	push bc
	push de
	push hl

	call cpct_akp_musicPlay_asm

	pop hl
	pop de
	pop bc
	pop af
	ex af' , af
	exx

	ret