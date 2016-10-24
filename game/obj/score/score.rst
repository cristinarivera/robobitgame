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
   55DE                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   55DE 21 00 02      [10]   58 	ld	hl,#0x0200
   55E1 E5            [11]   59 	push	hl
   55E2 26 C0         [ 7]   60 	ld	h, #0xC0
   55E4 E5            [11]   61 	push	hl
   55E5 CD A3 64      [17]   62 	call	_cpct_getScreenPtr
   55E8 4D            [ 4]   63 	ld	c,l
   55E9 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   55EA 21 01 00      [10]   66 	ld	hl,#0x0001
   55ED E5            [11]   67 	push	hl
   55EE C5            [11]   68 	push	bc
   55EF 21 68 56      [10]   69 	ld	hl,#___str_0
   55F2 E5            [11]   70 	push	hl
   55F3 CD BC 58      [17]   71 	call	_cpct_drawStringM0
   55F6 21 06 00      [10]   72 	ld	hl,#6
   55F9 39            [11]   73 	add	hl,sp
   55FA F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   55FB 21 00 0E      [10]   76 	ld	hl,#0x0E00
   55FE E5            [11]   77 	push	hl
   55FF 26 C0         [ 7]   78 	ld	h, #0xC0
   5601 E5            [11]   79 	push	hl
   5602 CD A3 64      [17]   80 	call	_cpct_getScreenPtr
   5605 4D            [ 4]   81 	ld	c,l
   5606 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5607 21 0F 00      [10]   84 	ld	hl,#0x000F
   560A E5            [11]   85 	push	hl
   560B C5            [11]   86 	push	bc
   560C 21 6E 56      [10]   87 	ld	hl,#___str_1
   560F E5            [11]   88 	push	hl
   5610 CD BC 58      [17]   89 	call	_cpct_drawStringM0
   5613 21 06 00      [10]   90 	ld	hl,#6
   5616 39            [11]   91 	add	hl,sp
   5617 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   5618 21 3C 02      [10]   94 	ld	hl,#0x023C
   561B E5            [11]   95 	push	hl
   561C 21 00 C0      [10]   96 	ld	hl,#0xC000
   561F E5            [11]   97 	push	hl
   5620 CD A3 64      [17]   98 	call	_cpct_getScreenPtr
   5623 4D            [ 4]   99 	ld	c,l
   5624 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5625 21 01 00      [10]  102 	ld	hl,#0x0001
   5628 E5            [11]  103 	push	hl
   5629 C5            [11]  104 	push	bc
   562A 21 74 56      [10]  105 	ld	hl,#___str_2
   562D E5            [11]  106 	push	hl
   562E CD BC 58      [17]  107 	call	_cpct_drawStringM0
   5631 21 06 00      [10]  108 	ld	hl,#6
   5634 39            [11]  109 	add	hl,sp
   5635 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5636 01 00 00      [10]  112 	ld	bc,#0x0000
   5639                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5639 79            [ 4]  115 	ld	a,c
   563A 87            [ 4]  116 	add	a, a
   563B 87            [ 4]  117 	add	a, a
   563C C6 3C         [ 7]  118 	add	a, #0x3C
   563E 57            [ 4]  119 	ld	d,a
   563F C5            [11]  120 	push	bc
   5640 3E 0E         [ 7]  121 	ld	a,#0x0E
   5642 F5            [11]  122 	push	af
   5643 33            [ 6]  123 	inc	sp
   5644 D5            [11]  124 	push	de
   5645 33            [ 6]  125 	inc	sp
   5646 21 00 C0      [10]  126 	ld	hl,#0xC000
   5649 E5            [11]  127 	push	hl
   564A CD A3 64      [17]  128 	call	_cpct_getScreenPtr
   564D EB            [ 4]  129 	ex	de,hl
   564E 21 03 06      [10]  130 	ld	hl,#0x0603
   5651 E5            [11]  131 	push	hl
   5652 D5            [11]  132 	push	de
   5653 21 28 3C      [10]  133 	ld	hl,#_g_heart
   5656 E5            [11]  134 	push	hl
   5657 CD E0 58      [17]  135 	call	_cpct_drawSprite
   565A C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   565B 03            [ 6]  138 	inc	bc
   565C 79            [ 4]  139 	ld	a,c
   565D D6 05         [ 7]  140 	sub	a, #0x05
   565F 78            [ 4]  141 	ld	a,b
   5660 17            [ 4]  142 	rla
   5661 3F            [ 4]  143 	ccf
   5662 1F            [ 4]  144 	rra
   5663 DE 80         [ 7]  145 	sbc	a, #0x80
   5665 38 D2         [12]  146 	jr	C,00102$
   5667 C9            [10]  147 	ret
   5668                     148 ___str_0:
   5668 53 43 4F 52 45      149 	.ascii "SCORE"
   566D 00                  150 	.db 0x00
   566E                     151 ___str_1:
   566E 30 30 30 30 30      152 	.ascii "00000"
   5673 00                  153 	.db 0x00
   5674                     154 ___str_2:
   5674 4C 49 56 45 53      155 	.ascii "LIVES"
   5679 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   567A                     161 _modificarPuntuacion::
   567A DD E5         [15]  162 	push	ix
   567C DD 21 00 00   [14]  163 	ld	ix,#0
   5680 DD 39         [15]  164 	add	ix,sp
   5682 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   5683 DD 5E 04      [19]  167 	ld	e,4 (ix)
   5686 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5689 D5            [11]  170 	push	de
   568A 21 19 07      [10]  171 	ld	hl,#0x0719
   568D E5            [11]  172 	push	hl
   568E 21 00 0E      [10]  173 	ld	hl,#0x0E00
   5691 E5            [11]  174 	push	hl
   5692 CD B2 51      [17]  175 	call	_borrarPantalla
   5695 F1            [10]  176 	pop	af
   5696 F1            [10]  177 	pop	af
   5697 21 00 0E      [10]  178 	ld	hl,#0x0E00
   569A E5            [11]  179 	push	hl
   569B 26 C0         [ 7]  180 	ld	h, #0xC0
   569D E5            [11]  181 	push	hl
   569E CD A3 64      [17]  182 	call	_cpct_getScreenPtr
   56A1 4D            [ 4]  183 	ld	c,l
   56A2 44            [ 4]  184 	ld	b,h
   56A3 D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   56A4 C5            [11]  187 	push	bc
   56A5 D5            [11]  188 	push	de
   56A6 21 0A 00      [10]  189 	ld	hl,#0x000A
   56A9 E5            [11]  190 	push	hl
   56AA D5            [11]  191 	push	de
   56AB CD 98 64      [17]  192 	call	__moduint
   56AE F1            [10]  193 	pop	af
   56AF F1            [10]  194 	pop	af
   56B0 D1            [10]  195 	pop	de
   56B1 C1            [10]  196 	pop	bc
   56B2 7D            [ 4]  197 	ld	a,l
   56B3 C6 30         [ 7]  198 	add	a, #0x30
   56B5 DD 77 FF      [19]  199 	ld	-1 (ix),a
   56B8 C5            [11]  200 	push	bc
   56B9 FD E1         [14]  201 	pop	iy
   56BB C5            [11]  202 	push	bc
   56BC D5            [11]  203 	push	de
   56BD DD 7E FF      [19]  204 	ld	a,-1 (ix)
   56C0 F5            [11]  205 	push	af
   56C1 33            [ 6]  206 	inc	sp
   56C2 21 02 00      [10]  207 	ld	hl,#0x0002
   56C5 E5            [11]  208 	push	hl
   56C6 FD E5         [15]  209 	push	iy
   56C8 CD 14 5A      [17]  210 	call	_cpct_drawCharM0
   56CB F1            [10]  211 	pop	af
   56CC F1            [10]  212 	pop	af
   56CD 33            [ 6]  213 	inc	sp
   56CE D1            [10]  214 	pop	de
   56CF 21 E8 03      [10]  215 	ld	hl,#0x03E8
   56D2 E5            [11]  216 	push	hl
   56D3 D5            [11]  217 	push	de
   56D4 CD E2 57      [17]  218 	call	__divuint
   56D7 F1            [10]  219 	pop	af
   56D8 F1            [10]  220 	pop	af
   56D9 11 0A 00      [10]  221 	ld	de,#0x000A
   56DC D5            [11]  222 	push	de
   56DD E5            [11]  223 	push	hl
   56DE CD 98 64      [17]  224 	call	__moduint
   56E1 F1            [10]  225 	pop	af
   56E2 F1            [10]  226 	pop	af
   56E3 C1            [10]  227 	pop	bc
   56E4 7D            [ 4]  228 	ld	a,l
   56E5 C6 30         [ 7]  229 	add	a, #0x30
   56E7 67            [ 4]  230 	ld	h,a
   56E8 79            [ 4]  231 	ld	a,c
   56E9 C6 04         [ 7]  232 	add	a, #0x04
   56EB 5F            [ 4]  233 	ld	e,a
   56EC 78            [ 4]  234 	ld	a,b
   56ED CE 00         [ 7]  235 	adc	a, #0x00
   56EF 57            [ 4]  236 	ld	d,a
   56F0 C5            [11]  237 	push	bc
   56F1 E5            [11]  238 	push	hl
   56F2 33            [ 6]  239 	inc	sp
   56F3 21 02 00      [10]  240 	ld	hl,#0x0002
   56F6 E5            [11]  241 	push	hl
   56F7 D5            [11]  242 	push	de
   56F8 CD 14 5A      [17]  243 	call	_cpct_drawCharM0
   56FB F1            [10]  244 	pop	af
   56FC 33            [ 6]  245 	inc	sp
   56FD 21 64 00      [10]  246 	ld	hl,#0x0064
   5700 E3            [19]  247 	ex	(sp),hl
   5701 DD 6E 04      [19]  248 	ld	l,4 (ix)
   5704 DD 66 05      [19]  249 	ld	h,5 (ix)
   5707 E5            [11]  250 	push	hl
   5708 CD E2 57      [17]  251 	call	__divuint
   570B F1            [10]  252 	pop	af
   570C F1            [10]  253 	pop	af
   570D 11 0A 00      [10]  254 	ld	de,#0x000A
   5710 D5            [11]  255 	push	de
   5711 E5            [11]  256 	push	hl
   5712 CD 98 64      [17]  257 	call	__moduint
   5715 F1            [10]  258 	pop	af
   5716 F1            [10]  259 	pop	af
   5717 C1            [10]  260 	pop	bc
   5718 7D            [ 4]  261 	ld	a,l
   5719 C6 30         [ 7]  262 	add	a, #0x30
   571B 67            [ 4]  263 	ld	h,a
   571C 79            [ 4]  264 	ld	a,c
   571D C6 08         [ 7]  265 	add	a, #0x08
   571F 5F            [ 4]  266 	ld	e,a
   5720 78            [ 4]  267 	ld	a,b
   5721 CE 00         [ 7]  268 	adc	a, #0x00
   5723 57            [ 4]  269 	ld	d,a
   5724 C5            [11]  270 	push	bc
   5725 E5            [11]  271 	push	hl
   5726 33            [ 6]  272 	inc	sp
   5727 21 02 00      [10]  273 	ld	hl,#0x0002
   572A E5            [11]  274 	push	hl
   572B D5            [11]  275 	push	de
   572C CD 14 5A      [17]  276 	call	_cpct_drawCharM0
   572F F1            [10]  277 	pop	af
   5730 33            [ 6]  278 	inc	sp
   5731 21 0A 00      [10]  279 	ld	hl,#0x000A
   5734 E3            [19]  280 	ex	(sp),hl
   5735 DD 6E 04      [19]  281 	ld	l,4 (ix)
   5738 DD 66 05      [19]  282 	ld	h,5 (ix)
   573B E5            [11]  283 	push	hl
   573C CD E2 57      [17]  284 	call	__divuint
   573F F1            [10]  285 	pop	af
   5740 F1            [10]  286 	pop	af
   5741 11 0A 00      [10]  287 	ld	de,#0x000A
   5744 D5            [11]  288 	push	de
   5745 E5            [11]  289 	push	hl
   5746 CD 98 64      [17]  290 	call	__moduint
   5749 F1            [10]  291 	pop	af
   574A F1            [10]  292 	pop	af
   574B C1            [10]  293 	pop	bc
   574C 7D            [ 4]  294 	ld	a,l
   574D C6 30         [ 7]  295 	add	a, #0x30
   574F 67            [ 4]  296 	ld	h,a
   5750 79            [ 4]  297 	ld	a,c
   5751 C6 0C         [ 7]  298 	add	a, #0x0C
   5753 5F            [ 4]  299 	ld	e,a
   5754 78            [ 4]  300 	ld	a,b
   5755 CE 00         [ 7]  301 	adc	a, #0x00
   5757 57            [ 4]  302 	ld	d,a
   5758 C5            [11]  303 	push	bc
   5759 E5            [11]  304 	push	hl
   575A 33            [ 6]  305 	inc	sp
   575B 21 02 00      [10]  306 	ld	hl,#0x0002
   575E E5            [11]  307 	push	hl
   575F D5            [11]  308 	push	de
   5760 CD 14 5A      [17]  309 	call	_cpct_drawCharM0
   5763 F1            [10]  310 	pop	af
   5764 F1            [10]  311 	pop	af
   5765 33            [ 6]  312 	inc	sp
   5766 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5767 21 10 00      [10]  315 	ld	hl,#0x0010
   576A 09            [11]  316 	add	hl,bc
   576B 4D            [ 4]  317 	ld	c,l
   576C 44            [ 4]  318 	ld	b,h
   576D DD 7E FF      [19]  319 	ld	a,-1 (ix)
   5770 F5            [11]  320 	push	af
   5771 33            [ 6]  321 	inc	sp
   5772 21 02 00      [10]  322 	ld	hl,#0x0002
   5775 E5            [11]  323 	push	hl
   5776 C5            [11]  324 	push	bc
   5777 CD 14 5A      [17]  325 	call	_cpct_drawCharM0
   577A F1            [10]  326 	pop	af
   577B F1            [10]  327 	pop	af
   577C 33            [ 6]  328 	inc	sp
   577D 33            [ 6]  329 	inc	sp
   577E DD E1         [14]  330 	pop	ix
   5780 C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   5781                     336 _modificarVidas::
   5781 DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   5783 01 00 00      [10]  339 	ld	bc,#0x0000
   5786                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5786 79            [ 4]  342 	ld	a,c
   5787 87            [ 4]  343 	add	a, a
   5788 87            [ 4]  344 	add	a, a
   5789 C6 3C         [ 7]  345 	add	a, #0x3C
   578B 57            [ 4]  346 	ld	d,a
   578C C5            [11]  347 	push	bc
   578D 3E 0E         [ 7]  348 	ld	a,#0x0E
   578F F5            [11]  349 	push	af
   5790 33            [ 6]  350 	inc	sp
   5791 D5            [11]  351 	push	de
   5792 33            [ 6]  352 	inc	sp
   5793 21 00 C0      [10]  353 	ld	hl,#0xC000
   5796 E5            [11]  354 	push	hl
   5797 CD A3 64      [17]  355 	call	_cpct_getScreenPtr
   579A EB            [ 4]  356 	ex	de,hl
   579B 21 03 06      [10]  357 	ld	hl,#0x0603
   579E E5            [11]  358 	push	hl
   579F D5            [11]  359 	push	de
   57A0 21 28 3C      [10]  360 	ld	hl,#_g_heart
   57A3 E5            [11]  361 	push	hl
   57A4 CD E0 58      [17]  362 	call	_cpct_drawSprite
   57A7 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   57A8 03            [ 6]  365 	inc	bc
   57A9 79            [ 4]  366 	ld	a,c
   57AA D6 05         [ 7]  367 	sub	a, #0x05
   57AC 78            [ 4]  368 	ld	a,b
   57AD 17            [ 4]  369 	rla
   57AE 3F            [ 4]  370 	ccf
   57AF 1F            [ 4]  371 	rra
   57B0 DE 80         [ 7]  372 	sbc	a, #0x80
   57B2 38 D2         [12]  373 	jr	C,00102$
   57B4 DD E1         [14]  374 	pop	ix
   57B6 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   57B7                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   57B7 FD 21 02 00   [14]  382 	ld	iy,#2
   57BB FD 39         [15]  383 	add	iy,sp
   57BD FD 7E 00      [19]  384 	ld	a,0 (iy)
   57C0 C6 0A         [ 7]  385 	add	a, #0x0A
   57C2 6F            [ 4]  386 	ld	l, a
   57C3 FD 7E 01      [19]  387 	ld	a, 1 (iy)
   57C6 CE 00         [ 7]  388 	adc	a, #0x00
   57C8 67            [ 4]  389 	ld	h, a
   57C9 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   57CA                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   57CA 21 02 00      [10]  397 	ld	hl, #2+0
   57CD 39            [11]  398 	add	hl, sp
   57CE 4E            [ 7]  399 	ld	c, (hl)
   57CF 0D            [ 4]  400 	dec	c
   57D0 69            [ 4]  401 	ld	l,c
   57D1 C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
