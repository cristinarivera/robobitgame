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
   6300                      25 _sol_tam::
   6300                      26 	.ds 1
   6301                      27 _camino::
   6301                      28 	.ds 200
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
                             53 ;src/pathfinding.c:9: u8 anyadirALista(u8 x, u8 y){
                             54 ;	---------------------------------
                             55 ; Function anyadirALista
                             56 ; ---------------------------------
   444C                      57 _anyadirALista::
                             58 ;src/pathfinding.c:10: u8 anyadido = 0;
   444C 0E 00         [ 7]   59 	ld	c,#0x00
                             60 ;src/pathfinding.c:12: if(sol_tam < CAMINO_TAM){
   444E 3A 00 63      [13]   61 	ld	a,(#_sol_tam + 0)
   4451 D6 C8         [ 7]   62 	sub	a, #0xC8
   4453 30 2D         [12]   63 	jr	NC,00102$
                             64 ;src/pathfinding.c:13: camino[sol_tam] = x;
   4455 01 01 63      [10]   65 	ld	bc,#_camino+0
   4458 2A 00 63      [16]   66 	ld	hl,(_sol_tam)
   445B 26 00         [ 7]   67 	ld	h,#0x00
   445D 09            [11]   68 	add	hl,bc
   445E FD 21 02 00   [14]   69 	ld	iy,#2
   4462 FD 39         [15]   70 	add	iy,sp
   4464 FD 7E 00      [19]   71 	ld	a,0 (iy)
   4467 77            [ 7]   72 	ld	(hl),a
                             73 ;src/pathfinding.c:14: sol_tam++;
   4468 21 00 63      [10]   74 	ld	hl, #_sol_tam+0
   446B 34            [11]   75 	inc	(hl)
                             76 ;src/pathfinding.c:15: camino[sol_tam] = y;
   446C 2A 00 63      [16]   77 	ld	hl,(_sol_tam)
   446F 26 00         [ 7]   78 	ld	h,#0x00
   4471 09            [11]   79 	add	hl,bc
   4472 FD 21 03 00   [14]   80 	ld	iy,#3
   4476 FD 39         [15]   81 	add	iy,sp
   4478 FD 7E 00      [19]   82 	ld	a,0 (iy)
   447B 77            [ 7]   83 	ld	(hl),a
                             84 ;src/pathfinding.c:16: sol_tam++;
   447C 21 00 63      [10]   85 	ld	hl, #_sol_tam+0
   447F 34            [11]   86 	inc	(hl)
                             87 ;src/pathfinding.c:17: anyadido = 1;
   4480 0E 01         [ 7]   88 	ld	c,#0x01
   4482                      89 00102$:
                             90 ;src/pathfinding.c:20: return anyadido;
   4482 69            [ 4]   91 	ld	l,c
   4483 C9            [10]   92 	ret
                             93 ;src/pathfinding.c:24: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
                             94 ;	---------------------------------
                             95 ; Function adjacentTiles
                             96 ; ---------------------------------
   4484                      97 _adjacentTiles::
   4484 DD E5         [15]   98 	push	ix
   4486 DD 21 00 00   [14]   99 	ld	ix,#0
   448A DD 39         [15]  100 	add	ix,sp
   448C 21 DF FF      [10]  101 	ld	hl,#-33
   448F 39            [11]  102 	add	hl,sp
   4490 F9            [ 6]  103 	ld	sp,hl
                            104 ;src/pathfinding.c:25: u8 resultado = 4;
   4491 DD 36 EF 04   [19]  105 	ld	-17 (ix),#0x04
                            106 ;src/pathfinding.c:27: i16 dist1 = 0;
   4495 DD 36 E7 00   [19]  107 	ld	-25 (ix),#0x00
   4499 DD 36 E8 00   [19]  108 	ld	-24 (ix),#0x00
                            109 ;src/pathfinding.c:28: i16 dist2 = 0;
   449D DD 36 E9 00   [19]  110 	ld	-23 (ix),#0x00
   44A1 DD 36 EA 00   [19]  111 	ld	-22 (ix),#0x00
                            112 ;src/pathfinding.c:29: i16 dist3 = 0;
   44A5 DD 36 EB 00   [19]  113 	ld	-21 (ix),#0x00
   44A9 DD 36 EC 00   [19]  114 	ld	-20 (ix),#0x00
                            115 ;src/pathfinding.c:33: i16 heu_derecha = 0;
   44AD DD 36 E5 00   [19]  116 	ld	-27 (ix),#0x00
   44B1 DD 36 E6 00   [19]  117 	ld	-26 (ix),#0x00
                            118 ;src/pathfinding.c:34: i16 heu_izquierda = 0;
   44B5 DD 36 E3 00   [19]  119 	ld	-29 (ix),#0x00
   44B9 DD 36 E4 00   [19]  120 	ld	-28 (ix),#0x00
                            121 ;src/pathfinding.c:35: i16 heu_arriba = 0;
   44BD DD 36 E1 00   [19]  122 	ld	-31 (ix),#0x00
   44C1 DD 36 E2 00   [19]  123 	ld	-30 (ix),#0x00
                            124 ;src/pathfinding.c:36: i16 heu_abajo = 0;
   44C5 21 00 00      [10]  125 	ld	hl,#0x0000
   44C8 E3            [19]  126 	ex	(sp), hl
                            127 ;src/pathfinding.c:42: if(y < f_y)
   44C9 DD 7E 05      [19]  128 	ld	a,5 (ix)
   44CC DD 96 07      [19]  129 	sub	a, 7 (ix)
   44CF 3E 00         [ 7]  130 	ld	a,#0x00
   44D1 17            [ 4]  131 	rla
   44D2 4F            [ 4]  132 	ld	c,a
                            133 ;src/pathfinding.c:40: if(x == f_x){
   44D3 DD 7E 04      [19]  134 	ld	a,4 (ix)
   44D6 DD 96 06      [19]  135 	sub	a, 6 (ix)
   44D9 20 1C         [12]  136 	jr	NZ,00124$
                            137 ;src/pathfinding.c:42: if(y < f_y)
   44DB 79            [ 4]  138 	ld	a,c
   44DC B7            [ 4]  139 	or	a, a
   44DD 28 04         [12]  140 	jr	Z,00102$
                            141 ;src/pathfinding.c:43: heu_abajo = -1;
   44DF 21 FF FF      [10]  142 	ld	hl,#0xFFFF
   44E2 E3            [19]  143 	ex	(sp), hl
   44E3                     144 00102$:
                            145 ;src/pathfinding.c:45: if(y > f_y)
   44E3 DD 7E 07      [19]  146 	ld	a,7 (ix)
   44E6 DD 96 05      [19]  147 	sub	a, 5 (ix)
   44E9 D2 6B 45      [10]  148 	jp	NC,00125$
                            149 ;src/pathfinding.c:46: heu_arriba = -1;
   44EC DD 36 E1 FF   [19]  150 	ld	-31 (ix),#0xFF
   44F0 DD 36 E2 FF   [19]  151 	ld	-30 (ix),#0xFF
   44F4 C3 6B 45      [10]  152 	jp	00125$
   44F7                     153 00124$:
                            154 ;src/pathfinding.c:50: if(x < f_x)
   44F7 DD 7E 04      [19]  155 	ld	a,4 (ix)
   44FA DD 96 06      [19]  156 	sub	a, 6 (ix)
   44FD 3E 00         [ 7]  157 	ld	a,#0x00
   44FF 17            [ 4]  158 	rla
   4500 47            [ 4]  159 	ld	b,a
                            160 ;src/pathfinding.c:52: if(x > f_x)
   4501 DD 7E 06      [19]  161 	ld	a,6 (ix)
   4504 DD 96 04      [19]  162 	sub	a, 4 (ix)
   4507 3E 00         [ 7]  163 	ld	a,#0x00
   4509 17            [ 4]  164 	rla
   450A 5F            [ 4]  165 	ld	e,a
                            166 ;src/pathfinding.c:48: }else if(y == f_y){
   450B DD 7E 05      [19]  167 	ld	a,5 (ix)
   450E DD 96 07      [19]  168 	sub	a, 7 (ix)
   4511 20 1A         [12]  169 	jr	NZ,00121$
                            170 ;src/pathfinding.c:50: if(x < f_x)
   4513 78            [ 4]  171 	ld	a,b
   4514 B7            [ 4]  172 	or	a, a
   4515 28 08         [12]  173 	jr	Z,00106$
                            174 ;src/pathfinding.c:51: heu_derecha = -1;
   4517 DD 36 E5 FF   [19]  175 	ld	-27 (ix),#0xFF
   451B DD 36 E6 FF   [19]  176 	ld	-26 (ix),#0xFF
   451F                     177 00106$:
                            178 ;src/pathfinding.c:52: if(x > f_x)
   451F 7B            [ 4]  179 	ld	a,e
   4520 B7            [ 4]  180 	or	a, a
   4521 28 48         [12]  181 	jr	Z,00125$
                            182 ;src/pathfinding.c:53: heu_izquierda = -1;
   4523 DD 36 E3 FF   [19]  183 	ld	-29 (ix),#0xFF
   4527 DD 36 E4 FF   [19]  184 	ld	-28 (ix),#0xFF
   452B 18 3E         [12]  185 	jr	00125$
   452D                     186 00121$:
                            187 ;src/pathfinding.c:58: if(x < f_x){
   452D 78            [ 4]  188 	ld	a,b
   452E B7            [ 4]  189 	or	a, a
   452F 28 1C         [12]  190 	jr	Z,00118$
                            191 ;src/pathfinding.c:59: if(y < f_y)
   4531 79            [ 4]  192 	ld	a,c
   4532 B7            [ 4]  193 	or	a, a
   4533 28 06         [12]  194 	jr	Z,00110$
                            195 ;src/pathfinding.c:60: heu_abajo = -1;
   4535 21 FF FF      [10]  196 	ld	hl,#0xFFFF
   4538 E3            [19]  197 	ex	(sp), hl
   4539 18 08         [12]  198 	jr	00111$
   453B                     199 00110$:
                            200 ;src/pathfinding.c:62: heu_arriba = -1;
   453B DD 36 E1 FF   [19]  201 	ld	-31 (ix),#0xFF
   453F DD 36 E2 FF   [19]  202 	ld	-30 (ix),#0xFF
   4543                     203 00111$:
                            204 ;src/pathfinding.c:64: heu_derecha = -1;
   4543 DD 36 E5 FF   [19]  205 	ld	-27 (ix),#0xFF
   4547 DD 36 E6 FF   [19]  206 	ld	-26 (ix),#0xFF
   454B 18 1E         [12]  207 	jr	00125$
   454D                     208 00118$:
                            209 ;src/pathfinding.c:65: }else if(x > f_x){
   454D 7B            [ 4]  210 	ld	a,e
   454E B7            [ 4]  211 	or	a, a
   454F 28 1A         [12]  212 	jr	Z,00125$
                            213 ;src/pathfinding.c:67: if(y < f_y)
   4551 79            [ 4]  214 	ld	a,c
   4552 B7            [ 4]  215 	or	a, a
   4553 28 06         [12]  216 	jr	Z,00113$
                            217 ;src/pathfinding.c:68: heu_abajo = -1;
   4555 21 FF FF      [10]  218 	ld	hl,#0xFFFF
   4558 E3            [19]  219 	ex	(sp), hl
   4559 18 08         [12]  220 	jr	00114$
   455B                     221 00113$:
                            222 ;src/pathfinding.c:70: heu_arriba = -1;
   455B DD 36 E1 FF   [19]  223 	ld	-31 (ix),#0xFF
   455F DD 36 E2 FF   [19]  224 	ld	-30 (ix),#0xFF
   4563                     225 00114$:
                            226 ;src/pathfinding.c:72: heu_izquierda = -1;
   4563 DD 36 E3 FF   [19]  227 	ld	-29 (ix),#0xFF
   4567 DD 36 E4 FF   [19]  228 	ld	-28 (ix),#0xFF
   456B                     229 00125$:
                            230 ;src/pathfinding.c:77: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   456B DD 7E 05      [19]  231 	ld	a,5 (ix)
   456E C6 FE         [ 7]  232 	add	a,#0xFE
   4570 DD 77 FA      [19]  233 	ld	-6 (ix), a
   4573 F5            [11]  234 	push	af
   4574 33            [ 6]  235 	inc	sp
   4575 DD 7E 04      [19]  236 	ld	a,4 (ix)
   4578 F5            [11]  237 	push	af
   4579 33            [ 6]  238 	inc	sp
   457A DD 6E 08      [19]  239 	ld	l,8 (ix)
   457D DD 66 09      [19]  240 	ld	h,9 (ix)
   4580 E5            [11]  241 	push	hl
   4581 CD 61 4B      [17]  242 	call	_getTilePtr
   4584 F1            [10]  243 	pop	af
   4585 F1            [10]  244 	pop	af
   4586 4E            [ 7]  245 	ld	c,(hl)
                            246 ;src/pathfinding.c:78: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   4587 DD 7E 04      [19]  247 	ld	a,4 (ix)
   458A C6 04         [ 7]  248 	add	a, #0x04
   458C DD 77 FD      [19]  249 	ld	-3 (ix),a
                            250 ;src/pathfinding.c:79: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   458F DD 7E 06      [19]  251 	ld	a,6 (ix)
   4592 DD 77 FE      [19]  252 	ld	-2 (ix),a
   4595 DD 36 FF 00   [19]  253 	ld	-1 (ix),#0x00
   4599 DD 7E 04      [19]  254 	ld	a,4 (ix)
   459C DD 77 FB      [19]  255 	ld	-5 (ix),a
   459F DD 36 FC 00   [19]  256 	ld	-4 (ix),#0x00
   45A3 DD 7E 07      [19]  257 	ld	a,7 (ix)
   45A6 DD 77 F8      [19]  258 	ld	-8 (ix),a
   45A9 DD 36 F9 00   [19]  259 	ld	-7 (ix),#0x00
   45AD DD 7E 05      [19]  260 	ld	a,5 (ix)
   45B0 DD 77 F6      [19]  261 	ld	-10 (ix),a
   45B3 DD 36 F7 00   [19]  262 	ld	-9 (ix),#0x00
   45B7 DD 7E FE      [19]  263 	ld	a,-2 (ix)
   45BA DD 96 FB      [19]  264 	sub	a, -5 (ix)
   45BD DD 77 F4      [19]  265 	ld	-12 (ix),a
   45C0 DD 7E FF      [19]  266 	ld	a,-1 (ix)
   45C3 DD 9E FC      [19]  267 	sbc	a, -4 (ix)
   45C6 DD 77 F5      [19]  268 	ld	-11 (ix),a
                            269 ;src/pathfinding.c:77: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   45C9 3E 02         [ 7]  270 	ld	a,#0x02
   45CB 91            [ 4]  271 	sub	a, c
   45CC DA 60 46      [10]  272 	jp	C,00127$
                            273 ;src/pathfinding.c:78: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   45CF DD 66 FA      [19]  274 	ld	h,-6 (ix)
   45D2 DD 6E FD      [19]  275 	ld	l,-3 (ix)
   45D5 E5            [11]  276 	push	hl
   45D6 DD 6E 08      [19]  277 	ld	l,8 (ix)
   45D9 DD 66 09      [19]  278 	ld	h,9 (ix)
   45DC E5            [11]  279 	push	hl
   45DD CD 61 4B      [17]  280 	call	_getTilePtr
   45E0 F1            [10]  281 	pop	af
   45E1 F1            [10]  282 	pop	af
   45E2 4E            [ 7]  283 	ld	c,(hl)
   45E3 3E 02         [ 7]  284 	ld	a,#0x02
   45E5 91            [ 4]  285 	sub	a, c
   45E6 38 78         [12]  286 	jr	C,00127$
                            287 ;src/pathfinding.c:79: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45E8 DD 6E F4      [19]  288 	ld	l,-12 (ix)
   45EB DD 66 F5      [19]  289 	ld	h,-11 (ix)
   45EE E5            [11]  290 	push	hl
   45EF CD A5 4B      [17]  291 	call	_abs
   45F2 F1            [10]  292 	pop	af
   45F3 DD 74 F3      [19]  293 	ld	-13 (ix),h
   45F6 DD 75 F2      [19]  294 	ld	-14 (ix),l
   45F9 DD 7E F6      [19]  295 	ld	a,-10 (ix)
   45FC C6 FE         [ 7]  296 	add	a,#0xFE
   45FE DD 77 F0      [19]  297 	ld	-16 (ix),a
   4601 DD 7E F7      [19]  298 	ld	a,-9 (ix)
   4604 CE FF         [ 7]  299 	adc	a,#0xFF
   4606 DD 77 F1      [19]  300 	ld	-15 (ix),a
   4609 DD 7E F8      [19]  301 	ld	a,-8 (ix)
   460C DD 96 F0      [19]  302 	sub	a, -16 (ix)
   460F DD 77 F0      [19]  303 	ld	-16 (ix),a
   4612 DD 7E F9      [19]  304 	ld	a,-7 (ix)
   4615 DD 9E F1      [19]  305 	sbc	a, -15 (ix)
   4618 DD 77 F1      [19]  306 	ld	-15 (ix),a
   461B DD 6E F0      [19]  307 	ld	l,-16 (ix)
   461E DD 66 F1      [19]  308 	ld	h,-15 (ix)
   4621 E5            [11]  309 	push	hl
   4622 CD A5 4B      [17]  310 	call	_abs
   4625 F1            [10]  311 	pop	af
   4626 DD 74 F1      [19]  312 	ld	-15 (ix),h
   4629 DD 75 F0      [19]  313 	ld	-16 (ix),l
   462C DD 7E F2      [19]  314 	ld	a,-14 (ix)
   462F DD 86 F0      [19]  315 	add	a, -16 (ix)
   4632 DD 77 F0      [19]  316 	ld	-16 (ix),a
   4635 DD 7E F3      [19]  317 	ld	a,-13 (ix)
   4638 DD 8E F1      [19]  318 	adc	a, -15 (ix)
   463B DD 77 F1      [19]  319 	ld	-15 (ix),a
   463E DD 7E F0      [19]  320 	ld	a,-16 (ix)
   4641 DD 86 E1      [19]  321 	add	a, -31 (ix)
   4644 DD 77 F0      [19]  322 	ld	-16 (ix),a
   4647 DD 7E F1      [19]  323 	ld	a,-15 (ix)
   464A DD 8E E2      [19]  324 	adc	a, -30 (ix)
   464D DD 77 F1      [19]  325 	ld	-15 (ix),a
   4650 DD 7E F0      [19]  326 	ld	a,-16 (ix)
   4653 DD 77 E7      [19]  327 	ld	-25 (ix),a
   4656 DD 7E F1      [19]  328 	ld	a,-15 (ix)
   4659 DD 77 E8      [19]  329 	ld	-24 (ix),a
                            330 ;src/pathfinding.c:80: resultado = 0;
   465C DD 36 EF 00   [19]  331 	ld	-17 (ix),#0x00
   4660                     332 00127$:
                            333 ;src/pathfinding.c:83: if(*getTilePtr(matriz, x, y+2) <=2 &&
   4660 DD 46 05      [19]  334 	ld	b,5 (ix)
   4663 04            [ 4]  335 	inc	b
   4664 04            [ 4]  336 	inc	b
   4665 C5            [11]  337 	push	bc
   4666 33            [ 6]  338 	inc	sp
   4667 DD 7E 04      [19]  339 	ld	a,4 (ix)
   466A F5            [11]  340 	push	af
   466B 33            [ 6]  341 	inc	sp
   466C DD 6E 08      [19]  342 	ld	l,8 (ix)
   466F DD 66 09      [19]  343 	ld	h,9 (ix)
   4672 E5            [11]  344 	push	hl
   4673 CD 61 4B      [17]  345 	call	_getTilePtr
   4676 F1            [10]  346 	pop	af
   4677 F1            [10]  347 	pop	af
   4678 4E            [ 7]  348 	ld	c,(hl)
   4679 3E 02         [ 7]  349 	ld	a,#0x02
   467B 91            [ 4]  350 	sub	a, c
   467C DA 45 47      [10]  351 	jp	C,00135$
                            352 ;src/pathfinding.c:84: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
   467F DD 7E 05      [19]  353 	ld	a,5 (ix)
   4682 C6 16         [ 7]  354 	add	a, #0x16
   4684 47            [ 4]  355 	ld	b,a
   4685 C5            [11]  356 	push	bc
   4686 33            [ 6]  357 	inc	sp
   4687 DD 7E FD      [19]  358 	ld	a,-3 (ix)
   468A F5            [11]  359 	push	af
   468B 33            [ 6]  360 	inc	sp
   468C DD 6E 08      [19]  361 	ld	l,8 (ix)
   468F DD 66 09      [19]  362 	ld	h,9 (ix)
   4692 E5            [11]  363 	push	hl
   4693 CD 61 4B      [17]  364 	call	_getTilePtr
   4696 F1            [10]  365 	pop	af
   4697 F1            [10]  366 	pop	af
   4698 DD 74 F1      [19]  367 	ld	-15 (ix),h
   469B DD 75 F0      [19]  368 	ld	-16 (ix), l
   469E DD 66 F1      [19]  369 	ld	h,-15 (ix)
   46A1 7E            [ 7]  370 	ld	a,(hl)
   46A2 DD 77 F0      [19]  371 	ld	-16 (ix),a
   46A5 3E 02         [ 7]  372 	ld	a,#0x02
   46A7 DD 96 F0      [19]  373 	sub	a, -16 (ix)
   46AA DA 45 47      [10]  374 	jp	C,00135$
                            375 ;src/pathfinding.c:85: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   46AD DD 6E F4      [19]  376 	ld	l,-12 (ix)
   46B0 DD 66 F5      [19]  377 	ld	h,-11 (ix)
   46B3 E5            [11]  378 	push	hl
   46B4 CD A5 4B      [17]  379 	call	_abs
   46B7 F1            [10]  380 	pop	af
   46B8 DD 74 F1      [19]  381 	ld	-15 (ix),h
   46BB DD 75 F0      [19]  382 	ld	-16 (ix),l
   46BE DD 7E F6      [19]  383 	ld	a,-10 (ix)
   46C1 C6 02         [ 7]  384 	add	a, #0x02
   46C3 DD 77 F2      [19]  385 	ld	-14 (ix),a
   46C6 DD 7E F7      [19]  386 	ld	a,-9 (ix)
   46C9 CE 00         [ 7]  387 	adc	a, #0x00
   46CB DD 77 F3      [19]  388 	ld	-13 (ix),a
   46CE DD 7E F8      [19]  389 	ld	a,-8 (ix)
   46D1 DD 96 F2      [19]  390 	sub	a, -14 (ix)
   46D4 DD 77 F2      [19]  391 	ld	-14 (ix),a
   46D7 DD 7E F9      [19]  392 	ld	a,-7 (ix)
   46DA DD 9E F3      [19]  393 	sbc	a, -13 (ix)
   46DD DD 77 F3      [19]  394 	ld	-13 (ix),a
   46E0 DD 6E F2      [19]  395 	ld	l,-14 (ix)
   46E3 DD 66 F3      [19]  396 	ld	h,-13 (ix)
   46E6 E5            [11]  397 	push	hl
   46E7 CD A5 4B      [17]  398 	call	_abs
   46EA F1            [10]  399 	pop	af
   46EB DD 74 F3      [19]  400 	ld	-13 (ix),h
   46EE DD 75 F2      [19]  401 	ld	-14 (ix),l
   46F1 DD 7E F0      [19]  402 	ld	a,-16 (ix)
   46F4 DD 86 F2      [19]  403 	add	a, -14 (ix)
   46F7 DD 77 F0      [19]  404 	ld	-16 (ix),a
   46FA DD 7E F1      [19]  405 	ld	a,-15 (ix)
   46FD DD 8E F3      [19]  406 	adc	a, -13 (ix)
   4700 DD 77 F1      [19]  407 	ld	-15 (ix),a
   4703 DD 7E F0      [19]  408 	ld	a,-16 (ix)
   4706 DD 86 DF      [19]  409 	add	a, -33 (ix)
   4709 DD 77 F0      [19]  410 	ld	-16 (ix),a
   470C DD 7E F1      [19]  411 	ld	a,-15 (ix)
   470F DD 8E E0      [19]  412 	adc	a, -32 (ix)
   4712 DD 77 F1      [19]  413 	ld	-15 (ix),a
   4715 DD 7E F0      [19]  414 	ld	a,-16 (ix)
   4718 DD 77 E9      [19]  415 	ld	-23 (ix),a
   471B DD 7E F1      [19]  416 	ld	a,-15 (ix)
   471E DD 77 EA      [19]  417 	ld	-22 (ix),a
                            418 ;src/pathfinding.c:86: if(resultado == 0){
   4721 DD 7E EF      [19]  419 	ld	a,-17 (ix)
   4724 B7            [ 4]  420 	or	a, a
   4725 20 1A         [12]  421 	jr	NZ,00132$
                            422 ;src/pathfinding.c:87: if(dist1 > dist2)
   4727 DD 7E E9      [19]  423 	ld	a,-23 (ix)
   472A DD 96 E7      [19]  424 	sub	a, -25 (ix)
   472D DD 7E EA      [19]  425 	ld	a,-22 (ix)
   4730 DD 9E E8      [19]  426 	sbc	a, -24 (ix)
   4733 E2 38 47      [10]  427 	jp	PO, 00304$
   4736 EE 80         [ 7]  428 	xor	a, #0x80
   4738                     429 00304$:
   4738 F2 45 47      [10]  430 	jp	P,00135$
                            431 ;src/pathfinding.c:88: resultado = 1;
   473B DD 36 EF 01   [19]  432 	ld	-17 (ix),#0x01
   473F 18 04         [12]  433 	jr	00135$
   4741                     434 00132$:
                            435 ;src/pathfinding.c:90: resultado = 1;
   4741 DD 36 EF 01   [19]  436 	ld	-17 (ix),#0x01
   4745                     437 00135$:
                            438 ;src/pathfinding.c:94: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4745 DD 4E 04      [19]  439 	ld	c,4 (ix)
   4748 0D            [ 4]  440 	dec	c
   4749 C5            [11]  441 	push	bc
   474A DD 7E 05      [19]  442 	ld	a,5 (ix)
   474D F5            [11]  443 	push	af
   474E 33            [ 6]  444 	inc	sp
   474F 79            [ 4]  445 	ld	a,c
   4750 F5            [11]  446 	push	af
   4751 33            [ 6]  447 	inc	sp
   4752 DD 6E 08      [19]  448 	ld	l,8 (ix)
   4755 DD 66 09      [19]  449 	ld	h,9 (ix)
   4758 E5            [11]  450 	push	hl
   4759 CD 61 4B      [17]  451 	call	_getTilePtr
   475C F1            [10]  452 	pop	af
   475D F1            [10]  453 	pop	af
   475E C1            [10]  454 	pop	bc
   475F 46            [ 7]  455 	ld	b,(hl)
                            456 ;src/pathfinding.c:95: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4760 DD 7E 05      [19]  457 	ld	a,5 (ix)
   4763 C6 14         [ 7]  458 	add	a, #0x14
   4765 DD 77 F0      [19]  459 	ld	-16 (ix),a
                            460 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   4768 DD 7E 05      [19]  461 	ld	a,5 (ix)
   476B C6 0B         [ 7]  462 	add	a, #0x0B
   476D DD 77 F2      [19]  463 	ld	-14 (ix),a
                            464 ;src/pathfinding.c:97: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4770 DD 7E F8      [19]  465 	ld	a,-8 (ix)
   4773 DD 96 F6      [19]  466 	sub	a, -10 (ix)
   4776 DD 77 F4      [19]  467 	ld	-12 (ix),a
   4779 DD 7E F9      [19]  468 	ld	a,-7 (ix)
   477C DD 9E F7      [19]  469 	sbc	a, -9 (ix)
   477F DD 77 F5      [19]  470 	ld	-11 (ix),a
                            471 ;src/pathfinding.c:94: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4782 3E 02         [ 7]  472 	ld	a,#0x02
   4784 90            [ 4]  473 	sub	a, b
   4785 DA 33 48      [10]  474 	jp	C,00148$
                            475 ;src/pathfinding.c:95: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4788 C5            [11]  476 	push	bc
   4789 DD 7E F0      [19]  477 	ld	a,-16 (ix)
   478C F5            [11]  478 	push	af
   478D 33            [ 6]  479 	inc	sp
   478E 79            [ 4]  480 	ld	a,c
   478F F5            [11]  481 	push	af
   4790 33            [ 6]  482 	inc	sp
   4791 DD 6E 08      [19]  483 	ld	l,8 (ix)
   4794 DD 66 09      [19]  484 	ld	h,9 (ix)
   4797 E5            [11]  485 	push	hl
   4798 CD 61 4B      [17]  486 	call	_getTilePtr
   479B F1            [10]  487 	pop	af
   479C F1            [10]  488 	pop	af
   479D C1            [10]  489 	pop	bc
   479E 46            [ 7]  490 	ld	b,(hl)
   479F 3E 02         [ 7]  491 	ld	a,#0x02
   47A1 90            [ 4]  492 	sub	a, b
   47A2 DA 33 48      [10]  493 	jp	C,00148$
                            494 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   47A5 DD 7E F2      [19]  495 	ld	a,-14 (ix)
   47A8 F5            [11]  496 	push	af
   47A9 33            [ 6]  497 	inc	sp
   47AA 79            [ 4]  498 	ld	a,c
   47AB F5            [11]  499 	push	af
   47AC 33            [ 6]  500 	inc	sp
   47AD DD 6E 08      [19]  501 	ld	l,8 (ix)
   47B0 DD 66 09      [19]  502 	ld	h,9 (ix)
   47B3 E5            [11]  503 	push	hl
   47B4 CD 61 4B      [17]  504 	call	_getTilePtr
   47B7 F1            [10]  505 	pop	af
   47B8 F1            [10]  506 	pop	af
   47B9 4E            [ 7]  507 	ld	c,(hl)
   47BA 3E 02         [ 7]  508 	ld	a,#0x02
   47BC 91            [ 4]  509 	sub	a, c
   47BD 38 74         [12]  510 	jr	C,00148$
                            511 ;src/pathfinding.c:97: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   47BF DD 4E FB      [19]  512 	ld	c,-5 (ix)
   47C2 DD 46 FC      [19]  513 	ld	b,-4 (ix)
   47C5 0B            [ 6]  514 	dec	bc
   47C6 DD 7E FE      [19]  515 	ld	a,-2 (ix)
   47C9 91            [ 4]  516 	sub	a, c
   47CA 4F            [ 4]  517 	ld	c,a
   47CB DD 7E FF      [19]  518 	ld	a,-1 (ix)
   47CE 98            [ 4]  519 	sbc	a, b
   47CF 47            [ 4]  520 	ld	b,a
   47D0 C5            [11]  521 	push	bc
   47D1 CD A5 4B      [17]  522 	call	_abs
   47D4 E3            [19]  523 	ex	(sp),hl
   47D5 DD 6E F4      [19]  524 	ld	l,-12 (ix)
   47D8 DD 66 F5      [19]  525 	ld	h,-11 (ix)
   47DB E5            [11]  526 	push	hl
   47DC CD A5 4B      [17]  527 	call	_abs
   47DF F1            [10]  528 	pop	af
   47E0 C1            [10]  529 	pop	bc
   47E1 09            [11]  530 	add	hl,bc
   47E2 DD 5E E3      [19]  531 	ld	e,-29 (ix)
   47E5 DD 56 E4      [19]  532 	ld	d,-28 (ix)
   47E8 19            [11]  533 	add	hl,de
   47E9 DD 75 EB      [19]  534 	ld	-21 (ix),l
   47EC DD 74 EC      [19]  535 	ld	-20 (ix),h
                            536 ;src/pathfinding.c:98: if(resultado == 0){
   47EF DD 7E EF      [19]  537 	ld	a,-17 (ix)
   47F2 B7            [ 4]  538 	or	a, a
   47F3 20 1A         [12]  539 	jr	NZ,00145$
                            540 ;src/pathfinding.c:99: if(dist1 >= dist3)
   47F5 DD 7E E7      [19]  541 	ld	a,-25 (ix)
   47F8 DD 96 EB      [19]  542 	sub	a, -21 (ix)
   47FB DD 7E E8      [19]  543 	ld	a,-24 (ix)
   47FE DD 9E EC      [19]  544 	sbc	a, -20 (ix)
   4801 E2 06 48      [10]  545 	jp	PO, 00305$
   4804 EE 80         [ 7]  546 	xor	a, #0x80
   4806                     547 00305$:
   4806 FA 33 48      [10]  548 	jp	M,00148$
                            549 ;src/pathfinding.c:100: resultado = 2;
   4809 DD 36 EF 02   [19]  550 	ld	-17 (ix),#0x02
   480D 18 24         [12]  551 	jr	00148$
   480F                     552 00145$:
                            553 ;src/pathfinding.c:101: }else if(resultado == 1){
   480F DD 7E EF      [19]  554 	ld	a,-17 (ix)
   4812 3D            [ 4]  555 	dec	a
   4813 20 1A         [12]  556 	jr	NZ,00142$
                            557 ;src/pathfinding.c:102: if(dist2 >= dist3)
   4815 DD 7E E9      [19]  558 	ld	a,-23 (ix)
   4818 DD 96 EB      [19]  559 	sub	a, -21 (ix)
   481B DD 7E EA      [19]  560 	ld	a,-22 (ix)
   481E DD 9E EC      [19]  561 	sbc	a, -20 (ix)
   4821 E2 26 48      [10]  562 	jp	PO, 00308$
   4824 EE 80         [ 7]  563 	xor	a, #0x80
   4826                     564 00308$:
   4826 FA 33 48      [10]  565 	jp	M,00148$
                            566 ;src/pathfinding.c:103: resultado = 2;
   4829 DD 36 EF 02   [19]  567 	ld	-17 (ix),#0x02
   482D 18 04         [12]  568 	jr	00148$
   482F                     569 00142$:
                            570 ;src/pathfinding.c:105: resultado = 2;
   482F DD 36 EF 02   [19]  571 	ld	-17 (ix),#0x02
   4833                     572 00148$:
                            573 ;src/pathfinding.c:109: if(*getTilePtr(matriz, (x +1), y) <=2 &&
   4833 DD 46 04      [19]  574 	ld	b,4 (ix)
   4836 04            [ 4]  575 	inc	b
   4837 DD 7E 05      [19]  576 	ld	a,5 (ix)
   483A F5            [11]  577 	push	af
   483B 33            [ 6]  578 	inc	sp
   483C C5            [11]  579 	push	bc
   483D 33            [ 6]  580 	inc	sp
   483E DD 6E 08      [19]  581 	ld	l,8 (ix)
   4841 DD 66 09      [19]  582 	ld	h,9 (ix)
   4844 E5            [11]  583 	push	hl
   4845 CD 61 4B      [17]  584 	call	_getTilePtr
   4848 F1            [10]  585 	pop	af
   4849 F1            [10]  586 	pop	af
   484A 4E            [ 7]  587 	ld	c,(hl)
   484B 3E 02         [ 7]  588 	ld	a,#0x02
   484D 91            [ 4]  589 	sub	a, c
   484E DA 5A 49      [10]  590 	jp	C,00167$
                            591 ;src/pathfinding.c:110: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H - 2)) <=2 &&
   4851 DD 7E 04      [19]  592 	ld	a,4 (ix)
   4854 C6 05         [ 7]  593 	add	a, #0x05
   4856 47            [ 4]  594 	ld	b,a
   4857 C5            [11]  595 	push	bc
   4858 DD 7E F0      [19]  596 	ld	a,-16 (ix)
   485B F5            [11]  597 	push	af
   485C 33            [ 6]  598 	inc	sp
   485D C5            [11]  599 	push	bc
   485E 33            [ 6]  600 	inc	sp
   485F DD 6E 08      [19]  601 	ld	l,8 (ix)
   4862 DD 66 09      [19]  602 	ld	h,9 (ix)
   4865 E5            [11]  603 	push	hl
   4866 CD 61 4B      [17]  604 	call	_getTilePtr
   4869 F1            [10]  605 	pop	af
   486A F1            [10]  606 	pop	af
   486B C1            [10]  607 	pop	bc
   486C 4E            [ 7]  608 	ld	c,(hl)
   486D 3E 02         [ 7]  609 	ld	a,#0x02
   486F 91            [ 4]  610 	sub	a, c
   4870 DA 5A 49      [10]  611 	jp	C,00167$
                            612 ;src/pathfinding.c:111: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4873 DD 7E F2      [19]  613 	ld	a,-14 (ix)
   4876 F5            [11]  614 	push	af
   4877 33            [ 6]  615 	inc	sp
   4878 C5            [11]  616 	push	bc
   4879 33            [ 6]  617 	inc	sp
   487A DD 6E 08      [19]  618 	ld	l,8 (ix)
   487D DD 66 09      [19]  619 	ld	h,9 (ix)
   4880 E5            [11]  620 	push	hl
   4881 CD 61 4B      [17]  621 	call	_getTilePtr
   4884 F1            [10]  622 	pop	af
   4885 F1            [10]  623 	pop	af
   4886 4E            [ 7]  624 	ld	c,(hl)
   4887 3E 02         [ 7]  625 	ld	a,#0x02
   4889 91            [ 4]  626 	sub	a, c
   488A DA 5A 49      [10]  627 	jp	C,00167$
                            628 ;src/pathfinding.c:112: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   488D DD 7E FB      [19]  629 	ld	a,-5 (ix)
   4890 C6 01         [ 7]  630 	add	a, #0x01
   4892 DD 77 F0      [19]  631 	ld	-16 (ix),a
   4895 DD 7E FC      [19]  632 	ld	a,-4 (ix)
   4898 CE 00         [ 7]  633 	adc	a, #0x00
   489A DD 77 F1      [19]  634 	ld	-15 (ix),a
   489D DD 7E FE      [19]  635 	ld	a,-2 (ix)
   48A0 DD 96 F0      [19]  636 	sub	a, -16 (ix)
   48A3 DD 77 F0      [19]  637 	ld	-16 (ix),a
   48A6 DD 7E FF      [19]  638 	ld	a,-1 (ix)
   48A9 DD 9E F1      [19]  639 	sbc	a, -15 (ix)
   48AC DD 77 F1      [19]  640 	ld	-15 (ix),a
   48AF DD 6E F0      [19]  641 	ld	l,-16 (ix)
   48B2 DD 66 F1      [19]  642 	ld	h,-15 (ix)
   48B5 E5            [11]  643 	push	hl
   48B6 CD A5 4B      [17]  644 	call	_abs
   48B9 F1            [10]  645 	pop	af
   48BA DD 74 F1      [19]  646 	ld	-15 (ix),h
   48BD DD 75 F0      [19]  647 	ld	-16 (ix),l
   48C0 DD 6E F4      [19]  648 	ld	l,-12 (ix)
   48C3 DD 66 F5      [19]  649 	ld	h,-11 (ix)
   48C6 E5            [11]  650 	push	hl
   48C7 CD A5 4B      [17]  651 	call	_abs
   48CA F1            [10]  652 	pop	af
   48CB DD 74 F3      [19]  653 	ld	-13 (ix),h
   48CE DD 75 F2      [19]  654 	ld	-14 (ix),l
   48D1 DD 7E F0      [19]  655 	ld	a,-16 (ix)
   48D4 DD 86 F2      [19]  656 	add	a, -14 (ix)
   48D7 DD 77 F0      [19]  657 	ld	-16 (ix),a
   48DA DD 7E F1      [19]  658 	ld	a,-15 (ix)
   48DD DD 8E F3      [19]  659 	adc	a, -13 (ix)
   48E0 DD 77 F1      [19]  660 	ld	-15 (ix),a
   48E3 DD 7E F0      [19]  661 	ld	a,-16 (ix)
   48E6 DD 86 E5      [19]  662 	add	a, -27 (ix)
   48E9 DD 77 ED      [19]  663 	ld	-19 (ix),a
   48EC DD 7E F1      [19]  664 	ld	a,-15 (ix)
   48EF DD 8E E6      [19]  665 	adc	a, -26 (ix)
   48F2 DD 77 EE      [19]  666 	ld	-18 (ix),a
                            667 ;src/pathfinding.c:113: if(resultado == 0){
   48F5 DD 7E EF      [19]  668 	ld	a,-17 (ix)
   48F8 B7            [ 4]  669 	or	a, a
   48F9 20 1A         [12]  670 	jr	NZ,00164$
                            671 ;src/pathfinding.c:114: if(dist1 >= dist4)
   48FB DD 7E E7      [19]  672 	ld	a,-25 (ix)
   48FE DD 96 ED      [19]  673 	sub	a, -19 (ix)
   4901 DD 7E E8      [19]  674 	ld	a,-24 (ix)
   4904 DD 9E EE      [19]  675 	sbc	a, -18 (ix)
   4907 E2 0C 49      [10]  676 	jp	PO, 00309$
   490A EE 80         [ 7]  677 	xor	a, #0x80
   490C                     678 00309$:
   490C FA 5A 49      [10]  679 	jp	M,00167$
                            680 ;src/pathfinding.c:115: resultado = 3;
   490F DD 36 EF 03   [19]  681 	ld	-17 (ix),#0x03
   4913 18 45         [12]  682 	jr	00167$
   4915                     683 00164$:
                            684 ;src/pathfinding.c:116: }else if(resultado == 1){
   4915 DD 7E EF      [19]  685 	ld	a,-17 (ix)
   4918 3D            [ 4]  686 	dec	a
   4919 20 1A         [12]  687 	jr	NZ,00161$
                            688 ;src/pathfinding.c:117: if(dist2 >= dist4)
   491B DD 7E E9      [19]  689 	ld	a,-23 (ix)
   491E DD 96 ED      [19]  690 	sub	a, -19 (ix)
   4921 DD 7E EA      [19]  691 	ld	a,-22 (ix)
   4924 DD 9E EE      [19]  692 	sbc	a, -18 (ix)
   4927 E2 2C 49      [10]  693 	jp	PO, 00312$
   492A EE 80         [ 7]  694 	xor	a, #0x80
   492C                     695 00312$:
   492C FA 5A 49      [10]  696 	jp	M,00167$
                            697 ;src/pathfinding.c:118: resultado = 3;
   492F DD 36 EF 03   [19]  698 	ld	-17 (ix),#0x03
   4933 18 25         [12]  699 	jr	00167$
   4935                     700 00161$:
                            701 ;src/pathfinding.c:119: }else if (resultado == 2){
   4935 DD 7E EF      [19]  702 	ld	a,-17 (ix)
   4938 D6 02         [ 7]  703 	sub	a, #0x02
   493A 20 1A         [12]  704 	jr	NZ,00158$
                            705 ;src/pathfinding.c:120: if(dist3 >= dist4)
   493C DD 7E EB      [19]  706 	ld	a,-21 (ix)
   493F DD 96 ED      [19]  707 	sub	a, -19 (ix)
   4942 DD 7E EC      [19]  708 	ld	a,-20 (ix)
   4945 DD 9E EE      [19]  709 	sbc	a, -18 (ix)
   4948 E2 4D 49      [10]  710 	jp	PO, 00315$
   494B EE 80         [ 7]  711 	xor	a, #0x80
   494D                     712 00315$:
   494D FA 5A 49      [10]  713 	jp	M,00167$
                            714 ;src/pathfinding.c:121: resultado = 3;
   4950 DD 36 EF 03   [19]  715 	ld	-17 (ix),#0x03
   4954 18 04         [12]  716 	jr	00167$
   4956                     717 00158$:
                            718 ;src/pathfinding.c:123: resultado = 3;
   4956 DD 36 EF 03   [19]  719 	ld	-17 (ix),#0x03
   495A                     720 00167$:
                            721 ;src/pathfinding.c:127: return resultado;
   495A DD 6E EF      [19]  722 	ld	l,-17 (ix)
   495D DD F9         [10]  723 	ld	sp, ix
   495F DD E1         [14]  724 	pop	ix
   4961 C9            [10]  725 	ret
                            726 ;src/pathfinding.c:131: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            727 ;	---------------------------------
                            728 ; Function pathFinding
                            729 ; ---------------------------------
   4962                     730 _pathFinding::
   4962 DD E5         [15]  731 	push	ix
   4964 DD 21 00 00   [14]  732 	ld	ix,#0
   4968 DD 39         [15]  733 	add	ix,sp
   496A 21 ED FF      [10]  734 	ld	hl,#-19
   496D 39            [11]  735 	add	hl,sp
   496E F9            [ 6]  736 	ld	sp,hl
                            737 ;src/pathfinding.c:143: u8 problem = 0;
   496F DD 36 F4 00   [19]  738 	ld	-12 (ix),#0x00
                            739 ;src/pathfinding.c:145: x = s_x;
   4973 DD 7E 04      [19]  740 	ld	a,4 (ix)
   4976 DD 77 F0      [19]  741 	ld	-16 (ix),a
                            742 ;src/pathfinding.c:146: sol_tam = 0;
   4979 21 00 63      [10]  743 	ld	hl,#_sol_tam + 0
   497C 36 00         [10]  744 	ld	(hl), #0x00
                            745 ;src/pathfinding.c:147: y = s_y;
   497E DD 7E 05      [19]  746 	ld	a,5 (ix)
   4981 DD 77 EF      [19]  747 	ld	-17 (ix),a
                            748 ;src/pathfinding.c:149: k = 0;
   4984 DD 36 F1 00   [19]  749 	ld	-15 (ix),#0x00
                            750 ;src/pathfinding.c:150: aux = 1;
   4988 DD 36 EE 01   [19]  751 	ld	-18 (ix),#0x01
                            752 ;src/pathfinding.c:151: actual->longitud_camino = 0;
   498C DD 7E 08      [19]  753 	ld	a,8 (ix)
   498F DD 77 FA      [19]  754 	ld	-6 (ix),a
   4992 DD 7E 09      [19]  755 	ld	a,9 (ix)
   4995 DD 77 FB      [19]  756 	ld	-5 (ix),a
   4998 DD 7E FA      [19]  757 	ld	a,-6 (ix)
   499B C6 E2         [ 7]  758 	add	a, #0xE2
   499D DD 77 FC      [19]  759 	ld	-4 (ix),a
   49A0 DD 7E FB      [19]  760 	ld	a,-5 (ix)
   49A3 CE 00         [ 7]  761 	adc	a, #0x00
   49A5 DD 77 FD      [19]  762 	ld	-3 (ix),a
   49A8 DD 6E FC      [19]  763 	ld	l,-4 (ix)
   49AB DD 66 FD      [19]  764 	ld	h,-3 (ix)
   49AE 36 00         [10]  765 	ld	(hl),#0x00
                            766 ;src/pathfinding.c:152: inserted = anyadirALista(x, y);
   49B0 DD 66 EF      [19]  767 	ld	h,-17 (ix)
   49B3 DD 6E F0      [19]  768 	ld	l,-16 (ix)
   49B6 E5            [11]  769 	push	hl
   49B7 CD 4C 44      [17]  770 	call	_anyadirALista
   49BA F1            [10]  771 	pop	af
   49BB DD 75 F3      [19]  772 	ld	-13 (ix),l
                            773 ;src/pathfinding.c:155: if(!(x == f_x && y == f_y) ){
   49BE DD 7E 06      [19]  774 	ld	a,6 (ix)
   49C1 DD 96 F0      [19]  775 	sub	a, -16 (ix)
   49C4 20 09         [12]  776 	jr	NZ,00114$
   49C6 DD 7E 07      [19]  777 	ld	a,7 (ix)
   49C9 DD 96 EF      [19]  778 	sub	a, -17 (ix)
   49CC CA D6 4A      [10]  779 	jp	Z,00118$
                            780 ;src/pathfinding.c:156: while (aux){
   49CF                     781 00114$:
   49CF DD 7E EE      [19]  782 	ld	a,-18 (ix)
   49D2 B7            [ 4]  783 	or	a, a
   49D3 CA DA 4A      [10]  784 	jp	Z,00119$
                            785 ;src/pathfinding.c:157: if( (x == f_x && y == f_y) || inserted == 0){
   49D6 DD 7E 06      [19]  786 	ld	a,6 (ix)
   49D9 DD 96 F0      [19]  787 	sub	a, -16 (ix)
   49DC 20 08         [12]  788 	jr	NZ,00113$
   49DE DD 7E 07      [19]  789 	ld	a,7 (ix)
   49E1 DD 96 EF      [19]  790 	sub	a, -17 (ix)
   49E4 28 06         [12]  791 	jr	Z,00109$
   49E6                     792 00113$:
   49E6 DD 7E F3      [19]  793 	ld	a,-13 (ix)
   49E9 B7            [ 4]  794 	or	a, a
   49EA 20 16         [12]  795 	jr	NZ,00110$
   49EC                     796 00109$:
                            797 ;src/pathfinding.c:159: if(inserted == 0 || sol_tam == 0){
   49EC DD 7E F3      [19]  798 	ld	a,-13 (ix)
   49EF B7            [ 4]  799 	or	a, a
   49F0 28 06         [12]  800 	jr	Z,00101$
   49F2 3A 00 63      [13]  801 	ld	a,(#_sol_tam + 0)
   49F5 B7            [ 4]  802 	or	a, a
   49F6 20 04         [12]  803 	jr	NZ,00102$
   49F8                     804 00101$:
                            805 ;src/pathfinding.c:160: problem = 1;
   49F8 DD 36 F4 01   [19]  806 	ld	-12 (ix),#0x01
   49FC                     807 00102$:
                            808 ;src/pathfinding.c:163: aux = 0;
   49FC DD 36 EE 00   [19]  809 	ld	-18 (ix),#0x00
   4A00 18 CD         [12]  810 	jr	00114$
   4A02                     811 00110$:
                            812 ;src/pathfinding.c:165: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   4A02 DD 6E 0A      [19]  813 	ld	l,10 (ix)
   4A05 DD 66 0B      [19]  814 	ld	h,11 (ix)
   4A08 E5            [11]  815 	push	hl
   4A09 DD 66 07      [19]  816 	ld	h,7 (ix)
   4A0C DD 6E 06      [19]  817 	ld	l,6 (ix)
   4A0F E5            [11]  818 	push	hl
   4A10 DD 66 EF      [19]  819 	ld	h,-17 (ix)
   4A13 DD 6E F0      [19]  820 	ld	l,-16 (ix)
   4A16 E5            [11]  821 	push	hl
   4A17 CD 84 44      [17]  822 	call	_adjacentTiles
   4A1A F1            [10]  823 	pop	af
   4A1B F1            [10]  824 	pop	af
   4A1C F1            [10]  825 	pop	af
   4A1D DD 75 F2      [19]  826 	ld	-14 (ix),l
                            827 ;src/pathfinding.c:167: switch(movimiento){
   4A20 3E 03         [ 7]  828 	ld	a,#0x03
   4A22 DD 96 F2      [19]  829 	sub	a, -14 (ix)
   4A25 38 A8         [12]  830 	jr	C,00114$
                            831 ;src/pathfinding.c:171: k = k+2;
   4A27 DD 7E F1      [19]  832 	ld	a,-15 (ix)
   4A2A C6 02         [ 7]  833 	add	a, #0x02
   4A2C DD 77 F9      [19]  834 	ld	-7 (ix),a
                            835 ;src/pathfinding.c:167: switch(movimiento){
   4A2F DD 5E F2      [19]  836 	ld	e,-14 (ix)
   4A32 16 00         [ 7]  837 	ld	d,#0x00
   4A34 21 3A 4A      [10]  838 	ld	hl,#00180$
   4A37 19            [11]  839 	add	hl,de
   4A38 19            [11]  840 	add	hl,de
                            841 ;src/pathfinding.c:168: case 0:
   4A39 E9            [ 4]  842 	jp	(hl)
   4A3A                     843 00180$:
   4A3A 18 06         [12]  844 	jr	00104$
   4A3C 18 2C         [12]  845 	jr	00105$
   4A3E 18 52         [12]  846 	jr	00106$
   4A40 18 70         [12]  847 	jr	00107$
   4A42                     848 00104$:
                            849 ;src/pathfinding.c:169: inserted = anyadirALista(x, y-2);
   4A42 DD 7E EF      [19]  850 	ld	a,-17 (ix)
   4A45 C6 FE         [ 7]  851 	add	a,#0xFE
   4A47 DD 77 F8      [19]  852 	ld	-8 (ix), a
   4A4A F5            [11]  853 	push	af
   4A4B 33            [ 6]  854 	inc	sp
   4A4C DD 7E F0      [19]  855 	ld	a,-16 (ix)
   4A4F F5            [11]  856 	push	af
   4A50 33            [ 6]  857 	inc	sp
   4A51 CD 4C 44      [17]  858 	call	_anyadirALista
   4A54 F1            [10]  859 	pop	af
   4A55 DD 75 F5      [19]  860 	ld	-11 (ix), l
   4A58 DD 75 F3      [19]  861 	ld	-13 (ix), l
                            862 ;src/pathfinding.c:170: y = y-2;
   4A5B DD 4E F8      [19]  863 	ld	c,-8 (ix)
   4A5E DD 71 EF      [19]  864 	ld	-17 (ix),c
                            865 ;src/pathfinding.c:171: k = k+2;
   4A61 DD 7E F9      [19]  866 	ld	a,-7 (ix)
   4A64 DD 77 F1      [19]  867 	ld	-15 (ix),a
                            868 ;src/pathfinding.c:172: break;
   4A67 C3 CF 49      [10]  869 	jp	00114$
                            870 ;src/pathfinding.c:173: case 1:
   4A6A                     871 00105$:
                            872 ;src/pathfinding.c:176: inserted = anyadirALista(x, y+2);
   4A6A DD 7E EF      [19]  873 	ld	a,-17 (ix)
   4A6D C6 02         [ 7]  874 	add	a, #0x02
   4A6F DD 77 F5      [19]  875 	ld	-11 (ix), a
   4A72 F5            [11]  876 	push	af
   4A73 33            [ 6]  877 	inc	sp
   4A74 DD 7E F0      [19]  878 	ld	a,-16 (ix)
   4A77 F5            [11]  879 	push	af
   4A78 33            [ 6]  880 	inc	sp
   4A79 CD 4C 44      [17]  881 	call	_anyadirALista
   4A7C F1            [10]  882 	pop	af
   4A7D DD 75 F8      [19]  883 	ld	-8 (ix), l
   4A80 DD 75 F3      [19]  884 	ld	-13 (ix), l
                            885 ;src/pathfinding.c:177: y = y+2;
   4A83 DD 4E F5      [19]  886 	ld	c,-11 (ix)
   4A86 DD 71 EF      [19]  887 	ld	-17 (ix),c
                            888 ;src/pathfinding.c:178: k = k+2;
   4A89 DD 7E F9      [19]  889 	ld	a,-7 (ix)
   4A8C DD 77 F1      [19]  890 	ld	-15 (ix),a
                            891 ;src/pathfinding.c:179: break;
   4A8F C3 CF 49      [10]  892 	jp	00114$
                            893 ;src/pathfinding.c:180: case 2:
   4A92                     894 00106$:
                            895 ;src/pathfinding.c:183: inserted = anyadirALista(x-1, y);
   4A92 DD 46 F0      [19]  896 	ld	b,-16 (ix)
   4A95 05            [ 4]  897 	dec	b
   4A96 C5            [11]  898 	push	bc
   4A97 DD 7E EF      [19]  899 	ld	a,-17 (ix)
   4A9A F5            [11]  900 	push	af
   4A9B 33            [ 6]  901 	inc	sp
   4A9C C5            [11]  902 	push	bc
   4A9D 33            [ 6]  903 	inc	sp
   4A9E CD 4C 44      [17]  904 	call	_anyadirALista
   4AA1 F1            [10]  905 	pop	af
   4AA2 C1            [10]  906 	pop	bc
   4AA3 DD 75 F3      [19]  907 	ld	-13 (ix),l
                            908 ;src/pathfinding.c:184: x = x-1;
   4AA6 DD 70 F0      [19]  909 	ld	-16 (ix),b
                            910 ;src/pathfinding.c:185: k = k+2;
   4AA9 DD 7E F9      [19]  911 	ld	a,-7 (ix)
   4AAC DD 77 F1      [19]  912 	ld	-15 (ix),a
                            913 ;src/pathfinding.c:186: break;
   4AAF C3 CF 49      [10]  914 	jp	00114$
                            915 ;src/pathfinding.c:187: case 3:
   4AB2                     916 00107$:
                            917 ;src/pathfinding.c:188: inserted = anyadirALista(x+1, y);
   4AB2 DD 7E F0      [19]  918 	ld	a,-16 (ix)
   4AB5 3C            [ 4]  919 	inc	a
   4AB6 DD 77 F5      [19]  920 	ld	-11 (ix),a
   4AB9 DD 66 EF      [19]  921 	ld	h,-17 (ix)
   4ABC DD 6E F5      [19]  922 	ld	l,-11 (ix)
   4ABF E5            [11]  923 	push	hl
   4AC0 CD 4C 44      [17]  924 	call	_anyadirALista
   4AC3 F1            [10]  925 	pop	af
   4AC4 DD 75 F3      [19]  926 	ld	-13 (ix),l
                            927 ;src/pathfinding.c:189: x = x+1;
   4AC7 DD 7E F5      [19]  928 	ld	a,-11 (ix)
   4ACA DD 77 F0      [19]  929 	ld	-16 (ix),a
                            930 ;src/pathfinding.c:190: k = k+2;
   4ACD DD 7E F9      [19]  931 	ld	a,-7 (ix)
   4AD0 DD 77 F1      [19]  932 	ld	-15 (ix),a
                            933 ;src/pathfinding.c:193: }
   4AD3 C3 CF 49      [10]  934 	jp	00114$
   4AD6                     935 00118$:
                            936 ;src/pathfinding.c:198: problem = 1;
   4AD6 DD 36 F4 01   [19]  937 	ld	-12 (ix),#0x01
   4ADA                     938 00119$:
                            939 ;src/pathfinding.c:200: if(problem == 0){
   4ADA DD 7E F4      [19]  940 	ld	a,-12 (ix)
   4ADD B7            [ 4]  941 	or	a, a
   4ADE 20 74         [12]  942 	jr	NZ,00126$
                            943 ;src/pathfinding.c:201: if(sol_tam < CAMINO_TAM){
   4AE0 3A 00 63      [13]  944 	ld	a,(#_sol_tam + 0)
   4AE3 D6 C8         [ 7]  945 	sub	a, #0xC8
   4AE5 30 0C         [12]  946 	jr	NC,00122$
                            947 ;src/pathfinding.c:202: actual->longitud_camino = sol_tam;
   4AE7 DD 6E FC      [19]  948 	ld	l,-4 (ix)
   4AEA DD 66 FD      [19]  949 	ld	h,-3 (ix)
   4AED 3A 00 63      [13]  950 	ld	a,(#_sol_tam + 0)
   4AF0 77            [ 7]  951 	ld	(hl),a
   4AF1 18 08         [12]  952 	jr	00142$
   4AF3                     953 00122$:
                            954 ;src/pathfinding.c:204: actual->longitud_camino = CAMINO_TAM;
   4AF3 DD 6E FC      [19]  955 	ld	l,-4 (ix)
   4AF6 DD 66 FD      [19]  956 	ld	h,-3 (ix)
   4AF9 36 C8         [10]  957 	ld	(hl),#0xC8
                            958 ;src/pathfinding.c:206: for (i; i<actual->longitud_camino; i++){
   4AFB                     959 00142$:
   4AFB DD 7E FA      [19]  960 	ld	a,-6 (ix)
   4AFE C6 1A         [ 7]  961 	add	a, #0x1A
   4B00 DD 77 FA      [19]  962 	ld	-6 (ix),a
   4B03 DD 7E FB      [19]  963 	ld	a,-5 (ix)
   4B06 CE 00         [ 7]  964 	adc	a, #0x00
   4B08 DD 77 FB      [19]  965 	ld	-5 (ix),a
   4B0B DD 36 ED 00   [19]  966 	ld	-19 (ix),#0x00
   4B0F                     967 00129$:
   4B0F DD 6E FC      [19]  968 	ld	l,-4 (ix)
   4B12 DD 66 FD      [19]  969 	ld	h,-3 (ix)
   4B15 DD 7E ED      [19]  970 	ld	a,-19 (ix)
   4B18 96            [ 7]  971 	sub	a,(hl)
   4B19 30 41         [12]  972 	jr	NC,00131$
                            973 ;src/pathfinding.c:207: actual->camino[i] = camino[i];
   4B1B DD 7E ED      [19]  974 	ld	a,-19 (ix)
   4B1E DD 86 FA      [19]  975 	add	a, -6 (ix)
   4B21 DD 77 F6      [19]  976 	ld	-10 (ix),a
   4B24 3E 00         [ 7]  977 	ld	a,#0x00
   4B26 DD 8E FB      [19]  978 	adc	a, -5 (ix)
   4B29 DD 77 F7      [19]  979 	ld	-9 (ix),a
   4B2C 3E 01         [ 7]  980 	ld	a,#<(_camino)
   4B2E DD 86 ED      [19]  981 	add	a, -19 (ix)
   4B31 DD 77 FE      [19]  982 	ld	-2 (ix),a
   4B34 3E 63         [ 7]  983 	ld	a,#>(_camino)
   4B36 CE 00         [ 7]  984 	adc	a, #0x00
   4B38 DD 77 FF      [19]  985 	ld	-1 (ix),a
   4B3B DD 6E FE      [19]  986 	ld	l,-2 (ix)
   4B3E DD 66 FF      [19]  987 	ld	h,-1 (ix)
   4B41 7E            [ 7]  988 	ld	a,(hl)
   4B42 DD 77 FE      [19]  989 	ld	-2 (ix),a
   4B45 DD 6E F6      [19]  990 	ld	l,-10 (ix)
   4B48 DD 66 F7      [19]  991 	ld	h,-9 (ix)
   4B4B DD 7E FE      [19]  992 	ld	a,-2 (ix)
   4B4E 77            [ 7]  993 	ld	(hl),a
                            994 ;src/pathfinding.c:206: for (i; i<actual->longitud_camino; i++){
   4B4F DD 34 ED      [23]  995 	inc	-19 (ix)
   4B52 18 BB         [12]  996 	jr	00129$
   4B54                     997 00126$:
                            998 ;src/pathfinding.c:211: actual->longitud_camino = 0;
   4B54 DD 6E FC      [19]  999 	ld	l,-4 (ix)
   4B57 DD 66 FD      [19] 1000 	ld	h,-3 (ix)
   4B5A 36 00         [10] 1001 	ld	(hl),#0x00
   4B5C                    1002 00131$:
   4B5C DD F9         [10] 1003 	ld	sp, ix
   4B5E DD E1         [14] 1004 	pop	ix
   4B60 C9            [10] 1005 	ret
                           1006 	.area _CODE
                           1007 	.area _INITIALIZER
                           1008 	.area _CABS (ABS)
