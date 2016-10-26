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
   5140                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5140 21 00 02      [10]   58 	ld	hl,#0x0200
   5143 E5            [11]   59 	push	hl
   5144 26 C0         [ 7]   60 	ld	h, #0xC0
   5146 E5            [11]   61 	push	hl
   5147 CD 05 60      [17]   62 	call	_cpct_getScreenPtr
   514A 4D            [ 4]   63 	ld	c,l
   514B 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   514C 21 01 00      [10]   66 	ld	hl,#0x0001
   514F E5            [11]   67 	push	hl
   5150 C5            [11]   68 	push	bc
   5151 21 CA 51      [10]   69 	ld	hl,#___str_0
   5154 E5            [11]   70 	push	hl
   5155 CD 1E 54      [17]   71 	call	_cpct_drawStringM0
   5158 21 06 00      [10]   72 	ld	hl,#6
   515B 39            [11]   73 	add	hl,sp
   515C F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   515D 21 00 0E      [10]   76 	ld	hl,#0x0E00
   5160 E5            [11]   77 	push	hl
   5161 26 C0         [ 7]   78 	ld	h, #0xC0
   5163 E5            [11]   79 	push	hl
   5164 CD 05 60      [17]   80 	call	_cpct_getScreenPtr
   5167 4D            [ 4]   81 	ld	c,l
   5168 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5169 21 0F 00      [10]   84 	ld	hl,#0x000F
   516C E5            [11]   85 	push	hl
   516D C5            [11]   86 	push	bc
   516E 21 D0 51      [10]   87 	ld	hl,#___str_1
   5171 E5            [11]   88 	push	hl
   5172 CD 1E 54      [17]   89 	call	_cpct_drawStringM0
   5175 21 06 00      [10]   90 	ld	hl,#6
   5178 39            [11]   91 	add	hl,sp
   5179 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   517A 21 3C 02      [10]   94 	ld	hl,#0x023C
   517D E5            [11]   95 	push	hl
   517E 21 00 C0      [10]   96 	ld	hl,#0xC000
   5181 E5            [11]   97 	push	hl
   5182 CD 05 60      [17]   98 	call	_cpct_getScreenPtr
   5185 4D            [ 4]   99 	ld	c,l
   5186 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5187 21 01 00      [10]  102 	ld	hl,#0x0001
   518A E5            [11]  103 	push	hl
   518B C5            [11]  104 	push	bc
   518C 21 D6 51      [10]  105 	ld	hl,#___str_2
   518F E5            [11]  106 	push	hl
   5190 CD 1E 54      [17]  107 	call	_cpct_drawStringM0
   5193 21 06 00      [10]  108 	ld	hl,#6
   5196 39            [11]  109 	add	hl,sp
   5197 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5198 01 00 00      [10]  112 	ld	bc,#0x0000
   519B                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   519B 79            [ 4]  115 	ld	a,c
   519C 87            [ 4]  116 	add	a, a
   519D 87            [ 4]  117 	add	a, a
   519E C6 3C         [ 7]  118 	add	a, #0x3C
   51A0 57            [ 4]  119 	ld	d,a
   51A1 C5            [11]  120 	push	bc
   51A2 3E 0E         [ 7]  121 	ld	a,#0x0E
   51A4 F5            [11]  122 	push	af
   51A5 33            [ 6]  123 	inc	sp
   51A6 D5            [11]  124 	push	de
   51A7 33            [ 6]  125 	inc	sp
   51A8 21 00 C0      [10]  126 	ld	hl,#0xC000
   51AB E5            [11]  127 	push	hl
   51AC CD 05 60      [17]  128 	call	_cpct_getScreenPtr
   51AF EB            [ 4]  129 	ex	de,hl
   51B0 21 03 06      [10]  130 	ld	hl,#0x0603
   51B3 E5            [11]  131 	push	hl
   51B4 D5            [11]  132 	push	de
   51B5 21 28 3C      [10]  133 	ld	hl,#_g_heart
   51B8 E5            [11]  134 	push	hl
   51B9 CD 42 54      [17]  135 	call	_cpct_drawSprite
   51BC C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   51BD 03            [ 6]  138 	inc	bc
   51BE 79            [ 4]  139 	ld	a,c
   51BF D6 05         [ 7]  140 	sub	a, #0x05
   51C1 78            [ 4]  141 	ld	a,b
   51C2 17            [ 4]  142 	rla
   51C3 3F            [ 4]  143 	ccf
   51C4 1F            [ 4]  144 	rra
   51C5 DE 80         [ 7]  145 	sbc	a, #0x80
   51C7 38 D2         [12]  146 	jr	C,00102$
   51C9 C9            [10]  147 	ret
   51CA                     148 ___str_0:
   51CA 53 43 4F 52 45      149 	.ascii "SCORE"
   51CF 00                  150 	.db 0x00
   51D0                     151 ___str_1:
   51D0 30 30 30 30 30      152 	.ascii "00000"
   51D5 00                  153 	.db 0x00
   51D6                     154 ___str_2:
   51D6 4C 49 56 45 53      155 	.ascii "LIVES"
   51DB 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   51DC                     161 _modificarPuntuacion::
   51DC DD E5         [15]  162 	push	ix
   51DE DD 21 00 00   [14]  163 	ld	ix,#0
   51E2 DD 39         [15]  164 	add	ix,sp
   51E4 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   51E5 DD 5E 04      [19]  167 	ld	e,4 (ix)
   51E8 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   51EB D5            [11]  170 	push	de
   51EC 21 19 07      [10]  171 	ld	hl,#0x0719
   51EF E5            [11]  172 	push	hl
   51F0 21 00 0E      [10]  173 	ld	hl,#0x0E00
   51F3 E5            [11]  174 	push	hl
   51F4 CD 14 4D      [17]  175 	call	_borrarPantalla
   51F7 F1            [10]  176 	pop	af
   51F8 F1            [10]  177 	pop	af
   51F9 21 00 0E      [10]  178 	ld	hl,#0x0E00
   51FC E5            [11]  179 	push	hl
   51FD 26 C0         [ 7]  180 	ld	h, #0xC0
   51FF E5            [11]  181 	push	hl
   5200 CD 05 60      [17]  182 	call	_cpct_getScreenPtr
   5203 4D            [ 4]  183 	ld	c,l
   5204 44            [ 4]  184 	ld	b,h
   5205 D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   5206 C5            [11]  187 	push	bc
   5207 D5            [11]  188 	push	de
   5208 21 0A 00      [10]  189 	ld	hl,#0x000A
   520B E5            [11]  190 	push	hl
   520C D5            [11]  191 	push	de
   520D CD FA 5F      [17]  192 	call	__moduint
   5210 F1            [10]  193 	pop	af
   5211 F1            [10]  194 	pop	af
   5212 D1            [10]  195 	pop	de
   5213 C1            [10]  196 	pop	bc
   5214 7D            [ 4]  197 	ld	a,l
   5215 C6 30         [ 7]  198 	add	a, #0x30
   5217 DD 77 FF      [19]  199 	ld	-1 (ix),a
   521A C5            [11]  200 	push	bc
   521B FD E1         [14]  201 	pop	iy
   521D C5            [11]  202 	push	bc
   521E D5            [11]  203 	push	de
   521F DD 7E FF      [19]  204 	ld	a,-1 (ix)
   5222 F5            [11]  205 	push	af
   5223 33            [ 6]  206 	inc	sp
   5224 21 02 00      [10]  207 	ld	hl,#0x0002
   5227 E5            [11]  208 	push	hl
   5228 FD E5         [15]  209 	push	iy
   522A CD 76 55      [17]  210 	call	_cpct_drawCharM0
   522D F1            [10]  211 	pop	af
   522E F1            [10]  212 	pop	af
   522F 33            [ 6]  213 	inc	sp
   5230 D1            [10]  214 	pop	de
   5231 21 E8 03      [10]  215 	ld	hl,#0x03E8
   5234 E5            [11]  216 	push	hl
   5235 D5            [11]  217 	push	de
   5236 CD 44 53      [17]  218 	call	__divuint
   5239 F1            [10]  219 	pop	af
   523A F1            [10]  220 	pop	af
   523B 11 0A 00      [10]  221 	ld	de,#0x000A
   523E D5            [11]  222 	push	de
   523F E5            [11]  223 	push	hl
   5240 CD FA 5F      [17]  224 	call	__moduint
   5243 F1            [10]  225 	pop	af
   5244 F1            [10]  226 	pop	af
   5245 C1            [10]  227 	pop	bc
   5246 7D            [ 4]  228 	ld	a,l
   5247 C6 30         [ 7]  229 	add	a, #0x30
   5249 67            [ 4]  230 	ld	h,a
   524A 79            [ 4]  231 	ld	a,c
   524B C6 04         [ 7]  232 	add	a, #0x04
   524D 5F            [ 4]  233 	ld	e,a
   524E 78            [ 4]  234 	ld	a,b
   524F CE 00         [ 7]  235 	adc	a, #0x00
   5251 57            [ 4]  236 	ld	d,a
   5252 C5            [11]  237 	push	bc
   5253 E5            [11]  238 	push	hl
   5254 33            [ 6]  239 	inc	sp
   5255 21 02 00      [10]  240 	ld	hl,#0x0002
   5258 E5            [11]  241 	push	hl
   5259 D5            [11]  242 	push	de
   525A CD 76 55      [17]  243 	call	_cpct_drawCharM0
   525D F1            [10]  244 	pop	af
   525E 33            [ 6]  245 	inc	sp
   525F 21 64 00      [10]  246 	ld	hl,#0x0064
   5262 E3            [19]  247 	ex	(sp),hl
   5263 DD 6E 04      [19]  248 	ld	l,4 (ix)
   5266 DD 66 05      [19]  249 	ld	h,5 (ix)
   5269 E5            [11]  250 	push	hl
   526A CD 44 53      [17]  251 	call	__divuint
   526D F1            [10]  252 	pop	af
   526E F1            [10]  253 	pop	af
   526F 11 0A 00      [10]  254 	ld	de,#0x000A
   5272 D5            [11]  255 	push	de
   5273 E5            [11]  256 	push	hl
   5274 CD FA 5F      [17]  257 	call	__moduint
   5277 F1            [10]  258 	pop	af
   5278 F1            [10]  259 	pop	af
   5279 C1            [10]  260 	pop	bc
   527A 7D            [ 4]  261 	ld	a,l
   527B C6 30         [ 7]  262 	add	a, #0x30
   527D 67            [ 4]  263 	ld	h,a
   527E 79            [ 4]  264 	ld	a,c
   527F C6 08         [ 7]  265 	add	a, #0x08
   5281 5F            [ 4]  266 	ld	e,a
   5282 78            [ 4]  267 	ld	a,b
   5283 CE 00         [ 7]  268 	adc	a, #0x00
   5285 57            [ 4]  269 	ld	d,a
   5286 C5            [11]  270 	push	bc
   5287 E5            [11]  271 	push	hl
   5288 33            [ 6]  272 	inc	sp
   5289 21 02 00      [10]  273 	ld	hl,#0x0002
   528C E5            [11]  274 	push	hl
   528D D5            [11]  275 	push	de
   528E CD 76 55      [17]  276 	call	_cpct_drawCharM0
   5291 F1            [10]  277 	pop	af
   5292 33            [ 6]  278 	inc	sp
   5293 21 0A 00      [10]  279 	ld	hl,#0x000A
   5296 E3            [19]  280 	ex	(sp),hl
   5297 DD 6E 04      [19]  281 	ld	l,4 (ix)
   529A DD 66 05      [19]  282 	ld	h,5 (ix)
   529D E5            [11]  283 	push	hl
   529E CD 44 53      [17]  284 	call	__divuint
   52A1 F1            [10]  285 	pop	af
   52A2 F1            [10]  286 	pop	af
   52A3 11 0A 00      [10]  287 	ld	de,#0x000A
   52A6 D5            [11]  288 	push	de
   52A7 E5            [11]  289 	push	hl
   52A8 CD FA 5F      [17]  290 	call	__moduint
   52AB F1            [10]  291 	pop	af
   52AC F1            [10]  292 	pop	af
   52AD C1            [10]  293 	pop	bc
   52AE 7D            [ 4]  294 	ld	a,l
   52AF C6 30         [ 7]  295 	add	a, #0x30
   52B1 67            [ 4]  296 	ld	h,a
   52B2 79            [ 4]  297 	ld	a,c
   52B3 C6 0C         [ 7]  298 	add	a, #0x0C
   52B5 5F            [ 4]  299 	ld	e,a
   52B6 78            [ 4]  300 	ld	a,b
   52B7 CE 00         [ 7]  301 	adc	a, #0x00
   52B9 57            [ 4]  302 	ld	d,a
   52BA C5            [11]  303 	push	bc
   52BB E5            [11]  304 	push	hl
   52BC 33            [ 6]  305 	inc	sp
   52BD 21 02 00      [10]  306 	ld	hl,#0x0002
   52C0 E5            [11]  307 	push	hl
   52C1 D5            [11]  308 	push	de
   52C2 CD 76 55      [17]  309 	call	_cpct_drawCharM0
   52C5 F1            [10]  310 	pop	af
   52C6 F1            [10]  311 	pop	af
   52C7 33            [ 6]  312 	inc	sp
   52C8 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   52C9 21 10 00      [10]  315 	ld	hl,#0x0010
   52CC 09            [11]  316 	add	hl,bc
   52CD 4D            [ 4]  317 	ld	c,l
   52CE 44            [ 4]  318 	ld	b,h
   52CF DD 7E FF      [19]  319 	ld	a,-1 (ix)
   52D2 F5            [11]  320 	push	af
   52D3 33            [ 6]  321 	inc	sp
   52D4 21 02 00      [10]  322 	ld	hl,#0x0002
   52D7 E5            [11]  323 	push	hl
   52D8 C5            [11]  324 	push	bc
   52D9 CD 76 55      [17]  325 	call	_cpct_drawCharM0
   52DC F1            [10]  326 	pop	af
   52DD F1            [10]  327 	pop	af
   52DE 33            [ 6]  328 	inc	sp
   52DF 33            [ 6]  329 	inc	sp
   52E0 DD E1         [14]  330 	pop	ix
   52E2 C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   52E3                     336 _modificarVidas::
   52E3 DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   52E5 01 00 00      [10]  339 	ld	bc,#0x0000
   52E8                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   52E8 79            [ 4]  342 	ld	a,c
   52E9 87            [ 4]  343 	add	a, a
   52EA 87            [ 4]  344 	add	a, a
   52EB C6 3C         [ 7]  345 	add	a, #0x3C
   52ED 57            [ 4]  346 	ld	d,a
   52EE C5            [11]  347 	push	bc
   52EF 3E 0E         [ 7]  348 	ld	a,#0x0E
   52F1 F5            [11]  349 	push	af
   52F2 33            [ 6]  350 	inc	sp
   52F3 D5            [11]  351 	push	de
   52F4 33            [ 6]  352 	inc	sp
   52F5 21 00 C0      [10]  353 	ld	hl,#0xC000
   52F8 E5            [11]  354 	push	hl
   52F9 CD 05 60      [17]  355 	call	_cpct_getScreenPtr
   52FC EB            [ 4]  356 	ex	de,hl
   52FD 21 03 06      [10]  357 	ld	hl,#0x0603
   5300 E5            [11]  358 	push	hl
   5301 D5            [11]  359 	push	de
   5302 21 28 3C      [10]  360 	ld	hl,#_g_heart
   5305 E5            [11]  361 	push	hl
   5306 CD 42 54      [17]  362 	call	_cpct_drawSprite
   5309 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   530A 03            [ 6]  365 	inc	bc
   530B 79            [ 4]  366 	ld	a,c
   530C D6 05         [ 7]  367 	sub	a, #0x05
   530E 78            [ 4]  368 	ld	a,b
   530F 17            [ 4]  369 	rla
   5310 3F            [ 4]  370 	ccf
   5311 1F            [ 4]  371 	rra
   5312 DE 80         [ 7]  372 	sbc	a, #0x80
   5314 38 D2         [12]  373 	jr	C,00102$
   5316 DD E1         [14]  374 	pop	ix
   5318 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   5319                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   5319 FD 21 02 00   [14]  382 	ld	iy,#2
   531D FD 39         [15]  383 	add	iy,sp
   531F FD 7E 00      [19]  384 	ld	a,0 (iy)
   5322 C6 0A         [ 7]  385 	add	a, #0x0A
   5324 6F            [ 4]  386 	ld	l, a
   5325 FD 7E 01      [19]  387 	ld	a, 1 (iy)
   5328 CE 00         [ 7]  388 	adc	a, #0x00
   532A 67            [ 4]  389 	ld	h, a
   532B C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   532C                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   532C 21 02 00      [10]  397 	ld	hl, #2+0
   532F 39            [11]  398 	add	hl, sp
   5330 4E            [ 7]  399 	ld	c, (hl)
   5331 0D            [ 4]  400 	dec	c
   5332 69            [ 4]  401 	ld	l,c
   5333 C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
