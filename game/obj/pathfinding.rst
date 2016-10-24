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
   6A6A                      28 _sol_tam::
   6A6A                      29 	.ds 1
   6A6B                      30 _sol_matriz::
   6A6B                      31 	.ds 2112
   72AB                      32 _camino::
   72AB                      33 	.ds 100
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
   3F0A                      62 _getBit::
   3F0A DD E5         [15]   63 	push	ix
   3F0C DD 21 00 00   [14]   64 	ld	ix,#0
   3F10 DD 39         [15]   65 	add	ix,sp
                             66 ;src/pathfinding.c:19: byteV = array[pos/8];
   3F12 DD 4E 06      [19]   67 	ld	c,6 (ix)
   3F15 DD 46 07      [19]   68 	ld	b,7 (ix)
   3F18 CB 38         [ 8]   69 	srl	b
   3F1A CB 19         [ 8]   70 	rr	c
   3F1C CB 38         [ 8]   71 	srl	b
   3F1E CB 19         [ 8]   72 	rr	c
   3F20 CB 38         [ 8]   73 	srl	b
   3F22 CB 19         [ 8]   74 	rr	c
   3F24 DD 6E 04      [19]   75 	ld	l,4 (ix)
   3F27 DD 66 05      [19]   76 	ld	h,5 (ix)
   3F2A 09            [11]   77 	add	hl,bc
   3F2B 4E            [ 7]   78 	ld	c,(hl)
   3F2C 06 00         [ 7]   79 	ld	b,#0x00
                             80 ;src/pathfinding.c:20: bitV = bitWeights[pos%8];
   3F2E DD 7E 06      [19]   81 	ld	a,6 (ix)
   3F31 E6 07         [ 7]   82 	and	a, #0x07
   3F33 6F            [ 4]   83 	ld	l,a
   3F34 26 00         [ 7]   84 	ld	h,#0x00
   3F36 29            [11]   85 	add	hl, hl
   3F37 11 55 3F      [10]   86 	ld	de,#_bitWeights
   3F3A 19            [11]   87 	add	hl,de
   3F3B 5E            [ 7]   88 	ld	e,(hl)
   3F3C 23            [ 6]   89 	inc	hl
   3F3D 56            [ 7]   90 	ld	d,(hl)
                             91 ;src/pathfinding.c:21: return (byteV & bitV) == bitV;
   3F3E 79            [ 4]   92 	ld	a,c
   3F3F A3            [ 4]   93 	and	a, e
   3F40 4F            [ 4]   94 	ld	c,a
   3F41 78            [ 4]   95 	ld	a,b
   3F42 A2            [ 4]   96 	and	a, d
   3F43 47            [ 4]   97 	ld	b,a
   3F44 7B            [ 4]   98 	ld	a,e
   3F45 91            [ 4]   99 	sub	a, c
   3F46 20 08         [12]  100 	jr	NZ,00103$
   3F48 7A            [ 4]  101 	ld	a,d
   3F49 90            [ 4]  102 	sub	a, b
   3F4A 20 04         [12]  103 	jr	NZ,00103$
   3F4C 3E 01         [ 7]  104 	ld	a,#0x01
   3F4E 18 01         [12]  105 	jr	00104$
   3F50                     106 00103$:
   3F50 AF            [ 4]  107 	xor	a,a
   3F51                     108 00104$:
   3F51 6F            [ 4]  109 	ld	l,a
   3F52 DD E1         [14]  110 	pop	ix
   3F54 C9            [10]  111 	ret
   3F55                     112 _bitWeights:
   3F55 01 00               113 	.dw #0x0001
   3F57 02 00               114 	.dw #0x0002
   3F59 04 00               115 	.dw #0x0004
   3F5B 08 00               116 	.dw #0x0008
   3F5D 10 00               117 	.dw #0x0010
   3F5F 20 00               118 	.dw #0x0020
   3F61 40 00               119 	.dw #0x0040
   3F63 80 00               120 	.dw #0x0080
                            121 ;src/pathfinding.c:24: void setBit(u8 *array, u16 pos, u16 value)
                            122 ;	---------------------------------
                            123 ; Function setBit
                            124 ; ---------------------------------
   3F65                     125 _setBit::
   3F65 DD E5         [15]  126 	push	ix
   3F67 DD 21 00 00   [14]  127 	ld	ix,#0
   3F6B DD 39         [15]  128 	add	ix,sp
                            129 ;src/pathfinding.c:30: bytePos = pos/8;
   3F6D DD 5E 06      [19]  130 	ld	e,6 (ix)
   3F70 DD 56 07      [19]  131 	ld	d,7 (ix)
   3F73 CB 3A         [ 8]  132 	srl	d
   3F75 CB 1B         [ 8]  133 	rr	e
   3F77 CB 3A         [ 8]  134 	srl	d
   3F79 CB 1B         [ 8]  135 	rr	e
   3F7B CB 3A         [ 8]  136 	srl	d
   3F7D CB 1B         [ 8]  137 	rr	e
                            138 ;src/pathfinding.c:32: bitV = bitWeights[pos%8];
   3F7F 01 55 3F      [10]  139 	ld	bc,#_bitWeights+0
   3F82 DD 7E 06      [19]  140 	ld	a,6 (ix)
   3F85 E6 07         [ 7]  141 	and	a, #0x07
   3F87 6F            [ 4]  142 	ld	l,a
   3F88 26 00         [ 7]  143 	ld	h,#0x00
   3F8A 29            [11]  144 	add	hl, hl
   3F8B 09            [11]  145 	add	hl,bc
   3F8C 4E            [ 7]  146 	ld	c,(hl)
   3F8D 23            [ 6]  147 	inc	hl
   3F8E 46            [ 7]  148 	ld	b,(hl)
                            149 ;src/pathfinding.c:36: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   3F8F DD 6E 04      [19]  150 	ld	l,4 (ix)
   3F92 DD 66 05      [19]  151 	ld	h,5 (ix)
   3F95 19            [11]  152 	add	hl,de
                            153 ;src/pathfinding.c:34: if(value == 0)
   3F96 DD 7E 09      [19]  154 	ld	a,9 (ix)
   3F99 DD B6 08      [19]  155 	or	a,8 (ix)
   3F9C 20 20         [12]  156 	jr	NZ,00106$
                            157 ;src/pathfinding.c:36: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   3F9E E5            [11]  158 	push	hl
   3F9F C5            [11]  159 	push	bc
   3FA0 DD 5E 06      [19]  160 	ld	e,6 (ix)
   3FA3 DD 56 07      [19]  161 	ld	d,7 (ix)
   3FA6 D5            [11]  162 	push	de
   3FA7 DD 5E 04      [19]  163 	ld	e,4 (ix)
   3FAA DD 56 05      [19]  164 	ld	d,5 (ix)
   3FAD D5            [11]  165 	push	de
   3FAE CD 0A 3F      [17]  166 	call	_getBit
   3FB1 F1            [10]  167 	pop	af
   3FB2 F1            [10]  168 	pop	af
   3FB3 7D            [ 4]  169 	ld	a,l
   3FB4 C1            [10]  170 	pop	bc
   3FB5 E1            [10]  171 	pop	hl
   3FB6 B7            [ 4]  172 	or	a, a
   3FB7 28 23         [12]  173 	jr	Z,00108$
   3FB9 7E            [ 7]  174 	ld	a, (hl)
   3FBA 91            [ 4]  175 	sub	a, c
   3FBB 77            [ 7]  176 	ld	(hl),a
   3FBC 18 1E         [12]  177 	jr	00108$
   3FBE                     178 00106$:
                            179 ;src/pathfinding.c:40: if(getBit(array, pos) == 0) array[bytePos] += bitV;
   3FBE E5            [11]  180 	push	hl
   3FBF C5            [11]  181 	push	bc
   3FC0 DD 5E 06      [19]  182 	ld	e,6 (ix)
   3FC3 DD 56 07      [19]  183 	ld	d,7 (ix)
   3FC6 D5            [11]  184 	push	de
   3FC7 DD 5E 04      [19]  185 	ld	e,4 (ix)
   3FCA DD 56 05      [19]  186 	ld	d,5 (ix)
   3FCD D5            [11]  187 	push	de
   3FCE CD 0A 3F      [17]  188 	call	_getBit
   3FD1 F1            [10]  189 	pop	af
   3FD2 F1            [10]  190 	pop	af
   3FD3 7D            [ 4]  191 	ld	a,l
   3FD4 C1            [10]  192 	pop	bc
   3FD5 E1            [10]  193 	pop	hl
   3FD6 B7            [ 4]  194 	or	a, a
   3FD7 20 03         [12]  195 	jr	NZ,00108$
   3FD9 7E            [ 7]  196 	ld	a, (hl)
   3FDA 81            [ 4]  197 	add	a, c
   3FDB 77            [ 7]  198 	ld	(hl),a
   3FDC                     199 00108$:
   3FDC DD E1         [14]  200 	pop	ix
   3FDE C9            [10]  201 	ret
                            202 ;src/pathfinding.c:45: u8 anyadirALista(u8 x, u8 y){
                            203 ;	---------------------------------
                            204 ; Function anyadirALista
                            205 ; ---------------------------------
   3FDF                     206 _anyadirALista::
                            207 ;src/pathfinding.c:46: u8 anyadido = 0;
   3FDF 0E 00         [ 7]  208 	ld	c,#0x00
                            209 ;src/pathfinding.c:48: if(sol_tam < CAMINO_TAM){
   3FE1 3A 6A 6A      [13]  210 	ld	a,(#_sol_tam + 0)
   3FE4 D6 64         [ 7]  211 	sub	a, #0x64
   3FE6 30 33         [12]  212 	jr	NC,00102$
                            213 ;src/pathfinding.c:49: camino[sol_tam-1] = x;
   3FE8 01 AB 72      [10]  214 	ld	bc,#_camino+0
   3FEB 21 6A 6A      [10]  215 	ld	hl,#_sol_tam + 0
   3FEE 5E            [ 7]  216 	ld	e, (hl)
   3FEF 1D            [ 4]  217 	dec	e
   3FF0 6B            [ 4]  218 	ld	l,e
   3FF1 26 00         [ 7]  219 	ld	h,#0x00
   3FF3 09            [11]  220 	add	hl,bc
   3FF4 FD 21 02 00   [14]  221 	ld	iy,#2
   3FF8 FD 39         [15]  222 	add	iy,sp
   3FFA FD 7E 00      [19]  223 	ld	a,0 (iy)
   3FFD 77            [ 7]  224 	ld	(hl),a
                            225 ;src/pathfinding.c:50: sol_tam++;
   3FFE 21 6A 6A      [10]  226 	ld	hl, #_sol_tam+0
   4001 34            [11]  227 	inc	(hl)
                            228 ;src/pathfinding.c:51: camino[sol_tam-1] = y;
   4002 21 6A 6A      [10]  229 	ld	hl,#_sol_tam + 0
   4005 5E            [ 7]  230 	ld	e, (hl)
   4006 1D            [ 4]  231 	dec	e
   4007 6B            [ 4]  232 	ld	l,e
   4008 26 00         [ 7]  233 	ld	h,#0x00
   400A 09            [11]  234 	add	hl,bc
   400B FD 21 03 00   [14]  235 	ld	iy,#3
   400F FD 39         [15]  236 	add	iy,sp
   4011 FD 7E 00      [19]  237 	ld	a,0 (iy)
   4014 77            [ 7]  238 	ld	(hl),a
                            239 ;src/pathfinding.c:52: sol_tam++;
   4015 21 6A 6A      [10]  240 	ld	hl, #_sol_tam+0
   4018 34            [11]  241 	inc	(hl)
                            242 ;src/pathfinding.c:53: anyadido = 1;
   4019 0E 01         [ 7]  243 	ld	c,#0x01
   401B                     244 00102$:
                            245 ;src/pathfinding.c:56: return anyadido;
   401B 69            [ 4]  246 	ld	l,c
   401C C9            [10]  247 	ret
                            248 ;src/pathfinding.c:60: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            249 ;	---------------------------------
                            250 ; Function adjacentTiles
                            251 ; ---------------------------------
   401D                     252 _adjacentTiles::
   401D DD E5         [15]  253 	push	ix
   401F DD 21 00 00   [14]  254 	ld	ix,#0
   4023 DD 39         [15]  255 	add	ix,sp
   4025 21 D1 FF      [10]  256 	ld	hl,#-47
   4028 39            [11]  257 	add	hl,sp
   4029 F9            [ 6]  258 	ld	sp,hl
                            259 ;src/pathfinding.c:61: u8 resultado = 4;
   402A DD 36 DD 04   [19]  260 	ld	-35 (ix),#0x04
                            261 ;src/pathfinding.c:63: i16 dist1 = 0;
   402E DD 36 D9 00   [19]  262 	ld	-39 (ix),#0x00
   4032 DD 36 DA 00   [19]  263 	ld	-38 (ix),#0x00
                            264 ;src/pathfinding.c:64: i16 dist2 = 0;
   4036 DD 36 E0 00   [19]  265 	ld	-32 (ix),#0x00
   403A DD 36 E1 00   [19]  266 	ld	-31 (ix),#0x00
                            267 ;src/pathfinding.c:65: i16 dist3 = 0;
   403E DD 36 DB 00   [19]  268 	ld	-37 (ix),#0x00
   4042 DD 36 DC 00   [19]  269 	ld	-36 (ix),#0x00
                            270 ;src/pathfinding.c:69: i16 heu_derecha = 0;
   4046 DD 36 D5 00   [19]  271 	ld	-43 (ix),#0x00
   404A DD 36 D6 00   [19]  272 	ld	-42 (ix),#0x00
                            273 ;src/pathfinding.c:70: i16 heu_izquierda = 0;
   404E DD 36 D7 00   [19]  274 	ld	-41 (ix),#0x00
   4052 DD 36 D8 00   [19]  275 	ld	-40 (ix),#0x00
                            276 ;src/pathfinding.c:71: i16 heu_arriba = 0;
   4056 DD 36 DE 00   [19]  277 	ld	-34 (ix),#0x00
   405A DD 36 DF 00   [19]  278 	ld	-33 (ix),#0x00
                            279 ;src/pathfinding.c:72: i16 heu_abajo = 0;
   405E DD 36 D3 00   [19]  280 	ld	-45 (ix),#0x00
   4062 DD 36 D4 00   [19]  281 	ld	-44 (ix),#0x00
                            282 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4066 DD 7E 05      [19]  283 	ld	a,5 (ix)
   4069 DD 77 FE      [19]  284 	ld	-2 (ix),a
   406C DD 36 FF 00   [19]  285 	ld	-1 (ix),#0x00
   4070 DD 7E 04      [19]  286 	ld	a,4 (ix)
   4073 DD 77 F0      [19]  287 	ld	-16 (ix),a
   4076 DD 36 F1 00   [19]  288 	ld	-15 (ix),#0x00
   407A DD 7E FE      [19]  289 	ld	a,-2 (ix)
   407D C6 E8         [ 7]  290 	add	a,#0xE8
   407F DD 77 E8      [19]  291 	ld	-24 (ix),a
   4082 DD 7E FF      [19]  292 	ld	a,-1 (ix)
   4085 CE FF         [ 7]  293 	adc	a,#0xFF
   4087 DD 77 E9      [19]  294 	ld	-23 (ix),a
   408A DD 7E F0      [19]  295 	ld	a,-16 (ix)
   408D C6 FF         [ 7]  296 	add	a,#0xFF
   408F DD 77 FA      [19]  297 	ld	-6 (ix),a
   4092 DD 7E F1      [19]  298 	ld	a,-15 (ix)
   4095 CE FF         [ 7]  299 	adc	a,#0xFF
   4097 DD 77 FB      [19]  300 	ld	-5 (ix),a
                            301 ;src/pathfinding.c:81: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   409A DD 7E F0      [19]  302 	ld	a,-16 (ix)
   409D C6 01         [ 7]  303 	add	a, #0x01
   409F DD 77 F6      [19]  304 	ld	-10 (ix),a
   40A2 DD 7E F1      [19]  305 	ld	a,-15 (ix)
   40A5 CE 00         [ 7]  306 	adc	a, #0x00
   40A7 DD 77 F7      [19]  307 	ld	-9 (ix),a
                            308 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   40AA DD 7E FE      [19]  309 	ld	a,-2 (ix)
   40AD C6 E6         [ 7]  310 	add	a,#0xE6
   40AF DD 77 F2      [19]  311 	ld	-14 (ix),a
   40B2 DD 7E FF      [19]  312 	ld	a,-1 (ix)
   40B5 CE FF         [ 7]  313 	adc	a,#0xFF
   40B7 DD 77 F3      [19]  314 	ld	-13 (ix),a
                            315 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   40BA DD 7E FE      [19]  316 	ld	a,-2 (ix)
   40BD C6 EA         [ 7]  317 	add	a, #0xEA
   40BF DD 77 FC      [19]  318 	ld	-4 (ix),a
   40C2 DD 7E FF      [19]  319 	ld	a,-1 (ix)
   40C5 CE FF         [ 7]  320 	adc	a, #0xFF
   40C7 DD 77 FD      [19]  321 	ld	-3 (ix),a
                            322 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   40CA DD 4E E8      [19]  323 	ld	c,-24 (ix)
   40CD DD 46 E9      [19]  324 	ld	b,-23 (ix)
   40D0 69            [ 4]  325 	ld	l, c
   40D1 60            [ 4]  326 	ld	h, b
   40D2 29            [11]  327 	add	hl, hl
   40D3 29            [11]  328 	add	hl, hl
   40D4 09            [11]  329 	add	hl, bc
   40D5 29            [11]  330 	add	hl, hl
   40D6 29            [11]  331 	add	hl, hl
   40D7 29            [11]  332 	add	hl, hl
   40D8 29            [11]  333 	add	hl, hl
   40D9 EB            [ 4]  334 	ex	de,hl
                            335 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   40DA DD 4E F2      [19]  336 	ld	c,-14 (ix)
   40DD DD 46 F3      [19]  337 	ld	b,-13 (ix)
   40E0 69            [ 4]  338 	ld	l, c
   40E1 60            [ 4]  339 	ld	h, b
   40E2 29            [11]  340 	add	hl, hl
   40E3 29            [11]  341 	add	hl, hl
   40E4 09            [11]  342 	add	hl, bc
   40E5 29            [11]  343 	add	hl, hl
   40E6 29            [11]  344 	add	hl, hl
   40E7 29            [11]  345 	add	hl, hl
   40E8 29            [11]  346 	add	hl, hl
   40E9 4D            [ 4]  347 	ld	c,l
   40EA 44            [ 4]  348 	ld	b,h
                            349 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   40EB D5            [11]  350 	push	de
   40EC DD 5E FC      [19]  351 	ld	e,-4 (ix)
   40EF DD 56 FD      [19]  352 	ld	d,-3 (ix)
   40F2 6B            [ 4]  353 	ld	l, e
   40F3 62            [ 4]  354 	ld	h, d
   40F4 29            [11]  355 	add	hl, hl
   40F5 29            [11]  356 	add	hl, hl
   40F6 19            [11]  357 	add	hl, de
   40F7 29            [11]  358 	add	hl, hl
   40F8 29            [11]  359 	add	hl, hl
   40F9 29            [11]  360 	add	hl, hl
   40FA 29            [11]  361 	add	hl, hl
   40FB D1            [10]  362 	pop	de
                            363 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   40FC DD 7E FA      [19]  364 	ld	a,-6 (ix)
   40FF 83            [ 4]  365 	add	a, e
   4100 DD 77 EA      [19]  366 	ld	-22 (ix),a
   4103 DD 7E FB      [19]  367 	ld	a,-5 (ix)
   4106 8A            [ 4]  368 	adc	a, d
   4107 DD 77 EB      [19]  369 	ld	-21 (ix),a
                            370 ;src/pathfinding.c:81: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   410A DD 7E F6      [19]  371 	ld	a,-10 (ix)
   410D 83            [ 4]  372 	add	a, e
   410E DD 77 EC      [19]  373 	ld	-20 (ix),a
   4111 DD 7E F7      [19]  374 	ld	a,-9 (ix)
   4114 8A            [ 4]  375 	adc	a, d
   4115 DD 77 ED      [19]  376 	ld	-19 (ix),a
                            377 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4118 DD 7E F0      [19]  378 	ld	a,-16 (ix)
   411B 81            [ 4]  379 	add	a, c
   411C DD 77 F8      [19]  380 	ld	-8 (ix),a
   411F DD 7E F1      [19]  381 	ld	a,-15 (ix)
   4122 88            [ 4]  382 	adc	a, b
   4123 DD 77 F9      [19]  383 	ld	-7 (ix),a
                            384 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4126 DD 7E F0      [19]  385 	ld	a,-16 (ix)
   4129 85            [ 4]  386 	add	a, l
   412A DD 77 E6      [19]  387 	ld	-26 (ix),a
   412D DD 7E F1      [19]  388 	ld	a,-15 (ix)
   4130 8C            [ 4]  389 	adc	a, h
   4131 DD 77 E7      [19]  390 	ld	-25 (ix),a
                            391 ;src/pathfinding.c:76: if(x == f_x){
   4134 DD 7E 04      [19]  392 	ld	a,4 (ix)
   4137 DD 96 08      [19]  393 	sub	a, 8 (ix)
   413A 20 5C         [12]  394 	jr	NZ,00130$
                            395 ;src/pathfinding.c:78: if(s_x < x){
   413C DD 7E 06      [19]  396 	ld	a,6 (ix)
   413F DD 96 04      [19]  397 	sub	a, 4 (ix)
   4142 30 19         [12]  398 	jr	NC,00102$
                            399 ;src/pathfinding.c:79: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4144 21 01 00      [10]  400 	ld	hl,#0x0001
   4147 E5            [11]  401 	push	hl
   4148 DD 6E EA      [19]  402 	ld	l,-22 (ix)
   414B DD 66 EB      [19]  403 	ld	h,-21 (ix)
   414E E5            [11]  404 	push	hl
   414F 21 6B 6A      [10]  405 	ld	hl,#_sol_matriz
   4152 E5            [11]  406 	push	hl
   4153 CD 65 3F      [17]  407 	call	_setBit
   4156 21 06 00      [10]  408 	ld	hl,#6
   4159 39            [11]  409 	add	hl,sp
   415A F9            [ 6]  410 	ld	sp,hl
   415B 18 17         [12]  411 	jr	00103$
   415D                     412 00102$:
                            413 ;src/pathfinding.c:81: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   415D 21 01 00      [10]  414 	ld	hl,#0x0001
   4160 E5            [11]  415 	push	hl
   4161 DD 6E EC      [19]  416 	ld	l,-20 (ix)
   4164 DD 66 ED      [19]  417 	ld	h,-19 (ix)
   4167 E5            [11]  418 	push	hl
   4168 21 6B 6A      [10]  419 	ld	hl,#_sol_matriz
   416B E5            [11]  420 	push	hl
   416C CD 65 3F      [17]  421 	call	_setBit
   416F 21 06 00      [10]  422 	ld	hl,#6
   4172 39            [11]  423 	add	hl,sp
   4173 F9            [ 6]  424 	ld	sp,hl
   4174                     425 00103$:
                            426 ;src/pathfinding.c:85: if(y < f_y)
   4174 DD 7E 05      [19]  427 	ld	a,5 (ix)
   4177 DD 96 09      [19]  428 	sub	a, 9 (ix)
   417A 30 08         [12]  429 	jr	NC,00105$
                            430 ;src/pathfinding.c:86: heu_abajo = -1;
   417C DD 36 D3 FF   [19]  431 	ld	-45 (ix),#0xFF
   4180 DD 36 D4 FF   [19]  432 	ld	-44 (ix),#0xFF
   4184                     433 00105$:
                            434 ;src/pathfinding.c:88: if(y > f_y)
   4184 DD 7E 09      [19]  435 	ld	a,9 (ix)
   4187 DD 96 05      [19]  436 	sub	a, 5 (ix)
   418A D2 52 42      [10]  437 	jp	NC,00131$
                            438 ;src/pathfinding.c:89: heu_arriba = -1;
   418D DD 36 DE FF   [19]  439 	ld	-34 (ix),#0xFF
   4191 DD 36 DF FF   [19]  440 	ld	-33 (ix),#0xFF
   4195 C3 52 42      [10]  441 	jp	00131$
   4198                     442 00130$:
                            443 ;src/pathfinding.c:91: }else if(y == f_y){
   4198 DD 7E 05      [19]  444 	ld	a,5 (ix)
   419B DD 96 09      [19]  445 	sub	a, 9 (ix)
   419E 20 5A         [12]  446 	jr	NZ,00127$
                            447 ;src/pathfinding.c:93: if(s_y < y){
   41A0 DD 7E 07      [19]  448 	ld	a,7 (ix)
   41A3 DD 96 05      [19]  449 	sub	a, 5 (ix)
   41A6 30 19         [12]  450 	jr	NC,00109$
                            451 ;src/pathfinding.c:94: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   41A8 21 01 00      [10]  452 	ld	hl,#0x0001
   41AB E5            [11]  453 	push	hl
   41AC DD 6E F8      [19]  454 	ld	l,-8 (ix)
   41AF DD 66 F9      [19]  455 	ld	h,-7 (ix)
   41B2 E5            [11]  456 	push	hl
   41B3 21 6B 6A      [10]  457 	ld	hl,#_sol_matriz
   41B6 E5            [11]  458 	push	hl
   41B7 CD 65 3F      [17]  459 	call	_setBit
   41BA 21 06 00      [10]  460 	ld	hl,#6
   41BD 39            [11]  461 	add	hl,sp
   41BE F9            [ 6]  462 	ld	sp,hl
   41BF 18 17         [12]  463 	jr	00110$
   41C1                     464 00109$:
                            465 ;src/pathfinding.c:97: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   41C1 21 01 00      [10]  466 	ld	hl,#0x0001
   41C4 E5            [11]  467 	push	hl
   41C5 DD 6E E6      [19]  468 	ld	l,-26 (ix)
   41C8 DD 66 E7      [19]  469 	ld	h,-25 (ix)
   41CB E5            [11]  470 	push	hl
   41CC 21 6B 6A      [10]  471 	ld	hl,#_sol_matriz
   41CF E5            [11]  472 	push	hl
   41D0 CD 65 3F      [17]  473 	call	_setBit
   41D3 21 06 00      [10]  474 	ld	hl,#6
   41D6 39            [11]  475 	add	hl,sp
   41D7 F9            [ 6]  476 	ld	sp,hl
   41D8                     477 00110$:
                            478 ;src/pathfinding.c:100: if(x < f_x)
   41D8 DD 7E 04      [19]  479 	ld	a,4 (ix)
   41DB DD 96 08      [19]  480 	sub	a, 8 (ix)
   41DE 30 08         [12]  481 	jr	NC,00112$
                            482 ;src/pathfinding.c:101: heu_derecha = -1;
   41E0 DD 36 D5 FF   [19]  483 	ld	-43 (ix),#0xFF
   41E4 DD 36 D6 FF   [19]  484 	ld	-42 (ix),#0xFF
   41E8                     485 00112$:
                            486 ;src/pathfinding.c:102: if(x > f_x)
   41E8 DD 7E 08      [19]  487 	ld	a,8 (ix)
   41EB DD 96 04      [19]  488 	sub	a, 4 (ix)
   41EE 30 62         [12]  489 	jr	NC,00131$
                            490 ;src/pathfinding.c:103: heu_izquierda = -1;
   41F0 DD 36 D7 FF   [19]  491 	ld	-41 (ix),#0xFF
   41F4 DD 36 D8 FF   [19]  492 	ld	-40 (ix),#0xFF
   41F8 18 58         [12]  493 	jr	00131$
   41FA                     494 00127$:
                            495 ;src/pathfinding.c:109: if(s_y < f_y)
   41FA DD 7E 07      [19]  496 	ld	a,7 (ix)
   41FD DD 96 09      [19]  497 	sub	a, 9 (ix)
   4200 3E 00         [ 7]  498 	ld	a,#0x00
   4202 17            [ 4]  499 	rla
   4203 4F            [ 4]  500 	ld	c,a
                            501 ;src/pathfinding.c:108: if(s_x < f_x){
   4204 DD 7E 06      [19]  502 	ld	a,6 (ix)
   4207 DD 96 08      [19]  503 	sub	a, 8 (ix)
   420A 30 20         [12]  504 	jr	NC,00124$
                            505 ;src/pathfinding.c:109: if(s_y < f_y)
   420C 79            [ 4]  506 	ld	a,c
   420D B7            [ 4]  507 	or	a, a
   420E 28 0A         [12]  508 	jr	Z,00116$
                            509 ;src/pathfinding.c:110: heu_abajo = -1;
   4210 DD 36 D3 FF   [19]  510 	ld	-45 (ix),#0xFF
   4214 DD 36 D4 FF   [19]  511 	ld	-44 (ix),#0xFF
   4218 18 08         [12]  512 	jr	00117$
   421A                     513 00116$:
                            514 ;src/pathfinding.c:112: heu_arriba = -1;
   421A DD 36 DE FF   [19]  515 	ld	-34 (ix),#0xFF
   421E DD 36 DF FF   [19]  516 	ld	-33 (ix),#0xFF
   4222                     517 00117$:
                            518 ;src/pathfinding.c:114: heu_derecha = -1;
   4222 DD 36 D5 FF   [19]  519 	ld	-43 (ix),#0xFF
   4226 DD 36 D6 FF   [19]  520 	ld	-42 (ix),#0xFF
   422A 18 26         [12]  521 	jr	00131$
   422C                     522 00124$:
                            523 ;src/pathfinding.c:115: }else if(s_x > f_x){
   422C DD 7E 08      [19]  524 	ld	a,8 (ix)
   422F DD 96 06      [19]  525 	sub	a, 6 (ix)
   4232 30 1E         [12]  526 	jr	NC,00131$
                            527 ;src/pathfinding.c:117: if(s_y < f_y)
   4234 79            [ 4]  528 	ld	a,c
   4235 B7            [ 4]  529 	or	a, a
   4236 28 0A         [12]  530 	jr	Z,00119$
                            531 ;src/pathfinding.c:118: heu_abajo = -1;
   4238 DD 36 D3 FF   [19]  532 	ld	-45 (ix),#0xFF
   423C DD 36 D4 FF   [19]  533 	ld	-44 (ix),#0xFF
   4240 18 08         [12]  534 	jr	00120$
   4242                     535 00119$:
                            536 ;src/pathfinding.c:120: heu_arriba = -1;
   4242 DD 36 DE FF   [19]  537 	ld	-34 (ix),#0xFF
   4246 DD 36 DF FF   [19]  538 	ld	-33 (ix),#0xFF
   424A                     539 00120$:
                            540 ;src/pathfinding.c:122: heu_izquierda = -1;
   424A DD 36 D7 FF   [19]  541 	ld	-41 (ix),#0xFF
   424E DD 36 D8 FF   [19]  542 	ld	-40 (ix),#0xFF
   4252                     543 00131$:
                            544 ;src/pathfinding.c:127: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4252 DD 7E F2      [19]  545 	ld	a,-14 (ix)
   4255 DD 77 EE      [19]  546 	ld	-18 (ix),a
   4258 DD 7E F3      [19]  547 	ld	a,-13 (ix)
   425B DD 77 EF      [19]  548 	ld	-17 (ix),a
   425E DD CB F3 7E   [20]  549 	bit	7, -13 (ix)
   4262 28 10         [12]  550 	jr	Z,00176$
   4264 DD 7E FE      [19]  551 	ld	a,-2 (ix)
   4267 C6 E9         [ 7]  552 	add	a, #0xE9
   4269 DD 77 EE      [19]  553 	ld	-18 (ix),a
   426C DD 7E FF      [19]  554 	ld	a,-1 (ix)
   426F CE FF         [ 7]  555 	adc	a, #0xFF
   4271 DD 77 EF      [19]  556 	ld	-17 (ix),a
   4274                     557 00176$:
   4274 DD CB EF 2E   [23]  558 	sra	-17 (ix)
   4278 DD CB EE 1E   [23]  559 	rr	-18 (ix)
   427C DD CB EF 2E   [23]  560 	sra	-17 (ix)
   4280 DD CB EE 1E   [23]  561 	rr	-18 (ix)
   4284 DD 4E EE      [19]  562 	ld	c,-18 (ix)
   4287 DD 46 EF      [19]  563 	ld	b,-17 (ix)
   428A 69            [ 4]  564 	ld	l, c
   428B 60            [ 4]  565 	ld	h, b
   428C 29            [11]  566 	add	hl, hl
   428D 29            [11]  567 	add	hl, hl
   428E 09            [11]  568 	add	hl, bc
   428F 29            [11]  569 	add	hl, hl
   4290 29            [11]  570 	add	hl, hl
   4291 29            [11]  571 	add	hl, hl
   4292 DD 75 EE      [19]  572 	ld	-18 (ix),l
   4295 DD 74 EF      [19]  573 	ld	-17 (ix),h
   4298 DD 7E 0A      [19]  574 	ld	a,10 (ix)
   429B DD 86 EE      [19]  575 	add	a, -18 (ix)
   429E DD 77 EE      [19]  576 	ld	-18 (ix),a
   42A1 DD 7E 0B      [19]  577 	ld	a,11 (ix)
   42A4 DD 8E EF      [19]  578 	adc	a, -17 (ix)
   42A7 DD 77 EF      [19]  579 	ld	-17 (ix),a
   42AA DD 7E 04      [19]  580 	ld	a,4 (ix)
   42AD CB 3F         [ 8]  581 	srl	a
   42AF DD 77 F2      [19]  582 	ld	-14 (ix), a
   42B2 DD 86 EE      [19]  583 	add	a, -18 (ix)
   42B5 DD 77 EE      [19]  584 	ld	-18 (ix),a
   42B8 3E 00         [ 7]  585 	ld	a,#0x00
   42BA DD 8E EF      [19]  586 	adc	a, -17 (ix)
   42BD DD 77 EF      [19]  587 	ld	-17 (ix),a
   42C0 DD 6E EE      [19]  588 	ld	l,-18 (ix)
   42C3 DD 66 EF      [19]  589 	ld	h,-17 (ix)
   42C6 7E            [ 7]  590 	ld	a,(hl)
   42C7 DD 77 EE      [19]  591 	ld	-18 (ix),a
                            592 ;src/pathfinding.c:128: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   42CA DD 7E 08      [19]  593 	ld	a,8 (ix)
   42CD DD 77 E2      [19]  594 	ld	-30 (ix),a
   42D0 DD 36 E3 00   [19]  595 	ld	-29 (ix),#0x00
   42D4 DD 7E 09      [19]  596 	ld	a,9 (ix)
   42D7 DD 77 E4      [19]  597 	ld	-28 (ix),a
   42DA DD 36 E5 00   [19]  598 	ld	-27 (ix),#0x00
   42DE DD 7E E2      [19]  599 	ld	a,-30 (ix)
   42E1 DD 96 F0      [19]  600 	sub	a, -16 (ix)
   42E4 DD 77 F4      [19]  601 	ld	-12 (ix),a
   42E7 DD 7E E3      [19]  602 	ld	a,-29 (ix)
   42EA DD 9E F1      [19]  603 	sbc	a, -15 (ix)
   42ED DD 77 F5      [19]  604 	ld	-11 (ix),a
                            605 ;src/pathfinding.c:127: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   42F0 3E 02         [ 7]  606 	ld	a,#0x02
   42F2 DD 96 EE      [19]  607 	sub	a, -18 (ix)
   42F5 DA 83 43      [10]  608 	jp	C,00133$
   42F8 DD 6E F8      [19]  609 	ld	l,-8 (ix)
   42FB DD 66 F9      [19]  610 	ld	h,-7 (ix)
   42FE E5            [11]  611 	push	hl
   42FF 21 6B 6A      [10]  612 	ld	hl,#_sol_matriz
   4302 E5            [11]  613 	push	hl
   4303 CD 0A 3F      [17]  614 	call	_getBit
   4306 F1            [10]  615 	pop	af
   4307 F1            [10]  616 	pop	af
   4308 2D            [ 4]  617 	dec	l
   4309 28 78         [12]  618 	jr	Z,00133$
                            619 ;src/pathfinding.c:128: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   430B DD 6E F4      [19]  620 	ld	l,-12 (ix)
   430E DD 66 F5      [19]  621 	ld	h,-11 (ix)
   4311 E5            [11]  622 	push	hl
   4312 CD 17 50      [17]  623 	call	_abs
   4315 F1            [10]  624 	pop	af
   4316 DD 74 EF      [19]  625 	ld	-17 (ix),h
   4319 DD 75 EE      [19]  626 	ld	-18 (ix),l
   431C DD 7E FE      [19]  627 	ld	a,-2 (ix)
   431F C6 FE         [ 7]  628 	add	a,#0xFE
   4321 DD 77 F8      [19]  629 	ld	-8 (ix),a
   4324 DD 7E FF      [19]  630 	ld	a,-1 (ix)
   4327 CE FF         [ 7]  631 	adc	a,#0xFF
   4329 DD 77 F9      [19]  632 	ld	-7 (ix),a
   432C DD 7E E4      [19]  633 	ld	a,-28 (ix)
   432F DD 96 F8      [19]  634 	sub	a, -8 (ix)
   4332 DD 77 F8      [19]  635 	ld	-8 (ix),a
   4335 DD 7E E5      [19]  636 	ld	a,-27 (ix)
   4338 DD 9E F9      [19]  637 	sbc	a, -7 (ix)
   433B DD 77 F9      [19]  638 	ld	-7 (ix),a
   433E DD 6E F8      [19]  639 	ld	l,-8 (ix)
   4341 DD 66 F9      [19]  640 	ld	h,-7 (ix)
   4344 E5            [11]  641 	push	hl
   4345 CD 17 50      [17]  642 	call	_abs
   4348 F1            [10]  643 	pop	af
   4349 DD 74 F9      [19]  644 	ld	-7 (ix),h
   434C DD 75 F8      [19]  645 	ld	-8 (ix),l
   434F DD 7E EE      [19]  646 	ld	a,-18 (ix)
   4352 DD 86 F8      [19]  647 	add	a, -8 (ix)
   4355 DD 77 EE      [19]  648 	ld	-18 (ix),a
   4358 DD 7E EF      [19]  649 	ld	a,-17 (ix)
   435B DD 8E F9      [19]  650 	adc	a, -7 (ix)
   435E DD 77 EF      [19]  651 	ld	-17 (ix),a
   4361 DD 7E EE      [19]  652 	ld	a,-18 (ix)
   4364 DD 86 DE      [19]  653 	add	a, -34 (ix)
   4367 DD 77 EE      [19]  654 	ld	-18 (ix),a
   436A DD 7E EF      [19]  655 	ld	a,-17 (ix)
   436D DD 8E DF      [19]  656 	adc	a, -33 (ix)
   4370 DD 77 EF      [19]  657 	ld	-17 (ix),a
   4373 DD 7E EE      [19]  658 	ld	a,-18 (ix)
   4376 DD 77 D9      [19]  659 	ld	-39 (ix),a
   4379 DD 7E EF      [19]  660 	ld	a,-17 (ix)
   437C DD 77 DA      [19]  661 	ld	-38 (ix),a
                            662 ;src/pathfinding.c:129: resultado = 0;
   437F DD 36 DD 00   [19]  663 	ld	-35 (ix),#0x00
   4383                     664 00133$:
                            665 ;src/pathfinding.c:132: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4383 DD 7E FC      [19]  666 	ld	a,-4 (ix)
   4386 DD 77 EE      [19]  667 	ld	-18 (ix),a
   4389 DD 7E FD      [19]  668 	ld	a,-3 (ix)
   438C DD 77 EF      [19]  669 	ld	-17 (ix),a
   438F DD CB FD 7E   [20]  670 	bit	7, -3 (ix)
   4393 28 10         [12]  671 	jr	Z,00177$
   4395 DD 7E FE      [19]  672 	ld	a,-2 (ix)
   4398 C6 ED         [ 7]  673 	add	a, #0xED
   439A DD 77 EE      [19]  674 	ld	-18 (ix),a
   439D DD 7E FF      [19]  675 	ld	a,-1 (ix)
   43A0 CE FF         [ 7]  676 	adc	a, #0xFF
   43A2 DD 77 EF      [19]  677 	ld	-17 (ix),a
   43A5                     678 00177$:
   43A5 DD CB EF 2E   [23]  679 	sra	-17 (ix)
   43A9 DD CB EE 1E   [23]  680 	rr	-18 (ix)
   43AD DD CB EF 2E   [23]  681 	sra	-17 (ix)
   43B1 DD CB EE 1E   [23]  682 	rr	-18 (ix)
   43B5 DD 4E EE      [19]  683 	ld	c,-18 (ix)
   43B8 DD 46 EF      [19]  684 	ld	b,-17 (ix)
   43BB 69            [ 4]  685 	ld	l, c
   43BC 60            [ 4]  686 	ld	h, b
   43BD 29            [11]  687 	add	hl, hl
   43BE 29            [11]  688 	add	hl, hl
   43BF 09            [11]  689 	add	hl, bc
   43C0 29            [11]  690 	add	hl, hl
   43C1 29            [11]  691 	add	hl, hl
   43C2 29            [11]  692 	add	hl, hl
   43C3 DD 75 EE      [19]  693 	ld	-18 (ix),l
   43C6 DD 74 EF      [19]  694 	ld	-17 (ix),h
   43C9 DD 7E 0A      [19]  695 	ld	a,10 (ix)
   43CC DD 86 EE      [19]  696 	add	a, -18 (ix)
   43CF DD 77 EE      [19]  697 	ld	-18 (ix),a
   43D2 DD 7E 0B      [19]  698 	ld	a,11 (ix)
   43D5 DD 8E EF      [19]  699 	adc	a, -17 (ix)
   43D8 DD 77 EF      [19]  700 	ld	-17 (ix),a
   43DB DD 7E EE      [19]  701 	ld	a,-18 (ix)
   43DE DD 86 F2      [19]  702 	add	a, -14 (ix)
   43E1 DD 77 EE      [19]  703 	ld	-18 (ix),a
   43E4 DD 7E EF      [19]  704 	ld	a,-17 (ix)
   43E7 CE 00         [ 7]  705 	adc	a, #0x00
   43E9 DD 77 EF      [19]  706 	ld	-17 (ix),a
   43EC DD 6E EE      [19]  707 	ld	l,-18 (ix)
   43EF DD 66 EF      [19]  708 	ld	h,-17 (ix)
   43F2 7E            [ 7]  709 	ld	a,(hl)
   43F3 DD 77 EE      [19]  710 	ld	-18 (ix),a
   43F6 3E 02         [ 7]  711 	ld	a,#0x02
   43F8 DD 96 EE      [19]  712 	sub	a, -18 (ix)
   43FB DA AA 44      [10]  713 	jp	C,00141$
   43FE DD 6E E6      [19]  714 	ld	l,-26 (ix)
   4401 DD 66 E7      [19]  715 	ld	h,-25 (ix)
   4404 E5            [11]  716 	push	hl
   4405 21 6B 6A      [10]  717 	ld	hl,#_sol_matriz
   4408 E5            [11]  718 	push	hl
   4409 CD 0A 3F      [17]  719 	call	_getBit
   440C F1            [10]  720 	pop	af
   440D F1            [10]  721 	pop	af
   440E 2D            [ 4]  722 	dec	l
   440F CA AA 44      [10]  723 	jp	Z,00141$
                            724 ;src/pathfinding.c:133: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   4412 DD 6E F4      [19]  725 	ld	l,-12 (ix)
   4415 DD 66 F5      [19]  726 	ld	h,-11 (ix)
   4418 E5            [11]  727 	push	hl
   4419 CD 17 50      [17]  728 	call	_abs
   441C F1            [10]  729 	pop	af
   441D DD 74 F5      [19]  730 	ld	-11 (ix),h
   4420 DD 75 F4      [19]  731 	ld	-12 (ix),l
   4423 DD 7E FE      [19]  732 	ld	a,-2 (ix)
   4426 C6 02         [ 7]  733 	add	a, #0x02
   4428 DD 77 EE      [19]  734 	ld	-18 (ix),a
   442B DD 7E FF      [19]  735 	ld	a,-1 (ix)
   442E CE 00         [ 7]  736 	adc	a, #0x00
   4430 DD 77 EF      [19]  737 	ld	-17 (ix),a
   4433 DD 7E E4      [19]  738 	ld	a,-28 (ix)
   4436 DD 96 EE      [19]  739 	sub	a, -18 (ix)
   4439 DD 77 EE      [19]  740 	ld	-18 (ix),a
   443C DD 7E E5      [19]  741 	ld	a,-27 (ix)
   443F DD 9E EF      [19]  742 	sbc	a, -17 (ix)
   4442 DD 77 EF      [19]  743 	ld	-17 (ix),a
   4445 DD 6E EE      [19]  744 	ld	l,-18 (ix)
   4448 DD 66 EF      [19]  745 	ld	h,-17 (ix)
   444B E5            [11]  746 	push	hl
   444C CD 17 50      [17]  747 	call	_abs
   444F F1            [10]  748 	pop	af
   4450 DD 74 EF      [19]  749 	ld	-17 (ix),h
   4453 DD 75 EE      [19]  750 	ld	-18 (ix),l
   4456 DD 7E F4      [19]  751 	ld	a,-12 (ix)
   4459 DD 86 EE      [19]  752 	add	a, -18 (ix)
   445C DD 77 F4      [19]  753 	ld	-12 (ix),a
   445F DD 7E F5      [19]  754 	ld	a,-11 (ix)
   4462 DD 8E EF      [19]  755 	adc	a, -17 (ix)
   4465 DD 77 F5      [19]  756 	ld	-11 (ix),a
   4468 DD 7E D3      [19]  757 	ld	a,-45 (ix)
   446B DD 86 F4      [19]  758 	add	a, -12 (ix)
   446E DD 77 F4      [19]  759 	ld	-12 (ix),a
   4471 DD 7E D4      [19]  760 	ld	a,-44 (ix)
   4474 DD 8E F5      [19]  761 	adc	a, -11 (ix)
   4477 DD 77 F5      [19]  762 	ld	-11 (ix),a
   447A DD 7E F4      [19]  763 	ld	a,-12 (ix)
   447D DD 77 E0      [19]  764 	ld	-32 (ix),a
   4480 DD 7E F5      [19]  765 	ld	a,-11 (ix)
   4483 DD 77 E1      [19]  766 	ld	-31 (ix),a
                            767 ;src/pathfinding.c:134: if(resultado == 0){
   4486 DD 7E DD      [19]  768 	ld	a,-35 (ix)
   4489 B7            [ 4]  769 	or	a, a
   448A 20 1A         [12]  770 	jr	NZ,00138$
                            771 ;src/pathfinding.c:135: if(dist1 > dist2)
   448C DD 7E E0      [19]  772 	ld	a,-32 (ix)
   448F DD 96 D9      [19]  773 	sub	a, -39 (ix)
   4492 DD 7E E1      [19]  774 	ld	a,-31 (ix)
   4495 DD 9E DA      [19]  775 	sbc	a, -38 (ix)
   4498 E2 9D 44      [10]  776 	jp	PO, 00340$
   449B EE 80         [ 7]  777 	xor	a, #0x80
   449D                     778 00340$:
   449D F2 AA 44      [10]  779 	jp	P,00141$
                            780 ;src/pathfinding.c:136: resultado = 1;	
   44A0 DD 36 DD 01   [19]  781 	ld	-35 (ix),#0x01
   44A4 18 04         [12]  782 	jr	00141$
   44A6                     783 00138$:
                            784 ;src/pathfinding.c:138: resultado = 1;
   44A6 DD 36 DD 01   [19]  785 	ld	-35 (ix),#0x01
   44AA                     786 00141$:
                            787 ;src/pathfinding.c:142: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   44AA DD 7E E8      [19]  788 	ld	a,-24 (ix)
   44AD DD 77 F4      [19]  789 	ld	-12 (ix),a
   44B0 DD 7E E9      [19]  790 	ld	a,-23 (ix)
   44B3 DD 77 F5      [19]  791 	ld	-11 (ix),a
   44B6 DD 7E E9      [19]  792 	ld	a,-23 (ix)
   44B9 07            [ 4]  793 	rlca
   44BA E6 01         [ 7]  794 	and	a,#0x01
   44BC DD 77 EE      [19]  795 	ld	-18 (ix),a
   44BF DD 7E FE      [19]  796 	ld	a,-2 (ix)
   44C2 C6 EB         [ 7]  797 	add	a, #0xEB
   44C4 DD 77 E6      [19]  798 	ld	-26 (ix),a
   44C7 DD 7E FF      [19]  799 	ld	a,-1 (ix)
   44CA CE FF         [ 7]  800 	adc	a, #0xFF
   44CC DD 77 E7      [19]  801 	ld	-25 (ix),a
   44CF DD 7E EE      [19]  802 	ld	a,-18 (ix)
   44D2 B7            [ 4]  803 	or	a, a
   44D3 28 0C         [12]  804 	jr	Z,00178$
   44D5 DD 7E E6      [19]  805 	ld	a,-26 (ix)
   44D8 DD 77 F4      [19]  806 	ld	-12 (ix),a
   44DB DD 7E E7      [19]  807 	ld	a,-25 (ix)
   44DE DD 77 F5      [19]  808 	ld	-11 (ix),a
   44E1                     809 00178$:
   44E1 DD CB F5 2E   [23]  810 	sra	-11 (ix)
   44E5 DD CB F4 1E   [23]  811 	rr	-12 (ix)
   44E9 DD CB F5 2E   [23]  812 	sra	-11 (ix)
   44ED DD CB F4 1E   [23]  813 	rr	-12 (ix)
   44F1 DD 4E F4      [19]  814 	ld	c,-12 (ix)
   44F4 DD 46 F5      [19]  815 	ld	b,-11 (ix)
   44F7 69            [ 4]  816 	ld	l, c
   44F8 60            [ 4]  817 	ld	h, b
   44F9 29            [11]  818 	add	hl, hl
   44FA 29            [11]  819 	add	hl, hl
   44FB 09            [11]  820 	add	hl, bc
   44FC 29            [11]  821 	add	hl, hl
   44FD 29            [11]  822 	add	hl, hl
   44FE 29            [11]  823 	add	hl, hl
   44FF DD 75 F4      [19]  824 	ld	-12 (ix),l
   4502 DD 74 F5      [19]  825 	ld	-11 (ix),h
   4505 DD 7E 0A      [19]  826 	ld	a,10 (ix)
   4508 DD 86 F4      [19]  827 	add	a, -12 (ix)
   450B DD 77 F4      [19]  828 	ld	-12 (ix),a
   450E DD 7E 0B      [19]  829 	ld	a,11 (ix)
   4511 DD 8E F5      [19]  830 	adc	a, -11 (ix)
   4514 DD 77 F5      [19]  831 	ld	-11 (ix),a
   4517 DD 7E FA      [19]  832 	ld	a,-6 (ix)
   451A DD 77 F8      [19]  833 	ld	-8 (ix),a
   451D DD 7E FB      [19]  834 	ld	a,-5 (ix)
   4520 DD 77 F9      [19]  835 	ld	-7 (ix),a
   4523 DD CB FB 7E   [20]  836 	bit	7, -5 (ix)
   4527 28 0C         [12]  837 	jr	Z,00179$
   4529 DD 7E F0      [19]  838 	ld	a,-16 (ix)
   452C DD 77 F8      [19]  839 	ld	-8 (ix),a
   452F DD 7E F1      [19]  840 	ld	a,-15 (ix)
   4532 DD 77 F9      [19]  841 	ld	-7 (ix),a
   4535                     842 00179$:
   4535 DD CB F9 2E   [23]  843 	sra	-7 (ix)
   4539 DD CB F8 1E   [23]  844 	rr	-8 (ix)
   453D DD 7E F4      [19]  845 	ld	a,-12 (ix)
   4540 DD 86 F8      [19]  846 	add	a, -8 (ix)
   4543 DD 77 F4      [19]  847 	ld	-12 (ix),a
   4546 DD 7E F5      [19]  848 	ld	a,-11 (ix)
   4549 DD 8E F9      [19]  849 	adc	a, -7 (ix)
   454C DD 77 F5      [19]  850 	ld	-11 (ix),a
   454F DD 6E F4      [19]  851 	ld	l,-12 (ix)
   4552 DD 66 F5      [19]  852 	ld	h,-11 (ix)
   4555 7E            [ 7]  853 	ld	a,(hl)
   4556 DD 77 F4      [19]  854 	ld	-12 (ix),a
                            855 ;src/pathfinding.c:143: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   4559 DD 7E E4      [19]  856 	ld	a,-28 (ix)
   455C DD 96 FE      [19]  857 	sub	a, -2 (ix)
   455F DD 77 E4      [19]  858 	ld	-28 (ix),a
   4562 DD 7E E5      [19]  859 	ld	a,-27 (ix)
   4565 DD 9E FF      [19]  860 	sbc	a, -1 (ix)
   4568 DD 77 E5      [19]  861 	ld	-27 (ix),a
                            862 ;src/pathfinding.c:142: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   456B 3E 02         [ 7]  863 	ld	a,#0x02
   456D DD 96 F4      [19]  864 	sub	a, -12 (ix)
   4570 DA 29 46      [10]  865 	jp	C,00154$
   4573 DD 6E EA      [19]  866 	ld	l,-22 (ix)
   4576 DD 66 EB      [19]  867 	ld	h,-21 (ix)
   4579 E5            [11]  868 	push	hl
   457A 21 6B 6A      [10]  869 	ld	hl,#_sol_matriz
   457D E5            [11]  870 	push	hl
   457E CD 0A 3F      [17]  871 	call	_getBit
   4581 F1            [10]  872 	pop	af
   4582 F1            [10]  873 	pop	af
   4583 DD 75 F4      [19]  874 	ld	-12 (ix), l
   4586 7D            [ 4]  875 	ld	a, l
   4587 3D            [ 4]  876 	dec	a
   4588 CA 29 46      [10]  877 	jp	Z,00154$
                            878 ;src/pathfinding.c:143: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   458B DD 7E E2      [19]  879 	ld	a,-30 (ix)
   458E DD 96 FA      [19]  880 	sub	a, -6 (ix)
   4591 4F            [ 4]  881 	ld	c,a
   4592 DD 7E E3      [19]  882 	ld	a,-29 (ix)
   4595 DD 9E FB      [19]  883 	sbc	a, -5 (ix)
   4598 47            [ 4]  884 	ld	b,a
   4599 C5            [11]  885 	push	bc
   459A CD 17 50      [17]  886 	call	_abs
   459D F1            [10]  887 	pop	af
   459E DD 74 F5      [19]  888 	ld	-11 (ix),h
   45A1 DD 75 F4      [19]  889 	ld	-12 (ix),l
   45A4 DD 6E E4      [19]  890 	ld	l,-28 (ix)
   45A7 DD 66 E5      [19]  891 	ld	h,-27 (ix)
   45AA E5            [11]  892 	push	hl
   45AB CD 17 50      [17]  893 	call	_abs
   45AE F1            [10]  894 	pop	af
   45AF DD 74 F9      [19]  895 	ld	-7 (ix),h
   45B2 DD 75 F8      [19]  896 	ld	-8 (ix),l
   45B5 DD 7E F4      [19]  897 	ld	a,-12 (ix)
   45B8 DD 86 F8      [19]  898 	add	a, -8 (ix)
   45BB DD 77 F4      [19]  899 	ld	-12 (ix),a
   45BE DD 7E F5      [19]  900 	ld	a,-11 (ix)
   45C1 DD 8E F9      [19]  901 	adc	a, -7 (ix)
   45C4 DD 77 F5      [19]  902 	ld	-11 (ix),a
   45C7 DD 7E D7      [19]  903 	ld	a,-41 (ix)
   45CA DD 86 F4      [19]  904 	add	a, -12 (ix)
   45CD DD 77 F4      [19]  905 	ld	-12 (ix),a
   45D0 DD 7E D8      [19]  906 	ld	a,-40 (ix)
   45D3 DD 8E F5      [19]  907 	adc	a, -11 (ix)
   45D6 DD 77 F5      [19]  908 	ld	-11 (ix),a
   45D9 DD 7E F4      [19]  909 	ld	a,-12 (ix)
   45DC DD 77 DB      [19]  910 	ld	-37 (ix),a
   45DF DD 7E F5      [19]  911 	ld	a,-11 (ix)
   45E2 DD 77 DC      [19]  912 	ld	-36 (ix),a
                            913 ;src/pathfinding.c:144: if(resultado == 0){
   45E5 DD 7E DD      [19]  914 	ld	a,-35 (ix)
   45E8 B7            [ 4]  915 	or	a, a
   45E9 20 1A         [12]  916 	jr	NZ,00151$
                            917 ;src/pathfinding.c:145: if(dist1 >= dist3)
   45EB DD 7E D9      [19]  918 	ld	a,-39 (ix)
   45EE DD 96 DB      [19]  919 	sub	a, -37 (ix)
   45F1 DD 7E DA      [19]  920 	ld	a,-38 (ix)
   45F4 DD 9E DC      [19]  921 	sbc	a, -36 (ix)
   45F7 E2 FC 45      [10]  922 	jp	PO, 00342$
   45FA EE 80         [ 7]  923 	xor	a, #0x80
   45FC                     924 00342$:
   45FC FA 29 46      [10]  925 	jp	M,00154$
                            926 ;src/pathfinding.c:146: resultado = 2;
   45FF DD 36 DD 02   [19]  927 	ld	-35 (ix),#0x02
   4603 18 24         [12]  928 	jr	00154$
   4605                     929 00151$:
                            930 ;src/pathfinding.c:147: }else if(resultado == 1){
   4605 DD 7E DD      [19]  931 	ld	a,-35 (ix)
   4608 3D            [ 4]  932 	dec	a
   4609 20 1A         [12]  933 	jr	NZ,00148$
                            934 ;src/pathfinding.c:148: if(dist2 >= dist3)
   460B DD 7E E0      [19]  935 	ld	a,-32 (ix)
   460E DD 96 DB      [19]  936 	sub	a, -37 (ix)
   4611 DD 7E E1      [19]  937 	ld	a,-31 (ix)
   4614 DD 9E DC      [19]  938 	sbc	a, -36 (ix)
   4617 E2 1C 46      [10]  939 	jp	PO, 00345$
   461A EE 80         [ 7]  940 	xor	a, #0x80
   461C                     941 00345$:
   461C FA 29 46      [10]  942 	jp	M,00154$
                            943 ;src/pathfinding.c:149: resultado = 2;
   461F DD 36 DD 02   [19]  944 	ld	-35 (ix),#0x02
   4623 18 04         [12]  945 	jr	00154$
   4625                     946 00148$:
                            947 ;src/pathfinding.c:151: resultado = 2;
   4625 DD 36 DD 02   [19]  948 	ld	-35 (ix),#0x02
   4629                     949 00154$:
                            950 ;src/pathfinding.c:155: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
   4629 DD 7E E8      [19]  951 	ld	a,-24 (ix)
   462C DD 77 F4      [19]  952 	ld	-12 (ix),a
   462F DD 7E E9      [19]  953 	ld	a,-23 (ix)
   4632 DD 77 F5      [19]  954 	ld	-11 (ix),a
   4635 DD 7E EE      [19]  955 	ld	a,-18 (ix)
   4638 B7            [ 4]  956 	or	a, a
   4639 28 0C         [12]  957 	jr	Z,00180$
   463B DD 7E E6      [19]  958 	ld	a,-26 (ix)
   463E DD 77 F4      [19]  959 	ld	-12 (ix),a
   4641 DD 7E E7      [19]  960 	ld	a,-25 (ix)
   4644 DD 77 F5      [19]  961 	ld	-11 (ix),a
   4647                     962 00180$:
   4647 DD CB F5 2E   [23]  963 	sra	-11 (ix)
   464B DD CB F4 1E   [23]  964 	rr	-12 (ix)
   464F DD CB F5 2E   [23]  965 	sra	-11 (ix)
   4653 DD CB F4 1E   [23]  966 	rr	-12 (ix)
   4657 DD 4E F4      [19]  967 	ld	c,-12 (ix)
   465A DD 46 F5      [19]  968 	ld	b,-11 (ix)
   465D 69            [ 4]  969 	ld	l, c
   465E 60            [ 4]  970 	ld	h, b
   465F 29            [11]  971 	add	hl, hl
   4660 29            [11]  972 	add	hl, hl
   4661 09            [11]  973 	add	hl, bc
   4662 29            [11]  974 	add	hl, hl
   4663 29            [11]  975 	add	hl, hl
   4664 29            [11]  976 	add	hl, hl
   4665 DD 75 F4      [19]  977 	ld	-12 (ix),l
   4668 DD 74 F5      [19]  978 	ld	-11 (ix),h
   466B DD 7E 0A      [19]  979 	ld	a,10 (ix)
   466E DD 86 F4      [19]  980 	add	a, -12 (ix)
   4671 DD 77 F4      [19]  981 	ld	-12 (ix),a
   4674 DD 7E 0B      [19]  982 	ld	a,11 (ix)
   4677 DD 8E F5      [19]  983 	adc	a, -11 (ix)
   467A DD 77 F5      [19]  984 	ld	-11 (ix),a
   467D DD 7E F6      [19]  985 	ld	a,-10 (ix)
   4680 DD 77 EE      [19]  986 	ld	-18 (ix),a
   4683 DD 7E F7      [19]  987 	ld	a,-9 (ix)
   4686 DD 77 EF      [19]  988 	ld	-17 (ix),a
   4689 DD CB F7 7E   [20]  989 	bit	7, -9 (ix)
   468D 28 10         [12]  990 	jr	Z,00181$
   468F DD 7E F0      [19]  991 	ld	a,-16 (ix)
   4692 C6 02         [ 7]  992 	add	a, #0x02
   4694 DD 77 EE      [19]  993 	ld	-18 (ix),a
   4697 DD 7E F1      [19]  994 	ld	a,-15 (ix)
   469A CE 00         [ 7]  995 	adc	a, #0x00
   469C DD 77 EF      [19]  996 	ld	-17 (ix),a
   469F                     997 00181$:
   469F DD CB EF 2E   [23]  998 	sra	-17 (ix)
   46A3 DD CB EE 1E   [23]  999 	rr	-18 (ix)
   46A7 DD 7E EE      [19] 1000 	ld	a,-18 (ix)
   46AA DD 86 F4      [19] 1001 	add	a, -12 (ix)
   46AD DD 77 F4      [19] 1002 	ld	-12 (ix),a
   46B0 DD 7E EF      [19] 1003 	ld	a,-17 (ix)
   46B3 DD 8E F5      [19] 1004 	adc	a, -11 (ix)
   46B6 DD 77 F5      [19] 1005 	ld	-11 (ix),a
   46B9 DD 6E F4      [19] 1006 	ld	l,-12 (ix)
   46BC DD 66 F5      [19] 1007 	ld	h,-11 (ix)
   46BF 7E            [ 7] 1008 	ld	a,(hl)
   46C0 DD 77 F4      [19] 1009 	ld	-12 (ix),a
   46C3 3E 02         [ 7] 1010 	ld	a,#0x02
   46C5 DD 96 F4      [19] 1011 	sub	a, -12 (ix)
   46C8 DA 92 47      [10] 1012 	jp	C,00172$
   46CB DD 6E EC      [19] 1013 	ld	l,-20 (ix)
   46CE DD 66 ED      [19] 1014 	ld	h,-19 (ix)
   46D1 E5            [11] 1015 	push	hl
   46D2 21 6B 6A      [10] 1016 	ld	hl,#_sol_matriz
   46D5 E5            [11] 1017 	push	hl
   46D6 CD 0A 3F      [17] 1018 	call	_getBit
   46D9 F1            [10] 1019 	pop	af
   46DA F1            [10] 1020 	pop	af
   46DB 2D            [ 4] 1021 	dec	l
   46DC CA 92 47      [10] 1022 	jp	Z,00172$
                           1023 ;src/pathfinding.c:156: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   46DF DD 7E E2      [19] 1024 	ld	a,-30 (ix)
   46E2 DD 96 F6      [19] 1025 	sub	a, -10 (ix)
   46E5 4F            [ 4] 1026 	ld	c,a
   46E6 DD 7E E3      [19] 1027 	ld	a,-29 (ix)
   46E9 DD 9E F7      [19] 1028 	sbc	a, -9 (ix)
   46EC 47            [ 4] 1029 	ld	b,a
   46ED C5            [11] 1030 	push	bc
   46EE CD 17 50      [17] 1031 	call	_abs
   46F1 F1            [10] 1032 	pop	af
   46F2 DD 74 F5      [19] 1033 	ld	-11 (ix),h
   46F5 DD 75 F4      [19] 1034 	ld	-12 (ix),l
   46F8 DD 6E E4      [19] 1035 	ld	l,-28 (ix)
   46FB DD 66 E5      [19] 1036 	ld	h,-27 (ix)
   46FE E5            [11] 1037 	push	hl
   46FF CD 17 50      [17] 1038 	call	_abs
   4702 F1            [10] 1039 	pop	af
   4703 DD 74 E5      [19] 1040 	ld	-27 (ix),h
   4706 DD 75 E4      [19] 1041 	ld	-28 (ix),l
   4709 DD 7E F4      [19] 1042 	ld	a,-12 (ix)
   470C DD 86 E4      [19] 1043 	add	a, -28 (ix)
   470F DD 77 F4      [19] 1044 	ld	-12 (ix),a
   4712 DD 7E F5      [19] 1045 	ld	a,-11 (ix)
   4715 DD 8E E5      [19] 1046 	adc	a, -27 (ix)
   4718 DD 77 F5      [19] 1047 	ld	-11 (ix),a
   471B DD 7E F4      [19] 1048 	ld	a,-12 (ix)
   471E DD 86 D5      [19] 1049 	add	a, -43 (ix)
   4721 DD 77 D1      [19] 1050 	ld	-47 (ix),a
   4724 DD 7E F5      [19] 1051 	ld	a,-11 (ix)
   4727 DD 8E D6      [19] 1052 	adc	a, -42 (ix)
   472A DD 77 D2      [19] 1053 	ld	-46 (ix),a
                           1054 ;src/pathfinding.c:157: if(resultado == 0){
   472D DD 7E DD      [19] 1055 	ld	a,-35 (ix)
   4730 B7            [ 4] 1056 	or	a, a
   4731 20 1A         [12] 1057 	jr	NZ,00169$
                           1058 ;src/pathfinding.c:158: if(dist1 >= dist4)
   4733 DD 7E D9      [19] 1059 	ld	a,-39 (ix)
   4736 DD 96 D1      [19] 1060 	sub	a, -47 (ix)
   4739 DD 7E DA      [19] 1061 	ld	a,-38 (ix)
   473C DD 9E D2      [19] 1062 	sbc	a, -46 (ix)
   473F E2 44 47      [10] 1063 	jp	PO, 00347$
   4742 EE 80         [ 7] 1064 	xor	a, #0x80
   4744                    1065 00347$:
   4744 FA 92 47      [10] 1066 	jp	M,00172$
                           1067 ;src/pathfinding.c:159: resultado = 3;
   4747 DD 36 DD 03   [19] 1068 	ld	-35 (ix),#0x03
   474B 18 45         [12] 1069 	jr	00172$
   474D                    1070 00169$:
                           1071 ;src/pathfinding.c:160: }else if(resultado == 1){
   474D DD 7E DD      [19] 1072 	ld	a,-35 (ix)
   4750 3D            [ 4] 1073 	dec	a
   4751 20 1A         [12] 1074 	jr	NZ,00166$
                           1075 ;src/pathfinding.c:161: if(dist2 >= dist4)
   4753 DD 7E E0      [19] 1076 	ld	a,-32 (ix)
   4756 DD 96 D1      [19] 1077 	sub	a, -47 (ix)
   4759 DD 7E E1      [19] 1078 	ld	a,-31 (ix)
   475C DD 9E D2      [19] 1079 	sbc	a, -46 (ix)
   475F E2 64 47      [10] 1080 	jp	PO, 00350$
   4762 EE 80         [ 7] 1081 	xor	a, #0x80
   4764                    1082 00350$:
   4764 FA 92 47      [10] 1083 	jp	M,00172$
                           1084 ;src/pathfinding.c:162: resultado = 3;
   4767 DD 36 DD 03   [19] 1085 	ld	-35 (ix),#0x03
   476B 18 25         [12] 1086 	jr	00172$
   476D                    1087 00166$:
                           1088 ;src/pathfinding.c:163: }else if (resultado == 2){
   476D DD 7E DD      [19] 1089 	ld	a,-35 (ix)
   4770 D6 02         [ 7] 1090 	sub	a, #0x02
   4772 20 1A         [12] 1091 	jr	NZ,00163$
                           1092 ;src/pathfinding.c:164: if(dist3 >= dist4)
   4774 DD 7E DB      [19] 1093 	ld	a,-37 (ix)
   4777 DD 96 D1      [19] 1094 	sub	a, -47 (ix)
   477A DD 7E DC      [19] 1095 	ld	a,-36 (ix)
   477D DD 9E D2      [19] 1096 	sbc	a, -46 (ix)
   4780 E2 85 47      [10] 1097 	jp	PO, 00353$
   4783 EE 80         [ 7] 1098 	xor	a, #0x80
   4785                    1099 00353$:
   4785 FA 92 47      [10] 1100 	jp	M,00172$
                           1101 ;src/pathfinding.c:165: resultado = 3;
   4788 DD 36 DD 03   [19] 1102 	ld	-35 (ix),#0x03
   478C 18 04         [12] 1103 	jr	00172$
   478E                    1104 00163$:
                           1105 ;src/pathfinding.c:167: resultado = 3;
   478E DD 36 DD 03   [19] 1106 	ld	-35 (ix),#0x03
   4792                    1107 00172$:
                           1108 ;src/pathfinding.c:171: return resultado;
   4792 DD 6E DD      [19] 1109 	ld	l,-35 (ix)
   4795 DD F9         [10] 1110 	ld	sp, ix
   4797 DD E1         [14] 1111 	pop	ix
   4799 C9            [10] 1112 	ret
                           1113 ;src/pathfinding.c:175: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                           1114 ;	---------------------------------
                           1115 ; Function pathFinding
                           1116 ; ---------------------------------
   479A                    1117 _pathFinding::
   479A DD E5         [15] 1118 	push	ix
   479C DD 21 00 00   [14] 1119 	ld	ix,#0
   47A0 DD 39         [15] 1120 	add	ix,sp
   47A2 21 E9 FF      [10] 1121 	ld	hl,#-23
   47A5 39            [11] 1122 	add	hl,sp
   47A6 F9            [ 6] 1123 	ld	sp,hl
                           1124 ;src/pathfinding.c:187: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
   47A7 DD 4E F6      [19] 1125 	ld	c,-10 (ix)
   47AA 06 00         [ 7] 1126 	ld	b,#0x00
   47AC 21 EA FF      [10] 1127 	ld	hl,#0xFFEA
   47AF 09            [11] 1128 	add	hl,bc
   47B0 5D            [ 4] 1129 	ld	e, l
   47B1 54            [ 4] 1130 	ld	d, h
   47B2 29            [11] 1131 	add	hl, hl
   47B3 29            [11] 1132 	add	hl, hl
   47B4 19            [11] 1133 	add	hl, de
   47B5 29            [11] 1134 	add	hl, hl
   47B6 29            [11] 1135 	add	hl, hl
   47B7 29            [11] 1136 	add	hl, hl
   47B8 29            [11] 1137 	add	hl, hl
   47B9 DD 5E F4      [19] 1138 	ld	e,-12 (ix)
   47BC 16 00         [ 7] 1139 	ld	d,#0x00
   47BE 19            [11] 1140 	add	hl,de
   47BF 33            [ 6] 1141 	inc	sp
   47C0 33            [ 6] 1142 	inc	sp
   47C1 E5            [11] 1143 	push	hl
                           1144 ;src/pathfinding.c:188: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
   47C2 79            [ 4] 1145 	ld	a,c
   47C3 C6 E6         [ 7] 1146 	add	a,#0xE6
   47C5 6F            [ 4] 1147 	ld	l,a
   47C6 78            [ 4] 1148 	ld	a,b
   47C7 CE FF         [ 7] 1149 	adc	a,#0xFF
   47C9 67            [ 4] 1150 	ld	h,a
   47CA D5            [11] 1151 	push	de
   47CB 5D            [ 4] 1152 	ld	e, l
   47CC 54            [ 4] 1153 	ld	d, h
   47CD 29            [11] 1154 	add	hl, hl
   47CE 29            [11] 1155 	add	hl, hl
   47CF 19            [11] 1156 	add	hl, de
   47D0 29            [11] 1157 	add	hl, hl
   47D1 29            [11] 1158 	add	hl, hl
   47D2 29            [11] 1159 	add	hl, hl
   47D3 29            [11] 1160 	add	hl, hl
   47D4 D1            [10] 1161 	pop	de
   47D5 19            [11] 1162 	add	hl,de
   47D6 DD 75 EB      [19] 1163 	ld	-21 (ix),l
   47D9 DD 74 EC      [19] 1164 	ld	-20 (ix),h
                           1165 ;src/pathfinding.c:189: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
   47DC 79            [ 4] 1166 	ld	a,c
   47DD C6 E8         [ 7] 1167 	add	a,#0xE8
   47DF 4F            [ 4] 1168 	ld	c,a
   47E0 78            [ 4] 1169 	ld	a,b
   47E1 CE FF         [ 7] 1170 	adc	a,#0xFF
   47E3 47            [ 4] 1171 	ld	b,a
   47E4 69            [ 4] 1172 	ld	l, c
   47E5 60            [ 4] 1173 	ld	h, b
   47E6 29            [11] 1174 	add	hl, hl
   47E7 29            [11] 1175 	add	hl, hl
   47E8 09            [11] 1176 	add	hl, bc
   47E9 29            [11] 1177 	add	hl, hl
   47EA 29            [11] 1178 	add	hl, hl
   47EB 29            [11] 1179 	add	hl, hl
   47EC 29            [11] 1180 	add	hl, hl
   47ED 4D            [ 4] 1181 	ld	c,l
   47EE 44            [ 4] 1182 	ld	b,h
   47EF 6B            [ 4] 1183 	ld	l, e
   47F0 62            [ 4] 1184 	ld	h, d
   47F1 23            [ 6] 1185 	inc	hl
   47F2 09            [11] 1186 	add	hl,bc
   47F3 DD 75 EE      [19] 1187 	ld	-18 (ix),l
   47F6 DD 74 EF      [19] 1188 	ld	-17 (ix),h
                           1189 ;src/pathfinding.c:190: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
   47F9 1B            [ 6] 1190 	dec	de
   47FA 69            [ 4] 1191 	ld	l, c
   47FB 60            [ 4] 1192 	ld	h, b
   47FC 19            [11] 1193 	add	hl,de
   47FD DD 75 F0      [19] 1194 	ld	-16 (ix),l
   4800 DD 74 F1      [19] 1195 	ld	-15 (ix),h
                           1196 ;src/pathfinding.c:192: u8 problem = 0;
   4803 DD 36 F2 00   [19] 1197 	ld	-14 (ix),#0x00
                           1198 ;src/pathfinding.c:194: x = s_x;
   4807 DD 7E 04      [19] 1199 	ld	a,4 (ix)
   480A DD 77 F4      [19] 1200 	ld	-12 (ix),a
                           1201 ;src/pathfinding.c:196: y = s_y;
   480D DD 7E 05      [19] 1202 	ld	a,5 (ix)
   4810 DD 77 F6      [19] 1203 	ld	-10 (ix),a
                           1204 ;src/pathfinding.c:198: k = 0;
   4813 DD 36 FF 00   [19] 1205 	ld	-1 (ix),#0x00
                           1206 ;src/pathfinding.c:199: aux = 1;
   4817 DD 36 ED 01   [19] 1207 	ld	-19 (ix),#0x01
                           1208 ;src/pathfinding.c:202: memset(sol_matriz, 0, (40*2*44*4)/8);
   481B 21 6B 6A      [10] 1209 	ld	hl,#_sol_matriz
   481E 36 00         [10] 1210 	ld	(hl), #0x00
   4820 5D            [ 4] 1211 	ld	e, l
   4821 54            [ 4] 1212 	ld	d, h
   4822 13            [ 6] 1213 	inc	de
   4823 01 DF 06      [10] 1214 	ld	bc, #0x06DF
   4826 ED B0         [21] 1215 	ldir
                           1216 ;src/pathfinding.c:203: enemy->longitud_camino = 0;
   4828 DD 7E 08      [19] 1217 	ld	a,8 (ix)
   482B DD 77 F7      [19] 1218 	ld	-9 (ix),a
   482E DD 7E 09      [19] 1219 	ld	a,9 (ix)
   4831 DD 77 F8      [19] 1220 	ld	-8 (ix),a
   4834 DD 7E F7      [19] 1221 	ld	a,-9 (ix)
   4837 C6 45         [ 7] 1222 	add	a, #0x45
   4839 DD 77 F9      [19] 1223 	ld	-7 (ix),a
   483C DD 7E F8      [19] 1224 	ld	a,-8 (ix)
   483F CE 01         [ 7] 1225 	adc	a, #0x01
   4841 DD 77 FA      [19] 1226 	ld	-6 (ix),a
   4844 DD 6E F9      [19] 1227 	ld	l,-7 (ix)
   4847 DD 66 FA      [19] 1228 	ld	h,-6 (ix)
   484A 36 00         [10] 1229 	ld	(hl),#0x00
                           1230 ;src/pathfinding.c:204: sol_tam = 1;
   484C 21 6A 6A      [10] 1231 	ld	hl,#_sol_tam + 0
   484F 36 01         [10] 1232 	ld	(hl), #0x01
                           1233 ;src/pathfinding.c:205: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
   4851 DD 7E F6      [19] 1234 	ld	a,-10 (ix)
   4854 DD 77 FD      [19] 1235 	ld	-3 (ix),a
   4857 DD 36 FE 00   [19] 1236 	ld	-2 (ix),#0x00
   485B DD 7E FD      [19] 1237 	ld	a,-3 (ix)
   485E C6 E8         [ 7] 1238 	add	a,#0xE8
   4860 DD 77 FD      [19] 1239 	ld	-3 (ix),a
   4863 DD 7E FE      [19] 1240 	ld	a,-2 (ix)
   4866 CE FF         [ 7] 1241 	adc	a,#0xFF
   4868 DD 77 FE      [19] 1242 	ld	-2 (ix),a
   486B DD 4E FD      [19] 1243 	ld	c,-3 (ix)
   486E DD 46 FE      [19] 1244 	ld	b,-2 (ix)
   4871 69            [ 4] 1245 	ld	l, c
   4872 60            [ 4] 1246 	ld	h, b
   4873 29            [11] 1247 	add	hl, hl
   4874 29            [11] 1248 	add	hl, hl
   4875 09            [11] 1249 	add	hl, bc
   4876 29            [11] 1250 	add	hl, hl
   4877 29            [11] 1251 	add	hl, hl
   4878 29            [11] 1252 	add	hl, hl
   4879 29            [11] 1253 	add	hl, hl
   487A DD 75 FD      [19] 1254 	ld	-3 (ix),l
   487D DD 74 FE      [19] 1255 	ld	-2 (ix),h
   4880 DD 7E F4      [19] 1256 	ld	a,-12 (ix)
   4883 DD 77 FB      [19] 1257 	ld	-5 (ix),a
   4886 DD 36 FC 00   [19] 1258 	ld	-4 (ix),#0x00
   488A DD 7E FD      [19] 1259 	ld	a,-3 (ix)
   488D DD 86 FB      [19] 1260 	add	a, -5 (ix)
   4890 DD 77 FB      [19] 1261 	ld	-5 (ix),a
   4893 DD 7E FE      [19] 1262 	ld	a,-2 (ix)
   4896 DD 8E FC      [19] 1263 	adc	a, -4 (ix)
   4899 DD 77 FC      [19] 1264 	ld	-4 (ix),a
   489C 21 01 00      [10] 1265 	ld	hl,#0x0001
   489F E5            [11] 1266 	push	hl
   48A0 DD 6E FB      [19] 1267 	ld	l,-5 (ix)
   48A3 DD 66 FC      [19] 1268 	ld	h,-4 (ix)
   48A6 E5            [11] 1269 	push	hl
   48A7 21 6B 6A      [10] 1270 	ld	hl,#_sol_matriz
   48AA E5            [11] 1271 	push	hl
   48AB CD 65 3F      [17] 1272 	call	_setBit
   48AE 21 06 00      [10] 1273 	ld	hl,#6
   48B1 39            [11] 1274 	add	hl,sp
   48B2 F9            [ 6] 1275 	ld	sp,hl
                           1276 ;src/pathfinding.c:206: inserted = anyadirALista(x, y);
   48B3 DD 66 F6      [19] 1277 	ld	h,-10 (ix)
   48B6 DD 6E F4      [19] 1278 	ld	l,-12 (ix)
   48B9 E5            [11] 1279 	push	hl
   48BA CD DF 3F      [17] 1280 	call	_anyadirALista
   48BD F1            [10] 1281 	pop	af
   48BE DD 75 F3      [19] 1282 	ld	-13 (ix),l
                           1283 ;src/pathfinding.c:210: while (aux){
   48C1                    1284 00116$:
   48C1 DD 7E ED      [19] 1285 	ld	a,-19 (ix)
   48C4 B7            [ 4] 1286 	or	a, a
   48C5 CA 68 4A      [10] 1287 	jp	Z,00118$
                           1288 ;src/pathfinding.c:211: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   48C8 DD 7E 06      [19] 1289 	ld	a,6 (ix)
   48CB DD 96 F4      [19] 1290 	sub	a, -12 (ix)
   48CE 20 08         [12] 1291 	jr	NZ,00114$
   48D0 DD 7E 07      [19] 1292 	ld	a,7 (ix)
   48D3 DD 96 F6      [19] 1293 	sub	a, -10 (ix)
   48D6 28 0C         [12] 1294 	jr	Z,00110$
   48D8                    1295 00114$:
   48D8 3A 6A 6A      [13] 1296 	ld	a,(#_sol_tam + 0)
   48DB B7            [ 4] 1297 	or	a, a
   48DC 28 06         [12] 1298 	jr	Z,00110$
   48DE DD 7E F3      [19] 1299 	ld	a,-13 (ix)
   48E1 B7            [ 4] 1300 	or	a, a
   48E2 20 16         [12] 1301 	jr	NZ,00111$
   48E4                    1302 00110$:
                           1303 ;src/pathfinding.c:213: if(inserted == 0 || sol_tam == 0){
   48E4 DD 7E F3      [19] 1304 	ld	a,-13 (ix)
   48E7 B7            [ 4] 1305 	or	a, a
   48E8 28 06         [12] 1306 	jr	Z,00101$
   48EA 3A 6A 6A      [13] 1307 	ld	a,(#_sol_tam + 0)
   48ED B7            [ 4] 1308 	or	a, a
   48EE 20 04         [12] 1309 	jr	NZ,00102$
   48F0                    1310 00101$:
                           1311 ;src/pathfinding.c:214: problem = 1;
   48F0 DD 36 F2 01   [19] 1312 	ld	-14 (ix),#0x01
   48F4                    1313 00102$:
                           1314 ;src/pathfinding.c:217: aux = 0;
   48F4 DD 36 ED 00   [19] 1315 	ld	-19 (ix),#0x00
   48F8 18 C7         [12] 1316 	jr	00116$
   48FA                    1317 00111$:
                           1318 ;src/pathfinding.c:219: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   48FA DD 6E 0A      [19] 1319 	ld	l,10 (ix)
   48FD DD 66 0B      [19] 1320 	ld	h,11 (ix)
   4900 E5            [11] 1321 	push	hl
   4901 DD 66 07      [19] 1322 	ld	h,7 (ix)
   4904 DD 6E 06      [19] 1323 	ld	l,6 (ix)
   4907 E5            [11] 1324 	push	hl
   4908 DD 66 05      [19] 1325 	ld	h,5 (ix)
   490B DD 6E 04      [19] 1326 	ld	l,4 (ix)
   490E E5            [11] 1327 	push	hl
   490F DD 66 F6      [19] 1328 	ld	h,-10 (ix)
   4912 DD 6E F4      [19] 1329 	ld	l,-12 (ix)
   4915 E5            [11] 1330 	push	hl
   4916 CD 1D 40      [17] 1331 	call	_adjacentTiles
   4919 F1            [10] 1332 	pop	af
   491A F1            [10] 1333 	pop	af
   491B F1            [10] 1334 	pop	af
   491C F1            [10] 1335 	pop	af
   491D 5D            [ 4] 1336 	ld	e,l
                           1337 ;src/pathfinding.c:221: switch(movimiento){
   491E 3E 04         [ 7] 1338 	ld	a,#0x04
   4920 93            [ 4] 1339 	sub	a, e
   4921 38 9E         [12] 1340 	jr	C,00116$
                           1341 ;src/pathfinding.c:227: k = k+2;
   4923 DD 4E FF      [19] 1342 	ld	c,-1 (ix)
   4926 0C            [ 4] 1343 	inc	c
   4927 0C            [ 4] 1344 	inc	c
                           1345 ;src/pathfinding.c:221: switch(movimiento){
   4928 16 00         [ 7] 1346 	ld	d,#0x00
   492A 21 31 49      [10] 1347 	ld	hl,#00169$
   492D 19            [11] 1348 	add	hl,de
   492E 19            [11] 1349 	add	hl,de
   492F 19            [11] 1350 	add	hl,de
   4930 E9            [ 4] 1351 	jp	(hl)
   4931                    1352 00169$:
   4931 C3 40 49      [10] 1353 	jp	00104$
   4934 C3 77 49      [10] 1354 	jp	00105$
   4937 C3 AE 49      [10] 1355 	jp	00106$
   493A C3 E4 49      [10] 1356 	jp	00107$
   493D C3 1A 4A      [10] 1357 	jp	00108$
                           1358 ;src/pathfinding.c:222: case 0:
   4940                    1359 00104$:
                           1360 ;src/pathfinding.c:224: setBit(sol_matriz, up, 1);
   4940 C5            [11] 1361 	push	bc
   4941 21 01 00      [10] 1362 	ld	hl,#0x0001
   4944 E5            [11] 1363 	push	hl
   4945 DD 6E EB      [19] 1364 	ld	l,-21 (ix)
   4948 DD 66 EC      [19] 1365 	ld	h,-20 (ix)
   494B E5            [11] 1366 	push	hl
   494C 21 6B 6A      [10] 1367 	ld	hl,#_sol_matriz
   494F E5            [11] 1368 	push	hl
   4950 CD 65 3F      [17] 1369 	call	_setBit
   4953 21 06 00      [10] 1370 	ld	hl,#6
   4956 39            [11] 1371 	add	hl,sp
   4957 F9            [ 6] 1372 	ld	sp,hl
   4958 C1            [10] 1373 	pop	bc
                           1374 ;src/pathfinding.c:225: inserted = anyadirALista(x, y-2);
   4959 DD 46 F6      [19] 1375 	ld	b,-10 (ix)
   495C 05            [ 4] 1376 	dec	b
   495D 05            [ 4] 1377 	dec	b
   495E C5            [11] 1378 	push	bc
   495F C5            [11] 1379 	push	bc
   4960 33            [ 6] 1380 	inc	sp
   4961 DD 7E F4      [19] 1381 	ld	a,-12 (ix)
   4964 F5            [11] 1382 	push	af
   4965 33            [ 6] 1383 	inc	sp
   4966 CD DF 3F      [17] 1384 	call	_anyadirALista
   4969 F1            [10] 1385 	pop	af
   496A C1            [10] 1386 	pop	bc
   496B DD 75 F3      [19] 1387 	ld	-13 (ix),l
                           1388 ;src/pathfinding.c:226: y = y-1;
   496E DD 35 F6      [23] 1389 	dec	-10 (ix)
                           1390 ;src/pathfinding.c:227: k = k+2;
   4971 DD 71 FF      [19] 1391 	ld	-1 (ix),c
                           1392 ;src/pathfinding.c:228: break;
   4974 C3 C1 48      [10] 1393 	jp	00116$
                           1394 ;src/pathfinding.c:229: case 1:
   4977                    1395 00105$:
                           1396 ;src/pathfinding.c:231: setBit(sol_matriz, down, 1);
   4977 C5            [11] 1397 	push	bc
   4978 21 01 00      [10] 1398 	ld	hl,#0x0001
   497B E5            [11] 1399 	push	hl
   497C DD 6E E9      [19] 1400 	ld	l,-23 (ix)
   497F DD 66 EA      [19] 1401 	ld	h,-22 (ix)
   4982 E5            [11] 1402 	push	hl
   4983 21 6B 6A      [10] 1403 	ld	hl,#_sol_matriz
   4986 E5            [11] 1404 	push	hl
   4987 CD 65 3F      [17] 1405 	call	_setBit
   498A 21 06 00      [10] 1406 	ld	hl,#6
   498D 39            [11] 1407 	add	hl,sp
   498E F9            [ 6] 1408 	ld	sp,hl
   498F C1            [10] 1409 	pop	bc
                           1410 ;src/pathfinding.c:232: inserted = anyadirALista(x, y+2);
   4990 DD 46 F6      [19] 1411 	ld	b,-10 (ix)
   4993 04            [ 4] 1412 	inc	b
   4994 04            [ 4] 1413 	inc	b
   4995 C5            [11] 1414 	push	bc
   4996 C5            [11] 1415 	push	bc
   4997 33            [ 6] 1416 	inc	sp
   4998 DD 7E F4      [19] 1417 	ld	a,-12 (ix)
   499B F5            [11] 1418 	push	af
   499C 33            [ 6] 1419 	inc	sp
   499D CD DF 3F      [17] 1420 	call	_anyadirALista
   49A0 F1            [10] 1421 	pop	af
   49A1 C1            [10] 1422 	pop	bc
   49A2 DD 75 F3      [19] 1423 	ld	-13 (ix),l
                           1424 ;src/pathfinding.c:233: y = y+1;
   49A5 DD 34 F6      [23] 1425 	inc	-10 (ix)
                           1426 ;src/pathfinding.c:234: k = k+2;
   49A8 DD 71 FF      [19] 1427 	ld	-1 (ix),c
                           1428 ;src/pathfinding.c:235: break;
   49AB C3 C1 48      [10] 1429 	jp	00116$
                           1430 ;src/pathfinding.c:236: case 2:
   49AE                    1431 00106$:
                           1432 ;src/pathfinding.c:238: setBit(sol_matriz, left, 1);
   49AE C5            [11] 1433 	push	bc
   49AF 21 01 00      [10] 1434 	ld	hl,#0x0001
   49B2 E5            [11] 1435 	push	hl
   49B3 DD 6E F0      [19] 1436 	ld	l,-16 (ix)
   49B6 DD 66 F1      [19] 1437 	ld	h,-15 (ix)
   49B9 E5            [11] 1438 	push	hl
   49BA 21 6B 6A      [10] 1439 	ld	hl,#_sol_matriz
   49BD E5            [11] 1440 	push	hl
   49BE CD 65 3F      [17] 1441 	call	_setBit
   49C1 21 06 00      [10] 1442 	ld	hl,#6
   49C4 39            [11] 1443 	add	hl,sp
   49C5 F9            [ 6] 1444 	ld	sp,hl
   49C6 C1            [10] 1445 	pop	bc
                           1446 ;src/pathfinding.c:239: inserted = anyadirALista(x-1, y);
   49C7 DD 46 F4      [19] 1447 	ld	b,-12 (ix)
   49CA 05            [ 4] 1448 	dec	b
   49CB C5            [11] 1449 	push	bc
   49CC DD 7E F6      [19] 1450 	ld	a,-10 (ix)
   49CF F5            [11] 1451 	push	af
   49D0 33            [ 6] 1452 	inc	sp
   49D1 C5            [11] 1453 	push	bc
   49D2 33            [ 6] 1454 	inc	sp
   49D3 CD DF 3F      [17] 1455 	call	_anyadirALista
   49D6 F1            [10] 1456 	pop	af
   49D7 C1            [10] 1457 	pop	bc
   49D8 DD 75 F3      [19] 1458 	ld	-13 (ix),l
                           1459 ;src/pathfinding.c:240: x = x-1;
   49DB DD 70 F4      [19] 1460 	ld	-12 (ix),b
                           1461 ;src/pathfinding.c:241: k = k+2;
   49DE DD 71 FF      [19] 1462 	ld	-1 (ix),c
                           1463 ;src/pathfinding.c:242: break;
   49E1 C3 C1 48      [10] 1464 	jp	00116$
                           1465 ;src/pathfinding.c:243: case 3:
   49E4                    1466 00107$:
                           1467 ;src/pathfinding.c:245: setBit(sol_matriz, right, 1);
   49E4 C5            [11] 1468 	push	bc
   49E5 21 01 00      [10] 1469 	ld	hl,#0x0001
   49E8 E5            [11] 1470 	push	hl
   49E9 DD 6E EE      [19] 1471 	ld	l,-18 (ix)
   49EC DD 66 EF      [19] 1472 	ld	h,-17 (ix)
   49EF E5            [11] 1473 	push	hl
   49F0 21 6B 6A      [10] 1474 	ld	hl,#_sol_matriz
   49F3 E5            [11] 1475 	push	hl
   49F4 CD 65 3F      [17] 1476 	call	_setBit
   49F7 21 06 00      [10] 1477 	ld	hl,#6
   49FA 39            [11] 1478 	add	hl,sp
   49FB F9            [ 6] 1479 	ld	sp,hl
   49FC C1            [10] 1480 	pop	bc
                           1481 ;src/pathfinding.c:246: inserted = anyadirALista(x+1, y);
   49FD DD 46 F4      [19] 1482 	ld	b,-12 (ix)
   4A00 04            [ 4] 1483 	inc	b
   4A01 C5            [11] 1484 	push	bc
   4A02 DD 7E F6      [19] 1485 	ld	a,-10 (ix)
   4A05 F5            [11] 1486 	push	af
   4A06 33            [ 6] 1487 	inc	sp
   4A07 C5            [11] 1488 	push	bc
   4A08 33            [ 6] 1489 	inc	sp
   4A09 CD DF 3F      [17] 1490 	call	_anyadirALista
   4A0C F1            [10] 1491 	pop	af
   4A0D C1            [10] 1492 	pop	bc
   4A0E DD 75 F3      [19] 1493 	ld	-13 (ix),l
                           1494 ;src/pathfinding.c:247: x = x+1;
   4A11 DD 70 F4      [19] 1495 	ld	-12 (ix),b
                           1496 ;src/pathfinding.c:248: k = k+2;
   4A14 DD 71 FF      [19] 1497 	ld	-1 (ix),c
                           1498 ;src/pathfinding.c:249: break;
   4A17 C3 C1 48      [10] 1499 	jp	00116$
                           1500 ;src/pathfinding.c:251: case 4:
   4A1A                    1501 00108$:
                           1502 ;src/pathfinding.c:253: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
   4A1A DD 7E F6      [19] 1503 	ld	a, -10 (ix)
   4A1D 06 00         [ 7] 1504 	ld	b, #0x00
   4A1F C6 80         [ 7] 1505 	add	a,#0x80
   4A21 4F            [ 4] 1506 	ld	c,a
   4A22 78            [ 4] 1507 	ld	a,b
   4A23 CE F8         [ 7] 1508 	adc	a,#0xF8
   4A25 47            [ 4] 1509 	ld	b,a
   4A26 DD 6E F4      [19] 1510 	ld	l,-12 (ix)
   4A29 26 00         [ 7] 1511 	ld	h,#0x00
   4A2B 09            [11] 1512 	add	hl,bc
   4A2C 01 01 00      [10] 1513 	ld	bc,#0x0001
   4A2F C5            [11] 1514 	push	bc
   4A30 E5            [11] 1515 	push	hl
   4A31 21 6B 6A      [10] 1516 	ld	hl,#_sol_matriz
   4A34 E5            [11] 1517 	push	hl
   4A35 CD 65 3F      [17] 1518 	call	_setBit
   4A38 21 06 00      [10] 1519 	ld	hl,#6
   4A3B 39            [11] 1520 	add	hl,sp
   4A3C F9            [ 6] 1521 	ld	sp,hl
                           1522 ;src/pathfinding.c:255: sol_tam = sol_tam - 2;
   4A3D 21 6A 6A      [10] 1523 	ld	hl, #_sol_tam+0
   4A40 35            [11] 1524 	dec	(hl)
   4A41 21 6A 6A      [10] 1525 	ld	hl, #_sol_tam+0
   4A44 35            [11] 1526 	dec	(hl)
                           1527 ;src/pathfinding.c:256: k--;
   4A45 DD 4E FF      [19] 1528 	ld	c,-1 (ix)
   4A48 0D            [ 4] 1529 	dec	c
                           1530 ;src/pathfinding.c:257: y = camino[k];
   4A49 21 AB 72      [10] 1531 	ld	hl,#_camino
   4A4C 06 00         [ 7] 1532 	ld	b,#0x00
   4A4E 09            [11] 1533 	add	hl, bc
   4A4F 7E            [ 7] 1534 	ld	a,(hl)
   4A50 DD 77 F6      [19] 1535 	ld	-10 (ix),a
                           1536 ;src/pathfinding.c:258: k--;
   4A53 79            [ 4] 1537 	ld	a,c
   4A54 C6 FF         [ 7] 1538 	add	a,#0xFF
                           1539 ;src/pathfinding.c:259: x = camino[k];
   4A56 DD 77 FF      [19] 1540 	ld	-1 (ix),a
   4A59 C6 AB         [ 7] 1541 	add	a,#<(_camino)
   4A5B 6F            [ 4] 1542 	ld	l,a
   4A5C 3E 72         [ 7] 1543 	ld	a,#>(_camino)
   4A5E CE 00         [ 7] 1544 	adc	a, #0x00
   4A60 67            [ 4] 1545 	ld	h,a
   4A61 7E            [ 7] 1546 	ld	a,(hl)
   4A62 DD 77 F4      [19] 1547 	ld	-12 (ix),a
                           1548 ;src/pathfinding.c:261: }
   4A65 C3 C1 48      [10] 1549 	jp	00116$
   4A68                    1550 00118$:
                           1551 ;src/pathfinding.c:266: if(problem == 0){
   4A68 DD 7E F2      [19] 1552 	ld	a,-14 (ix)
   4A6B B7            [ 4] 1553 	or	a, a
   4A6C 20 72         [12] 1554 	jr	NZ,00127$
                           1555 ;src/pathfinding.c:267: if(sol_tam < CAMINO_TAM){
   4A6E 3A 6A 6A      [13] 1556 	ld	a,(#_sol_tam + 0)
   4A71 D6 64         [ 7] 1557 	sub	a, #0x64
   4A73 30 0C         [12] 1558 	jr	NC,00120$
                           1559 ;src/pathfinding.c:268: enemy->longitud_camino = sol_tam;
   4A75 DD 6E F9      [19] 1560 	ld	l,-7 (ix)
   4A78 DD 66 FA      [19] 1561 	ld	h,-6 (ix)
   4A7B 3A 6A 6A      [13] 1562 	ld	a,(#_sol_tam + 0)
   4A7E 77            [ 7] 1563 	ld	(hl),a
   4A7F 18 08         [12] 1564 	jr	00137$
   4A81                    1565 00120$:
                           1566 ;src/pathfinding.c:270: enemy->longitud_camino = CAMINO_TAM;
   4A81 DD 6E F9      [19] 1567 	ld	l,-7 (ix)
   4A84 DD 66 FA      [19] 1568 	ld	h,-6 (ix)
   4A87 36 64         [10] 1569 	ld	(hl),#0x64
                           1570 ;src/pathfinding.c:273: for(j = 0; j<CAMINO_TAM; j++){
   4A89                    1571 00137$:
   4A89 DD 7E F7      [19] 1572 	ld	a,-9 (ix)
   4A8C C6 19         [ 7] 1573 	add	a, #0x19
   4A8E DD 77 FB      [19] 1574 	ld	-5 (ix),a
   4A91 DD 7E F8      [19] 1575 	ld	a,-8 (ix)
   4A94 CE 00         [ 7] 1576 	adc	a, #0x00
   4A96 DD 77 FC      [19] 1577 	ld	-4 (ix),a
   4A99 DD 36 F5 00   [19] 1578 	ld	-11 (ix),#0x00
   4A9D                    1579 00125$:
                           1580 ;src/pathfinding.c:274: enemy->camino[j] = camino[j];
   4A9D DD 7E F5      [19] 1581 	ld	a,-11 (ix)
   4AA0 DD 77 FD      [19] 1582 	ld	-3 (ix),a
   4AA3 DD 36 FE 00   [19] 1583 	ld	-2 (ix),#0x00
   4AA7 DD 7E FB      [19] 1584 	ld	a,-5 (ix)
   4AAA DD 86 FD      [19] 1585 	add	a, -3 (ix)
   4AAD DD 77 FD      [19] 1586 	ld	-3 (ix),a
   4AB0 DD 7E FC      [19] 1587 	ld	a,-4 (ix)
   4AB3 DD 8E FE      [19] 1588 	adc	a, -2 (ix)
   4AB6 DD 77 FE      [19] 1589 	ld	-2 (ix),a
   4AB9 3E AB         [ 7] 1590 	ld	a,#<(_camino)
   4ABB DD 86 F5      [19] 1591 	add	a, -11 (ix)
   4ABE DD 77 F9      [19] 1592 	ld	-7 (ix),a
   4AC1 3E 72         [ 7] 1593 	ld	a,#>(_camino)
   4AC3 CE 00         [ 7] 1594 	adc	a, #0x00
   4AC5 DD 77 FA      [19] 1595 	ld	-6 (ix),a
   4AC8 DD 6E F9      [19] 1596 	ld	l,-7 (ix)
   4ACB DD 66 FA      [19] 1597 	ld	h,-6 (ix)
   4ACE 4E            [ 7] 1598 	ld	c,(hl)
   4ACF DD 6E FD      [19] 1599 	ld	l,-3 (ix)
   4AD2 DD 66 FE      [19] 1600 	ld	h,-2 (ix)
   4AD5 71            [ 7] 1601 	ld	(hl),c
                           1602 ;src/pathfinding.c:273: for(j = 0; j<CAMINO_TAM; j++){
   4AD6 DD 34 F5      [23] 1603 	inc	-11 (ix)
   4AD9 DD 7E F5      [19] 1604 	ld	a,-11 (ix)
   4ADC D6 64         [ 7] 1605 	sub	a, #0x64
   4ADE 38 BD         [12] 1606 	jr	C,00125$
   4AE0                    1607 00127$:
   4AE0 DD F9         [10] 1608 	ld	sp, ix
   4AE2 DD E1         [14] 1609 	pop	ix
   4AE4 C9            [10] 1610 	ret
                           1611 	.area _CODE
                           1612 	.area _INITIALIZER
                           1613 	.area _CABS (ABS)
