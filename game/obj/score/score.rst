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
   4FFC                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   4FFC 21 00 02      [10]   58 	ld	hl,#0x0200
   4FFF E5            [11]   59 	push	hl
   5000 26 C0         [ 7]   60 	ld	h, #0xC0
   5002 E5            [11]   61 	push	hl
   5003 CD C1 5E      [17]   62 	call	_cpct_getScreenPtr
   5006 4D            [ 4]   63 	ld	c,l
   5007 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   5008 21 01 00      [10]   66 	ld	hl,#0x0001
   500B E5            [11]   67 	push	hl
   500C C5            [11]   68 	push	bc
   500D 21 86 50      [10]   69 	ld	hl,#___str_0
   5010 E5            [11]   70 	push	hl
   5011 CD DA 52      [17]   71 	call	_cpct_drawStringM0
   5014 21 06 00      [10]   72 	ld	hl,#6
   5017 39            [11]   73 	add	hl,sp
   5018 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   5019 21 00 0E      [10]   76 	ld	hl,#0x0E00
   501C E5            [11]   77 	push	hl
   501D 26 C0         [ 7]   78 	ld	h, #0xC0
   501F E5            [11]   79 	push	hl
   5020 CD C1 5E      [17]   80 	call	_cpct_getScreenPtr
   5023 4D            [ 4]   81 	ld	c,l
   5024 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   5025 21 0F 00      [10]   84 	ld	hl,#0x000F
   5028 E5            [11]   85 	push	hl
   5029 C5            [11]   86 	push	bc
   502A 21 8C 50      [10]   87 	ld	hl,#___str_1
   502D E5            [11]   88 	push	hl
   502E CD DA 52      [17]   89 	call	_cpct_drawStringM0
   5031 21 06 00      [10]   90 	ld	hl,#6
   5034 39            [11]   91 	add	hl,sp
   5035 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   5036 21 3C 02      [10]   94 	ld	hl,#0x023C
   5039 E5            [11]   95 	push	hl
   503A 21 00 C0      [10]   96 	ld	hl,#0xC000
   503D E5            [11]   97 	push	hl
   503E CD C1 5E      [17]   98 	call	_cpct_getScreenPtr
   5041 4D            [ 4]   99 	ld	c,l
   5042 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5043 21 01 00      [10]  102 	ld	hl,#0x0001
   5046 E5            [11]  103 	push	hl
   5047 C5            [11]  104 	push	bc
   5048 21 92 50      [10]  105 	ld	hl,#___str_2
   504B E5            [11]  106 	push	hl
   504C CD DA 52      [17]  107 	call	_cpct_drawStringM0
   504F 21 06 00      [10]  108 	ld	hl,#6
   5052 39            [11]  109 	add	hl,sp
   5053 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5054 01 00 00      [10]  112 	ld	bc,#0x0000
   5057                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5057 79            [ 4]  115 	ld	a,c
   5058 87            [ 4]  116 	add	a, a
   5059 87            [ 4]  117 	add	a, a
   505A C6 3C         [ 7]  118 	add	a, #0x3C
   505C 57            [ 4]  119 	ld	d,a
   505D C5            [11]  120 	push	bc
   505E 3E 0E         [ 7]  121 	ld	a,#0x0E
   5060 F5            [11]  122 	push	af
   5061 33            [ 6]  123 	inc	sp
   5062 D5            [11]  124 	push	de
   5063 33            [ 6]  125 	inc	sp
   5064 21 00 C0      [10]  126 	ld	hl,#0xC000
   5067 E5            [11]  127 	push	hl
   5068 CD C1 5E      [17]  128 	call	_cpct_getScreenPtr
   506B EB            [ 4]  129 	ex	de,hl
   506C 21 03 06      [10]  130 	ld	hl,#0x0603
   506F E5            [11]  131 	push	hl
   5070 D5            [11]  132 	push	de
   5071 21 28 3C      [10]  133 	ld	hl,#_g_heart
   5074 E5            [11]  134 	push	hl
   5075 CD FE 52      [17]  135 	call	_cpct_drawSprite
   5078 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   5079 03            [ 6]  138 	inc	bc
   507A 79            [ 4]  139 	ld	a,c
   507B D6 05         [ 7]  140 	sub	a, #0x05
   507D 78            [ 4]  141 	ld	a,b
   507E 17            [ 4]  142 	rla
   507F 3F            [ 4]  143 	ccf
   5080 1F            [ 4]  144 	rra
   5081 DE 80         [ 7]  145 	sbc	a, #0x80
   5083 38 D2         [12]  146 	jr	C,00102$
   5085 C9            [10]  147 	ret
   5086                     148 ___str_0:
   5086 53 43 4F 52 45      149 	.ascii "SCORE"
   508B 00                  150 	.db 0x00
   508C                     151 ___str_1:
   508C 30 30 30 30 30      152 	.ascii "00000"
   5091 00                  153 	.db 0x00
   5092                     154 ___str_2:
   5092 4C 49 56 45 53      155 	.ascii "LIVES"
   5097 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   5098                     161 _modificarPuntuacion::
   5098 DD E5         [15]  162 	push	ix
   509A DD 21 00 00   [14]  163 	ld	ix,#0
   509E DD 39         [15]  164 	add	ix,sp
   50A0 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   50A1 DD 5E 04      [19]  167 	ld	e,4 (ix)
   50A4 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   50A7 D5            [11]  170 	push	de
   50A8 21 19 07      [10]  171 	ld	hl,#0x0719
   50AB E5            [11]  172 	push	hl
   50AC 21 00 0E      [10]  173 	ld	hl,#0x0E00
   50AF E5            [11]  174 	push	hl
   50B0 CD D0 4B      [17]  175 	call	_borrarPantalla
   50B3 F1            [10]  176 	pop	af
   50B4 F1            [10]  177 	pop	af
   50B5 21 00 0E      [10]  178 	ld	hl,#0x0E00
   50B8 E5            [11]  179 	push	hl
   50B9 26 C0         [ 7]  180 	ld	h, #0xC0
   50BB E5            [11]  181 	push	hl
   50BC CD C1 5E      [17]  182 	call	_cpct_getScreenPtr
   50BF 4D            [ 4]  183 	ld	c,l
   50C0 44            [ 4]  184 	ld	b,h
   50C1 D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   50C2 C5            [11]  187 	push	bc
   50C3 D5            [11]  188 	push	de
   50C4 21 0A 00      [10]  189 	ld	hl,#0x000A
   50C7 E5            [11]  190 	push	hl
   50C8 D5            [11]  191 	push	de
   50C9 CD B6 5E      [17]  192 	call	__moduint
   50CC F1            [10]  193 	pop	af
   50CD F1            [10]  194 	pop	af
   50CE D1            [10]  195 	pop	de
   50CF C1            [10]  196 	pop	bc
   50D0 7D            [ 4]  197 	ld	a,l
   50D1 C6 30         [ 7]  198 	add	a, #0x30
   50D3 DD 77 FF      [19]  199 	ld	-1 (ix),a
   50D6 C5            [11]  200 	push	bc
   50D7 FD E1         [14]  201 	pop	iy
   50D9 C5            [11]  202 	push	bc
   50DA D5            [11]  203 	push	de
   50DB DD 7E FF      [19]  204 	ld	a,-1 (ix)
   50DE F5            [11]  205 	push	af
   50DF 33            [ 6]  206 	inc	sp
   50E0 21 02 00      [10]  207 	ld	hl,#0x0002
   50E3 E5            [11]  208 	push	hl
   50E4 FD E5         [15]  209 	push	iy
   50E6 CD 32 54      [17]  210 	call	_cpct_drawCharM0
   50E9 F1            [10]  211 	pop	af
   50EA F1            [10]  212 	pop	af
   50EB 33            [ 6]  213 	inc	sp
   50EC D1            [10]  214 	pop	de
   50ED 21 E8 03      [10]  215 	ld	hl,#0x03E8
   50F0 E5            [11]  216 	push	hl
   50F1 D5            [11]  217 	push	de
   50F2 CD 00 52      [17]  218 	call	__divuint
   50F5 F1            [10]  219 	pop	af
   50F6 F1            [10]  220 	pop	af
   50F7 11 0A 00      [10]  221 	ld	de,#0x000A
   50FA D5            [11]  222 	push	de
   50FB E5            [11]  223 	push	hl
   50FC CD B6 5E      [17]  224 	call	__moduint
   50FF F1            [10]  225 	pop	af
   5100 F1            [10]  226 	pop	af
   5101 C1            [10]  227 	pop	bc
   5102 7D            [ 4]  228 	ld	a,l
   5103 C6 30         [ 7]  229 	add	a, #0x30
   5105 67            [ 4]  230 	ld	h,a
   5106 79            [ 4]  231 	ld	a,c
   5107 C6 04         [ 7]  232 	add	a, #0x04
   5109 5F            [ 4]  233 	ld	e,a
   510A 78            [ 4]  234 	ld	a,b
   510B CE 00         [ 7]  235 	adc	a, #0x00
   510D 57            [ 4]  236 	ld	d,a
   510E C5            [11]  237 	push	bc
   510F E5            [11]  238 	push	hl
   5110 33            [ 6]  239 	inc	sp
   5111 21 02 00      [10]  240 	ld	hl,#0x0002
   5114 E5            [11]  241 	push	hl
   5115 D5            [11]  242 	push	de
   5116 CD 32 54      [17]  243 	call	_cpct_drawCharM0
   5119 F1            [10]  244 	pop	af
   511A 33            [ 6]  245 	inc	sp
   511B 21 64 00      [10]  246 	ld	hl,#0x0064
   511E E3            [19]  247 	ex	(sp),hl
   511F DD 6E 04      [19]  248 	ld	l,4 (ix)
   5122 DD 66 05      [19]  249 	ld	h,5 (ix)
   5125 E5            [11]  250 	push	hl
   5126 CD 00 52      [17]  251 	call	__divuint
   5129 F1            [10]  252 	pop	af
   512A F1            [10]  253 	pop	af
   512B 11 0A 00      [10]  254 	ld	de,#0x000A
   512E D5            [11]  255 	push	de
   512F E5            [11]  256 	push	hl
   5130 CD B6 5E      [17]  257 	call	__moduint
   5133 F1            [10]  258 	pop	af
   5134 F1            [10]  259 	pop	af
   5135 C1            [10]  260 	pop	bc
   5136 7D            [ 4]  261 	ld	a,l
   5137 C6 30         [ 7]  262 	add	a, #0x30
   5139 67            [ 4]  263 	ld	h,a
   513A 79            [ 4]  264 	ld	a,c
   513B C6 08         [ 7]  265 	add	a, #0x08
   513D 5F            [ 4]  266 	ld	e,a
   513E 78            [ 4]  267 	ld	a,b
   513F CE 00         [ 7]  268 	adc	a, #0x00
   5141 57            [ 4]  269 	ld	d,a
   5142 C5            [11]  270 	push	bc
   5143 E5            [11]  271 	push	hl
   5144 33            [ 6]  272 	inc	sp
   5145 21 02 00      [10]  273 	ld	hl,#0x0002
   5148 E5            [11]  274 	push	hl
   5149 D5            [11]  275 	push	de
   514A CD 32 54      [17]  276 	call	_cpct_drawCharM0
   514D F1            [10]  277 	pop	af
   514E 33            [ 6]  278 	inc	sp
   514F 21 0A 00      [10]  279 	ld	hl,#0x000A
   5152 E3            [19]  280 	ex	(sp),hl
   5153 DD 6E 04      [19]  281 	ld	l,4 (ix)
   5156 DD 66 05      [19]  282 	ld	h,5 (ix)
   5159 E5            [11]  283 	push	hl
   515A CD 00 52      [17]  284 	call	__divuint
   515D F1            [10]  285 	pop	af
   515E F1            [10]  286 	pop	af
   515F 11 0A 00      [10]  287 	ld	de,#0x000A
   5162 D5            [11]  288 	push	de
   5163 E5            [11]  289 	push	hl
   5164 CD B6 5E      [17]  290 	call	__moduint
   5167 F1            [10]  291 	pop	af
   5168 F1            [10]  292 	pop	af
   5169 C1            [10]  293 	pop	bc
   516A 7D            [ 4]  294 	ld	a,l
   516B C6 30         [ 7]  295 	add	a, #0x30
   516D 67            [ 4]  296 	ld	h,a
   516E 79            [ 4]  297 	ld	a,c
   516F C6 0C         [ 7]  298 	add	a, #0x0C
   5171 5F            [ 4]  299 	ld	e,a
   5172 78            [ 4]  300 	ld	a,b
   5173 CE 00         [ 7]  301 	adc	a, #0x00
   5175 57            [ 4]  302 	ld	d,a
   5176 C5            [11]  303 	push	bc
   5177 E5            [11]  304 	push	hl
   5178 33            [ 6]  305 	inc	sp
   5179 21 02 00      [10]  306 	ld	hl,#0x0002
   517C E5            [11]  307 	push	hl
   517D D5            [11]  308 	push	de
   517E CD 32 54      [17]  309 	call	_cpct_drawCharM0
   5181 F1            [10]  310 	pop	af
   5182 F1            [10]  311 	pop	af
   5183 33            [ 6]  312 	inc	sp
   5184 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5185 21 10 00      [10]  315 	ld	hl,#0x0010
   5188 09            [11]  316 	add	hl,bc
   5189 4D            [ 4]  317 	ld	c,l
   518A 44            [ 4]  318 	ld	b,h
   518B DD 7E FF      [19]  319 	ld	a,-1 (ix)
   518E F5            [11]  320 	push	af
   518F 33            [ 6]  321 	inc	sp
   5190 21 02 00      [10]  322 	ld	hl,#0x0002
   5193 E5            [11]  323 	push	hl
   5194 C5            [11]  324 	push	bc
   5195 CD 32 54      [17]  325 	call	_cpct_drawCharM0
   5198 F1            [10]  326 	pop	af
   5199 F1            [10]  327 	pop	af
   519A 33            [ 6]  328 	inc	sp
   519B 33            [ 6]  329 	inc	sp
   519C DD E1         [14]  330 	pop	ix
   519E C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   519F                     336 _modificarVidas::
   519F DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   51A1 01 00 00      [10]  339 	ld	bc,#0x0000
   51A4                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   51A4 79            [ 4]  342 	ld	a,c
   51A5 87            [ 4]  343 	add	a, a
   51A6 87            [ 4]  344 	add	a, a
   51A7 C6 3C         [ 7]  345 	add	a, #0x3C
   51A9 57            [ 4]  346 	ld	d,a
   51AA C5            [11]  347 	push	bc
   51AB 3E 0E         [ 7]  348 	ld	a,#0x0E
   51AD F5            [11]  349 	push	af
   51AE 33            [ 6]  350 	inc	sp
   51AF D5            [11]  351 	push	de
   51B0 33            [ 6]  352 	inc	sp
   51B1 21 00 C0      [10]  353 	ld	hl,#0xC000
   51B4 E5            [11]  354 	push	hl
   51B5 CD C1 5E      [17]  355 	call	_cpct_getScreenPtr
   51B8 EB            [ 4]  356 	ex	de,hl
   51B9 21 03 06      [10]  357 	ld	hl,#0x0603
   51BC E5            [11]  358 	push	hl
   51BD D5            [11]  359 	push	de
   51BE 21 28 3C      [10]  360 	ld	hl,#_g_heart
   51C1 E5            [11]  361 	push	hl
   51C2 CD FE 52      [17]  362 	call	_cpct_drawSprite
   51C5 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   51C6 03            [ 6]  365 	inc	bc
   51C7 79            [ 4]  366 	ld	a,c
   51C8 D6 05         [ 7]  367 	sub	a, #0x05
   51CA 78            [ 4]  368 	ld	a,b
   51CB 17            [ 4]  369 	rla
   51CC 3F            [ 4]  370 	ccf
   51CD 1F            [ 4]  371 	rra
   51CE DE 80         [ 7]  372 	sbc	a, #0x80
   51D0 38 D2         [12]  373 	jr	C,00102$
   51D2 DD E1         [14]  374 	pop	ix
   51D4 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   51D5                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   51D5 FD 21 02 00   [14]  382 	ld	iy,#2
   51D9 FD 39         [15]  383 	add	iy,sp
   51DB FD 7E 00      [19]  384 	ld	a,0 (iy)
   51DE C6 0A         [ 7]  385 	add	a, #0x0A
   51E0 6F            [ 4]  386 	ld	l, a
   51E1 FD 7E 01      [19]  387 	ld	a, 1 (iy)
   51E4 CE 00         [ 7]  388 	adc	a, #0x00
   51E6 67            [ 4]  389 	ld	h, a
   51E7 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   51E8                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   51E8 21 02 00      [10]  397 	ld	hl, #2+0
   51EB 39            [11]  398 	add	hl, sp
   51EC 4E            [ 7]  399 	ld	c, (hl)
   51ED 0D            [ 4]  400 	dec	c
   51EE 69            [ 4]  401 	ld	l,c
   51EF C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
