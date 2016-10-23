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
   69EC                      28 _sol_tam::
   69EC                      29 	.ds 1
   69ED                      30 _sol_matriz::
   69ED                      31 	.ds 2112
   722D                      32 _camino::
   722D                      33 	.ds 70
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
   4B92                      62 _abs::
   4B92 DD E5         [15]   63 	push	ix
   4B94 DD 21 00 00   [14]   64 	ld	ix,#0
   4B98 DD 39         [15]   65 	add	ix,sp
   4B9A F5            [11]   66 	push	af
   4B9B F5            [11]   67 	push	af
                             68 ;src/pathfinding.c:16: const i16 ret[2] = { n, -n };
   4B9C 21 00 00      [10]   69 	ld	hl,#0x0000
   4B9F 39            [11]   70 	add	hl,sp
   4BA0 4D            [ 4]   71 	ld	c,l
   4BA1 44            [ 4]   72 	ld	b,h
   4BA2 DD 7E 04      [19]   73 	ld	a,4 (ix)
   4BA5 77            [ 7]   74 	ld	(hl),a
   4BA6 23            [ 6]   75 	inc	hl
   4BA7 DD 7E 05      [19]   76 	ld	a,5 (ix)
   4BAA 77            [ 7]   77 	ld	(hl),a
   4BAB 69            [ 4]   78 	ld	l, c
   4BAC 60            [ 4]   79 	ld	h, b
   4BAD 23            [ 6]   80 	inc	hl
   4BAE 23            [ 6]   81 	inc	hl
   4BAF AF            [ 4]   82 	xor	a, a
   4BB0 DD 96 04      [19]   83 	sub	a, 4 (ix)
   4BB3 5F            [ 4]   84 	ld	e,a
   4BB4 3E 00         [ 7]   85 	ld	a, #0x00
   4BB6 DD 9E 05      [19]   86 	sbc	a, 5 (ix)
   4BB9 57            [ 4]   87 	ld	d,a
   4BBA 73            [ 7]   88 	ld	(hl),e
   4BBB 23            [ 6]   89 	inc	hl
   4BBC 72            [ 7]   90 	ld	(hl),d
                             91 ;src/pathfinding.c:17: return ret[n<0];
   4BBD DD 7E 05      [19]   92 	ld	a,5 (ix)
   4BC0 07            [ 4]   93 	rlca
   4BC1 E6 01         [ 7]   94 	and	a,#0x01
   4BC3 6F            [ 4]   95 	ld	l,a
   4BC4 17            [ 4]   96 	rla
   4BC5 9F            [ 4]   97 	sbc	a, a
   4BC6 67            [ 4]   98 	ld	h,a
   4BC7 29            [11]   99 	add	hl, hl
   4BC8 09            [11]  100 	add	hl,bc
   4BC9 4E            [ 7]  101 	ld	c,(hl)
   4BCA 23            [ 6]  102 	inc	hl
   4BCB 66            [ 7]  103 	ld	h,(hl)
   4BCC 69            [ 4]  104 	ld	l, c
   4BCD DD F9         [10]  105 	ld	sp, ix
   4BCF DD E1         [14]  106 	pop	ix
   4BD1 C9            [10]  107 	ret
   4BD2                     108 _bitWeights:
   4BD2 01 00               109 	.dw #0x0001
   4BD4 02 00               110 	.dw #0x0002
   4BD6 04 00               111 	.dw #0x0004
   4BD8 08 00               112 	.dw #0x0008
   4BDA 10 00               113 	.dw #0x0010
   4BDC 20 00               114 	.dw #0x0020
   4BDE 40 00               115 	.dw #0x0040
   4BE0 80 00               116 	.dw #0x0080
                            117 ;src/pathfinding.c:20: u8 getBit(u8 *array, u16 pos)
                            118 ;	---------------------------------
                            119 ; Function getBit
                            120 ; ---------------------------------
   4BE2                     121 _getBit::
   4BE2 DD E5         [15]  122 	push	ix
   4BE4 DD 21 00 00   [14]  123 	ld	ix,#0
   4BE8 DD 39         [15]  124 	add	ix,sp
                            125 ;src/pathfinding.c:25: byteV = array[pos/8];
   4BEA DD 4E 06      [19]  126 	ld	c,6 (ix)
   4BED DD 46 07      [19]  127 	ld	b,7 (ix)
   4BF0 CB 38         [ 8]  128 	srl	b
   4BF2 CB 19         [ 8]  129 	rr	c
   4BF4 CB 38         [ 8]  130 	srl	b
   4BF6 CB 19         [ 8]  131 	rr	c
   4BF8 CB 38         [ 8]  132 	srl	b
   4BFA CB 19         [ 8]  133 	rr	c
   4BFC DD 6E 04      [19]  134 	ld	l,4 (ix)
   4BFF DD 66 05      [19]  135 	ld	h,5 (ix)
   4C02 09            [11]  136 	add	hl,bc
   4C03 4E            [ 7]  137 	ld	c,(hl)
   4C04 06 00         [ 7]  138 	ld	b,#0x00
                            139 ;src/pathfinding.c:26: bitV = bitWeights[pos%8];
   4C06 DD 7E 06      [19]  140 	ld	a,6 (ix)
   4C09 E6 07         [ 7]  141 	and	a, #0x07
   4C0B 6F            [ 4]  142 	ld	l,a
   4C0C 26 00         [ 7]  143 	ld	h,#0x00
   4C0E 29            [11]  144 	add	hl, hl
   4C0F 11 D2 4B      [10]  145 	ld	de,#_bitWeights
   4C12 19            [11]  146 	add	hl,de
   4C13 5E            [ 7]  147 	ld	e,(hl)
   4C14 23            [ 6]  148 	inc	hl
   4C15 56            [ 7]  149 	ld	d,(hl)
                            150 ;src/pathfinding.c:27: return (byteV & bitV) == bitV;
   4C16 79            [ 4]  151 	ld	a,c
   4C17 A3            [ 4]  152 	and	a, e
   4C18 4F            [ 4]  153 	ld	c,a
   4C19 78            [ 4]  154 	ld	a,b
   4C1A A2            [ 4]  155 	and	a, d
   4C1B 47            [ 4]  156 	ld	b,a
   4C1C 7B            [ 4]  157 	ld	a,e
   4C1D 91            [ 4]  158 	sub	a, c
   4C1E 20 08         [12]  159 	jr	NZ,00103$
   4C20 7A            [ 4]  160 	ld	a,d
   4C21 90            [ 4]  161 	sub	a, b
   4C22 20 04         [12]  162 	jr	NZ,00103$
   4C24 3E 01         [ 7]  163 	ld	a,#0x01
   4C26 18 01         [12]  164 	jr	00104$
   4C28                     165 00103$:
   4C28 AF            [ 4]  166 	xor	a,a
   4C29                     167 00104$:
   4C29 6F            [ 4]  168 	ld	l,a
   4C2A DD E1         [14]  169 	pop	ix
   4C2C C9            [10]  170 	ret
                            171 ;src/pathfinding.c:30: void setBit(u8 *array, u16 pos, u16 value)
                            172 ;	---------------------------------
                            173 ; Function setBit
                            174 ; ---------------------------------
   4C2D                     175 _setBit::
   4C2D DD E5         [15]  176 	push	ix
   4C2F DD 21 00 00   [14]  177 	ld	ix,#0
   4C33 DD 39         [15]  178 	add	ix,sp
                            179 ;src/pathfinding.c:36: bytePos = pos/8;
   4C35 DD 5E 06      [19]  180 	ld	e,6 (ix)
   4C38 DD 56 07      [19]  181 	ld	d,7 (ix)
   4C3B CB 3A         [ 8]  182 	srl	d
   4C3D CB 1B         [ 8]  183 	rr	e
   4C3F CB 3A         [ 8]  184 	srl	d
   4C41 CB 1B         [ 8]  185 	rr	e
   4C43 CB 3A         [ 8]  186 	srl	d
   4C45 CB 1B         [ 8]  187 	rr	e
                            188 ;src/pathfinding.c:38: bitV = bitWeights[pos%8];
   4C47 01 D2 4B      [10]  189 	ld	bc,#_bitWeights+0
   4C4A DD 7E 06      [19]  190 	ld	a,6 (ix)
   4C4D E6 07         [ 7]  191 	and	a, #0x07
   4C4F 6F            [ 4]  192 	ld	l,a
   4C50 26 00         [ 7]  193 	ld	h,#0x00
   4C52 29            [11]  194 	add	hl, hl
   4C53 09            [11]  195 	add	hl,bc
   4C54 4E            [ 7]  196 	ld	c,(hl)
   4C55 23            [ 6]  197 	inc	hl
   4C56 46            [ 7]  198 	ld	b,(hl)
                            199 ;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4C57 DD 6E 04      [19]  200 	ld	l,4 (ix)
   4C5A DD 66 05      [19]  201 	ld	h,5 (ix)
   4C5D 19            [11]  202 	add	hl,de
                            203 ;src/pathfinding.c:40: if(value == 0)
   4C5E DD 7E 09      [19]  204 	ld	a,9 (ix)
   4C61 DD B6 08      [19]  205 	or	a,8 (ix)
   4C64 20 20         [12]  206 	jr	NZ,00106$
                            207 ;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4C66 E5            [11]  208 	push	hl
   4C67 C5            [11]  209 	push	bc
   4C68 DD 5E 06      [19]  210 	ld	e,6 (ix)
   4C6B DD 56 07      [19]  211 	ld	d,7 (ix)
   4C6E D5            [11]  212 	push	de
   4C6F DD 5E 04      [19]  213 	ld	e,4 (ix)
   4C72 DD 56 05      [19]  214 	ld	d,5 (ix)
   4C75 D5            [11]  215 	push	de
   4C76 CD E2 4B      [17]  216 	call	_getBit
   4C79 F1            [10]  217 	pop	af
   4C7A F1            [10]  218 	pop	af
   4C7B 7D            [ 4]  219 	ld	a,l
   4C7C C1            [10]  220 	pop	bc
   4C7D E1            [10]  221 	pop	hl
   4C7E B7            [ 4]  222 	or	a, a
   4C7F 28 23         [12]  223 	jr	Z,00108$
   4C81 7E            [ 7]  224 	ld	a, (hl)
   4C82 91            [ 4]  225 	sub	a, c
   4C83 77            [ 7]  226 	ld	(hl),a
   4C84 18 1E         [12]  227 	jr	00108$
   4C86                     228 00106$:
                            229 ;src/pathfinding.c:46: if(getBit(array, pos) == 0) array[bytePos] += bitV;
   4C86 E5            [11]  230 	push	hl
   4C87 C5            [11]  231 	push	bc
   4C88 DD 5E 06      [19]  232 	ld	e,6 (ix)
   4C8B DD 56 07      [19]  233 	ld	d,7 (ix)
   4C8E D5            [11]  234 	push	de
   4C8F DD 5E 04      [19]  235 	ld	e,4 (ix)
   4C92 DD 56 05      [19]  236 	ld	d,5 (ix)
   4C95 D5            [11]  237 	push	de
   4C96 CD E2 4B      [17]  238 	call	_getBit
   4C99 F1            [10]  239 	pop	af
   4C9A F1            [10]  240 	pop	af
   4C9B 7D            [ 4]  241 	ld	a,l
   4C9C C1            [10]  242 	pop	bc
   4C9D E1            [10]  243 	pop	hl
   4C9E B7            [ 4]  244 	or	a, a
   4C9F 20 03         [12]  245 	jr	NZ,00108$
   4CA1 7E            [ 7]  246 	ld	a, (hl)
   4CA2 81            [ 4]  247 	add	a, c
   4CA3 77            [ 7]  248 	ld	(hl),a
   4CA4                     249 00108$:
   4CA4 DD E1         [14]  250 	pop	ix
   4CA6 C9            [10]  251 	ret
                            252 ;src/pathfinding.c:51: u8 anyadirALista(u8 x, u8 y){
                            253 ;	---------------------------------
                            254 ; Function anyadirALista
                            255 ; ---------------------------------
   4CA7                     256 _anyadirALista::
                            257 ;src/pathfinding.c:52: u8 anyadido = 0;
   4CA7 0E 00         [ 7]  258 	ld	c,#0x00
                            259 ;src/pathfinding.c:54: if(sol_tam < 70){
   4CA9 3A EC 69      [13]  260 	ld	a,(#_sol_tam + 0)
   4CAC D6 46         [ 7]  261 	sub	a, #0x46
   4CAE 30 33         [12]  262 	jr	NC,00102$
                            263 ;src/pathfinding.c:55: camino[sol_tam-1] = x;
   4CB0 01 2D 72      [10]  264 	ld	bc,#_camino+0
   4CB3 21 EC 69      [10]  265 	ld	hl,#_sol_tam + 0
   4CB6 5E            [ 7]  266 	ld	e, (hl)
   4CB7 1D            [ 4]  267 	dec	e
   4CB8 6B            [ 4]  268 	ld	l,e
   4CB9 26 00         [ 7]  269 	ld	h,#0x00
   4CBB 09            [11]  270 	add	hl,bc
   4CBC FD 21 02 00   [14]  271 	ld	iy,#2
   4CC0 FD 39         [15]  272 	add	iy,sp
   4CC2 FD 7E 00      [19]  273 	ld	a,0 (iy)
   4CC5 77            [ 7]  274 	ld	(hl),a
                            275 ;src/pathfinding.c:56: sol_tam++;
   4CC6 21 EC 69      [10]  276 	ld	hl, #_sol_tam+0
   4CC9 34            [11]  277 	inc	(hl)
                            278 ;src/pathfinding.c:57: camino[sol_tam-1] = y;
   4CCA 21 EC 69      [10]  279 	ld	hl,#_sol_tam + 0
   4CCD 5E            [ 7]  280 	ld	e, (hl)
   4CCE 1D            [ 4]  281 	dec	e
   4CCF 6B            [ 4]  282 	ld	l,e
   4CD0 26 00         [ 7]  283 	ld	h,#0x00
   4CD2 09            [11]  284 	add	hl,bc
   4CD3 FD 21 03 00   [14]  285 	ld	iy,#3
   4CD7 FD 39         [15]  286 	add	iy,sp
   4CD9 FD 7E 00      [19]  287 	ld	a,0 (iy)
   4CDC 77            [ 7]  288 	ld	(hl),a
                            289 ;src/pathfinding.c:58: sol_tam++;
   4CDD 21 EC 69      [10]  290 	ld	hl, #_sol_tam+0
   4CE0 34            [11]  291 	inc	(hl)
                            292 ;src/pathfinding.c:59: anyadido = 1;
   4CE1 0E 01         [ 7]  293 	ld	c,#0x01
   4CE3                     294 00102$:
                            295 ;src/pathfinding.c:62: return anyadido;
   4CE3 69            [ 4]  296 	ld	l,c
   4CE4 C9            [10]  297 	ret
                            298 ;src/pathfinding.c:66: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            299 ;	---------------------------------
                            300 ; Function adjacentTiles
                            301 ; ---------------------------------
   4CE5                     302 _adjacentTiles::
   4CE5 DD E5         [15]  303 	push	ix
   4CE7 DD 21 00 00   [14]  304 	ld	ix,#0
   4CEB DD 39         [15]  305 	add	ix,sp
   4CED 21 D1 FF      [10]  306 	ld	hl,#-47
   4CF0 39            [11]  307 	add	hl,sp
   4CF1 F9            [ 6]  308 	ld	sp,hl
                            309 ;src/pathfinding.c:67: u8 resultado = 4;
   4CF2 DD 36 D1 04   [19]  310 	ld	-47 (ix),#0x04
                            311 ;src/pathfinding.c:69: i16 dist1 = 0;
   4CF6 DD 36 D8 00   [19]  312 	ld	-40 (ix),#0x00
   4CFA DD 36 D9 00   [19]  313 	ld	-39 (ix),#0x00
                            314 ;src/pathfinding.c:70: i16 dist2 = 0;
   4CFE DD 36 D4 00   [19]  315 	ld	-44 (ix),#0x00
   4D02 DD 36 D5 00   [19]  316 	ld	-43 (ix),#0x00
                            317 ;src/pathfinding.c:71: i16 dist3 = 0;
   4D06 DD 36 E0 00   [19]  318 	ld	-32 (ix),#0x00
   4D0A DD 36 E1 00   [19]  319 	ld	-31 (ix),#0x00
                            320 ;src/pathfinding.c:75: i16 heu_derecha = 0;
   4D0E DD 36 D6 00   [19]  321 	ld	-42 (ix),#0x00
   4D12 DD 36 D7 00   [19]  322 	ld	-41 (ix),#0x00
                            323 ;src/pathfinding.c:76: i16 heu_izquierda = 0;
   4D16 DD 36 DC 00   [19]  324 	ld	-36 (ix),#0x00
   4D1A DD 36 DD 00   [19]  325 	ld	-35 (ix),#0x00
                            326 ;src/pathfinding.c:77: i16 heu_arriba = 0;
   4D1E DD 36 DA 00   [19]  327 	ld	-38 (ix),#0x00
   4D22 DD 36 DB 00   [19]  328 	ld	-37 (ix),#0x00
                            329 ;src/pathfinding.c:78: i16 heu_abajo = 0;
   4D26 DD 36 D2 00   [19]  330 	ld	-46 (ix),#0x00
   4D2A DD 36 D3 00   [19]  331 	ld	-45 (ix),#0x00
                            332 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4D2E DD 7E 05      [19]  333 	ld	a,5 (ix)
   4D31 DD 77 FC      [19]  334 	ld	-4 (ix),a
   4D34 DD 36 FD 00   [19]  335 	ld	-3 (ix),#0x00
   4D38 DD 7E 04      [19]  336 	ld	a,4 (ix)
   4D3B DD 77 EA      [19]  337 	ld	-22 (ix),a
   4D3E DD 36 EB 00   [19]  338 	ld	-21 (ix),#0x00
   4D42 DD 7E FC      [19]  339 	ld	a,-4 (ix)
   4D45 C6 E8         [ 7]  340 	add	a,#0xE8
   4D47 DD 77 F8      [19]  341 	ld	-8 (ix),a
   4D4A DD 7E FD      [19]  342 	ld	a,-3 (ix)
   4D4D CE FF         [ 7]  343 	adc	a,#0xFF
   4D4F DD 77 F9      [19]  344 	ld	-7 (ix),a
   4D52 DD 7E EA      [19]  345 	ld	a,-22 (ix)
   4D55 C6 FF         [ 7]  346 	add	a,#0xFF
   4D57 DD 77 F4      [19]  347 	ld	-12 (ix),a
   4D5A DD 7E EB      [19]  348 	ld	a,-21 (ix)
   4D5D CE FF         [ 7]  349 	adc	a,#0xFF
   4D5F DD 77 F5      [19]  350 	ld	-11 (ix),a
                            351 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4D62 DD 7E EA      [19]  352 	ld	a,-22 (ix)
   4D65 C6 01         [ 7]  353 	add	a, #0x01
   4D67 DD 77 EC      [19]  354 	ld	-20 (ix),a
   4D6A DD 7E EB      [19]  355 	ld	a,-21 (ix)
   4D6D CE 00         [ 7]  356 	adc	a, #0x00
   4D6F DD 77 ED      [19]  357 	ld	-19 (ix),a
                            358 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4D72 DD 7E FC      [19]  359 	ld	a,-4 (ix)
   4D75 C6 E6         [ 7]  360 	add	a,#0xE6
   4D77 DD 77 FA      [19]  361 	ld	-6 (ix),a
   4D7A DD 7E FD      [19]  362 	ld	a,-3 (ix)
   4D7D CE FF         [ 7]  363 	adc	a,#0xFF
   4D7F DD 77 FB      [19]  364 	ld	-5 (ix),a
                            365 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4D82 DD 7E FC      [19]  366 	ld	a,-4 (ix)
   4D85 C6 EA         [ 7]  367 	add	a, #0xEA
   4D87 DD 77 F6      [19]  368 	ld	-10 (ix),a
   4D8A DD 7E FD      [19]  369 	ld	a,-3 (ix)
   4D8D CE FF         [ 7]  370 	adc	a, #0xFF
   4D8F DD 77 F7      [19]  371 	ld	-9 (ix),a
                            372 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4D92 DD 4E F8      [19]  373 	ld	c,-8 (ix)
   4D95 DD 46 F9      [19]  374 	ld	b,-7 (ix)
   4D98 69            [ 4]  375 	ld	l, c
   4D99 60            [ 4]  376 	ld	h, b
   4D9A 29            [11]  377 	add	hl, hl
   4D9B 29            [11]  378 	add	hl, hl
   4D9C 09            [11]  379 	add	hl, bc
   4D9D 29            [11]  380 	add	hl, hl
   4D9E 29            [11]  381 	add	hl, hl
   4D9F 29            [11]  382 	add	hl, hl
   4DA0 29            [11]  383 	add	hl, hl
   4DA1 EB            [ 4]  384 	ex	de,hl
                            385 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4DA2 DD 4E FA      [19]  386 	ld	c,-6 (ix)
   4DA5 DD 46 FB      [19]  387 	ld	b,-5 (ix)
   4DA8 69            [ 4]  388 	ld	l, c
   4DA9 60            [ 4]  389 	ld	h, b
   4DAA 29            [11]  390 	add	hl, hl
   4DAB 29            [11]  391 	add	hl, hl
   4DAC 09            [11]  392 	add	hl, bc
   4DAD 29            [11]  393 	add	hl, hl
   4DAE 29            [11]  394 	add	hl, hl
   4DAF 29            [11]  395 	add	hl, hl
   4DB0 29            [11]  396 	add	hl, hl
   4DB1 4D            [ 4]  397 	ld	c,l
   4DB2 44            [ 4]  398 	ld	b,h
                            399 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4DB3 D5            [11]  400 	push	de
   4DB4 DD 5E F6      [19]  401 	ld	e,-10 (ix)
   4DB7 DD 56 F7      [19]  402 	ld	d,-9 (ix)
   4DBA 6B            [ 4]  403 	ld	l, e
   4DBB 62            [ 4]  404 	ld	h, d
   4DBC 29            [11]  405 	add	hl, hl
   4DBD 29            [11]  406 	add	hl, hl
   4DBE 19            [11]  407 	add	hl, de
   4DBF 29            [11]  408 	add	hl, hl
   4DC0 29            [11]  409 	add	hl, hl
   4DC1 29            [11]  410 	add	hl, hl
   4DC2 29            [11]  411 	add	hl, hl
   4DC3 D1            [10]  412 	pop	de
                            413 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4DC4 DD 7E F4      [19]  414 	ld	a,-12 (ix)
   4DC7 83            [ 4]  415 	add	a, e
   4DC8 DD 77 E2      [19]  416 	ld	-30 (ix),a
   4DCB DD 7E F5      [19]  417 	ld	a,-11 (ix)
   4DCE 8A            [ 4]  418 	adc	a, d
   4DCF DD 77 E3      [19]  419 	ld	-29 (ix),a
                            420 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4DD2 DD 7E EC      [19]  421 	ld	a,-20 (ix)
   4DD5 83            [ 4]  422 	add	a, e
   4DD6 DD 77 E6      [19]  423 	ld	-26 (ix),a
   4DD9 DD 7E ED      [19]  424 	ld	a,-19 (ix)
   4DDC 8A            [ 4]  425 	adc	a, d
   4DDD DD 77 E7      [19]  426 	ld	-25 (ix),a
                            427 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4DE0 DD 7E EA      [19]  428 	ld	a,-22 (ix)
   4DE3 81            [ 4]  429 	add	a, c
   4DE4 DD 77 F2      [19]  430 	ld	-14 (ix),a
   4DE7 DD 7E EB      [19]  431 	ld	a,-21 (ix)
   4DEA 88            [ 4]  432 	adc	a, b
   4DEB DD 77 F3      [19]  433 	ld	-13 (ix),a
                            434 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4DEE DD 7E EA      [19]  435 	ld	a,-22 (ix)
   4DF1 85            [ 4]  436 	add	a, l
   4DF2 DD 77 E4      [19]  437 	ld	-28 (ix),a
   4DF5 DD 7E EB      [19]  438 	ld	a,-21 (ix)
   4DF8 8C            [ 4]  439 	adc	a, h
   4DF9 DD 77 E5      [19]  440 	ld	-27 (ix),a
                            441 ;src/pathfinding.c:82: if(x == f_x){
   4DFC DD 7E 04      [19]  442 	ld	a,4 (ix)
   4DFF DD 96 08      [19]  443 	sub	a, 8 (ix)
   4E02 20 5C         [12]  444 	jr	NZ,00130$
                            445 ;src/pathfinding.c:84: if(s_x < x){
   4E04 DD 7E 06      [19]  446 	ld	a,6 (ix)
   4E07 DD 96 04      [19]  447 	sub	a, 4 (ix)
   4E0A 30 19         [12]  448 	jr	NC,00102$
                            449 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4E0C 21 01 00      [10]  450 	ld	hl,#0x0001
   4E0F E5            [11]  451 	push	hl
   4E10 DD 6E E2      [19]  452 	ld	l,-30 (ix)
   4E13 DD 66 E3      [19]  453 	ld	h,-29 (ix)
   4E16 E5            [11]  454 	push	hl
   4E17 21 ED 69      [10]  455 	ld	hl,#_sol_matriz
   4E1A E5            [11]  456 	push	hl
   4E1B CD 2D 4C      [17]  457 	call	_setBit
   4E1E 21 06 00      [10]  458 	ld	hl,#6
   4E21 39            [11]  459 	add	hl,sp
   4E22 F9            [ 6]  460 	ld	sp,hl
   4E23 18 17         [12]  461 	jr	00103$
   4E25                     462 00102$:
                            463 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4E25 21 01 00      [10]  464 	ld	hl,#0x0001
   4E28 E5            [11]  465 	push	hl
   4E29 DD 6E E6      [19]  466 	ld	l,-26 (ix)
   4E2C DD 66 E7      [19]  467 	ld	h,-25 (ix)
   4E2F E5            [11]  468 	push	hl
   4E30 21 ED 69      [10]  469 	ld	hl,#_sol_matriz
   4E33 E5            [11]  470 	push	hl
   4E34 CD 2D 4C      [17]  471 	call	_setBit
   4E37 21 06 00      [10]  472 	ld	hl,#6
   4E3A 39            [11]  473 	add	hl,sp
   4E3B F9            [ 6]  474 	ld	sp,hl
   4E3C                     475 00103$:
                            476 ;src/pathfinding.c:91: if(y < f_y)
   4E3C DD 7E 05      [19]  477 	ld	a,5 (ix)
   4E3F DD 96 09      [19]  478 	sub	a, 9 (ix)
   4E42 30 08         [12]  479 	jr	NC,00105$
                            480 ;src/pathfinding.c:92: heu_abajo = -1;
   4E44 DD 36 D2 FF   [19]  481 	ld	-46 (ix),#0xFF
   4E48 DD 36 D3 FF   [19]  482 	ld	-45 (ix),#0xFF
   4E4C                     483 00105$:
                            484 ;src/pathfinding.c:94: if(y > f_y)
   4E4C DD 7E 09      [19]  485 	ld	a,9 (ix)
   4E4F DD 96 05      [19]  486 	sub	a, 5 (ix)
   4E52 D2 1A 4F      [10]  487 	jp	NC,00131$
                            488 ;src/pathfinding.c:95: heu_arriba = -1;
   4E55 DD 36 DA FF   [19]  489 	ld	-38 (ix),#0xFF
   4E59 DD 36 DB FF   [19]  490 	ld	-37 (ix),#0xFF
   4E5D C3 1A 4F      [10]  491 	jp	00131$
   4E60                     492 00130$:
                            493 ;src/pathfinding.c:97: }else if(y == f_y){
   4E60 DD 7E 05      [19]  494 	ld	a,5 (ix)
   4E63 DD 96 09      [19]  495 	sub	a, 9 (ix)
   4E66 20 5A         [12]  496 	jr	NZ,00127$
                            497 ;src/pathfinding.c:99: if(s_y < y){
   4E68 DD 7E 07      [19]  498 	ld	a,7 (ix)
   4E6B DD 96 05      [19]  499 	sub	a, 5 (ix)
   4E6E 30 19         [12]  500 	jr	NC,00109$
                            501 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4E70 21 01 00      [10]  502 	ld	hl,#0x0001
   4E73 E5            [11]  503 	push	hl
   4E74 DD 6E F2      [19]  504 	ld	l,-14 (ix)
   4E77 DD 66 F3      [19]  505 	ld	h,-13 (ix)
   4E7A E5            [11]  506 	push	hl
   4E7B 21 ED 69      [10]  507 	ld	hl,#_sol_matriz
   4E7E E5            [11]  508 	push	hl
   4E7F CD 2D 4C      [17]  509 	call	_setBit
   4E82 21 06 00      [10]  510 	ld	hl,#6
   4E85 39            [11]  511 	add	hl,sp
   4E86 F9            [ 6]  512 	ld	sp,hl
   4E87 18 17         [12]  513 	jr	00110$
   4E89                     514 00109$:
                            515 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4E89 21 01 00      [10]  516 	ld	hl,#0x0001
   4E8C E5            [11]  517 	push	hl
   4E8D DD 6E E4      [19]  518 	ld	l,-28 (ix)
   4E90 DD 66 E5      [19]  519 	ld	h,-27 (ix)
   4E93 E5            [11]  520 	push	hl
   4E94 21 ED 69      [10]  521 	ld	hl,#_sol_matriz
   4E97 E5            [11]  522 	push	hl
   4E98 CD 2D 4C      [17]  523 	call	_setBit
   4E9B 21 06 00      [10]  524 	ld	hl,#6
   4E9E 39            [11]  525 	add	hl,sp
   4E9F F9            [ 6]  526 	ld	sp,hl
   4EA0                     527 00110$:
                            528 ;src/pathfinding.c:106: if(x < f_x)
   4EA0 DD 7E 04      [19]  529 	ld	a,4 (ix)
   4EA3 DD 96 08      [19]  530 	sub	a, 8 (ix)
   4EA6 30 08         [12]  531 	jr	NC,00112$
                            532 ;src/pathfinding.c:107: heu_derecha = -1;
   4EA8 DD 36 D6 FF   [19]  533 	ld	-42 (ix),#0xFF
   4EAC DD 36 D7 FF   [19]  534 	ld	-41 (ix),#0xFF
   4EB0                     535 00112$:
                            536 ;src/pathfinding.c:108: if(x > f_x)
   4EB0 DD 7E 08      [19]  537 	ld	a,8 (ix)
   4EB3 DD 96 04      [19]  538 	sub	a, 4 (ix)
   4EB6 30 62         [12]  539 	jr	NC,00131$
                            540 ;src/pathfinding.c:109: heu_izquierda = -1;
   4EB8 DD 36 DC FF   [19]  541 	ld	-36 (ix),#0xFF
   4EBC DD 36 DD FF   [19]  542 	ld	-35 (ix),#0xFF
   4EC0 18 58         [12]  543 	jr	00131$
   4EC2                     544 00127$:
                            545 ;src/pathfinding.c:115: if(s_y < f_y)
   4EC2 DD 7E 07      [19]  546 	ld	a,7 (ix)
   4EC5 DD 96 09      [19]  547 	sub	a, 9 (ix)
   4EC8 3E 00         [ 7]  548 	ld	a,#0x00
   4ECA 17            [ 4]  549 	rla
   4ECB 4F            [ 4]  550 	ld	c,a
                            551 ;src/pathfinding.c:114: if(s_x < f_x){
   4ECC DD 7E 06      [19]  552 	ld	a,6 (ix)
   4ECF DD 96 08      [19]  553 	sub	a, 8 (ix)
   4ED2 30 20         [12]  554 	jr	NC,00124$
                            555 ;src/pathfinding.c:115: if(s_y < f_y)
   4ED4 79            [ 4]  556 	ld	a,c
   4ED5 B7            [ 4]  557 	or	a, a
   4ED6 28 0A         [12]  558 	jr	Z,00116$
                            559 ;src/pathfinding.c:116: heu_abajo = -1;
   4ED8 DD 36 D2 FF   [19]  560 	ld	-46 (ix),#0xFF
   4EDC DD 36 D3 FF   [19]  561 	ld	-45 (ix),#0xFF
   4EE0 18 08         [12]  562 	jr	00117$
   4EE2                     563 00116$:
                            564 ;src/pathfinding.c:118: heu_arriba = -1;
   4EE2 DD 36 DA FF   [19]  565 	ld	-38 (ix),#0xFF
   4EE6 DD 36 DB FF   [19]  566 	ld	-37 (ix),#0xFF
   4EEA                     567 00117$:
                            568 ;src/pathfinding.c:120: heu_derecha = -1;
   4EEA DD 36 D6 FF   [19]  569 	ld	-42 (ix),#0xFF
   4EEE DD 36 D7 FF   [19]  570 	ld	-41 (ix),#0xFF
   4EF2 18 26         [12]  571 	jr	00131$
   4EF4                     572 00124$:
                            573 ;src/pathfinding.c:121: }else if(s_x > f_x){
   4EF4 DD 7E 08      [19]  574 	ld	a,8 (ix)
   4EF7 DD 96 06      [19]  575 	sub	a, 6 (ix)
   4EFA 30 1E         [12]  576 	jr	NC,00131$
                            577 ;src/pathfinding.c:123: if(s_y < f_y)
   4EFC 79            [ 4]  578 	ld	a,c
   4EFD B7            [ 4]  579 	or	a, a
   4EFE 28 0A         [12]  580 	jr	Z,00119$
                            581 ;src/pathfinding.c:124: heu_abajo = -1;
   4F00 DD 36 D2 FF   [19]  582 	ld	-46 (ix),#0xFF
   4F04 DD 36 D3 FF   [19]  583 	ld	-45 (ix),#0xFF
   4F08 18 08         [12]  584 	jr	00120$
   4F0A                     585 00119$:
                            586 ;src/pathfinding.c:126: heu_arriba = -1;
   4F0A DD 36 DA FF   [19]  587 	ld	-38 (ix),#0xFF
   4F0E DD 36 DB FF   [19]  588 	ld	-37 (ix),#0xFF
   4F12                     589 00120$:
                            590 ;src/pathfinding.c:128: heu_izquierda = -1;
   4F12 DD 36 DC FF   [19]  591 	ld	-36 (ix),#0xFF
   4F16 DD 36 DD FF   [19]  592 	ld	-35 (ix),#0xFF
   4F1A                     593 00131$:
                            594 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4F1A DD 7E FA      [19]  595 	ld	a,-6 (ix)
   4F1D DD 77 E8      [19]  596 	ld	-24 (ix),a
   4F20 DD 7E FB      [19]  597 	ld	a,-5 (ix)
   4F23 DD 77 E9      [19]  598 	ld	-23 (ix),a
   4F26 DD CB FB 7E   [20]  599 	bit	7, -5 (ix)
   4F2A 28 10         [12]  600 	jr	Z,00176$
   4F2C DD 7E FC      [19]  601 	ld	a,-4 (ix)
   4F2F C6 E9         [ 7]  602 	add	a, #0xE9
   4F31 DD 77 E8      [19]  603 	ld	-24 (ix),a
   4F34 DD 7E FD      [19]  604 	ld	a,-3 (ix)
   4F37 CE FF         [ 7]  605 	adc	a, #0xFF
   4F39 DD 77 E9      [19]  606 	ld	-23 (ix),a
   4F3C                     607 00176$:
   4F3C DD CB E9 2E   [23]  608 	sra	-23 (ix)
   4F40 DD CB E8 1E   [23]  609 	rr	-24 (ix)
   4F44 DD CB E9 2E   [23]  610 	sra	-23 (ix)
   4F48 DD CB E8 1E   [23]  611 	rr	-24 (ix)
   4F4C DD 4E E8      [19]  612 	ld	c,-24 (ix)
   4F4F DD 46 E9      [19]  613 	ld	b,-23 (ix)
   4F52 69            [ 4]  614 	ld	l, c
   4F53 60            [ 4]  615 	ld	h, b
   4F54 29            [11]  616 	add	hl, hl
   4F55 29            [11]  617 	add	hl, hl
   4F56 09            [11]  618 	add	hl, bc
   4F57 29            [11]  619 	add	hl, hl
   4F58 29            [11]  620 	add	hl, hl
   4F59 29            [11]  621 	add	hl, hl
   4F5A DD 75 E8      [19]  622 	ld	-24 (ix),l
   4F5D DD 74 E9      [19]  623 	ld	-23 (ix),h
   4F60 DD 7E 0A      [19]  624 	ld	a,10 (ix)
   4F63 DD 86 E8      [19]  625 	add	a, -24 (ix)
   4F66 DD 77 E8      [19]  626 	ld	-24 (ix),a
   4F69 DD 7E 0B      [19]  627 	ld	a,11 (ix)
   4F6C DD 8E E9      [19]  628 	adc	a, -23 (ix)
   4F6F DD 77 E9      [19]  629 	ld	-23 (ix),a
   4F72 DD 7E 04      [19]  630 	ld	a,4 (ix)
   4F75 CB 3F         [ 8]  631 	srl	a
   4F77 DD 77 FA      [19]  632 	ld	-6 (ix), a
   4F7A DD 86 E8      [19]  633 	add	a, -24 (ix)
   4F7D DD 77 E8      [19]  634 	ld	-24 (ix),a
   4F80 3E 00         [ 7]  635 	ld	a,#0x00
   4F82 DD 8E E9      [19]  636 	adc	a, -23 (ix)
   4F85 DD 77 E9      [19]  637 	ld	-23 (ix),a
   4F88 DD 6E E8      [19]  638 	ld	l,-24 (ix)
   4F8B DD 66 E9      [19]  639 	ld	h,-23 (ix)
   4F8E 7E            [ 7]  640 	ld	a,(hl)
   4F8F DD 77 E8      [19]  641 	ld	-24 (ix),a
                            642 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4F92 DD 7E 08      [19]  643 	ld	a,8 (ix)
   4F95 DD 77 F0      [19]  644 	ld	-16 (ix),a
   4F98 DD 36 F1 00   [19]  645 	ld	-15 (ix),#0x00
   4F9C DD 7E 09      [19]  646 	ld	a,9 (ix)
   4F9F DD 77 FE      [19]  647 	ld	-2 (ix),a
   4FA2 DD 36 FF 00   [19]  648 	ld	-1 (ix),#0x00
   4FA6 DD 7E F0      [19]  649 	ld	a,-16 (ix)
   4FA9 DD 96 EA      [19]  650 	sub	a, -22 (ix)
   4FAC DD 77 EE      [19]  651 	ld	-18 (ix),a
   4FAF DD 7E F1      [19]  652 	ld	a,-15 (ix)
   4FB2 DD 9E EB      [19]  653 	sbc	a, -21 (ix)
   4FB5 DD 77 EF      [19]  654 	ld	-17 (ix),a
                            655 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4FB8 3E 02         [ 7]  656 	ld	a,#0x02
   4FBA DD 96 E8      [19]  657 	sub	a, -24 (ix)
   4FBD DA 4B 50      [10]  658 	jp	C,00133$
   4FC0 DD 6E F2      [19]  659 	ld	l,-14 (ix)
   4FC3 DD 66 F3      [19]  660 	ld	h,-13 (ix)
   4FC6 E5            [11]  661 	push	hl
   4FC7 21 ED 69      [10]  662 	ld	hl,#_sol_matriz
   4FCA E5            [11]  663 	push	hl
   4FCB CD E2 4B      [17]  664 	call	_getBit
   4FCE F1            [10]  665 	pop	af
   4FCF F1            [10]  666 	pop	af
   4FD0 2D            [ 4]  667 	dec	l
   4FD1 28 78         [12]  668 	jr	Z,00133$
                            669 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4FD3 DD 6E EE      [19]  670 	ld	l,-18 (ix)
   4FD6 DD 66 EF      [19]  671 	ld	h,-17 (ix)
   4FD9 E5            [11]  672 	push	hl
   4FDA CD 92 4B      [17]  673 	call	_abs
   4FDD F1            [10]  674 	pop	af
   4FDE DD 74 E9      [19]  675 	ld	-23 (ix),h
   4FE1 DD 75 E8      [19]  676 	ld	-24 (ix),l
   4FE4 DD 7E FC      [19]  677 	ld	a,-4 (ix)
   4FE7 C6 FE         [ 7]  678 	add	a,#0xFE
   4FE9 DD 77 F2      [19]  679 	ld	-14 (ix),a
   4FEC DD 7E FD      [19]  680 	ld	a,-3 (ix)
   4FEF CE FF         [ 7]  681 	adc	a,#0xFF
   4FF1 DD 77 F3      [19]  682 	ld	-13 (ix),a
   4FF4 DD 7E FE      [19]  683 	ld	a,-2 (ix)
   4FF7 DD 96 F2      [19]  684 	sub	a, -14 (ix)
   4FFA DD 77 F2      [19]  685 	ld	-14 (ix),a
   4FFD DD 7E FF      [19]  686 	ld	a,-1 (ix)
   5000 DD 9E F3      [19]  687 	sbc	a, -13 (ix)
   5003 DD 77 F3      [19]  688 	ld	-13 (ix),a
   5006 DD 6E F2      [19]  689 	ld	l,-14 (ix)
   5009 DD 66 F3      [19]  690 	ld	h,-13 (ix)
   500C E5            [11]  691 	push	hl
   500D CD 92 4B      [17]  692 	call	_abs
   5010 F1            [10]  693 	pop	af
   5011 DD 74 F3      [19]  694 	ld	-13 (ix),h
   5014 DD 75 F2      [19]  695 	ld	-14 (ix),l
   5017 DD 7E E8      [19]  696 	ld	a,-24 (ix)
   501A DD 86 F2      [19]  697 	add	a, -14 (ix)
   501D DD 77 E8      [19]  698 	ld	-24 (ix),a
   5020 DD 7E E9      [19]  699 	ld	a,-23 (ix)
   5023 DD 8E F3      [19]  700 	adc	a, -13 (ix)
   5026 DD 77 E9      [19]  701 	ld	-23 (ix),a
   5029 DD 7E E8      [19]  702 	ld	a,-24 (ix)
   502C DD 86 DA      [19]  703 	add	a, -38 (ix)
   502F DD 77 E8      [19]  704 	ld	-24 (ix),a
   5032 DD 7E E9      [19]  705 	ld	a,-23 (ix)
   5035 DD 8E DB      [19]  706 	adc	a, -37 (ix)
   5038 DD 77 E9      [19]  707 	ld	-23 (ix),a
   503B DD 7E E8      [19]  708 	ld	a,-24 (ix)
   503E DD 77 D8      [19]  709 	ld	-40 (ix),a
   5041 DD 7E E9      [19]  710 	ld	a,-23 (ix)
   5044 DD 77 D9      [19]  711 	ld	-39 (ix),a
                            712 ;src/pathfinding.c:135: resultado = 0;
   5047 DD 36 D1 00   [19]  713 	ld	-47 (ix),#0x00
   504B                     714 00133$:
                            715 ;src/pathfinding.c:138: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   504B DD 7E F6      [19]  716 	ld	a,-10 (ix)
   504E DD 77 E8      [19]  717 	ld	-24 (ix),a
   5051 DD 7E F7      [19]  718 	ld	a,-9 (ix)
   5054 DD 77 E9      [19]  719 	ld	-23 (ix),a
   5057 DD CB F7 7E   [20]  720 	bit	7, -9 (ix)
   505B 28 10         [12]  721 	jr	Z,00177$
   505D DD 7E FC      [19]  722 	ld	a,-4 (ix)
   5060 C6 ED         [ 7]  723 	add	a, #0xED
   5062 DD 77 E8      [19]  724 	ld	-24 (ix),a
   5065 DD 7E FD      [19]  725 	ld	a,-3 (ix)
   5068 CE FF         [ 7]  726 	adc	a, #0xFF
   506A DD 77 E9      [19]  727 	ld	-23 (ix),a
   506D                     728 00177$:
   506D DD CB E9 2E   [23]  729 	sra	-23 (ix)
   5071 DD CB E8 1E   [23]  730 	rr	-24 (ix)
   5075 DD CB E9 2E   [23]  731 	sra	-23 (ix)
   5079 DD CB E8 1E   [23]  732 	rr	-24 (ix)
   507D DD 4E E8      [19]  733 	ld	c,-24 (ix)
   5080 DD 46 E9      [19]  734 	ld	b,-23 (ix)
   5083 69            [ 4]  735 	ld	l, c
   5084 60            [ 4]  736 	ld	h, b
   5085 29            [11]  737 	add	hl, hl
   5086 29            [11]  738 	add	hl, hl
   5087 09            [11]  739 	add	hl, bc
   5088 29            [11]  740 	add	hl, hl
   5089 29            [11]  741 	add	hl, hl
   508A 29            [11]  742 	add	hl, hl
   508B DD 75 E8      [19]  743 	ld	-24 (ix),l
   508E DD 74 E9      [19]  744 	ld	-23 (ix),h
   5091 DD 7E 0A      [19]  745 	ld	a,10 (ix)
   5094 DD 86 E8      [19]  746 	add	a, -24 (ix)
   5097 DD 77 E8      [19]  747 	ld	-24 (ix),a
   509A DD 7E 0B      [19]  748 	ld	a,11 (ix)
   509D DD 8E E9      [19]  749 	adc	a, -23 (ix)
   50A0 DD 77 E9      [19]  750 	ld	-23 (ix),a
   50A3 DD 7E E8      [19]  751 	ld	a,-24 (ix)
   50A6 DD 86 FA      [19]  752 	add	a, -6 (ix)
   50A9 DD 77 E8      [19]  753 	ld	-24 (ix),a
   50AC DD 7E E9      [19]  754 	ld	a,-23 (ix)
   50AF CE 00         [ 7]  755 	adc	a, #0x00
   50B1 DD 77 E9      [19]  756 	ld	-23 (ix),a
   50B4 DD 6E E8      [19]  757 	ld	l,-24 (ix)
   50B7 DD 66 E9      [19]  758 	ld	h,-23 (ix)
   50BA 7E            [ 7]  759 	ld	a,(hl)
   50BB DD 77 E8      [19]  760 	ld	-24 (ix),a
   50BE 3E 02         [ 7]  761 	ld	a,#0x02
   50C0 DD 96 E8      [19]  762 	sub	a, -24 (ix)
   50C3 DA 72 51      [10]  763 	jp	C,00141$
   50C6 DD 6E E4      [19]  764 	ld	l,-28 (ix)
   50C9 DD 66 E5      [19]  765 	ld	h,-27 (ix)
   50CC E5            [11]  766 	push	hl
   50CD 21 ED 69      [10]  767 	ld	hl,#_sol_matriz
   50D0 E5            [11]  768 	push	hl
   50D1 CD E2 4B      [17]  769 	call	_getBit
   50D4 F1            [10]  770 	pop	af
   50D5 F1            [10]  771 	pop	af
   50D6 2D            [ 4]  772 	dec	l
   50D7 CA 72 51      [10]  773 	jp	Z,00141$
                            774 ;src/pathfinding.c:139: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   50DA DD 6E EE      [19]  775 	ld	l,-18 (ix)
   50DD DD 66 EF      [19]  776 	ld	h,-17 (ix)
   50E0 E5            [11]  777 	push	hl
   50E1 CD 92 4B      [17]  778 	call	_abs
   50E4 F1            [10]  779 	pop	af
   50E5 DD 74 EF      [19]  780 	ld	-17 (ix),h
   50E8 DD 75 EE      [19]  781 	ld	-18 (ix),l
   50EB DD 7E FC      [19]  782 	ld	a,-4 (ix)
   50EE C6 02         [ 7]  783 	add	a, #0x02
   50F0 DD 77 E8      [19]  784 	ld	-24 (ix),a
   50F3 DD 7E FD      [19]  785 	ld	a,-3 (ix)
   50F6 CE 00         [ 7]  786 	adc	a, #0x00
   50F8 DD 77 E9      [19]  787 	ld	-23 (ix),a
   50FB DD 7E FE      [19]  788 	ld	a,-2 (ix)
   50FE DD 96 E8      [19]  789 	sub	a, -24 (ix)
   5101 DD 77 E8      [19]  790 	ld	-24 (ix),a
   5104 DD 7E FF      [19]  791 	ld	a,-1 (ix)
   5107 DD 9E E9      [19]  792 	sbc	a, -23 (ix)
   510A DD 77 E9      [19]  793 	ld	-23 (ix),a
   510D DD 6E E8      [19]  794 	ld	l,-24 (ix)
   5110 DD 66 E9      [19]  795 	ld	h,-23 (ix)
   5113 E5            [11]  796 	push	hl
   5114 CD 92 4B      [17]  797 	call	_abs
   5117 F1            [10]  798 	pop	af
   5118 DD 74 E9      [19]  799 	ld	-23 (ix),h
   511B DD 75 E8      [19]  800 	ld	-24 (ix),l
   511E DD 7E EE      [19]  801 	ld	a,-18 (ix)
   5121 DD 86 E8      [19]  802 	add	a, -24 (ix)
   5124 DD 77 EE      [19]  803 	ld	-18 (ix),a
   5127 DD 7E EF      [19]  804 	ld	a,-17 (ix)
   512A DD 8E E9      [19]  805 	adc	a, -23 (ix)
   512D DD 77 EF      [19]  806 	ld	-17 (ix),a
   5130 DD 7E D2      [19]  807 	ld	a,-46 (ix)
   5133 DD 86 EE      [19]  808 	add	a, -18 (ix)
   5136 DD 77 EE      [19]  809 	ld	-18 (ix),a
   5139 DD 7E D3      [19]  810 	ld	a,-45 (ix)
   513C DD 8E EF      [19]  811 	adc	a, -17 (ix)
   513F DD 77 EF      [19]  812 	ld	-17 (ix),a
   5142 DD 7E EE      [19]  813 	ld	a,-18 (ix)
   5145 DD 77 D4      [19]  814 	ld	-44 (ix),a
   5148 DD 7E EF      [19]  815 	ld	a,-17 (ix)
   514B DD 77 D5      [19]  816 	ld	-43 (ix),a
                            817 ;src/pathfinding.c:140: if(resultado == 0){
   514E DD 7E D1      [19]  818 	ld	a,-47 (ix)
   5151 B7            [ 4]  819 	or	a, a
   5152 20 1A         [12]  820 	jr	NZ,00138$
                            821 ;src/pathfinding.c:141: if(dist1 > dist2)
   5154 DD 7E D4      [19]  822 	ld	a,-44 (ix)
   5157 DD 96 D8      [19]  823 	sub	a, -40 (ix)
   515A DD 7E D5      [19]  824 	ld	a,-43 (ix)
   515D DD 9E D9      [19]  825 	sbc	a, -39 (ix)
   5160 E2 65 51      [10]  826 	jp	PO, 00340$
   5163 EE 80         [ 7]  827 	xor	a, #0x80
   5165                     828 00340$:
   5165 F2 72 51      [10]  829 	jp	P,00141$
                            830 ;src/pathfinding.c:142: resultado = 1;	
   5168 DD 36 D1 01   [19]  831 	ld	-47 (ix),#0x01
   516C 18 04         [12]  832 	jr	00141$
   516E                     833 00138$:
                            834 ;src/pathfinding.c:144: resultado = 1;
   516E DD 36 D1 01   [19]  835 	ld	-47 (ix),#0x01
   5172                     836 00141$:
                            837 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   5172 DD 7E F8      [19]  838 	ld	a,-8 (ix)
   5175 DD 77 EE      [19]  839 	ld	-18 (ix),a
   5178 DD 7E F9      [19]  840 	ld	a,-7 (ix)
   517B DD 77 EF      [19]  841 	ld	-17 (ix),a
   517E DD 7E F9      [19]  842 	ld	a,-7 (ix)
   5181 07            [ 4]  843 	rlca
   5182 E6 01         [ 7]  844 	and	a,#0x01
   5184 DD 77 E8      [19]  845 	ld	-24 (ix),a
   5187 DD 7E FC      [19]  846 	ld	a,-4 (ix)
   518A C6 EB         [ 7]  847 	add	a, #0xEB
   518C DD 77 E4      [19]  848 	ld	-28 (ix),a
   518F DD 7E FD      [19]  849 	ld	a,-3 (ix)
   5192 CE FF         [ 7]  850 	adc	a, #0xFF
   5194 DD 77 E5      [19]  851 	ld	-27 (ix),a
   5197 DD 7E E8      [19]  852 	ld	a,-24 (ix)
   519A B7            [ 4]  853 	or	a, a
   519B 28 0C         [12]  854 	jr	Z,00178$
   519D DD 7E E4      [19]  855 	ld	a,-28 (ix)
   51A0 DD 77 EE      [19]  856 	ld	-18 (ix),a
   51A3 DD 7E E5      [19]  857 	ld	a,-27 (ix)
   51A6 DD 77 EF      [19]  858 	ld	-17 (ix),a
   51A9                     859 00178$:
   51A9 DD CB EF 2E   [23]  860 	sra	-17 (ix)
   51AD DD CB EE 1E   [23]  861 	rr	-18 (ix)
   51B1 DD CB EF 2E   [23]  862 	sra	-17 (ix)
   51B5 DD CB EE 1E   [23]  863 	rr	-18 (ix)
   51B9 DD 4E EE      [19]  864 	ld	c,-18 (ix)
   51BC DD 46 EF      [19]  865 	ld	b,-17 (ix)
   51BF 69            [ 4]  866 	ld	l, c
   51C0 60            [ 4]  867 	ld	h, b
   51C1 29            [11]  868 	add	hl, hl
   51C2 29            [11]  869 	add	hl, hl
   51C3 09            [11]  870 	add	hl, bc
   51C4 29            [11]  871 	add	hl, hl
   51C5 29            [11]  872 	add	hl, hl
   51C6 29            [11]  873 	add	hl, hl
   51C7 DD 75 EE      [19]  874 	ld	-18 (ix),l
   51CA DD 74 EF      [19]  875 	ld	-17 (ix),h
   51CD DD 7E 0A      [19]  876 	ld	a,10 (ix)
   51D0 DD 86 EE      [19]  877 	add	a, -18 (ix)
   51D3 DD 77 EE      [19]  878 	ld	-18 (ix),a
   51D6 DD 7E 0B      [19]  879 	ld	a,11 (ix)
   51D9 DD 8E EF      [19]  880 	adc	a, -17 (ix)
   51DC DD 77 EF      [19]  881 	ld	-17 (ix),a
   51DF DD 7E F4      [19]  882 	ld	a,-12 (ix)
   51E2 DD 77 F2      [19]  883 	ld	-14 (ix),a
   51E5 DD 7E F5      [19]  884 	ld	a,-11 (ix)
   51E8 DD 77 F3      [19]  885 	ld	-13 (ix),a
   51EB DD CB F5 7E   [20]  886 	bit	7, -11 (ix)
   51EF 28 0C         [12]  887 	jr	Z,00179$
   51F1 DD 7E EA      [19]  888 	ld	a,-22 (ix)
   51F4 DD 77 F2      [19]  889 	ld	-14 (ix),a
   51F7 DD 7E EB      [19]  890 	ld	a,-21 (ix)
   51FA DD 77 F3      [19]  891 	ld	-13 (ix),a
   51FD                     892 00179$:
   51FD DD CB F3 2E   [23]  893 	sra	-13 (ix)
   5201 DD CB F2 1E   [23]  894 	rr	-14 (ix)
   5205 DD 7E EE      [19]  895 	ld	a,-18 (ix)
   5208 DD 86 F2      [19]  896 	add	a, -14 (ix)
   520B DD 77 EE      [19]  897 	ld	-18 (ix),a
   520E DD 7E EF      [19]  898 	ld	a,-17 (ix)
   5211 DD 8E F3      [19]  899 	adc	a, -13 (ix)
   5214 DD 77 EF      [19]  900 	ld	-17 (ix),a
   5217 DD 6E EE      [19]  901 	ld	l,-18 (ix)
   521A DD 66 EF      [19]  902 	ld	h,-17 (ix)
   521D 7E            [ 7]  903 	ld	a,(hl)
   521E DD 77 EE      [19]  904 	ld	-18 (ix),a
                            905 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   5221 DD 7E FE      [19]  906 	ld	a,-2 (ix)
   5224 DD 96 FC      [19]  907 	sub	a, -4 (ix)
   5227 DD 77 FE      [19]  908 	ld	-2 (ix),a
   522A DD 7E FF      [19]  909 	ld	a,-1 (ix)
   522D DD 9E FD      [19]  910 	sbc	a, -3 (ix)
   5230 DD 77 FF      [19]  911 	ld	-1 (ix),a
                            912 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   5233 3E 02         [ 7]  913 	ld	a,#0x02
   5235 DD 96 EE      [19]  914 	sub	a, -18 (ix)
   5238 DA F1 52      [10]  915 	jp	C,00154$
   523B DD 6E E2      [19]  916 	ld	l,-30 (ix)
   523E DD 66 E3      [19]  917 	ld	h,-29 (ix)
   5241 E5            [11]  918 	push	hl
   5242 21 ED 69      [10]  919 	ld	hl,#_sol_matriz
   5245 E5            [11]  920 	push	hl
   5246 CD E2 4B      [17]  921 	call	_getBit
   5249 F1            [10]  922 	pop	af
   524A F1            [10]  923 	pop	af
   524B DD 75 EE      [19]  924 	ld	-18 (ix), l
   524E 7D            [ 4]  925 	ld	a, l
   524F 3D            [ 4]  926 	dec	a
   5250 CA F1 52      [10]  927 	jp	Z,00154$
                            928 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   5253 DD 7E F0      [19]  929 	ld	a,-16 (ix)
   5256 DD 96 F4      [19]  930 	sub	a, -12 (ix)
   5259 4F            [ 4]  931 	ld	c,a
   525A DD 7E F1      [19]  932 	ld	a,-15 (ix)
   525D DD 9E F5      [19]  933 	sbc	a, -11 (ix)
   5260 47            [ 4]  934 	ld	b,a
   5261 C5            [11]  935 	push	bc
   5262 CD 92 4B      [17]  936 	call	_abs
   5265 F1            [10]  937 	pop	af
   5266 DD 74 EF      [19]  938 	ld	-17 (ix),h
   5269 DD 75 EE      [19]  939 	ld	-18 (ix),l
   526C DD 6E FE      [19]  940 	ld	l,-2 (ix)
   526F DD 66 FF      [19]  941 	ld	h,-1 (ix)
   5272 E5            [11]  942 	push	hl
   5273 CD 92 4B      [17]  943 	call	_abs
   5276 F1            [10]  944 	pop	af
   5277 DD 74 F3      [19]  945 	ld	-13 (ix),h
   527A DD 75 F2      [19]  946 	ld	-14 (ix),l
   527D DD 7E EE      [19]  947 	ld	a,-18 (ix)
   5280 DD 86 F2      [19]  948 	add	a, -14 (ix)
   5283 DD 77 EE      [19]  949 	ld	-18 (ix),a
   5286 DD 7E EF      [19]  950 	ld	a,-17 (ix)
   5289 DD 8E F3      [19]  951 	adc	a, -13 (ix)
   528C DD 77 EF      [19]  952 	ld	-17 (ix),a
   528F DD 7E DC      [19]  953 	ld	a,-36 (ix)
   5292 DD 86 EE      [19]  954 	add	a, -18 (ix)
   5295 DD 77 EE      [19]  955 	ld	-18 (ix),a
   5298 DD 7E DD      [19]  956 	ld	a,-35 (ix)
   529B DD 8E EF      [19]  957 	adc	a, -17 (ix)
   529E DD 77 EF      [19]  958 	ld	-17 (ix),a
   52A1 DD 7E EE      [19]  959 	ld	a,-18 (ix)
   52A4 DD 77 E0      [19]  960 	ld	-32 (ix),a
   52A7 DD 7E EF      [19]  961 	ld	a,-17 (ix)
   52AA DD 77 E1      [19]  962 	ld	-31 (ix),a
                            963 ;src/pathfinding.c:150: if(resultado == 0){
   52AD DD 7E D1      [19]  964 	ld	a,-47 (ix)
   52B0 B7            [ 4]  965 	or	a, a
   52B1 20 1A         [12]  966 	jr	NZ,00151$
                            967 ;src/pathfinding.c:151: if(dist1 >= dist3)
   52B3 DD 7E D8      [19]  968 	ld	a,-40 (ix)
   52B6 DD 96 E0      [19]  969 	sub	a, -32 (ix)
   52B9 DD 7E D9      [19]  970 	ld	a,-39 (ix)
   52BC DD 9E E1      [19]  971 	sbc	a, -31 (ix)
   52BF E2 C4 52      [10]  972 	jp	PO, 00342$
   52C2 EE 80         [ 7]  973 	xor	a, #0x80
   52C4                     974 00342$:
   52C4 FA F1 52      [10]  975 	jp	M,00154$
                            976 ;src/pathfinding.c:152: resultado = 2;
   52C7 DD 36 D1 02   [19]  977 	ld	-47 (ix),#0x02
   52CB 18 24         [12]  978 	jr	00154$
   52CD                     979 00151$:
                            980 ;src/pathfinding.c:153: }else if(resultado == 1){
   52CD DD 7E D1      [19]  981 	ld	a,-47 (ix)
   52D0 3D            [ 4]  982 	dec	a
   52D1 20 1A         [12]  983 	jr	NZ,00148$
                            984 ;src/pathfinding.c:154: if(dist2 >= dist3)
   52D3 DD 7E D4      [19]  985 	ld	a,-44 (ix)
   52D6 DD 96 E0      [19]  986 	sub	a, -32 (ix)
   52D9 DD 7E D5      [19]  987 	ld	a,-43 (ix)
   52DC DD 9E E1      [19]  988 	sbc	a, -31 (ix)
   52DF E2 E4 52      [10]  989 	jp	PO, 00345$
   52E2 EE 80         [ 7]  990 	xor	a, #0x80
   52E4                     991 00345$:
   52E4 FA F1 52      [10]  992 	jp	M,00154$
                            993 ;src/pathfinding.c:155: resultado = 2;
   52E7 DD 36 D1 02   [19]  994 	ld	-47 (ix),#0x02
   52EB 18 04         [12]  995 	jr	00154$
   52ED                     996 00148$:
                            997 ;src/pathfinding.c:157: resultado = 2;
   52ED DD 36 D1 02   [19]  998 	ld	-47 (ix),#0x02
   52F1                     999 00154$:
                           1000 ;src/pathfinding.c:161: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
   52F1 DD 7E F8      [19] 1001 	ld	a,-8 (ix)
   52F4 DD 77 EE      [19] 1002 	ld	-18 (ix),a
   52F7 DD 7E F9      [19] 1003 	ld	a,-7 (ix)
   52FA DD 77 EF      [19] 1004 	ld	-17 (ix),a
   52FD DD 7E E8      [19] 1005 	ld	a,-24 (ix)
   5300 B7            [ 4] 1006 	or	a, a
   5301 28 0C         [12] 1007 	jr	Z,00180$
   5303 DD 7E E4      [19] 1008 	ld	a,-28 (ix)
   5306 DD 77 EE      [19] 1009 	ld	-18 (ix),a
   5309 DD 7E E5      [19] 1010 	ld	a,-27 (ix)
   530C DD 77 EF      [19] 1011 	ld	-17 (ix),a
   530F                    1012 00180$:
   530F DD CB EF 2E   [23] 1013 	sra	-17 (ix)
   5313 DD CB EE 1E   [23] 1014 	rr	-18 (ix)
   5317 DD CB EF 2E   [23] 1015 	sra	-17 (ix)
   531B DD CB EE 1E   [23] 1016 	rr	-18 (ix)
   531F DD 4E EE      [19] 1017 	ld	c,-18 (ix)
   5322 DD 46 EF      [19] 1018 	ld	b,-17 (ix)
   5325 69            [ 4] 1019 	ld	l, c
   5326 60            [ 4] 1020 	ld	h, b
   5327 29            [11] 1021 	add	hl, hl
   5328 29            [11] 1022 	add	hl, hl
   5329 09            [11] 1023 	add	hl, bc
   532A 29            [11] 1024 	add	hl, hl
   532B 29            [11] 1025 	add	hl, hl
   532C 29            [11] 1026 	add	hl, hl
   532D DD 75 EE      [19] 1027 	ld	-18 (ix),l
   5330 DD 74 EF      [19] 1028 	ld	-17 (ix),h
   5333 DD 7E 0A      [19] 1029 	ld	a,10 (ix)
   5336 DD 86 EE      [19] 1030 	add	a, -18 (ix)
   5339 DD 77 EE      [19] 1031 	ld	-18 (ix),a
   533C DD 7E 0B      [19] 1032 	ld	a,11 (ix)
   533F DD 8E EF      [19] 1033 	adc	a, -17 (ix)
   5342 DD 77 EF      [19] 1034 	ld	-17 (ix),a
   5345 DD 7E EC      [19] 1035 	ld	a,-20 (ix)
   5348 DD 77 E8      [19] 1036 	ld	-24 (ix),a
   534B DD 7E ED      [19] 1037 	ld	a,-19 (ix)
   534E DD 77 E9      [19] 1038 	ld	-23 (ix),a
   5351 DD CB ED 7E   [20] 1039 	bit	7, -19 (ix)
   5355 28 10         [12] 1040 	jr	Z,00181$
   5357 DD 7E EA      [19] 1041 	ld	a,-22 (ix)
   535A C6 02         [ 7] 1042 	add	a, #0x02
   535C DD 77 E8      [19] 1043 	ld	-24 (ix),a
   535F DD 7E EB      [19] 1044 	ld	a,-21 (ix)
   5362 CE 00         [ 7] 1045 	adc	a, #0x00
   5364 DD 77 E9      [19] 1046 	ld	-23 (ix),a
   5367                    1047 00181$:
   5367 DD CB E9 2E   [23] 1048 	sra	-23 (ix)
   536B DD CB E8 1E   [23] 1049 	rr	-24 (ix)
   536F DD 7E E8      [19] 1050 	ld	a,-24 (ix)
   5372 DD 86 EE      [19] 1051 	add	a, -18 (ix)
   5375 DD 77 EE      [19] 1052 	ld	-18 (ix),a
   5378 DD 7E E9      [19] 1053 	ld	a,-23 (ix)
   537B DD 8E EF      [19] 1054 	adc	a, -17 (ix)
   537E DD 77 EF      [19] 1055 	ld	-17 (ix),a
   5381 DD 6E EE      [19] 1056 	ld	l,-18 (ix)
   5384 DD 66 EF      [19] 1057 	ld	h,-17 (ix)
   5387 7E            [ 7] 1058 	ld	a,(hl)
   5388 DD 77 EE      [19] 1059 	ld	-18 (ix),a
   538B 3E 02         [ 7] 1060 	ld	a,#0x02
   538D DD 96 EE      [19] 1061 	sub	a, -18 (ix)
   5390 DA 5A 54      [10] 1062 	jp	C,00172$
   5393 DD 6E E6      [19] 1063 	ld	l,-26 (ix)
   5396 DD 66 E7      [19] 1064 	ld	h,-25 (ix)
   5399 E5            [11] 1065 	push	hl
   539A 21 ED 69      [10] 1066 	ld	hl,#_sol_matriz
   539D E5            [11] 1067 	push	hl
   539E CD E2 4B      [17] 1068 	call	_getBit
   53A1 F1            [10] 1069 	pop	af
   53A2 F1            [10] 1070 	pop	af
   53A3 2D            [ 4] 1071 	dec	l
   53A4 CA 5A 54      [10] 1072 	jp	Z,00172$
                           1073 ;src/pathfinding.c:162: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   53A7 DD 7E F0      [19] 1074 	ld	a,-16 (ix)
   53AA DD 96 EC      [19] 1075 	sub	a, -20 (ix)
   53AD 4F            [ 4] 1076 	ld	c,a
   53AE DD 7E F1      [19] 1077 	ld	a,-15 (ix)
   53B1 DD 9E ED      [19] 1078 	sbc	a, -19 (ix)
   53B4 47            [ 4] 1079 	ld	b,a
   53B5 C5            [11] 1080 	push	bc
   53B6 CD 92 4B      [17] 1081 	call	_abs
   53B9 F1            [10] 1082 	pop	af
   53BA DD 74 EF      [19] 1083 	ld	-17 (ix),h
   53BD DD 75 EE      [19] 1084 	ld	-18 (ix),l
   53C0 DD 6E FE      [19] 1085 	ld	l,-2 (ix)
   53C3 DD 66 FF      [19] 1086 	ld	h,-1 (ix)
   53C6 E5            [11] 1087 	push	hl
   53C7 CD 92 4B      [17] 1088 	call	_abs
   53CA F1            [10] 1089 	pop	af
   53CB DD 74 FF      [19] 1090 	ld	-1 (ix),h
   53CE DD 75 FE      [19] 1091 	ld	-2 (ix),l
   53D1 DD 7E EE      [19] 1092 	ld	a,-18 (ix)
   53D4 DD 86 FE      [19] 1093 	add	a, -2 (ix)
   53D7 DD 77 EE      [19] 1094 	ld	-18 (ix),a
   53DA DD 7E EF      [19] 1095 	ld	a,-17 (ix)
   53DD DD 8E FF      [19] 1096 	adc	a, -1 (ix)
   53E0 DD 77 EF      [19] 1097 	ld	-17 (ix),a
   53E3 DD 7E EE      [19] 1098 	ld	a,-18 (ix)
   53E6 DD 86 D6      [19] 1099 	add	a, -42 (ix)
   53E9 DD 77 DE      [19] 1100 	ld	-34 (ix),a
   53EC DD 7E EF      [19] 1101 	ld	a,-17 (ix)
   53EF DD 8E D7      [19] 1102 	adc	a, -41 (ix)
   53F2 DD 77 DF      [19] 1103 	ld	-33 (ix),a
                           1104 ;src/pathfinding.c:163: if(resultado == 0){
   53F5 DD 7E D1      [19] 1105 	ld	a,-47 (ix)
   53F8 B7            [ 4] 1106 	or	a, a
   53F9 20 1A         [12] 1107 	jr	NZ,00169$
                           1108 ;src/pathfinding.c:164: if(dist1 >= dist4)
   53FB DD 7E D8      [19] 1109 	ld	a,-40 (ix)
   53FE DD 96 DE      [19] 1110 	sub	a, -34 (ix)
   5401 DD 7E D9      [19] 1111 	ld	a,-39 (ix)
   5404 DD 9E DF      [19] 1112 	sbc	a, -33 (ix)
   5407 E2 0C 54      [10] 1113 	jp	PO, 00347$
   540A EE 80         [ 7] 1114 	xor	a, #0x80
   540C                    1115 00347$:
   540C FA 5A 54      [10] 1116 	jp	M,00172$
                           1117 ;src/pathfinding.c:165: resultado = 3;
   540F DD 36 D1 03   [19] 1118 	ld	-47 (ix),#0x03
   5413 18 45         [12] 1119 	jr	00172$
   5415                    1120 00169$:
                           1121 ;src/pathfinding.c:166: }else if(resultado == 1){
   5415 DD 7E D1      [19] 1122 	ld	a,-47 (ix)
   5418 3D            [ 4] 1123 	dec	a
   5419 20 1A         [12] 1124 	jr	NZ,00166$
                           1125 ;src/pathfinding.c:167: if(dist2 >= dist4)
   541B DD 7E D4      [19] 1126 	ld	a,-44 (ix)
   541E DD 96 DE      [19] 1127 	sub	a, -34 (ix)
   5421 DD 7E D5      [19] 1128 	ld	a,-43 (ix)
   5424 DD 9E DF      [19] 1129 	sbc	a, -33 (ix)
   5427 E2 2C 54      [10] 1130 	jp	PO, 00350$
   542A EE 80         [ 7] 1131 	xor	a, #0x80
   542C                    1132 00350$:
   542C FA 5A 54      [10] 1133 	jp	M,00172$
                           1134 ;src/pathfinding.c:168: resultado = 3;
   542F DD 36 D1 03   [19] 1135 	ld	-47 (ix),#0x03
   5433 18 25         [12] 1136 	jr	00172$
   5435                    1137 00166$:
                           1138 ;src/pathfinding.c:169: }else if (resultado == 2){
   5435 DD 7E D1      [19] 1139 	ld	a,-47 (ix)
   5438 D6 02         [ 7] 1140 	sub	a, #0x02
   543A 20 1A         [12] 1141 	jr	NZ,00163$
                           1142 ;src/pathfinding.c:170: if(dist3 >= dist4)
   543C DD 7E E0      [19] 1143 	ld	a,-32 (ix)
   543F DD 96 DE      [19] 1144 	sub	a, -34 (ix)
   5442 DD 7E E1      [19] 1145 	ld	a,-31 (ix)
   5445 DD 9E DF      [19] 1146 	sbc	a, -33 (ix)
   5448 E2 4D 54      [10] 1147 	jp	PO, 00353$
   544B EE 80         [ 7] 1148 	xor	a, #0x80
   544D                    1149 00353$:
   544D FA 5A 54      [10] 1150 	jp	M,00172$
                           1151 ;src/pathfinding.c:171: resultado = 3;
   5450 DD 36 D1 03   [19] 1152 	ld	-47 (ix),#0x03
   5454 18 04         [12] 1153 	jr	00172$
   5456                    1154 00163$:
                           1155 ;src/pathfinding.c:173: resultado = 3;
   5456 DD 36 D1 03   [19] 1156 	ld	-47 (ix),#0x03
   545A                    1157 00172$:
                           1158 ;src/pathfinding.c:177: return resultado;
   545A DD 6E D1      [19] 1159 	ld	l,-47 (ix)
   545D DD F9         [10] 1160 	ld	sp, ix
   545F DD E1         [14] 1161 	pop	ix
   5461 C9            [10] 1162 	ret
                           1163 ;src/pathfinding.c:181: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                           1164 ;	---------------------------------
                           1165 ; Function pathFinding
                           1166 ; ---------------------------------
   5462                    1167 _pathFinding::
   5462 DD E5         [15] 1168 	push	ix
   5464 DD 21 00 00   [14] 1169 	ld	ix,#0
   5468 DD 39         [15] 1170 	add	ix,sp
   546A 21 E9 FF      [10] 1171 	ld	hl,#-23
   546D 39            [11] 1172 	add	hl,sp
   546E F9            [ 6] 1173 	ld	sp,hl
                           1174 ;src/pathfinding.c:193: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
   546F DD 4E EE      [19] 1175 	ld	c,-18 (ix)
   5472 06 00         [ 7] 1176 	ld	b,#0x00
   5474 21 EA FF      [10] 1177 	ld	hl,#0xFFEA
   5477 09            [11] 1178 	add	hl,bc
   5478 5D            [ 4] 1179 	ld	e, l
   5479 54            [ 4] 1180 	ld	d, h
   547A 29            [11] 1181 	add	hl, hl
   547B 29            [11] 1182 	add	hl, hl
   547C 19            [11] 1183 	add	hl, de
   547D 29            [11] 1184 	add	hl, hl
   547E 29            [11] 1185 	add	hl, hl
   547F 29            [11] 1186 	add	hl, hl
   5480 29            [11] 1187 	add	hl, hl
   5481 DD 5E F2      [19] 1188 	ld	e,-14 (ix)
   5484 16 00         [ 7] 1189 	ld	d,#0x00
   5486 19            [11] 1190 	add	hl,de
   5487 DD 75 EA      [19] 1191 	ld	-22 (ix),l
   548A DD 74 EB      [19] 1192 	ld	-21 (ix),h
                           1193 ;src/pathfinding.c:194: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
   548D 79            [ 4] 1194 	ld	a,c
   548E C6 E6         [ 7] 1195 	add	a,#0xE6
   5490 6F            [ 4] 1196 	ld	l,a
   5491 78            [ 4] 1197 	ld	a,b
   5492 CE FF         [ 7] 1198 	adc	a,#0xFF
   5494 67            [ 4] 1199 	ld	h,a
   5495 D5            [11] 1200 	push	de
   5496 5D            [ 4] 1201 	ld	e, l
   5497 54            [ 4] 1202 	ld	d, h
   5498 29            [11] 1203 	add	hl, hl
   5499 29            [11] 1204 	add	hl, hl
   549A 19            [11] 1205 	add	hl, de
   549B 29            [11] 1206 	add	hl, hl
   549C 29            [11] 1207 	add	hl, hl
   549D 29            [11] 1208 	add	hl, hl
   549E 29            [11] 1209 	add	hl, hl
   549F D1            [10] 1210 	pop	de
   54A0 19            [11] 1211 	add	hl,de
   54A1 DD 75 EF      [19] 1212 	ld	-17 (ix),l
   54A4 DD 74 F0      [19] 1213 	ld	-16 (ix),h
                           1214 ;src/pathfinding.c:195: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
   54A7 79            [ 4] 1215 	ld	a,c
   54A8 C6 E8         [ 7] 1216 	add	a,#0xE8
   54AA 4F            [ 4] 1217 	ld	c,a
   54AB 78            [ 4] 1218 	ld	a,b
   54AC CE FF         [ 7] 1219 	adc	a,#0xFF
   54AE 47            [ 4] 1220 	ld	b,a
   54AF 69            [ 4] 1221 	ld	l, c
   54B0 60            [ 4] 1222 	ld	h, b
   54B1 29            [11] 1223 	add	hl, hl
   54B2 29            [11] 1224 	add	hl, hl
   54B3 09            [11] 1225 	add	hl, bc
   54B4 29            [11] 1226 	add	hl, hl
   54B5 29            [11] 1227 	add	hl, hl
   54B6 29            [11] 1228 	add	hl, hl
   54B7 29            [11] 1229 	add	hl, hl
   54B8 4D            [ 4] 1230 	ld	c,l
   54B9 44            [ 4] 1231 	ld	b,h
   54BA 6B            [ 4] 1232 	ld	l, e
   54BB 62            [ 4] 1233 	ld	h, d
   54BC 23            [ 6] 1234 	inc	hl
   54BD 09            [11] 1235 	add	hl,bc
   54BE DD 75 F3      [19] 1236 	ld	-13 (ix),l
   54C1 DD 74 F4      [19] 1237 	ld	-12 (ix),h
                           1238 ;src/pathfinding.c:196: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
   54C4 1B            [ 6] 1239 	dec	de
   54C5 69            [ 4] 1240 	ld	l, c
   54C6 60            [ 4] 1241 	ld	h, b
   54C7 19            [11] 1242 	add	hl,de
   54C8 DD 75 EC      [19] 1243 	ld	-20 (ix),l
   54CB DD 74 ED      [19] 1244 	ld	-19 (ix),h
                           1245 ;src/pathfinding.c:198: u8 problem = 0;
   54CE DD 36 F1 00   [19] 1246 	ld	-15 (ix),#0x00
                           1247 ;src/pathfinding.c:200: x = s_x;
   54D2 DD 7E 04      [19] 1248 	ld	a,4 (ix)
   54D5 DD 77 F2      [19] 1249 	ld	-14 (ix),a
                           1250 ;src/pathfinding.c:202: y = s_y;
   54D8 DD 7E 05      [19] 1251 	ld	a,5 (ix)
   54DB DD 77 EE      [19] 1252 	ld	-18 (ix),a
                           1253 ;src/pathfinding.c:204: k = 0;
   54DE DD 36 F7 00   [19] 1254 	ld	-9 (ix),#0x00
                           1255 ;src/pathfinding.c:205: aux = 1;
   54E2 DD 36 F6 01   [19] 1256 	ld	-10 (ix),#0x01
                           1257 ;src/pathfinding.c:208: memset(sol_matriz, 0, (40*2*44*4)/8);
   54E6 21 ED 69      [10] 1258 	ld	hl,#_sol_matriz
   54E9 36 00         [10] 1259 	ld	(hl), #0x00
   54EB 5D            [ 4] 1260 	ld	e, l
   54EC 54            [ 4] 1261 	ld	d, h
   54ED 13            [ 6] 1262 	inc	de
   54EE 01 DF 06      [10] 1263 	ld	bc, #0x06DF
   54F1 ED B0         [21] 1264 	ldir
                           1265 ;src/pathfinding.c:209: enemy->longitud_camino = 0;
   54F3 DD 7E 08      [19] 1266 	ld	a,8 (ix)
   54F6 DD 77 F8      [19] 1267 	ld	-8 (ix),a
   54F9 DD 7E 09      [19] 1268 	ld	a,9 (ix)
   54FC DD 77 F9      [19] 1269 	ld	-7 (ix),a
   54FF DD 7E F8      [19] 1270 	ld	a,-8 (ix)
   5502 C6 43         [ 7] 1271 	add	a, #0x43
   5504 DD 77 FC      [19] 1272 	ld	-4 (ix),a
   5507 DD 7E F9      [19] 1273 	ld	a,-7 (ix)
   550A CE 01         [ 7] 1274 	adc	a, #0x01
   550C DD 77 FD      [19] 1275 	ld	-3 (ix),a
   550F DD 6E FC      [19] 1276 	ld	l,-4 (ix)
   5512 DD 66 FD      [19] 1277 	ld	h,-3 (ix)
   5515 36 00         [10] 1278 	ld	(hl),#0x00
                           1279 ;src/pathfinding.c:210: sol_tam = 1;
   5517 21 EC 69      [10] 1280 	ld	hl,#_sol_tam + 0
   551A 36 01         [10] 1281 	ld	(hl), #0x01
                           1282 ;src/pathfinding.c:211: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
   551C DD 7E EE      [19] 1283 	ld	a,-18 (ix)
   551F DD 77 FA      [19] 1284 	ld	-6 (ix),a
   5522 DD 36 FB 00   [19] 1285 	ld	-5 (ix),#0x00
   5526 DD 7E FA      [19] 1286 	ld	a,-6 (ix)
   5529 C6 E8         [ 7] 1287 	add	a,#0xE8
   552B DD 77 FA      [19] 1288 	ld	-6 (ix),a
   552E DD 7E FB      [19] 1289 	ld	a,-5 (ix)
   5531 CE FF         [ 7] 1290 	adc	a,#0xFF
   5533 DD 77 FB      [19] 1291 	ld	-5 (ix),a
   5536 DD 4E FA      [19] 1292 	ld	c,-6 (ix)
   5539 DD 46 FB      [19] 1293 	ld	b,-5 (ix)
   553C 69            [ 4] 1294 	ld	l, c
   553D 60            [ 4] 1295 	ld	h, b
   553E 29            [11] 1296 	add	hl, hl
   553F 29            [11] 1297 	add	hl, hl
   5540 09            [11] 1298 	add	hl, bc
   5541 29            [11] 1299 	add	hl, hl
   5542 29            [11] 1300 	add	hl, hl
   5543 29            [11] 1301 	add	hl, hl
   5544 29            [11] 1302 	add	hl, hl
   5545 DD 75 FA      [19] 1303 	ld	-6 (ix),l
   5548 DD 74 FB      [19] 1304 	ld	-5 (ix),h
   554B DD 7E F2      [19] 1305 	ld	a,-14 (ix)
   554E DD 77 FE      [19] 1306 	ld	-2 (ix),a
   5551 DD 36 FF 00   [19] 1307 	ld	-1 (ix),#0x00
   5555 DD 7E FA      [19] 1308 	ld	a,-6 (ix)
   5558 DD 86 FE      [19] 1309 	add	a, -2 (ix)
   555B DD 77 FE      [19] 1310 	ld	-2 (ix),a
   555E DD 7E FB      [19] 1311 	ld	a,-5 (ix)
   5561 DD 8E FF      [19] 1312 	adc	a, -1 (ix)
   5564 DD 77 FF      [19] 1313 	ld	-1 (ix),a
   5567 21 01 00      [10] 1314 	ld	hl,#0x0001
   556A E5            [11] 1315 	push	hl
   556B DD 6E FE      [19] 1316 	ld	l,-2 (ix)
   556E DD 66 FF      [19] 1317 	ld	h,-1 (ix)
   5571 E5            [11] 1318 	push	hl
   5572 21 ED 69      [10] 1319 	ld	hl,#_sol_matriz
   5575 E5            [11] 1320 	push	hl
   5576 CD 2D 4C      [17] 1321 	call	_setBit
   5579 21 06 00      [10] 1322 	ld	hl,#6
   557C 39            [11] 1323 	add	hl,sp
   557D F9            [ 6] 1324 	ld	sp,hl
                           1325 ;src/pathfinding.c:212: inserted = anyadirALista(x, y);
   557E DD 66 EE      [19] 1326 	ld	h,-18 (ix)
   5581 DD 6E F2      [19] 1327 	ld	l,-14 (ix)
   5584 E5            [11] 1328 	push	hl
   5585 CD A7 4C      [17] 1329 	call	_anyadirALista
   5588 F1            [10] 1330 	pop	af
   5589 DD 75 F5      [19] 1331 	ld	-11 (ix),l
                           1332 ;src/pathfinding.c:216: while (aux){
   558C                    1333 00116$:
   558C DD 7E F6      [19] 1334 	ld	a,-10 (ix)
   558F B7            [ 4] 1335 	or	a, a
   5590 CA 33 57      [10] 1336 	jp	Z,00118$
                           1337 ;src/pathfinding.c:217: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   5593 DD 7E 06      [19] 1338 	ld	a,6 (ix)
   5596 DD 96 F2      [19] 1339 	sub	a, -14 (ix)
   5599 20 08         [12] 1340 	jr	NZ,00114$
   559B DD 7E 07      [19] 1341 	ld	a,7 (ix)
   559E DD 96 EE      [19] 1342 	sub	a, -18 (ix)
   55A1 28 0C         [12] 1343 	jr	Z,00110$
   55A3                    1344 00114$:
   55A3 3A EC 69      [13] 1345 	ld	a,(#_sol_tam + 0)
   55A6 B7            [ 4] 1346 	or	a, a
   55A7 28 06         [12] 1347 	jr	Z,00110$
   55A9 DD 7E F5      [19] 1348 	ld	a,-11 (ix)
   55AC B7            [ 4] 1349 	or	a, a
   55AD 20 16         [12] 1350 	jr	NZ,00111$
   55AF                    1351 00110$:
                           1352 ;src/pathfinding.c:219: if(inserted == 0 || sol_tam == 0){
   55AF DD 7E F5      [19] 1353 	ld	a,-11 (ix)
   55B2 B7            [ 4] 1354 	or	a, a
   55B3 28 06         [12] 1355 	jr	Z,00101$
   55B5 3A EC 69      [13] 1356 	ld	a,(#_sol_tam + 0)
   55B8 B7            [ 4] 1357 	or	a, a
   55B9 20 04         [12] 1358 	jr	NZ,00102$
   55BB                    1359 00101$:
                           1360 ;src/pathfinding.c:220: problem = 1;
   55BB DD 36 F1 01   [19] 1361 	ld	-15 (ix),#0x01
   55BF                    1362 00102$:
                           1363 ;src/pathfinding.c:223: aux = 0;
   55BF DD 36 F6 00   [19] 1364 	ld	-10 (ix),#0x00
   55C3 18 C7         [12] 1365 	jr	00116$
   55C5                    1366 00111$:
                           1367 ;src/pathfinding.c:225: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   55C5 DD 6E 0A      [19] 1368 	ld	l,10 (ix)
   55C8 DD 66 0B      [19] 1369 	ld	h,11 (ix)
   55CB E5            [11] 1370 	push	hl
   55CC DD 66 07      [19] 1371 	ld	h,7 (ix)
   55CF DD 6E 06      [19] 1372 	ld	l,6 (ix)
   55D2 E5            [11] 1373 	push	hl
   55D3 DD 66 05      [19] 1374 	ld	h,5 (ix)
   55D6 DD 6E 04      [19] 1375 	ld	l,4 (ix)
   55D9 E5            [11] 1376 	push	hl
   55DA DD 66 EE      [19] 1377 	ld	h,-18 (ix)
   55DD DD 6E F2      [19] 1378 	ld	l,-14 (ix)
   55E0 E5            [11] 1379 	push	hl
   55E1 CD E5 4C      [17] 1380 	call	_adjacentTiles
   55E4 F1            [10] 1381 	pop	af
   55E5 F1            [10] 1382 	pop	af
   55E6 F1            [10] 1383 	pop	af
   55E7 F1            [10] 1384 	pop	af
   55E8 5D            [ 4] 1385 	ld	e,l
                           1386 ;src/pathfinding.c:227: switch(movimiento){
   55E9 3E 04         [ 7] 1387 	ld	a,#0x04
   55EB 93            [ 4] 1388 	sub	a, e
   55EC 38 9E         [12] 1389 	jr	C,00116$
                           1390 ;src/pathfinding.c:233: k = k+2;
   55EE DD 4E F7      [19] 1391 	ld	c,-9 (ix)
   55F1 0C            [ 4] 1392 	inc	c
   55F2 0C            [ 4] 1393 	inc	c
                           1394 ;src/pathfinding.c:227: switch(movimiento){
   55F3 16 00         [ 7] 1395 	ld	d,#0x00
   55F5 21 FC 55      [10] 1396 	ld	hl,#00169$
   55F8 19            [11] 1397 	add	hl,de
   55F9 19            [11] 1398 	add	hl,de
   55FA 19            [11] 1399 	add	hl,de
   55FB E9            [ 4] 1400 	jp	(hl)
   55FC                    1401 00169$:
   55FC C3 0B 56      [10] 1402 	jp	00104$
   55FF C3 42 56      [10] 1403 	jp	00105$
   5602 C3 79 56      [10] 1404 	jp	00106$
   5605 C3 AF 56      [10] 1405 	jp	00107$
   5608 C3 E5 56      [10] 1406 	jp	00108$
                           1407 ;src/pathfinding.c:228: case 0:
   560B                    1408 00104$:
                           1409 ;src/pathfinding.c:230: setBit(sol_matriz, up, 1);
   560B C5            [11] 1410 	push	bc
   560C 21 01 00      [10] 1411 	ld	hl,#0x0001
   560F E5            [11] 1412 	push	hl
   5610 DD 6E EF      [19] 1413 	ld	l,-17 (ix)
   5613 DD 66 F0      [19] 1414 	ld	h,-16 (ix)
   5616 E5            [11] 1415 	push	hl
   5617 21 ED 69      [10] 1416 	ld	hl,#_sol_matriz
   561A E5            [11] 1417 	push	hl
   561B CD 2D 4C      [17] 1418 	call	_setBit
   561E 21 06 00      [10] 1419 	ld	hl,#6
   5621 39            [11] 1420 	add	hl,sp
   5622 F9            [ 6] 1421 	ld	sp,hl
   5623 C1            [10] 1422 	pop	bc
                           1423 ;src/pathfinding.c:231: inserted = anyadirALista(x, y-2);
   5624 DD 46 EE      [19] 1424 	ld	b,-18 (ix)
   5627 05            [ 4] 1425 	dec	b
   5628 05            [ 4] 1426 	dec	b
   5629 C5            [11] 1427 	push	bc
   562A C5            [11] 1428 	push	bc
   562B 33            [ 6] 1429 	inc	sp
   562C DD 7E F2      [19] 1430 	ld	a,-14 (ix)
   562F F5            [11] 1431 	push	af
   5630 33            [ 6] 1432 	inc	sp
   5631 CD A7 4C      [17] 1433 	call	_anyadirALista
   5634 F1            [10] 1434 	pop	af
   5635 C1            [10] 1435 	pop	bc
   5636 DD 75 F5      [19] 1436 	ld	-11 (ix),l
                           1437 ;src/pathfinding.c:232: y = y-1;
   5639 DD 35 EE      [23] 1438 	dec	-18 (ix)
                           1439 ;src/pathfinding.c:233: k = k+2;
   563C DD 71 F7      [19] 1440 	ld	-9 (ix),c
                           1441 ;src/pathfinding.c:234: break;
   563F C3 8C 55      [10] 1442 	jp	00116$
                           1443 ;src/pathfinding.c:235: case 1:
   5642                    1444 00105$:
                           1445 ;src/pathfinding.c:237: setBit(sol_matriz, down, 1);
   5642 C5            [11] 1446 	push	bc
   5643 21 01 00      [10] 1447 	ld	hl,#0x0001
   5646 E5            [11] 1448 	push	hl
   5647 DD 6E EA      [19] 1449 	ld	l,-22 (ix)
   564A DD 66 EB      [19] 1450 	ld	h,-21 (ix)
   564D E5            [11] 1451 	push	hl
   564E 21 ED 69      [10] 1452 	ld	hl,#_sol_matriz
   5651 E5            [11] 1453 	push	hl
   5652 CD 2D 4C      [17] 1454 	call	_setBit
   5655 21 06 00      [10] 1455 	ld	hl,#6
   5658 39            [11] 1456 	add	hl,sp
   5659 F9            [ 6] 1457 	ld	sp,hl
   565A C1            [10] 1458 	pop	bc
                           1459 ;src/pathfinding.c:238: inserted = anyadirALista(x, y+2);
   565B DD 46 EE      [19] 1460 	ld	b,-18 (ix)
   565E 04            [ 4] 1461 	inc	b
   565F 04            [ 4] 1462 	inc	b
   5660 C5            [11] 1463 	push	bc
   5661 C5            [11] 1464 	push	bc
   5662 33            [ 6] 1465 	inc	sp
   5663 DD 7E F2      [19] 1466 	ld	a,-14 (ix)
   5666 F5            [11] 1467 	push	af
   5667 33            [ 6] 1468 	inc	sp
   5668 CD A7 4C      [17] 1469 	call	_anyadirALista
   566B F1            [10] 1470 	pop	af
   566C C1            [10] 1471 	pop	bc
   566D DD 75 F5      [19] 1472 	ld	-11 (ix),l
                           1473 ;src/pathfinding.c:239: y = y+1;
   5670 DD 34 EE      [23] 1474 	inc	-18 (ix)
                           1475 ;src/pathfinding.c:240: k = k+2;
   5673 DD 71 F7      [19] 1476 	ld	-9 (ix),c
                           1477 ;src/pathfinding.c:241: break;
   5676 C3 8C 55      [10] 1478 	jp	00116$
                           1479 ;src/pathfinding.c:242: case 2:
   5679                    1480 00106$:
                           1481 ;src/pathfinding.c:244: setBit(sol_matriz, left, 1);
   5679 C5            [11] 1482 	push	bc
   567A 21 01 00      [10] 1483 	ld	hl,#0x0001
   567D E5            [11] 1484 	push	hl
   567E DD 6E EC      [19] 1485 	ld	l,-20 (ix)
   5681 DD 66 ED      [19] 1486 	ld	h,-19 (ix)
   5684 E5            [11] 1487 	push	hl
   5685 21 ED 69      [10] 1488 	ld	hl,#_sol_matriz
   5688 E5            [11] 1489 	push	hl
   5689 CD 2D 4C      [17] 1490 	call	_setBit
   568C 21 06 00      [10] 1491 	ld	hl,#6
   568F 39            [11] 1492 	add	hl,sp
   5690 F9            [ 6] 1493 	ld	sp,hl
   5691 C1            [10] 1494 	pop	bc
                           1495 ;src/pathfinding.c:245: inserted = anyadirALista(x-1, y);
   5692 DD 46 F2      [19] 1496 	ld	b,-14 (ix)
   5695 05            [ 4] 1497 	dec	b
   5696 C5            [11] 1498 	push	bc
   5697 DD 7E EE      [19] 1499 	ld	a,-18 (ix)
   569A F5            [11] 1500 	push	af
   569B 33            [ 6] 1501 	inc	sp
   569C C5            [11] 1502 	push	bc
   569D 33            [ 6] 1503 	inc	sp
   569E CD A7 4C      [17] 1504 	call	_anyadirALista
   56A1 F1            [10] 1505 	pop	af
   56A2 C1            [10] 1506 	pop	bc
   56A3 DD 75 F5      [19] 1507 	ld	-11 (ix),l
                           1508 ;src/pathfinding.c:246: x = x-1;
   56A6 DD 70 F2      [19] 1509 	ld	-14 (ix),b
                           1510 ;src/pathfinding.c:247: k = k+2;
   56A9 DD 71 F7      [19] 1511 	ld	-9 (ix),c
                           1512 ;src/pathfinding.c:248: break;
   56AC C3 8C 55      [10] 1513 	jp	00116$
                           1514 ;src/pathfinding.c:249: case 3:
   56AF                    1515 00107$:
                           1516 ;src/pathfinding.c:251: setBit(sol_matriz, right, 1);
   56AF C5            [11] 1517 	push	bc
   56B0 21 01 00      [10] 1518 	ld	hl,#0x0001
   56B3 E5            [11] 1519 	push	hl
   56B4 DD 6E F3      [19] 1520 	ld	l,-13 (ix)
   56B7 DD 66 F4      [19] 1521 	ld	h,-12 (ix)
   56BA E5            [11] 1522 	push	hl
   56BB 21 ED 69      [10] 1523 	ld	hl,#_sol_matriz
   56BE E5            [11] 1524 	push	hl
   56BF CD 2D 4C      [17] 1525 	call	_setBit
   56C2 21 06 00      [10] 1526 	ld	hl,#6
   56C5 39            [11] 1527 	add	hl,sp
   56C6 F9            [ 6] 1528 	ld	sp,hl
   56C7 C1            [10] 1529 	pop	bc
                           1530 ;src/pathfinding.c:252: inserted = anyadirALista(x+1, y);
   56C8 DD 46 F2      [19] 1531 	ld	b,-14 (ix)
   56CB 04            [ 4] 1532 	inc	b
   56CC C5            [11] 1533 	push	bc
   56CD DD 7E EE      [19] 1534 	ld	a,-18 (ix)
   56D0 F5            [11] 1535 	push	af
   56D1 33            [ 6] 1536 	inc	sp
   56D2 C5            [11] 1537 	push	bc
   56D3 33            [ 6] 1538 	inc	sp
   56D4 CD A7 4C      [17] 1539 	call	_anyadirALista
   56D7 F1            [10] 1540 	pop	af
   56D8 C1            [10] 1541 	pop	bc
   56D9 DD 75 F5      [19] 1542 	ld	-11 (ix),l
                           1543 ;src/pathfinding.c:253: x = x+1;
   56DC DD 70 F2      [19] 1544 	ld	-14 (ix),b
                           1545 ;src/pathfinding.c:254: k = k+2;
   56DF DD 71 F7      [19] 1546 	ld	-9 (ix),c
                           1547 ;src/pathfinding.c:255: break;
   56E2 C3 8C 55      [10] 1548 	jp	00116$
                           1549 ;src/pathfinding.c:257: case 4:
   56E5                    1550 00108$:
                           1551 ;src/pathfinding.c:259: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
   56E5 DD 7E EE      [19] 1552 	ld	a, -18 (ix)
   56E8 06 00         [ 7] 1553 	ld	b, #0x00
   56EA C6 80         [ 7] 1554 	add	a,#0x80
   56EC 4F            [ 4] 1555 	ld	c,a
   56ED 78            [ 4] 1556 	ld	a,b
   56EE CE F8         [ 7] 1557 	adc	a,#0xF8
   56F0 47            [ 4] 1558 	ld	b,a
   56F1 DD 6E F2      [19] 1559 	ld	l,-14 (ix)
   56F4 26 00         [ 7] 1560 	ld	h,#0x00
   56F6 09            [11] 1561 	add	hl,bc
   56F7 01 01 00      [10] 1562 	ld	bc,#0x0001
   56FA C5            [11] 1563 	push	bc
   56FB E5            [11] 1564 	push	hl
   56FC 21 ED 69      [10] 1565 	ld	hl,#_sol_matriz
   56FF E5            [11] 1566 	push	hl
   5700 CD 2D 4C      [17] 1567 	call	_setBit
   5703 21 06 00      [10] 1568 	ld	hl,#6
   5706 39            [11] 1569 	add	hl,sp
   5707 F9            [ 6] 1570 	ld	sp,hl
                           1571 ;src/pathfinding.c:261: sol_tam = sol_tam - 2;
   5708 21 EC 69      [10] 1572 	ld	hl, #_sol_tam+0
   570B 35            [11] 1573 	dec	(hl)
   570C 21 EC 69      [10] 1574 	ld	hl, #_sol_tam+0
   570F 35            [11] 1575 	dec	(hl)
                           1576 ;src/pathfinding.c:262: k--;
   5710 DD 4E F7      [19] 1577 	ld	c,-9 (ix)
   5713 0D            [ 4] 1578 	dec	c
                           1579 ;src/pathfinding.c:263: y = camino[k];
   5714 21 2D 72      [10] 1580 	ld	hl,#_camino
   5717 06 00         [ 7] 1581 	ld	b,#0x00
   5719 09            [11] 1582 	add	hl, bc
   571A 7E            [ 7] 1583 	ld	a,(hl)
   571B DD 77 EE      [19] 1584 	ld	-18 (ix),a
                           1585 ;src/pathfinding.c:264: k--;
   571E 79            [ 4] 1586 	ld	a,c
   571F C6 FF         [ 7] 1587 	add	a,#0xFF
                           1588 ;src/pathfinding.c:265: x = camino[k];
   5721 DD 77 F7      [19] 1589 	ld	-9 (ix),a
   5724 C6 2D         [ 7] 1590 	add	a,#<(_camino)
   5726 6F            [ 4] 1591 	ld	l,a
   5727 3E 72         [ 7] 1592 	ld	a,#>(_camino)
   5729 CE 00         [ 7] 1593 	adc	a, #0x00
   572B 67            [ 4] 1594 	ld	h,a
   572C 7E            [ 7] 1595 	ld	a,(hl)
   572D DD 77 F2      [19] 1596 	ld	-14 (ix),a
                           1597 ;src/pathfinding.c:267: }
   5730 C3 8C 55      [10] 1598 	jp	00116$
   5733                    1599 00118$:
                           1600 ;src/pathfinding.c:272: if(problem == 0){
   5733 DD 7E F1      [19] 1601 	ld	a,-15 (ix)
   5736 B7            [ 4] 1602 	or	a, a
   5737 20 72         [12] 1603 	jr	NZ,00127$
                           1604 ;src/pathfinding.c:273: if(sol_tam < 70){
   5739 3A EC 69      [13] 1605 	ld	a,(#_sol_tam + 0)
   573C D6 46         [ 7] 1606 	sub	a, #0x46
   573E 30 0C         [12] 1607 	jr	NC,00120$
                           1608 ;src/pathfinding.c:274: enemy->longitud_camino = sol_tam;
   5740 DD 6E FC      [19] 1609 	ld	l,-4 (ix)
   5743 DD 66 FD      [19] 1610 	ld	h,-3 (ix)
   5746 3A EC 69      [13] 1611 	ld	a,(#_sol_tam + 0)
   5749 77            [ 7] 1612 	ld	(hl),a
   574A 18 08         [12] 1613 	jr	00137$
   574C                    1614 00120$:
                           1615 ;src/pathfinding.c:276: enemy->longitud_camino = 70;
   574C DD 6E FC      [19] 1616 	ld	l,-4 (ix)
   574F DD 66 FD      [19] 1617 	ld	h,-3 (ix)
   5752 36 46         [10] 1618 	ld	(hl),#0x46
                           1619 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   5754                    1620 00137$:
   5754 DD 7E F8      [19] 1621 	ld	a,-8 (ix)
   5757 C6 17         [ 7] 1622 	add	a, #0x17
   5759 DD 77 FE      [19] 1623 	ld	-2 (ix),a
   575C DD 7E F9      [19] 1624 	ld	a,-7 (ix)
   575F CE 00         [ 7] 1625 	adc	a, #0x00
   5761 DD 77 FF      [19] 1626 	ld	-1 (ix),a
   5764 DD 36 E9 00   [19] 1627 	ld	-23 (ix),#0x00
   5768                    1628 00125$:
                           1629 ;src/pathfinding.c:280: enemy->camino[j] = camino[j];
   5768 DD 7E E9      [19] 1630 	ld	a,-23 (ix)
   576B DD 77 FA      [19] 1631 	ld	-6 (ix),a
   576E DD 36 FB 00   [19] 1632 	ld	-5 (ix),#0x00
   5772 DD 7E FE      [19] 1633 	ld	a,-2 (ix)
   5775 DD 86 FA      [19] 1634 	add	a, -6 (ix)
   5778 DD 77 FA      [19] 1635 	ld	-6 (ix),a
   577B DD 7E FF      [19] 1636 	ld	a,-1 (ix)
   577E DD 8E FB      [19] 1637 	adc	a, -5 (ix)
   5781 DD 77 FB      [19] 1638 	ld	-5 (ix),a
   5784 3E 2D         [ 7] 1639 	ld	a,#<(_camino)
   5786 DD 86 E9      [19] 1640 	add	a, -23 (ix)
   5789 DD 77 FC      [19] 1641 	ld	-4 (ix),a
   578C 3E 72         [ 7] 1642 	ld	a,#>(_camino)
   578E CE 00         [ 7] 1643 	adc	a, #0x00
   5790 DD 77 FD      [19] 1644 	ld	-3 (ix),a
   5793 DD 6E FC      [19] 1645 	ld	l,-4 (ix)
   5796 DD 66 FD      [19] 1646 	ld	h,-3 (ix)
   5799 4E            [ 7] 1647 	ld	c,(hl)
   579A DD 6E FA      [19] 1648 	ld	l,-6 (ix)
   579D DD 66 FB      [19] 1649 	ld	h,-5 (ix)
   57A0 71            [ 7] 1650 	ld	(hl),c
                           1651 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   57A1 DD 34 E9      [23] 1652 	inc	-23 (ix)
   57A4 DD 7E E9      [19] 1653 	ld	a,-23 (ix)
   57A7 D6 46         [ 7] 1654 	sub	a, #0x46
   57A9 38 BD         [12] 1655 	jr	C,00125$
   57AB                    1656 00127$:
   57AB DD F9         [10] 1657 	ld	sp, ix
   57AD DD E1         [14] 1658 	pop	ix
   57AF C9            [10] 1659 	ret
                           1660 	.area _CODE
                           1661 	.area _INITIALIZER
                           1662 	.area _CABS (ABS)
