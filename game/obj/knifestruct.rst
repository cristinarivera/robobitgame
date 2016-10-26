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
   45DA                      57 _dibujarCuchillo::
   45DA DD E5         [15]   58 	push	ix
   45DC DD 21 00 00   [14]   59 	ld	ix,#0
   45E0 DD 39         [15]   60 	add	ix,sp
   45E2 21 FA FF      [10]   61 	ld	hl,#-6
   45E5 39            [11]   62 	add	hl,sp
   45E6 F9            [ 6]   63 	ld	sp,hl
                             64 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   45E7 DD 5E 04      [19]   65 	ld	e,4 (ix)
   45EA DD 56 05      [19]   66 	ld	d,5 (ix)
   45ED 6B            [ 4]   67 	ld	l, e
   45EE 62            [ 4]   68 	ld	h, d
   45EF 23            [ 6]   69 	inc	hl
   45F0 46            [ 7]   70 	ld	b,(hl)
   45F1 1A            [ 7]   71 	ld	a,(de)
   45F2 D5            [11]   72 	push	de
   45F3 C5            [11]   73 	push	bc
   45F4 33            [ 6]   74 	inc	sp
   45F5 F5            [11]   75 	push	af
   45F6 33            [ 6]   76 	inc	sp
   45F7 21 00 C0      [10]   77 	ld	hl,#0xC000
   45FA E5            [11]   78 	push	hl
   45FB CD 05 60      [17]   79 	call	_cpct_getScreenPtr
   45FE D1            [10]   80 	pop	de
   45FF 33            [ 6]   81 	inc	sp
   4600 33            [ 6]   82 	inc	sp
   4601 E5            [11]   83 	push	hl
                             84 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4602 D5            [11]   85 	push	de
   4603 FD E1         [14]   86 	pop	iy
   4605 FD 4E 08      [19]   87 	ld	c,8 (iy)
                             88 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   4608 DD 7E 06      [19]   89 	ld	a,6 (ix)
   460B DD 77 FC      [19]   90 	ld	-4 (ix),a
   460E DD 7E 07      [19]   91 	ld	a,7 (ix)
   4611 DD 77 FD      [19]   92 	ld	-3 (ix),a
   4614 DD 7E FA      [19]   93 	ld	a,-6 (ix)
   4617 DD 77 FE      [19]   94 	ld	-2 (ix),a
   461A DD 7E FB      [19]   95 	ld	a,-5 (ix)
   461D DD 77 FF      [19]   96 	ld	-1 (ix),a
   4620 13            [ 6]   97 	inc	de
   4621 13            [ 6]   98 	inc	de
   4622 13            [ 6]   99 	inc	de
   4623 13            [ 6]  100 	inc	de
                            101 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4624 79            [ 4]  102 	ld	a,c
   4625 B7            [ 4]  103 	or	a, a
   4626 20 1A         [12]  104 	jr	NZ,00104$
                            105 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   4628 EB            [ 4]  106 	ex	de,hl
   4629 4E            [ 7]  107 	ld	c,(hl)
   462A 23            [ 6]  108 	inc	hl
   462B 46            [ 7]  109 	ld	b,(hl)
   462C D1            [10]  110 	pop	de
   462D E1            [10]  111 	pop	hl
   462E E5            [11]  112 	push	hl
   462F D5            [11]  113 	push	de
   4630 E5            [11]  114 	push	hl
   4631 21 04 04      [10]  115 	ld	hl,#0x0404
   4634 E5            [11]  116 	push	hl
   4635 DD 6E FE      [19]  117 	ld	l,-2 (ix)
   4638 DD 66 FF      [19]  118 	ld	h,-1 (ix)
   463B E5            [11]  119 	push	hl
   463C C5            [11]  120 	push	bc
   463D CD 25 60      [17]  121 	call	_cpct_drawSpriteMaskedAlignedTable
   4640 18 1B         [12]  122 	jr	00106$
   4642                     123 00104$:
                            124 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   4642 0D            [ 4]  125 	dec	c
   4643 20 18         [12]  126 	jr	NZ,00106$
                            127 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   4645 EB            [ 4]  128 	ex	de,hl
   4646 4E            [ 7]  129 	ld	c,(hl)
   4647 23            [ 6]  130 	inc	hl
   4648 46            [ 7]  131 	ld	b,(hl)
   4649 D1            [10]  132 	pop	de
   464A E1            [10]  133 	pop	hl
   464B E5            [11]  134 	push	hl
   464C D5            [11]  135 	push	de
   464D E5            [11]  136 	push	hl
   464E 21 02 08      [10]  137 	ld	hl,#0x0802
   4651 E5            [11]  138 	push	hl
   4652 DD 6E FE      [19]  139 	ld	l,-2 (ix)
   4655 DD 66 FF      [19]  140 	ld	h,-1 (ix)
   4658 E5            [11]  141 	push	hl
   4659 C5            [11]  142 	push	bc
   465A CD 25 60      [17]  143 	call	_cpct_drawSpriteMaskedAlignedTable
   465D                     144 00106$:
   465D DD F9         [10]  145 	ld	sp, ix
   465F DD E1         [14]  146 	pop	ix
   4661 C9            [10]  147 	ret
                            148 ;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            149 ;	---------------------------------
                            150 ; Function borrarCuchillo
                            151 ; ---------------------------------
   4662                     152 _borrarCuchillo::
   4662 DD E5         [15]  153 	push	ix
   4664 DD 21 00 00   [14]  154 	ld	ix,#0
   4668 DD 39         [15]  155 	add	ix,sp
   466A F5            [11]  156 	push	af
   466B F5            [11]  157 	push	af
                            158 ;src/knifestruct.c:20: w = 4 + (x & 1);
   466C DD 7E 05      [19]  159 	ld	a,5 (ix)
   466F E6 01         [ 7]  160 	and	a, #0x01
   4671 47            [ 4]  161 	ld	b,a
                            162 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4672 DD 7E 06      [19]  163 	ld	a,6 (ix)
   4675 E6 03         [ 7]  164 	and	a, #0x03
   4677 4F            [ 4]  165 	ld	c,a
                            166 ;src/knifestruct.c:19: if(eje == E_X){
   4678 DD 7E 04      [19]  167 	ld	a,4 (ix)
   467B B7            [ 4]  168 	or	a, a
   467C 20 11         [12]  169 	jr	NZ,00102$
                            170 ;src/knifestruct.c:20: w = 4 + (x & 1);
   467E 04            [ 4]  171 	inc	b
   467F 04            [ 4]  172 	inc	b
   4680 04            [ 4]  173 	inc	b
   4681 04            [ 4]  174 	inc	b
                            175 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4682 79            [ 4]  176 	ld	a,c
   4683 B7            [ 4]  177 	or	a, a
   4684 28 04         [12]  178 	jr	Z,00106$
   4686 0E 01         [ 7]  179 	ld	c,#0x01
   4688 18 02         [12]  180 	jr	00107$
   468A                     181 00106$:
   468A 0E 00         [ 7]  182 	ld	c,#0x00
   468C                     183 00107$:
   468C 0C            [ 4]  184 	inc	c
   468D 18 0E         [12]  185 	jr	00103$
   468F                     186 00102$:
                            187 ;src/knifestruct.c:23: w = 2 + (x & 1);
   468F 04            [ 4]  188 	inc	b
   4690 04            [ 4]  189 	inc	b
                            190 ;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
   4691 79            [ 4]  191 	ld	a,c
   4692 B7            [ 4]  192 	or	a, a
   4693 28 04         [12]  193 	jr	Z,00108$
   4695 0E 01         [ 7]  194 	ld	c,#0x01
   4697 18 02         [12]  195 	jr	00109$
   4699                     196 00108$:
   4699 0E 00         [ 7]  197 	ld	c,#0x00
   469B                     198 00109$:
   469B 0C            [ 4]  199 	inc	c
   469C 0C            [ 4]  200 	inc	c
   469D                     201 00103$:
                            202 ;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   469D DD 7E 07      [19]  203 	ld	a,7 (ix)
   46A0 DD 77 FC      [19]  204 	ld	-4 (ix),a
   46A3 DD 7E 08      [19]  205 	ld	a,8 (ix)
   46A6 DD 77 FD      [19]  206 	ld	-3 (ix),a
   46A9 DD 5E 06      [19]  207 	ld	e,6 (ix)
   46AC 16 00         [ 7]  208 	ld	d,#0x00
   46AE 7B            [ 4]  209 	ld	a,e
   46AF C6 E8         [ 7]  210 	add	a,#0xE8
   46B1 DD 77 FE      [19]  211 	ld	-2 (ix),a
   46B4 7A            [ 4]  212 	ld	a,d
   46B5 CE FF         [ 7]  213 	adc	a,#0xFF
   46B7 DD 77 FF      [19]  214 	ld	-1 (ix),a
   46BA DD 6E FE      [19]  215 	ld	l,-2 (ix)
   46BD DD 66 FF      [19]  216 	ld	h,-1 (ix)
   46C0 DD CB FF 7E   [20]  217 	bit	7, -1 (ix)
   46C4 28 04         [12]  218 	jr	Z,00110$
   46C6 21 EB FF      [10]  219 	ld	hl,#0xFFEB
   46C9 19            [11]  220 	add	hl,de
   46CA                     221 00110$:
   46CA 5D            [ 4]  222 	ld	e,l
   46CB CB 2C         [ 8]  223 	sra	h
   46CD CB 1B         [ 8]  224 	rr	e
   46CF CB 2C         [ 8]  225 	sra	h
   46D1 CB 1B         [ 8]  226 	rr	e
   46D3 DD 56 05      [19]  227 	ld	d,5 (ix)
   46D6 CB 3A         [ 8]  228 	srl	d
   46D8 E1            [10]  229 	pop	hl
   46D9 E5            [11]  230 	push	hl
   46DA E5            [11]  231 	push	hl
   46DB 21 F0 C0      [10]  232 	ld	hl,#0xC0F0
   46DE E5            [11]  233 	push	hl
   46DF 3E 28         [ 7]  234 	ld	a,#0x28
   46E1 F5            [11]  235 	push	af
   46E2 33            [ 6]  236 	inc	sp
   46E3 79            [ 4]  237 	ld	a,c
   46E4 F5            [11]  238 	push	af
   46E5 33            [ 6]  239 	inc	sp
   46E6 C5            [11]  240 	push	bc
   46E7 33            [ 6]  241 	inc	sp
   46E8 7B            [ 4]  242 	ld	a,e
   46E9 F5            [11]  243 	push	af
   46EA 33            [ 6]  244 	inc	sp
   46EB D5            [11]  245 	push	de
   46EC 33            [ 6]  246 	inc	sp
   46ED CD E7 54      [17]  247 	call	_cpct_etm_drawTileBox2x4
   46F0 DD F9         [10]  248 	ld	sp, ix
   46F2 DD E1         [14]  249 	pop	ix
   46F4 C9            [10]  250 	ret
                            251 ;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            252 ;	---------------------------------
                            253 ; Function redibujarCuchillo
                            254 ; ---------------------------------
   46F5                     255 _redibujarCuchillo::
   46F5 DD E5         [15]  256 	push	ix
   46F7 DD 21 00 00   [14]  257 	ld	ix,#0
   46FB DD 39         [15]  258 	add	ix,sp
                            259 ;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
   46FD DD 6E 0B      [19]  260 	ld	l,11 (ix)
   4700 DD 66 0C      [19]  261 	ld	h,12 (ix)
   4703 E5            [11]  262 	push	hl
   4704 DD 66 06      [19]  263 	ld	h,6 (ix)
   4707 DD 6E 05      [19]  264 	ld	l,5 (ix)
   470A E5            [11]  265 	push	hl
   470B DD 7E 04      [19]  266 	ld	a,4 (ix)
   470E F5            [11]  267 	push	af
   470F 33            [ 6]  268 	inc	sp
   4710 CD 62 46      [17]  269 	call	_borrarCuchillo
   4713 F1            [10]  270 	pop	af
   4714 F1            [10]  271 	pop	af
   4715 33            [ 6]  272 	inc	sp
                            273 ;src/knifestruct.c:33: cu->px = cu->x;
   4716 DD 4E 07      [19]  274 	ld	c,7 (ix)
   4719 DD 46 08      [19]  275 	ld	b,8 (ix)
   471C 59            [ 4]  276 	ld	e, c
   471D 50            [ 4]  277 	ld	d, b
   471E 13            [ 6]  278 	inc	de
   471F 13            [ 6]  279 	inc	de
   4720 0A            [ 7]  280 	ld	a,(bc)
   4721 12            [ 7]  281 	ld	(de),a
                            282 ;src/knifestruct.c:34: cu->py = cu->y;
   4722 59            [ 4]  283 	ld	e, c
   4723 50            [ 4]  284 	ld	d, b
   4724 13            [ 6]  285 	inc	de
   4725 13            [ 6]  286 	inc	de
   4726 13            [ 6]  287 	inc	de
   4727 69            [ 4]  288 	ld	l, c
   4728 60            [ 4]  289 	ld	h, b
   4729 23            [ 6]  290 	inc	hl
   472A 7E            [ 7]  291 	ld	a,(hl)
   472B 12            [ 7]  292 	ld	(de),a
                            293 ;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
   472C DD 6E 09      [19]  294 	ld	l,9 (ix)
   472F DD 66 0A      [19]  295 	ld	h,10 (ix)
   4732 E5            [11]  296 	push	hl
   4733 C5            [11]  297 	push	bc
   4734 CD DA 45      [17]  298 	call	_dibujarCuchillo
   4737 F1            [10]  299 	pop	af
   4738 F1            [10]  300 	pop	af
   4739 DD E1         [14]  301 	pop	ix
   473B C9            [10]  302 	ret
                            303 ;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            304 ;	---------------------------------
                            305 ; Function lanzarCuchillo
                            306 ; ---------------------------------
   473C                     307 _lanzarCuchillo::
   473C DD E5         [15]  308 	push	ix
   473E DD 21 00 00   [14]  309 	ld	ix,#0
   4742 DD 39         [15]  310 	add	ix,sp
   4744 21 F2 FF      [10]  311 	ld	hl,#-14
   4747 39            [11]  312 	add	hl,sp
   4748 F9            [ 6]  313 	ld	sp,hl
                            314 ;src/knifestruct.c:40: if(!cu->lanzado){
   4749 DD 4E 04      [19]  315 	ld	c,4 (ix)
   474C DD 46 05      [19]  316 	ld	b,5 (ix)
   474F 21 06 00      [10]  317 	ld	hl,#0x0006
   4752 09            [11]  318 	add	hl,bc
   4753 DD 75 FE      [19]  319 	ld	-2 (ix),l
   4756 DD 74 FF      [19]  320 	ld	-1 (ix),h
   4759 DD 6E FE      [19]  321 	ld	l,-2 (ix)
   475C DD 66 FF      [19]  322 	ld	h,-1 (ix)
   475F 7E            [ 7]  323 	ld	a,(hl)
   4760 B7            [ 4]  324 	or	a, a
   4761 C2 88 49      [10]  325 	jp	NZ,00122$
                            326 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   4764 DD 5E 06      [19]  327 	ld	e,6 (ix)
   4767 DD 56 07      [19]  328 	ld	d,7 (ix)
   476A 6B            [ 4]  329 	ld	l, e
   476B 62            [ 4]  330 	ld	h, d
   476C C5            [11]  331 	push	bc
   476D 01 07 00      [10]  332 	ld	bc, #0x0007
   4770 09            [11]  333 	add	hl, bc
   4771 C1            [10]  334 	pop	bc
   4772 6E            [ 7]  335 	ld	l,(hl)
                            336 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4773 7B            [ 4]  337 	ld	a,e
   4774 C6 01         [ 7]  338 	add	a, #0x01
   4776 DD 77 F8      [19]  339 	ld	-8 (ix),a
   4779 7A            [ 4]  340 	ld	a,d
   477A CE 00         [ 7]  341 	adc	a, #0x00
   477C DD 77 F9      [19]  342 	ld	-7 (ix),a
                            343 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   477F 79            [ 4]  344 	ld	a,c
   4780 C6 07         [ 7]  345 	add	a, #0x07
   4782 DD 77 F6      [19]  346 	ld	-10 (ix),a
   4785 78            [ 4]  347 	ld	a,b
   4786 CE 00         [ 7]  348 	adc	a, #0x00
   4788 DD 77 F7      [19]  349 	ld	-9 (ix),a
                            350 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   478B 79            [ 4]  351 	ld	a,c
   478C C6 01         [ 7]  352 	add	a, #0x01
   478E DD 77 F2      [19]  353 	ld	-14 (ix),a
   4791 78            [ 4]  354 	ld	a,b
   4792 CE 00         [ 7]  355 	adc	a, #0x00
   4794 DD 77 F3      [19]  356 	ld	-13 (ix),a
                            357 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4797 79            [ 4]  358 	ld	a,c
   4798 C6 04         [ 7]  359 	add	a, #0x04
   479A DD 77 FA      [19]  360 	ld	-6 (ix),a
   479D 78            [ 4]  361 	ld	a,b
   479E CE 00         [ 7]  362 	adc	a, #0x00
   47A0 DD 77 FB      [19]  363 	ld	-5 (ix),a
                            364 ;src/knifestruct.c:49: cu->eje = E_X;
   47A3 79            [ 4]  365 	ld	a,c
   47A4 C6 08         [ 7]  366 	add	a, #0x08
   47A6 DD 77 FC      [19]  367 	ld	-4 (ix),a
   47A9 78            [ 4]  368 	ld	a,b
   47AA CE 00         [ 7]  369 	adc	a, #0x00
   47AC DD 77 FD      [19]  370 	ld	-3 (ix),a
                            371 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   47AF 7D            [ 4]  372 	ld	a,l
   47B0 B7            [ 4]  373 	or	a, a
   47B1 20 73         [12]  374 	jr	NZ,00118$
                            375 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   47B3 DD 6E F8      [19]  376 	ld	l,-8 (ix)
   47B6 DD 66 F9      [19]  377 	ld	h,-7 (ix)
   47B9 7E            [ 7]  378 	ld	a,(hl)
   47BA C6 0B         [ 7]  379 	add	a, #0x0B
   47BC DD 77 F4      [19]  380 	ld	-12 (ix),a
   47BF 1A            [ 7]  381 	ld	a,(de)
   47C0 C6 0C         [ 7]  382 	add	a, #0x0C
   47C2 DD 77 F5      [19]  383 	ld	-11 (ix),a
   47C5 C5            [11]  384 	push	bc
   47C6 D5            [11]  385 	push	de
   47C7 DD 66 F4      [19]  386 	ld	h,-12 (ix)
   47CA DD 6E F5      [19]  387 	ld	l,-11 (ix)
   47CD E5            [11]  388 	push	hl
   47CE DD 6E 08      [19]  389 	ld	l,8 (ix)
   47D1 DD 66 09      [19]  390 	ld	h,9 (ix)
   47D4 E5            [11]  391 	push	hl
   47D5 CD 1C 4B      [17]  392 	call	_getTilePtr
   47D8 F1            [10]  393 	pop	af
   47D9 F1            [10]  394 	pop	af
   47DA D1            [10]  395 	pop	de
   47DB C1            [10]  396 	pop	bc
   47DC 6E            [ 7]  397 	ld	l,(hl)
   47DD 3E 02         [ 7]  398 	ld	a,#0x02
   47DF 95            [ 4]  399 	sub	a, l
   47E0 DA 88 49      [10]  400 	jp	C,00122$
                            401 ;src/knifestruct.c:44: cu->lanzado = SI;
   47E3 DD 6E FE      [19]  402 	ld	l,-2 (ix)
   47E6 DD 66 FF      [19]  403 	ld	h,-1 (ix)
   47E9 36 01         [10]  404 	ld	(hl),#0x01
                            405 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   47EB DD 6E F6      [19]  406 	ld	l,-10 (ix)
   47EE DD 66 F7      [19]  407 	ld	h,-9 (ix)
   47F1 36 00         [10]  408 	ld	(hl),#0x00
                            409 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   47F3 1A            [ 7]  410 	ld	a,(de)
   47F4 C6 07         [ 7]  411 	add	a, #0x07
   47F6 02            [ 7]  412 	ld	(bc),a
                            413 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   47F7 DD 6E F8      [19]  414 	ld	l,-8 (ix)
   47FA DD 66 F9      [19]  415 	ld	h,-7 (ix)
   47FD 7E            [ 7]  416 	ld	a,(hl)
   47FE C6 0B         [ 7]  417 	add	a, #0x0B
   4800 E1            [10]  418 	pop	hl
   4801 E5            [11]  419 	push	hl
   4802 77            [ 7]  420 	ld	(hl),a
                            421 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4803 DD 6E FA      [19]  422 	ld	l,-6 (ix)
   4806 DD 66 FB      [19]  423 	ld	h,-5 (ix)
   4809 36 C0         [10]  424 	ld	(hl),#<(_g_knifeX_0)
   480B 23            [ 6]  425 	inc	hl
   480C 36 17         [10]  426 	ld	(hl),#>(_g_knifeX_0)
                            427 ;src/knifestruct.c:49: cu->eje = E_X;
   480E DD 6E FC      [19]  428 	ld	l,-4 (ix)
   4811 DD 66 FD      [19]  429 	ld	h,-3 (ix)
   4814 36 00         [10]  430 	ld	(hl),#0x00
                            431 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   4816 DD 6E 0A      [19]  432 	ld	l,10 (ix)
   4819 DD 66 0B      [19]  433 	ld	h,11 (ix)
   481C E5            [11]  434 	push	hl
   481D C5            [11]  435 	push	bc
   481E CD DA 45      [17]  436 	call	_dibujarCuchillo
   4821 F1            [10]  437 	pop	af
   4822 F1            [10]  438 	pop	af
   4823 C3 88 49      [10]  439 	jp	00122$
   4826                     440 00118$:
                            441 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   4826 7D            [ 4]  442 	ld	a,l
   4827 3D            [ 4]  443 	dec	a
   4828 20 73         [12]  444 	jr	NZ,00115$
                            445 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   482A DD 6E F8      [19]  446 	ld	l,-8 (ix)
   482D DD 66 F9      [19]  447 	ld	h,-7 (ix)
   4830 7E            [ 7]  448 	ld	a,(hl)
   4831 C6 0B         [ 7]  449 	add	a, #0x0B
   4833 DD 77 F5      [19]  450 	ld	-11 (ix),a
   4836 1A            [ 7]  451 	ld	a,(de)
   4837 C6 F6         [ 7]  452 	add	a,#0xF6
   4839 DD 77 F4      [19]  453 	ld	-12 (ix),a
   483C C5            [11]  454 	push	bc
   483D D5            [11]  455 	push	de
   483E DD 66 F5      [19]  456 	ld	h,-11 (ix)
   4841 DD 6E F4      [19]  457 	ld	l,-12 (ix)
   4844 E5            [11]  458 	push	hl
   4845 DD 6E 08      [19]  459 	ld	l,8 (ix)
   4848 DD 66 09      [19]  460 	ld	h,9 (ix)
   484B E5            [11]  461 	push	hl
   484C CD 1C 4B      [17]  462 	call	_getTilePtr
   484F F1            [10]  463 	pop	af
   4850 F1            [10]  464 	pop	af
   4851 D1            [10]  465 	pop	de
   4852 C1            [10]  466 	pop	bc
   4853 6E            [ 7]  467 	ld	l,(hl)
   4854 3E 02         [ 7]  468 	ld	a,#0x02
   4856 95            [ 4]  469 	sub	a, l
   4857 DA 88 49      [10]  470 	jp	C,00122$
                            471 ;src/knifestruct.c:55: cu->lanzado = SI;
   485A DD 6E FE      [19]  472 	ld	l,-2 (ix)
   485D DD 66 FF      [19]  473 	ld	h,-1 (ix)
   4860 36 01         [10]  474 	ld	(hl),#0x01
                            475 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   4862 DD 6E F6      [19]  476 	ld	l,-10 (ix)
   4865 DD 66 F7      [19]  477 	ld	h,-9 (ix)
   4868 36 01         [10]  478 	ld	(hl),#0x01
                            479 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   486A 1A            [ 7]  480 	ld	a,(de)
   486B C6 FC         [ 7]  481 	add	a,#0xFC
   486D 02            [ 7]  482 	ld	(bc),a
                            483 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   486E DD 6E F8      [19]  484 	ld	l,-8 (ix)
   4871 DD 66 F9      [19]  485 	ld	h,-7 (ix)
   4874 7E            [ 7]  486 	ld	a,(hl)
   4875 C6 0B         [ 7]  487 	add	a, #0x0B
   4877 E1            [10]  488 	pop	hl
   4878 E5            [11]  489 	push	hl
   4879 77            [ 7]  490 	ld	(hl),a
                            491 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   487A DD 6E FA      [19]  492 	ld	l,-6 (ix)
   487D DD 66 FB      [19]  493 	ld	h,-5 (ix)
   4880 36 D0         [10]  494 	ld	(hl),#<(_g_knifeX_1)
   4882 23            [ 6]  495 	inc	hl
   4883 36 17         [10]  496 	ld	(hl),#>(_g_knifeX_1)
                            497 ;src/knifestruct.c:60: cu->eje = E_X;
   4885 DD 6E FC      [19]  498 	ld	l,-4 (ix)
   4888 DD 66 FD      [19]  499 	ld	h,-3 (ix)
   488B 36 00         [10]  500 	ld	(hl),#0x00
                            501 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   488D DD 6E 0A      [19]  502 	ld	l,10 (ix)
   4890 DD 66 0B      [19]  503 	ld	h,11 (ix)
   4893 E5            [11]  504 	push	hl
   4894 C5            [11]  505 	push	bc
   4895 CD DA 45      [17]  506 	call	_dibujarCuchillo
   4898 F1            [10]  507 	pop	af
   4899 F1            [10]  508 	pop	af
   489A C3 88 49      [10]  509 	jp	00122$
   489D                     510 00115$:
                            511 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   489D 7D            [ 4]  512 	ld	a,l
   489E D6 03         [ 7]  513 	sub	a, #0x03
   48A0 20 72         [12]  514 	jr	NZ,00112$
                            515 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   48A2 DD 6E F8      [19]  516 	ld	l,-8 (ix)
   48A5 DD 66 F9      [19]  517 	ld	h,-7 (ix)
   48A8 7E            [ 7]  518 	ld	a,(hl)
   48A9 C6 1F         [ 7]  519 	add	a, #0x1F
   48AB DD 77 F5      [19]  520 	ld	-11 (ix),a
   48AE 1A            [ 7]  521 	ld	a,(de)
   48AF C6 03         [ 7]  522 	add	a, #0x03
   48B1 DD 77 F4      [19]  523 	ld	-12 (ix),a
   48B4 C5            [11]  524 	push	bc
   48B5 D5            [11]  525 	push	de
   48B6 DD 66 F5      [19]  526 	ld	h,-11 (ix)
   48B9 DD 6E F4      [19]  527 	ld	l,-12 (ix)
   48BC E5            [11]  528 	push	hl
   48BD DD 6E 08      [19]  529 	ld	l,8 (ix)
   48C0 DD 66 09      [19]  530 	ld	h,9 (ix)
   48C3 E5            [11]  531 	push	hl
   48C4 CD 1C 4B      [17]  532 	call	_getTilePtr
   48C7 F1            [10]  533 	pop	af
   48C8 F1            [10]  534 	pop	af
   48C9 D1            [10]  535 	pop	de
   48CA C1            [10]  536 	pop	bc
   48CB 6E            [ 7]  537 	ld	l,(hl)
   48CC 3E 02         [ 7]  538 	ld	a,#0x02
   48CE 95            [ 4]  539 	sub	a, l
   48CF DA 88 49      [10]  540 	jp	C,00122$
                            541 ;src/knifestruct.c:67: cu->lanzado = SI;
   48D2 DD 6E FE      [19]  542 	ld	l,-2 (ix)
   48D5 DD 66 FF      [19]  543 	ld	h,-1 (ix)
   48D8 36 01         [10]  544 	ld	(hl),#0x01
                            545 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   48DA DD 6E F6      [19]  546 	ld	l,-10 (ix)
   48DD DD 66 F7      [19]  547 	ld	h,-9 (ix)
   48E0 36 03         [10]  548 	ld	(hl),#0x03
                            549 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   48E2 1A            [ 7]  550 	ld	a,(de)
   48E3 C6 03         [ 7]  551 	add	a, #0x03
   48E5 02            [ 7]  552 	ld	(bc),a
                            553 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   48E6 DD 6E F8      [19]  554 	ld	l,-8 (ix)
   48E9 DD 66 F9      [19]  555 	ld	h,-7 (ix)
   48EC 7E            [ 7]  556 	ld	a,(hl)
   48ED C6 16         [ 7]  557 	add	a, #0x16
   48EF E1            [10]  558 	pop	hl
   48F0 E5            [11]  559 	push	hl
   48F1 77            [ 7]  560 	ld	(hl),a
                            561 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   48F2 DD 6E FA      [19]  562 	ld	l,-6 (ix)
   48F5 DD 66 FB      [19]  563 	ld	h,-5 (ix)
   48F8 36 A0         [10]  564 	ld	(hl),#<(_g_knifeY_0)
   48FA 23            [ 6]  565 	inc	hl
   48FB 36 17         [10]  566 	ld	(hl),#>(_g_knifeY_0)
                            567 ;src/knifestruct.c:72: cu->eje = E_Y;
   48FD DD 6E FC      [19]  568 	ld	l,-4 (ix)
   4900 DD 66 FD      [19]  569 	ld	h,-3 (ix)
   4903 36 01         [10]  570 	ld	(hl),#0x01
                            571 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   4905 DD 6E 0A      [19]  572 	ld	l,10 (ix)
   4908 DD 66 0B      [19]  573 	ld	h,11 (ix)
   490B E5            [11]  574 	push	hl
   490C C5            [11]  575 	push	bc
   490D CD DA 45      [17]  576 	call	_dibujarCuchillo
   4910 F1            [10]  577 	pop	af
   4911 F1            [10]  578 	pop	af
   4912 18 74         [12]  579 	jr	00122$
   4914                     580 00112$:
                            581 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   4914 7D            [ 4]  582 	ld	a,l
   4915 D6 02         [ 7]  583 	sub	a, #0x02
   4917 20 6F         [12]  584 	jr	NZ,00122$
                            585 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4919 DD 6E F8      [19]  586 	ld	l,-8 (ix)
   491C DD 66 F9      [19]  587 	ld	h,-7 (ix)
   491F 7E            [ 7]  588 	ld	a,(hl)
   4920 C6 F7         [ 7]  589 	add	a,#0xF7
   4922 DD 77 F5      [19]  590 	ld	-11 (ix),a
   4925 1A            [ 7]  591 	ld	a,(de)
   4926 C6 03         [ 7]  592 	add	a, #0x03
   4928 DD 77 F4      [19]  593 	ld	-12 (ix),a
   492B C5            [11]  594 	push	bc
   492C D5            [11]  595 	push	de
   492D DD 66 F5      [19]  596 	ld	h,-11 (ix)
   4930 DD 6E F4      [19]  597 	ld	l,-12 (ix)
   4933 E5            [11]  598 	push	hl
   4934 DD 6E 08      [19]  599 	ld	l,8 (ix)
   4937 DD 66 09      [19]  600 	ld	h,9 (ix)
   493A E5            [11]  601 	push	hl
   493B CD 1C 4B      [17]  602 	call	_getTilePtr
   493E F1            [10]  603 	pop	af
   493F F1            [10]  604 	pop	af
   4940 D1            [10]  605 	pop	de
   4941 C1            [10]  606 	pop	bc
   4942 6E            [ 7]  607 	ld	l,(hl)
   4943 3E 02         [ 7]  608 	ld	a,#0x02
   4945 95            [ 4]  609 	sub	a, l
   4946 38 40         [12]  610 	jr	C,00122$
                            611 ;src/knifestruct.c:78: cu->lanzado = SI;
   4948 DD 6E FE      [19]  612 	ld	l,-2 (ix)
   494B DD 66 FF      [19]  613 	ld	h,-1 (ix)
   494E 36 01         [10]  614 	ld	(hl),#0x01
                            615 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   4950 DD 6E F6      [19]  616 	ld	l,-10 (ix)
   4953 DD 66 F7      [19]  617 	ld	h,-9 (ix)
   4956 36 02         [10]  618 	ld	(hl),#0x02
                            619 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   4958 1A            [ 7]  620 	ld	a,(de)
   4959 C6 03         [ 7]  621 	add	a, #0x03
   495B 02            [ 7]  622 	ld	(bc),a
                            623 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   495C DD 6E F8      [19]  624 	ld	l,-8 (ix)
   495F DD 66 F9      [19]  625 	ld	h,-7 (ix)
   4962 7E            [ 7]  626 	ld	a,(hl)
   4963 C6 F8         [ 7]  627 	add	a,#0xF8
   4965 E1            [10]  628 	pop	hl
   4966 E5            [11]  629 	push	hl
   4967 77            [ 7]  630 	ld	(hl),a
                            631 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   4968 DD 6E FA      [19]  632 	ld	l,-6 (ix)
   496B DD 66 FB      [19]  633 	ld	h,-5 (ix)
   496E 36 B0         [10]  634 	ld	(hl),#<(_g_knifeY_1)
   4970 23            [ 6]  635 	inc	hl
   4971 36 17         [10]  636 	ld	(hl),#>(_g_knifeY_1)
                            637 ;src/knifestruct.c:83: cu->eje = E_Y;
   4973 DD 6E FC      [19]  638 	ld	l,-4 (ix)
   4976 DD 66 FD      [19]  639 	ld	h,-3 (ix)
   4979 36 01         [10]  640 	ld	(hl),#0x01
                            641 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   497B DD 6E 0A      [19]  642 	ld	l,10 (ix)
   497E DD 66 0B      [19]  643 	ld	h,11 (ix)
   4981 E5            [11]  644 	push	hl
   4982 C5            [11]  645 	push	bc
   4983 CD DA 45      [17]  646 	call	_dibujarCuchillo
   4986 F1            [10]  647 	pop	af
   4987 F1            [10]  648 	pop	af
   4988                     649 00122$:
   4988 DD F9         [10]  650 	ld	sp, ix
   498A DD E1         [14]  651 	pop	ix
   498C C9            [10]  652 	ret
                            653 ;src/knifestruct.c:90: u8 checkOffBounds(TKnife* cu){
                            654 ;	---------------------------------
                            655 ; Function checkOffBounds
                            656 ; ---------------------------------
   498D                     657 _checkOffBounds::
                            658 ;src/knifestruct.c:91: return (cu->x + G_KNIFEX_0_W  > (80 - 4) || cu->x < (0 + 4));
   498D C1            [10]  659 	pop	bc
   498E E1            [10]  660 	pop	hl
   498F E5            [11]  661 	push	hl
   4990 C5            [11]  662 	push	bc
   4991 4E            [ 7]  663 	ld	c,(hl)
   4992 59            [ 4]  664 	ld	e,c
   4993 16 00         [ 7]  665 	ld	d,#0x00
   4995 13            [ 6]  666 	inc	de
   4996 13            [ 6]  667 	inc	de
   4997 13            [ 6]  668 	inc	de
   4998 13            [ 6]  669 	inc	de
   4999 3E 4C         [ 7]  670 	ld	a,#0x4C
   499B BB            [ 4]  671 	cp	a, e
   499C 3E 00         [ 7]  672 	ld	a,#0x00
   499E 9A            [ 4]  673 	sbc	a, d
   499F E2 A4 49      [10]  674 	jp	PO, 00114$
   49A2 EE 80         [ 7]  675 	xor	a, #0x80
   49A4                     676 00114$:
   49A4 FA AF 49      [10]  677 	jp	M,00104$
   49A7 79            [ 4]  678 	ld	a,c
   49A8 D6 04         [ 7]  679 	sub	a, #0x04
   49AA 38 03         [12]  680 	jr	C,00104$
   49AC 2E 00         [ 7]  681 	ld	l,#0x00
   49AE C9            [10]  682 	ret
   49AF                     683 00104$:
   49AF 2E 01         [ 7]  684 	ld	l,#0x01
   49B1 C9            [10]  685 	ret
                            686 ;src/knifestruct.c:94: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            687 ;	---------------------------------
                            688 ; Function checkKnifeCollision
                            689 ; ---------------------------------
   49B2                     690 _checkKnifeCollision::
                            691 ;src/knifestruct.c:96: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   49B2 D1            [10]  692 	pop	de
   49B3 C1            [10]  693 	pop	bc
   49B4 C5            [11]  694 	push	bc
   49B5 D5            [11]  695 	push	de
   49B6 69            [ 4]  696 	ld	l, c
   49B7 60            [ 4]  697 	ld	h, b
   49B8 23            [ 6]  698 	inc	hl
   49B9 5E            [ 7]  699 	ld	e,(hl)
   49BA 7B            [ 4]  700 	ld	a,e
   49BB 21 05 00      [10]  701 	ld	hl,#5
   49BE 39            [11]  702 	add	hl,sp
   49BF 86            [ 7]  703 	add	a, (hl)
   49C0 57            [ 4]  704 	ld	d,a
   49C1 0A            [ 7]  705 	ld	a,(bc)
   49C2 4F            [ 4]  706 	ld	c,a
   49C3 21 04 00      [10]  707 	ld	hl,#4
   49C6 39            [11]  708 	add	hl,sp
   49C7 86            [ 7]  709 	add	a, (hl)
   49C8 47            [ 4]  710 	ld	b,a
   49C9 D5            [11]  711 	push	de
   49CA 33            [ 6]  712 	inc	sp
   49CB C5            [11]  713 	push	bc
   49CC 33            [ 6]  714 	inc	sp
   49CD 21 08 00      [10]  715 	ld	hl, #8
   49D0 39            [11]  716 	add	hl, sp
   49D1 4E            [ 7]  717 	ld	c, (hl)
   49D2 23            [ 6]  718 	inc	hl
   49D3 46            [ 7]  719 	ld	b, (hl)
   49D4 C5            [11]  720 	push	bc
   49D5 CD 1C 4B      [17]  721 	call	_getTilePtr
   49D8 F1            [10]  722 	pop	af
   49D9 F1            [10]  723 	pop	af
   49DA 4E            [ 7]  724 	ld	c,(hl)
   49DB 3E 02         [ 7]  725 	ld	a,#0x02
   49DD 91            [ 4]  726 	sub	a, c
   49DE 3E 00         [ 7]  727 	ld	a,#0x00
   49E0 17            [ 4]  728 	rla
   49E1 EE 01         [ 7]  729 	xor	a, #0x01
   49E3 6F            [ 4]  730 	ld	l, a
   49E4 C9            [10]  731 	ret
                            732 ;src/knifestruct.c:99: void moverCuchillo(TKnife* cu, u8* mapa){
                            733 ;	---------------------------------
                            734 ; Function moverCuchillo
                            735 ; ---------------------------------
   49E5                     736 _moverCuchillo::
   49E5 DD E5         [15]  737 	push	ix
   49E7 DD 21 00 00   [14]  738 	ld	ix,#0
   49EB DD 39         [15]  739 	add	ix,sp
   49ED F5            [11]  740 	push	af
                            741 ;src/knifestruct.c:100: if(cu->lanzado){
   49EE DD 4E 04      [19]  742 	ld	c,4 (ix)
   49F1 DD 46 05      [19]  743 	ld	b,5 (ix)
   49F4 C5            [11]  744 	push	bc
   49F5 FD E1         [14]  745 	pop	iy
   49F7 FD 7E 06      [19]  746 	ld	a,6 (iy)
   49FA B7            [ 4]  747 	or	a, a
   49FB CA 17 4B      [10]  748 	jp	Z,00138$
                            749 ;src/knifestruct.c:101: cu->mover = SI;
   49FE 21 09 00      [10]  750 	ld	hl,#0x0009
   4A01 09            [11]  751 	add	hl,bc
   4A02 EB            [ 4]  752 	ex	de,hl
   4A03 3E 01         [ 7]  753 	ld	a,#0x01
   4A05 12            [ 7]  754 	ld	(de),a
                            755 ;src/knifestruct.c:102: if(cu->direccion == M_derecha){
   4A06 C5            [11]  756 	push	bc
   4A07 FD E1         [14]  757 	pop	iy
   4A09 FD 6E 07      [19]  758 	ld	l,7 (iy)
   4A0C 7D            [ 4]  759 	ld	a,l
   4A0D B7            [ 4]  760 	or	a, a
   4A0E 20 3A         [12]  761 	jr	NZ,00134$
                            762 ;src/knifestruct.c:103: if(checkOffBounds(cu)){
   4A10 C5            [11]  763 	push	bc
   4A11 D5            [11]  764 	push	de
   4A12 C5            [11]  765 	push	bc
   4A13 CD 8D 49      [17]  766 	call	_checkOffBounds
   4A16 F1            [10]  767 	pop	af
   4A17 D1            [10]  768 	pop	de
   4A18 C1            [10]  769 	pop	bc
   4A19 7D            [ 4]  770 	ld	a,l
   4A1A B7            [ 4]  771 	or	a, a
   4A1B 28 05         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:104: cu->mover=NO;
   4A1D AF            [ 4]  774 	xor	a, a
   4A1E 12            [ 7]  775 	ld	(de),a
   4A1F C3 17 4B      [10]  776 	jp	00138$
   4A22                     777 00105$:
                            778 ;src/knifestruct.c:106: else if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4A22 C5            [11]  779 	push	bc
   4A23 D5            [11]  780 	push	de
   4A24 DD 6E 06      [19]  781 	ld	l,6 (ix)
   4A27 DD 66 07      [19]  782 	ld	h,7 (ix)
   4A2A E5            [11]  783 	push	hl
   4A2B 21 05 00      [10]  784 	ld	hl,#0x0005
   4A2E E5            [11]  785 	push	hl
   4A2F C5            [11]  786 	push	bc
   4A30 CD B2 49      [17]  787 	call	_checkKnifeCollision
   4A33 F1            [10]  788 	pop	af
   4A34 F1            [10]  789 	pop	af
   4A35 F1            [10]  790 	pop	af
   4A36 D1            [10]  791 	pop	de
   4A37 C1            [10]  792 	pop	bc
   4A38 7D            [ 4]  793 	ld	a,l
   4A39 B7            [ 4]  794 	or	a, a
   4A3A 28 09         [12]  795 	jr	Z,00102$
                            796 ;src/knifestruct.c:107: cu->mover = SI;
   4A3C 3E 01         [ 7]  797 	ld	a,#0x01
   4A3E 12            [ 7]  798 	ld	(de),a
                            799 ;src/knifestruct.c:108: cu->x++;
   4A3F 0A            [ 7]  800 	ld	a,(bc)
   4A40 3C            [ 4]  801 	inc	a
   4A41 02            [ 7]  802 	ld	(bc),a
   4A42 C3 17 4B      [10]  803 	jp	00138$
   4A45                     804 00102$:
                            805 ;src/knifestruct.c:111: cu->mover=NO;
   4A45 AF            [ 4]  806 	xor	a, a
   4A46 12            [ 7]  807 	ld	(de),a
   4A47 C3 17 4B      [10]  808 	jp	00138$
   4A4A                     809 00134$:
                            810 ;src/knifestruct.c:114: else if(cu->direccion == M_izquierda){
   4A4A 7D            [ 4]  811 	ld	a,l
   4A4B 3D            [ 4]  812 	dec	a
   4A4C 20 3B         [12]  813 	jr	NZ,00131$
                            814 ;src/knifestruct.c:115: if(checkOffBounds(cu)){
   4A4E C5            [11]  815 	push	bc
   4A4F D5            [11]  816 	push	de
   4A50 C5            [11]  817 	push	bc
   4A51 CD 8D 49      [17]  818 	call	_checkOffBounds
   4A54 F1            [10]  819 	pop	af
   4A55 D1            [10]  820 	pop	de
   4A56 C1            [10]  821 	pop	bc
   4A57 7D            [ 4]  822 	ld	a,l
   4A58 B7            [ 4]  823 	or	a, a
   4A59 28 05         [12]  824 	jr	Z,00111$
                            825 ;src/knifestruct.c:116: cu->mover=NO;
   4A5B AF            [ 4]  826 	xor	a, a
   4A5C 12            [ 7]  827 	ld	(de),a
   4A5D C3 17 4B      [10]  828 	jp	00138$
   4A60                     829 00111$:
                            830 ;src/knifestruct.c:118: else if(checkKnifeCollision(cu, -1, 0, mapa)){
   4A60 C5            [11]  831 	push	bc
   4A61 D5            [11]  832 	push	de
   4A62 DD 6E 06      [19]  833 	ld	l,6 (ix)
   4A65 DD 66 07      [19]  834 	ld	h,7 (ix)
   4A68 E5            [11]  835 	push	hl
   4A69 21 FF 00      [10]  836 	ld	hl,#0x00FF
   4A6C E5            [11]  837 	push	hl
   4A6D C5            [11]  838 	push	bc
   4A6E CD B2 49      [17]  839 	call	_checkKnifeCollision
   4A71 F1            [10]  840 	pop	af
   4A72 F1            [10]  841 	pop	af
   4A73 F1            [10]  842 	pop	af
   4A74 D1            [10]  843 	pop	de
   4A75 C1            [10]  844 	pop	bc
   4A76 7D            [ 4]  845 	ld	a,l
   4A77 B7            [ 4]  846 	or	a, a
   4A78 28 0A         [12]  847 	jr	Z,00108$
                            848 ;src/knifestruct.c:119: cu->mover = SI;
   4A7A 3E 01         [ 7]  849 	ld	a,#0x01
   4A7C 12            [ 7]  850 	ld	(de),a
                            851 ;src/knifestruct.c:120: cu->x--;
   4A7D 0A            [ 7]  852 	ld	a,(bc)
   4A7E C6 FF         [ 7]  853 	add	a,#0xFF
   4A80 02            [ 7]  854 	ld	(bc),a
   4A81 C3 17 4B      [10]  855 	jp	00138$
   4A84                     856 00108$:
                            857 ;src/knifestruct.c:123: cu->mover=NO;
   4A84 AF            [ 4]  858 	xor	a, a
   4A85 12            [ 7]  859 	ld	(de),a
   4A86 C3 17 4B      [10]  860 	jp	00138$
   4A89                     861 00131$:
                            862 ;src/knifestruct.c:132: cu->y--;
   4A89 79            [ 4]  863 	ld	a,c
   4A8A C6 01         [ 7]  864 	add	a, #0x01
   4A8C DD 77 FE      [19]  865 	ld	-2 (ix),a
   4A8F 78            [ 4]  866 	ld	a,b
   4A90 CE 00         [ 7]  867 	adc	a, #0x00
   4A92 DD 77 FF      [19]  868 	ld	-1 (ix),a
                            869 ;src/knifestruct.c:126: else if(cu->direccion == M_arriba){
   4A95 7D            [ 4]  870 	ld	a,l
   4A96 D6 02         [ 7]  871 	sub	a, #0x02
   4A98 20 3D         [12]  872 	jr	NZ,00128$
                            873 ;src/knifestruct.c:127: if(checkOffBounds(cu)){
   4A9A C5            [11]  874 	push	bc
   4A9B D5            [11]  875 	push	de
   4A9C C5            [11]  876 	push	bc
   4A9D CD 8D 49      [17]  877 	call	_checkOffBounds
   4AA0 F1            [10]  878 	pop	af
   4AA1 D1            [10]  879 	pop	de
   4AA2 C1            [10]  880 	pop	bc
   4AA3 7D            [ 4]  881 	ld	a,l
   4AA4 B7            [ 4]  882 	or	a, a
   4AA5 28 04         [12]  883 	jr	Z,00117$
                            884 ;src/knifestruct.c:128: cu->mover = NO;
   4AA7 AF            [ 4]  885 	xor	a, a
   4AA8 12            [ 7]  886 	ld	(de),a
   4AA9 18 6C         [12]  887 	jr	00138$
   4AAB                     888 00117$:
                            889 ;src/knifestruct.c:130: else if(checkKnifeCollision(cu, 0, -2, mapa)){
   4AAB D5            [11]  890 	push	de
   4AAC DD 6E 06      [19]  891 	ld	l,6 (ix)
   4AAF DD 66 07      [19]  892 	ld	h,7 (ix)
   4AB2 E5            [11]  893 	push	hl
   4AB3 21 00 FE      [10]  894 	ld	hl,#0xFE00
   4AB6 E5            [11]  895 	push	hl
   4AB7 C5            [11]  896 	push	bc
   4AB8 CD B2 49      [17]  897 	call	_checkKnifeCollision
   4ABB F1            [10]  898 	pop	af
   4ABC F1            [10]  899 	pop	af
   4ABD F1            [10]  900 	pop	af
   4ABE D1            [10]  901 	pop	de
   4ABF 7D            [ 4]  902 	ld	a,l
   4AC0 B7            [ 4]  903 	or	a, a
   4AC1 28 10         [12]  904 	jr	Z,00114$
                            905 ;src/knifestruct.c:131: cu->mover = SI;
   4AC3 3E 01         [ 7]  906 	ld	a,#0x01
   4AC5 12            [ 7]  907 	ld	(de),a
                            908 ;src/knifestruct.c:132: cu->y--;
   4AC6 E1            [10]  909 	pop	hl
   4AC7 E5            [11]  910 	push	hl
   4AC8 4E            [ 7]  911 	ld	c,(hl)
   4AC9 0D            [ 4]  912 	dec	c
   4ACA E1            [10]  913 	pop	hl
   4ACB E5            [11]  914 	push	hl
   4ACC 71            [ 7]  915 	ld	(hl),c
                            916 ;src/knifestruct.c:133: cu->y--;
   4ACD 0D            [ 4]  917 	dec	c
   4ACE E1            [10]  918 	pop	hl
   4ACF E5            [11]  919 	push	hl
   4AD0 71            [ 7]  920 	ld	(hl),c
   4AD1 18 44         [12]  921 	jr	00138$
   4AD3                     922 00114$:
                            923 ;src/knifestruct.c:136: cu->mover=NO;
   4AD3 AF            [ 4]  924 	xor	a, a
   4AD4 12            [ 7]  925 	ld	(de),a
   4AD5 18 40         [12]  926 	jr	00138$
   4AD7                     927 00128$:
                            928 ;src/knifestruct.c:139: else if(cu->direccion == M_abajo){
   4AD7 7D            [ 4]  929 	ld	a,l
   4AD8 D6 03         [ 7]  930 	sub	a, #0x03
   4ADA 20 3B         [12]  931 	jr	NZ,00138$
                            932 ;src/knifestruct.c:140: if(checkOffBounds(cu)){
   4ADC C5            [11]  933 	push	bc
   4ADD D5            [11]  934 	push	de
   4ADE C5            [11]  935 	push	bc
   4ADF CD 8D 49      [17]  936 	call	_checkOffBounds
   4AE2 F1            [10]  937 	pop	af
   4AE3 D1            [10]  938 	pop	de
   4AE4 C1            [10]  939 	pop	bc
   4AE5 7D            [ 4]  940 	ld	a,l
   4AE6 B7            [ 4]  941 	or	a, a
   4AE7 28 04         [12]  942 	jr	Z,00123$
                            943 ;src/knifestruct.c:141: cu->mover = NO;
   4AE9 AF            [ 4]  944 	xor	a, a
   4AEA 12            [ 7]  945 	ld	(de),a
   4AEB 18 2A         [12]  946 	jr	00138$
   4AED                     947 00123$:
                            948 ;src/knifestruct.c:143: else if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   4AED D5            [11]  949 	push	de
   4AEE DD 6E 06      [19]  950 	ld	l,6 (ix)
   4AF1 DD 66 07      [19]  951 	ld	h,7 (ix)
   4AF4 E5            [11]  952 	push	hl
   4AF5 21 00 0A      [10]  953 	ld	hl,#0x0A00
   4AF8 E5            [11]  954 	push	hl
   4AF9 C5            [11]  955 	push	bc
   4AFA CD B2 49      [17]  956 	call	_checkKnifeCollision
   4AFD F1            [10]  957 	pop	af
   4AFE F1            [10]  958 	pop	af
   4AFF F1            [10]  959 	pop	af
   4B00 D1            [10]  960 	pop	de
   4B01 7D            [ 4]  961 	ld	a,l
   4B02 B7            [ 4]  962 	or	a, a
   4B03 28 10         [12]  963 	jr	Z,00120$
                            964 ;src/knifestruct.c:144: cu->mover = SI;
   4B05 3E 01         [ 7]  965 	ld	a,#0x01
   4B07 12            [ 7]  966 	ld	(de),a
                            967 ;src/knifestruct.c:145: cu->y++;
   4B08 E1            [10]  968 	pop	hl
   4B09 E5            [11]  969 	push	hl
   4B0A 4E            [ 7]  970 	ld	c,(hl)
   4B0B 0C            [ 4]  971 	inc	c
   4B0C E1            [10]  972 	pop	hl
   4B0D E5            [11]  973 	push	hl
   4B0E 71            [ 7]  974 	ld	(hl),c
                            975 ;src/knifestruct.c:146: cu->y++;
   4B0F 0C            [ 4]  976 	inc	c
   4B10 E1            [10]  977 	pop	hl
   4B11 E5            [11]  978 	push	hl
   4B12 71            [ 7]  979 	ld	(hl),c
   4B13 18 02         [12]  980 	jr	00138$
   4B15                     981 00120$:
                            982 ;src/knifestruct.c:149: cu->mover=NO;
   4B15 AF            [ 4]  983 	xor	a, a
   4B16 12            [ 7]  984 	ld	(de),a
   4B17                     985 00138$:
   4B17 DD F9         [10]  986 	ld	sp, ix
   4B19 DD E1         [14]  987 	pop	ix
   4B1B C9            [10]  988 	ret
                            989 	.area _CODE
                            990 	.area _INITIALIZER
                            991 	.area _CABS (ABS)
