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
;src/main.c:88: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
;src/main.c:91: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:92: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
;src/main.c:97: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:98: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:99: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1909
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:102: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
;src/main.c:109: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	bc,(_mapa)
	ld	hl, #_prota + 3
	ld	e,(hl)
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
;src/main.c:112: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:113: borrarProta();
	call	_borrarProta
;src/main.c:114: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:115: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:116: dibujarProta();
	jp  _dibujarProta
;src/main.c:119: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:120: if (prota.x > LIMITE_IZQUIERDO) {
	ld	bc,#_prota+0
	ld	a,(bc)
	ld	e,a
	ld	a,#0x04
	sub	a, e
	ret	NC
;src/main.c:121: prota.x--;
	dec	e
	ld	a,e
	ld	(bc),a
;src/main.c:122: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:123: prota.mira=M_izquierda;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
	ret
;src/main.c:128: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:129: if (prota.x < LIMITE_DERECHO - G_HERO_W) {
	ld	hl,#_prota+0
	ld	c,(hl)
	ld	a,c
	sub	a, #0x43
	ret	NC
;src/main.c:130: prota.x++;
	inc	c
	ld	(hl),c
;src/main.c:131: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:132: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
	ret
;src/main.c:136: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:137: if (prota.y > LIMITE_SUPERIOR) {
	ld	hl,#_prota + 1
	ld	c,(hl)
	ld	a,#0x08
	sub	a, c
	ret	NC
;src/main.c:138: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:139: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:140: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
	ret
;src/main.c:144: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:145: if(prota.y < LIMITE_INFERIOR - G_HERO_H){
	ld	hl,#_prota + 1
	ld	c,(hl)
	ld	a,c
	sub	a, #0x7F
	ret	NC
;src/main.c:146: prota.y++;
	inc	c
	ld	(hl),c
;src/main.c:147: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:148: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
	ret
;src/main.c:152: void dibujarCuchillo(u8 eje) {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:153: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
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
;src/main.c:155: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	inc	sp
	inc	sp
	push	hl
;src/main.c:154: if(eje == E_X){
	ld	a,4 (ix)
	or	a, a
	jr	NZ,00104$
;src/main.c:155: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
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
;src/main.c:158: else if(eje == E_Y){
	ld	a,4 (ix)
	dec	a
	jr	NZ,00106$
;src/main.c:159: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
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
;src/main.c:163: void borrarCuchillo() {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:164: u8 w = 2 + (cu.px & 1);
	ld	hl, #_cu + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:165: u8 h = 2 + (cu.py & 3 ? 1 : 0);
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
;src/main.c:166: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:169: void redibujarCuchillo() {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
;src/main.c:170: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:171: cu.px = cu.x;
	ld	a, (#_cu + 0)
	ld	(#(_cu + 0x0002)),a
;src/main.c:172: cu.py = cu.y;
	ld	a, (#_cu + 1)
	ld	(#(_cu + 0x0003)),a
;src/main.c:173: dibujarCuchillo(cu.eje);
	ld	hl, #_cu + 8
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
;src/main.c:177: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
;src/main.c:178: cu.lanzado = SI;
	ld	de,#_cu+0
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:179: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	c,(hl)
;src/main.c:180: cu.direccion = M_derecha;
;src/main.c:182: cu.y=prota.y + G_HERO_H /2;	
;src/main.c:183: cu.sprite=g_knifeX_0;
;src/main.c:184: cu.eje = E_X;
;src/main.c:179: if(prota.mira == M_derecha){
	ld	a,c
	or	a, a
	jr	NZ,00110$
;src/main.c:180: cu.direccion = M_derecha;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x00
;src/main.c:181: cu.x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x09
	ld	(de),a
;src/main.c:182: cu.y=prota.y + G_HERO_H /2;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0C
	ld	(#(_cu + 0x0001)),a
;src/main.c:183: cu.sprite=g_knifeX_0;
	ld	hl,#_g_knifeX_0
	ld	((_cu + 0x0004)), hl
;src/main.c:184: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:185: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
00110$:
;src/main.c:187: else if(prota.mira == M_izquierda){
	ld	a,c
	dec	a
	jr	NZ,00107$
;src/main.c:188: cu.direccion = M_izquierda;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x01
;src/main.c:189: cu.x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFD
	ld	(de),a
;src/main.c:190: cu.y = prota.y + G_HERO_H /2;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0C
	ld	(#(_cu + 0x0001)),a
;src/main.c:191: cu.sprite = g_knifeX_1;
	ld	hl,#_g_knifeX_1
	ld	((_cu + 0x0004)), hl
;src/main.c:192: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:193: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
00107$:
;src/main.c:195: else if(prota.mira == M_abajo){
	ld	a,c
	sub	a, #0x03
	jr	NZ,00104$
;src/main.c:196: cu.direccion = M_abajo;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x03
;src/main.c:197: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x04
	ld	(de),a
;src/main.c:198: cu.y = prota.y + G_HERO_H + 10;	
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x23
	ld	(#(_cu + 0x0001)),a
;src/main.c:199: cu.sprite = g_knifeY_0;
	ld	hl,#_g_knifeY_0
	ld	((_cu + 0x0004)), hl
;src/main.c:200: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:201: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
00104$:
;src/main.c:203: else if(prota.mira == M_arriba){
	ld	a,c
	sub	a, #0x02
	ret	NZ
;src/main.c:204: cu.direccion = M_arriba;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x02
;src/main.c:205: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x04
	ld	(de),a
;src/main.c:206: cu.y = prota.y;	
	ld	a, (#(_prota + 0x0001) + 0)
	ld	(#(_cu + 0x0001)),a
;src/main.c:207: cu.sprite = g_knifeY_1;
	ld	hl,#_g_knifeY_1
	ld	((_cu + 0x0004)), hl
;src/main.c:208: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:209: dibujarCuchillo(cu.eje);
	ld	hl, #(_cu + 0x0008) + 0
	ld	b,(hl)
	push	bc
	inc	sp
	call	_dibujarCuchillo
	inc	sp
	ret
;src/main.c:213: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:214: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:216: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:217: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:218: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:219: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:220: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:221: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:222: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:223: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:224: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:225: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:226: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:232: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
;src/main.c:234: if(cu.direccion == M_derecha){		
	ld	bc,#_cu+0
	ld	hl, #_cu + 7
	ld	e,(hl)
;src/main.c:241: cu.lanzado = NO;
;src/main.c:234: if(cu.direccion == M_derecha){		
	ld	a,e
	or	a, a
	jr	NZ,00130$
;src/main.c:235: if(cu.x< LIMITE_DERECHO - G_KNIFEX_0_W){
	ld	a,(bc)
	ld	e,a
	sub	a, #0x49
	jr	NC,00104$
;src/main.c:236: cu.x++;
	inc	e
	ld	a,e
	ld	(bc),a
;src/main.c:237: redibujarCuchillo();
	jp  _redibujarCuchillo
00104$:
;src/main.c:239: else if(cu.x == LIMITE_DERECHO  - G_KNIFEX_0_W){
	ld	a,e
	sub	a, #0x49
	ret	NZ
;src/main.c:240: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:241: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
00130$:
;src/main.c:244: else if(cu.direccion == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00127$
;src/main.c:245: if(cu.x > LIMITE_IZQUIERDO){
	ld	a,(bc)
	ld	e,a
	ld	a,#0x04
	sub	a, e
	jr	NC,00109$
;src/main.c:246: cu.x--;
	dec	e
	ld	a,e
	ld	(bc),a
;src/main.c:247: redibujarCuchillo();
	jp  _redibujarCuchillo
00109$:
;src/main.c:248: }else if(cu.x == LIMITE_IZQUIERDO){
	ld	a,e
	sub	a, #0x04
	ret	NZ
;src/main.c:249: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:250: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
00127$:
;src/main.c:254: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	l, c
	ld	h, b
	inc	hl
;src/main.c:253: else if(cu.direccion == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00124$
;src/main.c:254: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	c,(hl)
	ld	a,c
	sub	a, #0x92
	jr	NC,00114$
;src/main.c:255: cu.y++;
	inc	c
	ld	(hl),c
;src/main.c:256: redibujarCuchillo();
	jp  _redibujarCuchillo
00114$:
;src/main.c:257: }else if(cu.y == LIMITE_INFERIOR - G_KNIFEY_0_H){
	ld	a,c
	sub	a, #0x92
	ret	NZ
;src/main.c:258: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:259: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
00124$:
;src/main.c:262: else if(cu.direccion == M_arriba){
	ld	a,e
	sub	a, #0x02
	ret	NZ
;src/main.c:263: if(cu.y > LIMITE_SUPERIOR){
	ld	c,(hl)
	ld	a,#0x08
	sub	a, c
	jr	NC,00119$
;src/main.c:264: cu.y--;
	dec	c
	ld	(hl),c
;src/main.c:265: redibujarCuchillo();
	jp  _redibujarCuchillo
00119$:
;src/main.c:266: }else if(cu.y == LIMITE_SUPERIOR){
	ld	a,c
	sub	a, #0x08
	ret	NZ
;src/main.c:267: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:268: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
	ret
;src/main.c:273: void inicializar() {
;	---------------------------------
; Function inicializar
; ---------------------------------
_inicializar::
;src/main.c:274: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:275: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:277: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:278: cpct_akp_musicInit(G_song);
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:279: mapa = g_map1;
	ld	hl,#_g_map1+0
	ld	(_mapa),hl
;src/main.c:280: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:281: dibujarMapa();
	call	_dibujarMapa
;src/main.c:284: prota.x = prota.px = 0;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_prota
	ld	(hl),#0x00
;src/main.c:285: prota.y = prota.py = 80;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x50
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x50
;src/main.c:286: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:287: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:288: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:289: cu.x = cu.px =0;
	ld	de,#_cu+0
	ld	bc,#_cu + 2
	xor	a, a
	ld	(bc),a
	xor	a, a
	ld	(de),a
;src/main.c:290: cu.x = cu.px = 0;
	xor	a, a
	ld	(bc),a
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:291: cu.lanzado=0;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:293: dibujarProta();
	call	_dibujarProta
	ret
;src/main.c:296: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:299: inicializar();
	call	_inicializar
;src/main.c:300: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:303: while (1) {
00106$:
;src/main.c:306: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:308: if(cu.lanzado){
	ld	a, (#(_cu + 0x0006) + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:309: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:310: moverCuchillo();
	call	_moverCuchillo
00102$:
;src/main.c:312: if (prota.mover) {
	ld	a, (#(_prota + 0x0006) + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:313: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:314: redibujarProta();
	call	_redibujarProta
;src/main.c:315: prota.mover = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
00104$:
;src/main.c:317: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00106$
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
