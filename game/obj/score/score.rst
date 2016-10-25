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
   50E8                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   50E8 21 00 02      [10]   58 	ld	hl,#0x0200
   50EB E5            [11]   59 	push	hl
   50EC 26 C0         [ 7]   60 	ld	h, #0xC0
   50EE E5            [11]   61 	push	hl
   50EF CD AD 5F      [17]   62 	call	_cpct_getScreenPtr
   50F2 4D            [ 4]   63 	ld	c,l
   50F3 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   50F4 21 01 00      [10]   66 	ld	hl,#0x0001
   50F7 E5            [11]   67 	push	hl
   50F8 C5            [11]   68 	push	bc
   50F9 21 72 51      [10]   69 	ld	hl,#___str_0
   50FC E5            [11]   70 	push	hl
   50FD CD C6 53      [17]   71 	call	_cpct_drawStringM0
   5100 21 06 00      [10]   72 	ld	hl,#6
   5103 39            [11]   73 	add	hl,sp
   5104 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   5105 21 00 0E      [10]   76 	ld	hl,#0x0E00
   5108 E5            [11]   77 	push	hl
   5109 26 C0         [ 7]   78 	ld	h, #0xC0
   510B E5            [11]   79 	push	hl
   510C CD AD 5F      [17]   80 	call	_cpct_getScreenPtr
   510F 4D            [ 4]   81 	ld	c,l
   5110 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5111 21 0F 00      [10]   84 	ld	hl,#0x000F
   5114 E5            [11]   85 	push	hl
   5115 C5            [11]   86 	push	bc
   5116 21 78 51      [10]   87 	ld	hl,#___str_1
   5119 E5            [11]   88 	push	hl
   511A CD C6 53      [17]   89 	call	_cpct_drawStringM0
   511D 21 06 00      [10]   90 	ld	hl,#6
   5120 39            [11]   91 	add	hl,sp
   5121 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   5122 21 3C 02      [10]   94 	ld	hl,#0x023C
   5125 E5            [11]   95 	push	hl
   5126 21 00 C0      [10]   96 	ld	hl,#0xC000
   5129 E5            [11]   97 	push	hl
   512A CD AD 5F      [17]   98 	call	_cpct_getScreenPtr
   512D 4D            [ 4]   99 	ld	c,l
   512E 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   512F 21 01 00      [10]  102 	ld	hl,#0x0001
   5132 E5            [11]  103 	push	hl
   5133 C5            [11]  104 	push	bc
   5134 21 7E 51      [10]  105 	ld	hl,#___str_2
   5137 E5            [11]  106 	push	hl
   5138 CD C6 53      [17]  107 	call	_cpct_drawStringM0
   513B 21 06 00      [10]  108 	ld	hl,#6
   513E 39            [11]  109 	add	hl,sp
   513F F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5140 01 00 00      [10]  112 	ld	bc,#0x0000
   5143                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5143 79            [ 4]  115 	ld	a,c
   5144 87            [ 4]  116 	add	a, a
   5145 87            [ 4]  117 	add	a, a
   5146 C6 3C         [ 7]  118 	add	a, #0x3C
   5148 57            [ 4]  119 	ld	d,a
   5149 C5            [11]  120 	push	bc
   514A 3E 0E         [ 7]  121 	ld	a,#0x0E
   514C F5            [11]  122 	push	af
   514D 33            [ 6]  123 	inc	sp
   514E D5            [11]  124 	push	de
   514F 33            [ 6]  125 	inc	sp
   5150 21 00 C0      [10]  126 	ld	hl,#0xC000
   5153 E5            [11]  127 	push	hl
   5154 CD AD 5F      [17]  128 	call	_cpct_getScreenPtr
   5157 EB            [ 4]  129 	ex	de,hl
   5158 21 03 06      [10]  130 	ld	hl,#0x0603
   515B E5            [11]  131 	push	hl
   515C D5            [11]  132 	push	de
   515D 21 28 3C      [10]  133 	ld	hl,#_g_heart
   5160 E5            [11]  134 	push	hl
   5161 CD EA 53      [17]  135 	call	_cpct_drawSprite
   5164 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   5165 03            [ 6]  138 	inc	bc
   5166 79            [ 4]  139 	ld	a,c
   5167 D6 05         [ 7]  140 	sub	a, #0x05
   5169 78            [ 4]  141 	ld	a,b
   516A 17            [ 4]  142 	rla
   516B 3F            [ 4]  143 	ccf
   516C 1F            [ 4]  144 	rra
   516D DE 80         [ 7]  145 	sbc	a, #0x80
   516F 38 D2         [12]  146 	jr	C,00102$
   5171 C9            [10]  147 	ret
   5172                     148 ___str_0:
   5172 53 43 4F 52 45      149 	.ascii "SCORE"
   5177 00                  150 	.db 0x00
   5178                     151 ___str_1:
   5178 30 30 30 30 30      152 	.ascii "00000"
   517D 00                  153 	.db 0x00
   517E                     154 ___str_2:
   517E 4C 49 56 45 53      155 	.ascii "LIVES"
   5183 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   5184                     161 _modificarPuntuacion::
   5184 DD E5         [15]  162 	push	ix
   5186 DD 21 00 00   [14]  163 	ld	ix,#0
   518A DD 39         [15]  164 	add	ix,sp
   518C 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   518D DD 5E 04      [19]  167 	ld	e,4 (ix)
   5190 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5193 D5            [11]  170 	push	de
   5194 21 19 07      [10]  171 	ld	hl,#0x0719
   5197 E5            [11]  172 	push	hl
   5198 21 00 0E      [10]  173 	ld	hl,#0x0E00
   519B E5            [11]  174 	push	hl
   519C CD BC 4C      [17]  175 	call	_borrarPantalla
   519F F1            [10]  176 	pop	af
   51A0 F1            [10]  177 	pop	af
   51A1 21 00 0E      [10]  178 	ld	hl,#0x0E00
   51A4 E5            [11]  179 	push	hl
   51A5 26 C0         [ 7]  180 	ld	h, #0xC0
   51A7 E5            [11]  181 	push	hl
   51A8 CD AD 5F      [17]  182 	call	_cpct_getScreenPtr
   51AB 4D            [ 4]  183 	ld	c,l
   51AC 44            [ 4]  184 	ld	b,h
   51AD D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   51AE C5            [11]  187 	push	bc
   51AF D5            [11]  188 	push	de
   51B0 21 0A 00      [10]  189 	ld	hl,#0x000A
   51B3 E5            [11]  190 	push	hl
   51B4 D5            [11]  191 	push	de
   51B5 CD A2 5F      [17]  192 	call	__moduint
   51B8 F1            [10]  193 	pop	af
   51B9 F1            [10]  194 	pop	af
   51BA D1            [10]  195 	pop	de
   51BB C1            [10]  196 	pop	bc
   51BC 7D            [ 4]  197 	ld	a,l
   51BD C6 30         [ 7]  198 	add	a, #0x30
   51BF DD 77 FF      [19]  199 	ld	-1 (ix),a
   51C2 C5            [11]  200 	push	bc
   51C3 FD E1         [14]  201 	pop	iy
   51C5 C5            [11]  202 	push	bc
   51C6 D5            [11]  203 	push	de
   51C7 DD 7E FF      [19]  204 	ld	a,-1 (ix)
   51CA F5            [11]  205 	push	af
   51CB 33            [ 6]  206 	inc	sp
   51CC 21 02 00      [10]  207 	ld	hl,#0x0002
   51CF E5            [11]  208 	push	hl
   51D0 FD E5         [15]  209 	push	iy
   51D2 CD 1E 55      [17]  210 	call	_cpct_drawCharM0
   51D5 F1            [10]  211 	pop	af
   51D6 F1            [10]  212 	pop	af
   51D7 33            [ 6]  213 	inc	sp
   51D8 D1            [10]  214 	pop	de
   51D9 21 E8 03      [10]  215 	ld	hl,#0x03E8
   51DC E5            [11]  216 	push	hl
   51DD D5            [11]  217 	push	de
   51DE CD EC 52      [17]  218 	call	__divuint
   51E1 F1            [10]  219 	pop	af
   51E2 F1            [10]  220 	pop	af
   51E3 11 0A 00      [10]  221 	ld	de,#0x000A
   51E6 D5            [11]  222 	push	de
   51E7 E5            [11]  223 	push	hl
   51E8 CD A2 5F      [17]  224 	call	__moduint
   51EB F1            [10]  225 	pop	af
   51EC F1            [10]  226 	pop	af
   51ED C1            [10]  227 	pop	bc
   51EE 7D            [ 4]  228 	ld	a,l
   51EF C6 30         [ 7]  229 	add	a, #0x30
   51F1 67            [ 4]  230 	ld	h,a
   51F2 79            [ 4]  231 	ld	a,c
   51F3 C6 04         [ 7]  232 	add	a, #0x04
   51F5 5F            [ 4]  233 	ld	e,a
   51F6 78            [ 4]  234 	ld	a,b
   51F7 CE 00         [ 7]  235 	adc	a, #0x00
   51F9 57            [ 4]  236 	ld	d,a
   51FA C5            [11]  237 	push	bc
   51FB E5            [11]  238 	push	hl
   51FC 33            [ 6]  239 	inc	sp
   51FD 21 02 00      [10]  240 	ld	hl,#0x0002
   5200 E5            [11]  241 	push	hl
   5201 D5            [11]  242 	push	de
   5202 CD 1E 55      [17]  243 	call	_cpct_drawCharM0
   5205 F1            [10]  244 	pop	af
   5206 33            [ 6]  245 	inc	sp
   5207 21 64 00      [10]  246 	ld	hl,#0x0064
   520A E3            [19]  247 	ex	(sp),hl
   520B DD 6E 04      [19]  248 	ld	l,4 (ix)
   520E DD 66 05      [19]  249 	ld	h,5 (ix)
   5211 E5            [11]  250 	push	hl
   5212 CD EC 52      [17]  251 	call	__divuint
   5215 F1            [10]  252 	pop	af
   5216 F1            [10]  253 	pop	af
   5217 11 0A 00      [10]  254 	ld	de,#0x000A
   521A D5            [11]  255 	push	de
   521B E5            [11]  256 	push	hl
   521C CD A2 5F      [17]  257 	call	__moduint
   521F F1            [10]  258 	pop	af
   5220 F1            [10]  259 	pop	af
   5221 C1            [10]  260 	pop	bc
   5222 7D            [ 4]  261 	ld	a,l
   5223 C6 30         [ 7]  262 	add	a, #0x30
   5225 67            [ 4]  263 	ld	h,a
   5226 79            [ 4]  264 	ld	a,c
   5227 C6 08         [ 7]  265 	add	a, #0x08
   5229 5F            [ 4]  266 	ld	e,a
   522A 78            [ 4]  267 	ld	a,b
   522B CE 00         [ 7]  268 	adc	a, #0x00
   522D 57            [ 4]  269 	ld	d,a
   522E C5            [11]  270 	push	bc
   522F E5            [11]  271 	push	hl
   5230 33            [ 6]  272 	inc	sp
   5231 21 02 00      [10]  273 	ld	hl,#0x0002
   5234 E5            [11]  274 	push	hl
   5235 D5            [11]  275 	push	de
   5236 CD 1E 55      [17]  276 	call	_cpct_drawCharM0
   5239 F1            [10]  277 	pop	af
   523A 33            [ 6]  278 	inc	sp
   523B 21 0A 00      [10]  279 	ld	hl,#0x000A
   523E E3            [19]  280 	ex	(sp),hl
   523F DD 6E 04      [19]  281 	ld	l,4 (ix)
   5242 DD 66 05      [19]  282 	ld	h,5 (ix)
   5245 E5            [11]  283 	push	hl
   5246 CD EC 52      [17]  284 	call	__divuint
   5249 F1            [10]  285 	pop	af
   524A F1            [10]  286 	pop	af
   524B 11 0A 00      [10]  287 	ld	de,#0x000A
   524E D5            [11]  288 	push	de
   524F E5            [11]  289 	push	hl
   5250 CD A2 5F      [17]  290 	call	__moduint
   5253 F1            [10]  291 	pop	af
   5254 F1            [10]  292 	pop	af
   5255 C1            [10]  293 	pop	bc
   5256 7D            [ 4]  294 	ld	a,l
   5257 C6 30         [ 7]  295 	add	a, #0x30
   5259 67            [ 4]  296 	ld	h,a
   525A 79            [ 4]  297 	ld	a,c
   525B C6 0C         [ 7]  298 	add	a, #0x0C
   525D 5F            [ 4]  299 	ld	e,a
   525E 78            [ 4]  300 	ld	a,b
   525F CE 00         [ 7]  301 	adc	a, #0x00
   5261 57            [ 4]  302 	ld	d,a
   5262 C5            [11]  303 	push	bc
   5263 E5            [11]  304 	push	hl
   5264 33            [ 6]  305 	inc	sp
   5265 21 02 00      [10]  306 	ld	hl,#0x0002
   5268 E5            [11]  307 	push	hl
   5269 D5            [11]  308 	push	de
   526A CD 1E 55      [17]  309 	call	_cpct_drawCharM0
   526D F1            [10]  310 	pop	af
   526E F1            [10]  311 	pop	af
   526F 33            [ 6]  312 	inc	sp
   5270 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5271 21 10 00      [10]  315 	ld	hl,#0x0010
   5274 09            [11]  316 	add	hl,bc
   5275 4D            [ 4]  317 	ld	c,l
   5276 44            [ 4]  318 	ld	b,h
   5277 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   527A F5            [11]  320 	push	af
   527B 33            [ 6]  321 	inc	sp
   527C 21 02 00      [10]  322 	ld	hl,#0x0002
   527F E5            [11]  323 	push	hl
   5280 C5            [11]  324 	push	bc
   5281 CD 1E 55      [17]  325 	call	_cpct_drawCharM0
   5284 F1            [10]  326 	pop	af
   5285 F1            [10]  327 	pop	af
   5286 33            [ 6]  328 	inc	sp
   5287 33            [ 6]  329 	inc	sp
   5288 DD E1         [14]  330 	pop	ix
   528A C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   528B                     336 _modificarVidas::
   528B DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   528D 01 00 00      [10]  339 	ld	bc,#0x0000
   5290                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5290 79            [ 4]  342 	ld	a,c
   5291 87            [ 4]  343 	add	a, a
   5292 87            [ 4]  344 	add	a, a
   5293 C6 3C         [ 7]  345 	add	a, #0x3C
   5295 57            [ 4]  346 	ld	d,a
   5296 C5            [11]  347 	push	bc
   5297 3E 0E         [ 7]  348 	ld	a,#0x0E
   5299 F5            [11]  349 	push	af
   529A 33            [ 6]  350 	inc	sp
   529B D5            [11]  351 	push	de
   529C 33            [ 6]  352 	inc	sp
   529D 21 00 C0      [10]  353 	ld	hl,#0xC000
   52A0 E5            [11]  354 	push	hl
   52A1 CD AD 5F      [17]  355 	call	_cpct_getScreenPtr
   52A4 EB            [ 4]  356 	ex	de,hl
   52A5 21 03 06      [10]  357 	ld	hl,#0x0603
   52A8 E5            [11]  358 	push	hl
   52A9 D5            [11]  359 	push	de
   52AA 21 28 3C      [10]  360 	ld	hl,#_g_heart
   52AD E5            [11]  361 	push	hl
   52AE CD EA 53      [17]  362 	call	_cpct_drawSprite
   52B1 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   52B2 03            [ 6]  365 	inc	bc
   52B3 79            [ 4]  366 	ld	a,c
   52B4 D6 05         [ 7]  367 	sub	a, #0x05
   52B6 78            [ 4]  368 	ld	a,b
   52B7 17            [ 4]  369 	rla
   52B8 3F            [ 4]  370 	ccf
   52B9 1F            [ 4]  371 	rra
   52BA DE 80         [ 7]  372 	sbc	a, #0x80
   52BC 38 D2         [12]  373 	jr	C,00102$
   52BE DD E1         [14]  374 	pop	ix
   52C0 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   52C1                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   52C1 FD 21 02 00   [14]  382 	ld	iy,#2
   52C5 FD 39         [15]  383 	add	iy,sp
   52C7 FD 7E 00      [19]  384 	ld	a,0 (iy)
   52CA C6 0A         [ 7]  385 	add	a, #0x0A
   52CC 6F            [ 4]  386 	ld	l, a
   52CD FD 7E 01      [19]  387 	ld	a, 1 (iy)
   52D0 CE 00         [ 7]  388 	adc	a, #0x00
   52D2 67            [ 4]  389 	ld	h, a
   52D3 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   52D4                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   52D4 21 02 00      [10]  397 	ld	hl, #2+0
   52D7 39            [11]  398 	add	hl, sp
   52D8 4E            [ 7]  399 	ld	c, (hl)
   52D9 0D            [ 4]  400 	dec	c
   52DA 69            [ 4]  401 	ld	l,c
   52DB C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
