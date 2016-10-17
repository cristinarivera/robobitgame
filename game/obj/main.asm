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
	.globl _inicializarJuego
	.globl _inicializarCPC
	.globl _menuInicio
	.globl _menuFin
	.globl _borrarPantallaAbajo
	.globl _barraPuntuacionInicial
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
	.globl _avanzarMapa
	.globl _moverEnemigoAbajo
	.globl _moverEnemigoArriba
	.globl _moverEnemigo
	.globl _checkEnemyCollision
	.globl _redibujarEnemigo
	.globl _borrarEnemigo
	.globl _dibujarEnemigo
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
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM0
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _num_mapa
	.globl _mapa
	.globl _cu
	.globl _prota
	.globl _enemy
	.globl _EEje
	.globl _EMirar
	.globl _mapas
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
_enemy::
	.ds 8
_prota::
	.ds 8
_cu::
	.ds 90
_mapa::
	.ds 2
_num_mapa::
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
;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
;src/main.c:114: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
_mapas:
	.dw _g_map1
	.dw _g_map2
	.dw _g_map3
;src/main.c:120: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:125: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:127: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:137: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:138: borrarProta();
	call	_borrarProta
;src/main.c:139: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:140: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:141: dibujarProta();
	jp  _dibujarProta
;src/main.c:144: u8* getTilePtr(u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
;src/main.c:145: return mapa + (y/4)*g_map1_W + x/2;
	ld	hl, #3+0
	add	hl, sp
	ld	c, (hl)
	srl	c
	srl	c
	ld	b,#0x00
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
;src/main.c:148: u8 checkCollision(int direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/main.c:151: switch (direction) {
	bit	7, 5 (ix)
	jp	NZ,00105$
	ld	a,#0x03
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	M,00105$
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00129$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00129$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
;src/main.c:152: case 0:
00101$:
;src/main.c:153: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
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
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:154: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x14
	ld	b,a
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
;src/main.c:155: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
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
;src/main.c:156: break;
	jp	00105$
;src/main.c:157: case 1:
00102$:
;src/main.c:158: headTile  = getTilePtr(prota.x - 1, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_prota + 0
	ld	d,(hl)
	dec	d
	ld	c, d
	push	bc
	call	_getTilePtr
	pop	af
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:159: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x14
	ld	b,a
	ld	hl, #_prota + 0
	ld	d,(hl)
	dec	d
	ld	c, d
	push	bc
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:160: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
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
;src/main.c:161: break;
	jr	00105$
;src/main.c:162: case 2:
00103$:
;src/main.c:163: headTile   = getTilePtr(prota.x, prota.y - 2);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	dec	b
	dec	b
	ld	hl, #_prota + 0
	ld	c, (hl)
	push	bc
	call	_getTilePtr
	pop	af
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:164: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	ld	b,a
	dec	b
	dec	b
	ld	a, (#_prota + 0)
	add	a, #0x03
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:165: *waistTile = 0;
	xor	a, a
	ld	(de),a
;src/main.c:166: break;
	jr	00105$
;src/main.c:167: case 3:
00104$:
;src/main.c:168: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	b,a
	ld	hl, #_prota + 0
	ld	c, (hl)
	push	bc
	call	_getTilePtr
	pop	af
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:169: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	b,a
	ld	a, (#_prota + 0)
	add	a, #0x03
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
;src/main.c:170: *waistTile = 0;
	xor	a, a
	ld	(de),a
;src/main.c:172: }
00105$:
;src/main.c:174: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jr	C,00106$
	ld	a,(bc)
	ld	c,a
	ld	a,#0x02
	sub	a, c
	jr	C,00106$
	ld	a,(de)
	ld	c,a
	ld	a,#0x02
	sub	a, c
	jr	NC,00107$
00106$:
;src/main.c:175: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:177: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:181: void dibujarEnemigo() {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
;src/main.c:182: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
	ld	hl, #_enemy + 1
	ld	d,(hl)
	ld	hl, #_enemy + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:183: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
	ld	bc, (#_enemy + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1604
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:186: void borrarEnemigo() {
;	---------------------------------
; Function borrarEnemigo
; ---------------------------------
_borrarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:188: u8 w = 4 + (enemy.px & 1);
	ld	hl, #_enemy + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:191: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
	ld	hl, #_enemy + 3
	ld	e,(hl)
	bit	1, e
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x07
	ld	-1 (ix),a
;src/main.c:193: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:198: void redibujarEnemigo() {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
;src/main.c:199: borrarEnemigo();
	call	_borrarEnemigo
;src/main.c:200: enemy.px = enemy.x;
	ld	bc,#_enemy + 2
	ld	a, (#_enemy + 0)
	ld	(bc),a
;src/main.c:201: enemy.py = enemy.y;
	ld	bc,#_enemy + 3
	ld	a, (#_enemy + 1)
	ld	(bc),a
;src/main.c:202: dibujarEnemigo();
	jp  _dibujarEnemigo
;src/main.c:205: u8 checkEnemyCollision(int direction){
;	---------------------------------
; Function checkEnemyCollision
; ---------------------------------
_checkEnemyCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:207: u8 colisiona = 1;
	ld	-4 (ix),#0x01
;src/main.c:209: switch (direction) {
	bit	7, 5 (ix)
	jp	NZ,00135$
	ld	a,#0x03
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jp	PO, 00194$
	xor	a, #0x80
00194$:
	jp	M,00135$
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00195$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00195$:
	jp	00135$
	jp	00135$
	jp	00119$
	jp	00103$
;src/main.c:210: case 0:
;src/main.c:212: break;
	jp	00135$
;src/main.c:213: case 1:
;src/main.c:215: break;
	jp	00135$
;src/main.c:216: case 3:
00103$:
;src/main.c:219: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
	ld	a, (#(_enemy + 0x0001) + 0)
	add	a, #0x18
	ld	d,a
	ld	hl, #_enemy + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,(hl)
;src/main.c:232: enemy.mira = M_arriba;
;src/main.c:219: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
	ld	a,#0x02
	sub	a, c
	jp	C,00115$
;src/main.c:220: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
	ld	a, (#(_enemy + 0x0001) + 0)
	add	a, #0x18
	ld	d,a
	ld	a, (#_enemy + 0)
	ld	b,a
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00115$
;src/main.c:221: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)			  
	ld	a, (#(_enemy + 0x0001) + 0)
	add	a, #0x18
	ld	b,a
	ld	a, (#_enemy + 0)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00115$
;src/main.c:223: if( (prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W) ){
	ld	hl,#_prota+0
	ld	c,(hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	hl, #_enemy + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00196$
	xor	a, #0x80
00196$:
	jp	M,00110$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00197$
	xor	a, #0x80
00197$:
	jp	P,00111$
00110$:
;src/main.c:224: colisiona = 0;
	ld	-4 (ix),#0x00
	jp	00135$
00111$:
;src/main.c:227: if(prota.y > enemy.y){ //si el prota esta abajo
	ld	hl,#_prota+1
	ld	c,(hl)
	ld	hl, #(_enemy + 0x0001) + 0
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00108$
;src/main.c:228: if( prota.y - (enemy.y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
	ld	b,#0x00
	ld	d,#0x00
	ld	hl,#0x0016
	add	hl,de
	ld	a,c
	sub	a, l
	ld	c,a
	ld	a,b
	sbc	a, h
	ld	b,a
	ld	a,#0x02
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	jp	PO, 00198$
	xor	a, #0x80
00198$:
	jp	P,00105$
;src/main.c:229: colisiona = 0;
	ld	-4 (ix),#0x00
	jp	00135$
00105$:
;src/main.c:232: enemy.mira = M_arriba;
	ld	hl,#(_enemy + 0x0007)
	ld	(hl),#0x02
	jp	00135$
00108$:
;src/main.c:235: colisiona = 0;
	ld	-4 (ix),#0x00
	jp	00135$
00115$:
;src/main.c:239: enemy.mira = M_arriba;
	ld	hl,#(_enemy + 0x0007)
	ld	(hl),#0x02
;src/main.c:241: break;
	jp	00135$
;src/main.c:242: case 2:
00119$:
;src/main.c:243: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
	ld	hl, #(_enemy + 0x0001) + 0
	ld	d,(hl)
	dec	d
	dec	d
	ld	hl, #_enemy + 0
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,(hl)
;src/main.c:257: enemy.mira = M_abajo;
;src/main.c:243: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
	ld	a,#0x02
	sub	a, c
	jp	C,00131$
;src/main.c:244: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
	ld	hl, #(_enemy + 0x0001) + 0
	ld	d,(hl)
	dec	d
	dec	d
	ld	hl, #_enemy + 0
	ld	b,(hl)
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00131$
;src/main.c:245: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
	ld	hl, #(_enemy + 0x0001) + 0
	ld	b,(hl)
	dec	b
	dec	b
	ld	a, (#_enemy + 0)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00131$
;src/main.c:247: if((prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W)){
	ld	hl,#_prota+0
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0003
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	hl, #_enemy + 0
	ld	e,(hl)
	ld	d,#0x00
;src/main.c:243: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
	ld	a,(#(_enemy + 0x0001) + 0)
	ld	-3 (ix),a
;src/main.c:247: if((prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W)){
	ld	a,-2 (ix)
	sub	a, e
	ld	a,-1 (ix)
	sbc	a, d
	jp	PO, 00199$
	xor	a, #0x80
00199$:
	jp	M,00126$
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a,e
	sub	a, c
	ld	a,d
	sbc	a, b
	jp	PO, 00200$
	xor	a, #0x80
00200$:
	jp	P,00127$
00126$:
;src/main.c:248: enemy.y--;
	ld	c,-3 (ix)
	dec	c
	ld	hl,#(_enemy + 0x0001)
	ld	(hl),c
;src/main.c:249: colisiona = 0;
	ld	-4 (ix),#0x00
	jr	00135$
00127$:
;src/main.c:252: if(enemy.y>prota.y){
	ld	hl,#_prota+1
	ld	e,(hl)
	ld	a,e
	sub	a, -3 (ix)
	jr	NC,00124$
;src/main.c:253: if(enemy.y - (prota.y + G_HERO_H -2) >= 2){
	ld	c,-3 (ix)
	ld	b,#0x00
	ld	d,#0x00
	ld	hl,#0x0014
	add	hl,de
	ld	a,c
	sub	a, l
	ld	c,a
	ld	a,b
	sbc	a, h
	ld	b,a
	ld	a,c
	sub	a, #0x02
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00121$
;src/main.c:254: colisiona = 0;
	ld	-4 (ix),#0x00
	jr	00135$
00121$:
;src/main.c:257: enemy.mira = M_abajo;
	ld	hl,#(_enemy + 0x0007)
	ld	(hl),#0x03
	jr	00135$
00124$:
;src/main.c:260: colisiona = 0;
	ld	-4 (ix),#0x00
	jr	00135$
00131$:
;src/main.c:266: enemy.mira = M_abajo;
	ld	hl,#(_enemy + 0x0007)
	ld	(hl),#0x03
;src/main.c:268: }
00135$:
;src/main.c:269: return colisiona;
	ld	l,-4 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:272: void moverEnemigo(){
;	---------------------------------
; Function moverEnemigo
; ---------------------------------
_moverEnemigo::
;src/main.c:274: if(!checkEnemyCollision(enemy.mira)){
	ld	hl,#_enemy+7
	ld	c,(hl)
	ld	b,#0x00
	push	hl
	push	bc
	call	_checkEnemyCollision
	pop	af
	ld	a,l
	pop	hl
	or	a, a
	ret	NZ
;src/main.c:276: switch (enemy.mira) {
	ld	e,(hl)
	ld	a,#0x03
	sub	a, e
	ret	C
	ld	d,#0x00
	ld	hl,#00118$
	add	hl,de
	add	hl,de
;src/main.c:277: case 0:
;src/main.c:279: break;
;src/main.c:280: case 1:
;src/main.c:282: break;
;src/main.c:283: case 2:
	jp	(hl)
00118$:
	jr	00108$
	jr	00108$
	jr	00103$
	jr	00104$
	jr	00108$
	jr	00108$
00103$:
;src/main.c:284: moverEnemigoArriba();
;src/main.c:285: break;
	jp  _moverEnemigoArriba
;src/main.c:286: case 3:
00104$:
;src/main.c:287: moverEnemigoAbajo();
	call	_moverEnemigoAbajo
;src/main.c:289: }
00108$:
	ret
;src/main.c:294: void moverEnemigoArriba(){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
;src/main.c:295: enemy.y--;
	ld	bc,#_enemy+1
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:296: enemy.y--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:297: redibujarEnemigo();
	jp  _redibujarEnemigo
;src/main.c:300: void moverEnemigoAbajo(){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
;src/main.c:301: enemy.y++;
	ld	bc,#_enemy+1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:302: enemy.y++;
	inc	a
	ld	(bc),a
;src/main.c:303: redibujarEnemigo();
	jp  _redibujarEnemigo
;src/main.c:306: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:307: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jp	NC,_menuFin
;src/main.c:308: mapa = mapas[++num_mapa];
	ld	hl, #_num_mapa+0
	inc	(hl)
	ld	iy,#_num_mapa
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_mapas
	add	hl,de
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:309: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:310: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
;src/main.c:311: dibujarMapa();
;src/main.c:315: menuFin();
	ld	(hl), #0x01
	jp	_dibujarMapa
;src/main.c:319: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:320: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:321: if (!checkCollision(M_izquierda)) {
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:322: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:323: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:324: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:328: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:329: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:330: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
	ld	hl,#0x0000
	push	hl
	call	_checkCollision
	pop	af
	ld	b,l
	ld	hl, #_prota + 0
	ld	c,(hl)
	ld	e,c
	ld	d,#0x00
	ld	hl,#0x0007
	add	hl,de
	ld	de, #0x8050
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	ld	a,#0x00
	rla
	ld	e,a
	ld	a,b
	or	a,a
	jr	NZ,00104$
	or	a,e
	jr	Z,00104$
;src/main.c:331: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:332: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:333: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:335: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:336: avanzarMapa();	
	jp  _avanzarMapa
;src/main.c:340: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:341: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:342: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
	ld	hl,#0x0002
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:343: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:344: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:345: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:346: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:350: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:351: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:352: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
	ld	hl,#0x0003
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
	ld	bc,#_prota + 1
	ld	a,(bc)
	ld	e,a
	ld	l,e
	ld	h,#0x00
	push	de
	ld	de,#0x0016
	add	hl, de
	pop	de
	ld	a,l
	sub	a, #0xB0
	ld	a,h
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;src/main.c:353: prota.y++;
	ld	a,e
	inc	a
	ld	(bc),a
;src/main.c:354: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:355: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:356: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:360: void dibujarCuchillo(TKnife* actual) {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:361: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
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
;src/main.c:362: if(actual->eje == E_X){
	ld	l, e
	ld	h, d
	ld	bc, #0x0008
	add	hl, bc
	ld	c,(hl)
;src/main.c:363: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	push	iy
	pop	af
	ld	-3 (ix),a
	push	iy
	dec	sp
	pop	af
	inc	sp
	ld	-4 (ix),a
	ld	hl,#0x0004
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:362: if(actual->eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/main.c:363: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	hl,#0x0404
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00106$
00104$:
;src/main.c:366: else if(actual->eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/main.c:367: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	ld	hl,#0x0802
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:371: void borrarCuchillo(TKnife* actual) {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:372: u8 w = 2 + (actual->px & 1);
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
;src/main.c:373: u8 h = 2 + (actual->py & 3 ? 1 : 0);
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
;src/main.c:374: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:377: void redibujarCuchillo(TKnife* actual) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:378: borrarCuchillo(actual);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarCuchillo
	pop	af
;src/main.c:379: actual->px = actual->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:380: actual->py = actual->y;
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
;src/main.c:381: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	pop	ix
	ret
;src/main.c:385: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/main.c:387: TKnife* actual = cu;
	ld	bc,#_cu+0
;src/main.c:390: while(i>0 && actual->lanzado){
	ld	e,#0x0A
00102$:
	ld	hl,#0x0006
	add	hl,bc
	ex	(sp), hl
	ld	a,e
	or	a, a
	jr	Z,00104$
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00104$
;src/main.c:391: --i;
	dec	e
;src/main.c:392: actual++;
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00102$
00104$:
;src/main.c:395: if(i>0 && !actual->lanzado){
	ld	a,e
	or	a, a
	jp	Z,00127$
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00127$
;src/main.c:397: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	e,(hl)
;src/main.c:399: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
;src/main.c:401: actual->direccion = M_derecha;
	ld	hl,#0x0007
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:403: actual->y=prota.y + G_HERO_H /2;
	ld	hl,#0x0001
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:404: actual->sprite=g_knifeX_0;
	ld	hl,#0x0004
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
;src/main.c:405: actual->eje = E_X;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:397: if(prota.mira == M_derecha){
	ld	a,e
	or	a, a
	jr	NZ,00122$
;src/main.c:399: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	d,a
	ld	a, (#_prota + 0)
	add	a, #0x0C
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00127$
;src/main.c:400: actual->lanzado = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:401: actual->direccion = M_derecha;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:402: actual->x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	(bc),a
;src/main.c:403: actual->y=prota.y + G_HERO_H /2;
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:404: actual->sprite=g_knifeX_0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_g_knifeX_0)
	inc	hl
	ld	(hl),#>(_g_knifeX_0)
;src/main.c:405: actual->eje = E_X;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
;src/main.c:406: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	jp	00127$
00122$:
;src/main.c:409: else if(prota.mira == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00119$
;src/main.c:410: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	d,a
	ld	a, (#_prota + 0)
	add	a,#0xF6
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00127$
;src/main.c:411: actual->lanzado = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:412: actual->direccion = M_izquierda;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:413: actual->x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFC
	ld	(bc),a
;src/main.c:414: actual->y = prota.y + G_HERO_H /2;
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:415: actual->sprite = g_knifeX_1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_g_knifeX_1)
	inc	hl
	ld	(hl),#>(_g_knifeX_1)
;src/main.c:416: actual->eje = E_X;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
;src/main.c:417: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	jp	00127$
00119$:
;src/main.c:420: else if(prota.mira == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00116$
;src/main.c:422: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x1F
	ld	d,a
	ld	a, (#_prota + 0)
	add	a, #0x03
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00127$
;src/main.c:423: actual->lanzado = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:424: actual->direccion = M_abajo;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x03
;src/main.c:425: actual->x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(bc),a
;src/main.c:426: actual->y = prota.y + G_HERO_H;
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:427: actual->sprite = g_knifeY_0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_g_knifeY_0)
	inc	hl
	ld	(hl),#>(_g_knifeY_0)
;src/main.c:428: actual->eje = E_Y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
;src/main.c:429: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
	jr	00127$
00116$:
;src/main.c:432: else if(prota.mira == M_arriba){
	ld	a,e
	sub	a, #0x02
	jr	NZ,00127$
;src/main.c:433: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
	ld	a, (#(_prota + 0x0001) + 0)
	add	a,#0xF7
	ld	d,a
	ld	a, (#_prota + 0)
	add	a, #0x03
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jr	C,00127$
;src/main.c:434: actual->lanzado = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:435: actual->direccion = M_arriba;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
;src/main.c:436: actual->x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(bc),a
;src/main.c:437: actual->y = prota.y;
	ld	a, (#(_prota + 0x0001) + 0)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
;src/main.c:438: actual->sprite = g_knifeY_1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#<(_g_knifeY_1)
	inc	hl
	ld	(hl),#>(_g_knifeY_1)
;src/main.c:439: actual->eje = E_Y;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
;src/main.c:440: dibujarCuchillo(actual);
	push	bc
	call	_dibujarCuchillo
	pop	af
00127$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:446: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:447: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:449: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:450: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:451: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:452: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:453: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:454: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:455: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:456: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:457: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:458: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:459: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:465: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:467: u8 i = 10 + 1;
	ld	-4 (ix),#0x0B
;src/main.c:468: TKnife* actual = cu;
	ld	bc,#_cu+0
;src/main.c:470: while(--i){
00126$:
	dec	-4 (ix)
	ld	a, -4 (ix)
	or	a, a
	jp	Z,00129$
;src/main.c:471: if(actual->lanzado){
	ld	hl,#0x0006
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00125$
;src/main.c:472: if(actual->direccion == M_derecha){
	push	bc
	pop	iy
	ld	l,7 (iy)
;src/main.c:474: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
	ld	e, c
	ld	d, b
	inc	de
;src/main.c:472: if(actual->direccion == M_derecha){
	ld	a,l
	or	a, a
	jr	NZ,00122$
;src/main.c:474: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
	ld	a,(de)
	ld	d,a
	ld	a,(bc)
	add	a, #0x05
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jr	C,00102$
;src/main.c:475: actual->x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:477: redibujarCuchillo(actual);
	push	bc
	push	bc
	call	_redibujarCuchillo
	pop	af
	pop	bc
	jp	00125$
00102$:
;src/main.c:480: borrarCuchillo(actual);
	push	bc
	push	bc
	call	_borrarCuchillo
	pop	af
	pop	bc
;src/main.c:481: actual->lanzado = NO;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
	jp	00125$
00122$:
;src/main.c:484: else if(actual->direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00119$
;src/main.c:485: if(*getTilePtr(actual->x - 1, actual->y) <= 2){
	ld	a,(de)
	ld	d,a
	ld	a,(bc)
	add	a,#0xFF
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jr	C,00105$
;src/main.c:486: actual->x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:488: redibujarCuchillo(actual);
	push	bc
	push	bc
	call	_redibujarCuchillo
	pop	af
	pop	bc
	jp	00125$
00105$:
;src/main.c:490: borrarCuchillo(actual);
	push	bc
	push	bc
	call	_borrarCuchillo
	pop	af
	pop	bc
;src/main.c:491: actual->lanzado = NO;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
	jp	00125$
00119$:
;src/main.c:494: else if(actual->direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	jr	NZ,00116$
;src/main.c:495: if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
	ld	a,(de)
	add	a, #0x0A
	push	af
	ld	a,(bc)
	ld	-1 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	de
	pop	bc
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jr	C,00108$
;src/main.c:496: actual->y++;
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:497: actual->y++;
	inc	a
	ld	(de),a
;src/main.c:498: redibujarCuchillo(actual);
	push	bc
	push	bc
	call	_redibujarCuchillo
	pop	af
	pop	bc
	jr	00125$
00108$:
;src/main.c:502: borrarCuchillo(actual);
	push	bc
	push	bc
	call	_borrarCuchillo
	pop	af
	pop	bc
;src/main.c:503: actual->lanzado = NO;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
	jr	00125$
00116$:
;src/main.c:506: else if(actual->direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00125$
;src/main.c:507: if(*getTilePtr(actual->x, actual->y - 2) <= 2){
	ld	a,(de)
	add	a,#0xFE
	push	af
	ld	a,(bc)
	ld	-1 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	de
	pop	bc
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jr	C,00111$
;src/main.c:508: actual->y--;
	ld	a,(de)
	add	a,#0xFF
	ld	(de),a
;src/main.c:509: actual->y--;
	add	a,#0xFF
	ld	(de),a
;src/main.c:510: redibujarCuchillo(actual);
	push	bc
	push	bc
	call	_redibujarCuchillo
	pop	af
	pop	bc
	jr	00125$
00111$:
;src/main.c:513: borrarCuchillo(actual);
	push	bc
	push	bc
	call	_borrarCuchillo
	pop	af
	pop	bc
;src/main.c:514: actual->lanzado = NO;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
00125$:
;src/main.c:518: ++actual;
	ld	hl,#0x0009
	add	hl,bc
	ld	c,l
	ld	b,h
	jp	00126$
00129$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:521: void barraPuntuacionInicial(){
;	---------------------------------
; Function barraPuntuacionInicial
; ---------------------------------
_barraPuntuacionInicial::
;src/main.c:526: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); // 
	ld	hl,#0xB200
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:527: cpct_drawStringM0("SCORE", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:528: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
	ld	hl,#0xBE00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:529: cpct_drawStringM0("00000", memptr, 15, 0);
	ld	hl,#0x000F
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:532: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
	ld	hl,#0xBE1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:533: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
	ld	hl,#0x0003
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:535: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); // 
	ld	hl,#0xB23C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:536: cpct_drawStringM0("LIVES", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_3
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:538: for(i=0; i<5; i++){
	ld	bc,#0x0000
00102$:
;src/main.c:539: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
	ld	a,c
	add	a, a
	add	a, a
	add	a, #0x3C
	ld	d,a
	push	bc
	ld	a,#0xBE
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
;src/main.c:538: for(i=0; i<5; i++){
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
	.ascii "ROBOBIT"
	.db 0x00
___str_3:
	.ascii "LIVES"
	.db 0x00
;src/main.c:544: void borrarPantallaAbajo(){
;	---------------------------------
; Function borrarPantallaAbajo
; ---------------------------------
_borrarPantallaAbajo::
;src/main.c:546: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // posición para borrar 
	ld	hl,#0xB41A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:548: cpct_drawSolidBox(memptr, 0, 30, 7);  //borra el texto "PULSA I"
	ld	hl,#0x071E
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ret
;src/main.c:551: void menuFin(){
;	---------------------------------
; Function menuFin
; ---------------------------------
_menuFin::
;src/main.c:554: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:556: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
	ld	hl,#0x5A0C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:557: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_4
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:561: do{
00101$:
;src/main.c:562: cpct_scanKeyboard_f();   		
	call	_cpct_scanKeyboard_f
;src/main.c:563: } while(!cpct_isKeyPressed(Key_I));   		
	ld	hl,#0x0804
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
	ret
___str_4:
	.ascii "FIN DE PARTIDA"
	.db 0x00
;src/main.c:566: void menuInicio(){
;	---------------------------------
; Function menuInicio
; ---------------------------------
_menuInicio::
;src/main.c:570: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:572: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 15); // centrado en horizontal y arriba en vertical
	ld	hl,#0x0F20
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:573: cpct_drawStringM0("MENU", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_5
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:575: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 160); // centrado en horizontal y abajo en vertical
	ld	hl,#0xA01A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:576: cpct_drawStringM0("PULSA I", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_6
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:579: do{
00101$:
;src/main.c:580: cpct_scanKeyboard_f();   		
	call	_cpct_scanKeyboard_f
;src/main.c:581: } while(!cpct_isKeyPressed(Key_I));   		
	ld	hl,#0x0804
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
	ret
___str_5:
	.ascii "MENU"
	.db 0x00
___str_6:
	.ascii "PULSA I"
	.db 0x00
;src/main.c:584: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:585: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:586: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:587: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:588: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:589: cpct_akp_musicInit(G_song);
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
	ret
;src/main.c:592: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:595: TKnife* actual = cu;
;src/main.c:597: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:598: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:599: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:600: dibujarMapa();
	call	_dibujarMapa
;src/main.c:601: borrarPantallaAbajo();
	call	_borrarPantallaAbajo
;src/main.c:602: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:605: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:606: prota.y = prota.py = 80;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x50
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x50
;src/main.c:607: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:608: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:609: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:611: enemy.x = enemy.px = 67;
	ld	hl,#(_enemy + 0x0002)
	ld	(hl),#0x43
	ld	hl,#_enemy
	ld	(hl),#0x43
;src/main.c:612: enemy.y = enemy.py = 84;
	ld	hl,#(_enemy + 0x0003)
	ld	(hl),#0x54
	ld	hl,#(_enemy + 0x0001)
	ld	(hl),#0x54
;src/main.c:613: enemy.mover  = NO;
	ld	hl,#(_enemy + 0x0006)
	ld	(hl),#0x00
;src/main.c:614: enemy.mira=M_abajo;
	ld	hl,#(_enemy + 0x0007)
	ld	(hl),#0x03
;src/main.c:615: enemy.sprite = g_enemy;
	ld	hl,#_g_enemy
	ld	((_enemy + 0x0004)), hl
;src/main.c:617: i = 10 + 1;
	ld	c,#0x0B
;src/main.c:619: while(--i){
	ld	de,#_cu
00101$:
	ld	b,c
	dec	b
	ld	a,b
	ld	c,a
	or	a, a
	jr	Z,00103$
;src/main.c:620: actual->x = actual->px = 0;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x00
	xor	a, a
	ld	(de),a
;src/main.c:621: actual->y = actual->py = 0;
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
;src/main.c:622: actual->lanzado = 0;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:623: ++actual;
	ld	hl,#0x0009
	add	hl,de
	ex	de,hl
	jr	00101$
00103$:
;src/main.c:626: dibujarProta();
	call	_dibujarProta
;src/main.c:627: dibujarEnemigo();
	jp  _dibujarEnemigo
;src/main.c:630: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:632: inicializarCPC();
	call	_inicializarCPC
;src/main.c:633: menuInicio();
	call	_menuInicio
;src/main.c:635: inicializarJuego();
	call	_inicializarJuego
;src/main.c:636: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:638: while (1) {
00104$:
;src/main.c:641: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:643: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:644: moverCuchillo();
	call	_moverCuchillo
;src/main.c:645: moverEnemigo();
	call	_moverEnemigo
;src/main.c:647: if (prota.mover) {
	ld	a, (#(_prota + 0x0006) + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:649: redibujarProta();
	call	_redibujarProta
;src/main.c:650: prota.mover = NO;
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
