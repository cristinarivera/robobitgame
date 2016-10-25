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
   4AA0                      60 _menuFin::
   4AA0 DD E5         [15]   61 	push	ix
   4AA2 DD 21 00 00   [14]   62 	ld	ix,#0
   4AA6 DD 39         [15]   63 	add	ix,sp
   4AA8 F5            [11]   64 	push	af
   4AA9 F5            [11]   65 	push	af
   4AAA DD 75 FE      [19]   66 	ld	-2 (ix),l
   4AAD DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4AB0 21 10 27      [10]   69 	ld	hl,#0x2710
   4AB3 E5            [11]   70 	push	hl
   4AB4 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4AB7 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4ABA E5            [11]   73 	push	hl
   4ABB CD 44 52      [17]   74 	call	__divuint
   4ABE F1            [10]   75 	pop	af
   4ABF F1            [10]   76 	pop	af
   4AC0 33            [ 6]   77 	inc	sp
   4AC1 33            [ 6]   78 	inc	sp
   4AC2 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4AC3 21 00 40      [10]   81 	ld	hl,#0x4000
   4AC6 E5            [11]   82 	push	hl
   4AC7 AF            [ 4]   83 	xor	a, a
   4AC8 F5            [11]   84 	push	af
   4AC9 33            [ 6]   85 	inc	sp
   4ACA 26 C0         [ 7]   86 	ld	h, #0xC0
   4ACC E5            [11]   87 	push	hl
   4ACD CD CD 55      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4AD0 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4AD3 E5            [11]   91 	push	hl
   4AD4 21 00 C0      [10]   92 	ld	hl,#0xC000
   4AD7 E5            [11]   93 	push	hl
   4AD8 CD 05 5F      [17]   94 	call	_cpct_getScreenPtr
   4ADB 4D            [ 4]   95 	ld	c,l
   4ADC 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4ADD 21 02 00      [10]   98 	ld	hl,#0x0002
   4AE0 E5            [11]   99 	push	hl
   4AE1 C5            [11]  100 	push	bc
   4AE2 21 02 4C      [10]  101 	ld	hl,#___str_0
   4AE5 E5            [11]  102 	push	hl
   4AE6 CD 1E 53      [17]  103 	call	_cpct_drawStringM0
   4AE9 21 06 00      [10]  104 	ld	hl,#6
   4AEC 39            [11]  105 	add	hl,sp
   4AED F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4AEE 21 14 78      [10]  108 	ld	hl,#0x7814
   4AF1 E5            [11]  109 	push	hl
   4AF2 21 00 C0      [10]  110 	ld	hl,#0xC000
   4AF5 E5            [11]  111 	push	hl
   4AF6 CD 05 5F      [17]  112 	call	_cpct_getScreenPtr
   4AF9 4D            [ 4]  113 	ld	c,l
   4AFA 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4AFB 21 02 00      [10]  116 	ld	hl,#0x0002
   4AFE E5            [11]  117 	push	hl
   4AFF C5            [11]  118 	push	bc
   4B00 21 0C 4C      [10]  119 	ld	hl,#___str_1
   4B03 E5            [11]  120 	push	hl
   4B04 CD 1E 53      [17]  121 	call	_cpct_drawStringM0
   4B07 21 06 00      [10]  122 	ld	hl,#6
   4B0A 39            [11]  123 	add	hl,sp
   4B0B F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4B0C 21 2D 78      [10]  126 	ld	hl,#0x782D
   4B0F E5            [11]  127 	push	hl
   4B10 21 00 C0      [10]  128 	ld	hl,#0xC000
   4B13 E5            [11]  129 	push	hl
   4B14 CD 05 5F      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4B17 E5            [11]  132 	push	hl
   4B18 21 0A 00      [10]  133 	ld	hl,#0x000A
   4B1B E5            [11]  134 	push	hl
   4B1C DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4B1F DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4B22 E5            [11]  137 	push	hl
   4B23 CD FA 5E      [17]  138 	call	__moduint
   4B26 F1            [10]  139 	pop	af
   4B27 F1            [10]  140 	pop	af
   4B28 C1            [10]  141 	pop	bc
   4B29 7D            [ 4]  142 	ld	a,l
   4B2A C6 30         [ 7]  143 	add	a, #0x30
   4B2C 67            [ 4]  144 	ld	h,a
   4B2D 59            [ 4]  145 	ld	e, c
   4B2E 50            [ 4]  146 	ld	d, b
   4B2F C5            [11]  147 	push	bc
   4B30 E5            [11]  148 	push	hl
   4B31 33            [ 6]  149 	inc	sp
   4B32 21 02 00      [10]  150 	ld	hl,#0x0002
   4B35 E5            [11]  151 	push	hl
   4B36 D5            [11]  152 	push	de
   4B37 CD 76 54      [17]  153 	call	_cpct_drawCharM0
   4B3A F1            [10]  154 	pop	af
   4B3B 33            [ 6]  155 	inc	sp
   4B3C 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4B3F E3            [19]  157 	ex	(sp),hl
   4B40 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4B43 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4B46 E5            [11]  160 	push	hl
   4B47 CD 44 52      [17]  161 	call	__divuint
   4B4A F1            [10]  162 	pop	af
   4B4B F1            [10]  163 	pop	af
   4B4C 11 0A 00      [10]  164 	ld	de,#0x000A
   4B4F D5            [11]  165 	push	de
   4B50 E5            [11]  166 	push	hl
   4B51 CD FA 5E      [17]  167 	call	__moduint
   4B54 F1            [10]  168 	pop	af
   4B55 F1            [10]  169 	pop	af
   4B56 C1            [10]  170 	pop	bc
   4B57 7D            [ 4]  171 	ld	a,l
   4B58 C6 30         [ 7]  172 	add	a, #0x30
   4B5A 67            [ 4]  173 	ld	h,a
   4B5B 79            [ 4]  174 	ld	a,c
   4B5C C6 04         [ 7]  175 	add	a, #0x04
   4B5E 5F            [ 4]  176 	ld	e,a
   4B5F 78            [ 4]  177 	ld	a,b
   4B60 CE 00         [ 7]  178 	adc	a, #0x00
   4B62 57            [ 4]  179 	ld	d,a
   4B63 C5            [11]  180 	push	bc
   4B64 E5            [11]  181 	push	hl
   4B65 33            [ 6]  182 	inc	sp
   4B66 21 02 00      [10]  183 	ld	hl,#0x0002
   4B69 E5            [11]  184 	push	hl
   4B6A D5            [11]  185 	push	de
   4B6B CD 76 54      [17]  186 	call	_cpct_drawCharM0
   4B6E F1            [10]  187 	pop	af
   4B6F 33            [ 6]  188 	inc	sp
   4B70 21 64 00      [10]  189 	ld	hl,#0x0064
   4B73 E3            [19]  190 	ex	(sp),hl
   4B74 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4B77 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4B7A E5            [11]  193 	push	hl
   4B7B CD 44 52      [17]  194 	call	__divuint
   4B7E F1            [10]  195 	pop	af
   4B7F F1            [10]  196 	pop	af
   4B80 11 0A 00      [10]  197 	ld	de,#0x000A
   4B83 D5            [11]  198 	push	de
   4B84 E5            [11]  199 	push	hl
   4B85 CD FA 5E      [17]  200 	call	__moduint
   4B88 F1            [10]  201 	pop	af
   4B89 F1            [10]  202 	pop	af
   4B8A C1            [10]  203 	pop	bc
   4B8B 7D            [ 4]  204 	ld	a,l
   4B8C C6 30         [ 7]  205 	add	a, #0x30
   4B8E 67            [ 4]  206 	ld	h,a
   4B8F 79            [ 4]  207 	ld	a,c
   4B90 C6 08         [ 7]  208 	add	a, #0x08
   4B92 5F            [ 4]  209 	ld	e,a
   4B93 78            [ 4]  210 	ld	a,b
   4B94 CE 00         [ 7]  211 	adc	a, #0x00
   4B96 57            [ 4]  212 	ld	d,a
   4B97 C5            [11]  213 	push	bc
   4B98 E5            [11]  214 	push	hl
   4B99 33            [ 6]  215 	inc	sp
   4B9A 21 02 00      [10]  216 	ld	hl,#0x0002
   4B9D E5            [11]  217 	push	hl
   4B9E D5            [11]  218 	push	de
   4B9F CD 76 54      [17]  219 	call	_cpct_drawCharM0
   4BA2 F1            [10]  220 	pop	af
   4BA3 33            [ 6]  221 	inc	sp
   4BA4 21 0A 00      [10]  222 	ld	hl,#0x000A
   4BA7 E3            [19]  223 	ex	(sp),hl
   4BA8 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4BAB DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4BAE E5            [11]  226 	push	hl
   4BAF CD 44 52      [17]  227 	call	__divuint
   4BB2 F1            [10]  228 	pop	af
   4BB3 F1            [10]  229 	pop	af
   4BB4 11 0A 00      [10]  230 	ld	de,#0x000A
   4BB7 D5            [11]  231 	push	de
   4BB8 E5            [11]  232 	push	hl
   4BB9 CD FA 5E      [17]  233 	call	__moduint
   4BBC F1            [10]  234 	pop	af
   4BBD F1            [10]  235 	pop	af
   4BBE C1            [10]  236 	pop	bc
   4BBF 7D            [ 4]  237 	ld	a,l
   4BC0 C6 30         [ 7]  238 	add	a, #0x30
   4BC2 67            [ 4]  239 	ld	h,a
   4BC3 79            [ 4]  240 	ld	a,c
   4BC4 C6 0C         [ 7]  241 	add	a, #0x0C
   4BC6 5F            [ 4]  242 	ld	e,a
   4BC7 78            [ 4]  243 	ld	a,b
   4BC8 CE 00         [ 7]  244 	adc	a, #0x00
   4BCA 57            [ 4]  245 	ld	d,a
   4BCB C5            [11]  246 	push	bc
   4BCC E5            [11]  247 	push	hl
   4BCD 33            [ 6]  248 	inc	sp
   4BCE 21 02 00      [10]  249 	ld	hl,#0x0002
   4BD1 E5            [11]  250 	push	hl
   4BD2 D5            [11]  251 	push	de
   4BD3 CD 76 54      [17]  252 	call	_cpct_drawCharM0
   4BD6 F1            [10]  253 	pop	af
   4BD7 33            [ 6]  254 	inc	sp
   4BD8 21 0A 00      [10]  255 	ld	hl,#0x000A
   4BDB E3            [19]  256 	ex	(sp),hl
   4BDC DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4BDF DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4BE2 E5            [11]  259 	push	hl
   4BE3 CD FA 5E      [17]  260 	call	__moduint
   4BE6 F1            [10]  261 	pop	af
   4BE7 F1            [10]  262 	pop	af
   4BE8 C1            [10]  263 	pop	bc
   4BE9 7D            [ 4]  264 	ld	a,l
   4BEA C6 30         [ 7]  265 	add	a, #0x30
   4BEC 57            [ 4]  266 	ld	d,a
   4BED 21 10 00      [10]  267 	ld	hl,#0x0010
   4BF0 09            [11]  268 	add	hl,bc
   4BF1 4D            [ 4]  269 	ld	c,l
   4BF2 44            [ 4]  270 	ld	b,h
   4BF3 D5            [11]  271 	push	de
   4BF4 33            [ 6]  272 	inc	sp
   4BF5 21 02 00      [10]  273 	ld	hl,#0x0002
   4BF8 E5            [11]  274 	push	hl
   4BF9 C5            [11]  275 	push	bc
   4BFA CD 76 54      [17]  276 	call	_cpct_drawCharM0
   4BFD F1            [10]  277 	pop	af
   4BFE F1            [10]  278 	pop	af
   4BFF 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4C00                     281 00102$:
   4C00 18 FE         [12]  282 	jr	00102$
   4C02                     283 ___str_0:
   4C02 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4C0B 00                  285 	.db 0x00
   4C0C                     286 ___str_1:
   4C0C 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4C13 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4C14                     293 _borrarPantalla::
   4C14 DD E5         [15]  294 	push	ix
   4C16 DD 21 00 00   [14]  295 	ld	ix,#0
   4C1A DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4C1C 3E 28         [ 7]  298 	ld	a,#0x28
   4C1E DD 96 06      [19]  299 	sub	a, 6 (ix)
   4C21 3E 00         [ 7]  300 	ld	a,#0x00
   4C23 17            [ 4]  301 	rla
   4C24 4F            [ 4]  302 	ld	c,a
   4C25 CB 41         [ 8]  303 	bit	0,c
   4C27 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4C29 DD 66 05      [19]  306 	ld	h,5 (ix)
   4C2C DD 6E 04      [19]  307 	ld	l,4 (ix)
   4C2F E5            [11]  308 	push	hl
   4C30 21 00 C0      [10]  309 	ld	hl,#0xC000
   4C33 E5            [11]  310 	push	hl
   4C34 CD 05 5F      [17]  311 	call	_cpct_getScreenPtr
   4C37 4D            [ 4]  312 	ld	c,l
   4C38 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4C39 DD 66 07      [19]  315 	ld	h,7 (ix)
   4C3C DD 6E 06      [19]  316 	ld	l,6 (ix)
   4C3F E5            [11]  317 	push	hl
   4C40 AF            [ 4]  318 	xor	a, a
   4C41 F5            [11]  319 	push	af
   4C42 33            [ 6]  320 	inc	sp
   4C43 C5            [11]  321 	push	bc
   4C44 CD EB 55      [17]  322 	call	_cpct_drawSolidBox
   4C47 F1            [10]  323 	pop	af
   4C48 F1            [10]  324 	pop	af
   4C49 33            [ 6]  325 	inc	sp
   4C4A 18 51         [12]  326 	jr	00106$
   4C4C                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4C4C CB 41         [ 8]  329 	bit	0,c
   4C4E 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4C50 DD 66 05      [19]  332 	ld	h,5 (ix)
   4C53 DD 6E 04      [19]  333 	ld	l,4 (ix)
   4C56 E5            [11]  334 	push	hl
   4C57 21 00 C0      [10]  335 	ld	hl,#0xC000
   4C5A E5            [11]  336 	push	hl
   4C5B CD 05 5F      [17]  337 	call	_cpct_getScreenPtr
   4C5E 4D            [ 4]  338 	ld	c,l
   4C5F 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4C60 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4C63 F5            [11]  342 	push	af
   4C64 33            [ 6]  343 	inc	sp
   4C65 21 00 28      [10]  344 	ld	hl,#0x2800
   4C68 E5            [11]  345 	push	hl
   4C69 C5            [11]  346 	push	bc
   4C6A CD EB 55      [17]  347 	call	_cpct_drawSolidBox
   4C6D F1            [10]  348 	pop	af
   4C6E F1            [10]  349 	pop	af
   4C6F 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4C70 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4C73 C6 28         [ 7]  353 	add	a, #0x28
   4C75 47            [ 4]  354 	ld	b,a
   4C76 DD 7E 05      [19]  355 	ld	a,5 (ix)
   4C79 F5            [11]  356 	push	af
   4C7A 33            [ 6]  357 	inc	sp
   4C7B C5            [11]  358 	push	bc
   4C7C 33            [ 6]  359 	inc	sp
   4C7D 21 00 C0      [10]  360 	ld	hl,#0xC000
   4C80 E5            [11]  361 	push	hl
   4C81 CD 05 5F      [17]  362 	call	_cpct_getScreenPtr
   4C84 4D            [ 4]  363 	ld	c,l
   4C85 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C86 DD 7E 06      [19]  366 	ld	a,6 (ix)
   4C89 C6 D8         [ 7]  367 	add	a,#0xD8
   4C8B 57            [ 4]  368 	ld	d,a
   4C8C DD 7E 07      [19]  369 	ld	a,7 (ix)
   4C8F F5            [11]  370 	push	af
   4C90 33            [ 6]  371 	inc	sp
   4C91 D5            [11]  372 	push	de
   4C92 33            [ 6]  373 	inc	sp
   4C93 AF            [ 4]  374 	xor	a, a
   4C94 F5            [11]  375 	push	af
   4C95 33            [ 6]  376 	inc	sp
   4C96 C5            [11]  377 	push	bc
   4C97 CD EB 55      [17]  378 	call	_cpct_drawSolidBox
   4C9A F1            [10]  379 	pop	af
   4C9B F1            [10]  380 	pop	af
   4C9C 33            [ 6]  381 	inc	sp
   4C9D                     382 00106$:
   4C9D DD E1         [14]  383 	pop	ix
   4C9F C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4CA0                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4CA0 21 50 82      [10]  391 	ld	hl,#0x8250
   4CA3 E5            [11]  392 	push	hl
   4CA4 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4CA7 E5            [11]  394 	push	hl
   4CA8 CD 14 4C      [17]  395 	call	_borrarPantalla
   4CAB F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4CAC 21 10 55      [10]  398 	ld	hl, #0x5510
   4CAF E3            [19]  399 	ex	(sp),hl
   4CB0 21 00 C0      [10]  400 	ld	hl,#0xC000
   4CB3 E5            [11]  401 	push	hl
   4CB4 CD 05 5F      [17]  402 	call	_cpct_getScreenPtr
   4CB7 4D            [ 4]  403 	ld	c,l
   4CB8 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4CB9 21 02 00      [10]  406 	ld	hl,#0x0002
   4CBC E5            [11]  407 	push	hl
   4CBD C5            [11]  408 	push	bc
   4CBE 21 8E 4D      [10]  409 	ld	hl,#___str_2
   4CC1 E5            [11]  410 	push	hl
   4CC2 CD 1E 53      [17]  411 	call	_cpct_drawStringM0
   4CC5 21 06 00      [10]  412 	ld	hl,#6
   4CC8 39            [11]  413 	add	hl,sp
   4CC9 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4CCA 21 04 73      [10]  416 	ld	hl,#0x7304
   4CCD E5            [11]  417 	push	hl
   4CCE 21 00 C0      [10]  418 	ld	hl,#0xC000
   4CD1 E5            [11]  419 	push	hl
   4CD2 CD 05 5F      [17]  420 	call	_cpct_getScreenPtr
   4CD5 4D            [ 4]  421 	ld	c,l
   4CD6 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CD7 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4CDA E5            [11]  425 	push	hl
   4CDB C5            [11]  426 	push	bc
   4CDC 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4CDF E5            [11]  428 	push	hl
   4CE0 CD 42 53      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4CE3 21 0E 73      [10]  431 	ld	hl,#0x730E
   4CE6 E5            [11]  432 	push	hl
   4CE7 21 00 C0      [10]  433 	ld	hl,#0xC000
   4CEA E5            [11]  434 	push	hl
   4CEB CD 05 5F      [17]  435 	call	_cpct_getScreenPtr
   4CEE 4D            [ 4]  436 	ld	c,l
   4CEF 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CF0 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4CF3 E5            [11]  440 	push	hl
   4CF4 C5            [11]  441 	push	bc
   4CF5 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4CF8 E5            [11]  443 	push	hl
   4CF9 CD 42 53      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4CFC 21 18 73      [10]  446 	ld	hl,#0x7318
   4CFF E5            [11]  447 	push	hl
   4D00 21 00 C0      [10]  448 	ld	hl,#0xC000
   4D03 E5            [11]  449 	push	hl
   4D04 CD 05 5F      [17]  450 	call	_cpct_getScreenPtr
   4D07 4D            [ 4]  451 	ld	c,l
   4D08 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D09 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4D0C E5            [11]  455 	push	hl
   4D0D C5            [11]  456 	push	bc
   4D0E 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4D11 E5            [11]  458 	push	hl
   4D12 CD 42 53      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4D15 21 22 73      [10]  461 	ld	hl,#0x7322
   4D18 E5            [11]  462 	push	hl
   4D19 21 00 C0      [10]  463 	ld	hl,#0xC000
   4D1C E5            [11]  464 	push	hl
   4D1D CD 05 5F      [17]  465 	call	_cpct_getScreenPtr
   4D20 4D            [ 4]  466 	ld	c,l
   4D21 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D22 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4D25 E5            [11]  470 	push	hl
   4D26 C5            [11]  471 	push	bc
   4D27 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4D2A E5            [11]  473 	push	hl
   4D2B CD 42 53      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4D2E 21 2D 73      [10]  476 	ld	hl,#0x732D
   4D31 E5            [11]  477 	push	hl
   4D32 21 00 C0      [10]  478 	ld	hl,#0xC000
   4D35 E5            [11]  479 	push	hl
   4D36 CD 05 5F      [17]  480 	call	_cpct_getScreenPtr
   4D39 4D            [ 4]  481 	ld	c,l
   4D3A 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4D3B 21 02 00      [10]  484 	ld	hl,#0x0002
   4D3E E5            [11]  485 	push	hl
   4D3F C5            [11]  486 	push	bc
   4D40 21 9B 4D      [10]  487 	ld	hl,#___str_3
   4D43 E5            [11]  488 	push	hl
   4D44 CD 1E 53      [17]  489 	call	_cpct_drawStringM0
   4D47 21 06 00      [10]  490 	ld	hl,#6
   4D4A 39            [11]  491 	add	hl,sp
   4D4B F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4D4C 21 04 82      [10]  494 	ld	hl,#0x8204
   4D4F E5            [11]  495 	push	hl
   4D50 21 00 C0      [10]  496 	ld	hl,#0xC000
   4D53 E5            [11]  497 	push	hl
   4D54 CD 05 5F      [17]  498 	call	_cpct_getScreenPtr
   4D57 4D            [ 4]  499 	ld	c,l
   4D58 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4D59 21 02 00      [10]  502 	ld	hl,#0x0002
   4D5C E5            [11]  503 	push	hl
   4D5D C5            [11]  504 	push	bc
   4D5E 21 A4 4D      [10]  505 	ld	hl,#___str_4
   4D61 E5            [11]  506 	push	hl
   4D62 CD 1E 53      [17]  507 	call	_cpct_drawStringM0
   4D65 21 06 00      [10]  508 	ld	hl,#6
   4D68 39            [11]  509 	add	hl,sp
   4D69 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4D6A                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4D6A CD 85 52      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4D6D 21 04 40      [10]  516 	ld	hl,#0x4004
   4D70 CD 06 53      [17]  517 	call	_cpct_isKeyPressed
   4D73 7D            [ 4]  518 	ld	a,l
   4D74 B7            [ 4]  519 	or	a, a
   4D75 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4D77 CD 96 4E      [17]  522 	call	_menuOpciones
   4D7A                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4D7A 21 07 10      [10]  525 	ld	hl,#0x1007
   4D7D CD 06 53      [17]  526 	call	_cpct_isKeyPressed
   4D80 7D            [ 4]  527 	ld	a,l
   4D81 B7            [ 4]  528 	or	a, a
   4D82 C0            [11]  529 	ret	NZ
   4D83 21 04 40      [10]  530 	ld	hl,#0x4004
   4D86 CD 06 53      [17]  531 	call	_cpct_isKeyPressed
   4D89 7D            [ 4]  532 	ld	a,l
   4D8A B7            [ 4]  533 	or	a, a
   4D8B 28 DD         [12]  534 	jr	Z,00104$
   4D8D C9            [10]  535 	ret
   4D8E                     536 ___str_2:
   4D8E 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4D9A 00                  538 	.db 0x00
   4D9B                     539 ___str_3:
   4D9B 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4DA3 00                  541 	.db 0x00
   4DA4                     542 ___str_4:
   4DA4 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4DB6 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4DB7                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4DB7 21 50 82      [10]  551 	ld	hl,#0x8250
   4DBA E5            [11]  552 	push	hl
   4DBB 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4DBE E5            [11]  554 	push	hl
   4DBF CD 14 4C      [17]  555 	call	_borrarPantalla
   4DC2 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4DC3 21 1A 46      [10]  558 	ld	hl, #0x461A
   4DC6 E3            [19]  559 	ex	(sp),hl
   4DC7 21 00 C0      [10]  560 	ld	hl,#0xC000
   4DCA E5            [11]  561 	push	hl
   4DCB CD 05 5F      [17]  562 	call	_cpct_getScreenPtr
   4DCE 4D            [ 4]  563 	ld	c,l
   4DCF 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4DD0 21 02 00      [10]  566 	ld	hl,#0x0002
   4DD3 E5            [11]  567 	push	hl
   4DD4 C5            [11]  568 	push	bc
   4DD5 21 5F 4E      [10]  569 	ld	hl,#___str_5
   4DD8 E5            [11]  570 	push	hl
   4DD9 CD 1E 53      [17]  571 	call	_cpct_drawStringM0
   4DDC 21 06 00      [10]  572 	ld	hl,#6
   4DDF 39            [11]  573 	add	hl,sp
   4DE0 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4DE1 21 0A 64      [10]  576 	ld	hl,#0x640A
   4DE4 E5            [11]  577 	push	hl
   4DE5 21 00 C0      [10]  578 	ld	hl,#0xC000
   4DE8 E5            [11]  579 	push	hl
   4DE9 CD 05 5F      [17]  580 	call	_cpct_getScreenPtr
   4DEC 4D            [ 4]  581 	ld	c,l
   4DED 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4DEE 21 02 00      [10]  584 	ld	hl,#0x0002
   4DF1 E5            [11]  585 	push	hl
   4DF2 C5            [11]  586 	push	bc
   4DF3 21 67 4E      [10]  587 	ld	hl,#___str_6
   4DF6 E5            [11]  588 	push	hl
   4DF7 CD 1E 53      [17]  589 	call	_cpct_drawStringM0
   4DFA 21 06 00      [10]  590 	ld	hl,#6
   4DFD 39            [11]  591 	add	hl,sp
   4DFE F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4DFF 21 0E 73      [10]  594 	ld	hl,#0x730E
   4E02 E5            [11]  595 	push	hl
   4E03 21 00 C0      [10]  596 	ld	hl,#0xC000
   4E06 E5            [11]  597 	push	hl
   4E07 CD 05 5F      [17]  598 	call	_cpct_getScreenPtr
   4E0A 4D            [ 4]  599 	ld	c,l
   4E0B 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4E0C 21 02 00      [10]  602 	ld	hl,#0x0002
   4E0F E5            [11]  603 	push	hl
   4E10 C5            [11]  604 	push	bc
   4E11 21 77 4E      [10]  605 	ld	hl,#___str_7
   4E14 E5            [11]  606 	push	hl
   4E15 CD 1E 53      [17]  607 	call	_cpct_drawStringM0
   4E18 21 06 00      [10]  608 	ld	hl,#6
   4E1B 39            [11]  609 	add	hl,sp
   4E1C F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4E1D 21 08 82      [10]  612 	ld	hl,#0x8208
   4E20 E5            [11]  613 	push	hl
   4E21 21 00 C0      [10]  614 	ld	hl,#0xC000
   4E24 E5            [11]  615 	push	hl
   4E25 CD 05 5F      [17]  616 	call	_cpct_getScreenPtr
   4E28 4D            [ 4]  617 	ld	c,l
   4E29 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4E2A 21 02 00      [10]  620 	ld	hl,#0x0002
   4E2D E5            [11]  621 	push	hl
   4E2E C5            [11]  622 	push	bc
   4E2F 21 85 4E      [10]  623 	ld	hl,#___str_8
   4E32 E5            [11]  624 	push	hl
   4E33 CD 1E 53      [17]  625 	call	_cpct_drawStringM0
   4E36 21 06 00      [10]  626 	ld	hl,#6
   4E39 39            [11]  627 	add	hl,sp
   4E3A F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4E3B                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4E3B CD 85 52      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4E3E 21 04 40      [10]  634 	ld	hl,#0x4004
   4E41 CD 06 53      [17]  635 	call	_cpct_isKeyPressed
   4E44 7D            [ 4]  636 	ld	a,l
   4E45 B7            [ 4]  637 	or	a, a
   4E46 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4E48 CD 96 4E      [17]  640 	call	_menuOpciones
   4E4B                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E4B 21 07 10      [10]  643 	ld	hl,#0x1007
   4E4E CD 06 53      [17]  644 	call	_cpct_isKeyPressed
   4E51 7D            [ 4]  645 	ld	a,l
   4E52 B7            [ 4]  646 	or	a, a
   4E53 C0            [11]  647 	ret	NZ
   4E54 21 04 40      [10]  648 	ld	hl,#0x4004
   4E57 CD 06 53      [17]  649 	call	_cpct_isKeyPressed
   4E5A 7D            [ 4]  650 	ld	a,l
   4E5B B7            [ 4]  651 	or	a, a
   4E5C 28 DD         [12]  652 	jr	Z,00104$
   4E5E C9            [10]  653 	ret
   4E5F                     654 ___str_5:
   4E5F 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4E66 00                  656 	.db 0x00
   4E67                     657 ___str_6:
   4E67 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4E76 00                  659 	.db 0x00
   4E77                     660 ___str_7:
   4E77 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4E84 00                  662 	.db 0x00
   4E85                     663 ___str_8:
   4E85 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4E95 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4E96                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E96 21 50 82      [10]  672 	ld	hl,#0x8250
   4E99 E5            [11]  673 	push	hl
   4E9A 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4E9D E5            [11]  675 	push	hl
   4E9E CD 14 4C      [17]  676 	call	_borrarPantalla
   4EA1 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4EA2 21 20 64      [10]  679 	ld	hl, #0x6420
   4EA5 E3            [19]  680 	ex	(sp),hl
   4EA6 21 00 C0      [10]  681 	ld	hl,#0xC000
   4EA9 E5            [11]  682 	push	hl
   4EAA CD 05 5F      [17]  683 	call	_cpct_getScreenPtr
   4EAD 4D            [ 4]  684 	ld	c,l
   4EAE 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4EAF 21 02 00      [10]  687 	ld	hl,#0x0002
   4EB2 E5            [11]  688 	push	hl
   4EB3 C5            [11]  689 	push	bc
   4EB4 21 37 4F      [10]  690 	ld	hl,#___str_9
   4EB7 E5            [11]  691 	push	hl
   4EB8 CD 1E 53      [17]  692 	call	_cpct_drawStringM0
   4EBB 21 06 00      [10]  693 	ld	hl,#6
   4EBE 39            [11]  694 	add	hl,sp
   4EBF F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4EC0 21 00 82      [10]  697 	ld	hl,#0x8200
   4EC3 E5            [11]  698 	push	hl
   4EC4 26 C0         [ 7]  699 	ld	h, #0xC0
   4EC6 E5            [11]  700 	push	hl
   4EC7 CD 05 5F      [17]  701 	call	_cpct_getScreenPtr
   4ECA 4D            [ 4]  702 	ld	c,l
   4ECB 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4ECC 21 02 00      [10]  705 	ld	hl,#0x0002
   4ECF E5            [11]  706 	push	hl
   4ED0 C5            [11]  707 	push	bc
   4ED1 21 3C 4F      [10]  708 	ld	hl,#___str_10
   4ED4 E5            [11]  709 	push	hl
   4ED5 CD 1E 53      [17]  710 	call	_cpct_drawStringM0
   4ED8 21 06 00      [10]  711 	ld	hl,#6
   4EDB 39            [11]  712 	add	hl,sp
   4EDC F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4EDD 21 0A 91      [10]  715 	ld	hl,#0x910A
   4EE0 E5            [11]  716 	push	hl
   4EE1 21 00 C0      [10]  717 	ld	hl,#0xC000
   4EE4 E5            [11]  718 	push	hl
   4EE5 CD 05 5F      [17]  719 	call	_cpct_getScreenPtr
   4EE8 4D            [ 4]  720 	ld	c,l
   4EE9 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4EEA 21 02 00      [10]  723 	ld	hl,#0x0002
   4EED E5            [11]  724 	push	hl
   4EEE C5            [11]  725 	push	bc
   4EEF 21 51 4F      [10]  726 	ld	hl,#___str_11
   4EF2 E5            [11]  727 	push	hl
   4EF3 CD 1E 53      [17]  728 	call	_cpct_drawStringM0
   4EF6 21 06 00      [10]  729 	ld	hl,#6
   4EF9 39            [11]  730 	add	hl,sp
   4EFA F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4EFB                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4EFB CD 85 52      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4EFE 21 04 08      [10]  737 	ld	hl,#0x0804
   4F01 CD 06 53      [17]  738 	call	_cpct_isKeyPressed
   4F04 7D            [ 4]  739 	ld	a,l
   4F05 B7            [ 4]  740 	or	a, a
   4F06 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   4F08 CD A0 4C      [17]  743 	call	_menuInstrucciones
   4F0B 18 0D         [12]  744 	jr	00109$
   4F0D                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   4F0D 21 07 40      [10]  747 	ld	hl,#0x4007
   4F10 CD 06 53      [17]  748 	call	_cpct_isKeyPressed
   4F13 7D            [ 4]  749 	ld	a,l
   4F14 B7            [ 4]  750 	or	a, a
   4F15 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   4F17 CD B7 4D      [17]  753 	call	_menuCreditos
   4F1A                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4F1A 21 07 10      [10]  756 	ld	hl,#0x1007
   4F1D CD 06 53      [17]  757 	call	_cpct_isKeyPressed
   4F20 7D            [ 4]  758 	ld	a,l
   4F21 B7            [ 4]  759 	or	a, a
   4F22 C0            [11]  760 	ret	NZ
   4F23 21 04 08      [10]  761 	ld	hl,#0x0804
   4F26 CD 06 53      [17]  762 	call	_cpct_isKeyPressed
   4F29 7D            [ 4]  763 	ld	a,l
   4F2A B7            [ 4]  764 	or	a, a
   4F2B C0            [11]  765 	ret	NZ
   4F2C 21 07 40      [10]  766 	ld	hl,#0x4007
   4F2F CD 06 53      [17]  767 	call	_cpct_isKeyPressed
   4F32 7D            [ 4]  768 	ld	a,l
   4F33 B7            [ 4]  769 	or	a, a
   4F34 28 C5         [12]  770 	jr	Z,00108$
   4F36 C9            [10]  771 	ret
   4F37                     772 ___str_9:
   4F37 4D 45 4E 55         773 	.ascii "MENU"
   4F3B 00                  774 	.db 0x00
   4F3C                     775 ___str_10:
   4F3C 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4F50 00                  777 	.db 0x00
   4F51                     778 ___str_11:
   4F51 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4F60 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   4F61                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   4F61 21 00 40      [10]  787 	ld	hl,#0x4000
   4F64 E5            [11]  788 	push	hl
   4F65 AF            [ 4]  789 	xor	a, a
   4F66 F5            [11]  790 	push	af
   4F67 33            [ 6]  791 	inc	sp
   4F68 26 C0         [ 7]  792 	ld	h, #0xC0
   4F6A E5            [11]  793 	push	hl
   4F6B CD CD 55      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4F6E 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   4F71 E5            [11]  797 	push	hl
   4F72 21 00 C0      [10]  798 	ld	hl,#0xC000
   4F75 E5            [11]  799 	push	hl
   4F76 CD 05 5F      [17]  800 	call	_cpct_getScreenPtr
   4F79 4D            [ 4]  801 	ld	c,l
   4F7A 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4F7B 21 04 00      [10]  804 	ld	hl,#0x0004
   4F7E E5            [11]  805 	push	hl
   4F7F C5            [11]  806 	push	bc
   4F80 21 17 50      [10]  807 	ld	hl,#___str_12
   4F83 E5            [11]  808 	push	hl
   4F84 CD 1E 53      [17]  809 	call	_cpct_drawStringM0
   4F87 21 06 00      [10]  810 	ld	hl,#6
   4F8A 39            [11]  811 	add	hl,sp
   4F8B F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F8C 21 28 6E      [10]  814 	ld	hl,#0x6E28
   4F8F E5            [11]  815 	push	hl
   4F90 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   4F93 E5            [11]  817 	push	hl
   4F94 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   4F97 E5            [11]  819 	push	hl
   4F98 CD 42 53      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4F9B 21 28 6E      [10]  822 	ld	hl,#0x6E28
   4F9E E5            [11]  823 	push	hl
   4F9F 21 18 F1      [10]  824 	ld	hl,#0xF118
   4FA2 E5            [11]  825 	push	hl
   4FA3 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   4FA6 E5            [11]  827 	push	hl
   4FA7 CD 42 53      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4FAA 21 08 A0      [10]  830 	ld	hl,#0xA008
   4FAD E5            [11]  831 	push	hl
   4FAE 21 00 C0      [10]  832 	ld	hl,#0xC000
   4FB1 E5            [11]  833 	push	hl
   4FB2 CD 05 5F      [17]  834 	call	_cpct_getScreenPtr
   4FB5 4D            [ 4]  835 	ld	c,l
   4FB6 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4FB7 21 02 00      [10]  838 	ld	hl,#0x0002
   4FBA E5            [11]  839 	push	hl
   4FBB C5            [11]  840 	push	bc
   4FBC 21 1F 50      [10]  841 	ld	hl,#___str_13
   4FBF E5            [11]  842 	push	hl
   4FC0 CD 1E 53      [17]  843 	call	_cpct_drawStringM0
   4FC3 21 06 00      [10]  844 	ld	hl,#6
   4FC6 39            [11]  845 	add	hl,sp
   4FC7 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4FC8 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   4FCB E5            [11]  849 	push	hl
   4FCC 21 00 C0      [10]  850 	ld	hl,#0xC000
   4FCF E5            [11]  851 	push	hl
   4FD0 CD 05 5F      [17]  852 	call	_cpct_getScreenPtr
   4FD3 4D            [ 4]  853 	ld	c,l
   4FD4 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4FD5 21 02 00      [10]  856 	ld	hl,#0x0002
   4FD8 E5            [11]  857 	push	hl
   4FD9 C5            [11]  858 	push	bc
   4FDA 21 30 50      [10]  859 	ld	hl,#___str_14
   4FDD E5            [11]  860 	push	hl
   4FDE CD 1E 53      [17]  861 	call	_cpct_drawStringM0
   4FE1 21 06 00      [10]  862 	ld	hl,#6
   4FE4 39            [11]  863 	add	hl,sp
   4FE5 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   4FE6                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   4FE6 CD 85 52      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   4FE9 21 04 40      [10]  870 	ld	hl,#0x4004
   4FEC CD 06 53      [17]  871 	call	_cpct_isKeyPressed
   4FEF 7D            [ 4]  872 	ld	a,l
   4FF0 B7            [ 4]  873 	or	a, a
   4FF1 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   4FF3 CD 85 52      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   4FF6                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   4FF6 CD 96 4E      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   4FF9 21 07 10      [10]  882 	ld	hl,#0x1007
   4FFC CD 06 53      [17]  883 	call	_cpct_isKeyPressed
   4FFF 7D            [ 4]  884 	ld	a,l
   5000 B7            [ 4]  885 	or	a, a
   5001 28 F3         [12]  886 	jr	Z,00101$
   5003                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5003 21 07 10      [10]  889 	ld	hl,#0x1007
   5006 CD 06 53      [17]  890 	call	_cpct_isKeyPressed
   5009 7D            [ 4]  891 	ld	a,l
   500A B7            [ 4]  892 	or	a, a
   500B C0            [11]  893 	ret	NZ
   500C 21 04 40      [10]  894 	ld	hl,#0x4004
   500F CD 06 53      [17]  895 	call	_cpct_isKeyPressed
   5012 7D            [ 4]  896 	ld	a,l
   5013 B7            [ 4]  897 	or	a, a
   5014 28 D0         [12]  898 	jr	Z,00107$
   5016 C9            [10]  899 	ret
   5017                     900 ___str_12:
   5017 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   501E 00                  902 	.db 0x00
   501F                     903 ___str_13:
   501F 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   502F 00                  905 	.db 0x00
   5030                     906 ___str_14:
   5030 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   503F 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
