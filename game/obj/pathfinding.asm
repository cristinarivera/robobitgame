;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module pathfinding
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setBit
	.globl _getBit
	.globl _camino
	.globl _sol_matriz
	.globl _sol_tam
	.globl _bitWeights
	.globl _abs
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
_sol_matriz::
	.ds 1760
_camino::
	.ds 70
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
;src/pathfinding.c:14: i16 abs (i16 n) {
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/pathfinding.c:15: const i16 ret[2] = { n, -n };
	ld	hl,#0x0000
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	xor	a, a
	sub	a, 4 (ix)
	ld	e,a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	d,a
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/pathfinding.c:16: return ret[n<0];
	ld	a,5 (ix)
	rlca
	and	a,#0x01
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	l, c
	ld	sp, ix
	pop	ix
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
;src/pathfinding.c:19: u8 getBit(u8 *array, u16 pos)
;	---------------------------------
; Function getBit
; ---------------------------------
_getBit::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/pathfinding.c:24: byteV = array[pos/8];
	ld	c,6 (ix)
	ld	b,7 (ix)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,bc
	ld	c,(hl)
	ld	b,#0x00
;src/pathfinding.c:25: bitV = bitWeights[pos%8];
	ld	a,6 (ix)
	and	a, #0x07
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	ld	de,#_bitWeights
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/pathfinding.c:26: return (byteV & bitV) == bitV;
	ld	a,c
	and	a, e
	ld	c,a
	ld	a,b
	and	a, d
	ld	b,a
	ld	a,e
	sub	a, c
	jr	NZ,00103$
	ld	a,d
	sub	a, b
	jr	NZ,00103$
	ld	a,#0x01
	jr	00104$
00103$:
	xor	a,a
00104$:
	ld	l,a
	pop	ix
	ret
;src/pathfinding.c:29: void setBit(u8 *array, u16 pos, u16 value)
;	---------------------------------
; Function setBit
; ---------------------------------
_setBit::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/pathfinding.c:35: bytePos = pos/8;
	ld	e,6 (ix)
	ld	d,7 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/pathfinding.c:37: bitV = bitWeights[pos%8];
	ld	bc,#_bitWeights+0
	ld	a,6 (ix)
	and	a, #0x07
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;src/pathfinding.c:41: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,de
;src/pathfinding.c:39: if(value == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00106$
;src/pathfinding.c:41: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
	push	hl
	push	bc
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	call	_getBit
	pop	af
	pop	af
	ld	a,l
	pop	bc
	pop	hl
	or	a, a
	jr	Z,00108$
	ld	a, (hl)
	sub	a, c
	ld	(hl),a
	jr	00108$
00106$:
;src/pathfinding.c:45: if(getBit(array, pos) == 0) array[bytePos] += bitV;
	push	hl
	push	bc
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	call	_getBit
	pop	af
	pop	af
	ld	a,l
	pop	bc
	pop	hl
	or	a, a
	jr	NZ,00108$
	ld	a, (hl)
	add	a, c
	ld	(hl),a
00108$:
	pop	ix
	ret
;src/pathfinding.c:50: u8 anyadirALista(u8 x, u8 y){
;	---------------------------------
; Function anyadirALista
; ---------------------------------
_anyadirALista::
;src/pathfinding.c:51: u8 anyadido = 0;
	ld	c,#0x00
;src/pathfinding.c:53: if(sol_tam < 70){
	ld	a,(#_sol_tam + 0)
	sub	a, #0x46
	jr	NC,00102$
;src/pathfinding.c:54: camino[sol_tam-1] = x;
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
;src/pathfinding.c:55: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:56: camino[sol_tam-1] = y;
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
;src/pathfinding.c:57: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:58: anyadido = 1;
	ld	c,#0x01
00102$:
;src/pathfinding.c:61: return anyadido;
	ld	l,c
	ret
;src/pathfinding.c:65: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
;	---------------------------------
; Function adjacentTiles
; ---------------------------------
_adjacentTiles::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-39
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:66: u8 resultado = 4;
	ld	-23 (ix),#0x04
;src/pathfinding.c:68: i16 dist1 = 0;
	ld	-31 (ix),#0x00
	ld	-30 (ix),#0x00
;src/pathfinding.c:69: i16 dist2 = 0;
	ld	-29 (ix),#0x00
	ld	-28 (ix),#0x00
;src/pathfinding.c:70: i16 dist3 = 0;
	ld	-35 (ix),#0x00
	ld	-34 (ix),#0x00
;src/pathfinding.c:73: i16 heu_derecha = 0;
	ld	-33 (ix),#0x00
	ld	-32 (ix),#0x00
;src/pathfinding.c:74: i16 heu_izquierda = 0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/pathfinding.c:75: i16 heu_arriba = 0;
	ld	-27 (ix),#0x00
	ld	-26 (ix),#0x00
;src/pathfinding.c:76: i16 heu_abajo = 0;
	ld	-37 (ix),#0x00
	ld	-36 (ix),#0x00
;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
	ld	a,5 (ix)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	a,4 (ix)
	ld	-6 (ix),a
	ld	-5 (ix),#0x00
	ld	a,-8 (ix)
	add	a,#0xE8
	ld	e,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	d,a
	ld	a,-6 (ix)
	add	a,#0xFF
	ld	-22 (ix),a
	ld	a,-5 (ix)
	adc	a,#0xFF
	ld	-21 (ix),a
;src/pathfinding.c:85: setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
	ld	a,-6 (ix)
	add	a, #0x01
	ld	-12 (ix),a
	ld	a,-5 (ix)
	adc	a, #0x00
	ld	-11 (ix),a
;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
	ld	a,-8 (ix)
	add	a,#0xE7
	ld	c,a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	b,a
;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
	ld	a,-8 (ix)
	add	a, #0xE9
	ld	-20 (ix),a
	ld	a,-7 (ix)
	adc	a, #0xFF
	ld	-19 (ix),a
;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
	push	de
	ld	e,-20 (ix)
	ld	d,-19 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	pop	de
;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
	ld	a,-22 (ix)
	add	a, e
	ld	-20 (ix),a
	ld	a,-21 (ix)
	adc	a, d
	ld	-19 (ix),a
;src/pathfinding.c:85: setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
	ld	a,-12 (ix)
	add	a, e
	ld	-14 (ix),a
	ld	a,-11 (ix)
	adc	a, d
	ld	-13 (ix),a
;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
	ld	a,-6 (ix)
	add	a, c
	ld	-2 (ix),a
	ld	a,-5 (ix)
	adc	a, b
	ld	-1 (ix),a
;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
	ld	a,-6 (ix)
	add	a, l
	ld	-4 (ix),a
	ld	a,-5 (ix)
	adc	a, h
	ld	-3 (ix),a
;src/pathfinding.c:80: if(x == f_x){
	ld	a,4 (ix)
	sub	a, 8 (ix)
	jr	NZ,00130$
;src/pathfinding.c:82: if(s_x < x){
	ld	a,6 (ix)
	sub	a, 4 (ix)
	jr	NC,00102$
;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
	ld	hl,#0x0001
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	jr	00103$
00102$:
;src/pathfinding.c:85: setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
	ld	hl,#0x0001
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00103$:
;src/pathfinding.c:89: if(y < f_y)
	ld	a,5 (ix)
	sub	a, 9 (ix)
	jr	NC,00105$
;src/pathfinding.c:90: heu_abajo = -1;
	ld	-37 (ix),#0xFF
	ld	-36 (ix),#0xFF
00105$:
;src/pathfinding.c:92: if(y > f_y)
	ld	a,9 (ix)
	sub	a, 5 (ix)
	jp	NC,00131$
;src/pathfinding.c:93: heu_arriba = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
	jp	00131$
00130$:
;src/pathfinding.c:95: }else if(y == f_y){
	ld	a,5 (ix)
	sub	a, 9 (ix)
	jr	NZ,00127$
;src/pathfinding.c:97: if(s_y < y){
	ld	a,7 (ix)
	sub	a, 5 (ix)
	jr	NC,00109$
;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
	ld	hl,#0x0001
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	jr	00110$
00109$:
;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
	ld	hl,#0x0001
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00110$:
;src/pathfinding.c:104: if(x < f_x)
	ld	a,4 (ix)
	sub	a, 8 (ix)
	jr	NC,00112$
;src/pathfinding.c:105: heu_derecha = -1;
	ld	-33 (ix),#0xFF
	ld	-32 (ix),#0xFF
00112$:
;src/pathfinding.c:106: if(x > f_x)
	ld	a,8 (ix)
	sub	a, 4 (ix)
	jr	NC,00131$
;src/pathfinding.c:107: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
	jr	00131$
00127$:
;src/pathfinding.c:113: if(s_y < f_y)
	ld	a,7 (ix)
	sub	a, 9 (ix)
	ld	a,#0x00
	rla
	ld	c,a
;src/pathfinding.c:112: if(s_x < f_x){
	ld	a,6 (ix)
	sub	a, 8 (ix)
	jr	NC,00124$
;src/pathfinding.c:113: if(s_y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00116$
;src/pathfinding.c:114: heu_abajo = -1;
	ld	-37 (ix),#0xFF
	ld	-36 (ix),#0xFF
	jr	00117$
00116$:
;src/pathfinding.c:116: heu_arriba = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
00117$:
;src/pathfinding.c:118: heu_derecha = -1;
	ld	-33 (ix),#0xFF
	ld	-32 (ix),#0xFF
	jr	00131$
00124$:
;src/pathfinding.c:119: }else if(s_x > f_x){
	ld	a,8 (ix)
	sub	a, 6 (ix)
	jr	NC,00131$
;src/pathfinding.c:121: if(s_y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00119$
;src/pathfinding.c:122: heu_abajo = -1;
	ld	-37 (ix),#0xFF
	ld	-36 (ix),#0xFF
	jr	00120$
00119$:
;src/pathfinding.c:124: heu_arriba = -1;
	ld	-27 (ix),#0xFF
	ld	-26 (ix),#0xFF
00120$:
;src/pathfinding.c:126: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
00131$:
;src/pathfinding.c:131: if( /* *(matriz + (( (y - 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y-1)-24) * 44*4 + x) != 1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
;src/pathfinding.c:132: dist1 = abs(f_x - x) + abs(f_y - (y-1)) + heu_arriba;
	ld	a,8 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,9 (ix)
	ld	-18 (ix),a
	ld	-17 (ix),#0x00
	ld	a,-2 (ix)
	sub	a, -6 (ix)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	sbc	a, -5 (ix)
	ld	-5 (ix),a
;src/pathfinding.c:131: if( /* *(matriz + (( (y - 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y-1)-24) * 44*4 + x) != 1){
	dec	l
	jr	Z,00133$
;src/pathfinding.c:132: dist1 = abs(f_x - x) + abs(f_y - (y-1)) + heu_arriba;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-15 (ix),h
	ld	-16 (ix),l
	ld	a,-8 (ix)
	add	a,#0xFF
	ld	-10 (ix),a
	ld	a,-7 (ix)
	adc	a,#0xFF
	ld	-9 (ix),a
	ld	a,-18 (ix)
	sub	a, -10 (ix)
	ld	-10 (ix),a
	ld	a,-17 (ix)
	sbc	a, -9 (ix)
	ld	-9 (ix),a
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-9 (ix),h
	ld	-10 (ix),l
	ld	a,-16 (ix)
	add	a, -10 (ix)
	ld	-10 (ix),a
	ld	a,-15 (ix)
	adc	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	add	a, -27 (ix)
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, -26 (ix)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	ld	-31 (ix),a
	ld	a,-9 (ix)
	ld	-30 (ix),a
;src/pathfinding.c:133: resultado = 0;
	ld	-23 (ix),#0x00
00133$:
;src/pathfinding.c:136: if(  /**(matriz + (( (y + 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y+1)-24) * 44*4 + x) != 1){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	dec	l
	jp	Z,00140$
;src/pathfinding.c:137: dist2 = abs(f_x - x) + abs(f_y - (y+1)) + heu_abajo;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-9 (ix),h
	ld	-10 (ix),l
	ld	a,-8 (ix)
	add	a, #0x01
	ld	-16 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-15 (ix),a
	ld	a,-18 (ix)
	sub	a, -16 (ix)
	ld	-16 (ix),a
	ld	a,-17 (ix)
	sbc	a, -15 (ix)
	ld	-15 (ix),a
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-15 (ix),h
	ld	-16 (ix),l
	ld	a,-10 (ix)
	add	a, -16 (ix)
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, -15 (ix)
	ld	-9 (ix),a
	ld	a,-37 (ix)
	add	a, -10 (ix)
	ld	-10 (ix),a
	ld	a,-36 (ix)
	adc	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	ld	-29 (ix),a
	ld	a,-9 (ix)
	ld	-28 (ix),a
;src/pathfinding.c:138: if(resultado == 0){
	ld	a,-23 (ix)
	or	a, a
	jr	NZ,00137$
;src/pathfinding.c:139: if(dist1 > dist2)
	ld	a,-29 (ix)
	sub	a, -31 (ix)
	ld	a,-28 (ix)
	sbc	a, -30 (ix)
	jp	PO, 00290$
	xor	a, #0x80
00290$:
	jp	P,00140$
;src/pathfinding.c:140: resultado = 1;	
	ld	-23 (ix),#0x01
	jr	00140$
00137$:
;src/pathfinding.c:142: resultado = 1;
	ld	-23 (ix),#0x01
00140$:
;src/pathfinding.c:146: if( /* *(matriz + ((y-24)/4)*40 + (x-1)/2) <=2 && */getBit(sol_matriz, (y-24) * 44*4 + (x-1)) != 1){
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	ld	-10 (ix),l
;src/pathfinding.c:147: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-18 (ix)
	sub	a, -8 (ix)
	ld	-16 (ix),a
	ld	a,-17 (ix)
	sbc	a, -7 (ix)
	ld	-15 (ix),a
;src/pathfinding.c:146: if( /* *(matriz + ((y-24)/4)*40 + (x-1)/2) <=2 && */getBit(sol_matriz, (y-24) * 44*4 + (x-1)) != 1){
	ld	a,-10 (ix)
	dec	a
	jp	Z,00152$
;src/pathfinding.c:147: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-2 (ix)
	sub	a, -22 (ix)
	ld	c,a
	ld	a,-1 (ix)
	sbc	a, -21 (ix)
	ld	b,a
	push	bc
	call	_abs
	pop	af
	ld	-9 (ix),h
	ld	-10 (ix),l
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-17 (ix),h
	ld	-18 (ix),l
	ld	a,-10 (ix)
	add	a, -18 (ix)
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, -17 (ix)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	add	a, -39 (ix)
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, -38 (ix)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	ld	-35 (ix),a
	ld	a,-9 (ix)
	ld	-34 (ix),a
;src/pathfinding.c:148: if(resultado == 0){
	ld	a,-23 (ix)
	or	a, a
	jr	NZ,00149$
;src/pathfinding.c:149: if(dist1 >= dist3)
	ld	a,-31 (ix)
	sub	a, -35 (ix)
	ld	a,-30 (ix)
	sbc	a, -34 (ix)
	jp	PO, 00292$
	xor	a, #0x80
00292$:
	jp	M,00152$
;src/pathfinding.c:150: resultado = 2;
	ld	-23 (ix),#0x02
	jr	00152$
00149$:
;src/pathfinding.c:151: }else if(resultado == 1){
	ld	a,-23 (ix)
	dec	a
	jr	NZ,00146$
;src/pathfinding.c:152: if(dist2 >= dist3)
	ld	a,-29 (ix)
	sub	a, -35 (ix)
	ld	a,-28 (ix)
	sbc	a, -34 (ix)
	jp	PO, 00295$
	xor	a, #0x80
00295$:
	jp	M,00152$
;src/pathfinding.c:153: resultado = 2;
	ld	-23 (ix),#0x02
	jr	00152$
00146$:
;src/pathfinding.c:155: resultado = 2;
	ld	-23 (ix),#0x02
00152$:
;src/pathfinding.c:159: if( /* *(matriz + ((y - 24)/4)*40 + (x+1)/2)  <=2 &&*/ getBit(sol_matriz, (y-24) * 44*4 + (x+1)) != 1){
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	dec	l
	jp	Z,00169$
;src/pathfinding.c:160: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
	ld	a,-2 (ix)
	sub	a, -12 (ix)
	ld	c,a
	ld	a,-1 (ix)
	sbc	a, -11 (ix)
	ld	b,a
	push	bc
	call	_abs
	pop	af
	ld	-9 (ix),h
	ld	-10 (ix),l
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-15 (ix),h
	ld	-16 (ix),l
	ld	a,-10 (ix)
	add	a, -16 (ix)
	ld	-10 (ix),a
	ld	a,-9 (ix)
	adc	a, -15 (ix)
	ld	-9 (ix),a
	ld	a,-10 (ix)
	add	a, -33 (ix)
	ld	-25 (ix),a
	ld	a,-9 (ix)
	adc	a, -32 (ix)
	ld	-24 (ix),a
;src/pathfinding.c:161: if(resultado == 0){
	ld	a,-23 (ix)
	or	a, a
	jr	NZ,00166$
;src/pathfinding.c:162: if(dist1 >= dist4)
	ld	a,-31 (ix)
	sub	a, -25 (ix)
	ld	a,-30 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00297$
	xor	a, #0x80
00297$:
	jp	M,00169$
;src/pathfinding.c:163: resultado = 3;
	ld	-23 (ix),#0x03
	jr	00169$
00166$:
;src/pathfinding.c:164: }else if(resultado == 1){
	ld	a,-23 (ix)
	dec	a
	jr	NZ,00163$
;src/pathfinding.c:165: if(dist2 >= dist4)
	ld	a,-29 (ix)
	sub	a, -25 (ix)
	ld	a,-28 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00300$
	xor	a, #0x80
00300$:
	jp	M,00169$
;src/pathfinding.c:166: resultado = 3;
	ld	-23 (ix),#0x03
	jr	00169$
00163$:
;src/pathfinding.c:167: }else if (resultado == 2){
	ld	a,-23 (ix)
	sub	a, #0x02
	jr	NZ,00160$
;src/pathfinding.c:168: if(dist3 >= dist4)
	ld	a,-35 (ix)
	sub	a, -25 (ix)
	ld	a,-34 (ix)
	sbc	a, -24 (ix)
	jp	PO, 00303$
	xor	a, #0x80
00303$:
	jp	M,00169$
;src/pathfinding.c:169: resultado = 3;
	ld	-23 (ix),#0x03
	jr	00169$
00160$:
;src/pathfinding.c:171: resultado = 3;
	ld	-23 (ix),#0x03
00169$:
;src/pathfinding.c:175: return resultado;
	ld	l,-23 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/pathfinding.c:179: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
;	---------------------------------
; Function pathFinding
; ---------------------------------
_pathFinding::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-23
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:191: u16 down = ((y-24)+1)*44*4 + x;
	ld	c,-17 (ix)
	ld	b,#0x00
	ld	hl,#0xFFE9
	add	hl,bc
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e,-15 (ix)
	ld	d,#0x00
	add	hl,de
	ld	-11 (ix),l
	ld	-10 (ix),h
;src/pathfinding.c:192: u16 up = ((y-24)-1)*44*4 + x;
	ld	a,c
	add	a,#0xE7
	ld	l,a
	ld	a,b
	adc	a,#0xFF
	ld	h,a
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	pop	de
	add	hl,de
	inc	sp
	inc	sp
	push	hl
;src/pathfinding.c:193: u16 right = (y-24) * 44*4 + (x+1);
	ld	a,c
	add	a,#0xE8
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
	ld	l, e
	ld	h, d
	inc	hl
	add	hl,bc
	ld	-20 (ix),l
	ld	-19 (ix),h
;src/pathfinding.c:194: u16 left = (y-24) * 44*4 + (x-1);
	dec	de
	ld	l, c
	ld	h, b
	add	hl,de
	ld	-14 (ix),l
	ld	-13 (ix),h
;src/pathfinding.c:196: u8 problem = 0;
	ld	-18 (ix),#0x00
;src/pathfinding.c:198: x = s_x;
	ld	a,4 (ix)
	ld	-15 (ix),a
;src/pathfinding.c:200: y = s_y;
	ld	a,5 (ix)
	ld	-17 (ix),a
;src/pathfinding.c:202: k = 0;
	ld	-1 (ix),#0x00
;src/pathfinding.c:203: aux = 1;
	ld	-16 (ix),#0x01
;src/pathfinding.c:206: memset(sol_matriz, 0, (40*2*44*4)/8);
	ld	hl,#_sol_matriz
	ld	(hl), #0x00
	ld	e, l
	ld	d, h
	inc	de
	ld	bc, #0x06DF
	ldir
;src/pathfinding.c:207: enemy->longitud_camino = 0;
	ld	a,8 (ix)
	ld	-7 (ix),a
	ld	a,9 (ix)
	ld	-6 (ix),a
	ld	a,-7 (ix)
	add	a, #0x39
	ld	-9 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x01
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x00
;src/pathfinding.c:208: sol_tam = 1;
	ld	hl,#_sol_tam + 0
	ld	(hl), #0x01
;src/pathfinding.c:209: setBit(sol_matriz, (y-24)*44*4 + x, 1);
	ld	a,-17 (ix)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	a,-3 (ix)
	add	a,#0xE8
	ld	-3 (ix),a
	ld	a,-2 (ix)
	adc	a,#0xFF
	ld	-2 (ix),a
	ld	c,-3 (ix)
	ld	b,-2 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	a,-15 (ix)
	ld	-5 (ix),a
	ld	-4 (ix),#0x00
	ld	a,-3 (ix)
	add	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,-2 (ix)
	adc	a, -4 (ix)
	ld	-4 (ix),a
	ld	hl,#0x0001
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:210: inserted = anyadirALista(x, y);
	ld	h,-17 (ix)
	ld	l,-15 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	ld	-21 (ix),l
;src/pathfinding.c:214: while (aux){
00116$:
	ld	a,-16 (ix)
	or	a, a
	jp	Z,00118$
;src/pathfinding.c:215: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
	ld	a,6 (ix)
	sub	a, -15 (ix)
	jr	NZ,00114$
	ld	a,7 (ix)
	sub	a, -17 (ix)
	jr	Z,00110$
00114$:
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	Z,00110$
	ld	a,-21 (ix)
	or	a, a
	jr	NZ,00111$
00110$:
;src/pathfinding.c:217: if(inserted == 0 || sol_tam == 0){
	ld	a,-21 (ix)
	or	a, a
	jr	Z,00101$
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	NZ,00102$
00101$:
;src/pathfinding.c:218: problem = 1;
	ld	-18 (ix),#0x01
00102$:
;src/pathfinding.c:221: aux = 0;
	ld	-16 (ix),#0x00
	jr	00116$
00111$:
;src/pathfinding.c:223: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	h,-17 (ix)
	ld	l,-15 (ix)
	push	hl
	call	_adjacentTiles
	pop	af
	pop	af
	pop	af
	pop	af
	ld	e,l
;src/pathfinding.c:225: switch(movimiento){
	ld	a,#0x04
	sub	a, e
	jr	C,00116$
;src/pathfinding.c:231: k = k+2;
	ld	c,-1 (ix)
	inc	c
	inc	c
;src/pathfinding.c:225: switch(movimiento){
	ld	d,#0x00
	ld	hl,#00169$
	add	hl,de
	add	hl,de
	add	hl,de
	jp	(hl)
00169$:
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
;src/pathfinding.c:226: case 0:
00104$:
;src/pathfinding.c:228: setBit(sol_matriz, up, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:229: inserted = anyadirALista(x, y-1);
	ld	b,-17 (ix)
	dec	b
	push	bc
	push	bc
	inc	sp
	ld	a,-15 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	pop	bc
	ld	-21 (ix),l
;src/pathfinding.c:230: y = y-1;
	ld	-17 (ix),b
;src/pathfinding.c:231: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:232: break;
	jp	00116$
;src/pathfinding.c:233: case 1:
00105$:
;src/pathfinding.c:235: setBit(sol_matriz, down, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:236: inserted = anyadirALista(x, y+1);
	ld	b,-17 (ix)
	inc	b
	push	bc
	push	bc
	inc	sp
	ld	a,-15 (ix)
	push	af
	inc	sp
	call	_anyadirALista
	pop	af
	pop	bc
	ld	-21 (ix),l
;src/pathfinding.c:237: y = y+1;
	ld	-17 (ix),b
;src/pathfinding.c:238: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:239: break;
	jp	00116$
;src/pathfinding.c:240: case 2:
00106$:
;src/pathfinding.c:242: setBit(sol_matriz, left, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:243: inserted = anyadirALista(x-1, y);
	ld	b,-15 (ix)
	dec	b
	push	bc
	ld	a,-17 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_anyadirALista
	pop	af
	pop	bc
	ld	-21 (ix),l
;src/pathfinding.c:244: x = x-1;
	ld	-15 (ix),b
;src/pathfinding.c:245: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:246: break;
	jp	00116$
;src/pathfinding.c:247: case 3:
00107$:
;src/pathfinding.c:249: setBit(sol_matriz, right, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:250: inserted = anyadirALista(x+1, y);
	ld	b,-15 (ix)
	inc	b
	push	bc
	ld	a,-17 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_anyadirALista
	pop	af
	pop	bc
	ld	-21 (ix),l
;src/pathfinding.c:251: x = x+1;
	ld	-15 (ix),b
;src/pathfinding.c:252: k = k+2;
	ld	-1 (ix),c
;src/pathfinding.c:253: break;
	jp	00116$
;src/pathfinding.c:255: case 4:
00108$:
;src/pathfinding.c:257: setBit(sol_matriz, (y*44*4 + x), 1);
	ld	c,-17 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,-15 (ix)
	ld	b,#0x00
	add	hl,bc
	ld	bc,#0x0001
	push	bc
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:259: sol_tam = sol_tam - 2;
	ld	hl, #_sol_tam+0
	dec	(hl)
	ld	hl, #_sol_tam+0
	dec	(hl)
;src/pathfinding.c:260: k--;
	ld	c,-1 (ix)
	dec	c
;src/pathfinding.c:261: y = camino[k];
	ld	hl,#_camino
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	ld	-17 (ix),a
;src/pathfinding.c:262: k--;
	ld	a,c
	add	a,#0xFF
;src/pathfinding.c:263: x = camino[k];
	ld	-1 (ix),a
	add	a,#<(_camino)
	ld	l,a
	ld	a,#>(_camino)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-15 (ix),a
;src/pathfinding.c:265: }
	jp	00116$
00118$:
;src/pathfinding.c:270: if(problem == 0){
	ld	a,-18 (ix)
	or	a, a
	jr	NZ,00127$
;src/pathfinding.c:271: if(sol_tam < 70){
	ld	a,(#_sol_tam + 0)
	sub	a, #0x46
	jr	NC,00120$
;src/pathfinding.c:272: enemy->longitud_camino = sol_tam;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(#_sol_tam + 0)
	ld	(hl),a
	jr	00137$
00120$:
;src/pathfinding.c:274: enemy->longitud_camino = 70;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),#0x46
;src/pathfinding.c:277: for(j = 0; j<70; j++){
00137$:
	ld	a,-7 (ix)
	add	a, #0x0D
	ld	-5 (ix),a
	ld	a,-6 (ix)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	-12 (ix),#0x00
00125$:
;src/pathfinding.c:278: enemy->camino[j] = camino[j];
	ld	a,-12 (ix)
	ld	-3 (ix),a
	ld	-2 (ix),#0x00
	ld	a,-5 (ix)
	add	a, -3 (ix)
	ld	-3 (ix),a
	ld	a,-4 (ix)
	adc	a, -2 (ix)
	ld	-2 (ix),a
	ld	a,#<(_camino)
	add	a, -12 (ix)
	ld	-9 (ix),a
	ld	a,#>(_camino)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),c
;src/pathfinding.c:277: for(j = 0; j<70; j++){
	inc	-12 (ix)
	ld	a,-12 (ix)
	sub	a, #0x46
	jr	C,00125$
00127$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
