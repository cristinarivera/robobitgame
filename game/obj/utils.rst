                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module utils
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _getTilePtr
                             12 	.globl _abs
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 ;src/utils.c:4: char* getTilePtr(u8*mapa, u8 x, u8 y) {
                             45 ;	---------------------------------
                             46 ; Function getTilePtr
                             47 ; ---------------------------------
   49D8                      48 _getTilePtr::
   49D8 DD E5         [15]   49 	push	ix
   49DA DD 21 00 00   [14]   50 	ld	ix,#0
   49DE DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   49E0 DD 4E 07      [19]   53 	ld	c,7 (ix)
   49E3 06 00         [ 7]   54 	ld	b,#0x00
   49E5 79            [ 4]   55 	ld	a,c
   49E6 C6 E8         [ 7]   56 	add	a,#0xE8
   49E8 5F            [ 4]   57 	ld	e,a
   49E9 78            [ 4]   58 	ld	a,b
   49EA CE FF         [ 7]   59 	adc	a,#0xFF
   49EC 57            [ 4]   60 	ld	d,a
   49ED 6B            [ 4]   61 	ld	l, e
   49EE 62            [ 4]   62 	ld	h, d
   49EF CB 7A         [ 8]   63 	bit	7, d
   49F1 28 04         [12]   64 	jr	Z,00103$
   49F3 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   49F6 09            [11]   66 	add	hl,bc
   49F7                      67 00103$:
   49F7 CB 2C         [ 8]   68 	sra	h
   49F9 CB 1D         [ 8]   69 	rr	l
   49FB CB 2C         [ 8]   70 	sra	h
   49FD CB 1D         [ 8]   71 	rr	l
   49FF 4D            [ 4]   72 	ld	c, l
   4A00 44            [ 4]   73 	ld	b, h
   4A01 29            [11]   74 	add	hl, hl
   4A02 29            [11]   75 	add	hl, hl
   4A03 09            [11]   76 	add	hl, bc
   4A04 29            [11]   77 	add	hl, hl
   4A05 29            [11]   78 	add	hl, hl
   4A06 29            [11]   79 	add	hl, hl
   4A07 4D            [ 4]   80 	ld	c,l
   4A08 44            [ 4]   81 	ld	b,h
   4A09 DD 6E 04      [19]   82 	ld	l,4 (ix)
   4A0C DD 66 05      [19]   83 	ld	h,5 (ix)
   4A0F 09            [11]   84 	add	hl,bc
   4A10 DD 4E 06      [19]   85 	ld	c,6 (ix)
   4A13 CB 39         [ 8]   86 	srl	c
   4A15 59            [ 4]   87 	ld	e,c
   4A16 16 00         [ 7]   88 	ld	d,#0x00
   4A18 19            [11]   89 	add	hl,de
   4A19 DD E1         [14]   90 	pop	ix
   4A1B C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   4A1C                      96 _abs::
   4A1C DD E5         [15]   97 	push	ix
   4A1E DD 21 00 00   [14]   98 	ld	ix,#0
   4A22 DD 39         [15]   99 	add	ix,sp
   4A24 F5            [11]  100 	push	af
   4A25 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   4A26 21 00 00      [10]  103 	ld	hl,#0x0000
   4A29 39            [11]  104 	add	hl,sp
   4A2A 4D            [ 4]  105 	ld	c,l
   4A2B 44            [ 4]  106 	ld	b,h
   4A2C DD 7E 04      [19]  107 	ld	a,4 (ix)
   4A2F 77            [ 7]  108 	ld	(hl),a
   4A30 23            [ 6]  109 	inc	hl
   4A31 DD 7E 05      [19]  110 	ld	a,5 (ix)
   4A34 77            [ 7]  111 	ld	(hl),a
   4A35 69            [ 4]  112 	ld	l, c
   4A36 60            [ 4]  113 	ld	h, b
   4A37 23            [ 6]  114 	inc	hl
   4A38 23            [ 6]  115 	inc	hl
   4A39 AF            [ 4]  116 	xor	a, a
   4A3A DD 96 04      [19]  117 	sub	a, 4 (ix)
   4A3D 5F            [ 4]  118 	ld	e,a
   4A3E 3E 00         [ 7]  119 	ld	a, #0x00
   4A40 DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   4A43 57            [ 4]  121 	ld	d,a
   4A44 73            [ 7]  122 	ld	(hl),e
   4A45 23            [ 6]  123 	inc	hl
   4A46 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   4A47 DD 7E 05      [19]  126 	ld	a,5 (ix)
   4A4A 07            [ 4]  127 	rlca
   4A4B E6 01         [ 7]  128 	and	a,#0x01
   4A4D 6F            [ 4]  129 	ld	l,a
   4A4E 17            [ 4]  130 	rla
   4A4F 9F            [ 4]  131 	sbc	a, a
   4A50 67            [ 4]  132 	ld	h,a
   4A51 29            [11]  133 	add	hl, hl
   4A52 09            [11]  134 	add	hl,bc
   4A53 4E            [ 7]  135 	ld	c,(hl)
   4A54 23            [ 6]  136 	inc	hl
   4A55 66            [ 7]  137 	ld	h,(hl)
   4A56 69            [ 4]  138 	ld	l, c
   4A57 DD F9         [10]  139 	ld	sp, ix
   4A59 DD E1         [14]  140 	pop	ix
   4A5B C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
