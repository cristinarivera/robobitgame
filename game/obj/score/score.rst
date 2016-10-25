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
   4FD9                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   4FD9 21 00 02      [10]   58 	ld	hl,#0x0200
   4FDC E5            [11]   59 	push	hl
   4FDD 26 C0         [ 7]   60 	ld	h, #0xC0
   4FDF E5            [11]   61 	push	hl
   4FE0 CD 9E 5E      [17]   62 	call	_cpct_getScreenPtr
   4FE3 4D            [ 4]   63 	ld	c,l
   4FE4 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   4FE5 21 01 00      [10]   66 	ld	hl,#0x0001
   4FE8 E5            [11]   67 	push	hl
   4FE9 C5            [11]   68 	push	bc
   4FEA 21 63 50      [10]   69 	ld	hl,#___str_0
   4FED E5            [11]   70 	push	hl
   4FEE CD B7 52      [17]   71 	call	_cpct_drawStringM0
   4FF1 21 06 00      [10]   72 	ld	hl,#6
   4FF4 39            [11]   73 	add	hl,sp
   4FF5 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   4FF6 21 00 0E      [10]   76 	ld	hl,#0x0E00
   4FF9 E5            [11]   77 	push	hl
   4FFA 26 C0         [ 7]   78 	ld	h, #0xC0
   4FFC E5            [11]   79 	push	hl
   4FFD CD 9E 5E      [17]   80 	call	_cpct_getScreenPtr
   5000 4D            [ 4]   81 	ld	c,l
   5001 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5002 21 0F 00      [10]   84 	ld	hl,#0x000F
   5005 E5            [11]   85 	push	hl
   5006 C5            [11]   86 	push	bc
   5007 21 69 50      [10]   87 	ld	hl,#___str_1
   500A E5            [11]   88 	push	hl
   500B CD B7 52      [17]   89 	call	_cpct_drawStringM0
   500E 21 06 00      [10]   90 	ld	hl,#6
   5011 39            [11]   91 	add	hl,sp
   5012 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   5013 21 3C 02      [10]   94 	ld	hl,#0x023C
   5016 E5            [11]   95 	push	hl
   5017 21 00 C0      [10]   96 	ld	hl,#0xC000
   501A E5            [11]   97 	push	hl
   501B CD 9E 5E      [17]   98 	call	_cpct_getScreenPtr
   501E 4D            [ 4]   99 	ld	c,l
   501F 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5020 21 01 00      [10]  102 	ld	hl,#0x0001
   5023 E5            [11]  103 	push	hl
   5024 C5            [11]  104 	push	bc
   5025 21 6F 50      [10]  105 	ld	hl,#___str_2
   5028 E5            [11]  106 	push	hl
   5029 CD B7 52      [17]  107 	call	_cpct_drawStringM0
   502C 21 06 00      [10]  108 	ld	hl,#6
   502F 39            [11]  109 	add	hl,sp
   5030 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5031 01 00 00      [10]  112 	ld	bc,#0x0000
   5034                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5034 79            [ 4]  115 	ld	a,c
   5035 87            [ 4]  116 	add	a, a
   5036 87            [ 4]  117 	add	a, a
   5037 C6 3C         [ 7]  118 	add	a, #0x3C
   5039 57            [ 4]  119 	ld	d,a
   503A C5            [11]  120 	push	bc
   503B 3E 0E         [ 7]  121 	ld	a,#0x0E
   503D F5            [11]  122 	push	af
   503E 33            [ 6]  123 	inc	sp
   503F D5            [11]  124 	push	de
   5040 33            [ 6]  125 	inc	sp
   5041 21 00 C0      [10]  126 	ld	hl,#0xC000
   5044 E5            [11]  127 	push	hl
   5045 CD 9E 5E      [17]  128 	call	_cpct_getScreenPtr
   5048 EB            [ 4]  129 	ex	de,hl
   5049 21 03 06      [10]  130 	ld	hl,#0x0603
   504C E5            [11]  131 	push	hl
   504D D5            [11]  132 	push	de
   504E 21 28 3C      [10]  133 	ld	hl,#_g_heart
   5051 E5            [11]  134 	push	hl
   5052 CD DB 52      [17]  135 	call	_cpct_drawSprite
   5055 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   5056 03            [ 6]  138 	inc	bc
   5057 79            [ 4]  139 	ld	a,c
   5058 D6 05         [ 7]  140 	sub	a, #0x05
   505A 78            [ 4]  141 	ld	a,b
   505B 17            [ 4]  142 	rla
   505C 3F            [ 4]  143 	ccf
   505D 1F            [ 4]  144 	rra
   505E DE 80         [ 7]  145 	sbc	a, #0x80
   5060 38 D2         [12]  146 	jr	C,00102$
   5062 C9            [10]  147 	ret
   5063                     148 ___str_0:
   5063 53 43 4F 52 45      149 	.ascii "SCORE"
   5068 00                  150 	.db 0x00
   5069                     151 ___str_1:
   5069 30 30 30 30 30      152 	.ascii "00000"
   506E 00                  153 	.db 0x00
   506F                     154 ___str_2:
   506F 4C 49 56 45 53      155 	.ascii "LIVES"
   5074 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   5075                     161 _modificarPuntuacion::
   5075 DD E5         [15]  162 	push	ix
   5077 DD 21 00 00   [14]  163 	ld	ix,#0
   507B DD 39         [15]  164 	add	ix,sp
   507D 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   507E DD 5E 04      [19]  167 	ld	e,4 (ix)
   5081 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5084 D5            [11]  170 	push	de
   5085 21 19 07      [10]  171 	ld	hl,#0x0719
   5088 E5            [11]  172 	push	hl
   5089 21 00 0E      [10]  173 	ld	hl,#0x0E00
   508C E5            [11]  174 	push	hl
   508D CD AD 4B      [17]  175 	call	_borrarPantalla
   5090 F1            [10]  176 	pop	af
   5091 F1            [10]  177 	pop	af
   5092 21 00 0E      [10]  178 	ld	hl,#0x0E00
   5095 E5            [11]  179 	push	hl
   5096 26 C0         [ 7]  180 	ld	h, #0xC0
   5098 E5            [11]  181 	push	hl
   5099 CD 9E 5E      [17]  182 	call	_cpct_getScreenPtr
   509C 4D            [ 4]  183 	ld	c,l
   509D 44            [ 4]  184 	ld	b,h
   509E D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   509F C5            [11]  187 	push	bc
   50A0 D5            [11]  188 	push	de
   50A1 21 0A 00      [10]  189 	ld	hl,#0x000A
   50A4 E5            [11]  190 	push	hl
   50A5 D5            [11]  191 	push	de
   50A6 CD 93 5E      [17]  192 	call	__moduint
   50A9 F1            [10]  193 	pop	af
   50AA F1            [10]  194 	pop	af
   50AB D1            [10]  195 	pop	de
   50AC C1            [10]  196 	pop	bc
   50AD 7D            [ 4]  197 	ld	a,l
   50AE C6 30         [ 7]  198 	add	a, #0x30
   50B0 DD 77 FF      [19]  199 	ld	-1 (ix),a
   50B3 C5            [11]  200 	push	bc
   50B4 FD E1         [14]  201 	pop	iy
   50B6 C5            [11]  202 	push	bc
   50B7 D5            [11]  203 	push	de
   50B8 DD 7E FF      [19]  204 	ld	a,-1 (ix)
   50BB F5            [11]  205 	push	af
   50BC 33            [ 6]  206 	inc	sp
   50BD 21 02 00      [10]  207 	ld	hl,#0x0002
   50C0 E5            [11]  208 	push	hl
   50C1 FD E5         [15]  209 	push	iy
   50C3 CD 0F 54      [17]  210 	call	_cpct_drawCharM0
   50C6 F1            [10]  211 	pop	af
   50C7 F1            [10]  212 	pop	af
   50C8 33            [ 6]  213 	inc	sp
   50C9 D1            [10]  214 	pop	de
   50CA 21 E8 03      [10]  215 	ld	hl,#0x03E8
   50CD E5            [11]  216 	push	hl
   50CE D5            [11]  217 	push	de
   50CF CD DD 51      [17]  218 	call	__divuint
   50D2 F1            [10]  219 	pop	af
   50D3 F1            [10]  220 	pop	af
   50D4 11 0A 00      [10]  221 	ld	de,#0x000A
   50D7 D5            [11]  222 	push	de
   50D8 E5            [11]  223 	push	hl
   50D9 CD 93 5E      [17]  224 	call	__moduint
   50DC F1            [10]  225 	pop	af
   50DD F1            [10]  226 	pop	af
   50DE C1            [10]  227 	pop	bc
   50DF 7D            [ 4]  228 	ld	a,l
   50E0 C6 30         [ 7]  229 	add	a, #0x30
   50E2 67            [ 4]  230 	ld	h,a
   50E3 79            [ 4]  231 	ld	a,c
   50E4 C6 04         [ 7]  232 	add	a, #0x04
   50E6 5F            [ 4]  233 	ld	e,a
   50E7 78            [ 4]  234 	ld	a,b
   50E8 CE 00         [ 7]  235 	adc	a, #0x00
   50EA 57            [ 4]  236 	ld	d,a
   50EB C5            [11]  237 	push	bc
   50EC E5            [11]  238 	push	hl
   50ED 33            [ 6]  239 	inc	sp
   50EE 21 02 00      [10]  240 	ld	hl,#0x0002
   50F1 E5            [11]  241 	push	hl
   50F2 D5            [11]  242 	push	de
   50F3 CD 0F 54      [17]  243 	call	_cpct_drawCharM0
   50F6 F1            [10]  244 	pop	af
   50F7 33            [ 6]  245 	inc	sp
   50F8 21 64 00      [10]  246 	ld	hl,#0x0064
   50FB E3            [19]  247 	ex	(sp),hl
   50FC DD 6E 04      [19]  248 	ld	l,4 (ix)
   50FF DD 66 05      [19]  249 	ld	h,5 (ix)
   5102 E5            [11]  250 	push	hl
   5103 CD DD 51      [17]  251 	call	__divuint
   5106 F1            [10]  252 	pop	af
   5107 F1            [10]  253 	pop	af
   5108 11 0A 00      [10]  254 	ld	de,#0x000A
   510B D5            [11]  255 	push	de
   510C E5            [11]  256 	push	hl
   510D CD 93 5E      [17]  257 	call	__moduint
   5110 F1            [10]  258 	pop	af
   5111 F1            [10]  259 	pop	af
   5112 C1            [10]  260 	pop	bc
   5113 7D            [ 4]  261 	ld	a,l
   5114 C6 30         [ 7]  262 	add	a, #0x30
   5116 67            [ 4]  263 	ld	h,a
   5117 79            [ 4]  264 	ld	a,c
   5118 C6 08         [ 7]  265 	add	a, #0x08
   511A 5F            [ 4]  266 	ld	e,a
   511B 78            [ 4]  267 	ld	a,b
   511C CE 00         [ 7]  268 	adc	a, #0x00
   511E 57            [ 4]  269 	ld	d,a
   511F C5            [11]  270 	push	bc
   5120 E5            [11]  271 	push	hl
   5121 33            [ 6]  272 	inc	sp
   5122 21 02 00      [10]  273 	ld	hl,#0x0002
   5125 E5            [11]  274 	push	hl
   5126 D5            [11]  275 	push	de
   5127 CD 0F 54      [17]  276 	call	_cpct_drawCharM0
   512A F1            [10]  277 	pop	af
   512B 33            [ 6]  278 	inc	sp
   512C 21 0A 00      [10]  279 	ld	hl,#0x000A
   512F E3            [19]  280 	ex	(sp),hl
   5130 DD 6E 04      [19]  281 	ld	l,4 (ix)
   5133 DD 66 05      [19]  282 	ld	h,5 (ix)
   5136 E5            [11]  283 	push	hl
   5137 CD DD 51      [17]  284 	call	__divuint
   513A F1            [10]  285 	pop	af
   513B F1            [10]  286 	pop	af
   513C 11 0A 00      [10]  287 	ld	de,#0x000A
   513F D5            [11]  288 	push	de
   5140 E5            [11]  289 	push	hl
   5141 CD 93 5E      [17]  290 	call	__moduint
   5144 F1            [10]  291 	pop	af
   5145 F1            [10]  292 	pop	af
   5146 C1            [10]  293 	pop	bc
   5147 7D            [ 4]  294 	ld	a,l
   5148 C6 30         [ 7]  295 	add	a, #0x30
   514A 67            [ 4]  296 	ld	h,a
   514B 79            [ 4]  297 	ld	a,c
   514C C6 0C         [ 7]  298 	add	a, #0x0C
   514E 5F            [ 4]  299 	ld	e,a
   514F 78            [ 4]  300 	ld	a,b
   5150 CE 00         [ 7]  301 	adc	a, #0x00
   5152 57            [ 4]  302 	ld	d,a
   5153 C5            [11]  303 	push	bc
   5154 E5            [11]  304 	push	hl
   5155 33            [ 6]  305 	inc	sp
   5156 21 02 00      [10]  306 	ld	hl,#0x0002
   5159 E5            [11]  307 	push	hl
   515A D5            [11]  308 	push	de
   515B CD 0F 54      [17]  309 	call	_cpct_drawCharM0
   515E F1            [10]  310 	pop	af
   515F F1            [10]  311 	pop	af
   5160 33            [ 6]  312 	inc	sp
   5161 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5162 21 10 00      [10]  315 	ld	hl,#0x0010
   5165 09            [11]  316 	add	hl,bc
   5166 4D            [ 4]  317 	ld	c,l
   5167 44            [ 4]  318 	ld	b,h
   5168 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   516B F5            [11]  320 	push	af
   516C 33            [ 6]  321 	inc	sp
   516D 21 02 00      [10]  322 	ld	hl,#0x0002
   5170 E5            [11]  323 	push	hl
   5171 C5            [11]  324 	push	bc
   5172 CD 0F 54      [17]  325 	call	_cpct_drawCharM0
   5175 F1            [10]  326 	pop	af
   5176 F1            [10]  327 	pop	af
   5177 33            [ 6]  328 	inc	sp
   5178 33            [ 6]  329 	inc	sp
   5179 DD E1         [14]  330 	pop	ix
   517B C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   517C                     336 _modificarVidas::
   517C DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   517E 01 00 00      [10]  339 	ld	bc,#0x0000
   5181                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5181 79            [ 4]  342 	ld	a,c
   5182 87            [ 4]  343 	add	a, a
   5183 87            [ 4]  344 	add	a, a
   5184 C6 3C         [ 7]  345 	add	a, #0x3C
   5186 57            [ 4]  346 	ld	d,a
   5187 C5            [11]  347 	push	bc
   5188 3E 0E         [ 7]  348 	ld	a,#0x0E
   518A F5            [11]  349 	push	af
   518B 33            [ 6]  350 	inc	sp
   518C D5            [11]  351 	push	de
   518D 33            [ 6]  352 	inc	sp
   518E 21 00 C0      [10]  353 	ld	hl,#0xC000
   5191 E5            [11]  354 	push	hl
   5192 CD 9E 5E      [17]  355 	call	_cpct_getScreenPtr
   5195 EB            [ 4]  356 	ex	de,hl
   5196 21 03 06      [10]  357 	ld	hl,#0x0603
   5199 E5            [11]  358 	push	hl
   519A D5            [11]  359 	push	de
   519B 21 28 3C      [10]  360 	ld	hl,#_g_heart
   519E E5            [11]  361 	push	hl
   519F CD DB 52      [17]  362 	call	_cpct_drawSprite
   51A2 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   51A3 03            [ 6]  365 	inc	bc
   51A4 79            [ 4]  366 	ld	a,c
   51A5 D6 05         [ 7]  367 	sub	a, #0x05
   51A7 78            [ 4]  368 	ld	a,b
   51A8 17            [ 4]  369 	rla
   51A9 3F            [ 4]  370 	ccf
   51AA 1F            [ 4]  371 	rra
   51AB DE 80         [ 7]  372 	sbc	a, #0x80
   51AD 38 D2         [12]  373 	jr	C,00102$
   51AF DD E1         [14]  374 	pop	ix
   51B1 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   51B2                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   51B2 FD 21 02 00   [14]  382 	ld	iy,#2
   51B6 FD 39         [15]  383 	add	iy,sp
   51B8 FD 7E 00      [19]  384 	ld	a,0 (iy)
   51BB C6 0A         [ 7]  385 	add	a, #0x0A
   51BD 6F            [ 4]  386 	ld	l, a
   51BE FD 7E 01      [19]  387 	ld	a, 1 (iy)
   51C1 CE 00         [ 7]  388 	adc	a, #0x00
   51C3 67            [ 4]  389 	ld	h, a
   51C4 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   51C5                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   51C5 21 02 00      [10]  397 	ld	hl, #2+0
   51C8 39            [11]  398 	add	hl, sp
   51C9 4E            [ 7]  399 	ld	c, (hl)
   51CA 0D            [ 4]  400 	dec	c
   51CB 69            [ 4]  401 	ld	l,c
   51CC C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
