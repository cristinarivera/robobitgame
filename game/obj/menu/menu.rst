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
   502E                      60 _menuFin::
   502E DD E5         [15]   61 	push	ix
   5030 DD 21 00 00   [14]   62 	ld	ix,#0
   5034 DD 39         [15]   63 	add	ix,sp
   5036 F5            [11]   64 	push	af
   5037 F5            [11]   65 	push	af
   5038 DD 75 FE      [19]   66 	ld	-2 (ix),l
   503B DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   503E 21 10 27      [10]   69 	ld	hl,#0x2710
   5041 E5            [11]   70 	push	hl
   5042 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   5045 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   5048 E5            [11]   73 	push	hl
   5049 CD D2 57      [17]   74 	call	__divuint
   504C F1            [10]   75 	pop	af
   504D F1            [10]   76 	pop	af
   504E 33            [ 6]   77 	inc	sp
   504F 33            [ 6]   78 	inc	sp
   5050 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   5051 21 00 40      [10]   81 	ld	hl,#0x4000
   5054 E5            [11]   82 	push	hl
   5055 AF            [ 4]   83 	xor	a, a
   5056 F5            [11]   84 	push	af
   5057 33            [ 6]   85 	inc	sp
   5058 26 C0         [ 7]   86 	ld	h, #0xC0
   505A E5            [11]   87 	push	hl
   505B CD 5B 5B      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   505E 21 18 5A      [10]   90 	ld	hl,#0x5A18
   5061 E5            [11]   91 	push	hl
   5062 21 00 C0      [10]   92 	ld	hl,#0xC000
   5065 E5            [11]   93 	push	hl
   5066 CD 93 64      [17]   94 	call	_cpct_getScreenPtr
   5069 4D            [ 4]   95 	ld	c,l
   506A 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   506B 21 02 00      [10]   98 	ld	hl,#0x0002
   506E E5            [11]   99 	push	hl
   506F C5            [11]  100 	push	bc
   5070 21 90 51      [10]  101 	ld	hl,#___str_0
   5073 E5            [11]  102 	push	hl
   5074 CD AC 58      [17]  103 	call	_cpct_drawStringM0
   5077 21 06 00      [10]  104 	ld	hl,#6
   507A 39            [11]  105 	add	hl,sp
   507B F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   507C 21 14 78      [10]  108 	ld	hl,#0x7814
   507F E5            [11]  109 	push	hl
   5080 21 00 C0      [10]  110 	ld	hl,#0xC000
   5083 E5            [11]  111 	push	hl
   5084 CD 93 64      [17]  112 	call	_cpct_getScreenPtr
   5087 4D            [ 4]  113 	ld	c,l
   5088 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   5089 21 02 00      [10]  116 	ld	hl,#0x0002
   508C E5            [11]  117 	push	hl
   508D C5            [11]  118 	push	bc
   508E 21 9A 51      [10]  119 	ld	hl,#___str_1
   5091 E5            [11]  120 	push	hl
   5092 CD AC 58      [17]  121 	call	_cpct_drawStringM0
   5095 21 06 00      [10]  122 	ld	hl,#6
   5098 39            [11]  123 	add	hl,sp
   5099 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   509A 21 2D 78      [10]  126 	ld	hl,#0x782D
   509D E5            [11]  127 	push	hl
   509E 21 00 C0      [10]  128 	ld	hl,#0xC000
   50A1 E5            [11]  129 	push	hl
   50A2 CD 93 64      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   50A5 E5            [11]  132 	push	hl
   50A6 21 0A 00      [10]  133 	ld	hl,#0x000A
   50A9 E5            [11]  134 	push	hl
   50AA DD 6E FC      [19]  135 	ld	l,-4 (ix)
   50AD DD 66 FD      [19]  136 	ld	h,-3 (ix)
   50B0 E5            [11]  137 	push	hl
   50B1 CD 88 64      [17]  138 	call	__moduint
   50B4 F1            [10]  139 	pop	af
   50B5 F1            [10]  140 	pop	af
   50B6 C1            [10]  141 	pop	bc
   50B7 7D            [ 4]  142 	ld	a,l
   50B8 C6 30         [ 7]  143 	add	a, #0x30
   50BA 67            [ 4]  144 	ld	h,a
   50BB 59            [ 4]  145 	ld	e, c
   50BC 50            [ 4]  146 	ld	d, b
   50BD C5            [11]  147 	push	bc
   50BE E5            [11]  148 	push	hl
   50BF 33            [ 6]  149 	inc	sp
   50C0 21 02 00      [10]  150 	ld	hl,#0x0002
   50C3 E5            [11]  151 	push	hl
   50C4 D5            [11]  152 	push	de
   50C5 CD 04 5A      [17]  153 	call	_cpct_drawCharM0
   50C8 F1            [10]  154 	pop	af
   50C9 33            [ 6]  155 	inc	sp
   50CA 21 E8 03      [10]  156 	ld	hl,#0x03E8
   50CD E3            [19]  157 	ex	(sp),hl
   50CE DD 6E FE      [19]  158 	ld	l,-2 (ix)
   50D1 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   50D4 E5            [11]  160 	push	hl
   50D5 CD D2 57      [17]  161 	call	__divuint
   50D8 F1            [10]  162 	pop	af
   50D9 F1            [10]  163 	pop	af
   50DA 11 0A 00      [10]  164 	ld	de,#0x000A
   50DD D5            [11]  165 	push	de
   50DE E5            [11]  166 	push	hl
   50DF CD 88 64      [17]  167 	call	__moduint
   50E2 F1            [10]  168 	pop	af
   50E3 F1            [10]  169 	pop	af
   50E4 C1            [10]  170 	pop	bc
   50E5 7D            [ 4]  171 	ld	a,l
   50E6 C6 30         [ 7]  172 	add	a, #0x30
   50E8 67            [ 4]  173 	ld	h,a
   50E9 79            [ 4]  174 	ld	a,c
   50EA C6 04         [ 7]  175 	add	a, #0x04
   50EC 5F            [ 4]  176 	ld	e,a
   50ED 78            [ 4]  177 	ld	a,b
   50EE CE 00         [ 7]  178 	adc	a, #0x00
   50F0 57            [ 4]  179 	ld	d,a
   50F1 C5            [11]  180 	push	bc
   50F2 E5            [11]  181 	push	hl
   50F3 33            [ 6]  182 	inc	sp
   50F4 21 02 00      [10]  183 	ld	hl,#0x0002
   50F7 E5            [11]  184 	push	hl
   50F8 D5            [11]  185 	push	de
   50F9 CD 04 5A      [17]  186 	call	_cpct_drawCharM0
   50FC F1            [10]  187 	pop	af
   50FD 33            [ 6]  188 	inc	sp
   50FE 21 64 00      [10]  189 	ld	hl,#0x0064
   5101 E3            [19]  190 	ex	(sp),hl
   5102 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   5105 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   5108 E5            [11]  193 	push	hl
   5109 CD D2 57      [17]  194 	call	__divuint
   510C F1            [10]  195 	pop	af
   510D F1            [10]  196 	pop	af
   510E 11 0A 00      [10]  197 	ld	de,#0x000A
   5111 D5            [11]  198 	push	de
   5112 E5            [11]  199 	push	hl
   5113 CD 88 64      [17]  200 	call	__moduint
   5116 F1            [10]  201 	pop	af
   5117 F1            [10]  202 	pop	af
   5118 C1            [10]  203 	pop	bc
   5119 7D            [ 4]  204 	ld	a,l
   511A C6 30         [ 7]  205 	add	a, #0x30
   511C 67            [ 4]  206 	ld	h,a
   511D 79            [ 4]  207 	ld	a,c
   511E C6 08         [ 7]  208 	add	a, #0x08
   5120 5F            [ 4]  209 	ld	e,a
   5121 78            [ 4]  210 	ld	a,b
   5122 CE 00         [ 7]  211 	adc	a, #0x00
   5124 57            [ 4]  212 	ld	d,a
   5125 C5            [11]  213 	push	bc
   5126 E5            [11]  214 	push	hl
   5127 33            [ 6]  215 	inc	sp
   5128 21 02 00      [10]  216 	ld	hl,#0x0002
   512B E5            [11]  217 	push	hl
   512C D5            [11]  218 	push	de
   512D CD 04 5A      [17]  219 	call	_cpct_drawCharM0
   5130 F1            [10]  220 	pop	af
   5131 33            [ 6]  221 	inc	sp
   5132 21 0A 00      [10]  222 	ld	hl,#0x000A
   5135 E3            [19]  223 	ex	(sp),hl
   5136 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   5139 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   513C E5            [11]  226 	push	hl
   513D CD D2 57      [17]  227 	call	__divuint
   5140 F1            [10]  228 	pop	af
   5141 F1            [10]  229 	pop	af
   5142 11 0A 00      [10]  230 	ld	de,#0x000A
   5145 D5            [11]  231 	push	de
   5146 E5            [11]  232 	push	hl
   5147 CD 88 64      [17]  233 	call	__moduint
   514A F1            [10]  234 	pop	af
   514B F1            [10]  235 	pop	af
   514C C1            [10]  236 	pop	bc
   514D 7D            [ 4]  237 	ld	a,l
   514E C6 30         [ 7]  238 	add	a, #0x30
   5150 67            [ 4]  239 	ld	h,a
   5151 79            [ 4]  240 	ld	a,c
   5152 C6 0C         [ 7]  241 	add	a, #0x0C
   5154 5F            [ 4]  242 	ld	e,a
   5155 78            [ 4]  243 	ld	a,b
   5156 CE 00         [ 7]  244 	adc	a, #0x00
   5158 57            [ 4]  245 	ld	d,a
   5159 C5            [11]  246 	push	bc
   515A E5            [11]  247 	push	hl
   515B 33            [ 6]  248 	inc	sp
   515C 21 02 00      [10]  249 	ld	hl,#0x0002
   515F E5            [11]  250 	push	hl
   5160 D5            [11]  251 	push	de
   5161 CD 04 5A      [17]  252 	call	_cpct_drawCharM0
   5164 F1            [10]  253 	pop	af
   5165 33            [ 6]  254 	inc	sp
   5166 21 0A 00      [10]  255 	ld	hl,#0x000A
   5169 E3            [19]  256 	ex	(sp),hl
   516A DD 6E FE      [19]  257 	ld	l,-2 (ix)
   516D DD 66 FF      [19]  258 	ld	h,-1 (ix)
   5170 E5            [11]  259 	push	hl
   5171 CD 88 64      [17]  260 	call	__moduint
   5174 F1            [10]  261 	pop	af
   5175 F1            [10]  262 	pop	af
   5176 C1            [10]  263 	pop	bc
   5177 7D            [ 4]  264 	ld	a,l
   5178 C6 30         [ 7]  265 	add	a, #0x30
   517A 57            [ 4]  266 	ld	d,a
   517B 21 10 00      [10]  267 	ld	hl,#0x0010
   517E 09            [11]  268 	add	hl,bc
   517F 4D            [ 4]  269 	ld	c,l
   5180 44            [ 4]  270 	ld	b,h
   5181 D5            [11]  271 	push	de
   5182 33            [ 6]  272 	inc	sp
   5183 21 02 00      [10]  273 	ld	hl,#0x0002
   5186 E5            [11]  274 	push	hl
   5187 C5            [11]  275 	push	bc
   5188 CD 04 5A      [17]  276 	call	_cpct_drawCharM0
   518B F1            [10]  277 	pop	af
   518C F1            [10]  278 	pop	af
   518D 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   518E                     281 00102$:
   518E 18 FE         [12]  282 	jr	00102$
   5190                     283 ___str_0:
   5190 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   5199 00                  285 	.db 0x00
   519A                     286 ___str_1:
   519A 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   51A1 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   51A2                     293 _borrarPantalla::
   51A2 DD E5         [15]  294 	push	ix
   51A4 DD 21 00 00   [14]  295 	ld	ix,#0
   51A8 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   51AA 3E 28         [ 7]  298 	ld	a,#0x28
   51AC DD 96 06      [19]  299 	sub	a, 6 (ix)
   51AF 3E 00         [ 7]  300 	ld	a,#0x00
   51B1 17            [ 4]  301 	rla
   51B2 4F            [ 4]  302 	ld	c,a
   51B3 CB 41         [ 8]  303 	bit	0,c
   51B5 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   51B7 DD 66 05      [19]  306 	ld	h,5 (ix)
   51BA DD 6E 04      [19]  307 	ld	l,4 (ix)
   51BD E5            [11]  308 	push	hl
   51BE 21 00 C0      [10]  309 	ld	hl,#0xC000
   51C1 E5            [11]  310 	push	hl
   51C2 CD 93 64      [17]  311 	call	_cpct_getScreenPtr
   51C5 4D            [ 4]  312 	ld	c,l
   51C6 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   51C7 DD 66 07      [19]  315 	ld	h,7 (ix)
   51CA DD 6E 06      [19]  316 	ld	l,6 (ix)
   51CD E5            [11]  317 	push	hl
   51CE AF            [ 4]  318 	xor	a, a
   51CF F5            [11]  319 	push	af
   51D0 33            [ 6]  320 	inc	sp
   51D1 C5            [11]  321 	push	bc
   51D2 CD 79 5B      [17]  322 	call	_cpct_drawSolidBox
   51D5 F1            [10]  323 	pop	af
   51D6 F1            [10]  324 	pop	af
   51D7 33            [ 6]  325 	inc	sp
   51D8 18 51         [12]  326 	jr	00106$
   51DA                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   51DA CB 41         [ 8]  329 	bit	0,c
   51DC 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   51DE DD 66 05      [19]  332 	ld	h,5 (ix)
   51E1 DD 6E 04      [19]  333 	ld	l,4 (ix)
   51E4 E5            [11]  334 	push	hl
   51E5 21 00 C0      [10]  335 	ld	hl,#0xC000
   51E8 E5            [11]  336 	push	hl
   51E9 CD 93 64      [17]  337 	call	_cpct_getScreenPtr
   51EC 4D            [ 4]  338 	ld	c,l
   51ED 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   51EE DD 7E 07      [19]  341 	ld	a,7 (ix)
   51F1 F5            [11]  342 	push	af
   51F2 33            [ 6]  343 	inc	sp
   51F3 21 00 28      [10]  344 	ld	hl,#0x2800
   51F6 E5            [11]  345 	push	hl
   51F7 C5            [11]  346 	push	bc
   51F8 CD 79 5B      [17]  347 	call	_cpct_drawSolidBox
   51FB F1            [10]  348 	pop	af
   51FC F1            [10]  349 	pop	af
   51FD 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   51FE DD 7E 04      [19]  352 	ld	a,4 (ix)
   5201 C6 28         [ 7]  353 	add	a, #0x28
   5203 47            [ 4]  354 	ld	b,a
   5204 DD 7E 05      [19]  355 	ld	a,5 (ix)
   5207 F5            [11]  356 	push	af
   5208 33            [ 6]  357 	inc	sp
   5209 C5            [11]  358 	push	bc
   520A 33            [ 6]  359 	inc	sp
   520B 21 00 C0      [10]  360 	ld	hl,#0xC000
   520E E5            [11]  361 	push	hl
   520F CD 93 64      [17]  362 	call	_cpct_getScreenPtr
   5212 4D            [ 4]  363 	ld	c,l
   5213 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   5214 DD 7E 06      [19]  366 	ld	a,6 (ix)
   5217 C6 D8         [ 7]  367 	add	a,#0xD8
   5219 57            [ 4]  368 	ld	d,a
   521A DD 7E 07      [19]  369 	ld	a,7 (ix)
   521D F5            [11]  370 	push	af
   521E 33            [ 6]  371 	inc	sp
   521F D5            [11]  372 	push	de
   5220 33            [ 6]  373 	inc	sp
   5221 AF            [ 4]  374 	xor	a, a
   5222 F5            [11]  375 	push	af
   5223 33            [ 6]  376 	inc	sp
   5224 C5            [11]  377 	push	bc
   5225 CD 79 5B      [17]  378 	call	_cpct_drawSolidBox
   5228 F1            [10]  379 	pop	af
   5229 F1            [10]  380 	pop	af
   522A 33            [ 6]  381 	inc	sp
   522B                     382 00106$:
   522B DD E1         [14]  383 	pop	ix
   522D C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   522E                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   522E 21 50 82      [10]  391 	ld	hl,#0x8250
   5231 E5            [11]  392 	push	hl
   5232 21 00 1E      [10]  393 	ld	hl,#0x1E00
   5235 E5            [11]  394 	push	hl
   5236 CD A2 51      [17]  395 	call	_borrarPantalla
   5239 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   523A 21 10 55      [10]  398 	ld	hl, #0x5510
   523D E3            [19]  399 	ex	(sp),hl
   523E 21 00 C0      [10]  400 	ld	hl,#0xC000
   5241 E5            [11]  401 	push	hl
   5242 CD 93 64      [17]  402 	call	_cpct_getScreenPtr
   5245 4D            [ 4]  403 	ld	c,l
   5246 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   5247 21 02 00      [10]  406 	ld	hl,#0x0002
   524A E5            [11]  407 	push	hl
   524B C5            [11]  408 	push	bc
   524C 21 1C 53      [10]  409 	ld	hl,#___str_2
   524F E5            [11]  410 	push	hl
   5250 CD AC 58      [17]  411 	call	_cpct_drawStringM0
   5253 21 06 00      [10]  412 	ld	hl,#6
   5256 39            [11]  413 	add	hl,sp
   5257 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   5258 21 04 73      [10]  416 	ld	hl,#0x7304
   525B E5            [11]  417 	push	hl
   525C 21 00 C0      [10]  418 	ld	hl,#0xC000
   525F E5            [11]  419 	push	hl
   5260 CD 93 64      [17]  420 	call	_cpct_getScreenPtr
   5263 4D            [ 4]  421 	ld	c,l
   5264 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   5265 21 05 0A      [10]  424 	ld	hl,#0x0A05
   5268 E5            [11]  425 	push	hl
   5269 C5            [11]  426 	push	bc
   526A 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   526D E5            [11]  428 	push	hl
   526E CD D0 58      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   5271 21 0E 73      [10]  431 	ld	hl,#0x730E
   5274 E5            [11]  432 	push	hl
   5275 21 00 C0      [10]  433 	ld	hl,#0xC000
   5278 E5            [11]  434 	push	hl
   5279 CD 93 64      [17]  435 	call	_cpct_getScreenPtr
   527C 4D            [ 4]  436 	ld	c,l
   527D 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   527E 21 05 0A      [10]  439 	ld	hl,#0x0A05
   5281 E5            [11]  440 	push	hl
   5282 C5            [11]  441 	push	bc
   5283 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   5286 E5            [11]  443 	push	hl
   5287 CD D0 58      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   528A 21 18 73      [10]  446 	ld	hl,#0x7318
   528D E5            [11]  447 	push	hl
   528E 21 00 C0      [10]  448 	ld	hl,#0xC000
   5291 E5            [11]  449 	push	hl
   5292 CD 93 64      [17]  450 	call	_cpct_getScreenPtr
   5295 4D            [ 4]  451 	ld	c,l
   5296 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   5297 21 05 0A      [10]  454 	ld	hl,#0x0A05
   529A E5            [11]  455 	push	hl
   529B C5            [11]  456 	push	bc
   529C 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   529F E5            [11]  458 	push	hl
   52A0 CD D0 58      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   52A3 21 22 73      [10]  461 	ld	hl,#0x7322
   52A6 E5            [11]  462 	push	hl
   52A7 21 00 C0      [10]  463 	ld	hl,#0xC000
   52AA E5            [11]  464 	push	hl
   52AB CD 93 64      [17]  465 	call	_cpct_getScreenPtr
   52AE 4D            [ 4]  466 	ld	c,l
   52AF 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   52B0 21 05 0A      [10]  469 	ld	hl,#0x0A05
   52B3 E5            [11]  470 	push	hl
   52B4 C5            [11]  471 	push	bc
   52B5 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   52B8 E5            [11]  473 	push	hl
   52B9 CD D0 58      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   52BC 21 2D 73      [10]  476 	ld	hl,#0x732D
   52BF E5            [11]  477 	push	hl
   52C0 21 00 C0      [10]  478 	ld	hl,#0xC000
   52C3 E5            [11]  479 	push	hl
   52C4 CD 93 64      [17]  480 	call	_cpct_getScreenPtr
   52C7 4D            [ 4]  481 	ld	c,l
   52C8 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   52C9 21 02 00      [10]  484 	ld	hl,#0x0002
   52CC E5            [11]  485 	push	hl
   52CD C5            [11]  486 	push	bc
   52CE 21 29 53      [10]  487 	ld	hl,#___str_3
   52D1 E5            [11]  488 	push	hl
   52D2 CD AC 58      [17]  489 	call	_cpct_drawStringM0
   52D5 21 06 00      [10]  490 	ld	hl,#6
   52D8 39            [11]  491 	add	hl,sp
   52D9 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   52DA 21 04 82      [10]  494 	ld	hl,#0x8204
   52DD E5            [11]  495 	push	hl
   52DE 21 00 C0      [10]  496 	ld	hl,#0xC000
   52E1 E5            [11]  497 	push	hl
   52E2 CD 93 64      [17]  498 	call	_cpct_getScreenPtr
   52E5 4D            [ 4]  499 	ld	c,l
   52E6 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   52E7 21 02 00      [10]  502 	ld	hl,#0x0002
   52EA E5            [11]  503 	push	hl
   52EB C5            [11]  504 	push	bc
   52EC 21 32 53      [10]  505 	ld	hl,#___str_4
   52EF E5            [11]  506 	push	hl
   52F0 CD AC 58      [17]  507 	call	_cpct_drawStringM0
   52F3 21 06 00      [10]  508 	ld	hl,#6
   52F6 39            [11]  509 	add	hl,sp
   52F7 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   52F8                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   52F8 CD 13 58      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   52FB 21 04 40      [10]  516 	ld	hl,#0x4004
   52FE CD 94 58      [17]  517 	call	_cpct_isKeyPressed
   5301 7D            [ 4]  518 	ld	a,l
   5302 B7            [ 4]  519 	or	a, a
   5303 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   5305 CD 24 54      [17]  522 	call	_menuOpciones
   5308                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5308 21 07 10      [10]  525 	ld	hl,#0x1007
   530B CD 94 58      [17]  526 	call	_cpct_isKeyPressed
   530E 7D            [ 4]  527 	ld	a,l
   530F B7            [ 4]  528 	or	a, a
   5310 C0            [11]  529 	ret	NZ
   5311 21 04 40      [10]  530 	ld	hl,#0x4004
   5314 CD 94 58      [17]  531 	call	_cpct_isKeyPressed
   5317 7D            [ 4]  532 	ld	a,l
   5318 B7            [ 4]  533 	or	a, a
   5319 28 DD         [12]  534 	jr	Z,00104$
   531B C9            [10]  535 	ret
   531C                     536 ___str_2:
   531C 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   5328 00                  538 	.db 0x00
   5329                     539 ___str_3:
   5329 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   5331 00                  541 	.db 0x00
   5332                     542 ___str_4:
   5332 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   5344 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   5345                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   5345 21 50 82      [10]  551 	ld	hl,#0x8250
   5348 E5            [11]  552 	push	hl
   5349 21 00 1E      [10]  553 	ld	hl,#0x1E00
   534C E5            [11]  554 	push	hl
   534D CD A2 51      [17]  555 	call	_borrarPantalla
   5350 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   5351 21 1A 46      [10]  558 	ld	hl, #0x461A
   5354 E3            [19]  559 	ex	(sp),hl
   5355 21 00 C0      [10]  560 	ld	hl,#0xC000
   5358 E5            [11]  561 	push	hl
   5359 CD 93 64      [17]  562 	call	_cpct_getScreenPtr
   535C 4D            [ 4]  563 	ld	c,l
   535D 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   535E 21 02 00      [10]  566 	ld	hl,#0x0002
   5361 E5            [11]  567 	push	hl
   5362 C5            [11]  568 	push	bc
   5363 21 ED 53      [10]  569 	ld	hl,#___str_5
   5366 E5            [11]  570 	push	hl
   5367 CD AC 58      [17]  571 	call	_cpct_drawStringM0
   536A 21 06 00      [10]  572 	ld	hl,#6
   536D 39            [11]  573 	add	hl,sp
   536E F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   536F 21 0A 64      [10]  576 	ld	hl,#0x640A
   5372 E5            [11]  577 	push	hl
   5373 21 00 C0      [10]  578 	ld	hl,#0xC000
   5376 E5            [11]  579 	push	hl
   5377 CD 93 64      [17]  580 	call	_cpct_getScreenPtr
   537A 4D            [ 4]  581 	ld	c,l
   537B 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   537C 21 02 00      [10]  584 	ld	hl,#0x0002
   537F E5            [11]  585 	push	hl
   5380 C5            [11]  586 	push	bc
   5381 21 F5 53      [10]  587 	ld	hl,#___str_6
   5384 E5            [11]  588 	push	hl
   5385 CD AC 58      [17]  589 	call	_cpct_drawStringM0
   5388 21 06 00      [10]  590 	ld	hl,#6
   538B 39            [11]  591 	add	hl,sp
   538C F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   538D 21 0E 73      [10]  594 	ld	hl,#0x730E
   5390 E5            [11]  595 	push	hl
   5391 21 00 C0      [10]  596 	ld	hl,#0xC000
   5394 E5            [11]  597 	push	hl
   5395 CD 93 64      [17]  598 	call	_cpct_getScreenPtr
   5398 4D            [ 4]  599 	ld	c,l
   5399 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   539A 21 02 00      [10]  602 	ld	hl,#0x0002
   539D E5            [11]  603 	push	hl
   539E C5            [11]  604 	push	bc
   539F 21 05 54      [10]  605 	ld	hl,#___str_7
   53A2 E5            [11]  606 	push	hl
   53A3 CD AC 58      [17]  607 	call	_cpct_drawStringM0
   53A6 21 06 00      [10]  608 	ld	hl,#6
   53A9 39            [11]  609 	add	hl,sp
   53AA F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   53AB 21 08 82      [10]  612 	ld	hl,#0x8208
   53AE E5            [11]  613 	push	hl
   53AF 21 00 C0      [10]  614 	ld	hl,#0xC000
   53B2 E5            [11]  615 	push	hl
   53B3 CD 93 64      [17]  616 	call	_cpct_getScreenPtr
   53B6 4D            [ 4]  617 	ld	c,l
   53B7 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   53B8 21 02 00      [10]  620 	ld	hl,#0x0002
   53BB E5            [11]  621 	push	hl
   53BC C5            [11]  622 	push	bc
   53BD 21 13 54      [10]  623 	ld	hl,#___str_8
   53C0 E5            [11]  624 	push	hl
   53C1 CD AC 58      [17]  625 	call	_cpct_drawStringM0
   53C4 21 06 00      [10]  626 	ld	hl,#6
   53C7 39            [11]  627 	add	hl,sp
   53C8 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   53C9                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   53C9 CD 13 58      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   53CC 21 04 40      [10]  634 	ld	hl,#0x4004
   53CF CD 94 58      [17]  635 	call	_cpct_isKeyPressed
   53D2 7D            [ 4]  636 	ld	a,l
   53D3 B7            [ 4]  637 	or	a, a
   53D4 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   53D6 CD 24 54      [17]  640 	call	_menuOpciones
   53D9                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   53D9 21 07 10      [10]  643 	ld	hl,#0x1007
   53DC CD 94 58      [17]  644 	call	_cpct_isKeyPressed
   53DF 7D            [ 4]  645 	ld	a,l
   53E0 B7            [ 4]  646 	or	a, a
   53E1 C0            [11]  647 	ret	NZ
   53E2 21 04 40      [10]  648 	ld	hl,#0x4004
   53E5 CD 94 58      [17]  649 	call	_cpct_isKeyPressed
   53E8 7D            [ 4]  650 	ld	a,l
   53E9 B7            [ 4]  651 	or	a, a
   53EA 28 DD         [12]  652 	jr	Z,00104$
   53EC C9            [10]  653 	ret
   53ED                     654 ___str_5:
   53ED 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   53F4 00                  656 	.db 0x00
   53F5                     657 ___str_6:
   53F5 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   5404 00                  659 	.db 0x00
   5405                     660 ___str_7:
   5405 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   5412 00                  662 	.db 0x00
   5413                     663 ___str_8:
   5413 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   5423 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   5424                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   5424 21 50 82      [10]  672 	ld	hl,#0x8250
   5427 E5            [11]  673 	push	hl
   5428 21 00 1E      [10]  674 	ld	hl,#0x1E00
   542B E5            [11]  675 	push	hl
   542C CD A2 51      [17]  676 	call	_borrarPantalla
   542F F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   5430 21 20 64      [10]  679 	ld	hl, #0x6420
   5433 E3            [19]  680 	ex	(sp),hl
   5434 21 00 C0      [10]  681 	ld	hl,#0xC000
   5437 E5            [11]  682 	push	hl
   5438 CD 93 64      [17]  683 	call	_cpct_getScreenPtr
   543B 4D            [ 4]  684 	ld	c,l
   543C 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   543D 21 02 00      [10]  687 	ld	hl,#0x0002
   5440 E5            [11]  688 	push	hl
   5441 C5            [11]  689 	push	bc
   5442 21 C5 54      [10]  690 	ld	hl,#___str_9
   5445 E5            [11]  691 	push	hl
   5446 CD AC 58      [17]  692 	call	_cpct_drawStringM0
   5449 21 06 00      [10]  693 	ld	hl,#6
   544C 39            [11]  694 	add	hl,sp
   544D F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   544E 21 00 82      [10]  697 	ld	hl,#0x8200
   5451 E5            [11]  698 	push	hl
   5452 26 C0         [ 7]  699 	ld	h, #0xC0
   5454 E5            [11]  700 	push	hl
   5455 CD 93 64      [17]  701 	call	_cpct_getScreenPtr
   5458 4D            [ 4]  702 	ld	c,l
   5459 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   545A 21 02 00      [10]  705 	ld	hl,#0x0002
   545D E5            [11]  706 	push	hl
   545E C5            [11]  707 	push	bc
   545F 21 CA 54      [10]  708 	ld	hl,#___str_10
   5462 E5            [11]  709 	push	hl
   5463 CD AC 58      [17]  710 	call	_cpct_drawStringM0
   5466 21 06 00      [10]  711 	ld	hl,#6
   5469 39            [11]  712 	add	hl,sp
   546A F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   546B 21 0A 91      [10]  715 	ld	hl,#0x910A
   546E E5            [11]  716 	push	hl
   546F 21 00 C0      [10]  717 	ld	hl,#0xC000
   5472 E5            [11]  718 	push	hl
   5473 CD 93 64      [17]  719 	call	_cpct_getScreenPtr
   5476 4D            [ 4]  720 	ld	c,l
   5477 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   5478 21 02 00      [10]  723 	ld	hl,#0x0002
   547B E5            [11]  724 	push	hl
   547C C5            [11]  725 	push	bc
   547D 21 DF 54      [10]  726 	ld	hl,#___str_11
   5480 E5            [11]  727 	push	hl
   5481 CD AC 58      [17]  728 	call	_cpct_drawStringM0
   5484 21 06 00      [10]  729 	ld	hl,#6
   5487 39            [11]  730 	add	hl,sp
   5488 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   5489                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   5489 CD 13 58      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   548C 21 04 08      [10]  737 	ld	hl,#0x0804
   548F CD 94 58      [17]  738 	call	_cpct_isKeyPressed
   5492 7D            [ 4]  739 	ld	a,l
   5493 B7            [ 4]  740 	or	a, a
   5494 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   5496 CD 2E 52      [17]  743 	call	_menuInstrucciones
   5499 18 0D         [12]  744 	jr	00109$
   549B                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   549B 21 07 40      [10]  747 	ld	hl,#0x4007
   549E CD 94 58      [17]  748 	call	_cpct_isKeyPressed
   54A1 7D            [ 4]  749 	ld	a,l
   54A2 B7            [ 4]  750 	or	a, a
   54A3 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   54A5 CD 45 53      [17]  753 	call	_menuCreditos
   54A8                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   54A8 21 07 10      [10]  756 	ld	hl,#0x1007
   54AB CD 94 58      [17]  757 	call	_cpct_isKeyPressed
   54AE 7D            [ 4]  758 	ld	a,l
   54AF B7            [ 4]  759 	or	a, a
   54B0 C0            [11]  760 	ret	NZ
   54B1 21 04 08      [10]  761 	ld	hl,#0x0804
   54B4 CD 94 58      [17]  762 	call	_cpct_isKeyPressed
   54B7 7D            [ 4]  763 	ld	a,l
   54B8 B7            [ 4]  764 	or	a, a
   54B9 C0            [11]  765 	ret	NZ
   54BA 21 07 40      [10]  766 	ld	hl,#0x4007
   54BD CD 94 58      [17]  767 	call	_cpct_isKeyPressed
   54C0 7D            [ 4]  768 	ld	a,l
   54C1 B7            [ 4]  769 	or	a, a
   54C2 28 C5         [12]  770 	jr	Z,00108$
   54C4 C9            [10]  771 	ret
   54C5                     772 ___str_9:
   54C5 4D 45 4E 55         773 	.ascii "MENU"
   54C9 00                  774 	.db 0x00
   54CA                     775 ___str_10:
   54CA 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   54DE 00                  777 	.db 0x00
   54DF                     778 ___str_11:
   54DF 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   54EE 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   54EF                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   54EF 21 00 40      [10]  787 	ld	hl,#0x4000
   54F2 E5            [11]  788 	push	hl
   54F3 AF            [ 4]  789 	xor	a, a
   54F4 F5            [11]  790 	push	af
   54F5 33            [ 6]  791 	inc	sp
   54F6 26 C0         [ 7]  792 	ld	h, #0xC0
   54F8 E5            [11]  793 	push	hl
   54F9 CD 5B 5B      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   54FC 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   54FF E5            [11]  797 	push	hl
   5500 21 00 C0      [10]  798 	ld	hl,#0xC000
   5503 E5            [11]  799 	push	hl
   5504 CD 93 64      [17]  800 	call	_cpct_getScreenPtr
   5507 4D            [ 4]  801 	ld	c,l
   5508 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   5509 21 04 00      [10]  804 	ld	hl,#0x0004
   550C E5            [11]  805 	push	hl
   550D C5            [11]  806 	push	bc
   550E 21 A5 55      [10]  807 	ld	hl,#___str_12
   5511 E5            [11]  808 	push	hl
   5512 CD AC 58      [17]  809 	call	_cpct_drawStringM0
   5515 21 06 00      [10]  810 	ld	hl,#6
   5518 39            [11]  811 	add	hl,sp
   5519 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   551A 21 28 6E      [10]  814 	ld	hl,#0x6E28
   551D E5            [11]  815 	push	hl
   551E 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   5521 E5            [11]  817 	push	hl
   5522 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   5525 E5            [11]  819 	push	hl
   5526 CD D0 58      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   5529 21 28 6E      [10]  822 	ld	hl,#0x6E28
   552C E5            [11]  823 	push	hl
   552D 21 18 F1      [10]  824 	ld	hl,#0xF118
   5530 E5            [11]  825 	push	hl
   5531 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   5534 E5            [11]  827 	push	hl
   5535 CD D0 58      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   5538 21 08 A0      [10]  830 	ld	hl,#0xA008
   553B E5            [11]  831 	push	hl
   553C 21 00 C0      [10]  832 	ld	hl,#0xC000
   553F E5            [11]  833 	push	hl
   5540 CD 93 64      [17]  834 	call	_cpct_getScreenPtr
   5543 4D            [ 4]  835 	ld	c,l
   5544 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   5545 21 02 00      [10]  838 	ld	hl,#0x0002
   5548 E5            [11]  839 	push	hl
   5549 C5            [11]  840 	push	bc
   554A 21 AD 55      [10]  841 	ld	hl,#___str_13
   554D E5            [11]  842 	push	hl
   554E CD AC 58      [17]  843 	call	_cpct_drawStringM0
   5551 21 06 00      [10]  844 	ld	hl,#6
   5554 39            [11]  845 	add	hl,sp
   5555 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   5556 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   5559 E5            [11]  849 	push	hl
   555A 21 00 C0      [10]  850 	ld	hl,#0xC000
   555D E5            [11]  851 	push	hl
   555E CD 93 64      [17]  852 	call	_cpct_getScreenPtr
   5561 4D            [ 4]  853 	ld	c,l
   5562 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   5563 21 02 00      [10]  856 	ld	hl,#0x0002
   5566 E5            [11]  857 	push	hl
   5567 C5            [11]  858 	push	bc
   5568 21 BE 55      [10]  859 	ld	hl,#___str_14
   556B E5            [11]  860 	push	hl
   556C CD AC 58      [17]  861 	call	_cpct_drawStringM0
   556F 21 06 00      [10]  862 	ld	hl,#6
   5572 39            [11]  863 	add	hl,sp
   5573 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   5574                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   5574 CD 13 58      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   5577 21 04 40      [10]  870 	ld	hl,#0x4004
   557A CD 94 58      [17]  871 	call	_cpct_isKeyPressed
   557D 7D            [ 4]  872 	ld	a,l
   557E B7            [ 4]  873 	or	a, a
   557F 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   5581 CD 13 58      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   5584                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   5584 CD 24 54      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   5587 21 07 10      [10]  882 	ld	hl,#0x1007
   558A CD 94 58      [17]  883 	call	_cpct_isKeyPressed
   558D 7D            [ 4]  884 	ld	a,l
   558E B7            [ 4]  885 	or	a, a
   558F 28 F3         [12]  886 	jr	Z,00101$
   5591                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5591 21 07 10      [10]  889 	ld	hl,#0x1007
   5594 CD 94 58      [17]  890 	call	_cpct_isKeyPressed
   5597 7D            [ 4]  891 	ld	a,l
   5598 B7            [ 4]  892 	or	a, a
   5599 C0            [11]  893 	ret	NZ
   559A 21 04 40      [10]  894 	ld	hl,#0x4004
   559D CD 94 58      [17]  895 	call	_cpct_isKeyPressed
   55A0 7D            [ 4]  896 	ld	a,l
   55A1 B7            [ 4]  897 	or	a, a
   55A2 28 D0         [12]  898 	jr	Z,00107$
   55A4 C9            [10]  899 	ret
   55A5                     900 ___str_12:
   55A5 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   55AC 00                  902 	.db 0x00
   55AD                     903 ___str_13:
   55AD 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   55BD 00                  905 	.db 0x00
   55BE                     906 ___str_14:
   55BE 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   55CD 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
