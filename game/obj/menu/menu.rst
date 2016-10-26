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
   4BF5                      60 _menuFin::
   4BF5 DD E5         [15]   61 	push	ix
   4BF7 DD 21 00 00   [14]   62 	ld	ix,#0
   4BFB DD 39         [15]   63 	add	ix,sp
   4BFD F5            [11]   64 	push	af
   4BFE F5            [11]   65 	push	af
   4BFF DD 75 FE      [19]   66 	ld	-2 (ix),l
   4C02 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4C05 21 10 27      [10]   69 	ld	hl,#0x2710
   4C08 E5            [11]   70 	push	hl
   4C09 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4C0C DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4C0F E5            [11]   73 	push	hl
   4C10 CD BE 53      [17]   74 	call	__divuint
   4C13 F1            [10]   75 	pop	af
   4C14 F1            [10]   76 	pop	af
   4C15 33            [ 6]   77 	inc	sp
   4C16 33            [ 6]   78 	inc	sp
   4C17 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4C18 21 00 40      [10]   81 	ld	hl,#0x4000
   4C1B E5            [11]   82 	push	hl
   4C1C AF            [ 4]   83 	xor	a, a
   4C1D F5            [11]   84 	push	af
   4C1E 33            [ 6]   85 	inc	sp
   4C1F 26 C0         [ 7]   86 	ld	h, #0xC0
   4C21 E5            [11]   87 	push	hl
   4C22 CD 5E 57      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4C25 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4C28 E5            [11]   91 	push	hl
   4C29 21 00 C0      [10]   92 	ld	hl,#0xC000
   4C2C E5            [11]   93 	push	hl
   4C2D CD 7F 60      [17]   94 	call	_cpct_getScreenPtr
   4C30 4D            [ 4]   95 	ld	c,l
   4C31 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4C32 21 02 00      [10]   98 	ld	hl,#0x0002
   4C35 E5            [11]   99 	push	hl
   4C36 C5            [11]  100 	push	bc
   4C37 21 57 4D      [10]  101 	ld	hl,#___str_0
   4C3A E5            [11]  102 	push	hl
   4C3B CD 98 54      [17]  103 	call	_cpct_drawStringM0
   4C3E 21 06 00      [10]  104 	ld	hl,#6
   4C41 39            [11]  105 	add	hl,sp
   4C42 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4C43 21 14 78      [10]  108 	ld	hl,#0x7814
   4C46 E5            [11]  109 	push	hl
   4C47 21 00 C0      [10]  110 	ld	hl,#0xC000
   4C4A E5            [11]  111 	push	hl
   4C4B CD 7F 60      [17]  112 	call	_cpct_getScreenPtr
   4C4E 4D            [ 4]  113 	ld	c,l
   4C4F 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4C50 21 02 00      [10]  116 	ld	hl,#0x0002
   4C53 E5            [11]  117 	push	hl
   4C54 C5            [11]  118 	push	bc
   4C55 21 61 4D      [10]  119 	ld	hl,#___str_1
   4C58 E5            [11]  120 	push	hl
   4C59 CD 98 54      [17]  121 	call	_cpct_drawStringM0
   4C5C 21 06 00      [10]  122 	ld	hl,#6
   4C5F 39            [11]  123 	add	hl,sp
   4C60 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4C61 21 2D 78      [10]  126 	ld	hl,#0x782D
   4C64 E5            [11]  127 	push	hl
   4C65 21 00 C0      [10]  128 	ld	hl,#0xC000
   4C68 E5            [11]  129 	push	hl
   4C69 CD 7F 60      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4C6C E5            [11]  132 	push	hl
   4C6D 21 0A 00      [10]  133 	ld	hl,#0x000A
   4C70 E5            [11]  134 	push	hl
   4C71 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4C74 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4C77 E5            [11]  137 	push	hl
   4C78 CD 8D 56      [17]  138 	call	__moduint
   4C7B F1            [10]  139 	pop	af
   4C7C F1            [10]  140 	pop	af
   4C7D C1            [10]  141 	pop	bc
   4C7E 7D            [ 4]  142 	ld	a,l
   4C7F C6 30         [ 7]  143 	add	a, #0x30
   4C81 67            [ 4]  144 	ld	h,a
   4C82 59            [ 4]  145 	ld	e, c
   4C83 50            [ 4]  146 	ld	d, b
   4C84 C5            [11]  147 	push	bc
   4C85 E5            [11]  148 	push	hl
   4C86 33            [ 6]  149 	inc	sp
   4C87 21 02 00      [10]  150 	ld	hl,#0x0002
   4C8A E5            [11]  151 	push	hl
   4C8B D5            [11]  152 	push	de
   4C8C CD F0 55      [17]  153 	call	_cpct_drawCharM0
   4C8F F1            [10]  154 	pop	af
   4C90 33            [ 6]  155 	inc	sp
   4C91 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4C94 E3            [19]  157 	ex	(sp),hl
   4C95 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4C98 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4C9B E5            [11]  160 	push	hl
   4C9C CD BE 53      [17]  161 	call	__divuint
   4C9F F1            [10]  162 	pop	af
   4CA0 F1            [10]  163 	pop	af
   4CA1 11 0A 00      [10]  164 	ld	de,#0x000A
   4CA4 D5            [11]  165 	push	de
   4CA5 E5            [11]  166 	push	hl
   4CA6 CD 8D 56      [17]  167 	call	__moduint
   4CA9 F1            [10]  168 	pop	af
   4CAA F1            [10]  169 	pop	af
   4CAB C1            [10]  170 	pop	bc
   4CAC 7D            [ 4]  171 	ld	a,l
   4CAD C6 30         [ 7]  172 	add	a, #0x30
   4CAF 67            [ 4]  173 	ld	h,a
   4CB0 79            [ 4]  174 	ld	a,c
   4CB1 C6 04         [ 7]  175 	add	a, #0x04
   4CB3 5F            [ 4]  176 	ld	e,a
   4CB4 78            [ 4]  177 	ld	a,b
   4CB5 CE 00         [ 7]  178 	adc	a, #0x00
   4CB7 57            [ 4]  179 	ld	d,a
   4CB8 C5            [11]  180 	push	bc
   4CB9 E5            [11]  181 	push	hl
   4CBA 33            [ 6]  182 	inc	sp
   4CBB 21 02 00      [10]  183 	ld	hl,#0x0002
   4CBE E5            [11]  184 	push	hl
   4CBF D5            [11]  185 	push	de
   4CC0 CD F0 55      [17]  186 	call	_cpct_drawCharM0
   4CC3 F1            [10]  187 	pop	af
   4CC4 33            [ 6]  188 	inc	sp
   4CC5 21 64 00      [10]  189 	ld	hl,#0x0064
   4CC8 E3            [19]  190 	ex	(sp),hl
   4CC9 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4CCC DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4CCF E5            [11]  193 	push	hl
   4CD0 CD BE 53      [17]  194 	call	__divuint
   4CD3 F1            [10]  195 	pop	af
   4CD4 F1            [10]  196 	pop	af
   4CD5 11 0A 00      [10]  197 	ld	de,#0x000A
   4CD8 D5            [11]  198 	push	de
   4CD9 E5            [11]  199 	push	hl
   4CDA CD 8D 56      [17]  200 	call	__moduint
   4CDD F1            [10]  201 	pop	af
   4CDE F1            [10]  202 	pop	af
   4CDF C1            [10]  203 	pop	bc
   4CE0 7D            [ 4]  204 	ld	a,l
   4CE1 C6 30         [ 7]  205 	add	a, #0x30
   4CE3 67            [ 4]  206 	ld	h,a
   4CE4 79            [ 4]  207 	ld	a,c
   4CE5 C6 08         [ 7]  208 	add	a, #0x08
   4CE7 5F            [ 4]  209 	ld	e,a
   4CE8 78            [ 4]  210 	ld	a,b
   4CE9 CE 00         [ 7]  211 	adc	a, #0x00
   4CEB 57            [ 4]  212 	ld	d,a
   4CEC C5            [11]  213 	push	bc
   4CED E5            [11]  214 	push	hl
   4CEE 33            [ 6]  215 	inc	sp
   4CEF 21 02 00      [10]  216 	ld	hl,#0x0002
   4CF2 E5            [11]  217 	push	hl
   4CF3 D5            [11]  218 	push	de
   4CF4 CD F0 55      [17]  219 	call	_cpct_drawCharM0
   4CF7 F1            [10]  220 	pop	af
   4CF8 33            [ 6]  221 	inc	sp
   4CF9 21 0A 00      [10]  222 	ld	hl,#0x000A
   4CFC E3            [19]  223 	ex	(sp),hl
   4CFD DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4D00 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4D03 E5            [11]  226 	push	hl
   4D04 CD BE 53      [17]  227 	call	__divuint
   4D07 F1            [10]  228 	pop	af
   4D08 F1            [10]  229 	pop	af
   4D09 11 0A 00      [10]  230 	ld	de,#0x000A
   4D0C D5            [11]  231 	push	de
   4D0D E5            [11]  232 	push	hl
   4D0E CD 8D 56      [17]  233 	call	__moduint
   4D11 F1            [10]  234 	pop	af
   4D12 F1            [10]  235 	pop	af
   4D13 C1            [10]  236 	pop	bc
   4D14 7D            [ 4]  237 	ld	a,l
   4D15 C6 30         [ 7]  238 	add	a, #0x30
   4D17 67            [ 4]  239 	ld	h,a
   4D18 79            [ 4]  240 	ld	a,c
   4D19 C6 0C         [ 7]  241 	add	a, #0x0C
   4D1B 5F            [ 4]  242 	ld	e,a
   4D1C 78            [ 4]  243 	ld	a,b
   4D1D CE 00         [ 7]  244 	adc	a, #0x00
   4D1F 57            [ 4]  245 	ld	d,a
   4D20 C5            [11]  246 	push	bc
   4D21 E5            [11]  247 	push	hl
   4D22 33            [ 6]  248 	inc	sp
   4D23 21 02 00      [10]  249 	ld	hl,#0x0002
   4D26 E5            [11]  250 	push	hl
   4D27 D5            [11]  251 	push	de
   4D28 CD F0 55      [17]  252 	call	_cpct_drawCharM0
   4D2B F1            [10]  253 	pop	af
   4D2C 33            [ 6]  254 	inc	sp
   4D2D 21 0A 00      [10]  255 	ld	hl,#0x000A
   4D30 E3            [19]  256 	ex	(sp),hl
   4D31 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4D34 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4D37 E5            [11]  259 	push	hl
   4D38 CD 8D 56      [17]  260 	call	__moduint
   4D3B F1            [10]  261 	pop	af
   4D3C F1            [10]  262 	pop	af
   4D3D C1            [10]  263 	pop	bc
   4D3E 7D            [ 4]  264 	ld	a,l
   4D3F C6 30         [ 7]  265 	add	a, #0x30
   4D41 57            [ 4]  266 	ld	d,a
   4D42 21 10 00      [10]  267 	ld	hl,#0x0010
   4D45 09            [11]  268 	add	hl,bc
   4D46 4D            [ 4]  269 	ld	c,l
   4D47 44            [ 4]  270 	ld	b,h
   4D48 D5            [11]  271 	push	de
   4D49 33            [ 6]  272 	inc	sp
   4D4A 21 02 00      [10]  273 	ld	hl,#0x0002
   4D4D E5            [11]  274 	push	hl
   4D4E C5            [11]  275 	push	bc
   4D4F CD F0 55      [17]  276 	call	_cpct_drawCharM0
   4D52 F1            [10]  277 	pop	af
   4D53 F1            [10]  278 	pop	af
   4D54 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4D55                     281 00102$:
   4D55 18 FE         [12]  282 	jr	00102$
   4D57                     283 ___str_0:
   4D57 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4D60 00                  285 	.db 0x00
   4D61                     286 ___str_1:
   4D61 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4D68 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4D69                     293 _borrarPantalla::
   4D69 DD E5         [15]  294 	push	ix
   4D6B DD 21 00 00   [14]  295 	ld	ix,#0
   4D6F DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4D71 3E 28         [ 7]  298 	ld	a,#0x28
   4D73 DD 96 06      [19]  299 	sub	a, 6 (ix)
   4D76 3E 00         [ 7]  300 	ld	a,#0x00
   4D78 17            [ 4]  301 	rla
   4D79 4F            [ 4]  302 	ld	c,a
   4D7A CB 41         [ 8]  303 	bit	0,c
   4D7C 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4D7E DD 66 05      [19]  306 	ld	h,5 (ix)
   4D81 DD 6E 04      [19]  307 	ld	l,4 (ix)
   4D84 E5            [11]  308 	push	hl
   4D85 21 00 C0      [10]  309 	ld	hl,#0xC000
   4D88 E5            [11]  310 	push	hl
   4D89 CD 7F 60      [17]  311 	call	_cpct_getScreenPtr
   4D8C 4D            [ 4]  312 	ld	c,l
   4D8D 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4D8E DD 66 07      [19]  315 	ld	h,7 (ix)
   4D91 DD 6E 06      [19]  316 	ld	l,6 (ix)
   4D94 E5            [11]  317 	push	hl
   4D95 AF            [ 4]  318 	xor	a, a
   4D96 F5            [11]  319 	push	af
   4D97 33            [ 6]  320 	inc	sp
   4D98 C5            [11]  321 	push	bc
   4D99 CD A5 5F      [17]  322 	call	_cpct_drawSolidBox
   4D9C F1            [10]  323 	pop	af
   4D9D F1            [10]  324 	pop	af
   4D9E 33            [ 6]  325 	inc	sp
   4D9F 18 51         [12]  326 	jr	00106$
   4DA1                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4DA1 CB 41         [ 8]  329 	bit	0,c
   4DA3 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4DA5 DD 66 05      [19]  332 	ld	h,5 (ix)
   4DA8 DD 6E 04      [19]  333 	ld	l,4 (ix)
   4DAB E5            [11]  334 	push	hl
   4DAC 21 00 C0      [10]  335 	ld	hl,#0xC000
   4DAF E5            [11]  336 	push	hl
   4DB0 CD 7F 60      [17]  337 	call	_cpct_getScreenPtr
   4DB3 4D            [ 4]  338 	ld	c,l
   4DB4 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4DB5 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4DB8 F5            [11]  342 	push	af
   4DB9 33            [ 6]  343 	inc	sp
   4DBA 21 00 28      [10]  344 	ld	hl,#0x2800
   4DBD E5            [11]  345 	push	hl
   4DBE C5            [11]  346 	push	bc
   4DBF CD A5 5F      [17]  347 	call	_cpct_drawSolidBox
   4DC2 F1            [10]  348 	pop	af
   4DC3 F1            [10]  349 	pop	af
   4DC4 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4DC5 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4DC8 C6 28         [ 7]  353 	add	a, #0x28
   4DCA 47            [ 4]  354 	ld	b,a
   4DCB DD 7E 05      [19]  355 	ld	a,5 (ix)
   4DCE F5            [11]  356 	push	af
   4DCF 33            [ 6]  357 	inc	sp
   4DD0 C5            [11]  358 	push	bc
   4DD1 33            [ 6]  359 	inc	sp
   4DD2 21 00 C0      [10]  360 	ld	hl,#0xC000
   4DD5 E5            [11]  361 	push	hl
   4DD6 CD 7F 60      [17]  362 	call	_cpct_getScreenPtr
   4DD9 4D            [ 4]  363 	ld	c,l
   4DDA 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4DDB DD 7E 06      [19]  366 	ld	a,6 (ix)
   4DDE C6 D8         [ 7]  367 	add	a,#0xD8
   4DE0 57            [ 4]  368 	ld	d,a
   4DE1 DD 7E 07      [19]  369 	ld	a,7 (ix)
   4DE4 F5            [11]  370 	push	af
   4DE5 33            [ 6]  371 	inc	sp
   4DE6 D5            [11]  372 	push	de
   4DE7 33            [ 6]  373 	inc	sp
   4DE8 AF            [ 4]  374 	xor	a, a
   4DE9 F5            [11]  375 	push	af
   4DEA 33            [ 6]  376 	inc	sp
   4DEB C5            [11]  377 	push	bc
   4DEC CD A5 5F      [17]  378 	call	_cpct_drawSolidBox
   4DEF F1            [10]  379 	pop	af
   4DF0 F1            [10]  380 	pop	af
   4DF1 33            [ 6]  381 	inc	sp
   4DF2                     382 00106$:
   4DF2 DD E1         [14]  383 	pop	ix
   4DF4 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4DF5                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4DF5 21 50 82      [10]  391 	ld	hl,#0x8250
   4DF8 E5            [11]  392 	push	hl
   4DF9 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4DFC E5            [11]  394 	push	hl
   4DFD CD 69 4D      [17]  395 	call	_borrarPantalla
   4E00 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4E01 21 10 55      [10]  398 	ld	hl, #0x5510
   4E04 E3            [19]  399 	ex	(sp),hl
   4E05 21 00 C0      [10]  400 	ld	hl,#0xC000
   4E08 E5            [11]  401 	push	hl
   4E09 CD 7F 60      [17]  402 	call	_cpct_getScreenPtr
   4E0C 4D            [ 4]  403 	ld	c,l
   4E0D 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4E0E 21 02 00      [10]  406 	ld	hl,#0x0002
   4E11 E5            [11]  407 	push	hl
   4E12 C5            [11]  408 	push	bc
   4E13 21 E3 4E      [10]  409 	ld	hl,#___str_2
   4E16 E5            [11]  410 	push	hl
   4E17 CD 98 54      [17]  411 	call	_cpct_drawStringM0
   4E1A 21 06 00      [10]  412 	ld	hl,#6
   4E1D 39            [11]  413 	add	hl,sp
   4E1E F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4E1F 21 04 73      [10]  416 	ld	hl,#0x7304
   4E22 E5            [11]  417 	push	hl
   4E23 21 00 C0      [10]  418 	ld	hl,#0xC000
   4E26 E5            [11]  419 	push	hl
   4E27 CD 7F 60      [17]  420 	call	_cpct_getScreenPtr
   4E2A 4D            [ 4]  421 	ld	c,l
   4E2B 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E2C 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4E2F E5            [11]  425 	push	hl
   4E30 C5            [11]  426 	push	bc
   4E31 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4E34 E5            [11]  428 	push	hl
   4E35 CD BC 54      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4E38 21 0E 73      [10]  431 	ld	hl,#0x730E
   4E3B E5            [11]  432 	push	hl
   4E3C 21 00 C0      [10]  433 	ld	hl,#0xC000
   4E3F E5            [11]  434 	push	hl
   4E40 CD 7F 60      [17]  435 	call	_cpct_getScreenPtr
   4E43 4D            [ 4]  436 	ld	c,l
   4E44 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E45 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4E48 E5            [11]  440 	push	hl
   4E49 C5            [11]  441 	push	bc
   4E4A 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4E4D E5            [11]  443 	push	hl
   4E4E CD BC 54      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4E51 21 18 73      [10]  446 	ld	hl,#0x7318
   4E54 E5            [11]  447 	push	hl
   4E55 21 00 C0      [10]  448 	ld	hl,#0xC000
   4E58 E5            [11]  449 	push	hl
   4E59 CD 7F 60      [17]  450 	call	_cpct_getScreenPtr
   4E5C 4D            [ 4]  451 	ld	c,l
   4E5D 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E5E 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4E61 E5            [11]  455 	push	hl
   4E62 C5            [11]  456 	push	bc
   4E63 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4E66 E5            [11]  458 	push	hl
   4E67 CD BC 54      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4E6A 21 22 73      [10]  461 	ld	hl,#0x7322
   4E6D E5            [11]  462 	push	hl
   4E6E 21 00 C0      [10]  463 	ld	hl,#0xC000
   4E71 E5            [11]  464 	push	hl
   4E72 CD 7F 60      [17]  465 	call	_cpct_getScreenPtr
   4E75 4D            [ 4]  466 	ld	c,l
   4E76 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E77 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4E7A E5            [11]  470 	push	hl
   4E7B C5            [11]  471 	push	bc
   4E7C 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4E7F E5            [11]  473 	push	hl
   4E80 CD BC 54      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4E83 21 2D 73      [10]  476 	ld	hl,#0x732D
   4E86 E5            [11]  477 	push	hl
   4E87 21 00 C0      [10]  478 	ld	hl,#0xC000
   4E8A E5            [11]  479 	push	hl
   4E8B CD 7F 60      [17]  480 	call	_cpct_getScreenPtr
   4E8E 4D            [ 4]  481 	ld	c,l
   4E8F 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4E90 21 02 00      [10]  484 	ld	hl,#0x0002
   4E93 E5            [11]  485 	push	hl
   4E94 C5            [11]  486 	push	bc
   4E95 21 F0 4E      [10]  487 	ld	hl,#___str_3
   4E98 E5            [11]  488 	push	hl
   4E99 CD 98 54      [17]  489 	call	_cpct_drawStringM0
   4E9C 21 06 00      [10]  490 	ld	hl,#6
   4E9F 39            [11]  491 	add	hl,sp
   4EA0 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4EA1 21 04 82      [10]  494 	ld	hl,#0x8204
   4EA4 E5            [11]  495 	push	hl
   4EA5 21 00 C0      [10]  496 	ld	hl,#0xC000
   4EA8 E5            [11]  497 	push	hl
   4EA9 CD 7F 60      [17]  498 	call	_cpct_getScreenPtr
   4EAC 4D            [ 4]  499 	ld	c,l
   4EAD 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4EAE 21 02 00      [10]  502 	ld	hl,#0x0002
   4EB1 E5            [11]  503 	push	hl
   4EB2 C5            [11]  504 	push	bc
   4EB3 21 F9 4E      [10]  505 	ld	hl,#___str_4
   4EB6 E5            [11]  506 	push	hl
   4EB7 CD 98 54      [17]  507 	call	_cpct_drawStringM0
   4EBA 21 06 00      [10]  508 	ld	hl,#6
   4EBD 39            [11]  509 	add	hl,sp
   4EBE F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4EBF                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4EBF CD FF 53      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4EC2 21 04 40      [10]  516 	ld	hl,#0x4004
   4EC5 CD 80 54      [17]  517 	call	_cpct_isKeyPressed
   4EC8 7D            [ 4]  518 	ld	a,l
   4EC9 B7            [ 4]  519 	or	a, a
   4ECA 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4ECC CD EB 4F      [17]  522 	call	_menuOpciones
   4ECF                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4ECF 21 07 10      [10]  525 	ld	hl,#0x1007
   4ED2 CD 80 54      [17]  526 	call	_cpct_isKeyPressed
   4ED5 7D            [ 4]  527 	ld	a,l
   4ED6 B7            [ 4]  528 	or	a, a
   4ED7 C0            [11]  529 	ret	NZ
   4ED8 21 04 40      [10]  530 	ld	hl,#0x4004
   4EDB CD 80 54      [17]  531 	call	_cpct_isKeyPressed
   4EDE 7D            [ 4]  532 	ld	a,l
   4EDF B7            [ 4]  533 	or	a, a
   4EE0 28 DD         [12]  534 	jr	Z,00104$
   4EE2 C9            [10]  535 	ret
   4EE3                     536 ___str_2:
   4EE3 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4EEF 00                  538 	.db 0x00
   4EF0                     539 ___str_3:
   4EF0 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4EF8 00                  541 	.db 0x00
   4EF9                     542 ___str_4:
   4EF9 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4F0B 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4F0C                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4F0C 21 50 82      [10]  551 	ld	hl,#0x8250
   4F0F E5            [11]  552 	push	hl
   4F10 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4F13 E5            [11]  554 	push	hl
   4F14 CD 69 4D      [17]  555 	call	_borrarPantalla
   4F17 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4F18 21 1A 46      [10]  558 	ld	hl, #0x461A
   4F1B E3            [19]  559 	ex	(sp),hl
   4F1C 21 00 C0      [10]  560 	ld	hl,#0xC000
   4F1F E5            [11]  561 	push	hl
   4F20 CD 7F 60      [17]  562 	call	_cpct_getScreenPtr
   4F23 4D            [ 4]  563 	ld	c,l
   4F24 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4F25 21 02 00      [10]  566 	ld	hl,#0x0002
   4F28 E5            [11]  567 	push	hl
   4F29 C5            [11]  568 	push	bc
   4F2A 21 B4 4F      [10]  569 	ld	hl,#___str_5
   4F2D E5            [11]  570 	push	hl
   4F2E CD 98 54      [17]  571 	call	_cpct_drawStringM0
   4F31 21 06 00      [10]  572 	ld	hl,#6
   4F34 39            [11]  573 	add	hl,sp
   4F35 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4F36 21 0A 64      [10]  576 	ld	hl,#0x640A
   4F39 E5            [11]  577 	push	hl
   4F3A 21 00 C0      [10]  578 	ld	hl,#0xC000
   4F3D E5            [11]  579 	push	hl
   4F3E CD 7F 60      [17]  580 	call	_cpct_getScreenPtr
   4F41 4D            [ 4]  581 	ld	c,l
   4F42 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4F43 21 02 00      [10]  584 	ld	hl,#0x0002
   4F46 E5            [11]  585 	push	hl
   4F47 C5            [11]  586 	push	bc
   4F48 21 BC 4F      [10]  587 	ld	hl,#___str_6
   4F4B E5            [11]  588 	push	hl
   4F4C CD 98 54      [17]  589 	call	_cpct_drawStringM0
   4F4F 21 06 00      [10]  590 	ld	hl,#6
   4F52 39            [11]  591 	add	hl,sp
   4F53 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4F54 21 0E 73      [10]  594 	ld	hl,#0x730E
   4F57 E5            [11]  595 	push	hl
   4F58 21 00 C0      [10]  596 	ld	hl,#0xC000
   4F5B E5            [11]  597 	push	hl
   4F5C CD 7F 60      [17]  598 	call	_cpct_getScreenPtr
   4F5F 4D            [ 4]  599 	ld	c,l
   4F60 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4F61 21 02 00      [10]  602 	ld	hl,#0x0002
   4F64 E5            [11]  603 	push	hl
   4F65 C5            [11]  604 	push	bc
   4F66 21 CC 4F      [10]  605 	ld	hl,#___str_7
   4F69 E5            [11]  606 	push	hl
   4F6A CD 98 54      [17]  607 	call	_cpct_drawStringM0
   4F6D 21 06 00      [10]  608 	ld	hl,#6
   4F70 39            [11]  609 	add	hl,sp
   4F71 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4F72 21 08 82      [10]  612 	ld	hl,#0x8208
   4F75 E5            [11]  613 	push	hl
   4F76 21 00 C0      [10]  614 	ld	hl,#0xC000
   4F79 E5            [11]  615 	push	hl
   4F7A CD 7F 60      [17]  616 	call	_cpct_getScreenPtr
   4F7D 4D            [ 4]  617 	ld	c,l
   4F7E 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4F7F 21 02 00      [10]  620 	ld	hl,#0x0002
   4F82 E5            [11]  621 	push	hl
   4F83 C5            [11]  622 	push	bc
   4F84 21 DA 4F      [10]  623 	ld	hl,#___str_8
   4F87 E5            [11]  624 	push	hl
   4F88 CD 98 54      [17]  625 	call	_cpct_drawStringM0
   4F8B 21 06 00      [10]  626 	ld	hl,#6
   4F8E 39            [11]  627 	add	hl,sp
   4F8F F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4F90                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4F90 CD FF 53      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4F93 21 04 40      [10]  634 	ld	hl,#0x4004
   4F96 CD 80 54      [17]  635 	call	_cpct_isKeyPressed
   4F99 7D            [ 4]  636 	ld	a,l
   4F9A B7            [ 4]  637 	or	a, a
   4F9B 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4F9D CD EB 4F      [17]  640 	call	_menuOpciones
   4FA0                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4FA0 21 07 10      [10]  643 	ld	hl,#0x1007
   4FA3 CD 80 54      [17]  644 	call	_cpct_isKeyPressed
   4FA6 7D            [ 4]  645 	ld	a,l
   4FA7 B7            [ 4]  646 	or	a, a
   4FA8 C0            [11]  647 	ret	NZ
   4FA9 21 04 40      [10]  648 	ld	hl,#0x4004
   4FAC CD 80 54      [17]  649 	call	_cpct_isKeyPressed
   4FAF 7D            [ 4]  650 	ld	a,l
   4FB0 B7            [ 4]  651 	or	a, a
   4FB1 28 DD         [12]  652 	jr	Z,00104$
   4FB3 C9            [10]  653 	ret
   4FB4                     654 ___str_5:
   4FB4 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4FBB 00                  656 	.db 0x00
   4FBC                     657 ___str_6:
   4FBC 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4FCB 00                  659 	.db 0x00
   4FCC                     660 ___str_7:
   4FCC 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4FD9 00                  662 	.db 0x00
   4FDA                     663 ___str_8:
   4FDA 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4FEA 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4FEB                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4FEB 21 50 82      [10]  672 	ld	hl,#0x8250
   4FEE E5            [11]  673 	push	hl
   4FEF 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4FF2 E5            [11]  675 	push	hl
   4FF3 CD 69 4D      [17]  676 	call	_borrarPantalla
   4FF6 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4FF7 21 20 64      [10]  679 	ld	hl, #0x6420
   4FFA E3            [19]  680 	ex	(sp),hl
   4FFB 21 00 C0      [10]  681 	ld	hl,#0xC000
   4FFE E5            [11]  682 	push	hl
   4FFF CD 7F 60      [17]  683 	call	_cpct_getScreenPtr
   5002 4D            [ 4]  684 	ld	c,l
   5003 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   5004 21 02 00      [10]  687 	ld	hl,#0x0002
   5007 E5            [11]  688 	push	hl
   5008 C5            [11]  689 	push	bc
   5009 21 8C 50      [10]  690 	ld	hl,#___str_9
   500C E5            [11]  691 	push	hl
   500D CD 98 54      [17]  692 	call	_cpct_drawStringM0
   5010 21 06 00      [10]  693 	ld	hl,#6
   5013 39            [11]  694 	add	hl,sp
   5014 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   5015 21 00 82      [10]  697 	ld	hl,#0x8200
   5018 E5            [11]  698 	push	hl
   5019 26 C0         [ 7]  699 	ld	h, #0xC0
   501B E5            [11]  700 	push	hl
   501C CD 7F 60      [17]  701 	call	_cpct_getScreenPtr
   501F 4D            [ 4]  702 	ld	c,l
   5020 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   5021 21 02 00      [10]  705 	ld	hl,#0x0002
   5024 E5            [11]  706 	push	hl
   5025 C5            [11]  707 	push	bc
   5026 21 91 50      [10]  708 	ld	hl,#___str_10
   5029 E5            [11]  709 	push	hl
   502A CD 98 54      [17]  710 	call	_cpct_drawStringM0
   502D 21 06 00      [10]  711 	ld	hl,#6
   5030 39            [11]  712 	add	hl,sp
   5031 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   5032 21 0A 91      [10]  715 	ld	hl,#0x910A
   5035 E5            [11]  716 	push	hl
   5036 21 00 C0      [10]  717 	ld	hl,#0xC000
   5039 E5            [11]  718 	push	hl
   503A CD 7F 60      [17]  719 	call	_cpct_getScreenPtr
   503D 4D            [ 4]  720 	ld	c,l
   503E 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   503F 21 02 00      [10]  723 	ld	hl,#0x0002
   5042 E5            [11]  724 	push	hl
   5043 C5            [11]  725 	push	bc
   5044 21 A6 50      [10]  726 	ld	hl,#___str_11
   5047 E5            [11]  727 	push	hl
   5048 CD 98 54      [17]  728 	call	_cpct_drawStringM0
   504B 21 06 00      [10]  729 	ld	hl,#6
   504E 39            [11]  730 	add	hl,sp
   504F F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   5050                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   5050 CD FF 53      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   5053 21 04 08      [10]  737 	ld	hl,#0x0804
   5056 CD 80 54      [17]  738 	call	_cpct_isKeyPressed
   5059 7D            [ 4]  739 	ld	a,l
   505A B7            [ 4]  740 	or	a, a
   505B 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   505D CD F5 4D      [17]  743 	call	_menuInstrucciones
   5060 18 0D         [12]  744 	jr	00109$
   5062                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   5062 21 07 40      [10]  747 	ld	hl,#0x4007
   5065 CD 80 54      [17]  748 	call	_cpct_isKeyPressed
   5068 7D            [ 4]  749 	ld	a,l
   5069 B7            [ 4]  750 	or	a, a
   506A 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   506C CD 0C 4F      [17]  753 	call	_menuCreditos
   506F                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   506F 21 07 10      [10]  756 	ld	hl,#0x1007
   5072 CD 80 54      [17]  757 	call	_cpct_isKeyPressed
   5075 7D            [ 4]  758 	ld	a,l
   5076 B7            [ 4]  759 	or	a, a
   5077 C0            [11]  760 	ret	NZ
   5078 21 04 08      [10]  761 	ld	hl,#0x0804
   507B CD 80 54      [17]  762 	call	_cpct_isKeyPressed
   507E 7D            [ 4]  763 	ld	a,l
   507F B7            [ 4]  764 	or	a, a
   5080 C0            [11]  765 	ret	NZ
   5081 21 07 40      [10]  766 	ld	hl,#0x4007
   5084 CD 80 54      [17]  767 	call	_cpct_isKeyPressed
   5087 7D            [ 4]  768 	ld	a,l
   5088 B7            [ 4]  769 	or	a, a
   5089 28 C5         [12]  770 	jr	Z,00108$
   508B C9            [10]  771 	ret
   508C                     772 ___str_9:
   508C 4D 45 4E 55         773 	.ascii "MENU"
   5090 00                  774 	.db 0x00
   5091                     775 ___str_10:
   5091 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   50A5 00                  777 	.db 0x00
   50A6                     778 ___str_11:
   50A6 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   50B5 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   50B6                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   50B6 21 00 40      [10]  787 	ld	hl,#0x4000
   50B9 E5            [11]  788 	push	hl
   50BA AF            [ 4]  789 	xor	a, a
   50BB F5            [11]  790 	push	af
   50BC 33            [ 6]  791 	inc	sp
   50BD 26 C0         [ 7]  792 	ld	h, #0xC0
   50BF E5            [11]  793 	push	hl
   50C0 CD 5E 57      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   50C3 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   50C6 E5            [11]  797 	push	hl
   50C7 21 00 C0      [10]  798 	ld	hl,#0xC000
   50CA E5            [11]  799 	push	hl
   50CB CD 7F 60      [17]  800 	call	_cpct_getScreenPtr
   50CE 4D            [ 4]  801 	ld	c,l
   50CF 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   50D0 21 04 00      [10]  804 	ld	hl,#0x0004
   50D3 E5            [11]  805 	push	hl
   50D4 C5            [11]  806 	push	bc
   50D5 21 6C 51      [10]  807 	ld	hl,#___str_12
   50D8 E5            [11]  808 	push	hl
   50D9 CD 98 54      [17]  809 	call	_cpct_drawStringM0
   50DC 21 06 00      [10]  810 	ld	hl,#6
   50DF 39            [11]  811 	add	hl,sp
   50E0 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   50E1 21 28 6E      [10]  814 	ld	hl,#0x6E28
   50E4 E5            [11]  815 	push	hl
   50E5 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   50E8 E5            [11]  817 	push	hl
   50E9 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   50EC E5            [11]  819 	push	hl
   50ED CD BC 54      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   50F0 21 28 6E      [10]  822 	ld	hl,#0x6E28
   50F3 E5            [11]  823 	push	hl
   50F4 21 18 F1      [10]  824 	ld	hl,#0xF118
   50F7 E5            [11]  825 	push	hl
   50F8 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   50FB E5            [11]  827 	push	hl
   50FC CD BC 54      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   50FF 21 08 A0      [10]  830 	ld	hl,#0xA008
   5102 E5            [11]  831 	push	hl
   5103 21 00 C0      [10]  832 	ld	hl,#0xC000
   5106 E5            [11]  833 	push	hl
   5107 CD 7F 60      [17]  834 	call	_cpct_getScreenPtr
   510A 4D            [ 4]  835 	ld	c,l
   510B 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   510C 21 02 00      [10]  838 	ld	hl,#0x0002
   510F E5            [11]  839 	push	hl
   5110 C5            [11]  840 	push	bc
   5111 21 74 51      [10]  841 	ld	hl,#___str_13
   5114 E5            [11]  842 	push	hl
   5115 CD 98 54      [17]  843 	call	_cpct_drawStringM0
   5118 21 06 00      [10]  844 	ld	hl,#6
   511B 39            [11]  845 	add	hl,sp
   511C F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   511D 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   5120 E5            [11]  849 	push	hl
   5121 21 00 C0      [10]  850 	ld	hl,#0xC000
   5124 E5            [11]  851 	push	hl
   5125 CD 7F 60      [17]  852 	call	_cpct_getScreenPtr
   5128 4D            [ 4]  853 	ld	c,l
   5129 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   512A 21 02 00      [10]  856 	ld	hl,#0x0002
   512D E5            [11]  857 	push	hl
   512E C5            [11]  858 	push	bc
   512F 21 85 51      [10]  859 	ld	hl,#___str_14
   5132 E5            [11]  860 	push	hl
   5133 CD 98 54      [17]  861 	call	_cpct_drawStringM0
   5136 21 06 00      [10]  862 	ld	hl,#6
   5139 39            [11]  863 	add	hl,sp
   513A F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   513B                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   513B CD FF 53      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   513E 21 04 40      [10]  870 	ld	hl,#0x4004
   5141 CD 80 54      [17]  871 	call	_cpct_isKeyPressed
   5144 7D            [ 4]  872 	ld	a,l
   5145 B7            [ 4]  873 	or	a, a
   5146 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   5148 CD FF 53      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   514B                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   514B CD EB 4F      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   514E 21 07 10      [10]  882 	ld	hl,#0x1007
   5151 CD 80 54      [17]  883 	call	_cpct_isKeyPressed
   5154 7D            [ 4]  884 	ld	a,l
   5155 B7            [ 4]  885 	or	a, a
   5156 28 F3         [12]  886 	jr	Z,00101$
   5158                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5158 21 07 10      [10]  889 	ld	hl,#0x1007
   515B CD 80 54      [17]  890 	call	_cpct_isKeyPressed
   515E 7D            [ 4]  891 	ld	a,l
   515F B7            [ 4]  892 	or	a, a
   5160 C0            [11]  893 	ret	NZ
   5161 21 04 40      [10]  894 	ld	hl,#0x4004
   5164 CD 80 54      [17]  895 	call	_cpct_isKeyPressed
   5167 7D            [ 4]  896 	ld	a,l
   5168 B7            [ 4]  897 	or	a, a
   5169 28 D0         [12]  898 	jr	Z,00107$
   516B C9            [10]  899 	ret
   516C                     900 ___str_12:
   516C 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   5173 00                  902 	.db 0x00
   5174                     903 ___str_13:
   5174 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   5184 00                  905 	.db 0x00
   5185                     906 ___str_14:
   5185 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   5194 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
