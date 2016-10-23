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
	.globl _inicializarEnemy
	.globl _inicializarCPC
	.globl _menuInicio
	.globl _borrarPantallaArriba
	.globl _barraPuntuacionInicial
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
	.globl _updateEnemies
	.globl _patrol
	.globl _lookFor
	.globl _moverEnemigo
	.globl _moverEnemigoPathfinding
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
	.globl _menuFin
	.globl _borrarProta
	.globl _dibujarProta
	.globl _dibujarMapa
	.globl _pathFinding
	.globl _abs
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
	.globl _iter
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
	.ds 1296
_prota::
	.ds 8
_cu::
	.ds 10
_iter::
	.ds 1
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
;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0E00, M0, 0); // es el color 8 - 4D - FF00FF
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x0E00 
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
;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
	.db #0x3C	; 60
	.db #0x47	; 71	'G'
	.db #0x14	; 20
	.db #0x3C	; 60
_spawnY:
	.db #0x00	; 0
	.db #0x2C	; 44
	.db #0x72	; 114	'r'
	.db #0x8A	; 138
	.db #0x8A	; 138
;src/main.c:116: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:121: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:123: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:131: void menuFin(){
;	---------------------------------
; Function menuFin
; ---------------------------------
_menuFin::
;src/main.c:134: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:139: while(1){}
00102$:
	jr	00102$
___str_0:
	.ascii "GAME OVER"
	.db 0x00
;src/main.c:142: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:143: borrarProta();
	call	_borrarProta
;src/main.c:144: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:145: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:146: dibujarProta();
	jp  _dibujarProta
;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
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
;src/main.c:153: u8 checkCollision(int direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:156: switch (direction) {
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
;src/main.c:157: case 0:
00101$:
;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
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
;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
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
;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
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
;src/main.c:161: break;
	jp	00105$
;src/main.c:162: case 1:
00102$:
;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
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
;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
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
;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
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
;src/main.c:166: break;
	jr	00105$
;src/main.c:167: case 2:
00103$:
;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
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
;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
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
;src/main.c:170: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:171: break;
	jr	00105$
;src/main.c:172: case 3:
00104$:
;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
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
;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
;src/main.c:175: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:177: }
00105$:
;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
;src/main.c:180: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:182: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
;src/main.c:195: void borrarExplosion() {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:196: u8 w = 4 + (enemy->px & 1);
	ld	hl, #_enemy + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
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
;src/main.c:207: u8 w = 4 + (enemy->px & 1);
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
	ld	-6 (ix),a
;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
	ld	-5 (ix),a
;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
	ld	h,-5 (ix)
	ld	l,-6 (ix)
	push	hl
	push	de
	call	_cpct_etm_drawTileBox2x4
	pop	bc
;src/main.c:214: enemy->mover = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:218: borrarEnemigo(enemy);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:219: enemy->px = enemy->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:220: enemy->py = enemy->y;
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
;src/main.c:221: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
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
;src/main.c:226: u8 colisiona = 1;
	ld	-9 (ix),#0x01
;src/main.c:228: switch (direction) {
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
;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:243: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:250: enemy->mira = M_izquierda;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:228: switch (direction) {
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
;src/main.c:229: case 0:
00101$:
;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
;src/main.c:235: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00109$:
;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a, e
	jr	NC,00106$
;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:240: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00103$:
;src/main.c:243: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00106$:
;src/main.c:246: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00113$:
;src/main.c:250: enemy->mira = M_izquierda;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x01
;src/main.c:252: break;
	jp	00165$
;src/main.c:253: case 1:
00117$:
;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
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
;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
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
;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
;src/main.c:259: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00125$:
;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
	ld	a,(bc)
	ld	e,a
	ld	hl, #_cu + 0
	ld	c,(hl)
	ld	a,c
	sub	a, e
	jr	NC,00122$
;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:264: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00119$:
;src/main.c:267: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jp	00165$
00122$:
;src/main.c:270: colisiona = 0;
	ld	-9 (ix),#0x00
	jp	00165$
00129$:
;src/main.c:274: enemy->mira = M_derecha;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
;src/main.c:276: break;
	jp	00165$
;src/main.c:277: case 2:
00133$:
;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
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
;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
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
;src/main.c:284: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00141$:
;src/main.c:287: if(enemy->y>cu.y){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00138$
;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
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
;src/main.c:289: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00135$:
;src/main.c:292: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00149$
00138$:
;src/main.c:296: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00149$
00145$:
;src/main.c:302: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:305: case 3:
00149$:
;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
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
;src/main.c:313: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00157$:
;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00154$
;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:318: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00151$:
;src/main.c:321: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00165$
00154$:
;src/main.c:325: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00165$
00161$:
;src/main.c:329: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:332: }
00165$:
;src/main.c:333: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:337: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:338: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:339: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:343: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:344: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:345: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:349: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:350: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:351: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:355: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:356: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:357: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:360: void moverEnemigoPathfinding(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoPathfinding
; ---------------------------------
_moverEnemigoPathfinding::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/main.c:361: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jp	NZ,00112$
;src/main.c:363: if (!enemy->reversePatrol) {
	ld	hl,#0x000D
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-1 (ix),a
;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
	ld	hl,#0x000F
	add	hl,bc
	ex	de,hl
;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
	ld	hl,#0x0017
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
	ld	hl,#0x0001
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
;src/main.c:369: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	-7 (ix),l
	ld	-6 (ix),h
;src/main.c:372: enemy->lastIter = enemy->iter - 1;
	ld	hl,#0x0010
	add	hl,bc
	ld	-9 (ix),l
	ld	-8 (ix),h
;src/main.c:363: if (!enemy->reversePatrol) {
	ld	a,-1 (ix)
	or	a, a
	jr	NZ,00108$
;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
	ld	a,(de)
	ld	-1 (ix),a
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0143
	add	hl, bc
	pop	bc
	ld	l,(hl)
	ld	h,#0x00
	ld	a,l
	add	a,#0xF8
	ld	-11 (ix),a
	ld	a,h
	adc	a,#0xFF
	ld	-10 (ix),a
	ld	a, -1 (ix)
	ld	h, #0x00
	sub	a, -11 (ix)
	ld	a,h
	sbc	a, -10 (ix)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P,00102$
;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
	ld	l,-1 (ix)
	ld	h,#0x00
	ld	a,-3 (ix)
	add	a, l
	ld	l,a
	ld	a,-2 (ix)
	adc	a, h
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
;src/main.c:366: enemy->iter++;
	ld	a,(de)
	ld	c,a
	inc	c
	ld	a,c
	ld	(de),a
;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
	ld	l,c
	ld	h,#0x00
	ld	a,-3 (ix)
	add	a, l
	ld	l,a
	ld	a,-2 (ix)
	adc	a, h
	ld	h,a
	ld	b,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),b
;src/main.c:368: enemy->iter++;
	inc	c
	ld	a,c
	ld	(de),a
;src/main.c:369: enemy->mover = SI;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x01
	jr	00112$
00102$:
;src/main.c:372: enemy->lastIter = enemy->iter - 1;
	ld	c,-1 (ix)
	dec	c
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),c
;src/main.c:375: enemy->reversePatrol = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
	jr	00112$
00108$:
;src/main.c:378: if(enemy->lastIter > 1){
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	l,(hl)
	ld	a,#0x01
	sub	a, l
	jr	NC,00105$
;src/main.c:379: enemy->y = enemy->camino[enemy->lastIter];
	ld	h,#0x00
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	add	hl,de
	ld	e,(hl)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),e
;src/main.c:380: enemy->lastIter--;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	e,(hl)
	dec	e
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),e
;src/main.c:381: enemy->x = enemy->camino[enemy->lastIter];
	ld	l,e
	ld	h,#0x00
	ld	a,-3 (ix)
	add	a, l
	ld	l,a
	ld	a,-2 (ix)
	adc	a, h
	ld	h,a
	ld	a,(hl)
	ld	(bc),a
;src/main.c:382: enemy->lastIter--;
	dec	e
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),e
;src/main.c:383: enemy->mover = SI;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),#0x01
	jr	00112$
00105$:
;src/main.c:386: enemy->iter = 0;
	xor	a, a
	ld	(de),a
;src/main.c:388: enemy->reversePatrol = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:395: void moverEnemigo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigo
; ---------------------------------
_moverEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:396: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	NZ,00110$
;src/main.c:397: if(!checkEnemyCollision(enemy->mira, enemy)){
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
;src/main.c:399: switch (enemy->mira) {
	ld	e,(hl)
	ld	a,#0x03
	sub	a, e
	jr	C,00110$
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:401: case 0:
	jp	(hl)
00124$:
	jr	00101$
	jr	00102$
	jr	00103$
	jr	00104$
00101$:
;src/main.c:402: moverEnemigoDerecha(enemy);
	push	bc
	call	_moverEnemigoDerecha
	pop	af
;src/main.c:403: break;
	jr	00110$
;src/main.c:404: case 1:
00102$:
;src/main.c:405: moverEnemigoIzquierda(enemy);
	push	bc
	call	_moverEnemigoIzquierda
	pop	af
;src/main.c:406: break;
	jr	00110$
;src/main.c:407: case 2:
00103$:
;src/main.c:408: moverEnemigoArriba(enemy);
	push	bc
	call	_moverEnemigoArriba
	pop	af
;src/main.c:409: break;
	jr	00110$
;src/main.c:410: case 3:
00104$:
;src/main.c:411: moverEnemigoAbajo(enemy);
	push	bc
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:413: }
00110$:
	pop	ix
	ret
;src/main.c:418: void lookFor(TEnemy* enemy){
;	---------------------------------
; Function lookFor
; ---------------------------------
_lookFor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/main.c:421: u8 interpone = NO;
	ld	c,#0x00
;src/main.c:425: u8 difx = abs(enemy->x - prota.x);
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	a,5 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b,(hl)
	ld	d,#0x00
	ld	hl,#_prota+0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,b
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
	ld	b,l
;src/main.c:426: u8 dify = abs(enemy->y - prota.y);
	ld	a,-6 (ix)
	add	a, #0x01
	ld	-8 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
	ld	d,#0x00
	ld	hl, #(_prota + 0x0001) + 0
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
;src/main.c:427: dist = difx + dify; // manhattan
	ld	a,b
	add	a, l
	ld	b,a
;src/main.c:429: enemy->seen = NO;
	ld	a,-6 (ix)
	add	a, #0x12
	ld	-10 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-9 (ix),a
	pop	hl
	push	hl
	ld	(hl),#0x00
;src/main.c:430: enemy->inRange = NO;
	ld	a,-6 (ix)
	add	a, #0x11
	ld	-2 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/main.c:432: if (dist <= 10) {// te detectan los sensores de proximidad
	ld	a,#0x0A
	sub	a, b
	jr	C,00123$
;src/main.c:433: enemy->seen = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;src/main.c:434: enemy->inRange = 1;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x01
	jp	00133$
00123$:
;src/main.c:435: } else if(enemy->x > prota.x - 50 && enemy->x < prota.x + 50  ){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	ld	-2 (ix),a
	ld	hl, #_prota + 0
	ld	b,(hl)
	ld	e,b
	ld	d,#0x00
	ld	a,e
	add	a,#0xCE
	ld	-4 (ix),a
	ld	a,d
	adc	a,#0xFF
	ld	-3 (ix),a
	ld	l,-2 (ix)
	ld	h,#0x00
	ld	a,-4 (ix)
	sub	a, l
	ld	a,-3 (ix)
	sbc	a, h
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	jp	P,00133$
	ld	a,e
	add	a, #0x32
	ld	e,a
	ld	a,d
	adc	a, #0x00
	ld	d,a
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00206$
	xor	a, #0x80
00206$:
	jp	P,00133$
;src/main.c:436: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e,(hl)
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
	jp	PO, 00207$
	xor	a, #0x80
00207$:
	jp	P,00133$
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00208$
	xor	a, #0x80
00208$:
	jp	P,00133$
;src/main.c:437: if(enemy->x > prota.x){
	ld	a,b
	sub	a, -2 (ix)
	ld	a,#0x00
	rla
	or	a, a
	jr	Z,00114$
;src/main.c:438: i = prota.x;
	ld	e,b
;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
00127$:
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b,(hl)
	ld	a,e
	sub	a, b
	jr	NC,00103$
	ld	a,c
	or	a, a
	jr	NZ,00103$
;src/main.c:440: if(*getTilePtr(i , prota.y) > 2){
	ld	hl, #(_prota + 0x0001) + 0
	ld	b,(hl)
	push	bc
	push	de
	push	bc
	inc	sp
	ld	a,e
	push	af
	inc	sp
	call	_getTilePtr
	pop	af
	pop	de
	pop	bc
	ld	b,(hl)
	ld	a,#0x02
	sub	a, b
	jr	NC,00128$
;src/main.c:441: interpone = SI;
	ld	c,#0x01
00128$:
;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
	inc	e
	jr	00127$
00103$:
;src/main.c:444: if(!interpone){
	ld	a,c
	or	a, a
	jr	NZ,00133$
;src/main.c:445: enemy->seen = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
	jr	00133$
00114$:
;src/main.c:447: }else if(enemy->x > prota.x){
	or	a, a
	jr	Z,00133$
;src/main.c:448: i = enemy->x;
	ld	b,-2 (ix)
;src/main.c:449: for (i; i<prota.x && !interpone; i++){
00131$:
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	a,b
	sub	a, e
	jr	NC,00108$
	ld	a,c
	or	a, a
	jr	NZ,00108$
;src/main.c:450: if(*getTilePtr(i, enemy->y) > 2){
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,(hl)
	push	bc
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	pop	bc
	ld	e,(hl)
	ld	a,#0x02
	sub	a, e
	jr	NC,00132$
;src/main.c:451: interpone = SI;
	ld	c,#0x01
00132$:
;src/main.c:449: for (i; i<prota.x && !interpone; i++){
	inc	b
	jr	00131$
00108$:
;src/main.c:454: if(!interpone){
	ld	a,c
	or	a, a
	jr	NZ,00133$
;src/main.c:455: enemy->seen = SI;
	pop	hl
	push	hl
	ld	(hl),#0x01
00133$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:463: void patrol(TEnemy *enemy) {
;	---------------------------------
; Function patrol
; ---------------------------------
_patrol::
;src/main.c:464: if (enemy->onPathPatrol) {
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	pop	iy
	ld	a,12 (iy)
	or	a, a
	ret	Z
;src/main.c:465: moverEnemigoPathfinding(enemy);
	push	bc
	call	_moverEnemigoPathfinding
	pop	af
	ret
;src/main.c:469: void updateEnemies() {
;	---------------------------------
; Function updateEnemies
; ---------------------------------
_updateEnemies::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;src/main.c:471: u8 i = 1 + 1;
	ld	-12 (ix),#0x02
;src/main.c:474: actual = enemy;
;src/main.c:476: while (--i) {
	ld	-2 (ix),#<(_enemy)
	ld	-1 (ix),#>(_enemy)
	ld	-11 (ix),#<(_enemy)
	ld	-10 (ix),#>(_enemy)
	ld	-4 (ix),#<(_enemy)
	ld	-3 (ix),#>(_enemy)
	ld	-6 (ix),#<(_enemy)
	ld	-5 (ix),#>(_enemy)
	ld	-9 (ix),#<(_enemy)
	ld	-8 (ix),#>(_enemy)
00121$:
	ld	a,-12 (ix)
	add	a,#0xFF
	ld	-7 (ix), a
	ld	-12 (ix),a
	ld	a,-7 (ix)
	or	a, a
	jp	Z,00124$
;src/main.c:477: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
	ld	hl,#_enemy
	push	hl
	call	_lookFor
	pop	af
;src/main.c:478: if (actual->patrolling) { // esta patrullando
	ld	a, (#(_enemy + 0x000b) + 0)
	or	a, a
	jr	Z,00119$
;src/main.c:479: if (!actual->seen) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	c,(hl)
	ld	a,c
	or	a, a
	jr	NZ,00107$
;src/main.c:480: patrol(actual);
	ld	hl,#_enemy
	push	hl
	call	_patrol
	pop	af
	jr	00121$
00107$:
;src/main.c:484: actual->onPathPatrol = 0;
	ld	de,#_enemy + 12
;src/main.c:481: } else if (actual->seen) {
	ld	a,c
	or	a, a
	jr	Z,00104$
;src/main.c:483: actual->patrolling = 0;
	ld	hl,#(_enemy + 0x000b)
	ld	(hl),#0x00
;src/main.c:484: actual->onPathPatrol = 0;
	xor	a, a
	ld	(de),a
	jr	00121$
00104$:
;src/main.c:485: } else if (actual->inRange) {
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	bc, #0x0011
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jr	Z,00121$
;src/main.c:487: actual->patrolling = 0;
	ld	hl,#(_enemy + 0x000b)
	ld	(hl),#0x00
;src/main.c:488: actual->onPathPatrol = 0;
	xor	a, a
	ld	(de),a
	jr	00121$
00119$:
;src/main.c:490: } else if (actual->seek) { // esta buscando
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	de, #0x0014
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	Z,00121$
;src/main.c:491: if (!actual->found && actual->seekTimer <= 5) {
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	de, #0x0013
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	NZ,00121$
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	de, #0x0015
	add	hl, de
	ld	c,(hl)
	ld	a,#0x05
	sub	a, c
	ld	a,#0x00
	rla
;src/main.c:495: } else if (actual->engage) {
	jp	00121$
00124$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:504: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:505: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jp	NC,_menuFin
;src/main.c:506: mapa = mapas[++num_mapa];
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
;src/main.c:507: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:508: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:509: dibujarMapa();
	call	_dibujarMapa
;src/main.c:510: inicializarEnemy();
	jp  _inicializarEnemy
;src/main.c:514: menuFin();
	jp  _menuFin
;src/main.c:518: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:519: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:520: if (!checkCollision(M_izquierda)) {
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:521: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:522: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:523: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:527: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:528: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:529: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:530: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:531: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:532: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:534: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:535: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:539: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:540: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:541: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
	ld	hl,#0x0002
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:542: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:543: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:544: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:545: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:549: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:550: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:551: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
	ld	hl,#0x0003
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:552: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:553: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:554: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:555: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:559: void dibujarCuchillo() {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:560: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
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
;src/main.c:561: if(cu.eje == E_X){
	ld	hl, #_cu + 8
	ld	c,(hl)
;src/main.c:562: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	-2 (ix),b
	ld	-1 (ix),e
;src/main.c:561: if(cu.eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/main.c:562: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
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
;src/main.c:565: else if(cu.eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/main.c:566: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
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
;src/main.c:570: void borrarCuchillo() {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:572: u8 w = 2 + (cu.px & 1);
	ld	hl, #_cu + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:573: u8 h = 2 + (cu.py & 3 ? 1 : 0);
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
;src/main.c:574: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:575: if(!cu.mover){
	ld	a, (#_cu + 9)
	or	a, a
	jr	NZ,00103$
;src/main.c:576: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:580: void redibujarCuchillo( ) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
;src/main.c:581: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:582: cu.px = cu.x;
	ld	bc,#_cu + 2
	ld	a, (#_cu + 0)
	ld	(bc),a
;src/main.c:583: cu.py = cu.y;
	ld	bc,#_cu + 3
	ld	a, (#_cu + 1)
	ld	(bc),a
;src/main.c:584: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:587: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
;src/main.c:589: if(!cu.lanzado){
	ld	a, (#(_cu + 0x0006) + 0)
	or	a, a
	ret	NZ
;src/main.c:591: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	e,(hl)
;src/main.c:592: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
	ld	bc,#_prota + 1
;src/main.c:594: cu.direccion = M_derecha;
;src/main.c:596: cu.y=prota.y + G_HERO_H /2;
;src/main.c:597: cu.sprite=g_knifeX_0;
;src/main.c:598: cu.eje = E_X;
;src/main.c:591: if(prota.mira == M_derecha){
	ld	a,e
	or	a, a
	jr	NZ,00118$
;src/main.c:592: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
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
;src/main.c:593: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:594: cu.direccion = M_derecha;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x00
;src/main.c:595: cu.x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	(#_cu),a
;src/main.c:596: cu.y=prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:597: cu.sprite=g_knifeX_0;
	ld	hl,#_g_knifeX_0
	ld	((_cu + 0x0004)), hl
;src/main.c:598: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:599: dibujarCuchillo();
	jp  _dibujarCuchillo
00118$:
;src/main.c:602: else if(prota.mira == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00115$
;src/main.c:603: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
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
;src/main.c:604: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:605: cu.direccion = M_izquierda;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x01
;src/main.c:606: cu.x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFC
	ld	(#_cu),a
;src/main.c:607: cu.y = prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:608: cu.sprite = g_knifeX_1;
	ld	hl,#_g_knifeX_1
	ld	((_cu + 0x0004)), hl
;src/main.c:609: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:610: dibujarCuchillo();
	jp  _dibujarCuchillo
00115$:
;src/main.c:613: else if(prota.mira == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00112$
;src/main.c:615: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
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
;src/main.c:616: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:617: cu.direccion = M_abajo;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x03
;src/main.c:618: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:619: cu.y = prota.y + G_HERO_H;
	ld	a,(bc)
	add	a, #0x16
	ld	(#(_cu + 0x0001)),a
;src/main.c:620: cu.sprite = g_knifeY_0;
	ld	hl,#_g_knifeY_0
	ld	((_cu + 0x0004)), hl
;src/main.c:621: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:622: dibujarCuchillo();
	jp  _dibujarCuchillo
00112$:
;src/main.c:625: else if(prota.mira == M_arriba){
	ld	a,e
	sub	a, #0x02
	ret	NZ
;src/main.c:626: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
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
;src/main.c:627: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:628: cu.direccion = M_arriba;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x02
;src/main.c:629: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:630: cu.y = prota.y;
	ld	a,(bc)
	ld	(#(_cu + 0x0001)),a
;src/main.c:631: cu.sprite = g_knifeY_1;
	ld	hl,#_g_knifeY_1
	ld	((_cu + 0x0004)), hl
;src/main.c:632: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:633: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:639: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:640: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:642: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:643: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:644: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:645: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:646: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:647: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:648: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:649: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:650: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:651: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:652: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:656: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
;	---------------------------------
; Function checkKnifeCollision
; ---------------------------------
_checkKnifeCollision::
;src/main.c:658: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
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
;src/main.c:661: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
;src/main.c:662: if(cu.lanzado){
	ld	bc,#_cu+0
	ld	a, (#_cu + 6)
	or	a, a
	ret	Z
;src/main.c:663: cu.mover = SI;
	ld	hl,#0x0009
	add	hl,bc
	ex	de,hl
	ld	a,#0x01
	ld	(de),a
;src/main.c:664: if(cu.direccion == M_derecha){
	ld	hl, #_cu + 7
	ld	l,(hl)
	ld	a,l
	or	a, a
	jr	NZ,00122$
;src/main.c:666: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
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
;src/main.c:667: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:668: cu.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
	ret
00102$:
;src/main.c:671: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
00122$:
;src/main.c:674: else if(cu.direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00119$
;src/main.c:675: if(checkKnifeCollision(M_derecha, -1, 0)){
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
;src/main.c:676: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:677: cu.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
	ret
00105$:
;src/main.c:679: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
00119$:
;src/main.c:685: cu.y--;
	inc	bc
;src/main.c:682: else if(cu.direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00116$
;src/main.c:683: if(checkKnifeCollision(M_derecha, 0, -2)){
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
;src/main.c:684: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:685: cu.y--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:686: cu.y--;
	add	a,#0xFF
	ld	(bc),a
	ret
00108$:
;src/main.c:689: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
00116$:
;src/main.c:692: else if(cu.direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	ret	NZ
;src/main.c:693: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
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
;src/main.c:694: cu.mover = SI;
	ld	a,#0x01
	ld	(de),a
;src/main.c:695: cu.y++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:696: cu.y++;
	inc	a
	ld	(bc),a
	ret
00111$:
;src/main.c:699: cu.mover=NO;
	xor	a, a
	ld	(de),a
	ret
;src/main.c:705: void barraPuntuacionInicial(){
;	---------------------------------
; Function barraPuntuacionInicial
; ---------------------------------
_barraPuntuacionInicial::
;src/main.c:710: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
	ld	hl,#0x0200
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:711: cpct_drawStringM0("SCORE", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:712: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
	ld	hl,#0x0E00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:713: cpct_drawStringM0("00000", memptr, 15, 0);
	ld	hl,#0x000F
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:716: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
	ld	hl,#0x0E1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:717: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
	ld	hl,#0x0003
	push	hl
	push	bc
	ld	hl,#___str_3
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:719: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
	ld	hl,#0x023C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:720: cpct_drawStringM0("LIVES", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_4
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:722: for(i=0; i<5; i++){
	ld	bc,#0x0000
00102$:
;src/main.c:723: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
	ld	a,c
	add	a, a
	add	a, a
	add	a, #0x3C
	ld	d,a
	push	bc
	ld	a,#0x0E
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
;src/main.c:722: for(i=0; i<5; i++){
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
___str_1:
	.ascii "SCORE"
	.db 0x00
___str_2:
	.ascii "00000"
	.db 0x00
___str_3:
	.ascii "ROBOBIT"
	.db 0x00
___str_4:
	.ascii "LIVES"
	.db 0x00
;src/main.c:728: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
;	---------------------------------
; Function borrarPantallaArriba
; ---------------------------------
_borrarPantallaArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:731: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:732: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:733: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
	ld	a,4 (ix)
	add	a, #0x28
	ld	b,a
	ld	a,5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:734: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	ix
	ret
;src/main.c:737: void menuInicio(){
;	---------------------------------
; Function menuInicio
; ---------------------------------
_menuInicio::
;src/main.c:741: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:743: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
	ld	hl,#0x0F1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:744: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_5
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:746: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF0F0
	push	hl
	ld	hl,#_g_text_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:747: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF118
	push	hl
	ld	hl,#_g_text_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:770: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
	ld	hl,#0xA008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:771: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_6
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:773: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
	ld	hl,#0xAA0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:774: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_7
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:777: do{
00106$:
;src/main.c:778: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:782: if(cpct_isKeyPressed(Key_M)){
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00107$
;src/main.c:783: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:784: do{
00101$:
;src/main.c:786: } while(!cpct_isKeyPressed(Key_S));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
00107$:
;src/main.c:788: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	NZ
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00106$
	ret
___str_5:
	.ascii "ROBOBIT"
	.db 0x00
___str_6:
	.ascii "TO START PRESS S"
	.db 0x00
___str_7:
	.ascii "TO MENU PRESS M"
	.db 0x00
;src/main.c:791: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:792: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:793: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:794: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:795: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:796: cpct_akp_musicInit(G_song);
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
	ret
;src/main.c:799: void inicializarEnemy() {
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
;src/main.c:810: actual = enemy;
	ld	bc,#_enemy+0
;src/main.c:811: while(--i){
	ld	-7 (ix),#0x02
00101$:
	dec	-7 (ix)
	ld	a,-7 (ix)
	or	a, a
	jp	Z,00104$
;src/main.c:812: actual->x = actual->px = spawnX[i];
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,#<(_spawnX)
	add	a, -7 (ix)
	ld	-5 (ix),a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-6 (ix), a
	ld	(de),a
	ld	a,-6 (ix)
	ld	(bc),a
;src/main.c:813: actual->y = actual->py = spawnY[i];
	ld	e, c
	ld	d, b
	inc	de
	ld	hl,#0x0003
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	iy,#_spawnY
	push	bc
	ld	c,-7 (ix)
	ld	b,#0x00
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	-3 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-3 (ix)
	ld	(hl),a
	ld	a,-3 (ix)
	ld	(de),a
;src/main.c:814: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:815: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/main.c:816: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:817: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:818: actual->muertes = 0;
	ld	hl,#0x000A
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:819: actual->patrolling = SI;
	ld	hl,#0x000B
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:820: actual->onPathPatrol = SI;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:821: actual->reversePatrol = NO;
	ld	hl,#0x000D
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:822: actual->iter = 0;
	ld	hl,#0x000F
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:823: actual->lastIter = 0;
	ld	hl,#0x0010
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:824: actual->seen = 0;
	ld	hl,#0x0012
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:825: actual->found = 0;
	ld	hl,#0x0013
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:826: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
	ld	e, 0 (iy)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
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
	ld	h,-3 (ix)
	ld	l,-6 (ix)
	push	hl
	call	_pathFinding
	ld	hl,#8
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/main.c:849: dibujarEnemigo(actual);
	push	bc
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	bc
;src/main.c:851: ++actual;
	ld	hl,#0x0144
	add	hl,bc
	ld	c,l
	ld	b,h
	jp	00101$
00104$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:855: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:857: iter = 0;
	ld	hl,#_iter + 0
	ld	(hl), #0x00
;src/main.c:858: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:859: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:860: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:862: dibujarMapa();
	call	_dibujarMapa
;src/main.c:864: borrarPantallaArriba(0, 0, 40, 1);
	ld	hl,#0x0128
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_borrarPantallaArriba
	pop	af
	pop	af
;src/main.c:865: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:868: prota.x = prota.px = 5;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x05
	ld	hl,#_prota
	ld	(hl),#0x05
;src/main.c:869: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x64
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x64
;src/main.c:870: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:871: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:872: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:876: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:877: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:878: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:879: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:881: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:883: dibujarProta();
	jp  _dibujarProta
;src/main.c:886: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:891: inicializarCPC();
	call	_inicializarCPC
;src/main.c:892: menuInicio();
	call	_menuInicio
;src/main.c:894: inicializarJuego();
	call	_inicializarJuego
;src/main.c:895: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:897: while (1) {
00119$:
;src/main.c:900: i = 1 + 1;
	ld	-1 (ix),#0x02
;src/main.c:903: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:904: moverCuchillo();
	call	_moverCuchillo
;src/main.c:905: updateEnemies();
	call	_updateEnemies
;src/main.c:920: actual = enemy;
;src/main.c:922: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:924: if (prota.mover) {
	ld	bc,#_prota+6
	ld	a,(bc)
	or	a, a
	jr	Z,00102$
;src/main.c:925: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:926: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00102$:
;src/main.c:928: if(cu.lanzado && cu.mover){
	ld	hl,#_cu + 6
	ld	c,(hl)
	ld	de,#_cu + 9
	ld	a,c
	or	a, a
	jr	Z,00107$
	ld	a,(de)
	or	a, a
	jr	Z,00107$
;src/main.c:929: redibujarCuchillo();
	call	_redibujarCuchillo
	jr	00132$
00107$:
;src/main.c:930: }else if (cu.lanzado && !cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00132$
	ld	a,(de)
	or	a, a
	jr	NZ,00132$
;src/main.c:931: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:934: while(--i){
00132$:
	ld	bc,#_enemy
00115$:
	dec	-1 (ix)
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00117$
;src/main.c:935: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00111$
;src/main.c:936: redibujarEnemigo(actual);
	push	bc
	push	bc
	call	_redibujarEnemigo
	pop	af
	pop	bc
00111$:
;src/main.c:938: if (actual->muerto && actual->muertes == 0){
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	Z,00113$
	ld	hl,#0x000A
	add	hl,bc
	ld	a,(hl)
	or	a, a
	jr	NZ,00113$
;src/main.c:939: borrarEnemigo(actual);
	push	hl
	push	bc
	push	bc
	call	_borrarEnemigo
	pop	af
	pop	bc
	push	bc
	push	bc
	call	_dibujarExplosion
	pop	af
	pop	bc
	pop	hl
;src/main.c:942: actual->muertes++;
	ld	e,(hl)
	inc	e
	ld	(hl),e
;src/main.c:943: actual->x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:944: actual->y = 0;
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de),a
00113$:
;src/main.c:946: ++actual;
	ld	hl,#0x0144
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00115$
00117$:
;src/main.c:949: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00119$
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
	.org 0x0F00
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
