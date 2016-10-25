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
   4FBA                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   4FBA 21 00 02      [10]   58 	ld	hl,#0x0200
   4FBD E5            [11]   59 	push	hl
   4FBE 26 C0         [ 7]   60 	ld	h, #0xC0
   4FC0 E5            [11]   61 	push	hl
   4FC1 CD 7F 5E      [17]   62 	call	_cpct_getScreenPtr
   4FC4 4D            [ 4]   63 	ld	c,l
   4FC5 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   4FC6 21 01 00      [10]   66 	ld	hl,#0x0001
   4FC9 E5            [11]   67 	push	hl
   4FCA C5            [11]   68 	push	bc
   4FCB 21 44 50      [10]   69 	ld	hl,#___str_0
   4FCE E5            [11]   70 	push	hl
   4FCF CD 98 52      [17]   71 	call	_cpct_drawStringM0
   4FD2 21 06 00      [10]   72 	ld	hl,#6
   4FD5 39            [11]   73 	add	hl,sp
   4FD6 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   4FD7 21 00 0E      [10]   76 	ld	hl,#0x0E00
   4FDA E5            [11]   77 	push	hl
   4FDB 26 C0         [ 7]   78 	ld	h, #0xC0
   4FDD E5            [11]   79 	push	hl
   4FDE CD 7F 5E      [17]   80 	call	_cpct_getScreenPtr
   4FE1 4D            [ 4]   81 	ld	c,l
   4FE2 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   4FE3 21 0F 00      [10]   84 	ld	hl,#0x000F
   4FE6 E5            [11]   85 	push	hl
   4FE7 C5            [11]   86 	push	bc
   4FE8 21 4A 50      [10]   87 	ld	hl,#___str_1
   4FEB E5            [11]   88 	push	hl
   4FEC CD 98 52      [17]   89 	call	_cpct_drawStringM0
   4FEF 21 06 00      [10]   90 	ld	hl,#6
   4FF2 39            [11]   91 	add	hl,sp
   4FF3 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   4FF4 21 3C 02      [10]   94 	ld	hl,#0x023C
   4FF7 E5            [11]   95 	push	hl
   4FF8 21 00 C0      [10]   96 	ld	hl,#0xC000
   4FFB E5            [11]   97 	push	hl
   4FFC CD 7F 5E      [17]   98 	call	_cpct_getScreenPtr
   4FFF 4D            [ 4]   99 	ld	c,l
   5000 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5001 21 01 00      [10]  102 	ld	hl,#0x0001
   5004 E5            [11]  103 	push	hl
   5005 C5            [11]  104 	push	bc
   5006 21 50 50      [10]  105 	ld	hl,#___str_2
   5009 E5            [11]  106 	push	hl
   500A CD 98 52      [17]  107 	call	_cpct_drawStringM0
   500D 21 06 00      [10]  108 	ld	hl,#6
   5010 39            [11]  109 	add	hl,sp
   5011 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   5012 01 00 00      [10]  112 	ld	bc,#0x0000
   5015                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5015 79            [ 4]  115 	ld	a,c
   5016 87            [ 4]  116 	add	a, a
   5017 87            [ 4]  117 	add	a, a
   5018 C6 3C         [ 7]  118 	add	a, #0x3C
   501A 57            [ 4]  119 	ld	d,a
   501B C5            [11]  120 	push	bc
   501C 3E 0E         [ 7]  121 	ld	a,#0x0E
   501E F5            [11]  122 	push	af
   501F 33            [ 6]  123 	inc	sp
   5020 D5            [11]  124 	push	de
   5021 33            [ 6]  125 	inc	sp
   5022 21 00 C0      [10]  126 	ld	hl,#0xC000
   5025 E5            [11]  127 	push	hl
   5026 CD 7F 5E      [17]  128 	call	_cpct_getScreenPtr
   5029 EB            [ 4]  129 	ex	de,hl
   502A 21 03 06      [10]  130 	ld	hl,#0x0603
   502D E5            [11]  131 	push	hl
   502E D5            [11]  132 	push	de
   502F 21 28 3C      [10]  133 	ld	hl,#_g_heart
   5032 E5            [11]  134 	push	hl
   5033 CD BC 52      [17]  135 	call	_cpct_drawSprite
   5036 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   5037 03            [ 6]  138 	inc	bc
   5038 79            [ 4]  139 	ld	a,c
   5039 D6 05         [ 7]  140 	sub	a, #0x05
   503B 78            [ 4]  141 	ld	a,b
   503C 17            [ 4]  142 	rla
   503D 3F            [ 4]  143 	ccf
   503E 1F            [ 4]  144 	rra
   503F DE 80         [ 7]  145 	sbc	a, #0x80
   5041 38 D2         [12]  146 	jr	C,00102$
   5043 C9            [10]  147 	ret
   5044                     148 ___str_0:
   5044 53 43 4F 52 45      149 	.ascii "SCORE"
   5049 00                  150 	.db 0x00
   504A                     151 ___str_1:
   504A 30 30 30 30 30      152 	.ascii "00000"
   504F 00                  153 	.db 0x00
   5050                     154 ___str_2:
   5050 4C 49 56 45 53      155 	.ascii "LIVES"
   5055 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   5056                     161 _modificarPuntuacion::
   5056 DD E5         [15]  162 	push	ix
   5058 DD 21 00 00   [14]  163 	ld	ix,#0
   505C DD 39         [15]  164 	add	ix,sp
   505E 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   505F DD 5E 04      [19]  167 	ld	e,4 (ix)
   5062 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   5065 D5            [11]  170 	push	de
   5066 21 19 07      [10]  171 	ld	hl,#0x0719
   5069 E5            [11]  172 	push	hl
   506A 21 00 0E      [10]  173 	ld	hl,#0x0E00
   506D E5            [11]  174 	push	hl
   506E CD 8E 4B      [17]  175 	call	_borrarPantalla
   5071 F1            [10]  176 	pop	af
   5072 F1            [10]  177 	pop	af
   5073 21 00 0E      [10]  178 	ld	hl,#0x0E00
   5076 E5            [11]  179 	push	hl
   5077 26 C0         [ 7]  180 	ld	h, #0xC0
   5079 E5            [11]  181 	push	hl
   507A CD 7F 5E      [17]  182 	call	_cpct_getScreenPtr
   507D 4D            [ 4]  183 	ld	c,l
   507E 44            [ 4]  184 	ld	b,h
   507F D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   5080 C5            [11]  187 	push	bc
   5081 D5            [11]  188 	push	de
   5082 21 0A 00      [10]  189 	ld	hl,#0x000A
   5085 E5            [11]  190 	push	hl
   5086 D5            [11]  191 	push	de
   5087 CD 74 5E      [17]  192 	call	__moduint
   508A F1            [10]  193 	pop	af
   508B F1            [10]  194 	pop	af
   508C D1            [10]  195 	pop	de
   508D C1            [10]  196 	pop	bc
   508E 7D            [ 4]  197 	ld	a,l
   508F C6 30         [ 7]  198 	add	a, #0x30
   5091 DD 77 FF      [19]  199 	ld	-1 (ix),a
   5094 C5            [11]  200 	push	bc
   5095 FD E1         [14]  201 	pop	iy
   5097 C5            [11]  202 	push	bc
   5098 D5            [11]  203 	push	de
   5099 DD 7E FF      [19]  204 	ld	a,-1 (ix)
   509C F5            [11]  205 	push	af
   509D 33            [ 6]  206 	inc	sp
   509E 21 02 00      [10]  207 	ld	hl,#0x0002
   50A1 E5            [11]  208 	push	hl
   50A2 FD E5         [15]  209 	push	iy
   50A4 CD F0 53      [17]  210 	call	_cpct_drawCharM0
   50A7 F1            [10]  211 	pop	af
   50A8 F1            [10]  212 	pop	af
   50A9 33            [ 6]  213 	inc	sp
   50AA D1            [10]  214 	pop	de
   50AB 21 E8 03      [10]  215 	ld	hl,#0x03E8
   50AE E5            [11]  216 	push	hl
   50AF D5            [11]  217 	push	de
   50B0 CD BE 51      [17]  218 	call	__divuint
   50B3 F1            [10]  219 	pop	af
   50B4 F1            [10]  220 	pop	af
   50B5 11 0A 00      [10]  221 	ld	de,#0x000A
   50B8 D5            [11]  222 	push	de
   50B9 E5            [11]  223 	push	hl
   50BA CD 74 5E      [17]  224 	call	__moduint
   50BD F1            [10]  225 	pop	af
   50BE F1            [10]  226 	pop	af
   50BF C1            [10]  227 	pop	bc
   50C0 7D            [ 4]  228 	ld	a,l
   50C1 C6 30         [ 7]  229 	add	a, #0x30
   50C3 67            [ 4]  230 	ld	h,a
   50C4 79            [ 4]  231 	ld	a,c
   50C5 C6 04         [ 7]  232 	add	a, #0x04
   50C7 5F            [ 4]  233 	ld	e,a
   50C8 78            [ 4]  234 	ld	a,b
   50C9 CE 00         [ 7]  235 	adc	a, #0x00
   50CB 57            [ 4]  236 	ld	d,a
   50CC C5            [11]  237 	push	bc
   50CD E5            [11]  238 	push	hl
   50CE 33            [ 6]  239 	inc	sp
   50CF 21 02 00      [10]  240 	ld	hl,#0x0002
   50D2 E5            [11]  241 	push	hl
   50D3 D5            [11]  242 	push	de
   50D4 CD F0 53      [17]  243 	call	_cpct_drawCharM0
   50D7 F1            [10]  244 	pop	af
   50D8 33            [ 6]  245 	inc	sp
   50D9 21 64 00      [10]  246 	ld	hl,#0x0064
   50DC E3            [19]  247 	ex	(sp),hl
   50DD DD 6E 04      [19]  248 	ld	l,4 (ix)
   50E0 DD 66 05      [19]  249 	ld	h,5 (ix)
   50E3 E5            [11]  250 	push	hl
   50E4 CD BE 51      [17]  251 	call	__divuint
   50E7 F1            [10]  252 	pop	af
   50E8 F1            [10]  253 	pop	af
   50E9 11 0A 00      [10]  254 	ld	de,#0x000A
   50EC D5            [11]  255 	push	de
   50ED E5            [11]  256 	push	hl
   50EE CD 74 5E      [17]  257 	call	__moduint
   50F1 F1            [10]  258 	pop	af
   50F2 F1            [10]  259 	pop	af
   50F3 C1            [10]  260 	pop	bc
   50F4 7D            [ 4]  261 	ld	a,l
   50F5 C6 30         [ 7]  262 	add	a, #0x30
   50F7 67            [ 4]  263 	ld	h,a
   50F8 79            [ 4]  264 	ld	a,c
   50F9 C6 08         [ 7]  265 	add	a, #0x08
   50FB 5F            [ 4]  266 	ld	e,a
   50FC 78            [ 4]  267 	ld	a,b
   50FD CE 00         [ 7]  268 	adc	a, #0x00
   50FF 57            [ 4]  269 	ld	d,a
   5100 C5            [11]  270 	push	bc
   5101 E5            [11]  271 	push	hl
   5102 33            [ 6]  272 	inc	sp
   5103 21 02 00      [10]  273 	ld	hl,#0x0002
   5106 E5            [11]  274 	push	hl
   5107 D5            [11]  275 	push	de
   5108 CD F0 53      [17]  276 	call	_cpct_drawCharM0
   510B F1            [10]  277 	pop	af
   510C 33            [ 6]  278 	inc	sp
   510D 21 0A 00      [10]  279 	ld	hl,#0x000A
   5110 E3            [19]  280 	ex	(sp),hl
   5111 DD 6E 04      [19]  281 	ld	l,4 (ix)
   5114 DD 66 05      [19]  282 	ld	h,5 (ix)
   5117 E5            [11]  283 	push	hl
   5118 CD BE 51      [17]  284 	call	__divuint
   511B F1            [10]  285 	pop	af
   511C F1            [10]  286 	pop	af
   511D 11 0A 00      [10]  287 	ld	de,#0x000A
   5120 D5            [11]  288 	push	de
   5121 E5            [11]  289 	push	hl
   5122 CD 74 5E      [17]  290 	call	__moduint
   5125 F1            [10]  291 	pop	af
   5126 F1            [10]  292 	pop	af
   5127 C1            [10]  293 	pop	bc
   5128 7D            [ 4]  294 	ld	a,l
   5129 C6 30         [ 7]  295 	add	a, #0x30
   512B 67            [ 4]  296 	ld	h,a
   512C 79            [ 4]  297 	ld	a,c
   512D C6 0C         [ 7]  298 	add	a, #0x0C
   512F 5F            [ 4]  299 	ld	e,a
   5130 78            [ 4]  300 	ld	a,b
   5131 CE 00         [ 7]  301 	adc	a, #0x00
   5133 57            [ 4]  302 	ld	d,a
   5134 C5            [11]  303 	push	bc
   5135 E5            [11]  304 	push	hl
   5136 33            [ 6]  305 	inc	sp
   5137 21 02 00      [10]  306 	ld	hl,#0x0002
   513A E5            [11]  307 	push	hl
   513B D5            [11]  308 	push	de
   513C CD F0 53      [17]  309 	call	_cpct_drawCharM0
   513F F1            [10]  310 	pop	af
   5140 F1            [10]  311 	pop	af
   5141 33            [ 6]  312 	inc	sp
   5142 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   5143 21 10 00      [10]  315 	ld	hl,#0x0010
   5146 09            [11]  316 	add	hl,bc
   5147 4D            [ 4]  317 	ld	c,l
   5148 44            [ 4]  318 	ld	b,h
   5149 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   514C F5            [11]  320 	push	af
   514D 33            [ 6]  321 	inc	sp
   514E 21 02 00      [10]  322 	ld	hl,#0x0002
   5151 E5            [11]  323 	push	hl
   5152 C5            [11]  324 	push	bc
   5153 CD F0 53      [17]  325 	call	_cpct_drawCharM0
   5156 F1            [10]  326 	pop	af
   5157 F1            [10]  327 	pop	af
   5158 33            [ 6]  328 	inc	sp
   5159 33            [ 6]  329 	inc	sp
   515A DD E1         [14]  330 	pop	ix
   515C C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   515D                     336 _modificarVidas::
   515D DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   515F 01 00 00      [10]  339 	ld	bc,#0x0000
   5162                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   5162 79            [ 4]  342 	ld	a,c
   5163 87            [ 4]  343 	add	a, a
   5164 87            [ 4]  344 	add	a, a
   5165 C6 3C         [ 7]  345 	add	a, #0x3C
   5167 57            [ 4]  346 	ld	d,a
   5168 C5            [11]  347 	push	bc
   5169 3E 0E         [ 7]  348 	ld	a,#0x0E
   516B F5            [11]  349 	push	af
   516C 33            [ 6]  350 	inc	sp
   516D D5            [11]  351 	push	de
   516E 33            [ 6]  352 	inc	sp
   516F 21 00 C0      [10]  353 	ld	hl,#0xC000
   5172 E5            [11]  354 	push	hl
   5173 CD 7F 5E      [17]  355 	call	_cpct_getScreenPtr
   5176 EB            [ 4]  356 	ex	de,hl
   5177 21 03 06      [10]  357 	ld	hl,#0x0603
   517A E5            [11]  358 	push	hl
   517B D5            [11]  359 	push	de
   517C 21 28 3C      [10]  360 	ld	hl,#_g_heart
   517F E5            [11]  361 	push	hl
   5180 CD BC 52      [17]  362 	call	_cpct_drawSprite
   5183 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   5184 03            [ 6]  365 	inc	bc
   5185 79            [ 4]  366 	ld	a,c
   5186 D6 05         [ 7]  367 	sub	a, #0x05
   5188 78            [ 4]  368 	ld	a,b
   5189 17            [ 4]  369 	rla
   518A 3F            [ 4]  370 	ccf
   518B 1F            [ 4]  371 	rra
   518C DE 80         [ 7]  372 	sbc	a, #0x80
   518E 38 D2         [12]  373 	jr	C,00102$
   5190 DD E1         [14]  374 	pop	ix
   5192 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   5193                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   5193 FD 21 02 00   [14]  382 	ld	iy,#2
   5197 FD 39         [15]  383 	add	iy,sp
   5199 FD 7E 00      [19]  384 	ld	a,0 (iy)
   519C C6 0A         [ 7]  385 	add	a, #0x0A
   519E 6F            [ 4]  386 	ld	l, a
   519F FD 7E 01      [19]  387 	ld	a, 1 (iy)
   51A2 CE 00         [ 7]  388 	adc	a, #0x00
   51A4 67            [ 4]  389 	ld	h, a
   51A5 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   51A6                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   51A6 21 02 00      [10]  397 	ld	hl, #2+0
   51A9 39            [11]  398 	add	hl, sp
   51AA 4E            [ 7]  399 	ld	c, (hl)
   51AB 0D            [ 4]  400 	dec	c
   51AC 69            [ 4]  401 	ld	l,c
   51AD C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
