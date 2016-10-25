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
   4AC4                      48 _getTilePtr::
   4AC4 DD E5         [15]   49 	push	ix
   4AC6 DD 21 00 00   [14]   50 	ld	ix,#0
   4ACA DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   4ACC DD 4E 07      [19]   53 	ld	c,7 (ix)
   4ACF 06 00         [ 7]   54 	ld	b,#0x00
   4AD1 79            [ 4]   55 	ld	a,c
   4AD2 C6 E8         [ 7]   56 	add	a,#0xE8
   4AD4 5F            [ 4]   57 	ld	e,a
   4AD5 78            [ 4]   58 	ld	a,b
   4AD6 CE FF         [ 7]   59 	adc	a,#0xFF
   4AD8 57            [ 4]   60 	ld	d,a
   4AD9 6B            [ 4]   61 	ld	l, e
   4ADA 62            [ 4]   62 	ld	h, d
   4ADB CB 7A         [ 8]   63 	bit	7, d
   4ADD 28 04         [12]   64 	jr	Z,00103$
   4ADF 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   4AE2 09            [11]   66 	add	hl,bc
   4AE3                      67 00103$:
   4AE3 CB 2C         [ 8]   68 	sra	h
   4AE5 CB 1D         [ 8]   69 	rr	l
   4AE7 CB 2C         [ 8]   70 	sra	h
   4AE9 CB 1D         [ 8]   71 	rr	l
   4AEB 4D            [ 4]   72 	ld	c, l
   4AEC 44            [ 4]   73 	ld	b, h
   4AED 29            [11]   74 	add	hl, hl
   4AEE 29            [11]   75 	add	hl, hl
   4AEF 09            [11]   76 	add	hl, bc
   4AF0 29            [11]   77 	add	hl, hl
   4AF1 29            [11]   78 	add	hl, hl
   4AF2 29            [11]   79 	add	hl, hl
   4AF3 4D            [ 4]   80 	ld	c,l
   4AF4 44            [ 4]   81 	ld	b,h
   4AF5 DD 6E 04      [19]   82 	ld	l,4 (ix)
   4AF8 DD 66 05      [19]   83 	ld	h,5 (ix)
   4AFB 09            [11]   84 	add	hl,bc
   4AFC DD 4E 06      [19]   85 	ld	c,6 (ix)
   4AFF CB 39         [ 8]   86 	srl	c
   4B01 59            [ 4]   87 	ld	e,c
   4B02 16 00         [ 7]   88 	ld	d,#0x00
   4B04 19            [11]   89 	add	hl,de
   4B05 DD E1         [14]   90 	pop	ix
   4B07 C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   4B08                      96 _abs::
   4B08 DD E5         [15]   97 	push	ix
   4B0A DD 21 00 00   [14]   98 	ld	ix,#0
   4B0E DD 39         [15]   99 	add	ix,sp
   4B10 F5            [11]  100 	push	af
   4B11 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   4B12 21 00 00      [10]  103 	ld	hl,#0x0000
   4B15 39            [11]  104 	add	hl,sp
   4B16 4D            [ 4]  105 	ld	c,l
   4B17 44            [ 4]  106 	ld	b,h
   4B18 DD 7E 04      [19]  107 	ld	a,4 (ix)
   4B1B 77            [ 7]  108 	ld	(hl),a
   4B1C 23            [ 6]  109 	inc	hl
   4B1D DD 7E 05      [19]  110 	ld	a,5 (ix)
   4B20 77            [ 7]  111 	ld	(hl),a
   4B21 69            [ 4]  112 	ld	l, c
   4B22 60            [ 4]  113 	ld	h, b
   4B23 23            [ 6]  114 	inc	hl
   4B24 23            [ 6]  115 	inc	hl
   4B25 AF            [ 4]  116 	xor	a, a
   4B26 DD 96 04      [19]  117 	sub	a, 4 (ix)
   4B29 5F            [ 4]  118 	ld	e,a
   4B2A 3E 00         [ 7]  119 	ld	a, #0x00
   4B2C DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   4B2F 57            [ 4]  121 	ld	d,a
   4B30 73            [ 7]  122 	ld	(hl),e
   4B31 23            [ 6]  123 	inc	hl
   4B32 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   4B33 DD 7E 05      [19]  126 	ld	a,5 (ix)
   4B36 07            [ 4]  127 	rlca
   4B37 E6 01         [ 7]  128 	and	a,#0x01
   4B39 6F            [ 4]  129 	ld	l,a
   4B3A 17            [ 4]  130 	rla
   4B3B 9F            [ 4]  131 	sbc	a, a
   4B3C 67            [ 4]  132 	ld	h,a
   4B3D 29            [11]  133 	add	hl, hl
   4B3E 09            [11]  134 	add	hl,bc
   4B3F 4E            [ 7]  135 	ld	c,(hl)
   4B40 23            [ 6]  136 	inc	hl
   4B41 66            [ 7]  137 	ld	h,(hl)
   4B42 69            [ 4]  138 	ld	l, c
   4B43 DD F9         [10]  139 	ld	sp, ix
   4B45 DD E1         [14]  140 	pop	ix
   4B47 C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
