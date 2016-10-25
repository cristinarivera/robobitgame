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
   450B CD 05 5F      [17]   79 	call	_cpct_getScreenPtr
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
   454D CD 25 5F      [17]  121 	call	_cpct_drawSpriteMaskedAlignedTable
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
   456A CD 25 5F      [17]  143 	call	_cpct_drawSpriteMaskedAlignedTable
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
   45B0 DD 77 FE      [19]  204 	ld	-2 (ix),a
   45B3 DD 7E 08      [19]  205 	ld	a,8 (ix)
   45B6 DD 77 FF      [19]  206 	ld	-1 (ix),a
   45B9 DD 5E 06      [19]  207 	ld	e,6 (ix)
   45BC 16 00         [ 7]  208 	ld	d,#0x00
   45BE 7B            [ 4]  209 	ld	a,e
   45BF C6 E8         [ 7]  210 	add	a,#0xE8
   45C1 DD 77 FC      [19]  211 	ld	-4 (ix),a
   45C4 7A            [ 4]  212 	ld	a,d
   45C5 CE FF         [ 7]  213 	adc	a,#0xFF
   45C7 DD 77 FD      [19]  214 	ld	-3 (ix),a
   45CA E1            [10]  215 	pop	hl
   45CB E5            [11]  216 	push	hl
   45CC DD CB FD 7E   [20]  217 	bit	7, -3 (ix)
   45D0 28 04         [12]  218 	jr	Z,00110$
   45D2 21 EB FF      [10]  219 	ld	hl,#0xFFEB
   45D5 19            [11]  220 	add	hl,de
   45D6                     221 00110$:
   45D6 5D            [ 4]  222 	ld	e,l
   45D7 CB 2C         [ 8]  223 	sra	h
   45D9 CB 1B         [ 8]  224 	rr	e
   45DB CB 2C         [ 8]  225 	sra	h
   45DD CB 1B         [ 8]  226 	rr	e
   45DF DD 56 05      [19]  227 	ld	d,5 (ix)
   45E2 CB 3A         [ 8]  228 	srl	d
   45E4 DD 6E FE      [19]  229 	ld	l,-2 (ix)
   45E7 DD 66 FF      [19]  230 	ld	h,-1 (ix)
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
   45FD CD E7 53      [17]  247 	call	_cpct_etm_drawTileBox2x4
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
   4663 DD 75 FD      [19]  319 	ld	-3 (ix),l
   4666 DD 74 FE      [19]  320 	ld	-2 (ix),h
   4669 DD 6E FD      [19]  321 	ld	l,-3 (ix)
   466C DD 66 FE      [19]  322 	ld	h,-2 (ix)
   466F 7E            [ 7]  323 	ld	a,(hl)
   4670 B7            [ 4]  324 	or	a, a
   4671 C2 88 48      [10]  325 	jp	NZ,00122$
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
   4686 DD 77 F2      [19]  339 	ld	-14 (ix),a
   4689 7A            [ 4]  340 	ld	a,d
   468A CE 00         [ 7]  341 	adc	a, #0x00
   468C DD 77 F3      [19]  342 	ld	-13 (ix),a
                            343 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   468F 79            [ 4]  344 	ld	a,c
   4690 C6 07         [ 7]  345 	add	a, #0x07
   4692 DD 77 FA      [19]  346 	ld	-6 (ix),a
   4695 78            [ 4]  347 	ld	a,b
   4696 CE 00         [ 7]  348 	adc	a, #0x00
   4698 DD 77 FB      [19]  349 	ld	-5 (ix),a
                            350 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   469B 79            [ 4]  351 	ld	a,c
   469C C6 01         [ 7]  352 	add	a, #0x01
   469E DD 77 F4      [19]  353 	ld	-12 (ix),a
   46A1 78            [ 4]  354 	ld	a,b
   46A2 CE 00         [ 7]  355 	adc	a, #0x00
   46A4 DD 77 F5      [19]  356 	ld	-11 (ix),a
                            357 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   46A7 79            [ 4]  358 	ld	a,c
   46A8 C6 04         [ 7]  359 	add	a, #0x04
   46AA DD 77 F6      [19]  360 	ld	-10 (ix),a
   46AD 78            [ 4]  361 	ld	a,b
   46AE CE 00         [ 7]  362 	adc	a, #0x00
   46B0 DD 77 F7      [19]  363 	ld	-9 (ix),a
                            364 ;src/knifestruct.c:49: cu->eje = E_X;
   46B3 79            [ 4]  365 	ld	a,c
   46B4 C6 08         [ 7]  366 	add	a, #0x08
   46B6 DD 77 F8      [19]  367 	ld	-8 (ix),a
   46B9 78            [ 4]  368 	ld	a,b
   46BA CE 00         [ 7]  369 	adc	a, #0x00
   46BC DD 77 F9      [19]  370 	ld	-7 (ix),a
                            371 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   46BF 7D            [ 4]  372 	ld	a,l
   46C0 B7            [ 4]  373 	or	a, a
   46C1 20 6F         [12]  374 	jr	NZ,00118$
                            375 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   46C3 E1            [10]  376 	pop	hl
   46C4 E5            [11]  377 	push	hl
   46C5 7E            [ 7]  378 	ld	a,(hl)
   46C6 C6 0B         [ 7]  379 	add	a, #0x0B
   46C8 DD 77 FF      [19]  380 	ld	-1 (ix),a
   46CB 1A            [ 7]  381 	ld	a,(de)
   46CC C6 0C         [ 7]  382 	add	a, #0x0C
   46CE DD 77 FC      [19]  383 	ld	-4 (ix),a
   46D1 C5            [11]  384 	push	bc
   46D2 D5            [11]  385 	push	de
   46D3 DD 66 FF      [19]  386 	ld	h,-1 (ix)
   46D6 DD 6E FC      [19]  387 	ld	l,-4 (ix)
   46D9 E5            [11]  388 	push	hl
   46DA DD 6E 08      [19]  389 	ld	l,8 (ix)
   46DD DD 66 09      [19]  390 	ld	h,9 (ix)
   46E0 E5            [11]  391 	push	hl
   46E1 CD 1C 4A      [17]  392 	call	_getTilePtr
   46E4 F1            [10]  393 	pop	af
   46E5 F1            [10]  394 	pop	af
   46E6 D1            [10]  395 	pop	de
   46E7 C1            [10]  396 	pop	bc
   46E8 6E            [ 7]  397 	ld	l,(hl)
   46E9 3E 02         [ 7]  398 	ld	a,#0x02
   46EB 95            [ 4]  399 	sub	a, l
   46EC DA 88 48      [10]  400 	jp	C,00122$
                            401 ;src/knifestruct.c:44: cu->lanzado = SI;
   46EF DD 6E FD      [19]  402 	ld	l,-3 (ix)
   46F2 DD 66 FE      [19]  403 	ld	h,-2 (ix)
   46F5 36 01         [10]  404 	ld	(hl),#0x01
                            405 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   46F7 DD 6E FA      [19]  406 	ld	l,-6 (ix)
   46FA DD 66 FB      [19]  407 	ld	h,-5 (ix)
   46FD 36 00         [10]  408 	ld	(hl),#0x00
                            409 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   46FF 1A            [ 7]  410 	ld	a,(de)
   4700 C6 07         [ 7]  411 	add	a, #0x07
   4702 02            [ 7]  412 	ld	(bc),a
                            413 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4703 E1            [10]  414 	pop	hl
   4704 E5            [11]  415 	push	hl
   4705 7E            [ 7]  416 	ld	a,(hl)
   4706 C6 0B         [ 7]  417 	add	a, #0x0B
   4708 DD 6E F4      [19]  418 	ld	l,-12 (ix)
   470B DD 66 F5      [19]  419 	ld	h,-11 (ix)
   470E 77            [ 7]  420 	ld	(hl),a
                            421 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   470F DD 6E F6      [19]  422 	ld	l,-10 (ix)
   4712 DD 66 F7      [19]  423 	ld	h,-9 (ix)
   4715 36 C0         [10]  424 	ld	(hl),#<(_g_knifeX_0)
   4717 23            [ 6]  425 	inc	hl
   4718 36 17         [10]  426 	ld	(hl),#>(_g_knifeX_0)
                            427 ;src/knifestruct.c:49: cu->eje = E_X;
   471A DD 6E F8      [19]  428 	ld	l,-8 (ix)
   471D DD 66 F9      [19]  429 	ld	h,-7 (ix)
   4720 36 00         [10]  430 	ld	(hl),#0x00
                            431 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   4722 DD 6E 0A      [19]  432 	ld	l,10 (ix)
   4725 DD 66 0B      [19]  433 	ld	h,11 (ix)
   4728 E5            [11]  434 	push	hl
   4729 C5            [11]  435 	push	bc
   472A CD EA 44      [17]  436 	call	_dibujarCuchillo
   472D F1            [10]  437 	pop	af
   472E F1            [10]  438 	pop	af
   472F C3 88 48      [10]  439 	jp	00122$
   4732                     440 00118$:
                            441 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   4732 7D            [ 4]  442 	ld	a,l
   4733 3D            [ 4]  443 	dec	a
   4734 20 6F         [12]  444 	jr	NZ,00115$
                            445 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   4736 E1            [10]  446 	pop	hl
   4737 E5            [11]  447 	push	hl
   4738 7E            [ 7]  448 	ld	a,(hl)
   4739 C6 0B         [ 7]  449 	add	a, #0x0B
   473B DD 77 FC      [19]  450 	ld	-4 (ix),a
   473E 1A            [ 7]  451 	ld	a,(de)
   473F C6 F6         [ 7]  452 	add	a,#0xF6
   4741 DD 77 FF      [19]  453 	ld	-1 (ix),a
   4744 C5            [11]  454 	push	bc
   4745 D5            [11]  455 	push	de
   4746 DD 66 FC      [19]  456 	ld	h,-4 (ix)
   4749 DD 6E FF      [19]  457 	ld	l,-1 (ix)
   474C E5            [11]  458 	push	hl
   474D DD 6E 08      [19]  459 	ld	l,8 (ix)
   4750 DD 66 09      [19]  460 	ld	h,9 (ix)
   4753 E5            [11]  461 	push	hl
   4754 CD 1C 4A      [17]  462 	call	_getTilePtr
   4757 F1            [10]  463 	pop	af
   4758 F1            [10]  464 	pop	af
   4759 D1            [10]  465 	pop	de
   475A C1            [10]  466 	pop	bc
   475B 6E            [ 7]  467 	ld	l,(hl)
   475C 3E 02         [ 7]  468 	ld	a,#0x02
   475E 95            [ 4]  469 	sub	a, l
   475F DA 88 48      [10]  470 	jp	C,00122$
                            471 ;src/knifestruct.c:55: cu->lanzado = SI;
   4762 DD 6E FD      [19]  472 	ld	l,-3 (ix)
   4765 DD 66 FE      [19]  473 	ld	h,-2 (ix)
   4768 36 01         [10]  474 	ld	(hl),#0x01
                            475 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   476A DD 6E FA      [19]  476 	ld	l,-6 (ix)
   476D DD 66 FB      [19]  477 	ld	h,-5 (ix)
   4770 36 01         [10]  478 	ld	(hl),#0x01
                            479 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   4772 1A            [ 7]  480 	ld	a,(de)
   4773 C6 FC         [ 7]  481 	add	a,#0xFC
   4775 02            [ 7]  482 	ld	(bc),a
                            483 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   4776 E1            [10]  484 	pop	hl
   4777 E5            [11]  485 	push	hl
   4778 7E            [ 7]  486 	ld	a,(hl)
   4779 C6 0B         [ 7]  487 	add	a, #0x0B
   477B DD 6E F4      [19]  488 	ld	l,-12 (ix)
   477E DD 66 F5      [19]  489 	ld	h,-11 (ix)
   4781 77            [ 7]  490 	ld	(hl),a
                            491 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   4782 DD 6E F6      [19]  492 	ld	l,-10 (ix)
   4785 DD 66 F7      [19]  493 	ld	h,-9 (ix)
   4788 36 D0         [10]  494 	ld	(hl),#<(_g_knifeX_1)
   478A 23            [ 6]  495 	inc	hl
   478B 36 17         [10]  496 	ld	(hl),#>(_g_knifeX_1)
                            497 ;src/knifestruct.c:60: cu->eje = E_X;
   478D DD 6E F8      [19]  498 	ld	l,-8 (ix)
   4790 DD 66 F9      [19]  499 	ld	h,-7 (ix)
   4793 36 00         [10]  500 	ld	(hl),#0x00
                            501 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   4795 DD 6E 0A      [19]  502 	ld	l,10 (ix)
   4798 DD 66 0B      [19]  503 	ld	h,11 (ix)
   479B E5            [11]  504 	push	hl
   479C C5            [11]  505 	push	bc
   479D CD EA 44      [17]  506 	call	_dibujarCuchillo
   47A0 F1            [10]  507 	pop	af
   47A1 F1            [10]  508 	pop	af
   47A2 C3 88 48      [10]  509 	jp	00122$
   47A5                     510 00115$:
                            511 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   47A5 7D            [ 4]  512 	ld	a,l
   47A6 D6 03         [ 7]  513 	sub	a, #0x03
   47A8 20 6E         [12]  514 	jr	NZ,00112$
                            515 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   47AA E1            [10]  516 	pop	hl
   47AB E5            [11]  517 	push	hl
   47AC 7E            [ 7]  518 	ld	a,(hl)
   47AD C6 1F         [ 7]  519 	add	a, #0x1F
   47AF DD 77 FC      [19]  520 	ld	-4 (ix),a
   47B2 1A            [ 7]  521 	ld	a,(de)
   47B3 C6 03         [ 7]  522 	add	a, #0x03
   47B5 DD 77 FF      [19]  523 	ld	-1 (ix),a
   47B8 C5            [11]  524 	push	bc
   47B9 D5            [11]  525 	push	de
   47BA DD 66 FC      [19]  526 	ld	h,-4 (ix)
   47BD DD 6E FF      [19]  527 	ld	l,-1 (ix)
   47C0 E5            [11]  528 	push	hl
   47C1 DD 6E 08      [19]  529 	ld	l,8 (ix)
   47C4 DD 66 09      [19]  530 	ld	h,9 (ix)
   47C7 E5            [11]  531 	push	hl
   47C8 CD 1C 4A      [17]  532 	call	_getTilePtr
   47CB F1            [10]  533 	pop	af
   47CC F1            [10]  534 	pop	af
   47CD D1            [10]  535 	pop	de
   47CE C1            [10]  536 	pop	bc
   47CF 6E            [ 7]  537 	ld	l,(hl)
   47D0 3E 02         [ 7]  538 	ld	a,#0x02
   47D2 95            [ 4]  539 	sub	a, l
   47D3 DA 88 48      [10]  540 	jp	C,00122$
                            541 ;src/knifestruct.c:67: cu->lanzado = SI;
   47D6 DD 6E FD      [19]  542 	ld	l,-3 (ix)
   47D9 DD 66 FE      [19]  543 	ld	h,-2 (ix)
   47DC 36 01         [10]  544 	ld	(hl),#0x01
                            545 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   47DE DD 6E FA      [19]  546 	ld	l,-6 (ix)
   47E1 DD 66 FB      [19]  547 	ld	h,-5 (ix)
   47E4 36 03         [10]  548 	ld	(hl),#0x03
                            549 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   47E6 1A            [ 7]  550 	ld	a,(de)
   47E7 C6 03         [ 7]  551 	add	a, #0x03
   47E9 02            [ 7]  552 	ld	(bc),a
                            553 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   47EA E1            [10]  554 	pop	hl
   47EB E5            [11]  555 	push	hl
   47EC 7E            [ 7]  556 	ld	a,(hl)
   47ED C6 16         [ 7]  557 	add	a, #0x16
   47EF DD 6E F4      [19]  558 	ld	l,-12 (ix)
   47F2 DD 66 F5      [19]  559 	ld	h,-11 (ix)
   47F5 77            [ 7]  560 	ld	(hl),a
                            561 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   47F6 DD 6E F6      [19]  562 	ld	l,-10 (ix)
   47F9 DD 66 F7      [19]  563 	ld	h,-9 (ix)
   47FC 36 A0         [10]  564 	ld	(hl),#<(_g_knifeY_0)
   47FE 23            [ 6]  565 	inc	hl
   47FF 36 17         [10]  566 	ld	(hl),#>(_g_knifeY_0)
                            567 ;src/knifestruct.c:72: cu->eje = E_Y;
   4801 DD 6E F8      [19]  568 	ld	l,-8 (ix)
   4804 DD 66 F9      [19]  569 	ld	h,-7 (ix)
   4807 36 01         [10]  570 	ld	(hl),#0x01
                            571 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   4809 DD 6E 0A      [19]  572 	ld	l,10 (ix)
   480C DD 66 0B      [19]  573 	ld	h,11 (ix)
   480F E5            [11]  574 	push	hl
   4810 C5            [11]  575 	push	bc
   4811 CD EA 44      [17]  576 	call	_dibujarCuchillo
   4814 F1            [10]  577 	pop	af
   4815 F1            [10]  578 	pop	af
   4816 18 70         [12]  579 	jr	00122$
   4818                     580 00112$:
                            581 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   4818 7D            [ 4]  582 	ld	a,l
   4819 D6 02         [ 7]  583 	sub	a, #0x02
   481B 20 6B         [12]  584 	jr	NZ,00122$
                            585 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   481D E1            [10]  586 	pop	hl
   481E E5            [11]  587 	push	hl
   481F 7E            [ 7]  588 	ld	a,(hl)
   4820 C6 F7         [ 7]  589 	add	a,#0xF7
   4822 DD 77 FC      [19]  590 	ld	-4 (ix),a
   4825 1A            [ 7]  591 	ld	a,(de)
   4826 C6 03         [ 7]  592 	add	a, #0x03
   4828 DD 77 FF      [19]  593 	ld	-1 (ix),a
   482B C5            [11]  594 	push	bc
   482C D5            [11]  595 	push	de
   482D DD 66 FC      [19]  596 	ld	h,-4 (ix)
   4830 DD 6E FF      [19]  597 	ld	l,-1 (ix)
   4833 E5            [11]  598 	push	hl
   4834 DD 6E 08      [19]  599 	ld	l,8 (ix)
   4837 DD 66 09      [19]  600 	ld	h,9 (ix)
   483A E5            [11]  601 	push	hl
   483B CD 1C 4A      [17]  602 	call	_getTilePtr
   483E F1            [10]  603 	pop	af
   483F F1            [10]  604 	pop	af
   4840 D1            [10]  605 	pop	de
   4841 C1            [10]  606 	pop	bc
   4842 6E            [ 7]  607 	ld	l,(hl)
   4843 3E 02         [ 7]  608 	ld	a,#0x02
   4845 95            [ 4]  609 	sub	a, l
   4846 38 40         [12]  610 	jr	C,00122$
                            611 ;src/knifestruct.c:78: cu->lanzado = SI;
   4848 DD 6E FD      [19]  612 	ld	l,-3 (ix)
   484B DD 66 FE      [19]  613 	ld	h,-2 (ix)
   484E 36 01         [10]  614 	ld	(hl),#0x01
                            615 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   4850 DD 6E FA      [19]  616 	ld	l,-6 (ix)
   4853 DD 66 FB      [19]  617 	ld	h,-5 (ix)
   4856 36 02         [10]  618 	ld	(hl),#0x02
                            619 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   4858 1A            [ 7]  620 	ld	a,(de)
   4859 C6 03         [ 7]  621 	add	a, #0x03
   485B 02            [ 7]  622 	ld	(bc),a
                            623 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   485C E1            [10]  624 	pop	hl
   485D E5            [11]  625 	push	hl
   485E 7E            [ 7]  626 	ld	a,(hl)
   485F C6 F8         [ 7]  627 	add	a,#0xF8
   4861 DD 6E F4      [19]  628 	ld	l,-12 (ix)
   4864 DD 66 F5      [19]  629 	ld	h,-11 (ix)
   4867 77            [ 7]  630 	ld	(hl),a
                            631 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   4868 DD 6E F6      [19]  632 	ld	l,-10 (ix)
   486B DD 66 F7      [19]  633 	ld	h,-9 (ix)
   486E 36 B0         [10]  634 	ld	(hl),#<(_g_knifeY_1)
   4870 23            [ 6]  635 	inc	hl
   4871 36 17         [10]  636 	ld	(hl),#>(_g_knifeY_1)
                            637 ;src/knifestruct.c:83: cu->eje = E_Y;
   4873 DD 6E F8      [19]  638 	ld	l,-8 (ix)
   4876 DD 66 F9      [19]  639 	ld	h,-7 (ix)
   4879 36 01         [10]  640 	ld	(hl),#0x01
                            641 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   487B DD 6E 0A      [19]  642 	ld	l,10 (ix)
   487E DD 66 0B      [19]  643 	ld	h,11 (ix)
   4881 E5            [11]  644 	push	hl
   4882 C5            [11]  645 	push	bc
   4883 CD EA 44      [17]  646 	call	_dibujarCuchillo
   4886 F1            [10]  647 	pop	af
   4887 F1            [10]  648 	pop	af
   4888                     649 00122$:
   4888 DD F9         [10]  650 	ld	sp, ix
   488A DD E1         [14]  651 	pop	ix
   488C C9            [10]  652 	ret
                            653 ;src/knifestruct.c:90: u8 checkOffBounds(TKnife* cu){
                            654 ;	---------------------------------
                            655 ; Function checkOffBounds
                            656 ; ---------------------------------
   488D                     657 _checkOffBounds::
                            658 ;src/knifestruct.c:91: return (cu->x + G_KNIFEX_0_W  > (80 - 4) || cu->x < (0 + 4));
   488D C1            [10]  659 	pop	bc
   488E E1            [10]  660 	pop	hl
   488F E5            [11]  661 	push	hl
   4890 C5            [11]  662 	push	bc
   4891 4E            [ 7]  663 	ld	c,(hl)
   4892 59            [ 4]  664 	ld	e,c
   4893 16 00         [ 7]  665 	ld	d,#0x00
   4895 13            [ 6]  666 	inc	de
   4896 13            [ 6]  667 	inc	de
   4897 13            [ 6]  668 	inc	de
   4898 13            [ 6]  669 	inc	de
   4899 3E 4C         [ 7]  670 	ld	a,#0x4C
   489B BB            [ 4]  671 	cp	a, e
   489C 3E 00         [ 7]  672 	ld	a,#0x00
   489E 9A            [ 4]  673 	sbc	a, d
   489F E2 A4 48      [10]  674 	jp	PO, 00114$
   48A2 EE 80         [ 7]  675 	xor	a, #0x80
   48A4                     676 00114$:
   48A4 FA AF 48      [10]  677 	jp	M,00104$
   48A7 79            [ 4]  678 	ld	a,c
   48A8 D6 04         [ 7]  679 	sub	a, #0x04
   48AA 38 03         [12]  680 	jr	C,00104$
   48AC 2E 00         [ 7]  681 	ld	l,#0x00
   48AE C9            [10]  682 	ret
   48AF                     683 00104$:
   48AF 2E 01         [ 7]  684 	ld	l,#0x01
   48B1 C9            [10]  685 	ret
                            686 ;src/knifestruct.c:94: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            687 ;	---------------------------------
                            688 ; Function checkKnifeCollision
                            689 ; ---------------------------------
   48B2                     690 _checkKnifeCollision::
                            691 ;src/knifestruct.c:96: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   48B2 D1            [10]  692 	pop	de
   48B3 C1            [10]  693 	pop	bc
   48B4 C5            [11]  694 	push	bc
   48B5 D5            [11]  695 	push	de
   48B6 69            [ 4]  696 	ld	l, c
   48B7 60            [ 4]  697 	ld	h, b
   48B8 23            [ 6]  698 	inc	hl
   48B9 5E            [ 7]  699 	ld	e,(hl)
   48BA 7B            [ 4]  700 	ld	a,e
   48BB 21 05 00      [10]  701 	ld	hl,#5
   48BE 39            [11]  702 	add	hl,sp
   48BF 86            [ 7]  703 	add	a, (hl)
   48C0 57            [ 4]  704 	ld	d,a
   48C1 0A            [ 7]  705 	ld	a,(bc)
   48C2 4F            [ 4]  706 	ld	c,a
   48C3 21 04 00      [10]  707 	ld	hl,#4
   48C6 39            [11]  708 	add	hl,sp
   48C7 86            [ 7]  709 	add	a, (hl)
   48C8 47            [ 4]  710 	ld	b,a
   48C9 D5            [11]  711 	push	de
   48CA 33            [ 6]  712 	inc	sp
   48CB C5            [11]  713 	push	bc
   48CC 33            [ 6]  714 	inc	sp
   48CD 21 08 00      [10]  715 	ld	hl, #8
   48D0 39            [11]  716 	add	hl, sp
   48D1 4E            [ 7]  717 	ld	c, (hl)
   48D2 23            [ 6]  718 	inc	hl
   48D3 46            [ 7]  719 	ld	b, (hl)
   48D4 C5            [11]  720 	push	bc
   48D5 CD 1C 4A      [17]  721 	call	_getTilePtr
   48D8 F1            [10]  722 	pop	af
   48D9 F1            [10]  723 	pop	af
   48DA 4E            [ 7]  724 	ld	c,(hl)
   48DB 3E 02         [ 7]  725 	ld	a,#0x02
   48DD 91            [ 4]  726 	sub	a, c
   48DE 3E 00         [ 7]  727 	ld	a,#0x00
   48E0 17            [ 4]  728 	rla
   48E1 EE 01         [ 7]  729 	xor	a, #0x01
   48E3 6F            [ 4]  730 	ld	l, a
   48E4 C9            [10]  731 	ret
                            732 ;src/knifestruct.c:99: void moverCuchillo(TKnife* cu, u8* mapa){
                            733 ;	---------------------------------
                            734 ; Function moverCuchillo
                            735 ; ---------------------------------
   48E5                     736 _moverCuchillo::
   48E5 DD E5         [15]  737 	push	ix
   48E7 DD 21 00 00   [14]  738 	ld	ix,#0
   48EB DD 39         [15]  739 	add	ix,sp
   48ED F5            [11]  740 	push	af
                            741 ;src/knifestruct.c:100: if(cu->lanzado){
   48EE DD 4E 04      [19]  742 	ld	c,4 (ix)
   48F1 DD 46 05      [19]  743 	ld	b,5 (ix)
   48F4 C5            [11]  744 	push	bc
   48F5 FD E1         [14]  745 	pop	iy
   48F7 FD 7E 06      [19]  746 	ld	a,6 (iy)
   48FA B7            [ 4]  747 	or	a, a
   48FB CA 17 4A      [10]  748 	jp	Z,00138$
                            749 ;src/knifestruct.c:101: cu->mover = SI;
   48FE 21 09 00      [10]  750 	ld	hl,#0x0009
   4901 09            [11]  751 	add	hl,bc
   4902 EB            [ 4]  752 	ex	de,hl
   4903 3E 01         [ 7]  753 	ld	a,#0x01
   4905 12            [ 7]  754 	ld	(de),a
                            755 ;src/knifestruct.c:102: if(cu->direccion == M_derecha){
   4906 C5            [11]  756 	push	bc
   4907 FD E1         [14]  757 	pop	iy
   4909 FD 6E 07      [19]  758 	ld	l,7 (iy)
   490C 7D            [ 4]  759 	ld	a,l
   490D B7            [ 4]  760 	or	a, a
   490E 20 3A         [12]  761 	jr	NZ,00134$
                            762 ;src/knifestruct.c:103: if(checkOffBounds(cu)){
   4910 C5            [11]  763 	push	bc
   4911 D5            [11]  764 	push	de
   4912 C5            [11]  765 	push	bc
   4913 CD 8D 48      [17]  766 	call	_checkOffBounds
   4916 F1            [10]  767 	pop	af
   4917 D1            [10]  768 	pop	de
   4918 C1            [10]  769 	pop	bc
   4919 7D            [ 4]  770 	ld	a,l
   491A B7            [ 4]  771 	or	a, a
   491B 28 05         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:104: cu->mover=NO;
   491D AF            [ 4]  774 	xor	a, a
   491E 12            [ 7]  775 	ld	(de),a
   491F C3 17 4A      [10]  776 	jp	00138$
   4922                     777 00105$:
                            778 ;src/knifestruct.c:106: else if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4922 C5            [11]  779 	push	bc
   4923 D5            [11]  780 	push	de
   4924 DD 6E 06      [19]  781 	ld	l,6 (ix)
   4927 DD 66 07      [19]  782 	ld	h,7 (ix)
   492A E5            [11]  783 	push	hl
   492B 21 05 00      [10]  784 	ld	hl,#0x0005
   492E E5            [11]  785 	push	hl
   492F C5            [11]  786 	push	bc
   4930 CD B2 48      [17]  787 	call	_checkKnifeCollision
   4933 F1            [10]  788 	pop	af
   4934 F1            [10]  789 	pop	af
   4935 F1            [10]  790 	pop	af
   4936 D1            [10]  791 	pop	de
   4937 C1            [10]  792 	pop	bc
   4938 7D            [ 4]  793 	ld	a,l
   4939 B7            [ 4]  794 	or	a, a
   493A 28 09         [12]  795 	jr	Z,00102$
                            796 ;src/knifestruct.c:107: cu->mover = SI;
   493C 3E 01         [ 7]  797 	ld	a,#0x01
   493E 12            [ 7]  798 	ld	(de),a
                            799 ;src/knifestruct.c:108: cu->x++;
   493F 0A            [ 7]  800 	ld	a,(bc)
   4940 3C            [ 4]  801 	inc	a
   4941 02            [ 7]  802 	ld	(bc),a
   4942 C3 17 4A      [10]  803 	jp	00138$
   4945                     804 00102$:
                            805 ;src/knifestruct.c:111: cu->mover=NO;
   4945 AF            [ 4]  806 	xor	a, a
   4946 12            [ 7]  807 	ld	(de),a
   4947 C3 17 4A      [10]  808 	jp	00138$
   494A                     809 00134$:
                            810 ;src/knifestruct.c:114: else if(cu->direccion == M_izquierda){
   494A 7D            [ 4]  811 	ld	a,l
   494B 3D            [ 4]  812 	dec	a
   494C 20 3B         [12]  813 	jr	NZ,00131$
                            814 ;src/knifestruct.c:115: if(checkOffBounds(cu)){
   494E C5            [11]  815 	push	bc
   494F D5            [11]  816 	push	de
   4950 C5            [11]  817 	push	bc
   4951 CD 8D 48      [17]  818 	call	_checkOffBounds
   4954 F1            [10]  819 	pop	af
   4955 D1            [10]  820 	pop	de
   4956 C1            [10]  821 	pop	bc
   4957 7D            [ 4]  822 	ld	a,l
   4958 B7            [ 4]  823 	or	a, a
   4959 28 05         [12]  824 	jr	Z,00111$
                            825 ;src/knifestruct.c:116: cu->mover=NO;
   495B AF            [ 4]  826 	xor	a, a
   495C 12            [ 7]  827 	ld	(de),a
   495D C3 17 4A      [10]  828 	jp	00138$
   4960                     829 00111$:
                            830 ;src/knifestruct.c:118: else if(checkKnifeCollision(cu, -1, 0, mapa)){
   4960 C5            [11]  831 	push	bc
   4961 D5            [11]  832 	push	de
   4962 DD 6E 06      [19]  833 	ld	l,6 (ix)
   4965 DD 66 07      [19]  834 	ld	h,7 (ix)
   4968 E5            [11]  835 	push	hl
   4969 21 FF 00      [10]  836 	ld	hl,#0x00FF
   496C E5            [11]  837 	push	hl
   496D C5            [11]  838 	push	bc
   496E CD B2 48      [17]  839 	call	_checkKnifeCollision
   4971 F1            [10]  840 	pop	af
   4972 F1            [10]  841 	pop	af
   4973 F1            [10]  842 	pop	af
   4974 D1            [10]  843 	pop	de
   4975 C1            [10]  844 	pop	bc
   4976 7D            [ 4]  845 	ld	a,l
   4977 B7            [ 4]  846 	or	a, a
   4978 28 0A         [12]  847 	jr	Z,00108$
                            848 ;src/knifestruct.c:119: cu->mover = SI;
   497A 3E 01         [ 7]  849 	ld	a,#0x01
   497C 12            [ 7]  850 	ld	(de),a
                            851 ;src/knifestruct.c:120: cu->x--;
   497D 0A            [ 7]  852 	ld	a,(bc)
   497E C6 FF         [ 7]  853 	add	a,#0xFF
   4980 02            [ 7]  854 	ld	(bc),a
   4981 C3 17 4A      [10]  855 	jp	00138$
   4984                     856 00108$:
                            857 ;src/knifestruct.c:123: cu->mover=NO;
   4984 AF            [ 4]  858 	xor	a, a
   4985 12            [ 7]  859 	ld	(de),a
   4986 C3 17 4A      [10]  860 	jp	00138$
   4989                     861 00131$:
                            862 ;src/knifestruct.c:132: cu->y--;
   4989 79            [ 4]  863 	ld	a,c
   498A C6 01         [ 7]  864 	add	a, #0x01
   498C DD 77 FE      [19]  865 	ld	-2 (ix),a
   498F 78            [ 4]  866 	ld	a,b
   4990 CE 00         [ 7]  867 	adc	a, #0x00
   4992 DD 77 FF      [19]  868 	ld	-1 (ix),a
                            869 ;src/knifestruct.c:126: else if(cu->direccion == M_arriba){
   4995 7D            [ 4]  870 	ld	a,l
   4996 D6 02         [ 7]  871 	sub	a, #0x02
   4998 20 3D         [12]  872 	jr	NZ,00128$
                            873 ;src/knifestruct.c:127: if(checkOffBounds(cu)){
   499A C5            [11]  874 	push	bc
   499B D5            [11]  875 	push	de
   499C C5            [11]  876 	push	bc
   499D CD 8D 48      [17]  877 	call	_checkOffBounds
   49A0 F1            [10]  878 	pop	af
   49A1 D1            [10]  879 	pop	de
   49A2 C1            [10]  880 	pop	bc
   49A3 7D            [ 4]  881 	ld	a,l
   49A4 B7            [ 4]  882 	or	a, a
   49A5 28 04         [12]  883 	jr	Z,00117$
                            884 ;src/knifestruct.c:128: cu->mover = NO;
   49A7 AF            [ 4]  885 	xor	a, a
   49A8 12            [ 7]  886 	ld	(de),a
   49A9 18 6C         [12]  887 	jr	00138$
   49AB                     888 00117$:
                            889 ;src/knifestruct.c:130: else if(checkKnifeCollision(cu, 0, -2, mapa)){
   49AB D5            [11]  890 	push	de
   49AC DD 6E 06      [19]  891 	ld	l,6 (ix)
   49AF DD 66 07      [19]  892 	ld	h,7 (ix)
   49B2 E5            [11]  893 	push	hl
   49B3 21 00 FE      [10]  894 	ld	hl,#0xFE00
   49B6 E5            [11]  895 	push	hl
   49B7 C5            [11]  896 	push	bc
   49B8 CD B2 48      [17]  897 	call	_checkKnifeCollision
   49BB F1            [10]  898 	pop	af
   49BC F1            [10]  899 	pop	af
   49BD F1            [10]  900 	pop	af
   49BE D1            [10]  901 	pop	de
   49BF 7D            [ 4]  902 	ld	a,l
   49C0 B7            [ 4]  903 	or	a, a
   49C1 28 10         [12]  904 	jr	Z,00114$
                            905 ;src/knifestruct.c:131: cu->mover = SI;
   49C3 3E 01         [ 7]  906 	ld	a,#0x01
   49C5 12            [ 7]  907 	ld	(de),a
                            908 ;src/knifestruct.c:132: cu->y--;
   49C6 E1            [10]  909 	pop	hl
   49C7 E5            [11]  910 	push	hl
   49C8 4E            [ 7]  911 	ld	c,(hl)
   49C9 0D            [ 4]  912 	dec	c
   49CA E1            [10]  913 	pop	hl
   49CB E5            [11]  914 	push	hl
   49CC 71            [ 7]  915 	ld	(hl),c
                            916 ;src/knifestruct.c:133: cu->y--;
   49CD 0D            [ 4]  917 	dec	c
   49CE E1            [10]  918 	pop	hl
   49CF E5            [11]  919 	push	hl
   49D0 71            [ 7]  920 	ld	(hl),c
   49D1 18 44         [12]  921 	jr	00138$
   49D3                     922 00114$:
                            923 ;src/knifestruct.c:136: cu->mover=NO;
   49D3 AF            [ 4]  924 	xor	a, a
   49D4 12            [ 7]  925 	ld	(de),a
   49D5 18 40         [12]  926 	jr	00138$
   49D7                     927 00128$:
                            928 ;src/knifestruct.c:139: else if(cu->direccion == M_abajo){
   49D7 7D            [ 4]  929 	ld	a,l
   49D8 D6 03         [ 7]  930 	sub	a, #0x03
   49DA 20 3B         [12]  931 	jr	NZ,00138$
                            932 ;src/knifestruct.c:140: if(checkOffBounds(cu)){
   49DC C5            [11]  933 	push	bc
   49DD D5            [11]  934 	push	de
   49DE C5            [11]  935 	push	bc
   49DF CD 8D 48      [17]  936 	call	_checkOffBounds
   49E2 F1            [10]  937 	pop	af
   49E3 D1            [10]  938 	pop	de
   49E4 C1            [10]  939 	pop	bc
   49E5 7D            [ 4]  940 	ld	a,l
   49E6 B7            [ 4]  941 	or	a, a
   49E7 28 04         [12]  942 	jr	Z,00123$
                            943 ;src/knifestruct.c:141: cu->mover = NO;
   49E9 AF            [ 4]  944 	xor	a, a
   49EA 12            [ 7]  945 	ld	(de),a
   49EB 18 2A         [12]  946 	jr	00138$
   49ED                     947 00123$:
                            948 ;src/knifestruct.c:143: else if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   49ED D5            [11]  949 	push	de
   49EE DD 6E 06      [19]  950 	ld	l,6 (ix)
   49F1 DD 66 07      [19]  951 	ld	h,7 (ix)
   49F4 E5            [11]  952 	push	hl
   49F5 21 00 0A      [10]  953 	ld	hl,#0x0A00
   49F8 E5            [11]  954 	push	hl
   49F9 C5            [11]  955 	push	bc
   49FA CD B2 48      [17]  956 	call	_checkKnifeCollision
   49FD F1            [10]  957 	pop	af
   49FE F1            [10]  958 	pop	af
   49FF F1            [10]  959 	pop	af
   4A00 D1            [10]  960 	pop	de
   4A01 7D            [ 4]  961 	ld	a,l
   4A02 B7            [ 4]  962 	or	a, a
   4A03 28 10         [12]  963 	jr	Z,00120$
                            964 ;src/knifestruct.c:144: cu->mover = SI;
   4A05 3E 01         [ 7]  965 	ld	a,#0x01
   4A07 12            [ 7]  966 	ld	(de),a
                            967 ;src/knifestruct.c:145: cu->y++;
   4A08 E1            [10]  968 	pop	hl
   4A09 E5            [11]  969 	push	hl
   4A0A 4E            [ 7]  970 	ld	c,(hl)
   4A0B 0C            [ 4]  971 	inc	c
   4A0C E1            [10]  972 	pop	hl
   4A0D E5            [11]  973 	push	hl
   4A0E 71            [ 7]  974 	ld	(hl),c
                            975 ;src/knifestruct.c:146: cu->y++;
   4A0F 0C            [ 4]  976 	inc	c
   4A10 E1            [10]  977 	pop	hl
   4A11 E5            [11]  978 	push	hl
   4A12 71            [ 7]  979 	ld	(hl),c
   4A13 18 02         [12]  980 	jr	00138$
   4A15                     981 00120$:
                            982 ;src/knifestruct.c:149: cu->mover=NO;
   4A15 AF            [ 4]  983 	xor	a, a
   4A16 12            [ 7]  984 	ld	(de),a
   4A17                     985 00138$:
   4A17 DD F9         [10]  986 	ld	sp, ix
   4A19 DD E1         [14]  987 	pop	ix
   4A1B C9            [10]  988 	ret
                            989 	.area _CODE
                            990 	.area _INITIALIZER
                            991 	.area _CABS (ABS)
