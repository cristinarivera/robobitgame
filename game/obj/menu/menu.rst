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
   4A39                      60 _menuFin::
   4A39 DD E5         [15]   61 	push	ix
   4A3B DD 21 00 00   [14]   62 	ld	ix,#0
   4A3F DD 39         [15]   63 	add	ix,sp
   4A41 F5            [11]   64 	push	af
   4A42 F5            [11]   65 	push	af
   4A43 DD 75 FE      [19]   66 	ld	-2 (ix),l
   4A46 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4A49 21 10 27      [10]   69 	ld	hl,#0x2710
   4A4C E5            [11]   70 	push	hl
   4A4D DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4A50 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4A53 E5            [11]   73 	push	hl
   4A54 CD DD 51      [17]   74 	call	__divuint
   4A57 F1            [10]   75 	pop	af
   4A58 F1            [10]   76 	pop	af
   4A59 33            [ 6]   77 	inc	sp
   4A5A 33            [ 6]   78 	inc	sp
   4A5B E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4A5C 21 00 40      [10]   81 	ld	hl,#0x4000
   4A5F E5            [11]   82 	push	hl
   4A60 AF            [ 4]   83 	xor	a, a
   4A61 F5            [11]   84 	push	af
   4A62 33            [ 6]   85 	inc	sp
   4A63 26 C0         [ 7]   86 	ld	h, #0xC0
   4A65 E5            [11]   87 	push	hl
   4A66 CD 66 55      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4A69 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4A6C E5            [11]   91 	push	hl
   4A6D 21 00 C0      [10]   92 	ld	hl,#0xC000
   4A70 E5            [11]   93 	push	hl
   4A71 CD 9E 5E      [17]   94 	call	_cpct_getScreenPtr
   4A74 4D            [ 4]   95 	ld	c,l
   4A75 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4A76 21 02 00      [10]   98 	ld	hl,#0x0002
   4A79 E5            [11]   99 	push	hl
   4A7A C5            [11]  100 	push	bc
   4A7B 21 9B 4B      [10]  101 	ld	hl,#___str_0
   4A7E E5            [11]  102 	push	hl
   4A7F CD B7 52      [17]  103 	call	_cpct_drawStringM0
   4A82 21 06 00      [10]  104 	ld	hl,#6
   4A85 39            [11]  105 	add	hl,sp
   4A86 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4A87 21 14 78      [10]  108 	ld	hl,#0x7814
   4A8A E5            [11]  109 	push	hl
   4A8B 21 00 C0      [10]  110 	ld	hl,#0xC000
   4A8E E5            [11]  111 	push	hl
   4A8F CD 9E 5E      [17]  112 	call	_cpct_getScreenPtr
   4A92 4D            [ 4]  113 	ld	c,l
   4A93 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4A94 21 02 00      [10]  116 	ld	hl,#0x0002
   4A97 E5            [11]  117 	push	hl
   4A98 C5            [11]  118 	push	bc
   4A99 21 A5 4B      [10]  119 	ld	hl,#___str_1
   4A9C E5            [11]  120 	push	hl
   4A9D CD B7 52      [17]  121 	call	_cpct_drawStringM0
   4AA0 21 06 00      [10]  122 	ld	hl,#6
   4AA3 39            [11]  123 	add	hl,sp
   4AA4 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4AA5 21 2D 78      [10]  126 	ld	hl,#0x782D
   4AA8 E5            [11]  127 	push	hl
   4AA9 21 00 C0      [10]  128 	ld	hl,#0xC000
   4AAC E5            [11]  129 	push	hl
   4AAD CD 9E 5E      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4AB0 E5            [11]  132 	push	hl
   4AB1 21 0A 00      [10]  133 	ld	hl,#0x000A
   4AB4 E5            [11]  134 	push	hl
   4AB5 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4AB8 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4ABB E5            [11]  137 	push	hl
   4ABC CD 93 5E      [17]  138 	call	__moduint
   4ABF F1            [10]  139 	pop	af
   4AC0 F1            [10]  140 	pop	af
   4AC1 C1            [10]  141 	pop	bc
   4AC2 7D            [ 4]  142 	ld	a,l
   4AC3 C6 30         [ 7]  143 	add	a, #0x30
   4AC5 67            [ 4]  144 	ld	h,a
   4AC6 59            [ 4]  145 	ld	e, c
   4AC7 50            [ 4]  146 	ld	d, b
   4AC8 C5            [11]  147 	push	bc
   4AC9 E5            [11]  148 	push	hl
   4ACA 33            [ 6]  149 	inc	sp
   4ACB 21 02 00      [10]  150 	ld	hl,#0x0002
   4ACE E5            [11]  151 	push	hl
   4ACF D5            [11]  152 	push	de
   4AD0 CD 0F 54      [17]  153 	call	_cpct_drawCharM0
   4AD3 F1            [10]  154 	pop	af
   4AD4 33            [ 6]  155 	inc	sp
   4AD5 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4AD8 E3            [19]  157 	ex	(sp),hl
   4AD9 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4ADC DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4ADF E5            [11]  160 	push	hl
   4AE0 CD DD 51      [17]  161 	call	__divuint
   4AE3 F1            [10]  162 	pop	af
   4AE4 F1            [10]  163 	pop	af
   4AE5 11 0A 00      [10]  164 	ld	de,#0x000A
   4AE8 D5            [11]  165 	push	de
   4AE9 E5            [11]  166 	push	hl
   4AEA CD 93 5E      [17]  167 	call	__moduint
   4AED F1            [10]  168 	pop	af
   4AEE F1            [10]  169 	pop	af
   4AEF C1            [10]  170 	pop	bc
   4AF0 7D            [ 4]  171 	ld	a,l
   4AF1 C6 30         [ 7]  172 	add	a, #0x30
   4AF3 67            [ 4]  173 	ld	h,a
   4AF4 79            [ 4]  174 	ld	a,c
   4AF5 C6 04         [ 7]  175 	add	a, #0x04
   4AF7 5F            [ 4]  176 	ld	e,a
   4AF8 78            [ 4]  177 	ld	a,b
   4AF9 CE 00         [ 7]  178 	adc	a, #0x00
   4AFB 57            [ 4]  179 	ld	d,a
   4AFC C5            [11]  180 	push	bc
   4AFD E5            [11]  181 	push	hl
   4AFE 33            [ 6]  182 	inc	sp
   4AFF 21 02 00      [10]  183 	ld	hl,#0x0002
   4B02 E5            [11]  184 	push	hl
   4B03 D5            [11]  185 	push	de
   4B04 CD 0F 54      [17]  186 	call	_cpct_drawCharM0
   4B07 F1            [10]  187 	pop	af
   4B08 33            [ 6]  188 	inc	sp
   4B09 21 64 00      [10]  189 	ld	hl,#0x0064
   4B0C E3            [19]  190 	ex	(sp),hl
   4B0D DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4B10 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4B13 E5            [11]  193 	push	hl
   4B14 CD DD 51      [17]  194 	call	__divuint
   4B17 F1            [10]  195 	pop	af
   4B18 F1            [10]  196 	pop	af
   4B19 11 0A 00      [10]  197 	ld	de,#0x000A
   4B1C D5            [11]  198 	push	de
   4B1D E5            [11]  199 	push	hl
   4B1E CD 93 5E      [17]  200 	call	__moduint
   4B21 F1            [10]  201 	pop	af
   4B22 F1            [10]  202 	pop	af
   4B23 C1            [10]  203 	pop	bc
   4B24 7D            [ 4]  204 	ld	a,l
   4B25 C6 30         [ 7]  205 	add	a, #0x30
   4B27 67            [ 4]  206 	ld	h,a
   4B28 79            [ 4]  207 	ld	a,c
   4B29 C6 08         [ 7]  208 	add	a, #0x08
   4B2B 5F            [ 4]  209 	ld	e,a
   4B2C 78            [ 4]  210 	ld	a,b
   4B2D CE 00         [ 7]  211 	adc	a, #0x00
   4B2F 57            [ 4]  212 	ld	d,a
   4B30 C5            [11]  213 	push	bc
   4B31 E5            [11]  214 	push	hl
   4B32 33            [ 6]  215 	inc	sp
   4B33 21 02 00      [10]  216 	ld	hl,#0x0002
   4B36 E5            [11]  217 	push	hl
   4B37 D5            [11]  218 	push	de
   4B38 CD 0F 54      [17]  219 	call	_cpct_drawCharM0
   4B3B F1            [10]  220 	pop	af
   4B3C 33            [ 6]  221 	inc	sp
   4B3D 21 0A 00      [10]  222 	ld	hl,#0x000A
   4B40 E3            [19]  223 	ex	(sp),hl
   4B41 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4B44 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4B47 E5            [11]  226 	push	hl
   4B48 CD DD 51      [17]  227 	call	__divuint
   4B4B F1            [10]  228 	pop	af
   4B4C F1            [10]  229 	pop	af
   4B4D 11 0A 00      [10]  230 	ld	de,#0x000A
   4B50 D5            [11]  231 	push	de
   4B51 E5            [11]  232 	push	hl
   4B52 CD 93 5E      [17]  233 	call	__moduint
   4B55 F1            [10]  234 	pop	af
   4B56 F1            [10]  235 	pop	af
   4B57 C1            [10]  236 	pop	bc
   4B58 7D            [ 4]  237 	ld	a,l
   4B59 C6 30         [ 7]  238 	add	a, #0x30
   4B5B 67            [ 4]  239 	ld	h,a
   4B5C 79            [ 4]  240 	ld	a,c
   4B5D C6 0C         [ 7]  241 	add	a, #0x0C
   4B5F 5F            [ 4]  242 	ld	e,a
   4B60 78            [ 4]  243 	ld	a,b
   4B61 CE 00         [ 7]  244 	adc	a, #0x00
   4B63 57            [ 4]  245 	ld	d,a
   4B64 C5            [11]  246 	push	bc
   4B65 E5            [11]  247 	push	hl
   4B66 33            [ 6]  248 	inc	sp
   4B67 21 02 00      [10]  249 	ld	hl,#0x0002
   4B6A E5            [11]  250 	push	hl
   4B6B D5            [11]  251 	push	de
   4B6C CD 0F 54      [17]  252 	call	_cpct_drawCharM0
   4B6F F1            [10]  253 	pop	af
   4B70 33            [ 6]  254 	inc	sp
   4B71 21 0A 00      [10]  255 	ld	hl,#0x000A
   4B74 E3            [19]  256 	ex	(sp),hl
   4B75 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4B78 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4B7B E5            [11]  259 	push	hl
   4B7C CD 93 5E      [17]  260 	call	__moduint
   4B7F F1            [10]  261 	pop	af
   4B80 F1            [10]  262 	pop	af
   4B81 C1            [10]  263 	pop	bc
   4B82 7D            [ 4]  264 	ld	a,l
   4B83 C6 30         [ 7]  265 	add	a, #0x30
   4B85 57            [ 4]  266 	ld	d,a
   4B86 21 10 00      [10]  267 	ld	hl,#0x0010
   4B89 09            [11]  268 	add	hl,bc
   4B8A 4D            [ 4]  269 	ld	c,l
   4B8B 44            [ 4]  270 	ld	b,h
   4B8C D5            [11]  271 	push	de
   4B8D 33            [ 6]  272 	inc	sp
   4B8E 21 02 00      [10]  273 	ld	hl,#0x0002
   4B91 E5            [11]  274 	push	hl
   4B92 C5            [11]  275 	push	bc
   4B93 CD 0F 54      [17]  276 	call	_cpct_drawCharM0
   4B96 F1            [10]  277 	pop	af
   4B97 F1            [10]  278 	pop	af
   4B98 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4B99                     281 00102$:
   4B99 18 FE         [12]  282 	jr	00102$
   4B9B                     283 ___str_0:
   4B9B 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4BA4 00                  285 	.db 0x00
   4BA5                     286 ___str_1:
   4BA5 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4BAC 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4BAD                     293 _borrarPantalla::
   4BAD DD E5         [15]  294 	push	ix
   4BAF DD 21 00 00   [14]  295 	ld	ix,#0
   4BB3 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4BB5 3E 28         [ 7]  298 	ld	a,#0x28
   4BB7 DD 96 06      [19]  299 	sub	a, 6 (ix)
   4BBA 3E 00         [ 7]  300 	ld	a,#0x00
   4BBC 17            [ 4]  301 	rla
   4BBD 4F            [ 4]  302 	ld	c,a
   4BBE CB 41         [ 8]  303 	bit	0,c
   4BC0 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4BC2 DD 66 05      [19]  306 	ld	h,5 (ix)
   4BC5 DD 6E 04      [19]  307 	ld	l,4 (ix)
   4BC8 E5            [11]  308 	push	hl
   4BC9 21 00 C0      [10]  309 	ld	hl,#0xC000
   4BCC E5            [11]  310 	push	hl
   4BCD CD 9E 5E      [17]  311 	call	_cpct_getScreenPtr
   4BD0 4D            [ 4]  312 	ld	c,l
   4BD1 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4BD2 DD 66 07      [19]  315 	ld	h,7 (ix)
   4BD5 DD 6E 06      [19]  316 	ld	l,6 (ix)
   4BD8 E5            [11]  317 	push	hl
   4BD9 AF            [ 4]  318 	xor	a, a
   4BDA F5            [11]  319 	push	af
   4BDB 33            [ 6]  320 	inc	sp
   4BDC C5            [11]  321 	push	bc
   4BDD CD 84 55      [17]  322 	call	_cpct_drawSolidBox
   4BE0 F1            [10]  323 	pop	af
   4BE1 F1            [10]  324 	pop	af
   4BE2 33            [ 6]  325 	inc	sp
   4BE3 18 51         [12]  326 	jr	00106$
   4BE5                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4BE5 CB 41         [ 8]  329 	bit	0,c
   4BE7 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4BE9 DD 66 05      [19]  332 	ld	h,5 (ix)
   4BEC DD 6E 04      [19]  333 	ld	l,4 (ix)
   4BEF E5            [11]  334 	push	hl
   4BF0 21 00 C0      [10]  335 	ld	hl,#0xC000
   4BF3 E5            [11]  336 	push	hl
   4BF4 CD 9E 5E      [17]  337 	call	_cpct_getScreenPtr
   4BF7 4D            [ 4]  338 	ld	c,l
   4BF8 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4BF9 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4BFC F5            [11]  342 	push	af
   4BFD 33            [ 6]  343 	inc	sp
   4BFE 21 00 28      [10]  344 	ld	hl,#0x2800
   4C01 E5            [11]  345 	push	hl
   4C02 C5            [11]  346 	push	bc
   4C03 CD 84 55      [17]  347 	call	_cpct_drawSolidBox
   4C06 F1            [10]  348 	pop	af
   4C07 F1            [10]  349 	pop	af
   4C08 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4C09 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4C0C C6 28         [ 7]  353 	add	a, #0x28
   4C0E 47            [ 4]  354 	ld	b,a
   4C0F DD 7E 05      [19]  355 	ld	a,5 (ix)
   4C12 F5            [11]  356 	push	af
   4C13 33            [ 6]  357 	inc	sp
   4C14 C5            [11]  358 	push	bc
   4C15 33            [ 6]  359 	inc	sp
   4C16 21 00 C0      [10]  360 	ld	hl,#0xC000
   4C19 E5            [11]  361 	push	hl
   4C1A CD 9E 5E      [17]  362 	call	_cpct_getScreenPtr
   4C1D 4D            [ 4]  363 	ld	c,l
   4C1E 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C1F DD 7E 06      [19]  366 	ld	a,6 (ix)
   4C22 C6 D8         [ 7]  367 	add	a,#0xD8
   4C24 57            [ 4]  368 	ld	d,a
   4C25 DD 7E 07      [19]  369 	ld	a,7 (ix)
   4C28 F5            [11]  370 	push	af
   4C29 33            [ 6]  371 	inc	sp
   4C2A D5            [11]  372 	push	de
   4C2B 33            [ 6]  373 	inc	sp
   4C2C AF            [ 4]  374 	xor	a, a
   4C2D F5            [11]  375 	push	af
   4C2E 33            [ 6]  376 	inc	sp
   4C2F C5            [11]  377 	push	bc
   4C30 CD 84 55      [17]  378 	call	_cpct_drawSolidBox
   4C33 F1            [10]  379 	pop	af
   4C34 F1            [10]  380 	pop	af
   4C35 33            [ 6]  381 	inc	sp
   4C36                     382 00106$:
   4C36 DD E1         [14]  383 	pop	ix
   4C38 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4C39                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4C39 21 50 82      [10]  391 	ld	hl,#0x8250
   4C3C E5            [11]  392 	push	hl
   4C3D 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4C40 E5            [11]  394 	push	hl
   4C41 CD AD 4B      [17]  395 	call	_borrarPantalla
   4C44 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4C45 21 10 55      [10]  398 	ld	hl, #0x5510
   4C48 E3            [19]  399 	ex	(sp),hl
   4C49 21 00 C0      [10]  400 	ld	hl,#0xC000
   4C4C E5            [11]  401 	push	hl
   4C4D CD 9E 5E      [17]  402 	call	_cpct_getScreenPtr
   4C50 4D            [ 4]  403 	ld	c,l
   4C51 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4C52 21 02 00      [10]  406 	ld	hl,#0x0002
   4C55 E5            [11]  407 	push	hl
   4C56 C5            [11]  408 	push	bc
   4C57 21 27 4D      [10]  409 	ld	hl,#___str_2
   4C5A E5            [11]  410 	push	hl
   4C5B CD B7 52      [17]  411 	call	_cpct_drawStringM0
   4C5E 21 06 00      [10]  412 	ld	hl,#6
   4C61 39            [11]  413 	add	hl,sp
   4C62 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4C63 21 04 73      [10]  416 	ld	hl,#0x7304
   4C66 E5            [11]  417 	push	hl
   4C67 21 00 C0      [10]  418 	ld	hl,#0xC000
   4C6A E5            [11]  419 	push	hl
   4C6B CD 9E 5E      [17]  420 	call	_cpct_getScreenPtr
   4C6E 4D            [ 4]  421 	ld	c,l
   4C6F 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C70 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4C73 E5            [11]  425 	push	hl
   4C74 C5            [11]  426 	push	bc
   4C75 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4C78 E5            [11]  428 	push	hl
   4C79 CD DB 52      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4C7C 21 0E 73      [10]  431 	ld	hl,#0x730E
   4C7F E5            [11]  432 	push	hl
   4C80 21 00 C0      [10]  433 	ld	hl,#0xC000
   4C83 E5            [11]  434 	push	hl
   4C84 CD 9E 5E      [17]  435 	call	_cpct_getScreenPtr
   4C87 4D            [ 4]  436 	ld	c,l
   4C88 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C89 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4C8C E5            [11]  440 	push	hl
   4C8D C5            [11]  441 	push	bc
   4C8E 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4C91 E5            [11]  443 	push	hl
   4C92 CD DB 52      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4C95 21 18 73      [10]  446 	ld	hl,#0x7318
   4C98 E5            [11]  447 	push	hl
   4C99 21 00 C0      [10]  448 	ld	hl,#0xC000
   4C9C E5            [11]  449 	push	hl
   4C9D CD 9E 5E      [17]  450 	call	_cpct_getScreenPtr
   4CA0 4D            [ 4]  451 	ld	c,l
   4CA1 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CA2 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4CA5 E5            [11]  455 	push	hl
   4CA6 C5            [11]  456 	push	bc
   4CA7 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4CAA E5            [11]  458 	push	hl
   4CAB CD DB 52      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4CAE 21 22 73      [10]  461 	ld	hl,#0x7322
   4CB1 E5            [11]  462 	push	hl
   4CB2 21 00 C0      [10]  463 	ld	hl,#0xC000
   4CB5 E5            [11]  464 	push	hl
   4CB6 CD 9E 5E      [17]  465 	call	_cpct_getScreenPtr
   4CB9 4D            [ 4]  466 	ld	c,l
   4CBA 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CBB 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4CBE E5            [11]  470 	push	hl
   4CBF C5            [11]  471 	push	bc
   4CC0 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4CC3 E5            [11]  473 	push	hl
   4CC4 CD DB 52      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4CC7 21 2D 73      [10]  476 	ld	hl,#0x732D
   4CCA E5            [11]  477 	push	hl
   4CCB 21 00 C0      [10]  478 	ld	hl,#0xC000
   4CCE E5            [11]  479 	push	hl
   4CCF CD 9E 5E      [17]  480 	call	_cpct_getScreenPtr
   4CD2 4D            [ 4]  481 	ld	c,l
   4CD3 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4CD4 21 02 00      [10]  484 	ld	hl,#0x0002
   4CD7 E5            [11]  485 	push	hl
   4CD8 C5            [11]  486 	push	bc
   4CD9 21 34 4D      [10]  487 	ld	hl,#___str_3
   4CDC E5            [11]  488 	push	hl
   4CDD CD B7 52      [17]  489 	call	_cpct_drawStringM0
   4CE0 21 06 00      [10]  490 	ld	hl,#6
   4CE3 39            [11]  491 	add	hl,sp
   4CE4 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4CE5 21 04 82      [10]  494 	ld	hl,#0x8204
   4CE8 E5            [11]  495 	push	hl
   4CE9 21 00 C0      [10]  496 	ld	hl,#0xC000
   4CEC E5            [11]  497 	push	hl
   4CED CD 9E 5E      [17]  498 	call	_cpct_getScreenPtr
   4CF0 4D            [ 4]  499 	ld	c,l
   4CF1 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4CF2 21 02 00      [10]  502 	ld	hl,#0x0002
   4CF5 E5            [11]  503 	push	hl
   4CF6 C5            [11]  504 	push	bc
   4CF7 21 3D 4D      [10]  505 	ld	hl,#___str_4
   4CFA E5            [11]  506 	push	hl
   4CFB CD B7 52      [17]  507 	call	_cpct_drawStringM0
   4CFE 21 06 00      [10]  508 	ld	hl,#6
   4D01 39            [11]  509 	add	hl,sp
   4D02 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4D03                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4D03 CD 1E 52      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4D06 21 04 40      [10]  516 	ld	hl,#0x4004
   4D09 CD 9F 52      [17]  517 	call	_cpct_isKeyPressed
   4D0C 7D            [ 4]  518 	ld	a,l
   4D0D B7            [ 4]  519 	or	a, a
   4D0E 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4D10 CD 2F 4E      [17]  522 	call	_menuOpciones
   4D13                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4D13 21 07 10      [10]  525 	ld	hl,#0x1007
   4D16 CD 9F 52      [17]  526 	call	_cpct_isKeyPressed
   4D19 7D            [ 4]  527 	ld	a,l
   4D1A B7            [ 4]  528 	or	a, a
   4D1B C0            [11]  529 	ret	NZ
   4D1C 21 04 40      [10]  530 	ld	hl,#0x4004
   4D1F CD 9F 52      [17]  531 	call	_cpct_isKeyPressed
   4D22 7D            [ 4]  532 	ld	a,l
   4D23 B7            [ 4]  533 	or	a, a
   4D24 28 DD         [12]  534 	jr	Z,00104$
   4D26 C9            [10]  535 	ret
   4D27                     536 ___str_2:
   4D27 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4D33 00                  538 	.db 0x00
   4D34                     539 ___str_3:
   4D34 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4D3C 00                  541 	.db 0x00
   4D3D                     542 ___str_4:
   4D3D 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4D4F 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4D50                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4D50 21 50 82      [10]  551 	ld	hl,#0x8250
   4D53 E5            [11]  552 	push	hl
   4D54 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4D57 E5            [11]  554 	push	hl
   4D58 CD AD 4B      [17]  555 	call	_borrarPantalla
   4D5B F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4D5C 21 1A 46      [10]  558 	ld	hl, #0x461A
   4D5F E3            [19]  559 	ex	(sp),hl
   4D60 21 00 C0      [10]  560 	ld	hl,#0xC000
   4D63 E5            [11]  561 	push	hl
   4D64 CD 9E 5E      [17]  562 	call	_cpct_getScreenPtr
   4D67 4D            [ 4]  563 	ld	c,l
   4D68 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4D69 21 02 00      [10]  566 	ld	hl,#0x0002
   4D6C E5            [11]  567 	push	hl
   4D6D C5            [11]  568 	push	bc
   4D6E 21 F8 4D      [10]  569 	ld	hl,#___str_5
   4D71 E5            [11]  570 	push	hl
   4D72 CD B7 52      [17]  571 	call	_cpct_drawStringM0
   4D75 21 06 00      [10]  572 	ld	hl,#6
   4D78 39            [11]  573 	add	hl,sp
   4D79 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4D7A 21 0A 64      [10]  576 	ld	hl,#0x640A
   4D7D E5            [11]  577 	push	hl
   4D7E 21 00 C0      [10]  578 	ld	hl,#0xC000
   4D81 E5            [11]  579 	push	hl
   4D82 CD 9E 5E      [17]  580 	call	_cpct_getScreenPtr
   4D85 4D            [ 4]  581 	ld	c,l
   4D86 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4D87 21 02 00      [10]  584 	ld	hl,#0x0002
   4D8A E5            [11]  585 	push	hl
   4D8B C5            [11]  586 	push	bc
   4D8C 21 00 4E      [10]  587 	ld	hl,#___str_6
   4D8F E5            [11]  588 	push	hl
   4D90 CD B7 52      [17]  589 	call	_cpct_drawStringM0
   4D93 21 06 00      [10]  590 	ld	hl,#6
   4D96 39            [11]  591 	add	hl,sp
   4D97 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4D98 21 0E 73      [10]  594 	ld	hl,#0x730E
   4D9B E5            [11]  595 	push	hl
   4D9C 21 00 C0      [10]  596 	ld	hl,#0xC000
   4D9F E5            [11]  597 	push	hl
   4DA0 CD 9E 5E      [17]  598 	call	_cpct_getScreenPtr
   4DA3 4D            [ 4]  599 	ld	c,l
   4DA4 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4DA5 21 02 00      [10]  602 	ld	hl,#0x0002
   4DA8 E5            [11]  603 	push	hl
   4DA9 C5            [11]  604 	push	bc
   4DAA 21 10 4E      [10]  605 	ld	hl,#___str_7
   4DAD E5            [11]  606 	push	hl
   4DAE CD B7 52      [17]  607 	call	_cpct_drawStringM0
   4DB1 21 06 00      [10]  608 	ld	hl,#6
   4DB4 39            [11]  609 	add	hl,sp
   4DB5 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4DB6 21 08 82      [10]  612 	ld	hl,#0x8208
   4DB9 E5            [11]  613 	push	hl
   4DBA 21 00 C0      [10]  614 	ld	hl,#0xC000
   4DBD E5            [11]  615 	push	hl
   4DBE CD 9E 5E      [17]  616 	call	_cpct_getScreenPtr
   4DC1 4D            [ 4]  617 	ld	c,l
   4DC2 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4DC3 21 02 00      [10]  620 	ld	hl,#0x0002
   4DC6 E5            [11]  621 	push	hl
   4DC7 C5            [11]  622 	push	bc
   4DC8 21 1E 4E      [10]  623 	ld	hl,#___str_8
   4DCB E5            [11]  624 	push	hl
   4DCC CD B7 52      [17]  625 	call	_cpct_drawStringM0
   4DCF 21 06 00      [10]  626 	ld	hl,#6
   4DD2 39            [11]  627 	add	hl,sp
   4DD3 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4DD4                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4DD4 CD 1E 52      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4DD7 21 04 40      [10]  634 	ld	hl,#0x4004
   4DDA CD 9F 52      [17]  635 	call	_cpct_isKeyPressed
   4DDD 7D            [ 4]  636 	ld	a,l
   4DDE B7            [ 4]  637 	or	a, a
   4DDF 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4DE1 CD 2F 4E      [17]  640 	call	_menuOpciones
   4DE4                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4DE4 21 07 10      [10]  643 	ld	hl,#0x1007
   4DE7 CD 9F 52      [17]  644 	call	_cpct_isKeyPressed
   4DEA 7D            [ 4]  645 	ld	a,l
   4DEB B7            [ 4]  646 	or	a, a
   4DEC C0            [11]  647 	ret	NZ
   4DED 21 04 40      [10]  648 	ld	hl,#0x4004
   4DF0 CD 9F 52      [17]  649 	call	_cpct_isKeyPressed
   4DF3 7D            [ 4]  650 	ld	a,l
   4DF4 B7            [ 4]  651 	or	a, a
   4DF5 28 DD         [12]  652 	jr	Z,00104$
   4DF7 C9            [10]  653 	ret
   4DF8                     654 ___str_5:
   4DF8 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4DFF 00                  656 	.db 0x00
   4E00                     657 ___str_6:
   4E00 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4E0F 00                  659 	.db 0x00
   4E10                     660 ___str_7:
   4E10 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4E1D 00                  662 	.db 0x00
   4E1E                     663 ___str_8:
   4E1E 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4E2E 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4E2F                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E2F 21 50 82      [10]  672 	ld	hl,#0x8250
   4E32 E5            [11]  673 	push	hl
   4E33 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4E36 E5            [11]  675 	push	hl
   4E37 CD AD 4B      [17]  676 	call	_borrarPantalla
   4E3A F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4E3B 21 20 64      [10]  679 	ld	hl, #0x6420
   4E3E E3            [19]  680 	ex	(sp),hl
   4E3F 21 00 C0      [10]  681 	ld	hl,#0xC000
   4E42 E5            [11]  682 	push	hl
   4E43 CD 9E 5E      [17]  683 	call	_cpct_getScreenPtr
   4E46 4D            [ 4]  684 	ld	c,l
   4E47 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4E48 21 02 00      [10]  687 	ld	hl,#0x0002
   4E4B E5            [11]  688 	push	hl
   4E4C C5            [11]  689 	push	bc
   4E4D 21 D0 4E      [10]  690 	ld	hl,#___str_9
   4E50 E5            [11]  691 	push	hl
   4E51 CD B7 52      [17]  692 	call	_cpct_drawStringM0
   4E54 21 06 00      [10]  693 	ld	hl,#6
   4E57 39            [11]  694 	add	hl,sp
   4E58 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4E59 21 00 82      [10]  697 	ld	hl,#0x8200
   4E5C E5            [11]  698 	push	hl
   4E5D 26 C0         [ 7]  699 	ld	h, #0xC0
   4E5F E5            [11]  700 	push	hl
   4E60 CD 9E 5E      [17]  701 	call	_cpct_getScreenPtr
   4E63 4D            [ 4]  702 	ld	c,l
   4E64 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4E65 21 02 00      [10]  705 	ld	hl,#0x0002
   4E68 E5            [11]  706 	push	hl
   4E69 C5            [11]  707 	push	bc
   4E6A 21 D5 4E      [10]  708 	ld	hl,#___str_10
   4E6D E5            [11]  709 	push	hl
   4E6E CD B7 52      [17]  710 	call	_cpct_drawStringM0
   4E71 21 06 00      [10]  711 	ld	hl,#6
   4E74 39            [11]  712 	add	hl,sp
   4E75 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4E76 21 0A 91      [10]  715 	ld	hl,#0x910A
   4E79 E5            [11]  716 	push	hl
   4E7A 21 00 C0      [10]  717 	ld	hl,#0xC000
   4E7D E5            [11]  718 	push	hl
   4E7E CD 9E 5E      [17]  719 	call	_cpct_getScreenPtr
   4E81 4D            [ 4]  720 	ld	c,l
   4E82 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4E83 21 02 00      [10]  723 	ld	hl,#0x0002
   4E86 E5            [11]  724 	push	hl
   4E87 C5            [11]  725 	push	bc
   4E88 21 EA 4E      [10]  726 	ld	hl,#___str_11
   4E8B E5            [11]  727 	push	hl
   4E8C CD B7 52      [17]  728 	call	_cpct_drawStringM0
   4E8F 21 06 00      [10]  729 	ld	hl,#6
   4E92 39            [11]  730 	add	hl,sp
   4E93 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4E94                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4E94 CD 1E 52      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4E97 21 04 08      [10]  737 	ld	hl,#0x0804
   4E9A CD 9F 52      [17]  738 	call	_cpct_isKeyPressed
   4E9D 7D            [ 4]  739 	ld	a,l
   4E9E B7            [ 4]  740 	or	a, a
   4E9F 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   4EA1 CD 39 4C      [17]  743 	call	_menuInstrucciones
   4EA4 18 0D         [12]  744 	jr	00109$
   4EA6                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   4EA6 21 07 40      [10]  747 	ld	hl,#0x4007
   4EA9 CD 9F 52      [17]  748 	call	_cpct_isKeyPressed
   4EAC 7D            [ 4]  749 	ld	a,l
   4EAD B7            [ 4]  750 	or	a, a
   4EAE 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   4EB0 CD 50 4D      [17]  753 	call	_menuCreditos
   4EB3                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4EB3 21 07 10      [10]  756 	ld	hl,#0x1007
   4EB6 CD 9F 52      [17]  757 	call	_cpct_isKeyPressed
   4EB9 7D            [ 4]  758 	ld	a,l
   4EBA B7            [ 4]  759 	or	a, a
   4EBB C0            [11]  760 	ret	NZ
   4EBC 21 04 08      [10]  761 	ld	hl,#0x0804
   4EBF CD 9F 52      [17]  762 	call	_cpct_isKeyPressed
   4EC2 7D            [ 4]  763 	ld	a,l
   4EC3 B7            [ 4]  764 	or	a, a
   4EC4 C0            [11]  765 	ret	NZ
   4EC5 21 07 40      [10]  766 	ld	hl,#0x4007
   4EC8 CD 9F 52      [17]  767 	call	_cpct_isKeyPressed
   4ECB 7D            [ 4]  768 	ld	a,l
   4ECC B7            [ 4]  769 	or	a, a
   4ECD 28 C5         [12]  770 	jr	Z,00108$
   4ECF C9            [10]  771 	ret
   4ED0                     772 ___str_9:
   4ED0 4D 45 4E 55         773 	.ascii "MENU"
   4ED4 00                  774 	.db 0x00
   4ED5                     775 ___str_10:
   4ED5 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4EE9 00                  777 	.db 0x00
   4EEA                     778 ___str_11:
   4EEA 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4EF9 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   4EFA                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   4EFA 21 00 40      [10]  787 	ld	hl,#0x4000
   4EFD E5            [11]  788 	push	hl
   4EFE AF            [ 4]  789 	xor	a, a
   4EFF F5            [11]  790 	push	af
   4F00 33            [ 6]  791 	inc	sp
   4F01 26 C0         [ 7]  792 	ld	h, #0xC0
   4F03 E5            [11]  793 	push	hl
   4F04 CD 66 55      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4F07 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   4F0A E5            [11]  797 	push	hl
   4F0B 21 00 C0      [10]  798 	ld	hl,#0xC000
   4F0E E5            [11]  799 	push	hl
   4F0F CD 9E 5E      [17]  800 	call	_cpct_getScreenPtr
   4F12 4D            [ 4]  801 	ld	c,l
   4F13 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4F14 21 04 00      [10]  804 	ld	hl,#0x0004
   4F17 E5            [11]  805 	push	hl
   4F18 C5            [11]  806 	push	bc
   4F19 21 B0 4F      [10]  807 	ld	hl,#___str_12
   4F1C E5            [11]  808 	push	hl
   4F1D CD B7 52      [17]  809 	call	_cpct_drawStringM0
   4F20 21 06 00      [10]  810 	ld	hl,#6
   4F23 39            [11]  811 	add	hl,sp
   4F24 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F25 21 28 6E      [10]  814 	ld	hl,#0x6E28
   4F28 E5            [11]  815 	push	hl
   4F29 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   4F2C E5            [11]  817 	push	hl
   4F2D 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   4F30 E5            [11]  819 	push	hl
   4F31 CD DB 52      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4F34 21 28 6E      [10]  822 	ld	hl,#0x6E28
   4F37 E5            [11]  823 	push	hl
   4F38 21 18 F1      [10]  824 	ld	hl,#0xF118
   4F3B E5            [11]  825 	push	hl
   4F3C 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   4F3F E5            [11]  827 	push	hl
   4F40 CD DB 52      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4F43 21 08 A0      [10]  830 	ld	hl,#0xA008
   4F46 E5            [11]  831 	push	hl
   4F47 21 00 C0      [10]  832 	ld	hl,#0xC000
   4F4A E5            [11]  833 	push	hl
   4F4B CD 9E 5E      [17]  834 	call	_cpct_getScreenPtr
   4F4E 4D            [ 4]  835 	ld	c,l
   4F4F 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4F50 21 02 00      [10]  838 	ld	hl,#0x0002
   4F53 E5            [11]  839 	push	hl
   4F54 C5            [11]  840 	push	bc
   4F55 21 B8 4F      [10]  841 	ld	hl,#___str_13
   4F58 E5            [11]  842 	push	hl
   4F59 CD B7 52      [17]  843 	call	_cpct_drawStringM0
   4F5C 21 06 00      [10]  844 	ld	hl,#6
   4F5F 39            [11]  845 	add	hl,sp
   4F60 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4F61 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   4F64 E5            [11]  849 	push	hl
   4F65 21 00 C0      [10]  850 	ld	hl,#0xC000
   4F68 E5            [11]  851 	push	hl
   4F69 CD 9E 5E      [17]  852 	call	_cpct_getScreenPtr
   4F6C 4D            [ 4]  853 	ld	c,l
   4F6D 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4F6E 21 02 00      [10]  856 	ld	hl,#0x0002
   4F71 E5            [11]  857 	push	hl
   4F72 C5            [11]  858 	push	bc
   4F73 21 C9 4F      [10]  859 	ld	hl,#___str_14
   4F76 E5            [11]  860 	push	hl
   4F77 CD B7 52      [17]  861 	call	_cpct_drawStringM0
   4F7A 21 06 00      [10]  862 	ld	hl,#6
   4F7D 39            [11]  863 	add	hl,sp
   4F7E F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   4F7F                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   4F7F CD 1E 52      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   4F82 21 04 40      [10]  870 	ld	hl,#0x4004
   4F85 CD 9F 52      [17]  871 	call	_cpct_isKeyPressed
   4F88 7D            [ 4]  872 	ld	a,l
   4F89 B7            [ 4]  873 	or	a, a
   4F8A 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   4F8C CD 1E 52      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   4F8F                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   4F8F CD 2F 4E      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   4F92 21 07 10      [10]  882 	ld	hl,#0x1007
   4F95 CD 9F 52      [17]  883 	call	_cpct_isKeyPressed
   4F98 7D            [ 4]  884 	ld	a,l
   4F99 B7            [ 4]  885 	or	a, a
   4F9A 28 F3         [12]  886 	jr	Z,00101$
   4F9C                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4F9C 21 07 10      [10]  889 	ld	hl,#0x1007
   4F9F CD 9F 52      [17]  890 	call	_cpct_isKeyPressed
   4FA2 7D            [ 4]  891 	ld	a,l
   4FA3 B7            [ 4]  892 	or	a, a
   4FA4 C0            [11]  893 	ret	NZ
   4FA5 21 04 40      [10]  894 	ld	hl,#0x4004
   4FA8 CD 9F 52      [17]  895 	call	_cpct_isKeyPressed
   4FAB 7D            [ 4]  896 	ld	a,l
   4FAC B7            [ 4]  897 	or	a, a
   4FAD 28 D0         [12]  898 	jr	Z,00107$
   4FAF C9            [10]  899 	ret
   4FB0                     900 ___str_12:
   4FB0 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   4FB7 00                  902 	.db 0x00
   4FB8                     903 ___str_13:
   4FB8 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   4FC8 00                  905 	.db 0x00
   4FC9                     906 ___str_14:
   4FC9 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   4FD8 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
