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
	.globl _puntuacion
	.globl _num_mapa
	.globl _mapa
	.globl _i
	.globl _vidas
	.globl _timer
	.globl _cambio
	.globl _parpadeo
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
	.ds 908
_prota::
	.ds 8
_cu::
	.ds 11
_parpadeo::
	.ds 1
_cambio::
	.ds 1
_timer::
	.ds 2
_vidas::
	.ds 1
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
;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
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
;src/main.c:114: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
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
	push	af
	dec	sp
;src/main.c:129: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:132: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:134: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
;src/main.c:144: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:145: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:147: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:148: if (cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:149: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorRight)){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:151: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorUp)){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:153: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:154: }else if (cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:155: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:156: }else if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:157: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
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
;src/main.c:162: u8 checkCollision(u8 direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:163: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:165: switch (direction) {
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
;src/main.c:166: case 0:
00101$:
;src/main.c:167: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
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
;src/main.c:168: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
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
;src/main.c:169: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
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
;src/main.c:170: break;
	jp	00105$
;src/main.c:171: case 1:
00102$:
;src/main.c:172: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
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
;src/main.c:173: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
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
;src/main.c:174: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
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
;src/main.c:175: break;
	jr	00105$
;src/main.c:176: case 2:
00103$:
;src/main.c:177: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
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
;src/main.c:178: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
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
;src/main.c:179: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:180: break;
	jr	00105$
;src/main.c:181: case 3:
00104$:
;src/main.c:182: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
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
;src/main.c:183: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
;src/main.c:184: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:186: }
00105$:
;src/main.c:188: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
;src/main.c:189: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:191: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:194: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:199: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	d,(hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
;src/main.c:204: void borrarExplosion(u8 x, u8 y) {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:207: u8 w = 4 + (x & 1);
	ld	a,4 (ix)
	and	a, #0x01
	ld	c,a
	inc	c
	inc	c
	inc	c
	inc	c
;src/main.c:208: u8 h = 6 + (y & 3 ? 1 : 0);
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
;src/main.c:210: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	hl,(_mapa)
	ex	(sp), hl
	ld	e,5 (ix)
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
	ld	e,l
	ld	d,4 (ix)
	srl	d
	pop	hl
	push	hl
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
;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
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
;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	hl,(_mapa)
	ex	(sp), hl
	ld	e,5 (ix)
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
	ld	e,l
	ld	d,4 (ix)
	srl	d
	pop	hl
	push	hl
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
;src/main.c:225: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:226: borrarEnemigo(x, y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:227: enemy->px = enemy->x;
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:228: enemy->py = enemy->y;
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
;src/main.c:229: dibujarEnemigo(enemy);
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
;src/main.c:235: switch (direction) {
	ld	a,#0x03
	sub	a, 4 (ix)
	jp	C,00134$
;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
	ld	a,5 (ix)
	ld	-4 (ix),a
	ld	a,6 (ix)
	ld	-3 (ix),a
	ld	a,-4 (ix)
	add	a, #0x01
	ld	-2 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
;src/main.c:242: enemy->muerto = SI;
	ld	a,-4 (ix)
	add	a, #0x08
	ld	-6 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
;src/main.c:235: switch (direction) {
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00204$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00204$:
	jp	00101$
	jp	00109$
	jp	00117$
	jp	00125$
;src/main.c:238: case 0:
00101$:
;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
	ld	hl, #_cu + 1
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	jp	M,00134$
	ld	de,#0x0016
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00206$
	xor	a, #0x80
00206$:
	jp	M,00134$
;src/main.c:240: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	ld	l,c
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00207$
	xor	a, #0x80
00207$:
	jp	P,00134$
;src/main.c:241: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
	cp	a, a
	sbc	hl, de
	ld	a,#0x01
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00208$
	xor	a, #0x80
00208$:
	jp	M,00134$
;src/main.c:242: enemy->muerto = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:246: break;
	jp	00134$
;src/main.c:247: case 1:
00109$:
;src/main.c:248: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
	ld	hl, #_cu + 1
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00209$
	xor	a, #0x80
00209$:
	jp	M,00134$
	ld	de,#0x0016
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00210$
	xor	a, #0x80
00210$:
	jp	M,00134$
;src/main.c:249: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	ld	d,#0x00
	inc	de
	inc	de
	inc	de
	inc	de
	ld	l,c
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00211$
	xor	a, #0x80
00211$:
	jp	P,00134$
;src/main.c:250: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
	cp	a, a
	sbc	hl, de
	ld	a,#0x01
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00212$
	xor	a, #0x80
00212$:
	jp	M,00134$
;src/main.c:251: enemy->muerto = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:255: break;
	jp	00134$
;src/main.c:257: case 2:
00117$:
;src/main.c:258: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00213$
	xor	a, #0x80
00213$:
	jp	M,00134$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00214$
	xor	a, #0x80
00214$:
	jp	M,00134$
;src/main.c:259: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0016
	add	hl,de
	ex	de,hl
	ld	l,c
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00215$
	xor	a, #0x80
00215$:
	jp	P,00134$
;src/main.c:260: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
	cp	a, a
	sbc	hl, de
	ld	a,#0x02
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00216$
	xor	a, #0x80
00216$:
	jp	M,00134$
;src/main.c:261: enemy->muerto = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:265: break;
	jr	00134$
;src/main.c:266: case 3:
00125$:
;src/main.c:267: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	b,#0x00
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00217$
	xor	a, #0x80
00217$:
	jp	M,00134$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00218$
	xor	a, #0x80
00218$:
	jp	M,00134$
;src/main.c:268: if(enemy->y>cu.y){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00134$
;src/main.c:269: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
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
	jp	PO, 00219$
	xor	a, #0x80
00219$:
	jp	M,00134$
;src/main.c:270: enemy->muerto = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:275: }
00134$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:278: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:279: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:280: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:281: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:284: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:285: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:286: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:287: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:290: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:291: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:292: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:293: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:296: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:297: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:298: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:299: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:302: void moverEnemigoPatrol(TEnemy* enemy){
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
;src/main.c:304: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00118$
;src/main.c:305: if (!enemy->reversePatrol) {
	ld	hl,#0x000C
	add	hl,bc
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-1 (ix),a
;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
	ld	hl,#0x000E
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x00E2
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
;src/main.c:308: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
	ld	hl,#0x001A
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
	ld	hl,#0x0001
	add	hl,bc
	ex	(sp), hl
;src/main.c:305: if (!enemy->reversePatrol) {
	ld	a,-1 (ix)
	or	a, a
	jp	NZ,00114$
;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
	ld	l,-3 (ix)
	ld	h,-2 (ix)
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
;src/main.c:307: if(enemy->iter == 0){
	ld	a,d
	or	a,e
	jr	NZ,00102$
;src/main.c:308: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:309: enemy->iter = 2;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:311: ++enemy->iter;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,bc
	ld	e,(hl)
	pop	hl
	push	hl
	ld	(hl),e
;src/main.c:313: ++enemy->iter;
	inc	bc
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00118$
00102$:
;src/main.c:315: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:316: enemy->x = enemy->camino[enemy->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:317: ++enemy->iter;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	de
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:318: enemy->y = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	pop	hl
	push	hl
	ld	(hl),a
;src/main.c:319: ++enemy->iter;
	inc	de
	ld	c,e
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),d
	jp	00118$
00105$:
;src/main.c:323: enemy->mover = NO;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:324: enemy->iter = enemy->longitud_camino;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	c,(hl)
	ld	b,#0x00
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:325: enemy->reversePatrol = 1;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x01
	jp	00118$
00114$:
;src/main.c:328: if(enemy->iter > 0){
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00145$
	xor	a, #0x80
00145$:
	jp	P,00111$
;src/main.c:329: if(enemy->iter == enemy->longitud_camino){
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	l,(hl)
	ld	-3 (ix),l
	ld	-2 (ix),#0x00
	ld	a,e
	sub	a, -3 (ix)
	jp	NZ,00108$
	ld	a,d
	sub	a, -2 (ix)
	jp	NZ,00108$
;src/main.c:330: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:331: enemy->iter = enemy->iter - 1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0xFF
	ld	-3 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-2 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-3 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-2 (ix)
	ld	(hl),a
;src/main.c:332: enemy->iter = enemy->iter - 2;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	dec	de
	dec	de
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:333: enemy->y = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	e,(hl)
	pop	hl
	push	hl
	ld	(hl),e
;src/main.c:334: --enemy->iter;
	ld	a,-3 (ix)
	add	a,#0xFD
	ld	e,a
	ld	a,-2 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:335: enemy->x = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:336: --enemy->iter;
	ld	a,-3 (ix)
	add	a,#0xFC
	ld	c,a
	ld	a,-2 (ix)
	adc	a,#0xFF
	ld	b,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jr	00118$
00108$:
;src/main.c:338: enemy->mover = SI;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:339: enemy->y = enemy->camino[enemy->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	e,(hl)
	pop	hl
	push	hl
	ld	(hl),e
;src/main.c:340: --enemy->iter;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:341: enemy->x = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:342: --enemy->iter;
	dec	de
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jr	00118$
00111$:
;src/main.c:346: enemy->mover = NO;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:347: enemy->iter = 0;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:348: enemy->reversePatrol = 0;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x00
00118$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:354: void lookFor(TEnemy* enemy){
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
;src/main.c:360: i16 difx = abs((i16)(enemy->x - prota.x));
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
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:361: i16 dify = abs((i16)(enemy->y - prota.y));
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
;src/main.c:363: dist = difx + dify; // manhattan
	ld	c,-6 (ix)
	add	hl, bc
	ld	-7 (ix),l
;src/main.c:364: enemy->seen = NO;
	ld	hl,#0x0012
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:365: enemy->in_range = NO;
	ld	hl,#0x0011
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;src/main.c:367: if(!enemy->seek){
	push	de
	pop	iy
	ld	a,20 (iy)
	or	a, a
	jp	NZ,00111$
;src/main.c:368: if (dist <= 17) {// te detectan los sensores de proximidad
	ld	a,#0x11
	sub	a, -7 (ix)
	jr	C,00107$
;src/main.c:369: enemy->in_range = 1;
	ld	a,#0x01
	ld	(bc),a
;src/main.c:370: enemy->engage = 1;
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x01
;src/main.c:371: enemy->seen = SI;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
	jr	00111$
00107$:
;src/main.c:372: }else if(prota.x > enemy->x - 20 && prota.x < enemy->x + 20
	ld	hl, #_prota + 0
	ld	c,(hl)
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	add	a,#0xEC
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
	ld	hl,#0x0014
	add	hl,de
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	P,00111$
;src/main.c:373: && prota.y > enemy->y - 20*2 && prota.y < enemy->y + 20*2){
	ld	hl, #(_prota + 0x0001) + 0
	ld	c,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	a,e
	add	a,#0xD8
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
	ld	hl,#0x0028
	add	hl,de
	ld	a,c
	sub	a, l
	ld	a,b
	sbc	a, h
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P,00111$
;src/main.c:374: enemy->seen = SI;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
00111$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:379: void moverEnemigoSeek(TEnemy* actual){
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
;src/main.c:381: if(!actual->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a, 8 (iy)
	or	a, a
	jp	NZ,00114$
;src/main.c:384: if(actual->iter < actual->longitud_camino){
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
	ld	l, c
	ld	h, b
	ld	de, #0x00E2
	add	hl, de
	ld	e,(hl)
	ld	d,#0x00
;src/main.c:393: actual->y = actual->camino[actual->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:384: if(actual->iter < actual->longitud_camino){
	ld	a,-4 (ix)
	sub	a, e
	ld	a,-3 (ix)
	sbc	a, d
	jp	PO, 00136$
	xor	a, #0x80
00136$:
	jp	P,00110$
;src/main.c:389: actual->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
;src/main.c:391: actual->x = actual->camino[actual->iter];
	ld	a,c
	add	a, #0x1A
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
;src/main.c:387: if(actual->iter == 0){
	ld	a,-3 (ix)
	or	a,-4 (ix)
	jr	NZ,00102$
;src/main.c:389: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:390: actual->iter = 2;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:391: actual->x = actual->camino[actual->iter];
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:392: ++actual->iter;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:393: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:394: ++actual->iter;
	inc	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00114$
00102$:
;src/main.c:397: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:398: actual->x = actual->camino[actual->iter];
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:399: ++actual->iter;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:400: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:401: ++actual->iter;
	inc	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00114$
00110$:
;src/main.c:407: actual->seek = 0;
	ld	hl,#0x0014
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:408: lookFor(actual);
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
;src/main.c:409: if(!actual->seen){
	ld	l, c
	ld	h, b
	ld	de, #0x0012
	add	hl, de
	ld	a,(hl)
	ld	-7 (ix),a
;src/main.c:410: actual->patrolling = 1;
	ld	hl,#0x000B
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/main.c:409: if(!actual->seen){
	ld	a,-7 (ix)
	or	a, a
	jr	NZ,00107$
;src/main.c:410: actual->patrolling = 1;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
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
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	jr	00108$
00107$:
;src/main.c:413: actual->patrolling = 0;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/main.c:414: if(!actual->engage){
	push	bc
	pop	iy
	ld	a,22 (iy)
	or	a, a
	jr	NZ,00108$
;src/main.c:415: actual->seek = 1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:416: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
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
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a,-9 (ix)
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
00108$:
;src/main.c:419: actual->iter = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00114$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:425: void engage(TEnemy *enemy, u8 dx, u8 dy) {
;	---------------------------------
; Function engage
; ---------------------------------
_engage::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	a,4 (ix)
	ld	-15 (ix),a
	ld	a,5 (ix)
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
	ld	a,-15 (ix)
	add	a, #0x01
	ld	-13 (ix),a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	-12 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
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
;src/main.c:428: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-19 (ix),l
;src/main.c:430: u8 movX = 0;
	ld	-16 (ix),#0x00
;src/main.c:431: u8 movY = 0;
	ld	-17 (ix),#0x00
;src/main.c:432: u8 distConstraint = 25;
	ld	-18 (ix),#0x19
;src/main.c:433: enemy->mover = NO;
	ld	a,-15 (ix)
	add	a, #0x06
	ld	-11 (ix),a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x00
;src/main.c:442: enemy->patrolling = 1;
	ld	a,-15 (ix)
	add	a, #0x0B
	ld	c,a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	b,a
;src/main.c:435: if (dist < 20) {
	ld	a,-19 (ix)
	sub	a, #0x14
	jr	NC,00104$
;src/main.c:436: vidas--;
	ld	hl, #_vidas+0
	dec	(hl)
;src/main.c:437: if (vidas == 1) {
	ld	a,(#_vidas + 0)
	dec	a
	jr	NZ,00102$
;src/main.c:438: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	push	bc
	call	_menuFin
	pop	bc
00102$:
;src/main.c:442: enemy->patrolling = 1;
	ld	a,#0x01
	ld	(bc),a
;src/main.c:443: enemy->engage = 0;
	ld	a,-15 (ix)
	add	a, #0x16
	ld	e,a
	ld	a,-14 (ix)
	adc	a, #0x00
	ld	d,a
	xor	a, a
	ld	(de),a
00104$:
;src/main.c:446: if (!enemy->patrolling) {
	ld	a,(bc)
	ld	-9 (ix), a
	or	a, a
	jp	NZ,00205$
;src/main.c:447: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
;src/main.c:460: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	-8 (ix), a
	add	a, #0x04
	ld	-7 (ix),a
;src/main.c:447: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
	ld	a,-9 (ix)
	sub	a, 7 (ix)
	jr	Z,00198$
	ld	c,7 (ix)
	ld	b,#0x00
	ld	hl,#0x0001
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	e,-9 (ix)
	ld	d,#0x00
	ld	a,e
	sub	a, -6 (ix)
	jr	NZ,00442$
	ld	a,d
	sub	a, -5 (ix)
	jr	Z,00198$
00442$:
	dec	bc
	ld	a,e
	sub	a, c
	jp	NZ,00199$
	ld	a,d
	sub	a, b
	jp	NZ,00199$
00198$:
;src/main.c:448: if (dx < enemy->x) { // izquierda
	ld	a,6 (ix)
	sub	a, -8 (ix)
	jr	NC,00118$
;src/main.c:449: if (dist > 11) {
	ld	a,#0x0B
	sub	a, -19 (ix)
	jp	NC,00205$
;src/main.c:450: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
	ld	h,-9 (ix)
	ld	l,-8 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00205$
;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00205$
;src/main.c:452: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	c, (hl)
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00205$
;src/main.c:453: moverEnemigoIzquierda(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:455: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00205$
00118$:
;src/main.c:459: if (dist > G_ENEMY_W + 3) {
	ld	a,#0x07
	sub	a, -19 (ix)
	jp	NC,00205$
;src/main.c:460: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	h,-9 (ix)
	ld	l,-7 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00205$
;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jp	C,00205$
;src/main.c:462: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jp	C,00205$
;src/main.c:463: moverEnemigoDerecha(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:465: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00205$
00199$:
;src/main.c:470: else if (enemy->x == dx) {
	ld	a,-8 (ix)
	sub	a, 6 (ix)
	jp	NZ,00196$
;src/main.c:471: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -9 (ix)
	jp	NC,00133$
;src/main.c:472: if (dist > G_HERO_H + 5) {
	ld	a,#0x1B
	sub	a, -19 (ix)
	jp	NC,00205$
;src/main.c:473: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
	ld	b,-9 (ix)
	dec	b
	dec	b
	push	bc
	inc	sp
	ld	a,-8 (ix)
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
	jp	C,00205$
;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d,(hl)
	inc	d
	inc	d
	ld	c, d
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00205$
;src/main.c:475: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jp	C,00205$
;src/main.c:476: moverEnemigoArriba(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:478: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00205$
00133$:
;src/main.c:482: if(dist > G_ENEMY_H + 7) {
	ld	a,#0x1D
	sub	a, -19 (ix)
	jp	NC,00205$
;src/main.c:483: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	a,-9 (ix)
	add	a, #0x18
	ld	b,a
	push	bc
	inc	sp
	ld	a,-8 (ix)
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
	jp	C,00205$
;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d,(hl)
	inc	d
	inc	d
	ld	c, d
	push	bc
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00205$
;src/main.c:485: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jp	C,00205$
;src/main.c:486: moverEnemigoAbajo(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:488: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00205$
00196$:
;src/main.c:494: if (!prota.mover) distConstraint = 20; // ajuste en parado
	ld	a, (#_prota + 6)
	or	a, a
	jr	NZ,00136$
	ld	-18 (ix),#0x14
00136$:
;src/main.c:496: if (dist > distConstraint) {
	ld	a,-18 (ix)
	sub	a, -19 (ix)
	jp	NC,00205$
;src/main.c:497: if (dx + 1 < enemy->x) {
	ld	c,6 (ix)
	ld	b,#0x00
	inc	bc
	ld	-6 (ix),c
	ld	-5 (ix),b
	ld	a,-8 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-6 (ix)
	sub	a, -4 (ix)
	ld	a,-5 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00447$
	xor	a, #0x80
00447$:
	jp	P,00148$
;src/main.c:498: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
	ld	h,-9 (ix)
	ld	l,-8 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	-1 (ix),h
	ld	-2 (ix), l
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00149$
;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	add	a, #0x0B
	ld	-2 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	b,(hl)
	ld	a,-2 (ix)
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
	jp	C,00149$
;src/main.c:500: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	add	a, #0x16
	ld	-2 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	b,(hl)
	ld	a,-2 (ix)
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
	jp	C,00149$
;src/main.c:501: moverEnemigoIzquierda(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:502: movX = 1;
	ld	-16 (ix),#0x01
;src/main.c:503: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00149$
00148$:
;src/main.c:505: } else if (dx + 1 > enemy->x){
	ld	a,-4 (ix)
	sub	a, -6 (ix)
	ld	a,-3 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00448$
	xor	a, #0x80
00448$:
	jp	P,00149$
;src/main.c:506: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	h,-9 (ix)
	ld	l,-7 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00149$
;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00149$
;src/main.c:508: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00149$
;src/main.c:509: moverEnemigoDerecha(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:510: movX = 1;
	ld	-16 (ix),#0x01
;src/main.c:511: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
00149$:
;src/main.c:514: if (dy < enemy->y) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
;src/main.c:514: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -2 (ix)
	jp	NC,00159$
;src/main.c:515: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
	ld	b,-2 (ix)
	dec	b
	dec	b
	push	bc
	inc	sp
	ld	a,-4 (ix)
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
	jp	C,00160$
;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jp	C,00160$
;src/main.c:517: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jp	C,00160$
;src/main.c:518: moverEnemigoArriba(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:519: movY = 1;
	ld	-17 (ix),#0x01
;src/main.c:520: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00160$
00159$:
;src/main.c:523: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	a,-2 (ix)
	add	a, #0x18
	ld	b,a
	push	bc
	inc	sp
	ld	a,-4 (ix)
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
	jr	C,00160$
;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00160$
;src/main.c:525: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00160$
;src/main.c:526: moverEnemigoAbajo(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:527: movY = 1;
	ld	-17 (ix),#0x01
;src/main.c:528: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
00160$:
;src/main.c:531: if (!enemy->mover) {
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00205$
;src/main.c:532: if (!movX) {
	ld	a,-16 (ix)
	or	a, a
	jp	NZ,00175$
;src/main.c:533: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	e,(hl)
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	c,(hl)
;src/main.c:533: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jp	NC,00172$
;src/main.c:534: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
	jr	C,00162$
;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00162$
;src/main.c:536: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00162$
;src/main.c:537: moverEnemigoAbajo(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:538: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00175$
00162$:
;src/main.c:540: moverEnemigoArriba(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:541: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00175$
00172$:
;src/main.c:544: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
	jr	C,00167$
;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00167$
;src/main.c:546: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-15 (ix)
	ld	h,-14 (ix)
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
	jr	C,00167$
;src/main.c:547: moverEnemigoArriba(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:548: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jr	00175$
00167$:
;src/main.c:550: moverEnemigoAbajo(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:551: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
00175$:
;src/main.c:556: if (!movY) {
	ld	a,-17 (ix)
	or	a, a
	jp	NZ,00205$
;src/main.c:557: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
;src/main.c:557: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,-2 (ix)
	sub	a, #0x28
	jp	NC,00187$
;src/main.c:558: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
	ld	h,-4 (ix)
	ld	l,-2 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	-5 (ix),h
	ld	-6 (ix), l
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	a,#0x02
	sub	a, -6 (ix)
	jp	C,00177$
;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	-6 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	ld	h,-6 (ix)
	ld	l,-7 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	-5 (ix),h
	ld	-6 (ix), l
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	a,#0x02
	sub	a, -6 (ix)
	jr	C,00177$
;src/main.c:560: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	-6 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	ld	h,-6 (ix)
	ld	l,-7 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	-5 (ix),h
	ld	-6 (ix), l
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	a,#0x02
	sub	a, -6 (ix)
	jr	C,00177$
;src/main.c:561: moverEnemigoIzquierda(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:562: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00205$
00177$:
;src/main.c:564: moverEnemigoDerecha(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:565: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jp	00205$
00187$:
;src/main.c:568: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,-2 (ix)
	add	a, #0x04
	ld	-2 (ix),a
	ld	h,-4 (ix)
	ld	l,-2 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	-1 (ix),h
	ld	-2 (ix), l
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
	ld	a,#0x02
	sub	a, -2 (ix)
	jr	C,00182$
;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	-2 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-4 (ix), a
	add	a, #0x04
	ld	-4 (ix),a
	ld	h,-2 (ix)
	ld	l,-4 (ix)
	push	hl
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00182$
;src/main.c:570: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	c,a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	e,(hl)
	inc	e
	inc	e
	inc	e
	inc	e
	ld	d, c
	push	de
	ld	hl,(_mapa)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00182$
;src/main.c:571: moverEnemigoDerecha(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:572: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
	jr	00205$
00182$:
;src/main.c:575: moverEnemigoIzquierda(enemy);
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:576: enemy->mover = SI;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x01
00205$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:586: void updateEnemy(TEnemy* actual) { // maquina de estados
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
;src/main.c:593: if (actual->engage) { // prioridad a la persecucion, nunca te deja
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0016
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00115$
;src/main.c:594: enemy->patrolling = 0;
	ld	hl,#(_enemy + 0x000b)
	ld	(hl),#0x00
;src/main.c:595: engage(actual, prota.x, prota.y);
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
;src/main.c:597: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
;src/main.c:603: actual->patrolling = 0;
	ld	hl,#0x000B
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:598: if (actual->patrolling) {
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
;src/main.c:601: if (actual->in_range) {
	ld	a,c
	add	a, #0x11
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
;src/main.c:609: actual->seek = 1;
	ld	a,c
	add	a, #0x14
	ld	-6 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-5 (ix),a
;src/main.c:598: if (actual->patrolling) {
	ld	a,l
	or	a, a
	jp	Z,00112$
;src/main.c:600: moverEnemigoPatrol(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoPatrol
	pop	af
	pop	de
	pop	bc
;src/main.c:601: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00104$
;src/main.c:602: engage(actual, prota.x, prota.y);
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
;src/main.c:603: actual->patrolling = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:604: actual->engage = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jp	00117$
00104$:
;src/main.c:605: } else if (actual->seen) {
	ld	hl,#0x0012
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00117$
;src/main.c:606: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-12 (ix),a
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	ld	a,(bc)
	ld	-9 (ix),a
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-12 (ix)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a,-9 (ix)
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:607: actual->p_seek_x = actual->x;
	ld	hl,#0x0017
	add	hl,bc
	ex	de,hl
	ld	a,(bc)
	ld	(de),a
;src/main.c:608: actual->p_seek_y = actual->y;
	ld	hl,#0x0018
	add	hl,bc
	ex	de,hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:609: actual->seek = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
;src/main.c:610: actual->iter=0;
	ld	hl,#0x000E
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:611: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:612: actual->patrolling = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:613: actual->seen = 0;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),#0x00
	jr	00117$
00112$:
;src/main.c:615: } else if (actual->seek) {
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:616: moverEnemigoSeek(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoSeek
	pop	af
	pop	de
	pop	bc
;src/main.c:617: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00117$
;src/main.c:618: engage(actual, prota.x, prota.y);
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
;src/main.c:619: actual->seek = 0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
;src/main.c:620: actual->engage = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:621: } else if (actual->seen) {
00117$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:628: void inicializarEnemy() {
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
;src/main.c:629: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-5 (ix),a
;src/main.c:639: actual = enemy;
	ld	de,#_enemy+0
;src/main.c:640: while(i){
00101$:
	ld	a,-5 (ix)
	or	a, a
	jp	Z,00104$
;src/main.c:641: --i;
	dec	-5 (ix)
;src/main.c:642: actual->x = actual->px = spawnX[i];
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a,#<(_spawnX)
	add	a, -5 (ix)
	ld	-7 (ix),a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	-6 (ix),a
	pop	hl
	push	hl
	ld	a,(hl)
	ld	(bc),a
	ld	(de),a
;src/main.c:643: actual->y = actual->py = spawnY[i];
	push	de
	pop	iy
	inc	iy
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a,#<(_spawnY)
	add	a, -5 (ix)
	ld	-2 (ix),a
	ld	a,#>(_spawnY)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	(bc),a
	ld	0 (iy), a
;src/main.c:644: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:645: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x03
;src/main.c:646: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:647: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
;src/main.c:648: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x00
;src/main.c:649: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x01
;src/main.c:650: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x00
;src/main.c:651: actual->iter = 0;
	ld	hl,#0x000E
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:652: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,de
	ld	(hl),#0x00
;src/main.c:653: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x00
;src/main.c:654: actual->found = 0;
	ld	hl,#0x0013
	add	hl,de
	ld	(hl),#0x00
;src/main.c:655: actual->engage = 0;
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x00
;src/main.c:656: actual->xplot = NO;
	ld	hl,#0x0019
	add	hl,de
	ld	(hl),#0x00
;src/main.c:657: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
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
	add	a, -5 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-3 (ix),a
	ld	hl,#_patrolX
	add	hl,bc
	ld	c,-5 (ix)
	ld	b,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	-4 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	pop	hl
	push	hl
	ld	b,(hl)
	push	de
	ld	hl,(_mapa)
	push	hl
	push	de
	ld	h,-3 (ix)
	ld	l,-4 (ix)
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
;src/main.c:658: dibujarEnemigo(actual);
	push	de
	push	de
	call	_dibujarEnemigo
	pop	af
	pop	de
;src/main.c:659: ++actual;
	ld	hl,#0x00E3
	add	hl,de
	ex	de,hl
	jp	00101$
00104$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:663: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:664: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:665: mapa = mapas[++num_mapa];
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
;src/main.c:666: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:667: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:668: dibujarMapa();
	call	_dibujarMapa
;src/main.c:669: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:672: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	jp  _menuFin
;src/main.c:676: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:677: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:678: if (!checkCollision(M_izquierda)) {
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
;src/main.c:679: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:680: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:681: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:685: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:686: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:687: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:688: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:689: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:690: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:691: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:692: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:696: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:697: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:698: if (!checkCollision(M_arriba)) {
	ld	a,#0x02
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:699: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:700: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:701: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:702: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:706: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:707: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:708: if (!checkCollision(M_abajo) ) {
	ld	a,#0x03
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:709: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:710: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:711: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:712: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:719: void intHandler() {
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
;src/main.c:720: if (++i == 6) {
	ld	hl, #_i+0
	inc	(hl)
	ld	a,(#_i + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:721: play();
	call	_play
;src/main.c:722: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:726: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:727: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:728: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:729: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:730: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:735: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:736: cambio = 0;
	ld	hl,#_cambio + 0
	ld	(hl), #0x00
;src/main.c:737: timer = 0;
	ld	hl,#0x0000
	ld	(_timer),hl
;src/main.c:738: parpadeo = 0;
	ld	hl,#_parpadeo + 0
	ld	(hl), #0x00
;src/main.c:740: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:741: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:742: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:744: dibujarMapa();
	call	_dibujarMapa
;src/main.c:747: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:750: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:751: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
;src/main.c:752: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:753: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:754: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:758: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:759: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:760: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:761: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:762: cu.off_bound = NO;
	ld	hl,#(_cu + 0x000a)
	ld	(hl),#0x00
;src/main.c:764: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:766: dibujarProta();
	jp  _dibujarProta
;src/main.c:769: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/main.c:774: vidas = 6;
	ld	hl,#_vidas + 0
	ld	(hl), #0x06
;src/main.c:776: inicializarCPC();
	call	_inicializarCPC
;src/main.c:778: menuInicio();
	call	_menuInicio
;src/main.c:780: inicializarJuego();
	call	_inicializarJuego
;src/main.c:784: while (1) {
00145$:
;src/main.c:785: ++timer;
	ld	hl, #_timer+0
	inc	(hl)
	jr	NZ,00259$
	ld	hl, #_timer+1
	inc	(hl)
00259$:
;src/main.c:786: if(timer == 4 && (cambio > 0 && cambio<=12)){
	ld	a,(#_timer + 0)
	sub	a, #0x04
	jr	NZ,00104$
	ld	a,(#_timer + 1)
	or	a, a
	jr	NZ,00104$
	ld	a,(#_cambio + 0)
	or	a, a
	jr	Z,00104$
	ld	a,#0x0C
	ld	iy,#_cambio
	sub	a, 0 (iy)
	jr	C,00104$
;src/main.c:787: timer = 0;
	ld	hl,#0x0000
	ld	(_timer),hl
;src/main.c:788: parpadeo = !parpadeo;
	ld	a,(#_parpadeo + 0)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	c,a
	ld	hl,#_parpadeo + 0
	ld	(hl), c
;src/main.c:789: cambio ++;
	ld	hl, #_cambio+0
	inc	(hl)
	jr	00105$
00104$:
;src/main.c:790: }else if(cambio == 12){
	ld	a,(#_cambio + 0)
	sub	a, #0x0C
	jr	NZ,00105$
;src/main.c:791: cambio = 0;
	ld	hl,#_cambio + 0
	ld	(hl), #0x00
00105$:
;src/main.c:793: i = 2 + num_mapa;
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	inc	c
;src/main.c:794: actual = enemy;
;src/main.c:796: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
	push	bc
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
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_cu
	push	hl
	call	_moverCuchillo
	pop	af
	pop	af
	pop	bc
;src/main.c:798: while(i){
	ld	-5 (ix),c
	ld	-9 (ix),#<(_enemy)
	ld	-8 (ix),#>(_enemy)
00112$:
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00114$
;src/main.c:800: --i;
	dec	-5 (ix)
;src/main.c:801: if(!actual->muerto){
	ld	a,-9 (ix)
	add	a, #0x08
	ld	-2 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00109$
;src/main.c:802: checkEnemyDead(cu.direccion, actual);
	ld	hl, #_cu + 7
	ld	b,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	push	bc
	inc	sp
	call	_checkEnemyDead
	pop	af
	inc	sp
00109$:
;src/main.c:804: if(!actual->muerto){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00111$
;src/main.c:805: updateEnemy(actual);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_updateEnemy
	pop	af
00111$:
;src/main.c:807: ++actual;
	ld	a,-9 (ix)
	add	a, #0xE3
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-8 (ix),a
	jr	00112$
00114$:
;src/main.c:810: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:813: if (prota.mover) {
	ld	bc,#_prota + 6
	ld	a,(bc)
	or	a, a
	jr	Z,00116$
;src/main.c:814: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:815: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00116$:
;src/main.c:817: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	c,(hl)
;src/main.c:818: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
;src/main.c:817: if(cu.lanzado && cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00121$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	Z,00121$
;src/main.c:818: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
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
	jr	00122$
00121$:
;src/main.c:819: }else if (cu.lanzado && !cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00122$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	NZ,00122$
;src/main.c:820: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
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
;src/main.c:821: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:823: cu.x = 0;
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:824: cu.y=0;
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
00122$:
;src/main.c:827: i = 2 + num_mapa;
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	inc	c
;src/main.c:828: actual = enemy;
	ld	de,#_enemy
;src/main.c:829: while(i){
00141$:
	ld	a,c
	or	a, a
	jp	Z,00143$
;src/main.c:831: --i;
	dec	c
;src/main.c:832: if(actual->mover){
	ld	hl,#0x0006
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
;src/main.c:833: redibujarEnemigo((*actual).px, (*actual).py, actual);
	ld	hl,#0x0003
	add	hl,de
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	hl,#0x0002
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:832: if(actual->mover){
	ld	a,b
	or	a, a
	jr	Z,00125$
;src/main.c:833: redibujarEnemigo((*actual).px, (*actual).py, actual);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	push	bc
	push	de
	push	de
	ld	a,-5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_redibujarEnemigo
	pop	af
	pop	af
	pop	de
	pop	bc
00125$:
;src/main.c:836: if (actual->muerto && actual->muertes == 0){
	ld	hl,#0x0008
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jp	Z,00127$
	ld	hl,#0x000A
	add	hl,de
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00127$
;src/main.c:837: timer = 3;
	ld	hl,#0x0003
	ld	(_timer),hl
;src/main.c:838: cambio++;
	ld	iy,#_cambio
	inc	0 (iy)
;src/main.c:839: parpadeo = 1;
	ld	iy,#_parpadeo
	ld	0 (iy),#0x01
;src/main.c:840: borrarEnemigo((*actual).x, (*actual).y);
	ld	l, #0x01
	add	hl,de
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,(hl)
	ld	a,(de)
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_borrarEnemigo
	pop	af
	pop	de
	pop	bc
;src/main.c:841: puntuacion_aux = puntuacion;
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
;src/main.c:842: puntuacion = aumentarPuntuacion(puntuacion_aux);
	push	bc
	push	de
	push	hl
	call	_aumentarPuntuacion
	pop	af
	pop	de
	pop	bc
	ld	iy,#_puntuacion
	ld	0 (iy),l
;src/main.c:843: modificarPuntuacion(puntuacion);
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
;src/main.c:844: actual->mover = NO;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:845: actual->muertes++;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	b,(hl)
	inc	b
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),b
;src/main.c:846: actual->x = 0;
	xor	a, a
	ld	(de),a
;src/main.c:847: actual->y = 0;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x00
00127$:
;src/main.c:849: if(parpadeo && actual->muerto && !actual->xplot){
	ld	hl,#0x0019
	add	hl,de
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	a,(#_parpadeo + 0)
	or	a, a
	jr	Z,00137$
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00137$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00137$
;src/main.c:850: dibujarExplosion(actual);
	push	bc
	push	de
	push	de
	call	_dibujarExplosion
	pop	af
	pop	de
	pop	bc
	jr	00138$
00137$:
;src/main.c:851: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
	ld	a,(#_parpadeo + 0)
	or	a, a
	jr	NZ,00138$
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00138$
	ld	a,#0x0C
	ld	iy,#_cambio
	sub	a, 0 (iy)
	jr	C,00138$
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00138$
;src/main.c:852: borrarExplosion((*actual).px, (*actual).py);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_borrarExplosion
	pop	af
	pop	de
	pop	bc
;src/main.c:853: if(cambio == 12){
	ld	a,(#_cambio + 0)
	sub	a, #0x0C
	jr	NZ,00138$
;src/main.c:854: actual->xplot = SI;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x01
00138$:
;src/main.c:857: ++actual;
	ld	hl,#0x00E3
	add	hl,de
	ex	de,hl
	jp	00141$
00143$:
;src/main.c:859: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00145$
	.area _CODE
	.area _INITIALIZER
__xinit__mapa:
	.dw #0x0000
__xinit__num_mapa:
	.db #0x00	; 0
__xinit__puntuacion:
	.db #0x00	; 0
	.area _CABS (ABS)
