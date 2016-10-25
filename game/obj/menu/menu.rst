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
   4B48                      60 _menuFin::
   4B48 DD E5         [15]   61 	push	ix
   4B4A DD 21 00 00   [14]   62 	ld	ix,#0
   4B4E DD 39         [15]   63 	add	ix,sp
   4B50 F5            [11]   64 	push	af
   4B51 F5            [11]   65 	push	af
   4B52 DD 75 FE      [19]   66 	ld	-2 (ix),l
   4B55 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4B58 21 10 27      [10]   69 	ld	hl,#0x2710
   4B5B E5            [11]   70 	push	hl
   4B5C DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4B5F DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4B62 E5            [11]   73 	push	hl
   4B63 CD EC 52      [17]   74 	call	__divuint
   4B66 F1            [10]   75 	pop	af
   4B67 F1            [10]   76 	pop	af
   4B68 33            [ 6]   77 	inc	sp
   4B69 33            [ 6]   78 	inc	sp
   4B6A E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4B6B 21 00 40      [10]   81 	ld	hl,#0x4000
   4B6E E5            [11]   82 	push	hl
   4B6F AF            [ 4]   83 	xor	a, a
   4B70 F5            [11]   84 	push	af
   4B71 33            [ 6]   85 	inc	sp
   4B72 26 C0         [ 7]   86 	ld	h, #0xC0
   4B74 E5            [11]   87 	push	hl
   4B75 CD 75 56      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4B78 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4B7B E5            [11]   91 	push	hl
   4B7C 21 00 C0      [10]   92 	ld	hl,#0xC000
   4B7F E5            [11]   93 	push	hl
   4B80 CD AD 5F      [17]   94 	call	_cpct_getScreenPtr
   4B83 4D            [ 4]   95 	ld	c,l
   4B84 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4B85 21 02 00      [10]   98 	ld	hl,#0x0002
   4B88 E5            [11]   99 	push	hl
   4B89 C5            [11]  100 	push	bc
   4B8A 21 AA 4C      [10]  101 	ld	hl,#___str_0
   4B8D E5            [11]  102 	push	hl
   4B8E CD C6 53      [17]  103 	call	_cpct_drawStringM0
   4B91 21 06 00      [10]  104 	ld	hl,#6
   4B94 39            [11]  105 	add	hl,sp
   4B95 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4B96 21 14 78      [10]  108 	ld	hl,#0x7814
   4B99 E5            [11]  109 	push	hl
   4B9A 21 00 C0      [10]  110 	ld	hl,#0xC000
   4B9D E5            [11]  111 	push	hl
   4B9E CD AD 5F      [17]  112 	call	_cpct_getScreenPtr
   4BA1 4D            [ 4]  113 	ld	c,l
   4BA2 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4BA3 21 02 00      [10]  116 	ld	hl,#0x0002
   4BA6 E5            [11]  117 	push	hl
   4BA7 C5            [11]  118 	push	bc
   4BA8 21 B4 4C      [10]  119 	ld	hl,#___str_1
   4BAB E5            [11]  120 	push	hl
   4BAC CD C6 53      [17]  121 	call	_cpct_drawStringM0
   4BAF 21 06 00      [10]  122 	ld	hl,#6
   4BB2 39            [11]  123 	add	hl,sp
   4BB3 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4BB4 21 2D 78      [10]  126 	ld	hl,#0x782D
   4BB7 E5            [11]  127 	push	hl
   4BB8 21 00 C0      [10]  128 	ld	hl,#0xC000
   4BBB E5            [11]  129 	push	hl
   4BBC CD AD 5F      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4BBF E5            [11]  132 	push	hl
   4BC0 21 0A 00      [10]  133 	ld	hl,#0x000A
   4BC3 E5            [11]  134 	push	hl
   4BC4 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4BC7 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4BCA E5            [11]  137 	push	hl
   4BCB CD A2 5F      [17]  138 	call	__moduint
   4BCE F1            [10]  139 	pop	af
   4BCF F1            [10]  140 	pop	af
   4BD0 C1            [10]  141 	pop	bc
   4BD1 7D            [ 4]  142 	ld	a,l
   4BD2 C6 30         [ 7]  143 	add	a, #0x30
   4BD4 67            [ 4]  144 	ld	h,a
   4BD5 59            [ 4]  145 	ld	e, c
   4BD6 50            [ 4]  146 	ld	d, b
   4BD7 C5            [11]  147 	push	bc
   4BD8 E5            [11]  148 	push	hl
   4BD9 33            [ 6]  149 	inc	sp
   4BDA 21 02 00      [10]  150 	ld	hl,#0x0002
   4BDD E5            [11]  151 	push	hl
   4BDE D5            [11]  152 	push	de
   4BDF CD 1E 55      [17]  153 	call	_cpct_drawCharM0
   4BE2 F1            [10]  154 	pop	af
   4BE3 33            [ 6]  155 	inc	sp
   4BE4 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4BE7 E3            [19]  157 	ex	(sp),hl
   4BE8 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4BEB DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4BEE E5            [11]  160 	push	hl
   4BEF CD EC 52      [17]  161 	call	__divuint
   4BF2 F1            [10]  162 	pop	af
   4BF3 F1            [10]  163 	pop	af
   4BF4 11 0A 00      [10]  164 	ld	de,#0x000A
   4BF7 D5            [11]  165 	push	de
   4BF8 E5            [11]  166 	push	hl
   4BF9 CD A2 5F      [17]  167 	call	__moduint
   4BFC F1            [10]  168 	pop	af
   4BFD F1            [10]  169 	pop	af
   4BFE C1            [10]  170 	pop	bc
   4BFF 7D            [ 4]  171 	ld	a,l
   4C00 C6 30         [ 7]  172 	add	a, #0x30
   4C02 67            [ 4]  173 	ld	h,a
   4C03 79            [ 4]  174 	ld	a,c
   4C04 C6 04         [ 7]  175 	add	a, #0x04
   4C06 5F            [ 4]  176 	ld	e,a
   4C07 78            [ 4]  177 	ld	a,b
   4C08 CE 00         [ 7]  178 	adc	a, #0x00
   4C0A 57            [ 4]  179 	ld	d,a
   4C0B C5            [11]  180 	push	bc
   4C0C E5            [11]  181 	push	hl
   4C0D 33            [ 6]  182 	inc	sp
   4C0E 21 02 00      [10]  183 	ld	hl,#0x0002
   4C11 E5            [11]  184 	push	hl
   4C12 D5            [11]  185 	push	de
   4C13 CD 1E 55      [17]  186 	call	_cpct_drawCharM0
   4C16 F1            [10]  187 	pop	af
   4C17 33            [ 6]  188 	inc	sp
   4C18 21 64 00      [10]  189 	ld	hl,#0x0064
   4C1B E3            [19]  190 	ex	(sp),hl
   4C1C DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4C1F DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4C22 E5            [11]  193 	push	hl
   4C23 CD EC 52      [17]  194 	call	__divuint
   4C26 F1            [10]  195 	pop	af
   4C27 F1            [10]  196 	pop	af
   4C28 11 0A 00      [10]  197 	ld	de,#0x000A
   4C2B D5            [11]  198 	push	de
   4C2C E5            [11]  199 	push	hl
   4C2D CD A2 5F      [17]  200 	call	__moduint
   4C30 F1            [10]  201 	pop	af
   4C31 F1            [10]  202 	pop	af
   4C32 C1            [10]  203 	pop	bc
   4C33 7D            [ 4]  204 	ld	a,l
   4C34 C6 30         [ 7]  205 	add	a, #0x30
   4C36 67            [ 4]  206 	ld	h,a
   4C37 79            [ 4]  207 	ld	a,c
   4C38 C6 08         [ 7]  208 	add	a, #0x08
   4C3A 5F            [ 4]  209 	ld	e,a
   4C3B 78            [ 4]  210 	ld	a,b
   4C3C CE 00         [ 7]  211 	adc	a, #0x00
   4C3E 57            [ 4]  212 	ld	d,a
   4C3F C5            [11]  213 	push	bc
   4C40 E5            [11]  214 	push	hl
   4C41 33            [ 6]  215 	inc	sp
   4C42 21 02 00      [10]  216 	ld	hl,#0x0002
   4C45 E5            [11]  217 	push	hl
   4C46 D5            [11]  218 	push	de
   4C47 CD 1E 55      [17]  219 	call	_cpct_drawCharM0
   4C4A F1            [10]  220 	pop	af
   4C4B 33            [ 6]  221 	inc	sp
   4C4C 21 0A 00      [10]  222 	ld	hl,#0x000A
   4C4F E3            [19]  223 	ex	(sp),hl
   4C50 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4C53 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4C56 E5            [11]  226 	push	hl
   4C57 CD EC 52      [17]  227 	call	__divuint
   4C5A F1            [10]  228 	pop	af
   4C5B F1            [10]  229 	pop	af
   4C5C 11 0A 00      [10]  230 	ld	de,#0x000A
   4C5F D5            [11]  231 	push	de
   4C60 E5            [11]  232 	push	hl
   4C61 CD A2 5F      [17]  233 	call	__moduint
   4C64 F1            [10]  234 	pop	af
   4C65 F1            [10]  235 	pop	af
   4C66 C1            [10]  236 	pop	bc
   4C67 7D            [ 4]  237 	ld	a,l
   4C68 C6 30         [ 7]  238 	add	a, #0x30
   4C6A 67            [ 4]  239 	ld	h,a
   4C6B 79            [ 4]  240 	ld	a,c
   4C6C C6 0C         [ 7]  241 	add	a, #0x0C
   4C6E 5F            [ 4]  242 	ld	e,a
   4C6F 78            [ 4]  243 	ld	a,b
   4C70 CE 00         [ 7]  244 	adc	a, #0x00
   4C72 57            [ 4]  245 	ld	d,a
   4C73 C5            [11]  246 	push	bc
   4C74 E5            [11]  247 	push	hl
   4C75 33            [ 6]  248 	inc	sp
   4C76 21 02 00      [10]  249 	ld	hl,#0x0002
   4C79 E5            [11]  250 	push	hl
   4C7A D5            [11]  251 	push	de
   4C7B CD 1E 55      [17]  252 	call	_cpct_drawCharM0
   4C7E F1            [10]  253 	pop	af
   4C7F 33            [ 6]  254 	inc	sp
   4C80 21 0A 00      [10]  255 	ld	hl,#0x000A
   4C83 E3            [19]  256 	ex	(sp),hl
   4C84 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4C87 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4C8A E5            [11]  259 	push	hl
   4C8B CD A2 5F      [17]  260 	call	__moduint
   4C8E F1            [10]  261 	pop	af
   4C8F F1            [10]  262 	pop	af
   4C90 C1            [10]  263 	pop	bc
   4C91 7D            [ 4]  264 	ld	a,l
   4C92 C6 30         [ 7]  265 	add	a, #0x30
   4C94 57            [ 4]  266 	ld	d,a
   4C95 21 10 00      [10]  267 	ld	hl,#0x0010
   4C98 09            [11]  268 	add	hl,bc
   4C99 4D            [ 4]  269 	ld	c,l
   4C9A 44            [ 4]  270 	ld	b,h
   4C9B D5            [11]  271 	push	de
   4C9C 33            [ 6]  272 	inc	sp
   4C9D 21 02 00      [10]  273 	ld	hl,#0x0002
   4CA0 E5            [11]  274 	push	hl
   4CA1 C5            [11]  275 	push	bc
   4CA2 CD 1E 55      [17]  276 	call	_cpct_drawCharM0
   4CA5 F1            [10]  277 	pop	af
   4CA6 F1            [10]  278 	pop	af
   4CA7 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4CA8                     281 00102$:
   4CA8 18 FE         [12]  282 	jr	00102$
   4CAA                     283 ___str_0:
   4CAA 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4CB3 00                  285 	.db 0x00
   4CB4                     286 ___str_1:
   4CB4 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4CBB 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4CBC                     293 _borrarPantalla::
   4CBC DD E5         [15]  294 	push	ix
   4CBE DD 21 00 00   [14]  295 	ld	ix,#0
   4CC2 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4CC4 3E 28         [ 7]  298 	ld	a,#0x28
   4CC6 DD 96 06      [19]  299 	sub	a, 6 (ix)
   4CC9 3E 00         [ 7]  300 	ld	a,#0x00
   4CCB 17            [ 4]  301 	rla
   4CCC 4F            [ 4]  302 	ld	c,a
   4CCD CB 41         [ 8]  303 	bit	0,c
   4CCF 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4CD1 DD 66 05      [19]  306 	ld	h,5 (ix)
   4CD4 DD 6E 04      [19]  307 	ld	l,4 (ix)
   4CD7 E5            [11]  308 	push	hl
   4CD8 21 00 C0      [10]  309 	ld	hl,#0xC000
   4CDB E5            [11]  310 	push	hl
   4CDC CD AD 5F      [17]  311 	call	_cpct_getScreenPtr
   4CDF 4D            [ 4]  312 	ld	c,l
   4CE0 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4CE1 DD 66 07      [19]  315 	ld	h,7 (ix)
   4CE4 DD 6E 06      [19]  316 	ld	l,6 (ix)
   4CE7 E5            [11]  317 	push	hl
   4CE8 AF            [ 4]  318 	xor	a, a
   4CE9 F5            [11]  319 	push	af
   4CEA 33            [ 6]  320 	inc	sp
   4CEB C5            [11]  321 	push	bc
   4CEC CD 93 56      [17]  322 	call	_cpct_drawSolidBox
   4CEF F1            [10]  323 	pop	af
   4CF0 F1            [10]  324 	pop	af
   4CF1 33            [ 6]  325 	inc	sp
   4CF2 18 51         [12]  326 	jr	00106$
   4CF4                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4CF4 CB 41         [ 8]  329 	bit	0,c
   4CF6 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4CF8 DD 66 05      [19]  332 	ld	h,5 (ix)
   4CFB DD 6E 04      [19]  333 	ld	l,4 (ix)
   4CFE E5            [11]  334 	push	hl
   4CFF 21 00 C0      [10]  335 	ld	hl,#0xC000
   4D02 E5            [11]  336 	push	hl
   4D03 CD AD 5F      [17]  337 	call	_cpct_getScreenPtr
   4D06 4D            [ 4]  338 	ld	c,l
   4D07 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4D08 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4D0B F5            [11]  342 	push	af
   4D0C 33            [ 6]  343 	inc	sp
   4D0D 21 00 28      [10]  344 	ld	hl,#0x2800
   4D10 E5            [11]  345 	push	hl
   4D11 C5            [11]  346 	push	bc
   4D12 CD 93 56      [17]  347 	call	_cpct_drawSolidBox
   4D15 F1            [10]  348 	pop	af
   4D16 F1            [10]  349 	pop	af
   4D17 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4D18 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4D1B C6 28         [ 7]  353 	add	a, #0x28
   4D1D 47            [ 4]  354 	ld	b,a
   4D1E DD 7E 05      [19]  355 	ld	a,5 (ix)
   4D21 F5            [11]  356 	push	af
   4D22 33            [ 6]  357 	inc	sp
   4D23 C5            [11]  358 	push	bc
   4D24 33            [ 6]  359 	inc	sp
   4D25 21 00 C0      [10]  360 	ld	hl,#0xC000
   4D28 E5            [11]  361 	push	hl
   4D29 CD AD 5F      [17]  362 	call	_cpct_getScreenPtr
   4D2C 4D            [ 4]  363 	ld	c,l
   4D2D 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4D2E DD 7E 06      [19]  366 	ld	a,6 (ix)
   4D31 C6 D8         [ 7]  367 	add	a,#0xD8
   4D33 57            [ 4]  368 	ld	d,a
   4D34 DD 7E 07      [19]  369 	ld	a,7 (ix)
   4D37 F5            [11]  370 	push	af
   4D38 33            [ 6]  371 	inc	sp
   4D39 D5            [11]  372 	push	de
   4D3A 33            [ 6]  373 	inc	sp
   4D3B AF            [ 4]  374 	xor	a, a
   4D3C F5            [11]  375 	push	af
   4D3D 33            [ 6]  376 	inc	sp
   4D3E C5            [11]  377 	push	bc
   4D3F CD 93 56      [17]  378 	call	_cpct_drawSolidBox
   4D42 F1            [10]  379 	pop	af
   4D43 F1            [10]  380 	pop	af
   4D44 33            [ 6]  381 	inc	sp
   4D45                     382 00106$:
   4D45 DD E1         [14]  383 	pop	ix
   4D47 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4D48                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4D48 21 50 82      [10]  391 	ld	hl,#0x8250
   4D4B E5            [11]  392 	push	hl
   4D4C 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4D4F E5            [11]  394 	push	hl
   4D50 CD BC 4C      [17]  395 	call	_borrarPantalla
   4D53 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4D54 21 10 55      [10]  398 	ld	hl, #0x5510
   4D57 E3            [19]  399 	ex	(sp),hl
   4D58 21 00 C0      [10]  400 	ld	hl,#0xC000
   4D5B E5            [11]  401 	push	hl
   4D5C CD AD 5F      [17]  402 	call	_cpct_getScreenPtr
   4D5F 4D            [ 4]  403 	ld	c,l
   4D60 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4D61 21 02 00      [10]  406 	ld	hl,#0x0002
   4D64 E5            [11]  407 	push	hl
   4D65 C5            [11]  408 	push	bc
   4D66 21 36 4E      [10]  409 	ld	hl,#___str_2
   4D69 E5            [11]  410 	push	hl
   4D6A CD C6 53      [17]  411 	call	_cpct_drawStringM0
   4D6D 21 06 00      [10]  412 	ld	hl,#6
   4D70 39            [11]  413 	add	hl,sp
   4D71 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4D72 21 04 73      [10]  416 	ld	hl,#0x7304
   4D75 E5            [11]  417 	push	hl
   4D76 21 00 C0      [10]  418 	ld	hl,#0xC000
   4D79 E5            [11]  419 	push	hl
   4D7A CD AD 5F      [17]  420 	call	_cpct_getScreenPtr
   4D7D 4D            [ 4]  421 	ld	c,l
   4D7E 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D7F 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4D82 E5            [11]  425 	push	hl
   4D83 C5            [11]  426 	push	bc
   4D84 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4D87 E5            [11]  428 	push	hl
   4D88 CD EA 53      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4D8B 21 0E 73      [10]  431 	ld	hl,#0x730E
   4D8E E5            [11]  432 	push	hl
   4D8F 21 00 C0      [10]  433 	ld	hl,#0xC000
   4D92 E5            [11]  434 	push	hl
   4D93 CD AD 5F      [17]  435 	call	_cpct_getScreenPtr
   4D96 4D            [ 4]  436 	ld	c,l
   4D97 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D98 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4D9B E5            [11]  440 	push	hl
   4D9C C5            [11]  441 	push	bc
   4D9D 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4DA0 E5            [11]  443 	push	hl
   4DA1 CD EA 53      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4DA4 21 18 73      [10]  446 	ld	hl,#0x7318
   4DA7 E5            [11]  447 	push	hl
   4DA8 21 00 C0      [10]  448 	ld	hl,#0xC000
   4DAB E5            [11]  449 	push	hl
   4DAC CD AD 5F      [17]  450 	call	_cpct_getScreenPtr
   4DAF 4D            [ 4]  451 	ld	c,l
   4DB0 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4DB1 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4DB4 E5            [11]  455 	push	hl
   4DB5 C5            [11]  456 	push	bc
   4DB6 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4DB9 E5            [11]  458 	push	hl
   4DBA CD EA 53      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4DBD 21 22 73      [10]  461 	ld	hl,#0x7322
   4DC0 E5            [11]  462 	push	hl
   4DC1 21 00 C0      [10]  463 	ld	hl,#0xC000
   4DC4 E5            [11]  464 	push	hl
   4DC5 CD AD 5F      [17]  465 	call	_cpct_getScreenPtr
   4DC8 4D            [ 4]  466 	ld	c,l
   4DC9 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4DCA 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4DCD E5            [11]  470 	push	hl
   4DCE C5            [11]  471 	push	bc
   4DCF 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4DD2 E5            [11]  473 	push	hl
   4DD3 CD EA 53      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4DD6 21 2D 73      [10]  476 	ld	hl,#0x732D
   4DD9 E5            [11]  477 	push	hl
   4DDA 21 00 C0      [10]  478 	ld	hl,#0xC000
   4DDD E5            [11]  479 	push	hl
   4DDE CD AD 5F      [17]  480 	call	_cpct_getScreenPtr
   4DE1 4D            [ 4]  481 	ld	c,l
   4DE2 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4DE3 21 02 00      [10]  484 	ld	hl,#0x0002
   4DE6 E5            [11]  485 	push	hl
   4DE7 C5            [11]  486 	push	bc
   4DE8 21 43 4E      [10]  487 	ld	hl,#___str_3
   4DEB E5            [11]  488 	push	hl
   4DEC CD C6 53      [17]  489 	call	_cpct_drawStringM0
   4DEF 21 06 00      [10]  490 	ld	hl,#6
   4DF2 39            [11]  491 	add	hl,sp
   4DF3 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4DF4 21 04 82      [10]  494 	ld	hl,#0x8204
   4DF7 E5            [11]  495 	push	hl
   4DF8 21 00 C0      [10]  496 	ld	hl,#0xC000
   4DFB E5            [11]  497 	push	hl
   4DFC CD AD 5F      [17]  498 	call	_cpct_getScreenPtr
   4DFF 4D            [ 4]  499 	ld	c,l
   4E00 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4E01 21 02 00      [10]  502 	ld	hl,#0x0002
   4E04 E5            [11]  503 	push	hl
   4E05 C5            [11]  504 	push	bc
   4E06 21 4C 4E      [10]  505 	ld	hl,#___str_4
   4E09 E5            [11]  506 	push	hl
   4E0A CD C6 53      [17]  507 	call	_cpct_drawStringM0
   4E0D 21 06 00      [10]  508 	ld	hl,#6
   4E10 39            [11]  509 	add	hl,sp
   4E11 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4E12                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4E12 CD 2D 53      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4E15 21 04 40      [10]  516 	ld	hl,#0x4004
   4E18 CD AE 53      [17]  517 	call	_cpct_isKeyPressed
   4E1B 7D            [ 4]  518 	ld	a,l
   4E1C B7            [ 4]  519 	or	a, a
   4E1D 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4E1F CD 3E 4F      [17]  522 	call	_menuOpciones
   4E22                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E22 21 07 10      [10]  525 	ld	hl,#0x1007
   4E25 CD AE 53      [17]  526 	call	_cpct_isKeyPressed
   4E28 7D            [ 4]  527 	ld	a,l
   4E29 B7            [ 4]  528 	or	a, a
   4E2A C0            [11]  529 	ret	NZ
   4E2B 21 04 40      [10]  530 	ld	hl,#0x4004
   4E2E CD AE 53      [17]  531 	call	_cpct_isKeyPressed
   4E31 7D            [ 4]  532 	ld	a,l
   4E32 B7            [ 4]  533 	or	a, a
   4E33 28 DD         [12]  534 	jr	Z,00104$
   4E35 C9            [10]  535 	ret
   4E36                     536 ___str_2:
   4E36 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4E42 00                  538 	.db 0x00
   4E43                     539 ___str_3:
   4E43 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4E4B 00                  541 	.db 0x00
   4E4C                     542 ___str_4:
   4E4C 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4E5E 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4E5F                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E5F 21 50 82      [10]  551 	ld	hl,#0x8250
   4E62 E5            [11]  552 	push	hl
   4E63 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4E66 E5            [11]  554 	push	hl
   4E67 CD BC 4C      [17]  555 	call	_borrarPantalla
   4E6A F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4E6B 21 1A 46      [10]  558 	ld	hl, #0x461A
   4E6E E3            [19]  559 	ex	(sp),hl
   4E6F 21 00 C0      [10]  560 	ld	hl,#0xC000
   4E72 E5            [11]  561 	push	hl
   4E73 CD AD 5F      [17]  562 	call	_cpct_getScreenPtr
   4E76 4D            [ 4]  563 	ld	c,l
   4E77 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4E78 21 02 00      [10]  566 	ld	hl,#0x0002
   4E7B E5            [11]  567 	push	hl
   4E7C C5            [11]  568 	push	bc
   4E7D 21 07 4F      [10]  569 	ld	hl,#___str_5
   4E80 E5            [11]  570 	push	hl
   4E81 CD C6 53      [17]  571 	call	_cpct_drawStringM0
   4E84 21 06 00      [10]  572 	ld	hl,#6
   4E87 39            [11]  573 	add	hl,sp
   4E88 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4E89 21 0A 64      [10]  576 	ld	hl,#0x640A
   4E8C E5            [11]  577 	push	hl
   4E8D 21 00 C0      [10]  578 	ld	hl,#0xC000
   4E90 E5            [11]  579 	push	hl
   4E91 CD AD 5F      [17]  580 	call	_cpct_getScreenPtr
   4E94 4D            [ 4]  581 	ld	c,l
   4E95 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4E96 21 02 00      [10]  584 	ld	hl,#0x0002
   4E99 E5            [11]  585 	push	hl
   4E9A C5            [11]  586 	push	bc
   4E9B 21 0F 4F      [10]  587 	ld	hl,#___str_6
   4E9E E5            [11]  588 	push	hl
   4E9F CD C6 53      [17]  589 	call	_cpct_drawStringM0
   4EA2 21 06 00      [10]  590 	ld	hl,#6
   4EA5 39            [11]  591 	add	hl,sp
   4EA6 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4EA7 21 0E 73      [10]  594 	ld	hl,#0x730E
   4EAA E5            [11]  595 	push	hl
   4EAB 21 00 C0      [10]  596 	ld	hl,#0xC000
   4EAE E5            [11]  597 	push	hl
   4EAF CD AD 5F      [17]  598 	call	_cpct_getScreenPtr
   4EB2 4D            [ 4]  599 	ld	c,l
   4EB3 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4EB4 21 02 00      [10]  602 	ld	hl,#0x0002
   4EB7 E5            [11]  603 	push	hl
   4EB8 C5            [11]  604 	push	bc
   4EB9 21 1F 4F      [10]  605 	ld	hl,#___str_7
   4EBC E5            [11]  606 	push	hl
   4EBD CD C6 53      [17]  607 	call	_cpct_drawStringM0
   4EC0 21 06 00      [10]  608 	ld	hl,#6
   4EC3 39            [11]  609 	add	hl,sp
   4EC4 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4EC5 21 08 82      [10]  612 	ld	hl,#0x8208
   4EC8 E5            [11]  613 	push	hl
   4EC9 21 00 C0      [10]  614 	ld	hl,#0xC000
   4ECC E5            [11]  615 	push	hl
   4ECD CD AD 5F      [17]  616 	call	_cpct_getScreenPtr
   4ED0 4D            [ 4]  617 	ld	c,l
   4ED1 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4ED2 21 02 00      [10]  620 	ld	hl,#0x0002
   4ED5 E5            [11]  621 	push	hl
   4ED6 C5            [11]  622 	push	bc
   4ED7 21 2D 4F      [10]  623 	ld	hl,#___str_8
   4EDA E5            [11]  624 	push	hl
   4EDB CD C6 53      [17]  625 	call	_cpct_drawStringM0
   4EDE 21 06 00      [10]  626 	ld	hl,#6
   4EE1 39            [11]  627 	add	hl,sp
   4EE2 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4EE3                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4EE3 CD 2D 53      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4EE6 21 04 40      [10]  634 	ld	hl,#0x4004
   4EE9 CD AE 53      [17]  635 	call	_cpct_isKeyPressed
   4EEC 7D            [ 4]  636 	ld	a,l
   4EED B7            [ 4]  637 	or	a, a
   4EEE 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4EF0 CD 3E 4F      [17]  640 	call	_menuOpciones
   4EF3                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4EF3 21 07 10      [10]  643 	ld	hl,#0x1007
   4EF6 CD AE 53      [17]  644 	call	_cpct_isKeyPressed
   4EF9 7D            [ 4]  645 	ld	a,l
   4EFA B7            [ 4]  646 	or	a, a
   4EFB C0            [11]  647 	ret	NZ
   4EFC 21 04 40      [10]  648 	ld	hl,#0x4004
   4EFF CD AE 53      [17]  649 	call	_cpct_isKeyPressed
   4F02 7D            [ 4]  650 	ld	a,l
   4F03 B7            [ 4]  651 	or	a, a
   4F04 28 DD         [12]  652 	jr	Z,00104$
   4F06 C9            [10]  653 	ret
   4F07                     654 ___str_5:
   4F07 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4F0E 00                  656 	.db 0x00
   4F0F                     657 ___str_6:
   4F0F 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4F1E 00                  659 	.db 0x00
   4F1F                     660 ___str_7:
   4F1F 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4F2C 00                  662 	.db 0x00
   4F2D                     663 ___str_8:
   4F2D 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4F3D 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4F3E                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4F3E 21 50 82      [10]  672 	ld	hl,#0x8250
   4F41 E5            [11]  673 	push	hl
   4F42 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4F45 E5            [11]  675 	push	hl
   4F46 CD BC 4C      [17]  676 	call	_borrarPantalla
   4F49 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4F4A 21 20 64      [10]  679 	ld	hl, #0x6420
   4F4D E3            [19]  680 	ex	(sp),hl
   4F4E 21 00 C0      [10]  681 	ld	hl,#0xC000
   4F51 E5            [11]  682 	push	hl
   4F52 CD AD 5F      [17]  683 	call	_cpct_getScreenPtr
   4F55 4D            [ 4]  684 	ld	c,l
   4F56 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4F57 21 02 00      [10]  687 	ld	hl,#0x0002
   4F5A E5            [11]  688 	push	hl
   4F5B C5            [11]  689 	push	bc
   4F5C 21 DF 4F      [10]  690 	ld	hl,#___str_9
   4F5F E5            [11]  691 	push	hl
   4F60 CD C6 53      [17]  692 	call	_cpct_drawStringM0
   4F63 21 06 00      [10]  693 	ld	hl,#6
   4F66 39            [11]  694 	add	hl,sp
   4F67 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4F68 21 00 82      [10]  697 	ld	hl,#0x8200
   4F6B E5            [11]  698 	push	hl
   4F6C 26 C0         [ 7]  699 	ld	h, #0xC0
   4F6E E5            [11]  700 	push	hl
   4F6F CD AD 5F      [17]  701 	call	_cpct_getScreenPtr
   4F72 4D            [ 4]  702 	ld	c,l
   4F73 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4F74 21 02 00      [10]  705 	ld	hl,#0x0002
   4F77 E5            [11]  706 	push	hl
   4F78 C5            [11]  707 	push	bc
   4F79 21 E4 4F      [10]  708 	ld	hl,#___str_10
   4F7C E5            [11]  709 	push	hl
   4F7D CD C6 53      [17]  710 	call	_cpct_drawStringM0
   4F80 21 06 00      [10]  711 	ld	hl,#6
   4F83 39            [11]  712 	add	hl,sp
   4F84 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4F85 21 0A 91      [10]  715 	ld	hl,#0x910A
   4F88 E5            [11]  716 	push	hl
   4F89 21 00 C0      [10]  717 	ld	hl,#0xC000
   4F8C E5            [11]  718 	push	hl
   4F8D CD AD 5F      [17]  719 	call	_cpct_getScreenPtr
   4F90 4D            [ 4]  720 	ld	c,l
   4F91 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4F92 21 02 00      [10]  723 	ld	hl,#0x0002
   4F95 E5            [11]  724 	push	hl
   4F96 C5            [11]  725 	push	bc
   4F97 21 F9 4F      [10]  726 	ld	hl,#___str_11
   4F9A E5            [11]  727 	push	hl
   4F9B CD C6 53      [17]  728 	call	_cpct_drawStringM0
   4F9E 21 06 00      [10]  729 	ld	hl,#6
   4FA1 39            [11]  730 	add	hl,sp
   4FA2 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4FA3                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4FA3 CD 2D 53      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4FA6 21 04 08      [10]  737 	ld	hl,#0x0804
   4FA9 CD AE 53      [17]  738 	call	_cpct_isKeyPressed
   4FAC 7D            [ 4]  739 	ld	a,l
   4FAD B7            [ 4]  740 	or	a, a
   4FAE 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   4FB0 CD 48 4D      [17]  743 	call	_menuInstrucciones
   4FB3 18 0D         [12]  744 	jr	00109$
   4FB5                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   4FB5 21 07 40      [10]  747 	ld	hl,#0x4007
   4FB8 CD AE 53      [17]  748 	call	_cpct_isKeyPressed
   4FBB 7D            [ 4]  749 	ld	a,l
   4FBC B7            [ 4]  750 	or	a, a
   4FBD 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   4FBF CD 5F 4E      [17]  753 	call	_menuCreditos
   4FC2                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4FC2 21 07 10      [10]  756 	ld	hl,#0x1007
   4FC5 CD AE 53      [17]  757 	call	_cpct_isKeyPressed
   4FC8 7D            [ 4]  758 	ld	a,l
   4FC9 B7            [ 4]  759 	or	a, a
   4FCA C0            [11]  760 	ret	NZ
   4FCB 21 04 08      [10]  761 	ld	hl,#0x0804
   4FCE CD AE 53      [17]  762 	call	_cpct_isKeyPressed
   4FD1 7D            [ 4]  763 	ld	a,l
   4FD2 B7            [ 4]  764 	or	a, a
   4FD3 C0            [11]  765 	ret	NZ
   4FD4 21 07 40      [10]  766 	ld	hl,#0x4007
   4FD7 CD AE 53      [17]  767 	call	_cpct_isKeyPressed
   4FDA 7D            [ 4]  768 	ld	a,l
   4FDB B7            [ 4]  769 	or	a, a
   4FDC 28 C5         [12]  770 	jr	Z,00108$
   4FDE C9            [10]  771 	ret
   4FDF                     772 ___str_9:
   4FDF 4D 45 4E 55         773 	.ascii "MENU"
   4FE3 00                  774 	.db 0x00
   4FE4                     775 ___str_10:
   4FE4 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4FF8 00                  777 	.db 0x00
   4FF9                     778 ___str_11:
   4FF9 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   5008 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   5009                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   5009 21 00 40      [10]  787 	ld	hl,#0x4000
   500C E5            [11]  788 	push	hl
   500D AF            [ 4]  789 	xor	a, a
   500E F5            [11]  790 	push	af
   500F 33            [ 6]  791 	inc	sp
   5010 26 C0         [ 7]  792 	ld	h, #0xC0
   5012 E5            [11]  793 	push	hl
   5013 CD 75 56      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   5016 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   5019 E5            [11]  797 	push	hl
   501A 21 00 C0      [10]  798 	ld	hl,#0xC000
   501D E5            [11]  799 	push	hl
   501E CD AD 5F      [17]  800 	call	_cpct_getScreenPtr
   5021 4D            [ 4]  801 	ld	c,l
   5022 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   5023 21 04 00      [10]  804 	ld	hl,#0x0004
   5026 E5            [11]  805 	push	hl
   5027 C5            [11]  806 	push	bc
   5028 21 BF 50      [10]  807 	ld	hl,#___str_12
   502B E5            [11]  808 	push	hl
   502C CD C6 53      [17]  809 	call	_cpct_drawStringM0
   502F 21 06 00      [10]  810 	ld	hl,#6
   5032 39            [11]  811 	add	hl,sp
   5033 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   5034 21 28 6E      [10]  814 	ld	hl,#0x6E28
   5037 E5            [11]  815 	push	hl
   5038 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   503B E5            [11]  817 	push	hl
   503C 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   503F E5            [11]  819 	push	hl
   5040 CD EA 53      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   5043 21 28 6E      [10]  822 	ld	hl,#0x6E28
   5046 E5            [11]  823 	push	hl
   5047 21 18 F1      [10]  824 	ld	hl,#0xF118
   504A E5            [11]  825 	push	hl
   504B 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   504E E5            [11]  827 	push	hl
   504F CD EA 53      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   5052 21 08 A0      [10]  830 	ld	hl,#0xA008
   5055 E5            [11]  831 	push	hl
   5056 21 00 C0      [10]  832 	ld	hl,#0xC000
   5059 E5            [11]  833 	push	hl
   505A CD AD 5F      [17]  834 	call	_cpct_getScreenPtr
   505D 4D            [ 4]  835 	ld	c,l
   505E 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   505F 21 02 00      [10]  838 	ld	hl,#0x0002
   5062 E5            [11]  839 	push	hl
   5063 C5            [11]  840 	push	bc
   5064 21 C7 50      [10]  841 	ld	hl,#___str_13
   5067 E5            [11]  842 	push	hl
   5068 CD C6 53      [17]  843 	call	_cpct_drawStringM0
   506B 21 06 00      [10]  844 	ld	hl,#6
   506E 39            [11]  845 	add	hl,sp
   506F F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   5070 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   5073 E5            [11]  849 	push	hl
   5074 21 00 C0      [10]  850 	ld	hl,#0xC000
   5077 E5            [11]  851 	push	hl
   5078 CD AD 5F      [17]  852 	call	_cpct_getScreenPtr
   507B 4D            [ 4]  853 	ld	c,l
   507C 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   507D 21 02 00      [10]  856 	ld	hl,#0x0002
   5080 E5            [11]  857 	push	hl
   5081 C5            [11]  858 	push	bc
   5082 21 D8 50      [10]  859 	ld	hl,#___str_14
   5085 E5            [11]  860 	push	hl
   5086 CD C6 53      [17]  861 	call	_cpct_drawStringM0
   5089 21 06 00      [10]  862 	ld	hl,#6
   508C 39            [11]  863 	add	hl,sp
   508D F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   508E                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   508E CD 2D 53      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   5091 21 04 40      [10]  870 	ld	hl,#0x4004
   5094 CD AE 53      [17]  871 	call	_cpct_isKeyPressed
   5097 7D            [ 4]  872 	ld	a,l
   5098 B7            [ 4]  873 	or	a, a
   5099 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   509B CD 2D 53      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   509E                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   509E CD 3E 4F      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   50A1 21 07 10      [10]  882 	ld	hl,#0x1007
   50A4 CD AE 53      [17]  883 	call	_cpct_isKeyPressed
   50A7 7D            [ 4]  884 	ld	a,l
   50A8 B7            [ 4]  885 	or	a, a
   50A9 28 F3         [12]  886 	jr	Z,00101$
   50AB                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   50AB 21 07 10      [10]  889 	ld	hl,#0x1007
   50AE CD AE 53      [17]  890 	call	_cpct_isKeyPressed
   50B1 7D            [ 4]  891 	ld	a,l
   50B2 B7            [ 4]  892 	or	a, a
   50B3 C0            [11]  893 	ret	NZ
   50B4 21 04 40      [10]  894 	ld	hl,#0x4004
   50B7 CD AE 53      [17]  895 	call	_cpct_isKeyPressed
   50BA 7D            [ 4]  896 	ld	a,l
   50BB B7            [ 4]  897 	or	a, a
   50BC 28 D0         [12]  898 	jr	Z,00107$
   50BE C9            [10]  899 	ret
   50BF                     900 ___str_12:
   50BF 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   50C6 00                  902 	.db 0x00
   50C7                     903 ___str_13:
   50C7 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   50D7 00                  905 	.db 0x00
   50D8                     906 ___str_14:
   50D8 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   50E7 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
