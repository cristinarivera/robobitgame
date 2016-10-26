;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _inicializarJuego
	.globl _inicializarCPC
	.globl _intHandler
	.globl _moverAbajo
	.globl _moverArriba
	.globl _moverDerecha
	.globl _moverIzquierda
	.globl _avanzarMapa
	.globl _inicializarEnemy
	.globl _updateEnemy
	.globl _engage
	.globl _moverEnemigoSeek
	.globl _lookFor
	.globl _moverEnemigoPatrol
	.globl _moverEnemigoIzquierda
	.globl _moverEnemigoDerecha
	.globl _moverEnemigoAbajo
	.globl _moverEnemigoArriba
	.globl _checkEnemyDead
	.globl _redibujarEnemigo
	.globl _borrarEnemigo
	.globl _borrarExplosion
	.globl _dibujarExplosion
	.globl _dibujarEnemigo
	.globl _checkCollision
	.globl _comprobarTeclado
	.globl _redibujarProta
	.globl _borrarProta
	.globl _dibujarProta
	.globl _dibujarMapa
	.globl _play
	.globl _pathFinding
	.globl _moverCuchillo
	.globl _lanzarCuchillo
	.globl _redibujarCuchillo
	.globl _borrarCuchillo
	.globl _abs
	.globl _getTilePtr
	.globl _aumentarPuntuacion
	.globl _modificarPuntuacion
	.globl _barraPuntuacionInicial
	.globl _menuInicio
	.globl _menuFin
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_disableFirmware
	.globl _vidas
	.globl _puntuacion
	.globl _num_mapa
	.globl _mapa
	.globl _i
	.globl _cu
	.globl _prota
	.globl _enemy
	.globl _patrolY
	.globl _patrolX
	.globl _spawnY
	.globl _spawnX
	.globl _mapas
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_enemy::
	.ds 904
_prota::
	.ds 8
_cu::
	.ds 11
_i::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_mapa::
	.ds 2
_num_mapa::
	.ds 1
_puntuacion::
	.ds 1
_vidas::
	.ds 1
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
;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x0100 
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
;src/main.c:112: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
	ld	hl,(_mapa)
	push	hl
	ld	hl,#0xC0F0
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
_spawnX:
	.db #0x24	; 36
	.db #0x47	; 71	'G'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
_spawnY:
	.db #0x2C	; 44
	.db #0x66	; 102	'f'
	.db #0x9A	; 154
	.db #0x40	; 64
_patrolX:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db #0x34	; 52	'4'
	.db #0x33	; 51	'3'
	.db #0x14	; 20
	.db #0x00	; 0
	.db 0x00
	.db #0x38	; 56	'8'
	.db #0x3C	; 60
	.db #0x23	; 35
	.db #0x18	; 24
	.db 0x00
_patrolY:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db #0x5E	; 94
	.db #0xA6	; 166
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db #0xA0	; 160
	.db #0x66	; 102	'f'
	.db #0x2C	; 44
	.db #0x00	; 0
	.db 0x00
	.db #0xAE	; 174
	.db #0x66	; 102	'f'
	.db #0x22	; 34
	.db #0x86	; 134
	.db 0x00
;src/main.c:118: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:123: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
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
	ld	-3 (ix),a
;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	iy,(_mapa)
	ld	d,#0x00
	ld	a,e
	add	a,#0xE8
	ld	-2 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	bit	7, -1 (ix)
	jr	Z,00105$
	ld	hl,#0xFFEB
	add	hl,de
00105$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	d,l
	srl	c
	push	iy
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
;src/main.c:135: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:136: borrarProta();
	call	_borrarProta
;src/main.c:137: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:138: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:139: dibujarProta();
	jp  _dibujarProta
;src/main.c:142: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:143: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:145: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:146: if (cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:147: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:149: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:151: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:153: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:154: }else if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:155: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_lanzarCuchillo
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	ret
;src/main.c:160: u8 checkCollision(u8 direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:163: switch (direction) {
	ld	a,#0x03
	sub	a, 4 (ix)
	jp	C,00105$
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00124$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
;src/main.c:164: case 0:
00101$:
;src/main.c:165: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	c,(hl)
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	b,a
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:166: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x14
	ld	c,a
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	b,a
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ex	de,hl
;src/main.c:167: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	b,a
	ld	a, (#_prota + 0)
	add	a, #0x07
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	pop	de
;src/main.c:168: break;
	jp	00105$
;src/main.c:169: case 1:
00102$:
;src/main.c:170: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	d,(hl)
	ld	hl, #_prota + 0
	ld	b,(hl)
	dec	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:171: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x14
	ld	d,a
	ld	hl, #_prota + 0
	ld	b,(hl)
	dec	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ex	de,hl
;src/main.c:172: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	b,a
	ld	a, (#_prota + 0)
	add	a,#0xFF
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,l
	ld	b,h
	pop	de
;src/main.c:173: break;
	jr	00105$
;src/main.c:174: case 2:
00103$:
;src/main.c:175: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a,#0xFE
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	inc	sp
	inc	sp
	push	hl
;src/main.c:176: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
	ld	hl, #(_prota + 0x0001) + 0
	ld	d,(hl)
	dec	d
	dec	d
	ld	a, (#_prota + 0)
	add	a, #0x03
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:177: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:178: break;
	jr	00105$
;src/main.c:179: case 3:
00104$:
;src/main.c:180: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	inc	sp
	inc	sp
	push	hl
;src/main.c:181: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	d,a
	ld	a, (#_prota + 0)
	add	a, #0x03
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:182: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:184: }
00105$:
;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
	pop	hl
	push	hl
	ld	l,(hl)
	ld	a,#0x02
	sub	a, l
	jr	C,00106$
	ld	a,(de)
	ld	e,a
	ld	a,#0x02
	sub	a, e
	jr	C,00106$
	ld	a,(bc)
	ld	c,a
	ld	a,#0x02
	sub	a, c
	jr	NC,00107$
00106$:
;src/main.c:187: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:189: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:192: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:193: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d,(hl)
	ld	a,(bc)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:194: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
	pop	hl
	ld	bc, #0x0004
	add	hl, bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1604
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	ix
	ret
;src/main.c:197: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d,(hl)
	ld	a,(bc)
	ld	b,a
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	push	de
	ld	hl,#0x1604
	push	hl
	push	bc
	ld	hl,#_g_explosion
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	ix
	ret
;src/main.c:202: void borrarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:205: u8 w = 4 + (enemy->px & 1);
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
	inc	b
	inc	b
;src/main.c:208: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	bit	1, e
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x06
	ld	-3 (ix),a
;src/main.c:210: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	iy,(_mapa)
	ld	d,#0x00
	ld	a,e
	add	a,#0xE8
	ld	-2 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	bit	7, -1 (ix)
	jr	Z,00105$
	ld	hl,#0xFFEB
	add	hl,de
00105$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	d,l
	srl	c
	push	iy
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
;	---------------------------------
; Function borrarEnemigo
; ---------------------------------
_borrarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:218: u8 w = 4 + (x & 1);
	ld	a,4 (ix)
	and	a, #0x01
	ld	c,a
	inc	c
	inc	c
	inc	c
	inc	c
;src/main.c:221: u8 h = 6 + (y & 3 ? 1 : 0);
	ld	a,5 (ix)
	and	a, #0x03
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x06
	ld	b,a
;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	hl,(_mapa)
<<<<<<< HEAD
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	e,5 (ix)
	ld	d,#0x00
	ld	a,e
	add	a,#0xE8
	ld	-4 (ix),a
	ld	a,d
=======
	ex	(sp), hl
	ld	c,5 (ix)
	ld	b,#0x00
	ld	a,c
	add	a,#0xE8
	ld	-2 (ix),a
	ld	a,b
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	bit	7, -1 (ix)
	jr	Z,00105$
	ld	hl,#0xFFEB
	add	hl,de
00105$:
	sra	h
	rr	l
	sra	h
	rr	l
<<<<<<< HEAD
	ld	e,l
	ld	d,4 (ix)
	srl	d
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
	ld	b,l
	ld	c,4 (ix)
	srl	c
	pop	hl
	push	hl
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	hl
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ld	sp, ix
	pop	ix
	ret
;src/main.c:226: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:227: borrarEnemigo(x, y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:228: enemy->px = enemy->x;
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:229: enemy->py = enemy->y;
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
;src/main.c:230: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:233: void checkEnemyDead(u8 direction, TEnemy *enemy){
;	---------------------------------
; Function checkEnemyDead
; ---------------------------------
_checkEnemyDead::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:235: switch (direction) {
	ld	a,#0x03
	sub	a, 4 (ix)
	jp	C,00134$
;src/main.c:237: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
	ld	a,5 (ix)
	ld	-2 (ix),a
	ld	a,6 (ix)
	ld	-1 (ix),a
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/main.c:240: enemy->muerto = SI;
	ld	a,-2 (ix)
	add	a, #0x08
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
;src/main.c:235: switch (direction) {
=======
;src/main.c:236: u8 colisiona = 1;
	ld	-9 (ix),#0x01
;src/main.c:238: switch (direction) {
	ld	a,#0x03
	sub	a, 4 (ix)
	jp	C,00165$
;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	c,5 (ix)
	ld	b,6 (ix)
	ld	a,(bc)
	ld	e,a
	ld	hl,#0x0001
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
;src/main.c:252: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:259: enemy->mira = M_izquierda;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:238: switch (direction) {
	push	de
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00196$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00196$:
	jp	00109$
	jp	00101$
	jp	00125$
	jp	00117$
<<<<<<< HEAD
;src/main.c:236: case 1:
00101$:
;src/main.c:237: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
=======
	jp	00133$
	jp	00149$
;src/main.c:239: case 0:
00101$:
;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	a,e
	add	a, #0x05
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00113$
;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	d,a
	ld	a,(bc)
	add	a, #0x05
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00113$
;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	d,a
	ld	a,(bc)
	add	a, #0x05
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00113$
;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_cu + 1
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ld	e,l
	ld	a, h
	or	a, e
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	e,a
	pop	hl
	push	hl
	ld	l,(hl)
	ld	d,l
	ld	a,e
	sub	a, d
	jp	PO, 00197$
	xor	a, #0x80
00197$:
	jp	M,00106$
	ld	h,#0x00
	ld	de,#0x0016
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00198$
	xor	a, #0x80
<<<<<<< HEAD
00198$:
	jp	P,00134$
00106$:
;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
=======
00270$:
	jp	P,00109$
00108$:
;src/main.c:245: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00109$:
;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
<<<<<<< HEAD
	ld	a,e
	sub	a, c
	jp	NC,00134$
;src/main.c:239: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
	ld	l,c
=======
	ld	a,(bc)
	ld	c,a
	sub	a, e
	jr	NC,00106$
;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
	ld	l,e
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	h,#0x00
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	cp	a, a
	sbc	hl, de
	ld	a,#0x01
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00199$
	xor	a, #0x80
<<<<<<< HEAD
00199$:
	jp	M,00134$
;src/main.c:240: enemy->muerto = SI;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:244: break;
	jp	00134$
;src/main.c:245: case 0:
00109$:
;src/main.c:246: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
=======
00271$:
	jp	P,00103$
;src/main.c:250: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00103$:
;src/main.c:252: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00106$:
;src/main.c:255: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00113$:
;src/main.c:259: enemy->mira = M_izquierda;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:261: break;
	jp	00165$
;src/main.c:262: case 1:
00117$:
;src/main.c:263: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
	dec	e
	push	bc
	push	de
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00129$
;src/main.c:264: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	d,a
	ld	a,(bc)
	add	a,#0xFF
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00129$
;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	d,a
	ld	a,(bc)
	add	a,#0xFF
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00129$
;src/main.c:267: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_cu + 1
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ld	e,l
	ld	a, h
	or	a, e
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	e,a
	pop	hl
	push	hl
	ld	l,(hl)
	ld	d,l
	ld	a,e
	sub	a, d
	jp	PO, 00200$
	xor	a, #0x80
00200$:
	jp	M,00114$
	ld	h,#0x00
	ld	de,#0x0016
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00201$
	xor	a, #0x80
<<<<<<< HEAD
00201$:
	jp	P,00134$
00114$:
;src/main.c:247: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jp	NC,00134$
;src/main.c:248: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
	ld	l,c
=======
00273$:
	jp	P,00125$
00124$:
;src/main.c:268: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00125$:
;src/main.c:271: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	a,(bc)
	ld	e,a
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	a,c
	sub	a, e
	jr	NC,00122$
;src/main.c:272: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
	ld	l,e
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	h,#0x00
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	cp	a, a
	sbc	hl, de
	ld	a,#0x01
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00202$
	xor	a, #0x80
<<<<<<< HEAD
00202$:
	jp	M,00134$
;src/main.c:249: enemy->muerto = SI;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:253: break;
	jp	00134$
;src/main.c:254: case 3:
00117$:
;src/main.c:255: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
=======
00274$:
	jp	P,00119$
;src/main.c:273: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00119$:
;src/main.c:275: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00122$:
;src/main.c:278: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00129$:
;src/main.c:282: enemy->mira = M_derecha;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:284: break;
	jp	00165$
;src/main.c:285: case 2:
00133$:
;src/main.c:286: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
	dec	d
	dec	d
	push	bc
	push	de
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00145$
;src/main.c:287: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	a,(bc)
	add	a, #0x02
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00145$
;src/main.c:288: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	a,(bc)
	add	a, #0x04
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00145$
;src/main.c:290: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00203$
	xor	a, #0x80
00203$:
	jp	M,00134$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00204$
	xor	a, #0x80
<<<<<<< HEAD
00204$:
	jp	M,00134$
;src/main.c:256: if(enemy->y>cu.y){
	pop	hl
	push	hl
	ld	c,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	e,(hl)
=======
00276$:
	jp	P,00141$
00140$:
;src/main.c:291: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00141$:
;src/main.c:293: if(enemy->y>cu.y){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00138$
;src/main.c:294: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
	ld	d,#0x00
	ld	h,#0x00
	push	de
	ld	de,#0x0008
	add	hl, de
	pop	de
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,e
	sub	a, c
	jp	NC,00134$
;src/main.c:257: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
	ld	b,#0x00
	ld	d,#0x00
	ld	hl,#0x0008
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
	jp	PO, 00205$
	xor	a, #0x80
<<<<<<< HEAD
00205$:
	jp	P,00134$
;src/main.c:258: enemy->muerto = SI;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:262: break;
	jr	00134$
;src/main.c:263: case 2:
00125$:
;src/main.c:264: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
=======
00277$:
	jp	P,00135$
;src/main.c:295: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00135$:
;src/main.c:297: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00149$
00138$:
;src/main.c:300: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00145$:
;src/main.c:304: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:306: case 3:
00149$:
;src/main.c:307: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	a,(bc)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00161$
;src/main.c:308: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	a,(bc)
	add	a, #0x02
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00161$
;src/main.c:309: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	a,(bc)
	add	a, #0x04
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jr	C,00161$
;src/main.c:311: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00206$
	xor	a, #0x80
00206$:
	jp	M,00134$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00207$
	xor	a, #0x80
<<<<<<< HEAD
00207$:
	jp	M,00134$
;src/main.c:265: if(cu.y > enemy->y){ //si el cu esta abajo
=======
00279$:
	jp	P,00157$
00156$:
;src/main.c:312: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00157$:
;src/main.c:315: if(cu.y > enemy->y){ //si el cu esta abajo
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	pop	hl
	push	hl
	ld	e,(hl)
	ld	a,e
	sub	a, c
<<<<<<< HEAD
	jr	NC,00134$
;src/main.c:266: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
=======
	jr	NC,00154$
;src/main.c:316: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
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
	jp	PO, 00208$
	xor	a, #0x80
<<<<<<< HEAD
00208$:
	jp	P,00134$
;src/main.c:267: enemy->muerto = SI;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:273: }
00134$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:276: void moverEnemigoArriba(TEnemy *enemy){
=======
00280$:
	jp	P,00151$
;src/main.c:317: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00151$:
;src/main.c:319: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00165$
00154$:
;src/main.c:322: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00161$:
;src/main.c:326: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:329: }
00165$:
;src/main.c:330: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:333: void moverEnemigoArriba(TEnemy *enemy){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
<<<<<<< HEAD
;src/main.c:277: enemy->y--;
=======
;src/main.c:334: enemy->y--;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
<<<<<<< HEAD
;src/main.c:278: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:279: enemy->mover = SI;
=======
;src/main.c:335: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:336: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:282: void moverEnemigoAbajo(TEnemy *enemy){
=======
;src/main.c:339: void moverEnemigoAbajo(TEnemy *enemy){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
<<<<<<< HEAD
;src/main.c:283: enemy->y++;
=======
;src/main.c:340: enemy->y++;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
<<<<<<< HEAD
;src/main.c:284: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:285: enemy->mover = SI;
=======
;src/main.c:341: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:342: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:288: void moverEnemigoDerecha(TEnemy *enemy){
=======
;src/main.c:345: void moverEnemigoDerecha(TEnemy *enemy){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
<<<<<<< HEAD
;src/main.c:289: enemy->x++;
=======
;src/main.c:346: enemy->x++;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:290: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:291: enemy->mover = SI;
=======
;src/main.c:347: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:348: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
<<<<<<< HEAD
;src/main.c:294: void moverEnemigoIzquierda(TEnemy *enemy){
=======
;src/main.c:351: void moverEnemigoIzquierda(TEnemy *enemy){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
<<<<<<< HEAD
;src/main.c:295: enemy->x--;
=======
;src/main.c:352: enemy->x--;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:296: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:297: enemy->mover = SI;
=======
;src/main.c:353: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:354: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
<<<<<<< HEAD
;src/main.c:300: void moverEnemigoPatrol(TEnemy* enemy){
=======
;src/main.c:357: void moverEnemigoPatrol(TEnemy* enemy){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverEnemigoPatrol
; ---------------------------------
_moverEnemigoPatrol::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:302: if(!enemy->muerto){
=======
;src/main.c:359: if(!enemy->muerto){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00118$
<<<<<<< HEAD
;src/main.c:305: if (!enemy->reversePatrol) {
=======
;src/main.c:361: if (!enemy->reversePatrol) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x000C
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
<<<<<<< HEAD
	ld	-3 (ix),a
;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
=======
	ld	-9 (ix),a
;src/main.c:362: if(enemy->iter < enemy->longitud_camino){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x000E
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x00E1
	add	hl,bc
<<<<<<< HEAD
	ld	-7 (ix),l
	ld	-6 (ix),h
;src/main.c:309: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
=======
	ld	-8 (ix),l
	ld	-7 (ix),h
;src/main.c:364: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ex	(sp), hl
;src/main.c:366: enemy->x = enemy->camino[enemy->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0019
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
<<<<<<< HEAD
;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
	ld	hl,#0x0001
	add	hl,bc
	ex	(sp), hl
;src/main.c:305: if (!enemy->reversePatrol) {
	ld	a,-3 (ix)
	or	a, a
	jp	NZ,00114$
;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
	ld	l,-7 (ix)
	ld	h,-6 (ix)
=======
;src/main.c:368: enemy->y = enemy->camino[enemy->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:361: if (!enemy->reversePatrol) {
	ld	a,-9 (ix)
	or	a, a
	jp	NZ,00114$
;src/main.c:362: if(enemy->iter < enemy->longitud_camino){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	P,00105$
<<<<<<< HEAD
;src/main.c:307: if(enemy->iter == 0){
	ld	a,d
	or	a,e
	jr	NZ,00102$
;src/main.c:309: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:310: enemy->iter = 2;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:363: if(enemy->iter == 0){
	ld	a,d
	or	a,e
	jr	NZ,00102$
;src/main.c:364: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:365: enemy->iter = 2;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:366: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:312: ++enemy->iter;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:367: ++enemy->iter;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
<<<<<<< HEAD
;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
=======
;src/main.c:368: enemy->y = enemy->camino[enemy->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,bc
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
<<<<<<< HEAD
;src/main.c:314: ++enemy->iter;
=======
;src/main.c:369: ++enemy->iter;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	inc	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00118$
00102$:
<<<<<<< HEAD
;src/main.c:317: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:318: enemy->x = enemy->camino[enemy->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:371: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:372: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:319: ++enemy->iter;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:373: ++enemy->iter;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
<<<<<<< HEAD
;src/main.c:320: enemy->y = enemy->camino[enemy->iter];
=======
;src/main.c:374: enemy->y = enemy->camino[enemy->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
<<<<<<< HEAD
;src/main.c:321: ++enemy->iter;
=======
;src/main.c:375: ++enemy->iter;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	inc	de
	ld	c,e
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),d
	jp	00118$
00105$:
<<<<<<< HEAD
;src/main.c:326: enemy->mover = NO;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:327: enemy->iter = enemy->longitud_camino;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
=======
;src/main.c:379: enemy->mover = NO;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:380: enemy->iter = enemy->longitud_camino;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,(hl)
	ld	b,#0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
<<<<<<< HEAD
;src/main.c:331: enemy->reversePatrol = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jp	00118$
00114$:
;src/main.c:336: if(enemy->iter > 0){
=======
;src/main.c:384: enemy->reversePatrol = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00118$
00114$:
;src/main.c:387: if(enemy->iter > 0){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00145$
	xor	a, #0x80
00145$:
	jp	P,00111$
<<<<<<< HEAD
;src/main.c:337: if(enemy->iter == enemy->longitud_camino){
	ld	l,-7 (ix)
	ld	h,-6 (ix)
=======
;src/main.c:388: if(enemy->iter == enemy->longitud_camino){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,(hl)
	ld	-8 (ix),l
	ld	-7 (ix),#0x00
	ld	a,e
	sub	a, -8 (ix)
	jp	NZ,00108$
	ld	a,d
	sub	a, -7 (ix)
	jp	NZ,00108$
<<<<<<< HEAD
;src/main.c:338: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:339: enemy->iter = enemy->iter - 1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:389: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:390: enemy->iter = enemy->iter - 1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0xFF
	ld	-8 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-7 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,-8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-7 (ix)
	ld	(hl),a
<<<<<<< HEAD
;src/main.c:340: enemy->iter = enemy->iter - 2;
	ld	e,-7 (ix)
	ld	d,-6 (ix)
=======
;src/main.c:391: enemy->iter = enemy->iter - 2;
	ld	e,-8 (ix)
	ld	d,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	dec	de
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
<<<<<<< HEAD
;src/main.c:341: enemy->y = enemy->camino[enemy->iter];
=======
;src/main.c:392: enemy->y = enemy->camino[enemy->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
<<<<<<< HEAD
;src/main.c:342: --enemy->iter;
	ld	a,-7 (ix)
=======
;src/main.c:393: --enemy->iter;
	ld	a,-8 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	add	a,#0xFD
	ld	e,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
<<<<<<< HEAD
;src/main.c:343: enemy->x = enemy->camino[enemy->iter];
=======
;src/main.c:394: enemy->x = enemy->camino[enemy->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:344: --enemy->iter;
	ld	a,-7 (ix)
=======
;src/main.c:395: --enemy->iter;
	ld	a,-8 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	add	a,#0xFC
	ld	c,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	b,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jr	00118$
00108$:
<<<<<<< HEAD
;src/main.c:346: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:347: enemy->y = enemy->camino[enemy->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:397: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:398: enemy->y = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
<<<<<<< HEAD
;src/main.c:348: --enemy->iter;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:399: --enemy->iter;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
<<<<<<< HEAD
;src/main.c:349: enemy->x = enemy->camino[enemy->iter];
=======
;src/main.c:400: enemy->x = enemy->camino[enemy->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:350: --enemy->iter;
=======
;src/main.c:401: --enemy->iter;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jr	00118$
00111$:
<<<<<<< HEAD
;src/main.c:355: enemy->mover = NO;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:356: enemy->iter = 0;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
=======
;src/main.c:405: enemy->mover = NO;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:406: enemy->iter = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
<<<<<<< HEAD
;src/main.c:358: enemy->reversePatrol = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
;src/main.c:408: enemy->reversePatrol = 0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	(hl),#0x00
00118$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:365: void lookFor(TEnemy* enemy){
=======
;src/main.c:415: void lookFor(TEnemy* enemy){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function lookFor
; ---------------------------------
_lookFor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:374: i16 difx = abs((i16)(enemy->x - prota.x));
=======
;src/main.c:421: i16 difx = abs((i16)(enemy->x - prota.x));
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	hl,#_prota+0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	c,a
	ld	a,b
	sbc	a, h
	ld	b,a
	push	de
	push	bc
	call	_abs
	pop	af
	pop	de
	inc	sp
	inc	sp
	push	hl
<<<<<<< HEAD
;src/main.c:375: i16 dify = abs((i16)(enemy->y - prota.y));
=======
;src/main.c:422: i16 dify = abs((i16)(enemy->y - prota.y));
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0001
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	b,#0x00
	ld	hl, #(_prota + 0x0001) + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,c
	sub	a, l
	ld	c,a
	ld	a,b
	sbc	a, h
	ld	b,a
	push	de
	push	bc
	call	_abs
	pop	af
	pop	de
<<<<<<< HEAD
;src/main.c:377: dist = difx + dify; // manhattan
	ld	c,-7 (ix)
	add	hl, bc
	ld	-5 (ix),l
;src/main.c:378: enemy->seen = NO;
=======
;src/main.c:424: dist = difx + dify; // manhattan
	ld	c,-7 (ix)
	add	hl, bc
	ld	-5 (ix),l
;src/main.c:425: enemy->seen = NO;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0012
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
<<<<<<< HEAD
;src/main.c:379: enemy->in_range = NO;
=======
;src/main.c:426: enemy->in_range = NO;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0011
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:380: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
=======
;src/main.c:427: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	push	de
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
<<<<<<< HEAD
;src/main.c:381: if(!enemy->seek){
=======
;src/main.c:428: if(!enemy->seek){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	de
	pop	iy
	ld	a,20 (iy)
	or	a, a
	jp	NZ,00111$
<<<<<<< HEAD
;src/main.c:382: if (dist <= 10) {// te detectan los sensores de proximidad
	ld	a,#0x0A
	sub	a, -5 (ix)
	jr	C,00107$
;src/main.c:383: enemy->in_range = 1;
	ld	a,#0x01
	ld	(bc),a
;src/main.c:384: enemy->engage = 1;
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x01
;src/main.c:385: enemy->seen = SI;
=======
;src/main.c:429: if (dist <= 10) {// te detectan los sensores de proximidad
	ld	a,#0x0A
	sub	a, -5 (ix)
	jr	C,00107$
;src/main.c:430: enemy->in_range = 1;
	ld	a,#0x01
	ld	(bc),a
;src/main.c:431: enemy->engage = 1;
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x01
;src/main.c:432: enemy->seen = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
	jr	00111$
00107$:
<<<<<<< HEAD
;src/main.c:386: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
=======
;src/main.c:433: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_prota + 0
	ld	c,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	add	a,#0xE7
	ld	l,a
	ld	a,d
	adc	a,#0xFF
	ld	h,a
	ld	b,#0x00
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00137$
	xor	a, #0x80
00137$:
	jp	P,00111$
	ld	hl,#0x0019
	add	hl,de
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	P,00111$
<<<<<<< HEAD
;src/main.c:387: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
=======
;src/main.c:434: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #(_prota + 0x0001) + 0
	ld	c,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	a,e
	add	a,#0xCC
	ld	l,a
	ld	a,d
	adc	a,#0xFF
	ld	h,a
	ld	b,#0x00
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	P,00111$
	ld	hl,#0x0034
	add	hl,de
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P,00111$
<<<<<<< HEAD
;src/main.c:388: enemy->seen = SI;
=======
;src/main.c:435: enemy->seen = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
00111$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:394: void moverEnemigoSeek(TEnemy* actual){
=======
;src/main.c:440: void moverEnemigoSeek(TEnemy* actual){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverEnemigoSeek
; ---------------------------------
_moverEnemigoSeek::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:396: if(!actual->muerto){
=======
;src/main.c:443: if(!actual->muerto){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a, 8 (iy)
	or	a, a
	jp	NZ,00114$
<<<<<<< HEAD
;src/main.c:399: if(actual->iter < actual->longitud_camino){
	ld	hl,#0x000E
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-3 (ix),a
=======
;src/main.c:445: if(actual->iter < actual->longitud_camino){
	ld	hl,#0x000E
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l, c
	ld	h, b
	ld	de, #0x00E1
	add	hl, de
	ld	e,(hl)
	ld	d,#0x00
<<<<<<< HEAD
;src/main.c:408: actual->y = actual->camino[actual->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:399: if(actual->iter < actual->longitud_camino){
	ld	a,-4 (ix)
	sub	a, e
	ld	a,-3 (ix)
=======
;src/main.c:451: actual->y = actual->camino[actual->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
;src/main.c:445: if(actual->iter < actual->longitud_camino){
	ld	a,-10 (ix)
	sub	a, e
	ld	a,-9 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	sbc	a, d
	jp	PO, 00136$
	xor	a, #0x80
00136$:
	jp	P,00110$
<<<<<<< HEAD
;src/main.c:404: actual->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
;src/main.c:406: actual->x = actual->camino[actual->iter];
=======
;src/main.c:447: actual->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
;src/main.c:449: actual->x = actual->camino[actual->iter];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	add	a, #0x19
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
<<<<<<< HEAD
;src/main.c:402: if(actual->iter == 0){
	ld	a,-3 (ix)
	or	a,-4 (ix)
	jr	NZ,00102$
;src/main.c:404: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:405: actual->iter = 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:406: actual->x = actual->camino[actual->iter];
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
;src/main.c:446: if(actual->iter == 0){
	ld	a,-9 (ix)
	or	a,-10 (ix)
	jr	NZ,00102$
;src/main.c:447: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:448: actual->iter = 2;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:449: actual->x = actual->camino[actual->iter];
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:407: ++actual->iter;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
;src/main.c:450: ++actual->iter;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
<<<<<<< HEAD
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:408: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:409: ++actual->iter;
	inc	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:451: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
;src/main.c:452: ++actual->iter;
	inc	bc
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00114$
00102$:
<<<<<<< HEAD
;src/main.c:412: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:413: actual->x = actual->camino[actual->iter];
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
;src/main.c:454: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:455: actual->x = actual->camino[actual->iter];
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:414: ++actual->iter;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
;src/main.c:456: ++actual->iter;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
<<<<<<< HEAD
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:415: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:416: ++actual->iter;
	inc	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:457: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
;src/main.c:458: ++actual->iter;
	inc	bc
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00114$
00110$:
<<<<<<< HEAD
;src/main.c:421: actual->seek = 0;
	ld	hl,#0x0014
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:422: lookFor(actual);
=======
;src/main.c:462: actual->seek = 0;
	ld	hl,#0x0014
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:463: lookFor(actual);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
<<<<<<< HEAD
;src/main.c:423: if(!actual->seen){
=======
;src/main.c:464: if(!actual->seen){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l, c
	ld	h, b
	ld	de, #0x0012
	add	hl, de
	ld	a,(hl)
<<<<<<< HEAD
	ld	-7 (ix),a
;src/main.c:424: actual->patrolling = 1;
	ld	hl,#0x000B
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/main.c:423: if(!actual->seen){
	ld	a,-7 (ix)
	or	a, a
	jr	NZ,00107$
;src/main.c:424: actual->patrolling = 1;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:425: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
	push	bc
	pop	iy
	ld	a,24 (iy)
	ld	-7 (ix),a
	push	bc
	pop	iy
	ld	d,23 (iy)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	ld	a,(bc)
	ld	-10 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-7 (ix)
	push	af
	inc	sp
	push	de
	ld	a,-10 (ix)
=======
	ld	-6 (ix),a
;src/main.c:465: actual->patrolling = 1;
	ld	hl,#0x000B
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:464: if(!actual->seen){
	ld	a,-6 (ix)
	or	a, a
	jr	NZ,00107$
;src/main.c:465: actual->patrolling = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:466: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
	push	bc
	pop	iy
	ld	a,24 (iy)
	ld	-6 (ix),a
	push	bc
	pop	iy
	ld	d,23 (iy)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	ld	a,(bc)
	ld	-3 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-6 (ix)
	push	af
	inc	sp
	push	de
	ld	a,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	jr	00108$
00107$:
<<<<<<< HEAD
;src/main.c:427: actual->patrolling = 0;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:428: if(!actual->engage){
=======
;src/main.c:468: actual->patrolling = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:469: if(!actual->engage){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	pop	iy
	ld	a,22 (iy)
	or	a, a
	jr	NZ,00108$
<<<<<<< HEAD
;src/main.c:429: actual->seek = 1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:430: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-10 (ix),a
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	ld	a,(bc)
	ld	-9 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-10 (ix)
=======
;src/main.c:470: actual->seek = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:471: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-3 (ix),a
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	d,(hl)
	ld	a,(bc)
	ld	-2 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-3 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
<<<<<<< HEAD
	ld	a,-9 (ix)
=======
	ld	a,-2 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
00108$:
<<<<<<< HEAD
;src/main.c:433: actual->iter = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
=======
;src/main.c:474: actual->iter = 0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00114$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:441: void engage(TEnemy *enemy, u8 dx, u8 dy) {
=======
;src/main.c:481: void engage(TEnemy *enemy, u8 dx, u8 dy) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function engage
; ---------------------------------
_engage::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
=======
;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,4 (ix)
	ld	-12 (ix),a
	ld	a,5 (ix)
	ld	-11 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#_prota+0
	ld	e,(hl)
	ld	d,#0x00
	ld	a,c
	sub	a, e
	ld	c,a
	ld	a,b
	sbc	a, d
	ld	b,a
	push	bc
	call	_abs
	pop	af
	ld	c,l
<<<<<<< HEAD
;src/main.c:443: u8 dify = abs(enemy->y - prota.y);
=======
;src/main.c:483: u8 dify = abs(enemy->y - prota.y);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-12 (ix)
	add	a, #0x01
	ld	-10 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	hl, #_prota + 1
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	e,a
	ld	a,d
	sbc	a, h
	ld	d,a
	push	bc
	push	de
	call	_abs
	pop	af
	pop	bc
<<<<<<< HEAD
;src/main.c:444: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-15 (ix),l
;src/main.c:446: u8 movX = 0;
	ld	-14 (ix),#0x00
;src/main.c:447: u8 movY = 0;
	ld	-13 (ix),#0x00
;src/main.c:448: u8 distConstraint = 25;
	ld	c,#0x19
;src/main.c:449: enemy->mover = NO;
=======
;src/main.c:484: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-13 (ix),l
;src/main.c:486: u8 movX = 0;
	ld	-14 (ix),#0x00
;src/main.c:487: u8 movY = 0;
	ld	-15 (ix),#0x00
;src/main.c:488: u8 distConstraint = 25;
	ld	c,#0x19
;src/main.c:489: enemy->mover = NO;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-12 (ix)
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
<<<<<<< HEAD
;src/main.c:451: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
=======
;src/main.c:491: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
<<<<<<< HEAD
;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
;src/main.c:464: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,b
	add	a, #0x04
	ld	-5 (ix),a
;src/main.c:451: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
=======
;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
;src/main.c:504: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,b
	add	a, #0x04
	ld	-5 (ix),a
;src/main.c:491: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,7 (ix)
	sub	a, -6 (ix)
	jr	Z,00194$
	ld	e,7 (ix)
	ld	d,#0x00
	ld	hl,#0x0001
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-6 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	sub	a, -4 (ix)
	jr	NZ,00422$
	ld	a,-1 (ix)
	sub	a, -3 (ix)
	jr	Z,00194$
00422$:
	dec	de
	ld	a,-2 (ix)
	sub	a, e
	jp	NZ,00195$
	ld	a,-1 (ix)
	sub	a, d
	jp	NZ,00195$
00194$:
<<<<<<< HEAD
;src/main.c:452: if (dx < enemy->x) { // izquierda
	ld	a,6 (ix)
	sub	a, b
	jp	NC,00114$
;src/main.c:453: if (dist > 11) {
=======
;src/main.c:492: if (dx < enemy->x) { // izquierda
	ld	a,6 (ix)
	sub	a, b
	jp	NC,00114$
;src/main.c:493: if (dist > 11) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,#0x0B
	sub	a, -13 (ix)
	jp	NC,00199$
<<<<<<< HEAD
;src/main.c:454: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
=======
;src/main.c:494: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-6 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:455: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
=======
;src/main.c:495: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:456: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
=======
;src/main.c:496: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:457: moverEnemigoIzquierda(enemy);
=======
;src/main.c:497: moverEnemigoIzquierda(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
<<<<<<< HEAD
;src/main.c:459: enemy->mover = SI;
=======
;src/main.c:499: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00114$:
<<<<<<< HEAD
;src/main.c:463: if (dist > G_ENEMY_W + 3) {
=======
;src/main.c:503: if (dist > G_ENEMY_W + 3) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,#0x07
	sub	a, -13 (ix)
	jp	NC,00199$
<<<<<<< HEAD
;src/main.c:464: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
=======
;src/main.c:504: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	h,-6 (ix)
	ld	l,-5 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:465: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
=======
;src/main.c:505: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:466: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
=======
;src/main.c:506: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:467: moverEnemigoDerecha(enemy);
=======
;src/main.c:507: moverEnemigoDerecha(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
<<<<<<< HEAD
;src/main.c:469: enemy->mover = SI;
=======
;src/main.c:509: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00195$:
<<<<<<< HEAD
;src/main.c:474: else if (enemy->x == dx) {
	ld	a,6 (ix)
	sub	a, b
	jp	NZ,00192$
;src/main.c:475: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -6 (ix)
	jp	NC,00129$
;src/main.c:476: if (dist > G_HERO_H + 5) {
=======
;src/main.c:514: else if (enemy->x == dx) {
	ld	a,6 (ix)
	sub	a, b
	jp	NZ,00192$
;src/main.c:515: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -6 (ix)
	jp	NC,00129$
;src/main.c:516: if (dist > G_HERO_H + 5) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,#0x1B
	sub	a, -13 (ix)
	jp	NC,00199$
<<<<<<< HEAD
;src/main.c:477: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
=======
;src/main.c:517: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	d,-6 (ix)
	dec	d
	dec	d
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:478: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
=======
;src/main.c:518: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
=======
;src/main.c:519: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:480: moverEnemigoArriba(enemy);
=======
;src/main.c:520: moverEnemigoArriba(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
<<<<<<< HEAD
;src/main.c:482: enemy->mover = SI;
=======
;src/main.c:522: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00129$:
<<<<<<< HEAD
;src/main.c:486: if(dist > G_ENEMY_H + 7) {
=======
;src/main.c:526: if(dist > G_ENEMY_H + 7) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,#0x1D
	sub	a, -13 (ix)
	jp	NC,00199$
<<<<<<< HEAD
;src/main.c:487: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
=======
;src/main.c:527: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-6 (ix)
	add	a, #0x18
	ld	d,a
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:488: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
=======
;src/main.c:528: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:489: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
=======
;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00199$
<<<<<<< HEAD
;src/main.c:490: moverEnemigoAbajo(enemy);
=======
;src/main.c:530: moverEnemigoAbajo(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
<<<<<<< HEAD
;src/main.c:492: enemy->mover = SI;
=======
;src/main.c:532: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00192$:
<<<<<<< HEAD
;src/main.c:498: if (!prota.mover) distConstraint = 20; // ajuste en parado
=======
;src/main.c:538: if (!prota.mover) distConstraint = 20; // ajuste en parado
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a, (#_prota + 6)
	or	a, a
	jr	NZ,00132$
	ld	c,#0x14
00132$:
<<<<<<< HEAD
;src/main.c:500: if (dist > distConstraint) {
=======
;src/main.c:540: if (dist > distConstraint) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	sub	a, -13 (ix)
	jp	NC,00199$
<<<<<<< HEAD
;src/main.c:501: if (dx + 1 < enemy->x) {
=======
;src/main.c:541: if (dx + 1 < enemy->x) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	e,6 (ix)
	ld	d,#0x00
	inc	de
	ld	-2 (ix),e
	ld	-1 (ix),d
	ld	-4 (ix),b
	ld	-3 (ix),#0x00
	ld	a,-2 (ix)
	sub	a, -4 (ix)
	ld	a,-1 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00427$
	xor	a, #0x80
00427$:
	jp	P,00144$
<<<<<<< HEAD
;src/main.c:502: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
=======
;src/main.c:542: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-6 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00145$
<<<<<<< HEAD
;src/main.c:503: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
=======
;src/main.c:543: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00145$
<<<<<<< HEAD
;src/main.c:504: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
=======
;src/main.c:544: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00145$
<<<<<<< HEAD
;src/main.c:505: moverEnemigoIzquierda(enemy);
=======
;src/main.c:545: moverEnemigoIzquierda(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
<<<<<<< HEAD
;src/main.c:506: movX = 1;
	ld	-14 (ix),#0x01
;src/main.c:507: enemy->mover = SI;
=======
;src/main.c:546: movX = 1;
	ld	-14 (ix),#0x01
;src/main.c:547: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00145$
00144$:
<<<<<<< HEAD
;src/main.c:509: } else if (dx + 1 > enemy->x){
=======
;src/main.c:549: } else if (dx + 1 > enemy->x){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-4 (ix)
	sub	a, -2 (ix)
	ld	a,-3 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00428$
	xor	a, #0x80
00428$:
	jp	P,00145$
<<<<<<< HEAD
;src/main.c:510: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
=======
;src/main.c:550: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	h,-6 (ix)
	ld	l,-5 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00145$
<<<<<<< HEAD
;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
=======
;src/main.c:551: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00145$
<<<<<<< HEAD
;src/main.c:512: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
=======
;src/main.c:552: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00145$
<<<<<<< HEAD
;src/main.c:513: moverEnemigoDerecha(enemy);
=======
;src/main.c:553: moverEnemigoDerecha(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
<<<<<<< HEAD
;src/main.c:514: movX = 1;
	ld	-14 (ix),#0x01
;src/main.c:515: enemy->mover = SI;
=======
;src/main.c:554: movX = 1;
	ld	-14 (ix),#0x01
;src/main.c:555: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00145$:
<<<<<<< HEAD
;src/main.c:518: if (dy < enemy->y) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
;src/main.c:518: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, c
	jp	NC,00155$
;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
=======
;src/main.c:558: if (dy < enemy->y) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
;src/main.c:558: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, c
	jp	NC,00155$
;src/main.c:559: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	d,c
	dec	d
	dec	d
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00156$
<<<<<<< HEAD
;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
=======
;src/main.c:560: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00156$
<<<<<<< HEAD
;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
=======
;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00156$
<<<<<<< HEAD
;src/main.c:522: moverEnemigoArriba(enemy);
=======
;src/main.c:562: moverEnemigoArriba(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
<<<<<<< HEAD
;src/main.c:523: movY = 1;
	ld	-13 (ix),#0x01
;src/main.c:524: enemy->mover = SI;
=======
;src/main.c:563: movY = 1;
	ld	-15 (ix),#0x01
;src/main.c:564: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00156$
00155$:
<<<<<<< HEAD
;src/main.c:527: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
=======
;src/main.c:567: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	add	a, #0x18
	ld	d,a
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00156$
<<<<<<< HEAD
;src/main.c:528: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
=======
;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00156$
<<<<<<< HEAD
;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
=======
;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00156$
<<<<<<< HEAD
;src/main.c:530: moverEnemigoAbajo(enemy);
=======
;src/main.c:570: moverEnemigoAbajo(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
<<<<<<< HEAD
;src/main.c:531: movY = 1;
	ld	-13 (ix),#0x01
;src/main.c:532: enemy->mover = SI;
=======
;src/main.c:571: movY = 1;
	ld	-15 (ix),#0x01
;src/main.c:572: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00156$:
<<<<<<< HEAD
;src/main.c:535: if (!enemy->mover) {
=======
;src/main.c:575: if (!enemy->mover) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00199$
<<<<<<< HEAD
;src/main.c:536: if (!movX) {
	ld	a,-14 (ix)
	or	a, a
	jp	NZ,00171$
;src/main.c:537: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:537: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jp	NC,00168$
;src/main.c:538: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
=======
;src/main.c:576: if (!movX) {
	ld	a,-14 (ix)
	or	a, a
	jp	NZ,00171$
;src/main.c:577: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:577: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jp	NC,00168$
;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,e
	add	a, #0x18
	ld	b,a
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00158$
<<<<<<< HEAD
;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
=======
;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
	ld	b,c
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00158$
<<<<<<< HEAD
;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
=======
;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00158$
<<<<<<< HEAD
;src/main.c:541: moverEnemigoAbajo(enemy);
=======
;src/main.c:581: moverEnemigoAbajo(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
<<<<<<< HEAD
;src/main.c:542: enemy->mover = SI;
=======
;src/main.c:582: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00171$
00158$:
<<<<<<< HEAD
;src/main.c:544: moverEnemigoArriba(enemy);
=======
;src/main.c:584: moverEnemigoArriba(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
<<<<<<< HEAD
;src/main.c:545: enemy->mover = SI;
=======
;src/main.c:585: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00171$
00168$:
<<<<<<< HEAD
;src/main.c:548: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
=======
;src/main.c:588: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	b,e
	dec	b
	dec	b
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00163$
<<<<<<< HEAD
;src/main.c:549: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
=======
;src/main.c:589: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00163$
<<<<<<< HEAD
;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
=======
;src/main.c:590: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00163$
<<<<<<< HEAD
;src/main.c:551: moverEnemigoArriba(enemy);
=======
;src/main.c:591: moverEnemigoArriba(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
<<<<<<< HEAD
;src/main.c:552: enemy->mover = SI;
=======
;src/main.c:592: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00171$
00163$:
<<<<<<< HEAD
;src/main.c:554: moverEnemigoAbajo(enemy);
=======
;src/main.c:594: moverEnemigoAbajo(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
<<<<<<< HEAD
;src/main.c:555: enemy->mover = SI;
=======
;src/main.c:595: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00171$:
<<<<<<< HEAD
;src/main.c:560: if (!movY) {
	ld	a,-13 (ix)
	or	a, a
	jp	NZ,00199$
;src/main.c:561: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:443: u8 dify = abs(enemy->y - prota.y);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
;src/main.c:561: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,c
	sub	a, #0x28
	jp	NC,00183$
;src/main.c:562: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
=======
;src/main.c:600: if (!movY) {
	ld	a,-15 (ix)
	or	a, a
	jp	NZ,00199$
;src/main.c:601: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:483: u8 dify = abs(enemy->y - prota.y);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
;src/main.c:601: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,c
	sub	a, #0x28
	jp	NC,00183$
;src/main.c:602: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00173$
<<<<<<< HEAD
;src/main.c:563: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
=======
;src/main.c:603: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00173$
<<<<<<< HEAD
;src/main.c:564: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
=======
;src/main.c:604: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00173$
<<<<<<< HEAD
;src/main.c:565: moverEnemigoIzquierda(enemy);
=======
;src/main.c:605: moverEnemigoIzquierda(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
<<<<<<< HEAD
;src/main.c:566: enemy->mover = SI;
=======
;src/main.c:606: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00173$:
<<<<<<< HEAD
;src/main.c:568: moverEnemigoDerecha(enemy);
=======
;src/main.c:608: moverEnemigoDerecha(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
<<<<<<< HEAD
;src/main.c:569: enemy->mover = SI;
=======
;src/main.c:609: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00183$:
<<<<<<< HEAD
;src/main.c:572: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
=======
;src/main.c:612: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00178$
<<<<<<< HEAD
;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
=======
;src/main.c:613: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00178$
<<<<<<< HEAD
;src/main.c:574: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
=======
;src/main.c:614: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00178$
<<<<<<< HEAD
;src/main.c:575: moverEnemigoDerecha(enemy);
=======
;src/main.c:615: moverEnemigoDerecha(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
<<<<<<< HEAD
;src/main.c:576: enemy->mover = SI;
=======
;src/main.c:616: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00199$
00178$:
<<<<<<< HEAD
;src/main.c:579: moverEnemigoIzquierda(enemy);
=======
;src/main.c:619: moverEnemigoIzquierda(enemy);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
<<<<<<< HEAD
;src/main.c:580: enemy->mover = SI;
=======
;src/main.c:620: enemy->mover = SI;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00199$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:589: void updateEnemy(TEnemy* actual) { // maquina de estados
=======
;src/main.c:629: void updateEnemy(TEnemy* actual) { // maquina de estados
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function updateEnemy
; ---------------------------------
_updateEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:596: if (actual->engage) { // prioridad a la persecucion, nunca te deja
=======
;src/main.c:636: if (actual->engage) { // prioridad a la persecucion, nunca te deja
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0016
	add	hl,bc
<<<<<<< HEAD
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00115$
;src/main.c:597: engage(actual, prota.x, prota.y);
=======
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00115$
;src/main.c:637: engage(actual, prota.x, prota.y);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a, (#_prota + 1)
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
	jp	00117$
00115$:
<<<<<<< HEAD
;src/main.c:599: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
=======
;src/main.c:639: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
<<<<<<< HEAD
;src/main.c:606: actual->patrolling = 0;
	ld	hl,#0x000B
	add	hl,bc
	ld	-10 (ix),l
	ld	-9 (ix),h
;src/main.c:600: if (actual->patrolling) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	l,(hl)
;src/main.c:603: if (actual->in_range) {
=======
;src/main.c:645: actual->patrolling = 0;
	ld	hl,#0x000B
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:640: if (actual->patrolling) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
;src/main.c:643: if (actual->in_range) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	add	a, #0x11
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
<<<<<<< HEAD
;src/main.c:612: actual->seek = 1;
	ld	a,c
	add	a, #0x14
	ld	-12 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-11 (ix),a
;src/main.c:600: if (actual->patrolling) {
	ld	a,l
	or	a, a
	jp	Z,00112$
;src/main.c:602: moverEnemigoPatrol(actual);
=======
;src/main.c:651: actual->seek = 1;
	ld	a,c
	add	a, #0x14
	ld	-8 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-7 (ix),a
;src/main.c:640: if (actual->patrolling) {
	ld	a,l
	or	a, a
	jp	Z,00112$
;src/main.c:642: moverEnemigoPatrol(actual);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	push	de
	push	bc
	call	_moverEnemigoPatrol
	pop	af
	pop	de
	pop	bc
<<<<<<< HEAD
;src/main.c:603: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00104$
;src/main.c:605: engage(actual, prota.x, prota.y);
=======
;src/main.c:643: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00104$
;src/main.c:644: engage(actual, prota.x, prota.y);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a, (#_prota + 1)
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
<<<<<<< HEAD
;src/main.c:606: actual->patrolling = 0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
;src/main.c:607: actual->engage = 1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00117$
00104$:
;src/main.c:608: } else if (actual->seen) {
=======
;src/main.c:645: actual->patrolling = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:646: actual->engage = 1;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00117$
00104$:
;src/main.c:647: } else if (actual->seen) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0012
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00117$
<<<<<<< HEAD
;src/main.c:609: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-3 (ix),a
=======
;src/main.c:648: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-9 (ix),a
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d,(hl)
	ld	a,(bc)
<<<<<<< HEAD
	ld	-4 (ix),a
=======
	ld	-12 (ix),a
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
<<<<<<< HEAD
	ld	a,-3 (ix)
=======
	ld	a,-9 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
<<<<<<< HEAD
	ld	a,-4 (ix)
=======
	ld	a,-12 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
<<<<<<< HEAD
;src/main.c:610: actual->p_seek_x = actual->x;
=======
;src/main.c:649: actual->p_seek_x = actual->x;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0017
	add	hl,bc
	ex	de,hl
	ld	a,(bc)
	ld	(de),a
<<<<<<< HEAD
;src/main.c:611: actual->p_seek_y = actual->y;
=======
;src/main.c:650: actual->p_seek_y = actual->y;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0018
	add	hl,bc
	ex	de,hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	(de),a
<<<<<<< HEAD
;src/main.c:612: actual->seek = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:613: actual->iter=0;
=======
;src/main.c:651: actual->seek = 1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/main.c:652: actual->iter=0;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x000E
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
<<<<<<< HEAD
;src/main.c:614: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:615: actual->patrolling = 0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
;src/main.c:616: actual->seen = 0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
	jr	00117$
00112$:
;src/main.c:618: } else if (actual->seek) {
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:619: moverEnemigoSeek(actual);
=======
;src/main.c:653: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:654: actual->patrolling = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:655: actual->seen = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
	jr	00117$
00112$:
;src/main.c:657: } else if (actual->seek) {
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:658: moverEnemigoSeek(actual);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	push	de
	push	bc
	call	_moverEnemigoSeek
	pop	af
	pop	de
	pop	bc
<<<<<<< HEAD
;src/main.c:620: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00117$
;src/main.c:621: engage(actual, prota.x, prota.y);
=======
;src/main.c:659: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00117$
;src/main.c:660: engage(actual, prota.x, prota.y);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a, (#_prota + 1)
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
<<<<<<< HEAD
;src/main.c:622: actual->seek = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:623: actual->engage = 1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
;src/main.c:624: } else if (actual->seen) {
=======
;src/main.c:661: actual->seek = 0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
;src/main.c:662: actual->engage = 1;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
;src/main.c:663: } else if (actual->seen) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
00117$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:631: void inicializarEnemy() {
=======
;src/main.c:670: void inicializarEnemy() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function inicializarEnemy
; ---------------------------------
_inicializarEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:632: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-7 (ix),a
;src/main.c:642: actual = enemy;
	ld	de,#_enemy+0
;src/main.c:643: while(i){
=======
;src/main.c:671: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-1 (ix),a
;src/main.c:681: actual = enemy;
	ld	de,#_enemy+0
;src/main.c:682: while(i){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
00101$:
	ld	a,-7 (ix)
	or	a, a
	jp	Z,00104$
<<<<<<< HEAD
;src/main.c:644: --i;
	dec	-7 (ix)
;src/main.c:645: actual->x = actual->px = spawnX[i];
=======
;src/main.c:683: --i;
	dec	-1 (ix)
;src/main.c:684: actual->x = actual->px = spawnX[i];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a,#<(_spawnX)
	add	a, -7 (ix)
	ld	-3 (ix),a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	(bc),a
	ld	(de),a
<<<<<<< HEAD
;src/main.c:646: actual->y = actual->py = spawnY[i];
=======
;src/main.c:685: actual->y = actual->py = spawnY[i];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	de
	pop	iy
	inc	iy
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a,#<(_spawnY)
	add	a, -7 (ix)
	ld	-5 (ix),a
	ld	a,#>(_spawnY)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	(bc),a
	ld	0 (iy), a
<<<<<<< HEAD
;src/main.c:647: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:648: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x03
;src/main.c:649: actual->sprite = g_enemy;
=======
;src/main.c:686: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:687: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x03
;src/main.c:688: actual->sprite = g_enemy;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
<<<<<<< HEAD
;src/main.c:650: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
;src/main.c:651: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x00
;src/main.c:652: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x01
;src/main.c:653: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x00
;src/main.c:654: actual->iter = 0;
=======
;src/main.c:689: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
;src/main.c:690: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x00
;src/main.c:691: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x01
;src/main.c:692: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x00
;src/main.c:693: actual->iter = 0;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x000E
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
<<<<<<< HEAD
;src/main.c:655: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,de
	ld	(hl),#0x00
;src/main.c:656: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x00
;src/main.c:657: actual->found = 0;
	ld	hl,#0x0013
	add	hl,de
	ld	(hl),#0x00
;src/main.c:658: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
=======
;src/main.c:694: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,de
	ld	(hl),#0x00
;src/main.c:695: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x00
;src/main.c:696: actual->found = 0;
	ld	hl,#0x0013
	add	hl,de
	ld	(hl),#0x00
;src/main.c:697: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_patrolY
	add	hl,bc
	ld	a,l
	add	a, -7 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-1 (ix),a
	ld	hl,#_patrolX
	add	hl,bc
	ld	c,-7 (ix)
	ld	b,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	-6 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	c,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	b,(hl)
	push	de
	ld	hl,(_mapa)
	push	hl
	push	de
	ld	h,-1 (ix)
	ld	l,-6 (ix)
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	de
<<<<<<< HEAD
;src/main.c:681: dibujarEnemigo(actual);
=======
;src/main.c:718: dibujarEnemigo(actual);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	de
	push	de
	call	_dibujarEnemigo
	pop	af
	pop	de
<<<<<<< HEAD
;src/main.c:682: ++actual;
=======
;src/main.c:719: ++actual;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x00E2
	add	hl,de
	ex	de,hl
	jp	00101$
00104$:
	ld	sp, ix
	pop	ix
	ret
<<<<<<< HEAD
;src/main.c:686: void avanzarMapa() {
=======
;src/main.c:723: void avanzarMapa() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
<<<<<<< HEAD
;src/main.c:687: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:688: mapa = mapas[++num_mapa];
=======
;src/main.c:724: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:725: mapa = mapas[++num_mapa];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	bc,#_mapas+0
	ld	hl, #_num_mapa+0
	inc	(hl)
	ld	iy,#_num_mapa
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
<<<<<<< HEAD
;src/main.c:689: prota.x = prota.px = 2;
=======
;src/main.c:726: prota.x = prota.px = 2;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
<<<<<<< HEAD
;src/main.c:690: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:691: dibujarMapa();
	call	_dibujarMapa
;src/main.c:692: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:695: menuFin(puntuacion);
=======
;src/main.c:727: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:728: dibujarMapa();
	call	_dibujarMapa
;src/main.c:729: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:732: menuFin(puntuacion);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	jp  _menuFin
<<<<<<< HEAD
;src/main.c:699: void moverIzquierda() {
=======
;src/main.c:736: void moverIzquierda() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
<<<<<<< HEAD
;src/main.c:700: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:701: if (!checkCollision(M_izquierda)) {
=======
;src/main.c:737: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:738: if (!checkCollision(M_izquierda)) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
<<<<<<< HEAD
;src/main.c:702: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:703: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:704: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:708: void moverDerecha() {
=======
;src/main.c:739: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:740: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:741: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:745: void moverDerecha() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
<<<<<<< HEAD
;src/main.c:709: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:710: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
=======
;src/main.c:746: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:747: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	xor	a, a
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
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
<<<<<<< HEAD
;src/main.c:711: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:712: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:713: prota.sprite = g_hero;
=======
;src/main.c:748: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:749: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:750: prota.sprite = g_hero;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
<<<<<<< HEAD
;src/main.c:715: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:716: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:720: void moverArriba() {
=======
;src/main.c:752: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:753: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:757: void moverArriba() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
<<<<<<< HEAD
;src/main.c:721: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:722: if (!checkCollision(M_arriba)) {
=======
;src/main.c:758: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:759: if (!checkCollision(M_arriba)) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,#0x02
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
<<<<<<< HEAD
;src/main.c:723: prota.y--;
=======
;src/main.c:760: prota.y--;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
<<<<<<< HEAD
;src/main.c:724: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:725: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:726: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:730: void moverAbajo() {
=======
;src/main.c:761: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:762: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:763: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:767: void moverAbajo() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
<<<<<<< HEAD
;src/main.c:731: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:732: if (!checkCollision(M_abajo) ) {
=======
;src/main.c:768: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:769: if (!checkCollision(M_abajo) ) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,#0x03
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
<<<<<<< HEAD
;src/main.c:733: prota.y++;
=======
;src/main.c:770: prota.y++;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
<<<<<<< HEAD
;src/main.c:734: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:735: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:736: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:743: void intHandler() {
=======
;src/main.c:771: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:772: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:773: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:780: void intHandler() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
<<<<<<< HEAD
;src/main.c:744: if (++i == 6) {
=======
;src/main.c:781: if (++i == 6) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_i+0
	inc	(hl)
	ld	a,(#_i + 0)
	sub	a, #0x06
	ret	NZ
<<<<<<< HEAD
;src/main.c:745: play();
	call	_play
;src/main.c:746: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:750: void inicializarCPC() {
=======
;src/main.c:782: play();
	call	_play
;src/main.c:783: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:787: void inicializarCPC() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
<<<<<<< HEAD
;src/main.c:751: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:752: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:753: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:754: cpct_setPalette(g_palette, 16);
=======
;src/main.c:788: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:789: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:790: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:791: cpct_setPalette(g_palette, 16);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
	ret
<<<<<<< HEAD
;src/main.c:759: void inicializarJuego() {
=======
;src/main.c:796: void inicializarJuego() {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
<<<<<<< HEAD
;src/main.c:761: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:762: mapa = mapas[num_mapa];
=======
;src/main.c:798: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:799: mapa = mapas[num_mapa];
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
<<<<<<< HEAD
;src/main.c:763: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:765: dibujarMapa();
	call	_dibujarMapa
;src/main.c:768: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:771: prota.x = prota.px = 4;
=======
;src/main.c:800: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:802: dibujarMapa();
	call	_dibujarMapa
;src/main.c:805: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:808: prota.x = prota.px = 4;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
<<<<<<< HEAD
;src/main.c:772: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
=======
;src/main.c:809: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
<<<<<<< HEAD
;src/main.c:773: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:774: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:775: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:779: cu.x = cu.px = 0;
=======
;src/main.c:810: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:811: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:812: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:816: cu.x = cu.px = 0;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
<<<<<<< HEAD
;src/main.c:780: cu.y = cu.py = 0;
=======
;src/main.c:817: cu.y = cu.py = 0;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
<<<<<<< HEAD
;src/main.c:781: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:782: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:783: cu.off_bound = NO;
	ld	hl,#(_cu + 0x000a)
	ld	(hl),#0x00
;src/main.c:785: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:787: dibujarProta();
	jp  _dibujarProta
;src/main.c:790: void main(void) {
=======
;src/main.c:818: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:819: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:820: cu.off_bound = NO;
	ld	hl,#(_cu + 0x000a)
	ld	(hl),#0x00
;src/main.c:822: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:824: dibujarProta();
	jp  _dibujarProta
;src/main.c:827: void main(void) {
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
<<<<<<< HEAD
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:795: inicializarCPC();
	call	_inicializarCPC
;src/main.c:797: menuInicio();
	call	_menuInicio
;src/main.c:799: inicializarJuego();
	call	_inicializarJuego
;src/main.c:803: while (1) {
00126$:
;src/main.c:806: actual = enemy;
;src/main.c:808: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
=======
	push	af
	dec	sp
;src/main.c:832: inicializarCPC();
	call	_inicializarCPC
;src/main.c:834: menuInicio();
	call	_menuInicio
;src/main.c:836: inicializarJuego();
	call	_inicializarJuego
;src/main.c:840: while (1) {
00119$:
;src/main.c:842: i = 2 + num_mapa;
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	inc	c
;src/main.c:843: actual = enemy;
;src/main.c:845: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
	push	bc
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_prota
	push	hl
	ld	hl,#_cu
	push	hl
	call	_comprobarTeclado
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
;src/main.c:809: moverCuchillo(&cu, mapa);
=======
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_cu
	push	hl
	call	_moverCuchillo
	pop	af
	pop	af
<<<<<<< HEAD
;src/main.c:810: while(i){
	ld	-6 (ix),#0x02
	ld	-4 (ix),#<(_enemy)
	ld	-3 (ix),#>(_enemy)
00105$:
	ld	a,-6 (ix)
	or	a, a
	jr	Z,00107$
;src/main.c:812: --i;
	dec	-6 (ix)
;src/main.c:813: if(!actual->muerto){
	ld	a,-4 (ix)
	add	a, #0x08
	ld	-2 (ix),a
=======
	pop	bc
;src/main.c:847: while(i){
	ld	-3 (ix),c
	ld	-2 (ix),#<(_enemy)
	ld	-1 (ix),#>(_enemy)
00101$:
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
<<<<<<< HEAD
	jr	NZ,00102$
;src/main.c:814: checkEnemyDead(cu.direccion, actual);
	ld	hl, #_cu + 7
	ld	b,(hl)
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	inc	sp
	call	_checkEnemyDead
	pop	af
	inc	sp
00102$:
;src/main.c:816: if(!actual->muerto){
=======
	jr	Z,00103$
;src/main.c:848: --i;
	dec	-3 (ix)
;src/main.c:849: updateEnemy(actual);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;src/main.c:817: updateEnemy(actual);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_updateEnemy
	pop	af
<<<<<<< HEAD
00104$:
;src/main.c:819: ++actual;
	ld	a,-4 (ix)
=======
;src/main.c:850: ++actual;
	ld	a,-2 (ix)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	add	a, #0xE2
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
<<<<<<< HEAD
	ld	-3 (ix),a
	jr	00105$
00107$:
;src/main.c:822: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:825: if (prota.mover) {
	ld	bc,#_prota + 6
	ld	a,(bc)
	or	a, a
	jr	Z,00109$
;src/main.c:826: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:827: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00109$:
;src/main.c:829: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	c,(hl)
;src/main.c:830: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
;src/main.c:829: if(cu.lanzado && cu.mover){
=======
	ld	-1 (ix),a
	jr	00101$
00103$:
;src/main.c:853: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:856: if (prota.mover) {
	ld	bc,#_prota + 6
	ld	a,(bc)
	or	a, a
	jr	Z,00105$
;src/main.c:857: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:858: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00105$:
;src/main.c:860: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	c,(hl)
;src/main.c:861: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
;src/main.c:860: if(cu.lanzado && cu.mover){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	or	a, a
	jr	Z,00114$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
<<<<<<< HEAD
	jr	Z,00114$
;src/main.c:830: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
=======
	jr	Z,00110$
;src/main.c:861: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	hl, #_cu + 0
	ld	b,(hl)
	ld	hl, #(_cu + 0x0008) + 0
	ld	e,(hl)
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#_cu
	push	hl
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_redibujarCuchillo
	ld	hl,#9
	add	hl,sp
	ld	sp,hl
<<<<<<< HEAD
	jr	00115$
00114$:
;src/main.c:831: }else if (cu.lanzado && !cu.mover){
=======
	jr	00111$
00110$:
;src/main.c:862: }else if (cu.lanzado && !cu.mover){
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	a,c
	or	a, a
	jr	Z,00115$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
<<<<<<< HEAD
	jr	NZ,00115$
;src/main.c:832: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
=======
	jr	NZ,00111$
;src/main.c:863: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl, #(_cu + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	hl, #(_cu + 0x0008) + 0
	ld	d,(hl)
	ld	hl,(_mapa)
	push	hl
	push	bc
	push	de
	inc	sp
	call	_borrarCuchillo
	pop	af
	pop	af
	inc	sp
<<<<<<< HEAD
;src/main.c:833: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00115$:
;src/main.c:837: actual = enemy;
	ld	bc,#_enemy
;src/main.c:838: while(i){
	ld	-6 (ix),#0x02
00122$:
	ld	a,-6 (ix)
	or	a, a
	jp	Z,00124$
;src/main.c:840: --i;
	dec	-6 (ix)
;src/main.c:841: if(actual->mover){
	ld	hl,#0x0006
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00118$
;src/main.c:842: redibujarEnemigo((*actual).px, (*actual).py, actual);
=======
;src/main.c:864: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00111$:
;src/main.c:867: i = 2 + num_mapa;
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-2 (ix),a
;src/main.c:868: actual = enemy;
	ld	bc,#_enemy
;src/main.c:869: while(i){
00115$:
	ld	a,-2 (ix)
	or	a, a
	jr	Z,00117$
;src/main.c:871: --i;
	dec	-2 (ix)
;src/main.c:872: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00114$
;src/main.c:873: redibujarEnemigo((*actual).px, (*actual).py, actual);
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	d,(hl)
	push	bc
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_redibujarEnemigo
	pop	af
	pop	af
	pop	bc
<<<<<<< HEAD
00118$:
;src/main.c:844: if (actual->muerto && actual->muertes == 0){
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	Z,00120$
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jr	NZ,00120$
;src/main.c:845: borrarEnemigo((*actual).x, (*actual).y);
	ld	hl,#0x0001
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	push	af
	ld	a,(bc)
	ld	-5 (ix),a
	pop	af
	push	bc
	push	de
	push	af
	inc	sp
	ld	a,-5 (ix)
	push	af
	inc	sp
	call	_borrarEnemigo
	pop	af
	pop	de
	pop	bc
;src/main.c:846: dibujarExplosion(actual);
	push	bc
	push	de
	push	bc
	call	_dibujarExplosion
	pop	af
	pop	de
	pop	bc
;src/main.c:847: puntuacion_aux = puntuacion;
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
;src/main.c:848: puntuacion = aumentarPuntuacion(puntuacion_aux);
	push	bc
	push	de
	push	hl
	call	_aumentarPuntuacion
	pop	af
	pop	de
	pop	bc
	ld	iy,#_puntuacion
	ld	0 (iy),l
;src/main.c:849: modificarPuntuacion(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	push	bc
	push	de
	push	hl
	call	_modificarPuntuacion
	pop	af
	pop	de
	pop	bc
;src/main.c:850: actual->mover = NO;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:851: actual->muertes++;
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:852: actual->x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:853: actual->y = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
00120$:
;src/main.c:855: ++actual;
=======
00114$:
;src/main.c:886: ++actual;
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	ld	hl,#0x00E2
	add	hl,bc
	ld	c,l
	ld	b,h
<<<<<<< HEAD
	jp	00122$
00124$:
;src/main.c:857: cpct_waitVSYNC();
=======
	jr	00115$
00117$:
;src/main.c:888: cpct_waitVSYNC();
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
	call	_cpct_waitVSYNC
	jp	00126$
	.area _CODE
	.area _INITIALIZER
__xinit__mapa:
	.dw #0x0000
__xinit__num_mapa:
	.db #0x00	; 0
__xinit__puntuacion:
	.db #0x00	; 0
__xinit__vidas:
	.db #0x05	; 5
	.area _CABS (ABS)
