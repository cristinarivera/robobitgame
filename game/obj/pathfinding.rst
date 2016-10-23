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
   4CF9 3A EC 69      [13]  260 	ld	a,(#_sol_tam + 0)
   4CFC D6 46         [ 7]  261 	sub	a, #0x46
   4CFE 30 33         [12]  262 	jr	NC,00102$
                            263 ;src/pathfinding.c:55: camino[sol_tam-1] = x;
   4D00 01 2D 72      [10]  264 	ld	bc,#_camino+0
   4D03 21 EC 69      [10]  265 	ld	hl,#_sol_tam + 0
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
   4D16 21 EC 69      [10]  276 	ld	hl, #_sol_tam+0
   4D19 34            [11]  277 	inc	(hl)
                            278 ;src/pathfinding.c:57: camino[sol_tam-1] = y;
   4D1A 21 EC 69      [10]  279 	ld	hl,#_sol_tam + 0
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
   4D2D 21 EC 69      [10]  290 	ld	hl, #_sol_tam+0
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
   4D42 DD 36 D1 04   [19]  310 	ld	-47 (ix),#0x04
                            311 ;src/pathfinding.c:69: i16 dist1 = 0;
   4D46 DD 36 D8 00   [19]  312 	ld	-40 (ix),#0x00
   4D4A DD 36 D9 00   [19]  313 	ld	-39 (ix),#0x00
                            314 ;src/pathfinding.c:70: i16 dist2 = 0;
   4D4E DD 36 D4 00   [19]  315 	ld	-44 (ix),#0x00
   4D52 DD 36 D5 00   [19]  316 	ld	-43 (ix),#0x00
                            317 ;src/pathfinding.c:71: i16 dist3 = 0;
   4D56 DD 36 E0 00   [19]  318 	ld	-32 (ix),#0x00
   4D5A DD 36 E1 00   [19]  319 	ld	-31 (ix),#0x00
                            320 ;src/pathfinding.c:75: i16 heu_derecha = 0;
   4D5E DD 36 D6 00   [19]  321 	ld	-42 (ix),#0x00
   4D62 DD 36 D7 00   [19]  322 	ld	-41 (ix),#0x00
                            323 ;src/pathfinding.c:76: i16 heu_izquierda = 0;
   4D66 DD 36 DC 00   [19]  324 	ld	-36 (ix),#0x00
   4D6A DD 36 DD 00   [19]  325 	ld	-35 (ix),#0x00
                            326 ;src/pathfinding.c:77: i16 heu_arriba = 0;
   4D6E DD 36 DA 00   [19]  327 	ld	-38 (ix),#0x00
   4D72 DD 36 DB 00   [19]  328 	ld	-37 (ix),#0x00
                            329 ;src/pathfinding.c:78: i16 heu_abajo = 0;
   4D76 DD 36 D2 00   [19]  330 	ld	-46 (ix),#0x00
   4D7A DD 36 D3 00   [19]  331 	ld	-45 (ix),#0x00
                            332 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4D7E DD 7E 05      [19]  333 	ld	a,5 (ix)
   4D81 DD 77 FC      [19]  334 	ld	-4 (ix),a
   4D84 DD 36 FD 00   [19]  335 	ld	-3 (ix),#0x00
   4D88 DD 7E 04      [19]  336 	ld	a,4 (ix)
   4D8B DD 77 EA      [19]  337 	ld	-22 (ix),a
   4D8E DD 36 EB 00   [19]  338 	ld	-21 (ix),#0x00
   4D92 DD 7E FC      [19]  339 	ld	a,-4 (ix)
   4D95 C6 E8         [ 7]  340 	add	a,#0xE8
   4D97 DD 77 F8      [19]  341 	ld	-8 (ix),a
   4D9A DD 7E FD      [19]  342 	ld	a,-3 (ix)
   4D9D CE FF         [ 7]  343 	adc	a,#0xFF
   4D9F DD 77 F9      [19]  344 	ld	-7 (ix),a
   4DA2 DD 7E EA      [19]  345 	ld	a,-22 (ix)
   4DA5 C6 FF         [ 7]  346 	add	a,#0xFF
   4DA7 DD 77 F4      [19]  347 	ld	-12 (ix),a
   4DAA DD 7E EB      [19]  348 	ld	a,-21 (ix)
   4DAD CE FF         [ 7]  349 	adc	a,#0xFF
   4DAF DD 77 F5      [19]  350 	ld	-11 (ix),a
                            351 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4DB2 DD 7E EA      [19]  352 	ld	a,-22 (ix)
   4DB5 C6 01         [ 7]  353 	add	a, #0x01
   4DB7 DD 77 EC      [19]  354 	ld	-20 (ix),a
   4DBA DD 7E EB      [19]  355 	ld	a,-21 (ix)
   4DBD CE 00         [ 7]  356 	adc	a, #0x00
   4DBF DD 77 ED      [19]  357 	ld	-19 (ix),a
                            358 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4DC2 DD 7E FC      [19]  359 	ld	a,-4 (ix)
   4DC5 C6 E6         [ 7]  360 	add	a,#0xE6
   4DC7 DD 77 FA      [19]  361 	ld	-6 (ix),a
   4DCA DD 7E FD      [19]  362 	ld	a,-3 (ix)
   4DCD CE FF         [ 7]  363 	adc	a,#0xFF
   4DCF DD 77 FB      [19]  364 	ld	-5 (ix),a
                            365 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4DD2 DD 7E FC      [19]  366 	ld	a,-4 (ix)
   4DD5 C6 EA         [ 7]  367 	add	a, #0xEA
   4DD7 DD 77 F6      [19]  368 	ld	-10 (ix),a
   4DDA DD 7E FD      [19]  369 	ld	a,-3 (ix)
   4DDD CE FF         [ 7]  370 	adc	a, #0xFF
   4DDF DD 77 F7      [19]  371 	ld	-9 (ix),a
                            372 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4DE2 DD 4E F8      [19]  373 	ld	c,-8 (ix)
   4DE5 DD 46 F9      [19]  374 	ld	b,-7 (ix)
   4DE8 69            [ 4]  375 	ld	l, c
   4DE9 60            [ 4]  376 	ld	h, b
   4DEA 29            [11]  377 	add	hl, hl
   4DEB 29            [11]  378 	add	hl, hl
   4DEC 09            [11]  379 	add	hl, bc
   4DED 29            [11]  380 	add	hl, hl
   4DEE 29            [11]  381 	add	hl, hl
   4DEF 29            [11]  382 	add	hl, hl
   4DF0 29            [11]  383 	add	hl, hl
   4DF1 EB            [ 4]  384 	ex	de,hl
                            385 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4DF2 DD 4E FA      [19]  386 	ld	c,-6 (ix)
   4DF5 DD 46 FB      [19]  387 	ld	b,-5 (ix)
   4DF8 69            [ 4]  388 	ld	l, c
   4DF9 60            [ 4]  389 	ld	h, b
   4DFA 29            [11]  390 	add	hl, hl
   4DFB 29            [11]  391 	add	hl, hl
   4DFC 09            [11]  392 	add	hl, bc
   4DFD 29            [11]  393 	add	hl, hl
   4DFE 29            [11]  394 	add	hl, hl
   4DFF 29            [11]  395 	add	hl, hl
   4E00 29            [11]  396 	add	hl, hl
   4E01 4D            [ 4]  397 	ld	c,l
   4E02 44            [ 4]  398 	ld	b,h
                            399 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4E03 D5            [11]  400 	push	de
   4E04 DD 5E F6      [19]  401 	ld	e,-10 (ix)
   4E07 DD 56 F7      [19]  402 	ld	d,-9 (ix)
   4E0A 6B            [ 4]  403 	ld	l, e
   4E0B 62            [ 4]  404 	ld	h, d
   4E0C 29            [11]  405 	add	hl, hl
   4E0D 29            [11]  406 	add	hl, hl
   4E0E 19            [11]  407 	add	hl, de
   4E0F 29            [11]  408 	add	hl, hl
   4E10 29            [11]  409 	add	hl, hl
   4E11 29            [11]  410 	add	hl, hl
   4E12 29            [11]  411 	add	hl, hl
   4E13 D1            [10]  412 	pop	de
                            413 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4E14 DD 7E F4      [19]  414 	ld	a,-12 (ix)
   4E17 83            [ 4]  415 	add	a, e
   4E18 DD 77 E2      [19]  416 	ld	-30 (ix),a
   4E1B DD 7E F5      [19]  417 	ld	a,-11 (ix)
   4E1E 8A            [ 4]  418 	adc	a, d
   4E1F DD 77 E3      [19]  419 	ld	-29 (ix),a
                            420 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4E22 DD 7E EC      [19]  421 	ld	a,-20 (ix)
   4E25 83            [ 4]  422 	add	a, e
   4E26 DD 77 E6      [19]  423 	ld	-26 (ix),a
   4E29 DD 7E ED      [19]  424 	ld	a,-19 (ix)
   4E2C 8A            [ 4]  425 	adc	a, d
   4E2D DD 77 E7      [19]  426 	ld	-25 (ix),a
                            427 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4E30 DD 7E EA      [19]  428 	ld	a,-22 (ix)
   4E33 81            [ 4]  429 	add	a, c
   4E34 DD 77 F2      [19]  430 	ld	-14 (ix),a
   4E37 DD 7E EB      [19]  431 	ld	a,-21 (ix)
   4E3A 88            [ 4]  432 	adc	a, b
   4E3B DD 77 F3      [19]  433 	ld	-13 (ix),a
                            434 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4E3E DD 7E EA      [19]  435 	ld	a,-22 (ix)
   4E41 85            [ 4]  436 	add	a, l
   4E42 DD 77 E4      [19]  437 	ld	-28 (ix),a
   4E45 DD 7E EB      [19]  438 	ld	a,-21 (ix)
   4E48 8C            [ 4]  439 	adc	a, h
   4E49 DD 77 E5      [19]  440 	ld	-27 (ix),a
                            441 ;src/pathfinding.c:82: if(x == f_x){
   4E4C DD 7E 04      [19]  442 	ld	a,4 (ix)
   4E4F DD 96 08      [19]  443 	sub	a, 8 (ix)
   4E52 20 5C         [12]  444 	jr	NZ,00130$
                            445 ;src/pathfinding.c:84: if(s_x < x){
   4E54 DD 7E 06      [19]  446 	ld	a,6 (ix)
   4E57 DD 96 04      [19]  447 	sub	a, 4 (ix)
   4E5A 30 19         [12]  448 	jr	NC,00102$
                            449 ;src/pathfinding.c:85: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1), 1);
   4E5C 21 01 00      [10]  450 	ld	hl,#0x0001
   4E5F E5            [11]  451 	push	hl
   4E60 DD 6E E2      [19]  452 	ld	l,-30 (ix)
   4E63 DD 66 E3      [19]  453 	ld	h,-29 (ix)
   4E66 E5            [11]  454 	push	hl
   4E67 21 ED 69      [10]  455 	ld	hl,#_sol_matriz
   4E6A E5            [11]  456 	push	hl
   4E6B CD 7D 4C      [17]  457 	call	_setBit
   4E6E 21 06 00      [10]  458 	ld	hl,#6
   4E71 39            [11]  459 	add	hl,sp
   4E72 F9            [ 6]  460 	ld	sp,hl
   4E73 18 17         [12]  461 	jr	00103$
   4E75                     462 00102$:
                            463 ;src/pathfinding.c:87: setBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1), 1);
   4E75 21 01 00      [10]  464 	ld	hl,#0x0001
   4E78 E5            [11]  465 	push	hl
   4E79 DD 6E E6      [19]  466 	ld	l,-26 (ix)
   4E7C DD 66 E7      [19]  467 	ld	h,-25 (ix)
   4E7F E5            [11]  468 	push	hl
   4E80 21 ED 69      [10]  469 	ld	hl,#_sol_matriz
   4E83 E5            [11]  470 	push	hl
   4E84 CD 7D 4C      [17]  471 	call	_setBit
   4E87 21 06 00      [10]  472 	ld	hl,#6
   4E8A 39            [11]  473 	add	hl,sp
   4E8B F9            [ 6]  474 	ld	sp,hl
   4E8C                     475 00103$:
                            476 ;src/pathfinding.c:91: if(y < f_y)
   4E8C DD 7E 05      [19]  477 	ld	a,5 (ix)
   4E8F DD 96 09      [19]  478 	sub	a, 9 (ix)
   4E92 30 08         [12]  479 	jr	NC,00105$
                            480 ;src/pathfinding.c:92: heu_abajo = -1;
   4E94 DD 36 D2 FF   [19]  481 	ld	-46 (ix),#0xFF
   4E98 DD 36 D3 FF   [19]  482 	ld	-45 (ix),#0xFF
   4E9C                     483 00105$:
                            484 ;src/pathfinding.c:94: if(y > f_y)
   4E9C DD 7E 09      [19]  485 	ld	a,9 (ix)
   4E9F DD 96 05      [19]  486 	sub	a, 5 (ix)
   4EA2 D2 6A 4F      [10]  487 	jp	NC,00131$
                            488 ;src/pathfinding.c:95: heu_arriba = -1;
   4EA5 DD 36 DA FF   [19]  489 	ld	-38 (ix),#0xFF
   4EA9 DD 36 DB FF   [19]  490 	ld	-37 (ix),#0xFF
   4EAD C3 6A 4F      [10]  491 	jp	00131$
   4EB0                     492 00130$:
                            493 ;src/pathfinding.c:97: }else if(y == f_y){
   4EB0 DD 7E 05      [19]  494 	ld	a,5 (ix)
   4EB3 DD 96 09      [19]  495 	sub	a, 9 (ix)
   4EB6 20 5A         [12]  496 	jr	NZ,00127$
                            497 ;src/pathfinding.c:99: if(s_y < y){
   4EB8 DD 7E 07      [19]  498 	ld	a,7 (ix)
   4EBB DD 96 05      [19]  499 	sub	a, 5 (ix)
   4EBE 30 19         [12]  500 	jr	NC,00109$
                            501 ;src/pathfinding.c:100: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)-2) * 40*2 + x, 1);
   4EC0 21 01 00      [10]  502 	ld	hl,#0x0001
   4EC3 E5            [11]  503 	push	hl
   4EC4 DD 6E F2      [19]  504 	ld	l,-14 (ix)
   4EC7 DD 66 F3      [19]  505 	ld	h,-13 (ix)
   4ECA E5            [11]  506 	push	hl
   4ECB 21 ED 69      [10]  507 	ld	hl,#_sol_matriz
   4ECE E5            [11]  508 	push	hl
   4ECF CD 7D 4C      [17]  509 	call	_setBit
   4ED2 21 06 00      [10]  510 	ld	hl,#6
   4ED5 39            [11]  511 	add	hl,sp
   4ED6 F9            [ 6]  512 	ld	sp,hl
   4ED7 18 17         [12]  513 	jr	00110$
   4ED9                     514 00109$:
                            515 ;src/pathfinding.c:103: setBit(sol_matriz, ((y-ORIGEN_MAPA_Y)+2) * 40*2 + x, 1);
   4ED9 21 01 00      [10]  516 	ld	hl,#0x0001
   4EDC E5            [11]  517 	push	hl
   4EDD DD 6E E4      [19]  518 	ld	l,-28 (ix)
   4EE0 DD 66 E5      [19]  519 	ld	h,-27 (ix)
   4EE3 E5            [11]  520 	push	hl
   4EE4 21 ED 69      [10]  521 	ld	hl,#_sol_matriz
   4EE7 E5            [11]  522 	push	hl
   4EE8 CD 7D 4C      [17]  523 	call	_setBit
   4EEB 21 06 00      [10]  524 	ld	hl,#6
   4EEE 39            [11]  525 	add	hl,sp
   4EEF F9            [ 6]  526 	ld	sp,hl
   4EF0                     527 00110$:
                            528 ;src/pathfinding.c:106: if(x < f_x)
   4EF0 DD 7E 04      [19]  529 	ld	a,4 (ix)
   4EF3 DD 96 08      [19]  530 	sub	a, 8 (ix)
   4EF6 30 08         [12]  531 	jr	NC,00112$
                            532 ;src/pathfinding.c:107: heu_derecha = -1;
   4EF8 DD 36 D6 FF   [19]  533 	ld	-42 (ix),#0xFF
   4EFC DD 36 D7 FF   [19]  534 	ld	-41 (ix),#0xFF
   4F00                     535 00112$:
                            536 ;src/pathfinding.c:108: if(x > f_x)
   4F00 DD 7E 08      [19]  537 	ld	a,8 (ix)
   4F03 DD 96 04      [19]  538 	sub	a, 4 (ix)
   4F06 30 62         [12]  539 	jr	NC,00131$
                            540 ;src/pathfinding.c:109: heu_izquierda = -1;
   4F08 DD 36 DC FF   [19]  541 	ld	-36 (ix),#0xFF
   4F0C DD 36 DD FF   [19]  542 	ld	-35 (ix),#0xFF
   4F10 18 58         [12]  543 	jr	00131$
   4F12                     544 00127$:
                            545 ;src/pathfinding.c:115: if(s_y < f_y)
   4F12 DD 7E 07      [19]  546 	ld	a,7 (ix)
   4F15 DD 96 09      [19]  547 	sub	a, 9 (ix)
   4F18 3E 00         [ 7]  548 	ld	a,#0x00
   4F1A 17            [ 4]  549 	rla
   4F1B 4F            [ 4]  550 	ld	c,a
                            551 ;src/pathfinding.c:114: if(s_x < f_x){
   4F1C DD 7E 06      [19]  552 	ld	a,6 (ix)
   4F1F DD 96 08      [19]  553 	sub	a, 8 (ix)
   4F22 30 20         [12]  554 	jr	NC,00124$
                            555 ;src/pathfinding.c:115: if(s_y < f_y)
   4F24 79            [ 4]  556 	ld	a,c
   4F25 B7            [ 4]  557 	or	a, a
   4F26 28 0A         [12]  558 	jr	Z,00116$
                            559 ;src/pathfinding.c:116: heu_abajo = -1;
   4F28 DD 36 D2 FF   [19]  560 	ld	-46 (ix),#0xFF
   4F2C DD 36 D3 FF   [19]  561 	ld	-45 (ix),#0xFF
   4F30 18 08         [12]  562 	jr	00117$
   4F32                     563 00116$:
                            564 ;src/pathfinding.c:118: heu_arriba = -1;
   4F32 DD 36 DA FF   [19]  565 	ld	-38 (ix),#0xFF
   4F36 DD 36 DB FF   [19]  566 	ld	-37 (ix),#0xFF
   4F3A                     567 00117$:
                            568 ;src/pathfinding.c:120: heu_derecha = -1;
   4F3A DD 36 D6 FF   [19]  569 	ld	-42 (ix),#0xFF
   4F3E DD 36 D7 FF   [19]  570 	ld	-41 (ix),#0xFF
   4F42 18 26         [12]  571 	jr	00131$
   4F44                     572 00124$:
                            573 ;src/pathfinding.c:121: }else if(s_x > f_x){
   4F44 DD 7E 08      [19]  574 	ld	a,8 (ix)
   4F47 DD 96 06      [19]  575 	sub	a, 6 (ix)
   4F4A 30 1E         [12]  576 	jr	NC,00131$
                            577 ;src/pathfinding.c:123: if(s_y < f_y)
   4F4C 79            [ 4]  578 	ld	a,c
   4F4D B7            [ 4]  579 	or	a, a
   4F4E 28 0A         [12]  580 	jr	Z,00119$
                            581 ;src/pathfinding.c:124: heu_abajo = -1;
   4F50 DD 36 D2 FF   [19]  582 	ld	-46 (ix),#0xFF
   4F54 DD 36 D3 FF   [19]  583 	ld	-45 (ix),#0xFF
   4F58 18 08         [12]  584 	jr	00120$
   4F5A                     585 00119$:
                            586 ;src/pathfinding.c:126: heu_arriba = -1;
   4F5A DD 36 DA FF   [19]  587 	ld	-38 (ix),#0xFF
   4F5E DD 36 DB FF   [19]  588 	ld	-37 (ix),#0xFF
   4F62                     589 00120$:
                            590 ;src/pathfinding.c:128: heu_izquierda = -1;
   4F62 DD 36 DC FF   [19]  591 	ld	-36 (ix),#0xFF
   4F66 DD 36 DD FF   [19]  592 	ld	-35 (ix),#0xFF
   4F6A                     593 00131$:
                            594 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   4F6A DD 7E FA      [19]  595 	ld	a,-6 (ix)
   4F6D DD 77 E8      [19]  596 	ld	-24 (ix),a
   4F70 DD 7E FB      [19]  597 	ld	a,-5 (ix)
   4F73 DD 77 E9      [19]  598 	ld	-23 (ix),a
   4F76 DD CB FB 7E   [20]  599 	bit	7, -5 (ix)
   4F7A 28 10         [12]  600 	jr	Z,00176$
   4F7C DD 7E FC      [19]  601 	ld	a,-4 (ix)
   4F7F C6 E9         [ 7]  602 	add	a, #0xE9
   4F81 DD 77 E8      [19]  603 	ld	-24 (ix),a
   4F84 DD 7E FD      [19]  604 	ld	a,-3 (ix)
   4F87 CE FF         [ 7]  605 	adc	a, #0xFF
   4F89 DD 77 E9      [19]  606 	ld	-23 (ix),a
   4F8C                     607 00176$:
   4F8C DD CB E9 2E   [23]  608 	sra	-23 (ix)
   4F90 DD CB E8 1E   [23]  609 	rr	-24 (ix)
   4F94 DD CB E9 2E   [23]  610 	sra	-23 (ix)
   4F98 DD CB E8 1E   [23]  611 	rr	-24 (ix)
   4F9C DD 4E E8      [19]  612 	ld	c,-24 (ix)
   4F9F DD 46 E9      [19]  613 	ld	b,-23 (ix)
   4FA2 69            [ 4]  614 	ld	l, c
   4FA3 60            [ 4]  615 	ld	h, b
   4FA4 29            [11]  616 	add	hl, hl
   4FA5 29            [11]  617 	add	hl, hl
   4FA6 09            [11]  618 	add	hl, bc
   4FA7 29            [11]  619 	add	hl, hl
   4FA8 29            [11]  620 	add	hl, hl
   4FA9 29            [11]  621 	add	hl, hl
   4FAA DD 75 E8      [19]  622 	ld	-24 (ix),l
   4FAD DD 74 E9      [19]  623 	ld	-23 (ix),h
   4FB0 DD 7E 0A      [19]  624 	ld	a,10 (ix)
   4FB3 DD 86 E8      [19]  625 	add	a, -24 (ix)
   4FB6 DD 77 E8      [19]  626 	ld	-24 (ix),a
   4FB9 DD 7E 0B      [19]  627 	ld	a,11 (ix)
   4FBC DD 8E E9      [19]  628 	adc	a, -23 (ix)
   4FBF DD 77 E9      [19]  629 	ld	-23 (ix),a
   4FC2 DD 7E 04      [19]  630 	ld	a,4 (ix)
   4FC5 CB 3F         [ 8]  631 	srl	a
   4FC7 DD 77 FA      [19]  632 	ld	-6 (ix), a
   4FCA DD 86 E8      [19]  633 	add	a, -24 (ix)
   4FCD DD 77 E8      [19]  634 	ld	-24 (ix),a
   4FD0 3E 00         [ 7]  635 	ld	a,#0x00
   4FD2 DD 8E E9      [19]  636 	adc	a, -23 (ix)
   4FD5 DD 77 E9      [19]  637 	ld	-23 (ix),a
   4FD8 DD 6E E8      [19]  638 	ld	l,-24 (ix)
   4FDB DD 66 E9      [19]  639 	ld	h,-23 (ix)
   4FDE 7E            [ 7]  640 	ld	a,(hl)
   4FDF DD 77 E8      [19]  641 	ld	-24 (ix),a
                            642 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   4FE2 DD 7E 08      [19]  643 	ld	a,8 (ix)
   4FE5 DD 77 F0      [19]  644 	ld	-16 (ix),a
   4FE8 DD 36 F1 00   [19]  645 	ld	-15 (ix),#0x00
   4FEC DD 7E 09      [19]  646 	ld	a,9 (ix)
   4FEF DD 77 FE      [19]  647 	ld	-2 (ix),a
   4FF2 DD 36 FF 00   [19]  648 	ld	-1 (ix),#0x00
   4FF6 DD 7E F0      [19]  649 	ld	a,-16 (ix)
   4FF9 DD 96 EA      [19]  650 	sub	a, -22 (ix)
   4FFC DD 77 EE      [19]  651 	ld	-18 (ix),a
   4FFF DD 7E F1      [19]  652 	ld	a,-15 (ix)
   5002 DD 9E EB      [19]  653 	sbc	a, -21 (ix)
   5005 DD 77 EF      [19]  654 	ld	-17 (ix),a
                            655 ;src/pathfinding.c:133: if(  *(matriz + (( (y - 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y-2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   5008 3E 02         [ 7]  656 	ld	a,#0x02
   500A DD 96 E8      [19]  657 	sub	a, -24 (ix)
   500D DA 9B 50      [10]  658 	jp	C,00133$
   5010 DD 6E F2      [19]  659 	ld	l,-14 (ix)
   5013 DD 66 F3      [19]  660 	ld	h,-13 (ix)
   5016 E5            [11]  661 	push	hl
   5017 21 ED 69      [10]  662 	ld	hl,#_sol_matriz
   501A E5            [11]  663 	push	hl
   501B CD 32 4C      [17]  664 	call	_getBit
   501E F1            [10]  665 	pop	af
   501F F1            [10]  666 	pop	af
   5020 2D            [ 4]  667 	dec	l
   5021 28 78         [12]  668 	jr	Z,00133$
                            669 ;src/pathfinding.c:134: dist1 = abs(f_x - x) + abs(f_y - (y-2)) + heu_arriba;
   5023 DD 6E EE      [19]  670 	ld	l,-18 (ix)
   5026 DD 66 EF      [19]  671 	ld	h,-17 (ix)
   5029 E5            [11]  672 	push	hl
   502A CD E2 4B      [17]  673 	call	_abs
   502D F1            [10]  674 	pop	af
   502E DD 74 E9      [19]  675 	ld	-23 (ix),h
   5031 DD 75 E8      [19]  676 	ld	-24 (ix),l
   5034 DD 7E FC      [19]  677 	ld	a,-4 (ix)
   5037 C6 FE         [ 7]  678 	add	a,#0xFE
   5039 DD 77 F2      [19]  679 	ld	-14 (ix),a
   503C DD 7E FD      [19]  680 	ld	a,-3 (ix)
   503F CE FF         [ 7]  681 	adc	a,#0xFF
   5041 DD 77 F3      [19]  682 	ld	-13 (ix),a
   5044 DD 7E FE      [19]  683 	ld	a,-2 (ix)
   5047 DD 96 F2      [19]  684 	sub	a, -14 (ix)
   504A DD 77 F2      [19]  685 	ld	-14 (ix),a
   504D DD 7E FF      [19]  686 	ld	a,-1 (ix)
   5050 DD 9E F3      [19]  687 	sbc	a, -13 (ix)
   5053 DD 77 F3      [19]  688 	ld	-13 (ix),a
   5056 DD 6E F2      [19]  689 	ld	l,-14 (ix)
   5059 DD 66 F3      [19]  690 	ld	h,-13 (ix)
   505C E5            [11]  691 	push	hl
   505D CD E2 4B      [17]  692 	call	_abs
   5060 F1            [10]  693 	pop	af
   5061 DD 74 F3      [19]  694 	ld	-13 (ix),h
   5064 DD 75 F2      [19]  695 	ld	-14 (ix),l
   5067 DD 7E E8      [19]  696 	ld	a,-24 (ix)
   506A DD 86 F2      [19]  697 	add	a, -14 (ix)
   506D DD 77 E8      [19]  698 	ld	-24 (ix),a
   5070 DD 7E E9      [19]  699 	ld	a,-23 (ix)
   5073 DD 8E F3      [19]  700 	adc	a, -13 (ix)
   5076 DD 77 E9      [19]  701 	ld	-23 (ix),a
   5079 DD 7E E8      [19]  702 	ld	a,-24 (ix)
   507C DD 86 DA      [19]  703 	add	a, -38 (ix)
   507F DD 77 E8      [19]  704 	ld	-24 (ix),a
   5082 DD 7E E9      [19]  705 	ld	a,-23 (ix)
   5085 DD 8E DB      [19]  706 	adc	a, -37 (ix)
   5088 DD 77 E9      [19]  707 	ld	-23 (ix),a
   508B DD 7E E8      [19]  708 	ld	a,-24 (ix)
   508E DD 77 D8      [19]  709 	ld	-40 (ix),a
   5091 DD 7E E9      [19]  710 	ld	a,-23 (ix)
   5094 DD 77 D9      [19]  711 	ld	-39 (ix),a
                            712 ;src/pathfinding.c:135: resultado = 0;
   5097 DD 36 D1 00   [19]  713 	ld	-47 (ix),#0x00
   509B                     714 00133$:
                            715 ;src/pathfinding.c:138: if(  *(matriz + (( (y + 2) - ORIGEN_MAPA_Y)/4)*40 + x/2) <=2 && getBit(sol_matriz, ((y+2)-ORIGEN_MAPA_Y) * 40*2 + x) != 1){
   509B DD 7E F6      [19]  716 	ld	a,-10 (ix)
   509E DD 77 E8      [19]  717 	ld	-24 (ix),a
   50A1 DD 7E F7      [19]  718 	ld	a,-9 (ix)
   50A4 DD 77 E9      [19]  719 	ld	-23 (ix),a
   50A7 DD CB F7 7E   [20]  720 	bit	7, -9 (ix)
   50AB 28 10         [12]  721 	jr	Z,00177$
   50AD DD 7E FC      [19]  722 	ld	a,-4 (ix)
   50B0 C6 ED         [ 7]  723 	add	a, #0xED
   50B2 DD 77 E8      [19]  724 	ld	-24 (ix),a
   50B5 DD 7E FD      [19]  725 	ld	a,-3 (ix)
   50B8 CE FF         [ 7]  726 	adc	a, #0xFF
   50BA DD 77 E9      [19]  727 	ld	-23 (ix),a
   50BD                     728 00177$:
   50BD DD CB E9 2E   [23]  729 	sra	-23 (ix)
   50C1 DD CB E8 1E   [23]  730 	rr	-24 (ix)
   50C5 DD CB E9 2E   [23]  731 	sra	-23 (ix)
   50C9 DD CB E8 1E   [23]  732 	rr	-24 (ix)
   50CD DD 4E E8      [19]  733 	ld	c,-24 (ix)
   50D0 DD 46 E9      [19]  734 	ld	b,-23 (ix)
   50D3 69            [ 4]  735 	ld	l, c
   50D4 60            [ 4]  736 	ld	h, b
   50D5 29            [11]  737 	add	hl, hl
   50D6 29            [11]  738 	add	hl, hl
   50D7 09            [11]  739 	add	hl, bc
   50D8 29            [11]  740 	add	hl, hl
   50D9 29            [11]  741 	add	hl, hl
   50DA 29            [11]  742 	add	hl, hl
   50DB DD 75 E8      [19]  743 	ld	-24 (ix),l
   50DE DD 74 E9      [19]  744 	ld	-23 (ix),h
   50E1 DD 7E 0A      [19]  745 	ld	a,10 (ix)
   50E4 DD 86 E8      [19]  746 	add	a, -24 (ix)
   50E7 DD 77 E8      [19]  747 	ld	-24 (ix),a
   50EA DD 7E 0B      [19]  748 	ld	a,11 (ix)
   50ED DD 8E E9      [19]  749 	adc	a, -23 (ix)
   50F0 DD 77 E9      [19]  750 	ld	-23 (ix),a
   50F3 DD 7E E8      [19]  751 	ld	a,-24 (ix)
   50F6 DD 86 FA      [19]  752 	add	a, -6 (ix)
   50F9 DD 77 E8      [19]  753 	ld	-24 (ix),a
   50FC DD 7E E9      [19]  754 	ld	a,-23 (ix)
   50FF CE 00         [ 7]  755 	adc	a, #0x00
   5101 DD 77 E9      [19]  756 	ld	-23 (ix),a
   5104 DD 6E E8      [19]  757 	ld	l,-24 (ix)
   5107 DD 66 E9      [19]  758 	ld	h,-23 (ix)
   510A 7E            [ 7]  759 	ld	a,(hl)
   510B DD 77 E8      [19]  760 	ld	-24 (ix),a
   510E 3E 02         [ 7]  761 	ld	a,#0x02
   5110 DD 96 E8      [19]  762 	sub	a, -24 (ix)
   5113 DA C2 51      [10]  763 	jp	C,00141$
   5116 DD 6E E4      [19]  764 	ld	l,-28 (ix)
   5119 DD 66 E5      [19]  765 	ld	h,-27 (ix)
   511C E5            [11]  766 	push	hl
   511D 21 ED 69      [10]  767 	ld	hl,#_sol_matriz
   5120 E5            [11]  768 	push	hl
   5121 CD 32 4C      [17]  769 	call	_getBit
   5124 F1            [10]  770 	pop	af
   5125 F1            [10]  771 	pop	af
   5126 2D            [ 4]  772 	dec	l
   5127 CA C2 51      [10]  773 	jp	Z,00141$
                            774 ;src/pathfinding.c:139: dist2 = abs(f_x - x) + abs(f_y - (y+2)) + heu_abajo;
   512A DD 6E EE      [19]  775 	ld	l,-18 (ix)
   512D DD 66 EF      [19]  776 	ld	h,-17 (ix)
   5130 E5            [11]  777 	push	hl
   5131 CD E2 4B      [17]  778 	call	_abs
   5134 F1            [10]  779 	pop	af
   5135 DD 74 EF      [19]  780 	ld	-17 (ix),h
   5138 DD 75 EE      [19]  781 	ld	-18 (ix),l
   513B DD 7E FC      [19]  782 	ld	a,-4 (ix)
   513E C6 02         [ 7]  783 	add	a, #0x02
   5140 DD 77 E8      [19]  784 	ld	-24 (ix),a
   5143 DD 7E FD      [19]  785 	ld	a,-3 (ix)
   5146 CE 00         [ 7]  786 	adc	a, #0x00
   5148 DD 77 E9      [19]  787 	ld	-23 (ix),a
   514B DD 7E FE      [19]  788 	ld	a,-2 (ix)
   514E DD 96 E8      [19]  789 	sub	a, -24 (ix)
   5151 DD 77 E8      [19]  790 	ld	-24 (ix),a
   5154 DD 7E FF      [19]  791 	ld	a,-1 (ix)
   5157 DD 9E E9      [19]  792 	sbc	a, -23 (ix)
   515A DD 77 E9      [19]  793 	ld	-23 (ix),a
   515D DD 6E E8      [19]  794 	ld	l,-24 (ix)
   5160 DD 66 E9      [19]  795 	ld	h,-23 (ix)
   5163 E5            [11]  796 	push	hl
   5164 CD E2 4B      [17]  797 	call	_abs
   5167 F1            [10]  798 	pop	af
   5168 DD 74 E9      [19]  799 	ld	-23 (ix),h
   516B DD 75 E8      [19]  800 	ld	-24 (ix),l
   516E DD 7E EE      [19]  801 	ld	a,-18 (ix)
   5171 DD 86 E8      [19]  802 	add	a, -24 (ix)
   5174 DD 77 EE      [19]  803 	ld	-18 (ix),a
   5177 DD 7E EF      [19]  804 	ld	a,-17 (ix)
   517A DD 8E E9      [19]  805 	adc	a, -23 (ix)
   517D DD 77 EF      [19]  806 	ld	-17 (ix),a
   5180 DD 7E D2      [19]  807 	ld	a,-46 (ix)
   5183 DD 86 EE      [19]  808 	add	a, -18 (ix)
   5186 DD 77 EE      [19]  809 	ld	-18 (ix),a
   5189 DD 7E D3      [19]  810 	ld	a,-45 (ix)
   518C DD 8E EF      [19]  811 	adc	a, -17 (ix)
   518F DD 77 EF      [19]  812 	ld	-17 (ix),a
   5192 DD 7E EE      [19]  813 	ld	a,-18 (ix)
   5195 DD 77 D4      [19]  814 	ld	-44 (ix),a
   5198 DD 7E EF      [19]  815 	ld	a,-17 (ix)
   519B DD 77 D5      [19]  816 	ld	-43 (ix),a
                            817 ;src/pathfinding.c:140: if(resultado == 0){
   519E DD 7E D1      [19]  818 	ld	a,-47 (ix)
   51A1 B7            [ 4]  819 	or	a, a
   51A2 20 1A         [12]  820 	jr	NZ,00138$
                            821 ;src/pathfinding.c:141: if(dist1 > dist2)
   51A4 DD 7E D4      [19]  822 	ld	a,-44 (ix)
   51A7 DD 96 D8      [19]  823 	sub	a, -40 (ix)
   51AA DD 7E D5      [19]  824 	ld	a,-43 (ix)
   51AD DD 9E D9      [19]  825 	sbc	a, -39 (ix)
   51B0 E2 B5 51      [10]  826 	jp	PO, 00340$
   51B3 EE 80         [ 7]  827 	xor	a, #0x80
   51B5                     828 00340$:
   51B5 F2 C2 51      [10]  829 	jp	P,00141$
                            830 ;src/pathfinding.c:142: resultado = 1;	
   51B8 DD 36 D1 01   [19]  831 	ld	-47 (ix),#0x01
   51BC 18 04         [12]  832 	jr	00141$
   51BE                     833 00138$:
                            834 ;src/pathfinding.c:144: resultado = 1;
   51BE DD 36 D1 01   [19]  835 	ld	-47 (ix),#0x01
   51C2                     836 00141$:
                            837 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   51C2 DD 7E F8      [19]  838 	ld	a,-8 (ix)
   51C5 DD 77 EE      [19]  839 	ld	-18 (ix),a
   51C8 DD 7E F9      [19]  840 	ld	a,-7 (ix)
   51CB DD 77 EF      [19]  841 	ld	-17 (ix),a
   51CE DD 7E F9      [19]  842 	ld	a,-7 (ix)
   51D1 07            [ 4]  843 	rlca
   51D2 E6 01         [ 7]  844 	and	a,#0x01
   51D4 DD 77 E8      [19]  845 	ld	-24 (ix),a
   51D7 DD 7E FC      [19]  846 	ld	a,-4 (ix)
   51DA C6 EB         [ 7]  847 	add	a, #0xEB
   51DC DD 77 E4      [19]  848 	ld	-28 (ix),a
   51DF DD 7E FD      [19]  849 	ld	a,-3 (ix)
   51E2 CE FF         [ 7]  850 	adc	a, #0xFF
   51E4 DD 77 E5      [19]  851 	ld	-27 (ix),a
   51E7 DD 7E E8      [19]  852 	ld	a,-24 (ix)
   51EA B7            [ 4]  853 	or	a, a
   51EB 28 0C         [12]  854 	jr	Z,00178$
   51ED DD 7E E4      [19]  855 	ld	a,-28 (ix)
   51F0 DD 77 EE      [19]  856 	ld	-18 (ix),a
   51F3 DD 7E E5      [19]  857 	ld	a,-27 (ix)
   51F6 DD 77 EF      [19]  858 	ld	-17 (ix),a
   51F9                     859 00178$:
   51F9 DD CB EF 2E   [23]  860 	sra	-17 (ix)
   51FD DD CB EE 1E   [23]  861 	rr	-18 (ix)
   5201 DD CB EF 2E   [23]  862 	sra	-17 (ix)
   5205 DD CB EE 1E   [23]  863 	rr	-18 (ix)
   5209 DD 4E EE      [19]  864 	ld	c,-18 (ix)
   520C DD 46 EF      [19]  865 	ld	b,-17 (ix)
   520F 69            [ 4]  866 	ld	l, c
   5210 60            [ 4]  867 	ld	h, b
   5211 29            [11]  868 	add	hl, hl
   5212 29            [11]  869 	add	hl, hl
   5213 09            [11]  870 	add	hl, bc
   5214 29            [11]  871 	add	hl, hl
   5215 29            [11]  872 	add	hl, hl
   5216 29            [11]  873 	add	hl, hl
   5217 DD 75 EE      [19]  874 	ld	-18 (ix),l
   521A DD 74 EF      [19]  875 	ld	-17 (ix),h
   521D DD 7E 0A      [19]  876 	ld	a,10 (ix)
   5220 DD 86 EE      [19]  877 	add	a, -18 (ix)
   5223 DD 77 EE      [19]  878 	ld	-18 (ix),a
   5226 DD 7E 0B      [19]  879 	ld	a,11 (ix)
   5229 DD 8E EF      [19]  880 	adc	a, -17 (ix)
   522C DD 77 EF      [19]  881 	ld	-17 (ix),a
   522F DD 7E F4      [19]  882 	ld	a,-12 (ix)
   5232 DD 77 F2      [19]  883 	ld	-14 (ix),a
   5235 DD 7E F5      [19]  884 	ld	a,-11 (ix)
   5238 DD 77 F3      [19]  885 	ld	-13 (ix),a
   523B DD CB F5 7E   [20]  886 	bit	7, -11 (ix)
   523F 28 0C         [12]  887 	jr	Z,00179$
   5241 DD 7E EA      [19]  888 	ld	a,-22 (ix)
   5244 DD 77 F2      [19]  889 	ld	-14 (ix),a
   5247 DD 7E EB      [19]  890 	ld	a,-21 (ix)
   524A DD 77 F3      [19]  891 	ld	-13 (ix),a
   524D                     892 00179$:
   524D DD CB F3 2E   [23]  893 	sra	-13 (ix)
   5251 DD CB F2 1E   [23]  894 	rr	-14 (ix)
   5255 DD 7E EE      [19]  895 	ld	a,-18 (ix)
   5258 DD 86 F2      [19]  896 	add	a, -14 (ix)
   525B DD 77 EE      [19]  897 	ld	-18 (ix),a
   525E DD 7E EF      [19]  898 	ld	a,-17 (ix)
   5261 DD 8E F3      [19]  899 	adc	a, -13 (ix)
   5264 DD 77 EF      [19]  900 	ld	-17 (ix),a
   5267 DD 6E EE      [19]  901 	ld	l,-18 (ix)
   526A DD 66 EF      [19]  902 	ld	h,-17 (ix)
   526D 7E            [ 7]  903 	ld	a,(hl)
   526E DD 77 EE      [19]  904 	ld	-18 (ix),a
                            905 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   5271 DD 7E FE      [19]  906 	ld	a,-2 (ix)
   5274 DD 96 FC      [19]  907 	sub	a, -4 (ix)
   5277 DD 77 FE      [19]  908 	ld	-2 (ix),a
   527A DD 7E FF      [19]  909 	ld	a,-1 (ix)
   527D DD 9E FD      [19]  910 	sbc	a, -3 (ix)
   5280 DD 77 FF      [19]  911 	ld	-1 (ix),a
                            912 ;src/pathfinding.c:148: if(  *(matriz + ((y-ORIGEN_MAPA_Y)/4)*40 + (x-1)/2) <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x-1)) != 1){
   5283 3E 02         [ 7]  913 	ld	a,#0x02
   5285 DD 96 EE      [19]  914 	sub	a, -18 (ix)
   5288 DA 41 53      [10]  915 	jp	C,00154$
   528B DD 6E E2      [19]  916 	ld	l,-30 (ix)
   528E DD 66 E3      [19]  917 	ld	h,-29 (ix)
   5291 E5            [11]  918 	push	hl
   5292 21 ED 69      [10]  919 	ld	hl,#_sol_matriz
   5295 E5            [11]  920 	push	hl
   5296 CD 32 4C      [17]  921 	call	_getBit
   5299 F1            [10]  922 	pop	af
   529A F1            [10]  923 	pop	af
   529B DD 75 EE      [19]  924 	ld	-18 (ix), l
   529E 7D            [ 4]  925 	ld	a, l
   529F 3D            [ 4]  926 	dec	a
   52A0 CA 41 53      [10]  927 	jp	Z,00154$
                            928 ;src/pathfinding.c:149: dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
   52A3 DD 7E F0      [19]  929 	ld	a,-16 (ix)
   52A6 DD 96 F4      [19]  930 	sub	a, -12 (ix)
   52A9 4F            [ 4]  931 	ld	c,a
   52AA DD 7E F1      [19]  932 	ld	a,-15 (ix)
   52AD DD 9E F5      [19]  933 	sbc	a, -11 (ix)
   52B0 47            [ 4]  934 	ld	b,a
   52B1 C5            [11]  935 	push	bc
   52B2 CD E2 4B      [17]  936 	call	_abs
   52B5 F1            [10]  937 	pop	af
   52B6 DD 74 EF      [19]  938 	ld	-17 (ix),h
   52B9 DD 75 EE      [19]  939 	ld	-18 (ix),l
   52BC DD 6E FE      [19]  940 	ld	l,-2 (ix)
   52BF DD 66 FF      [19]  941 	ld	h,-1 (ix)
   52C2 E5            [11]  942 	push	hl
   52C3 CD E2 4B      [17]  943 	call	_abs
   52C6 F1            [10]  944 	pop	af
   52C7 DD 74 F3      [19]  945 	ld	-13 (ix),h
   52CA DD 75 F2      [19]  946 	ld	-14 (ix),l
   52CD DD 7E EE      [19]  947 	ld	a,-18 (ix)
   52D0 DD 86 F2      [19]  948 	add	a, -14 (ix)
   52D3 DD 77 EE      [19]  949 	ld	-18 (ix),a
   52D6 DD 7E EF      [19]  950 	ld	a,-17 (ix)
   52D9 DD 8E F3      [19]  951 	adc	a, -13 (ix)
   52DC DD 77 EF      [19]  952 	ld	-17 (ix),a
   52DF DD 7E DC      [19]  953 	ld	a,-36 (ix)
   52E2 DD 86 EE      [19]  954 	add	a, -18 (ix)
   52E5 DD 77 EE      [19]  955 	ld	-18 (ix),a
   52E8 DD 7E DD      [19]  956 	ld	a,-35 (ix)
   52EB DD 8E EF      [19]  957 	adc	a, -17 (ix)
   52EE DD 77 EF      [19]  958 	ld	-17 (ix),a
   52F1 DD 7E EE      [19]  959 	ld	a,-18 (ix)
   52F4 DD 77 E0      [19]  960 	ld	-32 (ix),a
   52F7 DD 7E EF      [19]  961 	ld	a,-17 (ix)
   52FA DD 77 E1      [19]  962 	ld	-31 (ix),a
                            963 ;src/pathfinding.c:150: if(resultado == 0){
   52FD DD 7E D1      [19]  964 	ld	a,-47 (ix)
   5300 B7            [ 4]  965 	or	a, a
   5301 20 1A         [12]  966 	jr	NZ,00151$
                            967 ;src/pathfinding.c:151: if(dist1 >= dist3)
   5303 DD 7E D8      [19]  968 	ld	a,-40 (ix)
   5306 DD 96 E0      [19]  969 	sub	a, -32 (ix)
   5309 DD 7E D9      [19]  970 	ld	a,-39 (ix)
   530C DD 9E E1      [19]  971 	sbc	a, -31 (ix)
   530F E2 14 53      [10]  972 	jp	PO, 00342$
   5312 EE 80         [ 7]  973 	xor	a, #0x80
   5314                     974 00342$:
   5314 FA 41 53      [10]  975 	jp	M,00154$
                            976 ;src/pathfinding.c:152: resultado = 2;
   5317 DD 36 D1 02   [19]  977 	ld	-47 (ix),#0x02
   531B 18 24         [12]  978 	jr	00154$
   531D                     979 00151$:
                            980 ;src/pathfinding.c:153: }else if(resultado == 1){
   531D DD 7E D1      [19]  981 	ld	a,-47 (ix)
   5320 3D            [ 4]  982 	dec	a
   5321 20 1A         [12]  983 	jr	NZ,00148$
                            984 ;src/pathfinding.c:154: if(dist2 >= dist3)
   5323 DD 7E D4      [19]  985 	ld	a,-44 (ix)
   5326 DD 96 E0      [19]  986 	sub	a, -32 (ix)
   5329 DD 7E D5      [19]  987 	ld	a,-43 (ix)
   532C DD 9E E1      [19]  988 	sbc	a, -31 (ix)
   532F E2 34 53      [10]  989 	jp	PO, 00345$
   5332 EE 80         [ 7]  990 	xor	a, #0x80
   5334                     991 00345$:
   5334 FA 41 53      [10]  992 	jp	M,00154$
                            993 ;src/pathfinding.c:155: resultado = 2;
   5337 DD 36 D1 02   [19]  994 	ld	-47 (ix),#0x02
   533B 18 04         [12]  995 	jr	00154$
   533D                     996 00148$:
                            997 ;src/pathfinding.c:157: resultado = 2;
   533D DD 36 D1 02   [19]  998 	ld	-47 (ix),#0x02
   5341                     999 00154$:
                           1000 ;src/pathfinding.c:161: if(  *(matriz + ((y - ORIGEN_MAPA_Y)/4)*40 + (x+1)/2)  <=2 && getBit(sol_matriz, (y-ORIGEN_MAPA_Y) * 40*2 + (x+1)) != 1){
   5341 DD 7E F8      [19] 1001 	ld	a,-8 (ix)
   5344 DD 77 EE      [19] 1002 	ld	-18 (ix),a
   5347 DD 7E F9      [19] 1003 	ld	a,-7 (ix)
   534A DD 77 EF      [19] 1004 	ld	-17 (ix),a
   534D DD 7E E8      [19] 1005 	ld	a,-24 (ix)
   5350 B7            [ 4] 1006 	or	a, a
   5351 28 0C         [12] 1007 	jr	Z,00180$
   5353 DD 7E E4      [19] 1008 	ld	a,-28 (ix)
   5356 DD 77 EE      [19] 1009 	ld	-18 (ix),a
   5359 DD 7E E5      [19] 1010 	ld	a,-27 (ix)
   535C DD 77 EF      [19] 1011 	ld	-17 (ix),a
   535F                    1012 00180$:
   535F DD CB EF 2E   [23] 1013 	sra	-17 (ix)
   5363 DD CB EE 1E   [23] 1014 	rr	-18 (ix)
   5367 DD CB EF 2E   [23] 1015 	sra	-17 (ix)
   536B DD CB EE 1E   [23] 1016 	rr	-18 (ix)
   536F DD 4E EE      [19] 1017 	ld	c,-18 (ix)
   5372 DD 46 EF      [19] 1018 	ld	b,-17 (ix)
   5375 69            [ 4] 1019 	ld	l, c
   5376 60            [ 4] 1020 	ld	h, b
   5377 29            [11] 1021 	add	hl, hl
   5378 29            [11] 1022 	add	hl, hl
   5379 09            [11] 1023 	add	hl, bc
   537A 29            [11] 1024 	add	hl, hl
   537B 29            [11] 1025 	add	hl, hl
   537C 29            [11] 1026 	add	hl, hl
   537D DD 75 EE      [19] 1027 	ld	-18 (ix),l
   5380 DD 74 EF      [19] 1028 	ld	-17 (ix),h
   5383 DD 7E 0A      [19] 1029 	ld	a,10 (ix)
   5386 DD 86 EE      [19] 1030 	add	a, -18 (ix)
   5389 DD 77 EE      [19] 1031 	ld	-18 (ix),a
   538C DD 7E 0B      [19] 1032 	ld	a,11 (ix)
   538F DD 8E EF      [19] 1033 	adc	a, -17 (ix)
   5392 DD 77 EF      [19] 1034 	ld	-17 (ix),a
   5395 DD 7E EC      [19] 1035 	ld	a,-20 (ix)
   5398 DD 77 E8      [19] 1036 	ld	-24 (ix),a
   539B DD 7E ED      [19] 1037 	ld	a,-19 (ix)
   539E DD 77 E9      [19] 1038 	ld	-23 (ix),a
   53A1 DD CB ED 7E   [20] 1039 	bit	7, -19 (ix)
   53A5 28 10         [12] 1040 	jr	Z,00181$
   53A7 DD 7E EA      [19] 1041 	ld	a,-22 (ix)
   53AA C6 02         [ 7] 1042 	add	a, #0x02
   53AC DD 77 E8      [19] 1043 	ld	-24 (ix),a
   53AF DD 7E EB      [19] 1044 	ld	a,-21 (ix)
   53B2 CE 00         [ 7] 1045 	adc	a, #0x00
   53B4 DD 77 E9      [19] 1046 	ld	-23 (ix),a
   53B7                    1047 00181$:
   53B7 DD CB E9 2E   [23] 1048 	sra	-23 (ix)
   53BB DD CB E8 1E   [23] 1049 	rr	-24 (ix)
   53BF DD 7E E8      [19] 1050 	ld	a,-24 (ix)
   53C2 DD 86 EE      [19] 1051 	add	a, -18 (ix)
   53C5 DD 77 EE      [19] 1052 	ld	-18 (ix),a
   53C8 DD 7E E9      [19] 1053 	ld	a,-23 (ix)
   53CB DD 8E EF      [19] 1054 	adc	a, -17 (ix)
   53CE DD 77 EF      [19] 1055 	ld	-17 (ix),a
   53D1 DD 6E EE      [19] 1056 	ld	l,-18 (ix)
   53D4 DD 66 EF      [19] 1057 	ld	h,-17 (ix)
   53D7 7E            [ 7] 1058 	ld	a,(hl)
   53D8 DD 77 EE      [19] 1059 	ld	-18 (ix),a
   53DB 3E 02         [ 7] 1060 	ld	a,#0x02
   53DD DD 96 EE      [19] 1061 	sub	a, -18 (ix)
   53E0 DA AA 54      [10] 1062 	jp	C,00172$
   53E3 DD 6E E6      [19] 1063 	ld	l,-26 (ix)
   53E6 DD 66 E7      [19] 1064 	ld	h,-25 (ix)
   53E9 E5            [11] 1065 	push	hl
   53EA 21 ED 69      [10] 1066 	ld	hl,#_sol_matriz
   53ED E5            [11] 1067 	push	hl
   53EE CD 32 4C      [17] 1068 	call	_getBit
   53F1 F1            [10] 1069 	pop	af
   53F2 F1            [10] 1070 	pop	af
   53F3 2D            [ 4] 1071 	dec	l
   53F4 CA AA 54      [10] 1072 	jp	Z,00172$
                           1073 ;src/pathfinding.c:162: dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
   53F7 DD 7E F0      [19] 1074 	ld	a,-16 (ix)
   53FA DD 96 EC      [19] 1075 	sub	a, -20 (ix)
   53FD 4F            [ 4] 1076 	ld	c,a
   53FE DD 7E F1      [19] 1077 	ld	a,-15 (ix)
   5401 DD 9E ED      [19] 1078 	sbc	a, -19 (ix)
   5404 47            [ 4] 1079 	ld	b,a
   5405 C5            [11] 1080 	push	bc
   5406 CD E2 4B      [17] 1081 	call	_abs
   5409 F1            [10] 1082 	pop	af
   540A DD 74 EF      [19] 1083 	ld	-17 (ix),h
   540D DD 75 EE      [19] 1084 	ld	-18 (ix),l
   5410 DD 6E FE      [19] 1085 	ld	l,-2 (ix)
   5413 DD 66 FF      [19] 1086 	ld	h,-1 (ix)
   5416 E5            [11] 1087 	push	hl
   5417 CD E2 4B      [17] 1088 	call	_abs
   541A F1            [10] 1089 	pop	af
   541B DD 74 FF      [19] 1090 	ld	-1 (ix),h
   541E DD 75 FE      [19] 1091 	ld	-2 (ix),l
   5421 DD 7E EE      [19] 1092 	ld	a,-18 (ix)
   5424 DD 86 FE      [19] 1093 	add	a, -2 (ix)
   5427 DD 77 EE      [19] 1094 	ld	-18 (ix),a
   542A DD 7E EF      [19] 1095 	ld	a,-17 (ix)
   542D DD 8E FF      [19] 1096 	adc	a, -1 (ix)
   5430 DD 77 EF      [19] 1097 	ld	-17 (ix),a
   5433 DD 7E EE      [19] 1098 	ld	a,-18 (ix)
   5436 DD 86 D6      [19] 1099 	add	a, -42 (ix)
   5439 DD 77 DE      [19] 1100 	ld	-34 (ix),a
   543C DD 7E EF      [19] 1101 	ld	a,-17 (ix)
   543F DD 8E D7      [19] 1102 	adc	a, -41 (ix)
   5442 DD 77 DF      [19] 1103 	ld	-33 (ix),a
                           1104 ;src/pathfinding.c:163: if(resultado == 0){
   5445 DD 7E D1      [19] 1105 	ld	a,-47 (ix)
   5448 B7            [ 4] 1106 	or	a, a
   5449 20 1A         [12] 1107 	jr	NZ,00169$
                           1108 ;src/pathfinding.c:164: if(dist1 >= dist4)
   544B DD 7E D8      [19] 1109 	ld	a,-40 (ix)
   544E DD 96 DE      [19] 1110 	sub	a, -34 (ix)
   5451 DD 7E D9      [19] 1111 	ld	a,-39 (ix)
   5454 DD 9E DF      [19] 1112 	sbc	a, -33 (ix)
   5457 E2 5C 54      [10] 1113 	jp	PO, 00347$
   545A EE 80         [ 7] 1114 	xor	a, #0x80
   545C                    1115 00347$:
   545C FA AA 54      [10] 1116 	jp	M,00172$
                           1117 ;src/pathfinding.c:165: resultado = 3;
   545F DD 36 D1 03   [19] 1118 	ld	-47 (ix),#0x03
   5463 18 45         [12] 1119 	jr	00172$
   5465                    1120 00169$:
                           1121 ;src/pathfinding.c:166: }else if(resultado == 1){
   5465 DD 7E D1      [19] 1122 	ld	a,-47 (ix)
   5468 3D            [ 4] 1123 	dec	a
   5469 20 1A         [12] 1124 	jr	NZ,00166$
                           1125 ;src/pathfinding.c:167: if(dist2 >= dist4)
   546B DD 7E D4      [19] 1126 	ld	a,-44 (ix)
   546E DD 96 DE      [19] 1127 	sub	a, -34 (ix)
   5471 DD 7E D5      [19] 1128 	ld	a,-43 (ix)
   5474 DD 9E DF      [19] 1129 	sbc	a, -33 (ix)
   5477 E2 7C 54      [10] 1130 	jp	PO, 00350$
   547A EE 80         [ 7] 1131 	xor	a, #0x80
   547C                    1132 00350$:
   547C FA AA 54      [10] 1133 	jp	M,00172$
                           1134 ;src/pathfinding.c:168: resultado = 3;
   547F DD 36 D1 03   [19] 1135 	ld	-47 (ix),#0x03
   5483 18 25         [12] 1136 	jr	00172$
   5485                    1137 00166$:
                           1138 ;src/pathfinding.c:169: }else if (resultado == 2){
   5485 DD 7E D1      [19] 1139 	ld	a,-47 (ix)
   5488 D6 02         [ 7] 1140 	sub	a, #0x02
   548A 20 1A         [12] 1141 	jr	NZ,00163$
                           1142 ;src/pathfinding.c:170: if(dist3 >= dist4)
   548C DD 7E E0      [19] 1143 	ld	a,-32 (ix)
   548F DD 96 DE      [19] 1144 	sub	a, -34 (ix)
   5492 DD 7E E1      [19] 1145 	ld	a,-31 (ix)
   5495 DD 9E DF      [19] 1146 	sbc	a, -33 (ix)
   5498 E2 9D 54      [10] 1147 	jp	PO, 00353$
   549B EE 80         [ 7] 1148 	xor	a, #0x80
   549D                    1149 00353$:
   549D FA AA 54      [10] 1150 	jp	M,00172$
                           1151 ;src/pathfinding.c:171: resultado = 3;
   54A0 DD 36 D1 03   [19] 1152 	ld	-47 (ix),#0x03
   54A4 18 04         [12] 1153 	jr	00172$
   54A6                    1154 00163$:
                           1155 ;src/pathfinding.c:173: resultado = 3;
   54A6 DD 36 D1 03   [19] 1156 	ld	-47 (ix),#0x03
   54AA                    1157 00172$:
                           1158 ;src/pathfinding.c:177: return resultado;
   54AA DD 6E D1      [19] 1159 	ld	l,-47 (ix)
   54AD DD F9         [10] 1160 	ld	sp, ix
   54AF DD E1         [14] 1161 	pop	ix
   54B1 C9            [10] 1162 	ret
                           1163 ;src/pathfinding.c:181: void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
                           1164 ;	---------------------------------
                           1165 ; Function pathFinding
                           1166 ; ---------------------------------
   54B2                    1167 _pathFinding::
   54B2 DD E5         [15] 1168 	push	ix
   54B4 DD 21 00 00   [14] 1169 	ld	ix,#0
   54B8 DD 39         [15] 1170 	add	ix,sp
   54BA 21 E9 FF      [10] 1171 	ld	hl,#-23
   54BD 39            [11] 1172 	add	hl,sp
   54BE F9            [ 6] 1173 	ld	sp,hl
                           1174 ;src/pathfinding.c:193: u16 down = ((y-ORIGEN_MAPA_Y)+2)*40*2 + x;
   54BF DD 4E EE      [19] 1175 	ld	c,-18 (ix)
   54C2 06 00         [ 7] 1176 	ld	b,#0x00
   54C4 21 EA FF      [10] 1177 	ld	hl,#0xFFEA
   54C7 09            [11] 1178 	add	hl,bc
   54C8 5D            [ 4] 1179 	ld	e, l
   54C9 54            [ 4] 1180 	ld	d, h
   54CA 29            [11] 1181 	add	hl, hl
   54CB 29            [11] 1182 	add	hl, hl
   54CC 19            [11] 1183 	add	hl, de
   54CD 29            [11] 1184 	add	hl, hl
   54CE 29            [11] 1185 	add	hl, hl
   54CF 29            [11] 1186 	add	hl, hl
   54D0 29            [11] 1187 	add	hl, hl
   54D1 DD 5E F2      [19] 1188 	ld	e,-14 (ix)
   54D4 16 00         [ 7] 1189 	ld	d,#0x00
   54D6 19            [11] 1190 	add	hl,de
   54D7 DD 75 EA      [19] 1191 	ld	-22 (ix),l
   54DA DD 74 EB      [19] 1192 	ld	-21 (ix),h
                           1193 ;src/pathfinding.c:194: u16 up = ((y-ORIGEN_MAPA_Y)-2)*40*2 + x;
   54DD 79            [ 4] 1194 	ld	a,c
   54DE C6 E6         [ 7] 1195 	add	a,#0xE6
   54E0 6F            [ 4] 1196 	ld	l,a
   54E1 78            [ 4] 1197 	ld	a,b
   54E2 CE FF         [ 7] 1198 	adc	a,#0xFF
   54E4 67            [ 4] 1199 	ld	h,a
   54E5 D5            [11] 1200 	push	de
   54E6 5D            [ 4] 1201 	ld	e, l
   54E7 54            [ 4] 1202 	ld	d, h
   54E8 29            [11] 1203 	add	hl, hl
   54E9 29            [11] 1204 	add	hl, hl
   54EA 19            [11] 1205 	add	hl, de
   54EB 29            [11] 1206 	add	hl, hl
   54EC 29            [11] 1207 	add	hl, hl
   54ED 29            [11] 1208 	add	hl, hl
   54EE 29            [11] 1209 	add	hl, hl
   54EF D1            [10] 1210 	pop	de
   54F0 19            [11] 1211 	add	hl,de
   54F1 DD 75 EF      [19] 1212 	ld	-17 (ix),l
   54F4 DD 74 F0      [19] 1213 	ld	-16 (ix),h
                           1214 ;src/pathfinding.c:195: u16 right = (y-ORIGEN_MAPA_Y) * 40*2 + (x+1);
   54F7 79            [ 4] 1215 	ld	a,c
   54F8 C6 E8         [ 7] 1216 	add	a,#0xE8
   54FA 4F            [ 4] 1217 	ld	c,a
   54FB 78            [ 4] 1218 	ld	a,b
   54FC CE FF         [ 7] 1219 	adc	a,#0xFF
   54FE 47            [ 4] 1220 	ld	b,a
   54FF 69            [ 4] 1221 	ld	l, c
   5500 60            [ 4] 1222 	ld	h, b
   5501 29            [11] 1223 	add	hl, hl
   5502 29            [11] 1224 	add	hl, hl
   5503 09            [11] 1225 	add	hl, bc
   5504 29            [11] 1226 	add	hl, hl
   5505 29            [11] 1227 	add	hl, hl
   5506 29            [11] 1228 	add	hl, hl
   5507 29            [11] 1229 	add	hl, hl
   5508 4D            [ 4] 1230 	ld	c,l
   5509 44            [ 4] 1231 	ld	b,h
   550A 6B            [ 4] 1232 	ld	l, e
   550B 62            [ 4] 1233 	ld	h, d
   550C 23            [ 6] 1234 	inc	hl
   550D 09            [11] 1235 	add	hl,bc
   550E DD 75 F3      [19] 1236 	ld	-13 (ix),l
   5511 DD 74 F4      [19] 1237 	ld	-12 (ix),h
                           1238 ;src/pathfinding.c:196: u16 left = (y-ORIGEN_MAPA_Y) * 40*2 + (x-1);
   5514 1B            [ 6] 1239 	dec	de
   5515 69            [ 4] 1240 	ld	l, c
   5516 60            [ 4] 1241 	ld	h, b
   5517 19            [11] 1242 	add	hl,de
   5518 DD 75 EC      [19] 1243 	ld	-20 (ix),l
   551B DD 74 ED      [19] 1244 	ld	-19 (ix),h
                           1245 ;src/pathfinding.c:198: u8 problem = 0;
   551E DD 36 F1 00   [19] 1246 	ld	-15 (ix),#0x00
                           1247 ;src/pathfinding.c:200: x = s_x;
   5522 DD 7E 04      [19] 1248 	ld	a,4 (ix)
   5525 DD 77 F2      [19] 1249 	ld	-14 (ix),a
                           1250 ;src/pathfinding.c:202: y = s_y;
   5528 DD 7E 05      [19] 1251 	ld	a,5 (ix)
   552B DD 77 EE      [19] 1252 	ld	-18 (ix),a
                           1253 ;src/pathfinding.c:204: k = 0;
   552E DD 36 F7 00   [19] 1254 	ld	-9 (ix),#0x00
                           1255 ;src/pathfinding.c:205: aux = 1;
   5532 DD 36 F6 01   [19] 1256 	ld	-10 (ix),#0x01
                           1257 ;src/pathfinding.c:208: memset(sol_matriz, 0, (40*2*44*4)/8);
   5536 21 ED 69      [10] 1258 	ld	hl,#_sol_matriz
   5539 36 00         [10] 1259 	ld	(hl), #0x00
   553B 5D            [ 4] 1260 	ld	e, l
   553C 54            [ 4] 1261 	ld	d, h
   553D 13            [ 6] 1262 	inc	de
   553E 01 DF 06      [10] 1263 	ld	bc, #0x06DF
   5541 ED B0         [21] 1264 	ldir
                           1265 ;src/pathfinding.c:209: enemy->longitud_camino = 0;
   5543 DD 7E 08      [19] 1266 	ld	a,8 (ix)
   5546 DD 77 F8      [19] 1267 	ld	-8 (ix),a
   5549 DD 7E 09      [19] 1268 	ld	a,9 (ix)
   554C DD 77 F9      [19] 1269 	ld	-7 (ix),a
   554F DD 7E F8      [19] 1270 	ld	a,-8 (ix)
   5552 C6 43         [ 7] 1271 	add	a, #0x43
   5554 DD 77 FC      [19] 1272 	ld	-4 (ix),a
   5557 DD 7E F9      [19] 1273 	ld	a,-7 (ix)
   555A CE 01         [ 7] 1274 	adc	a, #0x01
   555C DD 77 FD      [19] 1275 	ld	-3 (ix),a
   555F DD 6E FC      [19] 1276 	ld	l,-4 (ix)
   5562 DD 66 FD      [19] 1277 	ld	h,-3 (ix)
   5565 36 00         [10] 1278 	ld	(hl),#0x00
                           1279 ;src/pathfinding.c:210: sol_tam = 1;
   5567 21 EC 69      [10] 1280 	ld	hl,#_sol_tam + 0
   556A 36 01         [10] 1281 	ld	(hl), #0x01
                           1282 ;src/pathfinding.c:211: setBit(sol_matriz, (y-ORIGEN_MAPA_Y)*40*2 + x, 1);
   556C DD 7E EE      [19] 1283 	ld	a,-18 (ix)
   556F DD 77 FA      [19] 1284 	ld	-6 (ix),a
   5572 DD 36 FB 00   [19] 1285 	ld	-5 (ix),#0x00
   5576 DD 7E FA      [19] 1286 	ld	a,-6 (ix)
   5579 C6 E8         [ 7] 1287 	add	a,#0xE8
   557B DD 77 FA      [19] 1288 	ld	-6 (ix),a
   557E DD 7E FB      [19] 1289 	ld	a,-5 (ix)
   5581 CE FF         [ 7] 1290 	adc	a,#0xFF
   5583 DD 77 FB      [19] 1291 	ld	-5 (ix),a
   5586 DD 4E FA      [19] 1292 	ld	c,-6 (ix)
   5589 DD 46 FB      [19] 1293 	ld	b,-5 (ix)
   558C 69            [ 4] 1294 	ld	l, c
   558D 60            [ 4] 1295 	ld	h, b
   558E 29            [11] 1296 	add	hl, hl
   558F 29            [11] 1297 	add	hl, hl
   5590 09            [11] 1298 	add	hl, bc
   5591 29            [11] 1299 	add	hl, hl
   5592 29            [11] 1300 	add	hl, hl
   5593 29            [11] 1301 	add	hl, hl
   5594 29            [11] 1302 	add	hl, hl
   5595 DD 75 FA      [19] 1303 	ld	-6 (ix),l
   5598 DD 74 FB      [19] 1304 	ld	-5 (ix),h
   559B DD 7E F2      [19] 1305 	ld	a,-14 (ix)
   559E DD 77 FE      [19] 1306 	ld	-2 (ix),a
   55A1 DD 36 FF 00   [19] 1307 	ld	-1 (ix),#0x00
   55A5 DD 7E FA      [19] 1308 	ld	a,-6 (ix)
   55A8 DD 86 FE      [19] 1309 	add	a, -2 (ix)
   55AB DD 77 FE      [19] 1310 	ld	-2 (ix),a
   55AE DD 7E FB      [19] 1311 	ld	a,-5 (ix)
   55B1 DD 8E FF      [19] 1312 	adc	a, -1 (ix)
   55B4 DD 77 FF      [19] 1313 	ld	-1 (ix),a
   55B7 21 01 00      [10] 1314 	ld	hl,#0x0001
   55BA E5            [11] 1315 	push	hl
   55BB DD 6E FE      [19] 1316 	ld	l,-2 (ix)
   55BE DD 66 FF      [19] 1317 	ld	h,-1 (ix)
   55C1 E5            [11] 1318 	push	hl
   55C2 21 ED 69      [10] 1319 	ld	hl,#_sol_matriz
   55C5 E5            [11] 1320 	push	hl
   55C6 CD 7D 4C      [17] 1321 	call	_setBit
   55C9 21 06 00      [10] 1322 	ld	hl,#6
   55CC 39            [11] 1323 	add	hl,sp
   55CD F9            [ 6] 1324 	ld	sp,hl
                           1325 ;src/pathfinding.c:212: inserted = anyadirALista(x, y);
   55CE DD 66 EE      [19] 1326 	ld	h,-18 (ix)
   55D1 DD 6E F2      [19] 1327 	ld	l,-14 (ix)
   55D4 E5            [11] 1328 	push	hl
   55D5 CD F7 4C      [17] 1329 	call	_anyadirALista
   55D8 F1            [10] 1330 	pop	af
   55D9 DD 75 F5      [19] 1331 	ld	-11 (ix),l
                           1332 ;src/pathfinding.c:216: while (aux){
   55DC                    1333 00116$:
   55DC DD 7E F6      [19] 1334 	ld	a,-10 (ix)
   55DF B7            [ 4] 1335 	or	a, a
   55E0 CA 83 57      [10] 1336 	jp	Z,00118$
                           1337 ;src/pathfinding.c:217: if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
   55E3 DD 7E 06      [19] 1338 	ld	a,6 (ix)
   55E6 DD 96 F2      [19] 1339 	sub	a, -14 (ix)
   55E9 20 08         [12] 1340 	jr	NZ,00114$
   55EB DD 7E 07      [19] 1341 	ld	a,7 (ix)
   55EE DD 96 EE      [19] 1342 	sub	a, -18 (ix)
   55F1 28 0C         [12] 1343 	jr	Z,00110$
   55F3                    1344 00114$:
   55F3 3A EC 69      [13] 1345 	ld	a,(#_sol_tam + 0)
   55F6 B7            [ 4] 1346 	or	a, a
   55F7 28 06         [12] 1347 	jr	Z,00110$
   55F9 DD 7E F5      [19] 1348 	ld	a,-11 (ix)
   55FC B7            [ 4] 1349 	or	a, a
   55FD 20 16         [12] 1350 	jr	NZ,00111$
   55FF                    1351 00110$:
                           1352 ;src/pathfinding.c:219: if(inserted == 0 || sol_tam == 0){
   55FF DD 7E F5      [19] 1353 	ld	a,-11 (ix)
   5602 B7            [ 4] 1354 	or	a, a
   5603 28 06         [12] 1355 	jr	Z,00101$
   5605 3A EC 69      [13] 1356 	ld	a,(#_sol_tam + 0)
   5608 B7            [ 4] 1357 	or	a, a
   5609 20 04         [12] 1358 	jr	NZ,00102$
   560B                    1359 00101$:
                           1360 ;src/pathfinding.c:220: problem = 1;
   560B DD 36 F1 01   [19] 1361 	ld	-15 (ix),#0x01
   560F                    1362 00102$:
                           1363 ;src/pathfinding.c:223: aux = 0;
   560F DD 36 F6 00   [19] 1364 	ld	-10 (ix),#0x00
   5613 18 C7         [12] 1365 	jr	00116$
   5615                    1366 00111$:
                           1367 ;src/pathfinding.c:225: movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);
   5615 DD 6E 0A      [19] 1368 	ld	l,10 (ix)
   5618 DD 66 0B      [19] 1369 	ld	h,11 (ix)
   561B E5            [11] 1370 	push	hl
   561C DD 66 07      [19] 1371 	ld	h,7 (ix)
   561F DD 6E 06      [19] 1372 	ld	l,6 (ix)
   5622 E5            [11] 1373 	push	hl
   5623 DD 66 05      [19] 1374 	ld	h,5 (ix)
   5626 DD 6E 04      [19] 1375 	ld	l,4 (ix)
   5629 E5            [11] 1376 	push	hl
   562A DD 66 EE      [19] 1377 	ld	h,-18 (ix)
   562D DD 6E F2      [19] 1378 	ld	l,-14 (ix)
   5630 E5            [11] 1379 	push	hl
   5631 CD 35 4D      [17] 1380 	call	_adjacentTiles
   5634 F1            [10] 1381 	pop	af
   5635 F1            [10] 1382 	pop	af
   5636 F1            [10] 1383 	pop	af
   5637 F1            [10] 1384 	pop	af
   5638 5D            [ 4] 1385 	ld	e,l
                           1386 ;src/pathfinding.c:227: switch(movimiento){
   5639 3E 04         [ 7] 1387 	ld	a,#0x04
   563B 93            [ 4] 1388 	sub	a, e
   563C 38 9E         [12] 1389 	jr	C,00116$
                           1390 ;src/pathfinding.c:233: k = k+2;
   563E DD 4E F7      [19] 1391 	ld	c,-9 (ix)
   5641 0C            [ 4] 1392 	inc	c
   5642 0C            [ 4] 1393 	inc	c
                           1394 ;src/pathfinding.c:227: switch(movimiento){
   5643 16 00         [ 7] 1395 	ld	d,#0x00
   5645 21 4C 56      [10] 1396 	ld	hl,#00169$
   5648 19            [11] 1397 	add	hl,de
   5649 19            [11] 1398 	add	hl,de
   564A 19            [11] 1399 	add	hl,de
   564B E9            [ 4] 1400 	jp	(hl)
   564C                    1401 00169$:
   564C C3 5B 56      [10] 1402 	jp	00104$
   564F C3 92 56      [10] 1403 	jp	00105$
   5652 C3 C9 56      [10] 1404 	jp	00106$
   5655 C3 FF 56      [10] 1405 	jp	00107$
   5658 C3 35 57      [10] 1406 	jp	00108$
                           1407 ;src/pathfinding.c:228: case 0:
   565B                    1408 00104$:
                           1409 ;src/pathfinding.c:230: setBit(sol_matriz, up, 1);
   565B C5            [11] 1410 	push	bc
   565C 21 01 00      [10] 1411 	ld	hl,#0x0001
   565F E5            [11] 1412 	push	hl
   5660 DD 6E EF      [19] 1413 	ld	l,-17 (ix)
   5663 DD 66 F0      [19] 1414 	ld	h,-16 (ix)
   5666 E5            [11] 1415 	push	hl
   5667 21 ED 69      [10] 1416 	ld	hl,#_sol_matriz
   566A E5            [11] 1417 	push	hl
   566B CD 7D 4C      [17] 1418 	call	_setBit
   566E 21 06 00      [10] 1419 	ld	hl,#6
   5671 39            [11] 1420 	add	hl,sp
   5672 F9            [ 6] 1421 	ld	sp,hl
   5673 C1            [10] 1422 	pop	bc
                           1423 ;src/pathfinding.c:231: inserted = anyadirALista(x, y-2);
   5674 DD 46 EE      [19] 1424 	ld	b,-18 (ix)
   5677 05            [ 4] 1425 	dec	b
   5678 05            [ 4] 1426 	dec	b
   5679 C5            [11] 1427 	push	bc
   567A C5            [11] 1428 	push	bc
   567B 33            [ 6] 1429 	inc	sp
   567C DD 7E F2      [19] 1430 	ld	a,-14 (ix)
   567F F5            [11] 1431 	push	af
   5680 33            [ 6] 1432 	inc	sp
   5681 CD F7 4C      [17] 1433 	call	_anyadirALista
   5684 F1            [10] 1434 	pop	af
   5685 C1            [10] 1435 	pop	bc
   5686 DD 75 F5      [19] 1436 	ld	-11 (ix),l
                           1437 ;src/pathfinding.c:232: y = y-1;
   5689 DD 35 EE      [23] 1438 	dec	-18 (ix)
                           1439 ;src/pathfinding.c:233: k = k+2;
   568C DD 71 F7      [19] 1440 	ld	-9 (ix),c
                           1441 ;src/pathfinding.c:234: break;
   568F C3 DC 55      [10] 1442 	jp	00116$
                           1443 ;src/pathfinding.c:235: case 1:
   5692                    1444 00105$:
                           1445 ;src/pathfinding.c:237: setBit(sol_matriz, down, 1);
   5692 C5            [11] 1446 	push	bc
   5693 21 01 00      [10] 1447 	ld	hl,#0x0001
   5696 E5            [11] 1448 	push	hl
   5697 DD 6E EA      [19] 1449 	ld	l,-22 (ix)
   569A DD 66 EB      [19] 1450 	ld	h,-21 (ix)
   569D E5            [11] 1451 	push	hl
   569E 21 ED 69      [10] 1452 	ld	hl,#_sol_matriz
   56A1 E5            [11] 1453 	push	hl
   56A2 CD 7D 4C      [17] 1454 	call	_setBit
   56A5 21 06 00      [10] 1455 	ld	hl,#6
   56A8 39            [11] 1456 	add	hl,sp
   56A9 F9            [ 6] 1457 	ld	sp,hl
   56AA C1            [10] 1458 	pop	bc
                           1459 ;src/pathfinding.c:238: inserted = anyadirALista(x, y+2);
   56AB DD 46 EE      [19] 1460 	ld	b,-18 (ix)
   56AE 04            [ 4] 1461 	inc	b
   56AF 04            [ 4] 1462 	inc	b
   56B0 C5            [11] 1463 	push	bc
   56B1 C5            [11] 1464 	push	bc
   56B2 33            [ 6] 1465 	inc	sp
   56B3 DD 7E F2      [19] 1466 	ld	a,-14 (ix)
   56B6 F5            [11] 1467 	push	af
   56B7 33            [ 6] 1468 	inc	sp
   56B8 CD F7 4C      [17] 1469 	call	_anyadirALista
   56BB F1            [10] 1470 	pop	af
   56BC C1            [10] 1471 	pop	bc
   56BD DD 75 F5      [19] 1472 	ld	-11 (ix),l
                           1473 ;src/pathfinding.c:239: y = y+1;
   56C0 DD 34 EE      [23] 1474 	inc	-18 (ix)
                           1475 ;src/pathfinding.c:240: k = k+2;
   56C3 DD 71 F7      [19] 1476 	ld	-9 (ix),c
                           1477 ;src/pathfinding.c:241: break;
   56C6 C3 DC 55      [10] 1478 	jp	00116$
                           1479 ;src/pathfinding.c:242: case 2:
   56C9                    1480 00106$:
                           1481 ;src/pathfinding.c:244: setBit(sol_matriz, left, 1);
   56C9 C5            [11] 1482 	push	bc
   56CA 21 01 00      [10] 1483 	ld	hl,#0x0001
   56CD E5            [11] 1484 	push	hl
   56CE DD 6E EC      [19] 1485 	ld	l,-20 (ix)
   56D1 DD 66 ED      [19] 1486 	ld	h,-19 (ix)
   56D4 E5            [11] 1487 	push	hl
   56D5 21 ED 69      [10] 1488 	ld	hl,#_sol_matriz
   56D8 E5            [11] 1489 	push	hl
   56D9 CD 7D 4C      [17] 1490 	call	_setBit
   56DC 21 06 00      [10] 1491 	ld	hl,#6
   56DF 39            [11] 1492 	add	hl,sp
   56E0 F9            [ 6] 1493 	ld	sp,hl
   56E1 C1            [10] 1494 	pop	bc
                           1495 ;src/pathfinding.c:245: inserted = anyadirALista(x-1, y);
   56E2 DD 46 F2      [19] 1496 	ld	b,-14 (ix)
   56E5 05            [ 4] 1497 	dec	b
   56E6 C5            [11] 1498 	push	bc
   56E7 DD 7E EE      [19] 1499 	ld	a,-18 (ix)
   56EA F5            [11] 1500 	push	af
   56EB 33            [ 6] 1501 	inc	sp
   56EC C5            [11] 1502 	push	bc
   56ED 33            [ 6] 1503 	inc	sp
   56EE CD F7 4C      [17] 1504 	call	_anyadirALista
   56F1 F1            [10] 1505 	pop	af
   56F2 C1            [10] 1506 	pop	bc
   56F3 DD 75 F5      [19] 1507 	ld	-11 (ix),l
                           1508 ;src/pathfinding.c:246: x = x-1;
   56F6 DD 70 F2      [19] 1509 	ld	-14 (ix),b
                           1510 ;src/pathfinding.c:247: k = k+2;
   56F9 DD 71 F7      [19] 1511 	ld	-9 (ix),c
                           1512 ;src/pathfinding.c:248: break;
   56FC C3 DC 55      [10] 1513 	jp	00116$
                           1514 ;src/pathfinding.c:249: case 3:
   56FF                    1515 00107$:
                           1516 ;src/pathfinding.c:251: setBit(sol_matriz, right, 1);
   56FF C5            [11] 1517 	push	bc
   5700 21 01 00      [10] 1518 	ld	hl,#0x0001
   5703 E5            [11] 1519 	push	hl
   5704 DD 6E F3      [19] 1520 	ld	l,-13 (ix)
   5707 DD 66 F4      [19] 1521 	ld	h,-12 (ix)
   570A E5            [11] 1522 	push	hl
   570B 21 ED 69      [10] 1523 	ld	hl,#_sol_matriz
   570E E5            [11] 1524 	push	hl
   570F CD 7D 4C      [17] 1525 	call	_setBit
   5712 21 06 00      [10] 1526 	ld	hl,#6
   5715 39            [11] 1527 	add	hl,sp
   5716 F9            [ 6] 1528 	ld	sp,hl
   5717 C1            [10] 1529 	pop	bc
                           1530 ;src/pathfinding.c:252: inserted = anyadirALista(x+1, y);
   5718 DD 46 F2      [19] 1531 	ld	b,-14 (ix)
   571B 04            [ 4] 1532 	inc	b
   571C C5            [11] 1533 	push	bc
   571D DD 7E EE      [19] 1534 	ld	a,-18 (ix)
   5720 F5            [11] 1535 	push	af
   5721 33            [ 6] 1536 	inc	sp
   5722 C5            [11] 1537 	push	bc
   5723 33            [ 6] 1538 	inc	sp
   5724 CD F7 4C      [17] 1539 	call	_anyadirALista
   5727 F1            [10] 1540 	pop	af
   5728 C1            [10] 1541 	pop	bc
   5729 DD 75 F5      [19] 1542 	ld	-11 (ix),l
                           1543 ;src/pathfinding.c:253: x = x+1;
   572C DD 70 F2      [19] 1544 	ld	-14 (ix),b
                           1545 ;src/pathfinding.c:254: k = k+2;
   572F DD 71 F7      [19] 1546 	ld	-9 (ix),c
                           1547 ;src/pathfinding.c:255: break;
   5732 C3 DC 55      [10] 1548 	jp	00116$
                           1549 ;src/pathfinding.c:257: case 4:
   5735                    1550 00108$:
                           1551 ;src/pathfinding.c:259: setBit(sol_matriz, (y-ORIGEN_MAPA_Y*40*2 + x), 1);
   5735 DD 7E EE      [19] 1552 	ld	a, -18 (ix)
   5738 06 00         [ 7] 1553 	ld	b, #0x00
   573A C6 80         [ 7] 1554 	add	a,#0x80
   573C 4F            [ 4] 1555 	ld	c,a
   573D 78            [ 4] 1556 	ld	a,b
   573E CE F8         [ 7] 1557 	adc	a,#0xF8
   5740 47            [ 4] 1558 	ld	b,a
   5741 DD 6E F2      [19] 1559 	ld	l,-14 (ix)
   5744 26 00         [ 7] 1560 	ld	h,#0x00
   5746 09            [11] 1561 	add	hl,bc
   5747 01 01 00      [10] 1562 	ld	bc,#0x0001
   574A C5            [11] 1563 	push	bc
   574B E5            [11] 1564 	push	hl
   574C 21 ED 69      [10] 1565 	ld	hl,#_sol_matriz
   574F E5            [11] 1566 	push	hl
   5750 CD 7D 4C      [17] 1567 	call	_setBit
   5753 21 06 00      [10] 1568 	ld	hl,#6
   5756 39            [11] 1569 	add	hl,sp
   5757 F9            [ 6] 1570 	ld	sp,hl
                           1571 ;src/pathfinding.c:261: sol_tam = sol_tam - 2;
   5758 21 EC 69      [10] 1572 	ld	hl, #_sol_tam+0
   575B 35            [11] 1573 	dec	(hl)
   575C 21 EC 69      [10] 1574 	ld	hl, #_sol_tam+0
   575F 35            [11] 1575 	dec	(hl)
                           1576 ;src/pathfinding.c:262: k--;
   5760 DD 4E F7      [19] 1577 	ld	c,-9 (ix)
   5763 0D            [ 4] 1578 	dec	c
                           1579 ;src/pathfinding.c:263: y = camino[k];
   5764 21 2D 72      [10] 1580 	ld	hl,#_camino
   5767 06 00         [ 7] 1581 	ld	b,#0x00
   5769 09            [11] 1582 	add	hl, bc
   576A 7E            [ 7] 1583 	ld	a,(hl)
   576B DD 77 EE      [19] 1584 	ld	-18 (ix),a
                           1585 ;src/pathfinding.c:264: k--;
   576E 79            [ 4] 1586 	ld	a,c
   576F C6 FF         [ 7] 1587 	add	a,#0xFF
                           1588 ;src/pathfinding.c:265: x = camino[k];
   5771 DD 77 F7      [19] 1589 	ld	-9 (ix),a
   5774 C6 2D         [ 7] 1590 	add	a,#<(_camino)
   5776 6F            [ 4] 1591 	ld	l,a
   5777 3E 72         [ 7] 1592 	ld	a,#>(_camino)
   5779 CE 00         [ 7] 1593 	adc	a, #0x00
   577B 67            [ 4] 1594 	ld	h,a
   577C 7E            [ 7] 1595 	ld	a,(hl)
   577D DD 77 F2      [19] 1596 	ld	-14 (ix),a
                           1597 ;src/pathfinding.c:267: }
   5780 C3 DC 55      [10] 1598 	jp	00116$
   5783                    1599 00118$:
                           1600 ;src/pathfinding.c:272: if(problem == 0){
   5783 DD 7E F1      [19] 1601 	ld	a,-15 (ix)
   5786 B7            [ 4] 1602 	or	a, a
   5787 20 72         [12] 1603 	jr	NZ,00127$
                           1604 ;src/pathfinding.c:273: if(sol_tam < 70){
   5789 3A EC 69      [13] 1605 	ld	a,(#_sol_tam + 0)
   578C D6 46         [ 7] 1606 	sub	a, #0x46
   578E 30 0C         [12] 1607 	jr	NC,00120$
                           1608 ;src/pathfinding.c:274: enemy->longitud_camino = sol_tam;
   5790 DD 6E FC      [19] 1609 	ld	l,-4 (ix)
   5793 DD 66 FD      [19] 1610 	ld	h,-3 (ix)
   5796 3A EC 69      [13] 1611 	ld	a,(#_sol_tam + 0)
   5799 77            [ 7] 1612 	ld	(hl),a
   579A 18 08         [12] 1613 	jr	00137$
   579C                    1614 00120$:
                           1615 ;src/pathfinding.c:276: enemy->longitud_camino = 70;
   579C DD 6E FC      [19] 1616 	ld	l,-4 (ix)
   579F DD 66 FD      [19] 1617 	ld	h,-3 (ix)
   57A2 36 46         [10] 1618 	ld	(hl),#0x46
                           1619 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   57A4                    1620 00137$:
   57A4 DD 7E F8      [19] 1621 	ld	a,-8 (ix)
   57A7 C6 17         [ 7] 1622 	add	a, #0x17
   57A9 DD 77 FE      [19] 1623 	ld	-2 (ix),a
   57AC DD 7E F9      [19] 1624 	ld	a,-7 (ix)
   57AF CE 00         [ 7] 1625 	adc	a, #0x00
   57B1 DD 77 FF      [19] 1626 	ld	-1 (ix),a
   57B4 DD 36 E9 00   [19] 1627 	ld	-23 (ix),#0x00
   57B8                    1628 00125$:
                           1629 ;src/pathfinding.c:280: enemy->camino[j] = camino[j];
   57B8 DD 7E E9      [19] 1630 	ld	a,-23 (ix)
   57BB DD 77 FA      [19] 1631 	ld	-6 (ix),a
   57BE DD 36 FB 00   [19] 1632 	ld	-5 (ix),#0x00
   57C2 DD 7E FE      [19] 1633 	ld	a,-2 (ix)
   57C5 DD 86 FA      [19] 1634 	add	a, -6 (ix)
   57C8 DD 77 FA      [19] 1635 	ld	-6 (ix),a
   57CB DD 7E FF      [19] 1636 	ld	a,-1 (ix)
   57CE DD 8E FB      [19] 1637 	adc	a, -5 (ix)
   57D1 DD 77 FB      [19] 1638 	ld	-5 (ix),a
   57D4 3E 2D         [ 7] 1639 	ld	a,#<(_camino)
   57D6 DD 86 E9      [19] 1640 	add	a, -23 (ix)
   57D9 DD 77 FC      [19] 1641 	ld	-4 (ix),a
   57DC 3E 72         [ 7] 1642 	ld	a,#>(_camino)
   57DE CE 00         [ 7] 1643 	adc	a, #0x00
   57E0 DD 77 FD      [19] 1644 	ld	-3 (ix),a
   57E3 DD 6E FC      [19] 1645 	ld	l,-4 (ix)
   57E6 DD 66 FD      [19] 1646 	ld	h,-3 (ix)
   57E9 4E            [ 7] 1647 	ld	c,(hl)
   57EA DD 6E FA      [19] 1648 	ld	l,-6 (ix)
   57ED DD 66 FB      [19] 1649 	ld	h,-5 (ix)
   57F0 71            [ 7] 1650 	ld	(hl),c
                           1651 ;src/pathfinding.c:279: for(j = 0; j<70; j++){
   57F1 DD 34 E9      [23] 1652 	inc	-23 (ix)
   57F4 DD 7E E9      [19] 1653 	ld	a,-23 (ix)
   57F7 D6 46         [ 7] 1654 	sub	a, #0x46
   57F9 38 BD         [12] 1655 	jr	C,00125$
   57FB                    1656 00127$:
   57FB DD F9         [10] 1657 	ld	sp, ix
   57FD DD E1         [14] 1658 	pop	ix
   57FF C9            [10] 1659 	ret
                           1660 	.area _CODE
                           1661 	.area _INITIALIZER
                           1662 	.area _CABS (ABS)
