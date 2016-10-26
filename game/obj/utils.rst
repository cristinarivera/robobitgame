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
   4B71                      48 _getTilePtr::
   4B71 DD E5         [15]   49 	push	ix
   4B73 DD 21 00 00   [14]   50 	ld	ix,#0
   4B77 DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   4B79 DD 4E 07      [19]   53 	ld	c,7 (ix)
   4B7C 06 00         [ 7]   54 	ld	b,#0x00
   4B7E 79            [ 4]   55 	ld	a,c
   4B7F C6 E8         [ 7]   56 	add	a,#0xE8
   4B81 5F            [ 4]   57 	ld	e,a
   4B82 78            [ 4]   58 	ld	a,b
   4B83 CE FF         [ 7]   59 	adc	a,#0xFF
   4B85 57            [ 4]   60 	ld	d,a
   4B86 6B            [ 4]   61 	ld	l, e
   4B87 62            [ 4]   62 	ld	h, d
   4B88 CB 7A         [ 8]   63 	bit	7, d
   4B8A 28 04         [12]   64 	jr	Z,00103$
   4B8C 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   4B8F 09            [11]   66 	add	hl,bc
   4B90                      67 00103$:
   4B90 CB 2C         [ 8]   68 	sra	h
   4B92 CB 1D         [ 8]   69 	rr	l
   4B94 CB 2C         [ 8]   70 	sra	h
   4B96 CB 1D         [ 8]   71 	rr	l
   4B98 4D            [ 4]   72 	ld	c, l
   4B99 44            [ 4]   73 	ld	b, h
   4B9A 29            [11]   74 	add	hl, hl
   4B9B 29            [11]   75 	add	hl, hl
   4B9C 09            [11]   76 	add	hl, bc
   4B9D 29            [11]   77 	add	hl, hl
   4B9E 29            [11]   78 	add	hl, hl
   4B9F 29            [11]   79 	add	hl, hl
   4BA0 4D            [ 4]   80 	ld	c,l
   4BA1 44            [ 4]   81 	ld	b,h
   4BA2 DD 6E 04      [19]   82 	ld	l,4 (ix)
   4BA5 DD 66 05      [19]   83 	ld	h,5 (ix)
   4BA8 09            [11]   84 	add	hl,bc
   4BA9 DD 4E 06      [19]   85 	ld	c,6 (ix)
   4BAC CB 39         [ 8]   86 	srl	c
   4BAE 59            [ 4]   87 	ld	e,c
   4BAF 16 00         [ 7]   88 	ld	d,#0x00
   4BB1 19            [11]   89 	add	hl,de
   4BB2 DD E1         [14]   90 	pop	ix
   4BB4 C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   4BB5                      96 _abs::
   4BB5 DD E5         [15]   97 	push	ix
   4BB7 DD 21 00 00   [14]   98 	ld	ix,#0
   4BBB DD 39         [15]   99 	add	ix,sp
   4BBD F5            [11]  100 	push	af
   4BBE F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   4BBF 21 00 00      [10]  103 	ld	hl,#0x0000
   4BC2 39            [11]  104 	add	hl,sp
   4BC3 4D            [ 4]  105 	ld	c,l
   4BC4 44            [ 4]  106 	ld	b,h
   4BC5 DD 7E 04      [19]  107 	ld	a,4 (ix)
   4BC8 77            [ 7]  108 	ld	(hl),a
   4BC9 23            [ 6]  109 	inc	hl
   4BCA DD 7E 05      [19]  110 	ld	a,5 (ix)
   4BCD 77            [ 7]  111 	ld	(hl),a
   4BCE 69            [ 4]  112 	ld	l, c
   4BCF 60            [ 4]  113 	ld	h, b
   4BD0 23            [ 6]  114 	inc	hl
   4BD1 23            [ 6]  115 	inc	hl
   4BD2 AF            [ 4]  116 	xor	a, a
   4BD3 DD 96 04      [19]  117 	sub	a, 4 (ix)
   4BD6 5F            [ 4]  118 	ld	e,a
   4BD7 3E 00         [ 7]  119 	ld	a, #0x00
   4BD9 DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   4BDC 57            [ 4]  121 	ld	d,a
   4BDD 73            [ 7]  122 	ld	(hl),e
   4BDE 23            [ 6]  123 	inc	hl
   4BDF 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   4BE0 DD 7E 05      [19]  126 	ld	a,5 (ix)
   4BE3 07            [ 4]  127 	rlca
   4BE4 E6 01         [ 7]  128 	and	a,#0x01
   4BE6 6F            [ 4]  129 	ld	l,a
   4BE7 17            [ 4]  130 	rla
   4BE8 9F            [ 4]  131 	sbc	a, a
   4BE9 67            [ 4]  132 	ld	h,a
   4BEA 29            [11]  133 	add	hl, hl
   4BEB 09            [11]  134 	add	hl,bc
   4BEC 4E            [ 7]  135 	ld	c,(hl)
   4BED 23            [ 6]  136 	inc	hl
   4BEE 66            [ 7]  137 	ld	h,(hl)
   4BEF 69            [ 4]  138 	ld	l, c
   4BF0 DD F9         [10]  139 	ld	sp, ix
   4BF2 DD E1         [14]  140 	pop	ix
   4BF4 C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
