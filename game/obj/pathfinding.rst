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
                             13 	.globl _camino
                             14 	.globl _sol_matriz
                             15 	.globl _sol_tam
                             16 	.globl _bitWeights
                             17 	.globl _abs
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
   69D9                      28 _sol_tam::
   69D9                      29 	.ds 1
   69DA                      30 _sol_matriz::
   69DA                      31 	.ds 2112
   721A                      32 _camino::
   721A                      33 	.ds 70
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
                             58 ;src/pathfinding.c:15: i16 abs (i16 n) {
                             59 ;	---------------------------------
                             60 ; Function abs
                             61 ; ---------------------------------
   4B42                      62 _abs::
   4B42 DD E5         [15]   63 	push	ix
   4B44 DD 21 00 00   [14]   64 	ld	ix,#0
   4B48 DD 39         [15]   65 	add	ix,sp
   4B4A F5            [11]   66 	push	af
   4B4B F5            [11]   67 	push	af
                             68 ;src/pathfinding.c:16: const i16 ret[2] = { n, -n };
   4B4C 21 00 00      [10]   69 	ld	hl,#0x0000
   4B4F 39            [11]   70 	add	hl,sp
   4B50 4D            [ 4]   71 	ld	c,l
   4B51 44            [ 4]   72 	ld	b,h
   4B52 DD 7E 04      [19]   73 	ld	a,4 (ix)
   4B55 77            [ 7]   74 	ld	(hl),a
   4B56 23            [ 6]   75 	inc	hl
   4B57 DD 7E 05      [19]   76 	ld	a,5 (ix)
   4B5A 77            [ 7]   77 	ld	(hl),a
   4B5B 69            [ 4]   78 	ld	l, c
   4B5C 60            [ 4]   79 	ld	h, b
   4B5D 23            [ 6]   80 	inc	hl
   4B5E 23            [ 6]   81 	inc	hl
   4B5F AF            [ 4]   82 	xor	a, a
   4B60 DD 96 04      [19]   83 	sub	a, 4 (ix)
   4B63 5F            [ 4]   84 	ld	e,a
   4B64 3E 00         [ 7]   85 	ld	a, #0x00
   4B66 DD 9E 05      [19]   86 	sbc	a, 5 (ix)
   4B69 57            [ 4]   87 	ld	d,a
   4B6A 73            [ 7]   88 	ld	(hl),e
   4B6B 23            [ 6]   89 	inc	hl
   4B6C 72            [ 7]   90 	ld	(hl),d
                             91 ;src/pathfinding.c:17: return ret[n<0];
   4B6D DD 7E 05      [19]   92 	ld	a,5 (ix)
   4B70 07            [ 4]   93 	rlca
   4B71 E6 01         [ 7]   94 	and	a,#0x01
   4B73 6F            [ 4]   95 	ld	l,a
   4B74 17            [ 4]   96 	rla
   4B75 9F            [ 4]   97 	sbc	a, a
   4B76 67            [ 4]   98 	ld	h,a
   4B77 29            [11]   99 	add	hl, hl
   4B78 09            [11]  100 	add	hl,bc
   4B79 4E            [ 7]  101 	ld	c,(hl)
   4B7A 23            [ 6]  102 	inc	hl
   4B7B 66            [ 7]  103 	ld	h,(hl)
   4B7C 69            [ 4]  104 	ld	l, c
   4B7D DD F9         [10]  105 	ld	sp, ix
   4B7F DD E1         [14]  106 	pop	ix
   4B81 C9            [10]  107 	ret
   4B82                     108 _bitWeights:
   4B82 01 00               109 	.dw #0x0001
   4B84 02 00               110 	.dw #0x0002
   4B86 04 00               111 	.dw #0x0004
   4B88 08 00               112 	.dw #0x0008
   4B8A 10 00               113 	.dw #0x0010
   4B8C 20 00               114 	.dw #0x0020
   4B8E 40 00               115 	.dw #0x0040
   4B90 80 00               116 	.dw #0x0080
                            117 ;src/pathfinding.c:20: u8 getBit(u8 *array, u16 pos)
                            118 ;	---------------------------------
                            119 ; Function getBit
                            120 ; ---------------------------------
   4B92                     121 _getBit::
   4B92 DD E5         [15]  122 	push	ix
   4B94 DD 21 00 00   [14]  123 	ld	ix,#0
   4B98 DD 39         [15]  124 	add	ix,sp
                            125 ;src/pathfinding.c:25: byteV = array[pos/8];
   4B9A DD 4E 06      [19]  126 	ld	c,6 (ix)
   4B9D DD 46 07      [19]  127 	ld	b,7 (ix)
   4BA0 CB 38         [ 8]  128 	srl	b
   4BA2 CB 19         [ 8]  129 	rr	c
   4BA4 CB 38         [ 8]  130 	srl	b
   4BA6 CB 19         [ 8]  131 	rr	c
   4BA8 CB 38         [ 8]  132 	srl	b
   4BAA CB 19         [ 8]  133 	rr	c
   4BAC DD 6E 04      [19]  134 	ld	l,4 (ix)
   4BAF DD 66 05      [19]  135 	ld	h,5 (ix)
   4BB2 09            [11]  136 	add	hl,bc
   4BB3 4E            [ 7]  137 	ld	c,(hl)
   4BB4 06 00         [ 7]  138 	ld	b,#0x00
                            139 ;src/pathfinding.c:26: bitV = bitWeights[pos%8];
   4BB6 DD 7E 06      [19]  140 	ld	a,6 (ix)
   4BB9 E6 07         [ 7]  141 	and	a, #0x07
   4BBB 6F            [ 4]  142 	ld	l,a
   4BBC 26 00         [ 7]  143 	ld	h,#0x00
   4BBE 29            [11]  144 	add	hl, hl
   4BBF 11 82 4B      [10]  145 	ld	de,#_bitWeights
   4BC2 19            [11]  146 	add	hl,de
   4BC3 5E            [ 7]  147 	ld	e,(hl)
   4BC4 23            [ 6]  148 	inc	hl
   4BC5 56            [ 7]  149 	ld	d,(hl)
                            150 ;src/pathfinding.c:27: return (byteV & bitV) == bitV;
   4BC6 79            [ 4]  151 	ld	a,c
   4BC7 A3            [ 4]  152 	and	a, e
   4BC8 4F            [ 4]  153 	ld	c,a
   4BC9 78            [ 4]  154 	ld	a,b
   4BCA A2            [ 4]  155 	and	a, d
   4BCB 47            [ 4]  156 	ld	b,a
   4BCC 7B            [ 4]  157 	ld	a,e
   4BCD 91            [ 4]  158 	sub	a, c
   4BCE 20 08         [12]  159 	jr	NZ,00103$
   4BD0 7A            [ 4]  160 	ld	a,d
   4BD1 90            [ 4]  161 	sub	a, b
   4BD2 20 04         [12]  162 	jr	NZ,00103$
   4BD4 3E 01         [ 7]  163 	ld	a,#0x01
   4BD6 18 01         [12]  164 	jr	00104$
   4BD8                     165 00103$:
   4BD8 AF            [ 4]  166 	xor	a,a
   4BD9                     167 00104$:
   4BD9 6F            [ 4]  168 	ld	l,a
   4BDA DD E1         [14]  169 	pop	ix
   4BDC C9            [10]  170 	ret
                            171 ;src/pathfinding.c:30: void setBit(u8 *array, u16 pos, u16 value)
                            172 ;	---------------------------------
                            173 ; Function setBit
                            174 ; ---------------------------------
   4BDD                     175 _setBit::
   4BDD DD E5         [15]  176 	push	ix
   4BDF DD 21 00 00   [14]  177 	ld	ix,#0
   4BE3 DD 39         [15]  178 	add	ix,sp
                            179 ;src/pathfinding.c:36: bytePos = pos/8;
   4BE5 DD 5E 06      [19]  180 	ld	e,6 (ix)
   4BE8 DD 56 07      [19]  181 	ld	d,7 (ix)
   4BEB CB 3A         [ 8]  182 	srl	d
   4BED CB 1B         [ 8]  183 	rr	e
   4BEF CB 3A         [ 8]  184 	srl	d
   4BF1 CB 1B         [ 8]  185 	rr	e
   4BF3 CB 3A         [ 8]  186 	srl	d
   4BF5 CB 1B         [ 8]  187 	rr	e
                            188 ;src/pathfinding.c:38: bitV = bitWeights[pos%8];
   4BF7 01 82 4B      [10]  189 	ld	bc,#_bitWeights+0
   4BFA DD 7E 06      [19]  190 	ld	a,6 (ix)
   4BFD E6 07         [ 7]  191 	and	a, #0x07
   4BFF 6F            [ 4]  192 	ld	l,a
   4C00 26 00         [ 7]  193 	ld	h,#0x00
   4C02 29            [11]  194 	add	hl, hl
   4C03 09            [11]  195 	add	hl,bc
   4C04 4E            [ 7]  196 	ld	c,(hl)
   4C05 23            [ 6]  197 	inc	hl
   4C06 46            [ 7]  198 	ld	b,(hl)
                            199 ;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4C07 DD 6E 04      [19]  200 	ld	l,4 (ix)
   4C0A DD 66 05      [19]  201 	ld	h,5 (ix)
   4C0D 19            [11]  202 	add	hl,de
                            203 ;src/pathfinding.c:40: if(value == 0)
   4C0E DD 7E 09      [19]  204 	ld	a,9 (ix)
   4C11 DD B6 08      [19]  205 	or	a,8 (ix)
   4C14 20 20         [12]  206 	jr	NZ,00106$
                            207 ;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4C16 E5            [11]  208 	push	hl
   4C17 C5            [11]  209 	push	bc
   4C18 DD 5E 06      [19]  210 	ld	e,6 (ix)
   4C1B DD 56 07      [19]  211 	ld	d,7 (ix)
   4C1E D5            [11]  212 	push	de
   4C1F DD 5E 04      [19]  213 	ld	e,4 (ix)
   4C22 DD 56 05      [19]  214 	ld	d,5 (ix)
   4C25 D5            [11]  215 	push	de
   4C26 CD 92 4B      [17]  216 	call	_getBit
   4C29 F1            [10]  217 	pop	af
   4C2A F1            [10]  218 	pop	af
   4C2B 7D            [ 4]  219 	ld	a,l
   4C2C C1            [10]  220 	pop	bc
   4C2D E1            [10]  221 	pop	hl
   4C2E B7            [ 4]  222 	or	a, a
   4C2F 28 23         [12]  223 	jr	Z,00108$
   4C31 7E            [ 7]  224 	ld	a, (hl)
   4C32 91            [ 4]  225 	sub	a, c
   4C33 77            [ 7]  226 	ld	(hl),a
   4C34 18 1E         [12]  227 	jr	00108$
   4C36                     228 00106$:
                            229 ;src/pathfinding.c:46: if(getBit(array, pos) == 0) array[bytePos] += bitV;
   4C36 E5            [11]  230 	push	hl
   4C37 C5            [11]  231 	push	bc
   4C38 DD 5E 06      [19]  232 	ld	e,6 (ix)
   4C3B DD 56 07      [19]  233 	ld	d,7 (ix)
   4C3E D5            [11]  234 	push	de
   4C3F DD 5E 04      [19]  235 	ld	e,4 (ix)
   4C42 DD 56 05      [19]  236 	ld	d,5 (ix)
   4C45 D5            [11]  237 	push	de
   4C46 CD 92 4B      [17]  238 	call	_getBit
   4C49 F1            [10]  239 	pop	af
   4C4A F1            [10]  240 	pop	af
   4C4B 7D            [ 4]  241 	ld	a,l
   4C4C C1            [10]  242 	pop	bc
   4C4D E1            [10]  243 	pop	hl
   4C4E B7            [ 4]  244 	or	a, a
   4C4F 20 03         [12]  245 	jr	NZ,00108$
   4C51 7E            [ 7]  246 	ld	a, (hl)
   4C52 81            [ 4]  247 	add	a, c
   4C53 77            [ 7]  248 	ld	(hl),a
   4C54                     249 00108$:
   4C54 DD E1         [14]  250 	pop	ix
   4C56 C9            [10]  251 	ret
                            252 ;src/pathfinding.c:51: u8 anyadirALista(u8 x, u8 y){
                            253 ;	---------------------------------
                            254 ; Function anyadirALista
                            255 ; ---------------------------------
   4C57                     256 _anyadirALista::
                            257 ;src/pathfinding.c:52: u8 anyadido = 0;
   4C57 0E 00         [ 7]  258 	ld	c,#0x00
                            259 ;src/pathfinding.c:54: if(sol_tam < 70){
   4C59 3A D9 69      [13]  260 	ld	a,(#_sol_tam + 0)
   4C5C D6 46         [ 7]  261 	sub	a, #0x46
   4C5E 30 33         [12]  262 	jr	NC,00102$
                            263 ;src/pathfinding.c:55: camino[sol_tam-1] = x;
   4C60 01 1A 72      [10]  264 	ld	bc,#_camino+0
   4C63 21 D9 69      [10]  265 	ld	hl,#_sol_tam + 0
   4C66 5E            [ 7]  266 	ld	e, (hl)
   4C67 1D            [ 4]  267 	dec	e
   4C68 6B            [ 4]  268 	ld	l,e
   4C69 26 00         [ 7]  269 	ld	h,#0x00
   4C6B 09            [11]  270 	add	hl,bc
   4C6C FD 21 02 00   [14]  271 	ld	iy,#2
   4C70 FD 39         [15]  272 	add	iy,sp
   4C72 FD 7E 00      [19]  273 	ld	a,0 (iy)
   4C75 77            [ 7]  274 	ld	(hl),a
                            275 ;src/pathfinding.c:56: sol_tam++;
   4C76 21 D9 69      [10]  276 	ld	hl, #_sol_tam+0
   4C79 34            [11]  277 	inc	(hl)
                            278 ;src/pathfinding.c:57: camino[sol_tam-1] = y;
   4C7A 21 D9 69      [10]  279 	ld	hl,#_sol_tam + 0
   4C7D 5E            [ 7]  280 	ld	e, (hl)
   4C7E 1D            [ 4]  281 	dec	e
   4C7F 6B            [ 4]  282 	ld	l,e
   4C80 26 00         [ 7]  283 	ld	h,#0x00
   4C82 09            [11]  284 	add	hl,bc
   4C83 FD 21 03 00   [14]  285 	ld	iy,#3
   4C87 FD 39         [15]  286 	add	iy,sp
   4C89 FD 7E 00      [19]  287 	ld	a,0 (iy)
   4C8C 77            [ 7]  288 	ld	(hl),a
                            289 ;src/pathfinding.c:58: sol_tam++;
   4C8D 21 D9 69      [10]  290 	ld	hl, #_sol_tam+0
   4C90 34            [11]  291 	inc	(hl)
                            292 ;src/pathfinding.c:59: anyadido = 1;
   4C91 0E 01         [ 7]  293 	ld	c,#0x01
   4C93                     294 00102$:
                            295 ;src/pathfinding.c:62: return anyadido;
   4C93 69            [ 4]  296 	ld	l,c
   4C94 C9            [10]  297 	ret
                            298 ;src/pathfinding.c:66: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            299 ;	---------------------------------
                            300 ; Function adjacentTiles
                            301 ; ---------------------------------
   4C95                     302 _adjacentTiles::
   4C95 DD E5         [15]  303 	push	ix
   4C97 DD 21 00 00   [14]  304 	ld	ix,#0
   4C9B DD 39         [15]  305 	add	ix,sp
   4C9D 21 D1 FF      [10]  306 	ld	hl,#-47
   4CA0 39            [11]  307 	add	hl,sp
   4CA1 F9            [ 6]  308 	ld	sp,hl
                            309 ;src/pathfinding.c:67: u8 resultado = 4;
   4CA2 DD 36 D5 04   [19]  310 	ld	-43 (ix),#0x04
                            311 ;src/pathfinding.c:69: i16 dist1 = 0;
   4CA6 DD 36 D8 00   [19]  312 	ld	-40 (ix),#0x00
   4CAA DD 36 D9 00   [19]  313 	ld	-39 (ix),#0x00
                            314 ;src/pathfinding.c:70: i16 dist2 = 0;
   4CAE DD 36 DA 00   [19]  315 	ld	-38 (ix),#0x00
   4CB2 DD 36 DB 00   [19]  316 	ld	-37 (ix),#0x00
                            317 ;src/pathfinding.c:71: i16 dist3 = 0;
   4CB6 DD 36 DE 00   [19]  318 	ld	-34 (ix),#0x00
   4CBA DD 36 DF 00   [19]  319 	ld	-33 (ix),#0x00
                            320 ;src/pathfinding.c:75: i16 heu_derecha = 0;
   4CBE DD 36 D6 00   [19]  321 	ld	-42 (ix),#0x00
   4CC2 DD 36 D7 00   [19]  322 	ld	-41 (ix),#0x00
                            323 ;src/pathfinding.c:76: i16 heu_izquierda = 0;
   4CC6 21 00 00      [10]  324 	ld	hl,#0x0000
   4CC9 E3            [19]  325 	ex	(sp), hl
                            326 ;src/pathfinding.c:77: i16 heu_arriba = 0;
   4CCA DD 36 DC 00   [19]  327 	ld	-36 (ix),#0x00
   4CCE DD 36 DD 00   [19]  328 	ld	-35 (ix),#0x00
                            329 ;src/pathfinding.c:78: i16 heu_abajo = 0;
   4CD2 DD 36 E0 00   [19]  330 	ld	-32 (ix),#0x00
   4CD6 DD 36 E1 00   [19]  331 	ld	-31 (ix),#0x00
                            332 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4CDA DD 7E 05      [19]  333 	ld	a,5 (ix)
   4CDD DD 77 F6      [19]  334 	ld	-10 (ix),a
   4CE0 DD 36 F7 00   [19]  335 	ld	-9 (ix),#0x00
   4CE4 DD 7E 04      [19]  336 	ld	a,4 (ix)
   4CE7 DD 77 E6      [19]  337 	ld	-26 (ix),a
   4CEA DD 36 E7 00   [19]  338 	ld	-25 (ix),#0x00
   4CEE DD 7E F6      [19]  339 	ld	a,-10 (ix)
   4CF1 C6 E8         [ 7]  340 	add	a,#0xE8
   4CF3 DD 77 F2      [19]  341 	ld	-14 (ix),a
   4CF6 DD 7E F7      [19]  342 	ld	a,-9 (ix)
   4CF9 CE FF         [ 7]  343 	adc	a,#0xFF
   4CFB DD 77 F3      [19]  344 	ld	-13 (ix),a
   4CFE DD 7E E6      [19]  345 	ld	a,-26 (ix)
   4D01 C6 FF         [ 7]  346 	add	a,#0xFF
   4D03 DD 77 EE      [19]  347 	ld	-18 (ix),a
   4D06 DD 7E E7      [19]  348 	ld	a,-25 (ix)
   4D09 CE FF         [ 7]  349 	adc	a,#0xFF
   4D0B DD 77 EF      [19]  350 	ld	-17 (ix),a
                            351 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4D0E DD 7E E6      [19]  352 	ld	a,-26 (ix)
   4D11 C6 01         [ 7]  353 	add	a, #0x01
   4D13 DD 77 EA      [19]  354 	ld	-22 (ix),a
   4D16 DD 7E E7      [19]  355 	ld	a,-25 (ix)
   4D19 CE 00         [ 7]  356 	adc	a, #0x00
   4D1B DD 77 EB      [19]  357 	ld	-21 (ix),a
                            358 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4D1E DD 7E F6      [19]  359 	ld	a,-10 (ix)
   4D21 C6 E6         [ 7]  360 	add	a,#0xE6
   4D23 DD 77 FA      [19]  361 	ld	-6 (ix),a
   4D26 DD 7E F7      [19]  362 	ld	a,-9 (ix)
   4D29 CE FF         [ 7]  363 	adc	a,#0xFF
   4D2B DD 77 FB      [19]  364 	ld	-5 (ix),a
                            365 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4D2E DD 7E F6      [19]  366 	ld	a,-10 (ix)
   4D31 C6 EA         [ 7]  367 	add	a, #0xEA
   4D33 DD 77 F0      [19]  368 	ld	-16 (ix),a
   4D36 DD 7E F7      [19]  369 	ld	a,-9 (ix)
   4D39 CE FF         [ 7]  370 	adc	a, #0xFF
   4D3B DD 77 F1      [19]  371 	ld	-15 (ix),a
                            372 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4D3E DD 4E F2      [19]  373 	ld	c,-14 (ix)
   4D41 DD 46 F3      [19]  374 	ld	b,-13 (ix)
   4D44 69            [ 4]  375 	ld	l, c
   4D45 60            [ 4]  376 	ld	h, b
   4D46 29            [11]  377 	add	hl, hl
   4D47 29            [11]  378 	add	hl, hl
   4D48 09            [11]  379 	add	hl, bc
   4D49 29            [11]  380 	add	hl, hl
   4D4A 29            [11]  381 	add	hl, hl
   4D4B 29            [11]  382 	add	hl, hl
   4D4C 29            [11]  383 	add	hl, hl
   4D4D EB            [ 4]  384 	ex	de,hl
                            385 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4D4E DD 4E FA      [19]  386 	ld	c,-6 (ix)
   4D51 DD 46 FB      [19]  387 	ld	b,-5 (ix)
   4D54 69            [ 4]  388 	ld	l, c
   4D55 60            [ 4]  389 	ld	h, b
   4D56 29            [11]  390 	add	hl, hl
   4D57 29            [11]  391 	add	hl, hl
   4D58 09            [11]  392 	add	hl, bc
   4D59 29            [11]  393 	add	hl, hl
   4D5A 29            [11]  394 	add	hl, hl
   4D5B 29            [11]  395 	add	hl, hl
   4D5C 29            [11]  396 	add	hl, hl
   4D5D 4D            [ 4]  397 	ld	c,l
   4D5E 44            [ 4]  398 	ld	b,h
                            399 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4D5F D5            [11]  400 	push	de
   4D60 DD 5E F0      [19]  401 	ld	e,-16 (ix)
   4D63 DD 56 F1      [19]  402 	ld	d,-15 (ix)
   4D66 6B            [ 4]  403 	ld	l, e
   4D67 62            [ 4]  404 	ld	h, d
   4D68 29            [11]  405 	add	hl, hl
   4D69 29            [11]  406 	add	hl, hl
   4D6A 19            [11]  407 	add	hl, de
   4D6B 29            [11]  408 	add	hl, hl
   4D6C 29            [11]  409 	add	hl, hl
   4D6D 29            [11]  410 	add	hl, hl
   4D6E 29            [11]  411 	add	hl, hl
   4D6F D1            [10]  412 	pop	de
                            413 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4D70 DD 7E EE      [19]  414 	ld	a,-18 (ix)
   4D73 83            [ 4]  415 	add	a, e
   4D74 DD 77 F4      [19]  416 	ld	-12 (ix),a
   4D77 DD 7E EF      [19]  417 	ld	a,-17 (ix)
   4D7A 8A            [ 4]  418 	adc	a, d
   4D7B DD 77 F5      [19]  419 	ld	-11 (ix),a
                            420 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4D7E DD 7E EA      [19]  421 	ld	a,-22 (ix)
   4D81 83            [ 4]  422 	add	a, e
   4D82 DD 77 E8      [19]  423 	ld	-24 (ix),a
   4D85 DD 7E EB      [19]  424 	ld	a,-21 (ix)
   4D88 8A            [ 4]  425 	adc	a, d
   4D89 DD 77 E9      [19]  426 	ld	-23 (ix),a
                            427 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4D8C DD 7E E6      [19]  428 	ld	a,-26 (ix)
   4D8F 81            [ 4]  429 	add	a, c
   4D90 DD 77 EC      [19]  430 	ld	-20 (ix),a
   4D93 DD 7E E7      [19]  431 	ld	a,-25 (ix)
   4D96 88            [ 4]  432 	adc	a, b
   4D97 DD 77 ED      [19]  433 	ld	-19 (ix),a
                            434 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4D9A DD 7E E6      [19]  435 	ld	a,-26 (ix)
   4D9D 85            [ 4]  436 	add	a, l
   4D9E DD 77 FC      [19]  437 	ld	-4 (ix),a
   4DA1 DD 7E E7      [19]  438 	ld	a,-25 (ix)
   4DA4 8C            [ 4]  439 	adc	a, h
   4DA5 DD 77 FD      [19]  440 	ld	-3 (ix),a
                            441 ;src/pathfinding.c:82: if(x == f_x){
   4DA8 DD 7E 04      [19]  442 	ld	a,4 (ix)
   4DAB DD 96 08      [19]  443 	sub	a, 8 (ix)
   4DAE 20 5C         [12]  444 	jr	NZ,00130$
                            445 ;src/pathfinding.c:84: if(s_x < x){
   4DB0 DD 7E 06      [19]  446 	ld	a,6 (ix)
   4DB3 DD 96 04      [19]  447 	sub	a, 4 (ix)
   4DB6 30 19         [12]  448 	jr	NC,00102$
                            449 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4DB8 21 01 00      [10]  450 	ld	hl,#0x0001
   4DBB E5            [11]  451 	push	hl
   4DBC DD 6E F4      [19]  452 	ld	l,-12 (ix)
   4DBF DD 66 F5      [19]  453 	ld	h,-11 (ix)
   4DC2 E5            [11]  454 	push	hl
   4DC3 21 DA 69      [10]  455 	ld	hl,#_sol_matriz
   4DC6 E5            [11]  456 	push	hl
   4DC7 CD DD 4B      [17]  457 	call	_setBit
   4DCA 21 06 00      [10]  458 	ld	hl,#6
   4DCD 39            [11]  459 	add	hl,sp
   4DCE F9            [ 6]  460 	ld	sp,hl
   4DCF 18 17         [12]  461 	jr	00103$
   4DD1                     462 00102$:
                            463 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4DD1 21 01 00      [10]  464 	ld	hl,#0x0001
   4DD4 E5            [11]  465 	push	hl
   4DD5 DD 6E E8      [19]  466 	ld	l,-24 (ix)
   4DD8 DD 66 E9      [19]  467 	ld	h,-23 (ix)
   4DDB E5            [11]  468 	push	hl
   4DDC 21 DA 69      [10]  469 	ld	hl,#_sol_matriz
   4DDF E5            [11]  470 	push	hl
   4DE0 CD DD 4B      [17]  471 	call	_setBit
   4DE3 21 06 00      [10]  472 	ld	hl,#6
   4DE6 39            [11]  473 	add	hl,sp
   4DE7 F9            [ 6]  474 	ld	sp,hl
   4DE8                     475 00103$:
                            476 ;src/pathfinding.c:91: if(y < f_y)
   4DE8 DD 7E 05      [19]  477 	ld	a,5 (ix)
   4DEB DD 96 09      [19]  478 	sub	a, 9 (ix)
   4DEE 30 08         [12]  479 	jr	NC,00105$
                            480 ;src/pathfinding.c:92: heu_abajo = -1;
   4DF0 DD 36 E0 FF   [19]  481 	ld	-32 (ix),#0xFF
   4DF4 DD 36 E1 FF   [19]  482 	ld	-31 (ix),#0xFF
   4DF8                     483 00105$:
                            484 ;src/pathfinding.c:94: if(y > f_y)
   4DF8 DD 7E 09      [19]  485 	ld	a,9 (ix)
   4DFB DD 96 05      [19]  486 	sub	a, 5 (ix)
   4DFE D2 BE 4E      [10]  487 	jp	NC,00131$
                            488 ;src/pathfinding.c:95: heu_arriba = -1;
   4E01 DD 36 DC FF   [19]  489 	ld	-36 (ix),#0xFF
   4E05 DD 36 DD FF   [19]  490 	ld	-35 (ix),#0xFF
   4E09 C3 BE 4E      [10]  491 	jp	00131$
   4E0C                     492 00130$:
                            493 ;src/pathfinding.c:97: }else if(y == f_y){
   4E0C DD 7E 05      [19]  494 	ld	a,5 (ix)
   4E0F DD 96 09      [19]  495 	sub	a, 9 (ix)
   4E12 20 56         [12]  496 	jr	NZ,00127$
                            497 ;src/pathfinding.c:99: if(s_y < y){
   4E14 DD 7E 07      [19]  498 	ld	a,7 (ix)
   4E17 DD 96 05      [19]  499 	sub	a, 5 (ix)
   4E1A 30 19         [12]  500 	jr	NC,00109$
                            501 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4E1C 21 01 00      [10]  502 	ld	hl,#0x0001
   4E1F E5            [11]  503 	push	hl
   4E20 DD 6E EC      [19]  504 	ld	l,-20 (ix)
   4E23 DD 66 ED      [19]  505 	ld	h,-19 (ix)
   4E26 E5            [11]  506 	push	hl
   4E27 21 DA 69      [10]  507 	ld	hl,#_sol_matriz
   4E2A E5            [11]  508 	push	hl
   4E2B CD DD 4B      [17]  509 	call	_setBit
   4E2E 21 06 00      [10]  510 	ld	hl,#6
   4E31 39            [11]  511 	add	hl,sp
   4E32 F9            [ 6]  512 	ld	sp,hl
   4E33 18 17         [12]  513 	jr	00110$
   4E35                     514 00109$:
                            515 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4E35 21 01 00      [10]  516 	ld	hl,#0x0001
   4E38 E5            [11]  517 	push	hl
   4E39 DD 6E FC      [19]  518 	ld	l,-4 (ix)
   4E3C DD 66 FD      [19]  519 	ld	h,-3 (ix)
   4E3F E5            [11]  520 	push	hl
   4E40 21 DA 69      [10]  521 	ld	hl,#_sol_matriz
   4E43 E5            [11]  522 	push	hl
   4E44 CD DD 4B      [17]  523 	call	_setBit
   4E47 21 06 00      [10]  524 	ld	hl,#6
   4E4A 39            [11]  525 	add	hl,sp
   4E4B F9            [ 6]  526 	ld	sp,hl
   4E4C                     527 00110$:
                            528 ;src/pathfinding.c:106: if(x < f_x)
   4E4C DD 7E 04      [19]  529 	ld	a,4 (ix)
   4E4F DD 96 08      [19]  530 	sub	a, 8 (ix)
   4E52 30 08         [12]  531 	jr	NC,00112$
                            532 ;src/pathfinding.c:107: heu_derecha = -1;
   4E54 DD 36 D6 FF   [19]  533 	ld	-42 (ix),#0xFF
   4E58 DD 36 D7 FF   [19]  534 	ld	-41 (ix),#0xFF
   4E5C                     535 00112$:
                            536 ;src/pathfinding.c:108: if(x > f_x)
   4E5C DD 7E 08      [19]  537 	ld	a,8 (ix)
   4E5F DD 96 04      [19]  538 	sub	a, 4 (ix)
   4E62 30 5A         [12]  539 	jr	NC,00131$
                            540 ;src/pathfinding.c:109: heu_izquierda = -1;
   4E64 21 FF FF      [10]  541 	ld	hl,#0xFFFF
   4E67 E3            [19]  542 	ex	(sp), hl
   4E68 18 54         [12]  543 	jr	00131$
   4E6A                     544 00127$:
                            545 ;src/pathfinding.c:115: if(s_y < f_y)
   4E6A DD 7E 07      [19]  546 	ld	a,7 (ix)
   4E6D DD 96 09      [19]  547 	sub	a, 9 (ix)
   4E70 3E 00         [ 7]  548 	ld	a,#0x00
   4E72 17            [ 4]  549 	rla
   4E73 4F            [ 4]  550 	ld	c,a
                            551 ;src/pathfinding.c:114: if(s_x < f_x){
   4E74 DD 7E 06      [19]  552 	ld	a,6 (ix)
   4E77 DD 96 08      [19]  553 	sub	a, 8 (ix)
   4E7A 30 20         [12]  554 	jr	NC,00124$
                            555 ;src/pathfinding.c:115: if(s_y < f_y)
   4E7C 79            [ 4]  556 	ld	a,c
   4E7D B7            [ 4]  557 	or	a, a
   4E7E 28 0A         [12]  558 	jr	Z,00116$
                            559 ;src/pathfinding.c:116: heu_abajo = -1;
   4E80 DD 36 E0 FF   [19]  560 	ld	-32 (ix),#0xFF
   4E84 DD 36 E1 FF   [19]  561 	ld	-31 (ix),#0xFF
   4E88 18 08         [12]  562 	jr	00117$
   4E8A                     563 00116$:
                            564 ;src/pathfinding.c:118: heu_arriba = -1;
   4E8A DD 36 DC FF   [19]  565 	ld	-36 (ix),#0xFF
   4E8E DD 36 DD FF   [19]  566 	ld	-35 (ix),#0xFF
   4E92                     567 00117$:
                            568 ;src/pathfinding.c:120: heu_derecha = -1;
   4E92 DD 36 D6 FF   [19]  569 	ld	-42 (ix),#0xFF
   4E96 DD 36 D7 FF   [19]  570 	ld	-41 (ix),#0xFF
   4E9A 18 22         [12]  571 	jr	00131$
   4E9C                     572 00124$:
                            573 ;src/pathfinding.c:121: }else if(s_x > f_x){
   4E9C DD 7E 08      [19]  574 	ld	a,8 (ix)
   4E9F DD 96 06      [19]  575 	sub	a, 6 (ix)
   4EA2 30 1A         [12]  576 	jr	NC,00131$
                            577 ;src/pathfinding.c:123: if(s_y < f_y)
   4EA4 79            [ 4]  578 	ld	a,c
   4EA5 B7            [ 4]  579 	or	a, a
   4EA6 28 0A         [12]  580 	jr	Z,00119$
                            581 ;src/pathfinding.c:124: heu_abajo = -1;
   4EA8 DD 36 E0 FF   [19]  582 	ld	-32 (ix),#0xFF
   4EAC DD 36 E1 FF   [19]  583 	ld	-31 (ix),#0xFF
   4EB0 18 08         [12]  584 	jr	00120$
   4EB2                     585 00119$:
                            586 ;src/pathfinding.c:126: heu_arriba = -1;
   4EB2 DD 36 DC FF   [19]  587 	ld	-36 (ix),#0xFF
   4EB6 DD 36 DD FF   [19]  588 	ld	-35 (ix),#0xFF
   4EBA                     589 00120$:
                            590 ;src/pathfinding.c:128: heu_izquierda = -1;
   4EBA 21 FF FF      [10]  591 	ld	hl,#0xFFFF
   4EBD E3            [19]  592 	ex	(sp), hl
   4EBE                     593 00131$:
                            594 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4EBE DD 7E FA      [19]  595 	ld	a,-6 (ix)
   4EC1 DD 77 F8      [19]  596 	ld	-8 (ix),a
   4EC4 DD 7E FB      [19]  597 	ld	a,-5 (ix)
   4EC7 DD 77 F9      [19]  598 	ld	-7 (ix),a
   4ECA DD CB FB 7E   [20]  599 	bit	7, -5 (ix)
   4ECE 28 10         [12]  600 	jr	Z,00176$
   4ED0 DD 7E F6      [19]  601 	ld	a,-10 (ix)
   4ED3 C6 E9         [ 7]  602 	add	a, #0xE9
   4ED5 DD 77 F8      [19]  603 	ld	-8 (ix),a
   4ED8 DD 7E F7      [19]  604 	ld	a,-9 (ix)
   4EDB CE FF         [ 7]  605 	adc	a, #0xFF
   4EDD DD 77 F9      [19]  606 	ld	-7 (ix),a
   4EE0                     607 00176$:
   4EE0 DD CB F9 2E   [23]  608 	sra	-7 (ix)
   4EE4 DD CB F8 1E   [23]  609 	rr	-8 (ix)
   4EE8 DD CB F9 2E   [23]  610 	sra	-7 (ix)
   4EEC DD CB F8 1E   [23]  611 	rr	-8 (ix)
   4EF0 DD 4E F8      [19]  612 	ld	c,-8 (ix)
   4EF3 DD 46 F9      [19]  613 	ld	b,-7 (ix)
   4EF6 69            [ 4]  614 	ld	l, c
   4EF7 60            [ 4]  615 	ld	h, b
   4EF8 29            [11]  616 	add	hl, hl
   4EF9 29            [11]  617 	add	hl, hl
   4EFA 09            [11]  618 	add	hl, bc
   4EFB 29            [11]  619 	add	hl, hl
   4EFC 29            [11]  620 	add	hl, hl
   4EFD 29            [11]  621 	add	hl, hl
   4EFE DD 75 F8      [19]  622 	ld	-8 (ix),l
   4F01 DD 74 F9      [19]  623 	ld	-7 (ix),h
   4F04 DD 7E 0A      [19]  624 	ld	a,10 (ix)
   4F07 DD 86 F8      [19]  625 	add	a, -8 (ix)
   4F0A DD 77 F8      [19]  626 	ld	-8 (ix),a
   4F0D DD 7E 0B      [19]  627 	ld	a,11 (ix)
   4F10 DD 8E F9      [19]  628 	adc	a, -7 (ix)
   4F13 DD 77 F9      [19]  629 	ld	-7 (ix),a
   4F16 DD 7E 04      [19]  630 	ld	a,4 (ix)
   4F19 CB 3F         [ 8]  631 	srl	a
   4F1B DD 77 FA      [19]  632 	ld	-6 (ix), a
   4F1E DD 86 F8      [19]  633 	add	a, -8 (ix)
   4F21 DD 77 F8      [19]  634 	ld	-8 (ix),a
   4F24 3E 00         [ 7]  635 	ld	a,#0x00
   4F26 DD 8E F9      [19]  636 	adc	a, -7 (ix)
   4F29 DD 77 F9      [19]  637 	ld	-7 (ix),a
   4F2C DD 6E F8      [19]  638 	ld	l,-8 (ix)
   4F2F DD 66 F9      [19]  639 	ld	h,-7 (ix)
   4F32 7E            [ 7]  640 	ld	a,(hl)
   4F33 DD 77 F8      [19]  641 	ld	-8 (ix),a
                            642 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4F36 DD 7E 08      [19]  643 	ld	a,8 (ix)
   4F39 DD 77 E4      [19]  644 	ld	-28 (ix),a
   4F3C DD 36 E5 00   [19]  645 	ld	-27 (ix),#0x00
   4F40 DD 7E 09      [19]  646 	ld	a,9 (ix)
   4F43 DD 77 FE      [19]  647 	ld	-2 (ix),a
   4F46 DD 36 FF 00   [19]  648 	ld	-1 (ix),#0x00
   4F4A DD 7E E4      [19]  649 	ld	a,-28 (ix)
   4F4D DD 96 E6      [19]  650 	sub	a, -26 (ix)
   4F50 DD 77 E2      [19]  651 	ld	-30 (ix),a
   4F53 DD 7E E5      [19]  652 	ld	a,-27 (ix)
   4F56 DD 9E E7      [19]  653 	sbc	a, -25 (ix)
   4F59 DD 77 E3      [19]  654 	ld	-29 (ix),a
                            655 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4F5C 3E 02         [ 7]  656 	ld	a,#0x02
   4F5E DD 96 F8      [19]  657 	sub	a, -8 (ix)
   4F61 DA EF 4F      [10]  658 	jp	C,00133$
   4F64 DD 6E EC      [19]  659 	ld	l,-20 (ix)
   4F67 DD 66 ED      [19]  660 	ld	h,-19 (ix)
   4F6A E5            [11]  661 	push	hl
   4F6B 21 DA 69      [10]  662 	ld	hl,#_sol_matriz
   4F6E E5            [11]  663 	push	hl
   4F6F CD 92 4B      [17]  664 	call	_getBit
   4F72 F1            [10]  665 	pop	af
   4F73 F1            [10]  666 	pop	af
   4F74 2D            [ 4]  667 	dec	l
   4F75 28 78         [12]  668 	jr	Z,00133$
                            669 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4F77 DD 6E E2      [19]  670 	ld	l,-30 (ix)
   4F7A DD 66 E3      [19]  671 	ld	h,-29 (ix)
   4F7D E5            [11]  672 	push	hl
   4F7E CD 42 4B      [17]  673 	call	_abs
   4F81 F1            [10]  674 	pop	af
   4F82 DD 74 F9      [19]  675 	ld	-7 (ix),h
   4F85 DD 75 F8      [19]  676 	ld	-8 (ix),l
   4F88 DD 7E F6      [19]  677 	ld	a,-10 (ix)
   4F8B C6 FE         [ 7]  678 	add	a,#0xFE
   4F8D DD 77 EC      [19]  679 	ld	-20 (ix),a
   4F90 DD 7E F7      [19]  680 	ld	a,-9 (ix)
   4F93 CE FF         [ 7]  681 	adc	a,#0xFF
   4F95 DD 77 ED      [19]  682 	ld	-19 (ix),a
   4F98 DD 7E FE      [19]  683 	ld	a,-2 (ix)
   4F9B DD 96 EC      [19]  684 	sub	a, -20 (ix)
   4F9E DD 77 EC      [19]  685 	ld	-20 (ix),a
   4FA1 DD 7E FF      [19]  686 	ld	a,-1 (ix)
   4FA4 DD 9E ED      [19]  687 	sbc	a, -19 (ix)
   4FA7 DD 77 ED      [19]  688 	ld	-19 (ix),a
   4FAA DD 6E EC      [19]  689 	ld	l,-20 (ix)
   4FAD DD 66 ED      [19]  690 	ld	h,-19 (ix)
   4FB0 E5            [11]  691 	push	hl
   4FB1 CD 42 4B      [17]  692 	call	_abs
   4FB4 F1            [10]  693 	pop	af
   4FB5 DD 74 ED      [19]  694 	ld	-19 (ix),h
   4FB8 DD 75 EC      [19]  695 	ld	-20 (ix),l
   4FBB DD 7E F8      [19]  696 	ld	a,-8 (ix)
   4FBE DD 86 EC      [19]  697 	add	a, -20 (ix)
   4FC1 DD 77 F8      [19]  698 	ld	-8 (ix),a
   4FC4 DD 7E F9      [19]  699 	ld	a,-7 (ix)
   4FC7 DD 8E ED      [19]  700 	adc	a, -19 (ix)
   4FCA DD 77 F9      [19]  701 	ld	-7 (ix),a
   4FCD DD 7E F8      [19]  702 	ld	a,-8 (ix)
   4FD0 DD 86 DC      [19]  703 	add	a, -36 (ix)
   4FD3 DD 77 F8      [19]  704 	ld	-8 (ix),a
   4FD6 DD 7E F9      [19]  705 	ld	a,-7 (ix)
   4FD9 DD 8E DD      [19]  706 	adc	a, -35 (ix)
   4FDC DD 77 F9      [19]  707 	ld	-7 (ix),a
   4FDF DD 7E F8      [19]  708 	ld	a,-8 (ix)
   4FE2 DD 77 D8      [19]  709 	ld	-40 (ix),a
   4FE5 DD 7E F9      [19]  710 	ld	a,-7 (ix)
   4FE8 DD 77 D9      [19]  711 	ld	-39 (ix),a
                            712 ;src/pathfinding.c:135: resultado = 0;
   4FEB DD 36 D5 00   [19]  713 	ld	-43 (ix),#0x00
   4FEF                     714 00133$:
                            715 ;src/pathfinding.c:138: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4FEF DD 7E F0      [19]  716 	ld	a,-16 (ix)
   4FF2 DD 77 F8      [19]  717 	ld	-8 (ix),a
   4FF5 DD 7E F1      [19]  718 	ld	a,-15 (ix)
   4FF8 DD 77 F9      [19]  719 	ld	-7 (ix),a
   4FFB DD CB F1 7E   [20]  720 	bit	7, -15 (ix)
   4FFF 28 10         [12]  721 	jr	Z,00177$
   5001 DD 7E F6      [19]  722 	ld	a,-10 (ix)
   5004 C6 ED         [ 7]  723 	add	a, #0xED
   5006 DD 77 F8      [19]  724 	ld	-8 (ix),a
   5009 DD 7E F7      [19]  725 	ld	a,-9 (ix)
   500C CE FF         [ 7]  726 	adc	a, #0xFF
   500E DD 77 F9      [19]  727 	ld	-7 (ix),a
   5011                     728 00177$:
   5011 DD CB F9 2E   [23]  729 	sra	-7 (ix)
   5015 DD CB F8 1E   [23]  730 	rr	-8 (ix)
   5019 DD CB F9 2E   [23]  731 	sra	-7 (ix)
   501D DD CB F8 1E   [23]  732 	rr	-8 (ix)
   5021 DD 4E F8      [19]  733 	ld	c,-8 (ix)
   5024 DD 46 F9      [19]  734 	ld	b,-7 (ix)
   5027 69            [ 4]  735 	ld	l, c
   5028 60            [ 4]  736 	ld	h, b
   5029 29            [11]  737 	add	hl, hl
   502A 29            [11]  738 	add	hl, hl
   502B 09            [11]  739 	add	hl, bc
   502C 29            [11]  740 	add	hl, hl
   502D 29            [11]  741 	add	hl, hl
   502E 29            [11]  742 	add	hl, hl
   502F DD 75 F8      [19]  743 	ld	-8 (ix),l
   5032 DD 74 F9      [19]  744 	ld	-7 (ix),h
   5035 DD 7E 0A      [19]  745 	ld	a,10 (ix)
   5038 DD 86 F8      [19]  746 	add	a, -8 (ix)
   503B DD 77 F8      [19]  747 	ld	-8 (ix),a
   503E DD 7E 0B      [19]  748 	ld	a,11 (ix)
   5041 DD 8E F9      [19]  749 	adc	a, -7 (ix)
   5044 DD 77 F9      [19]  750 	ld	-7 (ix),a
   5047 DD 7E F8      [19]  751 	ld	a,-8 (ix)
   504A DD 86 FA      [19]  752 	add	a, -6 (ix)
   504D DD 77 F8      [19]  753 	ld	-8 (ix),a
   5050 DD 7E F9      [19]  754 	ld	a,-7 (ix)
   5053 CE 00         [ 7]  755 	adc	a, #0x00
   5055 DD 77 F9      [19]  756 	ld	-7 (ix),a
   5058 DD 6E F8      [19]  757 	ld	l,-8 (ix)
   505B DD 66 F9      [19]  758 	ld	h,-7 (ix)
   505E 7E            [ 7]  759 	ld	a,(hl)
   505F DD 77 F8      [19]  760 	ld	-8 (ix),a
   5062 3E 02         [ 7]  761 	ld	a,#0x02
   5064 DD 96 F8      [19]  762 	sub	a, -8 (ix)
   5067 DA 16 51      [10]  763 	jp	C,00141$
   506A DD 6E FC      [19]  764 	ld	l,-4 (ix)
   506D DD 66 FD      [19]  765 	ld	h,-3 (ix)
   5070 E5            [11]  766 	push	hl
   5071 21 DA 69      [10]  767 	ld	hl,#_sol_matriz
   5074 E5            [11]  768 	push	hl
   5075 CD 92 4B      [17]  769 	call	_getBit
   5078 F1            [10]  770 	pop	af
   5079 F1            [10]  771 	pop	af
   507A 2D            [ 4]  772 	dec	l
   507B CA 16 51      [10]  773 	jp	Z,00141$
                            774 ;src/pathfinding.c:139: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   507E DD 6E E2      [19]  775 	ld	l,-30 (ix)
   5081 DD 66 E3      [19]  776 	ld	h,-29 (ix)
   5084 E5            [11]  777 	push	hl
   5085 CD 42 4B      [17]  778 	call	_abs
   5088 F1            [10]  779 	pop	af
   5089 DD 74 E3      [19]  780 	ld	-29 (ix),h
   508C DD 75 E2      [19]  781 	ld	-30 (ix),l
   508F DD 7E F6      [19]  782 	ld	a,-10 (ix)
   5092 C6 02         [ 7]  783 	add	a, #0x02
   5094 DD 77 F8      [19]  784 	ld	-8 (ix),a
   5097 DD 7E F7      [19]  785 	ld	a,-9 (ix)
   509A CE 00         [ 7]  786 	adc	a, #0x00
   509C DD 77 F9      [19]  787 	ld	-7 (ix),a
   509F DD 7E FE      [19]  788 	ld	a,-2 (ix)
   50A2 DD 96 F8      [19]  789 	sub	a, -8 (ix)
   50A5 DD 77 F8      [19]  790 	ld	-8 (ix),a
   50A8 DD 7E FF      [19]  791 	ld	a,-1 (ix)
   50AB DD 9E F9      [19]  792 	sbc	a, -7 (ix)
   50AE DD 77 F9      [19]  793 	ld	-7 (ix),a
   50B1 DD 6E F8      [19]  794 	ld	l,-8 (ix)
   50B4 DD 66 F9      [19]  795 	ld	h,-7 (ix)
   50B7 E5            [11]  796 	push	hl
   50B8 CD 42 4B      [17]  797 	call	_abs
   50BB F1            [10]  798 	pop	af
   50BC DD 74 F9      [19]  799 	ld	-7 (ix),h
   50BF DD 75 F8      [19]  800 	ld	-8 (ix),l
   50C2 DD 7E E2      [19]  801 	ld	a,-30 (ix)
   50C5 DD 86 F8      [19]  802 	add	a, -8 (ix)
   50C8 DD 77 E2      [19]  803 	ld	-30 (ix),a
   50CB DD 7E E3      [19]  804 	ld	a,-29 (ix)
   50CE DD 8E F9      [19]  805 	adc	a, -7 (ix)
   50D1 DD 77 E3      [19]  806 	ld	-29 (ix),a
   50D4 DD 7E E0      [19]  807 	ld	a,-32 (ix)
   50D7 DD 86 E2      [19]  808 	add	a, -30 (ix)
   50DA DD 77 E2      [19]  809 	ld	-30 (ix),a
   50DD DD 7E E1      [19]  810 	ld	a,-31 (ix)
   50E0 DD 8E E3      [19]  811 	adc	a, -29 (ix)
   50E3 DD 77 E3      [19]  812 	ld	-29 (ix),a
   50E6 DD 7E E2      [19]  813 	ld	a,-30 (ix)
   50E9 DD 77 DA      [19]  814 	ld	-38 (ix),a
   50EC DD 7E E3      [19]  815 	ld	a,-29 (ix)
   50EF DD 77 DB      [19]  816 	ld	-37 (ix),a
                            817 ;src/pathfinding.c:140: if(resultado == 0){
   50F2 DD 7E D5      [19]  818 	ld	a,-43 (ix)
   50F5 B7            [ 4]  819 	or	a, a
   50F6 20 1A         [12]  820 	jr	NZ,00138$
                            821 ;src/pathfinding.c:141: if(dist1 > dist2)
   50F8 DD 7E DA      [19]  822 	ld	a,-38 (ix)
   50FB DD 96 D8      [19]  823 	sub	a, -40 (ix)
   50FE DD 7E DB      [19]  824 	ld	a,-37 (ix)
   5101 DD 9E D9      [19]  825 	sbc	a, -39 (ix)
   5104 E2 09 51      [10]  826 	jp	PO, 00340$
   5107 EE 80         [ 7]  827 	xor	a, #0x80
   5109                     828 00340$:
   5109 F2 16 51      [10]  829 	jp	P,00141$
                            830 ;src/pathfinding.c:142: resultado = 1;	
   510C DD 36 D5 01   [19]  831 	ld	-43 (ix),#0x01
   5110 18 04         [12]  832 	jr	00141$
   5112                     833 00138$:
                            834 ;src/pathfinding.c:144: resultado = 1;
   5112 DD 36 D5 01   [19]  835 	ld	-43 (ix),#0x01
   5116                     836 00141$:
                            837 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   5116 DD 7E F2      [19]  838 	ld	a,-14 (ix)
   5119 DD 77 E2      [19]  839 	ld	-30 (ix),a
   511C DD 7E F3      [19]  840 	ld	a,-13 (ix)
   511F DD 77 E3      [19]  841 	ld	-29 (ix),a
   5122 DD 7E F3      [19]  842 	ld	a,-13 (ix)
   5125 07            [ 4]  843 	rlca
   5126 E6 01         [ 7]  844 	and	a,#0x01
   5128 DD 77 F8      [19]  845 	ld	-8 (ix),a
   512B DD 7E F6      [19]  846 	ld	a,-10 (ix)
   512E C6 EB         [ 7]  847 	add	a, #0xEB
   5130 DD 77 FC      [19]  848 	ld	-4 (ix),a
   5133 DD 7E F7      [19]  849 	ld	a,-9 (ix)
   5136 CE FF         [ 7]  850 	adc	a, #0xFF
   5138 DD 77 FD      [19]  851 	ld	-3 (ix),a
   513B DD 7E F8      [19]  852 	ld	a,-8 (ix)
   513E B7            [ 4]  853 	or	a, a
   513F 28 0C         [12]  854 	jr	Z,00178$
   5141 DD 7E FC      [19]  855 	ld	a,-4 (ix)
   5144 DD 77 E2      [19]  856 	ld	-30 (ix),a
   5147 DD 7E FD      [19]  857 	ld	a,-3 (ix)
   514A DD 77 E3      [19]  858 	ld	-29 (ix),a
   514D                     859 00178$:
   514D DD CB E3 2E   [23]  860 	sra	-29 (ix)
   5151 DD CB E2 1E   [23]  861 	rr	-30 (ix)
   5155 DD CB E3 2E   [23]  862 	sra	-29 (ix)
   5159 DD CB E2 1E   [23]  863 	rr	-30 (ix)
   515D DD 4E E2      [19]  864 	ld	c,-30 (ix)
   5160 DD 46 E3      [19]  865 	ld	b,-29 (ix)
   5163 69            [ 4]  866 	ld	l, c
   5164 60            [ 4]  867 	ld	h, b
   5165 29            [11]  868 	add	hl, hl
   5166 29            [11]  869 	add	hl, hl
   5167 09            [11]  870 	add	hl, bc
   5168 29            [11]  871 	add	hl, hl
   5169 29            [11]  872 	add	hl, hl
   516A 29            [11]  873 	add	hl, hl
   516B DD 75 E2      [19]  874 	ld	-30 (ix),l
   516E DD 74 E3      [19]  875 	ld	-29 (ix),h
   5171 DD 7E 0A      [19]  876 	ld	a,10 (ix)
   5174 DD 86 E2      [19]  877 	add	a, -30 (ix)
   5177 DD 77 E2      [19]  878 	ld	-30 (ix),a
   517A DD 7E 0B      [19]  879 	ld	a,11 (ix)
   517D DD 8E E3      [19]  880 	adc	a, -29 (ix)
   5180 DD 77 E3      [19]  881 	ld	-29 (ix),a
   5183 DD 7E EE      [19]  882 	ld	a,-18 (ix)
   5186 DD 77 EC      [19]  883 	ld	-20 (ix),a
   5189 DD 7E EF      [19]  884 	ld	a,-17 (ix)
   518C DD 77 ED      [19]  885 	ld	-19 (ix),a
   518F DD CB EF 7E   [20]  886 	bit	7, -17 (ix)
   5193 28 0C         [12]  887 	jr	Z,00179$
   5195 DD 7E E6      [19]  888 	ld	a,-26 (ix)
   5198 DD 77 EC      [19]  889 	ld	-20 (ix),a
   519B DD 7E E7      [19]  890 	ld	a,-25 (ix)
   519E DD 77 ED      [19]  891 	ld	-19 (ix),a
   51A1                     892 00179$:
   51A1 DD CB ED 2E   [23]  893 	sra	-19 (ix)
   51A5 DD CB EC 1E   [23]  894 	rr	-20 (ix)
   51A9 DD 7E E2      [19]  895 	ld	a,-30 (ix)
   51AC DD 86 EC      [19]  896 	add	a, -20 (ix)
   51AF DD 77 E2      [19]  897 	ld	-30 (ix),a
   51B2 DD 7E E3      [19]  898 	ld	a,-29 (ix)
   51B5 DD 8E ED      [19]  899 	adc	a, -19 (ix)
   51B8 DD 77 E3      [19]  900 	ld	-29 (ix),a
   51BB DD 6E E2      [19]  901 	ld	l,-30 (ix)
   51BE DD 66 E3      [19]  902 	ld	h,-29 (ix)
   51C1 7E            [ 7]  903 	ld	a,(hl)
   51C2 DD 77 E2      [19]  904 	ld	-30 (ix),a
                            905 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   51C5 DD 7E FE      [19]  906 	ld	a,-2 (ix)
   51C8 DD 96 F6      [19]  907 	sub	a, -10 (ix)
   51CB DD 77 FE      [19]  908 	ld	-2 (ix),a
   51CE DD 7E FF      [19]  909 	ld	a,-1 (ix)
   51D1 DD 9E F7      [19]  910 	sbc	a, -9 (ix)
   51D4 DD 77 FF      [19]  911 	ld	-1 (ix),a
                            912 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   51D7 3E 02         [ 7]  913 	ld	a,#0x02
   51D9 DD 96 E2      [19]  914 	sub	a, -30 (ix)
   51DC DA 95 52      [10]  915 	jp	C,00154$
   51DF DD 6E F4      [19]  916 	ld	l,-12 (ix)
   51E2 DD 66 F5      [19]  917 	ld	h,-11 (ix)
   51E5 E5            [11]  918 	push	hl
   51E6 21 DA 69      [10]  919 	ld	hl,#_sol_matriz
   51E9 E5            [11]  920 	push	hl
   51EA CD 92 4B      [17]  921 	call	_getBit
   51ED F1            [10]  922 	pop	af
   51EE F1            [10]  923 	pop	af
   51EF DD 75 E2      [19]  924 	ld	-30 (ix), l
   51F2 7D            [ 4]  925 	ld	a, l
   51F3 3D            [ 4]  926 	dec	a
   51F4 CA 95 52      [10]  927 	jp	Z,00154$
                            928 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   51F7 DD 7E E4      [19]  929 	ld	a,-28 (ix)
   51FA DD 96 EE      [19]  930 	sub	a, -18 (ix)
   51FD 4F            [ 4]  931 	ld	c,a
   51FE DD 7E E5      [19]  932 	ld	a,-27 (ix)
   5201 DD 9E EF      [19]  933 	sbc	a, -17 (ix)
   5204 47            [ 4]  934 	ld	b,a
   5205 C5            [11]  935 	push	bc
   5206 CD 42 4B      [17]  936 	call	_abs
   5209 F1            [10]  937 	pop	af
   520A DD 74 E3      [19]  938 	ld	-29 (ix),h
   520D DD 75 E2      [19]  939 	ld	-30 (ix),l
   5210 DD 6E FE      [19]  940 	ld	l,-2 (ix)
   5213 DD 66 FF      [19]  941 	ld	h,-1 (ix)
   5216 E5            [11]  942 	push	hl
   5217 CD 42 4B      [17]  943 	call	_abs
   521A F1            [10]  944 	pop	af
   521B DD 74 ED      [19]  945 	ld	-19 (ix),h
   521E DD 75 EC      [19]  946 	ld	-20 (ix),l
   5221 DD 7E E2      [19]  947 	ld	a,-30 (ix)
   5224 DD 86 EC      [19]  948 	add	a, -20 (ix)
   5227 DD 77 E2      [19]  949 	ld	-30 (ix),a
   522A DD 7E E3      [19]  950 	ld	a,-29 (ix)
   522D DD 8E ED      [19]  951 	adc	a, -19 (ix)
   5230 DD 77 E3      [19]  952 	ld	-29 (ix),a
   5233 DD 7E D1      [19]  953 	ld	a,-47 (ix)
   5236 DD 86 E2      [19]  954 	add	a, -30 (ix)
   5239 DD 77 E2      [19]  955 	ld	-30 (ix),a
   523C DD 7E D2      [19]  956 	ld	a,-46 (ix)
   523F DD 8E E3      [19]  957 	adc	a, -29 (ix)
   5242 DD 77 E3      [19]  958 	ld	-29 (ix),a
   5245 DD 7E E2      [19]  959 	ld	a,-30 (ix)
   5248 DD 77 DE      [19]  960 	ld	-34 (ix),a
   524B DD 7E E3      [19]  961 	ld	a,-29 (ix)
   524E DD 77 DF      [19]  962 	ld	-33 (ix),a
                            963 ;src/pathfinding.c:150: if(resultado == 0){
   5251 DD 7E D5      [19]  964 	ld	a,-43 (ix)
   5254 B7            [ 4]  965 	or	a, a
   5255 20 1A         [12]  966 	jr	NZ,00151$
                            967 ;src/pathfinding.c:151: if(dist1 >= dist3)
   5257 DD 7E D8      [19]  968 	ld	a,-40 (ix)
   525A DD 96 DE      [19]  969 	sub	a, -34 (ix)
   525D DD 7E D9      [19]  970 	ld	a,-39 (ix)
   5260 DD 9E DF      [19]  971 	sbc	a, -33 (ix)
   5263 E2 68 52      [10]  972 	jp	PO, 00342$
   5266 EE 80         [ 7]  973 	xor	a, #0x80
   5268                     974 00342$:
   5268 FA 95 52      [10]  975 	jp	M,00154$
                            976 ;src/pathfinding.c:152: resultado = 2;
   526B DD 36 D5 02   [19]  977 	ld	-43 (ix),#0x02
   526F 18 24         [12]  978 	jr	00154$
   5271                     979 00151$:
                            980 ;src/pathfinding.c:153: }else if(resultado == 1){
   5271 DD 7E D5      [19]  981 	ld	a,-43 (ix)
   5274 3D            [ 4]  982 	dec	a
   5275 20 1A         [12]  983 	jr	NZ,00148$
                            984 ;src/pathfinding.c:154: if(dist2 >= dist3)
   5277 DD 7E DA      [19]  985 	ld	a,-38 (ix)
   527A DD 96 DE      [19]  986 	sub	a, -34 (ix)
   527D DD 7E DB      [19]  987 	ld	a,-37 (ix)
   5280 DD 9E DF      [19]  988 	sbc	a, -33 (ix)
   5283 E2 88 52      [10]  989 	jp	PO, 00345$
   5286 EE 80         [ 7]  990 	xor	a, #0x80
   5288                     991 00345$:
   5288 FA 95 52      [10]  992 	jp	M,00154$
                            993 ;src/pathfinding.c:155: resultado = 2;
   528B DD 36 D5 02   [19]  994 	ld	-43 (ix),#0x02
   528F 18 04         [12]  995 	jr	00154$
   5291                     996 00148$:
                            997 ;src/pathfinding.c:157: resultado = 2;
   5291 DD 36 D5 02   [19]  998 	ld	-43 (ix),#0x02
   5295                     999 00154$:
                           1000 ;src/pathfinding.c:161: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
   5295 DD 7E F2      [19] 1001 	ld	a,-14 (ix)
   5298 DD 77 E2      [19] 1002 	ld	-30 (ix),a
   529B DD 7E F3      [19] 1003 	ld	a,-13 (ix)
   529E DD 77 E3      [19] 1004 	ld	-29 (ix),a
   52A1 DD 7E F8      [19] 1005 	ld	a,-8 (ix)
   52A4 B7            [ 4] 1006 	or	a, a
   52A5 28 0C         [12] 1007 	jr	Z,00180$
   52A7 DD 7E FC      [19] 1008 	ld	a,-4 (ix)
   52AA DD 77 E2      [19] 1009 	ld	-30 (ix),a
   52AD DD 7E FD      [19] 1010 	ld	a,-3 (ix)
   52B0 DD 77 E3      [19] 1011 	ld	-29 (ix),a
   52B3                    1012 00180$:
   52B3 DD CB E3 2E   [23] 1013 	sra	-29 (ix)
   52B7 DD CB E2 1E   [23] 1014 	rr	-30 (ix)
   52BB DD CB E3 2E   [23] 1015 	sra	-29 (ix)
   52BF DD CB E2 1E   [23] 1016 	rr	-30 (ix)
   52C3 DD 4E E2      [19] 1017 	ld	c,-30 (ix)
   52C6 DD 46 E3      [19] 1018 	ld	b,-29 (ix)
   52C9 69            [ 4] 1019 	ld	l, c
   52CA 60            [ 4] 1020 	ld	h, b
   52CB 29            [11] 1021 	add	hl, hl
   52CC 29            [11] 1022 	add	hl, hl
   52CD 09            [11] 1023 	add	hl, bc
   52CE 29            [11] 1024 	add	hl, hl
   52CF 29            [11] 1025 	add	hl, hl
   52D0 29            [11] 1026 	add	hl, hl
   52D1 DD 75 E2      [19] 1027 	ld	-30 (ix),l
   52D4 DD 74 E3      [19] 1028 	ld	-29 (ix),h
   52D7 DD 7E 0A      [19] 1029 	ld	a,10 (ix)
   52DA DD 86 E2      [19] 1030 	add	a, -30 (ix)
   52DD DD 77 E2      [19] 1031 	ld	-30 (ix),a
   52E0 DD 7E 0B      [19] 1032 	ld	a,11 (ix)
   52E3 DD 8E E3      [19] 1033 	adc	a, -29 (ix)
   52E6 DD 77 E3      [19] 1034 	ld	-29 (ix),a
   52E9 DD 7E EA      [19] 1035 	ld	a,-22 (ix)
   52EC DD 77 F8      [19] 1036 	ld	-8 (ix),a
   52EF DD 7E EB      [19] 1037 	ld	a,-21 (ix)
   52F2 DD 77 F9      [19] 1038 	ld	-7 (ix),a
   52F5 DD CB EB 7E   [20] 1039 	bit	7, -21 (ix)
   52F9 28 10         [12] 1040 	jr	Z,00181$
   52FB DD 7E E6      [19] 1041 	ld	a,-26 (ix)
   52FE C6 02         [ 7] 1042 	add	a, #0x02
   5300 DD 77 F8      [19] 1043 	ld	-8 (ix),a
   5303 DD 7E E7      [19] 1044 	ld	a,-25 (ix)
   5306 CE 00         [ 7] 1045 	adc	a, #0x00
   5308 DD 77 F9      [19] 1046 	ld	-7 (ix),a
   530B                    1047 00181$:
   530B DD CB F9 2E   [23] 1048 	sra	-7 (ix)
   530F DD CB F8 1E   [23] 1049 	rr	-8 (ix)
   5313 DD 7E F8      [19] 1050 	ld	a,-8 (ix)
   5316 DD 86 E2      [19] 1051 	add	a, -30 (ix)
   5319 DD 77 E2      [19] 1052 	ld	-30 (ix),a
   531C DD 7E F9      [19] 1053 	ld	a,-7 (ix)
   531F DD 8E E3      [19] 1054 	adc	a, -29 (ix)
   5322 DD 77 E3      [19] 1055 	ld	-29 (ix),a
   5325 DD 6E E2      [19] 1056 	ld	l,-30 (ix)
   5328 DD 66 E3      [19] 1057 	ld	h,-29 (ix)
   532B 7E            [ 7] 1058 	ld	a,(hl)
   532C DD 77 E2      [19] 1059 	ld	-30 (ix),a
   532F 3E 02         [ 7] 1060 	ld	a,#0x02
   5331 DD 96 E2      [19] 1061 	sub	a, -30 (ix)
   5334 DA FE 53      [10] 1062 	jp	C,00172$
   5337 DD 6E E8      [19] 1063 	ld	l,-24 (ix)
   533A DD 66 E9      [19] 1064 	ld	h,-23 (ix)
   533D E5            [11] 1065 	push	hl
   533E 21 DA 69      [10] 1066 	ld	hl,#_sol_matriz
   5341 E5            [11] 1067 	push	hl
   5342 CD 92 4B      [17] 1068 	call	_getBit
   5345 F1            [10] 1069 	pop	af
   5346 F1            [10] 1070 	pop	af
   5347 2D            [ 4] 1071 	dec	l
   5348 CA FE 53      [10] 1072 	jp	Z,00172$
                           1073 ;src/pathfinding.c:162: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   534B DD 7E E4      [19] 1074 	ld	a,-28 (ix)
   534E DD 96 EA      [19] 1075 	sub	a, -22 (ix)
   5351 4F            [ 4] 1076 	ld	c,a
   5352 DD 7E E5      [19] 1077 	ld	a,-27 (ix)
   5355 DD 9E EB      [19] 1078 	sbc	a, -21 (ix)
   5358 47            [ 4] 1079 	ld	b,a
   5359 C5            [11] 1080 	push	bc
   535A CD 42 4B      [17] 1081 	call	_abs
   535D F1            [10] 1082 	pop	af
   535E DD 74 E3      [19] 1083 	ld	-29 (ix),h
   5361 DD 75 E2      [19] 1084 	ld	-30 (ix),l
   5364 DD 6E FE      [19] 1085 	ld	l,-2 (ix)
   5367 DD 66 FF      [19] 1086 	ld	h,-1 (ix)
   536A E5            [11] 1087 	push	hl
   536B CD 42 4B      [17] 1088 	call	_abs
   536E F1            [10] 1089 	pop	af
   536F DD 74 FF      [19] 1090 	ld	-1 (ix),h
   5372 DD 75 FE      [19] 1091 	ld	-2 (ix),l
   5375 DD 7E E2      [19] 1092 	ld	a,-30 (ix)
   5378 DD 86 FE      [19] 1093 	add	a, -2 (ix)
   537B DD 77 E2      [19] 1094 	ld	-30 (ix),a
   537E DD 7E E3      [19] 1095 	ld	a,-29 (ix)
   5381 DD 8E FF      [19] 1096 	adc	a, -1 (ix)
   5384 DD 77 E3      [19] 1097 	ld	-29 (ix),a
   5387 DD 7E E2      [19] 1098 	ld	a,-30 (ix)
   538A DD 86 D6      [19] 1099 	add	a, -42 (ix)
   538D DD 77 D3      [19] 1100 	ld	-45 (ix),a
   5390 DD 7E E3      [19] 1101 	ld	a,-29 (ix)
   5393 DD 8E D7      [19] 1102 	adc	a, -41 (ix)
   5396 DD 77 D4      [19] 1103 	ld	-44 (ix),a
                           1104 ;src/pathfinding.c:163: if(resultado == 0){
   5399 DD 7E D5      [19] 1105 	ld	a,-43 (ix)
   539C B7            [ 4] 1106 	or	a, a
   539D 20 1A         [12] 1107 	jr	NZ,00169$
                           1108 ;src/pathfinding.c:164: if(dist1 >= dist4)
   539F DD 7E D8      [19] 1109 	ld	a,-40 (ix)
   53A2 DD 96 D3      [19] 1110 	sub	a, -45 (ix)
   53A5 DD 7E D9      [19] 1111 	ld	a,-39 (ix)
   53A8 DD 9E D4      [19] 1112 	sbc	a, -44 (ix)
   53AB E2 B0 53      [10] 1113 	jp	PO, 00347$
   53AE EE 80         [ 7] 1114 	xor	a, #0x80
   53B0                    1115 00347$:
   53B0 FA FE 53      [10] 1116 	jp	M,00172$
                           1117 ;src/pathfinding.c:165: resultado = 3;
   53B3 DD 36 D5 03   [19] 1118 	ld	-43 (ix),#0x03
   53B7 18 45         [12] 1119 	jr	00172$
   53B9                    1120 00169$:
                           1121 ;src/pathfinding.c:166: }else if(resultado == 1){
   53B9 DD 7E D5      [19] 1122 	ld	a,-43 (ix)
   53BC 3D            [ 4] 1123 	dec	a
   53BD 20 1A         [12] 1124 	jr	NZ,00166$
                           1125 ;src/pathfinding.c:167: if(dist2 >= dist4)
   53BF DD 7E DA      [19] 1126 	ld	a,-38 (ix)
   53C2 DD 96 D3      [19] 1127 	sub	a, -45 (ix)
   53C5 DD 7E DB      [19] 1128 	ld	a,-37 (ix)
   53C8 DD 9E D4      [19] 1129 	sbc	a, -44 (ix)
   53CB E2 D0 53      [10] 1130 	jp	PO, 00350$
   53CE EE 80         [ 7] 1131 	xor	a, #0x80
   53D0                    1132 00350$:
   53D0 FA FE 53      [10] 1133 	jp	M,00172$
                           1134 ;src/pathfinding.c:168: resultado = 3;
   53D3 DD 36 D5 03   [19] 1135 	ld	-43 (ix),#0x03
   53D7 18 25         [12] 1136 	jr	00172$
   53D9                    1137 00166$:
                           1138 ;src/pathfinding.c:169: }else if (resultado == 2){
   53D9 DD 7E D5      [19] 1139 	ld	a,-43 (ix)
   53DC D6 02         [ 7] 1140 	sub	a, #0x02
   53DE 20 1A         [12] 1141 	jr	NZ,00163$
                           1142 ;src/pathfinding.c:170: if(dist3 >= dist4)
   53E0 DD 7E DE      [19] 1143 	ld	a,-34 (ix)
   53E3 DD 96 D3      [19] 1144 	sub	a, -45 (ix)
   53E6 DD 7E DF      [19] 1145 	ld	a,-33 (ix)
   53E9 DD 9E D4      [19] 1146 	sbc	a, -44 (ix)
   53EC E2 F1 53      [10] 1147 	jp	PO, 00353$
   53EF EE 80         [ 7] 1148 	xor	a, #0x80
   53F1                    1149 00353$:
   53F1 FA FE 53      [10] 1150 	jp	M,00172$
                           1151 ;src/pathfinding.c:171: resultado = 3;
   53F4 DD 36 D5 03   [19] 1152 	ld	-43 (ix),#0x03
   53F8 18 04         [12] 1153 	jr	00172$
   53FA                    1154 00163$:
                           1155 ;src/pathfinding.c:173: resultado = 3;
   53FA DD 36 D5 03   [19] 1156 	ld	-43 (ix),#0x03
   53FE                    1157 00172$:
                           1158 ;src/pathfinding.c:177: return resultado;
   53FE DD 6E D5      [19] 1159 	ld	l,-43 (ix)
   5401 DD F9         [10] 1160 	ld	sp, ix
   5403 DD E1         [14] 1161 	pop	ix
   5405 C9            [10] 1162 	ret
                           1163 ;src/pathfinding.c:181: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                           1164 ;	---------------------------------
                           1165 ; Function pathFinding
                           1166 ; ---------------------------------
   5406                    1167 _pathFinding::
   5406 DD E5         [15] 1168 	push	ix
   5408 DD 21 00 00   [14] 1169 	ld	ix,#0
   540C DD 39         [15] 1170 	add	ix,sp
   540E 21 E9 FF      [10] 1171 	ld	hl,#-23
   5411 39            [11] 1172 	add	hl,sp
   5412 F9            [ 6] 1173 	ld	sp,hl
                           1174 ;src/pathfinding.c:193: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
   5413 DD 4E F2      [19] 1175 	ld	c,-14 (ix)
   5416 06 00         [ 7] 1176 	ld	b,#0x00
   5418 21 EA FF      [10] 1177 	ld	hl,#0xFFEA
   541B 09            [11] 1178 	add	hl,bc
   541C 5D            [ 4] 1179 	ld	e, l
   541D 54            [ 4] 1180 	ld	d, h
   541E 29            [11] 1181 	add	hl, hl
   541F 29            [11] 1182 	add	hl, hl
   5420 19            [11] 1183 	add	hl, de
   5421 29            [11] 1184 	add	hl, hl
   5422 29            [11] 1185 	add	hl, hl
   5423 29            [11] 1186 	add	hl, hl
   5424 29            [11] 1187 	add	hl, hl
   5425 DD 5E F1      [19] 1188 	ld	e,-15 (ix)
   5428 16 00         [ 7] 1189 	ld	d,#0x00
   542A 19            [11] 1190 	add	hl,de
   542B DD 75 EB      [19] 1191 	ld	-21 (ix),l
   542E DD 74 EC      [19] 1192 	ld	-20 (ix),h
                           1193 ;src/pathfinding.c:194: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
   5431 79            [ 4] 1194 	ld	a,c
   5432 C6 E6         [ 7] 1195 	add	a,#0xE6
   5434 6F            [ 4] 1196 	ld	l,a
   5435 78            [ 4] 1197 	ld	a,b
   5436 CE FF         [ 7] 1198 	adc	a,#0xFF
   5438 67            [ 4] 1199 	ld	h,a
   5439 D5            [11] 1200 	push	de
   543A 5D            [ 4] 1201 	ld	e, l
   543B 54            [ 4] 1202 	ld	d, h
   543C 29            [11] 1203 	add	hl, hl
   543D 29            [11] 1204 	add	hl, hl
   543E 19            [11] 1205 	add	hl, de
   543F 29            [11] 1206 	add	hl, hl
   5440 29            [11] 1207 	add	hl, hl
   5441 29            [11] 1208 	add	hl, hl
   5442 29            [11] 1209 	add	hl, hl
   5443 D1            [10] 1210 	pop	de
   5444 19            [11] 1211 	add	hl,de
   5445 DD 75 EE      [19] 1212 	ld	-18 (ix),l
   5448 DD 74 EF      [19] 1213 	ld	-17 (ix),h
                           1214 ;src/pathfinding.c:195: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
   544B 79            [ 4] 1215 	ld	a,c
   544C C6 E8         [ 7] 1216 	add	a,#0xE8
   544E 4F            [ 4] 1217 	ld	c,a
   544F 78            [ 4] 1218 	ld	a,b
   5450 CE FF         [ 7] 1219 	adc	a,#0xFF
   5452 47            [ 4] 1220 	ld	b,a
   5453 69            [ 4] 1221 	ld	l, c
   5454 60            [ 4] 1222 	ld	h, b
   5455 29            [11] 1223 	add	hl, hl
   5456 29            [11] 1224 	add	hl, hl
   5457 09            [11] 1225 	add	hl, bc
   5458 29            [11] 1226 	add	hl, hl
   5459 29            [11] 1227 	add	hl, hl
   545A 29            [11] 1228 	add	hl, hl
   545B 29            [11] 1229 	add	hl, hl
   545C 4D            [ 4] 1230 	ld	c,l
   545D 44            [ 4] 1231 	ld	b,h
   545E 6B            [ 4] 1232 	ld	l, e
   545F 62            [ 4] 1233 	ld	h, d
   5460 23            [ 6] 1234 	inc	hl
   5461 09            [11] 1235 	add	hl,bc
   5462 33            [ 6] 1236 	inc	sp
   5463 33            [ 6] 1237 	inc	sp
   5464 E5            [11] 1238 	push	hl
                           1239 ;src/pathfinding.c:196: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
   5465 1B            [ 6] 1240 	dec	de
   5466 69            [ 4] 1241 	ld	l, c
   5467 60            [ 4] 1242 	ld	h, b
   5468 19            [11] 1243 	add	hl,de
   5469 DD 75 F3      [19] 1244 	ld	-13 (ix),l
   546C DD 74 F4      [19] 1245 	ld	-12 (ix),h
                           1246 ;src/pathfinding.c:198: u8 problem = 0;
   546F DD 36 F5 00   [19] 1247 	ld	-11 (ix),#0x00
                           1248 ;src/pathfinding.c:200: x = s_x;
   5473 DD 7E 04      [19] 1249 	ld	a,4 (ix)
   5476 DD 77 F1      [19] 1250 	ld	-15 (ix),a
                           1251 ;src/pathfinding.c:202: y = s_y;
   5479 DD 7E 05      [19] 1252 	ld	a,5 (ix)
   547C DD 77 F2      [19] 1253 	ld	-14 (ix),a
                           1254 ;src/pathfinding.c:204: k = 0;
   547F DD 36 F9 00   [19] 1255 	ld	-7 (ix),#0x00
                           1256 ;src/pathfinding.c:205: aux = 1;
   5483 DD 36 F0 01   [19] 1257 	ld	-16 (ix),#0x01
                           1258 ;src/pathfinding.c:208: memset(sol_matriz, 0, (40*2*44*4)/8);
   5487 21 DA 69      [10] 1259 	ld	hl,#_sol_matriz
   548A 36 00         [10] 1260 	ld	(hl), #0x00
   548C 5D            [ 4] 1261 	ld	e, l
   548D 54            [ 4] 1262 	ld	d, h
   548E 13            [ 6] 1263 	inc	de
   548F 01 DF 06      [10] 1264 	ld	bc, #0x06DF
   5492 ED B0         [21] 1265 	ldir
                           1266 ;src/pathfinding.c:209: enemy->longitud_camino = 0;
   5494 DD 7E 08      [19] 1267 	ld	a,8 (ix)
   5497 DD 77 FE      [19] 1268 	ld	-2 (ix),a
   549A DD 7E 09      [19] 1269 	ld	a,9 (ix)
   549D DD 77 FF      [19] 1270 	ld	-1 (ix),a
   54A0 DD 7E FE      [19] 1271 	ld	a,-2 (ix)
   54A3 C6 42         [ 7] 1272 	add	a, #0x42
   54A5 DD 77 FA      [19] 1273 	ld	-6 (ix),a
   54A8 DD 7E FF      [19] 1274 	ld	a,-1 (ix)
   54AB CE 01         [ 7] 1275 	adc	a, #0x01
   54AD DD 77 FB      [19] 1276 	ld	-5 (ix),a
   54B0 DD 6E FA      [19] 1277 	ld	l,-6 (ix)
   54B3 DD 66 FB      [19] 1278 	ld	h,-5 (ix)
   54B6 36 00         [10] 1279 	ld	(hl),#0x00
                           1280 ;src/pathfinding.c:210: sol_tam = 1;
   54B8 21 D9 69      [10] 1281 	ld	hl,#_sol_tam + 0
   54BB 36 01         [10] 1282 	ld	(hl), #0x01
                           1283 ;src/pathfinding.c:211: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
   54BD DD 7E F2      [19] 1284 	ld	a,-14 (ix)
   54C0 DD 77 F7      [19] 1285 	ld	-9 (ix),a
   54C3 DD 36 F8 00   [19] 1286 	ld	-8 (ix),#0x00
   54C7 DD 7E F7      [19] 1287 	ld	a,-9 (ix)
   54CA C6 E8         [ 7] 1288 	add	a,#0xE8
   54CC DD 77 F7      [19] 1289 	ld	-9 (ix),a
   54CF DD 7E F8      [19] 1290 	ld	a,-8 (ix)
   54D2 CE FF         [ 7] 1291 	adc	a,#0xFF
   54D4 DD 77 F8      [19] 1292 	ld	-8 (ix),a
   54D7 DD 4E F7      [19] 1293 	ld	c,-9 (ix)
   54DA DD 46 F8      [19] 1294 	ld	b,-8 (ix)
   54DD 69            [ 4] 1295 	ld	l, c
   54DE 60            [ 4] 1296 	ld	h, b
   54DF 29            [11] 1297 	add	hl, hl
   54E0 29            [11] 1298 	add	hl, hl
   54E1 09            [11] 1299 	add	hl, bc
   54E2 29            [11] 1300 	add	hl, hl
   54E3 29            [11] 1301 	add	hl, hl
   54E4 29            [11] 1302 	add	hl, hl
   54E5 29            [11] 1303 	add	hl, hl
   54E6 DD 75 F7      [19] 1304 	ld	-9 (ix),l
   54E9 DD 74 F8      [19] 1305 	ld	-8 (ix),h
   54EC DD 7E F1      [19] 1306 	ld	a,-15 (ix)
   54EF DD 77 FC      [19] 1307 	ld	-4 (ix),a
   54F2 DD 36 FD 00   [19] 1308 	ld	-3 (ix),#0x00
   54F6 DD 7E F7      [19] 1309 	ld	a,-9 (ix)
   54F9 DD 86 FC      [19] 1310 	add	a, -4 (ix)
   54FC DD 77 FC      [19] 1311 	ld	-4 (ix),a
   54FF DD 7E F8      [19] 1312 	ld	a,-8 (ix)
   5502 DD 8E FD      [19] 1313 	adc	a, -3 (ix)
   5505 DD 77 FD      [19] 1314 	ld	-3 (ix),a
   5508 21 01 00      [10] 1315 	ld	hl,#0x0001
   550B E5            [11] 1316 	push	hl
   550C DD 6E FC      [19] 1317 	ld	l,-4 (ix)
   550F DD 66 FD      [19] 1318 	ld	h,-3 (ix)
   5512 E5            [11] 1319 	push	hl
   5513 21 DA 69      [10] 1320 	ld	hl,#_sol_matriz
   5516 E5            [11] 1321 	push	hl
   5517 CD DD 4B      [17] 1322 	call	_setBit
   551A 21 06 00      [10] 1323 	ld	hl,#6
   551D 39            [11] 1324 	add	hl,sp
   551E F9            [ 6] 1325 	ld	sp,hl
                           1326 ;src/pathfinding.c:212: inserted = anyadirALista(x, y);
   551F DD 66 F2      [19] 1327 	ld	h,-14 (ix)
   5522 DD 6E F1      [19] 1328 	ld	l,-15 (ix)
   5525 E5            [11] 1329 	push	hl
   5526 CD 57 4C      [17] 1330 	call	_anyadirALista
   5529 F1            [10] 1331 	pop	af
   552A DD 75 ED      [19] 1332 	ld	-19 (ix),l
                           1333 ;src/pathfinding.c:216: while (aux){
   552D                    1334 00116$:
   552D DD 7E F0      [19] 1335 	ld	a,-16 (ix)
   5530 B7            [ 4] 1336 	or	a, a
   5531 CA D4 56      [10] 1337 	jp	Z,00118$
                           1338 ;src/pathfinding.c:217: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   5534 DD 7E 06      [19] 1339 	ld	a,6 (ix)
   5537 DD 96 F1      [19] 1340 	sub	a, -15 (ix)
   553A 20 08         [12] 1341 	jr	NZ,00114$
   553C DD 7E 07      [19] 1342 	ld	a,7 (ix)
   553F DD 96 F2      [19] 1343 	sub	a, -14 (ix)
   5542 28 0C         [12] 1344 	jr	Z,00110$
   5544                    1345 00114$:
   5544 3A D9 69      [13] 1346 	ld	a,(#_sol_tam + 0)
   5547 B7            [ 4] 1347 	or	a, a
   5548 28 06         [12] 1348 	jr	Z,00110$
   554A DD 7E ED      [19] 1349 	ld	a,-19 (ix)
   554D B7            [ 4] 1350 	or	a, a
   554E 20 16         [12] 1351 	jr	NZ,00111$
   5550                    1352 00110$:
                           1353 ;src/pathfinding.c:219: if(inserted == 0 || sol_tam == 0){
   5550 DD 7E ED      [19] 1354 	ld	a,-19 (ix)
   5553 B7            [ 4] 1355 	or	a, a
   5554 28 06         [12] 1356 	jr	Z,00101$
   5556 3A D9 69      [13] 1357 	ld	a,(#_sol_tam + 0)
   5559 B7            [ 4] 1358 	or	a, a
   555A 20 04         [12] 1359 	jr	NZ,00102$
   555C                    1360 00101$:
                           1361 ;src/pathfinding.c:220: problem = 1;
   555C DD 36 F5 01   [19] 1362 	ld	-11 (ix),#0x01
   5560                    1363 00102$:
                           1364 ;src/pathfinding.c:223: aux = 0;
   5560 DD 36 F0 00   [19] 1365 	ld	-16 (ix),#0x00
   5564 18 C7         [12] 1366 	jr	00116$
   5566                    1367 00111$:
                           1368 ;src/pathfinding.c:225: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   5566 DD 6E 0A      [19] 1369 	ld	l,10 (ix)
   5569 DD 66 0B      [19] 1370 	ld	h,11 (ix)
   556C E5            [11] 1371 	push	hl
   556D DD 66 07      [19] 1372 	ld	h,7 (ix)
   5570 DD 6E 06      [19] 1373 	ld	l,6 (ix)
   5573 E5            [11] 1374 	push	hl
   5574 DD 66 05      [19] 1375 	ld	h,5 (ix)
   5577 DD 6E 04      [19] 1376 	ld	l,4 (ix)
   557A E5            [11] 1377 	push	hl
   557B DD 66 F2      [19] 1378 	ld	h,-14 (ix)
   557E DD 6E F1      [19] 1379 	ld	l,-15 (ix)
   5581 E5            [11] 1380 	push	hl
   5582 CD 95 4C      [17] 1381 	call	_adjacentTiles
   5585 F1            [10] 1382 	pop	af
   5586 F1            [10] 1383 	pop	af
   5587 F1            [10] 1384 	pop	af
   5588 F1            [10] 1385 	pop	af
   5589 5D            [ 4] 1386 	ld	e,l
                           1387 ;src/pathfinding.c:227: switch(movimiento){
   558A 3E 04         [ 7] 1388 	ld	a,#0x04
   558C 93            [ 4] 1389 	sub	a, e
   558D 38 9E         [12] 1390 	jr	C,00116$
                           1391 ;src/pathfinding.c:233: k = k+2;
   558F DD 4E F9      [19] 1392 	ld	c,-7 (ix)
   5592 0C            [ 4] 1393 	inc	c
   5593 0C            [ 4] 1394 	inc	c
                           1395 ;src/pathfinding.c:227: switch(movimiento){
   5594 16 00         [ 7] 1396 	ld	d,#0x00
   5596 21 9D 55      [10] 1397 	ld	hl,#00169$
   5599 19            [11] 1398 	add	hl,de
   559A 19            [11] 1399 	add	hl,de
   559B 19            [11] 1400 	add	hl,de
   559C E9            [ 4] 1401 	jp	(hl)
   559D                    1402 00169$:
   559D C3 AC 55      [10] 1403 	jp	00104$
   55A0 C3 E3 55      [10] 1404 	jp	00105$
   55A3 C3 1A 56      [10] 1405 	jp	00106$
   55A6 C3 50 56      [10] 1406 	jp	00107$
   55A9 C3 86 56      [10] 1407 	jp	00108$
                           1408 ;src/pathfinding.c:228: case 0:
   55AC                    1409 00104$:
                           1410 ;src/pathfinding.c:230: setBit(sol_matriz, up, 1);
   55AC C5            [11] 1411 	push	bc
   55AD 21 01 00      [10] 1412 	ld	hl,#0x0001
   55B0 E5            [11] 1413 	push	hl
   55B1 DD 6E EE      [19] 1414 	ld	l,-18 (ix)
   55B4 DD 66 EF      [19] 1415 	ld	h,-17 (ix)
   55B7 E5            [11] 1416 	push	hl
   55B8 21 DA 69      [10] 1417 	ld	hl,#_sol_matriz
   55BB E5            [11] 1418 	push	hl
   55BC CD DD 4B      [17] 1419 	call	_setBit
   55BF 21 06 00      [10] 1420 	ld	hl,#6
   55C2 39            [11] 1421 	add	hl,sp
   55C3 F9            [ 6] 1422 	ld	sp,hl
   55C4 C1            [10] 1423 	pop	bc
                           1424 ;src/pathfinding.c:231: inserted = anyadirALista(x, y-2);
   55C5 DD 46 F2      [19] 1425 	ld	b,-14 (ix)
   55C8 05            [ 4] 1426 	dec	b
   55C9 05            [ 4] 1427 	dec	b
   55CA C5            [11] 1428 	push	bc
   55CB C5            [11] 1429 	push	bc
   55CC 33            [ 6] 1430 	inc	sp
   55CD DD 7E F1      [19] 1431 	ld	a,-15 (ix)
   55D0 F5            [11] 1432 	push	af
   55D1 33            [ 6] 1433 	inc	sp
   55D2 CD 57 4C      [17] 1434 	call	_anyadirALista
   55D5 F1            [10] 1435 	pop	af
   55D6 C1            [10] 1436 	pop	bc
   55D7 DD 75 ED      [19] 1437 	ld	-19 (ix),l
                           1438 ;src/pathfinding.c:232: y = y-1;
   55DA DD 35 F2      [23] 1439 	dec	-14 (ix)
                           1440 ;src/pathfinding.c:233: k = k+2;
   55DD DD 71 F9      [19] 1441 	ld	-7 (ix),c
                           1442 ;src/pathfinding.c:234: break;
   55E0 C3 2D 55      [10] 1443 	jp	00116$
                           1444 ;src/pathfinding.c:235: case 1:
   55E3                    1445 00105$:
                           1446 ;src/pathfinding.c:237: setBit(sol_matriz, down, 1);
   55E3 C5            [11] 1447 	push	bc
   55E4 21 01 00      [10] 1448 	ld	hl,#0x0001
   55E7 E5            [11] 1449 	push	hl
   55E8 DD 6E EB      [19] 1450 	ld	l,-21 (ix)
   55EB DD 66 EC      [19] 1451 	ld	h,-20 (ix)
   55EE E5            [11] 1452 	push	hl
   55EF 21 DA 69      [10] 1453 	ld	hl,#_sol_matriz
   55F2 E5            [11] 1454 	push	hl
   55F3 CD DD 4B      [17] 1455 	call	_setBit
   55F6 21 06 00      [10] 1456 	ld	hl,#6
   55F9 39            [11] 1457 	add	hl,sp
   55FA F9            [ 6] 1458 	ld	sp,hl
   55FB C1            [10] 1459 	pop	bc
                           1460 ;src/pathfinding.c:238: inserted = anyadirALista(x, y+2);
   55FC DD 46 F2      [19] 1461 	ld	b,-14 (ix)
   55FF 04            [ 4] 1462 	inc	b
   5600 04            [ 4] 1463 	inc	b
   5601 C5            [11] 1464 	push	bc
   5602 C5            [11] 1465 	push	bc
   5603 33            [ 6] 1466 	inc	sp
   5604 DD 7E F1      [19] 1467 	ld	a,-15 (ix)
   5607 F5            [11] 1468 	push	af
   5608 33            [ 6] 1469 	inc	sp
   5609 CD 57 4C      [17] 1470 	call	_anyadirALista
   560C F1            [10] 1471 	pop	af
   560D C1            [10] 1472 	pop	bc
   560E DD 75 ED      [19] 1473 	ld	-19 (ix),l
                           1474 ;src/pathfinding.c:239: y = y+1;
   5611 DD 34 F2      [23] 1475 	inc	-14 (ix)
                           1476 ;src/pathfinding.c:240: k = k+2;
   5614 DD 71 F9      [19] 1477 	ld	-7 (ix),c
                           1478 ;src/pathfinding.c:241: break;
   5617 C3 2D 55      [10] 1479 	jp	00116$
                           1480 ;src/pathfinding.c:242: case 2:
   561A                    1481 00106$:
                           1482 ;src/pathfinding.c:244: setBit(sol_matriz, left, 1);
   561A C5            [11] 1483 	push	bc
   561B 21 01 00      [10] 1484 	ld	hl,#0x0001
   561E E5            [11] 1485 	push	hl
   561F DD 6E F3      [19] 1486 	ld	l,-13 (ix)
   5622 DD 66 F4      [19] 1487 	ld	h,-12 (ix)
   5625 E5            [11] 1488 	push	hl
   5626 21 DA 69      [10] 1489 	ld	hl,#_sol_matriz
   5629 E5            [11] 1490 	push	hl
   562A CD DD 4B      [17] 1491 	call	_setBit
   562D 21 06 00      [10] 1492 	ld	hl,#6
   5630 39            [11] 1493 	add	hl,sp
   5631 F9            [ 6] 1494 	ld	sp,hl
   5632 C1            [10] 1495 	pop	bc
                           1496 ;src/pathfinding.c:245: inserted = anyadirALista(x-1, y);
   5633 DD 46 F1      [19] 1497 	ld	b,-15 (ix)
   5636 05            [ 4] 1498 	dec	b
   5637 C5            [11] 1499 	push	bc
   5638 DD 7E F2      [19] 1500 	ld	a,-14 (ix)
   563B F5            [11] 1501 	push	af
   563C 33            [ 6] 1502 	inc	sp
   563D C5            [11] 1503 	push	bc
   563E 33            [ 6] 1504 	inc	sp
   563F CD 57 4C      [17] 1505 	call	_anyadirALista
   5642 F1            [10] 1506 	pop	af
   5643 C1            [10] 1507 	pop	bc
   5644 DD 75 ED      [19] 1508 	ld	-19 (ix),l
                           1509 ;src/pathfinding.c:246: x = x-1;
   5647 DD 70 F1      [19] 1510 	ld	-15 (ix),b
                           1511 ;src/pathfinding.c:247: k = k+2;
   564A DD 71 F9      [19] 1512 	ld	-7 (ix),c
                           1513 ;src/pathfinding.c:248: break;
   564D C3 2D 55      [10] 1514 	jp	00116$
                           1515 ;src/pathfinding.c:249: case 3:
   5650                    1516 00107$:
                           1517 ;src/pathfinding.c:251: setBit(sol_matriz, right, 1);
   5650 C5            [11] 1518 	push	bc
   5651 21 01 00      [10] 1519 	ld	hl,#0x0001
   5654 E5            [11] 1520 	push	hl
   5655 DD 6E E9      [19] 1521 	ld	l,-23 (ix)
   5658 DD 66 EA      [19] 1522 	ld	h,-22 (ix)
   565B E5            [11] 1523 	push	hl
   565C 21 DA 69      [10] 1524 	ld	hl,#_sol_matriz
   565F E5            [11] 1525 	push	hl
   5660 CD DD 4B      [17] 1526 	call	_setBit
   5663 21 06 00      [10] 1527 	ld	hl,#6
   5666 39            [11] 1528 	add	hl,sp
   5667 F9            [ 6] 1529 	ld	sp,hl
   5668 C1            [10] 1530 	pop	bc
                           1531 ;src/pathfinding.c:252: inserted = anyadirALista(x+1, y);
   5669 DD 46 F1      [19] 1532 	ld	b,-15 (ix)
   566C 04            [ 4] 1533 	inc	b
   566D C5            [11] 1534 	push	bc
   566E DD 7E F2      [19] 1535 	ld	a,-14 (ix)
   5671 F5            [11] 1536 	push	af
   5672 33            [ 6] 1537 	inc	sp
   5673 C5            [11] 1538 	push	bc
   5674 33            [ 6] 1539 	inc	sp
   5675 CD 57 4C      [17] 1540 	call	_anyadirALista
   5678 F1            [10] 1541 	pop	af
   5679 C1            [10] 1542 	pop	bc
   567A DD 75 ED      [19] 1543 	ld	-19 (ix),l
                           1544 ;src/pathfinding.c:253: x = x+1;
   567D DD 70 F1      [19] 1545 	ld	-15 (ix),b
                           1546 ;src/pathfinding.c:254: k = k+2;
   5680 DD 71 F9      [19] 1547 	ld	-7 (ix),c
                           1548 ;src/pathfinding.c:255: break;
   5683 C3 2D 55      [10] 1549 	jp	00116$
                           1550 ;src/pathfinding.c:257: case 4:
   5686                    1551 00108$:
                           1552 ;src/pathfinding.c:259: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
   5686 DD 7E F2      [19] 1553 	ld	a, -14 (ix)
   5689 06 00         [ 7] 1554 	ld	b, #0x00
   568B C6 80         [ 7] 1555 	add	a,#0x80
   568D 4F            [ 4] 1556 	ld	c,a
   568E 78            [ 4] 1557 	ld	a,b
   568F CE F8         [ 7] 1558 	adc	a,#0xF8
   5691 47            [ 4] 1559 	ld	b,a
   5692 DD 6E F1      [19] 1560 	ld	l,-15 (ix)
   5695 26 00         [ 7] 1561 	ld	h,#0x00
   5697 09            [11] 1562 	add	hl,bc
   5698 01 01 00      [10] 1563 	ld	bc,#0x0001
   569B C5            [11] 1564 	push	bc
   569C E5            [11] 1565 	push	hl
   569D 21 DA 69      [10] 1566 	ld	hl,#_sol_matriz
   56A0 E5            [11] 1567 	push	hl
   56A1 CD DD 4B      [17] 1568 	call	_setBit
   56A4 21 06 00      [10] 1569 	ld	hl,#6
   56A7 39            [11] 1570 	add	hl,sp
   56A8 F9            [ 6] 1571 	ld	sp,hl
                           1572 ;src/pathfinding.c:261: sol_tam = sol_tam - 2;
   56A9 21 D9 69      [10] 1573 	ld	hl, #_sol_tam+0
   56AC 35            [11] 1574 	dec	(hl)
   56AD 21 D9 69      [10] 1575 	ld	hl, #_sol_tam+0
   56B0 35            [11] 1576 	dec	(hl)
                           1577 ;src/pathfinding.c:262: k--;
   56B1 DD 4E F9      [19] 1578 	ld	c,-7 (ix)
   56B4 0D            [ 4] 1579 	dec	c
                           1580 ;src/pathfinding.c:263: y = camino[k];
   56B5 21 1A 72      [10] 1581 	ld	hl,#_camino
   56B8 06 00         [ 7] 1582 	ld	b,#0x00
   56BA 09            [11] 1583 	add	hl, bc
   56BB 7E            [ 7] 1584 	ld	a,(hl)
   56BC DD 77 F2      [19] 1585 	ld	-14 (ix),a
                           1586 ;src/pathfinding.c:264: k--;
   56BF 79            [ 4] 1587 	ld	a,c
   56C0 C6 FF         [ 7] 1588 	add	a,#0xFF
                           1589 ;src/pathfinding.c:265: x = camino[k];
   56C2 DD 77 F9      [19] 1590 	ld	-7 (ix),a
   56C5 C6 1A         [ 7] 1591 	add	a,#<(_camino)
   56C7 6F            [ 4] 1592 	ld	l,a
   56C8 3E 72         [ 7] 1593 	ld	a,#>(_camino)
   56CA CE 00         [ 7] 1594 	adc	a, #0x00
   56CC 67            [ 4] 1595 	ld	h,a
   56CD 7E            [ 7] 1596 	ld	a,(hl)
   56CE DD 77 F1      [19] 1597 	ld	-15 (ix),a
                           1598 ;src/pathfinding.c:267: }
   56D1 C3 2D 55      [10] 1599 	jp	00116$
   56D4                    1600 00118$:
                           1601 ;src/pathfinding.c:272: if(problem == 0){
   56D4 DD 7E F5      [19] 1602 	ld	a,-11 (ix)
   56D7 B7            [ 4] 1603 	or	a, a
   56D8 20 72         [12] 1604 	jr	NZ,00127$
                           1605 ;src/pathfinding.c:273: if(sol_tam < 70){
   56DA 3A D9 69      [13] 1606 	ld	a,(#_sol_tam + 0)
   56DD D6 46         [ 7] 1607 	sub	a, #0x46
   56DF 30 0C         [12] 1608 	jr	NC,00120$
                           1609 ;src/pathfinding.c:274: enemy->longitud_camino = sol_tam;
   56E1 DD 6E FA      [19] 1610 	ld	l,-6 (ix)
   56E4 DD 66 FB      [19] 1611 	ld	h,-5 (ix)
   56E7 3A D9 69      [13] 1612 	ld	a,(#_sol_tam + 0)
   56EA 77            [ 7] 1613 	ld	(hl),a
   56EB 18 08         [12] 1614 	jr	00137$
   56ED                    1615 00120$:
                           1616 ;src/pathfinding.c:276: enemy->longitud_camino = 70;
   56ED DD 6E FA      [19] 1617 	ld	l,-6 (ix)
   56F0 DD 66 FB      [19] 1618 	ld	h,-5 (ix)
   56F3 36 46         [10] 1619 	ld	(hl),#0x46
                           1620 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   56F5                    1621 00137$:
   56F5 DD 7E FE      [19] 1622 	ld	a,-2 (ix)
   56F8 C6 16         [ 7] 1623 	add	a, #0x16
   56FA DD 77 FC      [19] 1624 	ld	-4 (ix),a
   56FD DD 7E FF      [19] 1625 	ld	a,-1 (ix)
   5700 CE 00         [ 7] 1626 	adc	a, #0x00
   5702 DD 77 FD      [19] 1627 	ld	-3 (ix),a
   5705 DD 36 F6 00   [19] 1628 	ld	-10 (ix),#0x00
   5709                    1629 00125$:
                           1630 ;src/pathfinding.c:280: enemy->camino[j] = camino[j];
   5709 DD 7E F6      [19] 1631 	ld	a,-10 (ix)
   570C DD 77 F7      [19] 1632 	ld	-9 (ix),a
   570F DD 36 F8 00   [19] 1633 	ld	-8 (ix),#0x00
   5713 DD 7E FC      [19] 1634 	ld	a,-4 (ix)
   5716 DD 86 F7      [19] 1635 	add	a, -9 (ix)
   5719 DD 77 F7      [19] 1636 	ld	-9 (ix),a
   571C DD 7E FD      [19] 1637 	ld	a,-3 (ix)
   571F DD 8E F8      [19] 1638 	adc	a, -8 (ix)
   5722 DD 77 F8      [19] 1639 	ld	-8 (ix),a
   5725 3E 1A         [ 7] 1640 	ld	a,#<(_camino)
   5727 DD 86 F6      [19] 1641 	add	a, -10 (ix)
   572A DD 77 FA      [19] 1642 	ld	-6 (ix),a
   572D 3E 72         [ 7] 1643 	ld	a,#>(_camino)
   572F CE 00         [ 7] 1644 	adc	a, #0x00
   5731 DD 77 FB      [19] 1645 	ld	-5 (ix),a
   5734 DD 6E FA      [19] 1646 	ld	l,-6 (ix)
   5737 DD 66 FB      [19] 1647 	ld	h,-5 (ix)
   573A 4E            [ 7] 1648 	ld	c,(hl)
   573B DD 6E F7      [19] 1649 	ld	l,-9 (ix)
   573E DD 66 F8      [19] 1650 	ld	h,-8 (ix)
   5741 71            [ 7] 1651 	ld	(hl),c
                           1652 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   5742 DD 34 F6      [23] 1653 	inc	-10 (ix)
   5745 DD 7E F6      [19] 1654 	ld	a,-10 (ix)
   5748 D6 46         [ 7] 1655 	sub	a, #0x46
   574A 38 BD         [12] 1656 	jr	C,00125$
   574C                    1657 00127$:
   574C DD F9         [10] 1658 	ld	sp, ix
   574E DD E1         [14] 1659 	pop	ix
   5750 C9            [10] 1660 	ret
                           1661 	.area _CODE
                           1662 	.area _INITIALIZER
                           1663 	.area _CABS (ABS)
