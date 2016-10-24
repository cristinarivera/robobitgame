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
   503E                      60 _menuFin::
   503E DD E5         [15]   61 	push	ix
   5040 DD 21 00 00   [14]   62 	ld	ix,#0
   5044 DD 39         [15]   63 	add	ix,sp
   5046 F5            [11]   64 	push	af
   5047 F5            [11]   65 	push	af
   5048 DD 75 FE      [19]   66 	ld	-2 (ix),l
   504B DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   504E 21 10 27      [10]   69 	ld	hl,#0x2710
   5051 E5            [11]   70 	push	hl
   5052 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   5055 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   5058 E5            [11]   73 	push	hl
   5059 CD E2 57      [17]   74 	call	__divuint
   505C F1            [10]   75 	pop	af
   505D F1            [10]   76 	pop	af
   505E 33            [ 6]   77 	inc	sp
   505F 33            [ 6]   78 	inc	sp
   5060 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   5061 21 00 40      [10]   81 	ld	hl,#0x4000
   5064 E5            [11]   82 	push	hl
   5065 AF            [ 4]   83 	xor	a, a
   5066 F5            [11]   84 	push	af
   5067 33            [ 6]   85 	inc	sp
   5068 26 C0         [ 7]   86 	ld	h, #0xC0
   506A E5            [11]   87 	push	hl
   506B CD 6B 5B      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   506E 21 18 5A      [10]   90 	ld	hl,#0x5A18
   5071 E5            [11]   91 	push	hl
   5072 21 00 C0      [10]   92 	ld	hl,#0xC000
   5075 E5            [11]   93 	push	hl
   5076 CD A3 64      [17]   94 	call	_cpct_getScreenPtr
   5079 4D            [ 4]   95 	ld	c,l
   507A 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   507B 21 02 00      [10]   98 	ld	hl,#0x0002
   507E E5            [11]   99 	push	hl
   507F C5            [11]  100 	push	bc
   5080 21 A0 51      [10]  101 	ld	hl,#___str_0
   5083 E5            [11]  102 	push	hl
   5084 CD BC 58      [17]  103 	call	_cpct_drawStringM0
   5087 21 06 00      [10]  104 	ld	hl,#6
   508A 39            [11]  105 	add	hl,sp
   508B F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   508C 21 14 78      [10]  108 	ld	hl,#0x7814
   508F E5            [11]  109 	push	hl
   5090 21 00 C0      [10]  110 	ld	hl,#0xC000
   5093 E5            [11]  111 	push	hl
   5094 CD A3 64      [17]  112 	call	_cpct_getScreenPtr
   5097 4D            [ 4]  113 	ld	c,l
   5098 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   5099 21 02 00      [10]  116 	ld	hl,#0x0002
   509C E5            [11]  117 	push	hl
   509D C5            [11]  118 	push	bc
   509E 21 AA 51      [10]  119 	ld	hl,#___str_1
   50A1 E5            [11]  120 	push	hl
   50A2 CD BC 58      [17]  121 	call	_cpct_drawStringM0
   50A5 21 06 00      [10]  122 	ld	hl,#6
   50A8 39            [11]  123 	add	hl,sp
   50A9 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   50AA 21 2D 78      [10]  126 	ld	hl,#0x782D
   50AD E5            [11]  127 	push	hl
   50AE 21 00 C0      [10]  128 	ld	hl,#0xC000
   50B1 E5            [11]  129 	push	hl
   50B2 CD A3 64      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   50B5 E5            [11]  132 	push	hl
   50B6 21 0A 00      [10]  133 	ld	hl,#0x000A
   50B9 E5            [11]  134 	push	hl
   50BA DD 6E FC      [19]  135 	ld	l,-4 (ix)
   50BD DD 66 FD      [19]  136 	ld	h,-3 (ix)
   50C0 E5            [11]  137 	push	hl
   50C1 CD 98 64      [17]  138 	call	__moduint
   50C4 F1            [10]  139 	pop	af
   50C5 F1            [10]  140 	pop	af
   50C6 C1            [10]  141 	pop	bc
   50C7 7D            [ 4]  142 	ld	a,l
   50C8 C6 30         [ 7]  143 	add	a, #0x30
   50CA 67            [ 4]  144 	ld	h,a
   50CB 59            [ 4]  145 	ld	e, c
   50CC 50            [ 4]  146 	ld	d, b
   50CD C5            [11]  147 	push	bc
   50CE E5            [11]  148 	push	hl
   50CF 33            [ 6]  149 	inc	sp
   50D0 21 02 00      [10]  150 	ld	hl,#0x0002
   50D3 E5            [11]  151 	push	hl
   50D4 D5            [11]  152 	push	de
   50D5 CD 14 5A      [17]  153 	call	_cpct_drawCharM0
   50D8 F1            [10]  154 	pop	af
   50D9 33            [ 6]  155 	inc	sp
   50DA 21 E8 03      [10]  156 	ld	hl,#0x03E8
   50DD E3            [19]  157 	ex	(sp),hl
   50DE DD 6E FE      [19]  158 	ld	l,-2 (ix)
   50E1 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   50E4 E5            [11]  160 	push	hl
   50E5 CD E2 57      [17]  161 	call	__divuint
   50E8 F1            [10]  162 	pop	af
   50E9 F1            [10]  163 	pop	af
   50EA 11 0A 00      [10]  164 	ld	de,#0x000A
   50ED D5            [11]  165 	push	de
   50EE E5            [11]  166 	push	hl
   50EF CD 98 64      [17]  167 	call	__moduint
   50F2 F1            [10]  168 	pop	af
   50F3 F1            [10]  169 	pop	af
   50F4 C1            [10]  170 	pop	bc
   50F5 7D            [ 4]  171 	ld	a,l
   50F6 C6 30         [ 7]  172 	add	a, #0x30
   50F8 67            [ 4]  173 	ld	h,a
   50F9 79            [ 4]  174 	ld	a,c
   50FA C6 04         [ 7]  175 	add	a, #0x04
   50FC 5F            [ 4]  176 	ld	e,a
   50FD 78            [ 4]  177 	ld	a,b
   50FE CE 00         [ 7]  178 	adc	a, #0x00
   5100 57            [ 4]  179 	ld	d,a
   5101 C5            [11]  180 	push	bc
   5102 E5            [11]  181 	push	hl
   5103 33            [ 6]  182 	inc	sp
   5104 21 02 00      [10]  183 	ld	hl,#0x0002
   5107 E5            [11]  184 	push	hl
   5108 D5            [11]  185 	push	de
   5109 CD 14 5A      [17]  186 	call	_cpct_drawCharM0
   510C F1            [10]  187 	pop	af
   510D 33            [ 6]  188 	inc	sp
   510E 21 64 00      [10]  189 	ld	hl,#0x0064
   5111 E3            [19]  190 	ex	(sp),hl
   5112 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   5115 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   5118 E5            [11]  193 	push	hl
   5119 CD E2 57      [17]  194 	call	__divuint
   511C F1            [10]  195 	pop	af
   511D F1            [10]  196 	pop	af
   511E 11 0A 00      [10]  197 	ld	de,#0x000A
   5121 D5            [11]  198 	push	de
   5122 E5            [11]  199 	push	hl
   5123 CD 98 64      [17]  200 	call	__moduint
   5126 F1            [10]  201 	pop	af
   5127 F1            [10]  202 	pop	af
   5128 C1            [10]  203 	pop	bc
   5129 7D            [ 4]  204 	ld	a,l
   512A C6 30         [ 7]  205 	add	a, #0x30
   512C 67            [ 4]  206 	ld	h,a
   512D 79            [ 4]  207 	ld	a,c
   512E C6 08         [ 7]  208 	add	a, #0x08
   5130 5F            [ 4]  209 	ld	e,a
   5131 78            [ 4]  210 	ld	a,b
   5132 CE 00         [ 7]  211 	adc	a, #0x00
   5134 57            [ 4]  212 	ld	d,a
   5135 C5            [11]  213 	push	bc
   5136 E5            [11]  214 	push	hl
   5137 33            [ 6]  215 	inc	sp
   5138 21 02 00      [10]  216 	ld	hl,#0x0002
   513B E5            [11]  217 	push	hl
   513C D5            [11]  218 	push	de
   513D CD 14 5A      [17]  219 	call	_cpct_drawCharM0
   5140 F1            [10]  220 	pop	af
   5141 33            [ 6]  221 	inc	sp
   5142 21 0A 00      [10]  222 	ld	hl,#0x000A
   5145 E3            [19]  223 	ex	(sp),hl
   5146 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   5149 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   514C E5            [11]  226 	push	hl
   514D CD E2 57      [17]  227 	call	__divuint
   5150 F1            [10]  228 	pop	af
   5151 F1            [10]  229 	pop	af
   5152 11 0A 00      [10]  230 	ld	de,#0x000A
   5155 D5            [11]  231 	push	de
   5156 E5            [11]  232 	push	hl
   5157 CD 98 64      [17]  233 	call	__moduint
   515A F1            [10]  234 	pop	af
   515B F1            [10]  235 	pop	af
   515C C1            [10]  236 	pop	bc
   515D 7D            [ 4]  237 	ld	a,l
   515E C6 30         [ 7]  238 	add	a, #0x30
   5160 67            [ 4]  239 	ld	h,a
   5161 79            [ 4]  240 	ld	a,c
   5162 C6 0C         [ 7]  241 	add	a, #0x0C
   5164 5F            [ 4]  242 	ld	e,a
   5165 78            [ 4]  243 	ld	a,b
   5166 CE 00         [ 7]  244 	adc	a, #0x00
   5168 57            [ 4]  245 	ld	d,a
   5169 C5            [11]  246 	push	bc
   516A E5            [11]  247 	push	hl
   516B 33            [ 6]  248 	inc	sp
   516C 21 02 00      [10]  249 	ld	hl,#0x0002
   516F E5            [11]  250 	push	hl
   5170 D5            [11]  251 	push	de
   5171 CD 14 5A      [17]  252 	call	_cpct_drawCharM0
   5174 F1            [10]  253 	pop	af
   5175 33            [ 6]  254 	inc	sp
   5176 21 0A 00      [10]  255 	ld	hl,#0x000A
   5179 E3            [19]  256 	ex	(sp),hl
   517A DD 6E FE      [19]  257 	ld	l,-2 (ix)
   517D DD 66 FF      [19]  258 	ld	h,-1 (ix)
   5180 E5            [11]  259 	push	hl
   5181 CD 98 64      [17]  260 	call	__moduint
   5184 F1            [10]  261 	pop	af
   5185 F1            [10]  262 	pop	af
   5186 C1            [10]  263 	pop	bc
   5187 7D            [ 4]  264 	ld	a,l
   5188 C6 30         [ 7]  265 	add	a, #0x30
   518A 57            [ 4]  266 	ld	d,a
   518B 21 10 00      [10]  267 	ld	hl,#0x0010
   518E 09            [11]  268 	add	hl,bc
   518F 4D            [ 4]  269 	ld	c,l
   5190 44            [ 4]  270 	ld	b,h
   5191 D5            [11]  271 	push	de
   5192 33            [ 6]  272 	inc	sp
   5193 21 02 00      [10]  273 	ld	hl,#0x0002
   5196 E5            [11]  274 	push	hl
   5197 C5            [11]  275 	push	bc
   5198 CD 14 5A      [17]  276 	call	_cpct_drawCharM0
   519B F1            [10]  277 	pop	af
   519C F1            [10]  278 	pop	af
   519D 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   519E                     281 00102$:
   519E 18 FE         [12]  282 	jr	00102$
   51A0                     283 ___str_0:
   51A0 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   51A9 00                  285 	.db 0x00
   51AA                     286 ___str_1:
   51AA 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   51B1 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   51B2                     293 _borrarPantalla::
   51B2 DD E5         [15]  294 	push	ix
   51B4 DD 21 00 00   [14]  295 	ld	ix,#0
   51B8 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   51BA 3E 28         [ 7]  298 	ld	a,#0x28
   51BC DD 96 06      [19]  299 	sub	a, 6 (ix)
   51BF 3E 00         [ 7]  300 	ld	a,#0x00
   51C1 17            [ 4]  301 	rla
   51C2 4F            [ 4]  302 	ld	c,a
   51C3 CB 41         [ 8]  303 	bit	0,c
   51C5 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   51C7 DD 66 05      [19]  306 	ld	h,5 (ix)
   51CA DD 6E 04      [19]  307 	ld	l,4 (ix)
   51CD E5            [11]  308 	push	hl
   51CE 21 00 C0      [10]  309 	ld	hl,#0xC000
   51D1 E5            [11]  310 	push	hl
   51D2 CD A3 64      [17]  311 	call	_cpct_getScreenPtr
   51D5 4D            [ 4]  312 	ld	c,l
   51D6 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   51D7 DD 66 07      [19]  315 	ld	h,7 (ix)
   51DA DD 6E 06      [19]  316 	ld	l,6 (ix)
   51DD E5            [11]  317 	push	hl
   51DE AF            [ 4]  318 	xor	a, a
   51DF F5            [11]  319 	push	af
   51E0 33            [ 6]  320 	inc	sp
   51E1 C5            [11]  321 	push	bc
   51E2 CD 89 5B      [17]  322 	call	_cpct_drawSolidBox
   51E5 F1            [10]  323 	pop	af
   51E6 F1            [10]  324 	pop	af
   51E7 33            [ 6]  325 	inc	sp
   51E8 18 51         [12]  326 	jr	00106$
   51EA                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   51EA CB 41         [ 8]  329 	bit	0,c
   51EC 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   51EE DD 66 05      [19]  332 	ld	h,5 (ix)
   51F1 DD 6E 04      [19]  333 	ld	l,4 (ix)
   51F4 E5            [11]  334 	push	hl
   51F5 21 00 C0      [10]  335 	ld	hl,#0xC000
   51F8 E5            [11]  336 	push	hl
   51F9 CD A3 64      [17]  337 	call	_cpct_getScreenPtr
   51FC 4D            [ 4]  338 	ld	c,l
   51FD 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   51FE DD 7E 07      [19]  341 	ld	a,7 (ix)
   5201 F5            [11]  342 	push	af
   5202 33            [ 6]  343 	inc	sp
   5203 21 00 28      [10]  344 	ld	hl,#0x2800
   5206 E5            [11]  345 	push	hl
   5207 C5            [11]  346 	push	bc
   5208 CD 89 5B      [17]  347 	call	_cpct_drawSolidBox
   520B F1            [10]  348 	pop	af
   520C F1            [10]  349 	pop	af
   520D 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   520E DD 7E 04      [19]  352 	ld	a,4 (ix)
   5211 C6 28         [ 7]  353 	add	a, #0x28
   5213 47            [ 4]  354 	ld	b,a
   5214 DD 7E 05      [19]  355 	ld	a,5 (ix)
   5217 F5            [11]  356 	push	af
   5218 33            [ 6]  357 	inc	sp
   5219 C5            [11]  358 	push	bc
   521A 33            [ 6]  359 	inc	sp
   521B 21 00 C0      [10]  360 	ld	hl,#0xC000
   521E E5            [11]  361 	push	hl
   521F CD A3 64      [17]  362 	call	_cpct_getScreenPtr
   5222 4D            [ 4]  363 	ld	c,l
   5223 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   5224 DD 7E 06      [19]  366 	ld	a,6 (ix)
   5227 C6 D8         [ 7]  367 	add	a,#0xD8
   5229 57            [ 4]  368 	ld	d,a
   522A DD 7E 07      [19]  369 	ld	a,7 (ix)
   522D F5            [11]  370 	push	af
   522E 33            [ 6]  371 	inc	sp
   522F D5            [11]  372 	push	de
   5230 33            [ 6]  373 	inc	sp
   5231 AF            [ 4]  374 	xor	a, a
   5232 F5            [11]  375 	push	af
   5233 33            [ 6]  376 	inc	sp
   5234 C5            [11]  377 	push	bc
   5235 CD 89 5B      [17]  378 	call	_cpct_drawSolidBox
   5238 F1            [10]  379 	pop	af
   5239 F1            [10]  380 	pop	af
   523A 33            [ 6]  381 	inc	sp
   523B                     382 00106$:
   523B DD E1         [14]  383 	pop	ix
   523D C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   523E                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   523E 21 50 82      [10]  391 	ld	hl,#0x8250
   5241 E5            [11]  392 	push	hl
   5242 21 00 1E      [10]  393 	ld	hl,#0x1E00
   5245 E5            [11]  394 	push	hl
   5246 CD B2 51      [17]  395 	call	_borrarPantalla
   5249 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   524A 21 10 55      [10]  398 	ld	hl, #0x5510
   524D E3            [19]  399 	ex	(sp),hl
   524E 21 00 C0      [10]  400 	ld	hl,#0xC000
   5251 E5            [11]  401 	push	hl
   5252 CD A3 64      [17]  402 	call	_cpct_getScreenPtr
   5255 4D            [ 4]  403 	ld	c,l
   5256 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   5257 21 02 00      [10]  406 	ld	hl,#0x0002
   525A E5            [11]  407 	push	hl
   525B C5            [11]  408 	push	bc
   525C 21 2C 53      [10]  409 	ld	hl,#___str_2
   525F E5            [11]  410 	push	hl
   5260 CD BC 58      [17]  411 	call	_cpct_drawStringM0
   5263 21 06 00      [10]  412 	ld	hl,#6
   5266 39            [11]  413 	add	hl,sp
   5267 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   5268 21 04 73      [10]  416 	ld	hl,#0x7304
   526B E5            [11]  417 	push	hl
   526C 21 00 C0      [10]  418 	ld	hl,#0xC000
   526F E5            [11]  419 	push	hl
   5270 CD A3 64      [17]  420 	call	_cpct_getScreenPtr
   5273 4D            [ 4]  421 	ld	c,l
   5274 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   5275 21 05 0A      [10]  424 	ld	hl,#0x0A05
   5278 E5            [11]  425 	push	hl
   5279 C5            [11]  426 	push	bc
   527A 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   527D E5            [11]  428 	push	hl
   527E CD E0 58      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   5281 21 0E 73      [10]  431 	ld	hl,#0x730E
   5284 E5            [11]  432 	push	hl
   5285 21 00 C0      [10]  433 	ld	hl,#0xC000
   5288 E5            [11]  434 	push	hl
   5289 CD A3 64      [17]  435 	call	_cpct_getScreenPtr
   528C 4D            [ 4]  436 	ld	c,l
   528D 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   528E 21 05 0A      [10]  439 	ld	hl,#0x0A05
   5291 E5            [11]  440 	push	hl
   5292 C5            [11]  441 	push	bc
   5293 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   5296 E5            [11]  443 	push	hl
   5297 CD E0 58      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   529A 21 18 73      [10]  446 	ld	hl,#0x7318
   529D E5            [11]  447 	push	hl
   529E 21 00 C0      [10]  448 	ld	hl,#0xC000
   52A1 E5            [11]  449 	push	hl
   52A2 CD A3 64      [17]  450 	call	_cpct_getScreenPtr
   52A5 4D            [ 4]  451 	ld	c,l
   52A6 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   52A7 21 05 0A      [10]  454 	ld	hl,#0x0A05
   52AA E5            [11]  455 	push	hl
   52AB C5            [11]  456 	push	bc
   52AC 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   52AF E5            [11]  458 	push	hl
   52B0 CD E0 58      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   52B3 21 22 73      [10]  461 	ld	hl,#0x7322
   52B6 E5            [11]  462 	push	hl
   52B7 21 00 C0      [10]  463 	ld	hl,#0xC000
   52BA E5            [11]  464 	push	hl
   52BB CD A3 64      [17]  465 	call	_cpct_getScreenPtr
   52BE 4D            [ 4]  466 	ld	c,l
   52BF 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   52C0 21 05 0A      [10]  469 	ld	hl,#0x0A05
   52C3 E5            [11]  470 	push	hl
   52C4 C5            [11]  471 	push	bc
   52C5 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   52C8 E5            [11]  473 	push	hl
   52C9 CD E0 58      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   52CC 21 2D 73      [10]  476 	ld	hl,#0x732D
   52CF E5            [11]  477 	push	hl
   52D0 21 00 C0      [10]  478 	ld	hl,#0xC000
   52D3 E5            [11]  479 	push	hl
   52D4 CD A3 64      [17]  480 	call	_cpct_getScreenPtr
   52D7 4D            [ 4]  481 	ld	c,l
   52D8 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   52D9 21 02 00      [10]  484 	ld	hl,#0x0002
   52DC E5            [11]  485 	push	hl
   52DD C5            [11]  486 	push	bc
   52DE 21 39 53      [10]  487 	ld	hl,#___str_3
   52E1 E5            [11]  488 	push	hl
   52E2 CD BC 58      [17]  489 	call	_cpct_drawStringM0
   52E5 21 06 00      [10]  490 	ld	hl,#6
   52E8 39            [11]  491 	add	hl,sp
   52E9 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   52EA 21 04 82      [10]  494 	ld	hl,#0x8204
   52ED E5            [11]  495 	push	hl
   52EE 21 00 C0      [10]  496 	ld	hl,#0xC000
   52F1 E5            [11]  497 	push	hl
   52F2 CD A3 64      [17]  498 	call	_cpct_getScreenPtr
   52F5 4D            [ 4]  499 	ld	c,l
   52F6 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   52F7 21 02 00      [10]  502 	ld	hl,#0x0002
   52FA E5            [11]  503 	push	hl
   52FB C5            [11]  504 	push	bc
   52FC 21 42 53      [10]  505 	ld	hl,#___str_4
   52FF E5            [11]  506 	push	hl
   5300 CD BC 58      [17]  507 	call	_cpct_drawStringM0
   5303 21 06 00      [10]  508 	ld	hl,#6
   5306 39            [11]  509 	add	hl,sp
   5307 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   5308                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   5308 CD 23 58      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   530B 21 04 40      [10]  516 	ld	hl,#0x4004
   530E CD A4 58      [17]  517 	call	_cpct_isKeyPressed
   5311 7D            [ 4]  518 	ld	a,l
   5312 B7            [ 4]  519 	or	a, a
   5313 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   5315 CD 34 54      [17]  522 	call	_menuOpciones
   5318                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5318 21 07 10      [10]  525 	ld	hl,#0x1007
   531B CD A4 58      [17]  526 	call	_cpct_isKeyPressed
   531E 7D            [ 4]  527 	ld	a,l
   531F B7            [ 4]  528 	or	a, a
   5320 C0            [11]  529 	ret	NZ
   5321 21 04 40      [10]  530 	ld	hl,#0x4004
   5324 CD A4 58      [17]  531 	call	_cpct_isKeyPressed
   5327 7D            [ 4]  532 	ld	a,l
   5328 B7            [ 4]  533 	or	a, a
   5329 28 DD         [12]  534 	jr	Z,00104$
   532B C9            [10]  535 	ret
   532C                     536 ___str_2:
   532C 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   5338 00                  538 	.db 0x00
   5339                     539 ___str_3:
   5339 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   5341 00                  541 	.db 0x00
   5342                     542 ___str_4:
   5342 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   5354 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   5355                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   5355 21 50 82      [10]  551 	ld	hl,#0x8250
   5358 E5            [11]  552 	push	hl
   5359 21 00 1E      [10]  553 	ld	hl,#0x1E00
   535C E5            [11]  554 	push	hl
   535D CD B2 51      [17]  555 	call	_borrarPantalla
   5360 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   5361 21 1A 46      [10]  558 	ld	hl, #0x461A
   5364 E3            [19]  559 	ex	(sp),hl
   5365 21 00 C0      [10]  560 	ld	hl,#0xC000
   5368 E5            [11]  561 	push	hl
   5369 CD A3 64      [17]  562 	call	_cpct_getScreenPtr
   536C 4D            [ 4]  563 	ld	c,l
   536D 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   536E 21 02 00      [10]  566 	ld	hl,#0x0002
   5371 E5            [11]  567 	push	hl
   5372 C5            [11]  568 	push	bc
   5373 21 FD 53      [10]  569 	ld	hl,#___str_5
   5376 E5            [11]  570 	push	hl
   5377 CD BC 58      [17]  571 	call	_cpct_drawStringM0
   537A 21 06 00      [10]  572 	ld	hl,#6
   537D 39            [11]  573 	add	hl,sp
   537E F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   537F 21 0A 64      [10]  576 	ld	hl,#0x640A
   5382 E5            [11]  577 	push	hl
   5383 21 00 C0      [10]  578 	ld	hl,#0xC000
   5386 E5            [11]  579 	push	hl
   5387 CD A3 64      [17]  580 	call	_cpct_getScreenPtr
   538A 4D            [ 4]  581 	ld	c,l
   538B 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   538C 21 02 00      [10]  584 	ld	hl,#0x0002
   538F E5            [11]  585 	push	hl
   5390 C5            [11]  586 	push	bc
   5391 21 05 54      [10]  587 	ld	hl,#___str_6
   5394 E5            [11]  588 	push	hl
   5395 CD BC 58      [17]  589 	call	_cpct_drawStringM0
   5398 21 06 00      [10]  590 	ld	hl,#6
   539B 39            [11]  591 	add	hl,sp
   539C F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   539D 21 0E 73      [10]  594 	ld	hl,#0x730E
   53A0 E5            [11]  595 	push	hl
   53A1 21 00 C0      [10]  596 	ld	hl,#0xC000
   53A4 E5            [11]  597 	push	hl
   53A5 CD A3 64      [17]  598 	call	_cpct_getScreenPtr
   53A8 4D            [ 4]  599 	ld	c,l
   53A9 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   53AA 21 02 00      [10]  602 	ld	hl,#0x0002
   53AD E5            [11]  603 	push	hl
   53AE C5            [11]  604 	push	bc
   53AF 21 15 54      [10]  605 	ld	hl,#___str_7
   53B2 E5            [11]  606 	push	hl
   53B3 CD BC 58      [17]  607 	call	_cpct_drawStringM0
   53B6 21 06 00      [10]  608 	ld	hl,#6
   53B9 39            [11]  609 	add	hl,sp
   53BA F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   53BB 21 08 82      [10]  612 	ld	hl,#0x8208
   53BE E5            [11]  613 	push	hl
   53BF 21 00 C0      [10]  614 	ld	hl,#0xC000
   53C2 E5            [11]  615 	push	hl
   53C3 CD A3 64      [17]  616 	call	_cpct_getScreenPtr
   53C6 4D            [ 4]  617 	ld	c,l
   53C7 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   53C8 21 02 00      [10]  620 	ld	hl,#0x0002
   53CB E5            [11]  621 	push	hl
   53CC C5            [11]  622 	push	bc
   53CD 21 23 54      [10]  623 	ld	hl,#___str_8
   53D0 E5            [11]  624 	push	hl
   53D1 CD BC 58      [17]  625 	call	_cpct_drawStringM0
   53D4 21 06 00      [10]  626 	ld	hl,#6
   53D7 39            [11]  627 	add	hl,sp
   53D8 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   53D9                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   53D9 CD 23 58      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   53DC 21 04 40      [10]  634 	ld	hl,#0x4004
   53DF CD A4 58      [17]  635 	call	_cpct_isKeyPressed
   53E2 7D            [ 4]  636 	ld	a,l
   53E3 B7            [ 4]  637 	or	a, a
   53E4 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   53E6 CD 34 54      [17]  640 	call	_menuOpciones
   53E9                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   53E9 21 07 10      [10]  643 	ld	hl,#0x1007
   53EC CD A4 58      [17]  644 	call	_cpct_isKeyPressed
   53EF 7D            [ 4]  645 	ld	a,l
   53F0 B7            [ 4]  646 	or	a, a
   53F1 C0            [11]  647 	ret	NZ
   53F2 21 04 40      [10]  648 	ld	hl,#0x4004
   53F5 CD A4 58      [17]  649 	call	_cpct_isKeyPressed
   53F8 7D            [ 4]  650 	ld	a,l
   53F9 B7            [ 4]  651 	or	a, a
   53FA 28 DD         [12]  652 	jr	Z,00104$
   53FC C9            [10]  653 	ret
   53FD                     654 ___str_5:
   53FD 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   5404 00                  656 	.db 0x00
   5405                     657 ___str_6:
   5405 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   5414 00                  659 	.db 0x00
   5415                     660 ___str_7:
   5415 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   5422 00                  662 	.db 0x00
   5423                     663 ___str_8:
   5423 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   5433 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   5434                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   5434 21 50 82      [10]  672 	ld	hl,#0x8250
   5437 E5            [11]  673 	push	hl
   5438 21 00 1E      [10]  674 	ld	hl,#0x1E00
   543B E5            [11]  675 	push	hl
   543C CD B2 51      [17]  676 	call	_borrarPantalla
   543F F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   5440 21 20 64      [10]  679 	ld	hl, #0x6420
   5443 E3            [19]  680 	ex	(sp),hl
   5444 21 00 C0      [10]  681 	ld	hl,#0xC000
   5447 E5            [11]  682 	push	hl
   5448 CD A3 64      [17]  683 	call	_cpct_getScreenPtr
   544B 4D            [ 4]  684 	ld	c,l
   544C 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   544D 21 02 00      [10]  687 	ld	hl,#0x0002
   5450 E5            [11]  688 	push	hl
   5451 C5            [11]  689 	push	bc
   5452 21 D5 54      [10]  690 	ld	hl,#___str_9
   5455 E5            [11]  691 	push	hl
   5456 CD BC 58      [17]  692 	call	_cpct_drawStringM0
   5459 21 06 00      [10]  693 	ld	hl,#6
   545C 39            [11]  694 	add	hl,sp
   545D F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   545E 21 00 82      [10]  697 	ld	hl,#0x8200
   5461 E5            [11]  698 	push	hl
   5462 26 C0         [ 7]  699 	ld	h, #0xC0
   5464 E5            [11]  700 	push	hl
   5465 CD A3 64      [17]  701 	call	_cpct_getScreenPtr
   5468 4D            [ 4]  702 	ld	c,l
   5469 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   546A 21 02 00      [10]  705 	ld	hl,#0x0002
   546D E5            [11]  706 	push	hl
   546E C5            [11]  707 	push	bc
   546F 21 DA 54      [10]  708 	ld	hl,#___str_10
   5472 E5            [11]  709 	push	hl
   5473 CD BC 58      [17]  710 	call	_cpct_drawStringM0
   5476 21 06 00      [10]  711 	ld	hl,#6
   5479 39            [11]  712 	add	hl,sp
   547A F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   547B 21 0A 91      [10]  715 	ld	hl,#0x910A
   547E E5            [11]  716 	push	hl
   547F 21 00 C0      [10]  717 	ld	hl,#0xC000
   5482 E5            [11]  718 	push	hl
   5483 CD A3 64      [17]  719 	call	_cpct_getScreenPtr
   5486 4D            [ 4]  720 	ld	c,l
   5487 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   5488 21 02 00      [10]  723 	ld	hl,#0x0002
   548B E5            [11]  724 	push	hl
   548C C5            [11]  725 	push	bc
   548D 21 EF 54      [10]  726 	ld	hl,#___str_11
   5490 E5            [11]  727 	push	hl
   5491 CD BC 58      [17]  728 	call	_cpct_drawStringM0
   5494 21 06 00      [10]  729 	ld	hl,#6
   5497 39            [11]  730 	add	hl,sp
   5498 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   5499                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   5499 CD 23 58      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   549C 21 04 08      [10]  737 	ld	hl,#0x0804
   549F CD A4 58      [17]  738 	call	_cpct_isKeyPressed
   54A2 7D            [ 4]  739 	ld	a,l
   54A3 B7            [ 4]  740 	or	a, a
   54A4 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   54A6 CD 3E 52      [17]  743 	call	_menuInstrucciones
   54A9 18 0D         [12]  744 	jr	00109$
   54AB                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   54AB 21 07 40      [10]  747 	ld	hl,#0x4007
   54AE CD A4 58      [17]  748 	call	_cpct_isKeyPressed
   54B1 7D            [ 4]  749 	ld	a,l
   54B2 B7            [ 4]  750 	or	a, a
   54B3 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   54B5 CD 55 53      [17]  753 	call	_menuCreditos
   54B8                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   54B8 21 07 10      [10]  756 	ld	hl,#0x1007
   54BB CD A4 58      [17]  757 	call	_cpct_isKeyPressed
   54BE 7D            [ 4]  758 	ld	a,l
   54BF B7            [ 4]  759 	or	a, a
   54C0 C0            [11]  760 	ret	NZ
   54C1 21 04 08      [10]  761 	ld	hl,#0x0804
   54C4 CD A4 58      [17]  762 	call	_cpct_isKeyPressed
   54C7 7D            [ 4]  763 	ld	a,l
   54C8 B7            [ 4]  764 	or	a, a
   54C9 C0            [11]  765 	ret	NZ
   54CA 21 07 40      [10]  766 	ld	hl,#0x4007
   54CD CD A4 58      [17]  767 	call	_cpct_isKeyPressed
   54D0 7D            [ 4]  768 	ld	a,l
   54D1 B7            [ 4]  769 	or	a, a
   54D2 28 C5         [12]  770 	jr	Z,00108$
   54D4 C9            [10]  771 	ret
   54D5                     772 ___str_9:
   54D5 4D 45 4E 55         773 	.ascii "MENU"
   54D9 00                  774 	.db 0x00
   54DA                     775 ___str_10:
   54DA 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   54EE 00                  777 	.db 0x00
   54EF                     778 ___str_11:
   54EF 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   54FE 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   54FF                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   54FF 21 00 40      [10]  787 	ld	hl,#0x4000
   5502 E5            [11]  788 	push	hl
   5503 AF            [ 4]  789 	xor	a, a
   5504 F5            [11]  790 	push	af
   5505 33            [ 6]  791 	inc	sp
   5506 26 C0         [ 7]  792 	ld	h, #0xC0
   5508 E5            [11]  793 	push	hl
   5509 CD 6B 5B      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   550C 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   550F E5            [11]  797 	push	hl
   5510 21 00 C0      [10]  798 	ld	hl,#0xC000
   5513 E5            [11]  799 	push	hl
   5514 CD A3 64      [17]  800 	call	_cpct_getScreenPtr
   5517 4D            [ 4]  801 	ld	c,l
   5518 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   5519 21 04 00      [10]  804 	ld	hl,#0x0004
   551C E5            [11]  805 	push	hl
   551D C5            [11]  806 	push	bc
   551E 21 B5 55      [10]  807 	ld	hl,#___str_12
   5521 E5            [11]  808 	push	hl
   5522 CD BC 58      [17]  809 	call	_cpct_drawStringM0
   5525 21 06 00      [10]  810 	ld	hl,#6
   5528 39            [11]  811 	add	hl,sp
   5529 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   552A 21 28 6E      [10]  814 	ld	hl,#0x6E28
   552D E5            [11]  815 	push	hl
   552E 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   5531 E5            [11]  817 	push	hl
   5532 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   5535 E5            [11]  819 	push	hl
   5536 CD E0 58      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   5539 21 28 6E      [10]  822 	ld	hl,#0x6E28
   553C E5            [11]  823 	push	hl
   553D 21 18 F1      [10]  824 	ld	hl,#0xF118
   5540 E5            [11]  825 	push	hl
   5541 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   5544 E5            [11]  827 	push	hl
   5545 CD E0 58      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   5548 21 08 A0      [10]  830 	ld	hl,#0xA008
   554B E5            [11]  831 	push	hl
   554C 21 00 C0      [10]  832 	ld	hl,#0xC000
   554F E5            [11]  833 	push	hl
   5550 CD A3 64      [17]  834 	call	_cpct_getScreenPtr
   5553 4D            [ 4]  835 	ld	c,l
   5554 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   5555 21 02 00      [10]  838 	ld	hl,#0x0002
   5558 E5            [11]  839 	push	hl
   5559 C5            [11]  840 	push	bc
   555A 21 BD 55      [10]  841 	ld	hl,#___str_13
   555D E5            [11]  842 	push	hl
   555E CD BC 58      [17]  843 	call	_cpct_drawStringM0
   5561 21 06 00      [10]  844 	ld	hl,#6
   5564 39            [11]  845 	add	hl,sp
   5565 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   5566 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   5569 E5            [11]  849 	push	hl
   556A 21 00 C0      [10]  850 	ld	hl,#0xC000
   556D E5            [11]  851 	push	hl
   556E CD A3 64      [17]  852 	call	_cpct_getScreenPtr
   5571 4D            [ 4]  853 	ld	c,l
   5572 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   5573 21 02 00      [10]  856 	ld	hl,#0x0002
   5576 E5            [11]  857 	push	hl
   5577 C5            [11]  858 	push	bc
   5578 21 CE 55      [10]  859 	ld	hl,#___str_14
   557B E5            [11]  860 	push	hl
   557C CD BC 58      [17]  861 	call	_cpct_drawStringM0
   557F 21 06 00      [10]  862 	ld	hl,#6
   5582 39            [11]  863 	add	hl,sp
   5583 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   5584                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   5584 CD 23 58      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   5587 21 04 40      [10]  870 	ld	hl,#0x4004
   558A CD A4 58      [17]  871 	call	_cpct_isKeyPressed
   558D 7D            [ 4]  872 	ld	a,l
   558E B7            [ 4]  873 	or	a, a
   558F 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   5591 CD 23 58      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   5594                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   5594 CD 34 54      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   5597 21 07 10      [10]  882 	ld	hl,#0x1007
   559A CD A4 58      [17]  883 	call	_cpct_isKeyPressed
   559D 7D            [ 4]  884 	ld	a,l
   559E B7            [ 4]  885 	or	a, a
   559F 28 F3         [12]  886 	jr	Z,00101$
   55A1                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   55A1 21 07 10      [10]  889 	ld	hl,#0x1007
   55A4 CD A4 58      [17]  890 	call	_cpct_isKeyPressed
   55A7 7D            [ 4]  891 	ld	a,l
   55A8 B7            [ 4]  892 	or	a, a
   55A9 C0            [11]  893 	ret	NZ
   55AA 21 04 40      [10]  894 	ld	hl,#0x4004
   55AD CD A4 58      [17]  895 	call	_cpct_isKeyPressed
   55B0 7D            [ 4]  896 	ld	a,l
   55B1 B7            [ 4]  897 	or	a, a
   55B2 28 D0         [12]  898 	jr	Z,00107$
   55B4 C9            [10]  899 	ret
   55B5                     900 ___str_12:
   55B5 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   55BC 00                  902 	.db 0x00
   55BD                     903 ___str_13:
   55BD 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   55CD 00                  905 	.db 0x00
   55CE                     906 ___str_14:
   55CE 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   55DD 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
