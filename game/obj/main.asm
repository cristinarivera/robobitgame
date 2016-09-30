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
	.globl _availableCycles
	.globl _availableMicroSecs
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
	.ds 9
_mapa::
	.ds 2
_availableMicroSecs::
	.ds 1
_availableCycles::
	.ds 1
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
<<<<<<< HEAD
;src/main.c:47: cpctm_createTransparentMaskTable(g_tablatrans, 0x3F00, M0, 0); // es el color 8 - 4D - FF00FF
=======
;src/main.c:86: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0);
>>>>>>> disparo_principal
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
<<<<<<< HEAD
	.org 0x3F00 
=======
	.org 0x3E00 
>>>>>>> disparo_principal
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
<<<<<<< HEAD
;src/main.c:49: void dibujarMapa() {
=======
;src/main.c:88: void dibujarMapa() {
>>>>>>> disparo_principal
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
<<<<<<< HEAD
;src/main.c:50: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
=======
;src/main.c:89: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
>>>>>>> disparo_principal
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
<<<<<<< HEAD
;src/main.c:55: void dibujarProta() {
=======
;src/main.c:94: void dibujarProta() {
>>>>>>> disparo_principal
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
<<<<<<< HEAD
;src/main.c:56: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
=======
;src/main.c:95: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
>>>>>>> disparo_principal
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
<<<<<<< HEAD
;src/main.c:57: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
=======
;src/main.c:96: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
>>>>>>> disparo_principal
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1909
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
<<<<<<< HEAD
;src/main.c:60: void borrarProta() {
=======
;src/main.c:99: void borrarProta() {
>>>>>>> disparo_principal
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
<<<<<<< HEAD
;src/main.c:67: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	bc,(_mapa)
	ld	hl, #_prota + 3
	ld	e,(hl)
=======
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:100: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:101: u8 h = 7 + (prota.py & 3 ? 1 : 0);
	ld	hl, #_prota + 3
	ld	e,(hl)
	ld	a,e
	and	a, #0x03
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x07
	ld	-1 (ix),a
;src/main.c:102: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	iy,(_mapa)
>>>>>>> disparo_principal
	ld	d,#0x00
	ld	h,e
	ld	l,d
	bit	7, d
	jr	Z,00103$
	inc	de
	inc	de
	inc	de
	ld	h,e
	ld	l,d
00103$:
	ld	e, h
	ld	d, l
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, (#_prota + 2)
	srl	a
	ld	d,a
	push	bc
	ld	hl,#0xC000
	push	hl
	ld	hl,#0x2808
	push	hl
	ld	a,#0x05
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
<<<<<<< HEAD
;src/main.c:70: void redibujarProta() {
=======
;src/main.c:105: void redibujarProta() {
>>>>>>> disparo_principal
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
<<<<<<< HEAD
;src/main.c:71: borrarProta();
	call	_borrarProta
;src/main.c:72: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:73: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:74: dibujarProta();
	jp  _dibujarProta
;src/main.c:77: void moverIzquierda() {
=======
;src/main.c:106: borrarProta();
	call	_borrarProta
;src/main.c:107: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:108: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:109: dibujarProta();
	jp  _dibujarProta
;src/main.c:112: void moverIzquierda() {
>>>>>>> disparo_principal
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
<<<<<<< HEAD
;src/main.c:78: if (prota.x > 0) {
	ld	bc,#_prota+0
	ld	a,(bc)
	or	a, a
	ret	Z
;src/main.c:79: prota.x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:80: prota.mover  = SI;
=======
;src/main.c:113: if (prota.x > LIMITE_IZQUIERDO) {
	ld	bc,#_prota+0
	ld	a,(bc)
	ld	e,a
	ld	a,#0x04
	sub	a, e
	ret	NC
;src/main.c:114: prota.x--;
	dec	e
	ld	a,e
	ld	(bc),a
;src/main.c:115: prota.mover  = SI;
>>>>>>> disparo_principal
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:116: prota.mira=M_izquierda;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
	ret
<<<<<<< HEAD
;src/main.c:84: void moverDerecha() {
=======
;src/main.c:121: void moverDerecha() {
>>>>>>> disparo_principal
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
<<<<<<< HEAD
;src/main.c:85: if (prota.x < LIMITE_DERECHO) {
	ld	hl,#_prota+0
	ld	c,(hl)
	ld	a,c
	sub	a, #0x47
	ret	NC
;src/main.c:86: prota.x++;
	inc	c
	ld	(hl),c
;src/main.c:87: prota.mover  = SI;
=======
;src/main.c:122: if (prota.x < LIMITE_DERECHO - G_HERO_W) {
	ld	hl,#_prota+0
	ld	c,(hl)
	ld	a,c
	sub	a, #0x44
	ret	NC
;src/main.c:123: prota.x++;
	inc	c
	ld	(hl),c
;src/main.c:124: prota.mover  = SI;
>>>>>>> disparo_principal
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:125: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
	ret
<<<<<<< HEAD
;src/main.c:91: void moverArriba() {
=======
;src/main.c:129: void moverArriba() {
>>>>>>> disparo_principal
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
<<<<<<< HEAD
;src/main.c:92: if (prota.y > 0) {
	ld	bc,#_prota + 1
	ld	a,(bc)
	or	a, a
	ret	Z
;src/main.c:93: prota.y--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:94: prota.mover  = SI;
=======
;src/main.c:130: if (prota.y > LIMITE_SUPERIOR) {
	ld	hl,#_prota + 1
	ld	c,(hl)
	ld	a,#0x08
	sub	a, c
	ret	NC
;src/main.c:131: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:132: prota.mover  = SI;
>>>>>>> disparo_principal
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:133: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
	ret
<<<<<<< HEAD
;src/main.c:98: void moverAbajo() {
=======
;src/main.c:137: void moverAbajo() {
>>>>>>> disparo_principal
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
<<<<<<< HEAD
;src/main.c:99: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:100: prota.mover  = SI;
=======
;src/main.c:138: if(prota.y < LIMITE_INFERIOR - G_HERO_H){
	ld	hl,#_prota + 1
	ld	c,(hl)
	ld	a,c
	sub	a, #0x7D
	ret	NC
;src/main.c:139: prota.y++;
	inc	c
	ld	(hl),c
;src/main.c:140: prota.mover  = SI;
>>>>>>> disparo_principal
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:141: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
	ret
;src/main.c:145: void dibujarCuchillo(u8 eje) {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:146: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
	ld	hl, #_cu + 1
	ld	d,(hl)
	ld	hl, #_cu + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:148: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	inc	sp
	inc	sp
	push	hl
;src/main.c:147: if(eje == E_X){
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00104$
;src/main.c:148: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	ld	bc, (#(_cu + 0x0004) + 0)
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
;src/main.c:151: else if(eje == E_Y){
	ld	a,4 (ix)
	dec	a
	jr	NZ,00106$
;src/main.c:152: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	ld	bc, (#(_cu + 0x0004) + 0)
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
;src/main.c:156: void borrarCuchillo() {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:157: u8 w = 2 + (cu.px & 1);
	ld	hl, #_cu + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:158: u8 h = 2 + (cu.py & 3 ? 1 : 0);
	ld	hl, #_cu + 3
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
;src/main.c:159: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:162: void redibujarCuchillo() {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
;src/main.c:163: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:164: cu.px = cu.x;
	ld	a, (#_cu + 0)
	ld	(#(_cu + 0x0002)),a
;src/main.c:165: cu.py = cu.y;
	ld	a, (#_cu + 1)
	ld	(#(_cu + 0x0003)),a
;src/main.c:166: dibujarCuchillo(cu.eje);
	ld	hl, #_cu + 8
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
;src/main.c:170: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
;src/main.c:171: cu.lanzado = SI;
	ld	de,#_cu+0
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:172: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	c,(hl)
;src/main.c:173: cu.direccion = M_derecha;
;src/main.c:175: cu.y=prota.y + G_HERO_H /2;	
;src/main.c:176: cu.sprite=g_knifeX_0;
;src/main.c:177: cu.eje = E_X;
;src/main.c:172: if(prota.mira == M_derecha){
	ld	a,c
	or	a, a
	jr	NZ,00110$
;src/main.c:173: cu.direccion = M_derecha;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x00
;src/main.c:174: cu.x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x08
	ld	(de),a
;src/main.c:175: cu.y=prota.y + G_HERO_H /2;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0D
	ld	(#(_cu + 0x0001)),a
;src/main.c:176: cu.sprite=g_knifeX_0;
	ld	hl,#_g_knifeX_0
	ld	((_cu + 0x0004)), hl
;src/main.c:177: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:178: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
00110$:
;src/main.c:180: else if(prota.mira == M_izquierda){
	ld	a,c
	dec	a
	jr	NZ,00107$
;src/main.c:181: cu.direccion = M_izquierda;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x01
;src/main.c:182: cu.x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFD
	ld	(de),a
;src/main.c:183: cu.y = prota.y + G_HERO_H /2;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0D
	ld	(#(_cu + 0x0001)),a
;src/main.c:184: cu.sprite = g_knifeX_1;
	ld	hl,#_g_knifeX_1
	ld	((_cu + 0x0004)), hl
;src/main.c:185: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:186: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
00107$:
;src/main.c:188: else if(prota.mira == M_abajo){
	ld	a,c
	sub	a, #0x03
	jr	NZ,00104$
;src/main.c:189: cu.direccion = M_abajo;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x03
;src/main.c:190: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x04
	ld	(de),a
;src/main.c:191: cu.y = prota.y + G_HERO_H + 10;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x25
	ld	(#(_cu + 0x0001)),a
;src/main.c:192: cu.sprite = g_knifeY_0;
	ld	hl,#_g_knifeY_0
	ld	((_cu + 0x0004)), hl
;src/main.c:193: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:194: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
00104$:
;src/main.c:196: else if(prota.mira == M_arriba){
	ld	a,c
	sub	a, #0x02
	ret	NZ
;src/main.c:197: cu.direccion = M_arriba;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x02
;src/main.c:198: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x04
	ld	(de),a
;src/main.c:199: cu.y = prota.y;	
	ld	a, (#(_prota + 0x0001) + 0)
	ld	(#(_cu + 0x0001)),a
;src/main.c:200: cu.sprite = g_knifeY_1;
	ld	hl,#_g_knifeY_1
	ld	((_cu + 0x0004)), hl
;src/main.c:201: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:202: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
<<<<<<< HEAD
;src/main.c:103: void comprobarTeclado() {
=======
;src/main.c:206: void comprobarTeclado() {
>>>>>>> disparo_principal
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
<<<<<<< HEAD
;src/main.c:104: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:106: if (cpct_isAnyKeyPressed()) {
=======
;src/main.c:207: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:209: if (cpct_isAnyKeyPressed()) {
>>>>>>> disparo_principal
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
<<<<<<< HEAD
;src/main.c:107: if (cpct_isKeyPressed(Key_CursorLeft))
=======
;src/main.c:210: if (cpct_isKeyPressed(Key_CursorLeft))
>>>>>>> disparo_principal
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
<<<<<<< HEAD
;src/main.c:108: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:109: else if (cpct_isKeyPressed(Key_CursorRight))
=======
;src/main.c:211: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:212: else if (cpct_isKeyPressed(Key_CursorRight))
>>>>>>> disparo_principal
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
<<<<<<< HEAD
;src/main.c:110: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:111: else if (cpct_isKeyPressed(Key_CursorUp))
=======
;src/main.c:213: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:214: else if (cpct_isKeyPressed(Key_CursorUp))
>>>>>>> disparo_principal
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
<<<<<<< HEAD
;src/main.c:112: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:113: else if (cpct_isKeyPressed(Key_CursorDown))
=======
;src/main.c:215: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:216: else if (cpct_isKeyPressed(Key_CursorDown))
>>>>>>> disparo_principal
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:217: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:218: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
<<<<<<< HEAD
;src/main.c:114: moverAbajo();
	jp  _moverAbajo
;src/main.c:118: void inicializar() {
=======
;src/main.c:219: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:225: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
;src/main.c:227: if(cu.direccion == M_derecha){		
	ld	bc,#_cu+0
	ld	hl, #_cu + 7
	ld	e,(hl)
;src/main.c:234: cu.lanzado = NO;
;src/main.c:227: if(cu.direccion == M_derecha){		
	ld	a,e
	or	a, a
	jr	NZ,00130$
;src/main.c:228: if(cu.x< LIMITE_DERECHO - G_KNIFEX_0_W){
	ld	a,(bc)
	ld	e,a
	sub	a, #0x49
	jr	NC,00104$
;src/main.c:229: cu.x++;
	inc	e
	ld	a,e
	ld	(bc),a
;src/main.c:230: redibujarCuchillo();
	jp  _redibujarCuchillo
00104$:
;src/main.c:232: else if(cu.x == LIMITE_DERECHO  - G_KNIFEX_0_W){
	ld	a,e
	sub	a, #0x49
	ret	NZ
;src/main.c:233: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:234: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
00130$:
;src/main.c:237: else if(cu.direccion == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00127$
;src/main.c:238: if(cu.x > LIMITE_IZQUIERDO){
	ld	a,(bc)
	ld	e,a
	ld	a,#0x04
	sub	a, e
	jr	NC,00109$
;src/main.c:239: cu.x--;
	dec	e
	ld	a,e
	ld	(bc),a
;src/main.c:240: redibujarCuchillo();
	jp  _redibujarCuchillo
00109$:
;src/main.c:241: }else if(cu.x == LIMITE_IZQUIERDO){
	ld	a,e
	sub	a, #0x04
	ret	NZ
;src/main.c:242: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:243: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
00127$:
;src/main.c:247: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	l, c
	ld	h, b
	inc	hl
;src/main.c:246: else if(cu.direccion == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00124$
;src/main.c:247: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	c,(hl)
	ld	a,c
	sub	a, #0x92
	jr	NC,00114$
;src/main.c:248: cu.y++;
	inc	c
	ld	(hl),c
;src/main.c:249: redibujarCuchillo();
	jp  _redibujarCuchillo
00114$:
;src/main.c:250: }else if(cu.y == LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	a,c
	sub	a, #0x92
	ret	NZ
;src/main.c:251: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:252: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
00124$:
;src/main.c:255: else if(cu.direccion == M_arriba){
	ld	a,e
	sub	a, #0x02
	ret	NZ
;src/main.c:256: if(cu.y > LIMITE_SUPERIOR){
	ld	c,(hl)
	ld	a,#0x08
	sub	a, c
	jr	NC,00119$
;src/main.c:257: cu.y--;
	dec	c
	ld	(hl),c
;src/main.c:258: redibujarCuchillo();
	jp  _redibujarCuchillo
00119$:
;src/main.c:259: }else if(cu.y == LIMITE_SUPERIOR){
	ld	a,c
	sub	a, #0x08
	ret	NZ
;src/main.c:260: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:261: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
;src/main.c:266: void inicializar() {
>>>>>>> disparo_principal
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
<<<<<<< HEAD
;src/main.c:119: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:120: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:122: cpct_setPalette(g_palette, 16);
=======
;src/main.c:267: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:268: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:270: cpct_setPalette(g_palette, 16);
>>>>>>> disparo_principal
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
<<<<<<< HEAD
;src/main.c:123: cpct_akp_musicInit(G_song);
=======
;src/main.c:271: cpct_akp_musicInit(G_song);
>>>>>>> disparo_principal
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
<<<<<<< HEAD
;src/main.c:124: mapa = g_map1;
	ld	hl,#_g_map1+0
	ld	(_mapa),hl
;src/main.c:125: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:126: dibujarMapa();
	call	_dibujarMapa
;src/main.c:129: prota.x = prota.px = 15;
=======
;src/main.c:272: mapa = g_map1;
	ld	hl,#_g_map1+0
	ld	(_mapa),hl
;src/main.c:273: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:274: dibujarMapa();
	call	_dibujarMapa
;src/main.c:277: prota.x = prota.px = 0;
>>>>>>> disparo_principal
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_prota
<<<<<<< HEAD
	ld	(hl),#0x0F
;src/main.c:130: prota.y = prota.py = 120;
=======
	ld	(hl),#0x00
;src/main.c:278: prota.y = prota.py = 80;
>>>>>>> disparo_principal
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x50
	ld	hl,#(_prota + 0x0001)
<<<<<<< HEAD
	ld	(hl),#0x78
;src/main.c:131: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:132: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:133: dibujarProta();
	call	_dibujarProta
	ret
;src/main.c:137: void main(void) {
=======
	ld	(hl),#0x50
;src/main.c:279: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:280: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:281: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:282: cu.x = cu.px =0;
	ld	de,#_cu+0
	ld	bc,#_cu + 2
	xor	a, a
	ld	(bc),a
	xor	a, a
	ld	(de),a
;src/main.c:283: cu.x = cu.px = 0;
	xor	a, a
	ld	(bc),a
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:284: cu.lanzado=0;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:286: dibujarProta();
	call	_dibujarProta
	ret
;src/main.c:289: void main(void) {
>>>>>>> disparo_principal
;	---------------------------------
; Function main
; ---------------------------------
_main::
<<<<<<< HEAD
;src/main.c:138: inicializar();
	call	_inicializar
;src/main.c:139: while (1) {
00104$:
;src/main.c:140: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:141: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:142: if (prota.mover) {
	ld	bc,#_prota+6
	ld	a,(bc)
	or	a, a
	jr	Z,00102$
;src/main.c:143: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:144: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00102$:
;src/main.c:146: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00104$
=======
;src/main.c:292: inicializar();
	call	_inicializar
;src/main.c:293: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:296: while (1) {
00106$:
;src/main.c:299: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:301: if(cu.lanzado){
	ld	a, (#(_cu + 0x0006) + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:302: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:303: moverCuchillo();
	call	_moverCuchillo
00102$:
;src/main.c:305: if (prota.mover) {
	ld	a, (#(_prota + 0x0006) + 0)
	or	a, a
	jr	Z,00106$
;src/main.c:306: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:307: redibujarProta();
	call	_redibujarProta
;src/main.c:308: prota.mover = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
	jr	00106$
>>>>>>> disparo_principal
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
	.org 0x0200
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
