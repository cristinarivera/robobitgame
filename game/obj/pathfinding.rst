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
   62B7                      26 _sol_tam::
   62B7                      27 	.ds 1
   62B8                      28 _camino::
   62B8                      29 	.ds 200
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
   43F1 3A B7 62      [13]   62 	ld	a,(#_sol_tam + 0)
   43F4 D6 C8         [ 7]   63 	sub	a, #0xC8
   43F6 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   43F8 01 B8 62      [10]   66 	ld	bc,#_camino+0
   43FB 2A B7 62      [16]   67 	ld	hl,(_sol_tam)
   43FE 26 00         [ 7]   68 	ld	h,#0x00
   4400 09            [11]   69 	add	hl,bc
   4401 FD 21 02 00   [14]   70 	ld	iy,#2
   4405 FD 39         [15]   71 	add	iy,sp
   4407 FD 7E 00      [19]   72 	ld	a,0 (iy)
   440A 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   440B 21 B7 62      [10]   75 	ld	hl, #_sol_tam+0
   440E 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   440F 2A B7 62      [16]   78 	ld	hl,(_sol_tam)
   4412 26 00         [ 7]   79 	ld	h,#0x00
   4414 09            [11]   80 	add	hl,bc
   4415 FD 21 03 00   [14]   81 	ld	iy,#3
   4419 FD 39         [15]   82 	add	iy,sp
   441B FD 7E 00      [19]   83 	ld	a,0 (iy)
   441E 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   441F 21 B7 62      [10]   86 	ld	hl, #_sol_tam+0
   4422 34            [11]   87 	inc	(hl)
                             88 ;src/pathfinding.c:18: anyadido = 1;
   4423 0E 01         [ 7]   89 	ld	c,#0x01
   4425                      90 00102$:
                             91 ;src/pathfinding.c:21: return anyadido;
   4425 69            [ 4]   92 	ld	l,c
   4426 C9            [10]   93 	ret
   4427                      94 _bitWeights:
   4427 01 00                95 	.dw #0x0001
   4429 02 00                96 	.dw #0x0002
   442B 04 00                97 	.dw #0x0004
   442D 08 00                98 	.dw #0x0008
   442F 10 00                99 	.dw #0x0010
   4431 20 00               100 	.dw #0x0020
   4433 40 00               101 	.dw #0x0040
   4435 80 00               102 	.dw #0x0080
                            103 ;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
                            104 ;	---------------------------------
                            105 ; Function adjacentTiles
                            106 ; ---------------------------------
   4437                     107 _adjacentTiles::
   4437 DD E5         [15]  108 	push	ix
   4439 DD 21 00 00   [14]  109 	ld	ix,#0
   443D DD 39         [15]  110 	add	ix,sp
   443F 21 E1 FF      [10]  111 	ld	hl,#-31
   4442 39            [11]  112 	add	hl,sp
   4443 F9            [ 6]  113 	ld	sp,hl
                            114 ;src/pathfinding.c:26: u8 resultado = 4;
   4444 DD 36 F1 04   [19]  115 	ld	-15 (ix),#0x04
                            116 ;src/pathfinding.c:28: i16 dist1 = 0;
   4448 DD 36 EF 00   [19]  117 	ld	-17 (ix),#0x00
   444C DD 36 F0 00   [19]  118 	ld	-16 (ix),#0x00
                            119 ;src/pathfinding.c:29: i16 dist2 = 0;
   4450 DD 36 ED 00   [19]  120 	ld	-19 (ix),#0x00
   4454 DD 36 EE 00   [19]  121 	ld	-18 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   4458 DD 36 EB 00   [19]  123 	ld	-21 (ix),#0x00
   445C DD 36 EC 00   [19]  124 	ld	-20 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   4460 DD 36 E7 00   [19]  126 	ld	-25 (ix),#0x00
   4464 DD 36 E8 00   [19]  127 	ld	-24 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   4468 21 00 00      [10]  129 	ld	hl,#0x0000
   446B E3            [19]  130 	ex	(sp), hl
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   446C DD 36 E3 00   [19]  132 	ld	-29 (ix),#0x00
   4470 DD 36 E4 00   [19]  133 	ld	-28 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   4474 DD 36 E5 00   [19]  135 	ld	-27 (ix),#0x00
   4478 DD 36 E6 00   [19]  136 	ld	-26 (ix),#0x00
                            137 ;src/pathfinding.c:43: if(y < f_y)
   447C DD 7E 05      [19]  138 	ld	a,5 (ix)
   447F DD 96 07      [19]  139 	sub	a, 7 (ix)
   4482 3E 00         [ 7]  140 	ld	a,#0x00
   4484 17            [ 4]  141 	rla
   4485 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   4486 DD 7E 04      [19]  144 	ld	a,4 (ix)
   4489 DD 96 06      [19]  145 	sub	a, 6 (ix)
   448C 20 20         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   448E 79            [ 4]  148 	ld	a,c
   448F B7            [ 4]  149 	or	a, a
   4490 28 08         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   4492 DD 36 E5 FF   [19]  152 	ld	-27 (ix),#0xFF
   4496 DD 36 E6 FF   [19]  153 	ld	-26 (ix),#0xFF
   449A                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   449A DD 7E 07      [19]  156 	ld	a,7 (ix)
   449D DD 96 05      [19]  157 	sub	a, 5 (ix)
   44A0 D2 22 45      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   44A3 DD 36 E3 FF   [19]  160 	ld	-29 (ix),#0xFF
   44A7 DD 36 E4 FF   [19]  161 	ld	-28 (ix),#0xFF
   44AB C3 22 45      [10]  162 	jp	00125$
   44AE                     163 00124$:
                            164 ;src/pathfinding.c:51: if(x < f_x)
   44AE DD 7E 04      [19]  165 	ld	a,4 (ix)
   44B1 DD 96 06      [19]  166 	sub	a, 6 (ix)
   44B4 3E 00         [ 7]  167 	ld	a,#0x00
   44B6 17            [ 4]  168 	rla
   44B7 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   44B8 DD 7E 06      [19]  171 	ld	a,6 (ix)
   44BB DD 96 04      [19]  172 	sub	a, 4 (ix)
   44BE 3E 00         [ 7]  173 	ld	a,#0x00
   44C0 17            [ 4]  174 	rla
   44C1 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   44C2 DD 7E 05      [19]  177 	ld	a,5 (ix)
   44C5 DD 96 07      [19]  178 	sub	a, 7 (ix)
   44C8 20 16         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   44CA 78            [ 4]  181 	ld	a,b
   44CB B7            [ 4]  182 	or	a, a
   44CC 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
   44CE DD 36 E7 FF   [19]  185 	ld	-25 (ix),#0xFF
   44D2 DD 36 E8 FF   [19]  186 	ld	-24 (ix),#0xFF
   44D6                     187 00106$:
                            188 ;src/pathfinding.c:53: if(x > f_x)
   44D6 7B            [ 4]  189 	ld	a,e
   44D7 B7            [ 4]  190 	or	a, a
   44D8 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   44DA 21 FF FF      [10]  193 	ld	hl,#0xFFFF
   44DD E3            [19]  194 	ex	(sp), hl
   44DE 18 42         [12]  195 	jr	00125$
   44E0                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   44E0 78            [ 4]  198 	ld	a,b
   44E1 B7            [ 4]  199 	or	a, a
   44E2 28 20         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   44E4 79            [ 4]  202 	ld	a,c
   44E5 B7            [ 4]  203 	or	a, a
   44E6 28 0A         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
   44E8 DD 36 E5 FF   [19]  206 	ld	-27 (ix),#0xFF
   44EC DD 36 E6 FF   [19]  207 	ld	-26 (ix),#0xFF
   44F0 18 08         [12]  208 	jr	00111$
   44F2                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   44F2 DD 36 E3 FF   [19]  211 	ld	-29 (ix),#0xFF
   44F6 DD 36 E4 FF   [19]  212 	ld	-28 (ix),#0xFF
   44FA                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   44FA DD 36 E7 FF   [19]  215 	ld	-25 (ix),#0xFF
   44FE DD 36 E8 FF   [19]  216 	ld	-24 (ix),#0xFF
   4502 18 1E         [12]  217 	jr	00125$
   4504                     218 00118$:
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   4504 7B            [ 4]  220 	ld	a,e
   4505 B7            [ 4]  221 	or	a, a
   4506 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   4508 79            [ 4]  224 	ld	a,c
   4509 B7            [ 4]  225 	or	a, a
   450A 28 0A         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
   450C DD 36 E5 FF   [19]  228 	ld	-27 (ix),#0xFF
   4510 DD 36 E6 FF   [19]  229 	ld	-26 (ix),#0xFF
   4514 18 08         [12]  230 	jr	00114$
   4516                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4516 DD 36 E3 FF   [19]  233 	ld	-29 (ix),#0xFF
   451A DD 36 E4 FF   [19]  234 	ld	-28 (ix),#0xFF
   451E                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   451E 21 FF FF      [10]  237 	ld	hl,#0xFFFF
   4521 E3            [19]  238 	ex	(sp), hl
   4522                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   4522 DD 46 05      [19]  241 	ld	b,5 (ix)
   4525 05            [ 4]  242 	dec	b
   4526 05            [ 4]  243 	dec	b
   4527 C5            [11]  244 	push	bc
   4528 33            [ 6]  245 	inc	sp
   4529 DD 7E 04      [19]  246 	ld	a,4 (ix)
   452C F5            [11]  247 	push	af
   452D 33            [ 6]  248 	inc	sp
   452E DD 6E 08      [19]  249 	ld	l,8 (ix)
   4531 DD 66 09      [19]  250 	ld	h,9 (ix)
   4534 E5            [11]  251 	push	hl
   4535 CD D8 49      [17]  252 	call	_getTilePtr
   4538 F1            [10]  253 	pop	af
   4539 F1            [10]  254 	pop	af
   453A 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   453B DD 7E 06      [19]  257 	ld	a,6 (ix)
   453E DD 77 F4      [19]  258 	ld	-12 (ix),a
   4541 DD 36 F5 00   [19]  259 	ld	-11 (ix),#0x00
   4545 DD 7E 04      [19]  260 	ld	a,4 (ix)
   4548 DD 77 FE      [19]  261 	ld	-2 (ix),a
   454B DD 36 FF 00   [19]  262 	ld	-1 (ix),#0x00
   454F DD 7E 07      [19]  263 	ld	a,7 (ix)
   4552 DD 77 F2      [19]  264 	ld	-14 (ix),a
   4555 DD 36 F3 00   [19]  265 	ld	-13 (ix),#0x00
   4559 DD 7E 05      [19]  266 	ld	a,5 (ix)
   455C DD 77 F8      [19]  267 	ld	-8 (ix),a
   455F DD 36 F9 00   [19]  268 	ld	-7 (ix),#0x00
   4563 DD 7E F4      [19]  269 	ld	a,-12 (ix)
   4566 DD 96 FE      [19]  270 	sub	a, -2 (ix)
   4569 DD 77 FC      [19]  271 	ld	-4 (ix),a
   456C DD 7E F5      [19]  272 	ld	a,-11 (ix)
   456F DD 9E FF      [19]  273 	sbc	a, -1 (ix)
   4572 DD 77 FD      [19]  274 	ld	-3 (ix),a
                            275 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   4575 3E 02         [ 7]  276 	ld	a,#0x02
   4577 91            [ 4]  277 	sub	a, c
   4578 38 62         [12]  278 	jr	C,00127$
                            279 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   457A DD 6E FC      [19]  280 	ld	l,-4 (ix)
   457D DD 66 FD      [19]  281 	ld	h,-3 (ix)
   4580 E5            [11]  282 	push	hl
   4581 CD 1C 4A      [17]  283 	call	_abs
   4584 F1            [10]  284 	pop	af
   4585 DD 74 F7      [19]  285 	ld	-9 (ix),h
   4588 DD 75 F6      [19]  286 	ld	-10 (ix),l
   458B DD 4E F8      [19]  287 	ld	c,-8 (ix)
   458E DD 46 F9      [19]  288 	ld	b,-7 (ix)
   4591 0B            [ 6]  289 	dec	bc
   4592 0B            [ 6]  290 	dec	bc
   4593 DD 7E F2      [19]  291 	ld	a,-14 (ix)
   4596 91            [ 4]  292 	sub	a, c
   4597 4F            [ 4]  293 	ld	c,a
   4598 DD 7E F3      [19]  294 	ld	a,-13 (ix)
   459B 98            [ 4]  295 	sbc	a, b
   459C 47            [ 4]  296 	ld	b,a
   459D C5            [11]  297 	push	bc
   459E CD 1C 4A      [17]  298 	call	_abs
   45A1 F1            [10]  299 	pop	af
   45A2 DD 74 FB      [19]  300 	ld	-5 (ix),h
   45A5 DD 75 FA      [19]  301 	ld	-6 (ix),l
   45A8 DD 7E F6      [19]  302 	ld	a,-10 (ix)
   45AB DD 86 FA      [19]  303 	add	a, -6 (ix)
   45AE DD 77 FA      [19]  304 	ld	-6 (ix),a
   45B1 DD 7E F7      [19]  305 	ld	a,-9 (ix)
   45B4 DD 8E FB      [19]  306 	adc	a, -5 (ix)
   45B7 DD 77 FB      [19]  307 	ld	-5 (ix),a
   45BA DD 7E FA      [19]  308 	ld	a,-6 (ix)
   45BD DD 86 E3      [19]  309 	add	a, -29 (ix)
   45C0 DD 77 FA      [19]  310 	ld	-6 (ix),a
   45C3 DD 7E FB      [19]  311 	ld	a,-5 (ix)
   45C6 DD 8E E4      [19]  312 	adc	a, -28 (ix)
   45C9 DD 77 FB      [19]  313 	ld	-5 (ix),a
   45CC DD 7E FA      [19]  314 	ld	a,-6 (ix)
   45CF DD 77 EF      [19]  315 	ld	-17 (ix),a
   45D2 DD 7E FB      [19]  316 	ld	a,-5 (ix)
   45D5 DD 77 F0      [19]  317 	ld	-16 (ix),a
                            318 ;src/pathfinding.c:81: resultado = 0;
   45D8 DD 36 F1 00   [19]  319 	ld	-15 (ix),#0x00
   45DC                     320 00127$:
                            321 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, (y + G_ENEMY_H)) <=2 /*&&
   45DC DD 7E 05      [19]  322 	ld	a,5 (ix)
   45DF C6 16         [ 7]  323 	add	a, #0x16
   45E1 47            [ 4]  324 	ld	b,a
   45E2 C5            [11]  325 	push	bc
   45E3 33            [ 6]  326 	inc	sp
   45E4 DD 7E 04      [19]  327 	ld	a,4 (ix)
   45E7 F5            [11]  328 	push	af
   45E8 33            [ 6]  329 	inc	sp
   45E9 DD 6E 08      [19]  330 	ld	l,8 (ix)
   45EC DD 66 09      [19]  331 	ld	h,9 (ix)
   45EF E5            [11]  332 	push	hl
   45F0 CD D8 49      [17]  333 	call	_getTilePtr
   45F3 F1            [10]  334 	pop	af
   45F4 F1            [10]  335 	pop	af
   45F5 4E            [ 7]  336 	ld	c,(hl)
   45F6 3E 02         [ 7]  337 	ld	a,#0x02
   45F8 91            [ 4]  338 	sub	a, c
   45F9 DA 94 46      [10]  339 	jp	C,00134$
                            340 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   45FC DD 6E FC      [19]  341 	ld	l,-4 (ix)
   45FF DD 66 FD      [19]  342 	ld	h,-3 (ix)
   4602 E5            [11]  343 	push	hl
   4603 CD 1C 4A      [17]  344 	call	_abs
   4606 F1            [10]  345 	pop	af
   4607 DD 74 FB      [19]  346 	ld	-5 (ix),h
   460A DD 75 FA      [19]  347 	ld	-6 (ix),l
   460D DD 7E F8      [19]  348 	ld	a,-8 (ix)
   4610 C6 02         [ 7]  349 	add	a, #0x02
   4612 DD 77 F6      [19]  350 	ld	-10 (ix),a
   4615 DD 7E F9      [19]  351 	ld	a,-7 (ix)
   4618 CE 00         [ 7]  352 	adc	a, #0x00
   461A DD 77 F7      [19]  353 	ld	-9 (ix),a
   461D DD 7E F2      [19]  354 	ld	a,-14 (ix)
   4620 DD 96 F6      [19]  355 	sub	a, -10 (ix)
   4623 DD 77 F6      [19]  356 	ld	-10 (ix),a
   4626 DD 7E F3      [19]  357 	ld	a,-13 (ix)
   4629 DD 9E F7      [19]  358 	sbc	a, -9 (ix)
   462C DD 77 F7      [19]  359 	ld	-9 (ix),a
   462F DD 6E F6      [19]  360 	ld	l,-10 (ix)
   4632 DD 66 F7      [19]  361 	ld	h,-9 (ix)
   4635 E5            [11]  362 	push	hl
   4636 CD 1C 4A      [17]  363 	call	_abs
   4639 F1            [10]  364 	pop	af
   463A DD 74 F7      [19]  365 	ld	-9 (ix),h
   463D DD 75 F6      [19]  366 	ld	-10 (ix),l
   4640 DD 7E FA      [19]  367 	ld	a,-6 (ix)
   4643 DD 86 F6      [19]  368 	add	a, -10 (ix)
   4646 DD 77 FA      [19]  369 	ld	-6 (ix),a
   4649 DD 7E FB      [19]  370 	ld	a,-5 (ix)
   464C DD 8E F7      [19]  371 	adc	a, -9 (ix)
   464F DD 77 FB      [19]  372 	ld	-5 (ix),a
   4652 DD 7E E5      [19]  373 	ld	a,-27 (ix)
   4655 DD 86 FA      [19]  374 	add	a, -6 (ix)
   4658 DD 77 FA      [19]  375 	ld	-6 (ix),a
   465B DD 7E E6      [19]  376 	ld	a,-26 (ix)
   465E DD 8E FB      [19]  377 	adc	a, -5 (ix)
   4661 DD 77 FB      [19]  378 	ld	-5 (ix),a
   4664 DD 7E FA      [19]  379 	ld	a,-6 (ix)
   4667 DD 77 ED      [19]  380 	ld	-19 (ix),a
   466A DD 7E FB      [19]  381 	ld	a,-5 (ix)
   466D DD 77 EE      [19]  382 	ld	-18 (ix),a
                            383 ;src/pathfinding.c:87: if(resultado == 0){
   4670 DD 7E F1      [19]  384 	ld	a,-15 (ix)
   4673 B7            [ 4]  385 	or	a, a
   4674 20 1A         [12]  386 	jr	NZ,00131$
                            387 ;src/pathfinding.c:88: if(dist1 > dist2)
   4676 DD 7E ED      [19]  388 	ld	a,-19 (ix)
   4679 DD 96 EF      [19]  389 	sub	a, -17 (ix)
   467C DD 7E EE      [19]  390 	ld	a,-18 (ix)
   467F DD 9E F0      [19]  391 	sbc	a, -16 (ix)
   4682 E2 87 46      [10]  392 	jp	PO, 00274$
   4685 EE 80         [ 7]  393 	xor	a, #0x80
   4687                     394 00274$:
   4687 F2 94 46      [10]  395 	jp	P,00134$
                            396 ;src/pathfinding.c:89: resultado = 1;
   468A DD 36 F1 01   [19]  397 	ld	-15 (ix),#0x01
   468E 18 04         [12]  398 	jr	00134$
   4690                     399 00131$:
                            400 ;src/pathfinding.c:91: resultado = 1;
   4690 DD 36 F1 01   [19]  401 	ld	-15 (ix),#0x01
   4694                     402 00134$:
                            403 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   4694 DD 46 04      [19]  404 	ld	b,4 (ix)
   4697 05            [ 4]  405 	dec	b
   4698 DD 7E 05      [19]  406 	ld	a,5 (ix)
   469B F5            [11]  407 	push	af
   469C 33            [ 6]  408 	inc	sp
   469D C5            [11]  409 	push	bc
   469E 33            [ 6]  410 	inc	sp
   469F DD 6E 08      [19]  411 	ld	l,8 (ix)
   46A2 DD 66 09      [19]  412 	ld	h,9 (ix)
   46A5 E5            [11]  413 	push	hl
   46A6 CD D8 49      [17]  414 	call	_getTilePtr
   46A9 F1            [10]  415 	pop	af
   46AA F1            [10]  416 	pop	af
   46AB 4E            [ 7]  417 	ld	c,(hl)
                            418 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   46AC DD 7E F2      [19]  419 	ld	a,-14 (ix)
   46AF DD 96 F8      [19]  420 	sub	a, -8 (ix)
   46B2 DD 77 FA      [19]  421 	ld	-6 (ix),a
   46B5 DD 7E F3      [19]  422 	ld	a,-13 (ix)
   46B8 DD 9E F9      [19]  423 	sbc	a, -7 (ix)
   46BB DD 77 FB      [19]  424 	ld	-5 (ix),a
                            425 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   46BE 3E 02         [ 7]  426 	ld	a,#0x02
   46C0 91            [ 4]  427 	sub	a, c
   46C1 38 70         [12]  428 	jr	C,00146$
                            429 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   46C3 DD 4E FE      [19]  430 	ld	c,-2 (ix)
   46C6 DD 46 FF      [19]  431 	ld	b,-1 (ix)
   46C9 0B            [ 6]  432 	dec	bc
   46CA DD 7E F4      [19]  433 	ld	a,-12 (ix)
   46CD 91            [ 4]  434 	sub	a, c
   46CE 4F            [ 4]  435 	ld	c,a
   46CF DD 7E F5      [19]  436 	ld	a,-11 (ix)
   46D2 98            [ 4]  437 	sbc	a, b
   46D3 47            [ 4]  438 	ld	b,a
   46D4 C5            [11]  439 	push	bc
   46D5 CD 1C 4A      [17]  440 	call	_abs
   46D8 E3            [19]  441 	ex	(sp),hl
   46D9 DD 6E FA      [19]  442 	ld	l,-6 (ix)
   46DC DD 66 FB      [19]  443 	ld	h,-5 (ix)
   46DF E5            [11]  444 	push	hl
   46E0 CD 1C 4A      [17]  445 	call	_abs
   46E3 F1            [10]  446 	pop	af
   46E4 C1            [10]  447 	pop	bc
   46E5 09            [11]  448 	add	hl,bc
   46E6 D1            [10]  449 	pop	de
   46E7 D5            [11]  450 	push	de
   46E8 19            [11]  451 	add	hl,de
   46E9 DD 75 EB      [19]  452 	ld	-21 (ix),l
   46EC DD 74 EC      [19]  453 	ld	-20 (ix),h
                            454 ;src/pathfinding.c:99: if(resultado == 0){
   46EF DD 7E F1      [19]  455 	ld	a,-15 (ix)
   46F2 B7            [ 4]  456 	or	a, a
   46F3 20 1A         [12]  457 	jr	NZ,00143$
                            458 ;src/pathfinding.c:100: if(dist1 >= dist3)
   46F5 DD 7E EF      [19]  459 	ld	a,-17 (ix)
   46F8 DD 96 EB      [19]  460 	sub	a, -21 (ix)
   46FB DD 7E F0      [19]  461 	ld	a,-16 (ix)
   46FE DD 9E EC      [19]  462 	sbc	a, -20 (ix)
   4701 E2 06 47      [10]  463 	jp	PO, 00275$
   4704 EE 80         [ 7]  464 	xor	a, #0x80
   4706                     465 00275$:
   4706 FA 33 47      [10]  466 	jp	M,00146$
                            467 ;src/pathfinding.c:101: resultado = 2;
   4709 DD 36 F1 02   [19]  468 	ld	-15 (ix),#0x02
   470D 18 24         [12]  469 	jr	00146$
   470F                     470 00143$:
                            471 ;src/pathfinding.c:102: }else if(resultado == 1){
   470F DD 7E F1      [19]  472 	ld	a,-15 (ix)
   4712 3D            [ 4]  473 	dec	a
   4713 20 1A         [12]  474 	jr	NZ,00140$
                            475 ;src/pathfinding.c:103: if(dist2 >= dist3)
   4715 DD 7E ED      [19]  476 	ld	a,-19 (ix)
   4718 DD 96 EB      [19]  477 	sub	a, -21 (ix)
   471B DD 7E EE      [19]  478 	ld	a,-18 (ix)
   471E DD 9E EC      [19]  479 	sbc	a, -20 (ix)
   4721 E2 26 47      [10]  480 	jp	PO, 00278$
   4724 EE 80         [ 7]  481 	xor	a, #0x80
   4726                     482 00278$:
   4726 FA 33 47      [10]  483 	jp	M,00146$
                            484 ;src/pathfinding.c:104: resultado = 2;
   4729 DD 36 F1 02   [19]  485 	ld	-15 (ix),#0x02
   472D 18 04         [12]  486 	jr	00146$
   472F                     487 00140$:
                            488 ;src/pathfinding.c:106: resultado = 2;
   472F DD 36 F1 02   [19]  489 	ld	-15 (ix),#0x02
   4733                     490 00146$:
                            491 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x + G_ENEMY_W +1), y) <=2 //&&
   4733 DD 7E 04      [19]  492 	ld	a,4 (ix)
   4736 C6 05         [ 7]  493 	add	a, #0x05
   4738 47            [ 4]  494 	ld	b,a
   4739 DD 7E 05      [19]  495 	ld	a,5 (ix)
   473C F5            [11]  496 	push	af
   473D 33            [ 6]  497 	inc	sp
   473E C5            [11]  498 	push	bc
   473F 33            [ 6]  499 	inc	sp
   4740 DD 6E 08      [19]  500 	ld	l,8 (ix)
   4743 DD 66 09      [19]  501 	ld	h,9 (ix)
   4746 E5            [11]  502 	push	hl
   4747 CD D8 49      [17]  503 	call	_getTilePtr
   474A F1            [10]  504 	pop	af
   474B F1            [10]  505 	pop	af
   474C 4E            [ 7]  506 	ld	c,(hl)
   474D 3E 02         [ 7]  507 	ld	a,#0x02
   474F 91            [ 4]  508 	sub	a, c
   4750 DA 20 48      [10]  509 	jp	C,00163$
                            510 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   4753 DD 7E FE      [19]  511 	ld	a,-2 (ix)
   4756 C6 01         [ 7]  512 	add	a, #0x01
   4758 DD 77 F6      [19]  513 	ld	-10 (ix),a
   475B DD 7E FF      [19]  514 	ld	a,-1 (ix)
   475E CE 00         [ 7]  515 	adc	a, #0x00
   4760 DD 77 F7      [19]  516 	ld	-9 (ix),a
   4763 DD 7E F4      [19]  517 	ld	a,-12 (ix)
   4766 DD 96 F6      [19]  518 	sub	a, -10 (ix)
   4769 DD 77 F6      [19]  519 	ld	-10 (ix),a
   476C DD 7E F5      [19]  520 	ld	a,-11 (ix)
   476F DD 9E F7      [19]  521 	sbc	a, -9 (ix)
   4772 DD 77 F7      [19]  522 	ld	-9 (ix),a
   4775 DD 6E F6      [19]  523 	ld	l,-10 (ix)
   4778 DD 66 F7      [19]  524 	ld	h,-9 (ix)
   477B E5            [11]  525 	push	hl
   477C CD 1C 4A      [17]  526 	call	_abs
   477F F1            [10]  527 	pop	af
   4780 DD 74 F7      [19]  528 	ld	-9 (ix),h
   4783 DD 75 F6      [19]  529 	ld	-10 (ix),l
   4786 DD 6E FA      [19]  530 	ld	l,-6 (ix)
   4789 DD 66 FB      [19]  531 	ld	h,-5 (ix)
   478C E5            [11]  532 	push	hl
   478D CD 1C 4A      [17]  533 	call	_abs
   4790 F1            [10]  534 	pop	af
   4791 DD 74 FB      [19]  535 	ld	-5 (ix),h
   4794 DD 75 FA      [19]  536 	ld	-6 (ix),l
   4797 DD 7E F6      [19]  537 	ld	a,-10 (ix)
   479A DD 86 FA      [19]  538 	add	a, -6 (ix)
   479D DD 77 FA      [19]  539 	ld	-6 (ix),a
   47A0 DD 7E F7      [19]  540 	ld	a,-9 (ix)
   47A3 DD 8E FB      [19]  541 	adc	a, -5 (ix)
   47A6 DD 77 FB      [19]  542 	ld	-5 (ix),a
   47A9 DD 7E FA      [19]  543 	ld	a,-6 (ix)
   47AC DD 86 E7      [19]  544 	add	a, -25 (ix)
   47AF DD 77 E9      [19]  545 	ld	-23 (ix),a
   47B2 DD 7E FB      [19]  546 	ld	a,-5 (ix)
   47B5 DD 8E E8      [19]  547 	adc	a, -24 (ix)
   47B8 DD 77 EA      [19]  548 	ld	-22 (ix),a
                            549 ;src/pathfinding.c:114: if(resultado == 0){
   47BB DD 7E F1      [19]  550 	ld	a,-15 (ix)
   47BE B7            [ 4]  551 	or	a, a
   47BF 20 1A         [12]  552 	jr	NZ,00160$
                            553 ;src/pathfinding.c:115: if(dist1 >= dist4)
   47C1 DD 7E EF      [19]  554 	ld	a,-17 (ix)
   47C4 DD 96 E9      [19]  555 	sub	a, -23 (ix)
   47C7 DD 7E F0      [19]  556 	ld	a,-16 (ix)
   47CA DD 9E EA      [19]  557 	sbc	a, -22 (ix)
   47CD E2 D2 47      [10]  558 	jp	PO, 00279$
   47D0 EE 80         [ 7]  559 	xor	a, #0x80
   47D2                     560 00279$:
   47D2 FA 20 48      [10]  561 	jp	M,00163$
                            562 ;src/pathfinding.c:116: resultado = 3;
   47D5 DD 36 F1 03   [19]  563 	ld	-15 (ix),#0x03
   47D9 18 45         [12]  564 	jr	00163$
   47DB                     565 00160$:
                            566 ;src/pathfinding.c:117: }else if(resultado == 1){
   47DB DD 7E F1      [19]  567 	ld	a,-15 (ix)
   47DE 3D            [ 4]  568 	dec	a
   47DF 20 1A         [12]  569 	jr	NZ,00157$
                            570 ;src/pathfinding.c:118: if(dist2 >= dist4)
   47E1 DD 7E ED      [19]  571 	ld	a,-19 (ix)
   47E4 DD 96 E9      [19]  572 	sub	a, -23 (ix)
   47E7 DD 7E EE      [19]  573 	ld	a,-18 (ix)
   47EA DD 9E EA      [19]  574 	sbc	a, -22 (ix)
   47ED E2 F2 47      [10]  575 	jp	PO, 00282$
   47F0 EE 80         [ 7]  576 	xor	a, #0x80
   47F2                     577 00282$:
   47F2 FA 20 48      [10]  578 	jp	M,00163$
                            579 ;src/pathfinding.c:119: resultado = 3;
   47F5 DD 36 F1 03   [19]  580 	ld	-15 (ix),#0x03
   47F9 18 25         [12]  581 	jr	00163$
   47FB                     582 00157$:
                            583 ;src/pathfinding.c:120: }else if (resultado == 2){
   47FB DD 7E F1      [19]  584 	ld	a,-15 (ix)
   47FE D6 02         [ 7]  585 	sub	a, #0x02
   4800 20 1A         [12]  586 	jr	NZ,00154$
                            587 ;src/pathfinding.c:121: if(dist3 >= dist4)
   4802 DD 7E EB      [19]  588 	ld	a,-21 (ix)
   4805 DD 96 E9      [19]  589 	sub	a, -23 (ix)
   4808 DD 7E EC      [19]  590 	ld	a,-20 (ix)
   480B DD 9E EA      [19]  591 	sbc	a, -22 (ix)
   480E E2 13 48      [10]  592 	jp	PO, 00285$
   4811 EE 80         [ 7]  593 	xor	a, #0x80
   4813                     594 00285$:
   4813 FA 20 48      [10]  595 	jp	M,00163$
                            596 ;src/pathfinding.c:122: resultado = 3;
   4816 DD 36 F1 03   [19]  597 	ld	-15 (ix),#0x03
   481A 18 04         [12]  598 	jr	00163$
   481C                     599 00154$:
                            600 ;src/pathfinding.c:124: resultado = 3;
   481C DD 36 F1 03   [19]  601 	ld	-15 (ix),#0x03
   4820                     602 00163$:
                            603 ;src/pathfinding.c:128: return resultado;
   4820 DD 6E F1      [19]  604 	ld	l,-15 (ix)
   4823 DD F9         [10]  605 	ld	sp, ix
   4825 DD E1         [14]  606 	pop	ix
   4827 C9            [10]  607 	ret
                            608 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            609 ;	---------------------------------
                            610 ; Function pathFinding
                            611 ; ---------------------------------
   4828                     612 _pathFinding::
   4828 DD E5         [15]  613 	push	ix
   482A DD 21 00 00   [14]  614 	ld	ix,#0
   482E DD 39         [15]  615 	add	ix,sp
   4830 21 F7 FF      [10]  616 	ld	hl,#-9
   4833 39            [11]  617 	add	hl,sp
   4834 F9            [ 6]  618 	ld	sp,hl
                            619 ;src/pathfinding.c:144: u8 problem = 0;
   4835 1E 00         [ 7]  620 	ld	e,#0x00
                            621 ;src/pathfinding.c:146: x = s_x;
   4837 DD 7E 04      [19]  622 	ld	a,4 (ix)
   483A DD 77 F7      [19]  623 	ld	-9 (ix),a
                            624 ;src/pathfinding.c:147: sol_tam = 0;
   483D 21 B7 62      [10]  625 	ld	hl,#_sol_tam + 0
   4840 36 00         [10]  626 	ld	(hl), #0x00
                            627 ;src/pathfinding.c:148: y = s_y;
   4842 DD 7E 05      [19]  628 	ld	a,5 (ix)
   4845 DD 77 F8      [19]  629 	ld	-8 (ix),a
                            630 ;src/pathfinding.c:150: k = 0;
   4848 DD 36 F9 00   [19]  631 	ld	-7 (ix),#0x00
                            632 ;src/pathfinding.c:151: aux = 1;
   484C DD 36 FB 01   [19]  633 	ld	-5 (ix),#0x01
                            634 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   4850 DD 7E 08      [19]  635 	ld	a,8 (ix)
   4853 DD 77 FC      [19]  636 	ld	-4 (ix),a
   4856 DD 7E 09      [19]  637 	ld	a,9 (ix)
   4859 DD 77 FD      [19]  638 	ld	-3 (ix),a
   485C DD 7E FC      [19]  639 	ld	a,-4 (ix)
   485F C6 E1         [ 7]  640 	add	a, #0xE1
   4861 4F            [ 4]  641 	ld	c,a
   4862 DD 7E FD      [19]  642 	ld	a,-3 (ix)
   4865 CE 00         [ 7]  643 	adc	a, #0x00
   4867 47            [ 4]  644 	ld	b,a
   4868 AF            [ 4]  645 	xor	a, a
   4869 02            [ 7]  646 	ld	(bc),a
                            647 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   486A C5            [11]  648 	push	bc
   486B D5            [11]  649 	push	de
   486C DD 66 F8      [19]  650 	ld	h,-8 (ix)
   486F DD 6E F7      [19]  651 	ld	l,-9 (ix)
   4872 E5            [11]  652 	push	hl
   4873 CD EF 43      [17]  653 	call	_anyadirALista
   4876 F1            [10]  654 	pop	af
   4877 D1            [10]  655 	pop	de
   4878 C1            [10]  656 	pop	bc
   4879 DD 75 FA      [19]  657 	ld	-6 (ix),l
                            658 ;src/pathfinding.c:157: while (aux){
   487C                     659 00115$:
   487C DD 7E FB      [19]  660 	ld	a,-5 (ix)
   487F B7            [ 4]  661 	or	a, a
   4880 CA 89 49      [10]  662 	jp	Z,00117$
                            663 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   4883 DD 7E 06      [19]  664 	ld	a,6 (ix)
   4886 DD 96 F7      [19]  665 	sub	a, -9 (ix)
   4889 20 08         [12]  666 	jr	NZ,00113$
   488B DD 7E 07      [19]  667 	ld	a,7 (ix)
   488E DD 96 F8      [19]  668 	sub	a, -8 (ix)
   4891 28 0C         [12]  669 	jr	Z,00109$
   4893                     670 00113$:
   4893 3A B7 62      [13]  671 	ld	a,(#_sol_tam + 0)
   4896 B7            [ 4]  672 	or	a, a
   4897 28 06         [12]  673 	jr	Z,00109$
   4899 DD 7E FA      [19]  674 	ld	a,-6 (ix)
   489C B7            [ 4]  675 	or	a, a
   489D 20 14         [12]  676 	jr	NZ,00110$
   489F                     677 00109$:
                            678 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   489F DD 7E FA      [19]  679 	ld	a,-6 (ix)
   48A2 B7            [ 4]  680 	or	a, a
   48A3 28 06         [12]  681 	jr	Z,00101$
   48A5 3A B7 62      [13]  682 	ld	a,(#_sol_tam + 0)
   48A8 B7            [ 4]  683 	or	a, a
   48A9 20 02         [12]  684 	jr	NZ,00102$
   48AB                     685 00101$:
                            686 ;src/pathfinding.c:161: problem = 1;
   48AB 1E 01         [ 7]  687 	ld	e,#0x01
   48AD                     688 00102$:
                            689 ;src/pathfinding.c:164: aux = 0;
   48AD DD 36 FB 00   [19]  690 	ld	-5 (ix),#0x00
   48B1 18 C9         [12]  691 	jr	00115$
   48B3                     692 00110$:
                            693 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   48B3 C5            [11]  694 	push	bc
   48B4 D5            [11]  695 	push	de
   48B5 DD 6E 0A      [19]  696 	ld	l,10 (ix)
   48B8 DD 66 0B      [19]  697 	ld	h,11 (ix)
   48BB E5            [11]  698 	push	hl
   48BC DD 66 07      [19]  699 	ld	h,7 (ix)
   48BF DD 6E 06      [19]  700 	ld	l,6 (ix)
   48C2 E5            [11]  701 	push	hl
   48C3 DD 66 F8      [19]  702 	ld	h,-8 (ix)
   48C6 DD 6E F7      [19]  703 	ld	l,-9 (ix)
   48C9 E5            [11]  704 	push	hl
   48CA CD 37 44      [17]  705 	call	_adjacentTiles
   48CD F1            [10]  706 	pop	af
   48CE F1            [10]  707 	pop	af
   48CF F1            [10]  708 	pop	af
   48D0 D1            [10]  709 	pop	de
   48D1 C1            [10]  710 	pop	bc
   48D2 55            [ 4]  711 	ld	d,l
                            712 ;src/pathfinding.c:168: switch(movimiento){
   48D3 3E 03         [ 7]  713 	ld	a,#0x03
   48D5 92            [ 4]  714 	sub	a, d
   48D6 38 A4         [12]  715 	jr	C,00115$
                            716 ;src/pathfinding.c:172: k = k+2;
   48D8 DD 7E F9      [19]  717 	ld	a,-7 (ix)
   48DB C6 02         [ 7]  718 	add	a, #0x02
   48DD DD 77 FE      [19]  719 	ld	-2 (ix),a
                            720 ;src/pathfinding.c:168: switch(movimiento){
   48E0 D5            [11]  721 	push	de
   48E1 5A            [ 4]  722 	ld	e,d
   48E2 16 00         [ 7]  723 	ld	d,#0x00
   48E4 21 EB 48      [10]  724 	ld	hl,#00174$
   48E7 19            [11]  725 	add	hl,de
   48E8 19            [11]  726 	add	hl,de
                            727 ;src/pathfinding.c:169: case 0:
   48E9 D1            [10]  728 	pop	de
   48EA E9            [ 4]  729 	jp	(hl)
   48EB                     730 00174$:
   48EB 18 06         [12]  731 	jr	00104$
   48ED 18 2D         [12]  732 	jr	00105$
   48EF 18 4E         [12]  733 	jr	00106$
   48F1 18 6E         [12]  734 	jr	00107$
   48F3                     735 00104$:
                            736 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   48F3 DD 7E F8      [19]  737 	ld	a,-8 (ix)
   48F6 C6 FE         [ 7]  738 	add	a,#0xFE
   48F8 DD 77 FF      [19]  739 	ld	-1 (ix),a
   48FB C5            [11]  740 	push	bc
   48FC D5            [11]  741 	push	de
   48FD DD 66 FF      [19]  742 	ld	h,-1 (ix)
   4900 DD 6E F7      [19]  743 	ld	l,-9 (ix)
   4903 E5            [11]  744 	push	hl
   4904 CD EF 43      [17]  745 	call	_anyadirALista
   4907 F1            [10]  746 	pop	af
   4908 D1            [10]  747 	pop	de
   4909 C1            [10]  748 	pop	bc
   490A DD 75 FA      [19]  749 	ld	-6 (ix),l
                            750 ;src/pathfinding.c:171: y = y-2;
   490D DD 56 FF      [19]  751 	ld	d,-1 (ix)
   4910 DD 72 F8      [19]  752 	ld	-8 (ix),d
                            753 ;src/pathfinding.c:172: k = k+2;
   4913 DD 7E FE      [19]  754 	ld	a,-2 (ix)
   4916 DD 77 F9      [19]  755 	ld	-7 (ix),a
                            756 ;src/pathfinding.c:173: break;
   4919 C3 7C 48      [10]  757 	jp	00115$
                            758 ;src/pathfinding.c:174: case 1:
   491C                     759 00105$:
                            760 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   491C DD 56 F8      [19]  761 	ld	d,-8 (ix)
   491F 14            [ 4]  762 	inc	d
   4920 14            [ 4]  763 	inc	d
   4921 C5            [11]  764 	push	bc
   4922 D5            [11]  765 	push	de
   4923 D5            [11]  766 	push	de
   4924 33            [ 6]  767 	inc	sp
   4925 DD 7E F7      [19]  768 	ld	a,-9 (ix)
   4928 F5            [11]  769 	push	af
   4929 33            [ 6]  770 	inc	sp
   492A CD EF 43      [17]  771 	call	_anyadirALista
   492D F1            [10]  772 	pop	af
   492E D1            [10]  773 	pop	de
   492F C1            [10]  774 	pop	bc
   4930 DD 75 FA      [19]  775 	ld	-6 (ix),l
                            776 ;src/pathfinding.c:178: y = y+2;
   4933 DD 72 F8      [19]  777 	ld	-8 (ix),d
                            778 ;src/pathfinding.c:179: k = k+2;
   4936 DD 7E FE      [19]  779 	ld	a,-2 (ix)
   4939 DD 77 F9      [19]  780 	ld	-7 (ix),a
                            781 ;src/pathfinding.c:180: break;
   493C C3 7C 48      [10]  782 	jp	00115$
                            783 ;src/pathfinding.c:181: case 2:
   493F                     784 00106$:
                            785 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   493F DD 56 F7      [19]  786 	ld	d,-9 (ix)
   4942 15            [ 4]  787 	dec	d
   4943 C5            [11]  788 	push	bc
   4944 D5            [11]  789 	push	de
   4945 DD 7E F8      [19]  790 	ld	a,-8 (ix)
   4948 F5            [11]  791 	push	af
   4949 33            [ 6]  792 	inc	sp
   494A D5            [11]  793 	push	de
   494B 33            [ 6]  794 	inc	sp
   494C CD EF 43      [17]  795 	call	_anyadirALista
   494F F1            [10]  796 	pop	af
   4950 D1            [10]  797 	pop	de
   4951 C1            [10]  798 	pop	bc
   4952 DD 75 FA      [19]  799 	ld	-6 (ix),l
                            800 ;src/pathfinding.c:185: x = x-1;
   4955 DD 72 F7      [19]  801 	ld	-9 (ix),d
                            802 ;src/pathfinding.c:186: k = k+2;
   4958 DD 7E FE      [19]  803 	ld	a,-2 (ix)
   495B DD 77 F9      [19]  804 	ld	-7 (ix),a
                            805 ;src/pathfinding.c:187: break;
   495E C3 7C 48      [10]  806 	jp	00115$
                            807 ;src/pathfinding.c:188: case 3:
   4961                     808 00107$:
                            809 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4961 DD 7E F7      [19]  810 	ld	a,-9 (ix)
   4964 3C            [ 4]  811 	inc	a
   4965 DD 77 FF      [19]  812 	ld	-1 (ix),a
   4968 C5            [11]  813 	push	bc
   4969 D5            [11]  814 	push	de
   496A DD 66 F8      [19]  815 	ld	h,-8 (ix)
   496D DD 6E FF      [19]  816 	ld	l,-1 (ix)
   4970 E5            [11]  817 	push	hl
   4971 CD EF 43      [17]  818 	call	_anyadirALista
   4974 F1            [10]  819 	pop	af
   4975 D1            [10]  820 	pop	de
   4976 C1            [10]  821 	pop	bc
   4977 DD 75 FA      [19]  822 	ld	-6 (ix),l
                            823 ;src/pathfinding.c:190: x = x+1;
   497A DD 6E FF      [19]  824 	ld	l,-1 (ix)
   497D DD 75 F7      [19]  825 	ld	-9 (ix),l
                            826 ;src/pathfinding.c:191: k = k+2;
   4980 DD 7E FE      [19]  827 	ld	a,-2 (ix)
   4983 DD 77 F9      [19]  828 	ld	-7 (ix),a
                            829 ;src/pathfinding.c:194: }
   4986 C3 7C 48      [10]  830 	jp	00115$
   4989                     831 00117$:
                            832 ;src/pathfinding.c:199: if(problem == 0){
   4989 7B            [ 4]  833 	ld	a,e
   498A B7            [ 4]  834 	or	a, a
   498B 20 44         [12]  835 	jr	NZ,00123$
                            836 ;src/pathfinding.c:200: if(sol_tam < CAMINO_TAM){
                            837 ;src/pathfinding.c:201: actual->longitud_camino = sol_tam;
   498D 3A B7 62      [13]  838 	ld	a,(#_sol_tam + 0)
   4990 FE C8         [ 7]  839 	cp	a,#0xC8
   4992 30 03         [12]  840 	jr	NC,00119$
   4994 02            [ 7]  841 	ld	(bc),a
   4995 18 03         [12]  842 	jr	00139$
   4997                     843 00119$:
                            844 ;src/pathfinding.c:203: actual->longitud_camino = CAMINO_TAM;
   4997 3E C8         [ 7]  845 	ld	a,#0xC8
   4999 02            [ 7]  846 	ld	(bc),a
                            847 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   499A                     848 00139$:
   499A DD 7E FC      [19]  849 	ld	a,-4 (ix)
   499D C6 19         [ 7]  850 	add	a, #0x19
   499F DD 77 FC      [19]  851 	ld	-4 (ix),a
   49A2 DD 7E FD      [19]  852 	ld	a,-3 (ix)
   49A5 CE 00         [ 7]  853 	adc	a, #0x00
   49A7 DD 77 FD      [19]  854 	ld	-3 (ix),a
   49AA 1E 00         [ 7]  855 	ld	e,#0x00
   49AC                     856 00126$:
   49AC 0A            [ 7]  857 	ld	a,(bc)
   49AD 57            [ 4]  858 	ld	d,a
   49AE 7B            [ 4]  859 	ld	a,e
   49AF 92            [ 4]  860 	sub	a, d
   49B0 30 21         [12]  861 	jr	NC,00128$
                            862 ;src/pathfinding.c:206: actual->camino[i] = camino[i];
   49B2 E5            [11]  863 	push	hl
   49B3 6B            [ 4]  864 	ld	l,e
   49B4 26 00         [ 7]  865 	ld	h,#0x00
   49B6 E5            [11]  866 	push	hl
   49B7 FD E1         [14]  867 	pop	iy
   49B9 E1            [10]  868 	pop	hl
   49BA C5            [11]  869 	push	bc
   49BB DD 4E FC      [19]  870 	ld	c,-4 (ix)
   49BE DD 46 FD      [19]  871 	ld	b,-3 (ix)
   49C1 FD 09         [15]  872 	add	iy, bc
   49C3 C1            [10]  873 	pop	bc
   49C4 21 B8 62      [10]  874 	ld	hl,#_camino
   49C7 16 00         [ 7]  875 	ld	d,#0x00
   49C9 19            [11]  876 	add	hl, de
   49CA 56            [ 7]  877 	ld	d,(hl)
   49CB FD 72 00      [19]  878 	ld	0 (iy), d
                            879 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   49CE 1C            [ 4]  880 	inc	e
   49CF 18 DB         [12]  881 	jr	00126$
   49D1                     882 00123$:
                            883 ;src/pathfinding.c:210: actual->longitud_camino = 0;
   49D1 AF            [ 4]  884 	xor	a, a
   49D2 02            [ 7]  885 	ld	(bc),a
   49D3                     886 00128$:
   49D3 DD F9         [10]  887 	ld	sp, ix
   49D5 DD E1         [14]  888 	pop	ix
   49D7 C9            [10]  889 	ret
                            890 	.area _CODE
                            891 	.area _INITIALIZER
                            892 	.area _CABS (ABS)
