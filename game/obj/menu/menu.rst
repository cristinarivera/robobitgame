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
   4BA0                      60 _menuFin::
   4BA0 DD E5         [15]   61 	push	ix
   4BA2 DD 21 00 00   [14]   62 	ld	ix,#0
   4BA6 DD 39         [15]   63 	add	ix,sp
   4BA8 F5            [11]   64 	push	af
   4BA9 F5            [11]   65 	push	af
   4BAA DD 75 FE      [19]   66 	ld	-2 (ix),l
   4BAD DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4BB0 21 10 27      [10]   69 	ld	hl,#0x2710
   4BB3 E5            [11]   70 	push	hl
   4BB4 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4BB7 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4BBA E5            [11]   73 	push	hl
   4BBB CD 44 53      [17]   74 	call	__divuint
   4BBE F1            [10]   75 	pop	af
   4BBF F1            [10]   76 	pop	af
   4BC0 33            [ 6]   77 	inc	sp
   4BC1 33            [ 6]   78 	inc	sp
   4BC2 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4BC3 21 00 40      [10]   81 	ld	hl,#0x4000
   4BC6 E5            [11]   82 	push	hl
   4BC7 AF            [ 4]   83 	xor	a, a
   4BC8 F5            [11]   84 	push	af
   4BC9 33            [ 6]   85 	inc	sp
   4BCA 26 C0         [ 7]   86 	ld	h, #0xC0
   4BCC E5            [11]   87 	push	hl
   4BCD CD CD 56      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4BD0 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4BD3 E5            [11]   91 	push	hl
   4BD4 21 00 C0      [10]   92 	ld	hl,#0xC000
   4BD7 E5            [11]   93 	push	hl
   4BD8 CD 05 60      [17]   94 	call	_cpct_getScreenPtr
   4BDB 4D            [ 4]   95 	ld	c,l
   4BDC 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4BDD 21 02 00      [10]   98 	ld	hl,#0x0002
   4BE0 E5            [11]   99 	push	hl
   4BE1 C5            [11]  100 	push	bc
   4BE2 21 02 4D      [10]  101 	ld	hl,#___str_0
   4BE5 E5            [11]  102 	push	hl
   4BE6 CD 1E 54      [17]  103 	call	_cpct_drawStringM0
   4BE9 21 06 00      [10]  104 	ld	hl,#6
   4BEC 39            [11]  105 	add	hl,sp
   4BED F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4BEE 21 14 78      [10]  108 	ld	hl,#0x7814
   4BF1 E5            [11]  109 	push	hl
   4BF2 21 00 C0      [10]  110 	ld	hl,#0xC000
   4BF5 E5            [11]  111 	push	hl
   4BF6 CD 05 60      [17]  112 	call	_cpct_getScreenPtr
   4BF9 4D            [ 4]  113 	ld	c,l
   4BFA 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4BFB 21 02 00      [10]  116 	ld	hl,#0x0002
   4BFE E5            [11]  117 	push	hl
   4BFF C5            [11]  118 	push	bc
   4C00 21 0C 4D      [10]  119 	ld	hl,#___str_1
   4C03 E5            [11]  120 	push	hl
   4C04 CD 1E 54      [17]  121 	call	_cpct_drawStringM0
   4C07 21 06 00      [10]  122 	ld	hl,#6
   4C0A 39            [11]  123 	add	hl,sp
   4C0B F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4C0C 21 2D 78      [10]  126 	ld	hl,#0x782D
   4C0F E5            [11]  127 	push	hl
   4C10 21 00 C0      [10]  128 	ld	hl,#0xC000
   4C13 E5            [11]  129 	push	hl
   4C14 CD 05 60      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4C17 E5            [11]  132 	push	hl
   4C18 21 0A 00      [10]  133 	ld	hl,#0x000A
   4C1B E5            [11]  134 	push	hl
   4C1C DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4C1F DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4C22 E5            [11]  137 	push	hl
   4C23 CD FA 5F      [17]  138 	call	__moduint
   4C26 F1            [10]  139 	pop	af
   4C27 F1            [10]  140 	pop	af
   4C28 C1            [10]  141 	pop	bc
   4C29 7D            [ 4]  142 	ld	a,l
   4C2A C6 30         [ 7]  143 	add	a, #0x30
   4C2C 67            [ 4]  144 	ld	h,a
   4C2D 59            [ 4]  145 	ld	e, c
   4C2E 50            [ 4]  146 	ld	d, b
   4C2F C5            [11]  147 	push	bc
   4C30 E5            [11]  148 	push	hl
   4C31 33            [ 6]  149 	inc	sp
   4C32 21 02 00      [10]  150 	ld	hl,#0x0002
   4C35 E5            [11]  151 	push	hl
   4C36 D5            [11]  152 	push	de
   4C37 CD 76 55      [17]  153 	call	_cpct_drawCharM0
   4C3A F1            [10]  154 	pop	af
   4C3B 33            [ 6]  155 	inc	sp
   4C3C 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4C3F E3            [19]  157 	ex	(sp),hl
   4C40 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4C43 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4C46 E5            [11]  160 	push	hl
   4C47 CD 44 53      [17]  161 	call	__divuint
   4C4A F1            [10]  162 	pop	af
   4C4B F1            [10]  163 	pop	af
   4C4C 11 0A 00      [10]  164 	ld	de,#0x000A
   4C4F D5            [11]  165 	push	de
   4C50 E5            [11]  166 	push	hl
   4C51 CD FA 5F      [17]  167 	call	__moduint
   4C54 F1            [10]  168 	pop	af
   4C55 F1            [10]  169 	pop	af
   4C56 C1            [10]  170 	pop	bc
   4C57 7D            [ 4]  171 	ld	a,l
   4C58 C6 30         [ 7]  172 	add	a, #0x30
   4C5A 67            [ 4]  173 	ld	h,a
   4C5B 79            [ 4]  174 	ld	a,c
   4C5C C6 04         [ 7]  175 	add	a, #0x04
   4C5E 5F            [ 4]  176 	ld	e,a
   4C5F 78            [ 4]  177 	ld	a,b
   4C60 CE 00         [ 7]  178 	adc	a, #0x00
   4C62 57            [ 4]  179 	ld	d,a
   4C63 C5            [11]  180 	push	bc
   4C64 E5            [11]  181 	push	hl
   4C65 33            [ 6]  182 	inc	sp
   4C66 21 02 00      [10]  183 	ld	hl,#0x0002
   4C69 E5            [11]  184 	push	hl
   4C6A D5            [11]  185 	push	de
   4C6B CD 76 55      [17]  186 	call	_cpct_drawCharM0
   4C6E F1            [10]  187 	pop	af
   4C6F 33            [ 6]  188 	inc	sp
   4C70 21 64 00      [10]  189 	ld	hl,#0x0064
   4C73 E3            [19]  190 	ex	(sp),hl
   4C74 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4C77 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4C7A E5            [11]  193 	push	hl
   4C7B CD 44 53      [17]  194 	call	__divuint
   4C7E F1            [10]  195 	pop	af
   4C7F F1            [10]  196 	pop	af
   4C80 11 0A 00      [10]  197 	ld	de,#0x000A
   4C83 D5            [11]  198 	push	de
   4C84 E5            [11]  199 	push	hl
   4C85 CD FA 5F      [17]  200 	call	__moduint
   4C88 F1            [10]  201 	pop	af
   4C89 F1            [10]  202 	pop	af
   4C8A C1            [10]  203 	pop	bc
   4C8B 7D            [ 4]  204 	ld	a,l
   4C8C C6 30         [ 7]  205 	add	a, #0x30
   4C8E 67            [ 4]  206 	ld	h,a
   4C8F 79            [ 4]  207 	ld	a,c
   4C90 C6 08         [ 7]  208 	add	a, #0x08
   4C92 5F            [ 4]  209 	ld	e,a
   4C93 78            [ 4]  210 	ld	a,b
   4C94 CE 00         [ 7]  211 	adc	a, #0x00
   4C96 57            [ 4]  212 	ld	d,a
   4C97 C5            [11]  213 	push	bc
   4C98 E5            [11]  214 	push	hl
   4C99 33            [ 6]  215 	inc	sp
   4C9A 21 02 00      [10]  216 	ld	hl,#0x0002
   4C9D E5            [11]  217 	push	hl
   4C9E D5            [11]  218 	push	de
   4C9F CD 76 55      [17]  219 	call	_cpct_drawCharM0
   4CA2 F1            [10]  220 	pop	af
   4CA3 33            [ 6]  221 	inc	sp
   4CA4 21 0A 00      [10]  222 	ld	hl,#0x000A
   4CA7 E3            [19]  223 	ex	(sp),hl
   4CA8 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4CAB DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4CAE E5            [11]  226 	push	hl
   4CAF CD 44 53      [17]  227 	call	__divuint
   4CB2 F1            [10]  228 	pop	af
   4CB3 F1            [10]  229 	pop	af
   4CB4 11 0A 00      [10]  230 	ld	de,#0x000A
   4CB7 D5            [11]  231 	push	de
   4CB8 E5            [11]  232 	push	hl
   4CB9 CD FA 5F      [17]  233 	call	__moduint
   4CBC F1            [10]  234 	pop	af
   4CBD F1            [10]  235 	pop	af
   4CBE C1            [10]  236 	pop	bc
   4CBF 7D            [ 4]  237 	ld	a,l
   4CC0 C6 30         [ 7]  238 	add	a, #0x30
   4CC2 67            [ 4]  239 	ld	h,a
   4CC3 79            [ 4]  240 	ld	a,c
   4CC4 C6 0C         [ 7]  241 	add	a, #0x0C
   4CC6 5F            [ 4]  242 	ld	e,a
   4CC7 78            [ 4]  243 	ld	a,b
   4CC8 CE 00         [ 7]  244 	adc	a, #0x00
   4CCA 57            [ 4]  245 	ld	d,a
   4CCB C5            [11]  246 	push	bc
   4CCC E5            [11]  247 	push	hl
   4CCD 33            [ 6]  248 	inc	sp
   4CCE 21 02 00      [10]  249 	ld	hl,#0x0002
   4CD1 E5            [11]  250 	push	hl
   4CD2 D5            [11]  251 	push	de
   4CD3 CD 76 55      [17]  252 	call	_cpct_drawCharM0
   4CD6 F1            [10]  253 	pop	af
   4CD7 33            [ 6]  254 	inc	sp
   4CD8 21 0A 00      [10]  255 	ld	hl,#0x000A
   4CDB E3            [19]  256 	ex	(sp),hl
   4CDC DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4CDF DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4CE2 E5            [11]  259 	push	hl
   4CE3 CD FA 5F      [17]  260 	call	__moduint
   4CE6 F1            [10]  261 	pop	af
   4CE7 F1            [10]  262 	pop	af
   4CE8 C1            [10]  263 	pop	bc
   4CE9 7D            [ 4]  264 	ld	a,l
   4CEA C6 30         [ 7]  265 	add	a, #0x30
   4CEC 57            [ 4]  266 	ld	d,a
   4CED 21 10 00      [10]  267 	ld	hl,#0x0010
   4CF0 09            [11]  268 	add	hl,bc
   4CF1 4D            [ 4]  269 	ld	c,l
   4CF2 44            [ 4]  270 	ld	b,h
   4CF3 D5            [11]  271 	push	de
   4CF4 33            [ 6]  272 	inc	sp
   4CF5 21 02 00      [10]  273 	ld	hl,#0x0002
   4CF8 E5            [11]  274 	push	hl
   4CF9 C5            [11]  275 	push	bc
   4CFA CD 76 55      [17]  276 	call	_cpct_drawCharM0
   4CFD F1            [10]  277 	pop	af
   4CFE F1            [10]  278 	pop	af
   4CFF 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4D00                     281 00102$:
   4D00 18 FE         [12]  282 	jr	00102$
   4D02                     283 ___str_0:
   4D02 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4D0B 00                  285 	.db 0x00
   4D0C                     286 ___str_1:
   4D0C 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4D13 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4D14                     293 _borrarPantalla::
   4D14 DD E5         [15]  294 	push	ix
   4D16 DD 21 00 00   [14]  295 	ld	ix,#0
   4D1A DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4D1C 3E 28         [ 7]  298 	ld	a,#0x28
   4D1E DD 96 06      [19]  299 	sub	a, 6 (ix)
   4D21 3E 00         [ 7]  300 	ld	a,#0x00
   4D23 17            [ 4]  301 	rla
   4D24 4F            [ 4]  302 	ld	c,a
   4D25 CB 41         [ 8]  303 	bit	0,c
   4D27 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4D29 DD 66 05      [19]  306 	ld	h,5 (ix)
   4D2C DD 6E 04      [19]  307 	ld	l,4 (ix)
   4D2F E5            [11]  308 	push	hl
   4D30 21 00 C0      [10]  309 	ld	hl,#0xC000
   4D33 E5            [11]  310 	push	hl
   4D34 CD 05 60      [17]  311 	call	_cpct_getScreenPtr
   4D37 4D            [ 4]  312 	ld	c,l
   4D38 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4D39 DD 66 07      [19]  315 	ld	h,7 (ix)
   4D3C DD 6E 06      [19]  316 	ld	l,6 (ix)
   4D3F E5            [11]  317 	push	hl
   4D40 AF            [ 4]  318 	xor	a, a
   4D41 F5            [11]  319 	push	af
   4D42 33            [ 6]  320 	inc	sp
   4D43 C5            [11]  321 	push	bc
   4D44 CD EB 56      [17]  322 	call	_cpct_drawSolidBox
   4D47 F1            [10]  323 	pop	af
   4D48 F1            [10]  324 	pop	af
   4D49 33            [ 6]  325 	inc	sp
   4D4A 18 51         [12]  326 	jr	00106$
   4D4C                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4D4C CB 41         [ 8]  329 	bit	0,c
   4D4E 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4D50 DD 66 05      [19]  332 	ld	h,5 (ix)
   4D53 DD 6E 04      [19]  333 	ld	l,4 (ix)
   4D56 E5            [11]  334 	push	hl
   4D57 21 00 C0      [10]  335 	ld	hl,#0xC000
   4D5A E5            [11]  336 	push	hl
   4D5B CD 05 60      [17]  337 	call	_cpct_getScreenPtr
   4D5E 4D            [ 4]  338 	ld	c,l
   4D5F 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4D60 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4D63 F5            [11]  342 	push	af
   4D64 33            [ 6]  343 	inc	sp
   4D65 21 00 28      [10]  344 	ld	hl,#0x2800
   4D68 E5            [11]  345 	push	hl
   4D69 C5            [11]  346 	push	bc
   4D6A CD EB 56      [17]  347 	call	_cpct_drawSolidBox
   4D6D F1            [10]  348 	pop	af
   4D6E F1            [10]  349 	pop	af
   4D6F 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4D70 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4D73 C6 28         [ 7]  353 	add	a, #0x28
   4D75 47            [ 4]  354 	ld	b,a
   4D76 DD 7E 05      [19]  355 	ld	a,5 (ix)
   4D79 F5            [11]  356 	push	af
   4D7A 33            [ 6]  357 	inc	sp
   4D7B C5            [11]  358 	push	bc
   4D7C 33            [ 6]  359 	inc	sp
   4D7D 21 00 C0      [10]  360 	ld	hl,#0xC000
   4D80 E5            [11]  361 	push	hl
   4D81 CD 05 60      [17]  362 	call	_cpct_getScreenPtr
   4D84 4D            [ 4]  363 	ld	c,l
   4D85 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4D86 DD 7E 06      [19]  366 	ld	a,6 (ix)
   4D89 C6 D8         [ 7]  367 	add	a,#0xD8
   4D8B 57            [ 4]  368 	ld	d,a
   4D8C DD 7E 07      [19]  369 	ld	a,7 (ix)
   4D8F F5            [11]  370 	push	af
   4D90 33            [ 6]  371 	inc	sp
   4D91 D5            [11]  372 	push	de
   4D92 33            [ 6]  373 	inc	sp
   4D93 AF            [ 4]  374 	xor	a, a
   4D94 F5            [11]  375 	push	af
   4D95 33            [ 6]  376 	inc	sp
   4D96 C5            [11]  377 	push	bc
   4D97 CD EB 56      [17]  378 	call	_cpct_drawSolidBox
   4D9A F1            [10]  379 	pop	af
   4D9B F1            [10]  380 	pop	af
   4D9C 33            [ 6]  381 	inc	sp
   4D9D                     382 00106$:
   4D9D DD E1         [14]  383 	pop	ix
   4D9F C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4DA0                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4DA0 21 50 82      [10]  391 	ld	hl,#0x8250
   4DA3 E5            [11]  392 	push	hl
   4DA4 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4DA7 E5            [11]  394 	push	hl
   4DA8 CD 14 4D      [17]  395 	call	_borrarPantalla
   4DAB F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4DAC 21 10 55      [10]  398 	ld	hl, #0x5510
   4DAF E3            [19]  399 	ex	(sp),hl
   4DB0 21 00 C0      [10]  400 	ld	hl,#0xC000
   4DB3 E5            [11]  401 	push	hl
   4DB4 CD 05 60      [17]  402 	call	_cpct_getScreenPtr
   4DB7 4D            [ 4]  403 	ld	c,l
   4DB8 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4DB9 21 02 00      [10]  406 	ld	hl,#0x0002
   4DBC E5            [11]  407 	push	hl
   4DBD C5            [11]  408 	push	bc
   4DBE 21 8E 4E      [10]  409 	ld	hl,#___str_2
   4DC1 E5            [11]  410 	push	hl
   4DC2 CD 1E 54      [17]  411 	call	_cpct_drawStringM0
   4DC5 21 06 00      [10]  412 	ld	hl,#6
   4DC8 39            [11]  413 	add	hl,sp
   4DC9 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4DCA 21 04 73      [10]  416 	ld	hl,#0x7304
   4DCD E5            [11]  417 	push	hl
   4DCE 21 00 C0      [10]  418 	ld	hl,#0xC000
   4DD1 E5            [11]  419 	push	hl
   4DD2 CD 05 60      [17]  420 	call	_cpct_getScreenPtr
   4DD5 4D            [ 4]  421 	ld	c,l
   4DD6 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4DD7 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4DDA E5            [11]  425 	push	hl
   4DDB C5            [11]  426 	push	bc
   4DDC 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4DDF E5            [11]  428 	push	hl
   4DE0 CD 42 54      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4DE3 21 0E 73      [10]  431 	ld	hl,#0x730E
   4DE6 E5            [11]  432 	push	hl
   4DE7 21 00 C0      [10]  433 	ld	hl,#0xC000
   4DEA E5            [11]  434 	push	hl
   4DEB CD 05 60      [17]  435 	call	_cpct_getScreenPtr
   4DEE 4D            [ 4]  436 	ld	c,l
   4DEF 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4DF0 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4DF3 E5            [11]  440 	push	hl
   4DF4 C5            [11]  441 	push	bc
   4DF5 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4DF8 E5            [11]  443 	push	hl
   4DF9 CD 42 54      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4DFC 21 18 73      [10]  446 	ld	hl,#0x7318
   4DFF E5            [11]  447 	push	hl
   4E00 21 00 C0      [10]  448 	ld	hl,#0xC000
   4E03 E5            [11]  449 	push	hl
   4E04 CD 05 60      [17]  450 	call	_cpct_getScreenPtr
   4E07 4D            [ 4]  451 	ld	c,l
   4E08 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E09 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4E0C E5            [11]  455 	push	hl
   4E0D C5            [11]  456 	push	bc
   4E0E 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4E11 E5            [11]  458 	push	hl
   4E12 CD 42 54      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4E15 21 22 73      [10]  461 	ld	hl,#0x7322
   4E18 E5            [11]  462 	push	hl
   4E19 21 00 C0      [10]  463 	ld	hl,#0xC000
   4E1C E5            [11]  464 	push	hl
   4E1D CD 05 60      [17]  465 	call	_cpct_getScreenPtr
   4E20 4D            [ 4]  466 	ld	c,l
   4E21 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E22 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4E25 E5            [11]  470 	push	hl
   4E26 C5            [11]  471 	push	bc
   4E27 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4E2A E5            [11]  473 	push	hl
   4E2B CD 42 54      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4E2E 21 2D 73      [10]  476 	ld	hl,#0x732D
   4E31 E5            [11]  477 	push	hl
   4E32 21 00 C0      [10]  478 	ld	hl,#0xC000
   4E35 E5            [11]  479 	push	hl
   4E36 CD 05 60      [17]  480 	call	_cpct_getScreenPtr
   4E39 4D            [ 4]  481 	ld	c,l
   4E3A 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4E3B 21 02 00      [10]  484 	ld	hl,#0x0002
   4E3E E5            [11]  485 	push	hl
   4E3F C5            [11]  486 	push	bc
   4E40 21 9B 4E      [10]  487 	ld	hl,#___str_3
   4E43 E5            [11]  488 	push	hl
   4E44 CD 1E 54      [17]  489 	call	_cpct_drawStringM0
   4E47 21 06 00      [10]  490 	ld	hl,#6
   4E4A 39            [11]  491 	add	hl,sp
   4E4B F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4E4C 21 04 82      [10]  494 	ld	hl,#0x8204
   4E4F E5            [11]  495 	push	hl
   4E50 21 00 C0      [10]  496 	ld	hl,#0xC000
   4E53 E5            [11]  497 	push	hl
   4E54 CD 05 60      [17]  498 	call	_cpct_getScreenPtr
   4E57 4D            [ 4]  499 	ld	c,l
   4E58 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4E59 21 02 00      [10]  502 	ld	hl,#0x0002
   4E5C E5            [11]  503 	push	hl
   4E5D C5            [11]  504 	push	bc
   4E5E 21 A4 4E      [10]  505 	ld	hl,#___str_4
   4E61 E5            [11]  506 	push	hl
   4E62 CD 1E 54      [17]  507 	call	_cpct_drawStringM0
   4E65 21 06 00      [10]  508 	ld	hl,#6
   4E68 39            [11]  509 	add	hl,sp
   4E69 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4E6A                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4E6A CD 85 53      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4E6D 21 04 40      [10]  516 	ld	hl,#0x4004
   4E70 CD 06 54      [17]  517 	call	_cpct_isKeyPressed
   4E73 7D            [ 4]  518 	ld	a,l
   4E74 B7            [ 4]  519 	or	a, a
   4E75 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4E77 CD 96 4F      [17]  522 	call	_menuOpciones
   4E7A                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E7A 21 07 10      [10]  525 	ld	hl,#0x1007
   4E7D CD 06 54      [17]  526 	call	_cpct_isKeyPressed
   4E80 7D            [ 4]  527 	ld	a,l
   4E81 B7            [ 4]  528 	or	a, a
   4E82 C0            [11]  529 	ret	NZ
   4E83 21 04 40      [10]  530 	ld	hl,#0x4004
   4E86 CD 06 54      [17]  531 	call	_cpct_isKeyPressed
   4E89 7D            [ 4]  532 	ld	a,l
   4E8A B7            [ 4]  533 	or	a, a
   4E8B 28 DD         [12]  534 	jr	Z,00104$
   4E8D C9            [10]  535 	ret
   4E8E                     536 ___str_2:
   4E8E 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4E9A 00                  538 	.db 0x00
   4E9B                     539 ___str_3:
   4E9B 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4EA3 00                  541 	.db 0x00
   4EA4                     542 ___str_4:
   4EA4 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4EB6 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4EB7                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4EB7 21 50 82      [10]  551 	ld	hl,#0x8250
   4EBA E5            [11]  552 	push	hl
   4EBB 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4EBE E5            [11]  554 	push	hl
   4EBF CD 14 4D      [17]  555 	call	_borrarPantalla
   4EC2 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4EC3 21 1A 46      [10]  558 	ld	hl, #0x461A
   4EC6 E3            [19]  559 	ex	(sp),hl
   4EC7 21 00 C0      [10]  560 	ld	hl,#0xC000
   4ECA E5            [11]  561 	push	hl
   4ECB CD 05 60      [17]  562 	call	_cpct_getScreenPtr
   4ECE 4D            [ 4]  563 	ld	c,l
   4ECF 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4ED0 21 02 00      [10]  566 	ld	hl,#0x0002
   4ED3 E5            [11]  567 	push	hl
   4ED4 C5            [11]  568 	push	bc
   4ED5 21 5F 4F      [10]  569 	ld	hl,#___str_5
   4ED8 E5            [11]  570 	push	hl
   4ED9 CD 1E 54      [17]  571 	call	_cpct_drawStringM0
   4EDC 21 06 00      [10]  572 	ld	hl,#6
   4EDF 39            [11]  573 	add	hl,sp
   4EE0 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4EE1 21 0A 64      [10]  576 	ld	hl,#0x640A
   4EE4 E5            [11]  577 	push	hl
   4EE5 21 00 C0      [10]  578 	ld	hl,#0xC000
   4EE8 E5            [11]  579 	push	hl
   4EE9 CD 05 60      [17]  580 	call	_cpct_getScreenPtr
   4EEC 4D            [ 4]  581 	ld	c,l
   4EED 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4EEE 21 02 00      [10]  584 	ld	hl,#0x0002
   4EF1 E5            [11]  585 	push	hl
   4EF2 C5            [11]  586 	push	bc
   4EF3 21 67 4F      [10]  587 	ld	hl,#___str_6
   4EF6 E5            [11]  588 	push	hl
   4EF7 CD 1E 54      [17]  589 	call	_cpct_drawStringM0
   4EFA 21 06 00      [10]  590 	ld	hl,#6
   4EFD 39            [11]  591 	add	hl,sp
   4EFE F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4EFF 21 0E 73      [10]  594 	ld	hl,#0x730E
   4F02 E5            [11]  595 	push	hl
   4F03 21 00 C0      [10]  596 	ld	hl,#0xC000
   4F06 E5            [11]  597 	push	hl
   4F07 CD 05 60      [17]  598 	call	_cpct_getScreenPtr
   4F0A 4D            [ 4]  599 	ld	c,l
   4F0B 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4F0C 21 02 00      [10]  602 	ld	hl,#0x0002
   4F0F E5            [11]  603 	push	hl
   4F10 C5            [11]  604 	push	bc
   4F11 21 77 4F      [10]  605 	ld	hl,#___str_7
   4F14 E5            [11]  606 	push	hl
   4F15 CD 1E 54      [17]  607 	call	_cpct_drawStringM0
   4F18 21 06 00      [10]  608 	ld	hl,#6
   4F1B 39            [11]  609 	add	hl,sp
   4F1C F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4F1D 21 08 82      [10]  612 	ld	hl,#0x8208
   4F20 E5            [11]  613 	push	hl
   4F21 21 00 C0      [10]  614 	ld	hl,#0xC000
   4F24 E5            [11]  615 	push	hl
   4F25 CD 05 60      [17]  616 	call	_cpct_getScreenPtr
   4F28 4D            [ 4]  617 	ld	c,l
   4F29 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4F2A 21 02 00      [10]  620 	ld	hl,#0x0002
   4F2D E5            [11]  621 	push	hl
   4F2E C5            [11]  622 	push	bc
   4F2F 21 85 4F      [10]  623 	ld	hl,#___str_8
   4F32 E5            [11]  624 	push	hl
   4F33 CD 1E 54      [17]  625 	call	_cpct_drawStringM0
   4F36 21 06 00      [10]  626 	ld	hl,#6
   4F39 39            [11]  627 	add	hl,sp
   4F3A F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4F3B                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4F3B CD 85 53      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4F3E 21 04 40      [10]  634 	ld	hl,#0x4004
   4F41 CD 06 54      [17]  635 	call	_cpct_isKeyPressed
   4F44 7D            [ 4]  636 	ld	a,l
   4F45 B7            [ 4]  637 	or	a, a
   4F46 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4F48 CD 96 4F      [17]  640 	call	_menuOpciones
   4F4B                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4F4B 21 07 10      [10]  643 	ld	hl,#0x1007
   4F4E CD 06 54      [17]  644 	call	_cpct_isKeyPressed
   4F51 7D            [ 4]  645 	ld	a,l
   4F52 B7            [ 4]  646 	or	a, a
   4F53 C0            [11]  647 	ret	NZ
   4F54 21 04 40      [10]  648 	ld	hl,#0x4004
   4F57 CD 06 54      [17]  649 	call	_cpct_isKeyPressed
   4F5A 7D            [ 4]  650 	ld	a,l
   4F5B B7            [ 4]  651 	or	a, a
   4F5C 28 DD         [12]  652 	jr	Z,00104$
   4F5E C9            [10]  653 	ret
   4F5F                     654 ___str_5:
   4F5F 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4F66 00                  656 	.db 0x00
   4F67                     657 ___str_6:
   4F67 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4F76 00                  659 	.db 0x00
   4F77                     660 ___str_7:
   4F77 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4F84 00                  662 	.db 0x00
   4F85                     663 ___str_8:
   4F85 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4F95 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4F96                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4F96 21 50 82      [10]  672 	ld	hl,#0x8250
   4F99 E5            [11]  673 	push	hl
   4F9A 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4F9D E5            [11]  675 	push	hl
   4F9E CD 14 4D      [17]  676 	call	_borrarPantalla
   4FA1 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4FA2 21 20 64      [10]  679 	ld	hl, #0x6420
   4FA5 E3            [19]  680 	ex	(sp),hl
   4FA6 21 00 C0      [10]  681 	ld	hl,#0xC000
   4FA9 E5            [11]  682 	push	hl
   4FAA CD 05 60      [17]  683 	call	_cpct_getScreenPtr
   4FAD 4D            [ 4]  684 	ld	c,l
   4FAE 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4FAF 21 02 00      [10]  687 	ld	hl,#0x0002
   4FB2 E5            [11]  688 	push	hl
   4FB3 C5            [11]  689 	push	bc
   4FB4 21 37 50      [10]  690 	ld	hl,#___str_9
   4FB7 E5            [11]  691 	push	hl
   4FB8 CD 1E 54      [17]  692 	call	_cpct_drawStringM0
   4FBB 21 06 00      [10]  693 	ld	hl,#6
   4FBE 39            [11]  694 	add	hl,sp
   4FBF F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4FC0 21 00 82      [10]  697 	ld	hl,#0x8200
   4FC3 E5            [11]  698 	push	hl
   4FC4 26 C0         [ 7]  699 	ld	h, #0xC0
   4FC6 E5            [11]  700 	push	hl
   4FC7 CD 05 60      [17]  701 	call	_cpct_getScreenPtr
   4FCA 4D            [ 4]  702 	ld	c,l
   4FCB 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4FCC 21 02 00      [10]  705 	ld	hl,#0x0002
   4FCF E5            [11]  706 	push	hl
   4FD0 C5            [11]  707 	push	bc
   4FD1 21 3C 50      [10]  708 	ld	hl,#___str_10
   4FD4 E5            [11]  709 	push	hl
   4FD5 CD 1E 54      [17]  710 	call	_cpct_drawStringM0
   4FD8 21 06 00      [10]  711 	ld	hl,#6
   4FDB 39            [11]  712 	add	hl,sp
   4FDC F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4FDD 21 0A 91      [10]  715 	ld	hl,#0x910A
   4FE0 E5            [11]  716 	push	hl
   4FE1 21 00 C0      [10]  717 	ld	hl,#0xC000
   4FE4 E5            [11]  718 	push	hl
   4FE5 CD 05 60      [17]  719 	call	_cpct_getScreenPtr
   4FE8 4D            [ 4]  720 	ld	c,l
   4FE9 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4FEA 21 02 00      [10]  723 	ld	hl,#0x0002
   4FED E5            [11]  724 	push	hl
   4FEE C5            [11]  725 	push	bc
   4FEF 21 51 50      [10]  726 	ld	hl,#___str_11
   4FF2 E5            [11]  727 	push	hl
   4FF3 CD 1E 54      [17]  728 	call	_cpct_drawStringM0
   4FF6 21 06 00      [10]  729 	ld	hl,#6
   4FF9 39            [11]  730 	add	hl,sp
   4FFA F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4FFB                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4FFB CD 85 53      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4FFE 21 04 08      [10]  737 	ld	hl,#0x0804
   5001 CD 06 54      [17]  738 	call	_cpct_isKeyPressed
   5004 7D            [ 4]  739 	ld	a,l
   5005 B7            [ 4]  740 	or	a, a
   5006 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   5008 CD A0 4D      [17]  743 	call	_menuInstrucciones
   500B 18 0D         [12]  744 	jr	00109$
   500D                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   500D 21 07 40      [10]  747 	ld	hl,#0x4007
   5010 CD 06 54      [17]  748 	call	_cpct_isKeyPressed
   5013 7D            [ 4]  749 	ld	a,l
   5014 B7            [ 4]  750 	or	a, a
   5015 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   5017 CD B7 4E      [17]  753 	call	_menuCreditos
   501A                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   501A 21 07 10      [10]  756 	ld	hl,#0x1007
   501D CD 06 54      [17]  757 	call	_cpct_isKeyPressed
   5020 7D            [ 4]  758 	ld	a,l
   5021 B7            [ 4]  759 	or	a, a
   5022 C0            [11]  760 	ret	NZ
   5023 21 04 08      [10]  761 	ld	hl,#0x0804
   5026 CD 06 54      [17]  762 	call	_cpct_isKeyPressed
   5029 7D            [ 4]  763 	ld	a,l
   502A B7            [ 4]  764 	or	a, a
   502B C0            [11]  765 	ret	NZ
   502C 21 07 40      [10]  766 	ld	hl,#0x4007
   502F CD 06 54      [17]  767 	call	_cpct_isKeyPressed
   5032 7D            [ 4]  768 	ld	a,l
   5033 B7            [ 4]  769 	or	a, a
   5034 28 C5         [12]  770 	jr	Z,00108$
   5036 C9            [10]  771 	ret
   5037                     772 ___str_9:
   5037 4D 45 4E 55         773 	.ascii "MENU"
   503B 00                  774 	.db 0x00
   503C                     775 ___str_10:
   503C 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   5050 00                  777 	.db 0x00
   5051                     778 ___str_11:
   5051 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   5060 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   5061                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   5061 21 00 40      [10]  787 	ld	hl,#0x4000
   5064 E5            [11]  788 	push	hl
   5065 AF            [ 4]  789 	xor	a, a
   5066 F5            [11]  790 	push	af
   5067 33            [ 6]  791 	inc	sp
   5068 26 C0         [ 7]  792 	ld	h, #0xC0
   506A E5            [11]  793 	push	hl
   506B CD CD 56      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   506E 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   5071 E5            [11]  797 	push	hl
   5072 21 00 C0      [10]  798 	ld	hl,#0xC000
   5075 E5            [11]  799 	push	hl
   5076 CD 05 60      [17]  800 	call	_cpct_getScreenPtr
   5079 4D            [ 4]  801 	ld	c,l
   507A 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   507B 21 04 00      [10]  804 	ld	hl,#0x0004
   507E E5            [11]  805 	push	hl
   507F C5            [11]  806 	push	bc
   5080 21 17 51      [10]  807 	ld	hl,#___str_12
   5083 E5            [11]  808 	push	hl
   5084 CD 1E 54      [17]  809 	call	_cpct_drawStringM0
   5087 21 06 00      [10]  810 	ld	hl,#6
   508A 39            [11]  811 	add	hl,sp
   508B F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   508C 21 28 6E      [10]  814 	ld	hl,#0x6E28
   508F E5            [11]  815 	push	hl
   5090 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   5093 E5            [11]  817 	push	hl
   5094 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   5097 E5            [11]  819 	push	hl
   5098 CD 42 54      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   509B 21 28 6E      [10]  822 	ld	hl,#0x6E28
   509E E5            [11]  823 	push	hl
   509F 21 18 F1      [10]  824 	ld	hl,#0xF118
   50A2 E5            [11]  825 	push	hl
   50A3 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   50A6 E5            [11]  827 	push	hl
   50A7 CD 42 54      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   50AA 21 08 A0      [10]  830 	ld	hl,#0xA008
   50AD E5            [11]  831 	push	hl
   50AE 21 00 C0      [10]  832 	ld	hl,#0xC000
   50B1 E5            [11]  833 	push	hl
   50B2 CD 05 60      [17]  834 	call	_cpct_getScreenPtr
   50B5 4D            [ 4]  835 	ld	c,l
   50B6 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   50B7 21 02 00      [10]  838 	ld	hl,#0x0002
   50BA E5            [11]  839 	push	hl
   50BB C5            [11]  840 	push	bc
   50BC 21 1F 51      [10]  841 	ld	hl,#___str_13
   50BF E5            [11]  842 	push	hl
   50C0 CD 1E 54      [17]  843 	call	_cpct_drawStringM0
   50C3 21 06 00      [10]  844 	ld	hl,#6
   50C6 39            [11]  845 	add	hl,sp
   50C7 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   50C8 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   50CB E5            [11]  849 	push	hl
   50CC 21 00 C0      [10]  850 	ld	hl,#0xC000
   50CF E5            [11]  851 	push	hl
   50D0 CD 05 60      [17]  852 	call	_cpct_getScreenPtr
   50D3 4D            [ 4]  853 	ld	c,l
   50D4 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   50D5 21 02 00      [10]  856 	ld	hl,#0x0002
   50D8 E5            [11]  857 	push	hl
   50D9 C5            [11]  858 	push	bc
   50DA 21 30 51      [10]  859 	ld	hl,#___str_14
   50DD E5            [11]  860 	push	hl
   50DE CD 1E 54      [17]  861 	call	_cpct_drawStringM0
   50E1 21 06 00      [10]  862 	ld	hl,#6
   50E4 39            [11]  863 	add	hl,sp
   50E5 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   50E6                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   50E6 CD 85 53      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   50E9 21 04 40      [10]  870 	ld	hl,#0x4004
   50EC CD 06 54      [17]  871 	call	_cpct_isKeyPressed
   50EF 7D            [ 4]  872 	ld	a,l
   50F0 B7            [ 4]  873 	or	a, a
   50F1 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   50F3 CD 85 53      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   50F6                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   50F6 CD 96 4F      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   50F9 21 07 10      [10]  882 	ld	hl,#0x1007
   50FC CD 06 54      [17]  883 	call	_cpct_isKeyPressed
   50FF 7D            [ 4]  884 	ld	a,l
   5100 B7            [ 4]  885 	or	a, a
   5101 28 F3         [12]  886 	jr	Z,00101$
   5103                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5103 21 07 10      [10]  889 	ld	hl,#0x1007
   5106 CD 06 54      [17]  890 	call	_cpct_isKeyPressed
   5109 7D            [ 4]  891 	ld	a,l
   510A B7            [ 4]  892 	or	a, a
   510B C0            [11]  893 	ret	NZ
   510C 21 04 40      [10]  894 	ld	hl,#0x4004
   510F CD 06 54      [17]  895 	call	_cpct_isKeyPressed
   5112 7D            [ 4]  896 	ld	a,l
   5113 B7            [ 4]  897 	or	a, a
   5114 28 D0         [12]  898 	jr	Z,00107$
   5116 C9            [10]  899 	ret
   5117                     900 ___str_12:
   5117 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   511E 00                  902 	.db 0x00
   511F                     903 ___str_13:
   511F 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   512F 00                  905 	.db 0x00
   5130                     906 ___str_14:
   5130 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   513F 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
