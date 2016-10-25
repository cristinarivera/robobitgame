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
                             11 	.globl _main
                             12 	.globl _inicializarJuego
                             13 	.globl _inicializarCPC
                             14 	.globl _intHandler
                             15 	.globl _moverAbajo
                             16 	.globl _moverArriba
                             17 	.globl _moverDerecha
                             18 	.globl _moverIzquierda
                             19 	.globl _avanzarMapa
                             20 	.globl _inicializarEnemy
                             21 	.globl _updateEnemy
                             22 	.globl _engage
                             23 	.globl _moverEnemigoSeek
                             24 	.globl _lookFor
                             25 	.globl _moverEnemigoPatrol
                             26 	.globl _moverEnemigoIzquierda
                             27 	.globl _moverEnemigoDerecha
                             28 	.globl _moverEnemigoAbajo
                             29 	.globl _moverEnemigoArriba
                             30 	.globl _checkEnemyCollision
                             31 	.globl _redibujarEnemigo
                             32 	.globl _borrarEnemigo
                             33 	.globl _borrarExplosion
                             34 	.globl _dibujarExplosion
                             35 	.globl _dibujarEnemigo
                             36 	.globl _checkCollision
                             37 	.globl _comprobarTeclado
                             38 	.globl _redibujarProta
                             39 	.globl _borrarProta
                             40 	.globl _dibujarProta
                             41 	.globl _dibujarMapa
                             42 	.globl _play
                             43 	.globl _pathFinding
                             44 	.globl _moverCuchillo
                             45 	.globl _lanzarCuchillo
                             46 	.globl _redibujarCuchillo
                             47 	.globl _borrarCuchillo
                             48 	.globl _abs
                             49 	.globl _getTilePtr
                             50 	.globl _barraPuntuacionInicial
                             51 	.globl _menuInicio
                             52 	.globl _menuFin
                             53 	.globl _cpct_etm_setTileset2x4
                             54 	.globl _cpct_etm_drawTileBox2x4
                             55 	.globl _cpct_getScreenPtr
                             56 	.globl _cpct_setPALColour
                             57 	.globl _cpct_setPalette
                             58 	.globl _cpct_waitVSYNC
                             59 	.globl _cpct_setVideoMode
                             60 	.globl _cpct_drawSpriteMaskedAlignedTable
                             61 	.globl _cpct_isAnyKeyPressed
                             62 	.globl _cpct_isKeyPressed
                             63 	.globl _cpct_scanKeyboard_if
                             64 	.globl _cpct_disableFirmware
                             65 	.globl _vidas
                             66 	.globl _puntuacion
                             67 	.globl _num_mapa
                             68 	.globl _mapa
                             69 	.globl _i
                             70 	.globl _cu
                             71 	.globl _prota
                             72 	.globl _enemy
                             73 	.globl _patrolY
                             74 	.globl _patrolX
                             75 	.globl _spawnY
                             76 	.globl _spawnX
                             77 	.globl _mapas
                             78 ;--------------------------------------------------------
                             79 ; special function registers
                             80 ;--------------------------------------------------------
                             81 ;--------------------------------------------------------
                             82 ; ram data
                             83 ;--------------------------------------------------------
                             84 	.area _DATA
   5F70                      85 _enemy::
   5F70                      86 	.ds 904
   62F8                      87 _prota::
   62F8                      88 	.ds 8
   6300                      89 _cu::
   6300                      90 	.ds 11
   630B                      91 _i::
   630B                      92 	.ds 1
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   63D5                      97 _mapa::
   63D5                      98 	.ds 2
   63D7                      99 _num_mapa::
   63D7                     100 	.ds 1
   63D8                     101 _puntuacion::
   63D8                     102 	.ds 1
   63D9                     103 _vidas::
   63D9                     104 	.ds 1
                            105 ;--------------------------------------------------------
                            106 ; absolute external ram data
                            107 ;--------------------------------------------------------
                            108 	.area _DABS (ABS)
                            109 ;--------------------------------------------------------
                            110 ; global & static initialisations
                            111 ;--------------------------------------------------------
                            112 	.area _HOME
                            113 	.area _GSINIT
                            114 	.area _GSFINAL
                            115 	.area _GSINIT
                            116 ;--------------------------------------------------------
                            117 ; Home
                            118 ;--------------------------------------------------------
                            119 	.area _HOME
                            120 	.area _HOME
                            121 ;--------------------------------------------------------
                            122 ; code
                            123 ;--------------------------------------------------------
                            124 	.area _CODE
                            125 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            126 ;	---------------------------------
                            127 ; Function dummy_cpct_transparentMaskTable0M0_container
                            128 ; ---------------------------------
   444C                     129 _dummy_cpct_transparentMaskTable0M0_container::
                            130 	.area _g_tablatrans_ (ABS) 
   0100                     131 	.org 0x0100 
   0100                     132 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   133 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   138 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   141 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            165 	.area _CSEG (REL, CON) 
                            166 ;src/main.c:111: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   63DF                     170 _dibujarMapa::
                            171 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   63DF 2A D5 63      [16]  172 	ld	hl,(_mapa)
   63E2 E5            [11]  173 	push	hl
   63E3 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   63E6 E5            [11]  175 	push	hl
   63E7 21 2C 28      [10]  176 	ld	hl,#0x282C
   63EA E5            [11]  177 	push	hl
   63EB 2E 00         [ 7]  178 	ld	l, #0x00
   63ED E5            [11]  179 	push	hl
   63EE AF            [ 4]  180 	xor	a, a
   63EF F5            [11]  181 	push	af
   63F0 33            [ 6]  182 	inc	sp
   63F1 CD F7 53      [17]  183 	call	_cpct_etm_drawTileBox2x4
   63F4 C9            [10]  184 	ret
   63F5                     185 _mapas:
   63F5 C0 10               186 	.dw _g_map1
   63F7 E0 09               187 	.dw _g_map2
   63F9 00 03               188 	.dw _g_map3
   63FB                     189 _spawnX:
   63FB 24                  190 	.db #0x24	; 36
   63FC 47                  191 	.db #0x47	; 71	'G'
   63FD 32                  192 	.db #0x32	; 50	'2'
   63FE 18                  193 	.db #0x18	; 24
   63FF                     194 _spawnY:
   63FF 5A                  195 	.db #0x5A	; 90	'Z'
   6400 72                  196 	.db #0x72	; 114	'r'
   6401 9A                  197 	.db #0x9A	; 154
   6402 68                  198 	.db #0x68	; 104	'h'
   6403                     199 _patrolX:
   6403 00                  200 	.db #0x00	; 0
   6404 00                  201 	.db #0x00	; 0
   6405 00                  202 	.db #0x00	; 0
   6406 00                  203 	.db #0x00	; 0
   6407 00                  204 	.db #0x00	; 0
   6408 14                  205 	.db #0x14	; 20
   6409 47                  206 	.db #0x47	; 71	'G'
   640A 00                  207 	.db #0x00	; 0
   640B 00                  208 	.db #0x00	; 0
   640C 00                  209 	.db 0x00
   640D 00                  210 	.db #0x00	; 0
   640E 00                  211 	.db #0x00	; 0
   640F 00                  212 	.db #0x00	; 0
   6410 00                  213 	.db #0x00	; 0
   6411 00                  214 	.db 0x00
   6412 00                  215 	.db #0x00	; 0
   6413 00                  216 	.db #0x00	; 0
   6414 00                  217 	.db #0x00	; 0
   6415 00                  218 	.db #0x00	; 0
   6416 00                  219 	.db 0x00
   6417                     220 _patrolY:
   6417 00                  221 	.db #0x00	; 0
   6418 00                  222 	.db #0x00	; 0
   6419 00                  223 	.db #0x00	; 0
   641A 00                  224 	.db #0x00	; 0
   641B 00                  225 	.db 0x00
   641C 5A                  226 	.db #0x5A	; 90	'Z'
   641D 9C                  227 	.db #0x9C	; 156
   641E 00                  228 	.db #0x00	; 0
   641F 00                  229 	.db #0x00	; 0
   6420 00                  230 	.db 0x00
   6421 00                  231 	.db #0x00	; 0
   6422 00                  232 	.db #0x00	; 0
   6423 00                  233 	.db #0x00	; 0
   6424 00                  234 	.db #0x00	; 0
   6425 00                  235 	.db 0x00
   6426 00                  236 	.db #0x00	; 0
   6427 00                  237 	.db #0x00	; 0
   6428 00                  238 	.db #0x00	; 0
   6429 00                  239 	.db #0x00	; 0
   642A 00                  240 	.db 0x00
                            241 ;src/main.c:117: void dibujarProta() {
                            242 ;	---------------------------------
                            243 ; Function dibujarProta
                            244 ; ---------------------------------
   642B                     245 _dibujarProta::
                            246 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   642B 21 F9 62      [10]  247 	ld	hl, #_prota + 1
   642E 56            [ 7]  248 	ld	d,(hl)
   642F 21 F8 62      [10]  249 	ld	hl, #_prota + 0
   6432 46            [ 7]  250 	ld	b,(hl)
   6433 D5            [11]  251 	push	de
   6434 33            [ 6]  252 	inc	sp
   6435 C5            [11]  253 	push	bc
   6436 33            [ 6]  254 	inc	sp
   6437 21 00 C0      [10]  255 	ld	hl,#0xC000
   643A E5            [11]  256 	push	hl
   643B CD 15 5F      [17]  257 	call	_cpct_getScreenPtr
   643E EB            [ 4]  258 	ex	de,hl
                            259 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   643F ED 4B FC 62   [20]  260 	ld	bc, (#_prota + 4)
   6443 21 00 01      [10]  261 	ld	hl,#_g_tablatrans
   6446 E5            [11]  262 	push	hl
   6447 21 07 16      [10]  263 	ld	hl,#0x1607
   644A E5            [11]  264 	push	hl
   644B D5            [11]  265 	push	de
   644C C5            [11]  266 	push	bc
   644D CD 35 5F      [17]  267 	call	_cpct_drawSpriteMaskedAlignedTable
   6450 C9            [10]  268 	ret
                            269 ;src/main.c:122: void borrarProta() {
                            270 ;	---------------------------------
                            271 ; Function borrarProta
                            272 ; ---------------------------------
   6451                     273 _borrarProta::
   6451 DD E5         [15]  274 	push	ix
   6453 DD 21 00 00   [14]  275 	ld	ix,#0
   6457 DD 39         [15]  276 	add	ix,sp
   6459 F5            [11]  277 	push	af
   645A 3B            [ 6]  278 	dec	sp
                            279 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   645B 21 FA 62      [10]  280 	ld	hl, #_prota + 2
   645E 4E            [ 7]  281 	ld	c,(hl)
   645F 79            [ 4]  282 	ld	a,c
   6460 E6 01         [ 7]  283 	and	a, #0x01
   6462 47            [ 4]  284 	ld	b,a
   6463 04            [ 4]  285 	inc	b
   6464 04            [ 4]  286 	inc	b
   6465 04            [ 4]  287 	inc	b
   6466 04            [ 4]  288 	inc	b
                            289 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6467 21 FB 62      [10]  290 	ld	hl, #_prota + 3
   646A 5E            [ 7]  291 	ld	e,(hl)
   646B CB 4B         [ 8]  292 	bit	1, e
   646D 28 04         [12]  293 	jr	Z,00103$
   646F 3E 01         [ 7]  294 	ld	a,#0x01
   6471 18 02         [12]  295 	jr	00104$
   6473                     296 00103$:
   6473 3E 00         [ 7]  297 	ld	a,#0x00
   6475                     298 00104$:
   6475 C6 06         [ 7]  299 	add	a, #0x06
   6477 DD 77 FD      [19]  300 	ld	-3 (ix),a
                            301 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   647A FD 2A D5 63   [20]  302 	ld	iy,(_mapa)
   647E 16 00         [ 7]  303 	ld	d,#0x00
   6480 7B            [ 4]  304 	ld	a,e
   6481 C6 E8         [ 7]  305 	add	a,#0xE8
   6483 DD 77 FE      [19]  306 	ld	-2 (ix),a
   6486 7A            [ 4]  307 	ld	a,d
   6487 CE FF         [ 7]  308 	adc	a,#0xFF
   6489 DD 77 FF      [19]  309 	ld	-1 (ix),a
   648C DD 6E FE      [19]  310 	ld	l,-2 (ix)
   648F DD 66 FF      [19]  311 	ld	h,-1 (ix)
   6492 DD CB FF 7E   [20]  312 	bit	7, -1 (ix)
   6496 28 04         [12]  313 	jr	Z,00105$
   6498 21 EB FF      [10]  314 	ld	hl,#0xFFEB
   649B 19            [11]  315 	add	hl,de
   649C                     316 00105$:
   649C CB 2C         [ 8]  317 	sra	h
   649E CB 1D         [ 8]  318 	rr	l
   64A0 CB 2C         [ 8]  319 	sra	h
   64A2 CB 1D         [ 8]  320 	rr	l
   64A4 55            [ 4]  321 	ld	d,l
   64A5 CB 39         [ 8]  322 	srl	c
   64A7 FD E5         [15]  323 	push	iy
   64A9 21 F0 C0      [10]  324 	ld	hl,#0xC0F0
   64AC E5            [11]  325 	push	hl
   64AD 3E 28         [ 7]  326 	ld	a,#0x28
   64AF F5            [11]  327 	push	af
   64B0 33            [ 6]  328 	inc	sp
   64B1 DD 7E FD      [19]  329 	ld	a,-3 (ix)
   64B4 F5            [11]  330 	push	af
   64B5 33            [ 6]  331 	inc	sp
   64B6 C5            [11]  332 	push	bc
   64B7 33            [ 6]  333 	inc	sp
   64B8 D5            [11]  334 	push	de
   64B9 33            [ 6]  335 	inc	sp
   64BA 79            [ 4]  336 	ld	a,c
   64BB F5            [11]  337 	push	af
   64BC 33            [ 6]  338 	inc	sp
   64BD CD F7 53      [17]  339 	call	_cpct_etm_drawTileBox2x4
   64C0 DD F9         [10]  340 	ld	sp, ix
   64C2 DD E1         [14]  341 	pop	ix
   64C4 C9            [10]  342 	ret
                            343 ;src/main.c:134: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   64C5                     347 _redibujarProta::
                            348 ;src/main.c:135: borrarProta();
   64C5 CD 51 64      [17]  349 	call	_borrarProta
                            350 ;src/main.c:136: prota.px = prota.x;
   64C8 01 FA 62      [10]  351 	ld	bc,#_prota + 2
   64CB 3A F8 62      [13]  352 	ld	a, (#_prota + 0)
   64CE 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:137: prota.py = prota.y;
   64CF 01 FB 62      [10]  355 	ld	bc,#_prota + 3
   64D2 3A F9 62      [13]  356 	ld	a, (#_prota + 1)
   64D5 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:138: dibujarProta();
   64D6 C3 2B 64      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            361 ;	---------------------------------
                            362 ; Function comprobarTeclado
                            363 ; ---------------------------------
   64D9                     364 _comprobarTeclado::
                            365 ;src/main.c:142: cpct_scanKeyboard_if();
   64D9 CD 4F 55      [17]  366 	call	_cpct_scanKeyboard_if
                            367 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   64DC CD 42 55      [17]  368 	call	_cpct_isAnyKeyPressed
   64DF 7D            [ 4]  369 	ld	a,l
   64E0 B7            [ 4]  370 	or	a, a
   64E1 C8            [11]  371 	ret	Z
                            372 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   64E2 21 01 01      [10]  373 	ld	hl,#0x0101
   64E5 CD 16 53      [17]  374 	call	_cpct_isKeyPressed
   64E8 7D            [ 4]  375 	ld	a,l
   64E9 B7            [ 4]  376 	or	a, a
                            377 ;src/main.c:146: moverIzquierda();
   64EA C2 48 7B      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64ED 21 00 02      [10]  380 	ld	hl,#0x0200
   64F0 CD 16 53      [17]  381 	call	_cpct_isKeyPressed
   64F3 7D            [ 4]  382 	ld	a,l
   64F4 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:148: moverDerecha();
   64F5 C2 6D 7B      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64F8 21 00 01      [10]  387 	ld	hl,#0x0100
   64FB CD 16 53      [17]  388 	call	_cpct_isKeyPressed
   64FE 7D            [ 4]  389 	ld	a,l
   64FF B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:150: moverArriba();
   6500 C2 B2 7B      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6503 21 00 04      [10]  394 	ld	hl,#0x0400
   6506 CD 16 53      [17]  395 	call	_cpct_isKeyPressed
   6509 7D            [ 4]  396 	ld	a,l
   650A B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:152: moverAbajo();
   650B C2 D6 7B      [10]  399 	jp	NZ,_moverAbajo
                            400 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   650E 21 05 80      [10]  401 	ld	hl,#0x8005
   6511 CD 16 53      [17]  402 	call	_cpct_isKeyPressed
   6514 7D            [ 4]  403 	ld	a,l
   6515 B7            [ 4]  404 	or	a, a
   6516 C8            [11]  405 	ret	Z
                            406 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6517 21 08 00      [10]  407 	ld	hl, #8
   651A 39            [11]  408 	add	hl, sp
   651B 4E            [ 7]  409 	ld	c, (hl)
   651C 23            [ 6]  410 	inc	hl
   651D 46            [ 7]  411 	ld	b, (hl)
   651E C5            [11]  412 	push	bc
   651F 21 08 00      [10]  413 	ld	hl, #8
   6522 39            [11]  414 	add	hl, sp
   6523 4E            [ 7]  415 	ld	c, (hl)
   6524 23            [ 6]  416 	inc	hl
   6525 46            [ 7]  417 	ld	b, (hl)
   6526 C5            [11]  418 	push	bc
   6527 21 08 00      [10]  419 	ld	hl, #8
   652A 39            [11]  420 	add	hl, sp
   652B 4E            [ 7]  421 	ld	c, (hl)
   652C 23            [ 6]  422 	inc	hl
   652D 46            [ 7]  423 	ld	b, (hl)
   652E C5            [11]  424 	push	bc
   652F 21 08 00      [10]  425 	ld	hl, #8
   6532 39            [11]  426 	add	hl, sp
   6533 4E            [ 7]  427 	ld	c, (hl)
   6534 23            [ 6]  428 	inc	hl
   6535 46            [ 7]  429 	ld	b, (hl)
   6536 C5            [11]  430 	push	bc
   6537 CD 6C 40      [17]  431 	call	_lanzarCuchillo
   653A 21 08 00      [10]  432 	ld	hl,#8
   653D 39            [11]  433 	add	hl,sp
   653E F9            [ 6]  434 	ld	sp,hl
   653F C9            [10]  435 	ret
                            436 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            437 ;	---------------------------------
                            438 ; Function checkCollision
                            439 ; ---------------------------------
   6540                     440 _checkCollision::
   6540 DD E5         [15]  441 	push	ix
   6542 DD 21 00 00   [14]  442 	ld	ix,#0
   6546 DD 39         [15]  443 	add	ix,sp
   6548 F5            [11]  444 	push	af
                            445 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6549 21 00 00      [10]  446 	ld	hl,#0x0000
   654C E3            [19]  447 	ex	(sp), hl
   654D 11 00 00      [10]  448 	ld	de,#0x0000
   6550 01 00 00      [10]  449 	ld	bc,#0x0000
                            450 ;src/main.c:162: switch (direction) {
   6553 3E 03         [ 7]  451 	ld	a,#0x03
   6555 DD 96 04      [19]  452 	sub	a, 4 (ix)
   6558 DA 90 66      [10]  453 	jp	C,00105$
   655B DD 5E 04      [19]  454 	ld	e,4 (ix)
   655E 16 00         [ 7]  455 	ld	d,#0x00
   6560 21 67 65      [10]  456 	ld	hl,#00124$
   6563 19            [11]  457 	add	hl,de
   6564 19            [11]  458 	add	hl,de
   6565 19            [11]  459 	add	hl,de
   6566 E9            [ 4]  460 	jp	(hl)
   6567                     461 00124$:
   6567 C3 73 65      [10]  462 	jp	00101$
   656A C3 C8 65      [10]  463 	jp	00102$
   656D C3 18 66      [10]  464 	jp	00103$
   6570 C3 55 66      [10]  465 	jp	00104$
                            466 ;src/main.c:163: case 0:
   6573                     467 00101$:
                            468 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   6573 21 F9 62      [10]  469 	ld	hl, #(_prota + 0x0001) + 0
   6576 4E            [ 7]  470 	ld	c,(hl)
   6577 3A F8 62      [13]  471 	ld	a, (#_prota + 0)
   657A C6 07         [ 7]  472 	add	a, #0x07
   657C 47            [ 4]  473 	ld	b,a
   657D 79            [ 4]  474 	ld	a,c
   657E F5            [11]  475 	push	af
   657F 33            [ 6]  476 	inc	sp
   6580 C5            [11]  477 	push	bc
   6581 33            [ 6]  478 	inc	sp
   6582 2A D5 63      [16]  479 	ld	hl,(_mapa)
   6585 E5            [11]  480 	push	hl
   6586 CD 2C 4A      [17]  481 	call	_getTilePtr
   6589 F1            [10]  482 	pop	af
   658A F1            [10]  483 	pop	af
   658B 33            [ 6]  484 	inc	sp
   658C 33            [ 6]  485 	inc	sp
   658D E5            [11]  486 	push	hl
                            487 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   658E 3A F9 62      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   6591 C6 14         [ 7]  489 	add	a, #0x14
   6593 4F            [ 4]  490 	ld	c,a
   6594 3A F8 62      [13]  491 	ld	a, (#_prota + 0)
   6597 C6 07         [ 7]  492 	add	a, #0x07
   6599 47            [ 4]  493 	ld	b,a
   659A 79            [ 4]  494 	ld	a,c
   659B F5            [11]  495 	push	af
   659C 33            [ 6]  496 	inc	sp
   659D C5            [11]  497 	push	bc
   659E 33            [ 6]  498 	inc	sp
   659F 2A D5 63      [16]  499 	ld	hl,(_mapa)
   65A2 E5            [11]  500 	push	hl
   65A3 CD 2C 4A      [17]  501 	call	_getTilePtr
   65A6 F1            [10]  502 	pop	af
   65A7 F1            [10]  503 	pop	af
   65A8 EB            [ 4]  504 	ex	de,hl
                            505 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   65A9 3A F9 62      [13]  506 	ld	a, (#(_prota + 0x0001) + 0)
   65AC C6 0B         [ 7]  507 	add	a, #0x0B
   65AE 47            [ 4]  508 	ld	b,a
   65AF 3A F8 62      [13]  509 	ld	a, (#_prota + 0)
   65B2 C6 07         [ 7]  510 	add	a, #0x07
   65B4 D5            [11]  511 	push	de
   65B5 C5            [11]  512 	push	bc
   65B6 33            [ 6]  513 	inc	sp
   65B7 F5            [11]  514 	push	af
   65B8 33            [ 6]  515 	inc	sp
   65B9 2A D5 63      [16]  516 	ld	hl,(_mapa)
   65BC E5            [11]  517 	push	hl
   65BD CD 2C 4A      [17]  518 	call	_getTilePtr
   65C0 F1            [10]  519 	pop	af
   65C1 F1            [10]  520 	pop	af
   65C2 4D            [ 4]  521 	ld	c,l
   65C3 44            [ 4]  522 	ld	b,h
   65C4 D1            [10]  523 	pop	de
                            524 ;src/main.c:167: break;
   65C5 C3 90 66      [10]  525 	jp	00105$
                            526 ;src/main.c:168: case 1:
   65C8                     527 00102$:
                            528 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   65C8 21 F9 62      [10]  529 	ld	hl, #(_prota + 0x0001) + 0
   65CB 56            [ 7]  530 	ld	d,(hl)
   65CC 21 F8 62      [10]  531 	ld	hl, #_prota + 0
   65CF 46            [ 7]  532 	ld	b,(hl)
   65D0 05            [ 4]  533 	dec	b
   65D1 D5            [11]  534 	push	de
   65D2 33            [ 6]  535 	inc	sp
   65D3 C5            [11]  536 	push	bc
   65D4 33            [ 6]  537 	inc	sp
   65D5 2A D5 63      [16]  538 	ld	hl,(_mapa)
   65D8 E5            [11]  539 	push	hl
   65D9 CD 2C 4A      [17]  540 	call	_getTilePtr
   65DC F1            [10]  541 	pop	af
   65DD F1            [10]  542 	pop	af
   65DE 33            [ 6]  543 	inc	sp
   65DF 33            [ 6]  544 	inc	sp
   65E0 E5            [11]  545 	push	hl
                            546 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   65E1 3A F9 62      [13]  547 	ld	a, (#(_prota + 0x0001) + 0)
   65E4 C6 14         [ 7]  548 	add	a, #0x14
   65E6 57            [ 4]  549 	ld	d,a
   65E7 21 F8 62      [10]  550 	ld	hl, #_prota + 0
   65EA 46            [ 7]  551 	ld	b,(hl)
   65EB 05            [ 4]  552 	dec	b
   65EC D5            [11]  553 	push	de
   65ED 33            [ 6]  554 	inc	sp
   65EE C5            [11]  555 	push	bc
   65EF 33            [ 6]  556 	inc	sp
   65F0 2A D5 63      [16]  557 	ld	hl,(_mapa)
   65F3 E5            [11]  558 	push	hl
   65F4 CD 2C 4A      [17]  559 	call	_getTilePtr
   65F7 F1            [10]  560 	pop	af
   65F8 F1            [10]  561 	pop	af
   65F9 EB            [ 4]  562 	ex	de,hl
                            563 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   65FA 3A F9 62      [13]  564 	ld	a, (#(_prota + 0x0001) + 0)
   65FD C6 0B         [ 7]  565 	add	a, #0x0B
   65FF 47            [ 4]  566 	ld	b,a
   6600 3A F8 62      [13]  567 	ld	a, (#_prota + 0)
   6603 C6 FF         [ 7]  568 	add	a,#0xFF
   6605 D5            [11]  569 	push	de
   6606 C5            [11]  570 	push	bc
   6607 33            [ 6]  571 	inc	sp
   6608 F5            [11]  572 	push	af
   6609 33            [ 6]  573 	inc	sp
   660A 2A D5 63      [16]  574 	ld	hl,(_mapa)
   660D E5            [11]  575 	push	hl
   660E CD 2C 4A      [17]  576 	call	_getTilePtr
   6611 F1            [10]  577 	pop	af
   6612 F1            [10]  578 	pop	af
   6613 4D            [ 4]  579 	ld	c,l
   6614 44            [ 4]  580 	ld	b,h
   6615 D1            [10]  581 	pop	de
                            582 ;src/main.c:172: break;
   6616 18 78         [12]  583 	jr	00105$
                            584 ;src/main.c:173: case 2:
   6618                     585 00103$:
                            586 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6618 3A F9 62      [13]  587 	ld	a, (#(_prota + 0x0001) + 0)
   661B C6 FE         [ 7]  588 	add	a,#0xFE
   661D 21 F8 62      [10]  589 	ld	hl, #_prota + 0
   6620 56            [ 7]  590 	ld	d,(hl)
   6621 C5            [11]  591 	push	bc
   6622 F5            [11]  592 	push	af
   6623 33            [ 6]  593 	inc	sp
   6624 D5            [11]  594 	push	de
   6625 33            [ 6]  595 	inc	sp
   6626 2A D5 63      [16]  596 	ld	hl,(_mapa)
   6629 E5            [11]  597 	push	hl
   662A CD 2C 4A      [17]  598 	call	_getTilePtr
   662D F1            [10]  599 	pop	af
   662E F1            [10]  600 	pop	af
   662F C1            [10]  601 	pop	bc
   6630 33            [ 6]  602 	inc	sp
   6631 33            [ 6]  603 	inc	sp
   6632 E5            [11]  604 	push	hl
                            605 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6633 21 F9 62      [10]  606 	ld	hl, #(_prota + 0x0001) + 0
   6636 56            [ 7]  607 	ld	d,(hl)
   6637 15            [ 4]  608 	dec	d
   6638 15            [ 4]  609 	dec	d
   6639 3A F8 62      [13]  610 	ld	a, (#_prota + 0)
   663C C6 03         [ 7]  611 	add	a, #0x03
   663E C5            [11]  612 	push	bc
   663F D5            [11]  613 	push	de
   6640 33            [ 6]  614 	inc	sp
   6641 F5            [11]  615 	push	af
   6642 33            [ 6]  616 	inc	sp
   6643 2A D5 63      [16]  617 	ld	hl,(_mapa)
   6646 E5            [11]  618 	push	hl
   6647 CD 2C 4A      [17]  619 	call	_getTilePtr
   664A F1            [10]  620 	pop	af
   664B F1            [10]  621 	pop	af
   664C EB            [ 4]  622 	ex	de,hl
   664D C1            [10]  623 	pop	bc
                            624 ;src/main.c:176: *waistTile = 0;
   664E 21 00 00      [10]  625 	ld	hl,#0x0000
   6651 36 00         [10]  626 	ld	(hl),#0x00
                            627 ;src/main.c:177: break;
   6653 18 3B         [12]  628 	jr	00105$
                            629 ;src/main.c:178: case 3:
   6655                     630 00104$:
                            631 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6655 3A F9 62      [13]  632 	ld	a, (#(_prota + 0x0001) + 0)
   6658 C6 16         [ 7]  633 	add	a, #0x16
   665A 21 F8 62      [10]  634 	ld	hl, #_prota + 0
   665D 56            [ 7]  635 	ld	d,(hl)
   665E C5            [11]  636 	push	bc
   665F F5            [11]  637 	push	af
   6660 33            [ 6]  638 	inc	sp
   6661 D5            [11]  639 	push	de
   6662 33            [ 6]  640 	inc	sp
   6663 2A D5 63      [16]  641 	ld	hl,(_mapa)
   6666 E5            [11]  642 	push	hl
   6667 CD 2C 4A      [17]  643 	call	_getTilePtr
   666A F1            [10]  644 	pop	af
   666B F1            [10]  645 	pop	af
   666C C1            [10]  646 	pop	bc
   666D 33            [ 6]  647 	inc	sp
   666E 33            [ 6]  648 	inc	sp
   666F E5            [11]  649 	push	hl
                            650 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6670 3A F9 62      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   6673 C6 16         [ 7]  652 	add	a, #0x16
   6675 57            [ 4]  653 	ld	d,a
   6676 3A F8 62      [13]  654 	ld	a, (#_prota + 0)
   6679 C6 03         [ 7]  655 	add	a, #0x03
   667B C5            [11]  656 	push	bc
   667C D5            [11]  657 	push	de
   667D 33            [ 6]  658 	inc	sp
   667E F5            [11]  659 	push	af
   667F 33            [ 6]  660 	inc	sp
   6680 2A D5 63      [16]  661 	ld	hl,(_mapa)
   6683 E5            [11]  662 	push	hl
   6684 CD 2C 4A      [17]  663 	call	_getTilePtr
   6687 F1            [10]  664 	pop	af
   6688 F1            [10]  665 	pop	af
   6689 EB            [ 4]  666 	ex	de,hl
   668A C1            [10]  667 	pop	bc
                            668 ;src/main.c:181: *waistTile = 0;
   668B 21 00 00      [10]  669 	ld	hl,#0x0000
   668E 36 00         [10]  670 	ld	(hl),#0x00
                            671 ;src/main.c:183: }
   6690                     672 00105$:
                            673 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6690 E1            [10]  674 	pop	hl
   6691 E5            [11]  675 	push	hl
   6692 6E            [ 7]  676 	ld	l,(hl)
   6693 3E 02         [ 7]  677 	ld	a,#0x02
   6695 95            [ 4]  678 	sub	a, l
   6696 38 0E         [12]  679 	jr	C,00106$
   6698 1A            [ 7]  680 	ld	a,(de)
   6699 5F            [ 4]  681 	ld	e,a
   669A 3E 02         [ 7]  682 	ld	a,#0x02
   669C 93            [ 4]  683 	sub	a, e
   669D 38 07         [12]  684 	jr	C,00106$
   669F 0A            [ 7]  685 	ld	a,(bc)
   66A0 4F            [ 4]  686 	ld	c,a
   66A1 3E 02         [ 7]  687 	ld	a,#0x02
   66A3 91            [ 4]  688 	sub	a, c
   66A4 30 04         [12]  689 	jr	NC,00107$
   66A6                     690 00106$:
                            691 ;src/main.c:186: return 1;
   66A6 2E 01         [ 7]  692 	ld	l,#0x01
   66A8 18 02         [12]  693 	jr	00110$
   66AA                     694 00107$:
                            695 ;src/main.c:188: return 0;
   66AA 2E 00         [ 7]  696 	ld	l,#0x00
   66AC                     697 00110$:
   66AC DD F9         [10]  698 	ld	sp, ix
   66AE DD E1         [14]  699 	pop	ix
   66B0 C9            [10]  700 	ret
                            701 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            702 ;	---------------------------------
                            703 ; Function dibujarEnemigo
                            704 ; ---------------------------------
   66B1                     705 _dibujarEnemigo::
   66B1 DD E5         [15]  706 	push	ix
   66B3 DD 21 00 00   [14]  707 	ld	ix,#0
   66B7 DD 39         [15]  708 	add	ix,sp
                            709 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66B9 DD 4E 04      [19]  710 	ld	c,4 (ix)
   66BC DD 46 05      [19]  711 	ld	b,5 (ix)
   66BF 69            [ 4]  712 	ld	l, c
   66C0 60            [ 4]  713 	ld	h, b
   66C1 23            [ 6]  714 	inc	hl
   66C2 56            [ 7]  715 	ld	d,(hl)
   66C3 0A            [ 7]  716 	ld	a,(bc)
   66C4 C5            [11]  717 	push	bc
   66C5 D5            [11]  718 	push	de
   66C6 33            [ 6]  719 	inc	sp
   66C7 F5            [11]  720 	push	af
   66C8 33            [ 6]  721 	inc	sp
   66C9 21 00 C0      [10]  722 	ld	hl,#0xC000
   66CC E5            [11]  723 	push	hl
   66CD CD 15 5F      [17]  724 	call	_cpct_getScreenPtr
   66D0 EB            [ 4]  725 	ex	de,hl
                            726 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   66D1 E1            [10]  727 	pop	hl
   66D2 01 04 00      [10]  728 	ld	bc, #0x0004
   66D5 09            [11]  729 	add	hl, bc
   66D6 4E            [ 7]  730 	ld	c,(hl)
   66D7 23            [ 6]  731 	inc	hl
   66D8 46            [ 7]  732 	ld	b,(hl)
   66D9 21 00 01      [10]  733 	ld	hl,#_g_tablatrans
   66DC E5            [11]  734 	push	hl
   66DD 21 04 16      [10]  735 	ld	hl,#0x1604
   66E0 E5            [11]  736 	push	hl
   66E1 D5            [11]  737 	push	de
   66E2 C5            [11]  738 	push	bc
   66E3 CD 35 5F      [17]  739 	call	_cpct_drawSpriteMaskedAlignedTable
   66E6 DD E1         [14]  740 	pop	ix
   66E8 C9            [10]  741 	ret
                            742 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            743 ;	---------------------------------
                            744 ; Function dibujarExplosion
                            745 ; ---------------------------------
   66E9                     746 _dibujarExplosion::
   66E9 DD E5         [15]  747 	push	ix
   66EB DD 21 00 00   [14]  748 	ld	ix,#0
   66EF DD 39         [15]  749 	add	ix,sp
                            750 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66F1 DD 4E 04      [19]  751 	ld	c,4 (ix)
   66F4 DD 46 05      [19]  752 	ld	b,5 (ix)
   66F7 69            [ 4]  753 	ld	l, c
   66F8 60            [ 4]  754 	ld	h, b
   66F9 23            [ 6]  755 	inc	hl
   66FA 56            [ 7]  756 	ld	d,(hl)
   66FB 0A            [ 7]  757 	ld	a,(bc)
   66FC 47            [ 4]  758 	ld	b,a
   66FD D5            [11]  759 	push	de
   66FE 33            [ 6]  760 	inc	sp
   66FF C5            [11]  761 	push	bc
   6700 33            [ 6]  762 	inc	sp
   6701 21 00 C0      [10]  763 	ld	hl,#0xC000
   6704 E5            [11]  764 	push	hl
   6705 CD 15 5F      [17]  765 	call	_cpct_getScreenPtr
   6708 4D            [ 4]  766 	ld	c,l
   6709 44            [ 4]  767 	ld	b,h
                            768 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   670A 11 00 01      [10]  769 	ld	de,#_g_tablatrans+0
   670D D5            [11]  770 	push	de
   670E 21 04 16      [10]  771 	ld	hl,#0x1604
   6711 E5            [11]  772 	push	hl
   6712 C5            [11]  773 	push	bc
   6713 21 70 19      [10]  774 	ld	hl,#_g_explosion
   6716 E5            [11]  775 	push	hl
   6717 CD 35 5F      [17]  776 	call	_cpct_drawSpriteMaskedAlignedTable
   671A DD E1         [14]  777 	pop	ix
   671C C9            [10]  778 	ret
                            779 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            780 ;	---------------------------------
                            781 ; Function borrarExplosion
                            782 ; ---------------------------------
   671D                     783 _borrarExplosion::
   671D DD E5         [15]  784 	push	ix
   671F DD 21 00 00   [14]  785 	ld	ix,#0
   6723 DD 39         [15]  786 	add	ix,sp
   6725 F5            [11]  787 	push	af
   6726 3B            [ 6]  788 	dec	sp
                            789 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   6727 DD 5E 04      [19]  790 	ld	e,4 (ix)
   672A DD 56 05      [19]  791 	ld	d,5 (ix)
   672D 6B            [ 4]  792 	ld	l, e
   672E 62            [ 4]  793 	ld	h, d
   672F 23            [ 6]  794 	inc	hl
   6730 23            [ 6]  795 	inc	hl
   6731 4E            [ 7]  796 	ld	c,(hl)
   6732 79            [ 4]  797 	ld	a,c
   6733 E6 01         [ 7]  798 	and	a, #0x01
   6735 47            [ 4]  799 	ld	b,a
   6736 04            [ 4]  800 	inc	b
   6737 04            [ 4]  801 	inc	b
   6738 04            [ 4]  802 	inc	b
   6739 04            [ 4]  803 	inc	b
                            804 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   673A EB            [ 4]  805 	ex	de,hl
   673B 23            [ 6]  806 	inc	hl
   673C 23            [ 6]  807 	inc	hl
   673D 23            [ 6]  808 	inc	hl
   673E 5E            [ 7]  809 	ld	e,(hl)
   673F CB 4B         [ 8]  810 	bit	1, e
   6741 28 04         [12]  811 	jr	Z,00103$
   6743 3E 01         [ 7]  812 	ld	a,#0x01
   6745 18 02         [12]  813 	jr	00104$
   6747                     814 00103$:
   6747 3E 00         [ 7]  815 	ld	a,#0x00
   6749                     816 00104$:
   6749 C6 06         [ 7]  817 	add	a, #0x06
   674B DD 77 FD      [19]  818 	ld	-3 (ix),a
                            819 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   674E FD 2A D5 63   [20]  820 	ld	iy,(_mapa)
   6752 16 00         [ 7]  821 	ld	d,#0x00
   6754 7B            [ 4]  822 	ld	a,e
   6755 C6 E8         [ 7]  823 	add	a,#0xE8
   6757 DD 77 FE      [19]  824 	ld	-2 (ix),a
   675A 7A            [ 4]  825 	ld	a,d
   675B CE FF         [ 7]  826 	adc	a,#0xFF
   675D DD 77 FF      [19]  827 	ld	-1 (ix),a
   6760 DD 6E FE      [19]  828 	ld	l,-2 (ix)
   6763 DD 66 FF      [19]  829 	ld	h,-1 (ix)
   6766 DD CB FF 7E   [20]  830 	bit	7, -1 (ix)
   676A 28 04         [12]  831 	jr	Z,00105$
   676C 21 EB FF      [10]  832 	ld	hl,#0xFFEB
   676F 19            [11]  833 	add	hl,de
   6770                     834 00105$:
   6770 CB 2C         [ 8]  835 	sra	h
   6772 CB 1D         [ 8]  836 	rr	l
   6774 CB 2C         [ 8]  837 	sra	h
   6776 CB 1D         [ 8]  838 	rr	l
   6778 55            [ 4]  839 	ld	d,l
   6779 CB 39         [ 8]  840 	srl	c
   677B FD E5         [15]  841 	push	iy
   677D 21 F0 C0      [10]  842 	ld	hl,#0xC0F0
   6780 E5            [11]  843 	push	hl
   6781 3E 28         [ 7]  844 	ld	a,#0x28
   6783 F5            [11]  845 	push	af
   6784 33            [ 6]  846 	inc	sp
   6785 DD 7E FD      [19]  847 	ld	a,-3 (ix)
   6788 F5            [11]  848 	push	af
   6789 33            [ 6]  849 	inc	sp
   678A C5            [11]  850 	push	bc
   678B 33            [ 6]  851 	inc	sp
   678C D5            [11]  852 	push	de
   678D 33            [ 6]  853 	inc	sp
   678E 79            [ 4]  854 	ld	a,c
   678F F5            [11]  855 	push	af
   6790 33            [ 6]  856 	inc	sp
   6791 CD F7 53      [17]  857 	call	_cpct_etm_drawTileBox2x4
   6794 DD F9         [10]  858 	ld	sp, ix
   6796 DD E1         [14]  859 	pop	ix
   6798 C9            [10]  860 	ret
                            861 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            862 ;	---------------------------------
                            863 ; Function borrarEnemigo
                            864 ; ---------------------------------
   6799                     865 _borrarEnemigo::
   6799 DD E5         [15]  866 	push	ix
   679B DD 21 00 00   [14]  867 	ld	ix,#0
   679F DD 39         [15]  868 	add	ix,sp
   67A1 F5            [11]  869 	push	af
   67A2 F5            [11]  870 	push	af
                            871 ;src/main.c:217: u8 w = 4 + (x & 1);
   67A3 DD 7E 04      [19]  872 	ld	a,4 (ix)
   67A6 E6 01         [ 7]  873 	and	a, #0x01
   67A8 5F            [ 4]  874 	ld	e,a
   67A9 1C            [ 4]  875 	inc	e
   67AA 1C            [ 4]  876 	inc	e
   67AB 1C            [ 4]  877 	inc	e
   67AC 1C            [ 4]  878 	inc	e
                            879 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   67AD DD 7E 05      [19]  880 	ld	a,5 (ix)
   67B0 E6 03         [ 7]  881 	and	a, #0x03
   67B2 28 04         [12]  882 	jr	Z,00103$
   67B4 3E 01         [ 7]  883 	ld	a,#0x01
   67B6 18 02         [12]  884 	jr	00104$
   67B8                     885 00103$:
   67B8 3E 00         [ 7]  886 	ld	a,#0x00
   67BA                     887 00104$:
   67BA C6 06         [ 7]  888 	add	a, #0x06
   67BC 57            [ 4]  889 	ld	d,a
                            890 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   67BD 2A D5 63      [16]  891 	ld	hl,(_mapa)
   67C0 DD 75 FE      [19]  892 	ld	-2 (ix),l
   67C3 DD 74 FF      [19]  893 	ld	-1 (ix),h
   67C6 DD 4E 05      [19]  894 	ld	c,5 (ix)
   67C9 06 00         [ 7]  895 	ld	b,#0x00
   67CB 79            [ 4]  896 	ld	a,c
   67CC C6 E8         [ 7]  897 	add	a,#0xE8
   67CE DD 77 FC      [19]  898 	ld	-4 (ix),a
   67D1 78            [ 4]  899 	ld	a,b
   67D2 CE FF         [ 7]  900 	adc	a,#0xFF
   67D4 DD 77 FD      [19]  901 	ld	-3 (ix),a
   67D7 E1            [10]  902 	pop	hl
   67D8 E5            [11]  903 	push	hl
   67D9 DD CB FD 7E   [20]  904 	bit	7, -3 (ix)
   67DD 28 04         [12]  905 	jr	Z,00105$
   67DF 21 EB FF      [10]  906 	ld	hl,#0xFFEB
   67E2 09            [11]  907 	add	hl,bc
   67E3                     908 00105$:
   67E3 CB 2C         [ 8]  909 	sra	h
   67E5 CB 1D         [ 8]  910 	rr	l
   67E7 CB 2C         [ 8]  911 	sra	h
   67E9 CB 1D         [ 8]  912 	rr	l
   67EB 45            [ 4]  913 	ld	b,l
   67EC DD 4E 04      [19]  914 	ld	c,4 (ix)
   67EF CB 39         [ 8]  915 	srl	c
   67F1 DD 6E FE      [19]  916 	ld	l,-2 (ix)
   67F4 DD 66 FF      [19]  917 	ld	h,-1 (ix)
   67F7 E5            [11]  918 	push	hl
   67F8 21 F0 C0      [10]  919 	ld	hl,#0xC0F0
   67FB E5            [11]  920 	push	hl
   67FC 3E 28         [ 7]  921 	ld	a,#0x28
   67FE F5            [11]  922 	push	af
   67FF 33            [ 6]  923 	inc	sp
   6800 D5            [11]  924 	push	de
   6801 C5            [11]  925 	push	bc
   6802 CD F7 53      [17]  926 	call	_cpct_etm_drawTileBox2x4
                            927 ;src/main.c:224: enemy->mover = NO;
   6805 21 76 5F      [10]  928 	ld	hl,#(_enemy + 0x0006)
   6808 36 00         [10]  929 	ld	(hl),#0x00
   680A DD F9         [10]  930 	ld	sp, ix
   680C DD E1         [14]  931 	pop	ix
   680E C9            [10]  932 	ret
                            933 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            934 ;	---------------------------------
                            935 ; Function redibujarEnemigo
                            936 ; ---------------------------------
   680F                     937 _redibujarEnemigo::
   680F DD E5         [15]  938 	push	ix
   6811 DD 21 00 00   [14]  939 	ld	ix,#0
   6815 DD 39         [15]  940 	add	ix,sp
                            941 ;src/main.c:228: borrarEnemigo(x, y);
   6817 DD 66 05      [19]  942 	ld	h,5 (ix)
   681A DD 6E 04      [19]  943 	ld	l,4 (ix)
   681D E5            [11]  944 	push	hl
   681E CD 99 67      [17]  945 	call	_borrarEnemigo
   6821 F1            [10]  946 	pop	af
                            947 ;src/main.c:229: enemy->px = enemy->x;
   6822 DD 4E 06      [19]  948 	ld	c,6 (ix)
   6825 DD 46 07      [19]  949 	ld	b,7 (ix)
   6828 59            [ 4]  950 	ld	e, c
   6829 50            [ 4]  951 	ld	d, b
   682A 13            [ 6]  952 	inc	de
   682B 13            [ 6]  953 	inc	de
   682C 0A            [ 7]  954 	ld	a,(bc)
   682D 12            [ 7]  955 	ld	(de),a
                            956 ;src/main.c:230: enemy->py = enemy->y;
   682E 59            [ 4]  957 	ld	e, c
   682F 50            [ 4]  958 	ld	d, b
   6830 13            [ 6]  959 	inc	de
   6831 13            [ 6]  960 	inc	de
   6832 13            [ 6]  961 	inc	de
   6833 69            [ 4]  962 	ld	l, c
   6834 60            [ 4]  963 	ld	h, b
   6835 23            [ 6]  964 	inc	hl
   6836 7E            [ 7]  965 	ld	a,(hl)
   6837 12            [ 7]  966 	ld	(de),a
                            967 ;src/main.c:231: dibujarEnemigo(enemy);
   6838 C5            [11]  968 	push	bc
   6839 CD B1 66      [17]  969 	call	_dibujarEnemigo
   683C F1            [10]  970 	pop	af
   683D DD E1         [14]  971 	pop	ix
   683F C9            [10]  972 	ret
                            973 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            974 ;	---------------------------------
                            975 ; Function checkEnemyCollision
                            976 ; ---------------------------------
   6840                     977 _checkEnemyCollision::
   6840 DD E5         [15]  978 	push	ix
   6842 DD 21 00 00   [14]  979 	ld	ix,#0
   6846 DD 39         [15]  980 	add	ix,sp
   6848 21 F7 FF      [10]  981 	ld	hl,#-9
   684B 39            [11]  982 	add	hl,sp
   684C F9            [ 6]  983 	ld	sp,hl
                            984 ;src/main.c:236: u8 colisiona = 1;
   684D DD 36 F7 01   [19]  985 	ld	-9 (ix),#0x01
                            986 ;src/main.c:238: switch (direction) {
   6851 3E 03         [ 7]  987 	ld	a,#0x03
   6853 DD 96 04      [19]  988 	sub	a, 4 (ix)
   6856 DA 33 6C      [10]  989 	jp	C,00165$
                            990 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6859 DD 4E 05      [19]  991 	ld	c,5 (ix)
   685C DD 46 06      [19]  992 	ld	b,6 (ix)
   685F 0A            [ 7]  993 	ld	a,(bc)
   6860 5F            [ 4]  994 	ld	e,a
   6861 21 01 00      [10]  995 	ld	hl,#0x0001
   6864 09            [11]  996 	add	hl,bc
   6865 DD 75 F8      [19]  997 	ld	-8 (ix),l
   6868 DD 74 F9      [19]  998 	ld	-7 (ix),h
   686B DD 6E F8      [19]  999 	ld	l,-8 (ix)
   686E DD 66 F9      [19] 1000 	ld	h,-7 (ix)
   6871 56            [ 7] 1001 	ld	d,(hl)
                           1002 ;src/main.c:253: enemy->muerto = SI;
   6872 21 08 00      [10] 1003 	ld	hl,#0x0008
   6875 09            [11] 1004 	add	hl,bc
   6876 DD 75 FA      [19] 1005 	ld	-6 (ix),l
   6879 DD 74 FB      [19] 1006 	ld	-5 (ix),h
                           1007 ;src/main.c:260: enemy->mira = M_izquierda;
   687C 21 07 00      [10] 1008 	ld	hl,#0x0007
   687F 09            [11] 1009 	add	hl,bc
   6880 DD 75 FC      [19] 1010 	ld	-4 (ix),l
   6883 DD 74 FD      [19] 1011 	ld	-3 (ix),h
                           1012 ;src/main.c:238: switch (direction) {
   6886 D5            [11] 1013 	push	de
   6887 DD 5E 04      [19] 1014 	ld	e,4 (ix)
   688A 16 00         [ 7] 1015 	ld	d,#0x00
   688C 21 94 68      [10] 1016 	ld	hl,#00268$
   688F 19            [11] 1017 	add	hl,de
   6890 19            [11] 1018 	add	hl,de
   6891 19            [11] 1019 	add	hl,de
   6892 D1            [10] 1020 	pop	de
   6893 E9            [ 4] 1021 	jp	(hl)
   6894                    1022 00268$:
   6894 C3 A0 68      [10] 1023 	jp	00101$
   6897 C3 88 69      [10] 1024 	jp	00117$
   689A C3 6C 6A      [10] 1025 	jp	00133$
   689D C3 4A 6B      [10] 1026 	jp	00149$
                           1027 ;src/main.c:239: case 0:
   68A0                    1028 00101$:
                           1029 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   68A0 7B            [ 4] 1030 	ld	a,e
   68A1 C6 05         [ 7] 1031 	add	a, #0x05
   68A3 C5            [11] 1032 	push	bc
   68A4 D5            [11] 1033 	push	de
   68A5 33            [ 6] 1034 	inc	sp
   68A6 F5            [11] 1035 	push	af
   68A7 33            [ 6] 1036 	inc	sp
   68A8 2A D5 63      [16] 1037 	ld	hl,(_mapa)
   68AB E5            [11] 1038 	push	hl
   68AC CD 2C 4A      [17] 1039 	call	_getTilePtr
   68AF F1            [10] 1040 	pop	af
   68B0 F1            [10] 1041 	pop	af
   68B1 C1            [10] 1042 	pop	bc
   68B2 5E            [ 7] 1043 	ld	e,(hl)
   68B3 3E 02         [ 7] 1044 	ld	a,#0x02
   68B5 93            [ 4] 1045 	sub	a, e
   68B6 DA 7D 69      [10] 1046 	jp	C,00113$
                           1047 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   68B9 DD 6E F8      [19] 1048 	ld	l,-8 (ix)
   68BC DD 66 F9      [19] 1049 	ld	h,-7 (ix)
   68BF 7E            [ 7] 1050 	ld	a,(hl)
   68C0 C6 0B         [ 7] 1051 	add	a, #0x0B
   68C2 57            [ 4] 1052 	ld	d,a
   68C3 0A            [ 7] 1053 	ld	a,(bc)
   68C4 C6 05         [ 7] 1054 	add	a, #0x05
   68C6 C5            [11] 1055 	push	bc
   68C7 D5            [11] 1056 	push	de
   68C8 33            [ 6] 1057 	inc	sp
   68C9 F5            [11] 1058 	push	af
   68CA 33            [ 6] 1059 	inc	sp
   68CB 2A D5 63      [16] 1060 	ld	hl,(_mapa)
   68CE E5            [11] 1061 	push	hl
   68CF CD 2C 4A      [17] 1062 	call	_getTilePtr
   68D2 F1            [10] 1063 	pop	af
   68D3 F1            [10] 1064 	pop	af
   68D4 C1            [10] 1065 	pop	bc
   68D5 5E            [ 7] 1066 	ld	e,(hl)
   68D6 3E 02         [ 7] 1067 	ld	a,#0x02
   68D8 93            [ 4] 1068 	sub	a, e
   68D9 DA 7D 69      [10] 1069 	jp	C,00113$
                           1070 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   68DC DD 6E F8      [19] 1071 	ld	l,-8 (ix)
   68DF DD 66 F9      [19] 1072 	ld	h,-7 (ix)
   68E2 7E            [ 7] 1073 	ld	a,(hl)
   68E3 C6 16         [ 7] 1074 	add	a, #0x16
   68E5 57            [ 4] 1075 	ld	d,a
   68E6 0A            [ 7] 1076 	ld	a,(bc)
   68E7 C6 05         [ 7] 1077 	add	a, #0x05
   68E9 C5            [11] 1078 	push	bc
   68EA D5            [11] 1079 	push	de
   68EB 33            [ 6] 1080 	inc	sp
   68EC F5            [11] 1081 	push	af
   68ED 33            [ 6] 1082 	inc	sp
   68EE 2A D5 63      [16] 1083 	ld	hl,(_mapa)
   68F1 E5            [11] 1084 	push	hl
   68F2 CD 2C 4A      [17] 1085 	call	_getTilePtr
   68F5 F1            [10] 1086 	pop	af
   68F6 F1            [10] 1087 	pop	af
   68F7 C1            [10] 1088 	pop	bc
   68F8 5E            [ 7] 1089 	ld	e,(hl)
   68F9 3E 02         [ 7] 1090 	ld	a,#0x02
   68FB 93            [ 4] 1091 	sub	a, e
   68FC DA 7D 69      [10] 1092 	jp	C,00113$
                           1093 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   68FF 21 01 63      [10] 1094 	ld	hl, #_cu + 1
   6902 5E            [ 7] 1095 	ld	e,(hl)
   6903 16 00         [ 7] 1096 	ld	d,#0x00
   6905 21 04 00      [10] 1097 	ld	hl,#0x0004
   6908 19            [11] 1098 	add	hl,de
   6909 DD 75 FE      [19] 1099 	ld	-2 (ix),l
   690C DD 74 FF      [19] 1100 	ld	-1 (ix),h
   690F DD 6E F8      [19] 1101 	ld	l,-8 (ix)
   6912 DD 66 F9      [19] 1102 	ld	h,-7 (ix)
   6915 6E            [ 7] 1103 	ld	l,(hl)
   6916 26 00         [ 7] 1104 	ld	h,#0x00
   6918 DD 7E FE      [19] 1105 	ld	a,-2 (ix)
   691B 95            [ 4] 1106 	sub	a, l
   691C DD 7E FF      [19] 1107 	ld	a,-1 (ix)
   691F 9C            [ 4] 1108 	sbc	a, h
   6920 E2 25 69      [10] 1109 	jp	PO, 00269$
   6923 EE 80         [ 7] 1110 	xor	a, #0x80
   6925                    1111 00269$:
   6925 FA 3A 69      [10] 1112 	jp	M,00108$
   6928 D5            [11] 1113 	push	de
   6929 11 16 00      [10] 1114 	ld	de,#0x0016
   692C 19            [11] 1115 	add	hl, de
   692D D1            [10] 1116 	pop	de
   692E 7D            [ 4] 1117 	ld	a,l
   692F 93            [ 4] 1118 	sub	a, e
   6930 7C            [ 4] 1119 	ld	a,h
   6931 9A            [ 4] 1120 	sbc	a, d
   6932 E2 37 69      [10] 1121 	jp	PO, 00270$
   6935 EE 80         [ 7] 1122 	xor	a, #0x80
   6937                    1123 00270$:
   6937 F2 41 69      [10] 1124 	jp	P,00109$
   693A                    1125 00108$:
                           1126 ;src/main.c:245: colisiona = 0;
   693A DD 36 F7 00   [19] 1127 	ld	-9 (ix),#0x00
   693E C3 33 6C      [10] 1128 	jp	00165$
   6941                    1129 00109$:
                           1130 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   6941 21 00 63      [10] 1131 	ld	hl, #_cu + 0
   6944 5E            [ 7] 1132 	ld	e,(hl)
   6945 0A            [ 7] 1133 	ld	a,(bc)
   6946 4F            [ 4] 1134 	ld	c,a
   6947 93            [ 4] 1135 	sub	a, e
   6948 30 2C         [12] 1136 	jr	NC,00106$
                           1137 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   694A 6B            [ 4] 1138 	ld	l,e
   694B 26 00         [ 7] 1139 	ld	h,#0x00
   694D 06 00         [ 7] 1140 	ld	b,#0x00
   694F 03            [ 6] 1141 	inc	bc
   6950 03            [ 6] 1142 	inc	bc
   6951 03            [ 6] 1143 	inc	bc
   6952 03            [ 6] 1144 	inc	bc
   6953 BF            [ 4] 1145 	cp	a, a
   6954 ED 42         [15] 1146 	sbc	hl, bc
   6956 3E 01         [ 7] 1147 	ld	a,#0x01
   6958 BD            [ 4] 1148 	cp	a, l
   6959 3E 00         [ 7] 1149 	ld	a,#0x00
   695B 9C            [ 4] 1150 	sbc	a, h
   695C E2 61 69      [10] 1151 	jp	PO, 00271$
   695F EE 80         [ 7] 1152 	xor	a, #0x80
   6961                    1153 00271$:
   6961 F2 6B 69      [10] 1154 	jp	P,00103$
                           1155 ;src/main.c:250: colisiona = 0;
   6964 DD 36 F7 00   [19] 1156 	ld	-9 (ix),#0x00
   6968 C3 33 6C      [10] 1157 	jp	00165$
   696B                    1158 00103$:
                           1159 ;src/main.c:253: enemy->muerto = SI;
   696B DD 6E FA      [19] 1160 	ld	l,-6 (ix)
   696E DD 66 FB      [19] 1161 	ld	h,-5 (ix)
   6971 36 01         [10] 1162 	ld	(hl),#0x01
   6973 C3 33 6C      [10] 1163 	jp	00165$
   6976                    1164 00106$:
                           1165 ;src/main.c:256: colisiona = 0;
   6976 DD 36 F7 00   [19] 1166 	ld	-9 (ix),#0x00
   697A C3 33 6C      [10] 1167 	jp	00165$
   697D                    1168 00113$:
                           1169 ;src/main.c:260: enemy->mira = M_izquierda;
   697D DD 6E FC      [19] 1170 	ld	l,-4 (ix)
   6980 DD 66 FD      [19] 1171 	ld	h,-3 (ix)
   6983 36 01         [10] 1172 	ld	(hl),#0x01
                           1173 ;src/main.c:262: break;
   6985 C3 33 6C      [10] 1174 	jp	00165$
                           1175 ;src/main.c:263: case 1:
   6988                    1176 00117$:
                           1177 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6988 1D            [ 4] 1178 	dec	e
   6989 C5            [11] 1179 	push	bc
   698A D5            [11] 1180 	push	de
   698B 2A D5 63      [16] 1181 	ld	hl,(_mapa)
   698E E5            [11] 1182 	push	hl
   698F CD 2C 4A      [17] 1183 	call	_getTilePtr
   6992 F1            [10] 1184 	pop	af
   6993 F1            [10] 1185 	pop	af
   6994 C1            [10] 1186 	pop	bc
   6995 5E            [ 7] 1187 	ld	e,(hl)
   6996 3E 02         [ 7] 1188 	ld	a,#0x02
   6998 93            [ 4] 1189 	sub	a, e
   6999 DA 61 6A      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   699C DD 6E F8      [19] 1192 	ld	l,-8 (ix)
   699F DD 66 F9      [19] 1193 	ld	h,-7 (ix)
   69A2 7E            [ 7] 1194 	ld	a,(hl)
   69A3 C6 0B         [ 7] 1195 	add	a, #0x0B
   69A5 57            [ 4] 1196 	ld	d,a
   69A6 0A            [ 7] 1197 	ld	a,(bc)
   69A7 C6 FF         [ 7] 1198 	add	a,#0xFF
   69A9 C5            [11] 1199 	push	bc
   69AA D5            [11] 1200 	push	de
   69AB 33            [ 6] 1201 	inc	sp
   69AC F5            [11] 1202 	push	af
   69AD 33            [ 6] 1203 	inc	sp
   69AE 2A D5 63      [16] 1204 	ld	hl,(_mapa)
   69B1 E5            [11] 1205 	push	hl
   69B2 CD 2C 4A      [17] 1206 	call	_getTilePtr
   69B5 F1            [10] 1207 	pop	af
   69B6 F1            [10] 1208 	pop	af
   69B7 C1            [10] 1209 	pop	bc
   69B8 5E            [ 7] 1210 	ld	e,(hl)
   69B9 3E 02         [ 7] 1211 	ld	a,#0x02
   69BB 93            [ 4] 1212 	sub	a, e
   69BC DA 61 6A      [10] 1213 	jp	C,00129$
                           1214 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   69BF DD 6E F8      [19] 1215 	ld	l,-8 (ix)
   69C2 DD 66 F9      [19] 1216 	ld	h,-7 (ix)
   69C5 7E            [ 7] 1217 	ld	a,(hl)
   69C6 C6 16         [ 7] 1218 	add	a, #0x16
   69C8 57            [ 4] 1219 	ld	d,a
   69C9 0A            [ 7] 1220 	ld	a,(bc)
   69CA C6 FF         [ 7] 1221 	add	a,#0xFF
   69CC C5            [11] 1222 	push	bc
   69CD D5            [11] 1223 	push	de
   69CE 33            [ 6] 1224 	inc	sp
   69CF F5            [11] 1225 	push	af
   69D0 33            [ 6] 1226 	inc	sp
   69D1 2A D5 63      [16] 1227 	ld	hl,(_mapa)
   69D4 E5            [11] 1228 	push	hl
   69D5 CD 2C 4A      [17] 1229 	call	_getTilePtr
   69D8 F1            [10] 1230 	pop	af
   69D9 F1            [10] 1231 	pop	af
   69DA C1            [10] 1232 	pop	bc
   69DB 5E            [ 7] 1233 	ld	e,(hl)
   69DC 3E 02         [ 7] 1234 	ld	a,#0x02
   69DE 93            [ 4] 1235 	sub	a, e
   69DF DA 61 6A      [10] 1236 	jp	C,00129$
                           1237 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69E2 21 01 63      [10] 1238 	ld	hl, #_cu + 1
   69E5 5E            [ 7] 1239 	ld	e,(hl)
   69E6 16 00         [ 7] 1240 	ld	d,#0x00
   69E8 21 04 00      [10] 1241 	ld	hl,#0x0004
   69EB 19            [11] 1242 	add	hl,de
   69EC DD 75 FE      [19] 1243 	ld	-2 (ix),l
   69EF DD 74 FF      [19] 1244 	ld	-1 (ix),h
   69F2 DD 6E F8      [19] 1245 	ld	l,-8 (ix)
   69F5 DD 66 F9      [19] 1246 	ld	h,-7 (ix)
   69F8 6E            [ 7] 1247 	ld	l,(hl)
   69F9 26 00         [ 7] 1248 	ld	h,#0x00
   69FB DD 7E FE      [19] 1249 	ld	a,-2 (ix)
   69FE 95            [ 4] 1250 	sub	a, l
   69FF DD 7E FF      [19] 1251 	ld	a,-1 (ix)
   6A02 9C            [ 4] 1252 	sbc	a, h
   6A03 E2 08 6A      [10] 1253 	jp	PO, 00272$
   6A06 EE 80         [ 7] 1254 	xor	a, #0x80
   6A08                    1255 00272$:
   6A08 FA 1D 6A      [10] 1256 	jp	M,00124$
   6A0B D5            [11] 1257 	push	de
   6A0C 11 16 00      [10] 1258 	ld	de,#0x0016
   6A0F 19            [11] 1259 	add	hl, de
   6A10 D1            [10] 1260 	pop	de
   6A11 7D            [ 4] 1261 	ld	a,l
   6A12 93            [ 4] 1262 	sub	a, e
   6A13 7C            [ 4] 1263 	ld	a,h
   6A14 9A            [ 4] 1264 	sbc	a, d
   6A15 E2 1A 6A      [10] 1265 	jp	PO, 00273$
   6A18 EE 80         [ 7] 1266 	xor	a, #0x80
   6A1A                    1267 00273$:
   6A1A F2 24 6A      [10] 1268 	jp	P,00125$
   6A1D                    1269 00124$:
                           1270 ;src/main.c:269: colisiona = 0;
   6A1D DD 36 F7 00   [19] 1271 	ld	-9 (ix),#0x00
   6A21 C3 33 6C      [10] 1272 	jp	00165$
   6A24                    1273 00125$:
                           1274 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   6A24 0A            [ 7] 1275 	ld	a,(bc)
   6A25 5F            [ 4] 1276 	ld	e,a
   6A26 21 00 63      [10] 1277 	ld	hl, #_cu + 0
   6A29 4E            [ 7] 1278 	ld	c,(hl)
   6A2A 79            [ 4] 1279 	ld	a,c
   6A2B 93            [ 4] 1280 	sub	a, e
   6A2C 30 2C         [12] 1281 	jr	NC,00122$
                           1282 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   6A2E 6B            [ 4] 1283 	ld	l,e
   6A2F 26 00         [ 7] 1284 	ld	h,#0x00
   6A31 06 00         [ 7] 1285 	ld	b,#0x00
   6A33 03            [ 6] 1286 	inc	bc
   6A34 03            [ 6] 1287 	inc	bc
   6A35 03            [ 6] 1288 	inc	bc
   6A36 03            [ 6] 1289 	inc	bc
   6A37 BF            [ 4] 1290 	cp	a, a
   6A38 ED 42         [15] 1291 	sbc	hl, bc
   6A3A 3E 01         [ 7] 1292 	ld	a,#0x01
   6A3C BD            [ 4] 1293 	cp	a, l
   6A3D 3E 00         [ 7] 1294 	ld	a,#0x00
   6A3F 9C            [ 4] 1295 	sbc	a, h
   6A40 E2 45 6A      [10] 1296 	jp	PO, 00274$
   6A43 EE 80         [ 7] 1297 	xor	a, #0x80
   6A45                    1298 00274$:
   6A45 F2 4F 6A      [10] 1299 	jp	P,00119$
                           1300 ;src/main.c:274: colisiona = 0;
   6A48 DD 36 F7 00   [19] 1301 	ld	-9 (ix),#0x00
   6A4C C3 33 6C      [10] 1302 	jp	00165$
   6A4F                    1303 00119$:
                           1304 ;src/main.c:277: enemy->muerto = SI;
   6A4F DD 6E FA      [19] 1305 	ld	l,-6 (ix)
   6A52 DD 66 FB      [19] 1306 	ld	h,-5 (ix)
   6A55 36 01         [10] 1307 	ld	(hl),#0x01
   6A57 C3 33 6C      [10] 1308 	jp	00165$
   6A5A                    1309 00122$:
                           1310 ;src/main.c:280: colisiona = 0;
   6A5A DD 36 F7 00   [19] 1311 	ld	-9 (ix),#0x00
   6A5E C3 33 6C      [10] 1312 	jp	00165$
   6A61                    1313 00129$:
                           1314 ;src/main.c:284: enemy->mira = M_derecha;
   6A61 DD 6E FC      [19] 1315 	ld	l,-4 (ix)
   6A64 DD 66 FD      [19] 1316 	ld	h,-3 (ix)
   6A67 36 00         [10] 1317 	ld	(hl),#0x00
                           1318 ;src/main.c:286: break;
   6A69 C3 33 6C      [10] 1319 	jp	00165$
                           1320 ;src/main.c:287: case 2:
   6A6C                    1321 00133$:
                           1322 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6A6C 15            [ 4] 1323 	dec	d
   6A6D 15            [ 4] 1324 	dec	d
   6A6E C5            [11] 1325 	push	bc
   6A6F D5            [11] 1326 	push	de
   6A70 2A D5 63      [16] 1327 	ld	hl,(_mapa)
   6A73 E5            [11] 1328 	push	hl
   6A74 CD 2C 4A      [17] 1329 	call	_getTilePtr
   6A77 F1            [10] 1330 	pop	af
   6A78 F1            [10] 1331 	pop	af
   6A79 C1            [10] 1332 	pop	bc
   6A7A 5E            [ 7] 1333 	ld	e,(hl)
   6A7B 3E 02         [ 7] 1334 	ld	a,#0x02
   6A7D 93            [ 4] 1335 	sub	a, e
   6A7E DA 42 6B      [10] 1336 	jp	C,00145$
                           1337 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6A81 DD 6E F8      [19] 1338 	ld	l,-8 (ix)
   6A84 DD 66 F9      [19] 1339 	ld	h,-7 (ix)
   6A87 56            [ 7] 1340 	ld	d,(hl)
   6A88 15            [ 4] 1341 	dec	d
   6A89 15            [ 4] 1342 	dec	d
   6A8A 0A            [ 7] 1343 	ld	a,(bc)
   6A8B C6 02         [ 7] 1344 	add	a, #0x02
   6A8D C5            [11] 1345 	push	bc
   6A8E D5            [11] 1346 	push	de
   6A8F 33            [ 6] 1347 	inc	sp
   6A90 F5            [11] 1348 	push	af
   6A91 33            [ 6] 1349 	inc	sp
   6A92 2A D5 63      [16] 1350 	ld	hl,(_mapa)
   6A95 E5            [11] 1351 	push	hl
   6A96 CD 2C 4A      [17] 1352 	call	_getTilePtr
   6A99 F1            [10] 1353 	pop	af
   6A9A F1            [10] 1354 	pop	af
   6A9B C1            [10] 1355 	pop	bc
   6A9C 5E            [ 7] 1356 	ld	e,(hl)
   6A9D 3E 02         [ 7] 1357 	ld	a,#0x02
   6A9F 93            [ 4] 1358 	sub	a, e
   6AA0 DA 42 6B      [10] 1359 	jp	C,00145$
                           1360 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6AA3 DD 6E F8      [19] 1361 	ld	l,-8 (ix)
   6AA6 DD 66 F9      [19] 1362 	ld	h,-7 (ix)
   6AA9 56            [ 7] 1363 	ld	d,(hl)
   6AAA 15            [ 4] 1364 	dec	d
   6AAB 15            [ 4] 1365 	dec	d
   6AAC 0A            [ 7] 1366 	ld	a,(bc)
   6AAD C6 04         [ 7] 1367 	add	a, #0x04
   6AAF C5            [11] 1368 	push	bc
   6AB0 D5            [11] 1369 	push	de
   6AB1 33            [ 6] 1370 	inc	sp
   6AB2 F5            [11] 1371 	push	af
   6AB3 33            [ 6] 1372 	inc	sp
   6AB4 2A D5 63      [16] 1373 	ld	hl,(_mapa)
   6AB7 E5            [11] 1374 	push	hl
   6AB8 CD 2C 4A      [17] 1375 	call	_getTilePtr
   6ABB F1            [10] 1376 	pop	af
   6ABC F1            [10] 1377 	pop	af
   6ABD C1            [10] 1378 	pop	bc
   6ABE 5E            [ 7] 1379 	ld	e,(hl)
   6ABF 3E 02         [ 7] 1380 	ld	a,#0x02
   6AC1 93            [ 4] 1381 	sub	a, e
   6AC2 DA 42 6B      [10] 1382 	jp	C,00145$
                           1383 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6AC5 21 00 63      [10] 1384 	ld	hl, #_cu + 0
   6AC8 5E            [ 7] 1385 	ld	e,(hl)
   6AC9 16 00         [ 7] 1386 	ld	d,#0x00
   6ACB 21 02 00      [10] 1387 	ld	hl,#0x0002
   6ACE 19            [11] 1388 	add	hl,de
   6ACF DD 75 FE      [19] 1389 	ld	-2 (ix),l
   6AD2 DD 74 FF      [19] 1390 	ld	-1 (ix),h
   6AD5 0A            [ 7] 1391 	ld	a,(bc)
   6AD6 6F            [ 4] 1392 	ld	l,a
   6AD7 26 00         [ 7] 1393 	ld	h,#0x00
   6AD9 DD 7E FE      [19] 1394 	ld	a,-2 (ix)
   6ADC 95            [ 4] 1395 	sub	a, l
   6ADD DD 7E FF      [19] 1396 	ld	a,-1 (ix)
   6AE0 9C            [ 4] 1397 	sbc	a, h
   6AE1 E2 E6 6A      [10] 1398 	jp	PO, 00275$
   6AE4 EE 80         [ 7] 1399 	xor	a, #0x80
   6AE6                    1400 00275$:
   6AE6 FA F9 6A      [10] 1401 	jp	M,00140$
   6AE9 23            [ 6] 1402 	inc	hl
   6AEA 23            [ 6] 1403 	inc	hl
   6AEB 23            [ 6] 1404 	inc	hl
   6AEC 23            [ 6] 1405 	inc	hl
   6AED 7D            [ 4] 1406 	ld	a,l
   6AEE 93            [ 4] 1407 	sub	a, e
   6AEF 7C            [ 4] 1408 	ld	a,h
   6AF0 9A            [ 4] 1409 	sbc	a, d
   6AF1 E2 F6 6A      [10] 1410 	jp	PO, 00276$
   6AF4 EE 80         [ 7] 1411 	xor	a, #0x80
   6AF6                    1412 00276$:
   6AF6 F2 FF 6A      [10] 1413 	jp	P,00141$
   6AF9                    1414 00140$:
                           1415 ;src/main.c:294: colisiona = 0;
   6AF9 DD 36 F7 00   [19] 1416 	ld	-9 (ix),#0x00
   6AFD 18 4B         [12] 1417 	jr	00149$
   6AFF                    1418 00141$:
                           1419 ;src/main.c:297: if(enemy->y>cu.y){
   6AFF DD 6E F8      [19] 1420 	ld	l,-8 (ix)
   6B02 DD 66 F9      [19] 1421 	ld	h,-7 (ix)
   6B05 5E            [ 7] 1422 	ld	e,(hl)
   6B06 21 01 63      [10] 1423 	ld	hl, #(_cu + 0x0001) + 0
   6B09 6E            [ 7] 1424 	ld	l,(hl)
   6B0A 7D            [ 4] 1425 	ld	a,l
   6B0B 93            [ 4] 1426 	sub	a, e
   6B0C 30 2E         [12] 1427 	jr	NC,00138$
                           1428 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6B0E 16 00         [ 7] 1429 	ld	d,#0x00
   6B10 26 00         [ 7] 1430 	ld	h,#0x00
   6B12 D5            [11] 1431 	push	de
   6B13 11 08 00      [10] 1432 	ld	de,#0x0008
   6B16 19            [11] 1433 	add	hl, de
   6B17 D1            [10] 1434 	pop	de
   6B18 7B            [ 4] 1435 	ld	a,e
   6B19 95            [ 4] 1436 	sub	a, l
   6B1A 5F            [ 4] 1437 	ld	e,a
   6B1B 7A            [ 4] 1438 	ld	a,d
   6B1C 9C            [ 4] 1439 	sbc	a, h
   6B1D 57            [ 4] 1440 	ld	d,a
   6B1E 3E 02         [ 7] 1441 	ld	a,#0x02
   6B20 BB            [ 4] 1442 	cp	a, e
   6B21 3E 00         [ 7] 1443 	ld	a,#0x00
   6B23 9A            [ 4] 1444 	sbc	a, d
   6B24 E2 29 6B      [10] 1445 	jp	PO, 00277$
   6B27 EE 80         [ 7] 1446 	xor	a, #0x80
   6B29                    1447 00277$:
   6B29 F2 32 6B      [10] 1448 	jp	P,00135$
                           1449 ;src/main.c:299: colisiona = 0;
   6B2C DD 36 F7 00   [19] 1450 	ld	-9 (ix),#0x00
   6B30 18 18         [12] 1451 	jr	00149$
   6B32                    1452 00135$:
                           1453 ;src/main.c:302: enemy->muerto = SI;
   6B32 DD 6E FA      [19] 1454 	ld	l,-6 (ix)
   6B35 DD 66 FB      [19] 1455 	ld	h,-5 (ix)
   6B38 36 01         [10] 1456 	ld	(hl),#0x01
   6B3A 18 0E         [12] 1457 	jr	00149$
   6B3C                    1458 00138$:
                           1459 ;src/main.c:306: colisiona = 0;
   6B3C DD 36 F7 00   [19] 1460 	ld	-9 (ix),#0x00
   6B40 18 08         [12] 1461 	jr	00149$
   6B42                    1462 00145$:
                           1463 ;src/main.c:312: enemy->mira = M_abajo;
   6B42 DD 6E FC      [19] 1464 	ld	l,-4 (ix)
   6B45 DD 66 FD      [19] 1465 	ld	h,-3 (ix)
   6B48 36 03         [10] 1466 	ld	(hl),#0x03
                           1467 ;src/main.c:315: case 3:
   6B4A                    1468 00149$:
                           1469 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6B4A DD 6E F8      [19] 1470 	ld	l,-8 (ix)
   6B4D DD 66 F9      [19] 1471 	ld	h,-7 (ix)
   6B50 7E            [ 7] 1472 	ld	a,(hl)
   6B51 C6 18         [ 7] 1473 	add	a, #0x18
   6B53 57            [ 4] 1474 	ld	d,a
   6B54 0A            [ 7] 1475 	ld	a,(bc)
   6B55 C5            [11] 1476 	push	bc
   6B56 D5            [11] 1477 	push	de
   6B57 33            [ 6] 1478 	inc	sp
   6B58 F5            [11] 1479 	push	af
   6B59 33            [ 6] 1480 	inc	sp
   6B5A 2A D5 63      [16] 1481 	ld	hl,(_mapa)
   6B5D E5            [11] 1482 	push	hl
   6B5E CD 2C 4A      [17] 1483 	call	_getTilePtr
   6B61 F1            [10] 1484 	pop	af
   6B62 F1            [10] 1485 	pop	af
   6B63 C1            [10] 1486 	pop	bc
   6B64 5E            [ 7] 1487 	ld	e,(hl)
   6B65 3E 02         [ 7] 1488 	ld	a,#0x02
   6B67 93            [ 4] 1489 	sub	a, e
   6B68 DA 2B 6C      [10] 1490 	jp	C,00161$
                           1491 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6B6B DD 6E F8      [19] 1492 	ld	l,-8 (ix)
   6B6E DD 66 F9      [19] 1493 	ld	h,-7 (ix)
   6B71 7E            [ 7] 1494 	ld	a,(hl)
   6B72 C6 18         [ 7] 1495 	add	a, #0x18
   6B74 57            [ 4] 1496 	ld	d,a
   6B75 0A            [ 7] 1497 	ld	a,(bc)
   6B76 C6 02         [ 7] 1498 	add	a, #0x02
   6B78 C5            [11] 1499 	push	bc
   6B79 D5            [11] 1500 	push	de
   6B7A 33            [ 6] 1501 	inc	sp
   6B7B F5            [11] 1502 	push	af
   6B7C 33            [ 6] 1503 	inc	sp
   6B7D 2A D5 63      [16] 1504 	ld	hl,(_mapa)
   6B80 E5            [11] 1505 	push	hl
   6B81 CD 2C 4A      [17] 1506 	call	_getTilePtr
   6B84 F1            [10] 1507 	pop	af
   6B85 F1            [10] 1508 	pop	af
   6B86 C1            [10] 1509 	pop	bc
   6B87 5E            [ 7] 1510 	ld	e,(hl)
   6B88 3E 02         [ 7] 1511 	ld	a,#0x02
   6B8A 93            [ 4] 1512 	sub	a, e
   6B8B DA 2B 6C      [10] 1513 	jp	C,00161$
                           1514 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6B8E DD 6E F8      [19] 1515 	ld	l,-8 (ix)
   6B91 DD 66 F9      [19] 1516 	ld	h,-7 (ix)
   6B94 7E            [ 7] 1517 	ld	a,(hl)
   6B95 C6 18         [ 7] 1518 	add	a, #0x18
   6B97 57            [ 4] 1519 	ld	d,a
   6B98 0A            [ 7] 1520 	ld	a,(bc)
   6B99 C6 04         [ 7] 1521 	add	a, #0x04
   6B9B C5            [11] 1522 	push	bc
   6B9C D5            [11] 1523 	push	de
   6B9D 33            [ 6] 1524 	inc	sp
   6B9E F5            [11] 1525 	push	af
   6B9F 33            [ 6] 1526 	inc	sp
   6BA0 2A D5 63      [16] 1527 	ld	hl,(_mapa)
   6BA3 E5            [11] 1528 	push	hl
   6BA4 CD 2C 4A      [17] 1529 	call	_getTilePtr
   6BA7 F1            [10] 1530 	pop	af
   6BA8 F1            [10] 1531 	pop	af
   6BA9 C1            [10] 1532 	pop	bc
   6BAA 5E            [ 7] 1533 	ld	e,(hl)
   6BAB 3E 02         [ 7] 1534 	ld	a,#0x02
   6BAD 93            [ 4] 1535 	sub	a, e
   6BAE 38 7B         [12] 1536 	jr	C,00161$
                           1537 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6BB0 21 00 63      [10] 1538 	ld	hl, #_cu + 0
   6BB3 5E            [ 7] 1539 	ld	e,(hl)
   6BB4 16 00         [ 7] 1540 	ld	d,#0x00
   6BB6 21 02 00      [10] 1541 	ld	hl,#0x0002
   6BB9 19            [11] 1542 	add	hl,de
   6BBA DD 75 FE      [19] 1543 	ld	-2 (ix),l
   6BBD DD 74 FF      [19] 1544 	ld	-1 (ix),h
   6BC0 0A            [ 7] 1545 	ld	a,(bc)
   6BC1 4F            [ 4] 1546 	ld	c,a
   6BC2 06 00         [ 7] 1547 	ld	b,#0x00
   6BC4 DD 7E FE      [19] 1548 	ld	a,-2 (ix)
   6BC7 91            [ 4] 1549 	sub	a, c
   6BC8 DD 7E FF      [19] 1550 	ld	a,-1 (ix)
   6BCB 98            [ 4] 1551 	sbc	a, b
   6BCC E2 D1 6B      [10] 1552 	jp	PO, 00278$
   6BCF EE 80         [ 7] 1553 	xor	a, #0x80
   6BD1                    1554 00278$:
   6BD1 FA E4 6B      [10] 1555 	jp	M,00156$
   6BD4 03            [ 6] 1556 	inc	bc
   6BD5 03            [ 6] 1557 	inc	bc
   6BD6 03            [ 6] 1558 	inc	bc
   6BD7 03            [ 6] 1559 	inc	bc
   6BD8 79            [ 4] 1560 	ld	a,c
   6BD9 93            [ 4] 1561 	sub	a, e
   6BDA 78            [ 4] 1562 	ld	a,b
   6BDB 9A            [ 4] 1563 	sbc	a, d
   6BDC E2 E1 6B      [10] 1564 	jp	PO, 00279$
   6BDF EE 80         [ 7] 1565 	xor	a, #0x80
   6BE1                    1566 00279$:
   6BE1 F2 EA 6B      [10] 1567 	jp	P,00157$
   6BE4                    1568 00156$:
                           1569 ;src/main.c:323: colisiona = 0;
   6BE4 DD 36 F7 00   [19] 1570 	ld	-9 (ix),#0x00
   6BE8 18 49         [12] 1571 	jr	00165$
   6BEA                    1572 00157$:
                           1573 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   6BEA 21 01 63      [10] 1574 	ld	hl, #(_cu + 0x0001) + 0
   6BED 4E            [ 7] 1575 	ld	c,(hl)
   6BEE DD 6E F8      [19] 1576 	ld	l,-8 (ix)
   6BF1 DD 66 F9      [19] 1577 	ld	h,-7 (ix)
   6BF4 5E            [ 7] 1578 	ld	e,(hl)
   6BF5 7B            [ 4] 1579 	ld	a,e
   6BF6 91            [ 4] 1580 	sub	a, c
   6BF7 30 2C         [12] 1581 	jr	NC,00154$
                           1582 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6BF9 06 00         [ 7] 1583 	ld	b,#0x00
   6BFB 16 00         [ 7] 1584 	ld	d,#0x00
   6BFD 21 16 00      [10] 1585 	ld	hl,#0x0016
   6C00 19            [11] 1586 	add	hl,de
   6C01 79            [ 4] 1587 	ld	a,c
   6C02 95            [ 4] 1588 	sub	a, l
   6C03 4F            [ 4] 1589 	ld	c,a
   6C04 78            [ 4] 1590 	ld	a,b
   6C05 9C            [ 4] 1591 	sbc	a, h
   6C06 47            [ 4] 1592 	ld	b,a
   6C07 3E 02         [ 7] 1593 	ld	a,#0x02
   6C09 B9            [ 4] 1594 	cp	a, c
   6C0A 3E 00         [ 7] 1595 	ld	a,#0x00
   6C0C 98            [ 4] 1596 	sbc	a, b
   6C0D E2 12 6C      [10] 1597 	jp	PO, 00280$
   6C10 EE 80         [ 7] 1598 	xor	a, #0x80
   6C12                    1599 00280$:
   6C12 F2 1B 6C      [10] 1600 	jp	P,00151$
                           1601 ;src/main.c:328: colisiona = 0;
   6C15 DD 36 F7 00   [19] 1602 	ld	-9 (ix),#0x00
   6C19 18 18         [12] 1603 	jr	00165$
   6C1B                    1604 00151$:
                           1605 ;src/main.c:331: enemy->muerto = SI;
   6C1B DD 6E FA      [19] 1606 	ld	l,-6 (ix)
   6C1E DD 66 FB      [19] 1607 	ld	h,-5 (ix)
   6C21 36 01         [10] 1608 	ld	(hl),#0x01
   6C23 18 0E         [12] 1609 	jr	00165$
   6C25                    1610 00154$:
                           1611 ;src/main.c:335: colisiona = 0;
   6C25 DD 36 F7 00   [19] 1612 	ld	-9 (ix),#0x00
   6C29 18 08         [12] 1613 	jr	00165$
   6C2B                    1614 00161$:
                           1615 ;src/main.c:339: enemy->mira = M_arriba;
   6C2B DD 6E FC      [19] 1616 	ld	l,-4 (ix)
   6C2E DD 66 FD      [19] 1617 	ld	h,-3 (ix)
   6C31 36 02         [10] 1618 	ld	(hl),#0x02
                           1619 ;src/main.c:342: }
   6C33                    1620 00165$:
                           1621 ;src/main.c:343: return colisiona;
   6C33 DD 6E F7      [19] 1622 	ld	l,-9 (ix)
   6C36 DD F9         [10] 1623 	ld	sp, ix
   6C38 DD E1         [14] 1624 	pop	ix
   6C3A C9            [10] 1625 	ret
                           1626 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoArriba
                           1629 ; ---------------------------------
   6C3B                    1630 _moverEnemigoArriba::
   6C3B DD E5         [15] 1631 	push	ix
   6C3D DD 21 00 00   [14] 1632 	ld	ix,#0
   6C41 DD 39         [15] 1633 	add	ix,sp
                           1634 ;src/main.c:347: enemy->y--;
   6C43 DD 4E 04      [19] 1635 	ld	c,4 (ix)
   6C46 DD 46 05      [19] 1636 	ld	b,5 (ix)
   6C49 69            [ 4] 1637 	ld	l, c
   6C4A 60            [ 4] 1638 	ld	h, b
   6C4B 23            [ 6] 1639 	inc	hl
   6C4C 5E            [ 7] 1640 	ld	e,(hl)
   6C4D 1D            [ 4] 1641 	dec	e
   6C4E 73            [ 7] 1642 	ld	(hl),e
                           1643 ;src/main.c:348: enemy->y--;
   6C4F 1D            [ 4] 1644 	dec	e
   6C50 73            [ 7] 1645 	ld	(hl),e
                           1646 ;src/main.c:349: enemy->mover = SI;
   6C51 21 06 00      [10] 1647 	ld	hl,#0x0006
   6C54 09            [11] 1648 	add	hl,bc
   6C55 36 01         [10] 1649 	ld	(hl),#0x01
   6C57 DD E1         [14] 1650 	pop	ix
   6C59 C9            [10] 1651 	ret
                           1652 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1653 ;	---------------------------------
                           1654 ; Function moverEnemigoAbajo
                           1655 ; ---------------------------------
   6C5A                    1656 _moverEnemigoAbajo::
   6C5A DD E5         [15] 1657 	push	ix
   6C5C DD 21 00 00   [14] 1658 	ld	ix,#0
   6C60 DD 39         [15] 1659 	add	ix,sp
                           1660 ;src/main.c:353: enemy->y++;
   6C62 DD 4E 04      [19] 1661 	ld	c,4 (ix)
   6C65 DD 46 05      [19] 1662 	ld	b,5 (ix)
   6C68 59            [ 4] 1663 	ld	e, c
   6C69 50            [ 4] 1664 	ld	d, b
   6C6A 13            [ 6] 1665 	inc	de
   6C6B 1A            [ 7] 1666 	ld	a,(de)
   6C6C 3C            [ 4] 1667 	inc	a
   6C6D 12            [ 7] 1668 	ld	(de),a
                           1669 ;src/main.c:354: enemy->y++;
   6C6E 3C            [ 4] 1670 	inc	a
   6C6F 12            [ 7] 1671 	ld	(de),a
                           1672 ;src/main.c:355: enemy->mover = SI;
   6C70 21 06 00      [10] 1673 	ld	hl,#0x0006
   6C73 09            [11] 1674 	add	hl,bc
   6C74 36 01         [10] 1675 	ld	(hl),#0x01
   6C76 DD E1         [14] 1676 	pop	ix
   6C78 C9            [10] 1677 	ret
                           1678 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1679 ;	---------------------------------
                           1680 ; Function moverEnemigoDerecha
                           1681 ; ---------------------------------
   6C79                    1682 _moverEnemigoDerecha::
                           1683 ;src/main.c:359: enemy->x++;
   6C79 D1            [10] 1684 	pop	de
   6C7A C1            [10] 1685 	pop	bc
   6C7B C5            [11] 1686 	push	bc
   6C7C D5            [11] 1687 	push	de
   6C7D 0A            [ 7] 1688 	ld	a,(bc)
   6C7E 3C            [ 4] 1689 	inc	a
   6C7F 02            [ 7] 1690 	ld	(bc),a
                           1691 ;src/main.c:360: enemy->x++;
   6C80 3C            [ 4] 1692 	inc	a
   6C81 02            [ 7] 1693 	ld	(bc),a
                           1694 ;src/main.c:361: enemy->mover = SI;
   6C82 21 06 00      [10] 1695 	ld	hl,#0x0006
   6C85 09            [11] 1696 	add	hl,bc
   6C86 36 01         [10] 1697 	ld	(hl),#0x01
   6C88 C9            [10] 1698 	ret
                           1699 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1700 ;	---------------------------------
                           1701 ; Function moverEnemigoIzquierda
                           1702 ; ---------------------------------
   6C89                    1703 _moverEnemigoIzquierda::
                           1704 ;src/main.c:365: enemy->x--;
   6C89 D1            [10] 1705 	pop	de
   6C8A C1            [10] 1706 	pop	bc
   6C8B C5            [11] 1707 	push	bc
   6C8C D5            [11] 1708 	push	de
   6C8D 0A            [ 7] 1709 	ld	a,(bc)
   6C8E C6 FF         [ 7] 1710 	add	a,#0xFF
   6C90 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:366: enemy->x--;
   6C91 C6 FF         [ 7] 1713 	add	a,#0xFF
   6C93 02            [ 7] 1714 	ld	(bc),a
                           1715 ;src/main.c:367: enemy->mover = SI;
   6C94 21 06 00      [10] 1716 	ld	hl,#0x0006
   6C97 09            [11] 1717 	add	hl,bc
   6C98 36 01         [10] 1718 	ld	(hl),#0x01
   6C9A C9            [10] 1719 	ret
                           1720 ;src/main.c:370: void moverEnemigoPatrol(TEnemy* enemy){
                           1721 ;	---------------------------------
                           1722 ; Function moverEnemigoPatrol
                           1723 ; ---------------------------------
   6C9B                    1724 _moverEnemigoPatrol::
   6C9B DD E5         [15] 1725 	push	ix
   6C9D DD 21 00 00   [14] 1726 	ld	ix,#0
   6CA1 DD 39         [15] 1727 	add	ix,sp
   6CA3 21 F3 FF      [10] 1728 	ld	hl,#-13
   6CA6 39            [11] 1729 	add	hl,sp
   6CA7 F9            [ 6] 1730 	ld	sp,hl
                           1731 ;src/main.c:372: if(!enemy->muerto){
   6CA8 DD 4E 04      [19] 1732 	ld	c,4 (ix)
   6CAB DD 46 05      [19] 1733 	ld	b,5 (ix)
   6CAE C5            [11] 1734 	push	bc
   6CAF FD E1         [14] 1735 	pop	iy
   6CB1 FD 7E 08      [19] 1736 	ld	a,8 (iy)
   6CB4 B7            [ 4] 1737 	or	a, a
   6CB5 C2 DF 6E      [10] 1738 	jp	NZ,00118$
                           1739 ;src/main.c:375: if (!enemy->reversePatrol) {
   6CB8 21 0C 00      [10] 1740 	ld	hl,#0x000C
   6CBB 09            [11] 1741 	add	hl,bc
   6CBC DD 75 FE      [19] 1742 	ld	-2 (ix),l
   6CBF DD 74 FF      [19] 1743 	ld	-1 (ix),h
   6CC2 DD 6E FE      [19] 1744 	ld	l,-2 (ix)
   6CC5 DD 66 FF      [19] 1745 	ld	h,-1 (ix)
   6CC8 7E            [ 7] 1746 	ld	a,(hl)
   6CC9 DD 77 FD      [19] 1747 	ld	-3 (ix),a
                           1748 ;src/main.c:376: if(enemy->iter < enemy->longitud_camino){
   6CCC 21 0E 00      [10] 1749 	ld	hl,#0x000E
   6CCF 09            [11] 1750 	add	hl,bc
   6CD0 DD 75 FB      [19] 1751 	ld	-5 (ix),l
   6CD3 DD 74 FC      [19] 1752 	ld	-4 (ix),h
   6CD6 DD 6E FB      [19] 1753 	ld	l,-5 (ix)
   6CD9 DD 66 FC      [19] 1754 	ld	h,-4 (ix)
   6CDC 5E            [ 7] 1755 	ld	e,(hl)
   6CDD 23            [ 6] 1756 	inc	hl
   6CDE 56            [ 7] 1757 	ld	d,(hl)
   6CDF 21 E1 00      [10] 1758 	ld	hl,#0x00E1
   6CE2 09            [11] 1759 	add	hl,bc
   6CE3 DD 75 F9      [19] 1760 	ld	-7 (ix),l
   6CE6 DD 74 FA      [19] 1761 	ld	-6 (ix),h
                           1762 ;src/main.c:379: enemy->mover = SI;
   6CE9 21 06 00      [10] 1763 	ld	hl,#0x0006
   6CEC 09            [11] 1764 	add	hl,bc
   6CED DD 75 F7      [19] 1765 	ld	-9 (ix),l
   6CF0 DD 74 F8      [19] 1766 	ld	-8 (ix),h
                           1767 ;src/main.c:381: enemy->x = enemy->camino[enemy->iter];
   6CF3 21 19 00      [10] 1768 	ld	hl,#0x0019
   6CF6 09            [11] 1769 	add	hl,bc
   6CF7 DD 75 F5      [19] 1770 	ld	-11 (ix),l
   6CFA DD 74 F6      [19] 1771 	ld	-10 (ix),h
                           1772 ;src/main.c:383: enemy->y = enemy->camino[enemy->iter];
   6CFD 21 01 00      [10] 1773 	ld	hl,#0x0001
   6D00 09            [11] 1774 	add	hl,bc
   6D01 E3            [19] 1775 	ex	(sp), hl
                           1776 ;src/main.c:375: if (!enemy->reversePatrol) {
   6D02 DD 7E FD      [19] 1777 	ld	a,-3 (ix)
   6D05 B7            [ 4] 1778 	or	a, a
   6D06 C2 DD 6D      [10] 1779 	jp	NZ,00114$
                           1780 ;src/main.c:376: if(enemy->iter < enemy->longitud_camino){
   6D09 DD 6E F9      [19] 1781 	ld	l,-7 (ix)
   6D0C DD 66 FA      [19] 1782 	ld	h,-6 (ix)
   6D0F 6E            [ 7] 1783 	ld	l,(hl)
   6D10 26 00         [ 7] 1784 	ld	h,#0x00
   6D12 7B            [ 4] 1785 	ld	a,e
   6D13 95            [ 4] 1786 	sub	a, l
   6D14 7A            [ 4] 1787 	ld	a,d
   6D15 9C            [ 4] 1788 	sbc	a, h
   6D16 E2 1B 6D      [10] 1789 	jp	PO, 00144$
   6D19 EE 80         [ 7] 1790 	xor	a, #0x80
   6D1B                    1791 00144$:
   6D1B F2 B8 6D      [10] 1792 	jp	P,00105$
                           1793 ;src/main.c:377: if(enemy->iter == 0){
   6D1E 7A            [ 4] 1794 	ld	a,d
   6D1F B3            [ 4] 1795 	or	a,e
   6D20 20 50         [12] 1796 	jr	NZ,00102$
                           1797 ;src/main.c:379: enemy->mover = SI;
   6D22 DD 6E F7      [19] 1798 	ld	l,-9 (ix)
   6D25 DD 66 F8      [19] 1799 	ld	h,-8 (ix)
   6D28 36 01         [10] 1800 	ld	(hl),#0x01
                           1801 ;src/main.c:380: enemy->iter = 2;
   6D2A DD 6E FB      [19] 1802 	ld	l,-5 (ix)
   6D2D DD 66 FC      [19] 1803 	ld	h,-4 (ix)
   6D30 36 02         [10] 1804 	ld	(hl),#0x02
   6D32 23            [ 6] 1805 	inc	hl
   6D33 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:381: enemy->x = enemy->camino[enemy->iter];
   6D35 DD 6E FB      [19] 1808 	ld	l,-5 (ix)
   6D38 DD 66 FC      [19] 1809 	ld	h,-4 (ix)
   6D3B 5E            [ 7] 1810 	ld	e,(hl)
   6D3C 23            [ 6] 1811 	inc	hl
   6D3D 56            [ 7] 1812 	ld	d,(hl)
   6D3E DD 6E F5      [19] 1813 	ld	l,-11 (ix)
   6D41 DD 66 F6      [19] 1814 	ld	h,-10 (ix)
   6D44 19            [11] 1815 	add	hl,de
   6D45 7E            [ 7] 1816 	ld	a,(hl)
   6D46 02            [ 7] 1817 	ld	(bc),a
                           1818 ;src/main.c:382: ++enemy->iter;
   6D47 DD 6E FB      [19] 1819 	ld	l,-5 (ix)
   6D4A DD 66 FC      [19] 1820 	ld	h,-4 (ix)
   6D4D 4E            [ 7] 1821 	ld	c,(hl)
   6D4E 23            [ 6] 1822 	inc	hl
   6D4F 46            [ 7] 1823 	ld	b,(hl)
   6D50 03            [ 6] 1824 	inc	bc
   6D51 DD 6E FB      [19] 1825 	ld	l,-5 (ix)
   6D54 DD 66 FC      [19] 1826 	ld	h,-4 (ix)
   6D57 71            [ 7] 1827 	ld	(hl),c
   6D58 23            [ 6] 1828 	inc	hl
   6D59 70            [ 7] 1829 	ld	(hl),b
                           1830 ;src/main.c:383: enemy->y = enemy->camino[enemy->iter];
   6D5A DD 6E F5      [19] 1831 	ld	l,-11 (ix)
   6D5D DD 66 F6      [19] 1832 	ld	h,-10 (ix)
   6D60 09            [11] 1833 	add	hl,bc
   6D61 5E            [ 7] 1834 	ld	e,(hl)
   6D62 E1            [10] 1835 	pop	hl
   6D63 E5            [11] 1836 	push	hl
   6D64 73            [ 7] 1837 	ld	(hl),e
                           1838 ;src/main.c:384: ++enemy->iter;
   6D65 03            [ 6] 1839 	inc	bc
   6D66 DD 6E FB      [19] 1840 	ld	l,-5 (ix)
   6D69 DD 66 FC      [19] 1841 	ld	h,-4 (ix)
   6D6C 71            [ 7] 1842 	ld	(hl),c
   6D6D 23            [ 6] 1843 	inc	hl
   6D6E 70            [ 7] 1844 	ld	(hl),b
   6D6F C3 DF 6E      [10] 1845 	jp	00118$
   6D72                    1846 00102$:
                           1847 ;src/main.c:387: enemy->mover = SI;
   6D72 DD 6E F7      [19] 1848 	ld	l,-9 (ix)
   6D75 DD 66 F8      [19] 1849 	ld	h,-8 (ix)
   6D78 36 01         [10] 1850 	ld	(hl),#0x01
                           1851 ;src/main.c:388: enemy->x = enemy->camino[enemy->iter];
   6D7A DD 6E FB      [19] 1852 	ld	l,-5 (ix)
   6D7D DD 66 FC      [19] 1853 	ld	h,-4 (ix)
   6D80 5E            [ 7] 1854 	ld	e,(hl)
   6D81 23            [ 6] 1855 	inc	hl
   6D82 56            [ 7] 1856 	ld	d,(hl)
   6D83 DD 6E F5      [19] 1857 	ld	l,-11 (ix)
   6D86 DD 66 F6      [19] 1858 	ld	h,-10 (ix)
   6D89 19            [11] 1859 	add	hl,de
   6D8A 7E            [ 7] 1860 	ld	a,(hl)
   6D8B 02            [ 7] 1861 	ld	(bc),a
                           1862 ;src/main.c:389: ++enemy->iter;
   6D8C DD 6E FB      [19] 1863 	ld	l,-5 (ix)
   6D8F DD 66 FC      [19] 1864 	ld	h,-4 (ix)
   6D92 5E            [ 7] 1865 	ld	e,(hl)
   6D93 23            [ 6] 1866 	inc	hl
   6D94 56            [ 7] 1867 	ld	d,(hl)
   6D95 13            [ 6] 1868 	inc	de
   6D96 DD 6E FB      [19] 1869 	ld	l,-5 (ix)
   6D99 DD 66 FC      [19] 1870 	ld	h,-4 (ix)
   6D9C 73            [ 7] 1871 	ld	(hl),e
   6D9D 23            [ 6] 1872 	inc	hl
   6D9E 72            [ 7] 1873 	ld	(hl),d
                           1874 ;src/main.c:390: enemy->y = enemy->camino[enemy->iter];
   6D9F DD 6E F5      [19] 1875 	ld	l,-11 (ix)
   6DA2 DD 66 F6      [19] 1876 	ld	h,-10 (ix)
   6DA5 19            [11] 1877 	add	hl,de
   6DA6 7E            [ 7] 1878 	ld	a,(hl)
   6DA7 E1            [10] 1879 	pop	hl
   6DA8 E5            [11] 1880 	push	hl
   6DA9 77            [ 7] 1881 	ld	(hl),a
                           1882 ;src/main.c:391: ++enemy->iter;
   6DAA 13            [ 6] 1883 	inc	de
   6DAB 4B            [ 4] 1884 	ld	c,e
   6DAC DD 6E FB      [19] 1885 	ld	l,-5 (ix)
   6DAF DD 66 FC      [19] 1886 	ld	h,-4 (ix)
   6DB2 71            [ 7] 1887 	ld	(hl),c
   6DB3 23            [ 6] 1888 	inc	hl
   6DB4 72            [ 7] 1889 	ld	(hl),d
   6DB5 C3 DF 6E      [10] 1890 	jp	00118$
   6DB8                    1891 00105$:
                           1892 ;src/main.c:396: enemy->mover = NO;
   6DB8 DD 6E F7      [19] 1893 	ld	l,-9 (ix)
   6DBB DD 66 F8      [19] 1894 	ld	h,-8 (ix)
   6DBE 36 00         [10] 1895 	ld	(hl),#0x00
                           1896 ;src/main.c:397: enemy->iter = enemy->longitud_camino;
   6DC0 DD 6E F9      [19] 1897 	ld	l,-7 (ix)
   6DC3 DD 66 FA      [19] 1898 	ld	h,-6 (ix)
   6DC6 4E            [ 7] 1899 	ld	c,(hl)
   6DC7 06 00         [ 7] 1900 	ld	b,#0x00
   6DC9 DD 6E FB      [19] 1901 	ld	l,-5 (ix)
   6DCC DD 66 FC      [19] 1902 	ld	h,-4 (ix)
   6DCF 71            [ 7] 1903 	ld	(hl),c
   6DD0 23            [ 6] 1904 	inc	hl
   6DD1 70            [ 7] 1905 	ld	(hl),b
                           1906 ;src/main.c:401: enemy->reversePatrol = 1;
   6DD2 DD 6E FE      [19] 1907 	ld	l,-2 (ix)
   6DD5 DD 66 FF      [19] 1908 	ld	h,-1 (ix)
   6DD8 36 01         [10] 1909 	ld	(hl),#0x01
   6DDA C3 DF 6E      [10] 1910 	jp	00118$
   6DDD                    1911 00114$:
                           1912 ;src/main.c:406: if(enemy->iter > 0){
   6DDD AF            [ 4] 1913 	xor	a, a
   6DDE BB            [ 4] 1914 	cp	a, e
   6DDF 9A            [ 4] 1915 	sbc	a, d
   6DE0 E2 E5 6D      [10] 1916 	jp	PO, 00145$
   6DE3 EE 80         [ 7] 1917 	xor	a, #0x80
   6DE5                    1918 00145$:
   6DE5 F2 C5 6E      [10] 1919 	jp	P,00111$
                           1920 ;src/main.c:407: if(enemy->iter == enemy->longitud_camino){
   6DE8 DD 6E F9      [19] 1921 	ld	l,-7 (ix)
   6DEB DD 66 FA      [19] 1922 	ld	h,-6 (ix)
   6DEE 6E            [ 7] 1923 	ld	l,(hl)
   6DEF DD 75 F9      [19] 1924 	ld	-7 (ix),l
   6DF2 DD 36 FA 00   [19] 1925 	ld	-6 (ix),#0x00
   6DF6 7B            [ 4] 1926 	ld	a,e
   6DF7 DD 96 F9      [19] 1927 	sub	a, -7 (ix)
   6DFA C2 81 6E      [10] 1928 	jp	NZ,00108$
   6DFD 7A            [ 4] 1929 	ld	a,d
   6DFE DD 96 FA      [19] 1930 	sub	a, -6 (ix)
   6E01 C2 81 6E      [10] 1931 	jp	NZ,00108$
                           1932 ;src/main.c:408: enemy->mover = SI;
   6E04 DD 6E F7      [19] 1933 	ld	l,-9 (ix)
   6E07 DD 66 F8      [19] 1934 	ld	h,-8 (ix)
   6E0A 36 01         [10] 1935 	ld	(hl),#0x01
                           1936 ;src/main.c:409: enemy->iter = enemy->iter - 1;
   6E0C DD 6E FB      [19] 1937 	ld	l,-5 (ix)
   6E0F DD 66 FC      [19] 1938 	ld	h,-4 (ix)
   6E12 5E            [ 7] 1939 	ld	e,(hl)
   6E13 23            [ 6] 1940 	inc	hl
   6E14 56            [ 7] 1941 	ld	d,(hl)
   6E15 7B            [ 4] 1942 	ld	a,e
   6E16 C6 FF         [ 7] 1943 	add	a,#0xFF
   6E18 DD 77 F9      [19] 1944 	ld	-7 (ix),a
   6E1B 7A            [ 4] 1945 	ld	a,d
   6E1C CE FF         [ 7] 1946 	adc	a,#0xFF
   6E1E DD 77 FA      [19] 1947 	ld	-6 (ix),a
   6E21 DD 6E FB      [19] 1948 	ld	l,-5 (ix)
   6E24 DD 66 FC      [19] 1949 	ld	h,-4 (ix)
   6E27 DD 7E F9      [19] 1950 	ld	a,-7 (ix)
   6E2A 77            [ 7] 1951 	ld	(hl),a
   6E2B 23            [ 6] 1952 	inc	hl
   6E2C DD 7E FA      [19] 1953 	ld	a,-6 (ix)
   6E2F 77            [ 7] 1954 	ld	(hl),a
                           1955 ;src/main.c:410: enemy->iter = enemy->iter - 2;
   6E30 DD 5E F9      [19] 1956 	ld	e,-7 (ix)
   6E33 DD 56 FA      [19] 1957 	ld	d,-6 (ix)
   6E36 1B            [ 6] 1958 	dec	de
   6E37 1B            [ 6] 1959 	dec	de
   6E38 DD 6E FB      [19] 1960 	ld	l,-5 (ix)
   6E3B DD 66 FC      [19] 1961 	ld	h,-4 (ix)
   6E3E 73            [ 7] 1962 	ld	(hl),e
   6E3F 23            [ 6] 1963 	inc	hl
   6E40 72            [ 7] 1964 	ld	(hl),d
                           1965 ;src/main.c:411: enemy->y = enemy->camino[enemy->iter];
   6E41 DD 6E F5      [19] 1966 	ld	l,-11 (ix)
   6E44 DD 66 F6      [19] 1967 	ld	h,-10 (ix)
   6E47 19            [11] 1968 	add	hl,de
   6E48 5E            [ 7] 1969 	ld	e,(hl)
   6E49 E1            [10] 1970 	pop	hl
   6E4A E5            [11] 1971 	push	hl
   6E4B 73            [ 7] 1972 	ld	(hl),e
                           1973 ;src/main.c:412: --enemy->iter;
   6E4C DD 7E F9      [19] 1974 	ld	a,-7 (ix)
   6E4F C6 FD         [ 7] 1975 	add	a,#0xFD
   6E51 5F            [ 4] 1976 	ld	e,a
   6E52 DD 7E FA      [19] 1977 	ld	a,-6 (ix)
   6E55 CE FF         [ 7] 1978 	adc	a,#0xFF
   6E57 57            [ 4] 1979 	ld	d,a
   6E58 DD 6E FB      [19] 1980 	ld	l,-5 (ix)
   6E5B DD 66 FC      [19] 1981 	ld	h,-4 (ix)
   6E5E 73            [ 7] 1982 	ld	(hl),e
   6E5F 23            [ 6] 1983 	inc	hl
   6E60 72            [ 7] 1984 	ld	(hl),d
                           1985 ;src/main.c:413: enemy->x = enemy->camino[enemy->iter];
   6E61 DD 6E F5      [19] 1986 	ld	l,-11 (ix)
   6E64 DD 66 F6      [19] 1987 	ld	h,-10 (ix)
   6E67 19            [11] 1988 	add	hl,de
   6E68 7E            [ 7] 1989 	ld	a,(hl)
   6E69 02            [ 7] 1990 	ld	(bc),a
                           1991 ;src/main.c:414: --enemy->iter;
   6E6A DD 7E F9      [19] 1992 	ld	a,-7 (ix)
   6E6D C6 FC         [ 7] 1993 	add	a,#0xFC
   6E6F 4F            [ 4] 1994 	ld	c,a
   6E70 DD 7E FA      [19] 1995 	ld	a,-6 (ix)
   6E73 CE FF         [ 7] 1996 	adc	a,#0xFF
   6E75 47            [ 4] 1997 	ld	b,a
   6E76 DD 6E FB      [19] 1998 	ld	l,-5 (ix)
   6E79 DD 66 FC      [19] 1999 	ld	h,-4 (ix)
   6E7C 71            [ 7] 2000 	ld	(hl),c
   6E7D 23            [ 6] 2001 	inc	hl
   6E7E 70            [ 7] 2002 	ld	(hl),b
   6E7F 18 5E         [12] 2003 	jr	00118$
   6E81                    2004 00108$:
                           2005 ;src/main.c:416: enemy->mover = SI;
   6E81 DD 6E F7      [19] 2006 	ld	l,-9 (ix)
   6E84 DD 66 F8      [19] 2007 	ld	h,-8 (ix)
   6E87 36 01         [10] 2008 	ld	(hl),#0x01
                           2009 ;src/main.c:417: enemy->y = enemy->camino[enemy->iter];
   6E89 DD 6E FB      [19] 2010 	ld	l,-5 (ix)
   6E8C DD 66 FC      [19] 2011 	ld	h,-4 (ix)
   6E8F 5E            [ 7] 2012 	ld	e,(hl)
   6E90 23            [ 6] 2013 	inc	hl
   6E91 56            [ 7] 2014 	ld	d,(hl)
   6E92 DD 6E F5      [19] 2015 	ld	l,-11 (ix)
   6E95 DD 66 F6      [19] 2016 	ld	h,-10 (ix)
   6E98 19            [11] 2017 	add	hl,de
   6E99 5E            [ 7] 2018 	ld	e,(hl)
   6E9A E1            [10] 2019 	pop	hl
   6E9B E5            [11] 2020 	push	hl
   6E9C 73            [ 7] 2021 	ld	(hl),e
                           2022 ;src/main.c:418: --enemy->iter;
   6E9D DD 6E FB      [19] 2023 	ld	l,-5 (ix)
   6EA0 DD 66 FC      [19] 2024 	ld	h,-4 (ix)
   6EA3 5E            [ 7] 2025 	ld	e,(hl)
   6EA4 23            [ 6] 2026 	inc	hl
   6EA5 56            [ 7] 2027 	ld	d,(hl)
   6EA6 1B            [ 6] 2028 	dec	de
   6EA7 DD 6E FB      [19] 2029 	ld	l,-5 (ix)
   6EAA DD 66 FC      [19] 2030 	ld	h,-4 (ix)
   6EAD 73            [ 7] 2031 	ld	(hl),e
   6EAE 23            [ 6] 2032 	inc	hl
   6EAF 72            [ 7] 2033 	ld	(hl),d
                           2034 ;src/main.c:419: enemy->x = enemy->camino[enemy->iter];
   6EB0 DD 6E F5      [19] 2035 	ld	l,-11 (ix)
   6EB3 DD 66 F6      [19] 2036 	ld	h,-10 (ix)
   6EB6 19            [11] 2037 	add	hl,de
   6EB7 7E            [ 7] 2038 	ld	a,(hl)
   6EB8 02            [ 7] 2039 	ld	(bc),a
                           2040 ;src/main.c:420: --enemy->iter;
   6EB9 1B            [ 6] 2041 	dec	de
   6EBA DD 6E FB      [19] 2042 	ld	l,-5 (ix)
   6EBD DD 66 FC      [19] 2043 	ld	h,-4 (ix)
   6EC0 73            [ 7] 2044 	ld	(hl),e
   6EC1 23            [ 6] 2045 	inc	hl
   6EC2 72            [ 7] 2046 	ld	(hl),d
   6EC3 18 1A         [12] 2047 	jr	00118$
   6EC5                    2048 00111$:
                           2049 ;src/main.c:425: enemy->mover = NO;
   6EC5 DD 6E F7      [19] 2050 	ld	l,-9 (ix)
   6EC8 DD 66 F8      [19] 2051 	ld	h,-8 (ix)
   6ECB 36 00         [10] 2052 	ld	(hl),#0x00
                           2053 ;src/main.c:426: enemy->iter = 0;
   6ECD DD 6E FB      [19] 2054 	ld	l,-5 (ix)
   6ED0 DD 66 FC      [19] 2055 	ld	h,-4 (ix)
   6ED3 AF            [ 4] 2056 	xor	a, a
   6ED4 77            [ 7] 2057 	ld	(hl), a
   6ED5 23            [ 6] 2058 	inc	hl
   6ED6 77            [ 7] 2059 	ld	(hl), a
                           2060 ;src/main.c:428: enemy->reversePatrol = 0;
   6ED7 DD 6E FE      [19] 2061 	ld	l,-2 (ix)
   6EDA DD 66 FF      [19] 2062 	ld	h,-1 (ix)
   6EDD 36 00         [10] 2063 	ld	(hl),#0x00
   6EDF                    2064 00118$:
   6EDF DD F9         [10] 2065 	ld	sp, ix
   6EE1 DD E1         [14] 2066 	pop	ix
   6EE3 C9            [10] 2067 	ret
                           2068 ;src/main.c:435: void lookFor(TEnemy* enemy){
                           2069 ;	---------------------------------
                           2070 ; Function lookFor
                           2071 ; ---------------------------------
   6EE4                    2072 _lookFor::
   6EE4 DD E5         [15] 2073 	push	ix
   6EE6 DD 21 00 00   [14] 2074 	ld	ix,#0
   6EEA DD 39         [15] 2075 	add	ix,sp
   6EEC 21 F9 FF      [10] 2076 	ld	hl,#-7
   6EEF 39            [11] 2077 	add	hl,sp
   6EF0 F9            [ 6] 2078 	ld	sp,hl
                           2079 ;src/main.c:444: i16 difx = abs((i16)(enemy->x - prota.x));
   6EF1 DD 5E 04      [19] 2080 	ld	e,4 (ix)
   6EF4 DD 56 05      [19] 2081 	ld	d,5 (ix)
   6EF7 1A            [ 7] 2082 	ld	a,(de)
   6EF8 4F            [ 4] 2083 	ld	c,a
   6EF9 06 00         [ 7] 2084 	ld	b,#0x00
   6EFB 21 F8 62      [10] 2085 	ld	hl,#_prota+0
   6EFE 6E            [ 7] 2086 	ld	l,(hl)
   6EFF 26 00         [ 7] 2087 	ld	h,#0x00
   6F01 79            [ 4] 2088 	ld	a,c
   6F02 95            [ 4] 2089 	sub	a, l
   6F03 4F            [ 4] 2090 	ld	c,a
   6F04 78            [ 4] 2091 	ld	a,b
   6F05 9C            [ 4] 2092 	sbc	a, h
   6F06 47            [ 4] 2093 	ld	b,a
   6F07 D5            [11] 2094 	push	de
   6F08 C5            [11] 2095 	push	bc
   6F09 CD 70 4A      [17] 2096 	call	_abs
   6F0C F1            [10] 2097 	pop	af
   6F0D D1            [10] 2098 	pop	de
   6F0E DD 75 FA      [19] 2099 	ld	-6 (ix),l
   6F11 DD 74 FB      [19] 2100 	ld	-5 (ix),h
                           2101 ;src/main.c:445: i16 dify = abs((i16)(enemy->y - prota.y));
   6F14 21 01 00      [10] 2102 	ld	hl,#0x0001
   6F17 19            [11] 2103 	add	hl,de
   6F18 DD 75 FE      [19] 2104 	ld	-2 (ix),l
   6F1B DD 74 FF      [19] 2105 	ld	-1 (ix),h
   6F1E DD 6E FE      [19] 2106 	ld	l,-2 (ix)
   6F21 DD 66 FF      [19] 2107 	ld	h,-1 (ix)
   6F24 4E            [ 7] 2108 	ld	c,(hl)
   6F25 06 00         [ 7] 2109 	ld	b,#0x00
   6F27 21 F9 62      [10] 2110 	ld	hl, #(_prota + 0x0001) + 0
   6F2A 6E            [ 7] 2111 	ld	l,(hl)
   6F2B 26 00         [ 7] 2112 	ld	h,#0x00
   6F2D 79            [ 4] 2113 	ld	a,c
   6F2E 95            [ 4] 2114 	sub	a, l
   6F2F 4F            [ 4] 2115 	ld	c,a
   6F30 78            [ 4] 2116 	ld	a,b
   6F31 9C            [ 4] 2117 	sbc	a, h
   6F32 47            [ 4] 2118 	ld	b,a
   6F33 D5            [11] 2119 	push	de
   6F34 C5            [11] 2120 	push	bc
   6F35 CD 70 4A      [17] 2121 	call	_abs
   6F38 F1            [10] 2122 	pop	af
   6F39 D1            [10] 2123 	pop	de
                           2124 ;src/main.c:447: dist = difx + dify; // manhattan
   6F3A DD 4E FA      [19] 2125 	ld	c,-6 (ix)
   6F3D 09            [11] 2126 	add	hl, bc
   6F3E DD 75 F9      [19] 2127 	ld	-7 (ix),l
                           2128 ;src/main.c:448: enemy->seen = NO;
   6F41 21 12 00      [10] 2129 	ld	hl,#0x0012
   6F44 19            [11] 2130 	add	hl,de
   6F45 DD 75 FC      [19] 2131 	ld	-4 (ix),l
   6F48 DD 74 FD      [19] 2132 	ld	-3 (ix),h
   6F4B DD 6E FC      [19] 2133 	ld	l,-4 (ix)
   6F4E DD 66 FD      [19] 2134 	ld	h,-3 (ix)
   6F51 36 00         [10] 2135 	ld	(hl),#0x00
                           2136 ;src/main.c:449: enemy->inRange = NO;
   6F53 21 11 00      [10] 2137 	ld	hl,#0x0011
   6F56 19            [11] 2138 	add	hl,de
   6F57 4D            [ 4] 2139 	ld	c,l
   6F58 44            [ 4] 2140 	ld	b,h
   6F59 AF            [ 4] 2141 	xor	a, a
   6F5A 02            [ 7] 2142 	ld	(bc),a
                           2143 ;src/main.c:450: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6F5B C5            [11] 2144 	push	bc
   6F5C D5            [11] 2145 	push	de
   6F5D 21 18 5A      [10] 2146 	ld	hl,#0x5A18
   6F60 E5            [11] 2147 	push	hl
   6F61 21 00 C0      [10] 2148 	ld	hl,#0xC000
   6F64 E5            [11] 2149 	push	hl
   6F65 CD 15 5F      [17] 2150 	call	_cpct_getScreenPtr
   6F68 D1            [10] 2151 	pop	de
   6F69 C1            [10] 2152 	pop	bc
                           2153 ;src/main.c:451: if(!enemy->seek){
   6F6A D5            [11] 2154 	push	de
   6F6B FD E1         [14] 2155 	pop	iy
   6F6D FD 7E 14      [19] 2156 	ld	a,20 (iy)
   6F70 B7            [ 4] 2157 	or	a, a
   6F71 20 7B         [12] 2158 	jr	NZ,00111$
                           2159 ;src/main.c:452: if (dist <= 10) {// te detectan los sensores de proximidad
   6F73 3E 0A         [ 7] 2160 	ld	a,#0x0A
   6F75 DD 96 F9      [19] 2161 	sub	a, -7 (ix)
   6F78 38 0B         [12] 2162 	jr	C,00107$
                           2163 ;src/main.c:453: enemy->inRange = 1;
   6F7A 3E 01         [ 7] 2164 	ld	a,#0x01
   6F7C 02            [ 7] 2165 	ld	(bc),a
                           2166 ;src/main.c:454: enemy->engage = 1;
   6F7D 21 16 00      [10] 2167 	ld	hl,#0x0016
   6F80 19            [11] 2168 	add	hl,de
   6F81 36 01         [10] 2169 	ld	(hl),#0x01
   6F83 18 69         [12] 2170 	jr	00111$
   6F85                    2171 00107$:
                           2172 ;src/main.c:455: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6F85 21 F8 62      [10] 2173 	ld	hl, #_prota + 0
   6F88 4E            [ 7] 2174 	ld	c,(hl)
   6F89 1A            [ 7] 2175 	ld	a,(de)
   6F8A 5F            [ 4] 2176 	ld	e,a
   6F8B 16 00         [ 7] 2177 	ld	d,#0x00
   6F8D 7B            [ 4] 2178 	ld	a,e
   6F8E C6 E7         [ 7] 2179 	add	a,#0xE7
   6F90 6F            [ 4] 2180 	ld	l,a
   6F91 7A            [ 4] 2181 	ld	a,d
   6F92 CE FF         [ 7] 2182 	adc	a,#0xFF
   6F94 67            [ 4] 2183 	ld	h,a
   6F95 06 00         [ 7] 2184 	ld	b,#0x00
   6F97 7D            [ 4] 2185 	ld	a,l
   6F98 91            [ 4] 2186 	sub	a, c
   6F99 7C            [ 4] 2187 	ld	a,h
   6F9A 98            [ 4] 2188 	sbc	a, b
   6F9B E2 A0 6F      [10] 2189 	jp	PO, 00137$
   6F9E EE 80         [ 7] 2190 	xor	a, #0x80
   6FA0                    2191 00137$:
   6FA0 F2 EE 6F      [10] 2192 	jp	P,00111$
   6FA3 21 19 00      [10] 2193 	ld	hl,#0x0019
   6FA6 19            [11] 2194 	add	hl,de
   6FA7 79            [ 4] 2195 	ld	a,c
   6FA8 95            [ 4] 2196 	sub	a, l
   6FA9 78            [ 4] 2197 	ld	a,b
   6FAA 9C            [ 4] 2198 	sbc	a, h
   6FAB E2 B0 6F      [10] 2199 	jp	PO, 00138$
   6FAE EE 80         [ 7] 2200 	xor	a, #0x80
   6FB0                    2201 00138$:
   6FB0 F2 EE 6F      [10] 2202 	jp	P,00111$
                           2203 ;src/main.c:456: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6FB3 21 F9 62      [10] 2204 	ld	hl, #(_prota + 0x0001) + 0
   6FB6 4E            [ 7] 2205 	ld	c,(hl)
   6FB7 DD 6E FE      [19] 2206 	ld	l,-2 (ix)
   6FBA DD 66 FF      [19] 2207 	ld	h,-1 (ix)
   6FBD 5E            [ 7] 2208 	ld	e,(hl)
   6FBE 16 00         [ 7] 2209 	ld	d,#0x00
   6FC0 7B            [ 4] 2210 	ld	a,e
   6FC1 C6 CC         [ 7] 2211 	add	a,#0xCC
   6FC3 6F            [ 4] 2212 	ld	l,a
   6FC4 7A            [ 4] 2213 	ld	a,d
   6FC5 CE FF         [ 7] 2214 	adc	a,#0xFF
   6FC7 67            [ 4] 2215 	ld	h,a
   6FC8 06 00         [ 7] 2216 	ld	b,#0x00
   6FCA 7D            [ 4] 2217 	ld	a,l
   6FCB 91            [ 4] 2218 	sub	a, c
   6FCC 7C            [ 4] 2219 	ld	a,h
   6FCD 98            [ 4] 2220 	sbc	a, b
   6FCE E2 D3 6F      [10] 2221 	jp	PO, 00139$
   6FD1 EE 80         [ 7] 2222 	xor	a, #0x80
   6FD3                    2223 00139$:
   6FD3 F2 EE 6F      [10] 2224 	jp	P,00111$
   6FD6 21 34 00      [10] 2225 	ld	hl,#0x0034
   6FD9 19            [11] 2226 	add	hl,de
   6FDA 79            [ 4] 2227 	ld	a,c
   6FDB 95            [ 4] 2228 	sub	a, l
   6FDC 78            [ 4] 2229 	ld	a,b
   6FDD 9C            [ 4] 2230 	sbc	a, h
   6FDE E2 E3 6F      [10] 2231 	jp	PO, 00140$
   6FE1 EE 80         [ 7] 2232 	xor	a, #0x80
   6FE3                    2233 00140$:
   6FE3 F2 EE 6F      [10] 2234 	jp	P,00111$
                           2235 ;src/main.c:457: enemy->seen = SI;
   6FE6 DD 6E FC      [19] 2236 	ld	l,-4 (ix)
   6FE9 DD 66 FD      [19] 2237 	ld	h,-3 (ix)
   6FEC 36 01         [10] 2238 	ld	(hl),#0x01
   6FEE                    2239 00111$:
   6FEE DD F9         [10] 2240 	ld	sp, ix
   6FF0 DD E1         [14] 2241 	pop	ix
   6FF2 C9            [10] 2242 	ret
                           2243 ;src/main.c:463: void moverEnemigoSeek(TEnemy* actual){
                           2244 ;	---------------------------------
                           2245 ; Function moverEnemigoSeek
                           2246 ; ---------------------------------
   6FF3                    2247 _moverEnemigoSeek::
   6FF3 DD E5         [15] 2248 	push	ix
   6FF5 DD 21 00 00   [14] 2249 	ld	ix,#0
   6FF9 DD 39         [15] 2250 	add	ix,sp
   6FFB 21 F6 FF      [10] 2251 	ld	hl,#-10
   6FFE 39            [11] 2252 	add	hl,sp
   6FFF F9            [ 6] 2253 	ld	sp,hl
                           2254 ;src/main.c:466: if(!actual->muerto){
   7000 DD 4E 04      [19] 2255 	ld	c,4 (ix)
   7003 DD 46 05      [19] 2256 	ld	b,5 (ix)
   7006 C5            [11] 2257 	push	bc
   7007 FD E1         [14] 2258 	pop	iy
   7009 FD 7E 08      [19] 2259 	ld	a,8 (iy)
   700C B7            [ 4] 2260 	or	a, a
   700D C2 93 71      [10] 2261 	jp	NZ,00114$
                           2262 ;src/main.c:469: if (!actual->reversePatrol) {
   7010 21 0C 00      [10] 2263 	ld	hl,#0x000C
   7013 09            [11] 2264 	add	hl,bc
   7014 EB            [ 4] 2265 	ex	de,hl
   7015 1A            [ 7] 2266 	ld	a,(de)
   7016 B7            [ 4] 2267 	or	a, a
   7017 C2 93 71      [10] 2268 	jp	NZ,00114$
                           2269 ;src/main.c:470: if(actual->iter < actual->longitud_camino){
   701A 21 0E 00      [10] 2270 	ld	hl,#0x000E
   701D 09            [11] 2271 	add	hl,bc
   701E DD 75 F8      [19] 2272 	ld	-8 (ix),l
   7021 DD 74 F9      [19] 2273 	ld	-7 (ix),h
   7024 DD 6E F8      [19] 2274 	ld	l,-8 (ix)
   7027 DD 66 F9      [19] 2275 	ld	h,-7 (ix)
   702A 7E            [ 7] 2276 	ld	a,(hl)
   702B DD 77 F6      [19] 2277 	ld	-10 (ix),a
   702E 23            [ 6] 2278 	inc	hl
   702F 7E            [ 7] 2279 	ld	a,(hl)
   7030 DD 77 F7      [19] 2280 	ld	-9 (ix),a
   7033 69            [ 4] 2281 	ld	l, c
   7034 60            [ 4] 2282 	ld	h, b
   7035 C5            [11] 2283 	push	bc
   7036 01 E1 00      [10] 2284 	ld	bc, #0x00E1
   7039 09            [11] 2285 	add	hl, bc
   703A C1            [10] 2286 	pop	bc
   703B 6E            [ 7] 2287 	ld	l,(hl)
   703C 26 00         [ 7] 2288 	ld	h,#0x00
                           2289 ;src/main.c:479: actual->y = actual->camino[actual->iter];
   703E 79            [ 4] 2290 	ld	a,c
   703F C6 01         [ 7] 2291 	add	a, #0x01
   7041 DD 77 FA      [19] 2292 	ld	-6 (ix),a
   7044 78            [ 4] 2293 	ld	a,b
   7045 CE 00         [ 7] 2294 	adc	a, #0x00
   7047 DD 77 FB      [19] 2295 	ld	-5 (ix),a
                           2296 ;src/main.c:470: if(actual->iter < actual->longitud_camino){
   704A DD 7E F6      [19] 2297 	ld	a,-10 (ix)
   704D 95            [ 4] 2298 	sub	a, l
   704E DD 7E F7      [19] 2299 	ld	a,-9 (ix)
   7051 9C            [ 4] 2300 	sbc	a, h
   7052 E2 57 70      [10] 2301 	jp	PO, 00136$
   7055 EE 80         [ 7] 2302 	xor	a, #0x80
   7057                    2303 00136$:
   7057 F2 EC 70      [10] 2304 	jp	P,00108$
                           2305 ;src/main.c:475: actual->mover = SI;
   705A 21 06 00      [10] 2306 	ld	hl,#0x0006
   705D 09            [11] 2307 	add	hl,bc
                           2308 ;src/main.c:477: actual->x = actual->camino[actual->iter];
   705E 79            [ 4] 2309 	ld	a,c
   705F C6 19         [ 7] 2310 	add	a, #0x19
   7061 5F            [ 4] 2311 	ld	e,a
   7062 78            [ 4] 2312 	ld	a,b
   7063 CE 00         [ 7] 2313 	adc	a, #0x00
   7065 57            [ 4] 2314 	ld	d,a
                           2315 ;src/main.c:473: if(actual->iter == 0){
   7066 DD 7E F7      [19] 2316 	ld	a,-9 (ix)
   7069 DD B6 F6      [19] 2317 	or	a,-10 (ix)
   706C 20 45         [12] 2318 	jr	NZ,00102$
                           2319 ;src/main.c:475: actual->mover = SI;
   706E 36 01         [10] 2320 	ld	(hl),#0x01
                           2321 ;src/main.c:476: actual->iter = 2;
   7070 DD 6E F8      [19] 2322 	ld	l,-8 (ix)
   7073 DD 66 F9      [19] 2323 	ld	h,-7 (ix)
   7076 36 02         [10] 2324 	ld	(hl),#0x02
   7078 23            [ 6] 2325 	inc	hl
   7079 36 00         [10] 2326 	ld	(hl),#0x00
                           2327 ;src/main.c:477: actual->x = actual->camino[actual->iter];
   707B DD 6E F8      [19] 2328 	ld	l,-8 (ix)
   707E DD 66 F9      [19] 2329 	ld	h,-7 (ix)
   7081 7E            [ 7] 2330 	ld	a, (hl)
   7082 23            [ 6] 2331 	inc	hl
   7083 66            [ 7] 2332 	ld	h,(hl)
   7084 6F            [ 4] 2333 	ld	l,a
   7085 19            [11] 2334 	add	hl,de
   7086 7E            [ 7] 2335 	ld	a,(hl)
   7087 02            [ 7] 2336 	ld	(bc),a
                           2337 ;src/main.c:478: ++actual->iter;
   7088 DD 6E F8      [19] 2338 	ld	l,-8 (ix)
   708B DD 66 F9      [19] 2339 	ld	h,-7 (ix)
   708E 4E            [ 7] 2340 	ld	c,(hl)
   708F 23            [ 6] 2341 	inc	hl
   7090 46            [ 7] 2342 	ld	b,(hl)
   7091 03            [ 6] 2343 	inc	bc
   7092 DD 6E F8      [19] 2344 	ld	l,-8 (ix)
   7095 DD 66 F9      [19] 2345 	ld	h,-7 (ix)
   7098 71            [ 7] 2346 	ld	(hl),c
   7099 23            [ 6] 2347 	inc	hl
   709A 70            [ 7] 2348 	ld	(hl),b
                           2349 ;src/main.c:479: actual->y = actual->camino[actual->iter];
   709B 69            [ 4] 2350 	ld	l, c
   709C 60            [ 4] 2351 	ld	h, b
   709D 19            [11] 2352 	add	hl,de
   709E 5E            [ 7] 2353 	ld	e,(hl)
   709F DD 6E FA      [19] 2354 	ld	l,-6 (ix)
   70A2 DD 66 FB      [19] 2355 	ld	h,-5 (ix)
   70A5 73            [ 7] 2356 	ld	(hl),e
                           2357 ;src/main.c:480: ++actual->iter;
   70A6 03            [ 6] 2358 	inc	bc
   70A7 DD 6E F8      [19] 2359 	ld	l,-8 (ix)
   70AA DD 66 F9      [19] 2360 	ld	h,-7 (ix)
   70AD 71            [ 7] 2361 	ld	(hl),c
   70AE 23            [ 6] 2362 	inc	hl
   70AF 70            [ 7] 2363 	ld	(hl),b
   70B0 C3 93 71      [10] 2364 	jp	00114$
   70B3                    2365 00102$:
                           2366 ;src/main.c:483: actual->mover = SI;
   70B3 36 01         [10] 2367 	ld	(hl),#0x01
                           2368 ;src/main.c:484: actual->x = actual->camino[actual->iter];
   70B5 DD 6E F8      [19] 2369 	ld	l,-8 (ix)
   70B8 DD 66 F9      [19] 2370 	ld	h,-7 (ix)
   70BB 7E            [ 7] 2371 	ld	a, (hl)
   70BC 23            [ 6] 2372 	inc	hl
   70BD 66            [ 7] 2373 	ld	h,(hl)
   70BE 6F            [ 4] 2374 	ld	l,a
   70BF 19            [11] 2375 	add	hl,de
   70C0 7E            [ 7] 2376 	ld	a,(hl)
   70C1 02            [ 7] 2377 	ld	(bc),a
                           2378 ;src/main.c:485: ++actual->iter;
   70C2 DD 6E F8      [19] 2379 	ld	l,-8 (ix)
   70C5 DD 66 F9      [19] 2380 	ld	h,-7 (ix)
   70C8 4E            [ 7] 2381 	ld	c,(hl)
   70C9 23            [ 6] 2382 	inc	hl
   70CA 46            [ 7] 2383 	ld	b,(hl)
   70CB 03            [ 6] 2384 	inc	bc
   70CC DD 6E F8      [19] 2385 	ld	l,-8 (ix)
   70CF DD 66 F9      [19] 2386 	ld	h,-7 (ix)
   70D2 71            [ 7] 2387 	ld	(hl),c
   70D3 23            [ 6] 2388 	inc	hl
   70D4 70            [ 7] 2389 	ld	(hl),b
                           2390 ;src/main.c:486: actual->y = actual->camino[actual->iter];
   70D5 EB            [ 4] 2391 	ex	de,hl
   70D6 09            [11] 2392 	add	hl,bc
   70D7 5E            [ 7] 2393 	ld	e,(hl)
   70D8 DD 6E FA      [19] 2394 	ld	l,-6 (ix)
   70DB DD 66 FB      [19] 2395 	ld	h,-5 (ix)
   70DE 73            [ 7] 2396 	ld	(hl),e
                           2397 ;src/main.c:487: ++actual->iter;
   70DF 03            [ 6] 2398 	inc	bc
   70E0 DD 6E F8      [19] 2399 	ld	l,-8 (ix)
   70E3 DD 66 F9      [19] 2400 	ld	h,-7 (ix)
   70E6 71            [ 7] 2401 	ld	(hl),c
   70E7 23            [ 6] 2402 	inc	hl
   70E8 70            [ 7] 2403 	ld	(hl),b
   70E9 C3 93 71      [10] 2404 	jp	00114$
   70EC                    2405 00108$:
                           2406 ;src/main.c:492: lookFor(actual);
   70EC C5            [11] 2407 	push	bc
   70ED D5            [11] 2408 	push	de
   70EE C5            [11] 2409 	push	bc
   70EF CD E4 6E      [17] 2410 	call	_lookFor
   70F2 F1            [10] 2411 	pop	af
   70F3 D1            [10] 2412 	pop	de
   70F4 C1            [10] 2413 	pop	bc
                           2414 ;src/main.c:493: actual->reversePatrol = NO;
   70F5 AF            [ 4] 2415 	xor	a, a
   70F6 12            [ 7] 2416 	ld	(de),a
                           2417 ;src/main.c:494: if(!actual->seen){
   70F7 C5            [11] 2418 	push	bc
   70F8 FD E1         [14] 2419 	pop	iy
   70FA FD 5E 12      [19] 2420 	ld	e,18 (iy)
                           2421 ;src/main.c:495: actual->patrolling = 1;
   70FD 21 0B 00      [10] 2422 	ld	hl,#0x000B
   7100 09            [11] 2423 	add	hl,bc
   7101 E3            [19] 2424 	ex	(sp), hl
                           2425 ;src/main.c:496: actual->seek = 0;
   7102 21 14 00      [10] 2426 	ld	hl,#0x0014
   7105 09            [11] 2427 	add	hl,bc
   7106 DD 75 FC      [19] 2428 	ld	-4 (ix),l
   7109 DD 74 FD      [19] 2429 	ld	-3 (ix),h
                           2430 ;src/main.c:494: if(!actual->seen){
   710C 7B            [ 4] 2431 	ld	a,e
   710D B7            [ 4] 2432 	or	a, a
   710E 20 39         [12] 2433 	jr	NZ,00105$
                           2434 ;src/main.c:495: actual->patrolling = 1;
   7110 E1            [10] 2435 	pop	hl
   7111 E5            [11] 2436 	push	hl
   7112 36 01         [10] 2437 	ld	(hl),#0x01
                           2438 ;src/main.c:496: actual->seek = 0;
   7114 DD 6E FC      [19] 2439 	ld	l,-4 (ix)
   7117 DD 66 FD      [19] 2440 	ld	h,-3 (ix)
   711A 36 00         [10] 2441 	ld	(hl),#0x00
                           2442 ;src/main.c:497: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   711C 21 F9 62      [10] 2443 	ld	hl, #_prota + 1
   711F 56            [ 7] 2444 	ld	d,(hl)
   7120 21 F8 62      [10] 2445 	ld	hl, #_prota + 0
   7123 5E            [ 7] 2446 	ld	e,(hl)
   7124 DD 6E FA      [19] 2447 	ld	l,-6 (ix)
   7127 DD 66 FB      [19] 2448 	ld	h,-5 (ix)
   712A 7E            [ 7] 2449 	ld	a,(hl)
   712B DD 77 FF      [19] 2450 	ld	-1 (ix),a
   712E 0A            [ 7] 2451 	ld	a,(bc)
   712F DD 77 FE      [19] 2452 	ld	-2 (ix),a
   7132 2A D5 63      [16] 2453 	ld	hl,(_mapa)
   7135 E5            [11] 2454 	push	hl
   7136 C5            [11] 2455 	push	bc
   7137 D5            [11] 2456 	push	de
   7138 DD 66 FF      [19] 2457 	ld	h,-1 (ix)
   713B DD 6E FE      [19] 2458 	ld	l,-2 (ix)
   713E E5            [11] 2459 	push	hl
   713F CD 82 48      [17] 2460 	call	_pathFinding
   7142 21 08 00      [10] 2461 	ld	hl,#8
   7145 39            [11] 2462 	add	hl,sp
   7146 F9            [ 6] 2463 	ld	sp,hl
   7147 18 40         [12] 2464 	jr	00106$
   7149                    2465 00105$:
                           2466 ;src/main.c:499: actual->patrolling = 0;
   7149 E1            [10] 2467 	pop	hl
   714A E5            [11] 2468 	push	hl
   714B 36 00         [10] 2469 	ld	(hl),#0x00
                           2470 ;src/main.c:500: actual->seek = 1;
   714D DD 6E FC      [19] 2471 	ld	l,-4 (ix)
   7150 DD 66 FD      [19] 2472 	ld	h,-3 (ix)
   7153 36 01         [10] 2473 	ld	(hl),#0x01
                           2474 ;src/main.c:501: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7155 C5            [11] 2475 	push	bc
   7156 FD E1         [14] 2476 	pop	iy
   7158 FD 7E 18      [19] 2477 	ld	a,24 (iy)
   715B DD 77 FE      [19] 2478 	ld	-2 (ix),a
   715E C5            [11] 2479 	push	bc
   715F FD E1         [14] 2480 	pop	iy
   7161 FD 7E 17      [19] 2481 	ld	a,23 (iy)
   7164 DD 77 FF      [19] 2482 	ld	-1 (ix),a
   7167 DD 6E FA      [19] 2483 	ld	l,-6 (ix)
   716A DD 66 FB      [19] 2484 	ld	h,-5 (ix)
   716D 5E            [ 7] 2485 	ld	e,(hl)
   716E 0A            [ 7] 2486 	ld	a,(bc)
   716F 57            [ 4] 2487 	ld	d,a
   7170 2A D5 63      [16] 2488 	ld	hl,(_mapa)
   7173 E5            [11] 2489 	push	hl
   7174 C5            [11] 2490 	push	bc
   7175 DD 66 FE      [19] 2491 	ld	h,-2 (ix)
   7178 DD 6E FF      [19] 2492 	ld	l,-1 (ix)
   717B E5            [11] 2493 	push	hl
   717C 7B            [ 4] 2494 	ld	a,e
   717D F5            [11] 2495 	push	af
   717E 33            [ 6] 2496 	inc	sp
   717F D5            [11] 2497 	push	de
   7180 33            [ 6] 2498 	inc	sp
   7181 CD 82 48      [17] 2499 	call	_pathFinding
   7184 21 08 00      [10] 2500 	ld	hl,#8
   7187 39            [11] 2501 	add	hl,sp
   7188 F9            [ 6] 2502 	ld	sp,hl
   7189                    2503 00106$:
                           2504 ;src/main.c:503: actual->iter = 0;
   7189 DD 6E F8      [19] 2505 	ld	l,-8 (ix)
   718C DD 66 F9      [19] 2506 	ld	h,-7 (ix)
   718F AF            [ 4] 2507 	xor	a, a
   7190 77            [ 7] 2508 	ld	(hl), a
   7191 23            [ 6] 2509 	inc	hl
   7192 77            [ 7] 2510 	ld	(hl), a
   7193                    2511 00114$:
   7193 DD F9         [10] 2512 	ld	sp, ix
   7195 DD E1         [14] 2513 	pop	ix
   7197 C9            [10] 2514 	ret
                           2515 ;src/main.c:512: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2516 ;	---------------------------------
                           2517 ; Function engage
                           2518 ; ---------------------------------
   7198                    2519 _engage::
   7198 DD E5         [15] 2520 	push	ix
   719A DD 21 00 00   [14] 2521 	ld	ix,#0
   719E DD 39         [15] 2522 	add	ix,sp
   71A0 21 F3 FF      [10] 2523 	ld	hl,#-13
   71A3 39            [11] 2524 	add	hl,sp
   71A4 F9            [ 6] 2525 	ld	sp,hl
                           2526 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71A5 DD 7E 04      [19] 2527 	ld	a,4 (ix)
   71A8 DD 77 F7      [19] 2528 	ld	-9 (ix),a
   71AB DD 7E 05      [19] 2529 	ld	a,5 (ix)
   71AE DD 77 F8      [19] 2530 	ld	-8 (ix),a
   71B1 DD 6E F7      [19] 2531 	ld	l,-9 (ix)
   71B4 DD 66 F8      [19] 2532 	ld	h,-8 (ix)
   71B7 4E            [ 7] 2533 	ld	c,(hl)
   71B8 06 00         [ 7] 2534 	ld	b,#0x00
   71BA 21 F8 62      [10] 2535 	ld	hl,#_prota+0
   71BD 5E            [ 7] 2536 	ld	e,(hl)
   71BE 16 00         [ 7] 2537 	ld	d,#0x00
   71C0 79            [ 4] 2538 	ld	a,c
   71C1 93            [ 4] 2539 	sub	a, e
   71C2 4F            [ 4] 2540 	ld	c,a
   71C3 78            [ 4] 2541 	ld	a,b
   71C4 9A            [ 4] 2542 	sbc	a, d
   71C5 47            [ 4] 2543 	ld	b,a
   71C6 C5            [11] 2544 	push	bc
   71C7 CD 70 4A      [17] 2545 	call	_abs
   71CA F1            [10] 2546 	pop	af
   71CB 4D            [ 4] 2547 	ld	c,l
                           2548 ;src/main.c:515: u8 dify = abs(enemy->y - prota.y);
   71CC DD 7E F7      [19] 2549 	ld	a,-9 (ix)
   71CF C6 01         [ 7] 2550 	add	a, #0x01
   71D1 DD 77 F9      [19] 2551 	ld	-7 (ix),a
   71D4 DD 7E F8      [19] 2552 	ld	a,-8 (ix)
   71D7 CE 00         [ 7] 2553 	adc	a, #0x00
   71D9 DD 77 FA      [19] 2554 	ld	-6 (ix),a
   71DC DD 6E F9      [19] 2555 	ld	l,-7 (ix)
   71DF DD 66 FA      [19] 2556 	ld	h,-6 (ix)
   71E2 5E            [ 7] 2557 	ld	e,(hl)
   71E3 16 00         [ 7] 2558 	ld	d,#0x00
   71E5 21 F9 62      [10] 2559 	ld	hl,#_prota+1
   71E8 6E            [ 7] 2560 	ld	l,(hl)
   71E9 26 00         [ 7] 2561 	ld	h,#0x00
   71EB 7B            [ 4] 2562 	ld	a,e
   71EC 95            [ 4] 2563 	sub	a, l
   71ED 5F            [ 4] 2564 	ld	e,a
   71EE 7A            [ 4] 2565 	ld	a,d
   71EF 9C            [ 4] 2566 	sbc	a, h
   71F0 57            [ 4] 2567 	ld	d,a
   71F1 C5            [11] 2568 	push	bc
   71F2 D5            [11] 2569 	push	de
   71F3 CD 70 4A      [17] 2570 	call	_abs
   71F6 F1            [10] 2571 	pop	af
   71F7 C1            [10] 2572 	pop	bc
                           2573 ;src/main.c:516: u8 dist = difx + dify; // manhattan
   71F8 09            [11] 2574 	add	hl, bc
   71F9 DD 75 F3      [19] 2575 	ld	-13 (ix),l
                           2576 ;src/main.c:518: u8 movX = 0;
   71FC DD 36 F6 00   [19] 2577 	ld	-10 (ix),#0x00
                           2578 ;src/main.c:519: u8 movY = 0;
   7200 DD 36 F4 00   [19] 2579 	ld	-12 (ix),#0x00
                           2580 ;src/main.c:520: u8 mov = 0;
   7204 DD 36 F5 00   [19] 2581 	ld	-11 (ix),#0x00
                           2582 ;src/main.c:522: if (enemy->y == dy) { // alineado en el eje x
   7208 DD 6E F9      [19] 2583 	ld	l,-7 (ix)
   720B DD 66 FA      [19] 2584 	ld	h,-6 (ix)
   720E 7E            [ 7] 2585 	ld	a,(hl)
   720F DD 77 FB      [19] 2586 	ld	-5 (ix),a
                           2587 ;src/main.c:524: if (dist > 10) {
   7212 3E 0A         [ 7] 2588 	ld	a,#0x0A
   7214 DD 96 F3      [19] 2589 	sub	a, -13 (ix)
   7217 3E 00         [ 7] 2590 	ld	a,#0x00
   7219 17            [ 4] 2591 	rla
   721A DD 77 FC      [19] 2592 	ld	-4 (ix),a
                           2593 ;src/main.c:522: if (enemy->y == dy) { // alineado en el eje x
   721D DD 7E 07      [19] 2594 	ld	a,7 (ix)
   7220 DD 96 FB      [19] 2595 	sub	a, -5 (ix)
   7223 C2 25 73      [10] 2596 	jp	NZ,00187$
                           2597 ;src/main.c:524: if (dist > 10) {
   7226 DD 7E FC      [19] 2598 	ld	a,-4 (ix)
   7229 B7            [ 4] 2599 	or	a, a
   722A CA 89 78      [10] 2600 	jp	Z,00189$
                           2601 ;src/main.c:525: if (dx < enemy->x) { // izquierda
   722D DD 6E F7      [19] 2602 	ld	l,-9 (ix)
   7230 DD 66 F8      [19] 2603 	ld	h,-8 (ix)
   7233 46            [ 7] 2604 	ld	b,(hl)
   7234 DD 7E 06      [19] 2605 	ld	a,6 (ix)
   7237 90            [ 4] 2606 	sub	a, b
   7238 30 72         [12] 2607 	jr	NC,00110$
                           2608 ;src/main.c:526: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   723A 05            [ 4] 2609 	dec	b
   723B DD 7E FB      [19] 2610 	ld	a,-5 (ix)
   723E F5            [11] 2611 	push	af
   723F 33            [ 6] 2612 	inc	sp
   7240 C5            [11] 2613 	push	bc
   7241 33            [ 6] 2614 	inc	sp
   7242 2A D5 63      [16] 2615 	ld	hl,(_mapa)
   7245 E5            [11] 2616 	push	hl
   7246 CD 2C 4A      [17] 2617 	call	_getTilePtr
   7249 F1            [10] 2618 	pop	af
   724A F1            [10] 2619 	pop	af
   724B 4E            [ 7] 2620 	ld	c,(hl)
   724C 3E 02         [ 7] 2621 	ld	a,#0x02
   724E 91            [ 4] 2622 	sub	a, c
   724F DA 89 78      [10] 2623 	jp	C,00189$
                           2624 ;src/main.c:527: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7252 DD 6E F9      [19] 2625 	ld	l,-7 (ix)
   7255 DD 66 FA      [19] 2626 	ld	h,-6 (ix)
   7258 7E            [ 7] 2627 	ld	a,(hl)
   7259 C6 0B         [ 7] 2628 	add	a, #0x0B
   725B 57            [ 4] 2629 	ld	d,a
   725C DD 6E F7      [19] 2630 	ld	l,-9 (ix)
   725F DD 66 F8      [19] 2631 	ld	h,-8 (ix)
   7262 46            [ 7] 2632 	ld	b,(hl)
   7263 05            [ 4] 2633 	dec	b
   7264 D5            [11] 2634 	push	de
   7265 33            [ 6] 2635 	inc	sp
   7266 C5            [11] 2636 	push	bc
   7267 33            [ 6] 2637 	inc	sp
   7268 2A D5 63      [16] 2638 	ld	hl,(_mapa)
   726B E5            [11] 2639 	push	hl
   726C CD 2C 4A      [17] 2640 	call	_getTilePtr
   726F F1            [10] 2641 	pop	af
   7270 F1            [10] 2642 	pop	af
   7271 4E            [ 7] 2643 	ld	c,(hl)
   7272 3E 02         [ 7] 2644 	ld	a,#0x02
   7274 91            [ 4] 2645 	sub	a, c
   7275 DA 89 78      [10] 2646 	jp	C,00189$
                           2647 ;src/main.c:528: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7278 DD 6E F9      [19] 2648 	ld	l,-7 (ix)
   727B DD 66 FA      [19] 2649 	ld	h,-6 (ix)
   727E 7E            [ 7] 2650 	ld	a,(hl)
   727F C6 16         [ 7] 2651 	add	a, #0x16
   7281 57            [ 4] 2652 	ld	d,a
   7282 DD 6E F7      [19] 2653 	ld	l,-9 (ix)
   7285 DD 66 F8      [19] 2654 	ld	h,-8 (ix)
   7288 46            [ 7] 2655 	ld	b,(hl)
   7289 05            [ 4] 2656 	dec	b
   728A D5            [11] 2657 	push	de
   728B 33            [ 6] 2658 	inc	sp
   728C C5            [11] 2659 	push	bc
   728D 33            [ 6] 2660 	inc	sp
   728E 2A D5 63      [16] 2661 	ld	hl,(_mapa)
   7291 E5            [11] 2662 	push	hl
   7292 CD 2C 4A      [17] 2663 	call	_getTilePtr
   7295 F1            [10] 2664 	pop	af
   7296 F1            [10] 2665 	pop	af
   7297 4E            [ 7] 2666 	ld	c,(hl)
   7298 3E 02         [ 7] 2667 	ld	a,#0x02
   729A 91            [ 4] 2668 	sub	a, c
   729B DA 89 78      [10] 2669 	jp	C,00189$
                           2670 ;src/main.c:529: moverEnemigoIzquierda(enemy);
   729E DD 6E F7      [19] 2671 	ld	l,-9 (ix)
   72A1 DD 66 F8      [19] 2672 	ld	h,-8 (ix)
   72A4 E5            [11] 2673 	push	hl
   72A5 CD 89 6C      [17] 2674 	call	_moverEnemigoIzquierda
   72A8 F1            [10] 2675 	pop	af
                           2676 ;src/main.c:531: mov = 1;
   72A9 C3 89 78      [10] 2677 	jp	00189$
   72AC                    2678 00110$:
                           2679 ;src/main.c:534: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   72AC 78            [ 4] 2680 	ld	a,b
   72AD C6 05         [ 7] 2681 	add	a, #0x05
   72AF 47            [ 4] 2682 	ld	b,a
   72B0 DD 7E FB      [19] 2683 	ld	a,-5 (ix)
   72B3 F5            [11] 2684 	push	af
   72B4 33            [ 6] 2685 	inc	sp
   72B5 C5            [11] 2686 	push	bc
   72B6 33            [ 6] 2687 	inc	sp
   72B7 2A D5 63      [16] 2688 	ld	hl,(_mapa)
   72BA E5            [11] 2689 	push	hl
   72BB CD 2C 4A      [17] 2690 	call	_getTilePtr
   72BE F1            [10] 2691 	pop	af
   72BF F1            [10] 2692 	pop	af
   72C0 4E            [ 7] 2693 	ld	c,(hl)
   72C1 3E 02         [ 7] 2694 	ld	a,#0x02
   72C3 91            [ 4] 2695 	sub	a, c
   72C4 DA 89 78      [10] 2696 	jp	C,00189$
                           2697 ;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   72C7 DD 6E F9      [19] 2698 	ld	l,-7 (ix)
   72CA DD 66 FA      [19] 2699 	ld	h,-6 (ix)
   72CD 7E            [ 7] 2700 	ld	a,(hl)
   72CE C6 0B         [ 7] 2701 	add	a, #0x0B
   72D0 57            [ 4] 2702 	ld	d,a
   72D1 DD 6E F7      [19] 2703 	ld	l,-9 (ix)
   72D4 DD 66 F8      [19] 2704 	ld	h,-8 (ix)
   72D7 7E            [ 7] 2705 	ld	a,(hl)
   72D8 C6 05         [ 7] 2706 	add	a, #0x05
   72DA 47            [ 4] 2707 	ld	b,a
   72DB D5            [11] 2708 	push	de
   72DC 33            [ 6] 2709 	inc	sp
   72DD C5            [11] 2710 	push	bc
   72DE 33            [ 6] 2711 	inc	sp
   72DF 2A D5 63      [16] 2712 	ld	hl,(_mapa)
   72E2 E5            [11] 2713 	push	hl
   72E3 CD 2C 4A      [17] 2714 	call	_getTilePtr
   72E6 F1            [10] 2715 	pop	af
   72E7 F1            [10] 2716 	pop	af
   72E8 4E            [ 7] 2717 	ld	c,(hl)
   72E9 3E 02         [ 7] 2718 	ld	a,#0x02
   72EB 91            [ 4] 2719 	sub	a, c
   72EC DA 89 78      [10] 2720 	jp	C,00189$
                           2721 ;src/main.c:536: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   72EF DD 6E F9      [19] 2722 	ld	l,-7 (ix)
   72F2 DD 66 FA      [19] 2723 	ld	h,-6 (ix)
   72F5 7E            [ 7] 2724 	ld	a,(hl)
   72F6 C6 16         [ 7] 2725 	add	a, #0x16
   72F8 57            [ 4] 2726 	ld	d,a
   72F9 DD 6E F7      [19] 2727 	ld	l,-9 (ix)
   72FC DD 66 F8      [19] 2728 	ld	h,-8 (ix)
   72FF 7E            [ 7] 2729 	ld	a,(hl)
   7300 C6 05         [ 7] 2730 	add	a, #0x05
   7302 47            [ 4] 2731 	ld	b,a
   7303 D5            [11] 2732 	push	de
   7304 33            [ 6] 2733 	inc	sp
   7305 C5            [11] 2734 	push	bc
   7306 33            [ 6] 2735 	inc	sp
   7307 2A D5 63      [16] 2736 	ld	hl,(_mapa)
   730A E5            [11] 2737 	push	hl
   730B CD 2C 4A      [17] 2738 	call	_getTilePtr
   730E F1            [10] 2739 	pop	af
   730F F1            [10] 2740 	pop	af
   7310 4E            [ 7] 2741 	ld	c,(hl)
   7311 3E 02         [ 7] 2742 	ld	a,#0x02
   7313 91            [ 4] 2743 	sub	a, c
   7314 DA 89 78      [10] 2744 	jp	C,00189$
                           2745 ;src/main.c:537: moverEnemigoDerecha(enemy);
   7317 DD 6E F7      [19] 2746 	ld	l,-9 (ix)
   731A DD 66 F8      [19] 2747 	ld	h,-8 (ix)
   731D E5            [11] 2748 	push	hl
   731E CD 79 6C      [17] 2749 	call	_moverEnemigoDerecha
   7321 F1            [10] 2750 	pop	af
                           2751 ;src/main.c:539: mov = 1;
   7322 C3 89 78      [10] 2752 	jp	00189$
   7325                    2753 00187$:
                           2754 ;src/main.c:544: else if (enemy->x == dx) {
   7325 DD 6E F7      [19] 2755 	ld	l,-9 (ix)
   7328 DD 66 F8      [19] 2756 	ld	h,-8 (ix)
   732B 7E            [ 7] 2757 	ld	a,(hl)
   732C DD 77 FD      [19] 2758 	ld	-3 (ix), a
   732F DD 96 06      [19] 2759 	sub	a, 6 (ix)
   7332 C2 2F 74      [10] 2760 	jp	NZ,00184$
                           2761 ;src/main.c:546: if (dist > 10) {
   7335 DD 7E FC      [19] 2762 	ld	a,-4 (ix)
   7338 B7            [ 4] 2763 	or	a, a
   7339 CA 89 78      [10] 2764 	jp	Z,00189$
                           2765 ;src/main.c:547: if (dy < enemy->y) {
   733C DD 7E 07      [19] 2766 	ld	a,7 (ix)
   733F DD 96 FB      [19] 2767 	sub	a, -5 (ix)
   7342 30 74         [12] 2768 	jr	NC,00123$
                           2769 ;src/main.c:548: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7344 DD 46 FB      [19] 2770 	ld	b,-5 (ix)
   7347 05            [ 4] 2771 	dec	b
   7348 05            [ 4] 2772 	dec	b
   7349 C5            [11] 2773 	push	bc
   734A 33            [ 6] 2774 	inc	sp
   734B DD 7E FD      [19] 2775 	ld	a,-3 (ix)
   734E F5            [11] 2776 	push	af
   734F 33            [ 6] 2777 	inc	sp
   7350 2A D5 63      [16] 2778 	ld	hl,(_mapa)
   7353 E5            [11] 2779 	push	hl
   7354 CD 2C 4A      [17] 2780 	call	_getTilePtr
   7357 F1            [10] 2781 	pop	af
   7358 F1            [10] 2782 	pop	af
   7359 4E            [ 7] 2783 	ld	c,(hl)
   735A 3E 02         [ 7] 2784 	ld	a,#0x02
   735C 91            [ 4] 2785 	sub	a, c
   735D DA 89 78      [10] 2786 	jp	C,00189$
                           2787 ;src/main.c:549: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7360 DD 6E F9      [19] 2788 	ld	l,-7 (ix)
   7363 DD 66 FA      [19] 2789 	ld	h,-6 (ix)
   7366 46            [ 7] 2790 	ld	b,(hl)
   7367 05            [ 4] 2791 	dec	b
   7368 05            [ 4] 2792 	dec	b
   7369 DD 6E F7      [19] 2793 	ld	l,-9 (ix)
   736C DD 66 F8      [19] 2794 	ld	h,-8 (ix)
   736F 56            [ 7] 2795 	ld	d,(hl)
   7370 14            [ 4] 2796 	inc	d
   7371 14            [ 4] 2797 	inc	d
   7372 4A            [ 4] 2798 	ld	c, d
   7373 C5            [11] 2799 	push	bc
   7374 2A D5 63      [16] 2800 	ld	hl,(_mapa)
   7377 E5            [11] 2801 	push	hl
   7378 CD 2C 4A      [17] 2802 	call	_getTilePtr
   737B F1            [10] 2803 	pop	af
   737C F1            [10] 2804 	pop	af
   737D 4E            [ 7] 2805 	ld	c,(hl)
   737E 3E 02         [ 7] 2806 	ld	a,#0x02
   7380 91            [ 4] 2807 	sub	a, c
   7381 DA 89 78      [10] 2808 	jp	C,00189$
                           2809 ;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7384 DD 6E F9      [19] 2810 	ld	l,-7 (ix)
   7387 DD 66 FA      [19] 2811 	ld	h,-6 (ix)
   738A 46            [ 7] 2812 	ld	b,(hl)
   738B 05            [ 4] 2813 	dec	b
   738C 05            [ 4] 2814 	dec	b
   738D DD 6E F7      [19] 2815 	ld	l,-9 (ix)
   7390 DD 66 F8      [19] 2816 	ld	h,-8 (ix)
   7393 7E            [ 7] 2817 	ld	a,(hl)
   7394 C6 04         [ 7] 2818 	add	a, #0x04
   7396 C5            [11] 2819 	push	bc
   7397 33            [ 6] 2820 	inc	sp
   7398 F5            [11] 2821 	push	af
   7399 33            [ 6] 2822 	inc	sp
   739A 2A D5 63      [16] 2823 	ld	hl,(_mapa)
   739D E5            [11] 2824 	push	hl
   739E CD 2C 4A      [17] 2825 	call	_getTilePtr
   73A1 F1            [10] 2826 	pop	af
   73A2 F1            [10] 2827 	pop	af
   73A3 4E            [ 7] 2828 	ld	c,(hl)
   73A4 3E 02         [ 7] 2829 	ld	a,#0x02
   73A6 91            [ 4] 2830 	sub	a, c
   73A7 DA 89 78      [10] 2831 	jp	C,00189$
                           2832 ;src/main.c:551: moverEnemigoArriba(enemy);
   73AA DD 6E F7      [19] 2833 	ld	l,-9 (ix)
   73AD DD 66 F8      [19] 2834 	ld	h,-8 (ix)
   73B0 E5            [11] 2835 	push	hl
   73B1 CD 3B 6C      [17] 2836 	call	_moverEnemigoArriba
   73B4 F1            [10] 2837 	pop	af
                           2838 ;src/main.c:553: mov = 1;
   73B5 C3 89 78      [10] 2839 	jp	00189$
   73B8                    2840 00123$:
                           2841 ;src/main.c:556: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   73B8 DD 7E FB      [19] 2842 	ld	a,-5 (ix)
   73BB C6 18         [ 7] 2843 	add	a, #0x18
   73BD 47            [ 4] 2844 	ld	b,a
   73BE C5            [11] 2845 	push	bc
   73BF 33            [ 6] 2846 	inc	sp
   73C0 DD 7E FD      [19] 2847 	ld	a,-3 (ix)
   73C3 F5            [11] 2848 	push	af
   73C4 33            [ 6] 2849 	inc	sp
   73C5 2A D5 63      [16] 2850 	ld	hl,(_mapa)
   73C8 E5            [11] 2851 	push	hl
   73C9 CD 2C 4A      [17] 2852 	call	_getTilePtr
   73CC F1            [10] 2853 	pop	af
   73CD F1            [10] 2854 	pop	af
   73CE 4E            [ 7] 2855 	ld	c,(hl)
   73CF 3E 02         [ 7] 2856 	ld	a,#0x02
   73D1 91            [ 4] 2857 	sub	a, c
   73D2 DA 89 78      [10] 2858 	jp	C,00189$
                           2859 ;src/main.c:557: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   73D5 DD 6E F9      [19] 2860 	ld	l,-7 (ix)
   73D8 DD 66 FA      [19] 2861 	ld	h,-6 (ix)
   73DB 7E            [ 7] 2862 	ld	a,(hl)
   73DC C6 18         [ 7] 2863 	add	a, #0x18
   73DE 47            [ 4] 2864 	ld	b,a
   73DF DD 6E F7      [19] 2865 	ld	l,-9 (ix)
   73E2 DD 66 F8      [19] 2866 	ld	h,-8 (ix)
   73E5 56            [ 7] 2867 	ld	d,(hl)
   73E6 14            [ 4] 2868 	inc	d
   73E7 14            [ 4] 2869 	inc	d
   73E8 4A            [ 4] 2870 	ld	c, d
   73E9 C5            [11] 2871 	push	bc
   73EA 2A D5 63      [16] 2872 	ld	hl,(_mapa)
   73ED E5            [11] 2873 	push	hl
   73EE CD 2C 4A      [17] 2874 	call	_getTilePtr
   73F1 F1            [10] 2875 	pop	af
   73F2 F1            [10] 2876 	pop	af
   73F3 4E            [ 7] 2877 	ld	c,(hl)
   73F4 3E 02         [ 7] 2878 	ld	a,#0x02
   73F6 91            [ 4] 2879 	sub	a, c
   73F7 DA 89 78      [10] 2880 	jp	C,00189$
                           2881 ;src/main.c:558: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   73FA DD 6E F9      [19] 2882 	ld	l,-7 (ix)
   73FD DD 66 FA      [19] 2883 	ld	h,-6 (ix)
   7400 7E            [ 7] 2884 	ld	a,(hl)
   7401 C6 18         [ 7] 2885 	add	a, #0x18
   7403 47            [ 4] 2886 	ld	b,a
   7404 DD 6E F7      [19] 2887 	ld	l,-9 (ix)
   7407 DD 66 F8      [19] 2888 	ld	h,-8 (ix)
   740A 7E            [ 7] 2889 	ld	a,(hl)
   740B C6 04         [ 7] 2890 	add	a, #0x04
   740D C5            [11] 2891 	push	bc
   740E 33            [ 6] 2892 	inc	sp
   740F F5            [11] 2893 	push	af
   7410 33            [ 6] 2894 	inc	sp
   7411 2A D5 63      [16] 2895 	ld	hl,(_mapa)
   7414 E5            [11] 2896 	push	hl
   7415 CD 2C 4A      [17] 2897 	call	_getTilePtr
   7418 F1            [10] 2898 	pop	af
   7419 F1            [10] 2899 	pop	af
   741A 4E            [ 7] 2900 	ld	c,(hl)
   741B 3E 02         [ 7] 2901 	ld	a,#0x02
   741D 91            [ 4] 2902 	sub	a, c
   741E DA 89 78      [10] 2903 	jp	C,00189$
                           2904 ;src/main.c:559: moverEnemigoAbajo(enemy);
   7421 DD 6E F7      [19] 2905 	ld	l,-9 (ix)
   7424 DD 66 F8      [19] 2906 	ld	h,-8 (ix)
   7427 E5            [11] 2907 	push	hl
   7428 CD 5A 6C      [17] 2908 	call	_moverEnemigoAbajo
   742B F1            [10] 2909 	pop	af
                           2910 ;src/main.c:561: mov = 1;
   742C C3 89 78      [10] 2911 	jp	00189$
   742F                    2912 00184$:
                           2913 ;src/main.c:567: if (dist > 20) {
   742F 3E 14         [ 7] 2914 	ld	a,#0x14
   7431 DD 96 F3      [19] 2915 	sub	a, -13 (ix)
   7434 D2 89 78      [10] 2916 	jp	NC,00189$
                           2917 ;src/main.c:568: if (dx < enemy->x) {
   7437 DD 7E 06      [19] 2918 	ld	a,6 (ix)
   743A DD 96 FD      [19] 2919 	sub	a, -3 (ix)
   743D D2 BF 74      [10] 2920 	jp	NC,00136$
                           2921 ;src/main.c:569: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7440 DD 46 FD      [19] 2922 	ld	b,-3 (ix)
   7443 05            [ 4] 2923 	dec	b
   7444 DD 7E FB      [19] 2924 	ld	a,-5 (ix)
   7447 F5            [11] 2925 	push	af
   7448 33            [ 6] 2926 	inc	sp
   7449 C5            [11] 2927 	push	bc
   744A 33            [ 6] 2928 	inc	sp
   744B 2A D5 63      [16] 2929 	ld	hl,(_mapa)
   744E E5            [11] 2930 	push	hl
   744F CD 2C 4A      [17] 2931 	call	_getTilePtr
   7452 F1            [10] 2932 	pop	af
   7453 F1            [10] 2933 	pop	af
   7454 4E            [ 7] 2934 	ld	c,(hl)
   7455 3E 02         [ 7] 2935 	ld	a,#0x02
   7457 91            [ 4] 2936 	sub	a, c
   7458 DA 3C 75      [10] 2937 	jp	C,00137$
                           2938 ;src/main.c:570: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   745B DD 6E F9      [19] 2939 	ld	l,-7 (ix)
   745E DD 66 FA      [19] 2940 	ld	h,-6 (ix)
   7461 7E            [ 7] 2941 	ld	a,(hl)
   7462 C6 0B         [ 7] 2942 	add	a, #0x0B
   7464 4F            [ 4] 2943 	ld	c,a
   7465 DD 6E F7      [19] 2944 	ld	l,-9 (ix)
   7468 DD 66 F8      [19] 2945 	ld	h,-8 (ix)
   746B 46            [ 7] 2946 	ld	b,(hl)
   746C 05            [ 4] 2947 	dec	b
   746D 79            [ 4] 2948 	ld	a,c
   746E F5            [11] 2949 	push	af
   746F 33            [ 6] 2950 	inc	sp
   7470 C5            [11] 2951 	push	bc
   7471 33            [ 6] 2952 	inc	sp
   7472 2A D5 63      [16] 2953 	ld	hl,(_mapa)
   7475 E5            [11] 2954 	push	hl
   7476 CD 2C 4A      [17] 2955 	call	_getTilePtr
   7479 F1            [10] 2956 	pop	af
   747A F1            [10] 2957 	pop	af
   747B 4E            [ 7] 2958 	ld	c,(hl)
   747C 3E 02         [ 7] 2959 	ld	a,#0x02
   747E 91            [ 4] 2960 	sub	a, c
   747F DA 3C 75      [10] 2961 	jp	C,00137$
                           2962 ;src/main.c:571: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7482 DD 6E F9      [19] 2963 	ld	l,-7 (ix)
   7485 DD 66 FA      [19] 2964 	ld	h,-6 (ix)
   7488 7E            [ 7] 2965 	ld	a,(hl)
   7489 C6 16         [ 7] 2966 	add	a, #0x16
   748B 4F            [ 4] 2967 	ld	c,a
   748C DD 6E F7      [19] 2968 	ld	l,-9 (ix)
   748F DD 66 F8      [19] 2969 	ld	h,-8 (ix)
   7492 46            [ 7] 2970 	ld	b,(hl)
   7493 05            [ 4] 2971 	dec	b
   7494 79            [ 4] 2972 	ld	a,c
   7495 F5            [11] 2973 	push	af
   7496 33            [ 6] 2974 	inc	sp
   7497 C5            [11] 2975 	push	bc
   7498 33            [ 6] 2976 	inc	sp
   7499 2A D5 63      [16] 2977 	ld	hl,(_mapa)
   749C E5            [11] 2978 	push	hl
   749D CD 2C 4A      [17] 2979 	call	_getTilePtr
   74A0 F1            [10] 2980 	pop	af
   74A1 F1            [10] 2981 	pop	af
   74A2 4E            [ 7] 2982 	ld	c,(hl)
   74A3 3E 02         [ 7] 2983 	ld	a,#0x02
   74A5 91            [ 4] 2984 	sub	a, c
   74A6 DA 3C 75      [10] 2985 	jp	C,00137$
                           2986 ;src/main.c:572: moverEnemigoIzquierda(enemy);
   74A9 DD 6E F7      [19] 2987 	ld	l,-9 (ix)
   74AC DD 66 F8      [19] 2988 	ld	h,-8 (ix)
   74AF E5            [11] 2989 	push	hl
   74B0 CD 89 6C      [17] 2990 	call	_moverEnemigoIzquierda
   74B3 F1            [10] 2991 	pop	af
                           2992 ;src/main.c:573: movX = 1;
   74B4 DD 36 F6 01   [19] 2993 	ld	-10 (ix),#0x01
                           2994 ;src/main.c:574: mov = 1;
   74B8 DD 36 F5 01   [19] 2995 	ld	-11 (ix),#0x01
   74BC C3 3C 75      [10] 2996 	jp	00137$
   74BF                    2997 00136$:
                           2998 ;src/main.c:577: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   74BF DD 7E FD      [19] 2999 	ld	a,-3 (ix)
   74C2 C6 05         [ 7] 3000 	add	a, #0x05
   74C4 47            [ 4] 3001 	ld	b,a
   74C5 DD 7E FB      [19] 3002 	ld	a,-5 (ix)
   74C8 F5            [11] 3003 	push	af
   74C9 33            [ 6] 3004 	inc	sp
   74CA C5            [11] 3005 	push	bc
   74CB 33            [ 6] 3006 	inc	sp
   74CC 2A D5 63      [16] 3007 	ld	hl,(_mapa)
   74CF E5            [11] 3008 	push	hl
   74D0 CD 2C 4A      [17] 3009 	call	_getTilePtr
   74D3 F1            [10] 3010 	pop	af
   74D4 F1            [10] 3011 	pop	af
   74D5 4E            [ 7] 3012 	ld	c,(hl)
   74D6 3E 02         [ 7] 3013 	ld	a,#0x02
   74D8 91            [ 4] 3014 	sub	a, c
   74D9 38 61         [12] 3015 	jr	C,00137$
                           3016 ;src/main.c:578: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   74DB DD 6E F9      [19] 3017 	ld	l,-7 (ix)
   74DE DD 66 FA      [19] 3018 	ld	h,-6 (ix)
   74E1 7E            [ 7] 3019 	ld	a,(hl)
   74E2 C6 0B         [ 7] 3020 	add	a, #0x0B
   74E4 57            [ 4] 3021 	ld	d,a
   74E5 DD 6E F7      [19] 3022 	ld	l,-9 (ix)
   74E8 DD 66 F8      [19] 3023 	ld	h,-8 (ix)
   74EB 7E            [ 7] 3024 	ld	a,(hl)
   74EC C6 05         [ 7] 3025 	add	a, #0x05
   74EE 47            [ 4] 3026 	ld	b,a
   74EF D5            [11] 3027 	push	de
   74F0 33            [ 6] 3028 	inc	sp
   74F1 C5            [11] 3029 	push	bc
   74F2 33            [ 6] 3030 	inc	sp
   74F3 2A D5 63      [16] 3031 	ld	hl,(_mapa)
   74F6 E5            [11] 3032 	push	hl
   74F7 CD 2C 4A      [17] 3033 	call	_getTilePtr
   74FA F1            [10] 3034 	pop	af
   74FB F1            [10] 3035 	pop	af
   74FC 4E            [ 7] 3036 	ld	c,(hl)
   74FD 3E 02         [ 7] 3037 	ld	a,#0x02
   74FF 91            [ 4] 3038 	sub	a, c
   7500 38 3A         [12] 3039 	jr	C,00137$
                           3040 ;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7502 DD 6E F9      [19] 3041 	ld	l,-7 (ix)
   7505 DD 66 FA      [19] 3042 	ld	h,-6 (ix)
   7508 7E            [ 7] 3043 	ld	a,(hl)
   7509 C6 16         [ 7] 3044 	add	a, #0x16
   750B 57            [ 4] 3045 	ld	d,a
   750C DD 6E F7      [19] 3046 	ld	l,-9 (ix)
   750F DD 66 F8      [19] 3047 	ld	h,-8 (ix)
   7512 7E            [ 7] 3048 	ld	a,(hl)
   7513 C6 05         [ 7] 3049 	add	a, #0x05
   7515 47            [ 4] 3050 	ld	b,a
   7516 D5            [11] 3051 	push	de
   7517 33            [ 6] 3052 	inc	sp
   7518 C5            [11] 3053 	push	bc
   7519 33            [ 6] 3054 	inc	sp
   751A 2A D5 63      [16] 3055 	ld	hl,(_mapa)
   751D E5            [11] 3056 	push	hl
   751E CD 2C 4A      [17] 3057 	call	_getTilePtr
   7521 F1            [10] 3058 	pop	af
   7522 F1            [10] 3059 	pop	af
   7523 4E            [ 7] 3060 	ld	c,(hl)
   7524 3E 02         [ 7] 3061 	ld	a,#0x02
   7526 91            [ 4] 3062 	sub	a, c
   7527 38 13         [12] 3063 	jr	C,00137$
                           3064 ;src/main.c:580: moverEnemigoDerecha(enemy);
   7529 DD 6E F7      [19] 3065 	ld	l,-9 (ix)
   752C DD 66 F8      [19] 3066 	ld	h,-8 (ix)
   752F E5            [11] 3067 	push	hl
   7530 CD 79 6C      [17] 3068 	call	_moverEnemigoDerecha
   7533 F1            [10] 3069 	pop	af
                           3070 ;src/main.c:581: movX = 1;
   7534 DD 36 F6 01   [19] 3071 	ld	-10 (ix),#0x01
                           3072 ;src/main.c:582: mov = 1;
   7538 DD 36 F5 01   [19] 3073 	ld	-11 (ix),#0x01
   753C                    3074 00137$:
                           3075 ;src/main.c:585: if (dy < enemy->y) {
   753C DD 6E F9      [19] 3076 	ld	l,-7 (ix)
   753F DD 66 FA      [19] 3077 	ld	h,-6 (ix)
   7542 7E            [ 7] 3078 	ld	a,(hl)
   7543 DD 77 FD      [19] 3079 	ld	-3 (ix),a
                           3080 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7546 DD 6E F7      [19] 3081 	ld	l,-9 (ix)
   7549 DD 66 F8      [19] 3082 	ld	h,-8 (ix)
   754C 7E            [ 7] 3083 	ld	a,(hl)
   754D DD 77 FC      [19] 3084 	ld	-4 (ix),a
                           3085 ;src/main.c:585: if (dy < enemy->y) {
   7550 DD 7E 07      [19] 3086 	ld	a,7 (ix)
   7553 DD 96 FD      [19] 3087 	sub	a, -3 (ix)
   7556 D2 EC 75      [10] 3088 	jp	NC,00147$
                           3089 ;src/main.c:586: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7559 DD 7E FD      [19] 3090 	ld	a,-3 (ix)
   755C C6 FE         [ 7] 3091 	add	a,#0xFE
   755E DD 77 FB      [19] 3092 	ld	-5 (ix), a
   7561 F5            [11] 3093 	push	af
   7562 33            [ 6] 3094 	inc	sp
   7563 DD 7E FC      [19] 3095 	ld	a,-4 (ix)
   7566 F5            [11] 3096 	push	af
   7567 33            [ 6] 3097 	inc	sp
   7568 2A D5 63      [16] 3098 	ld	hl,(_mapa)
   756B E5            [11] 3099 	push	hl
   756C CD 2C 4A      [17] 3100 	call	_getTilePtr
   756F F1            [10] 3101 	pop	af
   7570 F1            [10] 3102 	pop	af
   7571 DD 74 FF      [19] 3103 	ld	-1 (ix),h
   7574 DD 75 FE      [19] 3104 	ld	-2 (ix), l
   7577 DD 66 FF      [19] 3105 	ld	h,-1 (ix)
   757A 4E            [ 7] 3106 	ld	c,(hl)
   757B 3E 02         [ 7] 3107 	ld	a,#0x02
   757D 91            [ 4] 3108 	sub	a, c
   757E DA 67 76      [10] 3109 	jp	C,00148$
                           3110 ;src/main.c:587: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7581 DD 6E F9      [19] 3111 	ld	l,-7 (ix)
   7584 DD 66 FA      [19] 3112 	ld	h,-6 (ix)
   7587 7E            [ 7] 3113 	ld	a,(hl)
   7588 DD 77 FE      [19] 3114 	ld	-2 (ix), a
   758B C6 FE         [ 7] 3115 	add	a,#0xFE
   758D DD 77 FE      [19] 3116 	ld	-2 (ix),a
   7590 DD 6E F7      [19] 3117 	ld	l,-9 (ix)
   7593 DD 66 F8      [19] 3118 	ld	h,-8 (ix)
   7596 46            [ 7] 3119 	ld	b,(hl)
   7597 04            [ 4] 3120 	inc	b
   7598 04            [ 4] 3121 	inc	b
   7599 DD 7E FE      [19] 3122 	ld	a,-2 (ix)
   759C F5            [11] 3123 	push	af
   759D 33            [ 6] 3124 	inc	sp
   759E C5            [11] 3125 	push	bc
   759F 33            [ 6] 3126 	inc	sp
   75A0 2A D5 63      [16] 3127 	ld	hl,(_mapa)
   75A3 E5            [11] 3128 	push	hl
   75A4 CD 2C 4A      [17] 3129 	call	_getTilePtr
   75A7 F1            [10] 3130 	pop	af
   75A8 F1            [10] 3131 	pop	af
   75A9 4E            [ 7] 3132 	ld	c,(hl)
   75AA 3E 02         [ 7] 3133 	ld	a,#0x02
   75AC 91            [ 4] 3134 	sub	a, c
   75AD DA 67 76      [10] 3135 	jp	C,00148$
                           3136 ;src/main.c:588: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   75B0 DD 6E F9      [19] 3137 	ld	l,-7 (ix)
   75B3 DD 66 FA      [19] 3138 	ld	h,-6 (ix)
   75B6 46            [ 7] 3139 	ld	b,(hl)
   75B7 05            [ 4] 3140 	dec	b
   75B8 05            [ 4] 3141 	dec	b
   75B9 DD 6E F7      [19] 3142 	ld	l,-9 (ix)
   75BC DD 66 F8      [19] 3143 	ld	h,-8 (ix)
   75BF 7E            [ 7] 3144 	ld	a,(hl)
   75C0 C6 04         [ 7] 3145 	add	a, #0x04
   75C2 C5            [11] 3146 	push	bc
   75C3 33            [ 6] 3147 	inc	sp
   75C4 F5            [11] 3148 	push	af
   75C5 33            [ 6] 3149 	inc	sp
   75C6 2A D5 63      [16] 3150 	ld	hl,(_mapa)
   75C9 E5            [11] 3151 	push	hl
   75CA CD 2C 4A      [17] 3152 	call	_getTilePtr
   75CD F1            [10] 3153 	pop	af
   75CE F1            [10] 3154 	pop	af
   75CF 4E            [ 7] 3155 	ld	c,(hl)
   75D0 3E 02         [ 7] 3156 	ld	a,#0x02
   75D2 91            [ 4] 3157 	sub	a, c
   75D3 DA 67 76      [10] 3158 	jp	C,00148$
                           3159 ;src/main.c:589: moverEnemigoArriba(enemy);
   75D6 DD 6E F7      [19] 3160 	ld	l,-9 (ix)
   75D9 DD 66 F8      [19] 3161 	ld	h,-8 (ix)
   75DC E5            [11] 3162 	push	hl
   75DD CD 3B 6C      [17] 3163 	call	_moverEnemigoArriba
   75E0 F1            [10] 3164 	pop	af
                           3165 ;src/main.c:590: movY = 1;
   75E1 DD 36 F4 01   [19] 3166 	ld	-12 (ix),#0x01
                           3167 ;src/main.c:591: mov = 1;
   75E5 DD 36 F5 01   [19] 3168 	ld	-11 (ix),#0x01
   75E9 C3 67 76      [10] 3169 	jp	00148$
   75EC                    3170 00147$:
                           3171 ;src/main.c:594: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75EC DD 7E FD      [19] 3172 	ld	a,-3 (ix)
   75EF C6 18         [ 7] 3173 	add	a, #0x18
   75F1 47            [ 4] 3174 	ld	b,a
   75F2 C5            [11] 3175 	push	bc
   75F3 33            [ 6] 3176 	inc	sp
   75F4 DD 7E FC      [19] 3177 	ld	a,-4 (ix)
   75F7 F5            [11] 3178 	push	af
   75F8 33            [ 6] 3179 	inc	sp
   75F9 2A D5 63      [16] 3180 	ld	hl,(_mapa)
   75FC E5            [11] 3181 	push	hl
   75FD CD 2C 4A      [17] 3182 	call	_getTilePtr
   7600 F1            [10] 3183 	pop	af
   7601 F1            [10] 3184 	pop	af
   7602 4E            [ 7] 3185 	ld	c,(hl)
   7603 3E 02         [ 7] 3186 	ld	a,#0x02
   7605 91            [ 4] 3187 	sub	a, c
   7606 38 5F         [12] 3188 	jr	C,00148$
                           3189 ;src/main.c:595: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7608 DD 6E F9      [19] 3190 	ld	l,-7 (ix)
   760B DD 66 FA      [19] 3191 	ld	h,-6 (ix)
   760E 7E            [ 7] 3192 	ld	a,(hl)
   760F C6 18         [ 7] 3193 	add	a, #0x18
   7611 57            [ 4] 3194 	ld	d,a
   7612 DD 6E F7      [19] 3195 	ld	l,-9 (ix)
   7615 DD 66 F8      [19] 3196 	ld	h,-8 (ix)
   7618 46            [ 7] 3197 	ld	b,(hl)
   7619 04            [ 4] 3198 	inc	b
   761A 04            [ 4] 3199 	inc	b
   761B D5            [11] 3200 	push	de
   761C 33            [ 6] 3201 	inc	sp
   761D C5            [11] 3202 	push	bc
   761E 33            [ 6] 3203 	inc	sp
   761F 2A D5 63      [16] 3204 	ld	hl,(_mapa)
   7622 E5            [11] 3205 	push	hl
   7623 CD 2C 4A      [17] 3206 	call	_getTilePtr
   7626 F1            [10] 3207 	pop	af
   7627 F1            [10] 3208 	pop	af
   7628 4E            [ 7] 3209 	ld	c,(hl)
   7629 3E 02         [ 7] 3210 	ld	a,#0x02
   762B 91            [ 4] 3211 	sub	a, c
   762C 38 39         [12] 3212 	jr	C,00148$
                           3213 ;src/main.c:596: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   762E DD 6E F9      [19] 3214 	ld	l,-7 (ix)
   7631 DD 66 FA      [19] 3215 	ld	h,-6 (ix)
   7634 7E            [ 7] 3216 	ld	a,(hl)
   7635 C6 18         [ 7] 3217 	add	a, #0x18
   7637 47            [ 4] 3218 	ld	b,a
   7638 DD 6E F7      [19] 3219 	ld	l,-9 (ix)
   763B DD 66 F8      [19] 3220 	ld	h,-8 (ix)
   763E 7E            [ 7] 3221 	ld	a,(hl)
   763F C6 04         [ 7] 3222 	add	a, #0x04
   7641 C5            [11] 3223 	push	bc
   7642 33            [ 6] 3224 	inc	sp
   7643 F5            [11] 3225 	push	af
   7644 33            [ 6] 3226 	inc	sp
   7645 2A D5 63      [16] 3227 	ld	hl,(_mapa)
   7648 E5            [11] 3228 	push	hl
   7649 CD 2C 4A      [17] 3229 	call	_getTilePtr
   764C F1            [10] 3230 	pop	af
   764D F1            [10] 3231 	pop	af
   764E 4E            [ 7] 3232 	ld	c,(hl)
   764F 3E 02         [ 7] 3233 	ld	a,#0x02
   7651 91            [ 4] 3234 	sub	a, c
   7652 38 13         [12] 3235 	jr	C,00148$
                           3236 ;src/main.c:597: moverEnemigoAbajo(enemy);
   7654 DD 6E F7      [19] 3237 	ld	l,-9 (ix)
   7657 DD 66 F8      [19] 3238 	ld	h,-8 (ix)
   765A E5            [11] 3239 	push	hl
   765B CD 5A 6C      [17] 3240 	call	_moverEnemigoAbajo
   765E F1            [10] 3241 	pop	af
                           3242 ;src/main.c:598: movY = 1;
   765F DD 36 F4 01   [19] 3243 	ld	-12 (ix),#0x01
                           3244 ;src/main.c:599: mov = 1;
   7663 DD 36 F5 01   [19] 3245 	ld	-11 (ix),#0x01
   7667                    3246 00148$:
                           3247 ;src/main.c:602: if (!mov) {
   7667 DD 7E F5      [19] 3248 	ld	a,-11 (ix)
   766A B7            [ 4] 3249 	or	a, a
   766B C2 89 78      [10] 3250 	jp	NZ,00189$
                           3251 ;src/main.c:603: if (!movX) {
   766E DD 7E F6      [19] 3252 	ld	a,-10 (ix)
   7671 B7            [ 4] 3253 	or	a, a
   7672 C2 79 77      [10] 3254 	jp	NZ,00163$
                           3255 ;src/main.c:604: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7675 DD 6E F9      [19] 3256 	ld	l,-7 (ix)
   7678 DD 66 FA      [19] 3257 	ld	h,-6 (ix)
   767B 5E            [ 7] 3258 	ld	e,(hl)
                           3259 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   767C DD 6E F7      [19] 3260 	ld	l,-9 (ix)
   767F DD 66 F8      [19] 3261 	ld	h,-8 (ix)
   7682 4E            [ 7] 3262 	ld	c,(hl)
                           3263 ;src/main.c:604: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7683 3E 70         [ 7] 3264 	ld	a,#0x70
   7685 93            [ 4] 3265 	sub	a, e
   7686 30 7C         [12] 3266 	jr	NC,00160$
                           3267 ;src/main.c:605: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7688 7B            [ 4] 3268 	ld	a,e
   7689 C6 18         [ 7] 3269 	add	a, #0x18
   768B 47            [ 4] 3270 	ld	b,a
   768C C5            [11] 3271 	push	bc
   768D 2A D5 63      [16] 3272 	ld	hl,(_mapa)
   7690 E5            [11] 3273 	push	hl
   7691 CD 2C 4A      [17] 3274 	call	_getTilePtr
   7694 F1            [10] 3275 	pop	af
   7695 F1            [10] 3276 	pop	af
   7696 4E            [ 7] 3277 	ld	c,(hl)
   7697 3E 02         [ 7] 3278 	ld	a,#0x02
   7699 91            [ 4] 3279 	sub	a, c
   769A 38 5B         [12] 3280 	jr	C,00150$
                           3281 ;src/main.c:606: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   769C DD 6E F9      [19] 3282 	ld	l,-7 (ix)
   769F DD 66 FA      [19] 3283 	ld	h,-6 (ix)
   76A2 7E            [ 7] 3284 	ld	a,(hl)
   76A3 C6 18         [ 7] 3285 	add	a, #0x18
   76A5 57            [ 4] 3286 	ld	d,a
   76A6 DD 6E F7      [19] 3287 	ld	l,-9 (ix)
   76A9 DD 66 F8      [19] 3288 	ld	h,-8 (ix)
   76AC 4E            [ 7] 3289 	ld	c,(hl)
   76AD 41            [ 4] 3290 	ld	b,c
   76AE 04            [ 4] 3291 	inc	b
   76AF 04            [ 4] 3292 	inc	b
   76B0 D5            [11] 3293 	push	de
   76B1 33            [ 6] 3294 	inc	sp
   76B2 C5            [11] 3295 	push	bc
   76B3 33            [ 6] 3296 	inc	sp
   76B4 2A D5 63      [16] 3297 	ld	hl,(_mapa)
   76B7 E5            [11] 3298 	push	hl
   76B8 CD 2C 4A      [17] 3299 	call	_getTilePtr
   76BB F1            [10] 3300 	pop	af
   76BC F1            [10] 3301 	pop	af
   76BD 4E            [ 7] 3302 	ld	c,(hl)
   76BE 3E 02         [ 7] 3303 	ld	a,#0x02
   76C0 91            [ 4] 3304 	sub	a, c
   76C1 38 34         [12] 3305 	jr	C,00150$
                           3306 ;src/main.c:607: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   76C3 DD 6E F9      [19] 3307 	ld	l,-7 (ix)
   76C6 DD 66 FA      [19] 3308 	ld	h,-6 (ix)
   76C9 7E            [ 7] 3309 	ld	a,(hl)
   76CA C6 18         [ 7] 3310 	add	a, #0x18
   76CC 47            [ 4] 3311 	ld	b,a
   76CD DD 6E F7      [19] 3312 	ld	l,-9 (ix)
   76D0 DD 66 F8      [19] 3313 	ld	h,-8 (ix)
   76D3 7E            [ 7] 3314 	ld	a,(hl)
   76D4 C6 04         [ 7] 3315 	add	a, #0x04
   76D6 C5            [11] 3316 	push	bc
   76D7 33            [ 6] 3317 	inc	sp
   76D8 F5            [11] 3318 	push	af
   76D9 33            [ 6] 3319 	inc	sp
   76DA 2A D5 63      [16] 3320 	ld	hl,(_mapa)
   76DD E5            [11] 3321 	push	hl
   76DE CD 2C 4A      [17] 3322 	call	_getTilePtr
   76E1 F1            [10] 3323 	pop	af
   76E2 F1            [10] 3324 	pop	af
   76E3 4E            [ 7] 3325 	ld	c,(hl)
   76E4 3E 02         [ 7] 3326 	ld	a,#0x02
   76E6 91            [ 4] 3327 	sub	a, c
   76E7 38 0E         [12] 3328 	jr	C,00150$
                           3329 ;src/main.c:608: moverEnemigoAbajo(enemy);
   76E9 DD 6E F7      [19] 3330 	ld	l,-9 (ix)
   76EC DD 66 F8      [19] 3331 	ld	h,-8 (ix)
   76EF E5            [11] 3332 	push	hl
   76F0 CD 5A 6C      [17] 3333 	call	_moverEnemigoAbajo
   76F3 F1            [10] 3334 	pop	af
   76F4 C3 79 77      [10] 3335 	jp	00163$
   76F7                    3336 00150$:
                           3337 ;src/main.c:610: moverEnemigoArriba(enemy);
   76F7 DD 6E F7      [19] 3338 	ld	l,-9 (ix)
   76FA DD 66 F8      [19] 3339 	ld	h,-8 (ix)
   76FD E5            [11] 3340 	push	hl
   76FE CD 3B 6C      [17] 3341 	call	_moverEnemigoArriba
   7701 F1            [10] 3342 	pop	af
   7702 18 75         [12] 3343 	jr	00163$
   7704                    3344 00160$:
                           3345 ;src/main.c:612: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7704 43            [ 4] 3346 	ld	b,e
   7705 05            [ 4] 3347 	dec	b
   7706 05            [ 4] 3348 	dec	b
   7707 C5            [11] 3349 	push	bc
   7708 2A D5 63      [16] 3350 	ld	hl,(_mapa)
   770B E5            [11] 3351 	push	hl
   770C CD 2C 4A      [17] 3352 	call	_getTilePtr
   770F F1            [10] 3353 	pop	af
   7710 F1            [10] 3354 	pop	af
   7711 4E            [ 7] 3355 	ld	c,(hl)
   7712 3E 02         [ 7] 3356 	ld	a,#0x02
   7714 91            [ 4] 3357 	sub	a, c
   7715 38 57         [12] 3358 	jr	C,00155$
                           3359 ;src/main.c:613: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7717 DD 6E F9      [19] 3360 	ld	l,-7 (ix)
   771A DD 66 FA      [19] 3361 	ld	h,-6 (ix)
   771D 56            [ 7] 3362 	ld	d,(hl)
   771E 15            [ 4] 3363 	dec	d
   771F 15            [ 4] 3364 	dec	d
   7720 DD 6E F7      [19] 3365 	ld	l,-9 (ix)
   7723 DD 66 F8      [19] 3366 	ld	h,-8 (ix)
   7726 46            [ 7] 3367 	ld	b,(hl)
   7727 04            [ 4] 3368 	inc	b
   7728 04            [ 4] 3369 	inc	b
   7729 D5            [11] 3370 	push	de
   772A 33            [ 6] 3371 	inc	sp
   772B C5            [11] 3372 	push	bc
   772C 33            [ 6] 3373 	inc	sp
   772D 2A D5 63      [16] 3374 	ld	hl,(_mapa)
   7730 E5            [11] 3375 	push	hl
   7731 CD 2C 4A      [17] 3376 	call	_getTilePtr
   7734 F1            [10] 3377 	pop	af
   7735 F1            [10] 3378 	pop	af
   7736 4E            [ 7] 3379 	ld	c,(hl)
   7737 3E 02         [ 7] 3380 	ld	a,#0x02
   7739 91            [ 4] 3381 	sub	a, c
   773A 38 32         [12] 3382 	jr	C,00155$
                           3383 ;src/main.c:614: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   773C DD 6E F9      [19] 3384 	ld	l,-7 (ix)
   773F DD 66 FA      [19] 3385 	ld	h,-6 (ix)
   7742 46            [ 7] 3386 	ld	b,(hl)
   7743 05            [ 4] 3387 	dec	b
   7744 05            [ 4] 3388 	dec	b
   7745 DD 6E F7      [19] 3389 	ld	l,-9 (ix)
   7748 DD 66 F8      [19] 3390 	ld	h,-8 (ix)
   774B 7E            [ 7] 3391 	ld	a,(hl)
   774C C6 04         [ 7] 3392 	add	a, #0x04
   774E C5            [11] 3393 	push	bc
   774F 33            [ 6] 3394 	inc	sp
   7750 F5            [11] 3395 	push	af
   7751 33            [ 6] 3396 	inc	sp
   7752 2A D5 63      [16] 3397 	ld	hl,(_mapa)
   7755 E5            [11] 3398 	push	hl
   7756 CD 2C 4A      [17] 3399 	call	_getTilePtr
   7759 F1            [10] 3400 	pop	af
   775A F1            [10] 3401 	pop	af
   775B 4E            [ 7] 3402 	ld	c,(hl)
   775C 3E 02         [ 7] 3403 	ld	a,#0x02
   775E 91            [ 4] 3404 	sub	a, c
   775F 38 0D         [12] 3405 	jr	C,00155$
                           3406 ;src/main.c:615: moverEnemigoArriba(enemy);
   7761 DD 6E F7      [19] 3407 	ld	l,-9 (ix)
   7764 DD 66 F8      [19] 3408 	ld	h,-8 (ix)
   7767 E5            [11] 3409 	push	hl
   7768 CD 3B 6C      [17] 3410 	call	_moverEnemigoArriba
   776B F1            [10] 3411 	pop	af
   776C 18 0B         [12] 3412 	jr	00163$
   776E                    3413 00155$:
                           3414 ;src/main.c:617: moverEnemigoAbajo(enemy);
   776E DD 6E F7      [19] 3415 	ld	l,-9 (ix)
   7771 DD 66 F8      [19] 3416 	ld	h,-8 (ix)
   7774 E5            [11] 3417 	push	hl
   7775 CD 5A 6C      [17] 3418 	call	_moverEnemigoAbajo
   7778 F1            [10] 3419 	pop	af
   7779                    3420 00163$:
                           3421 ;src/main.c:621: if (!movY) {
   7779 DD 7E F4      [19] 3422 	ld	a,-12 (ix)
   777C B7            [ 4] 3423 	or	a, a
   777D C2 89 78      [10] 3424 	jp	NZ,00189$
                           3425 ;src/main.c:622: if (enemy->x < ANCHO_PANTALLA/2) {
   7780 DD 6E F7      [19] 3426 	ld	l,-9 (ix)
   7783 DD 66 F8      [19] 3427 	ld	h,-8 (ix)
   7786 4E            [ 7] 3428 	ld	c,(hl)
                           3429 ;src/main.c:515: u8 dify = abs(enemy->y - prota.y);
   7787 DD 6E F9      [19] 3430 	ld	l,-7 (ix)
   778A DD 66 FA      [19] 3431 	ld	h,-6 (ix)
   778D 5E            [ 7] 3432 	ld	e,(hl)
                           3433 ;src/main.c:622: if (enemy->x < ANCHO_PANTALLA/2) {
   778E 79            [ 4] 3434 	ld	a,c
   778F D6 28         [ 7] 3435 	sub	a, #0x28
   7791 D2 11 78      [10] 3436 	jp	NC,00175$
                           3437 ;src/main.c:623: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7794 41            [ 4] 3438 	ld	b,c
   7795 05            [ 4] 3439 	dec	b
   7796 7B            [ 4] 3440 	ld	a,e
   7797 F5            [11] 3441 	push	af
   7798 33            [ 6] 3442 	inc	sp
   7799 C5            [11] 3443 	push	bc
   779A 33            [ 6] 3444 	inc	sp
   779B 2A D5 63      [16] 3445 	ld	hl,(_mapa)
   779E E5            [11] 3446 	push	hl
   779F CD 2C 4A      [17] 3447 	call	_getTilePtr
   77A2 F1            [10] 3448 	pop	af
   77A3 F1            [10] 3449 	pop	af
   77A4 4E            [ 7] 3450 	ld	c,(hl)
   77A5 3E 02         [ 7] 3451 	ld	a,#0x02
   77A7 91            [ 4] 3452 	sub	a, c
   77A8 38 5A         [12] 3453 	jr	C,00165$
                           3454 ;src/main.c:624: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   77AA DD 6E F9      [19] 3455 	ld	l,-7 (ix)
   77AD DD 66 FA      [19] 3456 	ld	h,-6 (ix)
   77B0 7E            [ 7] 3457 	ld	a,(hl)
   77B1 C6 0B         [ 7] 3458 	add	a, #0x0B
   77B3 4F            [ 4] 3459 	ld	c,a
   77B4 DD 6E F7      [19] 3460 	ld	l,-9 (ix)
   77B7 DD 66 F8      [19] 3461 	ld	h,-8 (ix)
   77BA 46            [ 7] 3462 	ld	b,(hl)
   77BB 05            [ 4] 3463 	dec	b
   77BC 79            [ 4] 3464 	ld	a,c
   77BD F5            [11] 3465 	push	af
   77BE 33            [ 6] 3466 	inc	sp
   77BF C5            [11] 3467 	push	bc
   77C0 33            [ 6] 3468 	inc	sp
   77C1 2A D5 63      [16] 3469 	ld	hl,(_mapa)
   77C4 E5            [11] 3470 	push	hl
   77C5 CD 2C 4A      [17] 3471 	call	_getTilePtr
   77C8 F1            [10] 3472 	pop	af
   77C9 F1            [10] 3473 	pop	af
   77CA 4E            [ 7] 3474 	ld	c,(hl)
   77CB 3E 02         [ 7] 3475 	ld	a,#0x02
   77CD 91            [ 4] 3476 	sub	a, c
   77CE 38 34         [12] 3477 	jr	C,00165$
                           3478 ;src/main.c:625: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   77D0 DD 6E F9      [19] 3479 	ld	l,-7 (ix)
   77D3 DD 66 FA      [19] 3480 	ld	h,-6 (ix)
   77D6 7E            [ 7] 3481 	ld	a,(hl)
   77D7 C6 16         [ 7] 3482 	add	a, #0x16
   77D9 4F            [ 4] 3483 	ld	c,a
   77DA DD 6E F7      [19] 3484 	ld	l,-9 (ix)
   77DD DD 66 F8      [19] 3485 	ld	h,-8 (ix)
   77E0 46            [ 7] 3486 	ld	b,(hl)
   77E1 05            [ 4] 3487 	dec	b
   77E2 79            [ 4] 3488 	ld	a,c
   77E3 F5            [11] 3489 	push	af
   77E4 33            [ 6] 3490 	inc	sp
   77E5 C5            [11] 3491 	push	bc
   77E6 33            [ 6] 3492 	inc	sp
   77E7 2A D5 63      [16] 3493 	ld	hl,(_mapa)
   77EA E5            [11] 3494 	push	hl
   77EB CD 2C 4A      [17] 3495 	call	_getTilePtr
   77EE F1            [10] 3496 	pop	af
   77EF F1            [10] 3497 	pop	af
   77F0 4E            [ 7] 3498 	ld	c,(hl)
   77F1 3E 02         [ 7] 3499 	ld	a,#0x02
   77F3 91            [ 4] 3500 	sub	a, c
   77F4 38 0E         [12] 3501 	jr	C,00165$
                           3502 ;src/main.c:626: moverEnemigoIzquierda(enemy);
   77F6 DD 6E F7      [19] 3503 	ld	l,-9 (ix)
   77F9 DD 66 F8      [19] 3504 	ld	h,-8 (ix)
   77FC E5            [11] 3505 	push	hl
   77FD CD 89 6C      [17] 3506 	call	_moverEnemigoIzquierda
   7800 F1            [10] 3507 	pop	af
   7801 C3 89 78      [10] 3508 	jp	00189$
   7804                    3509 00165$:
                           3510 ;src/main.c:628: moverEnemigoDerecha(enemy);
   7804 DD 6E F7      [19] 3511 	ld	l,-9 (ix)
   7807 DD 66 F8      [19] 3512 	ld	h,-8 (ix)
   780A E5            [11] 3513 	push	hl
   780B CD 79 6C      [17] 3514 	call	_moverEnemigoDerecha
   780E F1            [10] 3515 	pop	af
   780F 18 78         [12] 3516 	jr	00189$
   7811                    3517 00175$:
                           3518 ;src/main.c:631: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7811 79            [ 4] 3519 	ld	a,c
   7812 C6 05         [ 7] 3520 	add	a, #0x05
   7814 47            [ 4] 3521 	ld	b,a
   7815 7B            [ 4] 3522 	ld	a,e
   7816 F5            [11] 3523 	push	af
   7817 33            [ 6] 3524 	inc	sp
   7818 C5            [11] 3525 	push	bc
   7819 33            [ 6] 3526 	inc	sp
   781A 2A D5 63      [16] 3527 	ld	hl,(_mapa)
   781D E5            [11] 3528 	push	hl
   781E CD 2C 4A      [17] 3529 	call	_getTilePtr
   7821 F1            [10] 3530 	pop	af
   7822 F1            [10] 3531 	pop	af
   7823 4E            [ 7] 3532 	ld	c,(hl)
   7824 3E 02         [ 7] 3533 	ld	a,#0x02
   7826 91            [ 4] 3534 	sub	a, c
   7827 38 55         [12] 3535 	jr	C,00170$
                           3536 ;src/main.c:632: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7829 DD 6E F9      [19] 3537 	ld	l,-7 (ix)
   782C DD 66 FA      [19] 3538 	ld	h,-6 (ix)
   782F 7E            [ 7] 3539 	ld	a,(hl)
   7830 C6 0B         [ 7] 3540 	add	a, #0x0B
   7832 47            [ 4] 3541 	ld	b,a
   7833 DD 6E F7      [19] 3542 	ld	l,-9 (ix)
   7836 DD 66 F8      [19] 3543 	ld	h,-8 (ix)
   7839 7E            [ 7] 3544 	ld	a,(hl)
   783A C6 05         [ 7] 3545 	add	a, #0x05
   783C 4F            [ 4] 3546 	ld	c,a
   783D C5            [11] 3547 	push	bc
   783E 2A D5 63      [16] 3548 	ld	hl,(_mapa)
   7841 E5            [11] 3549 	push	hl
   7842 CD 2C 4A      [17] 3550 	call	_getTilePtr
   7845 F1            [10] 3551 	pop	af
   7846 F1            [10] 3552 	pop	af
   7847 4E            [ 7] 3553 	ld	c,(hl)
   7848 3E 02         [ 7] 3554 	ld	a,#0x02
   784A 91            [ 4] 3555 	sub	a, c
   784B 38 31         [12] 3556 	jr	C,00170$
                           3557 ;src/main.c:633: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   784D DD 6E F9      [19] 3558 	ld	l,-7 (ix)
   7850 DD 66 FA      [19] 3559 	ld	h,-6 (ix)
   7853 7E            [ 7] 3560 	ld	a,(hl)
   7854 C6 16         [ 7] 3561 	add	a, #0x16
   7856 47            [ 4] 3562 	ld	b,a
   7857 DD 6E F7      [19] 3563 	ld	l,-9 (ix)
   785A DD 66 F8      [19] 3564 	ld	h,-8 (ix)
   785D 7E            [ 7] 3565 	ld	a,(hl)
   785E C6 05         [ 7] 3566 	add	a, #0x05
   7860 4F            [ 4] 3567 	ld	c,a
   7861 C5            [11] 3568 	push	bc
   7862 2A D5 63      [16] 3569 	ld	hl,(_mapa)
   7865 E5            [11] 3570 	push	hl
   7866 CD 2C 4A      [17] 3571 	call	_getTilePtr
   7869 F1            [10] 3572 	pop	af
   786A F1            [10] 3573 	pop	af
   786B 4E            [ 7] 3574 	ld	c,(hl)
   786C 3E 02         [ 7] 3575 	ld	a,#0x02
   786E 91            [ 4] 3576 	sub	a, c
   786F 38 0D         [12] 3577 	jr	C,00170$
                           3578 ;src/main.c:634: moverEnemigoDerecha(enemy);
   7871 DD 6E F7      [19] 3579 	ld	l,-9 (ix)
   7874 DD 66 F8      [19] 3580 	ld	h,-8 (ix)
   7877 E5            [11] 3581 	push	hl
   7878 CD 79 6C      [17] 3582 	call	_moverEnemigoDerecha
   787B F1            [10] 3583 	pop	af
   787C 18 0B         [12] 3584 	jr	00189$
   787E                    3585 00170$:
                           3586 ;src/main.c:637: moverEnemigoIzquierda(enemy);
   787E DD 6E F7      [19] 3587 	ld	l,-9 (ix)
   7881 DD 66 F8      [19] 3588 	ld	h,-8 (ix)
   7884 E5            [11] 3589 	push	hl
   7885 CD 89 6C      [17] 3590 	call	_moverEnemigoIzquierda
   7888 F1            [10] 3591 	pop	af
   7889                    3592 00189$:
   7889 DD F9         [10] 3593 	ld	sp, ix
   788B DD E1         [14] 3594 	pop	ix
   788D C9            [10] 3595 	ret
                           3596 ;src/main.c:646: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3597 ;	---------------------------------
                           3598 ; Function updateEnemy
                           3599 ; ---------------------------------
   788E                    3600 _updateEnemy::
   788E DD E5         [15] 3601 	push	ix
   7890 DD 21 00 00   [14] 3602 	ld	ix,#0
   7894 DD 39         [15] 3603 	add	ix,sp
   7896 21 F4 FF      [10] 3604 	ld	hl,#-12
   7899 39            [11] 3605 	add	hl,sp
   789A F9            [ 6] 3606 	ld	sp,hl
                           3607 ;src/main.c:653: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   789B DD 4E 04      [19] 3608 	ld	c,4 (ix)
   789E DD 46 05      [19] 3609 	ld	b,5 (ix)
   78A1 21 16 00      [10] 3610 	ld	hl,#0x0016
   78A4 09            [11] 3611 	add	hl,bc
   78A5 DD 75 FC      [19] 3612 	ld	-4 (ix),l
   78A8 DD 74 FD      [19] 3613 	ld	-3 (ix),h
   78AB DD 6E FC      [19] 3614 	ld	l,-4 (ix)
   78AE DD 66 FD      [19] 3615 	ld	h,-3 (ix)
   78B1 7E            [ 7] 3616 	ld	a,(hl)
   78B2 B7            [ 4] 3617 	or	a, a
   78B3 28 14         [12] 3618 	jr	Z,00117$
                           3619 ;src/main.c:654: engage(actual, prota.x, prota.y);
   78B5 3A F9 62      [13] 3620 	ld	a, (#_prota + 1)
   78B8 21 F8 62      [10] 3621 	ld	hl, #_prota + 0
   78BB 56            [ 7] 3622 	ld	d,(hl)
   78BC F5            [11] 3623 	push	af
   78BD 33            [ 6] 3624 	inc	sp
   78BE D5            [11] 3625 	push	de
   78BF 33            [ 6] 3626 	inc	sp
   78C0 C5            [11] 3627 	push	bc
   78C1 CD 98 71      [17] 3628 	call	_engage
   78C4 F1            [10] 3629 	pop	af
   78C5 F1            [10] 3630 	pop	af
   78C6 C3 E3 79      [10] 3631 	jp	00119$
   78C9                    3632 00117$:
                           3633 ;src/main.c:656: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   78C9 C5            [11] 3634 	push	bc
   78CA C5            [11] 3635 	push	bc
   78CB CD E4 6E      [17] 3636 	call	_lookFor
   78CE F1            [10] 3637 	pop	af
   78CF C1            [10] 3638 	pop	bc
                           3639 ;src/main.c:662: actual->patrolling = 0;
   78D0 21 0B 00      [10] 3640 	ld	hl,#0x000B
   78D3 09            [11] 3641 	add	hl,bc
   78D4 DD 75 FE      [19] 3642 	ld	-2 (ix),l
   78D7 DD 74 FF      [19] 3643 	ld	-1 (ix),h
                           3644 ;src/main.c:657: if (actual->patrolling) {
   78DA DD 6E FE      [19] 3645 	ld	l,-2 (ix)
   78DD DD 66 FF      [19] 3646 	ld	h,-1 (ix)
   78E0 6E            [ 7] 3647 	ld	l,(hl)
                           3648 ;src/main.c:660: if (actual->inRange) {
   78E1 79            [ 4] 3649 	ld	a,c
   78E2 C6 11         [ 7] 3650 	add	a, #0x11
   78E4 5F            [ 4] 3651 	ld	e,a
   78E5 78            [ 4] 3652 	ld	a,b
   78E6 CE 00         [ 7] 3653 	adc	a, #0x00
   78E8 57            [ 4] 3654 	ld	d,a
                           3655 ;src/main.c:669: actual->seek = 1;
   78E9 79            [ 4] 3656 	ld	a,c
   78EA C6 14         [ 7] 3657 	add	a, #0x14
   78EC DD 77 F8      [19] 3658 	ld	-8 (ix),a
   78EF 78            [ 4] 3659 	ld	a,b
   78F0 CE 00         [ 7] 3660 	adc	a, #0x00
   78F2 DD 77 F9      [19] 3661 	ld	-7 (ix),a
                           3662 ;src/main.c:657: if (actual->patrolling) {
   78F5 7D            [ 4] 3663 	ld	a,l
   78F6 B7            [ 4] 3664 	or	a, a
   78F7 CA AC 79      [10] 3665 	jp	Z,00114$
                           3666 ;src/main.c:659: moverEnemigoPatrol(actual);
   78FA C5            [11] 3667 	push	bc
   78FB D5            [11] 3668 	push	de
   78FC C5            [11] 3669 	push	bc
   78FD CD 9B 6C      [17] 3670 	call	_moverEnemigoPatrol
   7900 F1            [10] 3671 	pop	af
   7901 D1            [10] 3672 	pop	de
   7902 C1            [10] 3673 	pop	bc
                           3674 ;src/main.c:660: if (actual->inRange) {
   7903 1A            [ 7] 3675 	ld	a,(de)
   7904 B7            [ 4] 3676 	or	a, a
   7905 28 24         [12] 3677 	jr	Z,00104$
                           3678 ;src/main.c:661: engage(actual, prota.x, prota.y);
   7907 3A F9 62      [13] 3679 	ld	a, (#_prota + 1)
   790A 21 F8 62      [10] 3680 	ld	hl, #_prota + 0
   790D 56            [ 7] 3681 	ld	d,(hl)
   790E F5            [11] 3682 	push	af
   790F 33            [ 6] 3683 	inc	sp
   7910 D5            [11] 3684 	push	de
   7911 33            [ 6] 3685 	inc	sp
   7912 C5            [11] 3686 	push	bc
   7913 CD 98 71      [17] 3687 	call	_engage
   7916 F1            [10] 3688 	pop	af
   7917 F1            [10] 3689 	pop	af
                           3690 ;src/main.c:662: actual->patrolling = 0;
   7918 DD 6E FE      [19] 3691 	ld	l,-2 (ix)
   791B DD 66 FF      [19] 3692 	ld	h,-1 (ix)
   791E 36 00         [10] 3693 	ld	(hl),#0x00
                           3694 ;src/main.c:663: actual->engage = 1;
   7920 DD 6E FC      [19] 3695 	ld	l,-4 (ix)
   7923 DD 66 FD      [19] 3696 	ld	h,-3 (ix)
   7926 36 01         [10] 3697 	ld	(hl),#0x01
   7928 C3 E3 79      [10] 3698 	jp	00119$
   792B                    3699 00104$:
                           3700 ;src/main.c:664: } else if (actual->seen) {
   792B 21 12 00      [10] 3701 	ld	hl,#0x0012
   792E 09            [11] 3702 	add	hl,bc
   792F E3            [19] 3703 	ex	(sp), hl
   7930 E1            [10] 3704 	pop	hl
   7931 E5            [11] 3705 	push	hl
   7932 7E            [ 7] 3706 	ld	a,(hl)
   7933 B7            [ 4] 3707 	or	a, a
   7934 CA E3 79      [10] 3708 	jp	Z,00119$
                           3709 ;src/main.c:666: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   7937 3A F9 62      [13] 3710 	ld	a,(#_prota + 1)
   793A DD 77 FB      [19] 3711 	ld	-5 (ix),a
   793D 21 F8 62      [10] 3712 	ld	hl, #_prota + 0
   7940 5E            [ 7] 3713 	ld	e,(hl)
   7941 21 01 00      [10] 3714 	ld	hl,#0x0001
   7944 09            [11] 3715 	add	hl,bc
   7945 DD 75 F6      [19] 3716 	ld	-10 (ix),l
   7948 DD 74 F7      [19] 3717 	ld	-9 (ix),h
   794B DD 6E F6      [19] 3718 	ld	l,-10 (ix)
   794E DD 66 F7      [19] 3719 	ld	h,-9 (ix)
   7951 56            [ 7] 3720 	ld	d,(hl)
   7952 0A            [ 7] 3721 	ld	a,(bc)
   7953 DD 77 FA      [19] 3722 	ld	-6 (ix),a
   7956 C5            [11] 3723 	push	bc
   7957 2A D5 63      [16] 3724 	ld	hl,(_mapa)
   795A E5            [11] 3725 	push	hl
   795B C5            [11] 3726 	push	bc
   795C DD 7E FB      [19] 3727 	ld	a,-5 (ix)
   795F F5            [11] 3728 	push	af
   7960 33            [ 6] 3729 	inc	sp
   7961 7B            [ 4] 3730 	ld	a,e
   7962 F5            [11] 3731 	push	af
   7963 33            [ 6] 3732 	inc	sp
   7964 D5            [11] 3733 	push	de
   7965 33            [ 6] 3734 	inc	sp
   7966 DD 7E FA      [19] 3735 	ld	a,-6 (ix)
   7969 F5            [11] 3736 	push	af
   796A 33            [ 6] 3737 	inc	sp
   796B CD 82 48      [17] 3738 	call	_pathFinding
   796E 21 08 00      [10] 3739 	ld	hl,#8
   7971 39            [11] 3740 	add	hl,sp
   7972 F9            [ 6] 3741 	ld	sp,hl
   7973 C1            [10] 3742 	pop	bc
                           3743 ;src/main.c:667: actual->p_seek_x = actual->x;
   7974 21 17 00      [10] 3744 	ld	hl,#0x0017
   7977 09            [11] 3745 	add	hl,bc
   7978 EB            [ 4] 3746 	ex	de,hl
   7979 0A            [ 7] 3747 	ld	a,(bc)
   797A 12            [ 7] 3748 	ld	(de),a
                           3749 ;src/main.c:668: actual->p_seek_y = actual->y;
   797B 21 18 00      [10] 3750 	ld	hl,#0x0018
   797E 09            [11] 3751 	add	hl,bc
   797F EB            [ 4] 3752 	ex	de,hl
   7980 DD 6E F6      [19] 3753 	ld	l,-10 (ix)
   7983 DD 66 F7      [19] 3754 	ld	h,-9 (ix)
   7986 7E            [ 7] 3755 	ld	a,(hl)
   7987 12            [ 7] 3756 	ld	(de),a
                           3757 ;src/main.c:669: actual->seek = 1;
   7988 DD 6E F8      [19] 3758 	ld	l,-8 (ix)
   798B DD 66 F9      [19] 3759 	ld	h,-7 (ix)
   798E 36 01         [10] 3760 	ld	(hl),#0x01
                           3761 ;src/main.c:670: actual->iter=0;
   7990 21 0E 00      [10] 3762 	ld	hl,#0x000E
   7993 09            [11] 3763 	add	hl,bc
   7994 AF            [ 4] 3764 	xor	a, a
   7995 77            [ 7] 3765 	ld	(hl), a
   7996 23            [ 6] 3766 	inc	hl
   7997 77            [ 7] 3767 	ld	(hl), a
                           3768 ;src/main.c:671: actual->reversePatrol = NO;
   7998 21 0C 00      [10] 3769 	ld	hl,#0x000C
   799B 09            [11] 3770 	add	hl,bc
   799C 36 00         [10] 3771 	ld	(hl),#0x00
                           3772 ;src/main.c:672: actual->patrolling = 0;
   799E DD 6E FE      [19] 3773 	ld	l,-2 (ix)
   79A1 DD 66 FF      [19] 3774 	ld	h,-1 (ix)
   79A4 36 00         [10] 3775 	ld	(hl),#0x00
                           3776 ;src/main.c:673: actual->seen = 0;
   79A6 E1            [10] 3777 	pop	hl
   79A7 E5            [11] 3778 	push	hl
   79A8 36 00         [10] 3779 	ld	(hl),#0x00
   79AA 18 37         [12] 3780 	jr	00119$
   79AC                    3781 00114$:
                           3782 ;src/main.c:675: } else if (actual->seek) {
   79AC DD 6E F8      [19] 3783 	ld	l,-8 (ix)
   79AF DD 66 F9      [19] 3784 	ld	h,-7 (ix)
   79B2 7E            [ 7] 3785 	ld	a,(hl)
   79B3 B7            [ 4] 3786 	or	a, a
   79B4 28 2D         [12] 3787 	jr	Z,00119$
                           3788 ;src/main.c:677: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   79B6 C5            [11] 3789 	push	bc
   79B7 FD E1         [14] 3790 	pop	iy
   79B9 FD 7E 13      [19] 3791 	ld	a,19 (iy)
   79BC B7            [ 4] 3792 	or	a, a
   79BD 20 07         [12] 3793 	jr	NZ,00109$
                           3794 ;src/main.c:680: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   79BF C5            [11] 3795 	push	bc
   79C0 CD F3 6F      [17] 3796 	call	_moverEnemigoSeek
   79C3 F1            [10] 3797 	pop	af
   79C4 18 1D         [12] 3798 	jr	00119$
   79C6                    3799 00109$:
                           3800 ;src/main.c:681: } else if (actual->inRange) {
   79C6 1A            [ 7] 3801 	ld	a,(de)
   79C7 B7            [ 4] 3802 	or	a, a
   79C8 28 19         [12] 3803 	jr	Z,00119$
                           3804 ;src/main.c:682: engage(actual, prota.x, prota.y);
   79CA 3A F9 62      [13] 3805 	ld	a, (#_prota + 1)
   79CD 21 F8 62      [10] 3806 	ld	hl, #_prota + 0
   79D0 56            [ 7] 3807 	ld	d,(hl)
   79D1 F5            [11] 3808 	push	af
   79D2 33            [ 6] 3809 	inc	sp
   79D3 D5            [11] 3810 	push	de
   79D4 33            [ 6] 3811 	inc	sp
   79D5 C5            [11] 3812 	push	bc
   79D6 CD 98 71      [17] 3813 	call	_engage
   79D9 F1            [10] 3814 	pop	af
   79DA F1            [10] 3815 	pop	af
                           3816 ;src/main.c:683: actual->engage = 1;
   79DB DD 6E FC      [19] 3817 	ld	l,-4 (ix)
   79DE DD 66 FD      [19] 3818 	ld	h,-3 (ix)
   79E1 36 01         [10] 3819 	ld	(hl),#0x01
   79E3                    3820 00119$:
   79E3 DD F9         [10] 3821 	ld	sp, ix
   79E5 DD E1         [14] 3822 	pop	ix
   79E7 C9            [10] 3823 	ret
                           3824 ;src/main.c:689: void inicializarEnemy() {
                           3825 ;	---------------------------------
                           3826 ; Function inicializarEnemy
                           3827 ; ---------------------------------
   79E8                    3828 _inicializarEnemy::
   79E8 DD E5         [15] 3829 	push	ix
   79EA DD 21 00 00   [14] 3830 	ld	ix,#0
   79EE DD 39         [15] 3831 	add	ix,sp
   79F0 21 F9 FF      [10] 3832 	ld	hl,#-7
   79F3 39            [11] 3833 	add	hl,sp
   79F4 F9            [ 6] 3834 	ld	sp,hl
                           3835 ;src/main.c:700: actual = enemy;
   79F5 01 70 5F      [10] 3836 	ld	bc,#_enemy+0
                           3837 ;src/main.c:701: while(i){
   79F8 DD 36 F9 02   [19] 3838 	ld	-7 (ix),#0x02
   79FC                    3839 00103$:
   79FC DD 7E F9      [19] 3840 	ld	a,-7 (ix)
   79FF B7            [ 4] 3841 	or	a, a
   7A00 CA FC 7A      [10] 3842 	jp	Z,00106$
                           3843 ;src/main.c:702: --i;
   7A03 DD 35 F9      [23] 3844 	dec	-7 (ix)
                           3845 ;src/main.c:703: actual->x = actual->px = spawnX[i];
   7A06 59            [ 4] 3846 	ld	e, c
   7A07 50            [ 4] 3847 	ld	d, b
   7A08 13            [ 6] 3848 	inc	de
   7A09 13            [ 6] 3849 	inc	de
   7A0A 3E FB         [ 7] 3850 	ld	a,#<(_spawnX)
   7A0C DD 86 F9      [19] 3851 	add	a, -7 (ix)
   7A0F DD 77 FE      [19] 3852 	ld	-2 (ix),a
   7A12 3E 63         [ 7] 3853 	ld	a,#>(_spawnX)
   7A14 CE 00         [ 7] 3854 	adc	a, #0x00
   7A16 DD 77 FF      [19] 3855 	ld	-1 (ix),a
   7A19 DD 6E FE      [19] 3856 	ld	l,-2 (ix)
   7A1C DD 66 FF      [19] 3857 	ld	h,-1 (ix)
   7A1F 7E            [ 7] 3858 	ld	a,(hl)
   7A20 12            [ 7] 3859 	ld	(de),a
   7A21 02            [ 7] 3860 	ld	(bc),a
                           3861 ;src/main.c:704: actual->y = actual->py = spawnY[i];
   7A22 C5            [11] 3862 	push	bc
   7A23 FD E1         [14] 3863 	pop	iy
   7A25 FD 23         [10] 3864 	inc	iy
   7A27 59            [ 4] 3865 	ld	e, c
   7A28 50            [ 4] 3866 	ld	d, b
   7A29 13            [ 6] 3867 	inc	de
   7A2A 13            [ 6] 3868 	inc	de
   7A2B 13            [ 6] 3869 	inc	de
   7A2C 3E FF         [ 7] 3870 	ld	a,#<(_spawnY)
   7A2E DD 86 F9      [19] 3871 	add	a, -7 (ix)
   7A31 DD 77 FC      [19] 3872 	ld	-4 (ix),a
   7A34 3E 63         [ 7] 3873 	ld	a,#>(_spawnY)
   7A36 CE 00         [ 7] 3874 	adc	a, #0x00
   7A38 DD 77 FD      [19] 3875 	ld	-3 (ix),a
   7A3B DD 6E FC      [19] 3876 	ld	l,-4 (ix)
   7A3E DD 66 FD      [19] 3877 	ld	h,-3 (ix)
   7A41 7E            [ 7] 3878 	ld	a,(hl)
   7A42 12            [ 7] 3879 	ld	(de),a
   7A43 FD 77 00      [19] 3880 	ld	0 (iy), a
                           3881 ;src/main.c:705: actual->mover  = NO;
   7A46 21 06 00      [10] 3882 	ld	hl,#0x0006
   7A49 09            [11] 3883 	add	hl,bc
   7A4A 36 00         [10] 3884 	ld	(hl),#0x00
                           3885 ;src/main.c:706: actual->mira   = M_abajo;
   7A4C 21 07 00      [10] 3886 	ld	hl,#0x0007
   7A4F 09            [11] 3887 	add	hl,bc
   7A50 36 03         [10] 3888 	ld	(hl),#0x03
                           3889 ;src/main.c:707: actual->sprite = g_enemy;
   7A52 21 04 00      [10] 3890 	ld	hl,#0x0004
   7A55 09            [11] 3891 	add	hl,bc
   7A56 36 3A         [10] 3892 	ld	(hl),#<(_g_enemy)
   7A58 23            [ 6] 3893 	inc	hl
   7A59 36 3C         [10] 3894 	ld	(hl),#>(_g_enemy)
                           3895 ;src/main.c:708: actual->muerto = NO;
   7A5B 21 08 00      [10] 3896 	ld	hl,#0x0008
   7A5E 09            [11] 3897 	add	hl,bc
   7A5F 36 00         [10] 3898 	ld	(hl),#0x00
                           3899 ;src/main.c:709: actual->muertes = 0;
   7A61 21 0A 00      [10] 3900 	ld	hl,#0x000A
   7A64 09            [11] 3901 	add	hl,bc
   7A65 36 00         [10] 3902 	ld	(hl),#0x00
                           3903 ;src/main.c:710: actual->patrolling = SI;
   7A67 21 0B 00      [10] 3904 	ld	hl,#0x000B
   7A6A 09            [11] 3905 	add	hl,bc
   7A6B 36 01         [10] 3906 	ld	(hl),#0x01
                           3907 ;src/main.c:711: actual->reversePatrol = NO;
   7A6D 21 0C 00      [10] 3908 	ld	hl,#0x000C
   7A70 09            [11] 3909 	add	hl,bc
   7A71 36 00         [10] 3910 	ld	(hl),#0x00
                           3911 ;src/main.c:712: actual->iter = 0;
   7A73 21 0E 00      [10] 3912 	ld	hl,#0x000E
   7A76 09            [11] 3913 	add	hl,bc
   7A77 AF            [ 4] 3914 	xor	a, a
   7A78 77            [ 7] 3915 	ld	(hl), a
   7A79 23            [ 6] 3916 	inc	hl
   7A7A 77            [ 7] 3917 	ld	(hl), a
                           3918 ;src/main.c:713: actual->lastIter = 0;
   7A7B 21 10 00      [10] 3919 	ld	hl,#0x0010
   7A7E 09            [11] 3920 	add	hl,bc
   7A7F 36 00         [10] 3921 	ld	(hl),#0x00
                           3922 ;src/main.c:714: actual->seen = 0;
   7A81 21 12 00      [10] 3923 	ld	hl,#0x0012
   7A84 09            [11] 3924 	add	hl,bc
   7A85 36 00         [10] 3925 	ld	(hl),#0x00
                           3926 ;src/main.c:715: actual->found = 0;
   7A87 21 13 00      [10] 3927 	ld	hl,#0x0013
   7A8A 09            [11] 3928 	add	hl,bc
   7A8B 36 00         [10] 3929 	ld	(hl),#0x00
                           3930 ;src/main.c:716: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7A8D 21 D7 63      [10] 3931 	ld	hl,#_num_mapa + 0
   7A90 5E            [ 7] 3932 	ld	e, (hl)
   7A91 1C            [ 4] 3933 	inc	e
   7A92 16 00         [ 7] 3934 	ld	d,#0x00
   7A94 6B            [ 4] 3935 	ld	l, e
   7A95 62            [ 4] 3936 	ld	h, d
   7A96 29            [11] 3937 	add	hl, hl
   7A97 29            [11] 3938 	add	hl, hl
   7A98 19            [11] 3939 	add	hl, de
   7A99 EB            [ 4] 3940 	ex	de,hl
   7A9A 21 17 64      [10] 3941 	ld	hl,#_patrolY
   7A9D 19            [11] 3942 	add	hl,de
   7A9E DD 7E F9      [19] 3943 	ld	a,-7 (ix)
   7AA1 85            [ 4] 3944 	add	a, l
   7AA2 6F            [ 4] 3945 	ld	l,a
   7AA3 3E 00         [ 7] 3946 	ld	a,#0x00
   7AA5 8C            [ 4] 3947 	adc	a, h
   7AA6 67            [ 4] 3948 	ld	h,a
   7AA7 7E            [ 7] 3949 	ld	a,(hl)
   7AA8 DD 77 FB      [19] 3950 	ld	-5 (ix),a
   7AAB 21 03 64      [10] 3951 	ld	hl,#_patrolX
   7AAE 19            [11] 3952 	add	hl,de
   7AAF DD 5E F9      [19] 3953 	ld	e,-7 (ix)
   7AB2 16 00         [ 7] 3954 	ld	d,#0x00
   7AB4 19            [11] 3955 	add	hl,de
   7AB5 7E            [ 7] 3956 	ld	a,(hl)
   7AB6 DD 77 FA      [19] 3957 	ld	-6 (ix),a
   7AB9 DD 6E FC      [19] 3958 	ld	l,-4 (ix)
   7ABC DD 66 FD      [19] 3959 	ld	h,-3 (ix)
   7ABF 5E            [ 7] 3960 	ld	e,(hl)
   7AC0 DD 6E FE      [19] 3961 	ld	l,-2 (ix)
   7AC3 DD 66 FF      [19] 3962 	ld	h,-1 (ix)
   7AC6 56            [ 7] 3963 	ld	d,(hl)
   7AC7 C5            [11] 3964 	push	bc
   7AC8 2A D5 63      [16] 3965 	ld	hl,(_mapa)
   7ACB E5            [11] 3966 	push	hl
   7ACC C5            [11] 3967 	push	bc
   7ACD DD 66 FB      [19] 3968 	ld	h,-5 (ix)
   7AD0 DD 6E FA      [19] 3969 	ld	l,-6 (ix)
   7AD3 E5            [11] 3970 	push	hl
   7AD4 7B            [ 4] 3971 	ld	a,e
   7AD5 F5            [11] 3972 	push	af
   7AD6 33            [ 6] 3973 	inc	sp
   7AD7 D5            [11] 3974 	push	de
   7AD8 33            [ 6] 3975 	inc	sp
   7AD9 CD 82 48      [17] 3976 	call	_pathFinding
   7ADC 21 08 00      [10] 3977 	ld	hl,#8
   7ADF 39            [11] 3978 	add	hl,sp
   7AE0 F9            [ 6] 3979 	ld	sp,hl
   7AE1 C1            [10] 3980 	pop	bc
                           3981 ;src/main.c:739: if(actual->longitud_camino > 0){
   7AE2 69            [ 4] 3982 	ld	l, c
   7AE3 60            [ 4] 3983 	ld	h, b
   7AE4 11 E1 00      [10] 3984 	ld	de, #0x00E1
   7AE7 19            [11] 3985 	add	hl, de
   7AE8 7E            [ 7] 3986 	ld	a,(hl)
   7AE9 B7            [ 4] 3987 	or	a, a
   7AEA 28 07         [12] 3988 	jr	Z,00102$
                           3989 ;src/main.c:740: dibujarEnemigo(actual);
   7AEC C5            [11] 3990 	push	bc
   7AED C5            [11] 3991 	push	bc
   7AEE CD B1 66      [17] 3992 	call	_dibujarEnemigo
   7AF1 F1            [10] 3993 	pop	af
   7AF2 C1            [10] 3994 	pop	bc
   7AF3                    3995 00102$:
                           3996 ;src/main.c:742: ++actual;
   7AF3 21 E2 00      [10] 3997 	ld	hl,#0x00E2
   7AF6 09            [11] 3998 	add	hl,bc
   7AF7 4D            [ 4] 3999 	ld	c,l
   7AF8 44            [ 4] 4000 	ld	b,h
   7AF9 C3 FC 79      [10] 4001 	jp	00103$
   7AFC                    4002 00106$:
   7AFC DD F9         [10] 4003 	ld	sp, ix
   7AFE DD E1         [14] 4004 	pop	ix
   7B00 C9            [10] 4005 	ret
                           4006 ;src/main.c:746: void avanzarMapa() {
                           4007 ;	---------------------------------
                           4008 ; Function avanzarMapa
                           4009 ; ---------------------------------
   7B01                    4010 _avanzarMapa::
                           4011 ;src/main.c:747: if(num_mapa < NUM_MAPAS -1) {
   7B01 3A D7 63      [13] 4012 	ld	a,(#_num_mapa + 0)
   7B04 D6 02         [ 7] 4013 	sub	a, #0x02
   7B06 30 34         [12] 4014 	jr	NC,00102$
                           4015 ;src/main.c:748: mapa = mapas[++num_mapa];
   7B08 01 F5 63      [10] 4016 	ld	bc,#_mapas+0
   7B0B 21 D7 63      [10] 4017 	ld	hl, #_num_mapa+0
   7B0E 34            [11] 4018 	inc	(hl)
   7B0F FD 21 D7 63   [14] 4019 	ld	iy,#_num_mapa
   7B13 FD 6E 00      [19] 4020 	ld	l,0 (iy)
   7B16 26 00         [ 7] 4021 	ld	h,#0x00
   7B18 29            [11] 4022 	add	hl, hl
   7B19 09            [11] 4023 	add	hl,bc
   7B1A 7E            [ 7] 4024 	ld	a,(hl)
   7B1B FD 21 D5 63   [14] 4025 	ld	iy,#_mapa
   7B1F FD 77 00      [19] 4026 	ld	0 (iy),a
   7B22 23            [ 6] 4027 	inc	hl
   7B23 7E            [ 7] 4028 	ld	a,(hl)
   7B24 32 D6 63      [13] 4029 	ld	(#_mapa + 1),a
                           4030 ;src/main.c:749: prota.x = prota.px = 2;
   7B27 21 FA 62      [10] 4031 	ld	hl,#(_prota + 0x0002)
   7B2A 36 02         [10] 4032 	ld	(hl),#0x02
   7B2C 21 F8 62      [10] 4033 	ld	hl,#_prota
   7B2F 36 02         [10] 4034 	ld	(hl),#0x02
                           4035 ;src/main.c:750: prota.mover = SI;
   7B31 21 FE 62      [10] 4036 	ld	hl,#(_prota + 0x0006)
   7B34 36 01         [10] 4037 	ld	(hl),#0x01
                           4038 ;src/main.c:751: dibujarMapa();
   7B36 CD DF 63      [17] 4039 	call	_dibujarMapa
                           4040 ;src/main.c:752: inicializarEnemy();
   7B39 C3 E8 79      [10] 4041 	jp  _inicializarEnemy
   7B3C                    4042 00102$:
                           4043 ;src/main.c:755: menuFin(puntuacion);
   7B3C FD 21 D8 63   [14] 4044 	ld	iy,#_puntuacion
   7B40 FD 6E 00      [19] 4045 	ld	l,0 (iy)
   7B43 26 00         [ 7] 4046 	ld	h,#0x00
   7B45 C3 B0 4A      [10] 4047 	jp  _menuFin
                           4048 ;src/main.c:759: void moverIzquierda() {
                           4049 ;	---------------------------------
                           4050 ; Function moverIzquierda
                           4051 ; ---------------------------------
   7B48                    4052 _moverIzquierda::
                           4053 ;src/main.c:760: prota.mira = M_izquierda;
   7B48 01 F8 62      [10] 4054 	ld	bc,#_prota+0
   7B4B 21 FF 62      [10] 4055 	ld	hl,#(_prota + 0x0007)
   7B4E 36 01         [10] 4056 	ld	(hl),#0x01
                           4057 ;src/main.c:761: if (!checkCollision(M_izquierda)) {
   7B50 C5            [11] 4058 	push	bc
   7B51 3E 01         [ 7] 4059 	ld	a,#0x01
   7B53 F5            [11] 4060 	push	af
   7B54 33            [ 6] 4061 	inc	sp
   7B55 CD 40 65      [17] 4062 	call	_checkCollision
   7B58 33            [ 6] 4063 	inc	sp
   7B59 C1            [10] 4064 	pop	bc
   7B5A 7D            [ 4] 4065 	ld	a,l
   7B5B B7            [ 4] 4066 	or	a, a
   7B5C C0            [11] 4067 	ret	NZ
                           4068 ;src/main.c:762: prota.x--;
   7B5D 0A            [ 7] 4069 	ld	a,(bc)
   7B5E C6 FF         [ 7] 4070 	add	a,#0xFF
   7B60 02            [ 7] 4071 	ld	(bc),a
                           4072 ;src/main.c:763: prota.mover = SI;
   7B61 21 FE 62      [10] 4073 	ld	hl,#(_prota + 0x0006)
   7B64 36 01         [10] 4074 	ld	(hl),#0x01
                           4075 ;src/main.c:764: prota.sprite = g_hero_left;
   7B66 21 C6 3D      [10] 4076 	ld	hl,#_g_hero_left
   7B69 22 FC 62      [16] 4077 	ld	((_prota + 0x0004)), hl
   7B6C C9            [10] 4078 	ret
                           4079 ;src/main.c:768: void moverDerecha() {
                           4080 ;	---------------------------------
                           4081 ; Function moverDerecha
                           4082 ; ---------------------------------
   7B6D                    4083 _moverDerecha::
                           4084 ;src/main.c:769: prota.mira = M_derecha;
   7B6D 21 FF 62      [10] 4085 	ld	hl,#(_prota + 0x0007)
   7B70 36 00         [10] 4086 	ld	(hl),#0x00
                           4087 ;src/main.c:770: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7B72 AF            [ 4] 4088 	xor	a, a
   7B73 F5            [11] 4089 	push	af
   7B74 33            [ 6] 4090 	inc	sp
   7B75 CD 40 65      [17] 4091 	call	_checkCollision
   7B78 33            [ 6] 4092 	inc	sp
   7B79 45            [ 4] 4093 	ld	b,l
   7B7A 21 F8 62      [10] 4094 	ld	hl, #_prota + 0
   7B7D 4E            [ 7] 4095 	ld	c,(hl)
   7B7E 59            [ 4] 4096 	ld	e,c
   7B7F 16 00         [ 7] 4097 	ld	d,#0x00
   7B81 21 07 00      [10] 4098 	ld	hl,#0x0007
   7B84 19            [11] 4099 	add	hl,de
   7B85 11 50 80      [10] 4100 	ld	de, #0x8050
   7B88 29            [11] 4101 	add	hl, hl
   7B89 3F            [ 4] 4102 	ccf
   7B8A CB 1C         [ 8] 4103 	rr	h
   7B8C CB 1D         [ 8] 4104 	rr	l
   7B8E ED 52         [15] 4105 	sbc	hl, de
   7B90 3E 00         [ 7] 4106 	ld	a,#0x00
   7B92 17            [ 4] 4107 	rla
   7B93 5F            [ 4] 4108 	ld	e,a
   7B94 78            [ 4] 4109 	ld	a,b
   7B95 B7            [ 4] 4110 	or	a,a
   7B96 20 14         [12] 4111 	jr	NZ,00104$
   7B98 B3            [ 4] 4112 	or	a,e
   7B99 28 11         [12] 4113 	jr	Z,00104$
                           4114 ;src/main.c:771: prota.x++;
   7B9B 0C            [ 4] 4115 	inc	c
   7B9C 21 F8 62      [10] 4116 	ld	hl,#_prota
   7B9F 71            [ 7] 4117 	ld	(hl),c
                           4118 ;src/main.c:772: prota.mover = SI;
   7BA0 21 FE 62      [10] 4119 	ld	hl,#(_prota + 0x0006)
   7BA3 36 01         [10] 4120 	ld	(hl),#0x01
                           4121 ;src/main.c:773: prota.sprite = g_hero;
   7BA5 21 70 3E      [10] 4122 	ld	hl,#_g_hero
   7BA8 22 FC 62      [16] 4123 	ld	((_prota + 0x0004)), hl
   7BAB C9            [10] 4124 	ret
   7BAC                    4125 00104$:
                           4126 ;src/main.c:775: }else if( prota.x + G_HERO_W >= 80){
   7BAC 7B            [ 4] 4127 	ld	a,e
   7BAD B7            [ 4] 4128 	or	a, a
   7BAE C0            [11] 4129 	ret	NZ
                           4130 ;src/main.c:776: avanzarMapa();
   7BAF C3 01 7B      [10] 4131 	jp  _avanzarMapa
                           4132 ;src/main.c:780: void moverArriba() {
                           4133 ;	---------------------------------
                           4134 ; Function moverArriba
                           4135 ; ---------------------------------
   7BB2                    4136 _moverArriba::
                           4137 ;src/main.c:781: prota.mira = M_arriba;
   7BB2 21 FF 62      [10] 4138 	ld	hl,#(_prota + 0x0007)
   7BB5 36 02         [10] 4139 	ld	(hl),#0x02
                           4140 ;src/main.c:782: if (!checkCollision(M_arriba)) {
   7BB7 3E 02         [ 7] 4141 	ld	a,#0x02
   7BB9 F5            [11] 4142 	push	af
   7BBA 33            [ 6] 4143 	inc	sp
   7BBB CD 40 65      [17] 4144 	call	_checkCollision
   7BBE 33            [ 6] 4145 	inc	sp
   7BBF 7D            [ 4] 4146 	ld	a,l
   7BC0 B7            [ 4] 4147 	or	a, a
   7BC1 C0            [11] 4148 	ret	NZ
                           4149 ;src/main.c:783: prota.y--;
   7BC2 21 F9 62      [10] 4150 	ld	hl,#_prota + 1
   7BC5 4E            [ 7] 4151 	ld	c,(hl)
   7BC6 0D            [ 4] 4152 	dec	c
   7BC7 71            [ 7] 4153 	ld	(hl),c
                           4154 ;src/main.c:784: prota.y--;
   7BC8 0D            [ 4] 4155 	dec	c
   7BC9 71            [ 7] 4156 	ld	(hl),c
                           4157 ;src/main.c:785: prota.mover  = SI;
   7BCA 21 FE 62      [10] 4158 	ld	hl,#(_prota + 0x0006)
   7BCD 36 01         [10] 4159 	ld	(hl),#0x01
                           4160 ;src/main.c:786: prota.sprite = g_hero_up;
   7BCF 21 2C 3D      [10] 4161 	ld	hl,#_g_hero_up
   7BD2 22 FC 62      [16] 4162 	ld	((_prota + 0x0004)), hl
   7BD5 C9            [10] 4163 	ret
                           4164 ;src/main.c:790: void moverAbajo() {
                           4165 ;	---------------------------------
                           4166 ; Function moverAbajo
                           4167 ; ---------------------------------
   7BD6                    4168 _moverAbajo::
                           4169 ;src/main.c:791: prota.mira = M_abajo;
   7BD6 21 FF 62      [10] 4170 	ld	hl,#(_prota + 0x0007)
   7BD9 36 03         [10] 4171 	ld	(hl),#0x03
                           4172 ;src/main.c:792: if (!checkCollision(M_abajo) ) {
   7BDB 3E 03         [ 7] 4173 	ld	a,#0x03
   7BDD F5            [11] 4174 	push	af
   7BDE 33            [ 6] 4175 	inc	sp
   7BDF CD 40 65      [17] 4176 	call	_checkCollision
   7BE2 33            [ 6] 4177 	inc	sp
   7BE3 7D            [ 4] 4178 	ld	a,l
   7BE4 B7            [ 4] 4179 	or	a, a
   7BE5 C0            [11] 4180 	ret	NZ
                           4181 ;src/main.c:793: prota.y++;
   7BE6 01 F9 62      [10] 4182 	ld	bc,#_prota + 1
   7BE9 0A            [ 7] 4183 	ld	a,(bc)
   7BEA 3C            [ 4] 4184 	inc	a
   7BEB 02            [ 7] 4185 	ld	(bc),a
                           4186 ;src/main.c:794: prota.y++;
   7BEC 3C            [ 4] 4187 	inc	a
   7BED 02            [ 7] 4188 	ld	(bc),a
                           4189 ;src/main.c:795: prota.mover  = SI;
   7BEE 21 FE 62      [10] 4190 	ld	hl,#(_prota + 0x0006)
   7BF1 36 01         [10] 4191 	ld	(hl),#0x01
                           4192 ;src/main.c:796: prota.sprite = g_hero_down;
   7BF3 21 92 3C      [10] 4193 	ld	hl,#_g_hero_down
   7BF6 22 FC 62      [16] 4194 	ld	((_prota + 0x0004)), hl
   7BF9 C9            [10] 4195 	ret
                           4196 ;src/main.c:803: void intHandler() {
                           4197 ;	---------------------------------
                           4198 ; Function intHandler
                           4199 ; ---------------------------------
   7BFA                    4200 _intHandler::
                           4201 ;src/main.c:804: if (++i == 6) {
   7BFA 21 0B 63      [10] 4202 	ld	hl, #_i+0
   7BFD 34            [11] 4203 	inc	(hl)
   7BFE 3A 0B 63      [13] 4204 	ld	a,(#_i + 0)
   7C01 D6 06         [ 7] 4205 	sub	a, #0x06
   7C03 C0            [11] 4206 	ret	NZ
                           4207 ;src/main.c:805: play();
   7C04 CD 44 52      [17] 4208 	call	_play
                           4209 ;src/main.c:806: i=0;
   7C07 21 0B 63      [10] 4210 	ld	hl,#_i + 0
   7C0A 36 00         [10] 4211 	ld	(hl), #0x00
   7C0C C9            [10] 4212 	ret
                           4213 ;src/main.c:810: void inicializarCPC() {
                           4214 ;	---------------------------------
                           4215 ; Function inicializarCPC
                           4216 ; ---------------------------------
   7C0D                    4217 _inicializarCPC::
                           4218 ;src/main.c:811: cpct_disableFirmware();
   7C0D CD EB 55      [17] 4219 	call	_cpct_disableFirmware
                           4220 ;src/main.c:812: cpct_setVideoMode(0);
   7C10 2E 00         [ 7] 4221 	ld	l,#0x00
   7C12 CD BF 55      [17] 4222 	call	_cpct_setVideoMode
                           4223 ;src/main.c:813: cpct_setBorder(HW_BLACK);
   7C15 21 10 14      [10] 4224 	ld	hl,#0x1410
   7C18 E5            [11] 4225 	push	hl
   7C19 CD 22 53      [17] 4226 	call	_cpct_setPALColour
                           4227 ;src/main.c:814: cpct_setPalette(g_palette, 16);
   7C1C 21 10 00      [10] 4228 	ld	hl,#0x0010
   7C1F E5            [11] 4229 	push	hl
   7C20 21 60 3E      [10] 4230 	ld	hl,#_g_palette
   7C23 E5            [11] 4231 	push	hl
   7C24 CD FF 52      [17] 4232 	call	_cpct_setPalette
   7C27 C9            [10] 4233 	ret
                           4234 ;src/main.c:819: void inicializarJuego() {
                           4235 ;	---------------------------------
                           4236 ; Function inicializarJuego
                           4237 ; ---------------------------------
   7C28                    4238 _inicializarJuego::
                           4239 ;src/main.c:821: num_mapa = 0;
   7C28 21 D7 63      [10] 4240 	ld	hl,#_num_mapa + 0
   7C2B 36 00         [10] 4241 	ld	(hl), #0x00
                           4242 ;src/main.c:822: mapa = mapas[num_mapa];
   7C2D 21 F5 63      [10] 4243 	ld	hl, #_mapas + 0
   7C30 7E            [ 7] 4244 	ld	a,(hl)
   7C31 FD 21 D5 63   [14] 4245 	ld	iy,#_mapa
   7C35 FD 77 00      [19] 4246 	ld	0 (iy),a
   7C38 23            [ 6] 4247 	inc	hl
   7C39 7E            [ 7] 4248 	ld	a,(hl)
   7C3A 32 D6 63      [13] 4249 	ld	(#_mapa + 1),a
                           4250 ;src/main.c:823: cpct_etm_setTileset2x4(g_tileset);
   7C3D 21 E0 17      [10] 4251 	ld	hl,#_g_tileset
   7C40 CD 13 55      [17] 4252 	call	_cpct_etm_setTileset2x4
                           4253 ;src/main.c:825: dibujarMapa();
   7C43 CD DF 63      [17] 4254 	call	_dibujarMapa
                           4255 ;src/main.c:828: barraPuntuacionInicial();
   7C46 CD 50 50      [17] 4256 	call	_barraPuntuacionInicial
                           4257 ;src/main.c:831: prota.x = prota.px = 4;
   7C49 21 FA 62      [10] 4258 	ld	hl,#(_prota + 0x0002)
   7C4C 36 04         [10] 4259 	ld	(hl),#0x04
   7C4E 21 F8 62      [10] 4260 	ld	hl,#_prota
   7C51 36 04         [10] 4261 	ld	(hl),#0x04
                           4262 ;src/main.c:832: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7C53 21 FB 62      [10] 4263 	ld	hl,#(_prota + 0x0003)
   7C56 36 68         [10] 4264 	ld	(hl),#0x68
   7C58 21 F9 62      [10] 4265 	ld	hl,#(_prota + 0x0001)
   7C5B 36 68         [10] 4266 	ld	(hl),#0x68
                           4267 ;src/main.c:833: prota.mover  = NO;
   7C5D 21 FE 62      [10] 4268 	ld	hl,#(_prota + 0x0006)
   7C60 36 00         [10] 4269 	ld	(hl),#0x00
                           4270 ;src/main.c:834: prota.mira=M_derecha;
   7C62 21 FF 62      [10] 4271 	ld	hl,#(_prota + 0x0007)
   7C65 36 00         [10] 4272 	ld	(hl),#0x00
                           4273 ;src/main.c:835: prota.sprite = g_hero;
   7C67 21 70 3E      [10] 4274 	ld	hl,#_g_hero
   7C6A 22 FC 62      [16] 4275 	ld	((_prota + 0x0004)), hl
                           4276 ;src/main.c:839: cu.x = cu.px = 0;
   7C6D 21 02 63      [10] 4277 	ld	hl,#(_cu + 0x0002)
   7C70 36 00         [10] 4278 	ld	(hl),#0x00
   7C72 21 00 63      [10] 4279 	ld	hl,#_cu
   7C75 36 00         [10] 4280 	ld	(hl),#0x00
                           4281 ;src/main.c:840: cu.y = cu.py = 0;
   7C77 21 03 63      [10] 4282 	ld	hl,#(_cu + 0x0003)
   7C7A 36 00         [10] 4283 	ld	(hl),#0x00
   7C7C 21 01 63      [10] 4284 	ld	hl,#(_cu + 0x0001)
   7C7F 36 00         [10] 4285 	ld	(hl),#0x00
                           4286 ;src/main.c:841: cu.lanzado = NO;
   7C81 21 06 63      [10] 4287 	ld	hl,#(_cu + 0x0006)
   7C84 36 00         [10] 4288 	ld	(hl),#0x00
                           4289 ;src/main.c:842: cu.mover = NO;
   7C86 21 09 63      [10] 4290 	ld	hl,#(_cu + 0x0009)
   7C89 36 00         [10] 4291 	ld	(hl),#0x00
                           4292 ;src/main.c:843: cu.off_bound = NO;
   7C8B 21 0A 63      [10] 4293 	ld	hl,#(_cu + 0x000a)
   7C8E 36 00         [10] 4294 	ld	(hl),#0x00
                           4295 ;src/main.c:845: inicializarEnemy();
   7C90 CD E8 79      [17] 4296 	call	_inicializarEnemy
                           4297 ;src/main.c:847: dibujarProta();
   7C93 C3 2B 64      [10] 4298 	jp  _dibujarProta
                           4299 ;src/main.c:850: void main(void) {
                           4300 ;	---------------------------------
                           4301 ; Function main
                           4302 ; ---------------------------------
   7C96                    4303 _main::
   7C96 DD E5         [15] 4304 	push	ix
   7C98 DD 21 00 00   [14] 4305 	ld	ix,#0
   7C9C DD 39         [15] 4306 	add	ix,sp
   7C9E F5            [11] 4307 	push	af
   7C9F 3B            [ 6] 4308 	dec	sp
                           4309 ;src/main.c:855: inicializarCPC();
   7CA0 CD 0D 7C      [17] 4310 	call	_inicializarCPC
                           4311 ;src/main.c:857: menuInicio();
   7CA3 CD 71 4F      [17] 4312 	call	_menuInicio
                           4313 ;src/main.c:859: inicializarJuego();
   7CA6 CD 28 7C      [17] 4314 	call	_inicializarJuego
                           4315 ;src/main.c:863: while (1) {
   7CA9                    4316 00119$:
                           4317 ;src/main.c:866: actual = enemy;
                           4318 ;src/main.c:868: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7CA9 21 00 01      [10] 4319 	ld	hl,#_g_tablatrans
   7CAC E5            [11] 4320 	push	hl
   7CAD 2A D5 63      [16] 4321 	ld	hl,(_mapa)
   7CB0 E5            [11] 4322 	push	hl
   7CB1 21 F8 62      [10] 4323 	ld	hl,#_prota
   7CB4 E5            [11] 4324 	push	hl
   7CB5 21 00 63      [10] 4325 	ld	hl,#_cu
   7CB8 E5            [11] 4326 	push	hl
   7CB9 CD D9 64      [17] 4327 	call	_comprobarTeclado
   7CBC 21 08 00      [10] 4328 	ld	hl,#8
   7CBF 39            [11] 4329 	add	hl,sp
   7CC0 F9            [ 6] 4330 	ld	sp,hl
                           4331 ;src/main.c:869: moverCuchillo(&cu, mapa);
   7CC1 2A D5 63      [16] 4332 	ld	hl,(_mapa)
   7CC4 E5            [11] 4333 	push	hl
   7CC5 21 00 63      [10] 4334 	ld	hl,#_cu
   7CC8 E5            [11] 4335 	push	hl
   7CC9 CD 15 43      [17] 4336 	call	_moverCuchillo
   7CCC F1            [10] 4337 	pop	af
   7CCD F1            [10] 4338 	pop	af
                           4339 ;src/main.c:870: while(i){
   7CCE DD 36 FD 02   [19] 4340 	ld	-3 (ix),#0x02
   7CD2 DD 36 FE 70   [19] 4341 	ld	-2 (ix),#<(_enemy)
   7CD6 DD 36 FF 5F   [19] 4342 	ld	-1 (ix),#>(_enemy)
   7CDA                    4343 00101$:
   7CDA DD 7E FD      [19] 4344 	ld	a,-3 (ix)
   7CDD B7            [ 4] 4345 	or	a, a
   7CDE 28 20         [12] 4346 	jr	Z,00103$
                           4347 ;src/main.c:871: --i;
   7CE0 DD 35 FD      [23] 4348 	dec	-3 (ix)
                           4349 ;src/main.c:872: updateEnemy(actual);
   7CE3 DD 6E FE      [19] 4350 	ld	l,-2 (ix)
   7CE6 DD 66 FF      [19] 4351 	ld	h,-1 (ix)
   7CE9 E5            [11] 4352 	push	hl
   7CEA CD 8E 78      [17] 4353 	call	_updateEnemy
   7CED F1            [10] 4354 	pop	af
                           4355 ;src/main.c:873: ++actual;
   7CEE DD 7E FE      [19] 4356 	ld	a,-2 (ix)
   7CF1 C6 E2         [ 7] 4357 	add	a, #0xE2
   7CF3 DD 77 FE      [19] 4358 	ld	-2 (ix),a
   7CF6 DD 7E FF      [19] 4359 	ld	a,-1 (ix)
   7CF9 CE 00         [ 7] 4360 	adc	a, #0x00
   7CFB DD 77 FF      [19] 4361 	ld	-1 (ix),a
   7CFE 18 DA         [12] 4362 	jr	00101$
   7D00                    4363 00103$:
                           4364 ;src/main.c:876: cpct_waitVSYNC();
   7D00 CD B7 55      [17] 4365 	call	_cpct_waitVSYNC
                           4366 ;src/main.c:879: if (prota.mover) {
   7D03 01 FE 62      [10] 4367 	ld	bc,#_prota + 6
   7D06 0A            [ 7] 4368 	ld	a,(bc)
   7D07 B7            [ 4] 4369 	or	a, a
   7D08 28 07         [12] 4370 	jr	Z,00105$
                           4371 ;src/main.c:880: redibujarProta();
   7D0A C5            [11] 4372 	push	bc
   7D0B CD C5 64      [17] 4373 	call	_redibujarProta
   7D0E C1            [10] 4374 	pop	bc
                           4375 ;src/main.c:881: prota.mover = NO;
   7D0F AF            [ 4] 4376 	xor	a, a
   7D10 02            [ 7] 4377 	ld	(bc),a
   7D11                    4378 00105$:
                           4379 ;src/main.c:883: if(cu.lanzado && cu.mover){
   7D11 21 06 63      [10] 4380 	ld	hl, #(_cu + 0x0006) + 0
   7D14 4E            [ 7] 4381 	ld	c,(hl)
                           4382 ;src/main.c:884: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4383 ;src/main.c:883: if(cu.lanzado && cu.mover){
   7D15 79            [ 4] 4384 	ld	a,c
   7D16 B7            [ 4] 4385 	or	a, a
   7D17 28 30         [12] 4386 	jr	Z,00110$
   7D19 3A 09 63      [13] 4387 	ld	a, (#(_cu + 0x0009) + 0)
   7D1C B7            [ 4] 4388 	or	a, a
   7D1D 28 2A         [12] 4389 	jr	Z,00110$
                           4390 ;src/main.c:884: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7D1F 21 01 63      [10] 4391 	ld	hl, #(_cu + 0x0001) + 0
   7D22 4E            [ 7] 4392 	ld	c,(hl)
   7D23 21 00 63      [10] 4393 	ld	hl, #_cu + 0
   7D26 46            [ 7] 4394 	ld	b,(hl)
   7D27 21 08 63      [10] 4395 	ld	hl, #(_cu + 0x0008) + 0
   7D2A 5E            [ 7] 4396 	ld	e,(hl)
   7D2B 2A D5 63      [16] 4397 	ld	hl,(_mapa)
   7D2E E5            [11] 4398 	push	hl
   7D2F 21 00 01      [10] 4399 	ld	hl,#_g_tablatrans
   7D32 E5            [11] 4400 	push	hl
   7D33 21 00 63      [10] 4401 	ld	hl,#_cu
   7D36 E5            [11] 4402 	push	hl
   7D37 79            [ 4] 4403 	ld	a,c
   7D38 F5            [11] 4404 	push	af
   7D39 33            [ 6] 4405 	inc	sp
   7D3A C5            [11] 4406 	push	bc
   7D3B 33            [ 6] 4407 	inc	sp
   7D3C 7B            [ 4] 4408 	ld	a,e
   7D3D F5            [11] 4409 	push	af
   7D3E 33            [ 6] 4410 	inc	sp
   7D3F CD 25 40      [17] 4411 	call	_redibujarCuchillo
   7D42 21 09 00      [10] 4412 	ld	hl,#9
   7D45 39            [11] 4413 	add	hl,sp
   7D46 F9            [ 6] 4414 	ld	sp,hl
   7D47 18 28         [12] 4415 	jr	00111$
   7D49                    4416 00110$:
                           4417 ;src/main.c:885: }else if (cu.lanzado && !cu.mover){
   7D49 79            [ 4] 4418 	ld	a,c
   7D4A B7            [ 4] 4419 	or	a, a
   7D4B 28 24         [12] 4420 	jr	Z,00111$
   7D4D 3A 09 63      [13] 4421 	ld	a, (#(_cu + 0x0009) + 0)
   7D50 B7            [ 4] 4422 	or	a, a
   7D51 20 1E         [12] 4423 	jr	NZ,00111$
                           4424 ;src/main.c:886: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7D53 21 01 63      [10] 4425 	ld	hl, #(_cu + 0x0001) + 0
   7D56 46            [ 7] 4426 	ld	b,(hl)
   7D57 21 00 63      [10] 4427 	ld	hl, #_cu + 0
   7D5A 4E            [ 7] 4428 	ld	c,(hl)
   7D5B 21 08 63      [10] 4429 	ld	hl, #(_cu + 0x0008) + 0
   7D5E 56            [ 7] 4430 	ld	d,(hl)
   7D5F 2A D5 63      [16] 4431 	ld	hl,(_mapa)
   7D62 E5            [11] 4432 	push	hl
   7D63 C5            [11] 4433 	push	bc
   7D64 D5            [11] 4434 	push	de
   7D65 33            [ 6] 4435 	inc	sp
   7D66 CD 92 3F      [17] 4436 	call	_borrarCuchillo
   7D69 F1            [10] 4437 	pop	af
   7D6A F1            [10] 4438 	pop	af
   7D6B 33            [ 6] 4439 	inc	sp
                           4440 ;src/main.c:887: cu.lanzado = NO;
   7D6C 21 06 63      [10] 4441 	ld	hl,#(_cu + 0x0006)
   7D6F 36 00         [10] 4442 	ld	(hl),#0x00
   7D71                    4443 00111$:
                           4444 ;src/main.c:891: actual = enemy;
   7D71 01 70 5F      [10] 4445 	ld	bc,#_enemy
                           4446 ;src/main.c:892: while(i){
   7D74 DD 36 FD 02   [19] 4447 	ld	-3 (ix),#0x02
   7D78                    4448 00115$:
   7D78 DD 7E FD      [19] 4449 	ld	a,-3 (ix)
   7D7B B7            [ 4] 4450 	or	a, a
   7D7C 28 2C         [12] 4451 	jr	Z,00117$
                           4452 ;src/main.c:894: --i;
   7D7E DD 35 FD      [23] 4453 	dec	-3 (ix)
                           4454 ;src/main.c:895: if(actual->mover){
   7D81 C5            [11] 4455 	push	bc
   7D82 FD E1         [14] 4456 	pop	iy
   7D84 FD 7E 06      [19] 4457 	ld	a,6 (iy)
   7D87 B7            [ 4] 4458 	or	a, a
   7D88 28 18         [12] 4459 	jr	Z,00114$
                           4460 ;src/main.c:896: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7D8A 69            [ 4] 4461 	ld	l, c
   7D8B 60            [ 4] 4462 	ld	h, b
   7D8C 23            [ 6] 4463 	inc	hl
   7D8D 23            [ 6] 4464 	inc	hl
   7D8E 23            [ 6] 4465 	inc	hl
   7D8F 5E            [ 7] 4466 	ld	e,(hl)
   7D90 69            [ 4] 4467 	ld	l, c
   7D91 60            [ 4] 4468 	ld	h, b
   7D92 23            [ 6] 4469 	inc	hl
   7D93 23            [ 6] 4470 	inc	hl
   7D94 56            [ 7] 4471 	ld	d,(hl)
   7D95 C5            [11] 4472 	push	bc
   7D96 C5            [11] 4473 	push	bc
   7D97 7B            [ 4] 4474 	ld	a,e
   7D98 F5            [11] 4475 	push	af
   7D99 33            [ 6] 4476 	inc	sp
   7D9A D5            [11] 4477 	push	de
   7D9B 33            [ 6] 4478 	inc	sp
   7D9C CD 0F 68      [17] 4479 	call	_redibujarEnemigo
   7D9F F1            [10] 4480 	pop	af
   7DA0 F1            [10] 4481 	pop	af
   7DA1 C1            [10] 4482 	pop	bc
   7DA2                    4483 00114$:
                           4484 ;src/main.c:909: ++actual;
   7DA2 21 E2 00      [10] 4485 	ld	hl,#0x00E2
   7DA5 09            [11] 4486 	add	hl,bc
   7DA6 4D            [ 4] 4487 	ld	c,l
   7DA7 44            [ 4] 4488 	ld	b,h
   7DA8 18 CE         [12] 4489 	jr	00115$
   7DAA                    4490 00117$:
                           4491 ;src/main.c:911: cpct_waitVSYNC();
   7DAA CD B7 55      [17] 4492 	call	_cpct_waitVSYNC
   7DAD C3 A9 7C      [10] 4493 	jp	00119$
                           4494 	.area _CODE
                           4495 	.area _INITIALIZER
   63DA                    4496 __xinit__mapa:
   63DA 00 00              4497 	.dw #0x0000
   63DC                    4498 __xinit__num_mapa:
   63DC 00                 4499 	.db #0x00	; 0
   63DD                    4500 __xinit__puntuacion:
   63DD 00                 4501 	.db #0x00	; 0
   63DE                    4502 __xinit__vidas:
   63DE 05                 4503 	.db #0x05	; 5
                           4504 	.area _CABS (ABS)
