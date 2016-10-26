                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module knifestruct
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _getTilePtr
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSpriteMaskedAlignedTable
                             15 	.globl _dibujarCuchillo
                             16 	.globl _borrarCuchillo
                             17 	.globl _redibujarCuchillo
                             18 	.globl _lanzarCuchillo
                             19 	.globl _checkOffBounds
                             20 	.globl _checkKnifeCollision
                             21 	.globl _moverCuchillo
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
                             33 ;--------------------------------------------------------
                             34 ; absolute external ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DABS (ABS)
                             37 ;--------------------------------------------------------
                             38 ; global & static initialisations
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _GSINIT
                             42 	.area _GSFINAL
                             43 	.area _GSINIT
                             44 ;--------------------------------------------------------
                             45 ; Home
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _HOME
                             49 ;--------------------------------------------------------
                             50 ; code
                             51 ;--------------------------------------------------------
                             52 	.area _CODE
                             53 ;src/knifestruct.c:22: void dibujarCuchillo(TKnife* cu, u8* g_tablatrans) {
                             54 ;	---------------------------------
                             55 ; Function dibujarCuchillo
                             56 ; ---------------------------------
   3F0A                      57 _dibujarCuchillo::
   3F0A DD E5         [15]   58 	push	ix
   3F0C DD 21 00 00   [14]   59 	ld	ix,#0
   3F10 DD 39         [15]   60 	add	ix,sp
   3F12 21 FA FF      [10]   61 	ld	hl,#-6
   3F15 39            [11]   62 	add	hl,sp
   3F16 F9            [ 6]   63 	ld	sp,hl
                             64 ;src/knifestruct.c:23: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   3F17 DD 5E 04      [19]   65 	ld	e,4 (ix)
   3F1A DD 56 05      [19]   66 	ld	d,5 (ix)
   3F1D 6B            [ 4]   67 	ld	l, e
   3F1E 62            [ 4]   68 	ld	h, d
   3F1F 23            [ 6]   69 	inc	hl
   3F20 46            [ 7]   70 	ld	b,(hl)
   3F21 1A            [ 7]   71 	ld	a,(de)
   3F22 D5            [11]   72 	push	de
   3F23 C5            [11]   73 	push	bc
   3F24 33            [ 6]   74 	inc	sp
   3F25 F5            [11]   75 	push	af
   3F26 33            [ 6]   76 	inc	sp
   3F27 21 00 C0      [10]   77 	ld	hl,#0xC000
   3F2A E5            [11]   78 	push	hl
   3F2B CD 0B 5F      [17]   79 	call	_cpct_getScreenPtr
   3F2E D1            [10]   80 	pop	de
   3F2F 33            [ 6]   81 	inc	sp
   3F30 33            [ 6]   82 	inc	sp
   3F31 E5            [11]   83 	push	hl
                             84 ;src/knifestruct.c:24: if(cu->eje == E_X){
   3F32 D5            [11]   85 	push	de
   3F33 FD E1         [14]   86 	pop	iy
   3F35 FD 4E 08      [19]   87 	ld	c,8 (iy)
                             88 ;src/knifestruct.c:25: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   3F38 DD 7E 06      [19]   89 	ld	a,6 (ix)
   3F3B DD 77 FC      [19]   90 	ld	-4 (ix),a
   3F3E DD 7E 07      [19]   91 	ld	a,7 (ix)
   3F41 DD 77 FD      [19]   92 	ld	-3 (ix),a
   3F44 DD 7E FA      [19]   93 	ld	a,-6 (ix)
   3F47 DD 77 FE      [19]   94 	ld	-2 (ix),a
   3F4A DD 7E FB      [19]   95 	ld	a,-5 (ix)
   3F4D DD 77 FF      [19]   96 	ld	-1 (ix),a
   3F50 13            [ 6]   97 	inc	de
   3F51 13            [ 6]   98 	inc	de
   3F52 13            [ 6]   99 	inc	de
   3F53 13            [ 6]  100 	inc	de
                            101 ;src/knifestruct.c:24: if(cu->eje == E_X){
   3F54 79            [ 4]  102 	ld	a,c
   3F55 B7            [ 4]  103 	or	a, a
   3F56 20 1A         [12]  104 	jr	NZ,00104$
                            105 ;src/knifestruct.c:25: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   3F58 EB            [ 4]  106 	ex	de,hl
   3F59 4E            [ 7]  107 	ld	c,(hl)
   3F5A 23            [ 6]  108 	inc	hl
   3F5B 46            [ 7]  109 	ld	b,(hl)
   3F5C D1            [10]  110 	pop	de
   3F5D E1            [10]  111 	pop	hl
   3F5E E5            [11]  112 	push	hl
   3F5F D5            [11]  113 	push	de
   3F60 E5            [11]  114 	push	hl
   3F61 21 04 04      [10]  115 	ld	hl,#0x0404
   3F64 E5            [11]  116 	push	hl
   3F65 DD 6E FE      [19]  117 	ld	l,-2 (ix)
   3F68 DD 66 FF      [19]  118 	ld	h,-1 (ix)
   3F6B E5            [11]  119 	push	hl
   3F6C C5            [11]  120 	push	bc
   3F6D CD 2B 5F      [17]  121 	call	_cpct_drawSpriteMaskedAlignedTable
   3F70 18 1B         [12]  122 	jr	00106$
   3F72                     123 00104$:
                            124 ;src/knifestruct.c:28: else if(cu->eje == E_Y){
   3F72 0D            [ 4]  125 	dec	c
   3F73 20 18         [12]  126 	jr	NZ,00106$
                            127 ;src/knifestruct.c:29: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   3F75 EB            [ 4]  128 	ex	de,hl
   3F76 4E            [ 7]  129 	ld	c,(hl)
   3F77 23            [ 6]  130 	inc	hl
   3F78 46            [ 7]  131 	ld	b,(hl)
   3F79 D1            [10]  132 	pop	de
   3F7A E1            [10]  133 	pop	hl
   3F7B E5            [11]  134 	push	hl
   3F7C D5            [11]  135 	push	de
   3F7D E5            [11]  136 	push	hl
   3F7E 21 02 08      [10]  137 	ld	hl,#0x0802
   3F81 E5            [11]  138 	push	hl
   3F82 DD 6E FE      [19]  139 	ld	l,-2 (ix)
   3F85 DD 66 FF      [19]  140 	ld	h,-1 (ix)
   3F88 E5            [11]  141 	push	hl
   3F89 C5            [11]  142 	push	bc
   3F8A CD 2B 5F      [17]  143 	call	_cpct_drawSpriteMaskedAlignedTable
   3F8D                     144 00106$:
   3F8D DD F9         [10]  145 	ld	sp, ix
   3F8F DD E1         [14]  146 	pop	ix
   3F91 C9            [10]  147 	ret
                            148 ;src/knifestruct.c:33: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            149 ;	---------------------------------
                            150 ; Function borrarCuchillo
                            151 ; ---------------------------------
   3F92                     152 _borrarCuchillo::
   3F92 DD E5         [15]  153 	push	ix
   3F94 DD 21 00 00   [14]  154 	ld	ix,#0
   3F98 DD 39         [15]  155 	add	ix,sp
   3F9A F5            [11]  156 	push	af
   3F9B F5            [11]  157 	push	af
                            158 ;src/knifestruct.c:39: w = 4 + (x & 1);
   3F9C DD 7E 05      [19]  159 	ld	a,5 (ix)
   3F9F E6 01         [ 7]  160 	and	a, #0x01
   3FA1 47            [ 4]  161 	ld	b,a
                            162 ;src/knifestruct.c:40: h = 1 + (y & 3 ? 1 : 0);
   3FA2 DD 7E 06      [19]  163 	ld	a,6 (ix)
   3FA5 E6 03         [ 7]  164 	and	a, #0x03
   3FA7 4F            [ 4]  165 	ld	c,a
                            166 ;src/knifestruct.c:38: if(eje == E_X){
   3FA8 DD 7E 04      [19]  167 	ld	a,4 (ix)
   3FAB B7            [ 4]  168 	or	a, a
   3FAC 20 11         [12]  169 	jr	NZ,00102$
                            170 ;src/knifestruct.c:39: w = 4 + (x & 1);
   3FAE 04            [ 4]  171 	inc	b
   3FAF 04            [ 4]  172 	inc	b
   3FB0 04            [ 4]  173 	inc	b
   3FB1 04            [ 4]  174 	inc	b
                            175 ;src/knifestruct.c:40: h = 1 + (y & 3 ? 1 : 0);
   3FB2 79            [ 4]  176 	ld	a,c
   3FB3 B7            [ 4]  177 	or	a, a
   3FB4 28 04         [12]  178 	jr	Z,00106$
   3FB6 0E 01         [ 7]  179 	ld	c,#0x01
   3FB8 18 02         [12]  180 	jr	00107$
   3FBA                     181 00106$:
   3FBA 0E 00         [ 7]  182 	ld	c,#0x00
   3FBC                     183 00107$:
   3FBC 0C            [ 4]  184 	inc	c
   3FBD 18 0E         [12]  185 	jr	00103$
   3FBF                     186 00102$:
                            187 ;src/knifestruct.c:42: w = 2 + (x & 1);
   3FBF 04            [ 4]  188 	inc	b
   3FC0 04            [ 4]  189 	inc	b
                            190 ;src/knifestruct.c:43: h = 2 + (y & 3 ? 1 : 0);
   3FC1 79            [ 4]  191 	ld	a,c
   3FC2 B7            [ 4]  192 	or	a, a
   3FC3 28 04         [12]  193 	jr	Z,00108$
   3FC5 0E 01         [ 7]  194 	ld	c,#0x01
   3FC7 18 02         [12]  195 	jr	00109$
   3FC9                     196 00108$:
   3FC9 0E 00         [ 7]  197 	ld	c,#0x00
   3FCB                     198 00109$:
   3FCB 0C            [ 4]  199 	inc	c
   3FCC 0C            [ 4]  200 	inc	c
   3FCD                     201 00103$:
                            202 ;src/knifestruct.c:47: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   3FCD DD 7E 07      [19]  203 	ld	a,7 (ix)
   3FD0 DD 77 FC      [19]  204 	ld	-4 (ix),a
   3FD3 DD 7E 08      [19]  205 	ld	a,8 (ix)
   3FD6 DD 77 FD      [19]  206 	ld	-3 (ix),a
   3FD9 DD 5E 06      [19]  207 	ld	e,6 (ix)
   3FDC 16 00         [ 7]  208 	ld	d,#0x00
   3FDE 7B            [ 4]  209 	ld	a,e
   3FDF C6 E8         [ 7]  210 	add	a,#0xE8
   3FE1 DD 77 FE      [19]  211 	ld	-2 (ix),a
   3FE4 7A            [ 4]  212 	ld	a,d
   3FE5 CE FF         [ 7]  213 	adc	a,#0xFF
   3FE7 DD 77 FF      [19]  214 	ld	-1 (ix),a
   3FEA DD 6E FE      [19]  215 	ld	l,-2 (ix)
   3FED DD 66 FF      [19]  216 	ld	h,-1 (ix)
   3FF0 DD CB FF 7E   [20]  217 	bit	7, -1 (ix)
   3FF4 28 04         [12]  218 	jr	Z,00110$
   3FF6 21 EB FF      [10]  219 	ld	hl,#0xFFEB
   3FF9 19            [11]  220 	add	hl,de
   3FFA                     221 00110$:
   3FFA 5D            [ 4]  222 	ld	e,l
   3FFB CB 2C         [ 8]  223 	sra	h
   3FFD CB 1B         [ 8]  224 	rr	e
   3FFF CB 2C         [ 8]  225 	sra	h
   4001 CB 1B         [ 8]  226 	rr	e
   4003 DD 56 05      [19]  227 	ld	d,5 (ix)
   4006 CB 3A         [ 8]  228 	srl	d
   4008 E1            [10]  229 	pop	hl
   4009 E5            [11]  230 	push	hl
   400A E5            [11]  231 	push	hl
   400B 21 F0 C0      [10]  232 	ld	hl,#0xC0F0
   400E E5            [11]  233 	push	hl
   400F 3E 28         [ 7]  234 	ld	a,#0x28
   4011 F5            [11]  235 	push	af
   4012 33            [ 6]  236 	inc	sp
   4013 79            [ 4]  237 	ld	a,c
   4014 F5            [11]  238 	push	af
   4015 33            [ 6]  239 	inc	sp
   4016 C5            [11]  240 	push	bc
   4017 33            [ 6]  241 	inc	sp
   4018 7B            [ 4]  242 	ld	a,e
   4019 F5            [11]  243 	push	af
   401A 33            [ 6]  244 	inc	sp
   401B D5            [11]  245 	push	de
   401C 33            [ 6]  246 	inc	sp
   401D CD ED 53      [17]  247 	call	_cpct_etm_drawTileBox2x4
   4020 DD F9         [10]  248 	ld	sp, ix
   4022 DD E1         [14]  249 	pop	ix
   4024 C9            [10]  250 	ret
                            251 ;src/knifestruct.c:50: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            252 ;	---------------------------------
                            253 ; Function redibujarCuchillo
                            254 ; ---------------------------------
   4025                     255 _redibujarCuchillo::
   4025 DD E5         [15]  256 	push	ix
   4027 DD 21 00 00   [14]  257 	ld	ix,#0
   402B DD 39         [15]  258 	add	ix,sp
                            259 ;src/knifestruct.c:51: borrarCuchillo(eje, x, y, mapa);
   402D DD 6E 0B      [19]  260 	ld	l,11 (ix)
   4030 DD 66 0C      [19]  261 	ld	h,12 (ix)
   4033 E5            [11]  262 	push	hl
   4034 DD 66 06      [19]  263 	ld	h,6 (ix)
   4037 DD 6E 05      [19]  264 	ld	l,5 (ix)
   403A E5            [11]  265 	push	hl
   403B DD 7E 04      [19]  266 	ld	a,4 (ix)
   403E F5            [11]  267 	push	af
   403F 33            [ 6]  268 	inc	sp
   4040 CD 92 3F      [17]  269 	call	_borrarCuchillo
   4043 F1            [10]  270 	pop	af
   4044 F1            [10]  271 	pop	af
   4045 33            [ 6]  272 	inc	sp
                            273 ;src/knifestruct.c:52: cu->px = cu->x;
   4046 DD 4E 07      [19]  274 	ld	c,7 (ix)
   4049 DD 46 08      [19]  275 	ld	b,8 (ix)
   404C 59            [ 4]  276 	ld	e, c
   404D 50            [ 4]  277 	ld	d, b
   404E 13            [ 6]  278 	inc	de
   404F 13            [ 6]  279 	inc	de
   4050 0A            [ 7]  280 	ld	a,(bc)
   4051 12            [ 7]  281 	ld	(de),a
                            282 ;src/knifestruct.c:53: cu->py = cu->y;
   4052 59            [ 4]  283 	ld	e, c
   4053 50            [ 4]  284 	ld	d, b
   4054 13            [ 6]  285 	inc	de
   4055 13            [ 6]  286 	inc	de
   4056 13            [ 6]  287 	inc	de
   4057 69            [ 4]  288 	ld	l, c
   4058 60            [ 4]  289 	ld	h, b
   4059 23            [ 6]  290 	inc	hl
   405A 7E            [ 7]  291 	ld	a,(hl)
   405B 12            [ 7]  292 	ld	(de),a
                            293 ;src/knifestruct.c:54: dibujarCuchillo(cu, g_tablatrans);
   405C DD 6E 09      [19]  294 	ld	l,9 (ix)
   405F DD 66 0A      [19]  295 	ld	h,10 (ix)
   4062 E5            [11]  296 	push	hl
   4063 C5            [11]  297 	push	bc
   4064 CD 0A 3F      [17]  298 	call	_dibujarCuchillo
   4067 F1            [10]  299 	pop	af
   4068 F1            [10]  300 	pop	af
   4069 DD E1         [14]  301 	pop	ix
   406B C9            [10]  302 	ret
                            303 ;src/knifestruct.c:57: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            304 ;	---------------------------------
                            305 ; Function lanzarCuchillo
                            306 ; ---------------------------------
   406C                     307 _lanzarCuchillo::
   406C DD E5         [15]  308 	push	ix
   406E DD 21 00 00   [14]  309 	ld	ix,#0
   4072 DD 39         [15]  310 	add	ix,sp
   4074 21 F2 FF      [10]  311 	ld	hl,#-14
   4077 39            [11]  312 	add	hl,sp
   4078 F9            [ 6]  313 	ld	sp,hl
                            314 ;src/knifestruct.c:59: if(!cu->lanzado){
   4079 DD 4E 04      [19]  315 	ld	c,4 (ix)
   407C DD 46 05      [19]  316 	ld	b,5 (ix)
   407F 21 06 00      [10]  317 	ld	hl,#0x0006
   4082 09            [11]  318 	add	hl,bc
   4083 DD 75 FC      [19]  319 	ld	-4 (ix),l
   4086 DD 74 FD      [19]  320 	ld	-3 (ix),h
   4089 DD 6E FC      [19]  321 	ld	l,-4 (ix)
   408C DD 66 FD      [19]  322 	ld	h,-3 (ix)
   408F 7E            [ 7]  323 	ld	a,(hl)
   4090 B7            [ 4]  324 	or	a, a
   4091 C2 C8 42      [10]  325 	jp	NZ,00122$
                            326 ;src/knifestruct.c:61: if(prota->mira == M_derecha){
   4094 DD 5E 06      [19]  327 	ld	e,6 (ix)
   4097 DD 56 07      [19]  328 	ld	d,7 (ix)
   409A 6B            [ 4]  329 	ld	l, e
   409B 62            [ 4]  330 	ld	h, d
   409C C5            [11]  331 	push	bc
   409D 01 07 00      [10]  332 	ld	bc, #0x0007
   40A0 09            [11]  333 	add	hl, bc
   40A1 C1            [10]  334 	pop	bc
   40A2 6E            [ 7]  335 	ld	l,(hl)
                            336 ;src/knifestruct.c:62: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   40A3 7B            [ 4]  337 	ld	a,e
   40A4 C6 01         [ 7]  338 	add	a, #0x01
   40A6 DD 77 F3      [19]  339 	ld	-13 (ix),a
   40A9 7A            [ 4]  340 	ld	a,d
   40AA CE 00         [ 7]  341 	adc	a, #0x00
   40AC DD 77 F4      [19]  342 	ld	-12 (ix),a
                            343 ;src/knifestruct.c:64: cu->direccion = M_derecha;
   40AF 79            [ 4]  344 	ld	a,c
   40B0 C6 07         [ 7]  345 	add	a, #0x07
   40B2 DD 77 FE      [19]  346 	ld	-2 (ix),a
   40B5 78            [ 4]  347 	ld	a,b
   40B6 CE 00         [ 7]  348 	adc	a, #0x00
   40B8 DD 77 FF      [19]  349 	ld	-1 (ix),a
                            350 ;src/knifestruct.c:66: cu->y=prota->y + G_HERO_H /2;
   40BB 79            [ 4]  351 	ld	a,c
   40BC C6 01         [ 7]  352 	add	a, #0x01
   40BE DD 77 FA      [19]  353 	ld	-6 (ix),a
   40C1 78            [ 4]  354 	ld	a,b
   40C2 CE 00         [ 7]  355 	adc	a, #0x00
   40C4 DD 77 FB      [19]  356 	ld	-5 (ix),a
                            357 ;src/knifestruct.c:67: cu->sprite=g_knifeX_0;
   40C7 79            [ 4]  358 	ld	a,c
   40C8 C6 04         [ 7]  359 	add	a, #0x04
   40CA DD 77 F8      [19]  360 	ld	-8 (ix),a
   40CD 78            [ 4]  361 	ld	a,b
   40CE CE 00         [ 7]  362 	adc	a, #0x00
   40D0 DD 77 F9      [19]  363 	ld	-7 (ix),a
                            364 ;src/knifestruct.c:68: cu->eje = E_X;
   40D3 79            [ 4]  365 	ld	a,c
   40D4 C6 08         [ 7]  366 	add	a, #0x08
   40D6 DD 77 F5      [19]  367 	ld	-11 (ix),a
   40D9 78            [ 4]  368 	ld	a,b
   40DA CE 00         [ 7]  369 	adc	a, #0x00
   40DC DD 77 F6      [19]  370 	ld	-10 (ix),a
                            371 ;src/knifestruct.c:61: if(prota->mira == M_derecha){
   40DF 7D            [ 4]  372 	ld	a,l
   40E0 B7            [ 4]  373 	or	a, a
   40E1 20 77         [12]  374 	jr	NZ,00118$
                            375 ;src/knifestruct.c:62: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   40E3 DD 6E F3      [19]  376 	ld	l,-13 (ix)
   40E6 DD 66 F4      [19]  377 	ld	h,-12 (ix)
   40E9 7E            [ 7]  378 	ld	a,(hl)
   40EA C6 0B         [ 7]  379 	add	a, #0x0B
   40EC DD 77 F2      [19]  380 	ld	-14 (ix),a
   40EF 1A            [ 7]  381 	ld	a,(de)
   40F0 C6 0C         [ 7]  382 	add	a, #0x0C
   40F2 DD 77 F7      [19]  383 	ld	-9 (ix),a
   40F5 C5            [11]  384 	push	bc
   40F6 D5            [11]  385 	push	de
   40F7 DD 66 F2      [19]  386 	ld	h,-14 (ix)
   40FA DD 6E F7      [19]  387 	ld	l,-9 (ix)
   40FD E5            [11]  388 	push	hl
   40FE DD 6E 08      [19]  389 	ld	l,8 (ix)
   4101 DD 66 09      [19]  390 	ld	h,9 (ix)
   4104 E5            [11]  391 	push	hl
   4105 CD 71 4B      [17]  392 	call	_getTilePtr
   4108 F1            [10]  393 	pop	af
   4109 F1            [10]  394 	pop	af
   410A D1            [10]  395 	pop	de
   410B C1            [10]  396 	pop	bc
   410C 6E            [ 7]  397 	ld	l,(hl)
   410D 3E 02         [ 7]  398 	ld	a,#0x02
   410F 95            [ 4]  399 	sub	a, l
   4110 DA C8 42      [10]  400 	jp	C,00122$
                            401 ;src/knifestruct.c:63: cu->lanzado = SI;
   4113 DD 6E FC      [19]  402 	ld	l,-4 (ix)
   4116 DD 66 FD      [19]  403 	ld	h,-3 (ix)
   4119 36 01         [10]  404 	ld	(hl),#0x01
                            405 ;src/knifestruct.c:64: cu->direccion = M_derecha;
   411B DD 6E FE      [19]  406 	ld	l,-2 (ix)
   411E DD 66 FF      [19]  407 	ld	h,-1 (ix)
   4121 36 00         [10]  408 	ld	(hl),#0x00
                            409 ;src/knifestruct.c:65: cu->x=prota->x + G_HERO_W;
   4123 1A            [ 7]  410 	ld	a,(de)
   4124 C6 07         [ 7]  411 	add	a, #0x07
   4126 02            [ 7]  412 	ld	(bc),a
                            413 ;src/knifestruct.c:66: cu->y=prota->y + G_HERO_H /2;
   4127 DD 6E F3      [19]  414 	ld	l,-13 (ix)
   412A DD 66 F4      [19]  415 	ld	h,-12 (ix)
   412D 7E            [ 7]  416 	ld	a,(hl)
   412E C6 0B         [ 7]  417 	add	a, #0x0B
   4130 DD 6E FA      [19]  418 	ld	l,-6 (ix)
   4133 DD 66 FB      [19]  419 	ld	h,-5 (ix)
   4136 77            [ 7]  420 	ld	(hl),a
                            421 ;src/knifestruct.c:67: cu->sprite=g_knifeX_0;
   4137 DD 6E F8      [19]  422 	ld	l,-8 (ix)
   413A DD 66 F9      [19]  423 	ld	h,-7 (ix)
   413D 36 C0         [10]  424 	ld	(hl),#<(_g_knifeX_0)
   413F 23            [ 6]  425 	inc	hl
   4140 36 17         [10]  426 	ld	(hl),#>(_g_knifeX_0)
                            427 ;src/knifestruct.c:68: cu->eje = E_X;
   4142 DD 6E F5      [19]  428 	ld	l,-11 (ix)
   4145 DD 66 F6      [19]  429 	ld	h,-10 (ix)
   4148 36 00         [10]  430 	ld	(hl),#0x00
                            431 ;src/knifestruct.c:69: dibujarCuchillo(cu, g_tablatrans);
   414A DD 6E 0A      [19]  432 	ld	l,10 (ix)
   414D DD 66 0B      [19]  433 	ld	h,11 (ix)
   4150 E5            [11]  434 	push	hl
   4151 C5            [11]  435 	push	bc
   4152 CD 0A 3F      [17]  436 	call	_dibujarCuchillo
   4155 F1            [10]  437 	pop	af
   4156 F1            [10]  438 	pop	af
   4157 C3 C8 42      [10]  439 	jp	00122$
   415A                     440 00118$:
                            441 ;src/knifestruct.c:72: else if(prota->mira == M_izquierda){
   415A 7D            [ 4]  442 	ld	a,l
   415B 3D            [ 4]  443 	dec	a
   415C 20 77         [12]  444 	jr	NZ,00115$
                            445 ;src/knifestruct.c:73: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   415E DD 6E F3      [19]  446 	ld	l,-13 (ix)
   4161 DD 66 F4      [19]  447 	ld	h,-12 (ix)
   4164 7E            [ 7]  448 	ld	a,(hl)
   4165 C6 0B         [ 7]  449 	add	a, #0x0B
   4167 DD 77 F7      [19]  450 	ld	-9 (ix),a
   416A 1A            [ 7]  451 	ld	a,(de)
   416B C6 F6         [ 7]  452 	add	a,#0xF6
   416D DD 77 F2      [19]  453 	ld	-14 (ix),a
   4170 C5            [11]  454 	push	bc
   4171 D5            [11]  455 	push	de
   4172 DD 66 F7      [19]  456 	ld	h,-9 (ix)
   4175 DD 6E F2      [19]  457 	ld	l,-14 (ix)
   4178 E5            [11]  458 	push	hl
   4179 DD 6E 08      [19]  459 	ld	l,8 (ix)
   417C DD 66 09      [19]  460 	ld	h,9 (ix)
   417F E5            [11]  461 	push	hl
   4180 CD 71 4B      [17]  462 	call	_getTilePtr
   4183 F1            [10]  463 	pop	af
   4184 F1            [10]  464 	pop	af
   4185 D1            [10]  465 	pop	de
   4186 C1            [10]  466 	pop	bc
   4187 6E            [ 7]  467 	ld	l,(hl)
   4188 3E 02         [ 7]  468 	ld	a,#0x02
   418A 95            [ 4]  469 	sub	a, l
   418B DA C8 42      [10]  470 	jp	C,00122$
                            471 ;src/knifestruct.c:74: cu->lanzado = SI;
   418E DD 6E FC      [19]  472 	ld	l,-4 (ix)
   4191 DD 66 FD      [19]  473 	ld	h,-3 (ix)
   4194 36 01         [10]  474 	ld	(hl),#0x01
                            475 ;src/knifestruct.c:75: cu->direccion = M_izquierda;
   4196 DD 6E FE      [19]  476 	ld	l,-2 (ix)
   4199 DD 66 FF      [19]  477 	ld	h,-1 (ix)
   419C 36 01         [10]  478 	ld	(hl),#0x01
                            479 ;src/knifestruct.c:76: cu->x = prota->x - G_KNIFEX_0_W;
   419E 1A            [ 7]  480 	ld	a,(de)
   419F C6 FC         [ 7]  481 	add	a,#0xFC
   41A1 02            [ 7]  482 	ld	(bc),a
                            483 ;src/knifestruct.c:77: cu->y = prota->y + G_HERO_H /2;
   41A2 DD 6E F3      [19]  484 	ld	l,-13 (ix)
   41A5 DD 66 F4      [19]  485 	ld	h,-12 (ix)
   41A8 7E            [ 7]  486 	ld	a,(hl)
   41A9 C6 0B         [ 7]  487 	add	a, #0x0B
   41AB DD 6E FA      [19]  488 	ld	l,-6 (ix)
   41AE DD 66 FB      [19]  489 	ld	h,-5 (ix)
   41B1 77            [ 7]  490 	ld	(hl),a
                            491 ;src/knifestruct.c:78: cu->sprite = g_knifeX_1;
   41B2 DD 6E F8      [19]  492 	ld	l,-8 (ix)
   41B5 DD 66 F9      [19]  493 	ld	h,-7 (ix)
   41B8 36 D0         [10]  494 	ld	(hl),#<(_g_knifeX_1)
   41BA 23            [ 6]  495 	inc	hl
   41BB 36 17         [10]  496 	ld	(hl),#>(_g_knifeX_1)
                            497 ;src/knifestruct.c:79: cu->eje = E_X;
   41BD DD 6E F5      [19]  498 	ld	l,-11 (ix)
   41C0 DD 66 F6      [19]  499 	ld	h,-10 (ix)
   41C3 36 00         [10]  500 	ld	(hl),#0x00
                            501 ;src/knifestruct.c:80: dibujarCuchillo(cu, g_tablatrans);
   41C5 DD 6E 0A      [19]  502 	ld	l,10 (ix)
   41C8 DD 66 0B      [19]  503 	ld	h,11 (ix)
   41CB E5            [11]  504 	push	hl
   41CC C5            [11]  505 	push	bc
   41CD CD 0A 3F      [17]  506 	call	_dibujarCuchillo
   41D0 F1            [10]  507 	pop	af
   41D1 F1            [10]  508 	pop	af
   41D2 C3 C8 42      [10]  509 	jp	00122$
   41D5                     510 00115$:
                            511 ;src/knifestruct.c:83: else if(prota->mira == M_abajo){
   41D5 7D            [ 4]  512 	ld	a,l
   41D6 D6 03         [ 7]  513 	sub	a, #0x03
   41D8 20 76         [12]  514 	jr	NZ,00112$
                            515 ;src/knifestruct.c:85: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   41DA DD 6E F3      [19]  516 	ld	l,-13 (ix)
   41DD DD 66 F4      [19]  517 	ld	h,-12 (ix)
   41E0 7E            [ 7]  518 	ld	a,(hl)
   41E1 C6 1F         [ 7]  519 	add	a, #0x1F
   41E3 DD 77 F7      [19]  520 	ld	-9 (ix),a
   41E6 1A            [ 7]  521 	ld	a,(de)
   41E7 C6 03         [ 7]  522 	add	a, #0x03
   41E9 DD 77 F2      [19]  523 	ld	-14 (ix),a
   41EC C5            [11]  524 	push	bc
   41ED D5            [11]  525 	push	de
   41EE DD 66 F7      [19]  526 	ld	h,-9 (ix)
   41F1 DD 6E F2      [19]  527 	ld	l,-14 (ix)
   41F4 E5            [11]  528 	push	hl
   41F5 DD 6E 08      [19]  529 	ld	l,8 (ix)
   41F8 DD 66 09      [19]  530 	ld	h,9 (ix)
   41FB E5            [11]  531 	push	hl
   41FC CD 71 4B      [17]  532 	call	_getTilePtr
   41FF F1            [10]  533 	pop	af
   4200 F1            [10]  534 	pop	af
   4201 D1            [10]  535 	pop	de
   4202 C1            [10]  536 	pop	bc
   4203 6E            [ 7]  537 	ld	l,(hl)
   4204 3E 02         [ 7]  538 	ld	a,#0x02
   4206 95            [ 4]  539 	sub	a, l
   4207 DA C8 42      [10]  540 	jp	C,00122$
                            541 ;src/knifestruct.c:86: cu->lanzado = SI;
   420A DD 6E FC      [19]  542 	ld	l,-4 (ix)
   420D DD 66 FD      [19]  543 	ld	h,-3 (ix)
   4210 36 01         [10]  544 	ld	(hl),#0x01
                            545 ;src/knifestruct.c:87: cu->direccion = M_abajo;
   4212 DD 6E FE      [19]  546 	ld	l,-2 (ix)
   4215 DD 66 FF      [19]  547 	ld	h,-1 (ix)
   4218 36 03         [10]  548 	ld	(hl),#0x03
                            549 ;src/knifestruct.c:88: cu->x = prota->x + G_HERO_W / 2;
   421A 1A            [ 7]  550 	ld	a,(de)
   421B C6 03         [ 7]  551 	add	a, #0x03
   421D 02            [ 7]  552 	ld	(bc),a
                            553 ;src/knifestruct.c:89: cu->y = prota->y + G_HERO_H;
   421E DD 6E F3      [19]  554 	ld	l,-13 (ix)
   4221 DD 66 F4      [19]  555 	ld	h,-12 (ix)
   4224 7E            [ 7]  556 	ld	a,(hl)
   4225 C6 16         [ 7]  557 	add	a, #0x16
   4227 DD 6E FA      [19]  558 	ld	l,-6 (ix)
   422A DD 66 FB      [19]  559 	ld	h,-5 (ix)
   422D 77            [ 7]  560 	ld	(hl),a
                            561 ;src/knifestruct.c:90: cu->sprite = g_knifeY_0;
   422E DD 6E F8      [19]  562 	ld	l,-8 (ix)
   4231 DD 66 F9      [19]  563 	ld	h,-7 (ix)
   4234 36 A0         [10]  564 	ld	(hl),#<(_g_knifeY_0)
   4236 23            [ 6]  565 	inc	hl
   4237 36 17         [10]  566 	ld	(hl),#>(_g_knifeY_0)
                            567 ;src/knifestruct.c:91: cu->eje = E_Y;
   4239 DD 6E F5      [19]  568 	ld	l,-11 (ix)
   423C DD 66 F6      [19]  569 	ld	h,-10 (ix)
   423F 36 01         [10]  570 	ld	(hl),#0x01
                            571 ;src/knifestruct.c:92: dibujarCuchillo(cu, g_tablatrans);
   4241 DD 6E 0A      [19]  572 	ld	l,10 (ix)
   4244 DD 66 0B      [19]  573 	ld	h,11 (ix)
   4247 E5            [11]  574 	push	hl
   4248 C5            [11]  575 	push	bc
   4249 CD 0A 3F      [17]  576 	call	_dibujarCuchillo
   424C F1            [10]  577 	pop	af
   424D F1            [10]  578 	pop	af
   424E 18 78         [12]  579 	jr	00122$
   4250                     580 00112$:
                            581 ;src/knifestruct.c:95: else if(prota->mira == M_arriba){
   4250 7D            [ 4]  582 	ld	a,l
   4251 D6 02         [ 7]  583 	sub	a, #0x02
   4253 20 73         [12]  584 	jr	NZ,00122$
                            585 ;src/knifestruct.c:96: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4255 DD 6E F3      [19]  586 	ld	l,-13 (ix)
   4258 DD 66 F4      [19]  587 	ld	h,-12 (ix)
   425B 7E            [ 7]  588 	ld	a,(hl)
   425C C6 F7         [ 7]  589 	add	a,#0xF7
   425E DD 77 F7      [19]  590 	ld	-9 (ix),a
   4261 1A            [ 7]  591 	ld	a,(de)
   4262 C6 03         [ 7]  592 	add	a, #0x03
   4264 DD 77 F2      [19]  593 	ld	-14 (ix),a
   4267 C5            [11]  594 	push	bc
   4268 D5            [11]  595 	push	de
   4269 DD 66 F7      [19]  596 	ld	h,-9 (ix)
   426C DD 6E F2      [19]  597 	ld	l,-14 (ix)
   426F E5            [11]  598 	push	hl
   4270 DD 6E 08      [19]  599 	ld	l,8 (ix)
   4273 DD 66 09      [19]  600 	ld	h,9 (ix)
   4276 E5            [11]  601 	push	hl
   4277 CD 71 4B      [17]  602 	call	_getTilePtr
   427A F1            [10]  603 	pop	af
   427B F1            [10]  604 	pop	af
   427C D1            [10]  605 	pop	de
   427D C1            [10]  606 	pop	bc
   427E 6E            [ 7]  607 	ld	l,(hl)
   427F 3E 02         [ 7]  608 	ld	a,#0x02
   4281 95            [ 4]  609 	sub	a, l
   4282 38 44         [12]  610 	jr	C,00122$
                            611 ;src/knifestruct.c:97: cu->lanzado = SI;
   4284 DD 6E FC      [19]  612 	ld	l,-4 (ix)
   4287 DD 66 FD      [19]  613 	ld	h,-3 (ix)
   428A 36 01         [10]  614 	ld	(hl),#0x01
                            615 ;src/knifestruct.c:98: cu->direccion = M_arriba;
   428C DD 6E FE      [19]  616 	ld	l,-2 (ix)
   428F DD 66 FF      [19]  617 	ld	h,-1 (ix)
   4292 36 02         [10]  618 	ld	(hl),#0x02
                            619 ;src/knifestruct.c:99: cu->x = prota->x + G_HERO_W / 2;
   4294 1A            [ 7]  620 	ld	a,(de)
   4295 C6 03         [ 7]  621 	add	a, #0x03
   4297 02            [ 7]  622 	ld	(bc),a
                            623 ;src/knifestruct.c:100: cu->y = prota->y - G_KNIFEY_0_H;
   4298 DD 6E F3      [19]  624 	ld	l,-13 (ix)
   429B DD 66 F4      [19]  625 	ld	h,-12 (ix)
   429E 7E            [ 7]  626 	ld	a,(hl)
   429F C6 F8         [ 7]  627 	add	a,#0xF8
   42A1 DD 6E FA      [19]  628 	ld	l,-6 (ix)
   42A4 DD 66 FB      [19]  629 	ld	h,-5 (ix)
   42A7 77            [ 7]  630 	ld	(hl),a
                            631 ;src/knifestruct.c:101: cu->sprite = g_knifeY_1;
   42A8 DD 6E F8      [19]  632 	ld	l,-8 (ix)
   42AB DD 66 F9      [19]  633 	ld	h,-7 (ix)
   42AE 36 B0         [10]  634 	ld	(hl),#<(_g_knifeY_1)
   42B0 23            [ 6]  635 	inc	hl
   42B1 36 17         [10]  636 	ld	(hl),#>(_g_knifeY_1)
                            637 ;src/knifestruct.c:102: cu->eje = E_Y;
   42B3 DD 6E F5      [19]  638 	ld	l,-11 (ix)
   42B6 DD 66 F6      [19]  639 	ld	h,-10 (ix)
   42B9 36 01         [10]  640 	ld	(hl),#0x01
                            641 ;src/knifestruct.c:103: dibujarCuchillo(cu, g_tablatrans);
   42BB DD 6E 0A      [19]  642 	ld	l,10 (ix)
   42BE DD 66 0B      [19]  643 	ld	h,11 (ix)
   42C1 E5            [11]  644 	push	hl
   42C2 C5            [11]  645 	push	bc
   42C3 CD 0A 3F      [17]  646 	call	_dibujarCuchillo
   42C6 F1            [10]  647 	pop	af
   42C7 F1            [10]  648 	pop	af
   42C8                     649 00122$:
   42C8 DD F9         [10]  650 	ld	sp, ix
   42CA DD E1         [14]  651 	pop	ix
   42CC C9            [10]  652 	ret
                            653 ;src/knifestruct.c:109: u8 checkOffBounds(TKnife* cu){
                            654 ;	---------------------------------
                            655 ; Function checkOffBounds
                            656 ; ---------------------------------
   42CD                     657 _checkOffBounds::
                            658 ;src/knifestruct.c:110: return (cu->x + G_KNIFEX_0_W  > (80 - 4) || cu->x < (0 + 4));
   42CD C1            [10]  659 	pop	bc
   42CE E1            [10]  660 	pop	hl
   42CF E5            [11]  661 	push	hl
   42D0 C5            [11]  662 	push	bc
   42D1 4E            [ 7]  663 	ld	c,(hl)
   42D2 59            [ 4]  664 	ld	e,c
   42D3 16 00         [ 7]  665 	ld	d,#0x00
   42D5 13            [ 6]  666 	inc	de
   42D6 13            [ 6]  667 	inc	de
   42D7 13            [ 6]  668 	inc	de
   42D8 13            [ 6]  669 	inc	de
   42D9 3E 4C         [ 7]  670 	ld	a,#0x4C
   42DB BB            [ 4]  671 	cp	a, e
   42DC 3E 00         [ 7]  672 	ld	a,#0x00
   42DE 9A            [ 4]  673 	sbc	a, d
   42DF E2 E4 42      [10]  674 	jp	PO, 00114$
   42E2 EE 80         [ 7]  675 	xor	a, #0x80
   42E4                     676 00114$:
   42E4 FA EF 42      [10]  677 	jp	M,00104$
   42E7 79            [ 4]  678 	ld	a,c
   42E8 D6 04         [ 7]  679 	sub	a, #0x04
   42EA 38 03         [12]  680 	jr	C,00104$
   42EC 2E 00         [ 7]  681 	ld	l,#0x00
   42EE C9            [10]  682 	ret
   42EF                     683 00104$:
   42EF 2E 01         [ 7]  684 	ld	l,#0x01
   42F1 C9            [10]  685 	ret
                            686 ;src/knifestruct.c:113: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            687 ;	---------------------------------
                            688 ; Function checkKnifeCollision
                            689 ; ---------------------------------
   42F2                     690 _checkKnifeCollision::
                            691 ;src/knifestruct.c:115: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   42F2 D1            [10]  692 	pop	de
   42F3 C1            [10]  693 	pop	bc
   42F4 C5            [11]  694 	push	bc
   42F5 D5            [11]  695 	push	de
   42F6 69            [ 4]  696 	ld	l, c
   42F7 60            [ 4]  697 	ld	h, b
   42F8 23            [ 6]  698 	inc	hl
   42F9 5E            [ 7]  699 	ld	e,(hl)
   42FA 7B            [ 4]  700 	ld	a,e
   42FB 21 05 00      [10]  701 	ld	hl,#5
   42FE 39            [11]  702 	add	hl,sp
   42FF 86            [ 7]  703 	add	a, (hl)
   4300 57            [ 4]  704 	ld	d,a
   4301 0A            [ 7]  705 	ld	a,(bc)
   4302 4F            [ 4]  706 	ld	c,a
   4303 21 04 00      [10]  707 	ld	hl,#4
   4306 39            [11]  708 	add	hl,sp
   4307 86            [ 7]  709 	add	a, (hl)
   4308 47            [ 4]  710 	ld	b,a
   4309 D5            [11]  711 	push	de
   430A 33            [ 6]  712 	inc	sp
   430B C5            [11]  713 	push	bc
   430C 33            [ 6]  714 	inc	sp
   430D 21 08 00      [10]  715 	ld	hl, #8
   4310 39            [11]  716 	add	hl, sp
   4311 4E            [ 7]  717 	ld	c, (hl)
   4312 23            [ 6]  718 	inc	hl
   4313 46            [ 7]  719 	ld	b, (hl)
   4314 C5            [11]  720 	push	bc
   4315 CD 71 4B      [17]  721 	call	_getTilePtr
   4318 F1            [10]  722 	pop	af
   4319 F1            [10]  723 	pop	af
   431A 4E            [ 7]  724 	ld	c,(hl)
   431B 3E 02         [ 7]  725 	ld	a,#0x02
   431D 91            [ 4]  726 	sub	a, c
   431E 3E 00         [ 7]  727 	ld	a,#0x00
   4320 17            [ 4]  728 	rla
   4321 EE 01         [ 7]  729 	xor	a, #0x01
   4323 6F            [ 4]  730 	ld	l, a
   4324 C9            [10]  731 	ret
                            732 ;src/knifestruct.c:118: void moverCuchillo(TKnife* cu, u8* mapa){
                            733 ;	---------------------------------
                            734 ; Function moverCuchillo
                            735 ; ---------------------------------
   4325                     736 _moverCuchillo::
   4325 DD E5         [15]  737 	push	ix
   4327 DD 21 00 00   [14]  738 	ld	ix,#0
   432B DD 39         [15]  739 	add	ix,sp
   432D F5            [11]  740 	push	af
                            741 ;src/knifestruct.c:119: if(cu->lanzado){
   432E DD 4E 04      [19]  742 	ld	c,4 (ix)
   4331 DD 46 05      [19]  743 	ld	b,5 (ix)
   4334 C5            [11]  744 	push	bc
   4335 FD E1         [14]  745 	pop	iy
   4337 FD 7E 06      [19]  746 	ld	a,6 (iy)
   433A B7            [ 4]  747 	or	a, a
   433B CA 57 44      [10]  748 	jp	Z,00138$
                            749 ;src/knifestruct.c:120: cu->mover = SI;
   433E 21 09 00      [10]  750 	ld	hl,#0x0009
   4341 09            [11]  751 	add	hl,bc
   4342 EB            [ 4]  752 	ex	de,hl
   4343 3E 01         [ 7]  753 	ld	a,#0x01
   4345 12            [ 7]  754 	ld	(de),a
                            755 ;src/knifestruct.c:121: if(cu->direccion == M_derecha){
   4346 C5            [11]  756 	push	bc
   4347 FD E1         [14]  757 	pop	iy
   4349 FD 6E 07      [19]  758 	ld	l,7 (iy)
   434C 7D            [ 4]  759 	ld	a,l
   434D B7            [ 4]  760 	or	a, a
   434E 20 3A         [12]  761 	jr	NZ,00134$
                            762 ;src/knifestruct.c:122: if(checkOffBounds(cu)){
   4350 C5            [11]  763 	push	bc
   4351 D5            [11]  764 	push	de
   4352 C5            [11]  765 	push	bc
   4353 CD CD 42      [17]  766 	call	_checkOffBounds
   4356 F1            [10]  767 	pop	af
   4357 D1            [10]  768 	pop	de
   4358 C1            [10]  769 	pop	bc
   4359 7D            [ 4]  770 	ld	a,l
   435A B7            [ 4]  771 	or	a, a
   435B 28 05         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:123: cu->mover=NO;
   435D AF            [ 4]  774 	xor	a, a
   435E 12            [ 7]  775 	ld	(de),a
   435F C3 57 44      [10]  776 	jp	00138$
   4362                     777 00105$:
                            778 ;src/knifestruct.c:125: else if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4362 C5            [11]  779 	push	bc
   4363 D5            [11]  780 	push	de
   4364 DD 6E 06      [19]  781 	ld	l,6 (ix)
   4367 DD 66 07      [19]  782 	ld	h,7 (ix)
   436A E5            [11]  783 	push	hl
   436B 21 05 00      [10]  784 	ld	hl,#0x0005
   436E E5            [11]  785 	push	hl
   436F C5            [11]  786 	push	bc
   4370 CD F2 42      [17]  787 	call	_checkKnifeCollision
   4373 F1            [10]  788 	pop	af
   4374 F1            [10]  789 	pop	af
   4375 F1            [10]  790 	pop	af
   4376 D1            [10]  791 	pop	de
   4377 C1            [10]  792 	pop	bc
   4378 7D            [ 4]  793 	ld	a,l
   4379 B7            [ 4]  794 	or	a, a
   437A 28 09         [12]  795 	jr	Z,00102$
                            796 ;src/knifestruct.c:126: cu->mover = SI;
   437C 3E 01         [ 7]  797 	ld	a,#0x01
   437E 12            [ 7]  798 	ld	(de),a
                            799 ;src/knifestruct.c:127: cu->x++;
   437F 0A            [ 7]  800 	ld	a,(bc)
   4380 3C            [ 4]  801 	inc	a
   4381 02            [ 7]  802 	ld	(bc),a
   4382 C3 57 44      [10]  803 	jp	00138$
   4385                     804 00102$:
                            805 ;src/knifestruct.c:130: cu->mover=NO;
   4385 AF            [ 4]  806 	xor	a, a
   4386 12            [ 7]  807 	ld	(de),a
   4387 C3 57 44      [10]  808 	jp	00138$
   438A                     809 00134$:
                            810 ;src/knifestruct.c:133: else if(cu->direccion == M_izquierda){
   438A 7D            [ 4]  811 	ld	a,l
   438B 3D            [ 4]  812 	dec	a
   438C 20 3B         [12]  813 	jr	NZ,00131$
                            814 ;src/knifestruct.c:134: if(checkOffBounds(cu)){
   438E C5            [11]  815 	push	bc
   438F D5            [11]  816 	push	de
   4390 C5            [11]  817 	push	bc
   4391 CD CD 42      [17]  818 	call	_checkOffBounds
   4394 F1            [10]  819 	pop	af
   4395 D1            [10]  820 	pop	de
   4396 C1            [10]  821 	pop	bc
   4397 7D            [ 4]  822 	ld	a,l
   4398 B7            [ 4]  823 	or	a, a
   4399 28 05         [12]  824 	jr	Z,00111$
                            825 ;src/knifestruct.c:135: cu->mover=NO;
   439B AF            [ 4]  826 	xor	a, a
   439C 12            [ 7]  827 	ld	(de),a
   439D C3 57 44      [10]  828 	jp	00138$
   43A0                     829 00111$:
                            830 ;src/knifestruct.c:137: else if(checkKnifeCollision(cu, -1, 0, mapa)){
   43A0 C5            [11]  831 	push	bc
   43A1 D5            [11]  832 	push	de
   43A2 DD 6E 06      [19]  833 	ld	l,6 (ix)
   43A5 DD 66 07      [19]  834 	ld	h,7 (ix)
   43A8 E5            [11]  835 	push	hl
   43A9 21 FF 00      [10]  836 	ld	hl,#0x00FF
   43AC E5            [11]  837 	push	hl
   43AD C5            [11]  838 	push	bc
   43AE CD F2 42      [17]  839 	call	_checkKnifeCollision
   43B1 F1            [10]  840 	pop	af
   43B2 F1            [10]  841 	pop	af
   43B3 F1            [10]  842 	pop	af
   43B4 D1            [10]  843 	pop	de
   43B5 C1            [10]  844 	pop	bc
   43B6 7D            [ 4]  845 	ld	a,l
   43B7 B7            [ 4]  846 	or	a, a
   43B8 28 0A         [12]  847 	jr	Z,00108$
                            848 ;src/knifestruct.c:138: cu->mover = SI;
   43BA 3E 01         [ 7]  849 	ld	a,#0x01
   43BC 12            [ 7]  850 	ld	(de),a
                            851 ;src/knifestruct.c:139: cu->x--;
   43BD 0A            [ 7]  852 	ld	a,(bc)
   43BE C6 FF         [ 7]  853 	add	a,#0xFF
   43C0 02            [ 7]  854 	ld	(bc),a
   43C1 C3 57 44      [10]  855 	jp	00138$
   43C4                     856 00108$:
                            857 ;src/knifestruct.c:142: cu->mover=NO;
   43C4 AF            [ 4]  858 	xor	a, a
   43C5 12            [ 7]  859 	ld	(de),a
   43C6 C3 57 44      [10]  860 	jp	00138$
   43C9                     861 00131$:
                            862 ;src/knifestruct.c:151: cu->y--;
   43C9 79            [ 4]  863 	ld	a,c
   43CA C6 01         [ 7]  864 	add	a, #0x01
   43CC DD 77 FE      [19]  865 	ld	-2 (ix),a
   43CF 78            [ 4]  866 	ld	a,b
   43D0 CE 00         [ 7]  867 	adc	a, #0x00
   43D2 DD 77 FF      [19]  868 	ld	-1 (ix),a
                            869 ;src/knifestruct.c:145: else if(cu->direccion == M_arriba){
   43D5 7D            [ 4]  870 	ld	a,l
   43D6 D6 02         [ 7]  871 	sub	a, #0x02
   43D8 20 3D         [12]  872 	jr	NZ,00128$
                            873 ;src/knifestruct.c:146: if(checkOffBounds(cu)){
   43DA C5            [11]  874 	push	bc
   43DB D5            [11]  875 	push	de
   43DC C5            [11]  876 	push	bc
   43DD CD CD 42      [17]  877 	call	_checkOffBounds
   43E0 F1            [10]  878 	pop	af
   43E1 D1            [10]  879 	pop	de
   43E2 C1            [10]  880 	pop	bc
   43E3 7D            [ 4]  881 	ld	a,l
   43E4 B7            [ 4]  882 	or	a, a
   43E5 28 04         [12]  883 	jr	Z,00117$
                            884 ;src/knifestruct.c:147: cu->mover = NO;
   43E7 AF            [ 4]  885 	xor	a, a
   43E8 12            [ 7]  886 	ld	(de),a
   43E9 18 6C         [12]  887 	jr	00138$
   43EB                     888 00117$:
                            889 ;src/knifestruct.c:149: else if(checkKnifeCollision(cu, 0, -2, mapa)){
   43EB D5            [11]  890 	push	de
   43EC DD 6E 06      [19]  891 	ld	l,6 (ix)
   43EF DD 66 07      [19]  892 	ld	h,7 (ix)
   43F2 E5            [11]  893 	push	hl
   43F3 21 00 FE      [10]  894 	ld	hl,#0xFE00
   43F6 E5            [11]  895 	push	hl
   43F7 C5            [11]  896 	push	bc
   43F8 CD F2 42      [17]  897 	call	_checkKnifeCollision
   43FB F1            [10]  898 	pop	af
   43FC F1            [10]  899 	pop	af
   43FD F1            [10]  900 	pop	af
   43FE D1            [10]  901 	pop	de
   43FF 7D            [ 4]  902 	ld	a,l
   4400 B7            [ 4]  903 	or	a, a
   4401 28 10         [12]  904 	jr	Z,00114$
                            905 ;src/knifestruct.c:150: cu->mover = SI;
   4403 3E 01         [ 7]  906 	ld	a,#0x01
   4405 12            [ 7]  907 	ld	(de),a
                            908 ;src/knifestruct.c:151: cu->y--;
   4406 E1            [10]  909 	pop	hl
   4407 E5            [11]  910 	push	hl
   4408 4E            [ 7]  911 	ld	c,(hl)
   4409 0D            [ 4]  912 	dec	c
   440A E1            [10]  913 	pop	hl
   440B E5            [11]  914 	push	hl
   440C 71            [ 7]  915 	ld	(hl),c
                            916 ;src/knifestruct.c:152: cu->y--;
   440D 0D            [ 4]  917 	dec	c
   440E E1            [10]  918 	pop	hl
   440F E5            [11]  919 	push	hl
   4410 71            [ 7]  920 	ld	(hl),c
   4411 18 44         [12]  921 	jr	00138$
   4413                     922 00114$:
                            923 ;src/knifestruct.c:155: cu->mover=NO;
   4413 AF            [ 4]  924 	xor	a, a
   4414 12            [ 7]  925 	ld	(de),a
   4415 18 40         [12]  926 	jr	00138$
   4417                     927 00128$:
                            928 ;src/knifestruct.c:158: else if(cu->direccion == M_abajo){
   4417 7D            [ 4]  929 	ld	a,l
   4418 D6 03         [ 7]  930 	sub	a, #0x03
   441A 20 3B         [12]  931 	jr	NZ,00138$
                            932 ;src/knifestruct.c:159: if(checkOffBounds(cu)){
   441C C5            [11]  933 	push	bc
   441D D5            [11]  934 	push	de
   441E C5            [11]  935 	push	bc
   441F CD CD 42      [17]  936 	call	_checkOffBounds
   4422 F1            [10]  937 	pop	af
   4423 D1            [10]  938 	pop	de
   4424 C1            [10]  939 	pop	bc
   4425 7D            [ 4]  940 	ld	a,l
   4426 B7            [ 4]  941 	or	a, a
   4427 28 04         [12]  942 	jr	Z,00123$
                            943 ;src/knifestruct.c:160: cu->mover = NO;
   4429 AF            [ 4]  944 	xor	a, a
   442A 12            [ 7]  945 	ld	(de),a
   442B 18 2A         [12]  946 	jr	00138$
   442D                     947 00123$:
                            948 ;src/knifestruct.c:162: else if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   442D D5            [11]  949 	push	de
   442E DD 6E 06      [19]  950 	ld	l,6 (ix)
   4431 DD 66 07      [19]  951 	ld	h,7 (ix)
   4434 E5            [11]  952 	push	hl
   4435 21 00 0A      [10]  953 	ld	hl,#0x0A00
   4438 E5            [11]  954 	push	hl
   4439 C5            [11]  955 	push	bc
   443A CD F2 42      [17]  956 	call	_checkKnifeCollision
   443D F1            [10]  957 	pop	af
   443E F1            [10]  958 	pop	af
   443F F1            [10]  959 	pop	af
   4440 D1            [10]  960 	pop	de
   4441 7D            [ 4]  961 	ld	a,l
   4442 B7            [ 4]  962 	or	a, a
   4443 28 10         [12]  963 	jr	Z,00120$
                            964 ;src/knifestruct.c:163: cu->mover = SI;
   4445 3E 01         [ 7]  965 	ld	a,#0x01
   4447 12            [ 7]  966 	ld	(de),a
                            967 ;src/knifestruct.c:164: cu->y++;
   4448 E1            [10]  968 	pop	hl
   4449 E5            [11]  969 	push	hl
   444A 4E            [ 7]  970 	ld	c,(hl)
   444B 0C            [ 4]  971 	inc	c
   444C E1            [10]  972 	pop	hl
   444D E5            [11]  973 	push	hl
   444E 71            [ 7]  974 	ld	(hl),c
                            975 ;src/knifestruct.c:165: cu->y++;
   444F 0C            [ 4]  976 	inc	c
   4450 E1            [10]  977 	pop	hl
   4451 E5            [11]  978 	push	hl
   4452 71            [ 7]  979 	ld	(hl),c
   4453 18 02         [12]  980 	jr	00138$
   4455                     981 00120$:
                            982 ;src/knifestruct.c:168: cu->mover=NO;
   4455 AF            [ 4]  983 	xor	a, a
   4456 12            [ 7]  984 	ld	(de),a
   4457                     985 00138$:
   4457 DD F9         [10]  986 	ld	sp, ix
   4459 DD E1         [14]  987 	pop	ix
   445B C9            [10]  988 	ret
                            989 	.area _CODE
                            990 	.area _INITIALIZER
                            991 	.area _CABS (ABS)
