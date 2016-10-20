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
	.globl _menuFin
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
;src/main.c:121: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
;src/main.c:124: void dibujarMapa() {
;	---------------------------------
; Function dibujarMapa
; ---------------------------------
_dibujarMapa::
;src/main.c:125: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
;src/main.c:128: void dibujarProta() {
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:129: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
;src/main.c:130: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
	ld	bc, (#_prota + 4)
	ld	hl,#_g_tablatrans
	push	hl
	ld	hl,#0x1607
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	ret
;src/main.c:133: void borrarProta() {
;	---------------------------------
; Function borrarProta
; ---------------------------------
_borrarProta::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:135: u8 w = 4 + (prota.px & 1);
	ld	hl, #_prota + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:138: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
;src/main.c:140: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:143: void menuFin(){
;	---------------------------------
; Function menuFin
; ---------------------------------
_menuFin::
;src/main.c:146: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:148: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
	ld	hl,#0x5A18
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:149: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:151: while(1){}
00102$:
	jr	00102$
___str_0:
	.ascii "GAME OVER"
	.db 0x00
;src/main.c:154: void redibujarProta() {
;	---------------------------------
; Function redibujarProta
; ---------------------------------
_redibujarProta::
;src/main.c:155: borrarProta();
	call	_borrarProta
;src/main.c:156: prota.px = prota.x;
	ld	bc,#_prota + 2
	ld	a, (#_prota + 0)
	ld	(bc),a
;src/main.c:157: prota.py = prota.y;
	ld	bc,#_prota + 3
	ld	a, (#_prota + 1)
	ld	(bc),a
;src/main.c:158: dibujarProta();
	jp  _dibujarProta
;src/main.c:161: u8* getTilePtr(u8 x, u8 y) {
;	---------------------------------
; Function getTilePtr
; ---------------------------------
_getTilePtr::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:162: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
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
;src/main.c:165: u8 checkCollision(int direction) { // check optimization
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:166: u8 *headTile=0, *feetTile=0, *waistTile=0;
	ld	hl,#0x0000
	ex	(sp), hl
	ld	de,#0x0000
	ld	bc,#0x0000
;src/main.c:168: switch (direction) {
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
;src/main.c:169: case 0:
00101$:
;src/main.c:170: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
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
;src/main.c:171: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
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
;src/main.c:172: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
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
;src/main.c:173: break;
	jp	00105$
;src/main.c:174: case 1:
00102$:
;src/main.c:175: headTile  = getTilePtr(prota.x - 1, prota.y);
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
;src/main.c:176: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
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
;src/main.c:177: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
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
;src/main.c:178: break;
	jr	00105$
;src/main.c:179: case 2:
00103$:
;src/main.c:180: headTile   = getTilePtr(prota.x, prota.y - 2);
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
;src/main.c:181: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
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
;src/main.c:182: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:183: break;
	jr	00105$
;src/main.c:184: case 3:
00104$:
;src/main.c:185: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
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
;src/main.c:186: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
;src/main.c:187: *waistTile = 0;
	ld	hl,#0x0000
	ld	(hl),#0x00
;src/main.c:189: }
00105$:
;src/main.c:191: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
;src/main.c:192: return 1;
	ld	l,#0x01
	jr	00110$
00107$:
;src/main.c:194: return 0;
	ld	l,#0x00
00110$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:197: void dibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function dibujarEnemigo
; ---------------------------------
_dibujarEnemigo::
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
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
;src/main.c:202: void dibujarExplosion(TEnemy *enemy) {
;	---------------------------------
; Function dibujarExplosion
; ---------------------------------
_dibujarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:203: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
;src/main.c:204: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
;src/main.c:207: void borrarExplosion() {
;	---------------------------------
; Function borrarExplosion
; ---------------------------------
_borrarExplosion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:208: u8 w = 4 + (enemy->px & 1);
	ld	hl, #_enemy + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:211: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:213: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:217: void borrarEnemigo(TEnemy *enemy) {
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
;src/main.c:219: u8 w = 4 + (enemy->px & 1);
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
;src/main.c:222: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
;src/main.c:224: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	ld	iy,(_mapa)
	ld	-4 (ix),d
	ld	-3 (ix),#0x00
	ld	a,-4 (ix)
	add	a,#0xE8
	ld	-2 (ix),a
	ld	a,-3 (ix)
	adc	a,#0xFF
	ld	-1 (ix),a
	ld	d,-2 (ix)
	ld	l,-1 (ix)
	bit	7, -1 (ix)
	jr	Z,00105$
	ld	a,-4 (ix)
	add	a, #0xEB
	ld	d,a
	ld	a,-3 (ix)
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
;src/main.c:226: enemy->mover = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
	ld	sp, ix
	pop	ix
	ret
;src/main.c:229: void redibujarEnemigo(TEnemy *enemy) {
;	---------------------------------
; Function redibujarEnemigo
; ---------------------------------
_redibujarEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:230: borrarEnemigo(enemy);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_borrarEnemigo
	pop	af
;src/main.c:231: enemy->px = enemy->x;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,(bc)
	ld	(de),a
;src/main.c:232: enemy->py = enemy->y;
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
;src/main.c:233: dibujarEnemigo(enemy);
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	ix
	ret
;src/main.c:236: u8 checkEnemyCollision(int direction, TEnemy *enemy){
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
;src/main.c:238: u8 colisiona = 1;
	ld	-9 (ix),#0x01
;src/main.c:240: switch (direction) {
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
	ld	hl,#0x0001
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/main.c:257: enemy->muerto = SI;
	ld	hl,#0x0008
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/main.c:264: enemy->mira = M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/main.c:240: switch (direction) {
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
;src/main.c:241: case 0:
;src/main.c:242: break;
	jp	00135$
;src/main.c:243: case 1:
;src/main.c:244: break;
	jp	00135$
;src/main.c:245: case 2:
00103$:
;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:250: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0002
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,(bc)
	ld	l,a
	ld	h,#0x00
	ld	a,-8 (ix)
	sub	a, l
	ld	a,-7 (ix)
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
;src/main.c:251: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00119$
00111$:
;src/main.c:253: if(enemy->y>cu.y){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	ld	hl, #(_cu + 0x0001) + 0
	ld	l,(hl)
	ld	a,l
	sub	a, e
	jr	NC,00108$
;src/main.c:254: if(enemy->y - (cu.y + G_KNIFEY_0_H -2) >= 2){
	ld	d,#0x00
	ld	h,#0x00
	push	de
	ld	de,#0x0006
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
;src/main.c:255: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00119$
00105$:
;src/main.c:257: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00119$
00108$:
;src/main.c:260: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00119$
00115$:
;src/main.c:264: enemy->mira = M_abajo;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x03
;src/main.c:267: case 3:
00119$:
;src/main.c:268: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:269: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:270: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/main.c:272: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
	ld	hl, #_cu + 0
	ld	e,(hl)
	ld	d,#0x00
	ld	hl,#0x0002
	add	hl,de
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,-8 (ix)
	sub	a, c
	ld	a,-7 (ix)
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
;src/main.c:273: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00135$
00127$:
;src/main.c:276: if(cu.y > enemy->y){ //si el cu esta abajo
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	ld	a,e
	sub	a, c
	jr	NC,00124$
;src/main.c:277: if( cu.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el cu
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
;src/main.c:278: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00135$
00121$:
;src/main.c:281: enemy->muerto = SI;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x01
	jr	00135$
00124$:
;src/main.c:285: colisiona = 0;
	ld	-9 (ix),#0x00
	jr	00135$
00131$:
;src/main.c:289: enemy->mira = M_arriba;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x02
;src/main.c:292: }
00135$:
;src/main.c:293: return colisiona;
	ld	l,-9 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/main.c:296: void moverEnemigoArriba(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoArriba
; ---------------------------------
_moverEnemigoArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:297: enemy->y--;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	e,(hl)
	dec	e
	ld	(hl),e
;src/main.c:298: enemy->y--;
	dec	e
	ld	(hl),e
;src/main.c:299: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:302: void moverEnemigoAbajo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoAbajo
; ---------------------------------
_moverEnemigoAbajo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:303: enemy->y++;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:304: enemy->y++;
	inc	a
	ld	(de),a
;src/main.c:305: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	pop	ix
	ret
;src/main.c:308: void moverEnemigoDerecha(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoDerecha
; ---------------------------------
_moverEnemigoDerecha::
;src/main.c:309: enemy->x++;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:310: enemy->x++;
	inc	a
	ld	(bc),a
;src/main.c:311: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:314: void moverEnemigoIzquierda(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigoIzquierda
; ---------------------------------
_moverEnemigoIzquierda::
;src/main.c:315: enemy->x--;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:316: enemy->x--;
	add	a,#0xFF
	ld	(bc),a
;src/main.c:317: enemy->mover = SI;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x01
	ret
;src/main.c:320: void moverEnemigo(TEnemy *enemy){
;	---------------------------------
; Function moverEnemigo
; ---------------------------------
_moverEnemigo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:321: if(!enemy->muerto){
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	NZ,00110$
;src/main.c:322: if(!checkEnemyCollision(enemy->mira, enemy)){
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
;src/main.c:324: switch (enemy->mira) {
	ld	e,(hl)
	ld	a,#0x03
	sub	a, e
	jr	C,00110$
	ld	d,#0x00
	ld	hl,#00124$
	add	hl,de
	add	hl,de
;src/main.c:326: case 0:
;src/main.c:328: break;
;src/main.c:329: case 1:
;src/main.c:331: break;
;src/main.c:332: case 2:
	jp	(hl)
00124$:
	jr	00110$
	jr	00110$
	jr	00103$
	jr	00104$
	jr	00110$
	jr	00110$
00103$:
;src/main.c:333: moverEnemigoArriba(enemy);
	push	bc
	call	_moverEnemigoArriba
	pop	af
;src/main.c:334: break;
	jr	00110$
;src/main.c:335: case 3:
00104$:
;src/main.c:336: moverEnemigoAbajo(enemy);
	push	bc
	call	_moverEnemigoAbajo
	pop	af
;src/main.c:338: }
00110$:
	pop	ix
	ret
;src/main.c:343: void avanzarMapa() {
;	---------------------------------
; Function avanzarMapa
; ---------------------------------
_avanzarMapa::
;src/main.c:344: if(num_mapa < NUM_MAPAS -1) {
	ld	a,(#_num_mapa + 0)
	sub	a, #0x02
	jp	NC,_menuFin
;src/main.c:345: mapa = mapas[++num_mapa];
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
;src/main.c:346: prota.x = prota.px = 2;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x02
	ld	hl,#_prota
	ld	(hl),#0x02
;src/main.c:347: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
;src/main.c:348: dibujarMapa();
;src/main.c:352: menuFin();
	ld	(hl), #0x01
	jp	_dibujarMapa
;src/main.c:356: void moverIzquierda() {
;	---------------------------------
; Function moverIzquierda
; ---------------------------------
_moverIzquierda::
;src/main.c:357: prota.mira = M_izquierda;
	ld	bc,#_prota+0
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x01
;src/main.c:358: if (!checkCollision(M_izquierda)) {
	push	bc
	ld	hl,#0x0001
	push	hl
	call	_checkCollision
	pop	af
	pop	bc
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:359: prota.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:360: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:361: prota.sprite = g_hero_left;
	ld	hl,#_g_hero_left
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:365: void moverDerecha() {
;	---------------------------------
; Function moverDerecha
; ---------------------------------
_moverDerecha::
;src/main.c:366: prota.mira = M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:367: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
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
;src/main.c:368: prota.x++;
	inc	c
	ld	hl,#_prota
	ld	(hl),c
;src/main.c:369: prota.mover = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:370: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
	ret
00104$:
;src/main.c:372: }else if( prota.x + G_HERO_W >= 80){
	ld	a,e
	or	a, a
	ret	NZ
;src/main.c:373: avanzarMapa();
	jp  _avanzarMapa
;src/main.c:377: void moverArriba() {
;	---------------------------------
; Function moverArriba
; ---------------------------------
_moverArriba::
;src/main.c:378: prota.mira = M_arriba;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x02
;src/main.c:379: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
	ld	hl,#0x0002
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:380: prota.y--;
	ld	hl,#_prota + 1
	ld	c,(hl)
	dec	c
	ld	(hl),c
;src/main.c:381: prota.y--;
	dec	c
	ld	(hl),c
;src/main.c:382: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:383: prota.sprite = g_hero_up;
	ld	hl,#_g_hero_up
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:387: void moverAbajo() {
;	---------------------------------
; Function moverAbajo
; ---------------------------------
_moverAbajo::
;src/main.c:388: prota.mira = M_abajo;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x03
;src/main.c:389: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
	ld	hl,#0x0003
	push	hl
	call	_checkCollision
	pop	af
	ld	a,l
	or	a, a
	ret	NZ
;src/main.c:390: prota.y++;
	ld	bc,#_prota + 1
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:391: prota.y++;
	inc	a
	ld	(bc),a
;src/main.c:392: prota.mover  = SI;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x01
;src/main.c:393: prota.sprite = g_hero_down;
	ld	hl,#_g_hero_down
	ld	((_prota + 0x0004)), hl
	ret
;src/main.c:397: void dibujarCuchillo() {
;	---------------------------------
; Function dibujarCuchillo
; ---------------------------------
_dibujarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:398: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
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
;src/main.c:399: if(cu.eje == E_X){
	ld	hl, #_cu + 8
	ld	c,(hl)
;src/main.c:400: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	ld	-2 (ix),b
	ld	-1 (ix),e
;src/main.c:399: if(cu.eje == E_X){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;src/main.c:400: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
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
;src/main.c:403: else if(cu.eje == E_Y){
	dec	c
	jr	NZ,00106$
;src/main.c:404: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
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
;src/main.c:408: void borrarCuchillo() {
;	---------------------------------
; Function borrarCuchillo
; ---------------------------------
_borrarCuchillo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:410: u8 w = 2 + (cu.px & 1);
	ld	hl, #_cu + 2
	ld	c,(hl)
	ld	a,c
	and	a, #0x01
	ld	b,a
	inc	b
	inc	b
;src/main.c:411: u8 h = 2 + (cu.py & 3 ? 1 : 0);
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
;src/main.c:412: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
;src/main.c:413: if(!cu.mover){
	ld	a, (#_cu + 9)
	or	a, a
	jr	NZ,00103$
;src/main.c:414: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:418: void redibujarCuchillo( ) {
;	---------------------------------
; Function redibujarCuchillo
; ---------------------------------
_redibujarCuchillo::
;src/main.c:419: borrarCuchillo();
	call	_borrarCuchillo
;src/main.c:420: cu.px = cu.x;
	ld	bc,#_cu + 2
	ld	a, (#_cu + 0)
	ld	(bc),a
;src/main.c:421: cu.py = cu.y;
	ld	bc,#_cu + 3
	ld	a, (#_cu + 1)
	ld	(bc),a
;src/main.c:422: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:425: void lanzarCuchillo(){
;	---------------------------------
; Function lanzarCuchillo
; ---------------------------------
_lanzarCuchillo::
;src/main.c:427: if(!cu.lanzado){
	ld	a, (#(_cu + 0x0006) + 0)
	or	a, a
	ret	NZ
;src/main.c:429: if(prota.mira == M_derecha){
	ld	hl, #_prota + 7
	ld	e,(hl)
;src/main.c:430: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
	ld	bc,#_prota + 1
;src/main.c:432: cu.direccion = M_derecha;
;src/main.c:434: cu.y=prota.y + G_HERO_H /2;
;src/main.c:435: cu.sprite=g_knifeX_0;
;src/main.c:436: cu.eje = E_X;
;src/main.c:429: if(prota.mira == M_derecha){
	ld	a,e
	or	a, a
	jr	NZ,00118$
;src/main.c:430: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
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
;src/main.c:431: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:432: cu.direccion = M_derecha;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x00
;src/main.c:433: cu.x=prota.x + G_HERO_W;
	ld	a, (#_prota + 0)
	add	a, #0x07
	ld	(#_cu),a
;src/main.c:434: cu.y=prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:435: cu.sprite=g_knifeX_0;
	ld	hl,#_g_knifeX_0
	ld	((_cu + 0x0004)), hl
;src/main.c:436: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:437: dibujarCuchillo();
	jp  _dibujarCuchillo
00118$:
;src/main.c:440: else if(prota.mira == M_izquierda){
	ld	a,e
	dec	a
	jr	NZ,00115$
;src/main.c:441: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
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
;src/main.c:442: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:443: cu.direccion = M_izquierda;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x01
;src/main.c:444: cu.x = prota.x - G_KNIFEX_0_W;
	ld	a, (#_prota + 0)
	add	a,#0xFC
	ld	(#_cu),a
;src/main.c:445: cu.y = prota.y + G_HERO_H /2;
	ld	a,(bc)
	add	a, #0x0B
	ld	(#(_cu + 0x0001)),a
;src/main.c:446: cu.sprite = g_knifeX_1;
	ld	hl,#_g_knifeX_1
	ld	((_cu + 0x0004)), hl
;src/main.c:447: cu.eje = E_X;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x00
;src/main.c:448: dibujarCuchillo();
	jp  _dibujarCuchillo
00115$:
;src/main.c:451: else if(prota.mira == M_abajo){
	ld	a,e
	sub	a, #0x03
	jr	NZ,00112$
;src/main.c:453: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
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
;src/main.c:454: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:455: cu.direccion = M_abajo;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x03
;src/main.c:456: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:457: cu.y = prota.y + G_HERO_H;
	ld	a,(bc)
	add	a, #0x16
	ld	(#(_cu + 0x0001)),a
;src/main.c:458: cu.sprite = g_knifeY_0;
	ld	hl,#_g_knifeY_0
	ld	((_cu + 0x0004)), hl
;src/main.c:459: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:460: dibujarCuchillo();
	jp  _dibujarCuchillo
00112$:
;src/main.c:463: else if(prota.mira == M_arriba){
	ld	a,e
	sub	a, #0x02
	ret	NZ
;src/main.c:464: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
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
;src/main.c:465: cu.lanzado = SI;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x01
;src/main.c:466: cu.direccion = M_arriba;
	ld	hl,#(_cu + 0x0007)
	ld	(hl),#0x02
;src/main.c:467: cu.x = prota.x + G_HERO_W / 2;
	ld	a, (#_prota + 0)
	add	a, #0x03
	ld	(#_cu),a
;src/main.c:468: cu.y = prota.y;
	ld	a,(bc)
	ld	(#(_cu + 0x0001)),a
;src/main.c:469: cu.sprite = g_knifeY_1;
	ld	hl,#_g_knifeY_1
	ld	((_cu + 0x0004)), hl
;src/main.c:470: cu.eje = E_Y;
	ld	hl,#(_cu + 0x0008)
	ld	(hl),#0x01
;src/main.c:471: dibujarCuchillo();
	jp  _dibujarCuchillo
;src/main.c:477: void comprobarTeclado() {
;	---------------------------------
; Function comprobarTeclado
; ---------------------------------
_comprobarTeclado::
;src/main.c:478: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:480: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:481: if (cpct_isKeyPressed(Key_CursorLeft))
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:482: moverIzquierda();
	jp	NZ,_moverIzquierda
;src/main.c:483: else if (cpct_isKeyPressed(Key_CursorRight))
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:484: moverDerecha();
	jp	NZ,_moverDerecha
;src/main.c:485: else if (cpct_isKeyPressed(Key_CursorUp))
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:486: moverArriba();
	jp	NZ,_moverArriba
;src/main.c:487: else if (cpct_isKeyPressed(Key_CursorDown))
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
;src/main.c:488: moverAbajo();
	jp	NZ,_moverAbajo
;src/main.c:489: else if (cpct_isKeyPressed(Key_Space))
	ld	hl,#0x8005
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/main.c:490: lanzarCuchillo();
	jp  _lanzarCuchillo
;src/main.c:494: u8 checkKnifeCollision(int direction){
;	---------------------------------
; Function checkKnifeCollision
; ---------------------------------
_checkKnifeCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:496: u8 colisiona = 1;
	ld	c,#0x01
;src/main.c:498: switch (direction) {
	bit	7, 5 (ix)
	jp	NZ,00125$
	ld	a,#0x03
	cp	a, 4 (ix)
	ld	a,#0x00
	sbc	a, 5 (ix)
	jp	PO, 00159$
	xor	a, #0x80
00159$:
	jp	M,00125$
	ld	e,4 (ix)
	ld	d,#0x00
	ld	hl,#00160$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00160$:
	jp	00125$
	jp	00125$
	jp	00103$
	jp	00114$
;src/main.c:499: case 0:
;src/main.c:501: break;
	jp	00125$
;src/main.c:502: case 1:
;src/main.c:504: break;
	jp	00125$
;src/main.c:505: case 2:
00103$:
;src/main.c:507: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
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
	jp	PO, 00161$
	xor	a, #0x80
00161$:
	jp	M,00114$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	M,00114$
;src/main.c:510: if(cu.y>enemy->y){
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	a,(#(_enemy + 0x0001) + 0)
	sub	a, c
	ld	a,#0x00
	rla
;src/main.c:523: case 3:
00114$:
;src/main.c:525: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
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
	jp	PO, 00163$
	xor	a, #0x80
00163$:
	jp	M,00121$
	ld	de,#0x0004
	add	hl,de
	ld	a,l
	sub	a, c
	ld	a,h
	sbc	a, b
	jp	PO, 00164$
	xor	a, #0x80
00164$:
	jp	P,00122$
00121$:
;src/main.c:526: colisiona = 0;
	ld	c,#0x00
	jr	00125$
00122$:
;src/main.c:528: if(cu.y<enemy->y){
	ld	hl, #(_cu + 0x0001) + 0
	ld	c,(hl)
	ld	hl, #(_enemy + 0x0001) + 0
	ld	l,(hl)
	ld	a,c
	sub	a, l
	jr	NC,00119$
;src/main.c:529: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
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
;src/main.c:530: colisiona = 0;
	ld	c,#0x00
	jr	00125$
00116$:
;src/main.c:532: colisiona = 1;
	ld	c,#0x01
	jr	00125$
00119$:
;src/main.c:536: colisiona = 0;
	ld	c,#0x00
;src/main.c:539: }
00125$:
;src/main.c:540: return colisiona;
	ld	l,c
	pop	ix
	ret
;src/main.c:543: void moverCuchillo(){
;	---------------------------------
; Function moverCuchillo
; ---------------------------------
_moverCuchillo::
;src/main.c:545: if(cu.lanzado){
	ld	bc,#_cu+0
	ld	a, (#_cu + 6)
	or	a, a
	ret	Z
;src/main.c:546: cu.mover = 1;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
;src/main.c:547: if(cu.direccion == M_derecha){
	ld	hl, #_cu + 7
	ld	l,(hl)
;src/main.c:549: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
	ld	e, c
	ld	d, b
	inc	de
;src/main.c:547: if(cu.direccion == M_derecha){
	ld	a,l
	or	a, a
	jr	NZ,00128$
;src/main.c:549: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
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
;src/main.c:550: cu.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/main.c:551: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00102$:
;src/main.c:555: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00128$:
;src/main.c:558: else if(cu.direccion == M_izquierda){
	ld	a,l
	dec	a
	jr	NZ,00125$
;src/main.c:559: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
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
;src/main.c:560: cu.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/main.c:561: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00105$:
;src/main.c:564: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00125$:
;src/main.c:567: else if(cu.direccion == M_arriba){
	ld	a,l
	sub	a, #0x02
	jr	NZ,00122$
;src/main.c:568: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
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
;src/main.c:569: if(!checkKnifeCollision(M_arriba)){
	push	de
	ld	hl,#0x0002
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	de
	ld	a,l
	or	a, a
	jr	NZ,00108$
;src/main.c:570: cu.y--;
	ld	a,(de)
	add	a,#0xFF
	ld	(de),a
;src/main.c:571: cu.y--;
	add	a,#0xFF
	ld	(de),a
;src/main.c:572: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00108$:
;src/main.c:575: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00111$:
;src/main.c:578: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00122$:
;src/main.c:583: else if(cu.direccion == M_abajo){
	ld	a,l
	sub	a, #0x03
	ret	NZ
;src/main.c:584: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
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
;src/main.c:585: if(!checkKnifeCollision(M_abajo)){
	push	de
	ld	hl,#0x0003
	push	hl
	call	_checkKnifeCollision
	pop	af
	pop	de
	ld	a,l
	or	a, a
	jr	NZ,00114$
;src/main.c:586: cu.y++;
	ld	a,(de)
	inc	a
	ld	(de),a
;src/main.c:587: cu.y++;
	inc	a
	ld	(de),a
;src/main.c:588: cu.mover = SI;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x01
	ret
00114$:
;src/main.c:591: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
00117$:
;src/main.c:594: cu.mover=NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
	ret
;src/main.c:600: void barraPuntuacionInicial(){
;	---------------------------------
; Function barraPuntuacionInicial
; ---------------------------------
_barraPuntuacionInicial::
;src/main.c:605: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
	ld	hl,#0x0200
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:606: cpct_drawStringM0("SCORE", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:607: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
	ld	hl,#0x0E00
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:608: cpct_drawStringM0("00000", memptr, 15, 0);
	ld	hl,#0x000F
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:611: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
	ld	hl,#0x0E1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:612: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
	ld	hl,#0x0003
	push	hl
	push	bc
	ld	hl,#___str_3
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:614: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
	ld	hl,#0x023C
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:615: cpct_drawStringM0("LIVES", memptr, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_4
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:617: for(i=0; i<5; i++){
	ld	bc,#0x0000
00102$:
;src/main.c:618: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
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
;src/main.c:617: for(i=0; i<5; i++){
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
;src/main.c:623: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
;	---------------------------------
; Function borrarPantallaArriba
; ---------------------------------
_borrarPantallaArriba::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:626: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:627: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
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
;src/main.c:628: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
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
;src/main.c:629: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
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
;src/main.c:632: void menuInicio(){
;	---------------------------------
; Function menuInicio
; ---------------------------------
_menuInicio::
;src/main.c:636: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:638: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
	ld	hl,#0x0F1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:639: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_5
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:641: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF0F0
	push	hl
	ld	hl,#_g_text_0
	push	hl
	call	_cpct_drawSprite
;src/main.c:642: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF118
	push	hl
	ld	hl,#_g_text_1
	push	hl
	call	_cpct_drawSprite
;src/main.c:665: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
	ld	hl,#0xA008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:666: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_6
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:668: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
	ld	hl,#0xAA0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:669: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_7
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:672: do{
00106$:
;src/main.c:673: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:677: if(cpct_isKeyPressed(Key_M)){
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00107$
;src/main.c:678: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:679: do{
00101$:
;src/main.c:681: } while(!cpct_isKeyPressed(Key_S));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
00107$:
;src/main.c:683: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
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
;src/main.c:686: void inicializarCPC() {
;	---------------------------------
; Function inicializarCPC
; ---------------------------------
_inicializarCPC::
;src/main.c:687: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:688: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:689: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:690: cpct_setPalette(g_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:691: cpct_akp_musicInit(G_song);
	ld	hl,#_G_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
	ret
;src/main.c:694: void inicializarEnemy() {
;	---------------------------------
; Function inicializarEnemy
; ---------------------------------
_inicializarEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:700: actual = enemy;
	ld	bc,#_enemy+0
;src/main.c:701: while(--i){
	ld	-1 (ix),#0x05
00101$:
	dec	-1 (ix)
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00104$
;src/main.c:702: actual->x = actual->px = spawnX[i];
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,#<(_spawnX)
	add	a, -1 (ix)
	ld	l,a
	ld	a,#>(_spawnX)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(de),a
	ld	(bc),a
;src/main.c:703: actual->y = actual->py = spawnY[i];
	push	bc
	pop	iy
	inc	iy
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a,#<(_spawnY)
	add	a, -1 (ix)
	ld	l,a
	ld	a,#>(_spawnY)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	(de),a
	ld	0 (iy), a
;src/main.c:704: actual->mover  = NO;
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:705: actual->mira   = M_abajo;
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x03
;src/main.c:706: actual->sprite = g_enemy;
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#<(_g_enemy)
	inc	hl
	ld	(hl),#>(_g_enemy)
;src/main.c:707: actual->muerto = NO;
	ld	hl,#0x0008
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:708: actual->muertes = 0;
	ld	hl,#0x000C
	add	hl,bc
	ld	(hl),#0x00
;src/main.c:709: actual->patroling = SI;
	ld	hl,#0x0009
	add	hl,bc
	ld	(hl),#0x01
;src/main.c:711: dibujarEnemigo(actual);
	push	bc
	push	bc
	call	_dibujarEnemigo
	pop	af
	pop	bc
;src/main.c:713: ++actual;
	ld	hl,#0x000D
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00101$
00104$:
	inc	sp
	pop	ix
	ret
;src/main.c:717: void inicializarJuego() {
;	---------------------------------
; Function inicializarJuego
; ---------------------------------
_inicializarJuego::
;src/main.c:719: num_mapa = 0;
	ld	hl,#_num_mapa + 0
	ld	(hl), #0x00
;src/main.c:720: mapa = mapas[num_mapa];
	ld	hl, #_mapas + 0
	ld	a,(hl)
	ld	iy,#_mapa
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_mapa + 1),a
;src/main.c:721: cpct_etm_setTileset2x4(g_tileset);
	ld	hl,#_g_tileset
	call	_cpct_etm_setTileset2x4
;src/main.c:723: dibujarMapa();
	call	_dibujarMapa
;src/main.c:725: borrarPantallaArriba(0, 0, 40, 1);
	ld	hl,#0x0128
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_borrarPantallaArriba
	pop	af
	pop	af
;src/main.c:726: barraPuntuacionInicial();
	call	_barraPuntuacionInicial
;src/main.c:729: prota.x = prota.px = 4;
	ld	hl,#(_prota + 0x0002)
	ld	(hl),#0x04
	ld	hl,#_prota
	ld	(hl),#0x04
;src/main.c:730: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	ld	hl,#(_prota + 0x0003)
	ld	(hl),#0x68
	ld	hl,#(_prota + 0x0001)
	ld	(hl),#0x68
;src/main.c:731: prota.mover  = NO;
	ld	hl,#(_prota + 0x0006)
	ld	(hl),#0x00
;src/main.c:732: prota.mira=M_derecha;
	ld	hl,#(_prota + 0x0007)
	ld	(hl),#0x00
;src/main.c:733: prota.sprite = g_hero;
	ld	hl,#_g_hero
	ld	((_prota + 0x0004)), hl
;src/main.c:737: cu.x = cu.px = 0;
	ld	hl,#(_cu + 0x0002)
	ld	(hl),#0x00
	ld	hl,#_cu
	ld	(hl),#0x00
;src/main.c:738: cu.y = cu.py = 0;
	ld	hl,#(_cu + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_cu + 0x0001)
	ld	(hl),#0x00
;src/main.c:739: cu.lanzado = NO;
	ld	hl,#(_cu + 0x0006)
	ld	(hl),#0x00
;src/main.c:740: cu.mover = NO;
	ld	hl,#(_cu + 0x0009)
	ld	(hl),#0x00
;src/main.c:742: inicializarEnemy();
	call	_inicializarEnemy
;src/main.c:744: dibujarProta();
	jp  _dibujarProta
;src/main.c:747: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:751: inicializarCPC();
	call	_inicializarCPC
;src/main.c:752: menuInicio();
	call	_menuInicio
;src/main.c:754: inicializarJuego();
	call	_inicializarJuego
;src/main.c:755: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:757: while (1) {
00122$:
;src/main.c:760: actual = enemy;
;src/main.c:762: comprobarTeclado();
	call	_comprobarTeclado
;src/main.c:763: moverCuchillo();
	call	_moverCuchillo
;src/main.c:765: while(--i){
	ld	de,#_enemy
	ld	c,#0x05
00101$:
	dec c
	jr	Z,00103$
;src/main.c:766: moverEnemigo(actual);
	push	bc
	push	de
	push	de
	call	_moverEnemigo
	pop	af
	pop	de
	pop	bc
;src/main.c:767: ++actual;
	ld	hl,#0x000D
	add	hl,de
	ld	e,l
	ld	d,h
	jr	00101$
00103$:
;src/main.c:770: actual = enemy;
	ld	bc,#_enemy
;src/main.c:772: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	pop	bc
;src/main.c:774: if (prota.mover) {
	ld	de,#_prota+6
	ld	a,(de)
	or	a, a
	jr	Z,00105$
;src/main.c:775: redibujarProta();
	push	bc
	push	de
	call	_redibujarProta
	pop	de
	pop	bc
;src/main.c:776: prota.mover = NO;
	xor	a, a
	ld	(de),a
00105$:
;src/main.c:778: if(cu.lanzado && cu.mover){
	ld	hl,#_cu + 6
	ld	e,(hl)
	ld	hl,#_cu + 9
	ld	a,e
	or	a, a
	jr	Z,00110$
	ld	a,(hl)
	or	a, a
	jr	Z,00110$
;src/main.c:779: redibujarCuchillo();
	push	bc
	call	_redibujarCuchillo
	pop	bc
	jr	00137$
00110$:
;src/main.c:780: }else if (cu.lanzado && !cu.mover){
	ld	a,e
	or	a, a
	jr	Z,00137$
	ld	a,(hl)
	or	a, a
	jr	NZ,00137$
;src/main.c:781: borrarCuchillo();
	push	bc
	call	_borrarCuchillo
	pop	bc
;src/main.c:784: while(--i){
00137$:
	ld	e,#0x05
00118$:
	dec	e
	ld	a,e
	or	a, a
	jr	Z,00120$
;src/main.c:785: if(actual->mover){
	push	bc
	pop	iy
	ld	a,6 (iy)
	or	a, a
	jr	Z,00114$
;src/main.c:786: redibujarEnemigo(actual);
	push	bc
	push	de
	push	bc
	call	_redibujarEnemigo
	pop	af
	pop	de
	pop	bc
00114$:
;src/main.c:788: if (actual->muerto && actual->muertes == 0){
	push	bc
	pop	iy
	ld	a,8 (iy)
	or	a, a
	jr	Z,00116$
	ld	hl,#0x000C
	add	hl,bc
	ld	a,(hl)
	or	a, a
	jr	NZ,00116$
;src/main.c:789: borrarEnemigo(actual);
	push	hl
	push	bc
	push	de
	push	bc
	call	_borrarEnemigo
	pop	af
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	call	_dibujarExplosion
	pop	af
	pop	de
	pop	bc
	pop	hl
;src/main.c:792: actual->muertes++;
	ld	d,(hl)
	inc	d
	ld	(hl),d
;src/main.c:793: actual->x = 0;
	xor	a, a
	ld	(bc),a
;src/main.c:794: actual->y = 0;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl),#0x00
00116$:
;src/main.c:796: ++actual;
	ld	hl,#0x000D
	add	hl,bc
	ld	c,l
	ld	b,h
	jr	00118$
00120$:
;src/main.c:798: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jp	00122$
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
