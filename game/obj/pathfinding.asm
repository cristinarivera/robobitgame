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
	ld	hl,#-31
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:26: u8 resultado = 4;
	ld	-15 (ix),#0x04
;src/pathfinding.c:28: i16 dist1 = 0;
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
;src/pathfinding.c:29: i16 dist2 = 0;
	ld	-23 (ix),#0x00
	ld	-22 (ix),#0x00
;src/pathfinding.c:30: i16 dist3 = 0;
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
;src/pathfinding.c:34: i16 heu_derecha = 0;
	ld	-25 (ix),#0x00
	ld	-24 (ix),#0x00
;src/pathfinding.c:35: i16 heu_izquierda = 0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/pathfinding.c:36: i16 heu_arriba = 0;
	ld	-29 (ix),#0x00
	ld	-28 (ix),#0x00
;src/pathfinding.c:37: i16 heu_abajo = 0;
	ld	-27 (ix),#0x00
	ld	-26 (ix),#0x00
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
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
00102$:
;src/pathfinding.c:46: if(y > f_y)
	ld	a,7 (ix)
	sub	a, 5 (ix)
	jp	NC,00125$
;src/pathfinding.c:47: heu_arriba = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
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
	ld	-25 (ix),#0xFF
	ld	-24 (ix),#0xFF
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
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
	jr	00111$
00110$:
;src/pathfinding.c:63: heu_arriba = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
00111$:
;src/pathfinding.c:65: heu_derecha = -1;
	ld	-25 (ix),#0xFF
	ld	-24 (ix),#0xFF
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
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
	jr	00114$
00113$:
;src/pathfinding.c:71: heu_arriba = -1;
	ld	-29 (ix),#0xFF
	ld	-28 (ix),#0xFF
00114$:
;src/pathfinding.c:73: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
00125$:
;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
	ld	b,5 (ix)
	dec	b
	dec	b
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
;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	a,6 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,4 (ix)
	ld	-12 (ix),a
	ld	-11 (ix),#0x00
	ld	a,7 (ix)
	ld	-10 (ix),a
	ld	-9 (ix),#0x00
	ld	a,5 (ix)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-2 (ix)
	sub	a, -12 (ix)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	sbc	a, -11 (ix)
	ld	-3 (ix),a
;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
	ld	a,#0x02
	sub	a, c
	jr	C,00127$
;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-13 (ix),h
	ld	-14 (ix),l
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	dec	bc
	dec	bc
	ld	a,-10 (ix)
	sub	a, c
	ld	c,a
	ld	a,-9 (ix)
	sbc	a, b
	ld	b,a
	push	bc
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-14 (ix)
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-13 (ix)
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -29 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -28 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-17 (ix),a
	ld	a,-7 (ix)
	ld	-16 (ix),a
;src/pathfinding.c:81: resultado = 0;
	ld	-15 (ix),#0x00
00127$:
;src/pathfinding.c:84: if(*getTilePtr(matriz, x, (y + G_ENEMY_H)) <=2 /*&&
	ld	a,5 (ix)
	add	a, #0x16
	ld	b,a
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
	jp	C,00134$
;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-6 (ix)
	add	a, #0x02
	ld	-14 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	a,-10 (ix)
	sub	a, -14 (ix)
	ld	-14 (ix),a
	ld	a,-9 (ix)
	sbc	a, -13 (ix)
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-13 (ix),h
	ld	-14 (ix),l
	ld	a,-8 (ix)
	add	a, -14 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -13 (ix)
	ld	-7 (ix),a
	ld	a,-27 (ix)
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-26 (ix)
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-23 (ix),a
	ld	a,-7 (ix)
	ld	-22 (ix),a
;src/pathfinding.c:87: if(resultado == 0){
	ld	a,-15 (ix)
	or	a, a
	jr	NZ,00131$
;src/pathfinding.c:88: if(dist1 > dist2)
	ld	a,-23 (ix)
	sub	a, -17 (ix)
	ld	a,-22 (ix)
	sbc	a, -16 (ix)
	jp	PO, 00274$
	xor	a, #0x80
00274$:
	jp	P,00134$
;src/pathfinding.c:89: resultado = 1;
	ld	-15 (ix),#0x01
	jr	00134$
00131$:
;src/pathfinding.c:91: resultado = 1;
	ld	-15 (ix),#0x01
00134$:
;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
	ld	b,4 (ix)
	dec	b
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
;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-10 (ix)
	sub	a, -6 (ix)
	ld	-8 (ix),a
	ld	a,-9 (ix)
	sbc	a, -5 (ix)
	ld	-7 (ix),a
;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
	ld	a,#0x02
	sub	a, c
	jr	C,00146$
;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	c,-12 (ix)
	ld	b,-11 (ix)
	dec	bc
	ld	a,-2 (ix)
	sub	a, c
	ld	c,a
	ld	a,-1 (ix)
	sbc	a, b
	ld	b,a
	push	bc
	call	_abs
	ex	(sp),hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_abs
	pop	af
	pop	bc
	add	hl,bc
	pop	de
	push	de
	add	hl,de
	ld	-21 (ix),l
	ld	-20 (ix),h
;src/pathfinding.c:99: if(resultado == 0){
	ld	a,-15 (ix)
	or	a, a
	jr	NZ,00143$
;src/pathfinding.c:100: if(dist1 >= dist3)
	ld	a,-17 (ix)
	sub	a, -21 (ix)
	ld	a,-16 (ix)
	sbc	a, -20 (ix)
	jp	PO, 00275$
	xor	a, #0x80
00275$:
	jp	M,00146$
;src/pathfinding.c:101: resultado = 2;
	ld	-15 (ix),#0x02
	jr	00146$
00143$:
;src/pathfinding.c:102: }else if(resultado == 1){
	ld	a,-15 (ix)
	dec	a
	jr	NZ,00140$
;src/pathfinding.c:103: if(dist2 >= dist3)
	ld	a,-23 (ix)
	sub	a, -21 (ix)
	ld	a,-22 (ix)
	sbc	a, -20 (ix)
	jp	PO, 00278$
	xor	a, #0x80
00278$:
	jp	M,00146$
;src/pathfinding.c:104: resultado = 2;
	ld	-15 (ix),#0x02
	jr	00146$
00140$:
;src/pathfinding.c:106: resultado = 2;
	ld	-15 (ix),#0x02
00146$:
;src/pathfinding.c:110: if(*getTilePtr(matriz, (x + G_ENEMY_W +1), y) <=2 //&&
	ld	a,4 (ix)
	add	a, #0x05
	ld	b,a
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
	jp	C,00163$
;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
	ld	a,-12 (ix)
	add	a, #0x01
	ld	-14 (ix),a
	ld	a,-11 (ix)
	adc	a, #0x00
	ld	-13 (ix),a
	ld	a,-2 (ix)
	sub	a, -14 (ix)
	ld	-14 (ix),a
	ld	a,-1 (ix)
	sbc	a, -13 (ix)
	ld	-13 (ix),a
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-13 (ix),h
	ld	-14 (ix),l
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-14 (ix)
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-13 (ix)
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -25 (ix)
	ld	-19 (ix),a
	ld	a,-7 (ix)
	adc	a, -24 (ix)
	ld	-18 (ix),a
;src/pathfinding.c:114: if(resultado == 0){
	ld	a,-15 (ix)
	or	a, a
	jr	NZ,00160$
;src/pathfinding.c:115: if(dist1 >= dist4)
	ld	a,-17 (ix)
	sub	a, -19 (ix)
	ld	a,-16 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00279$
	xor	a, #0x80
00279$:
	jp	M,00163$
;src/pathfinding.c:116: resultado = 3;
	ld	-15 (ix),#0x03
	jr	00163$
00160$:
;src/pathfinding.c:117: }else if(resultado == 1){
	ld	a,-15 (ix)
	dec	a
	jr	NZ,00157$
;src/pathfinding.c:118: if(dist2 >= dist4)
	ld	a,-23 (ix)
	sub	a, -19 (ix)
	ld	a,-22 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00282$
	xor	a, #0x80
00282$:
	jp	M,00163$
;src/pathfinding.c:119: resultado = 3;
	ld	-15 (ix),#0x03
	jr	00163$
00157$:
;src/pathfinding.c:120: }else if (resultado == 2){
	ld	a,-15 (ix)
	sub	a, #0x02
	jr	NZ,00154$
;src/pathfinding.c:121: if(dist3 >= dist4)
	ld	a,-21 (ix)
	sub	a, -19 (ix)
	ld	a,-20 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00285$
	xor	a, #0x80
00285$:
	jp	M,00163$
;src/pathfinding.c:122: resultado = 3;
	ld	-15 (ix),#0x03
	jr	00163$
00154$:
;src/pathfinding.c:124: resultado = 3;
	ld	-15 (ix),#0x03
00163$:
;src/pathfinding.c:128: return resultado;
	ld	l,-15 (ix)
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
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:144: u8 problem = 0;
	ld	e,#0x00
;src/pathfinding.c:146: x = s_x;
	ld	a,4 (ix)
	ld	-8 (ix),a
;src/pathfinding.c:148: y = s_y;
	ld	a,5 (ix)
	ld	-5 (ix),a
;src/pathfinding.c:150: k = 0;
	ld	-7 (ix),#0x00
;src/pathfinding.c:151: aux = 1;
	ld	-6 (ix),#0x01
;src/pathfinding.c:155: enemy->longitud_camino = 0;
	ld	a,8 (ix)
	ld	-4 (ix),a
	ld	a,9 (ix)
	ld	-3 (ix),a
	ld	a,-4 (ix)
	add	a, #0x1B
	ld	c,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	b,a
	xor	a, a
	ld	(bc),a
;src/pathfinding.c:156: sol_tam = 0;
	ld	hl,#_sol_tam + 0
	ld	(hl), #0x00
;src/pathfinding.c:158: inserted = anyadirALista(x, y);
	push	bc
	push	de
	ld	h,-5 (ix)
	ld	l,-8 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-9 (ix),l
;src/pathfinding.c:162: while (aux){
00115$:
	ld	a,-6 (ix)
	or	a, a
	jp	Z,00117$
;src/pathfinding.c:163: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
	ld	a,6 (ix)
	sub	a, -8 (ix)
	jr	NZ,00113$
	ld	a,7 (ix)
	sub	a, -5 (ix)
	jr	Z,00109$
00113$:
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	Z,00109$
	ld	a,-9 (ix)
	or	a, a
	jr	NZ,00110$
00109$:
;src/pathfinding.c:165: if(inserted == 0 || sol_tam == 0){
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00101$
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	NZ,00102$
00101$:
;src/pathfinding.c:166: problem = 1;
	ld	e,#0x01
00102$:
;src/pathfinding.c:169: aux = 0;
	ld	-6 (ix),#0x00
	jr	00115$
00110$:
;src/pathfinding.c:171: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
	push	bc
	push	de
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	ld	h,-5 (ix)
	ld	l,-8 (ix)
	push	hl
	call	_adjacentTiles
	pop	af
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	d,l
;src/pathfinding.c:173: switch(movimiento){
	ld	a,#0x03
	sub	a, d
	jr	C,00115$
;src/pathfinding.c:177: k = k+2;
	ld	a,-7 (ix)
	add	a, #0x02
	ld	-1 (ix),a
;src/pathfinding.c:173: switch(movimiento){
	push	de
	ld	e,d
	ld	d,#0x00
	ld	hl,#00161$
	add	hl,de
	add	hl,de
;src/pathfinding.c:174: case 0:
	pop	de
	jp	(hl)
00161$:
	jr	00104$
	jr	00105$
	jr	00106$
	jr	00107$
00104$:
;src/pathfinding.c:175: inserted = anyadirALista(x, y-2);
	ld	a,-5 (ix)
	add	a,#0xFE
	ld	-2 (ix),a
	push	bc
	push	de
	ld	h,-2 (ix)
	ld	l,-8 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-9 (ix),l
;src/pathfinding.c:176: y = y-2;
	ld	d,-2 (ix)
	ld	-5 (ix),d
;src/pathfinding.c:177: k = k+2;
	ld	a,-1 (ix)
	ld	-7 (ix),a
;src/pathfinding.c:178: break;
	jp	00115$
;src/pathfinding.c:179: case 1:
00105$:
;src/pathfinding.c:182: inserted = anyadirALista(x, y+2);
	ld	d,-5 (ix)
	inc	d
	inc	d
	push	bc
	push	de
	push	de
	inc	sp
	ld	a,-8 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-9 (ix),l
;src/pathfinding.c:183: y = y+2;
	ld	-5 (ix),d
;src/pathfinding.c:184: k = k+2;
	ld	a,-1 (ix)
	ld	-7 (ix),a
;src/pathfinding.c:185: break;
	jp	00115$
;src/pathfinding.c:186: case 2:
00106$:
;src/pathfinding.c:189: inserted = anyadirALista(x-1, y);
	ld	d,-8 (ix)
	dec	d
	push	bc
	push	de
	ld	a,-5 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-9 (ix),l
;src/pathfinding.c:190: x = x-1;
	ld	-8 (ix),d
;src/pathfinding.c:191: k = k+2;
	ld	a,-1 (ix)
	ld	-7 (ix),a
;src/pathfinding.c:192: break;
	jp	00115$
;src/pathfinding.c:193: case 3:
00107$:
;src/pathfinding.c:194: inserted = anyadirALista(x+1, y);
	ld	a,-8 (ix)
	inc	a
	ld	-2 (ix),a
	push	bc
	push	de
	ld	h,-5 (ix)
	ld	l,-2 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	pop	de
	pop	bc
	ld	-9 (ix),l
;src/pathfinding.c:195: x = x+1;
	ld	l,-2 (ix)
	ld	-8 (ix),l
;src/pathfinding.c:196: k = k+2;
	ld	a,-1 (ix)
	ld	-7 (ix),a
;src/pathfinding.c:199: }
	jp	00115$
00117$:
;src/pathfinding.c:204: if(problem == 0){
	ld	a,e
	or	a, a
	jr	NZ,00122$
;src/pathfinding.c:205: if(sol_tam < CAMINO_TAM){
;src/pathfinding.c:206: enemy->longitud_camino = sol_tam;
	ld	a,(#_sol_tam + 0)
	cp	a,#0xC8
	jr	NC,00119$
	ld	(bc),a
	jr	00120$
00119$:
;src/pathfinding.c:208: enemy->longitud_camino = CAMINO_TAM;
	ld	a,#0xC8
	ld	(bc),a
00120$:
;src/pathfinding.c:210: enemy->camino = camino;
	ld	a,-4 (ix)
	add	a, #0x19
	ld	c,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,#<(_camino)
	ld	(bc),a
	inc	bc
	ld	a,#>(_camino)
	ld	(bc),a
	jr	00124$
00122$:
;src/pathfinding.c:213: enemy->longitud_camino = 0;
	xor	a, a
	ld	(bc),a
00124$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
