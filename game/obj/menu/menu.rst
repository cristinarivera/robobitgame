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
   712C                      60 _menuFin::
   712C DD E5         [15]   61 	push	ix
   712E DD 21 00 00   [14]   62 	ld	ix,#0
   7132 DD 39         [15]   63 	add	ix,sp
   7134 F5            [11]   64 	push	af
   7135 F5            [11]   65 	push	af
   7136 DD 75 FE      [19]   66 	ld	-2 (ix),l
   7139 DD 74 FF      [19]   67 	ld	-1 (ix),h
                             68 ;src/menu/menu.c:10: puntuacion_aux = puntuacion/10000;
   713C 21 10 27      [10]   69 	ld	hl,#0x2710
   713F E5            [11]   70 	push	hl
   7140 DD 6E FE      [19]   71 	ld	l,-2 (ix)
   7143 DD 66 FF      [19]   72 	ld	h,-1 (ix)
   7146 E5            [11]   73 	push	hl
   7147 CD D0 78      [17]   74 	call	__divuint
   714A F1            [10]   75 	pop	af
   714B F1            [10]   76 	pop	af
   714C 33            [ 6]   77 	inc	sp
   714D 33            [ 6]   78 	inc	sp
   714E E5            [11]   79 	push	hl
                             80 ;src/menu/menu.c:13: cpct_clearScreen(0);
   714F 21 00 40      [10]   81 	ld	hl,#0x4000
   7152 E5            [11]   82 	push	hl
   7153 AF            [ 4]   83 	xor	a, a
   7154 F5            [11]   84 	push	af
   7155 33            [ 6]   85 	inc	sp
   7156 26 C0         [ 7]   86 	ld	h, #0xC0
   7158 E5            [11]   87 	push	hl
   7159 CD 59 7C      [17]   88 	call	_cpct_memset
                             89 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   715C 21 18 5A      [10]   90 	ld	hl,#0x5A18
   715F E5            [11]   91 	push	hl
   7160 21 00 C0      [10]   92 	ld	hl,#0xC000
   7163 E5            [11]   93 	push	hl
   7164 CD 91 85      [17]   94 	call	_cpct_getScreenPtr
   7167 4D            [ 4]   95 	ld	c,l
   7168 44            [ 4]   96 	ld	b,h
                             97 ;src/menu/menu.c:16: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7169 21 02 00      [10]   98 	ld	hl,#0x0002
   716C E5            [11]   99 	push	hl
   716D C5            [11]  100 	push	bc
   716E 21 8E 72      [10]  101 	ld	hl,#___str_0
   7171 E5            [11]  102 	push	hl
   7172 CD AA 79      [17]  103 	call	_cpct_drawStringM0
   7175 21 06 00      [10]  104 	ld	hl,#6
   7178 39            [11]  105 	add	hl,sp
   7179 F9            [ 6]  106 	ld	sp,hl
                            107 ;src/menu/menu.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   717A 21 14 78      [10]  108 	ld	hl,#0x7814
   717D E5            [11]  109 	push	hl
   717E 21 00 C0      [10]  110 	ld	hl,#0xC000
   7181 E5            [11]  111 	push	hl
   7182 CD 91 85      [17]  112 	call	_cpct_getScreenPtr
   7185 4D            [ 4]  113 	ld	c,l
   7186 44            [ 4]  114 	ld	b,h
                            115 ;src/menu/menu.c:19: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   7187 21 02 00      [10]  116 	ld	hl,#0x0002
   718A E5            [11]  117 	push	hl
   718B C5            [11]  118 	push	bc
   718C 21 98 72      [10]  119 	ld	hl,#___str_1
   718F E5            [11]  120 	push	hl
   7190 CD AA 79      [17]  121 	call	_cpct_drawStringM0
   7193 21 06 00      [10]  122 	ld	hl,#6
   7196 39            [11]  123 	add	hl,sp
   7197 F9            [ 6]  124 	ld	sp,hl
                            125 ;src/menu/menu.c:21: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   7198 21 2D 78      [10]  126 	ld	hl,#0x782D
   719B E5            [11]  127 	push	hl
   719C 21 00 C0      [10]  128 	ld	hl,#0xC000
   719F E5            [11]  129 	push	hl
   71A0 CD 91 85      [17]  130 	call	_cpct_getScreenPtr
                            131 ;src/menu/menu.c:23: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   71A3 E5            [11]  132 	push	hl
   71A4 21 0A 00      [10]  133 	ld	hl,#0x000A
   71A7 E5            [11]  134 	push	hl
   71A8 DD 6E FC      [19]  135 	ld	l,-4 (ix)
   71AB DD 66 FD      [19]  136 	ld	h,-3 (ix)
   71AE E5            [11]  137 	push	hl
   71AF CD 86 85      [17]  138 	call	__moduint
   71B2 F1            [10]  139 	pop	af
   71B3 F1            [10]  140 	pop	af
   71B4 C1            [10]  141 	pop	bc
   71B5 7D            [ 4]  142 	ld	a,l
   71B6 C6 30         [ 7]  143 	add	a, #0x30
   71B8 67            [ 4]  144 	ld	h,a
   71B9 59            [ 4]  145 	ld	e, c
   71BA 50            [ 4]  146 	ld	d, b
   71BB C5            [11]  147 	push	bc
   71BC E5            [11]  148 	push	hl
   71BD 33            [ 6]  149 	inc	sp
   71BE 21 02 00      [10]  150 	ld	hl,#0x0002
   71C1 E5            [11]  151 	push	hl
   71C2 D5            [11]  152 	push	de
   71C3 CD 02 7B      [17]  153 	call	_cpct_drawCharM0
   71C6 F1            [10]  154 	pop	af
   71C7 33            [ 6]  155 	inc	sp
   71C8 21 E8 03      [10]  156 	ld	hl,#0x03E8
   71CB E3            [19]  157 	ex	(sp),hl
   71CC DD 6E FE      [19]  158 	ld	l,-2 (ix)
   71CF DD 66 FF      [19]  159 	ld	h,-1 (ix)
   71D2 E5            [11]  160 	push	hl
   71D3 CD D0 78      [17]  161 	call	__divuint
   71D6 F1            [10]  162 	pop	af
   71D7 F1            [10]  163 	pop	af
   71D8 11 0A 00      [10]  164 	ld	de,#0x000A
   71DB D5            [11]  165 	push	de
   71DC E5            [11]  166 	push	hl
   71DD CD 86 85      [17]  167 	call	__moduint
   71E0 F1            [10]  168 	pop	af
   71E1 F1            [10]  169 	pop	af
   71E2 C1            [10]  170 	pop	bc
   71E3 7D            [ 4]  171 	ld	a,l
   71E4 C6 30         [ 7]  172 	add	a, #0x30
   71E6 67            [ 4]  173 	ld	h,a
   71E7 79            [ 4]  174 	ld	a,c
   71E8 C6 04         [ 7]  175 	add	a, #0x04
   71EA 5F            [ 4]  176 	ld	e,a
   71EB 78            [ 4]  177 	ld	a,b
   71EC CE 00         [ 7]  178 	adc	a, #0x00
   71EE 57            [ 4]  179 	ld	d,a
   71EF C5            [11]  180 	push	bc
   71F0 E5            [11]  181 	push	hl
   71F1 33            [ 6]  182 	inc	sp
   71F2 21 02 00      [10]  183 	ld	hl,#0x0002
   71F5 E5            [11]  184 	push	hl
   71F6 D5            [11]  185 	push	de
   71F7 CD 02 7B      [17]  186 	call	_cpct_drawCharM0
   71FA F1            [10]  187 	pop	af
   71FB 33            [ 6]  188 	inc	sp
   71FC 21 64 00      [10]  189 	ld	hl,#0x0064
   71FF E3            [19]  190 	ex	(sp),hl
   7200 DD 6E FE      [19]  191 	ld	l,-2 (ix)
   7203 DD 66 FF      [19]  192 	ld	h,-1 (ix)
   7206 E5            [11]  193 	push	hl
   7207 CD D0 78      [17]  194 	call	__divuint
   720A F1            [10]  195 	pop	af
   720B F1            [10]  196 	pop	af
   720C 11 0A 00      [10]  197 	ld	de,#0x000A
   720F D5            [11]  198 	push	de
   7210 E5            [11]  199 	push	hl
   7211 CD 86 85      [17]  200 	call	__moduint
   7214 F1            [10]  201 	pop	af
   7215 F1            [10]  202 	pop	af
   7216 C1            [10]  203 	pop	bc
   7217 7D            [ 4]  204 	ld	a,l
   7218 C6 30         [ 7]  205 	add	a, #0x30
   721A 67            [ 4]  206 	ld	h,a
   721B 79            [ 4]  207 	ld	a,c
   721C C6 08         [ 7]  208 	add	a, #0x08
   721E 5F            [ 4]  209 	ld	e,a
   721F 78            [ 4]  210 	ld	a,b
   7220 CE 00         [ 7]  211 	adc	a, #0x00
   7222 57            [ 4]  212 	ld	d,a
   7223 C5            [11]  213 	push	bc
   7224 E5            [11]  214 	push	hl
   7225 33            [ 6]  215 	inc	sp
   7226 21 02 00      [10]  216 	ld	hl,#0x0002
   7229 E5            [11]  217 	push	hl
   722A D5            [11]  218 	push	de
   722B CD 02 7B      [17]  219 	call	_cpct_drawCharM0
   722E F1            [10]  220 	pop	af
   722F 33            [ 6]  221 	inc	sp
   7230 21 0A 00      [10]  222 	ld	hl,#0x000A
   7233 E3            [19]  223 	ex	(sp),hl
   7234 DD 6E FE      [19]  224 	ld	l,-2 (ix)
   7237 DD 66 FF      [19]  225 	ld	h,-1 (ix)
   723A E5            [11]  226 	push	hl
   723B CD D0 78      [17]  227 	call	__divuint
   723E F1            [10]  228 	pop	af
   723F F1            [10]  229 	pop	af
   7240 11 0A 00      [10]  230 	ld	de,#0x000A
   7243 D5            [11]  231 	push	de
   7244 E5            [11]  232 	push	hl
   7245 CD 86 85      [17]  233 	call	__moduint
   7248 F1            [10]  234 	pop	af
   7249 F1            [10]  235 	pop	af
   724A C1            [10]  236 	pop	bc
   724B 7D            [ 4]  237 	ld	a,l
   724C C6 30         [ 7]  238 	add	a, #0x30
   724E 67            [ 4]  239 	ld	h,a
   724F 79            [ 4]  240 	ld	a,c
   7250 C6 0C         [ 7]  241 	add	a, #0x0C
   7252 5F            [ 4]  242 	ld	e,a
   7253 78            [ 4]  243 	ld	a,b
   7254 CE 00         [ 7]  244 	adc	a, #0x00
   7256 57            [ 4]  245 	ld	d,a
   7257 C5            [11]  246 	push	bc
   7258 E5            [11]  247 	push	hl
   7259 33            [ 6]  248 	inc	sp
   725A 21 02 00      [10]  249 	ld	hl,#0x0002
   725D E5            [11]  250 	push	hl
   725E D5            [11]  251 	push	de
   725F CD 02 7B      [17]  252 	call	_cpct_drawCharM0
   7262 F1            [10]  253 	pop	af
   7263 33            [ 6]  254 	inc	sp
   7264 21 0A 00      [10]  255 	ld	hl,#0x000A
   7267 E3            [19]  256 	ex	(sp),hl
   7268 DD 6E FE      [19]  257 	ld	l,-2 (ix)
   726B DD 66 FF      [19]  258 	ld	h,-1 (ix)
   726E E5            [11]  259 	push	hl
   726F CD 86 85      [17]  260 	call	__moduint
   7272 F1            [10]  261 	pop	af
   7273 F1            [10]  262 	pop	af
   7274 C1            [10]  263 	pop	bc
   7275 7D            [ 4]  264 	ld	a,l
   7276 C6 30         [ 7]  265 	add	a, #0x30
   7278 57            [ 4]  266 	ld	d,a
   7279 21 10 00      [10]  267 	ld	hl,#0x0010
   727C 09            [11]  268 	add	hl,bc
   727D 4D            [ 4]  269 	ld	c,l
   727E 44            [ 4]  270 	ld	b,h
   727F D5            [11]  271 	push	de
   7280 33            [ 6]  272 	inc	sp
   7281 21 02 00      [10]  273 	ld	hl,#0x0002
   7284 E5            [11]  274 	push	hl
   7285 C5            [11]  275 	push	bc
   7286 CD 02 7B      [17]  276 	call	_cpct_drawCharM0
   7289 F1            [10]  277 	pop	af
   728A F1            [10]  278 	pop	af
   728B 33            [ 6]  279 	inc	sp
                            280 ;src/menu/menu.c:34: while(1){}
   728C                     281 00102$:
   728C 18 FE         [12]  282 	jr	00102$
   728E                     283 ___str_0:
   728E 47 41 4D 45 20 4F   284 	.ascii "GAME OVER"
        56 45 52
   7297 00                  285 	.db 0x00
   7298                     286 ___str_1:
   7298 53 43 4F 52 45 3A   287 	.ascii "SCORE: "
        20
   729F 00                  288 	.db 0x00
                            289 ;src/menu/menu.c:37: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                            290 ;	---------------------------------
                            291 ; Function borrarPantalla
                            292 ; ---------------------------------
   72A0                     293 _borrarPantalla::
   72A0 DD E5         [15]  294 	push	ix
   72A2 DD 21 00 00   [14]  295 	ld	ix,#0
   72A6 DD 39         [15]  296 	add	ix,sp
                            297 ;src/menu/menu.c:39: if (ancho <= 40){
   72A8 3E 28         [ 7]  298 	ld	a,#0x28
   72AA DD 96 06      [19]  299 	sub	a, 6 (ix)
   72AD 3E 00         [ 7]  300 	ld	a,#0x00
   72AF 17            [ 4]  301 	rla
   72B0 4F            [ 4]  302 	ld	c,a
   72B1 CB 41         [ 8]  303 	bit	0,c
   72B3 20 23         [12]  304 	jr	NZ,00104$
                            305 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   72B5 DD 66 05      [19]  306 	ld	h,5 (ix)
   72B8 DD 6E 04      [19]  307 	ld	l,4 (ix)
   72BB E5            [11]  308 	push	hl
   72BC 21 00 C0      [10]  309 	ld	hl,#0xC000
   72BF E5            [11]  310 	push	hl
   72C0 CD 91 85      [17]  311 	call	_cpct_getScreenPtr
   72C3 4D            [ 4]  312 	ld	c,l
   72C4 44            [ 4]  313 	ld	b,h
                            314 ;src/menu/menu.c:41: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   72C5 DD 66 07      [19]  315 	ld	h,7 (ix)
   72C8 DD 6E 06      [19]  316 	ld	l,6 (ix)
   72CB E5            [11]  317 	push	hl
   72CC AF            [ 4]  318 	xor	a, a
   72CD F5            [11]  319 	push	af
   72CE 33            [ 6]  320 	inc	sp
   72CF C5            [11]  321 	push	bc
   72D0 CD 77 7C      [17]  322 	call	_cpct_drawSolidBox
   72D3 F1            [10]  323 	pop	af
   72D4 F1            [10]  324 	pop	af
   72D5 33            [ 6]  325 	inc	sp
   72D6 18 51         [12]  326 	jr	00106$
   72D8                     327 00104$:
                            328 ;src/menu/menu.c:43: else if (ancho > 40){
   72D8 CB 41         [ 8]  329 	bit	0,c
   72DA 28 4D         [12]  330 	jr	Z,00106$
                            331 ;src/menu/menu.c:45: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   72DC DD 66 05      [19]  332 	ld	h,5 (ix)
   72DF DD 6E 04      [19]  333 	ld	l,4 (ix)
   72E2 E5            [11]  334 	push	hl
   72E3 21 00 C0      [10]  335 	ld	hl,#0xC000
   72E6 E5            [11]  336 	push	hl
   72E7 CD 91 85      [17]  337 	call	_cpct_getScreenPtr
   72EA 4D            [ 4]  338 	ld	c,l
   72EB 44            [ 4]  339 	ld	b,h
                            340 ;src/menu/menu.c:46: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   72EC DD 7E 07      [19]  341 	ld	a,7 (ix)
   72EF F5            [11]  342 	push	af
   72F0 33            [ 6]  343 	inc	sp
   72F1 21 00 28      [10]  344 	ld	hl,#0x2800
   72F4 E5            [11]  345 	push	hl
   72F5 C5            [11]  346 	push	bc
   72F6 CD 77 7C      [17]  347 	call	_cpct_drawSolidBox
   72F9 F1            [10]  348 	pop	af
   72FA F1            [10]  349 	pop	af
   72FB 33            [ 6]  350 	inc	sp
                            351 ;src/menu/menu.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   72FC DD 7E 04      [19]  352 	ld	a,4 (ix)
   72FF C6 28         [ 7]  353 	add	a, #0x28
   7301 47            [ 4]  354 	ld	b,a
   7302 DD 7E 05      [19]  355 	ld	a,5 (ix)
   7305 F5            [11]  356 	push	af
   7306 33            [ 6]  357 	inc	sp
   7307 C5            [11]  358 	push	bc
   7308 33            [ 6]  359 	inc	sp
   7309 21 00 C0      [10]  360 	ld	hl,#0xC000
   730C E5            [11]  361 	push	hl
   730D CD 91 85      [17]  362 	call	_cpct_getScreenPtr
   7310 4D            [ 4]  363 	ld	c,l
   7311 44            [ 4]  364 	ld	b,h
                            365 ;src/menu/menu.c:48: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   7312 DD 7E 06      [19]  366 	ld	a,6 (ix)
   7315 C6 D8         [ 7]  367 	add	a,#0xD8
   7317 57            [ 4]  368 	ld	d,a
   7318 DD 7E 07      [19]  369 	ld	a,7 (ix)
   731B F5            [11]  370 	push	af
   731C 33            [ 6]  371 	inc	sp
   731D D5            [11]  372 	push	de
   731E 33            [ 6]  373 	inc	sp
   731F AF            [ 4]  374 	xor	a, a
   7320 F5            [11]  375 	push	af
   7321 33            [ 6]  376 	inc	sp
   7322 C5            [11]  377 	push	bc
   7323 CD 77 7C      [17]  378 	call	_cpct_drawSolidBox
   7326 F1            [10]  379 	pop	af
   7327 F1            [10]  380 	pop	af
   7328 33            [ 6]  381 	inc	sp
   7329                     382 00106$:
   7329 DD E1         [14]  383 	pop	ix
   732B C9            [10]  384 	ret
                            385 ;src/menu/menu.c:52: void menuInstrucciones(){ // TODO TODO
                            386 ;	---------------------------------
                            387 ; Function menuInstrucciones
                            388 ; ---------------------------------
   732C                     389 _menuInstrucciones::
                            390 ;src/menu/menu.c:54: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   732C 21 50 82      [10]  391 	ld	hl,#0x8250
   732F E5            [11]  392 	push	hl
   7330 21 00 1E      [10]  393 	ld	hl,#0x1E00
   7333 E5            [11]  394 	push	hl
   7334 CD A0 72      [17]  395 	call	_borrarPantalla
   7337 F1            [10]  396 	pop	af
                            397 ;src/menu/menu.c:57: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   7338 21 10 55      [10]  398 	ld	hl, #0x5510
   733B E3            [19]  399 	ex	(sp),hl
   733C 21 00 C0      [10]  400 	ld	hl,#0xC000
   733F E5            [11]  401 	push	hl
   7340 CD 91 85      [17]  402 	call	_cpct_getScreenPtr
   7343 4D            [ 4]  403 	ld	c,l
   7344 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:58: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   7345 21 02 00      [10]  406 	ld	hl,#0x0002
   7348 E5            [11]  407 	push	hl
   7349 C5            [11]  408 	push	bc
   734A 21 1A 74      [10]  409 	ld	hl,#___str_2
   734D E5            [11]  410 	push	hl
   734E CD AA 79      [17]  411 	call	_cpct_drawStringM0
   7351 21 06 00      [10]  412 	ld	hl,#6
   7354 39            [11]  413 	add	hl,sp
   7355 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:61: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   7356 21 04 73      [10]  416 	ld	hl,#0x7304
   7359 E5            [11]  417 	push	hl
   735A 21 00 C0      [10]  418 	ld	hl,#0xC000
   735D E5            [11]  419 	push	hl
   735E CD 91 85      [17]  420 	call	_cpct_getScreenPtr
   7361 4D            [ 4]  421 	ld	c,l
   7362 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:62: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7363 21 05 0A      [10]  424 	ld	hl,#0x0A05
   7366 E5            [11]  425 	push	hl
   7367 C5            [11]  426 	push	bc
   7368 21 A8 45      [10]  427 	ld	hl,#_g_arrows_0
   736B E5            [11]  428 	push	hl
   736C CD CE 79      [17]  429 	call	_cpct_drawSprite
                            430 ;src/menu/menu.c:64: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   736F 21 0E 73      [10]  431 	ld	hl,#0x730E
   7372 E5            [11]  432 	push	hl
   7373 21 00 C0      [10]  433 	ld	hl,#0xC000
   7376 E5            [11]  434 	push	hl
   7377 CD 91 85      [17]  435 	call	_cpct_getScreenPtr
   737A 4D            [ 4]  436 	ld	c,l
   737B 44            [ 4]  437 	ld	b,h
                            438 ;src/menu/menu.c:65: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   737C 21 05 0A      [10]  439 	ld	hl,#0x0A05
   737F E5            [11]  440 	push	hl
   7380 C5            [11]  441 	push	bc
   7381 21 DA 45      [10]  442 	ld	hl,#_g_arrows_1
   7384 E5            [11]  443 	push	hl
   7385 CD CE 79      [17]  444 	call	_cpct_drawSprite
                            445 ;src/menu/menu.c:67: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   7388 21 18 73      [10]  446 	ld	hl,#0x7318
   738B E5            [11]  447 	push	hl
   738C 21 00 C0      [10]  448 	ld	hl,#0xC000
   738F E5            [11]  449 	push	hl
   7390 CD 91 85      [17]  450 	call	_cpct_getScreenPtr
   7393 4D            [ 4]  451 	ld	c,l
   7394 44            [ 4]  452 	ld	b,h
                            453 ;src/menu/menu.c:68: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7395 21 05 0A      [10]  454 	ld	hl,#0x0A05
   7398 E5            [11]  455 	push	hl
   7399 C5            [11]  456 	push	bc
   739A 21 0C 46      [10]  457 	ld	hl,#_g_arrows_2
   739D E5            [11]  458 	push	hl
   739E CD CE 79      [17]  459 	call	_cpct_drawSprite
                            460 ;src/menu/menu.c:70: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   73A1 21 22 73      [10]  461 	ld	hl,#0x7322
   73A4 E5            [11]  462 	push	hl
   73A5 21 00 C0      [10]  463 	ld	hl,#0xC000
   73A8 E5            [11]  464 	push	hl
   73A9 CD 91 85      [17]  465 	call	_cpct_getScreenPtr
   73AC 4D            [ 4]  466 	ld	c,l
   73AD 44            [ 4]  467 	ld	b,h
                            468 ;src/menu/menu.c:71: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   73AE 21 05 0A      [10]  469 	ld	hl,#0x0A05
   73B1 E5            [11]  470 	push	hl
   73B2 C5            [11]  471 	push	bc
   73B3 21 3E 46      [10]  472 	ld	hl,#_g_arrows_3
   73B6 E5            [11]  473 	push	hl
   73B7 CD CE 79      [17]  474 	call	_cpct_drawSprite
                            475 ;src/menu/menu.c:73: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   73BA 21 2D 73      [10]  476 	ld	hl,#0x732D
   73BD E5            [11]  477 	push	hl
   73BE 21 00 C0      [10]  478 	ld	hl,#0xC000
   73C1 E5            [11]  479 	push	hl
   73C2 CD 91 85      [17]  480 	call	_cpct_getScreenPtr
   73C5 4D            [ 4]  481 	ld	c,l
   73C6 44            [ 4]  482 	ld	b,h
                            483 ;src/menu/menu.c:74: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   73C7 21 02 00      [10]  484 	ld	hl,#0x0002
   73CA E5            [11]  485 	push	hl
   73CB C5            [11]  486 	push	bc
   73CC 21 27 74      [10]  487 	ld	hl,#___str_3
   73CF E5            [11]  488 	push	hl
   73D0 CD AA 79      [17]  489 	call	_cpct_drawStringM0
   73D3 21 06 00      [10]  490 	ld	hl,#6
   73D6 39            [11]  491 	add	hl,sp
   73D7 F9            [ 6]  492 	ld	sp,hl
                            493 ;src/menu/menu.c:76: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   73D8 21 04 82      [10]  494 	ld	hl,#0x8204
   73DB E5            [11]  495 	push	hl
   73DC 21 00 C0      [10]  496 	ld	hl,#0xC000
   73DF E5            [11]  497 	push	hl
   73E0 CD 91 85      [17]  498 	call	_cpct_getScreenPtr
   73E3 4D            [ 4]  499 	ld	c,l
   73E4 44            [ 4]  500 	ld	b,h
                            501 ;src/menu/menu.c:77: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   73E5 21 02 00      [10]  502 	ld	hl,#0x0002
   73E8 E5            [11]  503 	push	hl
   73E9 C5            [11]  504 	push	bc
   73EA 21 30 74      [10]  505 	ld	hl,#___str_4
   73ED E5            [11]  506 	push	hl
   73EE CD AA 79      [17]  507 	call	_cpct_drawStringM0
   73F1 21 06 00      [10]  508 	ld	hl,#6
   73F4 39            [11]  509 	add	hl,sp
   73F5 F9            [ 6]  510 	ld	sp,hl
                            511 ;src/menu/menu.c:79: do{
   73F6                     512 00104$:
                            513 ;src/menu/menu.c:80: cpct_scanKeyboard_f(); 
   73F6 CD 11 79      [17]  514 	call	_cpct_scanKeyboard_f
                            515 ;src/menu/menu.c:81: if(cpct_isKeyPressed(Key_M)){
   73F9 21 04 40      [10]  516 	ld	hl,#0x4004
   73FC CD 92 79      [17]  517 	call	_cpct_isKeyPressed
   73FF 7D            [ 4]  518 	ld	a,l
   7400 B7            [ 4]  519 	or	a, a
   7401 28 03         [12]  520 	jr	Z,00105$
                            521 ;src/menu/menu.c:82: menuOpciones();
   7403 CD 22 75      [17]  522 	call	_menuOpciones
   7406                     523 00105$:
                            524 ;src/menu/menu.c:85: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7406 21 07 10      [10]  525 	ld	hl,#0x1007
   7409 CD 92 79      [17]  526 	call	_cpct_isKeyPressed
   740C 7D            [ 4]  527 	ld	a,l
   740D B7            [ 4]  528 	or	a, a
   740E C0            [11]  529 	ret	NZ
   740F 21 04 40      [10]  530 	ld	hl,#0x4004
   7412 CD 92 79      [17]  531 	call	_cpct_isKeyPressed
   7415 7D            [ 4]  532 	ld	a,l
   7416 B7            [ 4]  533 	or	a, a
   7417 28 DD         [12]  534 	jr	Z,00104$
   7419 C9            [10]  535 	ret
   741A                     536 ___str_2:
   741A 49 4E 53 54 52 55   537 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   7426 00                  538 	.db 0x00
   7427                     539 ___str_3:
   7427 20 54 4F 20 4D 4F   540 	.ascii " TO MOVE"
        56 45
   742F 00                  541 	.db 0x00
   7430                     542 ___str_4:
   7430 53 50 41 43 45 20   543 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   7442 00                  544 	.db 0x00
                            545 ;src/menu/menu.c:88: void menuCreditos(){ // TODO TODO
                            546 ;	---------------------------------
                            547 ; Function menuCreditos
                            548 ; ---------------------------------
   7443                     549 _menuCreditos::
                            550 ;src/menu/menu.c:90: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7443 21 50 82      [10]  551 	ld	hl,#0x8250
   7446 E5            [11]  552 	push	hl
   7447 21 00 1E      [10]  553 	ld	hl,#0x1E00
   744A E5            [11]  554 	push	hl
   744B CD A0 72      [17]  555 	call	_borrarPantalla
   744E F1            [10]  556 	pop	af
                            557 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   744F 21 1A 46      [10]  558 	ld	hl, #0x461A
   7452 E3            [19]  559 	ex	(sp),hl
   7453 21 00 C0      [10]  560 	ld	hl,#0xC000
   7456 E5            [11]  561 	push	hl
   7457 CD 91 85      [17]  562 	call	_cpct_getScreenPtr
   745A 4D            [ 4]  563 	ld	c,l
   745B 44            [ 4]  564 	ld	b,h
                            565 ;src/menu/menu.c:94: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   745C 21 02 00      [10]  566 	ld	hl,#0x0002
   745F E5            [11]  567 	push	hl
   7460 C5            [11]  568 	push	bc
   7461 21 EB 74      [10]  569 	ld	hl,#___str_5
   7464 E5            [11]  570 	push	hl
   7465 CD AA 79      [17]  571 	call	_cpct_drawStringM0
   7468 21 06 00      [10]  572 	ld	hl,#6
   746B 39            [11]  573 	add	hl,sp
   746C F9            [ 6]  574 	ld	sp,hl
                            575 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   746D 21 0A 64      [10]  576 	ld	hl,#0x640A
   7470 E5            [11]  577 	push	hl
   7471 21 00 C0      [10]  578 	ld	hl,#0xC000
   7474 E5            [11]  579 	push	hl
   7475 CD 91 85      [17]  580 	call	_cpct_getScreenPtr
   7478 4D            [ 4]  581 	ld	c,l
   7479 44            [ 4]  582 	ld	b,h
                            583 ;src/menu/menu.c:97: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   747A 21 02 00      [10]  584 	ld	hl,#0x0002
   747D E5            [11]  585 	push	hl
   747E C5            [11]  586 	push	bc
   747F 21 F3 74      [10]  587 	ld	hl,#___str_6
   7482 E5            [11]  588 	push	hl
   7483 CD AA 79      [17]  589 	call	_cpct_drawStringM0
   7486 21 06 00      [10]  590 	ld	hl,#6
   7489 39            [11]  591 	add	hl,sp
   748A F9            [ 6]  592 	ld	sp,hl
                            593 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   748B 21 0E 73      [10]  594 	ld	hl,#0x730E
   748E E5            [11]  595 	push	hl
   748F 21 00 C0      [10]  596 	ld	hl,#0xC000
   7492 E5            [11]  597 	push	hl
   7493 CD 91 85      [17]  598 	call	_cpct_getScreenPtr
   7496 4D            [ 4]  599 	ld	c,l
   7497 44            [ 4]  600 	ld	b,h
                            601 ;src/menu/menu.c:100: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   7498 21 02 00      [10]  602 	ld	hl,#0x0002
   749B E5            [11]  603 	push	hl
   749C C5            [11]  604 	push	bc
   749D 21 03 75      [10]  605 	ld	hl,#___str_7
   74A0 E5            [11]  606 	push	hl
   74A1 CD AA 79      [17]  607 	call	_cpct_drawStringM0
   74A4 21 06 00      [10]  608 	ld	hl,#6
   74A7 39            [11]  609 	add	hl,sp
   74A8 F9            [ 6]  610 	ld	sp,hl
                            611 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   74A9 21 08 82      [10]  612 	ld	hl,#0x8208
   74AC E5            [11]  613 	push	hl
   74AD 21 00 C0      [10]  614 	ld	hl,#0xC000
   74B0 E5            [11]  615 	push	hl
   74B1 CD 91 85      [17]  616 	call	_cpct_getScreenPtr
   74B4 4D            [ 4]  617 	ld	c,l
   74B5 44            [ 4]  618 	ld	b,h
                            619 ;src/menu/menu.c:103: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   74B6 21 02 00      [10]  620 	ld	hl,#0x0002
   74B9 E5            [11]  621 	push	hl
   74BA C5            [11]  622 	push	bc
   74BB 21 11 75      [10]  623 	ld	hl,#___str_8
   74BE E5            [11]  624 	push	hl
   74BF CD AA 79      [17]  625 	call	_cpct_drawStringM0
   74C2 21 06 00      [10]  626 	ld	hl,#6
   74C5 39            [11]  627 	add	hl,sp
   74C6 F9            [ 6]  628 	ld	sp,hl
                            629 ;src/menu/menu.c:105: do{
   74C7                     630 00104$:
                            631 ;src/menu/menu.c:106: cpct_scanKeyboard_f(); 
   74C7 CD 11 79      [17]  632 	call	_cpct_scanKeyboard_f
                            633 ;src/menu/menu.c:107: if(cpct_isKeyPressed(Key_M)){
   74CA 21 04 40      [10]  634 	ld	hl,#0x4004
   74CD CD 92 79      [17]  635 	call	_cpct_isKeyPressed
   74D0 7D            [ 4]  636 	ld	a,l
   74D1 B7            [ 4]  637 	or	a, a
   74D2 28 03         [12]  638 	jr	Z,00105$
                            639 ;src/menu/menu.c:108: menuOpciones();
   74D4 CD 22 75      [17]  640 	call	_menuOpciones
   74D7                     641 00105$:
                            642 ;src/menu/menu.c:111: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   74D7 21 07 10      [10]  643 	ld	hl,#0x1007
   74DA CD 92 79      [17]  644 	call	_cpct_isKeyPressed
   74DD 7D            [ 4]  645 	ld	a,l
   74DE B7            [ 4]  646 	or	a, a
   74DF C0            [11]  647 	ret	NZ
   74E0 21 04 40      [10]  648 	ld	hl,#0x4004
   74E3 CD 92 79      [17]  649 	call	_cpct_isKeyPressed
   74E6 7D            [ 4]  650 	ld	a,l
   74E7 B7            [ 4]  651 	or	a, a
   74E8 28 DD         [12]  652 	jr	Z,00104$
   74EA C9            [10]  653 	ret
   74EB                     654 ___str_5:
   74EB 43 52 45 44 49 54   655 	.ascii "CREDITS"
        53
   74F2 00                  656 	.db 0x00
   74F3                     657 ___str_6:
   74F3 43 72 69 73 74 69   658 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   7502 00                  659 	.db 0x00
   7503                     660 ___str_7:
   7503 4D 69 67 75 65 6C   661 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   7510 00                  662 	.db 0x00
   7511                     663 ___str_8:
   7511 46 65 72 6E 61 6E   664 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   7521 00                  665 	.db 0x00
                            666 ;src/menu/menu.c:115: void menuOpciones(){ // TODO TODO
                            667 ;	---------------------------------
                            668 ; Function menuOpciones
                            669 ; ---------------------------------
   7522                     670 _menuOpciones::
                            671 ;src/menu/menu.c:117: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7522 21 50 82      [10]  672 	ld	hl,#0x8250
   7525 E5            [11]  673 	push	hl
   7526 21 00 1E      [10]  674 	ld	hl,#0x1E00
   7529 E5            [11]  675 	push	hl
   752A CD A0 72      [17]  676 	call	_borrarPantalla
   752D F1            [10]  677 	pop	af
                            678 ;src/menu/menu.c:120: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   752E 21 20 64      [10]  679 	ld	hl, #0x6420
   7531 E3            [19]  680 	ex	(sp),hl
   7532 21 00 C0      [10]  681 	ld	hl,#0xC000
   7535 E5            [11]  682 	push	hl
   7536 CD 91 85      [17]  683 	call	_cpct_getScreenPtr
   7539 4D            [ 4]  684 	ld	c,l
   753A 44            [ 4]  685 	ld	b,h
                            686 ;src/menu/menu.c:121: cpct_drawStringM0("MENU", memptr, 2, 0);
   753B 21 02 00      [10]  687 	ld	hl,#0x0002
   753E E5            [11]  688 	push	hl
   753F C5            [11]  689 	push	bc
   7540 21 C3 75      [10]  690 	ld	hl,#___str_9
   7543 E5            [11]  691 	push	hl
   7544 CD AA 79      [17]  692 	call	_cpct_drawStringM0
   7547 21 06 00      [10]  693 	ld	hl,#6
   754A 39            [11]  694 	add	hl,sp
   754B F9            [ 6]  695 	ld	sp,hl
                            696 ;src/menu/menu.c:123: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   754C 21 00 82      [10]  697 	ld	hl,#0x8200
   754F E5            [11]  698 	push	hl
   7550 26 C0         [ 7]  699 	ld	h, #0xC0
   7552 E5            [11]  700 	push	hl
   7553 CD 91 85      [17]  701 	call	_cpct_getScreenPtr
   7556 4D            [ 4]  702 	ld	c,l
   7557 44            [ 4]  703 	ld	b,h
                            704 ;src/menu/menu.c:124: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   7558 21 02 00      [10]  705 	ld	hl,#0x0002
   755B E5            [11]  706 	push	hl
   755C C5            [11]  707 	push	bc
   755D 21 C8 75      [10]  708 	ld	hl,#___str_10
   7560 E5            [11]  709 	push	hl
   7561 CD AA 79      [17]  710 	call	_cpct_drawStringM0
   7564 21 06 00      [10]  711 	ld	hl,#6
   7567 39            [11]  712 	add	hl,sp
   7568 F9            [ 6]  713 	ld	sp,hl
                            714 ;src/menu/menu.c:126: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   7569 21 0A 91      [10]  715 	ld	hl,#0x910A
   756C E5            [11]  716 	push	hl
   756D 21 00 C0      [10]  717 	ld	hl,#0xC000
   7570 E5            [11]  718 	push	hl
   7571 CD 91 85      [17]  719 	call	_cpct_getScreenPtr
   7574 4D            [ 4]  720 	ld	c,l
   7575 44            [ 4]  721 	ld	b,h
                            722 ;src/menu/menu.c:127: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   7576 21 02 00      [10]  723 	ld	hl,#0x0002
   7579 E5            [11]  724 	push	hl
   757A C5            [11]  725 	push	bc
   757B 21 DD 75      [10]  726 	ld	hl,#___str_11
   757E E5            [11]  727 	push	hl
   757F CD AA 79      [17]  728 	call	_cpct_drawStringM0
   7582 21 06 00      [10]  729 	ld	hl,#6
   7585 39            [11]  730 	add	hl,sp
   7586 F9            [ 6]  731 	ld	sp,hl
                            732 ;src/menu/menu.c:129: do{
   7587                     733 00108$:
                            734 ;src/menu/menu.c:130: cpct_scanKeyboard_f(); 
   7587 CD 11 79      [17]  735 	call	_cpct_scanKeyboard_f
                            736 ;src/menu/menu.c:135: if(cpct_isKeyPressed(Key_I)){
   758A 21 04 08      [10]  737 	ld	hl,#0x0804
   758D CD 92 79      [17]  738 	call	_cpct_isKeyPressed
   7590 7D            [ 4]  739 	ld	a,l
   7591 B7            [ 4]  740 	or	a, a
   7592 28 05         [12]  741 	jr	Z,00104$
                            742 ;src/menu/menu.c:136: menuInstrucciones();
   7594 CD 2C 73      [17]  743 	call	_menuInstrucciones
   7597 18 0D         [12]  744 	jr	00109$
   7599                     745 00104$:
                            746 ;src/menu/menu.c:140: else if(cpct_isKeyPressed(Key_C)){
   7599 21 07 40      [10]  747 	ld	hl,#0x4007
   759C CD 92 79      [17]  748 	call	_cpct_isKeyPressed
   759F 7D            [ 4]  749 	ld	a,l
   75A0 B7            [ 4]  750 	or	a, a
   75A1 28 03         [12]  751 	jr	Z,00109$
                            752 ;src/menu/menu.c:141: menuCreditos();
   75A3 CD 43 74      [17]  753 	call	_menuCreditos
   75A6                     754 00109$:
                            755 ;src/menu/menu.c:149: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   75A6 21 07 10      [10]  756 	ld	hl,#0x1007
   75A9 CD 92 79      [17]  757 	call	_cpct_isKeyPressed
   75AC 7D            [ 4]  758 	ld	a,l
   75AD B7            [ 4]  759 	or	a, a
   75AE C0            [11]  760 	ret	NZ
   75AF 21 04 08      [10]  761 	ld	hl,#0x0804
   75B2 CD 92 79      [17]  762 	call	_cpct_isKeyPressed
   75B5 7D            [ 4]  763 	ld	a,l
   75B6 B7            [ 4]  764 	or	a, a
   75B7 C0            [11]  765 	ret	NZ
   75B8 21 07 40      [10]  766 	ld	hl,#0x4007
   75BB CD 92 79      [17]  767 	call	_cpct_isKeyPressed
   75BE 7D            [ 4]  768 	ld	a,l
   75BF B7            [ 4]  769 	or	a, a
   75C0 28 C5         [12]  770 	jr	Z,00108$
   75C2 C9            [10]  771 	ret
   75C3                     772 ___str_9:
   75C3 4D 45 4E 55         773 	.ascii "MENU"
   75C7 00                  774 	.db 0x00
   75C8                     775 ___str_10:
   75C8 49 4E 53 54 52 55   776 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   75DC 00                  777 	.db 0x00
   75DD                     778 ___str_11:
   75DD 43 52 45 44 49 54   779 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   75EC 00                  780 	.db 0x00
                            781 ;src/menu/menu.c:152: void menuInicio() {
                            782 ;	---------------------------------
                            783 ; Function menuInicio
                            784 ; ---------------------------------
   75ED                     785 _menuInicio::
                            786 ;src/menu/menu.c:155: cpct_clearScreen(0);
   75ED 21 00 40      [10]  787 	ld	hl,#0x4000
   75F0 E5            [11]  788 	push	hl
   75F1 AF            [ 4]  789 	xor	a, a
   75F2 F5            [11]  790 	push	af
   75F3 33            [ 6]  791 	inc	sp
   75F4 26 C0         [ 7]  792 	ld	h, #0xC0
   75F6 E5            [11]  793 	push	hl
   75F7 CD 59 7C      [17]  794 	call	_cpct_memset
                            795 ;src/menu/menu.c:157: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   75FA 21 1A 0F      [10]  796 	ld	hl,#0x0F1A
   75FD E5            [11]  797 	push	hl
   75FE 21 00 C0      [10]  798 	ld	hl,#0xC000
   7601 E5            [11]  799 	push	hl
   7602 CD 91 85      [17]  800 	call	_cpct_getScreenPtr
   7605 4D            [ 4]  801 	ld	c,l
   7606 44            [ 4]  802 	ld	b,h
                            803 ;src/menu/menu.c:158: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   7607 21 04 00      [10]  804 	ld	hl,#0x0004
   760A E5            [11]  805 	push	hl
   760B C5            [11]  806 	push	bc
   760C 21 A3 76      [10]  807 	ld	hl,#___str_12
   760F E5            [11]  808 	push	hl
   7610 CD AA 79      [17]  809 	call	_cpct_drawStringM0
   7613 21 06 00      [10]  810 	ld	hl,#6
   7616 39            [11]  811 	add	hl,sp
   7617 F9            [ 6]  812 	ld	sp,hl
                            813 ;src/menu/menu.c:160: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   7618 21 28 6E      [10]  814 	ld	hl,#0x6E28
   761B E5            [11]  815 	push	hl
   761C 21 F0 F0      [10]  816 	ld	hl,#0xF0F0
   761F E5            [11]  817 	push	hl
   7620 21 C8 46      [10]  818 	ld	hl,#_g_text_0
   7623 E5            [11]  819 	push	hl
   7624 CD CE 79      [17]  820 	call	_cpct_drawSprite
                            821 ;src/menu/menu.c:161: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   7627 21 28 6E      [10]  822 	ld	hl,#0x6E28
   762A E5            [11]  823 	push	hl
   762B 21 18 F1      [10]  824 	ld	hl,#0xF118
   762E E5            [11]  825 	push	hl
   762F 21 F8 57      [10]  826 	ld	hl,#_g_text_1
   7632 E5            [11]  827 	push	hl
   7633 CD CE 79      [17]  828 	call	_cpct_drawSprite
                            829 ;src/menu/menu.c:163: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   7636 21 08 A0      [10]  830 	ld	hl,#0xA008
   7639 E5            [11]  831 	push	hl
   763A 21 00 C0      [10]  832 	ld	hl,#0xC000
   763D E5            [11]  833 	push	hl
   763E CD 91 85      [17]  834 	call	_cpct_getScreenPtr
   7641 4D            [ 4]  835 	ld	c,l
   7642 44            [ 4]  836 	ld	b,h
                            837 ;src/menu/menu.c:164: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   7643 21 02 00      [10]  838 	ld	hl,#0x0002
   7646 E5            [11]  839 	push	hl
   7647 C5            [11]  840 	push	bc
   7648 21 AB 76      [10]  841 	ld	hl,#___str_13
   764B E5            [11]  842 	push	hl
   764C CD AA 79      [17]  843 	call	_cpct_drawStringM0
   764F 21 06 00      [10]  844 	ld	hl,#6
   7652 39            [11]  845 	add	hl,sp
   7653 F9            [ 6]  846 	ld	sp,hl
                            847 ;src/menu/menu.c:166: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   7654 21 0A AF      [10]  848 	ld	hl,#0xAF0A
   7657 E5            [11]  849 	push	hl
   7658 21 00 C0      [10]  850 	ld	hl,#0xC000
   765B E5            [11]  851 	push	hl
   765C CD 91 85      [17]  852 	call	_cpct_getScreenPtr
   765F 4D            [ 4]  853 	ld	c,l
   7660 44            [ 4]  854 	ld	b,h
                            855 ;src/menu/menu.c:167: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   7661 21 02 00      [10]  856 	ld	hl,#0x0002
   7664 E5            [11]  857 	push	hl
   7665 C5            [11]  858 	push	bc
   7666 21 BC 76      [10]  859 	ld	hl,#___str_14
   7669 E5            [11]  860 	push	hl
   766A CD AA 79      [17]  861 	call	_cpct_drawStringM0
   766D 21 06 00      [10]  862 	ld	hl,#6
   7670 39            [11]  863 	add	hl,sp
   7671 F9            [ 6]  864 	ld	sp,hl
                            865 ;src/menu/menu.c:170: do{
   7672                     866 00107$:
                            867 ;src/menu/menu.c:171: cpct_scanKeyboard_f();
   7672 CD 11 79      [17]  868 	call	_cpct_scanKeyboard_f
                            869 ;src/menu/menu.c:175: if(cpct_isKeyPressed(Key_M)){
   7675 21 04 40      [10]  870 	ld	hl,#0x4004
   7678 CD 92 79      [17]  871 	call	_cpct_isKeyPressed
   767B 7D            [ 4]  872 	ld	a,l
   767C B7            [ 4]  873 	or	a, a
   767D 28 10         [12]  874 	jr	Z,00108$
                            875 ;src/menu/menu.c:176: cpct_scanKeyboard_f();
   767F CD 11 79      [17]  876 	call	_cpct_scanKeyboard_f
                            877 ;src/menu/menu.c:177: do{
   7682                     878 00101$:
                            879 ;src/menu/menu.c:178: menuOpciones();
   7682 CD 22 75      [17]  880 	call	_menuOpciones
                            881 ;src/menu/menu.c:180: } while(!cpct_isKeyPressed(Key_S));
   7685 21 07 10      [10]  882 	ld	hl,#0x1007
   7688 CD 92 79      [17]  883 	call	_cpct_isKeyPressed
   768B 7D            [ 4]  884 	ld	a,l
   768C B7            [ 4]  885 	or	a, a
   768D 28 F3         [12]  886 	jr	Z,00101$
   768F                     887 00108$:
                            888 ;src/menu/menu.c:182: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   768F 21 07 10      [10]  889 	ld	hl,#0x1007
   7692 CD 92 79      [17]  890 	call	_cpct_isKeyPressed
   7695 7D            [ 4]  891 	ld	a,l
   7696 B7            [ 4]  892 	or	a, a
   7697 C0            [11]  893 	ret	NZ
   7698 21 04 40      [10]  894 	ld	hl,#0x4004
   769B CD 92 79      [17]  895 	call	_cpct_isKeyPressed
   769E 7D            [ 4]  896 	ld	a,l
   769F B7            [ 4]  897 	or	a, a
   76A0 28 D0         [12]  898 	jr	Z,00107$
   76A2 C9            [10]  899 	ret
   76A3                     900 ___str_12:
   76A3 52 4F 42 4F 42 49   901 	.ascii "ROBOBIT"
        54
   76AA 00                  902 	.db 0x00
   76AB                     903 ___str_13:
   76AB 54 4F 20 53 54 41   904 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   76BB 00                  905 	.db 0x00
   76BC                     906 ___str_14:
   76BC 54 4F 20 4D 45 4E   907 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   76CB 00                  908 	.db 0x00
                            909 	.area _CODE
                            910 	.area _INITIALIZER
                            911 	.area _CABS (ABS)
