                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _inicializar
                             13 	.globl _comprobarTeclado
                             14 	.globl _moverAbajo
                             15 	.globl _moverArriba
                             16 	.globl _moverDerecha
                             17 	.globl _moverIzquierda
                             18 	.globl _redibujarProta
                             19 	.globl _borrarProta
                             20 	.globl _dibujarProta
                             21 	.globl _dibujarMapa
                             22 	.globl _cpct_etm_setTileset2x4
                             23 	.globl _cpct_etm_drawTileBox2x4
                             24 	.globl _cpct_getScreenPtr
                             25 	.globl _cpct_setPalette
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_drawSpriteMaskedAlignedTable
                             28 	.globl _cpct_isAnyKeyPressed
                             29 	.globl _cpct_isKeyPressed
                             30 	.globl _cpct_scanKeyboard_if
                             31 	.globl _cpct_disableFirmware
                             32 	.globl _mapa
                             33 	.globl _prota
                             34 ;--------------------------------------------------------
                             35 ; special function registers
                             36 ;--------------------------------------------------------
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DATA
   497D                      41 _prota::
   497D                      42 	.ds 7
   4984                      43 _mapa::
   4984                      44 	.ds 2
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/main.c:39: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                             70 ;	---------------------------------
                             71 ; Function dummy_cpct_transparentMaskTable0M0_container
                             72 ; ---------------------------------
   478C                      73 _dummy_cpct_transparentMaskTable0M0_container::
                             74 	.area _g_tablatrans_ (ABS) 
   0100                      75 	.org 0x0100 
   0100                      76 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    77 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    78 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    79 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    80 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    81 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    82 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    83 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    84 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    85 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    86 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    87 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    93 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    94 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00    97 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00    99 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            109 	.area _CSEG (REL, CON) 
                            110 ;src/main.c:41: void dibujarMapa() {
                            111 ;	---------------------------------
                            112 ; Function dibujarMapa
                            113 ; ---------------------------------
   4986                     114 _dibujarMapa::
                            115 ;src/main.c:42: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   4986 2A 84 49      [16]  116 	ld	hl,(_mapa)
   4989 E5            [11]  117 	push	hl
   498A 21 00 C0      [10]  118 	ld	hl,#0xC000
   498D E5            [11]  119 	push	hl
   498E 21 28 28      [10]  120 	ld	hl,#0x2828
   4991 E5            [11]  121 	push	hl
   4992 2E 00         [ 7]  122 	ld	l, #0x00
   4994 E5            [11]  123 	push	hl
   4995 AF            [ 4]  124 	xor	a, a
   4996 F5            [11]  125 	push	af
   4997 33            [ 6]  126 	inc	sp
   4998 CD AF 47      [17]  127 	call	_cpct_etm_drawTileBox2x4
   499B C9            [10]  128 	ret
                            129 ;src/main.c:47: void dibujarProta() {
                            130 ;	---------------------------------
                            131 ; Function dibujarProta
                            132 ; ---------------------------------
   499C                     133 _dibujarProta::
                            134 ;src/main.c:48: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   499C 21 7E 49      [10]  135 	ld	hl, #_prota + 1
   499F 56            [ 7]  136 	ld	d,(hl)
   49A0 21 7D 49      [10]  137 	ld	hl, #_prota + 0
   49A3 46            [ 7]  138 	ld	b,(hl)
   49A4 D5            [11]  139 	push	de
   49A5 33            [ 6]  140 	inc	sp
   49A6 C5            [11]  141 	push	bc
   49A7 33            [ 6]  142 	inc	sp
   49A8 21 00 C0      [10]  143 	ld	hl,#0xC000
   49AB E5            [11]  144 	push	hl
   49AC CD 22 49      [17]  145 	call	_cpct_getScreenPtr
   49AF EB            [ 4]  146 	ex	de,hl
                            147 ;src/main.c:49: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   49B0 ED 4B 81 49   [20]  148 	ld	bc, (#_prota + 4)
   49B4 21 00 01      [10]  149 	ld	hl,#_g_tablatrans
   49B7 E5            [11]  150 	push	hl
   49B8 21 08 1B      [10]  151 	ld	hl,#0x1B08
   49BB E5            [11]  152 	push	hl
   49BC D5            [11]  153 	push	de
   49BD C5            [11]  154 	push	bc
   49BE CD 42 49      [17]  155 	call	_cpct_drawSpriteMaskedAlignedTable
   49C1 C9            [10]  156 	ret
                            157 ;src/main.c:52: void borrarProta() {
                            158 ;	---------------------------------
                            159 ; Function borrarProta
                            160 ; ---------------------------------
   49C2                     161 _borrarProta::
   49C2 DD E5         [15]  162 	push	ix
   49C4 DD 21 00 00   [14]  163 	ld	ix,#0
   49C8 DD 39         [15]  164 	add	ix,sp
   49CA 3B            [ 6]  165 	dec	sp
                            166 ;src/main.c:53: u8 w = 4 + (prota.px & 1);
   49CB 21 7F 49      [10]  167 	ld	hl, #_prota + 2
   49CE 4E            [ 7]  168 	ld	c,(hl)
   49CF 79            [ 4]  169 	ld	a,c
   49D0 E6 01         [ 7]  170 	and	a, #0x01
   49D2 47            [ 4]  171 	ld	b,a
   49D3 04            [ 4]  172 	inc	b
   49D4 04            [ 4]  173 	inc	b
   49D5 04            [ 4]  174 	inc	b
   49D6 04            [ 4]  175 	inc	b
                            176 ;src/main.c:54: u8 h = 7 + (prota.py & 3 ? 1 : 0);
   49D7 21 80 49      [10]  177 	ld	hl, #_prota + 3
   49DA 5E            [ 7]  178 	ld	e,(hl)
   49DB 7B            [ 4]  179 	ld	a,e
   49DC E6 03         [ 7]  180 	and	a, #0x03
   49DE 28 04         [12]  181 	jr	Z,00103$
   49E0 3E 01         [ 7]  182 	ld	a,#0x01
   49E2 18 02         [12]  183 	jr	00104$
   49E4                     184 00103$:
   49E4 3E 00         [ 7]  185 	ld	a,#0x00
   49E6                     186 00104$:
   49E6 C6 07         [ 7]  187 	add	a, #0x07
   49E8 DD 77 FF      [19]  188 	ld	-1 (ix),a
                            189 ;src/main.c:55: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   49EB FD 2A 84 49   [20]  190 	ld	iy,(_mapa)
   49EF 16 00         [ 7]  191 	ld	d,#0x00
   49F1 63            [ 4]  192 	ld	h,e
   49F2 6A            [ 4]  193 	ld	l,d
   49F3 CB 7A         [ 8]  194 	bit	7, d
   49F5 28 05         [12]  195 	jr	Z,00105$
   49F7 13            [ 6]  196 	inc	de
   49F8 13            [ 6]  197 	inc	de
   49F9 13            [ 6]  198 	inc	de
   49FA 63            [ 4]  199 	ld	h,e
   49FB 6A            [ 4]  200 	ld	l,d
   49FC                     201 00105$:
   49FC 5C            [ 4]  202 	ld	e, h
   49FD 55            [ 4]  203 	ld	d, l
   49FE CB 2A         [ 8]  204 	sra	d
   4A00 CB 1B         [ 8]  205 	rr	e
   4A02 CB 2A         [ 8]  206 	sra	d
   4A04 CB 1B         [ 8]  207 	rr	e
   4A06 51            [ 4]  208 	ld	d,c
   4A07 CB 3A         [ 8]  209 	srl	d
   4A09 FD E5         [15]  210 	push	iy
   4A0B 21 00 C0      [10]  211 	ld	hl,#0xC000
   4A0E E5            [11]  212 	push	hl
   4A0F 3E 28         [ 7]  213 	ld	a,#0x28
   4A11 F5            [11]  214 	push	af
   4A12 33            [ 6]  215 	inc	sp
   4A13 DD 7E FF      [19]  216 	ld	a,-1 (ix)
   4A16 F5            [11]  217 	push	af
   4A17 33            [ 6]  218 	inc	sp
   4A18 C5            [11]  219 	push	bc
   4A19 33            [ 6]  220 	inc	sp
   4A1A 7B            [ 4]  221 	ld	a,e
   4A1B F5            [11]  222 	push	af
   4A1C 33            [ 6]  223 	inc	sp
   4A1D D5            [11]  224 	push	de
   4A1E 33            [ 6]  225 	inc	sp
   4A1F CD AF 47      [17]  226 	call	_cpct_etm_drawTileBox2x4
   4A22 33            [ 6]  227 	inc	sp
   4A23 DD E1         [14]  228 	pop	ix
   4A25 C9            [10]  229 	ret
                            230 ;src/main.c:58: void redibujarProta() {
                            231 ;	---------------------------------
                            232 ; Function redibujarProta
                            233 ; ---------------------------------
   4A26                     234 _redibujarProta::
                            235 ;src/main.c:59: borrarProta();
   4A26 CD C2 49      [17]  236 	call	_borrarProta
                            237 ;src/main.c:60: prota.px = prota.x;
   4A29 01 7F 49      [10]  238 	ld	bc,#_prota + 2
   4A2C 3A 7D 49      [13]  239 	ld	a, (#_prota + 0)
   4A2F 02            [ 7]  240 	ld	(bc),a
                            241 ;src/main.c:61: prota.py = prota.y;
   4A30 01 80 49      [10]  242 	ld	bc,#_prota + 3
   4A33 3A 7E 49      [13]  243 	ld	a, (#_prota + 1)
   4A36 02            [ 7]  244 	ld	(bc),a
                            245 ;src/main.c:62: dibujarProta();
   4A37 C3 9C 49      [10]  246 	jp  _dibujarProta
                            247 ;src/main.c:65: void moverIzquierda() {
                            248 ;	---------------------------------
                            249 ; Function moverIzquierda
                            250 ; ---------------------------------
   4A3A                     251 _moverIzquierda::
                            252 ;src/main.c:66: if (prota.x > 0) {
   4A3A 01 7D 49      [10]  253 	ld	bc,#_prota+0
   4A3D 0A            [ 7]  254 	ld	a,(bc)
   4A3E B7            [ 4]  255 	or	a, a
   4A3F C8            [11]  256 	ret	Z
                            257 ;src/main.c:67: prota.x--;
   4A40 C6 FF         [ 7]  258 	add	a,#0xFF
   4A42 02            [ 7]  259 	ld	(bc),a
                            260 ;src/main.c:68: prota.mover  = SI;
   4A43 21 83 49      [10]  261 	ld	hl,#(_prota + 0x0006)
   4A46 36 01         [10]  262 	ld	(hl),#0x01
   4A48 C9            [10]  263 	ret
                            264 ;src/main.c:75: void moverDerecha() {
                            265 ;	---------------------------------
                            266 ; Function moverDerecha
                            267 ; ---------------------------------
   4A49                     268 _moverDerecha::
                            269 ;src/main.c:76: if (prota.x < LIMITE_DERECHO) {
   4A49 21 7D 49      [10]  270 	ld	hl,#_prota+0
   4A4C 4E            [ 7]  271 	ld	c,(hl)
   4A4D 79            [ 4]  272 	ld	a,c
   4A4E D6 48         [ 7]  273 	sub	a, #0x48
   4A50 D0            [11]  274 	ret	NC
                            275 ;src/main.c:77: prota.x++;
   4A51 0C            [ 4]  276 	inc	c
   4A52 71            [ 7]  277 	ld	(hl),c
                            278 ;src/main.c:78: prota.mover  = SI;
   4A53 21 83 49      [10]  279 	ld	hl,#(_prota + 0x0006)
   4A56 36 01         [10]  280 	ld	(hl),#0x01
   4A58 C9            [10]  281 	ret
                            282 ;src/main.c:82: void moverArriba() {
                            283 ;	---------------------------------
                            284 ; Function moverArriba
                            285 ; ---------------------------------
   4A59                     286 _moverArriba::
                            287 ;src/main.c:83: if (prota.y > 0) {
   4A59 01 7E 49      [10]  288 	ld	bc,#_prota + 1
   4A5C 0A            [ 7]  289 	ld	a,(bc)
   4A5D B7            [ 4]  290 	or	a, a
   4A5E C8            [11]  291 	ret	Z
                            292 ;src/main.c:84: prota.y--;
   4A5F C6 FF         [ 7]  293 	add	a,#0xFF
   4A61 02            [ 7]  294 	ld	(bc),a
                            295 ;src/main.c:85: prota.mover  = SI;
   4A62 21 83 49      [10]  296 	ld	hl,#(_prota + 0x0006)
   4A65 36 01         [10]  297 	ld	(hl),#0x01
   4A67 C9            [10]  298 	ret
                            299 ;src/main.c:89: void moverAbajo() {
                            300 ;	---------------------------------
                            301 ; Function moverAbajo
                            302 ; ---------------------------------
   4A68                     303 _moverAbajo::
                            304 ;src/main.c:90: prota.y++;
   4A68 01 7E 49      [10]  305 	ld	bc,#_prota + 1
   4A6B 0A            [ 7]  306 	ld	a,(bc)
   4A6C 3C            [ 4]  307 	inc	a
   4A6D 02            [ 7]  308 	ld	(bc),a
                            309 ;src/main.c:91: prota.mover  = SI;
   4A6E 21 83 49      [10]  310 	ld	hl,#(_prota + 0x0006)
   4A71 36 01         [10]  311 	ld	(hl),#0x01
   4A73 C9            [10]  312 	ret
                            313 ;src/main.c:94: void comprobarTeclado() {
                            314 ;	---------------------------------
                            315 ; Function comprobarTeclado
                            316 ; ---------------------------------
   4A74                     317 _comprobarTeclado::
                            318 ;src/main.c:95: cpct_scanKeyboard_if();
   4A74 CD 7A 48      [17]  319 	call	_cpct_scanKeyboard_if
                            320 ;src/main.c:97: if (cpct_isAnyKeyPressed()) {
   4A77 CD 6D 48      [17]  321 	call	_cpct_isAnyKeyPressed
   4A7A 7D            [ 4]  322 	ld	a,l
   4A7B B7            [ 4]  323 	or	a, a
   4A7C C8            [11]  324 	ret	Z
                            325 ;src/main.c:98: if (cpct_isKeyPressed(Key_CursorLeft))
   4A7D 21 01 01      [10]  326 	ld	hl,#0x0101
   4A80 CD A3 47      [17]  327 	call	_cpct_isKeyPressed
   4A83 7D            [ 4]  328 	ld	a,l
   4A84 B7            [ 4]  329 	or	a, a
                            330 ;src/main.c:99: moverIzquierda();
   4A85 C2 3A 4A      [10]  331 	jp	NZ,_moverIzquierda
                            332 ;src/main.c:100: else if (cpct_isKeyPressed(Key_CursorRight))
   4A88 21 00 02      [10]  333 	ld	hl,#0x0200
   4A8B CD A3 47      [17]  334 	call	_cpct_isKeyPressed
   4A8E 7D            [ 4]  335 	ld	a,l
   4A8F B7            [ 4]  336 	or	a, a
                            337 ;src/main.c:101: moverDerecha();
   4A90 C2 49 4A      [10]  338 	jp	NZ,_moverDerecha
                            339 ;src/main.c:102: else if (cpct_isKeyPressed(Key_CursorUp))
   4A93 21 00 01      [10]  340 	ld	hl,#0x0100
   4A96 CD A3 47      [17]  341 	call	_cpct_isKeyPressed
   4A99 7D            [ 4]  342 	ld	a,l
   4A9A B7            [ 4]  343 	or	a, a
                            344 ;src/main.c:103: moverArriba();
   4A9B C2 59 4A      [10]  345 	jp	NZ,_moverArriba
                            346 ;src/main.c:104: else if (cpct_isKeyPressed(Key_CursorDown))
   4A9E 21 00 04      [10]  347 	ld	hl,#0x0400
   4AA1 CD A3 47      [17]  348 	call	_cpct_isKeyPressed
   4AA4 7D            [ 4]  349 	ld	a,l
   4AA5 B7            [ 4]  350 	or	a, a
   4AA6 C8            [11]  351 	ret	Z
                            352 ;src/main.c:105: moverAbajo();
   4AA7 C3 68 4A      [10]  353 	jp  _moverAbajo
                            354 ;src/main.c:109: void inicializar() {
                            355 ;	---------------------------------
                            356 ; Function inicializar
                            357 ; ---------------------------------
   4AAA                     358 _inicializar::
                            359 ;src/main.c:110: cpct_disableFirmware();
   4AAA CD F0 48      [17]  360 	call	_cpct_disableFirmware
                            361 ;src/main.c:111: cpct_setVideoMode(0);
   4AAD 2E 00         [ 7]  362 	ld	l,#0x00
   4AAF CD E2 48      [17]  363 	call	_cpct_setVideoMode
                            364 ;src/main.c:113: cpct_setPalette(g_palette, 16);
   4AB2 21 10 00      [10]  365 	ld	hl,#0x0010
   4AB5 E5            [11]  366 	push	hl
   4AB6 21 A4 46      [10]  367 	ld	hl,#_g_palette
   4AB9 E5            [11]  368 	push	hl
   4ABA CD 8C 47      [17]  369 	call	_cpct_setPalette
                            370 ;src/main.c:115: mapa = g_map1;
   4ABD 21 00 40      [10]  371 	ld	hl,#_g_map1+0
   4AC0 22 84 49      [16]  372 	ld	(_mapa),hl
                            373 ;src/main.c:116: cpct_etm_setTileset2x4(g_tileset);
   4AC3 21 40 46      [10]  374 	ld	hl,#_g_tileset
   4AC6 CD 3E 48      [17]  375 	call	_cpct_etm_setTileset2x4
                            376 ;src/main.c:117: dibujarMapa();
   4AC9 CD 86 49      [17]  377 	call	_dibujarMapa
                            378 ;src/main.c:120: prota.x = prota.px = 15;
   4ACC 21 7F 49      [10]  379 	ld	hl,#(_prota + 0x0002)
   4ACF 36 0F         [10]  380 	ld	(hl),#0x0F
   4AD1 21 7D 49      [10]  381 	ld	hl,#_prota
   4AD4 36 0F         [10]  382 	ld	(hl),#0x0F
                            383 ;src/main.c:121: prota.y = prota.py = 120;
   4AD6 21 80 49      [10]  384 	ld	hl,#(_prota + 0x0003)
   4AD9 36 78         [10]  385 	ld	(hl),#0x78
   4ADB 21 7E 49      [10]  386 	ld	hl,#(_prota + 0x0001)
   4ADE 36 78         [10]  387 	ld	(hl),#0x78
                            388 ;src/main.c:122: prota.mover  = NO;
   4AE0 21 83 49      [10]  389 	ld	hl,#(_prota + 0x0006)
   4AE3 36 00         [10]  390 	ld	(hl),#0x00
                            391 ;src/main.c:123: prota.sprite = g_hero;
   4AE5 21 B4 46      [10]  392 	ld	hl,#_g_hero
   4AE8 22 81 49      [16]  393 	ld	((_prota + 0x0004)), hl
                            394 ;src/main.c:124: dibujarProta();
   4AEB CD 9C 49      [17]  395 	call	_dibujarProta
   4AEE C9            [10]  396 	ret
                            397 ;src/main.c:128: void main(void) {
                            398 ;	---------------------------------
                            399 ; Function main
                            400 ; ---------------------------------
   4AEF                     401 _main::
                            402 ;src/main.c:129: inicializar();
   4AEF CD AA 4A      [17]  403 	call	_inicializar
                            404 ;src/main.c:130: while (1) {
   4AF2                     405 00104$:
                            406 ;src/main.c:131: comprobarTeclado();
   4AF2 CD 74 4A      [17]  407 	call	_comprobarTeclado
                            408 ;src/main.c:132: if (prota.mover) {
   4AF5 3A 83 49      [13]  409 	ld	a, (#(_prota + 0x0006) + 0)
   4AF8 B7            [ 4]  410 	or	a, a
   4AF9 28 F7         [12]  411 	jr	Z,00104$
                            412 ;src/main.c:133: redibujarProta();
   4AFB CD 26 4A      [17]  413 	call	_redibujarProta
                            414 ;src/main.c:134: prota.mover = NO;
   4AFE 21 83 49      [10]  415 	ld	hl,#(_prota + 0x0006)
   4B01 36 00         [10]  416 	ld	(hl),#0x00
   4B03 18 ED         [12]  417 	jr	00104$
                            418 	.area _CODE
                            419 	.area _INITIALIZER
                            420 	.area _CABS (ABS)
