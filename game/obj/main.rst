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
                             58 	.globl _cpct_akp_musicInit
                             59 	.globl _cpct_getScreenPtr
                             60 	.globl _cpct_setPALColour
                             61 	.globl _cpct_setPalette
                             62 	.globl _cpct_waitVSYNC
                             63 	.globl _cpct_setVideoMode
                             64 	.globl _cpct_drawStringM0
                             65 	.globl _cpct_drawCharM0
                             66 	.globl _cpct_drawSpriteMaskedAlignedTable
                             67 	.globl _cpct_isAnyKeyPressed
                             68 	.globl _cpct_isKeyPressed
                             69 	.globl _cpct_scanKeyboard_if
                             70 	.globl _cpct_scanKeyboard_f
                             71 	.globl _cpct_memset
                             72 	.globl _cpct_setInterruptHandler
                             73 	.globl _cpct_disableFirmware
                             74 	.globl _i
                             75 	.globl _vidas
                             76 	.globl _puntuacion
                             77 	.globl _endGame
                             78 	.globl _num_mapa
                             79 	.globl _mapa
                             80 	.globl _timer
                             81 	.globl _cambio
                             82 	.globl _parpadeo
                             83 	.globl _cu
                             84 	.globl _prota
                             85 	.globl _enemy
                             86 	.globl _patrolY
                             87 	.globl _patrolX
                             88 	.globl _spawnY
                             89 	.globl _spawnX
                             90 	.globl _mapas
                             91 ;--------------------------------------------------------
                             92 ; special function registers
                             93 ;--------------------------------------------------------
                             94 ;--------------------------------------------------------
                             95 ; ram data
                             96 ;--------------------------------------------------------
                             97 	.area _DATA
   5F8E                      98 _enemy::
   5F8E                      99 	.ds 908
   631A                     100 _prota::
   631A                     101 	.ds 8
   6322                     102 _cu::
   6322                     103 	.ds 11
   632D                     104 _parpadeo::
   632D                     105 	.ds 1
   632E                     106 _cambio::
   632E                     107 	.ds 1
   632F                     108 _timer::
   632F                     109 	.ds 2
   6331                     110 _mapa::
   6331                     111 	.ds 2
   6333                     112 _num_mapa::
   6333                     113 	.ds 1
   6334                     114 _endGame::
   6334                     115 	.ds 1
   6335                     116 _puntuacion::
   6335                     117 	.ds 1
   6336                     118 _vidas::
   6336                     119 	.ds 1
   6337                     120 _i::
   6337                     121 	.ds 1
                            122 ;--------------------------------------------------------
                            123 ; ram data
                            124 ;--------------------------------------------------------
                            125 	.area _INITIALIZED
                            126 ;--------------------------------------------------------
                            127 ; absolute external ram data
                            128 ;--------------------------------------------------------
                            129 	.area _DABS (ABS)
                            130 ;--------------------------------------------------------
                            131 ; global & static initialisations
                            132 ;--------------------------------------------------------
                            133 	.area _HOME
                            134 	.area _GSINIT
                            135 	.area _GSFINAL
                            136 	.area _GSINIT
                            137 ;--------------------------------------------------------
                            138 ; Home
                            139 ;--------------------------------------------------------
                            140 	.area _HOME
                            141 	.area _HOME
                            142 ;--------------------------------------------------------
                            143 ; code
                            144 ;--------------------------------------------------------
                            145 	.area _CODE
                            146 ;src/main.c:112: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            147 ;	---------------------------------
                            148 ; Function dummy_cpct_transparentMaskTable0M0_container
                            149 ; ---------------------------------
   445C                     150 _dummy_cpct_transparentMaskTable0M0_container::
                            151 	.area _g_tablatrans_ (ABS) 
   0100                     152 	.org 0x0100 
   0100                     153 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   154 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   155 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   156 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   158 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   159 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   162 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   164 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   170 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   171 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   172 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   173 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   174 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   175 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   176 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   177 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   178 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   179 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   180 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   181 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   182 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   183 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   184 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   185 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            186 	.area _CSEG (REL, CON) 
                            187 ;src/main.c:115: void dibujarMapa() {
                            188 ;	---------------------------------
                            189 ; Function dibujarMapa
                            190 ; ---------------------------------
   6401                     191 _dibujarMapa::
                            192 ;src/main.c:118: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6401 2A 31 63      [16]  193 	ld	hl,(_mapa)
   6404 E5            [11]  194 	push	hl
   6405 21 F0 C0      [10]  195 	ld	hl,#0xC0F0
   6408 E5            [11]  196 	push	hl
   6409 21 2C 28      [10]  197 	ld	hl,#0x282C
   640C E5            [11]  198 	push	hl
   640D 2E 00         [ 7]  199 	ld	l, #0x00
   640F E5            [11]  200 	push	hl
   6410 AF            [ 4]  201 	xor	a, a
   6411 F5            [11]  202 	push	af
   6412 33            [ 6]  203 	inc	sp
   6413 CD ED 53      [17]  204 	call	_cpct_etm_drawTileBox2x4
   6416 C9            [10]  205 	ret
   6417                     206 _mapas:
   6417 C0 10               207 	.dw _g_map1
   6419 E0 09               208 	.dw _g_map2
   641B 00 03               209 	.dw _g_map3
   641D                     210 _spawnX:
   641D 24                  211 	.db #0x24	; 36
   641E 47                  212 	.db #0x47	; 71	'G'
   641F 30                  213 	.db #0x30	; 48	'0'
   6420 18                  214 	.db #0x18	; 24
   6421                     215 _spawnY:
   6421 2C                  216 	.db #0x2C	; 44
   6422 66                  217 	.db #0x66	; 102	'f'
   6423 9A                  218 	.db #0x9A	; 154
   6424 40                  219 	.db #0x40	; 64
   6425                     220 _patrolX:
   6425 00                  221 	.db #0x00	; 0
   6426 00                  222 	.db #0x00	; 0
   6427 00                  223 	.db #0x00	; 0
   6428 00                  224 	.db #0x00	; 0
   6429 00                  225 	.db #0x00	; 0
   642A 42                  226 	.db #0x42	; 66	'B'
   642B 33                  227 	.db #0x33	; 51	'3'
   642C 00                  228 	.db #0x00	; 0
   642D 00                  229 	.db #0x00	; 0
   642E 00                  230 	.db 0x00
   642F 10                  231 	.db #0x10	; 16
   6430 33                  232 	.db #0x33	; 51	'3'
   6431 19                  233 	.db #0x19	; 25
   6432 00                  234 	.db #0x00	; 0
   6433 00                  235 	.db 0x00
   6434 24                  236 	.db #0x24	; 36
   6435 3C                  237 	.db #0x3C	; 60
   6436 30                  238 	.db #0x30	; 48	'0'
   6437 18                  239 	.db #0x18	; 24
   6438 00                  240 	.db 0x00
   6439                     241 _patrolY:
   6439 00                  242 	.db #0x00	; 0
   643A 00                  243 	.db #0x00	; 0
   643B 00                  244 	.db #0x00	; 0
   643C 00                  245 	.db #0x00	; 0
   643D 00                  246 	.db 0x00
   643E 5E                  247 	.db #0x5E	; 94
   643F A6                  248 	.db #0xA6	; 166
   6440 00                  249 	.db #0x00	; 0
   6441 00                  250 	.db #0x00	; 0
   6442 00                  251 	.db 0x00
   6443 2C                  252 	.db #0x2C	; 44
   6444 66                  253 	.db #0x66	; 102	'f'
   6445 9A                  254 	.db #0x9A	; 154
   6446 00                  255 	.db #0x00	; 0
   6447 00                  256 	.db 0x00
   6448 90                  257 	.db #0x90	; 144
   6449 66                  258 	.db #0x66	; 102	'f'
   644A 2C                  259 	.db #0x2C	; 44
   644B 86                  260 	.db #0x86	; 134
   644C 00                  261 	.db 0x00
                            262 ;src/main.c:121: void dibujarProta() {
                            263 ;	---------------------------------
                            264 ; Function dibujarProta
                            265 ; ---------------------------------
   644D                     266 _dibujarProta::
                            267 ;src/main.c:122: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   644D 21 1B 63      [10]  268 	ld	hl, #_prota + 1
   6450 56            [ 7]  269 	ld	d,(hl)
   6451 21 1A 63      [10]  270 	ld	hl, #_prota + 0
   6454 46            [ 7]  271 	ld	b,(hl)
   6455 D5            [11]  272 	push	de
   6456 33            [ 6]  273 	inc	sp
   6457 C5            [11]  274 	push	bc
   6458 33            [ 6]  275 	inc	sp
   6459 21 00 C0      [10]  276 	ld	hl,#0xC000
   645C E5            [11]  277 	push	hl
   645D CD 0B 5F      [17]  278 	call	_cpct_getScreenPtr
   6460 EB            [ 4]  279 	ex	de,hl
                            280 ;src/main.c:123: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6461 ED 4B 1E 63   [20]  281 	ld	bc, (#_prota + 4)
   6465 21 00 01      [10]  282 	ld	hl,#_g_tablatrans
   6468 E5            [11]  283 	push	hl
   6469 21 07 16      [10]  284 	ld	hl,#0x1607
   646C E5            [11]  285 	push	hl
   646D D5            [11]  286 	push	de
   646E C5            [11]  287 	push	bc
   646F CD 2B 5F      [17]  288 	call	_cpct_drawSpriteMaskedAlignedTable
   6472 C9            [10]  289 	ret
                            290 ;src/main.c:126: void borrarProta() {
                            291 ;	---------------------------------
                            292 ; Function borrarProta
                            293 ; ---------------------------------
   6473                     294 _borrarProta::
   6473 DD E5         [15]  295 	push	ix
   6475 DD 21 00 00   [14]  296 	ld	ix,#0
   6479 DD 39         [15]  297 	add	ix,sp
   647B F5            [11]  298 	push	af
   647C 3B            [ 6]  299 	dec	sp
                            300 ;src/main.c:130: u8 w = 4 + (prota.px & 1);
   647D 21 1C 63      [10]  301 	ld	hl, #_prota + 2
   6480 4E            [ 7]  302 	ld	c,(hl)
   6481 79            [ 4]  303 	ld	a,c
   6482 E6 01         [ 7]  304 	and	a, #0x01
   6484 47            [ 4]  305 	ld	b,a
   6485 04            [ 4]  306 	inc	b
   6486 04            [ 4]  307 	inc	b
   6487 04            [ 4]  308 	inc	b
   6488 04            [ 4]  309 	inc	b
                            310 ;src/main.c:133: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6489 21 1D 63      [10]  311 	ld	hl, #_prota + 3
   648C 5E            [ 7]  312 	ld	e,(hl)
   648D CB 4B         [ 8]  313 	bit	1, e
   648F 28 04         [12]  314 	jr	Z,00103$
   6491 3E 01         [ 7]  315 	ld	a,#0x01
   6493 18 02         [12]  316 	jr	00104$
   6495                     317 00103$:
   6495 3E 00         [ 7]  318 	ld	a,#0x00
   6497                     319 00104$:
   6497 C6 06         [ 7]  320 	add	a, #0x06
   6499 DD 77 FD      [19]  321 	ld	-3 (ix),a
                            322 ;src/main.c:135: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   649C FD 2A 31 63   [20]  323 	ld	iy,(_mapa)
   64A0 16 00         [ 7]  324 	ld	d,#0x00
   64A2 7B            [ 4]  325 	ld	a,e
   64A3 C6 E8         [ 7]  326 	add	a,#0xE8
   64A5 DD 77 FE      [19]  327 	ld	-2 (ix),a
   64A8 7A            [ 4]  328 	ld	a,d
   64A9 CE FF         [ 7]  329 	adc	a,#0xFF
   64AB DD 77 FF      [19]  330 	ld	-1 (ix),a
   64AE DD 6E FE      [19]  331 	ld	l,-2 (ix)
   64B1 DD 66 FF      [19]  332 	ld	h,-1 (ix)
   64B4 DD CB FF 7E   [20]  333 	bit	7, -1 (ix)
   64B8 28 04         [12]  334 	jr	Z,00105$
   64BA 21 EB FF      [10]  335 	ld	hl,#0xFFEB
   64BD 19            [11]  336 	add	hl,de
   64BE                     337 00105$:
   64BE CB 2C         [ 8]  338 	sra	h
   64C0 CB 1D         [ 8]  339 	rr	l
   64C2 CB 2C         [ 8]  340 	sra	h
   64C4 CB 1D         [ 8]  341 	rr	l
   64C6 55            [ 4]  342 	ld	d,l
   64C7 CB 39         [ 8]  343 	srl	c
   64C9 FD E5         [15]  344 	push	iy
   64CB 21 F0 C0      [10]  345 	ld	hl,#0xC0F0
   64CE E5            [11]  346 	push	hl
   64CF 3E 28         [ 7]  347 	ld	a,#0x28
   64D1 F5            [11]  348 	push	af
   64D2 33            [ 6]  349 	inc	sp
   64D3 DD 7E FD      [19]  350 	ld	a,-3 (ix)
   64D6 F5            [11]  351 	push	af
   64D7 33            [ 6]  352 	inc	sp
   64D8 C5            [11]  353 	push	bc
   64D9 33            [ 6]  354 	inc	sp
   64DA D5            [11]  355 	push	de
   64DB 33            [ 6]  356 	inc	sp
   64DC 79            [ 4]  357 	ld	a,c
   64DD F5            [11]  358 	push	af
   64DE 33            [ 6]  359 	inc	sp
   64DF CD ED 53      [17]  360 	call	_cpct_etm_drawTileBox2x4
   64E2 DD F9         [10]  361 	ld	sp, ix
   64E4 DD E1         [14]  362 	pop	ix
   64E6 C9            [10]  363 	ret
                            364 ;src/main.c:138: void redibujarProta() {
                            365 ;	---------------------------------
                            366 ; Function redibujarProta
                            367 ; ---------------------------------
   64E7                     368 _redibujarProta::
                            369 ;src/main.c:139: borrarProta();
   64E7 CD 73 64      [17]  370 	call	_borrarProta
                            371 ;src/main.c:140: prota.px = prota.x;
   64EA 01 1C 63      [10]  372 	ld	bc,#_prota + 2
   64ED 3A 1A 63      [13]  373 	ld	a, (#_prota + 0)
   64F0 02            [ 7]  374 	ld	(bc),a
                            375 ;src/main.c:141: prota.py = prota.y;
   64F1 01 1D 63      [10]  376 	ld	bc,#_prota + 3
   64F4 3A 1B 63      [13]  377 	ld	a, (#_prota + 1)
   64F7 02            [ 7]  378 	ld	(bc),a
                            379 ;src/main.c:142: dibujarProta();
   64F8 C3 4D 64      [10]  380 	jp  _dibujarProta
                            381 ;src/main.c:145: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            382 ;	---------------------------------
                            383 ; Function comprobarTeclado
                            384 ; ---------------------------------
   64FB                     385 _comprobarTeclado::
                            386 ;src/main.c:146: cpct_scanKeyboard_if();
   64FB CD 5C 55      [17]  387 	call	_cpct_scanKeyboard_if
                            388 ;src/main.c:148: if (cpct_isAnyKeyPressed()) {
   64FE CD 4F 55      [17]  389 	call	_cpct_isAnyKeyPressed
   6501 7D            [ 4]  390 	ld	a,l
   6502 B7            [ 4]  391 	or	a, a
   6503 C8            [11]  392 	ret	Z
                            393 ;src/main.c:149: if (cpct_isKeyPressed(Key_CursorLeft)){
   6504 21 01 01      [10]  394 	ld	hl,#0x0101
   6507 CD A2 52      [17]  395 	call	_cpct_isKeyPressed
   650A 7D            [ 4]  396 	ld	a,l
   650B B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:150: moverIzquierda();
   650C C2 AD 79      [10]  399 	jp	NZ,_moverIzquierda
                            400 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorRight)){
   650F 21 00 02      [10]  401 	ld	hl,#0x0200
   6512 CD A2 52      [17]  402 	call	_cpct_isKeyPressed
   6515 7D            [ 4]  403 	ld	a,l
   6516 B7            [ 4]  404 	or	a, a
                            405 ;src/main.c:152: moverDerecha();
   6517 C2 D2 79      [10]  406 	jp	NZ,_moverDerecha
                            407 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_CursorUp)){
   651A 21 00 01      [10]  408 	ld	hl,#0x0100
   651D CD A2 52      [17]  409 	call	_cpct_isKeyPressed
   6520 7D            [ 4]  410 	ld	a,l
   6521 B7            [ 4]  411 	or	a, a
                            412 ;src/main.c:154: moverArriba();
   6522 C2 17 7A      [10]  413 	jp	NZ,_moverArriba
                            414 ;src/main.c:155: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6525 21 00 04      [10]  415 	ld	hl,#0x0400
   6528 CD A2 52      [17]  416 	call	_cpct_isKeyPressed
   652B 7D            [ 4]  417 	ld	a,l
   652C B7            [ 4]  418 	or	a, a
                            419 ;src/main.c:156: moverAbajo();
   652D C2 3B 7A      [10]  420 	jp	NZ,_moverAbajo
                            421 ;src/main.c:157: }else if (cpct_isKeyPressed(Key_Space)){
   6530 21 05 80      [10]  422 	ld	hl,#0x8005
   6533 CD A2 52      [17]  423 	call	_cpct_isKeyPressed
   6536 7D            [ 4]  424 	ld	a,l
   6537 B7            [ 4]  425 	or	a, a
   6538 C8            [11]  426 	ret	Z
                            427 ;src/main.c:158: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6539 21 08 00      [10]  428 	ld	hl, #8
   653C 39            [11]  429 	add	hl, sp
   653D 4E            [ 7]  430 	ld	c, (hl)
   653E 23            [ 6]  431 	inc	hl
   653F 46            [ 7]  432 	ld	b, (hl)
   6540 C5            [11]  433 	push	bc
   6541 21 08 00      [10]  434 	ld	hl, #8
   6544 39            [11]  435 	add	hl, sp
   6545 4E            [ 7]  436 	ld	c, (hl)
   6546 23            [ 6]  437 	inc	hl
   6547 46            [ 7]  438 	ld	b, (hl)
   6548 C5            [11]  439 	push	bc
   6549 21 08 00      [10]  440 	ld	hl, #8
   654C 39            [11]  441 	add	hl, sp
   654D 4E            [ 7]  442 	ld	c, (hl)
   654E 23            [ 6]  443 	inc	hl
   654F 46            [ 7]  444 	ld	b, (hl)
   6550 C5            [11]  445 	push	bc
   6551 21 08 00      [10]  446 	ld	hl, #8
   6554 39            [11]  447 	add	hl, sp
   6555 4E            [ 7]  448 	ld	c, (hl)
   6556 23            [ 6]  449 	inc	hl
   6557 46            [ 7]  450 	ld	b, (hl)
   6558 C5            [11]  451 	push	bc
   6559 CD 6C 40      [17]  452 	call	_lanzarCuchillo
   655C 21 08 00      [10]  453 	ld	hl,#8
   655F 39            [11]  454 	add	hl,sp
   6560 F9            [ 6]  455 	ld	sp,hl
   6561 C9            [10]  456 	ret
                            457 ;src/main.c:163: u8 checkCollision(u8 direction) { // check optimization
                            458 ;	---------------------------------
                            459 ; Function checkCollision
                            460 ; ---------------------------------
   6562                     461 _checkCollision::
   6562 DD E5         [15]  462 	push	ix
   6564 DD 21 00 00   [14]  463 	ld	ix,#0
   6568 DD 39         [15]  464 	add	ix,sp
   656A F5            [11]  465 	push	af
                            466 ;src/main.c:164: u8 *headTile=0, *feetTile=0, *waistTile=0;
   656B 21 00 00      [10]  467 	ld	hl,#0x0000
   656E E3            [19]  468 	ex	(sp), hl
   656F 11 00 00      [10]  469 	ld	de,#0x0000
   6572 01 00 00      [10]  470 	ld	bc,#0x0000
                            471 ;src/main.c:166: switch (direction) {
   6575 3E 03         [ 7]  472 	ld	a,#0x03
   6577 DD 96 04      [19]  473 	sub	a, 4 (ix)
   657A DA B2 66      [10]  474 	jp	C,00105$
   657D DD 5E 04      [19]  475 	ld	e,4 (ix)
   6580 16 00         [ 7]  476 	ld	d,#0x00
   6582 21 89 65      [10]  477 	ld	hl,#00124$
   6585 19            [11]  478 	add	hl,de
   6586 19            [11]  479 	add	hl,de
   6587 19            [11]  480 	add	hl,de
   6588 E9            [ 4]  481 	jp	(hl)
   6589                     482 00124$:
   6589 C3 95 65      [10]  483 	jp	00101$
   658C C3 EA 65      [10]  484 	jp	00102$
   658F C3 3A 66      [10]  485 	jp	00103$
   6592 C3 77 66      [10]  486 	jp	00104$
                            487 ;src/main.c:167: case 0:
   6595                     488 00101$:
                            489 ;src/main.c:168: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   6595 21 1B 63      [10]  490 	ld	hl, #(_prota + 0x0001) + 0
   6598 4E            [ 7]  491 	ld	c,(hl)
   6599 3A 1A 63      [13]  492 	ld	a, (#_prota + 0)
   659C C6 07         [ 7]  493 	add	a, #0x07
   659E 47            [ 4]  494 	ld	b,a
   659F 79            [ 4]  495 	ld	a,c
   65A0 F5            [11]  496 	push	af
   65A1 33            [ 6]  497 	inc	sp
   65A2 C5            [11]  498 	push	bc
   65A3 33            [ 6]  499 	inc	sp
   65A4 2A 31 63      [16]  500 	ld	hl,(_mapa)
   65A7 E5            [11]  501 	push	hl
   65A8 CD 71 4B      [17]  502 	call	_getTilePtr
   65AB F1            [10]  503 	pop	af
   65AC F1            [10]  504 	pop	af
   65AD 33            [ 6]  505 	inc	sp
   65AE 33            [ 6]  506 	inc	sp
   65AF E5            [11]  507 	push	hl
                            508 ;src/main.c:169: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   65B0 3A 1B 63      [13]  509 	ld	a, (#(_prota + 0x0001) + 0)
   65B3 C6 14         [ 7]  510 	add	a, #0x14
   65B5 4F            [ 4]  511 	ld	c,a
   65B6 3A 1A 63      [13]  512 	ld	a, (#_prota + 0)
   65B9 C6 07         [ 7]  513 	add	a, #0x07
   65BB 47            [ 4]  514 	ld	b,a
   65BC 79            [ 4]  515 	ld	a,c
   65BD F5            [11]  516 	push	af
   65BE 33            [ 6]  517 	inc	sp
   65BF C5            [11]  518 	push	bc
   65C0 33            [ 6]  519 	inc	sp
   65C1 2A 31 63      [16]  520 	ld	hl,(_mapa)
   65C4 E5            [11]  521 	push	hl
   65C5 CD 71 4B      [17]  522 	call	_getTilePtr
   65C8 F1            [10]  523 	pop	af
   65C9 F1            [10]  524 	pop	af
   65CA EB            [ 4]  525 	ex	de,hl
                            526 ;src/main.c:170: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   65CB 3A 1B 63      [13]  527 	ld	a, (#(_prota + 0x0001) + 0)
   65CE C6 0B         [ 7]  528 	add	a, #0x0B
   65D0 47            [ 4]  529 	ld	b,a
   65D1 3A 1A 63      [13]  530 	ld	a, (#_prota + 0)
   65D4 C6 07         [ 7]  531 	add	a, #0x07
   65D6 D5            [11]  532 	push	de
   65D7 C5            [11]  533 	push	bc
   65D8 33            [ 6]  534 	inc	sp
   65D9 F5            [11]  535 	push	af
   65DA 33            [ 6]  536 	inc	sp
   65DB 2A 31 63      [16]  537 	ld	hl,(_mapa)
   65DE E5            [11]  538 	push	hl
   65DF CD 71 4B      [17]  539 	call	_getTilePtr
   65E2 F1            [10]  540 	pop	af
   65E3 F1            [10]  541 	pop	af
   65E4 4D            [ 4]  542 	ld	c,l
   65E5 44            [ 4]  543 	ld	b,h
   65E6 D1            [10]  544 	pop	de
                            545 ;src/main.c:171: break;
   65E7 C3 B2 66      [10]  546 	jp	00105$
                            547 ;src/main.c:172: case 1:
   65EA                     548 00102$:
                            549 ;src/main.c:173: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   65EA 21 1B 63      [10]  550 	ld	hl, #(_prota + 0x0001) + 0
   65ED 56            [ 7]  551 	ld	d,(hl)
   65EE 21 1A 63      [10]  552 	ld	hl, #_prota + 0
   65F1 46            [ 7]  553 	ld	b,(hl)
   65F2 05            [ 4]  554 	dec	b
   65F3 D5            [11]  555 	push	de
   65F4 33            [ 6]  556 	inc	sp
   65F5 C5            [11]  557 	push	bc
   65F6 33            [ 6]  558 	inc	sp
   65F7 2A 31 63      [16]  559 	ld	hl,(_mapa)
   65FA E5            [11]  560 	push	hl
   65FB CD 71 4B      [17]  561 	call	_getTilePtr
   65FE F1            [10]  562 	pop	af
   65FF F1            [10]  563 	pop	af
   6600 33            [ 6]  564 	inc	sp
   6601 33            [ 6]  565 	inc	sp
   6602 E5            [11]  566 	push	hl
                            567 ;src/main.c:174: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6603 3A 1B 63      [13]  568 	ld	a, (#(_prota + 0x0001) + 0)
   6606 C6 14         [ 7]  569 	add	a, #0x14
   6608 57            [ 4]  570 	ld	d,a
   6609 21 1A 63      [10]  571 	ld	hl, #_prota + 0
   660C 46            [ 7]  572 	ld	b,(hl)
   660D 05            [ 4]  573 	dec	b
   660E D5            [11]  574 	push	de
   660F 33            [ 6]  575 	inc	sp
   6610 C5            [11]  576 	push	bc
   6611 33            [ 6]  577 	inc	sp
   6612 2A 31 63      [16]  578 	ld	hl,(_mapa)
   6615 E5            [11]  579 	push	hl
   6616 CD 71 4B      [17]  580 	call	_getTilePtr
   6619 F1            [10]  581 	pop	af
   661A F1            [10]  582 	pop	af
   661B EB            [ 4]  583 	ex	de,hl
                            584 ;src/main.c:175: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   661C 3A 1B 63      [13]  585 	ld	a, (#(_prota + 0x0001) + 0)
   661F C6 0B         [ 7]  586 	add	a, #0x0B
   6621 47            [ 4]  587 	ld	b,a
   6622 3A 1A 63      [13]  588 	ld	a, (#_prota + 0)
   6625 C6 FF         [ 7]  589 	add	a,#0xFF
   6627 D5            [11]  590 	push	de
   6628 C5            [11]  591 	push	bc
   6629 33            [ 6]  592 	inc	sp
   662A F5            [11]  593 	push	af
   662B 33            [ 6]  594 	inc	sp
   662C 2A 31 63      [16]  595 	ld	hl,(_mapa)
   662F E5            [11]  596 	push	hl
   6630 CD 71 4B      [17]  597 	call	_getTilePtr
   6633 F1            [10]  598 	pop	af
   6634 F1            [10]  599 	pop	af
   6635 4D            [ 4]  600 	ld	c,l
   6636 44            [ 4]  601 	ld	b,h
   6637 D1            [10]  602 	pop	de
                            603 ;src/main.c:176: break;
   6638 18 78         [12]  604 	jr	00105$
                            605 ;src/main.c:177: case 2:
   663A                     606 00103$:
                            607 ;src/main.c:178: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   663A 3A 1B 63      [13]  608 	ld	a, (#(_prota + 0x0001) + 0)
   663D C6 FE         [ 7]  609 	add	a,#0xFE
   663F 21 1A 63      [10]  610 	ld	hl, #_prota + 0
   6642 56            [ 7]  611 	ld	d,(hl)
   6643 C5            [11]  612 	push	bc
   6644 F5            [11]  613 	push	af
   6645 33            [ 6]  614 	inc	sp
   6646 D5            [11]  615 	push	de
   6647 33            [ 6]  616 	inc	sp
   6648 2A 31 63      [16]  617 	ld	hl,(_mapa)
   664B E5            [11]  618 	push	hl
   664C CD 71 4B      [17]  619 	call	_getTilePtr
   664F F1            [10]  620 	pop	af
   6650 F1            [10]  621 	pop	af
   6651 C1            [10]  622 	pop	bc
   6652 33            [ 6]  623 	inc	sp
   6653 33            [ 6]  624 	inc	sp
   6654 E5            [11]  625 	push	hl
                            626 ;src/main.c:179: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6655 21 1B 63      [10]  627 	ld	hl, #(_prota + 0x0001) + 0
   6658 56            [ 7]  628 	ld	d,(hl)
   6659 15            [ 4]  629 	dec	d
   665A 15            [ 4]  630 	dec	d
   665B 3A 1A 63      [13]  631 	ld	a, (#_prota + 0)
   665E C6 03         [ 7]  632 	add	a, #0x03
   6660 C5            [11]  633 	push	bc
   6661 D5            [11]  634 	push	de
   6662 33            [ 6]  635 	inc	sp
   6663 F5            [11]  636 	push	af
   6664 33            [ 6]  637 	inc	sp
   6665 2A 31 63      [16]  638 	ld	hl,(_mapa)
   6668 E5            [11]  639 	push	hl
   6669 CD 71 4B      [17]  640 	call	_getTilePtr
   666C F1            [10]  641 	pop	af
   666D F1            [10]  642 	pop	af
   666E EB            [ 4]  643 	ex	de,hl
   666F C1            [10]  644 	pop	bc
                            645 ;src/main.c:180: *waistTile = 0;
   6670 21 00 00      [10]  646 	ld	hl,#0x0000
   6673 36 00         [10]  647 	ld	(hl),#0x00
                            648 ;src/main.c:181: break;
   6675 18 3B         [12]  649 	jr	00105$
                            650 ;src/main.c:182: case 3:
   6677                     651 00104$:
                            652 ;src/main.c:183: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6677 3A 1B 63      [13]  653 	ld	a, (#(_prota + 0x0001) + 0)
   667A C6 16         [ 7]  654 	add	a, #0x16
   667C 21 1A 63      [10]  655 	ld	hl, #_prota + 0
   667F 56            [ 7]  656 	ld	d,(hl)
   6680 C5            [11]  657 	push	bc
   6681 F5            [11]  658 	push	af
   6682 33            [ 6]  659 	inc	sp
   6683 D5            [11]  660 	push	de
   6684 33            [ 6]  661 	inc	sp
   6685 2A 31 63      [16]  662 	ld	hl,(_mapa)
   6688 E5            [11]  663 	push	hl
   6689 CD 71 4B      [17]  664 	call	_getTilePtr
   668C F1            [10]  665 	pop	af
   668D F1            [10]  666 	pop	af
   668E C1            [10]  667 	pop	bc
   668F 33            [ 6]  668 	inc	sp
   6690 33            [ 6]  669 	inc	sp
   6691 E5            [11]  670 	push	hl
                            671 ;src/main.c:184: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6692 3A 1B 63      [13]  672 	ld	a, (#(_prota + 0x0001) + 0)
   6695 C6 16         [ 7]  673 	add	a, #0x16
   6697 57            [ 4]  674 	ld	d,a
   6698 3A 1A 63      [13]  675 	ld	a, (#_prota + 0)
   669B C6 03         [ 7]  676 	add	a, #0x03
   669D C5            [11]  677 	push	bc
   669E D5            [11]  678 	push	de
   669F 33            [ 6]  679 	inc	sp
   66A0 F5            [11]  680 	push	af
   66A1 33            [ 6]  681 	inc	sp
   66A2 2A 31 63      [16]  682 	ld	hl,(_mapa)
   66A5 E5            [11]  683 	push	hl
   66A6 CD 71 4B      [17]  684 	call	_getTilePtr
   66A9 F1            [10]  685 	pop	af
   66AA F1            [10]  686 	pop	af
   66AB EB            [ 4]  687 	ex	de,hl
   66AC C1            [10]  688 	pop	bc
                            689 ;src/main.c:185: *waistTile = 0;
   66AD 21 00 00      [10]  690 	ld	hl,#0x0000
   66B0 36 00         [10]  691 	ld	(hl),#0x00
                            692 ;src/main.c:187: }
   66B2                     693 00105$:
                            694 ;src/main.c:189: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   66B2 E1            [10]  695 	pop	hl
   66B3 E5            [11]  696 	push	hl
   66B4 6E            [ 7]  697 	ld	l,(hl)
   66B5 3E 02         [ 7]  698 	ld	a,#0x02
   66B7 95            [ 4]  699 	sub	a, l
   66B8 38 0E         [12]  700 	jr	C,00106$
   66BA 1A            [ 7]  701 	ld	a,(de)
   66BB 5F            [ 4]  702 	ld	e,a
   66BC 3E 02         [ 7]  703 	ld	a,#0x02
   66BE 93            [ 4]  704 	sub	a, e
   66BF 38 07         [12]  705 	jr	C,00106$
   66C1 0A            [ 7]  706 	ld	a,(bc)
   66C2 4F            [ 4]  707 	ld	c,a
   66C3 3E 02         [ 7]  708 	ld	a,#0x02
   66C5 91            [ 4]  709 	sub	a, c
   66C6 30 04         [12]  710 	jr	NC,00107$
   66C8                     711 00106$:
                            712 ;src/main.c:190: return 1;
   66C8 2E 01         [ 7]  713 	ld	l,#0x01
   66CA 18 02         [12]  714 	jr	00110$
   66CC                     715 00107$:
                            716 ;src/main.c:192: return 0;
   66CC 2E 00         [ 7]  717 	ld	l,#0x00
   66CE                     718 00110$:
   66CE DD F9         [10]  719 	ld	sp, ix
   66D0 DD E1         [14]  720 	pop	ix
   66D2 C9            [10]  721 	ret
                            722 ;src/main.c:195: void dibujarEnemigo(TEnemy *enemy) {
                            723 ;	---------------------------------
                            724 ; Function dibujarEnemigo
                            725 ; ---------------------------------
   66D3                     726 _dibujarEnemigo::
   66D3 DD E5         [15]  727 	push	ix
   66D5 DD 21 00 00   [14]  728 	ld	ix,#0
   66D9 DD 39         [15]  729 	add	ix,sp
                            730 ;src/main.c:196: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66DB DD 4E 04      [19]  731 	ld	c,4 (ix)
   66DE DD 46 05      [19]  732 	ld	b,5 (ix)
   66E1 69            [ 4]  733 	ld	l, c
   66E2 60            [ 4]  734 	ld	h, b
   66E3 23            [ 6]  735 	inc	hl
   66E4 56            [ 7]  736 	ld	d,(hl)
   66E5 0A            [ 7]  737 	ld	a,(bc)
   66E6 C5            [11]  738 	push	bc
   66E7 D5            [11]  739 	push	de
   66E8 33            [ 6]  740 	inc	sp
   66E9 F5            [11]  741 	push	af
   66EA 33            [ 6]  742 	inc	sp
   66EB 21 00 C0      [10]  743 	ld	hl,#0xC000
   66EE E5            [11]  744 	push	hl
   66EF CD 0B 5F      [17]  745 	call	_cpct_getScreenPtr
   66F2 EB            [ 4]  746 	ex	de,hl
                            747 ;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   66F3 E1            [10]  748 	pop	hl
   66F4 01 04 00      [10]  749 	ld	bc, #0x0004
   66F7 09            [11]  750 	add	hl, bc
   66F8 4E            [ 7]  751 	ld	c,(hl)
   66F9 23            [ 6]  752 	inc	hl
   66FA 46            [ 7]  753 	ld	b,(hl)
   66FB 21 00 01      [10]  754 	ld	hl,#_g_tablatrans
   66FE E5            [11]  755 	push	hl
   66FF 21 04 16      [10]  756 	ld	hl,#0x1604
   6702 E5            [11]  757 	push	hl
   6703 D5            [11]  758 	push	de
   6704 C5            [11]  759 	push	bc
   6705 CD 2B 5F      [17]  760 	call	_cpct_drawSpriteMaskedAlignedTable
   6708 DD E1         [14]  761 	pop	ix
   670A C9            [10]  762 	ret
                            763 ;src/main.c:200: void dibujarExplosion(TEnemy *enemy) {
                            764 ;	---------------------------------
                            765 ; Function dibujarExplosion
                            766 ; ---------------------------------
   670B                     767 _dibujarExplosion::
   670B DD E5         [15]  768 	push	ix
   670D DD 21 00 00   [14]  769 	ld	ix,#0
   6711 DD 39         [15]  770 	add	ix,sp
                            771 ;src/main.c:201: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   6713 DD 4E 04      [19]  772 	ld	c,4 (ix)
   6716 DD 46 05      [19]  773 	ld	b,5 (ix)
   6719 69            [ 4]  774 	ld	l, c
   671A 60            [ 4]  775 	ld	h, b
   671B 23            [ 6]  776 	inc	hl
   671C 23            [ 6]  777 	inc	hl
   671D 23            [ 6]  778 	inc	hl
   671E 56            [ 7]  779 	ld	d,(hl)
   671F 69            [ 4]  780 	ld	l, c
   6720 60            [ 4]  781 	ld	h, b
   6721 23            [ 6]  782 	inc	hl
   6722 23            [ 6]  783 	inc	hl
   6723 46            [ 7]  784 	ld	b,(hl)
   6724 D5            [11]  785 	push	de
   6725 33            [ 6]  786 	inc	sp
   6726 C5            [11]  787 	push	bc
   6727 33            [ 6]  788 	inc	sp
   6728 21 00 C0      [10]  789 	ld	hl,#0xC000
   672B E5            [11]  790 	push	hl
   672C CD 0B 5F      [17]  791 	call	_cpct_getScreenPtr
   672F 4D            [ 4]  792 	ld	c,l
   6730 44            [ 4]  793 	ld	b,h
                            794 ;src/main.c:202: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6731 11 00 01      [10]  795 	ld	de,#_g_tablatrans+0
   6734 D5            [11]  796 	push	de
   6735 21 04 16      [10]  797 	ld	hl,#0x1604
   6738 E5            [11]  798 	push	hl
   6739 C5            [11]  799 	push	bc
   673A 21 70 19      [10]  800 	ld	hl,#_g_explosion
   673D E5            [11]  801 	push	hl
   673E CD 2B 5F      [17]  802 	call	_cpct_drawSpriteMaskedAlignedTable
   6741 DD E1         [14]  803 	pop	ix
   6743 C9            [10]  804 	ret
                            805 ;src/main.c:205: void borrarExplosion(u8 x, u8 y) {
                            806 ;	---------------------------------
                            807 ; Function borrarExplosion
                            808 ; ---------------------------------
   6744                     809 _borrarExplosion::
   6744 DD E5         [15]  810 	push	ix
   6746 DD 21 00 00   [14]  811 	ld	ix,#0
   674A DD 39         [15]  812 	add	ix,sp
   674C F5            [11]  813 	push	af
   674D F5            [11]  814 	push	af
                            815 ;src/main.c:208: u8 w = 4 + (x & 1);
   674E DD 7E 04      [19]  816 	ld	a,4 (ix)
   6751 E6 01         [ 7]  817 	and	a, #0x01
   6753 4F            [ 4]  818 	ld	c,a
   6754 0C            [ 4]  819 	inc	c
   6755 0C            [ 4]  820 	inc	c
   6756 0C            [ 4]  821 	inc	c
   6757 0C            [ 4]  822 	inc	c
                            823 ;src/main.c:209: u8 h = 6 + (y & 3 ? 1 : 0);
   6758 DD 7E 05      [19]  824 	ld	a,5 (ix)
   675B E6 03         [ 7]  825 	and	a, #0x03
   675D 28 04         [12]  826 	jr	Z,00103$
   675F 3E 01         [ 7]  827 	ld	a,#0x01
   6761 18 02         [12]  828 	jr	00104$
   6763                     829 00103$:
   6763 3E 00         [ 7]  830 	ld	a,#0x00
   6765                     831 00104$:
   6765 C6 06         [ 7]  832 	add	a, #0x06
   6767 47            [ 4]  833 	ld	b,a
                            834 ;src/main.c:211: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6768 2A 31 63      [16]  835 	ld	hl,(_mapa)
   676B E3            [19]  836 	ex	(sp), hl
   676C DD 5E 05      [19]  837 	ld	e,5 (ix)
   676F 16 00         [ 7]  838 	ld	d,#0x00
   6771 7B            [ 4]  839 	ld	a,e
   6772 C6 E8         [ 7]  840 	add	a,#0xE8
   6774 DD 77 FE      [19]  841 	ld	-2 (ix),a
   6777 7A            [ 4]  842 	ld	a,d
   6778 CE FF         [ 7]  843 	adc	a,#0xFF
   677A DD 77 FF      [19]  844 	ld	-1 (ix),a
   677D DD 6E FE      [19]  845 	ld	l,-2 (ix)
   6780 DD 66 FF      [19]  846 	ld	h,-1 (ix)
   6783 DD CB FF 7E   [20]  847 	bit	7, -1 (ix)
   6787 28 04         [12]  848 	jr	Z,00105$
   6789 21 EB FF      [10]  849 	ld	hl,#0xFFEB
   678C 19            [11]  850 	add	hl,de
   678D                     851 00105$:
   678D CB 2C         [ 8]  852 	sra	h
   678F CB 1D         [ 8]  853 	rr	l
   6791 CB 2C         [ 8]  854 	sra	h
   6793 CB 1D         [ 8]  855 	rr	l
   6795 5D            [ 4]  856 	ld	e,l
   6796 DD 56 04      [19]  857 	ld	d,4 (ix)
   6799 CB 3A         [ 8]  858 	srl	d
   679B E1            [10]  859 	pop	hl
   679C E5            [11]  860 	push	hl
   679D E5            [11]  861 	push	hl
   679E 21 F0 C0      [10]  862 	ld	hl,#0xC0F0
   67A1 E5            [11]  863 	push	hl
   67A2 3E 28         [ 7]  864 	ld	a,#0x28
   67A4 F5            [11]  865 	push	af
   67A5 33            [ 6]  866 	inc	sp
   67A6 C5            [11]  867 	push	bc
   67A7 7B            [ 4]  868 	ld	a,e
   67A8 F5            [11]  869 	push	af
   67A9 33            [ 6]  870 	inc	sp
   67AA D5            [11]  871 	push	de
   67AB 33            [ 6]  872 	inc	sp
   67AC CD ED 53      [17]  873 	call	_cpct_etm_drawTileBox2x4
   67AF DD F9         [10]  874 	ld	sp, ix
   67B1 DD E1         [14]  875 	pop	ix
   67B3 C9            [10]  876 	ret
                            877 ;src/main.c:215: void borrarEnemigo(u8 x, u8 y) {
                            878 ;	---------------------------------
                            879 ; Function borrarEnemigo
                            880 ; ---------------------------------
   67B4                     881 _borrarEnemigo::
   67B4 DD E5         [15]  882 	push	ix
   67B6 DD 21 00 00   [14]  883 	ld	ix,#0
   67BA DD 39         [15]  884 	add	ix,sp
   67BC F5            [11]  885 	push	af
   67BD F5            [11]  886 	push	af
                            887 ;src/main.c:219: u8 w = 4 + (x & 1);
   67BE DD 7E 04      [19]  888 	ld	a,4 (ix)
   67C1 E6 01         [ 7]  889 	and	a, #0x01
   67C3 4F            [ 4]  890 	ld	c,a
   67C4 0C            [ 4]  891 	inc	c
   67C5 0C            [ 4]  892 	inc	c
   67C6 0C            [ 4]  893 	inc	c
   67C7 0C            [ 4]  894 	inc	c
                            895 ;src/main.c:221: u8 h = 6 + (y & 3 ? 1 : 0);
   67C8 DD 7E 05      [19]  896 	ld	a,5 (ix)
   67CB E6 03         [ 7]  897 	and	a, #0x03
   67CD 28 04         [12]  898 	jr	Z,00103$
   67CF 3E 01         [ 7]  899 	ld	a,#0x01
   67D1 18 02         [12]  900 	jr	00104$
   67D3                     901 00103$:
   67D3 3E 00         [ 7]  902 	ld	a,#0x00
   67D5                     903 00104$:
   67D5 C6 06         [ 7]  904 	add	a, #0x06
   67D7 47            [ 4]  905 	ld	b,a
                            906 ;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   67D8 2A 31 63      [16]  907 	ld	hl,(_mapa)
   67DB E3            [19]  908 	ex	(sp), hl
   67DC DD 5E 05      [19]  909 	ld	e,5 (ix)
   67DF 16 00         [ 7]  910 	ld	d,#0x00
   67E1 7B            [ 4]  911 	ld	a,e
   67E2 C6 E8         [ 7]  912 	add	a,#0xE8
   67E4 DD 77 FE      [19]  913 	ld	-2 (ix),a
   67E7 7A            [ 4]  914 	ld	a,d
   67E8 CE FF         [ 7]  915 	adc	a,#0xFF
   67EA DD 77 FF      [19]  916 	ld	-1 (ix),a
   67ED DD 6E FE      [19]  917 	ld	l,-2 (ix)
   67F0 DD 66 FF      [19]  918 	ld	h,-1 (ix)
   67F3 DD CB FF 7E   [20]  919 	bit	7, -1 (ix)
   67F7 28 04         [12]  920 	jr	Z,00105$
   67F9 21 EB FF      [10]  921 	ld	hl,#0xFFEB
   67FC 19            [11]  922 	add	hl,de
   67FD                     923 00105$:
   67FD CB 2C         [ 8]  924 	sra	h
   67FF CB 1D         [ 8]  925 	rr	l
   6801 CB 2C         [ 8]  926 	sra	h
   6803 CB 1D         [ 8]  927 	rr	l
   6805 5D            [ 4]  928 	ld	e,l
   6806 DD 56 04      [19]  929 	ld	d,4 (ix)
   6809 CB 3A         [ 8]  930 	srl	d
   680B E1            [10]  931 	pop	hl
   680C E5            [11]  932 	push	hl
   680D E5            [11]  933 	push	hl
   680E 21 F0 C0      [10]  934 	ld	hl,#0xC0F0
   6811 E5            [11]  935 	push	hl
   6812 3E 28         [ 7]  936 	ld	a,#0x28
   6814 F5            [11]  937 	push	af
   6815 33            [ 6]  938 	inc	sp
   6816 C5            [11]  939 	push	bc
   6817 7B            [ 4]  940 	ld	a,e
   6818 F5            [11]  941 	push	af
   6819 33            [ 6]  942 	inc	sp
   681A D5            [11]  943 	push	de
   681B 33            [ 6]  944 	inc	sp
   681C CD ED 53      [17]  945 	call	_cpct_etm_drawTileBox2x4
   681F DD F9         [10]  946 	ld	sp, ix
   6821 DD E1         [14]  947 	pop	ix
   6823 C9            [10]  948 	ret
                            949 ;src/main.c:226: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            950 ;	---------------------------------
                            951 ; Function redibujarEnemigo
                            952 ; ---------------------------------
   6824                     953 _redibujarEnemigo::
   6824 DD E5         [15]  954 	push	ix
   6826 DD 21 00 00   [14]  955 	ld	ix,#0
   682A DD 39         [15]  956 	add	ix,sp
                            957 ;src/main.c:227: borrarEnemigo(x, y);
   682C DD 66 05      [19]  958 	ld	h,5 (ix)
   682F DD 6E 04      [19]  959 	ld	l,4 (ix)
   6832 E5            [11]  960 	push	hl
   6833 CD B4 67      [17]  961 	call	_borrarEnemigo
   6836 F1            [10]  962 	pop	af
                            963 ;src/main.c:228: enemy->px = enemy->x;
   6837 DD 4E 06      [19]  964 	ld	c,6 (ix)
   683A DD 46 07      [19]  965 	ld	b,7 (ix)
   683D 59            [ 4]  966 	ld	e, c
   683E 50            [ 4]  967 	ld	d, b
   683F 13            [ 6]  968 	inc	de
   6840 13            [ 6]  969 	inc	de
   6841 0A            [ 7]  970 	ld	a,(bc)
   6842 12            [ 7]  971 	ld	(de),a
                            972 ;src/main.c:229: enemy->py = enemy->y;
   6843 59            [ 4]  973 	ld	e, c
   6844 50            [ 4]  974 	ld	d, b
   6845 13            [ 6]  975 	inc	de
   6846 13            [ 6]  976 	inc	de
   6847 13            [ 6]  977 	inc	de
   6848 69            [ 4]  978 	ld	l, c
   6849 60            [ 4]  979 	ld	h, b
   684A 23            [ 6]  980 	inc	hl
   684B 7E            [ 7]  981 	ld	a,(hl)
   684C 12            [ 7]  982 	ld	(de),a
                            983 ;src/main.c:230: dibujarEnemigo(enemy);
   684D C5            [11]  984 	push	bc
   684E CD D3 66      [17]  985 	call	_dibujarEnemigo
   6851 F1            [10]  986 	pop	af
   6852 DD E1         [14]  987 	pop	ix
   6854 C9            [10]  988 	ret
                            989 ;src/main.c:234: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            990 ;	---------------------------------
                            991 ; Function checkEnemyDead
                            992 ; ---------------------------------
   6855                     993 _checkEnemyDead::
   6855 DD E5         [15]  994 	push	ix
   6857 DD 21 00 00   [14]  995 	ld	ix,#0
   685B DD 39         [15]  996 	add	ix,sp
   685D 21 FA FF      [10]  997 	ld	hl,#-6
   6860 39            [11]  998 	add	hl,sp
   6861 F9            [ 6]  999 	ld	sp,hl
                           1000 ;src/main.c:236: switch (direction) {
   6862 3E 03         [ 7] 1001 	ld	a,#0x03
   6864 DD 96 04      [19] 1002 	sub	a, 4 (ix)
   6867 DA 43 6A      [10] 1003 	jp	C,00134$
                           1004 ;src/main.c:240: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   686A DD 7E 05      [19] 1005 	ld	a,5 (ix)
   686D DD 77 FA      [19] 1006 	ld	-6 (ix),a
   6870 DD 7E 06      [19] 1007 	ld	a,6 (ix)
   6873 DD 77 FB      [19] 1008 	ld	-5 (ix),a
   6876 DD 7E FA      [19] 1009 	ld	a,-6 (ix)
   6879 C6 01         [ 7] 1010 	add	a, #0x01
   687B DD 77 FC      [19] 1011 	ld	-4 (ix),a
   687E DD 7E FB      [19] 1012 	ld	a,-5 (ix)
   6881 CE 00         [ 7] 1013 	adc	a, #0x00
   6883 DD 77 FD      [19] 1014 	ld	-3 (ix),a
                           1015 ;src/main.c:243: enemy->muerto = SI;
   6886 DD 7E FA      [19] 1016 	ld	a,-6 (ix)
   6889 C6 08         [ 7] 1017 	add	a, #0x08
   688B DD 77 FE      [19] 1018 	ld	-2 (ix),a
   688E DD 7E FB      [19] 1019 	ld	a,-5 (ix)
   6891 CE 00         [ 7] 1020 	adc	a, #0x00
   6893 DD 77 FF      [19] 1021 	ld	-1 (ix),a
                           1022 ;src/main.c:236: switch (direction) {
   6896 DD 5E 04      [19] 1023 	ld	e,4 (ix)
   6899 16 00         [ 7] 1024 	ld	d,#0x00
   689B 21 A2 68      [10] 1025 	ld	hl,#00204$
   689E 19            [11] 1026 	add	hl,de
   689F 19            [11] 1027 	add	hl,de
   68A0 19            [11] 1028 	add	hl,de
   68A1 E9            [ 4] 1029 	jp	(hl)
   68A2                    1030 00204$:
   68A2 C3 AE 68      [10] 1031 	jp	00101$
   68A5 C3 16 69      [10] 1032 	jp	00109$
   68A8 C3 7E 69      [10] 1033 	jp	00117$
   68AB C3 E5 69      [10] 1034 	jp	00125$
                           1035 ;src/main.c:239: case 0:
   68AE                    1036 00101$:
                           1037 ;src/main.c:240: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   68AE 21 23 63      [10] 1038 	ld	hl, #_cu + 1
   68B1 4E            [ 7] 1039 	ld	c,(hl)
   68B2 06 00         [ 7] 1040 	ld	b,#0x00
   68B4 21 04 00      [10] 1041 	ld	hl,#0x0004
   68B7 09            [11] 1042 	add	hl,bc
   68B8 EB            [ 4] 1043 	ex	de,hl
   68B9 DD 6E FC      [19] 1044 	ld	l,-4 (ix)
   68BC DD 66 FD      [19] 1045 	ld	h,-3 (ix)
   68BF 6E            [ 7] 1046 	ld	l,(hl)
   68C0 26 00         [ 7] 1047 	ld	h,#0x00
   68C2 7B            [ 4] 1048 	ld	a,e
   68C3 95            [ 4] 1049 	sub	a, l
   68C4 7A            [ 4] 1050 	ld	a,d
   68C5 9C            [ 4] 1051 	sbc	a, h
   68C6 E2 CB 68      [10] 1052 	jp	PO, 00205$
   68C9 EE 80         [ 7] 1053 	xor	a, #0x80
   68CB                    1054 00205$:
   68CB FA 43 6A      [10] 1055 	jp	M,00134$
   68CE 11 16 00      [10] 1056 	ld	de,#0x0016
   68D1 19            [11] 1057 	add	hl,de
   68D2 7D            [ 4] 1058 	ld	a,l
   68D3 91            [ 4] 1059 	sub	a, c
   68D4 7C            [ 4] 1060 	ld	a,h
   68D5 98            [ 4] 1061 	sbc	a, b
   68D6 E2 DB 68      [10] 1062 	jp	PO, 00206$
   68D9 EE 80         [ 7] 1063 	xor	a, #0x80
   68DB                    1064 00206$:
   68DB FA 43 6A      [10] 1065 	jp	M,00134$
                           1066 ;src/main.c:241: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   68DE E1            [10] 1067 	pop	hl
   68DF E5            [11] 1068 	push	hl
   68E0 4E            [ 7] 1069 	ld	c,(hl)
   68E1 21 22 63      [10] 1070 	ld	hl, #_cu + 0
   68E4 5E            [ 7] 1071 	ld	e,(hl)
   68E5 16 00         [ 7] 1072 	ld	d,#0x00
   68E7 13            [ 6] 1073 	inc	de
   68E8 13            [ 6] 1074 	inc	de
   68E9 13            [ 6] 1075 	inc	de
   68EA 13            [ 6] 1076 	inc	de
   68EB 69            [ 4] 1077 	ld	l,c
   68EC 26 00         [ 7] 1078 	ld	h,#0x00
   68EE 7B            [ 4] 1079 	ld	a,e
   68EF 95            [ 4] 1080 	sub	a, l
   68F0 7A            [ 4] 1081 	ld	a,d
   68F1 9C            [ 4] 1082 	sbc	a, h
   68F2 E2 F7 68      [10] 1083 	jp	PO, 00207$
   68F5 EE 80         [ 7] 1084 	xor	a, #0x80
   68F7                    1085 00207$:
   68F7 F2 43 6A      [10] 1086 	jp	P,00134$
                           1087 ;src/main.c:242: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   68FA BF            [ 4] 1088 	cp	a, a
   68FB ED 52         [15] 1089 	sbc	hl, de
   68FD 3E 01         [ 7] 1090 	ld	a,#0x01
   68FF BD            [ 4] 1091 	cp	a, l
   6900 3E 00         [ 7] 1092 	ld	a,#0x00
   6902 9C            [ 4] 1093 	sbc	a, h
   6903 E2 08 69      [10] 1094 	jp	PO, 00208$
   6906 EE 80         [ 7] 1095 	xor	a, #0x80
   6908                    1096 00208$:
   6908 FA 43 6A      [10] 1097 	jp	M,00134$
                           1098 ;src/main.c:243: enemy->muerto = SI;
   690B DD 6E FE      [19] 1099 	ld	l,-2 (ix)
   690E DD 66 FF      [19] 1100 	ld	h,-1 (ix)
   6911 36 01         [10] 1101 	ld	(hl),#0x01
                           1102 ;src/main.c:247: break;
   6913 C3 43 6A      [10] 1103 	jp	00134$
                           1104 ;src/main.c:248: case 1:
   6916                    1105 00109$:
                           1106 ;src/main.c:249: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6916 21 23 63      [10] 1107 	ld	hl, #_cu + 1
   6919 4E            [ 7] 1108 	ld	c,(hl)
   691A 06 00         [ 7] 1109 	ld	b,#0x00
   691C 21 04 00      [10] 1110 	ld	hl,#0x0004
   691F 09            [11] 1111 	add	hl,bc
   6920 EB            [ 4] 1112 	ex	de,hl
   6921 DD 6E FC      [19] 1113 	ld	l,-4 (ix)
   6924 DD 66 FD      [19] 1114 	ld	h,-3 (ix)
   6927 6E            [ 7] 1115 	ld	l,(hl)
   6928 26 00         [ 7] 1116 	ld	h,#0x00
   692A 7B            [ 4] 1117 	ld	a,e
   692B 95            [ 4] 1118 	sub	a, l
   692C 7A            [ 4] 1119 	ld	a,d
   692D 9C            [ 4] 1120 	sbc	a, h
   692E E2 33 69      [10] 1121 	jp	PO, 00209$
   6931 EE 80         [ 7] 1122 	xor	a, #0x80
   6933                    1123 00209$:
   6933 FA 43 6A      [10] 1124 	jp	M,00134$
   6936 11 16 00      [10] 1125 	ld	de,#0x0016
   6939 19            [11] 1126 	add	hl,de
   693A 7D            [ 4] 1127 	ld	a,l
   693B 91            [ 4] 1128 	sub	a, c
   693C 7C            [ 4] 1129 	ld	a,h
   693D 98            [ 4] 1130 	sbc	a, b
   693E E2 43 69      [10] 1131 	jp	PO, 00210$
   6941 EE 80         [ 7] 1132 	xor	a, #0x80
   6943                    1133 00210$:
   6943 FA 43 6A      [10] 1134 	jp	M,00134$
                           1135 ;src/main.c:250: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6946 21 22 63      [10] 1136 	ld	hl, #_cu + 0
   6949 4E            [ 7] 1137 	ld	c,(hl)
   694A E1            [10] 1138 	pop	hl
   694B E5            [11] 1139 	push	hl
   694C 5E            [ 7] 1140 	ld	e,(hl)
   694D 16 00         [ 7] 1141 	ld	d,#0x00
   694F 13            [ 6] 1142 	inc	de
   6950 13            [ 6] 1143 	inc	de
   6951 13            [ 6] 1144 	inc	de
   6952 13            [ 6] 1145 	inc	de
   6953 69            [ 4] 1146 	ld	l,c
   6954 26 00         [ 7] 1147 	ld	h,#0x00
   6956 7B            [ 4] 1148 	ld	a,e
   6957 95            [ 4] 1149 	sub	a, l
   6958 7A            [ 4] 1150 	ld	a,d
   6959 9C            [ 4] 1151 	sbc	a, h
   695A E2 5F 69      [10] 1152 	jp	PO, 00211$
   695D EE 80         [ 7] 1153 	xor	a, #0x80
   695F                    1154 00211$:
   695F F2 43 6A      [10] 1155 	jp	P,00134$
                           1156 ;src/main.c:251: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6962 BF            [ 4] 1157 	cp	a, a
   6963 ED 52         [15] 1158 	sbc	hl, de
   6965 3E 01         [ 7] 1159 	ld	a,#0x01
   6967 BD            [ 4] 1160 	cp	a, l
   6968 3E 00         [ 7] 1161 	ld	a,#0x00
   696A 9C            [ 4] 1162 	sbc	a, h
   696B E2 70 69      [10] 1163 	jp	PO, 00212$
   696E EE 80         [ 7] 1164 	xor	a, #0x80
   6970                    1165 00212$:
   6970 FA 43 6A      [10] 1166 	jp	M,00134$
                           1167 ;src/main.c:252: enemy->muerto = SI;
   6973 DD 6E FE      [19] 1168 	ld	l,-2 (ix)
   6976 DD 66 FF      [19] 1169 	ld	h,-1 (ix)
   6979 36 01         [10] 1170 	ld	(hl),#0x01
                           1171 ;src/main.c:256: break;
   697B C3 43 6A      [10] 1172 	jp	00134$
                           1173 ;src/main.c:258: case 2:
   697E                    1174 00117$:
                           1175 ;src/main.c:259: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   697E 21 22 63      [10] 1176 	ld	hl, #_cu + 0
   6981 4E            [ 7] 1177 	ld	c,(hl)
   6982 06 00         [ 7] 1178 	ld	b,#0x00
   6984 59            [ 4] 1179 	ld	e, c
   6985 50            [ 4] 1180 	ld	d, b
   6986 13            [ 6] 1181 	inc	de
   6987 13            [ 6] 1182 	inc	de
   6988 E1            [10] 1183 	pop	hl
   6989 E5            [11] 1184 	push	hl
   698A 6E            [ 7] 1185 	ld	l,(hl)
   698B 26 00         [ 7] 1186 	ld	h,#0x00
   698D 7B            [ 4] 1187 	ld	a,e
   698E 95            [ 4] 1188 	sub	a, l
   698F 7A            [ 4] 1189 	ld	a,d
   6990 9C            [ 4] 1190 	sbc	a, h
   6991 E2 96 69      [10] 1191 	jp	PO, 00213$
   6994 EE 80         [ 7] 1192 	xor	a, #0x80
   6996                    1193 00213$:
   6996 FA 43 6A      [10] 1194 	jp	M,00134$
   6999 11 04 00      [10] 1195 	ld	de,#0x0004
   699C 19            [11] 1196 	add	hl,de
   699D 7D            [ 4] 1197 	ld	a,l
   699E 91            [ 4] 1198 	sub	a, c
   699F 7C            [ 4] 1199 	ld	a,h
   69A0 98            [ 4] 1200 	sbc	a, b
   69A1 E2 A6 69      [10] 1201 	jp	PO, 00214$
   69A4 EE 80         [ 7] 1202 	xor	a, #0x80
   69A6                    1203 00214$:
   69A6 FA 43 6A      [10] 1204 	jp	M,00134$
                           1205 ;src/main.c:260: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   69A9 21 23 63      [10] 1206 	ld	hl, #(_cu + 0x0001) + 0
   69AC 4E            [ 7] 1207 	ld	c,(hl)
   69AD DD 6E FC      [19] 1208 	ld	l,-4 (ix)
   69B0 DD 66 FD      [19] 1209 	ld	h,-3 (ix)
   69B3 5E            [ 7] 1210 	ld	e,(hl)
   69B4 16 00         [ 7] 1211 	ld	d,#0x00
   69B6 21 16 00      [10] 1212 	ld	hl,#0x0016
   69B9 19            [11] 1213 	add	hl,de
   69BA EB            [ 4] 1214 	ex	de,hl
   69BB 69            [ 4] 1215 	ld	l,c
   69BC 26 00         [ 7] 1216 	ld	h,#0x00
   69BE 7B            [ 4] 1217 	ld	a,e
   69BF 95            [ 4] 1218 	sub	a, l
   69C0 7A            [ 4] 1219 	ld	a,d
   69C1 9C            [ 4] 1220 	sbc	a, h
   69C2 E2 C7 69      [10] 1221 	jp	PO, 00215$
   69C5 EE 80         [ 7] 1222 	xor	a, #0x80
   69C7                    1223 00215$:
   69C7 F2 43 6A      [10] 1224 	jp	P,00134$
                           1225 ;src/main.c:261: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   69CA BF            [ 4] 1226 	cp	a, a
   69CB ED 52         [15] 1227 	sbc	hl, de
   69CD 3E 02         [ 7] 1228 	ld	a,#0x02
   69CF BD            [ 4] 1229 	cp	a, l
   69D0 3E 00         [ 7] 1230 	ld	a,#0x00
   69D2 9C            [ 4] 1231 	sbc	a, h
   69D3 E2 D8 69      [10] 1232 	jp	PO, 00216$
   69D6 EE 80         [ 7] 1233 	xor	a, #0x80
   69D8                    1234 00216$:
   69D8 FA 43 6A      [10] 1235 	jp	M,00134$
                           1236 ;src/main.c:262: enemy->muerto = SI;
   69DB DD 6E FE      [19] 1237 	ld	l,-2 (ix)
   69DE DD 66 FF      [19] 1238 	ld	h,-1 (ix)
   69E1 36 01         [10] 1239 	ld	(hl),#0x01
                           1240 ;src/main.c:266: break;
   69E3 18 5E         [12] 1241 	jr	00134$
                           1242 ;src/main.c:267: case 3:
   69E5                    1243 00125$:
                           1244 ;src/main.c:268: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   69E5 21 22 63      [10] 1245 	ld	hl, #_cu + 0
   69E8 4E            [ 7] 1246 	ld	c,(hl)
   69E9 06 00         [ 7] 1247 	ld	b,#0x00
   69EB 59            [ 4] 1248 	ld	e, c
   69EC 50            [ 4] 1249 	ld	d, b
   69ED 13            [ 6] 1250 	inc	de
   69EE 13            [ 6] 1251 	inc	de
   69EF E1            [10] 1252 	pop	hl
   69F0 E5            [11] 1253 	push	hl
   69F1 6E            [ 7] 1254 	ld	l,(hl)
   69F2 26 00         [ 7] 1255 	ld	h,#0x00
   69F4 7B            [ 4] 1256 	ld	a,e
   69F5 95            [ 4] 1257 	sub	a, l
   69F6 7A            [ 4] 1258 	ld	a,d
   69F7 9C            [ 4] 1259 	sbc	a, h
   69F8 E2 FD 69      [10] 1260 	jp	PO, 00217$
   69FB EE 80         [ 7] 1261 	xor	a, #0x80
   69FD                    1262 00217$:
   69FD FA 43 6A      [10] 1263 	jp	M,00134$
   6A00 11 04 00      [10] 1264 	ld	de,#0x0004
   6A03 19            [11] 1265 	add	hl,de
   6A04 7D            [ 4] 1266 	ld	a,l
   6A05 91            [ 4] 1267 	sub	a, c
   6A06 7C            [ 4] 1268 	ld	a,h
   6A07 98            [ 4] 1269 	sbc	a, b
   6A08 E2 0D 6A      [10] 1270 	jp	PO, 00218$
   6A0B EE 80         [ 7] 1271 	xor	a, #0x80
   6A0D                    1272 00218$:
   6A0D FA 43 6A      [10] 1273 	jp	M,00134$
                           1274 ;src/main.c:269: if(enemy->y>cu.y){
   6A10 DD 6E FC      [19] 1275 	ld	l,-4 (ix)
   6A13 DD 66 FD      [19] 1276 	ld	h,-3 (ix)
   6A16 4E            [ 7] 1277 	ld	c,(hl)
   6A17 21 23 63      [10] 1278 	ld	hl, #(_cu + 0x0001) + 0
   6A1A 5E            [ 7] 1279 	ld	e,(hl)
   6A1B 7B            [ 4] 1280 	ld	a,e
   6A1C 91            [ 4] 1281 	sub	a, c
   6A1D 30 24         [12] 1282 	jr	NC,00134$
                           1283 ;src/main.c:270: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6A1F 06 00         [ 7] 1284 	ld	b,#0x00
   6A21 16 00         [ 7] 1285 	ld	d,#0x00
   6A23 21 08 00      [10] 1286 	ld	hl,#0x0008
   6A26 19            [11] 1287 	add	hl,de
   6A27 79            [ 4] 1288 	ld	a,c
   6A28 95            [ 4] 1289 	sub	a, l
   6A29 4F            [ 4] 1290 	ld	c,a
   6A2A 78            [ 4] 1291 	ld	a,b
   6A2B 9C            [ 4] 1292 	sbc	a, h
   6A2C 47            [ 4] 1293 	ld	b,a
   6A2D 3E 02         [ 7] 1294 	ld	a,#0x02
   6A2F B9            [ 4] 1295 	cp	a, c
   6A30 3E 00         [ 7] 1296 	ld	a,#0x00
   6A32 98            [ 4] 1297 	sbc	a, b
   6A33 E2 38 6A      [10] 1298 	jp	PO, 00219$
   6A36 EE 80         [ 7] 1299 	xor	a, #0x80
   6A38                    1300 00219$:
   6A38 FA 43 6A      [10] 1301 	jp	M,00134$
                           1302 ;src/main.c:271: enemy->muerto = SI;
   6A3B DD 6E FE      [19] 1303 	ld	l,-2 (ix)
   6A3E DD 66 FF      [19] 1304 	ld	h,-1 (ix)
   6A41 36 01         [10] 1305 	ld	(hl),#0x01
                           1306 ;src/main.c:276: }
   6A43                    1307 00134$:
   6A43 DD F9         [10] 1308 	ld	sp, ix
   6A45 DD E1         [14] 1309 	pop	ix
   6A47 C9            [10] 1310 	ret
                           1311 ;src/main.c:279: void moverEnemigoArriba(TEnemy *enemy){
                           1312 ;	---------------------------------
                           1313 ; Function moverEnemigoArriba
                           1314 ; ---------------------------------
   6A48                    1315 _moverEnemigoArriba::
   6A48 DD E5         [15] 1316 	push	ix
   6A4A DD 21 00 00   [14] 1317 	ld	ix,#0
   6A4E DD 39         [15] 1318 	add	ix,sp
                           1319 ;src/main.c:280: enemy->y--;
   6A50 DD 4E 04      [19] 1320 	ld	c,4 (ix)
   6A53 DD 46 05      [19] 1321 	ld	b,5 (ix)
   6A56 69            [ 4] 1322 	ld	l, c
   6A57 60            [ 4] 1323 	ld	h, b
   6A58 23            [ 6] 1324 	inc	hl
   6A59 5E            [ 7] 1325 	ld	e,(hl)
   6A5A 1D            [ 4] 1326 	dec	e
   6A5B 73            [ 7] 1327 	ld	(hl),e
                           1328 ;src/main.c:281: enemy->y--;
   6A5C 1D            [ 4] 1329 	dec	e
   6A5D 73            [ 7] 1330 	ld	(hl),e
                           1331 ;src/main.c:282: enemy->mover = SI;
   6A5E 21 06 00      [10] 1332 	ld	hl,#0x0006
   6A61 09            [11] 1333 	add	hl,bc
   6A62 36 01         [10] 1334 	ld	(hl),#0x01
   6A64 DD E1         [14] 1335 	pop	ix
   6A66 C9            [10] 1336 	ret
                           1337 ;src/main.c:285: void moverEnemigoAbajo(TEnemy *enemy){
                           1338 ;	---------------------------------
                           1339 ; Function moverEnemigoAbajo
                           1340 ; ---------------------------------
   6A67                    1341 _moverEnemigoAbajo::
   6A67 DD E5         [15] 1342 	push	ix
   6A69 DD 21 00 00   [14] 1343 	ld	ix,#0
   6A6D DD 39         [15] 1344 	add	ix,sp
                           1345 ;src/main.c:286: enemy->y++;
   6A6F DD 4E 04      [19] 1346 	ld	c,4 (ix)
   6A72 DD 46 05      [19] 1347 	ld	b,5 (ix)
   6A75 59            [ 4] 1348 	ld	e, c
   6A76 50            [ 4] 1349 	ld	d, b
   6A77 13            [ 6] 1350 	inc	de
   6A78 1A            [ 7] 1351 	ld	a,(de)
   6A79 3C            [ 4] 1352 	inc	a
   6A7A 12            [ 7] 1353 	ld	(de),a
                           1354 ;src/main.c:287: enemy->y++;
   6A7B 3C            [ 4] 1355 	inc	a
   6A7C 12            [ 7] 1356 	ld	(de),a
                           1357 ;src/main.c:288: enemy->mover = SI;
   6A7D 21 06 00      [10] 1358 	ld	hl,#0x0006
   6A80 09            [11] 1359 	add	hl,bc
   6A81 36 01         [10] 1360 	ld	(hl),#0x01
   6A83 DD E1         [14] 1361 	pop	ix
   6A85 C9            [10] 1362 	ret
                           1363 ;src/main.c:291: void moverEnemigoDerecha(TEnemy *enemy){
                           1364 ;	---------------------------------
                           1365 ; Function moverEnemigoDerecha
                           1366 ; ---------------------------------
   6A86                    1367 _moverEnemigoDerecha::
                           1368 ;src/main.c:292: enemy->x++;
   6A86 D1            [10] 1369 	pop	de
   6A87 C1            [10] 1370 	pop	bc
   6A88 C5            [11] 1371 	push	bc
   6A89 D5            [11] 1372 	push	de
   6A8A 0A            [ 7] 1373 	ld	a,(bc)
   6A8B 3C            [ 4] 1374 	inc	a
   6A8C 02            [ 7] 1375 	ld	(bc),a
                           1376 ;src/main.c:293: enemy->x++;
   6A8D 3C            [ 4] 1377 	inc	a
   6A8E 02            [ 7] 1378 	ld	(bc),a
                           1379 ;src/main.c:294: enemy->mover = SI;
   6A8F 21 06 00      [10] 1380 	ld	hl,#0x0006
   6A92 09            [11] 1381 	add	hl,bc
   6A93 36 01         [10] 1382 	ld	(hl),#0x01
   6A95 C9            [10] 1383 	ret
                           1384 ;src/main.c:297: void moverEnemigoIzquierda(TEnemy *enemy){
                           1385 ;	---------------------------------
                           1386 ; Function moverEnemigoIzquierda
                           1387 ; ---------------------------------
   6A96                    1388 _moverEnemigoIzquierda::
                           1389 ;src/main.c:298: enemy->x--;
   6A96 D1            [10] 1390 	pop	de
   6A97 C1            [10] 1391 	pop	bc
   6A98 C5            [11] 1392 	push	bc
   6A99 D5            [11] 1393 	push	de
   6A9A 0A            [ 7] 1394 	ld	a,(bc)
   6A9B C6 FF         [ 7] 1395 	add	a,#0xFF
   6A9D 02            [ 7] 1396 	ld	(bc),a
                           1397 ;src/main.c:299: enemy->x--;
   6A9E C6 FF         [ 7] 1398 	add	a,#0xFF
   6AA0 02            [ 7] 1399 	ld	(bc),a
                           1400 ;src/main.c:300: enemy->mover = SI;
   6AA1 21 06 00      [10] 1401 	ld	hl,#0x0006
   6AA4 09            [11] 1402 	add	hl,bc
   6AA5 36 01         [10] 1403 	ld	(hl),#0x01
   6AA7 C9            [10] 1404 	ret
                           1405 ;src/main.c:303: void moverEnemigoPatrol(TEnemy* enemy){
                           1406 ;	---------------------------------
                           1407 ; Function moverEnemigoPatrol
                           1408 ; ---------------------------------
   6AA8                    1409 _moverEnemigoPatrol::
   6AA8 DD E5         [15] 1410 	push	ix
   6AAA DD 21 00 00   [14] 1411 	ld	ix,#0
   6AAE DD 39         [15] 1412 	add	ix,sp
   6AB0 21 F3 FF      [10] 1413 	ld	hl,#-13
   6AB3 39            [11] 1414 	add	hl,sp
   6AB4 F9            [ 6] 1415 	ld	sp,hl
                           1416 ;src/main.c:305: if(!enemy->muerto){
   6AB5 DD 4E 04      [19] 1417 	ld	c,4 (ix)
   6AB8 DD 46 05      [19] 1418 	ld	b,5 (ix)
   6ABB C5            [11] 1419 	push	bc
   6ABC FD E1         [14] 1420 	pop	iy
   6ABE FD 7E 08      [19] 1421 	ld	a,8 (iy)
   6AC1 B7            [ 4] 1422 	or	a, a
   6AC2 C2 EC 6C      [10] 1423 	jp	NZ,00118$
                           1424 ;src/main.c:306: if (!enemy->reversePatrol) {
   6AC5 21 0B 00      [10] 1425 	ld	hl,#0x000B
   6AC8 09            [11] 1426 	add	hl,bc
   6AC9 DD 75 F8      [19] 1427 	ld	-8 (ix),l
   6ACC DD 74 F9      [19] 1428 	ld	-7 (ix),h
   6ACF DD 6E F8      [19] 1429 	ld	l,-8 (ix)
   6AD2 DD 66 F9      [19] 1430 	ld	h,-7 (ix)
   6AD5 7E            [ 7] 1431 	ld	a,(hl)
   6AD6 DD 77 F7      [19] 1432 	ld	-9 (ix),a
                           1433 ;src/main.c:307: if(enemy->iter < enemy->longitud_camino){
   6AD9 21 0D 00      [10] 1434 	ld	hl,#0x000D
   6ADC 09            [11] 1435 	add	hl,bc
   6ADD DD 75 FC      [19] 1436 	ld	-4 (ix),l
   6AE0 DD 74 FD      [19] 1437 	ld	-3 (ix),h
   6AE3 DD 6E FC      [19] 1438 	ld	l,-4 (ix)
   6AE6 DD 66 FD      [19] 1439 	ld	h,-3 (ix)
   6AE9 5E            [ 7] 1440 	ld	e,(hl)
   6AEA 23            [ 6] 1441 	inc	hl
   6AEB 56            [ 7] 1442 	ld	d,(hl)
   6AEC 21 E2 00      [10] 1443 	ld	hl,#0x00E2
   6AEF 09            [11] 1444 	add	hl,bc
   6AF0 DD 75 FA      [19] 1445 	ld	-6 (ix),l
   6AF3 DD 74 FB      [19] 1446 	ld	-5 (ix),h
                           1447 ;src/main.c:309: enemy->mover = SI;
   6AF6 21 06 00      [10] 1448 	ld	hl,#0x0006
   6AF9 09            [11] 1449 	add	hl,bc
   6AFA DD 75 FE      [19] 1450 	ld	-2 (ix),l
   6AFD DD 74 FF      [19] 1451 	ld	-1 (ix),h
                           1452 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6B00 21 1A 00      [10] 1453 	ld	hl,#0x001A
   6B03 09            [11] 1454 	add	hl,bc
   6B04 DD 75 F5      [19] 1455 	ld	-11 (ix),l
   6B07 DD 74 F6      [19] 1456 	ld	-10 (ix),h
                           1457 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6B0A 21 01 00      [10] 1458 	ld	hl,#0x0001
   6B0D 09            [11] 1459 	add	hl,bc
   6B0E E3            [19] 1460 	ex	(sp), hl
                           1461 ;src/main.c:306: if (!enemy->reversePatrol) {
   6B0F DD 7E F7      [19] 1462 	ld	a,-9 (ix)
   6B12 B7            [ 4] 1463 	or	a, a
   6B13 C2 EA 6B      [10] 1464 	jp	NZ,00114$
                           1465 ;src/main.c:307: if(enemy->iter < enemy->longitud_camino){
   6B16 DD 6E FA      [19] 1466 	ld	l,-6 (ix)
   6B19 DD 66 FB      [19] 1467 	ld	h,-5 (ix)
   6B1C 6E            [ 7] 1468 	ld	l,(hl)
   6B1D 26 00         [ 7] 1469 	ld	h,#0x00
   6B1F 7B            [ 4] 1470 	ld	a,e
   6B20 95            [ 4] 1471 	sub	a, l
   6B21 7A            [ 4] 1472 	ld	a,d
   6B22 9C            [ 4] 1473 	sbc	a, h
   6B23 E2 28 6B      [10] 1474 	jp	PO, 00144$
   6B26 EE 80         [ 7] 1475 	xor	a, #0x80
   6B28                    1476 00144$:
   6B28 F2 C5 6B      [10] 1477 	jp	P,00105$
                           1478 ;src/main.c:308: if(enemy->iter == 0){
   6B2B 7A            [ 4] 1479 	ld	a,d
   6B2C B3            [ 4] 1480 	or	a,e
   6B2D 20 50         [12] 1481 	jr	NZ,00102$
                           1482 ;src/main.c:309: enemy->mover = SI;
   6B2F DD 6E FE      [19] 1483 	ld	l,-2 (ix)
   6B32 DD 66 FF      [19] 1484 	ld	h,-1 (ix)
   6B35 36 01         [10] 1485 	ld	(hl),#0x01
                           1486 ;src/main.c:310: enemy->iter = 2;
   6B37 DD 6E FC      [19] 1487 	ld	l,-4 (ix)
   6B3A DD 66 FD      [19] 1488 	ld	h,-3 (ix)
   6B3D 36 02         [10] 1489 	ld	(hl),#0x02
   6B3F 23            [ 6] 1490 	inc	hl
   6B40 36 00         [10] 1491 	ld	(hl),#0x00
                           1492 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6B42 DD 6E FC      [19] 1493 	ld	l,-4 (ix)
   6B45 DD 66 FD      [19] 1494 	ld	h,-3 (ix)
   6B48 5E            [ 7] 1495 	ld	e,(hl)
   6B49 23            [ 6] 1496 	inc	hl
   6B4A 56            [ 7] 1497 	ld	d,(hl)
   6B4B DD 6E F5      [19] 1498 	ld	l,-11 (ix)
   6B4E DD 66 F6      [19] 1499 	ld	h,-10 (ix)
   6B51 19            [11] 1500 	add	hl,de
   6B52 7E            [ 7] 1501 	ld	a,(hl)
   6B53 02            [ 7] 1502 	ld	(bc),a
                           1503 ;src/main.c:312: ++enemy->iter;
   6B54 DD 6E FC      [19] 1504 	ld	l,-4 (ix)
   6B57 DD 66 FD      [19] 1505 	ld	h,-3 (ix)
   6B5A 4E            [ 7] 1506 	ld	c,(hl)
   6B5B 23            [ 6] 1507 	inc	hl
   6B5C 46            [ 7] 1508 	ld	b,(hl)
   6B5D 03            [ 6] 1509 	inc	bc
   6B5E DD 6E FC      [19] 1510 	ld	l,-4 (ix)
   6B61 DD 66 FD      [19] 1511 	ld	h,-3 (ix)
   6B64 71            [ 7] 1512 	ld	(hl),c
   6B65 23            [ 6] 1513 	inc	hl
   6B66 70            [ 7] 1514 	ld	(hl),b
                           1515 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6B67 DD 6E F5      [19] 1516 	ld	l,-11 (ix)
   6B6A DD 66 F6      [19] 1517 	ld	h,-10 (ix)
   6B6D 09            [11] 1518 	add	hl,bc
   6B6E 5E            [ 7] 1519 	ld	e,(hl)
   6B6F E1            [10] 1520 	pop	hl
   6B70 E5            [11] 1521 	push	hl
   6B71 73            [ 7] 1522 	ld	(hl),e
                           1523 ;src/main.c:314: ++enemy->iter;
   6B72 03            [ 6] 1524 	inc	bc
   6B73 DD 6E FC      [19] 1525 	ld	l,-4 (ix)
   6B76 DD 66 FD      [19] 1526 	ld	h,-3 (ix)
   6B79 71            [ 7] 1527 	ld	(hl),c
   6B7A 23            [ 6] 1528 	inc	hl
   6B7B 70            [ 7] 1529 	ld	(hl),b
   6B7C C3 EC 6C      [10] 1530 	jp	00118$
   6B7F                    1531 00102$:
                           1532 ;src/main.c:316: enemy->mover = SI;
   6B7F DD 6E FE      [19] 1533 	ld	l,-2 (ix)
   6B82 DD 66 FF      [19] 1534 	ld	h,-1 (ix)
   6B85 36 01         [10] 1535 	ld	(hl),#0x01
                           1536 ;src/main.c:317: enemy->x = enemy->camino[enemy->iter];
   6B87 DD 6E FC      [19] 1537 	ld	l,-4 (ix)
   6B8A DD 66 FD      [19] 1538 	ld	h,-3 (ix)
   6B8D 5E            [ 7] 1539 	ld	e,(hl)
   6B8E 23            [ 6] 1540 	inc	hl
   6B8F 56            [ 7] 1541 	ld	d,(hl)
   6B90 DD 6E F5      [19] 1542 	ld	l,-11 (ix)
   6B93 DD 66 F6      [19] 1543 	ld	h,-10 (ix)
   6B96 19            [11] 1544 	add	hl,de
   6B97 7E            [ 7] 1545 	ld	a,(hl)
   6B98 02            [ 7] 1546 	ld	(bc),a
                           1547 ;src/main.c:318: ++enemy->iter;
   6B99 DD 6E FC      [19] 1548 	ld	l,-4 (ix)
   6B9C DD 66 FD      [19] 1549 	ld	h,-3 (ix)
   6B9F 5E            [ 7] 1550 	ld	e,(hl)
   6BA0 23            [ 6] 1551 	inc	hl
   6BA1 56            [ 7] 1552 	ld	d,(hl)
   6BA2 13            [ 6] 1553 	inc	de
   6BA3 DD 6E FC      [19] 1554 	ld	l,-4 (ix)
   6BA6 DD 66 FD      [19] 1555 	ld	h,-3 (ix)
   6BA9 73            [ 7] 1556 	ld	(hl),e
   6BAA 23            [ 6] 1557 	inc	hl
   6BAB 72            [ 7] 1558 	ld	(hl),d
                           1559 ;src/main.c:319: enemy->y = enemy->camino[enemy->iter];
   6BAC DD 6E F5      [19] 1560 	ld	l,-11 (ix)
   6BAF DD 66 F6      [19] 1561 	ld	h,-10 (ix)
   6BB2 19            [11] 1562 	add	hl,de
   6BB3 7E            [ 7] 1563 	ld	a,(hl)
   6BB4 E1            [10] 1564 	pop	hl
   6BB5 E5            [11] 1565 	push	hl
   6BB6 77            [ 7] 1566 	ld	(hl),a
                           1567 ;src/main.c:320: ++enemy->iter;
   6BB7 13            [ 6] 1568 	inc	de
   6BB8 4B            [ 4] 1569 	ld	c,e
   6BB9 DD 6E FC      [19] 1570 	ld	l,-4 (ix)
   6BBC DD 66 FD      [19] 1571 	ld	h,-3 (ix)
   6BBF 71            [ 7] 1572 	ld	(hl),c
   6BC0 23            [ 6] 1573 	inc	hl
   6BC1 72            [ 7] 1574 	ld	(hl),d
   6BC2 C3 EC 6C      [10] 1575 	jp	00118$
   6BC5                    1576 00105$:
                           1577 ;src/main.c:324: enemy->mover = NO;
   6BC5 DD 6E FE      [19] 1578 	ld	l,-2 (ix)
   6BC8 DD 66 FF      [19] 1579 	ld	h,-1 (ix)
   6BCB 36 00         [10] 1580 	ld	(hl),#0x00
                           1581 ;src/main.c:325: enemy->iter = enemy->longitud_camino;
   6BCD DD 6E FA      [19] 1582 	ld	l,-6 (ix)
   6BD0 DD 66 FB      [19] 1583 	ld	h,-5 (ix)
   6BD3 4E            [ 7] 1584 	ld	c,(hl)
   6BD4 06 00         [ 7] 1585 	ld	b,#0x00
   6BD6 DD 6E FC      [19] 1586 	ld	l,-4 (ix)
   6BD9 DD 66 FD      [19] 1587 	ld	h,-3 (ix)
   6BDC 71            [ 7] 1588 	ld	(hl),c
   6BDD 23            [ 6] 1589 	inc	hl
   6BDE 70            [ 7] 1590 	ld	(hl),b
                           1591 ;src/main.c:326: enemy->reversePatrol = 1;
   6BDF DD 6E F8      [19] 1592 	ld	l,-8 (ix)
   6BE2 DD 66 F9      [19] 1593 	ld	h,-7 (ix)
   6BE5 36 01         [10] 1594 	ld	(hl),#0x01
   6BE7 C3 EC 6C      [10] 1595 	jp	00118$
   6BEA                    1596 00114$:
                           1597 ;src/main.c:329: if(enemy->iter > 0){
   6BEA AF            [ 4] 1598 	xor	a, a
   6BEB BB            [ 4] 1599 	cp	a, e
   6BEC 9A            [ 4] 1600 	sbc	a, d
   6BED E2 F2 6B      [10] 1601 	jp	PO, 00145$
   6BF0 EE 80         [ 7] 1602 	xor	a, #0x80
   6BF2                    1603 00145$:
   6BF2 F2 D2 6C      [10] 1604 	jp	P,00111$
                           1605 ;src/main.c:330: if(enemy->iter == enemy->longitud_camino){
   6BF5 DD 6E FA      [19] 1606 	ld	l,-6 (ix)
   6BF8 DD 66 FB      [19] 1607 	ld	h,-5 (ix)
   6BFB 6E            [ 7] 1608 	ld	l,(hl)
   6BFC DD 75 FA      [19] 1609 	ld	-6 (ix),l
   6BFF DD 36 FB 00   [19] 1610 	ld	-5 (ix),#0x00
   6C03 7B            [ 4] 1611 	ld	a,e
   6C04 DD 96 FA      [19] 1612 	sub	a, -6 (ix)
   6C07 C2 8E 6C      [10] 1613 	jp	NZ,00108$
   6C0A 7A            [ 4] 1614 	ld	a,d
   6C0B DD 96 FB      [19] 1615 	sub	a, -5 (ix)
   6C0E C2 8E 6C      [10] 1616 	jp	NZ,00108$
                           1617 ;src/main.c:331: enemy->mover = SI;
   6C11 DD 6E FE      [19] 1618 	ld	l,-2 (ix)
   6C14 DD 66 FF      [19] 1619 	ld	h,-1 (ix)
   6C17 36 01         [10] 1620 	ld	(hl),#0x01
                           1621 ;src/main.c:332: enemy->iter = enemy->iter - 1;
   6C19 DD 6E FC      [19] 1622 	ld	l,-4 (ix)
   6C1C DD 66 FD      [19] 1623 	ld	h,-3 (ix)
   6C1F 5E            [ 7] 1624 	ld	e,(hl)
   6C20 23            [ 6] 1625 	inc	hl
   6C21 56            [ 7] 1626 	ld	d,(hl)
   6C22 7B            [ 4] 1627 	ld	a,e
   6C23 C6 FF         [ 7] 1628 	add	a,#0xFF
   6C25 DD 77 FA      [19] 1629 	ld	-6 (ix),a
   6C28 7A            [ 4] 1630 	ld	a,d
   6C29 CE FF         [ 7] 1631 	adc	a,#0xFF
   6C2B DD 77 FB      [19] 1632 	ld	-5 (ix),a
   6C2E DD 6E FC      [19] 1633 	ld	l,-4 (ix)
   6C31 DD 66 FD      [19] 1634 	ld	h,-3 (ix)
   6C34 DD 7E FA      [19] 1635 	ld	a,-6 (ix)
   6C37 77            [ 7] 1636 	ld	(hl),a
   6C38 23            [ 6] 1637 	inc	hl
   6C39 DD 7E FB      [19] 1638 	ld	a,-5 (ix)
   6C3C 77            [ 7] 1639 	ld	(hl),a
                           1640 ;src/main.c:333: enemy->iter = enemy->iter - 2;
   6C3D DD 5E FA      [19] 1641 	ld	e,-6 (ix)
   6C40 DD 56 FB      [19] 1642 	ld	d,-5 (ix)
   6C43 1B            [ 6] 1643 	dec	de
   6C44 1B            [ 6] 1644 	dec	de
   6C45 DD 6E FC      [19] 1645 	ld	l,-4 (ix)
   6C48 DD 66 FD      [19] 1646 	ld	h,-3 (ix)
   6C4B 73            [ 7] 1647 	ld	(hl),e
   6C4C 23            [ 6] 1648 	inc	hl
   6C4D 72            [ 7] 1649 	ld	(hl),d
                           1650 ;src/main.c:334: enemy->y = enemy->camino[enemy->iter];
   6C4E DD 6E F5      [19] 1651 	ld	l,-11 (ix)
   6C51 DD 66 F6      [19] 1652 	ld	h,-10 (ix)
   6C54 19            [11] 1653 	add	hl,de
   6C55 5E            [ 7] 1654 	ld	e,(hl)
   6C56 E1            [10] 1655 	pop	hl
   6C57 E5            [11] 1656 	push	hl
   6C58 73            [ 7] 1657 	ld	(hl),e
                           1658 ;src/main.c:335: --enemy->iter;
   6C59 DD 7E FA      [19] 1659 	ld	a,-6 (ix)
   6C5C C6 FD         [ 7] 1660 	add	a,#0xFD
   6C5E 5F            [ 4] 1661 	ld	e,a
   6C5F DD 7E FB      [19] 1662 	ld	a,-5 (ix)
   6C62 CE FF         [ 7] 1663 	adc	a,#0xFF
   6C64 57            [ 4] 1664 	ld	d,a
   6C65 DD 6E FC      [19] 1665 	ld	l,-4 (ix)
   6C68 DD 66 FD      [19] 1666 	ld	h,-3 (ix)
   6C6B 73            [ 7] 1667 	ld	(hl),e
   6C6C 23            [ 6] 1668 	inc	hl
   6C6D 72            [ 7] 1669 	ld	(hl),d
                           1670 ;src/main.c:336: enemy->x = enemy->camino[enemy->iter];
   6C6E DD 6E F5      [19] 1671 	ld	l,-11 (ix)
   6C71 DD 66 F6      [19] 1672 	ld	h,-10 (ix)
   6C74 19            [11] 1673 	add	hl,de
   6C75 7E            [ 7] 1674 	ld	a,(hl)
   6C76 02            [ 7] 1675 	ld	(bc),a
                           1676 ;src/main.c:337: --enemy->iter;
   6C77 DD 7E FA      [19] 1677 	ld	a,-6 (ix)
   6C7A C6 FC         [ 7] 1678 	add	a,#0xFC
   6C7C 4F            [ 4] 1679 	ld	c,a
   6C7D DD 7E FB      [19] 1680 	ld	a,-5 (ix)
   6C80 CE FF         [ 7] 1681 	adc	a,#0xFF
   6C82 47            [ 4] 1682 	ld	b,a
   6C83 DD 6E FC      [19] 1683 	ld	l,-4 (ix)
   6C86 DD 66 FD      [19] 1684 	ld	h,-3 (ix)
   6C89 71            [ 7] 1685 	ld	(hl),c
   6C8A 23            [ 6] 1686 	inc	hl
   6C8B 70            [ 7] 1687 	ld	(hl),b
   6C8C 18 5E         [12] 1688 	jr	00118$
   6C8E                    1689 00108$:
                           1690 ;src/main.c:339: enemy->mover = SI;
   6C8E DD 6E FE      [19] 1691 	ld	l,-2 (ix)
   6C91 DD 66 FF      [19] 1692 	ld	h,-1 (ix)
   6C94 36 01         [10] 1693 	ld	(hl),#0x01
                           1694 ;src/main.c:340: enemy->y = enemy->camino[enemy->iter];
   6C96 DD 6E FC      [19] 1695 	ld	l,-4 (ix)
   6C99 DD 66 FD      [19] 1696 	ld	h,-3 (ix)
   6C9C 5E            [ 7] 1697 	ld	e,(hl)
   6C9D 23            [ 6] 1698 	inc	hl
   6C9E 56            [ 7] 1699 	ld	d,(hl)
   6C9F DD 6E F5      [19] 1700 	ld	l,-11 (ix)
   6CA2 DD 66 F6      [19] 1701 	ld	h,-10 (ix)
   6CA5 19            [11] 1702 	add	hl,de
   6CA6 5E            [ 7] 1703 	ld	e,(hl)
   6CA7 E1            [10] 1704 	pop	hl
   6CA8 E5            [11] 1705 	push	hl
   6CA9 73            [ 7] 1706 	ld	(hl),e
                           1707 ;src/main.c:341: --enemy->iter;
   6CAA DD 6E FC      [19] 1708 	ld	l,-4 (ix)
   6CAD DD 66 FD      [19] 1709 	ld	h,-3 (ix)
   6CB0 5E            [ 7] 1710 	ld	e,(hl)
   6CB1 23            [ 6] 1711 	inc	hl
   6CB2 56            [ 7] 1712 	ld	d,(hl)
   6CB3 1B            [ 6] 1713 	dec	de
   6CB4 DD 6E FC      [19] 1714 	ld	l,-4 (ix)
   6CB7 DD 66 FD      [19] 1715 	ld	h,-3 (ix)
   6CBA 73            [ 7] 1716 	ld	(hl),e
   6CBB 23            [ 6] 1717 	inc	hl
   6CBC 72            [ 7] 1718 	ld	(hl),d
                           1719 ;src/main.c:342: enemy->x = enemy->camino[enemy->iter];
   6CBD DD 6E F5      [19] 1720 	ld	l,-11 (ix)
   6CC0 DD 66 F6      [19] 1721 	ld	h,-10 (ix)
   6CC3 19            [11] 1722 	add	hl,de
   6CC4 7E            [ 7] 1723 	ld	a,(hl)
   6CC5 02            [ 7] 1724 	ld	(bc),a
                           1725 ;src/main.c:343: --enemy->iter;
   6CC6 1B            [ 6] 1726 	dec	de
   6CC7 DD 6E FC      [19] 1727 	ld	l,-4 (ix)
   6CCA DD 66 FD      [19] 1728 	ld	h,-3 (ix)
   6CCD 73            [ 7] 1729 	ld	(hl),e
   6CCE 23            [ 6] 1730 	inc	hl
   6CCF 72            [ 7] 1731 	ld	(hl),d
   6CD0 18 1A         [12] 1732 	jr	00118$
   6CD2                    1733 00111$:
                           1734 ;src/main.c:347: enemy->mover = NO;
   6CD2 DD 6E FE      [19] 1735 	ld	l,-2 (ix)
   6CD5 DD 66 FF      [19] 1736 	ld	h,-1 (ix)
   6CD8 36 00         [10] 1737 	ld	(hl),#0x00
                           1738 ;src/main.c:348: enemy->iter = 0;
   6CDA DD 6E FC      [19] 1739 	ld	l,-4 (ix)
   6CDD DD 66 FD      [19] 1740 	ld	h,-3 (ix)
   6CE0 AF            [ 4] 1741 	xor	a, a
   6CE1 77            [ 7] 1742 	ld	(hl), a
   6CE2 23            [ 6] 1743 	inc	hl
   6CE3 77            [ 7] 1744 	ld	(hl), a
                           1745 ;src/main.c:349: enemy->reversePatrol = 0;
   6CE4 DD 6E F8      [19] 1746 	ld	l,-8 (ix)
   6CE7 DD 66 F9      [19] 1747 	ld	h,-7 (ix)
   6CEA 36 00         [10] 1748 	ld	(hl),#0x00
   6CEC                    1749 00118$:
   6CEC DD F9         [10] 1750 	ld	sp, ix
   6CEE DD E1         [14] 1751 	pop	ix
   6CF0 C9            [10] 1752 	ret
                           1753 ;src/main.c:355: void lookFor(TEnemy* enemy){
                           1754 ;	---------------------------------
                           1755 ; Function lookFor
                           1756 ; ---------------------------------
   6CF1                    1757 _lookFor::
   6CF1 DD E5         [15] 1758 	push	ix
   6CF3 DD 21 00 00   [14] 1759 	ld	ix,#0
   6CF7 DD 39         [15] 1760 	add	ix,sp
   6CF9 21 F9 FF      [10] 1761 	ld	hl,#-7
   6CFC 39            [11] 1762 	add	hl,sp
   6CFD F9            [ 6] 1763 	ld	sp,hl
                           1764 ;src/main.c:361: i16 difx = abs((i16)(enemy->x - prota.x));
   6CFE DD 5E 04      [19] 1765 	ld	e,4 (ix)
   6D01 DD 56 05      [19] 1766 	ld	d,5 (ix)
   6D04 1A            [ 7] 1767 	ld	a,(de)
   6D05 4F            [ 4] 1768 	ld	c,a
   6D06 06 00         [ 7] 1769 	ld	b,#0x00
   6D08 21 1A 63      [10] 1770 	ld	hl,#_prota+0
   6D0B 6E            [ 7] 1771 	ld	l,(hl)
   6D0C 26 00         [ 7] 1772 	ld	h,#0x00
   6D0E 79            [ 4] 1773 	ld	a,c
   6D0F 95            [ 4] 1774 	sub	a, l
   6D10 4F            [ 4] 1775 	ld	c,a
   6D11 78            [ 4] 1776 	ld	a,b
   6D12 9C            [ 4] 1777 	sbc	a, h
   6D13 47            [ 4] 1778 	ld	b,a
   6D14 D5            [11] 1779 	push	de
   6D15 C5            [11] 1780 	push	bc
   6D16 CD B5 4B      [17] 1781 	call	_abs
   6D19 F1            [10] 1782 	pop	af
   6D1A D1            [10] 1783 	pop	de
   6D1B 33            [ 6] 1784 	inc	sp
   6D1C 33            [ 6] 1785 	inc	sp
   6D1D E5            [11] 1786 	push	hl
                           1787 ;src/main.c:362: i16 dify = abs((i16)(enemy->y - prota.y));
   6D1E 21 01 00      [10] 1788 	ld	hl,#0x0001
   6D21 19            [11] 1789 	add	hl,de
   6D22 DD 75 FE      [19] 1790 	ld	-2 (ix),l
   6D25 DD 74 FF      [19] 1791 	ld	-1 (ix),h
   6D28 DD 6E FE      [19] 1792 	ld	l,-2 (ix)
   6D2B DD 66 FF      [19] 1793 	ld	h,-1 (ix)
   6D2E 4E            [ 7] 1794 	ld	c,(hl)
   6D2F 06 00         [ 7] 1795 	ld	b,#0x00
   6D31 21 1B 63      [10] 1796 	ld	hl, #(_prota + 0x0001) + 0
   6D34 6E            [ 7] 1797 	ld	l,(hl)
   6D35 26 00         [ 7] 1798 	ld	h,#0x00
   6D37 79            [ 4] 1799 	ld	a,c
   6D38 95            [ 4] 1800 	sub	a, l
   6D39 4F            [ 4] 1801 	ld	c,a
   6D3A 78            [ 4] 1802 	ld	a,b
   6D3B 9C            [ 4] 1803 	sbc	a, h
   6D3C 47            [ 4] 1804 	ld	b,a
   6D3D D5            [11] 1805 	push	de
   6D3E C5            [11] 1806 	push	bc
   6D3F CD B5 4B      [17] 1807 	call	_abs
   6D42 F1            [10] 1808 	pop	af
   6D43 D1            [10] 1809 	pop	de
                           1810 ;src/main.c:364: dist = difx + dify; // manhattan
   6D44 DD 4E F9      [19] 1811 	ld	c,-7 (ix)
   6D47 09            [11] 1812 	add	hl, bc
   6D48 DD 75 FB      [19] 1813 	ld	-5 (ix),l
                           1814 ;src/main.c:365: enemy->seen = NO;
   6D4B 21 11 00      [10] 1815 	ld	hl,#0x0011
   6D4E 19            [11] 1816 	add	hl,de
   6D4F DD 75 FC      [19] 1817 	ld	-4 (ix),l
   6D52 DD 74 FD      [19] 1818 	ld	-3 (ix),h
   6D55 DD 6E FC      [19] 1819 	ld	l,-4 (ix)
   6D58 DD 66 FD      [19] 1820 	ld	h,-3 (ix)
   6D5B 36 00         [10] 1821 	ld	(hl),#0x00
                           1822 ;src/main.c:366: enemy->in_range = NO;
   6D5D 21 10 00      [10] 1823 	ld	hl,#0x0010
   6D60 19            [11] 1824 	add	hl,de
   6D61 4D            [ 4] 1825 	ld	c,l
   6D62 44            [ 4] 1826 	ld	b,h
   6D63 AF            [ 4] 1827 	xor	a, a
   6D64 02            [ 7] 1828 	ld	(bc),a
                           1829 ;src/main.c:368: if(!enemy->seek){
   6D65 D5            [11] 1830 	push	de
   6D66 FD E1         [14] 1831 	pop	iy
   6D68 FD 7E 13      [19] 1832 	ld	a,19 (iy)
   6D6B B7            [ 4] 1833 	or	a, a
   6D6C C2 F2 6D      [10] 1834 	jp	NZ,00111$
                           1835 ;src/main.c:369: if (dist <= 17) {// te detectan los sensores de proximidad
   6D6F 3E 11         [ 7] 1836 	ld	a,#0x11
   6D71 DD 96 FB      [19] 1837 	sub	a, -5 (ix)
   6D74 38 13         [12] 1838 	jr	C,00107$
                           1839 ;src/main.c:370: enemy->in_range = 1;
   6D76 3E 01         [ 7] 1840 	ld	a,#0x01
   6D78 02            [ 7] 1841 	ld	(bc),a
                           1842 ;src/main.c:371: enemy->engage = 1;
   6D79 21 15 00      [10] 1843 	ld	hl,#0x0015
   6D7C 19            [11] 1844 	add	hl,de
   6D7D 36 01         [10] 1845 	ld	(hl),#0x01
                           1846 ;src/main.c:372: enemy->seen = SI;
   6D7F DD 6E FC      [19] 1847 	ld	l,-4 (ix)
   6D82 DD 66 FD      [19] 1848 	ld	h,-3 (ix)
   6D85 36 01         [10] 1849 	ld	(hl),#0x01
   6D87 18 69         [12] 1850 	jr	00111$
   6D89                    1851 00107$:
                           1852 ;src/main.c:373: }else if(prota.x > enemy->x - 21 && prota.x < enemy->x + 21
   6D89 21 1A 63      [10] 1853 	ld	hl, #_prota + 0
   6D8C 4E            [ 7] 1854 	ld	c,(hl)
   6D8D 1A            [ 7] 1855 	ld	a,(de)
   6D8E 5F            [ 4] 1856 	ld	e,a
   6D8F 16 00         [ 7] 1857 	ld	d,#0x00
   6D91 7B            [ 4] 1858 	ld	a,e
   6D92 C6 EB         [ 7] 1859 	add	a,#0xEB
   6D94 6F            [ 4] 1860 	ld	l,a
   6D95 7A            [ 4] 1861 	ld	a,d
   6D96 CE FF         [ 7] 1862 	adc	a,#0xFF
   6D98 67            [ 4] 1863 	ld	h,a
   6D99 06 00         [ 7] 1864 	ld	b,#0x00
   6D9B 7D            [ 4] 1865 	ld	a,l
   6D9C 91            [ 4] 1866 	sub	a, c
   6D9D 7C            [ 4] 1867 	ld	a,h
   6D9E 98            [ 4] 1868 	sbc	a, b
   6D9F E2 A4 6D      [10] 1869 	jp	PO, 00137$
   6DA2 EE 80         [ 7] 1870 	xor	a, #0x80
   6DA4                    1871 00137$:
   6DA4 F2 F2 6D      [10] 1872 	jp	P,00111$
   6DA7 21 15 00      [10] 1873 	ld	hl,#0x0015
   6DAA 19            [11] 1874 	add	hl,de
   6DAB 79            [ 4] 1875 	ld	a,c
   6DAC 95            [ 4] 1876 	sub	a, l
   6DAD 78            [ 4] 1877 	ld	a,b
   6DAE 9C            [ 4] 1878 	sbc	a, h
   6DAF E2 B4 6D      [10] 1879 	jp	PO, 00138$
   6DB2 EE 80         [ 7] 1880 	xor	a, #0x80
   6DB4                    1881 00138$:
   6DB4 F2 F2 6D      [10] 1882 	jp	P,00111$
                           1883 ;src/main.c:374: && prota.y > enemy->y - 21*2 && prota.y < enemy->y + 21*2){
   6DB7 21 1B 63      [10] 1884 	ld	hl, #(_prota + 0x0001) + 0
   6DBA 4E            [ 7] 1885 	ld	c,(hl)
   6DBB DD 6E FE      [19] 1886 	ld	l,-2 (ix)
   6DBE DD 66 FF      [19] 1887 	ld	h,-1 (ix)
   6DC1 5E            [ 7] 1888 	ld	e,(hl)
   6DC2 16 00         [ 7] 1889 	ld	d,#0x00
   6DC4 7B            [ 4] 1890 	ld	a,e
   6DC5 C6 D6         [ 7] 1891 	add	a,#0xD6
   6DC7 6F            [ 4] 1892 	ld	l,a
   6DC8 7A            [ 4] 1893 	ld	a,d
   6DC9 CE FF         [ 7] 1894 	adc	a,#0xFF
   6DCB 67            [ 4] 1895 	ld	h,a
   6DCC 06 00         [ 7] 1896 	ld	b,#0x00
   6DCE 7D            [ 4] 1897 	ld	a,l
   6DCF 91            [ 4] 1898 	sub	a, c
   6DD0 7C            [ 4] 1899 	ld	a,h
   6DD1 98            [ 4] 1900 	sbc	a, b
   6DD2 E2 D7 6D      [10] 1901 	jp	PO, 00139$
   6DD5 EE 80         [ 7] 1902 	xor	a, #0x80
   6DD7                    1903 00139$:
   6DD7 F2 F2 6D      [10] 1904 	jp	P,00111$
   6DDA 21 2A 00      [10] 1905 	ld	hl,#0x002A
   6DDD 19            [11] 1906 	add	hl,de
   6DDE 79            [ 4] 1907 	ld	a,c
   6DDF 95            [ 4] 1908 	sub	a, l
   6DE0 78            [ 4] 1909 	ld	a,b
   6DE1 9C            [ 4] 1910 	sbc	a, h
   6DE2 E2 E7 6D      [10] 1911 	jp	PO, 00140$
   6DE5 EE 80         [ 7] 1912 	xor	a, #0x80
   6DE7                    1913 00140$:
   6DE7 F2 F2 6D      [10] 1914 	jp	P,00111$
                           1915 ;src/main.c:375: enemy->seen = SI;
   6DEA DD 6E FC      [19] 1916 	ld	l,-4 (ix)
   6DED DD 66 FD      [19] 1917 	ld	h,-3 (ix)
   6DF0 36 01         [10] 1918 	ld	(hl),#0x01
   6DF2                    1919 00111$:
   6DF2 DD F9         [10] 1920 	ld	sp, ix
   6DF4 DD E1         [14] 1921 	pop	ix
   6DF6 C9            [10] 1922 	ret
                           1923 ;src/main.c:380: void moverEnemigoSeek(TEnemy* actual){
                           1924 ;	---------------------------------
                           1925 ; Function moverEnemigoSeek
                           1926 ; ---------------------------------
   6DF7                    1927 _moverEnemigoSeek::
   6DF7 DD E5         [15] 1928 	push	ix
   6DF9 DD 21 00 00   [14] 1929 	ld	ix,#0
   6DFD DD 39         [15] 1930 	add	ix,sp
   6DFF 21 FA FF      [10] 1931 	ld	hl,#-6
   6E02 39            [11] 1932 	add	hl,sp
   6E03 F9            [ 6] 1933 	ld	sp,hl
                           1934 ;src/main.c:382: if(!actual->muerto){
   6E04 DD 4E 04      [19] 1935 	ld	c,4 (ix)
   6E07 DD 46 05      [19] 1936 	ld	b,5 (ix)
   6E0A C5            [11] 1937 	push	bc
   6E0B FD E1         [14] 1938 	pop	iy
   6E0D FD 7E 08      [19] 1939 	ld	a,8 (iy)
   6E10 B7            [ 4] 1940 	or	a, a
   6E11 C2 19 6F      [10] 1941 	jp	NZ,00109$
                           1942 ;src/main.c:385: if(actual->iter < actual->longitud_camino){
   6E14 21 0D 00      [10] 1943 	ld	hl,#0x000D
   6E17 09            [11] 1944 	add	hl,bc
   6E18 EB            [ 4] 1945 	ex	de,hl
   6E19 1A            [ 7] 1946 	ld	a,(de)
   6E1A DD 77 FE      [19] 1947 	ld	-2 (ix),a
   6E1D 13            [ 6] 1948 	inc	de
   6E1E 1A            [ 7] 1949 	ld	a,(de)
   6E1F DD 77 FF      [19] 1950 	ld	-1 (ix),a
   6E22 1B            [ 6] 1951 	dec	de
   6E23 69            [ 4] 1952 	ld	l, c
   6E24 60            [ 4] 1953 	ld	h, b
   6E25 C5            [11] 1954 	push	bc
   6E26 01 E2 00      [10] 1955 	ld	bc, #0x00E2
   6E29 09            [11] 1956 	add	hl, bc
   6E2A C1            [10] 1957 	pop	bc
   6E2B 6E            [ 7] 1958 	ld	l,(hl)
   6E2C 26 00         [ 7] 1959 	ld	h,#0x00
                           1960 ;src/main.c:394: actual->y = actual->camino[actual->iter];
   6E2E C5            [11] 1961 	push	bc
   6E2F FD E1         [14] 1962 	pop	iy
   6E31 FD 23         [10] 1963 	inc	iy
                           1964 ;src/main.c:385: if(actual->iter < actual->longitud_camino){
   6E33 DD 7E FE      [19] 1965 	ld	a,-2 (ix)
   6E36 95            [ 4] 1966 	sub	a, l
   6E37 DD 7E FF      [19] 1967 	ld	a,-1 (ix)
   6E3A 9C            [ 4] 1968 	sbc	a, h
   6E3B E2 40 6E      [10] 1969 	jp	PO, 00123$
   6E3E EE 80         [ 7] 1970 	xor	a, #0x80
   6E40                    1971 00123$:
   6E40 F2 C7 6E      [10] 1972 	jp	P,00105$
                           1973 ;src/main.c:390: actual->mover = SI;
   6E43 21 06 00      [10] 1974 	ld	hl,#0x0006
   6E46 09            [11] 1975 	add	hl,bc
                           1976 ;src/main.c:392: actual->x = actual->camino[actual->iter];
   6E47 79            [ 4] 1977 	ld	a,c
   6E48 C6 1A         [ 7] 1978 	add	a, #0x1A
   6E4A DD 77 FC      [19] 1979 	ld	-4 (ix),a
   6E4D 78            [ 4] 1980 	ld	a,b
   6E4E CE 00         [ 7] 1981 	adc	a, #0x00
   6E50 DD 77 FD      [19] 1982 	ld	-3 (ix),a
                           1983 ;src/main.c:388: if(actual->iter == 0){
   6E53 DD 7E FF      [19] 1984 	ld	a,-1 (ix)
   6E56 DD B6 FE      [19] 1985 	or	a,-2 (ix)
   6E59 20 3A         [12] 1986 	jr	NZ,00102$
                           1987 ;src/main.c:390: actual->mover = SI;
   6E5B 36 01         [10] 1988 	ld	(hl),#0x01
                           1989 ;src/main.c:391: actual->iter = 2;
   6E5D 6B            [ 4] 1990 	ld	l, e
   6E5E 62            [ 4] 1991 	ld	h, d
   6E5F 36 02         [10] 1992 	ld	(hl),#0x02
   6E61 23            [ 6] 1993 	inc	hl
   6E62 36 00         [10] 1994 	ld	(hl),#0x00
                           1995 ;src/main.c:392: actual->x = actual->camino[actual->iter];
   6E64 6B            [ 4] 1996 	ld	l, e
   6E65 62            [ 4] 1997 	ld	h, d
   6E66 7E            [ 7] 1998 	ld	a, (hl)
   6E67 23            [ 6] 1999 	inc	hl
   6E68 66            [ 7] 2000 	ld	h,(hl)
   6E69 6F            [ 4] 2001 	ld	l,a
   6E6A DD 7E FC      [19] 2002 	ld	a,-4 (ix)
   6E6D 85            [ 4] 2003 	add	a, l
   6E6E 6F            [ 4] 2004 	ld	l,a
   6E6F DD 7E FD      [19] 2005 	ld	a,-3 (ix)
   6E72 8C            [ 4] 2006 	adc	a, h
   6E73 67            [ 4] 2007 	ld	h,a
   6E74 7E            [ 7] 2008 	ld	a,(hl)
   6E75 02            [ 7] 2009 	ld	(bc),a
                           2010 ;src/main.c:393: ++actual->iter;
   6E76 6B            [ 4] 2011 	ld	l, e
   6E77 62            [ 4] 2012 	ld	h, d
   6E78 4E            [ 7] 2013 	ld	c,(hl)
   6E79 23            [ 6] 2014 	inc	hl
   6E7A 46            [ 7] 2015 	ld	b,(hl)
   6E7B 03            [ 6] 2016 	inc	bc
   6E7C 6B            [ 4] 2017 	ld	l, e
   6E7D 62            [ 4] 2018 	ld	h, d
   6E7E 71            [ 7] 2019 	ld	(hl),c
   6E7F 23            [ 6] 2020 	inc	hl
   6E80 70            [ 7] 2021 	ld	(hl),b
                           2022 ;src/main.c:394: actual->y = actual->camino[actual->iter];
   6E81 DD 6E FC      [19] 2023 	ld	l,-4 (ix)
   6E84 DD 66 FD      [19] 2024 	ld	h,-3 (ix)
   6E87 09            [11] 2025 	add	hl,bc
   6E88 6E            [ 7] 2026 	ld	l,(hl)
   6E89 FD 75 00      [19] 2027 	ld	0 (iy), l
                           2028 ;src/main.c:395: ++actual->iter;
   6E8C 03            [ 6] 2029 	inc	bc
   6E8D 79            [ 4] 2030 	ld	a,c
   6E8E 12            [ 7] 2031 	ld	(de),a
   6E8F 13            [ 6] 2032 	inc	de
   6E90 78            [ 4] 2033 	ld	a,b
   6E91 12            [ 7] 2034 	ld	(de),a
   6E92 C3 19 6F      [10] 2035 	jp	00109$
   6E95                    2036 00102$:
                           2037 ;src/main.c:398: actual->mover = SI;
   6E95 36 01         [10] 2038 	ld	(hl),#0x01
                           2039 ;src/main.c:399: actual->x = actual->camino[actual->iter];
   6E97 6B            [ 4] 2040 	ld	l, e
   6E98 62            [ 4] 2041 	ld	h, d
   6E99 7E            [ 7] 2042 	ld	a, (hl)
   6E9A 23            [ 6] 2043 	inc	hl
   6E9B 66            [ 7] 2044 	ld	h,(hl)
   6E9C 6F            [ 4] 2045 	ld	l,a
   6E9D DD 7E FC      [19] 2046 	ld	a,-4 (ix)
   6EA0 85            [ 4] 2047 	add	a, l
   6EA1 6F            [ 4] 2048 	ld	l,a
   6EA2 DD 7E FD      [19] 2049 	ld	a,-3 (ix)
   6EA5 8C            [ 4] 2050 	adc	a, h
   6EA6 67            [ 4] 2051 	ld	h,a
   6EA7 7E            [ 7] 2052 	ld	a,(hl)
   6EA8 02            [ 7] 2053 	ld	(bc),a
                           2054 ;src/main.c:400: ++actual->iter;
   6EA9 6B            [ 4] 2055 	ld	l, e
   6EAA 62            [ 4] 2056 	ld	h, d
   6EAB 4E            [ 7] 2057 	ld	c,(hl)
   6EAC 23            [ 6] 2058 	inc	hl
   6EAD 46            [ 7] 2059 	ld	b,(hl)
   6EAE 03            [ 6] 2060 	inc	bc
   6EAF 6B            [ 4] 2061 	ld	l, e
   6EB0 62            [ 4] 2062 	ld	h, d
   6EB1 71            [ 7] 2063 	ld	(hl),c
   6EB2 23            [ 6] 2064 	inc	hl
   6EB3 70            [ 7] 2065 	ld	(hl),b
                           2066 ;src/main.c:401: actual->y = actual->camino[actual->iter];
   6EB4 DD 6E FC      [19] 2067 	ld	l,-4 (ix)
   6EB7 DD 66 FD      [19] 2068 	ld	h,-3 (ix)
   6EBA 09            [11] 2069 	add	hl,bc
   6EBB 6E            [ 7] 2070 	ld	l,(hl)
   6EBC FD 75 00      [19] 2071 	ld	0 (iy), l
                           2072 ;src/main.c:402: ++actual->iter;
   6EBF 03            [ 6] 2073 	inc	bc
   6EC0 79            [ 4] 2074 	ld	a,c
   6EC1 12            [ 7] 2075 	ld	(de),a
   6EC2 13            [ 6] 2076 	inc	de
   6EC3 78            [ 4] 2077 	ld	a,b
   6EC4 12            [ 7] 2078 	ld	(de),a
   6EC5 18 52         [12] 2079 	jr	00109$
   6EC7                    2080 00105$:
                           2081 ;src/main.c:408: actual->seek = 0;
   6EC7 21 13 00      [10] 2082 	ld	hl,#0x0013
   6ECA 09            [11] 2083 	add	hl,bc
   6ECB 36 00         [10] 2084 	ld	(hl),#0x00
                           2085 ;src/main.c:410: actual->patrolling = 1;
   6ECD 21 0A 00      [10] 2086 	ld	hl,#0x000A
   6ED0 09            [11] 2087 	add	hl,bc
   6ED1 36 01         [10] 2088 	ld	(hl),#0x01
                           2089 ;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6ED3 69            [ 4] 2090 	ld	l, c
   6ED4 60            [ 4] 2091 	ld	h, b
   6ED5 C5            [11] 2092 	push	bc
   6ED6 01 18 00      [10] 2093 	ld	bc, #0x0018
   6ED9 09            [11] 2094 	add	hl, bc
   6EDA C1            [10] 2095 	pop	bc
   6EDB 7E            [ 7] 2096 	ld	a,(hl)
   6EDC DD 77 FC      [19] 2097 	ld	-4 (ix),a
   6EDF 69            [ 4] 2098 	ld	l, c
   6EE0 60            [ 4] 2099 	ld	h, b
   6EE1 C5            [11] 2100 	push	bc
   6EE2 01 17 00      [10] 2101 	ld	bc, #0x0017
   6EE5 09            [11] 2102 	add	hl, bc
   6EE6 C1            [10] 2103 	pop	bc
   6EE7 7E            [ 7] 2104 	ld	a,(hl)
   6EE8 DD 77 FE      [19] 2105 	ld	-2 (ix),a
   6EEB FD 7E 00      [19] 2106 	ld	a, 0 (iy)
   6EEE DD 77 FA      [19] 2107 	ld	-6 (ix),a
   6EF1 0A            [ 7] 2108 	ld	a,(bc)
   6EF2 DD 77 FB      [19] 2109 	ld	-5 (ix),a
   6EF5 D5            [11] 2110 	push	de
   6EF6 2A 31 63      [16] 2111 	ld	hl,(_mapa)
   6EF9 E5            [11] 2112 	push	hl
   6EFA C5            [11] 2113 	push	bc
   6EFB DD 66 FC      [19] 2114 	ld	h,-4 (ix)
   6EFE DD 6E FE      [19] 2115 	ld	l,-2 (ix)
   6F01 E5            [11] 2116 	push	hl
   6F02 DD 66 FA      [19] 2117 	ld	h,-6 (ix)
   6F05 DD 6E FB      [19] 2118 	ld	l,-5 (ix)
   6F08 E5            [11] 2119 	push	hl
   6F09 CD 72 49      [17] 2120 	call	_pathFinding
   6F0C 21 08 00      [10] 2121 	ld	hl,#8
   6F0F 39            [11] 2122 	add	hl,sp
   6F10 F9            [ 6] 2123 	ld	sp,hl
   6F11 D1            [10] 2124 	pop	de
                           2125 ;src/main.c:414: actual->iter = 0;
   6F12 3E 00         [ 7] 2126 	ld	a,#0x00
   6F14 12            [ 7] 2127 	ld	(de),a
   6F15 13            [ 6] 2128 	inc	de
   6F16 3E 00         [ 7] 2129 	ld	a,#0x00
   6F18 12            [ 7] 2130 	ld	(de),a
   6F19                    2131 00109$:
   6F19 DD F9         [10] 2132 	ld	sp, ix
   6F1B DD E1         [14] 2133 	pop	ix
   6F1D C9            [10] 2134 	ret
                           2135 ;src/main.c:420: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2136 ;	---------------------------------
                           2137 ; Function engage
                           2138 ; ---------------------------------
   6F1E                    2139 _engage::
   6F1E DD E5         [15] 2140 	push	ix
   6F20 DD 21 00 00   [14] 2141 	ld	ix,#0
   6F24 DD 39         [15] 2142 	add	ix,sp
   6F26 21 F0 FF      [10] 2143 	ld	hl,#-16
   6F29 39            [11] 2144 	add	hl,sp
   6F2A F9            [ 6] 2145 	ld	sp,hl
                           2146 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6F2B DD 7E 04      [19] 2147 	ld	a,4 (ix)
   6F2E DD 77 F4      [19] 2148 	ld	-12 (ix),a
   6F31 DD 7E 05      [19] 2149 	ld	a,5 (ix)
   6F34 DD 77 F5      [19] 2150 	ld	-11 (ix),a
   6F37 DD 6E F4      [19] 2151 	ld	l,-12 (ix)
   6F3A DD 66 F5      [19] 2152 	ld	h,-11 (ix)
   6F3D 4E            [ 7] 2153 	ld	c,(hl)
   6F3E 06 00         [ 7] 2154 	ld	b,#0x00
   6F40 21 1A 63      [10] 2155 	ld	hl,#_prota+0
   6F43 5E            [ 7] 2156 	ld	e,(hl)
   6F44 16 00         [ 7] 2157 	ld	d,#0x00
   6F46 79            [ 4] 2158 	ld	a,c
   6F47 93            [ 4] 2159 	sub	a, e
   6F48 4F            [ 4] 2160 	ld	c,a
   6F49 78            [ 4] 2161 	ld	a,b
   6F4A 9A            [ 4] 2162 	sbc	a, d
   6F4B 47            [ 4] 2163 	ld	b,a
   6F4C C5            [11] 2164 	push	bc
   6F4D CD B5 4B      [17] 2165 	call	_abs
   6F50 F1            [10] 2166 	pop	af
   6F51 4D            [ 4] 2167 	ld	c,l
                           2168 ;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
   6F52 DD 7E F4      [19] 2169 	ld	a,-12 (ix)
   6F55 C6 01         [ 7] 2170 	add	a, #0x01
   6F57 DD 77 F6      [19] 2171 	ld	-10 (ix),a
   6F5A DD 7E F5      [19] 2172 	ld	a,-11 (ix)
   6F5D CE 00         [ 7] 2173 	adc	a, #0x00
   6F5F DD 77 F7      [19] 2174 	ld	-9 (ix),a
   6F62 DD 6E F6      [19] 2175 	ld	l,-10 (ix)
   6F65 DD 66 F7      [19] 2176 	ld	h,-9 (ix)
   6F68 5E            [ 7] 2177 	ld	e,(hl)
   6F69 16 00         [ 7] 2178 	ld	d,#0x00
   6F6B 21 1B 63      [10] 2179 	ld	hl, #_prota + 1
   6F6E 6E            [ 7] 2180 	ld	l,(hl)
   6F6F 26 00         [ 7] 2181 	ld	h,#0x00
   6F71 7B            [ 4] 2182 	ld	a,e
   6F72 95            [ 4] 2183 	sub	a, l
   6F73 5F            [ 4] 2184 	ld	e,a
   6F74 7A            [ 4] 2185 	ld	a,d
   6F75 9C            [ 4] 2186 	sbc	a, h
   6F76 57            [ 4] 2187 	ld	d,a
   6F77 C5            [11] 2188 	push	bc
   6F78 D5            [11] 2189 	push	de
   6F79 CD B5 4B      [17] 2190 	call	_abs
   6F7C F1            [10] 2191 	pop	af
   6F7D C1            [10] 2192 	pop	bc
                           2193 ;src/main.c:423: u8 dist = difx + dify; // manhattan
   6F7E 09            [11] 2194 	add	hl, bc
   6F7F DD 75 F0      [19] 2195 	ld	-16 (ix),l
                           2196 ;src/main.c:425: u8 movX = 0;
   6F82 DD 36 F1 00   [19] 2197 	ld	-15 (ix),#0x00
                           2198 ;src/main.c:426: u8 movY = 0;
   6F86 DD 36 F3 00   [19] 2199 	ld	-13 (ix),#0x00
                           2200 ;src/main.c:427: u8 distConstraint = 25;
   6F8A DD 36 F2 19   [19] 2201 	ld	-14 (ix),#0x19
                           2202 ;src/main.c:428: enemy->mover = NO;
   6F8E DD 7E F4      [19] 2203 	ld	a,-12 (ix)
   6F91 C6 06         [ 7] 2204 	add	a, #0x06
   6F93 DD 77 F8      [19] 2205 	ld	-8 (ix),a
   6F96 DD 7E F5      [19] 2206 	ld	a,-11 (ix)
   6F99 CE 00         [ 7] 2207 	adc	a, #0x00
   6F9B DD 77 F9      [19] 2208 	ld	-7 (ix),a
   6F9E DD 6E F8      [19] 2209 	ld	l,-8 (ix)
   6FA1 DD 66 F9      [19] 2210 	ld	h,-7 (ix)
   6FA4 36 00         [10] 2211 	ld	(hl),#0x00
                           2212 ;src/main.c:438: enemy->didDamage = 1;
   6FA6 DD 7E F4      [19] 2213 	ld	a,-12 (ix)
   6FA9 C6 16         [ 7] 2214 	add	a, #0x16
   6FAB 4F            [ 4] 2215 	ld	c,a
   6FAC DD 7E F5      [19] 2216 	ld	a,-11 (ix)
   6FAF CE 00         [ 7] 2217 	adc	a, #0x00
   6FB1 47            [ 4] 2218 	ld	b,a
                           2219 ;src/main.c:430: if (dist < 20) {
   6FB2 DD 7E F0      [19] 2220 	ld	a,-16 (ix)
   6FB5 D6 14         [ 7] 2221 	sub	a, #0x14
   6FB7 30 32         [12] 2222 	jr	NC,00107$
                           2223 ;src/main.c:431: vidas--;
   6FB9 21 36 63      [10] 2224 	ld	hl, #_vidas+0
   6FBC 35            [11] 2225 	dec	(hl)
                           2226 ;src/main.c:432: if(vidas % 20 == 0){
   6FBD C5            [11] 2227 	push	bc
   6FBE 3E 14         [ 7] 2228 	ld	a,#0x14
   6FC0 F5            [11] 2229 	push	af
   6FC1 33            [ 6] 2230 	inc	sp
   6FC2 3A 36 63      [13] 2231 	ld	a,(_vidas)
   6FC5 F5            [11] 2232 	push	af
   6FC6 33            [ 6] 2233 	inc	sp
   6FC7 CD 0D 55      [17] 2234 	call	__moduchar
   6FCA F1            [10] 2235 	pop	af
   6FCB C1            [10] 2236 	pop	bc
   6FCC 7D            [ 4] 2237 	ld	a,l
   6FCD B7            [ 4] 2238 	or	a, a
   6FCE 20 18         [12] 2239 	jr	NZ,00105$
                           2240 ;src/main.c:433: if (vidas == 0) {
   6FD0 3A 36 63      [13] 2241 	ld	a,(#_vidas + 0)
   6FD3 B7            [ 4] 2242 	or	a, a
   6FD4 20 07         [12] 2243 	jr	NZ,00102$
                           2244 ;src/main.c:434: endGame = 1;
   6FD6 21 34 63      [10] 2245 	ld	hl,#_endGame + 0
   6FD9 36 01         [10] 2246 	ld	(hl), #0x01
   6FDB 18 0B         [12] 2247 	jr	00105$
   6FDD                    2248 00102$:
                           2249 ;src/main.c:436: modificarVidas(vidas);
   6FDD C5            [11] 2250 	push	bc
   6FDE 3A 36 63      [13] 2251 	ld	a,(_vidas)
   6FE1 F5            [11] 2252 	push	af
   6FE2 33            [ 6] 2253 	inc	sp
   6FE3 CD C4 51      [17] 2254 	call	_modificarVidas
   6FE6 33            [ 6] 2255 	inc	sp
   6FE7 C1            [10] 2256 	pop	bc
   6FE8                    2257 00105$:
                           2258 ;src/main.c:438: enemy->didDamage = 1;
   6FE8 3E 01         [ 7] 2259 	ld	a,#0x01
   6FEA 02            [ 7] 2260 	ld	(bc),a
   6FEB                    2261 00107$:
                           2262 ;src/main.c:440: if (!enemy->didDamage) {
   6FEB 0A            [ 7] 2263 	ld	a,(bc)
   6FEC B7            [ 4] 2264 	or	a, a
   6FED C2 23 77      [10] 2265 	jp	NZ,00208$
                           2266 ;src/main.c:441: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   6FF0 DD 6E F6      [19] 2267 	ld	l,-10 (ix)
   6FF3 DD 66 F7      [19] 2268 	ld	h,-9 (ix)
   6FF6 4E            [ 7] 2269 	ld	c,(hl)
                           2270 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6FF7 DD 6E F4      [19] 2271 	ld	l,-12 (ix)
   6FFA DD 66 F5      [19] 2272 	ld	h,-11 (ix)
   6FFD 7E            [ 7] 2273 	ld	a,(hl)
                           2274 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   6FFE DD 77 FA      [19] 2275 	ld	-6 (ix), a
   7001 C6 04         [ 7] 2276 	add	a, #0x04
   7003 DD 77 FB      [19] 2277 	ld	-5 (ix),a
                           2278 ;src/main.c:441: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7006 DD 7E 07      [19] 2279 	ld	a,7 (ix)
   7009 91            [ 4] 2280 	sub	a, c
   700A 28 35         [12] 2281 	jr	Z,00201$
   700C DD 5E 07      [19] 2282 	ld	e,7 (ix)
   700F 16 00         [ 7] 2283 	ld	d,#0x00
   7011 21 01 00      [10] 2284 	ld	hl,#0x0001
   7014 19            [11] 2285 	add	hl,de
   7015 DD 75 FC      [19] 2286 	ld	-4 (ix),l
   7018 DD 74 FD      [19] 2287 	ld	-3 (ix),h
   701B DD 71 FE      [19] 2288 	ld	-2 (ix),c
   701E DD 36 FF 00   [19] 2289 	ld	-1 (ix),#0x00
   7022 DD 7E FC      [19] 2290 	ld	a,-4 (ix)
   7025 DD 96 FE      [19] 2291 	sub	a, -2 (ix)
   7028 20 08         [12] 2292 	jr	NZ,00447$
   702A DD 7E FD      [19] 2293 	ld	a,-3 (ix)
   702D DD 96 FF      [19] 2294 	sub	a, -1 (ix)
   7030 28 0F         [12] 2295 	jr	Z,00201$
   7032                    2296 00447$:
   7032 1B            [ 6] 2297 	dec	de
   7033 DD 7E FE      [19] 2298 	ld	a,-2 (ix)
   7036 93            [ 4] 2299 	sub	a, e
   7037 C2 4E 71      [10] 2300 	jp	NZ,00202$
   703A DD 7E FF      [19] 2301 	ld	a,-1 (ix)
   703D 92            [ 4] 2302 	sub	a, d
   703E C2 4E 71      [10] 2303 	jp	NZ,00202$
   7041                    2304 00201$:
                           2305 ;src/main.c:442: if (dx < enemy->x) { // izquierda
   7041 DD 7E 06      [19] 2306 	ld	a,6 (ix)
   7044 DD 96 FA      [19] 2307 	sub	a, -6 (ix)
   7047 D2 CA 70      [10] 2308 	jp	NC,00121$
                           2309 ;src/main.c:443: if (dist > 11) {
   704A 3E 0B         [ 7] 2310 	ld	a,#0x0B
   704C DD 96 F0      [19] 2311 	sub	a, -16 (ix)
   704F D2 23 77      [10] 2312 	jp	NC,00208$
                           2313 ;src/main.c:444: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7052 79            [ 4] 2314 	ld	a,c
   7053 F5            [11] 2315 	push	af
   7054 33            [ 6] 2316 	inc	sp
   7055 DD 7E FA      [19] 2317 	ld	a,-6 (ix)
   7058 F5            [11] 2318 	push	af
   7059 33            [ 6] 2319 	inc	sp
   705A 2A 31 63      [16] 2320 	ld	hl,(_mapa)
   705D E5            [11] 2321 	push	hl
   705E CD 71 4B      [17] 2322 	call	_getTilePtr
   7061 F1            [10] 2323 	pop	af
   7062 F1            [10] 2324 	pop	af
   7063 4E            [ 7] 2325 	ld	c,(hl)
   7064 3E 02         [ 7] 2326 	ld	a,#0x02
   7066 91            [ 4] 2327 	sub	a, c
   7067 DA 23 77      [10] 2328 	jp	C,00208$
                           2329 ;src/main.c:445: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   706A DD 6E F6      [19] 2330 	ld	l,-10 (ix)
   706D DD 66 F7      [19] 2331 	ld	h,-9 (ix)
   7070 7E            [ 7] 2332 	ld	a,(hl)
   7071 C6 0B         [ 7] 2333 	add	a, #0x0B
   7073 57            [ 4] 2334 	ld	d,a
   7074 DD 6E F4      [19] 2335 	ld	l,-12 (ix)
   7077 DD 66 F5      [19] 2336 	ld	h,-11 (ix)
   707A 46            [ 7] 2337 	ld	b,(hl)
   707B D5            [11] 2338 	push	de
   707C 33            [ 6] 2339 	inc	sp
   707D C5            [11] 2340 	push	bc
   707E 33            [ 6] 2341 	inc	sp
   707F 2A 31 63      [16] 2342 	ld	hl,(_mapa)
   7082 E5            [11] 2343 	push	hl
   7083 CD 71 4B      [17] 2344 	call	_getTilePtr
   7086 F1            [10] 2345 	pop	af
   7087 F1            [10] 2346 	pop	af
   7088 4E            [ 7] 2347 	ld	c,(hl)
   7089 3E 02         [ 7] 2348 	ld	a,#0x02
   708B 91            [ 4] 2349 	sub	a, c
   708C DA 23 77      [10] 2350 	jp	C,00208$
                           2351 ;src/main.c:446: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   708F DD 6E F6      [19] 2352 	ld	l,-10 (ix)
   7092 DD 66 F7      [19] 2353 	ld	h,-9 (ix)
   7095 7E            [ 7] 2354 	ld	a,(hl)
   7096 C6 16         [ 7] 2355 	add	a, #0x16
   7098 57            [ 4] 2356 	ld	d,a
   7099 DD 6E F4      [19] 2357 	ld	l,-12 (ix)
   709C DD 66 F5      [19] 2358 	ld	h,-11 (ix)
   709F 46            [ 7] 2359 	ld	b,(hl)
   70A0 D5            [11] 2360 	push	de
   70A1 33            [ 6] 2361 	inc	sp
   70A2 C5            [11] 2362 	push	bc
   70A3 33            [ 6] 2363 	inc	sp
   70A4 2A 31 63      [16] 2364 	ld	hl,(_mapa)
   70A7 E5            [11] 2365 	push	hl
   70A8 CD 71 4B      [17] 2366 	call	_getTilePtr
   70AB F1            [10] 2367 	pop	af
   70AC F1            [10] 2368 	pop	af
   70AD 4E            [ 7] 2369 	ld	c,(hl)
   70AE 3E 02         [ 7] 2370 	ld	a,#0x02
   70B0 91            [ 4] 2371 	sub	a, c
   70B1 DA 23 77      [10] 2372 	jp	C,00208$
                           2373 ;src/main.c:447: moverEnemigoIzquierda(enemy);
   70B4 DD 6E F4      [19] 2374 	ld	l,-12 (ix)
   70B7 DD 66 F5      [19] 2375 	ld	h,-11 (ix)
   70BA E5            [11] 2376 	push	hl
   70BB CD 96 6A      [17] 2377 	call	_moverEnemigoIzquierda
   70BE F1            [10] 2378 	pop	af
                           2379 ;src/main.c:449: enemy->mover = SI;
   70BF DD 6E F8      [19] 2380 	ld	l,-8 (ix)
   70C2 DD 66 F9      [19] 2381 	ld	h,-7 (ix)
   70C5 36 01         [10] 2382 	ld	(hl),#0x01
   70C7 C3 23 77      [10] 2383 	jp	00208$
   70CA                    2384 00121$:
                           2385 ;src/main.c:453: if (dist > G_ENEMY_W + 3) {
   70CA 3E 07         [ 7] 2386 	ld	a,#0x07
   70CC DD 96 F0      [19] 2387 	sub	a, -16 (ix)
   70CF D2 23 77      [10] 2388 	jp	NC,00208$
                           2389 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   70D2 79            [ 4] 2390 	ld	a,c
   70D3 F5            [11] 2391 	push	af
   70D4 33            [ 6] 2392 	inc	sp
   70D5 DD 7E FB      [19] 2393 	ld	a,-5 (ix)
   70D8 F5            [11] 2394 	push	af
   70D9 33            [ 6] 2395 	inc	sp
   70DA 2A 31 63      [16] 2396 	ld	hl,(_mapa)
   70DD E5            [11] 2397 	push	hl
   70DE CD 71 4B      [17] 2398 	call	_getTilePtr
   70E1 F1            [10] 2399 	pop	af
   70E2 F1            [10] 2400 	pop	af
   70E3 4E            [ 7] 2401 	ld	c,(hl)
   70E4 3E 02         [ 7] 2402 	ld	a,#0x02
   70E6 91            [ 4] 2403 	sub	a, c
   70E7 DA 23 77      [10] 2404 	jp	C,00208$
                           2405 ;src/main.c:455: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   70EA DD 6E F6      [19] 2406 	ld	l,-10 (ix)
   70ED DD 66 F7      [19] 2407 	ld	h,-9 (ix)
   70F0 7E            [ 7] 2408 	ld	a,(hl)
   70F1 C6 0B         [ 7] 2409 	add	a, #0x0B
   70F3 47            [ 4] 2410 	ld	b,a
   70F4 DD 6E F4      [19] 2411 	ld	l,-12 (ix)
   70F7 DD 66 F5      [19] 2412 	ld	h,-11 (ix)
   70FA 7E            [ 7] 2413 	ld	a,(hl)
   70FB C6 04         [ 7] 2414 	add	a, #0x04
   70FD C5            [11] 2415 	push	bc
   70FE 33            [ 6] 2416 	inc	sp
   70FF F5            [11] 2417 	push	af
   7100 33            [ 6] 2418 	inc	sp
   7101 2A 31 63      [16] 2419 	ld	hl,(_mapa)
   7104 E5            [11] 2420 	push	hl
   7105 CD 71 4B      [17] 2421 	call	_getTilePtr
   7108 F1            [10] 2422 	pop	af
   7109 F1            [10] 2423 	pop	af
   710A 4E            [ 7] 2424 	ld	c,(hl)
   710B 3E 02         [ 7] 2425 	ld	a,#0x02
   710D 91            [ 4] 2426 	sub	a, c
   710E DA 23 77      [10] 2427 	jp	C,00208$
                           2428 ;src/main.c:456: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7111 DD 6E F6      [19] 2429 	ld	l,-10 (ix)
   7114 DD 66 F7      [19] 2430 	ld	h,-9 (ix)
   7117 7E            [ 7] 2431 	ld	a,(hl)
   7118 C6 16         [ 7] 2432 	add	a, #0x16
   711A 47            [ 4] 2433 	ld	b,a
   711B DD 6E F4      [19] 2434 	ld	l,-12 (ix)
   711E DD 66 F5      [19] 2435 	ld	h,-11 (ix)
   7121 7E            [ 7] 2436 	ld	a,(hl)
   7122 C6 04         [ 7] 2437 	add	a, #0x04
   7124 C5            [11] 2438 	push	bc
   7125 33            [ 6] 2439 	inc	sp
   7126 F5            [11] 2440 	push	af
   7127 33            [ 6] 2441 	inc	sp
   7128 2A 31 63      [16] 2442 	ld	hl,(_mapa)
   712B E5            [11] 2443 	push	hl
   712C CD 71 4B      [17] 2444 	call	_getTilePtr
   712F F1            [10] 2445 	pop	af
   7130 F1            [10] 2446 	pop	af
   7131 4E            [ 7] 2447 	ld	c,(hl)
   7132 3E 02         [ 7] 2448 	ld	a,#0x02
   7134 91            [ 4] 2449 	sub	a, c
   7135 DA 23 77      [10] 2450 	jp	C,00208$
                           2451 ;src/main.c:457: moverEnemigoDerecha(enemy);
   7138 DD 6E F4      [19] 2452 	ld	l,-12 (ix)
   713B DD 66 F5      [19] 2453 	ld	h,-11 (ix)
   713E E5            [11] 2454 	push	hl
   713F CD 86 6A      [17] 2455 	call	_moverEnemigoDerecha
   7142 F1            [10] 2456 	pop	af
                           2457 ;src/main.c:459: enemy->mover = SI;
   7143 DD 6E F8      [19] 2458 	ld	l,-8 (ix)
   7146 DD 66 F9      [19] 2459 	ld	h,-7 (ix)
   7149 36 01         [10] 2460 	ld	(hl),#0x01
   714B C3 23 77      [10] 2461 	jp	00208$
   714E                    2462 00202$:
                           2463 ;src/main.c:464: else if (enemy->x == dx) {
   714E DD 7E FA      [19] 2464 	ld	a,-6 (ix)
   7151 DD 96 06      [19] 2465 	sub	a, 6 (ix)
   7154 C2 69 72      [10] 2466 	jp	NZ,00199$
                           2467 ;src/main.c:465: if (dy < enemy->y) {
   7157 DD 7E 07      [19] 2468 	ld	a,7 (ix)
   715A 91            [ 4] 2469 	sub	a, c
   715B D2 E2 71      [10] 2470 	jp	NC,00136$
                           2471 ;src/main.c:466: if (dist > G_HERO_H + 5) {
   715E 3E 1B         [ 7] 2472 	ld	a,#0x1B
   7160 DD 96 F0      [19] 2473 	sub	a, -16 (ix)
   7163 D2 23 77      [10] 2474 	jp	NC,00208$
                           2475 ;src/main.c:467: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7166 41            [ 4] 2476 	ld	b,c
   7167 05            [ 4] 2477 	dec	b
   7168 05            [ 4] 2478 	dec	b
   7169 C5            [11] 2479 	push	bc
   716A 33            [ 6] 2480 	inc	sp
   716B DD 7E FA      [19] 2481 	ld	a,-6 (ix)
   716E F5            [11] 2482 	push	af
   716F 33            [ 6] 2483 	inc	sp
   7170 2A 31 63      [16] 2484 	ld	hl,(_mapa)
   7173 E5            [11] 2485 	push	hl
   7174 CD 71 4B      [17] 2486 	call	_getTilePtr
   7177 F1            [10] 2487 	pop	af
   7178 F1            [10] 2488 	pop	af
   7179 4E            [ 7] 2489 	ld	c,(hl)
   717A 3E 02         [ 7] 2490 	ld	a,#0x02
   717C 91            [ 4] 2491 	sub	a, c
   717D DA 23 77      [10] 2492 	jp	C,00208$
                           2493 ;src/main.c:468: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7180 DD 6E F6      [19] 2494 	ld	l,-10 (ix)
   7183 DD 66 F7      [19] 2495 	ld	h,-9 (ix)
   7186 56            [ 7] 2496 	ld	d,(hl)
   7187 15            [ 4] 2497 	dec	d
   7188 15            [ 4] 2498 	dec	d
   7189 DD 6E F4      [19] 2499 	ld	l,-12 (ix)
   718C DD 66 F5      [19] 2500 	ld	h,-11 (ix)
   718F 46            [ 7] 2501 	ld	b,(hl)
   7190 04            [ 4] 2502 	inc	b
   7191 04            [ 4] 2503 	inc	b
   7192 D5            [11] 2504 	push	de
   7193 33            [ 6] 2505 	inc	sp
   7194 C5            [11] 2506 	push	bc
   7195 33            [ 6] 2507 	inc	sp
   7196 2A 31 63      [16] 2508 	ld	hl,(_mapa)
   7199 E5            [11] 2509 	push	hl
   719A CD 71 4B      [17] 2510 	call	_getTilePtr
   719D F1            [10] 2511 	pop	af
   719E F1            [10] 2512 	pop	af
   719F 4E            [ 7] 2513 	ld	c,(hl)
   71A0 3E 02         [ 7] 2514 	ld	a,#0x02
   71A2 91            [ 4] 2515 	sub	a, c
   71A3 DA 23 77      [10] 2516 	jp	C,00208$
                           2517 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   71A6 DD 6E F6      [19] 2518 	ld	l,-10 (ix)
   71A9 DD 66 F7      [19] 2519 	ld	h,-9 (ix)
   71AC 46            [ 7] 2520 	ld	b,(hl)
   71AD 05            [ 4] 2521 	dec	b
   71AE 05            [ 4] 2522 	dec	b
   71AF DD 6E F4      [19] 2523 	ld	l,-12 (ix)
   71B2 DD 66 F5      [19] 2524 	ld	h,-11 (ix)
   71B5 7E            [ 7] 2525 	ld	a,(hl)
   71B6 C6 04         [ 7] 2526 	add	a, #0x04
   71B8 C5            [11] 2527 	push	bc
   71B9 33            [ 6] 2528 	inc	sp
   71BA F5            [11] 2529 	push	af
   71BB 33            [ 6] 2530 	inc	sp
   71BC 2A 31 63      [16] 2531 	ld	hl,(_mapa)
   71BF E5            [11] 2532 	push	hl
   71C0 CD 71 4B      [17] 2533 	call	_getTilePtr
   71C3 F1            [10] 2534 	pop	af
   71C4 F1            [10] 2535 	pop	af
   71C5 4E            [ 7] 2536 	ld	c,(hl)
   71C6 3E 02         [ 7] 2537 	ld	a,#0x02
   71C8 91            [ 4] 2538 	sub	a, c
   71C9 DA 23 77      [10] 2539 	jp	C,00208$
                           2540 ;src/main.c:470: moverEnemigoArriba(enemy);
   71CC DD 6E F4      [19] 2541 	ld	l,-12 (ix)
   71CF DD 66 F5      [19] 2542 	ld	h,-11 (ix)
   71D2 E5            [11] 2543 	push	hl
   71D3 CD 48 6A      [17] 2544 	call	_moverEnemigoArriba
   71D6 F1            [10] 2545 	pop	af
                           2546 ;src/main.c:472: enemy->mover = SI;
   71D7 DD 6E F8      [19] 2547 	ld	l,-8 (ix)
   71DA DD 66 F9      [19] 2548 	ld	h,-7 (ix)
   71DD 36 01         [10] 2549 	ld	(hl),#0x01
   71DF C3 23 77      [10] 2550 	jp	00208$
   71E2                    2551 00136$:
                           2552 ;src/main.c:476: if(dist > G_ENEMY_H + 7) {
   71E2 3E 1D         [ 7] 2553 	ld	a,#0x1D
   71E4 DD 96 F0      [19] 2554 	sub	a, -16 (ix)
   71E7 D2 23 77      [10] 2555 	jp	NC,00208$
                           2556 ;src/main.c:477: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   71EA 79            [ 4] 2557 	ld	a,c
   71EB C6 18         [ 7] 2558 	add	a, #0x18
   71ED 47            [ 4] 2559 	ld	b,a
   71EE C5            [11] 2560 	push	bc
   71EF 33            [ 6] 2561 	inc	sp
   71F0 DD 7E FA      [19] 2562 	ld	a,-6 (ix)
   71F3 F5            [11] 2563 	push	af
   71F4 33            [ 6] 2564 	inc	sp
   71F5 2A 31 63      [16] 2565 	ld	hl,(_mapa)
   71F8 E5            [11] 2566 	push	hl
   71F9 CD 71 4B      [17] 2567 	call	_getTilePtr
   71FC F1            [10] 2568 	pop	af
   71FD F1            [10] 2569 	pop	af
   71FE 4E            [ 7] 2570 	ld	c,(hl)
   71FF 3E 02         [ 7] 2571 	ld	a,#0x02
   7201 91            [ 4] 2572 	sub	a, c
   7202 DA 23 77      [10] 2573 	jp	C,00208$
                           2574 ;src/main.c:478: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7205 DD 6E F6      [19] 2575 	ld	l,-10 (ix)
   7208 DD 66 F7      [19] 2576 	ld	h,-9 (ix)
   720B 7E            [ 7] 2577 	ld	a,(hl)
   720C C6 18         [ 7] 2578 	add	a, #0x18
   720E 57            [ 4] 2579 	ld	d,a
   720F DD 6E F4      [19] 2580 	ld	l,-12 (ix)
   7212 DD 66 F5      [19] 2581 	ld	h,-11 (ix)
   7215 46            [ 7] 2582 	ld	b,(hl)
   7216 04            [ 4] 2583 	inc	b
   7217 04            [ 4] 2584 	inc	b
   7218 D5            [11] 2585 	push	de
   7219 33            [ 6] 2586 	inc	sp
   721A C5            [11] 2587 	push	bc
   721B 33            [ 6] 2588 	inc	sp
   721C 2A 31 63      [16] 2589 	ld	hl,(_mapa)
   721F E5            [11] 2590 	push	hl
   7220 CD 71 4B      [17] 2591 	call	_getTilePtr
   7223 F1            [10] 2592 	pop	af
   7224 F1            [10] 2593 	pop	af
   7225 4E            [ 7] 2594 	ld	c,(hl)
   7226 3E 02         [ 7] 2595 	ld	a,#0x02
   7228 91            [ 4] 2596 	sub	a, c
   7229 DA 23 77      [10] 2597 	jp	C,00208$
                           2598 ;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   722C DD 6E F6      [19] 2599 	ld	l,-10 (ix)
   722F DD 66 F7      [19] 2600 	ld	h,-9 (ix)
   7232 7E            [ 7] 2601 	ld	a,(hl)
   7233 C6 18         [ 7] 2602 	add	a, #0x18
   7235 47            [ 4] 2603 	ld	b,a
   7236 DD 6E F4      [19] 2604 	ld	l,-12 (ix)
   7239 DD 66 F5      [19] 2605 	ld	h,-11 (ix)
   723C 7E            [ 7] 2606 	ld	a,(hl)
   723D C6 04         [ 7] 2607 	add	a, #0x04
   723F C5            [11] 2608 	push	bc
   7240 33            [ 6] 2609 	inc	sp
   7241 F5            [11] 2610 	push	af
   7242 33            [ 6] 2611 	inc	sp
   7243 2A 31 63      [16] 2612 	ld	hl,(_mapa)
   7246 E5            [11] 2613 	push	hl
   7247 CD 71 4B      [17] 2614 	call	_getTilePtr
   724A F1            [10] 2615 	pop	af
   724B F1            [10] 2616 	pop	af
   724C 4E            [ 7] 2617 	ld	c,(hl)
   724D 3E 02         [ 7] 2618 	ld	a,#0x02
   724F 91            [ 4] 2619 	sub	a, c
   7250 DA 23 77      [10] 2620 	jp	C,00208$
                           2621 ;src/main.c:480: moverEnemigoAbajo(enemy);
   7253 DD 6E F4      [19] 2622 	ld	l,-12 (ix)
   7256 DD 66 F5      [19] 2623 	ld	h,-11 (ix)
   7259 E5            [11] 2624 	push	hl
   725A CD 67 6A      [17] 2625 	call	_moverEnemigoAbajo
   725D F1            [10] 2626 	pop	af
                           2627 ;src/main.c:482: enemy->mover = SI;
   725E DD 6E F8      [19] 2628 	ld	l,-8 (ix)
   7261 DD 66 F9      [19] 2629 	ld	h,-7 (ix)
   7264 36 01         [10] 2630 	ld	(hl),#0x01
   7266 C3 23 77      [10] 2631 	jp	00208$
   7269                    2632 00199$:
                           2633 ;src/main.c:488: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7269 3A 20 63      [13] 2634 	ld	a, (#_prota + 6)
   726C B7            [ 4] 2635 	or	a, a
   726D 20 04         [12] 2636 	jr	NZ,00139$
   726F DD 36 F2 14   [19] 2637 	ld	-14 (ix),#0x14
   7273                    2638 00139$:
                           2639 ;src/main.c:490: if (dist > distConstraint) {
   7273 DD 7E F2      [19] 2640 	ld	a,-14 (ix)
   7276 DD 96 F0      [19] 2641 	sub	a, -16 (ix)
   7279 D2 23 77      [10] 2642 	jp	NC,00208$
                           2643 ;src/main.c:491: if (dx + 1 < enemy->x) {
   727C DD 5E 06      [19] 2644 	ld	e,6 (ix)
   727F 16 00         [ 7] 2645 	ld	d,#0x00
   7281 13            [ 6] 2646 	inc	de
   7282 DD 7E FA      [19] 2647 	ld	a,-6 (ix)
   7285 DD 77 FE      [19] 2648 	ld	-2 (ix),a
   7288 DD 36 FF 00   [19] 2649 	ld	-1 (ix),#0x00
   728C 7B            [ 4] 2650 	ld	a,e
   728D DD 96 FE      [19] 2651 	sub	a, -2 (ix)
   7290 7A            [ 4] 2652 	ld	a,d
   7291 DD 9E FF      [19] 2653 	sbc	a, -1 (ix)
   7294 E2 99 72      [10] 2654 	jp	PO, 00452$
   7297 EE 80         [ 7] 2655 	xor	a, #0x80
   7299                    2656 00452$:
   7299 F2 18 73      [10] 2657 	jp	P,00151$
                           2658 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   729C 79            [ 4] 2659 	ld	a,c
   729D F5            [11] 2660 	push	af
   729E 33            [ 6] 2661 	inc	sp
   729F DD 7E FA      [19] 2662 	ld	a,-6 (ix)
   72A2 F5            [11] 2663 	push	af
   72A3 33            [ 6] 2664 	inc	sp
   72A4 2A 31 63      [16] 2665 	ld	hl,(_mapa)
   72A7 E5            [11] 2666 	push	hl
   72A8 CD 71 4B      [17] 2667 	call	_getTilePtr
   72AB F1            [10] 2668 	pop	af
   72AC F1            [10] 2669 	pop	af
   72AD 4E            [ 7] 2670 	ld	c,(hl)
   72AE 3E 02         [ 7] 2671 	ld	a,#0x02
   72B0 91            [ 4] 2672 	sub	a, c
   72B1 DA A2 73      [10] 2673 	jp	C,00152$
                           2674 ;src/main.c:493: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   72B4 DD 6E F6      [19] 2675 	ld	l,-10 (ix)
   72B7 DD 66 F7      [19] 2676 	ld	h,-9 (ix)
   72BA 7E            [ 7] 2677 	ld	a,(hl)
   72BB C6 0B         [ 7] 2678 	add	a, #0x0B
   72BD 57            [ 4] 2679 	ld	d,a
   72BE DD 6E F4      [19] 2680 	ld	l,-12 (ix)
   72C1 DD 66 F5      [19] 2681 	ld	h,-11 (ix)
   72C4 46            [ 7] 2682 	ld	b,(hl)
   72C5 D5            [11] 2683 	push	de
   72C6 33            [ 6] 2684 	inc	sp
   72C7 C5            [11] 2685 	push	bc
   72C8 33            [ 6] 2686 	inc	sp
   72C9 2A 31 63      [16] 2687 	ld	hl,(_mapa)
   72CC E5            [11] 2688 	push	hl
   72CD CD 71 4B      [17] 2689 	call	_getTilePtr
   72D0 F1            [10] 2690 	pop	af
   72D1 F1            [10] 2691 	pop	af
   72D2 4E            [ 7] 2692 	ld	c,(hl)
   72D3 3E 02         [ 7] 2693 	ld	a,#0x02
   72D5 91            [ 4] 2694 	sub	a, c
   72D6 DA A2 73      [10] 2695 	jp	C,00152$
                           2696 ;src/main.c:494: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   72D9 DD 6E F6      [19] 2697 	ld	l,-10 (ix)
   72DC DD 66 F7      [19] 2698 	ld	h,-9 (ix)
   72DF 7E            [ 7] 2699 	ld	a,(hl)
   72E0 C6 16         [ 7] 2700 	add	a, #0x16
   72E2 57            [ 4] 2701 	ld	d,a
   72E3 DD 6E F4      [19] 2702 	ld	l,-12 (ix)
   72E6 DD 66 F5      [19] 2703 	ld	h,-11 (ix)
   72E9 46            [ 7] 2704 	ld	b,(hl)
   72EA D5            [11] 2705 	push	de
   72EB 33            [ 6] 2706 	inc	sp
   72EC C5            [11] 2707 	push	bc
   72ED 33            [ 6] 2708 	inc	sp
   72EE 2A 31 63      [16] 2709 	ld	hl,(_mapa)
   72F1 E5            [11] 2710 	push	hl
   72F2 CD 71 4B      [17] 2711 	call	_getTilePtr
   72F5 F1            [10] 2712 	pop	af
   72F6 F1            [10] 2713 	pop	af
   72F7 4E            [ 7] 2714 	ld	c,(hl)
   72F8 3E 02         [ 7] 2715 	ld	a,#0x02
   72FA 91            [ 4] 2716 	sub	a, c
   72FB DA A2 73      [10] 2717 	jp	C,00152$
                           2718 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   72FE DD 6E F4      [19] 2719 	ld	l,-12 (ix)
   7301 DD 66 F5      [19] 2720 	ld	h,-11 (ix)
   7304 E5            [11] 2721 	push	hl
   7305 CD 96 6A      [17] 2722 	call	_moverEnemigoIzquierda
   7308 F1            [10] 2723 	pop	af
                           2724 ;src/main.c:496: movX = 1;
   7309 DD 36 F1 01   [19] 2725 	ld	-15 (ix),#0x01
                           2726 ;src/main.c:497: enemy->mover = SI;
   730D DD 6E F8      [19] 2727 	ld	l,-8 (ix)
   7310 DD 66 F9      [19] 2728 	ld	h,-7 (ix)
   7313 36 01         [10] 2729 	ld	(hl),#0x01
   7315 C3 A2 73      [10] 2730 	jp	00152$
   7318                    2731 00151$:
                           2732 ;src/main.c:499: } else if (dx + 1 > enemy->x){
   7318 DD 7E FE      [19] 2733 	ld	a,-2 (ix)
   731B 93            [ 4] 2734 	sub	a, e
   731C DD 7E FF      [19] 2735 	ld	a,-1 (ix)
   731F 9A            [ 4] 2736 	sbc	a, d
   7320 E2 25 73      [10] 2737 	jp	PO, 00453$
   7323 EE 80         [ 7] 2738 	xor	a, #0x80
   7325                    2739 00453$:
   7325 F2 A2 73      [10] 2740 	jp	P,00152$
                           2741 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7328 79            [ 4] 2742 	ld	a,c
   7329 F5            [11] 2743 	push	af
   732A 33            [ 6] 2744 	inc	sp
   732B DD 7E FB      [19] 2745 	ld	a,-5 (ix)
   732E F5            [11] 2746 	push	af
   732F 33            [ 6] 2747 	inc	sp
   7330 2A 31 63      [16] 2748 	ld	hl,(_mapa)
   7333 E5            [11] 2749 	push	hl
   7334 CD 71 4B      [17] 2750 	call	_getTilePtr
   7337 F1            [10] 2751 	pop	af
   7338 F1            [10] 2752 	pop	af
   7339 4E            [ 7] 2753 	ld	c,(hl)
   733A 3E 02         [ 7] 2754 	ld	a,#0x02
   733C 91            [ 4] 2755 	sub	a, c
   733D 38 63         [12] 2756 	jr	C,00152$
                           2757 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   733F DD 6E F6      [19] 2758 	ld	l,-10 (ix)
   7342 DD 66 F7      [19] 2759 	ld	h,-9 (ix)
   7345 7E            [ 7] 2760 	ld	a,(hl)
   7346 C6 0B         [ 7] 2761 	add	a, #0x0B
   7348 47            [ 4] 2762 	ld	b,a
   7349 DD 6E F4      [19] 2763 	ld	l,-12 (ix)
   734C DD 66 F5      [19] 2764 	ld	h,-11 (ix)
   734F 7E            [ 7] 2765 	ld	a,(hl)
   7350 C6 04         [ 7] 2766 	add	a, #0x04
   7352 C5            [11] 2767 	push	bc
   7353 33            [ 6] 2768 	inc	sp
   7354 F5            [11] 2769 	push	af
   7355 33            [ 6] 2770 	inc	sp
   7356 2A 31 63      [16] 2771 	ld	hl,(_mapa)
   7359 E5            [11] 2772 	push	hl
   735A CD 71 4B      [17] 2773 	call	_getTilePtr
   735D F1            [10] 2774 	pop	af
   735E F1            [10] 2775 	pop	af
   735F 4E            [ 7] 2776 	ld	c,(hl)
   7360 3E 02         [ 7] 2777 	ld	a,#0x02
   7362 91            [ 4] 2778 	sub	a, c
   7363 38 3D         [12] 2779 	jr	C,00152$
                           2780 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7365 DD 6E F6      [19] 2781 	ld	l,-10 (ix)
   7368 DD 66 F7      [19] 2782 	ld	h,-9 (ix)
   736B 7E            [ 7] 2783 	ld	a,(hl)
   736C C6 16         [ 7] 2784 	add	a, #0x16
   736E 47            [ 4] 2785 	ld	b,a
   736F DD 6E F4      [19] 2786 	ld	l,-12 (ix)
   7372 DD 66 F5      [19] 2787 	ld	h,-11 (ix)
   7375 7E            [ 7] 2788 	ld	a,(hl)
   7376 C6 04         [ 7] 2789 	add	a, #0x04
   7378 C5            [11] 2790 	push	bc
   7379 33            [ 6] 2791 	inc	sp
   737A F5            [11] 2792 	push	af
   737B 33            [ 6] 2793 	inc	sp
   737C 2A 31 63      [16] 2794 	ld	hl,(_mapa)
   737F E5            [11] 2795 	push	hl
   7380 CD 71 4B      [17] 2796 	call	_getTilePtr
   7383 F1            [10] 2797 	pop	af
   7384 F1            [10] 2798 	pop	af
   7385 4E            [ 7] 2799 	ld	c,(hl)
   7386 3E 02         [ 7] 2800 	ld	a,#0x02
   7388 91            [ 4] 2801 	sub	a, c
   7389 38 17         [12] 2802 	jr	C,00152$
                           2803 ;src/main.c:503: moverEnemigoDerecha(enemy);
   738B DD 6E F4      [19] 2804 	ld	l,-12 (ix)
   738E DD 66 F5      [19] 2805 	ld	h,-11 (ix)
   7391 E5            [11] 2806 	push	hl
   7392 CD 86 6A      [17] 2807 	call	_moverEnemigoDerecha
   7395 F1            [10] 2808 	pop	af
                           2809 ;src/main.c:504: movX = 1;
   7396 DD 36 F1 01   [19] 2810 	ld	-15 (ix),#0x01
                           2811 ;src/main.c:505: enemy->mover = SI;
   739A DD 6E F8      [19] 2812 	ld	l,-8 (ix)
   739D DD 66 F9      [19] 2813 	ld	h,-7 (ix)
   73A0 36 01         [10] 2814 	ld	(hl),#0x01
   73A2                    2815 00152$:
                           2816 ;src/main.c:508: if (dy < enemy->y) {
   73A2 DD 6E F6      [19] 2817 	ld	l,-10 (ix)
   73A5 DD 66 F7      [19] 2818 	ld	h,-9 (ix)
   73A8 7E            [ 7] 2819 	ld	a,(hl)
   73A9 DD 77 FE      [19] 2820 	ld	-2 (ix),a
                           2821 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   73AC DD 6E F4      [19] 2822 	ld	l,-12 (ix)
   73AF DD 66 F5      [19] 2823 	ld	h,-11 (ix)
   73B2 7E            [ 7] 2824 	ld	a,(hl)
   73B3 DD 77 FC      [19] 2825 	ld	-4 (ix),a
                           2826 ;src/main.c:508: if (dy < enemy->y) {
   73B6 DD 7E 07      [19] 2827 	ld	a,7 (ix)
   73B9 DD 96 FE      [19] 2828 	sub	a, -2 (ix)
   73BC D2 41 74      [10] 2829 	jp	NC,00162$
                           2830 ;src/main.c:509: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   73BF DD 46 FE      [19] 2831 	ld	b,-2 (ix)
   73C2 05            [ 4] 2832 	dec	b
   73C3 05            [ 4] 2833 	dec	b
   73C4 C5            [11] 2834 	push	bc
   73C5 33            [ 6] 2835 	inc	sp
   73C6 DD 7E FC      [19] 2836 	ld	a,-4 (ix)
   73C9 F5            [11] 2837 	push	af
   73CA 33            [ 6] 2838 	inc	sp
   73CB 2A 31 63      [16] 2839 	ld	hl,(_mapa)
   73CE E5            [11] 2840 	push	hl
   73CF CD 71 4B      [17] 2841 	call	_getTilePtr
   73D2 F1            [10] 2842 	pop	af
   73D3 F1            [10] 2843 	pop	af
   73D4 4E            [ 7] 2844 	ld	c,(hl)
   73D5 3E 02         [ 7] 2845 	ld	a,#0x02
   73D7 91            [ 4] 2846 	sub	a, c
   73D8 DA C0 74      [10] 2847 	jp	C,00163$
                           2848 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73DB DD 6E F6      [19] 2849 	ld	l,-10 (ix)
   73DE DD 66 F7      [19] 2850 	ld	h,-9 (ix)
   73E1 56            [ 7] 2851 	ld	d,(hl)
   73E2 15            [ 4] 2852 	dec	d
   73E3 15            [ 4] 2853 	dec	d
   73E4 DD 6E F4      [19] 2854 	ld	l,-12 (ix)
   73E7 DD 66 F5      [19] 2855 	ld	h,-11 (ix)
   73EA 46            [ 7] 2856 	ld	b,(hl)
   73EB 04            [ 4] 2857 	inc	b
   73EC 04            [ 4] 2858 	inc	b
   73ED D5            [11] 2859 	push	de
   73EE 33            [ 6] 2860 	inc	sp
   73EF C5            [11] 2861 	push	bc
   73F0 33            [ 6] 2862 	inc	sp
   73F1 2A 31 63      [16] 2863 	ld	hl,(_mapa)
   73F4 E5            [11] 2864 	push	hl
   73F5 CD 71 4B      [17] 2865 	call	_getTilePtr
   73F8 F1            [10] 2866 	pop	af
   73F9 F1            [10] 2867 	pop	af
   73FA 4E            [ 7] 2868 	ld	c,(hl)
   73FB 3E 02         [ 7] 2869 	ld	a,#0x02
   73FD 91            [ 4] 2870 	sub	a, c
   73FE DA C0 74      [10] 2871 	jp	C,00163$
                           2872 ;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7401 DD 6E F6      [19] 2873 	ld	l,-10 (ix)
   7404 DD 66 F7      [19] 2874 	ld	h,-9 (ix)
   7407 46            [ 7] 2875 	ld	b,(hl)
   7408 05            [ 4] 2876 	dec	b
   7409 05            [ 4] 2877 	dec	b
   740A DD 6E F4      [19] 2878 	ld	l,-12 (ix)
   740D DD 66 F5      [19] 2879 	ld	h,-11 (ix)
   7410 7E            [ 7] 2880 	ld	a,(hl)
   7411 C6 04         [ 7] 2881 	add	a, #0x04
   7413 C5            [11] 2882 	push	bc
   7414 33            [ 6] 2883 	inc	sp
   7415 F5            [11] 2884 	push	af
   7416 33            [ 6] 2885 	inc	sp
   7417 2A 31 63      [16] 2886 	ld	hl,(_mapa)
   741A E5            [11] 2887 	push	hl
   741B CD 71 4B      [17] 2888 	call	_getTilePtr
   741E F1            [10] 2889 	pop	af
   741F F1            [10] 2890 	pop	af
   7420 4E            [ 7] 2891 	ld	c,(hl)
   7421 3E 02         [ 7] 2892 	ld	a,#0x02
   7423 91            [ 4] 2893 	sub	a, c
   7424 DA C0 74      [10] 2894 	jp	C,00163$
                           2895 ;src/main.c:512: moverEnemigoArriba(enemy);
   7427 DD 6E F4      [19] 2896 	ld	l,-12 (ix)
   742A DD 66 F5      [19] 2897 	ld	h,-11 (ix)
   742D E5            [11] 2898 	push	hl
   742E CD 48 6A      [17] 2899 	call	_moverEnemigoArriba
   7431 F1            [10] 2900 	pop	af
                           2901 ;src/main.c:513: movY = 1;
   7432 DD 36 F3 01   [19] 2902 	ld	-13 (ix),#0x01
                           2903 ;src/main.c:514: enemy->mover = SI;
   7436 DD 6E F8      [19] 2904 	ld	l,-8 (ix)
   7439 DD 66 F9      [19] 2905 	ld	h,-7 (ix)
   743C 36 01         [10] 2906 	ld	(hl),#0x01
   743E C3 C0 74      [10] 2907 	jp	00163$
   7441                    2908 00162$:
                           2909 ;src/main.c:517: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7441 DD 7E FE      [19] 2910 	ld	a,-2 (ix)
   7444 C6 18         [ 7] 2911 	add	a, #0x18
   7446 47            [ 4] 2912 	ld	b,a
   7447 C5            [11] 2913 	push	bc
   7448 33            [ 6] 2914 	inc	sp
   7449 DD 7E FC      [19] 2915 	ld	a,-4 (ix)
   744C F5            [11] 2916 	push	af
   744D 33            [ 6] 2917 	inc	sp
   744E 2A 31 63      [16] 2918 	ld	hl,(_mapa)
   7451 E5            [11] 2919 	push	hl
   7452 CD 71 4B      [17] 2920 	call	_getTilePtr
   7455 F1            [10] 2921 	pop	af
   7456 F1            [10] 2922 	pop	af
   7457 4E            [ 7] 2923 	ld	c,(hl)
   7458 3E 02         [ 7] 2924 	ld	a,#0x02
   745A 91            [ 4] 2925 	sub	a, c
   745B 38 63         [12] 2926 	jr	C,00163$
                           2927 ;src/main.c:518: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   745D DD 6E F6      [19] 2928 	ld	l,-10 (ix)
   7460 DD 66 F7      [19] 2929 	ld	h,-9 (ix)
   7463 7E            [ 7] 2930 	ld	a,(hl)
   7464 C6 18         [ 7] 2931 	add	a, #0x18
   7466 57            [ 4] 2932 	ld	d,a
   7467 DD 6E F4      [19] 2933 	ld	l,-12 (ix)
   746A DD 66 F5      [19] 2934 	ld	h,-11 (ix)
   746D 46            [ 7] 2935 	ld	b,(hl)
   746E 04            [ 4] 2936 	inc	b
   746F 04            [ 4] 2937 	inc	b
   7470 D5            [11] 2938 	push	de
   7471 33            [ 6] 2939 	inc	sp
   7472 C5            [11] 2940 	push	bc
   7473 33            [ 6] 2941 	inc	sp
   7474 2A 31 63      [16] 2942 	ld	hl,(_mapa)
   7477 E5            [11] 2943 	push	hl
   7478 CD 71 4B      [17] 2944 	call	_getTilePtr
   747B F1            [10] 2945 	pop	af
   747C F1            [10] 2946 	pop	af
   747D 4E            [ 7] 2947 	ld	c,(hl)
   747E 3E 02         [ 7] 2948 	ld	a,#0x02
   7480 91            [ 4] 2949 	sub	a, c
   7481 38 3D         [12] 2950 	jr	C,00163$
                           2951 ;src/main.c:519: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7483 DD 6E F6      [19] 2952 	ld	l,-10 (ix)
   7486 DD 66 F7      [19] 2953 	ld	h,-9 (ix)
   7489 7E            [ 7] 2954 	ld	a,(hl)
   748A C6 18         [ 7] 2955 	add	a, #0x18
   748C 47            [ 4] 2956 	ld	b,a
   748D DD 6E F4      [19] 2957 	ld	l,-12 (ix)
   7490 DD 66 F5      [19] 2958 	ld	h,-11 (ix)
   7493 7E            [ 7] 2959 	ld	a,(hl)
   7494 C6 04         [ 7] 2960 	add	a, #0x04
   7496 C5            [11] 2961 	push	bc
   7497 33            [ 6] 2962 	inc	sp
   7498 F5            [11] 2963 	push	af
   7499 33            [ 6] 2964 	inc	sp
   749A 2A 31 63      [16] 2965 	ld	hl,(_mapa)
   749D E5            [11] 2966 	push	hl
   749E CD 71 4B      [17] 2967 	call	_getTilePtr
   74A1 F1            [10] 2968 	pop	af
   74A2 F1            [10] 2969 	pop	af
   74A3 4E            [ 7] 2970 	ld	c,(hl)
   74A4 3E 02         [ 7] 2971 	ld	a,#0x02
   74A6 91            [ 4] 2972 	sub	a, c
   74A7 38 17         [12] 2973 	jr	C,00163$
                           2974 ;src/main.c:520: moverEnemigoAbajo(enemy);
   74A9 DD 6E F4      [19] 2975 	ld	l,-12 (ix)
   74AC DD 66 F5      [19] 2976 	ld	h,-11 (ix)
   74AF E5            [11] 2977 	push	hl
   74B0 CD 67 6A      [17] 2978 	call	_moverEnemigoAbajo
   74B3 F1            [10] 2979 	pop	af
                           2980 ;src/main.c:521: movY = 1;
   74B4 DD 36 F3 01   [19] 2981 	ld	-13 (ix),#0x01
                           2982 ;src/main.c:522: enemy->mover = SI;
   74B8 DD 6E F8      [19] 2983 	ld	l,-8 (ix)
   74BB DD 66 F9      [19] 2984 	ld	h,-7 (ix)
   74BE 36 01         [10] 2985 	ld	(hl),#0x01
   74C0                    2986 00163$:
                           2987 ;src/main.c:525: if (!enemy->mover) {
   74C0 DD 6E F8      [19] 2988 	ld	l,-8 (ix)
   74C3 DD 66 F9      [19] 2989 	ld	h,-7 (ix)
   74C6 7E            [ 7] 2990 	ld	a,(hl)
   74C7 B7            [ 4] 2991 	or	a, a
   74C8 C2 23 77      [10] 2992 	jp	NZ,00208$
                           2993 ;src/main.c:526: if (!movX) {
   74CB DD 7E F1      [19] 2994 	ld	a,-15 (ix)
   74CE B7            [ 4] 2995 	or	a, a
   74CF C2 F8 75      [10] 2996 	jp	NZ,00178$
                           2997 ;src/main.c:527: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   74D2 DD 6E F6      [19] 2998 	ld	l,-10 (ix)
   74D5 DD 66 F7      [19] 2999 	ld	h,-9 (ix)
   74D8 5E            [ 7] 3000 	ld	e,(hl)
                           3001 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   74D9 DD 6E F4      [19] 3002 	ld	l,-12 (ix)
   74DC DD 66 F5      [19] 3003 	ld	h,-11 (ix)
   74DF 4E            [ 7] 3004 	ld	c,(hl)
                           3005 ;src/main.c:527: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   74E0 3E 70         [ 7] 3006 	ld	a,#0x70
   74E2 93            [ 4] 3007 	sub	a, e
   74E3 D2 73 75      [10] 3008 	jp	NC,00175$
                           3009 ;src/main.c:528: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   74E6 7B            [ 4] 3010 	ld	a,e
   74E7 C6 18         [ 7] 3011 	add	a, #0x18
   74E9 47            [ 4] 3012 	ld	b,a
   74EA C5            [11] 3013 	push	bc
   74EB 2A 31 63      [16] 3014 	ld	hl,(_mapa)
   74EE E5            [11] 3015 	push	hl
   74EF CD 71 4B      [17] 3016 	call	_getTilePtr
   74F2 F1            [10] 3017 	pop	af
   74F3 F1            [10] 3018 	pop	af
   74F4 4E            [ 7] 3019 	ld	c,(hl)
   74F5 3E 02         [ 7] 3020 	ld	a,#0x02
   74F7 91            [ 4] 3021 	sub	a, c
   74F8 38 63         [12] 3022 	jr	C,00165$
                           3023 ;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   74FA DD 6E F6      [19] 3024 	ld	l,-10 (ix)
   74FD DD 66 F7      [19] 3025 	ld	h,-9 (ix)
   7500 7E            [ 7] 3026 	ld	a,(hl)
   7501 C6 18         [ 7] 3027 	add	a, #0x18
   7503 57            [ 4] 3028 	ld	d,a
   7504 DD 6E F4      [19] 3029 	ld	l,-12 (ix)
   7507 DD 66 F5      [19] 3030 	ld	h,-11 (ix)
   750A 4E            [ 7] 3031 	ld	c,(hl)
   750B 41            [ 4] 3032 	ld	b,c
   750C 04            [ 4] 3033 	inc	b
   750D 04            [ 4] 3034 	inc	b
   750E D5            [11] 3035 	push	de
   750F 33            [ 6] 3036 	inc	sp
   7510 C5            [11] 3037 	push	bc
   7511 33            [ 6] 3038 	inc	sp
   7512 2A 31 63      [16] 3039 	ld	hl,(_mapa)
   7515 E5            [11] 3040 	push	hl
   7516 CD 71 4B      [17] 3041 	call	_getTilePtr
   7519 F1            [10] 3042 	pop	af
   751A F1            [10] 3043 	pop	af
   751B 4E            [ 7] 3044 	ld	c,(hl)
   751C 3E 02         [ 7] 3045 	ld	a,#0x02
   751E 91            [ 4] 3046 	sub	a, c
   751F 38 3C         [12] 3047 	jr	C,00165$
                           3048 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7521 DD 6E F6      [19] 3049 	ld	l,-10 (ix)
   7524 DD 66 F7      [19] 3050 	ld	h,-9 (ix)
   7527 7E            [ 7] 3051 	ld	a,(hl)
   7528 C6 18         [ 7] 3052 	add	a, #0x18
   752A 47            [ 4] 3053 	ld	b,a
   752B DD 6E F4      [19] 3054 	ld	l,-12 (ix)
   752E DD 66 F5      [19] 3055 	ld	h,-11 (ix)
   7531 7E            [ 7] 3056 	ld	a,(hl)
   7532 C6 04         [ 7] 3057 	add	a, #0x04
   7534 C5            [11] 3058 	push	bc
   7535 33            [ 6] 3059 	inc	sp
   7536 F5            [11] 3060 	push	af
   7537 33            [ 6] 3061 	inc	sp
   7538 2A 31 63      [16] 3062 	ld	hl,(_mapa)
   753B E5            [11] 3063 	push	hl
   753C CD 71 4B      [17] 3064 	call	_getTilePtr
   753F F1            [10] 3065 	pop	af
   7540 F1            [10] 3066 	pop	af
   7541 4E            [ 7] 3067 	ld	c,(hl)
   7542 3E 02         [ 7] 3068 	ld	a,#0x02
   7544 91            [ 4] 3069 	sub	a, c
   7545 38 16         [12] 3070 	jr	C,00165$
                           3071 ;src/main.c:531: moverEnemigoAbajo(enemy);
   7547 DD 6E F4      [19] 3072 	ld	l,-12 (ix)
   754A DD 66 F5      [19] 3073 	ld	h,-11 (ix)
   754D E5            [11] 3074 	push	hl
   754E CD 67 6A      [17] 3075 	call	_moverEnemigoAbajo
   7551 F1            [10] 3076 	pop	af
                           3077 ;src/main.c:532: enemy->mover = SI;
   7552 DD 6E F8      [19] 3078 	ld	l,-8 (ix)
   7555 DD 66 F9      [19] 3079 	ld	h,-7 (ix)
   7558 36 01         [10] 3080 	ld	(hl),#0x01
   755A C3 F8 75      [10] 3081 	jp	00178$
   755D                    3082 00165$:
                           3083 ;src/main.c:534: moverEnemigoArriba(enemy);
   755D DD 6E F4      [19] 3084 	ld	l,-12 (ix)
   7560 DD 66 F5      [19] 3085 	ld	h,-11 (ix)
   7563 E5            [11] 3086 	push	hl
   7564 CD 48 6A      [17] 3087 	call	_moverEnemigoArriba
   7567 F1            [10] 3088 	pop	af
                           3089 ;src/main.c:535: enemy->mover = SI;
   7568 DD 6E F8      [19] 3090 	ld	l,-8 (ix)
   756B DD 66 F9      [19] 3091 	ld	h,-7 (ix)
   756E 36 01         [10] 3092 	ld	(hl),#0x01
   7570 C3 F8 75      [10] 3093 	jp	00178$
   7573                    3094 00175$:
                           3095 ;src/main.c:538: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7573 43            [ 4] 3096 	ld	b,e
   7574 05            [ 4] 3097 	dec	b
   7575 05            [ 4] 3098 	dec	b
   7576 C5            [11] 3099 	push	bc
   7577 2A 31 63      [16] 3100 	ld	hl,(_mapa)
   757A E5            [11] 3101 	push	hl
   757B CD 71 4B      [17] 3102 	call	_getTilePtr
   757E F1            [10] 3103 	pop	af
   757F F1            [10] 3104 	pop	af
   7580 4E            [ 7] 3105 	ld	c,(hl)
   7581 3E 02         [ 7] 3106 	ld	a,#0x02
   7583 91            [ 4] 3107 	sub	a, c
   7584 38 5F         [12] 3108 	jr	C,00170$
                           3109 ;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7586 DD 6E F6      [19] 3110 	ld	l,-10 (ix)
   7589 DD 66 F7      [19] 3111 	ld	h,-9 (ix)
   758C 56            [ 7] 3112 	ld	d,(hl)
   758D 15            [ 4] 3113 	dec	d
   758E 15            [ 4] 3114 	dec	d
   758F DD 6E F4      [19] 3115 	ld	l,-12 (ix)
   7592 DD 66 F5      [19] 3116 	ld	h,-11 (ix)
   7595 46            [ 7] 3117 	ld	b,(hl)
   7596 04            [ 4] 3118 	inc	b
   7597 04            [ 4] 3119 	inc	b
   7598 D5            [11] 3120 	push	de
   7599 33            [ 6] 3121 	inc	sp
   759A C5            [11] 3122 	push	bc
   759B 33            [ 6] 3123 	inc	sp
   759C 2A 31 63      [16] 3124 	ld	hl,(_mapa)
   759F E5            [11] 3125 	push	hl
   75A0 CD 71 4B      [17] 3126 	call	_getTilePtr
   75A3 F1            [10] 3127 	pop	af
   75A4 F1            [10] 3128 	pop	af
   75A5 4E            [ 7] 3129 	ld	c,(hl)
   75A6 3E 02         [ 7] 3130 	ld	a,#0x02
   75A8 91            [ 4] 3131 	sub	a, c
   75A9 38 3A         [12] 3132 	jr	C,00170$
                           3133 ;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   75AB DD 6E F6      [19] 3134 	ld	l,-10 (ix)
   75AE DD 66 F7      [19] 3135 	ld	h,-9 (ix)
   75B1 46            [ 7] 3136 	ld	b,(hl)
   75B2 05            [ 4] 3137 	dec	b
   75B3 05            [ 4] 3138 	dec	b
   75B4 DD 6E F4      [19] 3139 	ld	l,-12 (ix)
   75B7 DD 66 F5      [19] 3140 	ld	h,-11 (ix)
   75BA 7E            [ 7] 3141 	ld	a,(hl)
   75BB C6 04         [ 7] 3142 	add	a, #0x04
   75BD C5            [11] 3143 	push	bc
   75BE 33            [ 6] 3144 	inc	sp
   75BF F5            [11] 3145 	push	af
   75C0 33            [ 6] 3146 	inc	sp
   75C1 2A 31 63      [16] 3147 	ld	hl,(_mapa)
   75C4 E5            [11] 3148 	push	hl
   75C5 CD 71 4B      [17] 3149 	call	_getTilePtr
   75C8 F1            [10] 3150 	pop	af
   75C9 F1            [10] 3151 	pop	af
   75CA 4E            [ 7] 3152 	ld	c,(hl)
   75CB 3E 02         [ 7] 3153 	ld	a,#0x02
   75CD 91            [ 4] 3154 	sub	a, c
   75CE 38 15         [12] 3155 	jr	C,00170$
                           3156 ;src/main.c:541: moverEnemigoArriba(enemy);
   75D0 DD 6E F4      [19] 3157 	ld	l,-12 (ix)
   75D3 DD 66 F5      [19] 3158 	ld	h,-11 (ix)
   75D6 E5            [11] 3159 	push	hl
   75D7 CD 48 6A      [17] 3160 	call	_moverEnemigoArriba
   75DA F1            [10] 3161 	pop	af
                           3162 ;src/main.c:542: enemy->mover = SI;
   75DB DD 6E F8      [19] 3163 	ld	l,-8 (ix)
   75DE DD 66 F9      [19] 3164 	ld	h,-7 (ix)
   75E1 36 01         [10] 3165 	ld	(hl),#0x01
   75E3 18 13         [12] 3166 	jr	00178$
   75E5                    3167 00170$:
                           3168 ;src/main.c:544: moverEnemigoAbajo(enemy);
   75E5 DD 6E F4      [19] 3169 	ld	l,-12 (ix)
   75E8 DD 66 F5      [19] 3170 	ld	h,-11 (ix)
   75EB E5            [11] 3171 	push	hl
   75EC CD 67 6A      [17] 3172 	call	_moverEnemigoAbajo
   75EF F1            [10] 3173 	pop	af
                           3174 ;src/main.c:545: enemy->mover = SI;
   75F0 DD 6E F8      [19] 3175 	ld	l,-8 (ix)
   75F3 DD 66 F9      [19] 3176 	ld	h,-7 (ix)
   75F6 36 01         [10] 3177 	ld	(hl),#0x01
   75F8                    3178 00178$:
                           3179 ;src/main.c:550: if (!movY) {
   75F8 DD 7E F3      [19] 3180 	ld	a,-13 (ix)
   75FB B7            [ 4] 3181 	or	a, a
   75FC C2 23 77      [10] 3182 	jp	NZ,00208$
                           3183 ;src/main.c:551: if (enemy->x < ANCHO_PANTALLA/2) {
   75FF DD 6E F4      [19] 3184 	ld	l,-12 (ix)
   7602 DD 66 F5      [19] 3185 	ld	h,-11 (ix)
   7605 4E            [ 7] 3186 	ld	c,(hl)
                           3187 ;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
   7606 DD 6E F6      [19] 3188 	ld	l,-10 (ix)
   7609 DD 66 F7      [19] 3189 	ld	h,-9 (ix)
   760C 56            [ 7] 3190 	ld	d,(hl)
                           3191 ;src/main.c:551: if (enemy->x < ANCHO_PANTALLA/2) {
   760D 79            [ 4] 3192 	ld	a,c
   760E D6 28         [ 7] 3193 	sub	a, #0x28
   7610 D2 99 76      [10] 3194 	jp	NC,00190$
                           3195 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7613 D5            [11] 3196 	push	de
   7614 33            [ 6] 3197 	inc	sp
   7615 79            [ 4] 3198 	ld	a,c
   7616 F5            [11] 3199 	push	af
   7617 33            [ 6] 3200 	inc	sp
   7618 2A 31 63      [16] 3201 	ld	hl,(_mapa)
   761B E5            [11] 3202 	push	hl
   761C CD 71 4B      [17] 3203 	call	_getTilePtr
   761F F1            [10] 3204 	pop	af
   7620 F1            [10] 3205 	pop	af
   7621 4E            [ 7] 3206 	ld	c,(hl)
   7622 3E 02         [ 7] 3207 	ld	a,#0x02
   7624 91            [ 4] 3208 	sub	a, c
   7625 38 5C         [12] 3209 	jr	C,00180$
                           3210 ;src/main.c:553: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7627 DD 6E F6      [19] 3211 	ld	l,-10 (ix)
   762A DD 66 F7      [19] 3212 	ld	h,-9 (ix)
   762D 7E            [ 7] 3213 	ld	a,(hl)
   762E C6 0B         [ 7] 3214 	add	a, #0x0B
   7630 DD 6E F4      [19] 3215 	ld	l,-12 (ix)
   7633 DD 66 F5      [19] 3216 	ld	h,-11 (ix)
   7636 46            [ 7] 3217 	ld	b,(hl)
   7637 F5            [11] 3218 	push	af
   7638 33            [ 6] 3219 	inc	sp
   7639 C5            [11] 3220 	push	bc
   763A 33            [ 6] 3221 	inc	sp
   763B 2A 31 63      [16] 3222 	ld	hl,(_mapa)
   763E E5            [11] 3223 	push	hl
   763F CD 71 4B      [17] 3224 	call	_getTilePtr
   7642 F1            [10] 3225 	pop	af
   7643 F1            [10] 3226 	pop	af
   7644 4E            [ 7] 3227 	ld	c,(hl)
   7645 3E 02         [ 7] 3228 	ld	a,#0x02
   7647 91            [ 4] 3229 	sub	a, c
   7648 38 39         [12] 3230 	jr	C,00180$
                           3231 ;src/main.c:554: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   764A DD 6E F6      [19] 3232 	ld	l,-10 (ix)
   764D DD 66 F7      [19] 3233 	ld	h,-9 (ix)
   7650 7E            [ 7] 3234 	ld	a,(hl)
   7651 C6 16         [ 7] 3235 	add	a, #0x16
   7653 DD 6E F4      [19] 3236 	ld	l,-12 (ix)
   7656 DD 66 F5      [19] 3237 	ld	h,-11 (ix)
   7659 46            [ 7] 3238 	ld	b,(hl)
   765A F5            [11] 3239 	push	af
   765B 33            [ 6] 3240 	inc	sp
   765C C5            [11] 3241 	push	bc
   765D 33            [ 6] 3242 	inc	sp
   765E 2A 31 63      [16] 3243 	ld	hl,(_mapa)
   7661 E5            [11] 3244 	push	hl
   7662 CD 71 4B      [17] 3245 	call	_getTilePtr
   7665 F1            [10] 3246 	pop	af
   7666 F1            [10] 3247 	pop	af
   7667 4E            [ 7] 3248 	ld	c,(hl)
   7668 3E 02         [ 7] 3249 	ld	a,#0x02
   766A 91            [ 4] 3250 	sub	a, c
   766B 38 16         [12] 3251 	jr	C,00180$
                           3252 ;src/main.c:555: moverEnemigoIzquierda(enemy);
   766D DD 6E F4      [19] 3253 	ld	l,-12 (ix)
   7670 DD 66 F5      [19] 3254 	ld	h,-11 (ix)
   7673 E5            [11] 3255 	push	hl
   7674 CD 96 6A      [17] 3256 	call	_moverEnemigoIzquierda
   7677 F1            [10] 3257 	pop	af
                           3258 ;src/main.c:556: enemy->mover = SI;
   7678 DD 6E F8      [19] 3259 	ld	l,-8 (ix)
   767B DD 66 F9      [19] 3260 	ld	h,-7 (ix)
   767E 36 01         [10] 3261 	ld	(hl),#0x01
   7680 C3 23 77      [10] 3262 	jp	00208$
   7683                    3263 00180$:
                           3264 ;src/main.c:558: moverEnemigoDerecha(enemy);
   7683 DD 6E F4      [19] 3265 	ld	l,-12 (ix)
   7686 DD 66 F5      [19] 3266 	ld	h,-11 (ix)
   7689 E5            [11] 3267 	push	hl
   768A CD 86 6A      [17] 3268 	call	_moverEnemigoDerecha
   768D F1            [10] 3269 	pop	af
                           3270 ;src/main.c:559: enemy->mover = SI;
   768E DD 6E F8      [19] 3271 	ld	l,-8 (ix)
   7691 DD 66 F9      [19] 3272 	ld	h,-7 (ix)
   7694 36 01         [10] 3273 	ld	(hl),#0x01
   7696 C3 23 77      [10] 3274 	jp	00208$
   7699                    3275 00190$:
                           3276 ;src/main.c:562: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7699 79            [ 4] 3277 	ld	a,c
   769A C6 04         [ 7] 3278 	add	a, #0x04
   769C D5            [11] 3279 	push	de
   769D 33            [ 6] 3280 	inc	sp
   769E F5            [11] 3281 	push	af
   769F 33            [ 6] 3282 	inc	sp
   76A0 2A 31 63      [16] 3283 	ld	hl,(_mapa)
   76A3 E5            [11] 3284 	push	hl
   76A4 CD 71 4B      [17] 3285 	call	_getTilePtr
   76A7 F1            [10] 3286 	pop	af
   76A8 F1            [10] 3287 	pop	af
   76A9 4E            [ 7] 3288 	ld	c,(hl)
   76AA 3E 02         [ 7] 3289 	ld	a,#0x02
   76AC 91            [ 4] 3290 	sub	a, c
   76AD 38 61         [12] 3291 	jr	C,00185$
                           3292 ;src/main.c:563: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   76AF DD 6E F6      [19] 3293 	ld	l,-10 (ix)
   76B2 DD 66 F7      [19] 3294 	ld	h,-9 (ix)
   76B5 7E            [ 7] 3295 	ld	a,(hl)
   76B6 C6 0B         [ 7] 3296 	add	a, #0x0B
   76B8 47            [ 4] 3297 	ld	b,a
   76B9 DD 6E F4      [19] 3298 	ld	l,-12 (ix)
   76BC DD 66 F5      [19] 3299 	ld	h,-11 (ix)
   76BF 7E            [ 7] 3300 	ld	a,(hl)
   76C0 C6 04         [ 7] 3301 	add	a, #0x04
   76C2 C5            [11] 3302 	push	bc
   76C3 33            [ 6] 3303 	inc	sp
   76C4 F5            [11] 3304 	push	af
   76C5 33            [ 6] 3305 	inc	sp
   76C6 2A 31 63      [16] 3306 	ld	hl,(_mapa)
   76C9 E5            [11] 3307 	push	hl
   76CA CD 71 4B      [17] 3308 	call	_getTilePtr
   76CD F1            [10] 3309 	pop	af
   76CE F1            [10] 3310 	pop	af
   76CF 4E            [ 7] 3311 	ld	c,(hl)
   76D0 3E 02         [ 7] 3312 	ld	a,#0x02
   76D2 91            [ 4] 3313 	sub	a, c
   76D3 38 3B         [12] 3314 	jr	C,00185$
                           3315 ;src/main.c:564: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   76D5 DD 6E F6      [19] 3316 	ld	l,-10 (ix)
   76D8 DD 66 F7      [19] 3317 	ld	h,-9 (ix)
   76DB 7E            [ 7] 3318 	ld	a,(hl)
   76DC C6 16         [ 7] 3319 	add	a, #0x16
   76DE 47            [ 4] 3320 	ld	b,a
   76DF DD 6E F4      [19] 3321 	ld	l,-12 (ix)
   76E2 DD 66 F5      [19] 3322 	ld	h,-11 (ix)
   76E5 7E            [ 7] 3323 	ld	a,(hl)
   76E6 C6 04         [ 7] 3324 	add	a, #0x04
   76E8 C5            [11] 3325 	push	bc
   76E9 33            [ 6] 3326 	inc	sp
   76EA F5            [11] 3327 	push	af
   76EB 33            [ 6] 3328 	inc	sp
   76EC 2A 31 63      [16] 3329 	ld	hl,(_mapa)
   76EF E5            [11] 3330 	push	hl
   76F0 CD 71 4B      [17] 3331 	call	_getTilePtr
   76F3 F1            [10] 3332 	pop	af
   76F4 F1            [10] 3333 	pop	af
   76F5 4E            [ 7] 3334 	ld	c,(hl)
   76F6 3E 02         [ 7] 3335 	ld	a,#0x02
   76F8 91            [ 4] 3336 	sub	a, c
   76F9 38 15         [12] 3337 	jr	C,00185$
                           3338 ;src/main.c:565: moverEnemigoDerecha(enemy);
   76FB DD 6E F4      [19] 3339 	ld	l,-12 (ix)
   76FE DD 66 F5      [19] 3340 	ld	h,-11 (ix)
   7701 E5            [11] 3341 	push	hl
   7702 CD 86 6A      [17] 3342 	call	_moverEnemigoDerecha
   7705 F1            [10] 3343 	pop	af
                           3344 ;src/main.c:566: enemy->mover = SI;
   7706 DD 6E F8      [19] 3345 	ld	l,-8 (ix)
   7709 DD 66 F9      [19] 3346 	ld	h,-7 (ix)
   770C 36 01         [10] 3347 	ld	(hl),#0x01
   770E 18 13         [12] 3348 	jr	00208$
   7710                    3349 00185$:
                           3350 ;src/main.c:569: moverEnemigoIzquierda(enemy);
   7710 DD 6E F4      [19] 3351 	ld	l,-12 (ix)
   7713 DD 66 F5      [19] 3352 	ld	h,-11 (ix)
   7716 E5            [11] 3353 	push	hl
   7717 CD 96 6A      [17] 3354 	call	_moverEnemigoIzquierda
   771A F1            [10] 3355 	pop	af
                           3356 ;src/main.c:570: enemy->mover = SI;
   771B DD 6E F8      [19] 3357 	ld	l,-8 (ix)
   771E DD 66 F9      [19] 3358 	ld	h,-7 (ix)
   7721 36 01         [10] 3359 	ld	(hl),#0x01
   7723                    3360 00208$:
   7723 DD F9         [10] 3361 	ld	sp, ix
   7725 DD E1         [14] 3362 	pop	ix
   7727 C9            [10] 3363 	ret
                           3364 ;src/main.c:580: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3365 ;	---------------------------------
                           3366 ; Function updateEnemy
                           3367 ; ---------------------------------
   7728                    3368 _updateEnemy::
   7728 DD E5         [15] 3369 	push	ix
   772A DD 21 00 00   [14] 3370 	ld	ix,#0
   772E DD 39         [15] 3371 	add	ix,sp
   7730 21 F4 FF      [10] 3372 	ld	hl,#-12
   7733 39            [11] 3373 	add	hl,sp
   7734 F9            [ 6] 3374 	ld	sp,hl
                           3375 ;src/main.c:587: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7735 DD 4E 04      [19] 3376 	ld	c,4 (ix)
   7738 DD 46 05      [19] 3377 	ld	b,5 (ix)
   773B 21 15 00      [10] 3378 	ld	hl,#0x0015
   773E 09            [11] 3379 	add	hl,bc
   773F DD 75 FD      [19] 3380 	ld	-3 (ix),l
   7742 DD 74 FE      [19] 3381 	ld	-2 (ix),h
   7745 DD 6E FD      [19] 3382 	ld	l,-3 (ix)
   7748 DD 66 FE      [19] 3383 	ld	h,-2 (ix)
   774B 7E            [ 7] 3384 	ld	a,(hl)
   774C B7            [ 4] 3385 	or	a, a
   774D 28 19         [12] 3386 	jr	Z,00115$
                           3387 ;src/main.c:588: enemy->patrolling = 0;
   774F 21 98 5F      [10] 3388 	ld	hl,#(_enemy + 0x000a)
   7752 36 00         [10] 3389 	ld	(hl),#0x00
                           3390 ;src/main.c:589: engage(actual, prota.x, prota.y);
   7754 3A 1B 63      [13] 3391 	ld	a, (#_prota + 1)
   7757 21 1A 63      [10] 3392 	ld	hl, #_prota + 0
   775A 56            [ 7] 3393 	ld	d,(hl)
   775B F5            [11] 3394 	push	af
   775C 33            [ 6] 3395 	inc	sp
   775D D5            [11] 3396 	push	de
   775E 33            [ 6] 3397 	inc	sp
   775F C5            [11] 3398 	push	bc
   7760 CD 1E 6F      [17] 3399 	call	_engage
   7763 F1            [10] 3400 	pop	af
   7764 F1            [10] 3401 	pop	af
   7765 C3 83 78      [10] 3402 	jp	00117$
   7768                    3403 00115$:
                           3404 ;src/main.c:591: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7768 C5            [11] 3405 	push	bc
   7769 C5            [11] 3406 	push	bc
   776A CD F1 6C      [17] 3407 	call	_lookFor
   776D F1            [10] 3408 	pop	af
   776E C1            [10] 3409 	pop	bc
                           3410 ;src/main.c:597: actual->patrolling = 0;
   776F 21 0A 00      [10] 3411 	ld	hl,#0x000A
   7772 09            [11] 3412 	add	hl,bc
   7773 DD 75 F6      [19] 3413 	ld	-10 (ix),l
   7776 DD 74 F7      [19] 3414 	ld	-9 (ix),h
                           3415 ;src/main.c:592: if (actual->patrolling) {
   7779 DD 6E F6      [19] 3416 	ld	l,-10 (ix)
   777C DD 66 F7      [19] 3417 	ld	h,-9 (ix)
   777F 6E            [ 7] 3418 	ld	l,(hl)
                           3419 ;src/main.c:595: if (actual->in_range) {
   7780 79            [ 4] 3420 	ld	a,c
   7781 C6 10         [ 7] 3421 	add	a, #0x10
   7783 5F            [ 4] 3422 	ld	e,a
   7784 78            [ 4] 3423 	ld	a,b
   7785 CE 00         [ 7] 3424 	adc	a, #0x00
   7787 57            [ 4] 3425 	ld	d,a
                           3426 ;src/main.c:603: actual->seek = 1;
   7788 79            [ 4] 3427 	ld	a,c
   7789 C6 13         [ 7] 3428 	add	a, #0x13
   778B DD 77 FB      [19] 3429 	ld	-5 (ix),a
   778E 78            [ 4] 3430 	ld	a,b
   778F CE 00         [ 7] 3431 	adc	a, #0x00
   7791 DD 77 FC      [19] 3432 	ld	-4 (ix),a
                           3433 ;src/main.c:592: if (actual->patrolling) {
   7794 7D            [ 4] 3434 	ld	a,l
   7795 B7            [ 4] 3435 	or	a, a
   7796 CA 4B 78      [10] 3436 	jp	Z,00112$
                           3437 ;src/main.c:594: moverEnemigoPatrol(actual);
   7799 C5            [11] 3438 	push	bc
   779A D5            [11] 3439 	push	de
   779B C5            [11] 3440 	push	bc
   779C CD A8 6A      [17] 3441 	call	_moverEnemigoPatrol
   779F F1            [10] 3442 	pop	af
   77A0 D1            [10] 3443 	pop	de
   77A1 C1            [10] 3444 	pop	bc
                           3445 ;src/main.c:595: if (actual->in_range) {
   77A2 1A            [ 7] 3446 	ld	a,(de)
   77A3 B7            [ 4] 3447 	or	a, a
   77A4 28 24         [12] 3448 	jr	Z,00104$
                           3449 ;src/main.c:596: engage(actual, prota.x, prota.y);
   77A6 3A 1B 63      [13] 3450 	ld	a, (#_prota + 1)
   77A9 21 1A 63      [10] 3451 	ld	hl, #_prota + 0
   77AC 56            [ 7] 3452 	ld	d,(hl)
   77AD F5            [11] 3453 	push	af
   77AE 33            [ 6] 3454 	inc	sp
   77AF D5            [11] 3455 	push	de
   77B0 33            [ 6] 3456 	inc	sp
   77B1 C5            [11] 3457 	push	bc
   77B2 CD 1E 6F      [17] 3458 	call	_engage
   77B5 F1            [10] 3459 	pop	af
   77B6 F1            [10] 3460 	pop	af
                           3461 ;src/main.c:597: actual->patrolling = 0;
   77B7 DD 6E F6      [19] 3462 	ld	l,-10 (ix)
   77BA DD 66 F7      [19] 3463 	ld	h,-9 (ix)
   77BD 36 00         [10] 3464 	ld	(hl),#0x00
                           3465 ;src/main.c:598: actual->engage = 1;
   77BF DD 6E FD      [19] 3466 	ld	l,-3 (ix)
   77C2 DD 66 FE      [19] 3467 	ld	h,-2 (ix)
   77C5 36 01         [10] 3468 	ld	(hl),#0x01
   77C7 C3 83 78      [10] 3469 	jp	00117$
   77CA                    3470 00104$:
                           3471 ;src/main.c:599: } else if (actual->seen) {
   77CA 21 11 00      [10] 3472 	ld	hl,#0x0011
   77CD 09            [11] 3473 	add	hl,bc
   77CE E3            [19] 3474 	ex	(sp), hl
   77CF E1            [10] 3475 	pop	hl
   77D0 E5            [11] 3476 	push	hl
   77D1 7E            [ 7] 3477 	ld	a,(hl)
   77D2 B7            [ 4] 3478 	or	a, a
   77D3 CA 83 78      [10] 3479 	jp	Z,00117$
                           3480 ;src/main.c:600: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   77D6 3A 1B 63      [13] 3481 	ld	a,(#_prota + 1)
   77D9 DD 77 FF      [19] 3482 	ld	-1 (ix),a
   77DC 21 1A 63      [10] 3483 	ld	hl, #_prota + 0
   77DF 5E            [ 7] 3484 	ld	e,(hl)
   77E0 21 01 00      [10] 3485 	ld	hl,#0x0001
   77E3 09            [11] 3486 	add	hl,bc
   77E4 DD 75 F9      [19] 3487 	ld	-7 (ix),l
   77E7 DD 74 FA      [19] 3488 	ld	-6 (ix),h
   77EA DD 6E F9      [19] 3489 	ld	l,-7 (ix)
   77ED DD 66 FA      [19] 3490 	ld	h,-6 (ix)
   77F0 56            [ 7] 3491 	ld	d,(hl)
   77F1 0A            [ 7] 3492 	ld	a,(bc)
   77F2 DD 77 F8      [19] 3493 	ld	-8 (ix),a
   77F5 C5            [11] 3494 	push	bc
   77F6 2A 31 63      [16] 3495 	ld	hl,(_mapa)
   77F9 E5            [11] 3496 	push	hl
   77FA C5            [11] 3497 	push	bc
   77FB DD 7E FF      [19] 3498 	ld	a,-1 (ix)
   77FE F5            [11] 3499 	push	af
   77FF 33            [ 6] 3500 	inc	sp
   7800 7B            [ 4] 3501 	ld	a,e
   7801 F5            [11] 3502 	push	af
   7802 33            [ 6] 3503 	inc	sp
   7803 D5            [11] 3504 	push	de
   7804 33            [ 6] 3505 	inc	sp
   7805 DD 7E F8      [19] 3506 	ld	a,-8 (ix)
   7808 F5            [11] 3507 	push	af
   7809 33            [ 6] 3508 	inc	sp
   780A CD 72 49      [17] 3509 	call	_pathFinding
   780D 21 08 00      [10] 3510 	ld	hl,#8
   7810 39            [11] 3511 	add	hl,sp
   7811 F9            [ 6] 3512 	ld	sp,hl
   7812 C1            [10] 3513 	pop	bc
                           3514 ;src/main.c:601: actual->p_seek_x = actual->x;
   7813 21 17 00      [10] 3515 	ld	hl,#0x0017
   7816 09            [11] 3516 	add	hl,bc
   7817 EB            [ 4] 3517 	ex	de,hl
   7818 0A            [ 7] 3518 	ld	a,(bc)
   7819 12            [ 7] 3519 	ld	(de),a
                           3520 ;src/main.c:602: actual->p_seek_y = actual->y;
   781A 21 18 00      [10] 3521 	ld	hl,#0x0018
   781D 09            [11] 3522 	add	hl,bc
   781E EB            [ 4] 3523 	ex	de,hl
   781F DD 6E F9      [19] 3524 	ld	l,-7 (ix)
   7822 DD 66 FA      [19] 3525 	ld	h,-6 (ix)
   7825 7E            [ 7] 3526 	ld	a,(hl)
   7826 12            [ 7] 3527 	ld	(de),a
                           3528 ;src/main.c:603: actual->seek = 1;
   7827 DD 6E FB      [19] 3529 	ld	l,-5 (ix)
   782A DD 66 FC      [19] 3530 	ld	h,-4 (ix)
   782D 36 01         [10] 3531 	ld	(hl),#0x01
                           3532 ;src/main.c:604: actual->iter=0;
   782F 21 0D 00      [10] 3533 	ld	hl,#0x000D
   7832 09            [11] 3534 	add	hl,bc
   7833 AF            [ 4] 3535 	xor	a, a
   7834 77            [ 7] 3536 	ld	(hl), a
   7835 23            [ 6] 3537 	inc	hl
   7836 77            [ 7] 3538 	ld	(hl), a
                           3539 ;src/main.c:605: actual->reversePatrol = NO;
   7837 21 0B 00      [10] 3540 	ld	hl,#0x000B
   783A 09            [11] 3541 	add	hl,bc
   783B 36 00         [10] 3542 	ld	(hl),#0x00
                           3543 ;src/main.c:606: actual->patrolling = 0;
   783D DD 6E F6      [19] 3544 	ld	l,-10 (ix)
   7840 DD 66 F7      [19] 3545 	ld	h,-9 (ix)
   7843 36 00         [10] 3546 	ld	(hl),#0x00
                           3547 ;src/main.c:607: actual->seen = 0;
   7845 E1            [10] 3548 	pop	hl
   7846 E5            [11] 3549 	push	hl
   7847 36 00         [10] 3550 	ld	(hl),#0x00
   7849 18 38         [12] 3551 	jr	00117$
   784B                    3552 00112$:
                           3553 ;src/main.c:609: } else if (actual->seek) {
   784B DD 6E FB      [19] 3554 	ld	l,-5 (ix)
   784E DD 66 FC      [19] 3555 	ld	h,-4 (ix)
   7851 7E            [ 7] 3556 	ld	a,(hl)
   7852 B7            [ 4] 3557 	or	a, a
   7853 28 2E         [12] 3558 	jr	Z,00117$
                           3559 ;src/main.c:610: moverEnemigoSeek(actual);
   7855 C5            [11] 3560 	push	bc
   7856 D5            [11] 3561 	push	de
   7857 C5            [11] 3562 	push	bc
   7858 CD F7 6D      [17] 3563 	call	_moverEnemigoSeek
   785B F1            [10] 3564 	pop	af
   785C D1            [10] 3565 	pop	de
   785D C1            [10] 3566 	pop	bc
                           3567 ;src/main.c:611: if (actual->in_range) {
   785E 1A            [ 7] 3568 	ld	a,(de)
   785F B7            [ 4] 3569 	or	a, a
   7860 28 21         [12] 3570 	jr	Z,00117$
                           3571 ;src/main.c:612: engage(actual, prota.x, prota.y);
   7862 3A 1B 63      [13] 3572 	ld	a, (#_prota + 1)
   7865 21 1A 63      [10] 3573 	ld	hl, #_prota + 0
   7868 56            [ 7] 3574 	ld	d,(hl)
   7869 F5            [11] 3575 	push	af
   786A 33            [ 6] 3576 	inc	sp
   786B D5            [11] 3577 	push	de
   786C 33            [ 6] 3578 	inc	sp
   786D C5            [11] 3579 	push	bc
   786E CD 1E 6F      [17] 3580 	call	_engage
   7871 F1            [10] 3581 	pop	af
   7872 F1            [10] 3582 	pop	af
                           3583 ;src/main.c:613: actual->seek = 0;
   7873 DD 6E FB      [19] 3584 	ld	l,-5 (ix)
   7876 DD 66 FC      [19] 3585 	ld	h,-4 (ix)
   7879 36 00         [10] 3586 	ld	(hl),#0x00
                           3587 ;src/main.c:614: actual->engage = 1;
   787B DD 6E FD      [19] 3588 	ld	l,-3 (ix)
   787E DD 66 FE      [19] 3589 	ld	h,-2 (ix)
   7881 36 01         [10] 3590 	ld	(hl),#0x01
                           3591 ;src/main.c:615: } else if (actual->seen) {
   7883                    3592 00117$:
   7883 DD F9         [10] 3593 	ld	sp, ix
   7885 DD E1         [14] 3594 	pop	ix
   7887 C9            [10] 3595 	ret
                           3596 ;src/main.c:622: void inicializarEnemy() {
                           3597 ;	---------------------------------
                           3598 ; Function inicializarEnemy
                           3599 ; ---------------------------------
   7888                    3600 _inicializarEnemy::
   7888 DD E5         [15] 3601 	push	ix
   788A DD 21 00 00   [14] 3602 	ld	ix,#0
   788E DD 39         [15] 3603 	add	ix,sp
   7890 21 F9 FF      [10] 3604 	ld	hl,#-7
   7893 39            [11] 3605 	add	hl,sp
   7894 F9            [ 6] 3606 	ld	sp,hl
                           3607 ;src/main.c:623: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7895 3A 33 63      [13] 3608 	ld	a,(#_num_mapa + 0)
   7898 C6 02         [ 7] 3609 	add	a, #0x02
   789A DD 77 FF      [19] 3610 	ld	-1 (ix),a
                           3611 ;src/main.c:633: actual = enemy;
   789D 11 8E 5F      [10] 3612 	ld	de,#_enemy+0
                           3613 ;src/main.c:634: while(i){
   78A0                    3614 00101$:
   78A0 DD 7E FF      [19] 3615 	ld	a,-1 (ix)
   78A3 B7            [ 4] 3616 	or	a, a
   78A4 CA A8 79      [10] 3617 	jp	Z,00104$
                           3618 ;src/main.c:635: --i;
   78A7 DD 35 FF      [23] 3619 	dec	-1 (ix)
                           3620 ;src/main.c:636: actual->x = actual->px = spawnX[i];
   78AA 4B            [ 4] 3621 	ld	c, e
   78AB 42            [ 4] 3622 	ld	b, d
   78AC 03            [ 6] 3623 	inc	bc
   78AD 03            [ 6] 3624 	inc	bc
   78AE 3E 1D         [ 7] 3625 	ld	a,#<(_spawnX)
   78B0 DD 86 FF      [19] 3626 	add	a, -1 (ix)
   78B3 DD 77 FC      [19] 3627 	ld	-4 (ix),a
   78B6 3E 64         [ 7] 3628 	ld	a,#>(_spawnX)
   78B8 CE 00         [ 7] 3629 	adc	a, #0x00
   78BA DD 77 FD      [19] 3630 	ld	-3 (ix),a
   78BD DD 6E FC      [19] 3631 	ld	l,-4 (ix)
   78C0 DD 66 FD      [19] 3632 	ld	h,-3 (ix)
   78C3 7E            [ 7] 3633 	ld	a,(hl)
   78C4 02            [ 7] 3634 	ld	(bc),a
   78C5 12            [ 7] 3635 	ld	(de),a
                           3636 ;src/main.c:637: actual->y = actual->py = spawnY[i];
   78C6 D5            [11] 3637 	push	de
   78C7 FD E1         [14] 3638 	pop	iy
   78C9 FD 23         [10] 3639 	inc	iy
   78CB 4B            [ 4] 3640 	ld	c, e
   78CC 42            [ 4] 3641 	ld	b, d
   78CD 03            [ 6] 3642 	inc	bc
   78CE 03            [ 6] 3643 	inc	bc
   78CF 03            [ 6] 3644 	inc	bc
   78D0 3E 21         [ 7] 3645 	ld	a,#<(_spawnY)
   78D2 DD 86 FF      [19] 3646 	add	a, -1 (ix)
   78D5 DD 77 FA      [19] 3647 	ld	-6 (ix),a
   78D8 3E 64         [ 7] 3648 	ld	a,#>(_spawnY)
   78DA CE 00         [ 7] 3649 	adc	a, #0x00
   78DC DD 77 FB      [19] 3650 	ld	-5 (ix),a
   78DF DD 6E FA      [19] 3651 	ld	l,-6 (ix)
   78E2 DD 66 FB      [19] 3652 	ld	h,-5 (ix)
   78E5 7E            [ 7] 3653 	ld	a,(hl)
   78E6 02            [ 7] 3654 	ld	(bc),a
   78E7 FD 77 00      [19] 3655 	ld	0 (iy), a
                           3656 ;src/main.c:638: actual->mover  = NO;
   78EA 21 06 00      [10] 3657 	ld	hl,#0x0006
   78ED 19            [11] 3658 	add	hl,de
   78EE 36 00         [10] 3659 	ld	(hl),#0x00
                           3660 ;src/main.c:639: actual->mira   = M_abajo;
   78F0 21 07 00      [10] 3661 	ld	hl,#0x0007
   78F3 19            [11] 3662 	add	hl,de
   78F4 36 03         [10] 3663 	ld	(hl),#0x03
                           3664 ;src/main.c:640: actual->sprite = g_enemy;
   78F6 21 04 00      [10] 3665 	ld	hl,#0x0004
   78F9 19            [11] 3666 	add	hl,de
   78FA 36 3A         [10] 3667 	ld	(hl),#<(_g_enemy)
   78FC 23            [ 6] 3668 	inc	hl
   78FD 36 3C         [10] 3669 	ld	(hl),#>(_g_enemy)
                           3670 ;src/main.c:641: actual->muerto = NO;
   78FF 21 08 00      [10] 3671 	ld	hl,#0x0008
   7902 19            [11] 3672 	add	hl,de
   7903 36 00         [10] 3673 	ld	(hl),#0x00
                           3674 ;src/main.c:642: actual->muertes = 0;
   7905 21 09 00      [10] 3675 	ld	hl,#0x0009
   7908 19            [11] 3676 	add	hl,de
   7909 36 00         [10] 3677 	ld	(hl),#0x00
                           3678 ;src/main.c:643: actual->patrolling = SI;
   790B 21 0A 00      [10] 3679 	ld	hl,#0x000A
   790E 19            [11] 3680 	add	hl,de
   790F 36 01         [10] 3681 	ld	(hl),#0x01
                           3682 ;src/main.c:644: actual->reversePatrol = NO;
   7911 21 0B 00      [10] 3683 	ld	hl,#0x000B
   7914 19            [11] 3684 	add	hl,de
   7915 36 00         [10] 3685 	ld	(hl),#0x00
                           3686 ;src/main.c:645: actual->didDamage = 0;
   7917 21 16 00      [10] 3687 	ld	hl,#0x0016
   791A 19            [11] 3688 	add	hl,de
   791B 36 00         [10] 3689 	ld	(hl),#0x00
                           3690 ;src/main.c:646: actual->iter = 0;
   791D 21 0D 00      [10] 3691 	ld	hl,#0x000D
   7920 19            [11] 3692 	add	hl,de
   7921 AF            [ 4] 3693 	xor	a, a
   7922 77            [ 7] 3694 	ld	(hl), a
   7923 23            [ 6] 3695 	inc	hl
   7924 77            [ 7] 3696 	ld	(hl), a
                           3697 ;src/main.c:647: actual->lastIter = 0;
   7925 21 0F 00      [10] 3698 	ld	hl,#0x000F
   7928 19            [11] 3699 	add	hl,de
   7929 36 00         [10] 3700 	ld	(hl),#0x00
                           3701 ;src/main.c:648: actual->seen = 0;
   792B 21 11 00      [10] 3702 	ld	hl,#0x0011
   792E 19            [11] 3703 	add	hl,de
   792F 36 00         [10] 3704 	ld	(hl),#0x00
                           3705 ;src/main.c:649: actual->found = 0;
   7931 21 12 00      [10] 3706 	ld	hl,#0x0012
   7934 19            [11] 3707 	add	hl,de
   7935 36 00         [10] 3708 	ld	(hl),#0x00
                           3709 ;src/main.c:650: actual->engage = 0;
   7937 21 15 00      [10] 3710 	ld	hl,#0x0015
   793A 19            [11] 3711 	add	hl,de
   793B 36 00         [10] 3712 	ld	(hl),#0x00
                           3713 ;src/main.c:651: actual->xplot = NO;
   793D 21 19 00      [10] 3714 	ld	hl,#0x0019
   7940 19            [11] 3715 	add	hl,de
   7941 36 00         [10] 3716 	ld	(hl),#0x00
                           3717 ;src/main.c:652: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7943 21 33 63      [10] 3718 	ld	hl,#_num_mapa + 0
   7946 4E            [ 7] 3719 	ld	c, (hl)
   7947 0C            [ 4] 3720 	inc	c
   7948 06 00         [ 7] 3721 	ld	b,#0x00
   794A 69            [ 4] 3722 	ld	l, c
   794B 60            [ 4] 3723 	ld	h, b
   794C 29            [11] 3724 	add	hl, hl
   794D 29            [11] 3725 	add	hl, hl
   794E 09            [11] 3726 	add	hl, bc
   794F 4D            [ 4] 3727 	ld	c,l
   7950 44            [ 4] 3728 	ld	b,h
   7951 21 39 64      [10] 3729 	ld	hl,#_patrolY
   7954 09            [11] 3730 	add	hl,bc
   7955 7D            [ 4] 3731 	ld	a,l
   7956 DD 86 FF      [19] 3732 	add	a, -1 (ix)
   7959 6F            [ 4] 3733 	ld	l,a
   795A 7C            [ 4] 3734 	ld	a,h
   795B CE 00         [ 7] 3735 	adc	a, #0x00
   795D 67            [ 4] 3736 	ld	h,a
   795E 7E            [ 7] 3737 	ld	a,(hl)
   795F DD 77 F9      [19] 3738 	ld	-7 (ix),a
   7962 21 25 64      [10] 3739 	ld	hl,#_patrolX
   7965 09            [11] 3740 	add	hl,bc
   7966 DD 4E FF      [19] 3741 	ld	c,-1 (ix)
   7969 06 00         [ 7] 3742 	ld	b,#0x00
   796B 09            [11] 3743 	add	hl,bc
   796C 7E            [ 7] 3744 	ld	a,(hl)
   796D DD 77 FE      [19] 3745 	ld	-2 (ix),a
   7970 DD 6E FA      [19] 3746 	ld	l,-6 (ix)
   7973 DD 66 FB      [19] 3747 	ld	h,-5 (ix)
   7976 4E            [ 7] 3748 	ld	c,(hl)
   7977 DD 6E FC      [19] 3749 	ld	l,-4 (ix)
   797A DD 66 FD      [19] 3750 	ld	h,-3 (ix)
   797D 46            [ 7] 3751 	ld	b,(hl)
   797E D5            [11] 3752 	push	de
   797F 2A 31 63      [16] 3753 	ld	hl,(_mapa)
   7982 E5            [11] 3754 	push	hl
   7983 D5            [11] 3755 	push	de
   7984 DD 66 F9      [19] 3756 	ld	h,-7 (ix)
   7987 DD 6E FE      [19] 3757 	ld	l,-2 (ix)
   798A E5            [11] 3758 	push	hl
   798B 79            [ 4] 3759 	ld	a,c
   798C F5            [11] 3760 	push	af
   798D 33            [ 6] 3761 	inc	sp
   798E C5            [11] 3762 	push	bc
   798F 33            [ 6] 3763 	inc	sp
   7990 CD 72 49      [17] 3764 	call	_pathFinding
   7993 21 08 00      [10] 3765 	ld	hl,#8
   7996 39            [11] 3766 	add	hl,sp
   7997 F9            [ 6] 3767 	ld	sp,hl
   7998 D1            [10] 3768 	pop	de
                           3769 ;src/main.c:653: dibujarEnemigo(actual);
   7999 D5            [11] 3770 	push	de
   799A D5            [11] 3771 	push	de
   799B CD D3 66      [17] 3772 	call	_dibujarEnemigo
   799E F1            [10] 3773 	pop	af
   799F D1            [10] 3774 	pop	de
                           3775 ;src/main.c:654: ++actual;
   79A0 21 E3 00      [10] 3776 	ld	hl,#0x00E3
   79A3 19            [11] 3777 	add	hl,de
   79A4 EB            [ 4] 3778 	ex	de,hl
   79A5 C3 A0 78      [10] 3779 	jp	00101$
   79A8                    3780 00104$:
   79A8 DD F9         [10] 3781 	ld	sp, ix
   79AA DD E1         [14] 3782 	pop	ix
   79AC C9            [10] 3783 	ret
                           3784 ;src/main.c:658: void moverIzquierda() {
                           3785 ;	---------------------------------
                           3786 ; Function moverIzquierda
                           3787 ; ---------------------------------
   79AD                    3788 _moverIzquierda::
                           3789 ;src/main.c:659: prota.mira = M_izquierda;
   79AD 01 1A 63      [10] 3790 	ld	bc,#_prota+0
   79B0 21 21 63      [10] 3791 	ld	hl,#(_prota + 0x0007)
   79B3 36 01         [10] 3792 	ld	(hl),#0x01
                           3793 ;src/main.c:660: if (!checkCollision(M_izquierda)) {
   79B5 C5            [11] 3794 	push	bc
   79B6 3E 01         [ 7] 3795 	ld	a,#0x01
   79B8 F5            [11] 3796 	push	af
   79B9 33            [ 6] 3797 	inc	sp
   79BA CD 62 65      [17] 3798 	call	_checkCollision
   79BD 33            [ 6] 3799 	inc	sp
   79BE C1            [10] 3800 	pop	bc
   79BF 7D            [ 4] 3801 	ld	a,l
   79C0 B7            [ 4] 3802 	or	a, a
   79C1 C0            [11] 3803 	ret	NZ
                           3804 ;src/main.c:661: prota.x--;
   79C2 0A            [ 7] 3805 	ld	a,(bc)
   79C3 C6 FF         [ 7] 3806 	add	a,#0xFF
   79C5 02            [ 7] 3807 	ld	(bc),a
                           3808 ;src/main.c:662: prota.mover = SI;
   79C6 21 20 63      [10] 3809 	ld	hl,#(_prota + 0x0006)
   79C9 36 01         [10] 3810 	ld	(hl),#0x01
                           3811 ;src/main.c:663: prota.sprite = g_hero_left;
   79CB 21 C6 3D      [10] 3812 	ld	hl,#_g_hero_left
   79CE 22 1E 63      [16] 3813 	ld	((_prota + 0x0004)), hl
   79D1 C9            [10] 3814 	ret
                           3815 ;src/main.c:667: void moverDerecha() {
                           3816 ;	---------------------------------
                           3817 ; Function moverDerecha
                           3818 ; ---------------------------------
   79D2                    3819 _moverDerecha::
                           3820 ;src/main.c:668: prota.mira = M_derecha;
   79D2 21 21 63      [10] 3821 	ld	hl,#(_prota + 0x0007)
   79D5 36 00         [10] 3822 	ld	(hl),#0x00
                           3823 ;src/main.c:669: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   79D7 AF            [ 4] 3824 	xor	a, a
   79D8 F5            [11] 3825 	push	af
   79D9 33            [ 6] 3826 	inc	sp
   79DA CD 62 65      [17] 3827 	call	_checkCollision
   79DD 33            [ 6] 3828 	inc	sp
   79DE 45            [ 4] 3829 	ld	b,l
   79DF 21 1A 63      [10] 3830 	ld	hl, #_prota + 0
   79E2 4E            [ 7] 3831 	ld	c,(hl)
   79E3 59            [ 4] 3832 	ld	e,c
   79E4 16 00         [ 7] 3833 	ld	d,#0x00
   79E6 21 07 00      [10] 3834 	ld	hl,#0x0007
   79E9 19            [11] 3835 	add	hl,de
   79EA 11 50 80      [10] 3836 	ld	de, #0x8050
   79ED 29            [11] 3837 	add	hl, hl
   79EE 3F            [ 4] 3838 	ccf
   79EF CB 1C         [ 8] 3839 	rr	h
   79F1 CB 1D         [ 8] 3840 	rr	l
   79F3 ED 52         [15] 3841 	sbc	hl, de
   79F5 3E 00         [ 7] 3842 	ld	a,#0x00
   79F7 17            [ 4] 3843 	rla
   79F8 5F            [ 4] 3844 	ld	e,a
   79F9 78            [ 4] 3845 	ld	a,b
   79FA B7            [ 4] 3846 	or	a,a
   79FB 20 14         [12] 3847 	jr	NZ,00104$
   79FD B3            [ 4] 3848 	or	a,e
   79FE 28 11         [12] 3849 	jr	Z,00104$
                           3850 ;src/main.c:670: prota.x++;
   7A00 0C            [ 4] 3851 	inc	c
   7A01 21 1A 63      [10] 3852 	ld	hl,#_prota
   7A04 71            [ 7] 3853 	ld	(hl),c
                           3854 ;src/main.c:671: prota.mover = SI;
   7A05 21 20 63      [10] 3855 	ld	hl,#(_prota + 0x0006)
   7A08 36 01         [10] 3856 	ld	(hl),#0x01
                           3857 ;src/main.c:672: prota.sprite = g_hero;
   7A0A 21 70 3E      [10] 3858 	ld	hl,#_g_hero
   7A0D 22 1E 63      [16] 3859 	ld	((_prota + 0x0004)), hl
   7A10 C9            [10] 3860 	ret
   7A11                    3861 00104$:
                           3862 ;src/main.c:673: }else if( prota.x + G_HERO_W >= 80){
   7A11 7B            [ 4] 3863 	ld	a,e
   7A12 B7            [ 4] 3864 	or	a, a
   7A13 C0            [11] 3865 	ret	NZ
                           3866 ;src/main.c:674: avanzarMapa();
   7A14 C3 FB 7C      [10] 3867 	jp  _avanzarMapa
                           3868 ;src/main.c:678: void moverArriba() {
                           3869 ;	---------------------------------
                           3870 ; Function moverArriba
                           3871 ; ---------------------------------
   7A17                    3872 _moverArriba::
                           3873 ;src/main.c:679: prota.mira = M_arriba;
   7A17 21 21 63      [10] 3874 	ld	hl,#(_prota + 0x0007)
   7A1A 36 02         [10] 3875 	ld	(hl),#0x02
                           3876 ;src/main.c:680: if (!checkCollision(M_arriba)) {
   7A1C 3E 02         [ 7] 3877 	ld	a,#0x02
   7A1E F5            [11] 3878 	push	af
   7A1F 33            [ 6] 3879 	inc	sp
   7A20 CD 62 65      [17] 3880 	call	_checkCollision
   7A23 33            [ 6] 3881 	inc	sp
   7A24 7D            [ 4] 3882 	ld	a,l
   7A25 B7            [ 4] 3883 	or	a, a
   7A26 C0            [11] 3884 	ret	NZ
                           3885 ;src/main.c:681: prota.y--;
   7A27 21 1B 63      [10] 3886 	ld	hl,#_prota + 1
   7A2A 4E            [ 7] 3887 	ld	c,(hl)
   7A2B 0D            [ 4] 3888 	dec	c
   7A2C 71            [ 7] 3889 	ld	(hl),c
                           3890 ;src/main.c:682: prota.y--;
   7A2D 0D            [ 4] 3891 	dec	c
   7A2E 71            [ 7] 3892 	ld	(hl),c
                           3893 ;src/main.c:683: prota.mover  = SI;
   7A2F 21 20 63      [10] 3894 	ld	hl,#(_prota + 0x0006)
   7A32 36 01         [10] 3895 	ld	(hl),#0x01
                           3896 ;src/main.c:684: prota.sprite = g_hero_up;
   7A34 21 2C 3D      [10] 3897 	ld	hl,#_g_hero_up
   7A37 22 1E 63      [16] 3898 	ld	((_prota + 0x0004)), hl
   7A3A C9            [10] 3899 	ret
                           3900 ;src/main.c:688: void moverAbajo() {
                           3901 ;	---------------------------------
                           3902 ; Function moverAbajo
                           3903 ; ---------------------------------
   7A3B                    3904 _moverAbajo::
                           3905 ;src/main.c:689: prota.mira = M_abajo;
   7A3B 21 21 63      [10] 3906 	ld	hl,#(_prota + 0x0007)
   7A3E 36 03         [10] 3907 	ld	(hl),#0x03
                           3908 ;src/main.c:690: if (!checkCollision(M_abajo) ) {
   7A40 3E 03         [ 7] 3909 	ld	a,#0x03
   7A42 F5            [11] 3910 	push	af
   7A43 33            [ 6] 3911 	inc	sp
   7A44 CD 62 65      [17] 3912 	call	_checkCollision
   7A47 33            [ 6] 3913 	inc	sp
   7A48 7D            [ 4] 3914 	ld	a,l
   7A49 B7            [ 4] 3915 	or	a, a
   7A4A C0            [11] 3916 	ret	NZ
                           3917 ;src/main.c:691: prota.y++;
   7A4B 01 1B 63      [10] 3918 	ld	bc,#_prota + 1
   7A4E 0A            [ 7] 3919 	ld	a,(bc)
   7A4F 3C            [ 4] 3920 	inc	a
   7A50 02            [ 7] 3921 	ld	(bc),a
                           3922 ;src/main.c:692: prota.y++;
   7A51 3C            [ 4] 3923 	inc	a
   7A52 02            [ 7] 3924 	ld	(bc),a
                           3925 ;src/main.c:693: prota.mover  = SI;
   7A53 21 20 63      [10] 3926 	ld	hl,#(_prota + 0x0006)
   7A56 36 01         [10] 3927 	ld	(hl),#0x01
                           3928 ;src/main.c:694: prota.sprite = g_hero_down;
   7A58 21 92 3C      [10] 3929 	ld	hl,#_g_hero_down
   7A5B 22 1E 63      [16] 3930 	ld	((_prota + 0x0004)), hl
   7A5E C9            [10] 3931 	ret
                           3932 ;src/main.c:701: void intHandler() {
                           3933 ;	---------------------------------
                           3934 ; Function intHandler
                           3935 ; ---------------------------------
   7A5F                    3936 _intHandler::
                           3937 ;src/main.c:702: if (++i == 6) {
   7A5F 21 37 63      [10] 3938 	ld	hl, #_i+0
   7A62 34            [11] 3939 	inc	(hl)
   7A63 3A 37 63      [13] 3940 	ld	a,(#_i + 0)
   7A66 D6 06         [ 7] 3941 	sub	a, #0x06
   7A68 C0            [11] 3942 	ret	NZ
                           3943 ;src/main.c:703: play();
   7A69 CD 3A 52      [17] 3944 	call	_play
                           3945 ;src/main.c:704: i=0;
   7A6C 21 37 63      [10] 3946 	ld	hl,#_i + 0
   7A6F 36 00         [10] 3947 	ld	(hl), #0x00
   7A71 C9            [10] 3948 	ret
                           3949 ;src/main.c:708: void inicializarCPC() {
                           3950 ;	---------------------------------
                           3951 ; Function inicializarCPC
                           3952 ; ---------------------------------
   7A72                    3953 _inicializarCPC::
                           3954 ;src/main.c:709: cpct_disableFirmware();
   7A72 CD 21 5E      [17] 3955 	call	_cpct_disableFirmware
                           3956 ;src/main.c:710: cpct_setVideoMode(0);
   7A75 2E 00         [ 7] 3957 	ld	l,#0x00
   7A77 CD CC 55      [17] 3958 	call	_cpct_setVideoMode
                           3959 ;src/main.c:711: cpct_setBorder(HW_BLACK);
   7A7A 21 10 14      [10] 3960 	ld	hl,#0x1410
   7A7D E5            [11] 3961 	push	hl
   7A7E CD 18 53      [17] 3962 	call	_cpct_setPALColour
                           3963 ;src/main.c:712: cpct_setPalette(g_palette, 16);
   7A81 21 10 00      [10] 3964 	ld	hl,#0x0010
   7A84 E5            [11] 3965 	push	hl
   7A85 21 60 3E      [10] 3966 	ld	hl,#_g_palette
   7A88 E5            [11] 3967 	push	hl
   7A89 CD 8B 52      [17] 3968 	call	_cpct_setPalette
                           3969 ;src/main.c:713: cpct_akp_musicInit(g_song);
   7A8C 21 00 02      [10] 3970 	ld	hl,#_g_song
   7A8F E5            [11] 3971 	push	hl
   7A90 CD FD 5C      [17] 3972 	call	_cpct_akp_musicInit
   7A93 F1            [10] 3973 	pop	af
                           3974 ;src/main.c:714: cpct_setInterruptHandler(intHandler);
   7A94 21 5F 7A      [10] 3975 	ld	hl,#_intHandler
   7A97 CD 66 5F      [17] 3976 	call	_cpct_setInterruptHandler
   7A9A C9            [10] 3977 	ret
                           3978 ;src/main.c:717: void inicializarJuego() {
                           3979 ;	---------------------------------
                           3980 ; Function inicializarJuego
                           3981 ; ---------------------------------
   7A9B                    3982 _inicializarJuego::
                           3983 ;src/main.c:719: endGame = 0;
   7A9B 21 34 63      [10] 3984 	ld	hl,#_endGame + 0
   7A9E 36 00         [10] 3985 	ld	(hl), #0x00
                           3986 ;src/main.c:720: puntuacion = 0;
   7AA0 21 35 63      [10] 3987 	ld	hl,#_puntuacion + 0
   7AA3 36 00         [10] 3988 	ld	(hl), #0x00
                           3989 ;src/main.c:722: cambio = 0;
   7AA5 21 2E 63      [10] 3990 	ld	hl,#_cambio + 0
   7AA8 36 00         [10] 3991 	ld	(hl), #0x00
                           3992 ;src/main.c:723: timer = 0;
   7AAA 21 00 00      [10] 3993 	ld	hl,#0x0000
   7AAD 22 2F 63      [16] 3994 	ld	(_timer),hl
                           3995 ;src/main.c:724: parpadeo = 0;
   7AB0 21 2D 63      [10] 3996 	ld	hl,#_parpadeo + 0
   7AB3 36 00         [10] 3997 	ld	(hl), #0x00
                           3998 ;src/main.c:725: vidas = 100;
   7AB5 21 36 63      [10] 3999 	ld	hl,#_vidas + 0
   7AB8 36 64         [10] 4000 	ld	(hl), #0x64
                           4001 ;src/main.c:727: num_mapa = 0;
   7ABA 21 33 63      [10] 4002 	ld	hl,#_num_mapa + 0
   7ABD 36 00         [10] 4003 	ld	(hl), #0x00
                           4004 ;src/main.c:728: mapa = mapas[num_mapa];
   7ABF 21 17 64      [10] 4005 	ld	hl, #_mapas + 0
   7AC2 7E            [ 7] 4006 	ld	a,(hl)
   7AC3 FD 21 31 63   [14] 4007 	ld	iy,#_mapa
   7AC7 FD 77 00      [19] 4008 	ld	0 (iy),a
   7ACA 23            [ 6] 4009 	inc	hl
   7ACB 7E            [ 7] 4010 	ld	a,(hl)
   7ACC 32 32 63      [13] 4011 	ld	(#_mapa + 1),a
                           4012 ;src/main.c:729: cpct_etm_setTileset2x4(g_tileset);
   7ACF 21 E0 17      [10] 4013 	ld	hl,#_g_tileset
   7AD2 CD 7C 54      [17] 4014 	call	_cpct_etm_setTileset2x4
                           4015 ;src/main.c:731: dibujarMapa();
   7AD5 CD 01 64      [17] 4016 	call	_dibujarMapa
                           4017 ;src/main.c:734: barraPuntuacionInicial();
   7AD8 CD 21 50      [17] 4018 	call	_barraPuntuacionInicial
                           4019 ;src/main.c:737: prota.x = prota.px = 4;
   7ADB 21 1C 63      [10] 4020 	ld	hl,#(_prota + 0x0002)
   7ADE 36 04         [10] 4021 	ld	(hl),#0x04
   7AE0 21 1A 63      [10] 4022 	ld	hl,#_prota
   7AE3 36 04         [10] 4023 	ld	(hl),#0x04
                           4024 ;src/main.c:738: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7AE5 21 1D 63      [10] 4025 	ld	hl,#(_prota + 0x0003)
   7AE8 36 68         [10] 4026 	ld	(hl),#0x68
   7AEA 21 1B 63      [10] 4027 	ld	hl,#(_prota + 0x0001)
   7AED 36 68         [10] 4028 	ld	(hl),#0x68
                           4029 ;src/main.c:739: prota.mover  = NO;
   7AEF 21 20 63      [10] 4030 	ld	hl,#(_prota + 0x0006)
   7AF2 36 00         [10] 4031 	ld	(hl),#0x00
                           4032 ;src/main.c:740: prota.mira=M_derecha;
   7AF4 21 21 63      [10] 4033 	ld	hl,#(_prota + 0x0007)
   7AF7 36 00         [10] 4034 	ld	(hl),#0x00
                           4035 ;src/main.c:741: prota.sprite = g_hero;
   7AF9 21 70 3E      [10] 4036 	ld	hl,#_g_hero
   7AFC 22 1E 63      [16] 4037 	ld	((_prota + 0x0004)), hl
                           4038 ;src/main.c:745: cu.x = cu.px = 0;
   7AFF 21 24 63      [10] 4039 	ld	hl,#(_cu + 0x0002)
   7B02 36 00         [10] 4040 	ld	(hl),#0x00
   7B04 21 22 63      [10] 4041 	ld	hl,#_cu
   7B07 36 00         [10] 4042 	ld	(hl),#0x00
                           4043 ;src/main.c:746: cu.y = cu.py = 0;
   7B09 21 25 63      [10] 4044 	ld	hl,#(_cu + 0x0003)
   7B0C 36 00         [10] 4045 	ld	(hl),#0x00
   7B0E 21 23 63      [10] 4046 	ld	hl,#(_cu + 0x0001)
   7B11 36 00         [10] 4047 	ld	(hl),#0x00
                           4048 ;src/main.c:747: cu.lanzado = NO;
   7B13 21 28 63      [10] 4049 	ld	hl,#(_cu + 0x0006)
   7B16 36 00         [10] 4050 	ld	(hl),#0x00
                           4051 ;src/main.c:748: cu.mover = NO;
   7B18 21 2B 63      [10] 4052 	ld	hl,#(_cu + 0x0009)
   7B1B 36 00         [10] 4053 	ld	(hl),#0x00
                           4054 ;src/main.c:749: cu.off_bound = NO;
   7B1D 21 2C 63      [10] 4055 	ld	hl,#(_cu + 0x000a)
   7B20 36 00         [10] 4056 	ld	(hl),#0x00
                           4057 ;src/main.c:751: inicializarEnemy();
   7B22 CD 88 78      [17] 4058 	call	_inicializarEnemy
                           4059 ;src/main.c:753: dibujarProta();
   7B25 C3 4D 64      [10] 4060 	jp  _dibujarProta
                           4061 ;src/main.c:756: void menuFin(u16 puntuacion) __z88dk_fastcall {
                           4062 ;	---------------------------------
                           4063 ; Function menuFin
                           4064 ; ---------------------------------
   7B28                    4065 _menuFin::
   7B28 DD E5         [15] 4066 	push	ix
   7B2A DD 21 00 00   [14] 4067 	ld	ix,#0
   7B2E DD 39         [15] 4068 	add	ix,sp
   7B30 F5            [11] 4069 	push	af
   7B31 F5            [11] 4070 	push	af
   7B32 DD 75 FE      [19] 4071 	ld	-2 (ix),l
   7B35 DD 74 FF      [19] 4072 	ld	-1 (ix),h
                           4073 ;src/main.c:760: puntuacion_aux = puntuacion/10000;
   7B38 21 10 27      [10] 4074 	ld	hl,#0x2710
   7B3B E5            [11] 4075 	push	hl
   7B3C DD 6E FE      [19] 4076 	ld	l,-2 (ix)
   7B3F DD 66 FF      [19] 4077 	ld	h,-1 (ix)
   7B42 E5            [11] 4078 	push	hl
   7B43 CD 4A 52      [17] 4079 	call	__divuint
   7B46 F1            [10] 4080 	pop	af
   7B47 F1            [10] 4081 	pop	af
   7B48 33            [ 6] 4082 	inc	sp
   7B49 33            [ 6] 4083 	inc	sp
   7B4A E5            [11] 4084 	push	hl
                           4085 ;src/main.c:763: cpct_clearScreen(0);
   7B4B 21 00 40      [10] 4086 	ld	hl,#0x4000
   7B4E E5            [11] 4087 	push	hl
   7B4F AF            [ 4] 4088 	xor	a, a
   7B50 F5            [11] 4089 	push	af
   7B51 33            [ 6] 4090 	inc	sp
   7B52 26 C0         [ 7] 4091 	ld	h, #0xC0
   7B54 E5            [11] 4092 	push	hl
   7B55 CD EA 55      [17] 4093 	call	_cpct_memset
                           4094 ;src/main.c:765: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7B58 21 18 5A      [10] 4095 	ld	hl,#0x5A18
   7B5B E5            [11] 4096 	push	hl
   7B5C 21 00 C0      [10] 4097 	ld	hl,#0xC000
   7B5F E5            [11] 4098 	push	hl
   7B60 CD 0B 5F      [17] 4099 	call	_cpct_getScreenPtr
   7B63 4D            [ 4] 4100 	ld	c,l
   7B64 44            [ 4] 4101 	ld	b,h
                           4102 ;src/main.c:766: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7B65 21 02 00      [10] 4103 	ld	hl,#0x0002
   7B68 E5            [11] 4104 	push	hl
   7B69 C5            [11] 4105 	push	bc
   7B6A 21 D3 7C      [10] 4106 	ld	hl,#___str_0
   7B6D E5            [11] 4107 	push	hl
   7B6E CD 24 53      [17] 4108 	call	_cpct_drawStringM0
   7B71 21 06 00      [10] 4109 	ld	hl,#6
   7B74 39            [11] 4110 	add	hl,sp
   7B75 F9            [ 6] 4111 	ld	sp,hl
                           4112 ;src/main.c:768: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 20, 120); // centrado en horizontal y arriba en vertical
   7B76 21 14 78      [10] 4113 	ld	hl,#0x7814
   7B79 E5            [11] 4114 	push	hl
   7B7A 21 00 C0      [10] 4115 	ld	hl,#0xC000
   7B7D E5            [11] 4116 	push	hl
   7B7E CD 0B 5F      [17] 4117 	call	_cpct_getScreenPtr
   7B81 4D            [ 4] 4118 	ld	c,l
   7B82 44            [ 4] 4119 	ld	b,h
                           4120 ;src/main.c:769: cpct_drawStringM0("SCORE: ", memptr, 2, 0);
   7B83 21 02 00      [10] 4121 	ld	hl,#0x0002
   7B86 E5            [11] 4122 	push	hl
   7B87 C5            [11] 4123 	push	bc
   7B88 21 DD 7C      [10] 4124 	ld	hl,#___str_1
   7B8B E5            [11] 4125 	push	hl
   7B8C CD 24 53      [17] 4126 	call	_cpct_drawStringM0
   7B8F 21 06 00      [10] 4127 	ld	hl,#6
   7B92 39            [11] 4128 	add	hl,sp
   7B93 F9            [ 6] 4129 	ld	sp,hl
                           4130 ;src/main.c:771: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 120); // centrado en horizontal y arriba en vertical
   7B94 21 2D 78      [10] 4131 	ld	hl,#0x782D
   7B97 E5            [11] 4132 	push	hl
   7B98 21 00 C0      [10] 4133 	ld	hl,#0xC000
   7B9B E5            [11] 4134 	push	hl
   7B9C CD 0B 5F      [17] 4135 	call	_cpct_getScreenPtr
                           4136 ;src/main.c:773: cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
   7B9F E5            [11] 4137 	push	hl
   7BA0 21 0A 00      [10] 4138 	ld	hl,#0x000A
   7BA3 E5            [11] 4139 	push	hl
   7BA4 DD 6E FC      [19] 4140 	ld	l,-4 (ix)
   7BA7 DD 66 FD      [19] 4141 	ld	h,-3 (ix)
   7BAA E5            [11] 4142 	push	hl
   7BAB CD 19 55      [17] 4143 	call	__moduint
   7BAE F1            [10] 4144 	pop	af
   7BAF F1            [10] 4145 	pop	af
   7BB0 C1            [10] 4146 	pop	bc
   7BB1 7D            [ 4] 4147 	ld	a,l
   7BB2 C6 30         [ 7] 4148 	add	a, #0x30
   7BB4 67            [ 4] 4149 	ld	h,a
   7BB5 59            [ 4] 4150 	ld	e, c
   7BB6 50            [ 4] 4151 	ld	d, b
   7BB7 C5            [11] 4152 	push	bc
   7BB8 E5            [11] 4153 	push	hl
   7BB9 33            [ 6] 4154 	inc	sp
   7BBA 21 02 00      [10] 4155 	ld	hl,#0x0002
   7BBD E5            [11] 4156 	push	hl
   7BBE D5            [11] 4157 	push	de
   7BBF CD 80 54      [17] 4158 	call	_cpct_drawCharM0
   7BC2 F1            [10] 4159 	pop	af
   7BC3 33            [ 6] 4160 	inc	sp
   7BC4 21 E8 03      [10] 4161 	ld	hl,#0x03E8
   7BC7 E3            [19] 4162 	ex	(sp),hl
   7BC8 DD 6E FE      [19] 4163 	ld	l,-2 (ix)
   7BCB DD 66 FF      [19] 4164 	ld	h,-1 (ix)
   7BCE E5            [11] 4165 	push	hl
   7BCF CD 4A 52      [17] 4166 	call	__divuint
   7BD2 F1            [10] 4167 	pop	af
   7BD3 F1            [10] 4168 	pop	af
   7BD4 11 0A 00      [10] 4169 	ld	de,#0x000A
   7BD7 D5            [11] 4170 	push	de
   7BD8 E5            [11] 4171 	push	hl
   7BD9 CD 19 55      [17] 4172 	call	__moduint
   7BDC F1            [10] 4173 	pop	af
   7BDD F1            [10] 4174 	pop	af
   7BDE C1            [10] 4175 	pop	bc
   7BDF 7D            [ 4] 4176 	ld	a,l
   7BE0 C6 30         [ 7] 4177 	add	a, #0x30
   7BE2 67            [ 4] 4178 	ld	h,a
   7BE3 79            [ 4] 4179 	ld	a,c
   7BE4 C6 04         [ 7] 4180 	add	a, #0x04
   7BE6 5F            [ 4] 4181 	ld	e,a
   7BE7 78            [ 4] 4182 	ld	a,b
   7BE8 CE 00         [ 7] 4183 	adc	a, #0x00
   7BEA 57            [ 4] 4184 	ld	d,a
   7BEB C5            [11] 4185 	push	bc
   7BEC E5            [11] 4186 	push	hl
   7BED 33            [ 6] 4187 	inc	sp
   7BEE 21 02 00      [10] 4188 	ld	hl,#0x0002
   7BF1 E5            [11] 4189 	push	hl
   7BF2 D5            [11] 4190 	push	de
   7BF3 CD 80 54      [17] 4191 	call	_cpct_drawCharM0
   7BF6 F1            [10] 4192 	pop	af
   7BF7 33            [ 6] 4193 	inc	sp
   7BF8 21 64 00      [10] 4194 	ld	hl,#0x0064
   7BFB E3            [19] 4195 	ex	(sp),hl
   7BFC DD 6E FE      [19] 4196 	ld	l,-2 (ix)
   7BFF DD 66 FF      [19] 4197 	ld	h,-1 (ix)
   7C02 E5            [11] 4198 	push	hl
   7C03 CD 4A 52      [17] 4199 	call	__divuint
   7C06 F1            [10] 4200 	pop	af
   7C07 F1            [10] 4201 	pop	af
   7C08 11 0A 00      [10] 4202 	ld	de,#0x000A
   7C0B D5            [11] 4203 	push	de
   7C0C E5            [11] 4204 	push	hl
   7C0D CD 19 55      [17] 4205 	call	__moduint
   7C10 F1            [10] 4206 	pop	af
   7C11 F1            [10] 4207 	pop	af
   7C12 C1            [10] 4208 	pop	bc
   7C13 7D            [ 4] 4209 	ld	a,l
   7C14 C6 30         [ 7] 4210 	add	a, #0x30
   7C16 57            [ 4] 4211 	ld	d,a
   7C17 FD 21 08 00   [14] 4212 	ld	iy,#0x0008
   7C1B FD 09         [15] 4213 	add	iy,bc
   7C1D C5            [11] 4214 	push	bc
   7C1E D5            [11] 4215 	push	de
   7C1F 33            [ 6] 4216 	inc	sp
   7C20 21 02 00      [10] 4217 	ld	hl,#0x0002
   7C23 E5            [11] 4218 	push	hl
   7C24 FD E5         [15] 4219 	push	iy
   7C26 CD 80 54      [17] 4220 	call	_cpct_drawCharM0
   7C29 F1            [10] 4221 	pop	af
   7C2A 33            [ 6] 4222 	inc	sp
   7C2B 21 0A 00      [10] 4223 	ld	hl,#0x000A
   7C2E E3            [19] 4224 	ex	(sp),hl
   7C2F DD 6E FE      [19] 4225 	ld	l,-2 (ix)
   7C32 DD 66 FF      [19] 4226 	ld	h,-1 (ix)
   7C35 E5            [11] 4227 	push	hl
   7C36 CD 4A 52      [17] 4228 	call	__divuint
   7C39 F1            [10] 4229 	pop	af
   7C3A F1            [10] 4230 	pop	af
   7C3B 11 0A 00      [10] 4231 	ld	de,#0x000A
   7C3E D5            [11] 4232 	push	de
   7C3F E5            [11] 4233 	push	hl
   7C40 CD 19 55      [17] 4234 	call	__moduint
   7C43 F1            [10] 4235 	pop	af
   7C44 F1            [10] 4236 	pop	af
   7C45 C1            [10] 4237 	pop	bc
   7C46 7D            [ 4] 4238 	ld	a,l
   7C47 C6 30         [ 7] 4239 	add	a, #0x30
   7C49 57            [ 4] 4240 	ld	d,a
   7C4A FD 21 0C 00   [14] 4241 	ld	iy,#0x000C
   7C4E FD 09         [15] 4242 	add	iy,bc
   7C50 C5            [11] 4243 	push	bc
   7C51 D5            [11] 4244 	push	de
   7C52 33            [ 6] 4245 	inc	sp
   7C53 21 02 00      [10] 4246 	ld	hl,#0x0002
   7C56 E5            [11] 4247 	push	hl
   7C57 FD E5         [15] 4248 	push	iy
   7C59 CD 80 54      [17] 4249 	call	_cpct_drawCharM0
   7C5C F1            [10] 4250 	pop	af
   7C5D 33            [ 6] 4251 	inc	sp
   7C5E 21 0A 00      [10] 4252 	ld	hl,#0x000A
   7C61 E3            [19] 4253 	ex	(sp),hl
   7C62 DD 6E FE      [19] 4254 	ld	l,-2 (ix)
   7C65 DD 66 FF      [19] 4255 	ld	h,-1 (ix)
   7C68 E5            [11] 4256 	push	hl
   7C69 CD 19 55      [17] 4257 	call	__moduint
   7C6C F1            [10] 4258 	pop	af
   7C6D F1            [10] 4259 	pop	af
   7C6E C1            [10] 4260 	pop	bc
   7C6F 7D            [ 4] 4261 	ld	a,l
   7C70 C6 30         [ 7] 4262 	add	a, #0x30
   7C72 57            [ 4] 4263 	ld	d,a
   7C73 21 10 00      [10] 4264 	ld	hl,#0x0010
   7C76 09            [11] 4265 	add	hl,bc
   7C77 4D            [ 4] 4266 	ld	c,l
   7C78 44            [ 4] 4267 	ld	b,h
   7C79 D5            [11] 4268 	push	de
   7C7A 33            [ 6] 4269 	inc	sp
   7C7B 21 02 00      [10] 4270 	ld	hl,#0x0002
   7C7E E5            [11] 4271 	push	hl
   7C7F C5            [11] 4272 	push	bc
   7C80 CD 80 54      [17] 4273 	call	_cpct_drawCharM0
   7C83 F1            [10] 4274 	pop	af
                           4275 ;src/main.c:783: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 160); // centrado en horizontal y abajo en vertical
   7C84 33            [ 6] 4276 	inc	sp
   7C85 21 0E A0      [10] 4277 	ld	hl,#0xA00E
   7C88 E3            [19] 4278 	ex	(sp),hl
   7C89 21 00 C0      [10] 4279 	ld	hl,#0xC000
   7C8C E5            [11] 4280 	push	hl
   7C8D CD 0B 5F      [17] 4281 	call	_cpct_getScreenPtr
   7C90 4D            [ 4] 4282 	ld	c,l
   7C91 44            [ 4] 4283 	ld	b,h
                           4284 ;src/main.c:784: cpct_drawStringM0("TO PLAY AGAIN", memptr, 2, 0);
   7C92 21 02 00      [10] 4285 	ld	hl,#0x0002
   7C95 E5            [11] 4286 	push	hl
   7C96 C5            [11] 4287 	push	bc
   7C97 21 E5 7C      [10] 4288 	ld	hl,#___str_2
   7C9A E5            [11] 4289 	push	hl
   7C9B CD 24 53      [17] 4290 	call	_cpct_drawStringM0
   7C9E 21 06 00      [10] 4291 	ld	hl,#6
   7CA1 39            [11] 4292 	add	hl,sp
   7CA2 F9            [ 6] 4293 	ld	sp,hl
                           4294 ;src/main.c:786: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 28, 170); // centrado en horizontal y abajo en vertical
   7CA3 21 1C AA      [10] 4295 	ld	hl,#0xAA1C
   7CA6 E5            [11] 4296 	push	hl
   7CA7 21 00 C0      [10] 4297 	ld	hl,#0xC000
   7CAA E5            [11] 4298 	push	hl
   7CAB CD 0B 5F      [17] 4299 	call	_cpct_getScreenPtr
   7CAE 4D            [ 4] 4300 	ld	c,l
   7CAF 44            [ 4] 4301 	ld	b,h
                           4302 ;src/main.c:787: cpct_drawStringM0("PRESS P", memptr, 2, 0);
   7CB0 21 02 00      [10] 4303 	ld	hl,#0x0002
   7CB3 E5            [11] 4304 	push	hl
   7CB4 C5            [11] 4305 	push	bc
   7CB5 21 F3 7C      [10] 4306 	ld	hl,#___str_3
   7CB8 E5            [11] 4307 	push	hl
   7CB9 CD 24 53      [17] 4308 	call	_cpct_drawStringM0
   7CBC 21 06 00      [10] 4309 	ld	hl,#6
   7CBF 39            [11] 4310 	add	hl,sp
   7CC0 F9            [ 6] 4311 	ld	sp,hl
                           4312 ;src/main.c:790: do{
   7CC1                    4313 00101$:
                           4314 ;src/main.c:791: cpct_scanKeyboard_f();
   7CC1 CD AE 52      [17] 4315 	call	_cpct_scanKeyboard_f
                           4316 ;src/main.c:794: } while(!cpct_isKeyPressed(Key_P));
   7CC4 21 03 08      [10] 4317 	ld	hl,#0x0803
   7CC7 CD A2 52      [17] 4318 	call	_cpct_isKeyPressed
   7CCA 7D            [ 4] 4319 	ld	a,l
   7CCB B7            [ 4] 4320 	or	a, a
   7CCC 28 F3         [12] 4321 	jr	Z,00101$
   7CCE DD F9         [10] 4322 	ld	sp, ix
   7CD0 DD E1         [14] 4323 	pop	ix
   7CD2 C9            [10] 4324 	ret
   7CD3                    4325 ___str_0:
   7CD3 47 41 4D 45 20 4F  4326 	.ascii "GAME OVER"
        56 45 52
   7CDC 00                 4327 	.db 0x00
   7CDD                    4328 ___str_1:
   7CDD 53 43 4F 52 45 3A  4329 	.ascii "SCORE: "
        20
   7CE4 00                 4330 	.db 0x00
   7CE5                    4331 ___str_2:
   7CE5 54 4F 20 50 4C 41  4332 	.ascii "TO PLAY AGAIN"
        59 20 41 47 41 49
        4E
   7CF2 00                 4333 	.db 0x00
   7CF3                    4334 ___str_3:
   7CF3 50 52 45 53 53 20  4335 	.ascii "PRESS P"
        50
   7CFA 00                 4336 	.db 0x00
                           4337 ;src/main.c:797: void avanzarMapa() {
                           4338 ;	---------------------------------
                           4339 ; Function avanzarMapa
                           4340 ; ---------------------------------
   7CFB                    4341 _avanzarMapa::
                           4342 ;src/main.c:798: if(num_mapa < NUM_MAPAS -1) {
   7CFB 3A 33 63      [13] 4343 	ld	a,(#_num_mapa + 0)
   7CFE D6 02         [ 7] 4344 	sub	a, #0x02
   7D00 30 34         [12] 4345 	jr	NC,00102$
                           4346 ;src/main.c:799: mapa = mapas[++num_mapa];
   7D02 01 17 64      [10] 4347 	ld	bc,#_mapas+0
   7D05 21 33 63      [10] 4348 	ld	hl, #_num_mapa+0
   7D08 34            [11] 4349 	inc	(hl)
   7D09 FD 21 33 63   [14] 4350 	ld	iy,#_num_mapa
   7D0D FD 6E 00      [19] 4351 	ld	l,0 (iy)
   7D10 26 00         [ 7] 4352 	ld	h,#0x00
   7D12 29            [11] 4353 	add	hl, hl
   7D13 09            [11] 4354 	add	hl,bc
   7D14 7E            [ 7] 4355 	ld	a,(hl)
   7D15 FD 21 31 63   [14] 4356 	ld	iy,#_mapa
   7D19 FD 77 00      [19] 4357 	ld	0 (iy),a
   7D1C 23            [ 6] 4358 	inc	hl
   7D1D 7E            [ 7] 4359 	ld	a,(hl)
   7D1E 32 32 63      [13] 4360 	ld	(#_mapa + 1),a
                           4361 ;src/main.c:800: prota.x = prota.px = 2;
   7D21 21 1C 63      [10] 4362 	ld	hl,#(_prota + 0x0002)
   7D24 36 02         [10] 4363 	ld	(hl),#0x02
   7D26 21 1A 63      [10] 4364 	ld	hl,#_prota
   7D29 36 02         [10] 4365 	ld	(hl),#0x02
                           4366 ;src/main.c:801: prota.mover = SI;
   7D2B 21 20 63      [10] 4367 	ld	hl,#(_prota + 0x0006)
   7D2E 36 01         [10] 4368 	ld	(hl),#0x01
                           4369 ;src/main.c:802: dibujarMapa();
   7D30 CD 01 64      [17] 4370 	call	_dibujarMapa
                           4371 ;src/main.c:803: inicializarEnemy();
   7D33 C3 88 78      [10] 4372 	jp  _inicializarEnemy
   7D36                    4373 00102$:
                           4374 ;src/main.c:806: menuFin(puntuacion);
   7D36 FD 21 35 63   [14] 4375 	ld	iy,#_puntuacion
   7D3A FD 6E 00      [19] 4376 	ld	l,0 (iy)
   7D3D 26 00         [ 7] 4377 	ld	h,#0x00
   7D3F C3 28 7B      [10] 4378 	jp  _menuFin
                           4379 ;src/main.c:811: void main(void) {
                           4380 ;	---------------------------------
                           4381 ; Function main
                           4382 ; ---------------------------------
   7D42                    4383 _main::
   7D42 DD E5         [15] 4384 	push	ix
   7D44 DD 21 00 00   [14] 4385 	ld	ix,#0
   7D48 DD 39         [15] 4386 	add	ix,sp
   7D4A 21 F3 FF      [10] 4387 	ld	hl,#-13
   7D4D 39            [11] 4388 	add	hl,sp
   7D4E F9            [ 6] 4389 	ld	sp,hl
                           4390 ;src/main.c:818: inicializarCPC();
   7D4F CD 72 7A      [17] 4391 	call	_inicializarCPC
                           4392 ;src/main.c:820: menuInicio();
   7D52 CD 42 4F      [17] 4393 	call	_menuInicio
                           4394 ;src/main.c:822: inicializarJuego();
   7D55 CD 9B 7A      [17] 4395 	call	_inicializarJuego
                           4396 ;src/main.c:826: while (1) {
   7D58                    4397 00152$:
                           4398 ;src/main.c:827: if (endGame) {
   7D58 3A 34 63      [13] 4399 	ld	a,(#_endGame + 0)
   7D5B B7            [ 4] 4400 	or	a, a
   7D5C 28 1F         [12] 4401 	jr	Z,00102$
                           4402 ;src/main.c:828: menuFin(puntuacion);
   7D5E FD 21 35 63   [14] 4403 	ld	iy,#_puntuacion
   7D62 FD 6E 00      [19] 4404 	ld	l,0 (iy)
   7D65 26 00         [ 7] 4405 	ld	h,#0x00
   7D67 CD 28 7B      [17] 4406 	call	_menuFin
                           4407 ;src/main.c:829: endGame = 0;
   7D6A 21 34 63      [10] 4408 	ld	hl,#_endGame + 0
   7D6D 36 00         [10] 4409 	ld	(hl), #0x00
                           4410 ;src/main.c:830: num_mapa = 0;
   7D6F 21 33 63      [10] 4411 	ld	hl,#_num_mapa + 0
   7D72 36 00         [10] 4412 	ld	(hl), #0x00
                           4413 ;src/main.c:831: mapa = 0;
   7D74 21 00 00      [10] 4414 	ld	hl,#0x0000
   7D77 22 31 63      [16] 4415 	ld	(_mapa),hl
                           4416 ;src/main.c:832: inicializarJuego();
   7D7A CD 9B 7A      [17] 4417 	call	_inicializarJuego
   7D7D                    4418 00102$:
                           4419 ;src/main.c:834: if (endGame) {
   7D7D 3A 34 63      [13] 4420 	ld	a,(#_endGame + 0)
   7D80 B7            [ 4] 4421 	or	a, a
   7D81 28 14         [12] 4422 	jr	Z,00104$
                           4423 ;src/main.c:835: menuFin(puntuacion);
   7D83 FD 21 35 63   [14] 4424 	ld	iy,#_puntuacion
   7D87 FD 6E 00      [19] 4425 	ld	l,0 (iy)
   7D8A 26 00         [ 7] 4426 	ld	h,#0x00
   7D8C CD 28 7B      [17] 4427 	call	_menuFin
                           4428 ;src/main.c:836: endGame = 0;
   7D8F 21 34 63      [10] 4429 	ld	hl,#_endGame + 0
   7D92 36 00         [10] 4430 	ld	(hl), #0x00
                           4431 ;src/main.c:837: inicializarJuego();
   7D94 CD 9B 7A      [17] 4432 	call	_inicializarJuego
   7D97                    4433 00104$:
                           4434 ;src/main.c:839: ++timer;
   7D97 21 2F 63      [10] 4435 	ld	hl, #_timer+0
   7D9A 34            [11] 4436 	inc	(hl)
   7D9B 20 04         [12] 4437 	jr	NZ,00278$
   7D9D 21 30 63      [10] 4438 	ld	hl, #_timer+1
   7DA0 34            [11] 4439 	inc	(hl)
   7DA1                    4440 00278$:
                           4441 ;src/main.c:840: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7DA1 3A 2F 63      [13] 4442 	ld	a,(#_timer + 0)
   7DA4 D6 04         [ 7] 4443 	sub	a, #0x04
   7DA6 20 30         [12] 4444 	jr	NZ,00108$
   7DA8 3A 30 63      [13] 4445 	ld	a,(#_timer + 1)
   7DAB B7            [ 4] 4446 	or	a, a
   7DAC 20 2A         [12] 4447 	jr	NZ,00108$
   7DAE 3A 2E 63      [13] 4448 	ld	a,(#_cambio + 0)
   7DB1 B7            [ 4] 4449 	or	a, a
   7DB2 28 24         [12] 4450 	jr	Z,00108$
   7DB4 3E 0C         [ 7] 4451 	ld	a,#0x0C
   7DB6 FD 21 2E 63   [14] 4452 	ld	iy,#_cambio
   7DBA FD 96 00      [19] 4453 	sub	a, 0 (iy)
   7DBD 38 19         [12] 4454 	jr	C,00108$
                           4455 ;src/main.c:841: timer = 0;
   7DBF 21 00 00      [10] 4456 	ld	hl,#0x0000
   7DC2 22 2F 63      [16] 4457 	ld	(_timer),hl
                           4458 ;src/main.c:842: parpadeo = !parpadeo;
   7DC5 3A 2D 63      [13] 4459 	ld	a,(#_parpadeo + 0)
   7DC8 D6 01         [ 7] 4460 	sub	a,#0x01
   7DCA 3E 00         [ 7] 4461 	ld	a,#0x00
   7DCC 17            [ 4] 4462 	rla
   7DCD 4F            [ 4] 4463 	ld	c,a
   7DCE 21 2D 63      [10] 4464 	ld	hl,#_parpadeo + 0
   7DD1 71            [ 7] 4465 	ld	(hl), c
                           4466 ;src/main.c:843: cambio ++;
   7DD2 21 2E 63      [10] 4467 	ld	hl, #_cambio+0
   7DD5 34            [11] 4468 	inc	(hl)
   7DD6 18 0C         [12] 4469 	jr	00109$
   7DD8                    4470 00108$:
                           4471 ;src/main.c:844: }else if(cambio == 12){
   7DD8 3A 2E 63      [13] 4472 	ld	a,(#_cambio + 0)
   7DDB D6 0C         [ 7] 4473 	sub	a, #0x0C
   7DDD 20 05         [12] 4474 	jr	NZ,00109$
                           4475 ;src/main.c:845: cambio = 0;
   7DDF 21 2E 63      [10] 4476 	ld	hl,#_cambio + 0
   7DE2 36 00         [10] 4477 	ld	(hl), #0x00
   7DE4                    4478 00109$:
                           4479 ;src/main.c:847: i = 2 + num_mapa;
   7DE4 21 33 63      [10] 4480 	ld	hl,#_num_mapa + 0
   7DE7 4E            [ 7] 4481 	ld	c, (hl)
   7DE8 0C            [ 4] 4482 	inc	c
   7DE9 0C            [ 4] 4483 	inc	c
                           4484 ;src/main.c:848: actual = enemy;
                           4485 ;src/main.c:850: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7DEA C5            [11] 4486 	push	bc
   7DEB 21 00 01      [10] 4487 	ld	hl,#_g_tablatrans
   7DEE E5            [11] 4488 	push	hl
   7DEF 2A 31 63      [16] 4489 	ld	hl,(_mapa)
   7DF2 E5            [11] 4490 	push	hl
   7DF3 21 1A 63      [10] 4491 	ld	hl,#_prota
   7DF6 E5            [11] 4492 	push	hl
   7DF7 21 22 63      [10] 4493 	ld	hl,#_cu
   7DFA E5            [11] 4494 	push	hl
   7DFB CD FB 64      [17] 4495 	call	_comprobarTeclado
   7DFE 21 08 00      [10] 4496 	ld	hl,#8
   7E01 39            [11] 4497 	add	hl,sp
   7E02 F9            [ 6] 4498 	ld	sp,hl
   7E03 2A 31 63      [16] 4499 	ld	hl,(_mapa)
   7E06 E5            [11] 4500 	push	hl
   7E07 21 22 63      [10] 4501 	ld	hl,#_cu
   7E0A E5            [11] 4502 	push	hl
   7E0B CD 25 43      [17] 4503 	call	_moverCuchillo
   7E0E F1            [10] 4504 	pop	af
   7E0F F1            [10] 4505 	pop	af
   7E10 C1            [10] 4506 	pop	bc
                           4507 ;src/main.c:852: while(i){
   7E11 DD 71 F3      [19] 4508 	ld	-13 (ix),c
   7E14 DD 36 FC 8E   [19] 4509 	ld	-4 (ix),#<(_enemy)
   7E18 DD 36 FD 5F   [19] 4510 	ld	-3 (ix),#>(_enemy)
   7E1C                    4511 00119$:
   7E1C DD 7E F3      [19] 4512 	ld	a,-13 (ix)
   7E1F B7            [ 4] 4513 	or	a, a
   7E20 28 6A         [12] 4514 	jr	Z,00121$
                           4515 ;src/main.c:854: --i;
   7E22 DD 35 F3      [23] 4516 	dec	-13 (ix)
                           4517 ;src/main.c:855: if(!actual->muerto){
   7E25 DD 7E FC      [19] 4518 	ld	a,-4 (ix)
   7E28 C6 08         [ 7] 4519 	add	a, #0x08
   7E2A DD 77 FE      [19] 4520 	ld	-2 (ix),a
   7E2D DD 7E FD      [19] 4521 	ld	a,-3 (ix)
   7E30 CE 00         [ 7] 4522 	adc	a, #0x00
   7E32 DD 77 FF      [19] 4523 	ld	-1 (ix),a
   7E35 DD 6E FE      [19] 4524 	ld	l,-2 (ix)
   7E38 DD 66 FF      [19] 4525 	ld	h,-1 (ix)
   7E3B 7E            [ 7] 4526 	ld	a,(hl)
   7E3C B7            [ 4] 4527 	or	a, a
   7E3D 20 12         [12] 4528 	jr	NZ,00113$
                           4529 ;src/main.c:856: checkEnemyDead(cu.direccion, actual);
   7E3F 21 29 63      [10] 4530 	ld	hl, #_cu + 7
   7E42 46            [ 7] 4531 	ld	b,(hl)
   7E43 DD 6E FC      [19] 4532 	ld	l,-4 (ix)
   7E46 DD 66 FD      [19] 4533 	ld	h,-3 (ix)
   7E49 E5            [11] 4534 	push	hl
   7E4A C5            [11] 4535 	push	bc
   7E4B 33            [ 6] 4536 	inc	sp
   7E4C CD 55 68      [17] 4537 	call	_checkEnemyDead
   7E4F F1            [10] 4538 	pop	af
   7E50 33            [ 6] 4539 	inc	sp
   7E51                    4540 00113$:
                           4541 ;src/main.c:858: if(!actual->muerto){
   7E51 DD 6E FE      [19] 4542 	ld	l,-2 (ix)
   7E54 DD 66 FF      [19] 4543 	ld	h,-1 (ix)
   7E57 7E            [ 7] 4544 	ld	a,(hl)
   7E58 B7            [ 4] 4545 	or	a, a
   7E59 20 1F         [12] 4546 	jr	NZ,00118$
                           4547 ;src/main.c:859: if (!actual->didDamage)
   7E5B DD 7E FC      [19] 4548 	ld	a,-4 (ix)
   7E5E C6 16         [ 7] 4549 	add	a, #0x16
   7E60 4F            [ 4] 4550 	ld	c,a
   7E61 DD 7E FD      [19] 4551 	ld	a,-3 (ix)
   7E64 CE 00         [ 7] 4552 	adc	a, #0x00
   7E66 47            [ 4] 4553 	ld	b,a
   7E67 0A            [ 7] 4554 	ld	a,(bc)
   7E68 B7            [ 4] 4555 	or	a, a
   7E69 20 0D         [12] 4556 	jr	NZ,00115$
                           4557 ;src/main.c:860: updateEnemy(actual);
   7E6B DD 6E FC      [19] 4558 	ld	l,-4 (ix)
   7E6E DD 66 FD      [19] 4559 	ld	h,-3 (ix)
   7E71 E5            [11] 4560 	push	hl
   7E72 CD 28 77      [17] 4561 	call	_updateEnemy
   7E75 F1            [10] 4562 	pop	af
   7E76 18 02         [12] 4563 	jr	00118$
   7E78                    4564 00115$:
                           4565 ;src/main.c:862: actual->didDamage = 0;
   7E78 AF            [ 4] 4566 	xor	a, a
   7E79 02            [ 7] 4567 	ld	(bc),a
   7E7A                    4568 00118$:
                           4569 ;src/main.c:864: ++actual;
   7E7A DD 7E FC      [19] 4570 	ld	a,-4 (ix)
   7E7D C6 E3         [ 7] 4571 	add	a, #0xE3
   7E7F DD 77 FC      [19] 4572 	ld	-4 (ix),a
   7E82 DD 7E FD      [19] 4573 	ld	a,-3 (ix)
   7E85 CE 00         [ 7] 4574 	adc	a, #0x00
   7E87 DD 77 FD      [19] 4575 	ld	-3 (ix),a
   7E8A 18 90         [12] 4576 	jr	00119$
   7E8C                    4577 00121$:
                           4578 ;src/main.c:867: cpct_waitVSYNC();
   7E8C CD C4 55      [17] 4579 	call	_cpct_waitVSYNC
                           4580 ;src/main.c:870: if (prota.mover) {
   7E8F 01 20 63      [10] 4581 	ld	bc,#_prota + 6
   7E92 0A            [ 7] 4582 	ld	a,(bc)
   7E93 B7            [ 4] 4583 	or	a, a
   7E94 28 07         [12] 4584 	jr	Z,00123$
                           4585 ;src/main.c:871: redibujarProta();
   7E96 C5            [11] 4586 	push	bc
   7E97 CD E7 64      [17] 4587 	call	_redibujarProta
   7E9A C1            [10] 4588 	pop	bc
                           4589 ;src/main.c:872: prota.mover = NO;
   7E9B AF            [ 4] 4590 	xor	a, a
   7E9C 02            [ 7] 4591 	ld	(bc),a
   7E9D                    4592 00123$:
                           4593 ;src/main.c:874: if(cu.lanzado && cu.mover){
   7E9D 21 28 63      [10] 4594 	ld	hl, #(_cu + 0x0006) + 0
   7EA0 4E            [ 7] 4595 	ld	c,(hl)
                           4596 ;src/main.c:875: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4597 ;src/main.c:874: if(cu.lanzado && cu.mover){
   7EA1 79            [ 4] 4598 	ld	a,c
   7EA2 B7            [ 4] 4599 	or	a, a
   7EA3 28 30         [12] 4600 	jr	Z,00128$
   7EA5 3A 2B 63      [13] 4601 	ld	a, (#(_cu + 0x0009) + 0)
   7EA8 B7            [ 4] 4602 	or	a, a
   7EA9 28 2A         [12] 4603 	jr	Z,00128$
                           4604 ;src/main.c:875: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7EAB 21 23 63      [10] 4605 	ld	hl, #(_cu + 0x0001) + 0
   7EAE 4E            [ 7] 4606 	ld	c,(hl)
   7EAF 21 22 63      [10] 4607 	ld	hl, #_cu + 0
   7EB2 46            [ 7] 4608 	ld	b,(hl)
   7EB3 21 2A 63      [10] 4609 	ld	hl, #(_cu + 0x0008) + 0
   7EB6 5E            [ 7] 4610 	ld	e,(hl)
   7EB7 2A 31 63      [16] 4611 	ld	hl,(_mapa)
   7EBA E5            [11] 4612 	push	hl
   7EBB 21 00 01      [10] 4613 	ld	hl,#_g_tablatrans
   7EBE E5            [11] 4614 	push	hl
   7EBF 21 22 63      [10] 4615 	ld	hl,#_cu
   7EC2 E5            [11] 4616 	push	hl
   7EC3 79            [ 4] 4617 	ld	a,c
   7EC4 F5            [11] 4618 	push	af
   7EC5 33            [ 6] 4619 	inc	sp
   7EC6 C5            [11] 4620 	push	bc
   7EC7 33            [ 6] 4621 	inc	sp
   7EC8 7B            [ 4] 4622 	ld	a,e
   7EC9 F5            [11] 4623 	push	af
   7ECA 33            [ 6] 4624 	inc	sp
   7ECB CD 25 40      [17] 4625 	call	_redibujarCuchillo
   7ECE 21 09 00      [10] 4626 	ld	hl,#9
   7ED1 39            [11] 4627 	add	hl,sp
   7ED2 F9            [ 6] 4628 	ld	sp,hl
   7ED3 18 32         [12] 4629 	jr	00129$
   7ED5                    4630 00128$:
                           4631 ;src/main.c:876: }else if (cu.lanzado && !cu.mover){
   7ED5 79            [ 4] 4632 	ld	a,c
   7ED6 B7            [ 4] 4633 	or	a, a
   7ED7 28 2E         [12] 4634 	jr	Z,00129$
   7ED9 3A 2B 63      [13] 4635 	ld	a, (#(_cu + 0x0009) + 0)
   7EDC B7            [ 4] 4636 	or	a, a
   7EDD 20 28         [12] 4637 	jr	NZ,00129$
                           4638 ;src/main.c:877: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7EDF 21 23 63      [10] 4639 	ld	hl, #(_cu + 0x0001) + 0
   7EE2 46            [ 7] 4640 	ld	b,(hl)
   7EE3 21 22 63      [10] 4641 	ld	hl, #_cu + 0
   7EE6 4E            [ 7] 4642 	ld	c,(hl)
   7EE7 21 2A 63      [10] 4643 	ld	hl, #(_cu + 0x0008) + 0
   7EEA 56            [ 7] 4644 	ld	d,(hl)
   7EEB 2A 31 63      [16] 4645 	ld	hl,(_mapa)
   7EEE E5            [11] 4646 	push	hl
   7EEF C5            [11] 4647 	push	bc
   7EF0 D5            [11] 4648 	push	de
   7EF1 33            [ 6] 4649 	inc	sp
   7EF2 CD 92 3F      [17] 4650 	call	_borrarCuchillo
   7EF5 F1            [10] 4651 	pop	af
   7EF6 F1            [10] 4652 	pop	af
   7EF7 33            [ 6] 4653 	inc	sp
                           4654 ;src/main.c:878: cu.lanzado = NO;
   7EF8 21 28 63      [10] 4655 	ld	hl,#(_cu + 0x0006)
   7EFB 36 00         [10] 4656 	ld	(hl),#0x00
                           4657 ;src/main.c:880: cu.x = 0;
   7EFD 21 22 63      [10] 4658 	ld	hl,#_cu
   7F00 36 00         [10] 4659 	ld	(hl),#0x00
                           4660 ;src/main.c:881: cu.y=0;
   7F02 21 23 63      [10] 4661 	ld	hl,#(_cu + 0x0001)
   7F05 36 00         [10] 4662 	ld	(hl),#0x00
   7F07                    4663 00129$:
                           4664 ;src/main.c:884: i = 2 + num_mapa;
   7F07 21 33 63      [10] 4665 	ld	hl,#_num_mapa + 0
   7F0A 4E            [ 7] 4666 	ld	c, (hl)
   7F0B 0C            [ 4] 4667 	inc	c
   7F0C 0C            [ 4] 4668 	inc	c
                           4669 ;src/main.c:885: actual = enemy;
   7F0D 11 8E 5F      [10] 4670 	ld	de,#_enemy
                           4671 ;src/main.c:886: while(i){
   7F10                    4672 00148$:
   7F10 79            [ 4] 4673 	ld	a,c
   7F11 B7            [ 4] 4674 	or	a, a
   7F12 CA 8E 80      [10] 4675 	jp	Z,00150$
                           4676 ;src/main.c:888: --i;
   7F15 0D            [ 4] 4677 	dec	c
                           4678 ;src/main.c:889: if(actual->mover){
   7F16 21 06 00      [10] 4679 	ld	hl,#0x0006
   7F19 19            [11] 4680 	add	hl,de
   7F1A DD 75 FE      [19] 4681 	ld	-2 (ix),l
   7F1D DD 74 FF      [19] 4682 	ld	-1 (ix),h
   7F20 DD 6E FE      [19] 4683 	ld	l,-2 (ix)
   7F23 DD 66 FF      [19] 4684 	ld	h,-1 (ix)
   7F26 46            [ 7] 4685 	ld	b,(hl)
                           4686 ;src/main.c:890: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F27 21 03 00      [10] 4687 	ld	hl,#0x0003
   7F2A 19            [11] 4688 	add	hl,de
   7F2B DD 75 FC      [19] 4689 	ld	-4 (ix),l
   7F2E DD 74 FD      [19] 4690 	ld	-3 (ix),h
   7F31 21 02 00      [10] 4691 	ld	hl,#0x0002
   7F34 19            [11] 4692 	add	hl,de
   7F35 DD 75 F4      [19] 4693 	ld	-12 (ix),l
   7F38 DD 74 F5      [19] 4694 	ld	-11 (ix),h
                           4695 ;src/main.c:889: if(actual->mover){
   7F3B 78            [ 4] 4696 	ld	a,b
   7F3C B7            [ 4] 4697 	or	a, a
   7F3D 28 22         [12] 4698 	jr	Z,00132$
                           4699 ;src/main.c:890: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F3F DD 6E FC      [19] 4700 	ld	l,-4 (ix)
   7F42 DD 66 FD      [19] 4701 	ld	h,-3 (ix)
   7F45 7E            [ 7] 4702 	ld	a,(hl)
   7F46 DD 77 F3      [19] 4703 	ld	-13 (ix),a
   7F49 DD 6E F4      [19] 4704 	ld	l,-12 (ix)
   7F4C DD 66 F5      [19] 4705 	ld	h,-11 (ix)
   7F4F 46            [ 7] 4706 	ld	b,(hl)
   7F50 C5            [11] 4707 	push	bc
   7F51 D5            [11] 4708 	push	de
   7F52 D5            [11] 4709 	push	de
   7F53 DD 7E F3      [19] 4710 	ld	a,-13 (ix)
   7F56 F5            [11] 4711 	push	af
   7F57 33            [ 6] 4712 	inc	sp
   7F58 C5            [11] 4713 	push	bc
   7F59 33            [ 6] 4714 	inc	sp
   7F5A CD 24 68      [17] 4715 	call	_redibujarEnemigo
   7F5D F1            [10] 4716 	pop	af
   7F5E F1            [10] 4717 	pop	af
   7F5F D1            [10] 4718 	pop	de
   7F60 C1            [10] 4719 	pop	bc
   7F61                    4720 00132$:
                           4721 ;src/main.c:893: if (actual->muerto && actual->muertes == 0){
   7F61 21 08 00      [10] 4722 	ld	hl,#0x0008
   7F64 19            [11] 4723 	add	hl,de
   7F65 DD 75 F8      [19] 4724 	ld	-8 (ix),l
   7F68 DD 74 F9      [19] 4725 	ld	-7 (ix),h
   7F6B DD 6E F8      [19] 4726 	ld	l,-8 (ix)
   7F6E DD 66 F9      [19] 4727 	ld	h,-7 (ix)
   7F71 7E            [ 7] 4728 	ld	a,(hl)
   7F72 B7            [ 4] 4729 	or	a, a
   7F73 CA 09 80      [10] 4730 	jp	Z,00134$
   7F76 21 09 00      [10] 4731 	ld	hl,#0x0009
   7F79 19            [11] 4732 	add	hl,de
   7F7A DD 75 F6      [19] 4733 	ld	-10 (ix),l
   7F7D DD 74 F7      [19] 4734 	ld	-9 (ix),h
   7F80 DD 6E F6      [19] 4735 	ld	l,-10 (ix)
   7F83 DD 66 F7      [19] 4736 	ld	h,-9 (ix)
   7F86 7E            [ 7] 4737 	ld	a,(hl)
   7F87 B7            [ 4] 4738 	or	a, a
   7F88 C2 09 80      [10] 4739 	jp	NZ,00134$
                           4740 ;src/main.c:894: timer = 3;
   7F8B 21 03 00      [10] 4741 	ld	hl,#0x0003
   7F8E 22 2F 63      [16] 4742 	ld	(_timer),hl
                           4743 ;src/main.c:895: cambio++;
   7F91 FD 21 2E 63   [14] 4744 	ld	iy,#_cambio
   7F95 FD 34 00      [23] 4745 	inc	0 (iy)
                           4746 ;src/main.c:896: parpadeo = 1;
   7F98 FD 21 2D 63   [14] 4747 	ld	iy,#_parpadeo
   7F9C FD 36 00 01   [19] 4748 	ld	0 (iy),#0x01
                           4749 ;src/main.c:897: borrarEnemigo((*actual).x, (*actual).y);
   7FA0 2E 01         [ 7] 4750 	ld	l, #0x01
   7FA2 19            [11] 4751 	add	hl,de
   7FA3 DD 75 FA      [19] 4752 	ld	-6 (ix),l
   7FA6 DD 74 FB      [19] 4753 	ld	-5 (ix),h
   7FA9 DD 6E FA      [19] 4754 	ld	l,-6 (ix)
   7FAC DD 66 FB      [19] 4755 	ld	h,-5 (ix)
   7FAF 46            [ 7] 4756 	ld	b,(hl)
   7FB0 1A            [ 7] 4757 	ld	a,(de)
   7FB1 C5            [11] 4758 	push	bc
   7FB2 D5            [11] 4759 	push	de
   7FB3 C5            [11] 4760 	push	bc
   7FB4 33            [ 6] 4761 	inc	sp
   7FB5 F5            [11] 4762 	push	af
   7FB6 33            [ 6] 4763 	inc	sp
   7FB7 CD B4 67      [17] 4764 	call	_borrarEnemigo
   7FBA F1            [10] 4765 	pop	af
   7FBB D1            [10] 4766 	pop	de
   7FBC C1            [10] 4767 	pop	bc
                           4768 ;src/main.c:898: puntuacion_aux = puntuacion;
   7FBD FD 21 35 63   [14] 4769 	ld	iy,#_puntuacion
   7FC1 FD 6E 00      [19] 4770 	ld	l,0 (iy)
   7FC4 26 00         [ 7] 4771 	ld	h,#0x00
                           4772 ;src/main.c:899: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7FC6 C5            [11] 4773 	push	bc
   7FC7 D5            [11] 4774 	push	de
   7FC8 E5            [11] 4775 	push	hl
   7FC9 CD 27 52      [17] 4776 	call	_aumentarPuntuacion
   7FCC F1            [10] 4777 	pop	af
   7FCD D1            [10] 4778 	pop	de
   7FCE C1            [10] 4779 	pop	bc
   7FCF FD 21 35 63   [14] 4780 	ld	iy,#_puntuacion
   7FD3 FD 75 00      [19] 4781 	ld	0 (iy),l
                           4782 ;src/main.c:900: modificarPuntuacion(puntuacion);
   7FD6 FD 21 35 63   [14] 4783 	ld	iy,#_puntuacion
   7FDA FD 6E 00      [19] 4784 	ld	l,0 (iy)
   7FDD 26 00         [ 7] 4785 	ld	h,#0x00
   7FDF C5            [11] 4786 	push	bc
   7FE0 D5            [11] 4787 	push	de
   7FE1 E5            [11] 4788 	push	hl
   7FE2 CD BD 50      [17] 4789 	call	_modificarPuntuacion
   7FE5 F1            [10] 4790 	pop	af
   7FE6 D1            [10] 4791 	pop	de
   7FE7 C1            [10] 4792 	pop	bc
                           4793 ;src/main.c:901: actual->mover = NO;
   7FE8 DD 6E FE      [19] 4794 	ld	l,-2 (ix)
   7FEB DD 66 FF      [19] 4795 	ld	h,-1 (ix)
   7FEE 36 00         [10] 4796 	ld	(hl),#0x00
                           4797 ;src/main.c:902: actual->muertes++;
   7FF0 DD 6E F6      [19] 4798 	ld	l,-10 (ix)
   7FF3 DD 66 F7      [19] 4799 	ld	h,-9 (ix)
   7FF6 46            [ 7] 4800 	ld	b,(hl)
   7FF7 04            [ 4] 4801 	inc	b
   7FF8 DD 6E F6      [19] 4802 	ld	l,-10 (ix)
   7FFB DD 66 F7      [19] 4803 	ld	h,-9 (ix)
   7FFE 70            [ 7] 4804 	ld	(hl),b
                           4805 ;src/main.c:903: actual->x = 0;
   7FFF AF            [ 4] 4806 	xor	a, a
   8000 12            [ 7] 4807 	ld	(de),a
                           4808 ;src/main.c:904: actual->y = 0;
   8001 DD 6E FA      [19] 4809 	ld	l,-6 (ix)
   8004 DD 66 FB      [19] 4810 	ld	h,-5 (ix)
   8007 36 00         [10] 4811 	ld	(hl),#0x00
   8009                    4812 00134$:
                           4813 ;src/main.c:906: if(parpadeo && actual->muerto && !actual->xplot){
   8009 21 19 00      [10] 4814 	ld	hl,#0x0019
   800C 19            [11] 4815 	add	hl,de
   800D DD 75 FA      [19] 4816 	ld	-6 (ix),l
   8010 DD 74 FB      [19] 4817 	ld	-5 (ix),h
   8013 3A 2D 63      [13] 4818 	ld	a,(#_parpadeo + 0)
   8016 B7            [ 4] 4819 	or	a, a
   8017 28 1F         [12] 4820 	jr	Z,00144$
   8019 DD 6E F8      [19] 4821 	ld	l,-8 (ix)
   801C DD 66 F9      [19] 4822 	ld	h,-7 (ix)
   801F 7E            [ 7] 4823 	ld	a,(hl)
   8020 B7            [ 4] 4824 	or	a, a
   8021 28 15         [12] 4825 	jr	Z,00144$
   8023 DD 6E FA      [19] 4826 	ld	l,-6 (ix)
   8026 DD 66 FB      [19] 4827 	ld	h,-5 (ix)
   8029 7E            [ 7] 4828 	ld	a,(hl)
   802A B7            [ 4] 4829 	or	a, a
   802B 20 0B         [12] 4830 	jr	NZ,00144$
                           4831 ;src/main.c:907: dibujarExplosion(actual);
   802D C5            [11] 4832 	push	bc
   802E D5            [11] 4833 	push	de
   802F D5            [11] 4834 	push	de
   8030 CD 0B 67      [17] 4835 	call	_dibujarExplosion
   8033 F1            [10] 4836 	pop	af
   8034 D1            [10] 4837 	pop	de
   8035 C1            [10] 4838 	pop	bc
   8036 18 4E         [12] 4839 	jr	00145$
   8038                    4840 00144$:
                           4841 ;src/main.c:908: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   8038 3A 2D 63      [13] 4842 	ld	a,(#_parpadeo + 0)
   803B B7            [ 4] 4843 	or	a, a
   803C 20 48         [12] 4844 	jr	NZ,00145$
   803E DD 6E F8      [19] 4845 	ld	l,-8 (ix)
   8041 DD 66 F9      [19] 4846 	ld	h,-7 (ix)
   8044 7E            [ 7] 4847 	ld	a,(hl)
   8045 B7            [ 4] 4848 	or	a, a
   8046 28 3E         [12] 4849 	jr	Z,00145$
   8048 3E 0C         [ 7] 4850 	ld	a,#0x0C
   804A FD 21 2E 63   [14] 4851 	ld	iy,#_cambio
   804E FD 96 00      [19] 4852 	sub	a, 0 (iy)
   8051 38 33         [12] 4853 	jr	C,00145$
   8053 DD 6E FA      [19] 4854 	ld	l,-6 (ix)
   8056 DD 66 FB      [19] 4855 	ld	h,-5 (ix)
   8059 7E            [ 7] 4856 	ld	a,(hl)
   805A B7            [ 4] 4857 	or	a, a
   805B 20 29         [12] 4858 	jr	NZ,00145$
                           4859 ;src/main.c:909: borrarExplosion((*actual).px, (*actual).py);
   805D DD 6E FC      [19] 4860 	ld	l,-4 (ix)
   8060 DD 66 FD      [19] 4861 	ld	h,-3 (ix)
   8063 7E            [ 7] 4862 	ld	a,(hl)
   8064 DD 6E F4      [19] 4863 	ld	l,-12 (ix)
   8067 DD 66 F5      [19] 4864 	ld	h,-11 (ix)
   806A 46            [ 7] 4865 	ld	b,(hl)
   806B C5            [11] 4866 	push	bc
   806C D5            [11] 4867 	push	de
   806D F5            [11] 4868 	push	af
   806E 33            [ 6] 4869 	inc	sp
   806F C5            [11] 4870 	push	bc
   8070 33            [ 6] 4871 	inc	sp
   8071 CD 44 67      [17] 4872 	call	_borrarExplosion
   8074 F1            [10] 4873 	pop	af
   8075 D1            [10] 4874 	pop	de
   8076 C1            [10] 4875 	pop	bc
                           4876 ;src/main.c:910: if(cambio == 12){
   8077 3A 2E 63      [13] 4877 	ld	a,(#_cambio + 0)
   807A D6 0C         [ 7] 4878 	sub	a, #0x0C
   807C 20 08         [12] 4879 	jr	NZ,00145$
                           4880 ;src/main.c:911: actual->xplot = SI;
   807E DD 6E FA      [19] 4881 	ld	l,-6 (ix)
   8081 DD 66 FB      [19] 4882 	ld	h,-5 (ix)
   8084 36 01         [10] 4883 	ld	(hl),#0x01
   8086                    4884 00145$:
                           4885 ;src/main.c:914: ++actual;
   8086 21 E3 00      [10] 4886 	ld	hl,#0x00E3
   8089 19            [11] 4887 	add	hl,de
   808A EB            [ 4] 4888 	ex	de,hl
   808B C3 10 7F      [10] 4889 	jp	00148$
   808E                    4890 00150$:
                           4891 ;src/main.c:916: cpct_waitVSYNC();
   808E CD C4 55      [17] 4892 	call	_cpct_waitVSYNC
   8091 C3 58 7D      [10] 4893 	jp	00152$
                           4894 	.area _CODE
                           4895 	.area _INITIALIZER
                           4896 	.area _CABS (ABS)
