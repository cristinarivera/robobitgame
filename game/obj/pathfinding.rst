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
   64A7                      26 _sol_tam::
   64A7                      27 	.ds 1
   64A8                      28 _camino::
   64A8                      29 	.ds 200
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
   444C                      58 _anyadirALista::
                             59 ;src/pathfinding.c:11: u8 anyadido = 0;
   444C 0E 00         [ 7]   60 	ld	c,#0x00
                             61 ;src/pathfinding.c:13: if(sol_tam < CAMINO_TAM){
   444E 3A A7 64      [13]   62 	ld	a,(#_sol_tam + 0)
   4451 D6 C8         [ 7]   63 	sub	a, #0xC8
   4453 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   4455 01 A8 64      [10]   66 	ld	bc,#_camino+0
   4458 2A A7 64      [16]   67 	ld	hl,(_sol_tam)
   445B 26 00         [ 7]   68 	ld	h,#0x00
   445D 09            [11]   69 	add	hl,bc
   445E FD 21 02 00   [14]   70 	ld	iy,#2
   4462 FD 39         [15]   71 	add	iy,sp
   4464 FD 7E 00      [19]   72 	ld	a,0 (iy)
   4467 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   4468 21 A7 64      [10]   75 	ld	hl, #_sol_tam+0
   446B 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   446C 2A A7 64      [16]   78 	ld	hl,(_sol_tam)
   446F 26 00         [ 7]   79 	ld	h,#0x00
   4471 09            [11]   80 	add	hl,bc
   4472 FD 21 03 00   [14]   81 	ld	iy,#3
   4476 FD 39         [15]   82 	add	iy,sp
   4478 FD 7E 00      [19]   83 	ld	a,0 (iy)
   447B 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   447C 21 A7 64      [10]   86 	ld	hl, #_sol_tam+0
   447F 34            [11]   87 	inc	(hl)
                             88 ;src/pathfinding.c:18: anyadido = 1;
   4480 0E 01         [ 7]   89 	ld	c,#0x01
   4482                      90 00102$:
                             91 ;src/pathfinding.c:21: return anyadido;
   4482 69            [ 4]   92 	ld	l,c
   4483 C9            [10]   93 	ret
   4484                      94 _bitWeights:
   4484 01 00                95 	.dw #0x0001
   4486 02 00                96 	.dw #0x0002
   4488 04 00                97 	.dw #0x0004
   448A 08 00                98 	.dw #0x0008
   448C 10 00                99 	.dw #0x0010
   448E 20 00               100 	.dw #0x0020
   4490 40 00               101 	.dw #0x0040
   4492 80 00               102 	.dw #0x0080
                            103 ;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
                            104 ;	---------------------------------
                            105 ; Function adjacentTiles
                            106 ; ---------------------------------
   4494                     107 _adjacentTiles::
   4494 DD E5         [15]  108 	push	ix
   4496 DD 21 00 00   [14]  109 	ld	ix,#0
   449A DD 39         [15]  110 	add	ix,sp
   449C 21 DF FF      [10]  111 	ld	hl,#-33
   449F 39            [11]  112 	add	hl,sp
   44A0 F9            [ 6]  113 	ld	sp,hl
                            114 ;src/pathfinding.c:26: u8 resultado = 4;
   44A1 DD 36 EF 04   [19]  115 	ld	-17 (ix),#0x04
                            116 ;src/pathfinding.c:28: i16 dist1 = 0;
   44A5 DD 36 ED 00   [19]  117 	ld	-19 (ix),#0x00
   44A9 DD 36 EE 00   [19]  118 	ld	-18 (ix),#0x00
                            119 ;src/pathfinding.c:29: i16 dist2 = 0;
   44AD DD 36 EB 00   [19]  120 	ld	-21 (ix),#0x00
   44B1 DD 36 EC 00   [19]  121 	ld	-20 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   44B5 DD 36 E9 00   [19]  123 	ld	-23 (ix),#0x00
   44B9 DD 36 EA 00   [19]  124 	ld	-22 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   44BD DD 36 E3 00   [19]  126 	ld	-29 (ix),#0x00
   44C1 DD 36 E4 00   [19]  127 	ld	-28 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   44C5 DD 36 E5 00   [19]  129 	ld	-27 (ix),#0x00
   44C9 DD 36 E6 00   [19]  130 	ld	-26 (ix),#0x00
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   44CD DD 36 E7 00   [19]  132 	ld	-25 (ix),#0x00
   44D1 DD 36 E8 00   [19]  133 	ld	-24 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   44D5 21 00 00      [10]  135 	ld	hl,#0x0000
   44D8 E3            [19]  136 	ex	(sp), hl
                            137 ;src/pathfinding.c:43: if(y < f_y)
   44D9 DD 7E 05      [19]  138 	ld	a,5 (ix)
   44DC DD 96 07      [19]  139 	sub	a, 7 (ix)
   44DF 3E 00         [ 7]  140 	ld	a,#0x00
   44E1 17            [ 4]  141 	rla
   44E2 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   44E3 DD 7E 04      [19]  144 	ld	a,4 (ix)
   44E6 DD 96 06      [19]  145 	sub	a, 6 (ix)
   44E9 20 1C         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   44EB 79            [ 4]  148 	ld	a,c
   44EC B7            [ 4]  149 	or	a, a
   44ED 28 04         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   44EF 21 FF FF      [10]  152 	ld	hl,#0xFFFF
   44F2 E3            [19]  153 	ex	(sp), hl
   44F3                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   44F3 DD 7E 07      [19]  156 	ld	a,7 (ix)
   44F6 DD 96 05      [19]  157 	sub	a, 5 (ix)
   44F9 D2 7B 45      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   44FC DD 36 E7 FF   [19]  160 	ld	-25 (ix),#0xFF
   4500 DD 36 E8 FF   [19]  161 	ld	-24 (ix),#0xFF
   4504 C3 7B 45      [10]  162 	jp	00125$
   4507                     163 00124$:
                            164 ;src/pathfinding.c:51: if(x < f_x)
   4507 DD 7E 04      [19]  165 	ld	a,4 (ix)
   450A DD 96 06      [19]  166 	sub	a, 6 (ix)
   450D 3E 00         [ 7]  167 	ld	a,#0x00
   450F 17            [ 4]  168 	rla
   4510 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   4511 DD 7E 06      [19]  171 	ld	a,6 (ix)
   4514 DD 96 04      [19]  172 	sub	a, 4 (ix)
   4517 3E 00         [ 7]  173 	ld	a,#0x00
   4519 17            [ 4]  174 	rla
   451A 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   451B DD 7E 05      [19]  177 	ld	a,5 (ix)
   451E DD 96 07      [19]  178 	sub	a, 7 (ix)
   4521 20 1A         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   4523 78            [ 4]  181 	ld	a,b
   4524 B7            [ 4]  182 	or	a, a
   4525 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
   4527 DD 36 E3 FF   [19]  185 	ld	-29 (ix),#0xFF
   452B DD 36 E4 FF   [19]  186 	ld	-28 (ix),#0xFF
   452F                     187 00106$:
                            188 ;src/pathfinding.c:53: if(x > f_x)
   452F 7B            [ 4]  189 	ld	a,e
   4530 B7            [ 4]  190 	or	a, a
   4531 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   4533 DD 36 E5 FF   [19]  193 	ld	-27 (ix),#0xFF
   4537 DD 36 E6 FF   [19]  194 	ld	-26 (ix),#0xFF
   453B 18 3E         [12]  195 	jr	00125$
   453D                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   453D 78            [ 4]  198 	ld	a,b
   453E B7            [ 4]  199 	or	a, a
   453F 28 1C         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   4541 79            [ 4]  202 	ld	a,c
   4542 B7            [ 4]  203 	or	a, a
   4543 28 06         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
   4545 21 FF FF      [10]  206 	ld	hl,#0xFFFF
   4548 E3            [19]  207 	ex	(sp), hl
   4549 18 08         [12]  208 	jr	00111$
   454B                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   454B DD 36 E7 FF   [19]  211 	ld	-25 (ix),#0xFF
   454F DD 36 E8 FF   [19]  212 	ld	-24 (ix),#0xFF
   4553                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4553 DD 36 E3 FF   [19]  215 	ld	-29 (ix),#0xFF
   4557 DD 36 E4 FF   [19]  216 	ld	-28 (ix),#0xFF
   455B 18 1E         [12]  217 	jr	00125$
   455D                     218 00118$:
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   455D 7B            [ 4]  220 	ld	a,e
   455E B7            [ 4]  221 	or	a, a
   455F 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   4561 79            [ 4]  224 	ld	a,c
   4562 B7            [ 4]  225 	or	a, a
   4563 28 06         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
   4565 21 FF FF      [10]  228 	ld	hl,#0xFFFF
   4568 E3            [19]  229 	ex	(sp), hl
   4569 18 08         [12]  230 	jr	00114$
   456B                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   456B DD 36 E7 FF   [19]  233 	ld	-25 (ix),#0xFF
   456F DD 36 E8 FF   [19]  234 	ld	-24 (ix),#0xFF
   4573                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   4573 DD 36 E5 FF   [19]  237 	ld	-27 (ix),#0xFF
   4577 DD 36 E6 FF   [19]  238 	ld	-26 (ix),#0xFF
   457B                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   457B DD 7E 05      [19]  241 	ld	a,5 (ix)
   457E C6 FE         [ 7]  242 	add	a,#0xFE
   4580 DD 77 FA      [19]  243 	ld	-6 (ix), a
   4583 F5            [11]  244 	push	af
   4584 33            [ 6]  245 	inc	sp
   4585 DD 7E 04      [19]  246 	ld	a,4 (ix)
   4588 F5            [11]  247 	push	af
   4589 33            [ 6]  248 	inc	sp
   458A DD 6E 08      [19]  249 	ld	l,8 (ix)
   458D DD 66 09      [19]  250 	ld	h,9 (ix)
   4590 E5            [11]  251 	push	hl
   4591 CD 71 4B      [17]  252 	call	_getTilePtr
   4594 F1            [10]  253 	pop	af
   4595 F1            [10]  254 	pop	af
   4596 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   4597 DD 7E 04      [19]  257 	ld	a,4 (ix)
   459A C6 04         [ 7]  258 	add	a, #0x04
   459C DD 77 FD      [19]  259 	ld	-3 (ix),a
                            260 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   459F DD 7E 06      [19]  261 	ld	a,6 (ix)
   45A2 DD 77 FE      [19]  262 	ld	-2 (ix),a
   45A5 DD 36 FF 00   [19]  263 	ld	-1 (ix),#0x00
   45A9 DD 7E 04      [19]  264 	ld	a,4 (ix)
   45AC DD 77 FB      [19]  265 	ld	-5 (ix),a
   45AF DD 36 FC 00   [19]  266 	ld	-4 (ix),#0x00
   45B3 DD 7E 07      [19]  267 	ld	a,7 (ix)
   45B6 DD 77 F4      [19]  268 	ld	-12 (ix),a
   45B9 DD 36 F5 00   [19]  269 	ld	-11 (ix),#0x00
   45BD DD 7E 05      [19]  270 	ld	a,5 (ix)
   45C0 DD 77 F2      [19]  271 	ld	-14 (ix),a
   45C3 DD 36 F3 00   [19]  272 	ld	-13 (ix),#0x00
   45C7 DD 7E FE      [19]  273 	ld	a,-2 (ix)
   45CA DD 96 FB      [19]  274 	sub	a, -5 (ix)
   45CD DD 77 F0      [19]  275 	ld	-16 (ix),a
   45D0 DD 7E FF      [19]  276 	ld	a,-1 (ix)
   45D3 DD 9E FC      [19]  277 	sbc	a, -4 (ix)
   45D6 DD 77 F1      [19]  278 	ld	-15 (ix),a
                            279 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   45D9 3E 02         [ 7]  280 	ld	a,#0x02
   45DB 91            [ 4]  281 	sub	a, c
   45DC DA 70 46      [10]  282 	jp	C,00127$
                            283 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   45DF DD 66 FA      [19]  284 	ld	h,-6 (ix)
   45E2 DD 6E FD      [19]  285 	ld	l,-3 (ix)
   45E5 E5            [11]  286 	push	hl
   45E6 DD 6E 08      [19]  287 	ld	l,8 (ix)
   45E9 DD 66 09      [19]  288 	ld	h,9 (ix)
   45EC E5            [11]  289 	push	hl
   45ED CD 71 4B      [17]  290 	call	_getTilePtr
   45F0 F1            [10]  291 	pop	af
   45F1 F1            [10]  292 	pop	af
   45F2 4E            [ 7]  293 	ld	c,(hl)
   45F3 3E 02         [ 7]  294 	ld	a,#0x02
   45F5 91            [ 4]  295 	sub	a, c
   45F6 38 78         [12]  296 	jr	C,00127$
                            297 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45F8 DD 6E F0      [19]  298 	ld	l,-16 (ix)
   45FB DD 66 F1      [19]  299 	ld	h,-15 (ix)
   45FE E5            [11]  300 	push	hl
   45FF CD B5 4B      [17]  301 	call	_abs
   4602 F1            [10]  302 	pop	af
   4603 DD 74 F9      [19]  303 	ld	-7 (ix),h
   4606 DD 75 F8      [19]  304 	ld	-8 (ix),l
   4609 DD 7E F2      [19]  305 	ld	a,-14 (ix)
   460C C6 FE         [ 7]  306 	add	a,#0xFE
   460E DD 77 F6      [19]  307 	ld	-10 (ix),a
   4611 DD 7E F3      [19]  308 	ld	a,-13 (ix)
   4614 CE FF         [ 7]  309 	adc	a,#0xFF
   4616 DD 77 F7      [19]  310 	ld	-9 (ix),a
   4619 DD 7E F4      [19]  311 	ld	a,-12 (ix)
   461C DD 96 F6      [19]  312 	sub	a, -10 (ix)
   461F DD 77 F6      [19]  313 	ld	-10 (ix),a
   4622 DD 7E F5      [19]  314 	ld	a,-11 (ix)
   4625 DD 9E F7      [19]  315 	sbc	a, -9 (ix)
   4628 DD 77 F7      [19]  316 	ld	-9 (ix),a
   462B DD 6E F6      [19]  317 	ld	l,-10 (ix)
   462E DD 66 F7      [19]  318 	ld	h,-9 (ix)
   4631 E5            [11]  319 	push	hl
   4632 CD B5 4B      [17]  320 	call	_abs
   4635 F1            [10]  321 	pop	af
   4636 DD 74 F7      [19]  322 	ld	-9 (ix),h
   4639 DD 75 F6      [19]  323 	ld	-10 (ix),l
   463C DD 7E F8      [19]  324 	ld	a,-8 (ix)
   463F DD 86 F6      [19]  325 	add	a, -10 (ix)
   4642 DD 77 F6      [19]  326 	ld	-10 (ix),a
   4645 DD 7E F9      [19]  327 	ld	a,-7 (ix)
   4648 DD 8E F7      [19]  328 	adc	a, -9 (ix)
   464B DD 77 F7      [19]  329 	ld	-9 (ix),a
   464E DD 7E F6      [19]  330 	ld	a,-10 (ix)
   4651 DD 86 E7      [19]  331 	add	a, -25 (ix)
   4654 DD 77 F6      [19]  332 	ld	-10 (ix),a
   4657 DD 7E F7      [19]  333 	ld	a,-9 (ix)
   465A DD 8E E8      [19]  334 	adc	a, -24 (ix)
   465D DD 77 F7      [19]  335 	ld	-9 (ix),a
   4660 DD 7E F6      [19]  336 	ld	a,-10 (ix)
   4663 DD 77 ED      [19]  337 	ld	-19 (ix),a
   4666 DD 7E F7      [19]  338 	ld	a,-9 (ix)
   4669 DD 77 EE      [19]  339 	ld	-18 (ix),a
                            340 ;src/pathfinding.c:81: resultado = 0;
   466C DD 36 EF 00   [19]  341 	ld	-17 (ix),#0x00
   4670                     342 00127$:
                            343 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 &&
   4670 DD 46 05      [19]  344 	ld	b,5 (ix)
   4673 04            [ 4]  345 	inc	b
   4674 04            [ 4]  346 	inc	b
   4675 C5            [11]  347 	push	bc
   4676 33            [ 6]  348 	inc	sp
   4677 DD 7E 04      [19]  349 	ld	a,4 (ix)
   467A F5            [11]  350 	push	af
   467B 33            [ 6]  351 	inc	sp
   467C DD 6E 08      [19]  352 	ld	l,8 (ix)
   467F DD 66 09      [19]  353 	ld	h,9 (ix)
   4682 E5            [11]  354 	push	hl
   4683 CD 71 4B      [17]  355 	call	_getTilePtr
   4686 F1            [10]  356 	pop	af
   4687 F1            [10]  357 	pop	af
   4688 4E            [ 7]  358 	ld	c,(hl)
   4689 3E 02         [ 7]  359 	ld	a,#0x02
   468B 91            [ 4]  360 	sub	a, c
   468C DA 55 47      [10]  361 	jp	C,00135$
                            362 ;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
   468F DD 7E 05      [19]  363 	ld	a,5 (ix)
   4692 C6 16         [ 7]  364 	add	a, #0x16
   4694 47            [ 4]  365 	ld	b,a
   4695 C5            [11]  366 	push	bc
   4696 33            [ 6]  367 	inc	sp
   4697 DD 7E FD      [19]  368 	ld	a,-3 (ix)
   469A F5            [11]  369 	push	af
   469B 33            [ 6]  370 	inc	sp
   469C DD 6E 08      [19]  371 	ld	l,8 (ix)
   469F DD 66 09      [19]  372 	ld	h,9 (ix)
   46A2 E5            [11]  373 	push	hl
   46A3 CD 71 4B      [17]  374 	call	_getTilePtr
   46A6 F1            [10]  375 	pop	af
   46A7 F1            [10]  376 	pop	af
   46A8 DD 74 F7      [19]  377 	ld	-9 (ix),h
   46AB DD 75 F6      [19]  378 	ld	-10 (ix), l
   46AE DD 66 F7      [19]  379 	ld	h,-9 (ix)
   46B1 7E            [ 7]  380 	ld	a,(hl)
   46B2 DD 77 F6      [19]  381 	ld	-10 (ix),a
   46B5 3E 02         [ 7]  382 	ld	a,#0x02
   46B7 DD 96 F6      [19]  383 	sub	a, -10 (ix)
   46BA DA 55 47      [10]  384 	jp	C,00135$
                            385 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   46BD DD 6E F0      [19]  386 	ld	l,-16 (ix)
   46C0 DD 66 F1      [19]  387 	ld	h,-15 (ix)
   46C3 E5            [11]  388 	push	hl
   46C4 CD B5 4B      [17]  389 	call	_abs
   46C7 F1            [10]  390 	pop	af
   46C8 DD 74 F7      [19]  391 	ld	-9 (ix),h
   46CB DD 75 F6      [19]  392 	ld	-10 (ix),l
   46CE DD 7E F2      [19]  393 	ld	a,-14 (ix)
   46D1 C6 02         [ 7]  394 	add	a, #0x02
   46D3 DD 77 F8      [19]  395 	ld	-8 (ix),a
   46D6 DD 7E F3      [19]  396 	ld	a,-13 (ix)
   46D9 CE 00         [ 7]  397 	adc	a, #0x00
   46DB DD 77 F9      [19]  398 	ld	-7 (ix),a
   46DE DD 7E F4      [19]  399 	ld	a,-12 (ix)
   46E1 DD 96 F8      [19]  400 	sub	a, -8 (ix)
   46E4 DD 77 F8      [19]  401 	ld	-8 (ix),a
   46E7 DD 7E F5      [19]  402 	ld	a,-11 (ix)
   46EA DD 9E F9      [19]  403 	sbc	a, -7 (ix)
   46ED DD 77 F9      [19]  404 	ld	-7 (ix),a
   46F0 DD 6E F8      [19]  405 	ld	l,-8 (ix)
   46F3 DD 66 F9      [19]  406 	ld	h,-7 (ix)
   46F6 E5            [11]  407 	push	hl
   46F7 CD B5 4B      [17]  408 	call	_abs
   46FA F1            [10]  409 	pop	af
   46FB DD 74 F9      [19]  410 	ld	-7 (ix),h
   46FE DD 75 F8      [19]  411 	ld	-8 (ix),l
   4701 DD 7E F6      [19]  412 	ld	a,-10 (ix)
   4704 DD 86 F8      [19]  413 	add	a, -8 (ix)
   4707 DD 77 F6      [19]  414 	ld	-10 (ix),a
   470A DD 7E F7      [19]  415 	ld	a,-9 (ix)
   470D DD 8E F9      [19]  416 	adc	a, -7 (ix)
   4710 DD 77 F7      [19]  417 	ld	-9 (ix),a
   4713 DD 7E F6      [19]  418 	ld	a,-10 (ix)
   4716 DD 86 DF      [19]  419 	add	a, -33 (ix)
   4719 DD 77 F6      [19]  420 	ld	-10 (ix),a
   471C DD 7E F7      [19]  421 	ld	a,-9 (ix)
   471F DD 8E E0      [19]  422 	adc	a, -32 (ix)
   4722 DD 77 F7      [19]  423 	ld	-9 (ix),a
   4725 DD 7E F6      [19]  424 	ld	a,-10 (ix)
   4728 DD 77 EB      [19]  425 	ld	-21 (ix),a
   472B DD 7E F7      [19]  426 	ld	a,-9 (ix)
   472E DD 77 EC      [19]  427 	ld	-20 (ix),a
                            428 ;src/pathfinding.c:87: if(resultado == 0){
   4731 DD 7E EF      [19]  429 	ld	a,-17 (ix)
   4734 B7            [ 4]  430 	or	a, a
   4735 20 1A         [12]  431 	jr	NZ,00132$
                            432 ;src/pathfinding.c:88: if(dist1 > dist2)
   4737 DD 7E EB      [19]  433 	ld	a,-21 (ix)
   473A DD 96 ED      [19]  434 	sub	a, -19 (ix)
   473D DD 7E EC      [19]  435 	ld	a,-20 (ix)
   4740 DD 9E EE      [19]  436 	sbc	a, -18 (ix)
   4743 E2 48 47      [10]  437 	jp	PO, 00304$
   4746 EE 80         [ 7]  438 	xor	a, #0x80
   4748                     439 00304$:
   4748 F2 55 47      [10]  440 	jp	P,00135$
                            441 ;src/pathfinding.c:89: resultado = 1;
   474B DD 36 EF 01   [19]  442 	ld	-17 (ix),#0x01
   474F 18 04         [12]  443 	jr	00135$
   4751                     444 00132$:
                            445 ;src/pathfinding.c:91: resultado = 1;
   4751 DD 36 EF 01   [19]  446 	ld	-17 (ix),#0x01
   4755                     447 00135$:
                            448 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4755 DD 4E 04      [19]  449 	ld	c,4 (ix)
   4758 0D            [ 4]  450 	dec	c
   4759 C5            [11]  451 	push	bc
   475A DD 7E 05      [19]  452 	ld	a,5 (ix)
   475D F5            [11]  453 	push	af
   475E 33            [ 6]  454 	inc	sp
   475F 79            [ 4]  455 	ld	a,c
   4760 F5            [11]  456 	push	af
   4761 33            [ 6]  457 	inc	sp
   4762 DD 6E 08      [19]  458 	ld	l,8 (ix)
   4765 DD 66 09      [19]  459 	ld	h,9 (ix)
   4768 E5            [11]  460 	push	hl
   4769 CD 71 4B      [17]  461 	call	_getTilePtr
   476C F1            [10]  462 	pop	af
   476D F1            [10]  463 	pop	af
   476E C1            [10]  464 	pop	bc
   476F 46            [ 7]  465 	ld	b,(hl)
                            466 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4770 DD 7E 05      [19]  467 	ld	a,5 (ix)
   4773 C6 14         [ 7]  468 	add	a, #0x14
   4775 DD 77 F6      [19]  469 	ld	-10 (ix),a
                            470 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4778 DD 7E 05      [19]  471 	ld	a,5 (ix)
   477B C6 0B         [ 7]  472 	add	a, #0x0B
   477D DD 77 F8      [19]  473 	ld	-8 (ix),a
                            474 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4780 DD 7E F4      [19]  475 	ld	a,-12 (ix)
   4783 DD 96 F2      [19]  476 	sub	a, -14 (ix)
   4786 DD 77 F0      [19]  477 	ld	-16 (ix),a
   4789 DD 7E F5      [19]  478 	ld	a,-11 (ix)
   478C DD 9E F3      [19]  479 	sbc	a, -13 (ix)
   478F DD 77 F1      [19]  480 	ld	-15 (ix),a
                            481 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4792 3E 02         [ 7]  482 	ld	a,#0x02
   4794 90            [ 4]  483 	sub	a, b
   4795 DA 43 48      [10]  484 	jp	C,00148$
                            485 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4798 C5            [11]  486 	push	bc
   4799 DD 7E F6      [19]  487 	ld	a,-10 (ix)
   479C F5            [11]  488 	push	af
   479D 33            [ 6]  489 	inc	sp
   479E 79            [ 4]  490 	ld	a,c
   479F F5            [11]  491 	push	af
   47A0 33            [ 6]  492 	inc	sp
   47A1 DD 6E 08      [19]  493 	ld	l,8 (ix)
   47A4 DD 66 09      [19]  494 	ld	h,9 (ix)
   47A7 E5            [11]  495 	push	hl
   47A8 CD 71 4B      [17]  496 	call	_getTilePtr
   47AB F1            [10]  497 	pop	af
   47AC F1            [10]  498 	pop	af
   47AD C1            [10]  499 	pop	bc
   47AE 46            [ 7]  500 	ld	b,(hl)
   47AF 3E 02         [ 7]  501 	ld	a,#0x02
   47B1 90            [ 4]  502 	sub	a, b
   47B2 DA 43 48      [10]  503 	jp	C,00148$
                            504 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   47B5 DD 7E F8      [19]  505 	ld	a,-8 (ix)
   47B8 F5            [11]  506 	push	af
   47B9 33            [ 6]  507 	inc	sp
   47BA 79            [ 4]  508 	ld	a,c
   47BB F5            [11]  509 	push	af
   47BC 33            [ 6]  510 	inc	sp
   47BD DD 6E 08      [19]  511 	ld	l,8 (ix)
   47C0 DD 66 09      [19]  512 	ld	h,9 (ix)
   47C3 E5            [11]  513 	push	hl
   47C4 CD 71 4B      [17]  514 	call	_getTilePtr
   47C7 F1            [10]  515 	pop	af
   47C8 F1            [10]  516 	pop	af
   47C9 4E            [ 7]  517 	ld	c,(hl)
   47CA 3E 02         [ 7]  518 	ld	a,#0x02
   47CC 91            [ 4]  519 	sub	a, c
   47CD 38 74         [12]  520 	jr	C,00148$
                            521 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   47CF DD 4E FB      [19]  522 	ld	c,-5 (ix)
   47D2 DD 46 FC      [19]  523 	ld	b,-4 (ix)
   47D5 0B            [ 6]  524 	dec	bc
   47D6 DD 7E FE      [19]  525 	ld	a,-2 (ix)
   47D9 91            [ 4]  526 	sub	a, c
   47DA 4F            [ 4]  527 	ld	c,a
   47DB DD 7E FF      [19]  528 	ld	a,-1 (ix)
   47DE 98            [ 4]  529 	sbc	a, b
   47DF 47            [ 4]  530 	ld	b,a
   47E0 C5            [11]  531 	push	bc
   47E1 CD B5 4B      [17]  532 	call	_abs
   47E4 E3            [19]  533 	ex	(sp),hl
   47E5 DD 6E F0      [19]  534 	ld	l,-16 (ix)
   47E8 DD 66 F1      [19]  535 	ld	h,-15 (ix)
   47EB E5            [11]  536 	push	hl
   47EC CD B5 4B      [17]  537 	call	_abs
   47EF F1            [10]  538 	pop	af
   47F0 C1            [10]  539 	pop	bc
   47F1 09            [11]  540 	add	hl,bc
   47F2 DD 5E E5      [19]  541 	ld	e,-27 (ix)
   47F5 DD 56 E6      [19]  542 	ld	d,-26 (ix)
   47F8 19            [11]  543 	add	hl,de
   47F9 DD 75 E9      [19]  544 	ld	-23 (ix),l
   47FC DD 74 EA      [19]  545 	ld	-22 (ix),h
                            546 ;src/pathfinding.c:99: if(resultado == 0){
   47FF DD 7E EF      [19]  547 	ld	a,-17 (ix)
   4802 B7            [ 4]  548 	or	a, a
   4803 20 1A         [12]  549 	jr	NZ,00145$
                            550 ;src/pathfinding.c:100: if(dist1 >= dist3)
   4805 DD 7E ED      [19]  551 	ld	a,-19 (ix)
   4808 DD 96 E9      [19]  552 	sub	a, -23 (ix)
   480B DD 7E EE      [19]  553 	ld	a,-18 (ix)
   480E DD 9E EA      [19]  554 	sbc	a, -22 (ix)
   4811 E2 16 48      [10]  555 	jp	PO, 00305$
   4814 EE 80         [ 7]  556 	xor	a, #0x80
   4816                     557 00305$:
   4816 FA 43 48      [10]  558 	jp	M,00148$
                            559 ;src/pathfinding.c:101: resultado = 2;
   4819 DD 36 EF 02   [19]  560 	ld	-17 (ix),#0x02
   481D 18 24         [12]  561 	jr	00148$
   481F                     562 00145$:
                            563 ;src/pathfinding.c:102: }else if(resultado == 1){
   481F DD 7E EF      [19]  564 	ld	a,-17 (ix)
   4822 3D            [ 4]  565 	dec	a
   4823 20 1A         [12]  566 	jr	NZ,00142$
                            567 ;src/pathfinding.c:103: if(dist2 >= dist3)
   4825 DD 7E EB      [19]  568 	ld	a,-21 (ix)
   4828 DD 96 E9      [19]  569 	sub	a, -23 (ix)
   482B DD 7E EC      [19]  570 	ld	a,-20 (ix)
   482E DD 9E EA      [19]  571 	sbc	a, -22 (ix)
   4831 E2 36 48      [10]  572 	jp	PO, 00308$
   4834 EE 80         [ 7]  573 	xor	a, #0x80
   4836                     574 00308$:
   4836 FA 43 48      [10]  575 	jp	M,00148$
                            576 ;src/pathfinding.c:104: resultado = 2;
   4839 DD 36 EF 02   [19]  577 	ld	-17 (ix),#0x02
   483D 18 04         [12]  578 	jr	00148$
   483F                     579 00142$:
                            580 ;src/pathfinding.c:106: resultado = 2;
   483F DD 36 EF 02   [19]  581 	ld	-17 (ix),#0x02
   4843                     582 00148$:
                            583 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x +1), y) <=2 &&
   4843 DD 46 04      [19]  584 	ld	b,4 (ix)
   4846 04            [ 4]  585 	inc	b
   4847 DD 7E 05      [19]  586 	ld	a,5 (ix)
   484A F5            [11]  587 	push	af
   484B 33            [ 6]  588 	inc	sp
   484C C5            [11]  589 	push	bc
   484D 33            [ 6]  590 	inc	sp
   484E DD 6E 08      [19]  591 	ld	l,8 (ix)
   4851 DD 66 09      [19]  592 	ld	h,9 (ix)
   4854 E5            [11]  593 	push	hl
   4855 CD 71 4B      [17]  594 	call	_getTilePtr
   4858 F1            [10]  595 	pop	af
   4859 F1            [10]  596 	pop	af
   485A 4E            [ 7]  597 	ld	c,(hl)
   485B 3E 02         [ 7]  598 	ld	a,#0x02
   485D 91            [ 4]  599 	sub	a, c
   485E DA 6A 49      [10]  600 	jp	C,00167$
                            601 ;src/pathfinding.c:111: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
   4861 DD 7E 04      [19]  602 	ld	a,4 (ix)
   4864 C6 05         [ 7]  603 	add	a, #0x05
   4866 47            [ 4]  604 	ld	b,a
   4867 C5            [11]  605 	push	bc
   4868 DD 7E F6      [19]  606 	ld	a,-10 (ix)
   486B F5            [11]  607 	push	af
   486C 33            [ 6]  608 	inc	sp
   486D C5            [11]  609 	push	bc
   486E 33            [ 6]  610 	inc	sp
   486F DD 6E 08      [19]  611 	ld	l,8 (ix)
   4872 DD 66 09      [19]  612 	ld	h,9 (ix)
   4875 E5            [11]  613 	push	hl
   4876 CD 71 4B      [17]  614 	call	_getTilePtr
   4879 F1            [10]  615 	pop	af
   487A F1            [10]  616 	pop	af
   487B C1            [10]  617 	pop	bc
   487C 4E            [ 7]  618 	ld	c,(hl)
   487D 3E 02         [ 7]  619 	ld	a,#0x02
   487F 91            [ 4]  620 	sub	a, c
   4880 DA 6A 49      [10]  621 	jp	C,00167$
                            622 ;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4883 DD 7E F8      [19]  623 	ld	a,-8 (ix)
   4886 F5            [11]  624 	push	af
   4887 33            [ 6]  625 	inc	sp
   4888 C5            [11]  626 	push	bc
   4889 33            [ 6]  627 	inc	sp
   488A DD 6E 08      [19]  628 	ld	l,8 (ix)
   488D DD 66 09      [19]  629 	ld	h,9 (ix)
   4890 E5            [11]  630 	push	hl
   4891 CD 71 4B      [17]  631 	call	_getTilePtr
   4894 F1            [10]  632 	pop	af
   4895 F1            [10]  633 	pop	af
   4896 4E            [ 7]  634 	ld	c,(hl)
   4897 3E 02         [ 7]  635 	ld	a,#0x02
   4899 91            [ 4]  636 	sub	a, c
   489A DA 6A 49      [10]  637 	jp	C,00167$
                            638 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   489D DD 7E FB      [19]  639 	ld	a,-5 (ix)
   48A0 C6 01         [ 7]  640 	add	a, #0x01
   48A2 DD 77 F6      [19]  641 	ld	-10 (ix),a
   48A5 DD 7E FC      [19]  642 	ld	a,-4 (ix)
   48A8 CE 00         [ 7]  643 	adc	a, #0x00
   48AA DD 77 F7      [19]  644 	ld	-9 (ix),a
   48AD DD 7E FE      [19]  645 	ld	a,-2 (ix)
   48B0 DD 96 F6      [19]  646 	sub	a, -10 (ix)
   48B3 DD 77 F6      [19]  647 	ld	-10 (ix),a
   48B6 DD 7E FF      [19]  648 	ld	a,-1 (ix)
   48B9 DD 9E F7      [19]  649 	sbc	a, -9 (ix)
   48BC DD 77 F7      [19]  650 	ld	-9 (ix),a
   48BF DD 6E F6      [19]  651 	ld	l,-10 (ix)
   48C2 DD 66 F7      [19]  652 	ld	h,-9 (ix)
   48C5 E5            [11]  653 	push	hl
   48C6 CD B5 4B      [17]  654 	call	_abs
   48C9 F1            [10]  655 	pop	af
   48CA DD 74 F7      [19]  656 	ld	-9 (ix),h
   48CD DD 75 F6      [19]  657 	ld	-10 (ix),l
   48D0 DD 6E F0      [19]  658 	ld	l,-16 (ix)
   48D3 DD 66 F1      [19]  659 	ld	h,-15 (ix)
   48D6 E5            [11]  660 	push	hl
   48D7 CD B5 4B      [17]  661 	call	_abs
   48DA F1            [10]  662 	pop	af
   48DB DD 74 F9      [19]  663 	ld	-7 (ix),h
   48DE DD 75 F8      [19]  664 	ld	-8 (ix),l
   48E1 DD 7E F6      [19]  665 	ld	a,-10 (ix)
   48E4 DD 86 F8      [19]  666 	add	a, -8 (ix)
   48E7 DD 77 F6      [19]  667 	ld	-10 (ix),a
   48EA DD 7E F7      [19]  668 	ld	a,-9 (ix)
   48ED DD 8E F9      [19]  669 	adc	a, -7 (ix)
   48F0 DD 77 F7      [19]  670 	ld	-9 (ix),a
   48F3 DD 7E F6      [19]  671 	ld	a,-10 (ix)
   48F6 DD 86 E3      [19]  672 	add	a, -29 (ix)
   48F9 DD 77 E1      [19]  673 	ld	-31 (ix),a
   48FC DD 7E F7      [19]  674 	ld	a,-9 (ix)
   48FF DD 8E E4      [19]  675 	adc	a, -28 (ix)
   4902 DD 77 E2      [19]  676 	ld	-30 (ix),a
                            677 ;src/pathfinding.c:114: if(resultado == 0){
   4905 DD 7E EF      [19]  678 	ld	a,-17 (ix)
   4908 B7            [ 4]  679 	or	a, a
   4909 20 1A         [12]  680 	jr	NZ,00164$
                            681 ;src/pathfinding.c:115: if(dist1 >= dist4)
   490B DD 7E ED      [19]  682 	ld	a,-19 (ix)
   490E DD 96 E1      [19]  683 	sub	a, -31 (ix)
   4911 DD 7E EE      [19]  684 	ld	a,-18 (ix)
   4914 DD 9E E2      [19]  685 	sbc	a, -30 (ix)
   4917 E2 1C 49      [10]  686 	jp	PO, 00309$
   491A EE 80         [ 7]  687 	xor	a, #0x80
   491C                     688 00309$:
   491C FA 6A 49      [10]  689 	jp	M,00167$
                            690 ;src/pathfinding.c:116: resultado = 3;
   491F DD 36 EF 03   [19]  691 	ld	-17 (ix),#0x03
   4923 18 45         [12]  692 	jr	00167$
   4925                     693 00164$:
                            694 ;src/pathfinding.c:117: }else if(resultado == 1){
   4925 DD 7E EF      [19]  695 	ld	a,-17 (ix)
   4928 3D            [ 4]  696 	dec	a
   4929 20 1A         [12]  697 	jr	NZ,00161$
                            698 ;src/pathfinding.c:118: if(dist2 >= dist4)
   492B DD 7E EB      [19]  699 	ld	a,-21 (ix)
   492E DD 96 E1      [19]  700 	sub	a, -31 (ix)
   4931 DD 7E EC      [19]  701 	ld	a,-20 (ix)
   4934 DD 9E E2      [19]  702 	sbc	a, -30 (ix)
   4937 E2 3C 49      [10]  703 	jp	PO, 00312$
   493A EE 80         [ 7]  704 	xor	a, #0x80
   493C                     705 00312$:
   493C FA 6A 49      [10]  706 	jp	M,00167$
                            707 ;src/pathfinding.c:119: resultado = 3;
   493F DD 36 EF 03   [19]  708 	ld	-17 (ix),#0x03
   4943 18 25         [12]  709 	jr	00167$
   4945                     710 00161$:
                            711 ;src/pathfinding.c:120: }else if (resultado == 2){
   4945 DD 7E EF      [19]  712 	ld	a,-17 (ix)
   4948 D6 02         [ 7]  713 	sub	a, #0x02
   494A 20 1A         [12]  714 	jr	NZ,00158$
                            715 ;src/pathfinding.c:121: if(dist3 >= dist4)
   494C DD 7E E9      [19]  716 	ld	a,-23 (ix)
   494F DD 96 E1      [19]  717 	sub	a, -31 (ix)
   4952 DD 7E EA      [19]  718 	ld	a,-22 (ix)
   4955 DD 9E E2      [19]  719 	sbc	a, -30 (ix)
   4958 E2 5D 49      [10]  720 	jp	PO, 00315$
   495B EE 80         [ 7]  721 	xor	a, #0x80
   495D                     722 00315$:
   495D FA 6A 49      [10]  723 	jp	M,00167$
                            724 ;src/pathfinding.c:122: resultado = 3;
   4960 DD 36 EF 03   [19]  725 	ld	-17 (ix),#0x03
   4964 18 04         [12]  726 	jr	00167$
   4966                     727 00158$:
                            728 ;src/pathfinding.c:124: resultado = 3;
   4966 DD 36 EF 03   [19]  729 	ld	-17 (ix),#0x03
   496A                     730 00167$:
                            731 ;src/pathfinding.c:128: return resultado;
   496A DD 6E EF      [19]  732 	ld	l,-17 (ix)
   496D DD F9         [10]  733 	ld	sp, ix
   496F DD E1         [14]  734 	pop	ix
   4971 C9            [10]  735 	ret
                            736 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            737 ;	---------------------------------
                            738 ; Function pathFinding
                            739 ; ---------------------------------
   4972                     740 _pathFinding::
   4972 DD E5         [15]  741 	push	ix
   4974 DD 21 00 00   [14]  742 	ld	ix,#0
   4978 DD 39         [15]  743 	add	ix,sp
   497A 21 ED FF      [10]  744 	ld	hl,#-19
   497D 39            [11]  745 	add	hl,sp
   497E F9            [ 6]  746 	ld	sp,hl
                            747 ;src/pathfinding.c:144: u8 problem = 0;
   497F DD 36 ED 00   [19]  748 	ld	-19 (ix),#0x00
                            749 ;src/pathfinding.c:146: x = s_x;
   4983 DD 7E 04      [19]  750 	ld	a,4 (ix)
   4986 DD 77 EF      [19]  751 	ld	-17 (ix),a
                            752 ;src/pathfinding.c:147: sol_tam = 0;
   4989 21 A7 64      [10]  753 	ld	hl,#_sol_tam + 0
   498C 36 00         [10]  754 	ld	(hl), #0x00
                            755 ;src/pathfinding.c:148: y = s_y;
   498E DD 7E 05      [19]  756 	ld	a,5 (ix)
   4991 DD 77 EE      [19]  757 	ld	-18 (ix),a
                            758 ;src/pathfinding.c:150: k = 0;
   4994 DD 36 F2 00   [19]  759 	ld	-14 (ix),#0x00
                            760 ;src/pathfinding.c:151: aux = 1;
   4998 DD 36 F4 01   [19]  761 	ld	-12 (ix),#0x01
                            762 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   499C DD 7E 08      [19]  763 	ld	a,8 (ix)
   499F DD 77 FA      [19]  764 	ld	-6 (ix),a
   49A2 DD 7E 09      [19]  765 	ld	a,9 (ix)
   49A5 DD 77 FB      [19]  766 	ld	-5 (ix),a
   49A8 DD 7E FA      [19]  767 	ld	a,-6 (ix)
   49AB C6 E2         [ 7]  768 	add	a, #0xE2
   49AD DD 77 F8      [19]  769 	ld	-8 (ix),a
   49B0 DD 7E FB      [19]  770 	ld	a,-5 (ix)
   49B3 CE 00         [ 7]  771 	adc	a, #0x00
   49B5 DD 77 F9      [19]  772 	ld	-7 (ix),a
   49B8 DD 6E F8      [19]  773 	ld	l,-8 (ix)
   49BB DD 66 F9      [19]  774 	ld	h,-7 (ix)
   49BE 36 00         [10]  775 	ld	(hl),#0x00
                            776 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   49C0 DD 66 EE      [19]  777 	ld	h,-18 (ix)
   49C3 DD 6E EF      [19]  778 	ld	l,-17 (ix)
   49C6 E5            [11]  779 	push	hl
   49C7 CD 4C 44      [17]  780 	call	_anyadirALista
   49CA F1            [10]  781 	pop	af
   49CB DD 75 F1      [19]  782 	ld	-15 (ix),l
                            783 ;src/pathfinding.c:156: if(!(x == f_x && y == f_y) ){
   49CE DD 7E 06      [19]  784 	ld	a,6 (ix)
   49D1 DD 96 EF      [19]  785 	sub	a, -17 (ix)
   49D4 20 09         [12]  786 	jr	NZ,00114$
   49D6 DD 7E 07      [19]  787 	ld	a,7 (ix)
   49D9 DD 96 EE      [19]  788 	sub	a, -18 (ix)
   49DC CA E6 4A      [10]  789 	jp	Z,00118$
                            790 ;src/pathfinding.c:157: while (aux){
   49DF                     791 00114$:
   49DF DD 7E F4      [19]  792 	ld	a,-12 (ix)
   49E2 B7            [ 4]  793 	or	a, a
   49E3 CA EA 4A      [10]  794 	jp	Z,00119$
                            795 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   49E6 DD 7E 06      [19]  796 	ld	a,6 (ix)
   49E9 DD 96 EF      [19]  797 	sub	a, -17 (ix)
   49EC 20 08         [12]  798 	jr	NZ,00113$
   49EE DD 7E 07      [19]  799 	ld	a,7 (ix)
   49F1 DD 96 EE      [19]  800 	sub	a, -18 (ix)
   49F4 28 06         [12]  801 	jr	Z,00109$
   49F6                     802 00113$:
   49F6 DD 7E F1      [19]  803 	ld	a,-15 (ix)
   49F9 B7            [ 4]  804 	or	a, a
   49FA 20 16         [12]  805 	jr	NZ,00110$
   49FC                     806 00109$:
                            807 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   49FC DD 7E F1      [19]  808 	ld	a,-15 (ix)
   49FF B7            [ 4]  809 	or	a, a
   4A00 28 06         [12]  810 	jr	Z,00101$
   4A02 3A A7 64      [13]  811 	ld	a,(#_sol_tam + 0)
   4A05 B7            [ 4]  812 	or	a, a
   4A06 20 04         [12]  813 	jr	NZ,00102$
   4A08                     814 00101$:
                            815 ;src/pathfinding.c:161: problem = 1;
   4A08 DD 36 ED 01   [19]  816 	ld	-19 (ix),#0x01
   4A0C                     817 00102$:
                            818 ;src/pathfinding.c:164: aux = 0;
   4A0C DD 36 F4 00   [19]  819 	ld	-12 (ix),#0x00
   4A10 18 CD         [12]  820 	jr	00114$
   4A12                     821 00110$:
                            822 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   4A12 DD 6E 0A      [19]  823 	ld	l,10 (ix)
   4A15 DD 66 0B      [19]  824 	ld	h,11 (ix)
   4A18 E5            [11]  825 	push	hl
   4A19 DD 66 07      [19]  826 	ld	h,7 (ix)
   4A1C DD 6E 06      [19]  827 	ld	l,6 (ix)
   4A1F E5            [11]  828 	push	hl
   4A20 DD 66 EE      [19]  829 	ld	h,-18 (ix)
   4A23 DD 6E EF      [19]  830 	ld	l,-17 (ix)
   4A26 E5            [11]  831 	push	hl
   4A27 CD 94 44      [17]  832 	call	_adjacentTiles
   4A2A F1            [10]  833 	pop	af
   4A2B F1            [10]  834 	pop	af
   4A2C F1            [10]  835 	pop	af
   4A2D DD 75 F0      [19]  836 	ld	-16 (ix),l
                            837 ;src/pathfinding.c:168: switch(movimiento){
   4A30 3E 03         [ 7]  838 	ld	a,#0x03
   4A32 DD 96 F0      [19]  839 	sub	a, -16 (ix)
   4A35 38 A8         [12]  840 	jr	C,00114$
                            841 ;src/pathfinding.c:172: k = k+2;
   4A37 DD 7E F2      [19]  842 	ld	a,-14 (ix)
   4A3A C6 02         [ 7]  843 	add	a, #0x02
   4A3C DD 77 F7      [19]  844 	ld	-9 (ix),a
                            845 ;src/pathfinding.c:168: switch(movimiento){
   4A3F DD 5E F0      [19]  846 	ld	e,-16 (ix)
   4A42 16 00         [ 7]  847 	ld	d,#0x00
   4A44 21 4A 4A      [10]  848 	ld	hl,#00180$
   4A47 19            [11]  849 	add	hl,de
   4A48 19            [11]  850 	add	hl,de
                            851 ;src/pathfinding.c:169: case 0:
   4A49 E9            [ 4]  852 	jp	(hl)
   4A4A                     853 00180$:
   4A4A 18 06         [12]  854 	jr	00104$
   4A4C 18 2C         [12]  855 	jr	00105$
   4A4E 18 52         [12]  856 	jr	00106$
   4A50 18 70         [12]  857 	jr	00107$
   4A52                     858 00104$:
                            859 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   4A52 DD 7E EE      [19]  860 	ld	a,-18 (ix)
   4A55 C6 FE         [ 7]  861 	add	a,#0xFE
   4A57 DD 77 FE      [19]  862 	ld	-2 (ix), a
   4A5A F5            [11]  863 	push	af
   4A5B 33            [ 6]  864 	inc	sp
   4A5C DD 7E EF      [19]  865 	ld	a,-17 (ix)
   4A5F F5            [11]  866 	push	af
   4A60 33            [ 6]  867 	inc	sp
   4A61 CD 4C 44      [17]  868 	call	_anyadirALista
   4A64 F1            [10]  869 	pop	af
   4A65 DD 75 FF      [19]  870 	ld	-1 (ix), l
   4A68 DD 75 F1      [19]  871 	ld	-15 (ix), l
                            872 ;src/pathfinding.c:171: y = y-2;
   4A6B DD 4E FE      [19]  873 	ld	c,-2 (ix)
   4A6E DD 71 EE      [19]  874 	ld	-18 (ix),c
                            875 ;src/pathfinding.c:172: k = k+2;
   4A71 DD 7E F7      [19]  876 	ld	a,-9 (ix)
   4A74 DD 77 F2      [19]  877 	ld	-14 (ix),a
                            878 ;src/pathfinding.c:173: break;
   4A77 C3 DF 49      [10]  879 	jp	00114$
                            880 ;src/pathfinding.c:174: case 1:
   4A7A                     881 00105$:
                            882 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   4A7A DD 7E EE      [19]  883 	ld	a,-18 (ix)
   4A7D C6 02         [ 7]  884 	add	a, #0x02
   4A7F DD 77 FF      [19]  885 	ld	-1 (ix), a
   4A82 F5            [11]  886 	push	af
   4A83 33            [ 6]  887 	inc	sp
   4A84 DD 7E EF      [19]  888 	ld	a,-17 (ix)
   4A87 F5            [11]  889 	push	af
   4A88 33            [ 6]  890 	inc	sp
   4A89 CD 4C 44      [17]  891 	call	_anyadirALista
   4A8C F1            [10]  892 	pop	af
   4A8D DD 75 FE      [19]  893 	ld	-2 (ix), l
   4A90 DD 75 F1      [19]  894 	ld	-15 (ix), l
                            895 ;src/pathfinding.c:178: y = y+2;
   4A93 DD 4E FF      [19]  896 	ld	c,-1 (ix)
   4A96 DD 71 EE      [19]  897 	ld	-18 (ix),c
                            898 ;src/pathfinding.c:179: k = k+2;
   4A99 DD 7E F7      [19]  899 	ld	a,-9 (ix)
   4A9C DD 77 F2      [19]  900 	ld	-14 (ix),a
                            901 ;src/pathfinding.c:180: break;
   4A9F C3 DF 49      [10]  902 	jp	00114$
                            903 ;src/pathfinding.c:181: case 2:
   4AA2                     904 00106$:
                            905 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4AA2 DD 46 EF      [19]  906 	ld	b,-17 (ix)
   4AA5 05            [ 4]  907 	dec	b
   4AA6 C5            [11]  908 	push	bc
   4AA7 DD 7E EE      [19]  909 	ld	a,-18 (ix)
   4AAA F5            [11]  910 	push	af
   4AAB 33            [ 6]  911 	inc	sp
   4AAC C5            [11]  912 	push	bc
   4AAD 33            [ 6]  913 	inc	sp
   4AAE CD 4C 44      [17]  914 	call	_anyadirALista
   4AB1 F1            [10]  915 	pop	af
   4AB2 C1            [10]  916 	pop	bc
   4AB3 DD 75 F1      [19]  917 	ld	-15 (ix),l
                            918 ;src/pathfinding.c:185: x = x-1;
   4AB6 DD 70 EF      [19]  919 	ld	-17 (ix),b
                            920 ;src/pathfinding.c:186: k = k+2;
   4AB9 DD 7E F7      [19]  921 	ld	a,-9 (ix)
   4ABC DD 77 F2      [19]  922 	ld	-14 (ix),a
                            923 ;src/pathfinding.c:187: break;
   4ABF C3 DF 49      [10]  924 	jp	00114$
                            925 ;src/pathfinding.c:188: case 3:
   4AC2                     926 00107$:
                            927 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4AC2 DD 7E EF      [19]  928 	ld	a,-17 (ix)
   4AC5 3C            [ 4]  929 	inc	a
   4AC6 DD 77 FF      [19]  930 	ld	-1 (ix),a
   4AC9 DD 66 EE      [19]  931 	ld	h,-18 (ix)
   4ACC DD 6E FF      [19]  932 	ld	l,-1 (ix)
   4ACF E5            [11]  933 	push	hl
   4AD0 CD 4C 44      [17]  934 	call	_anyadirALista
   4AD3 F1            [10]  935 	pop	af
   4AD4 DD 75 F1      [19]  936 	ld	-15 (ix),l
                            937 ;src/pathfinding.c:190: x = x+1;
   4AD7 DD 7E FF      [19]  938 	ld	a,-1 (ix)
   4ADA DD 77 EF      [19]  939 	ld	-17 (ix),a
                            940 ;src/pathfinding.c:191: k = k+2;
   4ADD DD 7E F7      [19]  941 	ld	a,-9 (ix)
   4AE0 DD 77 F2      [19]  942 	ld	-14 (ix),a
                            943 ;src/pathfinding.c:194: }
   4AE3 C3 DF 49      [10]  944 	jp	00114$
   4AE6                     945 00118$:
                            946 ;src/pathfinding.c:199: problem = 1;
   4AE6 DD 36 ED 01   [19]  947 	ld	-19 (ix),#0x01
   4AEA                     948 00119$:
                            949 ;src/pathfinding.c:201: if(problem == 0){
   4AEA DD 7E ED      [19]  950 	ld	a,-19 (ix)
   4AED B7            [ 4]  951 	or	a, a
   4AEE 20 74         [12]  952 	jr	NZ,00126$
                            953 ;src/pathfinding.c:202: if(sol_tam < CAMINO_TAM){
   4AF0 3A A7 64      [13]  954 	ld	a,(#_sol_tam + 0)
   4AF3 D6 C8         [ 7]  955 	sub	a, #0xC8
   4AF5 30 0C         [12]  956 	jr	NC,00122$
                            957 ;src/pathfinding.c:203: actual->longitud_camino = sol_tam;
   4AF7 DD 6E F8      [19]  958 	ld	l,-8 (ix)
   4AFA DD 66 F9      [19]  959 	ld	h,-7 (ix)
   4AFD 3A A7 64      [13]  960 	ld	a,(#_sol_tam + 0)
   4B00 77            [ 7]  961 	ld	(hl),a
   4B01 18 08         [12]  962 	jr	00142$
   4B03                     963 00122$:
                            964 ;src/pathfinding.c:205: actual->longitud_camino = CAMINO_TAM;
   4B03 DD 6E F8      [19]  965 	ld	l,-8 (ix)
   4B06 DD 66 F9      [19]  966 	ld	h,-7 (ix)
   4B09 36 C8         [10]  967 	ld	(hl),#0xC8
                            968 ;src/pathfinding.c:207: for (i; i<actual->longitud_camino; i++){
   4B0B                     969 00142$:
   4B0B DD 7E FA      [19]  970 	ld	a,-6 (ix)
   4B0E C6 1A         [ 7]  971 	add	a, #0x1A
   4B10 DD 77 FA      [19]  972 	ld	-6 (ix),a
   4B13 DD 7E FB      [19]  973 	ld	a,-5 (ix)
   4B16 CE 00         [ 7]  974 	adc	a, #0x00
   4B18 DD 77 FB      [19]  975 	ld	-5 (ix),a
   4B1B DD 36 F3 00   [19]  976 	ld	-13 (ix),#0x00
   4B1F                     977 00129$:
   4B1F DD 6E F8      [19]  978 	ld	l,-8 (ix)
   4B22 DD 66 F9      [19]  979 	ld	h,-7 (ix)
   4B25 DD 7E F3      [19]  980 	ld	a,-13 (ix)
   4B28 96            [ 7]  981 	sub	a,(hl)
   4B29 30 41         [12]  982 	jr	NC,00131$
                            983 ;src/pathfinding.c:208: actual->camino[i] = camino[i];
   4B2B DD 7E F3      [19]  984 	ld	a,-13 (ix)
   4B2E DD 86 FA      [19]  985 	add	a, -6 (ix)
   4B31 DD 77 F5      [19]  986 	ld	-11 (ix),a
   4B34 3E 00         [ 7]  987 	ld	a,#0x00
   4B36 DD 8E FB      [19]  988 	adc	a, -5 (ix)
   4B39 DD 77 F6      [19]  989 	ld	-10 (ix),a
   4B3C 3E A8         [ 7]  990 	ld	a,#<(_camino)
   4B3E DD 86 F3      [19]  991 	add	a, -13 (ix)
   4B41 DD 77 FC      [19]  992 	ld	-4 (ix),a
   4B44 3E 64         [ 7]  993 	ld	a,#>(_camino)
   4B46 CE 00         [ 7]  994 	adc	a, #0x00
   4B48 DD 77 FD      [19]  995 	ld	-3 (ix),a
   4B4B DD 6E FC      [19]  996 	ld	l,-4 (ix)
   4B4E DD 66 FD      [19]  997 	ld	h,-3 (ix)
   4B51 7E            [ 7]  998 	ld	a,(hl)
   4B52 DD 77 FC      [19]  999 	ld	-4 (ix),a
   4B55 DD 6E F5      [19] 1000 	ld	l,-11 (ix)
   4B58 DD 66 F6      [19] 1001 	ld	h,-10 (ix)
   4B5B DD 7E FC      [19] 1002 	ld	a,-4 (ix)
   4B5E 77            [ 7] 1003 	ld	(hl),a
                           1004 ;src/pathfinding.c:207: for (i; i<actual->longitud_camino; i++){
   4B5F DD 34 F3      [23] 1005 	inc	-13 (ix)
   4B62 18 BB         [12] 1006 	jr	00129$
   4B64                    1007 00126$:
                           1008 ;src/pathfinding.c:212: actual->longitud_camino = 0;
   4B64 DD 6E F8      [19] 1009 	ld	l,-8 (ix)
   4B67 DD 66 F9      [19] 1010 	ld	h,-7 (ix)
   4B6A 36 00         [10] 1011 	ld	(hl),#0x00
   4B6C                    1012 00131$:
   4B6C DD F9         [10] 1013 	ld	sp, ix
   4B6E DD E1         [14] 1014 	pop	ix
   4B70 C9            [10] 1015 	ret
                           1016 	.area _CODE
                           1017 	.area _INITIALIZER
                           1018 	.area _CABS (ABS)
