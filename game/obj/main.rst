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
                             12 	.globl _avanzarMapa
                             13 	.globl _menuFin
                             14 	.globl _inicializarJuego
                             15 	.globl _inicializarCPC
                             16 	.globl _intHandler
                             17 	.globl _moverAbajo
                             18 	.globl _moverArriba
                             19 	.globl _moverDerecha
                             20 	.globl _moverIzquierda
                             21 	.globl _inicializarEnemy
                             22 	.globl _updateEnemy
                             23 	.globl _engage
                             24 	.globl _moverEnemigoSeek
                             25 	.globl _lookFor
                             26 	.globl _moverEnemigoPatrol
                             27 	.globl _moverEnemigoIzquierda
                             28 	.globl _moverEnemigoDerecha
                             29 	.globl _moverEnemigoAbajo
                             30 	.globl _moverEnemigoArriba
                             31 	.globl _checkEnemyDead
                             32 	.globl _redibujarEnemigo
                             33 	.globl _borrarEnemigo
                             34 	.globl _borrarExplosion
                             35 	.globl _dibujarExplosion
                             36 	.globl _dibujarEnemigo
                             37 	.globl _checkCollision
                             38 	.globl _comprobarTeclado
                             39 	.globl _redibujarProta
                             40 	.globl _borrarProta
                             41 	.globl _dibujarProta
                             42 	.globl _dibujarMapa
                             43 	.globl _play
                             44 	.globl _pathFinding
                             45 	.globl _moverCuchillo
                             46 	.globl _lanzarCuchillo
                             47 	.globl _redibujarCuchillo
                             48 	.globl _borrarCuchillo
                             49 	.globl _abs
                             50 	.globl _getTilePtr
                             51 	.globl _aumentarPuntuacion
                             52 	.globl _modificarVidas
                             53 	.globl _modificarPuntuacion
                             54 	.globl _barraPuntuacionInicial
                             55 	.globl _menuInicio
                             56 	.globl _cpct_etm_setTileset2x4
                             57 	.globl _cpct_etm_drawTileBox2x4
                             58 	.globl _cpct_getScreenPtr
                             59 	.globl _cpct_setPALColour
                             60 	.globl _cpct_setPalette
                             61 	.globl _cpct_waitVSYNC
                             62 	.globl _cpct_setVideoMode
                             63 	.globl _cpct_drawStringM0
                             64 	.globl _cpct_drawCharM0
                             65 	.globl _cpct_drawSpriteMaskedAlignedTable
                             66 	.globl _cpct_isAnyKeyPressed
                             67 	.globl _cpct_isKeyPressed
                             68 	.globl _cpct_scanKeyboard_if
                             69 	.globl _cpct_scanKeyboard_f
                             70 	.globl _cpct_memset
                             71 	.globl _cpct_disableFirmware
                             72 	.globl _i
                             73 	.globl _vidas
                             74 	.globl _puntuacion
                             75 	.globl _endGame
                             76 	.globl _num_mapa
                             77 	.globl _mapa
                             78 	.globl _timer
                             79 	.globl _cambio
                             80 	.globl _parpadeo
                             81 	.globl _cu
                             82 	.globl _prota
                             83 	.globl _enemy
                             84 	.globl _patrolY
                             85 	.globl _patrolX
                             86 	.globl _spawnY
                             87 	.globl _spawnX
                             88 	.globl _mapas
                             89 ;--------------------------------------------------------
                             90 ; special function registers
                             91 ;--------------------------------------------------------
                             92 ;--------------------------------------------------------
                             93 ; ram data
                             94 ;--------------------------------------------------------
                             95 	.area _DATA
   5F56                      96 _enemy::
   5F56                      97 	.ds 908
   62E2                      98 _prota::
   62E2                      99 	.ds 8
   62EA                     100 _cu::
   62EA                     101 	.ds 11
   62F5                     102 _parpadeo::
   62F5                     103 	.ds 1
   62F6                     104 _cambio::
   62F6                     105 	.ds 1
   62F7                     106 _timer::
   62F7                     107 	.ds 2
   62F9                     108 _mapa::
   62F9                     109 	.ds 2
   62FB                     110 _num_mapa::
   62FB                     111 	.ds 1
   62FC                     112 _endGame::
   62FC                     113 	.ds 1
   62FD                     114 _puntuacion::
   62FD                     115 	.ds 1
   62FE                     116 _vidas::
   62FE                     117 	.ds 1
   62FF                     118 _i::
   62FF                     119 	.ds 1
                            120 ;--------------------------------------------------------
                            121 ; ram data
                            122 ;--------------------------------------------------------
                            123 	.area _INITIALIZED
                            124 ;--------------------------------------------------------
                            125 ; absolute external ram data
                            126 ;--------------------------------------------------------
                            127 	.area _DABS (ABS)
                            128 ;--------------------------------------------------------
                            129 ; global & static initialisations
                            130 ;--------------------------------------------------------
                            131 	.area _HOME
                            132 	.area _GSINIT
                            133 	.area _GSFINAL
                            134 	.area _GSINIT
                            135 ;--------------------------------------------------------
                            136 ; Home
                            137 ;--------------------------------------------------------
                            138 	.area _HOME
                            139 	.area _HOME
                            140 ;--------------------------------------------------------
                            141 ; code
                            142 ;--------------------------------------------------------
                            143 	.area _CODE
                            144 ;src/main.c:112: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            145 ;	---------------------------------
                            146 ; Function dummy_cpct_transparentMaskTable0M0_container
                            147 ; ---------------------------------
   444C                     148 _dummy_cpct_transparentMaskTable0M0_container::
                            149 	.area _g_tablatrans_ (ABS) 
   0100                     150 	.org 0x0100 
   0100                     151 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   152 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   154 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   157 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   160 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   162 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   168 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   169 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   172 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   173 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   174 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   175 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   176 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   177 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   178 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   179 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   180 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   181 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   182 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   183 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            184 	.area _CSEG (REL, CON) 
                            185 ;src/main.c:115: void dibujarMapa() {
                            186 ;	---------------------------------
                            187 ; Function dibujarMapa
                            188 ; ---------------------------------
   63C9                     189 _dibujarMapa::
                            190 ;src/main.c:118: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   63C9 2A F9 62      [16]  191 	ld	hl,(_mapa)
   63CC E5            [11]  192 	push	hl
   63CD 21 F0 C0      [10]  193 	ld	hl,#0xC0F0
   63D0 E5            [11]  194 	push	hl
   63D1 21 2C 28      [10]  195 	ld	hl,#0x282C
   63D4 E5            [11]  196 	push	hl
   63D5 2E 00         [ 7]  197 	ld	l, #0x00
   63D7 E5            [11]  198 	push	hl
   63D8 AF            [ 4]  199 	xor	a, a
   63D9 F5            [11]  200 	push	af
   63DA 33            [ 6]  201 	inc	sp
   63DB CD DD 53      [17]  202 	call	_cpct_etm_drawTileBox2x4
   63DE C9            [10]  203 	ret
   63DF                     204 _mapas:
   63DF C0 10               205 	.dw _g_map1
   63E1 E0 09               206 	.dw _g_map2
   63E3 00 03               207 	.dw _g_map3
   63E5                     208 _spawnX:
   63E5 24                  209 	.db #0x24	; 36
   63E6 47                  210 	.db #0x47	; 71	'G'
   63E7 30                  211 	.db #0x30	; 48	'0'
   63E8 18                  212 	.db #0x18	; 24
   63E9                     213 _spawnY:
   63E9 2C                  214 	.db #0x2C	; 44
   63EA 66                  215 	.db #0x66	; 102	'f'
   63EB 9A                  216 	.db #0x9A	; 154
   63EC 40                  217 	.db #0x40	; 64
   63ED                     218 _patrolX:
   63ED 00                  219 	.db #0x00	; 0
   63EE 00                  220 	.db #0x00	; 0
   63EF 00                  221 	.db #0x00	; 0
   63F0 00                  222 	.db #0x00	; 0
   63F1 00                  223 	.db #0x00	; 0
   63F2 42                  224 	.db #0x42	; 66	'B'
   63F3 33                  225 	.db #0x33	; 51	'3'
   63F4 00                  226 	.db #0x00	; 0
   63F5 00                  227 	.db #0x00	; 0
   63F6 00                  228 	.db 0x00
   63F7 10                  229 	.db #0x10	; 16
   63F8 33                  230 	.db #0x33	; 51	'3'
   63F9 19                  231 	.db #0x19	; 25
   63FA 00                  232 	.db #0x00	; 0
   63FB 00                  233 	.db 0x00
   63FC 24                  234 	.db #0x24	; 36
   63FD 3C                  235 	.db #0x3C	; 60
   63FE 30                  236 	.db #0x30	; 48	'0'
   63FF 18                  237 	.db #0x18	; 24
   6400 00                  238 	.db 0x00
   6401                     239 _patrolY:
   6401 00                  240 	.db #0x00	; 0
   6402 00                  241 	.db #0x00	; 0
   6403 00                  242 	.db #0x00	; 0
   6404 00                  243 	.db #0x00	; 0
   6405 00                  244 	.db 0x00
   6406 5E                  245 	.db #0x5E	; 94
   6407 A6                  246 	.db #0xA6	; 166
   6408 00                  247 	.db #0x00	; 0
   6409 00                  248 	.db #0x00	; 0
   640A 00                  249 	.db 0x00
   640B 2C                  250 	.db #0x2C	; 44
   640C 66                  251 	.db #0x66	; 102	'f'
   640D 9A                  252 	.db #0x9A	; 154
   640E 00                  253 	.db #0x00	; 0
   640F 00                  254 	.db 0x00
   6410 90                  255 	.db #0x90	; 144
   6411 66                  256 	.db #0x66	; 102	'f'
   6412 2C                  257 	.db #0x2C	; 44
   6413 86                  258 	.db #0x86	; 134
   6414 00                  259 	.db 0x00
                            260 ;src/main.c:121: void dibujarProta() {
                            261 ;	---------------------------------
                            262 ; Function dibujarProta
                            263 ; ---------------------------------
   6415                     264 _dibujarProta::
                            265 ;src/main.c:122: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6415 21 E3 62      [10]  266 	ld	hl, #_prota + 1
   6418 56            [ 7]  267 	ld	d,(hl)
   6419 21 E2 62      [10]  268 	ld	hl, #_prota + 0
   641C 46            [ 7]  269 	ld	b,(hl)
   641D D5            [11]  270 	push	de
   641E 33            [ 6]  271 	inc	sp
   641F C5            [11]  272 	push	bc
   6420 33            [ 6]  273 	inc	sp
   6421 21 00 C0      [10]  274 	ld	hl,#0xC000
   6424 E5            [11]  275 	push	hl
   6425 CD FB 5E      [17]  276 	call	_cpct_getScreenPtr
   6428 EB            [ 4]  277 	ex	de,hl
                            278 ;src/main.c:123: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6429 ED 4B E6 62   [20]  279 	ld	bc, (#_prota + 4)
   642D 21 00 01      [10]  280 	ld	hl,#_g_tablatrans
   6430 E5            [11]  281 	push	hl
   6431 21 07 16      [10]  282 	ld	hl,#0x1607
   6434 E5            [11]  283 	push	hl
   6435 D5            [11]  284 	push	de
   6436 C5            [11]  285 	push	bc
   6437 CD 1B 5F      [17]  286 	call	_cpct_drawSpriteMaskedAlignedTable
   643A C9            [10]  287 	ret
                            288 ;src/main.c:126: void borrarProta() {
                            289 ;	---------------------------------
                            290 ; Function borrarProta
                            291 ; ---------------------------------
   643B                     292 _borrarProta::
   643B DD E5         [15]  293 	push	ix
   643D DD 21 00 00   [14]  294 	ld	ix,#0
   6441 DD 39         [15]  295 	add	ix,sp
   6443 F5            [11]  296 	push	af
   6444 3B            [ 6]  297 	dec	sp
                            298 ;src/main.c:130: u8 w = 4 + (prota.px & 1);
   6445 21 E4 62      [10]  299 	ld	hl, #_prota + 2
   6448 4E            [ 7]  300 	ld	c,(hl)
   6449 79            [ 4]  301 	ld	a,c
   644A E6 01         [ 7]  302 	and	a, #0x01
   644C 47            [ 4]  303 	ld	b,a
   644D 04            [ 4]  304 	inc	b
   644E 04            [ 4]  305 	inc	b
   644F 04            [ 4]  306 	inc	b
   6450 04            [ 4]  307 	inc	b
                            308 ;src/main.c:133: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6451 21 E5 62      [10]  309 	ld	hl, #_prota + 3
   6454 5E            [ 7]  310 	ld	e,(hl)
   6455 CB 4B         [ 8]  311 	bit	1, e
   6457 28 04         [12]  312 	jr	Z,00103$
   6459 3E 01         [ 7]  313 	ld	a,#0x01
   645B 18 02         [12]  314 	jr	00104$
   645D                     315 00103$:
   645D 3E 00         [ 7]  316 	ld	a,#0x00
   645F                     317 00104$:
   645F C6 06         [ 7]  318 	add	a, #0x06
   6461 DD 77 FD      [19]  319 	ld	-3 (ix),a
                            320 ;src/main.c:135: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6464 FD 2A F9 62   [20]  321 	ld	iy,(_mapa)
   6468 16 00         [ 7]  322 	ld	d,#0x00
   646A 7B            [ 4]  323 	ld	a,e
   646B C6 E8         [ 7]  324 	add	a,#0xE8
   646D DD 77 FE      [19]  325 	ld	-2 (ix),a
   6470 7A            [ 4]  326 	ld	a,d
   6471 CE FF         [ 7]  327 	adc	a,#0xFF
   6473 DD 77 FF      [19]  328 	ld	-1 (ix),a
   6476 DD 6E FE      [19]  329 	ld	l,-2 (ix)
   6479 DD 66 FF      [19]  330 	ld	h,-1 (ix)
   647C DD CB FF 7E   [20]  331 	bit	7, -1 (ix)
   6480 28 04         [12]  332 	jr	Z,00105$
   6482 21 EB FF      [10]  333 	ld	hl,#0xFFEB
   6485 19            [11]  334 	add	hl,de
   6486                     335 00105$:
   6486 CB 2C         [ 8]  336 	sra	h
   6488 CB 1D         [ 8]  337 	rr	l
   648A CB 2C         [ 8]  338 	sra	h
   648C CB 1D         [ 8]  339 	rr	l
   648E 55            [ 4]  340 	ld	d,l
   648F CB 39         [ 8]  341 	srl	c
   6491 FD E5         [15]  342 	push	iy
   6493 21 F0 C0      [10]  343 	ld	hl,#0xC0F0
   6496 E5            [11]  344 	push	hl
   6497 3E 28         [ 7]  345 	ld	a,#0x28
   6499 F5            [11]  346 	push	af
   649A 33            [ 6]  347 	inc	sp
   649B DD 7E FD      [19]  348 	ld	a,-3 (ix)
   649E F5            [11]  349 	push	af
   649F 33            [ 6]  350 	inc	sp
   64A0 C5            [11]  351 	push	bc
   64A1 33            [ 6]  352 	inc	sp
   64A2 D5            [11]  353 	push	de
   64A3 33            [ 6]  354 	inc	sp
   64A4 79            [ 4]  355 	ld	a,c
   64A5 F5            [11]  356 	push	af
   64A6 33            [ 6]  357 	inc	sp
   64A7 CD DD 53      [17]  358 	call	_cpct_etm_drawTileBox2x4
   64AA DD F9         [10]  359 	ld	sp, ix
   64AC DD E1         [14]  360 	pop	ix
   64AE C9            [10]  361 	ret
                            362 ;src/main.c:138: void redibujarProta() {
                            363 ;	---------------------------------
                            364 ; Function redibujarProta
                            365 ; ---------------------------------
   64AF                     366 _redibujarProta::
                            367 ;src/main.c:139: borrarProta();
   64AF CD 3B 64      [17]  368 	call	_borrarProta
                            369 ;src/main.c:140: prota.px = prota.x;
   64B2 01 E4 62      [10]  370 	ld	bc,#_prota + 2
   64B5 3A E2 62      [13]  371 	ld	a, (#_prota + 0)
   64B8 02            [ 7]  372 	ld	(bc),a
                            373 ;src/main.c:141: prota.py = prota.y;
   64B9 01 E5 62      [10]  374 	ld	bc,#_prota + 3
   64BC 3A E3 62      [13]  375 	ld	a, (#_prota + 1)
   64BF 02            [ 7]  376 	ld	(bc),a
                            377 ;src/main.c:142: dibujarProta();
   64C0 C3 15 64      [10]  378 	jp  _dibujarProta
                            379 ;src/main.c:145: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            380 ;	---------------------------------
                            381 ; Function comprobarTeclado
                            382 ; ---------------------------------
   64C3                     383 _comprobarTeclado::
                            384 ;src/main.c:146: cpct_scanKeyboard_if();
   64C3 CD 4C 55      [17]  385 	call	_cpct_scanKeyboard_if
                            386 ;src/main.c:148: if (cpct_isAnyKeyPressed()) {
   64C6 CD 3F 55      [17]  387 	call	_cpct_isAnyKeyPressed
   64C9 7D            [ 4]  388 	ld	a,l
   64CA B7            [ 4]  389 	or	a, a
   64CB C8            [11]  390 	ret	Z
                            391 ;src/main.c:149: if (cpct_isKeyPressed(Key_CursorLeft)){
   64CC 21 01 01      [10]  392 	ld	hl,#0x0101
   64CF CD 92 52      [17]  393 	call	_cpct_isKeyPressed
   64D2 7D            [ 4]  394 	ld	a,l
   64D3 B7            [ 4]  395 	or	a, a
                            396 ;src/main.c:150: moverIzquierda();
   64D4 C2 70 79      [10]  397 	jp	NZ,_moverIzquierda
                            398 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64D7 21 00 02      [10]  399 	ld	hl,#0x0200
   64DA CD 92 52      [17]  400 	call	_cpct_isKeyPressed
   64DD 7D            [ 4]  401 	ld	a,l
   64DE B7            [ 4]  402 	or	a, a
                            403 ;src/main.c:152: moverDerecha();
   64DF C2 95 79      [10]  404 	jp	NZ,_moverDerecha
                            405 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64E2 21 00 01      [10]  406 	ld	hl,#0x0100
   64E5 CD 92 52      [17]  407 	call	_cpct_isKeyPressed
   64E8 7D            [ 4]  408 	ld	a,l
   64E9 B7            [ 4]  409 	or	a, a
                            410 ;src/main.c:154: moverArriba();
   64EA C2 DA 79      [10]  411 	jp	NZ,_moverArriba
                            412 ;src/main.c:155: }else if (cpct_isKeyPressed(Key_CursorDown)){
   64ED 21 00 04      [10]  413 	ld	hl,#0x0400
   64F0 CD 92 52      [17]  414 	call	_cpct_isKeyPressed
   64F3 7D            [ 4]  415 	ld	a,l
   64F4 B7            [ 4]  416 	or	a, a
                            417 ;src/main.c:156: moverAbajo();
   64F5 C2 FE 79      [10]  418 	jp	NZ,_moverAbajo
                            419 ;src/main.c:157: }else if (cpct_isKeyPressed(Key_Space)){
   64F8 21 05 80      [10]  420 	ld	hl,#0x8005
   64FB CD 92 52      [17]  421 	call	_cpct_isKeyPressed
   64FE 7D            [ 4]  422 	ld	a,l
   64FF B7            [ 4]  423 	or	a, a
   6500 C8            [11]  424 	ret	Z
                            425 ;src/main.c:158: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6501 21 08 00      [10]  426 	ld	hl, #8
   6504 39            [11]  427 	add	hl, sp
   6505 4E            [ 7]  428 	ld	c, (hl)
   6506 23            [ 6]  429 	inc	hl
   6507 46            [ 7]  430 	ld	b, (hl)
   6508 C5            [11]  431 	push	bc
   6509 21 08 00      [10]  432 	ld	hl, #8
   650C 39            [11]  433 	add	hl, sp
   650D 4E            [ 7]  434 	ld	c, (hl)
   650E 23            [ 6]  435 	inc	hl
   650F 46            [ 7]  436 	ld	b, (hl)
   6510 C5            [11]  437 	push	bc
   6511 21 08 00      [10]  438 	ld	hl, #8
   6514 39            [11]  439 	add	hl, sp
   6515 4E            [ 7]  440 	ld	c, (hl)
   6516 23            [ 6]  441 	inc	hl
   6517 46            [ 7]  442 	ld	b, (hl)
   6518 C5            [11]  443 	push	bc
   6519 21 08 00      [10]  444 	ld	hl, #8
   651C 39            [11]  445 	add	hl, sp
   651D 4E            [ 7]  446 	ld	c, (hl)
   651E 23            [ 6]  447 	inc	hl
   651F 46            [ 7]  448 	ld	b, (hl)
   6520 C5            [11]  449 	push	bc
   6521 CD 6C 40      [17]  450 	call	_lanzarCuchillo
   6524 21 08 00      [10]  451 	ld	hl,#8
   6527 39            [11]  452 	add	hl,sp
   6528 F9            [ 6]  453 	ld	sp,hl
   6529 C9            [10]  454 	ret
                            455 ;src/main.c:163: u8 checkCollision(u8 direction) { // check optimization
                            456 ;	---------------------------------
                            457 ; Function checkCollision
                            458 ; ---------------------------------
   652A                     459 _checkCollision::
   652A DD E5         [15]  460 	push	ix
   652C DD 21 00 00   [14]  461 	ld	ix,#0
   6530 DD 39         [15]  462 	add	ix,sp
   6532 F5            [11]  463 	push	af
                            464 ;src/main.c:164: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6533 21 00 00      [10]  465 	ld	hl,#0x0000
   6536 E3            [19]  466 	ex	(sp), hl
   6537 11 00 00      [10]  467 	ld	de,#0x0000
   653A 01 00 00      [10]  468 	ld	bc,#0x0000
                            469 ;src/main.c:166: switch (direction) {
   653D 3E 03         [ 7]  470 	ld	a,#0x03
   653F DD 96 04      [19]  471 	sub	a, 4 (ix)
   6542 DA 7A 66      [10]  472 	jp	C,00105$
   6545 DD 5E 04      [19]  473 	ld	e,4 (ix)
   6548 16 00         [ 7]  474 	ld	d,#0x00
   654A 21 51 65      [10]  475 	ld	hl,#00124$
   654D 19            [11]  476 	add	hl,de
   654E 19            [11]  477 	add	hl,de
   654F 19            [11]  478 	add	hl,de
   6550 E9            [ 4]  479 	jp	(hl)
   6551                     480 00124$:
   6551 C3 5D 65      [10]  481 	jp	00101$
   6554 C3 B2 65      [10]  482 	jp	00102$
   6557 C3 02 66      [10]  483 	jp	00103$
   655A C3 3F 66      [10]  484 	jp	00104$
                            485 ;src/main.c:167: case 0:
   655D                     486 00101$:
                            487 ;src/main.c:168: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   655D 21 E3 62      [10]  488 	ld	hl, #(_prota + 0x0001) + 0
   6560 4E            [ 7]  489 	ld	c,(hl)
   6561 3A E2 62      [13]  490 	ld	a, (#_prota + 0)
   6564 C6 07         [ 7]  491 	add	a, #0x07
   6566 47            [ 4]  492 	ld	b,a
   6567 79            [ 4]  493 	ld	a,c
   6568 F5            [11]  494 	push	af
   6569 33            [ 6]  495 	inc	sp
   656A C5            [11]  496 	push	bc
   656B 33            [ 6]  497 	inc	sp
   656C 2A F9 62      [16]  498 	ld	hl,(_mapa)
   656F E5            [11]  499 	push	hl
   6570 CD 61 4B      [17]  500 	call	_getTilePtr
   6573 F1            [10]  501 	pop	af
   6574 F1            [10]  502 	pop	af
   6575 33            [ 6]  503 	inc	sp
   6576 33            [ 6]  504 	inc	sp
   6577 E5            [11]  505 	push	hl
                            506 ;src/main.c:169: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   6578 3A E3 62      [13]  507 	ld	a, (#(_prota + 0x0001) + 0)
   657B C6 14         [ 7]  508 	add	a, #0x14
   657D 4F            [ 4]  509 	ld	c,a
   657E 3A E2 62      [13]  510 	ld	a, (#_prota + 0)
   6581 C6 07         [ 7]  511 	add	a, #0x07
   6583 47            [ 4]  512 	ld	b,a
   6584 79            [ 4]  513 	ld	a,c
   6585 F5            [11]  514 	push	af
   6586 33            [ 6]  515 	inc	sp
   6587 C5            [11]  516 	push	bc
   6588 33            [ 6]  517 	inc	sp
   6589 2A F9 62      [16]  518 	ld	hl,(_mapa)
   658C E5            [11]  519 	push	hl
   658D CD 61 4B      [17]  520 	call	_getTilePtr
   6590 F1            [10]  521 	pop	af
   6591 F1            [10]  522 	pop	af
   6592 EB            [ 4]  523 	ex	de,hl
                            524 ;src/main.c:170: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6593 3A E3 62      [13]  525 	ld	a, (#(_prota + 0x0001) + 0)
   6596 C6 0B         [ 7]  526 	add	a, #0x0B
   6598 47            [ 4]  527 	ld	b,a
   6599 3A E2 62      [13]  528 	ld	a, (#_prota + 0)
   659C C6 07         [ 7]  529 	add	a, #0x07
   659E D5            [11]  530 	push	de
   659F C5            [11]  531 	push	bc
   65A0 33            [ 6]  532 	inc	sp
   65A1 F5            [11]  533 	push	af
   65A2 33            [ 6]  534 	inc	sp
   65A3 2A F9 62      [16]  535 	ld	hl,(_mapa)
   65A6 E5            [11]  536 	push	hl
   65A7 CD 61 4B      [17]  537 	call	_getTilePtr
   65AA F1            [10]  538 	pop	af
   65AB F1            [10]  539 	pop	af
   65AC 4D            [ 4]  540 	ld	c,l
   65AD 44            [ 4]  541 	ld	b,h
   65AE D1            [10]  542 	pop	de
                            543 ;src/main.c:171: break;
   65AF C3 7A 66      [10]  544 	jp	00105$
                            545 ;src/main.c:172: case 1:
   65B2                     546 00102$:
                            547 ;src/main.c:173: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   65B2 21 E3 62      [10]  548 	ld	hl, #(_prota + 0x0001) + 0
   65B5 56            [ 7]  549 	ld	d,(hl)
   65B6 21 E2 62      [10]  550 	ld	hl, #_prota + 0
   65B9 46            [ 7]  551 	ld	b,(hl)
   65BA 05            [ 4]  552 	dec	b
   65BB D5            [11]  553 	push	de
   65BC 33            [ 6]  554 	inc	sp
   65BD C5            [11]  555 	push	bc
   65BE 33            [ 6]  556 	inc	sp
   65BF 2A F9 62      [16]  557 	ld	hl,(_mapa)
   65C2 E5            [11]  558 	push	hl
   65C3 CD 61 4B      [17]  559 	call	_getTilePtr
   65C6 F1            [10]  560 	pop	af
   65C7 F1            [10]  561 	pop	af
   65C8 33            [ 6]  562 	inc	sp
   65C9 33            [ 6]  563 	inc	sp
   65CA E5            [11]  564 	push	hl
                            565 ;src/main.c:174: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   65CB 3A E3 62      [13]  566 	ld	a, (#(_prota + 0x0001) + 0)
   65CE C6 14         [ 7]  567 	add	a, #0x14
   65D0 57            [ 4]  568 	ld	d,a
   65D1 21 E2 62      [10]  569 	ld	hl, #_prota + 0
   65D4 46            [ 7]  570 	ld	b,(hl)
   65D5 05            [ 4]  571 	dec	b
   65D6 D5            [11]  572 	push	de
   65D7 33            [ 6]  573 	inc	sp
   65D8 C5            [11]  574 	push	bc
   65D9 33            [ 6]  575 	inc	sp
   65DA 2A F9 62      [16]  576 	ld	hl,(_mapa)
   65DD E5            [11]  577 	push	hl
   65DE CD 61 4B      [17]  578 	call	_getTilePtr
   65E1 F1            [10]  579 	pop	af
   65E2 F1            [10]  580 	pop	af
   65E3 EB            [ 4]  581 	ex	de,hl
                            582 ;src/main.c:175: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   65E4 3A E3 62      [13]  583 	ld	a, (#(_prota + 0x0001) + 0)
   65E7 C6 0B         [ 7]  584 	add	a, #0x0B
   65E9 47            [ 4]  585 	ld	b,a
   65EA 3A E2 62      [13]  586 	ld	a, (#_prota + 0)
   65ED C6 FF         [ 7]  587 	add	a,#0xFF
   65EF D5            [11]  588 	push	de
   65F0 C5            [11]  589 	push	bc
   65F1 33            [ 6]  590 	inc	sp
   65F2 F5            [11]  591 	push	af
   65F3 33            [ 6]  592 	inc	sp
   65F4 2A F9 62      [16]  593 	ld	hl,(_mapa)
   65F7 E5            [11]  594 	push	hl
   65F8 CD 61 4B      [17]  595 	call	_getTilePtr
   65FB F1            [10]  596 	pop	af
   65FC F1            [10]  597 	pop	af
   65FD 4D            [ 4]  598 	ld	c,l
   65FE 44            [ 4]  599 	ld	b,h
   65FF D1            [10]  600 	pop	de
                            601 ;src/main.c:176: break;
   6600 18 78         [12]  602 	jr	00105$
                            603 ;src/main.c:177: case 2:
   6602                     604 00103$:
                            605 ;src/main.c:178: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6602 3A E3 62      [13]  606 	ld	a, (#(_prota + 0x0001) + 0)
   6605 C6 FE         [ 7]  607 	add	a,#0xFE
   6607 21 E2 62      [10]  608 	ld	hl, #_prota + 0
   660A 56            [ 7]  609 	ld	d,(hl)
   660B C5            [11]  610 	push	bc
   660C F5            [11]  611 	push	af
   660D 33            [ 6]  612 	inc	sp
   660E D5            [11]  613 	push	de
   660F 33            [ 6]  614 	inc	sp
   6610 2A F9 62      [16]  615 	ld	hl,(_mapa)
   6613 E5            [11]  616 	push	hl
   6614 CD 61 4B      [17]  617 	call	_getTilePtr
   6617 F1            [10]  618 	pop	af
   6618 F1            [10]  619 	pop	af
   6619 C1            [10]  620 	pop	bc
   661A 33            [ 6]  621 	inc	sp
   661B 33            [ 6]  622 	inc	sp
   661C E5            [11]  623 	push	hl
                            624 ;src/main.c:179: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   661D 21 E3 62      [10]  625 	ld	hl, #(_prota + 0x0001) + 0
   6620 56            [ 7]  626 	ld	d,(hl)
   6621 15            [ 4]  627 	dec	d
   6622 15            [ 4]  628 	dec	d
   6623 3A E2 62      [13]  629 	ld	a, (#_prota + 0)
   6626 C6 03         [ 7]  630 	add	a, #0x03
   6628 C5            [11]  631 	push	bc
   6629 D5            [11]  632 	push	de
   662A 33            [ 6]  633 	inc	sp
   662B F5            [11]  634 	push	af
   662C 33            [ 6]  635 	inc	sp
   662D 2A F9 62      [16]  636 	ld	hl,(_mapa)
   6630 E5            [11]  637 	push	hl
   6631 CD 61 4B      [17]  638 	call	_getTilePtr
   6634 F1            [10]  639 	pop	af
   6635 F1            [10]  640 	pop	af
   6636 EB            [ 4]  641 	ex	de,hl
   6637 C1            [10]  642 	pop	bc
                            643 ;src/main.c:180: *waistTile = 0;
   6638 21 00 00      [10]  644 	ld	hl,#0x0000
   663B 36 00         [10]  645 	ld	(hl),#0x00
                            646 ;src/main.c:181: break;
   663D 18 3B         [12]  647 	jr	00105$
                            648 ;src/main.c:182: case 3:
   663F                     649 00104$:
                            650 ;src/main.c:183: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   663F 3A E3 62      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   6642 C6 16         [ 7]  652 	add	a, #0x16
   6644 21 E2 62      [10]  653 	ld	hl, #_prota + 0
   6647 56            [ 7]  654 	ld	d,(hl)
   6648 C5            [11]  655 	push	bc
   6649 F5            [11]  656 	push	af
   664A 33            [ 6]  657 	inc	sp
   664B D5            [11]  658 	push	de
   664C 33            [ 6]  659 	inc	sp
   664D 2A F9 62      [16]  660 	ld	hl,(_mapa)
   6650 E5            [11]  661 	push	hl
   6651 CD 61 4B      [17]  662 	call	_getTilePtr
   6654 F1            [10]  663 	pop	af
   6655 F1            [10]  664 	pop	af
   6656 C1            [10]  665 	pop	bc
   6657 33            [ 6]  666 	inc	sp
   6658 33            [ 6]  667 	inc	sp
   6659 E5            [11]  668 	push	hl
                            669 ;src/main.c:184: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   665A 3A E3 62      [13]  670 	ld	a, (#(_prota + 0x0001) + 0)
   665D C6 16         [ 7]  671 	add	a, #0x16
   665F 57            [ 4]  672 	ld	d,a
   6660 3A E2 62      [13]  673 	ld	a, (#_prota + 0)
   6663 C6 03         [ 7]  674 	add	a, #0x03
   6665 C5            [11]  675 	push	bc
   6666 D5            [11]  676 	push	de
   6667 33            [ 6]  677 	inc	sp
   6668 F5            [11]  678 	push	af
   6669 33            [ 6]  679 	inc	sp
   666A 2A F9 62      [16]  680 	ld	hl,(_mapa)
   666D E5            [11]  681 	push	hl
   666E CD 61 4B      [17]  682 	call	_getTilePtr
   6671 F1            [10]  683 	pop	af
   6672 F1            [10]  684 	pop	af
   6673 EB            [ 4]  685 	ex	de,hl
   6674 C1            [10]  686 	pop	bc
                            687 ;src/main.c:185: *waistTile = 0;
   6675 21 00 00      [10]  688 	ld	hl,#0x0000
   6678 36 00         [10]  689 	ld	(hl),#0x00
                            690 ;src/main.c:187: }
   667A                     691 00105$:
                            692 ;src/main.c:189: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   667A E1            [10]  693 	pop	hl
   667B E5            [11]  694 	push	hl
   667C 6E            [ 7]  695 	ld	l,(hl)
   667D 3E 02         [ 7]  696 	ld	a,#0x02
   667F 95            [ 4]  697 	sub	a, l
   6680 38 0E         [12]  698 	jr	C,00106$
   6682 1A            [ 7]  699 	ld	a,(de)
   6683 5F            [ 4]  700 	ld	e,a
   6684 3E 02         [ 7]  701 	ld	a,#0x02
   6686 93            [ 4]  702 	sub	a, e
   6687 38 07         [12]  703 	jr	C,00106$
   6689 0A            [ 7]  704 	ld	a,(bc)
   668A 4F            [ 4]  705 	ld	c,a
   668B 3E 02         [ 7]  706 	ld	a,#0x02
   668D 91            [ 4]  707 	sub	a, c
   668E 30 04         [12]  708 	jr	NC,00107$
   6690                     709 00106$:
                            710 ;src/main.c:190: return 1;
   6690 2E 01         [ 7]  711 	ld	l,#0x01
   6692 18 02         [12]  712 	jr	00110$
   6694                     713 00107$:
                            714 ;src/main.c:192: return 0;
   6694 2E 00         [ 7]  715 	ld	l,#0x00
   6696                     716 00110$:
   6696 DD F9         [10]  717 	ld	sp, ix
   6698 DD E1         [14]  718 	pop	ix
   669A C9            [10]  719 	ret
                            720 ;src/main.c:195: void dibujarEnemigo(TEnemy *enemy) {
                            721 ;	---------------------------------
                            722 ; Function dibujarEnemigo
                            723 ; ---------------------------------
   669B                     724 _dibujarEnemigo::
   669B DD E5         [15]  725 	push	ix
   669D DD 21 00 00   [14]  726 	ld	ix,#0
   66A1 DD 39         [15]  727 	add	ix,sp
                            728 ;src/main.c:196: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66A3 DD 4E 04      [19]  729 	ld	c,4 (ix)
   66A6 DD 46 05      [19]  730 	ld	b,5 (ix)
   66A9 69            [ 4]  731 	ld	l, c
   66AA 60            [ 4]  732 	ld	h, b
   66AB 23            [ 6]  733 	inc	hl
   66AC 56            [ 7]  734 	ld	d,(hl)
   66AD 0A            [ 7]  735 	ld	a,(bc)
   66AE C5            [11]  736 	push	bc
   66AF D5            [11]  737 	push	de
   66B0 33            [ 6]  738 	inc	sp
   66B1 F5            [11]  739 	push	af
   66B2 33            [ 6]  740 	inc	sp
   66B3 21 00 C0      [10]  741 	ld	hl,#0xC000
   66B6 E5            [11]  742 	push	hl
   66B7 CD FB 5E      [17]  743 	call	_cpct_getScreenPtr
   66BA EB            [ 4]  744 	ex	de,hl
                            745 ;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   66BB E1            [10]  746 	pop	hl
   66BC 01 04 00      [10]  747 	ld	bc, #0x0004
   66BF 09            [11]  748 	add	hl, bc
   66C0 4E            [ 7]  749 	ld	c,(hl)
   66C1 23            [ 6]  750 	inc	hl
   66C2 46            [ 7]  751 	ld	b,(hl)
   66C3 21 00 01      [10]  752 	ld	hl,#_g_tablatrans
   66C6 E5            [11]  753 	push	hl
   66C7 21 04 16      [10]  754 	ld	hl,#0x1604
   66CA E5            [11]  755 	push	hl
   66CB D5            [11]  756 	push	de
   66CC C5            [11]  757 	push	bc
   66CD CD 1B 5F      [17]  758 	call	_cpct_drawSpriteMaskedAlignedTable
   66D0 DD E1         [14]  759 	pop	ix
   66D2 C9            [10]  760 	ret
                            761 ;src/main.c:200: void dibujarExplosion(TEnemy *enemy) {
                            762 ;	---------------------------------
                            763 ; Function dibujarExplosion
                            764 ; ---------------------------------
   66D3                     765 _dibujarExplosion::
   66D3 DD E5         [15]  766 	push	ix
   66D5 DD 21 00 00   [14]  767 	ld	ix,#0
   66D9 DD 39         [15]  768 	add	ix,sp
                            769 ;src/main.c:201: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   66DB DD 4E 04      [19]  770 	ld	c,4 (ix)
   66DE DD 46 05      [19]  771 	ld	b,5 (ix)
   66E1 69            [ 4]  772 	ld	l, c
   66E2 60            [ 4]  773 	ld	h, b
   66E3 23            [ 6]  774 	inc	hl
   66E4 23            [ 6]  775 	inc	hl
   66E5 23            [ 6]  776 	inc	hl
   66E6 56            [ 7]  777 	ld	d,(hl)
   66E7 69            [ 4]  778 	ld	l, c
   66E8 60            [ 4]  779 	ld	h, b
   66E9 23            [ 6]  780 	inc	hl
   66EA 23            [ 6]  781 	inc	hl
   66EB 46            [ 7]  782 	ld	b,(hl)
   66EC D5            [11]  783 	push	de
   66ED 33            [ 6]  784 	inc	sp
   66EE C5            [11]  785 	push	bc
   66EF 33            [ 6]  786 	inc	sp
   66F0 21 00 C0      [10]  787 	ld	hl,#0xC000
   66F3 E5            [11]  788 	push	hl
   66F4 CD FB 5E      [17]  789 	call	_cpct_getScreenPtr
   66F7 4D            [ 4]  790 	ld	c,l
   66F8 44            [ 4]  791 	ld	b,h
                            792 ;src/main.c:202: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   66F9 11 00 01      [10]  793 	ld	de,#_g_tablatrans+0
   66FC D5            [11]  794 	push	de
   66FD 21 04 16      [10]  795 	ld	hl,#0x1604
   6700 E5            [11]  796 	push	hl
   6701 C5            [11]  797 	push	bc
   6702 21 70 19      [10]  798 	ld	hl,#_g_explosion
   6705 E5            [11]  799 	push	hl
   6706 CD 1B 5F      [17]  800 	call	_cpct_drawSpriteMaskedAlignedTable
   6709 DD E1         [14]  801 	pop	ix
   670B C9            [10]  802 	ret
                            803 ;src/main.c:205: void borrarExplosion(u8 x, u8 y) {
                            804 ;	---------------------------------
                            805 ; Function borrarExplosion
                            806 ; ---------------------------------
   670C                     807 _borrarExplosion::
   670C DD E5         [15]  808 	push	ix
   670E DD 21 00 00   [14]  809 	ld	ix,#0
   6712 DD 39         [15]  810 	add	ix,sp
   6714 F5            [11]  811 	push	af
   6715 F5            [11]  812 	push	af
                            813 ;src/main.c:208: u8 w = 4 + (x & 1);
   6716 DD 7E 04      [19]  814 	ld	a,4 (ix)
   6719 E6 01         [ 7]  815 	and	a, #0x01
   671B 4F            [ 4]  816 	ld	c,a
   671C 0C            [ 4]  817 	inc	c
   671D 0C            [ 4]  818 	inc	c
   671E 0C            [ 4]  819 	inc	c
   671F 0C            [ 4]  820 	inc	c
                            821 ;src/main.c:209: u8 h = 6 + (y & 3 ? 1 : 0);
   6720 DD 7E 05      [19]  822 	ld	a,5 (ix)
   6723 E6 03         [ 7]  823 	and	a, #0x03
   6725 28 04         [12]  824 	jr	Z,00103$
   6727 3E 01         [ 7]  825 	ld	a,#0x01
   6729 18 02         [12]  826 	jr	00104$
   672B                     827 00103$:
   672B 3E 00         [ 7]  828 	ld	a,#0x00
   672D                     829 00104$:
   672D C6 06         [ 7]  830 	add	a, #0x06
   672F 47            [ 4]  831 	ld	b,a
                            832 ;src/main.c:211: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6730 2A F9 62      [16]  833 	ld	hl,(_mapa)
   6733 E3            [19]  834 	ex	(sp), hl
   6734 DD 5E 05      [19]  835 	ld	e,5 (ix)
   6737 16 00         [ 7]  836 	ld	d,#0x00
   6739 7B            [ 4]  837 	ld	a,e
   673A C6 E8         [ 7]  838 	add	a,#0xE8
   673C DD 77 FE      [19]  839 	ld	-2 (ix),a
   673F 7A            [ 4]  840 	ld	a,d
   6740 CE FF         [ 7]  841 	adc	a,#0xFF
   6742 DD 77 FF      [19]  842 	ld	-1 (ix),a
   6745 DD 6E FE      [19]  843 	ld	l,-2 (ix)
   6748 DD 66 FF      [19]  844 	ld	h,-1 (ix)
   674B DD CB FF 7E   [20]  845 	bit	7, -1 (ix)
   674F 28 04         [12]  846 	jr	Z,00105$
   6751 21 EB FF      [10]  847 	ld	hl,#0xFFEB
   6754 19            [11]  848 	add	hl,de
   6755                     849 00105$:
   6755 CB 2C         [ 8]  850 	sra	h
   6757 CB 1D         [ 8]  851 	rr	l
   6759 CB 2C         [ 8]  852 	sra	h
   675B CB 1D         [ 8]  853 	rr	l
   675D 5D            [ 4]  854 	ld	e,l
   675E DD 56 04      [19]  855 	ld	d,4 (ix)
   6761 CB 3A         [ 8]  856 	srl	d
   6763 E1            [10]  857 	pop	hl
   6764 E5            [11]  858 	push	hl
   6765 E5            [11]  859 	push	hl
   6766 21 F0 C0      [10]  860 	ld	hl,#0xC0F0
   6769 E5            [11]  861 	push	hl
   676A 3E 28         [ 7]  862 	ld	a,#0x28
   676C F5            [11]  863 	push	af
   676D 33            [ 6]  864 	inc	sp
   676E C5            [11]  865 	push	bc
   676F 7B            [ 4]  866 	ld	a,e
   6770 F5            [11]  867 	push	af
   6771 33            [ 6]  868 	inc	sp
   6772 D5            [11]  869 	push	de
   6773 33            [ 6]  870 	inc	sp
   6774 CD DD 53      [17]  871 	call	_cpct_etm_drawTileBox2x4
   6777 DD F9         [10]  872 	ld	sp, ix
   6779 DD E1         [14]  873 	pop	ix
   677B C9            [10]  874 	ret
                            875 ;src/main.c:215: void borrarEnemigo(u8 x, u8 y) {
                            876 ;	---------------------------------
                            877 ; Function borrarEnemigo
                            878 ; ---------------------------------
   677C                     879 _borrarEnemigo::
   677C DD E5         [15]  880 	push	ix
   677E DD 21 00 00   [14]  881 	ld	ix,#0
   6782 DD 39         [15]  882 	add	ix,sp
   6784 F5            [11]  883 	push	af
   6785 F5            [11]  884 	push	af
                            885 ;src/main.c:219: u8 w = 4 + (x & 1);
   6786 DD 7E 04      [19]  886 	ld	a,4 (ix)
   6789 E6 01         [ 7]  887 	and	a, #0x01
   678B 4F            [ 4]  888 	ld	c,a
   678C 0C            [ 4]  889 	inc	c
   678D 0C            [ 4]  890 	inc	c
   678E 0C            [ 4]  891 	inc	c
   678F 0C            [ 4]  892 	inc	c
                            893 ;src/main.c:221: u8 h = 6 + (y & 3 ? 1 : 0);
   6790 DD 7E 05      [19]  894 	ld	a,5 (ix)
   6793 E6 03         [ 7]  895 	and	a, #0x03
   6795 28 04         [12]  896 	jr	Z,00103$
   6797 3E 01         [ 7]  897 	ld	a,#0x01
   6799 18 02         [12]  898 	jr	00104$
   679B                     899 00103$:
   679B 3E 00         [ 7]  900 	ld	a,#0x00
   679D                     901 00104$:
   679D C6 06         [ 7]  902 	add	a, #0x06
   679F 47            [ 4]  903 	ld	b,a
                            904 ;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   67A0 2A F9 62      [16]  905 	ld	hl,(_mapa)
   67A3 E3            [19]  906 	ex	(sp), hl
   67A4 DD 5E 05      [19]  907 	ld	e,5 (ix)
   67A7 16 00         [ 7]  908 	ld	d,#0x00
   67A9 7B            [ 4]  909 	ld	a,e
   67AA C6 E8         [ 7]  910 	add	a,#0xE8
   67AC DD 77 FE      [19]  911 	ld	-2 (ix),a
   67AF 7A            [ 4]  912 	ld	a,d
   67B0 CE FF         [ 7]  913 	adc	a,#0xFF
   67B2 DD 77 FF      [19]  914 	ld	-1 (ix),a
   67B5 DD 6E FE      [19]  915 	ld	l,-2 (ix)
   67B8 DD 66 FF      [19]  916 	ld	h,-1 (ix)
   67BB DD CB FF 7E   [20]  917 	bit	7, -1 (ix)
   67BF 28 04         [12]  918 	jr	Z,00105$
   67C1 21 EB FF      [10]  919 	ld	hl,#0xFFEB
   67C4 19            [11]  920 	add	hl,de
   67C5                     921 00105$:
   67C5 CB 2C         [ 8]  922 	sra	h
   67C7 CB 1D         [ 8]  923 	rr	l
   67C9 CB 2C         [ 8]  924 	sra	h
   67CB CB 1D         [ 8]  925 	rr	l
   67CD 5D            [ 4]  926 	ld	e,l
   67CE DD 56 04      [19]  927 	ld	d,4 (ix)
   67D1 CB 3A         [ 8]  928 	srl	d
   67D3 E1            [10]  929 	pop	hl
   67D4 E5            [11]  930 	push	hl
   67D5 E5            [11]  931 	push	hl
   67D6 21 F0 C0      [10]  932 	ld	hl,#0xC0F0
   67D9 E5            [11]  933 	push	hl
   67DA 3E 28         [ 7]  934 	ld	a,#0x28
   67DC F5            [11]  935 	push	af
   67DD 33            [ 6]  936 	inc	sp
   67DE C5            [11]  937 	push	bc
   67DF 7B            [ 4]  938 	ld	a,e
   67E0 F5            [11]  939 	push	af
   67E1 33            [ 6]  940 	inc	sp
   67E2 D5            [11]  941 	push	de
   67E3 33            [ 6]  942 	inc	sp
   67E4 CD DD 53      [17]  943 	call	_cpct_etm_drawTileBox2x4
   67E7 DD F9         [10]  944 	ld	sp, ix
   67E9 DD E1         [14]  945 	pop	ix
   67EB C9            [10]  946 	ret
                            947 ;src/main.c:226: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            948 ;	---------------------------------
                            949 ; Function redibujarEnemigo
                            950 ; ---------------------------------
   67EC                     951 _redibujarEnemigo::
   67EC DD E5         [15]  952 	push	ix
   67EE DD 21 00 00   [14]  953 	ld	ix,#0
   67F2 DD 39         [15]  954 	add	ix,sp
                            955 ;src/main.c:227: borrarEnemigo(x, y);
   67F4 DD 66 05      [19]  956 	ld	h,5 (ix)
   67F7 DD 6E 04      [19]  957 	ld	l,4 (ix)
   67FA E5            [11]  958 	push	hl
   67FB CD 7C 67      [17]  959 	call	_borrarEnemigo
   67FE F1            [10]  960 	pop	af
                            961 ;src/main.c:228: enemy->px = enemy->x;
   67FF DD 4E 06      [19]  962 	ld	c,6 (ix)
   6802 DD 46 07      [19]  963 	ld	b,7 (ix)
   6805 59            [ 4]  964 	ld	e, c
   6806 50            [ 4]  965 	ld	d, b
   6807 13            [ 6]  966 	inc	de
   6808 13            [ 6]  967 	inc	de
   6809 0A            [ 7]  968 	ld	a,(bc)
   680A 12            [ 7]  969 	ld	(de),a
                            970 ;src/main.c:229: enemy->py = enemy->y;
   680B 59            [ 4]  971 	ld	e, c
   680C 50            [ 4]  972 	ld	d, b
   680D 13            [ 6]  973 	inc	de
   680E 13            [ 6]  974 	inc	de
   680F 13            [ 6]  975 	inc	de
   6810 69            [ 4]  976 	ld	l, c
   6811 60            [ 4]  977 	ld	h, b
   6812 23            [ 6]  978 	inc	hl
   6813 7E            [ 7]  979 	ld	a,(hl)
   6814 12            [ 7]  980 	ld	(de),a
                            981 ;src/main.c:230: dibujarEnemigo(enemy);
   6815 C5            [11]  982 	push	bc
   6816 CD 9B 66      [17]  983 	call	_dibujarEnemigo
   6819 F1            [10]  984 	pop	af
   681A DD E1         [14]  985 	pop	ix
   681C C9            [10]  986 	ret
                            987 ;src/main.c:234: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            988 ;	---------------------------------
                            989 ; Function checkEnemyDead
                            990 ; ---------------------------------
   681D                     991 _checkEnemyDead::
   681D DD E5         [15]  992 	push	ix
   681F DD 21 00 00   [14]  993 	ld	ix,#0
   6823 DD 39         [15]  994 	add	ix,sp
   6825 21 FA FF      [10]  995 	ld	hl,#-6
   6828 39            [11]  996 	add	hl,sp
   6829 F9            [ 6]  997 	ld	sp,hl
                            998 ;src/main.c:236: switch (direction) {
   682A 3E 03         [ 7]  999 	ld	a,#0x03
   682C DD 96 04      [19] 1000 	sub	a, 4 (ix)
   682F DA 0B 6A      [10] 1001 	jp	C,00134$
                           1002 ;src/main.c:240: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6832 DD 7E 05      [19] 1003 	ld	a,5 (ix)
   6835 DD 77 FE      [19] 1004 	ld	-2 (ix),a
   6838 DD 7E 06      [19] 1005 	ld	a,6 (ix)
   683B DD 77 FF      [19] 1006 	ld	-1 (ix),a
   683E DD 7E FE      [19] 1007 	ld	a,-2 (ix)
   6841 C6 01         [ 7] 1008 	add	a, #0x01
   6843 DD 77 FC      [19] 1009 	ld	-4 (ix),a
   6846 DD 7E FF      [19] 1010 	ld	a,-1 (ix)
   6849 CE 00         [ 7] 1011 	adc	a, #0x00
   684B DD 77 FD      [19] 1012 	ld	-3 (ix),a
                           1013 ;src/main.c:243: enemy->muerto = SI;
   684E DD 7E FE      [19] 1014 	ld	a,-2 (ix)
   6851 C6 08         [ 7] 1015 	add	a, #0x08
   6853 DD 77 FA      [19] 1016 	ld	-6 (ix),a
   6856 DD 7E FF      [19] 1017 	ld	a,-1 (ix)
   6859 CE 00         [ 7] 1018 	adc	a, #0x00
   685B DD 77 FB      [19] 1019 	ld	-5 (ix),a
                           1020 ;src/main.c:236: switch (direction) {
   685E DD 5E 04      [19] 1021 	ld	e,4 (ix)
   6861 16 00         [ 7] 1022 	ld	d,#0x00
   6863 21 6A 68      [10] 1023 	ld	hl,#00204$
   6866 19            [11] 1024 	add	hl,de
   6867 19            [11] 1025 	add	hl,de
   6868 19            [11] 1026 	add	hl,de
   6869 E9            [ 4] 1027 	jp	(hl)
   686A                    1028 00204$:
   686A C3 76 68      [10] 1029 	jp	00101$
   686D C3 DE 68      [10] 1030 	jp	00109$
   6870 C3 46 69      [10] 1031 	jp	00117$
   6873 C3 AD 69      [10] 1032 	jp	00125$
                           1033 ;src/main.c:239: case 0:
   6876                    1034 00101$:
                           1035 ;src/main.c:240: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6876 21 EB 62      [10] 1036 	ld	hl, #_cu + 1
   6879 4E            [ 7] 1037 	ld	c,(hl)
   687A 06 00         [ 7] 1038 	ld	b,#0x00
   687C 21 04 00      [10] 1039 	ld	hl,#0x0004
   687F 09            [11] 1040 	add	hl,bc
   6880 EB            [ 4] 1041 	ex	de,hl
   6881 DD 6E FC      [19] 1042 	ld	l,-4 (ix)
   6884 DD 66 FD      [19] 1043 	ld	h,-3 (ix)
   6887 6E            [ 7] 1044 	ld	l,(hl)
   6888 26 00         [ 7] 1045 	ld	h,#0x00
   688A 7B            [ 4] 1046 	ld	a,e
   688B 95            [ 4] 1047 	sub	a, l
   688C 7A            [ 4] 1048 	ld	a,d
   688D 9C            [ 4] 1049 	sbc	a, h
   688E E2 93 68      [10] 1050 	jp	PO, 00205$
   6891 EE 80         [ 7] 1051 	xor	a, #0x80
   6893                    1052 00205$:
   6893 FA 0B 6A      [10] 1053 	jp	M,00134$
   6896 11 16 00      [10] 1054 	ld	de,#0x0016
   6899 19            [11] 1055 	add	hl,de
   689A 7D            [ 4] 1056 	ld	a,l
   689B 91            [ 4] 1057 	sub	a, c
   689C 7C            [ 4] 1058 	ld	a,h
   689D 98            [ 4] 1059 	sbc	a, b
   689E E2 A3 68      [10] 1060 	jp	PO, 00206$
   68A1 EE 80         [ 7] 1061 	xor	a, #0x80
   68A3                    1062 00206$:
   68A3 FA 0B 6A      [10] 1063 	jp	M,00134$
                           1064 ;src/main.c:241: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   68A6 DD 6E FE      [19] 1065 	ld	l,-2 (ix)
   68A9 DD 66 FF      [19] 1066 	ld	h,-1 (ix)
   68AC 4E            [ 7] 1067 	ld	c,(hl)
   68AD 21 EA 62      [10] 1068 	ld	hl, #_cu + 0
   68B0 5E            [ 7] 1069 	ld	e,(hl)
   68B1 16 00         [ 7] 1070 	ld	d,#0x00
   68B3 13            [ 6] 1071 	inc	de
   68B4 13            [ 6] 1072 	inc	de
   68B5 13            [ 6] 1073 	inc	de
   68B6 13            [ 6] 1074 	inc	de
   68B7 69            [ 4] 1075 	ld	l,c
   68B8 26 00         [ 7] 1076 	ld	h,#0x00
   68BA 7B            [ 4] 1077 	ld	a,e
   68BB 95            [ 4] 1078 	sub	a, l
   68BC 7A            [ 4] 1079 	ld	a,d
   68BD 9C            [ 4] 1080 	sbc	a, h
   68BE E2 C3 68      [10] 1081 	jp	PO, 00207$
   68C1 EE 80         [ 7] 1082 	xor	a, #0x80
   68C3                    1083 00207$:
   68C3 F2 0B 6A      [10] 1084 	jp	P,00134$
                           1085 ;src/main.c:242: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   68C6 BF            [ 4] 1086 	cp	a, a
   68C7 ED 52         [15] 1087 	sbc	hl, de
   68C9 3E 01         [ 7] 1088 	ld	a,#0x01
   68CB BD            [ 4] 1089 	cp	a, l
   68CC 3E 00         [ 7] 1090 	ld	a,#0x00
   68CE 9C            [ 4] 1091 	sbc	a, h
   68CF E2 D4 68      [10] 1092 	jp	PO, 00208$
   68D2 EE 80         [ 7] 1093 	xor	a, #0x80
   68D4                    1094 00208$:
   68D4 FA 0B 6A      [10] 1095 	jp	M,00134$
                           1096 ;src/main.c:243: enemy->muerto = SI;
   68D7 E1            [10] 1097 	pop	hl
   68D8 E5            [11] 1098 	push	hl
   68D9 36 01         [10] 1099 	ld	(hl),#0x01
                           1100 ;src/main.c:247: break;
   68DB C3 0B 6A      [10] 1101 	jp	00134$
                           1102 ;src/main.c:248: case 1:
   68DE                    1103 00109$:
                           1104 ;src/main.c:249: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   68DE 21 EB 62      [10] 1105 	ld	hl, #_cu + 1
   68E1 4E            [ 7] 1106 	ld	c,(hl)
   68E2 06 00         [ 7] 1107 	ld	b,#0x00
   68E4 21 04 00      [10] 1108 	ld	hl,#0x0004
   68E7 09            [11] 1109 	add	hl,bc
   68E8 EB            [ 4] 1110 	ex	de,hl
   68E9 DD 6E FC      [19] 1111 	ld	l,-4 (ix)
   68EC DD 66 FD      [19] 1112 	ld	h,-3 (ix)
   68EF 6E            [ 7] 1113 	ld	l,(hl)
   68F0 26 00         [ 7] 1114 	ld	h,#0x00
   68F2 7B            [ 4] 1115 	ld	a,e
   68F3 95            [ 4] 1116 	sub	a, l
   68F4 7A            [ 4] 1117 	ld	a,d
   68F5 9C            [ 4] 1118 	sbc	a, h
   68F6 E2 FB 68      [10] 1119 	jp	PO, 00209$
   68F9 EE 80         [ 7] 1120 	xor	a, #0x80
   68FB                    1121 00209$:
   68FB FA 0B 6A      [10] 1122 	jp	M,00134$
   68FE 11 16 00      [10] 1123 	ld	de,#0x0016
   6901 19            [11] 1124 	add	hl,de
   6902 7D            [ 4] 1125 	ld	a,l
   6903 91            [ 4] 1126 	sub	a, c
   6904 7C            [ 4] 1127 	ld	a,h
   6905 98            [ 4] 1128 	sbc	a, b
   6906 E2 0B 69      [10] 1129 	jp	PO, 00210$
   6909 EE 80         [ 7] 1130 	xor	a, #0x80
   690B                    1131 00210$:
   690B FA 0B 6A      [10] 1132 	jp	M,00134$
                           1133 ;src/main.c:250: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   690E 21 EA 62      [10] 1134 	ld	hl, #_cu + 0
   6911 4E            [ 7] 1135 	ld	c,(hl)
   6912 DD 6E FE      [19] 1136 	ld	l,-2 (ix)
   6915 DD 66 FF      [19] 1137 	ld	h,-1 (ix)
   6918 5E            [ 7] 1138 	ld	e,(hl)
   6919 16 00         [ 7] 1139 	ld	d,#0x00
   691B 13            [ 6] 1140 	inc	de
   691C 13            [ 6] 1141 	inc	de
   691D 13            [ 6] 1142 	inc	de
   691E 13            [ 6] 1143 	inc	de
   691F 69            [ 4] 1144 	ld	l,c
   6920 26 00         [ 7] 1145 	ld	h,#0x00
   6922 7B            [ 4] 1146 	ld	a,e
   6923 95            [ 4] 1147 	sub	a, l
   6924 7A            [ 4] 1148 	ld	a,d
   6925 9C            [ 4] 1149 	sbc	a, h
   6926 E2 2B 69      [10] 1150 	jp	PO, 00211$
   6929 EE 80         [ 7] 1151 	xor	a, #0x80
   692B                    1152 00211$:
   692B F2 0B 6A      [10] 1153 	jp	P,00134$
                           1154 ;src/main.c:251: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   692E BF            [ 4] 1155 	cp	a, a
   692F ED 52         [15] 1156 	sbc	hl, de
   6931 3E 01         [ 7] 1157 	ld	a,#0x01
   6933 BD            [ 4] 1158 	cp	a, l
   6934 3E 00         [ 7] 1159 	ld	a,#0x00
   6936 9C            [ 4] 1160 	sbc	a, h
   6937 E2 3C 69      [10] 1161 	jp	PO, 00212$
   693A EE 80         [ 7] 1162 	xor	a, #0x80
   693C                    1163 00212$:
   693C FA 0B 6A      [10] 1164 	jp	M,00134$
                           1165 ;src/main.c:252: enemy->muerto = SI;
   693F E1            [10] 1166 	pop	hl
   6940 E5            [11] 1167 	push	hl
   6941 36 01         [10] 1168 	ld	(hl),#0x01
                           1169 ;src/main.c:256: break;
   6943 C3 0B 6A      [10] 1170 	jp	00134$
                           1171 ;src/main.c:258: case 2:
   6946                    1172 00117$:
                           1173 ;src/main.c:259: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6946 21 EA 62      [10] 1174 	ld	hl, #_cu + 0
   6949 4E            [ 7] 1175 	ld	c,(hl)
   694A 06 00         [ 7] 1176 	ld	b,#0x00
   694C 59            [ 4] 1177 	ld	e, c
   694D 50            [ 4] 1178 	ld	d, b
   694E 13            [ 6] 1179 	inc	de
   694F 13            [ 6] 1180 	inc	de
   6950 DD 6E FE      [19] 1181 	ld	l,-2 (ix)
   6953 DD 66 FF      [19] 1182 	ld	h,-1 (ix)
   6956 6E            [ 7] 1183 	ld	l,(hl)
   6957 26 00         [ 7] 1184 	ld	h,#0x00
   6959 7B            [ 4] 1185 	ld	a,e
   695A 95            [ 4] 1186 	sub	a, l
   695B 7A            [ 4] 1187 	ld	a,d
   695C 9C            [ 4] 1188 	sbc	a, h
   695D E2 62 69      [10] 1189 	jp	PO, 00213$
   6960 EE 80         [ 7] 1190 	xor	a, #0x80
   6962                    1191 00213$:
   6962 FA 0B 6A      [10] 1192 	jp	M,00134$
   6965 11 04 00      [10] 1193 	ld	de,#0x0004
   6968 19            [11] 1194 	add	hl,de
   6969 7D            [ 4] 1195 	ld	a,l
   696A 91            [ 4] 1196 	sub	a, c
   696B 7C            [ 4] 1197 	ld	a,h
   696C 98            [ 4] 1198 	sbc	a, b
   696D E2 72 69      [10] 1199 	jp	PO, 00214$
   6970 EE 80         [ 7] 1200 	xor	a, #0x80
   6972                    1201 00214$:
   6972 FA 0B 6A      [10] 1202 	jp	M,00134$
                           1203 ;src/main.c:260: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6975 21 EB 62      [10] 1204 	ld	hl, #(_cu + 0x0001) + 0
   6978 4E            [ 7] 1205 	ld	c,(hl)
   6979 DD 6E FC      [19] 1206 	ld	l,-4 (ix)
   697C DD 66 FD      [19] 1207 	ld	h,-3 (ix)
   697F 5E            [ 7] 1208 	ld	e,(hl)
   6980 16 00         [ 7] 1209 	ld	d,#0x00
   6982 21 16 00      [10] 1210 	ld	hl,#0x0016
   6985 19            [11] 1211 	add	hl,de
   6986 EB            [ 4] 1212 	ex	de,hl
   6987 69            [ 4] 1213 	ld	l,c
   6988 26 00         [ 7] 1214 	ld	h,#0x00
   698A 7B            [ 4] 1215 	ld	a,e
   698B 95            [ 4] 1216 	sub	a, l
   698C 7A            [ 4] 1217 	ld	a,d
   698D 9C            [ 4] 1218 	sbc	a, h
   698E E2 93 69      [10] 1219 	jp	PO, 00215$
   6991 EE 80         [ 7] 1220 	xor	a, #0x80
   6993                    1221 00215$:
   6993 F2 0B 6A      [10] 1222 	jp	P,00134$
                           1223 ;src/main.c:261: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6996 BF            [ 4] 1224 	cp	a, a
   6997 ED 52         [15] 1225 	sbc	hl, de
   6999 3E 02         [ 7] 1226 	ld	a,#0x02
   699B BD            [ 4] 1227 	cp	a, l
   699C 3E 00         [ 7] 1228 	ld	a,#0x00
   699E 9C            [ 4] 1229 	sbc	a, h
   699F E2 A4 69      [10] 1230 	jp	PO, 00216$
   69A2 EE 80         [ 7] 1231 	xor	a, #0x80
   69A4                    1232 00216$:
   69A4 FA 0B 6A      [10] 1233 	jp	M,00134$
                           1234 ;src/main.c:262: enemy->muerto = SI;
   69A7 E1            [10] 1235 	pop	hl
   69A8 E5            [11] 1236 	push	hl
   69A9 36 01         [10] 1237 	ld	(hl),#0x01
                           1238 ;src/main.c:266: break;
   69AB 18 5E         [12] 1239 	jr	00134$
                           1240 ;src/main.c:267: case 3:
   69AD                    1241 00125$:
                           1242 ;src/main.c:268: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   69AD 21 EA 62      [10] 1243 	ld	hl, #_cu + 0
   69B0 4E            [ 7] 1244 	ld	c,(hl)
   69B1 06 00         [ 7] 1245 	ld	b,#0x00
   69B3 59            [ 4] 1246 	ld	e, c
   69B4 50            [ 4] 1247 	ld	d, b
   69B5 13            [ 6] 1248 	inc	de
   69B6 13            [ 6] 1249 	inc	de
   69B7 DD 6E FE      [19] 1250 	ld	l,-2 (ix)
   69BA DD 66 FF      [19] 1251 	ld	h,-1 (ix)
   69BD 6E            [ 7] 1252 	ld	l,(hl)
   69BE 26 00         [ 7] 1253 	ld	h,#0x00
   69C0 7B            [ 4] 1254 	ld	a,e
   69C1 95            [ 4] 1255 	sub	a, l
   69C2 7A            [ 4] 1256 	ld	a,d
   69C3 9C            [ 4] 1257 	sbc	a, h
   69C4 E2 C9 69      [10] 1258 	jp	PO, 00217$
   69C7 EE 80         [ 7] 1259 	xor	a, #0x80
   69C9                    1260 00217$:
   69C9 FA 0B 6A      [10] 1261 	jp	M,00134$
   69CC 11 04 00      [10] 1262 	ld	de,#0x0004
   69CF 19            [11] 1263 	add	hl,de
   69D0 7D            [ 4] 1264 	ld	a,l
   69D1 91            [ 4] 1265 	sub	a, c
   69D2 7C            [ 4] 1266 	ld	a,h
   69D3 98            [ 4] 1267 	sbc	a, b
   69D4 E2 D9 69      [10] 1268 	jp	PO, 00218$
   69D7 EE 80         [ 7] 1269 	xor	a, #0x80
   69D9                    1270 00218$:
   69D9 FA 0B 6A      [10] 1271 	jp	M,00134$
                           1272 ;src/main.c:269: if(enemy->y>cu.y){
   69DC DD 6E FC      [19] 1273 	ld	l,-4 (ix)
   69DF DD 66 FD      [19] 1274 	ld	h,-3 (ix)
   69E2 4E            [ 7] 1275 	ld	c,(hl)
   69E3 21 EB 62      [10] 1276 	ld	hl, #(_cu + 0x0001) + 0
   69E6 5E            [ 7] 1277 	ld	e,(hl)
   69E7 7B            [ 4] 1278 	ld	a,e
   69E8 91            [ 4] 1279 	sub	a, c
   69E9 30 20         [12] 1280 	jr	NC,00134$
                           1281 ;src/main.c:270: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   69EB 06 00         [ 7] 1282 	ld	b,#0x00
   69ED 16 00         [ 7] 1283 	ld	d,#0x00
   69EF 21 08 00      [10] 1284 	ld	hl,#0x0008
   69F2 19            [11] 1285 	add	hl,de
   69F3 79            [ 4] 1286 	ld	a,c
   69F4 95            [ 4] 1287 	sub	a, l
   69F5 4F            [ 4] 1288 	ld	c,a
   69F6 78            [ 4] 1289 	ld	a,b
   69F7 9C            [ 4] 1290 	sbc	a, h
   69F8 47            [ 4] 1291 	ld	b,a
   69F9 3E 02         [ 7] 1292 	ld	a,#0x02
   69FB B9            [ 4] 1293 	cp	a, c
   69FC 3E 00         [ 7] 1294 	ld	a,#0x00
   69FE 98            [ 4] 1295 	sbc	a, b
   69FF E2 04 6A      [10] 1296 	jp	PO, 00219$
   6A02 EE 80         [ 7] 1297 	xor	a, #0x80
   6A04                    1298 00219$:
   6A04 FA 0B 6A      [10] 1299 	jp	M,00134$
                           1300 ;src/main.c:271: enemy->muerto = SI;
   6A07 E1            [10] 1301 	pop	hl
   6A08 E5            [11] 1302 	push	hl
   6A09 36 01         [10] 1303 	ld	(hl),#0x01
                           1304 ;src/main.c:276: }
   6A0B                    1305 00134$:
   6A0B DD F9         [10] 1306 	ld	sp, ix
   6A0D DD E1         [14] 1307 	pop	ix
   6A0F C9            [10] 1308 	ret
                           1309 ;src/main.c:279: void moverEnemigoArriba(TEnemy *enemy){
                           1310 ;	---------------------------------
                           1311 ; Function moverEnemigoArriba
                           1312 ; ---------------------------------
   6A10                    1313 _moverEnemigoArriba::
   6A10 DD E5         [15] 1314 	push	ix
   6A12 DD 21 00 00   [14] 1315 	ld	ix,#0
   6A16 DD 39         [15] 1316 	add	ix,sp
                           1317 ;src/main.c:280: enemy->y--;
   6A18 DD 4E 04      [19] 1318 	ld	c,4 (ix)
   6A1B DD 46 05      [19] 1319 	ld	b,5 (ix)
   6A1E 69            [ 4] 1320 	ld	l, c
   6A1F 60            [ 4] 1321 	ld	h, b
   6A20 23            [ 6] 1322 	inc	hl
   6A21 5E            [ 7] 1323 	ld	e,(hl)
   6A22 1D            [ 4] 1324 	dec	e
   6A23 73            [ 7] 1325 	ld	(hl),e
                           1326 ;src/main.c:281: enemy->y--;
   6A24 1D            [ 4] 1327 	dec	e
   6A25 73            [ 7] 1328 	ld	(hl),e
                           1329 ;src/main.c:282: enemy->mover = SI;
   6A26 21 06 00      [10] 1330 	ld	hl,#0x0006
   6A29 09            [11] 1331 	add	hl,bc
   6A2A 36 01         [10] 1332 	ld	(hl),#0x01
   6A2C DD E1         [14] 1333 	pop	ix
   6A2E C9            [10] 1334 	ret
                           1335 ;src/main.c:285: void moverEnemigoAbajo(TEnemy *enemy){
                           1336 ;	---------------------------------
                           1337 ; Function moverEnemigoAbajo
                           1338 ; ---------------------------------
   6A2F                    1339 _moverEnemigoAbajo::
   6A2F DD E5         [15] 1340 	push	ix
   6A31 DD 21 00 00   [14] 1341 	ld	ix,#0
   6A35 DD 39         [15] 1342 	add	ix,sp
                           1343 ;src/main.c:286: enemy->y++;
   6A37 DD 4E 04      [19] 1344 	ld	c,4 (ix)
   6A3A DD 46 05      [19] 1345 	ld	b,5 (ix)
   6A3D 59            [ 4] 1346 	ld	e, c
   6A3E 50            [ 4] 1347 	ld	d, b
   6A3F 13            [ 6] 1348 	inc	de
   6A40 1A            [ 7] 1349 	ld	a,(de)
   6A41 3C            [ 4] 1350 	inc	a
   6A42 12            [ 7] 1351 	ld	(de),a
                           1352 ;src/main.c:287: enemy->y++;
   6A43 3C            [ 4] 1353 	inc	a
   6A44 12            [ 7] 1354 	ld	(de),a
                           1355 ;src/main.c:288: enemy->mover = SI;
   6A45 21 06 00      [10] 1356 	ld	hl,#0x0006
   6A48 09            [11] 1357 	add	hl,bc
   6A49 36 01         [10] 1358 	ld	(hl),#0x01
   6A4B DD E1         [14] 1359 	pop	ix
   6A4D C9            [10] 1360 	ret
                           1361 ;src/main.c:291: void moverEnemigoDerecha(TEnemy *enemy){
                           1362 ;	---------------------------------
                           1363 ; Function moverEnemigoDerecha
                           1364 ; ---------------------------------
   6A4E                    1365 _moverEnemigoDerecha::
                           1366 ;src/main.c:292: enemy->x++;
   6A4E D1            [10] 1367 	pop	de
   6A4F C1            [10] 1368 	pop	bc
   6A50 C5            [11] 1369 	push	bc
   6A51 D5            [11] 1370 	push	de
   6A52 0A            [ 7] 1371 	ld	a,(bc)
   6A53 3C            [ 4] 1372 	inc	a
   6A54 02            [ 7] 1373 	ld	(bc),a
                           1374 ;src/main.c:293: enemy->x++;
   6A55 3C            [ 4] 1375 	inc	a
   6A56 02            [ 7] 1376 	ld	(bc),a
                           1377 ;src/main.c:294: enemy->mover = SI;
   6A57 21 06 00      [10] 1378 	ld	hl,#0x0006
   6A5A 09            [11] 1379 	add	hl,bc
   6A5B 36 01         [10] 1380 	ld	(hl),#0x01
   6A5D C9            [10] 1381 	ret
                           1382 ;src/main.c:297: void moverEnemigoIzquierda(TEnemy *enemy){
                           1383 ;	---------------------------------
                           1384 ; Function moverEnemigoIzquierda
                           1385 ; ---------------------------------
   6A5E                    1386 _moverEnemigoIzquierda::
                           1387 ;src/main.c:298: enemy->x--;
   6A5E D1            [10] 1388 	pop	de
   6A5F C1            [10] 1389 	pop	bc
   6A60 C5            [11] 1390 	push	bc
   6A61 D5            [11] 1391 	push	de
   6A62 0A            [ 7] 1392 	ld	a,(bc)
   6A63 C6 FF         [ 7] 1393 	add	a,#0xFF
   6A65 02            [ 7] 1394 	ld	(bc),a
                           1395 ;src/main.c:299: enemy->x--;
   6A66 C6 FF         [ 7] 1396 	add	a,#0xFF
   6A68 02            [ 7] 1397 	ld	(bc),a
                           1398 ;src/main.c:300: enemy->mover = SI;
   6A69 21 06 00      [10] 1399 	ld	hl,#0x0006
   6A6C 09            [11] 1400 	add	hl,bc
   6A6D 36 01         [10] 1401 	ld	(hl),#0x01
   6A6F C9            [10] 1402 	ret
                           1403 ;src/main.c:303: void moverEnemigoPatrol(TEnemy* enemy){
                           1404 ;	---------------------------------
                           1405 ; Function moverEnemigoPatrol
                           1406 ; ---------------------------------
   6A70                    1407 _moverEnemigoPatrol::
   6A70 DD E5         [15] 1408 	push	ix
   6A72 DD 21 00 00   [14] 1409 	ld	ix,#0
   6A76 DD 39         [15] 1410 	add	ix,sp
   6A78 21 F3 FF      [10] 1411 	ld	hl,#-13
   6A7B 39            [11] 1412 	add	hl,sp
   6A7C F9            [ 6] 1413 	ld	sp,hl
                           1414 ;src/main.c:305: if(!enemy->muerto){
   6A7D DD 4E 04      [19] 1415 	ld	c,4 (ix)
   6A80 DD 46 05      [19] 1416 	ld	b,5 (ix)
   6A83 C5            [11] 1417 	push	bc
   6A84 FD E1         [14] 1418 	pop	iy
   6A86 FD 7E 08      [19] 1419 	ld	a,8 (iy)
   6A89 B7            [ 4] 1420 	or	a, a
   6A8A C2 B4 6C      [10] 1421 	jp	NZ,00118$
                           1422 ;src/main.c:306: if (!enemy->reversePatrol) {
   6A8D 21 0B 00      [10] 1423 	ld	hl,#0x000B
   6A90 09            [11] 1424 	add	hl,bc
   6A91 DD 75 F9      [19] 1425 	ld	-7 (ix),l
   6A94 DD 74 FA      [19] 1426 	ld	-6 (ix),h
   6A97 DD 6E F9      [19] 1427 	ld	l,-7 (ix)
   6A9A DD 66 FA      [19] 1428 	ld	h,-6 (ix)
   6A9D 7E            [ 7] 1429 	ld	a,(hl)
   6A9E DD 77 FF      [19] 1430 	ld	-1 (ix),a
                           1431 ;src/main.c:307: if(enemy->iter < enemy->longitud_camino){
   6AA1 21 0D 00      [10] 1432 	ld	hl,#0x000D
   6AA4 09            [11] 1433 	add	hl,bc
   6AA5 DD 75 FB      [19] 1434 	ld	-5 (ix),l
   6AA8 DD 74 FC      [19] 1435 	ld	-4 (ix),h
   6AAB DD 6E FB      [19] 1436 	ld	l,-5 (ix)
   6AAE DD 66 FC      [19] 1437 	ld	h,-4 (ix)
   6AB1 5E            [ 7] 1438 	ld	e,(hl)
   6AB2 23            [ 6] 1439 	inc	hl
   6AB3 56            [ 7] 1440 	ld	d,(hl)
   6AB4 21 E2 00      [10] 1441 	ld	hl,#0x00E2
   6AB7 09            [11] 1442 	add	hl,bc
   6AB8 DD 75 FD      [19] 1443 	ld	-3 (ix),l
   6ABB DD 74 FE      [19] 1444 	ld	-2 (ix),h
                           1445 ;src/main.c:309: enemy->mover = SI;
   6ABE 21 06 00      [10] 1446 	ld	hl,#0x0006
   6AC1 09            [11] 1447 	add	hl,bc
   6AC2 DD 75 F7      [19] 1448 	ld	-9 (ix),l
   6AC5 DD 74 F8      [19] 1449 	ld	-8 (ix),h
                           1450 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6AC8 21 1A 00      [10] 1451 	ld	hl,#0x001A
   6ACB 09            [11] 1452 	add	hl,bc
   6ACC DD 75 F5      [19] 1453 	ld	-11 (ix),l
   6ACF DD 74 F6      [19] 1454 	ld	-10 (ix),h
                           1455 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6AD2 21 01 00      [10] 1456 	ld	hl,#0x0001
   6AD5 09            [11] 1457 	add	hl,bc
   6AD6 E3            [19] 1458 	ex	(sp), hl
                           1459 ;src/main.c:306: if (!enemy->reversePatrol) {
   6AD7 DD 7E FF      [19] 1460 	ld	a,-1 (ix)
   6ADA B7            [ 4] 1461 	or	a, a
   6ADB C2 B2 6B      [10] 1462 	jp	NZ,00114$
                           1463 ;src/main.c:307: if(enemy->iter < enemy->longitud_camino){
   6ADE DD 6E FD      [19] 1464 	ld	l,-3 (ix)
   6AE1 DD 66 FE      [19] 1465 	ld	h,-2 (ix)
   6AE4 6E            [ 7] 1466 	ld	l,(hl)
   6AE5 26 00         [ 7] 1467 	ld	h,#0x00
   6AE7 7B            [ 4] 1468 	ld	a,e
   6AE8 95            [ 4] 1469 	sub	a, l
   6AE9 7A            [ 4] 1470 	ld	a,d
   6AEA 9C            [ 4] 1471 	sbc	a, h
   6AEB E2 F0 6A      [10] 1472 	jp	PO, 00144$
   6AEE EE 80         [ 7] 1473 	xor	a, #0x80
   6AF0                    1474 00144$:
   6AF0 F2 8D 6B      [10] 1475 	jp	P,00105$
                           1476 ;src/main.c:308: if(enemy->iter == 0){
   6AF3 7A            [ 4] 1477 	ld	a,d
   6AF4 B3            [ 4] 1478 	or	a,e
   6AF5 20 50         [12] 1479 	jr	NZ,00102$
                           1480 ;src/main.c:309: enemy->mover = SI;
   6AF7 DD 6E F7      [19] 1481 	ld	l,-9 (ix)
   6AFA DD 66 F8      [19] 1482 	ld	h,-8 (ix)
   6AFD 36 01         [10] 1483 	ld	(hl),#0x01
                           1484 ;src/main.c:310: enemy->iter = 2;
   6AFF DD 6E FB      [19] 1485 	ld	l,-5 (ix)
   6B02 DD 66 FC      [19] 1486 	ld	h,-4 (ix)
   6B05 36 02         [10] 1487 	ld	(hl),#0x02
   6B07 23            [ 6] 1488 	inc	hl
   6B08 36 00         [10] 1489 	ld	(hl),#0x00
                           1490 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6B0A DD 6E FB      [19] 1491 	ld	l,-5 (ix)
   6B0D DD 66 FC      [19] 1492 	ld	h,-4 (ix)
   6B10 5E            [ 7] 1493 	ld	e,(hl)
   6B11 23            [ 6] 1494 	inc	hl
   6B12 56            [ 7] 1495 	ld	d,(hl)
   6B13 DD 6E F5      [19] 1496 	ld	l,-11 (ix)
   6B16 DD 66 F6      [19] 1497 	ld	h,-10 (ix)
   6B19 19            [11] 1498 	add	hl,de
   6B1A 7E            [ 7] 1499 	ld	a,(hl)
   6B1B 02            [ 7] 1500 	ld	(bc),a
                           1501 ;src/main.c:312: ++enemy->iter;
   6B1C DD 6E FB      [19] 1502 	ld	l,-5 (ix)
   6B1F DD 66 FC      [19] 1503 	ld	h,-4 (ix)
   6B22 4E            [ 7] 1504 	ld	c,(hl)
   6B23 23            [ 6] 1505 	inc	hl
   6B24 46            [ 7] 1506 	ld	b,(hl)
   6B25 03            [ 6] 1507 	inc	bc
   6B26 DD 6E FB      [19] 1508 	ld	l,-5 (ix)
   6B29 DD 66 FC      [19] 1509 	ld	h,-4 (ix)
   6B2C 71            [ 7] 1510 	ld	(hl),c
   6B2D 23            [ 6] 1511 	inc	hl
   6B2E 70            [ 7] 1512 	ld	(hl),b
                           1513 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6B2F DD 6E F5      [19] 1514 	ld	l,-11 (ix)
   6B32 DD 66 F6      [19] 1515 	ld	h,-10 (ix)
   6B35 09            [11] 1516 	add	hl,bc
   6B36 5E            [ 7] 1517 	ld	e,(hl)
   6B37 E1            [10] 1518 	pop	hl
   6B38 E5            [11] 1519 	push	hl
   6B39 73            [ 7] 1520 	ld	(hl),e
                           1521 ;src/main.c:314: ++enemy->iter;
   6B3A 03            [ 6] 1522 	inc	bc
   6B3B DD 6E FB      [19] 1523 	ld	l,-5 (ix)
   6B3E DD 66 FC      [19] 1524 	ld	h,-4 (ix)
   6B41 71            [ 7] 1525 	ld	(hl),c
   6B42 23            [ 6] 1526 	inc	hl
   6B43 70            [ 7] 1527 	ld	(hl),b
   6B44 C3 B4 6C      [10] 1528 	jp	00118$
   6B47                    1529 00102$:
                           1530 ;src/main.c:316: enemy->mover = SI;
   6B47 DD 6E F7      [19] 1531 	ld	l,-9 (ix)
   6B4A DD 66 F8      [19] 1532 	ld	h,-8 (ix)
   6B4D 36 01         [10] 1533 	ld	(hl),#0x01
                           1534 ;src/main.c:317: enemy->x = enemy->camino[enemy->iter];
   6B4F DD 6E FB      [19] 1535 	ld	l,-5 (ix)
   6B52 DD 66 FC      [19] 1536 	ld	h,-4 (ix)
   6B55 5E            [ 7] 1537 	ld	e,(hl)
   6B56 23            [ 6] 1538 	inc	hl
   6B57 56            [ 7] 1539 	ld	d,(hl)
   6B58 DD 6E F5      [19] 1540 	ld	l,-11 (ix)
   6B5B DD 66 F6      [19] 1541 	ld	h,-10 (ix)
   6B5E 19            [11] 1542 	add	hl,de
   6B5F 7E            [ 7] 1543 	ld	a,(hl)
   6B60 02            [ 7] 1544 	ld	(bc),a
                           1545 ;src/main.c:318: ++enemy->iter;
   6B61 DD 6E FB      [19] 1546 	ld	l,-5 (ix)
   6B64 DD 66 FC      [19] 1547 	ld	h,-4 (ix)
   6B67 5E            [ 7] 1548 	ld	e,(hl)
   6B68 23            [ 6] 1549 	inc	hl
   6B69 56            [ 7] 1550 	ld	d,(hl)
   6B6A 13            [ 6] 1551 	inc	de
   6B6B DD 6E FB      [19] 1552 	ld	l,-5 (ix)
   6B6E DD 66 FC      [19] 1553 	ld	h,-4 (ix)
   6B71 73            [ 7] 1554 	ld	(hl),e
   6B72 23            [ 6] 1555 	inc	hl
   6B73 72            [ 7] 1556 	ld	(hl),d
                           1557 ;src/main.c:319: enemy->y = enemy->camino[enemy->iter];
   6B74 DD 6E F5      [19] 1558 	ld	l,-11 (ix)
   6B77 DD 66 F6      [19] 1559 	ld	h,-10 (ix)
   6B7A 19            [11] 1560 	add	hl,de
   6B7B 7E            [ 7] 1561 	ld	a,(hl)
   6B7C E1            [10] 1562 	pop	hl
   6B7D E5            [11] 1563 	push	hl
   6B7E 77            [ 7] 1564 	ld	(hl),a
                           1565 ;src/main.c:320: ++enemy->iter;
   6B7F 13            [ 6] 1566 	inc	de
   6B80 4B            [ 4] 1567 	ld	c,e
   6B81 DD 6E FB      [19] 1568 	ld	l,-5 (ix)
   6B84 DD 66 FC      [19] 1569 	ld	h,-4 (ix)
   6B87 71            [ 7] 1570 	ld	(hl),c
   6B88 23            [ 6] 1571 	inc	hl
   6B89 72            [ 7] 1572 	ld	(hl),d
   6B8A C3 B4 6C      [10] 1573 	jp	00118$
   6B8D                    1574 00105$:
                           1575 ;src/main.c:324: enemy->mover = NO;
   6B8D DD 6E F7      [19] 1576 	ld	l,-9 (ix)
   6B90 DD 66 F8      [19] 1577 	ld	h,-8 (ix)
   6B93 36 00         [10] 1578 	ld	(hl),#0x00
                           1579 ;src/main.c:325: enemy->iter = enemy->longitud_camino;
   6B95 DD 6E FD      [19] 1580 	ld	l,-3 (ix)
   6B98 DD 66 FE      [19] 1581 	ld	h,-2 (ix)
   6B9B 4E            [ 7] 1582 	ld	c,(hl)
   6B9C 06 00         [ 7] 1583 	ld	b,#0x00
   6B9E DD 6E FB      [19] 1584 	ld	l,-5 (ix)
   6BA1 DD 66 FC      [19] 1585 	ld	h,-4 (ix)
   6BA4 71            [ 7] 1586 	ld	(hl),c
   6BA5 23            [ 6] 1587 	inc	hl
   6BA6 70            [ 7] 1588 	ld	(hl),b
                           1589 ;src/main.c:326: enemy->reversePatrol = 1;
   6BA7 DD 6E F9      [19] 1590 	ld	l,-7 (ix)
   6BAA DD 66 FA      [19] 1591 	ld	h,-6 (ix)
   6BAD 36 01         [10] 1592 	ld	(hl),#0x01
   6BAF C3 B4 6C      [10] 1593 	jp	00118$
   6BB2                    1594 00114$:
                           1595 ;src/main.c:329: if(enemy->iter > 0){
   6BB2 AF            [ 4] 1596 	xor	a, a
   6BB3 BB            [ 4] 1597 	cp	a, e
   6BB4 9A            [ 4] 1598 	sbc	a, d
   6BB5 E2 BA 6B      [10] 1599 	jp	PO, 00145$
   6BB8 EE 80         [ 7] 1600 	xor	a, #0x80
   6BBA                    1601 00145$:
   6BBA F2 9A 6C      [10] 1602 	jp	P,00111$
                           1603 ;src/main.c:330: if(enemy->iter == enemy->longitud_camino){
   6BBD DD 6E FD      [19] 1604 	ld	l,-3 (ix)
   6BC0 DD 66 FE      [19] 1605 	ld	h,-2 (ix)
   6BC3 6E            [ 7] 1606 	ld	l,(hl)
   6BC4 DD 75 FD      [19] 1607 	ld	-3 (ix),l
   6BC7 DD 36 FE 00   [19] 1608 	ld	-2 (ix),#0x00
   6BCB 7B            [ 4] 1609 	ld	a,e
   6BCC DD 96 FD      [19] 1610 	sub	a, -3 (ix)
   6BCF C2 56 6C      [10] 1611 	jp	NZ,00108$
   6BD2 7A            [ 4] 1612 	ld	a,d
   6BD3 DD 96 FE      [19] 1613 	sub	a, -2 (ix)
   6BD6 C2 56 6C      [10] 1614 	jp	NZ,00108$
                           1615 ;src/main.c:331: enemy->mover = SI;
   6BD9 DD 6E F7      [19] 1616 	ld	l,-9 (ix)
   6BDC DD 66 F8      [19] 1617 	ld	h,-8 (ix)
   6BDF 36 01         [10] 1618 	ld	(hl),#0x01
                           1619 ;src/main.c:332: enemy->iter = enemy->iter - 1;
   6BE1 DD 6E FB      [19] 1620 	ld	l,-5 (ix)
   6BE4 DD 66 FC      [19] 1621 	ld	h,-4 (ix)
   6BE7 5E            [ 7] 1622 	ld	e,(hl)
   6BE8 23            [ 6] 1623 	inc	hl
   6BE9 56            [ 7] 1624 	ld	d,(hl)
   6BEA 7B            [ 4] 1625 	ld	a,e
   6BEB C6 FF         [ 7] 1626 	add	a,#0xFF
   6BED DD 77 FD      [19] 1627 	ld	-3 (ix),a
   6BF0 7A            [ 4] 1628 	ld	a,d
   6BF1 CE FF         [ 7] 1629 	adc	a,#0xFF
   6BF3 DD 77 FE      [19] 1630 	ld	-2 (ix),a
   6BF6 DD 6E FB      [19] 1631 	ld	l,-5 (ix)
   6BF9 DD 66 FC      [19] 1632 	ld	h,-4 (ix)
   6BFC DD 7E FD      [19] 1633 	ld	a,-3 (ix)
   6BFF 77            [ 7] 1634 	ld	(hl),a
   6C00 23            [ 6] 1635 	inc	hl
   6C01 DD 7E FE      [19] 1636 	ld	a,-2 (ix)
   6C04 77            [ 7] 1637 	ld	(hl),a
                           1638 ;src/main.c:333: enemy->iter = enemy->iter - 2;
   6C05 DD 5E FD      [19] 1639 	ld	e,-3 (ix)
   6C08 DD 56 FE      [19] 1640 	ld	d,-2 (ix)
   6C0B 1B            [ 6] 1641 	dec	de
   6C0C 1B            [ 6] 1642 	dec	de
   6C0D DD 6E FB      [19] 1643 	ld	l,-5 (ix)
   6C10 DD 66 FC      [19] 1644 	ld	h,-4 (ix)
   6C13 73            [ 7] 1645 	ld	(hl),e
   6C14 23            [ 6] 1646 	inc	hl
   6C15 72            [ 7] 1647 	ld	(hl),d
                           1648 ;src/main.c:334: enemy->y = enemy->camino[enemy->iter];
   6C16 DD 6E F5      [19] 1649 	ld	l,-11 (ix)
   6C19 DD 66 F6      [19] 1650 	ld	h,-10 (ix)
   6C1C 19            [11] 1651 	add	hl,de
   6C1D 5E            [ 7] 1652 	ld	e,(hl)
   6C1E E1            [10] 1653 	pop	hl
   6C1F E5            [11] 1654 	push	hl
   6C20 73            [ 7] 1655 	ld	(hl),e
                           1656 ;src/main.c:335: --enemy->iter;
   6C21 DD 7E FD      [19] 1657 	ld	a,-3 (ix)
   6C24 C6 FD         [ 7] 1658 	add	a,#0xFD
   6C26 5F            [ 4] 1659 	ld	e,a
   6C27 DD 7E FE      [19] 1660 	ld	a,-2 (ix)
   6C2A CE FF         [ 7] 1661 	adc	a,#0xFF
   6C2C 57            [ 4] 1662 	ld	d,a
   6C2D DD 6E FB      [19] 1663 	ld	l,-5 (ix)
   6C30 DD 66 FC      [19] 1664 	ld	h,-4 (ix)
   6C33 73            [ 7] 1665 	ld	(hl),e
   6C34 23            [ 6] 1666 	inc	hl
   6C35 72            [ 7] 1667 	ld	(hl),d
                           1668 ;src/main.c:336: enemy->x = enemy->camino[enemy->iter];
   6C36 DD 6E F5      [19] 1669 	ld	l,-11 (ix)
   6C39 DD 66 F6      [19] 1670 	ld	h,-10 (ix)
   6C3C 19            [11] 1671 	add	hl,de
   6C3D 7E            [ 7] 1672 	ld	a,(hl)
   6C3E 02            [ 7] 1673 	ld	(bc),a
                           1674 ;src/main.c:337: --enemy->iter;
   6C3F DD 7E FD      [19] 1675 	ld	a,-3 (ix)
   6C42 C6 FC         [ 7] 1676 	add	a,#0xFC
   6C44 4F            [ 4] 1677 	ld	c,a
   6C45 DD 7E FE      [19] 1678 	ld	a,-2 (ix)
   6C48 CE FF         [ 7] 1679 	adc	a,#0xFF
   6C4A 47            [ 4] 1680 	ld	b,a
   6C4B DD 6E FB      [19] 1681 	ld	l,-5 (ix)
   6C4E DD 66 FC      [19] 1682 	ld	h,-4 (ix)
   6C51 71            [ 7] 1683 	ld	(hl),c
   6C52 23            [ 6] 1684 	inc	hl
   6C53 70            [ 7] 1685 	ld	(hl),b
   6C54 18 5E         [12] 1686 	jr	00118$
   6C56                    1687 00108$:
                           1688 ;src/main.c:339: enemy->mover = SI;
   6C56 DD 6E F7      [19] 1689 	ld	l,-9 (ix)
   6C59 DD 66 F8      [19] 1690 	ld	h,-8 (ix)
   6C5C 36 01         [10] 1691 	ld	(hl),#0x01
                           1692 ;src/main.c:340: enemy->y = enemy->camino[enemy->iter];
   6C5E DD 6E FB      [19] 1693 	ld	l,-5 (ix)
   6C61 DD 66 FC      [19] 1694 	ld	h,-4 (ix)
   6C64 5E            [ 7] 1695 	ld	e,(hl)
   6C65 23            [ 6] 1696 	inc	hl
   6C66 56            [ 7] 1697 	ld	d,(hl)
   6C67 DD 6E F5      [19] 1698 	ld	l,-11 (ix)
   6C6A DD 66 F6      [19] 1699 	ld	h,-10 (ix)
   6C6D 19            [11] 1700 	add	hl,de
   6C6E 5E            [ 7] 1701 	ld	e,(hl)
   6C6F E1            [10] 1702 	pop	hl
   6C70 E5            [11] 1703 	push	hl
   6C71 73            [ 7] 1704 	ld	(hl),e
                           1705 ;src/main.c:341: --enemy->iter;
   6C72 DD 6E FB      [19] 1706 	ld	l,-5 (ix)
   6C75 DD 66 FC      [19] 1707 	ld	h,-4 (ix)
   6C78 5E            [ 7] 1708 	ld	e,(hl)
   6C79 23            [ 6] 1709 	inc	hl
   6C7A 56            [ 7] 1710 	ld	d,(hl)
   6C7B 1B            [ 6] 1711 	dec	de
   6C7C DD 6E FB      [19] 1712 	ld	l,-5 (ix)
   6C7F DD 66 FC      [19] 1713 	ld	h,-4 (ix)
   6C82 73            [ 7] 1714 	ld	(hl),e
   6C83 23            [ 6] 1715 	inc	hl
   6C84 72            [ 7] 1716 	ld	(hl),d
                           1717 ;src/main.c:342: enemy->x = enemy->camino[enemy->iter];
   6C85 DD 6E F5      [19] 1718 	ld	l,-11 (ix)
   6C88 DD 66 F6      [19] 1719 	ld	h,-10 (ix)
   6C8B 19            [11] 1720 	add	hl,de
   6C8C 7E            [ 7] 1721 	ld	a,(hl)
   6C8D 02            [ 7] 1722 	ld	(bc),a
                           1723 ;src/main.c:343: --enemy->iter;
   6C8E 1B            [ 6] 1724 	dec	de
   6C8F DD 6E FB      [19] 1725 	ld	l,-5 (ix)
   6C92 DD 66 FC      [19] 1726 	ld	h,-4 (ix)
   6C95 73            [ 7] 1727 	ld	(hl),e
   6C96 23            [ 6] 1728 	inc	hl
   6C97 72            [ 7] 1729 	ld	(hl),d
   6C98 18 1A         [12] 1730 	jr	00118$
   6C9A                    1731 00111$:
                           1732 ;src/main.c:347: enemy->mover = NO;
   6C9A DD 6E F7      [19] 1733 	ld	l,-9 (ix)
   6C9D DD 66 F8      [19] 1734 	ld	h,-8 (ix)
   6CA0 36 00         [10] 1735 	ld	(hl),#0x00
                           1736 ;src/main.c:348: enemy->iter = 0;
   6CA2 DD 6E FB      [19] 1737 	ld	l,-5 (ix)
   6CA5 DD 66 FC      [19] 1738 	ld	h,-4 (ix)
   6CA8 AF            [ 4] 1739 	xor	a, a
   6CA9 77            [ 7] 1740 	ld	(hl), a
   6CAA 23            [ 6] 1741 	inc	hl
   6CAB 77            [ 7] 1742 	ld	(hl), a
                           1743 ;src/main.c:349: enemy->reversePatrol = 0;
   6CAC DD 6E F9      [19] 1744 	ld	l,-7 (ix)
   6CAF DD 66 FA      [19] 1745 	ld	h,-6 (ix)
   6CB2 36 00         [10] 1746 	ld	(hl),#0x00
   6CB4                    1747 00118$:
   6CB4 DD F9         [10] 1748 	ld	sp, ix
   6CB6 DD E1         [14] 1749 	pop	ix
   6CB8 C9            [10] 1750 	ret
                           1751 ;src/main.c:355: void lookFor(TEnemy* enemy){
                           1752 ;	---------------------------------
                           1753 ; Function lookFor
                           1754 ; ---------------------------------
   6CB9                    1755 _lookFor::
   6CB9 DD E5         [15] 1756 	push	ix
   6CBB DD 21 00 00   [14] 1757 	ld	ix,#0
   6CBF DD 39         [15] 1758 	add	ix,sp
   6CC1 21 F9 FF      [10] 1759 	ld	hl,#-7
   6CC4 39            [11] 1760 	add	hl,sp
   6CC5 F9            [ 6] 1761 	ld	sp,hl
                           1762 ;src/main.c:361: i16 difx = abs((i16)(enemy->x - prota.x));
   6CC6 DD 5E 04      [19] 1763 	ld	e,4 (ix)
   6CC9 DD 56 05      [19] 1764 	ld	d,5 (ix)
   6CCC 1A            [ 7] 1765 	ld	a,(de)
   6CCD 4F            [ 4] 1766 	ld	c,a
   6CCE 06 00         [ 7] 1767 	ld	b,#0x00
   6CD0 21 E2 62      [10] 1768 	ld	hl,#_prota+0
   6CD3 6E            [ 7] 1769 	ld	l,(hl)
   6CD4 26 00         [ 7] 1770 	ld	h,#0x00
   6CD6 79            [ 4] 1771 	ld	a,c
   6CD7 95            [ 4] 1772 	sub	a, l
   6CD8 4F            [ 4] 1773 	ld	c,a
   6CD9 78            [ 4] 1774 	ld	a,b
   6CDA 9C            [ 4] 1775 	sbc	a, h
   6CDB 47            [ 4] 1776 	ld	b,a
   6CDC D5            [11] 1777 	push	de
   6CDD C5            [11] 1778 	push	bc
   6CDE CD A5 4B      [17] 1779 	call	_abs
   6CE1 F1            [10] 1780 	pop	af
   6CE2 D1            [10] 1781 	pop	de
   6CE3 DD 75 FA      [19] 1782 	ld	-6 (ix),l
   6CE6 DD 74 FB      [19] 1783 	ld	-5 (ix),h
                           1784 ;src/main.c:362: i16 dify = abs((i16)(enemy->y - prota.y));
   6CE9 21 01 00      [10] 1785 	ld	hl,#0x0001
   6CEC 19            [11] 1786 	add	hl,de
   6CED DD 75 FE      [19] 1787 	ld	-2 (ix),l
   6CF0 DD 74 FF      [19] 1788 	ld	-1 (ix),h
   6CF3 DD 6E FE      [19] 1789 	ld	l,-2 (ix)
   6CF6 DD 66 FF      [19] 1790 	ld	h,-1 (ix)
   6CF9 4E            [ 7] 1791 	ld	c,(hl)
   6CFA 06 00         [ 7] 1792 	ld	b,#0x00
   6CFC 21 E3 62      [10] 1793 	ld	hl, #(_prota + 0x0001) + 0
   6CFF 6E            [ 7] 1794 	ld	l,(hl)
   6D00 26 00         [ 7] 1795 	ld	h,#0x00
   6D02 79            [ 4] 1796 	ld	a,c
   6D03 95            [ 4] 1797 	sub	a, l
   6D04 4F            [ 4] 1798 	ld	c,a
   6D05 78            [ 4] 1799 	ld	a,b
   6D06 9C            [ 4] 1800 	sbc	a, h
   6D07 47            [ 4] 1801 	ld	b,a
   6D08 D5            [11] 1802 	push	de
   6D09 C5            [11] 1803 	push	bc
   6D0A CD A5 4B      [17] 1804 	call	_abs
   6D0D F1            [10] 1805 	pop	af
   6D0E D1            [10] 1806 	pop	de
                           1807 ;src/main.c:364: dist = difx + dify; // manhattan
   6D0F DD 4E FA      [19] 1808 	ld	c,-6 (ix)
   6D12 09            [11] 1809 	add	hl, bc
   6D13 DD 75 F9      [19] 1810 	ld	-7 (ix),l
                           1811 ;src/main.c:365: enemy->seen = NO;
   6D16 21 11 00      [10] 1812 	ld	hl,#0x0011
   6D19 19            [11] 1813 	add	hl,de
   6D1A DD 75 FC      [19] 1814 	ld	-4 (ix),l
   6D1D DD 74 FD      [19] 1815 	ld	-3 (ix),h
   6D20 DD 6E FC      [19] 1816 	ld	l,-4 (ix)
   6D23 DD 66 FD      [19] 1817 	ld	h,-3 (ix)
   6D26 36 00         [10] 1818 	ld	(hl),#0x00
                           1819 ;src/main.c:366: enemy->in_range = NO;
   6D28 21 10 00      [10] 1820 	ld	hl,#0x0010
   6D2B 19            [11] 1821 	add	hl,de
   6D2C 4D            [ 4] 1822 	ld	c,l
   6D2D 44            [ 4] 1823 	ld	b,h
   6D2E AF            [ 4] 1824 	xor	a, a
   6D2F 02            [ 7] 1825 	ld	(bc),a
                           1826 ;src/main.c:368: if(!enemy->seek){
   6D30 D5            [11] 1827 	push	de
   6D31 FD E1         [14] 1828 	pop	iy
   6D33 FD 7E 13      [19] 1829 	ld	a,19 (iy)
   6D36 B7            [ 4] 1830 	or	a, a
   6D37 C2 BD 6D      [10] 1831 	jp	NZ,00111$
                           1832 ;src/main.c:369: if (dist <= 17) {// te detectan los sensores de proximidad
   6D3A 3E 11         [ 7] 1833 	ld	a,#0x11
   6D3C DD 96 F9      [19] 1834 	sub	a, -7 (ix)
   6D3F 38 13         [12] 1835 	jr	C,00107$
                           1836 ;src/main.c:370: enemy->in_range = 1;
   6D41 3E 01         [ 7] 1837 	ld	a,#0x01
   6D43 02            [ 7] 1838 	ld	(bc),a
                           1839 ;src/main.c:371: enemy->engage = 1;
   6D44 21 15 00      [10] 1840 	ld	hl,#0x0015
   6D47 19            [11] 1841 	add	hl,de
   6D48 36 01         [10] 1842 	ld	(hl),#0x01
                           1843 ;src/main.c:372: enemy->seen = SI;
   6D4A DD 6E FC      [19] 1844 	ld	l,-4 (ix)
   6D4D DD 66 FD      [19] 1845 	ld	h,-3 (ix)
   6D50 36 01         [10] 1846 	ld	(hl),#0x01
   6D52 18 69         [12] 1847 	jr	00111$
   6D54                    1848 00107$:
                           1849 ;src/main.c:373: }else if(prota.x > enemy->x - 21 && prota.x < enemy->x + 21
   6D54 21 E2 62      [10] 1850 	ld	hl, #_prota + 0
   6D57 4E            [ 7] 1851 	ld	c,(hl)
   6D58 1A            [ 7] 1852 	ld	a,(de)
   6D59 5F            [ 4] 1853 	ld	e,a
   6D5A 16 00         [ 7] 1854 	ld	d,#0x00
   6D5C 7B            [ 4] 1855 	ld	a,e
   6D5D C6 EB         [ 7] 1856 	add	a,#0xEB
   6D5F 6F            [ 4] 1857 	ld	l,a
   6D60 7A            [ 4] 1858 	ld	a,d
   6D61 CE FF         [ 7] 1859 	adc	a,#0xFF
   6D63 67            [ 4] 1860 	ld	h,a
   6D64 06 00         [ 7] 1861 	ld	b,#0x00
   6D66 7D            [ 4] 1862 	ld	a,l
   6D67 91            [ 4] 1863 	sub	a, c
   6D68 7C            [ 4] 1864 	ld	a,h
   6D69 98            [ 4] 1865 	sbc	a, b
   6D6A E2 6F 6D      [10] 1866 	jp	PO, 00137$
   6D6D EE 80         [ 7] 1867 	xor	a, #0x80
   6D6F                    1868 00137$:
   6D6F F2 BD 6D      [10] 1869 	jp	P,00111$
   6D72 21 15 00      [10] 1870 	ld	hl,#0x0015
   6D75 19            [11] 1871 	add	hl,de
   6D76 79            [ 4] 1872 	ld	a,c
   6D77 95            [ 4] 1873 	sub	a, l
   6D78 78            [ 4] 1874 	ld	a,b
   6D79 9C            [ 4] 1875 	sbc	a, h
   6D7A E2 7F 6D      [10] 1876 	jp	PO, 00138$
   6D7D EE 80         [ 7] 1877 	xor	a, #0x80
   6D7F                    1878 00138$:
   6D7F F2 BD 6D      [10] 1879 	jp	P,00111$
                           1880 ;src/main.c:374: && prota.y > enemy->y - 21*2 && prota.y < enemy->y + 21*2){
   6D82 21 E3 62      [10] 1881 	ld	hl, #(_prota + 0x0001) + 0
   6D85 4E            [ 7] 1882 	ld	c,(hl)
   6D86 DD 6E FE      [19] 1883 	ld	l,-2 (ix)
   6D89 DD 66 FF      [19] 1884 	ld	h,-1 (ix)
   6D8C 5E            [ 7] 1885 	ld	e,(hl)
   6D8D 16 00         [ 7] 1886 	ld	d,#0x00
   6D8F 7B            [ 4] 1887 	ld	a,e
   6D90 C6 D6         [ 7] 1888 	add	a,#0xD6
   6D92 6F            [ 4] 1889 	ld	l,a
   6D93 7A            [ 4] 1890 	ld	a,d
   6D94 CE FF         [ 7] 1891 	adc	a,#0xFF
   6D96 67            [ 4] 1892 	ld	h,a
   6D97 06 00         [ 7] 1893 	ld	b,#0x00
   6D99 7D            [ 4] 1894 	ld	a,l
   6D9A 91            [ 4] 1895 	sub	a, c
   6D9B 7C            [ 4] 1896 	ld	a,h
   6D9C 98            [ 4] 1897 	sbc	a, b
   6D9D E2 A2 6D      [10] 1898 	jp	PO, 00139$
   6DA0 EE 80         [ 7] 1899 	xor	a, #0x80
   6DA2                    1900 00139$:
   6DA2 F2 BD 6D      [10] 1901 	jp	P,00111$
   6DA5 21 2A 00      [10] 1902 	ld	hl,#0x002A
   6DA8 19            [11] 1903 	add	hl,de
   6DA9 79            [ 4] 1904 	ld	a,c
   6DAA 95            [ 4] 1905 	sub	a, l
   6DAB 78            [ 4] 1906 	ld	a,b
   6DAC 9C            [ 4] 1907 	sbc	a, h
   6DAD E2 B2 6D      [10] 1908 	jp	PO, 00140$
   6DB0 EE 80         [ 7] 1909 	xor	a, #0x80
   6DB2                    1910 00140$:
   6DB2 F2 BD 6D      [10] 1911 	jp	P,00111$
                           1912 ;src/main.c:375: enemy->seen = SI;
   6DB5 DD 6E FC      [19] 1913 	ld	l,-4 (ix)
   6DB8 DD 66 FD      [19] 1914 	ld	h,-3 (ix)
   6DBB 36 01         [10] 1915 	ld	(hl),#0x01
   6DBD                    1916 00111$:
   6DBD DD F9         [10] 1917 	ld	sp, ix
   6DBF DD E1         [14] 1918 	pop	ix
   6DC1 C9            [10] 1919 	ret
                           1920 ;src/main.c:380: void moverEnemigoSeek(TEnemy* actual){
                           1921 ;	---------------------------------
                           1922 ; Function moverEnemigoSeek
                           1923 ; ---------------------------------
   6DC2                    1924 _moverEnemigoSeek::
   6DC2 DD E5         [15] 1925 	push	ix
   6DC4 DD 21 00 00   [14] 1926 	ld	ix,#0
   6DC8 DD 39         [15] 1927 	add	ix,sp
   6DCA 21 FA FF      [10] 1928 	ld	hl,#-6
   6DCD 39            [11] 1929 	add	hl,sp
   6DCE F9            [ 6] 1930 	ld	sp,hl
                           1931 ;src/main.c:382: if(!actual->muerto){
   6DCF DD 4E 04      [19] 1932 	ld	c,4 (ix)
   6DD2 DD 46 05      [19] 1933 	ld	b,5 (ix)
   6DD5 C5            [11] 1934 	push	bc
   6DD6 FD E1         [14] 1935 	pop	iy
   6DD8 FD 7E 08      [19] 1936 	ld	a,8 (iy)
   6DDB B7            [ 4] 1937 	or	a, a
   6DDC C2 DC 6E      [10] 1938 	jp	NZ,00109$
                           1939 ;src/main.c:385: if(actual->iter < actual->longitud_camino){
   6DDF 21 0D 00      [10] 1940 	ld	hl,#0x000D
   6DE2 09            [11] 1941 	add	hl,bc
   6DE3 EB            [ 4] 1942 	ex	de,hl
   6DE4 1A            [ 7] 1943 	ld	a,(de)
   6DE5 DD 77 FD      [19] 1944 	ld	-3 (ix),a
   6DE8 13            [ 6] 1945 	inc	de
   6DE9 1A            [ 7] 1946 	ld	a,(de)
   6DEA DD 77 FE      [19] 1947 	ld	-2 (ix),a
   6DED 1B            [ 6] 1948 	dec	de
   6DEE 69            [ 4] 1949 	ld	l, c
   6DEF 60            [ 4] 1950 	ld	h, b
   6DF0 C5            [11] 1951 	push	bc
   6DF1 01 E2 00      [10] 1952 	ld	bc, #0x00E2
   6DF4 09            [11] 1953 	add	hl, bc
   6DF5 C1            [10] 1954 	pop	bc
   6DF6 6E            [ 7] 1955 	ld	l,(hl)
   6DF7 26 00         [ 7] 1956 	ld	h,#0x00
                           1957 ;src/main.c:394: actual->y = actual->camino[actual->iter];
   6DF9 C5            [11] 1958 	push	bc
   6DFA FD E1         [14] 1959 	pop	iy
   6DFC FD 23         [10] 1960 	inc	iy
                           1961 ;src/main.c:385: if(actual->iter < actual->longitud_camino){
   6DFE DD 7E FD      [19] 1962 	ld	a,-3 (ix)
   6E01 95            [ 4] 1963 	sub	a, l
   6E02 DD 7E FE      [19] 1964 	ld	a,-2 (ix)
   6E05 9C            [ 4] 1965 	sbc	a, h
   6E06 E2 0B 6E      [10] 1966 	jp	PO, 00123$
   6E09 EE 80         [ 7] 1967 	xor	a, #0x80
   6E0B                    1968 00123$:
   6E0B F2 8A 6E      [10] 1969 	jp	P,00105$
                           1970 ;src/main.c:390: actual->mover = SI;
   6E0E 21 06 00      [10] 1971 	ld	hl,#0x0006
   6E11 09            [11] 1972 	add	hl,bc
                           1973 ;src/main.c:392: actual->x = actual->camino[actual->iter];
   6E12 79            [ 4] 1974 	ld	a,c
   6E13 C6 1A         [ 7] 1975 	add	a, #0x1A
   6E15 DD 77 FA      [19] 1976 	ld	-6 (ix),a
   6E18 78            [ 4] 1977 	ld	a,b
   6E19 CE 00         [ 7] 1978 	adc	a, #0x00
   6E1B DD 77 FB      [19] 1979 	ld	-5 (ix),a
                           1980 ;src/main.c:388: if(actual->iter == 0){
   6E1E DD 7E FE      [19] 1981 	ld	a,-2 (ix)
   6E21 DD B6 FD      [19] 1982 	or	a,-3 (ix)
   6E24 20 36         [12] 1983 	jr	NZ,00102$
                           1984 ;src/main.c:390: actual->mover = SI;
   6E26 36 01         [10] 1985 	ld	(hl),#0x01
                           1986 ;src/main.c:391: actual->iter = 2;
   6E28 6B            [ 4] 1987 	ld	l, e
   6E29 62            [ 4] 1988 	ld	h, d
   6E2A 36 02         [10] 1989 	ld	(hl),#0x02
   6E2C 23            [ 6] 1990 	inc	hl
   6E2D 36 00         [10] 1991 	ld	(hl),#0x00
                           1992 ;src/main.c:392: actual->x = actual->camino[actual->iter];
   6E2F 6B            [ 4] 1993 	ld	l, e
   6E30 62            [ 4] 1994 	ld	h, d
   6E31 7E            [ 7] 1995 	ld	a, (hl)
   6E32 23            [ 6] 1996 	inc	hl
   6E33 66            [ 7] 1997 	ld	h,(hl)
   6E34 6F            [ 4] 1998 	ld	l,a
   6E35 DD 7E FA      [19] 1999 	ld	a,-6 (ix)
   6E38 85            [ 4] 2000 	add	a, l
   6E39 6F            [ 4] 2001 	ld	l,a
   6E3A DD 7E FB      [19] 2002 	ld	a,-5 (ix)
   6E3D 8C            [ 4] 2003 	adc	a, h
   6E3E 67            [ 4] 2004 	ld	h,a
   6E3F 7E            [ 7] 2005 	ld	a,(hl)
   6E40 02            [ 7] 2006 	ld	(bc),a
                           2007 ;src/main.c:393: ++actual->iter;
   6E41 6B            [ 4] 2008 	ld	l, e
   6E42 62            [ 4] 2009 	ld	h, d
   6E43 4E            [ 7] 2010 	ld	c,(hl)
   6E44 23            [ 6] 2011 	inc	hl
   6E45 46            [ 7] 2012 	ld	b,(hl)
   6E46 03            [ 6] 2013 	inc	bc
   6E47 6B            [ 4] 2014 	ld	l, e
   6E48 62            [ 4] 2015 	ld	h, d
   6E49 71            [ 7] 2016 	ld	(hl),c
   6E4A 23            [ 6] 2017 	inc	hl
   6E4B 70            [ 7] 2018 	ld	(hl),b
                           2019 ;src/main.c:394: actual->y = actual->camino[actual->iter];
   6E4C E1            [10] 2020 	pop	hl
   6E4D E5            [11] 2021 	push	hl
   6E4E 09            [11] 2022 	add	hl,bc
   6E4F 6E            [ 7] 2023 	ld	l,(hl)
   6E50 FD 75 00      [19] 2024 	ld	0 (iy), l
                           2025 ;src/main.c:395: ++actual->iter;
   6E53 03            [ 6] 2026 	inc	bc
   6E54 79            [ 4] 2027 	ld	a,c
   6E55 12            [ 7] 2028 	ld	(de),a
   6E56 13            [ 6] 2029 	inc	de
   6E57 78            [ 4] 2030 	ld	a,b
   6E58 12            [ 7] 2031 	ld	(de),a
   6E59 C3 DC 6E      [10] 2032 	jp	00109$
   6E5C                    2033 00102$:
                           2034 ;src/main.c:398: actual->mover = SI;
   6E5C 36 01         [10] 2035 	ld	(hl),#0x01
                           2036 ;src/main.c:399: actual->x = actual->camino[actual->iter];
   6E5E 6B            [ 4] 2037 	ld	l, e
   6E5F 62            [ 4] 2038 	ld	h, d
   6E60 7E            [ 7] 2039 	ld	a, (hl)
   6E61 23            [ 6] 2040 	inc	hl
   6E62 66            [ 7] 2041 	ld	h,(hl)
   6E63 6F            [ 4] 2042 	ld	l,a
   6E64 DD 7E FA      [19] 2043 	ld	a,-6 (ix)
   6E67 85            [ 4] 2044 	add	a, l
   6E68 6F            [ 4] 2045 	ld	l,a
   6E69 DD 7E FB      [19] 2046 	ld	a,-5 (ix)
   6E6C 8C            [ 4] 2047 	adc	a, h
   6E6D 67            [ 4] 2048 	ld	h,a
   6E6E 7E            [ 7] 2049 	ld	a,(hl)
   6E6F 02            [ 7] 2050 	ld	(bc),a
                           2051 ;src/main.c:400: ++actual->iter;
   6E70 6B            [ 4] 2052 	ld	l, e
   6E71 62            [ 4] 2053 	ld	h, d
   6E72 4E            [ 7] 2054 	ld	c,(hl)
   6E73 23            [ 6] 2055 	inc	hl
   6E74 46            [ 7] 2056 	ld	b,(hl)
   6E75 03            [ 6] 2057 	inc	bc
   6E76 6B            [ 4] 2058 	ld	l, e
   6E77 62            [ 4] 2059 	ld	h, d
   6E78 71            [ 7] 2060 	ld	(hl),c
   6E79 23            [ 6] 2061 	inc	hl
   6E7A 70            [ 7] 2062 	ld	(hl),b
                           2063 ;src/main.c:401: actual->y = actual->camino[actual->iter];
   6E7B E1            [10] 2064 	pop	hl
   6E7C E5            [11] 2065 	push	hl
   6E7D 09            [11] 2066 	add	hl,bc
   6E7E 6E            [ 7] 2067 	ld	l,(hl)
   6E7F FD 75 00      [19] 2068 	ld	0 (iy), l
                           2069 ;src/main.c:402: ++actual->iter;
   6E82 03            [ 6] 2070 	inc	bc
   6E83 79            [ 4] 2071 	ld	a,c
   6E84 12            [ 7] 2072 	ld	(de),a
   6E85 13            [ 6] 2073 	inc	de
   6E86 78            [ 4] 2074 	ld	a,b
   6E87 12            [ 7] 2075 	ld	(de),a
   6E88 18 52         [12] 2076 	jr	00109$
   6E8A                    2077 00105$:
                           2078 ;src/main.c:408: actual->seek = 0;
   6E8A 21 13 00      [10] 2079 	ld	hl,#0x0013
   6E8D 09            [11] 2080 	add	hl,bc
   6E8E 36 00         [10] 2081 	ld	(hl),#0x00
                           2082 ;src/main.c:410: actual->patrolling = 1;
   6E90 21 0A 00      [10] 2083 	ld	hl,#0x000A
   6E93 09            [11] 2084 	add	hl,bc
   6E94 36 01         [10] 2085 	ld	(hl),#0x01
                           2086 ;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6E96 69            [ 4] 2087 	ld	l, c
   6E97 60            [ 4] 2088 	ld	h, b
   6E98 C5            [11] 2089 	push	bc
   6E99 01 18 00      [10] 2090 	ld	bc, #0x0018
   6E9C 09            [11] 2091 	add	hl, bc
   6E9D C1            [10] 2092 	pop	bc
   6E9E 7E            [ 7] 2093 	ld	a,(hl)
   6E9F DD 77 FA      [19] 2094 	ld	-6 (ix),a
   6EA2 69            [ 4] 2095 	ld	l, c
   6EA3 60            [ 4] 2096 	ld	h, b
   6EA4 C5            [11] 2097 	push	bc
   6EA5 01 17 00      [10] 2098 	ld	bc, #0x0017
   6EA8 09            [11] 2099 	add	hl, bc
   6EA9 C1            [10] 2100 	pop	bc
   6EAA 7E            [ 7] 2101 	ld	a,(hl)
   6EAB DD 77 FD      [19] 2102 	ld	-3 (ix),a
   6EAE FD 7E 00      [19] 2103 	ld	a, 0 (iy)
   6EB1 DD 77 FC      [19] 2104 	ld	-4 (ix),a
   6EB4 0A            [ 7] 2105 	ld	a,(bc)
   6EB5 DD 77 FF      [19] 2106 	ld	-1 (ix),a
   6EB8 D5            [11] 2107 	push	de
   6EB9 2A F9 62      [16] 2108 	ld	hl,(_mapa)
   6EBC E5            [11] 2109 	push	hl
   6EBD C5            [11] 2110 	push	bc
   6EBE DD 66 FA      [19] 2111 	ld	h,-6 (ix)
   6EC1 DD 6E FD      [19] 2112 	ld	l,-3 (ix)
   6EC4 E5            [11] 2113 	push	hl
   6EC5 DD 66 FC      [19] 2114 	ld	h,-4 (ix)
   6EC8 DD 6E FF      [19] 2115 	ld	l,-1 (ix)
   6ECB E5            [11] 2116 	push	hl
   6ECC CD 62 49      [17] 2117 	call	_pathFinding
   6ECF 21 08 00      [10] 2118 	ld	hl,#8
   6ED2 39            [11] 2119 	add	hl,sp
   6ED3 F9            [ 6] 2120 	ld	sp,hl
   6ED4 D1            [10] 2121 	pop	de
                           2122 ;src/main.c:414: actual->iter = 0;
   6ED5 3E 00         [ 7] 2123 	ld	a,#0x00
   6ED7 12            [ 7] 2124 	ld	(de),a
   6ED8 13            [ 6] 2125 	inc	de
   6ED9 3E 00         [ 7] 2126 	ld	a,#0x00
   6EDB 12            [ 7] 2127 	ld	(de),a
   6EDC                    2128 00109$:
   6EDC DD F9         [10] 2129 	ld	sp, ix
   6EDE DD E1         [14] 2130 	pop	ix
   6EE0 C9            [10] 2131 	ret
                           2132 ;src/main.c:420: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2133 ;	---------------------------------
                           2134 ; Function engage
                           2135 ; ---------------------------------
   6EE1                    2136 _engage::
   6EE1 DD E5         [15] 2137 	push	ix
   6EE3 DD 21 00 00   [14] 2138 	ld	ix,#0
   6EE7 DD 39         [15] 2139 	add	ix,sp
   6EE9 21 F0 FF      [10] 2140 	ld	hl,#-16
   6EEC 39            [11] 2141 	add	hl,sp
   6EED F9            [ 6] 2142 	ld	sp,hl
                           2143 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6EEE DD 7E 04      [19] 2144 	ld	a,4 (ix)
   6EF1 DD 77 F4      [19] 2145 	ld	-12 (ix),a
   6EF4 DD 7E 05      [19] 2146 	ld	a,5 (ix)
   6EF7 DD 77 F5      [19] 2147 	ld	-11 (ix),a
   6EFA DD 6E F4      [19] 2148 	ld	l,-12 (ix)
   6EFD DD 66 F5      [19] 2149 	ld	h,-11 (ix)
   6F00 4E            [ 7] 2150 	ld	c,(hl)
   6F01 06 00         [ 7] 2151 	ld	b,#0x00
   6F03 21 E2 62      [10] 2152 	ld	hl,#_prota+0
   6F06 5E            [ 7] 2153 	ld	e,(hl)
   6F07 16 00         [ 7] 2154 	ld	d,#0x00
   6F09 79            [ 4] 2155 	ld	a,c
   6F0A 93            [ 4] 2156 	sub	a, e
   6F0B 4F            [ 4] 2157 	ld	c,a
   6F0C 78            [ 4] 2158 	ld	a,b
   6F0D 9A            [ 4] 2159 	sbc	a, d
   6F0E 47            [ 4] 2160 	ld	b,a
   6F0F C5            [11] 2161 	push	bc
   6F10 CD A5 4B      [17] 2162 	call	_abs
   6F13 F1            [10] 2163 	pop	af
   6F14 4D            [ 4] 2164 	ld	c,l
                           2165 ;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
   6F15 DD 7E F4      [19] 2166 	ld	a,-12 (ix)
   6F18 C6 01         [ 7] 2167 	add	a, #0x01
   6F1A DD 77 F6      [19] 2168 	ld	-10 (ix),a
   6F1D DD 7E F5      [19] 2169 	ld	a,-11 (ix)
   6F20 CE 00         [ 7] 2170 	adc	a, #0x00
   6F22 DD 77 F7      [19] 2171 	ld	-9 (ix),a
   6F25 DD 6E F6      [19] 2172 	ld	l,-10 (ix)
   6F28 DD 66 F7      [19] 2173 	ld	h,-9 (ix)
   6F2B 5E            [ 7] 2174 	ld	e,(hl)
   6F2C 16 00         [ 7] 2175 	ld	d,#0x00
   6F2E 21 E3 62      [10] 2176 	ld	hl, #_prota + 1
   6F31 6E            [ 7] 2177 	ld	l,(hl)
   6F32 26 00         [ 7] 2178 	ld	h,#0x00
   6F34 7B            [ 4] 2179 	ld	a,e
   6F35 95            [ 4] 2180 	sub	a, l
   6F36 5F            [ 4] 2181 	ld	e,a
   6F37 7A            [ 4] 2182 	ld	a,d
   6F38 9C            [ 4] 2183 	sbc	a, h
   6F39 57            [ 4] 2184 	ld	d,a
   6F3A C5            [11] 2185 	push	bc
   6F3B D5            [11] 2186 	push	de
   6F3C CD A5 4B      [17] 2187 	call	_abs
   6F3F F1            [10] 2188 	pop	af
   6F40 C1            [10] 2189 	pop	bc
                           2190 ;src/main.c:423: u8 dist = difx + dify; // manhattan
   6F41 09            [11] 2191 	add	hl, bc
   6F42 DD 75 F2      [19] 2192 	ld	-14 (ix),l
                           2193 ;src/main.c:425: u8 movX = 0;
   6F45 DD 36 F1 00   [19] 2194 	ld	-15 (ix),#0x00
                           2195 ;src/main.c:426: u8 movY = 0;
   6F49 DD 36 F0 00   [19] 2196 	ld	-16 (ix),#0x00
                           2197 ;src/main.c:427: u8 distConstraint = 25;
   6F4D DD 36 F3 19   [19] 2198 	ld	-13 (ix),#0x19
                           2199 ;src/main.c:428: enemy->mover = NO;
   6F51 DD 7E F4      [19] 2200 	ld	a,-12 (ix)
   6F54 C6 06         [ 7] 2201 	add	a, #0x06
   6F56 DD 77 F8      [19] 2202 	ld	-8 (ix),a
   6F59 DD 7E F5      [19] 2203 	ld	a,-11 (ix)
   6F5C CE 00         [ 7] 2204 	adc	a, #0x00
   6F5E DD 77 F9      [19] 2205 	ld	-7 (ix),a
   6F61 DD 6E F8      [19] 2206 	ld	l,-8 (ix)
   6F64 DD 66 F9      [19] 2207 	ld	h,-7 (ix)
   6F67 36 00         [10] 2208 	ld	(hl),#0x00
                           2209 ;src/main.c:438: enemy->didDamage = 1;
   6F69 DD 7E F4      [19] 2210 	ld	a,-12 (ix)
   6F6C C6 16         [ 7] 2211 	add	a, #0x16
   6F6E 4F            [ 4] 2212 	ld	c,a
   6F6F DD 7E F5      [19] 2213 	ld	a,-11 (ix)
   6F72 CE 00         [ 7] 2214 	adc	a, #0x00
   6F74 47            [ 4] 2215 	ld	b,a
                           2216 ;src/main.c:430: if (dist < 20) {
   6F75 DD 7E F2      [19] 2217 	ld	a,-14 (ix)
   6F78 D6 14         [ 7] 2218 	sub	a, #0x14
   6F7A 30 32         [12] 2219 	jr	NC,00107$
                           2220 ;src/main.c:431: vidas--;
   6F7C 21 FE 62      [10] 2221 	ld	hl, #_vidas+0
   6F7F 35            [11] 2222 	dec	(hl)
                           2223 ;src/main.c:432: if(vidas % 20 == 0){
   6F80 C5            [11] 2224 	push	bc
   6F81 3E 14         [ 7] 2225 	ld	a,#0x14
   6F83 F5            [11] 2226 	push	af
   6F84 33            [ 6] 2227 	inc	sp
   6F85 3A FE 62      [13] 2228 	ld	a,(_vidas)
   6F88 F5            [11] 2229 	push	af
   6F89 33            [ 6] 2230 	inc	sp
   6F8A CD FD 54      [17] 2231 	call	__moduchar
   6F8D F1            [10] 2232 	pop	af
   6F8E C1            [10] 2233 	pop	bc
   6F8F 7D            [ 4] 2234 	ld	a,l
   6F90 B7            [ 4] 2235 	or	a, a
   6F91 20 18         [12] 2236 	jr	NZ,00105$
                           2237 ;src/main.c:433: if (vidas == 0) {
   6F93 3A FE 62      [13] 2238 	ld	a,(#_vidas + 0)
   6F96 B7            [ 4] 2239 	or	a, a
   6F97 20 07         [12] 2240 	jr	NZ,00102$
                           2241 ;src/main.c:434: endGame = 1;
   6F99 21 FC 62      [10] 2242 	ld	hl,#_endGame + 0
   6F9C 36 01         [10] 2243 	ld	(hl), #0x01
   6F9E 18 0B         [12] 2244 	jr	00105$
   6FA0                    2245 00102$:
                           2246 ;src/main.c:436: modificarVidas(vidas);
   6FA0 C5            [11] 2247 	push	bc
   6FA1 3A FE 62      [13] 2248 	ld	a,(_vidas)
   6FA4 F5            [11] 2249 	push	af
   6FA5 33            [ 6] 2250 	inc	sp
   6FA6 CD B4 51      [17] 2251 	call	_modificarVidas
   6FA9 33            [ 6] 2252 	inc	sp
   6FAA C1            [10] 2253 	pop	bc
   6FAB                    2254 00105$:
                           2255 ;src/main.c:438: enemy->didDamage = 1;
   6FAB 3E 01         [ 7] 2256 	ld	a,#0x01
   6FAD 02            [ 7] 2257 	ld	(bc),a
   6FAE                    2258 00107$:
                           2259 ;src/main.c:440: if (!enemy->didDamage) {
   6FAE 0A            [ 7] 2260 	ld	a,(bc)
   6FAF B7            [ 4] 2261 	or	a, a
   6FB0 C2 E6 76      [10] 2262 	jp	NZ,00208$
                           2263 ;src/main.c:441: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   6FB3 DD 6E F6      [19] 2264 	ld	l,-10 (ix)
   6FB6 DD 66 F7      [19] 2265 	ld	h,-9 (ix)
   6FB9 4E            [ 7] 2266 	ld	c,(hl)
                           2267 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6FBA DD 6E F4      [19] 2268 	ld	l,-12 (ix)
   6FBD DD 66 F5      [19] 2269 	ld	h,-11 (ix)
   6FC0 7E            [ 7] 2270 	ld	a,(hl)
                           2271 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   6FC1 DD 77 FA      [19] 2272 	ld	-6 (ix), a
   6FC4 C6 04         [ 7] 2273 	add	a, #0x04
   6FC6 DD 77 FB      [19] 2274 	ld	-5 (ix),a
                           2275 ;src/main.c:441: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   6FC9 DD 7E 07      [19] 2276 	ld	a,7 (ix)
   6FCC 91            [ 4] 2277 	sub	a, c
   6FCD 28 35         [12] 2278 	jr	Z,00201$
   6FCF DD 5E 07      [19] 2279 	ld	e,7 (ix)
   6FD2 16 00         [ 7] 2280 	ld	d,#0x00
   6FD4 21 01 00      [10] 2281 	ld	hl,#0x0001
   6FD7 19            [11] 2282 	add	hl,de
   6FD8 DD 75 FC      [19] 2283 	ld	-4 (ix),l
   6FDB DD 74 FD      [19] 2284 	ld	-3 (ix),h
   6FDE DD 71 FE      [19] 2285 	ld	-2 (ix),c
   6FE1 DD 36 FF 00   [19] 2286 	ld	-1 (ix),#0x00
   6FE5 DD 7E FC      [19] 2287 	ld	a,-4 (ix)
   6FE8 DD 96 FE      [19] 2288 	sub	a, -2 (ix)
   6FEB 20 08         [12] 2289 	jr	NZ,00447$
   6FED DD 7E FD      [19] 2290 	ld	a,-3 (ix)
   6FF0 DD 96 FF      [19] 2291 	sub	a, -1 (ix)
   6FF3 28 0F         [12] 2292 	jr	Z,00201$
   6FF5                    2293 00447$:
   6FF5 1B            [ 6] 2294 	dec	de
   6FF6 DD 7E FE      [19] 2295 	ld	a,-2 (ix)
   6FF9 93            [ 4] 2296 	sub	a, e
   6FFA C2 11 71      [10] 2297 	jp	NZ,00202$
   6FFD DD 7E FF      [19] 2298 	ld	a,-1 (ix)
   7000 92            [ 4] 2299 	sub	a, d
   7001 C2 11 71      [10] 2300 	jp	NZ,00202$
   7004                    2301 00201$:
                           2302 ;src/main.c:442: if (dx < enemy->x) { // izquierda
   7004 DD 7E 06      [19] 2303 	ld	a,6 (ix)
   7007 DD 96 FA      [19] 2304 	sub	a, -6 (ix)
   700A D2 8D 70      [10] 2305 	jp	NC,00121$
                           2306 ;src/main.c:443: if (dist > 11) {
   700D 3E 0B         [ 7] 2307 	ld	a,#0x0B
   700F DD 96 F2      [19] 2308 	sub	a, -14 (ix)
   7012 D2 E6 76      [10] 2309 	jp	NC,00208$
                           2310 ;src/main.c:444: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7015 79            [ 4] 2311 	ld	a,c
   7016 F5            [11] 2312 	push	af
   7017 33            [ 6] 2313 	inc	sp
   7018 DD 7E FA      [19] 2314 	ld	a,-6 (ix)
   701B F5            [11] 2315 	push	af
   701C 33            [ 6] 2316 	inc	sp
   701D 2A F9 62      [16] 2317 	ld	hl,(_mapa)
   7020 E5            [11] 2318 	push	hl
   7021 CD 61 4B      [17] 2319 	call	_getTilePtr
   7024 F1            [10] 2320 	pop	af
   7025 F1            [10] 2321 	pop	af
   7026 4E            [ 7] 2322 	ld	c,(hl)
   7027 3E 02         [ 7] 2323 	ld	a,#0x02
   7029 91            [ 4] 2324 	sub	a, c
   702A DA E6 76      [10] 2325 	jp	C,00208$
                           2326 ;src/main.c:445: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   702D DD 6E F6      [19] 2327 	ld	l,-10 (ix)
   7030 DD 66 F7      [19] 2328 	ld	h,-9 (ix)
   7033 7E            [ 7] 2329 	ld	a,(hl)
   7034 C6 0B         [ 7] 2330 	add	a, #0x0B
   7036 57            [ 4] 2331 	ld	d,a
   7037 DD 6E F4      [19] 2332 	ld	l,-12 (ix)
   703A DD 66 F5      [19] 2333 	ld	h,-11 (ix)
   703D 46            [ 7] 2334 	ld	b,(hl)
   703E D5            [11] 2335 	push	de
   703F 33            [ 6] 2336 	inc	sp
   7040 C5            [11] 2337 	push	bc
   7041 33            [ 6] 2338 	inc	sp
   7042 2A F9 62      [16] 2339 	ld	hl,(_mapa)
   7045 E5            [11] 2340 	push	hl
   7046 CD 61 4B      [17] 2341 	call	_getTilePtr
   7049 F1            [10] 2342 	pop	af
   704A F1            [10] 2343 	pop	af
   704B 4E            [ 7] 2344 	ld	c,(hl)
   704C 3E 02         [ 7] 2345 	ld	a,#0x02
   704E 91            [ 4] 2346 	sub	a, c
   704F DA E6 76      [10] 2347 	jp	C,00208$
                           2348 ;src/main.c:446: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7052 DD 6E F6      [19] 2349 	ld	l,-10 (ix)
   7055 DD 66 F7      [19] 2350 	ld	h,-9 (ix)
   7058 7E            [ 7] 2351 	ld	a,(hl)
   7059 C6 16         [ 7] 2352 	add	a, #0x16
   705B 57            [ 4] 2353 	ld	d,a
   705C DD 6E F4      [19] 2354 	ld	l,-12 (ix)
   705F DD 66 F5      [19] 2355 	ld	h,-11 (ix)
   7062 46            [ 7] 2356 	ld	b,(hl)
   7063 D5            [11] 2357 	push	de
   7064 33            [ 6] 2358 	inc	sp
   7065 C5            [11] 2359 	push	bc
   7066 33            [ 6] 2360 	inc	sp
   7067 2A F9 62      [16] 2361 	ld	hl,(_mapa)
   706A E5            [11] 2362 	push	hl
   706B CD 61 4B      [17] 2363 	call	_getTilePtr
   706E F1            [10] 2364 	pop	af
   706F F1            [10] 2365 	pop	af
   7070 4E            [ 7] 2366 	ld	c,(hl)
   7071 3E 02         [ 7] 2367 	ld	a,#0x02
   7073 91            [ 4] 2368 	sub	a, c
   7074 DA E6 76      [10] 2369 	jp	C,00208$
                           2370 ;src/main.c:447: moverEnemigoIzquierda(enemy);
   7077 DD 6E F4      [19] 2371 	ld	l,-12 (ix)
   707A DD 66 F5      [19] 2372 	ld	h,-11 (ix)
   707D E5            [11] 2373 	push	hl
   707E CD 5E 6A      [17] 2374 	call	_moverEnemigoIzquierda
   7081 F1            [10] 2375 	pop	af
                           2376 ;src/main.c:449: enemy->mover = SI;
   7082 DD 6E F8      [19] 2377 	ld	l,-8 (ix)
   7085 DD 66 F9      [19] 2378 	ld	h,-7 (ix)
   7088 36 01         [10] 2379 	ld	(hl),#0x01
   708A C3 E6 76      [10] 2380 	jp	00208$
   708D                    2381 00121$:
                           2382 ;src/main.c:453: if (dist > G_ENEMY_W + 3) {
   708D 3E 07         [ 7] 2383 	ld	a,#0x07
   708F DD 96 F2      [19] 2384 	sub	a, -14 (ix)
   7092 D2 E6 76      [10] 2385 	jp	NC,00208$
                           2386 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7095 79            [ 4] 2387 	ld	a,c
   7096 F5            [11] 2388 	push	af
   7097 33            [ 6] 2389 	inc	sp
   7098 DD 7E FB      [19] 2390 	ld	a,-5 (ix)
   709B F5            [11] 2391 	push	af
   709C 33            [ 6] 2392 	inc	sp
   709D 2A F9 62      [16] 2393 	ld	hl,(_mapa)
   70A0 E5            [11] 2394 	push	hl
   70A1 CD 61 4B      [17] 2395 	call	_getTilePtr
   70A4 F1            [10] 2396 	pop	af
   70A5 F1            [10] 2397 	pop	af
   70A6 4E            [ 7] 2398 	ld	c,(hl)
   70A7 3E 02         [ 7] 2399 	ld	a,#0x02
   70A9 91            [ 4] 2400 	sub	a, c
   70AA DA E6 76      [10] 2401 	jp	C,00208$
                           2402 ;src/main.c:455: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   70AD DD 6E F6      [19] 2403 	ld	l,-10 (ix)
   70B0 DD 66 F7      [19] 2404 	ld	h,-9 (ix)
   70B3 7E            [ 7] 2405 	ld	a,(hl)
   70B4 C6 0B         [ 7] 2406 	add	a, #0x0B
   70B6 47            [ 4] 2407 	ld	b,a
   70B7 DD 6E F4      [19] 2408 	ld	l,-12 (ix)
   70BA DD 66 F5      [19] 2409 	ld	h,-11 (ix)
   70BD 7E            [ 7] 2410 	ld	a,(hl)
   70BE C6 04         [ 7] 2411 	add	a, #0x04
   70C0 C5            [11] 2412 	push	bc
   70C1 33            [ 6] 2413 	inc	sp
   70C2 F5            [11] 2414 	push	af
   70C3 33            [ 6] 2415 	inc	sp
   70C4 2A F9 62      [16] 2416 	ld	hl,(_mapa)
   70C7 E5            [11] 2417 	push	hl
   70C8 CD 61 4B      [17] 2418 	call	_getTilePtr
   70CB F1            [10] 2419 	pop	af
   70CC F1            [10] 2420 	pop	af
   70CD 4E            [ 7] 2421 	ld	c,(hl)
   70CE 3E 02         [ 7] 2422 	ld	a,#0x02
   70D0 91            [ 4] 2423 	sub	a, c
   70D1 DA E6 76      [10] 2424 	jp	C,00208$
                           2425 ;src/main.c:456: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   70D4 DD 6E F6      [19] 2426 	ld	l,-10 (ix)
   70D7 DD 66 F7      [19] 2427 	ld	h,-9 (ix)
   70DA 7E            [ 7] 2428 	ld	a,(hl)
   70DB C6 16         [ 7] 2429 	add	a, #0x16
   70DD 47            [ 4] 2430 	ld	b,a
   70DE DD 6E F4      [19] 2431 	ld	l,-12 (ix)
   70E1 DD 66 F5      [19] 2432 	ld	h,-11 (ix)
   70E4 7E            [ 7] 2433 	ld	a,(hl)
   70E5 C6 04         [ 7] 2434 	add	a, #0x04
   70E7 C5            [11] 2435 	push	bc
   70E8 33            [ 6] 2436 	inc	sp
   70E9 F5            [11] 2437 	push	af
   70EA 33            [ 6] 2438 	inc	sp
   70EB 2A F9 62      [16] 2439 	ld	hl,(_mapa)
   70EE E5            [11] 2440 	push	hl
   70EF CD 61 4B      [17] 2441 	call	_getTilePtr
   70F2 F1            [10] 2442 	pop	af
   70F3 F1            [10] 2443 	pop	af
   70F4 4E            [ 7] 2444 	ld	c,(hl)
   70F5 3E 02         [ 7] 2445 	ld	a,#0x02
   70F7 91            [ 4] 2446 	sub	a, c
   70F8 DA E6 76      [10] 2447 	jp	C,00208$
                           2448 ;src/main.c:457: moverEnemigoDerecha(enemy);
   70FB DD 6E F4      [19] 2449 	ld	l,-12 (ix)
   70FE DD 66 F5      [19] 2450 	ld	h,-11 (ix)
   7101 E5            [11] 2451 	push	hl
   7102 CD 4E 6A      [17] 2452 	call	_moverEnemigoDerecha
   7105 F1            [10] 2453 	pop	af
                           2454 ;src/main.c:459: enemy->mover = SI;
   7106 DD 6E F8      [19] 2455 	ld	l,-8 (ix)
   7109 DD 66 F9      [19] 2456 	ld	h,-7 (ix)
   710C 36 01         [10] 2457 	ld	(hl),#0x01
   710E C3 E6 76      [10] 2458 	jp	00208$
   7111                    2459 00202$:
                           2460 ;src/main.c:464: else if (enemy->x == dx) {
   7111 DD 7E FA      [19] 2461 	ld	a,-6 (ix)
   7114 DD 96 06      [19] 2462 	sub	a, 6 (ix)
   7117 C2 2C 72      [10] 2463 	jp	NZ,00199$
                           2464 ;src/main.c:465: if (dy < enemy->y) {
   711A DD 7E 07      [19] 2465 	ld	a,7 (ix)
   711D 91            [ 4] 2466 	sub	a, c
   711E D2 A5 71      [10] 2467 	jp	NC,00136$
                           2468 ;src/main.c:466: if (dist > G_HERO_H + 5) {
   7121 3E 1B         [ 7] 2469 	ld	a,#0x1B
   7123 DD 96 F2      [19] 2470 	sub	a, -14 (ix)
   7126 D2 E6 76      [10] 2471 	jp	NC,00208$
                           2472 ;src/main.c:467: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7129 41            [ 4] 2473 	ld	b,c
   712A 05            [ 4] 2474 	dec	b
   712B 05            [ 4] 2475 	dec	b
   712C C5            [11] 2476 	push	bc
   712D 33            [ 6] 2477 	inc	sp
   712E DD 7E FA      [19] 2478 	ld	a,-6 (ix)
   7131 F5            [11] 2479 	push	af
   7132 33            [ 6] 2480 	inc	sp
   7133 2A F9 62      [16] 2481 	ld	hl,(_mapa)
   7136 E5            [11] 2482 	push	hl
   7137 CD 61 4B      [17] 2483 	call	_getTilePtr
   713A F1            [10] 2484 	pop	af
   713B F1            [10] 2485 	pop	af
   713C 4E            [ 7] 2486 	ld	c,(hl)
   713D 3E 02         [ 7] 2487 	ld	a,#0x02
   713F 91            [ 4] 2488 	sub	a, c
   7140 DA E6 76      [10] 2489 	jp	C,00208$
                           2490 ;src/main.c:468: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7143 DD 6E F6      [19] 2491 	ld	l,-10 (ix)
   7146 DD 66 F7      [19] 2492 	ld	h,-9 (ix)
   7149 56            [ 7] 2493 	ld	d,(hl)
   714A 15            [ 4] 2494 	dec	d
   714B 15            [ 4] 2495 	dec	d
   714C DD 6E F4      [19] 2496 	ld	l,-12 (ix)
   714F DD 66 F5      [19] 2497 	ld	h,-11 (ix)
   7152 46            [ 7] 2498 	ld	b,(hl)
   7153 04            [ 4] 2499 	inc	b
   7154 04            [ 4] 2500 	inc	b
   7155 D5            [11] 2501 	push	de
   7156 33            [ 6] 2502 	inc	sp
   7157 C5            [11] 2503 	push	bc
   7158 33            [ 6] 2504 	inc	sp
   7159 2A F9 62      [16] 2505 	ld	hl,(_mapa)
   715C E5            [11] 2506 	push	hl
   715D CD 61 4B      [17] 2507 	call	_getTilePtr
   7160 F1            [10] 2508 	pop	af
   7161 F1            [10] 2509 	pop	af
   7162 4E            [ 7] 2510 	ld	c,(hl)
   7163 3E 02         [ 7] 2511 	ld	a,#0x02
   7165 91            [ 4] 2512 	sub	a, c
   7166 DA E6 76      [10] 2513 	jp	C,00208$
                           2514 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7169 DD 6E F6      [19] 2515 	ld	l,-10 (ix)
   716C DD 66 F7      [19] 2516 	ld	h,-9 (ix)
   716F 46            [ 7] 2517 	ld	b,(hl)
   7170 05            [ 4] 2518 	dec	b
   7171 05            [ 4] 2519 	dec	b
   7172 DD 6E F4      [19] 2520 	ld	l,-12 (ix)
   7175 DD 66 F5      [19] 2521 	ld	h,-11 (ix)
   7178 7E            [ 7] 2522 	ld	a,(hl)
   7179 C6 04         [ 7] 2523 	add	a, #0x04
   717B C5            [11] 2524 	push	bc
   717C 33            [ 6] 2525 	inc	sp
   717D F5            [11] 2526 	push	af
   717E 33            [ 6] 2527 	inc	sp
   717F 2A F9 62      [16] 2528 	ld	hl,(_mapa)
   7182 E5            [11] 2529 	push	hl
   7183 CD 61 4B      [17] 2530 	call	_getTilePtr
   7186 F1            [10] 2531 	pop	af
   7187 F1            [10] 2532 	pop	af
   7188 4E            [ 7] 2533 	ld	c,(hl)
   7189 3E 02         [ 7] 2534 	ld	a,#0x02
   718B 91            [ 4] 2535 	sub	a, c
   718C DA E6 76      [10] 2536 	jp	C,00208$
                           2537 ;src/main.c:470: moverEnemigoArriba(enemy);
   718F DD 6E F4      [19] 2538 	ld	l,-12 (ix)
   7192 DD 66 F5      [19] 2539 	ld	h,-11 (ix)
   7195 E5            [11] 2540 	push	hl
   7196 CD 10 6A      [17] 2541 	call	_moverEnemigoArriba
   7199 F1            [10] 2542 	pop	af
                           2543 ;src/main.c:472: enemy->mover = SI;
   719A DD 6E F8      [19] 2544 	ld	l,-8 (ix)
   719D DD 66 F9      [19] 2545 	ld	h,-7 (ix)
   71A0 36 01         [10] 2546 	ld	(hl),#0x01
   71A2 C3 E6 76      [10] 2547 	jp	00208$
   71A5                    2548 00136$:
                           2549 ;src/main.c:476: if(dist > G_ENEMY_H + 7) {
   71A5 3E 1D         [ 7] 2550 	ld	a,#0x1D
   71A7 DD 96 F2      [19] 2551 	sub	a, -14 (ix)
   71AA D2 E6 76      [10] 2552 	jp	NC,00208$
                           2553 ;src/main.c:477: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   71AD 79            [ 4] 2554 	ld	a,c
   71AE C6 18         [ 7] 2555 	add	a, #0x18
   71B0 47            [ 4] 2556 	ld	b,a
   71B1 C5            [11] 2557 	push	bc
   71B2 33            [ 6] 2558 	inc	sp
   71B3 DD 7E FA      [19] 2559 	ld	a,-6 (ix)
   71B6 F5            [11] 2560 	push	af
   71B7 33            [ 6] 2561 	inc	sp
   71B8 2A F9 62      [16] 2562 	ld	hl,(_mapa)
   71BB E5            [11] 2563 	push	hl
   71BC CD 61 4B      [17] 2564 	call	_getTilePtr
   71BF F1            [10] 2565 	pop	af
   71C0 F1            [10] 2566 	pop	af
   71C1 4E            [ 7] 2567 	ld	c,(hl)
   71C2 3E 02         [ 7] 2568 	ld	a,#0x02
   71C4 91            [ 4] 2569 	sub	a, c
   71C5 DA E6 76      [10] 2570 	jp	C,00208$
                           2571 ;src/main.c:478: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   71C8 DD 6E F6      [19] 2572 	ld	l,-10 (ix)
   71CB DD 66 F7      [19] 2573 	ld	h,-9 (ix)
   71CE 7E            [ 7] 2574 	ld	a,(hl)
   71CF C6 18         [ 7] 2575 	add	a, #0x18
   71D1 57            [ 4] 2576 	ld	d,a
   71D2 DD 6E F4      [19] 2577 	ld	l,-12 (ix)
   71D5 DD 66 F5      [19] 2578 	ld	h,-11 (ix)
   71D8 46            [ 7] 2579 	ld	b,(hl)
   71D9 04            [ 4] 2580 	inc	b
   71DA 04            [ 4] 2581 	inc	b
   71DB D5            [11] 2582 	push	de
   71DC 33            [ 6] 2583 	inc	sp
   71DD C5            [11] 2584 	push	bc
   71DE 33            [ 6] 2585 	inc	sp
   71DF 2A F9 62      [16] 2586 	ld	hl,(_mapa)
   71E2 E5            [11] 2587 	push	hl
   71E3 CD 61 4B      [17] 2588 	call	_getTilePtr
   71E6 F1            [10] 2589 	pop	af
   71E7 F1            [10] 2590 	pop	af
   71E8 4E            [ 7] 2591 	ld	c,(hl)
   71E9 3E 02         [ 7] 2592 	ld	a,#0x02
   71EB 91            [ 4] 2593 	sub	a, c
   71EC DA E6 76      [10] 2594 	jp	C,00208$
                           2595 ;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   71EF DD 6E F6      [19] 2596 	ld	l,-10 (ix)
   71F2 DD 66 F7      [19] 2597 	ld	h,-9 (ix)
   71F5 7E            [ 7] 2598 	ld	a,(hl)
   71F6 C6 18         [ 7] 2599 	add	a, #0x18
   71F8 47            [ 4] 2600 	ld	b,a
   71F9 DD 6E F4      [19] 2601 	ld	l,-12 (ix)
   71FC DD 66 F5      [19] 2602 	ld	h,-11 (ix)
   71FF 7E            [ 7] 2603 	ld	a,(hl)
   7200 C6 04         [ 7] 2604 	add	a, #0x04
   7202 C5            [11] 2605 	push	bc
   7203 33            [ 6] 2606 	inc	sp
   7204 F5            [11] 2607 	push	af
   7205 33            [ 6] 2608 	inc	sp
   7206 2A F9 62      [16] 2609 	ld	hl,(_mapa)
   7209 E5            [11] 2610 	push	hl
   720A CD 61 4B      [17] 2611 	call	_getTilePtr
   720D F1            [10] 2612 	pop	af
   720E F1            [10] 2613 	pop	af
   720F 4E            [ 7] 2614 	ld	c,(hl)
   7210 3E 02         [ 7] 2615 	ld	a,#0x02
   7212 91            [ 4] 2616 	sub	a, c
   7213 DA E6 76      [10] 2617 	jp	C,00208$
                           2618 ;src/main.c:480: moverEnemigoAbajo(enemy);
   7216 DD 6E F4      [19] 2619 	ld	l,-12 (ix)
   7219 DD 66 F5      [19] 2620 	ld	h,-11 (ix)
   721C E5            [11] 2621 	push	hl
   721D CD 2F 6A      [17] 2622 	call	_moverEnemigoAbajo
   7220 F1            [10] 2623 	pop	af
                           2624 ;src/main.c:482: enemy->mover = SI;
   7221 DD 6E F8      [19] 2625 	ld	l,-8 (ix)
   7224 DD 66 F9      [19] 2626 	ld	h,-7 (ix)
   7227 36 01         [10] 2627 	ld	(hl),#0x01
   7229 C3 E6 76      [10] 2628 	jp	00208$
   722C                    2629 00199$:
                           2630 ;src/main.c:488: if (!prota.mover) distConstraint = 20; // ajuste en parado
   722C 3A E8 62      [13] 2631 	ld	a, (#_prota + 6)
   722F B7            [ 4] 2632 	or	a, a
   7230 20 04         [12] 2633 	jr	NZ,00139$
   7232 DD 36 F3 14   [19] 2634 	ld	-13 (ix),#0x14
   7236                    2635 00139$:
                           2636 ;src/main.c:490: if (dist > distConstraint) {
   7236 DD 7E F3      [19] 2637 	ld	a,-13 (ix)
   7239 DD 96 F2      [19] 2638 	sub	a, -14 (ix)
   723C D2 E6 76      [10] 2639 	jp	NC,00208$
                           2640 ;src/main.c:491: if (dx + 1 < enemy->x) {
   723F DD 5E 06      [19] 2641 	ld	e,6 (ix)
   7242 16 00         [ 7] 2642 	ld	d,#0x00
   7244 13            [ 6] 2643 	inc	de
   7245 DD 7E FA      [19] 2644 	ld	a,-6 (ix)
   7248 DD 77 FE      [19] 2645 	ld	-2 (ix),a
   724B DD 36 FF 00   [19] 2646 	ld	-1 (ix),#0x00
   724F 7B            [ 4] 2647 	ld	a,e
   7250 DD 96 FE      [19] 2648 	sub	a, -2 (ix)
   7253 7A            [ 4] 2649 	ld	a,d
   7254 DD 9E FF      [19] 2650 	sbc	a, -1 (ix)
   7257 E2 5C 72      [10] 2651 	jp	PO, 00452$
   725A EE 80         [ 7] 2652 	xor	a, #0x80
   725C                    2653 00452$:
   725C F2 DB 72      [10] 2654 	jp	P,00151$
                           2655 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   725F 79            [ 4] 2656 	ld	a,c
   7260 F5            [11] 2657 	push	af
   7261 33            [ 6] 2658 	inc	sp
   7262 DD 7E FA      [19] 2659 	ld	a,-6 (ix)
   7265 F5            [11] 2660 	push	af
   7266 33            [ 6] 2661 	inc	sp
   7267 2A F9 62      [16] 2662 	ld	hl,(_mapa)
   726A E5            [11] 2663 	push	hl
   726B CD 61 4B      [17] 2664 	call	_getTilePtr
   726E F1            [10] 2665 	pop	af
   726F F1            [10] 2666 	pop	af
   7270 4E            [ 7] 2667 	ld	c,(hl)
   7271 3E 02         [ 7] 2668 	ld	a,#0x02
   7273 91            [ 4] 2669 	sub	a, c
   7274 DA 65 73      [10] 2670 	jp	C,00152$
                           2671 ;src/main.c:493: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7277 DD 6E F6      [19] 2672 	ld	l,-10 (ix)
   727A DD 66 F7      [19] 2673 	ld	h,-9 (ix)
   727D 7E            [ 7] 2674 	ld	a,(hl)
   727E C6 0B         [ 7] 2675 	add	a, #0x0B
   7280 57            [ 4] 2676 	ld	d,a
   7281 DD 6E F4      [19] 2677 	ld	l,-12 (ix)
   7284 DD 66 F5      [19] 2678 	ld	h,-11 (ix)
   7287 46            [ 7] 2679 	ld	b,(hl)
   7288 D5            [11] 2680 	push	de
   7289 33            [ 6] 2681 	inc	sp
   728A C5            [11] 2682 	push	bc
   728B 33            [ 6] 2683 	inc	sp
   728C 2A F9 62      [16] 2684 	ld	hl,(_mapa)
   728F E5            [11] 2685 	push	hl
   7290 CD 61 4B      [17] 2686 	call	_getTilePtr
   7293 F1            [10] 2687 	pop	af
   7294 F1            [10] 2688 	pop	af
   7295 4E            [ 7] 2689 	ld	c,(hl)
   7296 3E 02         [ 7] 2690 	ld	a,#0x02
   7298 91            [ 4] 2691 	sub	a, c
   7299 DA 65 73      [10] 2692 	jp	C,00152$
                           2693 ;src/main.c:494: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   729C DD 6E F6      [19] 2694 	ld	l,-10 (ix)
   729F DD 66 F7      [19] 2695 	ld	h,-9 (ix)
   72A2 7E            [ 7] 2696 	ld	a,(hl)
   72A3 C6 16         [ 7] 2697 	add	a, #0x16
   72A5 57            [ 4] 2698 	ld	d,a
   72A6 DD 6E F4      [19] 2699 	ld	l,-12 (ix)
   72A9 DD 66 F5      [19] 2700 	ld	h,-11 (ix)
   72AC 46            [ 7] 2701 	ld	b,(hl)
   72AD D5            [11] 2702 	push	de
   72AE 33            [ 6] 2703 	inc	sp
   72AF C5            [11] 2704 	push	bc
   72B0 33            [ 6] 2705 	inc	sp
   72B1 2A F9 62      [16] 2706 	ld	hl,(_mapa)
   72B4 E5            [11] 2707 	push	hl
   72B5 CD 61 4B      [17] 2708 	call	_getTilePtr
   72B8 F1            [10] 2709 	pop	af
   72B9 F1            [10] 2710 	pop	af
   72BA 4E            [ 7] 2711 	ld	c,(hl)
   72BB 3E 02         [ 7] 2712 	ld	a,#0x02
   72BD 91            [ 4] 2713 	sub	a, c
   72BE DA 65 73      [10] 2714 	jp	C,00152$
                           2715 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   72C1 DD 6E F4      [19] 2716 	ld	l,-12 (ix)
   72C4 DD 66 F5      [19] 2717 	ld	h,-11 (ix)
   72C7 E5            [11] 2718 	push	hl
   72C8 CD 5E 6A      [17] 2719 	call	_moverEnemigoIzquierda
   72CB F1            [10] 2720 	pop	af
                           2721 ;src/main.c:496: movX = 1;
   72CC DD 36 F1 01   [19] 2722 	ld	-15 (ix),#0x01
                           2723 ;src/main.c:497: enemy->mover = SI;
   72D0 DD 6E F8      [19] 2724 	ld	l,-8 (ix)
   72D3 DD 66 F9      [19] 2725 	ld	h,-7 (ix)
   72D6 36 01         [10] 2726 	ld	(hl),#0x01
   72D8 C3 65 73      [10] 2727 	jp	00152$
   72DB                    2728 00151$:
                           2729 ;src/main.c:499: } else if (dx + 1 > enemy->x){
   72DB DD 7E FE      [19] 2730 	ld	a,-2 (ix)
   72DE 93            [ 4] 2731 	sub	a, e
   72DF DD 7E FF      [19] 2732 	ld	a,-1 (ix)
   72E2 9A            [ 4] 2733 	sbc	a, d
   72E3 E2 E8 72      [10] 2734 	jp	PO, 00453$
   72E6 EE 80         [ 7] 2735 	xor	a, #0x80
   72E8                    2736 00453$:
   72E8 F2 65 73      [10] 2737 	jp	P,00152$
                           2738 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   72EB 79            [ 4] 2739 	ld	a,c
   72EC F5            [11] 2740 	push	af
   72ED 33            [ 6] 2741 	inc	sp
   72EE DD 7E FB      [19] 2742 	ld	a,-5 (ix)
   72F1 F5            [11] 2743 	push	af
   72F2 33            [ 6] 2744 	inc	sp
   72F3 2A F9 62      [16] 2745 	ld	hl,(_mapa)
   72F6 E5            [11] 2746 	push	hl
   72F7 CD 61 4B      [17] 2747 	call	_getTilePtr
   72FA F1            [10] 2748 	pop	af
   72FB F1            [10] 2749 	pop	af
   72FC 4E            [ 7] 2750 	ld	c,(hl)
   72FD 3E 02         [ 7] 2751 	ld	a,#0x02
   72FF 91            [ 4] 2752 	sub	a, c
   7300 38 63         [12] 2753 	jr	C,00152$
                           2754 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7302 DD 6E F6      [19] 2755 	ld	l,-10 (ix)
   7305 DD 66 F7      [19] 2756 	ld	h,-9 (ix)
   7308 7E            [ 7] 2757 	ld	a,(hl)
   7309 C6 0B         [ 7] 2758 	add	a, #0x0B
   730B 47            [ 4] 2759 	ld	b,a
   730C DD 6E F4      [19] 2760 	ld	l,-12 (ix)
   730F DD 66 F5      [19] 2761 	ld	h,-11 (ix)
   7312 7E            [ 7] 2762 	ld	a,(hl)
   7313 C6 04         [ 7] 2763 	add	a, #0x04
   7315 C5            [11] 2764 	push	bc
   7316 33            [ 6] 2765 	inc	sp
   7317 F5            [11] 2766 	push	af
   7318 33            [ 6] 2767 	inc	sp
   7319 2A F9 62      [16] 2768 	ld	hl,(_mapa)
   731C E5            [11] 2769 	push	hl
   731D CD 61 4B      [17] 2770 	call	_getTilePtr
   7320 F1            [10] 2771 	pop	af
   7321 F1            [10] 2772 	pop	af
   7322 4E            [ 7] 2773 	ld	c,(hl)
   7323 3E 02         [ 7] 2774 	ld	a,#0x02
   7325 91            [ 4] 2775 	sub	a, c
   7326 38 3D         [12] 2776 	jr	C,00152$
                           2777 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7328 DD 6E F6      [19] 2778 	ld	l,-10 (ix)
   732B DD 66 F7      [19] 2779 	ld	h,-9 (ix)
   732E 7E            [ 7] 2780 	ld	a,(hl)
   732F C6 16         [ 7] 2781 	add	a, #0x16
   7331 47            [ 4] 2782 	ld	b,a
   7332 DD 6E F4      [19] 2783 	ld	l,-12 (ix)
   7335 DD 66 F5      [19] 2784 	ld	h,-11 (ix)
   7338 7E            [ 7] 2785 	ld	a,(hl)
   7339 C6 04         [ 7] 2786 	add	a, #0x04
   733B C5            [11] 2787 	push	bc
   733C 33            [ 6] 2788 	inc	sp
   733D F5            [11] 2789 	push	af
   733E 33            [ 6] 2790 	inc	sp
   733F 2A F9 62      [16] 2791 	ld	hl,(_mapa)
   7342 E5            [11] 2792 	push	hl
   7343 CD 61 4B      [17] 2793 	call	_getTilePtr
   7346 F1            [10] 2794 	pop	af
   7347 F1            [10] 2795 	pop	af
   7348 4E            [ 7] 2796 	ld	c,(hl)
   7349 3E 02         [ 7] 2797 	ld	a,#0x02
   734B 91            [ 4] 2798 	sub	a, c
   734C 38 17         [12] 2799 	jr	C,00152$
                           2800 ;src/main.c:503: moverEnemigoDerecha(enemy);
   734E DD 6E F4      [19] 2801 	ld	l,-12 (ix)
   7351 DD 66 F5      [19] 2802 	ld	h,-11 (ix)
   7354 E5            [11] 2803 	push	hl
   7355 CD 4E 6A      [17] 2804 	call	_moverEnemigoDerecha
   7358 F1            [10] 2805 	pop	af
                           2806 ;src/main.c:504: movX = 1;
   7359 DD 36 F1 01   [19] 2807 	ld	-15 (ix),#0x01
                           2808 ;src/main.c:505: enemy->mover = SI;
   735D DD 6E F8      [19] 2809 	ld	l,-8 (ix)
   7360 DD 66 F9      [19] 2810 	ld	h,-7 (ix)
   7363 36 01         [10] 2811 	ld	(hl),#0x01
   7365                    2812 00152$:
                           2813 ;src/main.c:508: if (dy < enemy->y) {
   7365 DD 6E F6      [19] 2814 	ld	l,-10 (ix)
   7368 DD 66 F7      [19] 2815 	ld	h,-9 (ix)
   736B 7E            [ 7] 2816 	ld	a,(hl)
   736C DD 77 FE      [19] 2817 	ld	-2 (ix),a
                           2818 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   736F DD 6E F4      [19] 2819 	ld	l,-12 (ix)
   7372 DD 66 F5      [19] 2820 	ld	h,-11 (ix)
   7375 7E            [ 7] 2821 	ld	a,(hl)
   7376 DD 77 FC      [19] 2822 	ld	-4 (ix),a
                           2823 ;src/main.c:508: if (dy < enemy->y) {
   7379 DD 7E 07      [19] 2824 	ld	a,7 (ix)
   737C DD 96 FE      [19] 2825 	sub	a, -2 (ix)
   737F D2 04 74      [10] 2826 	jp	NC,00162$
                           2827 ;src/main.c:509: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7382 DD 46 FE      [19] 2828 	ld	b,-2 (ix)
   7385 05            [ 4] 2829 	dec	b
   7386 05            [ 4] 2830 	dec	b
   7387 C5            [11] 2831 	push	bc
   7388 33            [ 6] 2832 	inc	sp
   7389 DD 7E FC      [19] 2833 	ld	a,-4 (ix)
   738C F5            [11] 2834 	push	af
   738D 33            [ 6] 2835 	inc	sp
   738E 2A F9 62      [16] 2836 	ld	hl,(_mapa)
   7391 E5            [11] 2837 	push	hl
   7392 CD 61 4B      [17] 2838 	call	_getTilePtr
   7395 F1            [10] 2839 	pop	af
   7396 F1            [10] 2840 	pop	af
   7397 4E            [ 7] 2841 	ld	c,(hl)
   7398 3E 02         [ 7] 2842 	ld	a,#0x02
   739A 91            [ 4] 2843 	sub	a, c
   739B DA 83 74      [10] 2844 	jp	C,00163$
                           2845 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   739E DD 6E F6      [19] 2846 	ld	l,-10 (ix)
   73A1 DD 66 F7      [19] 2847 	ld	h,-9 (ix)
   73A4 56            [ 7] 2848 	ld	d,(hl)
   73A5 15            [ 4] 2849 	dec	d
   73A6 15            [ 4] 2850 	dec	d
   73A7 DD 6E F4      [19] 2851 	ld	l,-12 (ix)
   73AA DD 66 F5      [19] 2852 	ld	h,-11 (ix)
   73AD 46            [ 7] 2853 	ld	b,(hl)
   73AE 04            [ 4] 2854 	inc	b
   73AF 04            [ 4] 2855 	inc	b
   73B0 D5            [11] 2856 	push	de
   73B1 33            [ 6] 2857 	inc	sp
   73B2 C5            [11] 2858 	push	bc
   73B3 33            [ 6] 2859 	inc	sp
   73B4 2A F9 62      [16] 2860 	ld	hl,(_mapa)
   73B7 E5            [11] 2861 	push	hl
   73B8 CD 61 4B      [17] 2862 	call	_getTilePtr
   73BB F1            [10] 2863 	pop	af
   73BC F1            [10] 2864 	pop	af
   73BD 4E            [ 7] 2865 	ld	c,(hl)
   73BE 3E 02         [ 7] 2866 	ld	a,#0x02
   73C0 91            [ 4] 2867 	sub	a, c
   73C1 DA 83 74      [10] 2868 	jp	C,00163$
                           2869 ;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73C4 DD 6E F6      [19] 2870 	ld	l,-10 (ix)
   73C7 DD 66 F7      [19] 2871 	ld	h,-9 (ix)
   73CA 46            [ 7] 2872 	ld	b,(hl)
   73CB 05            [ 4] 2873 	dec	b
   73CC 05            [ 4] 2874 	dec	b
   73CD DD 6E F4      [19] 2875 	ld	l,-12 (ix)
   73D0 DD 66 F5      [19] 2876 	ld	h,-11 (ix)
   73D3 7E            [ 7] 2877 	ld	a,(hl)
   73D4 C6 04         [ 7] 2878 	add	a, #0x04
   73D6 C5            [11] 2879 	push	bc
   73D7 33            [ 6] 2880 	inc	sp
   73D8 F5            [11] 2881 	push	af
   73D9 33            [ 6] 2882 	inc	sp
   73DA 2A F9 62      [16] 2883 	ld	hl,(_mapa)
   73DD E5            [11] 2884 	push	hl
   73DE CD 61 4B      [17] 2885 	call	_getTilePtr
   73E1 F1            [10] 2886 	pop	af
   73E2 F1            [10] 2887 	pop	af
   73E3 4E            [ 7] 2888 	ld	c,(hl)
   73E4 3E 02         [ 7] 2889 	ld	a,#0x02
   73E6 91            [ 4] 2890 	sub	a, c
   73E7 DA 83 74      [10] 2891 	jp	C,00163$
                           2892 ;src/main.c:512: moverEnemigoArriba(enemy);
   73EA DD 6E F4      [19] 2893 	ld	l,-12 (ix)
   73ED DD 66 F5      [19] 2894 	ld	h,-11 (ix)
   73F0 E5            [11] 2895 	push	hl
   73F1 CD 10 6A      [17] 2896 	call	_moverEnemigoArriba
   73F4 F1            [10] 2897 	pop	af
                           2898 ;src/main.c:513: movY = 1;
   73F5 DD 36 F0 01   [19] 2899 	ld	-16 (ix),#0x01
                           2900 ;src/main.c:514: enemy->mover = SI;
   73F9 DD 6E F8      [19] 2901 	ld	l,-8 (ix)
   73FC DD 66 F9      [19] 2902 	ld	h,-7 (ix)
   73FF 36 01         [10] 2903 	ld	(hl),#0x01
   7401 C3 83 74      [10] 2904 	jp	00163$
   7404                    2905 00162$:
                           2906 ;src/main.c:517: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7404 DD 7E FE      [19] 2907 	ld	a,-2 (ix)
   7407 C6 18         [ 7] 2908 	add	a, #0x18
   7409 47            [ 4] 2909 	ld	b,a
   740A C5            [11] 2910 	push	bc
   740B 33            [ 6] 2911 	inc	sp
   740C DD 7E FC      [19] 2912 	ld	a,-4 (ix)
   740F F5            [11] 2913 	push	af
   7410 33            [ 6] 2914 	inc	sp
   7411 2A F9 62      [16] 2915 	ld	hl,(_mapa)
   7414 E5            [11] 2916 	push	hl
   7415 CD 61 4B      [17] 2917 	call	_getTilePtr
   7418 F1            [10] 2918 	pop	af
   7419 F1            [10] 2919 	pop	af
   741A 4E            [ 7] 2920 	ld	c,(hl)
   741B 3E 02         [ 7] 2921 	ld	a,#0x02
   741D 91            [ 4] 2922 	sub	a, c
   741E 38 63         [12] 2923 	jr	C,00163$
                           2924 ;src/main.c:518: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7420 DD 6E F6      [19] 2925 	ld	l,-10 (ix)
   7423 DD 66 F7      [19] 2926 	ld	h,-9 (ix)
   7426 7E            [ 7] 2927 	ld	a,(hl)
   7427 C6 18         [ 7] 2928 	add	a, #0x18
   7429 57            [ 4] 2929 	ld	d,a
   742A DD 6E F4      [19] 2930 	ld	l,-12 (ix)
   742D DD 66 F5      [19] 2931 	ld	h,-11 (ix)
   7430 46            [ 7] 2932 	ld	b,(hl)
   7431 04            [ 4] 2933 	inc	b
   7432 04            [ 4] 2934 	inc	b
   7433 D5            [11] 2935 	push	de
   7434 33            [ 6] 2936 	inc	sp
   7435 C5            [11] 2937 	push	bc
   7436 33            [ 6] 2938 	inc	sp
   7437 2A F9 62      [16] 2939 	ld	hl,(_mapa)
   743A E5            [11] 2940 	push	hl
   743B CD 61 4B      [17] 2941 	call	_getTilePtr
   743E F1            [10] 2942 	pop	af
   743F F1            [10] 2943 	pop	af
   7440 4E            [ 7] 2944 	ld	c,(hl)
   7441 3E 02         [ 7] 2945 	ld	a,#0x02
   7443 91            [ 4] 2946 	sub	a, c
   7444 38 3D         [12] 2947 	jr	C,00163$
                           2948 ;src/main.c:519: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7446 DD 6E F6      [19] 2949 	ld	l,-10 (ix)
   7449 DD 66 F7      [19] 2950 	ld	h,-9 (ix)
   744C 7E            [ 7] 2951 	ld	a,(hl)
   744D C6 18         [ 7] 2952 	add	a, #0x18
   744F 47            [ 4] 2953 	ld	b,a
   7450 DD 6E F4      [19] 2954 	ld	l,-12 (ix)
   7453 DD 66 F5      [19] 2955 	ld	h,-11 (ix)
   7456 7E            [ 7] 2956 	ld	a,(hl)
   7457 C6 04         [ 7] 2957 	add	a, #0x04
   7459 C5            [11] 2958 	push	bc
   745A 33            [ 6] 2959 	inc	sp
   745B F5            [11] 2960 	push	af
   745C 33            [ 6] 2961 	inc	sp
   745D 2A F9 62      [16] 2962 	ld	hl,(_mapa)
   7460 E5            [11] 2963 	push	hl
   7461 CD 61 4B      [17] 2964 	call	_getTilePtr
   7464 F1            [10] 2965 	pop	af
   7465 F1            [10] 2966 	pop	af
   7466 4E            [ 7] 2967 	ld	c,(hl)
   7467 3E 02         [ 7] 2968 	ld	a,#0x02
   7469 91            [ 4] 2969 	sub	a, c
   746A 38 17         [12] 2970 	jr	C,00163$
                           2971 ;src/main.c:520: moverEnemigoAbajo(enemy);
   746C DD 6E F4      [19] 2972 	ld	l,-12 (ix)
   746F DD 66 F5      [19] 2973 	ld	h,-11 (ix)
   7472 E5            [11] 2974 	push	hl
   7473 CD 2F 6A      [17] 2975 	call	_moverEnemigoAbajo
   7476 F1            [10] 2976 	pop	af
                           2977 ;src/main.c:521: movY = 1;
   7477 DD 36 F0 01   [19] 2978 	ld	-16 (ix),#0x01
                           2979 ;src/main.c:522: enemy->mover = SI;
   747B DD 6E F8      [19] 2980 	ld	l,-8 (ix)
   747E DD 66 F9      [19] 2981 	ld	h,-7 (ix)
   7481 36 01         [10] 2982 	ld	(hl),#0x01
   7483                    2983 00163$:
                           2984 ;src/main.c:525: if (!enemy->mover) {
   7483 DD 6E F8      [19] 2985 	ld	l,-8 (ix)
   7486 DD 66 F9      [19] 2986 	ld	h,-7 (ix)
   7489 7E            [ 7] 2987 	ld	a,(hl)
   748A B7            [ 4] 2988 	or	a, a
   748B C2 E6 76      [10] 2989 	jp	NZ,00208$
                           2990 ;src/main.c:526: if (!movX) {
   748E DD 7E F1      [19] 2991 	ld	a,-15 (ix)
   7491 B7            [ 4] 2992 	or	a, a
   7492 C2 BB 75      [10] 2993 	jp	NZ,00178$
                           2994 ;src/main.c:527: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7495 DD 6E F6      [19] 2995 	ld	l,-10 (ix)
   7498 DD 66 F7      [19] 2996 	ld	h,-9 (ix)
   749B 5E            [ 7] 2997 	ld	e,(hl)
                           2998 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   749C DD 6E F4      [19] 2999 	ld	l,-12 (ix)
   749F DD 66 F5      [19] 3000 	ld	h,-11 (ix)
   74A2 4E            [ 7] 3001 	ld	c,(hl)
                           3002 ;src/main.c:527: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   74A3 3E 70         [ 7] 3003 	ld	a,#0x70
   74A5 93            [ 4] 3004 	sub	a, e
   74A6 D2 36 75      [10] 3005 	jp	NC,00175$
                           3006 ;src/main.c:528: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   74A9 7B            [ 4] 3007 	ld	a,e
   74AA C6 18         [ 7] 3008 	add	a, #0x18
   74AC 47            [ 4] 3009 	ld	b,a
   74AD C5            [11] 3010 	push	bc
   74AE 2A F9 62      [16] 3011 	ld	hl,(_mapa)
   74B1 E5            [11] 3012 	push	hl
   74B2 CD 61 4B      [17] 3013 	call	_getTilePtr
   74B5 F1            [10] 3014 	pop	af
   74B6 F1            [10] 3015 	pop	af
   74B7 4E            [ 7] 3016 	ld	c,(hl)
   74B8 3E 02         [ 7] 3017 	ld	a,#0x02
   74BA 91            [ 4] 3018 	sub	a, c
   74BB 38 63         [12] 3019 	jr	C,00165$
                           3020 ;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   74BD DD 6E F6      [19] 3021 	ld	l,-10 (ix)
   74C0 DD 66 F7      [19] 3022 	ld	h,-9 (ix)
   74C3 7E            [ 7] 3023 	ld	a,(hl)
   74C4 C6 18         [ 7] 3024 	add	a, #0x18
   74C6 57            [ 4] 3025 	ld	d,a
   74C7 DD 6E F4      [19] 3026 	ld	l,-12 (ix)
   74CA DD 66 F5      [19] 3027 	ld	h,-11 (ix)
   74CD 4E            [ 7] 3028 	ld	c,(hl)
   74CE 41            [ 4] 3029 	ld	b,c
   74CF 04            [ 4] 3030 	inc	b
   74D0 04            [ 4] 3031 	inc	b
   74D1 D5            [11] 3032 	push	de
   74D2 33            [ 6] 3033 	inc	sp
   74D3 C5            [11] 3034 	push	bc
   74D4 33            [ 6] 3035 	inc	sp
   74D5 2A F9 62      [16] 3036 	ld	hl,(_mapa)
   74D8 E5            [11] 3037 	push	hl
   74D9 CD 61 4B      [17] 3038 	call	_getTilePtr
   74DC F1            [10] 3039 	pop	af
   74DD F1            [10] 3040 	pop	af
   74DE 4E            [ 7] 3041 	ld	c,(hl)
   74DF 3E 02         [ 7] 3042 	ld	a,#0x02
   74E1 91            [ 4] 3043 	sub	a, c
   74E2 38 3C         [12] 3044 	jr	C,00165$
                           3045 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   74E4 DD 6E F6      [19] 3046 	ld	l,-10 (ix)
   74E7 DD 66 F7      [19] 3047 	ld	h,-9 (ix)
   74EA 7E            [ 7] 3048 	ld	a,(hl)
   74EB C6 18         [ 7] 3049 	add	a, #0x18
   74ED 47            [ 4] 3050 	ld	b,a
   74EE DD 6E F4      [19] 3051 	ld	l,-12 (ix)
   74F1 DD 66 F5      [19] 3052 	ld	h,-11 (ix)
   74F4 7E            [ 7] 3053 	ld	a,(hl)
   74F5 C6 04         [ 7] 3054 	add	a, #0x04
   74F7 C5            [11] 3055 	push	bc
   74F8 33            [ 6] 3056 	inc	sp
   74F9 F5            [11] 3057 	push	af
   74FA 33            [ 6] 3058 	inc	sp
   74FB 2A F9 62      [16] 3059 	ld	hl,(_mapa)
   74FE E5            [11] 3060 	push	hl
   74FF CD 61 4B      [17] 3061 	call	_getTilePtr
   7502 F1            [10] 3062 	pop	af
   7503 F1            [10] 3063 	pop	af
   7504 4E            [ 7] 3064 	ld	c,(hl)
   7505 3E 02         [ 7] 3065 	ld	a,#0x02
   7507 91            [ 4] 3066 	sub	a, c
   7508 38 16         [12] 3067 	jr	C,00165$
                           3068 ;src/main.c:531: moverEnemigoAbajo(enemy);
   750A DD 6E F4      [19] 3069 	ld	l,-12 (ix)
   750D DD 66 F5      [19] 3070 	ld	h,-11 (ix)
   7510 E5            [11] 3071 	push	hl
   7511 CD 2F 6A      [17] 3072 	call	_moverEnemigoAbajo
   7514 F1            [10] 3073 	pop	af
                           3074 ;src/main.c:532: enemy->mover = SI;
   7515 DD 6E F8      [19] 3075 	ld	l,-8 (ix)
   7518 DD 66 F9      [19] 3076 	ld	h,-7 (ix)
   751B 36 01         [10] 3077 	ld	(hl),#0x01
   751D C3 BB 75      [10] 3078 	jp	00178$
   7520                    3079 00165$:
                           3080 ;src/main.c:534: moverEnemigoArriba(enemy);
   7520 DD 6E F4      [19] 3081 	ld	l,-12 (ix)
   7523 DD 66 F5      [19] 3082 	ld	h,-11 (ix)
   7526 E5            [11] 3083 	push	hl
   7527 CD 10 6A      [17] 3084 	call	_moverEnemigoArriba
   752A F1            [10] 3085 	pop	af
                           3086 ;src/main.c:535: enemy->mover = SI;
   752B DD 6E F8      [19] 3087 	ld	l,-8 (ix)
   752E DD 66 F9      [19] 3088 	ld	h,-7 (ix)
   7531 36 01         [10] 3089 	ld	(hl),#0x01
   7533 C3 BB 75      [10] 3090 	jp	00178$
   7536                    3091 00175$:
                           3092 ;src/main.c:538: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7536 43            [ 4] 3093 	ld	b,e
   7537 05            [ 4] 3094 	dec	b
   7538 05            [ 4] 3095 	dec	b
   7539 C5            [11] 3096 	push	bc
   753A 2A F9 62      [16] 3097 	ld	hl,(_mapa)
   753D E5            [11] 3098 	push	hl
   753E CD 61 4B      [17] 3099 	call	_getTilePtr
   7541 F1            [10] 3100 	pop	af
   7542 F1            [10] 3101 	pop	af
   7543 4E            [ 7] 3102 	ld	c,(hl)
   7544 3E 02         [ 7] 3103 	ld	a,#0x02
   7546 91            [ 4] 3104 	sub	a, c
   7547 38 5F         [12] 3105 	jr	C,00170$
                           3106 ;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7549 DD 6E F6      [19] 3107 	ld	l,-10 (ix)
   754C DD 66 F7      [19] 3108 	ld	h,-9 (ix)
   754F 56            [ 7] 3109 	ld	d,(hl)
   7550 15            [ 4] 3110 	dec	d
   7551 15            [ 4] 3111 	dec	d
   7552 DD 6E F4      [19] 3112 	ld	l,-12 (ix)
   7555 DD 66 F5      [19] 3113 	ld	h,-11 (ix)
   7558 46            [ 7] 3114 	ld	b,(hl)
   7559 04            [ 4] 3115 	inc	b
   755A 04            [ 4] 3116 	inc	b
   755B D5            [11] 3117 	push	de
   755C 33            [ 6] 3118 	inc	sp
   755D C5            [11] 3119 	push	bc
   755E 33            [ 6] 3120 	inc	sp
   755F 2A F9 62      [16] 3121 	ld	hl,(_mapa)
   7562 E5            [11] 3122 	push	hl
   7563 CD 61 4B      [17] 3123 	call	_getTilePtr
   7566 F1            [10] 3124 	pop	af
   7567 F1            [10] 3125 	pop	af
   7568 4E            [ 7] 3126 	ld	c,(hl)
   7569 3E 02         [ 7] 3127 	ld	a,#0x02
   756B 91            [ 4] 3128 	sub	a, c
   756C 38 3A         [12] 3129 	jr	C,00170$
                           3130 ;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   756E DD 6E F6      [19] 3131 	ld	l,-10 (ix)
   7571 DD 66 F7      [19] 3132 	ld	h,-9 (ix)
   7574 46            [ 7] 3133 	ld	b,(hl)
   7575 05            [ 4] 3134 	dec	b
   7576 05            [ 4] 3135 	dec	b
   7577 DD 6E F4      [19] 3136 	ld	l,-12 (ix)
   757A DD 66 F5      [19] 3137 	ld	h,-11 (ix)
   757D 7E            [ 7] 3138 	ld	a,(hl)
   757E C6 04         [ 7] 3139 	add	a, #0x04
   7580 C5            [11] 3140 	push	bc
   7581 33            [ 6] 3141 	inc	sp
   7582 F5            [11] 3142 	push	af
   7583 33            [ 6] 3143 	inc	sp
   7584 2A F9 62      [16] 3144 	ld	hl,(_mapa)
   7587 E5            [11] 3145 	push	hl
   7588 CD 61 4B      [17] 3146 	call	_getTilePtr
   758B F1            [10] 3147 	pop	af
   758C F1            [10] 3148 	pop	af
   758D 4E            [ 7] 3149 	ld	c,(hl)
   758E 3E 02         [ 7] 3150 	ld	a,#0x02
   7590 91            [ 4] 3151 	sub	a, c
   7591 38 15         [12] 3152 	jr	C,00170$
                           3153 ;src/main.c:541: moverEnemigoArriba(enemy);
   7593 DD 6E F4      [19] 3154 	ld	l,-12 (ix)
   7596 DD 66 F5      [19] 3155 	ld	h,-11 (ix)
   7599 E5            [11] 3156 	push	hl
   759A CD 10 6A      [17] 3157 	call	_moverEnemigoArriba
   759D F1            [10] 3158 	pop	af
                           3159 ;src/main.c:542: enemy->mover = SI;
   759E DD 6E F8      [19] 3160 	ld	l,-8 (ix)
   75A1 DD 66 F9      [19] 3161 	ld	h,-7 (ix)
   75A4 36 01         [10] 3162 	ld	(hl),#0x01
   75A6 18 13         [12] 3163 	jr	00178$
   75A8                    3164 00170$:
                           3165 ;src/main.c:544: moverEnemigoAbajo(enemy);
   75A8 DD 6E F4      [19] 3166 	ld	l,-12 (ix)
   75AB DD 66 F5      [19] 3167 	ld	h,-11 (ix)
   75AE E5            [11] 3168 	push	hl
   75AF CD 2F 6A      [17] 3169 	call	_moverEnemigoAbajo
   75B2 F1            [10] 3170 	pop	af
                           3171 ;src/main.c:545: enemy->mover = SI;
   75B3 DD 6E F8      [19] 3172 	ld	l,-8 (ix)
   75B6 DD 66 F9      [19] 3173 	ld	h,-7 (ix)
   75B9 36 01         [10] 3174 	ld	(hl),#0x01
   75BB                    3175 00178$:
                           3176 ;src/main.c:550: if (!movY) {
   75BB DD 7E F0      [19] 3177 	ld	a,-16 (ix)
   75BE B7            [ 4] 3178 	or	a, a
   75BF C2 E6 76      [10] 3179 	jp	NZ,00208$
                           3180 ;src/main.c:551: if (enemy->x < ANCHO_PANTALLA/2) {
   75C2 DD 6E F4      [19] 3181 	ld	l,-12 (ix)
   75C5 DD 66 F5      [19] 3182 	ld	h,-11 (ix)
   75C8 4E            [ 7] 3183 	ld	c,(hl)
                           3184 ;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
   75C9 DD 6E F6      [19] 3185 	ld	l,-10 (ix)
   75CC DD 66 F7      [19] 3186 	ld	h,-9 (ix)
   75CF 56            [ 7] 3187 	ld	d,(hl)
                           3188 ;src/main.c:551: if (enemy->x < ANCHO_PANTALLA/2) {
   75D0 79            [ 4] 3189 	ld	a,c
   75D1 D6 28         [ 7] 3190 	sub	a, #0x28
   75D3 D2 5C 76      [10] 3191 	jp	NC,00190$
                           3192 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   75D6 D5            [11] 3193 	push	de
   75D7 33            [ 6] 3194 	inc	sp
   75D8 79            [ 4] 3195 	ld	a,c
   75D9 F5            [11] 3196 	push	af
   75DA 33            [ 6] 3197 	inc	sp
   75DB 2A F9 62      [16] 3198 	ld	hl,(_mapa)
   75DE E5            [11] 3199 	push	hl
   75DF CD 61 4B      [17] 3200 	call	_getTilePtr
   75E2 F1            [10] 3201 	pop	af
   75E3 F1            [10] 3202 	pop	af
   75E4 4E            [ 7] 3203 	ld	c,(hl)
   75E5 3E 02         [ 7] 3204 	ld	a,#0x02
   75E7 91            [ 4] 3205 	sub	a, c
   75E8 38 5C         [12] 3206 	jr	C,00180$
                           3207 ;src/main.c:553: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   75EA DD 6E F6      [19] 3208 	ld	l,-10 (ix)
   75ED DD 66 F7      [19] 3209 	ld	h,-9 (ix)
   75F0 7E            [ 7] 3210 	ld	a,(hl)
   75F1 C6 0B         [ 7] 3211 	add	a, #0x0B
   75F3 DD 6E F4      [19] 3212 	ld	l,-12 (ix)
   75F6 DD 66 F5      [19] 3213 	ld	h,-11 (ix)
   75F9 46            [ 7] 3214 	ld	b,(hl)
   75FA F5            [11] 3215 	push	af
   75FB 33            [ 6] 3216 	inc	sp
   75FC C5            [11] 3217 	push	bc
   75FD 33            [ 6] 3218 	inc	sp
   75FE 2A F9 62      [16] 3219 	ld	hl,(_mapa)
   7601 E5            [11] 3220 	push	hl
   7602 CD 61 4B      [17] 3221 	call	_getTilePtr
   7605 F1            [10] 3222 	pop	af
   7606 F1            [10] 3223 	pop	af
   7607 4E            [ 7] 3224 	ld	c,(hl)
   7608 3E 02         [ 7] 3225 	ld	a,#0x02
   760A 91            [ 4] 3226 	sub	a, c
   760B 38 39         [12] 3227 	jr	C,00180$
                           3228 ;src/main.c:554: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   760D DD 6E F6      [19] 3229 	ld	l,-10 (ix)
   7610 DD 66 F7      [19] 3230 	ld	h,-9 (ix)
   7613 7E            [ 7] 3231 	ld	a,(hl)
   7614 C6 16         [ 7] 3232 	add	a, #0x16
   7616 DD 6E F4      [19] 3233 	ld	l,-12 (ix)
   7619 DD 66 F5      [19] 3234 	ld	h,-11 (ix)
   761C 46            [ 7] 3235 	ld	b,(hl)
   761D F5            [11] 3236 	push	af
   761E 33            [ 6] 3237 	inc	sp
   761F C5            [11] 3238 	push	bc
   7620 33            [ 6] 3239 	inc	sp
   7621 2A F9 62      [16] 3240 	ld	hl,(_mapa)
   7624 E5            [11] 3241 	push	hl
   7625 CD 61 4B      [17] 3242 	call	_getTilePtr
   7628 F1            [10] 3243 	pop	af
   7629 F1            [10] 3244 	pop	af
   762A 4E            [ 7] 3245 	ld	c,(hl)
   762B 3E 02         [ 7] 3246 	ld	a,#0x02
   762D 91            [ 4] 3247 	sub	a, c
   762E 38 16         [12] 3248 	jr	C,00180$
                           3249 ;src/main.c:555: moverEnemigoIzquierda(enemy);
   7630 DD 6E F4      [19] 3250 	ld	l,-12 (ix)
   7633 DD 66 F5      [19] 3251 	ld	h,-11 (ix)
   7636 E5            [11] 3252 	push	hl
   7637 CD 5E 6A      [17] 3253 	call	_moverEnemigoIzquierda
   763A F1            [10] 3254 	pop	af
                           3255 ;src/main.c:556: enemy->mover = SI;
   763B DD 6E F8      [19] 3256 	ld	l,-8 (ix)
   763E DD 66 F9      [19] 3257 	ld	h,-7 (ix)
   7641 36 01         [10] 3258 	ld	(hl),#0x01
   7643 C3 E6 76      [10] 3259 	jp	00208$
   7646                    3260 00180$:
                           3261 ;src/main.c:558: moverEnemigoDerecha(enemy);
   7646 DD 6E F4      [19] 3262 	ld	l,-12 (ix)
   7649 DD 66 F5      [19] 3263 	ld	h,-11 (ix)
   764C E5            [11] 3264 	push	hl
   764D CD 4E 6A      [17] 3265 	call	_moverEnemigoDerecha
   7650 F1            [10] 3266 	pop	af
                           3267 ;src/main.c:559: enemy->mover = SI;
   7651 DD 6E F8      [19] 3268 	ld	l,-8 (ix)
   7654 DD 66 F9      [19] 3269 	ld	h,-7 (ix)
   7657 36 01         [10] 3270 	ld	(hl),#0x01
   7659 C3 E6 76      [10] 3271 	jp	00208$
   765C                    3272 00190$:
                           3273 ;src/main.c:562: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   765C 79            [ 4] 3274 	ld	a,c
   765D C6 04         [ 7] 3275 	add	a, #0x04
   765F D5            [11] 3276 	push	de
   7660 33            [ 6] 3277 	inc	sp
   7661 F5            [11] 3278 	push	af
   7662 33            [ 6] 3279 	inc	sp
   7663 2A F9 62      [16] 3280 	ld	hl,(_mapa)
   7666 E5            [11] 3281 	push	hl
   7667 CD 61 4B      [17] 3282 	call	_getTilePtr
   766A F1            [10] 3283 	pop	af
   766B F1            [10] 3284 	pop	af
   766C 4E            [ 7] 3285 	ld	c,(hl)
   766D 3E 02         [ 7] 3286 	ld	a,#0x02
   766F 91            [ 4] 3287 	sub	a, c
   7670 38 61         [12] 3288 	jr	C,00185$
                           3289 ;src/main.c:563: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7672 DD 6E F6      [19] 3290 	ld	l,-10 (ix)
   7675 DD 66 F7      [19] 3291 	ld	h,-9 (ix)
   7678 7E            [ 7] 3292 	ld	a,(hl)
   7679 C6 0B         [ 7] 3293 	add	a, #0x0B
   767B 47            [ 4] 3294 	ld	b,a
   767C DD 6E F4      [19] 3295 	ld	l,-12 (ix)
   767F DD 66 F5      [19] 3296 	ld	h,-11 (ix)
   7682 7E            [ 7] 3297 	ld	a,(hl)
   7683 C6 04         [ 7] 3298 	add	a, #0x04
   7685 C5            [11] 3299 	push	bc
   7686 33            [ 6] 3300 	inc	sp
   7687 F5            [11] 3301 	push	af
   7688 33            [ 6] 3302 	inc	sp
   7689 2A F9 62      [16] 3303 	ld	hl,(_mapa)
   768C E5            [11] 3304 	push	hl
   768D CD 61 4B      [17] 3305 	call	_getTilePtr
   7690 F1            [10] 3306 	pop	af
   7691 F1            [10] 3307 	pop	af
   7692 4E            [ 7] 3308 	ld	c,(hl)
   7693 3E 02         [ 7] 3309 	ld	a,#0x02
   7695 91            [ 4] 3310 	sub	a, c
   7696 38 3B         [12] 3311 	jr	C,00185$
                           3312 ;src/main.c:564: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7698 DD 6E F6      [19] 3313 	ld	l,-10 (ix)
   769B DD 66 F7      [19] 3314 	ld	h,-9 (ix)
   769E 7E            [ 7] 3315 	ld	a,(hl)
   769F C6 16         [ 7] 3316 	add	a, #0x16
   76A1 47            [ 4] 3317 	ld	b,a
   76A2 DD 6E F4      [19] 3318 	ld	l,-12 (ix)
   76A5 DD 66 F5      [19] 3319 	ld	h,-11 (ix)
   76A8 7E            [ 7] 3320 	ld	a,(hl)
   76A9 C6 04         [ 7] 3321 	add	a, #0x04
   76AB C5            [11] 3322 	push	bc
   76AC 33            [ 6] 3323 	inc	sp
   76AD F5            [11] 3324 	push	af
   76AE 33            [ 6] 3325 	inc	sp
   76AF 2A F9 62      [16] 3326 	ld	hl,(_mapa)
   76B2 E5            [11] 3327 	push	hl
   76B3 CD 61 4B      [17] 3328 	call	_getTilePtr
   76B6 F1            [10] 3329 	pop	af
   76B7 F1            [10] 3330 	pop	af
   76B8 4E            [ 7] 3331 	ld	c,(hl)
   76B9 3E 02         [ 7] 3332 	ld	a,#0x02
   76BB 91            [ 4] 3333 	sub	a, c
   76BC 38 15         [12] 3334 	jr	C,00185$
                           3335 ;src/main.c:565: moverEnemigoDerecha(enemy);
   76BE DD 6E F4      [19] 3336 	ld	l,-12 (ix)
   76C1 DD 66 F5      [19] 3337 	ld	h,-11 (ix)
   76C4 E5            [11] 3338 	push	hl
   76C5 CD 4E 6A      [17] 3339 	call	_moverEnemigoDerecha
   76C8 F1            [10] 3340 	pop	af
                           3341 ;src/main.c:566: enemy->mover = SI;
   76C9 DD 6E F8      [19] 3342 	ld	l,-8 (ix)
   76CC DD 66 F9      [19] 3343 	ld	h,-7 (ix)
   76CF 36 01         [10] 3344 	ld	(hl),#0x01
   76D1 18 13         [12] 3345 	jr	00208$
   76D3                    3346 00185$:
                           3347 ;src/main.c:569: moverEnemigoIzquierda(enemy);
   76D3 DD 6E F4      [19] 3348 	ld	l,-12 (ix)
   76D6 DD 66 F5      [19] 3349 	ld	h,-11 (ix)
   76D9 E5            [11] 3350 	push	hl
   76DA CD 5E 6A      [17] 3351 	call	_moverEnemigoIzquierda
   76DD F1            [10] 3352 	pop	af
                           3353 ;src/main.c:570: enemy->mover = SI;
   76DE DD 6E F8      [19] 3354 	ld	l,-8 (ix)
   76E1 DD 66 F9      [19] 3355 	ld	h,-7 (ix)
   76E4 36 01         [10] 3356 	ld	(hl),#0x01
   76E6                    3357 00208$:
   76E6 DD F9         [10] 3358 	ld	sp, ix
   76E8 DD E1         [14] 3359 	pop	ix
   76EA C9            [10] 3360 	ret
                           3361 ;src/main.c:580: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3362 ;	---------------------------------
                           3363 ; Function updateEnemy
                           3364 ; ---------------------------------
   76EB                    3365 _updateEnemy::
   76EB DD E5         [15] 3366 	push	ix
   76ED DD 21 00 00   [14] 3367 	ld	ix,#0
   76F1 DD 39         [15] 3368 	add	ix,sp
   76F3 21 F4 FF      [10] 3369 	ld	hl,#-12
   76F6 39            [11] 3370 	add	hl,sp
   76F7 F9            [ 6] 3371 	ld	sp,hl
                           3372 ;src/main.c:587: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   76F8 DD 4E 04      [19] 3373 	ld	c,4 (ix)
   76FB DD 46 05      [19] 3374 	ld	b,5 (ix)
   76FE 21 15 00      [10] 3375 	ld	hl,#0x0015
   7701 09            [11] 3376 	add	hl,bc
   7702 DD 75 FC      [19] 3377 	ld	-4 (ix),l
   7705 DD 74 FD      [19] 3378 	ld	-3 (ix),h
   7708 DD 6E FC      [19] 3379 	ld	l,-4 (ix)
   770B DD 66 FD      [19] 3380 	ld	h,-3 (ix)
   770E 7E            [ 7] 3381 	ld	a,(hl)
   770F B7            [ 4] 3382 	or	a, a
   7710 28 19         [12] 3383 	jr	Z,00115$
                           3384 ;src/main.c:588: enemy->patrolling = 0;
   7712 21 60 5F      [10] 3385 	ld	hl,#(_enemy + 0x000a)
   7715 36 00         [10] 3386 	ld	(hl),#0x00
                           3387 ;src/main.c:589: engage(actual, prota.x, prota.y);
   7717 3A E3 62      [13] 3388 	ld	a, (#_prota + 1)
   771A 21 E2 62      [10] 3389 	ld	hl, #_prota + 0
   771D 56            [ 7] 3390 	ld	d,(hl)
   771E F5            [11] 3391 	push	af
   771F 33            [ 6] 3392 	inc	sp
   7720 D5            [11] 3393 	push	de
   7721 33            [ 6] 3394 	inc	sp
   7722 C5            [11] 3395 	push	bc
   7723 CD E1 6E      [17] 3396 	call	_engage
   7726 F1            [10] 3397 	pop	af
   7727 F1            [10] 3398 	pop	af
   7728 C3 46 78      [10] 3399 	jp	00117$
   772B                    3400 00115$:
                           3401 ;src/main.c:591: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   772B C5            [11] 3402 	push	bc
   772C C5            [11] 3403 	push	bc
   772D CD B9 6C      [17] 3404 	call	_lookFor
   7730 F1            [10] 3405 	pop	af
   7731 C1            [10] 3406 	pop	bc
                           3407 ;src/main.c:597: actual->patrolling = 0;
   7732 21 0A 00      [10] 3408 	ld	hl,#0x000A
   7735 09            [11] 3409 	add	hl,bc
   7736 DD 75 FA      [19] 3410 	ld	-6 (ix),l
   7739 DD 74 FB      [19] 3411 	ld	-5 (ix),h
                           3412 ;src/main.c:592: if (actual->patrolling) {
   773C DD 6E FA      [19] 3413 	ld	l,-6 (ix)
   773F DD 66 FB      [19] 3414 	ld	h,-5 (ix)
   7742 6E            [ 7] 3415 	ld	l,(hl)
                           3416 ;src/main.c:595: if (actual->in_range) {
   7743 79            [ 4] 3417 	ld	a,c
   7744 C6 10         [ 7] 3418 	add	a, #0x10
   7746 5F            [ 4] 3419 	ld	e,a
   7747 78            [ 4] 3420 	ld	a,b
   7748 CE 00         [ 7] 3421 	adc	a, #0x00
   774A 57            [ 4] 3422 	ld	d,a
                           3423 ;src/main.c:603: actual->seek = 1;
   774B 79            [ 4] 3424 	ld	a,c
   774C C6 13         [ 7] 3425 	add	a, #0x13
   774E DD 77 F6      [19] 3426 	ld	-10 (ix),a
   7751 78            [ 4] 3427 	ld	a,b
   7752 CE 00         [ 7] 3428 	adc	a, #0x00
   7754 DD 77 F7      [19] 3429 	ld	-9 (ix),a
                           3430 ;src/main.c:592: if (actual->patrolling) {
   7757 7D            [ 4] 3431 	ld	a,l
   7758 B7            [ 4] 3432 	or	a, a
   7759 CA 0E 78      [10] 3433 	jp	Z,00112$
                           3434 ;src/main.c:594: moverEnemigoPatrol(actual);
   775C C5            [11] 3435 	push	bc
   775D D5            [11] 3436 	push	de
   775E C5            [11] 3437 	push	bc
   775F CD 70 6A      [17] 3438 	call	_moverEnemigoPatrol
   7762 F1            [10] 3439 	pop	af
   7763 D1            [10] 3440 	pop	de
   7764 C1            [10] 3441 	pop	bc
                           3442 ;src/main.c:595: if (actual->in_range) {
   7765 1A            [ 7] 3443 	ld	a,(de)
   7766 B7            [ 4] 3444 	or	a, a
   7767 28 24         [12] 3445 	jr	Z,00104$
                           3446 ;src/main.c:596: engage(actual, prota.x, prota.y);
   7769 3A E3 62      [13] 3447 	ld	a, (#_prota + 1)
   776C 21 E2 62      [10] 3448 	ld	hl, #_prota + 0
   776F 56            [ 7] 3449 	ld	d,(hl)
   7770 F5            [11] 3450 	push	af
   7771 33            [ 6] 3451 	inc	sp
   7772 D5            [11] 3452 	push	de
   7773 33            [ 6] 3453 	inc	sp
   7774 C5            [11] 3454 	push	bc
   7775 CD E1 6E      [17] 3455 	call	_engage
   7778 F1            [10] 3456 	pop	af
   7779 F1            [10] 3457 	pop	af
                           3458 ;src/main.c:597: actual->patrolling = 0;
   777A DD 6E FA      [19] 3459 	ld	l,-6 (ix)
   777D DD 66 FB      [19] 3460 	ld	h,-5 (ix)
   7780 36 00         [10] 3461 	ld	(hl),#0x00
                           3462 ;src/main.c:598: actual->engage = 1;
   7782 DD 6E FC      [19] 3463 	ld	l,-4 (ix)
   7785 DD 66 FD      [19] 3464 	ld	h,-3 (ix)
   7788 36 01         [10] 3465 	ld	(hl),#0x01
   778A C3 46 78      [10] 3466 	jp	00117$
   778D                    3467 00104$:
                           3468 ;src/main.c:599: } else if (actual->seen) {
   778D 21 11 00      [10] 3469 	ld	hl,#0x0011
   7790 09            [11] 3470 	add	hl,bc
   7791 DD 75 F8      [19] 3471 	ld	-8 (ix),l
   7794 DD 74 F9      [19] 3472 	ld	-7 (ix),h
   7797 DD 6E F8      [19] 3473 	ld	l,-8 (ix)
   779A DD 66 F9      [19] 3474 	ld	h,-7 (ix)
   779D 7E            [ 7] 3475 	ld	a,(hl)
   779E B7            [ 4] 3476 	or	a, a
   779F CA 46 78      [10] 3477 	jp	Z,00117$
                           3478 ;src/main.c:600: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   77A2 3A E3 62      [13] 3479 	ld	a,(#_prota + 1)
   77A5 DD 77 FE      [19] 3480 	ld	-2 (ix),a
   77A8 21 E2 62      [10] 3481 	ld	hl, #_prota + 0
   77AB 5E            [ 7] 3482 	ld	e,(hl)
   77AC 21 01 00      [10] 3483 	ld	hl,#0x0001
   77AF 09            [11] 3484 	add	hl,bc
   77B0 E3            [19] 3485 	ex	(sp), hl
   77B1 E1            [10] 3486 	pop	hl
   77B2 E5            [11] 3487 	push	hl
   77B3 56            [ 7] 3488 	ld	d,(hl)
   77B4 0A            [ 7] 3489 	ld	a,(bc)
   77B5 DD 77 FF      [19] 3490 	ld	-1 (ix),a
   77B8 C5            [11] 3491 	push	bc
   77B9 2A F9 62      [16] 3492 	ld	hl,(_mapa)
   77BC E5            [11] 3493 	push	hl
   77BD C5            [11] 3494 	push	bc
   77BE DD 7E FE      [19] 3495 	ld	a,-2 (ix)
   77C1 F5            [11] 3496 	push	af
   77C2 33            [ 6] 3497 	inc	sp
   77C3 7B            [ 4] 3498 	ld	a,e
   77C4 F5            [11] 3499 	push	af
   77C5 33            [ 6] 3500 	inc	sp
   77C6 D5            [11] 3501 	push	de
   77C7 33            [ 6] 3502 	inc	sp
   77C8 DD 7E FF      [19] 3503 	ld	a,-1 (ix)
   77CB F5            [11] 3504 	push	af
   77CC 33            [ 6] 3505 	inc	sp
   77CD CD 62 49      [17] 3506 	call	_pathFinding
   77D0 21 08 00      [10] 3507 	ld	hl,#8
   77D3 39            [11] 3508 	add	hl,sp
   77D4 F9            [ 6] 3509 	ld	sp,hl
   77D5 C1            [10] 3510 	pop	bc
                           3511 ;src/main.c:601: actual->p_seek_x = actual->x;
   77D6 21 17 00      [10] 3512 	ld	hl,#0x0017
   77D9 09            [11] 3513 	add	hl,bc
   77DA EB            [ 4] 3514 	ex	de,hl
   77DB 0A            [ 7] 3515 	ld	a,(bc)
   77DC 12            [ 7] 3516 	ld	(de),a
                           3517 ;src/main.c:602: actual->p_seek_y = actual->y;
   77DD 21 18 00      [10] 3518 	ld	hl,#0x0018
   77E0 09            [11] 3519 	add	hl,bc
   77E1 EB            [ 4] 3520 	ex	de,hl
   77E2 E1            [10] 3521 	pop	hl
   77E3 E5            [11] 3522 	push	hl
   77E4 7E            [ 7] 3523 	ld	a,(hl)
   77E5 12            [ 7] 3524 	ld	(de),a
                           3525 ;src/main.c:603: actual->seek = 1;
   77E6 DD 6E F6      [19] 3526 	ld	l,-10 (ix)
   77E9 DD 66 F7      [19] 3527 	ld	h,-9 (ix)
   77EC 36 01         [10] 3528 	ld	(hl),#0x01
                           3529 ;src/main.c:604: actual->iter=0;
   77EE 21 0D 00      [10] 3530 	ld	hl,#0x000D
   77F1 09            [11] 3531 	add	hl,bc
   77F2 AF            [ 4] 3532 	xor	a, a
   77F3 77            [ 7] 3533 	ld	(hl), a
   77F4 23            [ 6] 3534 	inc	hl
   77F5 77            [ 7] 3535 	ld	(hl), a
                           3536 ;src/main.c:605: actual->reversePatrol = NO;
   77F6 21 0B 00      [10] 3537 	ld	hl,#0x000B
   77F9 09            [11] 3538 	add	hl,bc
   77FA 36 00         [10] 3539 	ld	(hl),#0x00
                           3540 ;src/main.c:606: actual->patrolling = 0;
   77FC DD 6E FA      [19] 3541 	ld	l,-6 (ix)
   77FF DD 66 FB      [19] 3542 	ld	h,-5 (ix)
   7802 36 00         [10] 3543 	ld	(hl),#0x00
                           3544 ;src/main.c:607: actual->seen = 0;
   7804 DD 6E F8      [19] 3545 	ld	l,-8 (ix)
   7807 DD 66 F9      [19] 3546 	ld	h,-7 (ix)
   780A 36 00         [10] 3547 	ld	(hl),#0x00
   780C 18 38         [12] 3548 	jr	00117$
   780E                    3549 00112$:
                           3550 ;src/main.c:609: } else if (actual->seek) {
   780E DD 6E F6      [19] 3551 	ld	l,-10 (ix)
   7811 DD 66 F7      [19] 3552 	ld	h,-9 (ix)
   7814 7E            [ 7] 3553 	ld	a,(hl)
   7815 B7            [ 4] 3554 	or	a, a
   7816 28 2E         [12] 3555 	jr	Z,00117$
                           3556 ;src/main.c:610: moverEnemigoSeek(actual);
   7818 C5            [11] 3557 	push	bc
   7819 D5            [11] 3558 	push	de
   781A C5            [11] 3559 	push	bc
   781B CD C2 6D      [17] 3560 	call	_moverEnemigoSeek
   781E F1            [10] 3561 	pop	af
   781F D1            [10] 3562 	pop	de
   7820 C1            [10] 3563 	pop	bc
                           3564 ;src/main.c:611: if (actual->in_range) {
   7821 1A            [ 7] 3565 	ld	a,(de)
   7822 B7            [ 4] 3566 	or	a, a
   7823 28 21         [12] 3567 	jr	Z,00117$
                           3568 ;src/main.c:612: engage(actual, prota.x, prota.y);
   7825 3A E3 62      [13] 3569 	ld	a, (#_prota + 1)
   7828 21 E2 62      [10] 3570 	ld	hl, #_prota + 0
   782B 56            [ 7] 3571 	ld	d,(hl)
   782C F5            [11] 3572 	push	af
   782D 33            [ 6] 3573 	inc	sp
   782E D5            [11] 3574 	push	de
   782F 33            [ 6] 3575 	inc	sp
   7830 C5            [11] 3576 	push	bc
   7831 CD E1 6E      [17] 3577 	call	_engage
   7834 F1            [10] 3578 	pop	af
   7835 F1            [10] 3579 	pop	af
                           3580 ;src/main.c:613: actual->seek = 0;
   7836 DD 6E F6      [19] 3581 	ld	l,-10 (ix)
   7839 DD 66 F7      [19] 3582 	ld	h,-9 (ix)
   783C 36 00         [10] 3583 	ld	(hl),#0x00
                           3584 ;src/main.c:614: actual->engage = 1;
   783E DD 6E FC      [19] 3585 	ld	l,-4 (ix)
   7841 DD 66 FD      [19] 3586 	ld	h,-3 (ix)
   7844 36 01         [10] 3587 	ld	(hl),#0x01
                           3588 ;src/main.c:615: } else if (actual->seen) {
   7846                    3589 00117$:
   7846 DD F9         [10] 3590 	ld	sp, ix
   7848 DD E1         [14] 3591 	pop	ix
   784A C9            [10] 3592 	ret
                           3593 ;src/main.c:622: void inicializarEnemy() {
                           3594 ;	---------------------------------
                           3595 ; Function inicializarEnemy
                           3596 ; ---------------------------------
   784B                    3597 _inicializarEnemy::
   784B DD E5         [15] 3598 	push	ix
   784D DD 21 00 00   [14] 3599 	ld	ix,#0
   7851 DD 39         [15] 3600 	add	ix,sp
   7853 21 F9 FF      [10] 3601 	ld	hl,#-7
   7856 39            [11] 3602 	add	hl,sp
   7857 F9            [ 6] 3603 	ld	sp,hl
                           3604 ;src/main.c:623: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7858 3A FB 62      [13] 3605 	ld	a,(#_num_mapa + 0)
   785B C6 02         [ 7] 3606 	add	a, #0x02
   785D DD 77 FF      [19] 3607 	ld	-1 (ix),a
                           3608 ;src/main.c:633: actual = enemy;
   7860 11 56 5F      [10] 3609 	ld	de,#_enemy+0
                           3610 ;src/main.c:634: while(i){
   7863                    3611 00101$:
   7863 DD 7E FF      [19] 3612 	ld	a,-1 (ix)
   7866 B7            [ 4] 3613 	or	a, a
   7867 CA 6B 79      [10] 3614 	jp	Z,00104$
                           3615 ;src/main.c:635: --i;
   786A DD 35 FF      [23] 3616 	dec	-1 (ix)
                           3617 ;src/main.c:636: actual->x = actual->px = spawnX[i];
   786D 4B            [ 4] 3618 	ld	c, e
   786E 42            [ 4] 3619 	ld	b, d
   786F 03            [ 6] 3620 	inc	bc
   7870 03            [ 6] 3621 	inc	bc
   7871 3E E5         [ 7] 3622 	ld	a,#<(_spawnX)
   7873 DD 86 FF      [19] 3623 	add	a, -1 (ix)
   7876 DD 77 FC      [19] 3624 	ld	-4 (ix),a
   7879 3E 63         [ 7] 3625 	ld	a,#>(_spawnX)
   787B CE 00         [ 7] 3626 	adc	a, #0x00
   787D DD 77 FD      [19] 3627 	ld	-3 (ix),a
   7880 DD 6E FC      [19] 3628 	ld	l,-4 (ix)
   7883 DD 66 FD      [19] 3629 	ld	h,-3 (ix)
   7886 7E            [ 7] 3630 	ld	a,(hl)
   7887 02            [ 7] 3631 	ld	(bc),a
   7888 12            [ 7] 3632 	ld	(de),a
                           3633 ;src/main.c:637: actual->y = actual->py = spawnY[i];
   7889 D5            [11] 3634 	push	de
   788A FD E1         [14] 3635 	pop	iy
   788C FD 23         [10] 3636 	inc	iy
   788E 4B            [ 4] 3637 	ld	c, e
   788F 42            [ 4] 3638 	ld	b, d
   7890 03            [ 6] 3639 	inc	bc
   7891 03            [ 6] 3640 	inc	bc
   7892 03            [ 6] 3641 	inc	bc
   7893 3E E9         [ 7] 3642 	ld	a,#<(_spawnY)
   7895 DD 86 FF      [19] 3643 	add	a, -1 (ix)
   7898 DD 77 FA      [19] 3644 	ld	-6 (ix),a
   789B 3E 63         [ 7] 3645 	ld	a,#>(_spawnY)
   789D CE 00         [ 7] 3646 	adc	a, #0x00
   789F DD 77 FB      [19] 3647 	ld	-5 (ix),a
   78A2 DD 6E FA      [19] 3648 	ld	l,-6 (ix)
   78A5 DD 66 FB      [19] 3649 	ld	h,-5 (ix)
   78A8 7E            [ 7] 3650 	ld	a,(hl)
   78A9 02            [ 7] 3651 	ld	(bc),a
   78AA FD 77 00      [19] 3652 	ld	0 (iy), a
                           3653 ;src/main.c:638: actual->mover  = NO;
   78AD 21 06 00      [10] 3654 	ld	hl,#0x0006
   78B0 19            [11] 3655 	add	hl,de
   78B1 36 00         [10] 3656 	ld	(hl),#0x00
                           3657 ;src/main.c:639: actual->mira   = M_abajo;
   78B3 21 07 00      [10] 3658 	ld	hl,#0x0007
   78B6 19            [11] 3659 	add	hl,de
   78B7 36 03         [10] 3660 	ld	(hl),#0x03
                           3661 ;src/main.c:640: actual->sprite = g_enemy;
   78B9 21 04 00      [10] 3662 	ld	hl,#0x0004
   78BC 19            [11] 3663 	add	hl,de
   78BD 36 3A         [10] 3664 	ld	(hl),#<(_g_enemy)
   78BF 23            [ 6] 3665 	inc	hl
   78C0 36 3C         [10] 3666 	ld	(hl),#>(_g_enemy)
                           3667 ;src/main.c:641: actual->muerto = NO;
   78C2 21 08 00      [10] 3668 	ld	hl,#0x0008
   78C5 19            [11] 3669 	add	hl,de
   78C6 36 00         [10] 3670 	ld	(hl),#0x00
                           3671 ;src/main.c:642: actual->muertes = 0;
   78C8 21 09 00      [10] 3672 	ld	hl,#0x0009
   78CB 19            [11] 3673 	add	hl,de
   78CC 36 00         [10] 3674 	ld	(hl),#0x00
                           3675 ;src/main.c:643: actual->patrolling = SI;
   78CE 21 0A 00      [10] 3676 	ld	hl,#0x000A
   78D1 19            [11] 3677 	add	hl,de
   78D2 36 01         [10] 3678 	ld	(hl),#0x01
                           3679 ;src/main.c:644: actual->reversePatrol = NO;
   78D4 21 0B 00      [10] 3680 	ld	hl,#0x000B
   78D7 19            [11] 3681 	add	hl,de
   78D8 36 00         [10] 3682 	ld	(hl),#0x00
                           3683 ;src/main.c:645: actual->didDamage = 0;
   78DA 21 16 00      [10] 3684 	ld	hl,#0x0016
   78DD 19            [11] 3685 	add	hl,de
   78DE 36 00         [10] 3686 	ld	(hl),#0x00
                           3687 ;src/main.c:646: actual->iter = 0;
   78E0 21 0D 00      [10] 3688 	ld	hl,#0x000D
   78E3 19            [11] 3689 	add	hl,de
   78E4 AF            [ 4] 3690 	xor	a, a
   78E5 77            [ 7] 3691 	ld	(hl), a
   78E6 23            [ 6] 3692 	inc	hl
   78E7 77            [ 7] 3693 	ld	(hl), a
                           3694 ;src/main.c:647: actual->lastIter = 0;
   78E8 21 0F 00      [10] 3695 	ld	hl,#0x000F
   78EB 19            [11] 3696 	add	hl,de
   78EC 36 00         [10] 3697 	ld	(hl),#0x00
                           3698 ;src/main.c:648: actual->seen = 0;
   78EE 21 11 00      [10] 3699 	ld	hl,#0x0011
   78F1 19            [11] 3700 	add	hl,de
   78F2 36 00         [10] 3701 	ld	(hl),#0x00
                           3702 ;src/main.c:649: actual->found = 0;
   78F4 21 12 00      [10] 3703 	ld	hl,#0x0012
   78F7 19            [11] 3704 	add	hl,de
   78F8 36 00         [10] 3705 	ld	(hl),#0x00
                           3706 ;src/main.c:650: actual->engage = 0;
   78FA 21 15 00      [10] 3707 	ld	hl,#0x0015
   78FD 19            [11] 3708 	add	hl,de
   78FE 36 00         [10] 3709 	ld	(hl),#0x00
                           3710 ;src/main.c:651: actual->xplot = NO;
   7900 21 19 00      [10] 3711 	ld	hl,#0x0019
   7903 19            [11] 3712 	add	hl,de
   7904 36 00         [10] 3713 	ld	(hl),#0x00
                           3714 ;src/main.c:652: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7906 21 FB 62      [10] 3715 	ld	hl,#_num_mapa + 0
   7909 4E            [ 7] 3716 	ld	c, (hl)
   790A 0C            [ 4] 3717 	inc	c
   790B 06 00         [ 7] 3718 	ld	b,#0x00
   790D 69            [ 4] 3719 	ld	l, c
   790E 60            [ 4] 3720 	ld	h, b
   790F 29            [11] 3721 	add	hl, hl
   7910 29            [11] 3722 	add	hl, hl
   7911 09            [11] 3723 	add	hl, bc
   7912 4D            [ 4] 3724 	ld	c,l
   7913 44            [ 4] 3725 	ld	b,h
   7914 21 01 64      [10] 3726 	ld	hl,#_patrolY
   7917 09            [11] 3727 	add	hl,bc
   7918 7D            [ 4] 3728 	ld	a,l
   7919 DD 86 FF      [19] 3729 	add	a, -1 (ix)
   791C 6F            [ 4] 3730 	ld	l,a
   791D 7C            [ 4] 3731 	ld	a,h
   791E CE 00         [ 7] 3732 	adc	a, #0x00
   7920 67            [ 4] 3733 	ld	h,a
   7921 7E            [ 7] 3734 	ld	a,(hl)
   7922 DD 77 F9      [19] 3735 	ld	-7 (ix),a
   7925 21 ED 63      [10] 3736 	ld	hl,#_patrolX
   7928 09            [11] 3737 	add	hl,bc
   7929 DD 4E FF      [19] 3738 	ld	c,-1 (ix)
   792C 06 00         [ 7] 3739 	ld	b,#0x00
   792E 09            [11] 3740 	add	hl,bc
   792F 7E            [ 7] 3741 	ld	a,(hl)
   7930 DD 77 FE      [19] 3742 	ld	-2 (ix),a
   7933 DD 6E FA      [19] 3743 	ld	l,-6 (ix)
   7936 DD 66 FB      [19] 3744 	ld	h,-5 (ix)
   7939 4E            [ 7] 3745 	ld	c,(hl)
   793A DD 6E FC      [19] 3746 	ld	l,-4 (ix)
   793D DD 66 FD      [19] 3747 	ld	h,-3 (ix)
   7940 46            [ 7] 3748 	ld	b,(hl)
   7941 D5            [11] 3749 	push	de
   7942 2A F9 62      [16] 3750 	ld	hl,(_mapa)
   7945 E5            [11] 3751 	push	hl
   7946 D5            [11] 3752 	push	de
   7947 DD 66 F9      [19] 3753 	ld	h,-7 (ix)
   794A DD 6E FE      [19] 3754 	ld	l,-2 (ix)
   794D E5            [11] 3755 	push	hl
   794E 79            [ 4] 3756 	ld	a,c
   794F F5            [11] 3757 	push	af
   7950 33            [ 6] 3758 	inc	sp
   7951 C5            [11] 3759 	push	bc
   7952 33            [ 6] 3760 	inc	sp
   7953 CD 62 49      [17] 3761 	call	_pathFinding
   7956 21 08 00      [10] 3762 	ld	hl,#8
   7959 39            [11] 3763 	add	hl,sp
   795A F9            [ 6] 3764 	ld	sp,hl
   795B D1            [10] 3765 	pop	de
                           3766 ;src/main.c:653: dibujarEnemigo(actual);
   795C D5            [11] 3767 	push	de
   795D D5            [11] 3768 	push	de
   795E CD 9B 66      [17] 3769 	call	_dibujarEnemigo
   7961 F1            [10] 3770 	pop	af
   7962 D1            [10] 3771 	pop	de
                           3772 ;src/main.c:654: ++actual;
   7963 21 E3 00      [10] 3773 	ld	hl,#0x00E3
   7966 19            [11] 3774 	add	hl,de
   7967 EB            [ 4] 3775 	ex	de,hl
   7968 C3 63 78      [10] 3776 	jp	00101$
   796B                    3777 00104$:
   796B DD F9         [10] 3778 	ld	sp, ix
   796D DD E1         [14] 3779 	pop	ix
   796F C9            [10] 3780 	ret
                           3781 ;src/main.c:658: void moverIzquierda() {
                           3782 ;	---------------------------------
                           3783 ; Function moverIzquierda
                           3784 ; ---------------------------------
   7970                    3785 _moverIzquierda::
                           3786 ;src/main.c:659: prota.mira = M_izquierda;
   7970 01 E2 62      [10] 3787 	ld	bc,#_prota+0
   7973 21 E9 62      [10] 3788 	ld	hl,#(_prota + 0x0007)
   7976 36 01         [10] 3789 	ld	(hl),#0x01
                           3790 ;src/main.c:660: if (!checkCollision(M_izquierda)) {
   7978 C5            [11] 3791 	push	bc
   7979 3E 01         [ 7] 3792 	ld	a,#0x01
   797B F5            [11] 3793 	push	af
   797C 33            [ 6] 3794 	inc	sp
   797D CD 2A 65      [17] 3795 	call	_checkCollision
   7980 33            [ 6] 3796 	inc	sp
   7981 C1            [10] 3797 	pop	bc
   7982 7D            [ 4] 3798 	ld	a,l
   7983 B7            [ 4] 3799 	or	a, a
   7984 C0            [11] 3800 	ret	NZ
                           3801 ;src/main.c:661: prota.x--;
   7985 0A            [ 7] 3802 	ld	a,(bc)
   7986 C6 FF         [ 7] 3803 	add	a,#0xFF
   7988 02            [ 7] 3804 	ld	(bc),a
                           3805 ;src/main.c:662: prota.mover = SI;
   7989 21 E8 62      [10] 3806 	ld	hl,#(_prota + 0x0006)
   798C 36 01         [10] 3807 	ld	(hl),#0x01
                           3808 ;src/main.c:663: prota.sprite = g_hero_left;
   798E 21 C6 3D      [10] 3809 	ld	hl,#_g_hero_left
   7991 22 E6 62      [16] 3810 	ld	((_prota + 0x0004)), hl
   7994 C9            [10] 3811 	ret
                           3812 ;src/main.c:667: void moverDerecha() {
                           3813 ;	---------------------------------
                           3814 ; Function moverDerecha
                           3815 ; ---------------------------------
   7995                    3816 _moverDerecha::
                           3817 ;src/main.c:668: prota.mira = M_derecha;
   7995 21 E9 62      [10] 3818 	ld	hl,#(_prota + 0x0007)
   7998 36 00         [10] 3819 	ld	(hl),#0x00
                           3820 ;src/main.c:669: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   799A AF            [ 4] 3821 	xor	a, a
   799B F5            [11] 3822 	push	af
   799C 33            [ 6] 3823 	inc	sp
   799D CD 2A 65      [17] 3824 	call	_checkCollision
   79A0 33            [ 6] 3825 	inc	sp
   79A1 45            [ 4] 3826 	ld	b,l
   79A2 21 E2 62      [10] 3827 	ld	hl, #_prota + 0
   79A5 4E            [ 7] 3828 	ld	c,(hl)
   79A6 59            [ 4] 3829 	ld	e,c
   79A7 16 00         [ 7] 3830 	ld	d,#0x00
   79A9 21 07 00      [10] 3831 	ld	hl,#0x0007
   79AC 19            [11] 3832 	add	hl,de
   79AD 11 50 80      [10] 3833 	ld	de, #0x8050
   79B0 29            [11] 3834 	add	hl, hl
   79B1 3F            [ 4] 3835 	ccf
   79B2 CB 1C         [ 8] 3836 	rr	h
   79B4 CB 1D         [ 8] 3837 	rr	l
   79B6 ED 52         [15] 3838 	sbc	hl, de
   79B8 3E 00         [ 7] 3839 	ld	a,#0x00
   79BA 17            [ 4] 3840 	rla
   79BB 5F            [ 4] 3841 	ld	e,a
   79BC 78            [ 4] 3842 	ld	a,b
   79BD B7            [ 4] 3843 	or	a,a
   79BE 20 14         [12] 3844 	jr	NZ,00104$
   79C0 B3            [ 4] 3845 	or	a,e
   79C1 28 11         [12] 3846 	jr	Z,00104$
                           3847 ;src/main.c:670: prota.x++;
   79C3 0C            [ 4] 3848 	inc	c
   79C4 21 E2 62      [10] 3849 	ld	hl,#_prota
   79C7 71            [ 7] 3850 	ld	(hl),c
                           3851 ;src/main.c:671: prota.mover = SI;
   79C8 21 E8 62      [10] 3852 	ld	hl,#(_prota + 0x0006)
   79CB 36 01         [10] 3853 	ld	(hl),#0x01
                           3854 ;src/main.c:672: prota.sprite = g_hero;
   79CD 21 70 3E      [10] 3855 	ld	hl,#_g_hero
   79D0 22 E6 62      [16] 3856 	ld	((_prota + 0x0004)), hl
   79D3 C9            [10] 3857 	ret
   79D4                    3858 00104$:
                           3859 ;src/main.c:673: }else if( prota.x + G_HERO_W >= 80){
   79D4 7B            [ 4] 3860 	ld	a,e
   79D5 B7            [ 4] 3861 	or	a, a
   79D6 C0            [11] 3862 	ret	NZ
                           3863 ;src/main.c:674: avanzarMapa();
   79D7 C3 B0 7C      [10] 3864 	jp  _avanzarMapa
                           3865 ;src/main.c:678: void moverArriba() {
                           3866 ;	---------------------------------
                           3867 ; Function moverArriba
                           3868 ; ---------------------------------
   79DA                    3869 _moverArriba::
                           3870 ;src/main.c:679: prota.mira = M_arriba;
   79DA 21 E9 62      [10] 3871 	ld	hl,#(_prota + 0x0007)
   79DD 36 02         [10] 3872 	ld	(hl),#0x02
                           3873 ;src/main.c:680: if (!checkCollision(M_arriba)) {
   79DF 3E 02         [ 7] 3874 	ld	a,#0x02
   79E1 F5            [11] 3875 	push	af
   79E2 33            [ 6] 3876 	inc	sp
   79E3 CD 2A 65      [17] 3877 	call	_checkCollision
   79E6 33            [ 6] 3878 	inc	sp
   79E7 7D            [ 4] 3879 	ld	a,l
   79E8 B7            [ 4] 3880 	or	a, a
   79E9 C0            [11] 3881 	ret	NZ
                           3882 ;src/main.c:681: prota.y--;
   79EA 21 E3 62      [10] 3883 	ld	hl,#_prota + 1
   79ED 4E            [ 7] 3884 	ld	c,(hl)
   79EE 0D            [ 4] 3885 	dec	c
   79EF 71            [ 7] 3886 	ld	(hl),c
                           3887 ;src/main.c:682: prota.y--;
   79F0 0D            [ 4] 3888 	dec	c
   79F1 71            [ 7] 3889 	ld	(hl),c
                           3890 ;src/main.c:683: prota.mover  = SI;
   79F2 21 E8 62      [10] 3891 	ld	hl,#(_prota + 0x0006)
   79F5 36 01         [10] 3892 	ld	(hl),#0x01
                           3893 ;src/main.c:684: prota.sprite = g_hero_up;
   79F7 21 2C 3D      [10] 3894 	ld	hl,#_g_hero_up
   79FA 22 E6 62      [16] 3895 	ld	((_prota + 0x0004)), hl
   79FD C9            [10] 3896 	ret
                           3897 ;src/main.c:688: void moverAbajo() {
                           3898 ;	---------------------------------
                           3899 ; Function moverAbajo
                           3900 ; ---------------------------------
   79FE                    3901 _moverAbajo::
                           3902 ;src/main.c:689: prota.mira = M_abajo;
   79FE 21 E9 62      [10] 3903 	ld	hl,#(_prota + 0x0007)
   7A01 36 03         [10] 3904 	ld	(hl),#0x03
                           3905 ;src/main.c:690: if (!checkCollision(M_abajo) ) {
   7A03 3E 03         [ 7] 3906 	ld	a,#0x03
   7A05 F5            [11] 3907 	push	af
   7A06 33            [ 6] 3908 	inc	sp
   7A07 CD 2A 65      [17] 3909 	call	_checkCollision
   7A0A 33            [ 6] 3910 	inc	sp
   7A0B 7D            [ 4] 3911 	ld	a,l
   7A0C B7            [ 4] 3912 	or	a, a
   7A0D C0            [11] 3913 	ret	NZ
                           3914 ;src/main.c:691: prota.y++;
   7A0E 01 E3 62      [10] 3915 	ld	bc,#_prota + 1
   7A11 0A            [ 7] 3916 	ld	a,(bc)
   7A12 3C            [ 4] 3917 	inc	a
   7A13 02            [ 7] 3918 	ld	(bc),a
                           3919 ;src/main.c:692: prota.y++;
   7A14 3C            [ 4] 3920 	inc	a
   7A15 02            [ 7] 3921 	ld	(bc),a
                           3922 ;src/main.c:693: prota.mover  = SI;
   7A16 21 E8 62      [10] 3923 	ld	hl,#(_prota + 0x0006)
   7A19 36 01         [10] 3924 	ld	(hl),#0x01
                           3925 ;src/main.c:694: prota.sprite = g_hero_down;
   7A1B 21 92 3C      [10] 3926 	ld	hl,#_g_hero_down
   7A1E 22 E6 62      [16] 3927 	ld	((_prota + 0x0004)), hl
   7A21 C9            [10] 3928 	ret
                           3929 ;src/main.c:701: void intHandler() {
                           3930 ;	---------------------------------
                           3931 ; Function intHandler
                           3932 ; ---------------------------------
   7A22                    3933 _intHandler::
                           3934 ;src/main.c:702: if (++i == 6) {
   7A22 21 FF 62      [10] 3935 	ld	hl, #_i+0
   7A25 34            [11] 3936 	inc	(hl)
   7A26 3A FF 62      [13] 3937 	ld	a,(#_i + 0)
   7A29 D6 06         [ 7] 3938 	sub	a, #0x06
   7A2B C0            [11] 3939 	ret	NZ
                           3940 ;src/main.c:703: play();
   7A2C CD 2A 52      [17] 3941 	call	_play
                           3942 ;src/main.c:704: i=0;
   7A2F 21 FF 62      [10] 3943 	ld	hl,#_i + 0
   7A32 36 00         [10] 3944 	ld	(hl), #0x00
   7A34 C9            [10] 3945 	ret
                           3946 ;src/main.c:708: void inicializarCPC() {
                           3947 ;	---------------------------------
                           3948 ; Function inicializarCPC
                           3949 ; ---------------------------------
   7A35                    3950 _inicializarCPC::
                           3951 ;src/main.c:709: cpct_disableFirmware();
   7A35 CD E8 55      [17] 3952 	call	_cpct_disableFirmware
                           3953 ;src/main.c:710: cpct_setVideoMode(0);
   7A38 2E 00         [ 7] 3954 	ld	l,#0x00
   7A3A CD BC 55      [17] 3955 	call	_cpct_setVideoMode
                           3956 ;src/main.c:711: cpct_setBorder(HW_BLACK);
   7A3D 21 10 14      [10] 3957 	ld	hl,#0x1410
   7A40 E5            [11] 3958 	push	hl
   7A41 CD 08 53      [17] 3959 	call	_cpct_setPALColour
                           3960 ;src/main.c:712: cpct_setPalette(g_palette, 16);
   7A44 21 10 00      [10] 3961 	ld	hl,#0x0010
   7A47 E5            [11] 3962 	push	hl
   7A48 21 60 3E      [10] 3963 	ld	hl,#_g_palette
   7A4B E5            [11] 3964 	push	hl
   7A4C CD 7B 52      [17] 3965 	call	_cpct_setPalette
   7A4F C9            [10] 3966 	ret
                           3967 ;src/main.c:717: void inicializarJuego() {
                           3968 ;	---------------------------------
                           3969 ; Function inicializarJuego
                           3970 ; ---------------------------------
   7A50                    3971 _inicializarJuego::
                           3972 ;src/main.c:719: endGame = 0;
   7A50 21 FC 62      [10] 3973 	ld	hl,#_endGame + 0
   7A53 36 00         [10] 3974 	ld	(hl), #0x00
                           3975 ;src/main.c:720: puntuacion = 0;
   7A55 21 FD 62      [10] 3976 	ld	hl,#_puntuacion + 0
   7A58 36 00         [10] 3977 	ld	(hl), #0x00
                           3978 ;src/main.c:722: cambio = 0;
   7A5A 21 F6 62      [10] 3979 	ld	hl,#_cambio + 0
   7A5D 36 00         [10] 3980 	ld	(hl), #0x00
                           3981 ;src/main.c:723: timer = 0;
   7A5F 21 00 00      [10] 3982 	ld	hl,#0x0000
   7A62 22 F7 62      [16] 3983 	ld	(_timer),hl
                           3984 ;src/main.c:724: parpadeo = 0;
   7A65 21 F5 62      [10] 3985 	ld	hl,#_parpadeo + 0
   7A68 36 00         [10] 3986 	ld	(hl), #0x00
                           3987 ;src/main.c:725: vidas = 100;
   7A6A 21 FE 62      [10] 3988 	ld	hl,#_vidas + 0
   7A6D 36 64         [10] 3989 	ld	(hl), #0x64
                           3990 ;src/main.c:727: num_mapa = 0;
   7A6F 21 FB 62      [10] 3991 	ld	hl,#_num_mapa + 0
   7A72 36 00         [10] 3992 	ld	(hl), #0x00
                           3993 ;src/main.c:728: mapa = mapas[num_mapa];
   7A74 21 DF 63      [10] 3994 	ld	hl, #_mapas + 0
   7A77 7E            [ 7] 3995 	ld	a,(hl)
   7A78 FD 21 F9 62   [14] 3996 	ld	iy,#_mapa
   7A7C FD 77 00      [19] 3997 	ld	0 (iy),a
   7A7F 23            [ 6] 3998 	inc	hl
   7A80 7E            [ 7] 3999 	ld	a,(hl)
   7A81 32 FA 62      [13] 4000 	ld	(#_mapa + 1),a
                           4001 ;src/main.c:729: cpct_etm_setTileset2x4(g_tileset);
   7A84 21 E0 17      [10] 4002 	ld	hl,#_g_tileset
   7A87 CD 6C 54      [17] 4003 	call	_cpct_etm_setTileset2x4
                           4004 ;src/main.c:731: dibujarMapa();
   7A8A CD C9 63      [17] 4005 	call	_dibujarMapa
                           4006 ;src/main.c:734: barraPuntuacionInicial();
   7A8D CD 11 50      [17] 4007 	call	_barraPuntuacionInicial
                           4008 ;src/main.c:737: prota.x = prota.px = 4;
   7A90 21 E4 62      [10] 4009 	ld	hl,#(_prota + 0x0002)
   7A93 36 04         [10] 4010 	ld	(hl),#0x04
   7A95 21 E2 62      [10] 4011 	ld	hl,#_prota
   7A98 36 04         [10] 4012 	ld	(hl),#0x04
                           4013 ;src/main.c:738: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7A9A 21 E5 62      [10] 4014 	ld	hl,#(_prota + 0x0003)
   7A9D 36 68         [10] 4015 	ld	(hl),#0x68
   7A9F 21 E3 62      [10] 4016 	ld	hl,#(_prota + 0x0001)
   7AA2 36 68         [10] 4017 	ld	(hl),#0x68
                           4018 ;src/main.c:739: prota.mover  = NO;
   7AA4 21 E8 62      [10] 4019 	ld	hl,#(_prota + 0x0006)
   7AA7 36 00         [10] 4020 	ld	(hl),#0x00
                           4021 ;src/main.c:740: prota.mira=M_derecha;
   7AA9 21 E9 62      [10] 4022 	ld	hl,#(_prota + 0x0007)
   7AAC 36 00         [10] 4023 	ld	(hl),#0x00
                           4024 ;src/main.c:741: prota.sprite = g_hero;
   7AAE 21 70 3E      [10] 4025 	ld	hl,#_g_hero
   7AB1 22 E6 62      [16] 4026 	ld	((_prota + 0x0004)), hl
                           4027 ;src/main.c:745: cu.x = cu.px = 0;
   7AB4 21 EC 62      [10] 4028 	ld	hl,#(_cu + 0x0002)
   7AB7 36 00         [10] 4029 	ld	(hl),#0x00
   7AB9 21 EA 62      [10] 4030 	ld	hl,#_cu
   7ABC 36 00         [10] 4031 	ld	(hl),#0x00
                           4032 ;src/main.c:746: cu.y = cu.py = 0;
   7ABE 21 ED 62      [10] 4033 	ld	hl,#(_cu + 0x0003)
   7AC1 36 00         [10] 4034 	ld	(hl),#0x00
   7AC3 21 EB 62      [10] 4035 	ld	hl,#(_cu + 0x0001)
   7AC6 36 00         [10] 4036 	ld	(hl),#0x00
                           4037 ;src/main.c:747: cu.lanzado = NO;
   7AC8 21 F0 62      [10] 4038 	ld	hl,#(_cu + 0x0006)
   7ACB 36 00         [10] 4039 	ld	(hl),#0x00
                           4040 ;src/main.c:748: cu.mover = NO;
   7ACD 21 F3 62      [10] 4041 	ld	hl,#(_cu + 0x0009)
   7AD0 36 00         [10] 4042 	ld	(hl),#0x00
                           4043 ;src/main.c:749: cu.off_bound = NO;
   7AD2 21 F4 62      [10] 4044 	ld	hl,#(_cu + 0x000a)
   7AD5 36 00         [10] 4045 	ld	(hl),#0x00
                           4046 ;src/main.c:751: inicializarEnemy();
   7AD7 CD 4B 78      [17] 4047 	call	_inicializarEnemy
                           4048 ;src/main.c:753: dibujarProta();
   7ADA C3 15 64      [10] 4049 	jp  _dibujarProta
                           4050 ;src/main.c:756: void menuFin(u16 puntuacion) __z88dk_fastcall {
                           4051 ;	---------------------------------
                           4052 ; Function menuFin
                           4053 ; ---------------------------------
   7ADD                    4054 _menuFin::
   7ADD DD E5         [15] 4055 	push	ix
   7ADF DD 21 00 00   [14] 4056 	ld	ix,#0
   7AE3 DD 39         [15] 4057 	add	ix,sp
   7AE5 F5            [11] 4058 	push	af
   7AE6 F5            [11] 4059 	push	af
   7AE7 DD 75 FE      [19] 4060 	ld	-2 (ix),l
   7AEA DD 74 FF      [19] 4061 	ld	-1 (ix),h
                           4062 ;src/main.c:760: puntuacion_aux = puntuacion/10000;
   7AED 21 10 27      [10] 4063 	ld	hl,#0x2710
   7AF0 E5            [11] 4064 	push	hl
   7AF1 DD 6E FE      [19] 4065 	ld	l,-2 (ix)
   7AF4 DD 66 FF      [19] 4066 	ld	h,-1 (ix)
   7AF7 E5            [11] 4067 	push	hl
   7AF8 CD 3A 52      [17] 4068 	call	__divuint
   7AFB F1            [10] 4069 	pop	af
   7AFC F1            [10] 4070 	pop	af
   7AFD 33            [ 6] 4071 	inc	sp
   7AFE 33            [ 6] 4072 	inc	sp
   7AFF E5            [11] 4073 	push	hl
                           4074 ;src/main.c:763: cpct_clearScreen(0);
   7B00 21 00 40      [10] 4075 	ld	hl,#0x4000
   7B03 E5            [11] 4076 	push	hl
   7B04 AF            [ 4] 4077 	xor	a, a
   7B05 F5            [11] 4078 	push	af
   7B06 33            [ 6] 4079 	inc	sp
   7B07 26 C0         [ 7] 4080 	ld	h, #0xC0
   7B09 E5            [11] 4081 	push	hl
   7B0A CD DA 55      [17] 4082 	call	_cpct_memset
                           4083 ;src/main.c:765: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7B0D 21 18 5A      [10] 4084 	ld	hl,#0x5A18
   7B10 E5            [11] 4085 	push	hl
   7B11 21 00 C0      [10] 4086 	ld	hl,#0xC000
   7B14 E5            [11] 4087 	push	hl
   7B15 CD FB 5E      [17] 4088 	call	_cpct_getScreenPtr
   7B18 4D            [ 4] 4089 	ld	c,l
   7B19 44            [ 4] 4090 	ld	b,h
                           4091 ;src/main.c:766: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7B1A 21 02 00      [10] 4092 	ld	hl,#0x0002
   7B1D E5            [11] 4093 	push	hl
   7B1E C5            [11] 4094 	push	bc
   7B1F 21 88 7C      [10] 4095 	ld	hl,#___str_0
   7B22 E5            [11] 4096 	push	hl
   7B23 CD 14 53      [17] 4097 	call	_cpct_drawStringM0
   7B26 21 06 00      [10] 4098 	ld	hl,#6
   7B29 39            [11] 4099 	add	hl,sp
   7B2A F9            [ 6] 4100 	ld	sp,hl
                           4101 ;src/main.c:768: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   7B2B 21 14 78      [10] 4102 	ld	hl,#0x7814
   7B2E E5            [11] 4103 	push	hl
   7B2F 21 00 C0      [10] 4104 	ld	hl,#0xC000
   7B32 E5            [11] 4105 	push	hl
   7B33 CD FB 5E      [17] 4106 	call	_cpct_getScreenPtr
   7B36 4D            [ 4] 4107 	ld	c,l
   7B37 44            [ 4] 4108 	ld	b,h
                           4109 ;src/main.c:769: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   7B38 21 02 00      [10] 4110 	ld	hl,#0x0002
   7B3B E5            [11] 4111 	push	hl
   7B3C C5            [11] 4112 	push	bc
   7B3D 21 92 7C      [10] 4113 	ld	hl,#___str_1
   7B40 E5            [11] 4114 	push	hl
   7B41 CD 14 53      [17] 4115 	call	_cpct_drawStringM0
   7B44 21 06 00      [10] 4116 	ld	hl,#6
   7B47 39            [11] 4117 	add	hl,sp
   7B48 F9            [ 6] 4118 	ld	sp,hl
                           4119 ;src/main.c:771: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   7B49 21 2D 78      [10] 4120 	ld	hl,#0x782D
   7B4C E5            [11] 4121 	push	hl
   7B4D 21 00 C0      [10] 4122 	ld	hl,#0xC000
   7B50 E5            [11] 4123 	push	hl
   7B51 CD FB 5E      [17] 4124 	call	_cpct_getScreenPtr
                           4125 ;src/main.c:773: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   7B54 E5            [11] 4126 	push	hl
   7B55 21 0A 00      [10] 4127 	ld	hl,#0x000A
   7B58 E5            [11] 4128 	push	hl
   7B59 DD 6E FC      [19] 4129 	ld	l,-4 (ix)
   7B5C DD 66 FD      [19] 4130 	ld	h,-3 (ix)
   7B5F E5            [11] 4131 	push	hl
   7B60 CD 09 55      [17] 4132 	call	__moduint
   7B63 F1            [10] 4133 	pop	af
   7B64 F1            [10] 4134 	pop	af
   7B65 C1            [10] 4135 	pop	bc
   7B66 7D            [ 4] 4136 	ld	a,l
   7B67 C6 30         [ 7] 4137 	add	a, #0x30
   7B69 67            [ 4] 4138 	ld	h,a
   7B6A 59            [ 4] 4139 	ld	e, c
   7B6B 50            [ 4] 4140 	ld	d, b
   7B6C C5            [11] 4141 	push	bc
   7B6D E5            [11] 4142 	push	hl
   7B6E 33            [ 6] 4143 	inc	sp
   7B6F 21 02 00      [10] 4144 	ld	hl,#0x0002
   7B72 E5            [11] 4145 	push	hl
   7B73 D5            [11] 4146 	push	de
   7B74 CD 70 54      [17] 4147 	call	_cpct_drawCharM0
   7B77 F1            [10] 4148 	pop	af
   7B78 33            [ 6] 4149 	inc	sp
   7B79 21 E8 03      [10] 4150 	ld	hl,#0x03E8
   7B7C E3            [19] 4151 	ex	(sp),hl
   7B7D DD 6E FE      [19] 4152 	ld	l,-2 (ix)
   7B80 DD 66 FF      [19] 4153 	ld	h,-1 (ix)
   7B83 E5            [11] 4154 	push	hl
   7B84 CD 3A 52      [17] 4155 	call	__divuint
   7B87 F1            [10] 4156 	pop	af
   7B88 F1            [10] 4157 	pop	af
   7B89 11 0A 00      [10] 4158 	ld	de,#0x000A
   7B8C D5            [11] 4159 	push	de
   7B8D E5            [11] 4160 	push	hl
   7B8E CD 09 55      [17] 4161 	call	__moduint
   7B91 F1            [10] 4162 	pop	af
   7B92 F1            [10] 4163 	pop	af
   7B93 C1            [10] 4164 	pop	bc
   7B94 7D            [ 4] 4165 	ld	a,l
   7B95 C6 30         [ 7] 4166 	add	a, #0x30
   7B97 67            [ 4] 4167 	ld	h,a
   7B98 79            [ 4] 4168 	ld	a,c
   7B99 C6 04         [ 7] 4169 	add	a, #0x04
   7B9B 5F            [ 4] 4170 	ld	e,a
   7B9C 78            [ 4] 4171 	ld	a,b
   7B9D CE 00         [ 7] 4172 	adc	a, #0x00
   7B9F 57            [ 4] 4173 	ld	d,a
   7BA0 C5            [11] 4174 	push	bc
   7BA1 E5            [11] 4175 	push	hl
   7BA2 33            [ 6] 4176 	inc	sp
   7BA3 21 02 00      [10] 4177 	ld	hl,#0x0002
   7BA6 E5            [11] 4178 	push	hl
   7BA7 D5            [11] 4179 	push	de
   7BA8 CD 70 54      [17] 4180 	call	_cpct_drawCharM0
   7BAB F1            [10] 4181 	pop	af
   7BAC 33            [ 6] 4182 	inc	sp
   7BAD 21 64 00      [10] 4183 	ld	hl,#0x0064
   7BB0 E3            [19] 4184 	ex	(sp),hl
   7BB1 DD 6E FE      [19] 4185 	ld	l,-2 (ix)
   7BB4 DD 66 FF      [19] 4186 	ld	h,-1 (ix)
   7BB7 E5            [11] 4187 	push	hl
   7BB8 CD 3A 52      [17] 4188 	call	__divuint
   7BBB F1            [10] 4189 	pop	af
   7BBC F1            [10] 4190 	pop	af
   7BBD 11 0A 00      [10] 4191 	ld	de,#0x000A
   7BC0 D5            [11] 4192 	push	de
   7BC1 E5            [11] 4193 	push	hl
   7BC2 CD 09 55      [17] 4194 	call	__moduint
   7BC5 F1            [10] 4195 	pop	af
   7BC6 F1            [10] 4196 	pop	af
   7BC7 C1            [10] 4197 	pop	bc
   7BC8 7D            [ 4] 4198 	ld	a,l
   7BC9 C6 30         [ 7] 4199 	add	a, #0x30
   7BCB 57            [ 4] 4200 	ld	d,a
   7BCC FD 21 08 00   [14] 4201 	ld	iy,#0x0008
   7BD0 FD 09         [15] 4202 	add	iy,bc
   7BD2 C5            [11] 4203 	push	bc
   7BD3 D5            [11] 4204 	push	de
   7BD4 33            [ 6] 4205 	inc	sp
   7BD5 21 02 00      [10] 4206 	ld	hl,#0x0002
   7BD8 E5            [11] 4207 	push	hl
   7BD9 FD E5         [15] 4208 	push	iy
   7BDB CD 70 54      [17] 4209 	call	_cpct_drawCharM0
   7BDE F1            [10] 4210 	pop	af
   7BDF 33            [ 6] 4211 	inc	sp
   7BE0 21 0A 00      [10] 4212 	ld	hl,#0x000A
   7BE3 E3            [19] 4213 	ex	(sp),hl
   7BE4 DD 6E FE      [19] 4214 	ld	l,-2 (ix)
   7BE7 DD 66 FF      [19] 4215 	ld	h,-1 (ix)
   7BEA E5            [11] 4216 	push	hl
   7BEB CD 3A 52      [17] 4217 	call	__divuint
   7BEE F1            [10] 4218 	pop	af
   7BEF F1            [10] 4219 	pop	af
   7BF0 11 0A 00      [10] 4220 	ld	de,#0x000A
   7BF3 D5            [11] 4221 	push	de
   7BF4 E5            [11] 4222 	push	hl
   7BF5 CD 09 55      [17] 4223 	call	__moduint
   7BF8 F1            [10] 4224 	pop	af
   7BF9 F1            [10] 4225 	pop	af
   7BFA C1            [10] 4226 	pop	bc
   7BFB 7D            [ 4] 4227 	ld	a,l
   7BFC C6 30         [ 7] 4228 	add	a, #0x30
   7BFE 57            [ 4] 4229 	ld	d,a
   7BFF FD 21 0C 00   [14] 4230 	ld	iy,#0x000C
   7C03 FD 09         [15] 4231 	add	iy,bc
   7C05 C5            [11] 4232 	push	bc
   7C06 D5            [11] 4233 	push	de
   7C07 33            [ 6] 4234 	inc	sp
   7C08 21 02 00      [10] 4235 	ld	hl,#0x0002
   7C0B E5            [11] 4236 	push	hl
   7C0C FD E5         [15] 4237 	push	iy
   7C0E CD 70 54      [17] 4238 	call	_cpct_drawCharM0
   7C11 F1            [10] 4239 	pop	af
   7C12 33            [ 6] 4240 	inc	sp
   7C13 21 0A 00      [10] 4241 	ld	hl,#0x000A
   7C16 E3            [19] 4242 	ex	(sp),hl
   7C17 DD 6E FE      [19] 4243 	ld	l,-2 (ix)
   7C1A DD 66 FF      [19] 4244 	ld	h,-1 (ix)
   7C1D E5            [11] 4245 	push	hl
   7C1E CD 09 55      [17] 4246 	call	__moduint
   7C21 F1            [10] 4247 	pop	af
   7C22 F1            [10] 4248 	pop	af
   7C23 C1            [10] 4249 	pop	bc
   7C24 7D            [ 4] 4250 	ld	a,l
   7C25 C6 30         [ 7] 4251 	add	a, #0x30
   7C27 57            [ 4] 4252 	ld	d,a
   7C28 21 10 00      [10] 4253 	ld	hl,#0x0010
   7C2B 09            [11] 4254 	add	hl,bc
   7C2C 4D            [ 4] 4255 	ld	c,l
   7C2D 44            [ 4] 4256 	ld	b,h
   7C2E D5            [11] 4257 	push	de
   7C2F 33            [ 6] 4258 	inc	sp
   7C30 21 02 00      [10] 4259 	ld	hl,#0x0002
   7C33 E5            [11] 4260 	push	hl
   7C34 C5            [11] 4261 	push	bc
   7C35 CD 70 54      [17] 4262 	call	_cpct_drawCharM0
   7C38 F1            [10] 4263 	pop	af
                           4264 ;src/main.c:783: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 160); // centrado en horizontal y abajo en vertical
   7C39 33            [ 6] 4265 	inc	sp
   7C3A 21 0E A0      [10] 4266 	ld	hl,#0xA00E
   7C3D E3            [19] 4267 	ex	(sp),hl
   7C3E 21 00 C0      [10] 4268 	ld	hl,#0xC000
   7C41 E5            [11] 4269 	push	hl
   7C42 CD FB 5E      [17] 4270 	call	_cpct_getScreenPtr
   7C45 4D            [ 4] 4271 	ld	c,l
   7C46 44            [ 4] 4272 	ld	b,h
                           4273 ;src/main.c:784: cpct_drawStringM0("TO PLAY AGAIN", memptr, 2, 0);
   7C47 21 02 00      [10] 4274 	ld	hl,#0x0002
   7C4A E5            [11] 4275 	push	hl
   7C4B C5            [11] 4276 	push	bc
   7C4C 21 9A 7C      [10] 4277 	ld	hl,#___str_2
   7C4F E5            [11] 4278 	push	hl
   7C50 CD 14 53      [17] 4279 	call	_cpct_drawStringM0
   7C53 21 06 00      [10] 4280 	ld	hl,#6
   7C56 39            [11] 4281 	add	hl,sp
   7C57 F9            [ 6] 4282 	ld	sp,hl
                           4283 ;src/main.c:786: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 28, 170); // centrado en horizontal y abajo en vertical
   7C58 21 1C AA      [10] 4284 	ld	hl,#0xAA1C
   7C5B E5            [11] 4285 	push	hl
   7C5C 21 00 C0      [10] 4286 	ld	hl,#0xC000
   7C5F E5            [11] 4287 	push	hl
   7C60 CD FB 5E      [17] 4288 	call	_cpct_getScreenPtr
   7C63 4D            [ 4] 4289 	ld	c,l
   7C64 44            [ 4] 4290 	ld	b,h
                           4291 ;src/main.c:787: cpct_drawStringM0("PRESS P", memptr, 2, 0);
   7C65 21 02 00      [10] 4292 	ld	hl,#0x0002
   7C68 E5            [11] 4293 	push	hl
   7C69 C5            [11] 4294 	push	bc
   7C6A 21 A8 7C      [10] 4295 	ld	hl,#___str_3
   7C6D E5            [11] 4296 	push	hl
   7C6E CD 14 53      [17] 4297 	call	_cpct_drawStringM0
   7C71 21 06 00      [10] 4298 	ld	hl,#6
   7C74 39            [11] 4299 	add	hl,sp
   7C75 F9            [ 6] 4300 	ld	sp,hl
                           4301 ;src/main.c:790: do{
   7C76                    4302 00101$:
                           4303 ;src/main.c:791: cpct_scanKeyboard_f();
   7C76 CD 9E 52      [17] 4304 	call	_cpct_scanKeyboard_f
                           4305 ;src/main.c:794: } while(!cpct_isKeyPressed(Key_P));
   7C79 21 03 08      [10] 4306 	ld	hl,#0x0803
   7C7C CD 92 52      [17] 4307 	call	_cpct_isKeyPressed
   7C7F 7D            [ 4] 4308 	ld	a,l
   7C80 B7            [ 4] 4309 	or	a, a
   7C81 28 F3         [12] 4310 	jr	Z,00101$
   7C83 DD F9         [10] 4311 	ld	sp, ix
   7C85 DD E1         [14] 4312 	pop	ix
   7C87 C9            [10] 4313 	ret
   7C88                    4314 ___str_0:
   7C88 47 41 4D 45 20 4F  4315 	.ascii "GAME OVER"
        56 45 52
   7C91 00                 4316 	.db 0x00
   7C92                    4317 ___str_1:
   7C92 53 43 4F 52 45 3A  4318 	.ascii "SCORE: "
        20
   7C99 00                 4319 	.db 0x00
   7C9A                    4320 ___str_2:
   7C9A 54 4F 20 50 4C 41  4321 	.ascii "TO PLAY AGAIN"
        59 20 41 47 41 49
        4E
   7CA7 00                 4322 	.db 0x00
   7CA8                    4323 ___str_3:
   7CA8 50 52 45 53 53 20  4324 	.ascii "PRESS P"
        50
   7CAF 00                 4325 	.db 0x00
                           4326 ;src/main.c:797: void avanzarMapa() {
                           4327 ;	---------------------------------
                           4328 ; Function avanzarMapa
                           4329 ; ---------------------------------
   7CB0                    4330 _avanzarMapa::
                           4331 ;src/main.c:798: if(num_mapa < NUM_MAPAS -1) {
   7CB0 3A FB 62      [13] 4332 	ld	a,(#_num_mapa + 0)
   7CB3 D6 02         [ 7] 4333 	sub	a, #0x02
   7CB5 30 34         [12] 4334 	jr	NC,00102$
                           4335 ;src/main.c:799: mapa = mapas[++num_mapa];
   7CB7 01 DF 63      [10] 4336 	ld	bc,#_mapas+0
   7CBA 21 FB 62      [10] 4337 	ld	hl, #_num_mapa+0
   7CBD 34            [11] 4338 	inc	(hl)
   7CBE FD 21 FB 62   [14] 4339 	ld	iy,#_num_mapa
   7CC2 FD 6E 00      [19] 4340 	ld	l,0 (iy)
   7CC5 26 00         [ 7] 4341 	ld	h,#0x00
   7CC7 29            [11] 4342 	add	hl, hl
   7CC8 09            [11] 4343 	add	hl,bc
   7CC9 7E            [ 7] 4344 	ld	a,(hl)
   7CCA FD 21 F9 62   [14] 4345 	ld	iy,#_mapa
   7CCE FD 77 00      [19] 4346 	ld	0 (iy),a
   7CD1 23            [ 6] 4347 	inc	hl
   7CD2 7E            [ 7] 4348 	ld	a,(hl)
   7CD3 32 FA 62      [13] 4349 	ld	(#_mapa + 1),a
                           4350 ;src/main.c:800: prota.x = prota.px = 2;
   7CD6 21 E4 62      [10] 4351 	ld	hl,#(_prota + 0x0002)
   7CD9 36 02         [10] 4352 	ld	(hl),#0x02
   7CDB 21 E2 62      [10] 4353 	ld	hl,#_prota
   7CDE 36 02         [10] 4354 	ld	(hl),#0x02
                           4355 ;src/main.c:801: prota.mover = SI;
   7CE0 21 E8 62      [10] 4356 	ld	hl,#(_prota + 0x0006)
   7CE3 36 01         [10] 4357 	ld	(hl),#0x01
                           4358 ;src/main.c:802: dibujarMapa();
   7CE5 CD C9 63      [17] 4359 	call	_dibujarMapa
                           4360 ;src/main.c:803: inicializarEnemy();
   7CE8 C3 4B 78      [10] 4361 	jp  _inicializarEnemy
   7CEB                    4362 00102$:
                           4363 ;src/main.c:806: menuFin(puntuacion);
   7CEB FD 21 FD 62   [14] 4364 	ld	iy,#_puntuacion
   7CEF FD 6E 00      [19] 4365 	ld	l,0 (iy)
   7CF2 26 00         [ 7] 4366 	ld	h,#0x00
   7CF4 C3 DD 7A      [10] 4367 	jp  _menuFin
                           4368 ;src/main.c:811: void main(void) {
                           4369 ;	---------------------------------
                           4370 ; Function main
                           4371 ; ---------------------------------
   7CF7                    4372 _main::
   7CF7 DD E5         [15] 4373 	push	ix
   7CF9 DD 21 00 00   [14] 4374 	ld	ix,#0
   7CFD DD 39         [15] 4375 	add	ix,sp
   7CFF 21 F3 FF      [10] 4376 	ld	hl,#-13
   7D02 39            [11] 4377 	add	hl,sp
   7D03 F9            [ 6] 4378 	ld	sp,hl
                           4379 ;src/main.c:818: inicializarCPC();
   7D04 CD 35 7A      [17] 4380 	call	_inicializarCPC
                           4381 ;src/main.c:820: menuInicio();
   7D07 CD 32 4F      [17] 4382 	call	_menuInicio
                           4383 ;src/main.c:822: inicializarJuego();
   7D0A CD 50 7A      [17] 4384 	call	_inicializarJuego
                           4385 ;src/main.c:826: while (1) {
   7D0D                    4386 00152$:
                           4387 ;src/main.c:827: if (endGame) {
   7D0D 3A FC 62      [13] 4388 	ld	a,(#_endGame + 0)
   7D10 B7            [ 4] 4389 	or	a, a
   7D11 28 1F         [12] 4390 	jr	Z,00102$
                           4391 ;src/main.c:828: menuFin(puntuacion);
   7D13 FD 21 FD 62   [14] 4392 	ld	iy,#_puntuacion
   7D17 FD 6E 00      [19] 4393 	ld	l,0 (iy)
   7D1A 26 00         [ 7] 4394 	ld	h,#0x00
   7D1C CD DD 7A      [17] 4395 	call	_menuFin
                           4396 ;src/main.c:829: endGame = 0;
   7D1F 21 FC 62      [10] 4397 	ld	hl,#_endGame + 0
   7D22 36 00         [10] 4398 	ld	(hl), #0x00
                           4399 ;src/main.c:830: num_mapa = 0;
   7D24 21 FB 62      [10] 4400 	ld	hl,#_num_mapa + 0
   7D27 36 00         [10] 4401 	ld	(hl), #0x00
                           4402 ;src/main.c:831: mapa = 0;
   7D29 21 00 00      [10] 4403 	ld	hl,#0x0000
   7D2C 22 F9 62      [16] 4404 	ld	(_mapa),hl
                           4405 ;src/main.c:832: inicializarJuego();
   7D2F CD 50 7A      [17] 4406 	call	_inicializarJuego
   7D32                    4407 00102$:
                           4408 ;src/main.c:834: if (endGame) {
   7D32 3A FC 62      [13] 4409 	ld	a,(#_endGame + 0)
   7D35 B7            [ 4] 4410 	or	a, a
   7D36 28 14         [12] 4411 	jr	Z,00104$
                           4412 ;src/main.c:835: menuFin(puntuacion);
   7D38 FD 21 FD 62   [14] 4413 	ld	iy,#_puntuacion
   7D3C FD 6E 00      [19] 4414 	ld	l,0 (iy)
   7D3F 26 00         [ 7] 4415 	ld	h,#0x00
   7D41 CD DD 7A      [17] 4416 	call	_menuFin
                           4417 ;src/main.c:836: endGame = 0;
   7D44 21 FC 62      [10] 4418 	ld	hl,#_endGame + 0
   7D47 36 00         [10] 4419 	ld	(hl), #0x00
                           4420 ;src/main.c:837: inicializarJuego();
   7D49 CD 50 7A      [17] 4421 	call	_inicializarJuego
   7D4C                    4422 00104$:
                           4423 ;src/main.c:839: ++timer;
   7D4C 21 F7 62      [10] 4424 	ld	hl, #_timer+0
   7D4F 34            [11] 4425 	inc	(hl)
   7D50 20 04         [12] 4426 	jr	NZ,00278$
   7D52 21 F8 62      [10] 4427 	ld	hl, #_timer+1
   7D55 34            [11] 4428 	inc	(hl)
   7D56                    4429 00278$:
                           4430 ;src/main.c:840: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7D56 3A F7 62      [13] 4431 	ld	a,(#_timer + 0)
   7D59 D6 04         [ 7] 4432 	sub	a, #0x04
   7D5B 20 30         [12] 4433 	jr	NZ,00108$
   7D5D 3A F8 62      [13] 4434 	ld	a,(#_timer + 1)
   7D60 B7            [ 4] 4435 	or	a, a
   7D61 20 2A         [12] 4436 	jr	NZ,00108$
   7D63 3A F6 62      [13] 4437 	ld	a,(#_cambio + 0)
   7D66 B7            [ 4] 4438 	or	a, a
   7D67 28 24         [12] 4439 	jr	Z,00108$
   7D69 3E 0C         [ 7] 4440 	ld	a,#0x0C
   7D6B FD 21 F6 62   [14] 4441 	ld	iy,#_cambio
   7D6F FD 96 00      [19] 4442 	sub	a, 0 (iy)
   7D72 38 19         [12] 4443 	jr	C,00108$
                           4444 ;src/main.c:841: timer = 0;
   7D74 21 00 00      [10] 4445 	ld	hl,#0x0000
   7D77 22 F7 62      [16] 4446 	ld	(_timer),hl
                           4447 ;src/main.c:842: parpadeo = !parpadeo;
   7D7A 3A F5 62      [13] 4448 	ld	a,(#_parpadeo + 0)
   7D7D D6 01         [ 7] 4449 	sub	a,#0x01
   7D7F 3E 00         [ 7] 4450 	ld	a,#0x00
   7D81 17            [ 4] 4451 	rla
   7D82 4F            [ 4] 4452 	ld	c,a
   7D83 21 F5 62      [10] 4453 	ld	hl,#_parpadeo + 0
   7D86 71            [ 7] 4454 	ld	(hl), c
                           4455 ;src/main.c:843: cambio ++;
   7D87 21 F6 62      [10] 4456 	ld	hl, #_cambio+0
   7D8A 34            [11] 4457 	inc	(hl)
   7D8B 18 0C         [12] 4458 	jr	00109$
   7D8D                    4459 00108$:
                           4460 ;src/main.c:844: }else if(cambio == 12){
   7D8D 3A F6 62      [13] 4461 	ld	a,(#_cambio + 0)
   7D90 D6 0C         [ 7] 4462 	sub	a, #0x0C
   7D92 20 05         [12] 4463 	jr	NZ,00109$
                           4464 ;src/main.c:845: cambio = 0;
   7D94 21 F6 62      [10] 4465 	ld	hl,#_cambio + 0
   7D97 36 00         [10] 4466 	ld	(hl), #0x00
   7D99                    4467 00109$:
                           4468 ;src/main.c:847: i = 2 + num_mapa;
   7D99 21 FB 62      [10] 4469 	ld	hl,#_num_mapa + 0
   7D9C 4E            [ 7] 4470 	ld	c, (hl)
   7D9D 0C            [ 4] 4471 	inc	c
   7D9E 0C            [ 4] 4472 	inc	c
                           4473 ;src/main.c:848: actual = enemy;
                           4474 ;src/main.c:850: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D9F C5            [11] 4475 	push	bc
   7DA0 21 00 01      [10] 4476 	ld	hl,#_g_tablatrans
   7DA3 E5            [11] 4477 	push	hl
   7DA4 2A F9 62      [16] 4478 	ld	hl,(_mapa)
   7DA7 E5            [11] 4479 	push	hl
   7DA8 21 E2 62      [10] 4480 	ld	hl,#_prota
   7DAB E5            [11] 4481 	push	hl
   7DAC 21 EA 62      [10] 4482 	ld	hl,#_cu
   7DAF E5            [11] 4483 	push	hl
   7DB0 CD C3 64      [17] 4484 	call	_comprobarTeclado
   7DB3 21 08 00      [10] 4485 	ld	hl,#8
   7DB6 39            [11] 4486 	add	hl,sp
   7DB7 F9            [ 6] 4487 	ld	sp,hl
   7DB8 2A F9 62      [16] 4488 	ld	hl,(_mapa)
   7DBB E5            [11] 4489 	push	hl
   7DBC 21 EA 62      [10] 4490 	ld	hl,#_cu
   7DBF E5            [11] 4491 	push	hl
   7DC0 CD 15 43      [17] 4492 	call	_moverCuchillo
   7DC3 F1            [10] 4493 	pop	af
   7DC4 F1            [10] 4494 	pop	af
   7DC5 C1            [10] 4495 	pop	bc
                           4496 ;src/main.c:852: while(i){
   7DC6 DD 71 F3      [19] 4497 	ld	-13 (ix),c
   7DC9 DD 36 FA 56   [19] 4498 	ld	-6 (ix),#<(_enemy)
   7DCD DD 36 FB 5F   [19] 4499 	ld	-5 (ix),#>(_enemy)
   7DD1                    4500 00119$:
   7DD1 DD 7E F3      [19] 4501 	ld	a,-13 (ix)
   7DD4 B7            [ 4] 4502 	or	a, a
   7DD5 28 6A         [12] 4503 	jr	Z,00121$
                           4504 ;src/main.c:854: --i;
   7DD7 DD 35 F3      [23] 4505 	dec	-13 (ix)
                           4506 ;src/main.c:855: if(!actual->muerto){
   7DDA DD 7E FA      [19] 4507 	ld	a,-6 (ix)
   7DDD C6 08         [ 7] 4508 	add	a, #0x08
   7DDF DD 77 FE      [19] 4509 	ld	-2 (ix),a
   7DE2 DD 7E FB      [19] 4510 	ld	a,-5 (ix)
   7DE5 CE 00         [ 7] 4511 	adc	a, #0x00
   7DE7 DD 77 FF      [19] 4512 	ld	-1 (ix),a
   7DEA DD 6E FE      [19] 4513 	ld	l,-2 (ix)
   7DED DD 66 FF      [19] 4514 	ld	h,-1 (ix)
   7DF0 7E            [ 7] 4515 	ld	a,(hl)
   7DF1 B7            [ 4] 4516 	or	a, a
   7DF2 20 12         [12] 4517 	jr	NZ,00113$
                           4518 ;src/main.c:856: checkEnemyDead(cu.direccion, actual);
   7DF4 21 F1 62      [10] 4519 	ld	hl, #_cu + 7
   7DF7 46            [ 7] 4520 	ld	b,(hl)
   7DF8 DD 6E FA      [19] 4521 	ld	l,-6 (ix)
   7DFB DD 66 FB      [19] 4522 	ld	h,-5 (ix)
   7DFE E5            [11] 4523 	push	hl
   7DFF C5            [11] 4524 	push	bc
   7E00 33            [ 6] 4525 	inc	sp
   7E01 CD 1D 68      [17] 4526 	call	_checkEnemyDead
   7E04 F1            [10] 4527 	pop	af
   7E05 33            [ 6] 4528 	inc	sp
   7E06                    4529 00113$:
                           4530 ;src/main.c:858: if(!actual->muerto){
   7E06 DD 6E FE      [19] 4531 	ld	l,-2 (ix)
   7E09 DD 66 FF      [19] 4532 	ld	h,-1 (ix)
   7E0C 7E            [ 7] 4533 	ld	a,(hl)
   7E0D B7            [ 4] 4534 	or	a, a
   7E0E 20 1F         [12] 4535 	jr	NZ,00118$
                           4536 ;src/main.c:859: if (!actual->didDamage)
   7E10 DD 7E FA      [19] 4537 	ld	a,-6 (ix)
   7E13 C6 16         [ 7] 4538 	add	a, #0x16
   7E15 4F            [ 4] 4539 	ld	c,a
   7E16 DD 7E FB      [19] 4540 	ld	a,-5 (ix)
   7E19 CE 00         [ 7] 4541 	adc	a, #0x00
   7E1B 47            [ 4] 4542 	ld	b,a
   7E1C 0A            [ 7] 4543 	ld	a,(bc)
   7E1D B7            [ 4] 4544 	or	a, a
   7E1E 20 0D         [12] 4545 	jr	NZ,00115$
                           4546 ;src/main.c:860: updateEnemy(actual);
   7E20 DD 6E FA      [19] 4547 	ld	l,-6 (ix)
   7E23 DD 66 FB      [19] 4548 	ld	h,-5 (ix)
   7E26 E5            [11] 4549 	push	hl
   7E27 CD EB 76      [17] 4550 	call	_updateEnemy
   7E2A F1            [10] 4551 	pop	af
   7E2B 18 02         [12] 4552 	jr	00118$
   7E2D                    4553 00115$:
                           4554 ;src/main.c:862: actual->didDamage = 0;
   7E2D AF            [ 4] 4555 	xor	a, a
   7E2E 02            [ 7] 4556 	ld	(bc),a
   7E2F                    4557 00118$:
                           4558 ;src/main.c:864: ++actual;
   7E2F DD 7E FA      [19] 4559 	ld	a,-6 (ix)
   7E32 C6 E3         [ 7] 4560 	add	a, #0xE3
   7E34 DD 77 FA      [19] 4561 	ld	-6 (ix),a
   7E37 DD 7E FB      [19] 4562 	ld	a,-5 (ix)
   7E3A CE 00         [ 7] 4563 	adc	a, #0x00
   7E3C DD 77 FB      [19] 4564 	ld	-5 (ix),a
   7E3F 18 90         [12] 4565 	jr	00119$
   7E41                    4566 00121$:
                           4567 ;src/main.c:867: cpct_waitVSYNC();
   7E41 CD B4 55      [17] 4568 	call	_cpct_waitVSYNC
                           4569 ;src/main.c:870: if (prota.mover) {
   7E44 01 E8 62      [10] 4570 	ld	bc,#_prota + 6
   7E47 0A            [ 7] 4571 	ld	a,(bc)
   7E48 B7            [ 4] 4572 	or	a, a
   7E49 28 07         [12] 4573 	jr	Z,00123$
                           4574 ;src/main.c:871: redibujarProta();
   7E4B C5            [11] 4575 	push	bc
   7E4C CD AF 64      [17] 4576 	call	_redibujarProta
   7E4F C1            [10] 4577 	pop	bc
                           4578 ;src/main.c:872: prota.mover = NO;
   7E50 AF            [ 4] 4579 	xor	a, a
   7E51 02            [ 7] 4580 	ld	(bc),a
   7E52                    4581 00123$:
                           4582 ;src/main.c:874: if(cu.lanzado && cu.mover){
   7E52 21 F0 62      [10] 4583 	ld	hl, #(_cu + 0x0006) + 0
   7E55 4E            [ 7] 4584 	ld	c,(hl)
                           4585 ;src/main.c:875: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4586 ;src/main.c:874: if(cu.lanzado && cu.mover){
   7E56 79            [ 4] 4587 	ld	a,c
   7E57 B7            [ 4] 4588 	or	a, a
   7E58 28 30         [12] 4589 	jr	Z,00128$
   7E5A 3A F3 62      [13] 4590 	ld	a, (#(_cu + 0x0009) + 0)
   7E5D B7            [ 4] 4591 	or	a, a
   7E5E 28 2A         [12] 4592 	jr	Z,00128$
                           4593 ;src/main.c:875: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E60 21 EB 62      [10] 4594 	ld	hl, #(_cu + 0x0001) + 0
   7E63 4E            [ 7] 4595 	ld	c,(hl)
   7E64 21 EA 62      [10] 4596 	ld	hl, #_cu + 0
   7E67 46            [ 7] 4597 	ld	b,(hl)
   7E68 21 F2 62      [10] 4598 	ld	hl, #(_cu + 0x0008) + 0
   7E6B 5E            [ 7] 4599 	ld	e,(hl)
   7E6C 2A F9 62      [16] 4600 	ld	hl,(_mapa)
   7E6F E5            [11] 4601 	push	hl
   7E70 21 00 01      [10] 4602 	ld	hl,#_g_tablatrans
   7E73 E5            [11] 4603 	push	hl
   7E74 21 EA 62      [10] 4604 	ld	hl,#_cu
   7E77 E5            [11] 4605 	push	hl
   7E78 79            [ 4] 4606 	ld	a,c
   7E79 F5            [11] 4607 	push	af
   7E7A 33            [ 6] 4608 	inc	sp
   7E7B C5            [11] 4609 	push	bc
   7E7C 33            [ 6] 4610 	inc	sp
   7E7D 7B            [ 4] 4611 	ld	a,e
   7E7E F5            [11] 4612 	push	af
   7E7F 33            [ 6] 4613 	inc	sp
   7E80 CD 25 40      [17] 4614 	call	_redibujarCuchillo
   7E83 21 09 00      [10] 4615 	ld	hl,#9
   7E86 39            [11] 4616 	add	hl,sp
   7E87 F9            [ 6] 4617 	ld	sp,hl
   7E88 18 32         [12] 4618 	jr	00129$
   7E8A                    4619 00128$:
                           4620 ;src/main.c:876: }else if (cu.lanzado && !cu.mover){
   7E8A 79            [ 4] 4621 	ld	a,c
   7E8B B7            [ 4] 4622 	or	a, a
   7E8C 28 2E         [12] 4623 	jr	Z,00129$
   7E8E 3A F3 62      [13] 4624 	ld	a, (#(_cu + 0x0009) + 0)
   7E91 B7            [ 4] 4625 	or	a, a
   7E92 20 28         [12] 4626 	jr	NZ,00129$
                           4627 ;src/main.c:877: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E94 21 EB 62      [10] 4628 	ld	hl, #(_cu + 0x0001) + 0
   7E97 46            [ 7] 4629 	ld	b,(hl)
   7E98 21 EA 62      [10] 4630 	ld	hl, #_cu + 0
   7E9B 4E            [ 7] 4631 	ld	c,(hl)
   7E9C 21 F2 62      [10] 4632 	ld	hl, #(_cu + 0x0008) + 0
   7E9F 56            [ 7] 4633 	ld	d,(hl)
   7EA0 2A F9 62      [16] 4634 	ld	hl,(_mapa)
   7EA3 E5            [11] 4635 	push	hl
   7EA4 C5            [11] 4636 	push	bc
   7EA5 D5            [11] 4637 	push	de
   7EA6 33            [ 6] 4638 	inc	sp
   7EA7 CD 92 3F      [17] 4639 	call	_borrarCuchillo
   7EAA F1            [10] 4640 	pop	af
   7EAB F1            [10] 4641 	pop	af
   7EAC 33            [ 6] 4642 	inc	sp
                           4643 ;src/main.c:878: cu.lanzado = NO;
   7EAD 21 F0 62      [10] 4644 	ld	hl,#(_cu + 0x0006)
   7EB0 36 00         [10] 4645 	ld	(hl),#0x00
                           4646 ;src/main.c:880: cu.x = 0;
   7EB2 21 EA 62      [10] 4647 	ld	hl,#_cu
   7EB5 36 00         [10] 4648 	ld	(hl),#0x00
                           4649 ;src/main.c:881: cu.y=0;
   7EB7 21 EB 62      [10] 4650 	ld	hl,#(_cu + 0x0001)
   7EBA 36 00         [10] 4651 	ld	(hl),#0x00
   7EBC                    4652 00129$:
                           4653 ;src/main.c:884: i = 2 + num_mapa;
   7EBC 21 FB 62      [10] 4654 	ld	hl,#_num_mapa + 0
   7EBF 4E            [ 7] 4655 	ld	c, (hl)
   7EC0 0C            [ 4] 4656 	inc	c
   7EC1 0C            [ 4] 4657 	inc	c
                           4658 ;src/main.c:885: actual = enemy;
   7EC2 11 56 5F      [10] 4659 	ld	de,#_enemy
                           4660 ;src/main.c:886: while(i){
   7EC5                    4661 00148$:
   7EC5 79            [ 4] 4662 	ld	a,c
   7EC6 B7            [ 4] 4663 	or	a, a
   7EC7 CA 43 80      [10] 4664 	jp	Z,00150$
                           4665 ;src/main.c:888: --i;
   7ECA 0D            [ 4] 4666 	dec	c
                           4667 ;src/main.c:889: if(actual->mover){
   7ECB 21 06 00      [10] 4668 	ld	hl,#0x0006
   7ECE 19            [11] 4669 	add	hl,de
   7ECF DD 75 FE      [19] 4670 	ld	-2 (ix),l
   7ED2 DD 74 FF      [19] 4671 	ld	-1 (ix),h
   7ED5 DD 6E FE      [19] 4672 	ld	l,-2 (ix)
   7ED8 DD 66 FF      [19] 4673 	ld	h,-1 (ix)
   7EDB 46            [ 7] 4674 	ld	b,(hl)
                           4675 ;src/main.c:890: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7EDC 21 03 00      [10] 4676 	ld	hl,#0x0003
   7EDF 19            [11] 4677 	add	hl,de
   7EE0 DD 75 FA      [19] 4678 	ld	-6 (ix),l
   7EE3 DD 74 FB      [19] 4679 	ld	-5 (ix),h
   7EE6 21 02 00      [10] 4680 	ld	hl,#0x0002
   7EE9 19            [11] 4681 	add	hl,de
   7EEA DD 75 FC      [19] 4682 	ld	-4 (ix),l
   7EED DD 74 FD      [19] 4683 	ld	-3 (ix),h
                           4684 ;src/main.c:889: if(actual->mover){
   7EF0 78            [ 4] 4685 	ld	a,b
   7EF1 B7            [ 4] 4686 	or	a, a
   7EF2 28 22         [12] 4687 	jr	Z,00132$
                           4688 ;src/main.c:890: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7EF4 DD 6E FA      [19] 4689 	ld	l,-6 (ix)
   7EF7 DD 66 FB      [19] 4690 	ld	h,-5 (ix)
   7EFA 7E            [ 7] 4691 	ld	a,(hl)
   7EFB DD 77 F3      [19] 4692 	ld	-13 (ix),a
   7EFE DD 6E FC      [19] 4693 	ld	l,-4 (ix)
   7F01 DD 66 FD      [19] 4694 	ld	h,-3 (ix)
   7F04 46            [ 7] 4695 	ld	b,(hl)
   7F05 C5            [11] 4696 	push	bc
   7F06 D5            [11] 4697 	push	de
   7F07 D5            [11] 4698 	push	de
   7F08 DD 7E F3      [19] 4699 	ld	a,-13 (ix)
   7F0B F5            [11] 4700 	push	af
   7F0C 33            [ 6] 4701 	inc	sp
   7F0D C5            [11] 4702 	push	bc
   7F0E 33            [ 6] 4703 	inc	sp
   7F0F CD EC 67      [17] 4704 	call	_redibujarEnemigo
   7F12 F1            [10] 4705 	pop	af
   7F13 F1            [10] 4706 	pop	af
   7F14 D1            [10] 4707 	pop	de
   7F15 C1            [10] 4708 	pop	bc
   7F16                    4709 00132$:
                           4710 ;src/main.c:893: if (actual->muerto && actual->muertes == 0){
   7F16 21 08 00      [10] 4711 	ld	hl,#0x0008
   7F19 19            [11] 4712 	add	hl,de
   7F1A DD 75 F8      [19] 4713 	ld	-8 (ix),l
   7F1D DD 74 F9      [19] 4714 	ld	-7 (ix),h
   7F20 DD 6E F8      [19] 4715 	ld	l,-8 (ix)
   7F23 DD 66 F9      [19] 4716 	ld	h,-7 (ix)
   7F26 7E            [ 7] 4717 	ld	a,(hl)
   7F27 B7            [ 4] 4718 	or	a, a
   7F28 CA BE 7F      [10] 4719 	jp	Z,00134$
   7F2B 21 09 00      [10] 4720 	ld	hl,#0x0009
   7F2E 19            [11] 4721 	add	hl,de
   7F2F DD 75 F4      [19] 4722 	ld	-12 (ix),l
   7F32 DD 74 F5      [19] 4723 	ld	-11 (ix),h
   7F35 DD 6E F4      [19] 4724 	ld	l,-12 (ix)
   7F38 DD 66 F5      [19] 4725 	ld	h,-11 (ix)
   7F3B 7E            [ 7] 4726 	ld	a,(hl)
   7F3C B7            [ 4] 4727 	or	a, a
   7F3D C2 BE 7F      [10] 4728 	jp	NZ,00134$
                           4729 ;src/main.c:894: timer = 3;
   7F40 21 03 00      [10] 4730 	ld	hl,#0x0003
   7F43 22 F7 62      [16] 4731 	ld	(_timer),hl
                           4732 ;src/main.c:895: cambio++;
   7F46 FD 21 F6 62   [14] 4733 	ld	iy,#_cambio
   7F4A FD 34 00      [23] 4734 	inc	0 (iy)
                           4735 ;src/main.c:896: parpadeo = 1;
   7F4D FD 21 F5 62   [14] 4736 	ld	iy,#_parpadeo
   7F51 FD 36 00 01   [19] 4737 	ld	0 (iy),#0x01
                           4738 ;src/main.c:897: borrarEnemigo((*actual).x, (*actual).y);
   7F55 2E 01         [ 7] 4739 	ld	l, #0x01
   7F57 19            [11] 4740 	add	hl,de
   7F58 DD 75 F6      [19] 4741 	ld	-10 (ix),l
   7F5B DD 74 F7      [19] 4742 	ld	-9 (ix),h
   7F5E DD 6E F6      [19] 4743 	ld	l,-10 (ix)
   7F61 DD 66 F7      [19] 4744 	ld	h,-9 (ix)
   7F64 46            [ 7] 4745 	ld	b,(hl)
   7F65 1A            [ 7] 4746 	ld	a,(de)
   7F66 C5            [11] 4747 	push	bc
   7F67 D5            [11] 4748 	push	de
   7F68 C5            [11] 4749 	push	bc
   7F69 33            [ 6] 4750 	inc	sp
   7F6A F5            [11] 4751 	push	af
   7F6B 33            [ 6] 4752 	inc	sp
   7F6C CD 7C 67      [17] 4753 	call	_borrarEnemigo
   7F6F F1            [10] 4754 	pop	af
   7F70 D1            [10] 4755 	pop	de
   7F71 C1            [10] 4756 	pop	bc
                           4757 ;src/main.c:898: puntuacion_aux = puntuacion;
   7F72 FD 21 FD 62   [14] 4758 	ld	iy,#_puntuacion
   7F76 FD 6E 00      [19] 4759 	ld	l,0 (iy)
   7F79 26 00         [ 7] 4760 	ld	h,#0x00
                           4761 ;src/main.c:899: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7F7B C5            [11] 4762 	push	bc
   7F7C D5            [11] 4763 	push	de
   7F7D E5            [11] 4764 	push	hl
   7F7E CD 17 52      [17] 4765 	call	_aumentarPuntuacion
   7F81 F1            [10] 4766 	pop	af
   7F82 D1            [10] 4767 	pop	de
   7F83 C1            [10] 4768 	pop	bc
   7F84 FD 21 FD 62   [14] 4769 	ld	iy,#_puntuacion
   7F88 FD 75 00      [19] 4770 	ld	0 (iy),l
                           4771 ;src/main.c:900: modificarPuntuacion(puntuacion);
   7F8B FD 21 FD 62   [14] 4772 	ld	iy,#_puntuacion
   7F8F FD 6E 00      [19] 4773 	ld	l,0 (iy)
   7F92 26 00         [ 7] 4774 	ld	h,#0x00
   7F94 C5            [11] 4775 	push	bc
   7F95 D5            [11] 4776 	push	de
   7F96 E5            [11] 4777 	push	hl
   7F97 CD AD 50      [17] 4778 	call	_modificarPuntuacion
   7F9A F1            [10] 4779 	pop	af
   7F9B D1            [10] 4780 	pop	de
   7F9C C1            [10] 4781 	pop	bc
                           4782 ;src/main.c:901: actual->mover = NO;
   7F9D DD 6E FE      [19] 4783 	ld	l,-2 (ix)
   7FA0 DD 66 FF      [19] 4784 	ld	h,-1 (ix)
   7FA3 36 00         [10] 4785 	ld	(hl),#0x00
                           4786 ;src/main.c:902: actual->muertes++;
   7FA5 DD 6E F4      [19] 4787 	ld	l,-12 (ix)
   7FA8 DD 66 F5      [19] 4788 	ld	h,-11 (ix)
   7FAB 46            [ 7] 4789 	ld	b,(hl)
   7FAC 04            [ 4] 4790 	inc	b
   7FAD DD 6E F4      [19] 4791 	ld	l,-12 (ix)
   7FB0 DD 66 F5      [19] 4792 	ld	h,-11 (ix)
   7FB3 70            [ 7] 4793 	ld	(hl),b
                           4794 ;src/main.c:903: actual->x = 0;
   7FB4 AF            [ 4] 4795 	xor	a, a
   7FB5 12            [ 7] 4796 	ld	(de),a
                           4797 ;src/main.c:904: actual->y = 0;
   7FB6 DD 6E F6      [19] 4798 	ld	l,-10 (ix)
   7FB9 DD 66 F7      [19] 4799 	ld	h,-9 (ix)
   7FBC 36 00         [10] 4800 	ld	(hl),#0x00
   7FBE                    4801 00134$:
                           4802 ;src/main.c:906: if(parpadeo && actual->muerto && !actual->xplot){
   7FBE 21 19 00      [10] 4803 	ld	hl,#0x0019
   7FC1 19            [11] 4804 	add	hl,de
   7FC2 DD 75 F6      [19] 4805 	ld	-10 (ix),l
   7FC5 DD 74 F7      [19] 4806 	ld	-9 (ix),h
   7FC8 3A F5 62      [13] 4807 	ld	a,(#_parpadeo + 0)
   7FCB B7            [ 4] 4808 	or	a, a
   7FCC 28 1F         [12] 4809 	jr	Z,00144$
   7FCE DD 6E F8      [19] 4810 	ld	l,-8 (ix)
   7FD1 DD 66 F9      [19] 4811 	ld	h,-7 (ix)
   7FD4 7E            [ 7] 4812 	ld	a,(hl)
   7FD5 B7            [ 4] 4813 	or	a, a
   7FD6 28 15         [12] 4814 	jr	Z,00144$
   7FD8 DD 6E F6      [19] 4815 	ld	l,-10 (ix)
   7FDB DD 66 F7      [19] 4816 	ld	h,-9 (ix)
   7FDE 7E            [ 7] 4817 	ld	a,(hl)
   7FDF B7            [ 4] 4818 	or	a, a
   7FE0 20 0B         [12] 4819 	jr	NZ,00144$
                           4820 ;src/main.c:907: dibujarExplosion(actual);
   7FE2 C5            [11] 4821 	push	bc
   7FE3 D5            [11] 4822 	push	de
   7FE4 D5            [11] 4823 	push	de
   7FE5 CD D3 66      [17] 4824 	call	_dibujarExplosion
   7FE8 F1            [10] 4825 	pop	af
   7FE9 D1            [10] 4826 	pop	de
   7FEA C1            [10] 4827 	pop	bc
   7FEB 18 4E         [12] 4828 	jr	00145$
   7FED                    4829 00144$:
                           4830 ;src/main.c:908: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   7FED 3A F5 62      [13] 4831 	ld	a,(#_parpadeo + 0)
   7FF0 B7            [ 4] 4832 	or	a, a
   7FF1 20 48         [12] 4833 	jr	NZ,00145$
   7FF3 DD 6E F8      [19] 4834 	ld	l,-8 (ix)
   7FF6 DD 66 F9      [19] 4835 	ld	h,-7 (ix)
   7FF9 7E            [ 7] 4836 	ld	a,(hl)
   7FFA B7            [ 4] 4837 	or	a, a
   7FFB 28 3E         [12] 4838 	jr	Z,00145$
   7FFD 3E 0C         [ 7] 4839 	ld	a,#0x0C
   7FFF FD 21 F6 62   [14] 4840 	ld	iy,#_cambio
   8003 FD 96 00      [19] 4841 	sub	a, 0 (iy)
   8006 38 33         [12] 4842 	jr	C,00145$
   8008 DD 6E F6      [19] 4843 	ld	l,-10 (ix)
   800B DD 66 F7      [19] 4844 	ld	h,-9 (ix)
   800E 7E            [ 7] 4845 	ld	a,(hl)
   800F B7            [ 4] 4846 	or	a, a
   8010 20 29         [12] 4847 	jr	NZ,00145$
                           4848 ;src/main.c:909: borrarExplosion((*actual).px, (*actual).py);
   8012 DD 6E FA      [19] 4849 	ld	l,-6 (ix)
   8015 DD 66 FB      [19] 4850 	ld	h,-5 (ix)
   8018 7E            [ 7] 4851 	ld	a,(hl)
   8019 DD 6E FC      [19] 4852 	ld	l,-4 (ix)
   801C DD 66 FD      [19] 4853 	ld	h,-3 (ix)
   801F 46            [ 7] 4854 	ld	b,(hl)
   8020 C5            [11] 4855 	push	bc
   8021 D5            [11] 4856 	push	de
   8022 F5            [11] 4857 	push	af
   8023 33            [ 6] 4858 	inc	sp
   8024 C5            [11] 4859 	push	bc
   8025 33            [ 6] 4860 	inc	sp
   8026 CD 0C 67      [17] 4861 	call	_borrarExplosion
   8029 F1            [10] 4862 	pop	af
   802A D1            [10] 4863 	pop	de
   802B C1            [10] 4864 	pop	bc
                           4865 ;src/main.c:910: if(cambio == 12){
   802C 3A F6 62      [13] 4866 	ld	a,(#_cambio + 0)
   802F D6 0C         [ 7] 4867 	sub	a, #0x0C
   8031 20 08         [12] 4868 	jr	NZ,00145$
                           4869 ;src/main.c:911: actual->xplot = SI;
   8033 DD 6E F6      [19] 4870 	ld	l,-10 (ix)
   8036 DD 66 F7      [19] 4871 	ld	h,-9 (ix)
   8039 36 01         [10] 4872 	ld	(hl),#0x01
   803B                    4873 00145$:
                           4874 ;src/main.c:914: ++actual;
   803B 21 E3 00      [10] 4875 	ld	hl,#0x00E3
   803E 19            [11] 4876 	add	hl,de
   803F EB            [ 4] 4877 	ex	de,hl
   8040 C3 C5 7E      [10] 4878 	jp	00148$
   8043                    4879 00150$:
                           4880 ;src/main.c:916: cpct_waitVSYNC();
   8043 CD B4 55      [17] 4881 	call	_cpct_waitVSYNC
   8046 C3 0D 7D      [10] 4882 	jp	00152$
                           4883 	.area _CODE
                           4884 	.area _INITIALIZER
                           4885 	.area _CABS (ABS)
