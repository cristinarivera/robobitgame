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
   5011                      55 _barraPuntuacionInicial::
                             56 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5011 21 00 02      [10]   57 	ld	hl,#0x0200
   5014 E5            [11]   58 	push	hl
   5015 26 C0         [ 7]   59 	ld	h, #0xC0
   5017 E5            [11]   60 	push	hl
   5018 CD FB 5E      [17]   61 	call	_cpct_getScreenPtr
   501B 4D            [ 4]   62 	ld	c,l
   501C 44            [ 4]   63 	ld	b,h
                             64 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   501D 21 01 00      [10]   65 	ld	hl,#0x0001
   5020 E5            [11]   66 	push	hl
   5021 C5            [11]   67 	push	bc
   5022 21 9B 50      [10]   68 	ld	hl,#___str_0
   5025 E5            [11]   69 	push	hl
   5026 CD 14 53      [17]   70 	call	_cpct_drawStringM0
   5029 21 06 00      [10]   71 	ld	hl,#6
   502C 39            [11]   72 	add	hl,sp
   502D F9            [ 6]   73 	ld	sp,hl
                             74 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   502E 21 00 0E      [10]   75 	ld	hl,#0x0E00
   5031 E5            [11]   76 	push	hl
   5032 26 C0         [ 7]   77 	ld	h, #0xC0
   5034 E5            [11]   78 	push	hl
   5035 CD FB 5E      [17]   79 	call	_cpct_getScreenPtr
   5038 4D            [ 4]   80 	ld	c,l
   5039 44            [ 4]   81 	ld	b,h
                             82 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   503A 21 0F 00      [10]   83 	ld	hl,#0x000F
   503D E5            [11]   84 	push	hl
   503E C5            [11]   85 	push	bc
   503F 21 A1 50      [10]   86 	ld	hl,#___str_1
   5042 E5            [11]   87 	push	hl
   5043 CD 14 53      [17]   88 	call	_cpct_drawStringM0
   5046 21 06 00      [10]   89 	ld	hl,#6
   5049 39            [11]   90 	add	hl,sp
   504A F9            [ 6]   91 	ld	sp,hl
                             92 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   504B 21 3C 02      [10]   93 	ld	hl,#0x023C
   504E E5            [11]   94 	push	hl
   504F 21 00 C0      [10]   95 	ld	hl,#0xC000
   5052 E5            [11]   96 	push	hl
   5053 CD FB 5E      [17]   97 	call	_cpct_getScreenPtr
   5056 4D            [ 4]   98 	ld	c,l
   5057 44            [ 4]   99 	ld	b,h
                            100 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5058 21 01 00      [10]  101 	ld	hl,#0x0001
   505B E5            [11]  102 	push	hl
   505C C5            [11]  103 	push	bc
   505D 21 A7 50      [10]  104 	ld	hl,#___str_2
   5060 E5            [11]  105 	push	hl
   5061 CD 14 53      [17]  106 	call	_cpct_drawStringM0
   5064 21 06 00      [10]  107 	ld	hl,#6
   5067 39            [11]  108 	add	hl,sp
   5068 F9            [ 6]  109 	ld	sp,hl
                            110 ;src/score/score.c:18: for(i=0; i<5; i++){
   5069 01 00 00      [10]  111 	ld	bc,#0x0000
   506C                     112 00102$:
                            113 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   506C 79            [ 4]  114 	ld	a,c
   506D 87            [ 4]  115 	add	a, a
   506E 87            [ 4]  116 	add	a, a
   506F C6 3C         [ 7]  117 	add	a, #0x3C
   5071 57            [ 4]  118 	ld	d,a
   5072 C5            [11]  119 	push	bc
   5073 3E 0E         [ 7]  120 	ld	a,#0x0E
   5075 F5            [11]  121 	push	af
   5076 33            [ 6]  122 	inc	sp
   5077 D5            [11]  123 	push	de
   5078 33            [ 6]  124 	inc	sp
   5079 21 00 C0      [10]  125 	ld	hl,#0xC000
   507C E5            [11]  126 	push	hl
   507D CD FB 5E      [17]  127 	call	_cpct_getScreenPtr
   5080 EB            [ 4]  128 	ex	de,hl
   5081 21 03 06      [10]  129 	ld	hl,#0x0603
   5084 E5            [11]  130 	push	hl
   5085 D5            [11]  131 	push	de
   5086 21 28 3C      [10]  132 	ld	hl,#_g_heart
   5089 E5            [11]  133 	push	hl
   508A CD 38 53      [17]  134 	call	_cpct_drawSprite
   508D C1            [10]  135 	pop	bc
                            136 ;src/score/score.c:18: for(i=0; i<5; i++){
   508E 03            [ 6]  137 	inc	bc
   508F 79            [ 4]  138 	ld	a,c
   5090 D6 05         [ 7]  139 	sub	a, #0x05
   5092 78            [ 4]  140 	ld	a,b
   5093 17            [ 4]  141 	rla
   5094 3F            [ 4]  142 	ccf
   5095 1F            [ 4]  143 	rra
   5096 DE 80         [ 7]  144 	sbc	a, #0x80
   5098 38 D2         [12]  145 	jr	C,00102$
   509A C9            [10]  146 	ret
   509B                     147 ___str_0:
   509B 53 43 4F 52 45      148 	.ascii "SCORE"
   50A0 00                  149 	.db 0x00
   50A1                     150 ___str_1:
   50A1 30 30 30 30 30      151 	.ascii "00000"
   50A6 00                  152 	.db 0x00
   50A7                     153 ___str_2:
   50A7 4C 49 56 45 53      154 	.ascii "LIVES"
   50AC 00                  155 	.db 0x00
                            156 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            157 ;	---------------------------------
                            158 ; Function modificarPuntuacion
                            159 ; ---------------------------------
   50AD                     160 _modificarPuntuacion::
   50AD DD E5         [15]  161 	push	ix
   50AF DD 21 00 00   [14]  162 	ld	ix,#0
   50B3 DD 39         [15]  163 	add	ix,sp
   50B5 3B            [ 6]  164 	dec	sp
                            165 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   50B6 DD 5E 04      [19]  166 	ld	e,4 (ix)
   50B9 DD 56 05      [19]  167 	ld	d,5 (ix)
                            168 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   50BC D5            [11]  169 	push	de
   50BD 21 19 07      [10]  170 	ld	hl,#0x0719
   50C0 E5            [11]  171 	push	hl
   50C1 21 00 0E      [10]  172 	ld	hl,#0x0E00
   50C4 E5            [11]  173 	push	hl
   50C5 CD E5 4B      [17]  174 	call	_borrarPantalla
   50C8 F1            [10]  175 	pop	af
   50C9 F1            [10]  176 	pop	af
   50CA 21 00 0E      [10]  177 	ld	hl,#0x0E00
   50CD E5            [11]  178 	push	hl
   50CE 26 C0         [ 7]  179 	ld	h, #0xC0
   50D0 E5            [11]  180 	push	hl
   50D1 CD FB 5E      [17]  181 	call	_cpct_getScreenPtr
   50D4 4D            [ 4]  182 	ld	c,l
   50D5 44            [ 4]  183 	ld	b,h
   50D6 D1            [10]  184 	pop	de
                            185 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   50D7 C5            [11]  186 	push	bc
   50D8 D5            [11]  187 	push	de
   50D9 21 0A 00      [10]  188 	ld	hl,#0x000A
   50DC E5            [11]  189 	push	hl
   50DD D5            [11]  190 	push	de
   50DE CD 09 55      [17]  191 	call	__moduint
   50E1 F1            [10]  192 	pop	af
   50E2 F1            [10]  193 	pop	af
   50E3 D1            [10]  194 	pop	de
   50E4 C1            [10]  195 	pop	bc
   50E5 7D            [ 4]  196 	ld	a,l
   50E6 C6 30         [ 7]  197 	add	a, #0x30
   50E8 DD 77 FF      [19]  198 	ld	-1 (ix),a
   50EB C5            [11]  199 	push	bc
   50EC FD E1         [14]  200 	pop	iy
   50EE C5            [11]  201 	push	bc
   50EF D5            [11]  202 	push	de
   50F0 DD 7E FF      [19]  203 	ld	a,-1 (ix)
   50F3 F5            [11]  204 	push	af
   50F4 33            [ 6]  205 	inc	sp
   50F5 21 02 00      [10]  206 	ld	hl,#0x0002
   50F8 E5            [11]  207 	push	hl
   50F9 FD E5         [15]  208 	push	iy
   50FB CD 70 54      [17]  209 	call	_cpct_drawCharM0
   50FE F1            [10]  210 	pop	af
   50FF F1            [10]  211 	pop	af
   5100 33            [ 6]  212 	inc	sp
   5101 D1            [10]  213 	pop	de
   5102 21 E8 03      [10]  214 	ld	hl,#0x03E8
   5105 E5            [11]  215 	push	hl
   5106 D5            [11]  216 	push	de
   5107 CD 3A 52      [17]  217 	call	__divuint
   510A F1            [10]  218 	pop	af
   510B F1            [10]  219 	pop	af
   510C 11 0A 00      [10]  220 	ld	de,#0x000A
   510F D5            [11]  221 	push	de
   5110 E5            [11]  222 	push	hl
   5111 CD 09 55      [17]  223 	call	__moduint
   5114 F1            [10]  224 	pop	af
   5115 F1            [10]  225 	pop	af
   5116 C1            [10]  226 	pop	bc
   5117 7D            [ 4]  227 	ld	a,l
   5118 C6 30         [ 7]  228 	add	a, #0x30
   511A 67            [ 4]  229 	ld	h,a
   511B 79            [ 4]  230 	ld	a,c
   511C C6 04         [ 7]  231 	add	a, #0x04
   511E 5F            [ 4]  232 	ld	e,a
   511F 78            [ 4]  233 	ld	a,b
   5120 CE 00         [ 7]  234 	adc	a, #0x00
   5122 57            [ 4]  235 	ld	d,a
   5123 C5            [11]  236 	push	bc
   5124 E5            [11]  237 	push	hl
   5125 33            [ 6]  238 	inc	sp
   5126 21 02 00      [10]  239 	ld	hl,#0x0002
   5129 E5            [11]  240 	push	hl
   512A D5            [11]  241 	push	de
   512B CD 70 54      [17]  242 	call	_cpct_drawCharM0
   512E F1            [10]  243 	pop	af
   512F 33            [ 6]  244 	inc	sp
   5130 21 64 00      [10]  245 	ld	hl,#0x0064
   5133 E3            [19]  246 	ex	(sp),hl
   5134 DD 6E 04      [19]  247 	ld	l,4 (ix)
   5137 DD 66 05      [19]  248 	ld	h,5 (ix)
   513A E5            [11]  249 	push	hl
   513B CD 3A 52      [17]  250 	call	__divuint
   513E F1            [10]  251 	pop	af
   513F F1            [10]  252 	pop	af
   5140 11 0A 00      [10]  253 	ld	de,#0x000A
   5143 D5            [11]  254 	push	de
   5144 E5            [11]  255 	push	hl
   5145 CD 09 55      [17]  256 	call	__moduint
   5148 F1            [10]  257 	pop	af
   5149 F1            [10]  258 	pop	af
   514A C1            [10]  259 	pop	bc
   514B 7D            [ 4]  260 	ld	a,l
   514C C6 30         [ 7]  261 	add	a, #0x30
   514E 67            [ 4]  262 	ld	h,a
   514F 79            [ 4]  263 	ld	a,c
   5150 C6 08         [ 7]  264 	add	a, #0x08
   5152 5F            [ 4]  265 	ld	e,a
   5153 78            [ 4]  266 	ld	a,b
   5154 CE 00         [ 7]  267 	adc	a, #0x00
   5156 57            [ 4]  268 	ld	d,a
   5157 C5            [11]  269 	push	bc
   5158 E5            [11]  270 	push	hl
   5159 33            [ 6]  271 	inc	sp
   515A 21 02 00      [10]  272 	ld	hl,#0x0002
   515D E5            [11]  273 	push	hl
   515E D5            [11]  274 	push	de
   515F CD 70 54      [17]  275 	call	_cpct_drawCharM0
   5162 F1            [10]  276 	pop	af
   5163 33            [ 6]  277 	inc	sp
   5164 21 0A 00      [10]  278 	ld	hl,#0x000A
   5167 E3            [19]  279 	ex	(sp),hl
   5168 DD 6E 04      [19]  280 	ld	l,4 (ix)
   516B DD 66 05      [19]  281 	ld	h,5 (ix)
   516E E5            [11]  282 	push	hl
   516F CD 3A 52      [17]  283 	call	__divuint
   5172 F1            [10]  284 	pop	af
   5173 F1            [10]  285 	pop	af
   5174 11 0A 00      [10]  286 	ld	de,#0x000A
   5177 D5            [11]  287 	push	de
   5178 E5            [11]  288 	push	hl
   5179 CD 09 55      [17]  289 	call	__moduint
   517C F1            [10]  290 	pop	af
   517D F1            [10]  291 	pop	af
   517E C1            [10]  292 	pop	bc
   517F 7D            [ 4]  293 	ld	a,l
   5180 C6 30         [ 7]  294 	add	a, #0x30
   5182 67            [ 4]  295 	ld	h,a
   5183 79            [ 4]  296 	ld	a,c
   5184 C6 0C         [ 7]  297 	add	a, #0x0C
   5186 5F            [ 4]  298 	ld	e,a
   5187 78            [ 4]  299 	ld	a,b
   5188 CE 00         [ 7]  300 	adc	a, #0x00
   518A 57            [ 4]  301 	ld	d,a
   518B C5            [11]  302 	push	bc
   518C E5            [11]  303 	push	hl
   518D 33            [ 6]  304 	inc	sp
   518E 21 02 00      [10]  305 	ld	hl,#0x0002
   5191 E5            [11]  306 	push	hl
   5192 D5            [11]  307 	push	de
   5193 CD 70 54      [17]  308 	call	_cpct_drawCharM0
   5196 F1            [10]  309 	pop	af
   5197 F1            [10]  310 	pop	af
   5198 33            [ 6]  311 	inc	sp
   5199 C1            [10]  312 	pop	bc
                            313 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   519A 21 10 00      [10]  314 	ld	hl,#0x0010
   519D 09            [11]  315 	add	hl,bc
   519E 4D            [ 4]  316 	ld	c,l
   519F 44            [ 4]  317 	ld	b,h
   51A0 DD 7E FF      [19]  318 	ld	a,-1 (ix)
   51A3 F5            [11]  319 	push	af
   51A4 33            [ 6]  320 	inc	sp
   51A5 21 02 00      [10]  321 	ld	hl,#0x0002
   51A8 E5            [11]  322 	push	hl
   51A9 C5            [11]  323 	push	bc
   51AA CD 70 54      [17]  324 	call	_cpct_drawCharM0
   51AD F1            [10]  325 	pop	af
   51AE F1            [10]  326 	pop	af
   51AF 33            [ 6]  327 	inc	sp
   51B0 33            [ 6]  328 	inc	sp
   51B1 DD E1         [14]  329 	pop	ix
   51B3 C9            [10]  330 	ret
                            331 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            332 ;	---------------------------------
                            333 ; Function modificarVidas
                            334 ; ---------------------------------
   51B4                     335 _modificarVidas::
   51B4 DD E5         [15]  336 	push	ix
   51B6 DD 21 00 00   [14]  337 	ld	ix,#0
   51BA DD 39         [15]  338 	add	ix,sp
                            339 ;src/score/score.c:45: borrarPantalla(60, 14, 20, 6);
   51BC 21 14 06      [10]  340 	ld	hl,#0x0614
   51BF E5            [11]  341 	push	hl
   51C0 21 3C 0E      [10]  342 	ld	hl,#0x0E3C
   51C3 E5            [11]  343 	push	hl
   51C4 CD E5 4B      [17]  344 	call	_borrarPantalla
   51C7 F1            [10]  345 	pop	af
   51C8 F1            [10]  346 	pop	af
                            347 ;src/score/score.c:47: for(i = 0; i<vidas; i++){
   51C9 0E 00         [ 7]  348 	ld	c,#0x00
   51CB                     349 00105$:
   51CB 79            [ 4]  350 	ld	a,c
   51CC DD 96 04      [19]  351 	sub	a, 4 (ix)
   51CF 30 43         [12]  352 	jr	NC,00107$
                            353 ;src/score/score.c:48: if(i%20 == 0){
   51D1 C5            [11]  354 	push	bc
   51D2 3E 14         [ 7]  355 	ld	a,#0x14
   51D4 F5            [11]  356 	push	af
   51D5 33            [ 6]  357 	inc	sp
   51D6 79            [ 4]  358 	ld	a,c
   51D7 F5            [11]  359 	push	af
   51D8 33            [ 6]  360 	inc	sp
   51D9 CD FD 54      [17]  361 	call	__moduchar
   51DC F1            [10]  362 	pop	af
   51DD C1            [10]  363 	pop	bc
   51DE 7D            [ 4]  364 	ld	a,l
   51DF B7            [ 4]  365 	or	a, a
   51E0 20 2F         [12]  366 	jr	NZ,00106$
                            367 ;src/score/score.c:49: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + (i/20)*4, 14); // dibuja 5 corazones
   51E2 C5            [11]  368 	push	bc
   51E3 3E 14         [ 7]  369 	ld	a,#0x14
   51E5 F5            [11]  370 	push	af
   51E6 33            [ 6]  371 	inc	sp
   51E7 79            [ 4]  372 	ld	a,c
   51E8 F5            [11]  373 	push	af
   51E9 33            [ 6]  374 	inc	sp
   51EA CD 42 52      [17]  375 	call	__divuchar
   51ED F1            [10]  376 	pop	af
   51EE C1            [10]  377 	pop	bc
   51EF 7D            [ 4]  378 	ld	a,l
   51F0 87            [ 4]  379 	add	a, a
   51F1 87            [ 4]  380 	add	a, a
   51F2 C6 3C         [ 7]  381 	add	a, #0x3C
   51F4 47            [ 4]  382 	ld	b,a
   51F5 C5            [11]  383 	push	bc
   51F6 3E 0E         [ 7]  384 	ld	a,#0x0E
   51F8 F5            [11]  385 	push	af
   51F9 33            [ 6]  386 	inc	sp
   51FA C5            [11]  387 	push	bc
   51FB 33            [ 6]  388 	inc	sp
   51FC 21 00 C0      [10]  389 	ld	hl,#0xC000
   51FF E5            [11]  390 	push	hl
   5200 CD FB 5E      [17]  391 	call	_cpct_getScreenPtr
   5203 EB            [ 4]  392 	ex	de,hl
   5204 21 03 06      [10]  393 	ld	hl,#0x0603
   5207 E5            [11]  394 	push	hl
   5208 D5            [11]  395 	push	de
   5209 21 28 3C      [10]  396 	ld	hl,#_g_heart
   520C E5            [11]  397 	push	hl
   520D CD 38 53      [17]  398 	call	_cpct_drawSprite
   5210 C1            [10]  399 	pop	bc
   5211                     400 00106$:
                            401 ;src/score/score.c:47: for(i = 0; i<vidas; i++){
   5211 0C            [ 4]  402 	inc	c
   5212 18 B7         [12]  403 	jr	00105$
   5214                     404 00107$:
   5214 DD E1         [14]  405 	pop	ix
   5216 C9            [10]  406 	ret
                            407 ;src/score/score.c:55: u16 aumentarPuntuacion(u16 puntuacion){
                            408 ;	---------------------------------
                            409 ; Function aumentarPuntuacion
                            410 ; ---------------------------------
   5217                     411 _aumentarPuntuacion::
                            412 ;src/score/score.c:56: return puntuacion + 10;
   5217 FD 21 02 00   [14]  413 	ld	iy,#2
   521B FD 39         [15]  414 	add	iy,sp
   521D FD 7E 00      [19]  415 	ld	a,0 (iy)
   5220 C6 0A         [ 7]  416 	add	a, #0x0A
   5222 6F            [ 4]  417 	ld	l, a
   5223 FD 7E 01      [19]  418 	ld	a, 1 (iy)
   5226 CE 00         [ 7]  419 	adc	a, #0x00
   5228 67            [ 4]  420 	ld	h, a
   5229 C9            [10]  421 	ret
                            422 	.area _CODE
                            423 	.area _INITIALIZER
                            424 	.area _CABS (ABS)
