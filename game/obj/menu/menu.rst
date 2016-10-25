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
   4AB0                      60 _menuFin::
   4AB0 DD E5         [15]   61 	push	ix
   4AB2 DD 21 00 00   [14]   62 	ld	ix,#0
   4AB6 DD 39         [15]   63 	add	ix,sp
   4AB8 F5            [11]   64 	push	af
   4AB9 F5            [11]   65 	push	af
   4ABA DD 75 FE      [19]   66 	ld	-2 (ix),l
   4ABD DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4AC0 21 10 27      [10]   69 	ld	hl,#0x2710
   4AC3 E5            [11]   70 	push	hl
   4AC4 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4AC7 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4ACA E5            [11]   73 	push	hl
   4ACB CD 54 52      [17]   74 	call	__divuint
   4ACE F1            [10]   75 	pop	af
   4ACF F1            [10]   76 	pop	af
   4AD0 33            [ 6]   77 	inc	sp
   4AD1 33            [ 6]   78 	inc	sp
   4AD2 E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4AD3 21 00 40      [10]   81 	ld	hl,#0x4000
   4AD6 E5            [11]   82 	push	hl
   4AD7 AF            [ 4]   83 	xor	a, a
   4AD8 F5            [11]   84 	push	af
   4AD9 33            [ 6]   85 	inc	sp
   4ADA 26 C0         [ 7]   86 	ld	h, #0xC0
   4ADC E5            [11]   87 	push	hl
   4ADD CD DD 55      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4AE0 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4AE3 E5            [11]   91 	push	hl
   4AE4 21 00 C0      [10]   92 	ld	hl,#0xC000
   4AE7 E5            [11]   93 	push	hl
   4AE8 CD 15 5F      [17]   94 	call	_cpct_getScreenPtr
   4AEB 4D            [ 4]   95 	ld	c,l
   4AEC 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4AED 21 02 00      [10]   98 	ld	hl,#0x0002
   4AF0 E5            [11]   99 	push	hl
   4AF1 C5            [11]  100 	push	bc
   4AF2 21 12 4C      [10]  101 	ld	hl,#___str_0
   4AF5 E5            [11]  102 	push	hl
   4AF6 CD 2E 53      [17]  103 	call	_cpct_drawStringM0
   4AF9 21 06 00      [10]  104 	ld	hl,#6
   4AFC 39            [11]  105 	add	hl,sp
   4AFD F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4AFE 21 14 78      [10]  108 	ld	hl,#0x7814
   4B01 E5            [11]  109 	push	hl
   4B02 21 00 C0      [10]  110 	ld	hl,#0xC000
   4B05 E5            [11]  111 	push	hl
   4B06 CD 15 5F      [17]  112 	call	_cpct_getScreenPtr
   4B09 4D            [ 4]  113 	ld	c,l
   4B0A 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4B0B 21 02 00      [10]  116 	ld	hl,#0x0002
   4B0E E5            [11]  117 	push	hl
   4B0F C5            [11]  118 	push	bc
   4B10 21 1C 4C      [10]  119 	ld	hl,#___str_1
   4B13 E5            [11]  120 	push	hl
   4B14 CD 2E 53      [17]  121 	call	_cpct_drawStringM0
   4B17 21 06 00      [10]  122 	ld	hl,#6
   4B1A 39            [11]  123 	add	hl,sp
   4B1B F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4B1C 21 2D 78      [10]  126 	ld	hl,#0x782D
   4B1F E5            [11]  127 	push	hl
   4B20 21 00 C0      [10]  128 	ld	hl,#0xC000
   4B23 E5            [11]  129 	push	hl
   4B24 CD 15 5F      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4B27 E5            [11]  132 	push	hl
   4B28 21 0A 00      [10]  133 	ld	hl,#0x000A
   4B2B E5            [11]  134 	push	hl
   4B2C DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4B2F DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4B32 E5            [11]  137 	push	hl
   4B33 CD 0A 5F      [17]  138 	call	__moduint
   4B36 F1            [10]  139 	pop	af
   4B37 F1            [10]  140 	pop	af
   4B38 C1            [10]  141 	pop	bc
   4B39 7D            [ 4]  142 	ld	a,l
   4B3A C6 30         [ 7]  143 	add	a, #0x30
   4B3C 67            [ 4]  144 	ld	h,a
   4B3D 59            [ 4]  145 	ld	e, c
   4B3E 50            [ 4]  146 	ld	d, b
   4B3F C5            [11]  147 	push	bc
   4B40 E5            [11]  148 	push	hl
   4B41 33            [ 6]  149 	inc	sp
   4B42 21 02 00      [10]  150 	ld	hl,#0x0002
   4B45 E5            [11]  151 	push	hl
   4B46 D5            [11]  152 	push	de
   4B47 CD 86 54      [17]  153 	call	_cpct_drawCharM0
   4B4A F1            [10]  154 	pop	af
   4B4B 33            [ 6]  155 	inc	sp
   4B4C 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4B4F E3            [19]  157 	ex	(sp),hl
   4B50 DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4B53 DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4B56 E5            [11]  160 	push	hl
   4B57 CD 54 52      [17]  161 	call	__divuint
   4B5A F1            [10]  162 	pop	af
   4B5B F1            [10]  163 	pop	af
   4B5C 11 0A 00      [10]  164 	ld	de,#0x000A
   4B5F D5            [11]  165 	push	de
   4B60 E5            [11]  166 	push	hl
   4B61 CD 0A 5F      [17]  167 	call	__moduint
   4B64 F1            [10]  168 	pop	af
   4B65 F1            [10]  169 	pop	af
   4B66 C1            [10]  170 	pop	bc
   4B67 7D            [ 4]  171 	ld	a,l
   4B68 C6 30         [ 7]  172 	add	a, #0x30
   4B6A 67            [ 4]  173 	ld	h,a
   4B6B 79            [ 4]  174 	ld	a,c
   4B6C C6 04         [ 7]  175 	add	a, #0x04
   4B6E 5F            [ 4]  176 	ld	e,a
   4B6F 78            [ 4]  177 	ld	a,b
   4B70 CE 00         [ 7]  178 	adc	a, #0x00
   4B72 57            [ 4]  179 	ld	d,a
   4B73 C5            [11]  180 	push	bc
   4B74 E5            [11]  181 	push	hl
   4B75 33            [ 6]  182 	inc	sp
   4B76 21 02 00      [10]  183 	ld	hl,#0x0002
   4B79 E5            [11]  184 	push	hl
   4B7A D5            [11]  185 	push	de
   4B7B CD 86 54      [17]  186 	call	_cpct_drawCharM0
   4B7E F1            [10]  187 	pop	af
   4B7F 33            [ 6]  188 	inc	sp
   4B80 21 64 00      [10]  189 	ld	hl,#0x0064
   4B83 E3            [19]  190 	ex	(sp),hl
   4B84 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4B87 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4B8A E5            [11]  193 	push	hl
   4B8B CD 54 52      [17]  194 	call	__divuint
   4B8E F1            [10]  195 	pop	af
   4B8F F1            [10]  196 	pop	af
   4B90 11 0A 00      [10]  197 	ld	de,#0x000A
   4B93 D5            [11]  198 	push	de
   4B94 E5            [11]  199 	push	hl
   4B95 CD 0A 5F      [17]  200 	call	__moduint
   4B98 F1            [10]  201 	pop	af
   4B99 F1            [10]  202 	pop	af
   4B9A C1            [10]  203 	pop	bc
   4B9B 7D            [ 4]  204 	ld	a,l
   4B9C C6 30         [ 7]  205 	add	a, #0x30
   4B9E 67            [ 4]  206 	ld	h,a
   4B9F 79            [ 4]  207 	ld	a,c
   4BA0 C6 08         [ 7]  208 	add	a, #0x08
   4BA2 5F            [ 4]  209 	ld	e,a
   4BA3 78            [ 4]  210 	ld	a,b
   4BA4 CE 00         [ 7]  211 	adc	a, #0x00
   4BA6 57            [ 4]  212 	ld	d,a
   4BA7 C5            [11]  213 	push	bc
   4BA8 E5            [11]  214 	push	hl
   4BA9 33            [ 6]  215 	inc	sp
   4BAA 21 02 00      [10]  216 	ld	hl,#0x0002
   4BAD E5            [11]  217 	push	hl
   4BAE D5            [11]  218 	push	de
   4BAF CD 86 54      [17]  219 	call	_cpct_drawCharM0
   4BB2 F1            [10]  220 	pop	af
   4BB3 33            [ 6]  221 	inc	sp
   4BB4 21 0A 00      [10]  222 	ld	hl,#0x000A
   4BB7 E3            [19]  223 	ex	(sp),hl
   4BB8 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4BBB DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4BBE E5            [11]  226 	push	hl
   4BBF CD 54 52      [17]  227 	call	__divuint
   4BC2 F1            [10]  228 	pop	af
   4BC3 F1            [10]  229 	pop	af
   4BC4 11 0A 00      [10]  230 	ld	de,#0x000A
   4BC7 D5            [11]  231 	push	de
   4BC8 E5            [11]  232 	push	hl
   4BC9 CD 0A 5F      [17]  233 	call	__moduint
   4BCC F1            [10]  234 	pop	af
   4BCD F1            [10]  235 	pop	af
   4BCE C1            [10]  236 	pop	bc
   4BCF 7D            [ 4]  237 	ld	a,l
   4BD0 C6 30         [ 7]  238 	add	a, #0x30
   4BD2 67            [ 4]  239 	ld	h,a
   4BD3 79            [ 4]  240 	ld	a,c
   4BD4 C6 0C         [ 7]  241 	add	a, #0x0C
   4BD6 5F            [ 4]  242 	ld	e,a
   4BD7 78            [ 4]  243 	ld	a,b
   4BD8 CE 00         [ 7]  244 	adc	a, #0x00
   4BDA 57            [ 4]  245 	ld	d,a
   4BDB C5            [11]  246 	push	bc
   4BDC E5            [11]  247 	push	hl
   4BDD 33            [ 6]  248 	inc	sp
   4BDE 21 02 00      [10]  249 	ld	hl,#0x0002
   4BE1 E5            [11]  250 	push	hl
   4BE2 D5            [11]  251 	push	de
   4BE3 CD 86 54      [17]  252 	call	_cpct_drawCharM0
   4BE6 F1            [10]  253 	pop	af
   4BE7 33            [ 6]  254 	inc	sp
   4BE8 21 0A 00      [10]  255 	ld	hl,#0x000A
   4BEB E3            [19]  256 	ex	(sp),hl
   4BEC DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4BEF DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4BF2 E5            [11]  259 	push	hl
   4BF3 CD 0A 5F      [17]  260 	call	__moduint
   4BF6 F1            [10]  261 	pop	af
   4BF7 F1            [10]  262 	pop	af
   4BF8 C1            [10]  263 	pop	bc
   4BF9 7D            [ 4]  264 	ld	a,l
   4BFA C6 30         [ 7]  265 	add	a, #0x30
   4BFC 57            [ 4]  266 	ld	d,a
   4BFD 21 10 00      [10]  267 	ld	hl,#0x0010
   4C00 09            [11]  268 	add	hl,bc
   4C01 4D            [ 4]  269 	ld	c,l
   4C02 44            [ 4]  270 	ld	b,h
   4C03 D5            [11]  271 	push	de
   4C04 33            [ 6]  272 	inc	sp
   4C05 21 02 00      [10]  273 	ld	hl,#0x0002
   4C08 E5            [11]  274 	push	hl
   4C09 C5            [11]  275 	push	bc
   4C0A CD 86 54      [17]  276 	call	_cpct_drawCharM0
   4C0D F1            [10]  277 	pop	af
   4C0E F1            [10]  278 	pop	af
   4C0F 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4C10                     281 00102$:
   4C10 18 FE         [12]  282 	jr	00102$
   4C12                     283 ___str_0:
   4C12 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4C1B 00                  285 	.db 0x00
   4C1C                     286 ___str_1:
   4C1C 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4C23 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4C24                     293 _borrarPantalla::
   4C24 DD E5         [15]  294 	push	ix
   4C26 DD 21 00 00   [14]  295 	ld	ix,#0
   4C2A DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4C2C 3E 28         [ 7]  298 	ld	a,#0x28
   4C2E DD 96 06      [19]  299 	sub	a, 6 (ix)
   4C31 3E 00         [ 7]  300 	ld	a,#0x00
   4C33 17            [ 4]  301 	rla
   4C34 4F            [ 4]  302 	ld	c,a
   4C35 CB 41         [ 8]  303 	bit	0,c
   4C37 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4C39 DD 66 05      [19]  306 	ld	h,5 (ix)
   4C3C DD 6E 04      [19]  307 	ld	l,4 (ix)
   4C3F E5            [11]  308 	push	hl
   4C40 21 00 C0      [10]  309 	ld	hl,#0xC000
   4C43 E5            [11]  310 	push	hl
   4C44 CD 15 5F      [17]  311 	call	_cpct_getScreenPtr
   4C47 4D            [ 4]  312 	ld	c,l
   4C48 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4C49 DD 66 07      [19]  315 	ld	h,7 (ix)
   4C4C DD 6E 06      [19]  316 	ld	l,6 (ix)
   4C4F E5            [11]  317 	push	hl
   4C50 AF            [ 4]  318 	xor	a, a
   4C51 F5            [11]  319 	push	af
   4C52 33            [ 6]  320 	inc	sp
   4C53 C5            [11]  321 	push	bc
   4C54 CD FB 55      [17]  322 	call	_cpct_drawSolidBox
   4C57 F1            [10]  323 	pop	af
   4C58 F1            [10]  324 	pop	af
   4C59 33            [ 6]  325 	inc	sp
   4C5A 18 51         [12]  326 	jr	00106$
   4C5C                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4C5C CB 41         [ 8]  329 	bit	0,c
   4C5E 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4C60 DD 66 05      [19]  332 	ld	h,5 (ix)
   4C63 DD 6E 04      [19]  333 	ld	l,4 (ix)
   4C66 E5            [11]  334 	push	hl
   4C67 21 00 C0      [10]  335 	ld	hl,#0xC000
   4C6A E5            [11]  336 	push	hl
   4C6B CD 15 5F      [17]  337 	call	_cpct_getScreenPtr
   4C6E 4D            [ 4]  338 	ld	c,l
   4C6F 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4C70 DD 7E 07      [19]  341 	ld	a,7 (ix)
   4C73 F5            [11]  342 	push	af
   4C74 33            [ 6]  343 	inc	sp
   4C75 21 00 28      [10]  344 	ld	hl,#0x2800
   4C78 E5            [11]  345 	push	hl
   4C79 C5            [11]  346 	push	bc
   4C7A CD FB 55      [17]  347 	call	_cpct_drawSolidBox
   4C7D F1            [10]  348 	pop	af
   4C7E F1            [10]  349 	pop	af
   4C7F 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4C80 DD 7E 04      [19]  352 	ld	a,4 (ix)
   4C83 C6 28         [ 7]  353 	add	a, #0x28
   4C85 47            [ 4]  354 	ld	b,a
   4C86 DD 7E 05      [19]  355 	ld	a,5 (ix)
   4C89 F5            [11]  356 	push	af
   4C8A 33            [ 6]  357 	inc	sp
   4C8B C5            [11]  358 	push	bc
   4C8C 33            [ 6]  359 	inc	sp
   4C8D 21 00 C0      [10]  360 	ld	hl,#0xC000
   4C90 E5            [11]  361 	push	hl
   4C91 CD 15 5F      [17]  362 	call	_cpct_getScreenPtr
   4C94 4D            [ 4]  363 	ld	c,l
   4C95 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C96 DD 7E 06      [19]  366 	ld	a,6 (ix)
   4C99 C6 D8         [ 7]  367 	add	a,#0xD8
   4C9B 57            [ 4]  368 	ld	d,a
   4C9C DD 7E 07      [19]  369 	ld	a,7 (ix)
   4C9F F5            [11]  370 	push	af
   4CA0 33            [ 6]  371 	inc	sp
   4CA1 D5            [11]  372 	push	de
   4CA2 33            [ 6]  373 	inc	sp
   4CA3 AF            [ 4]  374 	xor	a, a
   4CA4 F5            [11]  375 	push	af
   4CA5 33            [ 6]  376 	inc	sp
   4CA6 C5            [11]  377 	push	bc
   4CA7 CD FB 55      [17]  378 	call	_cpct_drawSolidBox
   4CAA F1            [10]  379 	pop	af
   4CAB F1            [10]  380 	pop	af
   4CAC 33            [ 6]  381 	inc	sp
   4CAD                     382 00106$:
   4CAD DD E1         [14]  383 	pop	ix
   4CAF C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4CB0                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4CB0 21 50 82      [10]  391 	ld	hl,#0x8250
   4CB3 E5            [11]  392 	push	hl
   4CB4 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4CB7 E5            [11]  394 	push	hl
   4CB8 CD 24 4C      [17]  395 	call	_borrarPantalla
   4CBB F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4CBC 21 10 55      [10]  398 	ld	hl, #0x5510
   4CBF E3            [19]  399 	ex	(sp),hl
   4CC0 21 00 C0      [10]  400 	ld	hl,#0xC000
   4CC3 E5            [11]  401 	push	hl
   4CC4 CD 15 5F      [17]  402 	call	_cpct_getScreenPtr
   4CC7 4D            [ 4]  403 	ld	c,l
   4CC8 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4CC9 21 02 00      [10]  406 	ld	hl,#0x0002
   4CCC E5            [11]  407 	push	hl
   4CCD C5            [11]  408 	push	bc
   4CCE 21 9E 4D      [10]  409 	ld	hl,#___str_2
   4CD1 E5            [11]  410 	push	hl
   4CD2 CD 2E 53      [17]  411 	call	_cpct_drawStringM0
   4CD5 21 06 00      [10]  412 	ld	hl,#6
   4CD8 39            [11]  413 	add	hl,sp
   4CD9 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4CDA 21 04 73      [10]  416 	ld	hl,#0x7304
   4CDD E5            [11]  417 	push	hl
   4CDE 21 00 C0      [10]  418 	ld	hl,#0xC000
   4CE1 E5            [11]  419 	push	hl
   4CE2 CD 15 5F      [17]  420 	call	_cpct_getScreenPtr
   4CE5 4D            [ 4]  421 	ld	c,l
   4CE6 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CE7 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4CEA E5            [11]  425 	push	hl
   4CEB C5            [11]  426 	push	bc
   4CEC 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4CEF E5            [11]  428 	push	hl
   4CF0 CD 52 53      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4CF3 21 0E 73      [10]  431 	ld	hl,#0x730E
   4CF6 E5            [11]  432 	push	hl
   4CF7 21 00 C0      [10]  433 	ld	hl,#0xC000
   4CFA E5            [11]  434 	push	hl
   4CFB CD 15 5F      [17]  435 	call	_cpct_getScreenPtr
   4CFE 4D            [ 4]  436 	ld	c,l
   4CFF 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D00 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4D03 E5            [11]  440 	push	hl
   4D04 C5            [11]  441 	push	bc
   4D05 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4D08 E5            [11]  443 	push	hl
   4D09 CD 52 53      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4D0C 21 18 73      [10]  446 	ld	hl,#0x7318
   4D0F E5            [11]  447 	push	hl
   4D10 21 00 C0      [10]  448 	ld	hl,#0xC000
   4D13 E5            [11]  449 	push	hl
   4D14 CD 15 5F      [17]  450 	call	_cpct_getScreenPtr
   4D17 4D            [ 4]  451 	ld	c,l
   4D18 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D19 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4D1C E5            [11]  455 	push	hl
   4D1D C5            [11]  456 	push	bc
   4D1E 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4D21 E5            [11]  458 	push	hl
   4D22 CD 52 53      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4D25 21 22 73      [10]  461 	ld	hl,#0x7322
   4D28 E5            [11]  462 	push	hl
   4D29 21 00 C0      [10]  463 	ld	hl,#0xC000
   4D2C E5            [11]  464 	push	hl
   4D2D CD 15 5F      [17]  465 	call	_cpct_getScreenPtr
   4D30 4D            [ 4]  466 	ld	c,l
   4D31 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D32 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4D35 E5            [11]  470 	push	hl
   4D36 C5            [11]  471 	push	bc
   4D37 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4D3A E5            [11]  473 	push	hl
   4D3B CD 52 53      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4D3E 21 2D 73      [10]  476 	ld	hl,#0x732D
   4D41 E5            [11]  477 	push	hl
   4D42 21 00 C0      [10]  478 	ld	hl,#0xC000
   4D45 E5            [11]  479 	push	hl
   4D46 CD 15 5F      [17]  480 	call	_cpct_getScreenPtr
   4D49 4D            [ 4]  481 	ld	c,l
   4D4A 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4D4B 21 02 00      [10]  484 	ld	hl,#0x0002
   4D4E E5            [11]  485 	push	hl
   4D4F C5            [11]  486 	push	bc
   4D50 21 AB 4D      [10]  487 	ld	hl,#___str_3
   4D53 E5            [11]  488 	push	hl
   4D54 CD 2E 53      [17]  489 	call	_cpct_drawStringM0
   4D57 21 06 00      [10]  490 	ld	hl,#6
   4D5A 39            [11]  491 	add	hl,sp
   4D5B F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4D5C 21 04 82      [10]  494 	ld	hl,#0x8204
   4D5F E5            [11]  495 	push	hl
   4D60 21 00 C0      [10]  496 	ld	hl,#0xC000
   4D63 E5            [11]  497 	push	hl
   4D64 CD 15 5F      [17]  498 	call	_cpct_getScreenPtr
   4D67 4D            [ 4]  499 	ld	c,l
   4D68 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4D69 21 02 00      [10]  502 	ld	hl,#0x0002
   4D6C E5            [11]  503 	push	hl
   4D6D C5            [11]  504 	push	bc
   4D6E 21 B4 4D      [10]  505 	ld	hl,#___str_4
   4D71 E5            [11]  506 	push	hl
   4D72 CD 2E 53      [17]  507 	call	_cpct_drawStringM0
   4D75 21 06 00      [10]  508 	ld	hl,#6
   4D78 39            [11]  509 	add	hl,sp
   4D79 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4D7A                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4D7A CD 95 52      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4D7D 21 04 40      [10]  516 	ld	hl,#0x4004
   4D80 CD 16 53      [17]  517 	call	_cpct_isKeyPressed
   4D83 7D            [ 4]  518 	ld	a,l
   4D84 B7            [ 4]  519 	or	a, a
   4D85 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4D87 CD A6 4E      [17]  522 	call	_menuOpciones
   4D8A                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4D8A 21 07 10      [10]  525 	ld	hl,#0x1007
   4D8D CD 16 53      [17]  526 	call	_cpct_isKeyPressed
   4D90 7D            [ 4]  527 	ld	a,l
   4D91 B7            [ 4]  528 	or	a, a
   4D92 C0            [11]  529 	ret	NZ
   4D93 21 04 40      [10]  530 	ld	hl,#0x4004
   4D96 CD 16 53      [17]  531 	call	_cpct_isKeyPressed
   4D99 7D            [ 4]  532 	ld	a,l
   4D9A B7            [ 4]  533 	or	a, a
   4D9B 28 DD         [12]  534 	jr	Z,00104$
   4D9D C9            [10]  535 	ret
   4D9E                     536 ___str_2:
   4D9E 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4DAA 00                  538 	.db 0x00
   4DAB                     539 ___str_3:
   4DAB 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4DB3 00                  541 	.db 0x00
   4DB4                     542 ___str_4:
   4DB4 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4DC6 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4DC7                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4DC7 21 50 82      [10]  551 	ld	hl,#0x8250
   4DCA E5            [11]  552 	push	hl
   4DCB 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4DCE E5            [11]  554 	push	hl
   4DCF CD 24 4C      [17]  555 	call	_borrarPantalla
   4DD2 F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4DD3 21 1A 46      [10]  558 	ld	hl, #0x461A
   4DD6 E3            [19]  559 	ex	(sp),hl
   4DD7 21 00 C0      [10]  560 	ld	hl,#0xC000
   4DDA E5            [11]  561 	push	hl
   4DDB CD 15 5F      [17]  562 	call	_cpct_getScreenPtr
   4DDE 4D            [ 4]  563 	ld	c,l
   4DDF 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4DE0 21 02 00      [10]  566 	ld	hl,#0x0002
   4DE3 E5            [11]  567 	push	hl
   4DE4 C5            [11]  568 	push	bc
   4DE5 21 6F 4E      [10]  569 	ld	hl,#___str_5
   4DE8 E5            [11]  570 	push	hl
   4DE9 CD 2E 53      [17]  571 	call	_cpct_drawStringM0
   4DEC 21 06 00      [10]  572 	ld	hl,#6
   4DEF 39            [11]  573 	add	hl,sp
   4DF0 F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4DF1 21 0A 64      [10]  576 	ld	hl,#0x640A
   4DF4 E5            [11]  577 	push	hl
   4DF5 21 00 C0      [10]  578 	ld	hl,#0xC000
   4DF8 E5            [11]  579 	push	hl
   4DF9 CD 15 5F      [17]  580 	call	_cpct_getScreenPtr
   4DFC 4D            [ 4]  581 	ld	c,l
   4DFD 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4DFE 21 02 00      [10]  584 	ld	hl,#0x0002
   4E01 E5            [11]  585 	push	hl
   4E02 C5            [11]  586 	push	bc
   4E03 21 77 4E      [10]  587 	ld	hl,#___str_6
   4E06 E5            [11]  588 	push	hl
   4E07 CD 2E 53      [17]  589 	call	_cpct_drawStringM0
   4E0A 21 06 00      [10]  590 	ld	hl,#6
   4E0D 39            [11]  591 	add	hl,sp
   4E0E F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4E0F 21 0E 73      [10]  594 	ld	hl,#0x730E
   4E12 E5            [11]  595 	push	hl
   4E13 21 00 C0      [10]  596 	ld	hl,#0xC000
   4E16 E5            [11]  597 	push	hl
   4E17 CD 15 5F      [17]  598 	call	_cpct_getScreenPtr
   4E1A 4D            [ 4]  599 	ld	c,l
   4E1B 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4E1C 21 02 00      [10]  602 	ld	hl,#0x0002
   4E1F E5            [11]  603 	push	hl
   4E20 C5            [11]  604 	push	bc
   4E21 21 87 4E      [10]  605 	ld	hl,#___str_7
   4E24 E5            [11]  606 	push	hl
   4E25 CD 2E 53      [17]  607 	call	_cpct_drawStringM0
   4E28 21 06 00      [10]  608 	ld	hl,#6
   4E2B 39            [11]  609 	add	hl,sp
   4E2C F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4E2D 21 08 82      [10]  612 	ld	hl,#0x8208
   4E30 E5            [11]  613 	push	hl
   4E31 21 00 C0      [10]  614 	ld	hl,#0xC000
   4E34 E5            [11]  615 	push	hl
   4E35 CD 15 5F      [17]  616 	call	_cpct_getScreenPtr
   4E38 4D            [ 4]  617 	ld	c,l
   4E39 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4E3A 21 02 00      [10]  620 	ld	hl,#0x0002
   4E3D E5            [11]  621 	push	hl
   4E3E C5            [11]  622 	push	bc
   4E3F 21 95 4E      [10]  623 	ld	hl,#___str_8
   4E42 E5            [11]  624 	push	hl
   4E43 CD 2E 53      [17]  625 	call	_cpct_drawStringM0
   4E46 21 06 00      [10]  626 	ld	hl,#6
   4E49 39            [11]  627 	add	hl,sp
   4E4A F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4E4B                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4E4B CD 95 52      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4E4E 21 04 40      [10]  634 	ld	hl,#0x4004
   4E51 CD 16 53      [17]  635 	call	_cpct_isKeyPressed
   4E54 7D            [ 4]  636 	ld	a,l
   4E55 B7            [ 4]  637 	or	a, a
   4E56 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4E58 CD A6 4E      [17]  640 	call	_menuOpciones
   4E5B                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E5B 21 07 10      [10]  643 	ld	hl,#0x1007
   4E5E CD 16 53      [17]  644 	call	_cpct_isKeyPressed
   4E61 7D            [ 4]  645 	ld	a,l
   4E62 B7            [ 4]  646 	or	a, a
   4E63 C0            [11]  647 	ret	NZ
   4E64 21 04 40      [10]  648 	ld	hl,#0x4004
   4E67 CD 16 53      [17]  649 	call	_cpct_isKeyPressed
   4E6A 7D            [ 4]  650 	ld	a,l
   4E6B B7            [ 4]  651 	or	a, a
   4E6C 28 DD         [12]  652 	jr	Z,00104$
   4E6E C9            [10]  653 	ret
   4E6F                     654 ___str_5:
   4E6F 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4E76 00                  656 	.db 0x00
   4E77                     657 ___str_6:
   4E77 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4E86 00                  659 	.db 0x00
   4E87                     660 ___str_7:
   4E87 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4E94 00                  662 	.db 0x00
   4E95                     663 ___str_8:
   4E95 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4EA5 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4EA6                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4EA6 21 50 82      [10]  672 	ld	hl,#0x8250
   4EA9 E5            [11]  673 	push	hl
   4EAA 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4EAD E5            [11]  675 	push	hl
   4EAE CD 24 4C      [17]  676 	call	_borrarPantalla
   4EB1 F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4EB2 21 20 64      [10]  679 	ld	hl, #0x6420
   4EB5 E3            [19]  680 	ex	(sp),hl
   4EB6 21 00 C0      [10]  681 	ld	hl,#0xC000
   4EB9 E5            [11]  682 	push	hl
   4EBA CD 15 5F      [17]  683 	call	_cpct_getScreenPtr
   4EBD 4D            [ 4]  684 	ld	c,l
   4EBE 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4EBF 21 02 00      [10]  687 	ld	hl,#0x0002
   4EC2 E5            [11]  688 	push	hl
   4EC3 C5            [11]  689 	push	bc
   4EC4 21 47 4F      [10]  690 	ld	hl,#___str_9
   4EC7 E5            [11]  691 	push	hl
   4EC8 CD 2E 53      [17]  692 	call	_cpct_drawStringM0
   4ECB 21 06 00      [10]  693 	ld	hl,#6
   4ECE 39            [11]  694 	add	hl,sp
   4ECF F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4ED0 21 00 82      [10]  697 	ld	hl,#0x8200
   4ED3 E5            [11]  698 	push	hl
   4ED4 26 C0         [ 7]  699 	ld	h, #0xC0
   4ED6 E5            [11]  700 	push	hl
   4ED7 CD 15 5F      [17]  701 	call	_cpct_getScreenPtr
   4EDA 4D            [ 4]  702 	ld	c,l
   4EDB 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4EDC 21 02 00      [10]  705 	ld	hl,#0x0002
   4EDF E5            [11]  706 	push	hl
   4EE0 C5            [11]  707 	push	bc
   4EE1 21 4C 4F      [10]  708 	ld	hl,#___str_10
   4EE4 E5            [11]  709 	push	hl
   4EE5 CD 2E 53      [17]  710 	call	_cpct_drawStringM0
   4EE8 21 06 00      [10]  711 	ld	hl,#6
   4EEB 39            [11]  712 	add	hl,sp
   4EEC F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4EED 21 0A 91      [10]  715 	ld	hl,#0x910A
   4EF0 E5            [11]  716 	push	hl
   4EF1 21 00 C0      [10]  717 	ld	hl,#0xC000
   4EF4 E5            [11]  718 	push	hl
   4EF5 CD 15 5F      [17]  719 	call	_cpct_getScreenPtr
   4EF8 4D            [ 4]  720 	ld	c,l
   4EF9 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4EFA 21 02 00      [10]  723 	ld	hl,#0x0002
   4EFD E5            [11]  724 	push	hl
   4EFE C5            [11]  725 	push	bc
   4EFF 21 61 4F      [10]  726 	ld	hl,#___str_11
   4F02 E5            [11]  727 	push	hl
   4F03 CD 2E 53      [17]  728 	call	_cpct_drawStringM0
   4F06 21 06 00      [10]  729 	ld	hl,#6
   4F09 39            [11]  730 	add	hl,sp
   4F0A F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4F0B                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4F0B CD 95 52      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4F0E 21 04 08      [10]  737 	ld	hl,#0x0804
   4F11 CD 16 53      [17]  738 	call	_cpct_isKeyPressed
   4F14 7D            [ 4]  739 	ld	a,l
   4F15 B7            [ 4]  740 	or	a, a
   4F16 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   4F18 CD B0 4C      [17]  743 	call	_menuInstrucciones
   4F1B 18 0D         [12]  744 	jr	00109$
   4F1D                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   4F1D 21 07 40      [10]  747 	ld	hl,#0x4007
   4F20 CD 16 53      [17]  748 	call	_cpct_isKeyPressed
   4F23 7D            [ 4]  749 	ld	a,l
   4F24 B7            [ 4]  750 	or	a, a
   4F25 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   4F27 CD C7 4D      [17]  753 	call	_menuCreditos
   4F2A                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4F2A 21 07 10      [10]  756 	ld	hl,#0x1007
   4F2D CD 16 53      [17]  757 	call	_cpct_isKeyPressed
   4F30 7D            [ 4]  758 	ld	a,l
   4F31 B7            [ 4]  759 	or	a, a
   4F32 C0            [11]  760 	ret	NZ
   4F33 21 04 08      [10]  761 	ld	hl,#0x0804
   4F36 CD 16 53      [17]  762 	call	_cpct_isKeyPressed
   4F39 7D            [ 4]  763 	ld	a,l
   4F3A B7            [ 4]  764 	or	a, a
   4F3B C0            [11]  765 	ret	NZ
   4F3C 21 07 40      [10]  766 	ld	hl,#0x4007
   4F3F CD 16 53      [17]  767 	call	_cpct_isKeyPressed
   4F42 7D            [ 4]  768 	ld	a,l
   4F43 B7            [ 4]  769 	or	a, a
   4F44 28 C5         [12]  770 	jr	Z,00108$
   4F46 C9            [10]  771 	ret
   4F47                     772 ___str_9:
   4F47 4D 45 4E 55         773 	.ascii "MENU"
   4F4B 00                  774 	.db 0x00
   4F4C                     775 ___str_10:
   4F4C 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4F60 00                  777 	.db 0x00
   4F61                     778 ___str_11:
   4F61 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4F70 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   4F71                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   4F71 21 00 40      [10]  787 	ld	hl,#0x4000
   4F74 E5            [11]  788 	push	hl
   4F75 AF            [ 4]  789 	xor	a, a
   4F76 F5            [11]  790 	push	af
   4F77 33            [ 6]  791 	inc	sp
   4F78 26 C0         [ 7]  792 	ld	h, #0xC0
   4F7A E5            [11]  793 	push	hl
   4F7B CD DD 55      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4F7E 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   4F81 E5            [11]  797 	push	hl
   4F82 21 00 C0      [10]  798 	ld	hl,#0xC000
   4F85 E5            [11]  799 	push	hl
   4F86 CD 15 5F      [17]  800 	call	_cpct_getScreenPtr
   4F89 4D            [ 4]  801 	ld	c,l
   4F8A 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4F8B 21 04 00      [10]  804 	ld	hl,#0x0004
   4F8E E5            [11]  805 	push	hl
   4F8F C5            [11]  806 	push	bc
   4F90 21 27 50      [10]  807 	ld	hl,#___str_12
   4F93 E5            [11]  808 	push	hl
   4F94 CD 2E 53      [17]  809 	call	_cpct_drawStringM0
   4F97 21 06 00      [10]  810 	ld	hl,#6
   4F9A 39            [11]  811 	add	hl,sp
   4F9B F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F9C 21 28 6E      [10]  814 	ld	hl,#0x6E28
   4F9F E5            [11]  815 	push	hl
   4FA0 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   4FA3 E5            [11]  817 	push	hl
   4FA4 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   4FA7 E5            [11]  819 	push	hl
   4FA8 CD 52 53      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4FAB 21 28 6E      [10]  822 	ld	hl,#0x6E28
   4FAE E5            [11]  823 	push	hl
   4FAF 21 18 F1      [10]  824 	ld	hl,#0xF118
   4FB2 E5            [11]  825 	push	hl
   4FB3 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   4FB6 E5            [11]  827 	push	hl
   4FB7 CD 52 53      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4FBA 21 08 A0      [10]  830 	ld	hl,#0xA008
   4FBD E5            [11]  831 	push	hl
   4FBE 21 00 C0      [10]  832 	ld	hl,#0xC000
   4FC1 E5            [11]  833 	push	hl
   4FC2 CD 15 5F      [17]  834 	call	_cpct_getScreenPtr
   4FC5 4D            [ 4]  835 	ld	c,l
   4FC6 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4FC7 21 02 00      [10]  838 	ld	hl,#0x0002
   4FCA E5            [11]  839 	push	hl
   4FCB C5            [11]  840 	push	bc
   4FCC 21 2F 50      [10]  841 	ld	hl,#___str_13
   4FCF E5            [11]  842 	push	hl
   4FD0 CD 2E 53      [17]  843 	call	_cpct_drawStringM0
   4FD3 21 06 00      [10]  844 	ld	hl,#6
   4FD6 39            [11]  845 	add	hl,sp
   4FD7 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4FD8 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   4FDB E5            [11]  849 	push	hl
   4FDC 21 00 C0      [10]  850 	ld	hl,#0xC000
   4FDF E5            [11]  851 	push	hl
   4FE0 CD 15 5F      [17]  852 	call	_cpct_getScreenPtr
   4FE3 4D            [ 4]  853 	ld	c,l
   4FE4 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4FE5 21 02 00      [10]  856 	ld	hl,#0x0002
   4FE8 E5            [11]  857 	push	hl
   4FE9 C5            [11]  858 	push	bc
   4FEA 21 40 50      [10]  859 	ld	hl,#___str_14
   4FED E5            [11]  860 	push	hl
   4FEE CD 2E 53      [17]  861 	call	_cpct_drawStringM0
   4FF1 21 06 00      [10]  862 	ld	hl,#6
   4FF4 39            [11]  863 	add	hl,sp
   4FF5 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   4FF6                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   4FF6 CD 95 52      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   4FF9 21 04 40      [10]  870 	ld	hl,#0x4004
   4FFC CD 16 53      [17]  871 	call	_cpct_isKeyPressed
   4FFF 7D            [ 4]  872 	ld	a,l
   5000 B7            [ 4]  873 	or	a, a
   5001 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   5003 CD 95 52      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   5006                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   5006 CD A6 4E      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   5009 21 07 10      [10]  882 	ld	hl,#0x1007
   500C CD 16 53      [17]  883 	call	_cpct_isKeyPressed
   500F 7D            [ 4]  884 	ld	a,l
   5010 B7            [ 4]  885 	or	a, a
   5011 28 F3         [12]  886 	jr	Z,00101$
   5013                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   5013 21 07 10      [10]  889 	ld	hl,#0x1007
   5016 CD 16 53      [17]  890 	call	_cpct_isKeyPressed
   5019 7D            [ 4]  891 	ld	a,l
   501A B7            [ 4]  892 	or	a, a
   501B C0            [11]  893 	ret	NZ
   501C 21 04 40      [10]  894 	ld	hl,#0x4004
   501F CD 16 53      [17]  895 	call	_cpct_isKeyPressed
   5022 7D            [ 4]  896 	ld	a,l
   5023 B7            [ 4]  897 	or	a, a
   5024 28 D0         [12]  898 	jr	Z,00107$
   5026 C9            [10]  899 	ret
   5027                     900 ___str_12:
   5027 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   502E 00                  902 	.db 0x00
   502F                     903 ___str_13:
   502F 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   503F 00                  905 	.db 0x00
   5040                     906 ___str_14:
   5040 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   504F 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
