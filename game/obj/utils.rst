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
   4996                      48 _getTilePtr::
   4996 DD E5         [15]   49 	push	ix
   4998 DD 21 00 00   [14]   50 	ld	ix,#0
   499C DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   499E DD 4E 07      [19]   53 	ld	c,7 (ix)
   49A1 06 00         [ 7]   54 	ld	b,#0x00
   49A3 79            [ 4]   55 	ld	a,c
   49A4 C6 E8         [ 7]   56 	add	a,#0xE8
   49A6 5F            [ 4]   57 	ld	e,a
   49A7 78            [ 4]   58 	ld	a,b
   49A8 CE FF         [ 7]   59 	adc	a,#0xFF
   49AA 57            [ 4]   60 	ld	d,a
   49AB 6B            [ 4]   61 	ld	l, e
   49AC 62            [ 4]   62 	ld	h, d
   49AD CB 7A         [ 8]   63 	bit	7, d
   49AF 28 04         [12]   64 	jr	Z,00103$
   49B1 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   49B4 09            [11]   66 	add	hl,bc
   49B5                      67 00103$:
   49B5 CB 2C         [ 8]   68 	sra	h
   49B7 CB 1D         [ 8]   69 	rr	l
   49B9 CB 2C         [ 8]   70 	sra	h
   49BB CB 1D         [ 8]   71 	rr	l
   49BD 4D            [ 4]   72 	ld	c, l
   49BE 44            [ 4]   73 	ld	b, h
   49BF 29            [11]   74 	add	hl, hl
   49C0 29            [11]   75 	add	hl, hl
   49C1 09            [11]   76 	add	hl, bc
   49C2 29            [11]   77 	add	hl, hl
   49C3 29            [11]   78 	add	hl, hl
   49C4 29            [11]   79 	add	hl, hl
   49C5 4D            [ 4]   80 	ld	c,l
   49C6 44            [ 4]   81 	ld	b,h
   49C7 DD 6E 04      [19]   82 	ld	l,4 (ix)
   49CA DD 66 05      [19]   83 	ld	h,5 (ix)
   49CD 09            [11]   84 	add	hl,bc
   49CE DD 4E 06      [19]   85 	ld	c,6 (ix)
   49D1 CB 39         [ 8]   86 	srl	c
   49D3 59            [ 4]   87 	ld	e,c
   49D4 16 00         [ 7]   88 	ld	d,#0x00
   49D6 19            [11]   89 	add	hl,de
   49D7 DD E1         [14]   90 	pop	ix
   49D9 C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   49DA                      96 _abs::
   49DA DD E5         [15]   97 	push	ix
   49DC DD 21 00 00   [14]   98 	ld	ix,#0
   49E0 DD 39         [15]   99 	add	ix,sp
   49E2 F5            [11]  100 	push	af
   49E3 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   49E4 21 00 00      [10]  103 	ld	hl,#0x0000
   49E7 39            [11]  104 	add	hl,sp
   49E8 4D            [ 4]  105 	ld	c,l
   49E9 44            [ 4]  106 	ld	b,h
   49EA DD 7E 04      [19]  107 	ld	a,4 (ix)
   49ED 77            [ 7]  108 	ld	(hl),a
   49EE 23            [ 6]  109 	inc	hl
   49EF DD 7E 05      [19]  110 	ld	a,5 (ix)
   49F2 77            [ 7]  111 	ld	(hl),a
   49F3 69            [ 4]  112 	ld	l, c
   49F4 60            [ 4]  113 	ld	h, b
   49F5 23            [ 6]  114 	inc	hl
   49F6 23            [ 6]  115 	inc	hl
   49F7 AF            [ 4]  116 	xor	a, a
   49F8 DD 96 04      [19]  117 	sub	a, 4 (ix)
   49FB 5F            [ 4]  118 	ld	e,a
   49FC 3E 00         [ 7]  119 	ld	a, #0x00
   49FE DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   4A01 57            [ 4]  121 	ld	d,a
   4A02 73            [ 7]  122 	ld	(hl),e
   4A03 23            [ 6]  123 	inc	hl
   4A04 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   4A05 DD 7E 05      [19]  126 	ld	a,5 (ix)
   4A08 07            [ 4]  127 	rlca
   4A09 E6 01         [ 7]  128 	and	a,#0x01
   4A0B 6F            [ 4]  129 	ld	l,a
   4A0C 17            [ 4]  130 	rla
   4A0D 9F            [ 4]  131 	sbc	a, a
   4A0E 67            [ 4]  132 	ld	h,a
   4A0F 29            [11]  133 	add	hl, hl
   4A10 09            [11]  134 	add	hl,bc
   4A11 4E            [ 7]  135 	ld	c,(hl)
   4A12 23            [ 6]  136 	inc	hl
   4A13 66            [ 7]  137 	ld	h,(hl)
   4A14 69            [ 4]  138 	ld	l, c
   4A15 DD F9         [10]  139 	ld	sp, ix
   4A17 DD E1         [14]  140 	pop	ix
   4A19 C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
