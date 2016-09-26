                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _G_song
                             12 	.globl _main
                             13 	.globl _inicializar
                             14 	.globl _comprobarTeclado
                             15 	.globl _moverAbajo
                             16 	.globl _moverArriba
                             17 	.globl _moverDerecha
                             18 	.globl _moverIzquierda
                             19 	.globl _redibujarProta
                             20 	.globl _borrarProta
                             21 	.globl _dibujarProta
                             22 	.globl _dibujarMapa
                             23 	.globl _cpct_etm_setTileset2x4
                             24 	.globl _cpct_etm_drawTileBox2x4
                             25 	.globl _cpct_akp_musicPlay
                             26 	.globl _cpct_akp_musicInit
                             27 	.globl _cpct_getScreenPtr
                             28 	.globl _cpct_setPalette
                             29 	.globl _cpct_setVideoMode
                             30 	.globl _cpct_drawSpriteMaskedAlignedTable
                             31 	.globl _cpct_isAnyKeyPressed
                             32 	.globl _cpct_isKeyPressed
                             33 	.globl _cpct_scanKeyboard_if
                             34 	.globl _cpct_disableFirmware
                             35 	.globl _mapa
                             36 	.globl _prota
                             37 ;--------------------------------------------------------
                             38 ; special function registers
                             39 ;--------------------------------------------------------
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DATA
   5246                      44 _prota::
   5246                      45 	.ds 7
   524D                      46 _mapa::
   524D                      47 	.ds 2
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _INITIALIZED
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/main.c:43: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                             73 ;	---------------------------------
                             74 ; Function dummy_cpct_transparentMaskTable0M0_container
                             75 ; ---------------------------------
   482C                      76 _dummy_cpct_transparentMaskTable0M0_container::
                             77 	.area _g_tablatrans_ (ABS) 
   0100                      78 	.org 0x0100 
   0100                      79 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    80 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    81 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    82 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    83 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    84 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    85 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    86 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    87 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    88 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    90 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    96 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    97 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    98 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    99 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   100 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   101 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            112 	.area _CSEG (REL, CON) 
                            113 ;src/main.c:45: void dibujarMapa() {
                            114 ;	---------------------------------
                            115 ; Function dibujarMapa
                            116 ; ---------------------------------
   524F                     117 _dibujarMapa::
                            118 ;src/main.c:46: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   524F 2A 4D 52      [16]  119 	ld	hl,(_mapa)
   5252 E5            [11]  120 	push	hl
   5253 21 00 C0      [10]  121 	ld	hl,#0xC000
   5256 E5            [11]  122 	push	hl
   5257 21 2C 28      [10]  123 	ld	hl,#0x282C
   525A E5            [11]  124 	push	hl
   525B 2E 00         [ 7]  125 	ld	l, #0x00
   525D E5            [11]  126 	push	hl
   525E AF            [ 4]  127 	xor	a, a
   525F F5            [11]  128 	push	af
   5260 33            [ 6]  129 	inc	sp
   5261 CD 4F 48      [17]  130 	call	_cpct_etm_drawTileBox2x4
   5264 C9            [10]  131 	ret
                            132 ;src/main.c:51: void dibujarProta() {
                            133 ;	---------------------------------
                            134 ; Function dibujarProta
                            135 ; ---------------------------------
   5265                     136 _dibujarProta::
                            137 ;src/main.c:52: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   5265 21 47 52      [10]  138 	ld	hl, #_prota + 1
   5268 56            [ 7]  139 	ld	d,(hl)
   5269 21 46 52      [10]  140 	ld	hl, #_prota + 0
   526C 46            [ 7]  141 	ld	b,(hl)
   526D D5            [11]  142 	push	de
   526E 33            [ 6]  143 	inc	sp
   526F C5            [11]  144 	push	bc
   5270 33            [ 6]  145 	inc	sp
   5271 21 00 C0      [10]  146 	ld	hl,#0xC000
   5274 E5            [11]  147 	push	hl
   5275 CD EB 51      [17]  148 	call	_cpct_getScreenPtr
   5278 EB            [ 4]  149 	ex	de,hl
                            150 ;src/main.c:53: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   5279 ED 4B 4A 52   [20]  151 	ld	bc, (#_prota + 4)
   527D 21 00 01      [10]  152 	ld	hl,#_g_tablatrans
   5280 E5            [11]  153 	push	hl
   5281 21 08 1B      [10]  154 	ld	hl,#0x1B08
   5284 E5            [11]  155 	push	hl
   5285 D5            [11]  156 	push	de
   5286 C5            [11]  157 	push	bc
   5287 CD 0B 52      [17]  158 	call	_cpct_drawSpriteMaskedAlignedTable
   528A C9            [10]  159 	ret
                            160 ;src/main.c:56: void borrarProta() {
                            161 ;	---------------------------------
                            162 ; Function borrarProta
                            163 ; ---------------------------------
   528B                     164 _borrarProta::
   528B DD E5         [15]  165 	push	ix
   528D DD 21 00 00   [14]  166 	ld	ix,#0
   5291 DD 39         [15]  167 	add	ix,sp
   5293 3B            [ 6]  168 	dec	sp
                            169 ;src/main.c:57: u8 w = 4 + (prota.px & 1);
   5294 21 48 52      [10]  170 	ld	hl, #_prota + 2
   5297 4E            [ 7]  171 	ld	c,(hl)
   5298 79            [ 4]  172 	ld	a,c
   5299 E6 01         [ 7]  173 	and	a, #0x01
   529B 47            [ 4]  174 	ld	b,a
   529C 04            [ 4]  175 	inc	b
   529D 04            [ 4]  176 	inc	b
   529E 04            [ 4]  177 	inc	b
   529F 04            [ 4]  178 	inc	b
                            179 ;src/main.c:58: u8 h = 7 + (prota.py & 3 ? 1 : 0);
   52A0 21 49 52      [10]  180 	ld	hl, #_prota + 3
   52A3 5E            [ 7]  181 	ld	e,(hl)
   52A4 7B            [ 4]  182 	ld	a,e
   52A5 E6 03         [ 7]  183 	and	a, #0x03
   52A7 28 04         [12]  184 	jr	Z,00103$
   52A9 3E 01         [ 7]  185 	ld	a,#0x01
   52AB 18 02         [12]  186 	jr	00104$
   52AD                     187 00103$:
   52AD 3E 00         [ 7]  188 	ld	a,#0x00
   52AF                     189 00104$:
   52AF C6 07         [ 7]  190 	add	a, #0x07
   52B1 DD 77 FF      [19]  191 	ld	-1 (ix),a
                            192 ;src/main.c:59: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   52B4 FD 2A 4D 52   [20]  193 	ld	iy,(_mapa)
   52B8 16 00         [ 7]  194 	ld	d,#0x00
   52BA 63            [ 4]  195 	ld	h,e
   52BB 6A            [ 4]  196 	ld	l,d
   52BC CB 7A         [ 8]  197 	bit	7, d
   52BE 28 05         [12]  198 	jr	Z,00105$
   52C0 13            [ 6]  199 	inc	de
   52C1 13            [ 6]  200 	inc	de
   52C2 13            [ 6]  201 	inc	de
   52C3 63            [ 4]  202 	ld	h,e
   52C4 6A            [ 4]  203 	ld	l,d
   52C5                     204 00105$:
   52C5 5C            [ 4]  205 	ld	e, h
   52C6 55            [ 4]  206 	ld	d, l
   52C7 CB 2A         [ 8]  207 	sra	d
   52C9 CB 1B         [ 8]  208 	rr	e
   52CB CB 2A         [ 8]  209 	sra	d
   52CD CB 1B         [ 8]  210 	rr	e
   52CF 51            [ 4]  211 	ld	d,c
   52D0 CB 3A         [ 8]  212 	srl	d
   52D2 FD E5         [15]  213 	push	iy
   52D4 21 00 C0      [10]  214 	ld	hl,#0xC000
   52D7 E5            [11]  215 	push	hl
   52D8 3E 28         [ 7]  216 	ld	a,#0x28
   52DA F5            [11]  217 	push	af
   52DB 33            [ 6]  218 	inc	sp
   52DC DD 7E FF      [19]  219 	ld	a,-1 (ix)
   52DF F5            [11]  220 	push	af
   52E0 33            [ 6]  221 	inc	sp
   52E1 C5            [11]  222 	push	bc
   52E2 33            [ 6]  223 	inc	sp
   52E3 7B            [ 4]  224 	ld	a,e
   52E4 F5            [11]  225 	push	af
   52E5 33            [ 6]  226 	inc	sp
   52E6 D5            [11]  227 	push	de
   52E7 33            [ 6]  228 	inc	sp
   52E8 CD 4F 48      [17]  229 	call	_cpct_etm_drawTileBox2x4
   52EB 33            [ 6]  230 	inc	sp
   52EC DD E1         [14]  231 	pop	ix
   52EE C9            [10]  232 	ret
                            233 ;src/main.c:62: void redibujarProta() {
                            234 ;	---------------------------------
                            235 ; Function redibujarProta
                            236 ; ---------------------------------
   52EF                     237 _redibujarProta::
                            238 ;src/main.c:63: borrarProta();
   52EF CD 8B 52      [17]  239 	call	_borrarProta
                            240 ;src/main.c:64: prota.px = prota.x;
   52F2 01 48 52      [10]  241 	ld	bc,#_prota + 2
   52F5 3A 46 52      [13]  242 	ld	a, (#_prota + 0)
   52F8 02            [ 7]  243 	ld	(bc),a
                            244 ;src/main.c:65: prota.py = prota.y;
   52F9 01 49 52      [10]  245 	ld	bc,#_prota + 3
   52FC 3A 47 52      [13]  246 	ld	a, (#_prota + 1)
   52FF 02            [ 7]  247 	ld	(bc),a
                            248 ;src/main.c:66: dibujarProta();
   5300 C3 65 52      [10]  249 	jp  _dibujarProta
                            250 ;src/main.c:69: void moverIzquierda() {
                            251 ;	---------------------------------
                            252 ; Function moverIzquierda
                            253 ; ---------------------------------
   5303                     254 _moverIzquierda::
                            255 ;src/main.c:70: if (prota.x > 0) {
   5303 01 46 52      [10]  256 	ld	bc,#_prota+0
   5306 0A            [ 7]  257 	ld	a,(bc)
   5307 B7            [ 4]  258 	or	a, a
   5308 C8            [11]  259 	ret	Z
                            260 ;src/main.c:71: prota.x--;
   5309 C6 FF         [ 7]  261 	add	a,#0xFF
   530B 02            [ 7]  262 	ld	(bc),a
                            263 ;src/main.c:72: prota.mover  = SI;
   530C 21 4C 52      [10]  264 	ld	hl,#(_prota + 0x0006)
   530F 36 01         [10]  265 	ld	(hl),#0x01
   5311 C9            [10]  266 	ret
                            267 ;src/main.c:76: void moverDerecha() {
                            268 ;	---------------------------------
                            269 ; Function moverDerecha
                            270 ; ---------------------------------
   5312                     271 _moverDerecha::
                            272 ;src/main.c:77: if (prota.x < LIMITE_DERECHO) {
   5312 21 46 52      [10]  273 	ld	hl,#_prota+0
   5315 4E            [ 7]  274 	ld	c,(hl)
   5316 79            [ 4]  275 	ld	a,c
   5317 D6 48         [ 7]  276 	sub	a, #0x48
   5319 D0            [11]  277 	ret	NC
                            278 ;src/main.c:78: prota.x++;
   531A 0C            [ 4]  279 	inc	c
   531B 71            [ 7]  280 	ld	(hl),c
                            281 ;src/main.c:79: prota.mover  = SI;
   531C 21 4C 52      [10]  282 	ld	hl,#(_prota + 0x0006)
   531F 36 01         [10]  283 	ld	(hl),#0x01
   5321 C9            [10]  284 	ret
                            285 ;src/main.c:83: void moverArriba() {
                            286 ;	---------------------------------
                            287 ; Function moverArriba
                            288 ; ---------------------------------
   5322                     289 _moverArriba::
                            290 ;src/main.c:84: if (prota.y > 0) {
   5322 01 47 52      [10]  291 	ld	bc,#_prota + 1
   5325 0A            [ 7]  292 	ld	a,(bc)
   5326 B7            [ 4]  293 	or	a, a
   5327 C8            [11]  294 	ret	Z
                            295 ;src/main.c:85: prota.y--;
   5328 C6 FF         [ 7]  296 	add	a,#0xFF
   532A 02            [ 7]  297 	ld	(bc),a
                            298 ;src/main.c:86: prota.mover  = SI;
   532B 21 4C 52      [10]  299 	ld	hl,#(_prota + 0x0006)
   532E 36 01         [10]  300 	ld	(hl),#0x01
   5330 C9            [10]  301 	ret
                            302 ;src/main.c:90: void moverAbajo() {
                            303 ;	---------------------------------
                            304 ; Function moverAbajo
                            305 ; ---------------------------------
   5331                     306 _moverAbajo::
                            307 ;src/main.c:91: prota.y++;
   5331 01 47 52      [10]  308 	ld	bc,#_prota + 1
   5334 0A            [ 7]  309 	ld	a,(bc)
   5335 3C            [ 4]  310 	inc	a
   5336 02            [ 7]  311 	ld	(bc),a
                            312 ;src/main.c:92: prota.mover  = SI;
   5337 21 4C 52      [10]  313 	ld	hl,#(_prota + 0x0006)
   533A 36 01         [10]  314 	ld	(hl),#0x01
   533C C9            [10]  315 	ret
                            316 ;src/main.c:95: void comprobarTeclado() {
                            317 ;	---------------------------------
                            318 ; Function comprobarTeclado
                            319 ; ---------------------------------
   533D                     320 _comprobarTeclado::
                            321 ;src/main.c:96: cpct_scanKeyboard_if();
   533D CD 1A 49      [17]  322 	call	_cpct_scanKeyboard_if
                            323 ;src/main.c:98: if (cpct_isAnyKeyPressed()) {
   5340 CD 0D 49      [17]  324 	call	_cpct_isAnyKeyPressed
   5343 7D            [ 4]  325 	ld	a,l
   5344 B7            [ 4]  326 	or	a, a
   5345 C8            [11]  327 	ret	Z
                            328 ;src/main.c:99: if (cpct_isKeyPressed(Key_CursorLeft))
   5346 21 01 01      [10]  329 	ld	hl,#0x0101
   5349 CD 43 48      [17]  330 	call	_cpct_isKeyPressed
   534C 7D            [ 4]  331 	ld	a,l
   534D B7            [ 4]  332 	or	a, a
                            333 ;src/main.c:100: moverIzquierda();
   534E C2 03 53      [10]  334 	jp	NZ,_moverIzquierda
                            335 ;src/main.c:101: else if (cpct_isKeyPressed(Key_CursorRight))
   5351 21 00 02      [10]  336 	ld	hl,#0x0200
   5354 CD 43 48      [17]  337 	call	_cpct_isKeyPressed
   5357 7D            [ 4]  338 	ld	a,l
   5358 B7            [ 4]  339 	or	a, a
                            340 ;src/main.c:102: moverDerecha();
   5359 C2 12 53      [10]  341 	jp	NZ,_moverDerecha
                            342 ;src/main.c:103: else if (cpct_isKeyPressed(Key_CursorUp))
   535C 21 00 01      [10]  343 	ld	hl,#0x0100
   535F CD 43 48      [17]  344 	call	_cpct_isKeyPressed
   5362 7D            [ 4]  345 	ld	a,l
   5363 B7            [ 4]  346 	or	a, a
                            347 ;src/main.c:104: moverArriba();
   5364 C2 22 53      [10]  348 	jp	NZ,_moverArriba
                            349 ;src/main.c:105: else if (cpct_isKeyPressed(Key_CursorDown))
   5367 21 00 04      [10]  350 	ld	hl,#0x0400
   536A CD 43 48      [17]  351 	call	_cpct_isKeyPressed
   536D 7D            [ 4]  352 	ld	a,l
   536E B7            [ 4]  353 	or	a, a
   536F C8            [11]  354 	ret	Z
                            355 ;src/main.c:106: moverAbajo();
   5370 C3 31 53      [10]  356 	jp  _moverAbajo
                            357 ;src/main.c:110: void inicializar() {
                            358 ;	---------------------------------
                            359 ; Function inicializar
                            360 ; ---------------------------------
   5373                     361 _inicializar::
                            362 ;src/main.c:111: cpct_disableFirmware();
   5373 CD B9 51      [17]  363 	call	_cpct_disableFirmware
                            364 ;src/main.c:112: cpct_setVideoMode(0);
   5376 2E 00         [ 7]  365 	ld	l,#0x00
   5378 CD 82 49      [17]  366 	call	_cpct_setVideoMode
                            367 ;src/main.c:114: cpct_setPalette(g_palette, 16);
   537B 21 10 00      [10]  368 	ld	hl,#0x0010
   537E E5            [11]  369 	push	hl
   537F 21 44 47      [10]  370 	ld	hl,#_g_palette
   5382 E5            [11]  371 	push	hl
   5383 CD 2C 48      [17]  372 	call	_cpct_setPalette
                            373 ;src/main.c:115: cpct_akp_musicInit(G_song);
   5386 21 00 02      [10]  374 	ld	hl,#_G_song
   5389 E5            [11]  375 	push	hl
   538A CD 95 50      [17]  376 	call	_cpct_akp_musicInit
   538D F1            [10]  377 	pop	af
                            378 ;src/main.c:116: mapa = g_map1;
   538E 21 00 40      [10]  379 	ld	hl,#_g_map1+0
   5391 22 4D 52      [16]  380 	ld	(_mapa),hl
                            381 ;src/main.c:117: cpct_etm_setTileset2x4(g_tileset);
   5394 21 E0 46      [10]  382 	ld	hl,#_g_tileset
   5397 CD DE 48      [17]  383 	call	_cpct_etm_setTileset2x4
                            384 ;src/main.c:118: dibujarMapa();
   539A CD 4F 52      [17]  385 	call	_dibujarMapa
                            386 ;src/main.c:121: prota.x = prota.px = 15;
   539D 21 48 52      [10]  387 	ld	hl,#(_prota + 0x0002)
   53A0 36 0F         [10]  388 	ld	(hl),#0x0F
   53A2 21 46 52      [10]  389 	ld	hl,#_prota
   53A5 36 0F         [10]  390 	ld	(hl),#0x0F
                            391 ;src/main.c:122: prota.y = prota.py = 120;
   53A7 21 49 52      [10]  392 	ld	hl,#(_prota + 0x0003)
   53AA 36 78         [10]  393 	ld	(hl),#0x78
   53AC 21 47 52      [10]  394 	ld	hl,#(_prota + 0x0001)
   53AF 36 78         [10]  395 	ld	(hl),#0x78
                            396 ;src/main.c:123: prota.mover  = NO;
   53B1 21 4C 52      [10]  397 	ld	hl,#(_prota + 0x0006)
   53B4 36 00         [10]  398 	ld	(hl),#0x00
                            399 ;src/main.c:124: prota.sprite = g_hero;
   53B6 21 54 47      [10]  400 	ld	hl,#_g_hero
   53B9 22 4A 52      [16]  401 	ld	((_prota + 0x0004)), hl
                            402 ;src/main.c:125: dibujarProta();
   53BC CD 65 52      [17]  403 	call	_dibujarProta
   53BF C9            [10]  404 	ret
                            405 ;src/main.c:129: void main(void) {
                            406 ;	---------------------------------
                            407 ; Function main
                            408 ; ---------------------------------
   53C0                     409 _main::
                            410 ;src/main.c:130: inicializar();
   53C0 CD 73 53      [17]  411 	call	_inicializar
                            412 ;src/main.c:131: while (1) {
   53C3                     413 00104$:
                            414 ;src/main.c:132: comprobarTeclado();
   53C3 CD 3D 53      [17]  415 	call	_comprobarTeclado
                            416 ;src/main.c:133: cpct_akp_musicPlay();
   53C6 CD 92 49      [17]  417 	call	_cpct_akp_musicPlay
                            418 ;src/main.c:134: if (prota.mover) {
   53C9 3A 4C 52      [13]  419 	ld	a, (#(_prota + 0x0006) + 0)
   53CC B7            [ 4]  420 	or	a, a
   53CD 28 F4         [12]  421 	jr	Z,00104$
                            422 ;src/main.c:135: redibujarProta();
   53CF CD EF 52      [17]  423 	call	_redibujarProta
                            424 ;src/main.c:136: prota.mover = NO;
   53D2 21 4C 52      [10]  425 	ld	hl,#(_prota + 0x0006)
   53D5 36 00         [10]  426 	ld	(hl),#0x00
   53D7 18 EA         [12]  427 	jr	00104$
                            428 	.area _CODE
                            429 	.area _INITIALIZER
                            430 	.area _CABS (ABS)
   0200                     431 	.org 0x0200
   0200                     432 _G_song:
   0200 41                  433 	.db #0x41	; 65	'A'
   0201 54                  434 	.db #0x54	; 84	'T'
   0202 31                  435 	.db #0x31	; 49	'1'
   0203 30                  436 	.db #0x30	; 48	'0'
   0204 01                  437 	.db #0x01	; 1
   0205 40                  438 	.db #0x40	; 64
   0206 42                  439 	.db #0x42	; 66	'B'
   0207 0F                  440 	.db #0x0F	; 15
   0208 02                  441 	.db #0x02	; 2
   0209 06                  442 	.db #0x06	; 6
   020A 1D                  443 	.db #0x1D	; 29
   020B 00                  444 	.db #0x00	; 0
   020C 10                  445 	.db #0x10	; 16
   020D 40                  446 	.db #0x40	; 64
   020E 19                  447 	.db #0x19	; 25
   020F 40                  448 	.db #0x40	; 64
   0210 00                  449 	.db #0x00	; 0
   0211 00                  450 	.db #0x00	; 0
   0212 00                  451 	.db #0x00	; 0
   0213 00                  452 	.db #0x00	; 0
   0214 00                  453 	.db #0x00	; 0
   0215 00                  454 	.db #0x00	; 0
   0216 0D                  455 	.db #0x0D	; 13
   0217 12                  456 	.db #0x12	; 18
   0218 40                  457 	.db #0x40	; 64
   0219 01                  458 	.db #0x01	; 1
   021A 00                  459 	.db #0x00	; 0
   021B 7C                  460 	.db #0x7C	; 124
   021C 18                  461 	.db #0x18	; 24
   021D 78                  462 	.db #0x78	; 120	'x'
   021E 0C                  463 	.db #0x0C	; 12
   021F 34                  464 	.db #0x34	; 52	'4'
   0220 30                  465 	.db #0x30	; 48	'0'
   0221 2C                  466 	.db #0x2C	; 44
   0222 28                  467 	.db #0x28	; 40
   0223 24                  468 	.db #0x24	; 36
   0224 20                  469 	.db #0x20	; 32
   0225 1C                  470 	.db #0x1C	; 28
   0226 0D                  471 	.db #0x0D	; 13
   0227 25                  472 	.db #0x25	; 37
   0228 40                  473 	.db #0x40	; 64
   0229 20                  474 	.db #0x20	; 32
   022A 00                  475 	.db #0x00	; 0
   022B 00                  476 	.db #0x00	; 0
   022C 00                  477 	.db #0x00	; 0
   022D 39                  478 	.db #0x39	; 57	'9'
   022E 40                  479 	.db #0x40	; 64
   022F 00                  480 	.db #0x00	; 0
   0230 57                  481 	.db #0x57	; 87	'W'
   0231 40                  482 	.db #0x40	; 64
   0232 3B                  483 	.db #0x3B	; 59
   0233 40                  484 	.db #0x40	; 64
   0234 57                  485 	.db #0x57	; 87	'W'
   0235 40                  486 	.db #0x40	; 64
   0236 01                  487 	.db #0x01	; 1
   0237 2F                  488 	.db #0x2F	; 47
   0238 40                  489 	.db #0x40	; 64
   0239 19                  490 	.db #0x19	; 25
   023A 00                  491 	.db #0x00	; 0
   023B 76                  492 	.db #0x76	; 118	'v'
   023C E1                  493 	.db #0xE1	; 225
   023D 00                  494 	.db #0x00	; 0
   023E 00                  495 	.db #0x00	; 0
   023F 01                  496 	.db #0x01	; 1
   0240 04                  497 	.db #0x04	; 4
   0241 51                  498 	.db #0x51	; 81	'Q'
   0242 04                  499 	.db #0x04	; 4
   0243 37                  500 	.db #0x37	; 55	'7'
   0244 04                  501 	.db #0x04	; 4
   0245 4F                  502 	.db #0x4F	; 79	'O'
   0246 04                  503 	.db #0x04	; 4
   0247 37                  504 	.db #0x37	; 55	'7'
   0248 02                  505 	.db #0x02	; 2
   0249 4B                  506 	.db #0x4B	; 75	'K'
   024A 02                  507 	.db #0x02	; 2
   024B 37                  508 	.db #0x37	; 55	'7'
   024C 04                  509 	.db #0x04	; 4
   024D 4F                  510 	.db #0x4F	; 79	'O'
   024E 04                  511 	.db #0x04	; 4
   024F 37                  512 	.db #0x37	; 55	'7'
   0250 04                  513 	.db #0x04	; 4
   0251 4F                  514 	.db #0x4F	; 79	'O'
   0252 04                  515 	.db #0x04	; 4
   0253 37                  516 	.db #0x37	; 55	'7'
   0254 02                  517 	.db #0x02	; 2
   0255 4B                  518 	.db #0x4B	; 75	'K'
   0256 00                  519 	.db #0x00	; 0
   0257 42                  520 	.db #0x42	; 66	'B'
   0258 60                  521 	.db #0x60	; 96
   0259 00                  522 	.db #0x00	; 0
   025A 42                  523 	.db #0x42	; 66	'B'
   025B 80                  524 	.db #0x80	; 128
   025C 00                  525 	.db #0x00	; 0
   025D 00                  526 	.db #0x00	; 0
   025E 42                  527 	.db #0x42	; 66	'B'
   025F 00                  528 	.db #0x00	; 0
   0260 00                  529 	.db #0x00	; 0
