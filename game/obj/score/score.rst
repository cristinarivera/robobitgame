                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module score
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _borrarPantalla
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawStringM0
                             14 	.globl _cpct_drawCharM0
                             15 	.globl _cpct_drawSprite
                             16 	.globl _barraPuntuacionInicial
                             17 	.globl _modificarPuntuacion
                             18 	.globl _modificarVidas
                             19 	.globl _aumentarPuntuacion
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/score/score.c:6: void barraPuntuacionInicial(){
                             52 ;	---------------------------------
                             53 ; Function barraPuntuacionInicial
                             54 ; ---------------------------------
   5185                      55 _barraPuntuacionInicial::
                             56 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5185 21 00 02      [10]   57 	ld	hl,#0x0200
   5188 E5            [11]   58 	push	hl
   5189 26 C0         [ 7]   59 	ld	h, #0xC0
   518B E5            [11]   60 	push	hl
   518C CD 42 60      [17]   61 	call	_cpct_getScreenPtr
   518F 4D            [ 4]   62 	ld	c,l
   5190 44            [ 4]   63 	ld	b,h
                             64 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   5191 21 01 00      [10]   65 	ld	hl,#0x0001
   5194 E5            [11]   66 	push	hl
   5195 C5            [11]   67 	push	bc
   5196 21 0F 52      [10]   68 	ld	hl,#___str_0
   5199 E5            [11]   69 	push	hl
   519A CD 5B 54      [17]   70 	call	_cpct_drawStringM0
   519D 21 06 00      [10]   71 	ld	hl,#6
   51A0 39            [11]   72 	add	hl,sp
   51A1 F9            [ 6]   73 	ld	sp,hl
                             74 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   51A2 21 00 0E      [10]   75 	ld	hl,#0x0E00
   51A5 E5            [11]   76 	push	hl
   51A6 26 C0         [ 7]   77 	ld	h, #0xC0
   51A8 E5            [11]   78 	push	hl
   51A9 CD 42 60      [17]   79 	call	_cpct_getScreenPtr
   51AC 4D            [ 4]   80 	ld	c,l
   51AD 44            [ 4]   81 	ld	b,h
                             82 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   51AE 21 0F 00      [10]   83 	ld	hl,#0x000F
   51B1 E5            [11]   84 	push	hl
   51B2 C5            [11]   85 	push	bc
   51B3 21 15 52      [10]   86 	ld	hl,#___str_1
   51B6 E5            [11]   87 	push	hl
   51B7 CD 5B 54      [17]   88 	call	_cpct_drawStringM0
   51BA 21 06 00      [10]   89 	ld	hl,#6
   51BD 39            [11]   90 	add	hl,sp
   51BE F9            [ 6]   91 	ld	sp,hl
                             92 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   51BF 21 3C 02      [10]   93 	ld	hl,#0x023C
   51C2 E5            [11]   94 	push	hl
   51C3 21 00 C0      [10]   95 	ld	hl,#0xC000
   51C6 E5            [11]   96 	push	hl
   51C7 CD 42 60      [17]   97 	call	_cpct_getScreenPtr
   51CA 4D            [ 4]   98 	ld	c,l
   51CB 44            [ 4]   99 	ld	b,h
                            100 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   51CC 21 01 00      [10]  101 	ld	hl,#0x0001
   51CF E5            [11]  102 	push	hl
   51D0 C5            [11]  103 	push	bc
   51D1 21 1B 52      [10]  104 	ld	hl,#___str_2
   51D4 E5            [11]  105 	push	hl
   51D5 CD 5B 54      [17]  106 	call	_cpct_drawStringM0
   51D8 21 06 00      [10]  107 	ld	hl,#6
   51DB 39            [11]  108 	add	hl,sp
   51DC F9            [ 6]  109 	ld	sp,hl
                            110 ;src/score/score.c:18: for(i=0; i<5; i++){
   51DD 01 00 00      [10]  111 	ld	bc,#0x0000
   51E0                     112 00102$:
                            113 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   51E0 79            [ 4]  114 	ld	a,c
   51E1 87            [ 4]  115 	add	a, a
   51E2 87            [ 4]  116 	add	a, a
   51E3 C6 3C         [ 7]  117 	add	a, #0x3C
   51E5 57            [ 4]  118 	ld	d,a
   51E6 C5            [11]  119 	push	bc
   51E7 3E 0E         [ 7]  120 	ld	a,#0x0E
   51E9 F5            [11]  121 	push	af
   51EA 33            [ 6]  122 	inc	sp
   51EB D5            [11]  123 	push	de
   51EC 33            [ 6]  124 	inc	sp
   51ED 21 00 C0      [10]  125 	ld	hl,#0xC000
   51F0 E5            [11]  126 	push	hl
   51F1 CD 42 60      [17]  127 	call	_cpct_getScreenPtr
   51F4 EB            [ 4]  128 	ex	de,hl
   51F5 21 03 06      [10]  129 	ld	hl,#0x0603
   51F8 E5            [11]  130 	push	hl
   51F9 D5            [11]  131 	push	de
   51FA 21 28 3C      [10]  132 	ld	hl,#_g_heart
   51FD E5            [11]  133 	push	hl
   51FE CD 7F 54      [17]  134 	call	_cpct_drawSprite
   5201 C1            [10]  135 	pop	bc
                            136 ;src/score/score.c:18: for(i=0; i<5; i++){
   5202 03            [ 6]  137 	inc	bc
   5203 79            [ 4]  138 	ld	a,c
   5204 D6 05         [ 7]  139 	sub	a, #0x05
   5206 78            [ 4]  140 	ld	a,b
   5207 17            [ 4]  141 	rla
   5208 3F            [ 4]  142 	ccf
   5209 1F            [ 4]  143 	rra
   520A DE 80         [ 7]  144 	sbc	a, #0x80
   520C 38 D2         [12]  145 	jr	C,00102$
   520E C9            [10]  146 	ret
   520F                     147 ___str_0:
   520F 53 43 4F 52 45      148 	.ascii "SCORE"
   5214 00                  149 	.db 0x00
   5215                     150 ___str_1:
   5215 30 30 30 30 30      151 	.ascii "00000"
   521A 00                  152 	.db 0x00
   521B                     153 ___str_2:
   521B 4C 49 56 45 53      154 	.ascii "LIVES"
   5220 00                  155 	.db 0x00
                            156 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            157 ;	---------------------------------
                            158 ; Function modificarPuntuacion
                            159 ; ---------------------------------
   5221                     160 _modificarPuntuacion::
   5221 DD E5         [15]  161 	push	ix
   5223 DD 21 00 00   [14]  162 	ld	ix,#0
   5227 DD 39         [15]  163 	add	ix,sp
   5229 3B            [ 6]  164 	dec	sp
                            165 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   522A DD 5E 04      [19]  166 	ld	e,4 (ix)
   522D DD 56 05      [19]  167 	ld	d,5 (ix)
                            168 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5230 D5            [11]  169 	push	de
   5231 21 19 07      [10]  170 	ld	hl,#0x0719
   5234 E5            [11]  171 	push	hl
   5235 21 00 0E      [10]  172 	ld	hl,#0x0E00
   5238 E5            [11]  173 	push	hl
   5239 CD 59 4D      [17]  174 	call	_borrarPantalla
   523C F1            [10]  175 	pop	af
   523D F1            [10]  176 	pop	af
   523E 21 00 0E      [10]  177 	ld	hl,#0x0E00
   5241 E5            [11]  178 	push	hl
   5242 26 C0         [ 7]  179 	ld	h, #0xC0
   5244 E5            [11]  180 	push	hl
   5245 CD 42 60      [17]  181 	call	_cpct_getScreenPtr
   5248 4D            [ 4]  182 	ld	c,l
   5249 44            [ 4]  183 	ld	b,h
   524A D1            [10]  184 	pop	de
                            185 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   524B C5            [11]  186 	push	bc
   524C D5            [11]  187 	push	de
   524D 21 0A 00      [10]  188 	ld	hl,#0x000A
   5250 E5            [11]  189 	push	hl
   5251 D5            [11]  190 	push	de
   5252 CD 37 60      [17]  191 	call	__moduint
   5255 F1            [10]  192 	pop	af
   5256 F1            [10]  193 	pop	af
   5257 D1            [10]  194 	pop	de
   5258 C1            [10]  195 	pop	bc
   5259 7D            [ 4]  196 	ld	a,l
   525A C6 30         [ 7]  197 	add	a, #0x30
   525C DD 77 FF      [19]  198 	ld	-1 (ix),a
   525F C5            [11]  199 	push	bc
   5260 FD E1         [14]  200 	pop	iy
   5262 C5            [11]  201 	push	bc
   5263 D5            [11]  202 	push	de
   5264 DD 7E FF      [19]  203 	ld	a,-1 (ix)
   5267 F5            [11]  204 	push	af
   5268 33            [ 6]  205 	inc	sp
   5269 21 02 00      [10]  206 	ld	hl,#0x0002
   526C E5            [11]  207 	push	hl
   526D FD E5         [15]  208 	push	iy
   526F CD B3 55      [17]  209 	call	_cpct_drawCharM0
   5272 F1            [10]  210 	pop	af
   5273 F1            [10]  211 	pop	af
   5274 33            [ 6]  212 	inc	sp
   5275 D1            [10]  213 	pop	de
   5276 21 E8 03      [10]  214 	ld	hl,#0x03E8
   5279 E5            [11]  215 	push	hl
   527A D5            [11]  216 	push	de
   527B CD 81 53      [17]  217 	call	__divuint
   527E F1            [10]  218 	pop	af
   527F F1            [10]  219 	pop	af
   5280 11 0A 00      [10]  220 	ld	de,#0x000A
   5283 D5            [11]  221 	push	de
   5284 E5            [11]  222 	push	hl
   5285 CD 37 60      [17]  223 	call	__moduint
   5288 F1            [10]  224 	pop	af
   5289 F1            [10]  225 	pop	af
   528A C1            [10]  226 	pop	bc
   528B 7D            [ 4]  227 	ld	a,l
   528C C6 30         [ 7]  228 	add	a, #0x30
   528E 67            [ 4]  229 	ld	h,a
   528F 79            [ 4]  230 	ld	a,c
   5290 C6 04         [ 7]  231 	add	a, #0x04
   5292 5F            [ 4]  232 	ld	e,a
   5293 78            [ 4]  233 	ld	a,b
   5294 CE 00         [ 7]  234 	adc	a, #0x00
   5296 57            [ 4]  235 	ld	d,a
   5297 C5            [11]  236 	push	bc
   5298 E5            [11]  237 	push	hl
   5299 33            [ 6]  238 	inc	sp
   529A 21 02 00      [10]  239 	ld	hl,#0x0002
   529D E5            [11]  240 	push	hl
   529E D5            [11]  241 	push	de
   529F CD B3 55      [17]  242 	call	_cpct_drawCharM0
   52A2 F1            [10]  243 	pop	af
   52A3 33            [ 6]  244 	inc	sp
   52A4 21 64 00      [10]  245 	ld	hl,#0x0064
   52A7 E3            [19]  246 	ex	(sp),hl
   52A8 DD 6E 04      [19]  247 	ld	l,4 (ix)
   52AB DD 66 05      [19]  248 	ld	h,5 (ix)
   52AE E5            [11]  249 	push	hl
   52AF CD 81 53      [17]  250 	call	__divuint
   52B2 F1            [10]  251 	pop	af
   52B3 F1            [10]  252 	pop	af
   52B4 11 0A 00      [10]  253 	ld	de,#0x000A
   52B7 D5            [11]  254 	push	de
   52B8 E5            [11]  255 	push	hl
   52B9 CD 37 60      [17]  256 	call	__moduint
   52BC F1            [10]  257 	pop	af
   52BD F1            [10]  258 	pop	af
   52BE C1            [10]  259 	pop	bc
   52BF 7D            [ 4]  260 	ld	a,l
   52C0 C6 30         [ 7]  261 	add	a, #0x30
   52C2 67            [ 4]  262 	ld	h,a
   52C3 79            [ 4]  263 	ld	a,c
   52C4 C6 08         [ 7]  264 	add	a, #0x08
   52C6 5F            [ 4]  265 	ld	e,a
   52C7 78            [ 4]  266 	ld	a,b
   52C8 CE 00         [ 7]  267 	adc	a, #0x00
   52CA 57            [ 4]  268 	ld	d,a
   52CB C5            [11]  269 	push	bc
   52CC E5            [11]  270 	push	hl
   52CD 33            [ 6]  271 	inc	sp
   52CE 21 02 00      [10]  272 	ld	hl,#0x0002
   52D1 E5            [11]  273 	push	hl
   52D2 D5            [11]  274 	push	de
   52D3 CD B3 55      [17]  275 	call	_cpct_drawCharM0
   52D6 F1            [10]  276 	pop	af
   52D7 33            [ 6]  277 	inc	sp
   52D8 21 0A 00      [10]  278 	ld	hl,#0x000A
   52DB E3            [19]  279 	ex	(sp),hl
   52DC DD 6E 04      [19]  280 	ld	l,4 (ix)
   52DF DD 66 05      [19]  281 	ld	h,5 (ix)
   52E2 E5            [11]  282 	push	hl
   52E3 CD 81 53      [17]  283 	call	__divuint
   52E6 F1            [10]  284 	pop	af
   52E7 F1            [10]  285 	pop	af
   52E8 11 0A 00      [10]  286 	ld	de,#0x000A
   52EB D5            [11]  287 	push	de
   52EC E5            [11]  288 	push	hl
   52ED CD 37 60      [17]  289 	call	__moduint
   52F0 F1            [10]  290 	pop	af
   52F1 F1            [10]  291 	pop	af
   52F2 C1            [10]  292 	pop	bc
   52F3 7D            [ 4]  293 	ld	a,l
   52F4 C6 30         [ 7]  294 	add	a, #0x30
   52F6 67            [ 4]  295 	ld	h,a
   52F7 79            [ 4]  296 	ld	a,c
   52F8 C6 0C         [ 7]  297 	add	a, #0x0C
   52FA 5F            [ 4]  298 	ld	e,a
   52FB 78            [ 4]  299 	ld	a,b
   52FC CE 00         [ 7]  300 	adc	a, #0x00
   52FE 57            [ 4]  301 	ld	d,a
   52FF C5            [11]  302 	push	bc
   5300 E5            [11]  303 	push	hl
   5301 33            [ 6]  304 	inc	sp
   5302 21 02 00      [10]  305 	ld	hl,#0x0002
   5305 E5            [11]  306 	push	hl
   5306 D5            [11]  307 	push	de
   5307 CD B3 55      [17]  308 	call	_cpct_drawCharM0
   530A F1            [10]  309 	pop	af
   530B F1            [10]  310 	pop	af
   530C 33            [ 6]  311 	inc	sp
   530D C1            [10]  312 	pop	bc
                            313 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   530E 21 10 00      [10]  314 	ld	hl,#0x0010
   5311 09            [11]  315 	add	hl,bc
   5312 4D            [ 4]  316 	ld	c,l
   5313 44            [ 4]  317 	ld	b,h
   5314 DD 7E FF      [19]  318 	ld	a,-1 (ix)
   5317 F5            [11]  319 	push	af
   5318 33            [ 6]  320 	inc	sp
   5319 21 02 00      [10]  321 	ld	hl,#0x0002
   531C E5            [11]  322 	push	hl
   531D C5            [11]  323 	push	bc
   531E CD B3 55      [17]  324 	call	_cpct_drawCharM0
   5321 F1            [10]  325 	pop	af
   5322 F1            [10]  326 	pop	af
   5323 33            [ 6]  327 	inc	sp
   5324 33            [ 6]  328 	inc	sp
   5325 DD E1         [14]  329 	pop	ix
   5327 C9            [10]  330 	ret
                            331 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            332 ;	---------------------------------
                            333 ; Function modificarVidas
                            334 ; ---------------------------------
   5328                     335 _modificarVidas::
   5328 DD E5         [15]  336 	push	ix
                            337 ;src/score/score.c:46: for(i=0; i<5; i++){
   532A 01 00 00      [10]  338 	ld	bc,#0x0000
   532D                     339 00102$:
                            340 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   532D 79            [ 4]  341 	ld	a,c
   532E 87            [ 4]  342 	add	a, a
   532F 87            [ 4]  343 	add	a, a
   5330 C6 3C         [ 7]  344 	add	a, #0x3C
   5332 57            [ 4]  345 	ld	d,a
   5333 C5            [11]  346 	push	bc
   5334 3E 0E         [ 7]  347 	ld	a,#0x0E
   5336 F5            [11]  348 	push	af
   5337 33            [ 6]  349 	inc	sp
   5338 D5            [11]  350 	push	de
   5339 33            [ 6]  351 	inc	sp
   533A 21 00 C0      [10]  352 	ld	hl,#0xC000
   533D E5            [11]  353 	push	hl
   533E CD 42 60      [17]  354 	call	_cpct_getScreenPtr
   5341 EB            [ 4]  355 	ex	de,hl
   5342 21 03 06      [10]  356 	ld	hl,#0x0603
   5345 E5            [11]  357 	push	hl
   5346 D5            [11]  358 	push	de
   5347 21 28 3C      [10]  359 	ld	hl,#_g_heart
   534A E5            [11]  360 	push	hl
   534B CD 7F 54      [17]  361 	call	_cpct_drawSprite
   534E C1            [10]  362 	pop	bc
                            363 ;src/score/score.c:46: for(i=0; i<5; i++){
   534F 03            [ 6]  364 	inc	bc
   5350 79            [ 4]  365 	ld	a,c
   5351 D6 05         [ 7]  366 	sub	a, #0x05
   5353 78            [ 4]  367 	ld	a,b
   5354 17            [ 4]  368 	rla
   5355 3F            [ 4]  369 	ccf
   5356 1F            [ 4]  370 	rra
   5357 DE 80         [ 7]  371 	sbc	a, #0x80
   5359 38 D2         [12]  372 	jr	C,00102$
   535B DD E1         [14]  373 	pop	ix
   535D C9            [10]  374 	ret
                            375 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            376 ;	---------------------------------
                            377 ; Function aumentarPuntuacion
                            378 ; ---------------------------------
   535E                     379 _aumentarPuntuacion::
                            380 ;src/score/score.c:53: return puntuacion + 10;
   535E FD 21 02 00   [14]  381 	ld	iy,#2
   5362 FD 39         [15]  382 	add	iy,sp
   5364 FD 7E 00      [19]  383 	ld	a,0 (iy)
   5367 C6 0A         [ 7]  384 	add	a, #0x0A
   5369 6F            [ 4]  385 	ld	l, a
   536A FD 7E 01      [19]  386 	ld	a, 1 (iy)
   536D CE 00         [ 7]  387 	adc	a, #0x00
   536F 67            [ 4]  388 	ld	h, a
   5370 C9            [10]  389 	ret
                            390 	.area _CODE
                            391 	.area _INITIALIZER
                            392 	.area _CABS (ABS)
