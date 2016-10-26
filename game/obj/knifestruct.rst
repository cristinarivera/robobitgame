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
   462F                      57 _dibujarCuchillo::
   462F DD E5         [15]   58 	push	ix
   4631 DD 21 00 00   [14]   59 	ld	ix,#0
   4635 DD 39         [15]   60 	add	ix,sp
   4637 21 FA FF      [10]   61 	ld	hl,#-6
   463A 39            [11]   62 	add	hl,sp
   463B F9            [ 6]   63 	ld	sp,hl
                             64 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   463C DD 5E 04      [19]   65 	ld	e,4 (ix)
   463F DD 56 05      [19]   66 	ld	d,5 (ix)
   4642 6B            [ 4]   67 	ld	l, e
   4643 62            [ 4]   68 	ld	h, d
   4644 23            [ 6]   69 	inc	hl
   4645 46            [ 7]   70 	ld	b,(hl)
   4646 1A            [ 7]   71 	ld	a,(de)
   4647 D5            [11]   72 	push	de
   4648 C5            [11]   73 	push	bc
   4649 33            [ 6]   74 	inc	sp
   464A F5            [11]   75 	push	af
   464B 33            [ 6]   76 	inc	sp
   464C 21 00 C0      [10]   77 	ld	hl,#0xC000
   464F E5            [11]   78 	push	hl
   4650 CD 6F 60      [17]   79 	call	_cpct_getScreenPtr
   4653 D1            [10]   80 	pop	de
   4654 33            [ 6]   81 	inc	sp
   4655 33            [ 6]   82 	inc	sp
   4656 E5            [11]   83 	push	hl
                             84 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4657 D5            [11]   85 	push	de
   4658 FD E1         [14]   86 	pop	iy
   465A FD 4E 08      [19]   87 	ld	c,8 (iy)
                             88 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   465D DD 7E 06      [19]   89 	ld	a,6 (ix)
   4660 DD 77 FC      [19]   90 	ld	-4 (ix),a
   4663 DD 7E 07      [19]   91 	ld	a,7 (ix)
   4666 DD 77 FD      [19]   92 	ld	-3 (ix),a
   4669 DD 7E FA      [19]   93 	ld	a,-6 (ix)
   466C DD 77 FE      [19]   94 	ld	-2 (ix),a
   466F DD 7E FB      [19]   95 	ld	a,-5 (ix)
   4672 DD 77 FF      [19]   96 	ld	-1 (ix),a
   4675 13            [ 6]   97 	inc	de
   4676 13            [ 6]   98 	inc	de
   4677 13            [ 6]   99 	inc	de
   4678 13            [ 6]  100 	inc	de
                            101 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4679 79            [ 4]  102 	ld	a,c
   467A B7            [ 4]  103 	or	a, a
   467B 20 1A         [12]  104 	jr	NZ,00104$
                            105 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   467D EB            [ 4]  106 	ex	de,hl
   467E 4E            [ 7]  107 	ld	c,(hl)
   467F 23            [ 6]  108 	inc	hl
   4680 46            [ 7]  109 	ld	b,(hl)
   4681 D1            [10]  110 	pop	de
   4682 E1            [10]  111 	pop	hl
   4683 E5            [11]  112 	push	hl
   4684 D5            [11]  113 	push	de
   4685 E5            [11]  114 	push	hl
   4686 21 04 04      [10]  115 	ld	hl,#0x0404
   4689 E5            [11]  116 	push	hl
   468A DD 6E FE      [19]  117 	ld	l,-2 (ix)
   468D DD 66 FF      [19]  118 	ld	h,-1 (ix)
   4690 E5            [11]  119 	push	hl
   4691 C5            [11]  120 	push	bc
   4692 CD 8F 60      [17]  121 	call	_cpct_drawSpriteMaskedAlignedTable
   4695 18 1B         [12]  122 	jr	00106$
   4697                     123 00104$:
                            124 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   4697 0D            [ 4]  125 	dec	c
   4698 20 18         [12]  126 	jr	NZ,00106$
                            127 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   469A EB            [ 4]  128 	ex	de,hl
   469B 4E            [ 7]  129 	ld	c,(hl)
   469C 23            [ 6]  130 	inc	hl
   469D 46            [ 7]  131 	ld	b,(hl)
   469E D1            [10]  132 	pop	de
   469F E1            [10]  133 	pop	hl
   46A0 E5            [11]  134 	push	hl
   46A1 D5            [11]  135 	push	de
   46A2 E5            [11]  136 	push	hl
   46A3 21 02 08      [10]  137 	ld	hl,#0x0802
   46A6 E5            [11]  138 	push	hl
   46A7 DD 6E FE      [19]  139 	ld	l,-2 (ix)
   46AA DD 66 FF      [19]  140 	ld	h,-1 (ix)
   46AD E5            [11]  141 	push	hl
   46AE C5            [11]  142 	push	bc
   46AF CD 8F 60      [17]  143 	call	_cpct_drawSpriteMaskedAlignedTable
   46B2                     144 00106$:
   46B2 DD F9         [10]  145 	ld	sp, ix
   46B4 DD E1         [14]  146 	pop	ix
   46B6 C9            [10]  147 	ret
                            148 ;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            149 ;	---------------------------------
                            150 ; Function borrarCuchillo
                            151 ; ---------------------------------
   46B7                     152 _borrarCuchillo::
   46B7 DD E5         [15]  153 	push	ix
   46B9 DD 21 00 00   [14]  154 	ld	ix,#0
   46BD DD 39         [15]  155 	add	ix,sp
   46BF F5            [11]  156 	push	af
   46C0 F5            [11]  157 	push	af
                            158 ;src/knifestruct.c:20: w = 4 + (x & 1);
   46C1 DD 7E 05      [19]  159 	ld	a,5 (ix)
   46C4 E6 01         [ 7]  160 	and	a, #0x01
   46C6 47            [ 4]  161 	ld	b,a
                            162 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   46C7 DD 7E 06      [19]  163 	ld	a,6 (ix)
   46CA E6 03         [ 7]  164 	and	a, #0x03
   46CC 4F            [ 4]  165 	ld	c,a
                            166 ;src/knifestruct.c:19: if(eje == E_X){
   46CD DD 7E 04      [19]  167 	ld	a,4 (ix)
   46D0 B7            [ 4]  168 	or	a, a
   46D1 20 11         [12]  169 	jr	NZ,00102$
                            170 ;src/knifestruct.c:20: w = 4 + (x & 1);
   46D3 04            [ 4]  171 	inc	b
   46D4 04            [ 4]  172 	inc	b
   46D5 04            [ 4]  173 	inc	b
   46D6 04            [ 4]  174 	inc	b
                            175 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   46D7 79            [ 4]  176 	ld	a,c
   46D8 B7            [ 4]  177 	or	a, a
   46D9 28 04         [12]  178 	jr	Z,00106$
   46DB 0E 01         [ 7]  179 	ld	c,#0x01
   46DD 18 02         [12]  180 	jr	00107$
   46DF                     181 00106$:
   46DF 0E 00         [ 7]  182 	ld	c,#0x00
   46E1                     183 00107$:
   46E1 0C            [ 4]  184 	inc	c
   46E2 18 0E         [12]  185 	jr	00103$
   46E4                     186 00102$:
                            187 ;src/knifestruct.c:23: w = 2 + (x & 1);
   46E4 04            [ 4]  188 	inc	b
   46E5 04            [ 4]  189 	inc	b
                            190 ;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
   46E6 79            [ 4]  191 	ld	a,c
   46E7 B7            [ 4]  192 	or	a, a
   46E8 28 04         [12]  193 	jr	Z,00108$
   46EA 0E 01         [ 7]  194 	ld	c,#0x01
   46EC 18 02         [12]  195 	jr	00109$
   46EE                     196 00108$:
   46EE 0E 00         [ 7]  197 	ld	c,#0x00
   46F0                     198 00109$:
   46F0 0C            [ 4]  199 	inc	c
   46F1 0C            [ 4]  200 	inc	c
   46F2                     201 00103$:
                            202 ;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   46F2 DD 7E 07      [19]  203 	ld	a,7 (ix)
   46F5 DD 77 FE      [19]  204 	ld	-2 (ix),a
   46F8 DD 7E 08      [19]  205 	ld	a,8 (ix)
   46FB DD 77 FF      [19]  206 	ld	-1 (ix),a
   46FE DD 5E 06      [19]  207 	ld	e,6 (ix)
   4701 16 00         [ 7]  208 	ld	d,#0x00
   4703 7B            [ 4]  209 	ld	a,e
   4704 C6 E8         [ 7]  210 	add	a,#0xE8
   4706 DD 77 FC      [19]  211 	ld	-4 (ix),a
   4709 7A            [ 4]  212 	ld	a,d
   470A CE FF         [ 7]  213 	adc	a,#0xFF
   470C DD 77 FD      [19]  214 	ld	-3 (ix),a
   470F E1            [10]  215 	pop	hl
   4710 E5            [11]  216 	push	hl
   4711 DD CB FD 7E   [20]  217 	bit	7, -3 (ix)
   4715 28 04         [12]  218 	jr	Z,00110$
   4717 21 EB FF      [10]  219 	ld	hl,#0xFFEB
   471A 19            [11]  220 	add	hl,de
   471B                     221 00110$:
   471B 5D            [ 4]  222 	ld	e,l
   471C CB 2C         [ 8]  223 	sra	h
   471E CB 1B         [ 8]  224 	rr	e
   4720 CB 2C         [ 8]  225 	sra	h
   4722 CB 1B         [ 8]  226 	rr	e
   4724 DD 56 05      [19]  227 	ld	d,5 (ix)
   4727 CB 3A         [ 8]  228 	srl	d
   4729 DD 6E FE      [19]  229 	ld	l,-2 (ix)
   472C DD 66 FF      [19]  230 	ld	h,-1 (ix)
   472F E5            [11]  231 	push	hl
   4730 21 F0 C0      [10]  232 	ld	hl,#0xC0F0
   4733 E5            [11]  233 	push	hl
   4734 3E 28         [ 7]  234 	ld	a,#0x28
   4736 F5            [11]  235 	push	af
   4737 33            [ 6]  236 	inc	sp
   4738 79            [ 4]  237 	ld	a,c
   4739 F5            [11]  238 	push	af
   473A 33            [ 6]  239 	inc	sp
   473B C5            [11]  240 	push	bc
   473C 33            [ 6]  241 	inc	sp
   473D 7B            [ 4]  242 	ld	a,e
   473E F5            [11]  243 	push	af
   473F 33            [ 6]  244 	inc	sp
   4740 D5            [11]  245 	push	de
   4741 33            [ 6]  246 	inc	sp
   4742 CD 51 55      [17]  247 	call	_cpct_etm_drawTileBox2x4
   4745 DD F9         [10]  248 	ld	sp, ix
   4747 DD E1         [14]  249 	pop	ix
   4749 C9            [10]  250 	ret
                            251 ;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            252 ;	---------------------------------
                            253 ; Function redibujarCuchillo
                            254 ; ---------------------------------
   474A                     255 _redibujarCuchillo::
   474A DD E5         [15]  256 	push	ix
   474C DD 21 00 00   [14]  257 	ld	ix,#0
   4750 DD 39         [15]  258 	add	ix,sp
                            259 ;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
   4752 DD 6E 0B      [19]  260 	ld	l,11 (ix)
   4755 DD 66 0C      [19]  261 	ld	h,12 (ix)
   4758 E5            [11]  262 	push	hl
   4759 DD 66 06      [19]  263 	ld	h,6 (ix)
   475C DD 6E 05      [19]  264 	ld	l,5 (ix)
   475F E5            [11]  265 	push	hl
   4760 DD 7E 04      [19]  266 	ld	a,4 (ix)
   4763 F5            [11]  267 	push	af
   4764 33            [ 6]  268 	inc	sp
   4765 CD B7 46      [17]  269 	call	_borrarCuchillo
   4768 F1            [10]  270 	pop	af
   4769 F1            [10]  271 	pop	af
   476A 33            [ 6]  272 	inc	sp
                            273 ;src/knifestruct.c:33: cu->px = cu->x;
   476B DD 4E 07      [19]  274 	ld	c,7 (ix)
   476E DD 46 08      [19]  275 	ld	b,8 (ix)
   4771 59            [ 4]  276 	ld	e, c
   4772 50            [ 4]  277 	ld	d, b
   4773 13            [ 6]  278 	inc	de
   4774 13            [ 6]  279 	inc	de
   4775 0A            [ 7]  280 	ld	a,(bc)
   4776 12            [ 7]  281 	ld	(de),a
                            282 ;src/knifestruct.c:34: cu->py = cu->y;
   4777 59            [ 4]  283 	ld	e, c
   4778 50            [ 4]  284 	ld	d, b
   4779 13            [ 6]  285 	inc	de
   477A 13            [ 6]  286 	inc	de
   477B 13            [ 6]  287 	inc	de
   477C 69            [ 4]  288 	ld	l, c
   477D 60            [ 4]  289 	ld	h, b
   477E 23            [ 6]  290 	inc	hl
   477F 7E            [ 7]  291 	ld	a,(hl)
   4780 12            [ 7]  292 	ld	(de),a
                            293 ;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
   4781 DD 6E 09      [19]  294 	ld	l,9 (ix)
   4784 DD 66 0A      [19]  295 	ld	h,10 (ix)
   4787 E5            [11]  296 	push	hl
   4788 C5            [11]  297 	push	bc
   4789 CD 2F 46      [17]  298 	call	_dibujarCuchillo
   478C F1            [10]  299 	pop	af
   478D F1            [10]  300 	pop	af
   478E DD E1         [14]  301 	pop	ix
   4790 C9            [10]  302 	ret
                            303 ;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            304 ;	---------------------------------
                            305 ; Function lanzarCuchillo
                            306 ; ---------------------------------
   4791                     307 _lanzarCuchillo::
   4791 DD E5         [15]  308 	push	ix
   4793 DD 21 00 00   [14]  309 	ld	ix,#0
   4797 DD 39         [15]  310 	add	ix,sp
   4799 21 F2 FF      [10]  311 	ld	hl,#-14
   479C 39            [11]  312 	add	hl,sp
   479D F9            [ 6]  313 	ld	sp,hl
                            314 ;src/knifestruct.c:40: if(!cu->lanzado){
   479E DD 4E 04      [19]  315 	ld	c,4 (ix)
   47A1 DD 46 05      [19]  316 	ld	b,5 (ix)
   47A4 21 06 00      [10]  317 	ld	hl,#0x0006
   47A7 09            [11]  318 	add	hl,bc
   47A8 DD 75 FD      [19]  319 	ld	-3 (ix),l
   47AB DD 74 FE      [19]  320 	ld	-2 (ix),h
   47AE DD 6E FD      [19]  321 	ld	l,-3 (ix)
   47B1 DD 66 FE      [19]  322 	ld	h,-2 (ix)
   47B4 7E            [ 7]  323 	ld	a,(hl)
   47B5 B7            [ 4]  324 	or	a, a
   47B6 C2 CD 49      [10]  325 	jp	NZ,00122$
                            326 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   47B9 DD 5E 06      [19]  327 	ld	e,6 (ix)
   47BC DD 56 07      [19]  328 	ld	d,7 (ix)
   47BF 6B            [ 4]  329 	ld	l, e
   47C0 62            [ 4]  330 	ld	h, d
   47C1 C5            [11]  331 	push	bc
   47C2 01 07 00      [10]  332 	ld	bc, #0x0007
   47C5 09            [11]  333 	add	hl, bc
   47C6 C1            [10]  334 	pop	bc
   47C7 6E            [ 7]  335 	ld	l,(hl)
                            336 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   47C8 7B            [ 4]  337 	ld	a,e
   47C9 C6 01         [ 7]  338 	add	a, #0x01
   47CB DD 77 F2      [19]  339 	ld	-14 (ix),a
   47CE 7A            [ 4]  340 	ld	a,d
   47CF CE 00         [ 7]  341 	adc	a, #0x00
   47D1 DD 77 F3      [19]  342 	ld	-13 (ix),a
                            343 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   47D4 79            [ 4]  344 	ld	a,c
   47D5 C6 07         [ 7]  345 	add	a, #0x07
   47D7 DD 77 FA      [19]  346 	ld	-6 (ix),a
   47DA 78            [ 4]  347 	ld	a,b
   47DB CE 00         [ 7]  348 	adc	a, #0x00
   47DD DD 77 FB      [19]  349 	ld	-5 (ix),a
                            350 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   47E0 79            [ 4]  351 	ld	a,c
   47E1 C6 01         [ 7]  352 	add	a, #0x01
   47E3 DD 77 F4      [19]  353 	ld	-12 (ix),a
   47E6 78            [ 4]  354 	ld	a,b
   47E7 CE 00         [ 7]  355 	adc	a, #0x00
   47E9 DD 77 F5      [19]  356 	ld	-11 (ix),a
                            357 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   47EC 79            [ 4]  358 	ld	a,c
   47ED C6 04         [ 7]  359 	add	a, #0x04
   47EF DD 77 F6      [19]  360 	ld	-10 (ix),a
   47F2 78            [ 4]  361 	ld	a,b
   47F3 CE 00         [ 7]  362 	adc	a, #0x00
   47F5 DD 77 F7      [19]  363 	ld	-9 (ix),a
                            364 ;src/knifestruct.c:49: cu->eje = E_X;
   47F8 79            [ 4]  365 	ld	a,c
   47F9 C6 08         [ 7]  366 	add	a, #0x08
   47FB DD 77 F8      [19]  367 	ld	-8 (ix),a
   47FE 78            [ 4]  368 	ld	a,b
   47FF CE 00         [ 7]  369 	adc	a, #0x00
   4801 DD 77 F9      [19]  370 	ld	-7 (ix),a
                            371 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   4804 7D            [ 4]  372 	ld	a,l
   4805 B7            [ 4]  373 	or	a, a
   4806 20 6F         [12]  374 	jr	NZ,00118$
                            375 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4808 E1            [10]  376 	pop	hl
   4809 E5            [11]  377 	push	hl
   480A 7E            [ 7]  378 	ld	a,(hl)
   480B C6 0B         [ 7]  379 	add	a, #0x0B
   480D DD 77 FF      [19]  380 	ld	-1 (ix),a
   4810 1A            [ 7]  381 	ld	a,(de)
   4811 C6 0C         [ 7]  382 	add	a, #0x0C
   4813 DD 77 FC      [19]  383 	ld	-4 (ix),a
   4816 C5            [11]  384 	push	bc
   4817 D5            [11]  385 	push	de
   4818 DD 66 FF      [19]  386 	ld	h,-1 (ix)
   481B DD 6E FC      [19]  387 	ld	l,-4 (ix)
   481E E5            [11]  388 	push	hl
   481F DD 6E 08      [19]  389 	ld	l,8 (ix)
   4822 DD 66 09      [19]  390 	ld	h,9 (ix)
   4825 E5            [11]  391 	push	hl
   4826 CD 61 4B      [17]  392 	call	_getTilePtr
   4829 F1            [10]  393 	pop	af
   482A F1            [10]  394 	pop	af
   482B D1            [10]  395 	pop	de
   482C C1            [10]  396 	pop	bc
   482D 6E            [ 7]  397 	ld	l,(hl)
   482E 3E 02         [ 7]  398 	ld	a,#0x02
   4830 95            [ 4]  399 	sub	a, l
   4831 DA CD 49      [10]  400 	jp	C,00122$
                            401 ;src/knifestruct.c:44: cu->lanzado = SI;
   4834 DD 6E FD      [19]  402 	ld	l,-3 (ix)
   4837 DD 66 FE      [19]  403 	ld	h,-2 (ix)
   483A 36 01         [10]  404 	ld	(hl),#0x01
                            405 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   483C DD 6E FA      [19]  406 	ld	l,-6 (ix)
   483F DD 66 FB      [19]  407 	ld	h,-5 (ix)
   4842 36 00         [10]  408 	ld	(hl),#0x00
                            409 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   4844 1A            [ 7]  410 	ld	a,(de)
   4845 C6 07         [ 7]  411 	add	a, #0x07
   4847 02            [ 7]  412 	ld	(bc),a
                            413 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4848 E1            [10]  414 	pop	hl
   4849 E5            [11]  415 	push	hl
   484A 7E            [ 7]  416 	ld	a,(hl)
   484B C6 0B         [ 7]  417 	add	a, #0x0B
   484D DD 6E F4      [19]  418 	ld	l,-12 (ix)
   4850 DD 66 F5      [19]  419 	ld	h,-11 (ix)
   4853 77            [ 7]  420 	ld	(hl),a
                            421 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4854 DD 6E F6      [19]  422 	ld	l,-10 (ix)
   4857 DD 66 F7      [19]  423 	ld	h,-9 (ix)
   485A 36 C0         [10]  424 	ld	(hl),#<(_g_knifeX_0)
   485C 23            [ 6]  425 	inc	hl
   485D 36 17         [10]  426 	ld	(hl),#>(_g_knifeX_0)
                            427 ;src/knifestruct.c:49: cu->eje = E_X;
   485F DD 6E F8      [19]  428 	ld	l,-8 (ix)
   4862 DD 66 F9      [19]  429 	ld	h,-7 (ix)
   4865 36 00         [10]  430 	ld	(hl),#0x00
                            431 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   4867 DD 6E 0A      [19]  432 	ld	l,10 (ix)
   486A DD 66 0B      [19]  433 	ld	h,11 (ix)
   486D E5            [11]  434 	push	hl
   486E C5            [11]  435 	push	bc
   486F CD 2F 46      [17]  436 	call	_dibujarCuchillo
   4872 F1            [10]  437 	pop	af
   4873 F1            [10]  438 	pop	af
   4874 C3 CD 49      [10]  439 	jp	00122$
   4877                     440 00118$:
                            441 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   4877 7D            [ 4]  442 	ld	a,l
   4878 3D            [ 4]  443 	dec	a
   4879 20 6F         [12]  444 	jr	NZ,00115$
                            445 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   487B E1            [10]  446 	pop	hl
   487C E5            [11]  447 	push	hl
   487D 7E            [ 7]  448 	ld	a,(hl)
   487E C6 0B         [ 7]  449 	add	a, #0x0B
   4880 DD 77 FC      [19]  450 	ld	-4 (ix),a
   4883 1A            [ 7]  451 	ld	a,(de)
   4884 C6 F6         [ 7]  452 	add	a,#0xF6
   4886 DD 77 FF      [19]  453 	ld	-1 (ix),a
   4889 C5            [11]  454 	push	bc
   488A D5            [11]  455 	push	de
   488B DD 66 FC      [19]  456 	ld	h,-4 (ix)
   488E DD 6E FF      [19]  457 	ld	l,-1 (ix)
   4891 E5            [11]  458 	push	hl
   4892 DD 6E 08      [19]  459 	ld	l,8 (ix)
   4895 DD 66 09      [19]  460 	ld	h,9 (ix)
   4898 E5            [11]  461 	push	hl
   4899 CD 61 4B      [17]  462 	call	_getTilePtr
   489C F1            [10]  463 	pop	af
   489D F1            [10]  464 	pop	af
   489E D1            [10]  465 	pop	de
   489F C1            [10]  466 	pop	bc
   48A0 6E            [ 7]  467 	ld	l,(hl)
   48A1 3E 02         [ 7]  468 	ld	a,#0x02
   48A3 95            [ 4]  469 	sub	a, l
   48A4 DA CD 49      [10]  470 	jp	C,00122$
                            471 ;src/knifestruct.c:55: cu->lanzado = SI;
   48A7 DD 6E FD      [19]  472 	ld	l,-3 (ix)
   48AA DD 66 FE      [19]  473 	ld	h,-2 (ix)
   48AD 36 01         [10]  474 	ld	(hl),#0x01
                            475 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   48AF DD 6E FA      [19]  476 	ld	l,-6 (ix)
   48B2 DD 66 FB      [19]  477 	ld	h,-5 (ix)
   48B5 36 01         [10]  478 	ld	(hl),#0x01
                            479 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   48B7 1A            [ 7]  480 	ld	a,(de)
   48B8 C6 FC         [ 7]  481 	add	a,#0xFC
   48BA 02            [ 7]  482 	ld	(bc),a
                            483 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   48BB E1            [10]  484 	pop	hl
   48BC E5            [11]  485 	push	hl
   48BD 7E            [ 7]  486 	ld	a,(hl)
   48BE C6 0B         [ 7]  487 	add	a, #0x0B
   48C0 DD 6E F4      [19]  488 	ld	l,-12 (ix)
   48C3 DD 66 F5      [19]  489 	ld	h,-11 (ix)
   48C6 77            [ 7]  490 	ld	(hl),a
                            491 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   48C7 DD 6E F6      [19]  492 	ld	l,-10 (ix)
   48CA DD 66 F7      [19]  493 	ld	h,-9 (ix)
   48CD 36 D0         [10]  494 	ld	(hl),#<(_g_knifeX_1)
   48CF 23            [ 6]  495 	inc	hl
   48D0 36 17         [10]  496 	ld	(hl),#>(_g_knifeX_1)
                            497 ;src/knifestruct.c:60: cu->eje = E_X;
   48D2 DD 6E F8      [19]  498 	ld	l,-8 (ix)
   48D5 DD 66 F9      [19]  499 	ld	h,-7 (ix)
   48D8 36 00         [10]  500 	ld	(hl),#0x00
                            501 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   48DA DD 6E 0A      [19]  502 	ld	l,10 (ix)
   48DD DD 66 0B      [19]  503 	ld	h,11 (ix)
   48E0 E5            [11]  504 	push	hl
   48E1 C5            [11]  505 	push	bc
   48E2 CD 2F 46      [17]  506 	call	_dibujarCuchillo
   48E5 F1            [10]  507 	pop	af
   48E6 F1            [10]  508 	pop	af
   48E7 C3 CD 49      [10]  509 	jp	00122$
   48EA                     510 00115$:
                            511 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   48EA 7D            [ 4]  512 	ld	a,l
   48EB D6 03         [ 7]  513 	sub	a, #0x03
   48ED 20 6E         [12]  514 	jr	NZ,00112$
                            515 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   48EF E1            [10]  516 	pop	hl
   48F0 E5            [11]  517 	push	hl
   48F1 7E            [ 7]  518 	ld	a,(hl)
   48F2 C6 1F         [ 7]  519 	add	a, #0x1F
   48F4 DD 77 FC      [19]  520 	ld	-4 (ix),a
   48F7 1A            [ 7]  521 	ld	a,(de)
   48F8 C6 03         [ 7]  522 	add	a, #0x03
   48FA DD 77 FF      [19]  523 	ld	-1 (ix),a
   48FD C5            [11]  524 	push	bc
   48FE D5            [11]  525 	push	de
   48FF DD 66 FC      [19]  526 	ld	h,-4 (ix)
   4902 DD 6E FF      [19]  527 	ld	l,-1 (ix)
   4905 E5            [11]  528 	push	hl
   4906 DD 6E 08      [19]  529 	ld	l,8 (ix)
   4909 DD 66 09      [19]  530 	ld	h,9 (ix)
   490C E5            [11]  531 	push	hl
   490D CD 61 4B      [17]  532 	call	_getTilePtr
   4910 F1            [10]  533 	pop	af
   4911 F1            [10]  534 	pop	af
   4912 D1            [10]  535 	pop	de
   4913 C1            [10]  536 	pop	bc
   4914 6E            [ 7]  537 	ld	l,(hl)
   4915 3E 02         [ 7]  538 	ld	a,#0x02
   4917 95            [ 4]  539 	sub	a, l
   4918 DA CD 49      [10]  540 	jp	C,00122$
                            541 ;src/knifestruct.c:67: cu->lanzado = SI;
   491B DD 6E FD      [19]  542 	ld	l,-3 (ix)
   491E DD 66 FE      [19]  543 	ld	h,-2 (ix)
   4921 36 01         [10]  544 	ld	(hl),#0x01
                            545 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   4923 DD 6E FA      [19]  546 	ld	l,-6 (ix)
   4926 DD 66 FB      [19]  547 	ld	h,-5 (ix)
   4929 36 03         [10]  548 	ld	(hl),#0x03
                            549 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   492B 1A            [ 7]  550 	ld	a,(de)
   492C C6 03         [ 7]  551 	add	a, #0x03
   492E 02            [ 7]  552 	ld	(bc),a
                            553 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   492F E1            [10]  554 	pop	hl
   4930 E5            [11]  555 	push	hl
   4931 7E            [ 7]  556 	ld	a,(hl)
   4932 C6 16         [ 7]  557 	add	a, #0x16
   4934 DD 6E F4      [19]  558 	ld	l,-12 (ix)
   4937 DD 66 F5      [19]  559 	ld	h,-11 (ix)
   493A 77            [ 7]  560 	ld	(hl),a
                            561 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   493B DD 6E F6      [19]  562 	ld	l,-10 (ix)
   493E DD 66 F7      [19]  563 	ld	h,-9 (ix)
   4941 36 A0         [10]  564 	ld	(hl),#<(_g_knifeY_0)
   4943 23            [ 6]  565 	inc	hl
   4944 36 17         [10]  566 	ld	(hl),#>(_g_knifeY_0)
                            567 ;src/knifestruct.c:72: cu->eje = E_Y;
   4946 DD 6E F8      [19]  568 	ld	l,-8 (ix)
   4949 DD 66 F9      [19]  569 	ld	h,-7 (ix)
   494C 36 01         [10]  570 	ld	(hl),#0x01
                            571 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   494E DD 6E 0A      [19]  572 	ld	l,10 (ix)
   4951 DD 66 0B      [19]  573 	ld	h,11 (ix)
   4954 E5            [11]  574 	push	hl
   4955 C5            [11]  575 	push	bc
   4956 CD 2F 46      [17]  576 	call	_dibujarCuchillo
   4959 F1            [10]  577 	pop	af
   495A F1            [10]  578 	pop	af
   495B 18 70         [12]  579 	jr	00122$
   495D                     580 00112$:
                            581 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   495D 7D            [ 4]  582 	ld	a,l
   495E D6 02         [ 7]  583 	sub	a, #0x02
   4960 20 6B         [12]  584 	jr	NZ,00122$
                            585 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4962 E1            [10]  586 	pop	hl
   4963 E5            [11]  587 	push	hl
   4964 7E            [ 7]  588 	ld	a,(hl)
   4965 C6 F7         [ 7]  589 	add	a,#0xF7
   4967 DD 77 FC      [19]  590 	ld	-4 (ix),a
   496A 1A            [ 7]  591 	ld	a,(de)
   496B C6 03         [ 7]  592 	add	a, #0x03
   496D DD 77 FF      [19]  593 	ld	-1 (ix),a
   4970 C5            [11]  594 	push	bc
   4971 D5            [11]  595 	push	de
   4972 DD 66 FC      [19]  596 	ld	h,-4 (ix)
   4975 DD 6E FF      [19]  597 	ld	l,-1 (ix)
   4978 E5            [11]  598 	push	hl
   4979 DD 6E 08      [19]  599 	ld	l,8 (ix)
   497C DD 66 09      [19]  600 	ld	h,9 (ix)
   497F E5            [11]  601 	push	hl
   4980 CD 61 4B      [17]  602 	call	_getTilePtr
   4983 F1            [10]  603 	pop	af
   4984 F1            [10]  604 	pop	af
   4985 D1            [10]  605 	pop	de
   4986 C1            [10]  606 	pop	bc
   4987 6E            [ 7]  607 	ld	l,(hl)
   4988 3E 02         [ 7]  608 	ld	a,#0x02
   498A 95            [ 4]  609 	sub	a, l
   498B 38 40         [12]  610 	jr	C,00122$
                            611 ;src/knifestruct.c:78: cu->lanzado = SI;
   498D DD 6E FD      [19]  612 	ld	l,-3 (ix)
   4990 DD 66 FE      [19]  613 	ld	h,-2 (ix)
   4993 36 01         [10]  614 	ld	(hl),#0x01
                            615 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   4995 DD 6E FA      [19]  616 	ld	l,-6 (ix)
   4998 DD 66 FB      [19]  617 	ld	h,-5 (ix)
   499B 36 02         [10]  618 	ld	(hl),#0x02
                            619 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   499D 1A            [ 7]  620 	ld	a,(de)
   499E C6 03         [ 7]  621 	add	a, #0x03
   49A0 02            [ 7]  622 	ld	(bc),a
                            623 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   49A1 E1            [10]  624 	pop	hl
   49A2 E5            [11]  625 	push	hl
   49A3 7E            [ 7]  626 	ld	a,(hl)
   49A4 C6 F8         [ 7]  627 	add	a,#0xF8
   49A6 DD 6E F4      [19]  628 	ld	l,-12 (ix)
   49A9 DD 66 F5      [19]  629 	ld	h,-11 (ix)
   49AC 77            [ 7]  630 	ld	(hl),a
                            631 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   49AD DD 6E F6      [19]  632 	ld	l,-10 (ix)
   49B0 DD 66 F7      [19]  633 	ld	h,-9 (ix)
   49B3 36 B0         [10]  634 	ld	(hl),#<(_g_knifeY_1)
   49B5 23            [ 6]  635 	inc	hl
   49B6 36 17         [10]  636 	ld	(hl),#>(_g_knifeY_1)
                            637 ;src/knifestruct.c:83: cu->eje = E_Y;
   49B8 DD 6E F8      [19]  638 	ld	l,-8 (ix)
   49BB DD 66 F9      [19]  639 	ld	h,-7 (ix)
   49BE 36 01         [10]  640 	ld	(hl),#0x01
                            641 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   49C0 DD 6E 0A      [19]  642 	ld	l,10 (ix)
   49C3 DD 66 0B      [19]  643 	ld	h,11 (ix)
   49C6 E5            [11]  644 	push	hl
   49C7 C5            [11]  645 	push	bc
   49C8 CD 2F 46      [17]  646 	call	_dibujarCuchillo
   49CB F1            [10]  647 	pop	af
   49CC F1            [10]  648 	pop	af
   49CD                     649 00122$:
   49CD DD F9         [10]  650 	ld	sp, ix
   49CF DD E1         [14]  651 	pop	ix
   49D1 C9            [10]  652 	ret
                            653 ;src/knifestruct.c:90: u8 checkOffBounds(TKnife* cu){
                            654 ;	---------------------------------
                            655 ; Function checkOffBounds
                            656 ; ---------------------------------
   49D2                     657 _checkOffBounds::
                            658 ;src/knifestruct.c:91: return (cu->x + G_KNIFEX_0_W  > (80 - 4) || cu->x < (0 + 4));
   49D2 C1            [10]  659 	pop	bc
   49D3 E1            [10]  660 	pop	hl
   49D4 E5            [11]  661 	push	hl
   49D5 C5            [11]  662 	push	bc
   49D6 4E            [ 7]  663 	ld	c,(hl)
   49D7 59            [ 4]  664 	ld	e,c
   49D8 16 00         [ 7]  665 	ld	d,#0x00
   49DA 13            [ 6]  666 	inc	de
   49DB 13            [ 6]  667 	inc	de
   49DC 13            [ 6]  668 	inc	de
   49DD 13            [ 6]  669 	inc	de
   49DE 3E 4C         [ 7]  670 	ld	a,#0x4C
   49E0 BB            [ 4]  671 	cp	a, e
   49E1 3E 00         [ 7]  672 	ld	a,#0x00
   49E3 9A            [ 4]  673 	sbc	a, d
   49E4 E2 E9 49      [10]  674 	jp	PO, 00114$
   49E7 EE 80         [ 7]  675 	xor	a, #0x80
   49E9                     676 00114$:
   49E9 FA F4 49      [10]  677 	jp	M,00104$
   49EC 79            [ 4]  678 	ld	a,c
   49ED D6 04         [ 7]  679 	sub	a, #0x04
   49EF 38 03         [12]  680 	jr	C,00104$
   49F1 2E 00         [ 7]  681 	ld	l,#0x00
   49F3 C9            [10]  682 	ret
   49F4                     683 00104$:
   49F4 2E 01         [ 7]  684 	ld	l,#0x01
   49F6 C9            [10]  685 	ret
                            686 ;src/knifestruct.c:94: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            687 ;	---------------------------------
                            688 ; Function checkKnifeCollision
                            689 ; ---------------------------------
   49F7                     690 _checkKnifeCollision::
                            691 ;src/knifestruct.c:96: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   49F7 D1            [10]  692 	pop	de
   49F8 C1            [10]  693 	pop	bc
   49F9 C5            [11]  694 	push	bc
   49FA D5            [11]  695 	push	de
   49FB 69            [ 4]  696 	ld	l, c
   49FC 60            [ 4]  697 	ld	h, b
   49FD 23            [ 6]  698 	inc	hl
   49FE 5E            [ 7]  699 	ld	e,(hl)
   49FF 7B            [ 4]  700 	ld	a,e
   4A00 21 05 00      [10]  701 	ld	hl,#5
   4A03 39            [11]  702 	add	hl,sp
   4A04 86            [ 7]  703 	add	a, (hl)
   4A05 57            [ 4]  704 	ld	d,a
   4A06 0A            [ 7]  705 	ld	a,(bc)
   4A07 4F            [ 4]  706 	ld	c,a
   4A08 21 04 00      [10]  707 	ld	hl,#4
   4A0B 39            [11]  708 	add	hl,sp
   4A0C 86            [ 7]  709 	add	a, (hl)
   4A0D 47            [ 4]  710 	ld	b,a
   4A0E D5            [11]  711 	push	de
   4A0F 33            [ 6]  712 	inc	sp
   4A10 C5            [11]  713 	push	bc
   4A11 33            [ 6]  714 	inc	sp
   4A12 21 08 00      [10]  715 	ld	hl, #8
   4A15 39            [11]  716 	add	hl, sp
   4A16 4E            [ 7]  717 	ld	c, (hl)
   4A17 23            [ 6]  718 	inc	hl
   4A18 46            [ 7]  719 	ld	b, (hl)
   4A19 C5            [11]  720 	push	bc
   4A1A CD 61 4B      [17]  721 	call	_getTilePtr
   4A1D F1            [10]  722 	pop	af
   4A1E F1            [10]  723 	pop	af
   4A1F 4E            [ 7]  724 	ld	c,(hl)
   4A20 3E 02         [ 7]  725 	ld	a,#0x02
   4A22 91            [ 4]  726 	sub	a, c
   4A23 3E 00         [ 7]  727 	ld	a,#0x00
   4A25 17            [ 4]  728 	rla
   4A26 EE 01         [ 7]  729 	xor	a, #0x01
   4A28 6F            [ 4]  730 	ld	l, a
   4A29 C9            [10]  731 	ret
                            732 ;src/knifestruct.c:99: void moverCuchillo(TKnife* cu, u8* mapa){
                            733 ;	---------------------------------
                            734 ; Function moverCuchillo
                            735 ; ---------------------------------
   4A2A                     736 _moverCuchillo::
   4A2A DD E5         [15]  737 	push	ix
   4A2C DD 21 00 00   [14]  738 	ld	ix,#0
   4A30 DD 39         [15]  739 	add	ix,sp
   4A32 F5            [11]  740 	push	af
                            741 ;src/knifestruct.c:100: if(cu->lanzado){
   4A33 DD 4E 04      [19]  742 	ld	c,4 (ix)
   4A36 DD 46 05      [19]  743 	ld	b,5 (ix)
   4A39 C5            [11]  744 	push	bc
   4A3A FD E1         [14]  745 	pop	iy
   4A3C FD 7E 06      [19]  746 	ld	a,6 (iy)
   4A3F B7            [ 4]  747 	or	a, a
   4A40 CA 5C 4B      [10]  748 	jp	Z,00138$
                            749 ;src/knifestruct.c:101: cu->mover = SI;
   4A43 21 09 00      [10]  750 	ld	hl,#0x0009
   4A46 09            [11]  751 	add	hl,bc
   4A47 EB            [ 4]  752 	ex	de,hl
   4A48 3E 01         [ 7]  753 	ld	a,#0x01
   4A4A 12            [ 7]  754 	ld	(de),a
                            755 ;src/knifestruct.c:102: if(cu->direccion == M_derecha){
   4A4B C5            [11]  756 	push	bc
   4A4C FD E1         [14]  757 	pop	iy
   4A4E FD 6E 07      [19]  758 	ld	l,7 (iy)
   4A51 7D            [ 4]  759 	ld	a,l
   4A52 B7            [ 4]  760 	or	a, a
   4A53 20 3A         [12]  761 	jr	NZ,00134$
                            762 ;src/knifestruct.c:103: if(checkOffBounds(cu)){
   4A55 C5            [11]  763 	push	bc
   4A56 D5            [11]  764 	push	de
   4A57 C5            [11]  765 	push	bc
   4A58 CD D2 49      [17]  766 	call	_checkOffBounds
   4A5B F1            [10]  767 	pop	af
   4A5C D1            [10]  768 	pop	de
   4A5D C1            [10]  769 	pop	bc
   4A5E 7D            [ 4]  770 	ld	a,l
   4A5F B7            [ 4]  771 	or	a, a
   4A60 28 05         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:104: cu->mover=NO;
   4A62 AF            [ 4]  774 	xor	a, a
   4A63 12            [ 7]  775 	ld	(de),a
   4A64 C3 5C 4B      [10]  776 	jp	00138$
   4A67                     777 00105$:
                            778 ;src/knifestruct.c:106: else if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4A67 C5            [11]  779 	push	bc
   4A68 D5            [11]  780 	push	de
   4A69 DD 6E 06      [19]  781 	ld	l,6 (ix)
   4A6C DD 66 07      [19]  782 	ld	h,7 (ix)
   4A6F E5            [11]  783 	push	hl
   4A70 21 05 00      [10]  784 	ld	hl,#0x0005
   4A73 E5            [11]  785 	push	hl
   4A74 C5            [11]  786 	push	bc
   4A75 CD F7 49      [17]  787 	call	_checkKnifeCollision
   4A78 F1            [10]  788 	pop	af
   4A79 F1            [10]  789 	pop	af
   4A7A F1            [10]  790 	pop	af
   4A7B D1            [10]  791 	pop	de
   4A7C C1            [10]  792 	pop	bc
   4A7D 7D            [ 4]  793 	ld	a,l
   4A7E B7            [ 4]  794 	or	a, a
   4A7F 28 09         [12]  795 	jr	Z,00102$
                            796 ;src/knifestruct.c:107: cu->mover = SI;
   4A81 3E 01         [ 7]  797 	ld	a,#0x01
   4A83 12            [ 7]  798 	ld	(de),a
                            799 ;src/knifestruct.c:108: cu->x++;
   4A84 0A            [ 7]  800 	ld	a,(bc)
   4A85 3C            [ 4]  801 	inc	a
   4A86 02            [ 7]  802 	ld	(bc),a
   4A87 C3 5C 4B      [10]  803 	jp	00138$
   4A8A                     804 00102$:
                            805 ;src/knifestruct.c:111: cu->mover=NO;
   4A8A AF            [ 4]  806 	xor	a, a
   4A8B 12            [ 7]  807 	ld	(de),a
   4A8C C3 5C 4B      [10]  808 	jp	00138$
   4A8F                     809 00134$:
                            810 ;src/knifestruct.c:114: else if(cu->direccion == M_izquierda){
   4A8F 7D            [ 4]  811 	ld	a,l
   4A90 3D            [ 4]  812 	dec	a
   4A91 20 3B         [12]  813 	jr	NZ,00131$
                            814 ;src/knifestruct.c:115: if(checkOffBounds(cu)){
   4A93 C5            [11]  815 	push	bc
   4A94 D5            [11]  816 	push	de
   4A95 C5            [11]  817 	push	bc
   4A96 CD D2 49      [17]  818 	call	_checkOffBounds
   4A99 F1            [10]  819 	pop	af
   4A9A D1            [10]  820 	pop	de
   4A9B C1            [10]  821 	pop	bc
   4A9C 7D            [ 4]  822 	ld	a,l
   4A9D B7            [ 4]  823 	or	a, a
   4A9E 28 05         [12]  824 	jr	Z,00111$
                            825 ;src/knifestruct.c:116: cu->mover=NO;
   4AA0 AF            [ 4]  826 	xor	a, a
   4AA1 12            [ 7]  827 	ld	(de),a
   4AA2 C3 5C 4B      [10]  828 	jp	00138$
   4AA5                     829 00111$:
                            830 ;src/knifestruct.c:118: else if(checkKnifeCollision(cu, -1, 0, mapa)){
   4AA5 C5            [11]  831 	push	bc
   4AA6 D5            [11]  832 	push	de
   4AA7 DD 6E 06      [19]  833 	ld	l,6 (ix)
   4AAA DD 66 07      [19]  834 	ld	h,7 (ix)
   4AAD E5            [11]  835 	push	hl
   4AAE 21 FF 00      [10]  836 	ld	hl,#0x00FF
   4AB1 E5            [11]  837 	push	hl
   4AB2 C5            [11]  838 	push	bc
   4AB3 CD F7 49      [17]  839 	call	_checkKnifeCollision
   4AB6 F1            [10]  840 	pop	af
   4AB7 F1            [10]  841 	pop	af
   4AB8 F1            [10]  842 	pop	af
   4AB9 D1            [10]  843 	pop	de
   4ABA C1            [10]  844 	pop	bc
   4ABB 7D            [ 4]  845 	ld	a,l
   4ABC B7            [ 4]  846 	or	a, a
   4ABD 28 0A         [12]  847 	jr	Z,00108$
                            848 ;src/knifestruct.c:119: cu->mover = SI;
   4ABF 3E 01         [ 7]  849 	ld	a,#0x01
   4AC1 12            [ 7]  850 	ld	(de),a
                            851 ;src/knifestruct.c:120: cu->x--;
   4AC2 0A            [ 7]  852 	ld	a,(bc)
   4AC3 C6 FF         [ 7]  853 	add	a,#0xFF
   4AC5 02            [ 7]  854 	ld	(bc),a
   4AC6 C3 5C 4B      [10]  855 	jp	00138$
   4AC9                     856 00108$:
                            857 ;src/knifestruct.c:123: cu->mover=NO;
   4AC9 AF            [ 4]  858 	xor	a, a
   4ACA 12            [ 7]  859 	ld	(de),a
   4ACB C3 5C 4B      [10]  860 	jp	00138$
   4ACE                     861 00131$:
                            862 ;src/knifestruct.c:132: cu->y--;
   4ACE 79            [ 4]  863 	ld	a,c
   4ACF C6 01         [ 7]  864 	add	a, #0x01
   4AD1 DD 77 FE      [19]  865 	ld	-2 (ix),a
   4AD4 78            [ 4]  866 	ld	a,b
   4AD5 CE 00         [ 7]  867 	adc	a, #0x00
   4AD7 DD 77 FF      [19]  868 	ld	-1 (ix),a
                            869 ;src/knifestruct.c:126: else if(cu->direccion == M_arriba){
   4ADA 7D            [ 4]  870 	ld	a,l
   4ADB D6 02         [ 7]  871 	sub	a, #0x02
   4ADD 20 3D         [12]  872 	jr	NZ,00128$
                            873 ;src/knifestruct.c:127: if(checkOffBounds(cu)){
   4ADF C5            [11]  874 	push	bc
   4AE0 D5            [11]  875 	push	de
   4AE1 C5            [11]  876 	push	bc
   4AE2 CD D2 49      [17]  877 	call	_checkOffBounds
   4AE5 F1            [10]  878 	pop	af
   4AE6 D1            [10]  879 	pop	de
   4AE7 C1            [10]  880 	pop	bc
   4AE8 7D            [ 4]  881 	ld	a,l
   4AE9 B7            [ 4]  882 	or	a, a
   4AEA 28 04         [12]  883 	jr	Z,00117$
                            884 ;src/knifestruct.c:128: cu->mover = NO;
   4AEC AF            [ 4]  885 	xor	a, a
   4AED 12            [ 7]  886 	ld	(de),a
   4AEE 18 6C         [12]  887 	jr	00138$
   4AF0                     888 00117$:
                            889 ;src/knifestruct.c:130: else if(checkKnifeCollision(cu, 0, -2, mapa)){
   4AF0 D5            [11]  890 	push	de
   4AF1 DD 6E 06      [19]  891 	ld	l,6 (ix)
   4AF4 DD 66 07      [19]  892 	ld	h,7 (ix)
   4AF7 E5            [11]  893 	push	hl
   4AF8 21 00 FE      [10]  894 	ld	hl,#0xFE00
   4AFB E5            [11]  895 	push	hl
   4AFC C5            [11]  896 	push	bc
   4AFD CD F7 49      [17]  897 	call	_checkKnifeCollision
   4B00 F1            [10]  898 	pop	af
   4B01 F1            [10]  899 	pop	af
   4B02 F1            [10]  900 	pop	af
   4B03 D1            [10]  901 	pop	de
   4B04 7D            [ 4]  902 	ld	a,l
   4B05 B7            [ 4]  903 	or	a, a
   4B06 28 10         [12]  904 	jr	Z,00114$
                            905 ;src/knifestruct.c:131: cu->mover = SI;
   4B08 3E 01         [ 7]  906 	ld	a,#0x01
   4B0A 12            [ 7]  907 	ld	(de),a
                            908 ;src/knifestruct.c:132: cu->y--;
   4B0B E1            [10]  909 	pop	hl
   4B0C E5            [11]  910 	push	hl
   4B0D 4E            [ 7]  911 	ld	c,(hl)
   4B0E 0D            [ 4]  912 	dec	c
   4B0F E1            [10]  913 	pop	hl
   4B10 E5            [11]  914 	push	hl
   4B11 71            [ 7]  915 	ld	(hl),c
                            916 ;src/knifestruct.c:133: cu->y--;
   4B12 0D            [ 4]  917 	dec	c
   4B13 E1            [10]  918 	pop	hl
   4B14 E5            [11]  919 	push	hl
   4B15 71            [ 7]  920 	ld	(hl),c
   4B16 18 44         [12]  921 	jr	00138$
   4B18                     922 00114$:
                            923 ;src/knifestruct.c:136: cu->mover=NO;
   4B18 AF            [ 4]  924 	xor	a, a
   4B19 12            [ 7]  925 	ld	(de),a
   4B1A 18 40         [12]  926 	jr	00138$
   4B1C                     927 00128$:
                            928 ;src/knifestruct.c:139: else if(cu->direccion == M_abajo){
   4B1C 7D            [ 4]  929 	ld	a,l
   4B1D D6 03         [ 7]  930 	sub	a, #0x03
   4B1F 20 3B         [12]  931 	jr	NZ,00138$
                            932 ;src/knifestruct.c:140: if(checkOffBounds(cu)){
   4B21 C5            [11]  933 	push	bc
   4B22 D5            [11]  934 	push	de
   4B23 C5            [11]  935 	push	bc
   4B24 CD D2 49      [17]  936 	call	_checkOffBounds
   4B27 F1            [10]  937 	pop	af
   4B28 D1            [10]  938 	pop	de
   4B29 C1            [10]  939 	pop	bc
   4B2A 7D            [ 4]  940 	ld	a,l
   4B2B B7            [ 4]  941 	or	a, a
   4B2C 28 04         [12]  942 	jr	Z,00123$
                            943 ;src/knifestruct.c:141: cu->mover = NO;
   4B2E AF            [ 4]  944 	xor	a, a
   4B2F 12            [ 7]  945 	ld	(de),a
   4B30 18 2A         [12]  946 	jr	00138$
   4B32                     947 00123$:
                            948 ;src/knifestruct.c:143: else if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   4B32 D5            [11]  949 	push	de
   4B33 DD 6E 06      [19]  950 	ld	l,6 (ix)
   4B36 DD 66 07      [19]  951 	ld	h,7 (ix)
   4B39 E5            [11]  952 	push	hl
   4B3A 21 00 0A      [10]  953 	ld	hl,#0x0A00
   4B3D E5            [11]  954 	push	hl
   4B3E C5            [11]  955 	push	bc
   4B3F CD F7 49      [17]  956 	call	_checkKnifeCollision
   4B42 F1            [10]  957 	pop	af
   4B43 F1            [10]  958 	pop	af
   4B44 F1            [10]  959 	pop	af
   4B45 D1            [10]  960 	pop	de
   4B46 7D            [ 4]  961 	ld	a,l
   4B47 B7            [ 4]  962 	or	a, a
   4B48 28 10         [12]  963 	jr	Z,00120$
                            964 ;src/knifestruct.c:144: cu->mover = SI;
   4B4A 3E 01         [ 7]  965 	ld	a,#0x01
   4B4C 12            [ 7]  966 	ld	(de),a
                            967 ;src/knifestruct.c:145: cu->y++;
   4B4D E1            [10]  968 	pop	hl
   4B4E E5            [11]  969 	push	hl
   4B4F 4E            [ 7]  970 	ld	c,(hl)
   4B50 0C            [ 4]  971 	inc	c
   4B51 E1            [10]  972 	pop	hl
   4B52 E5            [11]  973 	push	hl
   4B53 71            [ 7]  974 	ld	(hl),c
                            975 ;src/knifestruct.c:146: cu->y++;
   4B54 0C            [ 4]  976 	inc	c
   4B55 E1            [10]  977 	pop	hl
   4B56 E5            [11]  978 	push	hl
   4B57 71            [ 7]  979 	ld	(hl),c
   4B58 18 02         [12]  980 	jr	00138$
   4B5A                     981 00120$:
                            982 ;src/knifestruct.c:149: cu->mover=NO;
   4B5A AF            [ 4]  983 	xor	a, a
   4B5B 12            [ 7]  984 	ld	(de),a
   4B5C                     985 00138$:
   4B5C DD F9         [10]  986 	ld	sp, ix
   4B5E DD E1         [14]  987 	pop	ix
   4B60 C9            [10]  988 	ret
                            989 	.area _CODE
                            990 	.area _INITIALIZER
                            991 	.area _CABS (ABS)
