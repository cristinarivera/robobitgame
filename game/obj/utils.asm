;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module utils
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getTilePtr
	.globl _abs
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/utils.c:4: char* getTilePtr(u8*mapa, u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
	ld	c,7 (ix)
	ld	b,#0x00
	ld	a,c
	add	a,#0xE8
	ld	e,a
	ld	a,b
	adc	a,#0xFF
	ld	d,a
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00103$
	ld	hl,#0xFFEB
	add	hl,bc
00103$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,bc
	ld	c,6 (ix)
	srl	c
	ld	e,c
	ld	d,#0x00
	add	hl,de
	pop	ix
	ret
;src/utils.c:8: i16 abs (i16 n) {
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/utils.c:9: const i16 ret[2] = { n, -n };
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	xor	a, a
	sub	a, 4 (ix)
	ld	e,a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	d,a
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/utils.c:10: return ret[n<0];
	ld	a,5 (ix)
	rlca
	and	a,#0x01
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	l, c
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
