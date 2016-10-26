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
	.globl _checkEnemyCollision
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
	ld	e,a
	inc	e
	inc	e
	inc	e
	inc	e
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
	ld	d,a
;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	hl,(_mapa)
	ex	(sp), hl
	ld	c,5 (ix)
	ld	b,#0x00
	ld	a,c
	add	a,#0xE8
	ld	-2 (ix),a
	ld	a,b
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	bit	7, -1 (ix)
	jr	Z,00105$
	ld	hl,#0xFFEB
	add	hl,bc
00105$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	b,l
	ld	c,4 (ix)
	srl	c
	pop	hl
	push	hl
	push	hl
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	push	de
	push	bc
	call	_cpct_etm_drawTileBox2x4
;src/main.c:225: enemy->mover = NO;
	ld	hl,#(_enemy + 0x0006)
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:228: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:229: borrarEnemigo(x, y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:230: enemy->px = enemy->x;
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:231: enemy->py = enemy->y;
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
;src/main.c:232: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:235: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
;	---------------------------------
; Function checkEnemyCollision
; ---------------------------------
_checkEnemyCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;src/main.c:237: u8 colisiona = 1;
	ld	-9 (ix),#0x01
;src/main.c:239: switch (direction) {
	ld	a,#0x03
	sub	a, 4 (ix)
	jp	C,00165$
;src/main.c:241: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:254: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:261: enemy->mira = M_izquierda;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:239: switch (direction) {
	push	de
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00268$
	add	hl,de
	add	hl,de
	add	hl,de
	pop	de
	jp	(hl)
00268$:
	jp	00101$
	jp	00117$
	jp	00133$
	jp	00149$
;src/main.c:240: case 0:
00101$:
;src/main.c:241: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:243: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:245: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
	ld	hl, #_cu + 1
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0004
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	a,-1 (ix)
	sbc	a, h
	jp	PO, 00269$
	xor	a, #0x80
00269$:
	jp	M,00108$
	push	de
	ld	de,#0x0016
	add	hl, de
	pop	de
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00270$
	xor	a, #0x80
00270$:
	jp	P,00109$
00108$:
;src/main.c:246: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00109$:
;src/main.c:249: if(cu.x > enemy->x){ //si el cu esta abajo
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, e
	jr	NC,00106$
;src/main.c:250: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
	ld	l,e
	ld	h,#0x00
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	cp	a, a
	sbc	hl, bc
	ld	a,#0x01
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00271$
	xor	a, #0x80
00271$:
	jp	P,00103$
;src/main.c:251: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00103$:
;src/main.c:254: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00106$:
;src/main.c:257: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00113$:
;src/main.c:261: enemy->mira = M_izquierda;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:263: break;
	jp	00165$
;src/main.c:264: case 1:
00117$:
;src/main.c:265: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
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
;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:267: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:269: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
	ld	hl, #_cu + 1
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0004
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	a,-1 (ix)
	sbc	a, h
	jp	PO, 00272$
	xor	a, #0x80
00272$:
	jp	M,00124$
	push	de
	ld	de,#0x0016
	add	hl, de
	pop	de
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00273$
	xor	a, #0x80
00273$:
	jp	P,00125$
00124$:
;src/main.c:270: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00125$:
;src/main.c:273: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	a,(bc)
	ld	e,a
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	a,c
	sub	a, e
	jr	NC,00122$
;src/main.c:274: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
	ld	l,e
	ld	h,#0x00
	ld	b,#0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	cp	a, a
	sbc	hl, bc
	ld	a,#0x01
	cp	a, l
	ld	a,#0x00
	sbc	a, h
	jp	PO, 00274$
	xor	a, #0x80
00274$:
	jp	P,00119$
;src/main.c:275: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00119$:
;src/main.c:278: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00122$:
;src/main.c:281: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00129$:
;src/main.c:285: enemy->mira = M_derecha;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:287: break;
	jp	00165$
;src/main.c:288: case 2:
00133$:
;src/main.c:289: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:291: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
;src/main.c:293: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0002
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,(bc)
	ld	l,a
	ld	h,#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	a,-1 (ix)
	sbc	a, h
	jp	PO, 00275$
	xor	a, #0x80
00275$:
	jp	M,00140$
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00276$
	xor	a, #0x80
00276$:
	jp	P,00141$
00140$:
;src/main.c:295: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00141$:
;src/main.c:298: if(enemy->y>cu.y){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00138$
;src/main.c:299: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
	ld	d,#0x00
	ld	h,#0x00
	push	de
	ld	de,#0x0008
	add	hl, de
	pop	de
	ld	a,e
	sub	a, l
	ld	e,a
	ld	a,d
	sbc	a, h
	ld	d,a
	ld	a,#0x02
	cp	a, e
	ld	a,#0x00
	sbc	a, d
	jp	PO, 00277$
	xor	a, #0x80
00277$:
	jp	P,00135$
;src/main.c:300: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00135$:
;src/main.c:303: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00149$
00138$:
;src/main.c:307: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00145$:
;src/main.c:313: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:316: case 3:
00149$:
;src/main.c:319: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:321: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
;src/main.c:323: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0002
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,-2 (ix)
	sub	a, c
	ld	a,-1 (ix)
	sbc	a, b
	jp	PO, 00278$
	xor	a, #0x80
00278$:
	jp	M,00156$
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00279$
	xor	a, #0x80
00279$:
	jp	P,00157$
00156$:
;src/main.c:324: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00157$:
;src/main.c:327: if(cu.y > enemy->y){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00154$
;src/main.c:328: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
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
	jp	PO, 00280$
	xor	a, #0x80
00280$:
	jp	P,00151$
;src/main.c:329: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00151$:
;src/main.c:332: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00165$
00154$:
;src/main.c:336: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00161$:
;src/main.c:340: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:343: }
00165$:
;src/main.c:344: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:347: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:348: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:349: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:350: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:353: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:354: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:355: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:356: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:359: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:360: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:361: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:362: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:365: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:366: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:367: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:368: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:371: void moverEnemigoPatrol(TEnemy* enemy){
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
;src/main.c:373: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00118$
;src/main.c:376: if (!enemy->reversePatrol) {
	ld	hl,#0x000C
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
;src/main.c:377: if(enemy->iter < enemy->longitud_camino){
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
	ld	-8 (ix),l
	ld	-7 (ix),h
;src/main.c:380: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ex	(sp), hl
;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
	ld	hl,#0x0019
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:376: if (!enemy->reversePatrol) {
	ld	a,-9 (ix)
	or	a, a
	jp	NZ,00114$
;src/main.c:377: if(enemy->iter < enemy->longitud_camino){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
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
;src/main.c:378: if(enemy->iter == 0){
	ld	a,d
	or	a,e
	jr	NZ,00102$
;src/main.c:380: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:381: enemy->iter = 2;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:383: ++enemy->iter;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,bc
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
;src/main.c:385: ++enemy->iter;
	inc	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00118$
00102$:
;src/main.c:388: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:389: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:390: ++enemy->iter;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:391: enemy->y = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;src/main.c:392: ++enemy->iter;
	inc	de
	ld	c,e
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),d
	jp	00118$
00105$:
;src/main.c:397: enemy->mover = NO;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:398: enemy->iter = enemy->longitud_camino;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	c,(hl)
	ld	b,#0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/main.c:402: enemy->reversePatrol = 1;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00118$
00114$:
;src/main.c:407: if(enemy->iter > 0){
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00145$
	xor	a, #0x80
00145$:
	jp	P,00111$
;src/main.c:408: if(enemy->iter == enemy->longitud_camino){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	l,(hl)
	ld	-8 (ix),l
	ld	-7 (ix),#0x00
	ld	a,e
	sub	a, -8 (ix)
	jp	NZ,00108$
	ld	a,d
	sub	a, -7 (ix)
	jp	NZ,00108$
;src/main.c:409: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:410: enemy->iter = enemy->iter - 1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:411: enemy->iter = enemy->iter - 2;
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	dec	de
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:412: enemy->y = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
;src/main.c:413: --enemy->iter;
	ld	a,-8 (ix)
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
;src/main.c:414: enemy->x = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:415: --enemy->iter;
	ld	a,-8 (ix)
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
;src/main.c:417: enemy->mover = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:418: enemy->y = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:419: --enemy->iter;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/main.c:420: enemy->x = enemy->camino[enemy->iter];
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:421: --enemy->iter;
	dec	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jr	00118$
00111$:
;src/main.c:426: enemy->mover = NO;
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:427: enemy->iter = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:429: enemy->reversePatrol = 0;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
00118$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:436: void lookFor(TEnemy* enemy){
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
;src/main.c:445: i16 difx = abs((i16)(enemy->x - prota.x));
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
;src/main.c:446: i16 dify = abs((i16)(enemy->y - prota.y));
	ld	hl,#0x0001
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:448: dist = difx + dify; // manhattan
	ld	c,-7 (ix)
	add	hl, bc
	ld	-5 (ix),l
;src/main.c:449: enemy->seen = NO;
	ld	hl,#0x0012
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:450: enemy->in_range = NO;
	ld	hl,#0x0011
	add	hl,de
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;src/main.c:451: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
	push	bc
	push	de
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/main.c:452: if(!enemy->seek){
	push	de
	pop	iy
	ld	a,20 (iy)
	or	a, a
	jp	NZ,00111$
;src/main.c:453: if (dist <= 10) {// te detectan los sensores de proximidad
	ld	a,#0x0A
	sub	a, -5 (ix)
	jr	C,00107$
;src/main.c:454: enemy->in_range = 1;
	ld	a,#0x01
	ld	(bc),a
;src/main.c:455: enemy->engage = 1;
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x01
;src/main.c:456: enemy->seen = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jr	00111$
00107$:
;src/main.c:457: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
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
;src/main.c:458: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
	ld	hl, #(_prota + 0x0001) + 0
	ld	c,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:459: enemy->seen = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
00111$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:465: void moverEnemigoSeek(TEnemy* actual){
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
;src/main.c:468: if(!actual->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a, 8 (iy)
	or	a, a
	jp	NZ,00114$
;src/main.c:471: if(actual->iter < actual->longitud_camino){
	ld	hl,#0x000E
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	l, c
	ld	h, b
	ld	de, #0x00E1
	add	hl, de
	ld	e,(hl)
	ld	d,#0x00
;src/main.c:480: actual->y = actual->camino[actual->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
;src/main.c:471: if(actual->iter < actual->longitud_camino){
	ld	a,-10 (ix)
	sub	a, e
	ld	a,-9 (ix)
	sbc	a, d
	jp	PO, 00136$
	xor	a, #0x80
00136$:
	jp	P,00110$
;src/main.c:476: actual->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
;src/main.c:478: actual->x = actual->camino[actual->iter];
	ld	a,c
	add	a, #0x19
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
;src/main.c:474: if(actual->iter == 0){
	ld	a,-9 (ix)
	or	a,-10 (ix)
	jr	NZ,00102$
;src/main.c:476: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:477: actual->iter = 2;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;src/main.c:478: actual->x = actual->camino[actual->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:479: ++actual->iter;
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
;src/main.c:480: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),e
;src/main.c:481: ++actual->iter;
	inc	bc
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00114$
00102$:
;src/main.c:484: actual->mover = SI;
	ld	(hl),#0x01
;src/main.c:485: actual->x = actual->camino[actual->iter];
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:486: ++actual->iter;
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
;src/main.c:487: actual->y = actual->camino[actual->iter];
	ex	de,hl
	add	hl,bc
	ld	e,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),e
;src/main.c:488: ++actual->iter;
	inc	bc
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jp	00114$
00110$:
;src/main.c:493: actual->seek = 0;
	ld	hl,#0x0014
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:494: lookFor(actual);
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
;src/main.c:495: if(!actual->seen){
	ld	l, c
	ld	h, b
	ld	de, #0x0012
	add	hl, de
	ld	a,(hl)
	ld	-6 (ix),a
;src/main.c:496: actual->patrolling = 1;
	ld	hl,#0x000B
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:495: if(!actual->seen){
	ld	a,-6 (ix)
	or	a, a
	jr	NZ,00107$
;src/main.c:496: actual->patrolling = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:497: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
	push	bc
	pop	iy
	ld	a,24 (iy)
	ld	-6 (ix),a
	push	bc
	pop	iy
	ld	d,23 (iy)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
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
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	jr	00108$
00107$:
;src/main.c:499: actual->patrolling = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:500: if(!actual->engage){
	push	bc
	pop	iy
	ld	a,22 (iy)
	or	a, a
	jr	NZ,00108$
;src/main.c:501: actual->seek = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:502: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-3 (ix),a
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	ld	a,(bc)
	ld	-2 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-3 (ix)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
00108$:
;src/main.c:505: actual->iter = 0;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00114$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:513: void engage(TEnemy *enemy, u8 dx, u8 dy) {
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
;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
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
;src/main.c:515: u8 dify = abs(enemy->y - prota.y);
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
;src/main.c:516: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-14 (ix),l
;src/main.c:518: u8 movX = 0;
	ld	-13 (ix),#0x00
;src/main.c:519: u8 movY = 0;
	ld	-15 (ix),#0x00
;src/main.c:520: u8 distConstraint = 25;
	ld	c,#0x19
;src/main.c:521: enemy->mover = NO;
	ld	a,-12 (ix)
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
;src/main.c:523: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
;src/main.c:536: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
	ld	a,b
	add	a, #0x04
	ld	-5 (ix),a
;src/main.c:523: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
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
;src/main.c:524: if (dx < enemy->x) { // izquierda
	ld	a,6 (ix)
	sub	a, b
	jp	NC,00114$
;src/main.c:525: if (dist > 11) {
	ld	a,#0x0B
	sub	a, -14 (ix)
	jp	NC,00199$
;src/main.c:526: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
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
;src/main.c:527: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:528: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:529: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:531: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00114$:
;src/main.c:535: if (dist > G_ENEMY_W + 3) {
	ld	a,#0x07
	sub	a, -14 (ix)
	jp	NC,00199$
;src/main.c:536: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
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
;src/main.c:537: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:538: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:539: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:541: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00195$:
;src/main.c:546: else if (enemy->x == dx) {
	ld	a,6 (ix)
	sub	a, b
	jp	NZ,00192$
;src/main.c:547: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -6 (ix)
	jp	NC,00129$
;src/main.c:548: if (dist > G_HERO_H + 5) {
	ld	a,#0x1B
	sub	a, -14 (ix)
	jp	NC,00199$
;src/main.c:549: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:551: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
;src/main.c:552: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:554: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00129$:
;src/main.c:558: if(dist > G_ENEMY_H + 7) {
	ld	a,#0x1D
	sub	a, -14 (ix)
	jp	NC,00199$
;src/main.c:559: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:560: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
;src/main.c:562: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:564: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00192$:
;src/main.c:570: if (!prota.mover) distConstraint = 20; // ajuste en parado
	ld	a, (#_prota + 6)
	or	a, a
	jr	NZ,00132$
	ld	c,#0x14
00132$:
;src/main.c:572: if (dist > distConstraint) {
	ld	a,c
	sub	a, -14 (ix)
	jp	NC,00199$
;src/main.c:573: if (dx + 1 < enemy->x) {
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
;src/main.c:574: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
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
;src/main.c:575: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:576: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:577: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:578: movX = 1;
	ld	-13 (ix),#0x01
;src/main.c:579: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00145$
00144$:
;src/main.c:581: } else if (dx + 1 > enemy->x){
	ld	a,-4 (ix)
	sub	a, -2 (ix)
	ld	a,-3 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00428$
	xor	a, #0x80
00428$:
	jp	P,00145$
;src/main.c:582: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
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
;src/main.c:583: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:584: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:585: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:586: movX = 1;
	ld	-13 (ix),#0x01
;src/main.c:587: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00145$:
;src/main.c:590: if (dy < enemy->y) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,(hl)
;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	b,(hl)
;src/main.c:590: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, c
	jp	NC,00155$
;src/main.c:591: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:592: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:593: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
;src/main.c:594: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:595: movY = 1;
	ld	-15 (ix),#0x01
;src/main.c:596: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00156$
00155$:
;src/main.c:599: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:600: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:601: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
;src/main.c:602: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:603: movY = 1;
	ld	-15 (ix),#0x01
;src/main.c:604: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00156$:
;src/main.c:607: if (!enemy->mover) {
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	or	a, a
	jp	NZ,00199$
;src/main.c:608: if (!movX) {
	ld	a,-13 (ix)
	or	a, a
	jp	NZ,00171$
;src/main.c:609: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,(hl)
;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:609: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jp	NC,00168$
;src/main.c:610: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:611: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:612: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
;src/main.c:613: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:614: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00171$
00158$:
;src/main.c:616: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:617: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00171$
00168$:
;src/main.c:620: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:621: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:622: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
;src/main.c:623: moverEnemigoArriba(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:624: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00171$
00163$:
;src/main.c:626: moverEnemigoAbajo(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:627: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00171$:
;src/main.c:632: if (!movY) {
	ld	a,-15 (ix)
	or	a, a
	jp	NZ,00199$
;src/main.c:633: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	c,(hl)
;src/main.c:515: u8 dify = abs(enemy->y - prota.y);
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	b,(hl)
;src/main.c:633: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,c
	sub	a, #0x28
	jp	NC,00183$
;src/main.c:634: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
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
;src/main.c:635: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:636: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:637: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:638: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00173$:
;src/main.c:640: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:641: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00199$
00183$:
;src/main.c:644: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
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
;src/main.c:645: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:646: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:647: moverEnemigoDerecha(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:648: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00199$
00178$:
;src/main.c:651: moverEnemigoIzquierda(enemy);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:652: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
00199$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:661: void updateEnemy(TEnemy* actual) { // maquina de estados
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
;src/main.c:668: if (actual->engage) { // prioridad a la persecucion, nunca te deja
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl,#0x0016
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	ld	-7 (ix), a
	or	a, a
	jr	Z,00115$
;src/main.c:669: engage(actual, prota.x, prota.y);
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
;src/main.c:672: if (actual->patrolling) {
	ld	hl,#0x000B
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
;src/main.c:683: actual->seek = 1;
	ld	a,c
	add	a, #0x14
	ld	-4 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-3 (ix),a
;src/main.c:675: if (actual->in_range) {
	ld	a,c
	add	a, #0x11
	ld	-6 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-5 (ix),a
;src/main.c:672: if (actual->patrolling) {
	ld	a,l
	or	a, a
	jp	Z,00112$
;src/main.c:674: moverEnemigoPatrol(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoPatrol
	pop	af
	pop	de
	pop	bc
;src/main.c:675: if (actual->in_range) {
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00104$
;src/main.c:676: engage(actual, prota.x, prota.y);
	ld	a, (#_prota + 1)
	ld	hl, #_prota + 0
	push	af
	ld	a,(hl)
	ld	-7 (ix),a
	pop	af
	push	de
	push	af
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
	pop	de
;src/main.c:677: actual->patrolling = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:678: actual->engage = 1;
	ld	a,#0x01
	ld	(de),a
	jp	00117$
00104$:
;src/main.c:679: } else if (actual->seen) {
	ld	hl,#0x0012
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00117$
;src/main.c:680: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
	ld	a,(#_prota + 1)
	ld	-7 (ix),a
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	a,(bc)
	ld	-12 (ix),a
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-7 (ix)
	push	af
	inc	sp
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a,-12 (ix)
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:681: actual->p_seek_x = actual->x;
	ld	hl,#0x0017
	add	hl,bc
	ex	de,hl
	ld	a,(bc)
	ld	(de),a
;src/main.c:682: actual->p_seek_y = actual->y;
	ld	hl,#0x0018
	add	hl,bc
	ex	de,hl
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:683: actual->seek = 1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:684: actual->iter=0;
	ld	hl,#0x000E
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:685: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:686: actual->patrolling = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:687: actual->seen = 0;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
	jr	00117$
00112$:
;src/main.c:689: } else if (actual->seek) {
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:690: moverEnemigoSeek(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoSeek
	pop	af
	pop	de
	pop	bc
;src/main.c:691: if (actual->in_range) {
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:692: engage(actual, prota.x, prota.y);
	ld	a, (#_prota + 1)
	ld	hl, #_prota + 0
	push	af
	ld	a,(hl)
	ld	-12 (ix),a
	pop	af
	push	de
	push	af
	inc	sp
	ld	a,-12 (ix)
	push	af
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
	pop	de
;src/main.c:693: actual->seek = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:694: actual->engage = 1;
	ld	a,#0x01
	ld	(de),a
;src/main.c:695: } else if (actual->seen) {
00117$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:702: void inicializarEnemy() {
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
;src/main.c:703: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-1 (ix),a
;src/main.c:713: actual = enemy;
	ld	de,#_enemy+0
;src/main.c:714: while(i){
00101$:
	ld	a,-1 (ix)
	or	a, a
	jp	Z,00104$
;src/main.c:715: --i;
	dec	-1 (ix)
;src/main.c:716: actual->x = actual->px = spawnX[i];
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
;src/main.c:717: actual->y = actual->py = spawnY[i];
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
;src/main.c:718: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:719: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x03
;src/main.c:720: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:721: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
;src/main.c:722: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x00
;src/main.c:723: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x01
;src/main.c:724: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x00
;src/main.c:725: actual->iter = 0;
	ld	hl,#0x000E
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:726: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,de
	ld	(hl),#0x00
;src/main.c:727: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x00
;src/main.c:728: actual->found = 0;
	ld	hl,#0x0013
	add	hl,de
	ld	(hl),#0x00
;src/main.c:729: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
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
;src/main.c:752: dibujarEnemigo(actual);
	push	de
	push	de
	call	_dibujarEnemigo
	pop	af
	pop	de
;src/main.c:753: ++actual;
	ld	hl,#0x00E2
	add	hl,de
	ex	de,hl
	jp	00101$
00104$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:757: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:758: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:759: mapa = mapas[++num_mapa];
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
;src/main.c:760: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:761: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:762: dibujarMapa();
	call	_dibujarMapa
;src/main.c:763: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:766: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	jp  _menuFin
;src/main.c:770: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:771: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:772: if (!checkCollision(M_izquierda)) {
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
;src/main.c:773: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:774: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:775: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:779: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:780: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:781: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:782: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:783: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:784: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:786: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:787: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:791: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:792: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:793: if (!checkCollision(M_arriba)) {
	ld	a,#0x02
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:794: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:795: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:796: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:797: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:801: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:802: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:803: if (!checkCollision(M_abajo) ) {
	ld	a,#0x03
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:804: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:805: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:806: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:807: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:814: void intHandler() {
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
;src/main.c:815: if (++i == 6) {
	ld	hl, #_i+0
	inc	(hl)
	ld	a,(#_i + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:816: play();
	call	_play
;src/main.c:817: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:821: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:822: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:823: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:824: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:825: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:830: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:832: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:833: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:834: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:836: dibujarMapa();
	call	_dibujarMapa
;src/main.c:839: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:842: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:843: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
;src/main.c:844: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:845: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:846: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:850: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:851: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:852: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:853: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:854: cu.off_bound = NO;
	ld	hl,#(_cu + 0x000a)
	ld	(hl),#0x00
;src/main.c:856: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:858: dibujarProta();
	jp  _dibujarProta
;src/main.c:861: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:866: inicializarCPC();
	call	_inicializarCPC
;src/main.c:868: menuInicio();
	call	_menuInicio
;src/main.c:870: inicializarJuego();
	call	_inicializarJuego
;src/main.c:874: while (1) {
00119$:
;src/main.c:876: i = 2 + num_mapa;
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	inc	c
;src/main.c:877: actual = enemy;
;src/main.c:879: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
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
;src/main.c:881: while(i){
	ld	-1 (ix),c
	ld	-3 (ix),#<(_enemy)
	ld	-2 (ix),#>(_enemy)
00101$:
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00103$
;src/main.c:882: --i;
	dec	-1 (ix)
;src/main.c:883: updateEnemy(actual);
	pop	hl
	push	hl
	push	hl
	call	_updateEnemy
	pop	af
;src/main.c:884: ++actual;
	ld	a,-3 (ix)
	add	a, #0xE2
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	jr	00101$
00103$:
;src/main.c:887: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:890: if (prota.mover) {
	ld	bc,#_prota + 6
	ld	a,(bc)
	or	a, a
	jr	Z,00105$
;src/main.c:891: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:892: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00105$:
;src/main.c:894: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	c,(hl)
;src/main.c:895: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
;src/main.c:894: if(cu.lanzado && cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00110$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	Z,00110$
;src/main.c:895: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
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
	jr	00111$
00110$:
;src/main.c:896: }else if (cu.lanzado && !cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00111$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	NZ,00111$
;src/main.c:897: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
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
;src/main.c:898: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00111$:
;src/main.c:901: i = 2 + num_mapa;
	ld	a,(#_num_mapa + 0)
	add	a, #0x02
	ld	-3 (ix),a
;src/main.c:902: actual = enemy;
	ld	bc,#_enemy
;src/main.c:903: while(i){
00115$:
	ld	a,-3 (ix)
	or	a, a
	jr	Z,00117$
;src/main.c:905: --i;
	dec	-3 (ix)
;src/main.c:906: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00114$
;src/main.c:907: redibujarEnemigo((*actual).px, (*actual).py, actual);
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
00114$:
;src/main.c:920: ++actual;
	ld	hl,#0x00E2
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00115$
00117$:
;src/main.c:922: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00119$
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
