                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module menu
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawStringM0
                             13 	.globl _cpct_drawCharM0
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _cpct_drawSprite
                             16 	.globl _cpct_isKeyPressed
                             17 	.globl _cpct_scanKeyboard_f
                             18 	.globl _cpct_memset
                             19 	.globl _menuFin
                             20 	.globl _borrarPantalla
                             21 	.globl _menuInstrucciones
                             22 	.globl _menuCreditos
                             23 	.globl _menuOpciones
                             24 	.globl _menuInicio
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/menu/menu.c:7: void menuFin(u16 puntuacion) __z88dk_fastcall {
                             57 ;	---------------------------------
                             58 ; Function menuFin
                             59 ; ---------------------------------
   762C                      60 _menuFin::
   762C DD E5         [15]   61 	push	ix
   762E DD 21 00 00   [14]   62 	ld	ix,#0
   7632 DD 39         [15]   63 	add	ix,sp
   7634 F5            [11]   64 	push	af
   7635 F5            [11]   65 	push	af
   7636 DD 75 FE      [19]   66 	ld	-2 (ix),l
   7639 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   763C 21 10 27      [10]   69 	ld	hl,#0x2710
   763F E5            [11]   70 	push	hl
   7640 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   7643 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   7646 E5            [11]   73 	push	hl
   7647 CD D0 7D      [17]   74 	call	__divuint
   764A F1            [10]   75 	pop	af
   764B F1            [10]   76 	pop	af
   764C 33            [ 6]   77 	inc	sp
   764D 33            [ 6]   78 	inc	sp
   764E E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   764F 21 00 40      [10]   81 	ld	hl,#0x4000
   7652 E5            [11]   82 	push	hl
   7653 AF            [ 4]   83 	xor	a, a
   7654 F5            [11]   84 	push	af
   7655 33            [ 6]   85 	inc	sp
   7656 26 C0         [ 7]   86 	ld	h, #0xC0
   7658 E5            [11]   87 	push	hl
   7659 CD 59 81      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   765C 21 18 5A      [10]   90 	ld	hl,#0x5A18
   765F E5            [11]   91 	push	hl
   7660 21 00 C0      [10]   92 	ld	hl,#0xC000
   7663 E5            [11]   93 	push	hl
   7664 CD 91 8A      [17]   94 	call	_cpct_getScreenPtr
   7667 4D            [ 4]   95 	ld	c,l
   7668 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7669 21 02 00      [10]   98 	ld	hl,#0x0002
   766C E5            [11]   99 	push	hl
   766D C5            [11]  100 	push	bc
   766E 21 8E 77      [10]  101 	ld	hl,#___str_0
   7671 E5            [11]  102 	push	hl
   7672 CD AA 7E      [17]  103 	call	_cpct_drawStringM0
   7675 21 06 00      [10]  104 	ld	hl,#6
   7678 39            [11]  105 	add	hl,sp
   7679 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   767A 21 14 78      [10]  108 	ld	hl,#0x7814
   767D E5            [11]  109 	push	hl
   767E 21 00 C0      [10]  110 	ld	hl,#0xC000
   7681 E5            [11]  111 	push	hl
   7682 CD 91 8A      [17]  112 	call	_cpct_getScreenPtr
   7685 4D            [ 4]  113 	ld	c,l
   7686 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   7687 21 02 00      [10]  116 	ld	hl,#0x0002
   768A E5            [11]  117 	push	hl
   768B C5            [11]  118 	push	bc
   768C 21 98 77      [10]  119 	ld	hl,#___str_1
   768F E5            [11]  120 	push	hl
   7690 CD AA 7E      [17]  121 	call	_cpct_drawStringM0
   7693 21 06 00      [10]  122 	ld	hl,#6
   7696 39            [11]  123 	add	hl,sp
   7697 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   7698 21 2D 78      [10]  126 	ld	hl,#0x782D
   769B E5            [11]  127 	push	hl
   769C 21 00 C0      [10]  128 	ld	hl,#0xC000
   769F E5            [11]  129 	push	hl
   76A0 CD 91 8A      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   76A3 E5            [11]  132 	push	hl
   76A4 21 0A 00      [10]  133 	ld	hl,#0x000A
   76A7 E5            [11]  134 	push	hl
   76A8 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   76AB DD 66 FD      [19]  136 	ld	h,-3 (ix)
   76AE E5            [11]  137 	push	hl
   76AF CD 86 8A      [17]  138 	call	__moduint
   76B2 F1            [10]  139 	pop	af
   76B3 F1            [10]  140 	pop	af
   76B4 C1            [10]  141 	pop	bc
   76B5 7D            [ 4]  142 	ld	a,l
   76B6 C6 30         [ 7]  143 	add	a, #0x30
   76B8 67            [ 4]  144 	ld	h,a
   76B9 59            [ 4]  145 	ld	e, c
   76BA 50            [ 4]  146 	ld	d, b
   76BB C5            [11]  147 	push	bc
   76BC E5            [11]  148 	push	hl
   76BD 33            [ 6]  149 	inc	sp
   76BE 21 02 00      [10]  150 	ld	hl,#0x0002
   76C1 E5            [11]  151 	push	hl
   76C2 D5            [11]  152 	push	de
   76C3 CD 02 80      [17]  153 	call	_cpct_drawCharM0
   76C6 F1            [10]  154 	pop	af
   76C7 33            [ 6]  155 	inc	sp
   76C8 21 E8 03      [10]  156 	ld	hl,#0x03E8
   76CB E3            [19]  157 	ex	(sp),hl
   76CC DD 6E FE      [19]  158 	ld	l,-2 (ix)
   76CF DD 66 FF      [19]  159 	ld	h,-1 (ix)
   76D2 E5            [11]  160 	push	hl
   76D3 CD D0 7D      [17]  161 	call	__divuint
   76D6 F1            [10]  162 	pop	af
   76D7 F1            [10]  163 	pop	af
   76D8 11 0A 00      [10]  164 	ld	de,#0x000A
   76DB D5            [11]  165 	push	de
   76DC E5            [11]  166 	push	hl
   76DD CD 86 8A      [17]  167 	call	__moduint
   76E0 F1            [10]  168 	pop	af
   76E1 F1            [10]  169 	pop	af
   76E2 C1            [10]  170 	pop	bc
   76E3 7D            [ 4]  171 	ld	a,l
   76E4 C6 30         [ 7]  172 	add	a, #0x30
   76E6 67            [ 4]  173 	ld	h,a
   76E7 79            [ 4]  174 	ld	a,c
   76E8 C6 04         [ 7]  175 	add	a, #0x04
   76EA 5F            [ 4]  176 	ld	e,a
   76EB 78            [ 4]  177 	ld	a,b
   76EC CE 00         [ 7]  178 	adc	a, #0x00
   76EE 57            [ 4]  179 	ld	d,a
   76EF C5            [11]  180 	push	bc
   76F0 E5            [11]  181 	push	hl
   76F1 33            [ 6]  182 	inc	sp
   76F2 21 02 00      [10]  183 	ld	hl,#0x0002
   76F5 E5            [11]  184 	push	hl
   76F6 D5            [11]  185 	push	de
   76F7 CD 02 80      [17]  186 	call	_cpct_drawCharM0
   76FA F1            [10]  187 	pop	af
   76FB 33            [ 6]  188 	inc	sp
   76FC 21 64 00      [10]  189 	ld	hl,#0x0064
   76FF E3            [19]  190 	ex	(sp),hl
   7700 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   7703 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   7706 E5            [11]  193 	push	hl
   7707 CD D0 7D      [17]  194 	call	__divuint
   770A F1            [10]  195 	pop	af
   770B F1            [10]  196 	pop	af
   770C 11 0A 00      [10]  197 	ld	de,#0x000A
   770F D5            [11]  198 	push	de
   7710 E5            [11]  199 	push	hl
   7711 CD 86 8A      [17]  200 	call	__moduint
   7714 F1            [10]  201 	pop	af
   7715 F1            [10]  202 	pop	af
   7716 C1            [10]  203 	pop	bc
   7717 7D            [ 4]  204 	ld	a,l
   7718 C6 30         [ 7]  205 	add	a, #0x30
   771A 67            [ 4]  206 	ld	h,a
   771B 79            [ 4]  207 	ld	a,c
   771C C6 08         [ 7]  208 	add	a, #0x08
   771E 5F            [ 4]  209 	ld	e,a
   771F 78            [ 4]  210 	ld	a,b
   7720 CE 00         [ 7]  211 	adc	a, #0x00
   7722 57            [ 4]  212 	ld	d,a
   7723 C5            [11]  213 	push	bc
   7724 E5            [11]  214 	push	hl
   7725 33            [ 6]  215 	inc	sp
   7726 21 02 00      [10]  216 	ld	hl,#0x0002
   7729 E5            [11]  217 	push	hl
   772A D5            [11]  218 	push	de
   772B CD 02 80      [17]  219 	call	_cpct_drawCharM0
   772E F1            [10]  220 	pop	af
   772F 33            [ 6]  221 	inc	sp
   7730 21 0A 00      [10]  222 	ld	hl,#0x000A
   7733 E3            [19]  223 	ex	(sp),hl
   7734 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   7737 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   773A E5            [11]  226 	push	hl
   773B CD D0 7D      [17]  227 	call	__divuint
   773E F1            [10]  228 	pop	af
   773F F1            [10]  229 	pop	af
   7740 11 0A 00      [10]  230 	ld	de,#0x000A
   7743 D5            [11]  231 	push	de
   7744 E5            [11]  232 	push	hl
   7745 CD 86 8A      [17]  233 	call	__moduint
   7748 F1            [10]  234 	pop	af
   7749 F1            [10]  235 	pop	af
   774A C1            [10]  236 	pop	bc
   774B 7D            [ 4]  237 	ld	a,l
   774C C6 30         [ 7]  238 	add	a, #0x30
   774E 67            [ 4]  239 	ld	h,a
   774F 79            [ 4]  240 	ld	a,c
   7750 C6 0C         [ 7]  241 	add	a, #0x0C
   7752 5F            [ 4]  242 	ld	e,a
   7753 78            [ 4]  243 	ld	a,b
   7754 CE 00         [ 7]  244 	adc	a, #0x00
   7756 57            [ 4]  245 	ld	d,a
   7757 C5            [11]  246 	push	bc
   7758 E5            [11]  247 	push	hl
   7759 33            [ 6]  248 	inc	sp
   775A 21 02 00      [10]  249 	ld	hl,#0x0002
   775D E5            [11]  250 	push	hl
   775E D5            [11]  251 	push	de
   775F CD 02 80      [17]  252 	call	_cpct_drawCharM0
   7762 F1            [10]  253 	pop	af
   7763 33            [ 6]  254 	inc	sp
   7764 21 0A 00      [10]  255 	ld	hl,#0x000A
   7767 E3            [19]  256 	ex	(sp),hl
   7768 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   776B DD 66 FF      [19]  258 	ld	h,-1 (ix)
   776E E5            [11]  259 	push	hl
   776F CD 86 8A      [17]  260 	call	__moduint
   7772 F1            [10]  261 	pop	af
   7773 F1            [10]  262 	pop	af
   7774 C1            [10]  263 	pop	bc
   7775 7D            [ 4]  264 	ld	a,l
   7776 C6 30         [ 7]  265 	add	a, #0x30
   7778 57            [ 4]  266 	ld	d,a
   7779 21 10 00      [10]  267 	ld	hl,#0x0010
   777C 09            [11]  268 	add	hl,bc
   777D 4D            [ 4]  269 	ld	c,l
   777E 44            [ 4]  270 	ld	b,h
   777F D5            [11]  271 	push	de
   7780 33            [ 6]  272 	inc	sp
   7781 21 02 00      [10]  273 	ld	hl,#0x0002
   7784 E5            [11]  274 	push	hl
   7785 C5            [11]  275 	push	bc
   7786 CD 02 80      [17]  276 	call	_cpct_drawCharM0
   7789 F1            [10]  277 	pop	af
   778A F1            [10]  278 	pop	af
   778B 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   778C                     281 00102$:
   778C 18 FE         [12]  282 	jr	00102$
   778E                     283 ___str_0:
   778E 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   7797 00                  285 	.db 0x00
   7798                     286 ___str_1:
   7798 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   779F 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   77A0                     293 _borrarPantalla::
   77A0 DD E5         [15]  294 	push	ix
   77A2 DD 21 00 00   [14]  295 	ld	ix,#0
   77A6 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   77A8 3E 28         [ 7]  298 	ld	a,#0x28
   77AA DD 96 06      [19]  299 	sub	a, 6 (ix)
   77AD 3E 00         [ 7]  300 	ld	a,#0x00
   77AF 17            [ 4]  301 	rla
   77B0 4F            [ 4]  302 	ld	c,a
   77B1 CB 41         [ 8]  303 	bit	0,c
   77B3 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   77B5 DD 66 05      [19]  306 	ld	h,5 (ix)
   77B8 DD 6E 04      [19]  307 	ld	l,4 (ix)
   77BB E5            [11]  308 	push	hl
   77BC 21 00 C0      [10]  309 	ld	hl,#0xC000
   77BF E5            [11]  310 	push	hl
   77C0 CD 91 8A      [17]  311 	call	_cpct_getScreenPtr
   77C3 4D            [ 4]  312 	ld	c,l
   77C4 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   77C5 DD 66 07      [19]  315 	ld	h,7 (ix)
   77C8 DD 6E 06      [19]  316 	ld	l,6 (ix)
   77CB E5            [11]  317 	push	hl
   77CC AF            [ 4]  318 	xor	a, a
   77CD F5            [11]  319 	push	af
   77CE 33            [ 6]  320 	inc	sp
   77CF C5            [11]  321 	push	bc
   77D0 CD A0 89      [17]  322 	call	_cpct_drawSolidBox
   77D3 F1            [10]  323 	pop	af
   77D4 F1            [10]  324 	pop	af
   77D5 33            [ 6]  325 	inc	sp
   77D6 18 51         [12]  326 	jr	00106$
   77D8                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   77D8 CB 41         [ 8]  329 	bit	0,c
   77DA 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   77DC DD 66 05      [19]  332 	ld	h,5 (ix)
   77DF DD 6E 04      [19]  333 	ld	l,4 (ix)
   77E2 E5            [11]  334 	push	hl
   77E3 21 00 C0      [10]  335 	ld	hl,#0xC000
   77E6 E5            [11]  336 	push	hl
   77E7 CD 91 8A      [17]  337 	call	_cpct_getScreenPtr
   77EA 4D            [ 4]  338 	ld	c,l
   77EB 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   77EC DD 7E 07      [19]  341 	ld	a,7 (ix)
   77EF F5            [11]  342 	push	af
   77F0 33            [ 6]  343 	inc	sp
   77F1 21 00 28      [10]  344 	ld	hl,#0x2800
   77F4 E5            [11]  345 	push	hl
   77F5 C5            [11]  346 	push	bc
   77F6 CD A0 89      [17]  347 	call	_cpct_drawSolidBox
   77F9 F1            [10]  348 	pop	af
   77FA F1            [10]  349 	pop	af
   77FB 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   77FC DD 7E 04      [19]  352 	ld	a,4 (ix)
   77FF C6 28         [ 7]  353 	add	a, #0x28
   7801 47            [ 4]  354 	ld	b,a
   7802 DD 7E 05      [19]  355 	ld	a,5 (ix)
   7805 F5            [11]  356 	push	af
   7806 33            [ 6]  357 	inc	sp
   7807 C5            [11]  358 	push	bc
   7808 33            [ 6]  359 	inc	sp
   7809 21 00 C0      [10]  360 	ld	hl,#0xC000
   780C E5            [11]  361 	push	hl
   780D CD 91 8A      [17]  362 	call	_cpct_getScreenPtr
   7810 4D            [ 4]  363 	ld	c,l
   7811 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   7812 DD 7E 06      [19]  366 	ld	a,6 (ix)
   7815 C6 D8         [ 7]  367 	add	a,#0xD8
   7817 57            [ 4]  368 	ld	d,a
   7818 DD 7E 07      [19]  369 	ld	a,7 (ix)
   781B F5            [11]  370 	push	af
   781C 33            [ 6]  371 	inc	sp
   781D D5            [11]  372 	push	de
   781E 33            [ 6]  373 	inc	sp
   781F AF            [ 4]  374 	xor	a, a
   7820 F5            [11]  375 	push	af
   7821 33            [ 6]  376 	inc	sp
   7822 C5            [11]  377 	push	bc
   7823 CD A0 89      [17]  378 	call	_cpct_drawSolidBox
   7826 F1            [10]  379 	pop	af
   7827 F1            [10]  380 	pop	af
   7828 33            [ 6]  381 	inc	sp
   7829                     382 00106$:
   7829 DD E1         [14]  383 	pop	ix
   782B C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   782C                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   782C 21 50 82      [10]  391 	ld	hl,#0x8250
   782F E5            [11]  392 	push	hl
   7830 21 00 1E      [10]  393 	ld	hl,#0x1E00
   7833 E5            [11]  394 	push	hl
   7834 CD A0 77      [17]  395 	call	_borrarPantalla
   7837 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   7838 21 10 55      [10]  398 	ld	hl, #0x5510
   783B E3            [19]  399 	ex	(sp),hl
   783C 21 00 C0      [10]  400 	ld	hl,#0xC000
   783F E5            [11]  401 	push	hl
   7840 CD 91 8A      [17]  402 	call	_cpct_getScreenPtr
   7843 4D            [ 4]  403 	ld	c,l
   7844 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   7845 21 02 00      [10]  406 	ld	hl,#0x0002
   7848 E5            [11]  407 	push	hl
   7849 C5            [11]  408 	push	bc
   784A 21 1A 79      [10]  409 	ld	hl,#___str_2
   784D E5            [11]  410 	push	hl
   784E CD AA 7E      [17]  411 	call	_cpct_drawStringM0
   7851 21 06 00      [10]  412 	ld	hl,#6
   7854 39            [11]  413 	add	hl,sp
   7855 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   7856 21 04 73      [10]  416 	ld	hl,#0x7304
   7859 E5            [11]  417 	push	hl
   785A 21 00 C0      [10]  418 	ld	hl,#0xC000
   785D E5            [11]  419 	push	hl
   785E CD 91 8A      [17]  420 	call	_cpct_getScreenPtr
   7861 4D            [ 4]  421 	ld	c,l
   7862 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7863 21 05 0A      [10]  424 	ld	hl,#0x0A05
   7866 E5            [11]  425 	push	hl
   7867 C5            [11]  426 	push	bc
   7868 21 A8 4A      [10]  427 	ld	hl,#_g_arrows_0
   786B E5            [11]  428 	push	hl
   786C CD CE 7E      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   786F 21 0E 73      [10]  431 	ld	hl,#0x730E
   7872 E5            [11]  432 	push	hl
   7873 21 00 C0      [10]  433 	ld	hl,#0xC000
   7876 E5            [11]  434 	push	hl
   7877 CD 91 8A      [17]  435 	call	_cpct_getScreenPtr
   787A 4D            [ 4]  436 	ld	c,l
   787B 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   787C 21 05 0A      [10]  439 	ld	hl,#0x0A05
   787F E5            [11]  440 	push	hl
   7880 C5            [11]  441 	push	bc
   7881 21 DA 4A      [10]  442 	ld	hl,#_g_arrows_1
   7884 E5            [11]  443 	push	hl
   7885 CD CE 7E      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   7888 21 18 73      [10]  446 	ld	hl,#0x7318
   788B E5            [11]  447 	push	hl
   788C 21 00 C0      [10]  448 	ld	hl,#0xC000
   788F E5            [11]  449 	push	hl
   7890 CD 91 8A      [17]  450 	call	_cpct_getScreenPtr
   7893 4D            [ 4]  451 	ld	c,l
   7894 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7895 21 05 0A      [10]  454 	ld	hl,#0x0A05
   7898 E5            [11]  455 	push	hl
   7899 C5            [11]  456 	push	bc
   789A 21 0C 4B      [10]  457 	ld	hl,#_g_arrows_2
   789D E5            [11]  458 	push	hl
   789E CD CE 7E      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   78A1 21 22 73      [10]  461 	ld	hl,#0x7322
   78A4 E5            [11]  462 	push	hl
   78A5 21 00 C0      [10]  463 	ld	hl,#0xC000
   78A8 E5            [11]  464 	push	hl
   78A9 CD 91 8A      [17]  465 	call	_cpct_getScreenPtr
   78AC 4D            [ 4]  466 	ld	c,l
   78AD 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   78AE 21 05 0A      [10]  469 	ld	hl,#0x0A05
   78B1 E5            [11]  470 	push	hl
   78B2 C5            [11]  471 	push	bc
   78B3 21 3E 4B      [10]  472 	ld	hl,#_g_arrows_3
   78B6 E5            [11]  473 	push	hl
   78B7 CD CE 7E      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   78BA 21 2D 73      [10]  476 	ld	hl,#0x732D
   78BD E5            [11]  477 	push	hl
   78BE 21 00 C0      [10]  478 	ld	hl,#0xC000
   78C1 E5            [11]  479 	push	hl
   78C2 CD 91 8A      [17]  480 	call	_cpct_getScreenPtr
   78C5 4D            [ 4]  481 	ld	c,l
   78C6 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   78C7 21 02 00      [10]  484 	ld	hl,#0x0002
   78CA E5            [11]  485 	push	hl
   78CB C5            [11]  486 	push	bc
   78CC 21 27 79      [10]  487 	ld	hl,#___str_3
   78CF E5            [11]  488 	push	hl
   78D0 CD AA 7E      [17]  489 	call	_cpct_drawStringM0
   78D3 21 06 00      [10]  490 	ld	hl,#6
   78D6 39            [11]  491 	add	hl,sp
   78D7 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   78D8 21 04 82      [10]  494 	ld	hl,#0x8204
   78DB E5            [11]  495 	push	hl
   78DC 21 00 C0      [10]  496 	ld	hl,#0xC000
   78DF E5            [11]  497 	push	hl
   78E0 CD 91 8A      [17]  498 	call	_cpct_getScreenPtr
   78E3 4D            [ 4]  499 	ld	c,l
   78E4 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   78E5 21 02 00      [10]  502 	ld	hl,#0x0002
   78E8 E5            [11]  503 	push	hl
   78E9 C5            [11]  504 	push	bc
   78EA 21 30 79      [10]  505 	ld	hl,#___str_4
   78ED E5            [11]  506 	push	hl
   78EE CD AA 7E      [17]  507 	call	_cpct_drawStringM0
   78F1 21 06 00      [10]  508 	ld	hl,#6
   78F4 39            [11]  509 	add	hl,sp
   78F5 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   78F6                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   78F6 CD 11 7E      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   78F9 21 04 40      [10]  516 	ld	hl,#0x4004
   78FC CD 92 7E      [17]  517 	call	_cpct_isKeyPressed
   78FF 7D            [ 4]  518 	ld	a,l
   7900 B7            [ 4]  519 	or	a, a
   7901 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   7903 CD 22 7A      [17]  522 	call	_menuOpciones
   7906                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7906 21 07 10      [10]  525 	ld	hl,#0x1007
   7909 CD 92 7E      [17]  526 	call	_cpct_isKeyPressed
   790C 7D            [ 4]  527 	ld	a,l
   790D B7            [ 4]  528 	or	a, a
   790E C0            [11]  529 	ret	NZ
   790F 21 04 40      [10]  530 	ld	hl,#0x4004
   7912 CD 92 7E      [17]  531 	call	_cpct_isKeyPressed
   7915 7D            [ 4]  532 	ld	a,l
   7916 B7            [ 4]  533 	or	a, a
   7917 28 DD         [12]  534 	jr	Z,00104$
   7919 C9            [10]  535 	ret
   791A                     536 ___str_2:
   791A 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   7926 00                  538 	.db 0x00
   7927                     539 ___str_3:
   7927 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   792F 00                  541 	.db 0x00
   7930                     542 ___str_4:
   7930 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   7942 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   7943                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7943 21 50 82      [10]  551 	ld	hl,#0x8250
   7946 E5            [11]  552 	push	hl
   7947 21 00 1E      [10]  553 	ld	hl,#0x1E00
   794A E5            [11]  554 	push	hl
   794B CD A0 77      [17]  555 	call	_borrarPantalla
   794E F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   794F 21 1A 46      [10]  558 	ld	hl, #0x461A
   7952 E3            [19]  559 	ex	(sp),hl
   7953 21 00 C0      [10]  560 	ld	hl,#0xC000
   7956 E5            [11]  561 	push	hl
   7957 CD 91 8A      [17]  562 	call	_cpct_getScreenPtr
   795A 4D            [ 4]  563 	ld	c,l
   795B 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   795C 21 02 00      [10]  566 	ld	hl,#0x0002
   795F E5            [11]  567 	push	hl
   7960 C5            [11]  568 	push	bc
   7961 21 EB 79      [10]  569 	ld	hl,#___str_5
   7964 E5            [11]  570 	push	hl
   7965 CD AA 7E      [17]  571 	call	_cpct_drawStringM0
   7968 21 06 00      [10]  572 	ld	hl,#6
   796B 39            [11]  573 	add	hl,sp
   796C F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   796D 21 0A 64      [10]  576 	ld	hl,#0x640A
   7970 E5            [11]  577 	push	hl
   7971 21 00 C0      [10]  578 	ld	hl,#0xC000
   7974 E5            [11]  579 	push	hl
   7975 CD 91 8A      [17]  580 	call	_cpct_getScreenPtr
   7978 4D            [ 4]  581 	ld	c,l
   7979 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   797A 21 02 00      [10]  584 	ld	hl,#0x0002
   797D E5            [11]  585 	push	hl
   797E C5            [11]  586 	push	bc
   797F 21 F3 79      [10]  587 	ld	hl,#___str_6
   7982 E5            [11]  588 	push	hl
   7983 CD AA 7E      [17]  589 	call	_cpct_drawStringM0
   7986 21 06 00      [10]  590 	ld	hl,#6
   7989 39            [11]  591 	add	hl,sp
   798A F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   798B 21 0E 73      [10]  594 	ld	hl,#0x730E
   798E E5            [11]  595 	push	hl
   798F 21 00 C0      [10]  596 	ld	hl,#0xC000
   7992 E5            [11]  597 	push	hl
   7993 CD 91 8A      [17]  598 	call	_cpct_getScreenPtr
   7996 4D            [ 4]  599 	ld	c,l
   7997 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   7998 21 02 00      [10]  602 	ld	hl,#0x0002
   799B E5            [11]  603 	push	hl
   799C C5            [11]  604 	push	bc
   799D 21 03 7A      [10]  605 	ld	hl,#___str_7
   79A0 E5            [11]  606 	push	hl
   79A1 CD AA 7E      [17]  607 	call	_cpct_drawStringM0
   79A4 21 06 00      [10]  608 	ld	hl,#6
   79A7 39            [11]  609 	add	hl,sp
   79A8 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   79A9 21 08 82      [10]  612 	ld	hl,#0x8208
   79AC E5            [11]  613 	push	hl
   79AD 21 00 C0      [10]  614 	ld	hl,#0xC000
   79B0 E5            [11]  615 	push	hl
   79B1 CD 91 8A      [17]  616 	call	_cpct_getScreenPtr
   79B4 4D            [ 4]  617 	ld	c,l
   79B5 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   79B6 21 02 00      [10]  620 	ld	hl,#0x0002
   79B9 E5            [11]  621 	push	hl
   79BA C5            [11]  622 	push	bc
   79BB 21 11 7A      [10]  623 	ld	hl,#___str_8
   79BE E5            [11]  624 	push	hl
   79BF CD AA 7E      [17]  625 	call	_cpct_drawStringM0
   79C2 21 06 00      [10]  626 	ld	hl,#6
   79C5 39            [11]  627 	add	hl,sp
   79C6 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   79C7                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   79C7 CD 11 7E      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   79CA 21 04 40      [10]  634 	ld	hl,#0x4004
   79CD CD 92 7E      [17]  635 	call	_cpct_isKeyPressed
   79D0 7D            [ 4]  636 	ld	a,l
   79D1 B7            [ 4]  637 	or	a, a
   79D2 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   79D4 CD 22 7A      [17]  640 	call	_menuOpciones
   79D7                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   79D7 21 07 10      [10]  643 	ld	hl,#0x1007
   79DA CD 92 7E      [17]  644 	call	_cpct_isKeyPressed
   79DD 7D            [ 4]  645 	ld	a,l
   79DE B7            [ 4]  646 	or	a, a
   79DF C0            [11]  647 	ret	NZ
   79E0 21 04 40      [10]  648 	ld	hl,#0x4004
   79E3 CD 92 7E      [17]  649 	call	_cpct_isKeyPressed
   79E6 7D            [ 4]  650 	ld	a,l
   79E7 B7            [ 4]  651 	or	a, a
   79E8 28 DD         [12]  652 	jr	Z,00104$
   79EA C9            [10]  653 	ret
   79EB                     654 ___str_5:
   79EB 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   79F2 00                  656 	.db 0x00
   79F3                     657 ___str_6:
   79F3 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   7A02 00                  659 	.db 0x00
   7A03                     660 ___str_7:
   7A03 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   7A10 00                  662 	.db 0x00
   7A11                     663 ___str_8:
   7A11 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   7A21 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   7A22                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7A22 21 50 82      [10]  672 	ld	hl,#0x8250
   7A25 E5            [11]  673 	push	hl
   7A26 21 00 1E      [10]  674 	ld	hl,#0x1E00
   7A29 E5            [11]  675 	push	hl
   7A2A CD A0 77      [17]  676 	call	_borrarPantalla
   7A2D F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   7A2E 21 20 64      [10]  679 	ld	hl, #0x6420
   7A31 E3            [19]  680 	ex	(sp),hl
   7A32 21 00 C0      [10]  681 	ld	hl,#0xC000
   7A35 E5            [11]  682 	push	hl
   7A36 CD 91 8A      [17]  683 	call	_cpct_getScreenPtr
   7A39 4D            [ 4]  684 	ld	c,l
   7A3A 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   7A3B 21 02 00      [10]  687 	ld	hl,#0x0002
   7A3E E5            [11]  688 	push	hl
   7A3F C5            [11]  689 	push	bc
   7A40 21 C3 7A      [10]  690 	ld	hl,#___str_9
   7A43 E5            [11]  691 	push	hl
   7A44 CD AA 7E      [17]  692 	call	_cpct_drawStringM0
   7A47 21 06 00      [10]  693 	ld	hl,#6
   7A4A 39            [11]  694 	add	hl,sp
   7A4B F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   7A4C 21 00 82      [10]  697 	ld	hl,#0x8200
   7A4F E5            [11]  698 	push	hl
   7A50 26 C0         [ 7]  699 	ld	h, #0xC0
   7A52 E5            [11]  700 	push	hl
   7A53 CD 91 8A      [17]  701 	call	_cpct_getScreenPtr
   7A56 4D            [ 4]  702 	ld	c,l
   7A57 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   7A58 21 02 00      [10]  705 	ld	hl,#0x0002
   7A5B E5            [11]  706 	push	hl
   7A5C C5            [11]  707 	push	bc
   7A5D 21 C8 7A      [10]  708 	ld	hl,#___str_10
   7A60 E5            [11]  709 	push	hl
   7A61 CD AA 7E      [17]  710 	call	_cpct_drawStringM0
   7A64 21 06 00      [10]  711 	ld	hl,#6
   7A67 39            [11]  712 	add	hl,sp
   7A68 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   7A69 21 0A 91      [10]  715 	ld	hl,#0x910A
   7A6C E5            [11]  716 	push	hl
   7A6D 21 00 C0      [10]  717 	ld	hl,#0xC000
   7A70 E5            [11]  718 	push	hl
   7A71 CD 91 8A      [17]  719 	call	_cpct_getScreenPtr
   7A74 4D            [ 4]  720 	ld	c,l
   7A75 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   7A76 21 02 00      [10]  723 	ld	hl,#0x0002
   7A79 E5            [11]  724 	push	hl
   7A7A C5            [11]  725 	push	bc
   7A7B 21 DD 7A      [10]  726 	ld	hl,#___str_11
   7A7E E5            [11]  727 	push	hl
   7A7F CD AA 7E      [17]  728 	call	_cpct_drawStringM0
   7A82 21 06 00      [10]  729 	ld	hl,#6
   7A85 39            [11]  730 	add	hl,sp
   7A86 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   7A87                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   7A87 CD 11 7E      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   7A8A 21 04 08      [10]  737 	ld	hl,#0x0804
   7A8D CD 92 7E      [17]  738 	call	_cpct_isKeyPressed
   7A90 7D            [ 4]  739 	ld	a,l
   7A91 B7            [ 4]  740 	or	a, a
   7A92 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   7A94 CD 2C 78      [17]  743 	call	_menuInstrucciones
   7A97 18 0D         [12]  744 	jr	00109$
   7A99                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   7A99 21 07 40      [10]  747 	ld	hl,#0x4007
   7A9C CD 92 7E      [17]  748 	call	_cpct_isKeyPressed
   7A9F 7D            [ 4]  749 	ld	a,l
   7AA0 B7            [ 4]  750 	or	a, a
   7AA1 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   7AA3 CD 43 79      [17]  753 	call	_menuCreditos
   7AA6                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   7AA6 21 07 10      [10]  756 	ld	hl,#0x1007
   7AA9 CD 92 7E      [17]  757 	call	_cpct_isKeyPressed
   7AAC 7D            [ 4]  758 	ld	a,l
   7AAD B7            [ 4]  759 	or	a, a
   7AAE C0            [11]  760 	ret	NZ
   7AAF 21 04 08      [10]  761 	ld	hl,#0x0804
   7AB2 CD 92 7E      [17]  762 	call	_cpct_isKeyPressed
   7AB5 7D            [ 4]  763 	ld	a,l
   7AB6 B7            [ 4]  764 	or	a, a
   7AB7 C0            [11]  765 	ret	NZ
   7AB8 21 07 40      [10]  766 	ld	hl,#0x4007
   7ABB CD 92 7E      [17]  767 	call	_cpct_isKeyPressed
   7ABE 7D            [ 4]  768 	ld	a,l
   7ABF B7            [ 4]  769 	or	a, a
   7AC0 28 C5         [12]  770 	jr	Z,00108$
   7AC2 C9            [10]  771 	ret
   7AC3                     772 ___str_9:
   7AC3 4D 45 4E 55         773 	.ascii "MENU"
   7AC7 00                  774 	.db 0x00
   7AC8                     775 ___str_10:
   7AC8 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   7ADC 00                  777 	.db 0x00
   7ADD                     778 ___str_11:
   7ADD 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   7AEC 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   7AED                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   7AED 21 00 40      [10]  787 	ld	hl,#0x4000
   7AF0 E5            [11]  788 	push	hl
   7AF1 AF            [ 4]  789 	xor	a, a
   7AF2 F5            [11]  790 	push	af
   7AF3 33            [ 6]  791 	inc	sp
   7AF4 26 C0         [ 7]  792 	ld	h, #0xC0
   7AF6 E5            [11]  793 	push	hl
   7AF7 CD 59 81      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   7AFA 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   7AFD E5            [11]  797 	push	hl
   7AFE 21 00 C0      [10]  798 	ld	hl,#0xC000
   7B01 E5            [11]  799 	push	hl
   7B02 CD 91 8A      [17]  800 	call	_cpct_getScreenPtr
   7B05 4D            [ 4]  801 	ld	c,l
   7B06 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   7B07 21 04 00      [10]  804 	ld	hl,#0x0004
   7B0A E5            [11]  805 	push	hl
   7B0B C5            [11]  806 	push	bc
   7B0C 21 A3 7B      [10]  807 	ld	hl,#___str_12
   7B0F E5            [11]  808 	push	hl
   7B10 CD AA 7E      [17]  809 	call	_cpct_drawStringM0
   7B13 21 06 00      [10]  810 	ld	hl,#6
   7B16 39            [11]  811 	add	hl,sp
   7B17 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   7B18 21 28 6E      [10]  814 	ld	hl,#0x6E28
   7B1B E5            [11]  815 	push	hl
   7B1C 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   7B1F E5            [11]  817 	push	hl
   7B20 21 C8 4B      [10]  818 	ld	hl,#_g_text_0
   7B23 E5            [11]  819 	push	hl
   7B24 CD CE 7E      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   7B27 21 28 6E      [10]  822 	ld	hl,#0x6E28
   7B2A E5            [11]  823 	push	hl
   7B2B 21 18 F1      [10]  824 	ld	hl,#0xF118
   7B2E E5            [11]  825 	push	hl
   7B2F 21 F8 5C      [10]  826 	ld	hl,#_g_text_1
   7B32 E5            [11]  827 	push	hl
   7B33 CD CE 7E      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   7B36 21 08 A0      [10]  830 	ld	hl,#0xA008
   7B39 E5            [11]  831 	push	hl
   7B3A 21 00 C0      [10]  832 	ld	hl,#0xC000
   7B3D E5            [11]  833 	push	hl
   7B3E CD 91 8A      [17]  834 	call	_cpct_getScreenPtr
   7B41 4D            [ 4]  835 	ld	c,l
   7B42 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   7B43 21 02 00      [10]  838 	ld	hl,#0x0002
   7B46 E5            [11]  839 	push	hl
   7B47 C5            [11]  840 	push	bc
   7B48 21 AB 7B      [10]  841 	ld	hl,#___str_13
   7B4B E5            [11]  842 	push	hl
   7B4C CD AA 7E      [17]  843 	call	_cpct_drawStringM0
   7B4F 21 06 00      [10]  844 	ld	hl,#6
   7B52 39            [11]  845 	add	hl,sp
   7B53 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   7B54 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   7B57 E5            [11]  849 	push	hl
   7B58 21 00 C0      [10]  850 	ld	hl,#0xC000
   7B5B E5            [11]  851 	push	hl
   7B5C CD 91 8A      [17]  852 	call	_cpct_getScreenPtr
   7B5F 4D            [ 4]  853 	ld	c,l
   7B60 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   7B61 21 02 00      [10]  856 	ld	hl,#0x0002
   7B64 E5            [11]  857 	push	hl
   7B65 C5            [11]  858 	push	bc
   7B66 21 BC 7B      [10]  859 	ld	hl,#___str_14
   7B69 E5            [11]  860 	push	hl
   7B6A CD AA 7E      [17]  861 	call	_cpct_drawStringM0
   7B6D 21 06 00      [10]  862 	ld	hl,#6
   7B70 39            [11]  863 	add	hl,sp
   7B71 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   7B72                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   7B72 CD 11 7E      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   7B75 21 04 40      [10]  870 	ld	hl,#0x4004
   7B78 CD 92 7E      [17]  871 	call	_cpct_isKeyPressed
   7B7B 7D            [ 4]  872 	ld	a,l
   7B7C B7            [ 4]  873 	or	a, a
   7B7D 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   7B7F CD 11 7E      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   7B82                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   7B82 CD 22 7A      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   7B85 21 07 10      [10]  882 	ld	hl,#0x1007
   7B88 CD 92 7E      [17]  883 	call	_cpct_isKeyPressed
   7B8B 7D            [ 4]  884 	ld	a,l
   7B8C B7            [ 4]  885 	or	a, a
   7B8D 28 F3         [12]  886 	jr	Z,00101$
   7B8F                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7B8F 21 07 10      [10]  889 	ld	hl,#0x1007
   7B92 CD 92 7E      [17]  890 	call	_cpct_isKeyPressed
   7B95 7D            [ 4]  891 	ld	a,l
   7B96 B7            [ 4]  892 	or	a, a
   7B97 C0            [11]  893 	ret	NZ
   7B98 21 04 40      [10]  894 	ld	hl,#0x4004
   7B9B CD 92 7E      [17]  895 	call	_cpct_isKeyPressed
   7B9E 7D            [ 4]  896 	ld	a,l
   7B9F B7            [ 4]  897 	or	a, a
   7BA0 28 D0         [12]  898 	jr	Z,00107$
   7BA2 C9            [10]  899 	ret
   7BA3                     900 ___str_12:
   7BA3 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   7BAA 00                  902 	.db 0x00
   7BAB                     903 ___str_13:
   7BAB 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   7BBB 00                  905 	.db 0x00
   7BBC                     906 ___str_14:
   7BBC 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   7BCB 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
