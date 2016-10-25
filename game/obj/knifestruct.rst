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
                             19 	.globl _checkKnifeCollision
                             20 	.globl _moverCuchillo
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/knifestruct.c:3: void dibujarCuchillo(TKnife* cu, u8* g_tablatrans) {
                             53 ;	---------------------------------
                             54 ; Function dibujarCuchillo
                             55 ; ---------------------------------
   3F0A                      56 _dibujarCuchillo::
   3F0A DD E5         [15]   57 	push	ix
   3F0C DD 21 00 00   [14]   58 	ld	ix,#0
   3F10 DD 39         [15]   59 	add	ix,sp
   3F12 21 FA FF      [10]   60 	ld	hl,#-6
   3F15 39            [11]   61 	add	hl,sp
   3F16 F9            [ 6]   62 	ld	sp,hl
                             63 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   3F17 DD 5E 04      [19]   64 	ld	e,4 (ix)
   3F1A DD 56 05      [19]   65 	ld	d,5 (ix)
   3F1D 6B            [ 4]   66 	ld	l, e
   3F1E 62            [ 4]   67 	ld	h, d
   3F1F 23            [ 6]   68 	inc	hl
   3F20 46            [ 7]   69 	ld	b,(hl)
   3F21 1A            [ 7]   70 	ld	a,(de)
   3F22 D5            [11]   71 	push	de
   3F23 C5            [11]   72 	push	bc
   3F24 33            [ 6]   73 	inc	sp
   3F25 F5            [11]   74 	push	af
   3F26 33            [ 6]   75 	inc	sp
   3F27 21 00 C0      [10]   76 	ld	hl,#0xC000
   3F2A E5            [11]   77 	push	hl
   3F2B CD AD 5F      [17]   78 	call	_cpct_getScreenPtr
   3F2E D1            [10]   79 	pop	de
   3F2F 33            [ 6]   80 	inc	sp
   3F30 33            [ 6]   81 	inc	sp
   3F31 E5            [11]   82 	push	hl
                             83 ;src/knifestruct.c:5: if(cu->eje == E_X){
   3F32 D5            [11]   84 	push	de
   3F33 FD E1         [14]   85 	pop	iy
   3F35 FD 4E 08      [19]   86 	ld	c,8 (iy)
                             87 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   3F38 DD 7E 06      [19]   88 	ld	a,6 (ix)
   3F3B DD 77 FC      [19]   89 	ld	-4 (ix),a
   3F3E DD 7E 07      [19]   90 	ld	a,7 (ix)
   3F41 DD 77 FD      [19]   91 	ld	-3 (ix),a
   3F44 DD 7E FA      [19]   92 	ld	a,-6 (ix)
   3F47 DD 77 FE      [19]   93 	ld	-2 (ix),a
   3F4A DD 7E FB      [19]   94 	ld	a,-5 (ix)
   3F4D DD 77 FF      [19]   95 	ld	-1 (ix),a
   3F50 13            [ 6]   96 	inc	de
   3F51 13            [ 6]   97 	inc	de
   3F52 13            [ 6]   98 	inc	de
   3F53 13            [ 6]   99 	inc	de
                            100 ;src/knifestruct.c:5: if(cu->eje == E_X){
   3F54 79            [ 4]  101 	ld	a,c
   3F55 B7            [ 4]  102 	or	a, a
   3F56 20 1A         [12]  103 	jr	NZ,00104$
                            104 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   3F58 EB            [ 4]  105 	ex	de,hl
   3F59 4E            [ 7]  106 	ld	c,(hl)
   3F5A 23            [ 6]  107 	inc	hl
   3F5B 46            [ 7]  108 	ld	b,(hl)
   3F5C D1            [10]  109 	pop	de
   3F5D E1            [10]  110 	pop	hl
   3F5E E5            [11]  111 	push	hl
   3F5F D5            [11]  112 	push	de
   3F60 E5            [11]  113 	push	hl
   3F61 21 04 04      [10]  114 	ld	hl,#0x0404
   3F64 E5            [11]  115 	push	hl
   3F65 DD 6E FE      [19]  116 	ld	l,-2 (ix)
   3F68 DD 66 FF      [19]  117 	ld	h,-1 (ix)
   3F6B E5            [11]  118 	push	hl
   3F6C C5            [11]  119 	push	bc
   3F6D CD CD 5F      [17]  120 	call	_cpct_drawSpriteMaskedAlignedTable
   3F70 18 1B         [12]  121 	jr	00106$
   3F72                     122 00104$:
                            123 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   3F72 0D            [ 4]  124 	dec	c
   3F73 20 18         [12]  125 	jr	NZ,00106$
                            126 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   3F75 EB            [ 4]  127 	ex	de,hl
   3F76 4E            [ 7]  128 	ld	c,(hl)
   3F77 23            [ 6]  129 	inc	hl
   3F78 46            [ 7]  130 	ld	b,(hl)
   3F79 D1            [10]  131 	pop	de
   3F7A E1            [10]  132 	pop	hl
   3F7B E5            [11]  133 	push	hl
   3F7C D5            [11]  134 	push	de
   3F7D E5            [11]  135 	push	hl
   3F7E 21 02 08      [10]  136 	ld	hl,#0x0802
   3F81 E5            [11]  137 	push	hl
   3F82 DD 6E FE      [19]  138 	ld	l,-2 (ix)
   3F85 DD 66 FF      [19]  139 	ld	h,-1 (ix)
   3F88 E5            [11]  140 	push	hl
   3F89 C5            [11]  141 	push	bc
   3F8A CD CD 5F      [17]  142 	call	_cpct_drawSpriteMaskedAlignedTable
   3F8D                     143 00106$:
   3F8D DD F9         [10]  144 	ld	sp, ix
   3F8F DD E1         [14]  145 	pop	ix
   3F91 C9            [10]  146 	ret
                            147 ;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            148 ;	---------------------------------
                            149 ; Function borrarCuchillo
                            150 ; ---------------------------------
   3F92                     151 _borrarCuchillo::
   3F92 DD E5         [15]  152 	push	ix
   3F94 DD 21 00 00   [14]  153 	ld	ix,#0
   3F98 DD 39         [15]  154 	add	ix,sp
   3F9A F5            [11]  155 	push	af
   3F9B F5            [11]  156 	push	af
                            157 ;src/knifestruct.c:20: w = 4 + (x & 1);
   3F9C DD 7E 05      [19]  158 	ld	a,5 (ix)
   3F9F E6 01         [ 7]  159 	and	a, #0x01
   3FA1 47            [ 4]  160 	ld	b,a
                            161 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   3FA2 DD 7E 06      [19]  162 	ld	a,6 (ix)
   3FA5 E6 03         [ 7]  163 	and	a, #0x03
   3FA7 4F            [ 4]  164 	ld	c,a
                            165 ;src/knifestruct.c:19: if(eje == E_X){
   3FA8 DD 7E 04      [19]  166 	ld	a,4 (ix)
   3FAB B7            [ 4]  167 	or	a, a
   3FAC 20 11         [12]  168 	jr	NZ,00102$
                            169 ;src/knifestruct.c:20: w = 4 + (x & 1);
   3FAE 04            [ 4]  170 	inc	b
   3FAF 04            [ 4]  171 	inc	b
   3FB0 04            [ 4]  172 	inc	b
   3FB1 04            [ 4]  173 	inc	b
                            174 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   3FB2 79            [ 4]  175 	ld	a,c
   3FB3 B7            [ 4]  176 	or	a, a
   3FB4 28 04         [12]  177 	jr	Z,00106$
   3FB6 0E 01         [ 7]  178 	ld	c,#0x01
   3FB8 18 02         [12]  179 	jr	00107$
   3FBA                     180 00106$:
   3FBA 0E 00         [ 7]  181 	ld	c,#0x00
   3FBC                     182 00107$:
   3FBC 0C            [ 4]  183 	inc	c
   3FBD 18 0E         [12]  184 	jr	00103$
   3FBF                     185 00102$:
                            186 ;src/knifestruct.c:23: w = 2 + (x & 1);
   3FBF 04            [ 4]  187 	inc	b
   3FC0 04            [ 4]  188 	inc	b
                            189 ;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
   3FC1 79            [ 4]  190 	ld	a,c
   3FC2 B7            [ 4]  191 	or	a, a
   3FC3 28 04         [12]  192 	jr	Z,00108$
   3FC5 0E 01         [ 7]  193 	ld	c,#0x01
   3FC7 18 02         [12]  194 	jr	00109$
   3FC9                     195 00108$:
   3FC9 0E 00         [ 7]  196 	ld	c,#0x00
   3FCB                     197 00109$:
   3FCB 0C            [ 4]  198 	inc	c
   3FCC 0C            [ 4]  199 	inc	c
   3FCD                     200 00103$:
                            201 ;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   3FCD DD 7E 07      [19]  202 	ld	a,7 (ix)
   3FD0 DD 77 FE      [19]  203 	ld	-2 (ix),a
   3FD3 DD 7E 08      [19]  204 	ld	a,8 (ix)
   3FD6 DD 77 FF      [19]  205 	ld	-1 (ix),a
   3FD9 DD 5E 06      [19]  206 	ld	e,6 (ix)
   3FDC 16 00         [ 7]  207 	ld	d,#0x00
   3FDE 7B            [ 4]  208 	ld	a,e
   3FDF C6 E8         [ 7]  209 	add	a,#0xE8
   3FE1 DD 77 FC      [19]  210 	ld	-4 (ix),a
   3FE4 7A            [ 4]  211 	ld	a,d
   3FE5 CE FF         [ 7]  212 	adc	a,#0xFF
   3FE7 DD 77 FD      [19]  213 	ld	-3 (ix),a
   3FEA E1            [10]  214 	pop	hl
   3FEB E5            [11]  215 	push	hl
   3FEC DD CB FD 7E   [20]  216 	bit	7, -3 (ix)
   3FF0 28 04         [12]  217 	jr	Z,00110$
   3FF2 21 EB FF      [10]  218 	ld	hl,#0xFFEB
   3FF5 19            [11]  219 	add	hl,de
   3FF6                     220 00110$:
   3FF6 5D            [ 4]  221 	ld	e,l
   3FF7 CB 2C         [ 8]  222 	sra	h
   3FF9 CB 1B         [ 8]  223 	rr	e
   3FFB CB 2C         [ 8]  224 	sra	h
   3FFD CB 1B         [ 8]  225 	rr	e
   3FFF DD 56 05      [19]  226 	ld	d,5 (ix)
   4002 CB 3A         [ 8]  227 	srl	d
   4004 DD 6E FE      [19]  228 	ld	l,-2 (ix)
   4007 DD 66 FF      [19]  229 	ld	h,-1 (ix)
   400A E5            [11]  230 	push	hl
   400B 21 F0 C0      [10]  231 	ld	hl,#0xC0F0
   400E E5            [11]  232 	push	hl
   400F 3E 28         [ 7]  233 	ld	a,#0x28
   4011 F5            [11]  234 	push	af
   4012 33            [ 6]  235 	inc	sp
   4013 79            [ 4]  236 	ld	a,c
   4014 F5            [11]  237 	push	af
   4015 33            [ 6]  238 	inc	sp
   4016 C5            [11]  239 	push	bc
   4017 33            [ 6]  240 	inc	sp
   4018 7B            [ 4]  241 	ld	a,e
   4019 F5            [11]  242 	push	af
   401A 33            [ 6]  243 	inc	sp
   401B D5            [11]  244 	push	de
   401C 33            [ 6]  245 	inc	sp
   401D CD 8F 54      [17]  246 	call	_cpct_etm_drawTileBox2x4
   4020 DD F9         [10]  247 	ld	sp, ix
   4022 DD E1         [14]  248 	pop	ix
   4024 C9            [10]  249 	ret
                            250 ;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            251 ;	---------------------------------
                            252 ; Function redibujarCuchillo
                            253 ; ---------------------------------
   4025                     254 _redibujarCuchillo::
   4025 DD E5         [15]  255 	push	ix
   4027 DD 21 00 00   [14]  256 	ld	ix,#0
   402B DD 39         [15]  257 	add	ix,sp
                            258 ;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
   402D DD 6E 0B      [19]  259 	ld	l,11 (ix)
   4030 DD 66 0C      [19]  260 	ld	h,12 (ix)
   4033 E5            [11]  261 	push	hl
   4034 DD 66 06      [19]  262 	ld	h,6 (ix)
   4037 DD 6E 05      [19]  263 	ld	l,5 (ix)
   403A E5            [11]  264 	push	hl
   403B DD 7E 04      [19]  265 	ld	a,4 (ix)
   403E F5            [11]  266 	push	af
   403F 33            [ 6]  267 	inc	sp
   4040 CD 92 3F      [17]  268 	call	_borrarCuchillo
   4043 F1            [10]  269 	pop	af
   4044 F1            [10]  270 	pop	af
   4045 33            [ 6]  271 	inc	sp
                            272 ;src/knifestruct.c:33: cu->px = cu->x;
   4046 DD 4E 07      [19]  273 	ld	c,7 (ix)
   4049 DD 46 08      [19]  274 	ld	b,8 (ix)
   404C 59            [ 4]  275 	ld	e, c
   404D 50            [ 4]  276 	ld	d, b
   404E 13            [ 6]  277 	inc	de
   404F 13            [ 6]  278 	inc	de
   4050 0A            [ 7]  279 	ld	a,(bc)
   4051 12            [ 7]  280 	ld	(de),a
                            281 ;src/knifestruct.c:34: cu->py = cu->y;
   4052 59            [ 4]  282 	ld	e, c
   4053 50            [ 4]  283 	ld	d, b
   4054 13            [ 6]  284 	inc	de
   4055 13            [ 6]  285 	inc	de
   4056 13            [ 6]  286 	inc	de
   4057 69            [ 4]  287 	ld	l, c
   4058 60            [ 4]  288 	ld	h, b
   4059 23            [ 6]  289 	inc	hl
   405A 7E            [ 7]  290 	ld	a,(hl)
   405B 12            [ 7]  291 	ld	(de),a
                            292 ;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
   405C DD 6E 09      [19]  293 	ld	l,9 (ix)
   405F DD 66 0A      [19]  294 	ld	h,10 (ix)
   4062 E5            [11]  295 	push	hl
   4063 C5            [11]  296 	push	bc
   4064 CD 0A 3F      [17]  297 	call	_dibujarCuchillo
   4067 F1            [10]  298 	pop	af
   4068 F1            [10]  299 	pop	af
   4069 DD E1         [14]  300 	pop	ix
   406B C9            [10]  301 	ret
                            302 ;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            303 ;	---------------------------------
                            304 ; Function lanzarCuchillo
                            305 ; ---------------------------------
   406C                     306 _lanzarCuchillo::
   406C DD E5         [15]  307 	push	ix
   406E DD 21 00 00   [14]  308 	ld	ix,#0
   4072 DD 39         [15]  309 	add	ix,sp
   4074 21 F2 FF      [10]  310 	ld	hl,#-14
   4077 39            [11]  311 	add	hl,sp
   4078 F9            [ 6]  312 	ld	sp,hl
                            313 ;src/knifestruct.c:40: if(!cu->lanzado){
   4079 DD 4E 04      [19]  314 	ld	c,4 (ix)
   407C DD 46 05      [19]  315 	ld	b,5 (ix)
   407F 21 06 00      [10]  316 	ld	hl,#0x0006
   4082 09            [11]  317 	add	hl,bc
   4083 DD 75 FE      [19]  318 	ld	-2 (ix),l
   4086 DD 74 FF      [19]  319 	ld	-1 (ix),h
   4089 DD 6E FE      [19]  320 	ld	l,-2 (ix)
   408C DD 66 FF      [19]  321 	ld	h,-1 (ix)
   408F 7E            [ 7]  322 	ld	a,(hl)
   4090 B7            [ 4]  323 	or	a, a
   4091 C2 C8 42      [10]  324 	jp	NZ,00122$
                            325 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   4094 DD 5E 06      [19]  326 	ld	e,6 (ix)
   4097 DD 56 07      [19]  327 	ld	d,7 (ix)
   409A 6B            [ 4]  328 	ld	l, e
   409B 62            [ 4]  329 	ld	h, d
   409C C5            [11]  330 	push	bc
   409D 01 07 00      [10]  331 	ld	bc, #0x0007
   40A0 09            [11]  332 	add	hl, bc
   40A1 C1            [10]  333 	pop	bc
   40A2 6E            [ 7]  334 	ld	l,(hl)
                            335 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   40A3 7B            [ 4]  336 	ld	a,e
   40A4 C6 01         [ 7]  337 	add	a, #0x01
   40A6 DD 77 FB      [19]  338 	ld	-5 (ix),a
   40A9 7A            [ 4]  339 	ld	a,d
   40AA CE 00         [ 7]  340 	adc	a, #0x00
   40AC DD 77 FC      [19]  341 	ld	-4 (ix),a
                            342 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   40AF 79            [ 4]  343 	ld	a,c
   40B0 C6 07         [ 7]  344 	add	a, #0x07
   40B2 DD 77 F3      [19]  345 	ld	-13 (ix),a
   40B5 78            [ 4]  346 	ld	a,b
   40B6 CE 00         [ 7]  347 	adc	a, #0x00
   40B8 DD 77 F4      [19]  348 	ld	-12 (ix),a
                            349 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   40BB 79            [ 4]  350 	ld	a,c
   40BC C6 01         [ 7]  351 	add	a, #0x01
   40BE DD 77 F5      [19]  352 	ld	-11 (ix),a
   40C1 78            [ 4]  353 	ld	a,b
   40C2 CE 00         [ 7]  354 	adc	a, #0x00
   40C4 DD 77 F6      [19]  355 	ld	-10 (ix),a
                            356 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   40C7 79            [ 4]  357 	ld	a,c
   40C8 C6 04         [ 7]  358 	add	a, #0x04
   40CA DD 77 F9      [19]  359 	ld	-7 (ix),a
   40CD 78            [ 4]  360 	ld	a,b
   40CE CE 00         [ 7]  361 	adc	a, #0x00
   40D0 DD 77 FA      [19]  362 	ld	-6 (ix),a
                            363 ;src/knifestruct.c:49: cu->eje = E_X;
   40D3 79            [ 4]  364 	ld	a,c
   40D4 C6 08         [ 7]  365 	add	a, #0x08
   40D6 DD 77 F7      [19]  366 	ld	-9 (ix),a
   40D9 78            [ 4]  367 	ld	a,b
   40DA CE 00         [ 7]  368 	adc	a, #0x00
   40DC DD 77 F8      [19]  369 	ld	-8 (ix),a
                            370 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   40DF 7D            [ 4]  371 	ld	a,l
   40E0 B7            [ 4]  372 	or	a, a
   40E1 20 77         [12]  373 	jr	NZ,00118$
                            374 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   40E3 DD 6E FB      [19]  375 	ld	l,-5 (ix)
   40E6 DD 66 FC      [19]  376 	ld	h,-4 (ix)
   40E9 7E            [ 7]  377 	ld	a,(hl)
   40EA C6 0B         [ 7]  378 	add	a, #0x0B
   40EC DD 77 FD      [19]  379 	ld	-3 (ix),a
   40EF 1A            [ 7]  380 	ld	a,(de)
   40F0 C6 0C         [ 7]  381 	add	a, #0x0C
   40F2 DD 77 F2      [19]  382 	ld	-14 (ix),a
   40F5 C5            [11]  383 	push	bc
   40F6 D5            [11]  384 	push	de
   40F7 DD 66 FD      [19]  385 	ld	h,-3 (ix)
   40FA DD 6E F2      [19]  386 	ld	l,-14 (ix)
   40FD E5            [11]  387 	push	hl
   40FE DD 6E 08      [19]  388 	ld	l,8 (ix)
   4101 DD 66 09      [19]  389 	ld	h,9 (ix)
   4104 E5            [11]  390 	push	hl
   4105 CD C4 4A      [17]  391 	call	_getTilePtr
   4108 F1            [10]  392 	pop	af
   4109 F1            [10]  393 	pop	af
   410A D1            [10]  394 	pop	de
   410B C1            [10]  395 	pop	bc
   410C 6E            [ 7]  396 	ld	l,(hl)
   410D 3E 02         [ 7]  397 	ld	a,#0x02
   410F 95            [ 4]  398 	sub	a, l
   4110 DA C8 42      [10]  399 	jp	C,00122$
                            400 ;src/knifestruct.c:44: cu->lanzado = SI;
   4113 DD 6E FE      [19]  401 	ld	l,-2 (ix)
   4116 DD 66 FF      [19]  402 	ld	h,-1 (ix)
   4119 36 01         [10]  403 	ld	(hl),#0x01
                            404 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   411B DD 6E F3      [19]  405 	ld	l,-13 (ix)
   411E DD 66 F4      [19]  406 	ld	h,-12 (ix)
   4121 36 00         [10]  407 	ld	(hl),#0x00
                            408 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   4123 1A            [ 7]  409 	ld	a,(de)
   4124 C6 07         [ 7]  410 	add	a, #0x07
   4126 02            [ 7]  411 	ld	(bc),a
                            412 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4127 DD 6E FB      [19]  413 	ld	l,-5 (ix)
   412A DD 66 FC      [19]  414 	ld	h,-4 (ix)
   412D 7E            [ 7]  415 	ld	a,(hl)
   412E C6 0B         [ 7]  416 	add	a, #0x0B
   4130 DD 6E F5      [19]  417 	ld	l,-11 (ix)
   4133 DD 66 F6      [19]  418 	ld	h,-10 (ix)
   4136 77            [ 7]  419 	ld	(hl),a
                            420 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4137 DD 6E F9      [19]  421 	ld	l,-7 (ix)
   413A DD 66 FA      [19]  422 	ld	h,-6 (ix)
   413D 36 C0         [10]  423 	ld	(hl),#<(_g_knifeX_0)
   413F 23            [ 6]  424 	inc	hl
   4140 36 17         [10]  425 	ld	(hl),#>(_g_knifeX_0)
                            426 ;src/knifestruct.c:49: cu->eje = E_X;
   4142 DD 6E F7      [19]  427 	ld	l,-9 (ix)
   4145 DD 66 F8      [19]  428 	ld	h,-8 (ix)
   4148 36 00         [10]  429 	ld	(hl),#0x00
                            430 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   414A DD 6E 0A      [19]  431 	ld	l,10 (ix)
   414D DD 66 0B      [19]  432 	ld	h,11 (ix)
   4150 E5            [11]  433 	push	hl
   4151 C5            [11]  434 	push	bc
   4152 CD 0A 3F      [17]  435 	call	_dibujarCuchillo
   4155 F1            [10]  436 	pop	af
   4156 F1            [10]  437 	pop	af
   4157 C3 C8 42      [10]  438 	jp	00122$
   415A                     439 00118$:
                            440 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   415A 7D            [ 4]  441 	ld	a,l
   415B 3D            [ 4]  442 	dec	a
   415C 20 77         [12]  443 	jr	NZ,00115$
                            444 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   415E DD 6E FB      [19]  445 	ld	l,-5 (ix)
   4161 DD 66 FC      [19]  446 	ld	h,-4 (ix)
   4164 7E            [ 7]  447 	ld	a,(hl)
   4165 C6 0B         [ 7]  448 	add	a, #0x0B
   4167 DD 77 F2      [19]  449 	ld	-14 (ix),a
   416A 1A            [ 7]  450 	ld	a,(de)
   416B C6 F6         [ 7]  451 	add	a,#0xF6
   416D DD 77 FD      [19]  452 	ld	-3 (ix),a
   4170 C5            [11]  453 	push	bc
   4171 D5            [11]  454 	push	de
   4172 DD 66 F2      [19]  455 	ld	h,-14 (ix)
   4175 DD 6E FD      [19]  456 	ld	l,-3 (ix)
   4178 E5            [11]  457 	push	hl
   4179 DD 6E 08      [19]  458 	ld	l,8 (ix)
   417C DD 66 09      [19]  459 	ld	h,9 (ix)
   417F E5            [11]  460 	push	hl
   4180 CD C4 4A      [17]  461 	call	_getTilePtr
   4183 F1            [10]  462 	pop	af
   4184 F1            [10]  463 	pop	af
   4185 D1            [10]  464 	pop	de
   4186 C1            [10]  465 	pop	bc
   4187 6E            [ 7]  466 	ld	l,(hl)
   4188 3E 02         [ 7]  467 	ld	a,#0x02
   418A 95            [ 4]  468 	sub	a, l
   418B DA C8 42      [10]  469 	jp	C,00122$
                            470 ;src/knifestruct.c:55: cu->lanzado = SI;
   418E DD 6E FE      [19]  471 	ld	l,-2 (ix)
   4191 DD 66 FF      [19]  472 	ld	h,-1 (ix)
   4194 36 01         [10]  473 	ld	(hl),#0x01
                            474 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   4196 DD 6E F3      [19]  475 	ld	l,-13 (ix)
   4199 DD 66 F4      [19]  476 	ld	h,-12 (ix)
   419C 36 01         [10]  477 	ld	(hl),#0x01
                            478 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   419E 1A            [ 7]  479 	ld	a,(de)
   419F C6 FC         [ 7]  480 	add	a,#0xFC
   41A1 02            [ 7]  481 	ld	(bc),a
                            482 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   41A2 DD 6E FB      [19]  483 	ld	l,-5 (ix)
   41A5 DD 66 FC      [19]  484 	ld	h,-4 (ix)
   41A8 7E            [ 7]  485 	ld	a,(hl)
   41A9 C6 0B         [ 7]  486 	add	a, #0x0B
   41AB DD 6E F5      [19]  487 	ld	l,-11 (ix)
   41AE DD 66 F6      [19]  488 	ld	h,-10 (ix)
   41B1 77            [ 7]  489 	ld	(hl),a
                            490 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   41B2 DD 6E F9      [19]  491 	ld	l,-7 (ix)
   41B5 DD 66 FA      [19]  492 	ld	h,-6 (ix)
   41B8 36 D0         [10]  493 	ld	(hl),#<(_g_knifeX_1)
   41BA 23            [ 6]  494 	inc	hl
   41BB 36 17         [10]  495 	ld	(hl),#>(_g_knifeX_1)
                            496 ;src/knifestruct.c:60: cu->eje = E_X;
   41BD DD 6E F7      [19]  497 	ld	l,-9 (ix)
   41C0 DD 66 F8      [19]  498 	ld	h,-8 (ix)
   41C3 36 00         [10]  499 	ld	(hl),#0x00
                            500 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   41C5 DD 6E 0A      [19]  501 	ld	l,10 (ix)
   41C8 DD 66 0B      [19]  502 	ld	h,11 (ix)
   41CB E5            [11]  503 	push	hl
   41CC C5            [11]  504 	push	bc
   41CD CD 0A 3F      [17]  505 	call	_dibujarCuchillo
   41D0 F1            [10]  506 	pop	af
   41D1 F1            [10]  507 	pop	af
   41D2 C3 C8 42      [10]  508 	jp	00122$
   41D5                     509 00115$:
                            510 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   41D5 7D            [ 4]  511 	ld	a,l
   41D6 D6 03         [ 7]  512 	sub	a, #0x03
   41D8 20 76         [12]  513 	jr	NZ,00112$
                            514 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   41DA DD 6E FB      [19]  515 	ld	l,-5 (ix)
   41DD DD 66 FC      [19]  516 	ld	h,-4 (ix)
   41E0 7E            [ 7]  517 	ld	a,(hl)
   41E1 C6 1F         [ 7]  518 	add	a, #0x1F
   41E3 DD 77 F2      [19]  519 	ld	-14 (ix),a
   41E6 1A            [ 7]  520 	ld	a,(de)
   41E7 C6 03         [ 7]  521 	add	a, #0x03
   41E9 DD 77 FD      [19]  522 	ld	-3 (ix),a
   41EC C5            [11]  523 	push	bc
   41ED D5            [11]  524 	push	de
   41EE DD 66 F2      [19]  525 	ld	h,-14 (ix)
   41F1 DD 6E FD      [19]  526 	ld	l,-3 (ix)
   41F4 E5            [11]  527 	push	hl
   41F5 DD 6E 08      [19]  528 	ld	l,8 (ix)
   41F8 DD 66 09      [19]  529 	ld	h,9 (ix)
   41FB E5            [11]  530 	push	hl
   41FC CD C4 4A      [17]  531 	call	_getTilePtr
   41FF F1            [10]  532 	pop	af
   4200 F1            [10]  533 	pop	af
   4201 D1            [10]  534 	pop	de
   4202 C1            [10]  535 	pop	bc
   4203 6E            [ 7]  536 	ld	l,(hl)
   4204 3E 02         [ 7]  537 	ld	a,#0x02
   4206 95            [ 4]  538 	sub	a, l
   4207 DA C8 42      [10]  539 	jp	C,00122$
                            540 ;src/knifestruct.c:67: cu->lanzado = SI;
   420A DD 6E FE      [19]  541 	ld	l,-2 (ix)
   420D DD 66 FF      [19]  542 	ld	h,-1 (ix)
   4210 36 01         [10]  543 	ld	(hl),#0x01
                            544 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   4212 DD 6E F3      [19]  545 	ld	l,-13 (ix)
   4215 DD 66 F4      [19]  546 	ld	h,-12 (ix)
   4218 36 03         [10]  547 	ld	(hl),#0x03
                            548 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   421A 1A            [ 7]  549 	ld	a,(de)
   421B C6 03         [ 7]  550 	add	a, #0x03
   421D 02            [ 7]  551 	ld	(bc),a
                            552 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   421E DD 6E FB      [19]  553 	ld	l,-5 (ix)
   4221 DD 66 FC      [19]  554 	ld	h,-4 (ix)
   4224 7E            [ 7]  555 	ld	a,(hl)
   4225 C6 16         [ 7]  556 	add	a, #0x16
   4227 DD 6E F5      [19]  557 	ld	l,-11 (ix)
   422A DD 66 F6      [19]  558 	ld	h,-10 (ix)
   422D 77            [ 7]  559 	ld	(hl),a
                            560 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   422E DD 6E F9      [19]  561 	ld	l,-7 (ix)
   4231 DD 66 FA      [19]  562 	ld	h,-6 (ix)
   4234 36 A0         [10]  563 	ld	(hl),#<(_g_knifeY_0)
   4236 23            [ 6]  564 	inc	hl
   4237 36 17         [10]  565 	ld	(hl),#>(_g_knifeY_0)
                            566 ;src/knifestruct.c:72: cu->eje = E_Y;
   4239 DD 6E F7      [19]  567 	ld	l,-9 (ix)
   423C DD 66 F8      [19]  568 	ld	h,-8 (ix)
   423F 36 01         [10]  569 	ld	(hl),#0x01
                            570 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   4241 DD 6E 0A      [19]  571 	ld	l,10 (ix)
   4244 DD 66 0B      [19]  572 	ld	h,11 (ix)
   4247 E5            [11]  573 	push	hl
   4248 C5            [11]  574 	push	bc
   4249 CD 0A 3F      [17]  575 	call	_dibujarCuchillo
   424C F1            [10]  576 	pop	af
   424D F1            [10]  577 	pop	af
   424E 18 78         [12]  578 	jr	00122$
   4250                     579 00112$:
                            580 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   4250 7D            [ 4]  581 	ld	a,l
   4251 D6 02         [ 7]  582 	sub	a, #0x02
   4253 20 73         [12]  583 	jr	NZ,00122$
                            584 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4255 DD 6E FB      [19]  585 	ld	l,-5 (ix)
   4258 DD 66 FC      [19]  586 	ld	h,-4 (ix)
   425B 7E            [ 7]  587 	ld	a,(hl)
   425C C6 F7         [ 7]  588 	add	a,#0xF7
   425E DD 77 F2      [19]  589 	ld	-14 (ix),a
   4261 1A            [ 7]  590 	ld	a,(de)
   4262 C6 03         [ 7]  591 	add	a, #0x03
   4264 DD 77 FD      [19]  592 	ld	-3 (ix),a
   4267 C5            [11]  593 	push	bc
   4268 D5            [11]  594 	push	de
   4269 DD 66 F2      [19]  595 	ld	h,-14 (ix)
   426C DD 6E FD      [19]  596 	ld	l,-3 (ix)
   426F E5            [11]  597 	push	hl
   4270 DD 6E 08      [19]  598 	ld	l,8 (ix)
   4273 DD 66 09      [19]  599 	ld	h,9 (ix)
   4276 E5            [11]  600 	push	hl
   4277 CD C4 4A      [17]  601 	call	_getTilePtr
   427A F1            [10]  602 	pop	af
   427B F1            [10]  603 	pop	af
   427C D1            [10]  604 	pop	de
   427D C1            [10]  605 	pop	bc
   427E 6E            [ 7]  606 	ld	l,(hl)
   427F 3E 02         [ 7]  607 	ld	a,#0x02
   4281 95            [ 4]  608 	sub	a, l
   4282 38 44         [12]  609 	jr	C,00122$
                            610 ;src/knifestruct.c:78: cu->lanzado = SI;
   4284 DD 6E FE      [19]  611 	ld	l,-2 (ix)
   4287 DD 66 FF      [19]  612 	ld	h,-1 (ix)
   428A 36 01         [10]  613 	ld	(hl),#0x01
                            614 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   428C DD 6E F3      [19]  615 	ld	l,-13 (ix)
   428F DD 66 F4      [19]  616 	ld	h,-12 (ix)
   4292 36 02         [10]  617 	ld	(hl),#0x02
                            618 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   4294 1A            [ 7]  619 	ld	a,(de)
   4295 C6 03         [ 7]  620 	add	a, #0x03
   4297 02            [ 7]  621 	ld	(bc),a
                            622 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   4298 DD 6E FB      [19]  623 	ld	l,-5 (ix)
   429B DD 66 FC      [19]  624 	ld	h,-4 (ix)
   429E 7E            [ 7]  625 	ld	a,(hl)
   429F C6 F8         [ 7]  626 	add	a,#0xF8
   42A1 DD 6E F5      [19]  627 	ld	l,-11 (ix)
   42A4 DD 66 F6      [19]  628 	ld	h,-10 (ix)
   42A7 77            [ 7]  629 	ld	(hl),a
                            630 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   42A8 DD 6E F9      [19]  631 	ld	l,-7 (ix)
   42AB DD 66 FA      [19]  632 	ld	h,-6 (ix)
   42AE 36 B0         [10]  633 	ld	(hl),#<(_g_knifeY_1)
   42B0 23            [ 6]  634 	inc	hl
   42B1 36 17         [10]  635 	ld	(hl),#>(_g_knifeY_1)
                            636 ;src/knifestruct.c:83: cu->eje = E_Y;
   42B3 DD 6E F7      [19]  637 	ld	l,-9 (ix)
   42B6 DD 66 F8      [19]  638 	ld	h,-8 (ix)
   42B9 36 01         [10]  639 	ld	(hl),#0x01
                            640 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   42BB DD 6E 0A      [19]  641 	ld	l,10 (ix)
   42BE DD 66 0B      [19]  642 	ld	h,11 (ix)
   42C1 E5            [11]  643 	push	hl
   42C2 C5            [11]  644 	push	bc
   42C3 CD 0A 3F      [17]  645 	call	_dibujarCuchillo
   42C6 F1            [10]  646 	pop	af
   42C7 F1            [10]  647 	pop	af
   42C8                     648 00122$:
   42C8 DD F9         [10]  649 	ld	sp, ix
   42CA DD E1         [14]  650 	pop	ix
   42CC C9            [10]  651 	ret
                            652 ;src/knifestruct.c:92: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            653 ;	---------------------------------
                            654 ; Function checkKnifeCollision
                            655 ; ---------------------------------
   42CD                     656 _checkKnifeCollision::
                            657 ;src/knifestruct.c:94: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   42CD D1            [10]  658 	pop	de
   42CE C1            [10]  659 	pop	bc
   42CF C5            [11]  660 	push	bc
   42D0 D5            [11]  661 	push	de
   42D1 69            [ 4]  662 	ld	l, c
   42D2 60            [ 4]  663 	ld	h, b
   42D3 23            [ 6]  664 	inc	hl
   42D4 5E            [ 7]  665 	ld	e,(hl)
   42D5 7B            [ 4]  666 	ld	a,e
   42D6 21 05 00      [10]  667 	ld	hl,#5
   42D9 39            [11]  668 	add	hl,sp
   42DA 86            [ 7]  669 	add	a, (hl)
   42DB 57            [ 4]  670 	ld	d,a
   42DC 0A            [ 7]  671 	ld	a,(bc)
   42DD 4F            [ 4]  672 	ld	c,a
   42DE 21 04 00      [10]  673 	ld	hl,#4
   42E1 39            [11]  674 	add	hl,sp
   42E2 86            [ 7]  675 	add	a, (hl)
   42E3 47            [ 4]  676 	ld	b,a
   42E4 D5            [11]  677 	push	de
   42E5 33            [ 6]  678 	inc	sp
   42E6 C5            [11]  679 	push	bc
   42E7 33            [ 6]  680 	inc	sp
   42E8 21 08 00      [10]  681 	ld	hl, #8
   42EB 39            [11]  682 	add	hl, sp
   42EC 4E            [ 7]  683 	ld	c, (hl)
   42ED 23            [ 6]  684 	inc	hl
   42EE 46            [ 7]  685 	ld	b, (hl)
   42EF C5            [11]  686 	push	bc
   42F0 CD C4 4A      [17]  687 	call	_getTilePtr
   42F3 F1            [10]  688 	pop	af
   42F4 F1            [10]  689 	pop	af
   42F5 4E            [ 7]  690 	ld	c,(hl)
   42F6 3E 02         [ 7]  691 	ld	a,#0x02
   42F8 91            [ 4]  692 	sub	a, c
   42F9 3E 00         [ 7]  693 	ld	a,#0x00
   42FB 17            [ 4]  694 	rla
   42FC EE 01         [ 7]  695 	xor	a, #0x01
   42FE 6F            [ 4]  696 	ld	l, a
   42FF C9            [10]  697 	ret
                            698 ;src/knifestruct.c:97: void moverCuchillo(TKnife* cu, u8* mapa){
                            699 ;	---------------------------------
                            700 ; Function moverCuchillo
                            701 ; ---------------------------------
   4300                     702 _moverCuchillo::
   4300 DD E5         [15]  703 	push	ix
   4302 DD 21 00 00   [14]  704 	ld	ix,#0
   4306 DD 39         [15]  705 	add	ix,sp
   4308 F5            [11]  706 	push	af
                            707 ;src/knifestruct.c:98: if(cu->lanzado){
   4309 DD 4E 04      [19]  708 	ld	c,4 (ix)
   430C DD 46 05      [19]  709 	ld	b,5 (ix)
   430F C5            [11]  710 	push	bc
   4310 FD E1         [14]  711 	pop	iy
   4312 FD 7E 06      [19]  712 	ld	a,6 (iy)
   4315 B7            [ 4]  713 	or	a, a
   4316 CA EA 43      [10]  714 	jp	Z,00126$
                            715 ;src/knifestruct.c:99: cu->mover = SI;
   4319 21 09 00      [10]  716 	ld	hl,#0x0009
   431C 09            [11]  717 	add	hl,bc
   431D EB            [ 4]  718 	ex	de,hl
   431E 3E 01         [ 7]  719 	ld	a,#0x01
   4320 12            [ 7]  720 	ld	(de),a
                            721 ;src/knifestruct.c:100: if(cu->direccion == M_derecha){
   4321 C5            [11]  722 	push	bc
   4322 FD E1         [14]  723 	pop	iy
   4324 FD 6E 07      [19]  724 	ld	l,7 (iy)
   4327 7D            [ 4]  725 	ld	a,l
   4328 B7            [ 4]  726 	or	a, a
   4329 20 28         [12]  727 	jr	NZ,00122$
                            728 ;src/knifestruct.c:102: if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   432B C5            [11]  729 	push	bc
   432C D5            [11]  730 	push	de
   432D DD 6E 06      [19]  731 	ld	l,6 (ix)
   4330 DD 66 07      [19]  732 	ld	h,7 (ix)
   4333 E5            [11]  733 	push	hl
   4334 21 05 00      [10]  734 	ld	hl,#0x0005
   4337 E5            [11]  735 	push	hl
   4338 C5            [11]  736 	push	bc
   4339 CD CD 42      [17]  737 	call	_checkKnifeCollision
   433C F1            [10]  738 	pop	af
   433D F1            [10]  739 	pop	af
   433E F1            [10]  740 	pop	af
   433F D1            [10]  741 	pop	de
   4340 C1            [10]  742 	pop	bc
   4341 7D            [ 4]  743 	ld	a,l
   4342 B7            [ 4]  744 	or	a, a
   4343 28 09         [12]  745 	jr	Z,00102$
                            746 ;src/knifestruct.c:103: cu->mover = SI;
   4345 3E 01         [ 7]  747 	ld	a,#0x01
   4347 12            [ 7]  748 	ld	(de),a
                            749 ;src/knifestruct.c:104: cu->x++;
   4348 0A            [ 7]  750 	ld	a,(bc)
   4349 3C            [ 4]  751 	inc	a
   434A 02            [ 7]  752 	ld	(bc),a
   434B C3 EA 43      [10]  753 	jp	00126$
   434E                     754 00102$:
                            755 ;src/knifestruct.c:107: cu->mover=NO;
   434E AF            [ 4]  756 	xor	a, a
   434F 12            [ 7]  757 	ld	(de),a
   4350 C3 EA 43      [10]  758 	jp	00126$
   4353                     759 00122$:
                            760 ;src/knifestruct.c:110: else if(cu->direccion == M_izquierda){
   4353 7D            [ 4]  761 	ld	a,l
   4354 3D            [ 4]  762 	dec	a
   4355 20 27         [12]  763 	jr	NZ,00119$
                            764 ;src/knifestruct.c:111: if(checkKnifeCollision(cu, -1, 0, mapa)){
   4357 C5            [11]  765 	push	bc
   4358 D5            [11]  766 	push	de
   4359 DD 6E 06      [19]  767 	ld	l,6 (ix)
   435C DD 66 07      [19]  768 	ld	h,7 (ix)
   435F E5            [11]  769 	push	hl
   4360 21 FF 00      [10]  770 	ld	hl,#0x00FF
   4363 E5            [11]  771 	push	hl
   4364 C5            [11]  772 	push	bc
   4365 CD CD 42      [17]  773 	call	_checkKnifeCollision
   4368 F1            [10]  774 	pop	af
   4369 F1            [10]  775 	pop	af
   436A F1            [10]  776 	pop	af
   436B D1            [10]  777 	pop	de
   436C C1            [10]  778 	pop	bc
   436D 7D            [ 4]  779 	ld	a,l
   436E B7            [ 4]  780 	or	a, a
   436F 28 09         [12]  781 	jr	Z,00105$
                            782 ;src/knifestruct.c:112: cu->mover = SI;
   4371 3E 01         [ 7]  783 	ld	a,#0x01
   4373 12            [ 7]  784 	ld	(de),a
                            785 ;src/knifestruct.c:113: cu->x--;
   4374 0A            [ 7]  786 	ld	a,(bc)
   4375 C6 FF         [ 7]  787 	add	a,#0xFF
   4377 02            [ 7]  788 	ld	(bc),a
   4378 18 70         [12]  789 	jr	00126$
   437A                     790 00105$:
                            791 ;src/knifestruct.c:115: cu->mover=NO;
   437A AF            [ 4]  792 	xor	a, a
   437B 12            [ 7]  793 	ld	(de),a
   437C 18 6C         [12]  794 	jr	00126$
   437E                     795 00119$:
                            796 ;src/knifestruct.c:121: cu->y--;
   437E 79            [ 4]  797 	ld	a,c
   437F C6 01         [ 7]  798 	add	a, #0x01
   4381 DD 77 FE      [19]  799 	ld	-2 (ix),a
   4384 78            [ 4]  800 	ld	a,b
   4385 CE 00         [ 7]  801 	adc	a, #0x00
   4387 DD 77 FF      [19]  802 	ld	-1 (ix),a
                            803 ;src/knifestruct.c:118: else if(cu->direccion == M_arriba){
   438A 7D            [ 4]  804 	ld	a,l
   438B D6 02         [ 7]  805 	sub	a, #0x02
   438D 20 2C         [12]  806 	jr	NZ,00116$
                            807 ;src/knifestruct.c:119: if(checkKnifeCollision(cu, 0, -2, mapa)){
   438F D5            [11]  808 	push	de
   4390 DD 6E 06      [19]  809 	ld	l,6 (ix)
   4393 DD 66 07      [19]  810 	ld	h,7 (ix)
   4396 E5            [11]  811 	push	hl
   4397 21 00 FE      [10]  812 	ld	hl,#0xFE00
   439A E5            [11]  813 	push	hl
   439B C5            [11]  814 	push	bc
   439C CD CD 42      [17]  815 	call	_checkKnifeCollision
   439F F1            [10]  816 	pop	af
   43A0 F1            [10]  817 	pop	af
   43A1 F1            [10]  818 	pop	af
   43A2 D1            [10]  819 	pop	de
   43A3 7D            [ 4]  820 	ld	a,l
   43A4 B7            [ 4]  821 	or	a, a
   43A5 28 10         [12]  822 	jr	Z,00108$
                            823 ;src/knifestruct.c:120: cu->mover = SI;
   43A7 3E 01         [ 7]  824 	ld	a,#0x01
   43A9 12            [ 7]  825 	ld	(de),a
                            826 ;src/knifestruct.c:121: cu->y--;
   43AA E1            [10]  827 	pop	hl
   43AB E5            [11]  828 	push	hl
   43AC 4E            [ 7]  829 	ld	c,(hl)
   43AD 0D            [ 4]  830 	dec	c
   43AE E1            [10]  831 	pop	hl
   43AF E5            [11]  832 	push	hl
   43B0 71            [ 7]  833 	ld	(hl),c
                            834 ;src/knifestruct.c:122: cu->y--;
   43B1 0D            [ 4]  835 	dec	c
   43B2 E1            [10]  836 	pop	hl
   43B3 E5            [11]  837 	push	hl
   43B4 71            [ 7]  838 	ld	(hl),c
   43B5 18 33         [12]  839 	jr	00126$
   43B7                     840 00108$:
                            841 ;src/knifestruct.c:125: cu->mover=NO;
   43B7 AF            [ 4]  842 	xor	a, a
   43B8 12            [ 7]  843 	ld	(de),a
   43B9 18 2F         [12]  844 	jr	00126$
   43BB                     845 00116$:
                            846 ;src/knifestruct.c:128: else if(cu->direccion == M_abajo){
   43BB 7D            [ 4]  847 	ld	a,l
   43BC D6 03         [ 7]  848 	sub	a, #0x03
   43BE 20 2A         [12]  849 	jr	NZ,00126$
                            850 ;src/knifestruct.c:129: if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   43C0 D5            [11]  851 	push	de
   43C1 DD 6E 06      [19]  852 	ld	l,6 (ix)
   43C4 DD 66 07      [19]  853 	ld	h,7 (ix)
   43C7 E5            [11]  854 	push	hl
   43C8 21 00 0A      [10]  855 	ld	hl,#0x0A00
   43CB E5            [11]  856 	push	hl
   43CC C5            [11]  857 	push	bc
   43CD CD CD 42      [17]  858 	call	_checkKnifeCollision
   43D0 F1            [10]  859 	pop	af
   43D1 F1            [10]  860 	pop	af
   43D2 F1            [10]  861 	pop	af
   43D3 D1            [10]  862 	pop	de
   43D4 7D            [ 4]  863 	ld	a,l
   43D5 B7            [ 4]  864 	or	a, a
   43D6 28 10         [12]  865 	jr	Z,00111$
                            866 ;src/knifestruct.c:130: cu->mover = SI;
   43D8 3E 01         [ 7]  867 	ld	a,#0x01
   43DA 12            [ 7]  868 	ld	(de),a
                            869 ;src/knifestruct.c:131: cu->y++;
   43DB E1            [10]  870 	pop	hl
   43DC E5            [11]  871 	push	hl
   43DD 4E            [ 7]  872 	ld	c,(hl)
   43DE 0C            [ 4]  873 	inc	c
   43DF E1            [10]  874 	pop	hl
   43E0 E5            [11]  875 	push	hl
   43E1 71            [ 7]  876 	ld	(hl),c
                            877 ;src/knifestruct.c:132: cu->y++;
   43E2 0C            [ 4]  878 	inc	c
   43E3 E1            [10]  879 	pop	hl
   43E4 E5            [11]  880 	push	hl
   43E5 71            [ 7]  881 	ld	(hl),c
   43E6 18 02         [12]  882 	jr	00126$
   43E8                     883 00111$:
                            884 ;src/knifestruct.c:135: cu->mover=NO;
   43E8 AF            [ 4]  885 	xor	a, a
   43E9 12            [ 7]  886 	ld	(de),a
   43EA                     887 00126$:
   43EA DD F9         [10]  888 	ld	sp, ix
   43EC DD E1         [14]  889 	pop	ix
   43EE C9            [10]  890 	ret
                            891 	.area _CODE
                            892 	.area _INITIALIZER
                            893 	.area _CABS (ABS)
