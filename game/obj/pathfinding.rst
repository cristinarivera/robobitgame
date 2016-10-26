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
   63FC                      26 _sol_tam::
   63FC                      27 	.ds 1
   63FD                      28 _camino::
   63FD                      29 	.ds 200
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
   3F0A                      58 _anyadirALista::
                             59 ;src/pathfinding.c:11: u8 anyadido = 0;
   3F0A 0E 00         [ 7]   60 	ld	c,#0x00
                             61 ;src/pathfinding.c:13: if(sol_tam < CAMINO_TAM){
<<<<<<< HEAD
   444E 3A FC 63      [13]   62 	ld	a,(#_sol_tam + 0)
   4451 D6 C8         [ 7]   63 	sub	a, #0xC8
   4453 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   4455 01 FD 63      [10]   66 	ld	bc,#_camino+0
   4458 2A FC 63      [16]   67 	ld	hl,(_sol_tam)
   445B 26 00         [ 7]   68 	ld	h,#0x00
   445D 09            [11]   69 	add	hl,bc
   445E FD 21 02 00   [14]   70 	ld	iy,#2
   4462 FD 39         [15]   71 	add	iy,sp
   4464 FD 7E 00      [19]   72 	ld	a,0 (iy)
   4467 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   4468 21 FC 63      [10]   75 	ld	hl, #_sol_tam+0
   446B 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   446C 2A FC 63      [16]   78 	ld	hl,(_sol_tam)
   446F 26 00         [ 7]   79 	ld	h,#0x00
   4471 09            [11]   80 	add	hl,bc
   4472 FD 21 03 00   [14]   81 	ld	iy,#3
   4476 FD 39         [15]   82 	add	iy,sp
   4478 FD 7E 00      [19]   83 	ld	a,0 (iy)
   447B 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   447C 21 FC 63      [10]   86 	ld	hl, #_sol_tam+0
   447F 34            [11]   87 	inc	(hl)
=======
   3F0C 3A 0C 63      [13]   62 	ld	a,(#_sol_tam + 0)
   3F0F D6 C8         [ 7]   63 	sub	a, #0xC8
   3F11 30 2D         [12]   64 	jr	NC,00102$
                             65 ;src/pathfinding.c:14: camino[sol_tam] = x;
   3F13 01 0D 63      [10]   66 	ld	bc,#_camino+0
   3F16 2A 0C 63      [16]   67 	ld	hl,(_sol_tam)
   3F19 26 00         [ 7]   68 	ld	h,#0x00
   3F1B 09            [11]   69 	add	hl,bc
   3F1C FD 21 02 00   [14]   70 	ld	iy,#2
   3F20 FD 39         [15]   71 	add	iy,sp
   3F22 FD 7E 00      [19]   72 	ld	a,0 (iy)
   3F25 77            [ 7]   73 	ld	(hl),a
                             74 ;src/pathfinding.c:15: sol_tam++;
   3F26 21 0C 63      [10]   75 	ld	hl, #_sol_tam+0
   3F29 34            [11]   76 	inc	(hl)
                             77 ;src/pathfinding.c:16: camino[sol_tam] = y;
   3F2A 2A 0C 63      [16]   78 	ld	hl,(_sol_tam)
   3F2D 26 00         [ 7]   79 	ld	h,#0x00
   3F2F 09            [11]   80 	add	hl,bc
   3F30 FD 21 03 00   [14]   81 	ld	iy,#3
   3F34 FD 39         [15]   82 	add	iy,sp
   3F36 FD 7E 00      [19]   83 	ld	a,0 (iy)
   3F39 77            [ 7]   84 	ld	(hl),a
                             85 ;src/pathfinding.c:17: sol_tam++;
   3F3A 21 0C 63      [10]   86 	ld	hl, #_sol_tam+0
   3F3D 34            [11]   87 	inc	(hl)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                             88 ;src/pathfinding.c:18: anyadido = 1;
   3F3E 0E 01         [ 7]   89 	ld	c,#0x01
   3F40                      90 00102$:
                             91 ;src/pathfinding.c:21: return anyadido;
   3F40 69            [ 4]   92 	ld	l,c
   3F41 C9            [10]   93 	ret
   3F42                      94 _bitWeights:
   3F42 01 00                95 	.dw #0x0001
   3F44 02 00                96 	.dw #0x0002
   3F46 04 00                97 	.dw #0x0004
   3F48 08 00                98 	.dw #0x0008
   3F4A 10 00                99 	.dw #0x0010
   3F4C 20 00               100 	.dw #0x0020
   3F4E 40 00               101 	.dw #0x0040
   3F50 80 00               102 	.dw #0x0080
                            103 ;src/pathfinding.c:25: u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8* matriz){
                            104 ;	---------------------------------
                            105 ; Function adjacentTiles
                            106 ; ---------------------------------
<<<<<<< HEAD
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
   44BD DD 36 E5 00   [19]  126 	ld	-27 (ix),#0x00
   44C1 DD 36 E6 00   [19]  127 	ld	-26 (ix),#0x00
=======
   3F52                     107 _adjacentTiles::
   3F52 DD E5         [15]  108 	push	ix
   3F54 DD 21 00 00   [14]  109 	ld	ix,#0
   3F58 DD 39         [15]  110 	add	ix,sp
   3F5A 21 E1 FF      [10]  111 	ld	hl,#-31
   3F5D 39            [11]  112 	add	hl,sp
   3F5E F9            [ 6]  113 	ld	sp,hl
                            114 ;src/pathfinding.c:26: u8 resultado = 4;
   3F5F DD 36 F1 04   [19]  115 	ld	-15 (ix),#0x04
                            116 ;src/pathfinding.c:28: i16 dist1 = 0;
   3F63 DD 36 EF 00   [19]  117 	ld	-17 (ix),#0x00
   3F67 DD 36 F0 00   [19]  118 	ld	-16 (ix),#0x00
                            119 ;src/pathfinding.c:29: i16 dist2 = 0;
   3F6B DD 36 ED 00   [19]  120 	ld	-19 (ix),#0x00
   3F6F DD 36 EE 00   [19]  121 	ld	-18 (ix),#0x00
                            122 ;src/pathfinding.c:30: i16 dist3 = 0;
   3F73 DD 36 EB 00   [19]  123 	ld	-21 (ix),#0x00
   3F77 DD 36 EC 00   [19]  124 	ld	-20 (ix),#0x00
                            125 ;src/pathfinding.c:34: i16 heu_derecha = 0;
   3F7B DD 36 E7 00   [19]  126 	ld	-25 (ix),#0x00
   3F7F DD 36 E8 00   [19]  127 	ld	-24 (ix),#0x00
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                            128 ;src/pathfinding.c:35: i16 heu_izquierda = 0;
   3F83 21 00 00      [10]  129 	ld	hl,#0x0000
   3F86 E3            [19]  130 	ex	(sp), hl
                            131 ;src/pathfinding.c:36: i16 heu_arriba = 0;
<<<<<<< HEAD
   44C9 DD 36 E1 00   [19]  132 	ld	-31 (ix),#0x00
   44CD DD 36 E2 00   [19]  133 	ld	-30 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   44D1 DD 36 E3 00   [19]  135 	ld	-29 (ix),#0x00
   44D5 DD 36 E4 00   [19]  136 	ld	-28 (ix),#0x00
=======
   3F87 DD 36 E3 00   [19]  132 	ld	-29 (ix),#0x00
   3F8B DD 36 E4 00   [19]  133 	ld	-28 (ix),#0x00
                            134 ;src/pathfinding.c:37: i16 heu_abajo = 0;
   3F8F DD 36 E5 00   [19]  135 	ld	-27 (ix),#0x00
   3F93 DD 36 E6 00   [19]  136 	ld	-26 (ix),#0x00
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                            137 ;src/pathfinding.c:43: if(y < f_y)
   3F97 DD 7E 05      [19]  138 	ld	a,5 (ix)
   3F9A DD 96 07      [19]  139 	sub	a, 7 (ix)
   3F9D 3E 00         [ 7]  140 	ld	a,#0x00
   3F9F 17            [ 4]  141 	rla
   3FA0 4F            [ 4]  142 	ld	c,a
                            143 ;src/pathfinding.c:41: if(x == f_x){
   3FA1 DD 7E 04      [19]  144 	ld	a,4 (ix)
   3FA4 DD 96 06      [19]  145 	sub	a, 6 (ix)
   3FA7 20 20         [12]  146 	jr	NZ,00124$
                            147 ;src/pathfinding.c:43: if(y < f_y)
   3FA9 79            [ 4]  148 	ld	a,c
   3FAA B7            [ 4]  149 	or	a, a
   3FAB 28 08         [12]  150 	jr	Z,00102$
                            151 ;src/pathfinding.c:44: heu_abajo = -1;
<<<<<<< HEAD
   44EF DD 36 E3 FF   [19]  152 	ld	-29 (ix),#0xFF
   44F3 DD 36 E4 FF   [19]  153 	ld	-28 (ix),#0xFF
   44F7                     154 00102$:
=======
   3FAD DD 36 E5 FF   [19]  152 	ld	-27 (ix),#0xFF
   3FB1 DD 36 E6 FF   [19]  153 	ld	-26 (ix),#0xFF
   3FB5                     154 00102$:
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                            155 ;src/pathfinding.c:46: if(y > f_y)
   3FB5 DD 7E 07      [19]  156 	ld	a,7 (ix)
   3FB8 DD 96 05      [19]  157 	sub	a, 5 (ix)
   3FBB D2 3D 40      [10]  158 	jp	NC,00125$
                            159 ;src/pathfinding.c:47: heu_arriba = -1;
<<<<<<< HEAD
   4500 DD 36 E1 FF   [19]  160 	ld	-31 (ix),#0xFF
   4504 DD 36 E2 FF   [19]  161 	ld	-30 (ix),#0xFF
   4508 C3 7F 45      [10]  162 	jp	00125$
   450B                     163 00124$:
=======
   3FBE DD 36 E3 FF   [19]  160 	ld	-29 (ix),#0xFF
   3FC2 DD 36 E4 FF   [19]  161 	ld	-28 (ix),#0xFF
   3FC6 C3 3D 40      [10]  162 	jp	00125$
   3FC9                     163 00124$:
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                            164 ;src/pathfinding.c:51: if(x < f_x)
   3FC9 DD 7E 04      [19]  165 	ld	a,4 (ix)
   3FCC DD 96 06      [19]  166 	sub	a, 6 (ix)
   3FCF 3E 00         [ 7]  167 	ld	a,#0x00
   3FD1 17            [ 4]  168 	rla
   3FD2 47            [ 4]  169 	ld	b,a
                            170 ;src/pathfinding.c:53: if(x > f_x)
   3FD3 DD 7E 06      [19]  171 	ld	a,6 (ix)
   3FD6 DD 96 04      [19]  172 	sub	a, 4 (ix)
   3FD9 3E 00         [ 7]  173 	ld	a,#0x00
   3FDB 17            [ 4]  174 	rla
   3FDC 5F            [ 4]  175 	ld	e,a
                            176 ;src/pathfinding.c:49: }else if(y == f_y){
   3FDD DD 7E 05      [19]  177 	ld	a,5 (ix)
   3FE0 DD 96 07      [19]  178 	sub	a, 7 (ix)
   3FE3 20 16         [12]  179 	jr	NZ,00121$
                            180 ;src/pathfinding.c:51: if(x < f_x)
   3FE5 78            [ 4]  181 	ld	a,b
   3FE6 B7            [ 4]  182 	or	a, a
   3FE7 28 08         [12]  183 	jr	Z,00106$
                            184 ;src/pathfinding.c:52: heu_derecha = -1;
<<<<<<< HEAD
   452B DD 36 E5 FF   [19]  185 	ld	-27 (ix),#0xFF
   452F DD 36 E6 FF   [19]  186 	ld	-26 (ix),#0xFF
   4533                     187 00106$:
=======
   3FE9 DD 36 E7 FF   [19]  185 	ld	-25 (ix),#0xFF
   3FED DD 36 E8 FF   [19]  186 	ld	-24 (ix),#0xFF
   3FF1                     187 00106$:
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                            188 ;src/pathfinding.c:53: if(x > f_x)
   3FF1 7B            [ 4]  189 	ld	a,e
   3FF2 B7            [ 4]  190 	or	a, a
   3FF3 28 48         [12]  191 	jr	Z,00125$
                            192 ;src/pathfinding.c:54: heu_izquierda = -1;
   3FF5 21 FF FF      [10]  193 	ld	hl,#0xFFFF
   3FF8 E3            [19]  194 	ex	(sp), hl
   3FF9 18 42         [12]  195 	jr	00125$
   3FFB                     196 00121$:
                            197 ;src/pathfinding.c:59: if(x < f_x){
   3FFB 78            [ 4]  198 	ld	a,b
   3FFC B7            [ 4]  199 	or	a, a
   3FFD 28 20         [12]  200 	jr	Z,00118$
                            201 ;src/pathfinding.c:60: if(y < f_y)
   3FFF 79            [ 4]  202 	ld	a,c
   4000 B7            [ 4]  203 	or	a, a
   4001 28 0A         [12]  204 	jr	Z,00110$
                            205 ;src/pathfinding.c:61: heu_abajo = -1;
<<<<<<< HEAD
   4545 DD 36 E3 FF   [19]  206 	ld	-29 (ix),#0xFF
   4549 DD 36 E4 FF   [19]  207 	ld	-28 (ix),#0xFF
   454D 18 08         [12]  208 	jr	00111$
   454F                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   454F DD 36 E1 FF   [19]  211 	ld	-31 (ix),#0xFF
   4553 DD 36 E2 FF   [19]  212 	ld	-30 (ix),#0xFF
   4557                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4557 DD 36 E5 FF   [19]  215 	ld	-27 (ix),#0xFF
   455B DD 36 E6 FF   [19]  216 	ld	-26 (ix),#0xFF
   455F 18 1E         [12]  217 	jr	00125$
   4561                     218 00118$:
=======
   4003 DD 36 E5 FF   [19]  206 	ld	-27 (ix),#0xFF
   4007 DD 36 E6 FF   [19]  207 	ld	-26 (ix),#0xFF
   400B 18 08         [12]  208 	jr	00111$
   400D                     209 00110$:
                            210 ;src/pathfinding.c:63: heu_arriba = -1;
   400D DD 36 E3 FF   [19]  211 	ld	-29 (ix),#0xFF
   4011 DD 36 E4 FF   [19]  212 	ld	-28 (ix),#0xFF
   4015                     213 00111$:
                            214 ;src/pathfinding.c:65: heu_derecha = -1;
   4015 DD 36 E7 FF   [19]  215 	ld	-25 (ix),#0xFF
   4019 DD 36 E8 FF   [19]  216 	ld	-24 (ix),#0xFF
   401D 18 1E         [12]  217 	jr	00125$
   401F                     218 00118$:
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
                            219 ;src/pathfinding.c:66: }else if(x > f_x){
   401F 7B            [ 4]  220 	ld	a,e
   4020 B7            [ 4]  221 	or	a, a
   4021 28 1A         [12]  222 	jr	Z,00125$
                            223 ;src/pathfinding.c:68: if(y < f_y)
   4023 79            [ 4]  224 	ld	a,c
   4024 B7            [ 4]  225 	or	a, a
   4025 28 0A         [12]  226 	jr	Z,00113$
                            227 ;src/pathfinding.c:69: heu_abajo = -1;
<<<<<<< HEAD
   4569 DD 36 E3 FF   [19]  228 	ld	-29 (ix),#0xFF
   456D DD 36 E4 FF   [19]  229 	ld	-28 (ix),#0xFF
   4571 18 08         [12]  230 	jr	00114$
   4573                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4573 DD 36 E1 FF   [19]  233 	ld	-31 (ix),#0xFF
   4577 DD 36 E2 FF   [19]  234 	ld	-30 (ix),#0xFF
   457B                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   457B 21 FF FF      [10]  237 	ld	hl,#0xFFFF
   457E E3            [19]  238 	ex	(sp), hl
   457F                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   457F DD 7E 05      [19]  241 	ld	a,5 (ix)
   4582 C6 FE         [ 7]  242 	add	a,#0xFE
   4584 DD 77 FB      [19]  243 	ld	-5 (ix), a
   4587 F5            [11]  244 	push	af
   4588 33            [ 6]  245 	inc	sp
   4589 DD 7E 04      [19]  246 	ld	a,4 (ix)
   458C F5            [11]  247 	push	af
   458D 33            [ 6]  248 	inc	sp
   458E DD 6E 08      [19]  249 	ld	l,8 (ix)
   4591 DD 66 09      [19]  250 	ld	h,9 (ix)
   4594 E5            [11]  251 	push	hl
   4595 CD 1C 4B      [17]  252 	call	_getTilePtr
   4598 F1            [10]  253 	pop	af
   4599 F1            [10]  254 	pop	af
   459A 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   459B DD 7E 04      [19]  257 	ld	a,4 (ix)
   459E C6 04         [ 7]  258 	add	a, #0x04
   45A0 DD 77 F2      [19]  259 	ld	-14 (ix),a
                            260 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45A3 DD 7E 06      [19]  261 	ld	a,6 (ix)
   45A6 DD 77 FC      [19]  262 	ld	-4 (ix),a
   45A9 DD 36 FD 00   [19]  263 	ld	-3 (ix),#0x00
   45AD DD 7E 04      [19]  264 	ld	a,4 (ix)
   45B0 DD 77 F5      [19]  265 	ld	-11 (ix),a
   45B3 DD 36 F6 00   [19]  266 	ld	-10 (ix),#0x00
   45B7 DD 7E 07      [19]  267 	ld	a,7 (ix)
   45BA DD 77 FE      [19]  268 	ld	-2 (ix),a
   45BD DD 36 FF 00   [19]  269 	ld	-1 (ix),#0x00
   45C1 DD 7E 05      [19]  270 	ld	a,5 (ix)
   45C4 DD 77 F7      [19]  271 	ld	-9 (ix),a
   45C7 DD 36 F8 00   [19]  272 	ld	-8 (ix),#0x00
   45CB DD 7E FC      [19]  273 	ld	a,-4 (ix)
   45CE DD 96 F5      [19]  274 	sub	a, -11 (ix)
   45D1 DD 77 F0      [19]  275 	ld	-16 (ix),a
   45D4 DD 7E FD      [19]  276 	ld	a,-3 (ix)
   45D7 DD 9E F6      [19]  277 	sbc	a, -10 (ix)
   45DA DD 77 F1      [19]  278 	ld	-15 (ix),a
                            279 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2 &&
   45DD 3E 02         [ 7]  280 	ld	a,#0x02
   45DF 91            [ 4]  281 	sub	a, c
   45E0 DA 74 46      [10]  282 	jp	C,00127$
                            283 ;src/pathfinding.c:79: *getTilePtr(matriz, x + G_ENEMY_W, y-2) <=2 ){
   45E3 DD 66 FB      [19]  284 	ld	h,-5 (ix)
   45E6 DD 6E F2      [19]  285 	ld	l,-14 (ix)
   45E9 E5            [11]  286 	push	hl
   45EA DD 6E 08      [19]  287 	ld	l,8 (ix)
   45ED DD 66 09      [19]  288 	ld	h,9 (ix)
   45F0 E5            [11]  289 	push	hl
   45F1 CD 1C 4B      [17]  290 	call	_getTilePtr
   45F4 F1            [10]  291 	pop	af
   45F5 F1            [10]  292 	pop	af
   45F6 4E            [ 7]  293 	ld	c,(hl)
   45F7 3E 02         [ 7]  294 	ld	a,#0x02
   45F9 91            [ 4]  295 	sub	a, c
   45FA 38 78         [12]  296 	jr	C,00127$
                            297 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   45FC DD 6E F0      [19]  298 	ld	l,-16 (ix)
   45FF DD 66 F1      [19]  299 	ld	h,-15 (ix)
   4602 E5            [11]  300 	push	hl
   4603 CD 60 4B      [17]  301 	call	_abs
   4606 F1            [10]  302 	pop	af
   4607 DD 74 F4      [19]  303 	ld	-12 (ix),h
   460A DD 75 F3      [19]  304 	ld	-13 (ix),l
   460D DD 7E F7      [19]  305 	ld	a,-9 (ix)
   4610 C6 FE         [ 7]  306 	add	a,#0xFE
   4612 DD 77 F9      [19]  307 	ld	-7 (ix),a
   4615 DD 7E F8      [19]  308 	ld	a,-8 (ix)
   4618 CE FF         [ 7]  309 	adc	a,#0xFF
   461A DD 77 FA      [19]  310 	ld	-6 (ix),a
   461D DD 7E FE      [19]  311 	ld	a,-2 (ix)
   4620 DD 96 F9      [19]  312 	sub	a, -7 (ix)
   4623 DD 77 F9      [19]  313 	ld	-7 (ix),a
   4626 DD 7E FF      [19]  314 	ld	a,-1 (ix)
   4629 DD 9E FA      [19]  315 	sbc	a, -6 (ix)
   462C DD 77 FA      [19]  316 	ld	-6 (ix),a
   462F DD 6E F9      [19]  317 	ld	l,-7 (ix)
   4632 DD 66 FA      [19]  318 	ld	h,-6 (ix)
   4635 E5            [11]  319 	push	hl
   4636 CD 60 4B      [17]  320 	call	_abs
   4639 F1            [10]  321 	pop	af
   463A DD 74 FA      [19]  322 	ld	-6 (ix),h
   463D DD 75 F9      [19]  323 	ld	-7 (ix),l
   4640 DD 7E F3      [19]  324 	ld	a,-13 (ix)
   4643 DD 86 F9      [19]  325 	add	a, -7 (ix)
   4646 DD 77 F9      [19]  326 	ld	-7 (ix),a
   4649 DD 7E F4      [19]  327 	ld	a,-12 (ix)
   464C DD 8E FA      [19]  328 	adc	a, -6 (ix)
   464F DD 77 FA      [19]  329 	ld	-6 (ix),a
   4652 DD 7E F9      [19]  330 	ld	a,-7 (ix)
   4655 DD 86 E1      [19]  331 	add	a, -31 (ix)
   4658 DD 77 F9      [19]  332 	ld	-7 (ix),a
   465B DD 7E FA      [19]  333 	ld	a,-6 (ix)
   465E DD 8E E2      [19]  334 	adc	a, -30 (ix)
   4661 DD 77 FA      [19]  335 	ld	-6 (ix),a
   4664 DD 7E F9      [19]  336 	ld	a,-7 (ix)
   4667 DD 77 ED      [19]  337 	ld	-19 (ix),a
   466A DD 7E FA      [19]  338 	ld	a,-6 (ix)
   466D DD 77 EE      [19]  339 	ld	-18 (ix),a
                            340 ;src/pathfinding.c:81: resultado = 0;
   4670 DD 36 EF 00   [19]  341 	ld	-17 (ix),#0x00
   4674                     342 00127$:
                            343 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 &&
   4674 DD 46 05      [19]  344 	ld	b,5 (ix)
   4677 04            [ 4]  345 	inc	b
   4678 04            [ 4]  346 	inc	b
   4679 C5            [11]  347 	push	bc
   467A 33            [ 6]  348 	inc	sp
   467B DD 7E 04      [19]  349 	ld	a,4 (ix)
   467E F5            [11]  350 	push	af
   467F 33            [ 6]  351 	inc	sp
   4680 DD 6E 08      [19]  352 	ld	l,8 (ix)
   4683 DD 66 09      [19]  353 	ld	h,9 (ix)
   4686 E5            [11]  354 	push	hl
   4687 CD 1C 4B      [17]  355 	call	_getTilePtr
   468A F1            [10]  356 	pop	af
   468B F1            [10]  357 	pop	af
   468C 4E            [ 7]  358 	ld	c,(hl)
   468D 3E 02         [ 7]  359 	ld	a,#0x02
   468F 91            [ 4]  360 	sub	a, c
   4690 DA 59 47      [10]  361 	jp	C,00135$
                            362 ;src/pathfinding.c:85: *getTilePtr(matriz, x + G_ENEMY_W, y + G_ENEMY_H) <=2 ){
   4693 DD 7E 05      [19]  363 	ld	a,5 (ix)
   4696 C6 16         [ 7]  364 	add	a, #0x16
   4698 47            [ 4]  365 	ld	b,a
   4699 C5            [11]  366 	push	bc
   469A 33            [ 6]  367 	inc	sp
   469B DD 7E F2      [19]  368 	ld	a,-14 (ix)
   469E F5            [11]  369 	push	af
   469F 33            [ 6]  370 	inc	sp
   46A0 DD 6E 08      [19]  371 	ld	l,8 (ix)
   46A3 DD 66 09      [19]  372 	ld	h,9 (ix)
   46A6 E5            [11]  373 	push	hl
   46A7 CD 1C 4B      [17]  374 	call	_getTilePtr
   46AA F1            [10]  375 	pop	af
   46AB F1            [10]  376 	pop	af
   46AC DD 74 FA      [19]  377 	ld	-6 (ix),h
   46AF DD 75 F9      [19]  378 	ld	-7 (ix), l
   46B2 DD 66 FA      [19]  379 	ld	h,-6 (ix)
   46B5 7E            [ 7]  380 	ld	a,(hl)
   46B6 DD 77 F9      [19]  381 	ld	-7 (ix),a
   46B9 3E 02         [ 7]  382 	ld	a,#0x02
   46BB DD 96 F9      [19]  383 	sub	a, -7 (ix)
   46BE DA 59 47      [10]  384 	jp	C,00135$
                            385 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   46C1 DD 6E F0      [19]  386 	ld	l,-16 (ix)
   46C4 DD 66 F1      [19]  387 	ld	h,-15 (ix)
   46C7 E5            [11]  388 	push	hl
   46C8 CD 60 4B      [17]  389 	call	_abs
   46CB F1            [10]  390 	pop	af
   46CC DD 74 FA      [19]  391 	ld	-6 (ix),h
   46CF DD 75 F9      [19]  392 	ld	-7 (ix),l
   46D2 DD 7E F7      [19]  393 	ld	a,-9 (ix)
   46D5 C6 02         [ 7]  394 	add	a, #0x02
   46D7 DD 77 F3      [19]  395 	ld	-13 (ix),a
   46DA DD 7E F8      [19]  396 	ld	a,-8 (ix)
   46DD CE 00         [ 7]  397 	adc	a, #0x00
   46DF DD 77 F4      [19]  398 	ld	-12 (ix),a
   46E2 DD 7E FE      [19]  399 	ld	a,-2 (ix)
   46E5 DD 96 F3      [19]  400 	sub	a, -13 (ix)
   46E8 DD 77 F3      [19]  401 	ld	-13 (ix),a
   46EB DD 7E FF      [19]  402 	ld	a,-1 (ix)
   46EE DD 9E F4      [19]  403 	sbc	a, -12 (ix)
   46F1 DD 77 F4      [19]  404 	ld	-12 (ix),a
   46F4 DD 6E F3      [19]  405 	ld	l,-13 (ix)
   46F7 DD 66 F4      [19]  406 	ld	h,-12 (ix)
   46FA E5            [11]  407 	push	hl
   46FB CD 60 4B      [17]  408 	call	_abs
   46FE F1            [10]  409 	pop	af
   46FF DD 74 F4      [19]  410 	ld	-12 (ix),h
   4702 DD 75 F3      [19]  411 	ld	-13 (ix),l
   4705 DD 7E F9      [19]  412 	ld	a,-7 (ix)
   4708 DD 86 F3      [19]  413 	add	a, -13 (ix)
   470B DD 77 F9      [19]  414 	ld	-7 (ix),a
   470E DD 7E FA      [19]  415 	ld	a,-6 (ix)
   4711 DD 8E F4      [19]  416 	adc	a, -12 (ix)
   4714 DD 77 FA      [19]  417 	ld	-6 (ix),a
   4717 DD 7E F9      [19]  418 	ld	a,-7 (ix)
   471A DD 86 E3      [19]  419 	add	a, -29 (ix)
   471D DD 77 F9      [19]  420 	ld	-7 (ix),a
   4720 DD 7E FA      [19]  421 	ld	a,-6 (ix)
   4723 DD 8E E4      [19]  422 	adc	a, -28 (ix)
   4726 DD 77 FA      [19]  423 	ld	-6 (ix),a
   4729 DD 7E F9      [19]  424 	ld	a,-7 (ix)
   472C DD 77 EB      [19]  425 	ld	-21 (ix),a
   472F DD 7E FA      [19]  426 	ld	a,-6 (ix)
   4732 DD 77 EC      [19]  427 	ld	-20 (ix),a
                            428 ;src/pathfinding.c:87: if(resultado == 0){
   4735 DD 7E EF      [19]  429 	ld	a,-17 (ix)
   4738 B7            [ 4]  430 	or	a, a
   4739 20 1A         [12]  431 	jr	NZ,00132$
                            432 ;src/pathfinding.c:88: if(dist1 > dist2)
   473B DD 7E EB      [19]  433 	ld	a,-21 (ix)
   473E DD 96 ED      [19]  434 	sub	a, -19 (ix)
   4741 DD 7E EC      [19]  435 	ld	a,-20 (ix)
   4744 DD 9E EE      [19]  436 	sbc	a, -18 (ix)
   4747 E2 4C 47      [10]  437 	jp	PO, 00304$
   474A EE 80         [ 7]  438 	xor	a, #0x80
   474C                     439 00304$:
   474C F2 59 47      [10]  440 	jp	P,00135$
                            441 ;src/pathfinding.c:89: resultado = 1;
   474F DD 36 EF 01   [19]  442 	ld	-17 (ix),#0x01
   4753 18 04         [12]  443 	jr	00135$
   4755                     444 00132$:
                            445 ;src/pathfinding.c:91: resultado = 1;
   4755 DD 36 EF 01   [19]  446 	ld	-17 (ix),#0x01
   4759                     447 00135$:
                            448 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4759 DD 4E 04      [19]  449 	ld	c,4 (ix)
   475C 0D            [ 4]  450 	dec	c
   475D C5            [11]  451 	push	bc
   475E DD 7E 05      [19]  452 	ld	a,5 (ix)
   4761 F5            [11]  453 	push	af
   4762 33            [ 6]  454 	inc	sp
   4763 79            [ 4]  455 	ld	a,c
   4764 F5            [11]  456 	push	af
   4765 33            [ 6]  457 	inc	sp
   4766 DD 6E 08      [19]  458 	ld	l,8 (ix)
   4769 DD 66 09      [19]  459 	ld	h,9 (ix)
   476C E5            [11]  460 	push	hl
   476D CD 1C 4B      [17]  461 	call	_getTilePtr
   4770 F1            [10]  462 	pop	af
   4771 F1            [10]  463 	pop	af
   4772 C1            [10]  464 	pop	bc
   4773 46            [ 7]  465 	ld	b,(hl)
                            466 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   4774 DD 7E 05      [19]  467 	ld	a,5 (ix)
   4777 C6 14         [ 7]  468 	add	a, #0x14
   4779 DD 77 F9      [19]  469 	ld	-7 (ix),a
                            470 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   477C DD 7E 05      [19]  471 	ld	a,5 (ix)
   477F C6 0B         [ 7]  472 	add	a, #0x0B
   4781 DD 77 F3      [19]  473 	ld	-13 (ix),a
                            474 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4784 DD 7E FE      [19]  475 	ld	a,-2 (ix)
   4787 DD 96 F7      [19]  476 	sub	a, -9 (ix)
   478A DD 77 F0      [19]  477 	ld	-16 (ix),a
   478D DD 7E FF      [19]  478 	ld	a,-1 (ix)
   4790 DD 9E F8      [19]  479 	sbc	a, -8 (ix)
   4793 DD 77 F1      [19]  480 	ld	-15 (ix),a
                            481 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 &&
   4796 3E 02         [ 7]  482 	ld	a,#0x02
   4798 90            [ 4]  483 	sub	a, b
   4799 DA 43 48      [10]  484 	jp	C,00148$
                            485 ;src/pathfinding.c:96: *getTilePtr(matriz, x-1, (y + G_ENEMY_H - 2)) <=2 &&
   479C C5            [11]  486 	push	bc
   479D DD 7E F9      [19]  487 	ld	a,-7 (ix)
   47A0 F5            [11]  488 	push	af
   47A1 33            [ 6]  489 	inc	sp
   47A2 79            [ 4]  490 	ld	a,c
   47A3 F5            [11]  491 	push	af
   47A4 33            [ 6]  492 	inc	sp
   47A5 DD 6E 08      [19]  493 	ld	l,8 (ix)
   47A8 DD 66 09      [19]  494 	ld	h,9 (ix)
   47AB E5            [11]  495 	push	hl
   47AC CD 1C 4B      [17]  496 	call	_getTilePtr
   47AF F1            [10]  497 	pop	af
   47B0 F1            [10]  498 	pop	af
   47B1 C1            [10]  499 	pop	bc
   47B2 46            [ 7]  500 	ld	b,(hl)
   47B3 3E 02         [ 7]  501 	ld	a,#0x02
   47B5 90            [ 4]  502 	sub	a, b
   47B6 DA 43 48      [10]  503 	jp	C,00148$
                            504 ;src/pathfinding.c:97: *getTilePtr(matriz, x-1, y + G_ENEMY_H/2) <=2){
   47B9 DD 7E F3      [19]  505 	ld	a,-13 (ix)
   47BC F5            [11]  506 	push	af
   47BD 33            [ 6]  507 	inc	sp
   47BE 79            [ 4]  508 	ld	a,c
   47BF F5            [11]  509 	push	af
   47C0 33            [ 6]  510 	inc	sp
   47C1 DD 6E 08      [19]  511 	ld	l,8 (ix)
   47C4 DD 66 09      [19]  512 	ld	h,9 (ix)
   47C7 E5            [11]  513 	push	hl
   47C8 CD 1C 4B      [17]  514 	call	_getTilePtr
   47CB F1            [10]  515 	pop	af
   47CC F1            [10]  516 	pop	af
   47CD 4E            [ 7]  517 	ld	c,(hl)
   47CE 3E 02         [ 7]  518 	ld	a,#0x02
   47D0 91            [ 4]  519 	sub	a, c
   47D1 38 70         [12]  520 	jr	C,00148$
                            521 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   47D3 DD 4E F5      [19]  522 	ld	c,-11 (ix)
   47D6 DD 46 F6      [19]  523 	ld	b,-10 (ix)
   47D9 0B            [ 6]  524 	dec	bc
   47DA DD 7E FC      [19]  525 	ld	a,-4 (ix)
   47DD 91            [ 4]  526 	sub	a, c
   47DE 4F            [ 4]  527 	ld	c,a
   47DF DD 7E FD      [19]  528 	ld	a,-3 (ix)
   47E2 98            [ 4]  529 	sbc	a, b
   47E3 47            [ 4]  530 	ld	b,a
   47E4 C5            [11]  531 	push	bc
   47E5 CD 60 4B      [17]  532 	call	_abs
   47E8 E3            [19]  533 	ex	(sp),hl
   47E9 DD 6E F0      [19]  534 	ld	l,-16 (ix)
   47EC DD 66 F1      [19]  535 	ld	h,-15 (ix)
   47EF E5            [11]  536 	push	hl
   47F0 CD 60 4B      [17]  537 	call	_abs
   47F3 F1            [10]  538 	pop	af
   47F4 C1            [10]  539 	pop	bc
   47F5 09            [11]  540 	add	hl,bc
   47F6 D1            [10]  541 	pop	de
   47F7 D5            [11]  542 	push	de
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
   4855 CD 1C 4B      [17]  594 	call	_getTilePtr
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
   4868 DD 7E F9      [19]  606 	ld	a,-7 (ix)
   486B F5            [11]  607 	push	af
   486C 33            [ 6]  608 	inc	sp
   486D C5            [11]  609 	push	bc
   486E 33            [ 6]  610 	inc	sp
   486F DD 6E 08      [19]  611 	ld	l,8 (ix)
   4872 DD 66 09      [19]  612 	ld	h,9 (ix)
   4875 E5            [11]  613 	push	hl
   4876 CD 1C 4B      [17]  614 	call	_getTilePtr
   4879 F1            [10]  615 	pop	af
   487A F1            [10]  616 	pop	af
   487B C1            [10]  617 	pop	bc
   487C 4E            [ 7]  618 	ld	c,(hl)
   487D 3E 02         [ 7]  619 	ld	a,#0x02
   487F 91            [ 4]  620 	sub	a, c
   4880 DA 6A 49      [10]  621 	jp	C,00167$
                            622 ;src/pathfinding.c:112: *getTilePtr(matriz, (x+ G_ENEMY_W+1), (y + G_ENEMY_H/2)) <=2){
   4883 DD 7E F3      [19]  623 	ld	a,-13 (ix)
   4886 F5            [11]  624 	push	af
   4887 33            [ 6]  625 	inc	sp
   4888 C5            [11]  626 	push	bc
   4889 33            [ 6]  627 	inc	sp
   488A DD 6E 08      [19]  628 	ld	l,8 (ix)
   488D DD 66 09      [19]  629 	ld	h,9 (ix)
   4890 E5            [11]  630 	push	hl
   4891 CD 1C 4B      [17]  631 	call	_getTilePtr
   4894 F1            [10]  632 	pop	af
   4895 F1            [10]  633 	pop	af
   4896 4E            [ 7]  634 	ld	c,(hl)
   4897 3E 02         [ 7]  635 	ld	a,#0x02
   4899 91            [ 4]  636 	sub	a, c
   489A DA 6A 49      [10]  637 	jp	C,00167$
                            638 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   489D DD 7E F5      [19]  639 	ld	a,-11 (ix)
   48A0 C6 01         [ 7]  640 	add	a, #0x01
   48A2 DD 77 F9      [19]  641 	ld	-7 (ix),a
   48A5 DD 7E F6      [19]  642 	ld	a,-10 (ix)
   48A8 CE 00         [ 7]  643 	adc	a, #0x00
   48AA DD 77 FA      [19]  644 	ld	-6 (ix),a
   48AD DD 7E FC      [19]  645 	ld	a,-4 (ix)
   48B0 DD 96 F9      [19]  646 	sub	a, -7 (ix)
   48B3 DD 77 F9      [19]  647 	ld	-7 (ix),a
   48B6 DD 7E FD      [19]  648 	ld	a,-3 (ix)
   48B9 DD 9E FA      [19]  649 	sbc	a, -6 (ix)
   48BC DD 77 FA      [19]  650 	ld	-6 (ix),a
   48BF DD 6E F9      [19]  651 	ld	l,-7 (ix)
   48C2 DD 66 FA      [19]  652 	ld	h,-6 (ix)
   48C5 E5            [11]  653 	push	hl
   48C6 CD 60 4B      [17]  654 	call	_abs
   48C9 F1            [10]  655 	pop	af
   48CA DD 74 FA      [19]  656 	ld	-6 (ix),h
   48CD DD 75 F9      [19]  657 	ld	-7 (ix),l
   48D0 DD 6E F0      [19]  658 	ld	l,-16 (ix)
   48D3 DD 66 F1      [19]  659 	ld	h,-15 (ix)
   48D6 E5            [11]  660 	push	hl
   48D7 CD 60 4B      [17]  661 	call	_abs
   48DA F1            [10]  662 	pop	af
   48DB DD 74 F4      [19]  663 	ld	-12 (ix),h
   48DE DD 75 F3      [19]  664 	ld	-13 (ix),l
   48E1 DD 7E F9      [19]  665 	ld	a,-7 (ix)
   48E4 DD 86 F3      [19]  666 	add	a, -13 (ix)
   48E7 DD 77 F9      [19]  667 	ld	-7 (ix),a
   48EA DD 7E FA      [19]  668 	ld	a,-6 (ix)
   48ED DD 8E F4      [19]  669 	adc	a, -12 (ix)
   48F0 DD 77 FA      [19]  670 	ld	-6 (ix),a
   48F3 DD 7E F9      [19]  671 	ld	a,-7 (ix)
   48F6 DD 86 E5      [19]  672 	add	a, -27 (ix)
   48F9 DD 77 E7      [19]  673 	ld	-25 (ix),a
   48FC DD 7E FA      [19]  674 	ld	a,-6 (ix)
   48FF DD 8E E6      [19]  675 	adc	a, -26 (ix)
   4902 DD 77 E8      [19]  676 	ld	-24 (ix),a
                            677 ;src/pathfinding.c:114: if(resultado == 0){
   4905 DD 7E EF      [19]  678 	ld	a,-17 (ix)
   4908 B7            [ 4]  679 	or	a, a
   4909 20 1A         [12]  680 	jr	NZ,00164$
                            681 ;src/pathfinding.c:115: if(dist1 >= dist4)
   490B DD 7E ED      [19]  682 	ld	a,-19 (ix)
   490E DD 96 E7      [19]  683 	sub	a, -25 (ix)
   4911 DD 7E EE      [19]  684 	ld	a,-18 (ix)
   4914 DD 9E E8      [19]  685 	sbc	a, -24 (ix)
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
   492E DD 96 E7      [19]  700 	sub	a, -25 (ix)
   4931 DD 7E EC      [19]  701 	ld	a,-20 (ix)
   4934 DD 9E E8      [19]  702 	sbc	a, -24 (ix)
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
   494F DD 96 E7      [19]  717 	sub	a, -25 (ix)
   4952 DD 7E EA      [19]  718 	ld	a,-22 (ix)
   4955 DD 9E E8      [19]  719 	sbc	a, -24 (ix)
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
   497A 21 F7 FF      [10]  744 	ld	hl,#-9
   497D 39            [11]  745 	add	hl,sp
   497E F9            [ 6]  746 	ld	sp,hl
                            747 ;src/pathfinding.c:144: u8 problem = 0;
   497F 1E 00         [ 7]  748 	ld	e,#0x00
                            749 ;src/pathfinding.c:146: x = s_x;
   4981 DD 7E 04      [19]  750 	ld	a,4 (ix)
   4984 DD 77 F8      [19]  751 	ld	-8 (ix),a
                            752 ;src/pathfinding.c:147: sol_tam = 0;
   4987 21 FC 63      [10]  753 	ld	hl,#_sol_tam + 0
   498A 36 00         [10]  754 	ld	(hl), #0x00
                            755 ;src/pathfinding.c:148: y = s_y;
   498C DD 7E 05      [19]  756 	ld	a,5 (ix)
   498F DD 77 F7      [19]  757 	ld	-9 (ix),a
                            758 ;src/pathfinding.c:150: k = 0;
   4992 DD 36 FB 00   [19]  759 	ld	-5 (ix),#0x00
                            760 ;src/pathfinding.c:151: aux = 1;
   4996 DD 36 FA 01   [19]  761 	ld	-6 (ix),#0x01
                            762 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   499A DD 7E 08      [19]  763 	ld	a,8 (ix)
   499D DD 77 FE      [19]  764 	ld	-2 (ix),a
   49A0 DD 7E 09      [19]  765 	ld	a,9 (ix)
   49A3 DD 77 FF      [19]  766 	ld	-1 (ix),a
   49A6 DD 7E FE      [19]  767 	ld	a,-2 (ix)
   49A9 C6 E1         [ 7]  768 	add	a, #0xE1
   49AB 4F            [ 4]  769 	ld	c,a
   49AC DD 7E FF      [19]  770 	ld	a,-1 (ix)
   49AF CE 00         [ 7]  771 	adc	a, #0x00
   49B1 47            [ 4]  772 	ld	b,a
   49B2 AF            [ 4]  773 	xor	a, a
   49B3 02            [ 7]  774 	ld	(bc),a
                            775 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   49B4 C5            [11]  776 	push	bc
   49B5 D5            [11]  777 	push	de
   49B6 DD 66 F7      [19]  778 	ld	h,-9 (ix)
   49B9 DD 6E F8      [19]  779 	ld	l,-8 (ix)
   49BC E5            [11]  780 	push	hl
   49BD CD 4C 44      [17]  781 	call	_anyadirALista
   49C0 F1            [10]  782 	pop	af
   49C1 D1            [10]  783 	pop	de
   49C2 C1            [10]  784 	pop	bc
   49C3 DD 75 F9      [19]  785 	ld	-7 (ix),l
                            786 ;src/pathfinding.c:157: while (aux){
   49C6                     787 00114$:
   49C6 DD 7E FA      [19]  788 	ld	a,-6 (ix)
   49C9 B7            [ 4]  789 	or	a, a
   49CA CA CD 4A      [10]  790 	jp	Z,00116$
                            791 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   49CD DD 7E 06      [19]  792 	ld	a,6 (ix)
   49D0 DD 96 F8      [19]  793 	sub	a, -8 (ix)
   49D3 20 08         [12]  794 	jr	NZ,00113$
   49D5 DD 7E 07      [19]  795 	ld	a,7 (ix)
   49D8 DD 96 F7      [19]  796 	sub	a, -9 (ix)
   49DB 28 06         [12]  797 	jr	Z,00109$
   49DD                     798 00113$:
   49DD DD 7E F9      [19]  799 	ld	a,-7 (ix)
   49E0 B7            [ 4]  800 	or	a, a
   49E1 20 14         [12]  801 	jr	NZ,00110$
   49E3                     802 00109$:
                            803 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   49E3 DD 7E F9      [19]  804 	ld	a,-7 (ix)
   49E6 B7            [ 4]  805 	or	a, a
   49E7 28 06         [12]  806 	jr	Z,00101$
   49E9 3A FC 63      [13]  807 	ld	a,(#_sol_tam + 0)
   49EC B7            [ 4]  808 	or	a, a
   49ED 20 02         [12]  809 	jr	NZ,00102$
   49EF                     810 00101$:
                            811 ;src/pathfinding.c:161: problem = 1;
   49EF 1E 01         [ 7]  812 	ld	e,#0x01
   49F1                     813 00102$:
                            814 ;src/pathfinding.c:164: aux = 0;
   49F1 DD 36 FA 00   [19]  815 	ld	-6 (ix),#0x00
   49F5 18 CF         [12]  816 	jr	00114$
   49F7                     817 00110$:
                            818 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   49F7 C5            [11]  819 	push	bc
   49F8 D5            [11]  820 	push	de
   49F9 DD 6E 0A      [19]  821 	ld	l,10 (ix)
   49FC DD 66 0B      [19]  822 	ld	h,11 (ix)
   49FF E5            [11]  823 	push	hl
   4A00 DD 66 07      [19]  824 	ld	h,7 (ix)
   4A03 DD 6E 06      [19]  825 	ld	l,6 (ix)
   4A06 E5            [11]  826 	push	hl
   4A07 DD 66 F7      [19]  827 	ld	h,-9 (ix)
   4A0A DD 6E F8      [19]  828 	ld	l,-8 (ix)
   4A0D E5            [11]  829 	push	hl
   4A0E CD 94 44      [17]  830 	call	_adjacentTiles
   4A11 F1            [10]  831 	pop	af
   4A12 F1            [10]  832 	pop	af
   4A13 F1            [10]  833 	pop	af
   4A14 D1            [10]  834 	pop	de
   4A15 C1            [10]  835 	pop	bc
   4A16 55            [ 4]  836 	ld	d,l
                            837 ;src/pathfinding.c:168: switch(movimiento){
   4A17 3E 03         [ 7]  838 	ld	a,#0x03
   4A19 92            [ 4]  839 	sub	a, d
   4A1A 38 AA         [12]  840 	jr	C,00114$
                            841 ;src/pathfinding.c:172: k = k+2;
   4A1C DD 7E FB      [19]  842 	ld	a,-5 (ix)
   4A1F C6 02         [ 7]  843 	add	a, #0x02
   4A21 DD 77 FC      [19]  844 	ld	-4 (ix),a
                            845 ;src/pathfinding.c:168: switch(movimiento){
   4A24 D5            [11]  846 	push	de
   4A25 5A            [ 4]  847 	ld	e,d
   4A26 16 00         [ 7]  848 	ld	d,#0x00
   4A28 21 2F 4A      [10]  849 	ld	hl,#00169$
   4A2B 19            [11]  850 	add	hl,de
   4A2C 19            [11]  851 	add	hl,de
                            852 ;src/pathfinding.c:169: case 0:
   4A2D D1            [10]  853 	pop	de
   4A2E E9            [ 4]  854 	jp	(hl)
   4A2F                     855 00169$:
   4A2F 18 06         [12]  856 	jr	00104$
   4A31 18 2D         [12]  857 	jr	00105$
   4A33 18 4E         [12]  858 	jr	00106$
   4A35 18 6E         [12]  859 	jr	00107$
   4A37                     860 00104$:
                            861 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   4A37 DD 7E F7      [19]  862 	ld	a,-9 (ix)
   4A3A C6 FE         [ 7]  863 	add	a,#0xFE
   4A3C DD 77 FD      [19]  864 	ld	-3 (ix),a
   4A3F C5            [11]  865 	push	bc
   4A40 D5            [11]  866 	push	de
   4A41 DD 66 FD      [19]  867 	ld	h,-3 (ix)
   4A44 DD 6E F8      [19]  868 	ld	l,-8 (ix)
   4A47 E5            [11]  869 	push	hl
   4A48 CD 4C 44      [17]  870 	call	_anyadirALista
   4A4B F1            [10]  871 	pop	af
   4A4C D1            [10]  872 	pop	de
   4A4D C1            [10]  873 	pop	bc
   4A4E DD 75 F9      [19]  874 	ld	-7 (ix),l
                            875 ;src/pathfinding.c:171: y = y-2;
   4A51 DD 56 FD      [19]  876 	ld	d,-3 (ix)
   4A54 DD 72 F7      [19]  877 	ld	-9 (ix),d
                            878 ;src/pathfinding.c:172: k = k+2;
   4A57 DD 7E FC      [19]  879 	ld	a,-4 (ix)
   4A5A DD 77 FB      [19]  880 	ld	-5 (ix),a
                            881 ;src/pathfinding.c:173: break;
   4A5D C3 C6 49      [10]  882 	jp	00114$
                            883 ;src/pathfinding.c:174: case 1:
   4A60                     884 00105$:
                            885 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   4A60 DD 56 F7      [19]  886 	ld	d,-9 (ix)
   4A63 14            [ 4]  887 	inc	d
   4A64 14            [ 4]  888 	inc	d
   4A65 C5            [11]  889 	push	bc
   4A66 D5            [11]  890 	push	de
   4A67 D5            [11]  891 	push	de
   4A68 33            [ 6]  892 	inc	sp
   4A69 DD 7E F8      [19]  893 	ld	a,-8 (ix)
   4A6C F5            [11]  894 	push	af
   4A6D 33            [ 6]  895 	inc	sp
   4A6E CD 4C 44      [17]  896 	call	_anyadirALista
   4A71 F1            [10]  897 	pop	af
   4A72 D1            [10]  898 	pop	de
   4A73 C1            [10]  899 	pop	bc
   4A74 DD 75 F9      [19]  900 	ld	-7 (ix),l
                            901 ;src/pathfinding.c:178: y = y+2;
   4A77 DD 72 F7      [19]  902 	ld	-9 (ix),d
                            903 ;src/pathfinding.c:179: k = k+2;
   4A7A DD 7E FC      [19]  904 	ld	a,-4 (ix)
   4A7D DD 77 FB      [19]  905 	ld	-5 (ix),a
                            906 ;src/pathfinding.c:180: break;
   4A80 C3 C6 49      [10]  907 	jp	00114$
                            908 ;src/pathfinding.c:181: case 2:
   4A83                     909 00106$:
                            910 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4A83 DD 56 F8      [19]  911 	ld	d,-8 (ix)
   4A86 15            [ 4]  912 	dec	d
   4A87 C5            [11]  913 	push	bc
   4A88 D5            [11]  914 	push	de
   4A89 DD 7E F7      [19]  915 	ld	a,-9 (ix)
   4A8C F5            [11]  916 	push	af
   4A8D 33            [ 6]  917 	inc	sp
   4A8E D5            [11]  918 	push	de
   4A8F 33            [ 6]  919 	inc	sp
   4A90 CD 4C 44      [17]  920 	call	_anyadirALista
   4A93 F1            [10]  921 	pop	af
   4A94 D1            [10]  922 	pop	de
   4A95 C1            [10]  923 	pop	bc
   4A96 DD 75 F9      [19]  924 	ld	-7 (ix),l
                            925 ;src/pathfinding.c:185: x = x-1;
   4A99 DD 72 F8      [19]  926 	ld	-8 (ix),d
                            927 ;src/pathfinding.c:186: k = k+2;
   4A9C DD 7E FC      [19]  928 	ld	a,-4 (ix)
   4A9F DD 77 FB      [19]  929 	ld	-5 (ix),a
                            930 ;src/pathfinding.c:187: break;
   4AA2 C3 C6 49      [10]  931 	jp	00114$
                            932 ;src/pathfinding.c:188: case 3:
   4AA5                     933 00107$:
                            934 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4AA5 DD 7E F8      [19]  935 	ld	a,-8 (ix)
   4AA8 3C            [ 4]  936 	inc	a
   4AA9 DD 77 FD      [19]  937 	ld	-3 (ix),a
   4AAC C5            [11]  938 	push	bc
   4AAD D5            [11]  939 	push	de
   4AAE DD 66 F7      [19]  940 	ld	h,-9 (ix)
   4AB1 DD 6E FD      [19]  941 	ld	l,-3 (ix)
   4AB4 E5            [11]  942 	push	hl
   4AB5 CD 4C 44      [17]  943 	call	_anyadirALista
   4AB8 F1            [10]  944 	pop	af
   4AB9 D1            [10]  945 	pop	de
   4ABA C1            [10]  946 	pop	bc
   4ABB DD 75 F9      [19]  947 	ld	-7 (ix),l
                            948 ;src/pathfinding.c:190: x = x+1;
   4ABE DD 6E FD      [19]  949 	ld	l,-3 (ix)
   4AC1 DD 75 F8      [19]  950 	ld	-8 (ix),l
                            951 ;src/pathfinding.c:191: k = k+2;
   4AC4 DD 7E FC      [19]  952 	ld	a,-4 (ix)
   4AC7 DD 77 FB      [19]  953 	ld	-5 (ix),a
                            954 ;src/pathfinding.c:194: }
   4ACA C3 C6 49      [10]  955 	jp	00114$
   4ACD                     956 00116$:
                            957 ;src/pathfinding.c:199: if(problem == 0){
   4ACD 7B            [ 4]  958 	ld	a,e
   4ACE B7            [ 4]  959 	or	a, a
   4ACF 20 44         [12]  960 	jr	NZ,00122$
                            961 ;src/pathfinding.c:200: if(sol_tam < CAMINO_TAM){
                            962 ;src/pathfinding.c:201: actual->longitud_camino = sol_tam;
   4AD1 3A FC 63      [13]  963 	ld	a,(#_sol_tam + 0)
   4AD4 FE C8         [ 7]  964 	cp	a,#0xC8
   4AD6 30 03         [12]  965 	jr	NC,00118$
   4AD8 02            [ 7]  966 	ld	(bc),a
   4AD9 18 03         [12]  967 	jr	00137$
   4ADB                     968 00118$:
                            969 ;src/pathfinding.c:203: actual->longitud_camino = CAMINO_TAM;
   4ADB 3E C8         [ 7]  970 	ld	a,#0xC8
   4ADD 02            [ 7]  971 	ld	(bc),a
                            972 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   4ADE                     973 00137$:
   4ADE DD 7E FE      [19]  974 	ld	a,-2 (ix)
   4AE1 C6 19         [ 7]  975 	add	a, #0x19
   4AE3 DD 77 FE      [19]  976 	ld	-2 (ix),a
   4AE6 DD 7E FF      [19]  977 	ld	a,-1 (ix)
   4AE9 CE 00         [ 7]  978 	adc	a, #0x00
   4AEB DD 77 FF      [19]  979 	ld	-1 (ix),a
   4AEE 1E 00         [ 7]  980 	ld	e,#0x00
   4AF0                     981 00125$:
   4AF0 0A            [ 7]  982 	ld	a,(bc)
   4AF1 57            [ 4]  983 	ld	d,a
   4AF2 7B            [ 4]  984 	ld	a,e
   4AF3 92            [ 4]  985 	sub	a, d
   4AF4 30 21         [12]  986 	jr	NC,00127$
                            987 ;src/pathfinding.c:206: actual->camino[i] = camino[i];
   4AF6 E5            [11]  988 	push	hl
   4AF7 6B            [ 4]  989 	ld	l,e
   4AF8 26 00         [ 7]  990 	ld	h,#0x00
   4AFA E5            [11]  991 	push	hl
   4AFB FD E1         [14]  992 	pop	iy
   4AFD E1            [10]  993 	pop	hl
   4AFE C5            [11]  994 	push	bc
   4AFF DD 4E FE      [19]  995 	ld	c,-2 (ix)
   4B02 DD 46 FF      [19]  996 	ld	b,-1 (ix)
   4B05 FD 09         [15]  997 	add	iy, bc
   4B07 C1            [10]  998 	pop	bc
   4B08 21 FD 63      [10]  999 	ld	hl,#_camino
   4B0B 16 00         [ 7] 1000 	ld	d,#0x00
   4B0D 19            [11] 1001 	add	hl, de
   4B0E 56            [ 7] 1002 	ld	d,(hl)
   4B0F FD 72 00      [19] 1003 	ld	0 (iy), d
                           1004 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   4B12 1C            [ 4] 1005 	inc	e
   4B13 18 DB         [12] 1006 	jr	00125$
   4B15                    1007 00122$:
                           1008 ;src/pathfinding.c:210: actual->longitud_camino = 0;
   4B15 AF            [ 4] 1009 	xor	a, a
   4B16 02            [ 7] 1010 	ld	(bc),a
   4B17                    1011 00127$:
   4B17 DD F9         [10] 1012 	ld	sp, ix
   4B19 DD E1         [14] 1013 	pop	ix
   4B1B C9            [10] 1014 	ret
                           1015 	.area _CODE
                           1016 	.area _INITIALIZER
                           1017 	.area _CABS (ABS)
=======
   4027 DD 36 E5 FF   [19]  228 	ld	-27 (ix),#0xFF
   402B DD 36 E6 FF   [19]  229 	ld	-26 (ix),#0xFF
   402F 18 08         [12]  230 	jr	00114$
   4031                     231 00113$:
                            232 ;src/pathfinding.c:71: heu_arriba = -1;
   4031 DD 36 E3 FF   [19]  233 	ld	-29 (ix),#0xFF
   4035 DD 36 E4 FF   [19]  234 	ld	-28 (ix),#0xFF
   4039                     235 00114$:
                            236 ;src/pathfinding.c:73: heu_izquierda = -1;
   4039 21 FF FF      [10]  237 	ld	hl,#0xFFFF
   403C E3            [19]  238 	ex	(sp), hl
   403D                     239 00125$:
                            240 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   403D DD 46 05      [19]  241 	ld	b,5 (ix)
   4040 05            [ 4]  242 	dec	b
   4041 05            [ 4]  243 	dec	b
   4042 C5            [11]  244 	push	bc
   4043 33            [ 6]  245 	inc	sp
   4044 DD 7E 04      [19]  246 	ld	a,4 (ix)
   4047 F5            [11]  247 	push	af
   4048 33            [ 6]  248 	inc	sp
   4049 DD 6E 08      [19]  249 	ld	l,8 (ix)
   404C DD 66 09      [19]  250 	ld	h,9 (ix)
   404F E5            [11]  251 	push	hl
   4050 CD 2C 4A      [17]  252 	call	_getTilePtr
   4053 F1            [10]  253 	pop	af
   4054 F1            [10]  254 	pop	af
   4055 4E            [ 7]  255 	ld	c,(hl)
                            256 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4056 DD 7E 06      [19]  257 	ld	a,6 (ix)
   4059 DD 77 FE      [19]  258 	ld	-2 (ix),a
   405C DD 36 FF 00   [19]  259 	ld	-1 (ix),#0x00
   4060 DD 7E 04      [19]  260 	ld	a,4 (ix)
   4063 DD 77 F8      [19]  261 	ld	-8 (ix),a
   4066 DD 36 F9 00   [19]  262 	ld	-7 (ix),#0x00
   406A DD 7E 07      [19]  263 	ld	a,7 (ix)
   406D DD 77 F4      [19]  264 	ld	-12 (ix),a
   4070 DD 36 F5 00   [19]  265 	ld	-11 (ix),#0x00
   4074 DD 7E 05      [19]  266 	ld	a,5 (ix)
   4077 DD 77 F2      [19]  267 	ld	-14 (ix),a
   407A DD 36 F3 00   [19]  268 	ld	-13 (ix),#0x00
   407E DD 7E FE      [19]  269 	ld	a,-2 (ix)
   4081 DD 96 F8      [19]  270 	sub	a, -8 (ix)
   4084 DD 77 FC      [19]  271 	ld	-4 (ix),a
   4087 DD 7E FF      [19]  272 	ld	a,-1 (ix)
   408A DD 9E F9      [19]  273 	sbc	a, -7 (ix)
   408D DD 77 FD      [19]  274 	ld	-3 (ix),a
                            275 ;src/pathfinding.c:78: if(  *getTilePtr(matriz, x, y-2) <=2/* &&
   4090 3E 02         [ 7]  276 	ld	a,#0x02
   4092 91            [ 4]  277 	sub	a, c
   4093 38 62         [12]  278 	jr	C,00127$
                            279 ;src/pathfinding.c:80: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4095 DD 6E FC      [19]  280 	ld	l,-4 (ix)
   4098 DD 66 FD      [19]  281 	ld	h,-3 (ix)
   409B E5            [11]  282 	push	hl
   409C CD 70 4A      [17]  283 	call	_abs
   409F F1            [10]  284 	pop	af
   40A0 DD 74 F7      [19]  285 	ld	-9 (ix),h
   40A3 DD 75 F6      [19]  286 	ld	-10 (ix),l
   40A6 DD 4E F2      [19]  287 	ld	c,-14 (ix)
   40A9 DD 46 F3      [19]  288 	ld	b,-13 (ix)
   40AC 0B            [ 6]  289 	dec	bc
   40AD 0B            [ 6]  290 	dec	bc
   40AE DD 7E F4      [19]  291 	ld	a,-12 (ix)
   40B1 91            [ 4]  292 	sub	a, c
   40B2 4F            [ 4]  293 	ld	c,a
   40B3 DD 7E F5      [19]  294 	ld	a,-11 (ix)
   40B6 98            [ 4]  295 	sbc	a, b
   40B7 47            [ 4]  296 	ld	b,a
   40B8 C5            [11]  297 	push	bc
   40B9 CD 70 4A      [17]  298 	call	_abs
   40BC F1            [10]  299 	pop	af
   40BD DD 74 FB      [19]  300 	ld	-5 (ix),h
   40C0 DD 75 FA      [19]  301 	ld	-6 (ix),l
   40C3 DD 7E F6      [19]  302 	ld	a,-10 (ix)
   40C6 DD 86 FA      [19]  303 	add	a, -6 (ix)
   40C9 DD 77 FA      [19]  304 	ld	-6 (ix),a
   40CC DD 7E F7      [19]  305 	ld	a,-9 (ix)
   40CF DD 8E FB      [19]  306 	adc	a, -5 (ix)
   40D2 DD 77 FB      [19]  307 	ld	-5 (ix),a
   40D5 DD 7E FA      [19]  308 	ld	a,-6 (ix)
   40D8 DD 86 E3      [19]  309 	add	a, -29 (ix)
   40DB DD 77 FA      [19]  310 	ld	-6 (ix),a
   40DE DD 7E FB      [19]  311 	ld	a,-5 (ix)
   40E1 DD 8E E4      [19]  312 	adc	a, -28 (ix)
   40E4 DD 77 FB      [19]  313 	ld	-5 (ix),a
   40E7 DD 7E FA      [19]  314 	ld	a,-6 (ix)
   40EA DD 77 EF      [19]  315 	ld	-17 (ix),a
   40ED DD 7E FB      [19]  316 	ld	a,-5 (ix)
   40F0 DD 77 F0      [19]  317 	ld	-16 (ix),a
                            318 ;src/pathfinding.c:81: resultado = 0;
   40F3 DD 36 F1 00   [19]  319 	ld	-15 (ix),#0x00
   40F7                     320 00127$:
                            321 ;src/pathfinding.c:84: if(*getTilePtr(matriz, x, y+2) <=2 /*&&
   40F7 DD 46 05      [19]  322 	ld	b,5 (ix)
   40FA 04            [ 4]  323 	inc	b
   40FB 04            [ 4]  324 	inc	b
   40FC C5            [11]  325 	push	bc
   40FD 33            [ 6]  326 	inc	sp
   40FE DD 7E 04      [19]  327 	ld	a,4 (ix)
   4101 F5            [11]  328 	push	af
   4102 33            [ 6]  329 	inc	sp
   4103 DD 6E 08      [19]  330 	ld	l,8 (ix)
   4106 DD 66 09      [19]  331 	ld	h,9 (ix)
   4109 E5            [11]  332 	push	hl
   410A CD 2C 4A      [17]  333 	call	_getTilePtr
   410D F1            [10]  334 	pop	af
   410E F1            [10]  335 	pop	af
   410F 4E            [ 7]  336 	ld	c,(hl)
   4110 3E 02         [ 7]  337 	ld	a,#0x02
   4112 91            [ 4]  338 	sub	a, c
   4113 DA AE 41      [10]  339 	jp	C,00134$
                            340 ;src/pathfinding.c:86: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   4116 DD 6E FC      [19]  341 	ld	l,-4 (ix)
   4119 DD 66 FD      [19]  342 	ld	h,-3 (ix)
   411C E5            [11]  343 	push	hl
   411D CD 70 4A      [17]  344 	call	_abs
   4120 F1            [10]  345 	pop	af
   4121 DD 74 FB      [19]  346 	ld	-5 (ix),h
   4124 DD 75 FA      [19]  347 	ld	-6 (ix),l
   4127 DD 7E F2      [19]  348 	ld	a,-14 (ix)
   412A C6 02         [ 7]  349 	add	a, #0x02
   412C DD 77 F6      [19]  350 	ld	-10 (ix),a
   412F DD 7E F3      [19]  351 	ld	a,-13 (ix)
   4132 CE 00         [ 7]  352 	adc	a, #0x00
   4134 DD 77 F7      [19]  353 	ld	-9 (ix),a
   4137 DD 7E F4      [19]  354 	ld	a,-12 (ix)
   413A DD 96 F6      [19]  355 	sub	a, -10 (ix)
   413D DD 77 F6      [19]  356 	ld	-10 (ix),a
   4140 DD 7E F5      [19]  357 	ld	a,-11 (ix)
   4143 DD 9E F7      [19]  358 	sbc	a, -9 (ix)
   4146 DD 77 F7      [19]  359 	ld	-9 (ix),a
   4149 DD 6E F6      [19]  360 	ld	l,-10 (ix)
   414C DD 66 F7      [19]  361 	ld	h,-9 (ix)
   414F E5            [11]  362 	push	hl
   4150 CD 70 4A      [17]  363 	call	_abs
   4153 F1            [10]  364 	pop	af
   4154 DD 74 F7      [19]  365 	ld	-9 (ix),h
   4157 DD 75 F6      [19]  366 	ld	-10 (ix),l
   415A DD 7E FA      [19]  367 	ld	a,-6 (ix)
   415D DD 86 F6      [19]  368 	add	a, -10 (ix)
   4160 DD 77 FA      [19]  369 	ld	-6 (ix),a
   4163 DD 7E FB      [19]  370 	ld	a,-5 (ix)
   4166 DD 8E F7      [19]  371 	adc	a, -9 (ix)
   4169 DD 77 FB      [19]  372 	ld	-5 (ix),a
   416C DD 7E E5      [19]  373 	ld	a,-27 (ix)
   416F DD 86 FA      [19]  374 	add	a, -6 (ix)
   4172 DD 77 FA      [19]  375 	ld	-6 (ix),a
   4175 DD 7E E6      [19]  376 	ld	a,-26 (ix)
   4178 DD 8E FB      [19]  377 	adc	a, -5 (ix)
   417B DD 77 FB      [19]  378 	ld	-5 (ix),a
   417E DD 7E FA      [19]  379 	ld	a,-6 (ix)
   4181 DD 77 ED      [19]  380 	ld	-19 (ix),a
   4184 DD 7E FB      [19]  381 	ld	a,-5 (ix)
   4187 DD 77 EE      [19]  382 	ld	-18 (ix),a
                            383 ;src/pathfinding.c:87: if(resultado == 0){
   418A DD 7E F1      [19]  384 	ld	a,-15 (ix)
   418D B7            [ 4]  385 	or	a, a
   418E 20 1A         [12]  386 	jr	NZ,00131$
                            387 ;src/pathfinding.c:88: if(dist1 > dist2)
   4190 DD 7E ED      [19]  388 	ld	a,-19 (ix)
   4193 DD 96 EF      [19]  389 	sub	a, -17 (ix)
   4196 DD 7E EE      [19]  390 	ld	a,-18 (ix)
   4199 DD 9E F0      [19]  391 	sbc	a, -16 (ix)
   419C E2 A1 41      [10]  392 	jp	PO, 00274$
   419F EE 80         [ 7]  393 	xor	a, #0x80
   41A1                     394 00274$:
   41A1 F2 AE 41      [10]  395 	jp	P,00134$
                            396 ;src/pathfinding.c:89: resultado = 1;
   41A4 DD 36 F1 01   [19]  397 	ld	-15 (ix),#0x01
   41A8 18 04         [12]  398 	jr	00134$
   41AA                     399 00131$:
                            400 ;src/pathfinding.c:91: resultado = 1;
   41AA DD 36 F1 01   [19]  401 	ld	-15 (ix),#0x01
   41AE                     402 00134$:
                            403 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   41AE DD 46 04      [19]  404 	ld	b,4 (ix)
   41B1 05            [ 4]  405 	dec	b
   41B2 DD 7E 05      [19]  406 	ld	a,5 (ix)
   41B5 F5            [11]  407 	push	af
   41B6 33            [ 6]  408 	inc	sp
   41B7 C5            [11]  409 	push	bc
   41B8 33            [ 6]  410 	inc	sp
   41B9 DD 6E 08      [19]  411 	ld	l,8 (ix)
   41BC DD 66 09      [19]  412 	ld	h,9 (ix)
   41BF E5            [11]  413 	push	hl
   41C0 CD 2C 4A      [17]  414 	call	_getTilePtr
   41C3 F1            [10]  415 	pop	af
   41C4 F1            [10]  416 	pop	af
   41C5 4E            [ 7]  417 	ld	c,(hl)
                            418 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   41C6 DD 7E F4      [19]  419 	ld	a,-12 (ix)
   41C9 DD 96 F2      [19]  420 	sub	a, -14 (ix)
   41CC DD 77 FA      [19]  421 	ld	-6 (ix),a
   41CF DD 7E F5      [19]  422 	ld	a,-11 (ix)
   41D2 DD 9E F3      [19]  423 	sbc	a, -13 (ix)
   41D5 DD 77 FB      [19]  424 	ld	-5 (ix),a
                            425 ;src/pathfinding.c:95: if(*getTilePtr(matriz, x-1, y) <=2 //&&
   41D8 3E 02         [ 7]  426 	ld	a,#0x02
   41DA 91            [ 4]  427 	sub	a, c
   41DB 38 70         [12]  428 	jr	C,00146$
                            429 ;src/pathfinding.c:98: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   41DD DD 4E F8      [19]  430 	ld	c,-8 (ix)
   41E0 DD 46 F9      [19]  431 	ld	b,-7 (ix)
   41E3 0B            [ 6]  432 	dec	bc
   41E4 DD 7E FE      [19]  433 	ld	a,-2 (ix)
   41E7 91            [ 4]  434 	sub	a, c
   41E8 4F            [ 4]  435 	ld	c,a
   41E9 DD 7E FF      [19]  436 	ld	a,-1 (ix)
   41EC 98            [ 4]  437 	sbc	a, b
   41ED 47            [ 4]  438 	ld	b,a
   41EE C5            [11]  439 	push	bc
   41EF CD 70 4A      [17]  440 	call	_abs
   41F2 E3            [19]  441 	ex	(sp),hl
   41F3 DD 6E FA      [19]  442 	ld	l,-6 (ix)
   41F6 DD 66 FB      [19]  443 	ld	h,-5 (ix)
   41F9 E5            [11]  444 	push	hl
   41FA CD 70 4A      [17]  445 	call	_abs
   41FD F1            [10]  446 	pop	af
   41FE C1            [10]  447 	pop	bc
   41FF 09            [11]  448 	add	hl,bc
   4200 D1            [10]  449 	pop	de
   4201 D5            [11]  450 	push	de
   4202 19            [11]  451 	add	hl,de
   4203 DD 75 EB      [19]  452 	ld	-21 (ix),l
   4206 DD 74 EC      [19]  453 	ld	-20 (ix),h
                            454 ;src/pathfinding.c:99: if(resultado == 0){
   4209 DD 7E F1      [19]  455 	ld	a,-15 (ix)
   420C B7            [ 4]  456 	or	a, a
   420D 20 1A         [12]  457 	jr	NZ,00143$
                            458 ;src/pathfinding.c:100: if(dist1 >= dist3)
   420F DD 7E EF      [19]  459 	ld	a,-17 (ix)
   4212 DD 96 EB      [19]  460 	sub	a, -21 (ix)
   4215 DD 7E F0      [19]  461 	ld	a,-16 (ix)
   4218 DD 9E EC      [19]  462 	sbc	a, -20 (ix)
   421B E2 20 42      [10]  463 	jp	PO, 00275$
   421E EE 80         [ 7]  464 	xor	a, #0x80
   4220                     465 00275$:
   4220 FA 4D 42      [10]  466 	jp	M,00146$
                            467 ;src/pathfinding.c:101: resultado = 2;
   4223 DD 36 F1 02   [19]  468 	ld	-15 (ix),#0x02
   4227 18 24         [12]  469 	jr	00146$
   4229                     470 00143$:
                            471 ;src/pathfinding.c:102: }else if(resultado == 1){
   4229 DD 7E F1      [19]  472 	ld	a,-15 (ix)
   422C 3D            [ 4]  473 	dec	a
   422D 20 1A         [12]  474 	jr	NZ,00140$
                            475 ;src/pathfinding.c:103: if(dist2 >= dist3)
   422F DD 7E ED      [19]  476 	ld	a,-19 (ix)
   4232 DD 96 EB      [19]  477 	sub	a, -21 (ix)
   4235 DD 7E EE      [19]  478 	ld	a,-18 (ix)
   4238 DD 9E EC      [19]  479 	sbc	a, -20 (ix)
   423B E2 40 42      [10]  480 	jp	PO, 00278$
   423E EE 80         [ 7]  481 	xor	a, #0x80
   4240                     482 00278$:
   4240 FA 4D 42      [10]  483 	jp	M,00146$
                            484 ;src/pathfinding.c:104: resultado = 2;
   4243 DD 36 F1 02   [19]  485 	ld	-15 (ix),#0x02
   4247 18 04         [12]  486 	jr	00146$
   4249                     487 00140$:
                            488 ;src/pathfinding.c:106: resultado = 2;
   4249 DD 36 F1 02   [19]  489 	ld	-15 (ix),#0x02
   424D                     490 00146$:
                            491 ;src/pathfinding.c:110: if(*getTilePtr(matriz, (x +1), y) <=2 //&&
   424D DD 46 04      [19]  492 	ld	b,4 (ix)
   4250 04            [ 4]  493 	inc	b
   4251 DD 7E 05      [19]  494 	ld	a,5 (ix)
   4254 F5            [11]  495 	push	af
   4255 33            [ 6]  496 	inc	sp
   4256 C5            [11]  497 	push	bc
   4257 33            [ 6]  498 	inc	sp
   4258 DD 6E 08      [19]  499 	ld	l,8 (ix)
   425B DD 66 09      [19]  500 	ld	h,9 (ix)
   425E E5            [11]  501 	push	hl
   425F CD 2C 4A      [17]  502 	call	_getTilePtr
   4262 F1            [10]  503 	pop	af
   4263 F1            [10]  504 	pop	af
   4264 4E            [ 7]  505 	ld	c,(hl)
   4265 3E 02         [ 7]  506 	ld	a,#0x02
   4267 91            [ 4]  507 	sub	a, c
   4268 DA 38 43      [10]  508 	jp	C,00163$
                            509 ;src/pathfinding.c:113: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   426B DD 7E F8      [19]  510 	ld	a,-8 (ix)
   426E C6 01         [ 7]  511 	add	a, #0x01
   4270 DD 77 F6      [19]  512 	ld	-10 (ix),a
   4273 DD 7E F9      [19]  513 	ld	a,-7 (ix)
   4276 CE 00         [ 7]  514 	adc	a, #0x00
   4278 DD 77 F7      [19]  515 	ld	-9 (ix),a
   427B DD 7E FE      [19]  516 	ld	a,-2 (ix)
   427E DD 96 F6      [19]  517 	sub	a, -10 (ix)
   4281 DD 77 F6      [19]  518 	ld	-10 (ix),a
   4284 DD 7E FF      [19]  519 	ld	a,-1 (ix)
   4287 DD 9E F7      [19]  520 	sbc	a, -9 (ix)
   428A DD 77 F7      [19]  521 	ld	-9 (ix),a
   428D DD 6E F6      [19]  522 	ld	l,-10 (ix)
   4290 DD 66 F7      [19]  523 	ld	h,-9 (ix)
   4293 E5            [11]  524 	push	hl
   4294 CD 70 4A      [17]  525 	call	_abs
   4297 F1            [10]  526 	pop	af
   4298 DD 74 F7      [19]  527 	ld	-9 (ix),h
   429B DD 75 F6      [19]  528 	ld	-10 (ix),l
   429E DD 6E FA      [19]  529 	ld	l,-6 (ix)
   42A1 DD 66 FB      [19]  530 	ld	h,-5 (ix)
   42A4 E5            [11]  531 	push	hl
   42A5 CD 70 4A      [17]  532 	call	_abs
   42A8 F1            [10]  533 	pop	af
   42A9 DD 74 FB      [19]  534 	ld	-5 (ix),h
   42AC DD 75 FA      [19]  535 	ld	-6 (ix),l
   42AF DD 7E F6      [19]  536 	ld	a,-10 (ix)
   42B2 DD 86 FA      [19]  537 	add	a, -6 (ix)
   42B5 DD 77 FA      [19]  538 	ld	-6 (ix),a
   42B8 DD 7E F7      [19]  539 	ld	a,-9 (ix)
   42BB DD 8E FB      [19]  540 	adc	a, -5 (ix)
   42BE DD 77 FB      [19]  541 	ld	-5 (ix),a
   42C1 DD 7E FA      [19]  542 	ld	a,-6 (ix)
   42C4 DD 86 E7      [19]  543 	add	a, -25 (ix)
   42C7 DD 77 E9      [19]  544 	ld	-23 (ix),a
   42CA DD 7E FB      [19]  545 	ld	a,-5 (ix)
   42CD DD 8E E8      [19]  546 	adc	a, -24 (ix)
   42D0 DD 77 EA      [19]  547 	ld	-22 (ix),a
                            548 ;src/pathfinding.c:114: if(resultado == 0){
   42D3 DD 7E F1      [19]  549 	ld	a,-15 (ix)
   42D6 B7            [ 4]  550 	or	a, a
   42D7 20 1A         [12]  551 	jr	NZ,00160$
                            552 ;src/pathfinding.c:115: if(dist1 >= dist4)
   42D9 DD 7E EF      [19]  553 	ld	a,-17 (ix)
   42DC DD 96 E9      [19]  554 	sub	a, -23 (ix)
   42DF DD 7E F0      [19]  555 	ld	a,-16 (ix)
   42E2 DD 9E EA      [19]  556 	sbc	a, -22 (ix)
   42E5 E2 EA 42      [10]  557 	jp	PO, 00279$
   42E8 EE 80         [ 7]  558 	xor	a, #0x80
   42EA                     559 00279$:
   42EA FA 38 43      [10]  560 	jp	M,00163$
                            561 ;src/pathfinding.c:116: resultado = 3;
   42ED DD 36 F1 03   [19]  562 	ld	-15 (ix),#0x03
   42F1 18 45         [12]  563 	jr	00163$
   42F3                     564 00160$:
                            565 ;src/pathfinding.c:117: }else if(resultado == 1){
   42F3 DD 7E F1      [19]  566 	ld	a,-15 (ix)
   42F6 3D            [ 4]  567 	dec	a
   42F7 20 1A         [12]  568 	jr	NZ,00157$
                            569 ;src/pathfinding.c:118: if(dist2 >= dist4)
   42F9 DD 7E ED      [19]  570 	ld	a,-19 (ix)
   42FC DD 96 E9      [19]  571 	sub	a, -23 (ix)
   42FF DD 7E EE      [19]  572 	ld	a,-18 (ix)
   4302 DD 9E EA      [19]  573 	sbc	a, -22 (ix)
   4305 E2 0A 43      [10]  574 	jp	PO, 00282$
   4308 EE 80         [ 7]  575 	xor	a, #0x80
   430A                     576 00282$:
   430A FA 38 43      [10]  577 	jp	M,00163$
                            578 ;src/pathfinding.c:119: resultado = 3;
   430D DD 36 F1 03   [19]  579 	ld	-15 (ix),#0x03
   4311 18 25         [12]  580 	jr	00163$
   4313                     581 00157$:
                            582 ;src/pathfinding.c:120: }else if (resultado == 2){
   4313 DD 7E F1      [19]  583 	ld	a,-15 (ix)
   4316 D6 02         [ 7]  584 	sub	a, #0x02
   4318 20 1A         [12]  585 	jr	NZ,00154$
                            586 ;src/pathfinding.c:121: if(dist3 >= dist4)
   431A DD 7E EB      [19]  587 	ld	a,-21 (ix)
   431D DD 96 E9      [19]  588 	sub	a, -23 (ix)
   4320 DD 7E EC      [19]  589 	ld	a,-20 (ix)
   4323 DD 9E EA      [19]  590 	sbc	a, -22 (ix)
   4326 E2 2B 43      [10]  591 	jp	PO, 00285$
   4329 EE 80         [ 7]  592 	xor	a, #0x80
   432B                     593 00285$:
   432B FA 38 43      [10]  594 	jp	M,00163$
                            595 ;src/pathfinding.c:122: resultado = 3;
   432E DD 36 F1 03   [19]  596 	ld	-15 (ix),#0x03
   4332 18 04         [12]  597 	jr	00163$
   4334                     598 00154$:
                            599 ;src/pathfinding.c:124: resultado = 3;
   4334 DD 36 F1 03   [19]  600 	ld	-15 (ix),#0x03
   4338                     601 00163$:
                            602 ;src/pathfinding.c:128: return resultado;
   4338 DD 6E F1      [19]  603 	ld	l,-15 (ix)
   433B DD F9         [10]  604 	ld	sp, ix
   433D DD E1         [14]  605 	pop	ix
   433F C9            [10]  606 	ret
                            607 ;src/pathfinding.c:132: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* actual, u8* matriz){
                            608 ;	---------------------------------
                            609 ; Function pathFinding
                            610 ; ---------------------------------
   4340                     611 _pathFinding::
   4340 DD E5         [15]  612 	push	ix
   4342 DD 21 00 00   [14]  613 	ld	ix,#0
   4346 DD 39         [15]  614 	add	ix,sp
   4348 21 F7 FF      [10]  615 	ld	hl,#-9
   434B 39            [11]  616 	add	hl,sp
   434C F9            [ 6]  617 	ld	sp,hl
                            618 ;src/pathfinding.c:144: u8 problem = 0;
   434D 1E 00         [ 7]  619 	ld	e,#0x00
                            620 ;src/pathfinding.c:146: x = s_x;
   434F DD 7E 04      [19]  621 	ld	a,4 (ix)
   4352 DD 77 FB      [19]  622 	ld	-5 (ix),a
                            623 ;src/pathfinding.c:147: sol_tam = 0;
   4355 21 0C 63      [10]  624 	ld	hl,#_sol_tam + 0
   4358 36 00         [10]  625 	ld	(hl), #0x00
                            626 ;src/pathfinding.c:148: y = s_y;
   435A DD 7E 05      [19]  627 	ld	a,5 (ix)
   435D DD 77 FA      [19]  628 	ld	-6 (ix),a
                            629 ;src/pathfinding.c:150: k = 0;
   4360 DD 36 F9 00   [19]  630 	ld	-7 (ix),#0x00
                            631 ;src/pathfinding.c:151: aux = 1;
   4364 DD 36 F8 01   [19]  632 	ld	-8 (ix),#0x01
                            633 ;src/pathfinding.c:152: actual->longitud_camino = 0;
   4368 DD 7E 08      [19]  634 	ld	a,8 (ix)
   436B DD 77 FC      [19]  635 	ld	-4 (ix),a
   436E DD 7E 09      [19]  636 	ld	a,9 (ix)
   4371 DD 77 FD      [19]  637 	ld	-3 (ix),a
   4374 DD 7E FC      [19]  638 	ld	a,-4 (ix)
   4377 C6 E1         [ 7]  639 	add	a, #0xE1
   4379 4F            [ 4]  640 	ld	c,a
   437A DD 7E FD      [19]  641 	ld	a,-3 (ix)
   437D CE 00         [ 7]  642 	adc	a, #0x00
   437F 47            [ 4]  643 	ld	b,a
   4380 AF            [ 4]  644 	xor	a, a
   4381 02            [ 7]  645 	ld	(bc),a
                            646 ;src/pathfinding.c:153: inserted = anyadirALista(x, y);
   4382 C5            [11]  647 	push	bc
   4383 D5            [11]  648 	push	de
   4384 DD 66 FA      [19]  649 	ld	h,-6 (ix)
   4387 DD 6E FB      [19]  650 	ld	l,-5 (ix)
   438A E5            [11]  651 	push	hl
   438B CD 0A 3F      [17]  652 	call	_anyadirALista
   438E F1            [10]  653 	pop	af
   438F D1            [10]  654 	pop	de
   4390 C1            [10]  655 	pop	bc
   4391 DD 75 F7      [19]  656 	ld	-9 (ix),l
                            657 ;src/pathfinding.c:157: while (aux){
   4394                     658 00114$:
   4394 DD 7E F8      [19]  659 	ld	a,-8 (ix)
   4397 B7            [ 4]  660 	or	a, a
   4398 CA 9B 44      [10]  661 	jp	Z,00116$
                            662 ;src/pathfinding.c:158: if( (x == f_x && y == f_y) || inserted == 0){
   439B DD 7E 06      [19]  663 	ld	a,6 (ix)
   439E DD 96 FB      [19]  664 	sub	a, -5 (ix)
   43A1 20 08         [12]  665 	jr	NZ,00113$
   43A3 DD 7E 07      [19]  666 	ld	a,7 (ix)
   43A6 DD 96 FA      [19]  667 	sub	a, -6 (ix)
   43A9 28 06         [12]  668 	jr	Z,00109$
   43AB                     669 00113$:
   43AB DD 7E F7      [19]  670 	ld	a,-9 (ix)
   43AE B7            [ 4]  671 	or	a, a
   43AF 20 14         [12]  672 	jr	NZ,00110$
   43B1                     673 00109$:
                            674 ;src/pathfinding.c:160: if(inserted == 0 || sol_tam == 0){
   43B1 DD 7E F7      [19]  675 	ld	a,-9 (ix)
   43B4 B7            [ 4]  676 	or	a, a
   43B5 28 06         [12]  677 	jr	Z,00101$
   43B7 3A 0C 63      [13]  678 	ld	a,(#_sol_tam + 0)
   43BA B7            [ 4]  679 	or	a, a
   43BB 20 02         [12]  680 	jr	NZ,00102$
   43BD                     681 00101$:
                            682 ;src/pathfinding.c:161: problem = 1;
   43BD 1E 01         [ 7]  683 	ld	e,#0x01
   43BF                     684 00102$:
                            685 ;src/pathfinding.c:164: aux = 0;
   43BF DD 36 F8 00   [19]  686 	ld	-8 (ix),#0x00
   43C3 18 CF         [12]  687 	jr	00114$
   43C5                     688 00110$:
                            689 ;src/pathfinding.c:166: movimiento = adjacentTiles(x, y, f_x, f_y, matriz);
   43C5 C5            [11]  690 	push	bc
   43C6 D5            [11]  691 	push	de
   43C7 DD 6E 0A      [19]  692 	ld	l,10 (ix)
   43CA DD 66 0B      [19]  693 	ld	h,11 (ix)
   43CD E5            [11]  694 	push	hl
   43CE DD 66 07      [19]  695 	ld	h,7 (ix)
   43D1 DD 6E 06      [19]  696 	ld	l,6 (ix)
   43D4 E5            [11]  697 	push	hl
   43D5 DD 66 FA      [19]  698 	ld	h,-6 (ix)
   43D8 DD 6E FB      [19]  699 	ld	l,-5 (ix)
   43DB E5            [11]  700 	push	hl
   43DC CD 52 3F      [17]  701 	call	_adjacentTiles
   43DF F1            [10]  702 	pop	af
   43E0 F1            [10]  703 	pop	af
   43E1 F1            [10]  704 	pop	af
   43E2 D1            [10]  705 	pop	de
   43E3 C1            [10]  706 	pop	bc
   43E4 55            [ 4]  707 	ld	d,l
                            708 ;src/pathfinding.c:168: switch(movimiento){
   43E5 3E 03         [ 7]  709 	ld	a,#0x03
   43E7 92            [ 4]  710 	sub	a, d
   43E8 38 AA         [12]  711 	jr	C,00114$
                            712 ;src/pathfinding.c:172: k = k+2;
   43EA DD 7E F9      [19]  713 	ld	a,-7 (ix)
   43ED C6 02         [ 7]  714 	add	a, #0x02
   43EF DD 77 FF      [19]  715 	ld	-1 (ix),a
                            716 ;src/pathfinding.c:168: switch(movimiento){
   43F2 D5            [11]  717 	push	de
   43F3 5A            [ 4]  718 	ld	e,d
   43F4 16 00         [ 7]  719 	ld	d,#0x00
   43F6 21 FD 43      [10]  720 	ld	hl,#00169$
   43F9 19            [11]  721 	add	hl,de
   43FA 19            [11]  722 	add	hl,de
                            723 ;src/pathfinding.c:169: case 0:
   43FB D1            [10]  724 	pop	de
   43FC E9            [ 4]  725 	jp	(hl)
   43FD                     726 00169$:
   43FD 18 06         [12]  727 	jr	00104$
   43FF 18 2D         [12]  728 	jr	00105$
   4401 18 4E         [12]  729 	jr	00106$
   4403 18 6E         [12]  730 	jr	00107$
   4405                     731 00104$:
                            732 ;src/pathfinding.c:170: inserted = anyadirALista(x, y-2);
   4405 DD 7E FA      [19]  733 	ld	a,-6 (ix)
   4408 C6 FE         [ 7]  734 	add	a,#0xFE
   440A DD 77 FE      [19]  735 	ld	-2 (ix),a
   440D C5            [11]  736 	push	bc
   440E D5            [11]  737 	push	de
   440F DD 66 FE      [19]  738 	ld	h,-2 (ix)
   4412 DD 6E FB      [19]  739 	ld	l,-5 (ix)
   4415 E5            [11]  740 	push	hl
   4416 CD 0A 3F      [17]  741 	call	_anyadirALista
   4419 F1            [10]  742 	pop	af
   441A D1            [10]  743 	pop	de
   441B C1            [10]  744 	pop	bc
   441C DD 75 F7      [19]  745 	ld	-9 (ix),l
                            746 ;src/pathfinding.c:171: y = y-2;
   441F DD 56 FE      [19]  747 	ld	d,-2 (ix)
   4422 DD 72 FA      [19]  748 	ld	-6 (ix),d
                            749 ;src/pathfinding.c:172: k = k+2;
   4425 DD 7E FF      [19]  750 	ld	a,-1 (ix)
   4428 DD 77 F9      [19]  751 	ld	-7 (ix),a
                            752 ;src/pathfinding.c:173: break;
   442B C3 94 43      [10]  753 	jp	00114$
                            754 ;src/pathfinding.c:174: case 1:
   442E                     755 00105$:
                            756 ;src/pathfinding.c:177: inserted = anyadirALista(x, y+2);
   442E DD 56 FA      [19]  757 	ld	d,-6 (ix)
   4431 14            [ 4]  758 	inc	d
   4432 14            [ 4]  759 	inc	d
   4433 C5            [11]  760 	push	bc
   4434 D5            [11]  761 	push	de
   4435 D5            [11]  762 	push	de
   4436 33            [ 6]  763 	inc	sp
   4437 DD 7E FB      [19]  764 	ld	a,-5 (ix)
   443A F5            [11]  765 	push	af
   443B 33            [ 6]  766 	inc	sp
   443C CD 0A 3F      [17]  767 	call	_anyadirALista
   443F F1            [10]  768 	pop	af
   4440 D1            [10]  769 	pop	de
   4441 C1            [10]  770 	pop	bc
   4442 DD 75 F7      [19]  771 	ld	-9 (ix),l
                            772 ;src/pathfinding.c:178: y = y+2;
   4445 DD 72 FA      [19]  773 	ld	-6 (ix),d
                            774 ;src/pathfinding.c:179: k = k+2;
   4448 DD 7E FF      [19]  775 	ld	a,-1 (ix)
   444B DD 77 F9      [19]  776 	ld	-7 (ix),a
                            777 ;src/pathfinding.c:180: break;
   444E C3 94 43      [10]  778 	jp	00114$
                            779 ;src/pathfinding.c:181: case 2:
   4451                     780 00106$:
                            781 ;src/pathfinding.c:184: inserted = anyadirALista(x-1, y);
   4451 DD 56 FB      [19]  782 	ld	d,-5 (ix)
   4454 15            [ 4]  783 	dec	d
   4455 C5            [11]  784 	push	bc
   4456 D5            [11]  785 	push	de
   4457 DD 7E FA      [19]  786 	ld	a,-6 (ix)
   445A F5            [11]  787 	push	af
   445B 33            [ 6]  788 	inc	sp
   445C D5            [11]  789 	push	de
   445D 33            [ 6]  790 	inc	sp
   445E CD 0A 3F      [17]  791 	call	_anyadirALista
   4461 F1            [10]  792 	pop	af
   4462 D1            [10]  793 	pop	de
   4463 C1            [10]  794 	pop	bc
   4464 DD 75 F7      [19]  795 	ld	-9 (ix),l
                            796 ;src/pathfinding.c:185: x = x-1;
   4467 DD 72 FB      [19]  797 	ld	-5 (ix),d
                            798 ;src/pathfinding.c:186: k = k+2;
   446A DD 7E FF      [19]  799 	ld	a,-1 (ix)
   446D DD 77 F9      [19]  800 	ld	-7 (ix),a
                            801 ;src/pathfinding.c:187: break;
   4470 C3 94 43      [10]  802 	jp	00114$
                            803 ;src/pathfinding.c:188: case 3:
   4473                     804 00107$:
                            805 ;src/pathfinding.c:189: inserted = anyadirALista(x+1, y);
   4473 DD 7E FB      [19]  806 	ld	a,-5 (ix)
   4476 3C            [ 4]  807 	inc	a
   4477 DD 77 FE      [19]  808 	ld	-2 (ix),a
   447A C5            [11]  809 	push	bc
   447B D5            [11]  810 	push	de
   447C DD 66 FA      [19]  811 	ld	h,-6 (ix)
   447F DD 6E FE      [19]  812 	ld	l,-2 (ix)
   4482 E5            [11]  813 	push	hl
   4483 CD 0A 3F      [17]  814 	call	_anyadirALista
   4486 F1            [10]  815 	pop	af
   4487 D1            [10]  816 	pop	de
   4488 C1            [10]  817 	pop	bc
   4489 DD 75 F7      [19]  818 	ld	-9 (ix),l
                            819 ;src/pathfinding.c:190: x = x+1;
   448C DD 6E FE      [19]  820 	ld	l,-2 (ix)
   448F DD 75 FB      [19]  821 	ld	-5 (ix),l
                            822 ;src/pathfinding.c:191: k = k+2;
   4492 DD 7E FF      [19]  823 	ld	a,-1 (ix)
   4495 DD 77 F9      [19]  824 	ld	-7 (ix),a
                            825 ;src/pathfinding.c:194: }
   4498 C3 94 43      [10]  826 	jp	00114$
   449B                     827 00116$:
                            828 ;src/pathfinding.c:199: if(problem == 0){
   449B 7B            [ 4]  829 	ld	a,e
   449C B7            [ 4]  830 	or	a, a
   449D 20 44         [12]  831 	jr	NZ,00122$
                            832 ;src/pathfinding.c:200: if(sol_tam < CAMINO_TAM){
                            833 ;src/pathfinding.c:201: actual->longitud_camino = sol_tam;
   449F 3A 0C 63      [13]  834 	ld	a,(#_sol_tam + 0)
   44A2 FE C8         [ 7]  835 	cp	a,#0xC8
   44A4 30 03         [12]  836 	jr	NC,00118$
   44A6 02            [ 7]  837 	ld	(bc),a
   44A7 18 03         [12]  838 	jr	00137$
   44A9                     839 00118$:
                            840 ;src/pathfinding.c:203: actual->longitud_camino = CAMINO_TAM;
   44A9 3E C8         [ 7]  841 	ld	a,#0xC8
   44AB 02            [ 7]  842 	ld	(bc),a
                            843 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   44AC                     844 00137$:
   44AC DD 7E FC      [19]  845 	ld	a,-4 (ix)
   44AF C6 19         [ 7]  846 	add	a, #0x19
   44B1 DD 77 FC      [19]  847 	ld	-4 (ix),a
   44B4 DD 7E FD      [19]  848 	ld	a,-3 (ix)
   44B7 CE 00         [ 7]  849 	adc	a, #0x00
   44B9 DD 77 FD      [19]  850 	ld	-3 (ix),a
   44BC 1E 00         [ 7]  851 	ld	e,#0x00
   44BE                     852 00125$:
   44BE 0A            [ 7]  853 	ld	a,(bc)
   44BF 57            [ 4]  854 	ld	d,a
   44C0 7B            [ 4]  855 	ld	a,e
   44C1 92            [ 4]  856 	sub	a, d
   44C2 30 21         [12]  857 	jr	NC,00127$
                            858 ;src/pathfinding.c:206: actual->camino[i] = camino[i];
   44C4 E5            [11]  859 	push	hl
   44C5 6B            [ 4]  860 	ld	l,e
   44C6 26 00         [ 7]  861 	ld	h,#0x00
   44C8 E5            [11]  862 	push	hl
   44C9 FD E1         [14]  863 	pop	iy
   44CB E1            [10]  864 	pop	hl
   44CC C5            [11]  865 	push	bc
   44CD DD 4E FC      [19]  866 	ld	c,-4 (ix)
   44D0 DD 46 FD      [19]  867 	ld	b,-3 (ix)
   44D3 FD 09         [15]  868 	add	iy, bc
   44D5 C1            [10]  869 	pop	bc
   44D6 21 0D 63      [10]  870 	ld	hl,#_camino
   44D9 16 00         [ 7]  871 	ld	d,#0x00
   44DB 19            [11]  872 	add	hl, de
   44DC 56            [ 7]  873 	ld	d,(hl)
   44DD FD 72 00      [19]  874 	ld	0 (iy), d
                            875 ;src/pathfinding.c:205: for (i; i<actual->longitud_camino; i++){
   44E0 1C            [ 4]  876 	inc	e
   44E1 18 DB         [12]  877 	jr	00125$
   44E3                     878 00122$:
                            879 ;src/pathfinding.c:210: actual->longitud_camino = 0;
   44E3 AF            [ 4]  880 	xor	a, a
   44E4 02            [ 7]  881 	ld	(bc),a
   44E5                     882 00127$:
   44E5 DD F9         [10]  883 	ld	sp, ix
   44E7 DD E1         [14]  884 	pop	ix
   44E9 C9            [10]  885 	ret
                            886 	.area _CODE
                            887 	.area _INITIALIZER
                            888 	.area _CABS (ABS)
>>>>>>> 43a364b20948275f47d6194bf3a899ff3c4c1487
