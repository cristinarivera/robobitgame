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
   5195                      55 _barraPuntuacionInicial::
                             56 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5195 21 00 02      [10]   57 	ld	hl,#0x0200
   5198 E5            [11]   58 	push	hl
   5199 26 C0         [ 7]   59 	ld	h, #0xC0
   519B E5            [11]   60 	push	hl
   519C CD 7F 60      [17]   61 	call	_cpct_getScreenPtr
   519F 4D            [ 4]   62 	ld	c,l
   51A0 44            [ 4]   63 	ld	b,h
                             64 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   51A1 21 01 00      [10]   65 	ld	hl,#0x0001
   51A4 E5            [11]   66 	push	hl
   51A5 C5            [11]   67 	push	bc
   51A6 21 1F 52      [10]   68 	ld	hl,#___str_0
   51A9 E5            [11]   69 	push	hl
   51AA CD 98 54      [17]   70 	call	_cpct_drawStringM0
   51AD 21 06 00      [10]   71 	ld	hl,#6
   51B0 39            [11]   72 	add	hl,sp
   51B1 F9            [ 6]   73 	ld	sp,hl
                             74 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   51B2 21 00 0E      [10]   75 	ld	hl,#0x0E00
   51B5 E5            [11]   76 	push	hl
   51B6 26 C0         [ 7]   77 	ld	h, #0xC0
   51B8 E5            [11]   78 	push	hl
   51B9 CD 7F 60      [17]   79 	call	_cpct_getScreenPtr
   51BC 4D            [ 4]   80 	ld	c,l
   51BD 44            [ 4]   81 	ld	b,h
                             82 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   51BE 21 0F 00      [10]   83 	ld	hl,#0x000F
   51C1 E5            [11]   84 	push	hl
   51C2 C5            [11]   85 	push	bc
   51C3 21 25 52      [10]   86 	ld	hl,#___str_1
   51C6 E5            [11]   87 	push	hl
   51C7 CD 98 54      [17]   88 	call	_cpct_drawStringM0
   51CA 21 06 00      [10]   89 	ld	hl,#6
   51CD 39            [11]   90 	add	hl,sp
   51CE F9            [ 6]   91 	ld	sp,hl
                             92 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   51CF 21 3C 02      [10]   93 	ld	hl,#0x023C
   51D2 E5            [11]   94 	push	hl
   51D3 21 00 C0      [10]   95 	ld	hl,#0xC000
   51D6 E5            [11]   96 	push	hl
   51D7 CD 7F 60      [17]   97 	call	_cpct_getScreenPtr
   51DA 4D            [ 4]   98 	ld	c,l
   51DB 44            [ 4]   99 	ld	b,h
                            100 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   51DC 21 01 00      [10]  101 	ld	hl,#0x0001
   51DF E5            [11]  102 	push	hl
   51E0 C5            [11]  103 	push	bc
   51E1 21 2B 52      [10]  104 	ld	hl,#___str_2
   51E4 E5            [11]  105 	push	hl
   51E5 CD 98 54      [17]  106 	call	_cpct_drawStringM0
   51E8 21 06 00      [10]  107 	ld	hl,#6
   51EB 39            [11]  108 	add	hl,sp
   51EC F9            [ 6]  109 	ld	sp,hl
                            110 ;src/score/score.c:18: for(i=0; i<5; i++){
   51ED 01 00 00      [10]  111 	ld	bc,#0x0000
   51F0                     112 00102$:
                            113 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   51F0 79            [ 4]  114 	ld	a,c
   51F1 87            [ 4]  115 	add	a, a
   51F2 87            [ 4]  116 	add	a, a
   51F3 C6 3C         [ 7]  117 	add	a, #0x3C
   51F5 57            [ 4]  118 	ld	d,a
   51F6 C5            [11]  119 	push	bc
   51F7 3E 0E         [ 7]  120 	ld	a,#0x0E
   51F9 F5            [11]  121 	push	af
   51FA 33            [ 6]  122 	inc	sp
   51FB D5            [11]  123 	push	de
   51FC 33            [ 6]  124 	inc	sp
   51FD 21 00 C0      [10]  125 	ld	hl,#0xC000
   5200 E5            [11]  126 	push	hl
   5201 CD 7F 60      [17]  127 	call	_cpct_getScreenPtr
   5204 EB            [ 4]  128 	ex	de,hl
   5205 21 03 06      [10]  129 	ld	hl,#0x0603
   5208 E5            [11]  130 	push	hl
   5209 D5            [11]  131 	push	de
   520A 21 28 3C      [10]  132 	ld	hl,#_g_heart
   520D E5            [11]  133 	push	hl
   520E CD BC 54      [17]  134 	call	_cpct_drawSprite
   5211 C1            [10]  135 	pop	bc
                            136 ;src/score/score.c:18: for(i=0; i<5; i++){
   5212 03            [ 6]  137 	inc	bc
   5213 79            [ 4]  138 	ld	a,c
   5214 D6 05         [ 7]  139 	sub	a, #0x05
   5216 78            [ 4]  140 	ld	a,b
   5217 17            [ 4]  141 	rla
   5218 3F            [ 4]  142 	ccf
   5219 1F            [ 4]  143 	rra
   521A DE 80         [ 7]  144 	sbc	a, #0x80
   521C 38 D2         [12]  145 	jr	C,00102$
   521E C9            [10]  146 	ret
   521F                     147 ___str_0:
   521F 53 43 4F 52 45      148 	.ascii "SCORE"
   5224 00                  149 	.db 0x00
   5225                     150 ___str_1:
   5225 30 30 30 30 30      151 	.ascii "00000"
   522A 00                  152 	.db 0x00
   522B                     153 ___str_2:
   522B 4C 49 56 45 53      154 	.ascii "LIVES"
   5230 00                  155 	.db 0x00
                            156 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            157 ;	---------------------------------
                            158 ; Function modificarPuntuacion
                            159 ; ---------------------------------
   5231                     160 _modificarPuntuacion::
   5231 DD E5         [15]  161 	push	ix
   5233 DD 21 00 00   [14]  162 	ld	ix,#0
   5237 DD 39         [15]  163 	add	ix,sp
   5239 3B            [ 6]  164 	dec	sp
                            165 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   523A DD 5E 04      [19]  166 	ld	e,4 (ix)
   523D DD 56 05      [19]  167 	ld	d,5 (ix)
                            168 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5240 D5            [11]  169 	push	de
   5241 21 19 07      [10]  170 	ld	hl,#0x0719
   5244 E5            [11]  171 	push	hl
   5245 21 00 0E      [10]  172 	ld	hl,#0x0E00
   5248 E5            [11]  173 	push	hl
   5249 CD 69 4D      [17]  174 	call	_borrarPantalla
   524C F1            [10]  175 	pop	af
   524D F1            [10]  176 	pop	af
   524E 21 00 0E      [10]  177 	ld	hl,#0x0E00
   5251 E5            [11]  178 	push	hl
   5252 26 C0         [ 7]  179 	ld	h, #0xC0
   5254 E5            [11]  180 	push	hl
   5255 CD 7F 60      [17]  181 	call	_cpct_getScreenPtr
   5258 4D            [ 4]  182 	ld	c,l
   5259 44            [ 4]  183 	ld	b,h
   525A D1            [10]  184 	pop	de
                            185 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   525B C5            [11]  186 	push	bc
   525C D5            [11]  187 	push	de
   525D 21 0A 00      [10]  188 	ld	hl,#0x000A
   5260 E5            [11]  189 	push	hl
   5261 D5            [11]  190 	push	de
   5262 CD 8D 56      [17]  191 	call	__moduint
   5265 F1            [10]  192 	pop	af
   5266 F1            [10]  193 	pop	af
   5267 D1            [10]  194 	pop	de
   5268 C1            [10]  195 	pop	bc
   5269 7D            [ 4]  196 	ld	a,l
   526A C6 30         [ 7]  197 	add	a, #0x30
   526C DD 77 FF      [19]  198 	ld	-1 (ix),a
   526F C5            [11]  199 	push	bc
   5270 FD E1         [14]  200 	pop	iy
   5272 C5            [11]  201 	push	bc
   5273 D5            [11]  202 	push	de
   5274 DD 7E FF      [19]  203 	ld	a,-1 (ix)
   5277 F5            [11]  204 	push	af
   5278 33            [ 6]  205 	inc	sp
   5279 21 02 00      [10]  206 	ld	hl,#0x0002
   527C E5            [11]  207 	push	hl
   527D FD E5         [15]  208 	push	iy
   527F CD F0 55      [17]  209 	call	_cpct_drawCharM0
   5282 F1            [10]  210 	pop	af
   5283 F1            [10]  211 	pop	af
   5284 33            [ 6]  212 	inc	sp
   5285 D1            [10]  213 	pop	de
   5286 21 E8 03      [10]  214 	ld	hl,#0x03E8
   5289 E5            [11]  215 	push	hl
   528A D5            [11]  216 	push	de
   528B CD BE 53      [17]  217 	call	__divuint
   528E F1            [10]  218 	pop	af
   528F F1            [10]  219 	pop	af
   5290 11 0A 00      [10]  220 	ld	de,#0x000A
   5293 D5            [11]  221 	push	de
   5294 E5            [11]  222 	push	hl
   5295 CD 8D 56      [17]  223 	call	__moduint
   5298 F1            [10]  224 	pop	af
   5299 F1            [10]  225 	pop	af
   529A C1            [10]  226 	pop	bc
   529B 7D            [ 4]  227 	ld	a,l
   529C C6 30         [ 7]  228 	add	a, #0x30
   529E 67            [ 4]  229 	ld	h,a
   529F 79            [ 4]  230 	ld	a,c
   52A0 C6 04         [ 7]  231 	add	a, #0x04
   52A2 5F            [ 4]  232 	ld	e,a
   52A3 78            [ 4]  233 	ld	a,b
   52A4 CE 00         [ 7]  234 	adc	a, #0x00
   52A6 57            [ 4]  235 	ld	d,a
   52A7 C5            [11]  236 	push	bc
   52A8 E5            [11]  237 	push	hl
   52A9 33            [ 6]  238 	inc	sp
   52AA 21 02 00      [10]  239 	ld	hl,#0x0002
   52AD E5            [11]  240 	push	hl
   52AE D5            [11]  241 	push	de
   52AF CD F0 55      [17]  242 	call	_cpct_drawCharM0
   52B2 F1            [10]  243 	pop	af
   52B3 33            [ 6]  244 	inc	sp
   52B4 21 64 00      [10]  245 	ld	hl,#0x0064
   52B7 E3            [19]  246 	ex	(sp),hl
   52B8 DD 6E 04      [19]  247 	ld	l,4 (ix)
   52BB DD 66 05      [19]  248 	ld	h,5 (ix)
   52BE E5            [11]  249 	push	hl
   52BF CD BE 53      [17]  250 	call	__divuint
   52C2 F1            [10]  251 	pop	af
   52C3 F1            [10]  252 	pop	af
   52C4 11 0A 00      [10]  253 	ld	de,#0x000A
   52C7 D5            [11]  254 	push	de
   52C8 E5            [11]  255 	push	hl
   52C9 CD 8D 56      [17]  256 	call	__moduint
   52CC F1            [10]  257 	pop	af
   52CD F1            [10]  258 	pop	af
   52CE C1            [10]  259 	pop	bc
   52CF 7D            [ 4]  260 	ld	a,l
   52D0 C6 30         [ 7]  261 	add	a, #0x30
   52D2 67            [ 4]  262 	ld	h,a
   52D3 79            [ 4]  263 	ld	a,c
   52D4 C6 08         [ 7]  264 	add	a, #0x08
   52D6 5F            [ 4]  265 	ld	e,a
   52D7 78            [ 4]  266 	ld	a,b
   52D8 CE 00         [ 7]  267 	adc	a, #0x00
   52DA 57            [ 4]  268 	ld	d,a
   52DB C5            [11]  269 	push	bc
   52DC E5            [11]  270 	push	hl
   52DD 33            [ 6]  271 	inc	sp
   52DE 21 02 00      [10]  272 	ld	hl,#0x0002
   52E1 E5            [11]  273 	push	hl
   52E2 D5            [11]  274 	push	de
   52E3 CD F0 55      [17]  275 	call	_cpct_drawCharM0
   52E6 F1            [10]  276 	pop	af
   52E7 33            [ 6]  277 	inc	sp
   52E8 21 0A 00      [10]  278 	ld	hl,#0x000A
   52EB E3            [19]  279 	ex	(sp),hl
   52EC DD 6E 04      [19]  280 	ld	l,4 (ix)
   52EF DD 66 05      [19]  281 	ld	h,5 (ix)
   52F2 E5            [11]  282 	push	hl
   52F3 CD BE 53      [17]  283 	call	__divuint
   52F6 F1            [10]  284 	pop	af
   52F7 F1            [10]  285 	pop	af
   52F8 11 0A 00      [10]  286 	ld	de,#0x000A
   52FB D5            [11]  287 	push	de
   52FC E5            [11]  288 	push	hl
   52FD CD 8D 56      [17]  289 	call	__moduint
   5300 F1            [10]  290 	pop	af
   5301 F1            [10]  291 	pop	af
   5302 C1            [10]  292 	pop	bc
   5303 7D            [ 4]  293 	ld	a,l
   5304 C6 30         [ 7]  294 	add	a, #0x30
   5306 67            [ 4]  295 	ld	h,a
   5307 79            [ 4]  296 	ld	a,c
   5308 C6 0C         [ 7]  297 	add	a, #0x0C
   530A 5F            [ 4]  298 	ld	e,a
   530B 78            [ 4]  299 	ld	a,b
   530C CE 00         [ 7]  300 	adc	a, #0x00
   530E 57            [ 4]  301 	ld	d,a
   530F C5            [11]  302 	push	bc
   5310 E5            [11]  303 	push	hl
   5311 33            [ 6]  304 	inc	sp
   5312 21 02 00      [10]  305 	ld	hl,#0x0002
   5315 E5            [11]  306 	push	hl
   5316 D5            [11]  307 	push	de
   5317 CD F0 55      [17]  308 	call	_cpct_drawCharM0
   531A F1            [10]  309 	pop	af
   531B F1            [10]  310 	pop	af
   531C 33            [ 6]  311 	inc	sp
   531D C1            [10]  312 	pop	bc
                            313 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   531E 21 10 00      [10]  314 	ld	hl,#0x0010
   5321 09            [11]  315 	add	hl,bc
   5322 4D            [ 4]  316 	ld	c,l
   5323 44            [ 4]  317 	ld	b,h
   5324 DD 7E FF      [19]  318 	ld	a,-1 (ix)
   5327 F5            [11]  319 	push	af
   5328 33            [ 6]  320 	inc	sp
   5329 21 02 00      [10]  321 	ld	hl,#0x0002
   532C E5            [11]  322 	push	hl
   532D C5            [11]  323 	push	bc
   532E CD F0 55      [17]  324 	call	_cpct_drawCharM0
   5331 F1            [10]  325 	pop	af
   5332 F1            [10]  326 	pop	af
   5333 33            [ 6]  327 	inc	sp
   5334 33            [ 6]  328 	inc	sp
   5335 DD E1         [14]  329 	pop	ix
   5337 C9            [10]  330 	ret
                            331 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            332 ;	---------------------------------
                            333 ; Function modificarVidas
                            334 ; ---------------------------------
   5338                     335 _modificarVidas::
   5338 DD E5         [15]  336 	push	ix
   533A DD 21 00 00   [14]  337 	ld	ix,#0
   533E DD 39         [15]  338 	add	ix,sp
                            339 ;src/score/score.c:45: borrarPantalla(60, 14, 20, 6);
   5340 21 14 06      [10]  340 	ld	hl,#0x0614
   5343 E5            [11]  341 	push	hl
   5344 21 3C 0E      [10]  342 	ld	hl,#0x0E3C
   5347 E5            [11]  343 	push	hl
   5348 CD 69 4D      [17]  344 	call	_borrarPantalla
   534B F1            [10]  345 	pop	af
   534C F1            [10]  346 	pop	af
                            347 ;src/score/score.c:47: for(i = 0; i<vidas; i++){
   534D 0E 00         [ 7]  348 	ld	c,#0x00
   534F                     349 00105$:
   534F 79            [ 4]  350 	ld	a,c
   5350 DD 96 04      [19]  351 	sub	a, 4 (ix)
   5353 30 43         [12]  352 	jr	NC,00107$
                            353 ;src/score/score.c:48: if(i%20 == 0){
   5355 C5            [11]  354 	push	bc
   5356 3E 14         [ 7]  355 	ld	a,#0x14
   5358 F5            [11]  356 	push	af
   5359 33            [ 6]  357 	inc	sp
   535A 79            [ 4]  358 	ld	a,c
   535B F5            [11]  359 	push	af
   535C 33            [ 6]  360 	inc	sp
   535D CD 81 56      [17]  361 	call	__moduchar
   5360 F1            [10]  362 	pop	af
   5361 C1            [10]  363 	pop	bc
   5362 7D            [ 4]  364 	ld	a,l
   5363 B7            [ 4]  365 	or	a, a
   5364 20 2F         [12]  366 	jr	NZ,00106$
                            367 ;src/score/score.c:49: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + (i/20)*4, 14); // dibuja 5 corazones
   5366 C5            [11]  368 	push	bc
   5367 3E 14         [ 7]  369 	ld	a,#0x14
   5369 F5            [11]  370 	push	af
   536A 33            [ 6]  371 	inc	sp
   536B 79            [ 4]  372 	ld	a,c
   536C F5            [11]  373 	push	af
   536D 33            [ 6]  374 	inc	sp
   536E CD C6 53      [17]  375 	call	__divuchar
   5371 F1            [10]  376 	pop	af
   5372 C1            [10]  377 	pop	bc
   5373 7D            [ 4]  378 	ld	a,l
   5374 87            [ 4]  379 	add	a, a
   5375 87            [ 4]  380 	add	a, a
   5376 C6 3C         [ 7]  381 	add	a, #0x3C
   5378 47            [ 4]  382 	ld	b,a
   5379 C5            [11]  383 	push	bc
   537A 3E 0E         [ 7]  384 	ld	a,#0x0E
   537C F5            [11]  385 	push	af
   537D 33            [ 6]  386 	inc	sp
   537E C5            [11]  387 	push	bc
   537F 33            [ 6]  388 	inc	sp
   5380 21 00 C0      [10]  389 	ld	hl,#0xC000
   5383 E5            [11]  390 	push	hl
   5384 CD 7F 60      [17]  391 	call	_cpct_getScreenPtr
   5387 EB            [ 4]  392 	ex	de,hl
   5388 21 03 06      [10]  393 	ld	hl,#0x0603
   538B E5            [11]  394 	push	hl
   538C D5            [11]  395 	push	de
   538D 21 28 3C      [10]  396 	ld	hl,#_g_heart
   5390 E5            [11]  397 	push	hl
   5391 CD BC 54      [17]  398 	call	_cpct_drawSprite
   5394 C1            [10]  399 	pop	bc
   5395                     400 00106$:
                            401 ;src/score/score.c:47: for(i = 0; i<vidas; i++){
   5395 0C            [ 4]  402 	inc	c
   5396 18 B7         [12]  403 	jr	00105$
   5398                     404 00107$:
   5398 DD E1         [14]  405 	pop	ix
   539A C9            [10]  406 	ret
                            407 ;src/score/score.c:55: u16 aumentarPuntuacion(u16 puntuacion){
                            408 ;	---------------------------------
                            409 ; Function aumentarPuntuacion
                            410 ; ---------------------------------
   539B                     411 _aumentarPuntuacion::
                            412 ;src/score/score.c:56: return puntuacion + 10;
   539B FD 21 02 00   [14]  413 	ld	iy,#2
   539F FD 39         [15]  414 	add	iy,sp
   53A1 FD 7E 00      [19]  415 	ld	a,0 (iy)
   53A4 C6 0A         [ 7]  416 	add	a, #0x0A
   53A6 6F            [ 4]  417 	ld	l, a
   53A7 FD 7E 01      [19]  418 	ld	a, 1 (iy)
   53AA CE 00         [ 7]  419 	adc	a, #0x00
   53AC 67            [ 4]  420 	ld	h, a
   53AD C9            [10]  421 	ret
                            422 	.area _CODE
                            423 	.area _INITIALIZER
                            424 	.area _CABS (ABS)
