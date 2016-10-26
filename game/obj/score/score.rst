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
                             51 ;src/score/score.c:25: void barraPuntuacionInicial(){
                             52 ;	---------------------------------
                             53 ; Function barraPuntuacionInicial
                             54 ; ---------------------------------
   5021                      55 _barraPuntuacionInicial::
                             56 ;src/score/score.c:29: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   5021 21 00 02      [10]   57 	ld	hl,#0x0200
   5024 E5            [11]   58 	push	hl
   5025 26 C0         [ 7]   59 	ld	h, #0xC0
   5027 E5            [11]   60 	push	hl
   5028 CD 0B 5F      [17]   61 	call	_cpct_getScreenPtr
   502B 4D            [ 4]   62 	ld	c,l
   502C 44            [ 4]   63 	ld	b,h
                             64 ;src/score/score.c:30: cpct_drawStringM0("SCORE", memptr, 1, 0);
   502D 21 01 00      [10]   65 	ld	hl,#0x0001
   5030 E5            [11]   66 	push	hl
   5031 C5            [11]   67 	push	bc
   5032 21 AB 50      [10]   68 	ld	hl,#___str_0
   5035 E5            [11]   69 	push	hl
   5036 CD 24 53      [17]   70 	call	_cpct_drawStringM0
   5039 21 06 00      [10]   71 	ld	hl,#6
   503C 39            [11]   72 	add	hl,sp
   503D F9            [ 6]   73 	ld	sp,hl
                             74 ;src/score/score.c:31: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   503E 21 00 0E      [10]   75 	ld	hl,#0x0E00
   5041 E5            [11]   76 	push	hl
   5042 26 C0         [ 7]   77 	ld	h, #0xC0
   5044 E5            [11]   78 	push	hl
   5045 CD 0B 5F      [17]   79 	call	_cpct_getScreenPtr
   5048 4D            [ 4]   80 	ld	c,l
   5049 44            [ 4]   81 	ld	b,h
                             82 ;src/score/score.c:32: cpct_drawStringM0("00000", memptr, 15, 0);
   504A 21 0F 00      [10]   83 	ld	hl,#0x000F
   504D E5            [11]   84 	push	hl
   504E C5            [11]   85 	push	bc
   504F 21 B1 50      [10]   86 	ld	hl,#___str_1
   5052 E5            [11]   87 	push	hl
   5053 CD 24 53      [17]   88 	call	_cpct_drawStringM0
   5056 21 06 00      [10]   89 	ld	hl,#6
   5059 39            [11]   90 	add	hl,sp
   505A F9            [ 6]   91 	ld	sp,hl
                             92 ;src/score/score.c:34: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   505B 21 3C 02      [10]   93 	ld	hl,#0x023C
   505E E5            [11]   94 	push	hl
   505F 21 00 C0      [10]   95 	ld	hl,#0xC000
   5062 E5            [11]   96 	push	hl
   5063 CD 0B 5F      [17]   97 	call	_cpct_getScreenPtr
   5066 4D            [ 4]   98 	ld	c,l
   5067 44            [ 4]   99 	ld	b,h
                            100 ;src/score/score.c:35: cpct_drawStringM0("LIVES", memptr, 1, 0);
   5068 21 01 00      [10]  101 	ld	hl,#0x0001
   506B E5            [11]  102 	push	hl
   506C C5            [11]  103 	push	bc
   506D 21 B7 50      [10]  104 	ld	hl,#___str_2
   5070 E5            [11]  105 	push	hl
   5071 CD 24 53      [17]  106 	call	_cpct_drawStringM0
   5074 21 06 00      [10]  107 	ld	hl,#6
   5077 39            [11]  108 	add	hl,sp
   5078 F9            [ 6]  109 	ld	sp,hl
                            110 ;src/score/score.c:37: for(i=0; i<5; i++){
   5079 01 00 00      [10]  111 	ld	bc,#0x0000
   507C                     112 00102$:
                            113 ;src/score/score.c:38: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   507C 79            [ 4]  114 	ld	a,c
   507D 87            [ 4]  115 	add	a, a
   507E 87            [ 4]  116 	add	a, a
   507F C6 3C         [ 7]  117 	add	a, #0x3C
   5081 57            [ 4]  118 	ld	d,a
   5082 C5            [11]  119 	push	bc
   5083 3E 0E         [ 7]  120 	ld	a,#0x0E
   5085 F5            [11]  121 	push	af
   5086 33            [ 6]  122 	inc	sp
   5087 D5            [11]  123 	push	de
   5088 33            [ 6]  124 	inc	sp
   5089 21 00 C0      [10]  125 	ld	hl,#0xC000
   508C E5            [11]  126 	push	hl
   508D CD 0B 5F      [17]  127 	call	_cpct_getScreenPtr
   5090 EB            [ 4]  128 	ex	de,hl
   5091 21 03 06      [10]  129 	ld	hl,#0x0603
   5094 E5            [11]  130 	push	hl
   5095 D5            [11]  131 	push	de
   5096 21 28 3C      [10]  132 	ld	hl,#_g_heart
   5099 E5            [11]  133 	push	hl
   509A CD 48 53      [17]  134 	call	_cpct_drawSprite
   509D C1            [10]  135 	pop	bc
                            136 ;src/score/score.c:37: for(i=0; i<5; i++){
   509E 03            [ 6]  137 	inc	bc
   509F 79            [ 4]  138 	ld	a,c
   50A0 D6 05         [ 7]  139 	sub	a, #0x05
   50A2 78            [ 4]  140 	ld	a,b
   50A3 17            [ 4]  141 	rla
   50A4 3F            [ 4]  142 	ccf
   50A5 1F            [ 4]  143 	rra
   50A6 DE 80         [ 7]  144 	sbc	a, #0x80
   50A8 38 D2         [12]  145 	jr	C,00102$
   50AA C9            [10]  146 	ret
   50AB                     147 ___str_0:
   50AB 53 43 4F 52 45      148 	.ascii "SCORE"
   50B0 00                  149 	.db 0x00
   50B1                     150 ___str_1:
   50B1 30 30 30 30 30      151 	.ascii "00000"
   50B6 00                  152 	.db 0x00
   50B7                     153 ___str_2:
   50B7 4C 49 56 45 53      154 	.ascii "LIVES"
   50BC 00                  155 	.db 0x00
                            156 ;src/score/score.c:43: void modificarPuntuacion(u16 puntuacion){
                            157 ;	---------------------------------
                            158 ; Function modificarPuntuacion
                            159 ; ---------------------------------
   50BD                     160 _modificarPuntuacion::
   50BD DD E5         [15]  161 	push	ix
   50BF DD 21 00 00   [14]  162 	ld	ix,#0
   50C3 DD 39         [15]  163 	add	ix,sp
   50C5 3B            [ 6]  164 	dec	sp
                            165 ;src/score/score.c:45: u16 puntuacion_aux = puntuacion;
   50C6 DD 5E 04      [19]  166 	ld	e,4 (ix)
   50C9 DD 56 05      [19]  167 	ld	d,5 (ix)
                            168 ;src/score/score.c:46: borrarPantalla(0, 14, 25, 7);
   50CC D5            [11]  169 	push	de
   50CD 21 19 07      [10]  170 	ld	hl,#0x0719
   50D0 E5            [11]  171 	push	hl
   50D1 21 00 0E      [10]  172 	ld	hl,#0x0E00
   50D4 E5            [11]  173 	push	hl
   50D5 CD F5 4B      [17]  174 	call	_borrarPantalla
   50D8 F1            [10]  175 	pop	af
   50D9 F1            [10]  176 	pop	af
   50DA 21 00 0E      [10]  177 	ld	hl,#0x0E00
   50DD E5            [11]  178 	push	hl
   50DE 26 C0         [ 7]  179 	ld	h, #0xC0
   50E0 E5            [11]  180 	push	hl
   50E1 CD 0B 5F      [17]  181 	call	_cpct_getScreenPtr
   50E4 4D            [ 4]  182 	ld	c,l
   50E5 44            [ 4]  183 	ld	b,h
   50E6 D1            [10]  184 	pop	de
                            185 ;src/score/score.c:49: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   50E7 C5            [11]  186 	push	bc
   50E8 D5            [11]  187 	push	de
   50E9 21 0A 00      [10]  188 	ld	hl,#0x000A
   50EC E5            [11]  189 	push	hl
   50ED D5            [11]  190 	push	de
   50EE CD 19 55      [17]  191 	call	__moduint
   50F1 F1            [10]  192 	pop	af
   50F2 F1            [10]  193 	pop	af
   50F3 D1            [10]  194 	pop	de
   50F4 C1            [10]  195 	pop	bc
   50F5 7D            [ 4]  196 	ld	a,l
   50F6 C6 30         [ 7]  197 	add	a, #0x30
   50F8 DD 77 FF      [19]  198 	ld	-1 (ix),a
   50FB C5            [11]  199 	push	bc
   50FC FD E1         [14]  200 	pop	iy
   50FE C5            [11]  201 	push	bc
   50FF D5            [11]  202 	push	de
   5100 DD 7E FF      [19]  203 	ld	a,-1 (ix)
   5103 F5            [11]  204 	push	af
   5104 33            [ 6]  205 	inc	sp
   5105 21 02 00      [10]  206 	ld	hl,#0x0002
   5108 E5            [11]  207 	push	hl
   5109 FD E5         [15]  208 	push	iy
   510B CD 80 54      [17]  209 	call	_cpct_drawCharM0
   510E F1            [10]  210 	pop	af
   510F F1            [10]  211 	pop	af
   5110 33            [ 6]  212 	inc	sp
   5111 D1            [10]  213 	pop	de
   5112 21 E8 03      [10]  214 	ld	hl,#0x03E8
   5115 E5            [11]  215 	push	hl
   5116 D5            [11]  216 	push	de
   5117 CD 4A 52      [17]  217 	call	__divuint
   511A F1            [10]  218 	pop	af
   511B F1            [10]  219 	pop	af
   511C 11 0A 00      [10]  220 	ld	de,#0x000A
   511F D5            [11]  221 	push	de
   5120 E5            [11]  222 	push	hl
   5121 CD 19 55      [17]  223 	call	__moduint
   5124 F1            [10]  224 	pop	af
   5125 F1            [10]  225 	pop	af
   5126 C1            [10]  226 	pop	bc
   5127 7D            [ 4]  227 	ld	a,l
   5128 C6 30         [ 7]  228 	add	a, #0x30
   512A 67            [ 4]  229 	ld	h,a
   512B 79            [ 4]  230 	ld	a,c
   512C C6 04         [ 7]  231 	add	a, #0x04
   512E 5F            [ 4]  232 	ld	e,a
   512F 78            [ 4]  233 	ld	a,b
   5130 CE 00         [ 7]  234 	adc	a, #0x00
   5132 57            [ 4]  235 	ld	d,a
   5133 C5            [11]  236 	push	bc
   5134 E5            [11]  237 	push	hl
   5135 33            [ 6]  238 	inc	sp
   5136 21 02 00      [10]  239 	ld	hl,#0x0002
   5139 E5            [11]  240 	push	hl
   513A D5            [11]  241 	push	de
   513B CD 80 54      [17]  242 	call	_cpct_drawCharM0
   513E F1            [10]  243 	pop	af
   513F 33            [ 6]  244 	inc	sp
   5140 21 64 00      [10]  245 	ld	hl,#0x0064
   5143 E3            [19]  246 	ex	(sp),hl
   5144 DD 6E 04      [19]  247 	ld	l,4 (ix)
   5147 DD 66 05      [19]  248 	ld	h,5 (ix)
   514A E5            [11]  249 	push	hl
   514B CD 4A 52      [17]  250 	call	__divuint
   514E F1            [10]  251 	pop	af
   514F F1            [10]  252 	pop	af
   5150 11 0A 00      [10]  253 	ld	de,#0x000A
   5153 D5            [11]  254 	push	de
   5154 E5            [11]  255 	push	hl
   5155 CD 19 55      [17]  256 	call	__moduint
   5158 F1            [10]  257 	pop	af
   5159 F1            [10]  258 	pop	af
   515A C1            [10]  259 	pop	bc
   515B 7D            [ 4]  260 	ld	a,l
   515C C6 30         [ 7]  261 	add	a, #0x30
   515E 67            [ 4]  262 	ld	h,a
   515F 79            [ 4]  263 	ld	a,c
   5160 C6 08         [ 7]  264 	add	a, #0x08
   5162 5F            [ 4]  265 	ld	e,a
   5163 78            [ 4]  266 	ld	a,b
   5164 CE 00         [ 7]  267 	adc	a, #0x00
   5166 57            [ 4]  268 	ld	d,a
   5167 C5            [11]  269 	push	bc
   5168 E5            [11]  270 	push	hl
   5169 33            [ 6]  271 	inc	sp
   516A 21 02 00      [10]  272 	ld	hl,#0x0002
   516D E5            [11]  273 	push	hl
   516E D5            [11]  274 	push	de
   516F CD 80 54      [17]  275 	call	_cpct_drawCharM0
   5172 F1            [10]  276 	pop	af
   5173 33            [ 6]  277 	inc	sp
   5174 21 0A 00      [10]  278 	ld	hl,#0x000A
   5177 E3            [19]  279 	ex	(sp),hl
   5178 DD 6E 04      [19]  280 	ld	l,4 (ix)
   517B DD 66 05      [19]  281 	ld	h,5 (ix)
   517E E5            [11]  282 	push	hl
   517F CD 4A 52      [17]  283 	call	__divuint
   5182 F1            [10]  284 	pop	af
   5183 F1            [10]  285 	pop	af
   5184 11 0A 00      [10]  286 	ld	de,#0x000A
   5187 D5            [11]  287 	push	de
   5188 E5            [11]  288 	push	hl
   5189 CD 19 55      [17]  289 	call	__moduint
   518C F1            [10]  290 	pop	af
   518D F1            [10]  291 	pop	af
   518E C1            [10]  292 	pop	bc
   518F 7D            [ 4]  293 	ld	a,l
   5190 C6 30         [ 7]  294 	add	a, #0x30
   5192 67            [ 4]  295 	ld	h,a
   5193 79            [ 4]  296 	ld	a,c
   5194 C6 0C         [ 7]  297 	add	a, #0x0C
   5196 5F            [ 4]  298 	ld	e,a
   5197 78            [ 4]  299 	ld	a,b
   5198 CE 00         [ 7]  300 	adc	a, #0x00
   519A 57            [ 4]  301 	ld	d,a
   519B C5            [11]  302 	push	bc
   519C E5            [11]  303 	push	hl
   519D 33            [ 6]  304 	inc	sp
   519E 21 02 00      [10]  305 	ld	hl,#0x0002
   51A1 E5            [11]  306 	push	hl
   51A2 D5            [11]  307 	push	de
   51A3 CD 80 54      [17]  308 	call	_cpct_drawCharM0
   51A6 F1            [10]  309 	pop	af
   51A7 F1            [10]  310 	pop	af
   51A8 33            [ 6]  311 	inc	sp
   51A9 C1            [10]  312 	pop	bc
                            313 ;src/score/score.c:57: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   51AA 21 10 00      [10]  314 	ld	hl,#0x0010
   51AD 09            [11]  315 	add	hl,bc
   51AE 4D            [ 4]  316 	ld	c,l
   51AF 44            [ 4]  317 	ld	b,h
   51B0 DD 7E FF      [19]  318 	ld	a,-1 (ix)
   51B3 F5            [11]  319 	push	af
   51B4 33            [ 6]  320 	inc	sp
   51B5 21 02 00      [10]  321 	ld	hl,#0x0002
   51B8 E5            [11]  322 	push	hl
   51B9 C5            [11]  323 	push	bc
   51BA CD 80 54      [17]  324 	call	_cpct_drawCharM0
   51BD F1            [10]  325 	pop	af
   51BE F1            [10]  326 	pop	af
   51BF 33            [ 6]  327 	inc	sp
   51C0 33            [ 6]  328 	inc	sp
   51C1 DD E1         [14]  329 	pop	ix
   51C3 C9            [10]  330 	ret
                            331 ;src/score/score.c:61: void modificarVidas(u8 vidas){
                            332 ;	---------------------------------
                            333 ; Function modificarVidas
                            334 ; ---------------------------------
   51C4                     335 _modificarVidas::
   51C4 DD E5         [15]  336 	push	ix
   51C6 DD 21 00 00   [14]  337 	ld	ix,#0
   51CA DD 39         [15]  338 	add	ix,sp
                            339 ;src/score/score.c:64: borrarPantalla(60, 14, 20, 6);
   51CC 21 14 06      [10]  340 	ld	hl,#0x0614
   51CF E5            [11]  341 	push	hl
   51D0 21 3C 0E      [10]  342 	ld	hl,#0x0E3C
   51D3 E5            [11]  343 	push	hl
   51D4 CD F5 4B      [17]  344 	call	_borrarPantalla
   51D7 F1            [10]  345 	pop	af
   51D8 F1            [10]  346 	pop	af
                            347 ;src/score/score.c:66: for(i = 0; i<vidas; i++){
   51D9 0E 00         [ 7]  348 	ld	c,#0x00
   51DB                     349 00105$:
   51DB 79            [ 4]  350 	ld	a,c
   51DC DD 96 04      [19]  351 	sub	a, 4 (ix)
   51DF 30 43         [12]  352 	jr	NC,00107$
                            353 ;src/score/score.c:67: if(i%20 == 0){
   51E1 C5            [11]  354 	push	bc
   51E2 3E 14         [ 7]  355 	ld	a,#0x14
   51E4 F5            [11]  356 	push	af
   51E5 33            [ 6]  357 	inc	sp
   51E6 79            [ 4]  358 	ld	a,c
   51E7 F5            [11]  359 	push	af
   51E8 33            [ 6]  360 	inc	sp
   51E9 CD 0D 55      [17]  361 	call	__moduchar
   51EC F1            [10]  362 	pop	af
   51ED C1            [10]  363 	pop	bc
   51EE 7D            [ 4]  364 	ld	a,l
   51EF B7            [ 4]  365 	or	a, a
   51F0 20 2F         [12]  366 	jr	NZ,00106$
                            367 ;src/score/score.c:68: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + (i/20)*4, 14); // dibuja 5 corazones
   51F2 C5            [11]  368 	push	bc
   51F3 3E 14         [ 7]  369 	ld	a,#0x14
   51F5 F5            [11]  370 	push	af
   51F6 33            [ 6]  371 	inc	sp
   51F7 79            [ 4]  372 	ld	a,c
   51F8 F5            [11]  373 	push	af
   51F9 33            [ 6]  374 	inc	sp
   51FA CD 52 52      [17]  375 	call	__divuchar
   51FD F1            [10]  376 	pop	af
   51FE C1            [10]  377 	pop	bc
   51FF 7D            [ 4]  378 	ld	a,l
   5200 87            [ 4]  379 	add	a, a
   5201 87            [ 4]  380 	add	a, a
   5202 C6 3C         [ 7]  381 	add	a, #0x3C
   5204 47            [ 4]  382 	ld	b,a
   5205 C5            [11]  383 	push	bc
   5206 3E 0E         [ 7]  384 	ld	a,#0x0E
   5208 F5            [11]  385 	push	af
   5209 33            [ 6]  386 	inc	sp
   520A C5            [11]  387 	push	bc
   520B 33            [ 6]  388 	inc	sp
   520C 21 00 C0      [10]  389 	ld	hl,#0xC000
   520F E5            [11]  390 	push	hl
   5210 CD 0B 5F      [17]  391 	call	_cpct_getScreenPtr
   5213 EB            [ 4]  392 	ex	de,hl
   5214 21 03 06      [10]  393 	ld	hl,#0x0603
   5217 E5            [11]  394 	push	hl
   5218 D5            [11]  395 	push	de
   5219 21 28 3C      [10]  396 	ld	hl,#_g_heart
   521C E5            [11]  397 	push	hl
   521D CD 48 53      [17]  398 	call	_cpct_drawSprite
   5220 C1            [10]  399 	pop	bc
   5221                     400 00106$:
                            401 ;src/score/score.c:66: for(i = 0; i<vidas; i++){
   5221 0C            [ 4]  402 	inc	c
   5222 18 B7         [12]  403 	jr	00105$
   5224                     404 00107$:
   5224 DD E1         [14]  405 	pop	ix
   5226 C9            [10]  406 	ret
                            407 ;src/score/score.c:74: u16 aumentarPuntuacion(u16 puntuacion){
                            408 ;	---------------------------------
                            409 ; Function aumentarPuntuacion
                            410 ; ---------------------------------
   5227                     411 _aumentarPuntuacion::
                            412 ;src/score/score.c:75: return puntuacion + 10;
   5227 FD 21 02 00   [14]  413 	ld	iy,#2
   522B FD 39         [15]  414 	add	iy,sp
   522D FD 7E 00      [19]  415 	ld	a,0 (iy)
   5230 C6 0A         [ 7]  416 	add	a, #0x0A
   5232 6F            [ 4]  417 	ld	l, a
   5233 FD 7E 01      [19]  418 	ld	a, 1 (iy)
   5236 CE 00         [ 7]  419 	adc	a, #0x00
   5238 67            [ 4]  420 	ld	h, a
   5239 C9            [10]  421 	ret
                            422 	.area _CODE
                            423 	.area _INITIALIZER
                            424 	.area _CABS (ABS)
