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
   4BE5                      60 _menuFin::
   4BE5 DD E5         [15]   61 	push	ix
   4BE7 DD 21 00 00   [14]   62 	ld	ix,#0
   4BEB DD 39         [15]   63 	add	ix,sp
   4BED F5            [11]   64 	push	af
   4BEE F5            [11]   65 	push	af
   4BEF DD 75 FE      [19]   66 	ld	-2 (ix),l
   4BF2 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4BF5 21 10 27      [10]   69 	ld	hl,#0x2710
   4BF8 E5            [11]   70 	push	hl
   4BF9 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4BFC DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4BFF E5            [11]   73 	push	hl
   4C00 CD AE 53      [17]   74 	call	__divuint
   4C03 F1            [10]   75 	pop	af
   4C04 F1            [10]   76 	pop	af
   4C05 33            [ 6]   77 	inc	sp
   4C06 33            [ 6]   78 	inc	sp
   4C07 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4C08 21 00 40      [10]   81 	ld	hl,#0x4000
   4C0B E5            [11]   82 	push	hl
   4C0C AF            [ 4]   83 	xor	a, a
   4C0D F5            [11]   84 	push	af
   4C0E 33            [ 6]   85 	inc	sp
   4C0F 26 C0         [ 7]   86 	ld	h, #0xC0
   4C11 E5            [11]   87 	push	hl
   4C12 CD 4E 57      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4C15 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4C18 E5            [11]   91 	push	hl
   4C19 21 00 C0      [10]   92 	ld	hl,#0xC000
   4C1C E5            [11]   93 	push	hl
   4C1D CD 6F 60      [17]   94 	call	_cpct_getScreenPtr
   4C20 4D            [ 4]   95 	ld	c,l
   4C21 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4C22 21 02 00      [10]   98 	ld	hl,#0x0002
   4C25 E5            [11]   99 	push	hl
   4C26 C5            [11]  100 	push	bc
   4C27 21 47 4D      [10]  101 	ld	hl,#___str_0
   4C2A E5            [11]  102 	push	hl
   4C2B CD 88 54      [17]  103 	call	_cpct_drawStringM0
   4C2E 21 06 00      [10]  104 	ld	hl,#6
   4C31 39            [11]  105 	add	hl,sp
   4C32 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4C33 21 14 78      [10]  108 	ld	hl,#0x7814
   4C36 E5            [11]  109 	push	hl
   4C37 21 00 C0      [10]  110 	ld	hl,#0xC000
   4C3A E5            [11]  111 	push	hl
   4C3B CD 6F 60      [17]  112 	call	_cpct_getScreenPtr
   4C3E 4D            [ 4]  113 	ld	c,l
   4C3F 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4C40 21 02 00      [10]  116 	ld	hl,#0x0002
   4C43 E5            [11]  117 	push	hl
   4C44 C5            [11]  118 	push	bc
   4C45 21 51 4D      [10]  119 	ld	hl,#___str_1
   4C48 E5            [11]  120 	push	hl
   4C49 CD 88 54      [17]  121 	call	_cpct_drawStringM0
   4C4C 21 06 00      [10]  122 	ld	hl,#6
   4C4F 39            [11]  123 	add	hl,sp
   4C50 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4C51 21 2D 78      [10]  126 	ld	hl,#0x782D
   4C54 E5            [11]  127 	push	hl
   4C55 21 00 C0      [10]  128 	ld	hl,#0xC000
   4C58 E5            [11]  129 	push	hl
   4C59 CD 6F 60      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4C5C E5            [11]  132 	push	hl
   4C5D 21 0A 00      [10]  133 	ld	hl,#0x000A
   4C60 E5            [11]  134 	push	hl
   4C61 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4C64 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4C67 E5            [11]  137 	push	hl
   4C68 CD 7D 56      [17]  138 	call	__moduint
   4C6B F1            [10]  139 	pop	af
   4C6C F1            [10]  140 	pop	af
   4C6D C1            [10]  141 	pop	bc
   4C6E 7D            [ 4]  142 	ld	a,l
   4C6F C6 30         [ 7]  143 	add	a, #0x30
   4C71 67            [ 4]  144 	ld	h,a
   4C72 59            [ 4]  145 	ld	e, c
   4C73 50            [ 4]  146 	ld	d, b
   4C74 C5            [11]  147 	push	bc
   4C75 E5            [11]  148 	push	hl
   4C76 33            [ 6]  149 	inc	sp
   4C77 21 02 00      [10]  150 	ld	hl,#0x0002
   4C7A E5            [11]  151 	push	hl
   4C7B D5            [11]  152 	push	de
   4C7C CD E0 55      [17]  153 	call	_cpct_drawCharM0
   4C7F F1            [10]  154 	pop	af
   4C80 33            [ 6]  155 	inc	sp
   4C81 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4C84 E3            [19]  157 	ex	(sp),hl
   4C85 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4C88 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4C8B E5            [11]  160 	push	hl
   4C8C CD AE 53      [17]  161 	call	__divuint
   4C8F F1            [10]  162 	pop	af
   4C90 F1            [10]  163 	pop	af
   4C91 11 0A 00      [10]  164 	ld	de,#0x000A
   4C94 D5            [11]  165 	push	de
   4C95 E5            [11]  166 	push	hl
   4C96 CD 7D 56      [17]  167 	call	__moduint
   4C99 F1            [10]  168 	pop	af
   4C9A F1            [10]  169 	pop	af
   4C9B C1            [10]  170 	pop	bc
   4C9C 7D            [ 4]  171 	ld	a,l
   4C9D C6 30         [ 7]  172 	add	a, #0x30
   4C9F 67            [ 4]  173 	ld	h,a
   4CA0 79            [ 4]  174 	ld	a,c
   4CA1 C6 04         [ 7]  175 	add	a, #0x04
   4CA3 5F            [ 4]  176 	ld	e,a
   4CA4 78            [ 4]  177 	ld	a,b
   4CA5 CE 00         [ 7]  178 	adc	a, #0x00
   4CA7 57            [ 4]  179 	ld	d,a
   4CA8 C5            [11]  180 	push	bc
   4CA9 E5            [11]  181 	push	hl
   4CAA 33            [ 6]  182 	inc	sp
   4CAB 21 02 00      [10]  183 	ld	hl,#0x0002
   4CAE E5            [11]  184 	push	hl
   4CAF D5            [11]  185 	push	de
   4CB0 CD E0 55      [17]  186 	call	_cpct_drawCharM0
   4CB3 F1            [10]  187 	pop	af
   4CB4 33            [ 6]  188 	inc	sp
   4CB5 21 64 00      [10]  189 	ld	hl,#0x0064
   4CB8 E3            [19]  190 	ex	(sp),hl
   4CB9 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4CBC DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4CBF E5            [11]  193 	push	hl
   4CC0 CD AE 53      [17]  194 	call	__divuint
   4CC3 F1            [10]  195 	pop	af
   4CC4 F1            [10]  196 	pop	af
   4CC5 11 0A 00      [10]  197 	ld	de,#0x000A
   4CC8 D5            [11]  198 	push	de
   4CC9 E5            [11]  199 	push	hl
   4CCA CD 7D 56      [17]  200 	call	__moduint
   4CCD F1            [10]  201 	pop	af
   4CCE F1            [10]  202 	pop	af
   4CCF C1            [10]  203 	pop	bc
   4CD0 7D            [ 4]  204 	ld	a,l
   4CD1 C6 30         [ 7]  205 	add	a, #0x30
   4CD3 67            [ 4]  206 	ld	h,a
   4CD4 79            [ 4]  207 	ld	a,c
   4CD5 C6 08         [ 7]  208 	add	a, #0x08
   4CD7 5F            [ 4]  209 	ld	e,a
   4CD8 78            [ 4]  210 	ld	a,b
   4CD9 CE 00         [ 7]  211 	adc	a, #0x00
   4CDB 57            [ 4]  212 	ld	d,a
   4CDC C5            [11]  213 	push	bc
   4CDD E5            [11]  214 	push	hl
   4CDE 33            [ 6]  215 	inc	sp
   4CDF 21 02 00      [10]  216 	ld	hl,#0x0002
   4CE2 E5            [11]  217 	push	hl
   4CE3 D5            [11]  218 	push	de
   4CE4 CD E0 55      [17]  219 	call	_cpct_drawCharM0
   4CE7 F1            [10]  220 	pop	af
   4CE8 33            [ 6]  221 	inc	sp
   4CE9 21 0A 00      [10]  222 	ld	hl,#0x000A
   4CEC E3            [19]  223 	ex	(sp),hl
   4CED DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4CF0 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4CF3 E5            [11]  226 	push	hl
   4CF4 CD AE 53      [17]  227 	call	__divuint
   4CF7 F1            [10]  228 	pop	af
   4CF8 F1            [10]  229 	pop	af
   4CF9 11 0A 00      [10]  230 	ld	de,#0x000A
   4CFC D5            [11]  231 	push	de
   4CFD E5            [11]  232 	push	hl
   4CFE CD 7D 56      [17]  233 	call	__moduint
   4D01 F1            [10]  234 	pop	af
   4D02 F1            [10]  235 	pop	af
   4D03 C1            [10]  236 	pop	bc
   4D04 7D            [ 4]  237 	ld	a,l
   4D05 C6 30         [ 7]  238 	add	a, #0x30
   4D07 67            [ 4]  239 	ld	h,a
   4D08 79            [ 4]  240 	ld	a,c
   4D09 C6 0C         [ 7]  241 	add	a, #0x0C
   4D0B 5F            [ 4]  242 	ld	e,a
   4D0C 78            [ 4]  243 	ld	a,b
   4D0D CE 00         [ 7]  244 	adc	a, #0x00
   4D0F 57            [ 4]  245 	ld	d,a
   4D10 C5            [11]  246 	push	bc
   4D11 E5            [11]  247 	push	hl
   4D12 33            [ 6]  248 	inc	sp
   4D13 21 02 00      [10]  249 	ld	hl,#0x0002
   4D16 E5            [11]  250 	push	hl
   4D17 D5            [11]  251 	push	de
   4D18 CD E0 55      [17]  252 	call	_cpct_drawCharM0
   4D1B F1            [10]  253 	pop	af
   4D1C 33            [ 6]  254 	inc	sp
   4D1D 21 0A 00      [10]  255 	ld	hl,#0x000A
   4D20 E3            [19]  256 	ex	(sp),hl
   4D21 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4D24 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4D27 E5            [11]  259 	push	hl
   4D28 CD 7D 56      [17]  260 	call	__moduint
   4D2B F1            [10]  261 	pop	af
   4D2C F1            [10]  262 	pop	af
   4D2D C1            [10]  263 	pop	bc
   4D2E 7D            [ 4]  264 	ld	a,l
   4D2F C6 30         [ 7]  265 	add	a, #0x30
   4D31 57            [ 4]  266 	ld	d,a
   4D32 21 10 00      [10]  267 	ld	hl,#0x0010
   4D35 09            [11]  268 	add	hl,bc
   4D36 4D            [ 4]  269 	ld	c,l
   4D37 44            [ 4]  270 	ld	b,h
   4D38 D5            [11]  271 	push	de
   4D39 33            [ 6]  272 	inc	sp
   4D3A 21 02 00      [10]  273 	ld	hl,#0x0002
   4D3D E5            [11]  274 	push	hl
   4D3E C5            [11]  275 	push	bc
   4D3F CD E0 55      [17]  276 	call	_cpct_drawCharM0
   4D42 F1            [10]  277 	pop	af
   4D43 F1            [10]  278 	pop	af
   4D44 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4D45                     281 00102$:
   4D45 18 FE         [12]  282 	jr	00102$
   4D47                     283 ___str_0:
   4D47 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4D50 00                  285 	.db 0x00
   4D51                     286 ___str_1:
   4D51 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4D58 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4D59                     293 _borrarPantalla::
   4D59 DD E5         [15]  294 	push	ix
   4D5B DD 21 00 00   [14]  295 	ld	ix,#0
   4D5F DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4D61 3E 28         [ 7]  298 	ld	a,#0x28
   4D63 DD 96 06      [19]  299 	sub	a, 6 (ix)
   4D66 3E 00         [ 7]  300 	ld	a,#0x00
   4D68 17            [ 4]  301 	rla
   4D69 4F            [ 4]  302 	ld	c,a
   4D6A CB 41         [ 8]  303 	bit	0,c
   4D6C 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4D6E DD 66 05      [19]  306 	ld	h,5 (ix)
   4D71 DD 6E 04      [19]  307 	ld	l,4 (ix)
   4D74 E5            [11]  308 	push	hl
   4D75 21 00 C0      [10]  309 	ld	hl,#0xC000
   4D78 E5            [11]  310 	push	hl
   4D79 CD 6F 60      [17]  311 	call	_cpct_getScreenPtr
   4D7C 4D            [ 4]  312 	ld	c,l
   4D7D 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4D7E DD 66 07      [19]  315 	ld	h,7 (ix)
   4D81 DD 6E 06      [19]  316 	ld	l,6 (ix)
   4D84 E5            [11]  317 	push	hl
   4D85 AF            [ 4]  318 	xor	a, a
   4D86 F5            [11]  319 	push	af
   4D87 33            [ 6]  320 	inc	sp
   4D88 C5            [11]  321 	push	bc
   4D89 CD 6C 57      [17]  322 	call	_cpct_drawSolidBox
   4D8C F1            [10]  323 	pop	af
   4D8D F1            [10]  324 	pop	af
   4D8E 33            [ 6]  325 	inc	sp
   4D8F 18 51         [12]  326 	jr	00106$
   4D91                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4D91 CB 41         [ 8]  329 	bit	0,c
   4D93 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4D95 DD 66 05      [19]  332 	ld	h,5 (ix)
   4D98 DD 6E 04      [19]  333 	ld	l,4 (ix)
   4D9B E5            [11]  334 	push	hl
   4D9C 21 00 C0      [10]  335 	ld	hl,#0xC000
   4D9F E5            [11]  336 	push	hl
   4DA0 CD 6F 60      [17]  337 	call	_cpct_getScreenPtr
   4DA3 4D            [ 4]  338 	ld	c,l
   4DA4 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4DA5 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4DA8 F5            [11]  342 	push	af
   4DA9 33            [ 6]  343 	inc	sp
   4DAA 21 00 28      [10]  344 	ld	hl,#0x2800
   4DAD E5            [11]  345 	push	hl
   4DAE C5            [11]  346 	push	bc
   4DAF CD 6C 57      [17]  347 	call	_cpct_drawSolidBox
   4DB2 F1            [10]  348 	pop	af
   4DB3 F1            [10]  349 	pop	af
   4DB4 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4DB5 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4DB8 C6 28         [ 7]  353 	add	a, #0x28
   4DBA 47            [ 4]  354 	ld	b,a
   4DBB DD 7E 05      [19]  355 	ld	a,5 (ix)
   4DBE F5            [11]  356 	push	af
   4DBF 33            [ 6]  357 	inc	sp
   4DC0 C5            [11]  358 	push	bc
   4DC1 33            [ 6]  359 	inc	sp
   4DC2 21 00 C0      [10]  360 	ld	hl,#0xC000
   4DC5 E5            [11]  361 	push	hl
   4DC6 CD 6F 60      [17]  362 	call	_cpct_getScreenPtr
   4DC9 4D            [ 4]  363 	ld	c,l
   4DCA 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4DCB DD 7E 06      [19]  366 	ld	a,6 (ix)
   4DCE C6 D8         [ 7]  367 	add	a,#0xD8
   4DD0 57            [ 4]  368 	ld	d,a
   4DD1 DD 7E 07      [19]  369 	ld	a,7 (ix)
   4DD4 F5            [11]  370 	push	af
   4DD5 33            [ 6]  371 	inc	sp
   4DD6 D5            [11]  372 	push	de
   4DD7 33            [ 6]  373 	inc	sp
   4DD8 AF            [ 4]  374 	xor	a, a
   4DD9 F5            [11]  375 	push	af
   4DDA 33            [ 6]  376 	inc	sp
   4DDB C5            [11]  377 	push	bc
   4DDC CD 6C 57      [17]  378 	call	_cpct_drawSolidBox
   4DDF F1            [10]  379 	pop	af
   4DE0 F1            [10]  380 	pop	af
   4DE1 33            [ 6]  381 	inc	sp
   4DE2                     382 00106$:
   4DE2 DD E1         [14]  383 	pop	ix
   4DE4 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4DE5                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4DE5 21 50 82      [10]  391 	ld	hl,#0x8250
   4DE8 E5            [11]  392 	push	hl
   4DE9 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4DEC E5            [11]  394 	push	hl
   4DED CD 59 4D      [17]  395 	call	_borrarPantalla
   4DF0 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4DF1 21 10 55      [10]  398 	ld	hl, #0x5510
   4DF4 E3            [19]  399 	ex	(sp),hl
   4DF5 21 00 C0      [10]  400 	ld	hl,#0xC000
   4DF8 E5            [11]  401 	push	hl
   4DF9 CD 6F 60      [17]  402 	call	_cpct_getScreenPtr
   4DFC 4D            [ 4]  403 	ld	c,l
   4DFD 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4DFE 21 02 00      [10]  406 	ld	hl,#0x0002
   4E01 E5            [11]  407 	push	hl
   4E02 C5            [11]  408 	push	bc
   4E03 21 D3 4E      [10]  409 	ld	hl,#___str_2
   4E06 E5            [11]  410 	push	hl
   4E07 CD 88 54      [17]  411 	call	_cpct_drawStringM0
   4E0A 21 06 00      [10]  412 	ld	hl,#6
   4E0D 39            [11]  413 	add	hl,sp
   4E0E F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4E0F 21 04 73      [10]  416 	ld	hl,#0x7304
   4E12 E5            [11]  417 	push	hl
   4E13 21 00 C0      [10]  418 	ld	hl,#0xC000
   4E16 E5            [11]  419 	push	hl
   4E17 CD 6F 60      [17]  420 	call	_cpct_getScreenPtr
   4E1A 4D            [ 4]  421 	ld	c,l
   4E1B 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E1C 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4E1F E5            [11]  425 	push	hl
   4E20 C5            [11]  426 	push	bc
   4E21 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4E24 E5            [11]  428 	push	hl
   4E25 CD AC 54      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4E28 21 0E 73      [10]  431 	ld	hl,#0x730E
   4E2B E5            [11]  432 	push	hl
   4E2C 21 00 C0      [10]  433 	ld	hl,#0xC000
   4E2F E5            [11]  434 	push	hl
   4E30 CD 6F 60      [17]  435 	call	_cpct_getScreenPtr
   4E33 4D            [ 4]  436 	ld	c,l
   4E34 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E35 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4E38 E5            [11]  440 	push	hl
   4E39 C5            [11]  441 	push	bc
   4E3A 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4E3D E5            [11]  443 	push	hl
   4E3E CD AC 54      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4E41 21 18 73      [10]  446 	ld	hl,#0x7318
   4E44 E5            [11]  447 	push	hl
   4E45 21 00 C0      [10]  448 	ld	hl,#0xC000
   4E48 E5            [11]  449 	push	hl
   4E49 CD 6F 60      [17]  450 	call	_cpct_getScreenPtr
   4E4C 4D            [ 4]  451 	ld	c,l
   4E4D 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E4E 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4E51 E5            [11]  455 	push	hl
   4E52 C5            [11]  456 	push	bc
   4E53 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4E56 E5            [11]  458 	push	hl
   4E57 CD AC 54      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4E5A 21 22 73      [10]  461 	ld	hl,#0x7322
   4E5D E5            [11]  462 	push	hl
   4E5E 21 00 C0      [10]  463 	ld	hl,#0xC000
   4E61 E5            [11]  464 	push	hl
   4E62 CD 6F 60      [17]  465 	call	_cpct_getScreenPtr
   4E65 4D            [ 4]  466 	ld	c,l
   4E66 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4E67 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4E6A E5            [11]  470 	push	hl
   4E6B C5            [11]  471 	push	bc
   4E6C 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4E6F E5            [11]  473 	push	hl
   4E70 CD AC 54      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4E73 21 2D 73      [10]  476 	ld	hl,#0x732D
   4E76 E5            [11]  477 	push	hl
   4E77 21 00 C0      [10]  478 	ld	hl,#0xC000
   4E7A E5            [11]  479 	push	hl
   4E7B CD 6F 60      [17]  480 	call	_cpct_getScreenPtr
   4E7E 4D            [ 4]  481 	ld	c,l
   4E7F 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4E80 21 02 00      [10]  484 	ld	hl,#0x0002
   4E83 E5            [11]  485 	push	hl
   4E84 C5            [11]  486 	push	bc
   4E85 21 E0 4E      [10]  487 	ld	hl,#___str_3
   4E88 E5            [11]  488 	push	hl
   4E89 CD 88 54      [17]  489 	call	_cpct_drawStringM0
   4E8C 21 06 00      [10]  490 	ld	hl,#6
   4E8F 39            [11]  491 	add	hl,sp
   4E90 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4E91 21 04 82      [10]  494 	ld	hl,#0x8204
   4E94 E5            [11]  495 	push	hl
   4E95 21 00 C0      [10]  496 	ld	hl,#0xC000
   4E98 E5            [11]  497 	push	hl
   4E99 CD 6F 60      [17]  498 	call	_cpct_getScreenPtr
   4E9C 4D            [ 4]  499 	ld	c,l
   4E9D 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4E9E 21 02 00      [10]  502 	ld	hl,#0x0002
   4EA1 E5            [11]  503 	push	hl
   4EA2 C5            [11]  504 	push	bc
   4EA3 21 E9 4E      [10]  505 	ld	hl,#___str_4
   4EA6 E5            [11]  506 	push	hl
   4EA7 CD 88 54      [17]  507 	call	_cpct_drawStringM0
   4EAA 21 06 00      [10]  508 	ld	hl,#6
   4EAD 39            [11]  509 	add	hl,sp
   4EAE F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4EAF                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4EAF CD EF 53      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4EB2 21 04 40      [10]  516 	ld	hl,#0x4004
   4EB5 CD 70 54      [17]  517 	call	_cpct_isKeyPressed
   4EB8 7D            [ 4]  518 	ld	a,l
   4EB9 B7            [ 4]  519 	or	a, a
   4EBA 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4EBC CD DB 4F      [17]  522 	call	_menuOpciones
   4EBF                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4EBF 21 07 10      [10]  525 	ld	hl,#0x1007
   4EC2 CD 70 54      [17]  526 	call	_cpct_isKeyPressed
   4EC5 7D            [ 4]  527 	ld	a,l
   4EC6 B7            [ 4]  528 	or	a, a
   4EC7 C0            [11]  529 	ret	NZ
   4EC8 21 04 40      [10]  530 	ld	hl,#0x4004
   4ECB CD 70 54      [17]  531 	call	_cpct_isKeyPressed
   4ECE 7D            [ 4]  532 	ld	a,l
   4ECF B7            [ 4]  533 	or	a, a
   4ED0 28 DD         [12]  534 	jr	Z,00104$
   4ED2 C9            [10]  535 	ret
   4ED3                     536 ___str_2:
   4ED3 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4EDF 00                  538 	.db 0x00
   4EE0                     539 ___str_3:
   4EE0 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4EE8 00                  541 	.db 0x00
   4EE9                     542 ___str_4:
   4EE9 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4EFB 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4EFC                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4EFC 21 50 82      [10]  551 	ld	hl,#0x8250
   4EFF E5            [11]  552 	push	hl
   4F00 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4F03 E5            [11]  554 	push	hl
   4F04 CD 59 4D      [17]  555 	call	_borrarPantalla
   4F07 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4F08 21 1A 46      [10]  558 	ld	hl, #0x461A
   4F0B E3            [19]  559 	ex	(sp),hl
   4F0C 21 00 C0      [10]  560 	ld	hl,#0xC000
   4F0F E5            [11]  561 	push	hl
   4F10 CD 6F 60      [17]  562 	call	_cpct_getScreenPtr
   4F13 4D            [ 4]  563 	ld	c,l
   4F14 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4F15 21 02 00      [10]  566 	ld	hl,#0x0002
   4F18 E5            [11]  567 	push	hl
   4F19 C5            [11]  568 	push	bc
   4F1A 21 A4 4F      [10]  569 	ld	hl,#___str_5
   4F1D E5            [11]  570 	push	hl
   4F1E CD 88 54      [17]  571 	call	_cpct_drawStringM0
   4F21 21 06 00      [10]  572 	ld	hl,#6
   4F24 39            [11]  573 	add	hl,sp
   4F25 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4F26 21 0A 64      [10]  576 	ld	hl,#0x640A
   4F29 E5            [11]  577 	push	hl
   4F2A 21 00 C0      [10]  578 	ld	hl,#0xC000
   4F2D E5            [11]  579 	push	hl
   4F2E CD 6F 60      [17]  580 	call	_cpct_getScreenPtr
   4F31 4D            [ 4]  581 	ld	c,l
   4F32 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4F33 21 02 00      [10]  584 	ld	hl,#0x0002
   4F36 E5            [11]  585 	push	hl
   4F37 C5            [11]  586 	push	bc
   4F38 21 AC 4F      [10]  587 	ld	hl,#___str_6
   4F3B E5            [11]  588 	push	hl
   4F3C CD 88 54      [17]  589 	call	_cpct_drawStringM0
   4F3F 21 06 00      [10]  590 	ld	hl,#6
   4F42 39            [11]  591 	add	hl,sp
   4F43 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4F44 21 0E 73      [10]  594 	ld	hl,#0x730E
   4F47 E5            [11]  595 	push	hl
   4F48 21 00 C0      [10]  596 	ld	hl,#0xC000
   4F4B E5            [11]  597 	push	hl
   4F4C CD 6F 60      [17]  598 	call	_cpct_getScreenPtr
   4F4F 4D            [ 4]  599 	ld	c,l
   4F50 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4F51 21 02 00      [10]  602 	ld	hl,#0x0002
   4F54 E5            [11]  603 	push	hl
   4F55 C5            [11]  604 	push	bc
   4F56 21 BC 4F      [10]  605 	ld	hl,#___str_7
   4F59 E5            [11]  606 	push	hl
   4F5A CD 88 54      [17]  607 	call	_cpct_drawStringM0
   4F5D 21 06 00      [10]  608 	ld	hl,#6
   4F60 39            [11]  609 	add	hl,sp
   4F61 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4F62 21 08 82      [10]  612 	ld	hl,#0x8208
   4F65 E5            [11]  613 	push	hl
   4F66 21 00 C0      [10]  614 	ld	hl,#0xC000
   4F69 E5            [11]  615 	push	hl
   4F6A CD 6F 60      [17]  616 	call	_cpct_getScreenPtr
   4F6D 4D            [ 4]  617 	ld	c,l
   4F6E 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4F6F 21 02 00      [10]  620 	ld	hl,#0x0002
   4F72 E5            [11]  621 	push	hl
   4F73 C5            [11]  622 	push	bc
   4F74 21 CA 4F      [10]  623 	ld	hl,#___str_8
   4F77 E5            [11]  624 	push	hl
   4F78 CD 88 54      [17]  625 	call	_cpct_drawStringM0
   4F7B 21 06 00      [10]  626 	ld	hl,#6
   4F7E 39            [11]  627 	add	hl,sp
   4F7F F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4F80                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4F80 CD EF 53      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4F83 21 04 40      [10]  634 	ld	hl,#0x4004
   4F86 CD 70 54      [17]  635 	call	_cpct_isKeyPressed
   4F89 7D            [ 4]  636 	ld	a,l
   4F8A B7            [ 4]  637 	or	a, a
   4F8B 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4F8D CD DB 4F      [17]  640 	call	_menuOpciones
   4F90                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4F90 21 07 10      [10]  643 	ld	hl,#0x1007
   4F93 CD 70 54      [17]  644 	call	_cpct_isKeyPressed
   4F96 7D            [ 4]  645 	ld	a,l
   4F97 B7            [ 4]  646 	or	a, a
   4F98 C0            [11]  647 	ret	NZ
   4F99 21 04 40      [10]  648 	ld	hl,#0x4004
   4F9C CD 70 54      [17]  649 	call	_cpct_isKeyPressed
   4F9F 7D            [ 4]  650 	ld	a,l
   4FA0 B7            [ 4]  651 	or	a, a
   4FA1 28 DD         [12]  652 	jr	Z,00104$
   4FA3 C9            [10]  653 	ret
   4FA4                     654 ___str_5:
   4FA4 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4FAB 00                  656 	.db 0x00
   4FAC                     657 ___str_6:
   4FAC 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4FBB 00                  659 	.db 0x00
   4FBC                     660 ___str_7:
   4FBC 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4FC9 00                  662 	.db 0x00
   4FCA                     663 ___str_8:
   4FCA 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4FDA 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4FDB                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4FDB 21 50 82      [10]  672 	ld	hl,#0x8250
   4FDE E5            [11]  673 	push	hl
   4FDF 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4FE2 E5            [11]  675 	push	hl
   4FE3 CD 59 4D      [17]  676 	call	_borrarPantalla
   4FE6 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4FE7 21 20 64      [10]  679 	ld	hl, #0x6420
   4FEA E3            [19]  680 	ex	(sp),hl
   4FEB 21 00 C0      [10]  681 	ld	hl,#0xC000
   4FEE E5            [11]  682 	push	hl
   4FEF CD 6F 60      [17]  683 	call	_cpct_getScreenPtr
   4FF2 4D            [ 4]  684 	ld	c,l
   4FF3 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4FF4 21 02 00      [10]  687 	ld	hl,#0x0002
   4FF7 E5            [11]  688 	push	hl
   4FF8 C5            [11]  689 	push	bc
   4FF9 21 7C 50      [10]  690 	ld	hl,#___str_9
   4FFC E5            [11]  691 	push	hl
   4FFD CD 88 54      [17]  692 	call	_cpct_drawStringM0
   5000 21 06 00      [10]  693 	ld	hl,#6
   5003 39            [11]  694 	add	hl,sp
   5004 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   5005 21 00 82      [10]  697 	ld	hl,#0x8200
   5008 E5            [11]  698 	push	hl
   5009 26 C0         [ 7]  699 	ld	h, #0xC0
   500B E5            [11]  700 	push	hl
   500C CD 6F 60      [17]  701 	call	_cpct_getScreenPtr
   500F 4D            [ 4]  702 	ld	c,l
   5010 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   5011 21 02 00      [10]  705 	ld	hl,#0x0002
   5014 E5            [11]  706 	push	hl
   5015 C5            [11]  707 	push	bc
   5016 21 81 50      [10]  708 	ld	hl,#___str_10
   5019 E5            [11]  709 	push	hl
   501A CD 88 54      [17]  710 	call	_cpct_drawStringM0
   501D 21 06 00      [10]  711 	ld	hl,#6
   5020 39            [11]  712 	add	hl,sp
   5021 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   5022 21 0A 91      [10]  715 	ld	hl,#0x910A
   5025 E5            [11]  716 	push	hl
   5026 21 00 C0      [10]  717 	ld	hl,#0xC000
   5029 E5            [11]  718 	push	hl
   502A CD 6F 60      [17]  719 	call	_cpct_getScreenPtr
   502D 4D            [ 4]  720 	ld	c,l
   502E 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   502F 21 02 00      [10]  723 	ld	hl,#0x0002
   5032 E5            [11]  724 	push	hl
   5033 C5            [11]  725 	push	bc
   5034 21 96 50      [10]  726 	ld	hl,#___str_11
   5037 E5            [11]  727 	push	hl
   5038 CD 88 54      [17]  728 	call	_cpct_drawStringM0
   503B 21 06 00      [10]  729 	ld	hl,#6
   503E 39            [11]  730 	add	hl,sp
   503F F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   5040                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   5040 CD EF 53      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   5043 21 04 08      [10]  737 	ld	hl,#0x0804
   5046 CD 70 54      [17]  738 	call	_cpct_isKeyPressed
   5049 7D            [ 4]  739 	ld	a,l
   504A B7            [ 4]  740 	or	a, a
   504B 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   504D CD E5 4D      [17]  743 	call	_menuInstrucciones
   5050 18 0D         [12]  744 	jr	00109$
   5052                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   5052 21 07 40      [10]  747 	ld	hl,#0x4007
   5055 CD 70 54      [17]  748 	call	_cpct_isKeyPressed
   5058 7D            [ 4]  749 	ld	a,l
   5059 B7            [ 4]  750 	or	a, a
   505A 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   505C CD FC 4E      [17]  753 	call	_menuCreditos
   505F                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   505F 21 07 10      [10]  756 	ld	hl,#0x1007
   5062 CD 70 54      [17]  757 	call	_cpct_isKeyPressed
   5065 7D            [ 4]  758 	ld	a,l
   5066 B7            [ 4]  759 	or	a, a
   5067 C0            [11]  760 	ret	NZ
   5068 21 04 08      [10]  761 	ld	hl,#0x0804
   506B CD 70 54      [17]  762 	call	_cpct_isKeyPressed
   506E 7D            [ 4]  763 	ld	a,l
   506F B7            [ 4]  764 	or	a, a
   5070 C0            [11]  765 	ret	NZ
   5071 21 07 40      [10]  766 	ld	hl,#0x4007
   5074 CD 70 54      [17]  767 	call	_cpct_isKeyPressed
   5077 7D            [ 4]  768 	ld	a,l
   5078 B7            [ 4]  769 	or	a, a
   5079 28 C5         [12]  770 	jr	Z,00108$
   507B C9            [10]  771 	ret
   507C                     772 ___str_9:
   507C 4D 45 4E 55         773 	.ascii "MENU"
   5080 00                  774 	.db 0x00
   5081                     775 ___str_10:
   5081 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   5095 00                  777 	.db 0x00
   5096                     778 ___str_11:
   5096 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   50A5 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   50A6                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   50A6 21 00 40      [10]  787 	ld	hl,#0x4000
   50A9 E5            [11]  788 	push	hl
   50AA AF            [ 4]  789 	xor	a, a
   50AB F5            [11]  790 	push	af
   50AC 33            [ 6]  791 	inc	sp
   50AD 26 C0         [ 7]  792 	ld	h, #0xC0
   50AF E5            [11]  793 	push	hl
   50B0 CD 4E 57      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   50B3 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   50B6 E5            [11]  797 	push	hl
   50B7 21 00 C0      [10]  798 	ld	hl,#0xC000
   50BA E5            [11]  799 	push	hl
   50BB CD 6F 60      [17]  800 	call	_cpct_getScreenPtr
   50BE 4D            [ 4]  801 	ld	c,l
   50BF 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   50C0 21 04 00      [10]  804 	ld	hl,#0x0004
   50C3 E5            [11]  805 	push	hl
   50C4 C5            [11]  806 	push	bc
   50C5 21 5C 51      [10]  807 	ld	hl,#___str_12
   50C8 E5            [11]  808 	push	hl
   50C9 CD 88 54      [17]  809 	call	_cpct_drawStringM0
   50CC 21 06 00      [10]  810 	ld	hl,#6
   50CF 39            [11]  811 	add	hl,sp
   50D0 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   50D1 21 28 6E      [10]  814 	ld	hl,#0x6E28
   50D4 E5            [11]  815 	push	hl
   50D5 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   50D8 E5            [11]  817 	push	hl
   50D9 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   50DC E5            [11]  819 	push	hl
   50DD CD AC 54      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   50E0 21 28 6E      [10]  822 	ld	hl,#0x6E28
   50E3 E5            [11]  823 	push	hl
   50E4 21 18 F1      [10]  824 	ld	hl,#0xF118
   50E7 E5            [11]  825 	push	hl
   50E8 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   50EB E5            [11]  827 	push	hl
   50EC CD AC 54      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   50EF 21 08 A0      [10]  830 	ld	hl,#0xA008
   50F2 E5            [11]  831 	push	hl
   50F3 21 00 C0      [10]  832 	ld	hl,#0xC000
   50F6 E5            [11]  833 	push	hl
   50F7 CD 6F 60      [17]  834 	call	_cpct_getScreenPtr
   50FA 4D            [ 4]  835 	ld	c,l
   50FB 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   50FC 21 02 00      [10]  838 	ld	hl,#0x0002
   50FF E5            [11]  839 	push	hl
   5100 C5            [11]  840 	push	bc
   5101 21 64 51      [10]  841 	ld	hl,#___str_13
   5104 E5            [11]  842 	push	hl
   5105 CD 88 54      [17]  843 	call	_cpct_drawStringM0
   5108 21 06 00      [10]  844 	ld	hl,#6
   510B 39            [11]  845 	add	hl,sp
   510C F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   510D 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   5110 E5            [11]  849 	push	hl
   5111 21 00 C0      [10]  850 	ld	hl,#0xC000
   5114 E5            [11]  851 	push	hl
   5115 CD 6F 60      [17]  852 	call	_cpct_getScreenPtr
   5118 4D            [ 4]  853 	ld	c,l
   5119 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   511A 21 02 00      [10]  856 	ld	hl,#0x0002
   511D E5            [11]  857 	push	hl
   511E C5            [11]  858 	push	bc
   511F 21 75 51      [10]  859 	ld	hl,#___str_14
   5122 E5            [11]  860 	push	hl
   5123 CD 88 54      [17]  861 	call	_cpct_drawStringM0
   5126 21 06 00      [10]  862 	ld	hl,#6
   5129 39            [11]  863 	add	hl,sp
   512A F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   512B                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   512B CD EF 53      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   512E 21 04 40      [10]  870 	ld	hl,#0x4004
   5131 CD 70 54      [17]  871 	call	_cpct_isKeyPressed
   5134 7D            [ 4]  872 	ld	a,l
   5135 B7            [ 4]  873 	or	a, a
   5136 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   5138 CD EF 53      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   513B                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   513B CD DB 4F      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   513E 21 07 10      [10]  882 	ld	hl,#0x1007
   5141 CD 70 54      [17]  883 	call	_cpct_isKeyPressed
   5144 7D            [ 4]  884 	ld	a,l
   5145 B7            [ 4]  885 	or	a, a
   5146 28 F3         [12]  886 	jr	Z,00101$
   5148                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5148 21 07 10      [10]  889 	ld	hl,#0x1007
   514B CD 70 54      [17]  890 	call	_cpct_isKeyPressed
   514E 7D            [ 4]  891 	ld	a,l
   514F B7            [ 4]  892 	or	a, a
   5150 C0            [11]  893 	ret	NZ
   5151 21 04 40      [10]  894 	ld	hl,#0x4004
   5154 CD 70 54      [17]  895 	call	_cpct_isKeyPressed
   5157 7D            [ 4]  896 	ld	a,l
   5158 B7            [ 4]  897 	or	a, a
   5159 28 D0         [12]  898 	jr	Z,00107$
   515B C9            [10]  899 	ret
   515C                     900 ___str_12:
   515C 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   5163 00                  902 	.db 0x00
   5164                     903 ___str_13:
   5164 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   5174 00                  905 	.db 0x00
   5175                     906 ___str_14:
   5175 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   5184 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
