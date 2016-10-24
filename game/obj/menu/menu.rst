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
   5057                      60 _menuFin::
   5057 DD E5         [15]   61 	push	ix
   5059 DD 21 00 00   [14]   62 	ld	ix,#0
   505D DD 39         [15]   63 	add	ix,sp
   505F F5            [11]   64 	push	af
   5060 F5            [11]   65 	push	af
   5061 DD 75 FE      [19]   66 	ld	-2 (ix),l
   5064 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   5067 21 10 27      [10]   69 	ld	hl,#0x2710
   506A E5            [11]   70 	push	hl
   506B DD 6E FE      [19]   71 	ld	l,-2 (ix)
   506E DD 66 FF      [19]   72 	ld	h,-1 (ix)
   5071 E5            [11]   73 	push	hl
   5072 CD FB 57      [17]   74 	call	__divuint
   5075 F1            [10]   75 	pop	af
   5076 F1            [10]   76 	pop	af
   5077 33            [ 6]   77 	inc	sp
   5078 33            [ 6]   78 	inc	sp
   5079 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   507A 21 00 40      [10]   81 	ld	hl,#0x4000
   507D E5            [11]   82 	push	hl
   507E AF            [ 4]   83 	xor	a, a
   507F F5            [11]   84 	push	af
   5080 33            [ 6]   85 	inc	sp
   5081 26 C0         [ 7]   86 	ld	h, #0xC0
   5083 E5            [11]   87 	push	hl
   5084 CD 84 5B      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   5087 21 18 5A      [10]   90 	ld	hl,#0x5A18
   508A E5            [11]   91 	push	hl
   508B 21 00 C0      [10]   92 	ld	hl,#0xC000
   508E E5            [11]   93 	push	hl
   508F CD BC 64      [17]   94 	call	_cpct_getScreenPtr
   5092 4D            [ 4]   95 	ld	c,l
   5093 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   5094 21 02 00      [10]   98 	ld	hl,#0x0002
   5097 E5            [11]   99 	push	hl
   5098 C5            [11]  100 	push	bc
   5099 21 B9 51      [10]  101 	ld	hl,#___str_0
   509C E5            [11]  102 	push	hl
   509D CD D5 58      [17]  103 	call	_cpct_drawStringM0
   50A0 21 06 00      [10]  104 	ld	hl,#6
   50A3 39            [11]  105 	add	hl,sp
   50A4 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   50A5 21 14 78      [10]  108 	ld	hl,#0x7814
   50A8 E5            [11]  109 	push	hl
   50A9 21 00 C0      [10]  110 	ld	hl,#0xC000
   50AC E5            [11]  111 	push	hl
   50AD CD BC 64      [17]  112 	call	_cpct_getScreenPtr
   50B0 4D            [ 4]  113 	ld	c,l
   50B1 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   50B2 21 02 00      [10]  116 	ld	hl,#0x0002
   50B5 E5            [11]  117 	push	hl
   50B6 C5            [11]  118 	push	bc
   50B7 21 C3 51      [10]  119 	ld	hl,#___str_1
   50BA E5            [11]  120 	push	hl
   50BB CD D5 58      [17]  121 	call	_cpct_drawStringM0
   50BE 21 06 00      [10]  122 	ld	hl,#6
   50C1 39            [11]  123 	add	hl,sp
   50C2 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   50C3 21 2D 78      [10]  126 	ld	hl,#0x782D
   50C6 E5            [11]  127 	push	hl
   50C7 21 00 C0      [10]  128 	ld	hl,#0xC000
   50CA E5            [11]  129 	push	hl
   50CB CD BC 64      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   50CE E5            [11]  132 	push	hl
   50CF 21 0A 00      [10]  133 	ld	hl,#0x000A
   50D2 E5            [11]  134 	push	hl
   50D3 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   50D6 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   50D9 E5            [11]  137 	push	hl
   50DA CD B1 64      [17]  138 	call	__moduint
   50DD F1            [10]  139 	pop	af
   50DE F1            [10]  140 	pop	af
   50DF C1            [10]  141 	pop	bc
   50E0 7D            [ 4]  142 	ld	a,l
   50E1 C6 30         [ 7]  143 	add	a, #0x30
   50E3 67            [ 4]  144 	ld	h,a
   50E4 59            [ 4]  145 	ld	e, c
   50E5 50            [ 4]  146 	ld	d, b
   50E6 C5            [11]  147 	push	bc
   50E7 E5            [11]  148 	push	hl
   50E8 33            [ 6]  149 	inc	sp
   50E9 21 02 00      [10]  150 	ld	hl,#0x0002
   50EC E5            [11]  151 	push	hl
   50ED D5            [11]  152 	push	de
   50EE CD 2D 5A      [17]  153 	call	_cpct_drawCharM0
   50F1 F1            [10]  154 	pop	af
   50F2 33            [ 6]  155 	inc	sp
   50F3 21 E8 03      [10]  156 	ld	hl,#0x03E8
   50F6 E3            [19]  157 	ex	(sp),hl
   50F7 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   50FA DD 66 FF      [19]  159 	ld	h,-1 (ix)
   50FD E5            [11]  160 	push	hl
   50FE CD FB 57      [17]  161 	call	__divuint
   5101 F1            [10]  162 	pop	af
   5102 F1            [10]  163 	pop	af
   5103 11 0A 00      [10]  164 	ld	de,#0x000A
   5106 D5            [11]  165 	push	de
   5107 E5            [11]  166 	push	hl
   5108 CD B1 64      [17]  167 	call	__moduint
   510B F1            [10]  168 	pop	af
   510C F1            [10]  169 	pop	af
   510D C1            [10]  170 	pop	bc
   510E 7D            [ 4]  171 	ld	a,l
   510F C6 30         [ 7]  172 	add	a, #0x30
   5111 67            [ 4]  173 	ld	h,a
   5112 79            [ 4]  174 	ld	a,c
   5113 C6 04         [ 7]  175 	add	a, #0x04
   5115 5F            [ 4]  176 	ld	e,a
   5116 78            [ 4]  177 	ld	a,b
   5117 CE 00         [ 7]  178 	adc	a, #0x00
   5119 57            [ 4]  179 	ld	d,a
   511A C5            [11]  180 	push	bc
   511B E5            [11]  181 	push	hl
   511C 33            [ 6]  182 	inc	sp
   511D 21 02 00      [10]  183 	ld	hl,#0x0002
   5120 E5            [11]  184 	push	hl
   5121 D5            [11]  185 	push	de
   5122 CD 2D 5A      [17]  186 	call	_cpct_drawCharM0
   5125 F1            [10]  187 	pop	af
   5126 33            [ 6]  188 	inc	sp
   5127 21 64 00      [10]  189 	ld	hl,#0x0064
   512A E3            [19]  190 	ex	(sp),hl
   512B DD 6E FE      [19]  191 	ld	l,-2 (ix)
   512E DD 66 FF      [19]  192 	ld	h,-1 (ix)
   5131 E5            [11]  193 	push	hl
   5132 CD FB 57      [17]  194 	call	__divuint
   5135 F1            [10]  195 	pop	af
   5136 F1            [10]  196 	pop	af
   5137 11 0A 00      [10]  197 	ld	de,#0x000A
   513A D5            [11]  198 	push	de
   513B E5            [11]  199 	push	hl
   513C CD B1 64      [17]  200 	call	__moduint
   513F F1            [10]  201 	pop	af
   5140 F1            [10]  202 	pop	af
   5141 C1            [10]  203 	pop	bc
   5142 7D            [ 4]  204 	ld	a,l
   5143 C6 30         [ 7]  205 	add	a, #0x30
   5145 67            [ 4]  206 	ld	h,a
   5146 79            [ 4]  207 	ld	a,c
   5147 C6 08         [ 7]  208 	add	a, #0x08
   5149 5F            [ 4]  209 	ld	e,a
   514A 78            [ 4]  210 	ld	a,b
   514B CE 00         [ 7]  211 	adc	a, #0x00
   514D 57            [ 4]  212 	ld	d,a
   514E C5            [11]  213 	push	bc
   514F E5            [11]  214 	push	hl
   5150 33            [ 6]  215 	inc	sp
   5151 21 02 00      [10]  216 	ld	hl,#0x0002
   5154 E5            [11]  217 	push	hl
   5155 D5            [11]  218 	push	de
   5156 CD 2D 5A      [17]  219 	call	_cpct_drawCharM0
   5159 F1            [10]  220 	pop	af
   515A 33            [ 6]  221 	inc	sp
   515B 21 0A 00      [10]  222 	ld	hl,#0x000A
   515E E3            [19]  223 	ex	(sp),hl
   515F DD 6E FE      [19]  224 	ld	l,-2 (ix)
   5162 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   5165 E5            [11]  226 	push	hl
   5166 CD FB 57      [17]  227 	call	__divuint
   5169 F1            [10]  228 	pop	af
   516A F1            [10]  229 	pop	af
   516B 11 0A 00      [10]  230 	ld	de,#0x000A
   516E D5            [11]  231 	push	de
   516F E5            [11]  232 	push	hl
   5170 CD B1 64      [17]  233 	call	__moduint
   5173 F1            [10]  234 	pop	af
   5174 F1            [10]  235 	pop	af
   5175 C1            [10]  236 	pop	bc
   5176 7D            [ 4]  237 	ld	a,l
   5177 C6 30         [ 7]  238 	add	a, #0x30
   5179 67            [ 4]  239 	ld	h,a
   517A 79            [ 4]  240 	ld	a,c
   517B C6 0C         [ 7]  241 	add	a, #0x0C
   517D 5F            [ 4]  242 	ld	e,a
   517E 78            [ 4]  243 	ld	a,b
   517F CE 00         [ 7]  244 	adc	a, #0x00
   5181 57            [ 4]  245 	ld	d,a
   5182 C5            [11]  246 	push	bc
   5183 E5            [11]  247 	push	hl
   5184 33            [ 6]  248 	inc	sp
   5185 21 02 00      [10]  249 	ld	hl,#0x0002
   5188 E5            [11]  250 	push	hl
   5189 D5            [11]  251 	push	de
   518A CD 2D 5A      [17]  252 	call	_cpct_drawCharM0
   518D F1            [10]  253 	pop	af
   518E 33            [ 6]  254 	inc	sp
   518F 21 0A 00      [10]  255 	ld	hl,#0x000A
   5192 E3            [19]  256 	ex	(sp),hl
   5193 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   5196 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   5199 E5            [11]  259 	push	hl
   519A CD B1 64      [17]  260 	call	__moduint
   519D F1            [10]  261 	pop	af
   519E F1            [10]  262 	pop	af
   519F C1            [10]  263 	pop	bc
   51A0 7D            [ 4]  264 	ld	a,l
   51A1 C6 30         [ 7]  265 	add	a, #0x30
   51A3 57            [ 4]  266 	ld	d,a
   51A4 21 10 00      [10]  267 	ld	hl,#0x0010
   51A7 09            [11]  268 	add	hl,bc
   51A8 4D            [ 4]  269 	ld	c,l
   51A9 44            [ 4]  270 	ld	b,h
   51AA D5            [11]  271 	push	de
   51AB 33            [ 6]  272 	inc	sp
   51AC 21 02 00      [10]  273 	ld	hl,#0x0002
   51AF E5            [11]  274 	push	hl
   51B0 C5            [11]  275 	push	bc
   51B1 CD 2D 5A      [17]  276 	call	_cpct_drawCharM0
   51B4 F1            [10]  277 	pop	af
   51B5 F1            [10]  278 	pop	af
   51B6 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   51B7                     281 00102$:
   51B7 18 FE         [12]  282 	jr	00102$
   51B9                     283 ___str_0:
   51B9 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   51C2 00                  285 	.db 0x00
   51C3                     286 ___str_1:
   51C3 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   51CA 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   51CB                     293 _borrarPantalla::
   51CB DD E5         [15]  294 	push	ix
   51CD DD 21 00 00   [14]  295 	ld	ix,#0
   51D1 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   51D3 3E 28         [ 7]  298 	ld	a,#0x28
   51D5 DD 96 06      [19]  299 	sub	a, 6 (ix)
   51D8 3E 00         [ 7]  300 	ld	a,#0x00
   51DA 17            [ 4]  301 	rla
   51DB 4F            [ 4]  302 	ld	c,a
   51DC CB 41         [ 8]  303 	bit	0,c
   51DE 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   51E0 DD 66 05      [19]  306 	ld	h,5 (ix)
   51E3 DD 6E 04      [19]  307 	ld	l,4 (ix)
   51E6 E5            [11]  308 	push	hl
   51E7 21 00 C0      [10]  309 	ld	hl,#0xC000
   51EA E5            [11]  310 	push	hl
   51EB CD BC 64      [17]  311 	call	_cpct_getScreenPtr
   51EE 4D            [ 4]  312 	ld	c,l
   51EF 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   51F0 DD 66 07      [19]  315 	ld	h,7 (ix)
   51F3 DD 6E 06      [19]  316 	ld	l,6 (ix)
   51F6 E5            [11]  317 	push	hl
   51F7 AF            [ 4]  318 	xor	a, a
   51F8 F5            [11]  319 	push	af
   51F9 33            [ 6]  320 	inc	sp
   51FA C5            [11]  321 	push	bc
   51FB CD CB 63      [17]  322 	call	_cpct_drawSolidBox
   51FE F1            [10]  323 	pop	af
   51FF F1            [10]  324 	pop	af
   5200 33            [ 6]  325 	inc	sp
   5201 18 51         [12]  326 	jr	00106$
   5203                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   5203 CB 41         [ 8]  329 	bit	0,c
   5205 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   5207 DD 66 05      [19]  332 	ld	h,5 (ix)
   520A DD 6E 04      [19]  333 	ld	l,4 (ix)
   520D E5            [11]  334 	push	hl
   520E 21 00 C0      [10]  335 	ld	hl,#0xC000
   5211 E5            [11]  336 	push	hl
   5212 CD BC 64      [17]  337 	call	_cpct_getScreenPtr
   5215 4D            [ 4]  338 	ld	c,l
   5216 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   5217 DD 7E 07      [19]  341 	ld	a,7 (ix)
   521A F5            [11]  342 	push	af
   521B 33            [ 6]  343 	inc	sp
   521C 21 00 28      [10]  344 	ld	hl,#0x2800
   521F E5            [11]  345 	push	hl
   5220 C5            [11]  346 	push	bc
   5221 CD CB 63      [17]  347 	call	_cpct_drawSolidBox
   5224 F1            [10]  348 	pop	af
   5225 F1            [10]  349 	pop	af
   5226 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   5227 DD 7E 04      [19]  352 	ld	a,4 (ix)
   522A C6 28         [ 7]  353 	add	a, #0x28
   522C 47            [ 4]  354 	ld	b,a
   522D DD 7E 05      [19]  355 	ld	a,5 (ix)
   5230 F5            [11]  356 	push	af
   5231 33            [ 6]  357 	inc	sp
   5232 C5            [11]  358 	push	bc
   5233 33            [ 6]  359 	inc	sp
   5234 21 00 C0      [10]  360 	ld	hl,#0xC000
   5237 E5            [11]  361 	push	hl
   5238 CD BC 64      [17]  362 	call	_cpct_getScreenPtr
   523B 4D            [ 4]  363 	ld	c,l
   523C 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   523D DD 7E 06      [19]  366 	ld	a,6 (ix)
   5240 C6 D8         [ 7]  367 	add	a,#0xD8
   5242 57            [ 4]  368 	ld	d,a
   5243 DD 7E 07      [19]  369 	ld	a,7 (ix)
   5246 F5            [11]  370 	push	af
   5247 33            [ 6]  371 	inc	sp
   5248 D5            [11]  372 	push	de
   5249 33            [ 6]  373 	inc	sp
   524A AF            [ 4]  374 	xor	a, a
   524B F5            [11]  375 	push	af
   524C 33            [ 6]  376 	inc	sp
   524D C5            [11]  377 	push	bc
   524E CD CB 63      [17]  378 	call	_cpct_drawSolidBox
   5251 F1            [10]  379 	pop	af
   5252 F1            [10]  380 	pop	af
   5253 33            [ 6]  381 	inc	sp
   5254                     382 00106$:
   5254 DD E1         [14]  383 	pop	ix
   5256 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   5257                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   5257 21 50 82      [10]  391 	ld	hl,#0x8250
   525A E5            [11]  392 	push	hl
   525B 21 00 1E      [10]  393 	ld	hl,#0x1E00
   525E E5            [11]  394 	push	hl
   525F CD CB 51      [17]  395 	call	_borrarPantalla
   5262 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   5263 21 10 55      [10]  398 	ld	hl, #0x5510
   5266 E3            [19]  399 	ex	(sp),hl
   5267 21 00 C0      [10]  400 	ld	hl,#0xC000
   526A E5            [11]  401 	push	hl
   526B CD BC 64      [17]  402 	call	_cpct_getScreenPtr
   526E 4D            [ 4]  403 	ld	c,l
   526F 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   5270 21 02 00      [10]  406 	ld	hl,#0x0002
   5273 E5            [11]  407 	push	hl
   5274 C5            [11]  408 	push	bc
   5275 21 45 53      [10]  409 	ld	hl,#___str_2
   5278 E5            [11]  410 	push	hl
   5279 CD D5 58      [17]  411 	call	_cpct_drawStringM0
   527C 21 06 00      [10]  412 	ld	hl,#6
   527F 39            [11]  413 	add	hl,sp
   5280 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   5281 21 04 73      [10]  416 	ld	hl,#0x7304
   5284 E5            [11]  417 	push	hl
   5285 21 00 C0      [10]  418 	ld	hl,#0xC000
   5288 E5            [11]  419 	push	hl
   5289 CD BC 64      [17]  420 	call	_cpct_getScreenPtr
   528C 4D            [ 4]  421 	ld	c,l
   528D 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   528E 21 05 0A      [10]  424 	ld	hl,#0x0A05
   5291 E5            [11]  425 	push	hl
   5292 C5            [11]  426 	push	bc
   5293 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   5296 E5            [11]  428 	push	hl
   5297 CD F9 58      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   529A 21 0E 73      [10]  431 	ld	hl,#0x730E
   529D E5            [11]  432 	push	hl
   529E 21 00 C0      [10]  433 	ld	hl,#0xC000
   52A1 E5            [11]  434 	push	hl
   52A2 CD BC 64      [17]  435 	call	_cpct_getScreenPtr
   52A5 4D            [ 4]  436 	ld	c,l
   52A6 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   52A7 21 05 0A      [10]  439 	ld	hl,#0x0A05
   52AA E5            [11]  440 	push	hl
   52AB C5            [11]  441 	push	bc
   52AC 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   52AF E5            [11]  443 	push	hl
   52B0 CD F9 58      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   52B3 21 18 73      [10]  446 	ld	hl,#0x7318
   52B6 E5            [11]  447 	push	hl
   52B7 21 00 C0      [10]  448 	ld	hl,#0xC000
   52BA E5            [11]  449 	push	hl
   52BB CD BC 64      [17]  450 	call	_cpct_getScreenPtr
   52BE 4D            [ 4]  451 	ld	c,l
   52BF 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   52C0 21 05 0A      [10]  454 	ld	hl,#0x0A05
   52C3 E5            [11]  455 	push	hl
   52C4 C5            [11]  456 	push	bc
   52C5 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   52C8 E5            [11]  458 	push	hl
   52C9 CD F9 58      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   52CC 21 22 73      [10]  461 	ld	hl,#0x7322
   52CF E5            [11]  462 	push	hl
   52D0 21 00 C0      [10]  463 	ld	hl,#0xC000
   52D3 E5            [11]  464 	push	hl
   52D4 CD BC 64      [17]  465 	call	_cpct_getScreenPtr
   52D7 4D            [ 4]  466 	ld	c,l
   52D8 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   52D9 21 05 0A      [10]  469 	ld	hl,#0x0A05
   52DC E5            [11]  470 	push	hl
   52DD C5            [11]  471 	push	bc
   52DE 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   52E1 E5            [11]  473 	push	hl
   52E2 CD F9 58      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   52E5 21 2D 73      [10]  476 	ld	hl,#0x732D
   52E8 E5            [11]  477 	push	hl
   52E9 21 00 C0      [10]  478 	ld	hl,#0xC000
   52EC E5            [11]  479 	push	hl
   52ED CD BC 64      [17]  480 	call	_cpct_getScreenPtr
   52F0 4D            [ 4]  481 	ld	c,l
   52F1 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   52F2 21 02 00      [10]  484 	ld	hl,#0x0002
   52F5 E5            [11]  485 	push	hl
   52F6 C5            [11]  486 	push	bc
   52F7 21 52 53      [10]  487 	ld	hl,#___str_3
   52FA E5            [11]  488 	push	hl
   52FB CD D5 58      [17]  489 	call	_cpct_drawStringM0
   52FE 21 06 00      [10]  490 	ld	hl,#6
   5301 39            [11]  491 	add	hl,sp
   5302 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   5303 21 04 82      [10]  494 	ld	hl,#0x8204
   5306 E5            [11]  495 	push	hl
   5307 21 00 C0      [10]  496 	ld	hl,#0xC000
   530A E5            [11]  497 	push	hl
   530B CD BC 64      [17]  498 	call	_cpct_getScreenPtr
   530E 4D            [ 4]  499 	ld	c,l
   530F 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   5310 21 02 00      [10]  502 	ld	hl,#0x0002
   5313 E5            [11]  503 	push	hl
   5314 C5            [11]  504 	push	bc
   5315 21 5B 53      [10]  505 	ld	hl,#___str_4
   5318 E5            [11]  506 	push	hl
   5319 CD D5 58      [17]  507 	call	_cpct_drawStringM0
   531C 21 06 00      [10]  508 	ld	hl,#6
   531F 39            [11]  509 	add	hl,sp
   5320 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   5321                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   5321 CD 3C 58      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   5324 21 04 40      [10]  516 	ld	hl,#0x4004
   5327 CD BD 58      [17]  517 	call	_cpct_isKeyPressed
   532A 7D            [ 4]  518 	ld	a,l
   532B B7            [ 4]  519 	or	a, a
   532C 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   532E CD 4D 54      [17]  522 	call	_menuOpciones
   5331                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5331 21 07 10      [10]  525 	ld	hl,#0x1007
   5334 CD BD 58      [17]  526 	call	_cpct_isKeyPressed
   5337 7D            [ 4]  527 	ld	a,l
   5338 B7            [ 4]  528 	or	a, a
   5339 C0            [11]  529 	ret	NZ
   533A 21 04 40      [10]  530 	ld	hl,#0x4004
   533D CD BD 58      [17]  531 	call	_cpct_isKeyPressed
   5340 7D            [ 4]  532 	ld	a,l
   5341 B7            [ 4]  533 	or	a, a
   5342 28 DD         [12]  534 	jr	Z,00104$
   5344 C9            [10]  535 	ret
   5345                     536 ___str_2:
   5345 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   5351 00                  538 	.db 0x00
   5352                     539 ___str_3:
   5352 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   535A 00                  541 	.db 0x00
   535B                     542 ___str_4:
   535B 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   536D 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   536E                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   536E 21 50 82      [10]  551 	ld	hl,#0x8250
   5371 E5            [11]  552 	push	hl
   5372 21 00 1E      [10]  553 	ld	hl,#0x1E00
   5375 E5            [11]  554 	push	hl
   5376 CD CB 51      [17]  555 	call	_borrarPantalla
   5379 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   537A 21 1A 46      [10]  558 	ld	hl, #0x461A
   537D E3            [19]  559 	ex	(sp),hl
   537E 21 00 C0      [10]  560 	ld	hl,#0xC000
   5381 E5            [11]  561 	push	hl
   5382 CD BC 64      [17]  562 	call	_cpct_getScreenPtr
   5385 4D            [ 4]  563 	ld	c,l
   5386 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   5387 21 02 00      [10]  566 	ld	hl,#0x0002
   538A E5            [11]  567 	push	hl
   538B C5            [11]  568 	push	bc
   538C 21 16 54      [10]  569 	ld	hl,#___str_5
   538F E5            [11]  570 	push	hl
   5390 CD D5 58      [17]  571 	call	_cpct_drawStringM0
   5393 21 06 00      [10]  572 	ld	hl,#6
   5396 39            [11]  573 	add	hl,sp
   5397 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   5398 21 0A 64      [10]  576 	ld	hl,#0x640A
   539B E5            [11]  577 	push	hl
   539C 21 00 C0      [10]  578 	ld	hl,#0xC000
   539F E5            [11]  579 	push	hl
   53A0 CD BC 64      [17]  580 	call	_cpct_getScreenPtr
   53A3 4D            [ 4]  581 	ld	c,l
   53A4 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   53A5 21 02 00      [10]  584 	ld	hl,#0x0002
   53A8 E5            [11]  585 	push	hl
   53A9 C5            [11]  586 	push	bc
   53AA 21 1E 54      [10]  587 	ld	hl,#___str_6
   53AD E5            [11]  588 	push	hl
   53AE CD D5 58      [17]  589 	call	_cpct_drawStringM0
   53B1 21 06 00      [10]  590 	ld	hl,#6
   53B4 39            [11]  591 	add	hl,sp
   53B5 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   53B6 21 0E 73      [10]  594 	ld	hl,#0x730E
   53B9 E5            [11]  595 	push	hl
   53BA 21 00 C0      [10]  596 	ld	hl,#0xC000
   53BD E5            [11]  597 	push	hl
   53BE CD BC 64      [17]  598 	call	_cpct_getScreenPtr
   53C1 4D            [ 4]  599 	ld	c,l
   53C2 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   53C3 21 02 00      [10]  602 	ld	hl,#0x0002
   53C6 E5            [11]  603 	push	hl
   53C7 C5            [11]  604 	push	bc
   53C8 21 2E 54      [10]  605 	ld	hl,#___str_7
   53CB E5            [11]  606 	push	hl
   53CC CD D5 58      [17]  607 	call	_cpct_drawStringM0
   53CF 21 06 00      [10]  608 	ld	hl,#6
   53D2 39            [11]  609 	add	hl,sp
   53D3 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   53D4 21 08 82      [10]  612 	ld	hl,#0x8208
   53D7 E5            [11]  613 	push	hl
   53D8 21 00 C0      [10]  614 	ld	hl,#0xC000
   53DB E5            [11]  615 	push	hl
   53DC CD BC 64      [17]  616 	call	_cpct_getScreenPtr
   53DF 4D            [ 4]  617 	ld	c,l
   53E0 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   53E1 21 02 00      [10]  620 	ld	hl,#0x0002
   53E4 E5            [11]  621 	push	hl
   53E5 C5            [11]  622 	push	bc
   53E6 21 3C 54      [10]  623 	ld	hl,#___str_8
   53E9 E5            [11]  624 	push	hl
   53EA CD D5 58      [17]  625 	call	_cpct_drawStringM0
   53ED 21 06 00      [10]  626 	ld	hl,#6
   53F0 39            [11]  627 	add	hl,sp
   53F1 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   53F2                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   53F2 CD 3C 58      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   53F5 21 04 40      [10]  634 	ld	hl,#0x4004
   53F8 CD BD 58      [17]  635 	call	_cpct_isKeyPressed
   53FB 7D            [ 4]  636 	ld	a,l
   53FC B7            [ 4]  637 	or	a, a
   53FD 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   53FF CD 4D 54      [17]  640 	call	_menuOpciones
   5402                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5402 21 07 10      [10]  643 	ld	hl,#0x1007
   5405 CD BD 58      [17]  644 	call	_cpct_isKeyPressed
   5408 7D            [ 4]  645 	ld	a,l
   5409 B7            [ 4]  646 	or	a, a
   540A C0            [11]  647 	ret	NZ
   540B 21 04 40      [10]  648 	ld	hl,#0x4004
   540E CD BD 58      [17]  649 	call	_cpct_isKeyPressed
   5411 7D            [ 4]  650 	ld	a,l
   5412 B7            [ 4]  651 	or	a, a
   5413 28 DD         [12]  652 	jr	Z,00104$
   5415 C9            [10]  653 	ret
   5416                     654 ___str_5:
   5416 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   541D 00                  656 	.db 0x00
   541E                     657 ___str_6:
   541E 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   542D 00                  659 	.db 0x00
   542E                     660 ___str_7:
   542E 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   543B 00                  662 	.db 0x00
   543C                     663 ___str_8:
   543C 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   544C 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   544D                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   544D 21 50 82      [10]  672 	ld	hl,#0x8250
   5450 E5            [11]  673 	push	hl
   5451 21 00 1E      [10]  674 	ld	hl,#0x1E00
   5454 E5            [11]  675 	push	hl
   5455 CD CB 51      [17]  676 	call	_borrarPantalla
   5458 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   5459 21 20 64      [10]  679 	ld	hl, #0x6420
   545C E3            [19]  680 	ex	(sp),hl
   545D 21 00 C0      [10]  681 	ld	hl,#0xC000
   5460 E5            [11]  682 	push	hl
   5461 CD BC 64      [17]  683 	call	_cpct_getScreenPtr
   5464 4D            [ 4]  684 	ld	c,l
   5465 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   5466 21 02 00      [10]  687 	ld	hl,#0x0002
   5469 E5            [11]  688 	push	hl
   546A C5            [11]  689 	push	bc
   546B 21 EE 54      [10]  690 	ld	hl,#___str_9
   546E E5            [11]  691 	push	hl
   546F CD D5 58      [17]  692 	call	_cpct_drawStringM0
   5472 21 06 00      [10]  693 	ld	hl,#6
   5475 39            [11]  694 	add	hl,sp
   5476 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   5477 21 00 82      [10]  697 	ld	hl,#0x8200
   547A E5            [11]  698 	push	hl
   547B 26 C0         [ 7]  699 	ld	h, #0xC0
   547D E5            [11]  700 	push	hl
   547E CD BC 64      [17]  701 	call	_cpct_getScreenPtr
   5481 4D            [ 4]  702 	ld	c,l
   5482 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   5483 21 02 00      [10]  705 	ld	hl,#0x0002
   5486 E5            [11]  706 	push	hl
   5487 C5            [11]  707 	push	bc
   5488 21 F3 54      [10]  708 	ld	hl,#___str_10
   548B E5            [11]  709 	push	hl
   548C CD D5 58      [17]  710 	call	_cpct_drawStringM0
   548F 21 06 00      [10]  711 	ld	hl,#6
   5492 39            [11]  712 	add	hl,sp
   5493 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   5494 21 0A 91      [10]  715 	ld	hl,#0x910A
   5497 E5            [11]  716 	push	hl
   5498 21 00 C0      [10]  717 	ld	hl,#0xC000
   549B E5            [11]  718 	push	hl
   549C CD BC 64      [17]  719 	call	_cpct_getScreenPtr
   549F 4D            [ 4]  720 	ld	c,l
   54A0 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   54A1 21 02 00      [10]  723 	ld	hl,#0x0002
   54A4 E5            [11]  724 	push	hl
   54A5 C5            [11]  725 	push	bc
   54A6 21 08 55      [10]  726 	ld	hl,#___str_11
   54A9 E5            [11]  727 	push	hl
   54AA CD D5 58      [17]  728 	call	_cpct_drawStringM0
   54AD 21 06 00      [10]  729 	ld	hl,#6
   54B0 39            [11]  730 	add	hl,sp
   54B1 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   54B2                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   54B2 CD 3C 58      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   54B5 21 04 08      [10]  737 	ld	hl,#0x0804
   54B8 CD BD 58      [17]  738 	call	_cpct_isKeyPressed
   54BB 7D            [ 4]  739 	ld	a,l
   54BC B7            [ 4]  740 	or	a, a
   54BD 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   54BF CD 57 52      [17]  743 	call	_menuInstrucciones
   54C2 18 0D         [12]  744 	jr	00109$
   54C4                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   54C4 21 07 40      [10]  747 	ld	hl,#0x4007
   54C7 CD BD 58      [17]  748 	call	_cpct_isKeyPressed
   54CA 7D            [ 4]  749 	ld	a,l
   54CB B7            [ 4]  750 	or	a, a
   54CC 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   54CE CD 6E 53      [17]  753 	call	_menuCreditos
   54D1                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   54D1 21 07 10      [10]  756 	ld	hl,#0x1007
   54D4 CD BD 58      [17]  757 	call	_cpct_isKeyPressed
   54D7 7D            [ 4]  758 	ld	a,l
   54D8 B7            [ 4]  759 	or	a, a
   54D9 C0            [11]  760 	ret	NZ
   54DA 21 04 08      [10]  761 	ld	hl,#0x0804
   54DD CD BD 58      [17]  762 	call	_cpct_isKeyPressed
   54E0 7D            [ 4]  763 	ld	a,l
   54E1 B7            [ 4]  764 	or	a, a
   54E2 C0            [11]  765 	ret	NZ
   54E3 21 07 40      [10]  766 	ld	hl,#0x4007
   54E6 CD BD 58      [17]  767 	call	_cpct_isKeyPressed
   54E9 7D            [ 4]  768 	ld	a,l
   54EA B7            [ 4]  769 	or	a, a
   54EB 28 C5         [12]  770 	jr	Z,00108$
   54ED C9            [10]  771 	ret
   54EE                     772 ___str_9:
   54EE 4D 45 4E 55         773 	.ascii "MENU"
   54F2 00                  774 	.db 0x00
   54F3                     775 ___str_10:
   54F3 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   5507 00                  777 	.db 0x00
   5508                     778 ___str_11:
   5508 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   5517 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   5518                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   5518 21 00 40      [10]  787 	ld	hl,#0x4000
   551B E5            [11]  788 	push	hl
   551C AF            [ 4]  789 	xor	a, a
   551D F5            [11]  790 	push	af
   551E 33            [ 6]  791 	inc	sp
   551F 26 C0         [ 7]  792 	ld	h, #0xC0
   5521 E5            [11]  793 	push	hl
   5522 CD 84 5B      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   5525 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   5528 E5            [11]  797 	push	hl
   5529 21 00 C0      [10]  798 	ld	hl,#0xC000
   552C E5            [11]  799 	push	hl
   552D CD BC 64      [17]  800 	call	_cpct_getScreenPtr
   5530 4D            [ 4]  801 	ld	c,l
   5531 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   5532 21 04 00      [10]  804 	ld	hl,#0x0004
   5535 E5            [11]  805 	push	hl
   5536 C5            [11]  806 	push	bc
   5537 21 CE 55      [10]  807 	ld	hl,#___str_12
   553A E5            [11]  808 	push	hl
   553B CD D5 58      [17]  809 	call	_cpct_drawStringM0
   553E 21 06 00      [10]  810 	ld	hl,#6
   5541 39            [11]  811 	add	hl,sp
   5542 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   5543 21 28 6E      [10]  814 	ld	hl,#0x6E28
   5546 E5            [11]  815 	push	hl
   5547 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   554A E5            [11]  817 	push	hl
   554B 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   554E E5            [11]  819 	push	hl
   554F CD F9 58      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   5552 21 28 6E      [10]  822 	ld	hl,#0x6E28
   5555 E5            [11]  823 	push	hl
   5556 21 18 F1      [10]  824 	ld	hl,#0xF118
   5559 E5            [11]  825 	push	hl
   555A 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   555D E5            [11]  827 	push	hl
   555E CD F9 58      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   5561 21 08 A0      [10]  830 	ld	hl,#0xA008
   5564 E5            [11]  831 	push	hl
   5565 21 00 C0      [10]  832 	ld	hl,#0xC000
   5568 E5            [11]  833 	push	hl
   5569 CD BC 64      [17]  834 	call	_cpct_getScreenPtr
   556C 4D            [ 4]  835 	ld	c,l
   556D 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   556E 21 02 00      [10]  838 	ld	hl,#0x0002
   5571 E5            [11]  839 	push	hl
   5572 C5            [11]  840 	push	bc
   5573 21 D6 55      [10]  841 	ld	hl,#___str_13
   5576 E5            [11]  842 	push	hl
   5577 CD D5 58      [17]  843 	call	_cpct_drawStringM0
   557A 21 06 00      [10]  844 	ld	hl,#6
   557D 39            [11]  845 	add	hl,sp
   557E F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   557F 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   5582 E5            [11]  849 	push	hl
   5583 21 00 C0      [10]  850 	ld	hl,#0xC000
   5586 E5            [11]  851 	push	hl
   5587 CD BC 64      [17]  852 	call	_cpct_getScreenPtr
   558A 4D            [ 4]  853 	ld	c,l
   558B 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   558C 21 02 00      [10]  856 	ld	hl,#0x0002
   558F E5            [11]  857 	push	hl
   5590 C5            [11]  858 	push	bc
   5591 21 E7 55      [10]  859 	ld	hl,#___str_14
   5594 E5            [11]  860 	push	hl
   5595 CD D5 58      [17]  861 	call	_cpct_drawStringM0
   5598 21 06 00      [10]  862 	ld	hl,#6
   559B 39            [11]  863 	add	hl,sp
   559C F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   559D                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   559D CD 3C 58      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   55A0 21 04 40      [10]  870 	ld	hl,#0x4004
   55A3 CD BD 58      [17]  871 	call	_cpct_isKeyPressed
   55A6 7D            [ 4]  872 	ld	a,l
   55A7 B7            [ 4]  873 	or	a, a
   55A8 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   55AA CD 3C 58      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   55AD                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   55AD CD 4D 54      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   55B0 21 07 10      [10]  882 	ld	hl,#0x1007
   55B3 CD BD 58      [17]  883 	call	_cpct_isKeyPressed
   55B6 7D            [ 4]  884 	ld	a,l
   55B7 B7            [ 4]  885 	or	a, a
   55B8 28 F3         [12]  886 	jr	Z,00101$
   55BA                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   55BA 21 07 10      [10]  889 	ld	hl,#0x1007
   55BD CD BD 58      [17]  890 	call	_cpct_isKeyPressed
   55C0 7D            [ 4]  891 	ld	a,l
   55C1 B7            [ 4]  892 	or	a, a
   55C2 C0            [11]  893 	ret	NZ
   55C3 21 04 40      [10]  894 	ld	hl,#0x4004
   55C6 CD BD 58      [17]  895 	call	_cpct_isKeyPressed
   55C9 7D            [ 4]  896 	ld	a,l
   55CA B7            [ 4]  897 	or	a, a
   55CB 28 D0         [12]  898 	jr	Z,00107$
   55CD C9            [10]  899 	ret
   55CE                     900 ___str_12:
   55CE 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   55D5 00                  902 	.db 0x00
   55D6                     903 ___str_13:
   55D6 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   55E6 00                  905 	.db 0x00
   55E7                     906 ___str_14:
   55E7 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   55F6 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
