;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _G_song
	.globl _main
	.globl _inicializar
	.globl _moverCuchillo
	.globl _comprobarTeclado
	.globl _lanzarCuchillo
	.globl _redibujarCuchillo
	.globl _borrarCuchillo
	.globl _dibujarCuchillo
	.globl _moverAbajo
	.globl _moverArriba
	.globl _moverDerecha
	.globl _moverIzquierda
	.globl _checkCollision
	.globl _getTilePtr
	.globl _redibujarProta
	.globl _borrarProta
	.globl _dibujarProta
	.globl _dibujarMapa
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_akp_musicPlay
	.globl _cpct_akp_musicInit
	.globl _cpct_getScreenPtr
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_disableFirmware
	.globl _mapa
	.globl _cu
	.globl _prota
	.globl _EEje
	.globl _EMirar
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_EMirar::
	.ds 1
_EEje::
	.ds 1
_prota::
	.ds 8
_cu::
	.ds 90
_mapa::
	.ds 2
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
;src/main.c:90: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x3E00 
	 _g_tablatrans::
	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/main.c:93: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:94: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
	ld	hl,(_mapa)
	push	hl
	ld	hl,#0xC000
	push	hl
	ld	hl,#0x282C
	push	hl
	ld	l, #0x00
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
;src/main.c:99: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:100: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
	ld	hl, #_prota + 1
	ld	d,(hl)
	ld	hl, #_prota + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:101: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:104: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:106: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:109: u8 h = 6 + (prota.py & 2 ? 1 : 0);
	ld	hl, #_prota + 3
	ld	e,(hl)
	bit	1, e
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x06
	ld	-1 (ix),a
;src/main.c:111: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	iy,(_mapa)
	ld	d,#0x00
	ld	h,e
	ld	l,d
	bit	7, d
	jr	Z,00105$
	inc	de
	inc	de
	inc	de
	ld	h,e
	ld	l,d
00105$:
	ld	e, h
	ld	d, l
	sra	d
	rr	e
	sra	d
	rr	e
	ld	d,c
	srl	d
	push	iy
	ld	hl,#0xC000
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,-1 (ix)
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
	inc	sp
	pop	ix
	ret
;src/main.c:114: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:115: borrarProta();
	call	_borrarProta
;src/main.c:116: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:117: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:118: dibujarProta();
	jp  _dibujarProta
;src/main.c:121: u8* getTilePtr(u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
;src/main.c:122: return mapa + (y-ORIGEN_MAPA_Y)/4*g_map1_W + x/2;
	ld	iy,#3
	add	iy,sp
	ld	l,0 (iy)
	ld	h,#0x00
	ld	c,l
	ld	e,h
	bit	7, h
	jr	Z,00103$
	inc	hl
	inc	hl
	inc	hl
	ld	c,l
	ld	e,h
00103$:
	ld	b, e
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de,(_mapa)
	add	hl,de
	ld	iy,#2
	add	iy,sp
	ld	c,0 (iy)
	srl	c
	ld	e,c
	ld	d,#0x00
	add	hl,de
	ret
;src/main.c:125: u8 checkCollision(int direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:128: switch (direction) {
	bit	7, 5 (ix)
	jp	NZ,00105$
	ld	a,#0x03
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	M,00105$
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:129: case 0:
	jp	(hl)
00124$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:130: headTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	ld	a, (#_prota + 0)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:131: feetTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	d,a
	ld	a, (#_prota + 0)
	add	a, #0x04
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:132: break;
	jr	00105$
;src/main.c:133: case 1:
00102$:
;src/main.c:134: headTile = getTilePtr(prota.x - 1, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_prota + 0
	ld	d,(hl)
	dec	d
	ld	c, d
	push	bc
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:135: feetTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	d,a
	ld	a, (#_prota + 0)
	add	a,#0xFF
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:136: break;
	jr	00105$
;src/main.c:137: case 2:
00103$:
;src/main.c:138: headTile = getTilePtr(prota.x, prota.y - 1);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	dec	b
	ld	hl, #_prota + 0
	ld	c, (hl)
	push	bc
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:139: feetTile = getTilePtr(prota.x, prota.y - 1);
	ld	a, (#(_prota + 0x0001) + 0)
	ld	d,a
	dec	d
	ld	a, (#_prota + 0)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:140: break;
	jr	00105$
;src/main.c:141: case 3:
00104$:
;src/main.c:142: headTile = getTilePtr(prota.x + 2, prota.y + ALTO_PROTA + 1);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x17
	ld	b,a
	ld	hl, #_prota + 0
	ld	d,(hl)
	inc	d
	inc	d
	ld	c, d
	push	bc
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:143: feetTile = getTilePtr(prota.x + 2, prota.y + ALTO_PROTA + 1);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x17
	ld	d,a
	ld	a, (#_prota + 0)
	add	a, #0x02
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:145: }
00105$:
;src/main.c:147: if (*headTile > 0 || *feetTile > 0)
	ld	a,(bc)
	or	a, a
	jr	NZ,00106$
	ld	a,(de)
	or	a, a
	jr	Z,00107$
00106$:
;src/main.c:148: return 1;
	ld	l,#0x01
	jr	00109$
00107$:
;src/main.c:150: return 0;
	ld	l,#0x00
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:153: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:155: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:157: if (!checkCollision(M_izquierda)) {
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:158: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:159: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
	ret
;src/main.c:166: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:167: prota.mira = M_derecha;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:169: if (!checkCollision(M_derecha)) {
	push	bc
	ld	hl,#0x0000
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:170: prota.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:171: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
	ret
;src/main.c:177: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:178: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:180: if (!checkCollision(M_arriba)) {
	ld	hl,#0x0002
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:181: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:182: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
	ret
;src/main.c:187: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:188: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:190: if (!checkCollision(M_abajo)) {
	ld	hl,#0x0003
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:191: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:192: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
	ret
;src/main.c:197: void dibujarCuchillo(TKnife* actual) {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
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
	push	hl
	pop	iy
;src/main.c:199: if(actual->eje == E_X){
	ld	l, e
	ld	h, d
	ld	bc, #0x0008
	add	hl, bc
	ld	c,(hl)
;src/main.c:200: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	push	iy
	pop	af
	ld	-1 (ix),a
	push	iy
	dec	sp
	pop	af
	inc	sp
	ld	-2 (ix),a
	ld	hl,#0x0004
	add	hl,de
	ex	(sp), hl
;src/main.c:199: if(actual->eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/main.c:200: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	pop	hl
	push	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	hl,#0x0303
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00106$
00104$:
;src/main.c:203: else if(actual->eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/main.c:204: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	pop	hl
	push	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	hl,#0x0602
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
;src/main.c:208: void borrarCuchillo(TKnife* actual) {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:209: u8 w = 2 + (actual->px & 1);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:210: u8 h = 2 + (actual->py & 3 ? 1 : 0);
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	a,e
	and	a, #0x03
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x02
	ld	-1 (ix),a
;src/main.c:211: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	iy,(_mapa)
	ld	d,#0x00
	ld	h,e
	ld	l,d
	bit	7, d
	jr	Z,00105$
	inc	de
	inc	de
	inc	de
	ld	h,e
	ld	l,d
00105$:
	ld	e, h
	ld	d, l
	sra	d
	rr	e
	sra	d
	rr	e
	ld	d,c
	srl	d
	push	iy
	ld	hl,#0xC000
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,-1 (ix)
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
	inc	sp
	pop	ix
	ret
;src/main.c:214: void redibujarCuchillo(TKnife* actual) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:215: borrarCuchillo(actual);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarCuchillo
	pop	af
;src/main.c:216: actual->px = actual->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:217: actual->py = actual->y;
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
;src/main.c:218: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	ix
	ret
;src/main.c:222: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:224: TKnife* actual = cu;
	ld	bc,#_cu+0
;src/main.c:227: while(i>0 && actual->lanzado){
	ld	e,#0x0A
00102$:
	ld	hl,#0x0006
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,e
	or	a, a
	jr	Z,00104$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00104$
;src/main.c:228: --i;
	dec	e
;src/main.c:229: actual++;
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00102$
00104$:
;src/main.c:232: if(i>0 && !actual->lanzado){
	ld	a,e
	or	a, a
	jp	Z,00127$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00127$
;src/main.c:234: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	l,(hl)
;src/main.c:237: actual->direccion = M_derecha;
	ld	iy,#0x0007
	add	iy, bc
;src/main.c:239: actual->y=prota.y + G_HERO_H /2;	
	ld	e, c
	ld	d, b
	inc	de
;src/main.c:240: actual->sprite=g_knifeX_0;
	ld	a,c
	add	a, #0x04
	ld	-4 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-3 (ix),a
;src/main.c:241: actual->eje = E_X;
	ld	a,c
	add	a, #0x08
	ld	-6 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-5 (ix),a
;src/main.c:234: if(prota.mira == M_derecha){
	ld	a,l
	or	a, a
	jr	NZ,00122$
;src/main.c:235: if( (LIMITE_DERECHO - (prota.x + G_HERO_W) ) >= G_KNIFEX_0_W + 1){
	ld	hl, #_prota + 0
	ld	l,(hl)
	ld	h,#0x00
	push	de
	ld	de,#0x0007
	add	hl, de
	pop	de
	ld	a,#0x4C
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	h,a
	ld	a,l
	sub	a, #0x04
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00127$
;src/main.c:236: actual->lanzado = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:237: actual->direccion = M_derecha;
	ld	0 (iy), #0x00
;src/main.c:238: actual->x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	(bc),a
;src/main.c:239: actual->y=prota.y + G_HERO_H /2;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	(de),a
;src/main.c:240: actual->sprite=g_knifeX_0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_g_knifeX_0)
	inc	hl
	ld	(hl),#>(_g_knifeX_0)
;src/main.c:241: actual->eje = E_X;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:242: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	jp	00127$
00122$:
;src/main.c:245: else if(prota.mira == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00119$
;src/main.c:246: if( (prota.x - 4 ) >= G_KNIFEX_1_W + 1){
	ld	hl, #_prota + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xFC
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,l
	sub	a, #0x04
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00127$
;src/main.c:247: actual->lanzado = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:248: actual->direccion = M_izquierda;
	ld	0 (iy), #0x01
;src/main.c:249: actual->x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFD
	ld	(bc),a
;src/main.c:250: actual->y = prota.y + G_HERO_H /2;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	(de),a
;src/main.c:251: actual->sprite = g_knifeX_1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_g_knifeX_1)
	inc	hl
	ld	(hl),#>(_g_knifeX_1)
;src/main.c:252: actual->eje = E_X;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:253: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	jp	00127$
00119$:
;src/main.c:256: else if(prota.mira == M_abajo){
	ld	a,l
	sub	a, #0x03
	jr	NZ,00116$
;src/main.c:258: if((valor - (prota.y + G_HERO_H)) >= G_KNIFEY_0_H + 1){
	ld	hl, #(_prota + 0x0001) + 0
	ld	l,(hl)
	ld	h,#0x00
	push	de
	ld	de,#0x0016
	add	hl, de
	pop	de
	ld	a,#0xA8
	sub	a, l
	ld	l,a
	ld	a,#0x00
	sbc	a, h
	ld	h,a
	ld	a,l
	sub	a, #0x07
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00127$
;src/main.c:259: actual->lanzado = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:260: actual->direccion = M_abajo;
	ld	0 (iy), #0x03
;src/main.c:261: actual->x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(bc),a
;src/main.c:262: actual->y = prota.y + G_HERO_H;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	(de),a
;src/main.c:263: actual->sprite = g_knifeY_0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_g_knifeY_0)
	inc	hl
	ld	(hl),#>(_g_knifeY_0)
;src/main.c:264: actual->eje = E_Y;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:265: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	jr	00127$
00116$:
;src/main.c:268: else if(prota.mira == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00127$
;src/main.c:269: if((prota.y - 8)>= G_KNIFEY_0_H +1 ){
	ld	hl, #(_prota + 0x0001) + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xF8
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	ld	a,l
	sub	a, #0x07
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00127$
;src/main.c:270: actual->lanzado = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:271: actual->direccion = M_arriba;
	ld	0 (iy), #0x02
;src/main.c:272: actual->x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(bc),a
;src/main.c:273: actual->y = prota.y;	
	ld	a, (#(_prota + 0x0001) + 0)
	ld	(de),a
;src/main.c:274: actual->sprite = g_knifeY_1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#<(_g_knifeY_1)
	inc	hl
	ld	(hl),#>(_g_knifeY_1)
;src/main.c:275: actual->eje = E_Y;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:276: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
00127$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:282: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:283: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:285: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:286: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:287: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:288: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:289: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:290: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:291: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:292: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:293: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:294: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:295: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:301: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:303: u8 i = 10 + 1;
	ld	-1 (ix),#0x0B
;src/main.c:304: TKnife* actual = cu;
	ld	de,#_cu+0
;src/main.c:306: while(--i){
00134$:
	dec	-1 (ix)
	ld	a, -1 (ix)
	or	a, a
	jp	Z,00137$
;src/main.c:307: if(actual->lanzado){
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	or	a, a
	jp	Z,00133$
;src/main.c:308: if(actual->direccion == M_derecha){		
	push	de
	pop	iy
	ld	l,7 (iy)
	ld	a,l
	or	a, a
	jr	NZ,00130$
;src/main.c:309: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
	ld	a,(de)
	ld	l,a
	sub	a, #0x49
	ld	a,#0x00
	rla
	or	a, a
	jr	Z,00104$
;src/main.c:310: actual->x++;
	ld	a,l
	inc	a
	ld	(de),a
;src/main.c:312: redibujarCuchillo(actual);
	push	de
	push	de
	call	_redibujarCuchillo
	pop	af
	pop	de
	jp	00133$
00104$:
;src/main.c:314: else if(actual->x >= LIMITE_DERECHO  - G_KNIFEX_0_W){
	or	a, a
	jp	NZ,00133$
;src/main.c:315: borrarCuchillo(actual);
	push	bc
	push	de
	push	de
	call	_borrarCuchillo
	pop	af
	pop	de
	pop	bc
;src/main.c:316: actual->lanzado = NO;
	xor	a, a
	ld	(bc),a
	jp	00133$
00130$:
;src/main.c:319: else if(actual->direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00127$
;src/main.c:309: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
	ld	a,(de)
	ld	l,a
;src/main.c:320: if(actual->x > LIMITE_IZQUIERDO){
	ld	a,#0x04
	sub	a, l
	ld	a,#0x00
	rla
	or	a, a
	jr	Z,00109$
;src/main.c:321: actual->x--;
	ld	c,l
	dec	c
	ld	a,c
	ld	(de),a
;src/main.c:323: redibujarCuchillo(actual);
	push	de
	push	de
	call	_redibujarCuchillo
	pop	af
	pop	de
	jp	00133$
00109$:
;src/main.c:324: }else if(actual->x <= LIMITE_IZQUIERDO){
	or	a, a
	jr	NZ,00133$
;src/main.c:325: borrarCuchillo(actual);
	push	bc
	push	de
	push	de
	call	_borrarCuchillo
	pop	af
	pop	de
	pop	bc
;src/main.c:326: actual->lanzado = NO;
	xor	a, a
	ld	(bc),a
	jr	00133$
00127$:
;src/main.c:330: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	push	de
	pop	iy
	inc	iy
;src/main.c:329: else if(actual->direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	jr	NZ,00124$
;src/main.c:330: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	l, 0 (iy)
	ld	a,l
	sub	a, #0xA2
	ld	a,#0x00
	rla
	or	a, a
	jr	Z,00114$
;src/main.c:331: actual->y++;
	inc	l
	ld	0 (iy), l
;src/main.c:332: actual->y++;
	inc	l
	ld	0 (iy), l
;src/main.c:333: redibujarCuchillo(actual);
	push	de
	push	de
	call	_redibujarCuchillo
	pop	af
	pop	de
	jr	00133$
00114$:
;src/main.c:336: }else if(actual->y >= LIMITE_INFERIOR - G_KNIFEY_0_H ){
	or	a, a
	jr	NZ,00133$
;src/main.c:337: borrarCuchillo(actual);
	push	bc
	push	de
	push	de
	call	_borrarCuchillo
	pop	af
	pop	de
	pop	bc
;src/main.c:338: actual->lanzado = NO;
	xor	a, a
	ld	(bc),a
	jr	00133$
00124$:
;src/main.c:341: else if(actual->direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00133$
;src/main.c:330: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	l, 0 (iy)
;src/main.c:342: if(actual->y > LIMITE_SUPERIOR){
	ld	a,#0x08
	sub	a, l
	ld	a,#0x00
	rla
	or	a, a
	jr	Z,00119$
;src/main.c:343: actual->y--;
	dec	l
	ld	0 (iy), l
;src/main.c:344: actual->y--;
	dec	l
	ld	0 (iy), l
;src/main.c:345: redibujarCuchillo(actual);
	push	de
	push	de
	call	_redibujarCuchillo
	pop	af
	pop	de
	jr	00133$
00119$:
;src/main.c:347: }else if(actual->y <= LIMITE_SUPERIOR){
	or	a, a
	jr	NZ,00133$
;src/main.c:348: borrarCuchillo(actual);
	push	bc
	push	de
	push	de
	call	_borrarCuchillo
	pop	af
	pop	de
	pop	bc
;src/main.c:349: actual->lanzado = NO;
	xor	a, a
	ld	(bc),a
00133$:
;src/main.c:353: ++actual;
	ld	hl,#0x0009
	add	hl,de
	ex	de,hl
	jp	00134$
00137$:
	inc	sp
	pop	ix
	ret
;src/main.c:357: void inicializar() {
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
;src/main.c:360: TKnife* actual = cu;
;src/main.c:362: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:363: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:365: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:366: cpct_akp_musicInit(G_song);
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:367: mapa = g_map1;
	ld	hl,#_g_map1+0
	ld	(_mapa),hl
;src/main.c:368: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:369: dibujarMapa();
	call	_dibujarMapa
;src/main.c:372: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:373: prota.y = prota.py = 80;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x50
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x50
;src/main.c:374: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:375: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:376: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:379: i = 10 + 1;
	ld	c,#0x0B
;src/main.c:382: while(--i){
	ld	de,#_cu
00101$:
	ld	b,c
	dec	b
	ld	a,b
	ld	c,a
	or	a, a
	jr	Z,00103$
;src/main.c:383: actual->x = actual->px = 0;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x00
	xor	a, a
	ld	(de),a
;src/main.c:384: actual->y = actual->py = 0;
	push	de
	pop	iy
	inc	iy
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x00
	ld	0 (iy), #0x00
;src/main.c:385: actual->lanzado = 0;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:386: ++actual;
	ld	hl,#0x0009
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/main.c:390: dibujarProta();
	call	_dibujarProta
	ret
;src/main.c:393: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:396: inicializar();
	call	_inicializar
;src/main.c:397: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:400: while (1) {
00104$:
;src/main.c:403: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:405: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:406: moverCuchillo();
	call	_moverCuchillo
;src/main.c:408: if (prota.mover) {
	ld	a, (#(_prota + 0x0006) + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:410: redibujarProta();
	call	_redibujarProta
;src/main.c:411: prota.mover = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
	.org 0x3F00
_G_song:
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0x31	; 49	'1'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x0F	; 15
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x1D	; 29
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x19	; 25
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0D	; 13
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7C	; 124
	.db #0x18	; 24
	.db #0x78	; 120	'x'
	.db #0x0C	; 12
	.db #0x34	; 52	'4'
	.db #0x30	; 48	'0'
	.db #0x2C	; 44
	.db #0x28	; 40
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x1C	; 28
	.db #0x0D	; 13
	.db #0x25	; 37
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x40	; 64
	.db #0x3B	; 59
	.db #0x40	; 64
	.db #0x57	; 87	'W'
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x2F	; 47
	.db #0x40	; 64
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x76	; 118	'v'
	.db #0xE1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x51	; 81	'Q'
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x04	; 4
	.db #0x4F	; 79	'O'
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x02	; 2
	.db #0x4B	; 75	'K'
	.db #0x02	; 2
	.db #0x37	; 55	'7'
	.db #0x04	; 4
	.db #0x4F	; 79	'O'
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x04	; 4
	.db #0x4F	; 79	'O'
	.db #0x04	; 4
	.db #0x37	; 55	'7'
	.db #0x02	; 2
	.db #0x4B	; 75	'K'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
