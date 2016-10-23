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
	.globl _moverCuchillo
	.globl _checkKnifeCollision
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
	.globl _inicializarEnemy
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
	.globl _getTilePtr
	.globl _redibujarProta
	.globl _borrarProta
	.globl _dibujarProta
	.globl _dibujarMapa
	.globl _play
	.globl _aumentarPuntuacion
	.globl _modificarPuntuacion
	.globl _barraPuntuacionInicial
	.globl _menuInicio
	.globl _menuFin
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_akp_musicPlay
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
	.globl _EEje
	.globl _EMirar
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
_EMirar::
	.ds 1
_EEje::
	.ds 1
_enemy::
	.ds 52
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
;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
;src/main.c:116: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:142: u8* getTilePtr(u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:143: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
	ld	c,5 (ix)
	ld	b,#0x00
	ld	a,c
	add	a,#0xE8
	ld	e,a
	ld	a,b
	adc	a,#0xFF
	ld	d,a
	ld	l, e
	ld	h, d
	bit	7, d
	jr	Z,00103$
	ld	hl,#0xFFEB
	add	hl,bc
00103$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
	ld	hl,(_mapa)
	add	hl,bc
	ld	c,4 (ix)
	srl	c
	ld	e,c
	ld	d,#0x00
	add	hl,de
	pop	ix
	ret
;src/main.c:146: u8 checkCollision(int direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:147: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:149: switch (direction) {
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
;src/main.c:150: case 0:
00101$:
;src/main.c:151: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	e,(hl)
	ld	hl, #_prota + 0
	ld	c,(hl)
	inc	c
	inc	c
	inc	c
	inc	c
	ld	a,e
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:152: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
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
	call	_getTilePtr
	pop	af
	ex	de,hl
;src/main.c:153: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
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
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
	pop	de
;src/main.c:154: break;
	jp	00105$
;src/main.c:155: case 1:
00102$:
;src/main.c:156: headTile  = getTilePtr(prota.x - 1, prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	d,(hl)
	ld	hl, #_prota + 0
	ld	b,(hl)
	dec	b
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	inc	sp
	inc	sp
	push	hl
;src/main.c:157: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
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
	call	_getTilePtr
	pop	af
	ex	de,hl
;src/main.c:158: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
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
	call	_getTilePtr
	pop	af
	ld	c,l
	ld	b,h
	pop	de
;src/main.c:159: break;
	jr	00105$
;src/main.c:160: case 2:
00103$:
;src/main.c:161: headTile   = getTilePtr(prota.x, prota.y - 2);
	ld	a, (#(_prota + 0x0001) + 0)
	add	a,#0xFE
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	inc	sp
	inc	sp
	push	hl
;src/main.c:162: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
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
	call	_getTilePtr
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:163: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:164: break;
	jr	00105$
;src/main.c:165: case 3:
00104$:
;src/main.c:166: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
	ld	a, (#(_prota + 0x0001) + 0)
	add	a, #0x16
	ld	hl, #_prota + 0
	ld	d,(hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	inc	sp
	inc	sp
	push	hl
;src/main.c:167: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
	call	_getTilePtr
	pop	af
	ex	de,hl
	pop	bc
;src/main.c:168: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:170: }
00105$:
;src/main.c:172: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
;src/main.c:173: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:175: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:178: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:179: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:180: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:183: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:184: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:185: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
;src/main.c:188: void borrarExplosion() {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:189: u8 w = 4 + (enemy->px & 1);
	ld	hl, #_enemy + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:192: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:194: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:198: void borrarEnemigo(TEnemy *enemy) {
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
;src/main.c:200: u8 w = 4 + (enemy->px & 1);
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
;src/main.c:203: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:205: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:207: enemy->mover = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:210: void redibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:211: borrarEnemigo(enemy);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:212: enemy->px = enemy->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:213: enemy->py = enemy->y;
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
;src/main.c:214: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:217: u8 checkEnemyCollision(int direction, TEnemy *enemy){
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
;src/main.c:219: u8 colisiona = 1;
	ld	-9 (ix),#0x01
;src/main.c:221: switch (direction) {
	bit	7, 5 (ix)
	jp	NZ,00165$
	ld	a,#0x03
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jp	PO, 00272$
	xor	a, #0x80
00272$:
	jp	M,00165$
;src/main.c:223: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a,(bc)
	ld	e,a
	ld	hl,#0x0001
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
;src/main.c:236: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:243: enemy->mira = M_izquierda;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:221: switch (direction) {
	push	de
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00273$
	add	hl,de
	add	hl,de
	add	hl,de
	pop	de
	jp	(hl)
00273$:
	jp	00101$
	jp	00117$
	jp	00133$
	jp	00149$
;src/main.c:222: case 0:
00101$:
;src/main.c:223: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
	ld	a,e
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
	jp	C,00113$
;src/main.c:224: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00113$
;src/main.c:225: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00113$
;src/main.c:227: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
	jp	PO, 00274$
	xor	a, #0x80
00274$:
	jp	M,00108$
	push	de
	ld	de,#0x0016
	add	hl, de
	pop	de
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00275$
	xor	a, #0x80
00275$:
	jp	P,00109$
00108$:
;src/main.c:228: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00109$:
;src/main.c:231: if(cu.x > enemy->x){ //si el cu esta abajo
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, e
	jr	NC,00106$
;src/main.c:232: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
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
	jp	PO, 00276$
	xor	a, #0x80
00276$:
	jp	P,00103$
;src/main.c:233: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00103$:
;src/main.c:236: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00106$:
;src/main.c:239: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00113$:
;src/main.c:243: enemy->mira = M_izquierda;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:245: break;
	jp	00165$
;src/main.c:246: case 1:
00117$:
;src/main.c:247: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
	dec	e
	push	bc
	push	de
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00129$
;src/main.c:248: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00129$
;src/main.c:249: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00129$
;src/main.c:251: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
	jp	PO, 00277$
	xor	a, #0x80
00277$:
	jp	M,00124$
	push	de
	ld	de,#0x0016
	add	hl, de
	pop	de
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00278$
	xor	a, #0x80
00278$:
	jp	P,00125$
00124$:
;src/main.c:252: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00125$:
;src/main.c:255: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	a,(bc)
	ld	e,a
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	a,c
	sub	a, e
	jr	NC,00122$
;src/main.c:256: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
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
	jp	PO, 00279$
	xor	a, #0x80
00279$:
	jp	P,00119$
;src/main.c:257: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00119$:
;src/main.c:260: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00122$:
;src/main.c:263: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00129$:
;src/main.c:267: enemy->mira = M_derecha;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:269: break;
	jp	00165$
;src/main.c:270: case 2:
00133$:
;src/main.c:271: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
	dec	d
	dec	d
	push	bc
	push	de
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00145$
;src/main.c:272: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00145$
;src/main.c:273: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00145$
;src/main.c:275: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
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
	jp	PO, 00280$
	xor	a, #0x80
00280$:
	jp	M,00140$
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00281$
	xor	a, #0x80
00281$:
	jp	P,00141$
00140$:
;src/main.c:277: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00141$:
;src/main.c:280: if(enemy->y>cu.y){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00138$
;src/main.c:281: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
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
	jp	PO, 00282$
	xor	a, #0x80
00282$:
	jp	P,00135$
;src/main.c:282: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00135$:
;src/main.c:285: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00149$
00138$:
;src/main.c:289: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00145$:
;src/main.c:295: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:298: case 3:
00149$:
;src/main.c:301: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00161$
;src/main.c:302: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jp	C,00161$
;src/main.c:303: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jr	C,00161$
;src/main.c:305: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
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
	jp	PO, 00283$
	xor	a, #0x80
00283$:
	jp	M,00156$
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00284$
	xor	a, #0x80
00284$:
	jp	P,00157$
00156$:
;src/main.c:306: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00157$:
;src/main.c:309: if(cu.y > enemy->y){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00154$
;src/main.c:310: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
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
	jp	PO, 00285$
	xor	a, #0x80
00285$:
	jp	P,00151$
;src/main.c:311: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00151$:
;src/main.c:314: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00165$
00154$:
;src/main.c:318: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00161$:
;src/main.c:322: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:325: }
00165$:
;src/main.c:326: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:329: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:330: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:331: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:332: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:335: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:336: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:337: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:338: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:341: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:342: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:343: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:344: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:347: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:348: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:349: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:350: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:353: void moverEnemigo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigo
; ---------------------------------
_moverEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:354: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	NZ,00110$
;src/main.c:355: if(!checkEnemyCollision(enemy->mira, enemy)){
	ld	hl,#0x0007
	add	hl,bc
	ld	e,(hl)
	ld	d,#0x00
	push	hl
	push	bc
	push	bc
	push	de
	call	_checkEnemyCollision
	pop	af
	pop	af
	ld	a,l
	pop	bc
	pop	hl
	or	a, a
	jr	NZ,00110$
;src/main.c:357: switch (enemy->mira) {
	ld	e,(hl)
	ld	a,#0x03
	sub	a, e
	jr	C,00110$
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:359: case 0:
	jp	(hl)
00124$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:360: moverEnemigoDerecha(enemy);
	push	bc
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:361: break;
	jr	00110$
;src/main.c:362: case 1:
00102$:
;src/main.c:363: moverEnemigoIzquierda(enemy);
	push	bc
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:364: break;
	jr	00110$
;src/main.c:365: case 2:
00103$:
;src/main.c:366: moverEnemigoArriba(enemy);
	push	bc
	call	_moverEnemigoArriba
	pop	af
;src/main.c:367: break;
	jr	00110$
;src/main.c:368: case 3:
00104$:
;src/main.c:369: moverEnemigoAbajo(enemy);
	push	bc
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:371: }
00110$:
	pop	ix
	ret
;src/main.c:376: void inicializarEnemy() {
;	---------------------------------
; Function inicializarEnemy
; ---------------------------------
_inicializarEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:377: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
	ld	a,(#_num_mapa + 0)
	add	a, #0x03
	ld	-1 (ix),a
;src/main.c:382: actual = enemy;
	ld	de,#_enemy+0
;src/main.c:383: while(--i){
00101$:
	dec	-1 (ix)
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00104$
;src/main.c:384: actual->x = actual->px = spawnX[i];
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a,#<(_spawnX)
	add	a, -1 (ix)
	ld	l,a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
	ld	(de),a
;src/main.c:385: actual->y = actual->py = spawnY[i];
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
	ld	l,a
	ld	a,#>(_spawnY)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
	ld	0 (iy), a
;src/main.c:386: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;src/main.c:387: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x03
;src/main.c:388: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:389: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x00
;src/main.c:390: actual->muertes = 0;
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x00
;src/main.c:391: actual->patroling = SI;
	ld	hl,#0x0009
	add	hl,de
	ld	(hl),#0x01
;src/main.c:393: dibujarEnemigo(actual);
	push	de
	push	de
	call	_dibujarEnemigo
	pop	af
	pop	de
;src/main.c:395: ++actual;
	ld	hl,#0x000D
	add	hl,de
	ex	de,hl
	jr	00101$
00104$:
	inc	sp
	pop	ix
	ret
;src/main.c:399: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:400: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jr	NC,00102$
;src/main.c:401: mapa = mapas[++num_mapa];
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
;src/main.c:402: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:403: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:404: dibujarMapa();
	call	_dibujarMapa
;src/main.c:405: inicializarEnemy();
	jp  _inicializarEnemy
00102$:
;src/main.c:408: menuFin(puntuacion);
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
	jp  _menuFin
;src/main.c:412: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:413: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:414: if (!checkCollision(M_izquierda)) {
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:415: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:416: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:417: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:421: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:422: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:423: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:424: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:425: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:426: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:428: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:429: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:433: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:434: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:435: if (!checkCollision(M_arriba)) { 
	ld	hl,#0x0002
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:436: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:437: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:438: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:439: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:443: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:444: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:445: if (!checkCollision(M_abajo) ) { 
	ld	hl,#0x0003
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:446: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:447: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:448: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:449: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:453: void dibujarCuchillo() {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:454: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
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
	ld	b,l
	ld	e,h
;src/main.c:455: if(cu.eje == E_X){
	ld	hl, #_cu + 8
	ld	c,(hl)
;src/main.c:456: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	-2 (ix),b
	ld	-1 (ix),e
;src/main.c:455: if(cu.eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/main.c:456: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	ld	bc, (#(_cu + 0x0004) + 0)
	push	de
	ld	hl,#0x0404
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00106$
00104$:
;src/main.c:459: else if(cu.eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/main.c:460: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	ld	bc, (#(_cu + 0x0004) + 0)
	push	de
	ld	hl,#0x0802
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
;src/main.c:464: void borrarCuchillo() {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:466: u8 w = 2 + (cu.px & 1);
	ld	hl, #_cu + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:467: u8 h = 2 + (cu.py & 3 ? 1 : 0);
	ld	hl, #_cu + 3
	ld	e,(hl)
	ld	a,e
	and	a, #0x03
	jr	Z,00105$
	ld	a,#0x01
	jr	00106$
00105$:
	ld	a,#0x00
00106$:
	add	a, #0x02
	ld	-3 (ix),a
;src/main.c:468: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
	jr	Z,00107$
	ld	hl,#0xFFEB
	add	hl,de
00107$:
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
;src/main.c:469: if(!cu.mover){
	ld	a, (#_cu + 9)
	or	a, a
	jr	NZ,00103$
;src/main.c:470: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:474: void redibujarCuchillo( ) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
;src/main.c:475: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:476: cu.px = cu.x;
	ld	bc,#_cu + 2
	ld	a, (#_cu + 0)
	ld	(bc),a
;src/main.c:477: cu.py = cu.y;
	ld	bc,#_cu + 3
	ld	a, (#_cu + 1)
	ld	(bc),a
;src/main.c:478: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:481: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
;src/main.c:483: if(!cu.lanzado){
	ld	a, (#(_cu + 0x0006) + 0)
	or	a, a
	ret	NZ
;src/main.c:485: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	e,(hl)
;src/main.c:486: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
	ld	bc,#_prota + 1
;src/main.c:488: cu.direccion = M_derecha;
;src/main.c:490: cu.y=prota.y + G_HERO_H /2;
;src/main.c:491: cu.sprite=g_knifeX_0;
;src/main.c:492: cu.eje = E_X;
;src/main.c:485: if(prota.mira == M_derecha){
	ld	a,e
	or	a, a
	jr	NZ,00118$
;src/main.c:486: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
	ld	a,(bc)
	add	a, #0x0B
	ld	e,a
	ld	a, (#_prota + 0)
	add	a, #0x0C
	ld	l,a
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	a,l
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	ret	C
;src/main.c:487: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:488: cu.direccion = M_derecha;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x00
;src/main.c:489: cu.x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	(#_cu),a
;src/main.c:490: cu.y=prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:491: cu.sprite=g_knifeX_0;
	ld	hl,#_g_knifeX_0
	ld	((_cu + 0x0004)), hl
;src/main.c:492: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:493: dibujarCuchillo();
	jp  _dibujarCuchillo
00118$:
;src/main.c:496: else if(prota.mira == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00115$
;src/main.c:497: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
	ld	a,(bc)
	add	a, #0x0B
	ld	e,a
	ld	a, (#_prota + 0)
	add	a,#0xF6
	ld	l,a
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	a,l
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	ret	C
;src/main.c:498: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:499: cu.direccion = M_izquierda;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x01
;src/main.c:500: cu.x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFC
	ld	(#_cu),a
;src/main.c:501: cu.y = prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:502: cu.sprite = g_knifeX_1;
	ld	hl,#_g_knifeX_1
	ld	((_cu + 0x0004)), hl
;src/main.c:503: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:504: dibujarCuchillo();
	jp  _dibujarCuchillo
00115$:
;src/main.c:507: else if(prota.mira == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00112$
;src/main.c:509: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
	ld	a,(bc)
	add	a, #0x1F
	ld	e,a
	ld	a, (#_prota + 0)
	ld	d,a
	inc	d
	inc	d
	inc	d
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	ret	C
;src/main.c:510: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:511: cu.direccion = M_abajo;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x03
;src/main.c:512: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:513: cu.y = prota.y + G_HERO_H;
	ld	a,(bc)
	add	a, #0x16
	ld	(#(_cu + 0x0001)),a
;src/main.c:514: cu.sprite = g_knifeY_0;
	ld	hl,#_g_knifeY_0
	ld	((_cu + 0x0004)), hl
;src/main.c:515: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:516: dibujarCuchillo();
	jp  _dibujarCuchillo
00112$:
;src/main.c:519: else if(prota.mira == M_arriba){
	ld	a,e
	sub	a, #0x02
	ret	NZ
;src/main.c:520: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
	ld	a,(bc)
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
	ret	C
;src/main.c:521: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:522: cu.direccion = M_arriba;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x02
;src/main.c:523: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:524: cu.y = prota.y;
	ld	a,(bc)
	ld	(#(_cu + 0x0001)),a
;src/main.c:525: cu.sprite = g_knifeY_1;
	ld	hl,#_g_knifeY_1
	ld	((_cu + 0x0004)), hl
;src/main.c:526: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:527: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:533: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:534: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:536: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:537: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:538: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:539: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:540: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:541: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:542: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:543: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:544: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:545: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:546: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:550: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){ // TODO: el parámetro direction no se usa
;	---------------------------------
; Function checkKnifeCollision
; ---------------------------------
_checkKnifeCollision::
;src/main.c:552: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
	ld	a,(#_cu + 1)
	ld	hl,#5
	add	hl,sp
	add	a, (hl)
	ld	b,a
	ld	a,(#_cu + 0)
	ld	hl,#4
	add	hl,sp
	add	a, (hl)
	ld	c,a
	push	bc
	call	_getTilePtr
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	ld	a,#0x00
	rla
	xor	a, #0x01
	ld	l, a
	ret
;src/main.c:555: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
;src/main.c:556: if(cu.lanzado){
	ld	bc,#_cu+0
	ld	a, (#_cu + 6)
	or	a, a
	ret	Z
;src/main.c:557: cu.mover = SI;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x01
	ld	(de),a
;src/main.c:558: if(cu.direccion == M_derecha){
	ld	hl, #_cu + 7
	ld	l,(hl)
	ld	a,l
	or	a, a
	jr	NZ,00122$
;src/main.c:560: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
	push	bc
	push	de
	ld	hl,#0x0005
	push	hl
	ld	l, #0x00
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00102$
;src/main.c:561: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:562: cu.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
00102$:
;src/main.c:565: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
00122$:
;src/main.c:568: else if(cu.direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00119$
;src/main.c:569: if(checkKnifeCollision(M_derecha, -1, 0)){
	push	bc
	push	de
	ld	hl,#0x00FF
	push	hl
	ld	l, #0x00
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/main.c:570: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:571: cu.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
00105$:
;src/main.c:573: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
00119$:
;src/main.c:579: cu.y--;
	inc	bc
;src/main.c:576: else if(cu.direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00116$
;src/main.c:577: if(checkKnifeCollision(M_derecha, 0, -2)){
	push	bc
	push	de
	ld	hl,#0xFE00
	push	hl
	ld	h, #0x00
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00108$
;src/main.c:578: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:579: cu.y--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:580: cu.y--;
	add	a,#0xFF
	ld	(bc),a
	ret
00108$:
;src/main.c:583: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
00116$:
;src/main.c:586: else if(cu.direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	ret	NZ
;src/main.c:587: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
	push	bc
	push	de
	ld	hl,#0x0A00
	push	hl
	ld	h, #0x00
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00111$
;src/main.c:588: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:589: cu.y++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:590: cu.y++;
	inc	a
	ld	(bc),a
	ret
00111$:
;src/main.c:593: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
;src/main.c:600: void intHandler() {
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
;src/main.c:601: if (++i == 6) {
	ld	hl, #_i+0
	inc	(hl)
	ld	a,(#_i + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:602: play();
	call	_play
;src/main.c:603: i=0;
	ld	hl,#_i + 0
	ld	(hl), #0x00
	ret
;src/main.c:607: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:608: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:609: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:610: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:611: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:612: cpct_akp_musicInit(g_song);
	ld	hl,#_g_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:613: cpct_setInterruptHandler(intHandler);
	ld	hl,#_intHandler
	call	_cpct_setInterruptHandler
	ret
;src/main.c:616: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:618: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:619: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:620: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:622: dibujarMapa();
	call	_dibujarMapa
;src/main.c:625: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:628: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:629: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
;src/main.c:630: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:631: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:632: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:636: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:637: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:638: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:639: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:641: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:643: dibujarProta();
	jp  _dibujarProta
;src/main.c:646: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:651: inicializarCPC();
	call	_inicializarCPC
;src/main.c:653: menuInicio();
	call	_menuInicio
;src/main.c:655: inicializarJuego();
	call	_inicializarJuego
;src/main.c:659: while (1) {
00122$:
;src/main.c:661: i = (2 + num_mapa) + 1;
	ld	hl,#_num_mapa + 0
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
;src/main.c:662: actual = enemy;
;src/main.c:664: comprobarTeclado();
	push	bc
	call	_comprobarTeclado
	call	_moverCuchillo
	pop	bc
;src/main.c:667: while(--i){
	ld	de,#_enemy
00101$:
	dec c
	jr	Z,00103$
;src/main.c:668: moverEnemigo(actual);
	push	bc
	push	de
	push	de
	call	_moverEnemigo
	pop	af
	pop	de
	pop	bc
;src/main.c:669: ++actual;
	ld	hl,#0x000D
	add	hl,de
	ld	e,l
	ld	d,h
	jr	00101$
00103$:
;src/main.c:672: actual = enemy;
	ld	bc,#_enemy
;src/main.c:674: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	call	_cpct_akp_musicPlay
	pop	bc
;src/main.c:677: if (prota.mover) {
	ld	de,#_prota+6
	ld	a,(de)
	or	a, a
	jr	Z,00105$
;src/main.c:678: redibujarProta();
	push	bc
	push	de
	call	_redibujarProta
	pop	de
	pop	bc
;src/main.c:679: prota.mover = NO;
	xor	a, a
	ld	(de),a
00105$:
;src/main.c:681: if(cu.lanzado && cu.mover){
	ld	hl,#_cu + 6
	ld	e,(hl)
	ld	a,e
	or	a, a
	jr	Z,00110$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	Z,00110$
;src/main.c:682: redibujarCuchillo();
	push	bc
	call	_redibujarCuchillo
	pop	bc
	jr	00137$
00110$:
;src/main.c:683: }else if (cu.lanzado && !cu.mover){
	ld	a,e
	or	a, a
	jr	Z,00137$
	ld	a, (#(_cu + 0x0009) + 0)
	or	a, a
	jr	NZ,00137$
;src/main.c:684: borrarCuchillo();
	push	bc
	call	_borrarCuchillo
	pop	bc
;src/main.c:687: while(--i){
00137$:
	ld	-1 (ix),#0x05
00118$:
	dec	-1 (ix)
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00120$
;src/main.c:688: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00114$
;src/main.c:689: redibujarEnemigo(actual);
	push	bc
	push	bc
	call	_redibujarEnemigo
	pop	af
	pop	bc
00114$:
;src/main.c:691: if (actual->muerto && actual->muertes == 0){
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	Z,00116$
	ld	hl,#0x000C
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	or	a, a
	jr	NZ,00116$
;src/main.c:692: borrarEnemigo(actual);
	push	bc
	push	de
	push	bc
	call	_borrarEnemigo
	pop	af
	pop	de
	pop	bc
;src/main.c:693: dibujarExplosion(actual);
	push	bc
	push	de
	push	bc
	call	_dibujarExplosion
	pop	af
	pop	de
	pop	bc
;src/main.c:694: puntuacion_aux = puntuacion;
	ld	iy,#_puntuacion
	ld	l,0 (iy)
	ld	h,#0x00
;src/main.c:695: puntuacion = aumentarPuntuacion(puntuacion_aux);
	push	bc
	push	de
	push	hl
	call	_aumentarPuntuacion
	pop	af
	pop	de
	pop	bc
	ld	iy,#_puntuacion
	ld	0 (iy),l
;src/main.c:696: modificarPuntuacion(puntuacion);
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
;src/main.c:698: actual->muertes++;
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:699: actual->x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:700: actual->y = 0;
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de),a
00116$:
;src/main.c:702: ++actual;
	ld	hl,#0x000D
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00118$
00120$:
;src/main.c:704: cpct_waitVSYNC();
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
