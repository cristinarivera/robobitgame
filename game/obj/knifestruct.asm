;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module knifestruct
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getTilePtr
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _dibujarCuchillo
	.globl _borrarCuchillo
	.globl _redibujarCuchillo
	.globl _lanzarCuchillo
	.globl _checkOffBounds
	.globl _checkKnifeCollision
	.globl _moverCuchillo
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
;src/knifestruct.c:3: void dibujarCuchillo(TKnife* cu, u8* g_tablatrans) {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l, e
	ld	h, d
	inc	hl
	ld	b,(hl)
	ld	a,(de)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	inc	sp
	inc	sp
	push	hl
;src/knifestruct.c:5: if(cu->eje == E_X){
	push	de
	pop	iy
	ld	c,8 (iy)
;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	a,6 (ix)
	ld	-4 (ix),a
	ld	a,7 (ix)
	ld	-3 (ix),a
	ld	a,-6 (ix)
	ld	-2 (ix),a
	ld	a,-5 (ix)
	ld	-1 (ix),a
	inc	de
	inc	de
	inc	de
	inc	de
;src/knifestruct.c:5: if(cu->eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ex	de,hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#0x0404
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00106$
00104$:
;src/knifestruct.c:9: else if(cu->eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	ex	de,hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#0x0802
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/knifestruct.c:20: w = 4 + (x & 1);
	ld	a,5 (ix)
	and	a, #0x01
	ld	b,a
;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
	ld	a,6 (ix)
	and	a, #0x03
	ld	c,a
;src/knifestruct.c:19: if(eje == E_X){
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00102$
;src/knifestruct.c:20: w = 4 + (x & 1);
	inc	b
	inc	b
	inc	b
	inc	b
;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
	ld	a,c
	or	a, a
	jr	Z,00106$
	ld	c,#0x01
	jr	00107$
00106$:
	ld	c,#0x00
00107$:
	inc	c
	jr	00103$
00102$:
;src/knifestruct.c:23: w = 2 + (x & 1);
	inc	b
	inc	b
;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
	ld	a,c
	or	a, a
	jr	Z,00108$
	ld	c,#0x01
	jr	00109$
00108$:
	ld	c,#0x00
00109$:
	inc	c
	inc	c
00103$:
;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	a,7 (ix)
	ld	-2 (ix),a
	ld	a,8 (ix)
	ld	-1 (ix),a
	ld	e,6 (ix)
	ld	d,#0x00
	ld	a,e
	add	a,#0xE8
	ld	-4 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-3 (ix),a
	pop	hl
	push	hl
	bit	7, -3 (ix)
	jr	Z,00110$
	ld	hl,#0xFFEB
	add	hl,de
00110$:
	ld	e,l
	sra	h
	rr	e
	sra	h
	rr	e
	ld	d,5 (ix)
	srl	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	h,6 (ix)
	ld	l,5 (ix)
	push	hl
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_borrarCuchillo
	pop	af
	pop	af
	inc	sp
;src/knifestruct.c:33: cu->px = cu->x;
	ld	c,7 (ix)
	ld	b,8 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/knifestruct.c:34: cu->py = cu->y;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,(hl)
	ld	(de),a
;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	af
	pop	ix
	ret
;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-14
	add	hl,sp
	ld	sp,hl
;src/knifestruct.c:40: if(!cu->lanzado){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0006
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00122$
;src/knifestruct.c:42: if(prota->mira == M_derecha){
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0007
	add	hl, bc
	pop	bc
	ld	l,(hl)
;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
	ld	a,e
	add	a, #0x01
	ld	-14 (ix),a
	ld	a,d
	adc	a, #0x00
	ld	-13 (ix),a
;src/knifestruct.c:45: cu->direccion = M_derecha;
	ld	a,c
	add	a, #0x07
	ld	-6 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-5 (ix),a
;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
	ld	a,c
	add	a, #0x01
	ld	-12 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-11 (ix),a
;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
	ld	a,c
	add	a, #0x04
	ld	-10 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-9 (ix),a
;src/knifestruct.c:49: cu->eje = E_X;
	ld	a,c
	add	a, #0x08
	ld	-8 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-7 (ix),a
;src/knifestruct.c:42: if(prota->mira == M_derecha){
	ld	a,l
	or	a, a
	jr	NZ,00118$
;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
	pop	hl
	push	hl
	ld	a,(hl)
	add	a, #0x0B
	ld	-1 (ix),a
	ld	a,(de)
	add	a, #0x0C
	ld	-4 (ix),a
	push	bc
	push	de
	ld	h,-1 (ix)
	ld	l,-4 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jp	C,00122$
;src/knifestruct.c:44: cu->lanzado = SI;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:45: cu->direccion = M_derecha;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
	ld	a,(de)
	add	a, #0x07
	ld	(bc),a
;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
	pop	hl
	push	hl
	ld	a,(hl)
	add	a, #0x0B
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),a
;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#<(_g_knifeX_0)
	inc	hl
	ld	(hl),#>(_g_knifeX_0)
;src/knifestruct.c:49: cu->eje = E_X;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	af
	jp	00122$
00118$:
;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00115$
;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
	pop	hl
	push	hl
	ld	a,(hl)
	add	a, #0x0B
	ld	-4 (ix),a
	ld	a,(de)
	add	a,#0xF6
	ld	-1 (ix),a
	push	bc
	push	de
	ld	h,-4 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jp	C,00122$
;src/knifestruct.c:55: cu->lanzado = SI;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:56: cu->direccion = M_izquierda;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
	ld	a,(de)
	add	a,#0xFC
	ld	(bc),a
;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
	pop	hl
	push	hl
	ld	a,(hl)
	add	a, #0x0B
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),a
;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#<(_g_knifeX_1)
	inc	hl
	ld	(hl),#>(_g_knifeX_1)
;src/knifestruct.c:60: cu->eje = E_X;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	af
	jp	00122$
00115$:
;src/knifestruct.c:64: else if(prota->mira == M_abajo){
	ld	a,l
	sub	a, #0x03
	jr	NZ,00112$
;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
	pop	hl
	push	hl
	ld	a,(hl)
	add	a, #0x1F
	ld	-4 (ix),a
	ld	a,(de)
	add	a, #0x03
	ld	-1 (ix),a
	push	bc
	push	de
	ld	h,-4 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jp	C,00122$
;src/knifestruct.c:67: cu->lanzado = SI;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:68: cu->direccion = M_abajo;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x03
;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
	ld	a,(de)
	add	a, #0x03
	ld	(bc),a
;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
	pop	hl
	push	hl
	ld	a,(hl)
	add	a, #0x16
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),a
;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#<(_g_knifeY_0)
	inc	hl
	ld	(hl),#>(_g_knifeY_0)
;src/knifestruct.c:72: cu->eje = E_Y;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	af
	jr	00122$
00112$:
;src/knifestruct.c:76: else if(prota->mira == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00122$
;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
	pop	hl
	push	hl
	ld	a,(hl)
	add	a,#0xF7
	ld	-4 (ix),a
	ld	a,(de)
	add	a, #0x03
	ld	-1 (ix),a
	push	bc
	push	de
	ld	h,-4 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jr	C,00122$
;src/knifestruct.c:78: cu->lanzado = SI;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:79: cu->direccion = M_arriba;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x02
;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
	ld	a,(de)
	add	a, #0x03
	ld	(bc),a
;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
	pop	hl
	push	hl
	ld	a,(hl)
	add	a,#0xF8
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),a
;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#<(_g_knifeY_1)
	inc	hl
	ld	(hl),#>(_g_knifeY_1)
;src/knifestruct.c:83: cu->eje = E_Y;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	af
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/knifestruct.c:90: u8 checkOffBounds(TKnife* cu){
;	---------------------------------
; Function checkOffBounds
; ---------------------------------
_checkOffBounds::
;src/knifestruct.c:91: return (cu->x + G_KNIFEX_0_W  > (80 - 4) || cu->x < (0 + 4));
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	c,(hl)
	ld	e,c
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a,#0x4C
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00114$
	xor	a, #0x80
00114$:
	jp	M,00104$
	ld	a,c
	sub	a, #0x04
	jr	C,00104$
	ld	l,#0x00
	ret
00104$:
	ld	l,#0x01
	ret
;src/knifestruct.c:94: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
;	---------------------------------
; Function checkKnifeCollision
; ---------------------------------
_checkKnifeCollision::
;src/knifestruct.c:96: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	ld	a,e
	ld	hl,#5
	add	hl,sp
	add	a, (hl)
	ld	d,a
	ld	a,(bc)
	ld	c,a
	ld	hl,#4
	add	hl,sp
	add	a, (hl)
	ld	b,a
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	ld	a,#0x00
	rla
	xor	a, #0x01
	ld	l, a
	ret
;src/knifestruct.c:99: void moverCuchillo(TKnife* cu, u8* mapa){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/knifestruct.c:100: if(cu->lanzado){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jp	Z,00138$
;src/knifestruct.c:101: cu->mover = SI;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x01
	ld	(de),a
;src/knifestruct.c:102: if(cu->direccion == M_derecha){
	push	bc
	pop	iy
	ld	l,7 (iy)
	ld	a,l
	or	a, a
	jr	NZ,00134$
;src/knifestruct.c:103: if(checkOffBounds(cu)){
	push	bc
	push	de
	push	bc
	call	_checkOffBounds
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/knifestruct.c:104: cu->mover=NO;
	xor	a, a
	ld	(de),a
	jp	00138$
00105$:
;src/knifestruct.c:106: else if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	hl,#0x0005
	push	hl
	push	bc
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00102$
;src/knifestruct.c:107: cu->mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/knifestruct.c:108: cu->x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
	jp	00138$
00102$:
;src/knifestruct.c:111: cu->mover=NO;
	xor	a, a
	ld	(de),a
	jp	00138$
00134$:
;src/knifestruct.c:114: else if(cu->direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00131$
;src/knifestruct.c:115: if(checkOffBounds(cu)){
	push	bc
	push	de
	push	bc
	call	_checkOffBounds
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00111$
;src/knifestruct.c:116: cu->mover=NO;
	xor	a, a
	ld	(de),a
	jp	00138$
00111$:
;src/knifestruct.c:118: else if(checkKnifeCollision(cu, -1, 0, mapa)){
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	hl,#0x00FF
	push	hl
	push	bc
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00108$
;src/knifestruct.c:119: cu->mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/knifestruct.c:120: cu->x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	jp	00138$
00108$:
;src/knifestruct.c:123: cu->mover=NO;
	xor	a, a
	ld	(de),a
	jp	00138$
00131$:
;src/knifestruct.c:132: cu->y--;
	ld	a,c
	add	a, #0x01
	ld	-2 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-1 (ix),a
;src/knifestruct.c:126: else if(cu->direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00128$
;src/knifestruct.c:127: if(checkOffBounds(cu)){
	push	bc
	push	de
	push	bc
	call	_checkOffBounds
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00117$
;src/knifestruct.c:128: cu->mover = NO;
	xor	a, a
	ld	(de),a
	jr	00138$
00117$:
;src/knifestruct.c:130: else if(checkKnifeCollision(cu, 0, -2, mapa)){
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	hl,#0xFE00
	push	hl
	push	bc
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	af
	pop	de
	ld	a,l
	or	a, a
	jr	Z,00114$
;src/knifestruct.c:131: cu->mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/knifestruct.c:132: cu->y--;
	pop	hl
	push	hl
	ld	c,(hl)
	dec	c
	pop	hl
	push	hl
	ld	(hl),c
;src/knifestruct.c:133: cu->y--;
	dec	c
	pop	hl
	push	hl
	ld	(hl),c
	jr	00138$
00114$:
;src/knifestruct.c:136: cu->mover=NO;
	xor	a, a
	ld	(de),a
	jr	00138$
00128$:
;src/knifestruct.c:139: else if(cu->direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	jr	NZ,00138$
;src/knifestruct.c:140: if(checkOffBounds(cu)){
	push	bc
	push	de
	push	bc
	call	_checkOffBounds
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00123$
;src/knifestruct.c:141: cu->mover = NO;
	xor	a, a
	ld	(de),a
	jr	00138$
00123$:
;src/knifestruct.c:143: else if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	hl,#0x0A00
	push	hl
	push	bc
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	af
	pop	de
	ld	a,l
	or	a, a
	jr	Z,00120$
;src/knifestruct.c:144: cu->mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/knifestruct.c:145: cu->y++;
	pop	hl
	push	hl
	ld	c,(hl)
	inc	c
	pop	hl
	push	hl
	ld	(hl),c
;src/knifestruct.c:146: cu->y++;
	inc	c
	pop	hl
	push	hl
	ld	(hl),c
	jr	00138$
00120$:
;src/knifestruct.c:149: cu->mover=NO;
	xor	a, a
	ld	(de),a
00138$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
