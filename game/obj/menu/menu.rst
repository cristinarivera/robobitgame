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
   7C0A                      60 _menuFin::
   7C0A DD E5         [15]   61 	push	ix
   7C0C DD 21 00 00   [14]   62 	ld	ix,#0
   7C10 DD 39         [15]   63 	add	ix,sp
   7C12 F5            [11]   64 	push	af
   7C13 F5            [11]   65 	push	af
   7C14 DD 75 FE      [19]   66 	ld	-2 (ix),l
   7C17 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   7C1A 21 10 27      [10]   69 	ld	hl,#0x2710
   7C1D E5            [11]   70 	push	hl
   7C1E DD 6E FE      [19]   71 	ld	l,-2 (ix)
   7C21 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   7C24 E5            [11]   73 	push	hl
   7C25 CD AE 83      [17]   74 	call	__divuint
   7C28 F1            [10]   75 	pop	af
   7C29 F1            [10]   76 	pop	af
   7C2A 33            [ 6]   77 	inc	sp
   7C2B 33            [ 6]   78 	inc	sp
   7C2C E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   7C2D 21 00 40      [10]   81 	ld	hl,#0x4000
   7C30 E5            [11]   82 	push	hl
   7C31 AF            [ 4]   83 	xor	a, a
   7C32 F5            [11]   84 	push	af
   7C33 33            [ 6]   85 	inc	sp
   7C34 26 C0         [ 7]   86 	ld	h, #0xC0
   7C36 E5            [11]   87 	push	hl
   7C37 CD 37 87      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7C3A 21 18 5A      [10]   90 	ld	hl,#0x5A18
   7C3D E5            [11]   91 	push	hl
   7C3E 21 00 C0      [10]   92 	ld	hl,#0xC000
   7C41 E5            [11]   93 	push	hl
   7C42 CD 6F 90      [17]   94 	call	_cpct_getScreenPtr
   7C45 4D            [ 4]   95 	ld	c,l
   7C46 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7C47 21 02 00      [10]   98 	ld	hl,#0x0002
   7C4A E5            [11]   99 	push	hl
   7C4B C5            [11]  100 	push	bc
   7C4C 21 6C 7D      [10]  101 	ld	hl,#___str_0
   7C4F E5            [11]  102 	push	hl
   7C50 CD 88 84      [17]  103 	call	_cpct_drawStringM0
   7C53 21 06 00      [10]  104 	ld	hl,#6
   7C56 39            [11]  105 	add	hl,sp
   7C57 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   7C58 21 14 78      [10]  108 	ld	hl,#0x7814
   7C5B E5            [11]  109 	push	hl
   7C5C 21 00 C0      [10]  110 	ld	hl,#0xC000
   7C5F E5            [11]  111 	push	hl
   7C60 CD 6F 90      [17]  112 	call	_cpct_getScreenPtr
   7C63 4D            [ 4]  113 	ld	c,l
   7C64 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   7C65 21 02 00      [10]  116 	ld	hl,#0x0002
   7C68 E5            [11]  117 	push	hl
   7C69 C5            [11]  118 	push	bc
   7C6A 21 76 7D      [10]  119 	ld	hl,#___str_1
   7C6D E5            [11]  120 	push	hl
   7C6E CD 88 84      [17]  121 	call	_cpct_drawStringM0
   7C71 21 06 00      [10]  122 	ld	hl,#6
   7C74 39            [11]  123 	add	hl,sp
   7C75 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   7C76 21 2D 78      [10]  126 	ld	hl,#0x782D
   7C79 E5            [11]  127 	push	hl
   7C7A 21 00 C0      [10]  128 	ld	hl,#0xC000
   7C7D E5            [11]  129 	push	hl
   7C7E CD 6F 90      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   7C81 E5            [11]  132 	push	hl
   7C82 21 0A 00      [10]  133 	ld	hl,#0x000A
   7C85 E5            [11]  134 	push	hl
   7C86 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   7C89 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   7C8C E5            [11]  137 	push	hl
   7C8D CD 64 90      [17]  138 	call	__moduint
   7C90 F1            [10]  139 	pop	af
   7C91 F1            [10]  140 	pop	af
   7C92 C1            [10]  141 	pop	bc
   7C93 7D            [ 4]  142 	ld	a,l
   7C94 C6 30         [ 7]  143 	add	a, #0x30
   7C96 67            [ 4]  144 	ld	h,a
   7C97 59            [ 4]  145 	ld	e, c
   7C98 50            [ 4]  146 	ld	d, b
   7C99 C5            [11]  147 	push	bc
   7C9A E5            [11]  148 	push	hl
   7C9B 33            [ 6]  149 	inc	sp
   7C9C 21 02 00      [10]  150 	ld	hl,#0x0002
   7C9F E5            [11]  151 	push	hl
   7CA0 D5            [11]  152 	push	de
   7CA1 CD E0 85      [17]  153 	call	_cpct_drawCharM0
   7CA4 F1            [10]  154 	pop	af
   7CA5 33            [ 6]  155 	inc	sp
   7CA6 21 E8 03      [10]  156 	ld	hl,#0x03E8
   7CA9 E3            [19]  157 	ex	(sp),hl
   7CAA DD 6E FE      [19]  158 	ld	l,-2 (ix)
   7CAD DD 66 FF      [19]  159 	ld	h,-1 (ix)
   7CB0 E5            [11]  160 	push	hl
   7CB1 CD AE 83      [17]  161 	call	__divuint
   7CB4 F1            [10]  162 	pop	af
   7CB5 F1            [10]  163 	pop	af
   7CB6 11 0A 00      [10]  164 	ld	de,#0x000A
   7CB9 D5            [11]  165 	push	de
   7CBA E5            [11]  166 	push	hl
   7CBB CD 64 90      [17]  167 	call	__moduint
   7CBE F1            [10]  168 	pop	af
   7CBF F1            [10]  169 	pop	af
   7CC0 C1            [10]  170 	pop	bc
   7CC1 7D            [ 4]  171 	ld	a,l
   7CC2 C6 30         [ 7]  172 	add	a, #0x30
   7CC4 67            [ 4]  173 	ld	h,a
   7CC5 79            [ 4]  174 	ld	a,c
   7CC6 C6 04         [ 7]  175 	add	a, #0x04
   7CC8 5F            [ 4]  176 	ld	e,a
   7CC9 78            [ 4]  177 	ld	a,b
   7CCA CE 00         [ 7]  178 	adc	a, #0x00
   7CCC 57            [ 4]  179 	ld	d,a
   7CCD C5            [11]  180 	push	bc
   7CCE E5            [11]  181 	push	hl
   7CCF 33            [ 6]  182 	inc	sp
   7CD0 21 02 00      [10]  183 	ld	hl,#0x0002
   7CD3 E5            [11]  184 	push	hl
   7CD4 D5            [11]  185 	push	de
   7CD5 CD E0 85      [17]  186 	call	_cpct_drawCharM0
   7CD8 F1            [10]  187 	pop	af
   7CD9 33            [ 6]  188 	inc	sp
   7CDA 21 64 00      [10]  189 	ld	hl,#0x0064
   7CDD E3            [19]  190 	ex	(sp),hl
   7CDE DD 6E FE      [19]  191 	ld	l,-2 (ix)
   7CE1 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   7CE4 E5            [11]  193 	push	hl
   7CE5 CD AE 83      [17]  194 	call	__divuint
   7CE8 F1            [10]  195 	pop	af
   7CE9 F1            [10]  196 	pop	af
   7CEA 11 0A 00      [10]  197 	ld	de,#0x000A
   7CED D5            [11]  198 	push	de
   7CEE E5            [11]  199 	push	hl
   7CEF CD 64 90      [17]  200 	call	__moduint
   7CF2 F1            [10]  201 	pop	af
   7CF3 F1            [10]  202 	pop	af
   7CF4 C1            [10]  203 	pop	bc
   7CF5 7D            [ 4]  204 	ld	a,l
   7CF6 C6 30         [ 7]  205 	add	a, #0x30
   7CF8 67            [ 4]  206 	ld	h,a
   7CF9 79            [ 4]  207 	ld	a,c
   7CFA C6 08         [ 7]  208 	add	a, #0x08
   7CFC 5F            [ 4]  209 	ld	e,a
   7CFD 78            [ 4]  210 	ld	a,b
   7CFE CE 00         [ 7]  211 	adc	a, #0x00
   7D00 57            [ 4]  212 	ld	d,a
   7D01 C5            [11]  213 	push	bc
   7D02 E5            [11]  214 	push	hl
   7D03 33            [ 6]  215 	inc	sp
   7D04 21 02 00      [10]  216 	ld	hl,#0x0002
   7D07 E5            [11]  217 	push	hl
   7D08 D5            [11]  218 	push	de
   7D09 CD E0 85      [17]  219 	call	_cpct_drawCharM0
   7D0C F1            [10]  220 	pop	af
   7D0D 33            [ 6]  221 	inc	sp
   7D0E 21 0A 00      [10]  222 	ld	hl,#0x000A
   7D11 E3            [19]  223 	ex	(sp),hl
   7D12 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   7D15 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   7D18 E5            [11]  226 	push	hl
   7D19 CD AE 83      [17]  227 	call	__divuint
   7D1C F1            [10]  228 	pop	af
   7D1D F1            [10]  229 	pop	af
   7D1E 11 0A 00      [10]  230 	ld	de,#0x000A
   7D21 D5            [11]  231 	push	de
   7D22 E5            [11]  232 	push	hl
   7D23 CD 64 90      [17]  233 	call	__moduint
   7D26 F1            [10]  234 	pop	af
   7D27 F1            [10]  235 	pop	af
   7D28 C1            [10]  236 	pop	bc
   7D29 7D            [ 4]  237 	ld	a,l
   7D2A C6 30         [ 7]  238 	add	a, #0x30
   7D2C 67            [ 4]  239 	ld	h,a
   7D2D 79            [ 4]  240 	ld	a,c
   7D2E C6 0C         [ 7]  241 	add	a, #0x0C
   7D30 5F            [ 4]  242 	ld	e,a
   7D31 78            [ 4]  243 	ld	a,b
   7D32 CE 00         [ 7]  244 	adc	a, #0x00
   7D34 57            [ 4]  245 	ld	d,a
   7D35 C5            [11]  246 	push	bc
   7D36 E5            [11]  247 	push	hl
   7D37 33            [ 6]  248 	inc	sp
   7D38 21 02 00      [10]  249 	ld	hl,#0x0002
   7D3B E5            [11]  250 	push	hl
   7D3C D5            [11]  251 	push	de
   7D3D CD E0 85      [17]  252 	call	_cpct_drawCharM0
   7D40 F1            [10]  253 	pop	af
   7D41 33            [ 6]  254 	inc	sp
   7D42 21 0A 00      [10]  255 	ld	hl,#0x000A
   7D45 E3            [19]  256 	ex	(sp),hl
   7D46 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   7D49 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   7D4C E5            [11]  259 	push	hl
   7D4D CD 64 90      [17]  260 	call	__moduint
   7D50 F1            [10]  261 	pop	af
   7D51 F1            [10]  262 	pop	af
   7D52 C1            [10]  263 	pop	bc
   7D53 7D            [ 4]  264 	ld	a,l
   7D54 C6 30         [ 7]  265 	add	a, #0x30
   7D56 57            [ 4]  266 	ld	d,a
   7D57 21 10 00      [10]  267 	ld	hl,#0x0010
   7D5A 09            [11]  268 	add	hl,bc
   7D5B 4D            [ 4]  269 	ld	c,l
   7D5C 44            [ 4]  270 	ld	b,h
   7D5D D5            [11]  271 	push	de
   7D5E 33            [ 6]  272 	inc	sp
   7D5F 21 02 00      [10]  273 	ld	hl,#0x0002
   7D62 E5            [11]  274 	push	hl
   7D63 C5            [11]  275 	push	bc
   7D64 CD E0 85      [17]  276 	call	_cpct_drawCharM0
   7D67 F1            [10]  277 	pop	af
   7D68 F1            [10]  278 	pop	af
   7D69 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   7D6A                     281 00102$:
   7D6A 18 FE         [12]  282 	jr	00102$
   7D6C                     283 ___str_0:
   7D6C 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   7D75 00                  285 	.db 0x00
   7D76                     286 ___str_1:
   7D76 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   7D7D 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   7D7E                     293 _borrarPantalla::
   7D7E DD E5         [15]  294 	push	ix
   7D80 DD 21 00 00   [14]  295 	ld	ix,#0
   7D84 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   7D86 3E 28         [ 7]  298 	ld	a,#0x28
   7D88 DD 96 06      [19]  299 	sub	a, 6 (ix)
   7D8B 3E 00         [ 7]  300 	ld	a,#0x00
   7D8D 17            [ 4]  301 	rla
   7D8E 4F            [ 4]  302 	ld	c,a
   7D8F CB 41         [ 8]  303 	bit	0,c
   7D91 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   7D93 DD 66 05      [19]  306 	ld	h,5 (ix)
   7D96 DD 6E 04      [19]  307 	ld	l,4 (ix)
   7D99 E5            [11]  308 	push	hl
   7D9A 21 00 C0      [10]  309 	ld	hl,#0xC000
   7D9D E5            [11]  310 	push	hl
   7D9E CD 6F 90      [17]  311 	call	_cpct_getScreenPtr
   7DA1 4D            [ 4]  312 	ld	c,l
   7DA2 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   7DA3 DD 66 07      [19]  315 	ld	h,7 (ix)
   7DA6 DD 6E 06      [19]  316 	ld	l,6 (ix)
   7DA9 E5            [11]  317 	push	hl
   7DAA AF            [ 4]  318 	xor	a, a
   7DAB F5            [11]  319 	push	af
   7DAC 33            [ 6]  320 	inc	sp
   7DAD C5            [11]  321 	push	bc
   7DAE CD 7E 8F      [17]  322 	call	_cpct_drawSolidBox
   7DB1 F1            [10]  323 	pop	af
   7DB2 F1            [10]  324 	pop	af
   7DB3 33            [ 6]  325 	inc	sp
   7DB4 18 51         [12]  326 	jr	00106$
   7DB6                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   7DB6 CB 41         [ 8]  329 	bit	0,c
   7DB8 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   7DBA DD 66 05      [19]  332 	ld	h,5 (ix)
   7DBD DD 6E 04      [19]  333 	ld	l,4 (ix)
   7DC0 E5            [11]  334 	push	hl
   7DC1 21 00 C0      [10]  335 	ld	hl,#0xC000
   7DC4 E5            [11]  336 	push	hl
   7DC5 CD 6F 90      [17]  337 	call	_cpct_getScreenPtr
   7DC8 4D            [ 4]  338 	ld	c,l
   7DC9 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   7DCA DD 7E 07      [19]  341 	ld	a,7 (ix)
   7DCD F5            [11]  342 	push	af
   7DCE 33            [ 6]  343 	inc	sp
   7DCF 21 00 28      [10]  344 	ld	hl,#0x2800
   7DD2 E5            [11]  345 	push	hl
   7DD3 C5            [11]  346 	push	bc
   7DD4 CD 7E 8F      [17]  347 	call	_cpct_drawSolidBox
   7DD7 F1            [10]  348 	pop	af
   7DD8 F1            [10]  349 	pop	af
   7DD9 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   7DDA DD 7E 04      [19]  352 	ld	a,4 (ix)
   7DDD C6 28         [ 7]  353 	add	a, #0x28
   7DDF 47            [ 4]  354 	ld	b,a
   7DE0 DD 7E 05      [19]  355 	ld	a,5 (ix)
   7DE3 F5            [11]  356 	push	af
   7DE4 33            [ 6]  357 	inc	sp
   7DE5 C5            [11]  358 	push	bc
   7DE6 33            [ 6]  359 	inc	sp
   7DE7 21 00 C0      [10]  360 	ld	hl,#0xC000
   7DEA E5            [11]  361 	push	hl
   7DEB CD 6F 90      [17]  362 	call	_cpct_getScreenPtr
   7DEE 4D            [ 4]  363 	ld	c,l
   7DEF 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   7DF0 DD 7E 06      [19]  366 	ld	a,6 (ix)
   7DF3 C6 D8         [ 7]  367 	add	a,#0xD8
   7DF5 57            [ 4]  368 	ld	d,a
   7DF6 DD 7E 07      [19]  369 	ld	a,7 (ix)
   7DF9 F5            [11]  370 	push	af
   7DFA 33            [ 6]  371 	inc	sp
   7DFB D5            [11]  372 	push	de
   7DFC 33            [ 6]  373 	inc	sp
   7DFD AF            [ 4]  374 	xor	a, a
   7DFE F5            [11]  375 	push	af
   7DFF 33            [ 6]  376 	inc	sp
   7E00 C5            [11]  377 	push	bc
   7E01 CD 7E 8F      [17]  378 	call	_cpct_drawSolidBox
   7E04 F1            [10]  379 	pop	af
   7E05 F1            [10]  380 	pop	af
   7E06 33            [ 6]  381 	inc	sp
   7E07                     382 00106$:
   7E07 DD E1         [14]  383 	pop	ix
   7E09 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   7E0A                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7E0A 21 50 82      [10]  391 	ld	hl,#0x8250
   7E0D E5            [11]  392 	push	hl
   7E0E 21 00 1E      [10]  393 	ld	hl,#0x1E00
   7E11 E5            [11]  394 	push	hl
   7E12 CD 7E 7D      [17]  395 	call	_borrarPantalla
   7E15 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   7E16 21 10 55      [10]  398 	ld	hl, #0x5510
   7E19 E3            [19]  399 	ex	(sp),hl
   7E1A 21 00 C0      [10]  400 	ld	hl,#0xC000
   7E1D E5            [11]  401 	push	hl
   7E1E CD 6F 90      [17]  402 	call	_cpct_getScreenPtr
   7E21 4D            [ 4]  403 	ld	c,l
   7E22 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   7E23 21 02 00      [10]  406 	ld	hl,#0x0002
   7E26 E5            [11]  407 	push	hl
   7E27 C5            [11]  408 	push	bc
   7E28 21 F8 7E      [10]  409 	ld	hl,#___str_2
   7E2B E5            [11]  410 	push	hl
   7E2C CD 88 84      [17]  411 	call	_cpct_drawStringM0
   7E2F 21 06 00      [10]  412 	ld	hl,#6
   7E32 39            [11]  413 	add	hl,sp
   7E33 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   7E34 21 04 73      [10]  416 	ld	hl,#0x7304
   7E37 E5            [11]  417 	push	hl
   7E38 21 00 C0      [10]  418 	ld	hl,#0xC000
   7E3B E5            [11]  419 	push	hl
   7E3C CD 6F 90      [17]  420 	call	_cpct_getScreenPtr
   7E3F 4D            [ 4]  421 	ld	c,l
   7E40 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7E41 21 05 0A      [10]  424 	ld	hl,#0x0A05
   7E44 E5            [11]  425 	push	hl
   7E45 C5            [11]  426 	push	bc
   7E46 21 A8 55      [10]  427 	ld	hl,#_g_arrows_0
   7E49 E5            [11]  428 	push	hl
   7E4A CD AC 84      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   7E4D 21 0E 73      [10]  431 	ld	hl,#0x730E
   7E50 E5            [11]  432 	push	hl
   7E51 21 00 C0      [10]  433 	ld	hl,#0xC000
   7E54 E5            [11]  434 	push	hl
   7E55 CD 6F 90      [17]  435 	call	_cpct_getScreenPtr
   7E58 4D            [ 4]  436 	ld	c,l
   7E59 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7E5A 21 05 0A      [10]  439 	ld	hl,#0x0A05
   7E5D E5            [11]  440 	push	hl
   7E5E C5            [11]  441 	push	bc
   7E5F 21 DA 55      [10]  442 	ld	hl,#_g_arrows_1
   7E62 E5            [11]  443 	push	hl
   7E63 CD AC 84      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   7E66 21 18 73      [10]  446 	ld	hl,#0x7318
   7E69 E5            [11]  447 	push	hl
   7E6A 21 00 C0      [10]  448 	ld	hl,#0xC000
   7E6D E5            [11]  449 	push	hl
   7E6E CD 6F 90      [17]  450 	call	_cpct_getScreenPtr
   7E71 4D            [ 4]  451 	ld	c,l
   7E72 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7E73 21 05 0A      [10]  454 	ld	hl,#0x0A05
   7E76 E5            [11]  455 	push	hl
   7E77 C5            [11]  456 	push	bc
   7E78 21 0C 56      [10]  457 	ld	hl,#_g_arrows_2
   7E7B E5            [11]  458 	push	hl
   7E7C CD AC 84      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   7E7F 21 22 73      [10]  461 	ld	hl,#0x7322
   7E82 E5            [11]  462 	push	hl
   7E83 21 00 C0      [10]  463 	ld	hl,#0xC000
   7E86 E5            [11]  464 	push	hl
   7E87 CD 6F 90      [17]  465 	call	_cpct_getScreenPtr
   7E8A 4D            [ 4]  466 	ld	c,l
   7E8B 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7E8C 21 05 0A      [10]  469 	ld	hl,#0x0A05
   7E8F E5            [11]  470 	push	hl
   7E90 C5            [11]  471 	push	bc
   7E91 21 3E 56      [10]  472 	ld	hl,#_g_arrows_3
   7E94 E5            [11]  473 	push	hl
   7E95 CD AC 84      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   7E98 21 2D 73      [10]  476 	ld	hl,#0x732D
   7E9B E5            [11]  477 	push	hl
   7E9C 21 00 C0      [10]  478 	ld	hl,#0xC000
   7E9F E5            [11]  479 	push	hl
   7EA0 CD 6F 90      [17]  480 	call	_cpct_getScreenPtr
   7EA3 4D            [ 4]  481 	ld	c,l
   7EA4 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   7EA5 21 02 00      [10]  484 	ld	hl,#0x0002
   7EA8 E5            [11]  485 	push	hl
   7EA9 C5            [11]  486 	push	bc
   7EAA 21 05 7F      [10]  487 	ld	hl,#___str_3
   7EAD E5            [11]  488 	push	hl
   7EAE CD 88 84      [17]  489 	call	_cpct_drawStringM0
   7EB1 21 06 00      [10]  490 	ld	hl,#6
   7EB4 39            [11]  491 	add	hl,sp
   7EB5 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   7EB6 21 04 82      [10]  494 	ld	hl,#0x8204
   7EB9 E5            [11]  495 	push	hl
   7EBA 21 00 C0      [10]  496 	ld	hl,#0xC000
   7EBD E5            [11]  497 	push	hl
   7EBE CD 6F 90      [17]  498 	call	_cpct_getScreenPtr
   7EC1 4D            [ 4]  499 	ld	c,l
   7EC2 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   7EC3 21 02 00      [10]  502 	ld	hl,#0x0002
   7EC6 E5            [11]  503 	push	hl
   7EC7 C5            [11]  504 	push	bc
   7EC8 21 0E 7F      [10]  505 	ld	hl,#___str_4
   7ECB E5            [11]  506 	push	hl
   7ECC CD 88 84      [17]  507 	call	_cpct_drawStringM0
   7ECF 21 06 00      [10]  508 	ld	hl,#6
   7ED2 39            [11]  509 	add	hl,sp
   7ED3 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   7ED4                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   7ED4 CD EF 83      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   7ED7 21 04 40      [10]  516 	ld	hl,#0x4004
   7EDA CD 70 84      [17]  517 	call	_cpct_isKeyPressed
   7EDD 7D            [ 4]  518 	ld	a,l
   7EDE B7            [ 4]  519 	or	a, a
   7EDF 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   7EE1 CD 00 80      [17]  522 	call	_menuOpciones
   7EE4                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7EE4 21 07 10      [10]  525 	ld	hl,#0x1007
   7EE7 CD 70 84      [17]  526 	call	_cpct_isKeyPressed
   7EEA 7D            [ 4]  527 	ld	a,l
   7EEB B7            [ 4]  528 	or	a, a
   7EEC C0            [11]  529 	ret	NZ
   7EED 21 04 40      [10]  530 	ld	hl,#0x4004
   7EF0 CD 70 84      [17]  531 	call	_cpct_isKeyPressed
   7EF3 7D            [ 4]  532 	ld	a,l
   7EF4 B7            [ 4]  533 	or	a, a
   7EF5 28 DD         [12]  534 	jr	Z,00104$
   7EF7 C9            [10]  535 	ret
   7EF8                     536 ___str_2:
   7EF8 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   7F04 00                  538 	.db 0x00
   7F05                     539 ___str_3:
   7F05 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   7F0D 00                  541 	.db 0x00
   7F0E                     542 ___str_4:
   7F0E 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   7F20 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   7F21                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7F21 21 50 82      [10]  551 	ld	hl,#0x8250
   7F24 E5            [11]  552 	push	hl
   7F25 21 00 1E      [10]  553 	ld	hl,#0x1E00
   7F28 E5            [11]  554 	push	hl
   7F29 CD 7E 7D      [17]  555 	call	_borrarPantalla
   7F2C F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   7F2D 21 1A 46      [10]  558 	ld	hl, #0x461A
   7F30 E3            [19]  559 	ex	(sp),hl
   7F31 21 00 C0      [10]  560 	ld	hl,#0xC000
   7F34 E5            [11]  561 	push	hl
   7F35 CD 6F 90      [17]  562 	call	_cpct_getScreenPtr
   7F38 4D            [ 4]  563 	ld	c,l
   7F39 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   7F3A 21 02 00      [10]  566 	ld	hl,#0x0002
   7F3D E5            [11]  567 	push	hl
   7F3E C5            [11]  568 	push	bc
   7F3F 21 C9 7F      [10]  569 	ld	hl,#___str_5
   7F42 E5            [11]  570 	push	hl
   7F43 CD 88 84      [17]  571 	call	_cpct_drawStringM0
   7F46 21 06 00      [10]  572 	ld	hl,#6
   7F49 39            [11]  573 	add	hl,sp
   7F4A F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   7F4B 21 0A 64      [10]  576 	ld	hl,#0x640A
   7F4E E5            [11]  577 	push	hl
   7F4F 21 00 C0      [10]  578 	ld	hl,#0xC000
   7F52 E5            [11]  579 	push	hl
   7F53 CD 6F 90      [17]  580 	call	_cpct_getScreenPtr
   7F56 4D            [ 4]  581 	ld	c,l
   7F57 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   7F58 21 02 00      [10]  584 	ld	hl,#0x0002
   7F5B E5            [11]  585 	push	hl
   7F5C C5            [11]  586 	push	bc
   7F5D 21 D1 7F      [10]  587 	ld	hl,#___str_6
   7F60 E5            [11]  588 	push	hl
   7F61 CD 88 84      [17]  589 	call	_cpct_drawStringM0
   7F64 21 06 00      [10]  590 	ld	hl,#6
   7F67 39            [11]  591 	add	hl,sp
   7F68 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   7F69 21 0E 73      [10]  594 	ld	hl,#0x730E
   7F6C E5            [11]  595 	push	hl
   7F6D 21 00 C0      [10]  596 	ld	hl,#0xC000
   7F70 E5            [11]  597 	push	hl
   7F71 CD 6F 90      [17]  598 	call	_cpct_getScreenPtr
   7F74 4D            [ 4]  599 	ld	c,l
   7F75 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   7F76 21 02 00      [10]  602 	ld	hl,#0x0002
   7F79 E5            [11]  603 	push	hl
   7F7A C5            [11]  604 	push	bc
   7F7B 21 E1 7F      [10]  605 	ld	hl,#___str_7
   7F7E E5            [11]  606 	push	hl
   7F7F CD 88 84      [17]  607 	call	_cpct_drawStringM0
   7F82 21 06 00      [10]  608 	ld	hl,#6
   7F85 39            [11]  609 	add	hl,sp
   7F86 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   7F87 21 08 82      [10]  612 	ld	hl,#0x8208
   7F8A E5            [11]  613 	push	hl
   7F8B 21 00 C0      [10]  614 	ld	hl,#0xC000
   7F8E E5            [11]  615 	push	hl
   7F8F CD 6F 90      [17]  616 	call	_cpct_getScreenPtr
   7F92 4D            [ 4]  617 	ld	c,l
   7F93 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   7F94 21 02 00      [10]  620 	ld	hl,#0x0002
   7F97 E5            [11]  621 	push	hl
   7F98 C5            [11]  622 	push	bc
   7F99 21 EF 7F      [10]  623 	ld	hl,#___str_8
   7F9C E5            [11]  624 	push	hl
   7F9D CD 88 84      [17]  625 	call	_cpct_drawStringM0
   7FA0 21 06 00      [10]  626 	ld	hl,#6
   7FA3 39            [11]  627 	add	hl,sp
   7FA4 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   7FA5                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   7FA5 CD EF 83      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   7FA8 21 04 40      [10]  634 	ld	hl,#0x4004
   7FAB CD 70 84      [17]  635 	call	_cpct_isKeyPressed
   7FAE 7D            [ 4]  636 	ld	a,l
   7FAF B7            [ 4]  637 	or	a, a
   7FB0 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   7FB2 CD 00 80      [17]  640 	call	_menuOpciones
   7FB5                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7FB5 21 07 10      [10]  643 	ld	hl,#0x1007
   7FB8 CD 70 84      [17]  644 	call	_cpct_isKeyPressed
   7FBB 7D            [ 4]  645 	ld	a,l
   7FBC B7            [ 4]  646 	or	a, a
   7FBD C0            [11]  647 	ret	NZ
   7FBE 21 04 40      [10]  648 	ld	hl,#0x4004
   7FC1 CD 70 84      [17]  649 	call	_cpct_isKeyPressed
   7FC4 7D            [ 4]  650 	ld	a,l
   7FC5 B7            [ 4]  651 	or	a, a
   7FC6 28 DD         [12]  652 	jr	Z,00104$
   7FC8 C9            [10]  653 	ret
   7FC9                     654 ___str_5:
   7FC9 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   7FD0 00                  656 	.db 0x00
   7FD1                     657 ___str_6:
   7FD1 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   7FE0 00                  659 	.db 0x00
   7FE1                     660 ___str_7:
   7FE1 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   7FEE 00                  662 	.db 0x00
   7FEF                     663 ___str_8:
   7FEF 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   7FFF 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   8000                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   8000 21 50 82      [10]  672 	ld	hl,#0x8250
   8003 E5            [11]  673 	push	hl
   8004 21 00 1E      [10]  674 	ld	hl,#0x1E00
   8007 E5            [11]  675 	push	hl
   8008 CD 7E 7D      [17]  676 	call	_borrarPantalla
   800B F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   800C 21 20 64      [10]  679 	ld	hl, #0x6420
   800F E3            [19]  680 	ex	(sp),hl
   8010 21 00 C0      [10]  681 	ld	hl,#0xC000
   8013 E5            [11]  682 	push	hl
   8014 CD 6F 90      [17]  683 	call	_cpct_getScreenPtr
   8017 4D            [ 4]  684 	ld	c,l
   8018 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   8019 21 02 00      [10]  687 	ld	hl,#0x0002
   801C E5            [11]  688 	push	hl
   801D C5            [11]  689 	push	bc
   801E 21 A1 80      [10]  690 	ld	hl,#___str_9
   8021 E5            [11]  691 	push	hl
   8022 CD 88 84      [17]  692 	call	_cpct_drawStringM0
   8025 21 06 00      [10]  693 	ld	hl,#6
   8028 39            [11]  694 	add	hl,sp
   8029 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   802A 21 00 82      [10]  697 	ld	hl,#0x8200
   802D E5            [11]  698 	push	hl
   802E 26 C0         [ 7]  699 	ld	h, #0xC0
   8030 E5            [11]  700 	push	hl
   8031 CD 6F 90      [17]  701 	call	_cpct_getScreenPtr
   8034 4D            [ 4]  702 	ld	c,l
   8035 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   8036 21 02 00      [10]  705 	ld	hl,#0x0002
   8039 E5            [11]  706 	push	hl
   803A C5            [11]  707 	push	bc
   803B 21 A6 80      [10]  708 	ld	hl,#___str_10
   803E E5            [11]  709 	push	hl
   803F CD 88 84      [17]  710 	call	_cpct_drawStringM0
   8042 21 06 00      [10]  711 	ld	hl,#6
   8045 39            [11]  712 	add	hl,sp
   8046 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   8047 21 0A 91      [10]  715 	ld	hl,#0x910A
   804A E5            [11]  716 	push	hl
   804B 21 00 C0      [10]  717 	ld	hl,#0xC000
   804E E5            [11]  718 	push	hl
   804F CD 6F 90      [17]  719 	call	_cpct_getScreenPtr
   8052 4D            [ 4]  720 	ld	c,l
   8053 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   8054 21 02 00      [10]  723 	ld	hl,#0x0002
   8057 E5            [11]  724 	push	hl
   8058 C5            [11]  725 	push	bc
   8059 21 BB 80      [10]  726 	ld	hl,#___str_11
   805C E5            [11]  727 	push	hl
   805D CD 88 84      [17]  728 	call	_cpct_drawStringM0
   8060 21 06 00      [10]  729 	ld	hl,#6
   8063 39            [11]  730 	add	hl,sp
   8064 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   8065                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   8065 CD EF 83      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   8068 21 04 08      [10]  737 	ld	hl,#0x0804
   806B CD 70 84      [17]  738 	call	_cpct_isKeyPressed
   806E 7D            [ 4]  739 	ld	a,l
   806F B7            [ 4]  740 	or	a, a
   8070 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   8072 CD 0A 7E      [17]  743 	call	_menuInstrucciones
   8075 18 0D         [12]  744 	jr	00109$
   8077                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   8077 21 07 40      [10]  747 	ld	hl,#0x4007
   807A CD 70 84      [17]  748 	call	_cpct_isKeyPressed
   807D 7D            [ 4]  749 	ld	a,l
   807E B7            [ 4]  750 	or	a, a
   807F 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   8081 CD 21 7F      [17]  753 	call	_menuCreditos
   8084                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   8084 21 07 10      [10]  756 	ld	hl,#0x1007
   8087 CD 70 84      [17]  757 	call	_cpct_isKeyPressed
   808A 7D            [ 4]  758 	ld	a,l
   808B B7            [ 4]  759 	or	a, a
   808C C0            [11]  760 	ret	NZ
   808D 21 04 08      [10]  761 	ld	hl,#0x0804
   8090 CD 70 84      [17]  762 	call	_cpct_isKeyPressed
   8093 7D            [ 4]  763 	ld	a,l
   8094 B7            [ 4]  764 	or	a, a
   8095 C0            [11]  765 	ret	NZ
   8096 21 07 40      [10]  766 	ld	hl,#0x4007
   8099 CD 70 84      [17]  767 	call	_cpct_isKeyPressed
   809C 7D            [ 4]  768 	ld	a,l
   809D B7            [ 4]  769 	or	a, a
   809E 28 C5         [12]  770 	jr	Z,00108$
   80A0 C9            [10]  771 	ret
   80A1                     772 ___str_9:
   80A1 4D 45 4E 55         773 	.ascii "MENU"
   80A5 00                  774 	.db 0x00
   80A6                     775 ___str_10:
   80A6 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   80BA 00                  777 	.db 0x00
   80BB                     778 ___str_11:
   80BB 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   80CA 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   80CB                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   80CB 21 00 40      [10]  787 	ld	hl,#0x4000
   80CE E5            [11]  788 	push	hl
   80CF AF            [ 4]  789 	xor	a, a
   80D0 F5            [11]  790 	push	af
   80D1 33            [ 6]  791 	inc	sp
   80D2 26 C0         [ 7]  792 	ld	h, #0xC0
   80D4 E5            [11]  793 	push	hl
   80D5 CD 37 87      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   80D8 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   80DB E5            [11]  797 	push	hl
   80DC 21 00 C0      [10]  798 	ld	hl,#0xC000
   80DF E5            [11]  799 	push	hl
   80E0 CD 6F 90      [17]  800 	call	_cpct_getScreenPtr
   80E3 4D            [ 4]  801 	ld	c,l
   80E4 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   80E5 21 04 00      [10]  804 	ld	hl,#0x0004
   80E8 E5            [11]  805 	push	hl
   80E9 C5            [11]  806 	push	bc
   80EA 21 81 81      [10]  807 	ld	hl,#___str_12
   80ED E5            [11]  808 	push	hl
   80EE CD 88 84      [17]  809 	call	_cpct_drawStringM0
   80F1 21 06 00      [10]  810 	ld	hl,#6
   80F4 39            [11]  811 	add	hl,sp
   80F5 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   80F6 21 28 6E      [10]  814 	ld	hl,#0x6E28
   80F9 E5            [11]  815 	push	hl
   80FA 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   80FD E5            [11]  817 	push	hl
   80FE 21 C8 56      [10]  818 	ld	hl,#_g_text_0
   8101 E5            [11]  819 	push	hl
   8102 CD AC 84      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   8105 21 28 6E      [10]  822 	ld	hl,#0x6E28
   8108 E5            [11]  823 	push	hl
   8109 21 18 F1      [10]  824 	ld	hl,#0xF118
   810C E5            [11]  825 	push	hl
   810D 21 F8 67      [10]  826 	ld	hl,#_g_text_1
   8110 E5            [11]  827 	push	hl
   8111 CD AC 84      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   8114 21 08 A0      [10]  830 	ld	hl,#0xA008
   8117 E5            [11]  831 	push	hl
   8118 21 00 C0      [10]  832 	ld	hl,#0xC000
   811B E5            [11]  833 	push	hl
   811C CD 6F 90      [17]  834 	call	_cpct_getScreenPtr
   811F 4D            [ 4]  835 	ld	c,l
   8120 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   8121 21 02 00      [10]  838 	ld	hl,#0x0002
   8124 E5            [11]  839 	push	hl
   8125 C5            [11]  840 	push	bc
   8126 21 89 81      [10]  841 	ld	hl,#___str_13
   8129 E5            [11]  842 	push	hl
   812A CD 88 84      [17]  843 	call	_cpct_drawStringM0
   812D 21 06 00      [10]  844 	ld	hl,#6
   8130 39            [11]  845 	add	hl,sp
   8131 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   8132 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   8135 E5            [11]  849 	push	hl
   8136 21 00 C0      [10]  850 	ld	hl,#0xC000
   8139 E5            [11]  851 	push	hl
   813A CD 6F 90      [17]  852 	call	_cpct_getScreenPtr
   813D 4D            [ 4]  853 	ld	c,l
   813E 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   813F 21 02 00      [10]  856 	ld	hl,#0x0002
   8142 E5            [11]  857 	push	hl
   8143 C5            [11]  858 	push	bc
   8144 21 9A 81      [10]  859 	ld	hl,#___str_14
   8147 E5            [11]  860 	push	hl
   8148 CD 88 84      [17]  861 	call	_cpct_drawStringM0
   814B 21 06 00      [10]  862 	ld	hl,#6
   814E 39            [11]  863 	add	hl,sp
   814F F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   8150                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   8150 CD EF 83      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   8153 21 04 40      [10]  870 	ld	hl,#0x4004
   8156 CD 70 84      [17]  871 	call	_cpct_isKeyPressed
   8159 7D            [ 4]  872 	ld	a,l
   815A B7            [ 4]  873 	or	a, a
   815B 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   815D CD EF 83      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   8160                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   8160 CD 00 80      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   8163 21 07 10      [10]  882 	ld	hl,#0x1007
   8166 CD 70 84      [17]  883 	call	_cpct_isKeyPressed
   8169 7D            [ 4]  884 	ld	a,l
   816A B7            [ 4]  885 	or	a, a
   816B 28 F3         [12]  886 	jr	Z,00101$
   816D                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   816D 21 07 10      [10]  889 	ld	hl,#0x1007
   8170 CD 70 84      [17]  890 	call	_cpct_isKeyPressed
   8173 7D            [ 4]  891 	ld	a,l
   8174 B7            [ 4]  892 	or	a, a
   8175 C0            [11]  893 	ret	NZ
   8176 21 04 40      [10]  894 	ld	hl,#0x4004
   8179 CD 70 84      [17]  895 	call	_cpct_isKeyPressed
   817C 7D            [ 4]  896 	ld	a,l
   817D B7            [ 4]  897 	or	a, a
   817E 28 D0         [12]  898 	jr	Z,00107$
   8180 C9            [10]  899 	ret
   8181                     900 ___str_12:
   8181 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   8188 00                  902 	.db 0x00
   8189                     903 ___str_13:
   8189 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   8199 00                  905 	.db 0x00
   819A                     906 ___str_14:
   819A 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   81A9 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
