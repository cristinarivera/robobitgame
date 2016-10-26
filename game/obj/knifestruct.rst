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
                             53 ;src/knifestruct.c:3: void dibujarCuchillo(TKnife* cu, u8* g_tablatrans) {
                             54 ;	---------------------------------
                             55 ; Function dibujarCuchillo
                             56 ; ---------------------------------
   44EA                      57 _dibujarCuchillo::
   44EA DD E5         [15]   58 	push	ix
   44EC DD 21 00 00   [14]   59 	ld	ix,#0
   44F0 DD 39         [15]   60 	add	ix,sp
   44F2 21 FA FF      [10]   61 	ld	hl,#-6
   44F5 39            [11]   62 	add	hl,sp
   44F6 F9            [ 6]   63 	ld	sp,hl
                             64 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   44F7 DD 5E 04      [19]   65 	ld	e,4 (ix)
   44FA DD 56 05      [19]   66 	ld	d,5 (ix)
   44FD 6B            [ 4]   67 	ld	l, e
   44FE 62            [ 4]   68 	ld	h, d
   44FF 23            [ 6]   69 	inc	hl
   4500 46            [ 7]   70 	ld	b,(hl)
   4501 1A            [ 7]   71 	ld	a,(de)
   4502 D5            [11]   72 	push	de
   4503 C5            [11]   73 	push	bc
   4504 33            [ 6]   74 	inc	sp
   4505 F5            [11]   75 	push	af
   4506 33            [ 6]   76 	inc	sp
   4507 21 00 C0      [10]   77 	ld	hl,#0xC000
   450A E5            [11]   78 	push	hl
   450B CD 15 5F      [17]   79 	call	_cpct_getScreenPtr
   450E D1            [10]   80 	pop	de
   450F 33            [ 6]   81 	inc	sp
   4510 33            [ 6]   82 	inc	sp
   4511 E5            [11]   83 	push	hl
                             84 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4512 D5            [11]   85 	push	de
   4513 FD E1         [14]   86 	pop	iy
   4515 FD 4E 08      [19]   87 	ld	c,8 (iy)
                             88 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   4518 DD 7E 06      [19]   89 	ld	a,6 (ix)
   451B DD 77 FC      [19]   90 	ld	-4 (ix),a
   451E DD 7E 07      [19]   91 	ld	a,7 (ix)
   4521 DD 77 FD      [19]   92 	ld	-3 (ix),a
   4524 DD 7E FA      [19]   93 	ld	a,-6 (ix)
   4527 DD 77 FE      [19]   94 	ld	-2 (ix),a
   452A DD 7E FB      [19]   95 	ld	a,-5 (ix)
   452D DD 77 FF      [19]   96 	ld	-1 (ix),a
   4530 13            [ 6]   97 	inc	de
   4531 13            [ 6]   98 	inc	de
   4532 13            [ 6]   99 	inc	de
   4533 13            [ 6]  100 	inc	de
                            101 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4534 79            [ 4]  102 	ld	a,c
   4535 B7            [ 4]  103 	or	a, a
   4536 20 1A         [12]  104 	jr	NZ,00104$
                            105 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   4538 EB            [ 4]  106 	ex	de,hl
   4539 4E            [ 7]  107 	ld	c,(hl)
   453A 23            [ 6]  108 	inc	hl
   453B 46            [ 7]  109 	ld	b,(hl)
   453C D1            [10]  110 	pop	de
   453D E1            [10]  111 	pop	hl
   453E E5            [11]  112 	push	hl
   453F D5            [11]  113 	push	de
   4540 E5            [11]  114 	push	hl
   4541 21 04 04      [10]  115 	ld	hl,#0x0404
   4544 E5            [11]  116 	push	hl
   4545 DD 6E FE      [19]  117 	ld	l,-2 (ix)
   4548 DD 66 FF      [19]  118 	ld	h,-1 (ix)
   454B E5            [11]  119 	push	hl
   454C C5            [11]  120 	push	bc
   454D CD 35 5F      [17]  121 	call	_cpct_drawSpriteMaskedAlignedTable
   4550 18 1B         [12]  122 	jr	00106$
   4552                     123 00104$:
                            124 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   4552 0D            [ 4]  125 	dec	c
   4553 20 18         [12]  126 	jr	NZ,00106$
                            127 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   4555 EB            [ 4]  128 	ex	de,hl
   4556 4E            [ 7]  129 	ld	c,(hl)
   4557 23            [ 6]  130 	inc	hl
   4558 46            [ 7]  131 	ld	b,(hl)
   4559 D1            [10]  132 	pop	de
   455A E1            [10]  133 	pop	hl
   455B E5            [11]  134 	push	hl
   455C D5            [11]  135 	push	de
   455D E5            [11]  136 	push	hl
   455E 21 02 08      [10]  137 	ld	hl,#0x0802
   4561 E5            [11]  138 	push	hl
   4562 DD 6E FE      [19]  139 	ld	l,-2 (ix)
   4565 DD 66 FF      [19]  140 	ld	h,-1 (ix)
   4568 E5            [11]  141 	push	hl
   4569 C5            [11]  142 	push	bc
   456A CD 35 5F      [17]  143 	call	_cpct_drawSpriteMaskedAlignedTable
   456D                     144 00106$:
   456D DD F9         [10]  145 	ld	sp, ix
   456F DD E1         [14]  146 	pop	ix
   4571 C9            [10]  147 	ret
                            148 ;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            149 ;	---------------------------------
                            150 ; Function borrarCuchillo
                            151 ; ---------------------------------
   4572                     152 _borrarCuchillo::
   4572 DD E5         [15]  153 	push	ix
   4574 DD 21 00 00   [14]  154 	ld	ix,#0
   4578 DD 39         [15]  155 	add	ix,sp
   457A F5            [11]  156 	push	af
   457B F5            [11]  157 	push	af
                            158 ;src/knifestruct.c:20: w = 4 + (x & 1);
   457C DD 7E 05      [19]  159 	ld	a,5 (ix)
   457F E6 01         [ 7]  160 	and	a, #0x01
   4581 47            [ 4]  161 	ld	b,a
                            162 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4582 DD 7E 06      [19]  163 	ld	a,6 (ix)
   4585 E6 03         [ 7]  164 	and	a, #0x03
   4587 4F            [ 4]  165 	ld	c,a
                            166 ;src/knifestruct.c:19: if(eje == E_X){
   4588 DD 7E 04      [19]  167 	ld	a,4 (ix)
   458B B7            [ 4]  168 	or	a, a
   458C 20 11         [12]  169 	jr	NZ,00102$
                            170 ;src/knifestruct.c:20: w = 4 + (x & 1);
   458E 04            [ 4]  171 	inc	b
   458F 04            [ 4]  172 	inc	b
   4590 04            [ 4]  173 	inc	b
   4591 04            [ 4]  174 	inc	b
                            175 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4592 79            [ 4]  176 	ld	a,c
   4593 B7            [ 4]  177 	or	a, a
   4594 28 04         [12]  178 	jr	Z,00106$
   4596 0E 01         [ 7]  179 	ld	c,#0x01
   4598 18 02         [12]  180 	jr	00107$
   459A                     181 00106$:
   459A 0E 00         [ 7]  182 	ld	c,#0x00
   459C                     183 00107$:
   459C 0C            [ 4]  184 	inc	c
   459D 18 0E         [12]  185 	jr	00103$
   459F                     186 00102$:
                            187 ;src/knifestruct.c:23: w = 2 + (x & 1);
   459F 04            [ 4]  188 	inc	b
   45A0 04            [ 4]  189 	inc	b
                            190 ;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
   45A1 79            [ 4]  191 	ld	a,c
   45A2 B7            [ 4]  192 	or	a, a
   45A3 28 04         [12]  193 	jr	Z,00108$
   45A5 0E 01         [ 7]  194 	ld	c,#0x01
   45A7 18 02         [12]  195 	jr	00109$
   45A9                     196 00108$:
   45A9 0E 00         [ 7]  197 	ld	c,#0x00
   45AB                     198 00109$:
   45AB 0C            [ 4]  199 	inc	c
   45AC 0C            [ 4]  200 	inc	c
   45AD                     201 00103$:
                            202 ;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   45AD DD 7E 07      [19]  203 	ld	a,7 (ix)
   45B0 DD 77 FC      [19]  204 	ld	-4 (ix),a
   45B3 DD 7E 08      [19]  205 	ld	a,8 (ix)
   45B6 DD 77 FD      [19]  206 	ld	-3 (ix),a
   45B9 DD 5E 06      [19]  207 	ld	e,6 (ix)
   45BC 16 00         [ 7]  208 	ld	d,#0x00
   45BE 7B            [ 4]  209 	ld	a,e
   45BF C6 E8         [ 7]  210 	add	a,#0xE8
   45C1 DD 77 FE      [19]  211 	ld	-2 (ix),a
   45C4 7A            [ 4]  212 	ld	a,d
   45C5 CE FF         [ 7]  213 	adc	a,#0xFF
   45C7 DD 77 FF      [19]  214 	ld	-1 (ix),a
   45CA DD 6E FE      [19]  215 	ld	l,-2 (ix)
   45CD DD 66 FF      [19]  216 	ld	h,-1 (ix)
   45D0 DD CB FF 7E   [20]  217 	bit	7, -1 (ix)
   45D4 28 04         [12]  218 	jr	Z,00110$
   45D6 21 EB FF      [10]  219 	ld	hl,#0xFFEB
   45D9 19            [11]  220 	add	hl,de
   45DA                     221 00110$:
   45DA 5D            [ 4]  222 	ld	e,l
   45DB CB 2C         [ 8]  223 	sra	h
   45DD CB 1B         [ 8]  224 	rr	e
   45DF CB 2C         [ 8]  225 	sra	h
   45E1 CB 1B         [ 8]  226 	rr	e
   45E3 DD 56 05      [19]  227 	ld	d,5 (ix)
   45E6 CB 3A         [ 8]  228 	srl	d
   45E8 E1            [10]  229 	pop	hl
   45E9 E5            [11]  230 	push	hl
   45EA E5            [11]  231 	push	hl
   45EB 21 F0 C0      [10]  232 	ld	hl,#0xC0F0
   45EE E5            [11]  233 	push	hl
   45EF 3E 28         [ 7]  234 	ld	a,#0x28
   45F1 F5            [11]  235 	push	af
   45F2 33            [ 6]  236 	inc	sp
   45F3 79            [ 4]  237 	ld	a,c
   45F4 F5            [11]  238 	push	af
   45F5 33            [ 6]  239 	inc	sp
   45F6 C5            [11]  240 	push	bc
   45F7 33            [ 6]  241 	inc	sp
   45F8 7B            [ 4]  242 	ld	a,e
   45F9 F5            [11]  243 	push	af
   45FA 33            [ 6]  244 	inc	sp
   45FB D5            [11]  245 	push	de
   45FC 33            [ 6]  246 	inc	sp
   45FD CD F7 53      [17]  247 	call	_cpct_etm_drawTileBox2x4
   4600 DD F9         [10]  248 	ld	sp, ix
   4602 DD E1         [14]  249 	pop	ix
   4604 C9            [10]  250 	ret
                            251 ;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            252 ;	---------------------------------
                            253 ; Function redibujarCuchillo
                            254 ; ---------------------------------
   4605                     255 _redibujarCuchillo::
   4605 DD E5         [15]  256 	push	ix
   4607 DD 21 00 00   [14]  257 	ld	ix,#0
   460B DD 39         [15]  258 	add	ix,sp
                            259 ;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
   460D DD 6E 0B      [19]  260 	ld	l,11 (ix)
   4610 DD 66 0C      [19]  261 	ld	h,12 (ix)
   4613 E5            [11]  262 	push	hl
   4614 DD 66 06      [19]  263 	ld	h,6 (ix)
   4617 DD 6E 05      [19]  264 	ld	l,5 (ix)
   461A E5            [11]  265 	push	hl
   461B DD 7E 04      [19]  266 	ld	a,4 (ix)
   461E F5            [11]  267 	push	af
   461F 33            [ 6]  268 	inc	sp
   4620 CD 72 45      [17]  269 	call	_borrarCuchillo
   4623 F1            [10]  270 	pop	af
   4624 F1            [10]  271 	pop	af
   4625 33            [ 6]  272 	inc	sp
                            273 ;src/knifestruct.c:33: cu->px = cu->x;
   4626 DD 4E 07      [19]  274 	ld	c,7 (ix)
   4629 DD 46 08      [19]  275 	ld	b,8 (ix)
   462C 59            [ 4]  276 	ld	e, c
   462D 50            [ 4]  277 	ld	d, b
   462E 13            [ 6]  278 	inc	de
   462F 13            [ 6]  279 	inc	de
   4630 0A            [ 7]  280 	ld	a,(bc)
   4631 12            [ 7]  281 	ld	(de),a
                            282 ;src/knifestruct.c:34: cu->py = cu->y;
   4632 59            [ 4]  283 	ld	e, c
   4633 50            [ 4]  284 	ld	d, b
   4634 13            [ 6]  285 	inc	de
   4635 13            [ 6]  286 	inc	de
   4636 13            [ 6]  287 	inc	de
   4637 69            [ 4]  288 	ld	l, c
   4638 60            [ 4]  289 	ld	h, b
   4639 23            [ 6]  290 	inc	hl
   463A 7E            [ 7]  291 	ld	a,(hl)
   463B 12            [ 7]  292 	ld	(de),a
                            293 ;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
   463C DD 6E 09      [19]  294 	ld	l,9 (ix)
   463F DD 66 0A      [19]  295 	ld	h,10 (ix)
   4642 E5            [11]  296 	push	hl
   4643 C5            [11]  297 	push	bc
   4644 CD EA 44      [17]  298 	call	_dibujarCuchillo
   4647 F1            [10]  299 	pop	af
   4648 F1            [10]  300 	pop	af
   4649 DD E1         [14]  301 	pop	ix
   464B C9            [10]  302 	ret
                            303 ;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            304 ;	---------------------------------
                            305 ; Function lanzarCuchillo
                            306 ; ---------------------------------
   464C                     307 _lanzarCuchillo::
   464C DD E5         [15]  308 	push	ix
   464E DD 21 00 00   [14]  309 	ld	ix,#0
   4652 DD 39         [15]  310 	add	ix,sp
   4654 21 F2 FF      [10]  311 	ld	hl,#-14
   4657 39            [11]  312 	add	hl,sp
   4658 F9            [ 6]  313 	ld	sp,hl
                            314 ;src/knifestruct.c:40: if(!cu->lanzado){
   4659 DD 4E 04      [19]  315 	ld	c,4 (ix)
   465C DD 46 05      [19]  316 	ld	b,5 (ix)
   465F 21 06 00      [10]  317 	ld	hl,#0x0006
   4662 09            [11]  318 	add	hl,bc
   4663 DD 75 FE      [19]  319 	ld	-2 (ix),l
   4666 DD 74 FF      [19]  320 	ld	-1 (ix),h
   4669 DD 6E FE      [19]  321 	ld	l,-2 (ix)
   466C DD 66 FF      [19]  322 	ld	h,-1 (ix)
   466F 7E            [ 7]  323 	ld	a,(hl)
   4670 B7            [ 4]  324 	or	a, a
   4671 C2 98 48      [10]  325 	jp	NZ,00122$
                            326 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   4674 DD 5E 06      [19]  327 	ld	e,6 (ix)
   4677 DD 56 07      [19]  328 	ld	d,7 (ix)
   467A 6B            [ 4]  329 	ld	l, e
   467B 62            [ 4]  330 	ld	h, d
   467C C5            [11]  331 	push	bc
   467D 01 07 00      [10]  332 	ld	bc, #0x0007
   4680 09            [11]  333 	add	hl, bc
   4681 C1            [10]  334 	pop	bc
   4682 6E            [ 7]  335 	ld	l,(hl)
                            336 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4683 7B            [ 4]  337 	ld	a,e
   4684 C6 01         [ 7]  338 	add	a, #0x01
   4686 DD 77 F8      [19]  339 	ld	-8 (ix),a
   4689 7A            [ 4]  340 	ld	a,d
   468A CE 00         [ 7]  341 	adc	a, #0x00
   468C DD 77 F9      [19]  342 	ld	-7 (ix),a
                            343 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   468F 79            [ 4]  344 	ld	a,c
   4690 C6 07         [ 7]  345 	add	a, #0x07
   4692 DD 77 F6      [19]  346 	ld	-10 (ix),a
   4695 78            [ 4]  347 	ld	a,b
   4696 CE 00         [ 7]  348 	adc	a, #0x00
   4698 DD 77 F7      [19]  349 	ld	-9 (ix),a
                            350 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   469B 79            [ 4]  351 	ld	a,c
   469C C6 01         [ 7]  352 	add	a, #0x01
   469E DD 77 F2      [19]  353 	ld	-14 (ix),a
   46A1 78            [ 4]  354 	ld	a,b
   46A2 CE 00         [ 7]  355 	adc	a, #0x00
   46A4 DD 77 F3      [19]  356 	ld	-13 (ix),a
                            357 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   46A7 79            [ 4]  358 	ld	a,c
   46A8 C6 04         [ 7]  359 	add	a, #0x04
   46AA DD 77 FA      [19]  360 	ld	-6 (ix),a
   46AD 78            [ 4]  361 	ld	a,b
   46AE CE 00         [ 7]  362 	adc	a, #0x00
   46B0 DD 77 FB      [19]  363 	ld	-5 (ix),a
                            364 ;src/knifestruct.c:49: cu->eje = E_X;
   46B3 79            [ 4]  365 	ld	a,c
   46B4 C6 08         [ 7]  366 	add	a, #0x08
   46B6 DD 77 FC      [19]  367 	ld	-4 (ix),a
   46B9 78            [ 4]  368 	ld	a,b
   46BA CE 00         [ 7]  369 	adc	a, #0x00
   46BC DD 77 FD      [19]  370 	ld	-3 (ix),a
                            371 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   46BF 7D            [ 4]  372 	ld	a,l
   46C0 B7            [ 4]  373 	or	a, a
   46C1 20 73         [12]  374 	jr	NZ,00118$
                            375 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   46C3 DD 6E F8      [19]  376 	ld	l,-8 (ix)
   46C6 DD 66 F9      [19]  377 	ld	h,-7 (ix)
   46C9 7E            [ 7]  378 	ld	a,(hl)
   46CA C6 0B         [ 7]  379 	add	a, #0x0B
   46CC DD 77 F4      [19]  380 	ld	-12 (ix),a
   46CF 1A            [ 7]  381 	ld	a,(de)
   46D0 C6 0C         [ 7]  382 	add	a, #0x0C
   46D2 DD 77 F5      [19]  383 	ld	-11 (ix),a
   46D5 C5            [11]  384 	push	bc
   46D6 D5            [11]  385 	push	de
   46D7 DD 66 F4      [19]  386 	ld	h,-12 (ix)
   46DA DD 6E F5      [19]  387 	ld	l,-11 (ix)
   46DD E5            [11]  388 	push	hl
   46DE DD 6E 08      [19]  389 	ld	l,8 (ix)
   46E1 DD 66 09      [19]  390 	ld	h,9 (ix)
   46E4 E5            [11]  391 	push	hl
   46E5 CD 2C 4A      [17]  392 	call	_getTilePtr
   46E8 F1            [10]  393 	pop	af
   46E9 F1            [10]  394 	pop	af
   46EA D1            [10]  395 	pop	de
   46EB C1            [10]  396 	pop	bc
   46EC 6E            [ 7]  397 	ld	l,(hl)
   46ED 3E 02         [ 7]  398 	ld	a,#0x02
   46EF 95            [ 4]  399 	sub	a, l
   46F0 DA 98 48      [10]  400 	jp	C,00122$
                            401 ;src/knifestruct.c:44: cu->lanzado = SI;
   46F3 DD 6E FE      [19]  402 	ld	l,-2 (ix)
   46F6 DD 66 FF      [19]  403 	ld	h,-1 (ix)
   46F9 36 01         [10]  404 	ld	(hl),#0x01
                            405 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   46FB DD 6E F6      [19]  406 	ld	l,-10 (ix)
   46FE DD 66 F7      [19]  407 	ld	h,-9 (ix)
   4701 36 00         [10]  408 	ld	(hl),#0x00
                            409 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   4703 1A            [ 7]  410 	ld	a,(de)
   4704 C6 07         [ 7]  411 	add	a, #0x07
   4706 02            [ 7]  412 	ld	(bc),a
                            413 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4707 DD 6E F8      [19]  414 	ld	l,-8 (ix)
   470A DD 66 F9      [19]  415 	ld	h,-7 (ix)
   470D 7E            [ 7]  416 	ld	a,(hl)
   470E C6 0B         [ 7]  417 	add	a, #0x0B
   4710 E1            [10]  418 	pop	hl
   4711 E5            [11]  419 	push	hl
   4712 77            [ 7]  420 	ld	(hl),a
                            421 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4713 DD 6E FA      [19]  422 	ld	l,-6 (ix)
   4716 DD 66 FB      [19]  423 	ld	h,-5 (ix)
   4719 36 C0         [10]  424 	ld	(hl),#<(_g_knifeX_0)
   471B 23            [ 6]  425 	inc	hl
   471C 36 17         [10]  426 	ld	(hl),#>(_g_knifeX_0)
                            427 ;src/knifestruct.c:49: cu->eje = E_X;
   471E DD 6E FC      [19]  428 	ld	l,-4 (ix)
   4721 DD 66 FD      [19]  429 	ld	h,-3 (ix)
   4724 36 00         [10]  430 	ld	(hl),#0x00
                            431 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   4726 DD 6E 0A      [19]  432 	ld	l,10 (ix)
   4729 DD 66 0B      [19]  433 	ld	h,11 (ix)
   472C E5            [11]  434 	push	hl
   472D C5            [11]  435 	push	bc
   472E CD EA 44      [17]  436 	call	_dibujarCuchillo
   4731 F1            [10]  437 	pop	af
   4732 F1            [10]  438 	pop	af
   4733 C3 98 48      [10]  439 	jp	00122$
   4736                     440 00118$:
                            441 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   4736 7D            [ 4]  442 	ld	a,l
   4737 3D            [ 4]  443 	dec	a
   4738 20 73         [12]  444 	jr	NZ,00115$
                            445 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   473A DD 6E F8      [19]  446 	ld	l,-8 (ix)
   473D DD 66 F9      [19]  447 	ld	h,-7 (ix)
   4740 7E            [ 7]  448 	ld	a,(hl)
   4741 C6 0B         [ 7]  449 	add	a, #0x0B
   4743 DD 77 F5      [19]  450 	ld	-11 (ix),a
   4746 1A            [ 7]  451 	ld	a,(de)
   4747 C6 F6         [ 7]  452 	add	a,#0xF6
   4749 DD 77 F4      [19]  453 	ld	-12 (ix),a
   474C C5            [11]  454 	push	bc
   474D D5            [11]  455 	push	de
   474E DD 66 F5      [19]  456 	ld	h,-11 (ix)
   4751 DD 6E F4      [19]  457 	ld	l,-12 (ix)
   4754 E5            [11]  458 	push	hl
   4755 DD 6E 08      [19]  459 	ld	l,8 (ix)
   4758 DD 66 09      [19]  460 	ld	h,9 (ix)
   475B E5            [11]  461 	push	hl
   475C CD 2C 4A      [17]  462 	call	_getTilePtr
   475F F1            [10]  463 	pop	af
   4760 F1            [10]  464 	pop	af
   4761 D1            [10]  465 	pop	de
   4762 C1            [10]  466 	pop	bc
   4763 6E            [ 7]  467 	ld	l,(hl)
   4764 3E 02         [ 7]  468 	ld	a,#0x02
   4766 95            [ 4]  469 	sub	a, l
   4767 DA 98 48      [10]  470 	jp	C,00122$
                            471 ;src/knifestruct.c:55: cu->lanzado = SI;
   476A DD 6E FE      [19]  472 	ld	l,-2 (ix)
   476D DD 66 FF      [19]  473 	ld	h,-1 (ix)
   4770 36 01         [10]  474 	ld	(hl),#0x01
                            475 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   4772 DD 6E F6      [19]  476 	ld	l,-10 (ix)
   4775 DD 66 F7      [19]  477 	ld	h,-9 (ix)
   4778 36 01         [10]  478 	ld	(hl),#0x01
                            479 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   477A 1A            [ 7]  480 	ld	a,(de)
   477B C6 FC         [ 7]  481 	add	a,#0xFC
   477D 02            [ 7]  482 	ld	(bc),a
                            483 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   477E DD 6E F8      [19]  484 	ld	l,-8 (ix)
   4781 DD 66 F9      [19]  485 	ld	h,-7 (ix)
   4784 7E            [ 7]  486 	ld	a,(hl)
   4785 C6 0B         [ 7]  487 	add	a, #0x0B
   4787 E1            [10]  488 	pop	hl
   4788 E5            [11]  489 	push	hl
   4789 77            [ 7]  490 	ld	(hl),a
                            491 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   478A DD 6E FA      [19]  492 	ld	l,-6 (ix)
   478D DD 66 FB      [19]  493 	ld	h,-5 (ix)
   4790 36 D0         [10]  494 	ld	(hl),#<(_g_knifeX_1)
   4792 23            [ 6]  495 	inc	hl
   4793 36 17         [10]  496 	ld	(hl),#>(_g_knifeX_1)
                            497 ;src/knifestruct.c:60: cu->eje = E_X;
   4795 DD 6E FC      [19]  498 	ld	l,-4 (ix)
   4798 DD 66 FD      [19]  499 	ld	h,-3 (ix)
   479B 36 00         [10]  500 	ld	(hl),#0x00
                            501 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   479D DD 6E 0A      [19]  502 	ld	l,10 (ix)
   47A0 DD 66 0B      [19]  503 	ld	h,11 (ix)
   47A3 E5            [11]  504 	push	hl
   47A4 C5            [11]  505 	push	bc
   47A5 CD EA 44      [17]  506 	call	_dibujarCuchillo
   47A8 F1            [10]  507 	pop	af
   47A9 F1            [10]  508 	pop	af
   47AA C3 98 48      [10]  509 	jp	00122$
   47AD                     510 00115$:
                            511 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   47AD 7D            [ 4]  512 	ld	a,l
   47AE D6 03         [ 7]  513 	sub	a, #0x03
   47B0 20 72         [12]  514 	jr	NZ,00112$
                            515 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   47B2 DD 6E F8      [19]  516 	ld	l,-8 (ix)
   47B5 DD 66 F9      [19]  517 	ld	h,-7 (ix)
   47B8 7E            [ 7]  518 	ld	a,(hl)
   47B9 C6 1F         [ 7]  519 	add	a, #0x1F
   47BB DD 77 F5      [19]  520 	ld	-11 (ix),a
   47BE 1A            [ 7]  521 	ld	a,(de)
   47BF C6 03         [ 7]  522 	add	a, #0x03
   47C1 DD 77 F4      [19]  523 	ld	-12 (ix),a
   47C4 C5            [11]  524 	push	bc
   47C5 D5            [11]  525 	push	de
   47C6 DD 66 F5      [19]  526 	ld	h,-11 (ix)
   47C9 DD 6E F4      [19]  527 	ld	l,-12 (ix)
   47CC E5            [11]  528 	push	hl
   47CD DD 6E 08      [19]  529 	ld	l,8 (ix)
   47D0 DD 66 09      [19]  530 	ld	h,9 (ix)
   47D3 E5            [11]  531 	push	hl
   47D4 CD 2C 4A      [17]  532 	call	_getTilePtr
   47D7 F1            [10]  533 	pop	af
   47D8 F1            [10]  534 	pop	af
   47D9 D1            [10]  535 	pop	de
   47DA C1            [10]  536 	pop	bc
   47DB 6E            [ 7]  537 	ld	l,(hl)
   47DC 3E 02         [ 7]  538 	ld	a,#0x02
   47DE 95            [ 4]  539 	sub	a, l
   47DF DA 98 48      [10]  540 	jp	C,00122$
                            541 ;src/knifestruct.c:67: cu->lanzado = SI;
   47E2 DD 6E FE      [19]  542 	ld	l,-2 (ix)
   47E5 DD 66 FF      [19]  543 	ld	h,-1 (ix)
   47E8 36 01         [10]  544 	ld	(hl),#0x01
                            545 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   47EA DD 6E F6      [19]  546 	ld	l,-10 (ix)
   47ED DD 66 F7      [19]  547 	ld	h,-9 (ix)
   47F0 36 03         [10]  548 	ld	(hl),#0x03
                            549 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   47F2 1A            [ 7]  550 	ld	a,(de)
   47F3 C6 03         [ 7]  551 	add	a, #0x03
   47F5 02            [ 7]  552 	ld	(bc),a
                            553 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   47F6 DD 6E F8      [19]  554 	ld	l,-8 (ix)
   47F9 DD 66 F9      [19]  555 	ld	h,-7 (ix)
   47FC 7E            [ 7]  556 	ld	a,(hl)
   47FD C6 16         [ 7]  557 	add	a, #0x16
   47FF E1            [10]  558 	pop	hl
   4800 E5            [11]  559 	push	hl
   4801 77            [ 7]  560 	ld	(hl),a
                            561 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   4802 DD 6E FA      [19]  562 	ld	l,-6 (ix)
   4805 DD 66 FB      [19]  563 	ld	h,-5 (ix)
   4808 36 A0         [10]  564 	ld	(hl),#<(_g_knifeY_0)
   480A 23            [ 6]  565 	inc	hl
   480B 36 17         [10]  566 	ld	(hl),#>(_g_knifeY_0)
                            567 ;src/knifestruct.c:72: cu->eje = E_Y;
   480D DD 6E FC      [19]  568 	ld	l,-4 (ix)
   4810 DD 66 FD      [19]  569 	ld	h,-3 (ix)
   4813 36 01         [10]  570 	ld	(hl),#0x01
                            571 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   4815 DD 6E 0A      [19]  572 	ld	l,10 (ix)
   4818 DD 66 0B      [19]  573 	ld	h,11 (ix)
   481B E5            [11]  574 	push	hl
   481C C5            [11]  575 	push	bc
   481D CD EA 44      [17]  576 	call	_dibujarCuchillo
   4820 F1            [10]  577 	pop	af
   4821 F1            [10]  578 	pop	af
   4822 18 74         [12]  579 	jr	00122$
   4824                     580 00112$:
                            581 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   4824 7D            [ 4]  582 	ld	a,l
   4825 D6 02         [ 7]  583 	sub	a, #0x02
   4827 20 6F         [12]  584 	jr	NZ,00122$
                            585 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4829 DD 6E F8      [19]  586 	ld	l,-8 (ix)
   482C DD 66 F9      [19]  587 	ld	h,-7 (ix)
   482F 7E            [ 7]  588 	ld	a,(hl)
   4830 C6 F7         [ 7]  589 	add	a,#0xF7
   4832 DD 77 F5      [19]  590 	ld	-11 (ix),a
   4835 1A            [ 7]  591 	ld	a,(de)
   4836 C6 03         [ 7]  592 	add	a, #0x03
   4838 DD 77 F4      [19]  593 	ld	-12 (ix),a
   483B C5            [11]  594 	push	bc
   483C D5            [11]  595 	push	de
   483D DD 66 F5      [19]  596 	ld	h,-11 (ix)
   4840 DD 6E F4      [19]  597 	ld	l,-12 (ix)
   4843 E5            [11]  598 	push	hl
   4844 DD 6E 08      [19]  599 	ld	l,8 (ix)
   4847 DD 66 09      [19]  600 	ld	h,9 (ix)
   484A E5            [11]  601 	push	hl
   484B CD 2C 4A      [17]  602 	call	_getTilePtr
   484E F1            [10]  603 	pop	af
   484F F1            [10]  604 	pop	af
   4850 D1            [10]  605 	pop	de
   4851 C1            [10]  606 	pop	bc
   4852 6E            [ 7]  607 	ld	l,(hl)
   4853 3E 02         [ 7]  608 	ld	a,#0x02
   4855 95            [ 4]  609 	sub	a, l
   4856 38 40         [12]  610 	jr	C,00122$
                            611 ;src/knifestruct.c:78: cu->lanzado = SI;
   4858 DD 6E FE      [19]  612 	ld	l,-2 (ix)
   485B DD 66 FF      [19]  613 	ld	h,-1 (ix)
   485E 36 01         [10]  614 	ld	(hl),#0x01
                            615 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   4860 DD 6E F6      [19]  616 	ld	l,-10 (ix)
   4863 DD 66 F7      [19]  617 	ld	h,-9 (ix)
   4866 36 02         [10]  618 	ld	(hl),#0x02
                            619 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   4868 1A            [ 7]  620 	ld	a,(de)
   4869 C6 03         [ 7]  621 	add	a, #0x03
   486B 02            [ 7]  622 	ld	(bc),a
                            623 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   486C DD 6E F8      [19]  624 	ld	l,-8 (ix)
   486F DD 66 F9      [19]  625 	ld	h,-7 (ix)
   4872 7E            [ 7]  626 	ld	a,(hl)
   4873 C6 F8         [ 7]  627 	add	a,#0xF8
   4875 E1            [10]  628 	pop	hl
   4876 E5            [11]  629 	push	hl
   4877 77            [ 7]  630 	ld	(hl),a
                            631 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   4878 DD 6E FA      [19]  632 	ld	l,-6 (ix)
   487B DD 66 FB      [19]  633 	ld	h,-5 (ix)
   487E 36 B0         [10]  634 	ld	(hl),#<(_g_knifeY_1)
   4880 23            [ 6]  635 	inc	hl
   4881 36 17         [10]  636 	ld	(hl),#>(_g_knifeY_1)
                            637 ;src/knifestruct.c:83: cu->eje = E_Y;
   4883 DD 6E FC      [19]  638 	ld	l,-4 (ix)
   4886 DD 66 FD      [19]  639 	ld	h,-3 (ix)
   4889 36 01         [10]  640 	ld	(hl),#0x01
                            641 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   488B DD 6E 0A      [19]  642 	ld	l,10 (ix)
   488E DD 66 0B      [19]  643 	ld	h,11 (ix)
   4891 E5            [11]  644 	push	hl
   4892 C5            [11]  645 	push	bc
   4893 CD EA 44      [17]  646 	call	_dibujarCuchillo
   4896 F1            [10]  647 	pop	af
   4897 F1            [10]  648 	pop	af
   4898                     649 00122$:
   4898 DD F9         [10]  650 	ld	sp, ix
   489A DD E1         [14]  651 	pop	ix
   489C C9            [10]  652 	ret
                            653 ;src/knifestruct.c:90: u8 checkOffBounds(TKnife* cu){
                            654 ;	---------------------------------
                            655 ; Function checkOffBounds
                            656 ; ---------------------------------
   489D                     657 _checkOffBounds::
                            658 ;src/knifestruct.c:91: return (cu->x + G_KNIFEX_0_W  > (80 - 4) || cu->x < (0 + 4));
   489D C1            [10]  659 	pop	bc
   489E E1            [10]  660 	pop	hl
   489F E5            [11]  661 	push	hl
   48A0 C5            [11]  662 	push	bc
   48A1 4E            [ 7]  663 	ld	c,(hl)
   48A2 59            [ 4]  664 	ld	e,c
   48A3 16 00         [ 7]  665 	ld	d,#0x00
   48A5 13            [ 6]  666 	inc	de
   48A6 13            [ 6]  667 	inc	de
   48A7 13            [ 6]  668 	inc	de
   48A8 13            [ 6]  669 	inc	de
   48A9 3E 4C         [ 7]  670 	ld	a,#0x4C
   48AB BB            [ 4]  671 	cp	a, e
   48AC 3E 00         [ 7]  672 	ld	a,#0x00
   48AE 9A            [ 4]  673 	sbc	a, d
   48AF E2 B4 48      [10]  674 	jp	PO, 00114$
   48B2 EE 80         [ 7]  675 	xor	a, #0x80
   48B4                     676 00114$:
   48B4 FA BF 48      [10]  677 	jp	M,00104$
   48B7 79            [ 4]  678 	ld	a,c
   48B8 D6 04         [ 7]  679 	sub	a, #0x04
   48BA 38 03         [12]  680 	jr	C,00104$
   48BC 2E 00         [ 7]  681 	ld	l,#0x00
   48BE C9            [10]  682 	ret
   48BF                     683 00104$:
   48BF 2E 01         [ 7]  684 	ld	l,#0x01
   48C1 C9            [10]  685 	ret
                            686 ;src/knifestruct.c:94: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            687 ;	---------------------------------
                            688 ; Function checkKnifeCollision
                            689 ; ---------------------------------
   48C2                     690 _checkKnifeCollision::
                            691 ;src/knifestruct.c:96: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   48C2 D1            [10]  692 	pop	de
   48C3 C1            [10]  693 	pop	bc
   48C4 C5            [11]  694 	push	bc
   48C5 D5            [11]  695 	push	de
   48C6 69            [ 4]  696 	ld	l, c
   48C7 60            [ 4]  697 	ld	h, b
   48C8 23            [ 6]  698 	inc	hl
   48C9 5E            [ 7]  699 	ld	e,(hl)
   48CA 7B            [ 4]  700 	ld	a,e
   48CB 21 05 00      [10]  701 	ld	hl,#5
   48CE 39            [11]  702 	add	hl,sp
   48CF 86            [ 7]  703 	add	a, (hl)
   48D0 57            [ 4]  704 	ld	d,a
   48D1 0A            [ 7]  705 	ld	a,(bc)
   48D2 4F            [ 4]  706 	ld	c,a
   48D3 21 04 00      [10]  707 	ld	hl,#4
   48D6 39            [11]  708 	add	hl,sp
   48D7 86            [ 7]  709 	add	a, (hl)
   48D8 47            [ 4]  710 	ld	b,a
   48D9 D5            [11]  711 	push	de
   48DA 33            [ 6]  712 	inc	sp
   48DB C5            [11]  713 	push	bc
   48DC 33            [ 6]  714 	inc	sp
   48DD 21 08 00      [10]  715 	ld	hl, #8
   48E0 39            [11]  716 	add	hl, sp
   48E1 4E            [ 7]  717 	ld	c, (hl)
   48E2 23            [ 6]  718 	inc	hl
   48E3 46            [ 7]  719 	ld	b, (hl)
   48E4 C5            [11]  720 	push	bc
   48E5 CD 2C 4A      [17]  721 	call	_getTilePtr
   48E8 F1            [10]  722 	pop	af
   48E9 F1            [10]  723 	pop	af
   48EA 4E            [ 7]  724 	ld	c,(hl)
   48EB 3E 02         [ 7]  725 	ld	a,#0x02
   48ED 91            [ 4]  726 	sub	a, c
   48EE 3E 00         [ 7]  727 	ld	a,#0x00
   48F0 17            [ 4]  728 	rla
   48F1 EE 01         [ 7]  729 	xor	a, #0x01
   48F3 6F            [ 4]  730 	ld	l, a
   48F4 C9            [10]  731 	ret
                            732 ;src/knifestruct.c:99: void moverCuchillo(TKnife* cu, u8* mapa){
                            733 ;	---------------------------------
                            734 ; Function moverCuchillo
                            735 ; ---------------------------------
   48F5                     736 _moverCuchillo::
   48F5 DD E5         [15]  737 	push	ix
   48F7 DD 21 00 00   [14]  738 	ld	ix,#0
   48FB DD 39         [15]  739 	add	ix,sp
   48FD F5            [11]  740 	push	af
                            741 ;src/knifestruct.c:100: if(cu->lanzado){
   48FE DD 4E 04      [19]  742 	ld	c,4 (ix)
   4901 DD 46 05      [19]  743 	ld	b,5 (ix)
   4904 C5            [11]  744 	push	bc
   4905 FD E1         [14]  745 	pop	iy
   4907 FD 7E 06      [19]  746 	ld	a,6 (iy)
   490A B7            [ 4]  747 	or	a, a
   490B CA 27 4A      [10]  748 	jp	Z,00138$
                            749 ;src/knifestruct.c:101: cu->mover = SI;
   490E 21 09 00      [10]  750 	ld	hl,#0x0009
   4911 09            [11]  751 	add	hl,bc
   4912 EB            [ 4]  752 	ex	de,hl
   4913 3E 01         [ 7]  753 	ld	a,#0x01
   4915 12            [ 7]  754 	ld	(de),a
                            755 ;src/knifestruct.c:102: if(cu->direccion == M_derecha){
   4916 C5            [11]  756 	push	bc
   4917 FD E1         [14]  757 	pop	iy
   4919 FD 6E 07      [19]  758 	ld	l,7 (iy)
   491C 7D            [ 4]  759 	ld	a,l
   491D B7            [ 4]  760 	or	a, a
   491E 20 3A         [12]  761 	jr	NZ,00134$
                            762 ;src/knifestruct.c:103: if(checkOffBounds(cu)){
   4920 C5            [11]  763 	push	bc
   4921 D5            [11]  764 	push	de
   4922 C5            [11]  765 	push	bc
   4923 CD 9D 48      [17]  766 	call	_checkOffBounds
   4926 F1            [10]  767 	pop	af
   4927 D1            [10]  768 	pop	de
   4928 C1            [10]  769 	pop	bc
   4929 7D            [ 4]  770 	ld	a,l
   492A B7            [ 4]  771 	or	a, a
   492B 28 05         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:104: cu->mover=NO;
   492D AF            [ 4]  774 	xor	a, a
   492E 12            [ 7]  775 	ld	(de),a
   492F C3 27 4A      [10]  776 	jp	00138$
   4932                     777 00105$:
                            778 ;src/knifestruct.c:106: else if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4932 C5            [11]  779 	push	bc
   4933 D5            [11]  780 	push	de
   4934 DD 6E 06      [19]  781 	ld	l,6 (ix)
   4937 DD 66 07      [19]  782 	ld	h,7 (ix)
   493A E5            [11]  783 	push	hl
   493B 21 05 00      [10]  784 	ld	hl,#0x0005
   493E E5            [11]  785 	push	hl
   493F C5            [11]  786 	push	bc
   4940 CD C2 48      [17]  787 	call	_checkKnifeCollision
   4943 F1            [10]  788 	pop	af
   4944 F1            [10]  789 	pop	af
   4945 F1            [10]  790 	pop	af
   4946 D1            [10]  791 	pop	de
   4947 C1            [10]  792 	pop	bc
   4948 7D            [ 4]  793 	ld	a,l
   4949 B7            [ 4]  794 	or	a, a
   494A 28 09         [12]  795 	jr	Z,00102$
                            796 ;src/knifestruct.c:107: cu->mover = SI;
   494C 3E 01         [ 7]  797 	ld	a,#0x01
   494E 12            [ 7]  798 	ld	(de),a
                            799 ;src/knifestruct.c:108: cu->x++;
   494F 0A            [ 7]  800 	ld	a,(bc)
   4950 3C            [ 4]  801 	inc	a
   4951 02            [ 7]  802 	ld	(bc),a
   4952 C3 27 4A      [10]  803 	jp	00138$
   4955                     804 00102$:
                            805 ;src/knifestruct.c:111: cu->mover=NO;
   4955 AF            [ 4]  806 	xor	a, a
   4956 12            [ 7]  807 	ld	(de),a
   4957 C3 27 4A      [10]  808 	jp	00138$
   495A                     809 00134$:
                            810 ;src/knifestruct.c:114: else if(cu->direccion == M_izquierda){
   495A 7D            [ 4]  811 	ld	a,l
   495B 3D            [ 4]  812 	dec	a
   495C 20 3B         [12]  813 	jr	NZ,00131$
                            814 ;src/knifestruct.c:115: if(checkOffBounds(cu)){
   495E C5            [11]  815 	push	bc
   495F D5            [11]  816 	push	de
   4960 C5            [11]  817 	push	bc
   4961 CD 9D 48      [17]  818 	call	_checkOffBounds
   4964 F1            [10]  819 	pop	af
   4965 D1            [10]  820 	pop	de
   4966 C1            [10]  821 	pop	bc
   4967 7D            [ 4]  822 	ld	a,l
   4968 B7            [ 4]  823 	or	a, a
   4969 28 05         [12]  824 	jr	Z,00111$
                            825 ;src/knifestruct.c:116: cu->mover=NO;
   496B AF            [ 4]  826 	xor	a, a
   496C 12            [ 7]  827 	ld	(de),a
   496D C3 27 4A      [10]  828 	jp	00138$
   4970                     829 00111$:
                            830 ;src/knifestruct.c:118: else if(checkKnifeCollision(cu, -1, 0, mapa)){
   4970 C5            [11]  831 	push	bc
   4971 D5            [11]  832 	push	de
   4972 DD 6E 06      [19]  833 	ld	l,6 (ix)
   4975 DD 66 07      [19]  834 	ld	h,7 (ix)
   4978 E5            [11]  835 	push	hl
   4979 21 FF 00      [10]  836 	ld	hl,#0x00FF
   497C E5            [11]  837 	push	hl
   497D C5            [11]  838 	push	bc
   497E CD C2 48      [17]  839 	call	_checkKnifeCollision
   4981 F1            [10]  840 	pop	af
   4982 F1            [10]  841 	pop	af
   4983 F1            [10]  842 	pop	af
   4984 D1            [10]  843 	pop	de
   4985 C1            [10]  844 	pop	bc
   4986 7D            [ 4]  845 	ld	a,l
   4987 B7            [ 4]  846 	or	a, a
   4988 28 0A         [12]  847 	jr	Z,00108$
                            848 ;src/knifestruct.c:119: cu->mover = SI;
   498A 3E 01         [ 7]  849 	ld	a,#0x01
   498C 12            [ 7]  850 	ld	(de),a
                            851 ;src/knifestruct.c:120: cu->x--;
   498D 0A            [ 7]  852 	ld	a,(bc)
   498E C6 FF         [ 7]  853 	add	a,#0xFF
   4990 02            [ 7]  854 	ld	(bc),a
   4991 C3 27 4A      [10]  855 	jp	00138$
   4994                     856 00108$:
                            857 ;src/knifestruct.c:123: cu->mover=NO;
   4994 AF            [ 4]  858 	xor	a, a
   4995 12            [ 7]  859 	ld	(de),a
   4996 C3 27 4A      [10]  860 	jp	00138$
   4999                     861 00131$:
                            862 ;src/knifestruct.c:132: cu->y--;
   4999 79            [ 4]  863 	ld	a,c
   499A C6 01         [ 7]  864 	add	a, #0x01
   499C DD 77 FE      [19]  865 	ld	-2 (ix),a
   499F 78            [ 4]  866 	ld	a,b
   49A0 CE 00         [ 7]  867 	adc	a, #0x00
   49A2 DD 77 FF      [19]  868 	ld	-1 (ix),a
                            869 ;src/knifestruct.c:126: else if(cu->direccion == M_arriba){
   49A5 7D            [ 4]  870 	ld	a,l
   49A6 D6 02         [ 7]  871 	sub	a, #0x02
   49A8 20 3D         [12]  872 	jr	NZ,00128$
                            873 ;src/knifestruct.c:127: if(checkOffBounds(cu)){
   49AA C5            [11]  874 	push	bc
   49AB D5            [11]  875 	push	de
   49AC C5            [11]  876 	push	bc
   49AD CD 9D 48      [17]  877 	call	_checkOffBounds
   49B0 F1            [10]  878 	pop	af
   49B1 D1            [10]  879 	pop	de
   49B2 C1            [10]  880 	pop	bc
   49B3 7D            [ 4]  881 	ld	a,l
   49B4 B7            [ 4]  882 	or	a, a
   49B5 28 04         [12]  883 	jr	Z,00117$
                            884 ;src/knifestruct.c:128: cu->mover = NO;
   49B7 AF            [ 4]  885 	xor	a, a
   49B8 12            [ 7]  886 	ld	(de),a
   49B9 18 6C         [12]  887 	jr	00138$
   49BB                     888 00117$:
                            889 ;src/knifestruct.c:130: else if(checkKnifeCollision(cu, 0, -2, mapa)){
   49BB D5            [11]  890 	push	de
   49BC DD 6E 06      [19]  891 	ld	l,6 (ix)
   49BF DD 66 07      [19]  892 	ld	h,7 (ix)
   49C2 E5            [11]  893 	push	hl
   49C3 21 00 FE      [10]  894 	ld	hl,#0xFE00
   49C6 E5            [11]  895 	push	hl
   49C7 C5            [11]  896 	push	bc
   49C8 CD C2 48      [17]  897 	call	_checkKnifeCollision
   49CB F1            [10]  898 	pop	af
   49CC F1            [10]  899 	pop	af
   49CD F1            [10]  900 	pop	af
   49CE D1            [10]  901 	pop	de
   49CF 7D            [ 4]  902 	ld	a,l
   49D0 B7            [ 4]  903 	or	a, a
   49D1 28 10         [12]  904 	jr	Z,00114$
                            905 ;src/knifestruct.c:131: cu->mover = SI;
   49D3 3E 01         [ 7]  906 	ld	a,#0x01
   49D5 12            [ 7]  907 	ld	(de),a
                            908 ;src/knifestruct.c:132: cu->y--;
   49D6 E1            [10]  909 	pop	hl
   49D7 E5            [11]  910 	push	hl
   49D8 4E            [ 7]  911 	ld	c,(hl)
   49D9 0D            [ 4]  912 	dec	c
   49DA E1            [10]  913 	pop	hl
   49DB E5            [11]  914 	push	hl
   49DC 71            [ 7]  915 	ld	(hl),c
                            916 ;src/knifestruct.c:133: cu->y--;
   49DD 0D            [ 4]  917 	dec	c
   49DE E1            [10]  918 	pop	hl
   49DF E5            [11]  919 	push	hl
   49E0 71            [ 7]  920 	ld	(hl),c
   49E1 18 44         [12]  921 	jr	00138$
   49E3                     922 00114$:
                            923 ;src/knifestruct.c:136: cu->mover=NO;
   49E3 AF            [ 4]  924 	xor	a, a
   49E4 12            [ 7]  925 	ld	(de),a
   49E5 18 40         [12]  926 	jr	00138$
   49E7                     927 00128$:
                            928 ;src/knifestruct.c:139: else if(cu->direccion == M_abajo){
   49E7 7D            [ 4]  929 	ld	a,l
   49E8 D6 03         [ 7]  930 	sub	a, #0x03
   49EA 20 3B         [12]  931 	jr	NZ,00138$
                            932 ;src/knifestruct.c:140: if(checkOffBounds(cu)){
   49EC C5            [11]  933 	push	bc
   49ED D5            [11]  934 	push	de
   49EE C5            [11]  935 	push	bc
   49EF CD 9D 48      [17]  936 	call	_checkOffBounds
   49F2 F1            [10]  937 	pop	af
   49F3 D1            [10]  938 	pop	de
   49F4 C1            [10]  939 	pop	bc
   49F5 7D            [ 4]  940 	ld	a,l
   49F6 B7            [ 4]  941 	or	a, a
   49F7 28 04         [12]  942 	jr	Z,00123$
                            943 ;src/knifestruct.c:141: cu->mover = NO;
   49F9 AF            [ 4]  944 	xor	a, a
   49FA 12            [ 7]  945 	ld	(de),a
   49FB 18 2A         [12]  946 	jr	00138$
   49FD                     947 00123$:
                            948 ;src/knifestruct.c:143: else if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   49FD D5            [11]  949 	push	de
   49FE DD 6E 06      [19]  950 	ld	l,6 (ix)
   4A01 DD 66 07      [19]  951 	ld	h,7 (ix)
   4A04 E5            [11]  952 	push	hl
   4A05 21 00 0A      [10]  953 	ld	hl,#0x0A00
   4A08 E5            [11]  954 	push	hl
   4A09 C5            [11]  955 	push	bc
   4A0A CD C2 48      [17]  956 	call	_checkKnifeCollision
   4A0D F1            [10]  957 	pop	af
   4A0E F1            [10]  958 	pop	af
   4A0F F1            [10]  959 	pop	af
   4A10 D1            [10]  960 	pop	de
   4A11 7D            [ 4]  961 	ld	a,l
   4A12 B7            [ 4]  962 	or	a, a
   4A13 28 10         [12]  963 	jr	Z,00120$
                            964 ;src/knifestruct.c:144: cu->mover = SI;
   4A15 3E 01         [ 7]  965 	ld	a,#0x01
   4A17 12            [ 7]  966 	ld	(de),a
                            967 ;src/knifestruct.c:145: cu->y++;
   4A18 E1            [10]  968 	pop	hl
   4A19 E5            [11]  969 	push	hl
   4A1A 4E            [ 7]  970 	ld	c,(hl)
   4A1B 0C            [ 4]  971 	inc	c
   4A1C E1            [10]  972 	pop	hl
   4A1D E5            [11]  973 	push	hl
   4A1E 71            [ 7]  974 	ld	(hl),c
                            975 ;src/knifestruct.c:146: cu->y++;
   4A1F 0C            [ 4]  976 	inc	c
   4A20 E1            [10]  977 	pop	hl
   4A21 E5            [11]  978 	push	hl
   4A22 71            [ 7]  979 	ld	(hl),c
   4A23 18 02         [12]  980 	jr	00138$
   4A25                     981 00120$:
                            982 ;src/knifestruct.c:149: cu->mover=NO;
   4A25 AF            [ 4]  983 	xor	a, a
   4A26 12            [ 7]  984 	ld	(de),a
   4A27                     985 00138$:
   4A27 DD F9         [10]  986 	ld	sp, ix
   4A29 DD E1         [14]  987 	pop	ix
   4A2B C9            [10]  988 	ret
                            989 	.area _CODE
                            990 	.area _INITIALIZER
                            991 	.area _CABS (ABS)
