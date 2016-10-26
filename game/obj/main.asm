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
	.globl _modificarVidas
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
	ld	hl,#0x000B
	add	hl,bc
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-1 (ix),a
;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
	ld	hl,#0x000D
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
	ld	hl,#0x0011
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:365: enemy->in_range = NO;
	ld	hl,#0x0010
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;src/main.c:367: if(!enemy->seek){
	push	de
	pop	iy
	ld	a,19 (iy)
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
	ld	hl,#0x0015
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
	ld	hl,#0x000D
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
	ld	hl,#0x0013
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
	ld	de, #0x0011
	add	hl, de
	ld	a,(hl)
	ld	-7 (ix),a
;src/main.c:410: actual->patrolling = 1;
	ld	hl,#0x000A
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
	ld	a,21 (iy)
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
	ld	hl,#-16
	add	hl,sp
	ld	sp,hl
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
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
;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
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
;src/main.c:428: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-16 (ix),l
;src/main.c:430: u8 movX = 0;
	ld	-13 (ix),#0x00
;src/main.c:431: u8 movY = 0;
	ld	-14 (ix),#0x00
;src/main.c:432: u8 distConstraint = 25;
	ld	-15 (ix),#0x19
;src/main.c:433: enemy->mover = NO;
	ld	a,-12 (ix)
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
;src/main.c:443: enemy->didDamage = 1;
	ld	a,-12 (ix)
	add	a, #0x16
	ld	c,a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	b,a
;src/main.c:435: if (dist < 20) {
	ld	a,-16 (ix)
	sub	a, #0x14
	jr	NC,00107$
;src/main.c:436: vidas--;
	ld	hl, #_vidas+0
	dec	(hl)
;src/main.c:437: if(vidas % 20 == 0){
	push	bc
	ld	a,#0x14
	push	af
	inc	sp
	ld	a,(_vidas)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	jr	NZ,00105$
;src/main.c:438: if (vidas == 0) {
	ld	a,(#_vidas + 0)
	or	a, a
	jr	NZ,00102$
;src/main.c:439: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	push	bc
	call	_menuFin
	pop	bc
	jr	00105$
00102$:
;src/main.c:441: modificarVidas(vidas);
	push	bc
	ld	a,(_vidas)
	push	af
	inc	sp
	call	_modificarVidas
	inc	sp
	pop	bc
00105$:
;src/main.c:443: enemy->didDamage = 1;
	ld	a,#0x01
	ld	(bc),a
00107$:
;src/main.c:445: if (!enemy->didDamage) {
	ld	a,(bc)
	or	a, a
	jp	NZ,00208$
;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	-6 (ix), a
	add	a, #0x04
	ld	-5 (ix),a
;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
	ld	a,7 (ix)
	sub	a, c
	jr	Z,00201$
	ld	e,7 (ix)
	ld	d,#0x00
	ld	hl,#0x0001
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	-2 (ix),c
	ld	-1 (ix),#0x00
	ld	a,-4 (ix)
	sub	a, -2 (ix)
	jr	NZ,00447$
	ld	a,-3 (ix)
	sub	a, -1 (ix)
	jr	Z,00201$
00447$:
	dec	de
	ld	a,-2 (ix)
	sub	a, e
	jp	NZ,00202$
	ld	a,-1 (ix)
	sub	a, d
	jp	NZ,00202$
00201$:
;src/main.c:447: if (dx < enemy->x) { // izquierda
	ld	a,6 (ix)
	sub	a, -6 (ix)
	jp	NC,00121$
;src/main.c:448: if (dist > 11) {
	ld	a,#0x0B
	sub	a, -16 (ix)
	jp	NC,00208$
;src/main.c:449: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
	ld	a,c
	push	af
	inc	sp
	ld	a,-6 (ix)
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
	jp	C,00208$
;src/main.c:450: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
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
	jp	C,00208$
;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
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
	jp	C,00208$
;src/main.c:452: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:454: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00208$
00121$:
;src/main.c:458: if (dist > G_ENEMY_W + 3) {
	ld	a,#0x07
	sub	a, -16 (ix)
	jp	NC,00208$
;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,c
	push	af
	inc	sp
	ld	a,-5 (ix)
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
	jp	C,00208$
;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
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
	jp	C,00208$
;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
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
	jp	C,00208$
;src/main.c:462: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:464: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00208$
00202$:
;src/main.c:469: else if (enemy->x == dx) {
	ld	a,-6 (ix)
	sub	a, 6 (ix)
	jp	NZ,00199$
;src/main.c:470: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, c
	jp	NC,00136$
;src/main.c:471: if (dist > G_HERO_H + 5) {
	ld	a,#0x1B
	sub	a, -16 (ix)
	jp	NC,00208$
;src/main.c:472: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
	ld	b,c
	dec	b
	dec	b
	push	bc
	inc	sp
	ld	a,-6 (ix)
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
	jp	C,00208$
;src/main.c:473: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
	jp	C,00208$
;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
	jp	C,00208$
;src/main.c:475: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:477: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00208$
00136$:
;src/main.c:481: if(dist > G_ENEMY_H + 7) {
	ld	a,#0x1D
	sub	a, -16 (ix)
	jp	NC,00208$
;src/main.c:482: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	a,c
	add	a, #0x18
	ld	b,a
	push	bc
	inc	sp
	ld	a,-6 (ix)
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
	jp	C,00208$
;src/main.c:483: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
	jp	C,00208$
;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
	jp	C,00208$
;src/main.c:485: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:487: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00208$
00199$:
;src/main.c:493: if (!prota.mover) distConstraint = 20; // ajuste en parado
	ld	a, (#_prota + 6)
	or	a, a
	jr	NZ,00139$
	ld	-15 (ix),#0x14
00139$:
;src/main.c:495: if (dist > distConstraint) {
	ld	a,-15 (ix)
	sub	a, -16 (ix)
	jp	NC,00208$
;src/main.c:496: if (dx + 1 < enemy->x) {
	ld	e,6 (ix)
	ld	d,#0x00
	inc	de
	ld	a,-6 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,e
	sub	a, -2 (ix)
	ld	a,d
	sbc	a, -1 (ix)
	jp	PO, 00452$
	xor	a, #0x80
00452$:
	jp	P,00151$
;src/main.c:497: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
	ld	a,c
	push	af
	inc	sp
	ld	a,-6 (ix)
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
	jp	C,00152$
;src/main.c:498: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
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
	jp	C,00152$
;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
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
	jp	C,00152$
;src/main.c:500: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:501: movX = 1;
	ld	-13 (ix),#0x01
;src/main.c:502: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00152$
00151$:
;src/main.c:504: } else if (dx + 1 > enemy->x){
	ld	a,-2 (ix)
	sub	a, e
	ld	a,-1 (ix)
	sbc	a, d
	jp	PO, 00453$
	xor	a, #0x80
00453$:
	jp	P,00152$
;src/main.c:505: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,c
	push	af
	inc	sp
	ld	a,-5 (ix)
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
	jr	C,00152$
;src/main.c:506: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
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
	jr	C,00152$
;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
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
	jr	C,00152$
;src/main.c:508: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:509: movX = 1;
	ld	-13 (ix),#0x01
;src/main.c:510: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00152$:
;src/main.c:513: if (dy < enemy->y) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
;src/main.c:513: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -2 (ix)
	jp	NC,00162$
;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
	jp	C,00163$
;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
	jp	C,00163$
;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
	jp	C,00163$
;src/main.c:517: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:518: movY = 1;
	ld	-14 (ix),#0x01
;src/main.c:519: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00163$
00162$:
;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
	jr	C,00163$
;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
	jr	C,00163$
;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
	jr	C,00163$
;src/main.c:525: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:526: movY = 1;
	ld	-14 (ix),#0x01
;src/main.c:527: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00163$:
;src/main.c:530: if (!enemy->mover) {
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00208$
;src/main.c:531: if (!movX) {
	ld	a,-13 (ix)
	or	a, a
	jp	NZ,00178$
;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jp	NC,00175$
;src/main.c:533: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
	jr	C,00165$
;src/main.c:534: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
	jr	C,00165$
;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
	jr	C,00165$
;src/main.c:536: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:537: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00178$
00165$:
;src/main.c:539: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:540: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00178$
00175$:
;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
	jr	C,00170$
;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
	jr	C,00170$
;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
	jr	C,00170$
;src/main.c:546: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:547: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00178$
00170$:
;src/main.c:549: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:550: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00178$:
;src/main.c:555: if (!movY) {
	ld	a,-14 (ix)
	or	a, a
	jp	NZ,00208$
;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	d,(hl)
;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,c
	sub	a, #0x28
	jp	NC,00190$
;src/main.c:557: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
	push	de
	inc	sp
	ld	a,c
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
	jr	C,00180$
;src/main.c:558: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
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
	jr	C,00180$
;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
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
	jr	C,00180$
;src/main.c:560: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:561: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00208$
00180$:
;src/main.c:563: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:564: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00208$
00190$:
;src/main.c:567: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,c
	add	a, #0x04
	push	de
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
	jr	C,00185$
;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
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
	jr	C,00185$
;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
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
	jr	C,00185$
;src/main.c:570: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:571: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00208$
00185$:
;src/main.c:574: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:575: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00208$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:585: void updateEnemy(TEnemy* actual) { // maquina de estados
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
;src/main.c:592: if (actual->engage) { // prioridad a la persecucion, nunca te deja
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0015
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00115$
;src/main.c:593: enemy->patrolling = 0;
	ld	hl,#(_enemy + 0x000a)
	ld	(hl),#0x00
;src/main.c:594: engage(actual, prota.x, prota.y);
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
;src/main.c:596: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
;src/main.c:602: actual->patrolling = 0;
	ld	hl,#0x000A
	add	hl,bc
	ex	(sp), hl
;src/main.c:597: if (actual->patrolling) {
	pop	hl
	push	hl
	ld	l,(hl)
;src/main.c:600: if (actual->in_range) {
	ld	a,c
	add	a, #0x10
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
;src/main.c:608: actual->seek = 1;
	ld	a,c
	add	a, #0x13
	ld	-3 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-2 (ix),a
;src/main.c:597: if (actual->patrolling) {
	ld	a,l
	or	a, a
	jp	Z,00112$
;src/main.c:599: moverEnemigoPatrol(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoPatrol
	pop	af
	pop	de
	pop	bc
;src/main.c:600: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00104$
;src/main.c:601: engage(actual, prota.x, prota.y);
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
;src/main.c:602: actual->patrolling = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:603: actual->engage = 1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x01
	jp	00117$
00104$:
;src/main.c:604: } else if (actual->seen) {
	ld	hl,#0x0011
	add	hl,bc
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00117$
;src/main.c:605: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-8 (ix),a
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d,(hl)
	ld	a,(bc)
	ld	-1 (ix),a
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-8 (ix)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:606: actual->p_seek_x = actual->x;
	ld	hl,#0x0017
	add	hl,bc
	ex	de,hl
	ld	a,(bc)
	ld	(de),a
;src/main.c:607: actual->p_seek_y = actual->y;
	ld	hl,#0x0018
	add	hl,bc
	ex	de,hl
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:608: actual->seek = 1;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x01
;src/main.c:609: actual->iter=0;
	ld	hl,#0x000D
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:610: actual->reversePatrol = NO;
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:611: actual->patrolling = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:612: actual->seen = 0;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
	jr	00117$
00112$:
;src/main.c:614: } else if (actual->seek) {
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:615: moverEnemigoSeek(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoSeek
	pop	af
	pop	de
	pop	bc
;src/main.c:616: if (actual->in_range) {
	ld	a,(de)
	or	a, a
	jr	Z,00117$
;src/main.c:617: engage(actual, prota.x, prota.y);
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
;src/main.c:618: actual->seek = 0;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),#0x00
;src/main.c:619: actual->engage = 1;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x01
;src/main.c:620: } else if (actual->seen) {
00117$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:627: void inicializarEnemy() {
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
;src/main.c:628: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-1 (ix),a
;src/main.c:638: actual = enemy;
	ld	de,#_enemy+0
;src/main.c:639: while(i){
00101$:
	ld	a,-1 (ix)
	or	a, a
	jp	Z,00104$
;src/main.c:640: --i;
	dec	-1 (ix)
;src/main.c:641: actual->x = actual->px = spawnX[i];
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a,#<(_spawnX)
	add	a, -1 (ix)
	ld	-3 (ix),a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	(bc),a
	ld	(de),a
;src/main.c:642: actual->y = actual->py = spawnY[i];
	push	de
	pop	iy
	inc	iy
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a,#<(_spawnY)
	add	a, -1 (ix)
	ld	-5 (ix),a
	ld	a,#>(_spawnY)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	(bc),a
	ld	0 (iy), a
;src/main.c:643: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:644: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x03
;src/main.c:645: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:646: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
;src/main.c:647: actual->muertes = 0;
	ld	hl,#0x0009
	add	hl,de
	ld	(hl),#0x00
;src/main.c:648: actual->patrolling = SI;
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x01
;src/main.c:649: actual->reversePatrol = NO;
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x00
;src/main.c:650: actual->didDamage = 0;
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x00
;src/main.c:651: actual->iter = 0;
	ld	hl,#0x000D
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:652: actual->lastIter = 0;
	ld	hl,#0x000F
	add	hl,de
	ld	(hl),#0x00
;src/main.c:653: actual->seen = 0;
	ld	hl,#0x0011
	add	hl,de
	ld	(hl),#0x00
;src/main.c:654: actual->found = 0;
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x00
;src/main.c:655: actual->engage = 0;
	ld	hl,#0x0015
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
	add	a, -1 (ix)
	ld	l,a
	ld	a,h
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-6 (ix),a
	ld	hl,#_patrolX
	add	hl,bc
	ld	c,-1 (ix)
	ld	b,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	-7 (ix),a
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
	ld	h,-6 (ix)
	ld	l,-7 (ix)
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
;src/main.c:774: vidas = 100;
	ld	hl,#_vidas + 0
	ld	(hl), #0x64
;src/main.c:776: inicializarCPC();
	call	_inicializarCPC
;src/main.c:778: menuInicio();
	call	_menuInicio
;src/main.c:780: inicializarJuego();
	call	_inicializarJuego
;src/main.c:784: while (1) {
00148$:
;src/main.c:785: ++timer;
	ld	hl, #_timer+0
	inc	(hl)
	jr	NZ,00266$
	ld	hl, #_timer+1
	inc	(hl)
00266$:
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
	ld	-13 (ix),c
	ld	-4 (ix),#<(_enemy)
	ld	-3 (ix),#>(_enemy)
00115$:
	ld	a,-13 (ix)
	or	a, a
	jr	Z,00117$
;src/main.c:800: --i;
	dec	-13 (ix)
;src/main.c:801: if(!actual->muerto){
	ld	a,-4 (ix)
	add	a, #0x08
	ld	-10 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00109$
;src/main.c:802: checkEnemyDead(cu.direccion, actual);
	ld	hl, #_cu + 7
	ld	b,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	bc
	inc	sp
	call	_checkEnemyDead
	pop	af
	inc	sp
00109$:
;src/main.c:804: if(!actual->muerto){
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00114$
;src/main.c:805: if (!actual->didDamage)
	ld	a,-4 (ix)
	add	a, #0x16
	ld	c,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	or	a, a
	jr	NZ,00111$
;src/main.c:806: updateEnemy(actual);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_updateEnemy
	pop	af
	jr	00114$
00111$:
;src/main.c:808: actual->didDamage = 0;
	xor	a, a
	ld	(bc),a
00114$:
;src/main.c:810: ++actual;
	ld	a,-4 (ix)
	add	a, #0xE3
	ld	-4 (ix),a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	jr	00115$
00117$:
;src/main.c:813: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:816: if (prota.mover) {
	ld	bc,#_prota + 6
	ld	a,(bc)
	or	a, a
	jr	Z,00119$
;src/main.c:817: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:818: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00119$:
;src/main.c:820: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	c,(hl)
;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
;src/main.c:820: if(cu.lanzado && cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00124$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	Z,00124$
;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
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
	jr	00125$
00124$:
;src/main.c:822: }else if (cu.lanzado && !cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00125$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	NZ,00125$
;src/main.c:823: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
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
;src/main.c:824: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:826: cu.x = 0;
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:827: cu.y=0;
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
00125$:
;src/main.c:830: i = 2 + num_mapa;
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	inc	c
;src/main.c:831: actual = enemy;
	ld	de,#_enemy
;src/main.c:832: while(i){
00144$:
	ld	a,c
	or	a, a
	jp	Z,00146$
;src/main.c:834: --i;
	dec	c
;src/main.c:835: if(actual->mover){
	ld	hl,#0x0006
	add	hl,de
	ld	-10 (ix),l
	ld	-9 (ix),h
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
	ld	hl,#0x0003
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	hl,#0x0002
	add	hl,de
	ld	-12 (ix),l
	ld	-11 (ix),h
;src/main.c:835: if(actual->mover){
	ld	a,b
	or	a, a
	jr	Z,00128$
;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-13 (ix),a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
	push	bc
	push	de
	push	de
	ld	a,-13 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_redibujarEnemigo
	pop	af
	pop	af
	pop	de
	pop	bc
00128$:
;src/main.c:839: if (actual->muerto && actual->muertes == 0){
	ld	hl,#0x0008
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00130$
	ld	hl,#0x0009
	add	hl,de
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00130$
;src/main.c:840: timer = 3;
	ld	hl,#0x0003
	ld	(_timer),hl
;src/main.c:841: cambio++;
	ld	iy,#_cambio
	inc	0 (iy)
;src/main.c:842: parpadeo = 1;
	ld	iy,#_parpadeo
	ld	0 (iy),#0x01
;src/main.c:843: borrarEnemigo((*actual).x, (*actual).y);
	ld	l, #0x01
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
;src/main.c:844: puntuacion_aux = puntuacion;
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
;src/main.c:845: puntuacion = aumentarPuntuacion(puntuacion_aux);
	push	bc
	push	de
	push	hl
	call	_aumentarPuntuacion
	pop	af
	pop	de
	pop	bc
	ld	iy,#_puntuacion
	ld	0 (iy),l
;src/main.c:846: modificarPuntuacion(puntuacion);
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
;src/main.c:847: actual->mover = NO;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl),#0x00
;src/main.c:848: actual->muertes++;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b,(hl)
	inc	b
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),b
;src/main.c:849: actual->x = 0;
	xor	a, a
	ld	(de),a
;src/main.c:850: actual->y = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
00130$:
;src/main.c:852: if(parpadeo && actual->muerto && !actual->xplot){
	ld	hl,#0x0019
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,(#_parpadeo + 0)
	or	a, a
	jr	Z,00140$
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00140$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00140$
;src/main.c:853: dibujarExplosion(actual);
	push	bc
	push	de
	push	de
	call	_dibujarExplosion
	pop	af
	pop	de
	pop	bc
	jr	00141$
00140$:
;src/main.c:854: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
	ld	a,(#_parpadeo + 0)
	or	a, a
	jr	NZ,00141$
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00141$
	ld	a,#0x0C
	ld	iy,#_cambio
	sub	a, 0 (iy)
	jr	C,00141$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	NZ,00141$
;src/main.c:855: borrarExplosion((*actual).px, (*actual).py);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	l,-12 (ix)
	ld	h,-11 (ix)
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
;src/main.c:856: if(cambio == 12){
	ld	a,(#_cambio + 0)
	sub	a, #0x0C
	jr	NZ,00141$
;src/main.c:857: actual->xplot = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
00141$:
;src/main.c:860: ++actual;
	ld	hl,#0x00E3
	add	hl,de
	ex	de,hl
	jp	00144$
00146$:
;src/main.c:862: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00148$
	.area _CODE
	.area _INITIALIZER
__xinit__mapa:
	.dw #0x0000
__xinit__num_mapa:
	.db #0x00	; 0
__xinit__puntuacion:
	.db #0x00	; 0
	.area _CABS (ABS)
