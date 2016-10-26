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
   630C                      26 _sol_tam::
   630C                      27 	.ds 1
   630D                      28 _camino::
   630D                      29 	.ds 200
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
   444E 3A 0C 63      [13]   62 	ld	a,(#_sol_tam + 0)
   4451 D6 C8         [ 7]   63 	sub	a, #0xC8
   4453 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   4455 01 0D 63      [10]   66 	ld	bc,#_camino+0
   4458 2A 0C 63      [16]   67 	ld	hl,(_sol_tam)
   445B 26 00         [ 7]   68 	ld	h,#0x00
   445D 09            [11]   69 	add	hl,bc
   445E FD 21 02 00   [14]   70 	ld	iy,#2
   4462 FD 39         [15]   71 	add	iy,sp
   4464 FD 7E 00      [19]   72 	ld	a,0 (iy)
   4467 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   4468 21 0C 63      [10]   75 	ld	hl, #_sol_tam+0
   446B 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   446C 2A 0C 63      [16]   78 	ld	hl,(_sol_tam)
   446F 26 00         [ 7]   79 	ld	h,#0x00
   4471 09            [11]   80 	add	hl,bc
   4472 FD 21 03 00   [14]   81 	ld	iy,#3
   4476 FD 39         [15]   82 	add	iy,sp
   4478 FD 7E 00      [19]   83 	ld	a,0 (iy)
   447B 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   447C 21 0C 63      [10]   86 	ld	hl, #_sol_tam+0
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
   449C 21 E1 FF      [10]  111 	ld	hl,#-31
   449F 39            [11]  112 	add	hl,sp
   44A0 F9            [ 6]  113 	ld	sp,hl
                            114 ;src/pathfinding.c:26: u8 resultado = 4;
   44A1 DD 36 F1 04   [19]  115 	ld	-15 (ix),#0x04
                            116 ;src/pathfinding.c:28: i16 dist1 = 0;
   44A5 DD 36 EF 00   [19]  117 	ld	-17 (ix),#0x00
   44A9 DD 36 F0 00   [19]  118 	ld	-16 (ix),#0x00
                            119 ;src/pathfinding.c:29: i16 dist2 = 0;
   44AD DD 36 ED 00   [19]  120 	ld	-19 (ix),#0x00
   44B1 DD 36 EE 00   [19]  121 	ld	-18 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   44B5 DD 36 EB 00   [19]  123 	ld	-21 (ix),#0x00
   44B9 DD 36 EC 00   [19]  124 	ld	-20 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   44BD DD 36 E7 00   [19]  126 	ld	-25 (ix),#0x00
   44C1 DD 36 E8 00   [19]  127 	ld	-24 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   44C5 21 00 00      [10]  129 	ld	hl,#0x0000
   44C8 E3            [19]  130 	ex	(sp), hl
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   44C9 DD 36 E3 00   [19]  132 	ld	-29 (ix),#0x00
   44CD DD 36 E4 00   [19]  133 	ld	-28 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   44D1 DD 36 E5 00   [19]  135 	ld	-27 (ix),#0x00
   44D5 DD 36 E6 00   [19]  136 	ld	-26 (ix),#0x00
                            137 ;src/pathfinding.c:43: if(y < f_y)
   44D9 DD 7E 05      [19]  138 	ld	a,5 (ix)
   44DC DD 96 07      [19]  139 	sub	a, 7 (ix)
   44DF 3E 00         [ 7]  140 	ld	a,#0x00
   44E1 17            [ 4]  141 	rla
   44E2 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   44E3 DD 7E 04      [19]  144 	ld	a,4 (ix)
   44E6 DD 96 06      [19]  145 	sub	a, 6 (ix)
   44E9 20 20         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   44EB 79            [ 4]  148 	ld	a,c
   44EC B7            [ 4]  149 	or	a, a
   44ED 28 08         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   44EF DD 36 E5 FF   [19]  152 	ld	-27 (ix),#0xFF
   44F3 DD 36 E6 FF   [19]  153 	ld	-26 (ix),#0xFF
   44F7                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   44F7 DD 7E 07      [19]  156 	ld	a,7 (ix)
   44FA DD 96 05      [19]  157 	sub	a, 5 (ix)
   44FD D2 7F 45      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   4500 DD 36 E3 FF   [19]  160 	ld	-29 (ix),#0xFF
   4504 DD 36 E4 FF   [19]  161 	ld	-28 (ix),#0xFF
   4508 C3 7F 45      [10]  162 	jp	00125$
   450B                     163 00124$:
                            164 ;src/pathfinding.c:51: if(x < f_x)
   450B DD 7E 04      [19]  165 	ld	a,4 (ix)
   450E DD 96 06      [19]  166 	sub	a, 6 (ix)
   4511 3E 00         [ 7]  167 	ld	a,#0x00
   4513 17            [ 4]  168 	rla
   4514 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   4515 DD 7E 06      [19]  171 	ld	a,6 (ix)
   4518 DD 96 04      [19]  172 	sub	a, 4 (ix)
   451B 3E 00         [ 7]  173 	ld	a,#0x00
   451D 17            [ 4]  174 	rla
   451E 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   451F DD 7E 05      [19]  177 	ld	a,5 (ix)
   4522 DD 96 07      [19]  178 	sub	a, 7 (ix)
   4525 20 16         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   4527 78            [ 4]  181 	ld	a,b
   4528 B7            [ 4]  182 	or	a, a
   4529 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
   452B DD 36 E7 FF   [19]  185 	ld	-25 (ix),#0xFF
   452F DD 36 E8 FF   [19]  186 	ld	-24 (ix),#0xFF
   4533                     187 00106$:
                            188 ;src/pathfinding.c:53: if(x > f_x)
   4533 7B            [ 4]  189 	ld	a,e
   4534 B7            [ 4]  190 	or	a, a
   4535 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   4537 21 FF FF      [10]  193 	ld	hl,#0xFFFF
   453A E3            [19]  194 	ex	(sp), hl
   453B 18 42         [12]  195 	jr	00125$
   453D                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   453D 78            [ 4]  198 	ld	a,b
   453E B7            [ 4]  199 	or	a, a
   453F 28 20         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   4541 79            [ 4]  202 	ld	a,c
   4542 B7            [ 4]  203 	or	a, a
   4543 28 0A         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
   4545 DD 36 E5 FF   [19]  206 	ld	-27 (ix),#0xFF
   4549 DD 36 E6 FF   [19]  207 	ld	-26 (ix),#0xFF
   454D 18 08         [12]  208 	jr	00111$
   454F                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   454F DD 36 E3 FF   [19]  211 	ld	-29 (ix),#0xFF
   4553 DD 36 E4 FF   [19]  212 	ld	-28 (ix),#0xFF
   4557                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4557 DD 36 E7 FF   [19]  215 	ld	-25 (ix),#0xFF
   455B DD 36 E8 FF   [19]  216 	ld	-24 (ix),#0xFF
   455F 18 1E         [12]  217 	jr	00125$
   4561                     218 00118$:
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   4561 7B            [ 4]  220 	ld	a,e
   4562 B7            [ 4]  221 	or	a, a
   4563 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   4565 79            [ 4]  224 	ld	a,c
   4566 B7            [ 4]  225 	or	a, a
   4567 28 0A         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
   4569 DD 36 E5 FF   [19]  228 	ld	-27 (ix),#0xFF
   456D DD 36 E6 FF   [19]  229 	ld	-26 (ix),#0xFF
   4571 18 08         [12]  230 	jr	00114$
   4573                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4573 DD 36 E3 FF   [19]  233 	ld	-29 (ix),#0xFF
   4577 DD 36 E4 FF   [19]  234 	ld	-28 (ix),#0xFF
   457B                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   457B 21 FF FF      [10]  237 	ld	hl,#0xFFFF
   457E E3            [19]  238 	ex	(sp), hl
   457F                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   457F DD 46 05      [19]  241 	ld	b,5 (ix)
   4582 05            [ 4]  242 	dec	b
   4583 05            [ 4]  243 	dec	b
   4584 C5            [11]  244 	push	bc
   4585 33            [ 6]  245 	inc	sp
   4586 DD 7E 04      [19]  246 	ld	a,4 (ix)
   4589 F5            [11]  247 	push	af
   458A 33            [ 6]  248 	inc	sp
   458B DD 6E 08      [19]  249 	ld	l,8 (ix)
   458E DD 66 09      [19]  250 	ld	h,9 (ix)
   4591 E5            [11]  251 	push	hl
   4592 CD 2C 4A      [17]  252 	call	_getTilePtr
   4595 F1            [10]  253 	pop	af
   4596 F1            [10]  254 	pop	af
   4597 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4598 DD 7E 06      [19]  257 	ld	a,6 (ix)
   459B DD 77 FE      [19]  258 	ld	-2 (ix),a
   459E DD 36 FF 00   [19]  259 	ld	-1 (ix),#0x00
   45A2 DD 7E 04      [19]  260 	ld	a,4 (ix)
   45A5 DD 77 F8      [19]  261 	ld	-8 (ix),a
   45A8 DD 36 F9 00   [19]  262 	ld	-7 (ix),#0x00
   45AC DD 7E 07      [19]  263 	ld	a,7 (ix)
   45AF DD 77 F4      [19]  264 	ld	-12 (ix),a
   45B2 DD 36 F5 00   [19]  265 	ld	-11 (ix),#0x00
   45B6 DD 7E 05      [19]  266 	ld	a,5 (ix)
   45B9 DD 77 F2      [19]  267 	ld	-14 (ix),a
   45BC DD 36 F3 00   [19]  268 	ld	-13 (ix),#0x00
   45C0 DD 7E FE      [19]  269 	ld	a,-2 (ix)
   45C3 DD 96 F8      [19]  270 	sub	a, -8 (ix)
   45C6 DD 77 FC      [19]  271 	ld	-4 (ix),a
   45C9 DD 7E FF      [19]  272 	ld	a,-1 (ix)
   45CC DD 9E F9      [19]  273 	sbc	a, -7 (ix)
   45CF DD 77 FD      [19]  274 	ld	-3 (ix),a
                            275 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   45D2 3E 02         [ 7]  276 	ld	a,#0x02
   45D4 91            [ 4]  277 	sub	a, c
   45D5 38 62         [12]  278 	jr	C,00127$
                            279 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45D7 DD 6E FC      [19]  280 	ld	l,-4 (ix)
   45DA DD 66 FD      [19]  281 	ld	h,-3 (ix)
   45DD E5            [11]  282 	push	hl
   45DE CD 70 4A      [17]  283 	call	_abs
   45E1 F1            [10]  284 	pop	af
   45E2 DD 74 F7      [19]  285 	ld	-9 (ix),h
   45E5 DD 75 F6      [19]  286 	ld	-10 (ix),l
   45E8 DD 4E F2      [19]  287 	ld	c,-14 (ix)
   45EB DD 46 F3      [19]  288 	ld	b,-13 (ix)
   45EE 0B            [ 6]  289 	dec	bc
   45EF 0B            [ 6]  290 	dec	bc
   45F0 DD 7E F4      [19]  291 	ld	a,-12 (ix)
   45F3 91            [ 4]  292 	sub	a, c
   45F4 4F            [ 4]  293 	ld	c,a
   45F5 DD 7E F5      [19]  294 	ld	a,-11 (ix)
   45F8 98            [ 4]  295 	sbc	a, b
   45F9 47            [ 4]  296 	ld	b,a
   45FA C5            [11]  297 	push	bc
   45FB CD 70 4A      [17]  298 	call	_abs
   45FE F1            [10]  299 	pop	af
   45FF DD 74 FB      [19]  300 	ld	-5 (ix),h
   4602 DD 75 FA      [19]  301 	ld	-6 (ix),l
   4605 DD 7E F6      [19]  302 	ld	a,-10 (ix)
   4608 DD 86 FA      [19]  303 	add	a, -6 (ix)
   460B DD 77 FA      [19]  304 	ld	-6 (ix),a
   460E DD 7E F7      [19]  305 	ld	a,-9 (ix)
   4611 DD 8E FB      [19]  306 	adc	a, -5 (ix)
   4614 DD 77 FB      [19]  307 	ld	-5 (ix),a
   4617 DD 7E FA      [19]  308 	ld	a,-6 (ix)
   461A DD 86 E3      [19]  309 	add	a, -29 (ix)
   461D DD 77 FA      [19]  310 	ld	-6 (ix),a
   4620 DD 7E FB      [19]  311 	ld	a,-5 (ix)
   4623 DD 8E E4      [19]  312 	adc	a, -28 (ix)
   4626 DD 77 FB      [19]  313 	ld	-5 (ix),a
   4629 DD 7E FA      [19]  314 	ld	a,-6 (ix)
   462C DD 77 EF      [19]  315 	ld	-17 (ix),a
   462F DD 7E FB      [19]  316 	ld	a,-5 (ix)
   4632 DD 77 F0      [19]  317 	ld	-16 (ix),a
                            318 ;src/pathfinding.c:81: resultado = 0;
   4635 DD 36 F1 00   [19]  319 	ld	-15 (ix),#0x00
   4639                     320 00127$:
                            321 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 /*&&
   4639 DD 46 05      [19]  322 	ld	b,5 (ix)
   463C 04            [ 4]  323 	inc	b
   463D 04            [ 4]  324 	inc	b
   463E C5            [11]  325 	push	bc
   463F 33            [ 6]  326 	inc	sp
   4640 DD 7E 04      [19]  327 	ld	a,4 (ix)
   4643 F5            [11]  328 	push	af
   4644 33            [ 6]  329 	inc	sp
   4645 DD 6E 08      [19]  330 	ld	l,8 (ix)
   4648 DD 66 09      [19]  331 	ld	h,9 (ix)
   464B E5            [11]  332 	push	hl
   464C CD 2C 4A      [17]  333 	call	_getTilePtr
   464F F1            [10]  334 	pop	af
   4650 F1            [10]  335 	pop	af
   4651 4E            [ 7]  336 	ld	c,(hl)
   4652 3E 02         [ 7]  337 	ld	a,#0x02
   4654 91            [ 4]  338 	sub	a, c
   4655 DA F0 46      [10]  339 	jp	C,00134$
                            340 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   4658 DD 6E FC      [19]  341 	ld	l,-4 (ix)
   465B DD 66 FD      [19]  342 	ld	h,-3 (ix)
   465E E5            [11]  343 	push	hl
   465F CD 70 4A      [17]  344 	call	_abs
   4662 F1            [10]  345 	pop	af
   4663 DD 74 FB      [19]  346 	ld	-5 (ix),h
   4666 DD 75 FA      [19]  347 	ld	-6 (ix),l
   4669 DD 7E F2      [19]  348 	ld	a,-14 (ix)
   466C C6 02         [ 7]  349 	add	a, #0x02
   466E DD 77 F6      [19]  350 	ld	-10 (ix),a
   4671 DD 7E F3      [19]  351 	ld	a,-13 (ix)
   4674 CE 00         [ 7]  352 	adc	a, #0x00
   4676 DD 77 F7      [19]  353 	ld	-9 (ix),a
   4679 DD 7E F4      [19]  354 	ld	a,-12 (ix)
   467C DD 96 F6      [19]  355 	sub	a, -10 (ix)
   467F DD 77 F6      [19]  356 	ld	-10 (ix),a
   4682 DD 7E F5      [19]  357 	ld	a,-11 (ix)
   4685 DD 9E F7      [19]  358 	sbc	a, -9 (ix)
   4688 DD 77 F7      [19]  359 	ld	-9 (ix),a
   468B DD 6E F6      [19]  360 	ld	l,-10 (ix)
   468E DD 66 F7      [19]  361 	ld	h,-9 (ix)
   4691 E5            [11]  362 	push	hl
   4692 CD 70 4A      [17]  363 	call	_abs
   4695 F1            [10]  364 	pop	af
   4696 DD 74 F7      [19]  365 	ld	-9 (ix),h
   4699 DD 75 F6      [19]  366 	ld	-10 (ix),l
   469C DD 7E FA      [19]  367 	ld	a,-6 (ix)
   469F DD 86 F6      [19]  368 	add	a, -10 (ix)
   46A2 DD 77 FA      [19]  369 	ld	-6 (ix),a
   46A5 DD 7E FB      [19]  370 	ld	a,-5 (ix)
   46A8 DD 8E F7      [19]  371 	adc	a, -9 (ix)
   46AB DD 77 FB      [19]  372 	ld	-5 (ix),a
   46AE DD 7E E5      [19]  373 	ld	a,-27 (ix)
   46B1 DD 86 FA      [19]  374 	add	a, -6 (ix)
   46B4 DD 77 FA      [19]  375 	ld	-6 (ix),a
   46B7 DD 7E E6      [19]  376 	ld	a,-26 (ix)
   46BA DD 8E FB      [19]  377 	adc	a, -5 (ix)
   46BD DD 77 FB      [19]  378 	ld	-5 (ix),a
   46C0 DD 7E FA      [19]  379 	ld	a,-6 (ix)
   46C3 DD 77 ED      [19]  380 	ld	-19 (ix),a
   46C6 DD 7E FB      [19]  381 	ld	a,-5 (ix)
   46C9 DD 77 EE      [19]  382 	ld	-18 (ix),a
                            383 ;src/pathfinding.c:87: if(resultado == 0){
   46CC DD 7E F1      [19]  384 	ld	a,-15 (ix)
   46CF B7            [ 4]  385 	or	a, a
   46D0 20 1A         [12]  386 	jr	NZ,00131$
                            387 ;src/pathfinding.c:88: if(dist1 > dist2)
   46D2 DD 7E ED      [19]  388 	ld	a,-19 (ix)
   46D5 DD 96 EF      [19]  389 	sub	a, -17 (ix)
   46D8 DD 7E EE      [19]  390 	ld	a,-18 (ix)
   46DB DD 9E F0      [19]  391 	sbc	a, -16 (ix)
   46DE E2 E3 46      [10]  392 	jp	PO, 00274$
   46E1 EE 80         [ 7]  393 	xor	a, #0x80
   46E3                     394 00274$:
   46E3 F2 F0 46      [10]  395 	jp	P,00134$
                            396 ;src/pathfinding.c:89: resultado = 1;
   46E6 DD 36 F1 01   [19]  397 	ld	-15 (ix),#0x01
   46EA 18 04         [12]  398 	jr	00134$
   46EC                     399 00131$:
                            400 ;src/pathfinding.c:91: resultado = 1;
   46EC DD 36 F1 01   [19]  401 	ld	-15 (ix),#0x01
   46F0                     402 00134$:
                            403 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   46F0 DD 46 04      [19]  404 	ld	b,4 (ix)
   46F3 05            [ 4]  405 	dec	b
   46F4 DD 7E 05      [19]  406 	ld	a,5 (ix)
   46F7 F5            [11]  407 	push	af
   46F8 33            [ 6]  408 	inc	sp
   46F9 C5            [11]  409 	push	bc
   46FA 33            [ 6]  410 	inc	sp
   46FB DD 6E 08      [19]  411 	ld	l,8 (ix)
   46FE DD 66 09      [19]  412 	ld	h,9 (ix)
   4701 E5            [11]  413 	push	hl
   4702 CD 2C 4A      [17]  414 	call	_getTilePtr
   4705 F1            [10]  415 	pop	af
   4706 F1            [10]  416 	pop	af
   4707 4E            [ 7]  417 	ld	c,(hl)
                            418 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4708 DD 7E F4      [19]  419 	ld	a,-12 (ix)
   470B DD 96 F2      [19]  420 	sub	a, -14 (ix)
   470E DD 77 FA      [19]  421 	ld	-6 (ix),a
   4711 DD 7E F5      [19]  422 	ld	a,-11 (ix)
   4714 DD 9E F3      [19]  423 	sbc	a, -13 (ix)
   4717 DD 77 FB      [19]  424 	ld	-5 (ix),a
                            425 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   471A 3E 02         [ 7]  426 	ld	a,#0x02
   471C 91            [ 4]  427 	sub	a, c
   471D 38 70         [12]  428 	jr	C,00146$
                            429 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   471F DD 4E F8      [19]  430 	ld	c,-8 (ix)
   4722 DD 46 F9      [19]  431 	ld	b,-7 (ix)
   4725 0B            [ 6]  432 	dec	bc
   4726 DD 7E FE      [19]  433 	ld	a,-2 (ix)
   4729 91            [ 4]  434 	sub	a, c
   472A 4F            [ 4]  435 	ld	c,a
   472B DD 7E FF      [19]  436 	ld	a,-1 (ix)
   472E 98            [ 4]  437 	sbc	a, b
   472F 47            [ 4]  438 	ld	b,a
   4730 C5            [11]  439 	push	bc
   4731 CD 70 4A      [17]  440 	call	_abs
   4734 E3            [19]  441 	ex	(sp),hl
   4735 DD 6E FA      [19]  442 	ld	l,-6 (ix)
   4738 DD 66 FB      [19]  443 	ld	h,-5 (ix)
   473B E5            [11]  444 	push	hl
   473C CD 70 4A      [17]  445 	call	_abs
   473F F1            [10]  446 	pop	af
   4740 C1            [10]  447 	pop	bc
   4741 09            [11]  448 	add	hl,bc
   4742 D1            [10]  449 	pop	de
   4743 D5            [11]  450 	push	de
   4744 19            [11]  451 	add	hl,de
   4745 DD 75 EB      [19]  452 	ld	-21 (ix),l
   4748 DD 74 EC      [19]  453 	ld	-20 (ix),h
                            454 ;src/pathfinding.c:99: if(resultado == 0){
   474B DD 7E F1      [19]  455 	ld	a,-15 (ix)
   474E B7            [ 4]  456 	or	a, a
   474F 20 1A         [12]  457 	jr	NZ,00143$
                            458 ;src/pathfinding.c:100: if(dist1 >= dist3)
   4751 DD 7E EF      [19]  459 	ld	a,-17 (ix)
   4754 DD 96 EB      [19]  460 	sub	a, -21 (ix)
   4757 DD 7E F0      [19]  461 	ld	a,-16 (ix)
   475A DD 9E EC      [19]  462 	sbc	a, -20 (ix)
   475D E2 62 47      [10]  463 	jp	PO, 00275$
   4760 EE 80         [ 7]  464 	xor	a, #0x80
   4762                     465 00275$:
   4762 FA 8F 47      [10]  466 	jp	M,00146$
                            467 ;src/pathfinding.c:101: resultado = 2;
   4765 DD 36 F1 02   [19]  468 	ld	-15 (ix),#0x02
   4769 18 24         [12]  469 	jr	00146$
   476B                     470 00143$:
                            471 ;src/pathfinding.c:102: }else if(resultado == 1){
   476B DD 7E F1      [19]  472 	ld	a,-15 (ix)
   476E 3D            [ 4]  473 	dec	a
   476F 20 1A         [12]  474 	jr	NZ,00140$
                            475 ;src/pathfinding.c:103: if(dist2 >= dist3)
   4771 DD 7E ED      [19]  476 	ld	a,-19 (ix)
   4774 DD 96 EB      [19]  477 	sub	a, -21 (ix)
   4777 DD 7E EE      [19]  478 	ld	a,-18 (ix)
   477A DD 9E EC      [19]  479 	sbc	a, -20 (ix)
   477D E2 82 47      [10]  480 	jp	PO, 00278$
   4780 EE 80         [ 7]  481 	xor	a, #0x80
   4782                     482 00278$:
   4782 FA 8F 47      [10]  483 	jp	M,00146$
                            484 ;src/pathfinding.c:104: resultado = 2;
   4785 DD 36 F1 02   [19]  485 	ld	-15 (ix),#0x02
   4789 18 04         [12]  486 	jr	00146$
   478B                     487 00140$:
                            488 ;src/pathfinding.c:106: resultado = 2;
   478B DD 36 F1 02   [19]  489 	ld	-15 (ix),#0x02
   478F                     490 00146$:
                            491 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x +1), y) <=2 //&&
   478F DD 46 04      [19]  492 	ld	b,4 (ix)
   4792 04            [ 4]  493 	inc	b
   4793 DD 7E 05      [19]  494 	ld	a,5 (ix)
   4796 F5            [11]  495 	push	af
   4797 33            [ 6]  496 	inc	sp
   4798 C5            [11]  497 	push	bc
   4799 33            [ 6]  498 	inc	sp
   479A DD 6E 08      [19]  499 	ld	l,8 (ix)
   479D DD 66 09      [19]  500 	ld	h,9 (ix)
   47A0 E5            [11]  501 	push	hl
   47A1 CD 2C 4A      [17]  502 	call	_getTilePtr
   47A4 F1            [10]  503 	pop	af
   47A5 F1            [10]  504 	pop	af
   47A6 4E            [ 7]  505 	ld	c,(hl)
   47A7 3E 02         [ 7]  506 	ld	a,#0x02
   47A9 91            [ 4]  507 	sub	a, c
   47AA DA 7A 48      [10]  508 	jp	C,00163$
                            509 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   47AD DD 7E F8      [19]  510 	ld	a,-8 (ix)
   47B0 C6 01         [ 7]  511 	add	a, #0x01
   47B2 DD 77 F6      [19]  512 	ld	-10 (ix),a
   47B5 DD 7E F9      [19]  513 	ld	a,-7 (ix)
   47B8 CE 00         [ 7]  514 	adc	a, #0x00
   47BA DD 77 F7      [19]  515 	ld	-9 (ix),a
   47BD DD 7E FE      [19]  516 	ld	a,-2 (ix)
   47C0 DD 96 F6      [19]  517 	sub	a, -10 (ix)
   47C3 DD 77 F6      [19]  518 	ld	-10 (ix),a
   47C6 DD 7E FF      [19]  519 	ld	a,-1 (ix)
   47C9 DD 9E F7      [19]  520 	sbc	a, -9 (ix)
   47CC DD 77 F7      [19]  521 	ld	-9 (ix),a
   47CF DD 6E F6      [19]  522 	ld	l,-10 (ix)
   47D2 DD 66 F7      [19]  523 	ld	h,-9 (ix)
   47D5 E5            [11]  524 	push	hl
   47D6 CD 70 4A      [17]  525 	call	_abs
   47D9 F1            [10]  526 	pop	af
   47DA DD 74 F7      [19]  527 	ld	-9 (ix),h
   47DD DD 75 F6      [19]  528 	ld	-10 (ix),l
   47E0 DD 6E FA      [19]  529 	ld	l,-6 (ix)
   47E3 DD 66 FB      [19]  530 	ld	h,-5 (ix)
   47E6 E5            [11]  531 	push	hl
   47E7 CD 70 4A      [17]  532 	call	_abs
   47EA F1            [10]  533 	pop	af
   47EB DD 74 FB      [19]  534 	ld	-5 (ix),h
   47EE DD 75 FA      [19]  535 	ld	-6 (ix),l
   47F1 DD 7E F6      [19]  536 	ld	a,-10 (ix)
   47F4 DD 86 FA      [19]  537 	add	a, -6 (ix)
   47F7 DD 77 FA      [19]  538 	ld	-6 (ix),a
   47FA DD 7E F7      [19]  539 	ld	a,-9 (ix)
   47FD DD 8E FB      [19]  540 	adc	a, -5 (ix)
   4800 DD 77 FB      [19]  541 	ld	-5 (ix),a
   4803 DD 7E FA      [19]  542 	ld	a,-6 (ix)
   4806 DD 86 E7      [19]  543 	add	a, -25 (ix)
   4809 DD 77 E9      [19]  544 	ld	-23 (ix),a
   480C DD 7E FB      [19]  545 	ld	a,-5 (ix)
   480F DD 8E E8      [19]  546 	adc	a, -24 (ix)
   4812 DD 77 EA      [19]  547 	ld	-22 (ix),a
                            548 ;src/pathfinding.c:114: if(resultado == 0){
   4815 DD 7E F1      [19]  549 	ld	a,-15 (ix)
   4818 B7            [ 4]  550 	or	a, a
   4819 20 1A         [12]  551 	jr	NZ,00160$
                            552 ;src/pathfinding.c:115: if(dist1 >= dist4)
   481B DD 7E EF      [19]  553 	ld	a,-17 (ix)
   481E DD 96 E9      [19]  554 	sub	a, -23 (ix)
   4821 DD 7E F0      [19]  555 	ld	a,-16 (ix)
   4824 DD 9E EA      [19]  556 	sbc	a, -22 (ix)
   4827 E2 2C 48      [10]  557 	jp	PO, 00279$
   482A EE 80         [ 7]  558 	xor	a, #0x80
   482C                     559 00279$:
   482C FA 7A 48      [10]  560 	jp	M,00163$
                            561 ;src/pathfinding.c:116: resultado = 3;
   482F DD 36 F1 03   [19]  562 	ld	-15 (ix),#0x03
   4833 18 45         [12]  563 	jr	00163$
   4835                     564 00160$:
                            565 ;src/pathfinding.c:117: }else if(resultado == 1){
   4835 DD 7E F1      [19]  566 	ld	a,-15 (ix)
   4838 3D            [ 4]  567 	dec	a
   4839 20 1A         [12]  568 	jr	NZ,00157$
                            569 ;src/pathfinding.c:118: if(dist2 >= dist4)
   483B DD 7E ED      [19]  570 	ld	a,-19 (ix)
   483E DD 96 E9      [19]  571 	sub	a, -23 (ix)
   4841 DD 7E EE      [19]  572 	ld	a,-18 (ix)
   4844 DD 9E EA      [19]  573 	sbc	a, -22 (ix)
   4847 E2 4C 48      [10]  574 	jp	PO, 00282$
   484A EE 80         [ 7]  575 	xor	a, #0x80
   484C                     576 00282$:
   484C FA 7A 48      [10]  577 	jp	M,00163$
                            578 ;src/pathfinding.c:119: resultado = 3;
   484F DD 36 F1 03   [19]  579 	ld	-15 (ix),#0x03
   4853 18 25         [12]  580 	jr	00163$
   4855                     581 00157$:
                            582 ;src/pathfinding.c:120: }else if (resultado == 2){
   4855 DD 7E F1      [19]  583 	ld	a,-15 (ix)
   4858 D6 02         [ 7]  584 	sub	a, #0x02
   485A 20 1A         [12]  585 	jr	NZ,00154$
                            586 ;src/pathfinding.c:121: if(dist3 >= dist4)
   485C DD 7E EB      [19]  587 	ld	a,-21 (ix)
   485F DD 96 E9      [19]  588 	sub	a, -23 (ix)
   4862 DD 7E EC      [19]  589 	ld	a,-20 (ix)
   4865 DD 9E EA      [19]  590 	sbc	a, -22 (ix)
   4868 E2 6D 48      [10]  591 	jp	PO, 00285$
   486B EE 80         [ 7]  592 	xor	a, #0x80
   486D                     593 00285$:
   486D FA 7A 48      [10]  594 	jp	M,00163$
                            595 ;src/pathfinding.c:122: resultado = 3;
   4870 DD 36 F1 03   [19]  596 	ld	-15 (ix),#0x03
   4874 18 04         [12]  597 	jr	00163$
   4876                     598 00154$:
                            599 ;src/pathfinding.c:124: resultado = 3;
   4876 DD 36 F1 03   [19]  600 	ld	-15 (ix),#0x03
   487A                     601 00163$:
                            602 ;src/pathfinding.c:128: return resultado;
   487A DD 6E F1      [19]  603 	ld	l,-15 (ix)
   487D DD F9         [10]  604 	ld	sp, ix
   487F DD E1         [14]  605 	pop	ix
   4881 C9            [10]  606 	ret
                            607 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            608 ;	---------------------------------
                            609 ; Function pathFinding
                            610 ; ---------------------------------
   4882                     611 _pathFinding::
   4882 DD E5         [15]  612 	push	ix
   4884 DD 21 00 00   [14]  613 	ld	ix,#0
   4888 DD 39         [15]  614 	add	ix,sp
   488A 21 F7 FF      [10]  615 	ld	hl,#-9
   488D 39            [11]  616 	add	hl,sp
   488E F9            [ 6]  617 	ld	sp,hl
                            618 ;src/pathfinding.c:144: u8 problem = 0;
   488F 1E 00         [ 7]  619 	ld	e,#0x00
                            620 ;src/pathfinding.c:146: x = s_x;
   4891 DD 7E 04      [19]  621 	ld	a,4 (ix)
   4894 DD 77 FB      [19]  622 	ld	-5 (ix),a
                            623 ;src/pathfinding.c:147: sol_tam = 0;
   4897 21 0C 63      [10]  624 	ld	hl,#_sol_tam + 0
   489A 36 00         [10]  625 	ld	(hl), #0x00
                            626 ;src/pathfinding.c:148: y = s_y;
   489C DD 7E 05      [19]  627 	ld	a,5 (ix)
   489F DD 77 FA      [19]  628 	ld	-6 (ix),a
                            629 ;src/pathfinding.c:150: k = 0;
   48A2 DD 36 F9 00   [19]  630 	ld	-7 (ix),#0x00
                            631 ;src/pathfinding.c:151: aux = 1;
   48A6 DD 36 F8 01   [19]  632 	ld	-8 (ix),#0x01
                            633 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   48AA DD 7E 08      [19]  634 	ld	a,8 (ix)
   48AD DD 77 FC      [19]  635 	ld	-4 (ix),a
   48B0 DD 7E 09      [19]  636 	ld	a,9 (ix)
   48B3 DD 77 FD      [19]  637 	ld	-3 (ix),a
   48B6 DD 7E FC      [19]  638 	ld	a,-4 (ix)
   48B9 C6 E1         [ 7]  639 	add	a, #0xE1
   48BB 4F            [ 4]  640 	ld	c,a
   48BC DD 7E FD      [19]  641 	ld	a,-3 (ix)
   48BF CE 00         [ 7]  642 	adc	a, #0x00
   48C1 47            [ 4]  643 	ld	b,a
   48C2 AF            [ 4]  644 	xor	a, a
   48C3 02            [ 7]  645 	ld	(bc),a
                            646 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   48C4 C5            [11]  647 	push	bc
   48C5 D5            [11]  648 	push	de
   48C6 DD 66 FA      [19]  649 	ld	h,-6 (ix)
   48C9 DD 6E FB      [19]  650 	ld	l,-5 (ix)
   48CC E5            [11]  651 	push	hl
   48CD CD 4C 44      [17]  652 	call	_anyadirALista
   48D0 F1            [10]  653 	pop	af
   48D1 D1            [10]  654 	pop	de
   48D2 C1            [10]  655 	pop	bc
   48D3 DD 75 F7      [19]  656 	ld	-9 (ix),l
                            657 ;src/pathfinding.c:157: while (aux){
   48D6                     658 00114$:
   48D6 DD 7E F8      [19]  659 	ld	a,-8 (ix)
   48D9 B7            [ 4]  660 	or	a, a
   48DA CA DD 49      [10]  661 	jp	Z,00116$
                            662 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   48DD DD 7E 06      [19]  663 	ld	a,6 (ix)
   48E0 DD 96 FB      [19]  664 	sub	a, -5 (ix)
   48E3 20 08         [12]  665 	jr	NZ,00113$
   48E5 DD 7E 07      [19]  666 	ld	a,7 (ix)
   48E8 DD 96 FA      [19]  667 	sub	a, -6 (ix)
   48EB 28 06         [12]  668 	jr	Z,00109$
   48ED                     669 00113$:
   48ED DD 7E F7      [19]  670 	ld	a,-9 (ix)
   48F0 B7            [ 4]  671 	or	a, a
   48F1 20 14         [12]  672 	jr	NZ,00110$
   48F3                     673 00109$:
                            674 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   48F3 DD 7E F7      [19]  675 	ld	a,-9 (ix)
   48F6 B7            [ 4]  676 	or	a, a
   48F7 28 06         [12]  677 	jr	Z,00101$
   48F9 3A 0C 63      [13]  678 	ld	a,(#_sol_tam + 0)
   48FC B7            [ 4]  679 	or	a, a
   48FD 20 02         [12]  680 	jr	NZ,00102$
   48FF                     681 00101$:
                            682 ;src/pathfinding.c:161: problem = 1;
   48FF 1E 01         [ 7]  683 	ld	e,#0x01
   4901                     684 00102$:
                            685 ;src/pathfinding.c:164: aux = 0;
   4901 DD 36 F8 00   [19]  686 	ld	-8 (ix),#0x00
   4905 18 CF         [12]  687 	jr	00114$
   4907                     688 00110$:
                            689 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   4907 C5            [11]  690 	push	bc
   4908 D5            [11]  691 	push	de
   4909 DD 6E 0A      [19]  692 	ld	l,10 (ix)
   490C DD 66 0B      [19]  693 	ld	h,11 (ix)
   490F E5            [11]  694 	push	hl
   4910 DD 66 07      [19]  695 	ld	h,7 (ix)
   4913 DD 6E 06      [19]  696 	ld	l,6 (ix)
   4916 E5            [11]  697 	push	hl
   4917 DD 66 FA      [19]  698 	ld	h,-6 (ix)
   491A DD 6E FB      [19]  699 	ld	l,-5 (ix)
   491D E5            [11]  700 	push	hl
   491E CD 94 44      [17]  701 	call	_adjacentTiles
   4921 F1            [10]  702 	pop	af
   4922 F1            [10]  703 	pop	af
   4923 F1            [10]  704 	pop	af
   4924 D1            [10]  705 	pop	de
   4925 C1            [10]  706 	pop	bc
   4926 55            [ 4]  707 	ld	d,l
                            708 ;src/pathfinding.c:168: switch(movimiento){
   4927 3E 03         [ 7]  709 	ld	a,#0x03
   4929 92            [ 4]  710 	sub	a, d
   492A 38 AA         [12]  711 	jr	C,00114$
                            712 ;src/pathfinding.c:172: k = k+2;
   492C DD 7E F9      [19]  713 	ld	a,-7 (ix)
   492F C6 02         [ 7]  714 	add	a, #0x02
   4931 DD 77 FF      [19]  715 	ld	-1 (ix),a
                            716 ;src/pathfinding.c:168: switch(movimiento){
   4934 D5            [11]  717 	push	de
   4935 5A            [ 4]  718 	ld	e,d
   4936 16 00         [ 7]  719 	ld	d,#0x00
   4938 21 3F 49      [10]  720 	ld	hl,#00169$
   493B 19            [11]  721 	add	hl,de
   493C 19            [11]  722 	add	hl,de
                            723 ;src/pathfinding.c:169: case 0:
   493D D1            [10]  724 	pop	de
   493E E9            [ 4]  725 	jp	(hl)
   493F                     726 00169$:
   493F 18 06         [12]  727 	jr	00104$
   4941 18 2D         [12]  728 	jr	00105$
   4943 18 4E         [12]  729 	jr	00106$
   4945 18 6E         [12]  730 	jr	00107$
   4947                     731 00104$:
                            732 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   4947 DD 7E FA      [19]  733 	ld	a,-6 (ix)
   494A C6 FE         [ 7]  734 	add	a,#0xFE
   494C DD 77 FE      [19]  735 	ld	-2 (ix),a
   494F C5            [11]  736 	push	bc
   4950 D5            [11]  737 	push	de
   4951 DD 66 FE      [19]  738 	ld	h,-2 (ix)
   4954 DD 6E FB      [19]  739 	ld	l,-5 (ix)
   4957 E5            [11]  740 	push	hl
   4958 CD 4C 44      [17]  741 	call	_anyadirALista
   495B F1            [10]  742 	pop	af
   495C D1            [10]  743 	pop	de
   495D C1            [10]  744 	pop	bc
   495E DD 75 F7      [19]  745 	ld	-9 (ix),l
                            746 ;src/pathfinding.c:171: y = y-2;
   4961 DD 56 FE      [19]  747 	ld	d,-2 (ix)
   4964 DD 72 FA      [19]  748 	ld	-6 (ix),d
                            749 ;src/pathfinding.c:172: k = k+2;
   4967 DD 7E FF      [19]  750 	ld	a,-1 (ix)
   496A DD 77 F9      [19]  751 	ld	-7 (ix),a
                            752 ;src/pathfinding.c:173: break;
   496D C3 D6 48      [10]  753 	jp	00114$
                            754 ;src/pathfinding.c:174: case 1:
   4970                     755 00105$:
                            756 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   4970 DD 56 FA      [19]  757 	ld	d,-6 (ix)
   4973 14            [ 4]  758 	inc	d
   4974 14            [ 4]  759 	inc	d
   4975 C5            [11]  760 	push	bc
   4976 D5            [11]  761 	push	de
   4977 D5            [11]  762 	push	de
   4978 33            [ 6]  763 	inc	sp
   4979 DD 7E FB      [19]  764 	ld	a,-5 (ix)
   497C F5            [11]  765 	push	af
   497D 33            [ 6]  766 	inc	sp
   497E CD 4C 44      [17]  767 	call	_anyadirALista
   4981 F1            [10]  768 	pop	af
   4982 D1            [10]  769 	pop	de
   4983 C1            [10]  770 	pop	bc
   4984 DD 75 F7      [19]  771 	ld	-9 (ix),l
                            772 ;src/pathfinding.c:178: y = y+2;
   4987 DD 72 FA      [19]  773 	ld	-6 (ix),d
                            774 ;src/pathfinding.c:179: k = k+2;
   498A DD 7E FF      [19]  775 	ld	a,-1 (ix)
   498D DD 77 F9      [19]  776 	ld	-7 (ix),a
                            777 ;src/pathfinding.c:180: break;
   4990 C3 D6 48      [10]  778 	jp	00114$
                            779 ;src/pathfinding.c:181: case 2:
   4993                     780 00106$:
                            781 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4993 DD 56 FB      [19]  782 	ld	d,-5 (ix)
   4996 15            [ 4]  783 	dec	d
   4997 C5            [11]  784 	push	bc
   4998 D5            [11]  785 	push	de
   4999 DD 7E FA      [19]  786 	ld	a,-6 (ix)
   499C F5            [11]  787 	push	af
   499D 33            [ 6]  788 	inc	sp
   499E D5            [11]  789 	push	de
   499F 33            [ 6]  790 	inc	sp
   49A0 CD 4C 44      [17]  791 	call	_anyadirALista
   49A3 F1            [10]  792 	pop	af
   49A4 D1            [10]  793 	pop	de
   49A5 C1            [10]  794 	pop	bc
   49A6 DD 75 F7      [19]  795 	ld	-9 (ix),l
                            796 ;src/pathfinding.c:185: x = x-1;
   49A9 DD 72 FB      [19]  797 	ld	-5 (ix),d
                            798 ;src/pathfinding.c:186: k = k+2;
   49AC DD 7E FF      [19]  799 	ld	a,-1 (ix)
   49AF DD 77 F9      [19]  800 	ld	-7 (ix),a
                            801 ;src/pathfinding.c:187: break;
   49B2 C3 D6 48      [10]  802 	jp	00114$
                            803 ;src/pathfinding.c:188: case 3:
   49B5                     804 00107$:
                            805 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   49B5 DD 7E FB      [19]  806 	ld	a,-5 (ix)
   49B8 3C            [ 4]  807 	inc	a
   49B9 DD 77 FE      [19]  808 	ld	-2 (ix),a
   49BC C5            [11]  809 	push	bc
   49BD D5            [11]  810 	push	de
   49BE DD 66 FA      [19]  811 	ld	h,-6 (ix)
   49C1 DD 6E FE      [19]  812 	ld	l,-2 (ix)
   49C4 E5            [11]  813 	push	hl
   49C5 CD 4C 44      [17]  814 	call	_anyadirALista
   49C8 F1            [10]  815 	pop	af
   49C9 D1            [10]  816 	pop	de
   49CA C1            [10]  817 	pop	bc
   49CB DD 75 F7      [19]  818 	ld	-9 (ix),l
                            819 ;src/pathfinding.c:190: x = x+1;
   49CE DD 6E FE      [19]  820 	ld	l,-2 (ix)
   49D1 DD 75 FB      [19]  821 	ld	-5 (ix),l
                            822 ;src/pathfinding.c:191: k = k+2;
   49D4 DD 7E FF      [19]  823 	ld	a,-1 (ix)
   49D7 DD 77 F9      [19]  824 	ld	-7 (ix),a
                            825 ;src/pathfinding.c:194: }
   49DA C3 D6 48      [10]  826 	jp	00114$
   49DD                     827 00116$:
                            828 ;src/pathfinding.c:199: if(problem == 0){
   49DD 7B            [ 4]  829 	ld	a,e
   49DE B7            [ 4]  830 	or	a, a
   49DF 20 44         [12]  831 	jr	NZ,00122$
                            832 ;src/pathfinding.c:200: if(sol_tam < CAMINO_TAM){
                            833 ;src/pathfinding.c:201: actual->longitud_camino = sol_tam;
   49E1 3A 0C 63      [13]  834 	ld	a,(#_sol_tam + 0)
   49E4 FE C8         [ 7]  835 	cp	a,#0xC8
   49E6 30 03         [12]  836 	jr	NC,00118$
   49E8 02            [ 7]  837 	ld	(bc),a
   49E9 18 03         [12]  838 	jr	00137$
   49EB                     839 00118$:
                            840 ;src/pathfinding.c:203: actual->longitud_camino = CAMINO_TAM;
   49EB 3E C8         [ 7]  841 	ld	a,#0xC8
   49ED 02            [ 7]  842 	ld	(bc),a
                            843 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   49EE                     844 00137$:
   49EE DD 7E FC      [19]  845 	ld	a,-4 (ix)
   49F1 C6 19         [ 7]  846 	add	a, #0x19
   49F3 DD 77 FC      [19]  847 	ld	-4 (ix),a
   49F6 DD 7E FD      [19]  848 	ld	a,-3 (ix)
   49F9 CE 00         [ 7]  849 	adc	a, #0x00
   49FB DD 77 FD      [19]  850 	ld	-3 (ix),a
   49FE 1E 00         [ 7]  851 	ld	e,#0x00
   4A00                     852 00125$:
   4A00 0A            [ 7]  853 	ld	a,(bc)
   4A01 57            [ 4]  854 	ld	d,a
   4A02 7B            [ 4]  855 	ld	a,e
   4A03 92            [ 4]  856 	sub	a, d
   4A04 30 21         [12]  857 	jr	NC,00127$
                            858 ;src/pathfinding.c:206: actual->camino[i] = camino[i];
   4A06 E5            [11]  859 	push	hl
   4A07 6B            [ 4]  860 	ld	l,e
   4A08 26 00         [ 7]  861 	ld	h,#0x00
   4A0A E5            [11]  862 	push	hl
   4A0B FD E1         [14]  863 	pop	iy
   4A0D E1            [10]  864 	pop	hl
   4A0E C5            [11]  865 	push	bc
   4A0F DD 4E FC      [19]  866 	ld	c,-4 (ix)
   4A12 DD 46 FD      [19]  867 	ld	b,-3 (ix)
   4A15 FD 09         [15]  868 	add	iy, bc
   4A17 C1            [10]  869 	pop	bc
   4A18 21 0D 63      [10]  870 	ld	hl,#_camino
   4A1B 16 00         [ 7]  871 	ld	d,#0x00
   4A1D 19            [11]  872 	add	hl, de
   4A1E 56            [ 7]  873 	ld	d,(hl)
   4A1F FD 72 00      [19]  874 	ld	0 (iy), d
                            875 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   4A22 1C            [ 4]  876 	inc	e
   4A23 18 DB         [12]  877 	jr	00125$
   4A25                     878 00122$:
                            879 ;src/pathfinding.c:210: actual->longitud_camino = 0;
   4A25 AF            [ 4]  880 	xor	a, a
   4A26 02            [ 7]  881 	ld	(bc),a
   4A27                     882 00127$:
   4A27 DD F9         [10]  883 	ld	sp, ix
   4A29 DD E1         [14]  884 	pop	ix
   4A2B C9            [10]  885 	ret
                            886 	.area _CODE
                            887 	.area _INITIALIZER
                            888 	.area _CABS (ABS)
