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
                             15 	.globl _bitWeights
                             16 	.globl _anyadirALista
                             17 	.globl _adjacentTiles
                             18 	.globl _pathFinding
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   652F                      26 _sol_tam::
   652F                      27 	.ds 1
   6530                      28 _camino::
   6530                      29 	.ds 200
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/pathfinding.c:10: u8 anyadirALista(u8 x, u8 y){
                             55 ;	---------------------------------
                             56 ; Function anyadirALista
                             57 ; ---------------------------------
   43EF                      58 _anyadirALista::
                             59 ;src/pathfinding.c:11: u8 anyadido = 0;
   43EF 0E 00         [ 7]   60 	ld	c,#0x00
                             61 ;src/pathfinding.c:13: if(sol_tam < CAMINO_TAM){
   43F1 3A 2F 65      [13]   62 	ld	a,(#_sol_tam + 0)
   43F4 D6 C8         [ 7]   63 	sub	a, #0xC8
   43F6 30 33         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam-1] = x;
   43F8 01 30 65      [10]   66 	ld	bc,#_camino+0
   43FB 21 2F 65      [10]   67 	ld	hl,#_sol_tam + 0
   43FE 5E            [ 7]   68 	ld	e, (hl)
   43FF 1D            [ 4]   69 	dec	e
   4400 6B            [ 4]   70 	ld	l,e
   4401 26 00         [ 7]   71 	ld	h,#0x00
   4403 09            [11]   72 	add	hl,bc
   4404 FD 21 02 00   [14]   73 	ld	iy,#2
   4408 FD 39         [15]   74 	add	iy,sp
   440A FD 7E 00      [19]   75 	ld	a,0 (iy)
   440D 77            [ 7]   76 	ld	(hl),a
                             77 ;src/pathfinding.c:15: sol_tam++;
   440E 21 2F 65      [10]   78 	ld	hl, #_sol_tam+0
   4411 34            [11]   79 	inc	(hl)
                             80 ;src/pathfinding.c:16: camino[sol_tam-1] = y;
   4412 21 2F 65      [10]   81 	ld	hl,#_sol_tam + 0
   4415 5E            [ 7]   82 	ld	e, (hl)
   4416 1D            [ 4]   83 	dec	e
   4417 6B            [ 4]   84 	ld	l,e
   4418 26 00         [ 7]   85 	ld	h,#0x00
   441A 09            [11]   86 	add	hl,bc
   441B FD 21 03 00   [14]   87 	ld	iy,#3
   441F FD 39         [15]   88 	add	iy,sp
   4421 FD 7E 00      [19]   89 	ld	a,0 (iy)
   4424 77            [ 7]   90 	ld	(hl),a
                             91 ;src/pathfinding.c:17: sol_tam++;
   4425 21 2F 65      [10]   92 	ld	hl, #_sol_tam+0
   4428 34            [11]   93 	inc	(hl)
                             94 ;src/pathfinding.c:18: anyadido = 1;
   4429 0E 01         [ 7]   95 	ld	c,#0x01
   442B                      96 00102$:
                             97 ;src/pathfinding.c:21: return anyadido;
   442B 69            [ 4]   98 	ld	l,c
   442C C9            [10]   99 	ret
   442D                     100 _bitWeights:
   442D 01 00               101 	.dw #0x0001
   442F 02 00               102 	.dw #0x0002
   4431 04 00               103 	.dw #0x0004
   4433 08 00               104 	.dw #0x0008
   4435 10 00               105 	.dw #0x0010
   4437 20 00               106 	.dw #0x0020
   4439 40 00               107 	.dw #0x0040
   443B 80 00               108 	.dw #0x0080
                            109 ;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            110 ;	---------------------------------
                            111 ; Function adjacentTiles
                            112 ; ---------------------------------
   443D                     113 _adjacentTiles::
   443D DD E5         [15]  114 	push	ix
   443F DD 21 00 00   [14]  115 	ld	ix,#0
   4443 DD 39         [15]  116 	add	ix,sp
   4445 21 DF FF      [10]  117 	ld	hl,#-33
   4448 39            [11]  118 	add	hl,sp
   4449 F9            [ 6]  119 	ld	sp,hl
                            120 ;src/pathfinding.c:26: u8 resultado = 4;
   444A DD 36 EF 04   [19]  121 	ld	-17 (ix),#0x04
                            122 ;src/pathfinding.c:28: i16 dist1 = 0;
   444E DD 36 E7 00   [19]  123 	ld	-25 (ix),#0x00
   4452 DD 36 E8 00   [19]  124 	ld	-24 (ix),#0x00
                            125 ;src/pathfinding.c:29: i16 dist2 = 0;
   4456 DD 36 E9 00   [19]  126 	ld	-23 (ix),#0x00
   445A DD 36 EA 00   [19]  127 	ld	-22 (ix),#0x00
                            128 ;src/pathfinding.c:30: i16 dist3 = 0;
   445E DD 36 EB 00   [19]  129 	ld	-21 (ix),#0x00
   4462 DD 36 EC 00   [19]  130 	ld	-20 (ix),#0x00
                            131 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   4466 DD 36 E5 00   [19]  132 	ld	-27 (ix),#0x00
   446A DD 36 E6 00   [19]  133 	ld	-26 (ix),#0x00
                            134 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   446E DD 36 E1 00   [19]  135 	ld	-31 (ix),#0x00
   4472 DD 36 E2 00   [19]  136 	ld	-30 (ix),#0x00
                            137 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   4476 DD 36 E3 00   [19]  138 	ld	-29 (ix),#0x00
   447A DD 36 E4 00   [19]  139 	ld	-28 (ix),#0x00
                            140 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   447E 21 00 00      [10]  141 	ld	hl,#0x0000
   4481 E3            [19]  142 	ex	(sp), hl
                            143 ;src/pathfinding.c:41: if(x == f_x){
   4482 DD 7E 04      [19]  144 	ld	a,4 (ix)
   4485 DD 96 08      [19]  145 	sub	a, 8 (ix)
   4488 20 20         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   448A DD 7E 05      [19]  148 	ld	a,5 (ix)
   448D DD 96 09      [19]  149 	sub	a, 9 (ix)
   4490 30 04         [12]  150 	jr	NC,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   4492 21 FF FF      [10]  152 	ld	hl,#0xFFFF
   4495 E3            [19]  153 	ex	(sp), hl
   4496                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   4496 DD 7E 09      [19]  156 	ld	a,9 (ix)
   4499 DD 96 05      [19]  157 	sub	a, 5 (ix)
   449C D2 24 45      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   449F DD 36 E3 FF   [19]  160 	ld	-29 (ix),#0xFF
   44A3 DD 36 E4 FF   [19]  161 	ld	-28 (ix),#0xFF
   44A7 C3 24 45      [10]  162 	jp	00125$
   44AA                     163 00124$:
                            164 ;src/pathfinding.c:49: }else if(y == f_y){
   44AA DD 7E 05      [19]  165 	ld	a,5 (ix)
   44AD DD 96 09      [19]  166 	sub	a, 9 (ix)
   44B0 20 22         [12]  167 	jr	NZ,00121$
                            168 ;src/pathfinding.c:51: if(x < f_x)
   44B2 DD 7E 04      [19]  169 	ld	a,4 (ix)
   44B5 DD 96 08      [19]  170 	sub	a, 8 (ix)
   44B8 30 08         [12]  171 	jr	NC,00106$
                            172 ;src/pathfinding.c:52: heu_derecha = -1;
   44BA DD 36 E5 FF   [19]  173 	ld	-27 (ix),#0xFF
   44BE DD 36 E6 FF   [19]  174 	ld	-26 (ix),#0xFF
   44C2                     175 00106$:
                            176 ;src/pathfinding.c:53: if(x > f_x)
   44C2 DD 7E 08      [19]  177 	ld	a,8 (ix)
   44C5 DD 96 04      [19]  178 	sub	a, 4 (ix)
   44C8 30 5A         [12]  179 	jr	NC,00125$
                            180 ;src/pathfinding.c:54: heu_izquierda = -1;
   44CA DD 36 E1 FF   [19]  181 	ld	-31 (ix),#0xFF
   44CE DD 36 E2 FF   [19]  182 	ld	-30 (ix),#0xFF
   44D2 18 50         [12]  183 	jr	00125$
   44D4                     184 00121$:
                            185 ;src/pathfinding.c:60: if(s_y < f_y)
   44D4 DD 7E 07      [19]  186 	ld	a,7 (ix)
   44D7 DD 96 09      [19]  187 	sub	a, 9 (ix)
   44DA 3E 00         [ 7]  188 	ld	a,#0x00
   44DC 17            [ 4]  189 	rla
   44DD 4F            [ 4]  190 	ld	c,a
                            191 ;src/pathfinding.c:59: if(s_x < f_x){
   44DE DD 7E 06      [19]  192 	ld	a,6 (ix)
   44E1 DD 96 08      [19]  193 	sub	a, 8 (ix)
   44E4 30 1C         [12]  194 	jr	NC,00118$
                            195 ;src/pathfinding.c:60: if(s_y < f_y)
   44E6 79            [ 4]  196 	ld	a,c
   44E7 B7            [ 4]  197 	or	a, a
   44E8 28 06         [12]  198 	jr	Z,00110$
                            199 ;src/pathfinding.c:61: heu_abajo = -1;
   44EA 21 FF FF      [10]  200 	ld	hl,#0xFFFF
   44ED E3            [19]  201 	ex	(sp), hl
   44EE 18 08         [12]  202 	jr	00111$
   44F0                     203 00110$:
                            204 ;src/pathfinding.c:63: heu_arriba = -1;
   44F0 DD 36 E3 FF   [19]  205 	ld	-29 (ix),#0xFF
   44F4 DD 36 E4 FF   [19]  206 	ld	-28 (ix),#0xFF
   44F8                     207 00111$:
                            208 ;src/pathfinding.c:65: heu_derecha = -1;
   44F8 DD 36 E5 FF   [19]  209 	ld	-27 (ix),#0xFF
   44FC DD 36 E6 FF   [19]  210 	ld	-26 (ix),#0xFF
   4500 18 22         [12]  211 	jr	00125$
   4502                     212 00118$:
                            213 ;src/pathfinding.c:66: }else if(s_x > f_x){
   4502 DD 7E 08      [19]  214 	ld	a,8 (ix)
   4505 DD 96 06      [19]  215 	sub	a, 6 (ix)
   4508 30 1A         [12]  216 	jr	NC,00125$
                            217 ;src/pathfinding.c:68: if(s_y < f_y)
   450A 79            [ 4]  218 	ld	a,c
   450B B7            [ 4]  219 	or	a, a
   450C 28 06         [12]  220 	jr	Z,00113$
                            221 ;src/pathfinding.c:69: heu_abajo = -1;
   450E 21 FF FF      [10]  222 	ld	hl,#0xFFFF
   4511 E3            [19]  223 	ex	(sp), hl
   4512 18 08         [12]  224 	jr	00114$
   4514                     225 00113$:
                            226 ;src/pathfinding.c:71: heu_arriba = -1;
   4514 DD 36 E3 FF   [19]  227 	ld	-29 (ix),#0xFF
   4518 DD 36 E4 FF   [19]  228 	ld	-28 (ix),#0xFF
   451C                     229 00114$:
                            230 ;src/pathfinding.c:73: heu_izquierda = -1;
   451C DD 36 E1 FF   [19]  231 	ld	-31 (ix),#0xFF
   4520 DD 36 E2 FF   [19]  232 	ld	-30 (ix),#0xFF
   4524                     233 00125$:
                            234 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   4524 DD 7E 05      [19]  235 	ld	a,5 (ix)
   4527 C6 FE         [ 7]  236 	add	a,#0xFE
   4529 DD 77 FC      [19]  237 	ld	-4 (ix), a
   452C F5            [11]  238 	push	af
   452D 33            [ 6]  239 	inc	sp
   452E DD 7E 04      [19]  240 	ld	a,4 (ix)
   4531 F5            [11]  241 	push	af
   4532 33            [ 6]  242 	inc	sp
   4533 DD 6E 0A      [19]  243 	ld	l,10 (ix)
   4536 DD 66 0B      [19]  244 	ld	h,11 (ix)
   4539 E5            [11]  245 	push	hl
   453A CD C4 4A      [17]  246 	call	_getTilePtr
   453D F1            [10]  247 	pop	af
   453E F1            [10]  248 	pop	af
   453F 4E            [ 7]  249 	ld	c,(hl)
                            250 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2){
   4540 DD 7E 04      [19]  251 	ld	a,4 (ix)
   4543 C6 04         [ 7]  252 	add	a, #0x04
   4545 DD 77 FF      [19]  253 	ld	-1 (ix),a
                            254 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4548 DD 7E 08      [19]  255 	ld	a,8 (ix)
   454B DD 77 F4      [19]  256 	ld	-12 (ix),a
   454E DD 36 F5 00   [19]  257 	ld	-11 (ix),#0x00
   4552 DD 7E 04      [19]  258 	ld	a,4 (ix)
   4555 DD 77 F2      [19]  259 	ld	-14 (ix),a
   4558 DD 36 F3 00   [19]  260 	ld	-13 (ix),#0x00
   455C DD 7E 09      [19]  261 	ld	a,9 (ix)
   455F DD 77 F0      [19]  262 	ld	-16 (ix),a
   4562 DD 36 F1 00   [19]  263 	ld	-15 (ix),#0x00
   4566 DD 7E 05      [19]  264 	ld	a,5 (ix)
   4569 DD 77 FA      [19]  265 	ld	-6 (ix),a
   456C DD 36 FB 00   [19]  266 	ld	-5 (ix),#0x00
   4570 DD 7E F4      [19]  267 	ld	a,-12 (ix)
   4573 DD 96 F2      [19]  268 	sub	a, -14 (ix)
   4576 DD 77 F6      [19]  269 	ld	-10 (ix),a
   4579 DD 7E F5      [19]  270 	ld	a,-11 (ix)
   457C DD 9E F3      [19]  271 	sbc	a, -13 (ix)
   457F DD 77 F7      [19]  272 	ld	-9 (ix),a
                            273 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   4582 3E 02         [ 7]  274 	ld	a,#0x02
   4584 91            [ 4]  275 	sub	a, c
   4585 DA 19 46      [10]  276 	jp	C,00127$
                            277 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2){
   4588 DD 66 FC      [19]  278 	ld	h,-4 (ix)
   458B DD 6E FF      [19]  279 	ld	l,-1 (ix)
   458E E5            [11]  280 	push	hl
   458F DD 6E 0A      [19]  281 	ld	l,10 (ix)
   4592 DD 66 0B      [19]  282 	ld	h,11 (ix)
   4595 E5            [11]  283 	push	hl
   4596 CD C4 4A      [17]  284 	call	_getTilePtr
   4599 F1            [10]  285 	pop	af
   459A F1            [10]  286 	pop	af
   459B 4E            [ 7]  287 	ld	c,(hl)
   459C 3E 02         [ 7]  288 	ld	a,#0x02
   459E 91            [ 4]  289 	sub	a, c
   459F 38 78         [12]  290 	jr	C,00127$
                            291 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45A1 DD 6E F6      [19]  292 	ld	l,-10 (ix)
   45A4 DD 66 F7      [19]  293 	ld	h,-9 (ix)
   45A7 E5            [11]  294 	push	hl
   45A8 CD 08 4B      [17]  295 	call	_abs
   45AB F1            [10]  296 	pop	af
   45AC DD 74 FE      [19]  297 	ld	-2 (ix),h
   45AF DD 75 FD      [19]  298 	ld	-3 (ix),l
   45B2 DD 7E FA      [19]  299 	ld	a,-6 (ix)
   45B5 C6 FE         [ 7]  300 	add	a,#0xFE
   45B7 DD 77 F8      [19]  301 	ld	-8 (ix),a
   45BA DD 7E FB      [19]  302 	ld	a,-5 (ix)
   45BD CE FF         [ 7]  303 	adc	a,#0xFF
   45BF DD 77 F9      [19]  304 	ld	-7 (ix),a
   45C2 DD 7E F0      [19]  305 	ld	a,-16 (ix)
   45C5 DD 96 F8      [19]  306 	sub	a, -8 (ix)
   45C8 DD 77 F8      [19]  307 	ld	-8 (ix),a
   45CB DD 7E F1      [19]  308 	ld	a,-15 (ix)
   45CE DD 9E F9      [19]  309 	sbc	a, -7 (ix)
   45D1 DD 77 F9      [19]  310 	ld	-7 (ix),a
   45D4 DD 6E F8      [19]  311 	ld	l,-8 (ix)
   45D7 DD 66 F9      [19]  312 	ld	h,-7 (ix)
   45DA E5            [11]  313 	push	hl
   45DB CD 08 4B      [17]  314 	call	_abs
   45DE F1            [10]  315 	pop	af
   45DF DD 74 F9      [19]  316 	ld	-7 (ix),h
   45E2 DD 75 F8      [19]  317 	ld	-8 (ix),l
   45E5 DD 7E FD      [19]  318 	ld	a,-3 (ix)
   45E8 DD 86 F8      [19]  319 	add	a, -8 (ix)
   45EB DD 77 F8      [19]  320 	ld	-8 (ix),a
   45EE DD 7E FE      [19]  321 	ld	a,-2 (ix)
   45F1 DD 8E F9      [19]  322 	adc	a, -7 (ix)
   45F4 DD 77 F9      [19]  323 	ld	-7 (ix),a
   45F7 DD 7E F8      [19]  324 	ld	a,-8 (ix)
   45FA DD 86 E3      [19]  325 	add	a, -29 (ix)
   45FD DD 77 F8      [19]  326 	ld	-8 (ix),a
   4600 DD 7E F9      [19]  327 	ld	a,-7 (ix)
   4603 DD 8E E4      [19]  328 	adc	a, -28 (ix)
   4606 DD 77 F9      [19]  329 	ld	-7 (ix),a
   4609 DD 7E F8      [19]  330 	ld	a,-8 (ix)
   460C DD 77 E7      [19]  331 	ld	-25 (ix),a
   460F DD 7E F9      [19]  332 	ld	a,-7 (ix)
   4612 DD 77 E8      [19]  333 	ld	-24 (ix),a
                            334 ;src/pathfinding.c:81: resultado = 0;
   4615 DD 36 EF 00   [19]  335 	ld	-17 (ix),#0x00
   4619                     336 00127$:
                            337 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, (y + G_ENEMY_H)) <=2 &&
   4619 DD 7E 05      [19]  338 	ld	a,5 (ix)
   461C C6 16         [ 7]  339 	add	a, #0x16
   461E DD 77 F8      [19]  340 	ld	-8 (ix), a
   4621 F5            [11]  341 	push	af
   4622 33            [ 6]  342 	inc	sp
   4623 DD 7E 04      [19]  343 	ld	a,4 (ix)
   4626 F5            [11]  344 	push	af
   4627 33            [ 6]  345 	inc	sp
   4628 DD 6E 0A      [19]  346 	ld	l,10 (ix)
   462B DD 66 0B      [19]  347 	ld	h,11 (ix)
   462E E5            [11]  348 	push	hl
   462F CD C4 4A      [17]  349 	call	_getTilePtr
   4632 F1            [10]  350 	pop	af
   4633 F1            [10]  351 	pop	af
   4634 4E            [ 7]  352 	ld	c,(hl)
   4635 3E 02         [ 7]  353 	ld	a,#0x02
   4637 91            [ 4]  354 	sub	a, c
   4638 DA ED 46      [10]  355 	jp	C,00135$
                            356 ;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2){
   463B DD 66 F8      [19]  357 	ld	h,-8 (ix)
   463E DD 6E FF      [19]  358 	ld	l,-1 (ix)
   4641 E5            [11]  359 	push	hl
   4642 DD 6E 0A      [19]  360 	ld	l,10 (ix)
   4645 DD 66 0B      [19]  361 	ld	h,11 (ix)
   4648 E5            [11]  362 	push	hl
   4649 CD C4 4A      [17]  363 	call	_getTilePtr
   464C F1            [10]  364 	pop	af
   464D F1            [10]  365 	pop	af
   464E 4E            [ 7]  366 	ld	c,(hl)
   464F 3E 02         [ 7]  367 	ld	a,#0x02
   4651 91            [ 4]  368 	sub	a, c
   4652 DA ED 46      [10]  369 	jp	C,00135$
                            370 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   4655 DD 6E F6      [19]  371 	ld	l,-10 (ix)
   4658 DD 66 F7      [19]  372 	ld	h,-9 (ix)
   465B E5            [11]  373 	push	hl
   465C CD 08 4B      [17]  374 	call	_abs
   465F F1            [10]  375 	pop	af
   4660 DD 74 F9      [19]  376 	ld	-7 (ix),h
   4663 DD 75 F8      [19]  377 	ld	-8 (ix),l
   4666 DD 7E FA      [19]  378 	ld	a,-6 (ix)
   4669 C6 02         [ 7]  379 	add	a, #0x02
   466B DD 77 FD      [19]  380 	ld	-3 (ix),a
   466E DD 7E FB      [19]  381 	ld	a,-5 (ix)
   4671 CE 00         [ 7]  382 	adc	a, #0x00
   4673 DD 77 FE      [19]  383 	ld	-2 (ix),a
   4676 DD 7E F0      [19]  384 	ld	a,-16 (ix)
   4679 DD 96 FD      [19]  385 	sub	a, -3 (ix)
   467C DD 77 FD      [19]  386 	ld	-3 (ix),a
   467F DD 7E F1      [19]  387 	ld	a,-15 (ix)
   4682 DD 9E FE      [19]  388 	sbc	a, -2 (ix)
   4685 DD 77 FE      [19]  389 	ld	-2 (ix),a
   4688 DD 6E FD      [19]  390 	ld	l,-3 (ix)
   468B DD 66 FE      [19]  391 	ld	h,-2 (ix)
   468E E5            [11]  392 	push	hl
   468F CD 08 4B      [17]  393 	call	_abs
   4692 F1            [10]  394 	pop	af
   4693 DD 74 FE      [19]  395 	ld	-2 (ix),h
   4696 DD 75 FD      [19]  396 	ld	-3 (ix),l
   4699 DD 7E F8      [19]  397 	ld	a,-8 (ix)
   469C DD 86 FD      [19]  398 	add	a, -3 (ix)
   469F DD 77 F8      [19]  399 	ld	-8 (ix),a
   46A2 DD 7E F9      [19]  400 	ld	a,-7 (ix)
   46A5 DD 8E FE      [19]  401 	adc	a, -2 (ix)
   46A8 DD 77 F9      [19]  402 	ld	-7 (ix),a
   46AB DD 7E F8      [19]  403 	ld	a,-8 (ix)
   46AE DD 86 DF      [19]  404 	add	a, -33 (ix)
   46B1 DD 77 F8      [19]  405 	ld	-8 (ix),a
   46B4 DD 7E F9      [19]  406 	ld	a,-7 (ix)
   46B7 DD 8E E0      [19]  407 	adc	a, -32 (ix)
   46BA DD 77 F9      [19]  408 	ld	-7 (ix),a
   46BD DD 7E F8      [19]  409 	ld	a,-8 (ix)
   46C0 DD 77 E9      [19]  410 	ld	-23 (ix),a
   46C3 DD 7E F9      [19]  411 	ld	a,-7 (ix)
   46C6 DD 77 EA      [19]  412 	ld	-22 (ix),a
                            413 ;src/pathfinding.c:87: if(resultado == 0){
   46C9 DD 7E EF      [19]  414 	ld	a,-17 (ix)
   46CC B7            [ 4]  415 	or	a, a
   46CD 20 1A         [12]  416 	jr	NZ,00132$
                            417 ;src/pathfinding.c:88: if(dist1 > dist2)
   46CF DD 7E E9      [19]  418 	ld	a,-23 (ix)
   46D2 DD 96 E7      [19]  419 	sub	a, -25 (ix)
   46D5 DD 7E EA      [19]  420 	ld	a,-22 (ix)
   46D8 DD 9E E8      [19]  421 	sbc	a, -24 (ix)
   46DB E2 E0 46      [10]  422 	jp	PO, 00304$
   46DE EE 80         [ 7]  423 	xor	a, #0x80
   46E0                     424 00304$:
   46E0 F2 ED 46      [10]  425 	jp	P,00135$
                            426 ;src/pathfinding.c:89: resultado = 1;
   46E3 DD 36 EF 01   [19]  427 	ld	-17 (ix),#0x01
   46E7 18 04         [12]  428 	jr	00135$
   46E9                     429 00132$:
                            430 ;src/pathfinding.c:91: resultado = 1;
   46E9 DD 36 EF 01   [19]  431 	ld	-17 (ix),#0x01
   46ED                     432 00135$:
                            433 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   46ED DD 4E 04      [19]  434 	ld	c,4 (ix)
   46F0 0D            [ 4]  435 	dec	c
   46F1 C5            [11]  436 	push	bc
   46F2 DD 7E 05      [19]  437 	ld	a,5 (ix)
   46F5 F5            [11]  438 	push	af
   46F6 33            [ 6]  439 	inc	sp
   46F7 79            [ 4]  440 	ld	a,c
   46F8 F5            [11]  441 	push	af
   46F9 33            [ 6]  442 	inc	sp
   46FA DD 6E 0A      [19]  443 	ld	l,10 (ix)
   46FD DD 66 0B      [19]  444 	ld	h,11 (ix)
   4700 E5            [11]  445 	push	hl
   4701 CD C4 4A      [17]  446 	call	_getTilePtr
   4704 F1            [10]  447 	pop	af
   4705 F1            [10]  448 	pop	af
   4706 C1            [10]  449 	pop	bc
   4707 46            [ 7]  450 	ld	b,(hl)
                            451 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4708 DD 7E 05      [19]  452 	ld	a,5 (ix)
   470B C6 14         [ 7]  453 	add	a, #0x14
   470D DD 77 F8      [19]  454 	ld	-8 (ix),a
                            455 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4710 DD 7E 05      [19]  456 	ld	a,5 (ix)
   4713 C6 0B         [ 7]  457 	add	a, #0x0B
   4715 DD 77 FD      [19]  458 	ld	-3 (ix),a
                            459 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4718 DD 7E F0      [19]  460 	ld	a,-16 (ix)
   471B DD 96 FA      [19]  461 	sub	a, -6 (ix)
   471E DD 77 F6      [19]  462 	ld	-10 (ix),a
   4721 DD 7E F1      [19]  463 	ld	a,-15 (ix)
   4724 DD 9E FB      [19]  464 	sbc	a, -5 (ix)
   4727 DD 77 F7      [19]  465 	ld	-9 (ix),a
                            466 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   472A 3E 02         [ 7]  467 	ld	a,#0x02
   472C 90            [ 4]  468 	sub	a, b
   472D DA DB 47      [10]  469 	jp	C,00148$
                            470 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4730 C5            [11]  471 	push	bc
   4731 DD 7E F8      [19]  472 	ld	a,-8 (ix)
   4734 F5            [11]  473 	push	af
   4735 33            [ 6]  474 	inc	sp
   4736 79            [ 4]  475 	ld	a,c
   4737 F5            [11]  476 	push	af
   4738 33            [ 6]  477 	inc	sp
   4739 DD 6E 0A      [19]  478 	ld	l,10 (ix)
   473C DD 66 0B      [19]  479 	ld	h,11 (ix)
   473F E5            [11]  480 	push	hl
   4740 CD C4 4A      [17]  481 	call	_getTilePtr
   4743 F1            [10]  482 	pop	af
   4744 F1            [10]  483 	pop	af
   4745 C1            [10]  484 	pop	bc
   4746 46            [ 7]  485 	ld	b,(hl)
   4747 3E 02         [ 7]  486 	ld	a,#0x02
   4749 90            [ 4]  487 	sub	a, b
   474A DA DB 47      [10]  488 	jp	C,00148$
                            489 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   474D DD 7E FD      [19]  490 	ld	a,-3 (ix)
   4750 F5            [11]  491 	push	af
   4751 33            [ 6]  492 	inc	sp
   4752 79            [ 4]  493 	ld	a,c
   4753 F5            [11]  494 	push	af
   4754 33            [ 6]  495 	inc	sp
   4755 DD 6E 0A      [19]  496 	ld	l,10 (ix)
   4758 DD 66 0B      [19]  497 	ld	h,11 (ix)
   475B E5            [11]  498 	push	hl
   475C CD C4 4A      [17]  499 	call	_getTilePtr
   475F F1            [10]  500 	pop	af
   4760 F1            [10]  501 	pop	af
   4761 4E            [ 7]  502 	ld	c,(hl)
   4762 3E 02         [ 7]  503 	ld	a,#0x02
   4764 91            [ 4]  504 	sub	a, c
   4765 38 74         [12]  505 	jr	C,00148$
                            506 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4767 DD 4E F2      [19]  507 	ld	c,-14 (ix)
   476A DD 46 F3      [19]  508 	ld	b,-13 (ix)
   476D 0B            [ 6]  509 	dec	bc
   476E DD 7E F4      [19]  510 	ld	a,-12 (ix)
   4771 91            [ 4]  511 	sub	a, c
   4772 4F            [ 4]  512 	ld	c,a
   4773 DD 7E F5      [19]  513 	ld	a,-11 (ix)
   4776 98            [ 4]  514 	sbc	a, b
   4777 47            [ 4]  515 	ld	b,a
   4778 C5            [11]  516 	push	bc
   4779 CD 08 4B      [17]  517 	call	_abs
   477C E3            [19]  518 	ex	(sp),hl
   477D DD 6E F6      [19]  519 	ld	l,-10 (ix)
   4780 DD 66 F7      [19]  520 	ld	h,-9 (ix)
   4783 E5            [11]  521 	push	hl
   4784 CD 08 4B      [17]  522 	call	_abs
   4787 F1            [10]  523 	pop	af
   4788 C1            [10]  524 	pop	bc
   4789 09            [11]  525 	add	hl,bc
   478A DD 5E E1      [19]  526 	ld	e,-31 (ix)
   478D DD 56 E2      [19]  527 	ld	d,-30 (ix)
   4790 19            [11]  528 	add	hl,de
   4791 DD 75 EB      [19]  529 	ld	-21 (ix),l
   4794 DD 74 EC      [19]  530 	ld	-20 (ix),h
                            531 ;src/pathfinding.c:99: if(resultado == 0){
   4797 DD 7E EF      [19]  532 	ld	a,-17 (ix)
   479A B7            [ 4]  533 	or	a, a
   479B 20 1A         [12]  534 	jr	NZ,00145$
                            535 ;src/pathfinding.c:100: if(dist1 >= dist3)
   479D DD 7E E7      [19]  536 	ld	a,-25 (ix)
   47A0 DD 96 EB      [19]  537 	sub	a, -21 (ix)
   47A3 DD 7E E8      [19]  538 	ld	a,-24 (ix)
   47A6 DD 9E EC      [19]  539 	sbc	a, -20 (ix)
   47A9 E2 AE 47      [10]  540 	jp	PO, 00305$
   47AC EE 80         [ 7]  541 	xor	a, #0x80
   47AE                     542 00305$:
   47AE FA DB 47      [10]  543 	jp	M,00148$
                            544 ;src/pathfinding.c:101: resultado = 2;
   47B1 DD 36 EF 02   [19]  545 	ld	-17 (ix),#0x02
   47B5 18 24         [12]  546 	jr	00148$
   47B7                     547 00145$:
                            548 ;src/pathfinding.c:102: }else if(resultado == 1){
   47B7 DD 7E EF      [19]  549 	ld	a,-17 (ix)
   47BA 3D            [ 4]  550 	dec	a
   47BB 20 1A         [12]  551 	jr	NZ,00142$
                            552 ;src/pathfinding.c:103: if(dist2 >= dist3)
   47BD DD 7E E9      [19]  553 	ld	a,-23 (ix)
   47C0 DD 96 EB      [19]  554 	sub	a, -21 (ix)
   47C3 DD 7E EA      [19]  555 	ld	a,-22 (ix)
   47C6 DD 9E EC      [19]  556 	sbc	a, -20 (ix)
   47C9 E2 CE 47      [10]  557 	jp	PO, 00308$
   47CC EE 80         [ 7]  558 	xor	a, #0x80
   47CE                     559 00308$:
   47CE FA DB 47      [10]  560 	jp	M,00148$
                            561 ;src/pathfinding.c:104: resultado = 2;
   47D1 DD 36 EF 02   [19]  562 	ld	-17 (ix),#0x02
   47D5 18 04         [12]  563 	jr	00148$
   47D7                     564 00142$:
                            565 ;src/pathfinding.c:106: resultado = 2;
   47D7 DD 36 EF 02   [19]  566 	ld	-17 (ix),#0x02
   47DB                     567 00148$:
                            568 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x + G_ENEMY_W +1), y) <=2 &&
   47DB DD 7E 04      [19]  569 	ld	a,4 (ix)
   47DE C6 05         [ 7]  570 	add	a, #0x05
   47E0 DD 77 FA      [19]  571 	ld	-6 (ix),a
   47E3 DD 66 05      [19]  572 	ld	h,5 (ix)
   47E6 DD 6E FA      [19]  573 	ld	l,-6 (ix)
   47E9 E5            [11]  574 	push	hl
   47EA DD 6E 0A      [19]  575 	ld	l,10 (ix)
   47ED DD 66 0B      [19]  576 	ld	h,11 (ix)
   47F0 E5            [11]  577 	push	hl
   47F1 CD C4 4A      [17]  578 	call	_getTilePtr
   47F4 F1            [10]  579 	pop	af
   47F5 F1            [10]  580 	pop	af
   47F6 4E            [ 7]  581 	ld	c,(hl)
   47F7 3E 02         [ 7]  582 	ld	a,#0x02
   47F9 91            [ 4]  583 	sub	a, c
   47FA DA FE 48      [10]  584 	jp	C,00167$
                            585 ;src/pathfinding.c:111: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
   47FD DD 66 F8      [19]  586 	ld	h,-8 (ix)
   4800 DD 6E FA      [19]  587 	ld	l,-6 (ix)
   4803 E5            [11]  588 	push	hl
   4804 DD 6E 0A      [19]  589 	ld	l,10 (ix)
   4807 DD 66 0B      [19]  590 	ld	h,11 (ix)
   480A E5            [11]  591 	push	hl
   480B CD C4 4A      [17]  592 	call	_getTilePtr
   480E F1            [10]  593 	pop	af
   480F F1            [10]  594 	pop	af
   4810 4E            [ 7]  595 	ld	c,(hl)
   4811 3E 02         [ 7]  596 	ld	a,#0x02
   4813 91            [ 4]  597 	sub	a, c
   4814 DA FE 48      [10]  598 	jp	C,00167$
                            599 ;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4817 DD 66 FD      [19]  600 	ld	h,-3 (ix)
   481A DD 6E FA      [19]  601 	ld	l,-6 (ix)
   481D E5            [11]  602 	push	hl
   481E DD 6E 0A      [19]  603 	ld	l,10 (ix)
   4821 DD 66 0B      [19]  604 	ld	h,11 (ix)
   4824 E5            [11]  605 	push	hl
   4825 CD C4 4A      [17]  606 	call	_getTilePtr
   4828 F1            [10]  607 	pop	af
   4829 F1            [10]  608 	pop	af
   482A 4E            [ 7]  609 	ld	c,(hl)
   482B 3E 02         [ 7]  610 	ld	a,#0x02
   482D 91            [ 4]  611 	sub	a, c
   482E DA FE 48      [10]  612 	jp	C,00167$
                            613 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   4831 DD 7E F2      [19]  614 	ld	a,-14 (ix)
   4834 C6 01         [ 7]  615 	add	a, #0x01
   4836 DD 77 F8      [19]  616 	ld	-8 (ix),a
   4839 DD 7E F3      [19]  617 	ld	a,-13 (ix)
   483C CE 00         [ 7]  618 	adc	a, #0x00
   483E DD 77 F9      [19]  619 	ld	-7 (ix),a
   4841 DD 7E F4      [19]  620 	ld	a,-12 (ix)
   4844 DD 96 F8      [19]  621 	sub	a, -8 (ix)
   4847 DD 77 F8      [19]  622 	ld	-8 (ix),a
   484A DD 7E F5      [19]  623 	ld	a,-11 (ix)
   484D DD 9E F9      [19]  624 	sbc	a, -7 (ix)
   4850 DD 77 F9      [19]  625 	ld	-7 (ix),a
   4853 DD 6E F8      [19]  626 	ld	l,-8 (ix)
   4856 DD 66 F9      [19]  627 	ld	h,-7 (ix)
   4859 E5            [11]  628 	push	hl
   485A CD 08 4B      [17]  629 	call	_abs
   485D F1            [10]  630 	pop	af
   485E DD 74 F9      [19]  631 	ld	-7 (ix),h
   4861 DD 75 F8      [19]  632 	ld	-8 (ix),l
   4864 DD 6E F6      [19]  633 	ld	l,-10 (ix)
   4867 DD 66 F7      [19]  634 	ld	h,-9 (ix)
   486A E5            [11]  635 	push	hl
   486B CD 08 4B      [17]  636 	call	_abs
   486E F1            [10]  637 	pop	af
   486F DD 74 FE      [19]  638 	ld	-2 (ix),h
   4872 DD 75 FD      [19]  639 	ld	-3 (ix),l
   4875 DD 7E F8      [19]  640 	ld	a,-8 (ix)
   4878 DD 86 FD      [19]  641 	add	a, -3 (ix)
   487B DD 77 F8      [19]  642 	ld	-8 (ix),a
   487E DD 7E F9      [19]  643 	ld	a,-7 (ix)
   4881 DD 8E FE      [19]  644 	adc	a, -2 (ix)
   4884 DD 77 F9      [19]  645 	ld	-7 (ix),a
   4887 DD 7E F8      [19]  646 	ld	a,-8 (ix)
   488A DD 86 E5      [19]  647 	add	a, -27 (ix)
   488D DD 77 ED      [19]  648 	ld	-19 (ix),a
   4890 DD 7E F9      [19]  649 	ld	a,-7 (ix)
   4893 DD 8E E6      [19]  650 	adc	a, -26 (ix)
   4896 DD 77 EE      [19]  651 	ld	-18 (ix),a
                            652 ;src/pathfinding.c:114: if(resultado == 0){
   4899 DD 7E EF      [19]  653 	ld	a,-17 (ix)
   489C B7            [ 4]  654 	or	a, a
   489D 20 1A         [12]  655 	jr	NZ,00164$
                            656 ;src/pathfinding.c:115: if(dist1 >= dist4)
   489F DD 7E E7      [19]  657 	ld	a,-25 (ix)
   48A2 DD 96 ED      [19]  658 	sub	a, -19 (ix)
   48A5 DD 7E E8      [19]  659 	ld	a,-24 (ix)
   48A8 DD 9E EE      [19]  660 	sbc	a, -18 (ix)
   48AB E2 B0 48      [10]  661 	jp	PO, 00309$
   48AE EE 80         [ 7]  662 	xor	a, #0x80
   48B0                     663 00309$:
   48B0 FA FE 48      [10]  664 	jp	M,00167$
                            665 ;src/pathfinding.c:116: resultado = 3;
   48B3 DD 36 EF 03   [19]  666 	ld	-17 (ix),#0x03
   48B7 18 45         [12]  667 	jr	00167$
   48B9                     668 00164$:
                            669 ;src/pathfinding.c:117: }else if(resultado == 1){
   48B9 DD 7E EF      [19]  670 	ld	a,-17 (ix)
   48BC 3D            [ 4]  671 	dec	a
   48BD 20 1A         [12]  672 	jr	NZ,00161$
                            673 ;src/pathfinding.c:118: if(dist2 >= dist4)
   48BF DD 7E E9      [19]  674 	ld	a,-23 (ix)
   48C2 DD 96 ED      [19]  675 	sub	a, -19 (ix)
   48C5 DD 7E EA      [19]  676 	ld	a,-22 (ix)
   48C8 DD 9E EE      [19]  677 	sbc	a, -18 (ix)
   48CB E2 D0 48      [10]  678 	jp	PO, 00312$
   48CE EE 80         [ 7]  679 	xor	a, #0x80
   48D0                     680 00312$:
   48D0 FA FE 48      [10]  681 	jp	M,00167$
                            682 ;src/pathfinding.c:119: resultado = 3;
   48D3 DD 36 EF 03   [19]  683 	ld	-17 (ix),#0x03
   48D7 18 25         [12]  684 	jr	00167$
   48D9                     685 00161$:
                            686 ;src/pathfinding.c:120: }else if (resultado == 2){
   48D9 DD 7E EF      [19]  687 	ld	a,-17 (ix)
   48DC D6 02         [ 7]  688 	sub	a, #0x02
   48DE 20 1A         [12]  689 	jr	NZ,00158$
                            690 ;src/pathfinding.c:121: if(dist3 >= dist4)
   48E0 DD 7E EB      [19]  691 	ld	a,-21 (ix)
   48E3 DD 96 ED      [19]  692 	sub	a, -19 (ix)
   48E6 DD 7E EC      [19]  693 	ld	a,-20 (ix)
   48E9 DD 9E EE      [19]  694 	sbc	a, -18 (ix)
   48EC E2 F1 48      [10]  695 	jp	PO, 00315$
   48EF EE 80         [ 7]  696 	xor	a, #0x80
   48F1                     697 00315$:
   48F1 FA FE 48      [10]  698 	jp	M,00167$
                            699 ;src/pathfinding.c:122: resultado = 3;
   48F4 DD 36 EF 03   [19]  700 	ld	-17 (ix),#0x03
   48F8 18 04         [12]  701 	jr	00167$
   48FA                     702 00158$:
                            703 ;src/pathfinding.c:124: resultado = 3;
   48FA DD 36 EF 03   [19]  704 	ld	-17 (ix),#0x03
   48FE                     705 00167$:
                            706 ;src/pathfinding.c:128: return resultado;
   48FE DD 6E EF      [19]  707 	ld	l,-17 (ix)
   4901 DD F9         [10]  708 	ld	sp, ix
   4903 DD E1         [14]  709 	pop	ix
   4905 C9            [10]  710 	ret
                            711 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                            712 ;	---------------------------------
                            713 ; Function pathFinding
                            714 ; ---------------------------------
   4906                     715 _pathFinding::
   4906 DD E5         [15]  716 	push	ix
   4908 DD 21 00 00   [14]  717 	ld	ix,#0
   490C DD 39         [15]  718 	add	ix,sp
   490E 21 F8 FF      [10]  719 	ld	hl,#-8
   4911 39            [11]  720 	add	hl,sp
   4912 F9            [ 6]  721 	ld	sp,hl
                            722 ;src/pathfinding.c:149: u8 problem = 0;
   4913 DD 36 FB 00   [19]  723 	ld	-5 (ix),#0x00
                            724 ;src/pathfinding.c:151: x = s_x;
   4917 DD 7E 04      [19]  725 	ld	a,4 (ix)
   491A DD 77 F9      [19]  726 	ld	-7 (ix),a
                            727 ;src/pathfinding.c:153: y = s_y;
   491D DD 7E 05      [19]  728 	ld	a,5 (ix)
   4920 DD 77 F8      [19]  729 	ld	-8 (ix),a
                            730 ;src/pathfinding.c:155: k = 0;
   4923 DD 36 FF 00   [19]  731 	ld	-1 (ix),#0x00
                            732 ;src/pathfinding.c:156: aux = 1;
   4927 DD 36 FC 01   [19]  733 	ld	-4 (ix),#0x01
                            734 ;src/pathfinding.c:160: enemy->longitud_camino = 0;
   492B DD 7E 08      [19]  735 	ld	a,8 (ix)
   492E DD 77 FD      [19]  736 	ld	-3 (ix),a
   4931 DD 7E 09      [19]  737 	ld	a,9 (ix)
   4934 DD 77 FE      [19]  738 	ld	-2 (ix),a
   4937 DD 7E FD      [19]  739 	ld	a,-3 (ix)
   493A C6 44         [ 7]  740 	add	a, #0x44
   493C 5F            [ 4]  741 	ld	e,a
   493D DD 7E FE      [19]  742 	ld	a,-2 (ix)
   4940 CE 01         [ 7]  743 	adc	a, #0x01
   4942 57            [ 4]  744 	ld	d,a
   4943 AF            [ 4]  745 	xor	a, a
   4944 12            [ 7]  746 	ld	(de),a
                            747 ;src/pathfinding.c:161: sol_tam = 1;
   4945 21 2F 65      [10]  748 	ld	hl,#_sol_tam + 0
   4948 36 01         [10]  749 	ld	(hl), #0x01
                            750 ;src/pathfinding.c:163: inserted = anyadirALista(x, y);
   494A D5            [11]  751 	push	de
   494B DD 66 F8      [19]  752 	ld	h,-8 (ix)
   494E DD 6E F9      [19]  753 	ld	l,-7 (ix)
   4951 E5            [11]  754 	push	hl
   4952 CD EF 43      [17]  755 	call	_anyadirALista
   4955 F1            [10]  756 	pop	af
   4956 D1            [10]  757 	pop	de
   4957 DD 75 FA      [19]  758 	ld	-6 (ix),l
                            759 ;src/pathfinding.c:167: while (aux){
   495A                     760 00116$:
   495A DD 7E FC      [19]  761 	ld	a,-4 (ix)
   495D B7            [ 4]  762 	or	a, a
   495E CA 87 4A      [10]  763 	jp	Z,00118$
                            764 ;src/pathfinding.c:168: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   4961 DD 7E 06      [19]  765 	ld	a,6 (ix)
   4964 DD 96 F9      [19]  766 	sub	a, -7 (ix)
   4967 20 08         [12]  767 	jr	NZ,00114$
   4969 DD 7E 07      [19]  768 	ld	a,7 (ix)
   496C DD 96 F8      [19]  769 	sub	a, -8 (ix)
   496F 28 0C         [12]  770 	jr	Z,00110$
   4971                     771 00114$:
   4971 3A 2F 65      [13]  772 	ld	a,(#_sol_tam + 0)
   4974 B7            [ 4]  773 	or	a, a
   4975 28 06         [12]  774 	jr	Z,00110$
   4977 DD 7E FA      [19]  775 	ld	a,-6 (ix)
   497A B7            [ 4]  776 	or	a, a
   497B 20 16         [12]  777 	jr	NZ,00111$
   497D                     778 00110$:
                            779 ;src/pathfinding.c:170: if(inserted == 0 || sol_tam == 0){
   497D DD 7E FA      [19]  780 	ld	a,-6 (ix)
   4980 B7            [ 4]  781 	or	a, a
   4981 28 06         [12]  782 	jr	Z,00101$
   4983 3A 2F 65      [13]  783 	ld	a,(#_sol_tam + 0)
   4986 B7            [ 4]  784 	or	a, a
   4987 20 04         [12]  785 	jr	NZ,00102$
   4989                     786 00101$:
                            787 ;src/pathfinding.c:171: problem = 1;
   4989 DD 36 FB 01   [19]  788 	ld	-5 (ix),#0x01
   498D                     789 00102$:
                            790 ;src/pathfinding.c:174: aux = 0;
   498D DD 36 FC 00   [19]  791 	ld	-4 (ix),#0x00
   4991 18 C7         [12]  792 	jr	00116$
   4993                     793 00111$:
                            794 ;src/pathfinding.c:176: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   4993 D5            [11]  795 	push	de
   4994 DD 6E 0A      [19]  796 	ld	l,10 (ix)
   4997 DD 66 0B      [19]  797 	ld	h,11 (ix)
   499A E5            [11]  798 	push	hl
   499B DD 66 07      [19]  799 	ld	h,7 (ix)
   499E DD 6E 06      [19]  800 	ld	l,6 (ix)
   49A1 E5            [11]  801 	push	hl
   49A2 DD 66 05      [19]  802 	ld	h,5 (ix)
   49A5 DD 6E 04      [19]  803 	ld	l,4 (ix)
   49A8 E5            [11]  804 	push	hl
   49A9 DD 66 F8      [19]  805 	ld	h,-8 (ix)
   49AC DD 6E F9      [19]  806 	ld	l,-7 (ix)
   49AF E5            [11]  807 	push	hl
   49B0 CD 3D 44      [17]  808 	call	_adjacentTiles
   49B3 F1            [10]  809 	pop	af
   49B4 F1            [10]  810 	pop	af
   49B5 F1            [10]  811 	pop	af
   49B6 F1            [10]  812 	pop	af
   49B7 45            [ 4]  813 	ld	b,l
   49B8 D1            [10]  814 	pop	de
                            815 ;src/pathfinding.c:178: switch(movimiento){
   49B9 3E 04         [ 7]  816 	ld	a,#0x04
   49BB 90            [ 4]  817 	sub	a, b
   49BC 38 9C         [12]  818 	jr	C,00116$
                            819 ;src/pathfinding.c:182: k = k+2;
   49BE DD 4E FF      [19]  820 	ld	c,-1 (ix)
   49C1 0C            [ 4]  821 	inc	c
   49C2 0C            [ 4]  822 	inc	c
                            823 ;src/pathfinding.c:178: switch(movimiento){
   49C3 D5            [11]  824 	push	de
   49C4 58            [ 4]  825 	ld	e,b
   49C5 16 00         [ 7]  826 	ld	d,#0x00
   49C7 21 CF 49      [10]  827 	ld	hl,#00169$
   49CA 19            [11]  828 	add	hl,de
   49CB 19            [11]  829 	add	hl,de
   49CC 19            [11]  830 	add	hl,de
   49CD D1            [10]  831 	pop	de
   49CE E9            [ 4]  832 	jp	(hl)
   49CF                     833 00169$:
   49CF C3 DE 49      [10]  834 	jp	00104$
   49D2 C3 FE 49      [10]  835 	jp	00105$
   49D5 C3 1E 4A      [10]  836 	jp	00106$
   49D8 C3 3D 4A      [10]  837 	jp	00107$
   49DB C3 5C 4A      [10]  838 	jp	00108$
                            839 ;src/pathfinding.c:179: case 0:
   49DE                     840 00104$:
                            841 ;src/pathfinding.c:180: inserted = anyadirALista(x, y-2);
   49DE DD 46 F8      [19]  842 	ld	b,-8 (ix)
   49E1 05            [ 4]  843 	dec	b
   49E2 05            [ 4]  844 	dec	b
   49E3 C5            [11]  845 	push	bc
   49E4 D5            [11]  846 	push	de
   49E5 C5            [11]  847 	push	bc
   49E6 33            [ 6]  848 	inc	sp
   49E7 DD 7E F9      [19]  849 	ld	a,-7 (ix)
   49EA F5            [11]  850 	push	af
   49EB 33            [ 6]  851 	inc	sp
   49EC CD EF 43      [17]  852 	call	_anyadirALista
   49EF F1            [10]  853 	pop	af
   49F0 D1            [10]  854 	pop	de
   49F1 C1            [10]  855 	pop	bc
   49F2 DD 75 FA      [19]  856 	ld	-6 (ix),l
                            857 ;src/pathfinding.c:181: y = y-2;
   49F5 DD 70 F8      [19]  858 	ld	-8 (ix),b
                            859 ;src/pathfinding.c:182: k = k+2;
   49F8 DD 71 FF      [19]  860 	ld	-1 (ix),c
                            861 ;src/pathfinding.c:183: break;
   49FB C3 5A 49      [10]  862 	jp	00116$
                            863 ;src/pathfinding.c:184: case 1:
   49FE                     864 00105$:
                            865 ;src/pathfinding.c:187: inserted = anyadirALista(x, y+2);
   49FE DD 46 F8      [19]  866 	ld	b,-8 (ix)
   4A01 04            [ 4]  867 	inc	b
   4A02 04            [ 4]  868 	inc	b
   4A03 C5            [11]  869 	push	bc
   4A04 D5            [11]  870 	push	de
   4A05 C5            [11]  871 	push	bc
   4A06 33            [ 6]  872 	inc	sp
   4A07 DD 7E F9      [19]  873 	ld	a,-7 (ix)
   4A0A F5            [11]  874 	push	af
   4A0B 33            [ 6]  875 	inc	sp
   4A0C CD EF 43      [17]  876 	call	_anyadirALista
   4A0F F1            [10]  877 	pop	af
   4A10 D1            [10]  878 	pop	de
   4A11 C1            [10]  879 	pop	bc
   4A12 DD 75 FA      [19]  880 	ld	-6 (ix),l
                            881 ;src/pathfinding.c:188: y = y+2;
   4A15 DD 70 F8      [19]  882 	ld	-8 (ix),b
                            883 ;src/pathfinding.c:189: k = k+2;
   4A18 DD 71 FF      [19]  884 	ld	-1 (ix),c
                            885 ;src/pathfinding.c:190: break;
   4A1B C3 5A 49      [10]  886 	jp	00116$
                            887 ;src/pathfinding.c:191: case 2:
   4A1E                     888 00106$:
                            889 ;src/pathfinding.c:194: inserted = anyadirALista(x-1, y);
   4A1E DD 46 F9      [19]  890 	ld	b,-7 (ix)
   4A21 05            [ 4]  891 	dec	b
   4A22 C5            [11]  892 	push	bc
   4A23 D5            [11]  893 	push	de
   4A24 DD 7E F8      [19]  894 	ld	a,-8 (ix)
   4A27 F5            [11]  895 	push	af
   4A28 33            [ 6]  896 	inc	sp
   4A29 C5            [11]  897 	push	bc
   4A2A 33            [ 6]  898 	inc	sp
   4A2B CD EF 43      [17]  899 	call	_anyadirALista
   4A2E F1            [10]  900 	pop	af
   4A2F D1            [10]  901 	pop	de
   4A30 C1            [10]  902 	pop	bc
   4A31 DD 75 FA      [19]  903 	ld	-6 (ix),l
                            904 ;src/pathfinding.c:195: x = x-1;
   4A34 DD 70 F9      [19]  905 	ld	-7 (ix),b
                            906 ;src/pathfinding.c:196: k = k+2;
   4A37 DD 71 FF      [19]  907 	ld	-1 (ix),c
                            908 ;src/pathfinding.c:197: break;
   4A3A C3 5A 49      [10]  909 	jp	00116$
                            910 ;src/pathfinding.c:198: case 3:
   4A3D                     911 00107$:
                            912 ;src/pathfinding.c:201: inserted = anyadirALista(x+1, y);
   4A3D DD 46 F9      [19]  913 	ld	b,-7 (ix)
   4A40 04            [ 4]  914 	inc	b
   4A41 C5            [11]  915 	push	bc
   4A42 D5            [11]  916 	push	de
   4A43 DD 7E F8      [19]  917 	ld	a,-8 (ix)
   4A46 F5            [11]  918 	push	af
   4A47 33            [ 6]  919 	inc	sp
   4A48 C5            [11]  920 	push	bc
   4A49 33            [ 6]  921 	inc	sp
   4A4A CD EF 43      [17]  922 	call	_anyadirALista
   4A4D F1            [10]  923 	pop	af
   4A4E D1            [10]  924 	pop	de
   4A4F C1            [10]  925 	pop	bc
   4A50 DD 75 FA      [19]  926 	ld	-6 (ix),l
                            927 ;src/pathfinding.c:202: x = x+1;
   4A53 DD 70 F9      [19]  928 	ld	-7 (ix),b
                            929 ;src/pathfinding.c:203: k = k+2;
   4A56 DD 71 FF      [19]  930 	ld	-1 (ix),c
                            931 ;src/pathfinding.c:204: break;
   4A59 C3 5A 49      [10]  932 	jp	00116$
                            933 ;src/pathfinding.c:206: case 4:
   4A5C                     934 00108$:
                            935 ;src/pathfinding.c:207: sol_tam = sol_tam - 2;
   4A5C 21 2F 65      [10]  936 	ld	hl, #_sol_tam+0
   4A5F 35            [11]  937 	dec	(hl)
   4A60 21 2F 65      [10]  938 	ld	hl, #_sol_tam+0
   4A63 35            [11]  939 	dec	(hl)
                            940 ;src/pathfinding.c:208: k--;
   4A64 DD 4E FF      [19]  941 	ld	c,-1 (ix)
   4A67 0D            [ 4]  942 	dec	c
                            943 ;src/pathfinding.c:209: y = camino[k];
   4A68 21 30 65      [10]  944 	ld	hl,#_camino
   4A6B 06 00         [ 7]  945 	ld	b,#0x00
   4A6D 09            [11]  946 	add	hl, bc
   4A6E 7E            [ 7]  947 	ld	a,(hl)
   4A6F DD 77 F8      [19]  948 	ld	-8 (ix),a
                            949 ;src/pathfinding.c:210: k--;
   4A72 79            [ 4]  950 	ld	a,c
   4A73 C6 FF         [ 7]  951 	add	a,#0xFF
                            952 ;src/pathfinding.c:211: x = camino[k];
   4A75 DD 77 FF      [19]  953 	ld	-1 (ix),a
   4A78 C6 30         [ 7]  954 	add	a,#<(_camino)
   4A7A 6F            [ 4]  955 	ld	l,a
   4A7B 3E 65         [ 7]  956 	ld	a,#>(_camino)
   4A7D CE 00         [ 7]  957 	adc	a, #0x00
   4A7F 67            [ 4]  958 	ld	h,a
   4A80 7E            [ 7]  959 	ld	a,(hl)
   4A81 DD 77 F9      [19]  960 	ld	-7 (ix),a
                            961 ;src/pathfinding.c:213: }
   4A84 C3 5A 49      [10]  962 	jp	00116$
   4A87                     963 00118$:
                            964 ;src/pathfinding.c:218: if(problem == 0){
   4A87 DD 7E FB      [19]  965 	ld	a,-5 (ix)
   4A8A B7            [ 4]  966 	or	a, a
   4A8B 20 32         [12]  967 	jr	NZ,00127$
                            968 ;src/pathfinding.c:219: if(sol_tam < CAMINO_TAM){
                            969 ;src/pathfinding.c:220: enemy->longitud_camino = sol_tam;
   4A8D 3A 2F 65      [13]  970 	ld	a,(#_sol_tam + 0)
   4A90 FE C8         [ 7]  971 	cp	a,#0xC8
   4A92 30 03         [12]  972 	jr	NC,00120$
   4A94 12            [ 7]  973 	ld	(de),a
   4A95 18 03         [12]  974 	jr	00137$
   4A97                     975 00120$:
                            976 ;src/pathfinding.c:222: enemy->longitud_camino = CAMINO_TAM;
   4A97 3E C8         [ 7]  977 	ld	a,#0xC8
   4A99 12            [ 7]  978 	ld	(de),a
                            979 ;src/pathfinding.c:225: for(j = 0; j<CAMINO_TAM; j++){
   4A9A                     980 00137$:
   4A9A DD 7E FD      [19]  981 	ld	a,-3 (ix)
   4A9D C6 18         [ 7]  982 	add	a, #0x18
   4A9F 4F            [ 4]  983 	ld	c,a
   4AA0 DD 7E FE      [19]  984 	ld	a,-2 (ix)
   4AA3 CE 00         [ 7]  985 	adc	a, #0x00
   4AA5 47            [ 4]  986 	ld	b,a
   4AA6 1E 00         [ 7]  987 	ld	e,#0x00
   4AA8                     988 00125$:
                            989 ;src/pathfinding.c:226: enemy->camino[j] = camino[j];
   4AA8 6B            [ 4]  990 	ld	l,e
   4AA9 26 00         [ 7]  991 	ld	h,#0x00
   4AAB 09            [11]  992 	add	hl, bc
   4AAC E5            [11]  993 	push	hl
   4AAD FD E1         [14]  994 	pop	iy
   4AAF 21 30 65      [10]  995 	ld	hl,#_camino
   4AB2 16 00         [ 7]  996 	ld	d,#0x00
   4AB4 19            [11]  997 	add	hl, de
   4AB5 56            [ 7]  998 	ld	d,(hl)
   4AB6 FD 72 00      [19]  999 	ld	0 (iy), d
                           1000 ;src/pathfinding.c:225: for(j = 0; j<CAMINO_TAM; j++){
   4AB9 1C            [ 4] 1001 	inc	e
   4ABA 7B            [ 4] 1002 	ld	a,e
   4ABB D6 C8         [ 7] 1003 	sub	a, #0xC8
   4ABD 38 E9         [12] 1004 	jr	C,00125$
   4ABF                    1005 00127$:
   4ABF DD F9         [10] 1006 	ld	sp, ix
   4AC1 DD E1         [14] 1007 	pop	ix
   4AC3 C9            [10] 1008 	ret
                           1009 	.area _CODE
                           1010 	.area _INITIALIZER
                           1011 	.area _CABS (ABS)
