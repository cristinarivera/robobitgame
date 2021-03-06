;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module score
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _borrarPantalla
	.globl _cpct_getScreenPtr
	.globl _cpct_drawStringM0
	.globl _cpct_drawCharM0
	.globl _cpct_drawSprite
	.globl _barraPuntuacionInicial
	.globl _modificarPuntuacion
	.globl _modificarVidas
	.globl _aumentarPuntuacion
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
;src/score/score.c:25: void barraPuntuacionInicial(){
;	---------------------------------
; Function barraPuntuacionInicial
; ---------------------------------
_barraPuntuacionInicial::
;src/score/score.c:29: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
	ld	hl,#0x0200
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/score/score.c:30: cpct_drawStringM0("SCORE", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/score/score.c:31: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
	ld	hl,#0x0E00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/score/score.c:32: cpct_drawStringM0("00000", memptr, 15, 0);
	ld	hl,#0x000F
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/score/score.c:34: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
	ld	hl,#0x023C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/score/score.c:35: cpct_drawStringM0("LIVES", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/score/score.c:37: for(i=0; i<5; i++){
	ld	bc,#0x0000
00102$:
;src/score/score.c:38: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
	ld	a,c
	add	a, a
	add	a, a
	add	a, #0x3C
	ld	d,a
	push	bc
	ld	a,#0x0E
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	ld	hl,#0x0603
	push	hl
	push	de
	ld	hl,#_g_heart
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/score/score.c:37: for(i=0; i<5; i++){
	inc	bc
	ld	a,c
	sub	a, #0x05
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
	ret
___str_0:
	.ascii "SCORE"
	.db 0x00
___str_1:
	.ascii "00000"
	.db 0x00
___str_2:
	.ascii "LIVES"
	.db 0x00
;src/score/score.c:43: void modificarPuntuacion(u16 puntuacion){
;	---------------------------------
; Function modificarPuntuacion
; ---------------------------------
_modificarPuntuacion::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/score/score.c:45: u16 puntuacion_aux = puntuacion;
	ld	e,4 (ix)
	ld	d,5 (ix)
;src/score/score.c:46: borrarPantalla(0, 14, 25, 7);
	push	de
	ld	hl,#0x0719
	push	hl
	ld	hl,#0x0E00
	push	hl
	call	_borrarPantalla
	pop	af
	pop	af
	ld	hl,#0x0E00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
	pop	de
;src/score/score.c:49: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
	push	bc
	push	de
	ld	hl,#0x000A
	push	hl
	push	de
	call	__moduint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	add	a, #0x30
	ld	-1 (ix),a
	push	bc
	pop	iy
	push	bc
	push	de
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0x0002
	push	hl
	push	iy
	call	_cpct_drawCharM0
	pop	af
	pop	af
	inc	sp
	pop	de
	ld	hl,#0x03E8
	push	hl
	push	de
	call	__divuint
	pop	af
	pop	af
	ld	de,#0x000A
	push	de
	push	hl
	call	__moduint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	add	a, #0x30
	ld	h,a
	ld	a,c
	add	a, #0x04
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
	push	bc
	push	hl
	inc	sp
	ld	hl,#0x0002
	push	hl
	push	de
	call	_cpct_drawCharM0
	pop	af
	inc	sp
	ld	hl,#0x0064
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint
	pop	af
	pop	af
	ld	de,#0x000A
	push	de
	push	hl
	call	__moduint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	add	a, #0x30
	ld	h,a
	ld	a,c
	add	a, #0x08
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
	push	bc
	push	hl
	inc	sp
	ld	hl,#0x0002
	push	hl
	push	de
	call	_cpct_drawCharM0
	pop	af
	inc	sp
	ld	hl,#0x000A
	ex	(sp),hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint
	pop	af
	pop	af
	ld	de,#0x000A
	push	de
	push	hl
	call	__moduint
	pop	af
	pop	af
	pop	bc
	ld	a,l
	add	a, #0x30
	ld	h,a
	ld	a,c
	add	a, #0x0C
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
	push	bc
	push	hl
	inc	sp
	ld	hl,#0x0002
	push	hl
	push	de
	call	_cpct_drawCharM0
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/score/score.c:57: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
	ld	hl,#0x0010
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0x0002
	push	hl
	push	bc
	call	_cpct_drawCharM0
	pop	af
	pop	af
	inc	sp
	inc	sp
	pop	ix
	ret
;src/score/score.c:61: void modificarVidas(u8 vidas){
;	---------------------------------
; Function modificarVidas
; ---------------------------------
_modificarVidas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/score/score.c:64: borrarPantalla(60, 14, 20, 6);
	ld	hl,#0x0614
	push	hl
	ld	hl,#0x0E3C
	push	hl
	call	_borrarPantalla
	pop	af
	pop	af
;src/score/score.c:66: for(i = 0; i<vidas; i++){
	ld	c,#0x00
00105$:
	ld	a,c
	sub	a, 4 (ix)
	jr	NC,00107$
;src/score/score.c:67: if(i%20 == 0){
	push	bc
	ld	a,#0x14
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	__moduchar
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	jr	NZ,00106$
;src/score/score.c:68: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + (i/20)*4, 14); // dibuja 5 corazones
	push	bc
	ld	a,#0x14
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	__divuchar
	pop	af
	pop	bc
	ld	a,l
	add	a, a
	add	a, a
	add	a, #0x3C
	ld	b,a
	push	bc
	ld	a,#0x0E
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	ld	hl,#0x0603
	push	hl
	push	de
	ld	hl,#_g_heart
	push	hl
	call	_cpct_drawSprite
	pop	bc
00106$:
;src/score/score.c:66: for(i = 0; i<vidas; i++){
	inc	c
	jr	00105$
00107$:
	pop	ix
	ret
;src/score/score.c:74: u16 aumentarPuntuacion(u16 puntuacion){
;	---------------------------------
; Function aumentarPuntuacion
; ---------------------------------
_aumentarPuntuacion::
;src/score/score.c:75: return puntuacion + 10;
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	add	a, #0x0A
	ld	l, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	h, a
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
