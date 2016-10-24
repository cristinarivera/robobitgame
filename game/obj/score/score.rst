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
   7BCC                      56 _barraPuntuacionInicial::
                             57 ;src/score/score.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   7BCC 21 00 02      [10]   58 	ld	hl,#0x0200
   7BCF E5            [11]   59 	push	hl
   7BD0 26 C0         [ 7]   60 	ld	h, #0xC0
   7BD2 E5            [11]   61 	push	hl
   7BD3 CD 91 8A      [17]   62 	call	_cpct_getScreenPtr
   7BD6 4D            [ 4]   63 	ld	c,l
   7BD7 44            [ 4]   64 	ld	b,h
                             65 ;src/score/score.c:11: cpct_drawStringM0("SCORE", memptr, 1, 0);
   7BD8 21 01 00      [10]   66 	ld	hl,#0x0001
   7BDB E5            [11]   67 	push	hl
   7BDC C5            [11]   68 	push	bc
   7BDD 21 56 7C      [10]   69 	ld	hl,#___str_0
   7BE0 E5            [11]   70 	push	hl
   7BE1 CD AA 7E      [17]   71 	call	_cpct_drawStringM0
   7BE4 21 06 00      [10]   72 	ld	hl,#6
   7BE7 39            [11]   73 	add	hl,sp
   7BE8 F9            [ 6]   74 	ld	sp,hl
                             75 ;src/score/score.c:12: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   7BE9 21 00 0E      [10]   76 	ld	hl,#0x0E00
   7BEC E5            [11]   77 	push	hl
   7BED 26 C0         [ 7]   78 	ld	h, #0xC0
   7BEF E5            [11]   79 	push	hl
   7BF0 CD 91 8A      [17]   80 	call	_cpct_getScreenPtr
   7BF3 4D            [ 4]   81 	ld	c,l
   7BF4 44            [ 4]   82 	ld	b,h
                             83 ;src/score/score.c:13: cpct_drawStringM0("00000", memptr, 15, 0);
   7BF5 21 0F 00      [10]   84 	ld	hl,#0x000F
   7BF8 E5            [11]   85 	push	hl
   7BF9 C5            [11]   86 	push	bc
   7BFA 21 5C 7C      [10]   87 	ld	hl,#___str_1
   7BFD E5            [11]   88 	push	hl
   7BFE CD AA 7E      [17]   89 	call	_cpct_drawStringM0
   7C01 21 06 00      [10]   90 	ld	hl,#6
   7C04 39            [11]   91 	add	hl,sp
   7C05 F9            [ 6]   92 	ld	sp,hl
                             93 ;src/score/score.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   7C06 21 3C 02      [10]   94 	ld	hl,#0x023C
   7C09 E5            [11]   95 	push	hl
   7C0A 21 00 C0      [10]   96 	ld	hl,#0xC000
   7C0D E5            [11]   97 	push	hl
   7C0E CD 91 8A      [17]   98 	call	_cpct_getScreenPtr
   7C11 4D            [ 4]   99 	ld	c,l
   7C12 44            [ 4]  100 	ld	b,h
                            101 ;src/score/score.c:16: cpct_drawStringM0("LIVES", memptr, 1, 0);
   7C13 21 01 00      [10]  102 	ld	hl,#0x0001
   7C16 E5            [11]  103 	push	hl
   7C17 C5            [11]  104 	push	bc
   7C18 21 62 7C      [10]  105 	ld	hl,#___str_2
   7C1B E5            [11]  106 	push	hl
   7C1C CD AA 7E      [17]  107 	call	_cpct_drawStringM0
   7C1F 21 06 00      [10]  108 	ld	hl,#6
   7C22 39            [11]  109 	add	hl,sp
   7C23 F9            [ 6]  110 	ld	sp,hl
                            111 ;src/score/score.c:18: for(i=0; i<5; i++){
   7C24 01 00 00      [10]  112 	ld	bc,#0x0000
   7C27                     113 00102$:
                            114 ;src/score/score.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   7C27 79            [ 4]  115 	ld	a,c
   7C28 87            [ 4]  116 	add	a, a
   7C29 87            [ 4]  117 	add	a, a
   7C2A C6 3C         [ 7]  118 	add	a, #0x3C
   7C2C 57            [ 4]  119 	ld	d,a
   7C2D C5            [11]  120 	push	bc
   7C2E 3E 0E         [ 7]  121 	ld	a,#0x0E
   7C30 F5            [11]  122 	push	af
   7C31 33            [ 6]  123 	inc	sp
   7C32 D5            [11]  124 	push	de
   7C33 33            [ 6]  125 	inc	sp
   7C34 21 00 C0      [10]  126 	ld	hl,#0xC000
   7C37 E5            [11]  127 	push	hl
   7C38 CD 91 8A      [17]  128 	call	_cpct_getScreenPtr
   7C3B EB            [ 4]  129 	ex	de,hl
   7C3C 21 03 06      [10]  130 	ld	hl,#0x0603
   7C3F E5            [11]  131 	push	hl
   7C40 D5            [11]  132 	push	de
   7C41 21 28 6E      [10]  133 	ld	hl,#_g_heart
   7C44 E5            [11]  134 	push	hl
   7C45 CD CE 7E      [17]  135 	call	_cpct_drawSprite
   7C48 C1            [10]  136 	pop	bc
                            137 ;src/score/score.c:18: for(i=0; i<5; i++){
   7C49 03            [ 6]  138 	inc	bc
   7C4A 79            [ 4]  139 	ld	a,c
   7C4B D6 05         [ 7]  140 	sub	a, #0x05
   7C4D 78            [ 4]  141 	ld	a,b
   7C4E 17            [ 4]  142 	rla
   7C4F 3F            [ 4]  143 	ccf
   7C50 1F            [ 4]  144 	rra
   7C51 DE 80         [ 7]  145 	sbc	a, #0x80
   7C53 38 D2         [12]  146 	jr	C,00102$
   7C55 C9            [10]  147 	ret
   7C56                     148 ___str_0:
   7C56 53 43 4F 52 45      149 	.ascii "SCORE"
   7C5B 00                  150 	.db 0x00
   7C5C                     151 ___str_1:
   7C5C 30 30 30 30 30      152 	.ascii "00000"
   7C61 00                  153 	.db 0x00
   7C62                     154 ___str_2:
   7C62 4C 49 56 45 53      155 	.ascii "LIVES"
   7C67 00                  156 	.db 0x00
                            157 ;src/score/score.c:24: void modificarPuntuacion(u16 puntuacion){
                            158 ;	---------------------------------
                            159 ; Function modificarPuntuacion
                            160 ; ---------------------------------
   7C68                     161 _modificarPuntuacion::
   7C68 DD E5         [15]  162 	push	ix
   7C6A DD 21 00 00   [14]  163 	ld	ix,#0
   7C6E DD 39         [15]  164 	add	ix,sp
   7C70 3B            [ 6]  165 	dec	sp
                            166 ;src/score/score.c:26: u16 puntuacion_aux = puntuacion;
   7C71 DD 5E 04      [19]  167 	ld	e,4 (ix)
   7C74 DD 56 05      [19]  168 	ld	d,5 (ix)
                            169 ;src/score/score.c:27: borrarPantalla(0, 14, 25, 7);
   7C77 D5            [11]  170 	push	de
   7C78 21 19 07      [10]  171 	ld	hl,#0x0719
   7C7B E5            [11]  172 	push	hl
   7C7C 21 00 0E      [10]  173 	ld	hl,#0x0E00
   7C7F E5            [11]  174 	push	hl
   7C80 CD A0 77      [17]  175 	call	_borrarPantalla
   7C83 F1            [10]  176 	pop	af
   7C84 F1            [10]  177 	pop	af
   7C85 21 00 0E      [10]  178 	ld	hl,#0x0E00
   7C88 E5            [11]  179 	push	hl
   7C89 26 C0         [ 7]  180 	ld	h, #0xC0
   7C8B E5            [11]  181 	push	hl
   7C8C CD 91 8A      [17]  182 	call	_cpct_getScreenPtr
   7C8F 4D            [ 4]  183 	ld	c,l
   7C90 44            [ 4]  184 	ld	b,h
   7C91 D1            [10]  185 	pop	de
                            186 ;src/score/score.c:30: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   7C92 C5            [11]  187 	push	bc
   7C93 D5            [11]  188 	push	de
   7C94 21 0A 00      [10]  189 	ld	hl,#0x000A
   7C97 E5            [11]  190 	push	hl
   7C98 D5            [11]  191 	push	de
   7C99 CD 86 8A      [17]  192 	call	__moduint
   7C9C F1            [10]  193 	pop	af
   7C9D F1            [10]  194 	pop	af
   7C9E D1            [10]  195 	pop	de
   7C9F C1            [10]  196 	pop	bc
   7CA0 7D            [ 4]  197 	ld	a,l
   7CA1 C6 30         [ 7]  198 	add	a, #0x30
   7CA3 DD 77 FF      [19]  199 	ld	-1 (ix),a
   7CA6 C5            [11]  200 	push	bc
   7CA7 FD E1         [14]  201 	pop	iy
   7CA9 C5            [11]  202 	push	bc
   7CAA D5            [11]  203 	push	de
   7CAB DD 7E FF      [19]  204 	ld	a,-1 (ix)
   7CAE F5            [11]  205 	push	af
   7CAF 33            [ 6]  206 	inc	sp
   7CB0 21 02 00      [10]  207 	ld	hl,#0x0002
   7CB3 E5            [11]  208 	push	hl
   7CB4 FD E5         [15]  209 	push	iy
   7CB6 CD 02 80      [17]  210 	call	_cpct_drawCharM0
   7CB9 F1            [10]  211 	pop	af
   7CBA F1            [10]  212 	pop	af
   7CBB 33            [ 6]  213 	inc	sp
   7CBC D1            [10]  214 	pop	de
   7CBD 21 E8 03      [10]  215 	ld	hl,#0x03E8
   7CC0 E5            [11]  216 	push	hl
   7CC1 D5            [11]  217 	push	de
   7CC2 CD D0 7D      [17]  218 	call	__divuint
   7CC5 F1            [10]  219 	pop	af
   7CC6 F1            [10]  220 	pop	af
   7CC7 11 0A 00      [10]  221 	ld	de,#0x000A
   7CCA D5            [11]  222 	push	de
   7CCB E5            [11]  223 	push	hl
   7CCC CD 86 8A      [17]  224 	call	__moduint
   7CCF F1            [10]  225 	pop	af
   7CD0 F1            [10]  226 	pop	af
   7CD1 C1            [10]  227 	pop	bc
   7CD2 7D            [ 4]  228 	ld	a,l
   7CD3 C6 30         [ 7]  229 	add	a, #0x30
   7CD5 67            [ 4]  230 	ld	h,a
   7CD6 79            [ 4]  231 	ld	a,c
   7CD7 C6 04         [ 7]  232 	add	a, #0x04
   7CD9 5F            [ 4]  233 	ld	e,a
   7CDA 78            [ 4]  234 	ld	a,b
   7CDB CE 00         [ 7]  235 	adc	a, #0x00
   7CDD 57            [ 4]  236 	ld	d,a
   7CDE C5            [11]  237 	push	bc
   7CDF E5            [11]  238 	push	hl
   7CE0 33            [ 6]  239 	inc	sp
   7CE1 21 02 00      [10]  240 	ld	hl,#0x0002
   7CE4 E5            [11]  241 	push	hl
   7CE5 D5            [11]  242 	push	de
   7CE6 CD 02 80      [17]  243 	call	_cpct_drawCharM0
   7CE9 F1            [10]  244 	pop	af
   7CEA 33            [ 6]  245 	inc	sp
   7CEB 21 64 00      [10]  246 	ld	hl,#0x0064
   7CEE E3            [19]  247 	ex	(sp),hl
   7CEF DD 6E 04      [19]  248 	ld	l,4 (ix)
   7CF2 DD 66 05      [19]  249 	ld	h,5 (ix)
   7CF5 E5            [11]  250 	push	hl
   7CF6 CD D0 7D      [17]  251 	call	__divuint
   7CF9 F1            [10]  252 	pop	af
   7CFA F1            [10]  253 	pop	af
   7CFB 11 0A 00      [10]  254 	ld	de,#0x000A
   7CFE D5            [11]  255 	push	de
   7CFF E5            [11]  256 	push	hl
   7D00 CD 86 8A      [17]  257 	call	__moduint
   7D03 F1            [10]  258 	pop	af
   7D04 F1            [10]  259 	pop	af
   7D05 C1            [10]  260 	pop	bc
   7D06 7D            [ 4]  261 	ld	a,l
   7D07 C6 30         [ 7]  262 	add	a, #0x30
   7D09 67            [ 4]  263 	ld	h,a
   7D0A 79            [ 4]  264 	ld	a,c
   7D0B C6 08         [ 7]  265 	add	a, #0x08
   7D0D 5F            [ 4]  266 	ld	e,a
   7D0E 78            [ 4]  267 	ld	a,b
   7D0F CE 00         [ 7]  268 	adc	a, #0x00
   7D11 57            [ 4]  269 	ld	d,a
   7D12 C5            [11]  270 	push	bc
   7D13 E5            [11]  271 	push	hl
   7D14 33            [ 6]  272 	inc	sp
   7D15 21 02 00      [10]  273 	ld	hl,#0x0002
   7D18 E5            [11]  274 	push	hl
   7D19 D5            [11]  275 	push	de
   7D1A CD 02 80      [17]  276 	call	_cpct_drawCharM0
   7D1D F1            [10]  277 	pop	af
   7D1E 33            [ 6]  278 	inc	sp
   7D1F 21 0A 00      [10]  279 	ld	hl,#0x000A
   7D22 E3            [19]  280 	ex	(sp),hl
   7D23 DD 6E 04      [19]  281 	ld	l,4 (ix)
   7D26 DD 66 05      [19]  282 	ld	h,5 (ix)
   7D29 E5            [11]  283 	push	hl
   7D2A CD D0 7D      [17]  284 	call	__divuint
   7D2D F1            [10]  285 	pop	af
   7D2E F1            [10]  286 	pop	af
   7D2F 11 0A 00      [10]  287 	ld	de,#0x000A
   7D32 D5            [11]  288 	push	de
   7D33 E5            [11]  289 	push	hl
   7D34 CD 86 8A      [17]  290 	call	__moduint
   7D37 F1            [10]  291 	pop	af
   7D38 F1            [10]  292 	pop	af
   7D39 C1            [10]  293 	pop	bc
   7D3A 7D            [ 4]  294 	ld	a,l
   7D3B C6 30         [ 7]  295 	add	a, #0x30
   7D3D 67            [ 4]  296 	ld	h,a
   7D3E 79            [ 4]  297 	ld	a,c
   7D3F C6 0C         [ 7]  298 	add	a, #0x0C
   7D41 5F            [ 4]  299 	ld	e,a
   7D42 78            [ 4]  300 	ld	a,b
   7D43 CE 00         [ 7]  301 	adc	a, #0x00
   7D45 57            [ 4]  302 	ld	d,a
   7D46 C5            [11]  303 	push	bc
   7D47 E5            [11]  304 	push	hl
   7D48 33            [ 6]  305 	inc	sp
   7D49 21 02 00      [10]  306 	ld	hl,#0x0002
   7D4C E5            [11]  307 	push	hl
   7D4D D5            [11]  308 	push	de
   7D4E CD 02 80      [17]  309 	call	_cpct_drawCharM0
   7D51 F1            [10]  310 	pop	af
   7D52 F1            [10]  311 	pop	af
   7D53 33            [ 6]  312 	inc	sp
   7D54 C1            [10]  313 	pop	bc
                            314 ;src/score/score.c:38: cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);
   7D55 21 10 00      [10]  315 	ld	hl,#0x0010
   7D58 09            [11]  316 	add	hl,bc
   7D59 4D            [ 4]  317 	ld	c,l
   7D5A 44            [ 4]  318 	ld	b,h
   7D5B DD 7E FF      [19]  319 	ld	a,-1 (ix)
   7D5E F5            [11]  320 	push	af
   7D5F 33            [ 6]  321 	inc	sp
   7D60 21 02 00      [10]  322 	ld	hl,#0x0002
   7D63 E5            [11]  323 	push	hl
   7D64 C5            [11]  324 	push	bc
   7D65 CD 02 80      [17]  325 	call	_cpct_drawCharM0
   7D68 F1            [10]  326 	pop	af
   7D69 F1            [10]  327 	pop	af
   7D6A 33            [ 6]  328 	inc	sp
   7D6B 33            [ 6]  329 	inc	sp
   7D6C DD E1         [14]  330 	pop	ix
   7D6E C9            [10]  331 	ret
                            332 ;src/score/score.c:42: void modificarVidas(u8 vidas){
                            333 ;	---------------------------------
                            334 ; Function modificarVidas
                            335 ; ---------------------------------
   7D6F                     336 _modificarVidas::
   7D6F DD E5         [15]  337 	push	ix
                            338 ;src/score/score.c:46: for(i=0; i<5; i++){
   7D71 01 00 00      [10]  339 	ld	bc,#0x0000
   7D74                     340 00102$:
                            341 ;src/score/score.c:47: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   7D74 79            [ 4]  342 	ld	a,c
   7D75 87            [ 4]  343 	add	a, a
   7D76 87            [ 4]  344 	add	a, a
   7D77 C6 3C         [ 7]  345 	add	a, #0x3C
   7D79 57            [ 4]  346 	ld	d,a
   7D7A C5            [11]  347 	push	bc
   7D7B 3E 0E         [ 7]  348 	ld	a,#0x0E
   7D7D F5            [11]  349 	push	af
   7D7E 33            [ 6]  350 	inc	sp
   7D7F D5            [11]  351 	push	de
   7D80 33            [ 6]  352 	inc	sp
   7D81 21 00 C0      [10]  353 	ld	hl,#0xC000
   7D84 E5            [11]  354 	push	hl
   7D85 CD 91 8A      [17]  355 	call	_cpct_getScreenPtr
   7D88 EB            [ 4]  356 	ex	de,hl
   7D89 21 03 06      [10]  357 	ld	hl,#0x0603
   7D8C E5            [11]  358 	push	hl
   7D8D D5            [11]  359 	push	de
   7D8E 21 28 6E      [10]  360 	ld	hl,#_g_heart
   7D91 E5            [11]  361 	push	hl
   7D92 CD CE 7E      [17]  362 	call	_cpct_drawSprite
   7D95 C1            [10]  363 	pop	bc
                            364 ;src/score/score.c:46: for(i=0; i<5; i++){
   7D96 03            [ 6]  365 	inc	bc
   7D97 79            [ 4]  366 	ld	a,c
   7D98 D6 05         [ 7]  367 	sub	a, #0x05
   7D9A 78            [ 4]  368 	ld	a,b
   7D9B 17            [ 4]  369 	rla
   7D9C 3F            [ 4]  370 	ccf
   7D9D 1F            [ 4]  371 	rra
   7D9E DE 80         [ 7]  372 	sbc	a, #0x80
   7DA0 38 D2         [12]  373 	jr	C,00102$
   7DA2 DD E1         [14]  374 	pop	ix
   7DA4 C9            [10]  375 	ret
                            376 ;src/score/score.c:52: u16 aumentarPuntuacion(u16 puntuacion){
                            377 ;	---------------------------------
                            378 ; Function aumentarPuntuacion
                            379 ; ---------------------------------
   7DA5                     380 _aumentarPuntuacion::
                            381 ;src/score/score.c:53: return puntuacion + 10;
   7DA5 FD 21 02 00   [14]  382 	ld	iy,#2
   7DA9 FD 39         [15]  383 	add	iy,sp
   7DAB FD 7E 00      [19]  384 	ld	a,0 (iy)
   7DAE C6 0A         [ 7]  385 	add	a, #0x0A
   7DB0 6F            [ 4]  386 	ld	l, a
   7DB1 FD 7E 01      [19]  387 	ld	a, 1 (iy)
   7DB4 CE 00         [ 7]  388 	adc	a, #0x00
   7DB6 67            [ 4]  389 	ld	h, a
   7DB7 C9            [10]  390 	ret
                            391 ;src/score/score.c:56: u8 quitarVidas(u8 vidas){
                            392 ;	---------------------------------
                            393 ; Function quitarVidas
                            394 ; ---------------------------------
   7DB8                     395 _quitarVidas::
                            396 ;src/score/score.c:57: return vidas -1;
   7DB8 21 02 00      [10]  397 	ld	hl, #2+0
   7DBB 39            [11]  398 	add	hl, sp
   7DBC 4E            [ 7]  399 	ld	c, (hl)
   7DBD 0D            [ 4]  400 	dec	c
   7DBE 69            [ 4]  401 	ld	l,c
   7DBF C9            [10]  402 	ret
                            403 	.area _CODE
                            404 	.area _INITIALIZER
                            405 	.area _CABS (ABS)
