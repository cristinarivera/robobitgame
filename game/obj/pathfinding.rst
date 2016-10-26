                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module pathfinding
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _abs
                             12 	.globl _getTilePtr
                             13 	.globl _camino
                             14 	.globl _sol_tam
                             15 	.globl _anyadirALista
                             16 	.globl _adjacentTiles
                             17 	.globl _pathFinding
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
   6338                      25 _sol_tam::
   6338                      26 	.ds 1
   6339                      27 _camino::
   6339                      28 	.ds 200
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
                             33 ;--------------------------------------------------------
                             34 ; absolute external ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DABS (ABS)
                             37 ;--------------------------------------------------------
                             38 ; global & static initialisations
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _GSINIT
                             42 	.area _GSFINAL
                             43 	.area _GSINIT
                             44 ;--------------------------------------------------------
                             45 ; Home
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _HOME
                             49 ;--------------------------------------------------------
                             50 ; code
                             51 ;--------------------------------------------------------
                             52 	.area _CODE
                             53 ;src/pathfinding.c:28: u8 anyadirALista(u8 x, u8 y){
                             54 ;	---------------------------------
                             55 ; Function anyadirALista
                             56 ; ---------------------------------
   445C                      57 _anyadirALista::
                             58 ;src/pathfinding.c:29: u8 anyadido = 0;
   445C 0E 00         [ 7]   59 	ld	c,#0x00
                             60 ;src/pathfinding.c:31: if(sol_tam < CAMINO_TAM){
   445E 3A 38 63      [13]   61 	ld	a,(#_sol_tam + 0)
   4461 D6 C8         [ 7]   62 	sub	a, #0xC8
   4463 30 2D         [12]   63 	jr	NC,00102$
                             64 ;src/pathfinding.c:32: camino[sol_tam] = x;
   4465 01 39 63      [10]   65 	ld	bc,#_camino+0
   4468 2A 38 63      [16]   66 	ld	hl,(_sol_tam)
   446B 26 00         [ 7]   67 	ld	h,#0x00
   446D 09            [11]   68 	add	hl,bc
   446E FD 21 02 00   [14]   69 	ld	iy,#2
   4472 FD 39         [15]   70 	add	iy,sp
   4474 FD 7E 00      [19]   71 	ld	a,0 (iy)
   4477 77            [ 7]   72 	ld	(hl),a
                             73 ;src/pathfinding.c:33: sol_tam++;
   4478 21 38 63      [10]   74 	ld	hl, #_sol_tam+0
   447B 34            [11]   75 	inc	(hl)
                             76 ;src/pathfinding.c:34: camino[sol_tam] = y;
   447C 2A 38 63      [16]   77 	ld	hl,(_sol_tam)
   447F 26 00         [ 7]   78 	ld	h,#0x00
   4481 09            [11]   79 	add	hl,bc
   4482 FD 21 03 00   [14]   80 	ld	iy,#3
   4486 FD 39         [15]   81 	add	iy,sp
   4488 FD 7E 00      [19]   82 	ld	a,0 (iy)
   448B 77            [ 7]   83 	ld	(hl),a
                             84 ;src/pathfinding.c:35: sol_tam++;
   448C 21 38 63      [10]   85 	ld	hl, #_sol_tam+0
   448F 34            [11]   86 	inc	(hl)
                             87 ;src/pathfinding.c:36: anyadido = 1;
   4490 0E 01         [ 7]   88 	ld	c,#0x01
   4492                      89 00102$:
                             90 ;src/pathfinding.c:39: return anyadido;
   4492 69            [ 4]   91 	ld	l,c
   4493 C9            [10]   92 	ret
                             93 ;src/pathfinding.c:43: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
                             94 ;	---------------------------------
                             95 ; Function adjacentTiles
                             96 ; ---------------------------------
   4494                      97 _adjacentTiles::
   4494 DD E5         [15]   98 	push	ix
   4496 DD 21 00 00   [14]   99 	ld	ix,#0
   449A DD 39         [15]  100 	add	ix,sp
   449C 21 DF FF      [10]  101 	ld	hl,#-33
   449F 39            [11]  102 	add	hl,sp
   44A0 F9            [ 6]  103 	ld	sp,hl
                            104 ;src/pathfinding.c:44: u8 resultado = 4;
   44A1 DD 36 E9 04   [19]  105 	ld	-23 (ix),#0x04
                            106 ;src/pathfinding.c:46: i16 dist1 = 0;
   44A5 DD 36 EA 00   [19]  107 	ld	-22 (ix),#0x00
   44A9 DD 36 EB 00   [19]  108 	ld	-21 (ix),#0x00
                            109 ;src/pathfinding.c:47: i16 dist2 = 0;
   44AD DD 36 EC 00   [19]  110 	ld	-20 (ix),#0x00
   44B1 DD 36 ED 00   [19]  111 	ld	-19 (ix),#0x00
                            112 ;src/pathfinding.c:48: i16 dist3 = 0;
   44B5 DD 36 EE 00   [19]  113 	ld	-18 (ix),#0x00
   44B9 DD 36 EF 00   [19]  114 	ld	-17 (ix),#0x00
                            115 ;src/pathfinding.c:52: i16 heu_derecha = 0;
   44BD DD 36 E5 00   [19]  116 	ld	-27 (ix),#0x00
   44C1 DD 36 E6 00   [19]  117 	ld	-26 (ix),#0x00
                            118 ;src/pathfinding.c:53: i16 heu_izquierda = 0;
   44C5 DD 36 E3 00   [19]  119 	ld	-29 (ix),#0x00
   44C9 DD 36 E4 00   [19]  120 	ld	-28 (ix),#0x00
                            121 ;src/pathfinding.c:54: i16 heu_arriba = 0;
   44CD DD 36 E1 00   [19]  122 	ld	-31 (ix),#0x00
   44D1 DD 36 E2 00   [19]  123 	ld	-30 (ix),#0x00
                            124 ;src/pathfinding.c:55: i16 heu_abajo = 0;
   44D5 21 00 00      [10]  125 	ld	hl,#0x0000
   44D8 E3            [19]  126 	ex	(sp), hl
                            127 ;src/pathfinding.c:61: if(y < f_y)
   44D9 DD 7E 05      [19]  128 	ld	a,5 (ix)
   44DC DD 96 07      [19]  129 	sub	a, 7 (ix)
   44DF 3E 00         [ 7]  130 	ld	a,#0x00
   44E1 17            [ 4]  131 	rla
   44E2 4F            [ 4]  132 	ld	c,a
                            133 ;src/pathfinding.c:59: if(x == f_x){
   44E3 DD 7E 04      [19]  134 	ld	a,4 (ix)
   44E6 DD 96 06      [19]  135 	sub	a, 6 (ix)
   44E9 20 1C         [12]  136 	jr	NZ,00124$
                            137 ;src/pathfinding.c:61: if(y < f_y)
   44EB 79            [ 4]  138 	ld	a,c
   44EC B7            [ 4]  139 	or	a, a
   44ED 28 04         [12]  140 	jr	Z,00102$
                            141 ;src/pathfinding.c:62: heu_abajo = -1;
   44EF 21 FF FF      [10]  142 	ld	hl,#0xFFFF
   44F2 E3            [19]  143 	ex	(sp), hl
   44F3                     144 00102$:
                            145 ;src/pathfinding.c:64: if(y > f_y)
   44F3 DD 7E 07      [19]  146 	ld	a,7 (ix)
   44F6 DD 96 05      [19]  147 	sub	a, 5 (ix)
   44F9 D2 7B 45      [10]  148 	jp	NC,00125$
                            149 ;src/pathfinding.c:65: heu_arriba = -1;
   44FC DD 36 E1 FF   [19]  150 	ld	-31 (ix),#0xFF
   4500 DD 36 E2 FF   [19]  151 	ld	-30 (ix),#0xFF
   4504 C3 7B 45      [10]  152 	jp	00125$
   4507                     153 00124$:
                            154 ;src/pathfinding.c:69: if(x < f_x)
   4507 DD 7E 04      [19]  155 	ld	a,4 (ix)
   450A DD 96 06      [19]  156 	sub	a, 6 (ix)
   450D 3E 00         [ 7]  157 	ld	a,#0x00
   450F 17            [ 4]  158 	rla
   4510 47            [ 4]  159 	ld	b,a
                            160 ;src/pathfinding.c:71: if(x > f_x)
   4511 DD 7E 06      [19]  161 	ld	a,6 (ix)
   4514 DD 96 04      [19]  162 	sub	a, 4 (ix)
   4517 3E 00         [ 7]  163 	ld	a,#0x00
   4519 17            [ 4]  164 	rla
   451A 5F            [ 4]  165 	ld	e,a
                            166 ;src/pathfinding.c:67: }else if(y == f_y){
   451B DD 7E 05      [19]  167 	ld	a,5 (ix)
   451E DD 96 07      [19]  168 	sub	a, 7 (ix)
   4521 20 1A         [12]  169 	jr	NZ,00121$
                            170 ;src/pathfinding.c:69: if(x < f_x)
   4523 78            [ 4]  171 	ld	a,b
   4524 B7            [ 4]  172 	or	a, a
   4525 28 08         [12]  173 	jr	Z,00106$
                            174 ;src/pathfinding.c:70: heu_derecha = -1;
   4527 DD 36 E5 FF   [19]  175 	ld	-27 (ix),#0xFF
   452B DD 36 E6 FF   [19]  176 	ld	-26 (ix),#0xFF
   452F                     177 00106$:
                            178 ;src/pathfinding.c:71: if(x > f_x)
   452F 7B            [ 4]  179 	ld	a,e
   4530 B7            [ 4]  180 	or	a, a
   4531 28 48         [12]  181 	jr	Z,00125$
                            182 ;src/pathfinding.c:72: heu_izquierda = -1;
   4533 DD 36 E3 FF   [19]  183 	ld	-29 (ix),#0xFF
   4537 DD 36 E4 FF   [19]  184 	ld	-28 (ix),#0xFF
   453B 18 3E         [12]  185 	jr	00125$
   453D                     186 00121$:
                            187 ;src/pathfinding.c:77: if(x < f_x){
   453D 78            [ 4]  188 	ld	a,b
   453E B7            [ 4]  189 	or	a, a
   453F 28 1C         [12]  190 	jr	Z,00118$
                            191 ;src/pathfinding.c:78: if(y < f_y)
   4541 79            [ 4]  192 	ld	a,c
   4542 B7            [ 4]  193 	or	a, a
   4543 28 06         [12]  194 	jr	Z,00110$
                            195 ;src/pathfinding.c:79: heu_abajo = -1;
   4545 21 FF FF      [10]  196 	ld	hl,#0xFFFF
   4548 E3            [19]  197 	ex	(sp), hl
   4549 18 08         [12]  198 	jr	00111$
   454B                     199 00110$:
                            200 ;src/pathfinding.c:81: heu_arriba = -1;
   454B DD 36 E1 FF   [19]  201 	ld	-31 (ix),#0xFF
   454F DD 36 E2 FF   [19]  202 	ld	-30 (ix),#0xFF
   4553                     203 00111$:
                            204 ;src/pathfinding.c:83: heu_derecha = -1;
   4553 DD 36 E5 FF   [19]  205 	ld	-27 (ix),#0xFF
   4557 DD 36 E6 FF   [19]  206 	ld	-26 (ix),#0xFF
   455B 18 1E         [12]  207 	jr	00125$
   455D                     208 00118$:
                            209 ;src/pathfinding.c:84: }else if(x > f_x){
   455D 7B            [ 4]  210 	ld	a,e
   455E B7            [ 4]  211 	or	a, a
   455F 28 1A         [12]  212 	jr	Z,00125$
                            213 ;src/pathfinding.c:86: if(y < f_y)
   4561 79            [ 4]  214 	ld	a,c
   4562 B7            [ 4]  215 	or	a, a
   4563 28 06         [12]  216 	jr	Z,00113$
                            217 ;src/pathfinding.c:87: heu_abajo = -1;
   4565 21 FF FF      [10]  218 	ld	hl,#0xFFFF
   4568 E3            [19]  219 	ex	(sp), hl
   4569 18 08         [12]  220 	jr	00114$
   456B                     221 00113$:
                            222 ;src/pathfinding.c:89: heu_arriba = -1;
   456B DD 36 E1 FF   [19]  223 	ld	-31 (ix),#0xFF
   456F DD 36 E2 FF   [19]  224 	ld	-30 (ix),#0xFF
   4573                     225 00114$:
                            226 ;src/pathfinding.c:91: heu_izquierda = -1;
   4573 DD 36 E3 FF   [19]  227 	ld	-29 (ix),#0xFF
   4577 DD 36 E4 FF   [19]  228 	ld	-28 (ix),#0xFF
   457B                     229 00125$:
                            230 ;src/pathfinding.c:96: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   457B DD 7E 05      [19]  231 	ld	a,5 (ix)
   457E C6 FE         [ 7]  232 	add	a,#0xFE
   4580 DD 77 F2      [19]  233 	ld	-14 (ix), a
   4583 F5            [11]  234 	push	af
   4584 33            [ 6]  235 	inc	sp
   4585 DD 7E 04      [19]  236 	ld	a,4 (ix)
   4588 F5            [11]  237 	push	af
   4589 33            [ 6]  238 	inc	sp
   458A DD 6E 08      [19]  239 	ld	l,8 (ix)
   458D DD 66 09      [19]  240 	ld	h,9 (ix)
   4590 E5            [11]  241 	push	hl
   4591 CD 71 4B      [17]  242 	call	_getTilePtr
   4594 F1            [10]  243 	pop	af
   4595 F1            [10]  244 	pop	af
   4596 4E            [ 7]  245 	ld	c,(hl)
                            246 ;src/pathfinding.c:97: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   4597 DD 7E 04      [19]  247 	ld	a,4 (ix)
   459A C6 04         [ 7]  248 	add	a, #0x04
   459C DD 77 FB      [19]  249 	ld	-5 (ix),a
                            250 ;src/pathfinding.c:98: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   459F DD 7E 06      [19]  251 	ld	a,6 (ix)
   45A2 DD 77 FC      [19]  252 	ld	-4 (ix),a
   45A5 DD 36 FD 00   [19]  253 	ld	-3 (ix),#0x00
   45A9 DD 7E 04      [19]  254 	ld	a,4 (ix)
   45AC DD 77 F5      [19]  255 	ld	-11 (ix),a
   45AF DD 36 F6 00   [19]  256 	ld	-10 (ix),#0x00
   45B3 DD 7E 07      [19]  257 	ld	a,7 (ix)
   45B6 DD 77 FE      [19]  258 	ld	-2 (ix),a
   45B9 DD 36 FF 00   [19]  259 	ld	-1 (ix),#0x00
   45BD DD 7E 05      [19]  260 	ld	a,5 (ix)
   45C0 DD 77 F0      [19]  261 	ld	-16 (ix),a
   45C3 DD 36 F1 00   [19]  262 	ld	-15 (ix),#0x00
   45C7 DD 7E FC      [19]  263 	ld	a,-4 (ix)
   45CA DD 96 F5      [19]  264 	sub	a, -11 (ix)
   45CD DD 77 F7      [19]  265 	ld	-9 (ix),a
   45D0 DD 7E FD      [19]  266 	ld	a,-3 (ix)
   45D3 DD 9E F6      [19]  267 	sbc	a, -10 (ix)
   45D6 DD 77 F8      [19]  268 	ld	-8 (ix),a
                            269 ;src/pathfinding.c:96: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   45D9 3E 02         [ 7]  270 	ld	a,#0x02
   45DB 91            [ 4]  271 	sub	a, c
   45DC DA 70 46      [10]  272 	jp	C,00127$
                            273 ;src/pathfinding.c:97: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   45DF DD 66 F2      [19]  274 	ld	h,-14 (ix)
   45E2 DD 6E FB      [19]  275 	ld	l,-5 (ix)
   45E5 E5            [11]  276 	push	hl
   45E6 DD 6E 08      [19]  277 	ld	l,8 (ix)
   45E9 DD 66 09      [19]  278 	ld	h,9 (ix)
   45EC E5            [11]  279 	push	hl
   45ED CD 71 4B      [17]  280 	call	_getTilePtr
   45F0 F1            [10]  281 	pop	af
   45F1 F1            [10]  282 	pop	af
   45F2 4E            [ 7]  283 	ld	c,(hl)
   45F3 3E 02         [ 7]  284 	ld	a,#0x02
   45F5 91            [ 4]  285 	sub	a, c
   45F6 38 78         [12]  286 	jr	C,00127$
                            287 ;src/pathfinding.c:98: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45F8 DD 6E F7      [19]  288 	ld	l,-9 (ix)
   45FB DD 66 F8      [19]  289 	ld	h,-8 (ix)
   45FE E5            [11]  290 	push	hl
   45FF CD B5 4B      [17]  291 	call	_abs
   4602 F1            [10]  292 	pop	af
   4603 DD 74 F4      [19]  293 	ld	-12 (ix),h
   4606 DD 75 F3      [19]  294 	ld	-13 (ix),l
   4609 DD 7E F0      [19]  295 	ld	a,-16 (ix)
   460C C6 FE         [ 7]  296 	add	a,#0xFE
   460E DD 77 F9      [19]  297 	ld	-7 (ix),a
   4611 DD 7E F1      [19]  298 	ld	a,-15 (ix)
   4614 CE FF         [ 7]  299 	adc	a,#0xFF
   4616 DD 77 FA      [19]  300 	ld	-6 (ix),a
   4619 DD 7E FE      [19]  301 	ld	a,-2 (ix)
   461C DD 96 F9      [19]  302 	sub	a, -7 (ix)
   461F DD 77 F9      [19]  303 	ld	-7 (ix),a
   4622 DD 7E FF      [19]  304 	ld	a,-1 (ix)
   4625 DD 9E FA      [19]  305 	sbc	a, -6 (ix)
   4628 DD 77 FA      [19]  306 	ld	-6 (ix),a
   462B DD 6E F9      [19]  307 	ld	l,-7 (ix)
   462E DD 66 FA      [19]  308 	ld	h,-6 (ix)
   4631 E5            [11]  309 	push	hl
   4632 CD B5 4B      [17]  310 	call	_abs
   4635 F1            [10]  311 	pop	af
   4636 DD 74 FA      [19]  312 	ld	-6 (ix),h
   4639 DD 75 F9      [19]  313 	ld	-7 (ix),l
   463C DD 7E F3      [19]  314 	ld	a,-13 (ix)
   463F DD 86 F9      [19]  315 	add	a, -7 (ix)
   4642 DD 77 F9      [19]  316 	ld	-7 (ix),a
   4645 DD 7E F4      [19]  317 	ld	a,-12 (ix)
   4648 DD 8E FA      [19]  318 	adc	a, -6 (ix)
   464B DD 77 FA      [19]  319 	ld	-6 (ix),a
   464E DD 7E F9      [19]  320 	ld	a,-7 (ix)
   4651 DD 86 E1      [19]  321 	add	a, -31 (ix)
   4654 DD 77 F9      [19]  322 	ld	-7 (ix),a
   4657 DD 7E FA      [19]  323 	ld	a,-6 (ix)
   465A DD 8E E2      [19]  324 	adc	a, -30 (ix)
   465D DD 77 FA      [19]  325 	ld	-6 (ix),a
   4660 DD 7E F9      [19]  326 	ld	a,-7 (ix)
   4663 DD 77 EA      [19]  327 	ld	-22 (ix),a
   4666 DD 7E FA      [19]  328 	ld	a,-6 (ix)
   4669 DD 77 EB      [19]  329 	ld	-21 (ix),a
                            330 ;src/pathfinding.c:99: resultado = 0;
   466C DD 36 E9 00   [19]  331 	ld	-23 (ix),#0x00
   4670                     332 00127$:
                            333 ;src/pathfinding.c:102: if(*getTilePtr(matriz, x, y+2) <=2 &&
   4670 DD 46 05      [19]  334 	ld	b,5 (ix)
   4673 04            [ 4]  335 	inc	b
   4674 04            [ 4]  336 	inc	b
   4675 C5            [11]  337 	push	bc
   4676 33            [ 6]  338 	inc	sp
   4677 DD 7E 04      [19]  339 	ld	a,4 (ix)
   467A F5            [11]  340 	push	af
   467B 33            [ 6]  341 	inc	sp
   467C DD 6E 08      [19]  342 	ld	l,8 (ix)
   467F DD 66 09      [19]  343 	ld	h,9 (ix)
   4682 E5            [11]  344 	push	hl
   4683 CD 71 4B      [17]  345 	call	_getTilePtr
   4686 F1            [10]  346 	pop	af
   4687 F1            [10]  347 	pop	af
   4688 4E            [ 7]  348 	ld	c,(hl)
   4689 3E 02         [ 7]  349 	ld	a,#0x02
   468B 91            [ 4]  350 	sub	a, c
   468C DA 55 47      [10]  351 	jp	C,00135$
                            352 ;src/pathfinding.c:103: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
   468F DD 7E 05      [19]  353 	ld	a,5 (ix)
   4692 C6 16         [ 7]  354 	add	a, #0x16
   4694 47            [ 4]  355 	ld	b,a
   4695 C5            [11]  356 	push	bc
   4696 33            [ 6]  357 	inc	sp
   4697 DD 7E FB      [19]  358 	ld	a,-5 (ix)
   469A F5            [11]  359 	push	af
   469B 33            [ 6]  360 	inc	sp
   469C DD 6E 08      [19]  361 	ld	l,8 (ix)
   469F DD 66 09      [19]  362 	ld	h,9 (ix)
   46A2 E5            [11]  363 	push	hl
   46A3 CD 71 4B      [17]  364 	call	_getTilePtr
   46A6 F1            [10]  365 	pop	af
   46A7 F1            [10]  366 	pop	af
   46A8 DD 74 FA      [19]  367 	ld	-6 (ix),h
   46AB DD 75 F9      [19]  368 	ld	-7 (ix), l
   46AE DD 66 FA      [19]  369 	ld	h,-6 (ix)
   46B1 7E            [ 7]  370 	ld	a,(hl)
   46B2 DD 77 F9      [19]  371 	ld	-7 (ix),a
   46B5 3E 02         [ 7]  372 	ld	a,#0x02
   46B7 DD 96 F9      [19]  373 	sub	a, -7 (ix)
   46BA DA 55 47      [10]  374 	jp	C,00135$
                            375 ;src/pathfinding.c:104: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   46BD DD 6E F7      [19]  376 	ld	l,-9 (ix)
   46C0 DD 66 F8      [19]  377 	ld	h,-8 (ix)
   46C3 E5            [11]  378 	push	hl
   46C4 CD B5 4B      [17]  379 	call	_abs
   46C7 F1            [10]  380 	pop	af
   46C8 DD 74 FA      [19]  381 	ld	-6 (ix),h
   46CB DD 75 F9      [19]  382 	ld	-7 (ix),l
   46CE DD 7E F0      [19]  383 	ld	a,-16 (ix)
   46D1 C6 02         [ 7]  384 	add	a, #0x02
   46D3 DD 77 F3      [19]  385 	ld	-13 (ix),a
   46D6 DD 7E F1      [19]  386 	ld	a,-15 (ix)
   46D9 CE 00         [ 7]  387 	adc	a, #0x00
   46DB DD 77 F4      [19]  388 	ld	-12 (ix),a
   46DE DD 7E FE      [19]  389 	ld	a,-2 (ix)
   46E1 DD 96 F3      [19]  390 	sub	a, -13 (ix)
   46E4 DD 77 F3      [19]  391 	ld	-13 (ix),a
   46E7 DD 7E FF      [19]  392 	ld	a,-1 (ix)
   46EA DD 9E F4      [19]  393 	sbc	a, -12 (ix)
   46ED DD 77 F4      [19]  394 	ld	-12 (ix),a
   46F0 DD 6E F3      [19]  395 	ld	l,-13 (ix)
   46F3 DD 66 F4      [19]  396 	ld	h,-12 (ix)
   46F6 E5            [11]  397 	push	hl
   46F7 CD B5 4B      [17]  398 	call	_abs
   46FA F1            [10]  399 	pop	af
   46FB DD 74 F4      [19]  400 	ld	-12 (ix),h
   46FE DD 75 F3      [19]  401 	ld	-13 (ix),l
   4701 DD 7E F9      [19]  402 	ld	a,-7 (ix)
   4704 DD 86 F3      [19]  403 	add	a, -13 (ix)
   4707 DD 77 F9      [19]  404 	ld	-7 (ix),a
   470A DD 7E FA      [19]  405 	ld	a,-6 (ix)
   470D DD 8E F4      [19]  406 	adc	a, -12 (ix)
   4710 DD 77 FA      [19]  407 	ld	-6 (ix),a
   4713 DD 7E F9      [19]  408 	ld	a,-7 (ix)
   4716 DD 86 DF      [19]  409 	add	a, -33 (ix)
   4719 DD 77 F9      [19]  410 	ld	-7 (ix),a
   471C DD 7E FA      [19]  411 	ld	a,-6 (ix)
   471F DD 8E E0      [19]  412 	adc	a, -32 (ix)
   4722 DD 77 FA      [19]  413 	ld	-6 (ix),a
   4725 DD 7E F9      [19]  414 	ld	a,-7 (ix)
   4728 DD 77 EC      [19]  415 	ld	-20 (ix),a
   472B DD 7E FA      [19]  416 	ld	a,-6 (ix)
   472E DD 77 ED      [19]  417 	ld	-19 (ix),a
                            418 ;src/pathfinding.c:105: if(resultado == 0){
   4731 DD 7E E9      [19]  419 	ld	a,-23 (ix)
   4734 B7            [ 4]  420 	or	a, a
   4735 20 1A         [12]  421 	jr	NZ,00132$
                            422 ;src/pathfinding.c:106: if(dist1 > dist2)
   4737 DD 7E EC      [19]  423 	ld	a,-20 (ix)
   473A DD 96 EA      [19]  424 	sub	a, -22 (ix)
   473D DD 7E ED      [19]  425 	ld	a,-19 (ix)
   4740 DD 9E EB      [19]  426 	sbc	a, -21 (ix)
   4743 E2 48 47      [10]  427 	jp	PO, 00304$
   4746 EE 80         [ 7]  428 	xor	a, #0x80
   4748                     429 00304$:
   4748 F2 55 47      [10]  430 	jp	P,00135$
                            431 ;src/pathfinding.c:107: resultado = 1;
   474B DD 36 E9 01   [19]  432 	ld	-23 (ix),#0x01
   474F 18 04         [12]  433 	jr	00135$
   4751                     434 00132$:
                            435 ;src/pathfinding.c:109: resultado = 1;
   4751 DD 36 E9 01   [19]  436 	ld	-23 (ix),#0x01
   4755                     437 00135$:
                            438 ;src/pathfinding.c:113: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4755 DD 4E 04      [19]  439 	ld	c,4 (ix)
   4758 0D            [ 4]  440 	dec	c
   4759 C5            [11]  441 	push	bc
   475A DD 7E 05      [19]  442 	ld	a,5 (ix)
   475D F5            [11]  443 	push	af
   475E 33            [ 6]  444 	inc	sp
   475F 79            [ 4]  445 	ld	a,c
   4760 F5            [11]  446 	push	af
   4761 33            [ 6]  447 	inc	sp
   4762 DD 6E 08      [19]  448 	ld	l,8 (ix)
   4765 DD 66 09      [19]  449 	ld	h,9 (ix)
   4768 E5            [11]  450 	push	hl
   4769 CD 71 4B      [17]  451 	call	_getTilePtr
   476C F1            [10]  452 	pop	af
   476D F1            [10]  453 	pop	af
   476E C1            [10]  454 	pop	bc
   476F 46            [ 7]  455 	ld	b,(hl)
                            456 ;src/pathfinding.c:114: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4770 DD 7E 05      [19]  457 	ld	a,5 (ix)
   4773 C6 14         [ 7]  458 	add	a, #0x14
   4775 DD 77 F9      [19]  459 	ld	-7 (ix),a
                            460 ;src/pathfinding.c:115: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4778 DD 7E 05      [19]  461 	ld	a,5 (ix)
   477B C6 0B         [ 7]  462 	add	a, #0x0B
   477D DD 77 F3      [19]  463 	ld	-13 (ix),a
                            464 ;src/pathfinding.c:116: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4780 DD 7E FE      [19]  465 	ld	a,-2 (ix)
   4783 DD 96 F0      [19]  466 	sub	a, -16 (ix)
   4786 DD 77 F7      [19]  467 	ld	-9 (ix),a
   4789 DD 7E FF      [19]  468 	ld	a,-1 (ix)
   478C DD 9E F1      [19]  469 	sbc	a, -15 (ix)
   478F DD 77 F8      [19]  470 	ld	-8 (ix),a
                            471 ;src/pathfinding.c:113: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4792 3E 02         [ 7]  472 	ld	a,#0x02
   4794 90            [ 4]  473 	sub	a, b
   4795 DA 43 48      [10]  474 	jp	C,00148$
                            475 ;src/pathfinding.c:114: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4798 C5            [11]  476 	push	bc
   4799 DD 7E F9      [19]  477 	ld	a,-7 (ix)
   479C F5            [11]  478 	push	af
   479D 33            [ 6]  479 	inc	sp
   479E 79            [ 4]  480 	ld	a,c
   479F F5            [11]  481 	push	af
   47A0 33            [ 6]  482 	inc	sp
   47A1 DD 6E 08      [19]  483 	ld	l,8 (ix)
   47A4 DD 66 09      [19]  484 	ld	h,9 (ix)
   47A7 E5            [11]  485 	push	hl
   47A8 CD 71 4B      [17]  486 	call	_getTilePtr
   47AB F1            [10]  487 	pop	af
   47AC F1            [10]  488 	pop	af
   47AD C1            [10]  489 	pop	bc
   47AE 46            [ 7]  490 	ld	b,(hl)
   47AF 3E 02         [ 7]  491 	ld	a,#0x02
   47B1 90            [ 4]  492 	sub	a, b
   47B2 DA 43 48      [10]  493 	jp	C,00148$
                            494 ;src/pathfinding.c:115: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   47B5 DD 7E F3      [19]  495 	ld	a,-13 (ix)
   47B8 F5            [11]  496 	push	af
   47B9 33            [ 6]  497 	inc	sp
   47BA 79            [ 4]  498 	ld	a,c
   47BB F5            [11]  499 	push	af
   47BC 33            [ 6]  500 	inc	sp
   47BD DD 6E 08      [19]  501 	ld	l,8 (ix)
   47C0 DD 66 09      [19]  502 	ld	h,9 (ix)
   47C3 E5            [11]  503 	push	hl
   47C4 CD 71 4B      [17]  504 	call	_getTilePtr
   47C7 F1            [10]  505 	pop	af
   47C8 F1            [10]  506 	pop	af
   47C9 4E            [ 7]  507 	ld	c,(hl)
   47CA 3E 02         [ 7]  508 	ld	a,#0x02
   47CC 91            [ 4]  509 	sub	a, c
   47CD 38 74         [12]  510 	jr	C,00148$
                            511 ;src/pathfinding.c:116: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   47CF DD 4E F5      [19]  512 	ld	c,-11 (ix)
   47D2 DD 46 F6      [19]  513 	ld	b,-10 (ix)
   47D5 0B            [ 6]  514 	dec	bc
   47D6 DD 7E FC      [19]  515 	ld	a,-4 (ix)
   47D9 91            [ 4]  516 	sub	a, c
   47DA 4F            [ 4]  517 	ld	c,a
   47DB DD 7E FD      [19]  518 	ld	a,-3 (ix)
   47DE 98            [ 4]  519 	sbc	a, b
   47DF 47            [ 4]  520 	ld	b,a
   47E0 C5            [11]  521 	push	bc
   47E1 CD B5 4B      [17]  522 	call	_abs
   47E4 E3            [19]  523 	ex	(sp),hl
   47E5 DD 6E F7      [19]  524 	ld	l,-9 (ix)
   47E8 DD 66 F8      [19]  525 	ld	h,-8 (ix)
   47EB E5            [11]  526 	push	hl
   47EC CD B5 4B      [17]  527 	call	_abs
   47EF F1            [10]  528 	pop	af
   47F0 C1            [10]  529 	pop	bc
   47F1 09            [11]  530 	add	hl,bc
   47F2 DD 5E E3      [19]  531 	ld	e,-29 (ix)
   47F5 DD 56 E4      [19]  532 	ld	d,-28 (ix)
   47F8 19            [11]  533 	add	hl,de
   47F9 DD 75 EE      [19]  534 	ld	-18 (ix),l
   47FC DD 74 EF      [19]  535 	ld	-17 (ix),h
                            536 ;src/pathfinding.c:117: if(resultado == 0){
   47FF DD 7E E9      [19]  537 	ld	a,-23 (ix)
   4802 B7            [ 4]  538 	or	a, a
   4803 20 1A         [12]  539 	jr	NZ,00145$
                            540 ;src/pathfinding.c:118: if(dist1 >= dist3)
   4805 DD 7E EA      [19]  541 	ld	a,-22 (ix)
   4808 DD 96 EE      [19]  542 	sub	a, -18 (ix)
   480B DD 7E EB      [19]  543 	ld	a,-21 (ix)
   480E DD 9E EF      [19]  544 	sbc	a, -17 (ix)
   4811 E2 16 48      [10]  545 	jp	PO, 00305$
   4814 EE 80         [ 7]  546 	xor	a, #0x80
   4816                     547 00305$:
   4816 FA 43 48      [10]  548 	jp	M,00148$
                            549 ;src/pathfinding.c:119: resultado = 2;
   4819 DD 36 E9 02   [19]  550 	ld	-23 (ix),#0x02
   481D 18 24         [12]  551 	jr	00148$
   481F                     552 00145$:
                            553 ;src/pathfinding.c:120: }else if(resultado == 1){
   481F DD 7E E9      [19]  554 	ld	a,-23 (ix)
   4822 3D            [ 4]  555 	dec	a
   4823 20 1A         [12]  556 	jr	NZ,00142$
                            557 ;src/pathfinding.c:121: if(dist2 >= dist3)
   4825 DD 7E EC      [19]  558 	ld	a,-20 (ix)
   4828 DD 96 EE      [19]  559 	sub	a, -18 (ix)
   482B DD 7E ED      [19]  560 	ld	a,-19 (ix)
   482E DD 9E EF      [19]  561 	sbc	a, -17 (ix)
   4831 E2 36 48      [10]  562 	jp	PO, 00308$
   4834 EE 80         [ 7]  563 	xor	a, #0x80
   4836                     564 00308$:
   4836 FA 43 48      [10]  565 	jp	M,00148$
                            566 ;src/pathfinding.c:122: resultado = 2;
   4839 DD 36 E9 02   [19]  567 	ld	-23 (ix),#0x02
   483D 18 04         [12]  568 	jr	00148$
   483F                     569 00142$:
                            570 ;src/pathfinding.c:124: resultado = 2;
   483F DD 36 E9 02   [19]  571 	ld	-23 (ix),#0x02
   4843                     572 00148$:
                            573 ;src/pathfinding.c:128: if(*getTilePtr(matriz, (x +1), y) <=2 &&
   4843 DD 46 04      [19]  574 	ld	b,4 (ix)
   4846 04            [ 4]  575 	inc	b
   4847 DD 7E 05      [19]  576 	ld	a,5 (ix)
   484A F5            [11]  577 	push	af
   484B 33            [ 6]  578 	inc	sp
   484C C5            [11]  579 	push	bc
   484D 33            [ 6]  580 	inc	sp
   484E DD 6E 08      [19]  581 	ld	l,8 (ix)
   4851 DD 66 09      [19]  582 	ld	h,9 (ix)
   4854 E5            [11]  583 	push	hl
   4855 CD 71 4B      [17]  584 	call	_getTilePtr
   4858 F1            [10]  585 	pop	af
   4859 F1            [10]  586 	pop	af
   485A 4E            [ 7]  587 	ld	c,(hl)
   485B 3E 02         [ 7]  588 	ld	a,#0x02
   485D 91            [ 4]  589 	sub	a, c
   485E DA 6A 49      [10]  590 	jp	C,00167$
                            591 ;src/pathfinding.c:129: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
   4861 DD 7E 04      [19]  592 	ld	a,4 (ix)
   4864 C6 05         [ 7]  593 	add	a, #0x05
   4866 47            [ 4]  594 	ld	b,a
   4867 C5            [11]  595 	push	bc
   4868 DD 7E F9      [19]  596 	ld	a,-7 (ix)
   486B F5            [11]  597 	push	af
   486C 33            [ 6]  598 	inc	sp
   486D C5            [11]  599 	push	bc
   486E 33            [ 6]  600 	inc	sp
   486F DD 6E 08      [19]  601 	ld	l,8 (ix)
   4872 DD 66 09      [19]  602 	ld	h,9 (ix)
   4875 E5            [11]  603 	push	hl
   4876 CD 71 4B      [17]  604 	call	_getTilePtr
   4879 F1            [10]  605 	pop	af
   487A F1            [10]  606 	pop	af
   487B C1            [10]  607 	pop	bc
   487C 4E            [ 7]  608 	ld	c,(hl)
   487D 3E 02         [ 7]  609 	ld	a,#0x02
   487F 91            [ 4]  610 	sub	a, c
   4880 DA 6A 49      [10]  611 	jp	C,00167$
                            612 ;src/pathfinding.c:130: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4883 DD 7E F3      [19]  613 	ld	a,-13 (ix)
   4886 F5            [11]  614 	push	af
   4887 33            [ 6]  615 	inc	sp
   4888 C5            [11]  616 	push	bc
   4889 33            [ 6]  617 	inc	sp
   488A DD 6E 08      [19]  618 	ld	l,8 (ix)
   488D DD 66 09      [19]  619 	ld	h,9 (ix)
   4890 E5            [11]  620 	push	hl
   4891 CD 71 4B      [17]  621 	call	_getTilePtr
   4894 F1            [10]  622 	pop	af
   4895 F1            [10]  623 	pop	af
   4896 4E            [ 7]  624 	ld	c,(hl)
   4897 3E 02         [ 7]  625 	ld	a,#0x02
   4899 91            [ 4]  626 	sub	a, c
   489A DA 6A 49      [10]  627 	jp	C,00167$
                            628 ;src/pathfinding.c:131: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   489D DD 7E F5      [19]  629 	ld	a,-11 (ix)
   48A0 C6 01         [ 7]  630 	add	a, #0x01
   48A2 DD 77 F9      [19]  631 	ld	-7 (ix),a
   48A5 DD 7E F6      [19]  632 	ld	a,-10 (ix)
   48A8 CE 00         [ 7]  633 	adc	a, #0x00
   48AA DD 77 FA      [19]  634 	ld	-6 (ix),a
   48AD DD 7E FC      [19]  635 	ld	a,-4 (ix)
   48B0 DD 96 F9      [19]  636 	sub	a, -7 (ix)
   48B3 DD 77 F9      [19]  637 	ld	-7 (ix),a
   48B6 DD 7E FD      [19]  638 	ld	a,-3 (ix)
   48B9 DD 9E FA      [19]  639 	sbc	a, -6 (ix)
   48BC DD 77 FA      [19]  640 	ld	-6 (ix),a
   48BF DD 6E F9      [19]  641 	ld	l,-7 (ix)
   48C2 DD 66 FA      [19]  642 	ld	h,-6 (ix)
   48C5 E5            [11]  643 	push	hl
   48C6 CD B5 4B      [17]  644 	call	_abs
   48C9 F1            [10]  645 	pop	af
   48CA DD 74 FA      [19]  646 	ld	-6 (ix),h
   48CD DD 75 F9      [19]  647 	ld	-7 (ix),l
   48D0 DD 6E F7      [19]  648 	ld	l,-9 (ix)
   48D3 DD 66 F8      [19]  649 	ld	h,-8 (ix)
   48D6 E5            [11]  650 	push	hl
   48D7 CD B5 4B      [17]  651 	call	_abs
   48DA F1            [10]  652 	pop	af
   48DB DD 74 F4      [19]  653 	ld	-12 (ix),h
   48DE DD 75 F3      [19]  654 	ld	-13 (ix),l
   48E1 DD 7E F9      [19]  655 	ld	a,-7 (ix)
   48E4 DD 86 F3      [19]  656 	add	a, -13 (ix)
   48E7 DD 77 F9      [19]  657 	ld	-7 (ix),a
   48EA DD 7E FA      [19]  658 	ld	a,-6 (ix)
   48ED DD 8E F4      [19]  659 	adc	a, -12 (ix)
   48F0 DD 77 FA      [19]  660 	ld	-6 (ix),a
   48F3 DD 7E F9      [19]  661 	ld	a,-7 (ix)
   48F6 DD 86 E5      [19]  662 	add	a, -27 (ix)
   48F9 DD 77 E7      [19]  663 	ld	-25 (ix),a
   48FC DD 7E FA      [19]  664 	ld	a,-6 (ix)
   48FF DD 8E E6      [19]  665 	adc	a, -26 (ix)
   4902 DD 77 E8      [19]  666 	ld	-24 (ix),a
                            667 ;src/pathfinding.c:132: if(resultado == 0){
   4905 DD 7E E9      [19]  668 	ld	a,-23 (ix)
   4908 B7            [ 4]  669 	or	a, a
   4909 20 1A         [12]  670 	jr	NZ,00164$
                            671 ;src/pathfinding.c:133: if(dist1 >= dist4)
   490B DD 7E EA      [19]  672 	ld	a,-22 (ix)
   490E DD 96 E7      [19]  673 	sub	a, -25 (ix)
   4911 DD 7E EB      [19]  674 	ld	a,-21 (ix)
   4914 DD 9E E8      [19]  675 	sbc	a, -24 (ix)
   4917 E2 1C 49      [10]  676 	jp	PO, 00309$
   491A EE 80         [ 7]  677 	xor	a, #0x80
   491C                     678 00309$:
   491C FA 6A 49      [10]  679 	jp	M,00167$
                            680 ;src/pathfinding.c:134: resultado = 3;
   491F DD 36 E9 03   [19]  681 	ld	-23 (ix),#0x03
   4923 18 45         [12]  682 	jr	00167$
   4925                     683 00164$:
                            684 ;src/pathfinding.c:135: }else if(resultado == 1){
   4925 DD 7E E9      [19]  685 	ld	a,-23 (ix)
   4928 3D            [ 4]  686 	dec	a
   4929 20 1A         [12]  687 	jr	NZ,00161$
                            688 ;src/pathfinding.c:136: if(dist2 >= dist4)
   492B DD 7E EC      [19]  689 	ld	a,-20 (ix)
   492E DD 96 E7      [19]  690 	sub	a, -25 (ix)
   4931 DD 7E ED      [19]  691 	ld	a,-19 (ix)
   4934 DD 9E E8      [19]  692 	sbc	a, -24 (ix)
   4937 E2 3C 49      [10]  693 	jp	PO, 00312$
   493A EE 80         [ 7]  694 	xor	a, #0x80
   493C                     695 00312$:
   493C FA 6A 49      [10]  696 	jp	M,00167$
                            697 ;src/pathfinding.c:137: resultado = 3;
   493F DD 36 E9 03   [19]  698 	ld	-23 (ix),#0x03
   4943 18 25         [12]  699 	jr	00167$
   4945                     700 00161$:
                            701 ;src/pathfinding.c:138: }else if (resultado == 2){
   4945 DD 7E E9      [19]  702 	ld	a,-23 (ix)
   4948 D6 02         [ 7]  703 	sub	a, #0x02
   494A 20 1A         [12]  704 	jr	NZ,00158$
                            705 ;src/pathfinding.c:139: if(dist3 >= dist4)
   494C DD 7E EE      [19]  706 	ld	a,-18 (ix)
   494F DD 96 E7      [19]  707 	sub	a, -25 (ix)
   4952 DD 7E EF      [19]  708 	ld	a,-17 (ix)
   4955 DD 9E E8      [19]  709 	sbc	a, -24 (ix)
   4958 E2 5D 49      [10]  710 	jp	PO, 00315$
   495B EE 80         [ 7]  711 	xor	a, #0x80
   495D                     712 00315$:
   495D FA 6A 49      [10]  713 	jp	M,00167$
                            714 ;src/pathfinding.c:140: resultado = 3;
   4960 DD 36 E9 03   [19]  715 	ld	-23 (ix),#0x03
   4964 18 04         [12]  716 	jr	00167$
   4966                     717 00158$:
                            718 ;src/pathfinding.c:142: resultado = 3;
   4966 DD 36 E9 03   [19]  719 	ld	-23 (ix),#0x03
   496A                     720 00167$:
                            721 ;src/pathfinding.c:146: return resultado;
   496A DD 6E E9      [19]  722 	ld	l,-23 (ix)
   496D DD F9         [10]  723 	ld	sp, ix
   496F DD E1         [14]  724 	pop	ix
   4971 C9            [10]  725 	ret
                            726 ;src/pathfinding.c:150: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            727 ;	---------------------------------
                            728 ; Function pathFinding
                            729 ; ---------------------------------
   4972                     730 _pathFinding::
   4972 DD E5         [15]  731 	push	ix
   4974 DD 21 00 00   [14]  732 	ld	ix,#0
   4978 DD 39         [15]  733 	add	ix,sp
   497A 21 ED FF      [10]  734 	ld	hl,#-19
   497D 39            [11]  735 	add	hl,sp
   497E F9            [ 6]  736 	ld	sp,hl
                            737 ;src/pathfinding.c:162: u8 problem = 0;
   497F DD 36 F1 00   [19]  738 	ld	-15 (ix),#0x00
                            739 ;src/pathfinding.c:164: x = s_x;
   4983 DD 7E 04      [19]  740 	ld	a,4 (ix)
   4986 DD 77 F3      [19]  741 	ld	-13 (ix),a
                            742 ;src/pathfinding.c:165: sol_tam = 0;
   4989 21 38 63      [10]  743 	ld	hl,#_sol_tam + 0
   498C 36 00         [10]  744 	ld	(hl), #0x00
                            745 ;src/pathfinding.c:166: y = s_y;
   498E DD 7E 05      [19]  746 	ld	a,5 (ix)
   4991 DD 77 F2      [19]  747 	ld	-14 (ix),a
                            748 ;src/pathfinding.c:168: k = 0;
   4994 DD 36 EF 00   [19]  749 	ld	-17 (ix),#0x00
                            750 ;src/pathfinding.c:169: aux = 1;
   4998 DD 36 F4 01   [19]  751 	ld	-12 (ix),#0x01
                            752 ;src/pathfinding.c:170: actual->longitud_camino = 0;
   499C DD 7E 08      [19]  753 	ld	a,8 (ix)
   499F DD 77 F7      [19]  754 	ld	-9 (ix),a
   49A2 DD 7E 09      [19]  755 	ld	a,9 (ix)
   49A5 DD 77 F8      [19]  756 	ld	-8 (ix),a
   49A8 DD 7E F7      [19]  757 	ld	a,-9 (ix)
   49AB C6 E2         [ 7]  758 	add	a, #0xE2
   49AD DD 77 F5      [19]  759 	ld	-11 (ix),a
   49B0 DD 7E F8      [19]  760 	ld	a,-8 (ix)
   49B3 CE 00         [ 7]  761 	adc	a, #0x00
   49B5 DD 77 F6      [19]  762 	ld	-10 (ix),a
   49B8 DD 6E F5      [19]  763 	ld	l,-11 (ix)
   49BB DD 66 F6      [19]  764 	ld	h,-10 (ix)
   49BE 36 00         [10]  765 	ld	(hl),#0x00
                            766 ;src/pathfinding.c:171: inserted = anyadirALista(x, y);
   49C0 DD 66 F2      [19]  767 	ld	h,-14 (ix)
   49C3 DD 6E F3      [19]  768 	ld	l,-13 (ix)
   49C6 E5            [11]  769 	push	hl
   49C7 CD 5C 44      [17]  770 	call	_anyadirALista
   49CA F1            [10]  771 	pop	af
   49CB DD 75 EE      [19]  772 	ld	-18 (ix),l
                            773 ;src/pathfinding.c:174: if(!(x == f_x && y == f_y) ){
   49CE DD 7E 06      [19]  774 	ld	a,6 (ix)
   49D1 DD 96 F3      [19]  775 	sub	a, -13 (ix)
   49D4 20 09         [12]  776 	jr	NZ,00114$
   49D6 DD 7E 07      [19]  777 	ld	a,7 (ix)
   49D9 DD 96 F2      [19]  778 	sub	a, -14 (ix)
   49DC CA E6 4A      [10]  779 	jp	Z,00118$
                            780 ;src/pathfinding.c:175: while (aux){
   49DF                     781 00114$:
   49DF DD 7E F4      [19]  782 	ld	a,-12 (ix)
   49E2 B7            [ 4]  783 	or	a, a
   49E3 CA EA 4A      [10]  784 	jp	Z,00119$
                            785 ;src/pathfinding.c:176: if( (x == f_x && y == f_y) || inserted == 0){
   49E6 DD 7E 06      [19]  786 	ld	a,6 (ix)
   49E9 DD 96 F3      [19]  787 	sub	a, -13 (ix)
   49EC 20 08         [12]  788 	jr	NZ,00113$
   49EE DD 7E 07      [19]  789 	ld	a,7 (ix)
   49F1 DD 96 F2      [19]  790 	sub	a, -14 (ix)
   49F4 28 06         [12]  791 	jr	Z,00109$
   49F6                     792 00113$:
   49F6 DD 7E EE      [19]  793 	ld	a,-18 (ix)
   49F9 B7            [ 4]  794 	or	a, a
   49FA 20 16         [12]  795 	jr	NZ,00110$
   49FC                     796 00109$:
                            797 ;src/pathfinding.c:178: if(inserted == 0 || sol_tam == 0){
   49FC DD 7E EE      [19]  798 	ld	a,-18 (ix)
   49FF B7            [ 4]  799 	or	a, a
   4A00 28 06         [12]  800 	jr	Z,00101$
   4A02 3A 38 63      [13]  801 	ld	a,(#_sol_tam + 0)
   4A05 B7            [ 4]  802 	or	a, a
   4A06 20 04         [12]  803 	jr	NZ,00102$
   4A08                     804 00101$:
                            805 ;src/pathfinding.c:179: problem = 1;
   4A08 DD 36 F1 01   [19]  806 	ld	-15 (ix),#0x01
   4A0C                     807 00102$:
                            808 ;src/pathfinding.c:182: aux = 0;
   4A0C DD 36 F4 00   [19]  809 	ld	-12 (ix),#0x00
   4A10 18 CD         [12]  810 	jr	00114$
   4A12                     811 00110$:
                            812 ;src/pathfinding.c:184: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   4A12 DD 6E 0A      [19]  813 	ld	l,10 (ix)
   4A15 DD 66 0B      [19]  814 	ld	h,11 (ix)
   4A18 E5            [11]  815 	push	hl
   4A19 DD 66 07      [19]  816 	ld	h,7 (ix)
   4A1C DD 6E 06      [19]  817 	ld	l,6 (ix)
   4A1F E5            [11]  818 	push	hl
   4A20 DD 66 F2      [19]  819 	ld	h,-14 (ix)
   4A23 DD 6E F3      [19]  820 	ld	l,-13 (ix)
   4A26 E5            [11]  821 	push	hl
   4A27 CD 94 44      [17]  822 	call	_adjacentTiles
   4A2A F1            [10]  823 	pop	af
   4A2B F1            [10]  824 	pop	af
   4A2C F1            [10]  825 	pop	af
   4A2D DD 75 ED      [19]  826 	ld	-19 (ix),l
                            827 ;src/pathfinding.c:186: switch(movimiento){
   4A30 3E 03         [ 7]  828 	ld	a,#0x03
   4A32 DD 96 ED      [19]  829 	sub	a, -19 (ix)
   4A35 38 A8         [12]  830 	jr	C,00114$
                            831 ;src/pathfinding.c:190: k = k+2;
   4A37 DD 7E EF      [19]  832 	ld	a,-17 (ix)
   4A3A C6 02         [ 7]  833 	add	a, #0x02
   4A3C DD 77 FF      [19]  834 	ld	-1 (ix),a
                            835 ;src/pathfinding.c:186: switch(movimiento){
   4A3F DD 5E ED      [19]  836 	ld	e,-19 (ix)
   4A42 16 00         [ 7]  837 	ld	d,#0x00
   4A44 21 4A 4A      [10]  838 	ld	hl,#00180$
   4A47 19            [11]  839 	add	hl,de
   4A48 19            [11]  840 	add	hl,de
                            841 ;src/pathfinding.c:187: case 0:
   4A49 E9            [ 4]  842 	jp	(hl)
   4A4A                     843 00180$:
   4A4A 18 06         [12]  844 	jr	00104$
   4A4C 18 2C         [12]  845 	jr	00105$
   4A4E 18 52         [12]  846 	jr	00106$
   4A50 18 70         [12]  847 	jr	00107$
   4A52                     848 00104$:
                            849 ;src/pathfinding.c:188: inserted = anyadirALista(x, y-2);
   4A52 DD 7E F2      [19]  850 	ld	a,-14 (ix)
   4A55 C6 FE         [ 7]  851 	add	a,#0xFE
   4A57 DD 77 FB      [19]  852 	ld	-5 (ix), a
   4A5A F5            [11]  853 	push	af
   4A5B 33            [ 6]  854 	inc	sp
   4A5C DD 7E F3      [19]  855 	ld	a,-13 (ix)
   4A5F F5            [11]  856 	push	af
   4A60 33            [ 6]  857 	inc	sp
   4A61 CD 5C 44      [17]  858 	call	_anyadirALista
   4A64 F1            [10]  859 	pop	af
   4A65 DD 75 FE      [19]  860 	ld	-2 (ix), l
   4A68 DD 75 EE      [19]  861 	ld	-18 (ix), l
                            862 ;src/pathfinding.c:189: y = y-2;
   4A6B DD 4E FB      [19]  863 	ld	c,-5 (ix)
   4A6E DD 71 F2      [19]  864 	ld	-14 (ix),c
                            865 ;src/pathfinding.c:190: k = k+2;
   4A71 DD 7E FF      [19]  866 	ld	a,-1 (ix)
   4A74 DD 77 EF      [19]  867 	ld	-17 (ix),a
                            868 ;src/pathfinding.c:191: break;
   4A77 C3 DF 49      [10]  869 	jp	00114$
                            870 ;src/pathfinding.c:192: case 1:
   4A7A                     871 00105$:
                            872 ;src/pathfinding.c:195: inserted = anyadirALista(x, y+2);
   4A7A DD 7E F2      [19]  873 	ld	a,-14 (ix)
   4A7D C6 02         [ 7]  874 	add	a, #0x02
   4A7F DD 77 FE      [19]  875 	ld	-2 (ix), a
   4A82 F5            [11]  876 	push	af
   4A83 33            [ 6]  877 	inc	sp
   4A84 DD 7E F3      [19]  878 	ld	a,-13 (ix)
   4A87 F5            [11]  879 	push	af
   4A88 33            [ 6]  880 	inc	sp
   4A89 CD 5C 44      [17]  881 	call	_anyadirALista
   4A8C F1            [10]  882 	pop	af
   4A8D DD 75 FB      [19]  883 	ld	-5 (ix), l
   4A90 DD 75 EE      [19]  884 	ld	-18 (ix), l
                            885 ;src/pathfinding.c:196: y = y+2;
   4A93 DD 4E FE      [19]  886 	ld	c,-2 (ix)
   4A96 DD 71 F2      [19]  887 	ld	-14 (ix),c
                            888 ;src/pathfinding.c:197: k = k+2;
   4A99 DD 7E FF      [19]  889 	ld	a,-1 (ix)
   4A9C DD 77 EF      [19]  890 	ld	-17 (ix),a
                            891 ;src/pathfinding.c:198: break;
   4A9F C3 DF 49      [10]  892 	jp	00114$
                            893 ;src/pathfinding.c:199: case 2:
   4AA2                     894 00106$:
                            895 ;src/pathfinding.c:202: inserted = anyadirALista(x-1, y);
   4AA2 DD 46 F3      [19]  896 	ld	b,-13 (ix)
   4AA5 05            [ 4]  897 	dec	b
   4AA6 C5            [11]  898 	push	bc
   4AA7 DD 7E F2      [19]  899 	ld	a,-14 (ix)
   4AAA F5            [11]  900 	push	af
   4AAB 33            [ 6]  901 	inc	sp
   4AAC C5            [11]  902 	push	bc
   4AAD 33            [ 6]  903 	inc	sp
   4AAE CD 5C 44      [17]  904 	call	_anyadirALista
   4AB1 F1            [10]  905 	pop	af
   4AB2 C1            [10]  906 	pop	bc
   4AB3 DD 75 EE      [19]  907 	ld	-18 (ix),l
                            908 ;src/pathfinding.c:203: x = x-1;
   4AB6 DD 70 F3      [19]  909 	ld	-13 (ix),b
                            910 ;src/pathfinding.c:204: k = k+2;
   4AB9 DD 7E FF      [19]  911 	ld	a,-1 (ix)
   4ABC DD 77 EF      [19]  912 	ld	-17 (ix),a
                            913 ;src/pathfinding.c:205: break;
   4ABF C3 DF 49      [10]  914 	jp	00114$
                            915 ;src/pathfinding.c:206: case 3:
   4AC2                     916 00107$:
                            917 ;src/pathfinding.c:207: inserted = anyadirALista(x+1, y);
   4AC2 DD 7E F3      [19]  918 	ld	a,-13 (ix)
   4AC5 3C            [ 4]  919 	inc	a
   4AC6 DD 77 FE      [19]  920 	ld	-2 (ix),a
   4AC9 DD 66 F2      [19]  921 	ld	h,-14 (ix)
   4ACC DD 6E FE      [19]  922 	ld	l,-2 (ix)
   4ACF E5            [11]  923 	push	hl
   4AD0 CD 5C 44      [17]  924 	call	_anyadirALista
   4AD3 F1            [10]  925 	pop	af
   4AD4 DD 75 EE      [19]  926 	ld	-18 (ix),l
                            927 ;src/pathfinding.c:208: x = x+1;
   4AD7 DD 7E FE      [19]  928 	ld	a,-2 (ix)
   4ADA DD 77 F3      [19]  929 	ld	-13 (ix),a
                            930 ;src/pathfinding.c:209: k = k+2;
   4ADD DD 7E FF      [19]  931 	ld	a,-1 (ix)
   4AE0 DD 77 EF      [19]  932 	ld	-17 (ix),a
                            933 ;src/pathfinding.c:212: }
   4AE3 C3 DF 49      [10]  934 	jp	00114$
   4AE6                     935 00118$:
                            936 ;src/pathfinding.c:217: problem = 1;
   4AE6 DD 36 F1 01   [19]  937 	ld	-15 (ix),#0x01
   4AEA                     938 00119$:
                            939 ;src/pathfinding.c:219: if(problem == 0){
   4AEA DD 7E F1      [19]  940 	ld	a,-15 (ix)
   4AED B7            [ 4]  941 	or	a, a
   4AEE 20 74         [12]  942 	jr	NZ,00126$
                            943 ;src/pathfinding.c:220: if(sol_tam < CAMINO_TAM){
   4AF0 3A 38 63      [13]  944 	ld	a,(#_sol_tam + 0)
   4AF3 D6 C8         [ 7]  945 	sub	a, #0xC8
   4AF5 30 0C         [12]  946 	jr	NC,00122$
                            947 ;src/pathfinding.c:221: actual->longitud_camino = sol_tam;
   4AF7 DD 6E F5      [19]  948 	ld	l,-11 (ix)
   4AFA DD 66 F6      [19]  949 	ld	h,-10 (ix)
   4AFD 3A 38 63      [13]  950 	ld	a,(#_sol_tam + 0)
   4B00 77            [ 7]  951 	ld	(hl),a
   4B01 18 08         [12]  952 	jr	00142$
   4B03                     953 00122$:
                            954 ;src/pathfinding.c:223: actual->longitud_camino = CAMINO_TAM;
   4B03 DD 6E F5      [19]  955 	ld	l,-11 (ix)
   4B06 DD 66 F6      [19]  956 	ld	h,-10 (ix)
   4B09 36 C8         [10]  957 	ld	(hl),#0xC8
                            958 ;src/pathfinding.c:225: for (i; i<actual->longitud_camino; i++){
   4B0B                     959 00142$:
   4B0B DD 7E F7      [19]  960 	ld	a,-9 (ix)
   4B0E C6 1A         [ 7]  961 	add	a, #0x1A
   4B10 DD 77 F7      [19]  962 	ld	-9 (ix),a
   4B13 DD 7E F8      [19]  963 	ld	a,-8 (ix)
   4B16 CE 00         [ 7]  964 	adc	a, #0x00
   4B18 DD 77 F8      [19]  965 	ld	-8 (ix),a
   4B1B DD 36 F0 00   [19]  966 	ld	-16 (ix),#0x00
   4B1F                     967 00129$:
   4B1F DD 6E F5      [19]  968 	ld	l,-11 (ix)
   4B22 DD 66 F6      [19]  969 	ld	h,-10 (ix)
   4B25 DD 7E F0      [19]  970 	ld	a,-16 (ix)
   4B28 96            [ 7]  971 	sub	a,(hl)
   4B29 30 41         [12]  972 	jr	NC,00131$
                            973 ;src/pathfinding.c:226: actual->camino[i] = camino[i];
   4B2B DD 7E F0      [19]  974 	ld	a,-16 (ix)
   4B2E DD 86 F7      [19]  975 	add	a, -9 (ix)
   4B31 DD 77 FC      [19]  976 	ld	-4 (ix),a
   4B34 3E 00         [ 7]  977 	ld	a,#0x00
   4B36 DD 8E F8      [19]  978 	adc	a, -8 (ix)
   4B39 DD 77 FD      [19]  979 	ld	-3 (ix),a
   4B3C 3E 39         [ 7]  980 	ld	a,#<(_camino)
   4B3E DD 86 F0      [19]  981 	add	a, -16 (ix)
   4B41 DD 77 F9      [19]  982 	ld	-7 (ix),a
   4B44 3E 63         [ 7]  983 	ld	a,#>(_camino)
   4B46 CE 00         [ 7]  984 	adc	a, #0x00
   4B48 DD 77 FA      [19]  985 	ld	-6 (ix),a
   4B4B DD 6E F9      [19]  986 	ld	l,-7 (ix)
   4B4E DD 66 FA      [19]  987 	ld	h,-6 (ix)
   4B51 7E            [ 7]  988 	ld	a,(hl)
   4B52 DD 77 F9      [19]  989 	ld	-7 (ix),a
   4B55 DD 6E FC      [19]  990 	ld	l,-4 (ix)
   4B58 DD 66 FD      [19]  991 	ld	h,-3 (ix)
   4B5B DD 7E F9      [19]  992 	ld	a,-7 (ix)
   4B5E 77            [ 7]  993 	ld	(hl),a
                            994 ;src/pathfinding.c:225: for (i; i<actual->longitud_camino; i++){
   4B5F DD 34 F0      [23]  995 	inc	-16 (ix)
   4B62 18 BB         [12]  996 	jr	00129$
   4B64                     997 00126$:
                            998 ;src/pathfinding.c:230: actual->longitud_camino = 0;
   4B64 DD 6E F5      [19]  999 	ld	l,-11 (ix)
   4B67 DD 66 F6      [19] 1000 	ld	h,-10 (ix)
   4B6A 36 00         [10] 1001 	ld	(hl),#0x00
   4B6C                    1002 00131$:
   4B6C DD F9         [10] 1003 	ld	sp, ix
   4B6E DD E1         [14] 1004 	pop	ix
   4B70 C9            [10] 1005 	ret
                           1006 	.area _CODE
                           1007 	.area _INITIALIZER
                           1008 	.area _CABS (ABS)
