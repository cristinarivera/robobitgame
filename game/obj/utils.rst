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
   4FAA                      48 _getTilePtr::
   4FAA DD E5         [15]   49 	push	ix
   4FAC DD 21 00 00   [14]   50 	ld	ix,#0
   4FB0 DD 39         [15]   51 	add	ix,sp
                             52 ;src/utils.c:5: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   4FB2 DD 4E 07      [19]   53 	ld	c,7 (ix)
   4FB5 06 00         [ 7]   54 	ld	b,#0x00
   4FB7 79            [ 4]   55 	ld	a,c
   4FB8 C6 E8         [ 7]   56 	add	a,#0xE8
   4FBA 5F            [ 4]   57 	ld	e,a
   4FBB 78            [ 4]   58 	ld	a,b
   4FBC CE FF         [ 7]   59 	adc	a,#0xFF
   4FBE 57            [ 4]   60 	ld	d,a
   4FBF 6B            [ 4]   61 	ld	l, e
   4FC0 62            [ 4]   62 	ld	h, d
   4FC1 CB 7A         [ 8]   63 	bit	7, d
   4FC3 28 04         [12]   64 	jr	Z,00103$
   4FC5 21 EB FF      [10]   65 	ld	hl,#0xFFEB
   4FC8 09            [11]   66 	add	hl,bc
   4FC9                      67 00103$:
   4FC9 CB 2C         [ 8]   68 	sra	h
   4FCB CB 1D         [ 8]   69 	rr	l
   4FCD CB 2C         [ 8]   70 	sra	h
   4FCF CB 1D         [ 8]   71 	rr	l
   4FD1 4D            [ 4]   72 	ld	c, l
   4FD2 44            [ 4]   73 	ld	b, h
   4FD3 29            [11]   74 	add	hl, hl
   4FD4 29            [11]   75 	add	hl, hl
   4FD5 09            [11]   76 	add	hl, bc
   4FD6 29            [11]   77 	add	hl, hl
   4FD7 29            [11]   78 	add	hl, hl
   4FD8 29            [11]   79 	add	hl, hl
   4FD9 4D            [ 4]   80 	ld	c,l
   4FDA 44            [ 4]   81 	ld	b,h
   4FDB DD 6E 04      [19]   82 	ld	l,4 (ix)
   4FDE DD 66 05      [19]   83 	ld	h,5 (ix)
   4FE1 09            [11]   84 	add	hl,bc
   4FE2 DD 4E 06      [19]   85 	ld	c,6 (ix)
   4FE5 CB 39         [ 8]   86 	srl	c
   4FE7 59            [ 4]   87 	ld	e,c
   4FE8 16 00         [ 7]   88 	ld	d,#0x00
   4FEA 19            [11]   89 	add	hl,de
   4FEB DD E1         [14]   90 	pop	ix
   4FED C9            [10]   91 	ret
                             92 ;src/utils.c:8: i16 abs (i16 n) {
                             93 ;	---------------------------------
                             94 ; Function abs
                             95 ; ---------------------------------
   4FEE                      96 _abs::
   4FEE DD E5         [15]   97 	push	ix
   4FF0 DD 21 00 00   [14]   98 	ld	ix,#0
   4FF4 DD 39         [15]   99 	add	ix,sp
   4FF6 F5            [11]  100 	push	af
   4FF7 F5            [11]  101 	push	af
                            102 ;src/utils.c:9: const i16 ret[2] = { n, -n };
   4FF8 21 00 00      [10]  103 	ld	hl,#0x0000
   4FFB 39            [11]  104 	add	hl,sp
   4FFC 4D            [ 4]  105 	ld	c,l
   4FFD 44            [ 4]  106 	ld	b,h
   4FFE DD 7E 04      [19]  107 	ld	a,4 (ix)
   5001 77            [ 7]  108 	ld	(hl),a
   5002 23            [ 6]  109 	inc	hl
   5003 DD 7E 05      [19]  110 	ld	a,5 (ix)
   5006 77            [ 7]  111 	ld	(hl),a
   5007 69            [ 4]  112 	ld	l, c
   5008 60            [ 4]  113 	ld	h, b
   5009 23            [ 6]  114 	inc	hl
   500A 23            [ 6]  115 	inc	hl
   500B AF            [ 4]  116 	xor	a, a
   500C DD 96 04      [19]  117 	sub	a, 4 (ix)
   500F 5F            [ 4]  118 	ld	e,a
   5010 3E 00         [ 7]  119 	ld	a, #0x00
   5012 DD 9E 05      [19]  120 	sbc	a, 5 (ix)
   5015 57            [ 4]  121 	ld	d,a
   5016 73            [ 7]  122 	ld	(hl),e
   5017 23            [ 6]  123 	inc	hl
   5018 72            [ 7]  124 	ld	(hl),d
                            125 ;src/utils.c:10: return ret[n<0];
   5019 DD 7E 05      [19]  126 	ld	a,5 (ix)
   501C 07            [ 4]  127 	rlca
   501D E6 01         [ 7]  128 	and	a,#0x01
   501F 6F            [ 4]  129 	ld	l,a
   5020 17            [ 4]  130 	rla
   5021 9F            [ 4]  131 	sbc	a, a
   5022 67            [ 4]  132 	ld	h,a
   5023 29            [11]  133 	add	hl, hl
   5024 09            [11]  134 	add	hl,bc
   5025 4E            [ 7]  135 	ld	c,(hl)
   5026 23            [ 6]  136 	inc	hl
   5027 66            [ 7]  137 	ld	h,(hl)
   5028 69            [ 4]  138 	ld	l, c
   5029 DD F9         [10]  139 	ld	sp, ix
   502B DD E1         [14]  140 	pop	ix
   502D C9            [10]  141 	ret
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
