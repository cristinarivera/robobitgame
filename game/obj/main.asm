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
	.globl _updateEnemies
	.globl _engage
	.globl _lookFor
	.globl _moverEnemigoSeek
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
	.ds 112
_prota::
	.ds 8
_cu::
	.ds 10
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
;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
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
;src/main.c:111: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
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
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x47	; 71	'G'
	.db #0x32	; 50	'2'
	.db #0x18	; 24
_spawnY:
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x72	; 114	'r'
	.db #0x9A	; 154
	.db #0x68	; 104	'h'
_patrolX:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_patrolY:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x9C	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;src/main.c:117: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:122: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:126: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
;src/main.c:134: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:135: borrarProta();
	call	_borrarProta
;src/main.c:136: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:137: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:138: dibujarProta();
	jp  _dibujarProta
;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:142: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:144: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:146: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:148: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:150: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:152: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
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
;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:162: switch (direction) {
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
;src/main.c:163: case 0:
00101$:
;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	c,(hl)
	ld	a, (#_prota + 0)
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
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
;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x14
	ld	c,a
	ld	hl, #_prota + 0
	ld	b,(hl)
	inc	b
	inc	b
	inc	b
	inc	b
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
;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x0B
	ld	b,a
	ld	a, (#_prota + 0)
	add	a, #0x04
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
;src/main.c:167: break;
	jp	00105$
;src/main.c:168: case 1:
00102$:
;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
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
;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
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
;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
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
;src/main.c:172: break;
	jr	00105$
;src/main.c:173: case 2:
00103$:
;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
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
;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
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
;src/main.c:176: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:177: break;
	jr	00105$
;src/main.c:178: case 3:
00104$:
;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
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
;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
;src/main.c:181: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:183: }
00105$:
;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
;src/main.c:186: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:188: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:204: u8 w = 4 + (enemy->px & 1);
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
;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
;	---------------------------------
; Function borrarEnemigo
; ---------------------------------
_borrarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:217: u8 w = 4 + (x & 1);
	ld	a,4 (ix)
	and	a, #0x01
	ld	e,a
	inc	e
	inc	e
	inc	e
	inc	e
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
	ld	d,a
;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	hl,(_mapa)
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	c,5 (ix)
	ld	b,#0x00
	ld	a,c
	add	a,#0xE8
	ld	-4 (ix),a
	ld	a,b
	adc	a,#0xFF
	ld	-3 (ix),a
	pop	hl
	push	hl
	bit	7, -3 (ix)
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
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	push	de
	push	bc
	call	_cpct_etm_drawTileBox2x4
;src/main.c:224: enemy->mover = NO;
	ld	hl,#(_enemy + 0x0006)
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:228: borrarEnemigo(x, y);
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:229: enemy->px = enemy->x;
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:230: enemy->py = enemy->y;
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
;src/main.c:231: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
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
;src/main.c:253: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:260: enemy->mira = M_izquierda;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:238: switch (direction) {
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
;src/main.c:245: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00109$:
;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, e
	jr	NC,00106$
;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:250: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00103$:
;src/main.c:253: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00106$:
;src/main.c:256: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00113$:
;src/main.c:260: enemy->mira = M_izquierda;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:262: break;
	jp	00165$
;src/main.c:263: case 1:
00117$:
;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
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
;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
;src/main.c:269: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00125$:
;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	a,(bc)
	ld	e,a
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	a,c
	sub	a, e
	jr	NC,00122$
;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:274: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00119$:
;src/main.c:277: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00122$:
;src/main.c:280: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00129$:
;src/main.c:284: enemy->mira = M_derecha;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:286: break;
	jp	00165$
;src/main.c:287: case 2:
00133$:
;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
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
;src/main.c:294: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00141$:
;src/main.c:297: if(enemy->y>cu.y){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00138$
;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
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
;src/main.c:299: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00135$:
;src/main.c:302: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00149$
00138$:
;src/main.c:306: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00145$:
;src/main.c:312: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:315: case 3:
00149$:
;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
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
;src/main.c:323: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00157$:
;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00154$
;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:328: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00151$:
;src/main.c:331: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00165$
00154$:
;src/main.c:335: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00161$:
;src/main.c:339: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:342: }
00165$:
;src/main.c:343: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:347: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:348: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:349: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:353: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:354: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:355: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:359: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:360: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:361: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:365: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:366: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:367: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:370: void moverEnemigoPatrol(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoPatrol
; ---------------------------------
_moverEnemigoPatrol::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-11
	add	hl,sp
	ld	sp,hl
;src/main.c:371: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00118$
;src/main.c:373: if (!enemy->reversePatrol) {
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	ld	-11 (ix),a
;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
	ld	iy,#0x000E
	add	iy, bc
	ld	a,0 (iy)
	ld	-2 (ix),a
	ld	a,1 (iy)
	ld	-1 (ix),a
	ld	hl,#0x001B
	add	hl,bc
;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
	ld	a,c
	add	a, #0x19
	ld	-4 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-3 (ix),a
;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
	ld	a,c
	add	a, #0x01
	ld	-6 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-5 (ix),a
;src/main.c:381: enemy->mover = SI;
	ld	a,c
	add	a, #0x06
	ld	-8 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-7 (ix),a
;src/main.c:373: if (!enemy->reversePatrol) {
	ld	a,-11 (ix)
	or	a, a
	jp	NZ,00114$
;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
	ld	l,(hl)
	ld	h,#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	a,-1 (ix)
	sbc	a, h
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	P,00105$
;src/main.c:375: if(enemy->iter == 0){
	ld	a,-1 (ix)
	or	a,-2 (ix)
	jr	NZ,00102$
;src/main.c:376: enemy->iter = 2;
	ld	0 (iy),#0x02
	ld	1 (iy),#0x00
;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,0 (iy)
	ld	h,1 (iy)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:378: ++enemy->iter;
	ld	c,0 (iy)
	ld	b,1 (iy)
	inc	bc
	ld	0 (iy),c
	ld	1 (iy),b
;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:380: ++enemy->iter;
	inc	bc
	ld	0 (iy),c
	ld	1 (iy),b
;src/main.c:381: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00118$
00102$:
;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:384: ++enemy->iter;
	ld	c,0 (iy)
	ld	b,1 (iy)
	inc	bc
	ld	0 (iy),c
	ld	1 (iy),b
;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:386: ++enemy->iter;
	inc	bc
	ld	0 (iy),c
	ld	1 (iy),b
;src/main.c:387: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jp	00118$
00105$:
;src/main.c:391: enemy->iter = enemy->longitud_camino;
	ld	0 (iy),l
	ld	1 (iy),h
;src/main.c:395: enemy->reversePatrol = 1;
	ld	a,#0x01
	ld	(de),a
;src/main.c:396: enemy->mover = NO;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
	jp	00118$
00114$:
;src/main.c:400: if(enemy->iter > 0){
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00145$
	xor	a, #0x80
00145$:
	jp	P,00111$
;src/main.c:401: if(enemy->iter == enemy->longitud_camino){
	ld	e,(hl)
	ld	d,#0x00
	ld	a,-2 (ix)
	sub	a, e
	jp	NZ,00108$
	ld	a,-1 (ix)
	sub	a, d
	jr	NZ,00108$
;src/main.c:402: enemy->iter = enemy->iter - 1;
	ld	a,-2 (ix)
	add	a,#0xFF
	ld	-10 (ix),a
	ld	a,-1 (ix)
	adc	a,#0xFF
	ld	-9 (ix),a
	ld	a,-10 (ix)
	ld	0 (iy),a
	ld	a,-9 (ix)
	ld	1 (iy),a
;src/main.c:403: enemy->iter = enemy->iter - 2;
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	dec	de
	dec	de
	ld	0 (iy),e
	ld	1 (iy),d
;src/main.c:404: enemy->y = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:405: --enemy->iter;
	ld	a,-10 (ix)
	add	a,#0xFD
	ld	e,a
	ld	a,-9 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	0 (iy),e
	ld	1 (iy),d
;src/main.c:406: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:407: --enemy->iter;
	ld	a,-10 (ix)
	add	a,#0xFC
	ld	c,a
	ld	a,-9 (ix)
	adc	a,#0xFF
	ld	0 (iy), c
	ld	1 (iy), a
;src/main.c:408: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00118$
00108$:
;src/main.c:410: enemy->y = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,de
	ld	e,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),e
;src/main.c:411: --enemy->iter;
	ld	e,0 (iy)
	ld	d,1 (iy)
	dec	de
	ld	0 (iy),e
	ld	1 (iy),d
;src/main.c:412: enemy->x = enemy->camino[enemy->iter];
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:413: --enemy->iter;
	dec	de
	ld	0 (iy),e
	ld	1 (iy),d
;src/main.c:414: enemy->mover = SI;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00118$
00111$:
;src/main.c:418: enemy->iter = 0;
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;src/main.c:420: enemy->reversePatrol = 0;
	xor	a, a
	ld	(de),a
;src/main.c:421: enemy->mover = NO;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
00118$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:427: void moverEnemigoSeek(TEnemy* enemy){
;	---------------------------------
; Function moverEnemigoSeek
; ---------------------------------
_moverEnemigoSeek::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:428: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00108$
;src/main.c:430: if (!enemy->reversePatrol) {
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jp	NZ,00108$
;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
	ld	iy,#0x000E
	add	iy, bc
	ld	a,0 (iy)
	ld	-4 (ix),a
	ld	a,1 (iy)
	ld	-3 (ix),a
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x001B
	add	hl, bc
	pop	bc
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xF8
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
	ld	a,c
	add	a, #0x01
	ld	-2 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-1 (ix),a
;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
	ld	a,-4 (ix)
	sub	a, l
	ld	a,-3 (ix)
	sbc	a, h
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P,00102$
;src/main.c:432: enemy->x = enemy->camino[enemy->iter];
	ld	hl,#0x0019
	add	hl,bc
	ld	e,l
	ld	d,h
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,-4 (ix)
	add	a, l
	ld	l,a
	ld	a,-3 (ix)
	adc	a, h
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
;src/main.c:433: enemy->iter++;
	ld	l,0 (iy)
	ld	h,1 (iy)
	inc	hl
	ex	(sp), hl
	ld	a,-4 (ix)
	ld	0 (iy),a
	ld	a,-3 (ix)
	ld	1 (iy),a
;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
	ex	de,hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	hl
	push	hl
	add	hl,de
	ld	e,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
;src/main.c:435: enemy->iter++;
	pop	de
	push	de
	inc	de
	ld	0 (iy),e
	ld	1 (iy),d
;src/main.c:436: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	jr	00108$
00102$:
;src/main.c:439: enemy->reversePatrol = NO;
	xor	a, a
	ld	(de),a
;src/main.c:440: enemy->patrolling = 1;
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:441: enemy->seek = 0;
	ld	hl,#0x0014
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:442: enemy->lastIter = enemy->iter - 1;
	ld	hl,#0x0010
	add	hl,bc
	ex	de,hl
	ld	a, 0 (iy)
	add	a,#0xFF
	ld	(de),a
;src/main.c:443: enemy->iter = 0;
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;src/main.c:444: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
	ld	l, c
	ld	h, b
	ld	de, #0x0018
	add	hl, de
	ld	d,(hl)
	push	bc
	pop	iy
	ld	a,23 (iy)
	ld	-4 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	ld	a,(bc)
	ld	-2 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	push	de
	inc	sp
	ld	d, -4 (ix)
	push	de
	ld	a,-2 (ix)
	push	af
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
00108$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:451: void lookFor(TEnemy* enemy){
;	---------------------------------
; Function lookFor
; ---------------------------------
_lookFor::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:460: i16 difx = abs((i16)(enemy->x - prota.x));
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	e,a
	ld	d,#0x00
	ld	hl,#_prota+0
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
;src/main.c:461: i16 dify = abs((i16)(enemy->y - prota.y));
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#_prota+1
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
;src/main.c:464: enemy->seen = NO;
	ld	hl,#0x0012
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:465: enemy->inRange = NO;
	ld	hl,#0x0011
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:466: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	ix
	ret
;src/main.c:479: void engage(TEnemy *enemy, u8 dx, u8 dy) {
;	---------------------------------
; Function engage
; ---------------------------------
_engage::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	a,4 (ix)
	ld	-9 (ix),a
	ld	a,5 (ix)
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
	ld	a,-9 (ix)
	add	a, #0x01
	ld	-7 (ix),a
	ld	a,-8 (ix)
	adc	a, #0x00
	ld	-6 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#_prota+1
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
;src/main.c:482: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-13 (ix),l
;src/main.c:484: u8 movX = 0;
	ld	-10 (ix),#0x00
;src/main.c:485: u8 movY = 0;
	ld	-11 (ix),#0x00
;src/main.c:486: u8 mov = 0;
	ld	-12 (ix),#0x00
;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
;src/main.c:490: if (dist > 10) {
	ld	a,#0x0A
	sub	a, -13 (ix)
	ld	a,#0x00
	rla
	ld	-4 (ix),a
;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
	ld	a,7 (ix)
	sub	a, -5 (ix)
	jp	NZ,00187$
;src/main.c:490: if (dist > 10) {
	ld	a,-4 (ix)
	or	a, a
	jp	Z,00189$
;src/main.c:491: if (dx < enemy->x) { // izquierda
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	ld	a,6 (ix)
	sub	a, b
	jr	NC,00110$
;src/main.c:492: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
	dec	b
	ld	a,-5 (ix)
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
	jp	C,00189$
;src/main.c:493: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00189$
;src/main.c:494: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00189$
;src/main.c:495: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:497: mov = 1;
	jp	00189$
00110$:
;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	a,b
	add	a, #0x05
	ld	b,a
	ld	a,-5 (ix)
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
	jp	C,00189$
;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	add	a, #0x05
	ld	b,a
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
	jp	C,00189$
;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	add	a, #0x05
	ld	b,a
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
	jp	C,00189$
;src/main.c:503: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:505: mov = 1;
	jp	00189$
00187$:
;src/main.c:510: else if (enemy->x == dx) {
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	sub	a, 6 (ix)
	jp	NZ,00184$
;src/main.c:512: if (dist > 10) {
	ld	a,-4 (ix)
	or	a, a
	jp	Z,00189$
;src/main.c:513: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -5 (ix)
	jr	NC,00123$
;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
	ld	b,-5 (ix)
	dec	b
	dec	b
	push	bc
	inc	sp
	ld	a,-3 (ix)
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
	jp	C,00189$
;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jp	C,00189$
;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jp	C,00189$
;src/main.c:517: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:519: mov = 1;
	jp	00189$
00123$:
;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	a,-5 (ix)
	add	a, #0x18
	ld	b,a
	push	bc
	inc	sp
	ld	a,-3 (ix)
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
	jp	C,00189$
;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jp	C,00189$
;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jp	C,00189$
;src/main.c:525: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:527: mov = 1;
	jp	00189$
00184$:
;src/main.c:533: if (dist > 20) {
	ld	a,#0x14
	sub	a, -13 (ix)
	jp	NC,00189$
;src/main.c:534: if (dx < enemy->x) {
	ld	a,6 (ix)
	sub	a, -3 (ix)
	jp	NC,00136$
;src/main.c:535: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
	ld	b,-3 (ix)
	dec	b
	ld	a,-5 (ix)
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
	jp	C,00137$
;src/main.c:536: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	c,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	dec	b
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
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00137$
;src/main.c:537: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	c,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	dec	b
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
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00137$
;src/main.c:538: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:539: movX = 1;
	ld	-10 (ix),#0x01
;src/main.c:540: mov = 1;
	ld	-12 (ix),#0x01
	jp	00137$
00136$:
;src/main.c:543: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	a,-3 (ix)
	add	a, #0x05
	ld	b,a
	ld	a,-5 (ix)
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
	jr	C,00137$
;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	add	a, #0x05
	ld	b,a
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
	jr	C,00137$
;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	add	a, #0x05
	ld	b,a
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
	jr	C,00137$
;src/main.c:546: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:547: movX = 1;
	ld	-10 (ix),#0x01
;src/main.c:548: mov = 1;
	ld	-12 (ix),#0x01
00137$:
;src/main.c:551: if (dy < enemy->y) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
;src/main.c:551: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -3 (ix)
	jp	NC,00147$
;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
	ld	a,-3 (ix)
	add	a,#0xFE
	ld	-5 (ix), a
	push	af
	inc	sp
	ld	a,-4 (ix)
	push	af
	inc	sp
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
	jp	C,00148$
;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-2 (ix), a
	add	a,#0xFE
	ld	-2 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	inc	b
	inc	b
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
	jp	C,00148$
;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jp	C,00148$
;src/main.c:555: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:556: movY = 1;
	ld	-11 (ix),#0x01
;src/main.c:557: mov = 1;
	ld	-12 (ix),#0x01
	jp	00148$
00147$:
;src/main.c:560: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	a,-3 (ix)
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
	jr	C,00148$
;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jr	C,00148$
;src/main.c:562: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jr	C,00148$
;src/main.c:563: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:564: movY = 1;
	ld	-11 (ix),#0x01
;src/main.c:565: mov = 1;
	ld	-12 (ix),#0x01
00148$:
;src/main.c:568: if (!mov) {
	ld	a,-12 (ix)
	or	a, a
	jp	NZ,00189$
;src/main.c:569: if (!movX) {
	ld	a,-10 (ix)
	or	a, a
	jp	NZ,00163$
;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e,(hl)
;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jr	NC,00160$
;src/main.c:571: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
	jr	C,00150$
;src/main.c:572: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jr	C,00150$
;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x18
	ld	b,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jr	C,00150$
;src/main.c:574: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
	jp	00163$
00150$:
;src/main.c:576: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
	jr	00163$
00160$:
;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
	jr	C,00155$
;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d,(hl)
	dec	d
	dec	d
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jr	C,00155$
;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,(hl)
	dec	b
	dec	b
	ld	l,-9 (ix)
	ld	h,-8 (ix)
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
	jr	C,00155$
;src/main.c:581: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
	jr	00163$
00155$:
;src/main.c:583: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
00163$:
;src/main.c:587: if (!movY) {
	ld	a,-11 (ix)
	or	a, a
	jp	NZ,00189$
;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e,(hl)
;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,c
	sub	a, #0x28
	jp	NC,00175$
;src/main.c:589: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
	ld	b,c
	dec	b
	ld	a,e
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
	jr	C,00165$
;src/main.c:590: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	c,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	dec	b
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
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00165$
;src/main.c:591: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	c,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	dec	b
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
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00165$
;src/main.c:592: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
	jp	00189$
00165$:
;src/main.c:594: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
	jr	00189$
00175$:
;src/main.c:597: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	a,c
	add	a, #0x05
	ld	b,a
	ld	a,e
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
	jr	C,00170$
;src/main.c:598: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x0B
	ld	b,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	add	a, #0x05
	ld	c,a
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
;src/main.c:599: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	add	a, #0x16
	ld	b,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	add	a, #0x05
	ld	c,a
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
;src/main.c:600: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
	jr	00189$
00170$:
;src/main.c:603: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
00189$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:612: void updateEnemies() { // maquina de estados
;	---------------------------------
; Function updateEnemies
; ---------------------------------
_updateEnemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/main.c:615: u8 i = 2 + 1;
	ld	-13 (ix),#0x03
;src/main.c:618: actual = enemy;
;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:622: while(--i) {
	ld	bc,#_enemy
00119$:
	dec	-13 (ix)
	ld	e, -13 (ix)
	ld	a,e
	or	a, a
	jp	Z,00122$
;src/main.c:623: if (actual->engage) { // prioridad a la persecucion, nunca te deja
	ld	hl,#0x0016
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00117$
;src/main.c:624: engage(actual, prota.x, prota.y);
	ld	a, (#(_prota + 0x0001) + 0)
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
	pop	bc
	jp	00118$
00117$:
;src/main.c:626: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
	push	bc
	push	bc
	call	_lookFor
	pop	af
	pop	bc
;src/main.c:627: if (actual->patrolling) { // esta patrullando
	ld	hl,#0x000B
	add	hl,bc
	ld	-12 (ix),l
	ld	-11 (ix),h
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	l,(hl)
;src/main.c:629: if (actual->inRange) {
	ld	a,c
	add	a, #0x11
	ld	e,a
	ld	a,b
	adc	a, #0x00
	ld	d,a
;src/main.c:638: actual->seek = 1;
	ld	a,c
	add	a, #0x14
	ld	-2 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-1 (ix),a
;src/main.c:627: if (actual->patrolling) { // esta patrullando
	ld	a,l
	or	a, a
	jp	Z,00114$
;src/main.c:628: moverEnemigoPatrol(actual);
	push	bc
	push	de
	push	bc
	call	_moverEnemigoPatrol
	pop	af
	pop	de
	pop	bc
;src/main.c:629: if (actual->inRange) {
	ld	a,(de)
	or	a, a
	jr	Z,00104$
;src/main.c:630: engage(actual, prota.x, prota.y);
	ld	a, (#(_prota + 0x0001) + 0)
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
	pop	bc
;src/main.c:631: actual->patrolling = 0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/main.c:632: actual->engage = 1;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
	jp	00118$
00104$:
;src/main.c:633: } else if (actual->seen) {
	ld	hl,#0x0012
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	or	a, a
	jp	Z,00118$
;src/main.c:635: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
	ld	a,(#(_prota + 0x0001) + 0)
	ld	-7 (ix),a
	ld	a,(#_prota + 0)
	ld	-10 (ix),a
	ld	hl,#0x0001
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	ld	a,(bc)
	ld	d,a
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	h,-7 (ix)
	ld	l,-10 (ix)
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:636: actual->p_seek_x = actual->x;
	ld	hl,#0x0017
	add	hl,bc
	ex	de,hl
	ld	a,(bc)
	ld	(de),a
;src/main.c:637: actual->p_seek_y = actual->y;
	ld	hl,#0x0018
	add	hl,bc
	ex	de,hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	(de),a
;src/main.c:638: actual->seek = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:639: actual->iter=0;
	ld	hl,#0x000E
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:640: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:641: actual->patrolling = 0;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	(hl),#0x00
;src/main.c:642: actual->seen = 0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
	jr	00118$
00114$:
;src/main.c:644: } else if (actual->seek) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	or	a, a
	jr	Z,00118$
;src/main.c:646: if (!actual->found /*&& actual->seekTimer <= 5*/) {
	push	bc
	pop	iy
	ld	a,19 (iy)
	or	a, a
	jr	NZ,00109$
;src/main.c:647: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
	push	bc
	push	bc
	call	_moverEnemigoSeek
	pop	af
	pop	bc
	jr	00118$
00109$:
;src/main.c:648: } else if (actual->inRange) {
	ld	a,(de)
	or	a, a
	jr	Z,00118$
;src/main.c:649: engage(actual, prota.x, prota.y);
	ld	a, (#(_prota + 0x0001) + 0)
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_engage
	pop	af
	pop	af
	pop	bc
;src/main.c:650: actual->engage = 1;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x01
00118$:
;src/main.c:654: actual++;
	ld	hl,#0x001C
	add	hl,bc
	ld	c,l
	ld	b,h
	jp	00119$
00122$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:658: void inicializarEnemy() {
;	---------------------------------
; Function inicializarEnemy
; ---------------------------------
_inicializarEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:669: actual = enemy;
	ld	bc,#_enemy+0
;src/main.c:670: while(--i){
	ld	-4 (ix),#0x03
00103$:
	dec	-4 (ix)
	ld	a,-4 (ix)
	or	a, a
	jp	Z,00106$
;src/main.c:671: actual->x = actual->px = spawnX[i];
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,#<(_spawnX)
	add	a, -4 (ix)
	ld	l,a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-3 (ix), a
	ld	(de),a
	ld	a,-3 (ix)
	ld	(bc),a
;src/main.c:672: actual->y = actual->py = spawnY[i];
	push	bc
	pop	iy
	inc	iy
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a,#<(_spawnY)
	add	a, -4 (ix)
	ld	l,a
	ld	a,#>(_spawnY)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-1 (ix), a
	ld	(de),a
	ld	a,-1 (ix)
	ld	0 (iy), a
;src/main.c:673: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:674: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/main.c:675: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:676: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:677: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:678: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:679: actual->reversePatrol = NO;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:680: actual->iter = 0;
	ld	hl,#0x000E
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:681: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:682: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:683: actual->found = 0;
	ld	hl,#0x0013
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:684: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
	ld	hl,#_num_mapa + 0
	ld	e, (hl)
	inc	e
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	hl,#_patrolY
	add	hl,de
	ld	a,-4 (ix)
	add	a, l
	ld	l,a
	ld	a,#0x00
	adc	a, h
	ld	h,a
	ld	a,(hl)
	ld	-2 (ix),a
	ld	hl,#_patrolX
	add	hl,de
	ld	e,-4 (ix)
	ld	d,#0x00
	add	hl,de
	ld	d,(hl)
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,-2 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	h,-1 (ix)
	ld	l,-3 (ix)
	push	hl
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:707: if(actual->longitud_camino > 0){
	push	bc
	pop	iy
	ld	a,27 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:708: dibujarEnemigo(actual);
	push	bc
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	bc
00102$:
;src/main.c:710: ++actual;
	ld	hl,#0x001C
	add	hl,bc
	ld	c,l
	ld	b,h
	jp	00103$
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:714: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:715: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:716: mapa = mapas[++num_mapa];
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
;src/main.c:717: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:718: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:719: dibujarMapa();
	call	_dibujarMapa
;src/main.c:720: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:723: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	jp  _menuFin
;src/main.c:727: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:728: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:729: if (!checkCollision(M_izquierda)) {
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
;src/main.c:730: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:731: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:732: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:736: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:737: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:738: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:739: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:740: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:741: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:743: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:744: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:748: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:749: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:750: if (!checkCollision(M_arriba)) {
	ld	a,#0x02
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:751: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:752: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:753: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:754: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:758: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:759: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:760: if (!checkCollision(M_abajo) ) {
	ld	a,#0x03
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:761: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:762: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:763: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:764: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:771: void intHandler() {
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
;src/main.c:772: if (++i == 6) {
	ld	hl, #_i+0
	inc	(hl)
	ld	a,(#_i + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:773: play();
	call	_play
;src/main.c:774: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:778: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:779: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:780: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:781: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:782: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:787: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:789: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:790: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:791: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:793: dibujarMapa();
	call	_dibujarMapa
;src/main.c:796: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:799: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:800: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
;src/main.c:801: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:802: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:803: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:807: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:808: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:809: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:810: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:812: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:814: dibujarProta();
	jp  _dibujarProta
;src/main.c:817: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:822: inicializarCPC();
	call	_inicializarCPC
;src/main.c:824: menuInicio();
	call	_menuInicio
;src/main.c:826: inicializarJuego();
	call	_inicializarJuego
;src/main.c:830: while (1) {
00116$:
;src/main.c:832: i = 2 + 1;
	ld	-1 (ix),#0x03
;src/main.c:833: actual = enemy;
;src/main.c:835: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
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
;src/main.c:836: moverCuchillo(&cu, mapa);
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_cu
	push	hl
	call	_moverCuchillo
	pop	af
	pop	af
;src/main.c:837: updateEnemies();
	call	_updateEnemies
;src/main.c:839: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:842: if (prota.mover) {
	ld	bc,#_prota + 6
	ld	a,(bc)
	or	a, a
	jr	Z,00102$
;src/main.c:843: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:844: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00102$:
;src/main.c:846: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	c,(hl)
;src/main.c:847: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
;src/main.c:846: if(cu.lanzado && cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00107$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	Z,00107$
;src/main.c:847: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
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
	jr	00127$
00107$:
;src/main.c:848: }else if (cu.lanzado && !cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00127$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	NZ,00127$
;src/main.c:849: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
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
;src/main.c:850: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:853: while(--i){
00127$:
	ld	bc,#_enemy
00112$:
	dec	-1 (ix)
	ld	e, -1 (ix)
	ld	a,e
	or	a, a
	jr	Z,00114$
;src/main.c:854: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00111$
;src/main.c:855: redibujarEnemigo((*actual).px, (*actual).py, actual);
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
	ld	a,(hl)
	push	bc
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	_redibujarEnemigo
	pop	af
	pop	af
	pop	bc
00111$:
;src/main.c:868: ++actual;
	ld	hl,#0x001C
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00112$
00114$:
;src/main.c:870: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00116$
	inc	sp
	pop	ix
	ret
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
