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
                             72 	.globl _puntuacion
                             73 	.globl _endGame
                             74 	.globl _num_mapa
                             75 	.globl _mapa
                             76 	.globl _i
                             77 	.globl _vidas
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
   62F9                     108 _vidas::
   62F9                     109 	.ds 1
   62FA                     110 _i::
   62FA                     111 	.ds 1
                            112 ;--------------------------------------------------------
                            113 ; ram data
                            114 ;--------------------------------------------------------
                            115 	.area _INITIALIZED
   63C4                     116 _mapa::
   63C4                     117 	.ds 2
   63C6                     118 _num_mapa::
   63C6                     119 	.ds 1
   63C7                     120 _endGame::
   63C7                     121 	.ds 1
   63C8                     122 _puntuacion::
   63C8                     123 	.ds 1
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
   3F0A                     148 _dummy_cpct_transparentMaskTable0M0_container::
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
   63CE                     189 _dibujarMapa::
                            190 ;src/main.c:118: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   63CE 2A C4 63      [16]  191 	ld	hl,(_mapa)
   63D1 E5            [11]  192 	push	hl
   63D2 21 F0 C0      [10]  193 	ld	hl,#0xC0F0
   63D5 E5            [11]  194 	push	hl
   63D6 21 2C 28      [10]  195 	ld	hl,#0x282C
   63D9 E5            [11]  196 	push	hl
   63DA 2E 00         [ 7]  197 	ld	l, #0x00
   63DC E5            [11]  198 	push	hl
   63DD AF            [ 4]  199 	xor	a, a
   63DE F5            [11]  200 	push	af
   63DF 33            [ 6]  201 	inc	sp
   63E0 CD DD 53      [17]  202 	call	_cpct_etm_drawTileBox2x4
   63E3 C9            [10]  203 	ret
   63E4                     204 _mapas:
   63E4 C0 10               205 	.dw _g_map1
   63E6 E0 09               206 	.dw _g_map2
   63E8 00 03               207 	.dw _g_map3
   63EA                     208 _spawnX:
   63EA 24                  209 	.db #0x24	; 36
   63EB 47                  210 	.db #0x47	; 71	'G'
   63EC 30                  211 	.db #0x30	; 48	'0'
   63ED 18                  212 	.db #0x18	; 24
   63EE                     213 _spawnY:
   63EE 2C                  214 	.db #0x2C	; 44
   63EF 66                  215 	.db #0x66	; 102	'f'
   63F0 9A                  216 	.db #0x9A	; 154
   63F1 40                  217 	.db #0x40	; 64
   63F2                     218 _patrolX:
   63F2 00                  219 	.db #0x00	; 0
   63F3 00                  220 	.db #0x00	; 0
   63F4 00                  221 	.db #0x00	; 0
   63F5 00                  222 	.db #0x00	; 0
   63F6 00                  223 	.db #0x00	; 0
   63F7 42                  224 	.db #0x42	; 66	'B'
   63F8 33                  225 	.db #0x33	; 51	'3'
   63F9 00                  226 	.db #0x00	; 0
   63FA 00                  227 	.db #0x00	; 0
   63FB 00                  228 	.db 0x00
   63FC 10                  229 	.db #0x10	; 16
   63FD 33                  230 	.db #0x33	; 51	'3'
   63FE 19                  231 	.db #0x19	; 25
   63FF 00                  232 	.db #0x00	; 0
   6400 00                  233 	.db 0x00
   6401 24                  234 	.db #0x24	; 36
   6402 3C                  235 	.db #0x3C	; 60
   6403 30                  236 	.db #0x30	; 48	'0'
   6404 18                  237 	.db #0x18	; 24
   6405 00                  238 	.db 0x00
   6406                     239 _patrolY:
   6406 00                  240 	.db #0x00	; 0
   6407 00                  241 	.db #0x00	; 0
   6408 00                  242 	.db #0x00	; 0
   6409 00                  243 	.db #0x00	; 0
   640A 00                  244 	.db 0x00
   640B 5E                  245 	.db #0x5E	; 94
   640C A6                  246 	.db #0xA6	; 166
   640D 00                  247 	.db #0x00	; 0
   640E 00                  248 	.db #0x00	; 0
   640F 00                  249 	.db 0x00
   6410 2C                  250 	.db #0x2C	; 44
   6411 66                  251 	.db #0x66	; 102	'f'
   6412 9A                  252 	.db #0x9A	; 154
   6413 00                  253 	.db #0x00	; 0
   6414 00                  254 	.db 0x00
   6415 90                  255 	.db #0x90	; 144
   6416 66                  256 	.db #0x66	; 102	'f'
   6417 2C                  257 	.db #0x2C	; 44
   6418 86                  258 	.db #0x86	; 134
   6419 00                  259 	.db 0x00
                            260 ;src/main.c:121: void dibujarProta() {
                            261 ;	---------------------------------
                            262 ; Function dibujarProta
                            263 ; ---------------------------------
   641A                     264 _dibujarProta::
                            265 ;src/main.c:122: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   641A 21 E3 62      [10]  266 	ld	hl, #_prota + 1
   641D 56            [ 7]  267 	ld	d,(hl)
   641E 21 E2 62      [10]  268 	ld	hl, #_prota + 0
   6421 46            [ 7]  269 	ld	b,(hl)
   6422 D5            [11]  270 	push	de
   6423 33            [ 6]  271 	inc	sp
   6424 C5            [11]  272 	push	bc
   6425 33            [ 6]  273 	inc	sp
   6426 21 00 C0      [10]  274 	ld	hl,#0xC000
   6429 E5            [11]  275 	push	hl
   642A CD FB 5E      [17]  276 	call	_cpct_getScreenPtr
   642D EB            [ 4]  277 	ex	de,hl
                            278 ;src/main.c:123: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   642E ED 4B E6 62   [20]  279 	ld	bc, (#_prota + 4)
   6432 21 00 01      [10]  280 	ld	hl,#_g_tablatrans
   6435 E5            [11]  281 	push	hl
   6436 21 07 16      [10]  282 	ld	hl,#0x1607
   6439 E5            [11]  283 	push	hl
   643A D5            [11]  284 	push	de
   643B C5            [11]  285 	push	bc
   643C CD 1B 5F      [17]  286 	call	_cpct_drawSpriteMaskedAlignedTable
   643F C9            [10]  287 	ret
                            288 ;src/main.c:126: void borrarProta() {
                            289 ;	---------------------------------
                            290 ; Function borrarProta
                            291 ; ---------------------------------
   6440                     292 _borrarProta::
   6440 DD E5         [15]  293 	push	ix
   6442 DD 21 00 00   [14]  294 	ld	ix,#0
   6446 DD 39         [15]  295 	add	ix,sp
   6448 F5            [11]  296 	push	af
   6449 3B            [ 6]  297 	dec	sp
                            298 ;src/main.c:130: u8 w = 4 + (prota.px & 1);
   644A 21 E4 62      [10]  299 	ld	hl, #_prota + 2
   644D 4E            [ 7]  300 	ld	c,(hl)
   644E 79            [ 4]  301 	ld	a,c
   644F E6 01         [ 7]  302 	and	a, #0x01
   6451 47            [ 4]  303 	ld	b,a
   6452 04            [ 4]  304 	inc	b
   6453 04            [ 4]  305 	inc	b
   6454 04            [ 4]  306 	inc	b
   6455 04            [ 4]  307 	inc	b
                            308 ;src/main.c:133: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6456 21 E5 62      [10]  309 	ld	hl, #_prota + 3
   6459 5E            [ 7]  310 	ld	e,(hl)
   645A CB 4B         [ 8]  311 	bit	1, e
   645C 28 04         [12]  312 	jr	Z,00103$
   645E 3E 01         [ 7]  313 	ld	a,#0x01
   6460 18 02         [12]  314 	jr	00104$
   6462                     315 00103$:
   6462 3E 00         [ 7]  316 	ld	a,#0x00
   6464                     317 00104$:
   6464 C6 06         [ 7]  318 	add	a, #0x06
   6466 DD 77 FD      [19]  319 	ld	-3 (ix),a
                            320 ;src/main.c:135: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6469 FD 2A C4 63   [20]  321 	ld	iy,(_mapa)
   646D 16 00         [ 7]  322 	ld	d,#0x00
   646F 7B            [ 4]  323 	ld	a,e
   6470 C6 E8         [ 7]  324 	add	a,#0xE8
   6472 DD 77 FE      [19]  325 	ld	-2 (ix),a
   6475 7A            [ 4]  326 	ld	a,d
   6476 CE FF         [ 7]  327 	adc	a,#0xFF
   6478 DD 77 FF      [19]  328 	ld	-1 (ix),a
   647B DD 6E FE      [19]  329 	ld	l,-2 (ix)
   647E DD 66 FF      [19]  330 	ld	h,-1 (ix)
   6481 DD CB FF 7E   [20]  331 	bit	7, -1 (ix)
   6485 28 04         [12]  332 	jr	Z,00105$
   6487 21 EB FF      [10]  333 	ld	hl,#0xFFEB
   648A 19            [11]  334 	add	hl,de
   648B                     335 00105$:
   648B CB 2C         [ 8]  336 	sra	h
   648D CB 1D         [ 8]  337 	rr	l
   648F CB 2C         [ 8]  338 	sra	h
   6491 CB 1D         [ 8]  339 	rr	l
   6493 55            [ 4]  340 	ld	d,l
   6494 CB 39         [ 8]  341 	srl	c
   6496 FD E5         [15]  342 	push	iy
   6498 21 F0 C0      [10]  343 	ld	hl,#0xC0F0
   649B E5            [11]  344 	push	hl
   649C 3E 28         [ 7]  345 	ld	a,#0x28
   649E F5            [11]  346 	push	af
   649F 33            [ 6]  347 	inc	sp
   64A0 DD 7E FD      [19]  348 	ld	a,-3 (ix)
   64A3 F5            [11]  349 	push	af
   64A4 33            [ 6]  350 	inc	sp
   64A5 C5            [11]  351 	push	bc
   64A6 33            [ 6]  352 	inc	sp
   64A7 D5            [11]  353 	push	de
   64A8 33            [ 6]  354 	inc	sp
   64A9 79            [ 4]  355 	ld	a,c
   64AA F5            [11]  356 	push	af
   64AB 33            [ 6]  357 	inc	sp
   64AC CD DD 53      [17]  358 	call	_cpct_etm_drawTileBox2x4
   64AF DD F9         [10]  359 	ld	sp, ix
   64B1 DD E1         [14]  360 	pop	ix
   64B3 C9            [10]  361 	ret
                            362 ;src/main.c:138: void redibujarProta() {
                            363 ;	---------------------------------
                            364 ; Function redibujarProta
                            365 ; ---------------------------------
   64B4                     366 _redibujarProta::
                            367 ;src/main.c:139: borrarProta();
   64B4 CD 40 64      [17]  368 	call	_borrarProta
                            369 ;src/main.c:140: prota.px = prota.x;
   64B7 01 E4 62      [10]  370 	ld	bc,#_prota + 2
   64BA 3A E2 62      [13]  371 	ld	a, (#_prota + 0)
   64BD 02            [ 7]  372 	ld	(bc),a
                            373 ;src/main.c:141: prota.py = prota.y;
   64BE 01 E5 62      [10]  374 	ld	bc,#_prota + 3
   64C1 3A E3 62      [13]  375 	ld	a, (#_prota + 1)
   64C4 02            [ 7]  376 	ld	(bc),a
                            377 ;src/main.c:142: dibujarProta();
   64C5 C3 1A 64      [10]  378 	jp  _dibujarProta
                            379 ;src/main.c:145: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            380 ;	---------------------------------
                            381 ; Function comprobarTeclado
                            382 ; ---------------------------------
   64C8                     383 _comprobarTeclado::
                            384 ;src/main.c:146: cpct_scanKeyboard_if();
   64C8 CD 4C 55      [17]  385 	call	_cpct_scanKeyboard_if
                            386 ;src/main.c:148: if (cpct_isAnyKeyPressed()) {
   64CB CD 3F 55      [17]  387 	call	_cpct_isAnyKeyPressed
   64CE 7D            [ 4]  388 	ld	a,l
   64CF B7            [ 4]  389 	or	a, a
   64D0 C8            [11]  390 	ret	Z
                            391 ;src/main.c:149: if (cpct_isKeyPressed(Key_CursorLeft)){
   64D1 21 01 01      [10]  392 	ld	hl,#0x0101
   64D4 CD 92 52      [17]  393 	call	_cpct_isKeyPressed
   64D7 7D            [ 4]  394 	ld	a,l
   64D8 B7            [ 4]  395 	or	a, a
                            396 ;src/main.c:150: moverIzquierda();
   64D9 C2 0E 7A      [10]  397 	jp	NZ,_moverIzquierda
                            398 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64DC 21 00 02      [10]  399 	ld	hl,#0x0200
   64DF CD 92 52      [17]  400 	call	_cpct_isKeyPressed
   64E2 7D            [ 4]  401 	ld	a,l
   64E3 B7            [ 4]  402 	or	a, a
                            403 ;src/main.c:152: moverDerecha();
   64E4 C2 33 7A      [10]  404 	jp	NZ,_moverDerecha
                            405 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64E7 21 00 01      [10]  406 	ld	hl,#0x0100
   64EA CD 92 52      [17]  407 	call	_cpct_isKeyPressed
   64ED 7D            [ 4]  408 	ld	a,l
   64EE B7            [ 4]  409 	or	a, a
                            410 ;src/main.c:154: moverArriba();
   64EF C2 78 7A      [10]  411 	jp	NZ,_moverArriba
                            412 ;src/main.c:155: }else if (cpct_isKeyPressed(Key_CursorDown)){
   64F2 21 00 04      [10]  413 	ld	hl,#0x0400
   64F5 CD 92 52      [17]  414 	call	_cpct_isKeyPressed
   64F8 7D            [ 4]  415 	ld	a,l
   64F9 B7            [ 4]  416 	or	a, a
                            417 ;src/main.c:156: moverAbajo();
   64FA C2 9C 7A      [10]  418 	jp	NZ,_moverAbajo
                            419 ;src/main.c:157: }else if (cpct_isKeyPressed(Key_Space)){
   64FD 21 05 80      [10]  420 	ld	hl,#0x8005
   6500 CD 92 52      [17]  421 	call	_cpct_isKeyPressed
   6503 7D            [ 4]  422 	ld	a,l
   6504 B7            [ 4]  423 	or	a, a
   6505 C8            [11]  424 	ret	Z
                            425 ;src/main.c:158: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6506 21 08 00      [10]  426 	ld	hl, #8
   6509 39            [11]  427 	add	hl, sp
   650A 4E            [ 7]  428 	ld	c, (hl)
   650B 23            [ 6]  429 	inc	hl
   650C 46            [ 7]  430 	ld	b, (hl)
   650D C5            [11]  431 	push	bc
   650E 21 08 00      [10]  432 	ld	hl, #8
   6511 39            [11]  433 	add	hl, sp
   6512 4E            [ 7]  434 	ld	c, (hl)
   6513 23            [ 6]  435 	inc	hl
   6514 46            [ 7]  436 	ld	b, (hl)
   6515 C5            [11]  437 	push	bc
   6516 21 08 00      [10]  438 	ld	hl, #8
   6519 39            [11]  439 	add	hl, sp
   651A 4E            [ 7]  440 	ld	c, (hl)
   651B 23            [ 6]  441 	inc	hl
   651C 46            [ 7]  442 	ld	b, (hl)
   651D C5            [11]  443 	push	bc
   651E 21 08 00      [10]  444 	ld	hl, #8
   6521 39            [11]  445 	add	hl, sp
   6522 4E            [ 7]  446 	ld	c, (hl)
   6523 23            [ 6]  447 	inc	hl
   6524 46            [ 7]  448 	ld	b, (hl)
   6525 C5            [11]  449 	push	bc
   6526 CD 91 47      [17]  450 	call	_lanzarCuchillo
   6529 21 08 00      [10]  451 	ld	hl,#8
   652C 39            [11]  452 	add	hl,sp
   652D F9            [ 6]  453 	ld	sp,hl
   652E C9            [10]  454 	ret
                            455 ;src/main.c:163: u8 checkCollision(u8 direction) { // check optimization
                            456 ;	---------------------------------
                            457 ; Function checkCollision
                            458 ; ---------------------------------
   652F                     459 _checkCollision::
   652F DD E5         [15]  460 	push	ix
   6531 DD 21 00 00   [14]  461 	ld	ix,#0
   6535 DD 39         [15]  462 	add	ix,sp
   6537 F5            [11]  463 	push	af
                            464 ;src/main.c:164: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6538 21 00 00      [10]  465 	ld	hl,#0x0000
   653B E3            [19]  466 	ex	(sp), hl
   653C 11 00 00      [10]  467 	ld	de,#0x0000
   653F 01 00 00      [10]  468 	ld	bc,#0x0000
                            469 ;src/main.c:166: switch (direction) {
   6542 3E 03         [ 7]  470 	ld	a,#0x03
   6544 DD 96 04      [19]  471 	sub	a, 4 (ix)
   6547 DA 7F 66      [10]  472 	jp	C,00105$
   654A DD 5E 04      [19]  473 	ld	e,4 (ix)
   654D 16 00         [ 7]  474 	ld	d,#0x00
   654F 21 56 65      [10]  475 	ld	hl,#00124$
   6552 19            [11]  476 	add	hl,de
   6553 19            [11]  477 	add	hl,de
   6554 19            [11]  478 	add	hl,de
   6555 E9            [ 4]  479 	jp	(hl)
   6556                     480 00124$:
   6556 C3 62 65      [10]  481 	jp	00101$
   6559 C3 B7 65      [10]  482 	jp	00102$
   655C C3 07 66      [10]  483 	jp	00103$
   655F C3 44 66      [10]  484 	jp	00104$
                            485 ;src/main.c:167: case 0:
   6562                     486 00101$:
                            487 ;src/main.c:168: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   6562 21 E3 62      [10]  488 	ld	hl, #(_prota + 0x0001) + 0
   6565 4E            [ 7]  489 	ld	c,(hl)
   6566 3A E2 62      [13]  490 	ld	a, (#_prota + 0)
   6569 C6 07         [ 7]  491 	add	a, #0x07
   656B 47            [ 4]  492 	ld	b,a
   656C 79            [ 4]  493 	ld	a,c
   656D F5            [11]  494 	push	af
   656E 33            [ 6]  495 	inc	sp
   656F C5            [11]  496 	push	bc
   6570 33            [ 6]  497 	inc	sp
   6571 2A C4 63      [16]  498 	ld	hl,(_mapa)
   6574 E5            [11]  499 	push	hl
   6575 CD 61 4B      [17]  500 	call	_getTilePtr
   6578 F1            [10]  501 	pop	af
   6579 F1            [10]  502 	pop	af
   657A 33            [ 6]  503 	inc	sp
   657B 33            [ 6]  504 	inc	sp
   657C E5            [11]  505 	push	hl
                            506 ;src/main.c:169: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   657D 3A E3 62      [13]  507 	ld	a, (#(_prota + 0x0001) + 0)
   6580 C6 14         [ 7]  508 	add	a, #0x14
   6582 4F            [ 4]  509 	ld	c,a
   6583 3A E2 62      [13]  510 	ld	a, (#_prota + 0)
   6586 C6 07         [ 7]  511 	add	a, #0x07
   6588 47            [ 4]  512 	ld	b,a
   6589 79            [ 4]  513 	ld	a,c
   658A F5            [11]  514 	push	af
   658B 33            [ 6]  515 	inc	sp
   658C C5            [11]  516 	push	bc
   658D 33            [ 6]  517 	inc	sp
   658E 2A C4 63      [16]  518 	ld	hl,(_mapa)
   6591 E5            [11]  519 	push	hl
   6592 CD 61 4B      [17]  520 	call	_getTilePtr
   6595 F1            [10]  521 	pop	af
   6596 F1            [10]  522 	pop	af
   6597 EB            [ 4]  523 	ex	de,hl
                            524 ;src/main.c:170: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6598 3A E3 62      [13]  525 	ld	a, (#(_prota + 0x0001) + 0)
   659B C6 0B         [ 7]  526 	add	a, #0x0B
   659D 47            [ 4]  527 	ld	b,a
   659E 3A E2 62      [13]  528 	ld	a, (#_prota + 0)
   65A1 C6 07         [ 7]  529 	add	a, #0x07
   65A3 D5            [11]  530 	push	de
   65A4 C5            [11]  531 	push	bc
   65A5 33            [ 6]  532 	inc	sp
   65A6 F5            [11]  533 	push	af
   65A7 33            [ 6]  534 	inc	sp
   65A8 2A C4 63      [16]  535 	ld	hl,(_mapa)
   65AB E5            [11]  536 	push	hl
   65AC CD 61 4B      [17]  537 	call	_getTilePtr
   65AF F1            [10]  538 	pop	af
   65B0 F1            [10]  539 	pop	af
   65B1 4D            [ 4]  540 	ld	c,l
   65B2 44            [ 4]  541 	ld	b,h
   65B3 D1            [10]  542 	pop	de
                            543 ;src/main.c:171: break;
   65B4 C3 7F 66      [10]  544 	jp	00105$
                            545 ;src/main.c:172: case 1:
   65B7                     546 00102$:
                            547 ;src/main.c:173: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   65B7 21 E3 62      [10]  548 	ld	hl, #(_prota + 0x0001) + 0
   65BA 56            [ 7]  549 	ld	d,(hl)
   65BB 21 E2 62      [10]  550 	ld	hl, #_prota + 0
   65BE 46            [ 7]  551 	ld	b,(hl)
   65BF 05            [ 4]  552 	dec	b
   65C0 D5            [11]  553 	push	de
   65C1 33            [ 6]  554 	inc	sp
   65C2 C5            [11]  555 	push	bc
   65C3 33            [ 6]  556 	inc	sp
   65C4 2A C4 63      [16]  557 	ld	hl,(_mapa)
   65C7 E5            [11]  558 	push	hl
   65C8 CD 61 4B      [17]  559 	call	_getTilePtr
   65CB F1            [10]  560 	pop	af
   65CC F1            [10]  561 	pop	af
   65CD 33            [ 6]  562 	inc	sp
   65CE 33            [ 6]  563 	inc	sp
   65CF E5            [11]  564 	push	hl
                            565 ;src/main.c:174: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   65D0 3A E3 62      [13]  566 	ld	a, (#(_prota + 0x0001) + 0)
   65D3 C6 14         [ 7]  567 	add	a, #0x14
   65D5 57            [ 4]  568 	ld	d,a
   65D6 21 E2 62      [10]  569 	ld	hl, #_prota + 0
   65D9 46            [ 7]  570 	ld	b,(hl)
   65DA 05            [ 4]  571 	dec	b
   65DB D5            [11]  572 	push	de
   65DC 33            [ 6]  573 	inc	sp
   65DD C5            [11]  574 	push	bc
   65DE 33            [ 6]  575 	inc	sp
   65DF 2A C4 63      [16]  576 	ld	hl,(_mapa)
   65E2 E5            [11]  577 	push	hl
   65E3 CD 61 4B      [17]  578 	call	_getTilePtr
   65E6 F1            [10]  579 	pop	af
   65E7 F1            [10]  580 	pop	af
   65E8 EB            [ 4]  581 	ex	de,hl
                            582 ;src/main.c:175: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   65E9 3A E3 62      [13]  583 	ld	a, (#(_prota + 0x0001) + 0)
   65EC C6 0B         [ 7]  584 	add	a, #0x0B
   65EE 47            [ 4]  585 	ld	b,a
   65EF 3A E2 62      [13]  586 	ld	a, (#_prota + 0)
   65F2 C6 FF         [ 7]  587 	add	a,#0xFF
   65F4 D5            [11]  588 	push	de
   65F5 C5            [11]  589 	push	bc
   65F6 33            [ 6]  590 	inc	sp
   65F7 F5            [11]  591 	push	af
   65F8 33            [ 6]  592 	inc	sp
   65F9 2A C4 63      [16]  593 	ld	hl,(_mapa)
   65FC E5            [11]  594 	push	hl
   65FD CD 61 4B      [17]  595 	call	_getTilePtr
   6600 F1            [10]  596 	pop	af
   6601 F1            [10]  597 	pop	af
   6602 4D            [ 4]  598 	ld	c,l
   6603 44            [ 4]  599 	ld	b,h
   6604 D1            [10]  600 	pop	de
                            601 ;src/main.c:176: break;
   6605 18 78         [12]  602 	jr	00105$
                            603 ;src/main.c:177: case 2:
   6607                     604 00103$:
                            605 ;src/main.c:178: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6607 3A E3 62      [13]  606 	ld	a, (#(_prota + 0x0001) + 0)
   660A C6 FE         [ 7]  607 	add	a,#0xFE
   660C 21 E2 62      [10]  608 	ld	hl, #_prota + 0
   660F 56            [ 7]  609 	ld	d,(hl)
   6610 C5            [11]  610 	push	bc
   6611 F5            [11]  611 	push	af
   6612 33            [ 6]  612 	inc	sp
   6613 D5            [11]  613 	push	de
   6614 33            [ 6]  614 	inc	sp
   6615 2A C4 63      [16]  615 	ld	hl,(_mapa)
   6618 E5            [11]  616 	push	hl
   6619 CD 61 4B      [17]  617 	call	_getTilePtr
   661C F1            [10]  618 	pop	af
   661D F1            [10]  619 	pop	af
   661E C1            [10]  620 	pop	bc
   661F 33            [ 6]  621 	inc	sp
   6620 33            [ 6]  622 	inc	sp
   6621 E5            [11]  623 	push	hl
                            624 ;src/main.c:179: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6622 21 E3 62      [10]  625 	ld	hl, #(_prota + 0x0001) + 0
   6625 56            [ 7]  626 	ld	d,(hl)
   6626 15            [ 4]  627 	dec	d
   6627 15            [ 4]  628 	dec	d
   6628 3A E2 62      [13]  629 	ld	a, (#_prota + 0)
   662B C6 03         [ 7]  630 	add	a, #0x03
   662D C5            [11]  631 	push	bc
   662E D5            [11]  632 	push	de
   662F 33            [ 6]  633 	inc	sp
   6630 F5            [11]  634 	push	af
   6631 33            [ 6]  635 	inc	sp
   6632 2A C4 63      [16]  636 	ld	hl,(_mapa)
   6635 E5            [11]  637 	push	hl
   6636 CD 61 4B      [17]  638 	call	_getTilePtr
   6639 F1            [10]  639 	pop	af
   663A F1            [10]  640 	pop	af
   663B EB            [ 4]  641 	ex	de,hl
   663C C1            [10]  642 	pop	bc
                            643 ;src/main.c:180: *waistTile = 0;
   663D 21 00 00      [10]  644 	ld	hl,#0x0000
   6640 36 00         [10]  645 	ld	(hl),#0x00
                            646 ;src/main.c:181: break;
   6642 18 3B         [12]  647 	jr	00105$
                            648 ;src/main.c:182: case 3:
   6644                     649 00104$:
                            650 ;src/main.c:183: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6644 3A E3 62      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   6647 C6 16         [ 7]  652 	add	a, #0x16
   6649 21 E2 62      [10]  653 	ld	hl, #_prota + 0
   664C 56            [ 7]  654 	ld	d,(hl)
   664D C5            [11]  655 	push	bc
   664E F5            [11]  656 	push	af
   664F 33            [ 6]  657 	inc	sp
   6650 D5            [11]  658 	push	de
   6651 33            [ 6]  659 	inc	sp
   6652 2A C4 63      [16]  660 	ld	hl,(_mapa)
   6655 E5            [11]  661 	push	hl
   6656 CD 61 4B      [17]  662 	call	_getTilePtr
   6659 F1            [10]  663 	pop	af
   665A F1            [10]  664 	pop	af
   665B C1            [10]  665 	pop	bc
   665C 33            [ 6]  666 	inc	sp
   665D 33            [ 6]  667 	inc	sp
   665E E5            [11]  668 	push	hl
                            669 ;src/main.c:184: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   665F 3A E3 62      [13]  670 	ld	a, (#(_prota + 0x0001) + 0)
   6662 C6 16         [ 7]  671 	add	a, #0x16
   6664 57            [ 4]  672 	ld	d,a
   6665 3A E2 62      [13]  673 	ld	a, (#_prota + 0)
   6668 C6 03         [ 7]  674 	add	a, #0x03
   666A C5            [11]  675 	push	bc
   666B D5            [11]  676 	push	de
   666C 33            [ 6]  677 	inc	sp
   666D F5            [11]  678 	push	af
   666E 33            [ 6]  679 	inc	sp
   666F 2A C4 63      [16]  680 	ld	hl,(_mapa)
   6672 E5            [11]  681 	push	hl
   6673 CD 61 4B      [17]  682 	call	_getTilePtr
   6676 F1            [10]  683 	pop	af
   6677 F1            [10]  684 	pop	af
   6678 EB            [ 4]  685 	ex	de,hl
   6679 C1            [10]  686 	pop	bc
                            687 ;src/main.c:185: *waistTile = 0;
   667A 21 00 00      [10]  688 	ld	hl,#0x0000
   667D 36 00         [10]  689 	ld	(hl),#0x00
                            690 ;src/main.c:187: }
   667F                     691 00105$:
                            692 ;src/main.c:189: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   667F E1            [10]  693 	pop	hl
   6680 E5            [11]  694 	push	hl
   6681 6E            [ 7]  695 	ld	l,(hl)
   6682 3E 02         [ 7]  696 	ld	a,#0x02
   6684 95            [ 4]  697 	sub	a, l
   6685 38 0E         [12]  698 	jr	C,00106$
   6687 1A            [ 7]  699 	ld	a,(de)
   6688 5F            [ 4]  700 	ld	e,a
   6689 3E 02         [ 7]  701 	ld	a,#0x02
   668B 93            [ 4]  702 	sub	a, e
   668C 38 07         [12]  703 	jr	C,00106$
   668E 0A            [ 7]  704 	ld	a,(bc)
   668F 4F            [ 4]  705 	ld	c,a
   6690 3E 02         [ 7]  706 	ld	a,#0x02
   6692 91            [ 4]  707 	sub	a, c
   6693 30 04         [12]  708 	jr	NC,00107$
   6695                     709 00106$:
                            710 ;src/main.c:190: return 1;
   6695 2E 01         [ 7]  711 	ld	l,#0x01
   6697 18 02         [12]  712 	jr	00110$
   6699                     713 00107$:
                            714 ;src/main.c:192: return 0;
   6699 2E 00         [ 7]  715 	ld	l,#0x00
   669B                     716 00110$:
   669B DD F9         [10]  717 	ld	sp, ix
   669D DD E1         [14]  718 	pop	ix
   669F C9            [10]  719 	ret
                            720 ;src/main.c:195: void dibujarEnemigo(TEnemy *enemy) {
                            721 ;	---------------------------------
                            722 ; Function dibujarEnemigo
                            723 ; ---------------------------------
   66A0                     724 _dibujarEnemigo::
   66A0 DD E5         [15]  725 	push	ix
   66A2 DD 21 00 00   [14]  726 	ld	ix,#0
   66A6 DD 39         [15]  727 	add	ix,sp
                            728 ;src/main.c:196: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66A8 DD 4E 04      [19]  729 	ld	c,4 (ix)
   66AB DD 46 05      [19]  730 	ld	b,5 (ix)
   66AE 69            [ 4]  731 	ld	l, c
   66AF 60            [ 4]  732 	ld	h, b
   66B0 23            [ 6]  733 	inc	hl
   66B1 56            [ 7]  734 	ld	d,(hl)
   66B2 0A            [ 7]  735 	ld	a,(bc)
   66B3 C5            [11]  736 	push	bc
   66B4 D5            [11]  737 	push	de
   66B5 33            [ 6]  738 	inc	sp
   66B6 F5            [11]  739 	push	af
   66B7 33            [ 6]  740 	inc	sp
   66B8 21 00 C0      [10]  741 	ld	hl,#0xC000
   66BB E5            [11]  742 	push	hl
   66BC CD FB 5E      [17]  743 	call	_cpct_getScreenPtr
   66BF EB            [ 4]  744 	ex	de,hl
                            745 ;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   66C0 E1            [10]  746 	pop	hl
   66C1 01 04 00      [10]  747 	ld	bc, #0x0004
   66C4 09            [11]  748 	add	hl, bc
   66C5 4E            [ 7]  749 	ld	c,(hl)
   66C6 23            [ 6]  750 	inc	hl
   66C7 46            [ 7]  751 	ld	b,(hl)
   66C8 21 00 01      [10]  752 	ld	hl,#_g_tablatrans
   66CB E5            [11]  753 	push	hl
   66CC 21 04 16      [10]  754 	ld	hl,#0x1604
   66CF E5            [11]  755 	push	hl
   66D0 D5            [11]  756 	push	de
   66D1 C5            [11]  757 	push	bc
   66D2 CD 1B 5F      [17]  758 	call	_cpct_drawSpriteMaskedAlignedTable
   66D5 DD E1         [14]  759 	pop	ix
   66D7 C9            [10]  760 	ret
                            761 ;src/main.c:200: void dibujarExplosion(TEnemy *enemy) {
                            762 ;	---------------------------------
                            763 ; Function dibujarExplosion
                            764 ; ---------------------------------
   66D8                     765 _dibujarExplosion::
   66D8 DD E5         [15]  766 	push	ix
   66DA DD 21 00 00   [14]  767 	ld	ix,#0
   66DE DD 39         [15]  768 	add	ix,sp
                            769 ;src/main.c:201: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   66E0 DD 4E 04      [19]  770 	ld	c,4 (ix)
   66E3 DD 46 05      [19]  771 	ld	b,5 (ix)
   66E6 69            [ 4]  772 	ld	l, c
   66E7 60            [ 4]  773 	ld	h, b
   66E8 23            [ 6]  774 	inc	hl
   66E9 23            [ 6]  775 	inc	hl
   66EA 23            [ 6]  776 	inc	hl
   66EB 56            [ 7]  777 	ld	d,(hl)
   66EC 69            [ 4]  778 	ld	l, c
   66ED 60            [ 4]  779 	ld	h, b
   66EE 23            [ 6]  780 	inc	hl
   66EF 23            [ 6]  781 	inc	hl
   66F0 46            [ 7]  782 	ld	b,(hl)
   66F1 D5            [11]  783 	push	de
   66F2 33            [ 6]  784 	inc	sp
   66F3 C5            [11]  785 	push	bc
   66F4 33            [ 6]  786 	inc	sp
   66F5 21 00 C0      [10]  787 	ld	hl,#0xC000
   66F8 E5            [11]  788 	push	hl
   66F9 CD FB 5E      [17]  789 	call	_cpct_getScreenPtr
   66FC 4D            [ 4]  790 	ld	c,l
   66FD 44            [ 4]  791 	ld	b,h
                            792 ;src/main.c:202: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   66FE 11 00 01      [10]  793 	ld	de,#_g_tablatrans+0
   6701 D5            [11]  794 	push	de
   6702 21 04 16      [10]  795 	ld	hl,#0x1604
   6705 E5            [11]  796 	push	hl
   6706 C5            [11]  797 	push	bc
   6707 21 70 19      [10]  798 	ld	hl,#_g_explosion
   670A E5            [11]  799 	push	hl
   670B CD 1B 5F      [17]  800 	call	_cpct_drawSpriteMaskedAlignedTable
   670E DD E1         [14]  801 	pop	ix
   6710 C9            [10]  802 	ret
                            803 ;src/main.c:205: void borrarExplosion(u8 x, u8 y) {
                            804 ;	---------------------------------
                            805 ; Function borrarExplosion
                            806 ; ---------------------------------
   6711                     807 _borrarExplosion::
   6711 DD E5         [15]  808 	push	ix
   6713 DD 21 00 00   [14]  809 	ld	ix,#0
   6717 DD 39         [15]  810 	add	ix,sp
   6719 F5            [11]  811 	push	af
   671A F5            [11]  812 	push	af
                            813 ;src/main.c:208: u8 w = 4 + (x & 1);
   671B DD 7E 04      [19]  814 	ld	a,4 (ix)
   671E E6 01         [ 7]  815 	and	a, #0x01
   6720 4F            [ 4]  816 	ld	c,a
   6721 0C            [ 4]  817 	inc	c
   6722 0C            [ 4]  818 	inc	c
   6723 0C            [ 4]  819 	inc	c
   6724 0C            [ 4]  820 	inc	c
                            821 ;src/main.c:209: u8 h = 6 + (y & 3 ? 1 : 0);
   6725 DD 7E 05      [19]  822 	ld	a,5 (ix)
   6728 E6 03         [ 7]  823 	and	a, #0x03
   672A 28 04         [12]  824 	jr	Z,00103$
   672C 3E 01         [ 7]  825 	ld	a,#0x01
   672E 18 02         [12]  826 	jr	00104$
   6730                     827 00103$:
   6730 3E 00         [ 7]  828 	ld	a,#0x00
   6732                     829 00104$:
   6732 C6 06         [ 7]  830 	add	a, #0x06
   6734 47            [ 4]  831 	ld	b,a
                            832 ;src/main.c:211: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6735 2A C4 63      [16]  833 	ld	hl,(_mapa)
   6738 E3            [19]  834 	ex	(sp), hl
   6739 DD 5E 05      [19]  835 	ld	e,5 (ix)
   673C 16 00         [ 7]  836 	ld	d,#0x00
   673E 7B            [ 4]  837 	ld	a,e
   673F C6 E8         [ 7]  838 	add	a,#0xE8
   6741 DD 77 FE      [19]  839 	ld	-2 (ix),a
   6744 7A            [ 4]  840 	ld	a,d
   6745 CE FF         [ 7]  841 	adc	a,#0xFF
   6747 DD 77 FF      [19]  842 	ld	-1 (ix),a
   674A DD 6E FE      [19]  843 	ld	l,-2 (ix)
   674D DD 66 FF      [19]  844 	ld	h,-1 (ix)
   6750 DD CB FF 7E   [20]  845 	bit	7, -1 (ix)
   6754 28 04         [12]  846 	jr	Z,00105$
   6756 21 EB FF      [10]  847 	ld	hl,#0xFFEB
   6759 19            [11]  848 	add	hl,de
   675A                     849 00105$:
   675A CB 2C         [ 8]  850 	sra	h
   675C CB 1D         [ 8]  851 	rr	l
   675E CB 2C         [ 8]  852 	sra	h
   6760 CB 1D         [ 8]  853 	rr	l
   6762 5D            [ 4]  854 	ld	e,l
   6763 DD 56 04      [19]  855 	ld	d,4 (ix)
   6766 CB 3A         [ 8]  856 	srl	d
   6768 E1            [10]  857 	pop	hl
   6769 E5            [11]  858 	push	hl
   676A E5            [11]  859 	push	hl
   676B 21 F0 C0      [10]  860 	ld	hl,#0xC0F0
   676E E5            [11]  861 	push	hl
   676F 3E 28         [ 7]  862 	ld	a,#0x28
   6771 F5            [11]  863 	push	af
   6772 33            [ 6]  864 	inc	sp
   6773 C5            [11]  865 	push	bc
   6774 7B            [ 4]  866 	ld	a,e
   6775 F5            [11]  867 	push	af
   6776 33            [ 6]  868 	inc	sp
   6777 D5            [11]  869 	push	de
   6778 33            [ 6]  870 	inc	sp
   6779 CD DD 53      [17]  871 	call	_cpct_etm_drawTileBox2x4
   677C DD F9         [10]  872 	ld	sp, ix
   677E DD E1         [14]  873 	pop	ix
   6780 C9            [10]  874 	ret
                            875 ;src/main.c:215: void borrarEnemigo(u8 x, u8 y) {
                            876 ;	---------------------------------
                            877 ; Function borrarEnemigo
                            878 ; ---------------------------------
   6781                     879 _borrarEnemigo::
   6781 DD E5         [15]  880 	push	ix
   6783 DD 21 00 00   [14]  881 	ld	ix,#0
   6787 DD 39         [15]  882 	add	ix,sp
   6789 F5            [11]  883 	push	af
   678A F5            [11]  884 	push	af
                            885 ;src/main.c:219: u8 w = 4 + (x & 1);
   678B DD 7E 04      [19]  886 	ld	a,4 (ix)
   678E E6 01         [ 7]  887 	and	a, #0x01
   6790 4F            [ 4]  888 	ld	c,a
   6791 0C            [ 4]  889 	inc	c
   6792 0C            [ 4]  890 	inc	c
   6793 0C            [ 4]  891 	inc	c
   6794 0C            [ 4]  892 	inc	c
                            893 ;src/main.c:221: u8 h = 6 + (y & 3 ? 1 : 0);
   6795 DD 7E 05      [19]  894 	ld	a,5 (ix)
   6798 E6 03         [ 7]  895 	and	a, #0x03
   679A 28 04         [12]  896 	jr	Z,00103$
   679C 3E 01         [ 7]  897 	ld	a,#0x01
   679E 18 02         [12]  898 	jr	00104$
   67A0                     899 00103$:
   67A0 3E 00         [ 7]  900 	ld	a,#0x00
   67A2                     901 00104$:
   67A2 C6 06         [ 7]  902 	add	a, #0x06
   67A4 47            [ 4]  903 	ld	b,a
                            904 ;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   67A5 2A C4 63      [16]  905 	ld	hl,(_mapa)
   67A8 DD 75 FE      [19]  906 	ld	-2 (ix),l
   67AB DD 74 FF      [19]  907 	ld	-1 (ix),h
   67AE DD 5E 05      [19]  908 	ld	e,5 (ix)
   67B1 16 00         [ 7]  909 	ld	d,#0x00
   67B3 7B            [ 4]  910 	ld	a,e
   67B4 C6 E8         [ 7]  911 	add	a,#0xE8
   67B6 DD 77 FC      [19]  912 	ld	-4 (ix),a
   67B9 7A            [ 4]  913 	ld	a,d
   67BA CE FF         [ 7]  914 	adc	a,#0xFF
   67BC DD 77 FD      [19]  915 	ld	-3 (ix),a
   67BF E1            [10]  916 	pop	hl
   67C0 E5            [11]  917 	push	hl
   67C1 DD CB FD 7E   [20]  918 	bit	7, -3 (ix)
   67C5 28 04         [12]  919 	jr	Z,00105$
   67C7 21 EB FF      [10]  920 	ld	hl,#0xFFEB
   67CA 19            [11]  921 	add	hl,de
   67CB                     922 00105$:
   67CB CB 2C         [ 8]  923 	sra	h
   67CD CB 1D         [ 8]  924 	rr	l
   67CF CB 2C         [ 8]  925 	sra	h
   67D1 CB 1D         [ 8]  926 	rr	l
   67D3 5D            [ 4]  927 	ld	e,l
   67D4 DD 56 04      [19]  928 	ld	d,4 (ix)
   67D7 CB 3A         [ 8]  929 	srl	d
   67D9 DD 6E FE      [19]  930 	ld	l,-2 (ix)
   67DC DD 66 FF      [19]  931 	ld	h,-1 (ix)
   67DF E5            [11]  932 	push	hl
   67E0 21 F0 C0      [10]  933 	ld	hl,#0xC0F0
   67E3 E5            [11]  934 	push	hl
   67E4 3E 28         [ 7]  935 	ld	a,#0x28
   67E6 F5            [11]  936 	push	af
   67E7 33            [ 6]  937 	inc	sp
   67E8 C5            [11]  938 	push	bc
   67E9 7B            [ 4]  939 	ld	a,e
   67EA F5            [11]  940 	push	af
   67EB 33            [ 6]  941 	inc	sp
   67EC D5            [11]  942 	push	de
   67ED 33            [ 6]  943 	inc	sp
   67EE CD DD 53      [17]  944 	call	_cpct_etm_drawTileBox2x4
   67F1 DD F9         [10]  945 	ld	sp, ix
   67F3 DD E1         [14]  946 	pop	ix
   67F5 C9            [10]  947 	ret
                            948 ;src/main.c:226: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            949 ;	---------------------------------
                            950 ; Function redibujarEnemigo
                            951 ; ---------------------------------
   67F6                     952 _redibujarEnemigo::
   67F6 DD E5         [15]  953 	push	ix
   67F8 DD 21 00 00   [14]  954 	ld	ix,#0
   67FC DD 39         [15]  955 	add	ix,sp
                            956 ;src/main.c:227: borrarEnemigo(x, y);
   67FE DD 66 05      [19]  957 	ld	h,5 (ix)
   6801 DD 6E 04      [19]  958 	ld	l,4 (ix)
   6804 E5            [11]  959 	push	hl
   6805 CD 81 67      [17]  960 	call	_borrarEnemigo
   6808 F1            [10]  961 	pop	af
                            962 ;src/main.c:228: enemy->px = enemy->x;
   6809 DD 4E 06      [19]  963 	ld	c,6 (ix)
   680C DD 46 07      [19]  964 	ld	b,7 (ix)
   680F 59            [ 4]  965 	ld	e, c
   6810 50            [ 4]  966 	ld	d, b
   6811 13            [ 6]  967 	inc	de
   6812 13            [ 6]  968 	inc	de
   6813 0A            [ 7]  969 	ld	a,(bc)
   6814 12            [ 7]  970 	ld	(de),a
                            971 ;src/main.c:229: enemy->py = enemy->y;
   6815 59            [ 4]  972 	ld	e, c
   6816 50            [ 4]  973 	ld	d, b
   6817 13            [ 6]  974 	inc	de
   6818 13            [ 6]  975 	inc	de
   6819 13            [ 6]  976 	inc	de
   681A 69            [ 4]  977 	ld	l, c
   681B 60            [ 4]  978 	ld	h, b
   681C 23            [ 6]  979 	inc	hl
   681D 7E            [ 7]  980 	ld	a,(hl)
   681E 12            [ 7]  981 	ld	(de),a
                            982 ;src/main.c:230: dibujarEnemigo(enemy);
   681F C5            [11]  983 	push	bc
   6820 CD A0 66      [17]  984 	call	_dibujarEnemigo
   6823 F1            [10]  985 	pop	af
   6824 DD E1         [14]  986 	pop	ix
   6826 C9            [10]  987 	ret
                            988 ;src/main.c:234: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            989 ;	---------------------------------
                            990 ; Function checkEnemyDead
                            991 ; ---------------------------------
   6827                     992 _checkEnemyDead::
   6827 DD E5         [15]  993 	push	ix
   6829 DD 21 00 00   [14]  994 	ld	ix,#0
   682D DD 39         [15]  995 	add	ix,sp
   682F 21 FA FF      [10]  996 	ld	hl,#-6
   6832 39            [11]  997 	add	hl,sp
   6833 F9            [ 6]  998 	ld	sp,hl
                            999 ;src/main.c:236: switch (direction) {
   6834 3E 03         [ 7] 1000 	ld	a,#0x03
   6836 DD 96 04      [19] 1001 	sub	a, 4 (ix)
   6839 DA 15 6A      [10] 1002 	jp	C,00134$
                           1003 ;src/main.c:240: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   683C DD 7E 05      [19] 1004 	ld	a,5 (ix)
   683F DD 77 FA      [19] 1005 	ld	-6 (ix),a
   6842 DD 7E 06      [19] 1006 	ld	a,6 (ix)
   6845 DD 77 FB      [19] 1007 	ld	-5 (ix),a
   6848 DD 7E FA      [19] 1008 	ld	a,-6 (ix)
   684B C6 01         [ 7] 1009 	add	a, #0x01
   684D DD 77 FE      [19] 1010 	ld	-2 (ix),a
   6850 DD 7E FB      [19] 1011 	ld	a,-5 (ix)
   6853 CE 00         [ 7] 1012 	adc	a, #0x00
   6855 DD 77 FF      [19] 1013 	ld	-1 (ix),a
                           1014 ;src/main.c:243: enemy->muerto = SI;
   6858 DD 7E FA      [19] 1015 	ld	a,-6 (ix)
   685B C6 08         [ 7] 1016 	add	a, #0x08
   685D DD 77 FC      [19] 1017 	ld	-4 (ix),a
   6860 DD 7E FB      [19] 1018 	ld	a,-5 (ix)
   6863 CE 00         [ 7] 1019 	adc	a, #0x00
   6865 DD 77 FD      [19] 1020 	ld	-3 (ix),a
                           1021 ;src/main.c:236: switch (direction) {
   6868 DD 5E 04      [19] 1022 	ld	e,4 (ix)
   686B 16 00         [ 7] 1023 	ld	d,#0x00
   686D 21 74 68      [10] 1024 	ld	hl,#00204$
   6870 19            [11] 1025 	add	hl,de
   6871 19            [11] 1026 	add	hl,de
   6872 19            [11] 1027 	add	hl,de
   6873 E9            [ 4] 1028 	jp	(hl)
   6874                    1029 00204$:
   6874 C3 80 68      [10] 1030 	jp	00101$
   6877 C3 E8 68      [10] 1031 	jp	00109$
   687A C3 50 69      [10] 1032 	jp	00117$
   687D C3 B7 69      [10] 1033 	jp	00125$
                           1034 ;src/main.c:239: case 0:
   6880                    1035 00101$:
                           1036 ;src/main.c:240: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6880 21 EB 62      [10] 1037 	ld	hl, #_cu + 1
   6883 4E            [ 7] 1038 	ld	c,(hl)
   6884 06 00         [ 7] 1039 	ld	b,#0x00
   6886 21 04 00      [10] 1040 	ld	hl,#0x0004
   6889 09            [11] 1041 	add	hl,bc
   688A EB            [ 4] 1042 	ex	de,hl
   688B DD 6E FE      [19] 1043 	ld	l,-2 (ix)
   688E DD 66 FF      [19] 1044 	ld	h,-1 (ix)
   6891 6E            [ 7] 1045 	ld	l,(hl)
   6892 26 00         [ 7] 1046 	ld	h,#0x00
   6894 7B            [ 4] 1047 	ld	a,e
   6895 95            [ 4] 1048 	sub	a, l
   6896 7A            [ 4] 1049 	ld	a,d
   6897 9C            [ 4] 1050 	sbc	a, h
   6898 E2 9D 68      [10] 1051 	jp	PO, 00205$
   689B EE 80         [ 7] 1052 	xor	a, #0x80
   689D                    1053 00205$:
   689D FA 15 6A      [10] 1054 	jp	M,00134$
   68A0 11 16 00      [10] 1055 	ld	de,#0x0016
   68A3 19            [11] 1056 	add	hl,de
   68A4 7D            [ 4] 1057 	ld	a,l
   68A5 91            [ 4] 1058 	sub	a, c
   68A6 7C            [ 4] 1059 	ld	a,h
   68A7 98            [ 4] 1060 	sbc	a, b
   68A8 E2 AD 68      [10] 1061 	jp	PO, 00206$
   68AB EE 80         [ 7] 1062 	xor	a, #0x80
   68AD                    1063 00206$:
   68AD FA 15 6A      [10] 1064 	jp	M,00134$
                           1065 ;src/main.c:241: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   68B0 E1            [10] 1066 	pop	hl
   68B1 E5            [11] 1067 	push	hl
   68B2 4E            [ 7] 1068 	ld	c,(hl)
   68B3 21 EA 62      [10] 1069 	ld	hl, #_cu + 0
   68B6 5E            [ 7] 1070 	ld	e,(hl)
   68B7 16 00         [ 7] 1071 	ld	d,#0x00
   68B9 13            [ 6] 1072 	inc	de
   68BA 13            [ 6] 1073 	inc	de
   68BB 13            [ 6] 1074 	inc	de
   68BC 13            [ 6] 1075 	inc	de
   68BD 69            [ 4] 1076 	ld	l,c
   68BE 26 00         [ 7] 1077 	ld	h,#0x00
   68C0 7B            [ 4] 1078 	ld	a,e
   68C1 95            [ 4] 1079 	sub	a, l
   68C2 7A            [ 4] 1080 	ld	a,d
   68C3 9C            [ 4] 1081 	sbc	a, h
   68C4 E2 C9 68      [10] 1082 	jp	PO, 00207$
   68C7 EE 80         [ 7] 1083 	xor	a, #0x80
   68C9                    1084 00207$:
   68C9 F2 15 6A      [10] 1085 	jp	P,00134$
                           1086 ;src/main.c:242: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   68CC BF            [ 4] 1087 	cp	a, a
   68CD ED 52         [15] 1088 	sbc	hl, de
   68CF 3E 01         [ 7] 1089 	ld	a,#0x01
   68D1 BD            [ 4] 1090 	cp	a, l
   68D2 3E 00         [ 7] 1091 	ld	a,#0x00
   68D4 9C            [ 4] 1092 	sbc	a, h
   68D5 E2 DA 68      [10] 1093 	jp	PO, 00208$
   68D8 EE 80         [ 7] 1094 	xor	a, #0x80
   68DA                    1095 00208$:
   68DA FA 15 6A      [10] 1096 	jp	M,00134$
                           1097 ;src/main.c:243: enemy->muerto = SI;
   68DD DD 6E FC      [19] 1098 	ld	l,-4 (ix)
   68E0 DD 66 FD      [19] 1099 	ld	h,-3 (ix)
   68E3 36 01         [10] 1100 	ld	(hl),#0x01
                           1101 ;src/main.c:247: break;
   68E5 C3 15 6A      [10] 1102 	jp	00134$
                           1103 ;src/main.c:248: case 1:
   68E8                    1104 00109$:
                           1105 ;src/main.c:249: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   68E8 21 EB 62      [10] 1106 	ld	hl, #_cu + 1
   68EB 4E            [ 7] 1107 	ld	c,(hl)
   68EC 06 00         [ 7] 1108 	ld	b,#0x00
   68EE 21 04 00      [10] 1109 	ld	hl,#0x0004
   68F1 09            [11] 1110 	add	hl,bc
   68F2 EB            [ 4] 1111 	ex	de,hl
   68F3 DD 6E FE      [19] 1112 	ld	l,-2 (ix)
   68F6 DD 66 FF      [19] 1113 	ld	h,-1 (ix)
   68F9 6E            [ 7] 1114 	ld	l,(hl)
   68FA 26 00         [ 7] 1115 	ld	h,#0x00
   68FC 7B            [ 4] 1116 	ld	a,e
   68FD 95            [ 4] 1117 	sub	a, l
   68FE 7A            [ 4] 1118 	ld	a,d
   68FF 9C            [ 4] 1119 	sbc	a, h
   6900 E2 05 69      [10] 1120 	jp	PO, 00209$
   6903 EE 80         [ 7] 1121 	xor	a, #0x80
   6905                    1122 00209$:
   6905 FA 15 6A      [10] 1123 	jp	M,00134$
   6908 11 16 00      [10] 1124 	ld	de,#0x0016
   690B 19            [11] 1125 	add	hl,de
   690C 7D            [ 4] 1126 	ld	a,l
   690D 91            [ 4] 1127 	sub	a, c
   690E 7C            [ 4] 1128 	ld	a,h
   690F 98            [ 4] 1129 	sbc	a, b
   6910 E2 15 69      [10] 1130 	jp	PO, 00210$
   6913 EE 80         [ 7] 1131 	xor	a, #0x80
   6915                    1132 00210$:
   6915 FA 15 6A      [10] 1133 	jp	M,00134$
                           1134 ;src/main.c:250: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6918 21 EA 62      [10] 1135 	ld	hl, #_cu + 0
   691B 4E            [ 7] 1136 	ld	c,(hl)
   691C E1            [10] 1137 	pop	hl
   691D E5            [11] 1138 	push	hl
   691E 5E            [ 7] 1139 	ld	e,(hl)
   691F 16 00         [ 7] 1140 	ld	d,#0x00
   6921 13            [ 6] 1141 	inc	de
   6922 13            [ 6] 1142 	inc	de
   6923 13            [ 6] 1143 	inc	de
   6924 13            [ 6] 1144 	inc	de
   6925 69            [ 4] 1145 	ld	l,c
   6926 26 00         [ 7] 1146 	ld	h,#0x00
   6928 7B            [ 4] 1147 	ld	a,e
   6929 95            [ 4] 1148 	sub	a, l
   692A 7A            [ 4] 1149 	ld	a,d
   692B 9C            [ 4] 1150 	sbc	a, h
   692C E2 31 69      [10] 1151 	jp	PO, 00211$
   692F EE 80         [ 7] 1152 	xor	a, #0x80
   6931                    1153 00211$:
   6931 F2 15 6A      [10] 1154 	jp	P,00134$
                           1155 ;src/main.c:251: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6934 BF            [ 4] 1156 	cp	a, a
   6935 ED 52         [15] 1157 	sbc	hl, de
   6937 3E 01         [ 7] 1158 	ld	a,#0x01
   6939 BD            [ 4] 1159 	cp	a, l
   693A 3E 00         [ 7] 1160 	ld	a,#0x00
   693C 9C            [ 4] 1161 	sbc	a, h
   693D E2 42 69      [10] 1162 	jp	PO, 00212$
   6940 EE 80         [ 7] 1163 	xor	a, #0x80
   6942                    1164 00212$:
   6942 FA 15 6A      [10] 1165 	jp	M,00134$
                           1166 ;src/main.c:252: enemy->muerto = SI;
   6945 DD 6E FC      [19] 1167 	ld	l,-4 (ix)
   6948 DD 66 FD      [19] 1168 	ld	h,-3 (ix)
   694B 36 01         [10] 1169 	ld	(hl),#0x01
                           1170 ;src/main.c:256: break;
   694D C3 15 6A      [10] 1171 	jp	00134$
                           1172 ;src/main.c:258: case 2:
   6950                    1173 00117$:
                           1174 ;src/main.c:259: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6950 21 EA 62      [10] 1175 	ld	hl, #_cu + 0
   6953 4E            [ 7] 1176 	ld	c,(hl)
   6954 06 00         [ 7] 1177 	ld	b,#0x00
   6956 59            [ 4] 1178 	ld	e, c
   6957 50            [ 4] 1179 	ld	d, b
   6958 13            [ 6] 1180 	inc	de
   6959 13            [ 6] 1181 	inc	de
   695A E1            [10] 1182 	pop	hl
   695B E5            [11] 1183 	push	hl
   695C 6E            [ 7] 1184 	ld	l,(hl)
   695D 26 00         [ 7] 1185 	ld	h,#0x00
   695F 7B            [ 4] 1186 	ld	a,e
   6960 95            [ 4] 1187 	sub	a, l
   6961 7A            [ 4] 1188 	ld	a,d
   6962 9C            [ 4] 1189 	sbc	a, h
   6963 E2 68 69      [10] 1190 	jp	PO, 00213$
   6966 EE 80         [ 7] 1191 	xor	a, #0x80
   6968                    1192 00213$:
   6968 FA 15 6A      [10] 1193 	jp	M,00134$
   696B 11 04 00      [10] 1194 	ld	de,#0x0004
   696E 19            [11] 1195 	add	hl,de
   696F 7D            [ 4] 1196 	ld	a,l
   6970 91            [ 4] 1197 	sub	a, c
   6971 7C            [ 4] 1198 	ld	a,h
   6972 98            [ 4] 1199 	sbc	a, b
   6973 E2 78 69      [10] 1200 	jp	PO, 00214$
   6976 EE 80         [ 7] 1201 	xor	a, #0x80
   6978                    1202 00214$:
   6978 FA 15 6A      [10] 1203 	jp	M,00134$
                           1204 ;src/main.c:260: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   697B 21 EB 62      [10] 1205 	ld	hl, #(_cu + 0x0001) + 0
   697E 4E            [ 7] 1206 	ld	c,(hl)
   697F DD 6E FE      [19] 1207 	ld	l,-2 (ix)
   6982 DD 66 FF      [19] 1208 	ld	h,-1 (ix)
   6985 5E            [ 7] 1209 	ld	e,(hl)
   6986 16 00         [ 7] 1210 	ld	d,#0x00
   6988 21 16 00      [10] 1211 	ld	hl,#0x0016
   698B 19            [11] 1212 	add	hl,de
   698C EB            [ 4] 1213 	ex	de,hl
   698D 69            [ 4] 1214 	ld	l,c
   698E 26 00         [ 7] 1215 	ld	h,#0x00
   6990 7B            [ 4] 1216 	ld	a,e
   6991 95            [ 4] 1217 	sub	a, l
   6992 7A            [ 4] 1218 	ld	a,d
   6993 9C            [ 4] 1219 	sbc	a, h
   6994 E2 99 69      [10] 1220 	jp	PO, 00215$
   6997 EE 80         [ 7] 1221 	xor	a, #0x80
   6999                    1222 00215$:
   6999 F2 15 6A      [10] 1223 	jp	P,00134$
                           1224 ;src/main.c:261: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   699C BF            [ 4] 1225 	cp	a, a
   699D ED 52         [15] 1226 	sbc	hl, de
   699F 3E 02         [ 7] 1227 	ld	a,#0x02
   69A1 BD            [ 4] 1228 	cp	a, l
   69A2 3E 00         [ 7] 1229 	ld	a,#0x00
   69A4 9C            [ 4] 1230 	sbc	a, h
   69A5 E2 AA 69      [10] 1231 	jp	PO, 00216$
   69A8 EE 80         [ 7] 1232 	xor	a, #0x80
   69AA                    1233 00216$:
   69AA FA 15 6A      [10] 1234 	jp	M,00134$
                           1235 ;src/main.c:262: enemy->muerto = SI;
   69AD DD 6E FC      [19] 1236 	ld	l,-4 (ix)
   69B0 DD 66 FD      [19] 1237 	ld	h,-3 (ix)
   69B3 36 01         [10] 1238 	ld	(hl),#0x01
                           1239 ;src/main.c:266: break;
   69B5 18 5E         [12] 1240 	jr	00134$
                           1241 ;src/main.c:267: case 3:
   69B7                    1242 00125$:
                           1243 ;src/main.c:268: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   69B7 21 EA 62      [10] 1244 	ld	hl, #_cu + 0
   69BA 4E            [ 7] 1245 	ld	c,(hl)
   69BB 06 00         [ 7] 1246 	ld	b,#0x00
   69BD 59            [ 4] 1247 	ld	e, c
   69BE 50            [ 4] 1248 	ld	d, b
   69BF 13            [ 6] 1249 	inc	de
   69C0 13            [ 6] 1250 	inc	de
   69C1 E1            [10] 1251 	pop	hl
   69C2 E5            [11] 1252 	push	hl
   69C3 6E            [ 7] 1253 	ld	l,(hl)
   69C4 26 00         [ 7] 1254 	ld	h,#0x00
   69C6 7B            [ 4] 1255 	ld	a,e
   69C7 95            [ 4] 1256 	sub	a, l
   69C8 7A            [ 4] 1257 	ld	a,d
   69C9 9C            [ 4] 1258 	sbc	a, h
   69CA E2 CF 69      [10] 1259 	jp	PO, 00217$
   69CD EE 80         [ 7] 1260 	xor	a, #0x80
   69CF                    1261 00217$:
   69CF FA 15 6A      [10] 1262 	jp	M,00134$
   69D2 11 04 00      [10] 1263 	ld	de,#0x0004
   69D5 19            [11] 1264 	add	hl,de
   69D6 7D            [ 4] 1265 	ld	a,l
   69D7 91            [ 4] 1266 	sub	a, c
   69D8 7C            [ 4] 1267 	ld	a,h
   69D9 98            [ 4] 1268 	sbc	a, b
   69DA E2 DF 69      [10] 1269 	jp	PO, 00218$
   69DD EE 80         [ 7] 1270 	xor	a, #0x80
   69DF                    1271 00218$:
   69DF FA 15 6A      [10] 1272 	jp	M,00134$
                           1273 ;src/main.c:269: if(enemy->y>cu.y){
   69E2 DD 6E FE      [19] 1274 	ld	l,-2 (ix)
   69E5 DD 66 FF      [19] 1275 	ld	h,-1 (ix)
   69E8 4E            [ 7] 1276 	ld	c,(hl)
   69E9 21 EB 62      [10] 1277 	ld	hl, #(_cu + 0x0001) + 0
   69EC 5E            [ 7] 1278 	ld	e,(hl)
   69ED 7B            [ 4] 1279 	ld	a,e
   69EE 91            [ 4] 1280 	sub	a, c
   69EF 30 24         [12] 1281 	jr	NC,00134$
                           1282 ;src/main.c:270: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   69F1 06 00         [ 7] 1283 	ld	b,#0x00
   69F3 16 00         [ 7] 1284 	ld	d,#0x00
   69F5 21 08 00      [10] 1285 	ld	hl,#0x0008
   69F8 19            [11] 1286 	add	hl,de
   69F9 79            [ 4] 1287 	ld	a,c
   69FA 95            [ 4] 1288 	sub	a, l
   69FB 4F            [ 4] 1289 	ld	c,a
   69FC 78            [ 4] 1290 	ld	a,b
   69FD 9C            [ 4] 1291 	sbc	a, h
   69FE 47            [ 4] 1292 	ld	b,a
   69FF 3E 02         [ 7] 1293 	ld	a,#0x02
   6A01 B9            [ 4] 1294 	cp	a, c
   6A02 3E 00         [ 7] 1295 	ld	a,#0x00
   6A04 98            [ 4] 1296 	sbc	a, b
   6A05 E2 0A 6A      [10] 1297 	jp	PO, 00219$
   6A08 EE 80         [ 7] 1298 	xor	a, #0x80
   6A0A                    1299 00219$:
   6A0A FA 15 6A      [10] 1300 	jp	M,00134$
                           1301 ;src/main.c:271: enemy->muerto = SI;
   6A0D DD 6E FC      [19] 1302 	ld	l,-4 (ix)
   6A10 DD 66 FD      [19] 1303 	ld	h,-3 (ix)
   6A13 36 01         [10] 1304 	ld	(hl),#0x01
                           1305 ;src/main.c:276: }
   6A15                    1306 00134$:
   6A15 DD F9         [10] 1307 	ld	sp, ix
   6A17 DD E1         [14] 1308 	pop	ix
   6A19 C9            [10] 1309 	ret
                           1310 ;src/main.c:279: void moverEnemigoArriba(TEnemy *enemy){
                           1311 ;	---------------------------------
                           1312 ; Function moverEnemigoArriba
                           1313 ; ---------------------------------
   6A1A                    1314 _moverEnemigoArriba::
   6A1A DD E5         [15] 1315 	push	ix
   6A1C DD 21 00 00   [14] 1316 	ld	ix,#0
   6A20 DD 39         [15] 1317 	add	ix,sp
                           1318 ;src/main.c:280: enemy->y--;
   6A22 DD 4E 04      [19] 1319 	ld	c,4 (ix)
   6A25 DD 46 05      [19] 1320 	ld	b,5 (ix)
   6A28 69            [ 4] 1321 	ld	l, c
   6A29 60            [ 4] 1322 	ld	h, b
   6A2A 23            [ 6] 1323 	inc	hl
   6A2B 5E            [ 7] 1324 	ld	e,(hl)
   6A2C 1D            [ 4] 1325 	dec	e
   6A2D 73            [ 7] 1326 	ld	(hl),e
                           1327 ;src/main.c:281: enemy->y--;
   6A2E 1D            [ 4] 1328 	dec	e
   6A2F 73            [ 7] 1329 	ld	(hl),e
                           1330 ;src/main.c:282: enemy->mover = SI;
   6A30 21 06 00      [10] 1331 	ld	hl,#0x0006
   6A33 09            [11] 1332 	add	hl,bc
   6A34 36 01         [10] 1333 	ld	(hl),#0x01
   6A36 DD E1         [14] 1334 	pop	ix
   6A38 C9            [10] 1335 	ret
                           1336 ;src/main.c:285: void moverEnemigoAbajo(TEnemy *enemy){
                           1337 ;	---------------------------------
                           1338 ; Function moverEnemigoAbajo
                           1339 ; ---------------------------------
   6A39                    1340 _moverEnemigoAbajo::
   6A39 DD E5         [15] 1341 	push	ix
   6A3B DD 21 00 00   [14] 1342 	ld	ix,#0
   6A3F DD 39         [15] 1343 	add	ix,sp
                           1344 ;src/main.c:286: enemy->y++;
   6A41 DD 4E 04      [19] 1345 	ld	c,4 (ix)
   6A44 DD 46 05      [19] 1346 	ld	b,5 (ix)
   6A47 59            [ 4] 1347 	ld	e, c
   6A48 50            [ 4] 1348 	ld	d, b
   6A49 13            [ 6] 1349 	inc	de
   6A4A 1A            [ 7] 1350 	ld	a,(de)
   6A4B 3C            [ 4] 1351 	inc	a
   6A4C 12            [ 7] 1352 	ld	(de),a
                           1353 ;src/main.c:287: enemy->y++;
   6A4D 3C            [ 4] 1354 	inc	a
   6A4E 12            [ 7] 1355 	ld	(de),a
                           1356 ;src/main.c:288: enemy->mover = SI;
   6A4F 21 06 00      [10] 1357 	ld	hl,#0x0006
   6A52 09            [11] 1358 	add	hl,bc
   6A53 36 01         [10] 1359 	ld	(hl),#0x01
   6A55 DD E1         [14] 1360 	pop	ix
   6A57 C9            [10] 1361 	ret
                           1362 ;src/main.c:291: void moverEnemigoDerecha(TEnemy *enemy){
                           1363 ;	---------------------------------
                           1364 ; Function moverEnemigoDerecha
                           1365 ; ---------------------------------
   6A58                    1366 _moverEnemigoDerecha::
                           1367 ;src/main.c:292: enemy->x++;
   6A58 D1            [10] 1368 	pop	de
   6A59 C1            [10] 1369 	pop	bc
   6A5A C5            [11] 1370 	push	bc
   6A5B D5            [11] 1371 	push	de
   6A5C 0A            [ 7] 1372 	ld	a,(bc)
   6A5D 3C            [ 4] 1373 	inc	a
   6A5E 02            [ 7] 1374 	ld	(bc),a
                           1375 ;src/main.c:293: enemy->x++;
   6A5F 3C            [ 4] 1376 	inc	a
   6A60 02            [ 7] 1377 	ld	(bc),a
                           1378 ;src/main.c:294: enemy->mover = SI;
   6A61 21 06 00      [10] 1379 	ld	hl,#0x0006
   6A64 09            [11] 1380 	add	hl,bc
   6A65 36 01         [10] 1381 	ld	(hl),#0x01
   6A67 C9            [10] 1382 	ret
                           1383 ;src/main.c:297: void moverEnemigoIzquierda(TEnemy *enemy){
                           1384 ;	---------------------------------
                           1385 ; Function moverEnemigoIzquierda
                           1386 ; ---------------------------------
   6A68                    1387 _moverEnemigoIzquierda::
                           1388 ;src/main.c:298: enemy->x--;
   6A68 D1            [10] 1389 	pop	de
   6A69 C1            [10] 1390 	pop	bc
   6A6A C5            [11] 1391 	push	bc
   6A6B D5            [11] 1392 	push	de
   6A6C 0A            [ 7] 1393 	ld	a,(bc)
   6A6D C6 FF         [ 7] 1394 	add	a,#0xFF
   6A6F 02            [ 7] 1395 	ld	(bc),a
                           1396 ;src/main.c:299: enemy->x--;
   6A70 C6 FF         [ 7] 1397 	add	a,#0xFF
   6A72 02            [ 7] 1398 	ld	(bc),a
                           1399 ;src/main.c:300: enemy->mover = SI;
   6A73 21 06 00      [10] 1400 	ld	hl,#0x0006
   6A76 09            [11] 1401 	add	hl,bc
   6A77 36 01         [10] 1402 	ld	(hl),#0x01
   6A79 C9            [10] 1403 	ret
                           1404 ;src/main.c:303: void moverEnemigoPatrol(TEnemy* enemy){
                           1405 ;	---------------------------------
                           1406 ; Function moverEnemigoPatrol
                           1407 ; ---------------------------------
   6A7A                    1408 _moverEnemigoPatrol::
   6A7A DD E5         [15] 1409 	push	ix
   6A7C DD 21 00 00   [14] 1410 	ld	ix,#0
   6A80 DD 39         [15] 1411 	add	ix,sp
   6A82 21 F3 FF      [10] 1412 	ld	hl,#-13
   6A85 39            [11] 1413 	add	hl,sp
   6A86 F9            [ 6] 1414 	ld	sp,hl
                           1415 ;src/main.c:305: if(!enemy->muerto){
   6A87 DD 4E 04      [19] 1416 	ld	c,4 (ix)
   6A8A DD 46 05      [19] 1417 	ld	b,5 (ix)
   6A8D C5            [11] 1418 	push	bc
   6A8E FD E1         [14] 1419 	pop	iy
   6A90 FD 7E 08      [19] 1420 	ld	a,8 (iy)
   6A93 B7            [ 4] 1421 	or	a, a
   6A94 C2 C2 6C      [10] 1422 	jp	NZ,00118$
                           1423 ;src/main.c:306: if (!enemy->reversePatrol) {
   6A97 21 0B 00      [10] 1424 	ld	hl,#0x000B
   6A9A 09            [11] 1425 	add	hl,bc
   6A9B E3            [19] 1426 	ex	(sp), hl
   6A9C E1            [10] 1427 	pop	hl
   6A9D E5            [11] 1428 	push	hl
   6A9E 7E            [ 7] 1429 	ld	a,(hl)
   6A9F DD 77 FF      [19] 1430 	ld	-1 (ix),a
                           1431 ;src/main.c:307: if(enemy->iter < enemy->longitud_camino){
   6AA2 21 0D 00      [10] 1432 	ld	hl,#0x000D
   6AA5 09            [11] 1433 	add	hl,bc
   6AA6 DD 75 FD      [19] 1434 	ld	-3 (ix),l
   6AA9 DD 74 FE      [19] 1435 	ld	-2 (ix),h
   6AAC DD 6E FD      [19] 1436 	ld	l,-3 (ix)
   6AAF DD 66 FE      [19] 1437 	ld	h,-2 (ix)
   6AB2 5E            [ 7] 1438 	ld	e,(hl)
   6AB3 23            [ 6] 1439 	inc	hl
   6AB4 56            [ 7] 1440 	ld	d,(hl)
   6AB5 21 E2 00      [10] 1441 	ld	hl,#0x00E2
   6AB8 09            [11] 1442 	add	hl,bc
   6AB9 DD 75 FB      [19] 1443 	ld	-5 (ix),l
   6ABC DD 74 FC      [19] 1444 	ld	-4 (ix),h
                           1445 ;src/main.c:309: enemy->mover = SI;
   6ABF 21 06 00      [10] 1446 	ld	hl,#0x0006
   6AC2 09            [11] 1447 	add	hl,bc
   6AC3 DD 75 F9      [19] 1448 	ld	-7 (ix),l
   6AC6 DD 74 FA      [19] 1449 	ld	-6 (ix),h
                           1450 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6AC9 21 1A 00      [10] 1451 	ld	hl,#0x001A
   6ACC 09            [11] 1452 	add	hl,bc
   6ACD DD 75 F7      [19] 1453 	ld	-9 (ix),l
   6AD0 DD 74 F8      [19] 1454 	ld	-8 (ix),h
                           1455 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6AD3 21 01 00      [10] 1456 	ld	hl,#0x0001
   6AD6 09            [11] 1457 	add	hl,bc
   6AD7 DD 75 F5      [19] 1458 	ld	-11 (ix),l
   6ADA DD 74 F6      [19] 1459 	ld	-10 (ix),h
                           1460 ;src/main.c:306: if (!enemy->reversePatrol) {
   6ADD DD 7E FF      [19] 1461 	ld	a,-1 (ix)
   6AE0 B7            [ 4] 1462 	or	a, a
   6AE1 C2 BC 6B      [10] 1463 	jp	NZ,00114$
                           1464 ;src/main.c:307: if(enemy->iter < enemy->longitud_camino){
   6AE4 DD 6E FB      [19] 1465 	ld	l,-5 (ix)
   6AE7 DD 66 FC      [19] 1466 	ld	h,-4 (ix)
   6AEA 6E            [ 7] 1467 	ld	l,(hl)
   6AEB 26 00         [ 7] 1468 	ld	h,#0x00
   6AED 7B            [ 4] 1469 	ld	a,e
   6AEE 95            [ 4] 1470 	sub	a, l
   6AEF 7A            [ 4] 1471 	ld	a,d
   6AF0 9C            [ 4] 1472 	sbc	a, h
   6AF1 E2 F6 6A      [10] 1473 	jp	PO, 00144$
   6AF4 EE 80         [ 7] 1474 	xor	a, #0x80
   6AF6                    1475 00144$:
   6AF6 F2 9B 6B      [10] 1476 	jp	P,00105$
                           1477 ;src/main.c:308: if(enemy->iter == 0){
   6AF9 7A            [ 4] 1478 	ld	a,d
   6AFA B3            [ 4] 1479 	or	a,e
   6AFB 20 54         [12] 1480 	jr	NZ,00102$
                           1481 ;src/main.c:309: enemy->mover = SI;
   6AFD DD 6E F9      [19] 1482 	ld	l,-7 (ix)
   6B00 DD 66 FA      [19] 1483 	ld	h,-6 (ix)
   6B03 36 01         [10] 1484 	ld	(hl),#0x01
                           1485 ;src/main.c:310: enemy->iter = 2;
   6B05 DD 6E FD      [19] 1486 	ld	l,-3 (ix)
   6B08 DD 66 FE      [19] 1487 	ld	h,-2 (ix)
   6B0B 36 02         [10] 1488 	ld	(hl),#0x02
   6B0D 23            [ 6] 1489 	inc	hl
   6B0E 36 00         [10] 1490 	ld	(hl),#0x00
                           1491 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6B10 DD 6E FD      [19] 1492 	ld	l,-3 (ix)
   6B13 DD 66 FE      [19] 1493 	ld	h,-2 (ix)
   6B16 5E            [ 7] 1494 	ld	e,(hl)
   6B17 23            [ 6] 1495 	inc	hl
   6B18 56            [ 7] 1496 	ld	d,(hl)
   6B19 DD 6E F7      [19] 1497 	ld	l,-9 (ix)
   6B1C DD 66 F8      [19] 1498 	ld	h,-8 (ix)
   6B1F 19            [11] 1499 	add	hl,de
   6B20 7E            [ 7] 1500 	ld	a,(hl)
   6B21 02            [ 7] 1501 	ld	(bc),a
                           1502 ;src/main.c:312: ++enemy->iter;
   6B22 DD 6E FD      [19] 1503 	ld	l,-3 (ix)
   6B25 DD 66 FE      [19] 1504 	ld	h,-2 (ix)
   6B28 4E            [ 7] 1505 	ld	c,(hl)
   6B29 23            [ 6] 1506 	inc	hl
   6B2A 46            [ 7] 1507 	ld	b,(hl)
   6B2B 03            [ 6] 1508 	inc	bc
   6B2C DD 6E FD      [19] 1509 	ld	l,-3 (ix)
   6B2F DD 66 FE      [19] 1510 	ld	h,-2 (ix)
   6B32 71            [ 7] 1511 	ld	(hl),c
   6B33 23            [ 6] 1512 	inc	hl
   6B34 70            [ 7] 1513 	ld	(hl),b
                           1514 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6B35 DD 6E F7      [19] 1515 	ld	l,-9 (ix)
   6B38 DD 66 F8      [19] 1516 	ld	h,-8 (ix)
   6B3B 09            [11] 1517 	add	hl,bc
   6B3C 5E            [ 7] 1518 	ld	e,(hl)
   6B3D DD 6E F5      [19] 1519 	ld	l,-11 (ix)
   6B40 DD 66 F6      [19] 1520 	ld	h,-10 (ix)
   6B43 73            [ 7] 1521 	ld	(hl),e
                           1522 ;src/main.c:314: ++enemy->iter;
   6B44 03            [ 6] 1523 	inc	bc
   6B45 DD 6E FD      [19] 1524 	ld	l,-3 (ix)
   6B48 DD 66 FE      [19] 1525 	ld	h,-2 (ix)
   6B4B 71            [ 7] 1526 	ld	(hl),c
   6B4C 23            [ 6] 1527 	inc	hl
   6B4D 70            [ 7] 1528 	ld	(hl),b
   6B4E C3 C2 6C      [10] 1529 	jp	00118$
   6B51                    1530 00102$:
                           1531 ;src/main.c:316: enemy->mover = SI;
   6B51 DD 6E F9      [19] 1532 	ld	l,-7 (ix)
   6B54 DD 66 FA      [19] 1533 	ld	h,-6 (ix)
   6B57 36 01         [10] 1534 	ld	(hl),#0x01
                           1535 ;src/main.c:317: enemy->x = enemy->camino[enemy->iter];
   6B59 DD 6E FD      [19] 1536 	ld	l,-3 (ix)
   6B5C DD 66 FE      [19] 1537 	ld	h,-2 (ix)
   6B5F 5E            [ 7] 1538 	ld	e,(hl)
   6B60 23            [ 6] 1539 	inc	hl
   6B61 56            [ 7] 1540 	ld	d,(hl)
   6B62 DD 6E F7      [19] 1541 	ld	l,-9 (ix)
   6B65 DD 66 F8      [19] 1542 	ld	h,-8 (ix)
   6B68 19            [11] 1543 	add	hl,de
   6B69 7E            [ 7] 1544 	ld	a,(hl)
   6B6A 02            [ 7] 1545 	ld	(bc),a
                           1546 ;src/main.c:318: ++enemy->iter;
   6B6B DD 6E FD      [19] 1547 	ld	l,-3 (ix)
   6B6E DD 66 FE      [19] 1548 	ld	h,-2 (ix)
   6B71 5E            [ 7] 1549 	ld	e,(hl)
   6B72 23            [ 6] 1550 	inc	hl
   6B73 56            [ 7] 1551 	ld	d,(hl)
   6B74 13            [ 6] 1552 	inc	de
   6B75 DD 6E FD      [19] 1553 	ld	l,-3 (ix)
   6B78 DD 66 FE      [19] 1554 	ld	h,-2 (ix)
   6B7B 73            [ 7] 1555 	ld	(hl),e
   6B7C 23            [ 6] 1556 	inc	hl
   6B7D 72            [ 7] 1557 	ld	(hl),d
                           1558 ;src/main.c:319: enemy->y = enemy->camino[enemy->iter];
   6B7E DD 6E F7      [19] 1559 	ld	l,-9 (ix)
   6B81 DD 66 F8      [19] 1560 	ld	h,-8 (ix)
   6B84 19            [11] 1561 	add	hl,de
   6B85 7E            [ 7] 1562 	ld	a,(hl)
   6B86 DD 6E F5      [19] 1563 	ld	l,-11 (ix)
   6B89 DD 66 F6      [19] 1564 	ld	h,-10 (ix)
   6B8C 77            [ 7] 1565 	ld	(hl),a
                           1566 ;src/main.c:320: ++enemy->iter;
   6B8D 13            [ 6] 1567 	inc	de
   6B8E 4B            [ 4] 1568 	ld	c,e
   6B8F DD 6E FD      [19] 1569 	ld	l,-3 (ix)
   6B92 DD 66 FE      [19] 1570 	ld	h,-2 (ix)
   6B95 71            [ 7] 1571 	ld	(hl),c
   6B96 23            [ 6] 1572 	inc	hl
   6B97 72            [ 7] 1573 	ld	(hl),d
   6B98 C3 C2 6C      [10] 1574 	jp	00118$
   6B9B                    1575 00105$:
                           1576 ;src/main.c:324: enemy->mover = NO;
   6B9B DD 6E F9      [19] 1577 	ld	l,-7 (ix)
   6B9E DD 66 FA      [19] 1578 	ld	h,-6 (ix)
   6BA1 36 00         [10] 1579 	ld	(hl),#0x00
                           1580 ;src/main.c:325: enemy->iter = enemy->longitud_camino;
   6BA3 DD 6E FB      [19] 1581 	ld	l,-5 (ix)
   6BA6 DD 66 FC      [19] 1582 	ld	h,-4 (ix)
   6BA9 4E            [ 7] 1583 	ld	c,(hl)
   6BAA 06 00         [ 7] 1584 	ld	b,#0x00
   6BAC DD 6E FD      [19] 1585 	ld	l,-3 (ix)
   6BAF DD 66 FE      [19] 1586 	ld	h,-2 (ix)
   6BB2 71            [ 7] 1587 	ld	(hl),c
   6BB3 23            [ 6] 1588 	inc	hl
   6BB4 70            [ 7] 1589 	ld	(hl),b
                           1590 ;src/main.c:326: enemy->reversePatrol = 1;
   6BB5 E1            [10] 1591 	pop	hl
   6BB6 E5            [11] 1592 	push	hl
   6BB7 36 01         [10] 1593 	ld	(hl),#0x01
   6BB9 C3 C2 6C      [10] 1594 	jp	00118$
   6BBC                    1595 00114$:
                           1596 ;src/main.c:329: if(enemy->iter > 0){
   6BBC AF            [ 4] 1597 	xor	a, a
   6BBD BB            [ 4] 1598 	cp	a, e
   6BBE 9A            [ 4] 1599 	sbc	a, d
   6BBF E2 C4 6B      [10] 1600 	jp	PO, 00145$
   6BC2 EE 80         [ 7] 1601 	xor	a, #0x80
   6BC4                    1602 00145$:
   6BC4 F2 AC 6C      [10] 1603 	jp	P,00111$
                           1604 ;src/main.c:330: if(enemy->iter == enemy->longitud_camino){
   6BC7 DD 6E FB      [19] 1605 	ld	l,-5 (ix)
   6BCA DD 66 FC      [19] 1606 	ld	h,-4 (ix)
   6BCD 6E            [ 7] 1607 	ld	l,(hl)
   6BCE DD 75 FB      [19] 1608 	ld	-5 (ix),l
   6BD1 DD 36 FC 00   [19] 1609 	ld	-4 (ix),#0x00
   6BD5 7B            [ 4] 1610 	ld	a,e
   6BD6 DD 96 FB      [19] 1611 	sub	a, -5 (ix)
   6BD9 C2 64 6C      [10] 1612 	jp	NZ,00108$
   6BDC 7A            [ 4] 1613 	ld	a,d
   6BDD DD 96 FC      [19] 1614 	sub	a, -4 (ix)
   6BE0 C2 64 6C      [10] 1615 	jp	NZ,00108$
                           1616 ;src/main.c:331: enemy->mover = SI;
   6BE3 DD 6E F9      [19] 1617 	ld	l,-7 (ix)
   6BE6 DD 66 FA      [19] 1618 	ld	h,-6 (ix)
   6BE9 36 01         [10] 1619 	ld	(hl),#0x01
                           1620 ;src/main.c:332: enemy->iter = enemy->iter - 1;
   6BEB DD 6E FD      [19] 1621 	ld	l,-3 (ix)
   6BEE DD 66 FE      [19] 1622 	ld	h,-2 (ix)
   6BF1 5E            [ 7] 1623 	ld	e,(hl)
   6BF2 23            [ 6] 1624 	inc	hl
   6BF3 56            [ 7] 1625 	ld	d,(hl)
   6BF4 7B            [ 4] 1626 	ld	a,e
   6BF5 C6 FF         [ 7] 1627 	add	a,#0xFF
   6BF7 DD 77 FB      [19] 1628 	ld	-5 (ix),a
   6BFA 7A            [ 4] 1629 	ld	a,d
   6BFB CE FF         [ 7] 1630 	adc	a,#0xFF
   6BFD DD 77 FC      [19] 1631 	ld	-4 (ix),a
   6C00 DD 6E FD      [19] 1632 	ld	l,-3 (ix)
   6C03 DD 66 FE      [19] 1633 	ld	h,-2 (ix)
   6C06 DD 7E FB      [19] 1634 	ld	a,-5 (ix)
   6C09 77            [ 7] 1635 	ld	(hl),a
   6C0A 23            [ 6] 1636 	inc	hl
   6C0B DD 7E FC      [19] 1637 	ld	a,-4 (ix)
   6C0E 77            [ 7] 1638 	ld	(hl),a
                           1639 ;src/main.c:333: enemy->iter = enemy->iter - 2;
   6C0F DD 5E FB      [19] 1640 	ld	e,-5 (ix)
   6C12 DD 56 FC      [19] 1641 	ld	d,-4 (ix)
   6C15 1B            [ 6] 1642 	dec	de
   6C16 1B            [ 6] 1643 	dec	de
   6C17 DD 6E FD      [19] 1644 	ld	l,-3 (ix)
   6C1A DD 66 FE      [19] 1645 	ld	h,-2 (ix)
   6C1D 73            [ 7] 1646 	ld	(hl),e
   6C1E 23            [ 6] 1647 	inc	hl
   6C1F 72            [ 7] 1648 	ld	(hl),d
                           1649 ;src/main.c:334: enemy->y = enemy->camino[enemy->iter];
   6C20 DD 6E F7      [19] 1650 	ld	l,-9 (ix)
   6C23 DD 66 F8      [19] 1651 	ld	h,-8 (ix)
   6C26 19            [11] 1652 	add	hl,de
   6C27 5E            [ 7] 1653 	ld	e,(hl)
   6C28 DD 6E F5      [19] 1654 	ld	l,-11 (ix)
   6C2B DD 66 F6      [19] 1655 	ld	h,-10 (ix)
   6C2E 73            [ 7] 1656 	ld	(hl),e
                           1657 ;src/main.c:335: --enemy->iter;
   6C2F DD 7E FB      [19] 1658 	ld	a,-5 (ix)
   6C32 C6 FD         [ 7] 1659 	add	a,#0xFD
   6C34 5F            [ 4] 1660 	ld	e,a
   6C35 DD 7E FC      [19] 1661 	ld	a,-4 (ix)
   6C38 CE FF         [ 7] 1662 	adc	a,#0xFF
   6C3A 57            [ 4] 1663 	ld	d,a
   6C3B DD 6E FD      [19] 1664 	ld	l,-3 (ix)
   6C3E DD 66 FE      [19] 1665 	ld	h,-2 (ix)
   6C41 73            [ 7] 1666 	ld	(hl),e
   6C42 23            [ 6] 1667 	inc	hl
   6C43 72            [ 7] 1668 	ld	(hl),d
                           1669 ;src/main.c:336: enemy->x = enemy->camino[enemy->iter];
   6C44 DD 6E F7      [19] 1670 	ld	l,-9 (ix)
   6C47 DD 66 F8      [19] 1671 	ld	h,-8 (ix)
   6C4A 19            [11] 1672 	add	hl,de
   6C4B 7E            [ 7] 1673 	ld	a,(hl)
   6C4C 02            [ 7] 1674 	ld	(bc),a
                           1675 ;src/main.c:337: --enemy->iter;
   6C4D DD 7E FB      [19] 1676 	ld	a,-5 (ix)
   6C50 C6 FC         [ 7] 1677 	add	a,#0xFC
   6C52 4F            [ 4] 1678 	ld	c,a
   6C53 DD 7E FC      [19] 1679 	ld	a,-4 (ix)
   6C56 CE FF         [ 7] 1680 	adc	a,#0xFF
   6C58 47            [ 4] 1681 	ld	b,a
   6C59 DD 6E FD      [19] 1682 	ld	l,-3 (ix)
   6C5C DD 66 FE      [19] 1683 	ld	h,-2 (ix)
   6C5F 71            [ 7] 1684 	ld	(hl),c
   6C60 23            [ 6] 1685 	inc	hl
   6C61 70            [ 7] 1686 	ld	(hl),b
   6C62 18 5E         [12] 1687 	jr	00118$
   6C64                    1688 00108$:
                           1689 ;src/main.c:339: enemy->mover = SI;
   6C64 DD 6E F9      [19] 1690 	ld	l,-7 (ix)
   6C67 DD 66 FA      [19] 1691 	ld	h,-6 (ix)
   6C6A 36 01         [10] 1692 	ld	(hl),#0x01
                           1693 ;src/main.c:340: enemy->y = enemy->camino[enemy->iter];
   6C6C DD 6E FD      [19] 1694 	ld	l,-3 (ix)
   6C6F DD 66 FE      [19] 1695 	ld	h,-2 (ix)
   6C72 5E            [ 7] 1696 	ld	e,(hl)
   6C73 23            [ 6] 1697 	inc	hl
   6C74 56            [ 7] 1698 	ld	d,(hl)
   6C75 DD 6E F7      [19] 1699 	ld	l,-9 (ix)
   6C78 DD 66 F8      [19] 1700 	ld	h,-8 (ix)
   6C7B 19            [11] 1701 	add	hl,de
   6C7C 5E            [ 7] 1702 	ld	e,(hl)
   6C7D DD 6E F5      [19] 1703 	ld	l,-11 (ix)
   6C80 DD 66 F6      [19] 1704 	ld	h,-10 (ix)
   6C83 73            [ 7] 1705 	ld	(hl),e
                           1706 ;src/main.c:341: --enemy->iter;
   6C84 DD 6E FD      [19] 1707 	ld	l,-3 (ix)
   6C87 DD 66 FE      [19] 1708 	ld	h,-2 (ix)
   6C8A 5E            [ 7] 1709 	ld	e,(hl)
   6C8B 23            [ 6] 1710 	inc	hl
   6C8C 56            [ 7] 1711 	ld	d,(hl)
   6C8D 1B            [ 6] 1712 	dec	de
   6C8E DD 6E FD      [19] 1713 	ld	l,-3 (ix)
   6C91 DD 66 FE      [19] 1714 	ld	h,-2 (ix)
   6C94 73            [ 7] 1715 	ld	(hl),e
   6C95 23            [ 6] 1716 	inc	hl
   6C96 72            [ 7] 1717 	ld	(hl),d
                           1718 ;src/main.c:342: enemy->x = enemy->camino[enemy->iter];
   6C97 DD 6E F7      [19] 1719 	ld	l,-9 (ix)
   6C9A DD 66 F8      [19] 1720 	ld	h,-8 (ix)
   6C9D 19            [11] 1721 	add	hl,de
   6C9E 7E            [ 7] 1722 	ld	a,(hl)
   6C9F 02            [ 7] 1723 	ld	(bc),a
                           1724 ;src/main.c:343: --enemy->iter;
   6CA0 1B            [ 6] 1725 	dec	de
   6CA1 DD 6E FD      [19] 1726 	ld	l,-3 (ix)
   6CA4 DD 66 FE      [19] 1727 	ld	h,-2 (ix)
   6CA7 73            [ 7] 1728 	ld	(hl),e
   6CA8 23            [ 6] 1729 	inc	hl
   6CA9 72            [ 7] 1730 	ld	(hl),d
   6CAA 18 16         [12] 1731 	jr	00118$
   6CAC                    1732 00111$:
                           1733 ;src/main.c:347: enemy->mover = NO;
   6CAC DD 6E F9      [19] 1734 	ld	l,-7 (ix)
   6CAF DD 66 FA      [19] 1735 	ld	h,-6 (ix)
   6CB2 36 00         [10] 1736 	ld	(hl),#0x00
                           1737 ;src/main.c:348: enemy->iter = 0;
   6CB4 DD 6E FD      [19] 1738 	ld	l,-3 (ix)
   6CB7 DD 66 FE      [19] 1739 	ld	h,-2 (ix)
   6CBA AF            [ 4] 1740 	xor	a, a
   6CBB 77            [ 7] 1741 	ld	(hl), a
   6CBC 23            [ 6] 1742 	inc	hl
   6CBD 77            [ 7] 1743 	ld	(hl), a
                           1744 ;src/main.c:349: enemy->reversePatrol = 0;
   6CBE E1            [10] 1745 	pop	hl
   6CBF E5            [11] 1746 	push	hl
   6CC0 36 00         [10] 1747 	ld	(hl),#0x00
   6CC2                    1748 00118$:
   6CC2 DD F9         [10] 1749 	ld	sp, ix
   6CC4 DD E1         [14] 1750 	pop	ix
   6CC6 C9            [10] 1751 	ret
                           1752 ;src/main.c:355: void lookFor(TEnemy* enemy){
                           1753 ;	---------------------------------
                           1754 ; Function lookFor
                           1755 ; ---------------------------------
   6CC7                    1756 _lookFor::
   6CC7 DD E5         [15] 1757 	push	ix
   6CC9 DD 21 00 00   [14] 1758 	ld	ix,#0
   6CCD DD 39         [15] 1759 	add	ix,sp
   6CCF 21 F9 FF      [10] 1760 	ld	hl,#-7
   6CD2 39            [11] 1761 	add	hl,sp
   6CD3 F9            [ 6] 1762 	ld	sp,hl
                           1763 ;src/main.c:361: i16 difx = abs((i16)(enemy->x - prota.x));
   6CD4 DD 5E 04      [19] 1764 	ld	e,4 (ix)
   6CD7 DD 56 05      [19] 1765 	ld	d,5 (ix)
   6CDA 1A            [ 7] 1766 	ld	a,(de)
   6CDB 4F            [ 4] 1767 	ld	c,a
   6CDC 06 00         [ 7] 1768 	ld	b,#0x00
   6CDE 21 E2 62      [10] 1769 	ld	hl,#_prota+0
   6CE1 6E            [ 7] 1770 	ld	l,(hl)
   6CE2 26 00         [ 7] 1771 	ld	h,#0x00
   6CE4 79            [ 4] 1772 	ld	a,c
   6CE5 95            [ 4] 1773 	sub	a, l
   6CE6 4F            [ 4] 1774 	ld	c,a
   6CE7 78            [ 4] 1775 	ld	a,b
   6CE8 9C            [ 4] 1776 	sbc	a, h
   6CE9 47            [ 4] 1777 	ld	b,a
   6CEA D5            [11] 1778 	push	de
   6CEB C5            [11] 1779 	push	bc
   6CEC CD A5 4B      [17] 1780 	call	_abs
   6CEF F1            [10] 1781 	pop	af
   6CF0 D1            [10] 1782 	pop	de
   6CF1 33            [ 6] 1783 	inc	sp
   6CF2 33            [ 6] 1784 	inc	sp
   6CF3 E5            [11] 1785 	push	hl
                           1786 ;src/main.c:362: i16 dify = abs((i16)(enemy->y - prota.y));
   6CF4 21 01 00      [10] 1787 	ld	hl,#0x0001
   6CF7 19            [11] 1788 	add	hl,de
   6CF8 DD 75 FC      [19] 1789 	ld	-4 (ix),l
   6CFB DD 74 FD      [19] 1790 	ld	-3 (ix),h
   6CFE DD 6E FC      [19] 1791 	ld	l,-4 (ix)
   6D01 DD 66 FD      [19] 1792 	ld	h,-3 (ix)
   6D04 4E            [ 7] 1793 	ld	c,(hl)
   6D05 06 00         [ 7] 1794 	ld	b,#0x00
   6D07 21 E3 62      [10] 1795 	ld	hl, #(_prota + 0x0001) + 0
   6D0A 6E            [ 7] 1796 	ld	l,(hl)
   6D0B 26 00         [ 7] 1797 	ld	h,#0x00
   6D0D 79            [ 4] 1798 	ld	a,c
   6D0E 95            [ 4] 1799 	sub	a, l
   6D0F 4F            [ 4] 1800 	ld	c,a
   6D10 78            [ 4] 1801 	ld	a,b
   6D11 9C            [ 4] 1802 	sbc	a, h
   6D12 47            [ 4] 1803 	ld	b,a
   6D13 D5            [11] 1804 	push	de
   6D14 C5            [11] 1805 	push	bc
   6D15 CD A5 4B      [17] 1806 	call	_abs
   6D18 F1            [10] 1807 	pop	af
   6D19 D1            [10] 1808 	pop	de
                           1809 ;src/main.c:364: dist = difx + dify; // manhattan
   6D1A DD 4E F9      [19] 1810 	ld	c,-7 (ix)
   6D1D 09            [11] 1811 	add	hl, bc
   6D1E DD 75 FB      [19] 1812 	ld	-5 (ix),l
                           1813 ;src/main.c:365: enemy->seen = NO;
   6D21 21 11 00      [10] 1814 	ld	hl,#0x0011
   6D24 19            [11] 1815 	add	hl,de
   6D25 DD 75 FE      [19] 1816 	ld	-2 (ix),l
   6D28 DD 74 FF      [19] 1817 	ld	-1 (ix),h
   6D2B DD 6E FE      [19] 1818 	ld	l,-2 (ix)
   6D2E DD 66 FF      [19] 1819 	ld	h,-1 (ix)
   6D31 36 00         [10] 1820 	ld	(hl),#0x00
                           1821 ;src/main.c:366: enemy->in_range = NO;
   6D33 21 10 00      [10] 1822 	ld	hl,#0x0010
   6D36 19            [11] 1823 	add	hl,de
   6D37 4D            [ 4] 1824 	ld	c,l
   6D38 44            [ 4] 1825 	ld	b,h
   6D39 AF            [ 4] 1826 	xor	a, a
   6D3A 02            [ 7] 1827 	ld	(bc),a
                           1828 ;src/main.c:368: if(!enemy->seek){
   6D3B D5            [11] 1829 	push	de
   6D3C FD E1         [14] 1830 	pop	iy
   6D3E FD 7E 13      [19] 1831 	ld	a,19 (iy)
   6D41 B7            [ 4] 1832 	or	a, a
   6D42 C2 C8 6D      [10] 1833 	jp	NZ,00111$
                           1834 ;src/main.c:369: if (dist <= 17) {// te detectan los sensores de proximidad
   6D45 3E 11         [ 7] 1835 	ld	a,#0x11
   6D47 DD 96 FB      [19] 1836 	sub	a, -5 (ix)
   6D4A 38 13         [12] 1837 	jr	C,00107$
                           1838 ;src/main.c:370: enemy->in_range = 1;
   6D4C 3E 01         [ 7] 1839 	ld	a,#0x01
   6D4E 02            [ 7] 1840 	ld	(bc),a
                           1841 ;src/main.c:371: enemy->engage = 1;
   6D4F 21 15 00      [10] 1842 	ld	hl,#0x0015
   6D52 19            [11] 1843 	add	hl,de
   6D53 36 01         [10] 1844 	ld	(hl),#0x01
                           1845 ;src/main.c:372: enemy->seen = SI;
   6D55 DD 6E FE      [19] 1846 	ld	l,-2 (ix)
   6D58 DD 66 FF      [19] 1847 	ld	h,-1 (ix)
   6D5B 36 01         [10] 1848 	ld	(hl),#0x01
   6D5D 18 69         [12] 1849 	jr	00111$
   6D5F                    1850 00107$:
                           1851 ;src/main.c:373: }else if(prota.x > enemy->x - 20 && prota.x < enemy->x + 20
   6D5F 21 E2 62      [10] 1852 	ld	hl, #_prota + 0
   6D62 4E            [ 7] 1853 	ld	c,(hl)
   6D63 1A            [ 7] 1854 	ld	a,(de)
   6D64 5F            [ 4] 1855 	ld	e,a
   6D65 16 00         [ 7] 1856 	ld	d,#0x00
   6D67 7B            [ 4] 1857 	ld	a,e
   6D68 C6 EC         [ 7] 1858 	add	a,#0xEC
   6D6A 6F            [ 4] 1859 	ld	l,a
   6D6B 7A            [ 4] 1860 	ld	a,d
   6D6C CE FF         [ 7] 1861 	adc	a,#0xFF
   6D6E 67            [ 4] 1862 	ld	h,a
   6D6F 06 00         [ 7] 1863 	ld	b,#0x00
   6D71 7D            [ 4] 1864 	ld	a,l
   6D72 91            [ 4] 1865 	sub	a, c
   6D73 7C            [ 4] 1866 	ld	a,h
   6D74 98            [ 4] 1867 	sbc	a, b
   6D75 E2 7A 6D      [10] 1868 	jp	PO, 00137$
   6D78 EE 80         [ 7] 1869 	xor	a, #0x80
   6D7A                    1870 00137$:
   6D7A F2 C8 6D      [10] 1871 	jp	P,00111$
   6D7D 21 14 00      [10] 1872 	ld	hl,#0x0014
   6D80 19            [11] 1873 	add	hl,de
   6D81 79            [ 4] 1874 	ld	a,c
   6D82 95            [ 4] 1875 	sub	a, l
   6D83 78            [ 4] 1876 	ld	a,b
   6D84 9C            [ 4] 1877 	sbc	a, h
   6D85 E2 8A 6D      [10] 1878 	jp	PO, 00138$
   6D88 EE 80         [ 7] 1879 	xor	a, #0x80
   6D8A                    1880 00138$:
   6D8A F2 C8 6D      [10] 1881 	jp	P,00111$
                           1882 ;src/main.c:374: && prota.y > enemy->y - 20*2 && prota.y < enemy->y + 20*2){
   6D8D 21 E3 62      [10] 1883 	ld	hl, #(_prota + 0x0001) + 0
   6D90 4E            [ 7] 1884 	ld	c,(hl)
   6D91 DD 6E FC      [19] 1885 	ld	l,-4 (ix)
   6D94 DD 66 FD      [19] 1886 	ld	h,-3 (ix)
   6D97 5E            [ 7] 1887 	ld	e,(hl)
   6D98 16 00         [ 7] 1888 	ld	d,#0x00
   6D9A 7B            [ 4] 1889 	ld	a,e
   6D9B C6 D8         [ 7] 1890 	add	a,#0xD8
   6D9D 6F            [ 4] 1891 	ld	l,a
   6D9E 7A            [ 4] 1892 	ld	a,d
   6D9F CE FF         [ 7] 1893 	adc	a,#0xFF
   6DA1 67            [ 4] 1894 	ld	h,a
   6DA2 06 00         [ 7] 1895 	ld	b,#0x00
   6DA4 7D            [ 4] 1896 	ld	a,l
   6DA5 91            [ 4] 1897 	sub	a, c
   6DA6 7C            [ 4] 1898 	ld	a,h
   6DA7 98            [ 4] 1899 	sbc	a, b
   6DA8 E2 AD 6D      [10] 1900 	jp	PO, 00139$
   6DAB EE 80         [ 7] 1901 	xor	a, #0x80
   6DAD                    1902 00139$:
   6DAD F2 C8 6D      [10] 1903 	jp	P,00111$
   6DB0 21 28 00      [10] 1904 	ld	hl,#0x0028
   6DB3 19            [11] 1905 	add	hl,de
   6DB4 79            [ 4] 1906 	ld	a,c
   6DB5 95            [ 4] 1907 	sub	a, l
   6DB6 78            [ 4] 1908 	ld	a,b
   6DB7 9C            [ 4] 1909 	sbc	a, h
   6DB8 E2 BD 6D      [10] 1910 	jp	PO, 00140$
   6DBB EE 80         [ 7] 1911 	xor	a, #0x80
   6DBD                    1912 00140$:
   6DBD F2 C8 6D      [10] 1913 	jp	P,00111$
                           1914 ;src/main.c:375: enemy->seen = SI;
   6DC0 DD 6E FE      [19] 1915 	ld	l,-2 (ix)
   6DC3 DD 66 FF      [19] 1916 	ld	h,-1 (ix)
   6DC6 36 01         [10] 1917 	ld	(hl),#0x01
   6DC8                    1918 00111$:
   6DC8 DD F9         [10] 1919 	ld	sp, ix
   6DCA DD E1         [14] 1920 	pop	ix
   6DCC C9            [10] 1921 	ret
                           1922 ;src/main.c:380: void moverEnemigoSeek(TEnemy* actual){
                           1923 ;	---------------------------------
                           1924 ; Function moverEnemigoSeek
                           1925 ; ---------------------------------
   6DCD                    1926 _moverEnemigoSeek::
   6DCD DD E5         [15] 1927 	push	ix
   6DCF DD 21 00 00   [14] 1928 	ld	ix,#0
   6DD3 DD 39         [15] 1929 	add	ix,sp
   6DD5 21 F6 FF      [10] 1930 	ld	hl,#-10
   6DD8 39            [11] 1931 	add	hl,sp
   6DD9 F9            [ 6] 1932 	ld	sp,hl
                           1933 ;src/main.c:382: if(!actual->muerto){
   6DDA DD 4E 04      [19] 1934 	ld	c,4 (ix)
   6DDD DD 46 05      [19] 1935 	ld	b,5 (ix)
   6DE0 C5            [11] 1936 	push	bc
   6DE1 FD E1         [14] 1937 	pop	iy
   6DE3 FD 7E 08      [19] 1938 	ld	a, 8 (iy)
   6DE6 B7            [ 4] 1939 	or	a, a
   6DE7 C2 7A 6F      [10] 1940 	jp	NZ,00114$
                           1941 ;src/main.c:385: if(actual->iter < actual->longitud_camino){
   6DEA 21 0D 00      [10] 1942 	ld	hl,#0x000D
   6DED 09            [11] 1943 	add	hl,bc
   6DEE DD 75 FE      [19] 1944 	ld	-2 (ix),l
   6DF1 DD 74 FF      [19] 1945 	ld	-1 (ix),h
   6DF4 DD 6E FE      [19] 1946 	ld	l,-2 (ix)
   6DF7 DD 66 FF      [19] 1947 	ld	h,-1 (ix)
   6DFA 7E            [ 7] 1948 	ld	a,(hl)
   6DFB DD 77 FC      [19] 1949 	ld	-4 (ix),a
   6DFE 23            [ 6] 1950 	inc	hl
   6DFF 7E            [ 7] 1951 	ld	a,(hl)
   6E00 DD 77 FD      [19] 1952 	ld	-3 (ix),a
   6E03 69            [ 4] 1953 	ld	l, c
   6E04 60            [ 4] 1954 	ld	h, b
   6E05 11 E2 00      [10] 1955 	ld	de, #0x00E2
   6E08 19            [11] 1956 	add	hl, de
   6E09 5E            [ 7] 1957 	ld	e,(hl)
   6E0A 16 00         [ 7] 1958 	ld	d,#0x00
                           1959 ;src/main.c:394: actual->y = actual->camino[actual->iter];
   6E0C 21 01 00      [10] 1960 	ld	hl,#0x0001
   6E0F 09            [11] 1961 	add	hl,bc
   6E10 DD 75 FA      [19] 1962 	ld	-6 (ix),l
   6E13 DD 74 FB      [19] 1963 	ld	-5 (ix),h
                           1964 ;src/main.c:385: if(actual->iter < actual->longitud_camino){
   6E16 DD 7E FC      [19] 1965 	ld	a,-4 (ix)
   6E19 93            [ 4] 1966 	sub	a, e
   6E1A DD 7E FD      [19] 1967 	ld	a,-3 (ix)
   6E1D 9A            [ 4] 1968 	sbc	a, d
   6E1E E2 23 6E      [10] 1969 	jp	PO, 00136$
   6E21 EE 80         [ 7] 1970 	xor	a, #0x80
   6E23                    1971 00136$:
   6E23 F2 B7 6E      [10] 1972 	jp	P,00110$
                           1973 ;src/main.c:390: actual->mover = SI;
   6E26 21 06 00      [10] 1974 	ld	hl,#0x0006
   6E29 09            [11] 1975 	add	hl,bc
                           1976 ;src/main.c:392: actual->x = actual->camino[actual->iter];
   6E2A 79            [ 4] 1977 	ld	a,c
   6E2B C6 1A         [ 7] 1978 	add	a, #0x1A
   6E2D 5F            [ 4] 1979 	ld	e,a
   6E2E 78            [ 4] 1980 	ld	a,b
   6E2F CE 00         [ 7] 1981 	adc	a, #0x00
   6E31 57            [ 4] 1982 	ld	d,a
                           1983 ;src/main.c:388: if(actual->iter == 0){
   6E32 DD 7E FD      [19] 1984 	ld	a,-3 (ix)
   6E35 DD B6 FC      [19] 1985 	or	a,-4 (ix)
   6E38 20 44         [12] 1986 	jr	NZ,00102$
                           1987 ;src/main.c:390: actual->mover = SI;
   6E3A 36 01         [10] 1988 	ld	(hl),#0x01
                           1989 ;src/main.c:391: actual->iter = 2;
   6E3C DD 6E FE      [19] 1990 	ld	l,-2 (ix)
   6E3F DD 66 FF      [19] 1991 	ld	h,-1 (ix)
   6E42 36 02         [10] 1992 	ld	(hl),#0x02
   6E44 23            [ 6] 1993 	inc	hl
   6E45 36 00         [10] 1994 	ld	(hl),#0x00
                           1995 ;src/main.c:392: actual->x = actual->camino[actual->iter];
   6E47 DD 6E FE      [19] 1996 	ld	l,-2 (ix)
   6E4A DD 66 FF      [19] 1997 	ld	h,-1 (ix)
   6E4D 7E            [ 7] 1998 	ld	a, (hl)
   6E4E 23            [ 6] 1999 	inc	hl
   6E4F 66            [ 7] 2000 	ld	h,(hl)
   6E50 6F            [ 4] 2001 	ld	l,a
   6E51 19            [11] 2002 	add	hl,de
   6E52 7E            [ 7] 2003 	ld	a,(hl)
   6E53 02            [ 7] 2004 	ld	(bc),a
                           2005 ;src/main.c:393: ++actual->iter;
   6E54 DD 6E FE      [19] 2006 	ld	l,-2 (ix)
   6E57 DD 66 FF      [19] 2007 	ld	h,-1 (ix)
   6E5A 4E            [ 7] 2008 	ld	c,(hl)
   6E5B 23            [ 6] 2009 	inc	hl
   6E5C 46            [ 7] 2010 	ld	b,(hl)
   6E5D 03            [ 6] 2011 	inc	bc
   6E5E DD 6E FE      [19] 2012 	ld	l,-2 (ix)
   6E61 DD 66 FF      [19] 2013 	ld	h,-1 (ix)
   6E64 71            [ 7] 2014 	ld	(hl),c
   6E65 23            [ 6] 2015 	inc	hl
   6E66 70            [ 7] 2016 	ld	(hl),b
                           2017 ;src/main.c:394: actual->y = actual->camino[actual->iter];
   6E67 EB            [ 4] 2018 	ex	de,hl
   6E68 09            [11] 2019 	add	hl,bc
   6E69 5E            [ 7] 2020 	ld	e,(hl)
   6E6A DD 6E FA      [19] 2021 	ld	l,-6 (ix)
   6E6D DD 66 FB      [19] 2022 	ld	h,-5 (ix)
   6E70 73            [ 7] 2023 	ld	(hl),e
                           2024 ;src/main.c:395: ++actual->iter;
   6E71 03            [ 6] 2025 	inc	bc
   6E72 DD 6E FE      [19] 2026 	ld	l,-2 (ix)
   6E75 DD 66 FF      [19] 2027 	ld	h,-1 (ix)
   6E78 71            [ 7] 2028 	ld	(hl),c
   6E79 23            [ 6] 2029 	inc	hl
   6E7A 70            [ 7] 2030 	ld	(hl),b
   6E7B C3 7A 6F      [10] 2031 	jp	00114$
   6E7E                    2032 00102$:
                           2033 ;src/main.c:398: actual->mover = SI;
   6E7E 36 01         [10] 2034 	ld	(hl),#0x01
                           2035 ;src/main.c:399: actual->x = actual->camino[actual->iter];
   6E80 DD 6E FE      [19] 2036 	ld	l,-2 (ix)
   6E83 DD 66 FF      [19] 2037 	ld	h,-1 (ix)
   6E86 7E            [ 7] 2038 	ld	a, (hl)
   6E87 23            [ 6] 2039 	inc	hl
   6E88 66            [ 7] 2040 	ld	h,(hl)
   6E89 6F            [ 4] 2041 	ld	l,a
   6E8A 19            [11] 2042 	add	hl,de
   6E8B 7E            [ 7] 2043 	ld	a,(hl)
   6E8C 02            [ 7] 2044 	ld	(bc),a
                           2045 ;src/main.c:400: ++actual->iter;
   6E8D DD 6E FE      [19] 2046 	ld	l,-2 (ix)
   6E90 DD 66 FF      [19] 2047 	ld	h,-1 (ix)
   6E93 4E            [ 7] 2048 	ld	c,(hl)
   6E94 23            [ 6] 2049 	inc	hl
   6E95 46            [ 7] 2050 	ld	b,(hl)
   6E96 03            [ 6] 2051 	inc	bc
   6E97 DD 6E FE      [19] 2052 	ld	l,-2 (ix)
   6E9A DD 66 FF      [19] 2053 	ld	h,-1 (ix)
   6E9D 71            [ 7] 2054 	ld	(hl),c
   6E9E 23            [ 6] 2055 	inc	hl
   6E9F 70            [ 7] 2056 	ld	(hl),b
                           2057 ;src/main.c:401: actual->y = actual->camino[actual->iter];
   6EA0 EB            [ 4] 2058 	ex	de,hl
   6EA1 09            [11] 2059 	add	hl,bc
   6EA2 5E            [ 7] 2060 	ld	e,(hl)
   6EA3 DD 6E FA      [19] 2061 	ld	l,-6 (ix)
   6EA6 DD 66 FB      [19] 2062 	ld	h,-5 (ix)
   6EA9 73            [ 7] 2063 	ld	(hl),e
                           2064 ;src/main.c:402: ++actual->iter;
   6EAA 03            [ 6] 2065 	inc	bc
   6EAB DD 6E FE      [19] 2066 	ld	l,-2 (ix)
   6EAE DD 66 FF      [19] 2067 	ld	h,-1 (ix)
   6EB1 71            [ 7] 2068 	ld	(hl),c
   6EB2 23            [ 6] 2069 	inc	hl
   6EB3 70            [ 7] 2070 	ld	(hl),b
   6EB4 C3 7A 6F      [10] 2071 	jp	00114$
   6EB7                    2072 00110$:
                           2073 ;src/main.c:408: actual->seek = 0;
   6EB7 21 13 00      [10] 2074 	ld	hl,#0x0013
   6EBA 09            [11] 2075 	add	hl,bc
   6EBB DD 75 FC      [19] 2076 	ld	-4 (ix),l
   6EBE DD 74 FD      [19] 2077 	ld	-3 (ix),h
   6EC1 DD 6E FC      [19] 2078 	ld	l,-4 (ix)
   6EC4 DD 66 FD      [19] 2079 	ld	h,-3 (ix)
   6EC7 36 00         [10] 2080 	ld	(hl),#0x00
                           2081 ;src/main.c:409: lookFor(actual);
   6EC9 C5            [11] 2082 	push	bc
   6ECA C5            [11] 2083 	push	bc
   6ECB CD C7 6C      [17] 2084 	call	_lookFor
   6ECE F1            [10] 2085 	pop	af
   6ECF C1            [10] 2086 	pop	bc
                           2087 ;src/main.c:410: if(!actual->seen){
   6ED0 69            [ 4] 2088 	ld	l, c
   6ED1 60            [ 4] 2089 	ld	h, b
   6ED2 11 11 00      [10] 2090 	ld	de, #0x0011
   6ED5 19            [11] 2091 	add	hl, de
   6ED6 7E            [ 7] 2092 	ld	a,(hl)
   6ED7 DD 77 F9      [19] 2093 	ld	-7 (ix),a
                           2094 ;src/main.c:411: actual->patrolling = 1;
   6EDA 21 0A 00      [10] 2095 	ld	hl,#0x000A
   6EDD 09            [11] 2096 	add	hl,bc
   6EDE DD 75 F7      [19] 2097 	ld	-9 (ix),l
   6EE1 DD 74 F8      [19] 2098 	ld	-8 (ix),h
                           2099 ;src/main.c:410: if(!actual->seen){
   6EE4 DD 7E F9      [19] 2100 	ld	a,-7 (ix)
   6EE7 B7            [ 4] 2101 	or	a, a
   6EE8 20 3C         [12] 2102 	jr	NZ,00107$
                           2103 ;src/main.c:411: actual->patrolling = 1;
   6EEA DD 6E F7      [19] 2104 	ld	l,-9 (ix)
   6EED DD 66 F8      [19] 2105 	ld	h,-8 (ix)
   6EF0 36 01         [10] 2106 	ld	(hl),#0x01
                           2107 ;src/main.c:412: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6EF2 C5            [11] 2108 	push	bc
   6EF3 FD E1         [14] 2109 	pop	iy
   6EF5 FD 7E 18      [19] 2110 	ld	a,24 (iy)
   6EF8 DD 77 F9      [19] 2111 	ld	-7 (ix),a
   6EFB C5            [11] 2112 	push	bc
   6EFC FD E1         [14] 2113 	pop	iy
   6EFE FD 56 17      [19] 2114 	ld	d,23 (iy)
   6F01 DD 6E FA      [19] 2115 	ld	l,-6 (ix)
   6F04 DD 66 FB      [19] 2116 	ld	h,-5 (ix)
   6F07 5E            [ 7] 2117 	ld	e,(hl)
   6F08 0A            [ 7] 2118 	ld	a,(bc)
   6F09 DD 77 F6      [19] 2119 	ld	-10 (ix),a
   6F0C 2A C4 63      [16] 2120 	ld	hl,(_mapa)
   6F0F E5            [11] 2121 	push	hl
   6F10 C5            [11] 2122 	push	bc
   6F11 DD 7E F9      [19] 2123 	ld	a,-7 (ix)
   6F14 F5            [11] 2124 	push	af
   6F15 33            [ 6] 2125 	inc	sp
   6F16 D5            [11] 2126 	push	de
   6F17 DD 7E F6      [19] 2127 	ld	a,-10 (ix)
   6F1A F5            [11] 2128 	push	af
   6F1B 33            [ 6] 2129 	inc	sp
   6F1C CD 30 44      [17] 2130 	call	_pathFinding
   6F1F 21 08 00      [10] 2131 	ld	hl,#8
   6F22 39            [11] 2132 	add	hl,sp
   6F23 F9            [ 6] 2133 	ld	sp,hl
   6F24 18 4A         [12] 2134 	jr	00108$
   6F26                    2135 00107$:
                           2136 ;src/main.c:414: actual->patrolling = 0;
   6F26 DD 6E F7      [19] 2137 	ld	l,-9 (ix)
   6F29 DD 66 F8      [19] 2138 	ld	h,-8 (ix)
   6F2C 36 00         [10] 2139 	ld	(hl),#0x00
                           2140 ;src/main.c:415: if(!actual->engage){
   6F2E C5            [11] 2141 	push	bc
   6F2F FD E1         [14] 2142 	pop	iy
   6F31 FD 7E 15      [19] 2143 	ld	a,21 (iy)
   6F34 B7            [ 4] 2144 	or	a, a
   6F35 20 39         [12] 2145 	jr	NZ,00108$
                           2146 ;src/main.c:416: actual->seek = 1;
   6F37 DD 6E FC      [19] 2147 	ld	l,-4 (ix)
   6F3A DD 66 FD      [19] 2148 	ld	h,-3 (ix)
   6F3D 36 01         [10] 2149 	ld	(hl),#0x01
                           2150 ;src/main.c:417: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   6F3F 3A E3 62      [13] 2151 	ld	a,(#_prota + 1)
   6F42 DD 77 F6      [19] 2152 	ld	-10 (ix),a
   6F45 21 E2 62      [10] 2153 	ld	hl, #_prota + 0
   6F48 5E            [ 7] 2154 	ld	e,(hl)
   6F49 DD 6E FA      [19] 2155 	ld	l,-6 (ix)
   6F4C DD 66 FB      [19] 2156 	ld	h,-5 (ix)
   6F4F 56            [ 7] 2157 	ld	d,(hl)
   6F50 0A            [ 7] 2158 	ld	a,(bc)
   6F51 DD 77 F7      [19] 2159 	ld	-9 (ix),a
   6F54 2A C4 63      [16] 2160 	ld	hl,(_mapa)
   6F57 E5            [11] 2161 	push	hl
   6F58 C5            [11] 2162 	push	bc
   6F59 DD 7E F6      [19] 2163 	ld	a,-10 (ix)
   6F5C F5            [11] 2164 	push	af
   6F5D 33            [ 6] 2165 	inc	sp
   6F5E 7B            [ 4] 2166 	ld	a,e
   6F5F F5            [11] 2167 	push	af
   6F60 33            [ 6] 2168 	inc	sp
   6F61 D5            [11] 2169 	push	de
   6F62 33            [ 6] 2170 	inc	sp
   6F63 DD 7E F7      [19] 2171 	ld	a,-9 (ix)
   6F66 F5            [11] 2172 	push	af
   6F67 33            [ 6] 2173 	inc	sp
   6F68 CD 30 44      [17] 2174 	call	_pathFinding
   6F6B 21 08 00      [10] 2175 	ld	hl,#8
   6F6E 39            [11] 2176 	add	hl,sp
   6F6F F9            [ 6] 2177 	ld	sp,hl
   6F70                    2178 00108$:
                           2179 ;src/main.c:420: actual->iter = 0;
   6F70 DD 6E FE      [19] 2180 	ld	l,-2 (ix)
   6F73 DD 66 FF      [19] 2181 	ld	h,-1 (ix)
   6F76 AF            [ 4] 2182 	xor	a, a
   6F77 77            [ 7] 2183 	ld	(hl), a
   6F78 23            [ 6] 2184 	inc	hl
   6F79 77            [ 7] 2185 	ld	(hl), a
   6F7A                    2186 00114$:
   6F7A DD F9         [10] 2187 	ld	sp, ix
   6F7C DD E1         [14] 2188 	pop	ix
   6F7E C9            [10] 2189 	ret
                           2190 ;src/main.c:426: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2191 ;	---------------------------------
                           2192 ; Function engage
                           2193 ; ---------------------------------
   6F7F                    2194 _engage::
   6F7F DD E5         [15] 2195 	push	ix
   6F81 DD 21 00 00   [14] 2196 	ld	ix,#0
   6F85 DD 39         [15] 2197 	add	ix,sp
   6F87 21 F0 FF      [10] 2198 	ld	hl,#-16
   6F8A 39            [11] 2199 	add	hl,sp
   6F8B F9            [ 6] 2200 	ld	sp,hl
                           2201 ;src/main.c:427: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6F8C DD 7E 04      [19] 2202 	ld	a,4 (ix)
   6F8F DD 77 F4      [19] 2203 	ld	-12 (ix),a
   6F92 DD 7E 05      [19] 2204 	ld	a,5 (ix)
   6F95 DD 77 F5      [19] 2205 	ld	-11 (ix),a
   6F98 DD 6E F4      [19] 2206 	ld	l,-12 (ix)
   6F9B DD 66 F5      [19] 2207 	ld	h,-11 (ix)
   6F9E 4E            [ 7] 2208 	ld	c,(hl)
   6F9F 06 00         [ 7] 2209 	ld	b,#0x00
   6FA1 21 E2 62      [10] 2210 	ld	hl,#_prota+0
   6FA4 5E            [ 7] 2211 	ld	e,(hl)
   6FA5 16 00         [ 7] 2212 	ld	d,#0x00
   6FA7 79            [ 4] 2213 	ld	a,c
   6FA8 93            [ 4] 2214 	sub	a, e
   6FA9 4F            [ 4] 2215 	ld	c,a
   6FAA 78            [ 4] 2216 	ld	a,b
   6FAB 9A            [ 4] 2217 	sbc	a, d
   6FAC 47            [ 4] 2218 	ld	b,a
   6FAD C5            [11] 2219 	push	bc
   6FAE CD A5 4B      [17] 2220 	call	_abs
   6FB1 F1            [10] 2221 	pop	af
   6FB2 4D            [ 4] 2222 	ld	c,l
                           2223 ;src/main.c:428: u8 dify = abs(enemy->y - prota.y);
   6FB3 DD 7E F4      [19] 2224 	ld	a,-12 (ix)
   6FB6 C6 01         [ 7] 2225 	add	a, #0x01
   6FB8 DD 77 F6      [19] 2226 	ld	-10 (ix),a
   6FBB DD 7E F5      [19] 2227 	ld	a,-11 (ix)
   6FBE CE 00         [ 7] 2228 	adc	a, #0x00
   6FC0 DD 77 F7      [19] 2229 	ld	-9 (ix),a
   6FC3 DD 6E F6      [19] 2230 	ld	l,-10 (ix)
   6FC6 DD 66 F7      [19] 2231 	ld	h,-9 (ix)
   6FC9 5E            [ 7] 2232 	ld	e,(hl)
   6FCA 16 00         [ 7] 2233 	ld	d,#0x00
   6FCC 21 E3 62      [10] 2234 	ld	hl, #_prota + 1
   6FCF 6E            [ 7] 2235 	ld	l,(hl)
   6FD0 26 00         [ 7] 2236 	ld	h,#0x00
   6FD2 7B            [ 4] 2237 	ld	a,e
   6FD3 95            [ 4] 2238 	sub	a, l
   6FD4 5F            [ 4] 2239 	ld	e,a
   6FD5 7A            [ 4] 2240 	ld	a,d
   6FD6 9C            [ 4] 2241 	sbc	a, h
   6FD7 57            [ 4] 2242 	ld	d,a
   6FD8 C5            [11] 2243 	push	bc
   6FD9 D5            [11] 2244 	push	de
   6FDA CD A5 4B      [17] 2245 	call	_abs
   6FDD F1            [10] 2246 	pop	af
   6FDE C1            [10] 2247 	pop	bc
                           2248 ;src/main.c:429: u8 dist = difx + dify; // manhattan
   6FDF 09            [11] 2249 	add	hl, bc
   6FE0 DD 75 F1      [19] 2250 	ld	-15 (ix),l
                           2251 ;src/main.c:431: u8 movX = 0;
   6FE3 DD 36 F3 00   [19] 2252 	ld	-13 (ix),#0x00
                           2253 ;src/main.c:432: u8 movY = 0;
   6FE7 DD 36 F2 00   [19] 2254 	ld	-14 (ix),#0x00
                           2255 ;src/main.c:433: u8 distConstraint = 25;
   6FEB DD 36 F0 19   [19] 2256 	ld	-16 (ix),#0x19
                           2257 ;src/main.c:434: enemy->mover = NO;
   6FEF DD 7E F4      [19] 2258 	ld	a,-12 (ix)
   6FF2 C6 06         [ 7] 2259 	add	a, #0x06
   6FF4 DD 77 F8      [19] 2260 	ld	-8 (ix),a
   6FF7 DD 7E F5      [19] 2261 	ld	a,-11 (ix)
   6FFA CE 00         [ 7] 2262 	adc	a, #0x00
   6FFC DD 77 F9      [19] 2263 	ld	-7 (ix),a
   6FFF DD 6E F8      [19] 2264 	ld	l,-8 (ix)
   7002 DD 66 F9      [19] 2265 	ld	h,-7 (ix)
   7005 36 00         [10] 2266 	ld	(hl),#0x00
                           2267 ;src/main.c:444: enemy->didDamage = 1;
   7007 DD 7E F4      [19] 2268 	ld	a,-12 (ix)
   700A C6 16         [ 7] 2269 	add	a, #0x16
   700C 4F            [ 4] 2270 	ld	c,a
   700D DD 7E F5      [19] 2271 	ld	a,-11 (ix)
   7010 CE 00         [ 7] 2272 	adc	a, #0x00
   7012 47            [ 4] 2273 	ld	b,a
                           2274 ;src/main.c:436: if (dist < 20) {
   7013 DD 7E F1      [19] 2275 	ld	a,-15 (ix)
   7016 D6 14         [ 7] 2276 	sub	a, #0x14
   7018 30 32         [12] 2277 	jr	NC,00107$
                           2278 ;src/main.c:437: vidas--;
   701A 21 F9 62      [10] 2279 	ld	hl, #_vidas+0
   701D 35            [11] 2280 	dec	(hl)
                           2281 ;src/main.c:438: if(vidas % 20 == 0){
   701E C5            [11] 2282 	push	bc
   701F 3E 14         [ 7] 2283 	ld	a,#0x14
   7021 F5            [11] 2284 	push	af
   7022 33            [ 6] 2285 	inc	sp
   7023 3A F9 62      [13] 2286 	ld	a,(_vidas)
   7026 F5            [11] 2287 	push	af
   7027 33            [ 6] 2288 	inc	sp
   7028 CD FD 54      [17] 2289 	call	__moduchar
   702B F1            [10] 2290 	pop	af
   702C C1            [10] 2291 	pop	bc
   702D 7D            [ 4] 2292 	ld	a,l
   702E B7            [ 4] 2293 	or	a, a
   702F 20 18         [12] 2294 	jr	NZ,00105$
                           2295 ;src/main.c:439: if (vidas == 0) {
   7031 3A F9 62      [13] 2296 	ld	a,(#_vidas + 0)
   7034 B7            [ 4] 2297 	or	a, a
   7035 20 07         [12] 2298 	jr	NZ,00102$
                           2299 ;src/main.c:440: endGame = 1;
   7037 21 C7 63      [10] 2300 	ld	hl,#_endGame + 0
   703A 36 01         [10] 2301 	ld	(hl), #0x01
   703C 18 0B         [12] 2302 	jr	00105$
   703E                    2303 00102$:
                           2304 ;src/main.c:442: modificarVidas(vidas);
   703E C5            [11] 2305 	push	bc
   703F 3A F9 62      [13] 2306 	ld	a,(_vidas)
   7042 F5            [11] 2307 	push	af
   7043 33            [ 6] 2308 	inc	sp
   7044 CD B4 51      [17] 2309 	call	_modificarVidas
   7047 33            [ 6] 2310 	inc	sp
   7048 C1            [10] 2311 	pop	bc
   7049                    2312 00105$:
                           2313 ;src/main.c:444: enemy->didDamage = 1;
   7049 3E 01         [ 7] 2314 	ld	a,#0x01
   704B 02            [ 7] 2315 	ld	(bc),a
   704C                    2316 00107$:
                           2317 ;src/main.c:446: if (!enemy->didDamage) {
   704C 0A            [ 7] 2318 	ld	a,(bc)
   704D B7            [ 4] 2319 	or	a, a
   704E C2 84 77      [10] 2320 	jp	NZ,00208$
                           2321 ;src/main.c:447: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7051 DD 6E F6      [19] 2322 	ld	l,-10 (ix)
   7054 DD 66 F7      [19] 2323 	ld	h,-9 (ix)
   7057 4E            [ 7] 2324 	ld	c,(hl)
                           2325 ;src/main.c:427: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7058 DD 6E F4      [19] 2326 	ld	l,-12 (ix)
   705B DD 66 F5      [19] 2327 	ld	h,-11 (ix)
   705E 7E            [ 7] 2328 	ld	a,(hl)
                           2329 ;src/main.c:460: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   705F DD 77 FA      [19] 2330 	ld	-6 (ix), a
   7062 C6 04         [ 7] 2331 	add	a, #0x04
   7064 DD 77 FB      [19] 2332 	ld	-5 (ix),a
                           2333 ;src/main.c:447: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7067 DD 7E 07      [19] 2334 	ld	a,7 (ix)
   706A 91            [ 4] 2335 	sub	a, c
   706B 28 35         [12] 2336 	jr	Z,00201$
   706D DD 5E 07      [19] 2337 	ld	e,7 (ix)
   7070 16 00         [ 7] 2338 	ld	d,#0x00
   7072 21 01 00      [10] 2339 	ld	hl,#0x0001
   7075 19            [11] 2340 	add	hl,de
   7076 DD 75 FC      [19] 2341 	ld	-4 (ix),l
   7079 DD 74 FD      [19] 2342 	ld	-3 (ix),h
   707C DD 71 FE      [19] 2343 	ld	-2 (ix),c
   707F DD 36 FF 00   [19] 2344 	ld	-1 (ix),#0x00
   7083 DD 7E FC      [19] 2345 	ld	a,-4 (ix)
   7086 DD 96 FE      [19] 2346 	sub	a, -2 (ix)
   7089 20 08         [12] 2347 	jr	NZ,00447$
   708B DD 7E FD      [19] 2348 	ld	a,-3 (ix)
   708E DD 96 FF      [19] 2349 	sub	a, -1 (ix)
   7091 28 0F         [12] 2350 	jr	Z,00201$
   7093                    2351 00447$:
   7093 1B            [ 6] 2352 	dec	de
   7094 DD 7E FE      [19] 2353 	ld	a,-2 (ix)
   7097 93            [ 4] 2354 	sub	a, e
   7098 C2 AF 71      [10] 2355 	jp	NZ,00202$
   709B DD 7E FF      [19] 2356 	ld	a,-1 (ix)
   709E 92            [ 4] 2357 	sub	a, d
   709F C2 AF 71      [10] 2358 	jp	NZ,00202$
   70A2                    2359 00201$:
                           2360 ;src/main.c:448: if (dx < enemy->x) { // izquierda
   70A2 DD 7E 06      [19] 2361 	ld	a,6 (ix)
   70A5 DD 96 FA      [19] 2362 	sub	a, -6 (ix)
   70A8 D2 2B 71      [10] 2363 	jp	NC,00121$
                           2364 ;src/main.c:449: if (dist > 11) {
   70AB 3E 0B         [ 7] 2365 	ld	a,#0x0B
   70AD DD 96 F1      [19] 2366 	sub	a, -15 (ix)
   70B0 D2 84 77      [10] 2367 	jp	NC,00208$
                           2368 ;src/main.c:450: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   70B3 79            [ 4] 2369 	ld	a,c
   70B4 F5            [11] 2370 	push	af
   70B5 33            [ 6] 2371 	inc	sp
   70B6 DD 7E FA      [19] 2372 	ld	a,-6 (ix)
   70B9 F5            [11] 2373 	push	af
   70BA 33            [ 6] 2374 	inc	sp
   70BB 2A C4 63      [16] 2375 	ld	hl,(_mapa)
   70BE E5            [11] 2376 	push	hl
   70BF CD 61 4B      [17] 2377 	call	_getTilePtr
   70C2 F1            [10] 2378 	pop	af
   70C3 F1            [10] 2379 	pop	af
   70C4 4E            [ 7] 2380 	ld	c,(hl)
   70C5 3E 02         [ 7] 2381 	ld	a,#0x02
   70C7 91            [ 4] 2382 	sub	a, c
   70C8 DA 84 77      [10] 2383 	jp	C,00208$
                           2384 ;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   70CB DD 6E F6      [19] 2385 	ld	l,-10 (ix)
   70CE DD 66 F7      [19] 2386 	ld	h,-9 (ix)
   70D1 7E            [ 7] 2387 	ld	a,(hl)
   70D2 C6 0B         [ 7] 2388 	add	a, #0x0B
   70D4 57            [ 4] 2389 	ld	d,a
   70D5 DD 6E F4      [19] 2390 	ld	l,-12 (ix)
   70D8 DD 66 F5      [19] 2391 	ld	h,-11 (ix)
   70DB 46            [ 7] 2392 	ld	b,(hl)
   70DC D5            [11] 2393 	push	de
   70DD 33            [ 6] 2394 	inc	sp
   70DE C5            [11] 2395 	push	bc
   70DF 33            [ 6] 2396 	inc	sp
   70E0 2A C4 63      [16] 2397 	ld	hl,(_mapa)
   70E3 E5            [11] 2398 	push	hl
   70E4 CD 61 4B      [17] 2399 	call	_getTilePtr
   70E7 F1            [10] 2400 	pop	af
   70E8 F1            [10] 2401 	pop	af
   70E9 4E            [ 7] 2402 	ld	c,(hl)
   70EA 3E 02         [ 7] 2403 	ld	a,#0x02
   70EC 91            [ 4] 2404 	sub	a, c
   70ED DA 84 77      [10] 2405 	jp	C,00208$
                           2406 ;src/main.c:452: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   70F0 DD 6E F6      [19] 2407 	ld	l,-10 (ix)
   70F3 DD 66 F7      [19] 2408 	ld	h,-9 (ix)
   70F6 7E            [ 7] 2409 	ld	a,(hl)
   70F7 C6 16         [ 7] 2410 	add	a, #0x16
   70F9 57            [ 4] 2411 	ld	d,a
   70FA DD 6E F4      [19] 2412 	ld	l,-12 (ix)
   70FD DD 66 F5      [19] 2413 	ld	h,-11 (ix)
   7100 46            [ 7] 2414 	ld	b,(hl)
   7101 D5            [11] 2415 	push	de
   7102 33            [ 6] 2416 	inc	sp
   7103 C5            [11] 2417 	push	bc
   7104 33            [ 6] 2418 	inc	sp
   7105 2A C4 63      [16] 2419 	ld	hl,(_mapa)
   7108 E5            [11] 2420 	push	hl
   7109 CD 61 4B      [17] 2421 	call	_getTilePtr
   710C F1            [10] 2422 	pop	af
   710D F1            [10] 2423 	pop	af
   710E 4E            [ 7] 2424 	ld	c,(hl)
   710F 3E 02         [ 7] 2425 	ld	a,#0x02
   7111 91            [ 4] 2426 	sub	a, c
   7112 DA 84 77      [10] 2427 	jp	C,00208$
                           2428 ;src/main.c:453: moverEnemigoIzquierda(enemy);
   7115 DD 6E F4      [19] 2429 	ld	l,-12 (ix)
   7118 DD 66 F5      [19] 2430 	ld	h,-11 (ix)
   711B E5            [11] 2431 	push	hl
   711C CD 68 6A      [17] 2432 	call	_moverEnemigoIzquierda
   711F F1            [10] 2433 	pop	af
                           2434 ;src/main.c:455: enemy->mover = SI;
   7120 DD 6E F8      [19] 2435 	ld	l,-8 (ix)
   7123 DD 66 F9      [19] 2436 	ld	h,-7 (ix)
   7126 36 01         [10] 2437 	ld	(hl),#0x01
   7128 C3 84 77      [10] 2438 	jp	00208$
   712B                    2439 00121$:
                           2440 ;src/main.c:459: if (dist > G_ENEMY_W + 3) {
   712B 3E 07         [ 7] 2441 	ld	a,#0x07
   712D DD 96 F1      [19] 2442 	sub	a, -15 (ix)
   7130 D2 84 77      [10] 2443 	jp	NC,00208$
                           2444 ;src/main.c:460: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7133 79            [ 4] 2445 	ld	a,c
   7134 F5            [11] 2446 	push	af
   7135 33            [ 6] 2447 	inc	sp
   7136 DD 7E FB      [19] 2448 	ld	a,-5 (ix)
   7139 F5            [11] 2449 	push	af
   713A 33            [ 6] 2450 	inc	sp
   713B 2A C4 63      [16] 2451 	ld	hl,(_mapa)
   713E E5            [11] 2452 	push	hl
   713F CD 61 4B      [17] 2453 	call	_getTilePtr
   7142 F1            [10] 2454 	pop	af
   7143 F1            [10] 2455 	pop	af
   7144 4E            [ 7] 2456 	ld	c,(hl)
   7145 3E 02         [ 7] 2457 	ld	a,#0x02
   7147 91            [ 4] 2458 	sub	a, c
   7148 DA 84 77      [10] 2459 	jp	C,00208$
                           2460 ;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   714B DD 6E F6      [19] 2461 	ld	l,-10 (ix)
   714E DD 66 F7      [19] 2462 	ld	h,-9 (ix)
   7151 7E            [ 7] 2463 	ld	a,(hl)
   7152 C6 0B         [ 7] 2464 	add	a, #0x0B
   7154 47            [ 4] 2465 	ld	b,a
   7155 DD 6E F4      [19] 2466 	ld	l,-12 (ix)
   7158 DD 66 F5      [19] 2467 	ld	h,-11 (ix)
   715B 7E            [ 7] 2468 	ld	a,(hl)
   715C C6 04         [ 7] 2469 	add	a, #0x04
   715E C5            [11] 2470 	push	bc
   715F 33            [ 6] 2471 	inc	sp
   7160 F5            [11] 2472 	push	af
   7161 33            [ 6] 2473 	inc	sp
   7162 2A C4 63      [16] 2474 	ld	hl,(_mapa)
   7165 E5            [11] 2475 	push	hl
   7166 CD 61 4B      [17] 2476 	call	_getTilePtr
   7169 F1            [10] 2477 	pop	af
   716A F1            [10] 2478 	pop	af
   716B 4E            [ 7] 2479 	ld	c,(hl)
   716C 3E 02         [ 7] 2480 	ld	a,#0x02
   716E 91            [ 4] 2481 	sub	a, c
   716F DA 84 77      [10] 2482 	jp	C,00208$
                           2483 ;src/main.c:462: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7172 DD 6E F6      [19] 2484 	ld	l,-10 (ix)
   7175 DD 66 F7      [19] 2485 	ld	h,-9 (ix)
   7178 7E            [ 7] 2486 	ld	a,(hl)
   7179 C6 16         [ 7] 2487 	add	a, #0x16
   717B 47            [ 4] 2488 	ld	b,a
   717C DD 6E F4      [19] 2489 	ld	l,-12 (ix)
   717F DD 66 F5      [19] 2490 	ld	h,-11 (ix)
   7182 7E            [ 7] 2491 	ld	a,(hl)
   7183 C6 04         [ 7] 2492 	add	a, #0x04
   7185 C5            [11] 2493 	push	bc
   7186 33            [ 6] 2494 	inc	sp
   7187 F5            [11] 2495 	push	af
   7188 33            [ 6] 2496 	inc	sp
   7189 2A C4 63      [16] 2497 	ld	hl,(_mapa)
   718C E5            [11] 2498 	push	hl
   718D CD 61 4B      [17] 2499 	call	_getTilePtr
   7190 F1            [10] 2500 	pop	af
   7191 F1            [10] 2501 	pop	af
   7192 4E            [ 7] 2502 	ld	c,(hl)
   7193 3E 02         [ 7] 2503 	ld	a,#0x02
   7195 91            [ 4] 2504 	sub	a, c
   7196 DA 84 77      [10] 2505 	jp	C,00208$
                           2506 ;src/main.c:463: moverEnemigoDerecha(enemy);
   7199 DD 6E F4      [19] 2507 	ld	l,-12 (ix)
   719C DD 66 F5      [19] 2508 	ld	h,-11 (ix)
   719F E5            [11] 2509 	push	hl
   71A0 CD 58 6A      [17] 2510 	call	_moverEnemigoDerecha
   71A3 F1            [10] 2511 	pop	af
                           2512 ;src/main.c:465: enemy->mover = SI;
   71A4 DD 6E F8      [19] 2513 	ld	l,-8 (ix)
   71A7 DD 66 F9      [19] 2514 	ld	h,-7 (ix)
   71AA 36 01         [10] 2515 	ld	(hl),#0x01
   71AC C3 84 77      [10] 2516 	jp	00208$
   71AF                    2517 00202$:
                           2518 ;src/main.c:470: else if (enemy->x == dx) {
   71AF DD 7E FA      [19] 2519 	ld	a,-6 (ix)
   71B2 DD 96 06      [19] 2520 	sub	a, 6 (ix)
   71B5 C2 CA 72      [10] 2521 	jp	NZ,00199$
                           2522 ;src/main.c:471: if (dy < enemy->y) {
   71B8 DD 7E 07      [19] 2523 	ld	a,7 (ix)
   71BB 91            [ 4] 2524 	sub	a, c
   71BC D2 43 72      [10] 2525 	jp	NC,00136$
                           2526 ;src/main.c:472: if (dist > G_HERO_H + 5) {
   71BF 3E 1B         [ 7] 2527 	ld	a,#0x1B
   71C1 DD 96 F1      [19] 2528 	sub	a, -15 (ix)
   71C4 D2 84 77      [10] 2529 	jp	NC,00208$
                           2530 ;src/main.c:473: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   71C7 41            [ 4] 2531 	ld	b,c
   71C8 05            [ 4] 2532 	dec	b
   71C9 05            [ 4] 2533 	dec	b
   71CA C5            [11] 2534 	push	bc
   71CB 33            [ 6] 2535 	inc	sp
   71CC DD 7E FA      [19] 2536 	ld	a,-6 (ix)
   71CF F5            [11] 2537 	push	af
   71D0 33            [ 6] 2538 	inc	sp
   71D1 2A C4 63      [16] 2539 	ld	hl,(_mapa)
   71D4 E5            [11] 2540 	push	hl
   71D5 CD 61 4B      [17] 2541 	call	_getTilePtr
   71D8 F1            [10] 2542 	pop	af
   71D9 F1            [10] 2543 	pop	af
   71DA 4E            [ 7] 2544 	ld	c,(hl)
   71DB 3E 02         [ 7] 2545 	ld	a,#0x02
   71DD 91            [ 4] 2546 	sub	a, c
   71DE DA 84 77      [10] 2547 	jp	C,00208$
                           2548 ;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   71E1 DD 6E F6      [19] 2549 	ld	l,-10 (ix)
   71E4 DD 66 F7      [19] 2550 	ld	h,-9 (ix)
   71E7 56            [ 7] 2551 	ld	d,(hl)
   71E8 15            [ 4] 2552 	dec	d
   71E9 15            [ 4] 2553 	dec	d
   71EA DD 6E F4      [19] 2554 	ld	l,-12 (ix)
   71ED DD 66 F5      [19] 2555 	ld	h,-11 (ix)
   71F0 46            [ 7] 2556 	ld	b,(hl)
   71F1 04            [ 4] 2557 	inc	b
   71F2 04            [ 4] 2558 	inc	b
   71F3 D5            [11] 2559 	push	de
   71F4 33            [ 6] 2560 	inc	sp
   71F5 C5            [11] 2561 	push	bc
   71F6 33            [ 6] 2562 	inc	sp
   71F7 2A C4 63      [16] 2563 	ld	hl,(_mapa)
   71FA E5            [11] 2564 	push	hl
   71FB CD 61 4B      [17] 2565 	call	_getTilePtr
   71FE F1            [10] 2566 	pop	af
   71FF F1            [10] 2567 	pop	af
   7200 4E            [ 7] 2568 	ld	c,(hl)
   7201 3E 02         [ 7] 2569 	ld	a,#0x02
   7203 91            [ 4] 2570 	sub	a, c
   7204 DA 84 77      [10] 2571 	jp	C,00208$
                           2572 ;src/main.c:475: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7207 DD 6E F6      [19] 2573 	ld	l,-10 (ix)
   720A DD 66 F7      [19] 2574 	ld	h,-9 (ix)
   720D 46            [ 7] 2575 	ld	b,(hl)
   720E 05            [ 4] 2576 	dec	b
   720F 05            [ 4] 2577 	dec	b
   7210 DD 6E F4      [19] 2578 	ld	l,-12 (ix)
   7213 DD 66 F5      [19] 2579 	ld	h,-11 (ix)
   7216 7E            [ 7] 2580 	ld	a,(hl)
   7217 C6 04         [ 7] 2581 	add	a, #0x04
   7219 C5            [11] 2582 	push	bc
   721A 33            [ 6] 2583 	inc	sp
   721B F5            [11] 2584 	push	af
   721C 33            [ 6] 2585 	inc	sp
   721D 2A C4 63      [16] 2586 	ld	hl,(_mapa)
   7220 E5            [11] 2587 	push	hl
   7221 CD 61 4B      [17] 2588 	call	_getTilePtr
   7224 F1            [10] 2589 	pop	af
   7225 F1            [10] 2590 	pop	af
   7226 4E            [ 7] 2591 	ld	c,(hl)
   7227 3E 02         [ 7] 2592 	ld	a,#0x02
   7229 91            [ 4] 2593 	sub	a, c
   722A DA 84 77      [10] 2594 	jp	C,00208$
                           2595 ;src/main.c:476: moverEnemigoArriba(enemy);
   722D DD 6E F4      [19] 2596 	ld	l,-12 (ix)
   7230 DD 66 F5      [19] 2597 	ld	h,-11 (ix)
   7233 E5            [11] 2598 	push	hl
   7234 CD 1A 6A      [17] 2599 	call	_moverEnemigoArriba
   7237 F1            [10] 2600 	pop	af
                           2601 ;src/main.c:478: enemy->mover = SI;
   7238 DD 6E F8      [19] 2602 	ld	l,-8 (ix)
   723B DD 66 F9      [19] 2603 	ld	h,-7 (ix)
   723E 36 01         [10] 2604 	ld	(hl),#0x01
   7240 C3 84 77      [10] 2605 	jp	00208$
   7243                    2606 00136$:
                           2607 ;src/main.c:482: if(dist > G_ENEMY_H + 7) {
   7243 3E 1D         [ 7] 2608 	ld	a,#0x1D
   7245 DD 96 F1      [19] 2609 	sub	a, -15 (ix)
   7248 D2 84 77      [10] 2610 	jp	NC,00208$
                           2611 ;src/main.c:483: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   724B 79            [ 4] 2612 	ld	a,c
   724C C6 18         [ 7] 2613 	add	a, #0x18
   724E 47            [ 4] 2614 	ld	b,a
   724F C5            [11] 2615 	push	bc
   7250 33            [ 6] 2616 	inc	sp
   7251 DD 7E FA      [19] 2617 	ld	a,-6 (ix)
   7254 F5            [11] 2618 	push	af
   7255 33            [ 6] 2619 	inc	sp
   7256 2A C4 63      [16] 2620 	ld	hl,(_mapa)
   7259 E5            [11] 2621 	push	hl
   725A CD 61 4B      [17] 2622 	call	_getTilePtr
   725D F1            [10] 2623 	pop	af
   725E F1            [10] 2624 	pop	af
   725F 4E            [ 7] 2625 	ld	c,(hl)
   7260 3E 02         [ 7] 2626 	ld	a,#0x02
   7262 91            [ 4] 2627 	sub	a, c
   7263 DA 84 77      [10] 2628 	jp	C,00208$
                           2629 ;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7266 DD 6E F6      [19] 2630 	ld	l,-10 (ix)
   7269 DD 66 F7      [19] 2631 	ld	h,-9 (ix)
   726C 7E            [ 7] 2632 	ld	a,(hl)
   726D C6 18         [ 7] 2633 	add	a, #0x18
   726F 57            [ 4] 2634 	ld	d,a
   7270 DD 6E F4      [19] 2635 	ld	l,-12 (ix)
   7273 DD 66 F5      [19] 2636 	ld	h,-11 (ix)
   7276 46            [ 7] 2637 	ld	b,(hl)
   7277 04            [ 4] 2638 	inc	b
   7278 04            [ 4] 2639 	inc	b
   7279 D5            [11] 2640 	push	de
   727A 33            [ 6] 2641 	inc	sp
   727B C5            [11] 2642 	push	bc
   727C 33            [ 6] 2643 	inc	sp
   727D 2A C4 63      [16] 2644 	ld	hl,(_mapa)
   7280 E5            [11] 2645 	push	hl
   7281 CD 61 4B      [17] 2646 	call	_getTilePtr
   7284 F1            [10] 2647 	pop	af
   7285 F1            [10] 2648 	pop	af
   7286 4E            [ 7] 2649 	ld	c,(hl)
   7287 3E 02         [ 7] 2650 	ld	a,#0x02
   7289 91            [ 4] 2651 	sub	a, c
   728A DA 84 77      [10] 2652 	jp	C,00208$
                           2653 ;src/main.c:485: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   728D DD 6E F6      [19] 2654 	ld	l,-10 (ix)
   7290 DD 66 F7      [19] 2655 	ld	h,-9 (ix)
   7293 7E            [ 7] 2656 	ld	a,(hl)
   7294 C6 18         [ 7] 2657 	add	a, #0x18
   7296 47            [ 4] 2658 	ld	b,a
   7297 DD 6E F4      [19] 2659 	ld	l,-12 (ix)
   729A DD 66 F5      [19] 2660 	ld	h,-11 (ix)
   729D 7E            [ 7] 2661 	ld	a,(hl)
   729E C6 04         [ 7] 2662 	add	a, #0x04
   72A0 C5            [11] 2663 	push	bc
   72A1 33            [ 6] 2664 	inc	sp
   72A2 F5            [11] 2665 	push	af
   72A3 33            [ 6] 2666 	inc	sp
   72A4 2A C4 63      [16] 2667 	ld	hl,(_mapa)
   72A7 E5            [11] 2668 	push	hl
   72A8 CD 61 4B      [17] 2669 	call	_getTilePtr
   72AB F1            [10] 2670 	pop	af
   72AC F1            [10] 2671 	pop	af
   72AD 4E            [ 7] 2672 	ld	c,(hl)
   72AE 3E 02         [ 7] 2673 	ld	a,#0x02
   72B0 91            [ 4] 2674 	sub	a, c
   72B1 DA 84 77      [10] 2675 	jp	C,00208$
                           2676 ;src/main.c:486: moverEnemigoAbajo(enemy);
   72B4 DD 6E F4      [19] 2677 	ld	l,-12 (ix)
   72B7 DD 66 F5      [19] 2678 	ld	h,-11 (ix)
   72BA E5            [11] 2679 	push	hl
   72BB CD 39 6A      [17] 2680 	call	_moverEnemigoAbajo
   72BE F1            [10] 2681 	pop	af
                           2682 ;src/main.c:488: enemy->mover = SI;
   72BF DD 6E F8      [19] 2683 	ld	l,-8 (ix)
   72C2 DD 66 F9      [19] 2684 	ld	h,-7 (ix)
   72C5 36 01         [10] 2685 	ld	(hl),#0x01
   72C7 C3 84 77      [10] 2686 	jp	00208$
   72CA                    2687 00199$:
                           2688 ;src/main.c:494: if (!prota.mover) distConstraint = 20; // ajuste en parado
   72CA 3A E8 62      [13] 2689 	ld	a, (#_prota + 6)
   72CD B7            [ 4] 2690 	or	a, a
   72CE 20 04         [12] 2691 	jr	NZ,00139$
   72D0 DD 36 F0 14   [19] 2692 	ld	-16 (ix),#0x14
   72D4                    2693 00139$:
                           2694 ;src/main.c:496: if (dist > distConstraint) {
   72D4 DD 7E F0      [19] 2695 	ld	a,-16 (ix)
   72D7 DD 96 F1      [19] 2696 	sub	a, -15 (ix)
   72DA D2 84 77      [10] 2697 	jp	NC,00208$
                           2698 ;src/main.c:497: if (dx + 1 < enemy->x) {
   72DD DD 5E 06      [19] 2699 	ld	e,6 (ix)
   72E0 16 00         [ 7] 2700 	ld	d,#0x00
   72E2 13            [ 6] 2701 	inc	de
   72E3 DD 7E FA      [19] 2702 	ld	a,-6 (ix)
   72E6 DD 77 FE      [19] 2703 	ld	-2 (ix),a
   72E9 DD 36 FF 00   [19] 2704 	ld	-1 (ix),#0x00
   72ED 7B            [ 4] 2705 	ld	a,e
   72EE DD 96 FE      [19] 2706 	sub	a, -2 (ix)
   72F1 7A            [ 4] 2707 	ld	a,d
   72F2 DD 9E FF      [19] 2708 	sbc	a, -1 (ix)
   72F5 E2 FA 72      [10] 2709 	jp	PO, 00452$
   72F8 EE 80         [ 7] 2710 	xor	a, #0x80
   72FA                    2711 00452$:
   72FA F2 79 73      [10] 2712 	jp	P,00151$
                           2713 ;src/main.c:498: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   72FD 79            [ 4] 2714 	ld	a,c
   72FE F5            [11] 2715 	push	af
   72FF 33            [ 6] 2716 	inc	sp
   7300 DD 7E FA      [19] 2717 	ld	a,-6 (ix)
   7303 F5            [11] 2718 	push	af
   7304 33            [ 6] 2719 	inc	sp
   7305 2A C4 63      [16] 2720 	ld	hl,(_mapa)
   7308 E5            [11] 2721 	push	hl
   7309 CD 61 4B      [17] 2722 	call	_getTilePtr
   730C F1            [10] 2723 	pop	af
   730D F1            [10] 2724 	pop	af
   730E 4E            [ 7] 2725 	ld	c,(hl)
   730F 3E 02         [ 7] 2726 	ld	a,#0x02
   7311 91            [ 4] 2727 	sub	a, c
   7312 DA 03 74      [10] 2728 	jp	C,00152$
                           2729 ;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7315 DD 6E F6      [19] 2730 	ld	l,-10 (ix)
   7318 DD 66 F7      [19] 2731 	ld	h,-9 (ix)
   731B 7E            [ 7] 2732 	ld	a,(hl)
   731C C6 0B         [ 7] 2733 	add	a, #0x0B
   731E 57            [ 4] 2734 	ld	d,a
   731F DD 6E F4      [19] 2735 	ld	l,-12 (ix)
   7322 DD 66 F5      [19] 2736 	ld	h,-11 (ix)
   7325 46            [ 7] 2737 	ld	b,(hl)
   7326 D5            [11] 2738 	push	de
   7327 33            [ 6] 2739 	inc	sp
   7328 C5            [11] 2740 	push	bc
   7329 33            [ 6] 2741 	inc	sp
   732A 2A C4 63      [16] 2742 	ld	hl,(_mapa)
   732D E5            [11] 2743 	push	hl
   732E CD 61 4B      [17] 2744 	call	_getTilePtr
   7331 F1            [10] 2745 	pop	af
   7332 F1            [10] 2746 	pop	af
   7333 4E            [ 7] 2747 	ld	c,(hl)
   7334 3E 02         [ 7] 2748 	ld	a,#0x02
   7336 91            [ 4] 2749 	sub	a, c
   7337 DA 03 74      [10] 2750 	jp	C,00152$
                           2751 ;src/main.c:500: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   733A DD 6E F6      [19] 2752 	ld	l,-10 (ix)
   733D DD 66 F7      [19] 2753 	ld	h,-9 (ix)
   7340 7E            [ 7] 2754 	ld	a,(hl)
   7341 C6 16         [ 7] 2755 	add	a, #0x16
   7343 57            [ 4] 2756 	ld	d,a
   7344 DD 6E F4      [19] 2757 	ld	l,-12 (ix)
   7347 DD 66 F5      [19] 2758 	ld	h,-11 (ix)
   734A 46            [ 7] 2759 	ld	b,(hl)
   734B D5            [11] 2760 	push	de
   734C 33            [ 6] 2761 	inc	sp
   734D C5            [11] 2762 	push	bc
   734E 33            [ 6] 2763 	inc	sp
   734F 2A C4 63      [16] 2764 	ld	hl,(_mapa)
   7352 E5            [11] 2765 	push	hl
   7353 CD 61 4B      [17] 2766 	call	_getTilePtr
   7356 F1            [10] 2767 	pop	af
   7357 F1            [10] 2768 	pop	af
   7358 4E            [ 7] 2769 	ld	c,(hl)
   7359 3E 02         [ 7] 2770 	ld	a,#0x02
   735B 91            [ 4] 2771 	sub	a, c
   735C DA 03 74      [10] 2772 	jp	C,00152$
                           2773 ;src/main.c:501: moverEnemigoIzquierda(enemy);
   735F DD 6E F4      [19] 2774 	ld	l,-12 (ix)
   7362 DD 66 F5      [19] 2775 	ld	h,-11 (ix)
   7365 E5            [11] 2776 	push	hl
   7366 CD 68 6A      [17] 2777 	call	_moverEnemigoIzquierda
   7369 F1            [10] 2778 	pop	af
                           2779 ;src/main.c:502: movX = 1;
   736A DD 36 F3 01   [19] 2780 	ld	-13 (ix),#0x01
                           2781 ;src/main.c:503: enemy->mover = SI;
   736E DD 6E F8      [19] 2782 	ld	l,-8 (ix)
   7371 DD 66 F9      [19] 2783 	ld	h,-7 (ix)
   7374 36 01         [10] 2784 	ld	(hl),#0x01
   7376 C3 03 74      [10] 2785 	jp	00152$
   7379                    2786 00151$:
                           2787 ;src/main.c:505: } else if (dx + 1 > enemy->x){
   7379 DD 7E FE      [19] 2788 	ld	a,-2 (ix)
   737C 93            [ 4] 2789 	sub	a, e
   737D DD 7E FF      [19] 2790 	ld	a,-1 (ix)
   7380 9A            [ 4] 2791 	sbc	a, d
   7381 E2 86 73      [10] 2792 	jp	PO, 00453$
   7384 EE 80         [ 7] 2793 	xor	a, #0x80
   7386                    2794 00453$:
   7386 F2 03 74      [10] 2795 	jp	P,00152$
                           2796 ;src/main.c:506: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7389 79            [ 4] 2797 	ld	a,c
   738A F5            [11] 2798 	push	af
   738B 33            [ 6] 2799 	inc	sp
   738C DD 7E FB      [19] 2800 	ld	a,-5 (ix)
   738F F5            [11] 2801 	push	af
   7390 33            [ 6] 2802 	inc	sp
   7391 2A C4 63      [16] 2803 	ld	hl,(_mapa)
   7394 E5            [11] 2804 	push	hl
   7395 CD 61 4B      [17] 2805 	call	_getTilePtr
   7398 F1            [10] 2806 	pop	af
   7399 F1            [10] 2807 	pop	af
   739A 4E            [ 7] 2808 	ld	c,(hl)
   739B 3E 02         [ 7] 2809 	ld	a,#0x02
   739D 91            [ 4] 2810 	sub	a, c
   739E 38 63         [12] 2811 	jr	C,00152$
                           2812 ;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   73A0 DD 6E F6      [19] 2813 	ld	l,-10 (ix)
   73A3 DD 66 F7      [19] 2814 	ld	h,-9 (ix)
   73A6 7E            [ 7] 2815 	ld	a,(hl)
   73A7 C6 0B         [ 7] 2816 	add	a, #0x0B
   73A9 47            [ 4] 2817 	ld	b,a
   73AA DD 6E F4      [19] 2818 	ld	l,-12 (ix)
   73AD DD 66 F5      [19] 2819 	ld	h,-11 (ix)
   73B0 7E            [ 7] 2820 	ld	a,(hl)
   73B1 C6 04         [ 7] 2821 	add	a, #0x04
   73B3 C5            [11] 2822 	push	bc
   73B4 33            [ 6] 2823 	inc	sp
   73B5 F5            [11] 2824 	push	af
   73B6 33            [ 6] 2825 	inc	sp
   73B7 2A C4 63      [16] 2826 	ld	hl,(_mapa)
   73BA E5            [11] 2827 	push	hl
   73BB CD 61 4B      [17] 2828 	call	_getTilePtr
   73BE F1            [10] 2829 	pop	af
   73BF F1            [10] 2830 	pop	af
   73C0 4E            [ 7] 2831 	ld	c,(hl)
   73C1 3E 02         [ 7] 2832 	ld	a,#0x02
   73C3 91            [ 4] 2833 	sub	a, c
   73C4 38 3D         [12] 2834 	jr	C,00152$
                           2835 ;src/main.c:508: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   73C6 DD 6E F6      [19] 2836 	ld	l,-10 (ix)
   73C9 DD 66 F7      [19] 2837 	ld	h,-9 (ix)
   73CC 7E            [ 7] 2838 	ld	a,(hl)
   73CD C6 16         [ 7] 2839 	add	a, #0x16
   73CF 47            [ 4] 2840 	ld	b,a
   73D0 DD 6E F4      [19] 2841 	ld	l,-12 (ix)
   73D3 DD 66 F5      [19] 2842 	ld	h,-11 (ix)
   73D6 7E            [ 7] 2843 	ld	a,(hl)
   73D7 C6 04         [ 7] 2844 	add	a, #0x04
   73D9 C5            [11] 2845 	push	bc
   73DA 33            [ 6] 2846 	inc	sp
   73DB F5            [11] 2847 	push	af
   73DC 33            [ 6] 2848 	inc	sp
   73DD 2A C4 63      [16] 2849 	ld	hl,(_mapa)
   73E0 E5            [11] 2850 	push	hl
   73E1 CD 61 4B      [17] 2851 	call	_getTilePtr
   73E4 F1            [10] 2852 	pop	af
   73E5 F1            [10] 2853 	pop	af
   73E6 4E            [ 7] 2854 	ld	c,(hl)
   73E7 3E 02         [ 7] 2855 	ld	a,#0x02
   73E9 91            [ 4] 2856 	sub	a, c
   73EA 38 17         [12] 2857 	jr	C,00152$
                           2858 ;src/main.c:509: moverEnemigoDerecha(enemy);
   73EC DD 6E F4      [19] 2859 	ld	l,-12 (ix)
   73EF DD 66 F5      [19] 2860 	ld	h,-11 (ix)
   73F2 E5            [11] 2861 	push	hl
   73F3 CD 58 6A      [17] 2862 	call	_moverEnemigoDerecha
   73F6 F1            [10] 2863 	pop	af
                           2864 ;src/main.c:510: movX = 1;
   73F7 DD 36 F3 01   [19] 2865 	ld	-13 (ix),#0x01
                           2866 ;src/main.c:511: enemy->mover = SI;
   73FB DD 6E F8      [19] 2867 	ld	l,-8 (ix)
   73FE DD 66 F9      [19] 2868 	ld	h,-7 (ix)
   7401 36 01         [10] 2869 	ld	(hl),#0x01
   7403                    2870 00152$:
                           2871 ;src/main.c:514: if (dy < enemy->y) {
   7403 DD 6E F6      [19] 2872 	ld	l,-10 (ix)
   7406 DD 66 F7      [19] 2873 	ld	h,-9 (ix)
   7409 7E            [ 7] 2874 	ld	a,(hl)
   740A DD 77 FE      [19] 2875 	ld	-2 (ix),a
                           2876 ;src/main.c:427: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   740D DD 6E F4      [19] 2877 	ld	l,-12 (ix)
   7410 DD 66 F5      [19] 2878 	ld	h,-11 (ix)
   7413 7E            [ 7] 2879 	ld	a,(hl)
   7414 DD 77 FC      [19] 2880 	ld	-4 (ix),a
                           2881 ;src/main.c:514: if (dy < enemy->y) {
   7417 DD 7E 07      [19] 2882 	ld	a,7 (ix)
   741A DD 96 FE      [19] 2883 	sub	a, -2 (ix)
   741D D2 A2 74      [10] 2884 	jp	NC,00162$
                           2885 ;src/main.c:515: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7420 DD 46 FE      [19] 2886 	ld	b,-2 (ix)
   7423 05            [ 4] 2887 	dec	b
   7424 05            [ 4] 2888 	dec	b
   7425 C5            [11] 2889 	push	bc
   7426 33            [ 6] 2890 	inc	sp
   7427 DD 7E FC      [19] 2891 	ld	a,-4 (ix)
   742A F5            [11] 2892 	push	af
   742B 33            [ 6] 2893 	inc	sp
   742C 2A C4 63      [16] 2894 	ld	hl,(_mapa)
   742F E5            [11] 2895 	push	hl
   7430 CD 61 4B      [17] 2896 	call	_getTilePtr
   7433 F1            [10] 2897 	pop	af
   7434 F1            [10] 2898 	pop	af
   7435 4E            [ 7] 2899 	ld	c,(hl)
   7436 3E 02         [ 7] 2900 	ld	a,#0x02
   7438 91            [ 4] 2901 	sub	a, c
   7439 DA 21 75      [10] 2902 	jp	C,00163$
                           2903 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   743C DD 6E F6      [19] 2904 	ld	l,-10 (ix)
   743F DD 66 F7      [19] 2905 	ld	h,-9 (ix)
   7442 56            [ 7] 2906 	ld	d,(hl)
   7443 15            [ 4] 2907 	dec	d
   7444 15            [ 4] 2908 	dec	d
   7445 DD 6E F4      [19] 2909 	ld	l,-12 (ix)
   7448 DD 66 F5      [19] 2910 	ld	h,-11 (ix)
   744B 46            [ 7] 2911 	ld	b,(hl)
   744C 04            [ 4] 2912 	inc	b
   744D 04            [ 4] 2913 	inc	b
   744E D5            [11] 2914 	push	de
   744F 33            [ 6] 2915 	inc	sp
   7450 C5            [11] 2916 	push	bc
   7451 33            [ 6] 2917 	inc	sp
   7452 2A C4 63      [16] 2918 	ld	hl,(_mapa)
   7455 E5            [11] 2919 	push	hl
   7456 CD 61 4B      [17] 2920 	call	_getTilePtr
   7459 F1            [10] 2921 	pop	af
   745A F1            [10] 2922 	pop	af
   745B 4E            [ 7] 2923 	ld	c,(hl)
   745C 3E 02         [ 7] 2924 	ld	a,#0x02
   745E 91            [ 4] 2925 	sub	a, c
   745F DA 21 75      [10] 2926 	jp	C,00163$
                           2927 ;src/main.c:517: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7462 DD 6E F6      [19] 2928 	ld	l,-10 (ix)
   7465 DD 66 F7      [19] 2929 	ld	h,-9 (ix)
   7468 46            [ 7] 2930 	ld	b,(hl)
   7469 05            [ 4] 2931 	dec	b
   746A 05            [ 4] 2932 	dec	b
   746B DD 6E F4      [19] 2933 	ld	l,-12 (ix)
   746E DD 66 F5      [19] 2934 	ld	h,-11 (ix)
   7471 7E            [ 7] 2935 	ld	a,(hl)
   7472 C6 04         [ 7] 2936 	add	a, #0x04
   7474 C5            [11] 2937 	push	bc
   7475 33            [ 6] 2938 	inc	sp
   7476 F5            [11] 2939 	push	af
   7477 33            [ 6] 2940 	inc	sp
   7478 2A C4 63      [16] 2941 	ld	hl,(_mapa)
   747B E5            [11] 2942 	push	hl
   747C CD 61 4B      [17] 2943 	call	_getTilePtr
   747F F1            [10] 2944 	pop	af
   7480 F1            [10] 2945 	pop	af
   7481 4E            [ 7] 2946 	ld	c,(hl)
   7482 3E 02         [ 7] 2947 	ld	a,#0x02
   7484 91            [ 4] 2948 	sub	a, c
   7485 DA 21 75      [10] 2949 	jp	C,00163$
                           2950 ;src/main.c:518: moverEnemigoArriba(enemy);
   7488 DD 6E F4      [19] 2951 	ld	l,-12 (ix)
   748B DD 66 F5      [19] 2952 	ld	h,-11 (ix)
   748E E5            [11] 2953 	push	hl
   748F CD 1A 6A      [17] 2954 	call	_moverEnemigoArriba
   7492 F1            [10] 2955 	pop	af
                           2956 ;src/main.c:519: movY = 1;
   7493 DD 36 F2 01   [19] 2957 	ld	-14 (ix),#0x01
                           2958 ;src/main.c:520: enemy->mover = SI;
   7497 DD 6E F8      [19] 2959 	ld	l,-8 (ix)
   749A DD 66 F9      [19] 2960 	ld	h,-7 (ix)
   749D 36 01         [10] 2961 	ld	(hl),#0x01
   749F C3 21 75      [10] 2962 	jp	00163$
   74A2                    2963 00162$:
                           2964 ;src/main.c:523: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   74A2 DD 7E FE      [19] 2965 	ld	a,-2 (ix)
   74A5 C6 18         [ 7] 2966 	add	a, #0x18
   74A7 47            [ 4] 2967 	ld	b,a
   74A8 C5            [11] 2968 	push	bc
   74A9 33            [ 6] 2969 	inc	sp
   74AA DD 7E FC      [19] 2970 	ld	a,-4 (ix)
   74AD F5            [11] 2971 	push	af
   74AE 33            [ 6] 2972 	inc	sp
   74AF 2A C4 63      [16] 2973 	ld	hl,(_mapa)
   74B2 E5            [11] 2974 	push	hl
   74B3 CD 61 4B      [17] 2975 	call	_getTilePtr
   74B6 F1            [10] 2976 	pop	af
   74B7 F1            [10] 2977 	pop	af
   74B8 4E            [ 7] 2978 	ld	c,(hl)
   74B9 3E 02         [ 7] 2979 	ld	a,#0x02
   74BB 91            [ 4] 2980 	sub	a, c
   74BC 38 63         [12] 2981 	jr	C,00163$
                           2982 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   74BE DD 6E F6      [19] 2983 	ld	l,-10 (ix)
   74C1 DD 66 F7      [19] 2984 	ld	h,-9 (ix)
   74C4 7E            [ 7] 2985 	ld	a,(hl)
   74C5 C6 18         [ 7] 2986 	add	a, #0x18
   74C7 57            [ 4] 2987 	ld	d,a
   74C8 DD 6E F4      [19] 2988 	ld	l,-12 (ix)
   74CB DD 66 F5      [19] 2989 	ld	h,-11 (ix)
   74CE 46            [ 7] 2990 	ld	b,(hl)
   74CF 04            [ 4] 2991 	inc	b
   74D0 04            [ 4] 2992 	inc	b
   74D1 D5            [11] 2993 	push	de
   74D2 33            [ 6] 2994 	inc	sp
   74D3 C5            [11] 2995 	push	bc
   74D4 33            [ 6] 2996 	inc	sp
   74D5 2A C4 63      [16] 2997 	ld	hl,(_mapa)
   74D8 E5            [11] 2998 	push	hl
   74D9 CD 61 4B      [17] 2999 	call	_getTilePtr
   74DC F1            [10] 3000 	pop	af
   74DD F1            [10] 3001 	pop	af
   74DE 4E            [ 7] 3002 	ld	c,(hl)
   74DF 3E 02         [ 7] 3003 	ld	a,#0x02
   74E1 91            [ 4] 3004 	sub	a, c
   74E2 38 3D         [12] 3005 	jr	C,00163$
                           3006 ;src/main.c:525: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   74E4 DD 6E F6      [19] 3007 	ld	l,-10 (ix)
   74E7 DD 66 F7      [19] 3008 	ld	h,-9 (ix)
   74EA 7E            [ 7] 3009 	ld	a,(hl)
   74EB C6 18         [ 7] 3010 	add	a, #0x18
   74ED 47            [ 4] 3011 	ld	b,a
   74EE DD 6E F4      [19] 3012 	ld	l,-12 (ix)
   74F1 DD 66 F5      [19] 3013 	ld	h,-11 (ix)
   74F4 7E            [ 7] 3014 	ld	a,(hl)
   74F5 C6 04         [ 7] 3015 	add	a, #0x04
   74F7 C5            [11] 3016 	push	bc
   74F8 33            [ 6] 3017 	inc	sp
   74F9 F5            [11] 3018 	push	af
   74FA 33            [ 6] 3019 	inc	sp
   74FB 2A C4 63      [16] 3020 	ld	hl,(_mapa)
   74FE E5            [11] 3021 	push	hl
   74FF CD 61 4B      [17] 3022 	call	_getTilePtr
   7502 F1            [10] 3023 	pop	af
   7503 F1            [10] 3024 	pop	af
   7504 4E            [ 7] 3025 	ld	c,(hl)
   7505 3E 02         [ 7] 3026 	ld	a,#0x02
   7507 91            [ 4] 3027 	sub	a, c
   7508 38 17         [12] 3028 	jr	C,00163$
                           3029 ;src/main.c:526: moverEnemigoAbajo(enemy);
   750A DD 6E F4      [19] 3030 	ld	l,-12 (ix)
   750D DD 66 F5      [19] 3031 	ld	h,-11 (ix)
   7510 E5            [11] 3032 	push	hl
   7511 CD 39 6A      [17] 3033 	call	_moverEnemigoAbajo
   7514 F1            [10] 3034 	pop	af
                           3035 ;src/main.c:527: movY = 1;
   7515 DD 36 F2 01   [19] 3036 	ld	-14 (ix),#0x01
                           3037 ;src/main.c:528: enemy->mover = SI;
   7519 DD 6E F8      [19] 3038 	ld	l,-8 (ix)
   751C DD 66 F9      [19] 3039 	ld	h,-7 (ix)
   751F 36 01         [10] 3040 	ld	(hl),#0x01
   7521                    3041 00163$:
                           3042 ;src/main.c:531: if (!enemy->mover) {
   7521 DD 6E F8      [19] 3043 	ld	l,-8 (ix)
   7524 DD 66 F9      [19] 3044 	ld	h,-7 (ix)
   7527 7E            [ 7] 3045 	ld	a,(hl)
   7528 B7            [ 4] 3046 	or	a, a
   7529 C2 84 77      [10] 3047 	jp	NZ,00208$
                           3048 ;src/main.c:532: if (!movX) {
   752C DD 7E F3      [19] 3049 	ld	a,-13 (ix)
   752F B7            [ 4] 3050 	or	a, a
   7530 C2 59 76      [10] 3051 	jp	NZ,00178$
                           3052 ;src/main.c:533: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7533 DD 6E F6      [19] 3053 	ld	l,-10 (ix)
   7536 DD 66 F7      [19] 3054 	ld	h,-9 (ix)
   7539 5E            [ 7] 3055 	ld	e,(hl)
                           3056 ;src/main.c:427: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   753A DD 6E F4      [19] 3057 	ld	l,-12 (ix)
   753D DD 66 F5      [19] 3058 	ld	h,-11 (ix)
   7540 4E            [ 7] 3059 	ld	c,(hl)
                           3060 ;src/main.c:533: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7541 3E 70         [ 7] 3061 	ld	a,#0x70
   7543 93            [ 4] 3062 	sub	a, e
   7544 D2 D4 75      [10] 3063 	jp	NC,00175$
                           3064 ;src/main.c:534: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7547 7B            [ 4] 3065 	ld	a,e
   7548 C6 18         [ 7] 3066 	add	a, #0x18
   754A 47            [ 4] 3067 	ld	b,a
   754B C5            [11] 3068 	push	bc
   754C 2A C4 63      [16] 3069 	ld	hl,(_mapa)
   754F E5            [11] 3070 	push	hl
   7550 CD 61 4B      [17] 3071 	call	_getTilePtr
   7553 F1            [10] 3072 	pop	af
   7554 F1            [10] 3073 	pop	af
   7555 4E            [ 7] 3074 	ld	c,(hl)
   7556 3E 02         [ 7] 3075 	ld	a,#0x02
   7558 91            [ 4] 3076 	sub	a, c
   7559 38 63         [12] 3077 	jr	C,00165$
                           3078 ;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   755B DD 6E F6      [19] 3079 	ld	l,-10 (ix)
   755E DD 66 F7      [19] 3080 	ld	h,-9 (ix)
   7561 7E            [ 7] 3081 	ld	a,(hl)
   7562 C6 18         [ 7] 3082 	add	a, #0x18
   7564 57            [ 4] 3083 	ld	d,a
   7565 DD 6E F4      [19] 3084 	ld	l,-12 (ix)
   7568 DD 66 F5      [19] 3085 	ld	h,-11 (ix)
   756B 4E            [ 7] 3086 	ld	c,(hl)
   756C 41            [ 4] 3087 	ld	b,c
   756D 04            [ 4] 3088 	inc	b
   756E 04            [ 4] 3089 	inc	b
   756F D5            [11] 3090 	push	de
   7570 33            [ 6] 3091 	inc	sp
   7571 C5            [11] 3092 	push	bc
   7572 33            [ 6] 3093 	inc	sp
   7573 2A C4 63      [16] 3094 	ld	hl,(_mapa)
   7576 E5            [11] 3095 	push	hl
   7577 CD 61 4B      [17] 3096 	call	_getTilePtr
   757A F1            [10] 3097 	pop	af
   757B F1            [10] 3098 	pop	af
   757C 4E            [ 7] 3099 	ld	c,(hl)
   757D 3E 02         [ 7] 3100 	ld	a,#0x02
   757F 91            [ 4] 3101 	sub	a, c
   7580 38 3C         [12] 3102 	jr	C,00165$
                           3103 ;src/main.c:536: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7582 DD 6E F6      [19] 3104 	ld	l,-10 (ix)
   7585 DD 66 F7      [19] 3105 	ld	h,-9 (ix)
   7588 7E            [ 7] 3106 	ld	a,(hl)
   7589 C6 18         [ 7] 3107 	add	a, #0x18
   758B 47            [ 4] 3108 	ld	b,a
   758C DD 6E F4      [19] 3109 	ld	l,-12 (ix)
   758F DD 66 F5      [19] 3110 	ld	h,-11 (ix)
   7592 7E            [ 7] 3111 	ld	a,(hl)
   7593 C6 04         [ 7] 3112 	add	a, #0x04
   7595 C5            [11] 3113 	push	bc
   7596 33            [ 6] 3114 	inc	sp
   7597 F5            [11] 3115 	push	af
   7598 33            [ 6] 3116 	inc	sp
   7599 2A C4 63      [16] 3117 	ld	hl,(_mapa)
   759C E5            [11] 3118 	push	hl
   759D CD 61 4B      [17] 3119 	call	_getTilePtr
   75A0 F1            [10] 3120 	pop	af
   75A1 F1            [10] 3121 	pop	af
   75A2 4E            [ 7] 3122 	ld	c,(hl)
   75A3 3E 02         [ 7] 3123 	ld	a,#0x02
   75A5 91            [ 4] 3124 	sub	a, c
   75A6 38 16         [12] 3125 	jr	C,00165$
                           3126 ;src/main.c:537: moverEnemigoAbajo(enemy);
   75A8 DD 6E F4      [19] 3127 	ld	l,-12 (ix)
   75AB DD 66 F5      [19] 3128 	ld	h,-11 (ix)
   75AE E5            [11] 3129 	push	hl
   75AF CD 39 6A      [17] 3130 	call	_moverEnemigoAbajo
   75B2 F1            [10] 3131 	pop	af
                           3132 ;src/main.c:538: enemy->mover = SI;
   75B3 DD 6E F8      [19] 3133 	ld	l,-8 (ix)
   75B6 DD 66 F9      [19] 3134 	ld	h,-7 (ix)
   75B9 36 01         [10] 3135 	ld	(hl),#0x01
   75BB C3 59 76      [10] 3136 	jp	00178$
   75BE                    3137 00165$:
                           3138 ;src/main.c:540: moverEnemigoArriba(enemy);
   75BE DD 6E F4      [19] 3139 	ld	l,-12 (ix)
   75C1 DD 66 F5      [19] 3140 	ld	h,-11 (ix)
   75C4 E5            [11] 3141 	push	hl
   75C5 CD 1A 6A      [17] 3142 	call	_moverEnemigoArriba
   75C8 F1            [10] 3143 	pop	af
                           3144 ;src/main.c:541: enemy->mover = SI;
   75C9 DD 6E F8      [19] 3145 	ld	l,-8 (ix)
   75CC DD 66 F9      [19] 3146 	ld	h,-7 (ix)
   75CF 36 01         [10] 3147 	ld	(hl),#0x01
   75D1 C3 59 76      [10] 3148 	jp	00178$
   75D4                    3149 00175$:
                           3150 ;src/main.c:544: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75D4 43            [ 4] 3151 	ld	b,e
   75D5 05            [ 4] 3152 	dec	b
   75D6 05            [ 4] 3153 	dec	b
   75D7 C5            [11] 3154 	push	bc
   75D8 2A C4 63      [16] 3155 	ld	hl,(_mapa)
   75DB E5            [11] 3156 	push	hl
   75DC CD 61 4B      [17] 3157 	call	_getTilePtr
   75DF F1            [10] 3158 	pop	af
   75E0 F1            [10] 3159 	pop	af
   75E1 4E            [ 7] 3160 	ld	c,(hl)
   75E2 3E 02         [ 7] 3161 	ld	a,#0x02
   75E4 91            [ 4] 3162 	sub	a, c
   75E5 38 5F         [12] 3163 	jr	C,00170$
                           3164 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75E7 DD 6E F6      [19] 3165 	ld	l,-10 (ix)
   75EA DD 66 F7      [19] 3166 	ld	h,-9 (ix)
   75ED 56            [ 7] 3167 	ld	d,(hl)
   75EE 15            [ 4] 3168 	dec	d
   75EF 15            [ 4] 3169 	dec	d
   75F0 DD 6E F4      [19] 3170 	ld	l,-12 (ix)
   75F3 DD 66 F5      [19] 3171 	ld	h,-11 (ix)
   75F6 46            [ 7] 3172 	ld	b,(hl)
   75F7 04            [ 4] 3173 	inc	b
   75F8 04            [ 4] 3174 	inc	b
   75F9 D5            [11] 3175 	push	de
   75FA 33            [ 6] 3176 	inc	sp
   75FB C5            [11] 3177 	push	bc
   75FC 33            [ 6] 3178 	inc	sp
   75FD 2A C4 63      [16] 3179 	ld	hl,(_mapa)
   7600 E5            [11] 3180 	push	hl
   7601 CD 61 4B      [17] 3181 	call	_getTilePtr
   7604 F1            [10] 3182 	pop	af
   7605 F1            [10] 3183 	pop	af
   7606 4E            [ 7] 3184 	ld	c,(hl)
   7607 3E 02         [ 7] 3185 	ld	a,#0x02
   7609 91            [ 4] 3186 	sub	a, c
   760A 38 3A         [12] 3187 	jr	C,00170$
                           3188 ;src/main.c:546: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   760C DD 6E F6      [19] 3189 	ld	l,-10 (ix)
   760F DD 66 F7      [19] 3190 	ld	h,-9 (ix)
   7612 46            [ 7] 3191 	ld	b,(hl)
   7613 05            [ 4] 3192 	dec	b
   7614 05            [ 4] 3193 	dec	b
   7615 DD 6E F4      [19] 3194 	ld	l,-12 (ix)
   7618 DD 66 F5      [19] 3195 	ld	h,-11 (ix)
   761B 7E            [ 7] 3196 	ld	a,(hl)
   761C C6 04         [ 7] 3197 	add	a, #0x04
   761E C5            [11] 3198 	push	bc
   761F 33            [ 6] 3199 	inc	sp
   7620 F5            [11] 3200 	push	af
   7621 33            [ 6] 3201 	inc	sp
   7622 2A C4 63      [16] 3202 	ld	hl,(_mapa)
   7625 E5            [11] 3203 	push	hl
   7626 CD 61 4B      [17] 3204 	call	_getTilePtr
   7629 F1            [10] 3205 	pop	af
   762A F1            [10] 3206 	pop	af
   762B 4E            [ 7] 3207 	ld	c,(hl)
   762C 3E 02         [ 7] 3208 	ld	a,#0x02
   762E 91            [ 4] 3209 	sub	a, c
   762F 38 15         [12] 3210 	jr	C,00170$
                           3211 ;src/main.c:547: moverEnemigoArriba(enemy);
   7631 DD 6E F4      [19] 3212 	ld	l,-12 (ix)
   7634 DD 66 F5      [19] 3213 	ld	h,-11 (ix)
   7637 E5            [11] 3214 	push	hl
   7638 CD 1A 6A      [17] 3215 	call	_moverEnemigoArriba
   763B F1            [10] 3216 	pop	af
                           3217 ;src/main.c:548: enemy->mover = SI;
   763C DD 6E F8      [19] 3218 	ld	l,-8 (ix)
   763F DD 66 F9      [19] 3219 	ld	h,-7 (ix)
   7642 36 01         [10] 3220 	ld	(hl),#0x01
   7644 18 13         [12] 3221 	jr	00178$
   7646                    3222 00170$:
                           3223 ;src/main.c:550: moverEnemigoAbajo(enemy);
   7646 DD 6E F4      [19] 3224 	ld	l,-12 (ix)
   7649 DD 66 F5      [19] 3225 	ld	h,-11 (ix)
   764C E5            [11] 3226 	push	hl
   764D CD 39 6A      [17] 3227 	call	_moverEnemigoAbajo
   7650 F1            [10] 3228 	pop	af
                           3229 ;src/main.c:551: enemy->mover = SI;
   7651 DD 6E F8      [19] 3230 	ld	l,-8 (ix)
   7654 DD 66 F9      [19] 3231 	ld	h,-7 (ix)
   7657 36 01         [10] 3232 	ld	(hl),#0x01
   7659                    3233 00178$:
                           3234 ;src/main.c:556: if (!movY) {
   7659 DD 7E F2      [19] 3235 	ld	a,-14 (ix)
   765C B7            [ 4] 3236 	or	a, a
   765D C2 84 77      [10] 3237 	jp	NZ,00208$
                           3238 ;src/main.c:557: if (enemy->x < ANCHO_PANTALLA/2) {
   7660 DD 6E F4      [19] 3239 	ld	l,-12 (ix)
   7663 DD 66 F5      [19] 3240 	ld	h,-11 (ix)
   7666 4E            [ 7] 3241 	ld	c,(hl)
                           3242 ;src/main.c:428: u8 dify = abs(enemy->y - prota.y);
   7667 DD 6E F6      [19] 3243 	ld	l,-10 (ix)
   766A DD 66 F7      [19] 3244 	ld	h,-9 (ix)
   766D 56            [ 7] 3245 	ld	d,(hl)
                           3246 ;src/main.c:557: if (enemy->x < ANCHO_PANTALLA/2) {
   766E 79            [ 4] 3247 	ld	a,c
   766F D6 28         [ 7] 3248 	sub	a, #0x28
   7671 D2 FA 76      [10] 3249 	jp	NC,00190$
                           3250 ;src/main.c:558: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7674 D5            [11] 3251 	push	de
   7675 33            [ 6] 3252 	inc	sp
   7676 79            [ 4] 3253 	ld	a,c
   7677 F5            [11] 3254 	push	af
   7678 33            [ 6] 3255 	inc	sp
   7679 2A C4 63      [16] 3256 	ld	hl,(_mapa)
   767C E5            [11] 3257 	push	hl
   767D CD 61 4B      [17] 3258 	call	_getTilePtr
   7680 F1            [10] 3259 	pop	af
   7681 F1            [10] 3260 	pop	af
   7682 4E            [ 7] 3261 	ld	c,(hl)
   7683 3E 02         [ 7] 3262 	ld	a,#0x02
   7685 91            [ 4] 3263 	sub	a, c
   7686 38 5C         [12] 3264 	jr	C,00180$
                           3265 ;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7688 DD 6E F6      [19] 3266 	ld	l,-10 (ix)
   768B DD 66 F7      [19] 3267 	ld	h,-9 (ix)
   768E 7E            [ 7] 3268 	ld	a,(hl)
   768F C6 0B         [ 7] 3269 	add	a, #0x0B
   7691 DD 6E F4      [19] 3270 	ld	l,-12 (ix)
   7694 DD 66 F5      [19] 3271 	ld	h,-11 (ix)
   7697 46            [ 7] 3272 	ld	b,(hl)
   7698 F5            [11] 3273 	push	af
   7699 33            [ 6] 3274 	inc	sp
   769A C5            [11] 3275 	push	bc
   769B 33            [ 6] 3276 	inc	sp
   769C 2A C4 63      [16] 3277 	ld	hl,(_mapa)
   769F E5            [11] 3278 	push	hl
   76A0 CD 61 4B      [17] 3279 	call	_getTilePtr
   76A3 F1            [10] 3280 	pop	af
   76A4 F1            [10] 3281 	pop	af
   76A5 4E            [ 7] 3282 	ld	c,(hl)
   76A6 3E 02         [ 7] 3283 	ld	a,#0x02
   76A8 91            [ 4] 3284 	sub	a, c
   76A9 38 39         [12] 3285 	jr	C,00180$
                           3286 ;src/main.c:560: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   76AB DD 6E F6      [19] 3287 	ld	l,-10 (ix)
   76AE DD 66 F7      [19] 3288 	ld	h,-9 (ix)
   76B1 7E            [ 7] 3289 	ld	a,(hl)
   76B2 C6 16         [ 7] 3290 	add	a, #0x16
   76B4 DD 6E F4      [19] 3291 	ld	l,-12 (ix)
   76B7 DD 66 F5      [19] 3292 	ld	h,-11 (ix)
   76BA 46            [ 7] 3293 	ld	b,(hl)
   76BB F5            [11] 3294 	push	af
   76BC 33            [ 6] 3295 	inc	sp
   76BD C5            [11] 3296 	push	bc
   76BE 33            [ 6] 3297 	inc	sp
   76BF 2A C4 63      [16] 3298 	ld	hl,(_mapa)
   76C2 E5            [11] 3299 	push	hl
   76C3 CD 61 4B      [17] 3300 	call	_getTilePtr
   76C6 F1            [10] 3301 	pop	af
   76C7 F1            [10] 3302 	pop	af
   76C8 4E            [ 7] 3303 	ld	c,(hl)
   76C9 3E 02         [ 7] 3304 	ld	a,#0x02
   76CB 91            [ 4] 3305 	sub	a, c
   76CC 38 16         [12] 3306 	jr	C,00180$
                           3307 ;src/main.c:561: moverEnemigoIzquierda(enemy);
   76CE DD 6E F4      [19] 3308 	ld	l,-12 (ix)
   76D1 DD 66 F5      [19] 3309 	ld	h,-11 (ix)
   76D4 E5            [11] 3310 	push	hl
   76D5 CD 68 6A      [17] 3311 	call	_moverEnemigoIzquierda
   76D8 F1            [10] 3312 	pop	af
                           3313 ;src/main.c:562: enemy->mover = SI;
   76D9 DD 6E F8      [19] 3314 	ld	l,-8 (ix)
   76DC DD 66 F9      [19] 3315 	ld	h,-7 (ix)
   76DF 36 01         [10] 3316 	ld	(hl),#0x01
   76E1 C3 84 77      [10] 3317 	jp	00208$
   76E4                    3318 00180$:
                           3319 ;src/main.c:564: moverEnemigoDerecha(enemy);
   76E4 DD 6E F4      [19] 3320 	ld	l,-12 (ix)
   76E7 DD 66 F5      [19] 3321 	ld	h,-11 (ix)
   76EA E5            [11] 3322 	push	hl
   76EB CD 58 6A      [17] 3323 	call	_moverEnemigoDerecha
   76EE F1            [10] 3324 	pop	af
                           3325 ;src/main.c:565: enemy->mover = SI;
   76EF DD 6E F8      [19] 3326 	ld	l,-8 (ix)
   76F2 DD 66 F9      [19] 3327 	ld	h,-7 (ix)
   76F5 36 01         [10] 3328 	ld	(hl),#0x01
   76F7 C3 84 77      [10] 3329 	jp	00208$
   76FA                    3330 00190$:
                           3331 ;src/main.c:568: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   76FA 79            [ 4] 3332 	ld	a,c
   76FB C6 04         [ 7] 3333 	add	a, #0x04
   76FD D5            [11] 3334 	push	de
   76FE 33            [ 6] 3335 	inc	sp
   76FF F5            [11] 3336 	push	af
   7700 33            [ 6] 3337 	inc	sp
   7701 2A C4 63      [16] 3338 	ld	hl,(_mapa)
   7704 E5            [11] 3339 	push	hl
   7705 CD 61 4B      [17] 3340 	call	_getTilePtr
   7708 F1            [10] 3341 	pop	af
   7709 F1            [10] 3342 	pop	af
   770A 4E            [ 7] 3343 	ld	c,(hl)
   770B 3E 02         [ 7] 3344 	ld	a,#0x02
   770D 91            [ 4] 3345 	sub	a, c
   770E 38 61         [12] 3346 	jr	C,00185$
                           3347 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7710 DD 6E F6      [19] 3348 	ld	l,-10 (ix)
   7713 DD 66 F7      [19] 3349 	ld	h,-9 (ix)
   7716 7E            [ 7] 3350 	ld	a,(hl)
   7717 C6 0B         [ 7] 3351 	add	a, #0x0B
   7719 47            [ 4] 3352 	ld	b,a
   771A DD 6E F4      [19] 3353 	ld	l,-12 (ix)
   771D DD 66 F5      [19] 3354 	ld	h,-11 (ix)
   7720 7E            [ 7] 3355 	ld	a,(hl)
   7721 C6 04         [ 7] 3356 	add	a, #0x04
   7723 C5            [11] 3357 	push	bc
   7724 33            [ 6] 3358 	inc	sp
   7725 F5            [11] 3359 	push	af
   7726 33            [ 6] 3360 	inc	sp
   7727 2A C4 63      [16] 3361 	ld	hl,(_mapa)
   772A E5            [11] 3362 	push	hl
   772B CD 61 4B      [17] 3363 	call	_getTilePtr
   772E F1            [10] 3364 	pop	af
   772F F1            [10] 3365 	pop	af
   7730 4E            [ 7] 3366 	ld	c,(hl)
   7731 3E 02         [ 7] 3367 	ld	a,#0x02
   7733 91            [ 4] 3368 	sub	a, c
   7734 38 3B         [12] 3369 	jr	C,00185$
                           3370 ;src/main.c:570: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7736 DD 6E F6      [19] 3371 	ld	l,-10 (ix)
   7739 DD 66 F7      [19] 3372 	ld	h,-9 (ix)
   773C 7E            [ 7] 3373 	ld	a,(hl)
   773D C6 16         [ 7] 3374 	add	a, #0x16
   773F 47            [ 4] 3375 	ld	b,a
   7740 DD 6E F4      [19] 3376 	ld	l,-12 (ix)
   7743 DD 66 F5      [19] 3377 	ld	h,-11 (ix)
   7746 7E            [ 7] 3378 	ld	a,(hl)
   7747 C6 04         [ 7] 3379 	add	a, #0x04
   7749 C5            [11] 3380 	push	bc
   774A 33            [ 6] 3381 	inc	sp
   774B F5            [11] 3382 	push	af
   774C 33            [ 6] 3383 	inc	sp
   774D 2A C4 63      [16] 3384 	ld	hl,(_mapa)
   7750 E5            [11] 3385 	push	hl
   7751 CD 61 4B      [17] 3386 	call	_getTilePtr
   7754 F1            [10] 3387 	pop	af
   7755 F1            [10] 3388 	pop	af
   7756 4E            [ 7] 3389 	ld	c,(hl)
   7757 3E 02         [ 7] 3390 	ld	a,#0x02
   7759 91            [ 4] 3391 	sub	a, c
   775A 38 15         [12] 3392 	jr	C,00185$
                           3393 ;src/main.c:571: moverEnemigoDerecha(enemy);
   775C DD 6E F4      [19] 3394 	ld	l,-12 (ix)
   775F DD 66 F5      [19] 3395 	ld	h,-11 (ix)
   7762 E5            [11] 3396 	push	hl
   7763 CD 58 6A      [17] 3397 	call	_moverEnemigoDerecha
   7766 F1            [10] 3398 	pop	af
                           3399 ;src/main.c:572: enemy->mover = SI;
   7767 DD 6E F8      [19] 3400 	ld	l,-8 (ix)
   776A DD 66 F9      [19] 3401 	ld	h,-7 (ix)
   776D 36 01         [10] 3402 	ld	(hl),#0x01
   776F 18 13         [12] 3403 	jr	00208$
   7771                    3404 00185$:
                           3405 ;src/main.c:575: moverEnemigoIzquierda(enemy);
   7771 DD 6E F4      [19] 3406 	ld	l,-12 (ix)
   7774 DD 66 F5      [19] 3407 	ld	h,-11 (ix)
   7777 E5            [11] 3408 	push	hl
   7778 CD 68 6A      [17] 3409 	call	_moverEnemigoIzquierda
   777B F1            [10] 3410 	pop	af
                           3411 ;src/main.c:576: enemy->mover = SI;
   777C DD 6E F8      [19] 3412 	ld	l,-8 (ix)
   777F DD 66 F9      [19] 3413 	ld	h,-7 (ix)
   7782 36 01         [10] 3414 	ld	(hl),#0x01
   7784                    3415 00208$:
   7784 DD F9         [10] 3416 	ld	sp, ix
   7786 DD E1         [14] 3417 	pop	ix
   7788 C9            [10] 3418 	ret
                           3419 ;src/main.c:586: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3420 ;	---------------------------------
                           3421 ; Function updateEnemy
                           3422 ; ---------------------------------
   7789                    3423 _updateEnemy::
   7789 DD E5         [15] 3424 	push	ix
   778B DD 21 00 00   [14] 3425 	ld	ix,#0
   778F DD 39         [15] 3426 	add	ix,sp
   7791 21 F4 FF      [10] 3427 	ld	hl,#-12
   7794 39            [11] 3428 	add	hl,sp
   7795 F9            [ 6] 3429 	ld	sp,hl
                           3430 ;src/main.c:593: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7796 DD 4E 04      [19] 3431 	ld	c,4 (ix)
   7799 DD 46 05      [19] 3432 	ld	b,5 (ix)
   779C 21 15 00      [10] 3433 	ld	hl,#0x0015
   779F 09            [11] 3434 	add	hl,bc
   77A0 DD 75 FD      [19] 3435 	ld	-3 (ix),l
   77A3 DD 74 FE      [19] 3436 	ld	-2 (ix),h
   77A6 DD 6E FD      [19] 3437 	ld	l,-3 (ix)
   77A9 DD 66 FE      [19] 3438 	ld	h,-2 (ix)
   77AC 7E            [ 7] 3439 	ld	a,(hl)
   77AD B7            [ 4] 3440 	or	a, a
   77AE 28 19         [12] 3441 	jr	Z,00115$
                           3442 ;src/main.c:594: enemy->patrolling = 0;
   77B0 21 60 5F      [10] 3443 	ld	hl,#(_enemy + 0x000a)
   77B3 36 00         [10] 3444 	ld	(hl),#0x00
                           3445 ;src/main.c:595: engage(actual, prota.x, prota.y);
   77B5 3A E3 62      [13] 3446 	ld	a, (#_prota + 1)
   77B8 21 E2 62      [10] 3447 	ld	hl, #_prota + 0
   77BB 56            [ 7] 3448 	ld	d,(hl)
   77BC F5            [11] 3449 	push	af
   77BD 33            [ 6] 3450 	inc	sp
   77BE D5            [11] 3451 	push	de
   77BF 33            [ 6] 3452 	inc	sp
   77C0 C5            [11] 3453 	push	bc
   77C1 CD 7F 6F      [17] 3454 	call	_engage
   77C4 F1            [10] 3455 	pop	af
   77C5 F1            [10] 3456 	pop	af
   77C6 C3 E4 78      [10] 3457 	jp	00117$
   77C9                    3458 00115$:
                           3459 ;src/main.c:597: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   77C9 C5            [11] 3460 	push	bc
   77CA C5            [11] 3461 	push	bc
   77CB CD C7 6C      [17] 3462 	call	_lookFor
   77CE F1            [10] 3463 	pop	af
   77CF C1            [10] 3464 	pop	bc
                           3465 ;src/main.c:603: actual->patrolling = 0;
   77D0 21 0A 00      [10] 3466 	ld	hl,#0x000A
   77D3 09            [11] 3467 	add	hl,bc
   77D4 DD 75 FB      [19] 3468 	ld	-5 (ix),l
   77D7 DD 74 FC      [19] 3469 	ld	-4 (ix),h
                           3470 ;src/main.c:598: if (actual->patrolling) {
   77DA DD 6E FB      [19] 3471 	ld	l,-5 (ix)
   77DD DD 66 FC      [19] 3472 	ld	h,-4 (ix)
   77E0 6E            [ 7] 3473 	ld	l,(hl)
                           3474 ;src/main.c:601: if (actual->in_range) {
   77E1 79            [ 4] 3475 	ld	a,c
   77E2 C6 10         [ 7] 3476 	add	a, #0x10
   77E4 5F            [ 4] 3477 	ld	e,a
   77E5 78            [ 4] 3478 	ld	a,b
   77E6 CE 00         [ 7] 3479 	adc	a, #0x00
   77E8 57            [ 4] 3480 	ld	d,a
                           3481 ;src/main.c:609: actual->seek = 1;
   77E9 79            [ 4] 3482 	ld	a,c
   77EA C6 13         [ 7] 3483 	add	a, #0x13
   77EC DD 77 F9      [19] 3484 	ld	-7 (ix),a
   77EF 78            [ 4] 3485 	ld	a,b
   77F0 CE 00         [ 7] 3486 	adc	a, #0x00
   77F2 DD 77 FA      [19] 3487 	ld	-6 (ix),a
                           3488 ;src/main.c:598: if (actual->patrolling) {
   77F5 7D            [ 4] 3489 	ld	a,l
   77F6 B7            [ 4] 3490 	or	a, a
   77F7 CA AC 78      [10] 3491 	jp	Z,00112$
                           3492 ;src/main.c:600: moverEnemigoPatrol(actual);
   77FA C5            [11] 3493 	push	bc
   77FB D5            [11] 3494 	push	de
   77FC C5            [11] 3495 	push	bc
   77FD CD 7A 6A      [17] 3496 	call	_moverEnemigoPatrol
   7800 F1            [10] 3497 	pop	af
   7801 D1            [10] 3498 	pop	de
   7802 C1            [10] 3499 	pop	bc
                           3500 ;src/main.c:601: if (actual->in_range) {
   7803 1A            [ 7] 3501 	ld	a,(de)
   7804 B7            [ 4] 3502 	or	a, a
   7805 28 24         [12] 3503 	jr	Z,00104$
                           3504 ;src/main.c:602: engage(actual, prota.x, prota.y);
   7807 3A E3 62      [13] 3505 	ld	a, (#_prota + 1)
   780A 21 E2 62      [10] 3506 	ld	hl, #_prota + 0
   780D 56            [ 7] 3507 	ld	d,(hl)
   780E F5            [11] 3508 	push	af
   780F 33            [ 6] 3509 	inc	sp
   7810 D5            [11] 3510 	push	de
   7811 33            [ 6] 3511 	inc	sp
   7812 C5            [11] 3512 	push	bc
   7813 CD 7F 6F      [17] 3513 	call	_engage
   7816 F1            [10] 3514 	pop	af
   7817 F1            [10] 3515 	pop	af
                           3516 ;src/main.c:603: actual->patrolling = 0;
   7818 DD 6E FB      [19] 3517 	ld	l,-5 (ix)
   781B DD 66 FC      [19] 3518 	ld	h,-4 (ix)
   781E 36 00         [10] 3519 	ld	(hl),#0x00
                           3520 ;src/main.c:604: actual->engage = 1;
   7820 DD 6E FD      [19] 3521 	ld	l,-3 (ix)
   7823 DD 66 FE      [19] 3522 	ld	h,-2 (ix)
   7826 36 01         [10] 3523 	ld	(hl),#0x01
   7828 C3 E4 78      [10] 3524 	jp	00117$
   782B                    3525 00104$:
                           3526 ;src/main.c:605: } else if (actual->seen) {
   782B 21 11 00      [10] 3527 	ld	hl,#0x0011
   782E 09            [11] 3528 	add	hl,bc
   782F DD 75 F7      [19] 3529 	ld	-9 (ix),l
   7832 DD 74 F8      [19] 3530 	ld	-8 (ix),h
   7835 DD 6E F7      [19] 3531 	ld	l,-9 (ix)
   7838 DD 66 F8      [19] 3532 	ld	h,-8 (ix)
   783B 7E            [ 7] 3533 	ld	a,(hl)
   783C B7            [ 4] 3534 	or	a, a
   783D CA E4 78      [10] 3535 	jp	Z,00117$
                           3536 ;src/main.c:606: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   7840 3A E3 62      [13] 3537 	ld	a,(#_prota + 1)
   7843 DD 77 F6      [19] 3538 	ld	-10 (ix),a
   7846 21 E2 62      [10] 3539 	ld	hl, #_prota + 0
   7849 5E            [ 7] 3540 	ld	e,(hl)
   784A 21 01 00      [10] 3541 	ld	hl,#0x0001
   784D 09            [11] 3542 	add	hl,bc
   784E E3            [19] 3543 	ex	(sp), hl
   784F E1            [10] 3544 	pop	hl
   7850 E5            [11] 3545 	push	hl
   7851 56            [ 7] 3546 	ld	d,(hl)
   7852 0A            [ 7] 3547 	ld	a,(bc)
   7853 DD 77 FF      [19] 3548 	ld	-1 (ix),a
   7856 C5            [11] 3549 	push	bc
   7857 2A C4 63      [16] 3550 	ld	hl,(_mapa)
   785A E5            [11] 3551 	push	hl
   785B C5            [11] 3552 	push	bc
   785C DD 7E F6      [19] 3553 	ld	a,-10 (ix)
   785F F5            [11] 3554 	push	af
   7860 33            [ 6] 3555 	inc	sp
   7861 7B            [ 4] 3556 	ld	a,e
   7862 F5            [11] 3557 	push	af
   7863 33            [ 6] 3558 	inc	sp
   7864 D5            [11] 3559 	push	de
   7865 33            [ 6] 3560 	inc	sp
   7866 DD 7E FF      [19] 3561 	ld	a,-1 (ix)
   7869 F5            [11] 3562 	push	af
   786A 33            [ 6] 3563 	inc	sp
   786B CD 30 44      [17] 3564 	call	_pathFinding
   786E 21 08 00      [10] 3565 	ld	hl,#8
   7871 39            [11] 3566 	add	hl,sp
   7872 F9            [ 6] 3567 	ld	sp,hl
   7873 C1            [10] 3568 	pop	bc
                           3569 ;src/main.c:607: actual->p_seek_x = actual->x;
   7874 21 17 00      [10] 3570 	ld	hl,#0x0017
   7877 09            [11] 3571 	add	hl,bc
   7878 EB            [ 4] 3572 	ex	de,hl
   7879 0A            [ 7] 3573 	ld	a,(bc)
   787A 12            [ 7] 3574 	ld	(de),a
                           3575 ;src/main.c:608: actual->p_seek_y = actual->y;
   787B 21 18 00      [10] 3576 	ld	hl,#0x0018
   787E 09            [11] 3577 	add	hl,bc
   787F EB            [ 4] 3578 	ex	de,hl
   7880 E1            [10] 3579 	pop	hl
   7881 E5            [11] 3580 	push	hl
   7882 7E            [ 7] 3581 	ld	a,(hl)
   7883 12            [ 7] 3582 	ld	(de),a
                           3583 ;src/main.c:609: actual->seek = 1;
   7884 DD 6E F9      [19] 3584 	ld	l,-7 (ix)
   7887 DD 66 FA      [19] 3585 	ld	h,-6 (ix)
   788A 36 01         [10] 3586 	ld	(hl),#0x01
                           3587 ;src/main.c:610: actual->iter=0;
   788C 21 0D 00      [10] 3588 	ld	hl,#0x000D
   788F 09            [11] 3589 	add	hl,bc
   7890 AF            [ 4] 3590 	xor	a, a
   7891 77            [ 7] 3591 	ld	(hl), a
   7892 23            [ 6] 3592 	inc	hl
   7893 77            [ 7] 3593 	ld	(hl), a
                           3594 ;src/main.c:611: actual->reversePatrol = NO;
   7894 21 0B 00      [10] 3595 	ld	hl,#0x000B
   7897 09            [11] 3596 	add	hl,bc
   7898 36 00         [10] 3597 	ld	(hl),#0x00
                           3598 ;src/main.c:612: actual->patrolling = 0;
   789A DD 6E FB      [19] 3599 	ld	l,-5 (ix)
   789D DD 66 FC      [19] 3600 	ld	h,-4 (ix)
   78A0 36 00         [10] 3601 	ld	(hl),#0x00
                           3602 ;src/main.c:613: actual->seen = 0;
   78A2 DD 6E F7      [19] 3603 	ld	l,-9 (ix)
   78A5 DD 66 F8      [19] 3604 	ld	h,-8 (ix)
   78A8 36 00         [10] 3605 	ld	(hl),#0x00
   78AA 18 38         [12] 3606 	jr	00117$
   78AC                    3607 00112$:
                           3608 ;src/main.c:615: } else if (actual->seek) {
   78AC DD 6E F9      [19] 3609 	ld	l,-7 (ix)
   78AF DD 66 FA      [19] 3610 	ld	h,-6 (ix)
   78B2 7E            [ 7] 3611 	ld	a,(hl)
   78B3 B7            [ 4] 3612 	or	a, a
   78B4 28 2E         [12] 3613 	jr	Z,00117$
                           3614 ;src/main.c:616: moverEnemigoSeek(actual);
   78B6 C5            [11] 3615 	push	bc
   78B7 D5            [11] 3616 	push	de
   78B8 C5            [11] 3617 	push	bc
   78B9 CD CD 6D      [17] 3618 	call	_moverEnemigoSeek
   78BC F1            [10] 3619 	pop	af
   78BD D1            [10] 3620 	pop	de
   78BE C1            [10] 3621 	pop	bc
                           3622 ;src/main.c:617: if (actual->in_range) {
   78BF 1A            [ 7] 3623 	ld	a,(de)
   78C0 B7            [ 4] 3624 	or	a, a
   78C1 28 21         [12] 3625 	jr	Z,00117$
                           3626 ;src/main.c:618: engage(actual, prota.x, prota.y);
   78C3 3A E3 62      [13] 3627 	ld	a, (#_prota + 1)
   78C6 21 E2 62      [10] 3628 	ld	hl, #_prota + 0
   78C9 56            [ 7] 3629 	ld	d,(hl)
   78CA F5            [11] 3630 	push	af
   78CB 33            [ 6] 3631 	inc	sp
   78CC D5            [11] 3632 	push	de
   78CD 33            [ 6] 3633 	inc	sp
   78CE C5            [11] 3634 	push	bc
   78CF CD 7F 6F      [17] 3635 	call	_engage
   78D2 F1            [10] 3636 	pop	af
   78D3 F1            [10] 3637 	pop	af
                           3638 ;src/main.c:619: actual->seek = 0;
   78D4 DD 6E F9      [19] 3639 	ld	l,-7 (ix)
   78D7 DD 66 FA      [19] 3640 	ld	h,-6 (ix)
   78DA 36 00         [10] 3641 	ld	(hl),#0x00
                           3642 ;src/main.c:620: actual->engage = 1;
   78DC DD 6E FD      [19] 3643 	ld	l,-3 (ix)
   78DF DD 66 FE      [19] 3644 	ld	h,-2 (ix)
   78E2 36 01         [10] 3645 	ld	(hl),#0x01
                           3646 ;src/main.c:621: } else if (actual->seen) {
   78E4                    3647 00117$:
   78E4 DD F9         [10] 3648 	ld	sp, ix
   78E6 DD E1         [14] 3649 	pop	ix
   78E8 C9            [10] 3650 	ret
                           3651 ;src/main.c:628: void inicializarEnemy() {
                           3652 ;	---------------------------------
                           3653 ; Function inicializarEnemy
                           3654 ; ---------------------------------
   78E9                    3655 _inicializarEnemy::
   78E9 DD E5         [15] 3656 	push	ix
   78EB DD 21 00 00   [14] 3657 	ld	ix,#0
   78EF DD 39         [15] 3658 	add	ix,sp
   78F1 21 F9 FF      [10] 3659 	ld	hl,#-7
   78F4 39            [11] 3660 	add	hl,sp
   78F5 F9            [ 6] 3661 	ld	sp,hl
                           3662 ;src/main.c:629: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   78F6 3A C6 63      [13] 3663 	ld	a,(#_num_mapa + 0)
   78F9 C6 02         [ 7] 3664 	add	a, #0x02
   78FB DD 77 FF      [19] 3665 	ld	-1 (ix),a
                           3666 ;src/main.c:639: actual = enemy;
   78FE 11 56 5F      [10] 3667 	ld	de,#_enemy+0
                           3668 ;src/main.c:640: while(i){
   7901                    3669 00101$:
   7901 DD 7E FF      [19] 3670 	ld	a,-1 (ix)
   7904 B7            [ 4] 3671 	or	a, a
   7905 CA 09 7A      [10] 3672 	jp	Z,00104$
                           3673 ;src/main.c:641: --i;
   7908 DD 35 FF      [23] 3674 	dec	-1 (ix)
                           3675 ;src/main.c:642: actual->x = actual->px = spawnX[i];
   790B 4B            [ 4] 3676 	ld	c, e
   790C 42            [ 4] 3677 	ld	b, d
   790D 03            [ 6] 3678 	inc	bc
   790E 03            [ 6] 3679 	inc	bc
   790F 3E EA         [ 7] 3680 	ld	a,#<(_spawnX)
   7911 DD 86 FF      [19] 3681 	add	a, -1 (ix)
   7914 DD 77 FA      [19] 3682 	ld	-6 (ix),a
   7917 3E 63         [ 7] 3683 	ld	a,#>(_spawnX)
   7919 CE 00         [ 7] 3684 	adc	a, #0x00
   791B DD 77 FB      [19] 3685 	ld	-5 (ix),a
   791E DD 6E FA      [19] 3686 	ld	l,-6 (ix)
   7921 DD 66 FB      [19] 3687 	ld	h,-5 (ix)
   7924 7E            [ 7] 3688 	ld	a,(hl)
   7925 02            [ 7] 3689 	ld	(bc),a
   7926 12            [ 7] 3690 	ld	(de),a
                           3691 ;src/main.c:643: actual->y = actual->py = spawnY[i];
   7927 D5            [11] 3692 	push	de
   7928 FD E1         [14] 3693 	pop	iy
   792A FD 23         [10] 3694 	inc	iy
   792C 4B            [ 4] 3695 	ld	c, e
   792D 42            [ 4] 3696 	ld	b, d
   792E 03            [ 6] 3697 	inc	bc
   792F 03            [ 6] 3698 	inc	bc
   7930 03            [ 6] 3699 	inc	bc
   7931 3E EE         [ 7] 3700 	ld	a,#<(_spawnY)
   7933 DD 86 FF      [19] 3701 	add	a, -1 (ix)
   7936 DD 77 FD      [19] 3702 	ld	-3 (ix),a
   7939 3E 63         [ 7] 3703 	ld	a,#>(_spawnY)
   793B CE 00         [ 7] 3704 	adc	a, #0x00
   793D DD 77 FE      [19] 3705 	ld	-2 (ix),a
   7940 DD 6E FD      [19] 3706 	ld	l,-3 (ix)
   7943 DD 66 FE      [19] 3707 	ld	h,-2 (ix)
   7946 7E            [ 7] 3708 	ld	a,(hl)
   7947 02            [ 7] 3709 	ld	(bc),a
   7948 FD 77 00      [19] 3710 	ld	0 (iy), a
                           3711 ;src/main.c:644: actual->mover  = NO;
   794B 21 06 00      [10] 3712 	ld	hl,#0x0006
   794E 19            [11] 3713 	add	hl,de
   794F 36 00         [10] 3714 	ld	(hl),#0x00
                           3715 ;src/main.c:645: actual->mira   = M_abajo;
   7951 21 07 00      [10] 3716 	ld	hl,#0x0007
   7954 19            [11] 3717 	add	hl,de
   7955 36 03         [10] 3718 	ld	(hl),#0x03
                           3719 ;src/main.c:646: actual->sprite = g_enemy;
   7957 21 04 00      [10] 3720 	ld	hl,#0x0004
   795A 19            [11] 3721 	add	hl,de
   795B 36 3A         [10] 3722 	ld	(hl),#<(_g_enemy)
   795D 23            [ 6] 3723 	inc	hl
   795E 36 3C         [10] 3724 	ld	(hl),#>(_g_enemy)
                           3725 ;src/main.c:647: actual->muerto = NO;
   7960 21 08 00      [10] 3726 	ld	hl,#0x0008
   7963 19            [11] 3727 	add	hl,de
   7964 36 00         [10] 3728 	ld	(hl),#0x00
                           3729 ;src/main.c:648: actual->muertes = 0;
   7966 21 09 00      [10] 3730 	ld	hl,#0x0009
   7969 19            [11] 3731 	add	hl,de
   796A 36 00         [10] 3732 	ld	(hl),#0x00
                           3733 ;src/main.c:649: actual->patrolling = SI;
   796C 21 0A 00      [10] 3734 	ld	hl,#0x000A
   796F 19            [11] 3735 	add	hl,de
   7970 36 01         [10] 3736 	ld	(hl),#0x01
                           3737 ;src/main.c:650: actual->reversePatrol = NO;
   7972 21 0B 00      [10] 3738 	ld	hl,#0x000B
   7975 19            [11] 3739 	add	hl,de
   7976 36 00         [10] 3740 	ld	(hl),#0x00
                           3741 ;src/main.c:651: actual->didDamage = 0;
   7978 21 16 00      [10] 3742 	ld	hl,#0x0016
   797B 19            [11] 3743 	add	hl,de
   797C 36 00         [10] 3744 	ld	(hl),#0x00
                           3745 ;src/main.c:652: actual->iter = 0;
   797E 21 0D 00      [10] 3746 	ld	hl,#0x000D
   7981 19            [11] 3747 	add	hl,de
   7982 AF            [ 4] 3748 	xor	a, a
   7983 77            [ 7] 3749 	ld	(hl), a
   7984 23            [ 6] 3750 	inc	hl
   7985 77            [ 7] 3751 	ld	(hl), a
                           3752 ;src/main.c:653: actual->lastIter = 0;
   7986 21 0F 00      [10] 3753 	ld	hl,#0x000F
   7989 19            [11] 3754 	add	hl,de
   798A 36 00         [10] 3755 	ld	(hl),#0x00
                           3756 ;src/main.c:654: actual->seen = 0;
   798C 21 11 00      [10] 3757 	ld	hl,#0x0011
   798F 19            [11] 3758 	add	hl,de
   7990 36 00         [10] 3759 	ld	(hl),#0x00
                           3760 ;src/main.c:655: actual->found = 0;
   7992 21 12 00      [10] 3761 	ld	hl,#0x0012
   7995 19            [11] 3762 	add	hl,de
   7996 36 00         [10] 3763 	ld	(hl),#0x00
                           3764 ;src/main.c:656: actual->engage = 0;
   7998 21 15 00      [10] 3765 	ld	hl,#0x0015
   799B 19            [11] 3766 	add	hl,de
   799C 36 00         [10] 3767 	ld	(hl),#0x00
                           3768 ;src/main.c:657: actual->xplot = NO;
   799E 21 19 00      [10] 3769 	ld	hl,#0x0019
   79A1 19            [11] 3770 	add	hl,de
   79A2 36 00         [10] 3771 	ld	(hl),#0x00
                           3772 ;src/main.c:658: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   79A4 21 C6 63      [10] 3773 	ld	hl,#_num_mapa + 0
   79A7 4E            [ 7] 3774 	ld	c, (hl)
   79A8 0C            [ 4] 3775 	inc	c
   79A9 06 00         [ 7] 3776 	ld	b,#0x00
   79AB 69            [ 4] 3777 	ld	l, c
   79AC 60            [ 4] 3778 	ld	h, b
   79AD 29            [11] 3779 	add	hl, hl
   79AE 29            [11] 3780 	add	hl, hl
   79AF 09            [11] 3781 	add	hl, bc
   79B0 4D            [ 4] 3782 	ld	c,l
   79B1 44            [ 4] 3783 	ld	b,h
   79B2 21 06 64      [10] 3784 	ld	hl,#_patrolY
   79B5 09            [11] 3785 	add	hl,bc
   79B6 7D            [ 4] 3786 	ld	a,l
   79B7 DD 86 FF      [19] 3787 	add	a, -1 (ix)
   79BA 6F            [ 4] 3788 	ld	l,a
   79BB 7C            [ 4] 3789 	ld	a,h
   79BC CE 00         [ 7] 3790 	adc	a, #0x00
   79BE 67            [ 4] 3791 	ld	h,a
   79BF 7E            [ 7] 3792 	ld	a,(hl)
   79C0 DD 77 FC      [19] 3793 	ld	-4 (ix),a
   79C3 21 F2 63      [10] 3794 	ld	hl,#_patrolX
   79C6 09            [11] 3795 	add	hl,bc
   79C7 DD 4E FF      [19] 3796 	ld	c,-1 (ix)
   79CA 06 00         [ 7] 3797 	ld	b,#0x00
   79CC 09            [11] 3798 	add	hl,bc
   79CD 7E            [ 7] 3799 	ld	a,(hl)
   79CE DD 77 F9      [19] 3800 	ld	-7 (ix),a
   79D1 DD 6E FD      [19] 3801 	ld	l,-3 (ix)
   79D4 DD 66 FE      [19] 3802 	ld	h,-2 (ix)
   79D7 4E            [ 7] 3803 	ld	c,(hl)
   79D8 DD 6E FA      [19] 3804 	ld	l,-6 (ix)
   79DB DD 66 FB      [19] 3805 	ld	h,-5 (ix)
   79DE 46            [ 7] 3806 	ld	b,(hl)
   79DF D5            [11] 3807 	push	de
   79E0 2A C4 63      [16] 3808 	ld	hl,(_mapa)
   79E3 E5            [11] 3809 	push	hl
   79E4 D5            [11] 3810 	push	de
   79E5 DD 66 FC      [19] 3811 	ld	h,-4 (ix)
   79E8 DD 6E F9      [19] 3812 	ld	l,-7 (ix)
   79EB E5            [11] 3813 	push	hl
   79EC 79            [ 4] 3814 	ld	a,c
   79ED F5            [11] 3815 	push	af
   79EE 33            [ 6] 3816 	inc	sp
   79EF C5            [11] 3817 	push	bc
   79F0 33            [ 6] 3818 	inc	sp
   79F1 CD 30 44      [17] 3819 	call	_pathFinding
   79F4 21 08 00      [10] 3820 	ld	hl,#8
   79F7 39            [11] 3821 	add	hl,sp
   79F8 F9            [ 6] 3822 	ld	sp,hl
   79F9 D1            [10] 3823 	pop	de
                           3824 ;src/main.c:659: dibujarEnemigo(actual);
   79FA D5            [11] 3825 	push	de
   79FB D5            [11] 3826 	push	de
   79FC CD A0 66      [17] 3827 	call	_dibujarEnemigo
   79FF F1            [10] 3828 	pop	af
   7A00 D1            [10] 3829 	pop	de
                           3830 ;src/main.c:660: ++actual;
   7A01 21 E3 00      [10] 3831 	ld	hl,#0x00E3
   7A04 19            [11] 3832 	add	hl,de
   7A05 EB            [ 4] 3833 	ex	de,hl
   7A06 C3 01 79      [10] 3834 	jp	00101$
   7A09                    3835 00104$:
   7A09 DD F9         [10] 3836 	ld	sp, ix
   7A0B DD E1         [14] 3837 	pop	ix
   7A0D C9            [10] 3838 	ret
                           3839 ;src/main.c:664: void moverIzquierda() {
                           3840 ;	---------------------------------
                           3841 ; Function moverIzquierda
                           3842 ; ---------------------------------
   7A0E                    3843 _moverIzquierda::
                           3844 ;src/main.c:665: prota.mira = M_izquierda;
   7A0E 01 E2 62      [10] 3845 	ld	bc,#_prota+0
   7A11 21 E9 62      [10] 3846 	ld	hl,#(_prota + 0x0007)
   7A14 36 01         [10] 3847 	ld	(hl),#0x01
                           3848 ;src/main.c:666: if (!checkCollision(M_izquierda)) {
   7A16 C5            [11] 3849 	push	bc
   7A17 3E 01         [ 7] 3850 	ld	a,#0x01
   7A19 F5            [11] 3851 	push	af
   7A1A 33            [ 6] 3852 	inc	sp
   7A1B CD 2F 65      [17] 3853 	call	_checkCollision
   7A1E 33            [ 6] 3854 	inc	sp
   7A1F C1            [10] 3855 	pop	bc
   7A20 7D            [ 4] 3856 	ld	a,l
   7A21 B7            [ 4] 3857 	or	a, a
   7A22 C0            [11] 3858 	ret	NZ
                           3859 ;src/main.c:667: prota.x--;
   7A23 0A            [ 7] 3860 	ld	a,(bc)
   7A24 C6 FF         [ 7] 3861 	add	a,#0xFF
   7A26 02            [ 7] 3862 	ld	(bc),a
                           3863 ;src/main.c:668: prota.mover = SI;
   7A27 21 E8 62      [10] 3864 	ld	hl,#(_prota + 0x0006)
   7A2A 36 01         [10] 3865 	ld	(hl),#0x01
                           3866 ;src/main.c:669: prota.sprite = g_hero_left;
   7A2C 21 C6 3D      [10] 3867 	ld	hl,#_g_hero_left
   7A2F 22 E6 62      [16] 3868 	ld	((_prota + 0x0004)), hl
   7A32 C9            [10] 3869 	ret
                           3870 ;src/main.c:673: void moverDerecha() {
                           3871 ;	---------------------------------
                           3872 ; Function moverDerecha
                           3873 ; ---------------------------------
   7A33                    3874 _moverDerecha::
                           3875 ;src/main.c:674: prota.mira = M_derecha;
   7A33 21 E9 62      [10] 3876 	ld	hl,#(_prota + 0x0007)
   7A36 36 00         [10] 3877 	ld	(hl),#0x00
                           3878 ;src/main.c:675: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7A38 AF            [ 4] 3879 	xor	a, a
   7A39 F5            [11] 3880 	push	af
   7A3A 33            [ 6] 3881 	inc	sp
   7A3B CD 2F 65      [17] 3882 	call	_checkCollision
   7A3E 33            [ 6] 3883 	inc	sp
   7A3F 45            [ 4] 3884 	ld	b,l
   7A40 21 E2 62      [10] 3885 	ld	hl, #_prota + 0
   7A43 4E            [ 7] 3886 	ld	c,(hl)
   7A44 59            [ 4] 3887 	ld	e,c
   7A45 16 00         [ 7] 3888 	ld	d,#0x00
   7A47 21 07 00      [10] 3889 	ld	hl,#0x0007
   7A4A 19            [11] 3890 	add	hl,de
   7A4B 11 50 80      [10] 3891 	ld	de, #0x8050
   7A4E 29            [11] 3892 	add	hl, hl
   7A4F 3F            [ 4] 3893 	ccf
   7A50 CB 1C         [ 8] 3894 	rr	h
   7A52 CB 1D         [ 8] 3895 	rr	l
   7A54 ED 52         [15] 3896 	sbc	hl, de
   7A56 3E 00         [ 7] 3897 	ld	a,#0x00
   7A58 17            [ 4] 3898 	rla
   7A59 5F            [ 4] 3899 	ld	e,a
   7A5A 78            [ 4] 3900 	ld	a,b
   7A5B B7            [ 4] 3901 	or	a,a
   7A5C 20 14         [12] 3902 	jr	NZ,00104$
   7A5E B3            [ 4] 3903 	or	a,e
   7A5F 28 11         [12] 3904 	jr	Z,00104$
                           3905 ;src/main.c:676: prota.x++;
   7A61 0C            [ 4] 3906 	inc	c
   7A62 21 E2 62      [10] 3907 	ld	hl,#_prota
   7A65 71            [ 7] 3908 	ld	(hl),c
                           3909 ;src/main.c:677: prota.mover = SI;
   7A66 21 E8 62      [10] 3910 	ld	hl,#(_prota + 0x0006)
   7A69 36 01         [10] 3911 	ld	(hl),#0x01
                           3912 ;src/main.c:678: prota.sprite = g_hero;
   7A6B 21 70 3E      [10] 3913 	ld	hl,#_g_hero
   7A6E 22 E6 62      [16] 3914 	ld	((_prota + 0x0004)), hl
   7A71 C9            [10] 3915 	ret
   7A72                    3916 00104$:
                           3917 ;src/main.c:679: }else if( prota.x + G_HERO_W >= 80){
   7A72 7B            [ 4] 3918 	ld	a,e
   7A73 B7            [ 4] 3919 	or	a, a
   7A74 C0            [11] 3920 	ret	NZ
                           3921 ;src/main.c:680: avanzarMapa();
   7A75 C3 3F 7D      [10] 3922 	jp  _avanzarMapa
                           3923 ;src/main.c:684: void moverArriba() {
                           3924 ;	---------------------------------
                           3925 ; Function moverArriba
                           3926 ; ---------------------------------
   7A78                    3927 _moverArriba::
                           3928 ;src/main.c:685: prota.mira = M_arriba;
   7A78 21 E9 62      [10] 3929 	ld	hl,#(_prota + 0x0007)
   7A7B 36 02         [10] 3930 	ld	(hl),#0x02
                           3931 ;src/main.c:686: if (!checkCollision(M_arriba)) {
   7A7D 3E 02         [ 7] 3932 	ld	a,#0x02
   7A7F F5            [11] 3933 	push	af
   7A80 33            [ 6] 3934 	inc	sp
   7A81 CD 2F 65      [17] 3935 	call	_checkCollision
   7A84 33            [ 6] 3936 	inc	sp
   7A85 7D            [ 4] 3937 	ld	a,l
   7A86 B7            [ 4] 3938 	or	a, a
   7A87 C0            [11] 3939 	ret	NZ
                           3940 ;src/main.c:687: prota.y--;
   7A88 21 E3 62      [10] 3941 	ld	hl,#_prota + 1
   7A8B 4E            [ 7] 3942 	ld	c,(hl)
   7A8C 0D            [ 4] 3943 	dec	c
   7A8D 71            [ 7] 3944 	ld	(hl),c
                           3945 ;src/main.c:688: prota.y--;
   7A8E 0D            [ 4] 3946 	dec	c
   7A8F 71            [ 7] 3947 	ld	(hl),c
                           3948 ;src/main.c:689: prota.mover  = SI;
   7A90 21 E8 62      [10] 3949 	ld	hl,#(_prota + 0x0006)
   7A93 36 01         [10] 3950 	ld	(hl),#0x01
                           3951 ;src/main.c:690: prota.sprite = g_hero_up;
   7A95 21 2C 3D      [10] 3952 	ld	hl,#_g_hero_up
   7A98 22 E6 62      [16] 3953 	ld	((_prota + 0x0004)), hl
   7A9B C9            [10] 3954 	ret
                           3955 ;src/main.c:694: void moverAbajo() {
                           3956 ;	---------------------------------
                           3957 ; Function moverAbajo
                           3958 ; ---------------------------------
   7A9C                    3959 _moverAbajo::
                           3960 ;src/main.c:695: prota.mira = M_abajo;
   7A9C 21 E9 62      [10] 3961 	ld	hl,#(_prota + 0x0007)
   7A9F 36 03         [10] 3962 	ld	(hl),#0x03
                           3963 ;src/main.c:696: if (!checkCollision(M_abajo) ) {
   7AA1 3E 03         [ 7] 3964 	ld	a,#0x03
   7AA3 F5            [11] 3965 	push	af
   7AA4 33            [ 6] 3966 	inc	sp
   7AA5 CD 2F 65      [17] 3967 	call	_checkCollision
   7AA8 33            [ 6] 3968 	inc	sp
   7AA9 7D            [ 4] 3969 	ld	a,l
   7AAA B7            [ 4] 3970 	or	a, a
   7AAB C0            [11] 3971 	ret	NZ
                           3972 ;src/main.c:697: prota.y++;
   7AAC 01 E3 62      [10] 3973 	ld	bc,#_prota + 1
   7AAF 0A            [ 7] 3974 	ld	a,(bc)
   7AB0 3C            [ 4] 3975 	inc	a
   7AB1 02            [ 7] 3976 	ld	(bc),a
                           3977 ;src/main.c:698: prota.y++;
   7AB2 3C            [ 4] 3978 	inc	a
   7AB3 02            [ 7] 3979 	ld	(bc),a
                           3980 ;src/main.c:699: prota.mover  = SI;
   7AB4 21 E8 62      [10] 3981 	ld	hl,#(_prota + 0x0006)
   7AB7 36 01         [10] 3982 	ld	(hl),#0x01
                           3983 ;src/main.c:700: prota.sprite = g_hero_down;
   7AB9 21 92 3C      [10] 3984 	ld	hl,#_g_hero_down
   7ABC 22 E6 62      [16] 3985 	ld	((_prota + 0x0004)), hl
   7ABF C9            [10] 3986 	ret
                           3987 ;src/main.c:707: void intHandler() {
                           3988 ;	---------------------------------
                           3989 ; Function intHandler
                           3990 ; ---------------------------------
   7AC0                    3991 _intHandler::
                           3992 ;src/main.c:708: if (++i == 6) {
   7AC0 21 FA 62      [10] 3993 	ld	hl, #_i+0
   7AC3 34            [11] 3994 	inc	(hl)
   7AC4 3A FA 62      [13] 3995 	ld	a,(#_i + 0)
   7AC7 D6 06         [ 7] 3996 	sub	a, #0x06
   7AC9 C0            [11] 3997 	ret	NZ
                           3998 ;src/main.c:709: play();
   7ACA CD 2A 52      [17] 3999 	call	_play
                           4000 ;src/main.c:710: i=0;
   7ACD 21 FA 62      [10] 4001 	ld	hl,#_i + 0
   7AD0 36 00         [10] 4002 	ld	(hl), #0x00
   7AD2 C9            [10] 4003 	ret
                           4004 ;src/main.c:714: void inicializarCPC() {
                           4005 ;	---------------------------------
                           4006 ; Function inicializarCPC
                           4007 ; ---------------------------------
   7AD3                    4008 _inicializarCPC::
                           4009 ;src/main.c:715: cpct_disableFirmware();
   7AD3 CD E8 55      [17] 4010 	call	_cpct_disableFirmware
                           4011 ;src/main.c:716: cpct_setVideoMode(0);
   7AD6 2E 00         [ 7] 4012 	ld	l,#0x00
   7AD8 CD BC 55      [17] 4013 	call	_cpct_setVideoMode
                           4014 ;src/main.c:717: cpct_setBorder(HW_BLACK);
   7ADB 21 10 14      [10] 4015 	ld	hl,#0x1410
   7ADE E5            [11] 4016 	push	hl
   7ADF CD 08 53      [17] 4017 	call	_cpct_setPALColour
                           4018 ;src/main.c:718: cpct_setPalette(g_palette, 16);
   7AE2 21 10 00      [10] 4019 	ld	hl,#0x0010
   7AE5 E5            [11] 4020 	push	hl
   7AE6 21 60 3E      [10] 4021 	ld	hl,#_g_palette
   7AE9 E5            [11] 4022 	push	hl
   7AEA CD 7B 52      [17] 4023 	call	_cpct_setPalette
   7AED C9            [10] 4024 	ret
                           4025 ;src/main.c:723: void inicializarJuego() {
                           4026 ;	---------------------------------
                           4027 ; Function inicializarJuego
                           4028 ; ---------------------------------
   7AEE                    4029 _inicializarJuego::
                           4030 ;src/main.c:724: cambio = 0;
   7AEE 21 F6 62      [10] 4031 	ld	hl,#_cambio + 0
   7AF1 36 00         [10] 4032 	ld	(hl), #0x00
                           4033 ;src/main.c:725: timer = 0;
   7AF3 21 00 00      [10] 4034 	ld	hl,#0x0000
   7AF6 22 F7 62      [16] 4035 	ld	(_timer),hl
                           4036 ;src/main.c:726: parpadeo = 0;
   7AF9 21 F5 62      [10] 4037 	ld	hl,#_parpadeo + 0
   7AFC 36 00         [10] 4038 	ld	(hl), #0x00
                           4039 ;src/main.c:728: num_mapa = 0;
   7AFE 21 C6 63      [10] 4040 	ld	hl,#_num_mapa + 0
   7B01 36 00         [10] 4041 	ld	(hl), #0x00
                           4042 ;src/main.c:729: mapa = mapas[num_mapa];
   7B03 21 E4 63      [10] 4043 	ld	hl, #_mapas + 0
   7B06 7E            [ 7] 4044 	ld	a,(hl)
   7B07 FD 21 C4 63   [14] 4045 	ld	iy,#_mapa
   7B0B FD 77 00      [19] 4046 	ld	0 (iy),a
   7B0E 23            [ 6] 4047 	inc	hl
   7B0F 7E            [ 7] 4048 	ld	a,(hl)
   7B10 32 C5 63      [13] 4049 	ld	(#_mapa + 1),a
                           4050 ;src/main.c:730: cpct_etm_setTileset2x4(g_tileset);
   7B13 21 E0 17      [10] 4051 	ld	hl,#_g_tileset
   7B16 CD 6C 54      [17] 4052 	call	_cpct_etm_setTileset2x4
                           4053 ;src/main.c:732: dibujarMapa();
   7B19 CD CE 63      [17] 4054 	call	_dibujarMapa
                           4055 ;src/main.c:735: barraPuntuacionInicial();
   7B1C CD 11 50      [17] 4056 	call	_barraPuntuacionInicial
                           4057 ;src/main.c:738: prota.x = prota.px = 4;
   7B1F 21 E4 62      [10] 4058 	ld	hl,#(_prota + 0x0002)
   7B22 36 04         [10] 4059 	ld	(hl),#0x04
   7B24 21 E2 62      [10] 4060 	ld	hl,#_prota
   7B27 36 04         [10] 4061 	ld	(hl),#0x04
                           4062 ;src/main.c:739: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7B29 21 E5 62      [10] 4063 	ld	hl,#(_prota + 0x0003)
   7B2C 36 68         [10] 4064 	ld	(hl),#0x68
   7B2E 21 E3 62      [10] 4065 	ld	hl,#(_prota + 0x0001)
   7B31 36 68         [10] 4066 	ld	(hl),#0x68
                           4067 ;src/main.c:740: prota.mover  = NO;
   7B33 21 E8 62      [10] 4068 	ld	hl,#(_prota + 0x0006)
   7B36 36 00         [10] 4069 	ld	(hl),#0x00
                           4070 ;src/main.c:741: prota.mira=M_derecha;
   7B38 21 E9 62      [10] 4071 	ld	hl,#(_prota + 0x0007)
   7B3B 36 00         [10] 4072 	ld	(hl),#0x00
                           4073 ;src/main.c:742: prota.sprite = g_hero;
   7B3D 21 70 3E      [10] 4074 	ld	hl,#_g_hero
   7B40 22 E6 62      [16] 4075 	ld	((_prota + 0x0004)), hl
                           4076 ;src/main.c:746: cu.x = cu.px = 0;
   7B43 21 EC 62      [10] 4077 	ld	hl,#(_cu + 0x0002)
   7B46 36 00         [10] 4078 	ld	(hl),#0x00
   7B48 21 EA 62      [10] 4079 	ld	hl,#_cu
   7B4B 36 00         [10] 4080 	ld	(hl),#0x00
                           4081 ;src/main.c:747: cu.y = cu.py = 0;
   7B4D 21 ED 62      [10] 4082 	ld	hl,#(_cu + 0x0003)
   7B50 36 00         [10] 4083 	ld	(hl),#0x00
   7B52 21 EB 62      [10] 4084 	ld	hl,#(_cu + 0x0001)
   7B55 36 00         [10] 4085 	ld	(hl),#0x00
                           4086 ;src/main.c:748: cu.lanzado = NO;
   7B57 21 F0 62      [10] 4087 	ld	hl,#(_cu + 0x0006)
   7B5A 36 00         [10] 4088 	ld	(hl),#0x00
                           4089 ;src/main.c:749: cu.mover = NO;
   7B5C 21 F3 62      [10] 4090 	ld	hl,#(_cu + 0x0009)
   7B5F 36 00         [10] 4091 	ld	(hl),#0x00
                           4092 ;src/main.c:750: cu.off_bound = NO;
   7B61 21 F4 62      [10] 4093 	ld	hl,#(_cu + 0x000a)
   7B64 36 00         [10] 4094 	ld	(hl),#0x00
                           4095 ;src/main.c:752: inicializarEnemy();
   7B66 CD E9 78      [17] 4096 	call	_inicializarEnemy
                           4097 ;src/main.c:754: dibujarProta();
   7B69 C3 1A 64      [10] 4098 	jp  _dibujarProta
                           4099 ;src/main.c:757: void menuFin(u16 puntuacion) __z88dk_fastcall {
                           4100 ;	---------------------------------
                           4101 ; Function menuFin
                           4102 ; ---------------------------------
   7B6C                    4103 _menuFin::
   7B6C DD E5         [15] 4104 	push	ix
   7B6E DD 21 00 00   [14] 4105 	ld	ix,#0
   7B72 DD 39         [15] 4106 	add	ix,sp
   7B74 F5            [11] 4107 	push	af
   7B75 F5            [11] 4108 	push	af
   7B76 DD 75 FE      [19] 4109 	ld	-2 (ix),l
   7B79 DD 74 FF      [19] 4110 	ld	-1 (ix),h
                           4111 ;src/main.c:761: puntuacion_aux = puntuacion/10000;
   7B7C 21 10 27      [10] 4112 	ld	hl,#0x2710
   7B7F E5            [11] 4113 	push	hl
   7B80 DD 6E FE      [19] 4114 	ld	l,-2 (ix)
   7B83 DD 66 FF      [19] 4115 	ld	h,-1 (ix)
   7B86 E5            [11] 4116 	push	hl
   7B87 CD 3A 52      [17] 4117 	call	__divuint
   7B8A F1            [10] 4118 	pop	af
   7B8B F1            [10] 4119 	pop	af
   7B8C 33            [ 6] 4120 	inc	sp
   7B8D 33            [ 6] 4121 	inc	sp
   7B8E E5            [11] 4122 	push	hl
                           4123 ;src/main.c:764: cpct_clearScreen(0);
   7B8F 21 00 40      [10] 4124 	ld	hl,#0x4000
   7B92 E5            [11] 4125 	push	hl
   7B93 AF            [ 4] 4126 	xor	a, a
   7B94 F5            [11] 4127 	push	af
   7B95 33            [ 6] 4128 	inc	sp
   7B96 26 C0         [ 7] 4129 	ld	h, #0xC0
   7B98 E5            [11] 4130 	push	hl
   7B99 CD DA 55      [17] 4131 	call	_cpct_memset
                           4132 ;src/main.c:766: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7B9C 21 18 5A      [10] 4133 	ld	hl,#0x5A18
   7B9F E5            [11] 4134 	push	hl
   7BA0 21 00 C0      [10] 4135 	ld	hl,#0xC000
   7BA3 E5            [11] 4136 	push	hl
   7BA4 CD FB 5E      [17] 4137 	call	_cpct_getScreenPtr
   7BA7 4D            [ 4] 4138 	ld	c,l
   7BA8 44            [ 4] 4139 	ld	b,h
                           4140 ;src/main.c:767: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7BA9 21 02 00      [10] 4141 	ld	hl,#0x0002
   7BAC E5            [11] 4142 	push	hl
   7BAD C5            [11] 4143 	push	bc
   7BAE 21 17 7D      [10] 4144 	ld	hl,#___str_0
   7BB1 E5            [11] 4145 	push	hl
   7BB2 CD 14 53      [17] 4146 	call	_cpct_drawStringM0
   7BB5 21 06 00      [10] 4147 	ld	hl,#6
   7BB8 39            [11] 4148 	add	hl,sp
   7BB9 F9            [ 6] 4149 	ld	sp,hl
                           4150 ;src/main.c:769: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   7BBA 21 14 78      [10] 4151 	ld	hl,#0x7814
   7BBD E5            [11] 4152 	push	hl
   7BBE 21 00 C0      [10] 4153 	ld	hl,#0xC000
   7BC1 E5            [11] 4154 	push	hl
   7BC2 CD FB 5E      [17] 4155 	call	_cpct_getScreenPtr
   7BC5 4D            [ 4] 4156 	ld	c,l
   7BC6 44            [ 4] 4157 	ld	b,h
                           4158 ;src/main.c:770: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   7BC7 21 02 00      [10] 4159 	ld	hl,#0x0002
   7BCA E5            [11] 4160 	push	hl
   7BCB C5            [11] 4161 	push	bc
   7BCC 21 21 7D      [10] 4162 	ld	hl,#___str_1
   7BCF E5            [11] 4163 	push	hl
   7BD0 CD 14 53      [17] 4164 	call	_cpct_drawStringM0
   7BD3 21 06 00      [10] 4165 	ld	hl,#6
   7BD6 39            [11] 4166 	add	hl,sp
   7BD7 F9            [ 6] 4167 	ld	sp,hl
                           4168 ;src/main.c:772: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   7BD8 21 2D 78      [10] 4169 	ld	hl,#0x782D
   7BDB E5            [11] 4170 	push	hl
   7BDC 21 00 C0      [10] 4171 	ld	hl,#0xC000
   7BDF E5            [11] 4172 	push	hl
   7BE0 CD FB 5E      [17] 4173 	call	_cpct_getScreenPtr
                           4174 ;src/main.c:774: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   7BE3 E5            [11] 4175 	push	hl
   7BE4 21 0A 00      [10] 4176 	ld	hl,#0x000A
   7BE7 E5            [11] 4177 	push	hl
   7BE8 DD 6E FC      [19] 4178 	ld	l,-4 (ix)
   7BEB DD 66 FD      [19] 4179 	ld	h,-3 (ix)
   7BEE E5            [11] 4180 	push	hl
   7BEF CD 09 55      [17] 4181 	call	__moduint
   7BF2 F1            [10] 4182 	pop	af
   7BF3 F1            [10] 4183 	pop	af
   7BF4 C1            [10] 4184 	pop	bc
   7BF5 7D            [ 4] 4185 	ld	a,l
   7BF6 C6 30         [ 7] 4186 	add	a, #0x30
   7BF8 67            [ 4] 4187 	ld	h,a
   7BF9 59            [ 4] 4188 	ld	e, c
   7BFA 50            [ 4] 4189 	ld	d, b
   7BFB C5            [11] 4190 	push	bc
   7BFC E5            [11] 4191 	push	hl
   7BFD 33            [ 6] 4192 	inc	sp
   7BFE 21 02 00      [10] 4193 	ld	hl,#0x0002
   7C01 E5            [11] 4194 	push	hl
   7C02 D5            [11] 4195 	push	de
   7C03 CD 70 54      [17] 4196 	call	_cpct_drawCharM0
   7C06 F1            [10] 4197 	pop	af
   7C07 33            [ 6] 4198 	inc	sp
   7C08 21 E8 03      [10] 4199 	ld	hl,#0x03E8
   7C0B E3            [19] 4200 	ex	(sp),hl
   7C0C DD 6E FE      [19] 4201 	ld	l,-2 (ix)
   7C0F DD 66 FF      [19] 4202 	ld	h,-1 (ix)
   7C12 E5            [11] 4203 	push	hl
   7C13 CD 3A 52      [17] 4204 	call	__divuint
   7C16 F1            [10] 4205 	pop	af
   7C17 F1            [10] 4206 	pop	af
   7C18 11 0A 00      [10] 4207 	ld	de,#0x000A
   7C1B D5            [11] 4208 	push	de
   7C1C E5            [11] 4209 	push	hl
   7C1D CD 09 55      [17] 4210 	call	__moduint
   7C20 F1            [10] 4211 	pop	af
   7C21 F1            [10] 4212 	pop	af
   7C22 C1            [10] 4213 	pop	bc
   7C23 7D            [ 4] 4214 	ld	a,l
   7C24 C6 30         [ 7] 4215 	add	a, #0x30
   7C26 67            [ 4] 4216 	ld	h,a
   7C27 79            [ 4] 4217 	ld	a,c
   7C28 C6 04         [ 7] 4218 	add	a, #0x04
   7C2A 5F            [ 4] 4219 	ld	e,a
   7C2B 78            [ 4] 4220 	ld	a,b
   7C2C CE 00         [ 7] 4221 	adc	a, #0x00
   7C2E 57            [ 4] 4222 	ld	d,a
   7C2F C5            [11] 4223 	push	bc
   7C30 E5            [11] 4224 	push	hl
   7C31 33            [ 6] 4225 	inc	sp
   7C32 21 02 00      [10] 4226 	ld	hl,#0x0002
   7C35 E5            [11] 4227 	push	hl
   7C36 D5            [11] 4228 	push	de
   7C37 CD 70 54      [17] 4229 	call	_cpct_drawCharM0
   7C3A F1            [10] 4230 	pop	af
   7C3B 33            [ 6] 4231 	inc	sp
   7C3C 21 64 00      [10] 4232 	ld	hl,#0x0064
   7C3F E3            [19] 4233 	ex	(sp),hl
   7C40 DD 6E FE      [19] 4234 	ld	l,-2 (ix)
   7C43 DD 66 FF      [19] 4235 	ld	h,-1 (ix)
   7C46 E5            [11] 4236 	push	hl
   7C47 CD 3A 52      [17] 4237 	call	__divuint
   7C4A F1            [10] 4238 	pop	af
   7C4B F1            [10] 4239 	pop	af
   7C4C 11 0A 00      [10] 4240 	ld	de,#0x000A
   7C4F D5            [11] 4241 	push	de
   7C50 E5            [11] 4242 	push	hl
   7C51 CD 09 55      [17] 4243 	call	__moduint
   7C54 F1            [10] 4244 	pop	af
   7C55 F1            [10] 4245 	pop	af
   7C56 C1            [10] 4246 	pop	bc
   7C57 7D            [ 4] 4247 	ld	a,l
   7C58 C6 30         [ 7] 4248 	add	a, #0x30
   7C5A 57            [ 4] 4249 	ld	d,a
   7C5B FD 21 08 00   [14] 4250 	ld	iy,#0x0008
   7C5F FD 09         [15] 4251 	add	iy,bc
   7C61 C5            [11] 4252 	push	bc
   7C62 D5            [11] 4253 	push	de
   7C63 33            [ 6] 4254 	inc	sp
   7C64 21 02 00      [10] 4255 	ld	hl,#0x0002
   7C67 E5            [11] 4256 	push	hl
   7C68 FD E5         [15] 4257 	push	iy
   7C6A CD 70 54      [17] 4258 	call	_cpct_drawCharM0
   7C6D F1            [10] 4259 	pop	af
   7C6E 33            [ 6] 4260 	inc	sp
   7C6F 21 0A 00      [10] 4261 	ld	hl,#0x000A
   7C72 E3            [19] 4262 	ex	(sp),hl
   7C73 DD 6E FE      [19] 4263 	ld	l,-2 (ix)
   7C76 DD 66 FF      [19] 4264 	ld	h,-1 (ix)
   7C79 E5            [11] 4265 	push	hl
   7C7A CD 3A 52      [17] 4266 	call	__divuint
   7C7D F1            [10] 4267 	pop	af
   7C7E F1            [10] 4268 	pop	af
   7C7F 11 0A 00      [10] 4269 	ld	de,#0x000A
   7C82 D5            [11] 4270 	push	de
   7C83 E5            [11] 4271 	push	hl
   7C84 CD 09 55      [17] 4272 	call	__moduint
   7C87 F1            [10] 4273 	pop	af
   7C88 F1            [10] 4274 	pop	af
   7C89 C1            [10] 4275 	pop	bc
   7C8A 7D            [ 4] 4276 	ld	a,l
   7C8B C6 30         [ 7] 4277 	add	a, #0x30
   7C8D 57            [ 4] 4278 	ld	d,a
   7C8E FD 21 0C 00   [14] 4279 	ld	iy,#0x000C
   7C92 FD 09         [15] 4280 	add	iy,bc
   7C94 C5            [11] 4281 	push	bc
   7C95 D5            [11] 4282 	push	de
   7C96 33            [ 6] 4283 	inc	sp
   7C97 21 02 00      [10] 4284 	ld	hl,#0x0002
   7C9A E5            [11] 4285 	push	hl
   7C9B FD E5         [15] 4286 	push	iy
   7C9D CD 70 54      [17] 4287 	call	_cpct_drawCharM0
   7CA0 F1            [10] 4288 	pop	af
   7CA1 33            [ 6] 4289 	inc	sp
   7CA2 21 0A 00      [10] 4290 	ld	hl,#0x000A
   7CA5 E3            [19] 4291 	ex	(sp),hl
   7CA6 DD 6E FE      [19] 4292 	ld	l,-2 (ix)
   7CA9 DD 66 FF      [19] 4293 	ld	h,-1 (ix)
   7CAC E5            [11] 4294 	push	hl
   7CAD CD 09 55      [17] 4295 	call	__moduint
   7CB0 F1            [10] 4296 	pop	af
   7CB1 F1            [10] 4297 	pop	af
   7CB2 C1            [10] 4298 	pop	bc
   7CB3 7D            [ 4] 4299 	ld	a,l
   7CB4 C6 30         [ 7] 4300 	add	a, #0x30
   7CB6 57            [ 4] 4301 	ld	d,a
   7CB7 21 10 00      [10] 4302 	ld	hl,#0x0010
   7CBA 09            [11] 4303 	add	hl,bc
   7CBB 4D            [ 4] 4304 	ld	c,l
   7CBC 44            [ 4] 4305 	ld	b,h
   7CBD D5            [11] 4306 	push	de
   7CBE 33            [ 6] 4307 	inc	sp
   7CBF 21 02 00      [10] 4308 	ld	hl,#0x0002
   7CC2 E5            [11] 4309 	push	hl
   7CC3 C5            [11] 4310 	push	bc
   7CC4 CD 70 54      [17] 4311 	call	_cpct_drawCharM0
   7CC7 F1            [10] 4312 	pop	af
                           4313 ;src/main.c:784: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 160); // centrado en horizontal y abajo en vertical
   7CC8 33            [ 6] 4314 	inc	sp
   7CC9 21 0E A0      [10] 4315 	ld	hl,#0xA00E
   7CCC E3            [19] 4316 	ex	(sp),hl
   7CCD 21 00 C0      [10] 4317 	ld	hl,#0xC000
   7CD0 E5            [11] 4318 	push	hl
   7CD1 CD FB 5E      [17] 4319 	call	_cpct_getScreenPtr
   7CD4 4D            [ 4] 4320 	ld	c,l
   7CD5 44            [ 4] 4321 	ld	b,h
                           4322 ;src/main.c:785: cpct_drawStringM0("TO PLAY AGAIN", memptr, 2, 0);
   7CD6 21 02 00      [10] 4323 	ld	hl,#0x0002
   7CD9 E5            [11] 4324 	push	hl
   7CDA C5            [11] 4325 	push	bc
   7CDB 21 29 7D      [10] 4326 	ld	hl,#___str_2
   7CDE E5            [11] 4327 	push	hl
   7CDF CD 14 53      [17] 4328 	call	_cpct_drawStringM0
   7CE2 21 06 00      [10] 4329 	ld	hl,#6
   7CE5 39            [11] 4330 	add	hl,sp
   7CE6 F9            [ 6] 4331 	ld	sp,hl
                           4332 ;src/main.c:787: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 28, 170); // centrado en horizontal y abajo en vertical
   7CE7 21 1C AA      [10] 4333 	ld	hl,#0xAA1C
   7CEA E5            [11] 4334 	push	hl
   7CEB 21 00 C0      [10] 4335 	ld	hl,#0xC000
   7CEE E5            [11] 4336 	push	hl
   7CEF CD FB 5E      [17] 4337 	call	_cpct_getScreenPtr
   7CF2 4D            [ 4] 4338 	ld	c,l
   7CF3 44            [ 4] 4339 	ld	b,h
                           4340 ;src/main.c:788: cpct_drawStringM0("PRESS P", memptr, 2, 0);
   7CF4 21 02 00      [10] 4341 	ld	hl,#0x0002
   7CF7 E5            [11] 4342 	push	hl
   7CF8 C5            [11] 4343 	push	bc
   7CF9 21 37 7D      [10] 4344 	ld	hl,#___str_3
   7CFC E5            [11] 4345 	push	hl
   7CFD CD 14 53      [17] 4346 	call	_cpct_drawStringM0
   7D00 21 06 00      [10] 4347 	ld	hl,#6
   7D03 39            [11] 4348 	add	hl,sp
   7D04 F9            [ 6] 4349 	ld	sp,hl
                           4350 ;src/main.c:791: do{
   7D05                    4351 00101$:
                           4352 ;src/main.c:792: cpct_scanKeyboard_f();
   7D05 CD 9E 52      [17] 4353 	call	_cpct_scanKeyboard_f
                           4354 ;src/main.c:795: } while(!cpct_isKeyPressed(Key_P));
   7D08 21 03 08      [10] 4355 	ld	hl,#0x0803
   7D0B CD 92 52      [17] 4356 	call	_cpct_isKeyPressed
   7D0E 7D            [ 4] 4357 	ld	a,l
   7D0F B7            [ 4] 4358 	or	a, a
   7D10 28 F3         [12] 4359 	jr	Z,00101$
   7D12 DD F9         [10] 4360 	ld	sp, ix
   7D14 DD E1         [14] 4361 	pop	ix
   7D16 C9            [10] 4362 	ret
   7D17                    4363 ___str_0:
   7D17 47 41 4D 45 20 4F  4364 	.ascii "GAME OVER"
        56 45 52
   7D20 00                 4365 	.db 0x00
   7D21                    4366 ___str_1:
   7D21 53 43 4F 52 45 3A  4367 	.ascii "SCORE: "
        20
   7D28 00                 4368 	.db 0x00
   7D29                    4369 ___str_2:
   7D29 54 4F 20 50 4C 41  4370 	.ascii "TO PLAY AGAIN"
        59 20 41 47 41 49
        4E
   7D36 00                 4371 	.db 0x00
   7D37                    4372 ___str_3:
   7D37 50 52 45 53 53 20  4373 	.ascii "PRESS P"
        50
   7D3E 00                 4374 	.db 0x00
                           4375 ;src/main.c:798: void avanzarMapa() {
                           4376 ;	---------------------------------
                           4377 ; Function avanzarMapa
                           4378 ; ---------------------------------
   7D3F                    4379 _avanzarMapa::
                           4380 ;src/main.c:799: if(num_mapa < NUM_MAPAS -1) {
   7D3F 3A C6 63      [13] 4381 	ld	a,(#_num_mapa + 0)
   7D42 D6 02         [ 7] 4382 	sub	a, #0x02
   7D44 30 34         [12] 4383 	jr	NC,00102$
                           4384 ;src/main.c:800: mapa = mapas[++num_mapa];
   7D46 01 E4 63      [10] 4385 	ld	bc,#_mapas+0
   7D49 21 C6 63      [10] 4386 	ld	hl, #_num_mapa+0
   7D4C 34            [11] 4387 	inc	(hl)
   7D4D FD 21 C6 63   [14] 4388 	ld	iy,#_num_mapa
   7D51 FD 6E 00      [19] 4389 	ld	l,0 (iy)
   7D54 26 00         [ 7] 4390 	ld	h,#0x00
   7D56 29            [11] 4391 	add	hl, hl
   7D57 09            [11] 4392 	add	hl,bc
   7D58 7E            [ 7] 4393 	ld	a,(hl)
   7D59 FD 21 C4 63   [14] 4394 	ld	iy,#_mapa
   7D5D FD 77 00      [19] 4395 	ld	0 (iy),a
   7D60 23            [ 6] 4396 	inc	hl
   7D61 7E            [ 7] 4397 	ld	a,(hl)
   7D62 32 C5 63      [13] 4398 	ld	(#_mapa + 1),a
                           4399 ;src/main.c:801: prota.x = prota.px = 2;
   7D65 21 E4 62      [10] 4400 	ld	hl,#(_prota + 0x0002)
   7D68 36 02         [10] 4401 	ld	(hl),#0x02
   7D6A 21 E2 62      [10] 4402 	ld	hl,#_prota
   7D6D 36 02         [10] 4403 	ld	(hl),#0x02
                           4404 ;src/main.c:802: prota.mover = SI;
   7D6F 21 E8 62      [10] 4405 	ld	hl,#(_prota + 0x0006)
   7D72 36 01         [10] 4406 	ld	(hl),#0x01
                           4407 ;src/main.c:803: dibujarMapa();
   7D74 CD CE 63      [17] 4408 	call	_dibujarMapa
                           4409 ;src/main.c:804: inicializarEnemy();
   7D77 C3 E9 78      [10] 4410 	jp  _inicializarEnemy
   7D7A                    4411 00102$:
                           4412 ;src/main.c:807: menuFin(puntuacion);
   7D7A FD 21 C8 63   [14] 4413 	ld	iy,#_puntuacion
   7D7E FD 6E 00      [19] 4414 	ld	l,0 (iy)
   7D81 26 00         [ 7] 4415 	ld	h,#0x00
   7D83 C3 6C 7B      [10] 4416 	jp  _menuFin
                           4417 ;src/main.c:812: void main(void) {
                           4418 ;	---------------------------------
                           4419 ; Function main
                           4420 ; ---------------------------------
   7D86                    4421 _main::
   7D86 DD E5         [15] 4422 	push	ix
   7D88 DD 21 00 00   [14] 4423 	ld	ix,#0
   7D8C DD 39         [15] 4424 	add	ix,sp
   7D8E 21 F3 FF      [10] 4425 	ld	hl,#-13
   7D91 39            [11] 4426 	add	hl,sp
   7D92 F9            [ 6] 4427 	ld	sp,hl
                           4428 ;src/main.c:817: vidas = 100;
   7D93 21 F9 62      [10] 4429 	ld	hl,#_vidas + 0
   7D96 36 64         [10] 4430 	ld	(hl), #0x64
                           4431 ;src/main.c:819: inicializarCPC();
   7D98 CD D3 7A      [17] 4432 	call	_inicializarCPC
                           4433 ;src/main.c:821: menuInicio();
   7D9B CD 32 4F      [17] 4434 	call	_menuInicio
                           4435 ;src/main.c:823: inicializarJuego();
   7D9E CD EE 7A      [17] 4436 	call	_inicializarJuego
                           4437 ;src/main.c:827: while (1) {
   7DA1                    4438 00150$:
                           4439 ;src/main.c:828: if (endGame) {
   7DA1 3A C7 63      [13] 4440 	ld	a,(#_endGame + 0)
   7DA4 B7            [ 4] 4441 	or	a, a
   7DA5 28 14         [12] 4442 	jr	Z,00102$
                           4443 ;src/main.c:829: menuFin(puntuacion);
   7DA7 FD 21 C8 63   [14] 4444 	ld	iy,#_puntuacion
   7DAB FD 6E 00      [19] 4445 	ld	l,0 (iy)
   7DAE 26 00         [ 7] 4446 	ld	h,#0x00
   7DB0 CD 6C 7B      [17] 4447 	call	_menuFin
                           4448 ;src/main.c:830: endGame = 0;
   7DB3 21 C7 63      [10] 4449 	ld	hl,#_endGame + 0
   7DB6 36 00         [10] 4450 	ld	(hl), #0x00
                           4451 ;src/main.c:831: inicializarJuego();
   7DB8 CD EE 7A      [17] 4452 	call	_inicializarJuego
   7DBB                    4453 00102$:
                           4454 ;src/main.c:833: ++timer;
   7DBB 21 F7 62      [10] 4455 	ld	hl, #_timer+0
   7DBE 34            [11] 4456 	inc	(hl)
   7DBF 20 04         [12] 4457 	jr	NZ,00272$
   7DC1 21 F8 62      [10] 4458 	ld	hl, #_timer+1
   7DC4 34            [11] 4459 	inc	(hl)
   7DC5                    4460 00272$:
                           4461 ;src/main.c:834: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7DC5 3A F7 62      [13] 4462 	ld	a,(#_timer + 0)
   7DC8 D6 04         [ 7] 4463 	sub	a, #0x04
   7DCA 20 30         [12] 4464 	jr	NZ,00106$
   7DCC 3A F8 62      [13] 4465 	ld	a,(#_timer + 1)
   7DCF B7            [ 4] 4466 	or	a, a
   7DD0 20 2A         [12] 4467 	jr	NZ,00106$
   7DD2 3A F6 62      [13] 4468 	ld	a,(#_cambio + 0)
   7DD5 B7            [ 4] 4469 	or	a, a
   7DD6 28 24         [12] 4470 	jr	Z,00106$
   7DD8 3E 0C         [ 7] 4471 	ld	a,#0x0C
   7DDA FD 21 F6 62   [14] 4472 	ld	iy,#_cambio
   7DDE FD 96 00      [19] 4473 	sub	a, 0 (iy)
   7DE1 38 19         [12] 4474 	jr	C,00106$
                           4475 ;src/main.c:835: timer = 0;
   7DE3 21 00 00      [10] 4476 	ld	hl,#0x0000
   7DE6 22 F7 62      [16] 4477 	ld	(_timer),hl
                           4478 ;src/main.c:836: parpadeo = !parpadeo;
   7DE9 3A F5 62      [13] 4479 	ld	a,(#_parpadeo + 0)
   7DEC D6 01         [ 7] 4480 	sub	a,#0x01
   7DEE 3E 00         [ 7] 4481 	ld	a,#0x00
   7DF0 17            [ 4] 4482 	rla
   7DF1 4F            [ 4] 4483 	ld	c,a
   7DF2 21 F5 62      [10] 4484 	ld	hl,#_parpadeo + 0
   7DF5 71            [ 7] 4485 	ld	(hl), c
                           4486 ;src/main.c:837: cambio ++;
   7DF6 21 F6 62      [10] 4487 	ld	hl, #_cambio+0
   7DF9 34            [11] 4488 	inc	(hl)
   7DFA 18 0C         [12] 4489 	jr	00107$
   7DFC                    4490 00106$:
                           4491 ;src/main.c:838: }else if(cambio == 12){
   7DFC 3A F6 62      [13] 4492 	ld	a,(#_cambio + 0)
   7DFF D6 0C         [ 7] 4493 	sub	a, #0x0C
   7E01 20 05         [12] 4494 	jr	NZ,00107$
                           4495 ;src/main.c:839: cambio = 0;
   7E03 21 F6 62      [10] 4496 	ld	hl,#_cambio + 0
   7E06 36 00         [10] 4497 	ld	(hl), #0x00
   7E08                    4498 00107$:
                           4499 ;src/main.c:841: i = 2 + num_mapa;
   7E08 21 C6 63      [10] 4500 	ld	hl,#_num_mapa + 0
   7E0B 4E            [ 7] 4501 	ld	c, (hl)
   7E0C 0C            [ 4] 4502 	inc	c
   7E0D 0C            [ 4] 4503 	inc	c
                           4504 ;src/main.c:842: actual = enemy;
                           4505 ;src/main.c:844: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7E0E C5            [11] 4506 	push	bc
   7E0F 21 00 01      [10] 4507 	ld	hl,#_g_tablatrans
   7E12 E5            [11] 4508 	push	hl
   7E13 2A C4 63      [16] 4509 	ld	hl,(_mapa)
   7E16 E5            [11] 4510 	push	hl
   7E17 21 E2 62      [10] 4511 	ld	hl,#_prota
   7E1A E5            [11] 4512 	push	hl
   7E1B 21 EA 62      [10] 4513 	ld	hl,#_cu
   7E1E E5            [11] 4514 	push	hl
   7E1F CD C8 64      [17] 4515 	call	_comprobarTeclado
   7E22 21 08 00      [10] 4516 	ld	hl,#8
   7E25 39            [11] 4517 	add	hl,sp
   7E26 F9            [ 6] 4518 	ld	sp,hl
   7E27 2A C4 63      [16] 4519 	ld	hl,(_mapa)
   7E2A E5            [11] 4520 	push	hl
   7E2B 21 EA 62      [10] 4521 	ld	hl,#_cu
   7E2E E5            [11] 4522 	push	hl
   7E2F CD 2A 4A      [17] 4523 	call	_moverCuchillo
   7E32 F1            [10] 4524 	pop	af
   7E33 F1            [10] 4525 	pop	af
   7E34 C1            [10] 4526 	pop	bc
                           4527 ;src/main.c:846: while(i){
   7E35 DD 71 FF      [19] 4528 	ld	-1 (ix),c
   7E38 DD 36 F3 56   [19] 4529 	ld	-13 (ix),#<(_enemy)
   7E3C DD 36 F4 5F   [19] 4530 	ld	-12 (ix),#>(_enemy)
   7E40                    4531 00117$:
   7E40 DD 7E FF      [19] 4532 	ld	a,-1 (ix)
   7E43 B7            [ 4] 4533 	or	a, a
   7E44 28 62         [12] 4534 	jr	Z,00119$
                           4535 ;src/main.c:848: --i;
   7E46 DD 35 FF      [23] 4536 	dec	-1 (ix)
                           4537 ;src/main.c:849: if(!actual->muerto){
   7E49 DD 7E F3      [19] 4538 	ld	a,-13 (ix)
   7E4C C6 08         [ 7] 4539 	add	a, #0x08
   7E4E DD 77 F5      [19] 4540 	ld	-11 (ix),a
   7E51 DD 7E F4      [19] 4541 	ld	a,-12 (ix)
   7E54 CE 00         [ 7] 4542 	adc	a, #0x00
   7E56 DD 77 F6      [19] 4543 	ld	-10 (ix),a
   7E59 DD 6E F5      [19] 4544 	ld	l,-11 (ix)
   7E5C DD 66 F6      [19] 4545 	ld	h,-10 (ix)
   7E5F 7E            [ 7] 4546 	ld	a,(hl)
   7E60 B7            [ 4] 4547 	or	a, a
   7E61 20 0E         [12] 4548 	jr	NZ,00111$
                           4549 ;src/main.c:850: checkEnemyDead(cu.direccion, actual);
   7E63 21 F1 62      [10] 4550 	ld	hl, #_cu + 7
   7E66 46            [ 7] 4551 	ld	b,(hl)
   7E67 E1            [10] 4552 	pop	hl
   7E68 E5            [11] 4553 	push	hl
   7E69 E5            [11] 4554 	push	hl
   7E6A C5            [11] 4555 	push	bc
   7E6B 33            [ 6] 4556 	inc	sp
   7E6C CD 27 68      [17] 4557 	call	_checkEnemyDead
   7E6F F1            [10] 4558 	pop	af
   7E70 33            [ 6] 4559 	inc	sp
   7E71                    4560 00111$:
                           4561 ;src/main.c:852: if(!actual->muerto){
   7E71 DD 6E F5      [19] 4562 	ld	l,-11 (ix)
   7E74 DD 66 F6      [19] 4563 	ld	h,-10 (ix)
   7E77 7E            [ 7] 4564 	ld	a,(hl)
   7E78 B7            [ 4] 4565 	or	a, a
   7E79 20 1B         [12] 4566 	jr	NZ,00116$
                           4567 ;src/main.c:853: if (!actual->didDamage)
   7E7B DD 7E F3      [19] 4568 	ld	a,-13 (ix)
   7E7E C6 16         [ 7] 4569 	add	a, #0x16
   7E80 4F            [ 4] 4570 	ld	c,a
   7E81 DD 7E F4      [19] 4571 	ld	a,-12 (ix)
   7E84 CE 00         [ 7] 4572 	adc	a, #0x00
   7E86 47            [ 4] 4573 	ld	b,a
   7E87 0A            [ 7] 4574 	ld	a,(bc)
   7E88 B7            [ 4] 4575 	or	a, a
   7E89 20 09         [12] 4576 	jr	NZ,00113$
                           4577 ;src/main.c:854: updateEnemy(actual);
   7E8B E1            [10] 4578 	pop	hl
   7E8C E5            [11] 4579 	push	hl
   7E8D E5            [11] 4580 	push	hl
   7E8E CD 89 77      [17] 4581 	call	_updateEnemy
   7E91 F1            [10] 4582 	pop	af
   7E92 18 02         [12] 4583 	jr	00116$
   7E94                    4584 00113$:
                           4585 ;src/main.c:856: actual->didDamage = 0;
   7E94 AF            [ 4] 4586 	xor	a, a
   7E95 02            [ 7] 4587 	ld	(bc),a
   7E96                    4588 00116$:
                           4589 ;src/main.c:858: ++actual;
   7E96 DD 7E F3      [19] 4590 	ld	a,-13 (ix)
   7E99 C6 E3         [ 7] 4591 	add	a, #0xE3
   7E9B DD 77 F3      [19] 4592 	ld	-13 (ix),a
   7E9E DD 7E F4      [19] 4593 	ld	a,-12 (ix)
   7EA1 CE 00         [ 7] 4594 	adc	a, #0x00
   7EA3 DD 77 F4      [19] 4595 	ld	-12 (ix),a
   7EA6 18 98         [12] 4596 	jr	00117$
   7EA8                    4597 00119$:
                           4598 ;src/main.c:861: cpct_waitVSYNC();
   7EA8 CD B4 55      [17] 4599 	call	_cpct_waitVSYNC
                           4600 ;src/main.c:864: if (prota.mover) {
   7EAB 01 E8 62      [10] 4601 	ld	bc,#_prota + 6
   7EAE 0A            [ 7] 4602 	ld	a,(bc)
   7EAF B7            [ 4] 4603 	or	a, a
   7EB0 28 07         [12] 4604 	jr	Z,00121$
                           4605 ;src/main.c:865: redibujarProta();
   7EB2 C5            [11] 4606 	push	bc
   7EB3 CD B4 64      [17] 4607 	call	_redibujarProta
   7EB6 C1            [10] 4608 	pop	bc
                           4609 ;src/main.c:866: prota.mover = NO;
   7EB7 AF            [ 4] 4610 	xor	a, a
   7EB8 02            [ 7] 4611 	ld	(bc),a
   7EB9                    4612 00121$:
                           4613 ;src/main.c:868: if(cu.lanzado && cu.mover){
   7EB9 21 F0 62      [10] 4614 	ld	hl, #(_cu + 0x0006) + 0
   7EBC 4E            [ 7] 4615 	ld	c,(hl)
                           4616 ;src/main.c:869: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4617 ;src/main.c:868: if(cu.lanzado && cu.mover){
   7EBD 79            [ 4] 4618 	ld	a,c
   7EBE B7            [ 4] 4619 	or	a, a
   7EBF 28 30         [12] 4620 	jr	Z,00126$
   7EC1 3A F3 62      [13] 4621 	ld	a, (#(_cu + 0x0009) + 0)
   7EC4 B7            [ 4] 4622 	or	a, a
   7EC5 28 2A         [12] 4623 	jr	Z,00126$
                           4624 ;src/main.c:869: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7EC7 21 EB 62      [10] 4625 	ld	hl, #(_cu + 0x0001) + 0
   7ECA 4E            [ 7] 4626 	ld	c,(hl)
   7ECB 21 EA 62      [10] 4627 	ld	hl, #_cu + 0
   7ECE 46            [ 7] 4628 	ld	b,(hl)
   7ECF 21 F2 62      [10] 4629 	ld	hl, #(_cu + 0x0008) + 0
   7ED2 5E            [ 7] 4630 	ld	e,(hl)
   7ED3 2A C4 63      [16] 4631 	ld	hl,(_mapa)
   7ED6 E5            [11] 4632 	push	hl
   7ED7 21 00 01      [10] 4633 	ld	hl,#_g_tablatrans
   7EDA E5            [11] 4634 	push	hl
   7EDB 21 EA 62      [10] 4635 	ld	hl,#_cu
   7EDE E5            [11] 4636 	push	hl
   7EDF 79            [ 4] 4637 	ld	a,c
   7EE0 F5            [11] 4638 	push	af
   7EE1 33            [ 6] 4639 	inc	sp
   7EE2 C5            [11] 4640 	push	bc
   7EE3 33            [ 6] 4641 	inc	sp
   7EE4 7B            [ 4] 4642 	ld	a,e
   7EE5 F5            [11] 4643 	push	af
   7EE6 33            [ 6] 4644 	inc	sp
   7EE7 CD 4A 47      [17] 4645 	call	_redibujarCuchillo
   7EEA 21 09 00      [10] 4646 	ld	hl,#9
   7EED 39            [11] 4647 	add	hl,sp
   7EEE F9            [ 6] 4648 	ld	sp,hl
   7EEF 18 32         [12] 4649 	jr	00127$
   7EF1                    4650 00126$:
                           4651 ;src/main.c:870: }else if (cu.lanzado && !cu.mover){
   7EF1 79            [ 4] 4652 	ld	a,c
   7EF2 B7            [ 4] 4653 	or	a, a
   7EF3 28 2E         [12] 4654 	jr	Z,00127$
   7EF5 3A F3 62      [13] 4655 	ld	a, (#(_cu + 0x0009) + 0)
   7EF8 B7            [ 4] 4656 	or	a, a
   7EF9 20 28         [12] 4657 	jr	NZ,00127$
                           4658 ;src/main.c:871: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7EFB 21 EB 62      [10] 4659 	ld	hl, #(_cu + 0x0001) + 0
   7EFE 46            [ 7] 4660 	ld	b,(hl)
   7EFF 21 EA 62      [10] 4661 	ld	hl, #_cu + 0
   7F02 4E            [ 7] 4662 	ld	c,(hl)
   7F03 21 F2 62      [10] 4663 	ld	hl, #(_cu + 0x0008) + 0
   7F06 56            [ 7] 4664 	ld	d,(hl)
   7F07 2A C4 63      [16] 4665 	ld	hl,(_mapa)
   7F0A E5            [11] 4666 	push	hl
   7F0B C5            [11] 4667 	push	bc
   7F0C D5            [11] 4668 	push	de
   7F0D 33            [ 6] 4669 	inc	sp
   7F0E CD B7 46      [17] 4670 	call	_borrarCuchillo
   7F11 F1            [10] 4671 	pop	af
   7F12 F1            [10] 4672 	pop	af
   7F13 33            [ 6] 4673 	inc	sp
                           4674 ;src/main.c:872: cu.lanzado = NO;
   7F14 21 F0 62      [10] 4675 	ld	hl,#(_cu + 0x0006)
   7F17 36 00         [10] 4676 	ld	(hl),#0x00
                           4677 ;src/main.c:874: cu.x = 0;
   7F19 21 EA 62      [10] 4678 	ld	hl,#_cu
   7F1C 36 00         [10] 4679 	ld	(hl),#0x00
                           4680 ;src/main.c:875: cu.y=0;
   7F1E 21 EB 62      [10] 4681 	ld	hl,#(_cu + 0x0001)
   7F21 36 00         [10] 4682 	ld	(hl),#0x00
   7F23                    4683 00127$:
                           4684 ;src/main.c:878: i = 2 + num_mapa;
   7F23 21 C6 63      [10] 4685 	ld	hl,#_num_mapa + 0
   7F26 4E            [ 7] 4686 	ld	c, (hl)
   7F27 0C            [ 4] 4687 	inc	c
   7F28 0C            [ 4] 4688 	inc	c
                           4689 ;src/main.c:879: actual = enemy;
   7F29 11 56 5F      [10] 4690 	ld	de,#_enemy
                           4691 ;src/main.c:880: while(i){
   7F2C                    4692 00146$:
   7F2C 79            [ 4] 4693 	ld	a,c
   7F2D B7            [ 4] 4694 	or	a, a
   7F2E CA 9D 80      [10] 4695 	jp	Z,00148$
                           4696 ;src/main.c:882: --i;
   7F31 0D            [ 4] 4697 	dec	c
                           4698 ;src/main.c:883: if(actual->mover){
   7F32 21 06 00      [10] 4699 	ld	hl,#0x0006
   7F35 19            [11] 4700 	add	hl,de
   7F36 DD 75 F5      [19] 4701 	ld	-11 (ix),l
   7F39 DD 74 F6      [19] 4702 	ld	-10 (ix),h
   7F3C DD 6E F5      [19] 4703 	ld	l,-11 (ix)
   7F3F DD 66 F6      [19] 4704 	ld	h,-10 (ix)
   7F42 46            [ 7] 4705 	ld	b,(hl)
                           4706 ;src/main.c:884: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F43 21 03 00      [10] 4707 	ld	hl,#0x0003
   7F46 19            [11] 4708 	add	hl,de
   7F47 E3            [19] 4709 	ex	(sp), hl
   7F48 21 02 00      [10] 4710 	ld	hl,#0x0002
   7F4B 19            [11] 4711 	add	hl,de
   7F4C DD 75 F7      [19] 4712 	ld	-9 (ix),l
   7F4F DD 74 F8      [19] 4713 	ld	-8 (ix),h
                           4714 ;src/main.c:883: if(actual->mover){
   7F52 78            [ 4] 4715 	ld	a,b
   7F53 B7            [ 4] 4716 	or	a, a
   7F54 28 1E         [12] 4717 	jr	Z,00130$
                           4718 ;src/main.c:884: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F56 E1            [10] 4719 	pop	hl
   7F57 E5            [11] 4720 	push	hl
   7F58 7E            [ 7] 4721 	ld	a,(hl)
   7F59 DD 77 FF      [19] 4722 	ld	-1 (ix),a
   7F5C DD 6E F7      [19] 4723 	ld	l,-9 (ix)
   7F5F DD 66 F8      [19] 4724 	ld	h,-8 (ix)
   7F62 46            [ 7] 4725 	ld	b,(hl)
   7F63 C5            [11] 4726 	push	bc
   7F64 D5            [11] 4727 	push	de
   7F65 D5            [11] 4728 	push	de
   7F66 DD 7E FF      [19] 4729 	ld	a,-1 (ix)
   7F69 F5            [11] 4730 	push	af
   7F6A 33            [ 6] 4731 	inc	sp
   7F6B C5            [11] 4732 	push	bc
   7F6C 33            [ 6] 4733 	inc	sp
   7F6D CD F6 67      [17] 4734 	call	_redibujarEnemigo
   7F70 F1            [10] 4735 	pop	af
   7F71 F1            [10] 4736 	pop	af
   7F72 D1            [10] 4737 	pop	de
   7F73 C1            [10] 4738 	pop	bc
   7F74                    4739 00130$:
                           4740 ;src/main.c:887: if (actual->muerto && actual->muertes == 0){
   7F74 21 08 00      [10] 4741 	ld	hl,#0x0008
   7F77 19            [11] 4742 	add	hl,de
   7F78 DD 75 FB      [19] 4743 	ld	-5 (ix),l
   7F7B DD 74 FC      [19] 4744 	ld	-4 (ix),h
   7F7E DD 6E FB      [19] 4745 	ld	l,-5 (ix)
   7F81 DD 66 FC      [19] 4746 	ld	h,-4 (ix)
   7F84 7E            [ 7] 4747 	ld	a,(hl)
   7F85 B7            [ 4] 4748 	or	a, a
   7F86 CA 1C 80      [10] 4749 	jp	Z,00132$
   7F89 21 09 00      [10] 4750 	ld	hl,#0x0009
   7F8C 19            [11] 4751 	add	hl,de
   7F8D DD 75 FD      [19] 4752 	ld	-3 (ix),l
   7F90 DD 74 FE      [19] 4753 	ld	-2 (ix),h
   7F93 DD 6E FD      [19] 4754 	ld	l,-3 (ix)
   7F96 DD 66 FE      [19] 4755 	ld	h,-2 (ix)
   7F99 7E            [ 7] 4756 	ld	a,(hl)
   7F9A B7            [ 4] 4757 	or	a, a
   7F9B C2 1C 80      [10] 4758 	jp	NZ,00132$
                           4759 ;src/main.c:888: timer = 3;
   7F9E 21 03 00      [10] 4760 	ld	hl,#0x0003
   7FA1 22 F7 62      [16] 4761 	ld	(_timer),hl
                           4762 ;src/main.c:889: cambio++;
   7FA4 FD 21 F6 62   [14] 4763 	ld	iy,#_cambio
   7FA8 FD 34 00      [23] 4764 	inc	0 (iy)
                           4765 ;src/main.c:890: parpadeo = 1;
   7FAB FD 21 F5 62   [14] 4766 	ld	iy,#_parpadeo
   7FAF FD 36 00 01   [19] 4767 	ld	0 (iy),#0x01
                           4768 ;src/main.c:891: borrarEnemigo((*actual).x, (*actual).y);
   7FB3 2E 01         [ 7] 4769 	ld	l, #0x01
   7FB5 19            [11] 4770 	add	hl,de
   7FB6 DD 75 F9      [19] 4771 	ld	-7 (ix),l
   7FB9 DD 74 FA      [19] 4772 	ld	-6 (ix),h
   7FBC DD 6E F9      [19] 4773 	ld	l,-7 (ix)
   7FBF DD 66 FA      [19] 4774 	ld	h,-6 (ix)
   7FC2 46            [ 7] 4775 	ld	b,(hl)
   7FC3 1A            [ 7] 4776 	ld	a,(de)
   7FC4 C5            [11] 4777 	push	bc
   7FC5 D5            [11] 4778 	push	de
   7FC6 C5            [11] 4779 	push	bc
   7FC7 33            [ 6] 4780 	inc	sp
   7FC8 F5            [11] 4781 	push	af
   7FC9 33            [ 6] 4782 	inc	sp
   7FCA CD 81 67      [17] 4783 	call	_borrarEnemigo
   7FCD F1            [10] 4784 	pop	af
   7FCE D1            [10] 4785 	pop	de
   7FCF C1            [10] 4786 	pop	bc
                           4787 ;src/main.c:892: puntuacion_aux = puntuacion;
   7FD0 FD 21 C8 63   [14] 4788 	ld	iy,#_puntuacion
   7FD4 FD 6E 00      [19] 4789 	ld	l,0 (iy)
   7FD7 26 00         [ 7] 4790 	ld	h,#0x00
                           4791 ;src/main.c:893: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7FD9 C5            [11] 4792 	push	bc
   7FDA D5            [11] 4793 	push	de
   7FDB E5            [11] 4794 	push	hl
   7FDC CD 17 52      [17] 4795 	call	_aumentarPuntuacion
   7FDF F1            [10] 4796 	pop	af
   7FE0 D1            [10] 4797 	pop	de
   7FE1 C1            [10] 4798 	pop	bc
   7FE2 FD 21 C8 63   [14] 4799 	ld	iy,#_puntuacion
   7FE6 FD 75 00      [19] 4800 	ld	0 (iy),l
                           4801 ;src/main.c:894: modificarPuntuacion(puntuacion);
   7FE9 FD 21 C8 63   [14] 4802 	ld	iy,#_puntuacion
   7FED FD 6E 00      [19] 4803 	ld	l,0 (iy)
   7FF0 26 00         [ 7] 4804 	ld	h,#0x00
   7FF2 C5            [11] 4805 	push	bc
   7FF3 D5            [11] 4806 	push	de
   7FF4 E5            [11] 4807 	push	hl
   7FF5 CD AD 50      [17] 4808 	call	_modificarPuntuacion
   7FF8 F1            [10] 4809 	pop	af
   7FF9 D1            [10] 4810 	pop	de
   7FFA C1            [10] 4811 	pop	bc
                           4812 ;src/main.c:895: actual->mover = NO;
   7FFB DD 6E F5      [19] 4813 	ld	l,-11 (ix)
   7FFE DD 66 F6      [19] 4814 	ld	h,-10 (ix)
   8001 36 00         [10] 4815 	ld	(hl),#0x00
                           4816 ;src/main.c:896: actual->muertes++;
   8003 DD 6E FD      [19] 4817 	ld	l,-3 (ix)
   8006 DD 66 FE      [19] 4818 	ld	h,-2 (ix)
   8009 46            [ 7] 4819 	ld	b,(hl)
   800A 04            [ 4] 4820 	inc	b
   800B DD 6E FD      [19] 4821 	ld	l,-3 (ix)
   800E DD 66 FE      [19] 4822 	ld	h,-2 (ix)
   8011 70            [ 7] 4823 	ld	(hl),b
                           4824 ;src/main.c:897: actual->x = 0;
   8012 AF            [ 4] 4825 	xor	a, a
   8013 12            [ 7] 4826 	ld	(de),a
                           4827 ;src/main.c:898: actual->y = 0;
   8014 DD 6E F9      [19] 4828 	ld	l,-7 (ix)
   8017 DD 66 FA      [19] 4829 	ld	h,-6 (ix)
   801A 36 00         [10] 4830 	ld	(hl),#0x00
   801C                    4831 00132$:
                           4832 ;src/main.c:900: if(parpadeo && actual->muerto && !actual->xplot){
   801C 21 19 00      [10] 4833 	ld	hl,#0x0019
   801F 19            [11] 4834 	add	hl,de
   8020 DD 75 F9      [19] 4835 	ld	-7 (ix),l
   8023 DD 74 FA      [19] 4836 	ld	-6 (ix),h
   8026 3A F5 62      [13] 4837 	ld	a,(#_parpadeo + 0)
   8029 B7            [ 4] 4838 	or	a, a
   802A 28 1F         [12] 4839 	jr	Z,00142$
   802C DD 6E FB      [19] 4840 	ld	l,-5 (ix)
   802F DD 66 FC      [19] 4841 	ld	h,-4 (ix)
   8032 7E            [ 7] 4842 	ld	a,(hl)
   8033 B7            [ 4] 4843 	or	a, a
   8034 28 15         [12] 4844 	jr	Z,00142$
   8036 DD 6E F9      [19] 4845 	ld	l,-7 (ix)
   8039 DD 66 FA      [19] 4846 	ld	h,-6 (ix)
   803C 7E            [ 7] 4847 	ld	a,(hl)
   803D B7            [ 4] 4848 	or	a, a
   803E 20 0B         [12] 4849 	jr	NZ,00142$
                           4850 ;src/main.c:901: dibujarExplosion(actual);
   8040 C5            [11] 4851 	push	bc
   8041 D5            [11] 4852 	push	de
   8042 D5            [11] 4853 	push	de
   8043 CD D8 66      [17] 4854 	call	_dibujarExplosion
   8046 F1            [10] 4855 	pop	af
   8047 D1            [10] 4856 	pop	de
   8048 C1            [10] 4857 	pop	bc
   8049 18 4A         [12] 4858 	jr	00143$
   804B                    4859 00142$:
                           4860 ;src/main.c:902: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   804B 3A F5 62      [13] 4861 	ld	a,(#_parpadeo + 0)
   804E B7            [ 4] 4862 	or	a, a
   804F 20 44         [12] 4863 	jr	NZ,00143$
   8051 DD 6E FB      [19] 4864 	ld	l,-5 (ix)
   8054 DD 66 FC      [19] 4865 	ld	h,-4 (ix)
   8057 7E            [ 7] 4866 	ld	a,(hl)
   8058 B7            [ 4] 4867 	or	a, a
   8059 28 3A         [12] 4868 	jr	Z,00143$
   805B 3E 0C         [ 7] 4869 	ld	a,#0x0C
   805D FD 21 F6 62   [14] 4870 	ld	iy,#_cambio
   8061 FD 96 00      [19] 4871 	sub	a, 0 (iy)
   8064 38 2F         [12] 4872 	jr	C,00143$
   8066 DD 6E F9      [19] 4873 	ld	l,-7 (ix)
   8069 DD 66 FA      [19] 4874 	ld	h,-6 (ix)
   806C 7E            [ 7] 4875 	ld	a,(hl)
   806D B7            [ 4] 4876 	or	a, a
   806E 20 25         [12] 4877 	jr	NZ,00143$
                           4878 ;src/main.c:903: borrarExplosion((*actual).px, (*actual).py);
   8070 E1            [10] 4879 	pop	hl
   8071 E5            [11] 4880 	push	hl
   8072 7E            [ 7] 4881 	ld	a,(hl)
   8073 DD 6E F7      [19] 4882 	ld	l,-9 (ix)
   8076 DD 66 F8      [19] 4883 	ld	h,-8 (ix)
   8079 46            [ 7] 4884 	ld	b,(hl)
   807A C5            [11] 4885 	push	bc
   807B D5            [11] 4886 	push	de
   807C F5            [11] 4887 	push	af
   807D 33            [ 6] 4888 	inc	sp
   807E C5            [11] 4889 	push	bc
   807F 33            [ 6] 4890 	inc	sp
   8080 CD 11 67      [17] 4891 	call	_borrarExplosion
   8083 F1            [10] 4892 	pop	af
   8084 D1            [10] 4893 	pop	de
   8085 C1            [10] 4894 	pop	bc
                           4895 ;src/main.c:904: if(cambio == 12){
   8086 3A F6 62      [13] 4896 	ld	a,(#_cambio + 0)
   8089 D6 0C         [ 7] 4897 	sub	a, #0x0C
   808B 20 08         [12] 4898 	jr	NZ,00143$
                           4899 ;src/main.c:905: actual->xplot = SI;
   808D DD 6E F9      [19] 4900 	ld	l,-7 (ix)
   8090 DD 66 FA      [19] 4901 	ld	h,-6 (ix)
   8093 36 01         [10] 4902 	ld	(hl),#0x01
   8095                    4903 00143$:
                           4904 ;src/main.c:908: ++actual;
   8095 21 E3 00      [10] 4905 	ld	hl,#0x00E3
   8098 19            [11] 4906 	add	hl,de
   8099 EB            [ 4] 4907 	ex	de,hl
   809A C3 2C 7F      [10] 4908 	jp	00146$
   809D                    4909 00148$:
                           4910 ;src/main.c:910: cpct_waitVSYNC();
   809D CD B4 55      [17] 4911 	call	_cpct_waitVSYNC
   80A0 C3 A1 7D      [10] 4912 	jp	00150$
                           4913 	.area _CODE
                           4914 	.area _INITIALIZER
   63C9                    4915 __xinit__mapa:
   63C9 00 00              4916 	.dw #0x0000
   63CB                    4917 __xinit__num_mapa:
   63CB 00                 4918 	.db #0x00	; 0
   63CC                    4919 __xinit__endGame:
   63CC 00                 4920 	.db #0x00	; 0
   63CD                    4921 __xinit__puntuacion:
   63CD 00                 4922 	.db #0x00	; 0
                           4923 	.area _CABS (ABS)
