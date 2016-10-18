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
	.globl _borrarPantallaAbajo
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
	.globl _patrolDecision
	.globl _moverEnemigo
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
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getRandom_mxor_u8
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
	.ds 40
_prota::
	.ds 8
_cu::
	.ds 10
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
;src/main.c:116: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
;src/main.c:119: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:120: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
;src/main.c:125: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:126: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:127: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:130: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:132: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:135: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:137: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:140: void menuFin(){
;	---------------------------------
; Function menuFin
; ---------------------------------
_menuFin::
;src/main.c:143: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:145: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:146: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:148: while(1){}
00102$:
	jr	00102$
___str_0:
	.ascii "GAME OVER"
	.db 0x00
;src/main.c:151: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:152: borrarProta();
	call	_borrarProta
;src/main.c:153: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:154: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:155: dibujarProta();
	jp  _dibujarProta
;src/main.c:158: u8* getTilePtr(u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
;src/main.c:159: return mapa + (y/4)*g_map1_W + x/2;
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
;src/main.c:162: u8 checkCollision(int direction) { // check optimization
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
;src/main.c:166: case 0:
00101$:
;src/main.c:167: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
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
;src/main.c:168: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
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
;src/main.c:169: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
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
;src/main.c:170: break;
	jp	00105$
;src/main.c:171: case 1:
00102$:
;src/main.c:172: headTile  = getTilePtr(prota.x - 1, prota.y);
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
;src/main.c:173: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
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
;src/main.c:174: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
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
;src/main.c:175: break;
	jr	00105$
;src/main.c:176: case 2:
00103$:
;src/main.c:177: headTile   = getTilePtr(prota.x, prota.y - 2);
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
;src/main.c:178: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
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
;src/main.c:179: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:180: break;
	jr	00105$
;src/main.c:181: case 3:
00104$:
;src/main.c:182: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
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
;src/main.c:183: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
;src/main.c:195: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:196: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:200: void dibujarExplosion() {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
;src/main.c:201: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
	ld	c,l
	ld	b,h
;src/main.c:202: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
	ld	de,#_g_tablatrans+0
	push	de
	ld	hl,#0x1604
	push	hl
	push	bc
	ld	hl,#_g_explosion
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:205: void borrarExplosion() {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:206: u8 w = 4 + (enemy->px & 1);
	ld	hl, #_enemy + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:209: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:211: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:215: void borrarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function borrarEnemigo
; ---------------------------------
_borrarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/main.c:217: u8 w = 4 + (enemy->px & 1);
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
	ld	-4 (ix),a
;src/main.c:220: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
	ld	-3 (ix),a
;src/main.c:222: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	iy,(_mapa)
	ld	l,d
	ld	h,#0x00
	ld	-2 (ix),l
	ld	-1 (ix),h
	bit	7, h
	jr	Z,00105$
	inc	hl
	inc	hl
	inc	hl
	ld	-2 (ix),l
	ld	-1 (ix),h
00105$:
	ld	d,-2 (ix)
	ld	l,-1 (ix)
	sra	l
	rr	d
	sra	l
	rr	d
	srl	e
	push	bc
	push	iy
	ld	hl,#0xC000
	push	hl
	ld	a,#0x28
	push	af
	inc	sp
	ld	h,-3 (ix)
	ld	l,-4 (ix)
	push	hl
	push	de
	call	_cpct_etm_drawTileBox2x4
	pop	bc
;src/main.c:224: enemy->mover = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:227: void redibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:228: borrarEnemigo(enemy);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:229: enemy->px = enemy->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
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
;src/main.c:234: u8 checkEnemyCollision(int direction, TEnemy *enemy){
;	---------------------------------
; Function checkEnemyCollision
; ---------------------------------
_checkEnemyCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/main.c:236: u8 colisiona = 1;
	ld	-7 (ix),#0x01
;src/main.c:238: switch (direction) {
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
;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
	ld	c,6 (ix)
	ld	b,7 (ix)
;src/main.c:260: enemy->mira = M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
	ld	hl,#0x0001
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:238: switch (direction) {
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
	jp	00103$
	jp	00119$
;src/main.c:239: case 0:
;src/main.c:241: break;
	jp	00135$
;src/main.c:242: case 1:
;src/main.c:244: break;
	jp	00135$
;src/main.c:245: case 2:
00103$:
;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	ld	d,e
	dec	d
	dec	d
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
	jp	C,00115$
;src/main.c:247: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	jp	C,00115$
;src/main.c:248: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	jr	C,00115$
;src/main.c:250: if((prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W)){
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0003
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
	jp	PO, 00196$
	xor	a, #0x80
00196$:
	jp	M,00110$
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,l
	sub	a, e
	ld	a,h
	sbc	a, d
	jp	PO, 00197$
	xor	a, #0x80
00197$:
	jp	P,00111$
00110$:
;src/main.c:252: colisiona = 0;
	ld	-7 (ix),#0x00
	jr	00119$
00111$:
;src/main.c:255: if(enemy->y>prota.y){
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	ld	hl, #(_prota + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00108$
;src/main.c:256: if(enemy->y - (prota.y + G_HERO_H -2) >= 2){
	ld	d,#0x00
	ld	h,#0x00
	push	de
	ld	de,#0x0014
	add	hl, de
	pop	de
	ld	a,e
	sub	a, l
	ld	e,a
	ld	a,d
	sbc	a, h
	ld	d,a
	ld	a,e
	sub	a, #0x02
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00105$
;src/main.c:257: colisiona = 0;
	ld	-7 (ix),#0x00
	jr	00119$
00105$:
;src/main.c:260: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
	jr	00119$
00108$:
;src/main.c:263: colisiona = 0;
	ld	-7 (ix),#0x00
	jr	00119$
00115$:
;src/main.c:269: enemy->mira = M_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x03
;src/main.c:272: case 3:
00119$:
;src/main.c:275: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	jp	C,00131$
;src/main.c:276: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	jp	C,00131$
;src/main.c:277: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
	jr	C,00131$
;src/main.c:279: if( (prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W) ){
	ld	hl, #_prota + 0
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0003
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
	jp	PO, 00198$
	xor	a, #0x80
00198$:
	jp	M,00126$
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,c
	sub	a, e
	ld	a,b
	sbc	a, d
	jp	PO, 00199$
	xor	a, #0x80
00199$:
	jp	P,00127$
00126$:
;src/main.c:280: colisiona = 0;
	ld	-7 (ix),#0x00
	jr	00135$
00127$:
;src/main.c:283: if(prota.y > enemy->y){ //si el prota esta abajo
	ld	hl, #(_prota + 0x0001) + 0
	ld	c,(hl)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00124$
;src/main.c:284: if( prota.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
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
	jp	PO, 00200$
	xor	a, #0x80
00200$:
	jp	P,00121$
;src/main.c:285: colisiona = 0;
	ld	-7 (ix),#0x00
	jr	00135$
00121$:
;src/main.c:288: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
	jr	00135$
00124$:
;src/main.c:291: colisiona = 0;
	ld	-7 (ix),#0x00
	jr	00135$
00131$:
;src/main.c:295: enemy->mira = M_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x02
;src/main.c:298: }
00135$:
;src/main.c:299: return colisiona;
	ld	l,-7 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:302: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:303: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:304: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:305: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:308: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:309: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:310: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:311: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:314: void moverEnemigo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigo
; ---------------------------------
_moverEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:315: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	NZ,00110$
;src/main.c:316: if(!checkEnemyCollision(enemy->mira, enemy)){
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
;src/main.c:318: switch (enemy->mira) {
	ld	e,(hl)
	ld	a,#0x03
	sub	a, e
	jr	C,00110$
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:320: case 0:
;src/main.c:322: break;
;src/main.c:323: case 1:
;src/main.c:325: break;
;src/main.c:326: case 2:
	jp	(hl)
00124$:
	jr	00110$
	jr	00110$
	jr	00103$
	jr	00104$
	jr	00110$
	jr	00110$
00103$:
;src/main.c:327: moverEnemigoArriba(enemy);
	push	bc
	call	_moverEnemigoArriba
	pop	af
;src/main.c:328: break;
	jr	00110$
;src/main.c:329: case 3:
00104$:
;src/main.c:330: moverEnemigoAbajo(enemy);
	push	bc
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:332: }
00110$:
	pop	ix
	ret
;src/main.c:338: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
;	---------------------------------
; Function patrolDecision
; ---------------------------------
_patrolDecision::
;src/main.c:339: u8 decision = cpct_getRandom_mxor_u8() % 4;
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	and	a, #0x03
	ld	e,a
;src/main.c:341: switch (decision) {
	ld	a,#0x03
	sub	a, e
	ret	C
	ld	d,#0x00
	ld	hl,#00112$
	add	hl,de
	add	hl,de
;src/main.c:342: case 0:
	jp	(hl)
00112$:
	jr	00101$
	jr	00106$
	jr	00106$
	jr	00104$
00101$:
;src/main.c:343: moverEnemigoAbajo(enemy);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:344: break;
;src/main.c:345: case 1:
;src/main.c:346: break;
;src/main.c:347: case 2:
;src/main.c:348: break;
;src/main.c:349: case 3:
;src/main.c:351: }
00104$:
00106$:
	ret
;src/main.c:354: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:355: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jp	NC,_menuFin
;src/main.c:356: mapa = mapas[++num_mapa];
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
;src/main.c:357: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:358: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
;src/main.c:359: dibujarMapa();
;src/main.c:363: menuFin();
	ld	(hl), #0x01
	jp	_dibujarMapa
;src/main.c:367: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:368: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:369: if (!checkCollision(M_izquierda)) {
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:370: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:371: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:372: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:376: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:377: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:378: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:379: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:380: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:381: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:383: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:384: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:388: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:389: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:390: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
	ld	hl,#0x0002
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:391: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:392: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:393: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:394: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:398: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:399: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:400: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
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
;src/main.c:401: prota.y++;
	ld	a,e
	inc	a
	ld	(bc),a
;src/main.c:402: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:403: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:404: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:408: void dibujarCuchillo() {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:409: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
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
;src/main.c:410: if(cu.eje == E_X){
	ld	hl, #_cu + 8
	ld	c,(hl)
;src/main.c:411: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	-2 (ix),b
	ld	-1 (ix),e
;src/main.c:410: if(cu.eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/main.c:411: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
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
;src/main.c:414: else if(cu.eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/main.c:415: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
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
;src/main.c:419: void borrarCuchillo() {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:421: u8 w = 2 + (cu.px & 1);
	ld	hl, #_cu + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:422: u8 h = 2 + (cu.py & 3 ? 1 : 0);
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
	ld	-1 (ix),a
;src/main.c:423: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	iy,(_mapa)
	ld	d,#0x00
	ld	h,e
	ld	l,d
	bit	7, d
	jr	Z,00107$
	inc	de
	inc	de
	inc	de
	ld	h,e
	ld	l,d
00107$:
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
;src/main.c:424: if(!cu.mover){
	ld	a, (#_cu + 9)
	or	a, a
	jr	NZ,00103$
;src/main.c:425: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00103$:
	inc	sp
	pop	ix
	ret
;src/main.c:429: void redibujarCuchillo( ) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
;src/main.c:430: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:431: cu.px = cu.x;
	ld	bc,#_cu + 2
	ld	a, (#_cu + 0)
	ld	(bc),a
;src/main.c:432: cu.py = cu.y;
	ld	bc,#_cu + 3
	ld	a, (#_cu + 1)
	ld	(bc),a
;src/main.c:433: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:437: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
;src/main.c:439: if(!cu.lanzado){
	ld	a, (#(_cu + 0x0006) + 0)
	or	a, a
	ret	NZ
;src/main.c:441: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	e,(hl)
;src/main.c:442: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
	ld	bc,#_prota + 1
;src/main.c:444: cu.direccion = M_derecha;
;src/main.c:446: cu.y=prota.y + G_HERO_H /2;
;src/main.c:447: cu.sprite=g_knifeX_0;
;src/main.c:448: cu.eje = E_X;
;src/main.c:441: if(prota.mira == M_derecha){
	ld	a,e
	or	a, a
	jr	NZ,00118$
;src/main.c:442: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
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
;src/main.c:443: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:444: cu.direccion = M_derecha;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x00
;src/main.c:445: cu.x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	(#_cu),a
;src/main.c:446: cu.y=prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:447: cu.sprite=g_knifeX_0;
	ld	hl,#_g_knifeX_0
	ld	((_cu + 0x0004)), hl
;src/main.c:448: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:449: dibujarCuchillo();
	jp  _dibujarCuchillo
00118$:
;src/main.c:452: else if(prota.mira == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00115$
;src/main.c:453: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
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
;src/main.c:454: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:455: cu.direccion = M_izquierda;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x01
;src/main.c:456: cu.x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFC
	ld	(#_cu),a
;src/main.c:457: cu.y = prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:458: cu.sprite = g_knifeX_1;
	ld	hl,#_g_knifeX_1
	ld	((_cu + 0x0004)), hl
;src/main.c:459: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:460: dibujarCuchillo();
	jp  _dibujarCuchillo
00115$:
;src/main.c:463: else if(prota.mira == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00112$
;src/main.c:465: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
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
;src/main.c:466: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:467: cu.direccion = M_abajo;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x03
;src/main.c:468: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:469: cu.y = prota.y + G_HERO_H;
	ld	a,(bc)
	add	a, #0x16
	ld	(#(_cu + 0x0001)),a
;src/main.c:470: cu.sprite = g_knifeY_0;
	ld	hl,#_g_knifeY_0
	ld	((_cu + 0x0004)), hl
;src/main.c:471: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:472: dibujarCuchillo();
	jp  _dibujarCuchillo
00112$:
;src/main.c:475: else if(prota.mira == M_arriba){
	ld	a,e
	sub	a, #0x02
	ret	NZ
;src/main.c:476: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
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
;src/main.c:477: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:478: cu.direccion = M_arriba;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x02
;src/main.c:479: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:480: cu.y = prota.y;
	ld	a,(bc)
	ld	(#(_cu + 0x0001)),a
;src/main.c:481: cu.sprite = g_knifeY_1;
	ld	hl,#_g_knifeY_1
	ld	((_cu + 0x0004)), hl
;src/main.c:482: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:483: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:489: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:490: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:492: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:493: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:494: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:495: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:496: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:497: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:498: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:499: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:500: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:501: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:502: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:506: u8 checkKnifeCollision(int direction){
;	---------------------------------
; Function checkKnifeCollision
; ---------------------------------
_checkKnifeCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:508: u8 colisiona = 1;
	ld	c,#0x01
;src/main.c:510: switch (direction) {
	bit	7, 5 (ix)
	jp	NZ,00125$
	ld	a,#0x03
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jp	PO, 00163$
	xor	a, #0x80
00163$:
	jp	M,00125$
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00164$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00164$:
	jp	00125$
	jp	00125$
	jp	00103$
	jp	00114$
;src/main.c:511: case 0:
;src/main.c:513: break;
	jp	00125$
;src/main.c:514: case 1:
;src/main.c:516: break;
	jp	00125$
;src/main.c:517: case 2:
00103$:
;src/main.c:519: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
	ld	hl,#_enemy+0
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	hl,#_cu+0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00165$
	xor	a, #0x80
00165$:
	jp	M,00114$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00166$
	xor	a, #0x80
00166$:
	jp	M,00114$
;src/main.c:522: if(cu.y>enemy->y){
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	hl, #_enemy + 1
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00114$
;src/main.c:523: if(cu.y - (enemy->y + G_ENEMY_H) >= 2){
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
	ld	a,c
	sub	a, #0x02
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00114$
;src/main.c:528: enemy->muerto = SI;
	ld	hl,#(_enemy + 0x0008)
	ld	(hl),#0x01
;src/main.c:535: case 3:
00114$:
;src/main.c:537: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
	ld	hl, #_enemy + 0
	ld	c,(hl)
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
	ld	hl, #_cu + 0
	ld	l,(hl)
	ld	h,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00167$
	xor	a, #0x80
00167$:
	jp	M,00121$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00168$
	xor	a, #0x80
00168$:
	jp	P,00122$
00121$:
;src/main.c:538: colisiona = 0;
	ld	c,#0x00
	jr	00125$
00122$:
;src/main.c:540: if(cu.y<enemy->y){
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	hl, #_enemy + 1
	ld	l,(hl)
	ld	a,c
	sub	a, l
	jr	NC,00119$
;src/main.c:541: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
	ld	h,#0x00
	ld	b,#0x00
	inc	bc
	inc	bc
	cp	a, a
	sbc	hl, bc
	ld	de, #0x8002
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	C,00116$
;src/main.c:542: colisiona = 0;
	ld	c,#0x00
	jr	00125$
00116$:
;src/main.c:544: colisiona = 1;
	ld	c,#0x01
;src/main.c:545: enemy->muerto = SI;
	ld	hl,#(_enemy + 0x0008)
	ld	(hl),#0x01
	jr	00125$
00119$:
;src/main.c:548: colisiona = 0;
	ld	c,#0x00
;src/main.c:551: }
00125$:
;src/main.c:552: return colisiona;
	ld	l,c
	pop	ix
	ret
;src/main.c:555: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
;src/main.c:557: if(cu.lanzado){
	ld	bc,#_cu+0
	ld	a, (#_cu + 6)
	or	a, a
	ret	Z
;src/main.c:558: cu.mover = 1;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
;src/main.c:559: if(cu.direccion == M_derecha){
	ld	hl, #_cu + 7
	ld	l,(hl)
;src/main.c:561: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
	ld	e, c
	ld	d, b
	inc	de
;src/main.c:559: if(cu.direccion == M_derecha){
	ld	a,l
	or	a, a
	jr	NZ,00128$
;src/main.c:561: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
	ld	a,(de)
	ld	e,a
	ld	a,(bc)
	add	a, #0x05
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
	jr	C,00102$
;src/main.c:562: cu.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:563: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00102$:
;src/main.c:567: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00128$:
;src/main.c:570: else if(cu.direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00125$
;src/main.c:571: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
	ld	a,(de)
	ld	e,a
	ld	a,(bc)
	ld	d,a
	dec	d
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
	jr	C,00105$
;src/main.c:572: cu.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:573: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00105$:
;src/main.c:576: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00125$:
;src/main.c:579: else if(cu.direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00122$
;src/main.c:580: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
	ld	a,(de)
	add	a,#0xFE
	push	af
	ld	a,(bc)
	ld	b,a
	pop	af
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	pop	de
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00111$
;src/main.c:581: if(!checkKnifeCollision(M_arriba)){
	push	de
	ld	hl,#0x0002
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	de
	ld	a,l
	or	a, a
	jr	NZ,00108$
;src/main.c:582: cu.y--;
	ld	a,(de)
	add	a,#0xFF
	ld	(de),a
;src/main.c:583: cu.y--;
	add	a,#0xFF
	ld	(de),a
;src/main.c:584: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00108$:
;src/main.c:587: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00111$:
;src/main.c:590: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00122$:
;src/main.c:595: else if(cu.direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	ret	NZ
;src/main.c:596: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
	ld	a,(de)
	add	a, #0x0A
	push	af
	ld	a,(bc)
	ld	b,a
	pop	af
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_getTilePtr
	pop	af
	pop	de
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00117$
;src/main.c:597: if(!checkKnifeCollision(M_abajo)){
	push	de
	ld	hl,#0x0003
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	de
	ld	a,l
	or	a, a
	jr	NZ,00114$
;src/main.c:598: cu.y++;
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:599: cu.y++;
	inc	a
	ld	(de),a
;src/main.c:600: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00114$:
;src/main.c:603: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00117$:
;src/main.c:606: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
;src/main.c:611: void barraPuntuacionInicial(){
;	---------------------------------
; Function barraPuntuacionInicial
; ---------------------------------
_barraPuntuacionInicial::
;src/main.c:616: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); //
	ld	hl,#0xB200
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:617: cpct_drawStringM0("SCORE", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:618: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
	ld	hl,#0xBE00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:619: cpct_drawStringM0("00000", memptr, 15, 0);
	ld	hl,#0x000F
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:622: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
	ld	hl,#0xBE1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:623: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
	ld	hl,#0x0003
	push	hl
	push	bc
	ld	hl,#___str_3
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:625: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); //
	ld	hl,#0xB23C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:626: cpct_drawStringM0("LIVES", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_4
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:628: for(i=0; i<5; i++){
	ld	bc,#0x0000
00102$:
;src/main.c:629: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
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
;src/main.c:628: for(i=0; i<5; i++){
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
;src/main.c:634: void borrarPantallaAbajo(){
;	---------------------------------
; Function borrarPantallaAbajo
; ---------------------------------
_borrarPantallaAbajo::
;src/main.c:637: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 176); // posición para borrar la mitad derecha
	ld	hl,#0xB000
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:638: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad derecha
	ld	hl,#0x0728
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
;src/main.c:639: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 176); // posición para borrar la mitad izquierda
	inc	sp
	ld	hl,#0xB028
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:640: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad izquierda
	ld	hl,#0x0728
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
;src/main.c:643: void menuInicio(){
;	---------------------------------
; Function menuInicio
; ---------------------------------
_menuInicio::
;src/main.c:647: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:649: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
	ld	hl,#0x0F1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:650: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_5
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:652: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF0F0
	push	hl
	ld	hl,#_g_text_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:653: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF118
	push	hl
	ld	hl,#_g_text_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:676: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
	ld	hl,#0xA008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:677: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_6
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:679: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
	ld	hl,#0xAA0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:680: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_7
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:683: do{
00106$:
;src/main.c:684: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:687: else */if(cpct_isKeyPressed(Key_M)){
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00107$
;src/main.c:688: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:689: do{
00101$:
;src/main.c:691: } while(!cpct_isKeyPressed(Key_S));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
00107$:
;src/main.c:693: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
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
;src/main.c:696: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:697: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:698: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:699: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:700: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:701: cpct_akp_musicInit(G_song);
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
	ret
;src/main.c:704: void inicializarEnemy() {
;	---------------------------------
; Function inicializarEnemy
; ---------------------------------
_inicializarEnemy::
;src/main.c:709: actual = enemy;
	ld	bc,#_enemy+0
;src/main.c:710: while(--i){
	ld	e,#0x05
00104$:
	dec e
	ret	Z
;src/main.c:711: actual->x = actual->px = 71;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl),#0x47
	ld	a,#0x47
	ld	(bc),a
;src/main.c:712: actual->y = actual->py = 84;
	push	bc
	pop	iy
	inc	iy
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x54
	ld	0 (iy), #0x54
;src/main.c:713: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:714: actual->mira=M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/main.c:715: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:717: actual->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
;src/main.c:716: if(i!=4){
	ld	a,e
	sub	a, #0x04
	jr	Z,00102$
;src/main.c:717: actual->muerto = SI;
	ld	(hl),#0x01
	jr	00103$
00102$:
;src/main.c:720: actual->muerto = NO;
	ld	(hl),#0x00
00103$:
;src/main.c:722: actual->patrol = SI;
	ld	hl,#0x0009
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:723: actual++;
	ld	hl,#0x000A
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00104$
;src/main.c:727: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:731: actual = enemy;
;src/main.c:734: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:735: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:736: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:737: dibujarMapa();
	call	_dibujarMapa
;src/main.c:738: borrarPantallaAbajo();
	call	_borrarPantallaAbajo
;src/main.c:739: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:742: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:743: prota.y = prota.py = 80;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x50
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x50
;src/main.c:744: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:745: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:746: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:750: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:751: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:752: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:753: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:755: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:757: dibujarProta();
	call	_dibujarProta
;src/main.c:758: dibujarEnemigo(actual);
	ld	hl,#_enemy
	push	hl
	call	_dibujarEnemigo
	pop	af
	ret
;src/main.c:761: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:765: inicializarCPC();
	call	_inicializarCPC
;src/main.c:766: menuInicio();
	call	_menuInicio
;src/main.c:770: inicializarJuego();
	call	_inicializarJuego
;src/main.c:775: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:778: actual = enemy;
;src/main.c:780: while (1) {
00115$:
;src/main.c:782: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:783: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:784: moverCuchillo();
	call	_moverCuchillo
;src/main.c:786: moverEnemigo(actual);
	ld	hl,#_enemy
	push	hl
	call	_moverEnemigo
	pop	af
;src/main.c:788: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:790: if (prota.mover) {
	ld	bc,#_prota+6
	ld	a,(bc)
	or	a, a
	jr	Z,00102$
;src/main.c:791: redibujarProta();
	push	bc
	call	_redibujarProta
	pop	bc
;src/main.c:792: prota.mover = NO;
	xor	a, a
	ld	(bc),a
00102$:
;src/main.c:794: if(cu.lanzado && cu.mover){
	ld	hl,#_cu + 6
	ld	c,(hl)
	ld	de,#_cu + 9
	ld	a,c
	or	a, a
	jr	Z,00107$
	ld	a,(de)
	or	a, a
	jr	Z,00107$
;src/main.c:795: redibujarCuchillo();
	call	_redibujarCuchillo
	jr	00108$
00107$:
;src/main.c:796: }else if (cu.lanzado && !cu.mover){
	ld	a,c
	or	a, a
	jr	Z,00108$
	ld	a,(de)
	or	a, a
	jr	NZ,00108$
;src/main.c:797: borrarCuchillo();
	call	_borrarCuchillo
00108$:
;src/main.c:800: if(enemy->mover){
	ld	a, (#_enemy + 6)
	or	a, a
	jr	Z,00111$
;src/main.c:801: redibujarEnemigo(actual);
	ld	hl,#_enemy
	push	hl
	call	_redibujarEnemigo
	pop	af
00111$:
;src/main.c:803: if (enemy->muerto){
	ld	a,(#_enemy + 8)
	ld	-1 (ix), a
	or	a, a
	jr	Z,00115$
;src/main.c:805: borrarEnemigo(actual);
	ld	hl,#_enemy
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:807: dibujarExplosion();
	call	_dibujarExplosion
;src/main.c:808: borrarExplosion();
	call	_borrarExplosion
	jr	00115$
	inc	sp
	pop	ix
	ret
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
