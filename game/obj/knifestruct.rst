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
   44D1                      56 _dibujarCuchillo::
   44D1 DD E5         [15]   57 	push	ix
   44D3 DD 21 00 00   [14]   58 	ld	ix,#0
   44D7 DD 39         [15]   59 	add	ix,sp
   44D9 21 FA FF      [10]   60 	ld	hl,#-6
   44DC 39            [11]   61 	add	hl,sp
   44DD F9            [ 6]   62 	ld	sp,hl
                             63 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   44DE DD 5E 04      [19]   64 	ld	e,4 (ix)
   44E1 DD 56 05      [19]   65 	ld	d,5 (ix)
   44E4 6B            [ 4]   66 	ld	l, e
   44E5 62            [ 4]   67 	ld	h, d
   44E6 23            [ 6]   68 	inc	hl
   44E7 46            [ 7]   69 	ld	b,(hl)
   44E8 1A            [ 7]   70 	ld	a,(de)
   44E9 D5            [11]   71 	push	de
   44EA C5            [11]   72 	push	bc
   44EB 33            [ 6]   73 	inc	sp
   44EC F5            [11]   74 	push	af
   44ED 33            [ 6]   75 	inc	sp
   44EE 21 00 C0      [10]   76 	ld	hl,#0xC000
   44F1 E5            [11]   77 	push	hl
   44F2 CD 7F 5E      [17]   78 	call	_cpct_getScreenPtr
   44F5 D1            [10]   79 	pop	de
   44F6 33            [ 6]   80 	inc	sp
   44F7 33            [ 6]   81 	inc	sp
   44F8 E5            [11]   82 	push	hl
                             83 ;src/knifestruct.c:5: if(cu->eje == E_X){
   44F9 D5            [11]   84 	push	de
   44FA FD E1         [14]   85 	pop	iy
   44FC FD 4E 08      [19]   86 	ld	c,8 (iy)
                             87 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   44FF DD 7E 06      [19]   88 	ld	a,6 (ix)
   4502 DD 77 FC      [19]   89 	ld	-4 (ix),a
   4505 DD 7E 07      [19]   90 	ld	a,7 (ix)
   4508 DD 77 FD      [19]   91 	ld	-3 (ix),a
   450B DD 7E FA      [19]   92 	ld	a,-6 (ix)
   450E DD 77 FE      [19]   93 	ld	-2 (ix),a
   4511 DD 7E FB      [19]   94 	ld	a,-5 (ix)
   4514 DD 77 FF      [19]   95 	ld	-1 (ix),a
   4517 13            [ 6]   96 	inc	de
   4518 13            [ 6]   97 	inc	de
   4519 13            [ 6]   98 	inc	de
   451A 13            [ 6]   99 	inc	de
                            100 ;src/knifestruct.c:5: if(cu->eje == E_X){
   451B 79            [ 4]  101 	ld	a,c
   451C B7            [ 4]  102 	or	a, a
   451D 20 1A         [12]  103 	jr	NZ,00104$
                            104 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   451F EB            [ 4]  105 	ex	de,hl
   4520 4E            [ 7]  106 	ld	c,(hl)
   4521 23            [ 6]  107 	inc	hl
   4522 46            [ 7]  108 	ld	b,(hl)
   4523 D1            [10]  109 	pop	de
   4524 E1            [10]  110 	pop	hl
   4525 E5            [11]  111 	push	hl
   4526 D5            [11]  112 	push	de
   4527 E5            [11]  113 	push	hl
   4528 21 04 04      [10]  114 	ld	hl,#0x0404
   452B E5            [11]  115 	push	hl
   452C DD 6E FE      [19]  116 	ld	l,-2 (ix)
   452F DD 66 FF      [19]  117 	ld	h,-1 (ix)
   4532 E5            [11]  118 	push	hl
   4533 C5            [11]  119 	push	bc
   4534 CD 9F 5E      [17]  120 	call	_cpct_drawSpriteMaskedAlignedTable
   4537 18 1B         [12]  121 	jr	00106$
   4539                     122 00104$:
                            123 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   4539 0D            [ 4]  124 	dec	c
   453A 20 18         [12]  125 	jr	NZ,00106$
                            126 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   453C EB            [ 4]  127 	ex	de,hl
   453D 4E            [ 7]  128 	ld	c,(hl)
   453E 23            [ 6]  129 	inc	hl
   453F 46            [ 7]  130 	ld	b,(hl)
   4540 D1            [10]  131 	pop	de
   4541 E1            [10]  132 	pop	hl
   4542 E5            [11]  133 	push	hl
   4543 D5            [11]  134 	push	de
   4544 E5            [11]  135 	push	hl
   4545 21 02 08      [10]  136 	ld	hl,#0x0802
   4548 E5            [11]  137 	push	hl
   4549 DD 6E FE      [19]  138 	ld	l,-2 (ix)
   454C DD 66 FF      [19]  139 	ld	h,-1 (ix)
   454F E5            [11]  140 	push	hl
   4550 C5            [11]  141 	push	bc
   4551 CD 9F 5E      [17]  142 	call	_cpct_drawSpriteMaskedAlignedTable
   4554                     143 00106$:
   4554 DD F9         [10]  144 	ld	sp, ix
   4556 DD E1         [14]  145 	pop	ix
   4558 C9            [10]  146 	ret
                            147 ;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            148 ;	---------------------------------
                            149 ; Function borrarCuchillo
                            150 ; ---------------------------------
   4559                     151 _borrarCuchillo::
   4559 DD E5         [15]  152 	push	ix
   455B DD 21 00 00   [14]  153 	ld	ix,#0
   455F DD 39         [15]  154 	add	ix,sp
   4561 F5            [11]  155 	push	af
   4562 F5            [11]  156 	push	af
                            157 ;src/knifestruct.c:20: w = 4 + (x & 1);
   4563 DD 7E 05      [19]  158 	ld	a,5 (ix)
   4566 E6 01         [ 7]  159 	and	a, #0x01
   4568 47            [ 4]  160 	ld	b,a
                            161 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4569 DD 7E 06      [19]  162 	ld	a,6 (ix)
   456C E6 03         [ 7]  163 	and	a, #0x03
   456E 4F            [ 4]  164 	ld	c,a
                            165 ;src/knifestruct.c:19: if(eje == E_X){
   456F DD 7E 04      [19]  166 	ld	a,4 (ix)
   4572 B7            [ 4]  167 	or	a, a
   4573 20 11         [12]  168 	jr	NZ,00102$
                            169 ;src/knifestruct.c:20: w = 4 + (x & 1);
   4575 04            [ 4]  170 	inc	b
   4576 04            [ 4]  171 	inc	b
   4577 04            [ 4]  172 	inc	b
   4578 04            [ 4]  173 	inc	b
                            174 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4579 79            [ 4]  175 	ld	a,c
   457A B7            [ 4]  176 	or	a, a
   457B 28 04         [12]  177 	jr	Z,00106$
   457D 0E 01         [ 7]  178 	ld	c,#0x01
   457F 18 02         [12]  179 	jr	00107$
   4581                     180 00106$:
   4581 0E 00         [ 7]  181 	ld	c,#0x00
   4583                     182 00107$:
   4583 0C            [ 4]  183 	inc	c
   4584 18 0E         [12]  184 	jr	00103$
   4586                     185 00102$:
                            186 ;src/knifestruct.c:23: w = 2 + (x & 1);
   4586 04            [ 4]  187 	inc	b
   4587 04            [ 4]  188 	inc	b
                            189 ;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
   4588 79            [ 4]  190 	ld	a,c
   4589 B7            [ 4]  191 	or	a, a
   458A 28 04         [12]  192 	jr	Z,00108$
   458C 0E 01         [ 7]  193 	ld	c,#0x01
   458E 18 02         [12]  194 	jr	00109$
   4590                     195 00108$:
   4590 0E 00         [ 7]  196 	ld	c,#0x00
   4592                     197 00109$:
   4592 0C            [ 4]  198 	inc	c
   4593 0C            [ 4]  199 	inc	c
   4594                     200 00103$:
                            201 ;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   4594 DD 7E 07      [19]  202 	ld	a,7 (ix)
   4597 DD 77 FE      [19]  203 	ld	-2 (ix),a
   459A DD 7E 08      [19]  204 	ld	a,8 (ix)
   459D DD 77 FF      [19]  205 	ld	-1 (ix),a
   45A0 DD 5E 06      [19]  206 	ld	e,6 (ix)
   45A3 16 00         [ 7]  207 	ld	d,#0x00
   45A5 7B            [ 4]  208 	ld	a,e
   45A6 C6 E8         [ 7]  209 	add	a,#0xE8
   45A8 DD 77 FC      [19]  210 	ld	-4 (ix),a
   45AB 7A            [ 4]  211 	ld	a,d
   45AC CE FF         [ 7]  212 	adc	a,#0xFF
   45AE DD 77 FD      [19]  213 	ld	-3 (ix),a
   45B1 E1            [10]  214 	pop	hl
   45B2 E5            [11]  215 	push	hl
   45B3 DD CB FD 7E   [20]  216 	bit	7, -3 (ix)
   45B7 28 04         [12]  217 	jr	Z,00110$
   45B9 21 EB FF      [10]  218 	ld	hl,#0xFFEB
   45BC 19            [11]  219 	add	hl,de
   45BD                     220 00110$:
   45BD 5D            [ 4]  221 	ld	e,l
   45BE CB 2C         [ 8]  222 	sra	h
   45C0 CB 1B         [ 8]  223 	rr	e
   45C2 CB 2C         [ 8]  224 	sra	h
   45C4 CB 1B         [ 8]  225 	rr	e
   45C6 DD 56 05      [19]  226 	ld	d,5 (ix)
   45C9 CB 3A         [ 8]  227 	srl	d
   45CB DD 6E FE      [19]  228 	ld	l,-2 (ix)
   45CE DD 66 FF      [19]  229 	ld	h,-1 (ix)
   45D1 E5            [11]  230 	push	hl
   45D2 21 F0 C0      [10]  231 	ld	hl,#0xC0F0
   45D5 E5            [11]  232 	push	hl
   45D6 3E 28         [ 7]  233 	ld	a,#0x28
   45D8 F5            [11]  234 	push	af
   45D9 33            [ 6]  235 	inc	sp
   45DA 79            [ 4]  236 	ld	a,c
   45DB F5            [11]  237 	push	af
   45DC 33            [ 6]  238 	inc	sp
   45DD C5            [11]  239 	push	bc
   45DE 33            [ 6]  240 	inc	sp
   45DF 7B            [ 4]  241 	ld	a,e
   45E0 F5            [11]  242 	push	af
   45E1 33            [ 6]  243 	inc	sp
   45E2 D5            [11]  244 	push	de
   45E3 33            [ 6]  245 	inc	sp
   45E4 CD 61 53      [17]  246 	call	_cpct_etm_drawTileBox2x4
   45E7 DD F9         [10]  247 	ld	sp, ix
   45E9 DD E1         [14]  248 	pop	ix
   45EB C9            [10]  249 	ret
                            250 ;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            251 ;	---------------------------------
                            252 ; Function redibujarCuchillo
                            253 ; ---------------------------------
   45EC                     254 _redibujarCuchillo::
   45EC DD E5         [15]  255 	push	ix
   45EE DD 21 00 00   [14]  256 	ld	ix,#0
   45F2 DD 39         [15]  257 	add	ix,sp
                            258 ;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
   45F4 DD 6E 0B      [19]  259 	ld	l,11 (ix)
   45F7 DD 66 0C      [19]  260 	ld	h,12 (ix)
   45FA E5            [11]  261 	push	hl
   45FB DD 66 06      [19]  262 	ld	h,6 (ix)
   45FE DD 6E 05      [19]  263 	ld	l,5 (ix)
   4601 E5            [11]  264 	push	hl
   4602 DD 7E 04      [19]  265 	ld	a,4 (ix)
   4605 F5            [11]  266 	push	af
   4606 33            [ 6]  267 	inc	sp
   4607 CD 59 45      [17]  268 	call	_borrarCuchillo
   460A F1            [10]  269 	pop	af
   460B F1            [10]  270 	pop	af
   460C 33            [ 6]  271 	inc	sp
                            272 ;src/knifestruct.c:33: cu->px = cu->x;
   460D DD 4E 07      [19]  273 	ld	c,7 (ix)
   4610 DD 46 08      [19]  274 	ld	b,8 (ix)
   4613 59            [ 4]  275 	ld	e, c
   4614 50            [ 4]  276 	ld	d, b
   4615 13            [ 6]  277 	inc	de
   4616 13            [ 6]  278 	inc	de
   4617 0A            [ 7]  279 	ld	a,(bc)
   4618 12            [ 7]  280 	ld	(de),a
                            281 ;src/knifestruct.c:34: cu->py = cu->y;
   4619 59            [ 4]  282 	ld	e, c
   461A 50            [ 4]  283 	ld	d, b
   461B 13            [ 6]  284 	inc	de
   461C 13            [ 6]  285 	inc	de
   461D 13            [ 6]  286 	inc	de
   461E 69            [ 4]  287 	ld	l, c
   461F 60            [ 4]  288 	ld	h, b
   4620 23            [ 6]  289 	inc	hl
   4621 7E            [ 7]  290 	ld	a,(hl)
   4622 12            [ 7]  291 	ld	(de),a
                            292 ;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
   4623 DD 6E 09      [19]  293 	ld	l,9 (ix)
   4626 DD 66 0A      [19]  294 	ld	h,10 (ix)
   4629 E5            [11]  295 	push	hl
   462A C5            [11]  296 	push	bc
   462B CD D1 44      [17]  297 	call	_dibujarCuchillo
   462E F1            [10]  298 	pop	af
   462F F1            [10]  299 	pop	af
   4630 DD E1         [14]  300 	pop	ix
   4632 C9            [10]  301 	ret
                            302 ;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            303 ;	---------------------------------
                            304 ; Function lanzarCuchillo
                            305 ; ---------------------------------
   4633                     306 _lanzarCuchillo::
   4633 DD E5         [15]  307 	push	ix
   4635 DD 21 00 00   [14]  308 	ld	ix,#0
   4639 DD 39         [15]  309 	add	ix,sp
   463B 21 F2 FF      [10]  310 	ld	hl,#-14
   463E 39            [11]  311 	add	hl,sp
   463F F9            [ 6]  312 	ld	sp,hl
                            313 ;src/knifestruct.c:40: if(!cu->lanzado){
   4640 DD 4E 04      [19]  314 	ld	c,4 (ix)
   4643 DD 46 05      [19]  315 	ld	b,5 (ix)
   4646 21 06 00      [10]  316 	ld	hl,#0x0006
   4649 09            [11]  317 	add	hl,bc
   464A DD 75 FE      [19]  318 	ld	-2 (ix),l
   464D DD 74 FF      [19]  319 	ld	-1 (ix),h
   4650 DD 6E FE      [19]  320 	ld	l,-2 (ix)
   4653 DD 66 FF      [19]  321 	ld	h,-1 (ix)
   4656 7E            [ 7]  322 	ld	a,(hl)
   4657 B7            [ 4]  323 	or	a, a
   4658 C2 6F 48      [10]  324 	jp	NZ,00122$
                            325 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   465B DD 5E 06      [19]  326 	ld	e,6 (ix)
   465E DD 56 07      [19]  327 	ld	d,7 (ix)
   4661 6B            [ 4]  328 	ld	l, e
   4662 62            [ 4]  329 	ld	h, d
   4663 C5            [11]  330 	push	bc
   4664 01 07 00      [10]  331 	ld	bc, #0x0007
   4667 09            [11]  332 	add	hl, bc
   4668 C1            [10]  333 	pop	bc
   4669 6E            [ 7]  334 	ld	l,(hl)
                            335 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   466A 7B            [ 4]  336 	ld	a,e
   466B C6 01         [ 7]  337 	add	a, #0x01
   466D DD 77 F2      [19]  338 	ld	-14 (ix),a
   4670 7A            [ 4]  339 	ld	a,d
   4671 CE 00         [ 7]  340 	adc	a, #0x00
   4673 DD 77 F3      [19]  341 	ld	-13 (ix),a
                            342 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   4676 79            [ 4]  343 	ld	a,c
   4677 C6 07         [ 7]  344 	add	a, #0x07
   4679 DD 77 F7      [19]  345 	ld	-9 (ix),a
   467C 78            [ 4]  346 	ld	a,b
   467D CE 00         [ 7]  347 	adc	a, #0x00
   467F DD 77 F8      [19]  348 	ld	-8 (ix),a
                            349 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4682 79            [ 4]  350 	ld	a,c
   4683 C6 01         [ 7]  351 	add	a, #0x01
   4685 DD 77 F4      [19]  352 	ld	-12 (ix),a
   4688 78            [ 4]  353 	ld	a,b
   4689 CE 00         [ 7]  354 	adc	a, #0x00
   468B DD 77 F5      [19]  355 	ld	-11 (ix),a
                            356 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   468E 79            [ 4]  357 	ld	a,c
   468F C6 04         [ 7]  358 	add	a, #0x04
   4691 DD 77 FC      [19]  359 	ld	-4 (ix),a
   4694 78            [ 4]  360 	ld	a,b
   4695 CE 00         [ 7]  361 	adc	a, #0x00
   4697 DD 77 FD      [19]  362 	ld	-3 (ix),a
                            363 ;src/knifestruct.c:49: cu->eje = E_X;
   469A 79            [ 4]  364 	ld	a,c
   469B C6 08         [ 7]  365 	add	a, #0x08
   469D DD 77 FA      [19]  366 	ld	-6 (ix),a
   46A0 78            [ 4]  367 	ld	a,b
   46A1 CE 00         [ 7]  368 	adc	a, #0x00
   46A3 DD 77 FB      [19]  369 	ld	-5 (ix),a
                            370 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   46A6 7D            [ 4]  371 	ld	a,l
   46A7 B7            [ 4]  372 	or	a, a
   46A8 20 6F         [12]  373 	jr	NZ,00118$
                            374 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   46AA E1            [10]  375 	pop	hl
   46AB E5            [11]  376 	push	hl
   46AC 7E            [ 7]  377 	ld	a,(hl)
   46AD C6 0B         [ 7]  378 	add	a, #0x0B
   46AF DD 77 F9      [19]  379 	ld	-7 (ix),a
   46B2 1A            [ 7]  380 	ld	a,(de)
   46B3 C6 0C         [ 7]  381 	add	a, #0x0C
   46B5 DD 77 F6      [19]  382 	ld	-10 (ix),a
   46B8 C5            [11]  383 	push	bc
   46B9 D5            [11]  384 	push	de
   46BA DD 66 F9      [19]  385 	ld	h,-7 (ix)
   46BD DD 6E F6      [19]  386 	ld	l,-10 (ix)
   46C0 E5            [11]  387 	push	hl
   46C1 DD 6E 08      [19]  388 	ld	l,8 (ix)
   46C4 DD 66 09      [19]  389 	ld	h,9 (ix)
   46C7 E5            [11]  390 	push	hl
   46C8 CD 96 49      [17]  391 	call	_getTilePtr
   46CB F1            [10]  392 	pop	af
   46CC F1            [10]  393 	pop	af
   46CD D1            [10]  394 	pop	de
   46CE C1            [10]  395 	pop	bc
   46CF 6E            [ 7]  396 	ld	l,(hl)
   46D0 3E 02         [ 7]  397 	ld	a,#0x02
   46D2 95            [ 4]  398 	sub	a, l
   46D3 DA 6F 48      [10]  399 	jp	C,00122$
                            400 ;src/knifestruct.c:44: cu->lanzado = SI;
   46D6 DD 6E FE      [19]  401 	ld	l,-2 (ix)
   46D9 DD 66 FF      [19]  402 	ld	h,-1 (ix)
   46DC 36 01         [10]  403 	ld	(hl),#0x01
                            404 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   46DE DD 6E F7      [19]  405 	ld	l,-9 (ix)
   46E1 DD 66 F8      [19]  406 	ld	h,-8 (ix)
   46E4 36 00         [10]  407 	ld	(hl),#0x00
                            408 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   46E6 1A            [ 7]  409 	ld	a,(de)
   46E7 C6 07         [ 7]  410 	add	a, #0x07
   46E9 02            [ 7]  411 	ld	(bc),a
                            412 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   46EA E1            [10]  413 	pop	hl
   46EB E5            [11]  414 	push	hl
   46EC 7E            [ 7]  415 	ld	a,(hl)
   46ED C6 0B         [ 7]  416 	add	a, #0x0B
   46EF DD 6E F4      [19]  417 	ld	l,-12 (ix)
   46F2 DD 66 F5      [19]  418 	ld	h,-11 (ix)
   46F5 77            [ 7]  419 	ld	(hl),a
                            420 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   46F6 DD 6E FC      [19]  421 	ld	l,-4 (ix)
   46F9 DD 66 FD      [19]  422 	ld	h,-3 (ix)
   46FC 36 C0         [10]  423 	ld	(hl),#<(_g_knifeX_0)
   46FE 23            [ 6]  424 	inc	hl
   46FF 36 17         [10]  425 	ld	(hl),#>(_g_knifeX_0)
                            426 ;src/knifestruct.c:49: cu->eje = E_X;
   4701 DD 6E FA      [19]  427 	ld	l,-6 (ix)
   4704 DD 66 FB      [19]  428 	ld	h,-5 (ix)
   4707 36 00         [10]  429 	ld	(hl),#0x00
                            430 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   4709 DD 6E 0A      [19]  431 	ld	l,10 (ix)
   470C DD 66 0B      [19]  432 	ld	h,11 (ix)
   470F E5            [11]  433 	push	hl
   4710 C5            [11]  434 	push	bc
   4711 CD D1 44      [17]  435 	call	_dibujarCuchillo
   4714 F1            [10]  436 	pop	af
   4715 F1            [10]  437 	pop	af
   4716 C3 6F 48      [10]  438 	jp	00122$
   4719                     439 00118$:
                            440 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   4719 7D            [ 4]  441 	ld	a,l
   471A 3D            [ 4]  442 	dec	a
   471B 20 6F         [12]  443 	jr	NZ,00115$
                            444 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   471D E1            [10]  445 	pop	hl
   471E E5            [11]  446 	push	hl
   471F 7E            [ 7]  447 	ld	a,(hl)
   4720 C6 0B         [ 7]  448 	add	a, #0x0B
   4722 DD 77 F6      [19]  449 	ld	-10 (ix),a
   4725 1A            [ 7]  450 	ld	a,(de)
   4726 C6 F6         [ 7]  451 	add	a,#0xF6
   4728 DD 77 F9      [19]  452 	ld	-7 (ix),a
   472B C5            [11]  453 	push	bc
   472C D5            [11]  454 	push	de
   472D DD 66 F6      [19]  455 	ld	h,-10 (ix)
   4730 DD 6E F9      [19]  456 	ld	l,-7 (ix)
   4733 E5            [11]  457 	push	hl
   4734 DD 6E 08      [19]  458 	ld	l,8 (ix)
   4737 DD 66 09      [19]  459 	ld	h,9 (ix)
   473A E5            [11]  460 	push	hl
   473B CD 96 49      [17]  461 	call	_getTilePtr
   473E F1            [10]  462 	pop	af
   473F F1            [10]  463 	pop	af
   4740 D1            [10]  464 	pop	de
   4741 C1            [10]  465 	pop	bc
   4742 6E            [ 7]  466 	ld	l,(hl)
   4743 3E 02         [ 7]  467 	ld	a,#0x02
   4745 95            [ 4]  468 	sub	a, l
   4746 DA 6F 48      [10]  469 	jp	C,00122$
                            470 ;src/knifestruct.c:55: cu->lanzado = SI;
   4749 DD 6E FE      [19]  471 	ld	l,-2 (ix)
   474C DD 66 FF      [19]  472 	ld	h,-1 (ix)
   474F 36 01         [10]  473 	ld	(hl),#0x01
                            474 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   4751 DD 6E F7      [19]  475 	ld	l,-9 (ix)
   4754 DD 66 F8      [19]  476 	ld	h,-8 (ix)
   4757 36 01         [10]  477 	ld	(hl),#0x01
                            478 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   4759 1A            [ 7]  479 	ld	a,(de)
   475A C6 FC         [ 7]  480 	add	a,#0xFC
   475C 02            [ 7]  481 	ld	(bc),a
                            482 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   475D E1            [10]  483 	pop	hl
   475E E5            [11]  484 	push	hl
   475F 7E            [ 7]  485 	ld	a,(hl)
   4760 C6 0B         [ 7]  486 	add	a, #0x0B
   4762 DD 6E F4      [19]  487 	ld	l,-12 (ix)
   4765 DD 66 F5      [19]  488 	ld	h,-11 (ix)
   4768 77            [ 7]  489 	ld	(hl),a
                            490 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   4769 DD 6E FC      [19]  491 	ld	l,-4 (ix)
   476C DD 66 FD      [19]  492 	ld	h,-3 (ix)
   476F 36 D0         [10]  493 	ld	(hl),#<(_g_knifeX_1)
   4771 23            [ 6]  494 	inc	hl
   4772 36 17         [10]  495 	ld	(hl),#>(_g_knifeX_1)
                            496 ;src/knifestruct.c:60: cu->eje = E_X;
   4774 DD 6E FA      [19]  497 	ld	l,-6 (ix)
   4777 DD 66 FB      [19]  498 	ld	h,-5 (ix)
   477A 36 00         [10]  499 	ld	(hl),#0x00
                            500 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   477C DD 6E 0A      [19]  501 	ld	l,10 (ix)
   477F DD 66 0B      [19]  502 	ld	h,11 (ix)
   4782 E5            [11]  503 	push	hl
   4783 C5            [11]  504 	push	bc
   4784 CD D1 44      [17]  505 	call	_dibujarCuchillo
   4787 F1            [10]  506 	pop	af
   4788 F1            [10]  507 	pop	af
   4789 C3 6F 48      [10]  508 	jp	00122$
   478C                     509 00115$:
                            510 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   478C 7D            [ 4]  511 	ld	a,l
   478D D6 03         [ 7]  512 	sub	a, #0x03
   478F 20 6E         [12]  513 	jr	NZ,00112$
                            514 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   4791 E1            [10]  515 	pop	hl
   4792 E5            [11]  516 	push	hl
   4793 7E            [ 7]  517 	ld	a,(hl)
   4794 C6 1F         [ 7]  518 	add	a, #0x1F
   4796 DD 77 F6      [19]  519 	ld	-10 (ix),a
   4799 1A            [ 7]  520 	ld	a,(de)
   479A C6 03         [ 7]  521 	add	a, #0x03
   479C DD 77 F9      [19]  522 	ld	-7 (ix),a
   479F C5            [11]  523 	push	bc
   47A0 D5            [11]  524 	push	de
   47A1 DD 66 F6      [19]  525 	ld	h,-10 (ix)
   47A4 DD 6E F9      [19]  526 	ld	l,-7 (ix)
   47A7 E5            [11]  527 	push	hl
   47A8 DD 6E 08      [19]  528 	ld	l,8 (ix)
   47AB DD 66 09      [19]  529 	ld	h,9 (ix)
   47AE E5            [11]  530 	push	hl
   47AF CD 96 49      [17]  531 	call	_getTilePtr
   47B2 F1            [10]  532 	pop	af
   47B3 F1            [10]  533 	pop	af
   47B4 D1            [10]  534 	pop	de
   47B5 C1            [10]  535 	pop	bc
   47B6 6E            [ 7]  536 	ld	l,(hl)
   47B7 3E 02         [ 7]  537 	ld	a,#0x02
   47B9 95            [ 4]  538 	sub	a, l
   47BA DA 6F 48      [10]  539 	jp	C,00122$
                            540 ;src/knifestruct.c:67: cu->lanzado = SI;
   47BD DD 6E FE      [19]  541 	ld	l,-2 (ix)
   47C0 DD 66 FF      [19]  542 	ld	h,-1 (ix)
   47C3 36 01         [10]  543 	ld	(hl),#0x01
                            544 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   47C5 DD 6E F7      [19]  545 	ld	l,-9 (ix)
   47C8 DD 66 F8      [19]  546 	ld	h,-8 (ix)
   47CB 36 03         [10]  547 	ld	(hl),#0x03
                            548 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   47CD 1A            [ 7]  549 	ld	a,(de)
   47CE C6 03         [ 7]  550 	add	a, #0x03
   47D0 02            [ 7]  551 	ld	(bc),a
                            552 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   47D1 E1            [10]  553 	pop	hl
   47D2 E5            [11]  554 	push	hl
   47D3 7E            [ 7]  555 	ld	a,(hl)
   47D4 C6 16         [ 7]  556 	add	a, #0x16
   47D6 DD 6E F4      [19]  557 	ld	l,-12 (ix)
   47D9 DD 66 F5      [19]  558 	ld	h,-11 (ix)
   47DC 77            [ 7]  559 	ld	(hl),a
                            560 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   47DD DD 6E FC      [19]  561 	ld	l,-4 (ix)
   47E0 DD 66 FD      [19]  562 	ld	h,-3 (ix)
   47E3 36 A0         [10]  563 	ld	(hl),#<(_g_knifeY_0)
   47E5 23            [ 6]  564 	inc	hl
   47E6 36 17         [10]  565 	ld	(hl),#>(_g_knifeY_0)
                            566 ;src/knifestruct.c:72: cu->eje = E_Y;
   47E8 DD 6E FA      [19]  567 	ld	l,-6 (ix)
   47EB DD 66 FB      [19]  568 	ld	h,-5 (ix)
   47EE 36 01         [10]  569 	ld	(hl),#0x01
                            570 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   47F0 DD 6E 0A      [19]  571 	ld	l,10 (ix)
   47F3 DD 66 0B      [19]  572 	ld	h,11 (ix)
   47F6 E5            [11]  573 	push	hl
   47F7 C5            [11]  574 	push	bc
   47F8 CD D1 44      [17]  575 	call	_dibujarCuchillo
   47FB F1            [10]  576 	pop	af
   47FC F1            [10]  577 	pop	af
   47FD 18 70         [12]  578 	jr	00122$
   47FF                     579 00112$:
                            580 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   47FF 7D            [ 4]  581 	ld	a,l
   4800 D6 02         [ 7]  582 	sub	a, #0x02
   4802 20 6B         [12]  583 	jr	NZ,00122$
                            584 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4804 E1            [10]  585 	pop	hl
   4805 E5            [11]  586 	push	hl
   4806 7E            [ 7]  587 	ld	a,(hl)
   4807 C6 F7         [ 7]  588 	add	a,#0xF7
   4809 DD 77 F6      [19]  589 	ld	-10 (ix),a
   480C 1A            [ 7]  590 	ld	a,(de)
   480D C6 03         [ 7]  591 	add	a, #0x03
   480F DD 77 F9      [19]  592 	ld	-7 (ix),a
   4812 C5            [11]  593 	push	bc
   4813 D5            [11]  594 	push	de
   4814 DD 66 F6      [19]  595 	ld	h,-10 (ix)
   4817 DD 6E F9      [19]  596 	ld	l,-7 (ix)
   481A E5            [11]  597 	push	hl
   481B DD 6E 08      [19]  598 	ld	l,8 (ix)
   481E DD 66 09      [19]  599 	ld	h,9 (ix)
   4821 E5            [11]  600 	push	hl
   4822 CD 96 49      [17]  601 	call	_getTilePtr
   4825 F1            [10]  602 	pop	af
   4826 F1            [10]  603 	pop	af
   4827 D1            [10]  604 	pop	de
   4828 C1            [10]  605 	pop	bc
   4829 6E            [ 7]  606 	ld	l,(hl)
   482A 3E 02         [ 7]  607 	ld	a,#0x02
   482C 95            [ 4]  608 	sub	a, l
   482D 38 40         [12]  609 	jr	C,00122$
                            610 ;src/knifestruct.c:78: cu->lanzado = SI;
   482F DD 6E FE      [19]  611 	ld	l,-2 (ix)
   4832 DD 66 FF      [19]  612 	ld	h,-1 (ix)
   4835 36 01         [10]  613 	ld	(hl),#0x01
                            614 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   4837 DD 6E F7      [19]  615 	ld	l,-9 (ix)
   483A DD 66 F8      [19]  616 	ld	h,-8 (ix)
   483D 36 02         [10]  617 	ld	(hl),#0x02
                            618 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   483F 1A            [ 7]  619 	ld	a,(de)
   4840 C6 03         [ 7]  620 	add	a, #0x03
   4842 02            [ 7]  621 	ld	(bc),a
                            622 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   4843 E1            [10]  623 	pop	hl
   4844 E5            [11]  624 	push	hl
   4845 7E            [ 7]  625 	ld	a,(hl)
   4846 C6 F8         [ 7]  626 	add	a,#0xF8
   4848 DD 6E F4      [19]  627 	ld	l,-12 (ix)
   484B DD 66 F5      [19]  628 	ld	h,-11 (ix)
   484E 77            [ 7]  629 	ld	(hl),a
                            630 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   484F DD 6E FC      [19]  631 	ld	l,-4 (ix)
   4852 DD 66 FD      [19]  632 	ld	h,-3 (ix)
   4855 36 B0         [10]  633 	ld	(hl),#<(_g_knifeY_1)
   4857 23            [ 6]  634 	inc	hl
   4858 36 17         [10]  635 	ld	(hl),#>(_g_knifeY_1)
                            636 ;src/knifestruct.c:83: cu->eje = E_Y;
   485A DD 6E FA      [19]  637 	ld	l,-6 (ix)
   485D DD 66 FB      [19]  638 	ld	h,-5 (ix)
   4860 36 01         [10]  639 	ld	(hl),#0x01
                            640 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   4862 DD 6E 0A      [19]  641 	ld	l,10 (ix)
   4865 DD 66 0B      [19]  642 	ld	h,11 (ix)
   4868 E5            [11]  643 	push	hl
   4869 C5            [11]  644 	push	bc
   486A CD D1 44      [17]  645 	call	_dibujarCuchillo
   486D F1            [10]  646 	pop	af
   486E F1            [10]  647 	pop	af
   486F                     648 00122$:
   486F DD F9         [10]  649 	ld	sp, ix
   4871 DD E1         [14]  650 	pop	ix
   4873 C9            [10]  651 	ret
                            652 ;src/knifestruct.c:92: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            653 ;	---------------------------------
                            654 ; Function checkKnifeCollision
                            655 ; ---------------------------------
   4874                     656 _checkKnifeCollision::
                            657 ;src/knifestruct.c:94: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   4874 D1            [10]  658 	pop	de
   4875 C1            [10]  659 	pop	bc
   4876 C5            [11]  660 	push	bc
   4877 D5            [11]  661 	push	de
   4878 69            [ 4]  662 	ld	l, c
   4879 60            [ 4]  663 	ld	h, b
   487A 23            [ 6]  664 	inc	hl
   487B 5E            [ 7]  665 	ld	e,(hl)
   487C 7B            [ 4]  666 	ld	a,e
   487D 21 05 00      [10]  667 	ld	hl,#5
   4880 39            [11]  668 	add	hl,sp
   4881 86            [ 7]  669 	add	a, (hl)
   4882 57            [ 4]  670 	ld	d,a
   4883 0A            [ 7]  671 	ld	a,(bc)
   4884 4F            [ 4]  672 	ld	c,a
   4885 21 04 00      [10]  673 	ld	hl,#4
   4888 39            [11]  674 	add	hl,sp
   4889 86            [ 7]  675 	add	a, (hl)
   488A 47            [ 4]  676 	ld	b,a
   488B D5            [11]  677 	push	de
   488C 33            [ 6]  678 	inc	sp
   488D C5            [11]  679 	push	bc
   488E 33            [ 6]  680 	inc	sp
   488F 21 08 00      [10]  681 	ld	hl, #8
   4892 39            [11]  682 	add	hl, sp
   4893 4E            [ 7]  683 	ld	c, (hl)
   4894 23            [ 6]  684 	inc	hl
   4895 46            [ 7]  685 	ld	b, (hl)
   4896 C5            [11]  686 	push	bc
   4897 CD 96 49      [17]  687 	call	_getTilePtr
   489A F1            [10]  688 	pop	af
   489B F1            [10]  689 	pop	af
   489C 4E            [ 7]  690 	ld	c,(hl)
   489D 3E 02         [ 7]  691 	ld	a,#0x02
   489F 91            [ 4]  692 	sub	a, c
   48A0 3E 00         [ 7]  693 	ld	a,#0x00
   48A2 17            [ 4]  694 	rla
   48A3 EE 01         [ 7]  695 	xor	a, #0x01
   48A5 6F            [ 4]  696 	ld	l, a
   48A6 C9            [10]  697 	ret
                            698 ;src/knifestruct.c:97: void moverCuchillo(TKnife* cu, u8* mapa){
                            699 ;	---------------------------------
                            700 ; Function moverCuchillo
                            701 ; ---------------------------------
   48A7                     702 _moverCuchillo::
   48A7 DD E5         [15]  703 	push	ix
   48A9 DD 21 00 00   [14]  704 	ld	ix,#0
   48AD DD 39         [15]  705 	add	ix,sp
   48AF F5            [11]  706 	push	af
                            707 ;src/knifestruct.c:98: if(cu->lanzado){
   48B0 DD 4E 04      [19]  708 	ld	c,4 (ix)
   48B3 DD 46 05      [19]  709 	ld	b,5 (ix)
   48B6 C5            [11]  710 	push	bc
   48B7 FD E1         [14]  711 	pop	iy
   48B9 FD 7E 06      [19]  712 	ld	a,6 (iy)
   48BC B7            [ 4]  713 	or	a, a
   48BD CA 91 49      [10]  714 	jp	Z,00126$
                            715 ;src/knifestruct.c:99: cu->mover = SI;
   48C0 21 09 00      [10]  716 	ld	hl,#0x0009
   48C3 09            [11]  717 	add	hl,bc
   48C4 EB            [ 4]  718 	ex	de,hl
   48C5 3E 01         [ 7]  719 	ld	a,#0x01
   48C7 12            [ 7]  720 	ld	(de),a
                            721 ;src/knifestruct.c:100: if(cu->direccion == M_derecha){
   48C8 C5            [11]  722 	push	bc
   48C9 FD E1         [14]  723 	pop	iy
   48CB FD 6E 07      [19]  724 	ld	l,7 (iy)
   48CE 7D            [ 4]  725 	ld	a,l
   48CF B7            [ 4]  726 	or	a, a
   48D0 20 28         [12]  727 	jr	NZ,00122$
                            728 ;src/knifestruct.c:102: if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   48D2 C5            [11]  729 	push	bc
   48D3 D5            [11]  730 	push	de
   48D4 DD 6E 06      [19]  731 	ld	l,6 (ix)
   48D7 DD 66 07      [19]  732 	ld	h,7 (ix)
   48DA E5            [11]  733 	push	hl
   48DB 21 05 00      [10]  734 	ld	hl,#0x0005
   48DE E5            [11]  735 	push	hl
   48DF C5            [11]  736 	push	bc
   48E0 CD 74 48      [17]  737 	call	_checkKnifeCollision
   48E3 F1            [10]  738 	pop	af
   48E4 F1            [10]  739 	pop	af
   48E5 F1            [10]  740 	pop	af
   48E6 D1            [10]  741 	pop	de
   48E7 C1            [10]  742 	pop	bc
   48E8 7D            [ 4]  743 	ld	a,l
   48E9 B7            [ 4]  744 	or	a, a
   48EA 28 09         [12]  745 	jr	Z,00102$
                            746 ;src/knifestruct.c:103: cu->mover = SI;
   48EC 3E 01         [ 7]  747 	ld	a,#0x01
   48EE 12            [ 7]  748 	ld	(de),a
                            749 ;src/knifestruct.c:104: cu->x++;
   48EF 0A            [ 7]  750 	ld	a,(bc)
   48F0 3C            [ 4]  751 	inc	a
   48F1 02            [ 7]  752 	ld	(bc),a
   48F2 C3 91 49      [10]  753 	jp	00126$
   48F5                     754 00102$:
                            755 ;src/knifestruct.c:107: cu->mover=NO;
   48F5 AF            [ 4]  756 	xor	a, a
   48F6 12            [ 7]  757 	ld	(de),a
   48F7 C3 91 49      [10]  758 	jp	00126$
   48FA                     759 00122$:
                            760 ;src/knifestruct.c:110: else if(cu->direccion == M_izquierda){
   48FA 7D            [ 4]  761 	ld	a,l
   48FB 3D            [ 4]  762 	dec	a
   48FC 20 27         [12]  763 	jr	NZ,00119$
                            764 ;src/knifestruct.c:111: if(checkKnifeCollision(cu, -1, 0, mapa)){
   48FE C5            [11]  765 	push	bc
   48FF D5            [11]  766 	push	de
   4900 DD 6E 06      [19]  767 	ld	l,6 (ix)
   4903 DD 66 07      [19]  768 	ld	h,7 (ix)
   4906 E5            [11]  769 	push	hl
   4907 21 FF 00      [10]  770 	ld	hl,#0x00FF
   490A E5            [11]  771 	push	hl
   490B C5            [11]  772 	push	bc
   490C CD 74 48      [17]  773 	call	_checkKnifeCollision
   490F F1            [10]  774 	pop	af
   4910 F1            [10]  775 	pop	af
   4911 F1            [10]  776 	pop	af
   4912 D1            [10]  777 	pop	de
   4913 C1            [10]  778 	pop	bc
   4914 7D            [ 4]  779 	ld	a,l
   4915 B7            [ 4]  780 	or	a, a
   4916 28 09         [12]  781 	jr	Z,00105$
                            782 ;src/knifestruct.c:112: cu->mover = SI;
   4918 3E 01         [ 7]  783 	ld	a,#0x01
   491A 12            [ 7]  784 	ld	(de),a
                            785 ;src/knifestruct.c:113: cu->x--;
   491B 0A            [ 7]  786 	ld	a,(bc)
   491C C6 FF         [ 7]  787 	add	a,#0xFF
   491E 02            [ 7]  788 	ld	(bc),a
   491F 18 70         [12]  789 	jr	00126$
   4921                     790 00105$:
                            791 ;src/knifestruct.c:115: cu->mover=NO;
   4921 AF            [ 4]  792 	xor	a, a
   4922 12            [ 7]  793 	ld	(de),a
   4923 18 6C         [12]  794 	jr	00126$
   4925                     795 00119$:
                            796 ;src/knifestruct.c:121: cu->y--;
   4925 79            [ 4]  797 	ld	a,c
   4926 C6 01         [ 7]  798 	add	a, #0x01
   4928 DD 77 FE      [19]  799 	ld	-2 (ix),a
   492B 78            [ 4]  800 	ld	a,b
   492C CE 00         [ 7]  801 	adc	a, #0x00
   492E DD 77 FF      [19]  802 	ld	-1 (ix),a
                            803 ;src/knifestruct.c:118: else if(cu->direccion == M_arriba){
   4931 7D            [ 4]  804 	ld	a,l
   4932 D6 02         [ 7]  805 	sub	a, #0x02
   4934 20 2C         [12]  806 	jr	NZ,00116$
                            807 ;src/knifestruct.c:119: if(checkKnifeCollision(cu, 0, -2, mapa)){
   4936 D5            [11]  808 	push	de
   4937 DD 6E 06      [19]  809 	ld	l,6 (ix)
   493A DD 66 07      [19]  810 	ld	h,7 (ix)
   493D E5            [11]  811 	push	hl
   493E 21 00 FE      [10]  812 	ld	hl,#0xFE00
   4941 E5            [11]  813 	push	hl
   4942 C5            [11]  814 	push	bc
   4943 CD 74 48      [17]  815 	call	_checkKnifeCollision
   4946 F1            [10]  816 	pop	af
   4947 F1            [10]  817 	pop	af
   4948 F1            [10]  818 	pop	af
   4949 D1            [10]  819 	pop	de
   494A 7D            [ 4]  820 	ld	a,l
   494B B7            [ 4]  821 	or	a, a
   494C 28 10         [12]  822 	jr	Z,00108$
                            823 ;src/knifestruct.c:120: cu->mover = SI;
   494E 3E 01         [ 7]  824 	ld	a,#0x01
   4950 12            [ 7]  825 	ld	(de),a
                            826 ;src/knifestruct.c:121: cu->y--;
   4951 E1            [10]  827 	pop	hl
   4952 E5            [11]  828 	push	hl
   4953 4E            [ 7]  829 	ld	c,(hl)
   4954 0D            [ 4]  830 	dec	c
   4955 E1            [10]  831 	pop	hl
   4956 E5            [11]  832 	push	hl
   4957 71            [ 7]  833 	ld	(hl),c
                            834 ;src/knifestruct.c:122: cu->y--;
   4958 0D            [ 4]  835 	dec	c
   4959 E1            [10]  836 	pop	hl
   495A E5            [11]  837 	push	hl
   495B 71            [ 7]  838 	ld	(hl),c
   495C 18 33         [12]  839 	jr	00126$
   495E                     840 00108$:
                            841 ;src/knifestruct.c:125: cu->mover=NO;
   495E AF            [ 4]  842 	xor	a, a
   495F 12            [ 7]  843 	ld	(de),a
   4960 18 2F         [12]  844 	jr	00126$
   4962                     845 00116$:
                            846 ;src/knifestruct.c:128: else if(cu->direccion == M_abajo){
   4962 7D            [ 4]  847 	ld	a,l
   4963 D6 03         [ 7]  848 	sub	a, #0x03
   4965 20 2A         [12]  849 	jr	NZ,00126$
                            850 ;src/knifestruct.c:129: if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   4967 D5            [11]  851 	push	de
   4968 DD 6E 06      [19]  852 	ld	l,6 (ix)
   496B DD 66 07      [19]  853 	ld	h,7 (ix)
   496E E5            [11]  854 	push	hl
   496F 21 00 0A      [10]  855 	ld	hl,#0x0A00
   4972 E5            [11]  856 	push	hl
   4973 C5            [11]  857 	push	bc
   4974 CD 74 48      [17]  858 	call	_checkKnifeCollision
   4977 F1            [10]  859 	pop	af
   4978 F1            [10]  860 	pop	af
   4979 F1            [10]  861 	pop	af
   497A D1            [10]  862 	pop	de
   497B 7D            [ 4]  863 	ld	a,l
   497C B7            [ 4]  864 	or	a, a
   497D 28 10         [12]  865 	jr	Z,00111$
                            866 ;src/knifestruct.c:130: cu->mover = SI;
   497F 3E 01         [ 7]  867 	ld	a,#0x01
   4981 12            [ 7]  868 	ld	(de),a
                            869 ;src/knifestruct.c:131: cu->y++;
   4982 E1            [10]  870 	pop	hl
   4983 E5            [11]  871 	push	hl
   4984 4E            [ 7]  872 	ld	c,(hl)
   4985 0C            [ 4]  873 	inc	c
   4986 E1            [10]  874 	pop	hl
   4987 E5            [11]  875 	push	hl
   4988 71            [ 7]  876 	ld	(hl),c
                            877 ;src/knifestruct.c:132: cu->y++;
   4989 0C            [ 4]  878 	inc	c
   498A E1            [10]  879 	pop	hl
   498B E5            [11]  880 	push	hl
   498C 71            [ 7]  881 	ld	(hl),c
   498D 18 02         [12]  882 	jr	00126$
   498F                     883 00111$:
                            884 ;src/knifestruct.c:135: cu->mover=NO;
   498F AF            [ 4]  885 	xor	a, a
   4990 12            [ 7]  886 	ld	(de),a
   4991                     887 00126$:
   4991 DD F9         [10]  888 	ld	sp, ix
   4993 DD E1         [14]  889 	pop	ix
   4995 C9            [10]  890 	ret
                            891 	.area _CODE
                            892 	.area _INITIALIZER
                            893 	.area _CABS (ABS)
