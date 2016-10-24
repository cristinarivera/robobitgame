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
   4FBA                      48 _getTilePtr::
   4FBA DD E5         [15]   49 	push	ix
   4FBC DD 21 00 00   [14]   50 	ld	ix,#0
   4FC0 DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   4FC2 DD 4E 07      [19]   53 	ld	c,7 (ix)
   4FC5 06 00         [ 7]   54 	ld	b,#0x00
   4FC7 79            [ 4]   55 	ld	a,c
   4FC8 C6 E8         [ 7]   56 	add	a,#0xE8
   4FCA 5F            [ 4]   57 	ld	e,a
   4FCB 78            [ 4]   58 	ld	a,b
   4FCC CE FF         [ 7]   59 	adc	a,#0xFF
   4FCE 57            [ 4]   60 	ld	d,a
   4FCF 6B            [ 4]   61 	ld	l, e
   4FD0 62            [ 4]   62 	ld	h, d
   4FD1 CB 7A         [ 8]   63 	bit	7, d
   4FD3 28 04         [12]   64 	jr	Z,00103$
   4FD5 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   4FD8 09            [11]   66 	add	hl,bc
   4FD9                      67 00103$:
   4FD9 CB 2C         [ 8]   68 	sra	h
   4FDB CB 1D         [ 8]   69 	rr	l
   4FDD CB 2C         [ 8]   70 	sra	h
   4FDF CB 1D         [ 8]   71 	rr	l
   4FE1 4D            [ 4]   72 	ld	c, l
   4FE2 44            [ 4]   73 	ld	b, h
   4FE3 29            [11]   74 	add	hl, hl
   4FE4 29            [11]   75 	add	hl, hl
   4FE5 09            [11]   76 	add	hl, bc
   4FE6 29            [11]   77 	add	hl, hl
   4FE7 29            [11]   78 	add	hl, hl
   4FE8 29            [11]   79 	add	hl, hl
   4FE9 4D            [ 4]   80 	ld	c,l
   4FEA 44            [ 4]   81 	ld	b,h
   4FEB DD 6E 04      [19]   82 	ld	l,4 (ix)
   4FEE DD 66 05      [19]   83 	ld	h,5 (ix)
   4FF1 09            [11]   84 	add	hl,bc
   4FF2 DD 4E 06      [19]   85 	ld	c,6 (ix)
   4FF5 CB 39         [ 8]   86 	srl	c
   4FF7 59            [ 4]   87 	ld	e,c
   4FF8 16 00         [ 7]   88 	ld	d,#0x00
   4FFA 19            [11]   89 	add	hl,de
   4FFB DD E1         [14]   90 	pop	ix
   4FFD C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   4FFE                      96 _abs::
   4FFE DD E5         [15]   97 	push	ix
   5000 DD 21 00 00   [14]   98 	ld	ix,#0
   5004 DD 39         [15]   99 	add	ix,sp
   5006 F5            [11]  100 	push	af
   5007 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   5008 21 00 00      [10]  103 	ld	hl,#0x0000
   500B 39            [11]  104 	add	hl,sp
   500C 4D            [ 4]  105 	ld	c,l
   500D 44            [ 4]  106 	ld	b,h
   500E DD 7E 04      [19]  107 	ld	a,4 (ix)
   5011 77            [ 7]  108 	ld	(hl),a
   5012 23            [ 6]  109 	inc	hl
   5013 DD 7E 05      [19]  110 	ld	a,5 (ix)
   5016 77            [ 7]  111 	ld	(hl),a
   5017 69            [ 4]  112 	ld	l, c
   5018 60            [ 4]  113 	ld	h, b
   5019 23            [ 6]  114 	inc	hl
   501A 23            [ 6]  115 	inc	hl
   501B AF            [ 4]  116 	xor	a, a
   501C DD 96 04      [19]  117 	sub	a, 4 (ix)
   501F 5F            [ 4]  118 	ld	e,a
   5020 3E 00         [ 7]  119 	ld	a, #0x00
   5022 DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   5025 57            [ 4]  121 	ld	d,a
   5026 73            [ 7]  122 	ld	(hl),e
   5027 23            [ 6]  123 	inc	hl
   5028 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   5029 DD 7E 05      [19]  126 	ld	a,5 (ix)
   502C 07            [ 4]  127 	rlca
   502D E6 01         [ 7]  128 	and	a,#0x01
   502F 6F            [ 4]  129 	ld	l,a
   5030 17            [ 4]  130 	rla
   5031 9F            [ 4]  131 	sbc	a, a
   5032 67            [ 4]  132 	ld	h,a
   5033 29            [11]  133 	add	hl, hl
   5034 09            [11]  134 	add	hl,bc
   5035 4E            [ 7]  135 	ld	c,(hl)
   5036 23            [ 6]  136 	inc	hl
   5037 66            [ 7]  137 	ld	h,(hl)
   5038 69            [ 4]  138 	ld	l, c
   5039 DD F9         [10]  139 	ld	sp, ix
   503B DD E1         [14]  140 	pop	ix
   503D C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
