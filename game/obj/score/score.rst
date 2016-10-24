                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module score
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _borrarPantalla
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawStringM0
                             14 	.globl _cpct_drawCharM0
                             15 	.globl _cpct_drawSprite
                             16 	.globl _barraPuntuacionInicial
                             17 	.globl _modificarPuntuacion
                             18 	.globl _modificarVidas
                             19 	.globl _aumentarPuntuacion
                             20 	.globl _quitarVidas
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
                             52 ;src/score/score.c:6: void barraPuntuacionInicial(){
                             53 ;	---------------------------------
                             54 ; Function barraPuntuacionInicial
                             55 ; ---------------------------------
   55CE                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   55CE 21 00 02      [10]   58 	ld	hl,#0x0200
   55D1 E5            [11]   59 	push	hl
   55D2 26 C0         [ 7]   60 	ld	h, #0xC0
   55D4 E5            [11]   61 	push	hl
   55D5 CD 93 64      [17]   62 	call	_cpct_getScreenPtr
   55D8 4D            [ 4]   63 	ld	c,l
   55D9 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   55DA 21 01 00      [10]   66 	ld	hl,#0x0001
   55DD E5            [11]   67 	push	hl
   55DE C5            [11]   68 	push	bc
   55DF 21 58 56      [10]   69 	ld	hl,#___str_0
   55E2 E5            [11]   70 	push	hl
   55E3 CD AC 58      [17]   71 	call	_cpct_drawStringM0
   55E6 21 06 00      [10]   72 	ld	hl,#6
   55E9 39            [11]   73 	add	hl,sp
   55EA F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   55EB 21 00 0E      [10]   76 	ld	hl,#0x0E00
   55EE E5            [11]   77 	push	hl
   55EF 26 C0         [ 7]   78 	ld	h, #0xC0
   55F1 E5            [11]   79 	push	hl
   55F2 CD 93 64      [17]   80 	call	_cpct_getScreenPtr
   55F5 4D            [ 4]   81 	ld	c,l
   55F6 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   55F7 21 0F 00      [10]   84 	ld	hl,#0x000F
   55FA E5            [11]   85 	push	hl
   55FB C5            [11]   86 	push	bc
   55FC 21 5E 56      [10]   87 	ld	hl,#___str_1
   55FF E5            [11]   88 	push	hl
   5600 CD AC 58      [17]   89 	call	_cpct_drawStringM0
   5603 21 06 00      [10]   90 	ld	hl,#6
   5606 39            [11]   91 	add	hl,sp
   5607 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   5608 21 3C 02      [10]   94 	ld	hl,#0x023C
   560B E5            [11]   95 	push	hl
   560C 21 00 C0      [10]   96 	ld	hl,#0xC000
   560F E5            [11]   97 	push	hl
   5610 CD 93 64      [17]   98 	call	_cpct_getScreenPtr
   5613 4D            [ 4]   99 	ld	c,l
   5614 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5615 21 01 00      [10]  102 	ld	hl,#0x0001
   5618 E5            [11]  103 	push	hl
   5619 C5            [11]  104 	push	bc
   561A 21 64 56      [10]  105 	ld	hl,#___str_2
   561D E5            [11]  106 	push	hl
   561E CD AC 58      [17]  107 	call	_cpct_drawStringM0
   5621 21 06 00      [10]  108 	ld	hl,#6
   5624 39            [11]  109 	add	hl,sp
   5625 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5626 01 00 00      [10]  112 	ld	bc,#0x0000
   5629                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5629 79            [ 4]  115 	ld	a,c
   562A 87            [ 4]  116 	add	a, a
   562B 87            [ 4]  117 	add	a, a
   562C C6 3C         [ 7]  118 	add	a, #0x3C
   562E 57            [ 4]  119 	ld	d,a
   562F C5            [11]  120 	push	bc
   5630 3E 0E         [ 7]  121 	ld	a,#0x0E
   5632 F5            [11]  122 	push	af
   5633 33            [ 6]  123 	inc	sp
   5634 D5            [11]  124 	push	de
   5635 33            [ 6]  125 	inc	sp
   5636 21 00 C0      [10]  126 	ld	hl,#0xC000
   5639 E5            [11]  127 	push	hl
   563A CD 93 64      [17]  128 	call	_cpct_getScreenPtr
   563D EB            [ 4]  129 	ex	de,hl
   563E 21 03 06      [10]  130 	ld	hl,#0x0603
   5641 E5            [11]  131 	push	hl
   5642 D5            [11]  132 	push	de
   5643 21 28 3C      [10]  133 	ld	hl,#_g_heart
   5646 E5            [11]  134 	push	hl
   5647 CD D0 58      [17]  135 	call	_cpct_drawSprite
   564A C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   564B 03            [ 6]  138 	inc	bc
   564C 79            [ 4]  139 	ld	a,c
   564D D6 05         [ 7]  140 	sub	a, #0x05
   564F 78            [ 4]  141 	ld	a,b
   5650 17            [ 4]  142 	rla
   5651 3F            [ 4]  143 	ccf
   5652 1F            [ 4]  144 	rra
   5653 DE 80         [ 7]  145 	sbc	a, #0x80
   5655 38 D2         [12]  146 	jr	C,00102$
   5657 C9            [10]  147 	ret
   5658                     148 ___str_0:
   5658 53 43 4F 52 45      149 	.ascii "SCORE"
   565D 00                  150 	.db 0x00
   565E                     151 ___str_1:
   565E 30 30 30 30 30      152 	.ascii "00000"
   5663 00                  153 	.db 0x00
   5664                     154 ___str_2:
   5664 4C 49 56 45 53      155 	.ascii "LIVES"
   5669 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   566A                     161 _modificarPuntuacion::
   566A DD E5         [15]  162 	push	ix
   566C DD 21 00 00   [14]  163 	ld	ix,#0
   5670 DD 39         [15]  164 	add	ix,sp
   5672 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   5673 DD 5E 04      [19]  167 	ld	e,4 (ix)
   5676 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5679 D5            [11]  170 	push	de
   567A 21 19 07      [10]  171 	ld	hl,#0x0719
   567D E5            [11]  172 	push	hl
   567E 21 00 0E      [10]  173 	ld	hl,#0x0E00
   5681 E5            [11]  174 	push	hl
   5682 CD A2 51      [17]  175 	call	_borrarPantalla
   5685 F1            [10]  176 	pop	af
   5686 F1            [10]  177 	pop	af
   5687 21 00 0E      [10]  178 	ld	hl,#0x0E00
   568A E5            [11]  179 	push	hl
   568B 26 C0         [ 7]  180 	ld	h, #0xC0
   568D E5            [11]  181 	push	hl
   568E CD 93 64      [17]  182 	call	_cpct_getScreenPtr
   5691 4D            [ 4]  183 	ld	c,l
   5692 44            [ 4]  184 	ld	b,h
   5693 D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   5694 C5            [11]  187 	push	bc
   5695 D5            [11]  188 	push	de
   5696 21 0A 00      [10]  189 	ld	hl,#0x000A
   5699 E5            [11]  190 	push	hl
   569A D5            [11]  191 	push	de
   569B CD 88 64      [17]  192 	call	__moduint
   569E F1            [10]  193 	pop	af
   569F F1            [10]  194 	pop	af
   56A0 D1            [10]  195 	pop	de
   56A1 C1            [10]  196 	pop	bc
   56A2 7D            [ 4]  197 	ld	a,l
   56A3 C6 30         [ 7]  198 	add	a, #0x30
   56A5 DD 77 FF      [19]  199 	ld	-1 (ix),a
   56A8 C5            [11]  200 	push	bc
   56A9 FD E1         [14]  201 	pop	iy
   56AB C5            [11]  202 	push	bc
   56AC D5            [11]  203 	push	de
   56AD DD 7E FF      [19]  204 	ld	a,-1 (ix)
   56B0 F5            [11]  205 	push	af
   56B1 33            [ 6]  206 	inc	sp
   56B2 21 02 00      [10]  207 	ld	hl,#0x0002
   56B5 E5            [11]  208 	push	hl
   56B6 FD E5         [15]  209 	push	iy
   56B8 CD 04 5A      [17]  210 	call	_cpct_drawCharM0
   56BB F1            [10]  211 	pop	af
   56BC F1            [10]  212 	pop	af
   56BD 33            [ 6]  213 	inc	sp
   56BE D1            [10]  214 	pop	de
   56BF 21 E8 03      [10]  215 	ld	hl,#0x03E8
   56C2 E5            [11]  216 	push	hl
   56C3 D5            [11]  217 	push	de
   56C4 CD D2 57      [17]  218 	call	__divuint
   56C7 F1            [10]  219 	pop	af
   56C8 F1            [10]  220 	pop	af
   56C9 11 0A 00      [10]  221 	ld	de,#0x000A
   56CC D5            [11]  222 	push	de
   56CD E5            [11]  223 	push	hl
   56CE CD 88 64      [17]  224 	call	__moduint
   56D1 F1            [10]  225 	pop	af
   56D2 F1            [10]  226 	pop	af
   56D3 C1            [10]  227 	pop	bc
   56D4 7D            [ 4]  228 	ld	a,l
   56D5 C6 30         [ 7]  229 	add	a, #0x30
   56D7 67            [ 4]  230 	ld	h,a
   56D8 79            [ 4]  231 	ld	a,c
   56D9 C6 04         [ 7]  232 	add	a, #0x04
   56DB 5F            [ 4]  233 	ld	e,a
   56DC 78            [ 4]  234 	ld	a,b
   56DD CE 00         [ 7]  235 	adc	a, #0x00
   56DF 57            [ 4]  236 	ld	d,a
   56E0 C5            [11]  237 	push	bc
   56E1 E5            [11]  238 	push	hl
   56E2 33            [ 6]  239 	inc	sp
   56E3 21 02 00      [10]  240 	ld	hl,#0x0002
   56E6 E5            [11]  241 	push	hl
   56E7 D5            [11]  242 	push	de
   56E8 CD 04 5A      [17]  243 	call	_cpct_drawCharM0
   56EB F1            [10]  244 	pop	af
   56EC 33            [ 6]  245 	inc	sp
   56ED 21 64 00      [10]  246 	ld	hl,#0x0064
   56F0 E3            [19]  247 	ex	(sp),hl
   56F1 DD 6E 04      [19]  248 	ld	l,4 (ix)
   56F4 DD 66 05      [19]  249 	ld	h,5 (ix)
   56F7 E5            [11]  250 	push	hl
   56F8 CD D2 57      [17]  251 	call	__divuint
   56FB F1            [10]  252 	pop	af
   56FC F1            [10]  253 	pop	af
   56FD 11 0A 00      [10]  254 	ld	de,#0x000A
   5700 D5            [11]  255 	push	de
   5701 E5            [11]  256 	push	hl
   5702 CD 88 64      [17]  257 	call	__moduint
   5705 F1            [10]  258 	pop	af
   5706 F1            [10]  259 	pop	af
   5707 C1            [10]  260 	pop	bc
   5708 7D            [ 4]  261 	ld	a,l
   5709 C6 30         [ 7]  262 	add	a, #0x30
   570B 67            [ 4]  263 	ld	h,a
   570C 79            [ 4]  264 	ld	a,c
   570D C6 08         [ 7]  265 	add	a, #0x08
   570F 5F            [ 4]  266 	ld	e,a
   5710 78            [ 4]  267 	ld	a,b
   5711 CE 00         [ 7]  268 	adc	a, #0x00
   5713 57            [ 4]  269 	ld	d,a
   5714 C5            [11]  270 	push	bc
   5715 E5            [11]  271 	push	hl
   5716 33            [ 6]  272 	inc	sp
   5717 21 02 00      [10]  273 	ld	hl,#0x0002
   571A E5            [11]  274 	push	hl
   571B D5            [11]  275 	push	de
   571C CD 04 5A      [17]  276 	call	_cpct_drawCharM0
   571F F1            [10]  277 	pop	af
   5720 33            [ 6]  278 	inc	sp
   5721 21 0A 00      [10]  279 	ld	hl,#0x000A
   5724 E3            [19]  280 	ex	(sp),hl
   5725 DD 6E 04      [19]  281 	ld	l,4 (ix)
   5728 DD 66 05      [19]  282 	ld	h,5 (ix)
   572B E5            [11]  283 	push	hl
   572C CD D2 57      [17]  284 	call	__divuint
   572F F1            [10]  285 	pop	af
   5730 F1            [10]  286 	pop	af
   5731 11 0A 00      [10]  287 	ld	de,#0x000A
   5734 D5            [11]  288 	push	de
   5735 E5            [11]  289 	push	hl
   5736 CD 88 64      [17]  290 	call	__moduint
   5739 F1            [10]  291 	pop	af
   573A F1            [10]  292 	pop	af
   573B C1            [10]  293 	pop	bc
   573C 7D            [ 4]  294 	ld	a,l
   573D C6 30         [ 7]  295 	add	a, #0x30
   573F 67            [ 4]  296 	ld	h,a
   5740 79            [ 4]  297 	ld	a,c
   5741 C6 0C         [ 7]  298 	add	a, #0x0C
   5743 5F            [ 4]  299 	ld	e,a
   5744 78            [ 4]  300 	ld	a,b
   5745 CE 00         [ 7]  301 	adc	a, #0x00
   5747 57            [ 4]  302 	ld	d,a
   5748 C5            [11]  303 	push	bc
   5749 E5            [11]  304 	push	hl
   574A 33            [ 6]  305 	inc	sp
   574B 21 02 00      [10]  306 	ld	hl,#0x0002
   574E E5            [11]  307 	push	hl
   574F D5            [11]  308 	push	de
   5750 CD 04 5A      [17]  309 	call	_cpct_drawCharM0
   5753 F1            [10]  310 	pop	af
   5754 F1            [10]  311 	pop	af
   5755 33            [ 6]  312 	inc	sp
   5756 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5757 21 10 00      [10]  315 	ld	hl,#0x0010
   575A 09            [11]  316 	add	hl,bc
   575B 4D            [ 4]  317 	ld	c,l
   575C 44            [ 4]  318 	ld	b,h
   575D DD 7E FF      [19]  319 	ld	a,-1 (ix)
   5760 F5            [11]  320 	push	af
   5761 33            [ 6]  321 	inc	sp
   5762 21 02 00      [10]  322 	ld	hl,#0x0002
   5765 E5            [11]  323 	push	hl
   5766 C5            [11]  324 	push	bc
   5767 CD 04 5A      [17]  325 	call	_cpct_drawCharM0
   576A F1            [10]  326 	pop	af
   576B F1            [10]  327 	pop	af
   576C 33            [ 6]  328 	inc	sp
   576D 33            [ 6]  329 	inc	sp
   576E DD E1         [14]  330 	pop	ix
   5770 C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   5771                     336 _modificarVidas::
   5771 DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   5773 01 00 00      [10]  339 	ld	bc,#0x0000
   5776                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5776 79            [ 4]  342 	ld	a,c
   5777 87            [ 4]  343 	add	a, a
   5778 87            [ 4]  344 	add	a, a
   5779 C6 3C         [ 7]  345 	add	a, #0x3C
   577B 57            [ 4]  346 	ld	d,a
   577C C5            [11]  347 	push	bc
   577D 3E 0E         [ 7]  348 	ld	a,#0x0E
   577F F5            [11]  349 	push	af
   5780 33            [ 6]  350 	inc	sp
   5781 D5            [11]  351 	push	de
   5782 33            [ 6]  352 	inc	sp
   5783 21 00 C0      [10]  353 	ld	hl,#0xC000
   5786 E5            [11]  354 	push	hl
   5787 CD 93 64      [17]  355 	call	_cpct_getScreenPtr
   578A EB            [ 4]  356 	ex	de,hl
   578B 21 03 06      [10]  357 	ld	hl,#0x0603
   578E E5            [11]  358 	push	hl
   578F D5            [11]  359 	push	de
   5790 21 28 3C      [10]  360 	ld	hl,#_g_heart
   5793 E5            [11]  361 	push	hl
   5794 CD D0 58      [17]  362 	call	_cpct_drawSprite
   5797 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   5798 03            [ 6]  365 	inc	bc
   5799 79            [ 4]  366 	ld	a,c
   579A D6 05         [ 7]  367 	sub	a, #0x05
   579C 78            [ 4]  368 	ld	a,b
   579D 17            [ 4]  369 	rla
   579E 3F            [ 4]  370 	ccf
   579F 1F            [ 4]  371 	rra
   57A0 DE 80         [ 7]  372 	sbc	a, #0x80
   57A2 38 D2         [12]  373 	jr	C,00102$
   57A4 DD E1         [14]  374 	pop	ix
   57A6 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   57A7                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   57A7 FD 21 02 00   [14]  382 	ld	iy,#2
   57AB FD 39         [15]  383 	add	iy,sp
   57AD FD 7E 00      [19]  384 	ld	a,0 (iy)
   57B0 C6 0A         [ 7]  385 	add	a, #0x0A
   57B2 6F            [ 4]  386 	ld	l, a
   57B3 FD 7E 01      [19]  387 	ld	a, 1 (iy)
   57B6 CE 00         [ 7]  388 	adc	a, #0x00
   57B8 67            [ 4]  389 	ld	h, a
   57B9 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   57BA                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   57BA 21 02 00      [10]  397 	ld	hl, #2+0
   57BD 39            [11]  398 	add	hl, sp
   57BE 4E            [ 7]  399 	ld	c, (hl)
   57BF 0D            [ 4]  400 	dec	c
   57C0 69            [ 4]  401 	ld	l,c
   57C1 C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
