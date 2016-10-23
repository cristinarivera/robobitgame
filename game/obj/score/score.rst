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
   81AA                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   81AA 21 00 02      [10]   58 	ld	hl,#0x0200
   81AD E5            [11]   59 	push	hl
   81AE 26 C0         [ 7]   60 	ld	h, #0xC0
   81B0 E5            [11]   61 	push	hl
   81B1 CD 6F 90      [17]   62 	call	_cpct_getScreenPtr
   81B4 4D            [ 4]   63 	ld	c,l
   81B5 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   81B6 21 01 00      [10]   66 	ld	hl,#0x0001
   81B9 E5            [11]   67 	push	hl
   81BA C5            [11]   68 	push	bc
   81BB 21 34 82      [10]   69 	ld	hl,#___str_0
   81BE E5            [11]   70 	push	hl
   81BF CD 88 84      [17]   71 	call	_cpct_drawStringM0
   81C2 21 06 00      [10]   72 	ld	hl,#6
   81C5 39            [11]   73 	add	hl,sp
   81C6 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   81C7 21 00 0E      [10]   76 	ld	hl,#0x0E00
   81CA E5            [11]   77 	push	hl
   81CB 26 C0         [ 7]   78 	ld	h, #0xC0
   81CD E5            [11]   79 	push	hl
   81CE CD 6F 90      [17]   80 	call	_cpct_getScreenPtr
   81D1 4D            [ 4]   81 	ld	c,l
   81D2 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   81D3 21 0F 00      [10]   84 	ld	hl,#0x000F
   81D6 E5            [11]   85 	push	hl
   81D7 C5            [11]   86 	push	bc
   81D8 21 3A 82      [10]   87 	ld	hl,#___str_1
   81DB E5            [11]   88 	push	hl
   81DC CD 88 84      [17]   89 	call	_cpct_drawStringM0
   81DF 21 06 00      [10]   90 	ld	hl,#6
   81E2 39            [11]   91 	add	hl,sp
   81E3 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   81E4 21 3C 02      [10]   94 	ld	hl,#0x023C
   81E7 E5            [11]   95 	push	hl
   81E8 21 00 C0      [10]   96 	ld	hl,#0xC000
   81EB E5            [11]   97 	push	hl
   81EC CD 6F 90      [17]   98 	call	_cpct_getScreenPtr
   81EF 4D            [ 4]   99 	ld	c,l
   81F0 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   81F1 21 01 00      [10]  102 	ld	hl,#0x0001
   81F4 E5            [11]  103 	push	hl
   81F5 C5            [11]  104 	push	bc
   81F6 21 40 82      [10]  105 	ld	hl,#___str_2
   81F9 E5            [11]  106 	push	hl
   81FA CD 88 84      [17]  107 	call	_cpct_drawStringM0
   81FD 21 06 00      [10]  108 	ld	hl,#6
   8200 39            [11]  109 	add	hl,sp
   8201 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   8202 01 00 00      [10]  112 	ld	bc,#0x0000
   8205                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   8205 79            [ 4]  115 	ld	a,c
   8206 87            [ 4]  116 	add	a, a
   8207 87            [ 4]  117 	add	a, a
   8208 C6 3C         [ 7]  118 	add	a, #0x3C
   820A 57            [ 4]  119 	ld	d,a
   820B C5            [11]  120 	push	bc
   820C 3E 0E         [ 7]  121 	ld	a,#0x0E
   820E F5            [11]  122 	push	af
   820F 33            [ 6]  123 	inc	sp
   8210 D5            [11]  124 	push	de
   8211 33            [ 6]  125 	inc	sp
   8212 21 00 C0      [10]  126 	ld	hl,#0xC000
   8215 E5            [11]  127 	push	hl
   8216 CD 6F 90      [17]  128 	call	_cpct_getScreenPtr
   8219 EB            [ 4]  129 	ex	de,hl
   821A 21 03 06      [10]  130 	ld	hl,#0x0603
   821D E5            [11]  131 	push	hl
   821E D5            [11]  132 	push	de
   821F 21 28 79      [10]  133 	ld	hl,#_g_heart
   8222 E5            [11]  134 	push	hl
   8223 CD AC 84      [17]  135 	call	_cpct_drawSprite
   8226 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   8227 03            [ 6]  138 	inc	bc
   8228 79            [ 4]  139 	ld	a,c
   8229 D6 05         [ 7]  140 	sub	a, #0x05
   822B 78            [ 4]  141 	ld	a,b
   822C 17            [ 4]  142 	rla
   822D 3F            [ 4]  143 	ccf
   822E 1F            [ 4]  144 	rra
   822F DE 80         [ 7]  145 	sbc	a, #0x80
   8231 38 D2         [12]  146 	jr	C,00102$
   8233 C9            [10]  147 	ret
   8234                     148 ___str_0:
   8234 53 43 4F 52 45      149 	.ascii "SCORE"
   8239 00                  150 	.db 0x00
   823A                     151 ___str_1:
   823A 30 30 30 30 30      152 	.ascii "00000"
   823F 00                  153 	.db 0x00
   8240                     154 ___str_2:
   8240 4C 49 56 45 53      155 	.ascii "LIVES"
   8245 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   8246                     161 _modificarPuntuacion::
   8246 DD E5         [15]  162 	push	ix
   8248 DD 21 00 00   [14]  163 	ld	ix,#0
   824C DD 39         [15]  164 	add	ix,sp
   824E 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   824F DD 5E 04      [19]  167 	ld	e,4 (ix)
   8252 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   8255 D5            [11]  170 	push	de
   8256 21 19 07      [10]  171 	ld	hl,#0x0719
   8259 E5            [11]  172 	push	hl
   825A 21 00 0E      [10]  173 	ld	hl,#0x0E00
   825D E5            [11]  174 	push	hl
   825E CD 7E 7D      [17]  175 	call	_borrarPantalla
   8261 F1            [10]  176 	pop	af
   8262 F1            [10]  177 	pop	af
   8263 21 00 0E      [10]  178 	ld	hl,#0x0E00
   8266 E5            [11]  179 	push	hl
   8267 26 C0         [ 7]  180 	ld	h, #0xC0
   8269 E5            [11]  181 	push	hl
   826A CD 6F 90      [17]  182 	call	_cpct_getScreenPtr
   826D 4D            [ 4]  183 	ld	c,l
   826E 44            [ 4]  184 	ld	b,h
   826F D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   8270 C5            [11]  187 	push	bc
   8271 D5            [11]  188 	push	de
   8272 21 0A 00      [10]  189 	ld	hl,#0x000A
   8275 E5            [11]  190 	push	hl
   8276 D5            [11]  191 	push	de
   8277 CD 64 90      [17]  192 	call	__moduint
   827A F1            [10]  193 	pop	af
   827B F1            [10]  194 	pop	af
   827C D1            [10]  195 	pop	de
   827D C1            [10]  196 	pop	bc
   827E 7D            [ 4]  197 	ld	a,l
   827F C6 30         [ 7]  198 	add	a, #0x30
   8281 DD 77 FF      [19]  199 	ld	-1 (ix),a
   8284 C5            [11]  200 	push	bc
   8285 FD E1         [14]  201 	pop	iy
   8287 C5            [11]  202 	push	bc
   8288 D5            [11]  203 	push	de
   8289 DD 7E FF      [19]  204 	ld	a,-1 (ix)
   828C F5            [11]  205 	push	af
   828D 33            [ 6]  206 	inc	sp
   828E 21 02 00      [10]  207 	ld	hl,#0x0002
   8291 E5            [11]  208 	push	hl
   8292 FD E5         [15]  209 	push	iy
   8294 CD E0 85      [17]  210 	call	_cpct_drawCharM0
   8297 F1            [10]  211 	pop	af
   8298 F1            [10]  212 	pop	af
   8299 33            [ 6]  213 	inc	sp
   829A D1            [10]  214 	pop	de
   829B 21 E8 03      [10]  215 	ld	hl,#0x03E8
   829E E5            [11]  216 	push	hl
   829F D5            [11]  217 	push	de
   82A0 CD AE 83      [17]  218 	call	__divuint
   82A3 F1            [10]  219 	pop	af
   82A4 F1            [10]  220 	pop	af
   82A5 11 0A 00      [10]  221 	ld	de,#0x000A
   82A8 D5            [11]  222 	push	de
   82A9 E5            [11]  223 	push	hl
   82AA CD 64 90      [17]  224 	call	__moduint
   82AD F1            [10]  225 	pop	af
   82AE F1            [10]  226 	pop	af
   82AF C1            [10]  227 	pop	bc
   82B0 7D            [ 4]  228 	ld	a,l
   82B1 C6 30         [ 7]  229 	add	a, #0x30
   82B3 67            [ 4]  230 	ld	h,a
   82B4 79            [ 4]  231 	ld	a,c
   82B5 C6 04         [ 7]  232 	add	a, #0x04
   82B7 5F            [ 4]  233 	ld	e,a
   82B8 78            [ 4]  234 	ld	a,b
   82B9 CE 00         [ 7]  235 	adc	a, #0x00
   82BB 57            [ 4]  236 	ld	d,a
   82BC C5            [11]  237 	push	bc
   82BD E5            [11]  238 	push	hl
   82BE 33            [ 6]  239 	inc	sp
   82BF 21 02 00      [10]  240 	ld	hl,#0x0002
   82C2 E5            [11]  241 	push	hl
   82C3 D5            [11]  242 	push	de
   82C4 CD E0 85      [17]  243 	call	_cpct_drawCharM0
   82C7 F1            [10]  244 	pop	af
   82C8 33            [ 6]  245 	inc	sp
   82C9 21 64 00      [10]  246 	ld	hl,#0x0064
   82CC E3            [19]  247 	ex	(sp),hl
   82CD DD 6E 04      [19]  248 	ld	l,4 (ix)
   82D0 DD 66 05      [19]  249 	ld	h,5 (ix)
   82D3 E5            [11]  250 	push	hl
   82D4 CD AE 83      [17]  251 	call	__divuint
   82D7 F1            [10]  252 	pop	af
   82D8 F1            [10]  253 	pop	af
   82D9 11 0A 00      [10]  254 	ld	de,#0x000A
   82DC D5            [11]  255 	push	de
   82DD E5            [11]  256 	push	hl
   82DE CD 64 90      [17]  257 	call	__moduint
   82E1 F1            [10]  258 	pop	af
   82E2 F1            [10]  259 	pop	af
   82E3 C1            [10]  260 	pop	bc
   82E4 7D            [ 4]  261 	ld	a,l
   82E5 C6 30         [ 7]  262 	add	a, #0x30
   82E7 67            [ 4]  263 	ld	h,a
   82E8 79            [ 4]  264 	ld	a,c
   82E9 C6 08         [ 7]  265 	add	a, #0x08
   82EB 5F            [ 4]  266 	ld	e,a
   82EC 78            [ 4]  267 	ld	a,b
   82ED CE 00         [ 7]  268 	adc	a, #0x00
   82EF 57            [ 4]  269 	ld	d,a
   82F0 C5            [11]  270 	push	bc
   82F1 E5            [11]  271 	push	hl
   82F2 33            [ 6]  272 	inc	sp
   82F3 21 02 00      [10]  273 	ld	hl,#0x0002
   82F6 E5            [11]  274 	push	hl
   82F7 D5            [11]  275 	push	de
   82F8 CD E0 85      [17]  276 	call	_cpct_drawCharM0
   82FB F1            [10]  277 	pop	af
   82FC 33            [ 6]  278 	inc	sp
   82FD 21 0A 00      [10]  279 	ld	hl,#0x000A
   8300 E3            [19]  280 	ex	(sp),hl
   8301 DD 6E 04      [19]  281 	ld	l,4 (ix)
   8304 DD 66 05      [19]  282 	ld	h,5 (ix)
   8307 E5            [11]  283 	push	hl
   8308 CD AE 83      [17]  284 	call	__divuint
   830B F1            [10]  285 	pop	af
   830C F1            [10]  286 	pop	af
   830D 11 0A 00      [10]  287 	ld	de,#0x000A
   8310 D5            [11]  288 	push	de
   8311 E5            [11]  289 	push	hl
   8312 CD 64 90      [17]  290 	call	__moduint
   8315 F1            [10]  291 	pop	af
   8316 F1            [10]  292 	pop	af
   8317 C1            [10]  293 	pop	bc
   8318 7D            [ 4]  294 	ld	a,l
   8319 C6 30         [ 7]  295 	add	a, #0x30
   831B 67            [ 4]  296 	ld	h,a
   831C 79            [ 4]  297 	ld	a,c
   831D C6 0C         [ 7]  298 	add	a, #0x0C
   831F 5F            [ 4]  299 	ld	e,a
   8320 78            [ 4]  300 	ld	a,b
   8321 CE 00         [ 7]  301 	adc	a, #0x00
   8323 57            [ 4]  302 	ld	d,a
   8324 C5            [11]  303 	push	bc
   8325 E5            [11]  304 	push	hl
   8326 33            [ 6]  305 	inc	sp
   8327 21 02 00      [10]  306 	ld	hl,#0x0002
   832A E5            [11]  307 	push	hl
   832B D5            [11]  308 	push	de
   832C CD E0 85      [17]  309 	call	_cpct_drawCharM0
   832F F1            [10]  310 	pop	af
   8330 F1            [10]  311 	pop	af
   8331 33            [ 6]  312 	inc	sp
   8332 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   8333 21 10 00      [10]  315 	ld	hl,#0x0010
   8336 09            [11]  316 	add	hl,bc
   8337 4D            [ 4]  317 	ld	c,l
   8338 44            [ 4]  318 	ld	b,h
   8339 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   833C F5            [11]  320 	push	af
   833D 33            [ 6]  321 	inc	sp
   833E 21 02 00      [10]  322 	ld	hl,#0x0002
   8341 E5            [11]  323 	push	hl
   8342 C5            [11]  324 	push	bc
   8343 CD E0 85      [17]  325 	call	_cpct_drawCharM0
   8346 F1            [10]  326 	pop	af
   8347 F1            [10]  327 	pop	af
   8348 33            [ 6]  328 	inc	sp
   8349 33            [ 6]  329 	inc	sp
   834A DD E1         [14]  330 	pop	ix
   834C C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   834D                     336 _modificarVidas::
   834D DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   834F 01 00 00      [10]  339 	ld	bc,#0x0000
   8352                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   8352 79            [ 4]  342 	ld	a,c
   8353 87            [ 4]  343 	add	a, a
   8354 87            [ 4]  344 	add	a, a
   8355 C6 3C         [ 7]  345 	add	a, #0x3C
   8357 57            [ 4]  346 	ld	d,a
   8358 C5            [11]  347 	push	bc
   8359 3E 0E         [ 7]  348 	ld	a,#0x0E
   835B F5            [11]  349 	push	af
   835C 33            [ 6]  350 	inc	sp
   835D D5            [11]  351 	push	de
   835E 33            [ 6]  352 	inc	sp
   835F 21 00 C0      [10]  353 	ld	hl,#0xC000
   8362 E5            [11]  354 	push	hl
   8363 CD 6F 90      [17]  355 	call	_cpct_getScreenPtr
   8366 EB            [ 4]  356 	ex	de,hl
   8367 21 03 06      [10]  357 	ld	hl,#0x0603
   836A E5            [11]  358 	push	hl
   836B D5            [11]  359 	push	de
   836C 21 28 79      [10]  360 	ld	hl,#_g_heart
   836F E5            [11]  361 	push	hl
   8370 CD AC 84      [17]  362 	call	_cpct_drawSprite
   8373 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   8374 03            [ 6]  365 	inc	bc
   8375 79            [ 4]  366 	ld	a,c
   8376 D6 05         [ 7]  367 	sub	a, #0x05
   8378 78            [ 4]  368 	ld	a,b
   8379 17            [ 4]  369 	rla
   837A 3F            [ 4]  370 	ccf
   837B 1F            [ 4]  371 	rra
   837C DE 80         [ 7]  372 	sbc	a, #0x80
   837E 38 D2         [12]  373 	jr	C,00102$
   8380 DD E1         [14]  374 	pop	ix
   8382 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   8383                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   8383 FD 21 02 00   [14]  382 	ld	iy,#2
   8387 FD 39         [15]  383 	add	iy,sp
   8389 FD 7E 00      [19]  384 	ld	a,0 (iy)
   838C C6 0A         [ 7]  385 	add	a, #0x0A
   838E 6F            [ 4]  386 	ld	l, a
   838F FD 7E 01      [19]  387 	ld	a, 1 (iy)
   8392 CE 00         [ 7]  388 	adc	a, #0x00
   8394 67            [ 4]  389 	ld	h, a
   8395 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   8396                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   8396 21 02 00      [10]  397 	ld	hl, #2+0
   8399 39            [11]  398 	add	hl, sp
   839A 4E            [ 7]  399 	ld	c, (hl)
   839B 0D            [ 4]  400 	dec	c
   839C 69            [ 4]  401 	ld	l,c
   839D C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
