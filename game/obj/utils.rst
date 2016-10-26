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
   4B1C                      48 _getTilePtr::
   4B1C DD E5         [15]   49 	push	ix
   4B1E DD 21 00 00   [14]   50 	ld	ix,#0
   4B22 DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   4B24 DD 4E 07      [19]   53 	ld	c,7 (ix)
   4B27 06 00         [ 7]   54 	ld	b,#0x00
   4B29 79            [ 4]   55 	ld	a,c
   4B2A C6 E8         [ 7]   56 	add	a,#0xE8
   4B2C 5F            [ 4]   57 	ld	e,a
   4B2D 78            [ 4]   58 	ld	a,b
   4B2E CE FF         [ 7]   59 	adc	a,#0xFF
   4B30 57            [ 4]   60 	ld	d,a
   4B31 6B            [ 4]   61 	ld	l, e
   4B32 62            [ 4]   62 	ld	h, d
   4B33 CB 7A         [ 8]   63 	bit	7, d
   4B35 28 04         [12]   64 	jr	Z,00103$
   4B37 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   4B3A 09            [11]   66 	add	hl,bc
   4B3B                      67 00103$:
   4B3B CB 2C         [ 8]   68 	sra	h
   4B3D CB 1D         [ 8]   69 	rr	l
   4B3F CB 2C         [ 8]   70 	sra	h
   4B41 CB 1D         [ 8]   71 	rr	l
   4B43 4D            [ 4]   72 	ld	c, l
   4B44 44            [ 4]   73 	ld	b, h
   4B45 29            [11]   74 	add	hl, hl
   4B46 29            [11]   75 	add	hl, hl
   4B47 09            [11]   76 	add	hl, bc
   4B48 29            [11]   77 	add	hl, hl
   4B49 29            [11]   78 	add	hl, hl
   4B4A 29            [11]   79 	add	hl, hl
   4B4B 4D            [ 4]   80 	ld	c,l
   4B4C 44            [ 4]   81 	ld	b,h
   4B4D DD 6E 04      [19]   82 	ld	l,4 (ix)
   4B50 DD 66 05      [19]   83 	ld	h,5 (ix)
   4B53 09            [11]   84 	add	hl,bc
   4B54 DD 4E 06      [19]   85 	ld	c,6 (ix)
   4B57 CB 39         [ 8]   86 	srl	c
   4B59 59            [ 4]   87 	ld	e,c
   4B5A 16 00         [ 7]   88 	ld	d,#0x00
   4B5C 19            [11]   89 	add	hl,de
   4B5D DD E1         [14]   90 	pop	ix
   4B5F C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   4B60                      96 _abs::
   4B60 DD E5         [15]   97 	push	ix
   4B62 DD 21 00 00   [14]   98 	ld	ix,#0
   4B66 DD 39         [15]   99 	add	ix,sp
   4B68 F5            [11]  100 	push	af
   4B69 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   4B6A 21 00 00      [10]  103 	ld	hl,#0x0000
   4B6D 39            [11]  104 	add	hl,sp
   4B6E 4D            [ 4]  105 	ld	c,l
   4B6F 44            [ 4]  106 	ld	b,h
   4B70 DD 7E 04      [19]  107 	ld	a,4 (ix)
   4B73 77            [ 7]  108 	ld	(hl),a
   4B74 23            [ 6]  109 	inc	hl
   4B75 DD 7E 05      [19]  110 	ld	a,5 (ix)
   4B78 77            [ 7]  111 	ld	(hl),a
   4B79 69            [ 4]  112 	ld	l, c
   4B7A 60            [ 4]  113 	ld	h, b
   4B7B 23            [ 6]  114 	inc	hl
   4B7C 23            [ 6]  115 	inc	hl
   4B7D AF            [ 4]  116 	xor	a, a
   4B7E DD 96 04      [19]  117 	sub	a, 4 (ix)
   4B81 5F            [ 4]  118 	ld	e,a
   4B82 3E 00         [ 7]  119 	ld	a, #0x00
   4B84 DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   4B87 57            [ 4]  121 	ld	d,a
   4B88 73            [ 7]  122 	ld	(hl),e
   4B89 23            [ 6]  123 	inc	hl
   4B8A 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   4B8B DD 7E 05      [19]  126 	ld	a,5 (ix)
   4B8E 07            [ 4]  127 	rlca
   4B8F E6 01         [ 7]  128 	and	a,#0x01
   4B91 6F            [ 4]  129 	ld	l,a
   4B92 17            [ 4]  130 	rla
   4B93 9F            [ 4]  131 	sbc	a, a
   4B94 67            [ 4]  132 	ld	h,a
   4B95 29            [11]  133 	add	hl, hl
   4B96 09            [11]  134 	add	hl,bc
   4B97 4E            [ 7]  135 	ld	c,(hl)
   4B98 23            [ 6]  136 	inc	hl
   4B99 66            [ 7]  137 	ld	h,(hl)
   4B9A 69            [ 4]  138 	ld	l, c
   4B9B DD F9         [10]  139 	ld	sp, ix
   4B9D DD E1         [14]  140 	pop	ix
   4B9F C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
