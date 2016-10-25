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
   4A5C                      60 _menuFin::
   4A5C DD E5         [15]   61 	push	ix
   4A5E DD 21 00 00   [14]   62 	ld	ix,#0
   4A62 DD 39         [15]   63 	add	ix,sp
   4A64 F5            [11]   64 	push	af
   4A65 F5            [11]   65 	push	af
   4A66 DD 75 FE      [19]   66 	ld	-2 (ix),l
   4A69 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   4A6C 21 10 27      [10]   69 	ld	hl,#0x2710
   4A6F E5            [11]   70 	push	hl
   4A70 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   4A73 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   4A76 E5            [11]   73 	push	hl
   4A77 CD 00 52      [17]   74 	call	__divuint
   4A7A F1            [10]   75 	pop	af
   4A7B F1            [10]   76 	pop	af
   4A7C 33            [ 6]   77 	inc	sp
   4A7D 33            [ 6]   78 	inc	sp
   4A7E E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   4A7F 21 00 40      [10]   81 	ld	hl,#0x4000
   4A82 E5            [11]   82 	push	hl
   4A83 AF            [ 4]   83 	xor	a, a
   4A84 F5            [11]   84 	push	af
   4A85 33            [ 6]   85 	inc	sp
   4A86 26 C0         [ 7]   86 	ld	h, #0xC0
   4A88 E5            [11]   87 	push	hl
   4A89 CD 89 55      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   4A8C 21 18 5A      [10]   90 	ld	hl,#0x5A18
   4A8F E5            [11]   91 	push	hl
   4A90 21 00 C0      [10]   92 	ld	hl,#0xC000
   4A93 E5            [11]   93 	push	hl
   4A94 CD C1 5E      [17]   94 	call	_cpct_getScreenPtr
   4A97 4D            [ 4]   95 	ld	c,l
   4A98 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   4A99 21 02 00      [10]   98 	ld	hl,#0x0002
   4A9C E5            [11]   99 	push	hl
   4A9D C5            [11]  100 	push	bc
   4A9E 21 BE 4B      [10]  101 	ld	hl,#___str_0
   4AA1 E5            [11]  102 	push	hl
   4AA2 CD DA 52      [17]  103 	call	_cpct_drawStringM0
   4AA5 21 06 00      [10]  104 	ld	hl,#6
   4AA8 39            [11]  105 	add	hl,sp
   4AA9 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   4AAA 21 14 78      [10]  108 	ld	hl,#0x7814
   4AAD E5            [11]  109 	push	hl
   4AAE 21 00 C0      [10]  110 	ld	hl,#0xC000
   4AB1 E5            [11]  111 	push	hl
   4AB2 CD C1 5E      [17]  112 	call	_cpct_getScreenPtr
   4AB5 4D            [ 4]  113 	ld	c,l
   4AB6 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   4AB7 21 02 00      [10]  116 	ld	hl,#0x0002
   4ABA E5            [11]  117 	push	hl
   4ABB C5            [11]  118 	push	bc
   4ABC 21 C8 4B      [10]  119 	ld	hl,#___str_1
   4ABF E5            [11]  120 	push	hl
   4AC0 CD DA 52      [17]  121 	call	_cpct_drawStringM0
   4AC3 21 06 00      [10]  122 	ld	hl,#6
   4AC6 39            [11]  123 	add	hl,sp
   4AC7 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   4AC8 21 2D 78      [10]  126 	ld	hl,#0x782D
   4ACB E5            [11]  127 	push	hl
   4ACC 21 00 C0      [10]  128 	ld	hl,#0xC000
   4ACF E5            [11]  129 	push	hl
   4AD0 CD C1 5E      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   4AD3 E5            [11]  132 	push	hl
   4AD4 21 0A 00      [10]  133 	ld	hl,#0x000A
   4AD7 E5            [11]  134 	push	hl
   4AD8 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   4ADB DD 66 FD      [19]  136 	ld	h,-3 (ix)
   4ADE E5            [11]  137 	push	hl
   4ADF CD B6 5E      [17]  138 	call	__moduint
   4AE2 F1            [10]  139 	pop	af
   4AE3 F1            [10]  140 	pop	af
   4AE4 C1            [10]  141 	pop	bc
   4AE5 7D            [ 4]  142 	ld	a,l
   4AE6 C6 30         [ 7]  143 	add	a, #0x30
   4AE8 67            [ 4]  144 	ld	h,a
   4AE9 59            [ 4]  145 	ld	e, c
   4AEA 50            [ 4]  146 	ld	d, b
   4AEB C5            [11]  147 	push	bc
   4AEC E5            [11]  148 	push	hl
   4AED 33            [ 6]  149 	inc	sp
   4AEE 21 02 00      [10]  150 	ld	hl,#0x0002
   4AF1 E5            [11]  151 	push	hl
   4AF2 D5            [11]  152 	push	de
   4AF3 CD 32 54      [17]  153 	call	_cpct_drawCharM0
   4AF6 F1            [10]  154 	pop	af
   4AF7 33            [ 6]  155 	inc	sp
   4AF8 21 E8 03      [10]  156 	ld	hl,#0x03E8
   4AFB E3            [19]  157 	ex	(sp),hl
   4AFC DD 6E FE      [19]  158 	ld	l,-2 (ix)
   4AFF DD 66 FF      [19]  159 	ld	h,-1 (ix)
   4B02 E5            [11]  160 	push	hl
   4B03 CD 00 52      [17]  161 	call	__divuint
   4B06 F1            [10]  162 	pop	af
   4B07 F1            [10]  163 	pop	af
   4B08 11 0A 00      [10]  164 	ld	de,#0x000A
   4B0B D5            [11]  165 	push	de
   4B0C E5            [11]  166 	push	hl
   4B0D CD B6 5E      [17]  167 	call	__moduint
   4B10 F1            [10]  168 	pop	af
   4B11 F1            [10]  169 	pop	af
   4B12 C1            [10]  170 	pop	bc
   4B13 7D            [ 4]  171 	ld	a,l
   4B14 C6 30         [ 7]  172 	add	a, #0x30
   4B16 67            [ 4]  173 	ld	h,a
   4B17 79            [ 4]  174 	ld	a,c
   4B18 C6 04         [ 7]  175 	add	a, #0x04
   4B1A 5F            [ 4]  176 	ld	e,a
   4B1B 78            [ 4]  177 	ld	a,b
   4B1C CE 00         [ 7]  178 	adc	a, #0x00
   4B1E 57            [ 4]  179 	ld	d,a
   4B1F C5            [11]  180 	push	bc
   4B20 E5            [11]  181 	push	hl
   4B21 33            [ 6]  182 	inc	sp
   4B22 21 02 00      [10]  183 	ld	hl,#0x0002
   4B25 E5            [11]  184 	push	hl
   4B26 D5            [11]  185 	push	de
   4B27 CD 32 54      [17]  186 	call	_cpct_drawCharM0
   4B2A F1            [10]  187 	pop	af
   4B2B 33            [ 6]  188 	inc	sp
   4B2C 21 64 00      [10]  189 	ld	hl,#0x0064
   4B2F E3            [19]  190 	ex	(sp),hl
   4B30 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   4B33 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   4B36 E5            [11]  193 	push	hl
   4B37 CD 00 52      [17]  194 	call	__divuint
   4B3A F1            [10]  195 	pop	af
   4B3B F1            [10]  196 	pop	af
   4B3C 11 0A 00      [10]  197 	ld	de,#0x000A
   4B3F D5            [11]  198 	push	de
   4B40 E5            [11]  199 	push	hl
   4B41 CD B6 5E      [17]  200 	call	__moduint
   4B44 F1            [10]  201 	pop	af
   4B45 F1            [10]  202 	pop	af
   4B46 C1            [10]  203 	pop	bc
   4B47 7D            [ 4]  204 	ld	a,l
   4B48 C6 30         [ 7]  205 	add	a, #0x30
   4B4A 67            [ 4]  206 	ld	h,a
   4B4B 79            [ 4]  207 	ld	a,c
   4B4C C6 08         [ 7]  208 	add	a, #0x08
   4B4E 5F            [ 4]  209 	ld	e,a
   4B4F 78            [ 4]  210 	ld	a,b
   4B50 CE 00         [ 7]  211 	adc	a, #0x00
   4B52 57            [ 4]  212 	ld	d,a
   4B53 C5            [11]  213 	push	bc
   4B54 E5            [11]  214 	push	hl
   4B55 33            [ 6]  215 	inc	sp
   4B56 21 02 00      [10]  216 	ld	hl,#0x0002
   4B59 E5            [11]  217 	push	hl
   4B5A D5            [11]  218 	push	de
   4B5B CD 32 54      [17]  219 	call	_cpct_drawCharM0
   4B5E F1            [10]  220 	pop	af
   4B5F 33            [ 6]  221 	inc	sp
   4B60 21 0A 00      [10]  222 	ld	hl,#0x000A
   4B63 E3            [19]  223 	ex	(sp),hl
   4B64 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   4B67 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   4B6A E5            [11]  226 	push	hl
   4B6B CD 00 52      [17]  227 	call	__divuint
   4B6E F1            [10]  228 	pop	af
   4B6F F1            [10]  229 	pop	af
   4B70 11 0A 00      [10]  230 	ld	de,#0x000A
   4B73 D5            [11]  231 	push	de
   4B74 E5            [11]  232 	push	hl
   4B75 CD B6 5E      [17]  233 	call	__moduint
   4B78 F1            [10]  234 	pop	af
   4B79 F1            [10]  235 	pop	af
   4B7A C1            [10]  236 	pop	bc
   4B7B 7D            [ 4]  237 	ld	a,l
   4B7C C6 30         [ 7]  238 	add	a, #0x30
   4B7E 67            [ 4]  239 	ld	h,a
   4B7F 79            [ 4]  240 	ld	a,c
   4B80 C6 0C         [ 7]  241 	add	a, #0x0C
   4B82 5F            [ 4]  242 	ld	e,a
   4B83 78            [ 4]  243 	ld	a,b
   4B84 CE 00         [ 7]  244 	adc	a, #0x00
   4B86 57            [ 4]  245 	ld	d,a
   4B87 C5            [11]  246 	push	bc
   4B88 E5            [11]  247 	push	hl
   4B89 33            [ 6]  248 	inc	sp
   4B8A 21 02 00      [10]  249 	ld	hl,#0x0002
   4B8D E5            [11]  250 	push	hl
   4B8E D5            [11]  251 	push	de
   4B8F CD 32 54      [17]  252 	call	_cpct_drawCharM0
   4B92 F1            [10]  253 	pop	af
   4B93 33            [ 6]  254 	inc	sp
   4B94 21 0A 00      [10]  255 	ld	hl,#0x000A
   4B97 E3            [19]  256 	ex	(sp),hl
   4B98 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   4B9B DD 66 FF      [19]  258 	ld	h,-1 (ix)
   4B9E E5            [11]  259 	push	hl
   4B9F CD B6 5E      [17]  260 	call	__moduint
   4BA2 F1            [10]  261 	pop	af
   4BA3 F1            [10]  262 	pop	af
   4BA4 C1            [10]  263 	pop	bc
   4BA5 7D            [ 4]  264 	ld	a,l
   4BA6 C6 30         [ 7]  265 	add	a, #0x30
   4BA8 57            [ 4]  266 	ld	d,a
   4BA9 21 10 00      [10]  267 	ld	hl,#0x0010
   4BAC 09            [11]  268 	add	hl,bc
   4BAD 4D            [ 4]  269 	ld	c,l
   4BAE 44            [ 4]  270 	ld	b,h
   4BAF D5            [11]  271 	push	de
   4BB0 33            [ 6]  272 	inc	sp
   4BB1 21 02 00      [10]  273 	ld	hl,#0x0002
   4BB4 E5            [11]  274 	push	hl
   4BB5 C5            [11]  275 	push	bc
   4BB6 CD 32 54      [17]  276 	call	_cpct_drawCharM0
   4BB9 F1            [10]  277 	pop	af
   4BBA F1            [10]  278 	pop	af
   4BBB 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   4BBC                     281 00102$:
   4BBC 18 FE         [12]  282 	jr	00102$
   4BBE                     283 ___str_0:
   4BBE 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   4BC7 00                  285 	.db 0x00
   4BC8                     286 ___str_1:
   4BC8 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   4BCF 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   4BD0                     293 _borrarPantalla::
   4BD0 DD E5         [15]  294 	push	ix
   4BD2 DD 21 00 00   [14]  295 	ld	ix,#0
   4BD6 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   4BD8 3E 28         [ 7]  298 	ld	a,#0x28
   4BDA DD 96 06      [19]  299 	sub	a, 6 (ix)
   4BDD 3E 00         [ 7]  300 	ld	a,#0x00
   4BDF 17            [ 4]  301 	rla
   4BE0 4F            [ 4]  302 	ld	c,a
   4BE1 CB 41         [ 8]  303 	bit	0,c
   4BE3 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   4BE5 DD 66 05      [19]  306 	ld	h,5 (ix)
   4BE8 DD 6E 04      [19]  307 	ld	l,4 (ix)
   4BEB E5            [11]  308 	push	hl
   4BEC 21 00 C0      [10]  309 	ld	hl,#0xC000
   4BEF E5            [11]  310 	push	hl
   4BF0 CD C1 5E      [17]  311 	call	_cpct_getScreenPtr
   4BF3 4D            [ 4]  312 	ld	c,l
   4BF4 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   4BF5 DD 66 07      [19]  315 	ld	h,7 (ix)
   4BF8 DD 6E 06      [19]  316 	ld	l,6 (ix)
   4BFB E5            [11]  317 	push	hl
   4BFC AF            [ 4]  318 	xor	a, a
   4BFD F5            [11]  319 	push	af
   4BFE 33            [ 6]  320 	inc	sp
   4BFF C5            [11]  321 	push	bc
   4C00 CD A7 55      [17]  322 	call	_cpct_drawSolidBox
   4C03 F1            [10]  323 	pop	af
   4C04 F1            [10]  324 	pop	af
   4C05 33            [ 6]  325 	inc	sp
   4C06 18 51         [12]  326 	jr	00106$
   4C08                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   4C08 CB 41         [ 8]  329 	bit	0,c
   4C0A 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4C0C DD 66 05      [19]  332 	ld	h,5 (ix)
   4C0F DD 6E 04      [19]  333 	ld	l,4 (ix)
   4C12 E5            [11]  334 	push	hl
   4C13 21 00 C0      [10]  335 	ld	hl,#0xC000
   4C16 E5            [11]  336 	push	hl
   4C17 CD C1 5E      [17]  337 	call	_cpct_getScreenPtr
   4C1A 4D            [ 4]  338 	ld	c,l
   4C1B 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4C1C DD 7E 07      [19]  341 	ld	a,7 (ix)
   4C1F F5            [11]  342 	push	af
   4C20 33            [ 6]  343 	inc	sp
   4C21 21 00 28      [10]  344 	ld	hl,#0x2800
   4C24 E5            [11]  345 	push	hl
   4C25 C5            [11]  346 	push	bc
   4C26 CD A7 55      [17]  347 	call	_cpct_drawSolidBox
   4C29 F1            [10]  348 	pop	af
   4C2A F1            [10]  349 	pop	af
   4C2B 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4C2C DD 7E 04      [19]  352 	ld	a,4 (ix)
   4C2F C6 28         [ 7]  353 	add	a, #0x28
   4C31 47            [ 4]  354 	ld	b,a
   4C32 DD 7E 05      [19]  355 	ld	a,5 (ix)
   4C35 F5            [11]  356 	push	af
   4C36 33            [ 6]  357 	inc	sp
   4C37 C5            [11]  358 	push	bc
   4C38 33            [ 6]  359 	inc	sp
   4C39 21 00 C0      [10]  360 	ld	hl,#0xC000
   4C3C E5            [11]  361 	push	hl
   4C3D CD C1 5E      [17]  362 	call	_cpct_getScreenPtr
   4C40 4D            [ 4]  363 	ld	c,l
   4C41 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C42 DD 7E 06      [19]  366 	ld	a,6 (ix)
   4C45 C6 D8         [ 7]  367 	add	a,#0xD8
   4C47 57            [ 4]  368 	ld	d,a
   4C48 DD 7E 07      [19]  369 	ld	a,7 (ix)
   4C4B F5            [11]  370 	push	af
   4C4C 33            [ 6]  371 	inc	sp
   4C4D D5            [11]  372 	push	de
   4C4E 33            [ 6]  373 	inc	sp
   4C4F AF            [ 4]  374 	xor	a, a
   4C50 F5            [11]  375 	push	af
   4C51 33            [ 6]  376 	inc	sp
   4C52 C5            [11]  377 	push	bc
   4C53 CD A7 55      [17]  378 	call	_cpct_drawSolidBox
   4C56 F1            [10]  379 	pop	af
   4C57 F1            [10]  380 	pop	af
   4C58 33            [ 6]  381 	inc	sp
   4C59                     382 00106$:
   4C59 DD E1         [14]  383 	pop	ix
   4C5B C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   4C5C                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4C5C 21 50 82      [10]  391 	ld	hl,#0x8250
   4C5F E5            [11]  392 	push	hl
   4C60 21 00 1E      [10]  393 	ld	hl,#0x1E00
   4C63 E5            [11]  394 	push	hl
   4C64 CD D0 4B      [17]  395 	call	_borrarPantalla
   4C67 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4C68 21 10 55      [10]  398 	ld	hl, #0x5510
   4C6B E3            [19]  399 	ex	(sp),hl
   4C6C 21 00 C0      [10]  400 	ld	hl,#0xC000
   4C6F E5            [11]  401 	push	hl
   4C70 CD C1 5E      [17]  402 	call	_cpct_getScreenPtr
   4C73 4D            [ 4]  403 	ld	c,l
   4C74 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4C75 21 02 00      [10]  406 	ld	hl,#0x0002
   4C78 E5            [11]  407 	push	hl
   4C79 C5            [11]  408 	push	bc
   4C7A 21 4A 4D      [10]  409 	ld	hl,#___str_2
   4C7D E5            [11]  410 	push	hl
   4C7E CD DA 52      [17]  411 	call	_cpct_drawStringM0
   4C81 21 06 00      [10]  412 	ld	hl,#6
   4C84 39            [11]  413 	add	hl,sp
   4C85 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4C86 21 04 73      [10]  416 	ld	hl,#0x7304
   4C89 E5            [11]  417 	push	hl
   4C8A 21 00 C0      [10]  418 	ld	hl,#0xC000
   4C8D E5            [11]  419 	push	hl
   4C8E CD C1 5E      [17]  420 	call	_cpct_getScreenPtr
   4C91 4D            [ 4]  421 	ld	c,l
   4C92 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4C93 21 05 0A      [10]  424 	ld	hl,#0x0A05
   4C96 E5            [11]  425 	push	hl
   4C97 C5            [11]  426 	push	bc
   4C98 21 A8 18      [10]  427 	ld	hl,#_g_arrows_0
   4C9B E5            [11]  428 	push	hl
   4C9C CD FE 52      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4C9F 21 0E 73      [10]  431 	ld	hl,#0x730E
   4CA2 E5            [11]  432 	push	hl
   4CA3 21 00 C0      [10]  433 	ld	hl,#0xC000
   4CA6 E5            [11]  434 	push	hl
   4CA7 CD C1 5E      [17]  435 	call	_cpct_getScreenPtr
   4CAA 4D            [ 4]  436 	ld	c,l
   4CAB 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CAC 21 05 0A      [10]  439 	ld	hl,#0x0A05
   4CAF E5            [11]  440 	push	hl
   4CB0 C5            [11]  441 	push	bc
   4CB1 21 DA 18      [10]  442 	ld	hl,#_g_arrows_1
   4CB4 E5            [11]  443 	push	hl
   4CB5 CD FE 52      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4CB8 21 18 73      [10]  446 	ld	hl,#0x7318
   4CBB E5            [11]  447 	push	hl
   4CBC 21 00 C0      [10]  448 	ld	hl,#0xC000
   4CBF E5            [11]  449 	push	hl
   4CC0 CD C1 5E      [17]  450 	call	_cpct_getScreenPtr
   4CC3 4D            [ 4]  451 	ld	c,l
   4CC4 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CC5 21 05 0A      [10]  454 	ld	hl,#0x0A05
   4CC8 E5            [11]  455 	push	hl
   4CC9 C5            [11]  456 	push	bc
   4CCA 21 0C 19      [10]  457 	ld	hl,#_g_arrows_2
   4CCD E5            [11]  458 	push	hl
   4CCE CD FE 52      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4CD1 21 22 73      [10]  461 	ld	hl,#0x7322
   4CD4 E5            [11]  462 	push	hl
   4CD5 21 00 C0      [10]  463 	ld	hl,#0xC000
   4CD8 E5            [11]  464 	push	hl
   4CD9 CD C1 5E      [17]  465 	call	_cpct_getScreenPtr
   4CDC 4D            [ 4]  466 	ld	c,l
   4CDD 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CDE 21 05 0A      [10]  469 	ld	hl,#0x0A05
   4CE1 E5            [11]  470 	push	hl
   4CE2 C5            [11]  471 	push	bc
   4CE3 21 3E 19      [10]  472 	ld	hl,#_g_arrows_3
   4CE6 E5            [11]  473 	push	hl
   4CE7 CD FE 52      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4CEA 21 2D 73      [10]  476 	ld	hl,#0x732D
   4CED E5            [11]  477 	push	hl
   4CEE 21 00 C0      [10]  478 	ld	hl,#0xC000
   4CF1 E5            [11]  479 	push	hl
   4CF2 CD C1 5E      [17]  480 	call	_cpct_getScreenPtr
   4CF5 4D            [ 4]  481 	ld	c,l
   4CF6 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4CF7 21 02 00      [10]  484 	ld	hl,#0x0002
   4CFA E5            [11]  485 	push	hl
   4CFB C5            [11]  486 	push	bc
   4CFC 21 57 4D      [10]  487 	ld	hl,#___str_3
   4CFF E5            [11]  488 	push	hl
   4D00 CD DA 52      [17]  489 	call	_cpct_drawStringM0
   4D03 21 06 00      [10]  490 	ld	hl,#6
   4D06 39            [11]  491 	add	hl,sp
   4D07 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4D08 21 04 82      [10]  494 	ld	hl,#0x8204
   4D0B E5            [11]  495 	push	hl
   4D0C 21 00 C0      [10]  496 	ld	hl,#0xC000
   4D0F E5            [11]  497 	push	hl
   4D10 CD C1 5E      [17]  498 	call	_cpct_getScreenPtr
   4D13 4D            [ 4]  499 	ld	c,l
   4D14 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4D15 21 02 00      [10]  502 	ld	hl,#0x0002
   4D18 E5            [11]  503 	push	hl
   4D19 C5            [11]  504 	push	bc
   4D1A 21 60 4D      [10]  505 	ld	hl,#___str_4
   4D1D E5            [11]  506 	push	hl
   4D1E CD DA 52      [17]  507 	call	_cpct_drawStringM0
   4D21 21 06 00      [10]  508 	ld	hl,#6
   4D24 39            [11]  509 	add	hl,sp
   4D25 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   4D26                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   4D26 CD 41 52      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   4D29 21 04 40      [10]  516 	ld	hl,#0x4004
   4D2C CD C2 52      [17]  517 	call	_cpct_isKeyPressed
   4D2F 7D            [ 4]  518 	ld	a,l
   4D30 B7            [ 4]  519 	or	a, a
   4D31 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   4D33 CD 52 4E      [17]  522 	call	_menuOpciones
   4D36                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4D36 21 07 10      [10]  525 	ld	hl,#0x1007
   4D39 CD C2 52      [17]  526 	call	_cpct_isKeyPressed
   4D3C 7D            [ 4]  527 	ld	a,l
   4D3D B7            [ 4]  528 	or	a, a
   4D3E C0            [11]  529 	ret	NZ
   4D3F 21 04 40      [10]  530 	ld	hl,#0x4004
   4D42 CD C2 52      [17]  531 	call	_cpct_isKeyPressed
   4D45 7D            [ 4]  532 	ld	a,l
   4D46 B7            [ 4]  533 	or	a, a
   4D47 28 DD         [12]  534 	jr	Z,00104$
   4D49 C9            [10]  535 	ret
   4D4A                     536 ___str_2:
   4D4A 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4D56 00                  538 	.db 0x00
   4D57                     539 ___str_3:
   4D57 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   4D5F 00                  541 	.db 0x00
   4D60                     542 ___str_4:
   4D60 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4D72 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   4D73                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4D73 21 50 82      [10]  551 	ld	hl,#0x8250
   4D76 E5            [11]  552 	push	hl
   4D77 21 00 1E      [10]  553 	ld	hl,#0x1E00
   4D7A E5            [11]  554 	push	hl
   4D7B CD D0 4B      [17]  555 	call	_borrarPantalla
   4D7E F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4D7F 21 1A 46      [10]  558 	ld	hl, #0x461A
   4D82 E3            [19]  559 	ex	(sp),hl
   4D83 21 00 C0      [10]  560 	ld	hl,#0xC000
   4D86 E5            [11]  561 	push	hl
   4D87 CD C1 5E      [17]  562 	call	_cpct_getScreenPtr
   4D8A 4D            [ 4]  563 	ld	c,l
   4D8B 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4D8C 21 02 00      [10]  566 	ld	hl,#0x0002
   4D8F E5            [11]  567 	push	hl
   4D90 C5            [11]  568 	push	bc
   4D91 21 1B 4E      [10]  569 	ld	hl,#___str_5
   4D94 E5            [11]  570 	push	hl
   4D95 CD DA 52      [17]  571 	call	_cpct_drawStringM0
   4D98 21 06 00      [10]  572 	ld	hl,#6
   4D9B 39            [11]  573 	add	hl,sp
   4D9C F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4D9D 21 0A 64      [10]  576 	ld	hl,#0x640A
   4DA0 E5            [11]  577 	push	hl
   4DA1 21 00 C0      [10]  578 	ld	hl,#0xC000
   4DA4 E5            [11]  579 	push	hl
   4DA5 CD C1 5E      [17]  580 	call	_cpct_getScreenPtr
   4DA8 4D            [ 4]  581 	ld	c,l
   4DA9 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4DAA 21 02 00      [10]  584 	ld	hl,#0x0002
   4DAD E5            [11]  585 	push	hl
   4DAE C5            [11]  586 	push	bc
   4DAF 21 23 4E      [10]  587 	ld	hl,#___str_6
   4DB2 E5            [11]  588 	push	hl
   4DB3 CD DA 52      [17]  589 	call	_cpct_drawStringM0
   4DB6 21 06 00      [10]  590 	ld	hl,#6
   4DB9 39            [11]  591 	add	hl,sp
   4DBA F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4DBB 21 0E 73      [10]  594 	ld	hl,#0x730E
   4DBE E5            [11]  595 	push	hl
   4DBF 21 00 C0      [10]  596 	ld	hl,#0xC000
   4DC2 E5            [11]  597 	push	hl
   4DC3 CD C1 5E      [17]  598 	call	_cpct_getScreenPtr
   4DC6 4D            [ 4]  599 	ld	c,l
   4DC7 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4DC8 21 02 00      [10]  602 	ld	hl,#0x0002
   4DCB E5            [11]  603 	push	hl
   4DCC C5            [11]  604 	push	bc
   4DCD 21 33 4E      [10]  605 	ld	hl,#___str_7
   4DD0 E5            [11]  606 	push	hl
   4DD1 CD DA 52      [17]  607 	call	_cpct_drawStringM0
   4DD4 21 06 00      [10]  608 	ld	hl,#6
   4DD7 39            [11]  609 	add	hl,sp
   4DD8 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4DD9 21 08 82      [10]  612 	ld	hl,#0x8208
   4DDC E5            [11]  613 	push	hl
   4DDD 21 00 C0      [10]  614 	ld	hl,#0xC000
   4DE0 E5            [11]  615 	push	hl
   4DE1 CD C1 5E      [17]  616 	call	_cpct_getScreenPtr
   4DE4 4D            [ 4]  617 	ld	c,l
   4DE5 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4DE6 21 02 00      [10]  620 	ld	hl,#0x0002
   4DE9 E5            [11]  621 	push	hl
   4DEA C5            [11]  622 	push	bc
   4DEB 21 41 4E      [10]  623 	ld	hl,#___str_8
   4DEE E5            [11]  624 	push	hl
   4DEF CD DA 52      [17]  625 	call	_cpct_drawStringM0
   4DF2 21 06 00      [10]  626 	ld	hl,#6
   4DF5 39            [11]  627 	add	hl,sp
   4DF6 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   4DF7                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   4DF7 CD 41 52      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   4DFA 21 04 40      [10]  634 	ld	hl,#0x4004
   4DFD CD C2 52      [17]  635 	call	_cpct_isKeyPressed
   4E00 7D            [ 4]  636 	ld	a,l
   4E01 B7            [ 4]  637 	or	a, a
   4E02 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   4E04 CD 52 4E      [17]  640 	call	_menuOpciones
   4E07                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E07 21 07 10      [10]  643 	ld	hl,#0x1007
   4E0A CD C2 52      [17]  644 	call	_cpct_isKeyPressed
   4E0D 7D            [ 4]  645 	ld	a,l
   4E0E B7            [ 4]  646 	or	a, a
   4E0F C0            [11]  647 	ret	NZ
   4E10 21 04 40      [10]  648 	ld	hl,#0x4004
   4E13 CD C2 52      [17]  649 	call	_cpct_isKeyPressed
   4E16 7D            [ 4]  650 	ld	a,l
   4E17 B7            [ 4]  651 	or	a, a
   4E18 28 DD         [12]  652 	jr	Z,00104$
   4E1A C9            [10]  653 	ret
   4E1B                     654 ___str_5:
   4E1B 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   4E22 00                  656 	.db 0x00
   4E23                     657 ___str_6:
   4E23 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4E32 00                  659 	.db 0x00
   4E33                     660 ___str_7:
   4E33 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4E40 00                  662 	.db 0x00
   4E41                     663 ___str_8:
   4E41 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4E51 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   4E52                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E52 21 50 82      [10]  672 	ld	hl,#0x8250
   4E55 E5            [11]  673 	push	hl
   4E56 21 00 1E      [10]  674 	ld	hl,#0x1E00
   4E59 E5            [11]  675 	push	hl
   4E5A CD D0 4B      [17]  676 	call	_borrarPantalla
   4E5D F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4E5E 21 20 64      [10]  679 	ld	hl, #0x6420
   4E61 E3            [19]  680 	ex	(sp),hl
   4E62 21 00 C0      [10]  681 	ld	hl,#0xC000
   4E65 E5            [11]  682 	push	hl
   4E66 CD C1 5E      [17]  683 	call	_cpct_getScreenPtr
   4E69 4D            [ 4]  684 	ld	c,l
   4E6A 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   4E6B 21 02 00      [10]  687 	ld	hl,#0x0002
   4E6E E5            [11]  688 	push	hl
   4E6F C5            [11]  689 	push	bc
   4E70 21 F3 4E      [10]  690 	ld	hl,#___str_9
   4E73 E5            [11]  691 	push	hl
   4E74 CD DA 52      [17]  692 	call	_cpct_drawStringM0
   4E77 21 06 00      [10]  693 	ld	hl,#6
   4E7A 39            [11]  694 	add	hl,sp
   4E7B F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4E7C 21 00 82      [10]  697 	ld	hl,#0x8200
   4E7F E5            [11]  698 	push	hl
   4E80 26 C0         [ 7]  699 	ld	h, #0xC0
   4E82 E5            [11]  700 	push	hl
   4E83 CD C1 5E      [17]  701 	call	_cpct_getScreenPtr
   4E86 4D            [ 4]  702 	ld	c,l
   4E87 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4E88 21 02 00      [10]  705 	ld	hl,#0x0002
   4E8B E5            [11]  706 	push	hl
   4E8C C5            [11]  707 	push	bc
   4E8D 21 F8 4E      [10]  708 	ld	hl,#___str_10
   4E90 E5            [11]  709 	push	hl
   4E91 CD DA 52      [17]  710 	call	_cpct_drawStringM0
   4E94 21 06 00      [10]  711 	ld	hl,#6
   4E97 39            [11]  712 	add	hl,sp
   4E98 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4E99 21 0A 91      [10]  715 	ld	hl,#0x910A
   4E9C E5            [11]  716 	push	hl
   4E9D 21 00 C0      [10]  717 	ld	hl,#0xC000
   4EA0 E5            [11]  718 	push	hl
   4EA1 CD C1 5E      [17]  719 	call	_cpct_getScreenPtr
   4EA4 4D            [ 4]  720 	ld	c,l
   4EA5 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4EA6 21 02 00      [10]  723 	ld	hl,#0x0002
   4EA9 E5            [11]  724 	push	hl
   4EAA C5            [11]  725 	push	bc
   4EAB 21 0D 4F      [10]  726 	ld	hl,#___str_11
   4EAE E5            [11]  727 	push	hl
   4EAF CD DA 52      [17]  728 	call	_cpct_drawStringM0
   4EB2 21 06 00      [10]  729 	ld	hl,#6
   4EB5 39            [11]  730 	add	hl,sp
   4EB6 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   4EB7                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   4EB7 CD 41 52      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   4EBA 21 04 08      [10]  737 	ld	hl,#0x0804
   4EBD CD C2 52      [17]  738 	call	_cpct_isKeyPressed
   4EC0 7D            [ 4]  739 	ld	a,l
   4EC1 B7            [ 4]  740 	or	a, a
   4EC2 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   4EC4 CD 5C 4C      [17]  743 	call	_menuInstrucciones
   4EC7 18 0D         [12]  744 	jr	00109$
   4EC9                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   4EC9 21 07 40      [10]  747 	ld	hl,#0x4007
   4ECC CD C2 52      [17]  748 	call	_cpct_isKeyPressed
   4ECF 7D            [ 4]  749 	ld	a,l
   4ED0 B7            [ 4]  750 	or	a, a
   4ED1 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   4ED3 CD 73 4D      [17]  753 	call	_menuCreditos
   4ED6                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4ED6 21 07 10      [10]  756 	ld	hl,#0x1007
   4ED9 CD C2 52      [17]  757 	call	_cpct_isKeyPressed
   4EDC 7D            [ 4]  758 	ld	a,l
   4EDD B7            [ 4]  759 	or	a, a
   4EDE C0            [11]  760 	ret	NZ
   4EDF 21 04 08      [10]  761 	ld	hl,#0x0804
   4EE2 CD C2 52      [17]  762 	call	_cpct_isKeyPressed
   4EE5 7D            [ 4]  763 	ld	a,l
   4EE6 B7            [ 4]  764 	or	a, a
   4EE7 C0            [11]  765 	ret	NZ
   4EE8 21 07 40      [10]  766 	ld	hl,#0x4007
   4EEB CD C2 52      [17]  767 	call	_cpct_isKeyPressed
   4EEE 7D            [ 4]  768 	ld	a,l
   4EEF B7            [ 4]  769 	or	a, a
   4EF0 28 C5         [12]  770 	jr	Z,00108$
   4EF2 C9            [10]  771 	ret
   4EF3                     772 ___str_9:
   4EF3 4D 45 4E 55         773 	.ascii "MENU"
   4EF7 00                  774 	.db 0x00
   4EF8                     775 ___str_10:
   4EF8 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4F0C 00                  777 	.db 0x00
   4F0D                     778 ___str_11:
   4F0D 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4F1C 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   4F1D                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   4F1D 21 00 40      [10]  787 	ld	hl,#0x4000
   4F20 E5            [11]  788 	push	hl
   4F21 AF            [ 4]  789 	xor	a, a
   4F22 F5            [11]  790 	push	af
   4F23 33            [ 6]  791 	inc	sp
   4F24 26 C0         [ 7]  792 	ld	h, #0xC0
   4F26 E5            [11]  793 	push	hl
   4F27 CD 89 55      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4F2A 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   4F2D E5            [11]  797 	push	hl
   4F2E 21 00 C0      [10]  798 	ld	hl,#0xC000
   4F31 E5            [11]  799 	push	hl
   4F32 CD C1 5E      [17]  800 	call	_cpct_getScreenPtr
   4F35 4D            [ 4]  801 	ld	c,l
   4F36 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4F37 21 04 00      [10]  804 	ld	hl,#0x0004
   4F3A E5            [11]  805 	push	hl
   4F3B C5            [11]  806 	push	bc
   4F3C 21 D3 4F      [10]  807 	ld	hl,#___str_12
   4F3F E5            [11]  808 	push	hl
   4F40 CD DA 52      [17]  809 	call	_cpct_drawStringM0
   4F43 21 06 00      [10]  810 	ld	hl,#6
   4F46 39            [11]  811 	add	hl,sp
   4F47 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F48 21 28 6E      [10]  814 	ld	hl,#0x6E28
   4F4B E5            [11]  815 	push	hl
   4F4C 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   4F4F E5            [11]  817 	push	hl
   4F50 21 C8 19      [10]  818 	ld	hl,#_g_text_0
   4F53 E5            [11]  819 	push	hl
   4F54 CD FE 52      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4F57 21 28 6E      [10]  822 	ld	hl,#0x6E28
   4F5A E5            [11]  823 	push	hl
   4F5B 21 18 F1      [10]  824 	ld	hl,#0xF118
   4F5E E5            [11]  825 	push	hl
   4F5F 21 F8 2A      [10]  826 	ld	hl,#_g_text_1
   4F62 E5            [11]  827 	push	hl
   4F63 CD FE 52      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4F66 21 08 A0      [10]  830 	ld	hl,#0xA008
   4F69 E5            [11]  831 	push	hl
   4F6A 21 00 C0      [10]  832 	ld	hl,#0xC000
   4F6D E5            [11]  833 	push	hl
   4F6E CD C1 5E      [17]  834 	call	_cpct_getScreenPtr
   4F71 4D            [ 4]  835 	ld	c,l
   4F72 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4F73 21 02 00      [10]  838 	ld	hl,#0x0002
   4F76 E5            [11]  839 	push	hl
   4F77 C5            [11]  840 	push	bc
   4F78 21 DB 4F      [10]  841 	ld	hl,#___str_13
   4F7B E5            [11]  842 	push	hl
   4F7C CD DA 52      [17]  843 	call	_cpct_drawStringM0
   4F7F 21 06 00      [10]  844 	ld	hl,#6
   4F82 39            [11]  845 	add	hl,sp
   4F83 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4F84 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   4F87 E5            [11]  849 	push	hl
   4F88 21 00 C0      [10]  850 	ld	hl,#0xC000
   4F8B E5            [11]  851 	push	hl
   4F8C CD C1 5E      [17]  852 	call	_cpct_getScreenPtr
   4F8F 4D            [ 4]  853 	ld	c,l
   4F90 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4F91 21 02 00      [10]  856 	ld	hl,#0x0002
   4F94 E5            [11]  857 	push	hl
   4F95 C5            [11]  858 	push	bc
   4F96 21 EC 4F      [10]  859 	ld	hl,#___str_14
   4F99 E5            [11]  860 	push	hl
   4F9A CD DA 52      [17]  861 	call	_cpct_drawStringM0
   4F9D 21 06 00      [10]  862 	ld	hl,#6
   4FA0 39            [11]  863 	add	hl,sp
   4FA1 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   4FA2                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   4FA2 CD 41 52      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   4FA5 21 04 40      [10]  870 	ld	hl,#0x4004
   4FA8 CD C2 52      [17]  871 	call	_cpct_isKeyPressed
   4FAB 7D            [ 4]  872 	ld	a,l
   4FAC B7            [ 4]  873 	or	a, a
   4FAD 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   4FAF CD 41 52      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   4FB2                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   4FB2 CD 52 4E      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   4FB5 21 07 10      [10]  882 	ld	hl,#0x1007
   4FB8 CD C2 52      [17]  883 	call	_cpct_isKeyPressed
   4FBB 7D            [ 4]  884 	ld	a,l
   4FBC B7            [ 4]  885 	or	a, a
   4FBD 28 F3         [12]  886 	jr	Z,00101$
   4FBF                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4FBF 21 07 10      [10]  889 	ld	hl,#0x1007
   4FC2 CD C2 52      [17]  890 	call	_cpct_isKeyPressed
   4FC5 7D            [ 4]  891 	ld	a,l
   4FC6 B7            [ 4]  892 	or	a, a
   4FC7 C0            [11]  893 	ret	NZ
   4FC8 21 04 40      [10]  894 	ld	hl,#0x4004
   4FCB CD C2 52      [17]  895 	call	_cpct_isKeyPressed
   4FCE 7D            [ 4]  896 	ld	a,l
   4FCF B7            [ 4]  897 	or	a, a
   4FD0 28 D0         [12]  898 	jr	Z,00107$
   4FD2 C9            [10]  899 	ret
   4FD3                     900 ___str_12:
   4FD3 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   4FDA 00                  902 	.db 0x00
   4FDB                     903 ___str_13:
   4FDB 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   4FEB 00                  905 	.db 0x00
   4FEC                     906 ___str_14:
   4FEC 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   4FFB 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
