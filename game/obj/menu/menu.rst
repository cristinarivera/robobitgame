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
   4A1A                      60 _menuFin::
   4A1A DD E5         [15]   61 	push	ix
   4A1C DD 21 00 00   [14]   62 	ld	ix,#0
   4A20 DD 39         [15]   63 	add	ix,sp
   4A22 F5            [11]   64 	push	af
   4A23 F5            [11]   65 	push	af
   4A24 DD 75 FE      [19]   66 	ld	-2 (ix),l
   4A27 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4A2A 21 10 27      [10]   69 	ld	hl,#0x2710
   4A2D E5            [11]   70 	push	hl
   4A2E DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4A31 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4A34 E5            [11]   73 	push	hl
   4A35 CD BE 51      [17]   74 	call	__divuint
   4A38 F1            [10]   75 	pop	af
   4A39 F1            [10]   76 	pop	af
   4A3A 33            [ 6]   77 	inc	sp
   4A3B 33            [ 6]   78 	inc	sp
   4A3C E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4A3D 21 00 40      [10]   81 	ld	hl,#0x4000
   4A40 E5            [11]   82 	push	hl
   4A41 AF            [ 4]   83 	xor	a, a
   4A42 F5            [11]   84 	push	af
   4A43 33            [ 6]   85 	inc	sp
   4A44 26 C0         [ 7]   86 	ld	h, #0xC0
   4A46 E5            [11]   87 	push	hl
   4A47 CD 47 55      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4A4A 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4A4D E5            [11]   91 	push	hl
   4A4E 21 00 C0      [10]   92 	ld	hl,#0xC000
   4A51 E5            [11]   93 	push	hl
   4A52 CD 7F 5E      [17]   94 	call	_cpct_getScreenPtr
   4A55 4D            [ 4]   95 	ld	c,l
   4A56 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4A57 21 02 00      [10]   98 	ld	hl,#0x0002
   4A5A E5            [11]   99 	push	hl
   4A5B C5            [11]  100 	push	bc
   4A5C 21 7C 4B      [10]  101 	ld	hl,#___str_0
   4A5F E5            [11]  102 	push	hl
   4A60 CD 98 52      [17]  103 	call	_cpct_drawStringM0
   4A63 21 06 00      [10]  104 	ld	hl,#6
   4A66 39            [11]  105 	add	hl,sp
   4A67 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4A68 21 14 78      [10]  108 	ld	hl,#0x7814
   4A6B E5            [11]  109 	push	hl
   4A6C 21 00 C0      [10]  110 	ld	hl,#0xC000
   4A6F E5            [11]  111 	push	hl
   4A70 CD 7F 5E      [17]  112 	call	_cpct_getScreenPtr
   4A73 4D            [ 4]  113 	ld	c,l
   4A74 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4A75 21 02 00      [10]  116 	ld	hl,#0x0002
   4A78 E5            [11]  117 	push	hl
   4A79 C5            [11]  118 	push	bc
   4A7A 21 86 4B      [10]  119 	ld	hl,#___str_1
   4A7D E5            [11]  120 	push	hl
   4A7E CD 98 52      [17]  121 	call	_cpct_drawStringM0
   4A81 21 06 00      [10]  122 	ld	hl,#6
   4A84 39            [11]  123 	add	hl,sp
   4A85 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4A86 21 2D 78      [10]  126 	ld	hl,#0x782D
   4A89 E5            [11]  127 	push	hl
   4A8A 21 00 C0      [10]  128 	ld	hl,#0xC000
   4A8D E5            [11]  129 	push	hl
   4A8E CD 7F 5E      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4A91 E5            [11]  132 	push	hl
   4A92 21 0A 00      [10]  133 	ld	hl,#0x000A
   4A95 E5            [11]  134 	push	hl
   4A96 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4A99 DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4A9C E5            [11]  137 	push	hl
   4A9D CD 74 5E      [17]  138 	call	__moduint
   4AA0 F1            [10]  139 	pop	af
   4AA1 F1            [10]  140 	pop	af
   4AA2 C1            [10]  141 	pop	bc
   4AA3 7D            [ 4]  142 	ld	a,l
   4AA4 C6 30         [ 7]  143 	add	a, #0x30
   4AA6 67            [ 4]  144 	ld	h,a
   4AA7 59            [ 4]  145 	ld	e, c
   4AA8 50            [ 4]  146 	ld	d, b
   4AA9 C5            [11]  147 	push	bc
   4AAA E5            [11]  148 	push	hl
   4AAB 33            [ 6]  149 	inc	sp
   4AAC 21 02 00      [10]  150 	ld	hl,#0x0002
   4AAF E5            [11]  151 	push	hl
   4AB0 D5            [11]  152 	push	de
   4AB1 CD F0 53      [17]  153 	call	_cpct_drawCharM0
   4AB4 F1            [10]  154 	pop	af
   4AB5 33            [ 6]  155 	inc	sp
   4AB6 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4AB9 E3            [19]  157 	ex	(sp),hl
   4ABA DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4ABD DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4AC0 E5            [11]  160 	push	hl
   4AC1 CD BE 51      [17]  161 	call	__divuint
   4AC4 F1            [10]  162 	pop	af
   4AC5 F1            [10]  163 	pop	af
   4AC6 11 0A 00      [10]  164 	ld	de,#0x000A
   4AC9 D5            [11]  165 	push	de
   4ACA E5            [11]  166 	push	hl
   4ACB CD 74 5E      [17]  167 	call	__moduint
   4ACE F1            [10]  168 	pop	af
   4ACF F1            [10]  169 	pop	af
   4AD0 C1            [10]  170 	pop	bc
   4AD1 7D            [ 4]  171 	ld	a,l
   4AD2 C6 30         [ 7]  172 	add	a, #0x30
   4AD4 67            [ 4]  173 	ld	h,a
   4AD5 79            [ 4]  174 	ld	a,c
   4AD6 C6 04         [ 7]  175 	add	a, #0x04
   4AD8 5F            [ 4]  176 	ld	e,a
   4AD9 78            [ 4]  177 	ld	a,b
   4ADA CE 00         [ 7]  178 	adc	a, #0x00
   4ADC 57            [ 4]  179 	ld	d,a
   4ADD C5            [11]  180 	push	bc
   4ADE E5            [11]  181 	push	hl
   4ADF 33            [ 6]  182 	inc	sp
   4AE0 21 02 00      [10]  183 	ld	hl,#0x0002
   4AE3 E5            [11]  184 	push	hl
   4AE4 D5            [11]  185 	push	de
   4AE5 CD F0 53      [17]  186 	call	_cpct_drawCharM0
   4AE8 F1            [10]  187 	pop	af
   4AE9 33            [ 6]  188 	inc	sp
   4AEA 21 64 00      [10]  189 	ld	hl,#0x0064
   4AED E3            [19]  190 	ex	(sp),hl
   4AEE DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4AF1 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4AF4 E5            [11]  193 	push	hl
   4AF5 CD BE 51      [17]  194 	call	__divuint
   4AF8 F1            [10]  195 	pop	af
   4AF9 F1            [10]  196 	pop	af
   4AFA 11 0A 00      [10]  197 	ld	de,#0x000A
   4AFD D5            [11]  198 	push	de
   4AFE E5            [11]  199 	push	hl
   4AFF CD 74 5E      [17]  200 	call	__moduint
   4B02 F1            [10]  201 	pop	af
   4B03 F1            [10]  202 	pop	af
   4B04 C1            [10]  203 	pop	bc
   4B05 7D            [ 4]  204 	ld	a,l
   4B06 C6 30         [ 7]  205 	add	a, #0x30
   4B08 67            [ 4]  206 	ld	h,a
   4B09 79            [ 4]  207 	ld	a,c
   4B0A C6 08         [ 7]  208 	add	a, #0x08
   4B0C 5F            [ 4]  209 	ld	e,a
   4B0D 78            [ 4]  210 	ld	a,b
   4B0E CE 00         [ 7]  211 	adc	a, #0x00
   4B10 57            [ 4]  212 	ld	d,a
   4B11 C5            [11]  213 	push	bc
   4B12 E5            [11]  214 	push	hl
   4B13 33            [ 6]  215 	inc	sp
   4B14 21 02 00      [10]  216 	ld	hl,#0x0002
   4B17 E5            [11]  217 	push	hl
   4B18 D5            [11]  218 	push	de
   4B19 CD F0 53      [17]  219 	call	_cpct_drawCharM0
   4B1C F1            [10]  220 	pop	af
   4B1D 33            [ 6]  221 	inc	sp
   4B1E 21 0A 00      [10]  222 	ld	hl,#0x000A
   4B21 E3            [19]  223 	ex	(sp),hl
   4B22 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4B25 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4B28 E5            [11]  226 	push	hl
   4B29 CD BE 51      [17]  227 	call	__divuint
   4B2C F1            [10]  228 	pop	af
   4B2D F1            [10]  229 	pop	af
   4B2E 11 0A 00      [10]  230 	ld	de,#0x000A
   4B31 D5            [11]  231 	push	de
   4B32 E5            [11]  232 	push	hl
   4B33 CD 74 5E      [17]  233 	call	__moduint
   4B36 F1            [10]  234 	pop	af
   4B37 F1            [10]  235 	pop	af
   4B38 C1            [10]  236 	pop	bc
   4B39 7D            [ 4]  237 	ld	a,l
   4B3A C6 30         [ 7]  238 	add	a, #0x30
   4B3C 67            [ 4]  239 	ld	h,a
   4B3D 79            [ 4]  240 	ld	a,c
   4B3E C6 0C         [ 7]  241 	add	a, #0x0C
   4B40 5F            [ 4]  242 	ld	e,a
   4B41 78            [ 4]  243 	ld	a,b
   4B42 CE 00         [ 7]  244 	adc	a, #0x00
   4B44 57            [ 4]  245 	ld	d,a
   4B45 C5            [11]  246 	push	bc
   4B46 E5            [11]  247 	push	hl
   4B47 33            [ 6]  248 	inc	sp
   4B48 21 02 00      [10]  249 	ld	hl,#0x0002
   4B4B E5            [11]  250 	push	hl
   4B4C D5            [11]  251 	push	de
   4B4D CD F0 53      [17]  252 	call	_cpct_drawCharM0
   4B50 F1            [10]  253 	pop	af
   4B51 33            [ 6]  254 	inc	sp
   4B52 21 0A 00      [10]  255 	ld	hl,#0x000A
   4B55 E3            [19]  256 	ex	(sp),hl
   4B56 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4B59 DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4B5C E5            [11]  259 	push	hl
   4B5D CD 74 5E      [17]  260 	call	__moduint
   4B60 F1            [10]  261 	pop	af
   4B61 F1            [10]  262 	pop	af
   4B62 C1            [10]  263 	pop	bc
   4B63 7D            [ 4]  264 	ld	a,l
   4B64 C6 30         [ 7]  265 	add	a, #0x30
   4B66 57            [ 4]  266 	ld	d,a
   4B67 21 10 00      [10]  267 	ld	hl,#0x0010
   4B6A 09            [11]  268 	add	hl,bc
   4B6B 4D            [ 4]  269 	ld	c,l
   4B6C 44            [ 4]  270 	ld	b,h
   4B6D D5            [11]  271 	push	de
   4B6E 33            [ 6]  272 	inc	sp
   4B6F 21 02 00      [10]  273 	ld	hl,#0x0002
   4B72 E5            [11]  274 	push	hl
   4B73 C5            [11]  275 	push	bc
   4B74 CD F0 53      [17]  276 	call	_cpct_drawCharM0
   4B77 F1            [10]  277 	pop	af
   4B78 F1            [10]  278 	pop	af
   4B79 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4B7A                     281 00102$:
   4B7A 18 FE         [12]  282 	jr	00102$
   4B7C                     283 ___str_0:
   4B7C 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4B85 00                  285 	.db 0x00
   4B86                     286 ___str_1:
   4B86 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4B8D 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4B8E                     293 _borrarPantalla::
   4B8E DD E5         [15]  294 	push	ix
   4B90 DD 21 00 00   [14]  295 	ld	ix,#0
   4B94 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4B96 3E 28         [ 7]  298 	ld	a,#0x28
   4B98 DD 96 06      [19]  299 	sub	a, 6 (ix)
   4B9B 3E 00         [ 7]  300 	ld	a,#0x00
   4B9D 17            [ 4]  301 	rla
   4B9E 4F            [ 4]  302 	ld	c,a
   4B9F CB 41         [ 8]  303 	bit	0,c
   4BA1 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4BA3 DD 66 05      [19]  306 	ld	h,5 (ix)
   4BA6 DD 6E 04      [19]  307 	ld	l,4 (ix)
   4BA9 E5            [11]  308 	push	hl
   4BAA 21 00 C0      [10]  309 	ld	hl,#0xC000
   4BAD E5            [11]  310 	push	hl
   4BAE CD 7F 5E      [17]  311 	call	_cpct_getScreenPtr
   4BB1 4D            [ 4]  312 	ld	c,l
   4BB2 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4BB3 DD 66 07      [19]  315 	ld	h,7 (ix)
   4BB6 DD 6E 06      [19]  316 	ld	l,6 (ix)
   4BB9 E5            [11]  317 	push	hl
   4BBA AF            [ 4]  318 	xor	a, a
   4BBB F5            [11]  319 	push	af
   4BBC 33            [ 6]  320 	inc	sp
   4BBD C5            [11]  321 	push	bc
   4BBE CD 65 55      [17]  322 	call	_cpct_drawSolidBox
   4BC1 F1            [10]  323 	pop	af
   4BC2 F1            [10]  324 	pop	af
   4BC3 33            [ 6]  325 	inc	sp
   4BC4 18 51         [12]  326 	jr	00106$
   4BC6                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4BC6 CB 41         [ 8]  329 	bit	0,c
   4BC8 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4BCA DD 66 05      [19]  332 	ld	h,5 (ix)
   4BCD DD 6E 04      [19]  333 	ld	l,4 (ix)
   4BD0 E5            [11]  334 	push	hl
   4BD1 21 00 C0      [10]  335 	ld	hl,#0xC000
   4BD4 E5            [11]  336 	push	hl
   4BD5 CD 7F 5E      [17]  337 	call	_cpct_getScreenPtr
   4BD8 4D            [ 4]  338 	ld	c,l
   4BD9 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4BDA DD 7E 07      [19]  341 	ld	a,7 (ix)
   4BDD F5            [11]  342 	push	af
   4BDE 33            [ 6]  343 	inc	sp
   4BDF 21 00 28      [10]  344 	ld	hl,#0x2800
   4BE2 E5            [11]  345 	push	hl
   4BE3 C5            [11]  346 	push	bc
   4BE4 CD 65 55      [17]  347 	call	_cpct_drawSolidBox
   4BE7 F1            [10]  348 	pop	af
   4BE8 F1            [10]  349 	pop	af
   4BE9 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4BEA DD 7E 04      [19]  352 	ld	a,4 (ix)
   4BED C6 28         [ 7]  353 	add	a, #0x28
   4BEF 47            [ 4]  354 	ld	b,a
   4BF0 DD 7E 05      [19]  355 	ld	a,5 (ix)
   4BF3 F5            [11]  356 	push	af
   4BF4 33            [ 6]  357 	inc	sp
   4BF5 C5            [11]  358 	push	bc
   4BF6 33            [ 6]  359 	inc	sp
   4BF7 21 00 C0      [10]  360 	ld	hl,#0xC000
   4BFA E5            [11]  361 	push	hl
   4BFB CD 7F 5E      [17]  362 	call	_cpct_getScreenPtr
   4BFE 4D            [ 4]  363 	ld	c,l
   4BFF 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C00 DD 7E 06      [19]  366 	ld	a,6 (ix)
   4C03 C6 D8         [ 7]  367 	add	a,#0xD8
   4C05 57            [ 4]  368 	ld	d,a
   4C06 DD 7E 07      [19]  369 	ld	a,7 (ix)
   4C09 F5            [11]  370 	push	af
   4C0A 33            [ 6]  371 	inc	sp
   4C0B D5            [11]  372 	push	de
   4C0C 33            [ 6]  373 	inc	sp
   4C0D AF            [ 4]  374 	xor	a, a
   4C0E F5            [11]  375 	push	af
   4C0F 33            [ 6]  376 	inc	sp
   4C10 C5            [11]  377 	push	bc
   4C11 CD 65 55      [17]  378 	call	_cpct_drawSolidBox
   4C14 F1            [10]  379 	pop	af
   4C15 F1            [10]  380 	pop	af
   4C16 33            [ 6]  381 	inc	sp
   4C17                     382 00106$:
   4C17 DD E1         [14]  383 	pop	ix
   4C19 C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4C1A                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4C1A 21 50 82      [10]  391 	ld	hl,#0x8250
   4C1D E5            [11]  392 	push	hl
   4C1E 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4C21 E5            [11]  394 	push	hl
   4C22 CD 8E 4B      [17]  395 	call	_borrarPantalla
   4C25 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4C26 21 10 55      [10]  398 	ld	hl, #0x5510
   4C29 E3            [19]  399 	ex	(sp),hl
   4C2A 21 00 C0      [10]  400 	ld	hl,#0xC000
   4C2D E5            [11]  401 	push	hl
   4C2E CD 7F 5E      [17]  402 	call	_cpct_getScreenPtr
   4C31 4D            [ 4]  403 	ld	c,l
   4C32 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4C33 21 02 00      [10]  406 	ld	hl,#0x0002
   4C36 E5            [11]  407 	push	hl
   4C37 C5            [11]  408 	push	bc
   4C38 21 08 4D      [10]  409 	ld	hl,#___str_2
   4C3B E5            [11]  410 	push	hl
   4C3C CD 98 52      [17]  411 	call	_cpct_drawStringM0
   4C3F 21 06 00      [10]  412 	ld	hl,#6
   4C42 39            [11]  413 	add	hl,sp
   4C43 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4C44 21 04 73      [10]  416 	ld	hl,#0x7304
   4C47 E5            [11]  417 	push	hl
   4C48 21 00 C0      [10]  418 	ld	hl,#0xC000
   4C4B E5            [11]  419 	push	hl
   4C4C CD 7F 5E      [17]  420 	call	_cpct_getScreenPtr
   4C4F 4D            [ 4]  421 	ld	c,l
   4C50 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C51 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4C54 E5            [11]  425 	push	hl
   4C55 C5            [11]  426 	push	bc
   4C56 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4C59 E5            [11]  428 	push	hl
   4C5A CD BC 52      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4C5D 21 0E 73      [10]  431 	ld	hl,#0x730E
   4C60 E5            [11]  432 	push	hl
   4C61 21 00 C0      [10]  433 	ld	hl,#0xC000
   4C64 E5            [11]  434 	push	hl
   4C65 CD 7F 5E      [17]  435 	call	_cpct_getScreenPtr
   4C68 4D            [ 4]  436 	ld	c,l
   4C69 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C6A 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4C6D E5            [11]  440 	push	hl
   4C6E C5            [11]  441 	push	bc
   4C6F 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4C72 E5            [11]  443 	push	hl
   4C73 CD BC 52      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4C76 21 18 73      [10]  446 	ld	hl,#0x7318
   4C79 E5            [11]  447 	push	hl
   4C7A 21 00 C0      [10]  448 	ld	hl,#0xC000
   4C7D E5            [11]  449 	push	hl
   4C7E CD 7F 5E      [17]  450 	call	_cpct_getScreenPtr
   4C81 4D            [ 4]  451 	ld	c,l
   4C82 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C83 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4C86 E5            [11]  455 	push	hl
   4C87 C5            [11]  456 	push	bc
   4C88 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4C8B E5            [11]  458 	push	hl
   4C8C CD BC 52      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4C8F 21 22 73      [10]  461 	ld	hl,#0x7322
   4C92 E5            [11]  462 	push	hl
   4C93 21 00 C0      [10]  463 	ld	hl,#0xC000
   4C96 E5            [11]  464 	push	hl
   4C97 CD 7F 5E      [17]  465 	call	_cpct_getScreenPtr
   4C9A 4D            [ 4]  466 	ld	c,l
   4C9B 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C9C 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4C9F E5            [11]  470 	push	hl
   4CA0 C5            [11]  471 	push	bc
   4CA1 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4CA4 E5            [11]  473 	push	hl
   4CA5 CD BC 52      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4CA8 21 2D 73      [10]  476 	ld	hl,#0x732D
   4CAB E5            [11]  477 	push	hl
   4CAC 21 00 C0      [10]  478 	ld	hl,#0xC000
   4CAF E5            [11]  479 	push	hl
   4CB0 CD 7F 5E      [17]  480 	call	_cpct_getScreenPtr
   4CB3 4D            [ 4]  481 	ld	c,l
   4CB4 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4CB5 21 02 00      [10]  484 	ld	hl,#0x0002
   4CB8 E5            [11]  485 	push	hl
   4CB9 C5            [11]  486 	push	bc
   4CBA 21 15 4D      [10]  487 	ld	hl,#___str_3
   4CBD E5            [11]  488 	push	hl
   4CBE CD 98 52      [17]  489 	call	_cpct_drawStringM0
   4CC1 21 06 00      [10]  490 	ld	hl,#6
   4CC4 39            [11]  491 	add	hl,sp
   4CC5 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4CC6 21 04 82      [10]  494 	ld	hl,#0x8204
   4CC9 E5            [11]  495 	push	hl
   4CCA 21 00 C0      [10]  496 	ld	hl,#0xC000
   4CCD E5            [11]  497 	push	hl
   4CCE CD 7F 5E      [17]  498 	call	_cpct_getScreenPtr
   4CD1 4D            [ 4]  499 	ld	c,l
   4CD2 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4CD3 21 02 00      [10]  502 	ld	hl,#0x0002
   4CD6 E5            [11]  503 	push	hl
   4CD7 C5            [11]  504 	push	bc
   4CD8 21 1E 4D      [10]  505 	ld	hl,#___str_4
   4CDB E5            [11]  506 	push	hl
   4CDC CD 98 52      [17]  507 	call	_cpct_drawStringM0
   4CDF 21 06 00      [10]  508 	ld	hl,#6
   4CE2 39            [11]  509 	add	hl,sp
   4CE3 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4CE4                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4CE4 CD FF 51      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4CE7 21 04 40      [10]  516 	ld	hl,#0x4004
   4CEA CD 80 52      [17]  517 	call	_cpct_isKeyPressed
   4CED 7D            [ 4]  518 	ld	a,l
   4CEE B7            [ 4]  519 	or	a, a
   4CEF 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4CF1 CD 10 4E      [17]  522 	call	_menuOpciones
   4CF4                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4CF4 21 07 10      [10]  525 	ld	hl,#0x1007
   4CF7 CD 80 52      [17]  526 	call	_cpct_isKeyPressed
   4CFA 7D            [ 4]  527 	ld	a,l
   4CFB B7            [ 4]  528 	or	a, a
   4CFC C0            [11]  529 	ret	NZ
   4CFD 21 04 40      [10]  530 	ld	hl,#0x4004
   4D00 CD 80 52      [17]  531 	call	_cpct_isKeyPressed
   4D03 7D            [ 4]  532 	ld	a,l
   4D04 B7            [ 4]  533 	or	a, a
   4D05 28 DD         [12]  534 	jr	Z,00104$
   4D07 C9            [10]  535 	ret
   4D08                     536 ___str_2:
   4D08 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4D14 00                  538 	.db 0x00
   4D15                     539 ___str_3:
   4D15 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4D1D 00                  541 	.db 0x00
   4D1E                     542 ___str_4:
   4D1E 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4D30 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4D31                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4D31 21 50 82      [10]  551 	ld	hl,#0x8250
   4D34 E5            [11]  552 	push	hl
   4D35 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4D38 E5            [11]  554 	push	hl
   4D39 CD 8E 4B      [17]  555 	call	_borrarPantalla
   4D3C F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4D3D 21 1A 46      [10]  558 	ld	hl, #0x461A
   4D40 E3            [19]  559 	ex	(sp),hl
   4D41 21 00 C0      [10]  560 	ld	hl,#0xC000
   4D44 E5            [11]  561 	push	hl
   4D45 CD 7F 5E      [17]  562 	call	_cpct_getScreenPtr
   4D48 4D            [ 4]  563 	ld	c,l
   4D49 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4D4A 21 02 00      [10]  566 	ld	hl,#0x0002
   4D4D E5            [11]  567 	push	hl
   4D4E C5            [11]  568 	push	bc
   4D4F 21 D9 4D      [10]  569 	ld	hl,#___str_5
   4D52 E5            [11]  570 	push	hl
   4D53 CD 98 52      [17]  571 	call	_cpct_drawStringM0
   4D56 21 06 00      [10]  572 	ld	hl,#6
   4D59 39            [11]  573 	add	hl,sp
   4D5A F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4D5B 21 0A 64      [10]  576 	ld	hl,#0x640A
   4D5E E5            [11]  577 	push	hl
   4D5F 21 00 C0      [10]  578 	ld	hl,#0xC000
   4D62 E5            [11]  579 	push	hl
   4D63 CD 7F 5E      [17]  580 	call	_cpct_getScreenPtr
   4D66 4D            [ 4]  581 	ld	c,l
   4D67 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4D68 21 02 00      [10]  584 	ld	hl,#0x0002
   4D6B E5            [11]  585 	push	hl
   4D6C C5            [11]  586 	push	bc
   4D6D 21 E1 4D      [10]  587 	ld	hl,#___str_6
   4D70 E5            [11]  588 	push	hl
   4D71 CD 98 52      [17]  589 	call	_cpct_drawStringM0
   4D74 21 06 00      [10]  590 	ld	hl,#6
   4D77 39            [11]  591 	add	hl,sp
   4D78 F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4D79 21 0E 73      [10]  594 	ld	hl,#0x730E
   4D7C E5            [11]  595 	push	hl
   4D7D 21 00 C0      [10]  596 	ld	hl,#0xC000
   4D80 E5            [11]  597 	push	hl
   4D81 CD 7F 5E      [17]  598 	call	_cpct_getScreenPtr
   4D84 4D            [ 4]  599 	ld	c,l
   4D85 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4D86 21 02 00      [10]  602 	ld	hl,#0x0002
   4D89 E5            [11]  603 	push	hl
   4D8A C5            [11]  604 	push	bc
   4D8B 21 F1 4D      [10]  605 	ld	hl,#___str_7
   4D8E E5            [11]  606 	push	hl
   4D8F CD 98 52      [17]  607 	call	_cpct_drawStringM0
   4D92 21 06 00      [10]  608 	ld	hl,#6
   4D95 39            [11]  609 	add	hl,sp
   4D96 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4D97 21 08 82      [10]  612 	ld	hl,#0x8208
   4D9A E5            [11]  613 	push	hl
   4D9B 21 00 C0      [10]  614 	ld	hl,#0xC000
   4D9E E5            [11]  615 	push	hl
   4D9F CD 7F 5E      [17]  616 	call	_cpct_getScreenPtr
   4DA2 4D            [ 4]  617 	ld	c,l
   4DA3 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4DA4 21 02 00      [10]  620 	ld	hl,#0x0002
   4DA7 E5            [11]  621 	push	hl
   4DA8 C5            [11]  622 	push	bc
   4DA9 21 FF 4D      [10]  623 	ld	hl,#___str_8
   4DAC E5            [11]  624 	push	hl
   4DAD CD 98 52      [17]  625 	call	_cpct_drawStringM0
   4DB0 21 06 00      [10]  626 	ld	hl,#6
   4DB3 39            [11]  627 	add	hl,sp
   4DB4 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4DB5                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4DB5 CD FF 51      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4DB8 21 04 40      [10]  634 	ld	hl,#0x4004
   4DBB CD 80 52      [17]  635 	call	_cpct_isKeyPressed
   4DBE 7D            [ 4]  636 	ld	a,l
   4DBF B7            [ 4]  637 	or	a, a
   4DC0 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4DC2 CD 10 4E      [17]  640 	call	_menuOpciones
   4DC5                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4DC5 21 07 10      [10]  643 	ld	hl,#0x1007
   4DC8 CD 80 52      [17]  644 	call	_cpct_isKeyPressed
   4DCB 7D            [ 4]  645 	ld	a,l
   4DCC B7            [ 4]  646 	or	a, a
   4DCD C0            [11]  647 	ret	NZ
   4DCE 21 04 40      [10]  648 	ld	hl,#0x4004
   4DD1 CD 80 52      [17]  649 	call	_cpct_isKeyPressed
   4DD4 7D            [ 4]  650 	ld	a,l
   4DD5 B7            [ 4]  651 	or	a, a
   4DD6 28 DD         [12]  652 	jr	Z,00104$
   4DD8 C9            [10]  653 	ret
   4DD9                     654 ___str_5:
   4DD9 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4DE0 00                  656 	.db 0x00
   4DE1                     657 ___str_6:
   4DE1 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4DF0 00                  659 	.db 0x00
   4DF1                     660 ___str_7:
   4DF1 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4DFE 00                  662 	.db 0x00
   4DFF                     663 ___str_8:
   4DFF 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4E0F 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4E10                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E10 21 50 82      [10]  672 	ld	hl,#0x8250
   4E13 E5            [11]  673 	push	hl
   4E14 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4E17 E5            [11]  675 	push	hl
   4E18 CD 8E 4B      [17]  676 	call	_borrarPantalla
   4E1B F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4E1C 21 20 64      [10]  679 	ld	hl, #0x6420
   4E1F E3            [19]  680 	ex	(sp),hl
   4E20 21 00 C0      [10]  681 	ld	hl,#0xC000
   4E23 E5            [11]  682 	push	hl
   4E24 CD 7F 5E      [17]  683 	call	_cpct_getScreenPtr
   4E27 4D            [ 4]  684 	ld	c,l
   4E28 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4E29 21 02 00      [10]  687 	ld	hl,#0x0002
   4E2C E5            [11]  688 	push	hl
   4E2D C5            [11]  689 	push	bc
   4E2E 21 B1 4E      [10]  690 	ld	hl,#___str_9
   4E31 E5            [11]  691 	push	hl
   4E32 CD 98 52      [17]  692 	call	_cpct_drawStringM0
   4E35 21 06 00      [10]  693 	ld	hl,#6
   4E38 39            [11]  694 	add	hl,sp
   4E39 F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4E3A 21 00 82      [10]  697 	ld	hl,#0x8200
   4E3D E5            [11]  698 	push	hl
   4E3E 26 C0         [ 7]  699 	ld	h, #0xC0
   4E40 E5            [11]  700 	push	hl
   4E41 CD 7F 5E      [17]  701 	call	_cpct_getScreenPtr
   4E44 4D            [ 4]  702 	ld	c,l
   4E45 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4E46 21 02 00      [10]  705 	ld	hl,#0x0002
   4E49 E5            [11]  706 	push	hl
   4E4A C5            [11]  707 	push	bc
   4E4B 21 B6 4E      [10]  708 	ld	hl,#___str_10
   4E4E E5            [11]  709 	push	hl
   4E4F CD 98 52      [17]  710 	call	_cpct_drawStringM0
   4E52 21 06 00      [10]  711 	ld	hl,#6
   4E55 39            [11]  712 	add	hl,sp
   4E56 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4E57 21 0A 91      [10]  715 	ld	hl,#0x910A
   4E5A E5            [11]  716 	push	hl
   4E5B 21 00 C0      [10]  717 	ld	hl,#0xC000
   4E5E E5            [11]  718 	push	hl
   4E5F CD 7F 5E      [17]  719 	call	_cpct_getScreenPtr
   4E62 4D            [ 4]  720 	ld	c,l
   4E63 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4E64 21 02 00      [10]  723 	ld	hl,#0x0002
   4E67 E5            [11]  724 	push	hl
   4E68 C5            [11]  725 	push	bc
   4E69 21 CB 4E      [10]  726 	ld	hl,#___str_11
   4E6C E5            [11]  727 	push	hl
   4E6D CD 98 52      [17]  728 	call	_cpct_drawStringM0
   4E70 21 06 00      [10]  729 	ld	hl,#6
   4E73 39            [11]  730 	add	hl,sp
   4E74 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4E75                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4E75 CD FF 51      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4E78 21 04 08      [10]  737 	ld	hl,#0x0804
   4E7B CD 80 52      [17]  738 	call	_cpct_isKeyPressed
   4E7E 7D            [ 4]  739 	ld	a,l
   4E7F B7            [ 4]  740 	or	a, a
   4E80 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   4E82 CD 1A 4C      [17]  743 	call	_menuInstrucciones
   4E85 18 0D         [12]  744 	jr	00109$
   4E87                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   4E87 21 07 40      [10]  747 	ld	hl,#0x4007
   4E8A CD 80 52      [17]  748 	call	_cpct_isKeyPressed
   4E8D 7D            [ 4]  749 	ld	a,l
   4E8E B7            [ 4]  750 	or	a, a
   4E8F 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   4E91 CD 31 4D      [17]  753 	call	_menuCreditos
   4E94                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4E94 21 07 10      [10]  756 	ld	hl,#0x1007
   4E97 CD 80 52      [17]  757 	call	_cpct_isKeyPressed
   4E9A 7D            [ 4]  758 	ld	a,l
   4E9B B7            [ 4]  759 	or	a, a
   4E9C C0            [11]  760 	ret	NZ
   4E9D 21 04 08      [10]  761 	ld	hl,#0x0804
   4EA0 CD 80 52      [17]  762 	call	_cpct_isKeyPressed
   4EA3 7D            [ 4]  763 	ld	a,l
   4EA4 B7            [ 4]  764 	or	a, a
   4EA5 C0            [11]  765 	ret	NZ
   4EA6 21 07 40      [10]  766 	ld	hl,#0x4007
   4EA9 CD 80 52      [17]  767 	call	_cpct_isKeyPressed
   4EAC 7D            [ 4]  768 	ld	a,l
   4EAD B7            [ 4]  769 	or	a, a
   4EAE 28 C5         [12]  770 	jr	Z,00108$
   4EB0 C9            [10]  771 	ret
   4EB1                     772 ___str_9:
   4EB1 4D 45 4E 55         773 	.ascii "MENU"
   4EB5 00                  774 	.db 0x00
   4EB6                     775 ___str_10:
   4EB6 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4ECA 00                  777 	.db 0x00
   4ECB                     778 ___str_11:
   4ECB 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4EDA 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   4EDB                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   4EDB 21 00 40      [10]  787 	ld	hl,#0x4000
   4EDE E5            [11]  788 	push	hl
   4EDF AF            [ 4]  789 	xor	a, a
   4EE0 F5            [11]  790 	push	af
   4EE1 33            [ 6]  791 	inc	sp
   4EE2 26 C0         [ 7]  792 	ld	h, #0xC0
   4EE4 E5            [11]  793 	push	hl
   4EE5 CD 47 55      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4EE8 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   4EEB E5            [11]  797 	push	hl
   4EEC 21 00 C0      [10]  798 	ld	hl,#0xC000
   4EEF E5            [11]  799 	push	hl
   4EF0 CD 7F 5E      [17]  800 	call	_cpct_getScreenPtr
   4EF3 4D            [ 4]  801 	ld	c,l
   4EF4 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4EF5 21 04 00      [10]  804 	ld	hl,#0x0004
   4EF8 E5            [11]  805 	push	hl
   4EF9 C5            [11]  806 	push	bc
   4EFA 21 91 4F      [10]  807 	ld	hl,#___str_12
   4EFD E5            [11]  808 	push	hl
   4EFE CD 98 52      [17]  809 	call	_cpct_drawStringM0
   4F01 21 06 00      [10]  810 	ld	hl,#6
   4F04 39            [11]  811 	add	hl,sp
   4F05 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F06 21 28 6E      [10]  814 	ld	hl,#0x6E28
   4F09 E5            [11]  815 	push	hl
   4F0A 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   4F0D E5            [11]  817 	push	hl
   4F0E 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   4F11 E5            [11]  819 	push	hl
   4F12 CD BC 52      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4F15 21 28 6E      [10]  822 	ld	hl,#0x6E28
   4F18 E5            [11]  823 	push	hl
   4F19 21 18 F1      [10]  824 	ld	hl,#0xF118
   4F1C E5            [11]  825 	push	hl
   4F1D 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   4F20 E5            [11]  827 	push	hl
   4F21 CD BC 52      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4F24 21 08 A0      [10]  830 	ld	hl,#0xA008
   4F27 E5            [11]  831 	push	hl
   4F28 21 00 C0      [10]  832 	ld	hl,#0xC000
   4F2B E5            [11]  833 	push	hl
   4F2C CD 7F 5E      [17]  834 	call	_cpct_getScreenPtr
   4F2F 4D            [ 4]  835 	ld	c,l
   4F30 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4F31 21 02 00      [10]  838 	ld	hl,#0x0002
   4F34 E5            [11]  839 	push	hl
   4F35 C5            [11]  840 	push	bc
   4F36 21 99 4F      [10]  841 	ld	hl,#___str_13
   4F39 E5            [11]  842 	push	hl
   4F3A CD 98 52      [17]  843 	call	_cpct_drawStringM0
   4F3D 21 06 00      [10]  844 	ld	hl,#6
   4F40 39            [11]  845 	add	hl,sp
   4F41 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4F42 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   4F45 E5            [11]  849 	push	hl
   4F46 21 00 C0      [10]  850 	ld	hl,#0xC000
   4F49 E5            [11]  851 	push	hl
   4F4A CD 7F 5E      [17]  852 	call	_cpct_getScreenPtr
   4F4D 4D            [ 4]  853 	ld	c,l
   4F4E 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4F4F 21 02 00      [10]  856 	ld	hl,#0x0002
   4F52 E5            [11]  857 	push	hl
   4F53 C5            [11]  858 	push	bc
   4F54 21 AA 4F      [10]  859 	ld	hl,#___str_14
   4F57 E5            [11]  860 	push	hl
   4F58 CD 98 52      [17]  861 	call	_cpct_drawStringM0
   4F5B 21 06 00      [10]  862 	ld	hl,#6
   4F5E 39            [11]  863 	add	hl,sp
   4F5F F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   4F60                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   4F60 CD FF 51      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   4F63 21 04 40      [10]  870 	ld	hl,#0x4004
   4F66 CD 80 52      [17]  871 	call	_cpct_isKeyPressed
   4F69 7D            [ 4]  872 	ld	a,l
   4F6A B7            [ 4]  873 	or	a, a
   4F6B 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   4F6D CD FF 51      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   4F70                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   4F70 CD 10 4E      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   4F73 21 07 10      [10]  882 	ld	hl,#0x1007
   4F76 CD 80 52      [17]  883 	call	_cpct_isKeyPressed
   4F79 7D            [ 4]  884 	ld	a,l
   4F7A B7            [ 4]  885 	or	a, a
   4F7B 28 F3         [12]  886 	jr	Z,00101$
   4F7D                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4F7D 21 07 10      [10]  889 	ld	hl,#0x1007
   4F80 CD 80 52      [17]  890 	call	_cpct_isKeyPressed
   4F83 7D            [ 4]  891 	ld	a,l
   4F84 B7            [ 4]  892 	or	a, a
   4F85 C0            [11]  893 	ret	NZ
   4F86 21 04 40      [10]  894 	ld	hl,#0x4004
   4F89 CD 80 52      [17]  895 	call	_cpct_isKeyPressed
   4F8C 7D            [ 4]  896 	ld	a,l
   4F8D B7            [ 4]  897 	or	a, a
   4F8E 28 D0         [12]  898 	jr	Z,00107$
   4F90 C9            [10]  899 	ret
   4F91                     900 ___str_12:
   4F91 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   4F98 00                  902 	.db 0x00
   4F99                     903 ___str_13:
   4F99 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   4FA9 00                  905 	.db 0x00
   4FAA                     906 ___str_14:
   4FAA 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   4FB9 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
