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
                             11 	.globl _setBit
                             12 	.globl _getBit
                             13 	.globl _abs
                             14 	.globl _camino
                             15 	.globl _sol_matriz
                             16 	.globl _sol_tam
                             17 	.globl _bitWeights
                             18 	.globl _anyadirALista
                             19 	.globl _adjacentTiles
                             20 	.globl _pathFinding
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   6A29                      28 _sol_tam::
   6A29                      29 	.ds 1
   6A2A                      30 _sol_matriz::
   6A2A                      31 	.ds 2112
   726A                      32 _camino::
   726A                      33 	.ds 100
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/pathfinding.c:14: u8 getBit(u8 *array, u16 pos)
                             59 ;	---------------------------------
                             60 ; Function getBit
                             61 ; ---------------------------------
   43EF                      62 _getBit::
   43EF DD E5         [15]   63 	push	ix
   43F1 DD 21 00 00   [14]   64 	ld	ix,#0
   43F5 DD 39         [15]   65 	add	ix,sp
                             66 ;src/pathfinding.c:19: byteV = array[pos/8];
   43F7 DD 4E 06      [19]   67 	ld	c,6 (ix)
   43FA DD 46 07      [19]   68 	ld	b,7 (ix)
   43FD CB 38         [ 8]   69 	srl	b
   43FF CB 19         [ 8]   70 	rr	c
   4401 CB 38         [ 8]   71 	srl	b
   4403 CB 19         [ 8]   72 	rr	c
   4405 CB 38         [ 8]   73 	srl	b
   4407 CB 19         [ 8]   74 	rr	c
   4409 DD 6E 04      [19]   75 	ld	l,4 (ix)
   440C DD 66 05      [19]   76 	ld	h,5 (ix)
   440F 09            [11]   77 	add	hl,bc
   4410 4E            [ 7]   78 	ld	c,(hl)
   4411 06 00         [ 7]   79 	ld	b,#0x00
                             80 ;src/pathfinding.c:20: bitV = bitWeights[pos%8];
   4413 DD 7E 06      [19]   81 	ld	a,6 (ix)
   4416 E6 07         [ 7]   82 	and	a, #0x07
   4418 6F            [ 4]   83 	ld	l,a
   4419 26 00         [ 7]   84 	ld	h,#0x00
   441B 29            [11]   85 	add	hl, hl
   441C 11 3A 44      [10]   86 	ld	de,#_bitWeights
   441F 19            [11]   87 	add	hl,de
   4420 5E            [ 7]   88 	ld	e,(hl)
   4421 23            [ 6]   89 	inc	hl
   4422 56            [ 7]   90 	ld	d,(hl)
                             91 ;src/pathfinding.c:21: return (byteV & bitV) == bitV;
   4423 79            [ 4]   92 	ld	a,c
   4424 A3            [ 4]   93 	and	a, e
   4425 4F            [ 4]   94 	ld	c,a
   4426 78            [ 4]   95 	ld	a,b
   4427 A2            [ 4]   96 	and	a, d
   4428 47            [ 4]   97 	ld	b,a
   4429 7B            [ 4]   98 	ld	a,e
   442A 91            [ 4]   99 	sub	a, c
   442B 20 08         [12]  100 	jr	NZ,00103$
   442D 7A            [ 4]  101 	ld	a,d
   442E 90            [ 4]  102 	sub	a, b
   442F 20 04         [12]  103 	jr	NZ,00103$
   4431 3E 01         [ 7]  104 	ld	a,#0x01
   4433 18 01         [12]  105 	jr	00104$
   4435                     106 00103$:
   4435 AF            [ 4]  107 	xor	a,a
   4436                     108 00104$:
   4436 6F            [ 4]  109 	ld	l,a
   4437 DD E1         [14]  110 	pop	ix
   4439 C9            [10]  111 	ret
   443A                     112 _bitWeights:
   443A 01 00               113 	.dw #0x0001
   443C 02 00               114 	.dw #0x0002
   443E 04 00               115 	.dw #0x0004
   4440 08 00               116 	.dw #0x0008
   4442 10 00               117 	.dw #0x0010
   4444 20 00               118 	.dw #0x0020
   4446 40 00               119 	.dw #0x0040
   4448 80 00               120 	.dw #0x0080
                            121 ;src/pathfinding.c:24: void setBit(u8 *array, u16 pos, u16 value)
                            122 ;	---------------------------------
                            123 ; Function setBit
                            124 ; ---------------------------------
   444A                     125 _setBit::
   444A DD E5         [15]  126 	push	ix
   444C DD 21 00 00   [14]  127 	ld	ix,#0
   4450 DD 39         [15]  128 	add	ix,sp
                            129 ;src/pathfinding.c:30: bytePos = pos/8;
   4452 DD 5E 06      [19]  130 	ld	e,6 (ix)
   4455 DD 56 07      [19]  131 	ld	d,7 (ix)
   4458 CB 3A         [ 8]  132 	srl	d
   445A CB 1B         [ 8]  133 	rr	e
   445C CB 3A         [ 8]  134 	srl	d
   445E CB 1B         [ 8]  135 	rr	e
   4460 CB 3A         [ 8]  136 	srl	d
   4462 CB 1B         [ 8]  137 	rr	e
                            138 ;src/pathfinding.c:32: bitV = bitWeights[pos%8];
   4464 01 3A 44      [10]  139 	ld	bc,#_bitWeights+0
   4467 DD 7E 06      [19]  140 	ld	a,6 (ix)
   446A E6 07         [ 7]  141 	and	a, #0x07
   446C 6F            [ 4]  142 	ld	l,a
   446D 26 00         [ 7]  143 	ld	h,#0x00
   446F 29            [11]  144 	add	hl, hl
   4470 09            [11]  145 	add	hl,bc
   4471 4E            [ 7]  146 	ld	c,(hl)
   4472 23            [ 6]  147 	inc	hl
   4473 46            [ 7]  148 	ld	b,(hl)
                            149 ;src/pathfinding.c:36: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4474 DD 6E 04      [19]  150 	ld	l,4 (ix)
   4477 DD 66 05      [19]  151 	ld	h,5 (ix)
   447A 19            [11]  152 	add	hl,de
                            153 ;src/pathfinding.c:34: if(value == 0)
   447B DD 7E 09      [19]  154 	ld	a,9 (ix)
   447E DD B6 08      [19]  155 	or	a,8 (ix)
   4481 20 20         [12]  156 	jr	NZ,00106$
                            157 ;src/pathfinding.c:36: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4483 E5            [11]  158 	push	hl
   4484 C5            [11]  159 	push	bc
   4485 DD 5E 06      [19]  160 	ld	e,6 (ix)
   4488 DD 56 07      [19]  161 	ld	d,7 (ix)
   448B D5            [11]  162 	push	de
   448C DD 5E 04      [19]  163 	ld	e,4 (ix)
   448F DD 56 05      [19]  164 	ld	d,5 (ix)
   4492 D5            [11]  165 	push	de
   4493 CD EF 43      [17]  166 	call	_getBit
   4496 F1            [10]  167 	pop	af
   4497 F1            [10]  168 	pop	af
   4498 7D            [ 4]  169 	ld	a,l
   4499 C1            [10]  170 	pop	bc
   449A E1            [10]  171 	pop	hl
   449B B7            [ 4]  172 	or	a, a
   449C 28 23         [12]  173 	jr	Z,00108$
   449E 7E            [ 7]  174 	ld	a, (hl)
   449F 91            [ 4]  175 	sub	a, c
   44A0 77            [ 7]  176 	ld	(hl),a
   44A1 18 1E         [12]  177 	jr	00108$
   44A3                     178 00106$:
                            179 ;src/pathfinding.c:40: if(getBit(array, pos) == 0) array[bytePos] += bitV;
   44A3 E5            [11]  180 	push	hl
   44A4 C5            [11]  181 	push	bc
   44A5 DD 5E 06      [19]  182 	ld	e,6 (ix)
   44A8 DD 56 07      [19]  183 	ld	d,7 (ix)
   44AB D5            [11]  184 	push	de
   44AC DD 5E 04      [19]  185 	ld	e,4 (ix)
   44AF DD 56 05      [19]  186 	ld	d,5 (ix)
   44B2 D5            [11]  187 	push	de
   44B3 CD EF 43      [17]  188 	call	_getBit
   44B6 F1            [10]  189 	pop	af
   44B7 F1            [10]  190 	pop	af
   44B8 7D            [ 4]  191 	ld	a,l
   44B9 C1            [10]  192 	pop	bc
   44BA E1            [10]  193 	pop	hl
   44BB B7            [ 4]  194 	or	a, a
   44BC 20 03         [12]  195 	jr	NZ,00108$
   44BE 7E            [ 7]  196 	ld	a, (hl)
   44BF 81            [ 4]  197 	add	a, c
   44C0 77            [ 7]  198 	ld	(hl),a
   44C1                     199 00108$:
   44C1 DD E1         [14]  200 	pop	ix
   44C3 C9            [10]  201 	ret
                            202 ;src/pathfinding.c:45: u8 anyadirALista(u8 x, u8 y){
                            203 ;	---------------------------------
                            204 ; Function anyadirALista
                            205 ; ---------------------------------
   44C4                     206 _anyadirALista::
                            207 ;src/pathfinding.c:46: u8 anyadido = 0;
   44C4 0E 00         [ 7]  208 	ld	c,#0x00
                            209 ;src/pathfinding.c:48: if(sol_tam < CAMINO_TAM){
   44C6 3A 29 6A      [13]  210 	ld	a,(#_sol_tam + 0)
   44C9 D6 64         [ 7]  211 	sub	a, #0x64
   44CB 30 33         [12]  212 	jr	NC,00102$
                            213 ;src/pathfinding.c:49: camino[sol_tam-1] = x;
   44CD 01 6A 72      [10]  214 	ld	bc,#_camino+0
   44D0 21 29 6A      [10]  215 	ld	hl,#_sol_tam + 0
   44D3 5E            [ 7]  216 	ld	e, (hl)
   44D4 1D            [ 4]  217 	dec	e
   44D5 6B            [ 4]  218 	ld	l,e
   44D6 26 00         [ 7]  219 	ld	h,#0x00
   44D8 09            [11]  220 	add	hl,bc
   44D9 FD 21 02 00   [14]  221 	ld	iy,#2
   44DD FD 39         [15]  222 	add	iy,sp
   44DF FD 7E 00      [19]  223 	ld	a,0 (iy)
   44E2 77            [ 7]  224 	ld	(hl),a
                            225 ;src/pathfinding.c:50: sol_tam++;
   44E3 21 29 6A      [10]  226 	ld	hl, #_sol_tam+0
   44E6 34            [11]  227 	inc	(hl)
                            228 ;src/pathfinding.c:51: camino[sol_tam-1] = y;
   44E7 21 29 6A      [10]  229 	ld	hl,#_sol_tam + 0
   44EA 5E            [ 7]  230 	ld	e, (hl)
   44EB 1D            [ 4]  231 	dec	e
   44EC 6B            [ 4]  232 	ld	l,e
   44ED 26 00         [ 7]  233 	ld	h,#0x00
   44EF 09            [11]  234 	add	hl,bc
   44F0 FD 21 03 00   [14]  235 	ld	iy,#3
   44F4 FD 39         [15]  236 	add	iy,sp
   44F6 FD 7E 00      [19]  237 	ld	a,0 (iy)
   44F9 77            [ 7]  238 	ld	(hl),a
                            239 ;src/pathfinding.c:52: sol_tam++;
   44FA 21 29 6A      [10]  240 	ld	hl, #_sol_tam+0
   44FD 34            [11]  241 	inc	(hl)
                            242 ;src/pathfinding.c:53: anyadido = 1;
   44FE 0E 01         [ 7]  243 	ld	c,#0x01
   4500                     244 00102$:
                            245 ;src/pathfinding.c:56: return anyadido;
   4500 69            [ 4]  246 	ld	l,c
   4501 C9            [10]  247 	ret
                            248 ;src/pathfinding.c:60: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            249 ;	---------------------------------
                            250 ; Function adjacentTiles
                            251 ; ---------------------------------
   4502                     252 _adjacentTiles::
   4502 DD E5         [15]  253 	push	ix
   4504 DD 21 00 00   [14]  254 	ld	ix,#0
   4508 DD 39         [15]  255 	add	ix,sp
   450A 21 D1 FF      [10]  256 	ld	hl,#-47
   450D 39            [11]  257 	add	hl,sp
   450E F9            [ 6]  258 	ld	sp,hl
                            259 ;src/pathfinding.c:61: u8 resultado = 4;
   450F DD 36 DD 04   [19]  260 	ld	-35 (ix),#0x04
                            261 ;src/pathfinding.c:63: i16 dist1 = 0;
   4513 DD 36 D3 00   [19]  262 	ld	-45 (ix),#0x00
   4517 DD 36 D4 00   [19]  263 	ld	-44 (ix),#0x00
                            264 ;src/pathfinding.c:64: i16 dist2 = 0;
   451B DD 36 DE 00   [19]  265 	ld	-34 (ix),#0x00
   451F DD 36 DF 00   [19]  266 	ld	-33 (ix),#0x00
                            267 ;src/pathfinding.c:65: i16 dist3 = 0;
   4523 DD 36 DB 00   [19]  268 	ld	-37 (ix),#0x00
   4527 DD 36 DC 00   [19]  269 	ld	-36 (ix),#0x00
                            270 ;src/pathfinding.c:69: i16 heu_derecha = 0;
   452B DD 36 D7 00   [19]  271 	ld	-41 (ix),#0x00
   452F DD 36 D8 00   [19]  272 	ld	-40 (ix),#0x00
                            273 ;src/pathfinding.c:70: i16 heu_izquierda = 0;
   4533 DD 36 D5 00   [19]  274 	ld	-43 (ix),#0x00
   4537 DD 36 D6 00   [19]  275 	ld	-42 (ix),#0x00
                            276 ;src/pathfinding.c:71: i16 heu_arriba = 0;
   453B DD 36 D9 00   [19]  277 	ld	-39 (ix),#0x00
   453F DD 36 DA 00   [19]  278 	ld	-38 (ix),#0x00
                            279 ;src/pathfinding.c:72: i16 heu_abajo = 0;
   4543 21 00 00      [10]  280 	ld	hl,#0x0000
   4546 E3            [19]  281 	ex	(sp), hl
                            282 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4547 DD 7E 05      [19]  283 	ld	a,5 (ix)
   454A DD 77 FA      [19]  284 	ld	-6 (ix),a
   454D DD 36 FB 00   [19]  285 	ld	-5 (ix),#0x00
   4551 DD 7E 04      [19]  286 	ld	a,4 (ix)
   4554 DD 77 F6      [19]  287 	ld	-10 (ix),a
   4557 DD 36 F7 00   [19]  288 	ld	-9 (ix),#0x00
   455B DD 7E FA      [19]  289 	ld	a,-6 (ix)
   455E C6 E8         [ 7]  290 	add	a,#0xE8
   4560 DD 77 F2      [19]  291 	ld	-14 (ix),a
   4563 DD 7E FB      [19]  292 	ld	a,-5 (ix)
   4566 CE FF         [ 7]  293 	adc	a,#0xFF
   4568 DD 77 F3      [19]  294 	ld	-13 (ix),a
   456B DD 7E F6      [19]  295 	ld	a,-10 (ix)
   456E C6 FF         [ 7]  296 	add	a,#0xFF
   4570 DD 77 EE      [19]  297 	ld	-18 (ix),a
   4573 DD 7E F7      [19]  298 	ld	a,-9 (ix)
   4576 CE FF         [ 7]  299 	adc	a,#0xFF
   4578 DD 77 EF      [19]  300 	ld	-17 (ix),a
                            301 ;src/pathfinding.c:81: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   457B DD 7E F6      [19]  302 	ld	a,-10 (ix)
   457E C6 01         [ 7]  303 	add	a, #0x01
   4580 DD 77 FC      [19]  304 	ld	-4 (ix),a
   4583 DD 7E F7      [19]  305 	ld	a,-9 (ix)
   4586 CE 00         [ 7]  306 	adc	a, #0x00
   4588 DD 77 FD      [19]  307 	ld	-3 (ix),a
                            308 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   458B DD 7E FA      [19]  309 	ld	a,-6 (ix)
   458E C6 E6         [ 7]  310 	add	a,#0xE6
   4590 DD 77 F4      [19]  311 	ld	-12 (ix),a
   4593 DD 7E FB      [19]  312 	ld	a,-5 (ix)
   4596 CE FF         [ 7]  313 	adc	a,#0xFF
   4598 DD 77 F5      [19]  314 	ld	-11 (ix),a
                            315 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   459B DD 7E FA      [19]  316 	ld	a,-6 (ix)
   459E C6 EA         [ 7]  317 	add	a, #0xEA
   45A0 DD 77 F8      [19]  318 	ld	-8 (ix),a
   45A3 DD 7E FB      [19]  319 	ld	a,-5 (ix)
   45A6 CE FF         [ 7]  320 	adc	a, #0xFF
   45A8 DD 77 F9      [19]  321 	ld	-7 (ix),a
                            322 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   45AB DD 4E F2      [19]  323 	ld	c,-14 (ix)
   45AE DD 46 F3      [19]  324 	ld	b,-13 (ix)
   45B1 69            [ 4]  325 	ld	l, c
   45B2 60            [ 4]  326 	ld	h, b
   45B3 29            [11]  327 	add	hl, hl
   45B4 29            [11]  328 	add	hl, hl
   45B5 09            [11]  329 	add	hl, bc
   45B6 29            [11]  330 	add	hl, hl
   45B7 29            [11]  331 	add	hl, hl
   45B8 29            [11]  332 	add	hl, hl
   45B9 29            [11]  333 	add	hl, hl
   45BA EB            [ 4]  334 	ex	de,hl
                            335 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   45BB DD 4E F4      [19]  336 	ld	c,-12 (ix)
   45BE DD 46 F5      [19]  337 	ld	b,-11 (ix)
   45C1 69            [ 4]  338 	ld	l, c
   45C2 60            [ 4]  339 	ld	h, b
   45C3 29            [11]  340 	add	hl, hl
   45C4 29            [11]  341 	add	hl, hl
   45C5 09            [11]  342 	add	hl, bc
   45C6 29            [11]  343 	add	hl, hl
   45C7 29            [11]  344 	add	hl, hl
   45C8 29            [11]  345 	add	hl, hl
   45C9 29            [11]  346 	add	hl, hl
   45CA 4D            [ 4]  347 	ld	c,l
   45CB 44            [ 4]  348 	ld	b,h
                            349 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   45CC D5            [11]  350 	push	de
   45CD DD 5E F8      [19]  351 	ld	e,-8 (ix)
   45D0 DD 56 F9      [19]  352 	ld	d,-7 (ix)
   45D3 6B            [ 4]  353 	ld	l, e
   45D4 62            [ 4]  354 	ld	h, d
   45D5 29            [11]  355 	add	hl, hl
   45D6 29            [11]  356 	add	hl, hl
   45D7 19            [11]  357 	add	hl, de
   45D8 29            [11]  358 	add	hl, hl
   45D9 29            [11]  359 	add	hl, hl
   45DA 29            [11]  360 	add	hl, hl
   45DB 29            [11]  361 	add	hl, hl
   45DC D1            [10]  362 	pop	de
                            363 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   45DD DD 7E EE      [19]  364 	ld	a,-18 (ix)
   45E0 83            [ 4]  365 	add	a, e
   45E1 DD 77 E4      [19]  366 	ld	-28 (ix),a
   45E4 DD 7E EF      [19]  367 	ld	a,-17 (ix)
   45E7 8A            [ 4]  368 	adc	a, d
   45E8 DD 77 E5      [19]  369 	ld	-27 (ix),a
                            370 ;src/pathfinding.c:81: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   45EB DD 7E FC      [19]  371 	ld	a,-4 (ix)
   45EE 83            [ 4]  372 	add	a, e
   45EF DD 77 E6      [19]  373 	ld	-26 (ix),a
   45F2 DD 7E FD      [19]  374 	ld	a,-3 (ix)
   45F5 8A            [ 4]  375 	adc	a, d
   45F6 DD 77 E7      [19]  376 	ld	-25 (ix),a
                            377 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   45F9 DD 7E F6      [19]  378 	ld	a,-10 (ix)
   45FC 81            [ 4]  379 	add	a, c
   45FD DD 77 EC      [19]  380 	ld	-20 (ix),a
   4600 DD 7E F7      [19]  381 	ld	a,-9 (ix)
   4603 88            [ 4]  382 	adc	a, b
   4604 DD 77 ED      [19]  383 	ld	-19 (ix),a
                            384 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4607 DD 7E F6      [19]  385 	ld	a,-10 (ix)
   460A 85            [ 4]  386 	add	a, l
   460B DD 77 E8      [19]  387 	ld	-24 (ix),a
   460E DD 7E F7      [19]  388 	ld	a,-9 (ix)
   4611 8C            [ 4]  389 	adc	a, h
   4612 DD 77 E9      [19]  390 	ld	-23 (ix),a
                            391 ;src/pathfinding.c:76: if(x == f_x){
   4615 DD 7E 04      [19]  392 	ld	a,4 (ix)
   4618 DD 96 08      [19]  393 	sub	a, 8 (ix)
   461B 20 58         [12]  394 	jr	NZ,00130$
                            395 ;src/pathfinding.c:78: if(s_x < x){
   461D DD 7E 06      [19]  396 	ld	a,6 (ix)
   4620 DD 96 04      [19]  397 	sub	a, 4 (ix)
   4623 30 19         [12]  398 	jr	NC,00102$
                            399 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4625 21 01 00      [10]  400 	ld	hl,#0x0001
   4628 E5            [11]  401 	push	hl
   4629 DD 6E E4      [19]  402 	ld	l,-28 (ix)
   462C DD 66 E5      [19]  403 	ld	h,-27 (ix)
   462F E5            [11]  404 	push	hl
   4630 21 2A 6A      [10]  405 	ld	hl,#_sol_matriz
   4633 E5            [11]  406 	push	hl
   4634 CD 4A 44      [17]  407 	call	_setBit
   4637 21 06 00      [10]  408 	ld	hl,#6
   463A 39            [11]  409 	add	hl,sp
   463B F9            [ 6]  410 	ld	sp,hl
   463C 18 17         [12]  411 	jr	00103$
   463E                     412 00102$:
                            413 ;src/pathfinding.c:81: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   463E 21 01 00      [10]  414 	ld	hl,#0x0001
   4641 E5            [11]  415 	push	hl
   4642 DD 6E E6      [19]  416 	ld	l,-26 (ix)
   4645 DD 66 E7      [19]  417 	ld	h,-25 (ix)
   4648 E5            [11]  418 	push	hl
   4649 21 2A 6A      [10]  419 	ld	hl,#_sol_matriz
   464C E5            [11]  420 	push	hl
   464D CD 4A 44      [17]  421 	call	_setBit
   4650 21 06 00      [10]  422 	ld	hl,#6
   4653 39            [11]  423 	add	hl,sp
   4654 F9            [ 6]  424 	ld	sp,hl
   4655                     425 00103$:
                            426 ;src/pathfinding.c:85: if(y < f_y)
   4655 DD 7E 05      [19]  427 	ld	a,5 (ix)
   4658 DD 96 09      [19]  428 	sub	a, 9 (ix)
   465B 30 04         [12]  429 	jr	NC,00105$
                            430 ;src/pathfinding.c:86: heu_abajo = -1;
   465D 21 FF FF      [10]  431 	ld	hl,#0xFFFF
   4660 E3            [19]  432 	ex	(sp), hl
   4661                     433 00105$:
                            434 ;src/pathfinding.c:88: if(y > f_y)
   4661 DD 7E 09      [19]  435 	ld	a,9 (ix)
   4664 DD 96 05      [19]  436 	sub	a, 5 (ix)
   4667 D2 27 47      [10]  437 	jp	NC,00131$
                            438 ;src/pathfinding.c:89: heu_arriba = -1;
   466A DD 36 D9 FF   [19]  439 	ld	-39 (ix),#0xFF
   466E DD 36 DA FF   [19]  440 	ld	-38 (ix),#0xFF
   4672 C3 27 47      [10]  441 	jp	00131$
   4675                     442 00130$:
                            443 ;src/pathfinding.c:91: }else if(y == f_y){
   4675 DD 7E 05      [19]  444 	ld	a,5 (ix)
   4678 DD 96 09      [19]  445 	sub	a, 9 (ix)
   467B 20 5A         [12]  446 	jr	NZ,00127$
                            447 ;src/pathfinding.c:93: if(s_y < y){
   467D DD 7E 07      [19]  448 	ld	a,7 (ix)
   4680 DD 96 05      [19]  449 	sub	a, 5 (ix)
   4683 30 19         [12]  450 	jr	NC,00109$
                            451 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4685 21 01 00      [10]  452 	ld	hl,#0x0001
   4688 E5            [11]  453 	push	hl
   4689 DD 6E EC      [19]  454 	ld	l,-20 (ix)
   468C DD 66 ED      [19]  455 	ld	h,-19 (ix)
   468F E5            [11]  456 	push	hl
   4690 21 2A 6A      [10]  457 	ld	hl,#_sol_matriz
   4693 E5            [11]  458 	push	hl
   4694 CD 4A 44      [17]  459 	call	_setBit
   4697 21 06 00      [10]  460 	ld	hl,#6
   469A 39            [11]  461 	add	hl,sp
   469B F9            [ 6]  462 	ld	sp,hl
   469C 18 17         [12]  463 	jr	00110$
   469E                     464 00109$:
                            465 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   469E 21 01 00      [10]  466 	ld	hl,#0x0001
   46A1 E5            [11]  467 	push	hl
   46A2 DD 6E E8      [19]  468 	ld	l,-24 (ix)
   46A5 DD 66 E9      [19]  469 	ld	h,-23 (ix)
   46A8 E5            [11]  470 	push	hl
   46A9 21 2A 6A      [10]  471 	ld	hl,#_sol_matriz
   46AC E5            [11]  472 	push	hl
   46AD CD 4A 44      [17]  473 	call	_setBit
   46B0 21 06 00      [10]  474 	ld	hl,#6
   46B3 39            [11]  475 	add	hl,sp
   46B4 F9            [ 6]  476 	ld	sp,hl
   46B5                     477 00110$:
                            478 ;src/pathfinding.c:100: if(x < f_x)
   46B5 DD 7E 04      [19]  479 	ld	a,4 (ix)
   46B8 DD 96 08      [19]  480 	sub	a, 8 (ix)
   46BB 30 08         [12]  481 	jr	NC,00112$
                            482 ;src/pathfinding.c:101: heu_derecha = -1;
   46BD DD 36 D7 FF   [19]  483 	ld	-41 (ix),#0xFF
   46C1 DD 36 D8 FF   [19]  484 	ld	-40 (ix),#0xFF
   46C5                     485 00112$:
                            486 ;src/pathfinding.c:102: if(x > f_x)
   46C5 DD 7E 08      [19]  487 	ld	a,8 (ix)
   46C8 DD 96 04      [19]  488 	sub	a, 4 (ix)
   46CB 30 5A         [12]  489 	jr	NC,00131$
                            490 ;src/pathfinding.c:103: heu_izquierda = -1;
   46CD DD 36 D5 FF   [19]  491 	ld	-43 (ix),#0xFF
   46D1 DD 36 D6 FF   [19]  492 	ld	-42 (ix),#0xFF
   46D5 18 50         [12]  493 	jr	00131$
   46D7                     494 00127$:
                            495 ;src/pathfinding.c:109: if(s_y < f_y)
   46D7 DD 7E 07      [19]  496 	ld	a,7 (ix)
   46DA DD 96 09      [19]  497 	sub	a, 9 (ix)
   46DD 3E 00         [ 7]  498 	ld	a,#0x00
   46DF 17            [ 4]  499 	rla
   46E0 4F            [ 4]  500 	ld	c,a
                            501 ;src/pathfinding.c:108: if(s_x < f_x){
   46E1 DD 7E 06      [19]  502 	ld	a,6 (ix)
   46E4 DD 96 08      [19]  503 	sub	a, 8 (ix)
   46E7 30 1C         [12]  504 	jr	NC,00124$
                            505 ;src/pathfinding.c:109: if(s_y < f_y)
   46E9 79            [ 4]  506 	ld	a,c
   46EA B7            [ 4]  507 	or	a, a
   46EB 28 06         [12]  508 	jr	Z,00116$
                            509 ;src/pathfinding.c:110: heu_abajo = -1;
   46ED 21 FF FF      [10]  510 	ld	hl,#0xFFFF
   46F0 E3            [19]  511 	ex	(sp), hl
   46F1 18 08         [12]  512 	jr	00117$
   46F3                     513 00116$:
                            514 ;src/pathfinding.c:112: heu_arriba = -1;
   46F3 DD 36 D9 FF   [19]  515 	ld	-39 (ix),#0xFF
   46F7 DD 36 DA FF   [19]  516 	ld	-38 (ix),#0xFF
   46FB                     517 00117$:
                            518 ;src/pathfinding.c:114: heu_derecha = -1;
   46FB DD 36 D7 FF   [19]  519 	ld	-41 (ix),#0xFF
   46FF DD 36 D8 FF   [19]  520 	ld	-40 (ix),#0xFF
   4703 18 22         [12]  521 	jr	00131$
   4705                     522 00124$:
                            523 ;src/pathfinding.c:115: }else if(s_x > f_x){
   4705 DD 7E 08      [19]  524 	ld	a,8 (ix)
   4708 DD 96 06      [19]  525 	sub	a, 6 (ix)
   470B 30 1A         [12]  526 	jr	NC,00131$
                            527 ;src/pathfinding.c:117: if(s_y < f_y)
   470D 79            [ 4]  528 	ld	a,c
   470E B7            [ 4]  529 	or	a, a
   470F 28 06         [12]  530 	jr	Z,00119$
                            531 ;src/pathfinding.c:118: heu_abajo = -1;
   4711 21 FF FF      [10]  532 	ld	hl,#0xFFFF
   4714 E3            [19]  533 	ex	(sp), hl
   4715 18 08         [12]  534 	jr	00120$
   4717                     535 00119$:
                            536 ;src/pathfinding.c:120: heu_arriba = -1;
   4717 DD 36 D9 FF   [19]  537 	ld	-39 (ix),#0xFF
   471B DD 36 DA FF   [19]  538 	ld	-38 (ix),#0xFF
   471F                     539 00120$:
                            540 ;src/pathfinding.c:122: heu_izquierda = -1;
   471F DD 36 D5 FF   [19]  541 	ld	-43 (ix),#0xFF
   4723 DD 36 D6 FF   [19]  542 	ld	-42 (ix),#0xFF
   4727                     543 00131$:
                            544 ;src/pathfinding.c:127: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4727 DD 7E F4      [19]  545 	ld	a,-12 (ix)
   472A DD 77 E2      [19]  546 	ld	-30 (ix),a
   472D DD 7E F5      [19]  547 	ld	a,-11 (ix)
   4730 DD 77 E3      [19]  548 	ld	-29 (ix),a
   4733 DD CB F5 7E   [20]  549 	bit	7, -11 (ix)
   4737 28 10         [12]  550 	jr	Z,00176$
   4739 DD 7E FA      [19]  551 	ld	a,-6 (ix)
   473C C6 E9         [ 7]  552 	add	a, #0xE9
   473E DD 77 E2      [19]  553 	ld	-30 (ix),a
   4741 DD 7E FB      [19]  554 	ld	a,-5 (ix)
   4744 CE FF         [ 7]  555 	adc	a, #0xFF
   4746 DD 77 E3      [19]  556 	ld	-29 (ix),a
   4749                     557 00176$:
   4749 DD CB E3 2E   [23]  558 	sra	-29 (ix)
   474D DD CB E2 1E   [23]  559 	rr	-30 (ix)
   4751 DD CB E3 2E   [23]  560 	sra	-29 (ix)
   4755 DD CB E2 1E   [23]  561 	rr	-30 (ix)
   4759 DD 4E E2      [19]  562 	ld	c,-30 (ix)
   475C DD 46 E3      [19]  563 	ld	b,-29 (ix)
   475F 69            [ 4]  564 	ld	l, c
   4760 60            [ 4]  565 	ld	h, b
   4761 29            [11]  566 	add	hl, hl
   4762 29            [11]  567 	add	hl, hl
   4763 09            [11]  568 	add	hl, bc
   4764 29            [11]  569 	add	hl, hl
   4765 29            [11]  570 	add	hl, hl
   4766 29            [11]  571 	add	hl, hl
   4767 DD 75 E2      [19]  572 	ld	-30 (ix),l
   476A DD 74 E3      [19]  573 	ld	-29 (ix),h
   476D DD 7E 0A      [19]  574 	ld	a,10 (ix)
   4770 DD 86 E2      [19]  575 	add	a, -30 (ix)
   4773 DD 77 E2      [19]  576 	ld	-30 (ix),a
   4776 DD 7E 0B      [19]  577 	ld	a,11 (ix)
   4779 DD 8E E3      [19]  578 	adc	a, -29 (ix)
   477C DD 77 E3      [19]  579 	ld	-29 (ix),a
   477F DD 7E 04      [19]  580 	ld	a,4 (ix)
   4782 CB 3F         [ 8]  581 	srl	a
   4784 DD 77 F4      [19]  582 	ld	-12 (ix), a
   4787 DD 86 E2      [19]  583 	add	a, -30 (ix)
   478A DD 77 E2      [19]  584 	ld	-30 (ix),a
   478D 3E 00         [ 7]  585 	ld	a,#0x00
   478F DD 8E E3      [19]  586 	adc	a, -29 (ix)
   4792 DD 77 E3      [19]  587 	ld	-29 (ix),a
   4795 DD 6E E2      [19]  588 	ld	l,-30 (ix)
   4798 DD 66 E3      [19]  589 	ld	h,-29 (ix)
   479B 7E            [ 7]  590 	ld	a,(hl)
   479C DD 77 E2      [19]  591 	ld	-30 (ix),a
                            592 ;src/pathfinding.c:128: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   479F DD 7E 08      [19]  593 	ld	a,8 (ix)
   47A2 DD 77 EA      [19]  594 	ld	-22 (ix),a
   47A5 DD 36 EB 00   [19]  595 	ld	-21 (ix),#0x00
   47A9 DD 7E 09      [19]  596 	ld	a,9 (ix)
   47AC DD 77 F0      [19]  597 	ld	-16 (ix),a
   47AF DD 36 F1 00   [19]  598 	ld	-15 (ix),#0x00
   47B3 DD 7E EA      [19]  599 	ld	a,-22 (ix)
   47B6 DD 96 F6      [19]  600 	sub	a, -10 (ix)
   47B9 DD 77 FE      [19]  601 	ld	-2 (ix),a
   47BC DD 7E EB      [19]  602 	ld	a,-21 (ix)
   47BF DD 9E F7      [19]  603 	sbc	a, -9 (ix)
   47C2 DD 77 FF      [19]  604 	ld	-1 (ix),a
                            605 ;src/pathfinding.c:127: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   47C5 3E 02         [ 7]  606 	ld	a,#0x02
   47C7 DD 96 E2      [19]  607 	sub	a, -30 (ix)
   47CA DA 58 48      [10]  608 	jp	C,00133$
   47CD DD 6E EC      [19]  609 	ld	l,-20 (ix)
   47D0 DD 66 ED      [19]  610 	ld	h,-19 (ix)
   47D3 E5            [11]  611 	push	hl
   47D4 21 2A 6A      [10]  612 	ld	hl,#_sol_matriz
   47D7 E5            [11]  613 	push	hl
   47D8 CD EF 43      [17]  614 	call	_getBit
   47DB F1            [10]  615 	pop	af
   47DC F1            [10]  616 	pop	af
   47DD 2D            [ 4]  617 	dec	l
   47DE 28 78         [12]  618 	jr	Z,00133$
                            619 ;src/pathfinding.c:128: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   47E0 DD 6E FE      [19]  620 	ld	l,-2 (ix)
   47E3 DD 66 FF      [19]  621 	ld	h,-1 (ix)
   47E6 E5            [11]  622 	push	hl
   47E7 CD FE 4F      [17]  623 	call	_abs
   47EA F1            [10]  624 	pop	af
   47EB DD 74 E3      [19]  625 	ld	-29 (ix),h
   47EE DD 75 E2      [19]  626 	ld	-30 (ix),l
   47F1 DD 7E FA      [19]  627 	ld	a,-6 (ix)
   47F4 C6 FE         [ 7]  628 	add	a,#0xFE
   47F6 DD 77 EC      [19]  629 	ld	-20 (ix),a
   47F9 DD 7E FB      [19]  630 	ld	a,-5 (ix)
   47FC CE FF         [ 7]  631 	adc	a,#0xFF
   47FE DD 77 ED      [19]  632 	ld	-19 (ix),a
   4801 DD 7E F0      [19]  633 	ld	a,-16 (ix)
   4804 DD 96 EC      [19]  634 	sub	a, -20 (ix)
   4807 DD 77 EC      [19]  635 	ld	-20 (ix),a
   480A DD 7E F1      [19]  636 	ld	a,-15 (ix)
   480D DD 9E ED      [19]  637 	sbc	a, -19 (ix)
   4810 DD 77 ED      [19]  638 	ld	-19 (ix),a
   4813 DD 6E EC      [19]  639 	ld	l,-20 (ix)
   4816 DD 66 ED      [19]  640 	ld	h,-19 (ix)
   4819 E5            [11]  641 	push	hl
   481A CD FE 4F      [17]  642 	call	_abs
   481D F1            [10]  643 	pop	af
   481E DD 74 ED      [19]  644 	ld	-19 (ix),h
   4821 DD 75 EC      [19]  645 	ld	-20 (ix),l
   4824 DD 7E E2      [19]  646 	ld	a,-30 (ix)
   4827 DD 86 EC      [19]  647 	add	a, -20 (ix)
   482A DD 77 E2      [19]  648 	ld	-30 (ix),a
   482D DD 7E E3      [19]  649 	ld	a,-29 (ix)
   4830 DD 8E ED      [19]  650 	adc	a, -19 (ix)
   4833 DD 77 E3      [19]  651 	ld	-29 (ix),a
   4836 DD 7E E2      [19]  652 	ld	a,-30 (ix)
   4839 DD 86 D9      [19]  653 	add	a, -39 (ix)
   483C DD 77 E2      [19]  654 	ld	-30 (ix),a
   483F DD 7E E3      [19]  655 	ld	a,-29 (ix)
   4842 DD 8E DA      [19]  656 	adc	a, -38 (ix)
   4845 DD 77 E3      [19]  657 	ld	-29 (ix),a
   4848 DD 7E E2      [19]  658 	ld	a,-30 (ix)
   484B DD 77 D3      [19]  659 	ld	-45 (ix),a
   484E DD 7E E3      [19]  660 	ld	a,-29 (ix)
   4851 DD 77 D4      [19]  661 	ld	-44 (ix),a
                            662 ;src/pathfinding.c:129: resultado = 0;
   4854 DD 36 DD 00   [19]  663 	ld	-35 (ix),#0x00
   4858                     664 00133$:
                            665 ;src/pathfinding.c:132: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4858 DD 7E F8      [19]  666 	ld	a,-8 (ix)
   485B DD 77 E2      [19]  667 	ld	-30 (ix),a
   485E DD 7E F9      [19]  668 	ld	a,-7 (ix)
   4861 DD 77 E3      [19]  669 	ld	-29 (ix),a
   4864 DD CB F9 7E   [20]  670 	bit	7, -7 (ix)
   4868 28 10         [12]  671 	jr	Z,00177$
   486A DD 7E FA      [19]  672 	ld	a,-6 (ix)
   486D C6 ED         [ 7]  673 	add	a, #0xED
   486F DD 77 E2      [19]  674 	ld	-30 (ix),a
   4872 DD 7E FB      [19]  675 	ld	a,-5 (ix)
   4875 CE FF         [ 7]  676 	adc	a, #0xFF
   4877 DD 77 E3      [19]  677 	ld	-29 (ix),a
   487A                     678 00177$:
   487A DD CB E3 2E   [23]  679 	sra	-29 (ix)
   487E DD CB E2 1E   [23]  680 	rr	-30 (ix)
   4882 DD CB E3 2E   [23]  681 	sra	-29 (ix)
   4886 DD CB E2 1E   [23]  682 	rr	-30 (ix)
   488A DD 4E E2      [19]  683 	ld	c,-30 (ix)
   488D DD 46 E3      [19]  684 	ld	b,-29 (ix)
   4890 69            [ 4]  685 	ld	l, c
   4891 60            [ 4]  686 	ld	h, b
   4892 29            [11]  687 	add	hl, hl
   4893 29            [11]  688 	add	hl, hl
   4894 09            [11]  689 	add	hl, bc
   4895 29            [11]  690 	add	hl, hl
   4896 29            [11]  691 	add	hl, hl
   4897 29            [11]  692 	add	hl, hl
   4898 DD 75 E2      [19]  693 	ld	-30 (ix),l
   489B DD 74 E3      [19]  694 	ld	-29 (ix),h
   489E DD 7E 0A      [19]  695 	ld	a,10 (ix)
   48A1 DD 86 E2      [19]  696 	add	a, -30 (ix)
   48A4 DD 77 E2      [19]  697 	ld	-30 (ix),a
   48A7 DD 7E 0B      [19]  698 	ld	a,11 (ix)
   48AA DD 8E E3      [19]  699 	adc	a, -29 (ix)
   48AD DD 77 E3      [19]  700 	ld	-29 (ix),a
   48B0 DD 7E E2      [19]  701 	ld	a,-30 (ix)
   48B3 DD 86 F4      [19]  702 	add	a, -12 (ix)
   48B6 DD 77 E2      [19]  703 	ld	-30 (ix),a
   48B9 DD 7E E3      [19]  704 	ld	a,-29 (ix)
   48BC CE 00         [ 7]  705 	adc	a, #0x00
   48BE DD 77 E3      [19]  706 	ld	-29 (ix),a
   48C1 DD 6E E2      [19]  707 	ld	l,-30 (ix)
   48C4 DD 66 E3      [19]  708 	ld	h,-29 (ix)
   48C7 7E            [ 7]  709 	ld	a,(hl)
   48C8 DD 77 E2      [19]  710 	ld	-30 (ix),a
   48CB 3E 02         [ 7]  711 	ld	a,#0x02
   48CD DD 96 E2      [19]  712 	sub	a, -30 (ix)
   48D0 DA 7F 49      [10]  713 	jp	C,00141$
   48D3 DD 6E E8      [19]  714 	ld	l,-24 (ix)
   48D6 DD 66 E9      [19]  715 	ld	h,-23 (ix)
   48D9 E5            [11]  716 	push	hl
   48DA 21 2A 6A      [10]  717 	ld	hl,#_sol_matriz
   48DD E5            [11]  718 	push	hl
   48DE CD EF 43      [17]  719 	call	_getBit
   48E1 F1            [10]  720 	pop	af
   48E2 F1            [10]  721 	pop	af
   48E3 2D            [ 4]  722 	dec	l
   48E4 CA 7F 49      [10]  723 	jp	Z,00141$
                            724 ;src/pathfinding.c:133: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   48E7 DD 6E FE      [19]  725 	ld	l,-2 (ix)
   48EA DD 66 FF      [19]  726 	ld	h,-1 (ix)
   48ED E5            [11]  727 	push	hl
   48EE CD FE 4F      [17]  728 	call	_abs
   48F1 F1            [10]  729 	pop	af
   48F2 DD 74 FF      [19]  730 	ld	-1 (ix),h
   48F5 DD 75 FE      [19]  731 	ld	-2 (ix),l
   48F8 DD 7E FA      [19]  732 	ld	a,-6 (ix)
   48FB C6 02         [ 7]  733 	add	a, #0x02
   48FD DD 77 E2      [19]  734 	ld	-30 (ix),a
   4900 DD 7E FB      [19]  735 	ld	a,-5 (ix)
   4903 CE 00         [ 7]  736 	adc	a, #0x00
   4905 DD 77 E3      [19]  737 	ld	-29 (ix),a
   4908 DD 7E F0      [19]  738 	ld	a,-16 (ix)
   490B DD 96 E2      [19]  739 	sub	a, -30 (ix)
   490E DD 77 E2      [19]  740 	ld	-30 (ix),a
   4911 DD 7E F1      [19]  741 	ld	a,-15 (ix)
   4914 DD 9E E3      [19]  742 	sbc	a, -29 (ix)
   4917 DD 77 E3      [19]  743 	ld	-29 (ix),a
   491A DD 6E E2      [19]  744 	ld	l,-30 (ix)
   491D DD 66 E3      [19]  745 	ld	h,-29 (ix)
   4920 E5            [11]  746 	push	hl
   4921 CD FE 4F      [17]  747 	call	_abs
   4924 F1            [10]  748 	pop	af
   4925 DD 74 E3      [19]  749 	ld	-29 (ix),h
   4928 DD 75 E2      [19]  750 	ld	-30 (ix),l
   492B DD 7E FE      [19]  751 	ld	a,-2 (ix)
   492E DD 86 E2      [19]  752 	add	a, -30 (ix)
   4931 DD 77 FE      [19]  753 	ld	-2 (ix),a
   4934 DD 7E FF      [19]  754 	ld	a,-1 (ix)
   4937 DD 8E E3      [19]  755 	adc	a, -29 (ix)
   493A DD 77 FF      [19]  756 	ld	-1 (ix),a
   493D DD 7E D1      [19]  757 	ld	a,-47 (ix)
   4940 DD 86 FE      [19]  758 	add	a, -2 (ix)
   4943 DD 77 FE      [19]  759 	ld	-2 (ix),a
   4946 DD 7E D2      [19]  760 	ld	a,-46 (ix)
   4949 DD 8E FF      [19]  761 	adc	a, -1 (ix)
   494C DD 77 FF      [19]  762 	ld	-1 (ix),a
   494F DD 7E FE      [19]  763 	ld	a,-2 (ix)
   4952 DD 77 DE      [19]  764 	ld	-34 (ix),a
   4955 DD 7E FF      [19]  765 	ld	a,-1 (ix)
   4958 DD 77 DF      [19]  766 	ld	-33 (ix),a
                            767 ;src/pathfinding.c:134: if(resultado == 0){
   495B DD 7E DD      [19]  768 	ld	a,-35 (ix)
   495E B7            [ 4]  769 	or	a, a
   495F 20 1A         [12]  770 	jr	NZ,00138$
                            771 ;src/pathfinding.c:135: if(dist1 > dist2)
   4961 DD 7E DE      [19]  772 	ld	a,-34 (ix)
   4964 DD 96 D3      [19]  773 	sub	a, -45 (ix)
   4967 DD 7E DF      [19]  774 	ld	a,-33 (ix)
   496A DD 9E D4      [19]  775 	sbc	a, -44 (ix)
   496D E2 72 49      [10]  776 	jp	PO, 00340$
   4970 EE 80         [ 7]  777 	xor	a, #0x80
   4972                     778 00340$:
   4972 F2 7F 49      [10]  779 	jp	P,00141$
                            780 ;src/pathfinding.c:136: resultado = 1;	
   4975 DD 36 DD 01   [19]  781 	ld	-35 (ix),#0x01
   4979 18 04         [12]  782 	jr	00141$
   497B                     783 00138$:
                            784 ;src/pathfinding.c:138: resultado = 1;
   497B DD 36 DD 01   [19]  785 	ld	-35 (ix),#0x01
   497F                     786 00141$:
                            787 ;src/pathfinding.c:142: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   497F DD 7E F2      [19]  788 	ld	a,-14 (ix)
   4982 DD 77 FE      [19]  789 	ld	-2 (ix),a
   4985 DD 7E F3      [19]  790 	ld	a,-13 (ix)
   4988 DD 77 FF      [19]  791 	ld	-1 (ix),a
   498B DD 7E F3      [19]  792 	ld	a,-13 (ix)
   498E 07            [ 4]  793 	rlca
   498F E6 01         [ 7]  794 	and	a,#0x01
   4991 DD 77 E2      [19]  795 	ld	-30 (ix),a
   4994 DD 7E FA      [19]  796 	ld	a,-6 (ix)
   4997 C6 EB         [ 7]  797 	add	a, #0xEB
   4999 DD 77 E8      [19]  798 	ld	-24 (ix),a
   499C DD 7E FB      [19]  799 	ld	a,-5 (ix)
   499F CE FF         [ 7]  800 	adc	a, #0xFF
   49A1 DD 77 E9      [19]  801 	ld	-23 (ix),a
   49A4 DD 7E E2      [19]  802 	ld	a,-30 (ix)
   49A7 B7            [ 4]  803 	or	a, a
   49A8 28 0C         [12]  804 	jr	Z,00178$
   49AA DD 7E E8      [19]  805 	ld	a,-24 (ix)
   49AD DD 77 FE      [19]  806 	ld	-2 (ix),a
   49B0 DD 7E E9      [19]  807 	ld	a,-23 (ix)
   49B3 DD 77 FF      [19]  808 	ld	-1 (ix),a
   49B6                     809 00178$:
   49B6 DD CB FF 2E   [23]  810 	sra	-1 (ix)
   49BA DD CB FE 1E   [23]  811 	rr	-2 (ix)
   49BE DD CB FF 2E   [23]  812 	sra	-1 (ix)
   49C2 DD CB FE 1E   [23]  813 	rr	-2 (ix)
   49C6 DD 4E FE      [19]  814 	ld	c,-2 (ix)
   49C9 DD 46 FF      [19]  815 	ld	b,-1 (ix)
   49CC 69            [ 4]  816 	ld	l, c
   49CD 60            [ 4]  817 	ld	h, b
   49CE 29            [11]  818 	add	hl, hl
   49CF 29            [11]  819 	add	hl, hl
   49D0 09            [11]  820 	add	hl, bc
   49D1 29            [11]  821 	add	hl, hl
   49D2 29            [11]  822 	add	hl, hl
   49D3 29            [11]  823 	add	hl, hl
   49D4 DD 75 FE      [19]  824 	ld	-2 (ix),l
   49D7 DD 74 FF      [19]  825 	ld	-1 (ix),h
   49DA DD 7E 0A      [19]  826 	ld	a,10 (ix)
   49DD DD 86 FE      [19]  827 	add	a, -2 (ix)
   49E0 DD 77 FE      [19]  828 	ld	-2 (ix),a
   49E3 DD 7E 0B      [19]  829 	ld	a,11 (ix)
   49E6 DD 8E FF      [19]  830 	adc	a, -1 (ix)
   49E9 DD 77 FF      [19]  831 	ld	-1 (ix),a
   49EC DD 7E EE      [19]  832 	ld	a,-18 (ix)
   49EF DD 77 EC      [19]  833 	ld	-20 (ix),a
   49F2 DD 7E EF      [19]  834 	ld	a,-17 (ix)
   49F5 DD 77 ED      [19]  835 	ld	-19 (ix),a
   49F8 DD CB EF 7E   [20]  836 	bit	7, -17 (ix)
   49FC 28 0C         [12]  837 	jr	Z,00179$
   49FE DD 7E F6      [19]  838 	ld	a,-10 (ix)
   4A01 DD 77 EC      [19]  839 	ld	-20 (ix),a
   4A04 DD 7E F7      [19]  840 	ld	a,-9 (ix)
   4A07 DD 77 ED      [19]  841 	ld	-19 (ix),a
   4A0A                     842 00179$:
   4A0A DD CB ED 2E   [23]  843 	sra	-19 (ix)
   4A0E DD CB EC 1E   [23]  844 	rr	-20 (ix)
   4A12 DD 7E FE      [19]  845 	ld	a,-2 (ix)
   4A15 DD 86 EC      [19]  846 	add	a, -20 (ix)
   4A18 DD 77 FE      [19]  847 	ld	-2 (ix),a
   4A1B DD 7E FF      [19]  848 	ld	a,-1 (ix)
   4A1E DD 8E ED      [19]  849 	adc	a, -19 (ix)
   4A21 DD 77 FF      [19]  850 	ld	-1 (ix),a
   4A24 DD 6E FE      [19]  851 	ld	l,-2 (ix)
   4A27 DD 66 FF      [19]  852 	ld	h,-1 (ix)
   4A2A 7E            [ 7]  853 	ld	a,(hl)
   4A2B DD 77 FE      [19]  854 	ld	-2 (ix),a
                            855 ;src/pathfinding.c:143: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4A2E DD 7E F0      [19]  856 	ld	a,-16 (ix)
   4A31 DD 96 FA      [19]  857 	sub	a, -6 (ix)
   4A34 DD 77 F0      [19]  858 	ld	-16 (ix),a
   4A37 DD 7E F1      [19]  859 	ld	a,-15 (ix)
   4A3A DD 9E FB      [19]  860 	sbc	a, -5 (ix)
   4A3D DD 77 F1      [19]  861 	ld	-15 (ix),a
                            862 ;src/pathfinding.c:142: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   4A40 3E 02         [ 7]  863 	ld	a,#0x02
   4A42 DD 96 FE      [19]  864 	sub	a, -2 (ix)
   4A45 DA FE 4A      [10]  865 	jp	C,00154$
   4A48 DD 6E E4      [19]  866 	ld	l,-28 (ix)
   4A4B DD 66 E5      [19]  867 	ld	h,-27 (ix)
   4A4E E5            [11]  868 	push	hl
   4A4F 21 2A 6A      [10]  869 	ld	hl,#_sol_matriz
   4A52 E5            [11]  870 	push	hl
   4A53 CD EF 43      [17]  871 	call	_getBit
   4A56 F1            [10]  872 	pop	af
   4A57 F1            [10]  873 	pop	af
   4A58 DD 75 FE      [19]  874 	ld	-2 (ix), l
   4A5B 7D            [ 4]  875 	ld	a, l
   4A5C 3D            [ 4]  876 	dec	a
   4A5D CA FE 4A      [10]  877 	jp	Z,00154$
                            878 ;src/pathfinding.c:143: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4A60 DD 7E EA      [19]  879 	ld	a,-22 (ix)
   4A63 DD 96 EE      [19]  880 	sub	a, -18 (ix)
   4A66 4F            [ 4]  881 	ld	c,a
   4A67 DD 7E EB      [19]  882 	ld	a,-21 (ix)
   4A6A DD 9E EF      [19]  883 	sbc	a, -17 (ix)
   4A6D 47            [ 4]  884 	ld	b,a
   4A6E C5            [11]  885 	push	bc
   4A6F CD FE 4F      [17]  886 	call	_abs
   4A72 F1            [10]  887 	pop	af
   4A73 DD 74 FF      [19]  888 	ld	-1 (ix),h
   4A76 DD 75 FE      [19]  889 	ld	-2 (ix),l
   4A79 DD 6E F0      [19]  890 	ld	l,-16 (ix)
   4A7C DD 66 F1      [19]  891 	ld	h,-15 (ix)
   4A7F E5            [11]  892 	push	hl
   4A80 CD FE 4F      [17]  893 	call	_abs
   4A83 F1            [10]  894 	pop	af
   4A84 DD 74 ED      [19]  895 	ld	-19 (ix),h
   4A87 DD 75 EC      [19]  896 	ld	-20 (ix),l
   4A8A DD 7E FE      [19]  897 	ld	a,-2 (ix)
   4A8D DD 86 EC      [19]  898 	add	a, -20 (ix)
   4A90 DD 77 FE      [19]  899 	ld	-2 (ix),a
   4A93 DD 7E FF      [19]  900 	ld	a,-1 (ix)
   4A96 DD 8E ED      [19]  901 	adc	a, -19 (ix)
   4A99 DD 77 FF      [19]  902 	ld	-1 (ix),a
   4A9C DD 7E D5      [19]  903 	ld	a,-43 (ix)
   4A9F DD 86 FE      [19]  904 	add	a, -2 (ix)
   4AA2 DD 77 FE      [19]  905 	ld	-2 (ix),a
   4AA5 DD 7E D6      [19]  906 	ld	a,-42 (ix)
   4AA8 DD 8E FF      [19]  907 	adc	a, -1 (ix)
   4AAB DD 77 FF      [19]  908 	ld	-1 (ix),a
   4AAE DD 7E FE      [19]  909 	ld	a,-2 (ix)
   4AB1 DD 77 DB      [19]  910 	ld	-37 (ix),a
   4AB4 DD 7E FF      [19]  911 	ld	a,-1 (ix)
   4AB7 DD 77 DC      [19]  912 	ld	-36 (ix),a
                            913 ;src/pathfinding.c:144: if(resultado == 0){
   4ABA DD 7E DD      [19]  914 	ld	a,-35 (ix)
   4ABD B7            [ 4]  915 	or	a, a
   4ABE 20 1A         [12]  916 	jr	NZ,00151$
                            917 ;src/pathfinding.c:145: if(dist1 >= dist3)
   4AC0 DD 7E D3      [19]  918 	ld	a,-45 (ix)
   4AC3 DD 96 DB      [19]  919 	sub	a, -37 (ix)
   4AC6 DD 7E D4      [19]  920 	ld	a,-44 (ix)
   4AC9 DD 9E DC      [19]  921 	sbc	a, -36 (ix)
   4ACC E2 D1 4A      [10]  922 	jp	PO, 00342$
   4ACF EE 80         [ 7]  923 	xor	a, #0x80
   4AD1                     924 00342$:
   4AD1 FA FE 4A      [10]  925 	jp	M,00154$
                            926 ;src/pathfinding.c:146: resultado = 2;
   4AD4 DD 36 DD 02   [19]  927 	ld	-35 (ix),#0x02
   4AD8 18 24         [12]  928 	jr	00154$
   4ADA                     929 00151$:
                            930 ;src/pathfinding.c:147: }else if(resultado == 1){
   4ADA DD 7E DD      [19]  931 	ld	a,-35 (ix)
   4ADD 3D            [ 4]  932 	dec	a
   4ADE 20 1A         [12]  933 	jr	NZ,00148$
                            934 ;src/pathfinding.c:148: if(dist2 >= dist3)
   4AE0 DD 7E DE      [19]  935 	ld	a,-34 (ix)
   4AE3 DD 96 DB      [19]  936 	sub	a, -37 (ix)
   4AE6 DD 7E DF      [19]  937 	ld	a,-33 (ix)
   4AE9 DD 9E DC      [19]  938 	sbc	a, -36 (ix)
   4AEC E2 F1 4A      [10]  939 	jp	PO, 00345$
   4AEF EE 80         [ 7]  940 	xor	a, #0x80
   4AF1                     941 00345$:
   4AF1 FA FE 4A      [10]  942 	jp	M,00154$
                            943 ;src/pathfinding.c:149: resultado = 2;
   4AF4 DD 36 DD 02   [19]  944 	ld	-35 (ix),#0x02
   4AF8 18 04         [12]  945 	jr	00154$
   4AFA                     946 00148$:
                            947 ;src/pathfinding.c:151: resultado = 2;
   4AFA DD 36 DD 02   [19]  948 	ld	-35 (ix),#0x02
   4AFE                     949 00154$:
                            950 ;src/pathfinding.c:155: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
   4AFE DD 7E F2      [19]  951 	ld	a,-14 (ix)
   4B01 DD 77 FE      [19]  952 	ld	-2 (ix),a
   4B04 DD 7E F3      [19]  953 	ld	a,-13 (ix)
   4B07 DD 77 FF      [19]  954 	ld	-1 (ix),a
   4B0A DD 7E E2      [19]  955 	ld	a,-30 (ix)
   4B0D B7            [ 4]  956 	or	a, a
   4B0E 28 0C         [12]  957 	jr	Z,00180$
   4B10 DD 7E E8      [19]  958 	ld	a,-24 (ix)
   4B13 DD 77 FE      [19]  959 	ld	-2 (ix),a
   4B16 DD 7E E9      [19]  960 	ld	a,-23 (ix)
   4B19 DD 77 FF      [19]  961 	ld	-1 (ix),a
   4B1C                     962 00180$:
   4B1C DD CB FF 2E   [23]  963 	sra	-1 (ix)
   4B20 DD CB FE 1E   [23]  964 	rr	-2 (ix)
   4B24 DD CB FF 2E   [23]  965 	sra	-1 (ix)
   4B28 DD CB FE 1E   [23]  966 	rr	-2 (ix)
   4B2C DD 4E FE      [19]  967 	ld	c,-2 (ix)
   4B2F DD 46 FF      [19]  968 	ld	b,-1 (ix)
   4B32 69            [ 4]  969 	ld	l, c
   4B33 60            [ 4]  970 	ld	h, b
   4B34 29            [11]  971 	add	hl, hl
   4B35 29            [11]  972 	add	hl, hl
   4B36 09            [11]  973 	add	hl, bc
   4B37 29            [11]  974 	add	hl, hl
   4B38 29            [11]  975 	add	hl, hl
   4B39 29            [11]  976 	add	hl, hl
   4B3A DD 75 FE      [19]  977 	ld	-2 (ix),l
   4B3D DD 74 FF      [19]  978 	ld	-1 (ix),h
   4B40 DD 7E 0A      [19]  979 	ld	a,10 (ix)
   4B43 DD 86 FE      [19]  980 	add	a, -2 (ix)
   4B46 DD 77 FE      [19]  981 	ld	-2 (ix),a
   4B49 DD 7E 0B      [19]  982 	ld	a,11 (ix)
   4B4C DD 8E FF      [19]  983 	adc	a, -1 (ix)
   4B4F DD 77 FF      [19]  984 	ld	-1 (ix),a
   4B52 DD 7E FC      [19]  985 	ld	a,-4 (ix)
   4B55 DD 77 E2      [19]  986 	ld	-30 (ix),a
   4B58 DD 7E FD      [19]  987 	ld	a,-3 (ix)
   4B5B DD 77 E3      [19]  988 	ld	-29 (ix),a
   4B5E DD CB FD 7E   [20]  989 	bit	7, -3 (ix)
   4B62 28 10         [12]  990 	jr	Z,00181$
   4B64 DD 7E F6      [19]  991 	ld	a,-10 (ix)
   4B67 C6 02         [ 7]  992 	add	a, #0x02
   4B69 DD 77 E2      [19]  993 	ld	-30 (ix),a
   4B6C DD 7E F7      [19]  994 	ld	a,-9 (ix)
   4B6F CE 00         [ 7]  995 	adc	a, #0x00
   4B71 DD 77 E3      [19]  996 	ld	-29 (ix),a
   4B74                     997 00181$:
   4B74 DD CB E3 2E   [23]  998 	sra	-29 (ix)
   4B78 DD CB E2 1E   [23]  999 	rr	-30 (ix)
   4B7C DD 7E E2      [19] 1000 	ld	a,-30 (ix)
   4B7F DD 86 FE      [19] 1001 	add	a, -2 (ix)
   4B82 DD 77 FE      [19] 1002 	ld	-2 (ix),a
   4B85 DD 7E E3      [19] 1003 	ld	a,-29 (ix)
   4B88 DD 8E FF      [19] 1004 	adc	a, -1 (ix)
   4B8B DD 77 FF      [19] 1005 	ld	-1 (ix),a
   4B8E DD 6E FE      [19] 1006 	ld	l,-2 (ix)
   4B91 DD 66 FF      [19] 1007 	ld	h,-1 (ix)
   4B94 7E            [ 7] 1008 	ld	a,(hl)
   4B95 DD 77 FE      [19] 1009 	ld	-2 (ix),a
   4B98 3E 02         [ 7] 1010 	ld	a,#0x02
   4B9A DD 96 FE      [19] 1011 	sub	a, -2 (ix)
   4B9D DA 67 4C      [10] 1012 	jp	C,00172$
   4BA0 DD 6E E6      [19] 1013 	ld	l,-26 (ix)
   4BA3 DD 66 E7      [19] 1014 	ld	h,-25 (ix)
   4BA6 E5            [11] 1015 	push	hl
   4BA7 21 2A 6A      [10] 1016 	ld	hl,#_sol_matriz
   4BAA E5            [11] 1017 	push	hl
   4BAB CD EF 43      [17] 1018 	call	_getBit
   4BAE F1            [10] 1019 	pop	af
   4BAF F1            [10] 1020 	pop	af
   4BB0 2D            [ 4] 1021 	dec	l
   4BB1 CA 67 4C      [10] 1022 	jp	Z,00172$
                           1023 ;src/pathfinding.c:156: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   4BB4 DD 7E EA      [19] 1024 	ld	a,-22 (ix)
   4BB7 DD 96 FC      [19] 1025 	sub	a, -4 (ix)
   4BBA 4F            [ 4] 1026 	ld	c,a
   4BBB DD 7E EB      [19] 1027 	ld	a,-21 (ix)
   4BBE DD 9E FD      [19] 1028 	sbc	a, -3 (ix)
   4BC1 47            [ 4] 1029 	ld	b,a
   4BC2 C5            [11] 1030 	push	bc
   4BC3 CD FE 4F      [17] 1031 	call	_abs
   4BC6 F1            [10] 1032 	pop	af
   4BC7 DD 74 FF      [19] 1033 	ld	-1 (ix),h
   4BCA DD 75 FE      [19] 1034 	ld	-2 (ix),l
   4BCD DD 6E F0      [19] 1035 	ld	l,-16 (ix)
   4BD0 DD 66 F1      [19] 1036 	ld	h,-15 (ix)
   4BD3 E5            [11] 1037 	push	hl
   4BD4 CD FE 4F      [17] 1038 	call	_abs
   4BD7 F1            [10] 1039 	pop	af
   4BD8 DD 74 F1      [19] 1040 	ld	-15 (ix),h
   4BDB DD 75 F0      [19] 1041 	ld	-16 (ix),l
   4BDE DD 7E FE      [19] 1042 	ld	a,-2 (ix)
   4BE1 DD 86 F0      [19] 1043 	add	a, -16 (ix)
   4BE4 DD 77 FE      [19] 1044 	ld	-2 (ix),a
   4BE7 DD 7E FF      [19] 1045 	ld	a,-1 (ix)
   4BEA DD 8E F1      [19] 1046 	adc	a, -15 (ix)
   4BED DD 77 FF      [19] 1047 	ld	-1 (ix),a
   4BF0 DD 7E FE      [19] 1048 	ld	a,-2 (ix)
   4BF3 DD 86 D7      [19] 1049 	add	a, -41 (ix)
   4BF6 DD 77 E0      [19] 1050 	ld	-32 (ix),a
   4BF9 DD 7E FF      [19] 1051 	ld	a,-1 (ix)
   4BFC DD 8E D8      [19] 1052 	adc	a, -40 (ix)
   4BFF DD 77 E1      [19] 1053 	ld	-31 (ix),a
                           1054 ;src/pathfinding.c:157: if(resultado == 0){
   4C02 DD 7E DD      [19] 1055 	ld	a,-35 (ix)
   4C05 B7            [ 4] 1056 	or	a, a
   4C06 20 1A         [12] 1057 	jr	NZ,00169$
                           1058 ;src/pathfinding.c:158: if(dist1 >= dist4)
   4C08 DD 7E D3      [19] 1059 	ld	a,-45 (ix)
   4C0B DD 96 E0      [19] 1060 	sub	a, -32 (ix)
   4C0E DD 7E D4      [19] 1061 	ld	a,-44 (ix)
   4C11 DD 9E E1      [19] 1062 	sbc	a, -31 (ix)
   4C14 E2 19 4C      [10] 1063 	jp	PO, 00347$
   4C17 EE 80         [ 7] 1064 	xor	a, #0x80
   4C19                    1065 00347$:
   4C19 FA 67 4C      [10] 1066 	jp	M,00172$
                           1067 ;src/pathfinding.c:159: resultado = 3;
   4C1C DD 36 DD 03   [19] 1068 	ld	-35 (ix),#0x03
   4C20 18 45         [12] 1069 	jr	00172$
   4C22                    1070 00169$:
                           1071 ;src/pathfinding.c:160: }else if(resultado == 1){
   4C22 DD 7E DD      [19] 1072 	ld	a,-35 (ix)
   4C25 3D            [ 4] 1073 	dec	a
   4C26 20 1A         [12] 1074 	jr	NZ,00166$
                           1075 ;src/pathfinding.c:161: if(dist2 >= dist4)
   4C28 DD 7E DE      [19] 1076 	ld	a,-34 (ix)
   4C2B DD 96 E0      [19] 1077 	sub	a, -32 (ix)
   4C2E DD 7E DF      [19] 1078 	ld	a,-33 (ix)
   4C31 DD 9E E1      [19] 1079 	sbc	a, -31 (ix)
   4C34 E2 39 4C      [10] 1080 	jp	PO, 00350$
   4C37 EE 80         [ 7] 1081 	xor	a, #0x80
   4C39                    1082 00350$:
   4C39 FA 67 4C      [10] 1083 	jp	M,00172$
                           1084 ;src/pathfinding.c:162: resultado = 3;
   4C3C DD 36 DD 03   [19] 1085 	ld	-35 (ix),#0x03
   4C40 18 25         [12] 1086 	jr	00172$
   4C42                    1087 00166$:
                           1088 ;src/pathfinding.c:163: }else if (resultado == 2){
   4C42 DD 7E DD      [19] 1089 	ld	a,-35 (ix)
   4C45 D6 02         [ 7] 1090 	sub	a, #0x02
   4C47 20 1A         [12] 1091 	jr	NZ,00163$
                           1092 ;src/pathfinding.c:164: if(dist3 >= dist4)
   4C49 DD 7E DB      [19] 1093 	ld	a,-37 (ix)
   4C4C DD 96 E0      [19] 1094 	sub	a, -32 (ix)
   4C4F DD 7E DC      [19] 1095 	ld	a,-36 (ix)
   4C52 DD 9E E1      [19] 1096 	sbc	a, -31 (ix)
   4C55 E2 5A 4C      [10] 1097 	jp	PO, 00353$
   4C58 EE 80         [ 7] 1098 	xor	a, #0x80
   4C5A                    1099 00353$:
   4C5A FA 67 4C      [10] 1100 	jp	M,00172$
                           1101 ;src/pathfinding.c:165: resultado = 3;
   4C5D DD 36 DD 03   [19] 1102 	ld	-35 (ix),#0x03
   4C61 18 04         [12] 1103 	jr	00172$
   4C63                    1104 00163$:
                           1105 ;src/pathfinding.c:167: resultado = 3;
   4C63 DD 36 DD 03   [19] 1106 	ld	-35 (ix),#0x03
   4C67                    1107 00172$:
                           1108 ;src/pathfinding.c:171: return resultado;
   4C67 DD 6E DD      [19] 1109 	ld	l,-35 (ix)
   4C6A DD F9         [10] 1110 	ld	sp, ix
   4C6C DD E1         [14] 1111 	pop	ix
   4C6E C9            [10] 1112 	ret
                           1113 ;src/pathfinding.c:175: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                           1114 ;	---------------------------------
                           1115 ; Function pathFinding
                           1116 ; ---------------------------------
   4C6F                    1117 _pathFinding::
   4C6F DD E5         [15] 1118 	push	ix
   4C71 DD 21 00 00   [14] 1119 	ld	ix,#0
   4C75 DD 39         [15] 1120 	add	ix,sp
   4C77 21 E9 FF      [10] 1121 	ld	hl,#-23
   4C7A 39            [11] 1122 	add	hl,sp
   4C7B F9            [ 6] 1123 	ld	sp,hl
                           1124 ;src/pathfinding.c:187: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
   4C7C DD 4E EC      [19] 1125 	ld	c,-20 (ix)
   4C7F 06 00         [ 7] 1126 	ld	b,#0x00
   4C81 21 EA FF      [10] 1127 	ld	hl,#0xFFEA
   4C84 09            [11] 1128 	add	hl,bc
   4C85 5D            [ 4] 1129 	ld	e, l
   4C86 54            [ 4] 1130 	ld	d, h
   4C87 29            [11] 1131 	add	hl, hl
   4C88 29            [11] 1132 	add	hl, hl
   4C89 19            [11] 1133 	add	hl, de
   4C8A 29            [11] 1134 	add	hl, hl
   4C8B 29            [11] 1135 	add	hl, hl
   4C8C 29            [11] 1136 	add	hl, hl
   4C8D 29            [11] 1137 	add	hl, hl
   4C8E DD 5E F6      [19] 1138 	ld	e,-10 (ix)
   4C91 16 00         [ 7] 1139 	ld	d,#0x00
   4C93 19            [11] 1140 	add	hl,de
   4C94 DD 75 EF      [19] 1141 	ld	-17 (ix),l
   4C97 DD 74 F0      [19] 1142 	ld	-16 (ix),h
                           1143 ;src/pathfinding.c:188: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
   4C9A 79            [ 4] 1144 	ld	a,c
   4C9B C6 E6         [ 7] 1145 	add	a,#0xE6
   4C9D 6F            [ 4] 1146 	ld	l,a
   4C9E 78            [ 4] 1147 	ld	a,b
   4C9F CE FF         [ 7] 1148 	adc	a,#0xFF
   4CA1 67            [ 4] 1149 	ld	h,a
   4CA2 D5            [11] 1150 	push	de
   4CA3 5D            [ 4] 1151 	ld	e, l
   4CA4 54            [ 4] 1152 	ld	d, h
   4CA5 29            [11] 1153 	add	hl, hl
   4CA6 29            [11] 1154 	add	hl, hl
   4CA7 19            [11] 1155 	add	hl, de
   4CA8 29            [11] 1156 	add	hl, hl
   4CA9 29            [11] 1157 	add	hl, hl
   4CAA 29            [11] 1158 	add	hl, hl
   4CAB 29            [11] 1159 	add	hl, hl
   4CAC D1            [10] 1160 	pop	de
   4CAD 19            [11] 1161 	add	hl,de
   4CAE DD 75 F2      [19] 1162 	ld	-14 (ix),l
   4CB1 DD 74 F3      [19] 1163 	ld	-13 (ix),h
                           1164 ;src/pathfinding.c:189: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
   4CB4 79            [ 4] 1165 	ld	a,c
   4CB5 C6 E8         [ 7] 1166 	add	a,#0xE8
   4CB7 4F            [ 4] 1167 	ld	c,a
   4CB8 78            [ 4] 1168 	ld	a,b
   4CB9 CE FF         [ 7] 1169 	adc	a,#0xFF
   4CBB 47            [ 4] 1170 	ld	b,a
   4CBC 69            [ 4] 1171 	ld	l, c
   4CBD 60            [ 4] 1172 	ld	h, b
   4CBE 29            [11] 1173 	add	hl, hl
   4CBF 29            [11] 1174 	add	hl, hl
   4CC0 09            [11] 1175 	add	hl, bc
   4CC1 29            [11] 1176 	add	hl, hl
   4CC2 29            [11] 1177 	add	hl, hl
   4CC3 29            [11] 1178 	add	hl, hl
   4CC4 29            [11] 1179 	add	hl, hl
   4CC5 4D            [ 4] 1180 	ld	c,l
   4CC6 44            [ 4] 1181 	ld	b,h
   4CC7 6B            [ 4] 1182 	ld	l, e
   4CC8 62            [ 4] 1183 	ld	h, d
   4CC9 23            [ 6] 1184 	inc	hl
   4CCA 09            [11] 1185 	add	hl,bc
   4CCB 33            [ 6] 1186 	inc	sp
   4CCC 33            [ 6] 1187 	inc	sp
   4CCD E5            [11] 1188 	push	hl
                           1189 ;src/pathfinding.c:190: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
   4CCE 1B            [ 6] 1190 	dec	de
   4CCF 69            [ 4] 1191 	ld	l, c
   4CD0 60            [ 4] 1192 	ld	h, b
   4CD1 19            [11] 1193 	add	hl,de
   4CD2 DD 75 ED      [19] 1194 	ld	-19 (ix),l
   4CD5 DD 74 EE      [19] 1195 	ld	-18 (ix),h
                           1196 ;src/pathfinding.c:192: u8 problem = 0;
   4CD8 DD 36 F4 00   [19] 1197 	ld	-12 (ix),#0x00
                           1198 ;src/pathfinding.c:194: x = s_x;
   4CDC DD 7E 04      [19] 1199 	ld	a,4 (ix)
   4CDF DD 77 F6      [19] 1200 	ld	-10 (ix),a
                           1201 ;src/pathfinding.c:196: y = s_y;
   4CE2 DD 7E 05      [19] 1202 	ld	a,5 (ix)
   4CE5 DD 77 EC      [19] 1203 	ld	-20 (ix),a
                           1204 ;src/pathfinding.c:198: k = 0;
   4CE8 DD 36 F9 00   [19] 1205 	ld	-7 (ix),#0x00
                           1206 ;src/pathfinding.c:199: aux = 1;
   4CEC DD 36 F5 01   [19] 1207 	ld	-11 (ix),#0x01
                           1208 ;src/pathfinding.c:202: memset(sol_matriz, 0, (40*2*44*4)/8);
   4CF0 21 2A 6A      [10] 1209 	ld	hl,#_sol_matriz
   4CF3 36 00         [10] 1210 	ld	(hl), #0x00
   4CF5 5D            [ 4] 1211 	ld	e, l
   4CF6 54            [ 4] 1212 	ld	d, h
   4CF7 13            [ 6] 1213 	inc	de
   4CF8 01 DF 06      [10] 1214 	ld	bc, #0x06DF
   4CFB ED B0         [21] 1215 	ldir
                           1216 ;src/pathfinding.c:203: enemy->longitud_camino = 0;
   4CFD DD 7E 08      [19] 1217 	ld	a,8 (ix)
   4D00 DD 77 FE      [19] 1218 	ld	-2 (ix),a
   4D03 DD 7E 09      [19] 1219 	ld	a,9 (ix)
   4D06 DD 77 FF      [19] 1220 	ld	-1 (ix),a
   4D09 DD 7E FE      [19] 1221 	ld	a,-2 (ix)
   4D0C C6 45         [ 7] 1222 	add	a, #0x45
   4D0E DD 77 F7      [19] 1223 	ld	-9 (ix),a
   4D11 DD 7E FF      [19] 1224 	ld	a,-1 (ix)
   4D14 CE 01         [ 7] 1225 	adc	a, #0x01
   4D16 DD 77 F8      [19] 1226 	ld	-8 (ix),a
   4D19 DD 6E F7      [19] 1227 	ld	l,-9 (ix)
   4D1C DD 66 F8      [19] 1228 	ld	h,-8 (ix)
   4D1F 36 00         [10] 1229 	ld	(hl),#0x00
                           1230 ;src/pathfinding.c:204: sol_tam = 1;
   4D21 21 29 6A      [10] 1231 	ld	hl,#_sol_tam + 0
   4D24 36 01         [10] 1232 	ld	(hl), #0x01
                           1233 ;src/pathfinding.c:205: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
   4D26 DD 7E EC      [19] 1234 	ld	a,-20 (ix)
   4D29 DD 77 FA      [19] 1235 	ld	-6 (ix),a
   4D2C DD 36 FB 00   [19] 1236 	ld	-5 (ix),#0x00
   4D30 DD 7E FA      [19] 1237 	ld	a,-6 (ix)
   4D33 C6 E8         [ 7] 1238 	add	a,#0xE8
   4D35 DD 77 FA      [19] 1239 	ld	-6 (ix),a
   4D38 DD 7E FB      [19] 1240 	ld	a,-5 (ix)
   4D3B CE FF         [ 7] 1241 	adc	a,#0xFF
   4D3D DD 77 FB      [19] 1242 	ld	-5 (ix),a
   4D40 DD 4E FA      [19] 1243 	ld	c,-6 (ix)
   4D43 DD 46 FB      [19] 1244 	ld	b,-5 (ix)
   4D46 69            [ 4] 1245 	ld	l, c
   4D47 60            [ 4] 1246 	ld	h, b
   4D48 29            [11] 1247 	add	hl, hl
   4D49 29            [11] 1248 	add	hl, hl
   4D4A 09            [11] 1249 	add	hl, bc
   4D4B 29            [11] 1250 	add	hl, hl
   4D4C 29            [11] 1251 	add	hl, hl
   4D4D 29            [11] 1252 	add	hl, hl
   4D4E 29            [11] 1253 	add	hl, hl
   4D4F DD 75 FA      [19] 1254 	ld	-6 (ix),l
   4D52 DD 74 FB      [19] 1255 	ld	-5 (ix),h
   4D55 DD 7E F6      [19] 1256 	ld	a,-10 (ix)
   4D58 DD 77 FC      [19] 1257 	ld	-4 (ix),a
   4D5B DD 36 FD 00   [19] 1258 	ld	-3 (ix),#0x00
   4D5F DD 7E FA      [19] 1259 	ld	a,-6 (ix)
   4D62 DD 86 FC      [19] 1260 	add	a, -4 (ix)
   4D65 DD 77 FC      [19] 1261 	ld	-4 (ix),a
   4D68 DD 7E FB      [19] 1262 	ld	a,-5 (ix)
   4D6B DD 8E FD      [19] 1263 	adc	a, -3 (ix)
   4D6E DD 77 FD      [19] 1264 	ld	-3 (ix),a
   4D71 21 01 00      [10] 1265 	ld	hl,#0x0001
   4D74 E5            [11] 1266 	push	hl
   4D75 DD 6E FC      [19] 1267 	ld	l,-4 (ix)
   4D78 DD 66 FD      [19] 1268 	ld	h,-3 (ix)
   4D7B E5            [11] 1269 	push	hl
   4D7C 21 2A 6A      [10] 1270 	ld	hl,#_sol_matriz
   4D7F E5            [11] 1271 	push	hl
   4D80 CD 4A 44      [17] 1272 	call	_setBit
   4D83 21 06 00      [10] 1273 	ld	hl,#6
   4D86 39            [11] 1274 	add	hl,sp
   4D87 F9            [ 6] 1275 	ld	sp,hl
                           1276 ;src/pathfinding.c:206: inserted = anyadirALista(x, y);
   4D88 DD 66 EC      [19] 1277 	ld	h,-20 (ix)
   4D8B DD 6E F6      [19] 1278 	ld	l,-10 (ix)
   4D8E E5            [11] 1279 	push	hl
   4D8F CD C4 44      [17] 1280 	call	_anyadirALista
   4D92 F1            [10] 1281 	pop	af
   4D93 DD 75 EB      [19] 1282 	ld	-21 (ix),l
                           1283 ;src/pathfinding.c:210: while (aux){
   4D96                    1284 00116$:
   4D96 DD 7E F5      [19] 1285 	ld	a,-11 (ix)
   4D99 B7            [ 4] 1286 	or	a, a
   4D9A CA 3D 4F      [10] 1287 	jp	Z,00118$
                           1288 ;src/pathfinding.c:211: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   4D9D DD 7E 06      [19] 1289 	ld	a,6 (ix)
   4DA0 DD 96 F6      [19] 1290 	sub	a, -10 (ix)
   4DA3 20 08         [12] 1291 	jr	NZ,00114$
   4DA5 DD 7E 07      [19] 1292 	ld	a,7 (ix)
   4DA8 DD 96 EC      [19] 1293 	sub	a, -20 (ix)
   4DAB 28 0C         [12] 1294 	jr	Z,00110$
   4DAD                    1295 00114$:
   4DAD 3A 29 6A      [13] 1296 	ld	a,(#_sol_tam + 0)
   4DB0 B7            [ 4] 1297 	or	a, a
   4DB1 28 06         [12] 1298 	jr	Z,00110$
   4DB3 DD 7E EB      [19] 1299 	ld	a,-21 (ix)
   4DB6 B7            [ 4] 1300 	or	a, a
   4DB7 20 16         [12] 1301 	jr	NZ,00111$
   4DB9                    1302 00110$:
                           1303 ;src/pathfinding.c:213: if(inserted == 0 || sol_tam == 0){
   4DB9 DD 7E EB      [19] 1304 	ld	a,-21 (ix)
   4DBC B7            [ 4] 1305 	or	a, a
   4DBD 28 06         [12] 1306 	jr	Z,00101$
   4DBF 3A 29 6A      [13] 1307 	ld	a,(#_sol_tam + 0)
   4DC2 B7            [ 4] 1308 	or	a, a
   4DC3 20 04         [12] 1309 	jr	NZ,00102$
   4DC5                    1310 00101$:
                           1311 ;src/pathfinding.c:214: problem = 1;
   4DC5 DD 36 F4 01   [19] 1312 	ld	-12 (ix),#0x01
   4DC9                    1313 00102$:
                           1314 ;src/pathfinding.c:217: aux = 0;
   4DC9 DD 36 F5 00   [19] 1315 	ld	-11 (ix),#0x00
   4DCD 18 C7         [12] 1316 	jr	00116$
   4DCF                    1317 00111$:
                           1318 ;src/pathfinding.c:219: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   4DCF DD 6E 0A      [19] 1319 	ld	l,10 (ix)
   4DD2 DD 66 0B      [19] 1320 	ld	h,11 (ix)
   4DD5 E5            [11] 1321 	push	hl
   4DD6 DD 66 07      [19] 1322 	ld	h,7 (ix)
   4DD9 DD 6E 06      [19] 1323 	ld	l,6 (ix)
   4DDC E5            [11] 1324 	push	hl
   4DDD DD 66 05      [19] 1325 	ld	h,5 (ix)
   4DE0 DD 6E 04      [19] 1326 	ld	l,4 (ix)
   4DE3 E5            [11] 1327 	push	hl
   4DE4 DD 66 EC      [19] 1328 	ld	h,-20 (ix)
   4DE7 DD 6E F6      [19] 1329 	ld	l,-10 (ix)
   4DEA E5            [11] 1330 	push	hl
   4DEB CD 02 45      [17] 1331 	call	_adjacentTiles
   4DEE F1            [10] 1332 	pop	af
   4DEF F1            [10] 1333 	pop	af
   4DF0 F1            [10] 1334 	pop	af
   4DF1 F1            [10] 1335 	pop	af
   4DF2 5D            [ 4] 1336 	ld	e,l
                           1337 ;src/pathfinding.c:221: switch(movimiento){
   4DF3 3E 04         [ 7] 1338 	ld	a,#0x04
   4DF5 93            [ 4] 1339 	sub	a, e
   4DF6 38 9E         [12] 1340 	jr	C,00116$
                           1341 ;src/pathfinding.c:227: k = k+2;
   4DF8 DD 4E F9      [19] 1342 	ld	c,-7 (ix)
   4DFB 0C            [ 4] 1343 	inc	c
   4DFC 0C            [ 4] 1344 	inc	c
                           1345 ;src/pathfinding.c:221: switch(movimiento){
   4DFD 16 00         [ 7] 1346 	ld	d,#0x00
   4DFF 21 06 4E      [10] 1347 	ld	hl,#00169$
   4E02 19            [11] 1348 	add	hl,de
   4E03 19            [11] 1349 	add	hl,de
   4E04 19            [11] 1350 	add	hl,de
   4E05 E9            [ 4] 1351 	jp	(hl)
   4E06                    1352 00169$:
   4E06 C3 15 4E      [10] 1353 	jp	00104$
   4E09 C3 4C 4E      [10] 1354 	jp	00105$
   4E0C C3 83 4E      [10] 1355 	jp	00106$
   4E0F C3 B9 4E      [10] 1356 	jp	00107$
   4E12 C3 EF 4E      [10] 1357 	jp	00108$
                           1358 ;src/pathfinding.c:222: case 0:
   4E15                    1359 00104$:
                           1360 ;src/pathfinding.c:224: setBit(sol_matriz, up, 1);
   4E15 C5            [11] 1361 	push	bc
   4E16 21 01 00      [10] 1362 	ld	hl,#0x0001
   4E19 E5            [11] 1363 	push	hl
   4E1A DD 6E F2      [19] 1364 	ld	l,-14 (ix)
   4E1D DD 66 F3      [19] 1365 	ld	h,-13 (ix)
   4E20 E5            [11] 1366 	push	hl
   4E21 21 2A 6A      [10] 1367 	ld	hl,#_sol_matriz
   4E24 E5            [11] 1368 	push	hl
   4E25 CD 4A 44      [17] 1369 	call	_setBit
   4E28 21 06 00      [10] 1370 	ld	hl,#6
   4E2B 39            [11] 1371 	add	hl,sp
   4E2C F9            [ 6] 1372 	ld	sp,hl
   4E2D C1            [10] 1373 	pop	bc
                           1374 ;src/pathfinding.c:225: inserted = anyadirALista(x, y-2);
   4E2E DD 46 EC      [19] 1375 	ld	b,-20 (ix)
   4E31 05            [ 4] 1376 	dec	b
   4E32 05            [ 4] 1377 	dec	b
   4E33 C5            [11] 1378 	push	bc
   4E34 C5            [11] 1379 	push	bc
   4E35 33            [ 6] 1380 	inc	sp
   4E36 DD 7E F6      [19] 1381 	ld	a,-10 (ix)
   4E39 F5            [11] 1382 	push	af
   4E3A 33            [ 6] 1383 	inc	sp
   4E3B CD C4 44      [17] 1384 	call	_anyadirALista
   4E3E F1            [10] 1385 	pop	af
   4E3F C1            [10] 1386 	pop	bc
   4E40 DD 75 EB      [19] 1387 	ld	-21 (ix),l
                           1388 ;src/pathfinding.c:226: y = y-1;
   4E43 DD 35 EC      [23] 1389 	dec	-20 (ix)
                           1390 ;src/pathfinding.c:227: k = k+2;
   4E46 DD 71 F9      [19] 1391 	ld	-7 (ix),c
                           1392 ;src/pathfinding.c:228: break;
   4E49 C3 96 4D      [10] 1393 	jp	00116$
                           1394 ;src/pathfinding.c:229: case 1:
   4E4C                    1395 00105$:
                           1396 ;src/pathfinding.c:231: setBit(sol_matriz, down, 1);
   4E4C C5            [11] 1397 	push	bc
   4E4D 21 01 00      [10] 1398 	ld	hl,#0x0001
   4E50 E5            [11] 1399 	push	hl
   4E51 DD 6E EF      [19] 1400 	ld	l,-17 (ix)
   4E54 DD 66 F0      [19] 1401 	ld	h,-16 (ix)
   4E57 E5            [11] 1402 	push	hl
   4E58 21 2A 6A      [10] 1403 	ld	hl,#_sol_matriz
   4E5B E5            [11] 1404 	push	hl
   4E5C CD 4A 44      [17] 1405 	call	_setBit
   4E5F 21 06 00      [10] 1406 	ld	hl,#6
   4E62 39            [11] 1407 	add	hl,sp
   4E63 F9            [ 6] 1408 	ld	sp,hl
   4E64 C1            [10] 1409 	pop	bc
                           1410 ;src/pathfinding.c:232: inserted = anyadirALista(x, y+2);
   4E65 DD 46 EC      [19] 1411 	ld	b,-20 (ix)
   4E68 04            [ 4] 1412 	inc	b
   4E69 04            [ 4] 1413 	inc	b
   4E6A C5            [11] 1414 	push	bc
   4E6B C5            [11] 1415 	push	bc
   4E6C 33            [ 6] 1416 	inc	sp
   4E6D DD 7E F6      [19] 1417 	ld	a,-10 (ix)
   4E70 F5            [11] 1418 	push	af
   4E71 33            [ 6] 1419 	inc	sp
   4E72 CD C4 44      [17] 1420 	call	_anyadirALista
   4E75 F1            [10] 1421 	pop	af
   4E76 C1            [10] 1422 	pop	bc
   4E77 DD 75 EB      [19] 1423 	ld	-21 (ix),l
                           1424 ;src/pathfinding.c:233: y = y+1;
   4E7A DD 34 EC      [23] 1425 	inc	-20 (ix)
                           1426 ;src/pathfinding.c:234: k = k+2;
   4E7D DD 71 F9      [19] 1427 	ld	-7 (ix),c
                           1428 ;src/pathfinding.c:235: break;
   4E80 C3 96 4D      [10] 1429 	jp	00116$
                           1430 ;src/pathfinding.c:236: case 2:
   4E83                    1431 00106$:
                           1432 ;src/pathfinding.c:238: setBit(sol_matriz, left, 1);
   4E83 C5            [11] 1433 	push	bc
   4E84 21 01 00      [10] 1434 	ld	hl,#0x0001
   4E87 E5            [11] 1435 	push	hl
   4E88 DD 6E ED      [19] 1436 	ld	l,-19 (ix)
   4E8B DD 66 EE      [19] 1437 	ld	h,-18 (ix)
   4E8E E5            [11] 1438 	push	hl
   4E8F 21 2A 6A      [10] 1439 	ld	hl,#_sol_matriz
   4E92 E5            [11] 1440 	push	hl
   4E93 CD 4A 44      [17] 1441 	call	_setBit
   4E96 21 06 00      [10] 1442 	ld	hl,#6
   4E99 39            [11] 1443 	add	hl,sp
   4E9A F9            [ 6] 1444 	ld	sp,hl
   4E9B C1            [10] 1445 	pop	bc
                           1446 ;src/pathfinding.c:239: inserted = anyadirALista(x-1, y);
   4E9C DD 46 F6      [19] 1447 	ld	b,-10 (ix)
   4E9F 05            [ 4] 1448 	dec	b
   4EA0 C5            [11] 1449 	push	bc
   4EA1 DD 7E EC      [19] 1450 	ld	a,-20 (ix)
   4EA4 F5            [11] 1451 	push	af
   4EA5 33            [ 6] 1452 	inc	sp
   4EA6 C5            [11] 1453 	push	bc
   4EA7 33            [ 6] 1454 	inc	sp
   4EA8 CD C4 44      [17] 1455 	call	_anyadirALista
   4EAB F1            [10] 1456 	pop	af
   4EAC C1            [10] 1457 	pop	bc
   4EAD DD 75 EB      [19] 1458 	ld	-21 (ix),l
                           1459 ;src/pathfinding.c:240: x = x-1;
   4EB0 DD 70 F6      [19] 1460 	ld	-10 (ix),b
                           1461 ;src/pathfinding.c:241: k = k+2;
   4EB3 DD 71 F9      [19] 1462 	ld	-7 (ix),c
                           1463 ;src/pathfinding.c:242: break;
   4EB6 C3 96 4D      [10] 1464 	jp	00116$
                           1465 ;src/pathfinding.c:243: case 3:
   4EB9                    1466 00107$:
                           1467 ;src/pathfinding.c:245: setBit(sol_matriz, right, 1);
   4EB9 C5            [11] 1468 	push	bc
   4EBA 21 01 00      [10] 1469 	ld	hl,#0x0001
   4EBD E5            [11] 1470 	push	hl
   4EBE DD 6E E9      [19] 1471 	ld	l,-23 (ix)
   4EC1 DD 66 EA      [19] 1472 	ld	h,-22 (ix)
   4EC4 E5            [11] 1473 	push	hl
   4EC5 21 2A 6A      [10] 1474 	ld	hl,#_sol_matriz
   4EC8 E5            [11] 1475 	push	hl
   4EC9 CD 4A 44      [17] 1476 	call	_setBit
   4ECC 21 06 00      [10] 1477 	ld	hl,#6
   4ECF 39            [11] 1478 	add	hl,sp
   4ED0 F9            [ 6] 1479 	ld	sp,hl
   4ED1 C1            [10] 1480 	pop	bc
                           1481 ;src/pathfinding.c:246: inserted = anyadirALista(x+1, y);
   4ED2 DD 46 F6      [19] 1482 	ld	b,-10 (ix)
   4ED5 04            [ 4] 1483 	inc	b
   4ED6 C5            [11] 1484 	push	bc
   4ED7 DD 7E EC      [19] 1485 	ld	a,-20 (ix)
   4EDA F5            [11] 1486 	push	af
   4EDB 33            [ 6] 1487 	inc	sp
   4EDC C5            [11] 1488 	push	bc
   4EDD 33            [ 6] 1489 	inc	sp
   4EDE CD C4 44      [17] 1490 	call	_anyadirALista
   4EE1 F1            [10] 1491 	pop	af
   4EE2 C1            [10] 1492 	pop	bc
   4EE3 DD 75 EB      [19] 1493 	ld	-21 (ix),l
                           1494 ;src/pathfinding.c:247: x = x+1;
   4EE6 DD 70 F6      [19] 1495 	ld	-10 (ix),b
                           1496 ;src/pathfinding.c:248: k = k+2;
   4EE9 DD 71 F9      [19] 1497 	ld	-7 (ix),c
                           1498 ;src/pathfinding.c:249: break;
   4EEC C3 96 4D      [10] 1499 	jp	00116$
                           1500 ;src/pathfinding.c:251: case 4:
   4EEF                    1501 00108$:
                           1502 ;src/pathfinding.c:253: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
   4EEF DD 7E EC      [19] 1503 	ld	a, -20 (ix)
   4EF2 06 00         [ 7] 1504 	ld	b, #0x00
   4EF4 C6 80         [ 7] 1505 	add	a,#0x80
   4EF6 4F            [ 4] 1506 	ld	c,a
   4EF7 78            [ 4] 1507 	ld	a,b
   4EF8 CE F8         [ 7] 1508 	adc	a,#0xF8
   4EFA 47            [ 4] 1509 	ld	b,a
   4EFB DD 6E F6      [19] 1510 	ld	l,-10 (ix)
   4EFE 26 00         [ 7] 1511 	ld	h,#0x00
   4F00 09            [11] 1512 	add	hl,bc
   4F01 01 01 00      [10] 1513 	ld	bc,#0x0001
   4F04 C5            [11] 1514 	push	bc
   4F05 E5            [11] 1515 	push	hl
   4F06 21 2A 6A      [10] 1516 	ld	hl,#_sol_matriz
   4F09 E5            [11] 1517 	push	hl
   4F0A CD 4A 44      [17] 1518 	call	_setBit
   4F0D 21 06 00      [10] 1519 	ld	hl,#6
   4F10 39            [11] 1520 	add	hl,sp
   4F11 F9            [ 6] 1521 	ld	sp,hl
                           1522 ;src/pathfinding.c:255: sol_tam = sol_tam - 2;
   4F12 21 29 6A      [10] 1523 	ld	hl, #_sol_tam+0
   4F15 35            [11] 1524 	dec	(hl)
   4F16 21 29 6A      [10] 1525 	ld	hl, #_sol_tam+0
   4F19 35            [11] 1526 	dec	(hl)
                           1527 ;src/pathfinding.c:256: k--;
   4F1A DD 4E F9      [19] 1528 	ld	c,-7 (ix)
   4F1D 0D            [ 4] 1529 	dec	c
                           1530 ;src/pathfinding.c:257: y = camino[k];
   4F1E 21 6A 72      [10] 1531 	ld	hl,#_camino
   4F21 06 00         [ 7] 1532 	ld	b,#0x00
   4F23 09            [11] 1533 	add	hl, bc
   4F24 7E            [ 7] 1534 	ld	a,(hl)
   4F25 DD 77 EC      [19] 1535 	ld	-20 (ix),a
                           1536 ;src/pathfinding.c:258: k--;
   4F28 79            [ 4] 1537 	ld	a,c
   4F29 C6 FF         [ 7] 1538 	add	a,#0xFF
                           1539 ;src/pathfinding.c:259: x = camino[k];
   4F2B DD 77 F9      [19] 1540 	ld	-7 (ix),a
   4F2E C6 6A         [ 7] 1541 	add	a,#<(_camino)
   4F30 6F            [ 4] 1542 	ld	l,a
   4F31 3E 72         [ 7] 1543 	ld	a,#>(_camino)
   4F33 CE 00         [ 7] 1544 	adc	a, #0x00
   4F35 67            [ 4] 1545 	ld	h,a
   4F36 7E            [ 7] 1546 	ld	a,(hl)
   4F37 DD 77 F6      [19] 1547 	ld	-10 (ix),a
                           1548 ;src/pathfinding.c:261: }
   4F3A C3 96 4D      [10] 1549 	jp	00116$
   4F3D                    1550 00118$:
                           1551 ;src/pathfinding.c:266: if(problem == 0){
   4F3D DD 7E F4      [19] 1552 	ld	a,-12 (ix)
   4F40 B7            [ 4] 1553 	or	a, a
   4F41 20 72         [12] 1554 	jr	NZ,00127$
                           1555 ;src/pathfinding.c:267: if(sol_tam < CAMINO_TAM){
   4F43 3A 29 6A      [13] 1556 	ld	a,(#_sol_tam + 0)
   4F46 D6 64         [ 7] 1557 	sub	a, #0x64
   4F48 30 0C         [12] 1558 	jr	NC,00120$
                           1559 ;src/pathfinding.c:268: enemy->longitud_camino = sol_tam;
   4F4A DD 6E F7      [19] 1560 	ld	l,-9 (ix)
   4F4D DD 66 F8      [19] 1561 	ld	h,-8 (ix)
   4F50 3A 29 6A      [13] 1562 	ld	a,(#_sol_tam + 0)
   4F53 77            [ 7] 1563 	ld	(hl),a
   4F54 18 08         [12] 1564 	jr	00137$
   4F56                    1565 00120$:
                           1566 ;src/pathfinding.c:270: enemy->longitud_camino = CAMINO_TAM;
   4F56 DD 6E F7      [19] 1567 	ld	l,-9 (ix)
   4F59 DD 66 F8      [19] 1568 	ld	h,-8 (ix)
   4F5C 36 64         [10] 1569 	ld	(hl),#0x64
                           1570 ;src/pathfinding.c:273: for(j = 0; j<CAMINO_TAM; j++){
   4F5E                    1571 00137$:
   4F5E DD 7E FE      [19] 1572 	ld	a,-2 (ix)
   4F61 C6 19         [ 7] 1573 	add	a, #0x19
   4F63 DD 77 FC      [19] 1574 	ld	-4 (ix),a
   4F66 DD 7E FF      [19] 1575 	ld	a,-1 (ix)
   4F69 CE 00         [ 7] 1576 	adc	a, #0x00
   4F6B DD 77 FD      [19] 1577 	ld	-3 (ix),a
   4F6E DD 36 F1 00   [19] 1578 	ld	-15 (ix),#0x00
   4F72                    1579 00125$:
                           1580 ;src/pathfinding.c:274: enemy->camino[j] = camino[j];
   4F72 DD 7E F1      [19] 1581 	ld	a,-15 (ix)
   4F75 DD 77 FA      [19] 1582 	ld	-6 (ix),a
   4F78 DD 36 FB 00   [19] 1583 	ld	-5 (ix),#0x00
   4F7C DD 7E FC      [19] 1584 	ld	a,-4 (ix)
   4F7F DD 86 FA      [19] 1585 	add	a, -6 (ix)
   4F82 DD 77 FA      [19] 1586 	ld	-6 (ix),a
   4F85 DD 7E FD      [19] 1587 	ld	a,-3 (ix)
   4F88 DD 8E FB      [19] 1588 	adc	a, -5 (ix)
   4F8B DD 77 FB      [19] 1589 	ld	-5 (ix),a
   4F8E 3E 6A         [ 7] 1590 	ld	a,#<(_camino)
   4F90 DD 86 F1      [19] 1591 	add	a, -15 (ix)
   4F93 DD 77 F7      [19] 1592 	ld	-9 (ix),a
   4F96 3E 72         [ 7] 1593 	ld	a,#>(_camino)
   4F98 CE 00         [ 7] 1594 	adc	a, #0x00
   4F9A DD 77 F8      [19] 1595 	ld	-8 (ix),a
   4F9D DD 6E F7      [19] 1596 	ld	l,-9 (ix)
   4FA0 DD 66 F8      [19] 1597 	ld	h,-8 (ix)
   4FA3 4E            [ 7] 1598 	ld	c,(hl)
   4FA4 DD 6E FA      [19] 1599 	ld	l,-6 (ix)
   4FA7 DD 66 FB      [19] 1600 	ld	h,-5 (ix)
   4FAA 71            [ 7] 1601 	ld	(hl),c
                           1602 ;src/pathfinding.c:273: for(j = 0; j<CAMINO_TAM; j++){
   4FAB DD 34 F1      [23] 1603 	inc	-15 (ix)
   4FAE DD 7E F1      [19] 1604 	ld	a,-15 (ix)
   4FB1 D6 64         [ 7] 1605 	sub	a, #0x64
   4FB3 38 BD         [12] 1606 	jr	C,00125$
   4FB5                    1607 00127$:
   4FB5 DD F9         [10] 1608 	ld	sp, ix
   4FB7 DD E1         [14] 1609 	pop	ix
   4FB9 C9            [10] 1610 	ret
                           1611 	.area _CODE
                           1612 	.area _INITIALIZER
                           1613 	.area _CABS (ABS)
