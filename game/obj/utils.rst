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
   4FD3                      48 _getTilePtr::
   4FD3 DD E5         [15]   49 	push	ix
   4FD5 DD 21 00 00   [14]   50 	ld	ix,#0
   4FD9 DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   4FDB DD 4E 07      [19]   53 	ld	c,7 (ix)
   4FDE 06 00         [ 7]   54 	ld	b,#0x00
   4FE0 79            [ 4]   55 	ld	a,c
   4FE1 C6 E8         [ 7]   56 	add	a,#0xE8
   4FE3 5F            [ 4]   57 	ld	e,a
   4FE4 78            [ 4]   58 	ld	a,b
   4FE5 CE FF         [ 7]   59 	adc	a,#0xFF
   4FE7 57            [ 4]   60 	ld	d,a
   4FE8 6B            [ 4]   61 	ld	l, e
   4FE9 62            [ 4]   62 	ld	h, d
   4FEA CB 7A         [ 8]   63 	bit	7, d
   4FEC 28 04         [12]   64 	jr	Z,00103$
   4FEE 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   4FF1 09            [11]   66 	add	hl,bc
   4FF2                      67 00103$:
   4FF2 CB 2C         [ 8]   68 	sra	h
   4FF4 CB 1D         [ 8]   69 	rr	l
   4FF6 CB 2C         [ 8]   70 	sra	h
   4FF8 CB 1D         [ 8]   71 	rr	l
   4FFA 4D            [ 4]   72 	ld	c, l
   4FFB 44            [ 4]   73 	ld	b, h
   4FFC 29            [11]   74 	add	hl, hl
   4FFD 29            [11]   75 	add	hl, hl
   4FFE 09            [11]   76 	add	hl, bc
   4FFF 29            [11]   77 	add	hl, hl
   5000 29            [11]   78 	add	hl, hl
   5001 29            [11]   79 	add	hl, hl
   5002 4D            [ 4]   80 	ld	c,l
   5003 44            [ 4]   81 	ld	b,h
   5004 DD 6E 04      [19]   82 	ld	l,4 (ix)
   5007 DD 66 05      [19]   83 	ld	h,5 (ix)
   500A 09            [11]   84 	add	hl,bc
   500B DD 4E 06      [19]   85 	ld	c,6 (ix)
   500E CB 39         [ 8]   86 	srl	c
   5010 59            [ 4]   87 	ld	e,c
   5011 16 00         [ 7]   88 	ld	d,#0x00
   5013 19            [11]   89 	add	hl,de
   5014 DD E1         [14]   90 	pop	ix
   5016 C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   5017                      96 _abs::
   5017 DD E5         [15]   97 	push	ix
   5019 DD 21 00 00   [14]   98 	ld	ix,#0
   501D DD 39         [15]   99 	add	ix,sp
   501F F5            [11]  100 	push	af
   5020 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   5021 21 00 00      [10]  103 	ld	hl,#0x0000
   5024 39            [11]  104 	add	hl,sp
   5025 4D            [ 4]  105 	ld	c,l
   5026 44            [ 4]  106 	ld	b,h
   5027 DD 7E 04      [19]  107 	ld	a,4 (ix)
   502A 77            [ 7]  108 	ld	(hl),a
   502B 23            [ 6]  109 	inc	hl
   502C DD 7E 05      [19]  110 	ld	a,5 (ix)
   502F 77            [ 7]  111 	ld	(hl),a
   5030 69            [ 4]  112 	ld	l, c
   5031 60            [ 4]  113 	ld	h, b
   5032 23            [ 6]  114 	inc	hl
   5033 23            [ 6]  115 	inc	hl
   5034 AF            [ 4]  116 	xor	a, a
   5035 DD 96 04      [19]  117 	sub	a, 4 (ix)
   5038 5F            [ 4]  118 	ld	e,a
   5039 3E 00         [ 7]  119 	ld	a, #0x00
   503B DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   503E 57            [ 4]  121 	ld	d,a
   503F 73            [ 7]  122 	ld	(hl),e
   5040 23            [ 6]  123 	inc	hl
   5041 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   5042 DD 7E 05      [19]  126 	ld	a,5 (ix)
   5045 07            [ 4]  127 	rlca
   5046 E6 01         [ 7]  128 	and	a,#0x01
   5048 6F            [ 4]  129 	ld	l,a
   5049 17            [ 4]  130 	rla
   504A 9F            [ 4]  131 	sbc	a, a
   504B 67            [ 4]  132 	ld	h,a
   504C 29            [11]  133 	add	hl, hl
   504D 09            [11]  134 	add	hl,bc
   504E 4E            [ 7]  135 	ld	c,(hl)
   504F 23            [ 6]  136 	inc	hl
   5050 66            [ 7]  137 	ld	h,(hl)
   5051 69            [ 4]  138 	ld	l, c
   5052 DD F9         [10]  139 	ld	sp, ix
   5054 DD E1         [14]  140 	pop	ix
   5056 C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
