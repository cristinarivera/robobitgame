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
   69E5                      28 _sol_tam::
   69E5                      29 	.ds 1
   69E6                      30 _sol_matriz::
   69E6                      31 	.ds 2112
   7226                      32 _camino::
   7226                      33 	.ds 70
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
   4BE2                      62 _abs::
   4BE2 DD E5         [15]   63 	push	ix
   4BE4 DD 21 00 00   [14]   64 	ld	ix,#0
   4BE8 DD 39         [15]   65 	add	ix,sp
   4BEA F5            [11]   66 	push	af
   4BEB F5            [11]   67 	push	af
                             68 ;src/pathfinding.c:16: const i16 ret[2] = { n, -n };
   4BEC 21 00 00      [10]   69 	ld	hl,#0x0000
   4BEF 39            [11]   70 	add	hl,sp
   4BF0 4D            [ 4]   71 	ld	c,l
   4BF1 44            [ 4]   72 	ld	b,h
   4BF2 DD 7E 04      [19]   73 	ld	a,4 (ix)
   4BF5 77            [ 7]   74 	ld	(hl),a
   4BF6 23            [ 6]   75 	inc	hl
   4BF7 DD 7E 05      [19]   76 	ld	a,5 (ix)
   4BFA 77            [ 7]   77 	ld	(hl),a
   4BFB 69            [ 4]   78 	ld	l, c
   4BFC 60            [ 4]   79 	ld	h, b
   4BFD 23            [ 6]   80 	inc	hl
   4BFE 23            [ 6]   81 	inc	hl
   4BFF AF            [ 4]   82 	xor	a, a
   4C00 DD 96 04      [19]   83 	sub	a, 4 (ix)
   4C03 5F            [ 4]   84 	ld	e,a
   4C04 3E 00         [ 7]   85 	ld	a, #0x00
   4C06 DD 9E 05      [19]   86 	sbc	a, 5 (ix)
   4C09 57            [ 4]   87 	ld	d,a
   4C0A 73            [ 7]   88 	ld	(hl),e
   4C0B 23            [ 6]   89 	inc	hl
   4C0C 72            [ 7]   90 	ld	(hl),d
                             91 ;src/pathfinding.c:17: return ret[n<0];
   4C0D DD 7E 05      [19]   92 	ld	a,5 (ix)
   4C10 07            [ 4]   93 	rlca
   4C11 E6 01         [ 7]   94 	and	a,#0x01
   4C13 6F            [ 4]   95 	ld	l,a
   4C14 17            [ 4]   96 	rla
   4C15 9F            [ 4]   97 	sbc	a, a
   4C16 67            [ 4]   98 	ld	h,a
   4C17 29            [11]   99 	add	hl, hl
   4C18 09            [11]  100 	add	hl,bc
   4C19 4E            [ 7]  101 	ld	c,(hl)
   4C1A 23            [ 6]  102 	inc	hl
   4C1B 66            [ 7]  103 	ld	h,(hl)
   4C1C 69            [ 4]  104 	ld	l, c
   4C1D DD F9         [10]  105 	ld	sp, ix
   4C1F DD E1         [14]  106 	pop	ix
   4C21 C9            [10]  107 	ret
   4C22                     108 _bitWeights:
   4C22 01 00               109 	.dw #0x0001
   4C24 02 00               110 	.dw #0x0002
   4C26 04 00               111 	.dw #0x0004
   4C28 08 00               112 	.dw #0x0008
   4C2A 10 00               113 	.dw #0x0010
   4C2C 20 00               114 	.dw #0x0020
   4C2E 40 00               115 	.dw #0x0040
   4C30 80 00               116 	.dw #0x0080
                            117 ;src/pathfinding.c:20: u8 getBit(u8 *array, u16 pos)
                            118 ;	---------------------------------
                            119 ; Function getBit
                            120 ; ---------------------------------
   4C32                     121 _getBit::
   4C32 DD E5         [15]  122 	push	ix
   4C34 DD 21 00 00   [14]  123 	ld	ix,#0
   4C38 DD 39         [15]  124 	add	ix,sp
                            125 ;src/pathfinding.c:25: byteV = array[pos/8];
   4C3A DD 4E 06      [19]  126 	ld	c,6 (ix)
   4C3D DD 46 07      [19]  127 	ld	b,7 (ix)
   4C40 CB 38         [ 8]  128 	srl	b
   4C42 CB 19         [ 8]  129 	rr	c
   4C44 CB 38         [ 8]  130 	srl	b
   4C46 CB 19         [ 8]  131 	rr	c
   4C48 CB 38         [ 8]  132 	srl	b
   4C4A CB 19         [ 8]  133 	rr	c
   4C4C DD 6E 04      [19]  134 	ld	l,4 (ix)
   4C4F DD 66 05      [19]  135 	ld	h,5 (ix)
   4C52 09            [11]  136 	add	hl,bc
   4C53 4E            [ 7]  137 	ld	c,(hl)
   4C54 06 00         [ 7]  138 	ld	b,#0x00
                            139 ;src/pathfinding.c:26: bitV = bitWeights[pos%8];
   4C56 DD 7E 06      [19]  140 	ld	a,6 (ix)
   4C59 E6 07         [ 7]  141 	and	a, #0x07
   4C5B 6F            [ 4]  142 	ld	l,a
   4C5C 26 00         [ 7]  143 	ld	h,#0x00
   4C5E 29            [11]  144 	add	hl, hl
   4C5F 11 22 4C      [10]  145 	ld	de,#_bitWeights
   4C62 19            [11]  146 	add	hl,de
   4C63 5E            [ 7]  147 	ld	e,(hl)
   4C64 23            [ 6]  148 	inc	hl
   4C65 56            [ 7]  149 	ld	d,(hl)
                            150 ;src/pathfinding.c:27: return (byteV & bitV) == bitV;
   4C66 79            [ 4]  151 	ld	a,c
   4C67 A3            [ 4]  152 	and	a, e
   4C68 4F            [ 4]  153 	ld	c,a
   4C69 78            [ 4]  154 	ld	a,b
   4C6A A2            [ 4]  155 	and	a, d
   4C6B 47            [ 4]  156 	ld	b,a
   4C6C 7B            [ 4]  157 	ld	a,e
   4C6D 91            [ 4]  158 	sub	a, c
   4C6E 20 08         [12]  159 	jr	NZ,00103$
   4C70 7A            [ 4]  160 	ld	a,d
   4C71 90            [ 4]  161 	sub	a, b
   4C72 20 04         [12]  162 	jr	NZ,00103$
   4C74 3E 01         [ 7]  163 	ld	a,#0x01
   4C76 18 01         [12]  164 	jr	00104$
   4C78                     165 00103$:
   4C78 AF            [ 4]  166 	xor	a,a
   4C79                     167 00104$:
   4C79 6F            [ 4]  168 	ld	l,a
   4C7A DD E1         [14]  169 	pop	ix
   4C7C C9            [10]  170 	ret
                            171 ;src/pathfinding.c:30: void setBit(u8 *array, u16 pos, u16 value)
                            172 ;	---------------------------------
                            173 ; Function setBit
                            174 ; ---------------------------------
   4C7D                     175 _setBit::
   4C7D DD E5         [15]  176 	push	ix
   4C7F DD 21 00 00   [14]  177 	ld	ix,#0
   4C83 DD 39         [15]  178 	add	ix,sp
                            179 ;src/pathfinding.c:36: bytePos = pos/8;
   4C85 DD 5E 06      [19]  180 	ld	e,6 (ix)
   4C88 DD 56 07      [19]  181 	ld	d,7 (ix)
   4C8B CB 3A         [ 8]  182 	srl	d
   4C8D CB 1B         [ 8]  183 	rr	e
   4C8F CB 3A         [ 8]  184 	srl	d
   4C91 CB 1B         [ 8]  185 	rr	e
   4C93 CB 3A         [ 8]  186 	srl	d
   4C95 CB 1B         [ 8]  187 	rr	e
                            188 ;src/pathfinding.c:38: bitV = bitWeights[pos%8];
   4C97 01 22 4C      [10]  189 	ld	bc,#_bitWeights+0
   4C9A DD 7E 06      [19]  190 	ld	a,6 (ix)
   4C9D E6 07         [ 7]  191 	and	a, #0x07
   4C9F 6F            [ 4]  192 	ld	l,a
   4CA0 26 00         [ 7]  193 	ld	h,#0x00
   4CA2 29            [11]  194 	add	hl, hl
   4CA3 09            [11]  195 	add	hl,bc
   4CA4 4E            [ 7]  196 	ld	c,(hl)
   4CA5 23            [ 6]  197 	inc	hl
   4CA6 46            [ 7]  198 	ld	b,(hl)
                            199 ;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4CA7 DD 6E 04      [19]  200 	ld	l,4 (ix)
   4CAA DD 66 05      [19]  201 	ld	h,5 (ix)
   4CAD 19            [11]  202 	add	hl,de
                            203 ;src/pathfinding.c:40: if(value == 0)
   4CAE DD 7E 09      [19]  204 	ld	a,9 (ix)
   4CB1 DD B6 08      [19]  205 	or	a,8 (ix)
   4CB4 20 20         [12]  206 	jr	NZ,00106$
                            207 ;src/pathfinding.c:42: if(getBit(array, pos) != 0) array[bytePos] -= bitV;
   4CB6 E5            [11]  208 	push	hl
   4CB7 C5            [11]  209 	push	bc
   4CB8 DD 5E 06      [19]  210 	ld	e,6 (ix)
   4CBB DD 56 07      [19]  211 	ld	d,7 (ix)
   4CBE D5            [11]  212 	push	de
   4CBF DD 5E 04      [19]  213 	ld	e,4 (ix)
   4CC2 DD 56 05      [19]  214 	ld	d,5 (ix)
   4CC5 D5            [11]  215 	push	de
   4CC6 CD 32 4C      [17]  216 	call	_getBit
   4CC9 F1            [10]  217 	pop	af
   4CCA F1            [10]  218 	pop	af
   4CCB 7D            [ 4]  219 	ld	a,l
   4CCC C1            [10]  220 	pop	bc
   4CCD E1            [10]  221 	pop	hl
   4CCE B7            [ 4]  222 	or	a, a
   4CCF 28 23         [12]  223 	jr	Z,00108$
   4CD1 7E            [ 7]  224 	ld	a, (hl)
   4CD2 91            [ 4]  225 	sub	a, c
   4CD3 77            [ 7]  226 	ld	(hl),a
   4CD4 18 1E         [12]  227 	jr	00108$
   4CD6                     228 00106$:
                            229 ;src/pathfinding.c:46: if(getBit(array, pos) == 0) array[bytePos] += bitV;
   4CD6 E5            [11]  230 	push	hl
   4CD7 C5            [11]  231 	push	bc
   4CD8 DD 5E 06      [19]  232 	ld	e,6 (ix)
   4CDB DD 56 07      [19]  233 	ld	d,7 (ix)
   4CDE D5            [11]  234 	push	de
   4CDF DD 5E 04      [19]  235 	ld	e,4 (ix)
   4CE2 DD 56 05      [19]  236 	ld	d,5 (ix)
   4CE5 D5            [11]  237 	push	de
   4CE6 CD 32 4C      [17]  238 	call	_getBit
   4CE9 F1            [10]  239 	pop	af
   4CEA F1            [10]  240 	pop	af
   4CEB 7D            [ 4]  241 	ld	a,l
   4CEC C1            [10]  242 	pop	bc
   4CED E1            [10]  243 	pop	hl
   4CEE B7            [ 4]  244 	or	a, a
   4CEF 20 03         [12]  245 	jr	NZ,00108$
   4CF1 7E            [ 7]  246 	ld	a, (hl)
   4CF2 81            [ 4]  247 	add	a, c
   4CF3 77            [ 7]  248 	ld	(hl),a
   4CF4                     249 00108$:
   4CF4 DD E1         [14]  250 	pop	ix
   4CF6 C9            [10]  251 	ret
                            252 ;src/pathfinding.c:51: u8 anyadirALista(u8 x, u8 y){
                            253 ;	---------------------------------
                            254 ; Function anyadirALista
                            255 ; ---------------------------------
   4CF7                     256 _anyadirALista::
                            257 ;src/pathfinding.c:52: u8 anyadido = 0;
   4CF7 0E 00         [ 7]  258 	ld	c,#0x00
                            259 ;src/pathfinding.c:54: if(sol_tam < 70){
   4CF9 3A E5 69      [13]  260 	ld	a,(#_sol_tam + 0)
   4CFC D6 46         [ 7]  261 	sub	a, #0x46
   4CFE 30 33         [12]  262 	jr	NC,00102$
                            263 ;src/pathfinding.c:55: camino[sol_tam-1] = x;
   4D00 01 26 72      [10]  264 	ld	bc,#_camino+0
   4D03 21 E5 69      [10]  265 	ld	hl,#_sol_tam + 0
   4D06 5E            [ 7]  266 	ld	e, (hl)
   4D07 1D            [ 4]  267 	dec	e
   4D08 6B            [ 4]  268 	ld	l,e
   4D09 26 00         [ 7]  269 	ld	h,#0x00
   4D0B 09            [11]  270 	add	hl,bc
   4D0C FD 21 02 00   [14]  271 	ld	iy,#2
   4D10 FD 39         [15]  272 	add	iy,sp
   4D12 FD 7E 00      [19]  273 	ld	a,0 (iy)
   4D15 77            [ 7]  274 	ld	(hl),a
                            275 ;src/pathfinding.c:56: sol_tam++;
   4D16 21 E5 69      [10]  276 	ld	hl, #_sol_tam+0
   4D19 34            [11]  277 	inc	(hl)
                            278 ;src/pathfinding.c:57: camino[sol_tam-1] = y;
   4D1A 21 E5 69      [10]  279 	ld	hl,#_sol_tam + 0
   4D1D 5E            [ 7]  280 	ld	e, (hl)
   4D1E 1D            [ 4]  281 	dec	e
   4D1F 6B            [ 4]  282 	ld	l,e
   4D20 26 00         [ 7]  283 	ld	h,#0x00
   4D22 09            [11]  284 	add	hl,bc
   4D23 FD 21 03 00   [14]  285 	ld	iy,#3
   4D27 FD 39         [15]  286 	add	iy,sp
   4D29 FD 7E 00      [19]  287 	ld	a,0 (iy)
   4D2C 77            [ 7]  288 	ld	(hl),a
                            289 ;src/pathfinding.c:58: sol_tam++;
   4D2D 21 E5 69      [10]  290 	ld	hl, #_sol_tam+0
   4D30 34            [11]  291 	inc	(hl)
                            292 ;src/pathfinding.c:59: anyadido = 1;
   4D31 0E 01         [ 7]  293 	ld	c,#0x01
   4D33                     294 00102$:
                            295 ;src/pathfinding.c:62: return anyadido;
   4D33 69            [ 4]  296 	ld	l,c
   4D34 C9            [10]  297 	ret
                            298 ;src/pathfinding.c:66: u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
                            299 ;	---------------------------------
                            300 ; Function adjacentTiles
                            301 ; ---------------------------------
   4D35                     302 _adjacentTiles::
   4D35 DD E5         [15]  303 	push	ix
   4D37 DD 21 00 00   [14]  304 	ld	ix,#0
   4D3B DD 39         [15]  305 	add	ix,sp
   4D3D 21 D1 FF      [10]  306 	ld	hl,#-47
   4D40 39            [11]  307 	add	hl,sp
   4D41 F9            [ 6]  308 	ld	sp,hl
                            309 ;src/pathfinding.c:67: u8 resultado = 4;
   4D42 DD 36 D9 04   [19]  310 	ld	-39 (ix),#0x04
                            311 ;src/pathfinding.c:69: i16 dist1 = 0;
   4D46 DD 36 DA 00   [19]  312 	ld	-38 (ix),#0x00
   4D4A DD 36 DB 00   [19]  313 	ld	-37 (ix),#0x00
                            314 ;src/pathfinding.c:70: i16 dist2 = 0;
   4D4E 21 00 00      [10]  315 	ld	hl,#0x0000
   4D51 E3            [19]  316 	ex	(sp), hl
                            317 ;src/pathfinding.c:71: i16 dist3 = 0;
   4D52 DD 36 DC 00   [19]  318 	ld	-36 (ix),#0x00
   4D56 DD 36 DD 00   [19]  319 	ld	-35 (ix),#0x00
                            320 ;src/pathfinding.c:75: i16 heu_derecha = 0;
   4D5A DD 36 E0 00   [19]  321 	ld	-32 (ix),#0x00
   4D5E DD 36 E1 00   [19]  322 	ld	-31 (ix),#0x00
                            323 ;src/pathfinding.c:76: i16 heu_izquierda = 0;
   4D62 DD 36 D3 00   [19]  324 	ld	-45 (ix),#0x00
   4D66 DD 36 D4 00   [19]  325 	ld	-44 (ix),#0x00
                            326 ;src/pathfinding.c:77: i16 heu_arriba = 0;
   4D6A DD 36 DE 00   [19]  327 	ld	-34 (ix),#0x00
   4D6E DD 36 DF 00   [19]  328 	ld	-33 (ix),#0x00
                            329 ;src/pathfinding.c:78: i16 heu_abajo = 0;
   4D72 DD 36 D5 00   [19]  330 	ld	-43 (ix),#0x00
   4D76 DD 36 D6 00   [19]  331 	ld	-42 (ix),#0x00
                            332 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4D7A DD 7E 05      [19]  333 	ld	a,5 (ix)
   4D7D DD 77 FC      [19]  334 	ld	-4 (ix),a
   4D80 DD 36 FD 00   [19]  335 	ld	-3 (ix),#0x00
   4D84 DD 7E 04      [19]  336 	ld	a,4 (ix)
   4D87 DD 77 EA      [19]  337 	ld	-22 (ix),a
   4D8A DD 36 EB 00   [19]  338 	ld	-21 (ix),#0x00
   4D8E DD 7E FC      [19]  339 	ld	a,-4 (ix)
   4D91 C6 E8         [ 7]  340 	add	a,#0xE8
   4D93 DD 77 F8      [19]  341 	ld	-8 (ix),a
   4D96 DD 7E FD      [19]  342 	ld	a,-3 (ix)
   4D99 CE FF         [ 7]  343 	adc	a,#0xFF
   4D9B DD 77 F9      [19]  344 	ld	-7 (ix),a
   4D9E DD 7E EA      [19]  345 	ld	a,-22 (ix)
   4DA1 C6 FF         [ 7]  346 	add	a,#0xFF
   4DA3 DD 77 F4      [19]  347 	ld	-12 (ix),a
   4DA6 DD 7E EB      [19]  348 	ld	a,-21 (ix)
   4DA9 CE FF         [ 7]  349 	adc	a,#0xFF
   4DAB DD 77 F5      [19]  350 	ld	-11 (ix),a
                            351 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4DAE DD 7E EA      [19]  352 	ld	a,-22 (ix)
   4DB1 C6 01         [ 7]  353 	add	a, #0x01
   4DB3 DD 77 EC      [19]  354 	ld	-20 (ix),a
   4DB6 DD 7E EB      [19]  355 	ld	a,-21 (ix)
   4DB9 CE 00         [ 7]  356 	adc	a, #0x00
   4DBB DD 77 ED      [19]  357 	ld	-19 (ix),a
                            358 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4DBE DD 7E FC      [19]  359 	ld	a,-4 (ix)
   4DC1 C6 E6         [ 7]  360 	add	a,#0xE6
   4DC3 DD 77 FA      [19]  361 	ld	-6 (ix),a
   4DC6 DD 7E FD      [19]  362 	ld	a,-3 (ix)
   4DC9 CE FF         [ 7]  363 	adc	a,#0xFF
   4DCB DD 77 FB      [19]  364 	ld	-5 (ix),a
                            365 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4DCE DD 7E FC      [19]  366 	ld	a,-4 (ix)
   4DD1 C6 EA         [ 7]  367 	add	a, #0xEA
   4DD3 DD 77 E4      [19]  368 	ld	-28 (ix),a
   4DD6 DD 7E FD      [19]  369 	ld	a,-3 (ix)
   4DD9 CE FF         [ 7]  370 	adc	a, #0xFF
   4DDB DD 77 E5      [19]  371 	ld	-27 (ix),a
                            372 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4DDE DD 4E F8      [19]  373 	ld	c,-8 (ix)
   4DE1 DD 46 F9      [19]  374 	ld	b,-7 (ix)
   4DE4 69            [ 4]  375 	ld	l, c
   4DE5 60            [ 4]  376 	ld	h, b
   4DE6 29            [11]  377 	add	hl, hl
   4DE7 29            [11]  378 	add	hl, hl
   4DE8 09            [11]  379 	add	hl, bc
   4DE9 29            [11]  380 	add	hl, hl
   4DEA 29            [11]  381 	add	hl, hl
   4DEB 29            [11]  382 	add	hl, hl
   4DEC 29            [11]  383 	add	hl, hl
   4DED EB            [ 4]  384 	ex	de,hl
                            385 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4DEE DD 4E FA      [19]  386 	ld	c,-6 (ix)
   4DF1 DD 46 FB      [19]  387 	ld	b,-5 (ix)
   4DF4 69            [ 4]  388 	ld	l, c
   4DF5 60            [ 4]  389 	ld	h, b
   4DF6 29            [11]  390 	add	hl, hl
   4DF7 29            [11]  391 	add	hl, hl
   4DF8 09            [11]  392 	add	hl, bc
   4DF9 29            [11]  393 	add	hl, hl
   4DFA 29            [11]  394 	add	hl, hl
   4DFB 29            [11]  395 	add	hl, hl
   4DFC 29            [11]  396 	add	hl, hl
   4DFD 4D            [ 4]  397 	ld	c,l
   4DFE 44            [ 4]  398 	ld	b,h
                            399 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4DFF D5            [11]  400 	push	de
   4E00 DD 5E E4      [19]  401 	ld	e,-28 (ix)
   4E03 DD 56 E5      [19]  402 	ld	d,-27 (ix)
   4E06 6B            [ 4]  403 	ld	l, e
   4E07 62            [ 4]  404 	ld	h, d
   4E08 29            [11]  405 	add	hl, hl
   4E09 29            [11]  406 	add	hl, hl
   4E0A 19            [11]  407 	add	hl, de
   4E0B 29            [11]  408 	add	hl, hl
   4E0C 29            [11]  409 	add	hl, hl
   4E0D 29            [11]  410 	add	hl, hl
   4E0E 29            [11]  411 	add	hl, hl
   4E0F D1            [10]  412 	pop	de
                            413 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4E10 DD 7E F4      [19]  414 	ld	a,-12 (ix)
   4E13 83            [ 4]  415 	add	a, e
   4E14 DD 77 F6      [19]  416 	ld	-10 (ix),a
   4E17 DD 7E F5      [19]  417 	ld	a,-11 (ix)
   4E1A 8A            [ 4]  418 	adc	a, d
   4E1B DD 77 F7      [19]  419 	ld	-9 (ix),a
                            420 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4E1E DD 7E EC      [19]  421 	ld	a,-20 (ix)
   4E21 83            [ 4]  422 	add	a, e
   4E22 DD 77 E6      [19]  423 	ld	-26 (ix),a
   4E25 DD 7E ED      [19]  424 	ld	a,-19 (ix)
   4E28 8A            [ 4]  425 	adc	a, d
   4E29 DD 77 E7      [19]  426 	ld	-25 (ix),a
                            427 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4E2C DD 7E EA      [19]  428 	ld	a,-22 (ix)
   4E2F 81            [ 4]  429 	add	a, c
   4E30 DD 77 E2      [19]  430 	ld	-30 (ix),a
   4E33 DD 7E EB      [19]  431 	ld	a,-21 (ix)
   4E36 88            [ 4]  432 	adc	a, b
   4E37 DD 77 E3      [19]  433 	ld	-29 (ix),a
                            434 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4E3A DD 7E EA      [19]  435 	ld	a,-22 (ix)
   4E3D 85            [ 4]  436 	add	a, l
   4E3E DD 77 F2      [19]  437 	ld	-14 (ix),a
   4E41 DD 7E EB      [19]  438 	ld	a,-21 (ix)
   4E44 8C            [ 4]  439 	adc	a, h
   4E45 DD 77 F3      [19]  440 	ld	-13 (ix),a
                            441 ;src/pathfinding.c:82: if(x == f_x){
   4E48 DD 7E 04      [19]  442 	ld	a,4 (ix)
   4E4B DD 96 08      [19]  443 	sub	a, 8 (ix)
   4E4E 20 5C         [12]  444 	jr	NZ,00130$
                            445 ;src/pathfinding.c:84: if(s_x < x){
   4E50 DD 7E 06      [19]  446 	ld	a,6 (ix)
   4E53 DD 96 04      [19]  447 	sub	a, 4 (ix)
   4E56 30 19         [12]  448 	jr	NC,00102$
                            449 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4E58 21 01 00      [10]  450 	ld	hl,#0x0001
   4E5B E5            [11]  451 	push	hl
   4E5C DD 6E F6      [19]  452 	ld	l,-10 (ix)
   4E5F DD 66 F7      [19]  453 	ld	h,-9 (ix)
   4E62 E5            [11]  454 	push	hl
   4E63 21 E6 69      [10]  455 	ld	hl,#_sol_matriz
   4E66 E5            [11]  456 	push	hl
   4E67 CD 7D 4C      [17]  457 	call	_setBit
   4E6A 21 06 00      [10]  458 	ld	hl,#6
   4E6D 39            [11]  459 	add	hl,sp
   4E6E F9            [ 6]  460 	ld	sp,hl
   4E6F 18 17         [12]  461 	jr	00103$
   4E71                     462 00102$:
                            463 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4E71 21 01 00      [10]  464 	ld	hl,#0x0001
   4E74 E5            [11]  465 	push	hl
   4E75 DD 6E E6      [19]  466 	ld	l,-26 (ix)
   4E78 DD 66 E7      [19]  467 	ld	h,-25 (ix)
   4E7B E5            [11]  468 	push	hl
   4E7C 21 E6 69      [10]  469 	ld	hl,#_sol_matriz
   4E7F E5            [11]  470 	push	hl
   4E80 CD 7D 4C      [17]  471 	call	_setBit
   4E83 21 06 00      [10]  472 	ld	hl,#6
   4E86 39            [11]  473 	add	hl,sp
   4E87 F9            [ 6]  474 	ld	sp,hl
   4E88                     475 00103$:
                            476 ;src/pathfinding.c:91: if(y < f_y)
   4E88 DD 7E 05      [19]  477 	ld	a,5 (ix)
   4E8B DD 96 09      [19]  478 	sub	a, 9 (ix)
   4E8E 30 08         [12]  479 	jr	NC,00105$
                            480 ;src/pathfinding.c:92: heu_abajo = -1;
   4E90 DD 36 D5 FF   [19]  481 	ld	-43 (ix),#0xFF
   4E94 DD 36 D6 FF   [19]  482 	ld	-42 (ix),#0xFF
   4E98                     483 00105$:
                            484 ;src/pathfinding.c:94: if(y > f_y)
   4E98 DD 7E 09      [19]  485 	ld	a,9 (ix)
   4E9B DD 96 05      [19]  486 	sub	a, 5 (ix)
   4E9E D2 66 4F      [10]  487 	jp	NC,00131$
                            488 ;src/pathfinding.c:95: heu_arriba = -1;
   4EA1 DD 36 DE FF   [19]  489 	ld	-34 (ix),#0xFF
   4EA5 DD 36 DF FF   [19]  490 	ld	-33 (ix),#0xFF
   4EA9 C3 66 4F      [10]  491 	jp	00131$
   4EAC                     492 00130$:
                            493 ;src/pathfinding.c:97: }else if(y == f_y){
   4EAC DD 7E 05      [19]  494 	ld	a,5 (ix)
   4EAF DD 96 09      [19]  495 	sub	a, 9 (ix)
   4EB2 20 5A         [12]  496 	jr	NZ,00127$
                            497 ;src/pathfinding.c:99: if(s_y < y){
   4EB4 DD 7E 07      [19]  498 	ld	a,7 (ix)
   4EB7 DD 96 05      [19]  499 	sub	a, 5 (ix)
   4EBA 30 19         [12]  500 	jr	NC,00109$
                            501 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4EBC 21 01 00      [10]  502 	ld	hl,#0x0001
   4EBF E5            [11]  503 	push	hl
   4EC0 DD 6E E2      [19]  504 	ld	l,-30 (ix)
   4EC3 DD 66 E3      [19]  505 	ld	h,-29 (ix)
   4EC6 E5            [11]  506 	push	hl
   4EC7 21 E6 69      [10]  507 	ld	hl,#_sol_matriz
   4ECA E5            [11]  508 	push	hl
   4ECB CD 7D 4C      [17]  509 	call	_setBit
   4ECE 21 06 00      [10]  510 	ld	hl,#6
   4ED1 39            [11]  511 	add	hl,sp
   4ED2 F9            [ 6]  512 	ld	sp,hl
   4ED3 18 17         [12]  513 	jr	00110$
   4ED5                     514 00109$:
                            515 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4ED5 21 01 00      [10]  516 	ld	hl,#0x0001
   4ED8 E5            [11]  517 	push	hl
   4ED9 DD 6E F2      [19]  518 	ld	l,-14 (ix)
   4EDC DD 66 F3      [19]  519 	ld	h,-13 (ix)
   4EDF E5            [11]  520 	push	hl
   4EE0 21 E6 69      [10]  521 	ld	hl,#_sol_matriz
   4EE3 E5            [11]  522 	push	hl
   4EE4 CD 7D 4C      [17]  523 	call	_setBit
   4EE7 21 06 00      [10]  524 	ld	hl,#6
   4EEA 39            [11]  525 	add	hl,sp
   4EEB F9            [ 6]  526 	ld	sp,hl
   4EEC                     527 00110$:
                            528 ;src/pathfinding.c:106: if(x < f_x)
   4EEC DD 7E 04      [19]  529 	ld	a,4 (ix)
   4EEF DD 96 08      [19]  530 	sub	a, 8 (ix)
   4EF2 30 08         [12]  531 	jr	NC,00112$
                            532 ;src/pathfinding.c:107: heu_derecha = -1;
   4EF4 DD 36 E0 FF   [19]  533 	ld	-32 (ix),#0xFF
   4EF8 DD 36 E1 FF   [19]  534 	ld	-31 (ix),#0xFF
   4EFC                     535 00112$:
                            536 ;src/pathfinding.c:108: if(x > f_x)
   4EFC DD 7E 08      [19]  537 	ld	a,8 (ix)
   4EFF DD 96 04      [19]  538 	sub	a, 4 (ix)
   4F02 30 62         [12]  539 	jr	NC,00131$
                            540 ;src/pathfinding.c:109: heu_izquierda = -1;
   4F04 DD 36 D3 FF   [19]  541 	ld	-45 (ix),#0xFF
   4F08 DD 36 D4 FF   [19]  542 	ld	-44 (ix),#0xFF
   4F0C 18 58         [12]  543 	jr	00131$
   4F0E                     544 00127$:
                            545 ;src/pathfinding.c:115: if(s_y < f_y)
   4F0E DD 7E 07      [19]  546 	ld	a,7 (ix)
   4F11 DD 96 09      [19]  547 	sub	a, 9 (ix)
   4F14 3E 00         [ 7]  548 	ld	a,#0x00
   4F16 17            [ 4]  549 	rla
   4F17 4F            [ 4]  550 	ld	c,a
                            551 ;src/pathfinding.c:114: if(s_x < f_x){
   4F18 DD 7E 06      [19]  552 	ld	a,6 (ix)
   4F1B DD 96 08      [19]  553 	sub	a, 8 (ix)
   4F1E 30 20         [12]  554 	jr	NC,00124$
                            555 ;src/pathfinding.c:115: if(s_y < f_y)
   4F20 79            [ 4]  556 	ld	a,c
   4F21 B7            [ 4]  557 	or	a, a
   4F22 28 0A         [12]  558 	jr	Z,00116$
                            559 ;src/pathfinding.c:116: heu_abajo = -1;
   4F24 DD 36 D5 FF   [19]  560 	ld	-43 (ix),#0xFF
   4F28 DD 36 D6 FF   [19]  561 	ld	-42 (ix),#0xFF
   4F2C 18 08         [12]  562 	jr	00117$
   4F2E                     563 00116$:
                            564 ;src/pathfinding.c:118: heu_arriba = -1;
   4F2E DD 36 DE FF   [19]  565 	ld	-34 (ix),#0xFF
   4F32 DD 36 DF FF   [19]  566 	ld	-33 (ix),#0xFF
   4F36                     567 00117$:
                            568 ;src/pathfinding.c:120: heu_derecha = -1;
   4F36 DD 36 E0 FF   [19]  569 	ld	-32 (ix),#0xFF
   4F3A DD 36 E1 FF   [19]  570 	ld	-31 (ix),#0xFF
   4F3E 18 26         [12]  571 	jr	00131$
   4F40                     572 00124$:
                            573 ;src/pathfinding.c:121: }else if(s_x > f_x){
   4F40 DD 7E 08      [19]  574 	ld	a,8 (ix)
   4F43 DD 96 06      [19]  575 	sub	a, 6 (ix)
   4F46 30 1E         [12]  576 	jr	NC,00131$
                            577 ;src/pathfinding.c:123: if(s_y < f_y)
   4F48 79            [ 4]  578 	ld	a,c
   4F49 B7            [ 4]  579 	or	a, a
   4F4A 28 0A         [12]  580 	jr	Z,00119$
                            581 ;src/pathfinding.c:124: heu_abajo = -1;
   4F4C DD 36 D5 FF   [19]  582 	ld	-43 (ix),#0xFF
   4F50 DD 36 D6 FF   [19]  583 	ld	-42 (ix),#0xFF
   4F54 18 08         [12]  584 	jr	00120$
   4F56                     585 00119$:
                            586 ;src/pathfinding.c:126: heu_arriba = -1;
   4F56 DD 36 DE FF   [19]  587 	ld	-34 (ix),#0xFF
   4F5A DD 36 DF FF   [19]  588 	ld	-33 (ix),#0xFF
   4F5E                     589 00120$:
                            590 ;src/pathfinding.c:128: heu_izquierda = -1;
   4F5E DD 36 D3 FF   [19]  591 	ld	-45 (ix),#0xFF
   4F62 DD 36 D4 FF   [19]  592 	ld	-44 (ix),#0xFF
   4F66                     593 00131$:
                            594 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4F66 DD 7E FA      [19]  595 	ld	a,-6 (ix)
   4F69 DD 77 E8      [19]  596 	ld	-24 (ix),a
   4F6C DD 7E FB      [19]  597 	ld	a,-5 (ix)
   4F6F DD 77 E9      [19]  598 	ld	-23 (ix),a
   4F72 DD CB FB 7E   [20]  599 	bit	7, -5 (ix)
   4F76 28 10         [12]  600 	jr	Z,00176$
   4F78 DD 7E FC      [19]  601 	ld	a,-4 (ix)
   4F7B C6 E9         [ 7]  602 	add	a, #0xE9
   4F7D DD 77 E8      [19]  603 	ld	-24 (ix),a
   4F80 DD 7E FD      [19]  604 	ld	a,-3 (ix)
   4F83 CE FF         [ 7]  605 	adc	a, #0xFF
   4F85 DD 77 E9      [19]  606 	ld	-23 (ix),a
   4F88                     607 00176$:
   4F88 DD CB E9 2E   [23]  608 	sra	-23 (ix)
   4F8C DD CB E8 1E   [23]  609 	rr	-24 (ix)
   4F90 DD CB E9 2E   [23]  610 	sra	-23 (ix)
   4F94 DD CB E8 1E   [23]  611 	rr	-24 (ix)
   4F98 DD 4E E8      [19]  612 	ld	c,-24 (ix)
   4F9B DD 46 E9      [19]  613 	ld	b,-23 (ix)
   4F9E 69            [ 4]  614 	ld	l, c
   4F9F 60            [ 4]  615 	ld	h, b
   4FA0 29            [11]  616 	add	hl, hl
   4FA1 29            [11]  617 	add	hl, hl
   4FA2 09            [11]  618 	add	hl, bc
   4FA3 29            [11]  619 	add	hl, hl
   4FA4 29            [11]  620 	add	hl, hl
   4FA5 29            [11]  621 	add	hl, hl
   4FA6 DD 75 E8      [19]  622 	ld	-24 (ix),l
   4FA9 DD 74 E9      [19]  623 	ld	-23 (ix),h
   4FAC DD 7E 0A      [19]  624 	ld	a,10 (ix)
   4FAF DD 86 E8      [19]  625 	add	a, -24 (ix)
   4FB2 DD 77 E8      [19]  626 	ld	-24 (ix),a
   4FB5 DD 7E 0B      [19]  627 	ld	a,11 (ix)
   4FB8 DD 8E E9      [19]  628 	adc	a, -23 (ix)
   4FBB DD 77 E9      [19]  629 	ld	-23 (ix),a
   4FBE DD 7E 04      [19]  630 	ld	a,4 (ix)
   4FC1 CB 3F         [ 8]  631 	srl	a
   4FC3 DD 77 FA      [19]  632 	ld	-6 (ix), a
   4FC6 DD 86 E8      [19]  633 	add	a, -24 (ix)
   4FC9 DD 77 E8      [19]  634 	ld	-24 (ix),a
   4FCC 3E 00         [ 7]  635 	ld	a,#0x00
   4FCE DD 8E E9      [19]  636 	adc	a, -23 (ix)
   4FD1 DD 77 E9      [19]  637 	ld	-23 (ix),a
   4FD4 DD 6E E8      [19]  638 	ld	l,-24 (ix)
   4FD7 DD 66 E9      [19]  639 	ld	h,-23 (ix)
   4FDA 7E            [ 7]  640 	ld	a,(hl)
   4FDB DD 77 E8      [19]  641 	ld	-24 (ix),a
                            642 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4FDE DD 7E 08      [19]  643 	ld	a,8 (ix)
   4FE1 DD 77 F0      [19]  644 	ld	-16 (ix),a
   4FE4 DD 36 F1 00   [19]  645 	ld	-15 (ix),#0x00
   4FE8 DD 7E 09      [19]  646 	ld	a,9 (ix)
   4FEB DD 77 FE      [19]  647 	ld	-2 (ix),a
   4FEE DD 36 FF 00   [19]  648 	ld	-1 (ix),#0x00
   4FF2 DD 7E F0      [19]  649 	ld	a,-16 (ix)
   4FF5 DD 96 EA      [19]  650 	sub	a, -22 (ix)
   4FF8 DD 77 EE      [19]  651 	ld	-18 (ix),a
   4FFB DD 7E F1      [19]  652 	ld	a,-15 (ix)
   4FFE DD 9E EB      [19]  653 	sbc	a, -21 (ix)
   5001 DD 77 EF      [19]  654 	ld	-17 (ix),a
                            655 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   5004 3E 02         [ 7]  656 	ld	a,#0x02
   5006 DD 96 E8      [19]  657 	sub	a, -24 (ix)
   5009 DA 97 50      [10]  658 	jp	C,00133$
   500C DD 6E E2      [19]  659 	ld	l,-30 (ix)
   500F DD 66 E3      [19]  660 	ld	h,-29 (ix)
   5012 E5            [11]  661 	push	hl
   5013 21 E6 69      [10]  662 	ld	hl,#_sol_matriz
   5016 E5            [11]  663 	push	hl
   5017 CD 32 4C      [17]  664 	call	_getBit
   501A F1            [10]  665 	pop	af
   501B F1            [10]  666 	pop	af
   501C 2D            [ 4]  667 	dec	l
   501D 28 78         [12]  668 	jr	Z,00133$
                            669 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   501F DD 6E EE      [19]  670 	ld	l,-18 (ix)
   5022 DD 66 EF      [19]  671 	ld	h,-17 (ix)
   5025 E5            [11]  672 	push	hl
   5026 CD E2 4B      [17]  673 	call	_abs
   5029 F1            [10]  674 	pop	af
   502A DD 74 E9      [19]  675 	ld	-23 (ix),h
   502D DD 75 E8      [19]  676 	ld	-24 (ix),l
   5030 DD 7E FC      [19]  677 	ld	a,-4 (ix)
   5033 C6 FE         [ 7]  678 	add	a,#0xFE
   5035 DD 77 E2      [19]  679 	ld	-30 (ix),a
   5038 DD 7E FD      [19]  680 	ld	a,-3 (ix)
   503B CE FF         [ 7]  681 	adc	a,#0xFF
   503D DD 77 E3      [19]  682 	ld	-29 (ix),a
   5040 DD 7E FE      [19]  683 	ld	a,-2 (ix)
   5043 DD 96 E2      [19]  684 	sub	a, -30 (ix)
   5046 DD 77 E2      [19]  685 	ld	-30 (ix),a
   5049 DD 7E FF      [19]  686 	ld	a,-1 (ix)
   504C DD 9E E3      [19]  687 	sbc	a, -29 (ix)
   504F DD 77 E3      [19]  688 	ld	-29 (ix),a
   5052 DD 6E E2      [19]  689 	ld	l,-30 (ix)
   5055 DD 66 E3      [19]  690 	ld	h,-29 (ix)
   5058 E5            [11]  691 	push	hl
   5059 CD E2 4B      [17]  692 	call	_abs
   505C F1            [10]  693 	pop	af
   505D DD 74 E3      [19]  694 	ld	-29 (ix),h
   5060 DD 75 E2      [19]  695 	ld	-30 (ix),l
   5063 DD 7E E8      [19]  696 	ld	a,-24 (ix)
   5066 DD 86 E2      [19]  697 	add	a, -30 (ix)
   5069 DD 77 E8      [19]  698 	ld	-24 (ix),a
   506C DD 7E E9      [19]  699 	ld	a,-23 (ix)
   506F DD 8E E3      [19]  700 	adc	a, -29 (ix)
   5072 DD 77 E9      [19]  701 	ld	-23 (ix),a
   5075 DD 7E E8      [19]  702 	ld	a,-24 (ix)
   5078 DD 86 DE      [19]  703 	add	a, -34 (ix)
   507B DD 77 E8      [19]  704 	ld	-24 (ix),a
   507E DD 7E E9      [19]  705 	ld	a,-23 (ix)
   5081 DD 8E DF      [19]  706 	adc	a, -33 (ix)
   5084 DD 77 E9      [19]  707 	ld	-23 (ix),a
   5087 DD 7E E8      [19]  708 	ld	a,-24 (ix)
   508A DD 77 DA      [19]  709 	ld	-38 (ix),a
   508D DD 7E E9      [19]  710 	ld	a,-23 (ix)
   5090 DD 77 DB      [19]  711 	ld	-37 (ix),a
                            712 ;src/pathfinding.c:135: resultado = 0;
   5093 DD 36 D9 00   [19]  713 	ld	-39 (ix),#0x00
   5097                     714 00133$:
                            715 ;src/pathfinding.c:138: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   5097 DD 7E E4      [19]  716 	ld	a,-28 (ix)
   509A DD 77 E8      [19]  717 	ld	-24 (ix),a
   509D DD 7E E5      [19]  718 	ld	a,-27 (ix)
   50A0 DD 77 E9      [19]  719 	ld	-23 (ix),a
   50A3 DD CB E5 7E   [20]  720 	bit	7, -27 (ix)
   50A7 28 10         [12]  721 	jr	Z,00177$
   50A9 DD 7E FC      [19]  722 	ld	a,-4 (ix)
   50AC C6 ED         [ 7]  723 	add	a, #0xED
   50AE DD 77 E8      [19]  724 	ld	-24 (ix),a
   50B1 DD 7E FD      [19]  725 	ld	a,-3 (ix)
   50B4 CE FF         [ 7]  726 	adc	a, #0xFF
   50B6 DD 77 E9      [19]  727 	ld	-23 (ix),a
   50B9                     728 00177$:
   50B9 DD CB E9 2E   [23]  729 	sra	-23 (ix)
   50BD DD CB E8 1E   [23]  730 	rr	-24 (ix)
   50C1 DD CB E9 2E   [23]  731 	sra	-23 (ix)
   50C5 DD CB E8 1E   [23]  732 	rr	-24 (ix)
   50C9 DD 4E E8      [19]  733 	ld	c,-24 (ix)
   50CC DD 46 E9      [19]  734 	ld	b,-23 (ix)
   50CF 69            [ 4]  735 	ld	l, c
   50D0 60            [ 4]  736 	ld	h, b
   50D1 29            [11]  737 	add	hl, hl
   50D2 29            [11]  738 	add	hl, hl
   50D3 09            [11]  739 	add	hl, bc
   50D4 29            [11]  740 	add	hl, hl
   50D5 29            [11]  741 	add	hl, hl
   50D6 29            [11]  742 	add	hl, hl
   50D7 DD 75 E8      [19]  743 	ld	-24 (ix),l
   50DA DD 74 E9      [19]  744 	ld	-23 (ix),h
   50DD DD 7E 0A      [19]  745 	ld	a,10 (ix)
   50E0 DD 86 E8      [19]  746 	add	a, -24 (ix)
   50E3 DD 77 E8      [19]  747 	ld	-24 (ix),a
   50E6 DD 7E 0B      [19]  748 	ld	a,11 (ix)
   50E9 DD 8E E9      [19]  749 	adc	a, -23 (ix)
   50EC DD 77 E9      [19]  750 	ld	-23 (ix),a
   50EF DD 7E E8      [19]  751 	ld	a,-24 (ix)
   50F2 DD 86 FA      [19]  752 	add	a, -6 (ix)
   50F5 DD 77 E8      [19]  753 	ld	-24 (ix),a
   50F8 DD 7E E9      [19]  754 	ld	a,-23 (ix)
   50FB CE 00         [ 7]  755 	adc	a, #0x00
   50FD DD 77 E9      [19]  756 	ld	-23 (ix),a
   5100 DD 6E E8      [19]  757 	ld	l,-24 (ix)
   5103 DD 66 E9      [19]  758 	ld	h,-23 (ix)
   5106 7E            [ 7]  759 	ld	a,(hl)
   5107 DD 77 E8      [19]  760 	ld	-24 (ix),a
   510A 3E 02         [ 7]  761 	ld	a,#0x02
   510C DD 96 E8      [19]  762 	sub	a, -24 (ix)
   510F DA BE 51      [10]  763 	jp	C,00141$
   5112 DD 6E F2      [19]  764 	ld	l,-14 (ix)
   5115 DD 66 F3      [19]  765 	ld	h,-13 (ix)
   5118 E5            [11]  766 	push	hl
   5119 21 E6 69      [10]  767 	ld	hl,#_sol_matriz
   511C E5            [11]  768 	push	hl
   511D CD 32 4C      [17]  769 	call	_getBit
   5120 F1            [10]  770 	pop	af
   5121 F1            [10]  771 	pop	af
   5122 2D            [ 4]  772 	dec	l
   5123 CA BE 51      [10]  773 	jp	Z,00141$
                            774 ;src/pathfinding.c:139: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   5126 DD 6E EE      [19]  775 	ld	l,-18 (ix)
   5129 DD 66 EF      [19]  776 	ld	h,-17 (ix)
   512C E5            [11]  777 	push	hl
   512D CD E2 4B      [17]  778 	call	_abs
   5130 F1            [10]  779 	pop	af
   5131 DD 74 EF      [19]  780 	ld	-17 (ix),h
   5134 DD 75 EE      [19]  781 	ld	-18 (ix),l
   5137 DD 7E FC      [19]  782 	ld	a,-4 (ix)
   513A C6 02         [ 7]  783 	add	a, #0x02
   513C DD 77 E8      [19]  784 	ld	-24 (ix),a
   513F DD 7E FD      [19]  785 	ld	a,-3 (ix)
   5142 CE 00         [ 7]  786 	adc	a, #0x00
   5144 DD 77 E9      [19]  787 	ld	-23 (ix),a
   5147 DD 7E FE      [19]  788 	ld	a,-2 (ix)
   514A DD 96 E8      [19]  789 	sub	a, -24 (ix)
   514D DD 77 E8      [19]  790 	ld	-24 (ix),a
   5150 DD 7E FF      [19]  791 	ld	a,-1 (ix)
   5153 DD 9E E9      [19]  792 	sbc	a, -23 (ix)
   5156 DD 77 E9      [19]  793 	ld	-23 (ix),a
   5159 DD 6E E8      [19]  794 	ld	l,-24 (ix)
   515C DD 66 E9      [19]  795 	ld	h,-23 (ix)
   515F E5            [11]  796 	push	hl
   5160 CD E2 4B      [17]  797 	call	_abs
   5163 F1            [10]  798 	pop	af
   5164 DD 74 E9      [19]  799 	ld	-23 (ix),h
   5167 DD 75 E8      [19]  800 	ld	-24 (ix),l
   516A DD 7E EE      [19]  801 	ld	a,-18 (ix)
   516D DD 86 E8      [19]  802 	add	a, -24 (ix)
   5170 DD 77 EE      [19]  803 	ld	-18 (ix),a
   5173 DD 7E EF      [19]  804 	ld	a,-17 (ix)
   5176 DD 8E E9      [19]  805 	adc	a, -23 (ix)
   5179 DD 77 EF      [19]  806 	ld	-17 (ix),a
   517C DD 7E D5      [19]  807 	ld	a,-43 (ix)
   517F DD 86 EE      [19]  808 	add	a, -18 (ix)
   5182 DD 77 EE      [19]  809 	ld	-18 (ix),a
   5185 DD 7E D6      [19]  810 	ld	a,-42 (ix)
   5188 DD 8E EF      [19]  811 	adc	a, -17 (ix)
   518B DD 77 EF      [19]  812 	ld	-17 (ix),a
   518E DD 7E EE      [19]  813 	ld	a,-18 (ix)
   5191 DD 77 D1      [19]  814 	ld	-47 (ix),a
   5194 DD 7E EF      [19]  815 	ld	a,-17 (ix)
   5197 DD 77 D2      [19]  816 	ld	-46 (ix),a
                            817 ;src/pathfinding.c:140: if(resultado == 0){
   519A DD 7E D9      [19]  818 	ld	a,-39 (ix)
   519D B7            [ 4]  819 	or	a, a
   519E 20 1A         [12]  820 	jr	NZ,00138$
                            821 ;src/pathfinding.c:141: if(dist1 > dist2)
   51A0 DD 7E D1      [19]  822 	ld	a,-47 (ix)
   51A3 DD 96 DA      [19]  823 	sub	a, -38 (ix)
   51A6 DD 7E D2      [19]  824 	ld	a,-46 (ix)
   51A9 DD 9E DB      [19]  825 	sbc	a, -37 (ix)
   51AC E2 B1 51      [10]  826 	jp	PO, 00340$
   51AF EE 80         [ 7]  827 	xor	a, #0x80
   51B1                     828 00340$:
   51B1 F2 BE 51      [10]  829 	jp	P,00141$
                            830 ;src/pathfinding.c:142: resultado = 1;	
   51B4 DD 36 D9 01   [19]  831 	ld	-39 (ix),#0x01
   51B8 18 04         [12]  832 	jr	00141$
   51BA                     833 00138$:
                            834 ;src/pathfinding.c:144: resultado = 1;
   51BA DD 36 D9 01   [19]  835 	ld	-39 (ix),#0x01
   51BE                     836 00141$:
                            837 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   51BE DD 7E F8      [19]  838 	ld	a,-8 (ix)
   51C1 DD 77 EE      [19]  839 	ld	-18 (ix),a
   51C4 DD 7E F9      [19]  840 	ld	a,-7 (ix)
   51C7 DD 77 EF      [19]  841 	ld	-17 (ix),a
   51CA DD 7E F9      [19]  842 	ld	a,-7 (ix)
   51CD 07            [ 4]  843 	rlca
   51CE E6 01         [ 7]  844 	and	a,#0x01
   51D0 DD 77 E8      [19]  845 	ld	-24 (ix),a
   51D3 DD 7E FC      [19]  846 	ld	a,-4 (ix)
   51D6 C6 EB         [ 7]  847 	add	a, #0xEB
   51D8 DD 77 F2      [19]  848 	ld	-14 (ix),a
   51DB DD 7E FD      [19]  849 	ld	a,-3 (ix)
   51DE CE FF         [ 7]  850 	adc	a, #0xFF
   51E0 DD 77 F3      [19]  851 	ld	-13 (ix),a
   51E3 DD 7E E8      [19]  852 	ld	a,-24 (ix)
   51E6 B7            [ 4]  853 	or	a, a
   51E7 28 0C         [12]  854 	jr	Z,00178$
   51E9 DD 7E F2      [19]  855 	ld	a,-14 (ix)
   51EC DD 77 EE      [19]  856 	ld	-18 (ix),a
   51EF DD 7E F3      [19]  857 	ld	a,-13 (ix)
   51F2 DD 77 EF      [19]  858 	ld	-17 (ix),a
   51F5                     859 00178$:
   51F5 DD CB EF 2E   [23]  860 	sra	-17 (ix)
   51F9 DD CB EE 1E   [23]  861 	rr	-18 (ix)
   51FD DD CB EF 2E   [23]  862 	sra	-17 (ix)
   5201 DD CB EE 1E   [23]  863 	rr	-18 (ix)
   5205 DD 4E EE      [19]  864 	ld	c,-18 (ix)
   5208 DD 46 EF      [19]  865 	ld	b,-17 (ix)
   520B 69            [ 4]  866 	ld	l, c
   520C 60            [ 4]  867 	ld	h, b
   520D 29            [11]  868 	add	hl, hl
   520E 29            [11]  869 	add	hl, hl
   520F 09            [11]  870 	add	hl, bc
   5210 29            [11]  871 	add	hl, hl
   5211 29            [11]  872 	add	hl, hl
   5212 29            [11]  873 	add	hl, hl
   5213 DD 75 EE      [19]  874 	ld	-18 (ix),l
   5216 DD 74 EF      [19]  875 	ld	-17 (ix),h
   5219 DD 7E 0A      [19]  876 	ld	a,10 (ix)
   521C DD 86 EE      [19]  877 	add	a, -18 (ix)
   521F DD 77 EE      [19]  878 	ld	-18 (ix),a
   5222 DD 7E 0B      [19]  879 	ld	a,11 (ix)
   5225 DD 8E EF      [19]  880 	adc	a, -17 (ix)
   5228 DD 77 EF      [19]  881 	ld	-17 (ix),a
   522B DD 7E F4      [19]  882 	ld	a,-12 (ix)
   522E DD 77 E2      [19]  883 	ld	-30 (ix),a
   5231 DD 7E F5      [19]  884 	ld	a,-11 (ix)
   5234 DD 77 E3      [19]  885 	ld	-29 (ix),a
   5237 DD CB F5 7E   [20]  886 	bit	7, -11 (ix)
   523B 28 0C         [12]  887 	jr	Z,00179$
   523D DD 7E EA      [19]  888 	ld	a,-22 (ix)
   5240 DD 77 E2      [19]  889 	ld	-30 (ix),a
   5243 DD 7E EB      [19]  890 	ld	a,-21 (ix)
   5246 DD 77 E3      [19]  891 	ld	-29 (ix),a
   5249                     892 00179$:
   5249 DD CB E3 2E   [23]  893 	sra	-29 (ix)
   524D DD CB E2 1E   [23]  894 	rr	-30 (ix)
   5251 DD 7E EE      [19]  895 	ld	a,-18 (ix)
   5254 DD 86 E2      [19]  896 	add	a, -30 (ix)
   5257 DD 77 EE      [19]  897 	ld	-18 (ix),a
   525A DD 7E EF      [19]  898 	ld	a,-17 (ix)
   525D DD 8E E3      [19]  899 	adc	a, -29 (ix)
   5260 DD 77 EF      [19]  900 	ld	-17 (ix),a
   5263 DD 6E EE      [19]  901 	ld	l,-18 (ix)
   5266 DD 66 EF      [19]  902 	ld	h,-17 (ix)
   5269 7E            [ 7]  903 	ld	a,(hl)
   526A DD 77 EE      [19]  904 	ld	-18 (ix),a
                            905 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   526D DD 7E FE      [19]  906 	ld	a,-2 (ix)
   5270 DD 96 FC      [19]  907 	sub	a, -4 (ix)
   5273 DD 77 FE      [19]  908 	ld	-2 (ix),a
   5276 DD 7E FF      [19]  909 	ld	a,-1 (ix)
   5279 DD 9E FD      [19]  910 	sbc	a, -3 (ix)
   527C DD 77 FF      [19]  911 	ld	-1 (ix),a
                            912 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   527F 3E 02         [ 7]  913 	ld	a,#0x02
   5281 DD 96 EE      [19]  914 	sub	a, -18 (ix)
   5284 DA 3D 53      [10]  915 	jp	C,00154$
   5287 DD 6E F6      [19]  916 	ld	l,-10 (ix)
   528A DD 66 F7      [19]  917 	ld	h,-9 (ix)
   528D E5            [11]  918 	push	hl
   528E 21 E6 69      [10]  919 	ld	hl,#_sol_matriz
   5291 E5            [11]  920 	push	hl
   5292 CD 32 4C      [17]  921 	call	_getBit
   5295 F1            [10]  922 	pop	af
   5296 F1            [10]  923 	pop	af
   5297 DD 75 EE      [19]  924 	ld	-18 (ix), l
   529A 7D            [ 4]  925 	ld	a, l
   529B 3D            [ 4]  926 	dec	a
   529C CA 3D 53      [10]  927 	jp	Z,00154$
                            928 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   529F DD 7E F0      [19]  929 	ld	a,-16 (ix)
   52A2 DD 96 F4      [19]  930 	sub	a, -12 (ix)
   52A5 4F            [ 4]  931 	ld	c,a
   52A6 DD 7E F1      [19]  932 	ld	a,-15 (ix)
   52A9 DD 9E F5      [19]  933 	sbc	a, -11 (ix)
   52AC 47            [ 4]  934 	ld	b,a
   52AD C5            [11]  935 	push	bc
   52AE CD E2 4B      [17]  936 	call	_abs
   52B1 F1            [10]  937 	pop	af
   52B2 DD 74 EF      [19]  938 	ld	-17 (ix),h
   52B5 DD 75 EE      [19]  939 	ld	-18 (ix),l
   52B8 DD 6E FE      [19]  940 	ld	l,-2 (ix)
   52BB DD 66 FF      [19]  941 	ld	h,-1 (ix)
   52BE E5            [11]  942 	push	hl
   52BF CD E2 4B      [17]  943 	call	_abs
   52C2 F1            [10]  944 	pop	af
   52C3 DD 74 E3      [19]  945 	ld	-29 (ix),h
   52C6 DD 75 E2      [19]  946 	ld	-30 (ix),l
   52C9 DD 7E EE      [19]  947 	ld	a,-18 (ix)
   52CC DD 86 E2      [19]  948 	add	a, -30 (ix)
   52CF DD 77 EE      [19]  949 	ld	-18 (ix),a
   52D2 DD 7E EF      [19]  950 	ld	a,-17 (ix)
   52D5 DD 8E E3      [19]  951 	adc	a, -29 (ix)
   52D8 DD 77 EF      [19]  952 	ld	-17 (ix),a
   52DB DD 7E D3      [19]  953 	ld	a,-45 (ix)
   52DE DD 86 EE      [19]  954 	add	a, -18 (ix)
   52E1 DD 77 EE      [19]  955 	ld	-18 (ix),a
   52E4 DD 7E D4      [19]  956 	ld	a,-44 (ix)
   52E7 DD 8E EF      [19]  957 	adc	a, -17 (ix)
   52EA DD 77 EF      [19]  958 	ld	-17 (ix),a
   52ED DD 7E EE      [19]  959 	ld	a,-18 (ix)
   52F0 DD 77 DC      [19]  960 	ld	-36 (ix),a
   52F3 DD 7E EF      [19]  961 	ld	a,-17 (ix)
   52F6 DD 77 DD      [19]  962 	ld	-35 (ix),a
                            963 ;src/pathfinding.c:150: if(resultado == 0){
   52F9 DD 7E D9      [19]  964 	ld	a,-39 (ix)
   52FC B7            [ 4]  965 	or	a, a
   52FD 20 1A         [12]  966 	jr	NZ,00151$
                            967 ;src/pathfinding.c:151: if(dist1 >= dist3)
   52FF DD 7E DA      [19]  968 	ld	a,-38 (ix)
   5302 DD 96 DC      [19]  969 	sub	a, -36 (ix)
   5305 DD 7E DB      [19]  970 	ld	a,-37 (ix)
   5308 DD 9E DD      [19]  971 	sbc	a, -35 (ix)
   530B E2 10 53      [10]  972 	jp	PO, 00342$
   530E EE 80         [ 7]  973 	xor	a, #0x80
   5310                     974 00342$:
   5310 FA 3D 53      [10]  975 	jp	M,00154$
                            976 ;src/pathfinding.c:152: resultado = 2;
   5313 DD 36 D9 02   [19]  977 	ld	-39 (ix),#0x02
   5317 18 24         [12]  978 	jr	00154$
   5319                     979 00151$:
                            980 ;src/pathfinding.c:153: }else if(resultado == 1){
   5319 DD 7E D9      [19]  981 	ld	a,-39 (ix)
   531C 3D            [ 4]  982 	dec	a
   531D 20 1A         [12]  983 	jr	NZ,00148$
                            984 ;src/pathfinding.c:154: if(dist2 >= dist3)
   531F DD 7E D1      [19]  985 	ld	a,-47 (ix)
   5322 DD 96 DC      [19]  986 	sub	a, -36 (ix)
   5325 DD 7E D2      [19]  987 	ld	a,-46 (ix)
   5328 DD 9E DD      [19]  988 	sbc	a, -35 (ix)
   532B E2 30 53      [10]  989 	jp	PO, 00345$
   532E EE 80         [ 7]  990 	xor	a, #0x80
   5330                     991 00345$:
   5330 FA 3D 53      [10]  992 	jp	M,00154$
                            993 ;src/pathfinding.c:155: resultado = 2;
   5333 DD 36 D9 02   [19]  994 	ld	-39 (ix),#0x02
   5337 18 04         [12]  995 	jr	00154$
   5339                     996 00148$:
                            997 ;src/pathfinding.c:157: resultado = 2;
   5339 DD 36 D9 02   [19]  998 	ld	-39 (ix),#0x02
   533D                     999 00154$:
                           1000 ;src/pathfinding.c:161: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
   533D DD 7E F8      [19] 1001 	ld	a,-8 (ix)
   5340 DD 77 EE      [19] 1002 	ld	-18 (ix),a
   5343 DD 7E F9      [19] 1003 	ld	a,-7 (ix)
   5346 DD 77 EF      [19] 1004 	ld	-17 (ix),a
   5349 DD 7E E8      [19] 1005 	ld	a,-24 (ix)
   534C B7            [ 4] 1006 	or	a, a
   534D 28 0C         [12] 1007 	jr	Z,00180$
   534F DD 7E F2      [19] 1008 	ld	a,-14 (ix)
   5352 DD 77 EE      [19] 1009 	ld	-18 (ix),a
   5355 DD 7E F3      [19] 1010 	ld	a,-13 (ix)
   5358 DD 77 EF      [19] 1011 	ld	-17 (ix),a
   535B                    1012 00180$:
   535B DD CB EF 2E   [23] 1013 	sra	-17 (ix)
   535F DD CB EE 1E   [23] 1014 	rr	-18 (ix)
   5363 DD CB EF 2E   [23] 1015 	sra	-17 (ix)
   5367 DD CB EE 1E   [23] 1016 	rr	-18 (ix)
   536B DD 4E EE      [19] 1017 	ld	c,-18 (ix)
   536E DD 46 EF      [19] 1018 	ld	b,-17 (ix)
   5371 69            [ 4] 1019 	ld	l, c
   5372 60            [ 4] 1020 	ld	h, b
   5373 29            [11] 1021 	add	hl, hl
   5374 29            [11] 1022 	add	hl, hl
   5375 09            [11] 1023 	add	hl, bc
   5376 29            [11] 1024 	add	hl, hl
   5377 29            [11] 1025 	add	hl, hl
   5378 29            [11] 1026 	add	hl, hl
   5379 DD 75 EE      [19] 1027 	ld	-18 (ix),l
   537C DD 74 EF      [19] 1028 	ld	-17 (ix),h
   537F DD 7E 0A      [19] 1029 	ld	a,10 (ix)
   5382 DD 86 EE      [19] 1030 	add	a, -18 (ix)
   5385 DD 77 EE      [19] 1031 	ld	-18 (ix),a
   5388 DD 7E 0B      [19] 1032 	ld	a,11 (ix)
   538B DD 8E EF      [19] 1033 	adc	a, -17 (ix)
   538E DD 77 EF      [19] 1034 	ld	-17 (ix),a
   5391 DD 7E EC      [19] 1035 	ld	a,-20 (ix)
   5394 DD 77 E8      [19] 1036 	ld	-24 (ix),a
   5397 DD 7E ED      [19] 1037 	ld	a,-19 (ix)
   539A DD 77 E9      [19] 1038 	ld	-23 (ix),a
   539D DD CB ED 7E   [20] 1039 	bit	7, -19 (ix)
   53A1 28 10         [12] 1040 	jr	Z,00181$
   53A3 DD 7E EA      [19] 1041 	ld	a,-22 (ix)
   53A6 C6 02         [ 7] 1042 	add	a, #0x02
   53A8 DD 77 E8      [19] 1043 	ld	-24 (ix),a
   53AB DD 7E EB      [19] 1044 	ld	a,-21 (ix)
   53AE CE 00         [ 7] 1045 	adc	a, #0x00
   53B0 DD 77 E9      [19] 1046 	ld	-23 (ix),a
   53B3                    1047 00181$:
   53B3 DD CB E9 2E   [23] 1048 	sra	-23 (ix)
   53B7 DD CB E8 1E   [23] 1049 	rr	-24 (ix)
   53BB DD 7E E8      [19] 1050 	ld	a,-24 (ix)
   53BE DD 86 EE      [19] 1051 	add	a, -18 (ix)
   53C1 DD 77 EE      [19] 1052 	ld	-18 (ix),a
   53C4 DD 7E E9      [19] 1053 	ld	a,-23 (ix)
   53C7 DD 8E EF      [19] 1054 	adc	a, -17 (ix)
   53CA DD 77 EF      [19] 1055 	ld	-17 (ix),a
   53CD DD 6E EE      [19] 1056 	ld	l,-18 (ix)
   53D0 DD 66 EF      [19] 1057 	ld	h,-17 (ix)
   53D3 7E            [ 7] 1058 	ld	a,(hl)
   53D4 DD 77 EE      [19] 1059 	ld	-18 (ix),a
   53D7 3E 02         [ 7] 1060 	ld	a,#0x02
   53D9 DD 96 EE      [19] 1061 	sub	a, -18 (ix)
   53DC DA A6 54      [10] 1062 	jp	C,00172$
   53DF DD 6E E6      [19] 1063 	ld	l,-26 (ix)
   53E2 DD 66 E7      [19] 1064 	ld	h,-25 (ix)
   53E5 E5            [11] 1065 	push	hl
   53E6 21 E6 69      [10] 1066 	ld	hl,#_sol_matriz
   53E9 E5            [11] 1067 	push	hl
   53EA CD 32 4C      [17] 1068 	call	_getBit
   53ED F1            [10] 1069 	pop	af
   53EE F1            [10] 1070 	pop	af
   53EF 2D            [ 4] 1071 	dec	l
   53F0 CA A6 54      [10] 1072 	jp	Z,00172$
                           1073 ;src/pathfinding.c:162: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   53F3 DD 7E F0      [19] 1074 	ld	a,-16 (ix)
   53F6 DD 96 EC      [19] 1075 	sub	a, -20 (ix)
   53F9 4F            [ 4] 1076 	ld	c,a
   53FA DD 7E F1      [19] 1077 	ld	a,-15 (ix)
   53FD DD 9E ED      [19] 1078 	sbc	a, -19 (ix)
   5400 47            [ 4] 1079 	ld	b,a
   5401 C5            [11] 1080 	push	bc
   5402 CD E2 4B      [17] 1081 	call	_abs
   5405 F1            [10] 1082 	pop	af
   5406 DD 74 EF      [19] 1083 	ld	-17 (ix),h
   5409 DD 75 EE      [19] 1084 	ld	-18 (ix),l
   540C DD 6E FE      [19] 1085 	ld	l,-2 (ix)
   540F DD 66 FF      [19] 1086 	ld	h,-1 (ix)
   5412 E5            [11] 1087 	push	hl
   5413 CD E2 4B      [17] 1088 	call	_abs
   5416 F1            [10] 1089 	pop	af
   5417 DD 74 FF      [19] 1090 	ld	-1 (ix),h
   541A DD 75 FE      [19] 1091 	ld	-2 (ix),l
   541D DD 7E EE      [19] 1092 	ld	a,-18 (ix)
   5420 DD 86 FE      [19] 1093 	add	a, -2 (ix)
   5423 DD 77 EE      [19] 1094 	ld	-18 (ix),a
   5426 DD 7E EF      [19] 1095 	ld	a,-17 (ix)
   5429 DD 8E FF      [19] 1096 	adc	a, -1 (ix)
   542C DD 77 EF      [19] 1097 	ld	-17 (ix),a
   542F DD 7E EE      [19] 1098 	ld	a,-18 (ix)
   5432 DD 86 E0      [19] 1099 	add	a, -32 (ix)
   5435 DD 77 D7      [19] 1100 	ld	-41 (ix),a
   5438 DD 7E EF      [19] 1101 	ld	a,-17 (ix)
   543B DD 8E E1      [19] 1102 	adc	a, -31 (ix)
   543E DD 77 D8      [19] 1103 	ld	-40 (ix),a
                           1104 ;src/pathfinding.c:163: if(resultado == 0){
   5441 DD 7E D9      [19] 1105 	ld	a,-39 (ix)
   5444 B7            [ 4] 1106 	or	a, a
   5445 20 1A         [12] 1107 	jr	NZ,00169$
                           1108 ;src/pathfinding.c:164: if(dist1 >= dist4)
   5447 DD 7E DA      [19] 1109 	ld	a,-38 (ix)
   544A DD 96 D7      [19] 1110 	sub	a, -41 (ix)
   544D DD 7E DB      [19] 1111 	ld	a,-37 (ix)
   5450 DD 9E D8      [19] 1112 	sbc	a, -40 (ix)
   5453 E2 58 54      [10] 1113 	jp	PO, 00347$
   5456 EE 80         [ 7] 1114 	xor	a, #0x80
   5458                    1115 00347$:
   5458 FA A6 54      [10] 1116 	jp	M,00172$
                           1117 ;src/pathfinding.c:165: resultado = 3;
   545B DD 36 D9 03   [19] 1118 	ld	-39 (ix),#0x03
   545F 18 45         [12] 1119 	jr	00172$
   5461                    1120 00169$:
                           1121 ;src/pathfinding.c:166: }else if(resultado == 1){
   5461 DD 7E D9      [19] 1122 	ld	a,-39 (ix)
   5464 3D            [ 4] 1123 	dec	a
   5465 20 1A         [12] 1124 	jr	NZ,00166$
                           1125 ;src/pathfinding.c:167: if(dist2 >= dist4)
   5467 DD 7E D1      [19] 1126 	ld	a,-47 (ix)
   546A DD 96 D7      [19] 1127 	sub	a, -41 (ix)
   546D DD 7E D2      [19] 1128 	ld	a,-46 (ix)
   5470 DD 9E D8      [19] 1129 	sbc	a, -40 (ix)
   5473 E2 78 54      [10] 1130 	jp	PO, 00350$
   5476 EE 80         [ 7] 1131 	xor	a, #0x80
   5478                    1132 00350$:
   5478 FA A6 54      [10] 1133 	jp	M,00172$
                           1134 ;src/pathfinding.c:168: resultado = 3;
   547B DD 36 D9 03   [19] 1135 	ld	-39 (ix),#0x03
   547F 18 25         [12] 1136 	jr	00172$
   5481                    1137 00166$:
                           1138 ;src/pathfinding.c:169: }else if (resultado == 2){
   5481 DD 7E D9      [19] 1139 	ld	a,-39 (ix)
   5484 D6 02         [ 7] 1140 	sub	a, #0x02
   5486 20 1A         [12] 1141 	jr	NZ,00163$
                           1142 ;src/pathfinding.c:170: if(dist3 >= dist4)
   5488 DD 7E DC      [19] 1143 	ld	a,-36 (ix)
   548B DD 96 D7      [19] 1144 	sub	a, -41 (ix)
   548E DD 7E DD      [19] 1145 	ld	a,-35 (ix)
   5491 DD 9E D8      [19] 1146 	sbc	a, -40 (ix)
   5494 E2 99 54      [10] 1147 	jp	PO, 00353$
   5497 EE 80         [ 7] 1148 	xor	a, #0x80
   5499                    1149 00353$:
   5499 FA A6 54      [10] 1150 	jp	M,00172$
                           1151 ;src/pathfinding.c:171: resultado = 3;
   549C DD 36 D9 03   [19] 1152 	ld	-39 (ix),#0x03
   54A0 18 04         [12] 1153 	jr	00172$
   54A2                    1154 00163$:
                           1155 ;src/pathfinding.c:173: resultado = 3;
   54A2 DD 36 D9 03   [19] 1156 	ld	-39 (ix),#0x03
   54A6                    1157 00172$:
                           1158 ;src/pathfinding.c:177: return resultado;
   54A6 DD 6E D9      [19] 1159 	ld	l,-39 (ix)
   54A9 DD F9         [10] 1160 	ld	sp, ix
   54AB DD E1         [14] 1161 	pop	ix
   54AD C9            [10] 1162 	ret
                           1163 ;src/pathfinding.c:181: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                           1164 ;	---------------------------------
                           1165 ; Function pathFinding
                           1166 ; ---------------------------------
   54AE                    1167 _pathFinding::
   54AE DD E5         [15] 1168 	push	ix
   54B0 DD 21 00 00   [14] 1169 	ld	ix,#0
   54B4 DD 39         [15] 1170 	add	ix,sp
   54B6 21 E9 FF      [10] 1171 	ld	hl,#-23
   54B9 39            [11] 1172 	add	hl,sp
   54BA F9            [ 6] 1173 	ld	sp,hl
                           1174 ;src/pathfinding.c:193: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
   54BB DD 4E F6      [19] 1175 	ld	c,-10 (ix)
   54BE 06 00         [ 7] 1176 	ld	b,#0x00
   54C0 21 EA FF      [10] 1177 	ld	hl,#0xFFEA
   54C3 09            [11] 1178 	add	hl,bc
   54C4 5D            [ 4] 1179 	ld	e, l
   54C5 54            [ 4] 1180 	ld	d, h
   54C6 29            [11] 1181 	add	hl, hl
   54C7 29            [11] 1182 	add	hl, hl
   54C8 19            [11] 1183 	add	hl, de
   54C9 29            [11] 1184 	add	hl, hl
   54CA 29            [11] 1185 	add	hl, hl
   54CB 29            [11] 1186 	add	hl, hl
   54CC 29            [11] 1187 	add	hl, hl
   54CD DD 5E F3      [19] 1188 	ld	e,-13 (ix)
   54D0 16 00         [ 7] 1189 	ld	d,#0x00
   54D2 19            [11] 1190 	add	hl,de
   54D3 DD 75 F4      [19] 1191 	ld	-12 (ix),l
   54D6 DD 74 F5      [19] 1192 	ld	-11 (ix),h
                           1193 ;src/pathfinding.c:194: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
   54D9 79            [ 4] 1194 	ld	a,c
   54DA C6 E6         [ 7] 1195 	add	a,#0xE6
   54DC 6F            [ 4] 1196 	ld	l,a
   54DD 78            [ 4] 1197 	ld	a,b
   54DE CE FF         [ 7] 1198 	adc	a,#0xFF
   54E0 67            [ 4] 1199 	ld	h,a
   54E1 D5            [11] 1200 	push	de
   54E2 5D            [ 4] 1201 	ld	e, l
   54E3 54            [ 4] 1202 	ld	d, h
   54E4 29            [11] 1203 	add	hl, hl
   54E5 29            [11] 1204 	add	hl, hl
   54E6 19            [11] 1205 	add	hl, de
   54E7 29            [11] 1206 	add	hl, hl
   54E8 29            [11] 1207 	add	hl, hl
   54E9 29            [11] 1208 	add	hl, hl
   54EA 29            [11] 1209 	add	hl, hl
   54EB D1            [10] 1210 	pop	de
   54EC 19            [11] 1211 	add	hl,de
   54ED DD 75 ED      [19] 1212 	ld	-19 (ix),l
   54F0 DD 74 EE      [19] 1213 	ld	-18 (ix),h
                           1214 ;src/pathfinding.c:195: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
   54F3 79            [ 4] 1215 	ld	a,c
   54F4 C6 E8         [ 7] 1216 	add	a,#0xE8
   54F6 4F            [ 4] 1217 	ld	c,a
   54F7 78            [ 4] 1218 	ld	a,b
   54F8 CE FF         [ 7] 1219 	adc	a,#0xFF
   54FA 47            [ 4] 1220 	ld	b,a
   54FB 69            [ 4] 1221 	ld	l, c
   54FC 60            [ 4] 1222 	ld	h, b
   54FD 29            [11] 1223 	add	hl, hl
   54FE 29            [11] 1224 	add	hl, hl
   54FF 09            [11] 1225 	add	hl, bc
   5500 29            [11] 1226 	add	hl, hl
   5501 29            [11] 1227 	add	hl, hl
   5502 29            [11] 1228 	add	hl, hl
   5503 29            [11] 1229 	add	hl, hl
   5504 4D            [ 4] 1230 	ld	c,l
   5505 44            [ 4] 1231 	ld	b,h
   5506 6B            [ 4] 1232 	ld	l, e
   5507 62            [ 4] 1233 	ld	h, d
   5508 23            [ 6] 1234 	inc	hl
   5509 09            [11] 1235 	add	hl,bc
   550A DD 75 EB      [19] 1236 	ld	-21 (ix),l
   550D DD 74 EC      [19] 1237 	ld	-20 (ix),h
                           1238 ;src/pathfinding.c:196: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
   5510 1B            [ 6] 1239 	dec	de
   5511 69            [ 4] 1240 	ld	l, c
   5512 60            [ 4] 1241 	ld	h, b
   5513 19            [11] 1242 	add	hl,de
   5514 33            [ 6] 1243 	inc	sp
   5515 33            [ 6] 1244 	inc	sp
   5516 E5            [11] 1245 	push	hl
                           1246 ;src/pathfinding.c:198: u8 problem = 0;
   5517 DD 36 EF 00   [19] 1247 	ld	-17 (ix),#0x00
                           1248 ;src/pathfinding.c:200: x = s_x;
   551B DD 7E 04      [19] 1249 	ld	a,4 (ix)
   551E DD 77 F3      [19] 1250 	ld	-13 (ix),a
                           1251 ;src/pathfinding.c:202: y = s_y;
   5521 DD 7E 05      [19] 1252 	ld	a,5 (ix)
   5524 DD 77 F6      [19] 1253 	ld	-10 (ix),a
                           1254 ;src/pathfinding.c:204: k = 0;
   5527 DD 36 F7 00   [19] 1255 	ld	-9 (ix),#0x00
                           1256 ;src/pathfinding.c:205: aux = 1;
   552B DD 36 F2 01   [19] 1257 	ld	-14 (ix),#0x01
                           1258 ;src/pathfinding.c:208: memset(sol_matriz, 0, (40*2*44*4)/8);
   552F 21 E6 69      [10] 1259 	ld	hl,#_sol_matriz
   5532 36 00         [10] 1260 	ld	(hl), #0x00
   5534 5D            [ 4] 1261 	ld	e, l
   5535 54            [ 4] 1262 	ld	d, h
   5536 13            [ 6] 1263 	inc	de
   5537 01 DF 06      [10] 1264 	ld	bc, #0x06DF
   553A ED B0         [21] 1265 	ldir
                           1266 ;src/pathfinding.c:209: enemy->longitud_camino = 0;
   553C DD 7E 08      [19] 1267 	ld	a,8 (ix)
   553F DD 77 F8      [19] 1268 	ld	-8 (ix),a
   5542 DD 7E 09      [19] 1269 	ld	a,9 (ix)
   5545 DD 77 F9      [19] 1270 	ld	-7 (ix),a
   5548 DD 7E F8      [19] 1271 	ld	a,-8 (ix)
   554B C6 42         [ 7] 1272 	add	a, #0x42
   554D DD 77 FC      [19] 1273 	ld	-4 (ix),a
   5550 DD 7E F9      [19] 1274 	ld	a,-7 (ix)
   5553 CE 01         [ 7] 1275 	adc	a, #0x01
   5555 DD 77 FD      [19] 1276 	ld	-3 (ix),a
   5558 DD 6E FC      [19] 1277 	ld	l,-4 (ix)
   555B DD 66 FD      [19] 1278 	ld	h,-3 (ix)
   555E 36 00         [10] 1279 	ld	(hl),#0x00
                           1280 ;src/pathfinding.c:210: sol_tam = 1;
   5560 21 E5 69      [10] 1281 	ld	hl,#_sol_tam + 0
   5563 36 01         [10] 1282 	ld	(hl), #0x01
                           1283 ;src/pathfinding.c:211: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
   5565 DD 7E F6      [19] 1284 	ld	a,-10 (ix)
   5568 DD 77 FA      [19] 1285 	ld	-6 (ix),a
   556B DD 36 FB 00   [19] 1286 	ld	-5 (ix),#0x00
   556F DD 7E FA      [19] 1287 	ld	a,-6 (ix)
   5572 C6 E8         [ 7] 1288 	add	a,#0xE8
   5574 DD 77 FA      [19] 1289 	ld	-6 (ix),a
   5577 DD 7E FB      [19] 1290 	ld	a,-5 (ix)
   557A CE FF         [ 7] 1291 	adc	a,#0xFF
   557C DD 77 FB      [19] 1292 	ld	-5 (ix),a
   557F DD 4E FA      [19] 1293 	ld	c,-6 (ix)
   5582 DD 46 FB      [19] 1294 	ld	b,-5 (ix)
   5585 69            [ 4] 1295 	ld	l, c
   5586 60            [ 4] 1296 	ld	h, b
   5587 29            [11] 1297 	add	hl, hl
   5588 29            [11] 1298 	add	hl, hl
   5589 09            [11] 1299 	add	hl, bc
   558A 29            [11] 1300 	add	hl, hl
   558B 29            [11] 1301 	add	hl, hl
   558C 29            [11] 1302 	add	hl, hl
   558D 29            [11] 1303 	add	hl, hl
   558E DD 75 FA      [19] 1304 	ld	-6 (ix),l
   5591 DD 74 FB      [19] 1305 	ld	-5 (ix),h
   5594 DD 7E F3      [19] 1306 	ld	a,-13 (ix)
   5597 DD 77 FE      [19] 1307 	ld	-2 (ix),a
   559A DD 36 FF 00   [19] 1308 	ld	-1 (ix),#0x00
   559E DD 7E FA      [19] 1309 	ld	a,-6 (ix)
   55A1 DD 86 FE      [19] 1310 	add	a, -2 (ix)
   55A4 DD 77 FE      [19] 1311 	ld	-2 (ix),a
   55A7 DD 7E FB      [19] 1312 	ld	a,-5 (ix)
   55AA DD 8E FF      [19] 1313 	adc	a, -1 (ix)
   55AD DD 77 FF      [19] 1314 	ld	-1 (ix),a
   55B0 21 01 00      [10] 1315 	ld	hl,#0x0001
   55B3 E5            [11] 1316 	push	hl
   55B4 DD 6E FE      [19] 1317 	ld	l,-2 (ix)
   55B7 DD 66 FF      [19] 1318 	ld	h,-1 (ix)
   55BA E5            [11] 1319 	push	hl
   55BB 21 E6 69      [10] 1320 	ld	hl,#_sol_matriz
   55BE E5            [11] 1321 	push	hl
   55BF CD 7D 4C      [17] 1322 	call	_setBit
   55C2 21 06 00      [10] 1323 	ld	hl,#6
   55C5 39            [11] 1324 	add	hl,sp
   55C6 F9            [ 6] 1325 	ld	sp,hl
                           1326 ;src/pathfinding.c:212: inserted = anyadirALista(x, y);
   55C7 DD 66 F6      [19] 1327 	ld	h,-10 (ix)
   55CA DD 6E F3      [19] 1328 	ld	l,-13 (ix)
   55CD E5            [11] 1329 	push	hl
   55CE CD F7 4C      [17] 1330 	call	_anyadirALista
   55D1 F1            [10] 1331 	pop	af
   55D2 DD 75 F1      [19] 1332 	ld	-15 (ix),l
                           1333 ;src/pathfinding.c:216: while (aux){
   55D5                    1334 00116$:
   55D5 DD 7E F2      [19] 1335 	ld	a,-14 (ix)
   55D8 B7            [ 4] 1336 	or	a, a
   55D9 CA 7C 57      [10] 1337 	jp	Z,00118$
                           1338 ;src/pathfinding.c:217: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   55DC DD 7E 06      [19] 1339 	ld	a,6 (ix)
   55DF DD 96 F3      [19] 1340 	sub	a, -13 (ix)
   55E2 20 08         [12] 1341 	jr	NZ,00114$
   55E4 DD 7E 07      [19] 1342 	ld	a,7 (ix)
   55E7 DD 96 F6      [19] 1343 	sub	a, -10 (ix)
   55EA 28 0C         [12] 1344 	jr	Z,00110$
   55EC                    1345 00114$:
   55EC 3A E5 69      [13] 1346 	ld	a,(#_sol_tam + 0)
   55EF B7            [ 4] 1347 	or	a, a
   55F0 28 06         [12] 1348 	jr	Z,00110$
   55F2 DD 7E F1      [19] 1349 	ld	a,-15 (ix)
   55F5 B7            [ 4] 1350 	or	a, a
   55F6 20 16         [12] 1351 	jr	NZ,00111$
   55F8                    1352 00110$:
                           1353 ;src/pathfinding.c:219: if(inserted == 0 || sol_tam == 0){
   55F8 DD 7E F1      [19] 1354 	ld	a,-15 (ix)
   55FB B7            [ 4] 1355 	or	a, a
   55FC 28 06         [12] 1356 	jr	Z,00101$
   55FE 3A E5 69      [13] 1357 	ld	a,(#_sol_tam + 0)
   5601 B7            [ 4] 1358 	or	a, a
   5602 20 04         [12] 1359 	jr	NZ,00102$
   5604                    1360 00101$:
                           1361 ;src/pathfinding.c:220: problem = 1;
   5604 DD 36 EF 01   [19] 1362 	ld	-17 (ix),#0x01
   5608                    1363 00102$:
                           1364 ;src/pathfinding.c:223: aux = 0;
   5608 DD 36 F2 00   [19] 1365 	ld	-14 (ix),#0x00
   560C 18 C7         [12] 1366 	jr	00116$
   560E                    1367 00111$:
                           1368 ;src/pathfinding.c:225: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   560E DD 6E 0A      [19] 1369 	ld	l,10 (ix)
   5611 DD 66 0B      [19] 1370 	ld	h,11 (ix)
   5614 E5            [11] 1371 	push	hl
   5615 DD 66 07      [19] 1372 	ld	h,7 (ix)
   5618 DD 6E 06      [19] 1373 	ld	l,6 (ix)
   561B E5            [11] 1374 	push	hl
   561C DD 66 05      [19] 1375 	ld	h,5 (ix)
   561F DD 6E 04      [19] 1376 	ld	l,4 (ix)
   5622 E5            [11] 1377 	push	hl
   5623 DD 66 F6      [19] 1378 	ld	h,-10 (ix)
   5626 DD 6E F3      [19] 1379 	ld	l,-13 (ix)
   5629 E5            [11] 1380 	push	hl
   562A CD 35 4D      [17] 1381 	call	_adjacentTiles
   562D F1            [10] 1382 	pop	af
   562E F1            [10] 1383 	pop	af
   562F F1            [10] 1384 	pop	af
   5630 F1            [10] 1385 	pop	af
   5631 5D            [ 4] 1386 	ld	e,l
                           1387 ;src/pathfinding.c:227: switch(movimiento){
   5632 3E 04         [ 7] 1388 	ld	a,#0x04
   5634 93            [ 4] 1389 	sub	a, e
   5635 38 9E         [12] 1390 	jr	C,00116$
                           1391 ;src/pathfinding.c:233: k = k+2;
   5637 DD 4E F7      [19] 1392 	ld	c,-9 (ix)
   563A 0C            [ 4] 1393 	inc	c
   563B 0C            [ 4] 1394 	inc	c
                           1395 ;src/pathfinding.c:227: switch(movimiento){
   563C 16 00         [ 7] 1396 	ld	d,#0x00
   563E 21 45 56      [10] 1397 	ld	hl,#00169$
   5641 19            [11] 1398 	add	hl,de
   5642 19            [11] 1399 	add	hl,de
   5643 19            [11] 1400 	add	hl,de
   5644 E9            [ 4] 1401 	jp	(hl)
   5645                    1402 00169$:
   5645 C3 54 56      [10] 1403 	jp	00104$
   5648 C3 8B 56      [10] 1404 	jp	00105$
   564B C3 C2 56      [10] 1405 	jp	00106$
   564E C3 F8 56      [10] 1406 	jp	00107$
   5651 C3 2E 57      [10] 1407 	jp	00108$
                           1408 ;src/pathfinding.c:228: case 0:
   5654                    1409 00104$:
                           1410 ;src/pathfinding.c:230: setBit(sol_matriz, up, 1);
   5654 C5            [11] 1411 	push	bc
   5655 21 01 00      [10] 1412 	ld	hl,#0x0001
   5658 E5            [11] 1413 	push	hl
   5659 DD 6E ED      [19] 1414 	ld	l,-19 (ix)
   565C DD 66 EE      [19] 1415 	ld	h,-18 (ix)
   565F E5            [11] 1416 	push	hl
   5660 21 E6 69      [10] 1417 	ld	hl,#_sol_matriz
   5663 E5            [11] 1418 	push	hl
   5664 CD 7D 4C      [17] 1419 	call	_setBit
   5667 21 06 00      [10] 1420 	ld	hl,#6
   566A 39            [11] 1421 	add	hl,sp
   566B F9            [ 6] 1422 	ld	sp,hl
   566C C1            [10] 1423 	pop	bc
                           1424 ;src/pathfinding.c:231: inserted = anyadirALista(x, y-2);
   566D DD 46 F6      [19] 1425 	ld	b,-10 (ix)
   5670 05            [ 4] 1426 	dec	b
   5671 05            [ 4] 1427 	dec	b
   5672 C5            [11] 1428 	push	bc
   5673 C5            [11] 1429 	push	bc
   5674 33            [ 6] 1430 	inc	sp
   5675 DD 7E F3      [19] 1431 	ld	a,-13 (ix)
   5678 F5            [11] 1432 	push	af
   5679 33            [ 6] 1433 	inc	sp
   567A CD F7 4C      [17] 1434 	call	_anyadirALista
   567D F1            [10] 1435 	pop	af
   567E C1            [10] 1436 	pop	bc
   567F DD 75 F1      [19] 1437 	ld	-15 (ix),l
                           1438 ;src/pathfinding.c:232: y = y-1;
   5682 DD 35 F6      [23] 1439 	dec	-10 (ix)
                           1440 ;src/pathfinding.c:233: k = k+2;
   5685 DD 71 F7      [19] 1441 	ld	-9 (ix),c
                           1442 ;src/pathfinding.c:234: break;
   5688 C3 D5 55      [10] 1443 	jp	00116$
                           1444 ;src/pathfinding.c:235: case 1:
   568B                    1445 00105$:
                           1446 ;src/pathfinding.c:237: setBit(sol_matriz, down, 1);
   568B C5            [11] 1447 	push	bc
   568C 21 01 00      [10] 1448 	ld	hl,#0x0001
   568F E5            [11] 1449 	push	hl
   5690 DD 6E F4      [19] 1450 	ld	l,-12 (ix)
   5693 DD 66 F5      [19] 1451 	ld	h,-11 (ix)
   5696 E5            [11] 1452 	push	hl
   5697 21 E6 69      [10] 1453 	ld	hl,#_sol_matriz
   569A E5            [11] 1454 	push	hl
   569B CD 7D 4C      [17] 1455 	call	_setBit
   569E 21 06 00      [10] 1456 	ld	hl,#6
   56A1 39            [11] 1457 	add	hl,sp
   56A2 F9            [ 6] 1458 	ld	sp,hl
   56A3 C1            [10] 1459 	pop	bc
                           1460 ;src/pathfinding.c:238: inserted = anyadirALista(x, y+2);
   56A4 DD 46 F6      [19] 1461 	ld	b,-10 (ix)
   56A7 04            [ 4] 1462 	inc	b
   56A8 04            [ 4] 1463 	inc	b
   56A9 C5            [11] 1464 	push	bc
   56AA C5            [11] 1465 	push	bc
   56AB 33            [ 6] 1466 	inc	sp
   56AC DD 7E F3      [19] 1467 	ld	a,-13 (ix)
   56AF F5            [11] 1468 	push	af
   56B0 33            [ 6] 1469 	inc	sp
   56B1 CD F7 4C      [17] 1470 	call	_anyadirALista
   56B4 F1            [10] 1471 	pop	af
   56B5 C1            [10] 1472 	pop	bc
   56B6 DD 75 F1      [19] 1473 	ld	-15 (ix),l
                           1474 ;src/pathfinding.c:239: y = y+1;
   56B9 DD 34 F6      [23] 1475 	inc	-10 (ix)
                           1476 ;src/pathfinding.c:240: k = k+2;
   56BC DD 71 F7      [19] 1477 	ld	-9 (ix),c
                           1478 ;src/pathfinding.c:241: break;
   56BF C3 D5 55      [10] 1479 	jp	00116$
                           1480 ;src/pathfinding.c:242: case 2:
   56C2                    1481 00106$:
                           1482 ;src/pathfinding.c:244: setBit(sol_matriz, left, 1);
   56C2 C5            [11] 1483 	push	bc
   56C3 21 01 00      [10] 1484 	ld	hl,#0x0001
   56C6 E5            [11] 1485 	push	hl
   56C7 DD 6E E9      [19] 1486 	ld	l,-23 (ix)
   56CA DD 66 EA      [19] 1487 	ld	h,-22 (ix)
   56CD E5            [11] 1488 	push	hl
   56CE 21 E6 69      [10] 1489 	ld	hl,#_sol_matriz
   56D1 E5            [11] 1490 	push	hl
   56D2 CD 7D 4C      [17] 1491 	call	_setBit
   56D5 21 06 00      [10] 1492 	ld	hl,#6
   56D8 39            [11] 1493 	add	hl,sp
   56D9 F9            [ 6] 1494 	ld	sp,hl
   56DA C1            [10] 1495 	pop	bc
                           1496 ;src/pathfinding.c:245: inserted = anyadirALista(x-1, y);
   56DB DD 46 F3      [19] 1497 	ld	b,-13 (ix)
   56DE 05            [ 4] 1498 	dec	b
   56DF C5            [11] 1499 	push	bc
   56E0 DD 7E F6      [19] 1500 	ld	a,-10 (ix)
   56E3 F5            [11] 1501 	push	af
   56E4 33            [ 6] 1502 	inc	sp
   56E5 C5            [11] 1503 	push	bc
   56E6 33            [ 6] 1504 	inc	sp
   56E7 CD F7 4C      [17] 1505 	call	_anyadirALista
   56EA F1            [10] 1506 	pop	af
   56EB C1            [10] 1507 	pop	bc
   56EC DD 75 F1      [19] 1508 	ld	-15 (ix),l
                           1509 ;src/pathfinding.c:246: x = x-1;
   56EF DD 70 F3      [19] 1510 	ld	-13 (ix),b
                           1511 ;src/pathfinding.c:247: k = k+2;
   56F2 DD 71 F7      [19] 1512 	ld	-9 (ix),c
                           1513 ;src/pathfinding.c:248: break;
   56F5 C3 D5 55      [10] 1514 	jp	00116$
                           1515 ;src/pathfinding.c:249: case 3:
   56F8                    1516 00107$:
                           1517 ;src/pathfinding.c:251: setBit(sol_matriz, right, 1);
   56F8 C5            [11] 1518 	push	bc
   56F9 21 01 00      [10] 1519 	ld	hl,#0x0001
   56FC E5            [11] 1520 	push	hl
   56FD DD 6E EB      [19] 1521 	ld	l,-21 (ix)
   5700 DD 66 EC      [19] 1522 	ld	h,-20 (ix)
   5703 E5            [11] 1523 	push	hl
   5704 21 E6 69      [10] 1524 	ld	hl,#_sol_matriz
   5707 E5            [11] 1525 	push	hl
   5708 CD 7D 4C      [17] 1526 	call	_setBit
   570B 21 06 00      [10] 1527 	ld	hl,#6
   570E 39            [11] 1528 	add	hl,sp
   570F F9            [ 6] 1529 	ld	sp,hl
   5710 C1            [10] 1530 	pop	bc
                           1531 ;src/pathfinding.c:252: inserted = anyadirALista(x+1, y);
   5711 DD 46 F3      [19] 1532 	ld	b,-13 (ix)
   5714 04            [ 4] 1533 	inc	b
   5715 C5            [11] 1534 	push	bc
   5716 DD 7E F6      [19] 1535 	ld	a,-10 (ix)
   5719 F5            [11] 1536 	push	af
   571A 33            [ 6] 1537 	inc	sp
   571B C5            [11] 1538 	push	bc
   571C 33            [ 6] 1539 	inc	sp
   571D CD F7 4C      [17] 1540 	call	_anyadirALista
   5720 F1            [10] 1541 	pop	af
   5721 C1            [10] 1542 	pop	bc
   5722 DD 75 F1      [19] 1543 	ld	-15 (ix),l
                           1544 ;src/pathfinding.c:253: x = x+1;
   5725 DD 70 F3      [19] 1545 	ld	-13 (ix),b
                           1546 ;src/pathfinding.c:254: k = k+2;
   5728 DD 71 F7      [19] 1547 	ld	-9 (ix),c
                           1548 ;src/pathfinding.c:255: break;
   572B C3 D5 55      [10] 1549 	jp	00116$
                           1550 ;src/pathfinding.c:257: case 4:
   572E                    1551 00108$:
                           1552 ;src/pathfinding.c:259: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
   572E DD 7E F6      [19] 1553 	ld	a, -10 (ix)
   5731 06 00         [ 7] 1554 	ld	b, #0x00
   5733 C6 80         [ 7] 1555 	add	a,#0x80
   5735 4F            [ 4] 1556 	ld	c,a
   5736 78            [ 4] 1557 	ld	a,b
   5737 CE F8         [ 7] 1558 	adc	a,#0xF8
   5739 47            [ 4] 1559 	ld	b,a
   573A DD 6E F3      [19] 1560 	ld	l,-13 (ix)
   573D 26 00         [ 7] 1561 	ld	h,#0x00
   573F 09            [11] 1562 	add	hl,bc
   5740 01 01 00      [10] 1563 	ld	bc,#0x0001
   5743 C5            [11] 1564 	push	bc
   5744 E5            [11] 1565 	push	hl
   5745 21 E6 69      [10] 1566 	ld	hl,#_sol_matriz
   5748 E5            [11] 1567 	push	hl
   5749 CD 7D 4C      [17] 1568 	call	_setBit
   574C 21 06 00      [10] 1569 	ld	hl,#6
   574F 39            [11] 1570 	add	hl,sp
   5750 F9            [ 6] 1571 	ld	sp,hl
                           1572 ;src/pathfinding.c:261: sol_tam = sol_tam - 2;
   5751 21 E5 69      [10] 1573 	ld	hl, #_sol_tam+0
   5754 35            [11] 1574 	dec	(hl)
   5755 21 E5 69      [10] 1575 	ld	hl, #_sol_tam+0
   5758 35            [11] 1576 	dec	(hl)
                           1577 ;src/pathfinding.c:262: k--;
   5759 DD 4E F7      [19] 1578 	ld	c,-9 (ix)
   575C 0D            [ 4] 1579 	dec	c
                           1580 ;src/pathfinding.c:263: y = camino[k];
   575D 21 26 72      [10] 1581 	ld	hl,#_camino
   5760 06 00         [ 7] 1582 	ld	b,#0x00
   5762 09            [11] 1583 	add	hl, bc
   5763 7E            [ 7] 1584 	ld	a,(hl)
   5764 DD 77 F6      [19] 1585 	ld	-10 (ix),a
                           1586 ;src/pathfinding.c:264: k--;
   5767 79            [ 4] 1587 	ld	a,c
   5768 C6 FF         [ 7] 1588 	add	a,#0xFF
                           1589 ;src/pathfinding.c:265: x = camino[k];
   576A DD 77 F7      [19] 1590 	ld	-9 (ix),a
   576D C6 26         [ 7] 1591 	add	a,#<(_camino)
   576F 6F            [ 4] 1592 	ld	l,a
   5770 3E 72         [ 7] 1593 	ld	a,#>(_camino)
   5772 CE 00         [ 7] 1594 	adc	a, #0x00
   5774 67            [ 4] 1595 	ld	h,a
   5775 7E            [ 7] 1596 	ld	a,(hl)
   5776 DD 77 F3      [19] 1597 	ld	-13 (ix),a
                           1598 ;src/pathfinding.c:267: }
   5779 C3 D5 55      [10] 1599 	jp	00116$
   577C                    1600 00118$:
                           1601 ;src/pathfinding.c:272: if(problem == 0){
   577C DD 7E EF      [19] 1602 	ld	a,-17 (ix)
   577F B7            [ 4] 1603 	or	a, a
   5780 20 72         [12] 1604 	jr	NZ,00127$
                           1605 ;src/pathfinding.c:273: if(sol_tam < 70){
   5782 3A E5 69      [13] 1606 	ld	a,(#_sol_tam + 0)
   5785 D6 46         [ 7] 1607 	sub	a, #0x46
   5787 30 0C         [12] 1608 	jr	NC,00120$
                           1609 ;src/pathfinding.c:274: enemy->longitud_camino = sol_tam;
   5789 DD 6E FC      [19] 1610 	ld	l,-4 (ix)
   578C DD 66 FD      [19] 1611 	ld	h,-3 (ix)
   578F 3A E5 69      [13] 1612 	ld	a,(#_sol_tam + 0)
   5792 77            [ 7] 1613 	ld	(hl),a
   5793 18 08         [12] 1614 	jr	00137$
   5795                    1615 00120$:
                           1616 ;src/pathfinding.c:276: enemy->longitud_camino = 70;
   5795 DD 6E FC      [19] 1617 	ld	l,-4 (ix)
   5798 DD 66 FD      [19] 1618 	ld	h,-3 (ix)
   579B 36 46         [10] 1619 	ld	(hl),#0x46
                           1620 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   579D                    1621 00137$:
   579D DD 7E F8      [19] 1622 	ld	a,-8 (ix)
   57A0 C6 16         [ 7] 1623 	add	a, #0x16
   57A2 DD 77 FE      [19] 1624 	ld	-2 (ix),a
   57A5 DD 7E F9      [19] 1625 	ld	a,-7 (ix)
   57A8 CE 00         [ 7] 1626 	adc	a, #0x00
   57AA DD 77 FF      [19] 1627 	ld	-1 (ix),a
   57AD DD 36 F0 00   [19] 1628 	ld	-16 (ix),#0x00
   57B1                    1629 00125$:
                           1630 ;src/pathfinding.c:280: enemy->camino[j] = camino[j];
   57B1 DD 7E F0      [19] 1631 	ld	a,-16 (ix)
   57B4 DD 77 FA      [19] 1632 	ld	-6 (ix),a
   57B7 DD 36 FB 00   [19] 1633 	ld	-5 (ix),#0x00
   57BB DD 7E FE      [19] 1634 	ld	a,-2 (ix)
   57BE DD 86 FA      [19] 1635 	add	a, -6 (ix)
   57C1 DD 77 FA      [19] 1636 	ld	-6 (ix),a
   57C4 DD 7E FF      [19] 1637 	ld	a,-1 (ix)
   57C7 DD 8E FB      [19] 1638 	adc	a, -5 (ix)
   57CA DD 77 FB      [19] 1639 	ld	-5 (ix),a
   57CD 3E 26         [ 7] 1640 	ld	a,#<(_camino)
   57CF DD 86 F0      [19] 1641 	add	a, -16 (ix)
   57D2 DD 77 FC      [19] 1642 	ld	-4 (ix),a
   57D5 3E 72         [ 7] 1643 	ld	a,#>(_camino)
   57D7 CE 00         [ 7] 1644 	adc	a, #0x00
   57D9 DD 77 FD      [19] 1645 	ld	-3 (ix),a
   57DC DD 6E FC      [19] 1646 	ld	l,-4 (ix)
   57DF DD 66 FD      [19] 1647 	ld	h,-3 (ix)
   57E2 4E            [ 7] 1648 	ld	c,(hl)
   57E3 DD 6E FA      [19] 1649 	ld	l,-6 (ix)
   57E6 DD 66 FB      [19] 1650 	ld	h,-5 (ix)
   57E9 71            [ 7] 1651 	ld	(hl),c
                           1652 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   57EA DD 34 F0      [23] 1653 	inc	-16 (ix)
   57ED DD 7E F0      [19] 1654 	ld	a,-16 (ix)
   57F0 D6 46         [ 7] 1655 	sub	a, #0x46
   57F2 38 BD         [12] 1656 	jr	C,00125$
   57F4                    1657 00127$:
   57F4 DD F9         [10] 1658 	ld	sp, ix
   57F6 DD E1         [14] 1659 	pop	ix
   57F8 C9            [10] 1660 	ret
                           1661 	.area _CODE
                           1662 	.area _INITIALIZER
                           1663 	.area _CABS (ABS)
