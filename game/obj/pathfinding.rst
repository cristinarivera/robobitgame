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
   5F7C                      26 _sol_tam::
   5F7C                      27 	.ds 1
   5F7D                      28 _camino::
   5F7D                      29 	.ds 200
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
   43F1 3A 7C 5F      [13]   62 	ld	a,(#_sol_tam + 0)
   43F4 D6 C8         [ 7]   63 	sub	a, #0xC8
   43F6 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   43F8 01 7D 5F      [10]   66 	ld	bc,#_camino+0
   43FB 2A 7C 5F      [16]   67 	ld	hl,(_sol_tam)
   43FE 26 00         [ 7]   68 	ld	h,#0x00
   4400 09            [11]   69 	add	hl,bc
   4401 FD 21 02 00   [14]   70 	ld	iy,#2
   4405 FD 39         [15]   71 	add	iy,sp
   4407 FD 7E 00      [19]   72 	ld	a,0 (iy)
   440A 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   440B 21 7C 5F      [10]   75 	ld	hl, #_sol_tam+0
   440E 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   440F 2A 7C 5F      [16]   78 	ld	hl,(_sol_tam)
   4412 26 00         [ 7]   79 	ld	h,#0x00
   4414 09            [11]   80 	add	hl,bc
   4415 FD 21 03 00   [14]   81 	ld	iy,#3
   4419 FD 39         [15]   82 	add	iy,sp
   441B FD 7E 00      [19]   83 	ld	a,0 (iy)
   441E 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   441F 21 7C 5F      [10]   86 	ld	hl, #_sol_tam+0
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
   4450 DD 36 E7 00   [19]  120 	ld	-25 (ix),#0x00
   4454 DD 36 E8 00   [19]  121 	ld	-24 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   4458 DD 36 E9 00   [19]  123 	ld	-23 (ix),#0x00
   445C DD 36 EA 00   [19]  124 	ld	-22 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   4460 DD 36 ED 00   [19]  126 	ld	-19 (ix),#0x00
   4464 DD 36 EE 00   [19]  127 	ld	-18 (ix),#0x00
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   4468 DD 36 E5 00   [19]  129 	ld	-27 (ix),#0x00
   446C DD 36 E6 00   [19]  130 	ld	-26 (ix),#0x00
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
   4470 21 00 00      [10]  132 	ld	hl,#0x0000
   4473 E3            [19]  133 	ex	(sp), hl
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   4474 DD 36 E3 00   [19]  135 	ld	-29 (ix),#0x00
   4478 DD 36 E4 00   [19]  136 	ld	-28 (ix),#0x00
                            137 ;src/pathfinding.c:43: if(y < f_y)
   447C DD 7E 05      [19]  138 	ld	a,5 (ix)
   447F DD 96 07      [19]  139 	sub	a, 7 (ix)
   4482 3E 00         [ 7]  140 	ld	a,#0x00
   4484 17            [ 4]  141 	rla
   4485 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   4486 DD 7E 04      [19]  144 	ld	a,4 (ix)
   4489 DD 96 06      [19]  145 	sub	a, 6 (ix)
   448C 20 1B         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   448E 79            [ 4]  148 	ld	a,c
   448F B7            [ 4]  149 	or	a, a
   4490 28 08         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
   4492 DD 36 E3 FF   [19]  152 	ld	-29 (ix),#0xFF
   4496 DD 36 E4 FF   [19]  153 	ld	-28 (ix),#0xFF
   449A                     154 00102$:
                            155 ;src/pathfinding.c:46: if(y > f_y)
   449A DD 7E 07      [19]  156 	ld	a,7 (ix)
   449D DD 96 05      [19]  157 	sub	a, 5 (ix)
   44A0 30 7B         [12]  158 	jr	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
   44A2 21 FF FF      [10]  160 	ld	hl,#0xFFFF
   44A5 E3            [19]  161 	ex	(sp), hl
   44A6 C3 1D 45      [10]  162 	jp	00125$
   44A9                     163 00124$:
                            164 ;src/pathfinding.c:51: if(x < f_x)
   44A9 DD 7E 04      [19]  165 	ld	a,4 (ix)
   44AC DD 96 06      [19]  166 	sub	a, 6 (ix)
   44AF 3E 00         [ 7]  167 	ld	a,#0x00
   44B1 17            [ 4]  168 	rla
   44B2 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   44B3 DD 7E 06      [19]  171 	ld	a,6 (ix)
   44B6 DD 96 04      [19]  172 	sub	a, 4 (ix)
   44B9 3E 00         [ 7]  173 	ld	a,#0x00
   44BB 17            [ 4]  174 	rla
   44BC 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   44BD DD 7E 05      [19]  177 	ld	a,5 (ix)
   44C0 DD 96 07      [19]  178 	sub	a, 7 (ix)
   44C3 20 1A         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   44C5 78            [ 4]  181 	ld	a,b
   44C6 B7            [ 4]  182 	or	a, a
   44C7 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
   44C9 DD 36 ED FF   [19]  185 	ld	-19 (ix),#0xFF
   44CD DD 36 EE FF   [19]  186 	ld	-18 (ix),#0xFF
   44D1                     187 00106$:
                            188 ;src/pathfinding.c:53: if(x > f_x)
   44D1 7B            [ 4]  189 	ld	a,e
   44D2 B7            [ 4]  190 	or	a, a
   44D3 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   44D5 DD 36 E5 FF   [19]  193 	ld	-27 (ix),#0xFF
   44D9 DD 36 E6 FF   [19]  194 	ld	-26 (ix),#0xFF
   44DD 18 3E         [12]  195 	jr	00125$
   44DF                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   44DF 78            [ 4]  198 	ld	a,b
   44E0 B7            [ 4]  199 	or	a, a
   44E1 28 1C         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   44E3 79            [ 4]  202 	ld	a,c
   44E4 B7            [ 4]  203 	or	a, a
   44E5 28 0A         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
   44E7 DD 36 E3 FF   [19]  206 	ld	-29 (ix),#0xFF
   44EB DD 36 E4 FF   [19]  207 	ld	-28 (ix),#0xFF
   44EF 18 04         [12]  208 	jr	00111$
   44F1                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   44F1 21 FF FF      [10]  211 	ld	hl,#0xFFFF
   44F4 E3            [19]  212 	ex	(sp), hl
   44F5                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   44F5 DD 36 ED FF   [19]  215 	ld	-19 (ix),#0xFF
   44F9 DD 36 EE FF   [19]  216 	ld	-18 (ix),#0xFF
   44FD 18 1E         [12]  217 	jr	00125$
   44FF                     218 00118$:
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   44FF 7B            [ 4]  220 	ld	a,e
   4500 B7            [ 4]  221 	or	a, a
   4501 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   4503 79            [ 4]  224 	ld	a,c
   4504 B7            [ 4]  225 	or	a, a
   4505 28 0A         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
   4507 DD 36 E3 FF   [19]  228 	ld	-29 (ix),#0xFF
   450B DD 36 E4 FF   [19]  229 	ld	-28 (ix),#0xFF
   450F 18 04         [12]  230 	jr	00114$
   4511                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4511 21 FF FF      [10]  233 	ld	hl,#0xFFFF
   4514 E3            [19]  234 	ex	(sp), hl
   4515                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   4515 DD 36 E5 FF   [19]  237 	ld	-27 (ix),#0xFF
   4519 DD 36 E6 FF   [19]  238 	ld	-26 (ix),#0xFF
   451D                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   451D DD 46 05      [19]  241 	ld	b,5 (ix)
   4520 05            [ 4]  242 	dec	b
   4521 05            [ 4]  243 	dec	b
   4522 C5            [11]  244 	push	bc
   4523 33            [ 6]  245 	inc	sp
   4524 DD 7E 04      [19]  246 	ld	a,4 (ix)
   4527 F5            [11]  247 	push	af
   4528 33            [ 6]  248 	inc	sp
   4529 DD 6E 08      [19]  249 	ld	l,8 (ix)
   452C DD 66 09      [19]  250 	ld	h,9 (ix)
   452F E5            [11]  251 	push	hl
   4530 CD B5 49      [17]  252 	call	_getTilePtr
   4533 F1            [10]  253 	pop	af
   4534 F1            [10]  254 	pop	af
   4535 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4536 DD 7E 06      [19]  257 	ld	a,6 (ix)
   4539 DD 77 F6      [19]  258 	ld	-10 (ix),a
   453C DD 36 F7 00   [19]  259 	ld	-9 (ix),#0x00
   4540 DD 7E 04      [19]  260 	ld	a,4 (ix)
   4543 DD 77 F4      [19]  261 	ld	-12 (ix),a
   4546 DD 36 F5 00   [19]  262 	ld	-11 (ix),#0x00
   454A DD 7E 07      [19]  263 	ld	a,7 (ix)
   454D DD 77 F2      [19]  264 	ld	-14 (ix),a
   4550 DD 36 F3 00   [19]  265 	ld	-13 (ix),#0x00
   4554 DD 7E 05      [19]  266 	ld	a,5 (ix)
   4557 DD 77 FA      [19]  267 	ld	-6 (ix),a
   455A DD 36 FB 00   [19]  268 	ld	-5 (ix),#0x00
   455E DD 7E F6      [19]  269 	ld	a,-10 (ix)
   4561 DD 96 F4      [19]  270 	sub	a, -12 (ix)
   4564 DD 77 F8      [19]  271 	ld	-8 (ix),a
   4567 DD 7E F7      [19]  272 	ld	a,-9 (ix)
   456A DD 9E F5      [19]  273 	sbc	a, -11 (ix)
   456D DD 77 F9      [19]  274 	ld	-7 (ix),a
                            275 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   4570 3E 02         [ 7]  276 	ld	a,#0x02
   4572 91            [ 4]  277 	sub	a, c
   4573 38 62         [12]  278 	jr	C,00127$
                            279 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4575 DD 6E F8      [19]  280 	ld	l,-8 (ix)
   4578 DD 66 F9      [19]  281 	ld	h,-7 (ix)
   457B E5            [11]  282 	push	hl
   457C CD F9 49      [17]  283 	call	_abs
   457F F1            [10]  284 	pop	af
   4580 DD 74 FF      [19]  285 	ld	-1 (ix),h
   4583 DD 75 FE      [19]  286 	ld	-2 (ix),l
   4586 DD 4E FA      [19]  287 	ld	c,-6 (ix)
   4589 DD 46 FB      [19]  288 	ld	b,-5 (ix)
   458C 0B            [ 6]  289 	dec	bc
   458D 0B            [ 6]  290 	dec	bc
   458E DD 7E F2      [19]  291 	ld	a,-14 (ix)
   4591 91            [ 4]  292 	sub	a, c
   4592 4F            [ 4]  293 	ld	c,a
   4593 DD 7E F3      [19]  294 	ld	a,-13 (ix)
   4596 98            [ 4]  295 	sbc	a, b
   4597 47            [ 4]  296 	ld	b,a
   4598 C5            [11]  297 	push	bc
   4599 CD F9 49      [17]  298 	call	_abs
   459C F1            [10]  299 	pop	af
   459D DD 74 FD      [19]  300 	ld	-3 (ix),h
   45A0 DD 75 FC      [19]  301 	ld	-4 (ix),l
   45A3 DD 7E FE      [19]  302 	ld	a,-2 (ix)
   45A6 DD 86 FC      [19]  303 	add	a, -4 (ix)
   45A9 DD 77 FC      [19]  304 	ld	-4 (ix),a
   45AC DD 7E FF      [19]  305 	ld	a,-1 (ix)
   45AF DD 8E FD      [19]  306 	adc	a, -3 (ix)
   45B2 DD 77 FD      [19]  307 	ld	-3 (ix),a
   45B5 DD 7E FC      [19]  308 	ld	a,-4 (ix)
   45B8 DD 86 E1      [19]  309 	add	a, -31 (ix)
   45BB DD 77 FC      [19]  310 	ld	-4 (ix),a
   45BE DD 7E FD      [19]  311 	ld	a,-3 (ix)
   45C1 DD 8E E2      [19]  312 	adc	a, -30 (ix)
   45C4 DD 77 FD      [19]  313 	ld	-3 (ix),a
   45C7 DD 7E FC      [19]  314 	ld	a,-4 (ix)
   45CA DD 77 EF      [19]  315 	ld	-17 (ix),a
   45CD DD 7E FD      [19]  316 	ld	a,-3 (ix)
   45D0 DD 77 F0      [19]  317 	ld	-16 (ix),a
                            318 ;src/pathfinding.c:81: resultado = 0;
   45D3 DD 36 F1 00   [19]  319 	ld	-15 (ix),#0x00
   45D7                     320 00127$:
                            321 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, (y + G_ENEMY_H)) <=2 /*&&
   45D7 DD 7E 05      [19]  322 	ld	a,5 (ix)
   45DA C6 16         [ 7]  323 	add	a, #0x16
   45DC 47            [ 4]  324 	ld	b,a
   45DD C5            [11]  325 	push	bc
   45DE 33            [ 6]  326 	inc	sp
   45DF DD 7E 04      [19]  327 	ld	a,4 (ix)
   45E2 F5            [11]  328 	push	af
   45E3 33            [ 6]  329 	inc	sp
   45E4 DD 6E 08      [19]  330 	ld	l,8 (ix)
   45E7 DD 66 09      [19]  331 	ld	h,9 (ix)
   45EA E5            [11]  332 	push	hl
   45EB CD B5 49      [17]  333 	call	_getTilePtr
   45EE F1            [10]  334 	pop	af
   45EF F1            [10]  335 	pop	af
   45F0 4E            [ 7]  336 	ld	c,(hl)
   45F1 3E 02         [ 7]  337 	ld	a,#0x02
   45F3 91            [ 4]  338 	sub	a, c
   45F4 DA 8F 46      [10]  339 	jp	C,00134$
                            340 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   45F7 DD 6E F8      [19]  341 	ld	l,-8 (ix)
   45FA DD 66 F9      [19]  342 	ld	h,-7 (ix)
   45FD E5            [11]  343 	push	hl
   45FE CD F9 49      [17]  344 	call	_abs
   4601 F1            [10]  345 	pop	af
   4602 DD 74 FD      [19]  346 	ld	-3 (ix),h
   4605 DD 75 FC      [19]  347 	ld	-4 (ix),l
   4608 DD 7E FA      [19]  348 	ld	a,-6 (ix)
   460B C6 02         [ 7]  349 	add	a, #0x02
   460D DD 77 FE      [19]  350 	ld	-2 (ix),a
   4610 DD 7E FB      [19]  351 	ld	a,-5 (ix)
   4613 CE 00         [ 7]  352 	adc	a, #0x00
   4615 DD 77 FF      [19]  353 	ld	-1 (ix),a
   4618 DD 7E F2      [19]  354 	ld	a,-14 (ix)
   461B DD 96 FE      [19]  355 	sub	a, -2 (ix)
   461E DD 77 FE      [19]  356 	ld	-2 (ix),a
   4621 DD 7E F3      [19]  357 	ld	a,-13 (ix)
   4624 DD 9E FF      [19]  358 	sbc	a, -1 (ix)
   4627 DD 77 FF      [19]  359 	ld	-1 (ix),a
   462A DD 6E FE      [19]  360 	ld	l,-2 (ix)
   462D DD 66 FF      [19]  361 	ld	h,-1 (ix)
   4630 E5            [11]  362 	push	hl
   4631 CD F9 49      [17]  363 	call	_abs
   4634 F1            [10]  364 	pop	af
   4635 DD 74 FF      [19]  365 	ld	-1 (ix),h
   4638 DD 75 FE      [19]  366 	ld	-2 (ix),l
   463B DD 7E FC      [19]  367 	ld	a,-4 (ix)
   463E DD 86 FE      [19]  368 	add	a, -2 (ix)
   4641 DD 77 FC      [19]  369 	ld	-4 (ix),a
   4644 DD 7E FD      [19]  370 	ld	a,-3 (ix)
   4647 DD 8E FF      [19]  371 	adc	a, -1 (ix)
   464A DD 77 FD      [19]  372 	ld	-3 (ix),a
   464D DD 7E E3      [19]  373 	ld	a,-29 (ix)
   4650 DD 86 FC      [19]  374 	add	a, -4 (ix)
   4653 DD 77 FC      [19]  375 	ld	-4 (ix),a
   4656 DD 7E E4      [19]  376 	ld	a,-28 (ix)
   4659 DD 8E FD      [19]  377 	adc	a, -3 (ix)
   465C DD 77 FD      [19]  378 	ld	-3 (ix),a
   465F DD 7E FC      [19]  379 	ld	a,-4 (ix)
   4662 DD 77 E7      [19]  380 	ld	-25 (ix),a
   4665 DD 7E FD      [19]  381 	ld	a,-3 (ix)
   4668 DD 77 E8      [19]  382 	ld	-24 (ix),a
                            383 ;src/pathfinding.c:87: if(resultado == 0){
   466B DD 7E F1      [19]  384 	ld	a,-15 (ix)
   466E B7            [ 4]  385 	or	a, a
   466F 20 1A         [12]  386 	jr	NZ,00131$
                            387 ;src/pathfinding.c:88: if(dist1 > dist2)
   4671 DD 7E E7      [19]  388 	ld	a,-25 (ix)
   4674 DD 96 EF      [19]  389 	sub	a, -17 (ix)
   4677 DD 7E E8      [19]  390 	ld	a,-24 (ix)
   467A DD 9E F0      [19]  391 	sbc	a, -16 (ix)
   467D E2 82 46      [10]  392 	jp	PO, 00274$
   4680 EE 80         [ 7]  393 	xor	a, #0x80
   4682                     394 00274$:
   4682 F2 8F 46      [10]  395 	jp	P,00134$
                            396 ;src/pathfinding.c:89: resultado = 1;
   4685 DD 36 F1 01   [19]  397 	ld	-15 (ix),#0x01
   4689 18 04         [12]  398 	jr	00134$
   468B                     399 00131$:
                            400 ;src/pathfinding.c:91: resultado = 1;
   468B DD 36 F1 01   [19]  401 	ld	-15 (ix),#0x01
   468F                     402 00134$:
                            403 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   468F DD 46 04      [19]  404 	ld	b,4 (ix)
   4692 05            [ 4]  405 	dec	b
   4693 DD 7E 05      [19]  406 	ld	a,5 (ix)
   4696 F5            [11]  407 	push	af
   4697 33            [ 6]  408 	inc	sp
   4698 C5            [11]  409 	push	bc
   4699 33            [ 6]  410 	inc	sp
   469A DD 6E 08      [19]  411 	ld	l,8 (ix)
   469D DD 66 09      [19]  412 	ld	h,9 (ix)
   46A0 E5            [11]  413 	push	hl
   46A1 CD B5 49      [17]  414 	call	_getTilePtr
   46A4 F1            [10]  415 	pop	af
   46A5 F1            [10]  416 	pop	af
   46A6 4E            [ 7]  417 	ld	c,(hl)
                            418 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   46A7 DD 7E F2      [19]  419 	ld	a,-14 (ix)
   46AA DD 96 FA      [19]  420 	sub	a, -6 (ix)
   46AD DD 77 FC      [19]  421 	ld	-4 (ix),a
   46B0 DD 7E F3      [19]  422 	ld	a,-13 (ix)
   46B3 DD 9E FB      [19]  423 	sbc	a, -5 (ix)
   46B6 DD 77 FD      [19]  424 	ld	-3 (ix),a
                            425 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   46B9 3E 02         [ 7]  426 	ld	a,#0x02
   46BB 91            [ 4]  427 	sub	a, c
   46BC 38 74         [12]  428 	jr	C,00146$
                            429 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   46BE DD 4E F4      [19]  430 	ld	c,-12 (ix)
   46C1 DD 46 F5      [19]  431 	ld	b,-11 (ix)
   46C4 0B            [ 6]  432 	dec	bc
   46C5 DD 7E F6      [19]  433 	ld	a,-10 (ix)
   46C8 91            [ 4]  434 	sub	a, c
   46C9 4F            [ 4]  435 	ld	c,a
   46CA DD 7E F7      [19]  436 	ld	a,-9 (ix)
   46CD 98            [ 4]  437 	sbc	a, b
   46CE 47            [ 4]  438 	ld	b,a
   46CF C5            [11]  439 	push	bc
   46D0 CD F9 49      [17]  440 	call	_abs
   46D3 E3            [19]  441 	ex	(sp),hl
   46D4 DD 6E FC      [19]  442 	ld	l,-4 (ix)
   46D7 DD 66 FD      [19]  443 	ld	h,-3 (ix)
   46DA E5            [11]  444 	push	hl
   46DB CD F9 49      [17]  445 	call	_abs
   46DE F1            [10]  446 	pop	af
   46DF C1            [10]  447 	pop	bc
   46E0 09            [11]  448 	add	hl,bc
   46E1 DD 5E E5      [19]  449 	ld	e,-27 (ix)
   46E4 DD 56 E6      [19]  450 	ld	d,-26 (ix)
   46E7 19            [11]  451 	add	hl,de
   46E8 DD 75 E9      [19]  452 	ld	-23 (ix),l
   46EB DD 74 EA      [19]  453 	ld	-22 (ix),h
                            454 ;src/pathfinding.c:99: if(resultado == 0){
   46EE DD 7E F1      [19]  455 	ld	a,-15 (ix)
   46F1 B7            [ 4]  456 	or	a, a
   46F2 20 1A         [12]  457 	jr	NZ,00143$
                            458 ;src/pathfinding.c:100: if(dist1 >= dist3)
   46F4 DD 7E EF      [19]  459 	ld	a,-17 (ix)
   46F7 DD 96 E9      [19]  460 	sub	a, -23 (ix)
   46FA DD 7E F0      [19]  461 	ld	a,-16 (ix)
   46FD DD 9E EA      [19]  462 	sbc	a, -22 (ix)
   4700 E2 05 47      [10]  463 	jp	PO, 00275$
   4703 EE 80         [ 7]  464 	xor	a, #0x80
   4705                     465 00275$:
   4705 FA 32 47      [10]  466 	jp	M,00146$
                            467 ;src/pathfinding.c:101: resultado = 2;
   4708 DD 36 F1 02   [19]  468 	ld	-15 (ix),#0x02
   470C 18 24         [12]  469 	jr	00146$
   470E                     470 00143$:
                            471 ;src/pathfinding.c:102: }else if(resultado == 1){
   470E DD 7E F1      [19]  472 	ld	a,-15 (ix)
   4711 3D            [ 4]  473 	dec	a
   4712 20 1A         [12]  474 	jr	NZ,00140$
                            475 ;src/pathfinding.c:103: if(dist2 >= dist3)
   4714 DD 7E E7      [19]  476 	ld	a,-25 (ix)
   4717 DD 96 E9      [19]  477 	sub	a, -23 (ix)
   471A DD 7E E8      [19]  478 	ld	a,-24 (ix)
   471D DD 9E EA      [19]  479 	sbc	a, -22 (ix)
   4720 E2 25 47      [10]  480 	jp	PO, 00278$
   4723 EE 80         [ 7]  481 	xor	a, #0x80
   4725                     482 00278$:
   4725 FA 32 47      [10]  483 	jp	M,00146$
                            484 ;src/pathfinding.c:104: resultado = 2;
   4728 DD 36 F1 02   [19]  485 	ld	-15 (ix),#0x02
   472C 18 04         [12]  486 	jr	00146$
   472E                     487 00140$:
                            488 ;src/pathfinding.c:106: resultado = 2;
   472E DD 36 F1 02   [19]  489 	ld	-15 (ix),#0x02
   4732                     490 00146$:
                            491 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x + G_ENEMY_W +1), y) <=2 //&&
   4732 DD 7E 04      [19]  492 	ld	a,4 (ix)
   4735 C6 05         [ 7]  493 	add	a, #0x05
   4737 47            [ 4]  494 	ld	b,a
   4738 DD 7E 05      [19]  495 	ld	a,5 (ix)
   473B F5            [11]  496 	push	af
   473C 33            [ 6]  497 	inc	sp
   473D C5            [11]  498 	push	bc
   473E 33            [ 6]  499 	inc	sp
   473F DD 6E 08      [19]  500 	ld	l,8 (ix)
   4742 DD 66 09      [19]  501 	ld	h,9 (ix)
   4745 E5            [11]  502 	push	hl
   4746 CD B5 49      [17]  503 	call	_getTilePtr
   4749 F1            [10]  504 	pop	af
   474A F1            [10]  505 	pop	af
   474B 4E            [ 7]  506 	ld	c,(hl)
   474C 3E 02         [ 7]  507 	ld	a,#0x02
   474E 91            [ 4]  508 	sub	a, c
   474F DA 1F 48      [10]  509 	jp	C,00163$
                            510 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   4752 DD 7E F4      [19]  511 	ld	a,-12 (ix)
   4755 C6 01         [ 7]  512 	add	a, #0x01
   4757 DD 77 FE      [19]  513 	ld	-2 (ix),a
   475A DD 7E F5      [19]  514 	ld	a,-11 (ix)
   475D CE 00         [ 7]  515 	adc	a, #0x00
   475F DD 77 FF      [19]  516 	ld	-1 (ix),a
   4762 DD 7E F6      [19]  517 	ld	a,-10 (ix)
   4765 DD 96 FE      [19]  518 	sub	a, -2 (ix)
   4768 DD 77 FE      [19]  519 	ld	-2 (ix),a
   476B DD 7E F7      [19]  520 	ld	a,-9 (ix)
   476E DD 9E FF      [19]  521 	sbc	a, -1 (ix)
   4771 DD 77 FF      [19]  522 	ld	-1 (ix),a
   4774 DD 6E FE      [19]  523 	ld	l,-2 (ix)
   4777 DD 66 FF      [19]  524 	ld	h,-1 (ix)
   477A E5            [11]  525 	push	hl
   477B CD F9 49      [17]  526 	call	_abs
   477E F1            [10]  527 	pop	af
   477F DD 74 FF      [19]  528 	ld	-1 (ix),h
   4782 DD 75 FE      [19]  529 	ld	-2 (ix),l
   4785 DD 6E FC      [19]  530 	ld	l,-4 (ix)
   4788 DD 66 FD      [19]  531 	ld	h,-3 (ix)
   478B E5            [11]  532 	push	hl
   478C CD F9 49      [17]  533 	call	_abs
   478F F1            [10]  534 	pop	af
   4790 DD 74 FD      [19]  535 	ld	-3 (ix),h
   4793 DD 75 FC      [19]  536 	ld	-4 (ix),l
   4796 DD 7E FE      [19]  537 	ld	a,-2 (ix)
   4799 DD 86 FC      [19]  538 	add	a, -4 (ix)
   479C DD 77 FC      [19]  539 	ld	-4 (ix),a
   479F DD 7E FF      [19]  540 	ld	a,-1 (ix)
   47A2 DD 8E FD      [19]  541 	adc	a, -3 (ix)
   47A5 DD 77 FD      [19]  542 	ld	-3 (ix),a
   47A8 DD 7E FC      [19]  543 	ld	a,-4 (ix)
   47AB DD 86 ED      [19]  544 	add	a, -19 (ix)
   47AE DD 77 EB      [19]  545 	ld	-21 (ix),a
   47B1 DD 7E FD      [19]  546 	ld	a,-3 (ix)
   47B4 DD 8E EE      [19]  547 	adc	a, -18 (ix)
   47B7 DD 77 EC      [19]  548 	ld	-20 (ix),a
                            549 ;src/pathfinding.c:114: if(resultado == 0){
   47BA DD 7E F1      [19]  550 	ld	a,-15 (ix)
   47BD B7            [ 4]  551 	or	a, a
   47BE 20 1A         [12]  552 	jr	NZ,00160$
                            553 ;src/pathfinding.c:115: if(dist1 >= dist4)
   47C0 DD 7E EF      [19]  554 	ld	a,-17 (ix)
   47C3 DD 96 EB      [19]  555 	sub	a, -21 (ix)
   47C6 DD 7E F0      [19]  556 	ld	a,-16 (ix)
   47C9 DD 9E EC      [19]  557 	sbc	a, -20 (ix)
   47CC E2 D1 47      [10]  558 	jp	PO, 00279$
   47CF EE 80         [ 7]  559 	xor	a, #0x80
   47D1                     560 00279$:
   47D1 FA 1F 48      [10]  561 	jp	M,00163$
                            562 ;src/pathfinding.c:116: resultado = 3;
   47D4 DD 36 F1 03   [19]  563 	ld	-15 (ix),#0x03
   47D8 18 45         [12]  564 	jr	00163$
   47DA                     565 00160$:
                            566 ;src/pathfinding.c:117: }else if(resultado == 1){
   47DA DD 7E F1      [19]  567 	ld	a,-15 (ix)
   47DD 3D            [ 4]  568 	dec	a
   47DE 20 1A         [12]  569 	jr	NZ,00157$
                            570 ;src/pathfinding.c:118: if(dist2 >= dist4)
   47E0 DD 7E E7      [19]  571 	ld	a,-25 (ix)
   47E3 DD 96 EB      [19]  572 	sub	a, -21 (ix)
   47E6 DD 7E E8      [19]  573 	ld	a,-24 (ix)
   47E9 DD 9E EC      [19]  574 	sbc	a, -20 (ix)
   47EC E2 F1 47      [10]  575 	jp	PO, 00282$
   47EF EE 80         [ 7]  576 	xor	a, #0x80
   47F1                     577 00282$:
   47F1 FA 1F 48      [10]  578 	jp	M,00163$
                            579 ;src/pathfinding.c:119: resultado = 3;
   47F4 DD 36 F1 03   [19]  580 	ld	-15 (ix),#0x03
   47F8 18 25         [12]  581 	jr	00163$
   47FA                     582 00157$:
                            583 ;src/pathfinding.c:120: }else if (resultado == 2){
   47FA DD 7E F1      [19]  584 	ld	a,-15 (ix)
   47FD D6 02         [ 7]  585 	sub	a, #0x02
   47FF 20 1A         [12]  586 	jr	NZ,00154$
                            587 ;src/pathfinding.c:121: if(dist3 >= dist4)
   4801 DD 7E E9      [19]  588 	ld	a,-23 (ix)
   4804 DD 96 EB      [19]  589 	sub	a, -21 (ix)
   4807 DD 7E EA      [19]  590 	ld	a,-22 (ix)
   480A DD 9E EC      [19]  591 	sbc	a, -20 (ix)
   480D E2 12 48      [10]  592 	jp	PO, 00285$
   4810 EE 80         [ 7]  593 	xor	a, #0x80
   4812                     594 00285$:
   4812 FA 1F 48      [10]  595 	jp	M,00163$
                            596 ;src/pathfinding.c:122: resultado = 3;
   4815 DD 36 F1 03   [19]  597 	ld	-15 (ix),#0x03
   4819 18 04         [12]  598 	jr	00163$
   481B                     599 00154$:
                            600 ;src/pathfinding.c:124: resultado = 3;
   481B DD 36 F1 03   [19]  601 	ld	-15 (ix),#0x03
   481F                     602 00163$:
                            603 ;src/pathfinding.c:128: return resultado;
   481F DD 6E F1      [19]  604 	ld	l,-15 (ix)
   4822 DD F9         [10]  605 	ld	sp, ix
   4824 DD E1         [14]  606 	pop	ix
   4826 C9            [10]  607 	ret
                            608 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                            609 ;	---------------------------------
                            610 ; Function pathFinding
                            611 ; ---------------------------------
   4827                     612 _pathFinding::
   4827 DD E5         [15]  613 	push	ix
   4829 DD 21 00 00   [14]  614 	ld	ix,#0
   482D DD 39         [15]  615 	add	ix,sp
   482F 21 F7 FF      [10]  616 	ld	hl,#-9
   4832 39            [11]  617 	add	hl,sp
   4833 F9            [ 6]  618 	ld	sp,hl
                            619 ;src/pathfinding.c:144: u8 problem = 0;
   4834 1E 00         [ 7]  620 	ld	e,#0x00
                            621 ;src/pathfinding.c:146: x = s_x;
   4836 DD 7E 04      [19]  622 	ld	a,4 (ix)
   4839 DD 77 F8      [19]  623 	ld	-8 (ix),a
                            624 ;src/pathfinding.c:148: y = s_y;
   483C DD 7E 05      [19]  625 	ld	a,5 (ix)
   483F DD 77 F9      [19]  626 	ld	-7 (ix),a
                            627 ;src/pathfinding.c:150: k = 0;
   4842 DD 36 FA 00   [19]  628 	ld	-6 (ix),#0x00
                            629 ;src/pathfinding.c:151: aux = 1;
   4846 DD 36 F7 01   [19]  630 	ld	-9 (ix),#0x01
                            631 ;src/pathfinding.c:155: enemy->longitud_camino = 0;
   484A DD 7E 08      [19]  632 	ld	a,8 (ix)
   484D DD 77 FD      [19]  633 	ld	-3 (ix),a
   4850 DD 7E 09      [19]  634 	ld	a,9 (ix)
   4853 DD 77 FE      [19]  635 	ld	-2 (ix),a
   4856 DD 7E FD      [19]  636 	ld	a,-3 (ix)
   4859 C6 1B         [ 7]  637 	add	a, #0x1B
   485B 4F            [ 4]  638 	ld	c,a
   485C DD 7E FE      [19]  639 	ld	a,-2 (ix)
   485F CE 00         [ 7]  640 	adc	a, #0x00
   4861 47            [ 4]  641 	ld	b,a
   4862 AF            [ 4]  642 	xor	a, a
   4863 02            [ 7]  643 	ld	(bc),a
                            644 ;src/pathfinding.c:156: sol_tam = 0;
   4864 21 7C 5F      [10]  645 	ld	hl,#_sol_tam + 0
   4867 36 00         [10]  646 	ld	(hl), #0x00
                            647 ;src/pathfinding.c:158: inserted = anyadirALista(x, y);
   4869 C5            [11]  648 	push	bc
   486A D5            [11]  649 	push	de
   486B DD 66 F9      [19]  650 	ld	h,-7 (ix)
   486E DD 6E F8      [19]  651 	ld	l,-8 (ix)
   4871 E5            [11]  652 	push	hl
   4872 CD EF 43      [17]  653 	call	_anyadirALista
   4875 F1            [10]  654 	pop	af
   4876 D1            [10]  655 	pop	de
   4877 C1            [10]  656 	pop	bc
   4878 DD 75 FB      [19]  657 	ld	-5 (ix),l
                            658 ;src/pathfinding.c:162: while (aux){
   487B                     659 00115$:
   487B DD 7E F7      [19]  660 	ld	a,-9 (ix)
   487E B7            [ 4]  661 	or	a, a
   487F CA 88 49      [10]  662 	jp	Z,00117$
                            663 ;src/pathfinding.c:163: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   4882 DD 7E 06      [19]  664 	ld	a,6 (ix)
   4885 DD 96 F8      [19]  665 	sub	a, -8 (ix)
   4888 20 08         [12]  666 	jr	NZ,00113$
   488A DD 7E 07      [19]  667 	ld	a,7 (ix)
   488D DD 96 F9      [19]  668 	sub	a, -7 (ix)
   4890 28 0C         [12]  669 	jr	Z,00109$
   4892                     670 00113$:
   4892 3A 7C 5F      [13]  671 	ld	a,(#_sol_tam + 0)
   4895 B7            [ 4]  672 	or	a, a
   4896 28 06         [12]  673 	jr	Z,00109$
   4898 DD 7E FB      [19]  674 	ld	a,-5 (ix)
   489B B7            [ 4]  675 	or	a, a
   489C 20 14         [12]  676 	jr	NZ,00110$
   489E                     677 00109$:
                            678 ;src/pathfinding.c:165: if(inserted == 0 || sol_tam == 0){
   489E DD 7E FB      [19]  679 	ld	a,-5 (ix)
   48A1 B7            [ 4]  680 	or	a, a
   48A2 28 06         [12]  681 	jr	Z,00101$
   48A4 3A 7C 5F      [13]  682 	ld	a,(#_sol_tam + 0)
   48A7 B7            [ 4]  683 	or	a, a
   48A8 20 02         [12]  684 	jr	NZ,00102$
   48AA                     685 00101$:
                            686 ;src/pathfinding.c:166: problem = 1;
   48AA 1E 01         [ 7]  687 	ld	e,#0x01
   48AC                     688 00102$:
                            689 ;src/pathfinding.c:169: aux = 0;
   48AC DD 36 F7 00   [19]  690 	ld	-9 (ix),#0x00
   48B0 18 C9         [12]  691 	jr	00115$
   48B2                     692 00110$:
                            693 ;src/pathfinding.c:171: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   48B2 C5            [11]  694 	push	bc
   48B3 D5            [11]  695 	push	de
   48B4 DD 6E 0A      [19]  696 	ld	l,10 (ix)
   48B7 DD 66 0B      [19]  697 	ld	h,11 (ix)
   48BA E5            [11]  698 	push	hl
   48BB DD 66 07      [19]  699 	ld	h,7 (ix)
   48BE DD 6E 06      [19]  700 	ld	l,6 (ix)
   48C1 E5            [11]  701 	push	hl
   48C2 DD 66 F9      [19]  702 	ld	h,-7 (ix)
   48C5 DD 6E F8      [19]  703 	ld	l,-8 (ix)
   48C8 E5            [11]  704 	push	hl
   48C9 CD 37 44      [17]  705 	call	_adjacentTiles
   48CC F1            [10]  706 	pop	af
   48CD F1            [10]  707 	pop	af
   48CE F1            [10]  708 	pop	af
   48CF D1            [10]  709 	pop	de
   48D0 C1            [10]  710 	pop	bc
   48D1 55            [ 4]  711 	ld	d,l
                            712 ;src/pathfinding.c:173: switch(movimiento){
   48D2 3E 03         [ 7]  713 	ld	a,#0x03
   48D4 92            [ 4]  714 	sub	a, d
   48D5 38 A4         [12]  715 	jr	C,00115$
                            716 ;src/pathfinding.c:177: k = k+2;
   48D7 DD 7E FA      [19]  717 	ld	a,-6 (ix)
   48DA C6 02         [ 7]  718 	add	a, #0x02
   48DC DD 77 FF      [19]  719 	ld	-1 (ix),a
                            720 ;src/pathfinding.c:173: switch(movimiento){
   48DF D5            [11]  721 	push	de
   48E0 5A            [ 4]  722 	ld	e,d
   48E1 16 00         [ 7]  723 	ld	d,#0x00
   48E3 21 EA 48      [10]  724 	ld	hl,#00161$
   48E6 19            [11]  725 	add	hl,de
   48E7 19            [11]  726 	add	hl,de
                            727 ;src/pathfinding.c:174: case 0:
   48E8 D1            [10]  728 	pop	de
   48E9 E9            [ 4]  729 	jp	(hl)
   48EA                     730 00161$:
   48EA 18 06         [12]  731 	jr	00104$
   48EC 18 2D         [12]  732 	jr	00105$
   48EE 18 4E         [12]  733 	jr	00106$
   48F0 18 6E         [12]  734 	jr	00107$
   48F2                     735 00104$:
                            736 ;src/pathfinding.c:175: inserted = anyadirALista(x, y-2);
   48F2 DD 7E F9      [19]  737 	ld	a,-7 (ix)
   48F5 C6 FE         [ 7]  738 	add	a,#0xFE
   48F7 DD 77 FC      [19]  739 	ld	-4 (ix),a
   48FA C5            [11]  740 	push	bc
   48FB D5            [11]  741 	push	de
   48FC DD 66 FC      [19]  742 	ld	h,-4 (ix)
   48FF DD 6E F8      [19]  743 	ld	l,-8 (ix)
   4902 E5            [11]  744 	push	hl
   4903 CD EF 43      [17]  745 	call	_anyadirALista
   4906 F1            [10]  746 	pop	af
   4907 D1            [10]  747 	pop	de
   4908 C1            [10]  748 	pop	bc
   4909 DD 75 FB      [19]  749 	ld	-5 (ix),l
                            750 ;src/pathfinding.c:176: y = y-2;
   490C DD 56 FC      [19]  751 	ld	d,-4 (ix)
   490F DD 72 F9      [19]  752 	ld	-7 (ix),d
                            753 ;src/pathfinding.c:177: k = k+2;
   4912 DD 7E FF      [19]  754 	ld	a,-1 (ix)
   4915 DD 77 FA      [19]  755 	ld	-6 (ix),a
                            756 ;src/pathfinding.c:178: break;
   4918 C3 7B 48      [10]  757 	jp	00115$
                            758 ;src/pathfinding.c:179: case 1:
   491B                     759 00105$:
                            760 ;src/pathfinding.c:182: inserted = anyadirALista(x, y+2);
   491B DD 56 F9      [19]  761 	ld	d,-7 (ix)
   491E 14            [ 4]  762 	inc	d
   491F 14            [ 4]  763 	inc	d
   4920 C5            [11]  764 	push	bc
   4921 D5            [11]  765 	push	de
   4922 D5            [11]  766 	push	de
   4923 33            [ 6]  767 	inc	sp
   4924 DD 7E F8      [19]  768 	ld	a,-8 (ix)
   4927 F5            [11]  769 	push	af
   4928 33            [ 6]  770 	inc	sp
   4929 CD EF 43      [17]  771 	call	_anyadirALista
   492C F1            [10]  772 	pop	af
   492D D1            [10]  773 	pop	de
   492E C1            [10]  774 	pop	bc
   492F DD 75 FB      [19]  775 	ld	-5 (ix),l
                            776 ;src/pathfinding.c:183: y = y+2;
   4932 DD 72 F9      [19]  777 	ld	-7 (ix),d
                            778 ;src/pathfinding.c:184: k = k+2;
   4935 DD 7E FF      [19]  779 	ld	a,-1 (ix)
   4938 DD 77 FA      [19]  780 	ld	-6 (ix),a
                            781 ;src/pathfinding.c:185: break;
   493B C3 7B 48      [10]  782 	jp	00115$
                            783 ;src/pathfinding.c:186: case 2:
   493E                     784 00106$:
                            785 ;src/pathfinding.c:189: inserted = anyadirALista(x-1, y);
   493E DD 56 F8      [19]  786 	ld	d,-8 (ix)
   4941 15            [ 4]  787 	dec	d
   4942 C5            [11]  788 	push	bc
   4943 D5            [11]  789 	push	de
   4944 DD 7E F9      [19]  790 	ld	a,-7 (ix)
   4947 F5            [11]  791 	push	af
   4948 33            [ 6]  792 	inc	sp
   4949 D5            [11]  793 	push	de
   494A 33            [ 6]  794 	inc	sp
   494B CD EF 43      [17]  795 	call	_anyadirALista
   494E F1            [10]  796 	pop	af
   494F D1            [10]  797 	pop	de
   4950 C1            [10]  798 	pop	bc
   4951 DD 75 FB      [19]  799 	ld	-5 (ix),l
                            800 ;src/pathfinding.c:190: x = x-1;
   4954 DD 72 F8      [19]  801 	ld	-8 (ix),d
                            802 ;src/pathfinding.c:191: k = k+2;
   4957 DD 7E FF      [19]  803 	ld	a,-1 (ix)
   495A DD 77 FA      [19]  804 	ld	-6 (ix),a
                            805 ;src/pathfinding.c:192: break;
   495D C3 7B 48      [10]  806 	jp	00115$
                            807 ;src/pathfinding.c:193: case 3:
   4960                     808 00107$:
                            809 ;src/pathfinding.c:194: inserted = anyadirALista(x+1, y);
   4960 DD 7E F8      [19]  810 	ld	a,-8 (ix)
   4963 3C            [ 4]  811 	inc	a
   4964 DD 77 FC      [19]  812 	ld	-4 (ix),a
   4967 C5            [11]  813 	push	bc
   4968 D5            [11]  814 	push	de
   4969 DD 66 F9      [19]  815 	ld	h,-7 (ix)
   496C DD 6E FC      [19]  816 	ld	l,-4 (ix)
   496F E5            [11]  817 	push	hl
   4970 CD EF 43      [17]  818 	call	_anyadirALista
   4973 F1            [10]  819 	pop	af
   4974 D1            [10]  820 	pop	de
   4975 C1            [10]  821 	pop	bc
   4976 DD 75 FB      [19]  822 	ld	-5 (ix),l
                            823 ;src/pathfinding.c:195: x = x+1;
   4979 DD 6E FC      [19]  824 	ld	l,-4 (ix)
   497C DD 75 F8      [19]  825 	ld	-8 (ix),l
                            826 ;src/pathfinding.c:196: k = k+2;
   497F DD 7E FF      [19]  827 	ld	a,-1 (ix)
   4982 DD 77 FA      [19]  828 	ld	-6 (ix),a
                            829 ;src/pathfinding.c:199: }
   4985 C3 7B 48      [10]  830 	jp	00115$
   4988                     831 00117$:
                            832 ;src/pathfinding.c:204: if(problem == 0){
   4988 7B            [ 4]  833 	ld	a,e
   4989 B7            [ 4]  834 	or	a, a
   498A 20 22         [12]  835 	jr	NZ,00122$
                            836 ;src/pathfinding.c:205: if(sol_tam < CAMINO_TAM){
                            837 ;src/pathfinding.c:206: enemy->longitud_camino = sol_tam;
   498C 3A 7C 5F      [13]  838 	ld	a,(#_sol_tam + 0)
   498F FE C8         [ 7]  839 	cp	a,#0xC8
   4991 30 03         [12]  840 	jr	NC,00119$
   4993 02            [ 7]  841 	ld	(bc),a
   4994 18 03         [12]  842 	jr	00120$
   4996                     843 00119$:
                            844 ;src/pathfinding.c:208: enemy->longitud_camino = CAMINO_TAM;
   4996 3E C8         [ 7]  845 	ld	a,#0xC8
   4998 02            [ 7]  846 	ld	(bc),a
   4999                     847 00120$:
                            848 ;src/pathfinding.c:210: enemy->camino = camino;
   4999 DD 7E FD      [19]  849 	ld	a,-3 (ix)
   499C C6 19         [ 7]  850 	add	a, #0x19
   499E 4F            [ 4]  851 	ld	c,a
   499F DD 7E FE      [19]  852 	ld	a,-2 (ix)
   49A2 CE 00         [ 7]  853 	adc	a, #0x00
   49A4 47            [ 4]  854 	ld	b,a
   49A5 3E 7D         [ 7]  855 	ld	a,#<(_camino)
   49A7 02            [ 7]  856 	ld	(bc),a
   49A8 03            [ 6]  857 	inc	bc
   49A9 3E 5F         [ 7]  858 	ld	a,#>(_camino)
   49AB 02            [ 7]  859 	ld	(bc),a
   49AC 18 02         [12]  860 	jr	00124$
   49AE                     861 00122$:
                            862 ;src/pathfinding.c:213: enemy->longitud_camino = 0;
   49AE AF            [ 4]  863 	xor	a, a
   49AF 02            [ 7]  864 	ld	(bc),a
   49B0                     865 00124$:
   49B0 DD F9         [10]  866 	ld	sp, ix
   49B2 DD E1         [14]  867 	pop	ix
   49B4 C9            [10]  868 	ret
                            869 	.area _CODE
                            870 	.area _INITIALIZER
                            871 	.area _CABS (ABS)
