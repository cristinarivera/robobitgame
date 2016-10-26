;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module pathfinding
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _abs
	.globl _getTilePtr
	.globl _camino
	.globl _sol_tam
	.globl _bitWeights
	.globl _anyadirALista
	.globl _adjacentTiles
	.globl _pathFinding
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sol_tam::
	.ds 1
_camino::
	.ds 200
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
;src/pathfinding.c:10: u8 anyadirALista(u8 x, u8 y){
;	---------------------------------
; Function anyadirALista
; ---------------------------------
_anyadirALista::
;src/pathfinding.c:11: u8 anyadido = 0;
	ld	c,#0x00
;src/pathfinding.c:13: if(sol_tam < CAMINO_TAM){
	ld	a,(#_sol_tam + 0)
	sub	a, #0xC8
	jr	NC,00102$
;src/pathfinding.c:14: camino[sol_tam] = x;
	ld	bc,#_camino+0
	ld	hl,(_sol_tam)
	ld	h,#0x00
	add	hl,bc
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;src/pathfinding.c:15: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:16: camino[sol_tam] = y;
	ld	hl,(_sol_tam)
	ld	h,#0x00
	add	hl,bc
	ld	iy,#3
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;src/pathfinding.c:17: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:18: anyadido = 1;
	ld	c,#0x01
00102$:
;src/pathfinding.c:21: return anyadido;
	ld	l,c
	ret
_bitWeights:
	.dw #0x0001
	.dw #0x0002
	.dw #0x0004
	.dw #0x0008
	.dw #0x0010
	.dw #0x0020
	.dw #0x0040
	.dw #0x0080
;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
;	---------------------------------
; Function adjacentTiles
; ---------------------------------
_adjacentTiles::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-33
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:26: u8 resultado = 4;
	ld	-17 (ix),#0x04
;src/pathfinding.c:28: i16 dist1 = 0;
	ld	-19 (ix),#0x00
	ld	-18 (ix),#0x00
;src/pathfinding.c:29: i16 dist2 = 0;
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
;src/pathfinding.c:30: i16 dist3 = 0;
	ld	-23 (ix),#0x00
	ld	-22 (ix),#0x00
;src/pathfinding.c:34: i16 heu_derecha = 0;
	ld	-27 (ix),#0x00
	ld	-26 (ix),#0x00
;src/pathfinding.c:35: i16 heu_izquierda = 0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/pathfinding.c:36: i16 heu_arriba = 0;
	ld	-31 (ix),#0x00
	ld	-30 (ix),#0x00
;src/pathfinding.c:37: i16 heu_abajo = 0;
	ld	-29 (ix),#0x00
	ld	-28 (ix),#0x00
;src/pathfinding.c:43: if(y < f_y)
	ld	a,5 (ix)
	sub	a, 7 (ix)
	ld	a,#0x00
	rla
	ld	c,a
;src/pathfinding.c:41: if(x == f_x){
	ld	a,4 (ix)
	sub	a, 6 (ix)
	jr	NZ,00124$
;src/pathfinding.c:43: if(y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00102$
;src/pathfinding.c:44: heu_abajo = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
00102$:
;src/pathfinding.c:46: if(y > f_y)
	ld	a,7 (ix)
	sub	a, 5 (ix)
	jp	NC,00125$
;src/pathfinding.c:47: heu_arriba = -1;
	ld	-31 (ix),#0xFF
	ld	-30 (ix),#0xFF
	jp	00125$
00124$:
;src/pathfinding.c:51: if(x < f_x)
	ld	a,4 (ix)
	sub	a, 6 (ix)
	ld	a,#0x00
	rla
	ld	b,a
;src/pathfinding.c:53: if(x > f_x)
	ld	a,6 (ix)
	sub	a, 4 (ix)
	ld	a,#0x00
	rla
	ld	e,a
;src/pathfinding.c:49: }else if(y == f_y){
	ld	a,5 (ix)
	sub	a, 7 (ix)
	jr	NZ,00121$
;src/pathfinding.c:51: if(x < f_x)
	ld	a,b
	or	a, a
	jr	Z,00106$
;src/pathfinding.c:52: heu_derecha = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
00106$:
;src/pathfinding.c:53: if(x > f_x)
	ld	a,e
	or	a, a
	jr	Z,00125$
;src/pathfinding.c:54: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
	jr	00125$
00121$:
;src/pathfinding.c:59: if(x < f_x){
	ld	a,b
	or	a, a
	jr	Z,00118$
;src/pathfinding.c:60: if(y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00110$
;src/pathfinding.c:61: heu_abajo = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
	jr	00111$
00110$:
;src/pathfinding.c:63: heu_arriba = -1;
	ld	-31 (ix),#0xFF
	ld	-30 (ix),#0xFF
00111$:
;src/pathfinding.c:65: heu_derecha = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
	jr	00125$
00118$:
;src/pathfinding.c:66: }else if(x > f_x){
	ld	a,e
	or	a, a
	jr	Z,00125$
;src/pathfinding.c:68: if(y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00113$
;src/pathfinding.c:69: heu_abajo = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
	jr	00114$
00113$:
;src/pathfinding.c:71: heu_arriba = -1;
	ld	-31 (ix),#0xFF
	ld	-30 (ix),#0xFF
00114$:
;src/pathfinding.c:73: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
00125$:
;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
	ld	a,5 (ix)
	add	a,#0xFE
	ld	-7 (ix), a
	push	af
	inc	sp
	ld	a,4 (ix)
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
	ld	a,4 (ix)
	add	a, #0x04
	ld	-16 (ix),a
;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	a,6 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,7 (ix)
	ld	-13 (ix),a
	ld	-12 (ix),#0x00
	ld	a,5 (ix)
	ld	-11 (ix),a
	ld	-10 (ix),#0x00
	ld	a,-4 (ix)
	sub	a, -2 (ix)
	ld	-9 (ix),a
	ld	a,-3 (ix)
	sbc	a, -1 (ix)
	ld	-8 (ix),a
;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
	ld	a,#0x02
	sub	a, c
	jp	C,00127$
;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
	ld	h,-7 (ix)
	ld	l,-16 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00127$
;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	a,-11 (ix)
	add	a,#0xFE
	ld	-15 (ix),a
	ld	a,-10 (ix)
	adc	a,#0xFF
	ld	-14 (ix),a
	ld	a,-13 (ix)
	sub	a, -15 (ix)
	ld	-15 (ix),a
	ld	a,-12 (ix)
	sbc	a, -14 (ix)
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-14 (ix),h
	ld	-15 (ix),l
	ld	a,-6 (ix)
	add	a, -15 (ix)
	ld	-15 (ix),a
	ld	a,-5 (ix)
	adc	a, -14 (ix)
	ld	-14 (ix),a
	ld	a,-15 (ix)
	add	a, -31 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	adc	a, -30 (ix)
	ld	-14 (ix),a
	ld	a,-15 (ix)
	ld	-19 (ix),a
	ld	a,-14 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:81: resultado = 0;
	ld	-17 (ix),#0x00
00127$:
;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 &&
	ld	b,5 (ix)
	inc	b
	inc	b
	push	bc
	inc	sp
	ld	a,4 (ix)
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00135$
;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
	ld	a,5 (ix)
	add	a, #0x16
	ld	b,a
	push	bc
	inc	sp
	ld	a,-16 (ix)
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	-14 (ix),h
	ld	-15 (ix), l
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-15 (ix),a
	ld	a,#0x02
	sub	a, -15 (ix)
	jp	C,00135$
;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-14 (ix),h
	ld	-15 (ix),l
	ld	a,-11 (ix)
	add	a, #0x02
	ld	-6 (ix),a
	ld	a,-10 (ix)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	a,-13 (ix)
	sub	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,-12 (ix)
	sbc	a, -5 (ix)
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	a,-15 (ix)
	add	a, -6 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	adc	a, -5 (ix)
	ld	-14 (ix),a
	ld	a,-15 (ix)
	add	a, -29 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	adc	a, -28 (ix)
	ld	-14 (ix),a
	ld	a,-15 (ix)
	ld	-21 (ix),a
	ld	a,-14 (ix)
	ld	-20 (ix),a
;src/pathfinding.c:87: if(resultado == 0){
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00132$
;src/pathfinding.c:88: if(dist1 > dist2)
	ld	a,-21 (ix)
	sub	a, -19 (ix)
	ld	a,-20 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00304$
	xor	a, #0x80
00304$:
	jp	P,00135$
;src/pathfinding.c:89: resultado = 1;
	ld	-17 (ix),#0x01
	jr	00135$
00132$:
;src/pathfinding.c:91: resultado = 1;
	ld	-17 (ix),#0x01
00135$:
;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
	ld	c,4 (ix)
	dec	c
	push	bc
	ld	a,5 (ix)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	b,(hl)
;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
	ld	a,5 (ix)
	add	a, #0x14
	ld	-15 (ix),a
;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
	ld	a,5 (ix)
	add	a, #0x0B
	ld	-6 (ix),a
;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-13 (ix)
	sub	a, -11 (ix)
	ld	-9 (ix),a
	ld	a,-12 (ix)
	sbc	a, -10 (ix)
	ld	-8 (ix),a
;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
	ld	a,#0x02
	sub	a, b
	jp	C,00148$
;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
	push	bc
	ld	a,-15 (ix)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	b,(hl)
	ld	a,#0x02
	sub	a, b
	jp	C,00148$
;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
	ld	a,-6 (ix)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00148$
;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	dec	bc
	ld	a,-4 (ix)
	sub	a, c
	ld	c,a
	ld	a,-3 (ix)
	sbc	a, b
	ld	b,a
	push	bc
	call	_abs
	ex	(sp),hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_abs
	pop	af
	pop	bc
	add	hl,bc
	pop	de
	push	de
	add	hl,de
	ld	-23 (ix),l
	ld	-22 (ix),h
;src/pathfinding.c:99: if(resultado == 0){
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00145$
;src/pathfinding.c:100: if(dist1 >= dist3)
	ld	a,-19 (ix)
	sub	a, -23 (ix)
	ld	a,-18 (ix)
	sbc	a, -22 (ix)
	jp	PO, 00305$
	xor	a, #0x80
00305$:
	jp	M,00148$
;src/pathfinding.c:101: resultado = 2;
	ld	-17 (ix),#0x02
	jr	00148$
00145$:
;src/pathfinding.c:102: }else if(resultado == 1){
	ld	a,-17 (ix)
	dec	a
	jr	NZ,00142$
;src/pathfinding.c:103: if(dist2 >= dist3)
	ld	a,-21 (ix)
	sub	a, -23 (ix)
	ld	a,-20 (ix)
	sbc	a, -22 (ix)
	jp	PO, 00308$
	xor	a, #0x80
00308$:
	jp	M,00148$
;src/pathfinding.c:104: resultado = 2;
	ld	-17 (ix),#0x02
	jr	00148$
00142$:
;src/pathfinding.c:106: resultado = 2;
	ld	-17 (ix),#0x02
00148$:
;src/pathfinding.c:110: if(*getTilePtr(matriz, (x +1), y) <=2 &&
	ld	b,4 (ix)
	inc	b
	ld	a,5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00167$
;src/pathfinding.c:111: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
	ld	a,4 (ix)
	add	a, #0x05
	ld	b,a
	push	bc
	ld	a,-15 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00167$
;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
	ld	a,-6 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00167$
;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
	ld	a,-2 (ix)
	add	a, #0x01
	ld	-15 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-14 (ix),a
	ld	a,-4 (ix)
	sub	a, -15 (ix)
	ld	-15 (ix),a
	ld	a,-3 (ix)
	sbc	a, -14 (ix)
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-14 (ix),h
	ld	-15 (ix),l
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-5 (ix),h
	ld	-6 (ix),l
	ld	a,-15 (ix)
	add	a, -6 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	adc	a, -5 (ix)
	ld	-14 (ix),a
	ld	a,-15 (ix)
	add	a, -27 (ix)
	ld	-25 (ix),a
	ld	a,-14 (ix)
	adc	a, -26 (ix)
	ld	-24 (ix),a
;src/pathfinding.c:114: if(resultado == 0){
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00164$
;src/pathfinding.c:115: if(dist1 >= dist4)
	ld	a,-19 (ix)
	sub	a, -25 (ix)
	ld	a,-18 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00309$
	xor	a, #0x80
00309$:
	jp	M,00167$
;src/pathfinding.c:116: resultado = 3;
	ld	-17 (ix),#0x03
	jr	00167$
00164$:
;src/pathfinding.c:117: }else if(resultado == 1){
	ld	a,-17 (ix)
	dec	a
	jr	NZ,00161$
;src/pathfinding.c:118: if(dist2 >= dist4)
	ld	a,-21 (ix)
	sub	a, -25 (ix)
	ld	a,-20 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00312$
	xor	a, #0x80
00312$:
	jp	M,00167$
;src/pathfinding.c:119: resultado = 3;
	ld	-17 (ix),#0x03
	jr	00167$
00161$:
;src/pathfinding.c:120: }else if (resultado == 2){
	ld	a,-17 (ix)
	sub	a, #0x02
	jr	NZ,00158$
;src/pathfinding.c:121: if(dist3 >= dist4)
	ld	a,-23 (ix)
	sub	a, -25 (ix)
	ld	a,-22 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00315$
	xor	a, #0x80
00315$:
	jp	M,00167$
;src/pathfinding.c:122: resultado = 3;
	ld	-17 (ix),#0x03
	jr	00167$
00158$:
;src/pathfinding.c:124: resultado = 3;
	ld	-17 (ix),#0x03
00167$:
;src/pathfinding.c:128: return resultado;
	ld	l,-17 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
;	---------------------------------
; Function pathFinding
; ---------------------------------
_pathFinding::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:144: u8 problem = 0;
	ld	-19 (ix),#0x00
;src/pathfinding.c:146: x = s_x;
	ld	a,4 (ix)
	ld	-16 (ix),a
;src/pathfinding.c:147: sol_tam = 0;
	ld	hl,#_sol_tam + 0
	ld	(hl), #0x00
;src/pathfinding.c:148: y = s_y;
	ld	a,5 (ix)
	ld	-14 (ix),a
;src/pathfinding.c:150: k = 0;
	ld	-18 (ix),#0x00
;src/pathfinding.c:151: aux = 1;
	ld	-17 (ix),#0x01
;src/pathfinding.c:152: actual->longitud_camino = 0;
	ld	a,8 (ix)
	ld	-5 (ix),a
	ld	a,9 (ix)
	ld	-4 (ix),a
	ld	a,-5 (ix)
	add	a, #0xE1
	ld	-2 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
;src/pathfinding.c:153: inserted = anyadirALista(x, y);
	ld	h,-14 (ix)
	ld	l,-16 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	ld	-15 (ix),l
;src/pathfinding.c:156: if(!(x == f_x && y == f_y) ){
	ld	a,6 (ix)
	sub	a, -16 (ix)
	jr	NZ,00114$
	ld	a,7 (ix)
	sub	a, -14 (ix)
	jp	Z,00118$
;src/pathfinding.c:157: while (aux){
00114$:
	ld	a,-17 (ix)
	or	a, a
	jp	Z,00119$
;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
	ld	a,6 (ix)
	sub	a, -16 (ix)
	jr	NZ,00113$
	ld	a,7 (ix)
	sub	a, -14 (ix)
	jr	Z,00109$
00113$:
	ld	a,-15 (ix)
	or	a, a
	jr	NZ,00110$
00109$:
;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
	ld	a,-15 (ix)
	or	a, a
	jr	Z,00101$
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	NZ,00102$
00101$:
;src/pathfinding.c:161: problem = 1;
	ld	-19 (ix),#0x01
00102$:
;src/pathfinding.c:164: aux = 0;
	ld	-17 (ix),#0x00
	jr	00114$
00110$:
;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	ld	h,-14 (ix)
	ld	l,-16 (ix)
	push	hl
	call	_adjacentTiles
	pop	af
	pop	af
	pop	af
	ld	-12 (ix),l
;src/pathfinding.c:168: switch(movimiento){
	ld	a,#0x03
	sub	a, -12 (ix)
	jr	C,00114$
;src/pathfinding.c:172: k = k+2;
	ld	a,-18 (ix)
	add	a, #0x02
	ld	-3 (ix),a
;src/pathfinding.c:168: switch(movimiento){
	ld	e,-12 (ix)
	ld	d,#0x00
	ld	hl,#00180$
	add	hl,de
	add	hl,de
;src/pathfinding.c:169: case 0:
	jp	(hl)
00180$:
	jr	00104$
	jr	00105$
	jr	00106$
	jr	00107$
00104$:
;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
	ld	a,-14 (ix)
	add	a,#0xFE
	ld	-6 (ix), a
	push	af
	inc	sp
	ld	a,-16 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	ld	-9 (ix), l
	ld	-15 (ix), l
;src/pathfinding.c:171: y = y-2;
	ld	c,-6 (ix)
	ld	-14 (ix),c
;src/pathfinding.c:172: k = k+2;
	ld	a,-3 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:173: break;
	jp	00114$
;src/pathfinding.c:174: case 1:
00105$:
;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
	ld	a,-14 (ix)
	add	a, #0x02
	ld	-9 (ix), a
	push	af
	inc	sp
	ld	a,-16 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	ld	-6 (ix), l
	ld	-15 (ix), l
;src/pathfinding.c:178: y = y+2;
	ld	c,-9 (ix)
	ld	-14 (ix),c
;src/pathfinding.c:179: k = k+2;
	ld	a,-3 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:180: break;
	jp	00114$
;src/pathfinding.c:181: case 2:
00106$:
;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
	ld	b,-16 (ix)
	dec	b
	push	bc
	ld	a,-14 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_anyadirALista
	pop	af
	pop	bc
	ld	-15 (ix),l
;src/pathfinding.c:185: x = x-1;
	ld	-16 (ix),b
;src/pathfinding.c:186: k = k+2;
	ld	a,-3 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:187: break;
	jp	00114$
;src/pathfinding.c:188: case 3:
00107$:
;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
	ld	a,-16 (ix)
	inc	a
	ld	-9 (ix),a
	ld	h,-14 (ix)
	ld	l,-9 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	ld	-15 (ix),l
;src/pathfinding.c:190: x = x+1;
	ld	a,-9 (ix)
	ld	-16 (ix),a
;src/pathfinding.c:191: k = k+2;
	ld	a,-3 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:194: }
	jp	00114$
00118$:
;src/pathfinding.c:199: problem = 1;
	ld	-19 (ix),#0x01
00119$:
;src/pathfinding.c:201: if(problem == 0){
	ld	a,-19 (ix)
	or	a, a
	jr	NZ,00126$
;src/pathfinding.c:202: if(sol_tam < CAMINO_TAM){
	ld	a,(#_sol_tam + 0)
	sub	a, #0xC8
	jr	NC,00122$
;src/pathfinding.c:203: actual->longitud_camino = sol_tam;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(#_sol_tam + 0)
	ld	(hl),a
	jr	00142$
00122$:
;src/pathfinding.c:205: actual->longitud_camino = CAMINO_TAM;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0xC8
;src/pathfinding.c:207: for (i; i<actual->longitud_camino; i++){
00142$:
	ld	a,-5 (ix)
	add	a, #0x19
	ld	-5 (ix),a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	-13 (ix),#0x00
00129$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,-13 (ix)
	sub	a,(hl)
	jr	NC,00131$
;src/pathfinding.c:208: actual->camino[i] = camino[i];
	ld	a,-13 (ix)
	add	a, -5 (ix)
	ld	-8 (ix),a
	ld	a,#0x00
	adc	a, -4 (ix)
	ld	-7 (ix),a
	ld	a,#<(_camino)
	add	a, -13 (ix)
	ld	-11 (ix),a
	ld	a,#>(_camino)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,-11 (ix)
	ld	(hl),a
;src/pathfinding.c:207: for (i; i<actual->longitud_camino; i++){
	inc	-13 (ix)
	jr	00129$
00126$:
;src/pathfinding.c:212: actual->longitud_camino = 0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
00131$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
