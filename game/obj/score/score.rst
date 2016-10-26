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
                             20 	.globl _quitarVidas
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/score/score.c:6: void barraPuntuacionInicial(){
                             53 ;	---------------------------------
                             54 ; Function barraPuntuacionInicial
                             55 ; ---------------------------------
   5195                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5195 21 00 02      [10]   58 	ld	hl,#0x0200
   5198 E5            [11]   59 	push	hl
   5199 26 C0         [ 7]   60 	ld	h, #0xC0
   519B E5            [11]   61 	push	hl
   519C CD 5A 60      [17]   62 	call	_cpct_getScreenPtr
   519F 4D            [ 4]   63 	ld	c,l
   51A0 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   51A1 21 01 00      [10]   66 	ld	hl,#0x0001
   51A4 E5            [11]   67 	push	hl
   51A5 C5            [11]   68 	push	bc
   51A6 21 1F 52      [10]   69 	ld	hl,#___str_0
   51A9 E5            [11]   70 	push	hl
   51AA CD 73 54      [17]   71 	call	_cpct_drawStringM0
   51AD 21 06 00      [10]   72 	ld	hl,#6
   51B0 39            [11]   73 	add	hl,sp
   51B1 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   51B2 21 00 0E      [10]   76 	ld	hl,#0x0E00
   51B5 E5            [11]   77 	push	hl
   51B6 26 C0         [ 7]   78 	ld	h, #0xC0
   51B8 E5            [11]   79 	push	hl
   51B9 CD 5A 60      [17]   80 	call	_cpct_getScreenPtr
   51BC 4D            [ 4]   81 	ld	c,l
   51BD 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   51BE 21 0F 00      [10]   84 	ld	hl,#0x000F
   51C1 E5            [11]   85 	push	hl
   51C2 C5            [11]   86 	push	bc
   51C3 21 25 52      [10]   87 	ld	hl,#___str_1
   51C6 E5            [11]   88 	push	hl
   51C7 CD 73 54      [17]   89 	call	_cpct_drawStringM0
   51CA 21 06 00      [10]   90 	ld	hl,#6
   51CD 39            [11]   91 	add	hl,sp
   51CE F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   51CF 21 3C 02      [10]   94 	ld	hl,#0x023C
   51D2 E5            [11]   95 	push	hl
   51D3 21 00 C0      [10]   96 	ld	hl,#0xC000
   51D6 E5            [11]   97 	push	hl
   51D7 CD 5A 60      [17]   98 	call	_cpct_getScreenPtr
   51DA 4D            [ 4]   99 	ld	c,l
   51DB 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   51DC 21 01 00      [10]  102 	ld	hl,#0x0001
   51DF E5            [11]  103 	push	hl
   51E0 C5            [11]  104 	push	bc
   51E1 21 2B 52      [10]  105 	ld	hl,#___str_2
   51E4 E5            [11]  106 	push	hl
   51E5 CD 73 54      [17]  107 	call	_cpct_drawStringM0
   51E8 21 06 00      [10]  108 	ld	hl,#6
   51EB 39            [11]  109 	add	hl,sp
   51EC F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   51ED 01 00 00      [10]  112 	ld	bc,#0x0000
   51F0                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   51F0 79            [ 4]  115 	ld	a,c
   51F1 87            [ 4]  116 	add	a, a
   51F2 87            [ 4]  117 	add	a, a
   51F3 C6 3C         [ 7]  118 	add	a, #0x3C
   51F5 57            [ 4]  119 	ld	d,a
   51F6 C5            [11]  120 	push	bc
   51F7 3E 0E         [ 7]  121 	ld	a,#0x0E
   51F9 F5            [11]  122 	push	af
   51FA 33            [ 6]  123 	inc	sp
   51FB D5            [11]  124 	push	de
   51FC 33            [ 6]  125 	inc	sp
   51FD 21 00 C0      [10]  126 	ld	hl,#0xC000
   5200 E5            [11]  127 	push	hl
   5201 CD 5A 60      [17]  128 	call	_cpct_getScreenPtr
   5204 EB            [ 4]  129 	ex	de,hl
   5205 21 03 06      [10]  130 	ld	hl,#0x0603
   5208 E5            [11]  131 	push	hl
   5209 D5            [11]  132 	push	de
   520A 21 28 3C      [10]  133 	ld	hl,#_g_heart
   520D E5            [11]  134 	push	hl
   520E CD 97 54      [17]  135 	call	_cpct_drawSprite
   5211 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   5212 03            [ 6]  138 	inc	bc
   5213 79            [ 4]  139 	ld	a,c
   5214 D6 05         [ 7]  140 	sub	a, #0x05
   5216 78            [ 4]  141 	ld	a,b
   5217 17            [ 4]  142 	rla
   5218 3F            [ 4]  143 	ccf
   5219 1F            [ 4]  144 	rra
   521A DE 80         [ 7]  145 	sbc	a, #0x80
   521C 38 D2         [12]  146 	jr	C,00102$
   521E C9            [10]  147 	ret
   521F                     148 ___str_0:
   521F 53 43 4F 52 45      149 	.ascii "SCORE"
   5224 00                  150 	.db 0x00
   5225                     151 ___str_1:
   5225 30 30 30 30 30      152 	.ascii "00000"
   522A 00                  153 	.db 0x00
   522B                     154 ___str_2:
   522B 4C 49 56 45 53      155 	.ascii "LIVES"
   5230 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   5231                     161 _modificarPuntuacion::
   5231 DD E5         [15]  162 	push	ix
   5233 DD 21 00 00   [14]  163 	ld	ix,#0
   5237 DD 39         [15]  164 	add	ix,sp
   5239 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   523A DD 5E 04      [19]  167 	ld	e,4 (ix)
   523D DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5240 D5            [11]  170 	push	de
   5241 21 19 07      [10]  171 	ld	hl,#0x0719
   5244 E5            [11]  172 	push	hl
   5245 21 00 0E      [10]  173 	ld	hl,#0x0E00
   5248 E5            [11]  174 	push	hl
   5249 CD 69 4D      [17]  175 	call	_borrarPantalla
   524C F1            [10]  176 	pop	af
   524D F1            [10]  177 	pop	af
   524E 21 00 0E      [10]  178 	ld	hl,#0x0E00
   5251 E5            [11]  179 	push	hl
   5252 26 C0         [ 7]  180 	ld	h, #0xC0
   5254 E5            [11]  181 	push	hl
   5255 CD 5A 60      [17]  182 	call	_cpct_getScreenPtr
   5258 4D            [ 4]  183 	ld	c,l
   5259 44            [ 4]  184 	ld	b,h
   525A D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   525B C5            [11]  187 	push	bc
   525C D5            [11]  188 	push	de
   525D 21 0A 00      [10]  189 	ld	hl,#0x000A
   5260 E5            [11]  190 	push	hl
   5261 D5            [11]  191 	push	de
   5262 CD 4F 60      [17]  192 	call	__moduint
   5265 F1            [10]  193 	pop	af
   5266 F1            [10]  194 	pop	af
   5267 D1            [10]  195 	pop	de
   5268 C1            [10]  196 	pop	bc
   5269 7D            [ 4]  197 	ld	a,l
   526A C6 30         [ 7]  198 	add	a, #0x30
   526C DD 77 FF      [19]  199 	ld	-1 (ix),a
   526F C5            [11]  200 	push	bc
   5270 FD E1         [14]  201 	pop	iy
   5272 C5            [11]  202 	push	bc
   5273 D5            [11]  203 	push	de
   5274 DD 7E FF      [19]  204 	ld	a,-1 (ix)
   5277 F5            [11]  205 	push	af
   5278 33            [ 6]  206 	inc	sp
   5279 21 02 00      [10]  207 	ld	hl,#0x0002
   527C E5            [11]  208 	push	hl
   527D FD E5         [15]  209 	push	iy
   527F CD CB 55      [17]  210 	call	_cpct_drawCharM0
   5282 F1            [10]  211 	pop	af
   5283 F1            [10]  212 	pop	af
   5284 33            [ 6]  213 	inc	sp
   5285 D1            [10]  214 	pop	de
   5286 21 E8 03      [10]  215 	ld	hl,#0x03E8
   5289 E5            [11]  216 	push	hl
   528A D5            [11]  217 	push	de
   528B CD 99 53      [17]  218 	call	__divuint
   528E F1            [10]  219 	pop	af
   528F F1            [10]  220 	pop	af
   5290 11 0A 00      [10]  221 	ld	de,#0x000A
   5293 D5            [11]  222 	push	de
   5294 E5            [11]  223 	push	hl
   5295 CD 4F 60      [17]  224 	call	__moduint
   5298 F1            [10]  225 	pop	af
   5299 F1            [10]  226 	pop	af
   529A C1            [10]  227 	pop	bc
   529B 7D            [ 4]  228 	ld	a,l
   529C C6 30         [ 7]  229 	add	a, #0x30
   529E 67            [ 4]  230 	ld	h,a
   529F 79            [ 4]  231 	ld	a,c
   52A0 C6 04         [ 7]  232 	add	a, #0x04
   52A2 5F            [ 4]  233 	ld	e,a
   52A3 78            [ 4]  234 	ld	a,b
   52A4 CE 00         [ 7]  235 	adc	a, #0x00
   52A6 57            [ 4]  236 	ld	d,a
   52A7 C5            [11]  237 	push	bc
   52A8 E5            [11]  238 	push	hl
   52A9 33            [ 6]  239 	inc	sp
   52AA 21 02 00      [10]  240 	ld	hl,#0x0002
   52AD E5            [11]  241 	push	hl
   52AE D5            [11]  242 	push	de
   52AF CD CB 55      [17]  243 	call	_cpct_drawCharM0
   52B2 F1            [10]  244 	pop	af
   52B3 33            [ 6]  245 	inc	sp
   52B4 21 64 00      [10]  246 	ld	hl,#0x0064
   52B7 E3            [19]  247 	ex	(sp),hl
   52B8 DD 6E 04      [19]  248 	ld	l,4 (ix)
   52BB DD 66 05      [19]  249 	ld	h,5 (ix)
   52BE E5            [11]  250 	push	hl
   52BF CD 99 53      [17]  251 	call	__divuint
   52C2 F1            [10]  252 	pop	af
   52C3 F1            [10]  253 	pop	af
   52C4 11 0A 00      [10]  254 	ld	de,#0x000A
   52C7 D5            [11]  255 	push	de
   52C8 E5            [11]  256 	push	hl
   52C9 CD 4F 60      [17]  257 	call	__moduint
   52CC F1            [10]  258 	pop	af
   52CD F1            [10]  259 	pop	af
   52CE C1            [10]  260 	pop	bc
   52CF 7D            [ 4]  261 	ld	a,l
   52D0 C6 30         [ 7]  262 	add	a, #0x30
   52D2 67            [ 4]  263 	ld	h,a
   52D3 79            [ 4]  264 	ld	a,c
   52D4 C6 08         [ 7]  265 	add	a, #0x08
   52D6 5F            [ 4]  266 	ld	e,a
   52D7 78            [ 4]  267 	ld	a,b
   52D8 CE 00         [ 7]  268 	adc	a, #0x00
   52DA 57            [ 4]  269 	ld	d,a
   52DB C5            [11]  270 	push	bc
   52DC E5            [11]  271 	push	hl
   52DD 33            [ 6]  272 	inc	sp
   52DE 21 02 00      [10]  273 	ld	hl,#0x0002
   52E1 E5            [11]  274 	push	hl
   52E2 D5            [11]  275 	push	de
   52E3 CD CB 55      [17]  276 	call	_cpct_drawCharM0
   52E6 F1            [10]  277 	pop	af
   52E7 33            [ 6]  278 	inc	sp
   52E8 21 0A 00      [10]  279 	ld	hl,#0x000A
   52EB E3            [19]  280 	ex	(sp),hl
   52EC DD 6E 04      [19]  281 	ld	l,4 (ix)
   52EF DD 66 05      [19]  282 	ld	h,5 (ix)
   52F2 E5            [11]  283 	push	hl
   52F3 CD 99 53      [17]  284 	call	__divuint
   52F6 F1            [10]  285 	pop	af
   52F7 F1            [10]  286 	pop	af
   52F8 11 0A 00      [10]  287 	ld	de,#0x000A
   52FB D5            [11]  288 	push	de
   52FC E5            [11]  289 	push	hl
   52FD CD 4F 60      [17]  290 	call	__moduint
   5300 F1            [10]  291 	pop	af
   5301 F1            [10]  292 	pop	af
   5302 C1            [10]  293 	pop	bc
   5303 7D            [ 4]  294 	ld	a,l
   5304 C6 30         [ 7]  295 	add	a, #0x30
   5306 67            [ 4]  296 	ld	h,a
   5307 79            [ 4]  297 	ld	a,c
   5308 C6 0C         [ 7]  298 	add	a, #0x0C
   530A 5F            [ 4]  299 	ld	e,a
   530B 78            [ 4]  300 	ld	a,b
   530C CE 00         [ 7]  301 	adc	a, #0x00
   530E 57            [ 4]  302 	ld	d,a
   530F C5            [11]  303 	push	bc
   5310 E5            [11]  304 	push	hl
   5311 33            [ 6]  305 	inc	sp
   5312 21 02 00      [10]  306 	ld	hl,#0x0002
   5315 E5            [11]  307 	push	hl
   5316 D5            [11]  308 	push	de
   5317 CD CB 55      [17]  309 	call	_cpct_drawCharM0
   531A F1            [10]  310 	pop	af
   531B F1            [10]  311 	pop	af
   531C 33            [ 6]  312 	inc	sp
   531D C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   531E 21 10 00      [10]  315 	ld	hl,#0x0010
   5321 09            [11]  316 	add	hl,bc
   5322 4D            [ 4]  317 	ld	c,l
   5323 44            [ 4]  318 	ld	b,h
   5324 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   5327 F5            [11]  320 	push	af
   5328 33            [ 6]  321 	inc	sp
   5329 21 02 00      [10]  322 	ld	hl,#0x0002
   532C E5            [11]  323 	push	hl
   532D C5            [11]  324 	push	bc
   532E CD CB 55      [17]  325 	call	_cpct_drawCharM0
   5331 F1            [10]  326 	pop	af
   5332 F1            [10]  327 	pop	af
   5333 33            [ 6]  328 	inc	sp
   5334 33            [ 6]  329 	inc	sp
   5335 DD E1         [14]  330 	pop	ix
   5337 C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   5338                     336 _modificarVidas::
   5338 DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   533A 01 00 00      [10]  339 	ld	bc,#0x0000
   533D                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   533D 79            [ 4]  342 	ld	a,c
   533E 87            [ 4]  343 	add	a, a
   533F 87            [ 4]  344 	add	a, a
   5340 C6 3C         [ 7]  345 	add	a, #0x3C
   5342 57            [ 4]  346 	ld	d,a
   5343 C5            [11]  347 	push	bc
   5344 3E 0E         [ 7]  348 	ld	a,#0x0E
   5346 F5            [11]  349 	push	af
   5347 33            [ 6]  350 	inc	sp
   5348 D5            [11]  351 	push	de
   5349 33            [ 6]  352 	inc	sp
   534A 21 00 C0      [10]  353 	ld	hl,#0xC000
   534D E5            [11]  354 	push	hl
   534E CD 5A 60      [17]  355 	call	_cpct_getScreenPtr
   5351 EB            [ 4]  356 	ex	de,hl
   5352 21 03 06      [10]  357 	ld	hl,#0x0603
   5355 E5            [11]  358 	push	hl
   5356 D5            [11]  359 	push	de
   5357 21 28 3C      [10]  360 	ld	hl,#_g_heart
   535A E5            [11]  361 	push	hl
   535B CD 97 54      [17]  362 	call	_cpct_drawSprite
   535E C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   535F 03            [ 6]  365 	inc	bc
   5360 79            [ 4]  366 	ld	a,c
   5361 D6 05         [ 7]  367 	sub	a, #0x05
   5363 78            [ 4]  368 	ld	a,b
   5364 17            [ 4]  369 	rla
   5365 3F            [ 4]  370 	ccf
   5366 1F            [ 4]  371 	rra
   5367 DE 80         [ 7]  372 	sbc	a, #0x80
   5369 38 D2         [12]  373 	jr	C,00102$
   536B DD E1         [14]  374 	pop	ix
   536D C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   536E                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   536E FD 21 02 00   [14]  382 	ld	iy,#2
   5372 FD 39         [15]  383 	add	iy,sp
   5374 FD 7E 00      [19]  384 	ld	a,0 (iy)
   5377 C6 0A         [ 7]  385 	add	a, #0x0A
   5379 6F            [ 4]  386 	ld	l, a
   537A FD 7E 01      [19]  387 	ld	a, 1 (iy)
   537D CE 00         [ 7]  388 	adc	a, #0x00
   537F 67            [ 4]  389 	ld	h, a
   5380 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   5381                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   5381 21 02 00      [10]  397 	ld	hl, #2+0
   5384 39            [11]  398 	add	hl, sp
   5385 4E            [ 7]  399 	ld	c, (hl)
   5386 0D            [ 4]  400 	dec	c
   5387 69            [ 4]  401 	ld	l,c
   5388 C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
