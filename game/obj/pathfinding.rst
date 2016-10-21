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
   77B7                      28 _sol_tam::
   77B7                      29 	.ds 1
   77B8                      30 _sol_matriz::
   77B8                      31 	.ds 1760
   7E98                      32 _camino::
   7E98                      33 	.ds 70
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
                             58 ;src/pathfinding.c:14: i16 abs (i16 n) {
                             59 ;	---------------------------------
                             60 ; Function abs
                             61 ; ---------------------------------
   5B42                      62 _abs::
   5B42 DD E5         [15]   63 	push	ix
   5B44 DD 21 00 00   [14]   64 	ld	ix,#0
   5B48 DD 39         [15]   65 	add	ix,sp
   5B4A F5            [11]   66 	push	af
   5B4B F5            [11]   67 	push	af
                             68 ;src/pathfinding.c:15: const i16 ret[2] = { n, -n };
   5B4C 21 00 00      [10]   69 	ld	hl,#0x0000
   5B4F 39            [11]   70 	add	hl,sp
   5B50 4D            [ 4]   71 	ld	c,l
   5B51 44            [ 4]   72 	ld	b,h
   5B52 DD 7E 04      [19]   73 	ld	a,4 (ix)
   5B55 77            [ 7]   74 	ld	(hl),a
   5B56 23            [ 6]   75 	inc	hl
   5B57 DD 7E 05      [19]   76 	ld	a,5 (ix)
   5B5A 77            [ 7]   77 	ld	(hl),a
   5B5B 69            [ 4]   78 	ld	l, c
   5B5C 60            [ 4]   79 	ld	h, b
   5B5D 23            [ 6]   80 	inc	hl
   5B5E 23            [ 6]   81 	inc	hl
   5B5F AF            [ 4]   82 	xor	a, a
   5B60 DD 96 04      [19]   83 	sub	a, 4 (ix)
   5B63 5F            [ 4]   84 	ld	e,a
   5B64 3E 00         [ 7]   85 	ld	a, #0x00
   5B66 DD 9E 05      [19]   86 	sbc	a, 5 (ix)
   5B69 57            [ 4]   87 	ld	d,a
   5B6A 73            [ 7]   88 	ld	(hl),e
   5B6B 23            [ 6]   89 	inc	hl
   5B6C 72            [ 7]   90 	ld	(hl),d
                             91 ;src/pathfinding.c:16: return ret[n<0];
   5B6D DD 7E 05      [19]   92 	ld	a,5 (ix)
   5B70 07            [ 4]   93 	rlca
   5B71 E6 01         [ 7]   94 	and	a,#0x01
   5B73 6F            [ 4]   95 	ld	l,a
   5B74 17            [ 4]   96 	rla
   5B75 9F            [ 4]   97 	sbc	a, a
   5B76 67            [ 4]   98 	ld	h,a
   5B77 29            [11]   99 	add	hl, hl
   5B78 09            [11]  100 	add	hl,bc
   5B79 4E            [ 7]  101 	ld	c,(hl)
   5B7A 23            [ 6]  102 	inc	hl
   5B7B 66            [ 7]  103 	ld	h,(hl)
   5B7C 69            [ 4]  104 	ld	l, c
   5B7D DD F9         [10]  105 	ld	sp, ix
   5B7F DD E1         [14]  106 	pop	ix
   5B81 C9            [10]  107 	ret
   5B82                     108 _bitWeights:
   5B82 01 00               109 	.dw #0x0001
   5B84 02 00               110 	.dw #0x0002
   5B86 04 00               111 	.dw #0x0004
   5B88 08 00               112 	.dw #0x0008
   5B8A 10 00               113 	.dw #0x0010
   5B8C 20 00               114 	.dw #0x0020
   5B8E 40 00               115 	.dw #0x0040
   5B90 80 00               116 	.dw #0x0080
                            117 ;src/pathfinding.c:19: u8 getBit(u8 *array, u16 pos)
                            118 ;	---------------------------------
                            119 ; Function getBit
                            120 ; ---------------------------------
   5B92                     121 _getBit::
   5B92 DD E5         [15]  122 	push	ix
   5B94 DD 21 00 00   [14]  123 	ld	ix,#0
   5B98 DD 39         [15]  124 	add	ix,sp
                            125 ;src/pathfinding.c:24: byteV = array[pos/8];
   5B9A DD 4E 06      [19]  126 	ld	c,6 (ix)
   5B9D DD 46 07      [19]  127 	ld	b,7 (ix)
   5BA0 CB 38         [ 8]  128 	srl	b
   5BA2 CB 19         [ 8]  129 	rr	c
   5BA4 CB 38         [ 8]  130 	srl	b
   5BA6 CB 19         [ 8]  131 	rr	c
   5BA8 CB 38         [ 8]  132 	srl	b
   5BAA CB 19         [ 8]  133 	rr	c
   5BAC DD 6E 04      [19]  134 	ld	l,4 (ix)
   5BAF DD 66 05      [19]  135 	ld	h,5 (ix)
   5BB2 09            [11]  136 	add	hl,bc
   5BB3 4E            [ 7]  137 	ld	c,(hl)
   5BB4 06 00         [ 7]  138 	ld	b,#0x00
                            139 ;src/pathfinding.c:25: bitV = bitWeights[pos%8];
   5BB6 DD 7E 06      [19]  140 	ld	a,6 (ix)
   5BB9 E6 07         [ 7]  141 	and	a, #0x07
   5BBB 6F            [ 4]  142 	ld	l,a
   5BBC 26 00         [ 7]  143 	ld	h,#0x00
   5BBE 29            [11]  144 	add	hl, hl
   5BBF 11 82 5B      [10]  145 	ld	de,#_bitWeights
   5BC2 19            [11]  146 	add	hl,de
   5BC3 5E            [ 7]  147 	ld	e,(hl)
   5BC4 23            [ 6]  148 	inc	hl
   5BC5 56            [ 7]  149 	ld	d,(hl)
                            150 ;src/pathfinding.c:26: return (byteV & bitV) == bitV;
   5BC6 79            [ 4]  151 	ld	a,c
   5BC7 A3            [ 4]  152 	and	a, e
   5BC8 4F            [ 4]  153 	ld	c,a
   5BC9 78            [ 4]  154 	ld	a,b
   5BCA A2            [ 4]  155 	and	a, d
   5BCB 47            [ 4]  156 	ld	b,a
   5BCC 7B            [ 4]  157 	ld	a,e
   5BCD 91            [ 4]  158 	sub	a, c
   5BCE 20 08         [12]  159 	jr	NZ,00103$
   5BD0 7A            [ 4]  160 	ld	a,d
   5BD1 90            [ 4]  161 	sub	a, b
   5BD2 20 04         [12]  162 	jr	NZ,00103$
   5BD4 3E 01         [ 7]  163 	ld	a,#0x01
   5BD6 18 01         [12]  164 	jr	00104$
   5BD8                     165 00103$:
   5BD8 AF            [ 4]  166 	xor	a,a
   5BD9                     167 00104$:
   5BD9 6F            [ 4]  168 	ld	l,a
   5BDA DD E1         [14]  169 	pop	ix
   5BDC C9            [10]  170 	ret
                            171 ;src/pathfinding.c:29: void setBit(u8 *array, u16 pos, u16 value)
                            172 ;	---------------------------------
                            173 ; Function setBit
                            174 ; ---------------------------------
   5BDD                     175 _setBit::
   5BDD DD E5         [15]  176 	push	ix
   5BDF DD 21 00 00   [14]  177 	ld	ix,#0
   5BE3 DD 39         [15]  178 	add	ix,sp
                            179 ;src/pathfinding.c:35: bytePos = pos/8;
   5BE5 DD 5E 06      [19]  180 	ld	e,6 (ix)
   5BE8 DD 56 07      [19]  181 	ld	d,7 (ix)
   5BEB CB 3A         [ 8]  182 	srl	d
   5BED CB 1B         [ 8]  183 	rr	e
   5BEF CB 3A         [ 8]  184 	srl	d
   5BF1 CB 1B         [ 8]  185 	rr	e
   5BF3 CB 3A         [ 8]  186 	srl	d
   5BF5 CB 1B         [ 8]  187 	rr	e
                            188 ;src/pathfinding.c:37: bitV = bitWeights[pos%8];
   5BF7 01 82 5B      [10]  189 	ld	bc,#_bitWeights+0
   5BFA DD 7E 06      [19]  190 	ld	a,6 (ix)
   5BFD E6 07         [ 7]  191 	and	a, #0x07
   5BFF 6F            [ 4]  192 	ld	l,a
   5C00 26 00         [ 7]  193 	ld	h,#0x00
   5C02 29            [11]  194 	add	hl, hl
   5C03 09            [11]  195 	add	hl,bc
   5C04 4E            [ 7]  196 	ld	c,(hl)
   5C05 23            [ 6]  197 	inc	hl
   5C06 46            [ 7]  198 	ld	b,(hl)
                            199 ;src/pathfinding.c:41: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   5C07 DD 6E 04      [19]  200 	ld	l,4 (ix)
   5C0A DD 66 05      [19]  201 	ld	h,5 (ix)
   5C0D 19            [11]  202 	add	hl,de
                            203 ;src/pathfinding.c:39: if(value == 0)
   5C0E DD 7E 09      [19]  204 	ld	a,9 (ix)
   5C11 DD B6 08      [19]  205 	or	a,8 (ix)
   5C14 20 20         [12]  206 	jr	NZ,00106$
                            207 ;src/pathfinding.c:41: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   5C16 E5            [11]  208 	push	hl
   5C17 C5            [11]  209 	push	bc
   5C18 DD 5E 06      [19]  210 	ld	e,6 (ix)
   5C1B DD 56 07      [19]  211 	ld	d,7 (ix)
   5C1E D5            [11]  212 	push	de
   5C1F DD 5E 04      [19]  213 	ld	e,4 (ix)
   5C22 DD 56 05      [19]  214 	ld	d,5 (ix)
   5C25 D5            [11]  215 	push	de
   5C26 CD 92 5B      [17]  216 	call	_getBit
   5C29 F1            [10]  217 	pop	af
   5C2A F1            [10]  218 	pop	af
   5C2B 7D            [ 4]  219 	ld	a,l
   5C2C C1            [10]  220 	pop	bc
   5C2D E1            [10]  221 	pop	hl
   5C2E B7            [ 4]  222 	or	a, a
   5C2F 28 23         [12]  223 	jr	Z,00108$
   5C31 7E            [ 7]  224 	ld	a, (hl)
   5C32 91            [ 4]  225 	sub	a, c
   5C33 77            [ 7]  226 	ld	(hl),a
   5C34 18 1E         [12]  227 	jr	00108$
   5C36                     228 00106$:
                            229 ;src/pathfinding.c:45: if(getBit(array, pos) == 0) array[bytePos] += bitV;
   5C36 E5            [11]  230 	push	hl
   5C37 C5            [11]  231 	push	bc
   5C38 DD 5E 06      [19]  232 	ld	e,6 (ix)
   5C3B DD 56 07      [19]  233 	ld	d,7 (ix)
   5C3E D5            [11]  234 	push	de
   5C3F DD 5E 04      [19]  235 	ld	e,4 (ix)
   5C42 DD 56 05      [19]  236 	ld	d,5 (ix)
   5C45 D5            [11]  237 	push	de
   5C46 CD 92 5B      [17]  238 	call	_getBit
   5C49 F1            [10]  239 	pop	af
   5C4A F1            [10]  240 	pop	af
   5C4B 7D            [ 4]  241 	ld	a,l
   5C4C C1            [10]  242 	pop	bc
   5C4D E1            [10]  243 	pop	hl
   5C4E B7            [ 4]  244 	or	a, a
   5C4F 20 03         [12]  245 	jr	NZ,00108$
   5C51 7E            [ 7]  246 	ld	a, (hl)
   5C52 81            [ 4]  247 	add	a, c
   5C53 77            [ 7]  248 	ld	(hl),a
   5C54                     249 00108$:
   5C54 DD E1         [14]  250 	pop	ix
   5C56 C9            [10]  251 	ret
                            252 ;src/pathfinding.c:50: u8 anyadirALista(u8 x, u8 y){
                            253 ;	---------------------------------
                            254 ; Function anyadirALista
                            255 ; ---------------------------------
   5C57                     256 _anyadirALista::
                            257 ;src/pathfinding.c:51: u8 anyadido = 0;
   5C57 0E 00         [ 7]  258 	ld	c,#0x00
                            259 ;src/pathfinding.c:53: if(sol_tam < 70){
   5C59 3A B7 77      [13]  260 	ld	a,(#_sol_tam + 0)
   5C5C D6 46         [ 7]  261 	sub	a, #0x46
   5C5E 30 33         [12]  262 	jr	NC,00102$
                            263 ;src/pathfinding.c:54: camino[sol_tam-1] = x;
   5C60 01 98 7E      [10]  264 	ld	bc,#_camino+0
   5C63 21 B7 77      [10]  265 	ld	hl,#_sol_tam + 0
   5C66 5E            [ 7]  266 	ld	e, (hl)
   5C67 1D            [ 4]  267 	dec	e
   5C68 6B            [ 4]  268 	ld	l,e
   5C69 26 00         [ 7]  269 	ld	h,#0x00
   5C6B 09            [11]  270 	add	hl,bc
   5C6C FD 21 02 00   [14]  271 	ld	iy,#2
   5C70 FD 39         [15]  272 	add	iy,sp
   5C72 FD 7E 00      [19]  273 	ld	a,0 (iy)
   5C75 77            [ 7]  274 	ld	(hl),a
                            275 ;src/pathfinding.c:55: sol_tam++;
   5C76 21 B7 77      [10]  276 	ld	hl, #_sol_tam+0
   5C79 34            [11]  277 	inc	(hl)
                            278 ;src/pathfinding.c:56: camino[sol_tam-1] = y;
   5C7A 21 B7 77      [10]  279 	ld	hl,#_sol_tam + 0
   5C7D 5E            [ 7]  280 	ld	e, (hl)
   5C7E 1D            [ 4]  281 	dec	e
   5C7F 6B            [ 4]  282 	ld	l,e
   5C80 26 00         [ 7]  283 	ld	h,#0x00
   5C82 09            [11]  284 	add	hl,bc
   5C83 FD 21 03 00   [14]  285 	ld	iy,#3
   5C87 FD 39         [15]  286 	add	iy,sp
   5C89 FD 7E 00      [19]  287 	ld	a,0 (iy)
   5C8C 77            [ 7]  288 	ld	(hl),a
                            289 ;src/pathfinding.c:57: sol_tam++;
   5C8D 21 B7 77      [10]  290 	ld	hl, #_sol_tam+0
   5C90 34            [11]  291 	inc	(hl)
                            292 ;src/pathfinding.c:58: anyadido = 1;
   5C91 0E 01         [ 7]  293 	ld	c,#0x01
   5C93                     294 00102$:
                            295 ;src/pathfinding.c:61: return anyadido;
   5C93 69            [ 4]  296 	ld	l,c
   5C94 C9            [10]  297 	ret
                            298 ;src/pathfinding.c:65: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            299 ;	---------------------------------
                            300 ; Function adjacentTiles
                            301 ; ---------------------------------
   5C95                     302 _adjacentTiles::
   5C95 DD E5         [15]  303 	push	ix
   5C97 DD 21 00 00   [14]  304 	ld	ix,#0
   5C9B DD 39         [15]  305 	add	ix,sp
   5C9D 21 D9 FF      [10]  306 	ld	hl,#-39
   5CA0 39            [11]  307 	add	hl,sp
   5CA1 F9            [ 6]  308 	ld	sp,hl
                            309 ;src/pathfinding.c:66: u8 resultado = 4;
   5CA2 DD 36 E9 04   [19]  310 	ld	-23 (ix),#0x04
                            311 ;src/pathfinding.c:68: i16 dist1 = 0;
   5CA6 DD 36 E1 00   [19]  312 	ld	-31 (ix),#0x00
   5CAA DD 36 E2 00   [19]  313 	ld	-30 (ix),#0x00
                            314 ;src/pathfinding.c:69: i16 dist2 = 0;
   5CAE DD 36 E3 00   [19]  315 	ld	-29 (ix),#0x00
   5CB2 DD 36 E4 00   [19]  316 	ld	-28 (ix),#0x00
                            317 ;src/pathfinding.c:70: i16 dist3 = 0;
   5CB6 DD 36 DD 00   [19]  318 	ld	-35 (ix),#0x00
   5CBA DD 36 DE 00   [19]  319 	ld	-34 (ix),#0x00
                            320 ;src/pathfinding.c:73: i16 heu_derecha = 0;
   5CBE DD 36 DF 00   [19]  321 	ld	-33 (ix),#0x00
   5CC2 DD 36 E0 00   [19]  322 	ld	-32 (ix),#0x00
                            323 ;src/pathfinding.c:74: i16 heu_izquierda = 0;
   5CC6 21 00 00      [10]  324 	ld	hl,#0x0000
   5CC9 E3            [19]  325 	ex	(sp), hl
                            326 ;src/pathfinding.c:75: i16 heu_arriba = 0;
   5CCA DD 36 E5 00   [19]  327 	ld	-27 (ix),#0x00
   5CCE DD 36 E6 00   [19]  328 	ld	-26 (ix),#0x00
                            329 ;src/pathfinding.c:76: i16 heu_abajo = 0;
   5CD2 DD 36 DB 00   [19]  330 	ld	-37 (ix),#0x00
   5CD6 DD 36 DC 00   [19]  331 	ld	-36 (ix),#0x00
                            332 ;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
   5CDA DD 7E 05      [19]  333 	ld	a,5 (ix)
   5CDD DD 77 F8      [19]  334 	ld	-8 (ix),a
   5CE0 DD 36 F9 00   [19]  335 	ld	-7 (ix),#0x00
   5CE4 DD 7E 04      [19]  336 	ld	a,4 (ix)
   5CE7 DD 77 FA      [19]  337 	ld	-6 (ix),a
   5CEA DD 36 FB 00   [19]  338 	ld	-5 (ix),#0x00
   5CEE DD 7E F8      [19]  339 	ld	a,-8 (ix)
   5CF1 C6 E8         [ 7]  340 	add	a,#0xE8
   5CF3 5F            [ 4]  341 	ld	e,a
   5CF4 DD 7E F9      [19]  342 	ld	a,-7 (ix)
   5CF7 CE FF         [ 7]  343 	adc	a,#0xFF
   5CF9 57            [ 4]  344 	ld	d,a
   5CFA DD 7E FA      [19]  345 	ld	a,-6 (ix)
   5CFD C6 FF         [ 7]  346 	add	a,#0xFF
   5CFF DD 77 EA      [19]  347 	ld	-22 (ix),a
   5D02 DD 7E FB      [19]  348 	ld	a,-5 (ix)
   5D05 CE FF         [ 7]  349 	adc	a,#0xFF
   5D07 DD 77 EB      [19]  350 	ld	-21 (ix),a
                            351 ;src/pathfinding.c:85: setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
   5D0A DD 7E FA      [19]  352 	ld	a,-6 (ix)
   5D0D C6 01         [ 7]  353 	add	a, #0x01
   5D0F DD 77 F4      [19]  354 	ld	-12 (ix),a
   5D12 DD 7E FB      [19]  355 	ld	a,-5 (ix)
   5D15 CE 00         [ 7]  356 	adc	a, #0x00
   5D17 DD 77 F5      [19]  357 	ld	-11 (ix),a
                            358 ;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
   5D1A DD 7E F8      [19]  359 	ld	a,-8 (ix)
   5D1D C6 E7         [ 7]  360 	add	a,#0xE7
   5D1F 4F            [ 4]  361 	ld	c,a
   5D20 DD 7E F9      [19]  362 	ld	a,-7 (ix)
   5D23 CE FF         [ 7]  363 	adc	a,#0xFF
   5D25 47            [ 4]  364 	ld	b,a
                            365 ;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
   5D26 DD 7E F8      [19]  366 	ld	a,-8 (ix)
   5D29 C6 E9         [ 7]  367 	add	a, #0xE9
   5D2B DD 77 EC      [19]  368 	ld	-20 (ix),a
   5D2E DD 7E F9      [19]  369 	ld	a,-7 (ix)
   5D31 CE FF         [ 7]  370 	adc	a, #0xFF
   5D33 DD 77 ED      [19]  371 	ld	-19 (ix),a
                            372 ;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
   5D36 6B            [ 4]  373 	ld	l, e
   5D37 62            [ 4]  374 	ld	h, d
   5D38 29            [11]  375 	add	hl, hl
   5D39 29            [11]  376 	add	hl, hl
   5D3A 19            [11]  377 	add	hl, de
   5D3B 29            [11]  378 	add	hl, hl
   5D3C 19            [11]  379 	add	hl, de
   5D3D 29            [11]  380 	add	hl, hl
   5D3E 29            [11]  381 	add	hl, hl
   5D3F 29            [11]  382 	add	hl, hl
   5D40 29            [11]  383 	add	hl, hl
   5D41 EB            [ 4]  384 	ex	de,hl
                            385 ;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
   5D42 69            [ 4]  386 	ld	l, c
   5D43 60            [ 4]  387 	ld	h, b
   5D44 29            [11]  388 	add	hl, hl
   5D45 29            [11]  389 	add	hl, hl
   5D46 09            [11]  390 	add	hl, bc
   5D47 29            [11]  391 	add	hl, hl
   5D48 09            [11]  392 	add	hl, bc
   5D49 29            [11]  393 	add	hl, hl
   5D4A 29            [11]  394 	add	hl, hl
   5D4B 29            [11]  395 	add	hl, hl
   5D4C 29            [11]  396 	add	hl, hl
   5D4D 4D            [ 4]  397 	ld	c,l
   5D4E 44            [ 4]  398 	ld	b,h
                            399 ;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
   5D4F D5            [11]  400 	push	de
   5D50 DD 5E EC      [19]  401 	ld	e,-20 (ix)
   5D53 DD 56 ED      [19]  402 	ld	d,-19 (ix)
   5D56 6B            [ 4]  403 	ld	l, e
   5D57 62            [ 4]  404 	ld	h, d
   5D58 29            [11]  405 	add	hl, hl
   5D59 29            [11]  406 	add	hl, hl
   5D5A 19            [11]  407 	add	hl, de
   5D5B 29            [11]  408 	add	hl, hl
   5D5C 19            [11]  409 	add	hl, de
   5D5D 29            [11]  410 	add	hl, hl
   5D5E 29            [11]  411 	add	hl, hl
   5D5F 29            [11]  412 	add	hl, hl
   5D60 29            [11]  413 	add	hl, hl
   5D61 D1            [10]  414 	pop	de
                            415 ;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
   5D62 DD 7E EA      [19]  416 	ld	a,-22 (ix)
   5D65 83            [ 4]  417 	add	a, e
   5D66 DD 77 EC      [19]  418 	ld	-20 (ix),a
   5D69 DD 7E EB      [19]  419 	ld	a,-21 (ix)
   5D6C 8A            [ 4]  420 	adc	a, d
   5D6D DD 77 ED      [19]  421 	ld	-19 (ix),a
                            422 ;src/pathfinding.c:85: setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
   5D70 DD 7E F4      [19]  423 	ld	a,-12 (ix)
   5D73 83            [ 4]  424 	add	a, e
   5D74 DD 77 F2      [19]  425 	ld	-14 (ix),a
   5D77 DD 7E F5      [19]  426 	ld	a,-11 (ix)
   5D7A 8A            [ 4]  427 	adc	a, d
   5D7B DD 77 F3      [19]  428 	ld	-13 (ix),a
                            429 ;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
   5D7E DD 7E FA      [19]  430 	ld	a,-6 (ix)
   5D81 81            [ 4]  431 	add	a, c
   5D82 DD 77 FE      [19]  432 	ld	-2 (ix),a
   5D85 DD 7E FB      [19]  433 	ld	a,-5 (ix)
   5D88 88            [ 4]  434 	adc	a, b
   5D89 DD 77 FF      [19]  435 	ld	-1 (ix),a
                            436 ;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
   5D8C DD 7E FA      [19]  437 	ld	a,-6 (ix)
   5D8F 85            [ 4]  438 	add	a, l
   5D90 DD 77 FC      [19]  439 	ld	-4 (ix),a
   5D93 DD 7E FB      [19]  440 	ld	a,-5 (ix)
   5D96 8C            [ 4]  441 	adc	a, h
   5D97 DD 77 FD      [19]  442 	ld	-3 (ix),a
                            443 ;src/pathfinding.c:80: if(x == f_x){
   5D9A DD 7E 04      [19]  444 	ld	a,4 (ix)
   5D9D DD 96 08      [19]  445 	sub	a, 8 (ix)
   5DA0 20 5C         [12]  446 	jr	NZ,00130$
                            447 ;src/pathfinding.c:82: if(s_x < x){
   5DA2 DD 7E 06      [19]  448 	ld	a,6 (ix)
   5DA5 DD 96 04      [19]  449 	sub	a, 4 (ix)
   5DA8 30 19         [12]  450 	jr	NC,00102$
                            451 ;src/pathfinding.c:83: setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
   5DAA 21 01 00      [10]  452 	ld	hl,#0x0001
   5DAD E5            [11]  453 	push	hl
   5DAE DD 6E EC      [19]  454 	ld	l,-20 (ix)
   5DB1 DD 66 ED      [19]  455 	ld	h,-19 (ix)
   5DB4 E5            [11]  456 	push	hl
   5DB5 21 B8 77      [10]  457 	ld	hl,#_sol_matriz
   5DB8 E5            [11]  458 	push	hl
   5DB9 CD DD 5B      [17]  459 	call	_setBit
   5DBC 21 06 00      [10]  460 	ld	hl,#6
   5DBF 39            [11]  461 	add	hl,sp
   5DC0 F9            [ 6]  462 	ld	sp,hl
   5DC1 18 17         [12]  463 	jr	00103$
   5DC3                     464 00102$:
                            465 ;src/pathfinding.c:85: setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
   5DC3 21 01 00      [10]  466 	ld	hl,#0x0001
   5DC6 E5            [11]  467 	push	hl
   5DC7 DD 6E F2      [19]  468 	ld	l,-14 (ix)
   5DCA DD 66 F3      [19]  469 	ld	h,-13 (ix)
   5DCD E5            [11]  470 	push	hl
   5DCE 21 B8 77      [10]  471 	ld	hl,#_sol_matriz
   5DD1 E5            [11]  472 	push	hl
   5DD2 CD DD 5B      [17]  473 	call	_setBit
   5DD5 21 06 00      [10]  474 	ld	hl,#6
   5DD8 39            [11]  475 	add	hl,sp
   5DD9 F9            [ 6]  476 	ld	sp,hl
   5DDA                     477 00103$:
                            478 ;src/pathfinding.c:89: if(y < f_y)
   5DDA DD 7E 05      [19]  479 	ld	a,5 (ix)
   5DDD DD 96 09      [19]  480 	sub	a, 9 (ix)
   5DE0 30 08         [12]  481 	jr	NC,00105$
                            482 ;src/pathfinding.c:90: heu_abajo = -1;
   5DE2 DD 36 DB FF   [19]  483 	ld	-37 (ix),#0xFF
   5DE6 DD 36 DC FF   [19]  484 	ld	-36 (ix),#0xFF
   5DEA                     485 00105$:
                            486 ;src/pathfinding.c:92: if(y > f_y)
   5DEA DD 7E 09      [19]  487 	ld	a,9 (ix)
   5DED DD 96 05      [19]  488 	sub	a, 5 (ix)
   5DF0 D2 B0 5E      [10]  489 	jp	NC,00131$
                            490 ;src/pathfinding.c:93: heu_arriba = -1;
   5DF3 DD 36 E5 FF   [19]  491 	ld	-27 (ix),#0xFF
   5DF7 DD 36 E6 FF   [19]  492 	ld	-26 (ix),#0xFF
   5DFB C3 B0 5E      [10]  493 	jp	00131$
   5DFE                     494 00130$:
                            495 ;src/pathfinding.c:95: }else if(y == f_y){
   5DFE DD 7E 05      [19]  496 	ld	a,5 (ix)
   5E01 DD 96 09      [19]  497 	sub	a, 9 (ix)
   5E04 20 56         [12]  498 	jr	NZ,00127$
                            499 ;src/pathfinding.c:97: if(s_y < y){
   5E06 DD 7E 07      [19]  500 	ld	a,7 (ix)
   5E09 DD 96 05      [19]  501 	sub	a, 5 (ix)
   5E0C 30 19         [12]  502 	jr	NC,00109$
                            503 ;src/pathfinding.c:98: setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
   5E0E 21 01 00      [10]  504 	ld	hl,#0x0001
   5E11 E5            [11]  505 	push	hl
   5E12 DD 6E FE      [19]  506 	ld	l,-2 (ix)
   5E15 DD 66 FF      [19]  507 	ld	h,-1 (ix)
   5E18 E5            [11]  508 	push	hl
   5E19 21 B8 77      [10]  509 	ld	hl,#_sol_matriz
   5E1C E5            [11]  510 	push	hl
   5E1D CD DD 5B      [17]  511 	call	_setBit
   5E20 21 06 00      [10]  512 	ld	hl,#6
   5E23 39            [11]  513 	add	hl,sp
   5E24 F9            [ 6]  514 	ld	sp,hl
   5E25 18 17         [12]  515 	jr	00110$
   5E27                     516 00109$:
                            517 ;src/pathfinding.c:101: setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
   5E27 21 01 00      [10]  518 	ld	hl,#0x0001
   5E2A E5            [11]  519 	push	hl
   5E2B DD 6E FC      [19]  520 	ld	l,-4 (ix)
   5E2E DD 66 FD      [19]  521 	ld	h,-3 (ix)
   5E31 E5            [11]  522 	push	hl
   5E32 21 B8 77      [10]  523 	ld	hl,#_sol_matriz
   5E35 E5            [11]  524 	push	hl
   5E36 CD DD 5B      [17]  525 	call	_setBit
   5E39 21 06 00      [10]  526 	ld	hl,#6
   5E3C 39            [11]  527 	add	hl,sp
   5E3D F9            [ 6]  528 	ld	sp,hl
   5E3E                     529 00110$:
                            530 ;src/pathfinding.c:104: if(x < f_x)
   5E3E DD 7E 04      [19]  531 	ld	a,4 (ix)
   5E41 DD 96 08      [19]  532 	sub	a, 8 (ix)
   5E44 30 08         [12]  533 	jr	NC,00112$
                            534 ;src/pathfinding.c:105: heu_derecha = -1;
   5E46 DD 36 DF FF   [19]  535 	ld	-33 (ix),#0xFF
   5E4A DD 36 E0 FF   [19]  536 	ld	-32 (ix),#0xFF
   5E4E                     537 00112$:
                            538 ;src/pathfinding.c:106: if(x > f_x)
   5E4E DD 7E 08      [19]  539 	ld	a,8 (ix)
   5E51 DD 96 04      [19]  540 	sub	a, 4 (ix)
   5E54 30 5A         [12]  541 	jr	NC,00131$
                            542 ;src/pathfinding.c:107: heu_izquierda = -1;
   5E56 21 FF FF      [10]  543 	ld	hl,#0xFFFF
   5E59 E3            [19]  544 	ex	(sp), hl
   5E5A 18 54         [12]  545 	jr	00131$
   5E5C                     546 00127$:
                            547 ;src/pathfinding.c:113: if(s_y < f_y)
   5E5C DD 7E 07      [19]  548 	ld	a,7 (ix)
   5E5F DD 96 09      [19]  549 	sub	a, 9 (ix)
   5E62 3E 00         [ 7]  550 	ld	a,#0x00
   5E64 17            [ 4]  551 	rla
   5E65 4F            [ 4]  552 	ld	c,a
                            553 ;src/pathfinding.c:112: if(s_x < f_x){
   5E66 DD 7E 06      [19]  554 	ld	a,6 (ix)
   5E69 DD 96 08      [19]  555 	sub	a, 8 (ix)
   5E6C 30 20         [12]  556 	jr	NC,00124$
                            557 ;src/pathfinding.c:113: if(s_y < f_y)
   5E6E 79            [ 4]  558 	ld	a,c
   5E6F B7            [ 4]  559 	or	a, a
   5E70 28 0A         [12]  560 	jr	Z,00116$
                            561 ;src/pathfinding.c:114: heu_abajo = -1;
   5E72 DD 36 DB FF   [19]  562 	ld	-37 (ix),#0xFF
   5E76 DD 36 DC FF   [19]  563 	ld	-36 (ix),#0xFF
   5E7A 18 08         [12]  564 	jr	00117$
   5E7C                     565 00116$:
                            566 ;src/pathfinding.c:116: heu_arriba = -1;
   5E7C DD 36 E5 FF   [19]  567 	ld	-27 (ix),#0xFF
   5E80 DD 36 E6 FF   [19]  568 	ld	-26 (ix),#0xFF
   5E84                     569 00117$:
                            570 ;src/pathfinding.c:118: heu_derecha = -1;
   5E84 DD 36 DF FF   [19]  571 	ld	-33 (ix),#0xFF
   5E88 DD 36 E0 FF   [19]  572 	ld	-32 (ix),#0xFF
   5E8C 18 22         [12]  573 	jr	00131$
   5E8E                     574 00124$:
                            575 ;src/pathfinding.c:119: }else if(s_x > f_x){
   5E8E DD 7E 08      [19]  576 	ld	a,8 (ix)
   5E91 DD 96 06      [19]  577 	sub	a, 6 (ix)
   5E94 30 1A         [12]  578 	jr	NC,00131$
                            579 ;src/pathfinding.c:121: if(s_y < f_y)
   5E96 79            [ 4]  580 	ld	a,c
   5E97 B7            [ 4]  581 	or	a, a
   5E98 28 0A         [12]  582 	jr	Z,00119$
                            583 ;src/pathfinding.c:122: heu_abajo = -1;
   5E9A DD 36 DB FF   [19]  584 	ld	-37 (ix),#0xFF
   5E9E DD 36 DC FF   [19]  585 	ld	-36 (ix),#0xFF
   5EA2 18 08         [12]  586 	jr	00120$
   5EA4                     587 00119$:
                            588 ;src/pathfinding.c:124: heu_arriba = -1;
   5EA4 DD 36 E5 FF   [19]  589 	ld	-27 (ix),#0xFF
   5EA8 DD 36 E6 FF   [19]  590 	ld	-26 (ix),#0xFF
   5EAC                     591 00120$:
                            592 ;src/pathfinding.c:126: heu_izquierda = -1;
   5EAC 21 FF FF      [10]  593 	ld	hl,#0xFFFF
   5EAF E3            [19]  594 	ex	(sp), hl
   5EB0                     595 00131$:
                            596 ;src/pathfinding.c:131: if( /* *(matriz + (( (y - 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y-1)-24) * 44*4 + x) != 1){
   5EB0 DD 6E FE      [19]  597 	ld	l,-2 (ix)
   5EB3 DD 66 FF      [19]  598 	ld	h,-1 (ix)
   5EB6 E5            [11]  599 	push	hl
   5EB7 21 B8 77      [10]  600 	ld	hl,#_sol_matriz
   5EBA E5            [11]  601 	push	hl
   5EBB CD 92 5B      [17]  602 	call	_getBit
   5EBE F1            [10]  603 	pop	af
   5EBF F1            [10]  604 	pop	af
                            605 ;src/pathfinding.c:132: dist1 = abs(f_x - x) + abs(f_y - (y-1)) + heu_arriba;
   5EC0 DD 7E 08      [19]  606 	ld	a,8 (ix)
   5EC3 DD 77 FE      [19]  607 	ld	-2 (ix),a
   5EC6 DD 36 FF 00   [19]  608 	ld	-1 (ix),#0x00
   5ECA DD 7E 09      [19]  609 	ld	a,9 (ix)
   5ECD DD 77 EE      [19]  610 	ld	-18 (ix),a
   5ED0 DD 36 EF 00   [19]  611 	ld	-17 (ix),#0x00
   5ED4 DD 7E FE      [19]  612 	ld	a,-2 (ix)
   5ED7 DD 96 FA      [19]  613 	sub	a, -6 (ix)
   5EDA DD 77 FA      [19]  614 	ld	-6 (ix),a
   5EDD DD 7E FF      [19]  615 	ld	a,-1 (ix)
   5EE0 DD 9E FB      [19]  616 	sbc	a, -5 (ix)
   5EE3 DD 77 FB      [19]  617 	ld	-5 (ix),a
                            618 ;src/pathfinding.c:131: if( /* *(matriz + (( (y - 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y-1)-24) * 44*4 + x) != 1){
   5EE6 2D            [ 4]  619 	dec	l
   5EE7 28 78         [12]  620 	jr	Z,00133$
                            621 ;src/pathfinding.c:132: dist1 = abs(f_x - x) + abs(f_y - (y-1)) + heu_arriba;
   5EE9 DD 6E FA      [19]  622 	ld	l,-6 (ix)
   5EEC DD 66 FB      [19]  623 	ld	h,-5 (ix)
   5EEF E5            [11]  624 	push	hl
   5EF0 CD 42 5B      [17]  625 	call	_abs
   5EF3 F1            [10]  626 	pop	af
   5EF4 DD 74 F1      [19]  627 	ld	-15 (ix),h
   5EF7 DD 75 F0      [19]  628 	ld	-16 (ix),l
   5EFA DD 7E F8      [19]  629 	ld	a,-8 (ix)
   5EFD C6 FF         [ 7]  630 	add	a,#0xFF
   5EFF DD 77 F6      [19]  631 	ld	-10 (ix),a
   5F02 DD 7E F9      [19]  632 	ld	a,-7 (ix)
   5F05 CE FF         [ 7]  633 	adc	a,#0xFF
   5F07 DD 77 F7      [19]  634 	ld	-9 (ix),a
   5F0A DD 7E EE      [19]  635 	ld	a,-18 (ix)
   5F0D DD 96 F6      [19]  636 	sub	a, -10 (ix)
   5F10 DD 77 F6      [19]  637 	ld	-10 (ix),a
   5F13 DD 7E EF      [19]  638 	ld	a,-17 (ix)
   5F16 DD 9E F7      [19]  639 	sbc	a, -9 (ix)
   5F19 DD 77 F7      [19]  640 	ld	-9 (ix),a
   5F1C DD 6E F6      [19]  641 	ld	l,-10 (ix)
   5F1F DD 66 F7      [19]  642 	ld	h,-9 (ix)
   5F22 E5            [11]  643 	push	hl
   5F23 CD 42 5B      [17]  644 	call	_abs
   5F26 F1            [10]  645 	pop	af
   5F27 DD 74 F7      [19]  646 	ld	-9 (ix),h
   5F2A DD 75 F6      [19]  647 	ld	-10 (ix),l
   5F2D DD 7E F0      [19]  648 	ld	a,-16 (ix)
   5F30 DD 86 F6      [19]  649 	add	a, -10 (ix)
   5F33 DD 77 F6      [19]  650 	ld	-10 (ix),a
   5F36 DD 7E F1      [19]  651 	ld	a,-15 (ix)
   5F39 DD 8E F7      [19]  652 	adc	a, -9 (ix)
   5F3C DD 77 F7      [19]  653 	ld	-9 (ix),a
   5F3F DD 7E F6      [19]  654 	ld	a,-10 (ix)
   5F42 DD 86 E5      [19]  655 	add	a, -27 (ix)
   5F45 DD 77 F6      [19]  656 	ld	-10 (ix),a
   5F48 DD 7E F7      [19]  657 	ld	a,-9 (ix)
   5F4B DD 8E E6      [19]  658 	adc	a, -26 (ix)
   5F4E DD 77 F7      [19]  659 	ld	-9 (ix),a
   5F51 DD 7E F6      [19]  660 	ld	a,-10 (ix)
   5F54 DD 77 E1      [19]  661 	ld	-31 (ix),a
   5F57 DD 7E F7      [19]  662 	ld	a,-9 (ix)
   5F5A DD 77 E2      [19]  663 	ld	-30 (ix),a
                            664 ;src/pathfinding.c:133: resultado = 0;
   5F5D DD 36 E9 00   [19]  665 	ld	-23 (ix),#0x00
   5F61                     666 00133$:
                            667 ;src/pathfinding.c:136: if(  /**(matriz + (( (y + 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y+1)-24) * 44*4 + x) != 1){
   5F61 DD 6E FC      [19]  668 	ld	l,-4 (ix)
   5F64 DD 66 FD      [19]  669 	ld	h,-3 (ix)
   5F67 E5            [11]  670 	push	hl
   5F68 21 B8 77      [10]  671 	ld	hl,#_sol_matriz
   5F6B E5            [11]  672 	push	hl
   5F6C CD 92 5B      [17]  673 	call	_getBit
   5F6F F1            [10]  674 	pop	af
   5F70 F1            [10]  675 	pop	af
   5F71 2D            [ 4]  676 	dec	l
   5F72 CA 0D 60      [10]  677 	jp	Z,00140$
                            678 ;src/pathfinding.c:137: dist2 = abs(f_x - x) + abs(f_y - (y+1)) + heu_abajo;
   5F75 DD 6E FA      [19]  679 	ld	l,-6 (ix)
   5F78 DD 66 FB      [19]  680 	ld	h,-5 (ix)
   5F7B E5            [11]  681 	push	hl
   5F7C CD 42 5B      [17]  682 	call	_abs
   5F7F F1            [10]  683 	pop	af
   5F80 DD 74 F7      [19]  684 	ld	-9 (ix),h
   5F83 DD 75 F6      [19]  685 	ld	-10 (ix),l
   5F86 DD 7E F8      [19]  686 	ld	a,-8 (ix)
   5F89 C6 01         [ 7]  687 	add	a, #0x01
   5F8B DD 77 F0      [19]  688 	ld	-16 (ix),a
   5F8E DD 7E F9      [19]  689 	ld	a,-7 (ix)
   5F91 CE 00         [ 7]  690 	adc	a, #0x00
   5F93 DD 77 F1      [19]  691 	ld	-15 (ix),a
   5F96 DD 7E EE      [19]  692 	ld	a,-18 (ix)
   5F99 DD 96 F0      [19]  693 	sub	a, -16 (ix)
   5F9C DD 77 F0      [19]  694 	ld	-16 (ix),a
   5F9F DD 7E EF      [19]  695 	ld	a,-17 (ix)
   5FA2 DD 9E F1      [19]  696 	sbc	a, -15 (ix)
   5FA5 DD 77 F1      [19]  697 	ld	-15 (ix),a
   5FA8 DD 6E F0      [19]  698 	ld	l,-16 (ix)
   5FAB DD 66 F1      [19]  699 	ld	h,-15 (ix)
   5FAE E5            [11]  700 	push	hl
   5FAF CD 42 5B      [17]  701 	call	_abs
   5FB2 F1            [10]  702 	pop	af
   5FB3 DD 74 F1      [19]  703 	ld	-15 (ix),h
   5FB6 DD 75 F0      [19]  704 	ld	-16 (ix),l
   5FB9 DD 7E F6      [19]  705 	ld	a,-10 (ix)
   5FBC DD 86 F0      [19]  706 	add	a, -16 (ix)
   5FBF DD 77 F6      [19]  707 	ld	-10 (ix),a
   5FC2 DD 7E F7      [19]  708 	ld	a,-9 (ix)
   5FC5 DD 8E F1      [19]  709 	adc	a, -15 (ix)
   5FC8 DD 77 F7      [19]  710 	ld	-9 (ix),a
   5FCB DD 7E DB      [19]  711 	ld	a,-37 (ix)
   5FCE DD 86 F6      [19]  712 	add	a, -10 (ix)
   5FD1 DD 77 F6      [19]  713 	ld	-10 (ix),a
   5FD4 DD 7E DC      [19]  714 	ld	a,-36 (ix)
   5FD7 DD 8E F7      [19]  715 	adc	a, -9 (ix)
   5FDA DD 77 F7      [19]  716 	ld	-9 (ix),a
   5FDD DD 7E F6      [19]  717 	ld	a,-10 (ix)
   5FE0 DD 77 E3      [19]  718 	ld	-29 (ix),a
   5FE3 DD 7E F7      [19]  719 	ld	a,-9 (ix)
   5FE6 DD 77 E4      [19]  720 	ld	-28 (ix),a
                            721 ;src/pathfinding.c:138: if(resultado == 0){
   5FE9 DD 7E E9      [19]  722 	ld	a,-23 (ix)
   5FEC B7            [ 4]  723 	or	a, a
   5FED 20 1A         [12]  724 	jr	NZ,00137$
                            725 ;src/pathfinding.c:139: if(dist1 > dist2)
   5FEF DD 7E E3      [19]  726 	ld	a,-29 (ix)
   5FF2 DD 96 E1      [19]  727 	sub	a, -31 (ix)
   5FF5 DD 7E E4      [19]  728 	ld	a,-28 (ix)
   5FF8 DD 9E E2      [19]  729 	sbc	a, -30 (ix)
   5FFB E2 00 60      [10]  730 	jp	PO, 00290$
   5FFE EE 80         [ 7]  731 	xor	a, #0x80
   6000                     732 00290$:
   6000 F2 0D 60      [10]  733 	jp	P,00140$
                            734 ;src/pathfinding.c:140: resultado = 1;	
   6003 DD 36 E9 01   [19]  735 	ld	-23 (ix),#0x01
   6007 18 04         [12]  736 	jr	00140$
   6009                     737 00137$:
                            738 ;src/pathfinding.c:142: resultado = 1;
   6009 DD 36 E9 01   [19]  739 	ld	-23 (ix),#0x01
   600D                     740 00140$:
                            741 ;src/pathfinding.c:146: if( /* *(matriz + ((y-24)/4)*40 + (x-1)/2) <=2 && */getBit(sol_matriz, (y-24) * 44*4 + (x-1)) != 1){
   600D DD 6E EC      [19]  742 	ld	l,-20 (ix)
   6010 DD 66 ED      [19]  743 	ld	h,-19 (ix)
   6013 E5            [11]  744 	push	hl
   6014 21 B8 77      [10]  745 	ld	hl,#_sol_matriz
   6017 E5            [11]  746 	push	hl
   6018 CD 92 5B      [17]  747 	call	_getBit
   601B F1            [10]  748 	pop	af
   601C F1            [10]  749 	pop	af
   601D DD 75 F6      [19]  750 	ld	-10 (ix),l
                            751 ;src/pathfinding.c:147: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   6020 DD 7E EE      [19]  752 	ld	a,-18 (ix)
   6023 DD 96 F8      [19]  753 	sub	a, -8 (ix)
   6026 DD 77 F0      [19]  754 	ld	-16 (ix),a
   6029 DD 7E EF      [19]  755 	ld	a,-17 (ix)
   602C DD 9E F9      [19]  756 	sbc	a, -7 (ix)
   602F DD 77 F1      [19]  757 	ld	-15 (ix),a
                            758 ;src/pathfinding.c:146: if( /* *(matriz + ((y-24)/4)*40 + (x-1)/2) <=2 && */getBit(sol_matriz, (y-24) * 44*4 + (x-1)) != 1){
   6032 DD 7E F6      [19]  759 	ld	a,-10 (ix)
   6035 3D            [ 4]  760 	dec	a
   6036 CA D7 60      [10]  761 	jp	Z,00152$
                            762 ;src/pathfinding.c:147: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   6039 DD 7E FE      [19]  763 	ld	a,-2 (ix)
   603C DD 96 EA      [19]  764 	sub	a, -22 (ix)
   603F 4F            [ 4]  765 	ld	c,a
   6040 DD 7E FF      [19]  766 	ld	a,-1 (ix)
   6043 DD 9E EB      [19]  767 	sbc	a, -21 (ix)
   6046 47            [ 4]  768 	ld	b,a
   6047 C5            [11]  769 	push	bc
   6048 CD 42 5B      [17]  770 	call	_abs
   604B F1            [10]  771 	pop	af
   604C DD 74 F7      [19]  772 	ld	-9 (ix),h
   604F DD 75 F6      [19]  773 	ld	-10 (ix),l
   6052 DD 6E F0      [19]  774 	ld	l,-16 (ix)
   6055 DD 66 F1      [19]  775 	ld	h,-15 (ix)
   6058 E5            [11]  776 	push	hl
   6059 CD 42 5B      [17]  777 	call	_abs
   605C F1            [10]  778 	pop	af
   605D DD 74 EF      [19]  779 	ld	-17 (ix),h
   6060 DD 75 EE      [19]  780 	ld	-18 (ix),l
   6063 DD 7E F6      [19]  781 	ld	a,-10 (ix)
   6066 DD 86 EE      [19]  782 	add	a, -18 (ix)
   6069 DD 77 F6      [19]  783 	ld	-10 (ix),a
   606C DD 7E F7      [19]  784 	ld	a,-9 (ix)
   606F DD 8E EF      [19]  785 	adc	a, -17 (ix)
   6072 DD 77 F7      [19]  786 	ld	-9 (ix),a
   6075 DD 7E F6      [19]  787 	ld	a,-10 (ix)
   6078 DD 86 D9      [19]  788 	add	a, -39 (ix)
   607B DD 77 F6      [19]  789 	ld	-10 (ix),a
   607E DD 7E F7      [19]  790 	ld	a,-9 (ix)
   6081 DD 8E DA      [19]  791 	adc	a, -38 (ix)
   6084 DD 77 F7      [19]  792 	ld	-9 (ix),a
   6087 DD 7E F6      [19]  793 	ld	a,-10 (ix)
   608A DD 77 DD      [19]  794 	ld	-35 (ix),a
   608D DD 7E F7      [19]  795 	ld	a,-9 (ix)
   6090 DD 77 DE      [19]  796 	ld	-34 (ix),a
                            797 ;src/pathfinding.c:148: if(resultado == 0){
   6093 DD 7E E9      [19]  798 	ld	a,-23 (ix)
   6096 B7            [ 4]  799 	or	a, a
   6097 20 1A         [12]  800 	jr	NZ,00149$
                            801 ;src/pathfinding.c:149: if(dist1 >= dist3)
   6099 DD 7E E1      [19]  802 	ld	a,-31 (ix)
   609C DD 96 DD      [19]  803 	sub	a, -35 (ix)
   609F DD 7E E2      [19]  804 	ld	a,-30 (ix)
   60A2 DD 9E DE      [19]  805 	sbc	a, -34 (ix)
   60A5 E2 AA 60      [10]  806 	jp	PO, 00292$
   60A8 EE 80         [ 7]  807 	xor	a, #0x80
   60AA                     808 00292$:
   60AA FA D7 60      [10]  809 	jp	M,00152$
                            810 ;src/pathfinding.c:150: resultado = 2;
   60AD DD 36 E9 02   [19]  811 	ld	-23 (ix),#0x02
   60B1 18 24         [12]  812 	jr	00152$
   60B3                     813 00149$:
                            814 ;src/pathfinding.c:151: }else if(resultado == 1){
   60B3 DD 7E E9      [19]  815 	ld	a,-23 (ix)
   60B6 3D            [ 4]  816 	dec	a
   60B7 20 1A         [12]  817 	jr	NZ,00146$
                            818 ;src/pathfinding.c:152: if(dist2 >= dist3)
   60B9 DD 7E E3      [19]  819 	ld	a,-29 (ix)
   60BC DD 96 DD      [19]  820 	sub	a, -35 (ix)
   60BF DD 7E E4      [19]  821 	ld	a,-28 (ix)
   60C2 DD 9E DE      [19]  822 	sbc	a, -34 (ix)
   60C5 E2 CA 60      [10]  823 	jp	PO, 00295$
   60C8 EE 80         [ 7]  824 	xor	a, #0x80
   60CA                     825 00295$:
   60CA FA D7 60      [10]  826 	jp	M,00152$
                            827 ;src/pathfinding.c:153: resultado = 2;
   60CD DD 36 E9 02   [19]  828 	ld	-23 (ix),#0x02
   60D1 18 04         [12]  829 	jr	00152$
   60D3                     830 00146$:
                            831 ;src/pathfinding.c:155: resultado = 2;
   60D3 DD 36 E9 02   [19]  832 	ld	-23 (ix),#0x02
   60D7                     833 00152$:
                            834 ;src/pathfinding.c:159: if( /* *(matriz + ((y - 24)/4)*40 + (x+1)/2)  <=2 &&*/ getBit(sol_matriz, (y-24) * 44*4 + (x+1)) != 1){
   60D7 DD 6E F2      [19]  835 	ld	l,-14 (ix)
   60DA DD 66 F3      [19]  836 	ld	h,-13 (ix)
   60DD E5            [11]  837 	push	hl
   60DE 21 B8 77      [10]  838 	ld	hl,#_sol_matriz
   60E1 E5            [11]  839 	push	hl
   60E2 CD 92 5B      [17]  840 	call	_getBit
   60E5 F1            [10]  841 	pop	af
   60E6 F1            [10]  842 	pop	af
   60E7 2D            [ 4]  843 	dec	l
   60E8 CA 9E 61      [10]  844 	jp	Z,00169$
                            845 ;src/pathfinding.c:160: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   60EB DD 7E FE      [19]  846 	ld	a,-2 (ix)
   60EE DD 96 F4      [19]  847 	sub	a, -12 (ix)
   60F1 4F            [ 4]  848 	ld	c,a
   60F2 DD 7E FF      [19]  849 	ld	a,-1 (ix)
   60F5 DD 9E F5      [19]  850 	sbc	a, -11 (ix)
   60F8 47            [ 4]  851 	ld	b,a
   60F9 C5            [11]  852 	push	bc
   60FA CD 42 5B      [17]  853 	call	_abs
   60FD F1            [10]  854 	pop	af
   60FE DD 74 F7      [19]  855 	ld	-9 (ix),h
   6101 DD 75 F6      [19]  856 	ld	-10 (ix),l
   6104 DD 6E F0      [19]  857 	ld	l,-16 (ix)
   6107 DD 66 F1      [19]  858 	ld	h,-15 (ix)
   610A E5            [11]  859 	push	hl
   610B CD 42 5B      [17]  860 	call	_abs
   610E F1            [10]  861 	pop	af
   610F DD 74 F1      [19]  862 	ld	-15 (ix),h
   6112 DD 75 F0      [19]  863 	ld	-16 (ix),l
   6115 DD 7E F6      [19]  864 	ld	a,-10 (ix)
   6118 DD 86 F0      [19]  865 	add	a, -16 (ix)
   611B DD 77 F6      [19]  866 	ld	-10 (ix),a
   611E DD 7E F7      [19]  867 	ld	a,-9 (ix)
   6121 DD 8E F1      [19]  868 	adc	a, -15 (ix)
   6124 DD 77 F7      [19]  869 	ld	-9 (ix),a
   6127 DD 7E F6      [19]  870 	ld	a,-10 (ix)
   612A DD 86 DF      [19]  871 	add	a, -33 (ix)
   612D DD 77 E7      [19]  872 	ld	-25 (ix),a
   6130 DD 7E F7      [19]  873 	ld	a,-9 (ix)
   6133 DD 8E E0      [19]  874 	adc	a, -32 (ix)
   6136 DD 77 E8      [19]  875 	ld	-24 (ix),a
                            876 ;src/pathfinding.c:161: if(resultado == 0){
   6139 DD 7E E9      [19]  877 	ld	a,-23 (ix)
   613C B7            [ 4]  878 	or	a, a
   613D 20 1A         [12]  879 	jr	NZ,00166$
                            880 ;src/pathfinding.c:162: if(dist1 >= dist4)
   613F DD 7E E1      [19]  881 	ld	a,-31 (ix)
   6142 DD 96 E7      [19]  882 	sub	a, -25 (ix)
   6145 DD 7E E2      [19]  883 	ld	a,-30 (ix)
   6148 DD 9E E8      [19]  884 	sbc	a, -24 (ix)
   614B E2 50 61      [10]  885 	jp	PO, 00297$
   614E EE 80         [ 7]  886 	xor	a, #0x80
   6150                     887 00297$:
   6150 FA 9E 61      [10]  888 	jp	M,00169$
                            889 ;src/pathfinding.c:163: resultado = 3;
   6153 DD 36 E9 03   [19]  890 	ld	-23 (ix),#0x03
   6157 18 45         [12]  891 	jr	00169$
   6159                     892 00166$:
                            893 ;src/pathfinding.c:164: }else if(resultado == 1){
   6159 DD 7E E9      [19]  894 	ld	a,-23 (ix)
   615C 3D            [ 4]  895 	dec	a
   615D 20 1A         [12]  896 	jr	NZ,00163$
                            897 ;src/pathfinding.c:165: if(dist2 >= dist4)
   615F DD 7E E3      [19]  898 	ld	a,-29 (ix)
   6162 DD 96 E7      [19]  899 	sub	a, -25 (ix)
   6165 DD 7E E4      [19]  900 	ld	a,-28 (ix)
   6168 DD 9E E8      [19]  901 	sbc	a, -24 (ix)
   616B E2 70 61      [10]  902 	jp	PO, 00300$
   616E EE 80         [ 7]  903 	xor	a, #0x80
   6170                     904 00300$:
   6170 FA 9E 61      [10]  905 	jp	M,00169$
                            906 ;src/pathfinding.c:166: resultado = 3;
   6173 DD 36 E9 03   [19]  907 	ld	-23 (ix),#0x03
   6177 18 25         [12]  908 	jr	00169$
   6179                     909 00163$:
                            910 ;src/pathfinding.c:167: }else if (resultado == 2){
   6179 DD 7E E9      [19]  911 	ld	a,-23 (ix)
   617C D6 02         [ 7]  912 	sub	a, #0x02
   617E 20 1A         [12]  913 	jr	NZ,00160$
                            914 ;src/pathfinding.c:168: if(dist3 >= dist4)
   6180 DD 7E DD      [19]  915 	ld	a,-35 (ix)
   6183 DD 96 E7      [19]  916 	sub	a, -25 (ix)
   6186 DD 7E DE      [19]  917 	ld	a,-34 (ix)
   6189 DD 9E E8      [19]  918 	sbc	a, -24 (ix)
   618C E2 91 61      [10]  919 	jp	PO, 00303$
   618F EE 80         [ 7]  920 	xor	a, #0x80
   6191                     921 00303$:
   6191 FA 9E 61      [10]  922 	jp	M,00169$
                            923 ;src/pathfinding.c:169: resultado = 3;
   6194 DD 36 E9 03   [19]  924 	ld	-23 (ix),#0x03
   6198 18 04         [12]  925 	jr	00169$
   619A                     926 00160$:
                            927 ;src/pathfinding.c:171: resultado = 3;
   619A DD 36 E9 03   [19]  928 	ld	-23 (ix),#0x03
   619E                     929 00169$:
                            930 ;src/pathfinding.c:175: return resultado;
   619E DD 6E E9      [19]  931 	ld	l,-23 (ix)
   61A1 DD F9         [10]  932 	ld	sp, ix
   61A3 DD E1         [14]  933 	pop	ix
   61A5 C9            [10]  934 	ret
                            935 ;src/pathfinding.c:179: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                            936 ;	---------------------------------
                            937 ; Function pathFinding
                            938 ; ---------------------------------
   61A6                     939 _pathFinding::
   61A6 DD E5         [15]  940 	push	ix
   61A8 DD 21 00 00   [14]  941 	ld	ix,#0
   61AC DD 39         [15]  942 	add	ix,sp
   61AE 21 E9 FF      [10]  943 	ld	hl,#-23
   61B1 39            [11]  944 	add	hl,sp
   61B2 F9            [ 6]  945 	ld	sp,hl
                            946 ;src/pathfinding.c:191: u16 down = ((y-24)+1)*44*4 + x;
   61B3 DD 4E EF      [19]  947 	ld	c,-17 (ix)
   61B6 06 00         [ 7]  948 	ld	b,#0x00
   61B8 21 E9 FF      [10]  949 	ld	hl,#0xFFE9
   61BB 09            [11]  950 	add	hl,bc
   61BC 5D            [ 4]  951 	ld	e, l
   61BD 54            [ 4]  952 	ld	d, h
   61BE 29            [11]  953 	add	hl, hl
   61BF 29            [11]  954 	add	hl, hl
   61C0 19            [11]  955 	add	hl, de
   61C1 29            [11]  956 	add	hl, hl
   61C2 19            [11]  957 	add	hl, de
   61C3 29            [11]  958 	add	hl, hl
   61C4 29            [11]  959 	add	hl, hl
   61C5 29            [11]  960 	add	hl, hl
   61C6 29            [11]  961 	add	hl, hl
   61C7 DD 5E F1      [19]  962 	ld	e,-15 (ix)
   61CA 16 00         [ 7]  963 	ld	d,#0x00
   61CC 19            [11]  964 	add	hl,de
   61CD DD 75 F5      [19]  965 	ld	-11 (ix),l
   61D0 DD 74 F6      [19]  966 	ld	-10 (ix),h
                            967 ;src/pathfinding.c:192: u16 up = ((y-24)-1)*44*4 + x;
   61D3 79            [ 4]  968 	ld	a,c
   61D4 C6 E7         [ 7]  969 	add	a,#0xE7
   61D6 6F            [ 4]  970 	ld	l,a
   61D7 78            [ 4]  971 	ld	a,b
   61D8 CE FF         [ 7]  972 	adc	a,#0xFF
   61DA 67            [ 4]  973 	ld	h,a
   61DB D5            [11]  974 	push	de
   61DC 5D            [ 4]  975 	ld	e, l
   61DD 54            [ 4]  976 	ld	d, h
   61DE 29            [11]  977 	add	hl, hl
   61DF 29            [11]  978 	add	hl, hl
   61E0 19            [11]  979 	add	hl, de
   61E1 29            [11]  980 	add	hl, hl
   61E2 19            [11]  981 	add	hl, de
   61E3 29            [11]  982 	add	hl, hl
   61E4 29            [11]  983 	add	hl, hl
   61E5 29            [11]  984 	add	hl, hl
   61E6 29            [11]  985 	add	hl, hl
   61E7 D1            [10]  986 	pop	de
   61E8 19            [11]  987 	add	hl,de
   61E9 33            [ 6]  988 	inc	sp
   61EA 33            [ 6]  989 	inc	sp
   61EB E5            [11]  990 	push	hl
                            991 ;src/pathfinding.c:193: u16 right = (y-24) * 44*4 + (x+1);
   61EC 79            [ 4]  992 	ld	a,c
   61ED C6 E8         [ 7]  993 	add	a,#0xE8
   61EF 4F            [ 4]  994 	ld	c,a
   61F0 78            [ 4]  995 	ld	a,b
   61F1 CE FF         [ 7]  996 	adc	a,#0xFF
   61F3 47            [ 4]  997 	ld	b,a
   61F4 69            [ 4]  998 	ld	l, c
   61F5 60            [ 4]  999 	ld	h, b
   61F6 29            [11] 1000 	add	hl, hl
   61F7 29            [11] 1001 	add	hl, hl
   61F8 09            [11] 1002 	add	hl, bc
   61F9 29            [11] 1003 	add	hl, hl
   61FA 09            [11] 1004 	add	hl, bc
   61FB 29            [11] 1005 	add	hl, hl
   61FC 29            [11] 1006 	add	hl, hl
   61FD 29            [11] 1007 	add	hl, hl
   61FE 29            [11] 1008 	add	hl, hl
   61FF 4D            [ 4] 1009 	ld	c,l
   6200 44            [ 4] 1010 	ld	b,h
   6201 6B            [ 4] 1011 	ld	l, e
   6202 62            [ 4] 1012 	ld	h, d
   6203 23            [ 6] 1013 	inc	hl
   6204 09            [11] 1014 	add	hl,bc
   6205 DD 75 EC      [19] 1015 	ld	-20 (ix),l
   6208 DD 74 ED      [19] 1016 	ld	-19 (ix),h
                           1017 ;src/pathfinding.c:194: u16 left = (y-24) * 44*4 + (x-1);
   620B 1B            [ 6] 1018 	dec	de
   620C 69            [ 4] 1019 	ld	l, c
   620D 60            [ 4] 1020 	ld	h, b
   620E 19            [11] 1021 	add	hl,de
   620F DD 75 F2      [19] 1022 	ld	-14 (ix),l
   6212 DD 74 F3      [19] 1023 	ld	-13 (ix),h
                           1024 ;src/pathfinding.c:196: u8 problem = 0;
   6215 DD 36 EE 00   [19] 1025 	ld	-18 (ix),#0x00
                           1026 ;src/pathfinding.c:198: x = s_x;
   6219 DD 7E 04      [19] 1027 	ld	a,4 (ix)
   621C DD 77 F1      [19] 1028 	ld	-15 (ix),a
                           1029 ;src/pathfinding.c:200: y = s_y;
   621F DD 7E 05      [19] 1030 	ld	a,5 (ix)
   6222 DD 77 EF      [19] 1031 	ld	-17 (ix),a
                           1032 ;src/pathfinding.c:202: k = 0;
   6225 DD 36 FF 00   [19] 1033 	ld	-1 (ix),#0x00
                           1034 ;src/pathfinding.c:203: aux = 1;
   6229 DD 36 F0 01   [19] 1035 	ld	-16 (ix),#0x01
                           1036 ;src/pathfinding.c:206: memset(sol_matriz, 0, (40*2*44*4)/8);
   622D 21 B8 77      [10] 1037 	ld	hl,#_sol_matriz
   6230 36 00         [10] 1038 	ld	(hl), #0x00
   6232 5D            [ 4] 1039 	ld	e, l
   6233 54            [ 4] 1040 	ld	d, h
   6234 13            [ 6] 1041 	inc	de
   6235 01 DF 06      [10] 1042 	ld	bc, #0x06DF
   6238 ED B0         [21] 1043 	ldir
                           1044 ;src/pathfinding.c:207: enemy->longitud_camino = 0;
   623A DD 7E 08      [19] 1045 	ld	a,8 (ix)
   623D DD 77 F9      [19] 1046 	ld	-7 (ix),a
   6240 DD 7E 09      [19] 1047 	ld	a,9 (ix)
   6243 DD 77 FA      [19] 1048 	ld	-6 (ix),a
   6246 DD 7E F9      [19] 1049 	ld	a,-7 (ix)
   6249 C6 39         [ 7] 1050 	add	a, #0x39
   624B DD 77 F7      [19] 1051 	ld	-9 (ix),a
   624E DD 7E FA      [19] 1052 	ld	a,-6 (ix)
   6251 CE 01         [ 7] 1053 	adc	a, #0x01
   6253 DD 77 F8      [19] 1054 	ld	-8 (ix),a
   6256 DD 6E F7      [19] 1055 	ld	l,-9 (ix)
   6259 DD 66 F8      [19] 1056 	ld	h,-8 (ix)
   625C 36 00         [10] 1057 	ld	(hl),#0x00
                           1058 ;src/pathfinding.c:208: sol_tam = 1;
   625E 21 B7 77      [10] 1059 	ld	hl,#_sol_tam + 0
   6261 36 01         [10] 1060 	ld	(hl), #0x01
                           1061 ;src/pathfinding.c:209: setBit(sol_matriz, (y-24)*44*4 + x, 1);
   6263 DD 7E EF      [19] 1062 	ld	a,-17 (ix)
   6266 DD 77 FD      [19] 1063 	ld	-3 (ix),a
   6269 DD 36 FE 00   [19] 1064 	ld	-2 (ix),#0x00
   626D DD 7E FD      [19] 1065 	ld	a,-3 (ix)
   6270 C6 E8         [ 7] 1066 	add	a,#0xE8
   6272 DD 77 FD      [19] 1067 	ld	-3 (ix),a
   6275 DD 7E FE      [19] 1068 	ld	a,-2 (ix)
   6278 CE FF         [ 7] 1069 	adc	a,#0xFF
   627A DD 77 FE      [19] 1070 	ld	-2 (ix),a
   627D DD 4E FD      [19] 1071 	ld	c,-3 (ix)
   6280 DD 46 FE      [19] 1072 	ld	b,-2 (ix)
   6283 69            [ 4] 1073 	ld	l, c
   6284 60            [ 4] 1074 	ld	h, b
   6285 29            [11] 1075 	add	hl, hl
   6286 29            [11] 1076 	add	hl, hl
   6287 09            [11] 1077 	add	hl, bc
   6288 29            [11] 1078 	add	hl, hl
   6289 09            [11] 1079 	add	hl, bc
   628A 29            [11] 1080 	add	hl, hl
   628B 29            [11] 1081 	add	hl, hl
   628C 29            [11] 1082 	add	hl, hl
   628D 29            [11] 1083 	add	hl, hl
   628E DD 75 FD      [19] 1084 	ld	-3 (ix),l
   6291 DD 74 FE      [19] 1085 	ld	-2 (ix),h
   6294 DD 7E F1      [19] 1086 	ld	a,-15 (ix)
   6297 DD 77 FB      [19] 1087 	ld	-5 (ix),a
   629A DD 36 FC 00   [19] 1088 	ld	-4 (ix),#0x00
   629E DD 7E FD      [19] 1089 	ld	a,-3 (ix)
   62A1 DD 86 FB      [19] 1090 	add	a, -5 (ix)
   62A4 DD 77 FB      [19] 1091 	ld	-5 (ix),a
   62A7 DD 7E FE      [19] 1092 	ld	a,-2 (ix)
   62AA DD 8E FC      [19] 1093 	adc	a, -4 (ix)
   62AD DD 77 FC      [19] 1094 	ld	-4 (ix),a
   62B0 21 01 00      [10] 1095 	ld	hl,#0x0001
   62B3 E5            [11] 1096 	push	hl
   62B4 DD 6E FB      [19] 1097 	ld	l,-5 (ix)
   62B7 DD 66 FC      [19] 1098 	ld	h,-4 (ix)
   62BA E5            [11] 1099 	push	hl
   62BB 21 B8 77      [10] 1100 	ld	hl,#_sol_matriz
   62BE E5            [11] 1101 	push	hl
   62BF CD DD 5B      [17] 1102 	call	_setBit
   62C2 21 06 00      [10] 1103 	ld	hl,#6
   62C5 39            [11] 1104 	add	hl,sp
   62C6 F9            [ 6] 1105 	ld	sp,hl
                           1106 ;src/pathfinding.c:210: inserted = anyadirALista(x, y);
   62C7 DD 66 EF      [19] 1107 	ld	h,-17 (ix)
   62CA DD 6E F1      [19] 1108 	ld	l,-15 (ix)
   62CD E5            [11] 1109 	push	hl
   62CE CD 57 5C      [17] 1110 	call	_anyadirALista
   62D1 F1            [10] 1111 	pop	af
   62D2 DD 75 EB      [19] 1112 	ld	-21 (ix),l
                           1113 ;src/pathfinding.c:214: while (aux){
   62D5                    1114 00116$:
   62D5 DD 7E F0      [19] 1115 	ld	a,-16 (ix)
   62D8 B7            [ 4] 1116 	or	a, a
   62D9 CA 7E 64      [10] 1117 	jp	Z,00118$
                           1118 ;src/pathfinding.c:215: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   62DC DD 7E 06      [19] 1119 	ld	a,6 (ix)
   62DF DD 96 F1      [19] 1120 	sub	a, -15 (ix)
   62E2 20 08         [12] 1121 	jr	NZ,00114$
   62E4 DD 7E 07      [19] 1122 	ld	a,7 (ix)
   62E7 DD 96 EF      [19] 1123 	sub	a, -17 (ix)
   62EA 28 0C         [12] 1124 	jr	Z,00110$
   62EC                    1125 00114$:
   62EC 3A B7 77      [13] 1126 	ld	a,(#_sol_tam + 0)
   62EF B7            [ 4] 1127 	or	a, a
   62F0 28 06         [12] 1128 	jr	Z,00110$
   62F2 DD 7E EB      [19] 1129 	ld	a,-21 (ix)
   62F5 B7            [ 4] 1130 	or	a, a
   62F6 20 16         [12] 1131 	jr	NZ,00111$
   62F8                    1132 00110$:
                           1133 ;src/pathfinding.c:217: if(inserted == 0 || sol_tam == 0){
   62F8 DD 7E EB      [19] 1134 	ld	a,-21 (ix)
   62FB B7            [ 4] 1135 	or	a, a
   62FC 28 06         [12] 1136 	jr	Z,00101$
   62FE 3A B7 77      [13] 1137 	ld	a,(#_sol_tam + 0)
   6301 B7            [ 4] 1138 	or	a, a
   6302 20 04         [12] 1139 	jr	NZ,00102$
   6304                    1140 00101$:
                           1141 ;src/pathfinding.c:218: problem = 1;
   6304 DD 36 EE 01   [19] 1142 	ld	-18 (ix),#0x01
   6308                    1143 00102$:
                           1144 ;src/pathfinding.c:221: aux = 0;
   6308 DD 36 F0 00   [19] 1145 	ld	-16 (ix),#0x00
   630C 18 C7         [12] 1146 	jr	00116$
   630E                    1147 00111$:
                           1148 ;src/pathfinding.c:223: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   630E DD 6E 0A      [19] 1149 	ld	l,10 (ix)
   6311 DD 66 0B      [19] 1150 	ld	h,11 (ix)
   6314 E5            [11] 1151 	push	hl
   6315 DD 66 07      [19] 1152 	ld	h,7 (ix)
   6318 DD 6E 06      [19] 1153 	ld	l,6 (ix)
   631B E5            [11] 1154 	push	hl
   631C DD 66 05      [19] 1155 	ld	h,5 (ix)
   631F DD 6E 04      [19] 1156 	ld	l,4 (ix)
   6322 E5            [11] 1157 	push	hl
   6323 DD 66 EF      [19] 1158 	ld	h,-17 (ix)
   6326 DD 6E F1      [19] 1159 	ld	l,-15 (ix)
   6329 E5            [11] 1160 	push	hl
   632A CD 95 5C      [17] 1161 	call	_adjacentTiles
   632D F1            [10] 1162 	pop	af
   632E F1            [10] 1163 	pop	af
   632F F1            [10] 1164 	pop	af
   6330 F1            [10] 1165 	pop	af
   6331 5D            [ 4] 1166 	ld	e,l
                           1167 ;src/pathfinding.c:225: switch(movimiento){
   6332 3E 04         [ 7] 1168 	ld	a,#0x04
   6334 93            [ 4] 1169 	sub	a, e
   6335 38 9E         [12] 1170 	jr	C,00116$
                           1171 ;src/pathfinding.c:231: k = k+2;
   6337 DD 4E FF      [19] 1172 	ld	c,-1 (ix)
   633A 0C            [ 4] 1173 	inc	c
   633B 0C            [ 4] 1174 	inc	c
                           1175 ;src/pathfinding.c:225: switch(movimiento){
   633C 16 00         [ 7] 1176 	ld	d,#0x00
   633E 21 45 63      [10] 1177 	ld	hl,#00169$
   6341 19            [11] 1178 	add	hl,de
   6342 19            [11] 1179 	add	hl,de
   6343 19            [11] 1180 	add	hl,de
   6344 E9            [ 4] 1181 	jp	(hl)
   6345                    1182 00169$:
   6345 C3 54 63      [10] 1183 	jp	00104$
   6348 C3 8A 63      [10] 1184 	jp	00105$
   634B C3 C0 63      [10] 1185 	jp	00106$
   634E C3 F6 63      [10] 1186 	jp	00107$
   6351 C3 2C 64      [10] 1187 	jp	00108$
                           1188 ;src/pathfinding.c:226: case 0:
   6354                    1189 00104$:
                           1190 ;src/pathfinding.c:228: setBit(sol_matriz, up, 1);
   6354 C5            [11] 1191 	push	bc
   6355 21 01 00      [10] 1192 	ld	hl,#0x0001
   6358 E5            [11] 1193 	push	hl
   6359 DD 6E E9      [19] 1194 	ld	l,-23 (ix)
   635C DD 66 EA      [19] 1195 	ld	h,-22 (ix)
   635F E5            [11] 1196 	push	hl
   6360 21 B8 77      [10] 1197 	ld	hl,#_sol_matriz
   6363 E5            [11] 1198 	push	hl
   6364 CD DD 5B      [17] 1199 	call	_setBit
   6367 21 06 00      [10] 1200 	ld	hl,#6
   636A 39            [11] 1201 	add	hl,sp
   636B F9            [ 6] 1202 	ld	sp,hl
   636C C1            [10] 1203 	pop	bc
                           1204 ;src/pathfinding.c:229: inserted = anyadirALista(x, y-1);
   636D DD 46 EF      [19] 1205 	ld	b,-17 (ix)
   6370 05            [ 4] 1206 	dec	b
   6371 C5            [11] 1207 	push	bc
   6372 C5            [11] 1208 	push	bc
   6373 33            [ 6] 1209 	inc	sp
   6374 DD 7E F1      [19] 1210 	ld	a,-15 (ix)
   6377 F5            [11] 1211 	push	af
   6378 33            [ 6] 1212 	inc	sp
   6379 CD 57 5C      [17] 1213 	call	_anyadirALista
   637C F1            [10] 1214 	pop	af
   637D C1            [10] 1215 	pop	bc
   637E DD 75 EB      [19] 1216 	ld	-21 (ix),l
                           1217 ;src/pathfinding.c:230: y = y-1;
   6381 DD 70 EF      [19] 1218 	ld	-17 (ix),b
                           1219 ;src/pathfinding.c:231: k = k+2;
   6384 DD 71 FF      [19] 1220 	ld	-1 (ix),c
                           1221 ;src/pathfinding.c:232: break;
   6387 C3 D5 62      [10] 1222 	jp	00116$
                           1223 ;src/pathfinding.c:233: case 1:
   638A                    1224 00105$:
                           1225 ;src/pathfinding.c:235: setBit(sol_matriz, down, 1);
   638A C5            [11] 1226 	push	bc
   638B 21 01 00      [10] 1227 	ld	hl,#0x0001
   638E E5            [11] 1228 	push	hl
   638F DD 6E F5      [19] 1229 	ld	l,-11 (ix)
   6392 DD 66 F6      [19] 1230 	ld	h,-10 (ix)
   6395 E5            [11] 1231 	push	hl
   6396 21 B8 77      [10] 1232 	ld	hl,#_sol_matriz
   6399 E5            [11] 1233 	push	hl
   639A CD DD 5B      [17] 1234 	call	_setBit
   639D 21 06 00      [10] 1235 	ld	hl,#6
   63A0 39            [11] 1236 	add	hl,sp
   63A1 F9            [ 6] 1237 	ld	sp,hl
   63A2 C1            [10] 1238 	pop	bc
                           1239 ;src/pathfinding.c:236: inserted = anyadirALista(x, y+1);
   63A3 DD 46 EF      [19] 1240 	ld	b,-17 (ix)
   63A6 04            [ 4] 1241 	inc	b
   63A7 C5            [11] 1242 	push	bc
   63A8 C5            [11] 1243 	push	bc
   63A9 33            [ 6] 1244 	inc	sp
   63AA DD 7E F1      [19] 1245 	ld	a,-15 (ix)
   63AD F5            [11] 1246 	push	af
   63AE 33            [ 6] 1247 	inc	sp
   63AF CD 57 5C      [17] 1248 	call	_anyadirALista
   63B2 F1            [10] 1249 	pop	af
   63B3 C1            [10] 1250 	pop	bc
   63B4 DD 75 EB      [19] 1251 	ld	-21 (ix),l
                           1252 ;src/pathfinding.c:237: y = y+1;
   63B7 DD 70 EF      [19] 1253 	ld	-17 (ix),b
                           1254 ;src/pathfinding.c:238: k = k+2;
   63BA DD 71 FF      [19] 1255 	ld	-1 (ix),c
                           1256 ;src/pathfinding.c:239: break;
   63BD C3 D5 62      [10] 1257 	jp	00116$
                           1258 ;src/pathfinding.c:240: case 2:
   63C0                    1259 00106$:
                           1260 ;src/pathfinding.c:242: setBit(sol_matriz, left, 1);
   63C0 C5            [11] 1261 	push	bc
   63C1 21 01 00      [10] 1262 	ld	hl,#0x0001
   63C4 E5            [11] 1263 	push	hl
   63C5 DD 6E F2      [19] 1264 	ld	l,-14 (ix)
   63C8 DD 66 F3      [19] 1265 	ld	h,-13 (ix)
   63CB E5            [11] 1266 	push	hl
   63CC 21 B8 77      [10] 1267 	ld	hl,#_sol_matriz
   63CF E5            [11] 1268 	push	hl
   63D0 CD DD 5B      [17] 1269 	call	_setBit
   63D3 21 06 00      [10] 1270 	ld	hl,#6
   63D6 39            [11] 1271 	add	hl,sp
   63D7 F9            [ 6] 1272 	ld	sp,hl
   63D8 C1            [10] 1273 	pop	bc
                           1274 ;src/pathfinding.c:243: inserted = anyadirALista(x-1, y);
   63D9 DD 46 F1      [19] 1275 	ld	b,-15 (ix)
   63DC 05            [ 4] 1276 	dec	b
   63DD C5            [11] 1277 	push	bc
   63DE DD 7E EF      [19] 1278 	ld	a,-17 (ix)
   63E1 F5            [11] 1279 	push	af
   63E2 33            [ 6] 1280 	inc	sp
   63E3 C5            [11] 1281 	push	bc
   63E4 33            [ 6] 1282 	inc	sp
   63E5 CD 57 5C      [17] 1283 	call	_anyadirALista
   63E8 F1            [10] 1284 	pop	af
   63E9 C1            [10] 1285 	pop	bc
   63EA DD 75 EB      [19] 1286 	ld	-21 (ix),l
                           1287 ;src/pathfinding.c:244: x = x-1;
   63ED DD 70 F1      [19] 1288 	ld	-15 (ix),b
                           1289 ;src/pathfinding.c:245: k = k+2;
   63F0 DD 71 FF      [19] 1290 	ld	-1 (ix),c
                           1291 ;src/pathfinding.c:246: break;
   63F3 C3 D5 62      [10] 1292 	jp	00116$
                           1293 ;src/pathfinding.c:247: case 3:
   63F6                    1294 00107$:
                           1295 ;src/pathfinding.c:249: setBit(sol_matriz, right, 1);
   63F6 C5            [11] 1296 	push	bc
   63F7 21 01 00      [10] 1297 	ld	hl,#0x0001
   63FA E5            [11] 1298 	push	hl
   63FB DD 6E EC      [19] 1299 	ld	l,-20 (ix)
   63FE DD 66 ED      [19] 1300 	ld	h,-19 (ix)
   6401 E5            [11] 1301 	push	hl
   6402 21 B8 77      [10] 1302 	ld	hl,#_sol_matriz
   6405 E5            [11] 1303 	push	hl
   6406 CD DD 5B      [17] 1304 	call	_setBit
   6409 21 06 00      [10] 1305 	ld	hl,#6
   640C 39            [11] 1306 	add	hl,sp
   640D F9            [ 6] 1307 	ld	sp,hl
   640E C1            [10] 1308 	pop	bc
                           1309 ;src/pathfinding.c:250: inserted = anyadirALista(x+1, y);
   640F DD 46 F1      [19] 1310 	ld	b,-15 (ix)
   6412 04            [ 4] 1311 	inc	b
   6413 C5            [11] 1312 	push	bc
   6414 DD 7E EF      [19] 1313 	ld	a,-17 (ix)
   6417 F5            [11] 1314 	push	af
   6418 33            [ 6] 1315 	inc	sp
   6419 C5            [11] 1316 	push	bc
   641A 33            [ 6] 1317 	inc	sp
   641B CD 57 5C      [17] 1318 	call	_anyadirALista
   641E F1            [10] 1319 	pop	af
   641F C1            [10] 1320 	pop	bc
   6420 DD 75 EB      [19] 1321 	ld	-21 (ix),l
                           1322 ;src/pathfinding.c:251: x = x+1;
   6423 DD 70 F1      [19] 1323 	ld	-15 (ix),b
                           1324 ;src/pathfinding.c:252: k = k+2;
   6426 DD 71 FF      [19] 1325 	ld	-1 (ix),c
                           1326 ;src/pathfinding.c:253: break;
   6429 C3 D5 62      [10] 1327 	jp	00116$
                           1328 ;src/pathfinding.c:255: case 4:
   642C                    1329 00108$:
                           1330 ;src/pathfinding.c:257: setBit(sol_matriz, (y*44*4 + x), 1);
   642C DD 4E EF      [19] 1331 	ld	c,-17 (ix)
   642F 06 00         [ 7] 1332 	ld	b,#0x00
   6431 69            [ 4] 1333 	ld	l, c
   6432 60            [ 4] 1334 	ld	h, b
   6433 29            [11] 1335 	add	hl, hl
   6434 29            [11] 1336 	add	hl, hl
   6435 09            [11] 1337 	add	hl, bc
   6436 29            [11] 1338 	add	hl, hl
   6437 09            [11] 1339 	add	hl, bc
   6438 29            [11] 1340 	add	hl, hl
   6439 29            [11] 1341 	add	hl, hl
   643A 29            [11] 1342 	add	hl, hl
   643B 29            [11] 1343 	add	hl, hl
   643C DD 4E F1      [19] 1344 	ld	c,-15 (ix)
   643F 06 00         [ 7] 1345 	ld	b,#0x00
   6441 09            [11] 1346 	add	hl,bc
   6442 01 01 00      [10] 1347 	ld	bc,#0x0001
   6445 C5            [11] 1348 	push	bc
   6446 E5            [11] 1349 	push	hl
   6447 21 B8 77      [10] 1350 	ld	hl,#_sol_matriz
   644A E5            [11] 1351 	push	hl
   644B CD DD 5B      [17] 1352 	call	_setBit
   644E 21 06 00      [10] 1353 	ld	hl,#6
   6451 39            [11] 1354 	add	hl,sp
   6452 F9            [ 6] 1355 	ld	sp,hl
                           1356 ;src/pathfinding.c:259: sol_tam = sol_tam - 2;
   6453 21 B7 77      [10] 1357 	ld	hl, #_sol_tam+0
   6456 35            [11] 1358 	dec	(hl)
   6457 21 B7 77      [10] 1359 	ld	hl, #_sol_tam+0
   645A 35            [11] 1360 	dec	(hl)
                           1361 ;src/pathfinding.c:260: k--;
   645B DD 4E FF      [19] 1362 	ld	c,-1 (ix)
   645E 0D            [ 4] 1363 	dec	c
                           1364 ;src/pathfinding.c:261: y = camino[k];
   645F 21 98 7E      [10] 1365 	ld	hl,#_camino
   6462 06 00         [ 7] 1366 	ld	b,#0x00
   6464 09            [11] 1367 	add	hl, bc
   6465 7E            [ 7] 1368 	ld	a,(hl)
   6466 DD 77 EF      [19] 1369 	ld	-17 (ix),a
                           1370 ;src/pathfinding.c:262: k--;
   6469 79            [ 4] 1371 	ld	a,c
   646A C6 FF         [ 7] 1372 	add	a,#0xFF
                           1373 ;src/pathfinding.c:263: x = camino[k];
   646C DD 77 FF      [19] 1374 	ld	-1 (ix),a
   646F C6 98         [ 7] 1375 	add	a,#<(_camino)
   6471 6F            [ 4] 1376 	ld	l,a
   6472 3E 7E         [ 7] 1377 	ld	a,#>(_camino)
   6474 CE 00         [ 7] 1378 	adc	a, #0x00
   6476 67            [ 4] 1379 	ld	h,a
   6477 7E            [ 7] 1380 	ld	a,(hl)
   6478 DD 77 F1      [19] 1381 	ld	-15 (ix),a
                           1382 ;src/pathfinding.c:265: }
   647B C3 D5 62      [10] 1383 	jp	00116$
   647E                    1384 00118$:
                           1385 ;src/pathfinding.c:270: if(problem == 0){
   647E DD 7E EE      [19] 1386 	ld	a,-18 (ix)
   6481 B7            [ 4] 1387 	or	a, a
   6482 20 72         [12] 1388 	jr	NZ,00127$
                           1389 ;src/pathfinding.c:271: if(sol_tam < 70){
   6484 3A B7 77      [13] 1390 	ld	a,(#_sol_tam + 0)
   6487 D6 46         [ 7] 1391 	sub	a, #0x46
   6489 30 0C         [12] 1392 	jr	NC,00120$
                           1393 ;src/pathfinding.c:272: enemy->longitud_camino = sol_tam;
   648B DD 6E F7      [19] 1394 	ld	l,-9 (ix)
   648E DD 66 F8      [19] 1395 	ld	h,-8 (ix)
   6491 3A B7 77      [13] 1396 	ld	a,(#_sol_tam + 0)
   6494 77            [ 7] 1397 	ld	(hl),a
   6495 18 08         [12] 1398 	jr	00137$
   6497                    1399 00120$:
                           1400 ;src/pathfinding.c:274: enemy->longitud_camino = 70;
   6497 DD 6E F7      [19] 1401 	ld	l,-9 (ix)
   649A DD 66 F8      [19] 1402 	ld	h,-8 (ix)
   649D 36 46         [10] 1403 	ld	(hl),#0x46
                           1404 ;src/pathfinding.c:277: for(j = 0; j<70; j++){
   649F                    1405 00137$:
   649F DD 7E F9      [19] 1406 	ld	a,-7 (ix)
   64A2 C6 0D         [ 7] 1407 	add	a, #0x0D
   64A4 DD 77 FB      [19] 1408 	ld	-5 (ix),a
   64A7 DD 7E FA      [19] 1409 	ld	a,-6 (ix)
   64AA CE 00         [ 7] 1410 	adc	a, #0x00
   64AC DD 77 FC      [19] 1411 	ld	-4 (ix),a
   64AF DD 36 F4 00   [19] 1412 	ld	-12 (ix),#0x00
   64B3                    1413 00125$:
                           1414 ;src/pathfinding.c:278: enemy->camino[j] = camino[j];
   64B3 DD 7E F4      [19] 1415 	ld	a,-12 (ix)
   64B6 DD 77 FD      [19] 1416 	ld	-3 (ix),a
   64B9 DD 36 FE 00   [19] 1417 	ld	-2 (ix),#0x00
   64BD DD 7E FB      [19] 1418 	ld	a,-5 (ix)
   64C0 DD 86 FD      [19] 1419 	add	a, -3 (ix)
   64C3 DD 77 FD      [19] 1420 	ld	-3 (ix),a
   64C6 DD 7E FC      [19] 1421 	ld	a,-4 (ix)
   64C9 DD 8E FE      [19] 1422 	adc	a, -2 (ix)
   64CC DD 77 FE      [19] 1423 	ld	-2 (ix),a
   64CF 3E 98         [ 7] 1424 	ld	a,#<(_camino)
   64D1 DD 86 F4      [19] 1425 	add	a, -12 (ix)
   64D4 DD 77 F7      [19] 1426 	ld	-9 (ix),a
   64D7 3E 7E         [ 7] 1427 	ld	a,#>(_camino)
   64D9 CE 00         [ 7] 1428 	adc	a, #0x00
   64DB DD 77 F8      [19] 1429 	ld	-8 (ix),a
   64DE DD 6E F7      [19] 1430 	ld	l,-9 (ix)
   64E1 DD 66 F8      [19] 1431 	ld	h,-8 (ix)
   64E4 4E            [ 7] 1432 	ld	c,(hl)
   64E5 DD 6E FD      [19] 1433 	ld	l,-3 (ix)
   64E8 DD 66 FE      [19] 1434 	ld	h,-2 (ix)
   64EB 71            [ 7] 1435 	ld	(hl),c
                           1436 ;src/pathfinding.c:277: for(j = 0; j<70; j++){
   64EC DD 34 F4      [23] 1437 	inc	-12 (ix)
   64EF DD 7E F4      [19] 1438 	ld	a,-12 (ix)
   64F2 D6 46         [ 7] 1439 	sub	a, #0x46
   64F4 38 BD         [12] 1440 	jr	C,00125$
   64F6                    1441 00127$:
   64F6 DD F9         [10] 1442 	ld	sp, ix
   64F8 DD E1         [14] 1443 	pop	ix
   64FA C9            [10] 1444 	ret
                           1445 	.area _CODE
                           1446 	.area _INITIALIZER
                           1447 	.area _CABS (ABS)
