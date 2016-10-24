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
   55F7                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   55F7 21 00 02      [10]   58 	ld	hl,#0x0200
   55FA E5            [11]   59 	push	hl
   55FB 26 C0         [ 7]   60 	ld	h, #0xC0
   55FD E5            [11]   61 	push	hl
   55FE CD BC 64      [17]   62 	call	_cpct_getScreenPtr
   5601 4D            [ 4]   63 	ld	c,l
   5602 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   5603 21 01 00      [10]   66 	ld	hl,#0x0001
   5606 E5            [11]   67 	push	hl
   5607 C5            [11]   68 	push	bc
   5608 21 81 56      [10]   69 	ld	hl,#___str_0
   560B E5            [11]   70 	push	hl
   560C CD D5 58      [17]   71 	call	_cpct_drawStringM0
   560F 21 06 00      [10]   72 	ld	hl,#6
   5612 39            [11]   73 	add	hl,sp
   5613 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   5614 21 00 0E      [10]   76 	ld	hl,#0x0E00
   5617 E5            [11]   77 	push	hl
   5618 26 C0         [ 7]   78 	ld	h, #0xC0
   561A E5            [11]   79 	push	hl
   561B CD BC 64      [17]   80 	call	_cpct_getScreenPtr
   561E 4D            [ 4]   81 	ld	c,l
   561F 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5620 21 0F 00      [10]   84 	ld	hl,#0x000F
   5623 E5            [11]   85 	push	hl
   5624 C5            [11]   86 	push	bc
   5625 21 87 56      [10]   87 	ld	hl,#___str_1
   5628 E5            [11]   88 	push	hl
   5629 CD D5 58      [17]   89 	call	_cpct_drawStringM0
   562C 21 06 00      [10]   90 	ld	hl,#6
   562F 39            [11]   91 	add	hl,sp
   5630 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   5631 21 3C 02      [10]   94 	ld	hl,#0x023C
   5634 E5            [11]   95 	push	hl
   5635 21 00 C0      [10]   96 	ld	hl,#0xC000
   5638 E5            [11]   97 	push	hl
   5639 CD BC 64      [17]   98 	call	_cpct_getScreenPtr
   563C 4D            [ 4]   99 	ld	c,l
   563D 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   563E 21 01 00      [10]  102 	ld	hl,#0x0001
   5641 E5            [11]  103 	push	hl
   5642 C5            [11]  104 	push	bc
   5643 21 8D 56      [10]  105 	ld	hl,#___str_2
   5646 E5            [11]  106 	push	hl
   5647 CD D5 58      [17]  107 	call	_cpct_drawStringM0
   564A 21 06 00      [10]  108 	ld	hl,#6
   564D 39            [11]  109 	add	hl,sp
   564E F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   564F 01 00 00      [10]  112 	ld	bc,#0x0000
   5652                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5652 79            [ 4]  115 	ld	a,c
   5653 87            [ 4]  116 	add	a, a
   5654 87            [ 4]  117 	add	a, a
   5655 C6 3C         [ 7]  118 	add	a, #0x3C
   5657 57            [ 4]  119 	ld	d,a
   5658 C5            [11]  120 	push	bc
   5659 3E 0E         [ 7]  121 	ld	a,#0x0E
   565B F5            [11]  122 	push	af
   565C 33            [ 6]  123 	inc	sp
   565D D5            [11]  124 	push	de
   565E 33            [ 6]  125 	inc	sp
   565F 21 00 C0      [10]  126 	ld	hl,#0xC000
   5662 E5            [11]  127 	push	hl
   5663 CD BC 64      [17]  128 	call	_cpct_getScreenPtr
   5666 EB            [ 4]  129 	ex	de,hl
   5667 21 03 06      [10]  130 	ld	hl,#0x0603
   566A E5            [11]  131 	push	hl
   566B D5            [11]  132 	push	de
   566C 21 28 3C      [10]  133 	ld	hl,#_g_heart
   566F E5            [11]  134 	push	hl
   5670 CD F9 58      [17]  135 	call	_cpct_drawSprite
   5673 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   5674 03            [ 6]  138 	inc	bc
   5675 79            [ 4]  139 	ld	a,c
   5676 D6 05         [ 7]  140 	sub	a, #0x05
   5678 78            [ 4]  141 	ld	a,b
   5679 17            [ 4]  142 	rla
   567A 3F            [ 4]  143 	ccf
   567B 1F            [ 4]  144 	rra
   567C DE 80         [ 7]  145 	sbc	a, #0x80
   567E 38 D2         [12]  146 	jr	C,00102$
   5680 C9            [10]  147 	ret
   5681                     148 ___str_0:
   5681 53 43 4F 52 45      149 	.ascii "SCORE"
   5686 00                  150 	.db 0x00
   5687                     151 ___str_1:
   5687 30 30 30 30 30      152 	.ascii "00000"
   568C 00                  153 	.db 0x00
   568D                     154 ___str_2:
   568D 4C 49 56 45 53      155 	.ascii "LIVES"
   5692 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   5693                     161 _modificarPuntuacion::
   5693 DD E5         [15]  162 	push	ix
   5695 DD 21 00 00   [14]  163 	ld	ix,#0
   5699 DD 39         [15]  164 	add	ix,sp
   569B 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   569C DD 5E 04      [19]  167 	ld	e,4 (ix)
   569F DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   56A2 D5            [11]  170 	push	de
   56A3 21 19 07      [10]  171 	ld	hl,#0x0719
   56A6 E5            [11]  172 	push	hl
   56A7 21 00 0E      [10]  173 	ld	hl,#0x0E00
   56AA E5            [11]  174 	push	hl
   56AB CD CB 51      [17]  175 	call	_borrarPantalla
   56AE F1            [10]  176 	pop	af
   56AF F1            [10]  177 	pop	af
   56B0 21 00 0E      [10]  178 	ld	hl,#0x0E00
   56B3 E5            [11]  179 	push	hl
   56B4 26 C0         [ 7]  180 	ld	h, #0xC0
   56B6 E5            [11]  181 	push	hl
   56B7 CD BC 64      [17]  182 	call	_cpct_getScreenPtr
   56BA 4D            [ 4]  183 	ld	c,l
   56BB 44            [ 4]  184 	ld	b,h
   56BC D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   56BD C5            [11]  187 	push	bc
   56BE D5            [11]  188 	push	de
   56BF 21 0A 00      [10]  189 	ld	hl,#0x000A
   56C2 E5            [11]  190 	push	hl
   56C3 D5            [11]  191 	push	de
   56C4 CD B1 64      [17]  192 	call	__moduint
   56C7 F1            [10]  193 	pop	af
   56C8 F1            [10]  194 	pop	af
   56C9 D1            [10]  195 	pop	de
   56CA C1            [10]  196 	pop	bc
   56CB 7D            [ 4]  197 	ld	a,l
   56CC C6 30         [ 7]  198 	add	a, #0x30
   56CE DD 77 FF      [19]  199 	ld	-1 (ix),a
   56D1 C5            [11]  200 	push	bc
   56D2 FD E1         [14]  201 	pop	iy
   56D4 C5            [11]  202 	push	bc
   56D5 D5            [11]  203 	push	de
   56D6 DD 7E FF      [19]  204 	ld	a,-1 (ix)
   56D9 F5            [11]  205 	push	af
   56DA 33            [ 6]  206 	inc	sp
   56DB 21 02 00      [10]  207 	ld	hl,#0x0002
   56DE E5            [11]  208 	push	hl
   56DF FD E5         [15]  209 	push	iy
   56E1 CD 2D 5A      [17]  210 	call	_cpct_drawCharM0
   56E4 F1            [10]  211 	pop	af
   56E5 F1            [10]  212 	pop	af
   56E6 33            [ 6]  213 	inc	sp
   56E7 D1            [10]  214 	pop	de
   56E8 21 E8 03      [10]  215 	ld	hl,#0x03E8
   56EB E5            [11]  216 	push	hl
   56EC D5            [11]  217 	push	de
   56ED CD FB 57      [17]  218 	call	__divuint
   56F0 F1            [10]  219 	pop	af
   56F1 F1            [10]  220 	pop	af
   56F2 11 0A 00      [10]  221 	ld	de,#0x000A
   56F5 D5            [11]  222 	push	de
   56F6 E5            [11]  223 	push	hl
   56F7 CD B1 64      [17]  224 	call	__moduint
   56FA F1            [10]  225 	pop	af
   56FB F1            [10]  226 	pop	af
   56FC C1            [10]  227 	pop	bc
   56FD 7D            [ 4]  228 	ld	a,l
   56FE C6 30         [ 7]  229 	add	a, #0x30
   5700 67            [ 4]  230 	ld	h,a
   5701 79            [ 4]  231 	ld	a,c
   5702 C6 04         [ 7]  232 	add	a, #0x04
   5704 5F            [ 4]  233 	ld	e,a
   5705 78            [ 4]  234 	ld	a,b
   5706 CE 00         [ 7]  235 	adc	a, #0x00
   5708 57            [ 4]  236 	ld	d,a
   5709 C5            [11]  237 	push	bc
   570A E5            [11]  238 	push	hl
   570B 33            [ 6]  239 	inc	sp
   570C 21 02 00      [10]  240 	ld	hl,#0x0002
   570F E5            [11]  241 	push	hl
   5710 D5            [11]  242 	push	de
   5711 CD 2D 5A      [17]  243 	call	_cpct_drawCharM0
   5714 F1            [10]  244 	pop	af
   5715 33            [ 6]  245 	inc	sp
   5716 21 64 00      [10]  246 	ld	hl,#0x0064
   5719 E3            [19]  247 	ex	(sp),hl
   571A DD 6E 04      [19]  248 	ld	l,4 (ix)
   571D DD 66 05      [19]  249 	ld	h,5 (ix)
   5720 E5            [11]  250 	push	hl
   5721 CD FB 57      [17]  251 	call	__divuint
   5724 F1            [10]  252 	pop	af
   5725 F1            [10]  253 	pop	af
   5726 11 0A 00      [10]  254 	ld	de,#0x000A
   5729 D5            [11]  255 	push	de
   572A E5            [11]  256 	push	hl
   572B CD B1 64      [17]  257 	call	__moduint
   572E F1            [10]  258 	pop	af
   572F F1            [10]  259 	pop	af
   5730 C1            [10]  260 	pop	bc
   5731 7D            [ 4]  261 	ld	a,l
   5732 C6 30         [ 7]  262 	add	a, #0x30
   5734 67            [ 4]  263 	ld	h,a
   5735 79            [ 4]  264 	ld	a,c
   5736 C6 08         [ 7]  265 	add	a, #0x08
   5738 5F            [ 4]  266 	ld	e,a
   5739 78            [ 4]  267 	ld	a,b
   573A CE 00         [ 7]  268 	adc	a, #0x00
   573C 57            [ 4]  269 	ld	d,a
   573D C5            [11]  270 	push	bc
   573E E5            [11]  271 	push	hl
   573F 33            [ 6]  272 	inc	sp
   5740 21 02 00      [10]  273 	ld	hl,#0x0002
   5743 E5            [11]  274 	push	hl
   5744 D5            [11]  275 	push	de
   5745 CD 2D 5A      [17]  276 	call	_cpct_drawCharM0
   5748 F1            [10]  277 	pop	af
   5749 33            [ 6]  278 	inc	sp
   574A 21 0A 00      [10]  279 	ld	hl,#0x000A
   574D E3            [19]  280 	ex	(sp),hl
   574E DD 6E 04      [19]  281 	ld	l,4 (ix)
   5751 DD 66 05      [19]  282 	ld	h,5 (ix)
   5754 E5            [11]  283 	push	hl
   5755 CD FB 57      [17]  284 	call	__divuint
   5758 F1            [10]  285 	pop	af
   5759 F1            [10]  286 	pop	af
   575A 11 0A 00      [10]  287 	ld	de,#0x000A
   575D D5            [11]  288 	push	de
   575E E5            [11]  289 	push	hl
   575F CD B1 64      [17]  290 	call	__moduint
   5762 F1            [10]  291 	pop	af
   5763 F1            [10]  292 	pop	af
   5764 C1            [10]  293 	pop	bc
   5765 7D            [ 4]  294 	ld	a,l
   5766 C6 30         [ 7]  295 	add	a, #0x30
   5768 67            [ 4]  296 	ld	h,a
   5769 79            [ 4]  297 	ld	a,c
   576A C6 0C         [ 7]  298 	add	a, #0x0C
   576C 5F            [ 4]  299 	ld	e,a
   576D 78            [ 4]  300 	ld	a,b
   576E CE 00         [ 7]  301 	adc	a, #0x00
   5770 57            [ 4]  302 	ld	d,a
   5771 C5            [11]  303 	push	bc
   5772 E5            [11]  304 	push	hl
   5773 33            [ 6]  305 	inc	sp
   5774 21 02 00      [10]  306 	ld	hl,#0x0002
   5777 E5            [11]  307 	push	hl
   5778 D5            [11]  308 	push	de
   5779 CD 2D 5A      [17]  309 	call	_cpct_drawCharM0
   577C F1            [10]  310 	pop	af
   577D F1            [10]  311 	pop	af
   577E 33            [ 6]  312 	inc	sp
   577F C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5780 21 10 00      [10]  315 	ld	hl,#0x0010
   5783 09            [11]  316 	add	hl,bc
   5784 4D            [ 4]  317 	ld	c,l
   5785 44            [ 4]  318 	ld	b,h
   5786 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   5789 F5            [11]  320 	push	af
   578A 33            [ 6]  321 	inc	sp
   578B 21 02 00      [10]  322 	ld	hl,#0x0002
   578E E5            [11]  323 	push	hl
   578F C5            [11]  324 	push	bc
   5790 CD 2D 5A      [17]  325 	call	_cpct_drawCharM0
   5793 F1            [10]  326 	pop	af
   5794 F1            [10]  327 	pop	af
   5795 33            [ 6]  328 	inc	sp
   5796 33            [ 6]  329 	inc	sp
   5797 DD E1         [14]  330 	pop	ix
   5799 C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   579A                     336 _modificarVidas::
   579A DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   579C 01 00 00      [10]  339 	ld	bc,#0x0000
   579F                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   579F 79            [ 4]  342 	ld	a,c
   57A0 87            [ 4]  343 	add	a, a
   57A1 87            [ 4]  344 	add	a, a
   57A2 C6 3C         [ 7]  345 	add	a, #0x3C
   57A4 57            [ 4]  346 	ld	d,a
   57A5 C5            [11]  347 	push	bc
   57A6 3E 0E         [ 7]  348 	ld	a,#0x0E
   57A8 F5            [11]  349 	push	af
   57A9 33            [ 6]  350 	inc	sp
   57AA D5            [11]  351 	push	de
   57AB 33            [ 6]  352 	inc	sp
   57AC 21 00 C0      [10]  353 	ld	hl,#0xC000
   57AF E5            [11]  354 	push	hl
   57B0 CD BC 64      [17]  355 	call	_cpct_getScreenPtr
   57B3 EB            [ 4]  356 	ex	de,hl
   57B4 21 03 06      [10]  357 	ld	hl,#0x0603
   57B7 E5            [11]  358 	push	hl
   57B8 D5            [11]  359 	push	de
   57B9 21 28 3C      [10]  360 	ld	hl,#_g_heart
   57BC E5            [11]  361 	push	hl
   57BD CD F9 58      [17]  362 	call	_cpct_drawSprite
   57C0 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   57C1 03            [ 6]  365 	inc	bc
   57C2 79            [ 4]  366 	ld	a,c
   57C3 D6 05         [ 7]  367 	sub	a, #0x05
   57C5 78            [ 4]  368 	ld	a,b
   57C6 17            [ 4]  369 	rla
   57C7 3F            [ 4]  370 	ccf
   57C8 1F            [ 4]  371 	rra
   57C9 DE 80         [ 7]  372 	sbc	a, #0x80
   57CB 38 D2         [12]  373 	jr	C,00102$
   57CD DD E1         [14]  374 	pop	ix
   57CF C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   57D0                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   57D0 FD 21 02 00   [14]  382 	ld	iy,#2
   57D4 FD 39         [15]  383 	add	iy,sp
   57D6 FD 7E 00      [19]  384 	ld	a,0 (iy)
   57D9 C6 0A         [ 7]  385 	add	a, #0x0A
   57DB 6F            [ 4]  386 	ld	l, a
   57DC FD 7E 01      [19]  387 	ld	a, 1 (iy)
   57DF CE 00         [ 7]  388 	adc	a, #0x00
   57E1 67            [ 4]  389 	ld	h, a
   57E2 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   57E3                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   57E3 21 02 00      [10]  397 	ld	hl, #2+0
   57E6 39            [11]  398 	add	hl, sp
   57E7 4E            [ 7]  399 	ld	c, (hl)
   57E8 0D            [ 4]  400 	dec	c
   57E9 69            [ 4]  401 	ld	l,c
   57EA C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
