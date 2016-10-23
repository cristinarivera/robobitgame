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
	.ds 2112
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
;src/pathfinding.c:15: i16 abs (i16 n) {
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/pathfinding.c:16: const i16 ret[2] = { n, -n };
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
;src/pathfinding.c:17: return ret[n<0];
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
;src/pathfinding.c:20: u8 getBit(u8 *array, u16 pos)
;	---------------------------------
; Function getBit
; ---------------------------------
_getBit::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/pathfinding.c:25: byteV = array[pos/8];
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
;src/pathfinding.c:26: bitV = bitWeights[pos%8];
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
;src/pathfinding.c:27: return (byteV & bitV) == bitV;
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
;src/pathfinding.c:30: void setBit(u8 *array, u16 pos, u16 value)
;	---------------------------------
; Function setBit
; ---------------------------------
_setBit::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/pathfinding.c:36: bytePos = pos/8;
	ld	e,6 (ix)
	ld	d,7 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/pathfinding.c:38: bitV = bitWeights[pos%8];
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
;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,de
;src/pathfinding.c:40: if(value == 0)
	ld	a,9 (ix)
	or	a,8 (ix)
	jr	NZ,00106$
;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
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
;src/pathfinding.c:46: if(getBit(array, pos) == 0) array[bytePos] += bitV;
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
;src/pathfinding.c:51: u8 anyadirALista(u8 x, u8 y){
;	---------------------------------
; Function anyadirALista
; ---------------------------------
_anyadirALista::
;src/pathfinding.c:52: u8 anyadido = 0;
	ld	c,#0x00
;src/pathfinding.c:54: if(sol_tam < 70){
	ld	a,(#_sol_tam + 0)
	sub	a, #0x46
	jr	NC,00102$
;src/pathfinding.c:55: camino[sol_tam-1] = x;
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
;src/pathfinding.c:56: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:57: camino[sol_tam-1] = y;
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
;src/pathfinding.c:58: sol_tam++;
	ld	hl, #_sol_tam+0
	inc	(hl)
;src/pathfinding.c:59: anyadido = 1;
	ld	c,#0x01
00102$:
;src/pathfinding.c:62: return anyadido;
	ld	l,c
	ret
;src/pathfinding.c:66: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
;	---------------------------------
; Function adjacentTiles
; ---------------------------------
_adjacentTiles::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-47
	add	hl,sp
	ld	sp,hl
;src/pathfinding.c:67: u8 resultado = 4;
	ld	-43 (ix),#0x04
;src/pathfinding.c:69: i16 dist1 = 0;
	ld	-40 (ix),#0x00
	ld	-39 (ix),#0x00
;src/pathfinding.c:70: i16 dist2 = 0;
	ld	-38 (ix),#0x00
	ld	-37 (ix),#0x00
;src/pathfinding.c:71: i16 dist3 = 0;
	ld	-34 (ix),#0x00
	ld	-33 (ix),#0x00
;src/pathfinding.c:75: i16 heu_derecha = 0;
	ld	-42 (ix),#0x00
	ld	-41 (ix),#0x00
;src/pathfinding.c:76: i16 heu_izquierda = 0;
	ld	hl,#0x0000
	ex	(sp), hl
;src/pathfinding.c:77: i16 heu_arriba = 0;
	ld	-36 (ix),#0x00
	ld	-35 (ix),#0x00
;src/pathfinding.c:78: i16 heu_abajo = 0;
	ld	-32 (ix),#0x00
	ld	-31 (ix),#0x00
;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
	ld	a,5 (ix)
	ld	-10 (ix),a
	ld	-9 (ix),#0x00
	ld	a,4 (ix)
	ld	-26 (ix),a
	ld	-25 (ix),#0x00
	ld	a,-10 (ix)
	add	a,#0xE8
	ld	-14 (ix),a
	ld	a,-9 (ix)
	adc	a,#0xFF
	ld	-13 (ix),a
	ld	a,-26 (ix)
	add	a,#0xFF
	ld	-18 (ix),a
	ld	a,-25 (ix)
	adc	a,#0xFF
	ld	-17 (ix),a
;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
	ld	a,-26 (ix)
	add	a, #0x01
	ld	-22 (ix),a
	ld	a,-25 (ix)
	adc	a, #0x00
	ld	-21 (ix),a
;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
	ld	a,-10 (ix)
	add	a,#0xE6
	ld	-6 (ix),a
	ld	a,-9 (ix)
	adc	a,#0xFF
	ld	-5 (ix),a
;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
	ld	a,-10 (ix)
	add	a, #0xEA
	ld	-16 (ix),a
	ld	a,-9 (ix)
	adc	a, #0xFF
	ld	-15 (ix),a
;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
	ld	c,-14 (ix)
	ld	b,-13 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
	push	de
	ld	e,-16 (ix)
	ld	d,-15 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	pop	de
;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
	ld	a,-18 (ix)
	add	a, e
	ld	-12 (ix),a
	ld	a,-17 (ix)
	adc	a, d
	ld	-11 (ix),a
;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
	ld	a,-22 (ix)
	add	a, e
	ld	-24 (ix),a
	ld	a,-21 (ix)
	adc	a, d
	ld	-23 (ix),a
;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
	ld	a,-26 (ix)
	add	a, c
	ld	-20 (ix),a
	ld	a,-25 (ix)
	adc	a, b
	ld	-19 (ix),a
;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
	ld	a,-26 (ix)
	add	a, l
	ld	-4 (ix),a
	ld	a,-25 (ix)
	adc	a, h
	ld	-3 (ix),a
;src/pathfinding.c:82: if(x == f_x){
	ld	a,4 (ix)
	sub	a, 8 (ix)
	jr	NZ,00130$
;src/pathfinding.c:84: if(s_x < x){
	ld	a,6 (ix)
	sub	a, 4 (ix)
	jr	NC,00102$
;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
	ld	hl,#0x0001
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	jr	00103$
00102$:
;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
	ld	hl,#0x0001
	push	hl
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
00103$:
;src/pathfinding.c:91: if(y < f_y)
	ld	a,5 (ix)
	sub	a, 9 (ix)
	jr	NC,00105$
;src/pathfinding.c:92: heu_abajo = -1;
	ld	-32 (ix),#0xFF
	ld	-31 (ix),#0xFF
00105$:
;src/pathfinding.c:94: if(y > f_y)
	ld	a,9 (ix)
	sub	a, 5 (ix)
	jp	NC,00131$
;src/pathfinding.c:95: heu_arriba = -1;
	ld	-36 (ix),#0xFF
	ld	-35 (ix),#0xFF
	jp	00131$
00130$:
;src/pathfinding.c:97: }else if(y == f_y){
	ld	a,5 (ix)
	sub	a, 9 (ix)
	jr	NZ,00127$
;src/pathfinding.c:99: if(s_y < y){
	ld	a,7 (ix)
	sub	a, 5 (ix)
	jr	NC,00109$
;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
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
	jr	00110$
00109$:
;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
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
;src/pathfinding.c:106: if(x < f_x)
	ld	a,4 (ix)
	sub	a, 8 (ix)
	jr	NC,00112$
;src/pathfinding.c:107: heu_derecha = -1;
	ld	-42 (ix),#0xFF
	ld	-41 (ix),#0xFF
00112$:
;src/pathfinding.c:108: if(x > f_x)
	ld	a,8 (ix)
	sub	a, 4 (ix)
	jr	NC,00131$
;src/pathfinding.c:109: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
	jr	00131$
00127$:
;src/pathfinding.c:115: if(s_y < f_y)
	ld	a,7 (ix)
	sub	a, 9 (ix)
	ld	a,#0x00
	rla
	ld	c,a
;src/pathfinding.c:114: if(s_x < f_x){
	ld	a,6 (ix)
	sub	a, 8 (ix)
	jr	NC,00124$
;src/pathfinding.c:115: if(s_y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00116$
;src/pathfinding.c:116: heu_abajo = -1;
	ld	-32 (ix),#0xFF
	ld	-31 (ix),#0xFF
	jr	00117$
00116$:
;src/pathfinding.c:118: heu_arriba = -1;
	ld	-36 (ix),#0xFF
	ld	-35 (ix),#0xFF
00117$:
;src/pathfinding.c:120: heu_derecha = -1;
	ld	-42 (ix),#0xFF
	ld	-41 (ix),#0xFF
	jr	00131$
00124$:
;src/pathfinding.c:121: }else if(s_x > f_x){
	ld	a,8 (ix)
	sub	a, 6 (ix)
	jr	NC,00131$
;src/pathfinding.c:123: if(s_y < f_y)
	ld	a,c
	or	a, a
	jr	Z,00119$
;src/pathfinding.c:124: heu_abajo = -1;
	ld	-32 (ix),#0xFF
	ld	-31 (ix),#0xFF
	jr	00120$
00119$:
;src/pathfinding.c:126: heu_arriba = -1;
	ld	-36 (ix),#0xFF
	ld	-35 (ix),#0xFF
00120$:
;src/pathfinding.c:128: heu_izquierda = -1;
	ld	hl,#0xFFFF
	ex	(sp), hl
00131$:
;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
	ld	a,-6 (ix)
	ld	-8 (ix),a
	ld	a,-5 (ix)
	ld	-7 (ix),a
	bit	7, -5 (ix)
	jr	Z,00176$
	ld	a,-10 (ix)
	add	a, #0xE9
	ld	-8 (ix),a
	ld	a,-9 (ix)
	adc	a, #0xFF
	ld	-7 (ix),a
00176$:
	sra	-7 (ix)
	rr	-8 (ix)
	sra	-7 (ix)
	rr	-8 (ix)
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,10 (ix)
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,11 (ix)
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,4 (ix)
	srl	a
	ld	-6 (ix), a
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,#0x00
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-8 (ix),a
;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	a,8 (ix)
	ld	-28 (ix),a
	ld	-27 (ix),#0x00
	ld	a,9 (ix)
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
	ld	a,-28 (ix)
	sub	a, -26 (ix)
	ld	-30 (ix),a
	ld	a,-27 (ix)
	sbc	a, -25 (ix)
	ld	-29 (ix),a
;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
	ld	a,#0x02
	sub	a, -8 (ix)
	jp	C,00133$
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	dec	l
	jr	Z,00133$
;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-10 (ix)
	add	a,#0xFE
	ld	-20 (ix),a
	ld	a,-9 (ix)
	adc	a,#0xFF
	ld	-19 (ix),a
	ld	a,-2 (ix)
	sub	a, -20 (ix)
	ld	-20 (ix),a
	ld	a,-1 (ix)
	sbc	a, -19 (ix)
	ld	-19 (ix),a
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-19 (ix),h
	ld	-20 (ix),l
	ld	a,-8 (ix)
	add	a, -20 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -19 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -36 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, -35 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	ld	-40 (ix),a
	ld	a,-7 (ix)
	ld	-39 (ix),a
;src/pathfinding.c:135: resultado = 0;
	ld	-43 (ix),#0x00
00133$:
;src/pathfinding.c:138: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
	ld	a,-16 (ix)
	ld	-8 (ix),a
	ld	a,-15 (ix)
	ld	-7 (ix),a
	bit	7, -15 (ix)
	jr	Z,00177$
	ld	a,-10 (ix)
	add	a, #0xED
	ld	-8 (ix),a
	ld	a,-9 (ix)
	adc	a, #0xFF
	ld	-7 (ix),a
00177$:
	sra	-7 (ix)
	rr	-8 (ix)
	sra	-7 (ix)
	rr	-8 (ix)
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	a,10 (ix)
	add	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,11 (ix)
	adc	a, -7 (ix)
	ld	-7 (ix),a
	ld	a,-8 (ix)
	add	a, -6 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-8 (ix),a
	ld	a,#0x02
	sub	a, -8 (ix)
	jp	C,00141$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	dec	l
	jp	Z,00141$
;src/pathfinding.c:139: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-29 (ix),h
	ld	-30 (ix),l
	ld	a,-10 (ix)
	add	a, #0x02
	ld	-8 (ix),a
	ld	a,-9 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
	ld	a,-2 (ix)
	sub	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,-1 (ix)
	sbc	a, -7 (ix)
	ld	-7 (ix),a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-7 (ix),h
	ld	-8 (ix),l
	ld	a,-30 (ix)
	add	a, -8 (ix)
	ld	-30 (ix),a
	ld	a,-29 (ix)
	adc	a, -7 (ix)
	ld	-29 (ix),a
	ld	a,-32 (ix)
	add	a, -30 (ix)
	ld	-30 (ix),a
	ld	a,-31 (ix)
	adc	a, -29 (ix)
	ld	-29 (ix),a
	ld	a,-30 (ix)
	ld	-38 (ix),a
	ld	a,-29 (ix)
	ld	-37 (ix),a
;src/pathfinding.c:140: if(resultado == 0){
	ld	a,-43 (ix)
	or	a, a
	jr	NZ,00138$
;src/pathfinding.c:141: if(dist1 > dist2)
	ld	a,-38 (ix)
	sub	a, -40 (ix)
	ld	a,-37 (ix)
	sbc	a, -39 (ix)
	jp	PO, 00340$
	xor	a, #0x80
00340$:
	jp	P,00141$
;src/pathfinding.c:142: resultado = 1;	
	ld	-43 (ix),#0x01
	jr	00141$
00138$:
;src/pathfinding.c:144: resultado = 1;
	ld	-43 (ix),#0x01
00141$:
;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
	ld	a,-14 (ix)
	ld	-30 (ix),a
	ld	a,-13 (ix)
	ld	-29 (ix),a
	ld	a,-13 (ix)
	rlca
	and	a,#0x01
	ld	-8 (ix),a
	ld	a,-10 (ix)
	add	a, #0xEB
	ld	-4 (ix),a
	ld	a,-9 (ix)
	adc	a, #0xFF
	ld	-3 (ix),a
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00178$
	ld	a,-4 (ix)
	ld	-30 (ix),a
	ld	a,-3 (ix)
	ld	-29 (ix),a
00178$:
	sra	-29 (ix)
	rr	-30 (ix)
	sra	-29 (ix)
	rr	-30 (ix)
	ld	c,-30 (ix)
	ld	b,-29 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-30 (ix),l
	ld	-29 (ix),h
	ld	a,10 (ix)
	add	a, -30 (ix)
	ld	-30 (ix),a
	ld	a,11 (ix)
	adc	a, -29 (ix)
	ld	-29 (ix),a
	ld	a,-18 (ix)
	ld	-20 (ix),a
	ld	a,-17 (ix)
	ld	-19 (ix),a
	bit	7, -17 (ix)
	jr	Z,00179$
	ld	a,-26 (ix)
	ld	-20 (ix),a
	ld	a,-25 (ix)
	ld	-19 (ix),a
00179$:
	sra	-19 (ix)
	rr	-20 (ix)
	ld	a,-30 (ix)
	add	a, -20 (ix)
	ld	-30 (ix),a
	ld	a,-29 (ix)
	adc	a, -19 (ix)
	ld	-29 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-2 (ix)
	sub	a, -10 (ix)
	ld	-2 (ix),a
	ld	a,-1 (ix)
	sbc	a, -9 (ix)
	ld	-1 (ix),a
;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
	ld	a,#0x02
	sub	a, -30 (ix)
	jp	C,00154$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	ld	-30 (ix), l
	ld	a, l
	dec	a
	jp	Z,00154$
;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
	ld	a,-28 (ix)
	sub	a, -18 (ix)
	ld	c,a
	ld	a,-27 (ix)
	sbc	a, -17 (ix)
	ld	b,a
	push	bc
	call	_abs
	pop	af
	ld	-29 (ix),h
	ld	-30 (ix),l
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-19 (ix),h
	ld	-20 (ix),l
	ld	a,-30 (ix)
	add	a, -20 (ix)
	ld	-30 (ix),a
	ld	a,-29 (ix)
	adc	a, -19 (ix)
	ld	-29 (ix),a
	ld	a,-47 (ix)
	add	a, -30 (ix)
	ld	-30 (ix),a
	ld	a,-46 (ix)
	adc	a, -29 (ix)
	ld	-29 (ix),a
	ld	a,-30 (ix)
	ld	-34 (ix),a
	ld	a,-29 (ix)
	ld	-33 (ix),a
;src/pathfinding.c:150: if(resultado == 0){
	ld	a,-43 (ix)
	or	a, a
	jr	NZ,00151$
;src/pathfinding.c:151: if(dist1 >= dist3)
	ld	a,-40 (ix)
	sub	a, -34 (ix)
	ld	a,-39 (ix)
	sbc	a, -33 (ix)
	jp	PO, 00342$
	xor	a, #0x80
00342$:
	jp	M,00154$
;src/pathfinding.c:152: resultado = 2;
	ld	-43 (ix),#0x02
	jr	00154$
00151$:
;src/pathfinding.c:153: }else if(resultado == 1){
	ld	a,-43 (ix)
	dec	a
	jr	NZ,00148$
;src/pathfinding.c:154: if(dist2 >= dist3)
	ld	a,-38 (ix)
	sub	a, -34 (ix)
	ld	a,-37 (ix)
	sbc	a, -33 (ix)
	jp	PO, 00345$
	xor	a, #0x80
00345$:
	jp	M,00154$
;src/pathfinding.c:155: resultado = 2;
	ld	-43 (ix),#0x02
	jr	00154$
00148$:
;src/pathfinding.c:157: resultado = 2;
	ld	-43 (ix),#0x02
00154$:
;src/pathfinding.c:161: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
	ld	a,-14 (ix)
	ld	-30 (ix),a
	ld	a,-13 (ix)
	ld	-29 (ix),a
	ld	a,-8 (ix)
	or	a, a
	jr	Z,00180$
	ld	a,-4 (ix)
	ld	-30 (ix),a
	ld	a,-3 (ix)
	ld	-29 (ix),a
00180$:
	sra	-29 (ix)
	rr	-30 (ix)
	sra	-29 (ix)
	rr	-30 (ix)
	ld	c,-30 (ix)
	ld	b,-29 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-30 (ix),l
	ld	-29 (ix),h
	ld	a,10 (ix)
	add	a, -30 (ix)
	ld	-30 (ix),a
	ld	a,11 (ix)
	adc	a, -29 (ix)
	ld	-29 (ix),a
	ld	a,-22 (ix)
	ld	-8 (ix),a
	ld	a,-21 (ix)
	ld	-7 (ix),a
	bit	7, -21 (ix)
	jr	Z,00181$
	ld	a,-26 (ix)
	add	a, #0x02
	ld	-8 (ix),a
	ld	a,-25 (ix)
	adc	a, #0x00
	ld	-7 (ix),a
00181$:
	sra	-7 (ix)
	rr	-8 (ix)
	ld	a,-8 (ix)
	add	a, -30 (ix)
	ld	-30 (ix),a
	ld	a,-7 (ix)
	adc	a, -29 (ix)
	ld	-29 (ix),a
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	a,(hl)
	ld	-30 (ix),a
	ld	a,#0x02
	sub	a, -30 (ix)
	jp	C,00172$
	ld	l,-24 (ix)
	ld	h,-23 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_getBit
	pop	af
	pop	af
	dec	l
	jp	Z,00172$
;src/pathfinding.c:162: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
	ld	a,-28 (ix)
	sub	a, -22 (ix)
	ld	c,a
	ld	a,-27 (ix)
	sbc	a, -21 (ix)
	ld	b,a
	push	bc
	call	_abs
	pop	af
	ld	-29 (ix),h
	ld	-30 (ix),l
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-1 (ix),h
	ld	-2 (ix),l
	ld	a,-30 (ix)
	add	a, -2 (ix)
	ld	-30 (ix),a
	ld	a,-29 (ix)
	adc	a, -1 (ix)
	ld	-29 (ix),a
	ld	a,-30 (ix)
	add	a, -42 (ix)
	ld	-45 (ix),a
	ld	a,-29 (ix)
	adc	a, -41 (ix)
	ld	-44 (ix),a
;src/pathfinding.c:163: if(resultado == 0){
	ld	a,-43 (ix)
	or	a, a
	jr	NZ,00169$
;src/pathfinding.c:164: if(dist1 >= dist4)
	ld	a,-40 (ix)
	sub	a, -45 (ix)
	ld	a,-39 (ix)
	sbc	a, -44 (ix)
	jp	PO, 00347$
	xor	a, #0x80
00347$:
	jp	M,00172$
;src/pathfinding.c:165: resultado = 3;
	ld	-43 (ix),#0x03
	jr	00172$
00169$:
;src/pathfinding.c:166: }else if(resultado == 1){
	ld	a,-43 (ix)
	dec	a
	jr	NZ,00166$
;src/pathfinding.c:167: if(dist2 >= dist4)
	ld	a,-38 (ix)
	sub	a, -45 (ix)
	ld	a,-37 (ix)
	sbc	a, -44 (ix)
	jp	PO, 00350$
	xor	a, #0x80
00350$:
	jp	M,00172$
;src/pathfinding.c:168: resultado = 3;
	ld	-43 (ix),#0x03
	jr	00172$
00166$:
;src/pathfinding.c:169: }else if (resultado == 2){
	ld	a,-43 (ix)
	sub	a, #0x02
	jr	NZ,00163$
;src/pathfinding.c:170: if(dist3 >= dist4)
	ld	a,-34 (ix)
	sub	a, -45 (ix)
	ld	a,-33 (ix)
	sbc	a, -44 (ix)
	jp	PO, 00353$
	xor	a, #0x80
00353$:
	jp	M,00172$
;src/pathfinding.c:171: resultado = 3;
	ld	-43 (ix),#0x03
	jr	00172$
00163$:
;src/pathfinding.c:173: resultado = 3;
	ld	-43 (ix),#0x03
00172$:
;src/pathfinding.c:177: return resultado;
	ld	l,-43 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/pathfinding.c:181: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
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
;src/pathfinding.c:193: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
	ld	c,-14 (ix)
	ld	b,#0x00
	ld	hl,#0xFFEA
	add	hl,bc
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e,-15 (ix)
	ld	d,#0x00
	add	hl,de
	ld	-21 (ix),l
	ld	-20 (ix),h
;src/pathfinding.c:194: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
	ld	a,c
	add	a,#0xE6
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
	add	hl, hl
	add	hl, hl
	add	hl, hl
	pop	de
	add	hl,de
	ld	-18 (ix),l
	ld	-17 (ix),h
;src/pathfinding.c:195: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
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
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
	ld	l, e
	ld	h, d
	inc	hl
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
;src/pathfinding.c:196: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
	dec	de
	ld	l, c
	ld	h, b
	add	hl,de
	ld	-13 (ix),l
	ld	-12 (ix),h
;src/pathfinding.c:198: u8 problem = 0;
	ld	-11 (ix),#0x00
;src/pathfinding.c:200: x = s_x;
	ld	a,4 (ix)
	ld	-15 (ix),a
;src/pathfinding.c:202: y = s_y;
	ld	a,5 (ix)
	ld	-14 (ix),a
;src/pathfinding.c:204: k = 0;
	ld	-7 (ix),#0x00
;src/pathfinding.c:205: aux = 1;
	ld	-16 (ix),#0x01
;src/pathfinding.c:208: memset(sol_matriz, 0, (40*2*44*4)/8);
	ld	hl,#_sol_matriz
	ld	(hl), #0x00
	ld	e, l
	ld	d, h
	inc	de
	ld	bc, #0x06DF
	ldir
;src/pathfinding.c:209: enemy->longitud_camino = 0;
	ld	a,8 (ix)
	ld	-2 (ix),a
	ld	a,9 (ix)
	ld	-1 (ix),a
	ld	a,-2 (ix)
	add	a, #0x42
	ld	-6 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x01
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x00
;src/pathfinding.c:210: sol_tam = 1;
	ld	hl,#_sol_tam + 0
	ld	(hl), #0x01
;src/pathfinding.c:211: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
	ld	a,-14 (ix)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,-9 (ix)
	add	a,#0xE8
	ld	-9 (ix),a
	ld	a,-8 (ix)
	adc	a,#0xFF
	ld	-8 (ix),a
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,-15 (ix)
	ld	-4 (ix),a
	ld	-3 (ix),#0x00
	ld	a,-9 (ix)
	add	a, -4 (ix)
	ld	-4 (ix),a
	ld	a,-8 (ix)
	adc	a, -3 (ix)
	ld	-3 (ix),a
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
;src/pathfinding.c:212: inserted = anyadirALista(x, y);
	ld	h,-14 (ix)
	ld	l,-15 (ix)
	push	hl
	call	_anyadirALista
	pop	af
	ld	-19 (ix),l
;src/pathfinding.c:216: while (aux){
00116$:
	ld	a,-16 (ix)
	or	a, a
	jp	Z,00118$
;src/pathfinding.c:217: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
	ld	a,6 (ix)
	sub	a, -15 (ix)
	jr	NZ,00114$
	ld	a,7 (ix)
	sub	a, -14 (ix)
	jr	Z,00110$
00114$:
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	Z,00110$
	ld	a,-19 (ix)
	or	a, a
	jr	NZ,00111$
00110$:
;src/pathfinding.c:219: if(inserted == 0 || sol_tam == 0){
	ld	a,-19 (ix)
	or	a, a
	jr	Z,00101$
	ld	a,(#_sol_tam + 0)
	or	a, a
	jr	NZ,00102$
00101$:
;src/pathfinding.c:220: problem = 1;
	ld	-11 (ix),#0x01
00102$:
;src/pathfinding.c:223: aux = 0;
	ld	-16 (ix),#0x00
	jr	00116$
00111$:
;src/pathfinding.c:225: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	h,-14 (ix)
	ld	l,-15 (ix)
	push	hl
	call	_adjacentTiles
	pop	af
	pop	af
	pop	af
	pop	af
	ld	e,l
;src/pathfinding.c:227: switch(movimiento){
	ld	a,#0x04
	sub	a, e
	jr	C,00116$
;src/pathfinding.c:233: k = k+2;
	ld	c,-7 (ix)
	inc	c
	inc	c
;src/pathfinding.c:227: switch(movimiento){
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
;src/pathfinding.c:228: case 0:
00104$:
;src/pathfinding.c:230: setBit(sol_matriz, up, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:231: inserted = anyadirALista(x, y-2);
	ld	b,-14 (ix)
	dec	b
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
	ld	-19 (ix),l
;src/pathfinding.c:232: y = y-1;
	dec	-14 (ix)
;src/pathfinding.c:233: k = k+2;
	ld	-7 (ix),c
;src/pathfinding.c:234: break;
	jp	00116$
;src/pathfinding.c:235: case 1:
00105$:
;src/pathfinding.c:237: setBit(sol_matriz, down, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:238: inserted = anyadirALista(x, y+2);
	ld	b,-14 (ix)
	inc	b
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
	ld	-19 (ix),l
;src/pathfinding.c:239: y = y+1;
	inc	-14 (ix)
;src/pathfinding.c:240: k = k+2;
	ld	-7 (ix),c
;src/pathfinding.c:241: break;
	jp	00116$
;src/pathfinding.c:242: case 2:
00106$:
;src/pathfinding.c:244: setBit(sol_matriz, left, 1);
	push	bc
	ld	hl,#0x0001
	push	hl
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	ld	hl,#_sol_matriz
	push	hl
	call	_setBit
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/pathfinding.c:245: inserted = anyadirALista(x-1, y);
	ld	b,-15 (ix)
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
	ld	-19 (ix),l
;src/pathfinding.c:246: x = x-1;
	ld	-15 (ix),b
;src/pathfinding.c:247: k = k+2;
	ld	-7 (ix),c
;src/pathfinding.c:248: break;
	jp	00116$
;src/pathfinding.c:249: case 3:
00107$:
;src/pathfinding.c:251: setBit(sol_matriz, right, 1);
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
;src/pathfinding.c:252: inserted = anyadirALista(x+1, y);
	ld	b,-15 (ix)
	inc	b
	push	bc
	ld	a,-14 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_anyadirALista
	pop	af
	pop	bc
	ld	-19 (ix),l
;src/pathfinding.c:253: x = x+1;
	ld	-15 (ix),b
;src/pathfinding.c:254: k = k+2;
	ld	-7 (ix),c
;src/pathfinding.c:255: break;
	jp	00116$
;src/pathfinding.c:257: case 4:
00108$:
;src/pathfinding.c:259: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
	ld	a, -14 (ix)
	ld	b, #0x00
	add	a,#0x80
	ld	c,a
	ld	a,b
	adc	a,#0xF8
	ld	b,a
	ld	l,-15 (ix)
	ld	h,#0x00
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
;src/pathfinding.c:261: sol_tam = sol_tam - 2;
	ld	hl, #_sol_tam+0
	dec	(hl)
	ld	hl, #_sol_tam+0
	dec	(hl)
;src/pathfinding.c:262: k--;
	ld	c,-7 (ix)
	dec	c
;src/pathfinding.c:263: y = camino[k];
	ld	hl,#_camino
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	ld	-14 (ix),a
;src/pathfinding.c:264: k--;
	ld	a,c
	add	a,#0xFF
;src/pathfinding.c:265: x = camino[k];
	ld	-7 (ix),a
	add	a,#<(_camino)
	ld	l,a
	ld	a,#>(_camino)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	ld	-15 (ix),a
;src/pathfinding.c:267: }
	jp	00116$
00118$:
;src/pathfinding.c:272: if(problem == 0){
	ld	a,-11 (ix)
	or	a, a
	jr	NZ,00127$
;src/pathfinding.c:273: if(sol_tam < 70){
	ld	a,(#_sol_tam + 0)
	sub	a, #0x46
	jr	NC,00120$
;src/pathfinding.c:274: enemy->longitud_camino = sol_tam;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(#_sol_tam + 0)
	ld	(hl),a
	jr	00137$
00120$:
;src/pathfinding.c:276: enemy->longitud_camino = 70;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),#0x46
;src/pathfinding.c:279: for(j = 0; j<70; j++){
00137$:
	ld	a,-2 (ix)
	add	a, #0x16
	ld	-4 (ix),a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	-3 (ix),a
	ld	-10 (ix),#0x00
00125$:
;src/pathfinding.c:280: enemy->camino[j] = camino[j];
	ld	a,-10 (ix)
	ld	-9 (ix),a
	ld	-8 (ix),#0x00
	ld	a,-4 (ix)
	add	a, -9 (ix)
	ld	-9 (ix),a
	ld	a,-3 (ix)
	adc	a, -8 (ix)
	ld	-8 (ix),a
	ld	a,#<(_camino)
	add	a, -10 (ix)
	ld	-6 (ix),a
	ld	a,#>(_camino)
	adc	a, #0x00
	ld	-5 (ix),a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	c,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),c
;src/pathfinding.c:279: for(j = 0; j<70; j++){
	inc	-10 (ix)
	ld	a,-10 (ix)
	sub	a, #0x46
	jr	C,00125$
00127$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
