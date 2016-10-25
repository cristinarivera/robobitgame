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
   5040                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5040 21 00 02      [10]   58 	ld	hl,#0x0200
   5043 E5            [11]   59 	push	hl
   5044 26 C0         [ 7]   60 	ld	h, #0xC0
   5046 E5            [11]   61 	push	hl
   5047 CD 05 5F      [17]   62 	call	_cpct_getScreenPtr
   504A 4D            [ 4]   63 	ld	c,l
   504B 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   504C 21 01 00      [10]   66 	ld	hl,#0x0001
   504F E5            [11]   67 	push	hl
   5050 C5            [11]   68 	push	bc
   5051 21 CA 50      [10]   69 	ld	hl,#___str_0
   5054 E5            [11]   70 	push	hl
   5055 CD 1E 53      [17]   71 	call	_cpct_drawStringM0
   5058 21 06 00      [10]   72 	ld	hl,#6
   505B 39            [11]   73 	add	hl,sp
   505C F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   505D 21 00 0E      [10]   76 	ld	hl,#0x0E00
   5060 E5            [11]   77 	push	hl
   5061 26 C0         [ 7]   78 	ld	h, #0xC0
   5063 E5            [11]   79 	push	hl
   5064 CD 05 5F      [17]   80 	call	_cpct_getScreenPtr
   5067 4D            [ 4]   81 	ld	c,l
   5068 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5069 21 0F 00      [10]   84 	ld	hl,#0x000F
   506C E5            [11]   85 	push	hl
   506D C5            [11]   86 	push	bc
   506E 21 D0 50      [10]   87 	ld	hl,#___str_1
   5071 E5            [11]   88 	push	hl
   5072 CD 1E 53      [17]   89 	call	_cpct_drawStringM0
   5075 21 06 00      [10]   90 	ld	hl,#6
   5078 39            [11]   91 	add	hl,sp
   5079 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   507A 21 3C 02      [10]   94 	ld	hl,#0x023C
   507D E5            [11]   95 	push	hl
   507E 21 00 C0      [10]   96 	ld	hl,#0xC000
   5081 E5            [11]   97 	push	hl
   5082 CD 05 5F      [17]   98 	call	_cpct_getScreenPtr
   5085 4D            [ 4]   99 	ld	c,l
   5086 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5087 21 01 00      [10]  102 	ld	hl,#0x0001
   508A E5            [11]  103 	push	hl
   508B C5            [11]  104 	push	bc
   508C 21 D6 50      [10]  105 	ld	hl,#___str_2
   508F E5            [11]  106 	push	hl
   5090 CD 1E 53      [17]  107 	call	_cpct_drawStringM0
   5093 21 06 00      [10]  108 	ld	hl,#6
   5096 39            [11]  109 	add	hl,sp
   5097 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5098 01 00 00      [10]  112 	ld	bc,#0x0000
   509B                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   509B 79            [ 4]  115 	ld	a,c
   509C 87            [ 4]  116 	add	a, a
   509D 87            [ 4]  117 	add	a, a
   509E C6 3C         [ 7]  118 	add	a, #0x3C
   50A0 57            [ 4]  119 	ld	d,a
   50A1 C5            [11]  120 	push	bc
   50A2 3E 0E         [ 7]  121 	ld	a,#0x0E
   50A4 F5            [11]  122 	push	af
   50A5 33            [ 6]  123 	inc	sp
   50A6 D5            [11]  124 	push	de
   50A7 33            [ 6]  125 	inc	sp
   50A8 21 00 C0      [10]  126 	ld	hl,#0xC000
   50AB E5            [11]  127 	push	hl
   50AC CD 05 5F      [17]  128 	call	_cpct_getScreenPtr
   50AF EB            [ 4]  129 	ex	de,hl
   50B0 21 03 06      [10]  130 	ld	hl,#0x0603
   50B3 E5            [11]  131 	push	hl
   50B4 D5            [11]  132 	push	de
   50B5 21 28 3C      [10]  133 	ld	hl,#_g_heart
   50B8 E5            [11]  134 	push	hl
   50B9 CD 42 53      [17]  135 	call	_cpct_drawSprite
   50BC C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   50BD 03            [ 6]  138 	inc	bc
   50BE 79            [ 4]  139 	ld	a,c
   50BF D6 05         [ 7]  140 	sub	a, #0x05
   50C1 78            [ 4]  141 	ld	a,b
   50C2 17            [ 4]  142 	rla
   50C3 3F            [ 4]  143 	ccf
   50C4 1F            [ 4]  144 	rra
   50C5 DE 80         [ 7]  145 	sbc	a, #0x80
   50C7 38 D2         [12]  146 	jr	C,00102$
   50C9 C9            [10]  147 	ret
   50CA                     148 ___str_0:
   50CA 53 43 4F 52 45      149 	.ascii "SCORE"
   50CF 00                  150 	.db 0x00
   50D0                     151 ___str_1:
   50D0 30 30 30 30 30      152 	.ascii "00000"
   50D5 00                  153 	.db 0x00
   50D6                     154 ___str_2:
   50D6 4C 49 56 45 53      155 	.ascii "LIVES"
   50DB 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   50DC                     161 _modificarPuntuacion::
   50DC DD E5         [15]  162 	push	ix
   50DE DD 21 00 00   [14]  163 	ld	ix,#0
   50E2 DD 39         [15]  164 	add	ix,sp
   50E4 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   50E5 DD 5E 04      [19]  167 	ld	e,4 (ix)
   50E8 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   50EB D5            [11]  170 	push	de
   50EC 21 19 07      [10]  171 	ld	hl,#0x0719
   50EF E5            [11]  172 	push	hl
   50F0 21 00 0E      [10]  173 	ld	hl,#0x0E00
   50F3 E5            [11]  174 	push	hl
   50F4 CD 14 4C      [17]  175 	call	_borrarPantalla
   50F7 F1            [10]  176 	pop	af
   50F8 F1            [10]  177 	pop	af
   50F9 21 00 0E      [10]  178 	ld	hl,#0x0E00
   50FC E5            [11]  179 	push	hl
   50FD 26 C0         [ 7]  180 	ld	h, #0xC0
   50FF E5            [11]  181 	push	hl
   5100 CD 05 5F      [17]  182 	call	_cpct_getScreenPtr
   5103 4D            [ 4]  183 	ld	c,l
   5104 44            [ 4]  184 	ld	b,h
   5105 D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   5106 C5            [11]  187 	push	bc
   5107 D5            [11]  188 	push	de
   5108 21 0A 00      [10]  189 	ld	hl,#0x000A
   510B E5            [11]  190 	push	hl
   510C D5            [11]  191 	push	de
   510D CD FA 5E      [17]  192 	call	__moduint
   5110 F1            [10]  193 	pop	af
   5111 F1            [10]  194 	pop	af
   5112 D1            [10]  195 	pop	de
   5113 C1            [10]  196 	pop	bc
   5114 7D            [ 4]  197 	ld	a,l
   5115 C6 30         [ 7]  198 	add	a, #0x30
   5117 DD 77 FF      [19]  199 	ld	-1 (ix),a
   511A C5            [11]  200 	push	bc
   511B FD E1         [14]  201 	pop	iy
   511D C5            [11]  202 	push	bc
   511E D5            [11]  203 	push	de
   511F DD 7E FF      [19]  204 	ld	a,-1 (ix)
   5122 F5            [11]  205 	push	af
   5123 33            [ 6]  206 	inc	sp
   5124 21 02 00      [10]  207 	ld	hl,#0x0002
   5127 E5            [11]  208 	push	hl
   5128 FD E5         [15]  209 	push	iy
   512A CD 76 54      [17]  210 	call	_cpct_drawCharM0
   512D F1            [10]  211 	pop	af
   512E F1            [10]  212 	pop	af
   512F 33            [ 6]  213 	inc	sp
   5130 D1            [10]  214 	pop	de
   5131 21 E8 03      [10]  215 	ld	hl,#0x03E8
   5134 E5            [11]  216 	push	hl
   5135 D5            [11]  217 	push	de
   5136 CD 44 52      [17]  218 	call	__divuint
   5139 F1            [10]  219 	pop	af
   513A F1            [10]  220 	pop	af
   513B 11 0A 00      [10]  221 	ld	de,#0x000A
   513E D5            [11]  222 	push	de
   513F E5            [11]  223 	push	hl
   5140 CD FA 5E      [17]  224 	call	__moduint
   5143 F1            [10]  225 	pop	af
   5144 F1            [10]  226 	pop	af
   5145 C1            [10]  227 	pop	bc
   5146 7D            [ 4]  228 	ld	a,l
   5147 C6 30         [ 7]  229 	add	a, #0x30
   5149 67            [ 4]  230 	ld	h,a
   514A 79            [ 4]  231 	ld	a,c
   514B C6 04         [ 7]  232 	add	a, #0x04
   514D 5F            [ 4]  233 	ld	e,a
   514E 78            [ 4]  234 	ld	a,b
   514F CE 00         [ 7]  235 	adc	a, #0x00
   5151 57            [ 4]  236 	ld	d,a
   5152 C5            [11]  237 	push	bc
   5153 E5            [11]  238 	push	hl
   5154 33            [ 6]  239 	inc	sp
   5155 21 02 00      [10]  240 	ld	hl,#0x0002
   5158 E5            [11]  241 	push	hl
   5159 D5            [11]  242 	push	de
   515A CD 76 54      [17]  243 	call	_cpct_drawCharM0
   515D F1            [10]  244 	pop	af
   515E 33            [ 6]  245 	inc	sp
   515F 21 64 00      [10]  246 	ld	hl,#0x0064
   5162 E3            [19]  247 	ex	(sp),hl
   5163 DD 6E 04      [19]  248 	ld	l,4 (ix)
   5166 DD 66 05      [19]  249 	ld	h,5 (ix)
   5169 E5            [11]  250 	push	hl
   516A CD 44 52      [17]  251 	call	__divuint
   516D F1            [10]  252 	pop	af
   516E F1            [10]  253 	pop	af
   516F 11 0A 00      [10]  254 	ld	de,#0x000A
   5172 D5            [11]  255 	push	de
   5173 E5            [11]  256 	push	hl
   5174 CD FA 5E      [17]  257 	call	__moduint
   5177 F1            [10]  258 	pop	af
   5178 F1            [10]  259 	pop	af
   5179 C1            [10]  260 	pop	bc
   517A 7D            [ 4]  261 	ld	a,l
   517B C6 30         [ 7]  262 	add	a, #0x30
   517D 67            [ 4]  263 	ld	h,a
   517E 79            [ 4]  264 	ld	a,c
   517F C6 08         [ 7]  265 	add	a, #0x08
   5181 5F            [ 4]  266 	ld	e,a
   5182 78            [ 4]  267 	ld	a,b
   5183 CE 00         [ 7]  268 	adc	a, #0x00
   5185 57            [ 4]  269 	ld	d,a
   5186 C5            [11]  270 	push	bc
   5187 E5            [11]  271 	push	hl
   5188 33            [ 6]  272 	inc	sp
   5189 21 02 00      [10]  273 	ld	hl,#0x0002
   518C E5            [11]  274 	push	hl
   518D D5            [11]  275 	push	de
   518E CD 76 54      [17]  276 	call	_cpct_drawCharM0
   5191 F1            [10]  277 	pop	af
   5192 33            [ 6]  278 	inc	sp
   5193 21 0A 00      [10]  279 	ld	hl,#0x000A
   5196 E3            [19]  280 	ex	(sp),hl
   5197 DD 6E 04      [19]  281 	ld	l,4 (ix)
   519A DD 66 05      [19]  282 	ld	h,5 (ix)
   519D E5            [11]  283 	push	hl
   519E CD 44 52      [17]  284 	call	__divuint
   51A1 F1            [10]  285 	pop	af
   51A2 F1            [10]  286 	pop	af
   51A3 11 0A 00      [10]  287 	ld	de,#0x000A
   51A6 D5            [11]  288 	push	de
   51A7 E5            [11]  289 	push	hl
   51A8 CD FA 5E      [17]  290 	call	__moduint
   51AB F1            [10]  291 	pop	af
   51AC F1            [10]  292 	pop	af
   51AD C1            [10]  293 	pop	bc
   51AE 7D            [ 4]  294 	ld	a,l
   51AF C6 30         [ 7]  295 	add	a, #0x30
   51B1 67            [ 4]  296 	ld	h,a
   51B2 79            [ 4]  297 	ld	a,c
   51B3 C6 0C         [ 7]  298 	add	a, #0x0C
   51B5 5F            [ 4]  299 	ld	e,a
   51B6 78            [ 4]  300 	ld	a,b
   51B7 CE 00         [ 7]  301 	adc	a, #0x00
   51B9 57            [ 4]  302 	ld	d,a
   51BA C5            [11]  303 	push	bc
   51BB E5            [11]  304 	push	hl
   51BC 33            [ 6]  305 	inc	sp
   51BD 21 02 00      [10]  306 	ld	hl,#0x0002
   51C0 E5            [11]  307 	push	hl
   51C1 D5            [11]  308 	push	de
   51C2 CD 76 54      [17]  309 	call	_cpct_drawCharM0
   51C5 F1            [10]  310 	pop	af
   51C6 F1            [10]  311 	pop	af
   51C7 33            [ 6]  312 	inc	sp
   51C8 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   51C9 21 10 00      [10]  315 	ld	hl,#0x0010
   51CC 09            [11]  316 	add	hl,bc
   51CD 4D            [ 4]  317 	ld	c,l
   51CE 44            [ 4]  318 	ld	b,h
   51CF DD 7E FF      [19]  319 	ld	a,-1 (ix)
   51D2 F5            [11]  320 	push	af
   51D3 33            [ 6]  321 	inc	sp
   51D4 21 02 00      [10]  322 	ld	hl,#0x0002
   51D7 E5            [11]  323 	push	hl
   51D8 C5            [11]  324 	push	bc
   51D9 CD 76 54      [17]  325 	call	_cpct_drawCharM0
   51DC F1            [10]  326 	pop	af
   51DD F1            [10]  327 	pop	af
   51DE 33            [ 6]  328 	inc	sp
   51DF 33            [ 6]  329 	inc	sp
   51E0 DD E1         [14]  330 	pop	ix
   51E2 C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   51E3                     336 _modificarVidas::
   51E3 DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   51E5 01 00 00      [10]  339 	ld	bc,#0x0000
   51E8                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   51E8 79            [ 4]  342 	ld	a,c
   51E9 87            [ 4]  343 	add	a, a
   51EA 87            [ 4]  344 	add	a, a
   51EB C6 3C         [ 7]  345 	add	a, #0x3C
   51ED 57            [ 4]  346 	ld	d,a
   51EE C5            [11]  347 	push	bc
   51EF 3E 0E         [ 7]  348 	ld	a,#0x0E
   51F1 F5            [11]  349 	push	af
   51F2 33            [ 6]  350 	inc	sp
   51F3 D5            [11]  351 	push	de
   51F4 33            [ 6]  352 	inc	sp
   51F5 21 00 C0      [10]  353 	ld	hl,#0xC000
   51F8 E5            [11]  354 	push	hl
   51F9 CD 05 5F      [17]  355 	call	_cpct_getScreenPtr
   51FC EB            [ 4]  356 	ex	de,hl
   51FD 21 03 06      [10]  357 	ld	hl,#0x0603
   5200 E5            [11]  358 	push	hl
   5201 D5            [11]  359 	push	de
   5202 21 28 3C      [10]  360 	ld	hl,#_g_heart
   5205 E5            [11]  361 	push	hl
   5206 CD 42 53      [17]  362 	call	_cpct_drawSprite
   5209 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   520A 03            [ 6]  365 	inc	bc
   520B 79            [ 4]  366 	ld	a,c
   520C D6 05         [ 7]  367 	sub	a, #0x05
   520E 78            [ 4]  368 	ld	a,b
   520F 17            [ 4]  369 	rla
   5210 3F            [ 4]  370 	ccf
   5211 1F            [ 4]  371 	rra
   5212 DE 80         [ 7]  372 	sbc	a, #0x80
   5214 38 D2         [12]  373 	jr	C,00102$
   5216 DD E1         [14]  374 	pop	ix
   5218 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   5219                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   5219 FD 21 02 00   [14]  382 	ld	iy,#2
   521D FD 39         [15]  383 	add	iy,sp
   521F FD 7E 00      [19]  384 	ld	a,0 (iy)
   5222 C6 0A         [ 7]  385 	add	a, #0x0A
   5224 6F            [ 4]  386 	ld	l, a
   5225 FD 7E 01      [19]  387 	ld	a, 1 (iy)
   5228 CE 00         [ 7]  388 	adc	a, #0x00
   522A 67            [ 4]  389 	ld	h, a
   522B C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   522C                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   522C 21 02 00      [10]  397 	ld	hl, #2+0
   522F 39            [11]  398 	add	hl, sp
   5230 4E            [ 7]  399 	ld	c, (hl)
   5231 0D            [ 4]  400 	dec	c
   5232 69            [ 4]  401 	ld	l,c
   5233 C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
