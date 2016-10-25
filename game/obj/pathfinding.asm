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
;src/pathfinding.c:14: camino[sol_tam-1] = x;
	ld	bc,#_camino+0
	ld	hl,#_sol_tam + 0
	ld	e, (hl)
	dec	e
	ld	l,e
	ld	h,#0x00
	add	hl,bc
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
;src/pathfinding.c:15: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:16: camino[sol_tam-1] = y;
	ld	hl,#_sol_tam + 0
	ld	e, (hl)
	dec	e
	ld	l,e
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
;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
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
	ld	-25 (ix),#0x00
	ld	-24 (ix),#0x00
;src/pathfinding.c:29: i16 dist2 = 0;
	ld	-23 (ix),#0x00
	ld	-22 (ix),#0x00
;src/pathfinding.c:30: i16 dist3 = 0;
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
;src/pathfinding.c:34: i16 heu_derecha = 0;
	ld	-27 (ix),#0x00
	ld	-26 (ix),#0x00
;src/pathfinding.c:35: i16 heu_izquierda = 0;
	ld	-31 (ix),#0x00
	ld	-30 (ix),#0x00
;src/pathfinding.c:36: i16 heu_arriba = 0;
	ld	-29 (ix),#0x00
	ld	-28 (ix),#0x00
;src/pathfinding.c:37: i16 heu_abajo = 0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/pathfinding.c:41: if(x == f_x){
	ld	a,4 (ix)
	sub	a, 8 (ix)
	jr	NZ,00124$
;src/pathfinding.c:43: if(y < f_y)
	ld	a,5 (ix)
	sub	a, 9 (ix)
	jr	NC,00102$
;src/pathfinding.c:44: heu_abajo = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
00102$:
;src/pathfinding.c:46: if(y > f_y)
	ld	a,9 (ix)
	sub	a, 5 (ix)
	jp	NC,00125$
;src/pathfinding.c:47: heu_arriba = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
	jp	00125$
00124$:
;src/pathfinding.c:49: }else if(y == f_y){
	ld	a,5 (ix)
	sub	a, 9 (ix)
	jr	NZ,00121$
;src/pathfinding.c:51: if(x < f_x)
	ld	a,4 (ix)
	sub	a, 8 (ix)
	jr	NC,00106$
;src/pathfinding.c:52: heu_derecha = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
00106$:
;src/pathfinding.c:53: if(x > f_x)
	ld	a,8 (ix)
	sub	a, 4 (ix)
	jr	NC,00125$
;src/pathfinding.c:54: heu_izquierda = -1;
	ld	-31 (ix),#0xFF
	ld	-30 (ix),#0xFF
	jr	00125$
00121$:
;src/pathfinding.c:60: if(s_y < f_y)
	ld	a,7 (ix)
	sub	a, 9 (ix)
	ld	a,#0x00
	rla
	ld	c,a
;src/pathfinding.c:59: if(s_x < f_x){
	ld	a,6 (ix)
	sub	a, 8 (ix)
	jr	NC,00118$
;src/pathfinding.c:60: if(s_y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00110$
;src/pathfinding.c:61: heu_abajo = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
	jr	00111$
00110$:
;src/pathfinding.c:63: heu_arriba = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
00111$:
;src/pathfinding.c:65: heu_derecha = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
	jr	00125$
00118$:
;src/pathfinding.c:66: }else if(s_x > f_x){
	ld	a,8 (ix)
	sub	a, 6 (ix)
	jr	NC,00125$
;src/pathfinding.c:68: if(s_y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00113$
;src/pathfinding.c:69: heu_abajo = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
	jr	00114$
00113$:
;src/pathfinding.c:71: heu_arriba = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
00114$:
;src/pathfinding.c:73: heu_izquierda = -1;
	ld	-31 (ix),#0xFF
	ld	-30 (ix),#0xFF
00125$:
;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
	ld	a,5 (ix)
	add	a,#0xFE
	ld	-4 (ix), a
	push	af
	inc	sp
	ld	a,4 (ix)
	push	af
	inc	sp
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2){
	ld	a,4 (ix)
	add	a, #0x04
	ld	-1 (ix),a
;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	a,8 (ix)
	ld	-12 (ix),a
	ld	-11 (ix),#0x00
	ld	a,4 (ix)
	ld	-14 (ix),a
	ld	-13 (ix),#0x00
	ld	a,9 (ix)
	ld	-16 (ix),a
	ld	-15 (ix),#0x00
	ld	a,5 (ix)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-12 (ix)
	sub	a, -14 (ix)
	ld	-10 (ix),a
	ld	a,-11 (ix)
	sbc	a, -13 (ix)
	ld	-9 (ix),a
;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
	ld	a,#0x02
	sub	a, c
	jp	C,00127$
;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2){
	ld	h,-4 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00127$
;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-2 (ix),h
	ld	-3 (ix),l
	ld	a,-6 (ix)
	add	a,#0xFE
	ld	-8 (ix),a
	ld	a,-5 (ix)
	adc	a,#0xFF
	ld	-7 (ix),a
	ld	a,-16 (ix)
	sub	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-15 (ix)
	sbc	a, -7 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-3 (ix)
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-2 (ix)
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -29 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -28 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-25 (ix),a
	ld	a,-7 (ix)
	ld	-24 (ix),a
;src/pathfinding.c:81: resultado = 0;
	ld	-17 (ix),#0x00
00127$:
;src/pathfinding.c:84: if(*getTilePtr(matriz, x, (y + G_ENEMY_H)) <=2 &&
	ld	a,5 (ix)
	add	a, #0x16
	ld	-8 (ix), a
	push	af
	inc	sp
	ld	a,4 (ix)
	push	af
	inc	sp
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00135$
;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2){
	ld	h,-8 (ix)
	ld	l,-1 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00135$
;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-6 (ix)
	add	a, #0x02
	ld	-3 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-2 (ix),a
	ld	a,-16 (ix)
	sub	a, -3 (ix)
	ld	-3 (ix),a
	ld	a,-15 (ix)
	sbc	a, -2 (ix)
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-2 (ix),h
	ld	-3 (ix),l
	ld	a,-8 (ix)
	add	a, -3 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -2 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -33 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -32 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-23 (ix),a
	ld	a,-7 (ix)
	ld	-22 (ix),a
;src/pathfinding.c:87: if(resultado == 0){
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00132$
;src/pathfinding.c:88: if(dist1 > dist2)
	ld	a,-23 (ix)
	sub	a, -25 (ix)
	ld	a,-22 (ix)
	sbc	a, -24 (ix)
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
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	pop	bc
	ld	b,(hl)
;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
	ld	a,5 (ix)
	add	a, #0x14
	ld	-8 (ix),a
;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
	ld	a,5 (ix)
	add	a, #0x0B
	ld	-3 (ix),a
;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-16 (ix)
	sub	a, -6 (ix)
	ld	-10 (ix),a
	ld	a,-15 (ix)
	sbc	a, -5 (ix)
	ld	-9 (ix),a
;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
	ld	a,#0x02
	sub	a, b
	jp	C,00148$
;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
	push	bc
	ld	a,-8 (ix)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	l,10 (ix)
	ld	h,11 (ix)
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
	ld	a,-3 (ix)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jr	C,00148$
;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	dec	bc
	ld	a,-12 (ix)
	sub	a, c
	ld	c,a
	ld	a,-11 (ix)
	sbc	a, b
	ld	b,a
	push	bc
	call	_abs
	ex	(sp),hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_abs
	pop	af
	pop	bc
	add	hl,bc
	ld	e,-31 (ix)
	ld	d,-30 (ix)
	add	hl,de
	ld	-21 (ix),l
	ld	-20 (ix),h
;src/pathfinding.c:99: if(resultado == 0){
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00145$
;src/pathfinding.c:100: if(dist1 >= dist3)
	ld	a,-25 (ix)
	sub	a, -21 (ix)
	ld	a,-24 (ix)
	sbc	a, -20 (ix)
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
	ld	a,-23 (ix)
	sub	a, -21 (ix)
	ld	a,-22 (ix)
	sbc	a, -20 (ix)
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
;src/pathfinding.c:110: if(*getTilePtr(matriz, (x + G_ENEMY_W +1), y) <=2 &&
	ld	a,4 (ix)
	add	a, #0x05
	ld	-6 (ix),a
	ld	h,5 (ix)
	ld	l,-6 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00167$
;src/pathfinding.c:111: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
	ld	h,-8 (ix)
	ld	l,-6 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00167$
;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
	ld	h,-3 (ix)
	ld	l,-6 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_getTilePtr
	pop	af
	pop	af
	ld	c,(hl)
	ld	a,#0x02
	sub	a, c
	jp	C,00167$
;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
	ld	a,-14 (ix)
	add	a, #0x01
	ld	-8 (ix),a
	ld	a,-13 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	a,-12 (ix)
	sub	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-11 (ix)
	sbc	a, -7 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-2 (ix),h
	ld	-3 (ix),l
	ld	a,-8 (ix)
	add	a, -3 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -2 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -27 (ix)
	ld	-19 (ix),a
	ld	a,-7 (ix)
	adc	a, -26 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:114: if(resultado == 0){
	ld	a,-17 (ix)
	or	a, a
	jr	NZ,00164$
;src/pathfinding.c:115: if(dist1 >= dist4)
	ld	a,-25 (ix)
	sub	a, -19 (ix)
	ld	a,-24 (ix)
	sbc	a, -18 (ix)
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
	ld	a,-23 (ix)
	sub	a, -19 (ix)
	ld	a,-22 (ix)
	sbc	a, -18 (ix)
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
	ld	a,-21 (ix)
	sub	a, -19 (ix)
	ld	a,-20 (ix)
	sbc	a, -18 (ix)
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
;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
;	---------------------------------
; Function pathFinding
; ---------------------------------
_pathFinding::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:149: u8 problem = 0;
	ld	-5 (ix),#0x00
;src/pathfinding.c:151: x = s_x;
	ld	a,4 (ix)
	ld	-7 (ix),a
;src/pathfinding.c:153: y = s_y;
	ld	a,5 (ix)
	ld	-8 (ix),a
;src/pathfinding.c:155: k = 0;
	ld	-1 (ix),#0x00
;src/pathfinding.c:156: aux = 1;
	ld	-4 (ix),#0x01
;src/pathfinding.c:160: enemy->longitud_camino = 0;
	ld	a,8 (ix)
	ld	-3 (ix),a
	ld	a,9 (ix)
	ld	-2 (ix),a
	ld	a,-3 (ix)
	add	a, #0x44
	ld	e,a
	ld	a,-2 (ix)
	adc	a, #0x01
	ld	d,a
	xor	a, a
	ld	(de),a
;src/pathfinding.c:161: sol_tam = 1;
	ld	hl,#_sol_tam + 0
	ld	(hl), #0x01
;src/pathfinding.c:163: inserted = anyadirALista(x, y);
	push	de
	ld	h,-8 (ix)
	ld	l,-7 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	pop	de
	ld	-6 (ix),l
;src/pathfinding.c:167: while (aux){
00116$:
	ld	a,-4 (ix)
	or	a, a
	jp	Z,00118$
;src/pathfinding.c:168: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
	ld	a,6 (ix)
	sub	a, -7 (ix)
	jr	NZ,00114$
	ld	a,7 (ix)
	sub	a, -8 (ix)
	jr	Z,00110$
00114$:
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	Z,00110$
	ld	a,-6 (ix)
	or	a, a
	jr	NZ,00111$
00110$:
;src/pathfinding.c:170: if(inserted == 0 || sol_tam == 0){
	ld	a,-6 (ix)
	or	a, a
	jr	Z,00101$
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	NZ,00102$
00101$:
;src/pathfinding.c:171: problem = 1;
	ld	-5 (ix),#0x01
00102$:
;src/pathfinding.c:174: aux = 0;
	ld	-4 (ix),#0x00
	jr	00116$
00111$:
;src/pathfinding.c:176: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
	push	de
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	h,-8 (ix)
	ld	l,-7 (ix)
	push	hl
	call	_adjacentTiles
	pop	af
	pop	af
	pop	af
	pop	af
	ld	b,l
	pop	de
;src/pathfinding.c:178: switch(movimiento){
	ld	a,#0x04
	sub	a, b
	jr	C,00116$
;src/pathfinding.c:182: k = k+2;
	ld	c,-1 (ix)
	inc	c
	inc	c
;src/pathfinding.c:178: switch(movimiento){
	push	de
	ld	e,b
	ld	d,#0x00
	ld	hl,#00169$
	add	hl,de
	add	hl,de
	add	hl,de
	pop	de
	jp	(hl)
00169$:
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
;src/pathfinding.c:179: case 0:
00104$:
;src/pathfinding.c:180: inserted = anyadirALista(x, y-2);
	ld	b,-8 (ix)
	dec	b
	dec	b
	push	bc
	push	de
	push	bc
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-6 (ix),l
;src/pathfinding.c:181: y = y-2;
	ld	-8 (ix),b
;src/pathfinding.c:182: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:183: break;
	jp	00116$
;src/pathfinding.c:184: case 1:
00105$:
;src/pathfinding.c:187: inserted = anyadirALista(x, y+2);
	ld	b,-8 (ix)
	inc	b
	inc	b
	push	bc
	push	de
	push	bc
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-6 (ix),l
;src/pathfinding.c:188: y = y+2;
	ld	-8 (ix),b
;src/pathfinding.c:189: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:190: break;
	jp	00116$
;src/pathfinding.c:191: case 2:
00106$:
;src/pathfinding.c:194: inserted = anyadirALista(x-1, y);
	ld	b,-7 (ix)
	dec	b
	push	bc
	push	de
	ld	a,-8 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-6 (ix),l
;src/pathfinding.c:195: x = x-1;
	ld	-7 (ix),b
;src/pathfinding.c:196: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:197: break;
	jp	00116$
;src/pathfinding.c:198: case 3:
00107$:
;src/pathfinding.c:201: inserted = anyadirALista(x+1, y);
	ld	b,-7 (ix)
	inc	b
	push	bc
	push	de
	ld	a,-8 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-6 (ix),l
;src/pathfinding.c:202: x = x+1;
	ld	-7 (ix),b
;src/pathfinding.c:203: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:204: break;
	jp	00116$
;src/pathfinding.c:206: case 4:
00108$:
;src/pathfinding.c:207: sol_tam = sol_tam - 2;
	ld	hl, #_sol_tam+0
	dec	(hl)
	ld	hl, #_sol_tam+0
	dec	(hl)
;src/pathfinding.c:208: k--;
	ld	c,-1 (ix)
	dec	c
;src/pathfinding.c:209: y = camino[k];
	ld	hl,#_camino
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	ld	-8 (ix),a
;src/pathfinding.c:210: k--;
	ld	a,c
	add	a,#0xFF
;src/pathfinding.c:211: x = camino[k];
	ld	-1 (ix),a
	add	a,#<(_camino)
	ld	l,a
	ld	a,#>(_camino)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-7 (ix),a
;src/pathfinding.c:213: }
	jp	00116$
00118$:
;src/pathfinding.c:218: if(problem == 0){
	ld	a,-5 (ix)
	or	a, a
	jr	NZ,00127$
;src/pathfinding.c:219: if(sol_tam < CAMINO_TAM){
;src/pathfinding.c:220: enemy->longitud_camino = sol_tam;
	ld	a,(#_sol_tam + 0)
	cp	a,#0xC8
	jr	NC,00120$
	ld	(de),a
	jr	00137$
00120$:
;src/pathfinding.c:222: enemy->longitud_camino = CAMINO_TAM;
	ld	a,#0xC8
	ld	(de),a
;src/pathfinding.c:225: for(j = 0; j<CAMINO_TAM; j++){
00137$:
	ld	a,-3 (ix)
	add	a, #0x18
	ld	c,a
	ld	a,-2 (ix)
	adc	a, #0x00
	ld	b,a
	ld	e,#0x00
00125$:
;src/pathfinding.c:226: enemy->camino[j] = camino[j];
	ld	l,e
	ld	h,#0x00
	add	hl, bc
	push	hl
	pop	iy
	ld	hl,#_camino
	ld	d,#0x00
	add	hl, de
	ld	d,(hl)
	ld	0 (iy), d
;src/pathfinding.c:225: for(j = 0; j<CAMINO_TAM; j++){
	inc	e
	ld	a,e
	sub	a, #0xC8
	jr	C,00125$
00127$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
