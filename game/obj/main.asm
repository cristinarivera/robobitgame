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
	.globl _seek
	.globl _patrol
	.globl _moverEnemigoSeek
	.globl _lookFor
	.globl _moverEnemigoPatrol
	.globl _moverEnemigo
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
	.globl _aumentarPuntuacion
	.globl _modificarPuntuacion
	.globl _barraPuntuacionInicial
	.globl _menuInicio
	.globl _menuFin
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_akp_musicInit
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _vidas
	.globl _puntuacion
	.globl _num_mapa
	.globl _mapa
	.globl _i
	.globl _cu
	.globl _prota
	.globl _enemy
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
	.ds 1304
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
;src/main.c:93: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0); 
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
;src/main.c:96: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:99: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
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
	.db #0x28	; 40
	.db #0x47	; 71	'G'
	.db #0x14	; 20
	.db #0x3C	; 60
_spawnY:
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x72	; 114	'r'
	.db #0x8A	; 138
	.db #0x8A	; 138
;src/main.c:102: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:103: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:104: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:107: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:111: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:114: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:116: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
;src/main.c:119: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:120: borrarProta();
	call	_borrarProta
;src/main.c:121: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:122: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:123: dibujarProta();
	jp  _dibujarProta
;src/main.c:126: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:127: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:129: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:130: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:131: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:132: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:133: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:134: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:135: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:136: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:137: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:138: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:139: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
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
;src/main.c:143: u8 checkCollision(u8 direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:144: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:146: switch (direction) {
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
;src/main.c:147: case 0:
00101$:
;src/main.c:148: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
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
;src/main.c:149: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
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
;src/main.c:150: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
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
;src/main.c:151: break;
	jp	00105$
;src/main.c:152: case 1:
00102$:
;src/main.c:153: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
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
;src/main.c:154: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
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
;src/main.c:155: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
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
;src/main.c:156: break;
	jr	00105$
;src/main.c:157: case 2:
00103$:
;src/main.c:158: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
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
;src/main.c:159: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
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
;src/main.c:160: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:161: break;
	jr	00105$
;src/main.c:162: case 3:
00104$:
;src/main.c:163: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
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
;src/main.c:164: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
;src/main.c:165: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:167: }
00105$:
;src/main.c:169: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
;src/main.c:170: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:172: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:175: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:176: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:177: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:180: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:181: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:182: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
;src/main.c:185: void borrarExplosion() {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:188: u8 w = 4 + (enemy->px & 1);
	ld	hl, #_enemy + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:191: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
	ld	-3 (ix),a
;src/main.c:193: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
;src/main.c:197: void borrarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function borrarEnemigo
; ---------------------------------
_borrarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:201: u8 w = 4 + (enemy->px & 1);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e,(hl)
	ld	a,e
	and	a, #0x01
	add	a, #0x04
	ld	-5 (ix),a
;src/main.c:204: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	d,(hl)
	bit	1, d
	jr	Z,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	ld	a,#0x00
00104$:
	add	a, #0x07
	ld	-6 (ix),a
;src/main.c:206: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
	ld	iy,(_mapa)
	ld	-2 (ix),d
	ld	-1 (ix),#0x00
	ld	a,-2 (ix)
	add	a,#0xE8
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a,#0xFF
	ld	-3 (ix),a
	ld	d,-4 (ix)
	ld	l,-3 (ix)
	bit	7, -3 (ix)
	jr	Z,00105$
	ld	a,-2 (ix)
	add	a, #0xEB
	ld	d,a
	ld	a,-1 (ix)
	adc	a, #0xFF
	ld	l,a
00105$:
	sra	l
	rr	d
	sra	l
	rr	d
	srl	e
	push	bc
	push	iy
	ld	hl,#0xC0F0
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	h,-6 (ix)
	ld	l,-5 (ix)
	push	hl
	push	de
	call	_cpct_etm_drawTileBox2x4
	pop	bc
;src/main.c:208: enemy->mover = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:211: void redibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:212: borrarEnemigo(enemy);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:213: enemy->px = enemy->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:214: enemy->py = enemy->y;
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
;src/main.c:215: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:218: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
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
;src/main.c:220: u8 colisiona = 1;
	ld	-9 (ix),#0x01
;src/main.c:222: switch (direction) {
	ld	a,#0x03
	sub	a, 4 (ix)
	jp	C,00165$
;src/main.c:224: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:237: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:244: enemy->mira = M_izquierda;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:222: switch (direction) {
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
;src/main.c:223: case 0:
00101$:
;src/main.c:224: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:225: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:226: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:228: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
;src/main.c:229: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00109$:
;src/main.c:232: if(cu.x > enemy->x){ //si el cu esta abajo
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, e
	jr	NC,00106$
;src/main.c:233: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:234: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00103$:
;src/main.c:237: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00106$:
;src/main.c:240: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00113$:
;src/main.c:244: enemy->mira = M_izquierda;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:246: break;
	jp	00165$
;src/main.c:247: case 1:
00117$:
;src/main.c:248: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
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
;src/main.c:249: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:250: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:252: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
;src/main.c:253: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00125$:
;src/main.c:256: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	a,(bc)
	ld	e,a
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	a,c
	sub	a, e
	jr	NC,00122$
;src/main.c:257: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:258: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00119$:
;src/main.c:261: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00122$:
;src/main.c:264: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00129$:
;src/main.c:268: enemy->mira = M_derecha;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:270: break;
	jp	00165$
;src/main.c:271: case 2:
00133$:
;src/main.c:272: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:273: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:274: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
;src/main.c:276: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
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
;src/main.c:278: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00141$:
;src/main.c:281: if(enemy->y>cu.y){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00138$
;src/main.c:282: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
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
;src/main.c:283: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00135$:
;src/main.c:286: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00149$
00138$:
;src/main.c:290: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00145$:
;src/main.c:296: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:299: case 3:
00149$:
;src/main.c:302: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:303: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:304: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
;src/main.c:306: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
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
;src/main.c:307: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00157$:
;src/main.c:310: if(cu.y > enemy->y){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00154$
;src/main.c:311: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:312: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00151$:
;src/main.c:315: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00165$
00154$:
;src/main.c:319: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00161$:
;src/main.c:323: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:326: }
00165$:
;src/main.c:327: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:330: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:331: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:332: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:333: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:336: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:337: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:338: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:339: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:342: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:343: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:344: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:345: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:348: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:349: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:350: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:351: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:354: void moverEnemigo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigo
; ---------------------------------
_moverEnemigo::
;src/main.c:355: if(!enemy->muerto){
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	ret	NZ
;src/main.c:356: if(!checkEnemyCollision(enemy->mira, enemy)){
	ld	hl,#0x0007
	add	hl,bc
	ld	d,(hl)
	push	hl
	push	bc
	push	bc
	push	de
	inc	sp
	call	_checkEnemyCollision
	pop	af
	inc	sp
	ld	a,l
	pop	bc
	pop	hl
	or	a, a
	ret	NZ
;src/main.c:358: switch (enemy->mira) {
	ld	e,(hl)
	ld	a,#0x03
	sub	a, e
	ret	C
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:360: case 0:
	jp	(hl)
00124$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:361: moverEnemigoDerecha(enemy);
	push	bc
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:362: break;
	ret
;src/main.c:363: case 1:
00102$:
;src/main.c:364: moverEnemigoIzquierda(enemy);
	push	bc
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:365: break;
	ret
;src/main.c:366: case 2:
00103$:
;src/main.c:367: moverEnemigoArriba(enemy);
	push	bc
	call	_moverEnemigoArriba
	pop	af
;src/main.c:368: break;
	ret
;src/main.c:369: case 3:
00104$:
;src/main.c:370: moverEnemigoAbajo(enemy);
	push	bc
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:372: }
	ret
;src/main.c:377: void moverEnemigoPatrol(TEnemy *enemy){
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
;src/main.c:378: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00112$
;src/main.c:380: if (!enemy->reversePatrol) {
	ld	hl,#0x000D
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
;src/main.c:381: if(enemy->iter < enemy->longitud_camino - 8){
	ld	hl,#0x000F
	add	hl,bc
	ex	de,hl
;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
	ld	hl,#0x0019
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
	ld	hl,#0x0001
	add	hl,bc
	ex	(sp), hl
;src/main.c:386: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:389: enemy->lastIter = enemy->iter - 1;
	ld	hl,#0x0010
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:380: if (!enemy->reversePatrol) {
	ld	a,-9 (ix)
	or	a, a
	jr	NZ,00108$
;src/main.c:381: if(enemy->iter < enemy->longitud_camino - 8){
	ld	a,(de)
	ld	-9 (ix),a
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0145
	add	hl, bc
	pop	bc
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xF8
	ld	-6 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-5 (ix),a
	ld	a, -9 (ix)
	ld	h, #0x00
	sub	a, -6 (ix)
	ld	a,h
	sbc	a, -5 (ix)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P,00102$
;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
	ld	l,-9 (ix)
	ld	h,#0x00
	ld	a,-11 (ix)
	add	a, l
	ld	l,a
	ld	a,-10 (ix)
	adc	a, h
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
;src/main.c:383: enemy->iter++;
	ld	a,(de)
	ld	c,a
	inc	c
	ld	a,c
	ld	(de),a
;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
	ld	l,c
	ld	h,#0x00
	ld	a,-11 (ix)
	add	a, l
	ld	l,a
	ld	a,-10 (ix)
	adc	a, h
	ld	h,a
	ld	b,(hl)
	pop	hl
	push	hl
	ld	(hl),b
;src/main.c:385: enemy->iter++;
	inc	c
	ld	a,c
	ld	(de),a
;src/main.c:386: enemy->mover = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jr	00112$
00102$:
;src/main.c:389: enemy->lastIter = enemy->iter - 1;
	ld	c,-9 (ix)
	dec	c
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),c
;src/main.c:392: enemy->reversePatrol = 1;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x01
	jr	00112$
00108$:
;src/main.c:395: if(enemy->lastIter > 1){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	a,#0x01
	sub	a, l
	jr	NC,00105$
;src/main.c:396: enemy->y = enemy->camino[enemy->lastIter];
	ld	h,#0x00
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	add	hl,de
	ld	e,(hl)
	pop	hl
	push	hl
	ld	(hl),e
;src/main.c:397: enemy->lastIter--;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	dec	e
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
;src/main.c:398: enemy->x = enemy->camino[enemy->lastIter];
	ld	l,e
	ld	h,#0x00
	ld	a,-11 (ix)
	add	a, l
	ld	l,a
	ld	a,-10 (ix)
	adc	a, h
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
;src/main.c:399: enemy->lastIter--;
	dec	e
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),e
;src/main.c:400: enemy->mover = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jr	00112$
00105$:
;src/main.c:403: enemy->iter = 0;
	xor	a, a
	ld	(de),a
;src/main.c:405: enemy->reversePatrol = 0;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	(hl),#0x00
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:414: void lookFor(TEnemy* enemy){
;	---------------------------------
; Function lookFor
; ---------------------------------
_lookFor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/main.c:421: u8 difx = abs(enemy->x - prota.x);
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
	ld	-5 (ix),l
;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	hl, #(_prota + 0x0001) + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,-2 (ix)
	sub	a, l
	ld	l,a
	ld	a,-1 (ix)
	sbc	a, h
	ld	h,a
	push	bc
	push	de
	push	hl
	call	_abs
	pop	af
	pop	de
	pop	bc
;src/main.c:423: dist = difx + dify; // manhattan
	ld	a,-5 (ix)
	add	a, l
	ld	-6 (ix),a
;src/main.c:425: enemy->seen = NO;
	ld	hl,#0x0012
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:426: enemy->inRange = NO;
	ld	hl,#0x0011
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:428: if (dist <= 10) {// te detectan los sensores de proximidad
	ld	a,#0x0A
	sub	a, -6 (ix)
	ld	a,#0x00
	rla
	bit	0,a
	jr	NZ,00116$
;src/main.c:429: enemy->seen = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
;src/main.c:430: enemy->inRange = 1;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
	jr	00118$
00116$:
;src/main.c:431: } else if(dist > 10){
	bit	0,a
	jr	Z,00118$
;src/main.c:432: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
	ld	a,(de)
	ld	e,a
	ld	hl, #(_prota + 0x0001) + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xFC
	ld	-4 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-3 (ix),a
	ld	d,#0x00
	ld	a,-4 (ix)
	sub	a, e
	ld	a,-3 (ix)
	sbc	a, d
	jp	PO, 00146$
	xor	a, #0x80
00146$:
	jp	P,00118$
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	P,00118$
;src/main.c:433: if(enemy->x > prota.x){
	ld	a,(bc)
	ld	c,a
	ld	a,(#_prota + 0)
	sub	a, c
	ld	a,#0x00
	rla
	or	a, a
	jr	Z,00108$
;src/main.c:441: enemy->seen = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jr	00118$
00108$:
;src/main.c:443: }else if(enemy->x > prota.x){
	or	a, a
	jr	Z,00118$
;src/main.c:451: enemy->seen = SI;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
00118$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:458: void moverEnemigoSeek(TEnemy* enemy){
;	---------------------------------
; Function moverEnemigoSeek
; ---------------------------------
_moverEnemigoSeek::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/main.c:459: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00108$
;src/main.c:461: if (!enemy->reversePatrol) {
	ld	hl,#0x000D
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jp	NZ,00108$
;src/main.c:462: if(enemy->iter < enemy->longitud_camino - 8){
	ld	iy,#0x000F
	add	iy, bc
	ld	a, 0 (iy)
	ld	-1 (ix),a
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0145
	add	hl, bc
	pop	bc
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xF8
	ld	-3 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-2 (ix),a
	ld	l,-1 (ix)
	ld	h,#0x00
;src/main.c:465: enemy->y = enemy->camino[enemy->iter];
	ld	a,c
	add	a, #0x01
	ld	-5 (ix),a
	ld	a,b
	adc	a, #0x00
	ld	-4 (ix),a
;src/main.c:462: if(enemy->iter < enemy->longitud_camino - 8){
	ld	a,l
	sub	a, -3 (ix)
	ld	a,h
	sbc	a, -2 (ix)
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P,00102$
;src/main.c:463: enemy->x = enemy->camino[enemy->iter];
	ld	hl,#0x0019
	add	hl,bc
	ex	de,hl
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	ld	(bc),a
;src/main.c:464: enemy->iter++;
	ld	a, 0 (iy)
	inc	a
	ld	-3 (ix), a
	ld	0 (iy), a
;src/main.c:465: enemy->y = enemy->camino[enemy->iter];
	ld	l,-3 (ix)
	ld	h,#0x00
	add	hl,de
	ld	e,(hl)
	pop	hl
	push	hl
	ld	(hl),e
;src/main.c:466: enemy->iter++;
	ld	e,-3 (ix)
	inc	e
	ld	0 (iy), e
;src/main.c:467: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	jr	00108$
00102$:
;src/main.c:470: enemy->reversePatrol = NO;
	xor	a, a
	ld	(de),a
;src/main.c:471: enemy->patrolling = 1;
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:472: enemy->onPathPatrol = 1;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:473: enemy->seek = 0;
	ld	hl,#0x0014
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:474: enemy->lastIter = enemy->iter - 1;
	ld	hl,#0x0010
	add	hl,bc
	ex	de,hl
	ld	a, 0 (iy)
	add	a,#0xFF
	ld	(de),a
;src/main.c:475: enemy->iter = 0;
	ld	0 (iy), #0x00
;src/main.c:476: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
	ld	l, c
	ld	h, b
	ld	de, #0x0018
	add	hl, de
	ld	d,(hl)
	push	bc
	pop	iy
	ld	a,23 (iy)
	ld	-3 (ix),a
	pop	hl
	push	hl
	ld	e,(hl)
	ld	a,(bc)
	ld	-5 (ix),a
	ld	hl,(_mapa)
	push	hl
	push	bc
	push	de
	inc	sp
	ld	d, -3 (ix)
	push	de
	ld	a,-5 (ix)
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
;src/main.c:483: void patrol(TEnemy *enemy) {
;	---------------------------------
; Function patrol
; ---------------------------------
_patrol::
;src/main.c:484: if (enemy->onPathPatrol) {
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	pop	iy
	ld	a,12 (iy)
	or	a, a
	ret	Z
;src/main.c:485: moverEnemigoPatrol(enemy);
	push	bc
	call	_moverEnemigoPatrol
	pop	af
	ret
;src/main.c:489: void seek(TEnemy* actual){
;	---------------------------------
; Function seek
; ---------------------------------
_seek::
;src/main.c:490: moverEnemigoSeek(actual);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_moverEnemigoSeek
	pop	af
	ret
;src/main.c:493: void engage(TEnemy *enemy, u8 dx, u8 dy) {
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
;src/main.c:494: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
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
;src/main.c:495: u8 dify = abs(enemy->y - prota.y);
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
;src/main.c:496: u8 dist = difx + dify; // manhattan
	add	hl, bc
	ld	-10 (ix),l
;src/main.c:498: u8 movX = 0;
	ld	-11 (ix),#0x00
;src/main.c:499: u8 movY = 0;
	ld	-12 (ix),#0x00
;src/main.c:500: u8 mov = 0;
	ld	-13 (ix),#0x00
;src/main.c:502: if (enemy->y == dy) { // alineado en el eje x
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
;src/main.c:504: if (dist > 10) {
	ld	a,#0x0A
	sub	a, -10 (ix)
	ld	a,#0x00
	rla
	ld	-4 (ix),a
;src/main.c:502: if (enemy->y == dy) { // alineado en el eje x
	ld	a,7 (ix)
	sub	a, -5 (ix)
	jp	NZ,00187$
;src/main.c:504: if (dist > 10) {
	ld	a,-4 (ix)
	or	a, a
	jp	Z,00189$
;src/main.c:505: if (dx < enemy->x) { // izquierda
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	b,(hl)
	ld	a,6 (ix)
	sub	a, b
	jr	NC,00110$
;src/main.c:506: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
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
;src/main.c:507: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:508: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:509: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:511: mov = 1;
	jp	00189$
00110$:
;src/main.c:514: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:517: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:519: mov = 1;
	jp	00189$
00187$:
;src/main.c:524: else if (enemy->x == dx) {
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	sub	a, 6 (ix)
	jp	NZ,00184$
;src/main.c:526: if (dist > 10) {
	ld	a,-4 (ix)
	or	a, a
	jp	Z,00189$
;src/main.c:527: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -5 (ix)
	jr	NC,00123$
;src/main.c:528: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
;src/main.c:531: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:533: mov = 1;
	jp	00189$
00123$:
;src/main.c:536: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:537: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:538: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
;src/main.c:539: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:541: mov = 1;
	jp	00189$
00184$:
;src/main.c:547: if (dist > 20) {
	ld	a,#0x14
	sub	a, -10 (ix)
	jp	NC,00189$
;src/main.c:548: if (dx < enemy->x) {
	ld	a,6 (ix)
	sub	a, -3 (ix)
	jp	NC,00136$
;src/main.c:549: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
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
;src/main.c:550: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:551: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:552: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:553: movX = 1;
	ld	-11 (ix),#0x01
;src/main.c:554: mov = 1;
	ld	-13 (ix),#0x01
	jp	00137$
00136$:
;src/main.c:557: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:558: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:559: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:560: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:561: movX = 1;
	ld	-11 (ix),#0x01
;src/main.c:562: mov = 1;
	ld	-13 (ix),#0x01
00137$:
;src/main.c:565: if (dy < enemy->y) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
;src/main.c:494: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-4 (ix),a
;src/main.c:565: if (dy < enemy->y) {
	ld	a,7 (ix)
	sub	a, -3 (ix)
	jp	NC,00147$
;src/main.c:566: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:567: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
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
;src/main.c:569: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
;src/main.c:570: movY = 1;
	ld	-12 (ix),#0x01
;src/main.c:571: mov = 1;
	ld	-13 (ix),#0x01
	jp	00148$
00147$:
;src/main.c:574: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:575: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:576: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
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
;src/main.c:577: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:578: movY = 1;
	ld	-12 (ix),#0x01
;src/main.c:579: mov = 1;
	ld	-13 (ix),#0x01
00148$:
;src/main.c:582: if (!mov) {
	ld	a,-13 (ix)
	or	a, a
	jp	NZ,00189$
;src/main.c:583: if (!movX) {
	ld	a,-11 (ix)
	or	a, a
	jp	NZ,00163$
;src/main.c:584: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e,(hl)
;src/main.c:494: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
;src/main.c:584: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
	ld	a,#0x70
	sub	a, e
	jr	NC,00160$
;src/main.c:585: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:586: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:587: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
;src/main.c:588: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
	jp	00163$
00150$:
;src/main.c:590: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
	jr	00163$
00160$:
;src/main.c:592: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
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
;src/main.c:593: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:594: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
;src/main.c:595: moverEnemigoArriba(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoArriba
	pop	af
	jr	00163$
00155$:
;src/main.c:597: moverEnemigoAbajo(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoAbajo
	pop	af
00163$:
;src/main.c:601: if (!movY) {
	ld	a,-12 (ix)
	or	a, a
	jp	NZ,00189$
;src/main.c:602: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
;src/main.c:495: u8 dify = abs(enemy->y - prota.y);
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e,(hl)
;src/main.c:602: if (enemy->x < ANCHO_PANTALLA/2) {
	ld	a,c
	sub	a, #0x28
	jp	NC,00175$
;src/main.c:603: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
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
;src/main.c:604: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:605: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:606: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
	jp	00189$
00165$:
;src/main.c:608: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
	jr	00189$
00175$:
;src/main.c:611: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:612: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:613: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
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
;src/main.c:614: moverEnemigoDerecha(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoDerecha
	pop	af
	jr	00189$
00170$:
;src/main.c:617: moverEnemigoIzquierda(enemy);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverEnemigoIzquierda
	pop	af
00189$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:626: void updateEnemies() { // maquina de estados
;	---------------------------------
; Function updateEnemies
; ---------------------------------
_updateEnemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:627: u8 i = 1 + 1;
	ld	-4 (ix),#0x02
;src/main.c:631: actual = enemy;
;src/main.c:633: while (--i) {
	ld	-2 (ix),#<(_enemy)
	ld	-1 (ix),#>(_enemy)
00123$:
	dec	-4 (ix)
	ld	c, -4 (ix)
	ld	a,c
	or	a, a
	jp	Z,00126$
;src/main.c:634: if (actual->engage) { // prioridad a la persecucion, nunca te deja
	ld	a, (#(_enemy + 0x0016) + 0)
	or	a, a
	jr	Z,00121$
;src/main.c:635: engage(actual, prota.x, prota.y);
	ld	a,(#(_prota + 0x0001) + 0)
	ld	-3 (ix),a
	ld	hl, #_prota + 0
	ld	b,(hl)
	ld	a,-3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#_enemy
	push	hl
	call	_engage
	pop	af
	pop	af
	jr	00123$
00121$:
;src/main.c:637: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
	ld	hl,#_enemy
	push	hl
	call	_lookFor
	pop	af
;src/main.c:638: if (actual->patrolling) { // esta patrullando
	ld	a, (#(_enemy + 0x000b) + 0)
	or	a, a
	jp	Z,00118$
;src/main.c:639: if (!actual->seen && !actual->inRange) {
	ld	hl, #(_enemy + 0x0012) + 0
	ld	c,(hl)
	ld	a,c
	or	a, a
	jr	NZ,00107$
	ld	a, (#(_enemy + 0x0011) + 0)
	or	a, a
	jr	NZ,00107$
;src/main.c:640: patrol(actual);
	ld	hl,#_enemy
	push	hl
	call	_patrol
	pop	af
	jr	00123$
00107$:
;src/main.c:641: }else if (actual->inRange) {
;src/main.c:644: actual->onPathPatrol = 0;
;src/main.c:641: }else if (actual->inRange) {
	ld	a,(#(_enemy + 0x0011) + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:642: engage(actual, prota.x, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_prota + 0
	ld	c, (hl)
	push	bc
	ld	hl,#_enemy
	push	hl
	call	_engage
	pop	af
	pop	af
;src/main.c:643: actual->patrolling = 0;
	ld	hl,#(_enemy + 0x000b)
	ld	(hl),#0x00
;src/main.c:644: actual->onPathPatrol = 0;
	ld	hl,#(_enemy + 0x000c)
	ld	(hl),#0x00
;src/main.c:645: actual->engage = 1;
	ld	hl,#(_enemy + 0x0016)
	ld	(hl),#0x01
	jp	00123$
00104$:
;src/main.c:646: } else if (actual->seen) {
	ld	a,c
	or	a, a
	jp	Z,00123$
;src/main.c:648: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_prota + 0
	ld	c,(hl)
	ld	hl, #(_enemy + 0x0001) + 0
	ld	e,(hl)
	ld	hl, #_enemy + 0
	ld	d,(hl)
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_enemy
	push	hl
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
;src/main.c:649: actual->p_seek_x = actual->x;
	ld	a, (#_enemy + 0)
	ld	(#(_enemy + 0x0017)),a
;src/main.c:650: actual->p_seek_y = actual->y;
	ld	a, (#(_enemy + 0x0001) + 0)
	ld	(#(_enemy + 0x0018)),a
;src/main.c:651: actual->seek = 1;
	ld	hl,#(_enemy + 0x0014)
	ld	(hl),#0x01
;src/main.c:652: actual->iter=0;
	ld	hl,#(_enemy + 0x000f)
	ld	(hl),#0x00
;src/main.c:653: actual->reversePatrol = NO;
	ld	hl,#(_enemy + 0x000d)
	ld	(hl),#0x00
;src/main.c:654: actual->patrolling = 0;
	ld	hl,#(_enemy + 0x000b)
	ld	(hl),#0x00
;src/main.c:655: actual->onPathPatrol = 0;
	ld	hl,#(_enemy + 0x000c)
	ld	(hl),#0x00
;src/main.c:656: actual->seen = 0;
	ld	hl,#(_enemy + 0x0012)
	ld	(hl),#0x00
	jp	00123$
00118$:
;src/main.c:658: } else if (actual->seek) { // esta buscando
	ld	a, (#(_enemy + 0x0014) + 0)
	or	a, a
	jp	Z,00123$
;src/main.c:659: if (!actual->found /*&& actual->seekTimer <= 5*/) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0013
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	NZ,00113$
;src/main.c:660: seek(actual); // buscar en posiciones cercanas a la actual
	ld	hl,#_enemy
	push	hl
	call	_seek
	pop	af
	jp	00123$
00113$:
;src/main.c:661: } else if (actual->inRange) {
	ld	a, (#(_enemy + 0x0011) + 0)
	or	a, a
	jp	Z,00123$
;src/main.c:662: engage(actual, prota.x, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	ld	hl, #_prota + 0
	ld	c, (hl)
	push	bc
	ld	hl,#_enemy
	push	hl
	call	_engage
	pop	af
	pop	af
;src/main.c:663: actual->engage = 1;
	ld	hl,#(_enemy + 0x0016)
	ld	(hl),#0x01
	jp	00123$
00126$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:670: void inicializarEnemy() {
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
;src/main.c:681: actual = enemy;
	ld	bc,#_enemy+0
;src/main.c:682: while(--i){
	ld	-7 (ix),#0x02
00101$:
	dec	-7 (ix)
	ld	a,-7 (ix)
	or	a, a
	jp	Z,00104$
;src/main.c:683: actual->x = actual->px = spawnX[i];
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,#<(_spawnX)
	add	a, -7 (ix)
	ld	-2 (ix),a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	-3 (ix), a
	ld	(de),a
	ld	a,-3 (ix)
	ld	(bc),a
;src/main.c:684: actual->y = actual->py = spawnY[i];
	ld	e, c
	ld	d, b
	inc	de
	ld	hl,#0x0003
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	iy,#_spawnY
	push	bc
	ld	c,-7 (ix)
	ld	b,#0x00
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	-6 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,-6 (ix)
	ld	(hl),a
	ld	a,-6 (ix)
	ld	(de),a
;src/main.c:685: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:686: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/main.c:687: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:688: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:689: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:690: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:691: actual->onPathPatrol = SI;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:692: actual->reversePatrol = NO;
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:693: actual->iter = 0;
	ld	hl,#0x000F
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:694: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:695: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:696: actual->found = 0;
	ld	hl,#0x0013
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:697: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
	ld	e, 0 (iy)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	add	a,#0xEC
	ld	d,a
	push	bc
	ld	hl,(_mapa)
	push	hl
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	h,-6 (ix)
	ld	l,-3 (ix)
	push	hl
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:720: dibujarEnemigo(actual);
	push	bc
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	bc
;src/main.c:722: ++actual;
	ld	hl,#0x0146
	add	hl,bc
	ld	c,l
	ld	b,h
	jp	00101$
00104$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:725: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:726: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:727: mapa = mapas[++num_mapa];
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
;src/main.c:728: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:729: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:730: dibujarMapa();
	call	_dibujarMapa
;src/main.c:731: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:734: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	jp  _menuFin
;src/main.c:738: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:739: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:740: if (!checkCollision(M_izquierda)) {
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
;src/main.c:741: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:742: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:743: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:747: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:748: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:749: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:750: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:751: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:752: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:754: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:755: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:759: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:760: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:761: if (!checkCollision(M_arriba)) { 
	ld	a,#0x02
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:762: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:763: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:764: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:765: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:769: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:770: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:771: if (!checkCollision(M_abajo) ) { 
	ld	a,#0x03
	push	af
	inc	sp
	call	_checkCollision
	inc	sp
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:772: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:773: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:774: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:775: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:782: void intHandler() {
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
;src/main.c:783: if (++i == 6) {
	ld	hl, #_i+0
	inc	(hl)
	ld	a,(#_i + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:784: play();
	call	_play
;src/main.c:785: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:789: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:790: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:791: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:792: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:793: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:794: cpct_akp_musicInit(g_song);
	ld	hl,#_g_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:795: cpct_setInterruptHandler(intHandler);
	ld	hl,#_intHandler
	call	_cpct_setInterruptHandler
	ret
;src/main.c:798: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:800: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:801: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:802: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:804: dibujarMapa();
	call	_dibujarMapa
;src/main.c:807: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:810: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:811: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
;src/main.c:812: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:813: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:814: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:818: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:819: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:820: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:821: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:823: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:825: dibujarProta();
	jp  _dibujarProta
;src/main.c:828: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:833: inicializarCPC();
	call	_inicializarCPC
;src/main.c:835: menuInicio();
	call	_menuInicio
;src/main.c:837: inicializarJuego();
	call	_inicializarJuego
;src/main.c:841: while (1) {
00122$:
;src/main.c:844: actual = enemy;
;src/main.c:846: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
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
;src/main.c:847: moverCuchillo(&cu, mapa);
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_cu
	push	hl
	call	_moverCuchillo
	pop	af
	pop	af
;src/main.c:848: updateEnemies();
	call	_updateEnemies
;src/main.c:850: while(--i){
	ld	hl,#_enemy
	ld	c,#0x02
00101$:
	dec	c
	ld	a,c
	or	a, a
	jr	Z,00103$
;src/main.c:851: moverEnemigo(actual);
	push	hl
	push	bc
	push	hl
	call	_moverEnemigo
	pop	af
	pop	bc
	pop	hl
;src/main.c:852: ++actual;
	ld	de,#0x0146
	add	hl,de
	jr	00101$
00103$:
;src/main.c:855: actual = enemy;
	ld	bc,#_enemy
;src/main.c:857: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	pop	bc
;src/main.c:860: if (prota.mover) {
	ld	a, (#(_prota + 0x0006) + 0)
	or	a, a
	jr	Z,00105$
;src/main.c:861: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:862: prota.mover = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
00105$:
;src/main.c:864: if(cu.lanzado && cu.mover){
	ld	hl, #(_cu + 0x0006) + 0
	ld	e,(hl)
	ld	a,e
	or	a, a
	jr	Z,00110$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	Z,00110$
;src/main.c:865: redibujarCuchillo(&cu, g_tablatrans, mapa);
	push	bc
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#_cu
	push	hl
	call	_redibujarCuchillo
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
	jr	00137$
00110$:
;src/main.c:866: }else if (cu.lanzado && !cu.mover){
	ld	a,e
	or	a, a
	jr	Z,00137$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	NZ,00137$
;src/main.c:867: borrarCuchillo(&cu, mapa);
	push	bc
	ld	hl,(_mapa)
	push	hl
	ld	hl,#_cu
	push	hl
	call	_borrarCuchillo
	pop	af
	pop	af
	pop	bc
;src/main.c:870: while(--i){
00137$:
	ld	-1 (ix),#0x02
00118$:
	dec	-1 (ix)
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00120$
;src/main.c:871: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00114$
;src/main.c:872: redibujarEnemigo(actual);
	push	bc
	push	bc
	call	_redibujarEnemigo
	pop	af
	pop	bc
00114$:
;src/main.c:874: if (actual->muerto && actual->muertes == 0){
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	Z,00116$
	ld	hl,#0x000A
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jr	NZ,00116$
;src/main.c:875: borrarEnemigo(actual);
	push	bc
	push	de
	push	bc
	call	_borrarEnemigo
	pop	af
	pop	de
	pop	bc
;src/main.c:876: dibujarExplosion(actual);
	push	bc
	push	de
	push	bc
	call	_dibujarExplosion
	pop	af
	pop	de
	pop	bc
;src/main.c:877: puntuacion_aux = puntuacion;
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
;src/main.c:878: puntuacion = aumentarPuntuacion(puntuacion_aux);
	push	bc
	push	de
	push	hl
	call	_aumentarPuntuacion
	pop	af
	pop	de
	pop	bc
	ld	iy,#_puntuacion
	ld	0 (iy),l
;src/main.c:879: modificarPuntuacion(puntuacion);
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
;src/main.c:881: actual->muertes++;
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:882: actual->x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:883: actual->y = 0;
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de),a
00116$:
;src/main.c:885: ++actual;
	ld	hl,#0x0146
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00118$
00120$:
;src/main.c:887: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00122$
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
