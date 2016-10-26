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
                             30 	.globl _checkEnemyDead
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
                             50 	.globl _aumentarPuntuacion
                             51 	.globl _modificarPuntuacion
                             52 	.globl _barraPuntuacionInicial
                             53 	.globl _menuInicio
                             54 	.globl _menuFin
                             55 	.globl _cpct_etm_setTileset2x4
                             56 	.globl _cpct_etm_drawTileBox2x4
                             57 	.globl _cpct_getScreenPtr
                             58 	.globl _cpct_setPALColour
                             59 	.globl _cpct_setPalette
                             60 	.globl _cpct_waitVSYNC
                             61 	.globl _cpct_setVideoMode
                             62 	.globl _cpct_drawSpriteMaskedAlignedTable
                             63 	.globl _cpct_isAnyKeyPressed
                             64 	.globl _cpct_isKeyPressed
                             65 	.globl _cpct_scanKeyboard_if
                             66 	.globl _cpct_disableFirmware
                             67 	.globl _puntuacion
                             68 	.globl _num_mapa
                             69 	.globl _mapa
                             70 	.globl _i
                             71 	.globl _vidas
                             72 	.globl _timer
                             73 	.globl _cambio
                             74 	.globl _parpadeo
                             75 	.globl _cu
                             76 	.globl _prota
                             77 	.globl _enemy
                             78 	.globl _patrolY
                             79 	.globl _patrolX
                             80 	.globl _spawnY
                             81 	.globl _spawnX
                             82 	.globl _mapas
                             83 ;--------------------------------------------------------
                             84 ; special function registers
                             85 ;--------------------------------------------------------
                             86 ;--------------------------------------------------------
                             87 ; ram data
                             88 ;--------------------------------------------------------
                             89 	.area _DATA
   60AD                      90 _enemy::
   60AD                      91 	.ds 908
   6439                      92 _prota::
   6439                      93 	.ds 8
   6441                      94 _cu::
   6441                      95 	.ds 11
   644C                      96 _parpadeo::
   644C                      97 	.ds 1
   644D                      98 _cambio::
   644D                      99 	.ds 1
   644E                     100 _timer::
   644E                     101 	.ds 2
   6450                     102 _vidas::
   6450                     103 	.ds 1
   6451                     104 _i::
   6451                     105 	.ds 1
                            106 ;--------------------------------------------------------
                            107 ; ram data
                            108 ;--------------------------------------------------------
                            109 	.area _INITIALIZED
   651B                     110 _mapa::
   651B                     111 	.ds 2
   651D                     112 _num_mapa::
   651D                     113 	.ds 1
   651E                     114 _puntuacion::
   651E                     115 	.ds 1
                            116 ;--------------------------------------------------------
                            117 ; absolute external ram data
                            118 ;--------------------------------------------------------
                            119 	.area _DABS (ABS)
                            120 ;--------------------------------------------------------
                            121 ; global & static initialisations
                            122 ;--------------------------------------------------------
                            123 	.area _HOME
                            124 	.area _GSINIT
                            125 	.area _GSFINAL
                            126 	.area _GSINIT
                            127 ;--------------------------------------------------------
                            128 ; Home
                            129 ;--------------------------------------------------------
                            130 	.area _HOME
                            131 	.area _HOME
                            132 ;--------------------------------------------------------
                            133 ; code
                            134 ;--------------------------------------------------------
                            135 	.area _CODE
                            136 ;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            137 ;	---------------------------------
                            138 ; Function dummy_cpct_transparentMaskTable0M0_container
                            139 ; ---------------------------------
   444C                     140 _dummy_cpct_transparentMaskTable0M0_container::
                            141 	.area _g_tablatrans_ (ABS) 
   0100                     142 	.org 0x0100 
   0100                     143 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   144 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   146 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   148 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   152 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   154 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   160 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   161 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   164 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   165 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   172 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   173 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   174 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   175 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            176 	.area _CSEG (REL, CON) 
                            177 ;src/main.c:114: void dibujarMapa() {
                            178 ;	---------------------------------
                            179 ; Function dibujarMapa
                            180 ; ---------------------------------
   6523                     181 _dibujarMapa::
                            182 ;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6523 2A 1B 65      [16]  183 	ld	hl,(_mapa)
   6526 E5            [11]  184 	push	hl
   6527 21 F0 C0      [10]  185 	ld	hl,#0xC0F0
   652A E5            [11]  186 	push	hl
   652B 21 2C 28      [10]  187 	ld	hl,#0x282C
   652E E5            [11]  188 	push	hl
   652F 2E 00         [ 7]  189 	ld	l, #0x00
   6531 E5            [11]  190 	push	hl
   6532 AF            [ 4]  191 	xor	a, a
   6533 F5            [11]  192 	push	af
   6534 33            [ 6]  193 	inc	sp
   6535 CD 34 55      [17]  194 	call	_cpct_etm_drawTileBox2x4
   6538 C9            [10]  195 	ret
   6539                     196 _mapas:
   6539 C0 10               197 	.dw _g_map1
   653B E0 09               198 	.dw _g_map2
   653D 00 03               199 	.dw _g_map3
   653F                     200 _spawnX:
   653F 24                  201 	.db #0x24	; 36
   6540 47                  202 	.db #0x47	; 71	'G'
   6541 30                  203 	.db #0x30	; 48	'0'
   6542 18                  204 	.db #0x18	; 24
   6543                     205 _spawnY:
   6543 2C                  206 	.db #0x2C	; 44
   6544 66                  207 	.db #0x66	; 102	'f'
   6545 9A                  208 	.db #0x9A	; 154
   6546 40                  209 	.db #0x40	; 64
   6547                     210 _patrolX:
   6547 00                  211 	.db #0x00	; 0
   6548 00                  212 	.db #0x00	; 0
   6549 00                  213 	.db #0x00	; 0
   654A 00                  214 	.db #0x00	; 0
   654B 00                  215 	.db #0x00	; 0
   654C 42                  216 	.db #0x42	; 66	'B'
   654D 33                  217 	.db #0x33	; 51	'3'
   654E 00                  218 	.db #0x00	; 0
   654F 00                  219 	.db #0x00	; 0
   6550 00                  220 	.db 0x00
   6551 34                  221 	.db #0x34	; 52	'4'
   6552 33                  222 	.db #0x33	; 51	'3'
   6553 14                  223 	.db #0x14	; 20
   6554 00                  224 	.db #0x00	; 0
   6555 00                  225 	.db 0x00
   6556 38                  226 	.db #0x38	; 56	'8'
   6557 3C                  227 	.db #0x3C	; 60
   6558 23                  228 	.db #0x23	; 35
   6559 18                  229 	.db #0x18	; 24
   655A 00                  230 	.db 0x00
   655B                     231 _patrolY:
   655B 00                  232 	.db #0x00	; 0
   655C 00                  233 	.db #0x00	; 0
   655D 00                  234 	.db #0x00	; 0
   655E 00                  235 	.db #0x00	; 0
   655F 00                  236 	.db 0x00
   6560 5E                  237 	.db #0x5E	; 94
   6561 A6                  238 	.db #0xA6	; 166
   6562 00                  239 	.db #0x00	; 0
   6563 00                  240 	.db #0x00	; 0
   6564 00                  241 	.db 0x00
   6565 A0                  242 	.db #0xA0	; 160
   6566 66                  243 	.db #0x66	; 102	'f'
   6567 2C                  244 	.db #0x2C	; 44
   6568 00                  245 	.db #0x00	; 0
   6569 00                  246 	.db 0x00
   656A AE                  247 	.db #0xAE	; 174
   656B 66                  248 	.db #0x66	; 102	'f'
   656C 22                  249 	.db #0x22	; 34
   656D 86                  250 	.db #0x86	; 134
   656E 00                  251 	.db 0x00
                            252 ;src/main.c:120: void dibujarProta() {
                            253 ;	---------------------------------
                            254 ; Function dibujarProta
                            255 ; ---------------------------------
   656F                     256 _dibujarProta::
                            257 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   656F 21 3A 64      [10]  258 	ld	hl, #_prota + 1
   6572 56            [ 7]  259 	ld	d,(hl)
   6573 21 39 64      [10]  260 	ld	hl, #_prota + 0
   6576 46            [ 7]  261 	ld	b,(hl)
   6577 D5            [11]  262 	push	de
   6578 33            [ 6]  263 	inc	sp
   6579 C5            [11]  264 	push	bc
   657A 33            [ 6]  265 	inc	sp
   657B 21 00 C0      [10]  266 	ld	hl,#0xC000
   657E E5            [11]  267 	push	hl
   657F CD 52 60      [17]  268 	call	_cpct_getScreenPtr
   6582 EB            [ 4]  269 	ex	de,hl
                            270 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6583 ED 4B 3D 64   [20]  271 	ld	bc, (#_prota + 4)
   6587 21 00 01      [10]  272 	ld	hl,#_g_tablatrans
   658A E5            [11]  273 	push	hl
   658B 21 07 16      [10]  274 	ld	hl,#0x1607
   658E E5            [11]  275 	push	hl
   658F D5            [11]  276 	push	de
   6590 C5            [11]  277 	push	bc
   6591 CD 72 60      [17]  278 	call	_cpct_drawSpriteMaskedAlignedTable
   6594 C9            [10]  279 	ret
                            280 ;src/main.c:125: void borrarProta() {
                            281 ;	---------------------------------
                            282 ; Function borrarProta
                            283 ; ---------------------------------
   6595                     284 _borrarProta::
   6595 DD E5         [15]  285 	push	ix
   6597 DD 21 00 00   [14]  286 	ld	ix,#0
   659B DD 39         [15]  287 	add	ix,sp
   659D F5            [11]  288 	push	af
   659E 3B            [ 6]  289 	dec	sp
                            290 ;src/main.c:129: u8 w = 4 + (prota.px & 1);
   659F 21 3B 64      [10]  291 	ld	hl, #_prota + 2
   65A2 4E            [ 7]  292 	ld	c,(hl)
   65A3 79            [ 4]  293 	ld	a,c
   65A4 E6 01         [ 7]  294 	and	a, #0x01
   65A6 47            [ 4]  295 	ld	b,a
   65A7 04            [ 4]  296 	inc	b
   65A8 04            [ 4]  297 	inc	b
   65A9 04            [ 4]  298 	inc	b
   65AA 04            [ 4]  299 	inc	b
                            300 ;src/main.c:132: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   65AB 21 3C 64      [10]  301 	ld	hl, #_prota + 3
   65AE 5E            [ 7]  302 	ld	e,(hl)
   65AF CB 4B         [ 8]  303 	bit	1, e
   65B1 28 04         [12]  304 	jr	Z,00103$
   65B3 3E 01         [ 7]  305 	ld	a,#0x01
   65B5 18 02         [12]  306 	jr	00104$
   65B7                     307 00103$:
   65B7 3E 00         [ 7]  308 	ld	a,#0x00
   65B9                     309 00104$:
   65B9 C6 06         [ 7]  310 	add	a, #0x06
   65BB DD 77 FD      [19]  311 	ld	-3 (ix),a
                            312 ;src/main.c:134: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   65BE FD 2A 1B 65   [20]  313 	ld	iy,(_mapa)
   65C2 16 00         [ 7]  314 	ld	d,#0x00
   65C4 7B            [ 4]  315 	ld	a,e
   65C5 C6 E8         [ 7]  316 	add	a,#0xE8
   65C7 DD 77 FE      [19]  317 	ld	-2 (ix),a
   65CA 7A            [ 4]  318 	ld	a,d
   65CB CE FF         [ 7]  319 	adc	a,#0xFF
   65CD DD 77 FF      [19]  320 	ld	-1 (ix),a
   65D0 DD 6E FE      [19]  321 	ld	l,-2 (ix)
   65D3 DD 66 FF      [19]  322 	ld	h,-1 (ix)
   65D6 DD CB FF 7E   [20]  323 	bit	7, -1 (ix)
   65DA 28 04         [12]  324 	jr	Z,00105$
   65DC 21 EB FF      [10]  325 	ld	hl,#0xFFEB
   65DF 19            [11]  326 	add	hl,de
   65E0                     327 00105$:
   65E0 CB 2C         [ 8]  328 	sra	h
   65E2 CB 1D         [ 8]  329 	rr	l
   65E4 CB 2C         [ 8]  330 	sra	h
   65E6 CB 1D         [ 8]  331 	rr	l
   65E8 55            [ 4]  332 	ld	d,l
   65E9 CB 39         [ 8]  333 	srl	c
   65EB FD E5         [15]  334 	push	iy
   65ED 21 F0 C0      [10]  335 	ld	hl,#0xC0F0
   65F0 E5            [11]  336 	push	hl
   65F1 3E 28         [ 7]  337 	ld	a,#0x28
   65F3 F5            [11]  338 	push	af
   65F4 33            [ 6]  339 	inc	sp
   65F5 DD 7E FD      [19]  340 	ld	a,-3 (ix)
   65F8 F5            [11]  341 	push	af
   65F9 33            [ 6]  342 	inc	sp
   65FA C5            [11]  343 	push	bc
   65FB 33            [ 6]  344 	inc	sp
   65FC D5            [11]  345 	push	de
   65FD 33            [ 6]  346 	inc	sp
   65FE 79            [ 4]  347 	ld	a,c
   65FF F5            [11]  348 	push	af
   6600 33            [ 6]  349 	inc	sp
   6601 CD 34 55      [17]  350 	call	_cpct_etm_drawTileBox2x4
   6604 DD F9         [10]  351 	ld	sp, ix
   6606 DD E1         [14]  352 	pop	ix
   6608 C9            [10]  353 	ret
                            354 ;src/main.c:137: void redibujarProta() {
                            355 ;	---------------------------------
                            356 ; Function redibujarProta
                            357 ; ---------------------------------
   6609                     358 _redibujarProta::
                            359 ;src/main.c:138: borrarProta();
   6609 CD 95 65      [17]  360 	call	_borrarProta
                            361 ;src/main.c:139: prota.px = prota.x;
   660C 01 3B 64      [10]  362 	ld	bc,#_prota + 2
   660F 3A 39 64      [13]  363 	ld	a, (#_prota + 0)
   6612 02            [ 7]  364 	ld	(bc),a
                            365 ;src/main.c:140: prota.py = prota.y;
   6613 01 3C 64      [10]  366 	ld	bc,#_prota + 3
   6616 3A 3A 64      [13]  367 	ld	a, (#_prota + 1)
   6619 02            [ 7]  368 	ld	(bc),a
                            369 ;src/main.c:141: dibujarProta();
   661A C3 6F 65      [10]  370 	jp  _dibujarProta
                            371 ;src/main.c:144: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            372 ;	---------------------------------
                            373 ; Function comprobarTeclado
                            374 ; ---------------------------------
   661D                     375 _comprobarTeclado::
                            376 ;src/main.c:145: cpct_scanKeyboard_if();
   661D CD 8C 56      [17]  377 	call	_cpct_scanKeyboard_if
                            378 ;src/main.c:147: if (cpct_isAnyKeyPressed()) {
   6620 CD 7F 56      [17]  379 	call	_cpct_isAnyKeyPressed
   6623 7D            [ 4]  380 	ld	a,l
   6624 B7            [ 4]  381 	or	a, a
   6625 C8            [11]  382 	ret	Z
                            383 ;src/main.c:148: if (cpct_isKeyPressed(Key_CursorLeft)){
   6626 21 01 01      [10]  384 	ld	hl,#0x0101
   6629 CD 53 54      [17]  385 	call	_cpct_isKeyPressed
   662C 7D            [ 4]  386 	ld	a,l
   662D B7            [ 4]  387 	or	a, a
                            388 ;src/main.c:149: moverIzquierda();
   662E C2 1E 7C      [10]  389 	jp	NZ,_moverIzquierda
                            390 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6631 21 00 02      [10]  391 	ld	hl,#0x0200
   6634 CD 53 54      [17]  392 	call	_cpct_isKeyPressed
   6637 7D            [ 4]  393 	ld	a,l
   6638 B7            [ 4]  394 	or	a, a
                            395 ;src/main.c:151: moverDerecha();
   6639 C2 43 7C      [10]  396 	jp	NZ,_moverDerecha
                            397 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorUp)){
   663C 21 00 01      [10]  398 	ld	hl,#0x0100
   663F CD 53 54      [17]  399 	call	_cpct_isKeyPressed
   6642 7D            [ 4]  400 	ld	a,l
   6643 B7            [ 4]  401 	or	a, a
                            402 ;src/main.c:153: moverArriba();
   6644 C2 88 7C      [10]  403 	jp	NZ,_moverArriba
                            404 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6647 21 00 04      [10]  405 	ld	hl,#0x0400
   664A CD 53 54      [17]  406 	call	_cpct_isKeyPressed
   664D 7D            [ 4]  407 	ld	a,l
   664E B7            [ 4]  408 	or	a, a
                            409 ;src/main.c:155: moverAbajo();
   664F C2 AC 7C      [10]  410 	jp	NZ,_moverAbajo
                            411 ;src/main.c:156: }else if (cpct_isKeyPressed(Key_Space)){
   6652 21 05 80      [10]  412 	ld	hl,#0x8005
   6655 CD 53 54      [17]  413 	call	_cpct_isKeyPressed
   6658 7D            [ 4]  414 	ld	a,l
   6659 B7            [ 4]  415 	or	a, a
   665A C8            [11]  416 	ret	Z
                            417 ;src/main.c:157: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   665B 21 08 00      [10]  418 	ld	hl, #8
   665E 39            [11]  419 	add	hl, sp
   665F 4E            [ 7]  420 	ld	c, (hl)
   6660 23            [ 6]  421 	inc	hl
   6661 46            [ 7]  422 	ld	b, (hl)
   6662 C5            [11]  423 	push	bc
   6663 21 08 00      [10]  424 	ld	hl, #8
   6666 39            [11]  425 	add	hl, sp
   6667 4E            [ 7]  426 	ld	c, (hl)
   6668 23            [ 6]  427 	inc	hl
   6669 46            [ 7]  428 	ld	b, (hl)
   666A C5            [11]  429 	push	bc
   666B 21 08 00      [10]  430 	ld	hl, #8
   666E 39            [11]  431 	add	hl, sp
   666F 4E            [ 7]  432 	ld	c, (hl)
   6670 23            [ 6]  433 	inc	hl
   6671 46            [ 7]  434 	ld	b, (hl)
   6672 C5            [11]  435 	push	bc
   6673 21 08 00      [10]  436 	ld	hl, #8
   6676 39            [11]  437 	add	hl, sp
   6677 4E            [ 7]  438 	ld	c, (hl)
   6678 23            [ 6]  439 	inc	hl
   6679 46            [ 7]  440 	ld	b, (hl)
   667A C5            [11]  441 	push	bc
   667B CD 6C 40      [17]  442 	call	_lanzarCuchillo
   667E 21 08 00      [10]  443 	ld	hl,#8
   6681 39            [11]  444 	add	hl,sp
   6682 F9            [ 6]  445 	ld	sp,hl
   6683 C9            [10]  446 	ret
                            447 ;src/main.c:162: u8 checkCollision(u8 direction) { // check optimization
                            448 ;	---------------------------------
                            449 ; Function checkCollision
                            450 ; ---------------------------------
   6684                     451 _checkCollision::
   6684 DD E5         [15]  452 	push	ix
   6686 DD 21 00 00   [14]  453 	ld	ix,#0
   668A DD 39         [15]  454 	add	ix,sp
   668C F5            [11]  455 	push	af
                            456 ;src/main.c:163: u8 *headTile=0, *feetTile=0, *waistTile=0;
   668D 21 00 00      [10]  457 	ld	hl,#0x0000
   6690 E3            [19]  458 	ex	(sp), hl
   6691 11 00 00      [10]  459 	ld	de,#0x0000
   6694 01 00 00      [10]  460 	ld	bc,#0x0000
                            461 ;src/main.c:165: switch (direction) {
   6697 3E 03         [ 7]  462 	ld	a,#0x03
   6699 DD 96 04      [19]  463 	sub	a, 4 (ix)
   669C DA D4 67      [10]  464 	jp	C,00105$
   669F DD 5E 04      [19]  465 	ld	e,4 (ix)
   66A2 16 00         [ 7]  466 	ld	d,#0x00
   66A4 21 AB 66      [10]  467 	ld	hl,#00124$
   66A7 19            [11]  468 	add	hl,de
   66A8 19            [11]  469 	add	hl,de
   66A9 19            [11]  470 	add	hl,de
   66AA E9            [ 4]  471 	jp	(hl)
   66AB                     472 00124$:
   66AB C3 B7 66      [10]  473 	jp	00101$
   66AE C3 0C 67      [10]  474 	jp	00102$
   66B1 C3 5C 67      [10]  475 	jp	00103$
   66B4 C3 99 67      [10]  476 	jp	00104$
                            477 ;src/main.c:166: case 0:
   66B7                     478 00101$:
                            479 ;src/main.c:167: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   66B7 21 3A 64      [10]  480 	ld	hl, #(_prota + 0x0001) + 0
   66BA 4E            [ 7]  481 	ld	c,(hl)
   66BB 3A 39 64      [13]  482 	ld	a, (#_prota + 0)
   66BE C6 07         [ 7]  483 	add	a, #0x07
   66C0 47            [ 4]  484 	ld	b,a
   66C1 79            [ 4]  485 	ld	a,c
   66C2 F5            [11]  486 	push	af
   66C3 33            [ 6]  487 	inc	sp
   66C4 C5            [11]  488 	push	bc
   66C5 33            [ 6]  489 	inc	sp
   66C6 2A 1B 65      [16]  490 	ld	hl,(_mapa)
   66C9 E5            [11]  491 	push	hl
   66CA CD 71 4B      [17]  492 	call	_getTilePtr
   66CD F1            [10]  493 	pop	af
   66CE F1            [10]  494 	pop	af
   66CF 33            [ 6]  495 	inc	sp
   66D0 33            [ 6]  496 	inc	sp
   66D1 E5            [11]  497 	push	hl
                            498 ;src/main.c:168: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   66D2 3A 3A 64      [13]  499 	ld	a, (#(_prota + 0x0001) + 0)
   66D5 C6 14         [ 7]  500 	add	a, #0x14
   66D7 4F            [ 4]  501 	ld	c,a
   66D8 3A 39 64      [13]  502 	ld	a, (#_prota + 0)
   66DB C6 07         [ 7]  503 	add	a, #0x07
   66DD 47            [ 4]  504 	ld	b,a
   66DE 79            [ 4]  505 	ld	a,c
   66DF F5            [11]  506 	push	af
   66E0 33            [ 6]  507 	inc	sp
   66E1 C5            [11]  508 	push	bc
   66E2 33            [ 6]  509 	inc	sp
   66E3 2A 1B 65      [16]  510 	ld	hl,(_mapa)
   66E6 E5            [11]  511 	push	hl
   66E7 CD 71 4B      [17]  512 	call	_getTilePtr
   66EA F1            [10]  513 	pop	af
   66EB F1            [10]  514 	pop	af
   66EC EB            [ 4]  515 	ex	de,hl
                            516 ;src/main.c:169: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   66ED 3A 3A 64      [13]  517 	ld	a, (#(_prota + 0x0001) + 0)
   66F0 C6 0B         [ 7]  518 	add	a, #0x0B
   66F2 47            [ 4]  519 	ld	b,a
   66F3 3A 39 64      [13]  520 	ld	a, (#_prota + 0)
   66F6 C6 07         [ 7]  521 	add	a, #0x07
   66F8 D5            [11]  522 	push	de
   66F9 C5            [11]  523 	push	bc
   66FA 33            [ 6]  524 	inc	sp
   66FB F5            [11]  525 	push	af
   66FC 33            [ 6]  526 	inc	sp
   66FD 2A 1B 65      [16]  527 	ld	hl,(_mapa)
   6700 E5            [11]  528 	push	hl
   6701 CD 71 4B      [17]  529 	call	_getTilePtr
   6704 F1            [10]  530 	pop	af
   6705 F1            [10]  531 	pop	af
   6706 4D            [ 4]  532 	ld	c,l
   6707 44            [ 4]  533 	ld	b,h
   6708 D1            [10]  534 	pop	de
                            535 ;src/main.c:170: break;
   6709 C3 D4 67      [10]  536 	jp	00105$
                            537 ;src/main.c:171: case 1:
   670C                     538 00102$:
                            539 ;src/main.c:172: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   670C 21 3A 64      [10]  540 	ld	hl, #(_prota + 0x0001) + 0
   670F 56            [ 7]  541 	ld	d,(hl)
   6710 21 39 64      [10]  542 	ld	hl, #_prota + 0
   6713 46            [ 7]  543 	ld	b,(hl)
   6714 05            [ 4]  544 	dec	b
   6715 D5            [11]  545 	push	de
   6716 33            [ 6]  546 	inc	sp
   6717 C5            [11]  547 	push	bc
   6718 33            [ 6]  548 	inc	sp
   6719 2A 1B 65      [16]  549 	ld	hl,(_mapa)
   671C E5            [11]  550 	push	hl
   671D CD 71 4B      [17]  551 	call	_getTilePtr
   6720 F1            [10]  552 	pop	af
   6721 F1            [10]  553 	pop	af
   6722 33            [ 6]  554 	inc	sp
   6723 33            [ 6]  555 	inc	sp
   6724 E5            [11]  556 	push	hl
                            557 ;src/main.c:173: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6725 3A 3A 64      [13]  558 	ld	a, (#(_prota + 0x0001) + 0)
   6728 C6 14         [ 7]  559 	add	a, #0x14
   672A 57            [ 4]  560 	ld	d,a
   672B 21 39 64      [10]  561 	ld	hl, #_prota + 0
   672E 46            [ 7]  562 	ld	b,(hl)
   672F 05            [ 4]  563 	dec	b
   6730 D5            [11]  564 	push	de
   6731 33            [ 6]  565 	inc	sp
   6732 C5            [11]  566 	push	bc
   6733 33            [ 6]  567 	inc	sp
   6734 2A 1B 65      [16]  568 	ld	hl,(_mapa)
   6737 E5            [11]  569 	push	hl
   6738 CD 71 4B      [17]  570 	call	_getTilePtr
   673B F1            [10]  571 	pop	af
   673C F1            [10]  572 	pop	af
   673D EB            [ 4]  573 	ex	de,hl
                            574 ;src/main.c:174: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   673E 3A 3A 64      [13]  575 	ld	a, (#(_prota + 0x0001) + 0)
   6741 C6 0B         [ 7]  576 	add	a, #0x0B
   6743 47            [ 4]  577 	ld	b,a
   6744 3A 39 64      [13]  578 	ld	a, (#_prota + 0)
   6747 C6 FF         [ 7]  579 	add	a,#0xFF
   6749 D5            [11]  580 	push	de
   674A C5            [11]  581 	push	bc
   674B 33            [ 6]  582 	inc	sp
   674C F5            [11]  583 	push	af
   674D 33            [ 6]  584 	inc	sp
   674E 2A 1B 65      [16]  585 	ld	hl,(_mapa)
   6751 E5            [11]  586 	push	hl
   6752 CD 71 4B      [17]  587 	call	_getTilePtr
   6755 F1            [10]  588 	pop	af
   6756 F1            [10]  589 	pop	af
   6757 4D            [ 4]  590 	ld	c,l
   6758 44            [ 4]  591 	ld	b,h
   6759 D1            [10]  592 	pop	de
                            593 ;src/main.c:175: break;
   675A 18 78         [12]  594 	jr	00105$
                            595 ;src/main.c:176: case 2:
   675C                     596 00103$:
                            597 ;src/main.c:177: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   675C 3A 3A 64      [13]  598 	ld	a, (#(_prota + 0x0001) + 0)
   675F C6 FE         [ 7]  599 	add	a,#0xFE
   6761 21 39 64      [10]  600 	ld	hl, #_prota + 0
   6764 56            [ 7]  601 	ld	d,(hl)
   6765 C5            [11]  602 	push	bc
   6766 F5            [11]  603 	push	af
   6767 33            [ 6]  604 	inc	sp
   6768 D5            [11]  605 	push	de
   6769 33            [ 6]  606 	inc	sp
   676A 2A 1B 65      [16]  607 	ld	hl,(_mapa)
   676D E5            [11]  608 	push	hl
   676E CD 71 4B      [17]  609 	call	_getTilePtr
   6771 F1            [10]  610 	pop	af
   6772 F1            [10]  611 	pop	af
   6773 C1            [10]  612 	pop	bc
   6774 33            [ 6]  613 	inc	sp
   6775 33            [ 6]  614 	inc	sp
   6776 E5            [11]  615 	push	hl
                            616 ;src/main.c:178: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6777 21 3A 64      [10]  617 	ld	hl, #(_prota + 0x0001) + 0
   677A 56            [ 7]  618 	ld	d,(hl)
   677B 15            [ 4]  619 	dec	d
   677C 15            [ 4]  620 	dec	d
   677D 3A 39 64      [13]  621 	ld	a, (#_prota + 0)
   6780 C6 03         [ 7]  622 	add	a, #0x03
   6782 C5            [11]  623 	push	bc
   6783 D5            [11]  624 	push	de
   6784 33            [ 6]  625 	inc	sp
   6785 F5            [11]  626 	push	af
   6786 33            [ 6]  627 	inc	sp
   6787 2A 1B 65      [16]  628 	ld	hl,(_mapa)
   678A E5            [11]  629 	push	hl
   678B CD 71 4B      [17]  630 	call	_getTilePtr
   678E F1            [10]  631 	pop	af
   678F F1            [10]  632 	pop	af
   6790 EB            [ 4]  633 	ex	de,hl
   6791 C1            [10]  634 	pop	bc
                            635 ;src/main.c:179: *waistTile = 0;
   6792 21 00 00      [10]  636 	ld	hl,#0x0000
   6795 36 00         [10]  637 	ld	(hl),#0x00
                            638 ;src/main.c:180: break;
   6797 18 3B         [12]  639 	jr	00105$
                            640 ;src/main.c:181: case 3:
   6799                     641 00104$:
                            642 ;src/main.c:182: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6799 3A 3A 64      [13]  643 	ld	a, (#(_prota + 0x0001) + 0)
   679C C6 16         [ 7]  644 	add	a, #0x16
   679E 21 39 64      [10]  645 	ld	hl, #_prota + 0
   67A1 56            [ 7]  646 	ld	d,(hl)
   67A2 C5            [11]  647 	push	bc
   67A3 F5            [11]  648 	push	af
   67A4 33            [ 6]  649 	inc	sp
   67A5 D5            [11]  650 	push	de
   67A6 33            [ 6]  651 	inc	sp
   67A7 2A 1B 65      [16]  652 	ld	hl,(_mapa)
   67AA E5            [11]  653 	push	hl
   67AB CD 71 4B      [17]  654 	call	_getTilePtr
   67AE F1            [10]  655 	pop	af
   67AF F1            [10]  656 	pop	af
   67B0 C1            [10]  657 	pop	bc
   67B1 33            [ 6]  658 	inc	sp
   67B2 33            [ 6]  659 	inc	sp
   67B3 E5            [11]  660 	push	hl
                            661 ;src/main.c:183: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   67B4 3A 3A 64      [13]  662 	ld	a, (#(_prota + 0x0001) + 0)
   67B7 C6 16         [ 7]  663 	add	a, #0x16
   67B9 57            [ 4]  664 	ld	d,a
   67BA 3A 39 64      [13]  665 	ld	a, (#_prota + 0)
   67BD C6 03         [ 7]  666 	add	a, #0x03
   67BF C5            [11]  667 	push	bc
   67C0 D5            [11]  668 	push	de
   67C1 33            [ 6]  669 	inc	sp
   67C2 F5            [11]  670 	push	af
   67C3 33            [ 6]  671 	inc	sp
   67C4 2A 1B 65      [16]  672 	ld	hl,(_mapa)
   67C7 E5            [11]  673 	push	hl
   67C8 CD 71 4B      [17]  674 	call	_getTilePtr
   67CB F1            [10]  675 	pop	af
   67CC F1            [10]  676 	pop	af
   67CD EB            [ 4]  677 	ex	de,hl
   67CE C1            [10]  678 	pop	bc
                            679 ;src/main.c:184: *waistTile = 0;
   67CF 21 00 00      [10]  680 	ld	hl,#0x0000
   67D2 36 00         [10]  681 	ld	(hl),#0x00
                            682 ;src/main.c:186: }
   67D4                     683 00105$:
                            684 ;src/main.c:188: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   67D4 E1            [10]  685 	pop	hl
   67D5 E5            [11]  686 	push	hl
   67D6 6E            [ 7]  687 	ld	l,(hl)
   67D7 3E 02         [ 7]  688 	ld	a,#0x02
   67D9 95            [ 4]  689 	sub	a, l
   67DA 38 0E         [12]  690 	jr	C,00106$
   67DC 1A            [ 7]  691 	ld	a,(de)
   67DD 5F            [ 4]  692 	ld	e,a
   67DE 3E 02         [ 7]  693 	ld	a,#0x02
   67E0 93            [ 4]  694 	sub	a, e
   67E1 38 07         [12]  695 	jr	C,00106$
   67E3 0A            [ 7]  696 	ld	a,(bc)
   67E4 4F            [ 4]  697 	ld	c,a
   67E5 3E 02         [ 7]  698 	ld	a,#0x02
   67E7 91            [ 4]  699 	sub	a, c
   67E8 30 04         [12]  700 	jr	NC,00107$
   67EA                     701 00106$:
                            702 ;src/main.c:189: return 1;
   67EA 2E 01         [ 7]  703 	ld	l,#0x01
   67EC 18 02         [12]  704 	jr	00110$
   67EE                     705 00107$:
                            706 ;src/main.c:191: return 0;
   67EE 2E 00         [ 7]  707 	ld	l,#0x00
   67F0                     708 00110$:
   67F0 DD F9         [10]  709 	ld	sp, ix
   67F2 DD E1         [14]  710 	pop	ix
   67F4 C9            [10]  711 	ret
                            712 ;src/main.c:194: void dibujarEnemigo(TEnemy *enemy) {
                            713 ;	---------------------------------
                            714 ; Function dibujarEnemigo
                            715 ; ---------------------------------
   67F5                     716 _dibujarEnemigo::
   67F5 DD E5         [15]  717 	push	ix
   67F7 DD 21 00 00   [14]  718 	ld	ix,#0
   67FB DD 39         [15]  719 	add	ix,sp
                            720 ;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   67FD DD 4E 04      [19]  721 	ld	c,4 (ix)
   6800 DD 46 05      [19]  722 	ld	b,5 (ix)
   6803 69            [ 4]  723 	ld	l, c
   6804 60            [ 4]  724 	ld	h, b
   6805 23            [ 6]  725 	inc	hl
   6806 56            [ 7]  726 	ld	d,(hl)
   6807 0A            [ 7]  727 	ld	a,(bc)
   6808 C5            [11]  728 	push	bc
   6809 D5            [11]  729 	push	de
   680A 33            [ 6]  730 	inc	sp
   680B F5            [11]  731 	push	af
   680C 33            [ 6]  732 	inc	sp
   680D 21 00 C0      [10]  733 	ld	hl,#0xC000
   6810 E5            [11]  734 	push	hl
   6811 CD 52 60      [17]  735 	call	_cpct_getScreenPtr
   6814 EB            [ 4]  736 	ex	de,hl
                            737 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6815 E1            [10]  738 	pop	hl
   6816 01 04 00      [10]  739 	ld	bc, #0x0004
   6819 09            [11]  740 	add	hl, bc
   681A 4E            [ 7]  741 	ld	c,(hl)
   681B 23            [ 6]  742 	inc	hl
   681C 46            [ 7]  743 	ld	b,(hl)
   681D 21 00 01      [10]  744 	ld	hl,#_g_tablatrans
   6820 E5            [11]  745 	push	hl
   6821 21 04 16      [10]  746 	ld	hl,#0x1604
   6824 E5            [11]  747 	push	hl
   6825 D5            [11]  748 	push	de
   6826 C5            [11]  749 	push	bc
   6827 CD 72 60      [17]  750 	call	_cpct_drawSpriteMaskedAlignedTable
   682A DD E1         [14]  751 	pop	ix
   682C C9            [10]  752 	ret
                            753 ;src/main.c:199: void dibujarExplosion(TEnemy *enemy) {
                            754 ;	---------------------------------
                            755 ; Function dibujarExplosion
                            756 ; ---------------------------------
   682D                     757 _dibujarExplosion::
   682D DD E5         [15]  758 	push	ix
   682F DD 21 00 00   [14]  759 	ld	ix,#0
   6833 DD 39         [15]  760 	add	ix,sp
                            761 ;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   6835 DD 4E 04      [19]  762 	ld	c,4 (ix)
   6838 DD 46 05      [19]  763 	ld	b,5 (ix)
   683B 69            [ 4]  764 	ld	l, c
   683C 60            [ 4]  765 	ld	h, b
   683D 23            [ 6]  766 	inc	hl
   683E 23            [ 6]  767 	inc	hl
   683F 23            [ 6]  768 	inc	hl
   6840 56            [ 7]  769 	ld	d,(hl)
   6841 69            [ 4]  770 	ld	l, c
   6842 60            [ 4]  771 	ld	h, b
   6843 23            [ 6]  772 	inc	hl
   6844 23            [ 6]  773 	inc	hl
   6845 46            [ 7]  774 	ld	b,(hl)
   6846 D5            [11]  775 	push	de
   6847 33            [ 6]  776 	inc	sp
   6848 C5            [11]  777 	push	bc
   6849 33            [ 6]  778 	inc	sp
   684A 21 00 C0      [10]  779 	ld	hl,#0xC000
   684D E5            [11]  780 	push	hl
   684E CD 52 60      [17]  781 	call	_cpct_getScreenPtr
   6851 4D            [ 4]  782 	ld	c,l
   6852 44            [ 4]  783 	ld	b,h
                            784 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6853 11 00 01      [10]  785 	ld	de,#_g_tablatrans+0
   6856 D5            [11]  786 	push	de
   6857 21 04 16      [10]  787 	ld	hl,#0x1604
   685A E5            [11]  788 	push	hl
   685B C5            [11]  789 	push	bc
   685C 21 70 19      [10]  790 	ld	hl,#_g_explosion
   685F E5            [11]  791 	push	hl
   6860 CD 72 60      [17]  792 	call	_cpct_drawSpriteMaskedAlignedTable
   6863 DD E1         [14]  793 	pop	ix
   6865 C9            [10]  794 	ret
                            795 ;src/main.c:204: void borrarExplosion(u8 x, u8 y) {
                            796 ;	---------------------------------
                            797 ; Function borrarExplosion
                            798 ; ---------------------------------
   6866                     799 _borrarExplosion::
   6866 DD E5         [15]  800 	push	ix
   6868 DD 21 00 00   [14]  801 	ld	ix,#0
   686C DD 39         [15]  802 	add	ix,sp
   686E F5            [11]  803 	push	af
   686F F5            [11]  804 	push	af
                            805 ;src/main.c:207: u8 w = 4 + (x & 1);
   6870 DD 7E 04      [19]  806 	ld	a,4 (ix)
   6873 E6 01         [ 7]  807 	and	a, #0x01
   6875 4F            [ 4]  808 	ld	c,a
   6876 0C            [ 4]  809 	inc	c
   6877 0C            [ 4]  810 	inc	c
   6878 0C            [ 4]  811 	inc	c
   6879 0C            [ 4]  812 	inc	c
                            813 ;src/main.c:208: u8 h = 6 + (y & 3 ? 1 : 0);
   687A DD 7E 05      [19]  814 	ld	a,5 (ix)
   687D E6 03         [ 7]  815 	and	a, #0x03
   687F 28 04         [12]  816 	jr	Z,00103$
   6881 3E 01         [ 7]  817 	ld	a,#0x01
   6883 18 02         [12]  818 	jr	00104$
   6885                     819 00103$:
   6885 3E 00         [ 7]  820 	ld	a,#0x00
   6887                     821 00104$:
   6887 C6 06         [ 7]  822 	add	a, #0x06
   6889 47            [ 4]  823 	ld	b,a
                            824 ;src/main.c:210: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   688A 2A 1B 65      [16]  825 	ld	hl,(_mapa)
   688D E3            [19]  826 	ex	(sp), hl
   688E DD 5E 05      [19]  827 	ld	e,5 (ix)
   6891 16 00         [ 7]  828 	ld	d,#0x00
   6893 7B            [ 4]  829 	ld	a,e
   6894 C6 E8         [ 7]  830 	add	a,#0xE8
   6896 DD 77 FE      [19]  831 	ld	-2 (ix),a
   6899 7A            [ 4]  832 	ld	a,d
   689A CE FF         [ 7]  833 	adc	a,#0xFF
   689C DD 77 FF      [19]  834 	ld	-1 (ix),a
   689F DD 6E FE      [19]  835 	ld	l,-2 (ix)
   68A2 DD 66 FF      [19]  836 	ld	h,-1 (ix)
   68A5 DD CB FF 7E   [20]  837 	bit	7, -1 (ix)
   68A9 28 04         [12]  838 	jr	Z,00105$
   68AB 21 EB FF      [10]  839 	ld	hl,#0xFFEB
   68AE 19            [11]  840 	add	hl,de
   68AF                     841 00105$:
   68AF CB 2C         [ 8]  842 	sra	h
   68B1 CB 1D         [ 8]  843 	rr	l
   68B3 CB 2C         [ 8]  844 	sra	h
   68B5 CB 1D         [ 8]  845 	rr	l
   68B7 5D            [ 4]  846 	ld	e,l
   68B8 DD 56 04      [19]  847 	ld	d,4 (ix)
   68BB CB 3A         [ 8]  848 	srl	d
   68BD E1            [10]  849 	pop	hl
   68BE E5            [11]  850 	push	hl
   68BF E5            [11]  851 	push	hl
   68C0 21 F0 C0      [10]  852 	ld	hl,#0xC0F0
   68C3 E5            [11]  853 	push	hl
   68C4 3E 28         [ 7]  854 	ld	a,#0x28
   68C6 F5            [11]  855 	push	af
   68C7 33            [ 6]  856 	inc	sp
   68C8 C5            [11]  857 	push	bc
   68C9 7B            [ 4]  858 	ld	a,e
   68CA F5            [11]  859 	push	af
   68CB 33            [ 6]  860 	inc	sp
   68CC D5            [11]  861 	push	de
   68CD 33            [ 6]  862 	inc	sp
   68CE CD 34 55      [17]  863 	call	_cpct_etm_drawTileBox2x4
   68D1 DD F9         [10]  864 	ld	sp, ix
   68D3 DD E1         [14]  865 	pop	ix
   68D5 C9            [10]  866 	ret
                            867 ;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
                            868 ;	---------------------------------
                            869 ; Function borrarEnemigo
                            870 ; ---------------------------------
   68D6                     871 _borrarEnemigo::
   68D6 DD E5         [15]  872 	push	ix
   68D8 DD 21 00 00   [14]  873 	ld	ix,#0
   68DC DD 39         [15]  874 	add	ix,sp
   68DE F5            [11]  875 	push	af
   68DF F5            [11]  876 	push	af
                            877 ;src/main.c:218: u8 w = 4 + (x & 1);
   68E0 DD 7E 04      [19]  878 	ld	a,4 (ix)
   68E3 E6 01         [ 7]  879 	and	a, #0x01
   68E5 4F            [ 4]  880 	ld	c,a
   68E6 0C            [ 4]  881 	inc	c
   68E7 0C            [ 4]  882 	inc	c
   68E8 0C            [ 4]  883 	inc	c
   68E9 0C            [ 4]  884 	inc	c
                            885 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   68EA DD 7E 05      [19]  886 	ld	a,5 (ix)
   68ED E6 03         [ 7]  887 	and	a, #0x03
   68EF 28 04         [12]  888 	jr	Z,00103$
   68F1 3E 01         [ 7]  889 	ld	a,#0x01
   68F3 18 02         [12]  890 	jr	00104$
   68F5                     891 00103$:
   68F5 3E 00         [ 7]  892 	ld	a,#0x00
   68F7                     893 00104$:
   68F7 C6 06         [ 7]  894 	add	a, #0x06
   68F9 47            [ 4]  895 	ld	b,a
                            896 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68FA 2A 1B 65      [16]  897 	ld	hl,(_mapa)
   68FD E3            [19]  898 	ex	(sp), hl
   68FE DD 5E 05      [19]  899 	ld	e,5 (ix)
   6901 16 00         [ 7]  900 	ld	d,#0x00
   6903 7B            [ 4]  901 	ld	a,e
   6904 C6 E8         [ 7]  902 	add	a,#0xE8
   6906 DD 77 FE      [19]  903 	ld	-2 (ix),a
   6909 7A            [ 4]  904 	ld	a,d
   690A CE FF         [ 7]  905 	adc	a,#0xFF
   690C DD 77 FF      [19]  906 	ld	-1 (ix),a
   690F DD 6E FE      [19]  907 	ld	l,-2 (ix)
   6912 DD 66 FF      [19]  908 	ld	h,-1 (ix)
   6915 DD CB FF 7E   [20]  909 	bit	7, -1 (ix)
   6919 28 04         [12]  910 	jr	Z,00105$
   691B 21 EB FF      [10]  911 	ld	hl,#0xFFEB
   691E 19            [11]  912 	add	hl,de
   691F                     913 00105$:
   691F CB 2C         [ 8]  914 	sra	h
   6921 CB 1D         [ 8]  915 	rr	l
   6923 CB 2C         [ 8]  916 	sra	h
   6925 CB 1D         [ 8]  917 	rr	l
   6927 5D            [ 4]  918 	ld	e,l
   6928 DD 56 04      [19]  919 	ld	d,4 (ix)
   692B CB 3A         [ 8]  920 	srl	d
   692D E1            [10]  921 	pop	hl
   692E E5            [11]  922 	push	hl
   692F E5            [11]  923 	push	hl
   6930 21 F0 C0      [10]  924 	ld	hl,#0xC0F0
   6933 E5            [11]  925 	push	hl
   6934 3E 28         [ 7]  926 	ld	a,#0x28
   6936 F5            [11]  927 	push	af
   6937 33            [ 6]  928 	inc	sp
   6938 C5            [11]  929 	push	bc
   6939 7B            [ 4]  930 	ld	a,e
   693A F5            [11]  931 	push	af
   693B 33            [ 6]  932 	inc	sp
   693C D5            [11]  933 	push	de
   693D 33            [ 6]  934 	inc	sp
   693E CD 34 55      [17]  935 	call	_cpct_etm_drawTileBox2x4
   6941 DD F9         [10]  936 	ld	sp, ix
   6943 DD E1         [14]  937 	pop	ix
   6945 C9            [10]  938 	ret
                            939 ;src/main.c:225: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            940 ;	---------------------------------
                            941 ; Function redibujarEnemigo
                            942 ; ---------------------------------
   6946                     943 _redibujarEnemigo::
   6946 DD E5         [15]  944 	push	ix
   6948 DD 21 00 00   [14]  945 	ld	ix,#0
   694C DD 39         [15]  946 	add	ix,sp
                            947 ;src/main.c:226: borrarEnemigo(x, y);
   694E DD 66 05      [19]  948 	ld	h,5 (ix)
   6951 DD 6E 04      [19]  949 	ld	l,4 (ix)
   6954 E5            [11]  950 	push	hl
   6955 CD D6 68      [17]  951 	call	_borrarEnemigo
   6958 F1            [10]  952 	pop	af
                            953 ;src/main.c:227: enemy->px = enemy->x;
   6959 DD 4E 06      [19]  954 	ld	c,6 (ix)
   695C DD 46 07      [19]  955 	ld	b,7 (ix)
   695F 59            [ 4]  956 	ld	e, c
   6960 50            [ 4]  957 	ld	d, b
   6961 13            [ 6]  958 	inc	de
   6962 13            [ 6]  959 	inc	de
   6963 0A            [ 7]  960 	ld	a,(bc)
   6964 12            [ 7]  961 	ld	(de),a
                            962 ;src/main.c:228: enemy->py = enemy->y;
   6965 59            [ 4]  963 	ld	e, c
   6966 50            [ 4]  964 	ld	d, b
   6967 13            [ 6]  965 	inc	de
   6968 13            [ 6]  966 	inc	de
   6969 13            [ 6]  967 	inc	de
   696A 69            [ 4]  968 	ld	l, c
   696B 60            [ 4]  969 	ld	h, b
   696C 23            [ 6]  970 	inc	hl
   696D 7E            [ 7]  971 	ld	a,(hl)
   696E 12            [ 7]  972 	ld	(de),a
                            973 ;src/main.c:229: dibujarEnemigo(enemy);
   696F C5            [11]  974 	push	bc
   6970 CD F5 67      [17]  975 	call	_dibujarEnemigo
   6973 F1            [10]  976 	pop	af
   6974 DD E1         [14]  977 	pop	ix
   6976 C9            [10]  978 	ret
                            979 ;src/main.c:233: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            980 ;	---------------------------------
                            981 ; Function checkEnemyDead
                            982 ; ---------------------------------
   6977                     983 _checkEnemyDead::
   6977 DD E5         [15]  984 	push	ix
   6979 DD 21 00 00   [14]  985 	ld	ix,#0
   697D DD 39         [15]  986 	add	ix,sp
   697F 21 FA FF      [10]  987 	ld	hl,#-6
   6982 39            [11]  988 	add	hl,sp
   6983 F9            [ 6]  989 	ld	sp,hl
                            990 ;src/main.c:235: switch (direction) {
   6984 3E 03         [ 7]  991 	ld	a,#0x03
   6986 DD 96 04      [19]  992 	sub	a, 4 (ix)
   6989 DA 65 6B      [10]  993 	jp	C,00134$
                            994 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   698C DD 7E 05      [19]  995 	ld	a,5 (ix)
   698F DD 77 FC      [19]  996 	ld	-4 (ix),a
   6992 DD 7E 06      [19]  997 	ld	a,6 (ix)
   6995 DD 77 FD      [19]  998 	ld	-3 (ix),a
   6998 DD 7E FC      [19]  999 	ld	a,-4 (ix)
   699B C6 01         [ 7] 1000 	add	a, #0x01
   699D DD 77 FE      [19] 1001 	ld	-2 (ix),a
   69A0 DD 7E FD      [19] 1002 	ld	a,-3 (ix)
   69A3 CE 00         [ 7] 1003 	adc	a, #0x00
   69A5 DD 77 FF      [19] 1004 	ld	-1 (ix),a
                           1005 ;src/main.c:242: enemy->muerto = SI;
   69A8 DD 7E FC      [19] 1006 	ld	a,-4 (ix)
   69AB C6 08         [ 7] 1007 	add	a, #0x08
   69AD DD 77 FA      [19] 1008 	ld	-6 (ix),a
   69B0 DD 7E FD      [19] 1009 	ld	a,-3 (ix)
   69B3 CE 00         [ 7] 1010 	adc	a, #0x00
   69B5 DD 77 FB      [19] 1011 	ld	-5 (ix),a
                           1012 ;src/main.c:235: switch (direction) {
   69B8 DD 5E 04      [19] 1013 	ld	e,4 (ix)
   69BB 16 00         [ 7] 1014 	ld	d,#0x00
   69BD 21 C4 69      [10] 1015 	ld	hl,#00204$
   69C0 19            [11] 1016 	add	hl,de
   69C1 19            [11] 1017 	add	hl,de
   69C2 19            [11] 1018 	add	hl,de
   69C3 E9            [ 4] 1019 	jp	(hl)
   69C4                    1020 00204$:
   69C4 C3 D0 69      [10] 1021 	jp	00101$
   69C7 C3 38 6A      [10] 1022 	jp	00109$
   69CA C3 A0 6A      [10] 1023 	jp	00117$
   69CD C3 07 6B      [10] 1024 	jp	00125$
                           1025 ;src/main.c:238: case 0:
   69D0                    1026 00101$:
                           1027 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69D0 21 42 64      [10] 1028 	ld	hl, #_cu + 1
   69D3 4E            [ 7] 1029 	ld	c,(hl)
   69D4 06 00         [ 7] 1030 	ld	b,#0x00
   69D6 21 04 00      [10] 1031 	ld	hl,#0x0004
   69D9 09            [11] 1032 	add	hl,bc
   69DA EB            [ 4] 1033 	ex	de,hl
   69DB DD 6E FE      [19] 1034 	ld	l,-2 (ix)
   69DE DD 66 FF      [19] 1035 	ld	h,-1 (ix)
   69E1 6E            [ 7] 1036 	ld	l,(hl)
   69E2 26 00         [ 7] 1037 	ld	h,#0x00
   69E4 7B            [ 4] 1038 	ld	a,e
   69E5 95            [ 4] 1039 	sub	a, l
   69E6 7A            [ 4] 1040 	ld	a,d
   69E7 9C            [ 4] 1041 	sbc	a, h
   69E8 E2 ED 69      [10] 1042 	jp	PO, 00205$
   69EB EE 80         [ 7] 1043 	xor	a, #0x80
   69ED                    1044 00205$:
   69ED FA 65 6B      [10] 1045 	jp	M,00134$
   69F0 11 16 00      [10] 1046 	ld	de,#0x0016
   69F3 19            [11] 1047 	add	hl,de
   69F4 7D            [ 4] 1048 	ld	a,l
   69F5 91            [ 4] 1049 	sub	a, c
   69F6 7C            [ 4] 1050 	ld	a,h
   69F7 98            [ 4] 1051 	sbc	a, b
   69F8 E2 FD 69      [10] 1052 	jp	PO, 00206$
   69FB EE 80         [ 7] 1053 	xor	a, #0x80
   69FD                    1054 00206$:
   69FD FA 65 6B      [10] 1055 	jp	M,00134$
                           1056 ;src/main.c:240: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   6A00 DD 6E FC      [19] 1057 	ld	l,-4 (ix)
   6A03 DD 66 FD      [19] 1058 	ld	h,-3 (ix)
   6A06 4E            [ 7] 1059 	ld	c,(hl)
   6A07 21 41 64      [10] 1060 	ld	hl, #_cu + 0
   6A0A 5E            [ 7] 1061 	ld	e,(hl)
   6A0B 16 00         [ 7] 1062 	ld	d,#0x00
   6A0D 13            [ 6] 1063 	inc	de
   6A0E 13            [ 6] 1064 	inc	de
   6A0F 13            [ 6] 1065 	inc	de
   6A10 13            [ 6] 1066 	inc	de
   6A11 69            [ 4] 1067 	ld	l,c
   6A12 26 00         [ 7] 1068 	ld	h,#0x00
   6A14 7B            [ 4] 1069 	ld	a,e
   6A15 95            [ 4] 1070 	sub	a, l
   6A16 7A            [ 4] 1071 	ld	a,d
   6A17 9C            [ 4] 1072 	sbc	a, h
   6A18 E2 1D 6A      [10] 1073 	jp	PO, 00207$
   6A1B EE 80         [ 7] 1074 	xor	a, #0x80
   6A1D                    1075 00207$:
   6A1D F2 65 6B      [10] 1076 	jp	P,00134$
                           1077 ;src/main.c:241: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A20 BF            [ 4] 1078 	cp	a, a
   6A21 ED 52         [15] 1079 	sbc	hl, de
   6A23 3E 01         [ 7] 1080 	ld	a,#0x01
   6A25 BD            [ 4] 1081 	cp	a, l
   6A26 3E 00         [ 7] 1082 	ld	a,#0x00
   6A28 9C            [ 4] 1083 	sbc	a, h
   6A29 E2 2E 6A      [10] 1084 	jp	PO, 00208$
   6A2C EE 80         [ 7] 1085 	xor	a, #0x80
   6A2E                    1086 00208$:
   6A2E FA 65 6B      [10] 1087 	jp	M,00134$
                           1088 ;src/main.c:242: enemy->muerto = SI;
   6A31 E1            [10] 1089 	pop	hl
   6A32 E5            [11] 1090 	push	hl
   6A33 36 01         [10] 1091 	ld	(hl),#0x01
                           1092 ;src/main.c:246: break;
   6A35 C3 65 6B      [10] 1093 	jp	00134$
                           1094 ;src/main.c:247: case 1:
   6A38                    1095 00109$:
                           1096 ;src/main.c:248: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A38 21 42 64      [10] 1097 	ld	hl, #_cu + 1
   6A3B 4E            [ 7] 1098 	ld	c,(hl)
   6A3C 06 00         [ 7] 1099 	ld	b,#0x00
   6A3E 21 04 00      [10] 1100 	ld	hl,#0x0004
   6A41 09            [11] 1101 	add	hl,bc
   6A42 EB            [ 4] 1102 	ex	de,hl
   6A43 DD 6E FE      [19] 1103 	ld	l,-2 (ix)
   6A46 DD 66 FF      [19] 1104 	ld	h,-1 (ix)
   6A49 6E            [ 7] 1105 	ld	l,(hl)
   6A4A 26 00         [ 7] 1106 	ld	h,#0x00
   6A4C 7B            [ 4] 1107 	ld	a,e
   6A4D 95            [ 4] 1108 	sub	a, l
   6A4E 7A            [ 4] 1109 	ld	a,d
   6A4F 9C            [ 4] 1110 	sbc	a, h
   6A50 E2 55 6A      [10] 1111 	jp	PO, 00209$
   6A53 EE 80         [ 7] 1112 	xor	a, #0x80
   6A55                    1113 00209$:
   6A55 FA 65 6B      [10] 1114 	jp	M,00134$
   6A58 11 16 00      [10] 1115 	ld	de,#0x0016
   6A5B 19            [11] 1116 	add	hl,de
   6A5C 7D            [ 4] 1117 	ld	a,l
   6A5D 91            [ 4] 1118 	sub	a, c
   6A5E 7C            [ 4] 1119 	ld	a,h
   6A5F 98            [ 4] 1120 	sbc	a, b
   6A60 E2 65 6A      [10] 1121 	jp	PO, 00210$
   6A63 EE 80         [ 7] 1122 	xor	a, #0x80
   6A65                    1123 00210$:
   6A65 FA 65 6B      [10] 1124 	jp	M,00134$
                           1125 ;src/main.c:249: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6A68 21 41 64      [10] 1126 	ld	hl, #_cu + 0
   6A6B 4E            [ 7] 1127 	ld	c,(hl)
   6A6C DD 6E FC      [19] 1128 	ld	l,-4 (ix)
   6A6F DD 66 FD      [19] 1129 	ld	h,-3 (ix)
   6A72 5E            [ 7] 1130 	ld	e,(hl)
   6A73 16 00         [ 7] 1131 	ld	d,#0x00
   6A75 13            [ 6] 1132 	inc	de
   6A76 13            [ 6] 1133 	inc	de
   6A77 13            [ 6] 1134 	inc	de
   6A78 13            [ 6] 1135 	inc	de
   6A79 69            [ 4] 1136 	ld	l,c
   6A7A 26 00         [ 7] 1137 	ld	h,#0x00
   6A7C 7B            [ 4] 1138 	ld	a,e
   6A7D 95            [ 4] 1139 	sub	a, l
   6A7E 7A            [ 4] 1140 	ld	a,d
   6A7F 9C            [ 4] 1141 	sbc	a, h
   6A80 E2 85 6A      [10] 1142 	jp	PO, 00211$
   6A83 EE 80         [ 7] 1143 	xor	a, #0x80
   6A85                    1144 00211$:
   6A85 F2 65 6B      [10] 1145 	jp	P,00134$
                           1146 ;src/main.c:250: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A88 BF            [ 4] 1147 	cp	a, a
   6A89 ED 52         [15] 1148 	sbc	hl, de
   6A8B 3E 01         [ 7] 1149 	ld	a,#0x01
   6A8D BD            [ 4] 1150 	cp	a, l
   6A8E 3E 00         [ 7] 1151 	ld	a,#0x00
   6A90 9C            [ 4] 1152 	sbc	a, h
   6A91 E2 96 6A      [10] 1153 	jp	PO, 00212$
   6A94 EE 80         [ 7] 1154 	xor	a, #0x80
   6A96                    1155 00212$:
   6A96 FA 65 6B      [10] 1156 	jp	M,00134$
                           1157 ;src/main.c:251: enemy->muerto = SI;
   6A99 E1            [10] 1158 	pop	hl
   6A9A E5            [11] 1159 	push	hl
   6A9B 36 01         [10] 1160 	ld	(hl),#0x01
                           1161 ;src/main.c:255: break;
   6A9D C3 65 6B      [10] 1162 	jp	00134$
                           1163 ;src/main.c:257: case 2:
   6AA0                    1164 00117$:
                           1165 ;src/main.c:258: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AA0 21 41 64      [10] 1166 	ld	hl, #_cu + 0
   6AA3 4E            [ 7] 1167 	ld	c,(hl)
   6AA4 06 00         [ 7] 1168 	ld	b,#0x00
   6AA6 59            [ 4] 1169 	ld	e, c
   6AA7 50            [ 4] 1170 	ld	d, b
   6AA8 13            [ 6] 1171 	inc	de
   6AA9 13            [ 6] 1172 	inc	de
   6AAA DD 6E FC      [19] 1173 	ld	l,-4 (ix)
   6AAD DD 66 FD      [19] 1174 	ld	h,-3 (ix)
   6AB0 6E            [ 7] 1175 	ld	l,(hl)
   6AB1 26 00         [ 7] 1176 	ld	h,#0x00
   6AB3 7B            [ 4] 1177 	ld	a,e
   6AB4 95            [ 4] 1178 	sub	a, l
   6AB5 7A            [ 4] 1179 	ld	a,d
   6AB6 9C            [ 4] 1180 	sbc	a, h
   6AB7 E2 BC 6A      [10] 1181 	jp	PO, 00213$
   6ABA EE 80         [ 7] 1182 	xor	a, #0x80
   6ABC                    1183 00213$:
   6ABC FA 65 6B      [10] 1184 	jp	M,00134$
   6ABF 11 04 00      [10] 1185 	ld	de,#0x0004
   6AC2 19            [11] 1186 	add	hl,de
   6AC3 7D            [ 4] 1187 	ld	a,l
   6AC4 91            [ 4] 1188 	sub	a, c
   6AC5 7C            [ 4] 1189 	ld	a,h
   6AC6 98            [ 4] 1190 	sbc	a, b
   6AC7 E2 CC 6A      [10] 1191 	jp	PO, 00214$
   6ACA EE 80         [ 7] 1192 	xor	a, #0x80
   6ACC                    1193 00214$:
   6ACC FA 65 6B      [10] 1194 	jp	M,00134$
                           1195 ;src/main.c:259: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6ACF 21 42 64      [10] 1196 	ld	hl, #(_cu + 0x0001) + 0
   6AD2 4E            [ 7] 1197 	ld	c,(hl)
   6AD3 DD 6E FE      [19] 1198 	ld	l,-2 (ix)
   6AD6 DD 66 FF      [19] 1199 	ld	h,-1 (ix)
   6AD9 5E            [ 7] 1200 	ld	e,(hl)
   6ADA 16 00         [ 7] 1201 	ld	d,#0x00
   6ADC 21 16 00      [10] 1202 	ld	hl,#0x0016
   6ADF 19            [11] 1203 	add	hl,de
   6AE0 EB            [ 4] 1204 	ex	de,hl
   6AE1 69            [ 4] 1205 	ld	l,c
   6AE2 26 00         [ 7] 1206 	ld	h,#0x00
   6AE4 7B            [ 4] 1207 	ld	a,e
   6AE5 95            [ 4] 1208 	sub	a, l
   6AE6 7A            [ 4] 1209 	ld	a,d
   6AE7 9C            [ 4] 1210 	sbc	a, h
   6AE8 E2 ED 6A      [10] 1211 	jp	PO, 00215$
   6AEB EE 80         [ 7] 1212 	xor	a, #0x80
   6AED                    1213 00215$:
   6AED F2 65 6B      [10] 1214 	jp	P,00134$
                           1215 ;src/main.c:260: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6AF0 BF            [ 4] 1216 	cp	a, a
   6AF1 ED 52         [15] 1217 	sbc	hl, de
   6AF3 3E 02         [ 7] 1218 	ld	a,#0x02
   6AF5 BD            [ 4] 1219 	cp	a, l
   6AF6 3E 00         [ 7] 1220 	ld	a,#0x00
   6AF8 9C            [ 4] 1221 	sbc	a, h
   6AF9 E2 FE 6A      [10] 1222 	jp	PO, 00216$
   6AFC EE 80         [ 7] 1223 	xor	a, #0x80
   6AFE                    1224 00216$:
   6AFE FA 65 6B      [10] 1225 	jp	M,00134$
                           1226 ;src/main.c:261: enemy->muerto = SI;
   6B01 E1            [10] 1227 	pop	hl
   6B02 E5            [11] 1228 	push	hl
   6B03 36 01         [10] 1229 	ld	(hl),#0x01
                           1230 ;src/main.c:265: break;
   6B05 18 5E         [12] 1231 	jr	00134$
                           1232 ;src/main.c:266: case 3:
   6B07                    1233 00125$:
                           1234 ;src/main.c:267: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6B07 21 41 64      [10] 1235 	ld	hl, #_cu + 0
   6B0A 4E            [ 7] 1236 	ld	c,(hl)
   6B0B 06 00         [ 7] 1237 	ld	b,#0x00
   6B0D 59            [ 4] 1238 	ld	e, c
   6B0E 50            [ 4] 1239 	ld	d, b
   6B0F 13            [ 6] 1240 	inc	de
   6B10 13            [ 6] 1241 	inc	de
   6B11 DD 6E FC      [19] 1242 	ld	l,-4 (ix)
   6B14 DD 66 FD      [19] 1243 	ld	h,-3 (ix)
   6B17 6E            [ 7] 1244 	ld	l,(hl)
   6B18 26 00         [ 7] 1245 	ld	h,#0x00
   6B1A 7B            [ 4] 1246 	ld	a,e
   6B1B 95            [ 4] 1247 	sub	a, l
   6B1C 7A            [ 4] 1248 	ld	a,d
   6B1D 9C            [ 4] 1249 	sbc	a, h
   6B1E E2 23 6B      [10] 1250 	jp	PO, 00217$
   6B21 EE 80         [ 7] 1251 	xor	a, #0x80
   6B23                    1252 00217$:
   6B23 FA 65 6B      [10] 1253 	jp	M,00134$
   6B26 11 04 00      [10] 1254 	ld	de,#0x0004
   6B29 19            [11] 1255 	add	hl,de
   6B2A 7D            [ 4] 1256 	ld	a,l
   6B2B 91            [ 4] 1257 	sub	a, c
   6B2C 7C            [ 4] 1258 	ld	a,h
   6B2D 98            [ 4] 1259 	sbc	a, b
   6B2E E2 33 6B      [10] 1260 	jp	PO, 00218$
   6B31 EE 80         [ 7] 1261 	xor	a, #0x80
   6B33                    1262 00218$:
   6B33 FA 65 6B      [10] 1263 	jp	M,00134$
                           1264 ;src/main.c:268: if(enemy->y>cu.y){
   6B36 DD 6E FE      [19] 1265 	ld	l,-2 (ix)
   6B39 DD 66 FF      [19] 1266 	ld	h,-1 (ix)
   6B3C 4E            [ 7] 1267 	ld	c,(hl)
   6B3D 21 42 64      [10] 1268 	ld	hl, #(_cu + 0x0001) + 0
   6B40 5E            [ 7] 1269 	ld	e,(hl)
   6B41 7B            [ 4] 1270 	ld	a,e
   6B42 91            [ 4] 1271 	sub	a, c
   6B43 30 20         [12] 1272 	jr	NC,00134$
                           1273 ;src/main.c:269: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6B45 06 00         [ 7] 1274 	ld	b,#0x00
   6B47 16 00         [ 7] 1275 	ld	d,#0x00
   6B49 21 08 00      [10] 1276 	ld	hl,#0x0008
   6B4C 19            [11] 1277 	add	hl,de
   6B4D 79            [ 4] 1278 	ld	a,c
   6B4E 95            [ 4] 1279 	sub	a, l
   6B4F 4F            [ 4] 1280 	ld	c,a
   6B50 78            [ 4] 1281 	ld	a,b
   6B51 9C            [ 4] 1282 	sbc	a, h
   6B52 47            [ 4] 1283 	ld	b,a
   6B53 3E 02         [ 7] 1284 	ld	a,#0x02
   6B55 B9            [ 4] 1285 	cp	a, c
   6B56 3E 00         [ 7] 1286 	ld	a,#0x00
   6B58 98            [ 4] 1287 	sbc	a, b
   6B59 E2 5E 6B      [10] 1288 	jp	PO, 00219$
   6B5C EE 80         [ 7] 1289 	xor	a, #0x80
   6B5E                    1290 00219$:
   6B5E FA 65 6B      [10] 1291 	jp	M,00134$
                           1292 ;src/main.c:270: enemy->muerto = SI;
   6B61 E1            [10] 1293 	pop	hl
   6B62 E5            [11] 1294 	push	hl
   6B63 36 01         [10] 1295 	ld	(hl),#0x01
                           1296 ;src/main.c:275: }
   6B65                    1297 00134$:
   6B65 DD F9         [10] 1298 	ld	sp, ix
   6B67 DD E1         [14] 1299 	pop	ix
   6B69 C9            [10] 1300 	ret
                           1301 ;src/main.c:278: void moverEnemigoArriba(TEnemy *enemy){
                           1302 ;	---------------------------------
                           1303 ; Function moverEnemigoArriba
                           1304 ; ---------------------------------
   6B6A                    1305 _moverEnemigoArriba::
   6B6A DD E5         [15] 1306 	push	ix
   6B6C DD 21 00 00   [14] 1307 	ld	ix,#0
   6B70 DD 39         [15] 1308 	add	ix,sp
                           1309 ;src/main.c:279: enemy->y--;
   6B72 DD 4E 04      [19] 1310 	ld	c,4 (ix)
   6B75 DD 46 05      [19] 1311 	ld	b,5 (ix)
   6B78 69            [ 4] 1312 	ld	l, c
   6B79 60            [ 4] 1313 	ld	h, b
   6B7A 23            [ 6] 1314 	inc	hl
   6B7B 5E            [ 7] 1315 	ld	e,(hl)
   6B7C 1D            [ 4] 1316 	dec	e
   6B7D 73            [ 7] 1317 	ld	(hl),e
                           1318 ;src/main.c:280: enemy->y--;
   6B7E 1D            [ 4] 1319 	dec	e
   6B7F 73            [ 7] 1320 	ld	(hl),e
                           1321 ;src/main.c:281: enemy->mover = SI;
   6B80 21 06 00      [10] 1322 	ld	hl,#0x0006
   6B83 09            [11] 1323 	add	hl,bc
   6B84 36 01         [10] 1324 	ld	(hl),#0x01
   6B86 DD E1         [14] 1325 	pop	ix
   6B88 C9            [10] 1326 	ret
                           1327 ;src/main.c:284: void moverEnemigoAbajo(TEnemy *enemy){
                           1328 ;	---------------------------------
                           1329 ; Function moverEnemigoAbajo
                           1330 ; ---------------------------------
   6B89                    1331 _moverEnemigoAbajo::
   6B89 DD E5         [15] 1332 	push	ix
   6B8B DD 21 00 00   [14] 1333 	ld	ix,#0
   6B8F DD 39         [15] 1334 	add	ix,sp
                           1335 ;src/main.c:285: enemy->y++;
   6B91 DD 4E 04      [19] 1336 	ld	c,4 (ix)
   6B94 DD 46 05      [19] 1337 	ld	b,5 (ix)
   6B97 59            [ 4] 1338 	ld	e, c
   6B98 50            [ 4] 1339 	ld	d, b
   6B99 13            [ 6] 1340 	inc	de
   6B9A 1A            [ 7] 1341 	ld	a,(de)
   6B9B 3C            [ 4] 1342 	inc	a
   6B9C 12            [ 7] 1343 	ld	(de),a
                           1344 ;src/main.c:286: enemy->y++;
   6B9D 3C            [ 4] 1345 	inc	a
   6B9E 12            [ 7] 1346 	ld	(de),a
                           1347 ;src/main.c:287: enemy->mover = SI;
   6B9F 21 06 00      [10] 1348 	ld	hl,#0x0006
   6BA2 09            [11] 1349 	add	hl,bc
   6BA3 36 01         [10] 1350 	ld	(hl),#0x01
   6BA5 DD E1         [14] 1351 	pop	ix
   6BA7 C9            [10] 1352 	ret
                           1353 ;src/main.c:290: void moverEnemigoDerecha(TEnemy *enemy){
                           1354 ;	---------------------------------
                           1355 ; Function moverEnemigoDerecha
                           1356 ; ---------------------------------
   6BA8                    1357 _moverEnemigoDerecha::
                           1358 ;src/main.c:291: enemy->x++;
   6BA8 D1            [10] 1359 	pop	de
   6BA9 C1            [10] 1360 	pop	bc
   6BAA C5            [11] 1361 	push	bc
   6BAB D5            [11] 1362 	push	de
   6BAC 0A            [ 7] 1363 	ld	a,(bc)
   6BAD 3C            [ 4] 1364 	inc	a
   6BAE 02            [ 7] 1365 	ld	(bc),a
                           1366 ;src/main.c:292: enemy->x++;
   6BAF 3C            [ 4] 1367 	inc	a
   6BB0 02            [ 7] 1368 	ld	(bc),a
                           1369 ;src/main.c:293: enemy->mover = SI;
   6BB1 21 06 00      [10] 1370 	ld	hl,#0x0006
   6BB4 09            [11] 1371 	add	hl,bc
   6BB5 36 01         [10] 1372 	ld	(hl),#0x01
   6BB7 C9            [10] 1373 	ret
                           1374 ;src/main.c:296: void moverEnemigoIzquierda(TEnemy *enemy){
                           1375 ;	---------------------------------
                           1376 ; Function moverEnemigoIzquierda
                           1377 ; ---------------------------------
   6BB8                    1378 _moverEnemigoIzquierda::
                           1379 ;src/main.c:297: enemy->x--;
   6BB8 D1            [10] 1380 	pop	de
   6BB9 C1            [10] 1381 	pop	bc
   6BBA C5            [11] 1382 	push	bc
   6BBB D5            [11] 1383 	push	de
   6BBC 0A            [ 7] 1384 	ld	a,(bc)
   6BBD C6 FF         [ 7] 1385 	add	a,#0xFF
   6BBF 02            [ 7] 1386 	ld	(bc),a
                           1387 ;src/main.c:298: enemy->x--;
   6BC0 C6 FF         [ 7] 1388 	add	a,#0xFF
   6BC2 02            [ 7] 1389 	ld	(bc),a
                           1390 ;src/main.c:299: enemy->mover = SI;
   6BC3 21 06 00      [10] 1391 	ld	hl,#0x0006
   6BC6 09            [11] 1392 	add	hl,bc
   6BC7 36 01         [10] 1393 	ld	(hl),#0x01
   6BC9 C9            [10] 1394 	ret
                           1395 ;src/main.c:302: void moverEnemigoPatrol(TEnemy* enemy){
                           1396 ;	---------------------------------
                           1397 ; Function moverEnemigoPatrol
                           1398 ; ---------------------------------
   6BCA                    1399 _moverEnemigoPatrol::
   6BCA DD E5         [15] 1400 	push	ix
   6BCC DD 21 00 00   [14] 1401 	ld	ix,#0
   6BD0 DD 39         [15] 1402 	add	ix,sp
   6BD2 21 F3 FF      [10] 1403 	ld	hl,#-13
   6BD5 39            [11] 1404 	add	hl,sp
   6BD6 F9            [ 6] 1405 	ld	sp,hl
                           1406 ;src/main.c:304: if(!enemy->muerto){
   6BD7 DD 4E 04      [19] 1407 	ld	c,4 (ix)
   6BDA DD 46 05      [19] 1408 	ld	b,5 (ix)
   6BDD C5            [11] 1409 	push	bc
   6BDE FD E1         [14] 1410 	pop	iy
   6BE0 FD 7E 08      [19] 1411 	ld	a,8 (iy)
   6BE3 B7            [ 4] 1412 	or	a, a
   6BE4 C2 0E 6E      [10] 1413 	jp	NZ,00118$
                           1414 ;src/main.c:305: if (!enemy->reversePatrol) {
   6BE7 21 0C 00      [10] 1415 	ld	hl,#0x000C
   6BEA 09            [11] 1416 	add	hl,bc
   6BEB DD 75 F9      [19] 1417 	ld	-7 (ix),l
   6BEE DD 74 FA      [19] 1418 	ld	-6 (ix),h
   6BF1 DD 6E F9      [19] 1419 	ld	l,-7 (ix)
   6BF4 DD 66 FA      [19] 1420 	ld	h,-6 (ix)
   6BF7 7E            [ 7] 1421 	ld	a,(hl)
   6BF8 DD 77 FF      [19] 1422 	ld	-1 (ix),a
                           1423 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6BFB 21 0E 00      [10] 1424 	ld	hl,#0x000E
   6BFE 09            [11] 1425 	add	hl,bc
   6BFF DD 75 FB      [19] 1426 	ld	-5 (ix),l
   6C02 DD 74 FC      [19] 1427 	ld	-4 (ix),h
   6C05 DD 6E FB      [19] 1428 	ld	l,-5 (ix)
   6C08 DD 66 FC      [19] 1429 	ld	h,-4 (ix)
   6C0B 5E            [ 7] 1430 	ld	e,(hl)
   6C0C 23            [ 6] 1431 	inc	hl
   6C0D 56            [ 7] 1432 	ld	d,(hl)
   6C0E 21 E2 00      [10] 1433 	ld	hl,#0x00E2
   6C11 09            [11] 1434 	add	hl,bc
   6C12 DD 75 FD      [19] 1435 	ld	-3 (ix),l
   6C15 DD 74 FE      [19] 1436 	ld	-2 (ix),h
                           1437 ;src/main.c:308: enemy->mover = SI;
   6C18 21 06 00      [10] 1438 	ld	hl,#0x0006
   6C1B 09            [11] 1439 	add	hl,bc
   6C1C DD 75 F7      [19] 1440 	ld	-9 (ix),l
   6C1F DD 74 F8      [19] 1441 	ld	-8 (ix),h
                           1442 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C22 21 1A 00      [10] 1443 	ld	hl,#0x001A
   6C25 09            [11] 1444 	add	hl,bc
   6C26 DD 75 F5      [19] 1445 	ld	-11 (ix),l
   6C29 DD 74 F6      [19] 1446 	ld	-10 (ix),h
                           1447 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6C2C 21 01 00      [10] 1448 	ld	hl,#0x0001
   6C2F 09            [11] 1449 	add	hl,bc
   6C30 E3            [19] 1450 	ex	(sp), hl
                           1451 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C31 DD 7E FF      [19] 1452 	ld	a,-1 (ix)
   6C34 B7            [ 4] 1453 	or	a, a
   6C35 C2 0C 6D      [10] 1454 	jp	NZ,00114$
                           1455 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C38 DD 6E FD      [19] 1456 	ld	l,-3 (ix)
   6C3B DD 66 FE      [19] 1457 	ld	h,-2 (ix)
   6C3E 6E            [ 7] 1458 	ld	l,(hl)
   6C3F 26 00         [ 7] 1459 	ld	h,#0x00
   6C41 7B            [ 4] 1460 	ld	a,e
   6C42 95            [ 4] 1461 	sub	a, l
   6C43 7A            [ 4] 1462 	ld	a,d
   6C44 9C            [ 4] 1463 	sbc	a, h
   6C45 E2 4A 6C      [10] 1464 	jp	PO, 00144$
   6C48 EE 80         [ 7] 1465 	xor	a, #0x80
   6C4A                    1466 00144$:
   6C4A F2 E7 6C      [10] 1467 	jp	P,00105$
                           1468 ;src/main.c:307: if(enemy->iter == 0){
   6C4D 7A            [ 4] 1469 	ld	a,d
   6C4E B3            [ 4] 1470 	or	a,e
   6C4F 20 50         [12] 1471 	jr	NZ,00102$
                           1472 ;src/main.c:308: enemy->mover = SI;
   6C51 DD 6E F7      [19] 1473 	ld	l,-9 (ix)
   6C54 DD 66 F8      [19] 1474 	ld	h,-8 (ix)
   6C57 36 01         [10] 1475 	ld	(hl),#0x01
                           1476 ;src/main.c:309: enemy->iter = 2;
   6C59 DD 6E FB      [19] 1477 	ld	l,-5 (ix)
   6C5C DD 66 FC      [19] 1478 	ld	h,-4 (ix)
   6C5F 36 02         [10] 1479 	ld	(hl),#0x02
   6C61 23            [ 6] 1480 	inc	hl
   6C62 36 00         [10] 1481 	ld	(hl),#0x00
                           1482 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C64 DD 6E FB      [19] 1483 	ld	l,-5 (ix)
   6C67 DD 66 FC      [19] 1484 	ld	h,-4 (ix)
   6C6A 5E            [ 7] 1485 	ld	e,(hl)
   6C6B 23            [ 6] 1486 	inc	hl
   6C6C 56            [ 7] 1487 	ld	d,(hl)
   6C6D DD 6E F5      [19] 1488 	ld	l,-11 (ix)
   6C70 DD 66 F6      [19] 1489 	ld	h,-10 (ix)
   6C73 19            [11] 1490 	add	hl,de
   6C74 7E            [ 7] 1491 	ld	a,(hl)
   6C75 02            [ 7] 1492 	ld	(bc),a
                           1493 ;src/main.c:311: ++enemy->iter;
   6C76 DD 6E FB      [19] 1494 	ld	l,-5 (ix)
   6C79 DD 66 FC      [19] 1495 	ld	h,-4 (ix)
   6C7C 4E            [ 7] 1496 	ld	c,(hl)
   6C7D 23            [ 6] 1497 	inc	hl
   6C7E 46            [ 7] 1498 	ld	b,(hl)
   6C7F 03            [ 6] 1499 	inc	bc
   6C80 DD 6E FB      [19] 1500 	ld	l,-5 (ix)
   6C83 DD 66 FC      [19] 1501 	ld	h,-4 (ix)
   6C86 71            [ 7] 1502 	ld	(hl),c
   6C87 23            [ 6] 1503 	inc	hl
   6C88 70            [ 7] 1504 	ld	(hl),b
                           1505 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6C89 DD 6E F5      [19] 1506 	ld	l,-11 (ix)
   6C8C DD 66 F6      [19] 1507 	ld	h,-10 (ix)
   6C8F 09            [11] 1508 	add	hl,bc
   6C90 5E            [ 7] 1509 	ld	e,(hl)
   6C91 E1            [10] 1510 	pop	hl
   6C92 E5            [11] 1511 	push	hl
   6C93 73            [ 7] 1512 	ld	(hl),e
                           1513 ;src/main.c:313: ++enemy->iter;
   6C94 03            [ 6] 1514 	inc	bc
   6C95 DD 6E FB      [19] 1515 	ld	l,-5 (ix)
   6C98 DD 66 FC      [19] 1516 	ld	h,-4 (ix)
   6C9B 71            [ 7] 1517 	ld	(hl),c
   6C9C 23            [ 6] 1518 	inc	hl
   6C9D 70            [ 7] 1519 	ld	(hl),b
   6C9E C3 0E 6E      [10] 1520 	jp	00118$
   6CA1                    1521 00102$:
                           1522 ;src/main.c:315: enemy->mover = SI;
   6CA1 DD 6E F7      [19] 1523 	ld	l,-9 (ix)
   6CA4 DD 66 F8      [19] 1524 	ld	h,-8 (ix)
   6CA7 36 01         [10] 1525 	ld	(hl),#0x01
                           1526 ;src/main.c:316: enemy->x = enemy->camino[enemy->iter];
   6CA9 DD 6E FB      [19] 1527 	ld	l,-5 (ix)
   6CAC DD 66 FC      [19] 1528 	ld	h,-4 (ix)
   6CAF 5E            [ 7] 1529 	ld	e,(hl)
   6CB0 23            [ 6] 1530 	inc	hl
   6CB1 56            [ 7] 1531 	ld	d,(hl)
   6CB2 DD 6E F5      [19] 1532 	ld	l,-11 (ix)
   6CB5 DD 66 F6      [19] 1533 	ld	h,-10 (ix)
   6CB8 19            [11] 1534 	add	hl,de
   6CB9 7E            [ 7] 1535 	ld	a,(hl)
   6CBA 02            [ 7] 1536 	ld	(bc),a
                           1537 ;src/main.c:317: ++enemy->iter;
   6CBB DD 6E FB      [19] 1538 	ld	l,-5 (ix)
   6CBE DD 66 FC      [19] 1539 	ld	h,-4 (ix)
   6CC1 5E            [ 7] 1540 	ld	e,(hl)
   6CC2 23            [ 6] 1541 	inc	hl
   6CC3 56            [ 7] 1542 	ld	d,(hl)
   6CC4 13            [ 6] 1543 	inc	de
   6CC5 DD 6E FB      [19] 1544 	ld	l,-5 (ix)
   6CC8 DD 66 FC      [19] 1545 	ld	h,-4 (ix)
   6CCB 73            [ 7] 1546 	ld	(hl),e
   6CCC 23            [ 6] 1547 	inc	hl
   6CCD 72            [ 7] 1548 	ld	(hl),d
                           1549 ;src/main.c:318: enemy->y = enemy->camino[enemy->iter];
   6CCE DD 6E F5      [19] 1550 	ld	l,-11 (ix)
   6CD1 DD 66 F6      [19] 1551 	ld	h,-10 (ix)
   6CD4 19            [11] 1552 	add	hl,de
   6CD5 7E            [ 7] 1553 	ld	a,(hl)
   6CD6 E1            [10] 1554 	pop	hl
   6CD7 E5            [11] 1555 	push	hl
   6CD8 77            [ 7] 1556 	ld	(hl),a
                           1557 ;src/main.c:319: ++enemy->iter;
   6CD9 13            [ 6] 1558 	inc	de
   6CDA 4B            [ 4] 1559 	ld	c,e
   6CDB DD 6E FB      [19] 1560 	ld	l,-5 (ix)
   6CDE DD 66 FC      [19] 1561 	ld	h,-4 (ix)
   6CE1 71            [ 7] 1562 	ld	(hl),c
   6CE2 23            [ 6] 1563 	inc	hl
   6CE3 72            [ 7] 1564 	ld	(hl),d
   6CE4 C3 0E 6E      [10] 1565 	jp	00118$
   6CE7                    1566 00105$:
                           1567 ;src/main.c:323: enemy->mover = NO;
   6CE7 DD 6E F7      [19] 1568 	ld	l,-9 (ix)
   6CEA DD 66 F8      [19] 1569 	ld	h,-8 (ix)
   6CED 36 00         [10] 1570 	ld	(hl),#0x00
                           1571 ;src/main.c:324: enemy->iter = enemy->longitud_camino;
   6CEF DD 6E FD      [19] 1572 	ld	l,-3 (ix)
   6CF2 DD 66 FE      [19] 1573 	ld	h,-2 (ix)
   6CF5 4E            [ 7] 1574 	ld	c,(hl)
   6CF6 06 00         [ 7] 1575 	ld	b,#0x00
   6CF8 DD 6E FB      [19] 1576 	ld	l,-5 (ix)
   6CFB DD 66 FC      [19] 1577 	ld	h,-4 (ix)
   6CFE 71            [ 7] 1578 	ld	(hl),c
   6CFF 23            [ 6] 1579 	inc	hl
   6D00 70            [ 7] 1580 	ld	(hl),b
                           1581 ;src/main.c:325: enemy->reversePatrol = 1;
   6D01 DD 6E F9      [19] 1582 	ld	l,-7 (ix)
   6D04 DD 66 FA      [19] 1583 	ld	h,-6 (ix)
   6D07 36 01         [10] 1584 	ld	(hl),#0x01
   6D09 C3 0E 6E      [10] 1585 	jp	00118$
   6D0C                    1586 00114$:
                           1587 ;src/main.c:328: if(enemy->iter > 0){
   6D0C AF            [ 4] 1588 	xor	a, a
   6D0D BB            [ 4] 1589 	cp	a, e
   6D0E 9A            [ 4] 1590 	sbc	a, d
   6D0F E2 14 6D      [10] 1591 	jp	PO, 00145$
   6D12 EE 80         [ 7] 1592 	xor	a, #0x80
   6D14                    1593 00145$:
   6D14 F2 F4 6D      [10] 1594 	jp	P,00111$
                           1595 ;src/main.c:329: if(enemy->iter == enemy->longitud_camino){
   6D17 DD 6E FD      [19] 1596 	ld	l,-3 (ix)
   6D1A DD 66 FE      [19] 1597 	ld	h,-2 (ix)
   6D1D 6E            [ 7] 1598 	ld	l,(hl)
   6D1E DD 75 FD      [19] 1599 	ld	-3 (ix),l
   6D21 DD 36 FE 00   [19] 1600 	ld	-2 (ix),#0x00
   6D25 7B            [ 4] 1601 	ld	a,e
   6D26 DD 96 FD      [19] 1602 	sub	a, -3 (ix)
   6D29 C2 B0 6D      [10] 1603 	jp	NZ,00108$
   6D2C 7A            [ 4] 1604 	ld	a,d
   6D2D DD 96 FE      [19] 1605 	sub	a, -2 (ix)
   6D30 C2 B0 6D      [10] 1606 	jp	NZ,00108$
                           1607 ;src/main.c:330: enemy->mover = SI;
   6D33 DD 6E F7      [19] 1608 	ld	l,-9 (ix)
   6D36 DD 66 F8      [19] 1609 	ld	h,-8 (ix)
   6D39 36 01         [10] 1610 	ld	(hl),#0x01
                           1611 ;src/main.c:331: enemy->iter = enemy->iter - 1;
   6D3B DD 6E FB      [19] 1612 	ld	l,-5 (ix)
   6D3E DD 66 FC      [19] 1613 	ld	h,-4 (ix)
   6D41 5E            [ 7] 1614 	ld	e,(hl)
   6D42 23            [ 6] 1615 	inc	hl
   6D43 56            [ 7] 1616 	ld	d,(hl)
   6D44 7B            [ 4] 1617 	ld	a,e
   6D45 C6 FF         [ 7] 1618 	add	a,#0xFF
   6D47 DD 77 FD      [19] 1619 	ld	-3 (ix),a
   6D4A 7A            [ 4] 1620 	ld	a,d
   6D4B CE FF         [ 7] 1621 	adc	a,#0xFF
   6D4D DD 77 FE      [19] 1622 	ld	-2 (ix),a
   6D50 DD 6E FB      [19] 1623 	ld	l,-5 (ix)
   6D53 DD 66 FC      [19] 1624 	ld	h,-4 (ix)
   6D56 DD 7E FD      [19] 1625 	ld	a,-3 (ix)
   6D59 77            [ 7] 1626 	ld	(hl),a
   6D5A 23            [ 6] 1627 	inc	hl
   6D5B DD 7E FE      [19] 1628 	ld	a,-2 (ix)
   6D5E 77            [ 7] 1629 	ld	(hl),a
                           1630 ;src/main.c:332: enemy->iter = enemy->iter - 2;
   6D5F DD 5E FD      [19] 1631 	ld	e,-3 (ix)
   6D62 DD 56 FE      [19] 1632 	ld	d,-2 (ix)
   6D65 1B            [ 6] 1633 	dec	de
   6D66 1B            [ 6] 1634 	dec	de
   6D67 DD 6E FB      [19] 1635 	ld	l,-5 (ix)
   6D6A DD 66 FC      [19] 1636 	ld	h,-4 (ix)
   6D6D 73            [ 7] 1637 	ld	(hl),e
   6D6E 23            [ 6] 1638 	inc	hl
   6D6F 72            [ 7] 1639 	ld	(hl),d
                           1640 ;src/main.c:333: enemy->y = enemy->camino[enemy->iter];
   6D70 DD 6E F5      [19] 1641 	ld	l,-11 (ix)
   6D73 DD 66 F6      [19] 1642 	ld	h,-10 (ix)
   6D76 19            [11] 1643 	add	hl,de
   6D77 5E            [ 7] 1644 	ld	e,(hl)
   6D78 E1            [10] 1645 	pop	hl
   6D79 E5            [11] 1646 	push	hl
   6D7A 73            [ 7] 1647 	ld	(hl),e
                           1648 ;src/main.c:334: --enemy->iter;
   6D7B DD 7E FD      [19] 1649 	ld	a,-3 (ix)
   6D7E C6 FD         [ 7] 1650 	add	a,#0xFD
   6D80 5F            [ 4] 1651 	ld	e,a
   6D81 DD 7E FE      [19] 1652 	ld	a,-2 (ix)
   6D84 CE FF         [ 7] 1653 	adc	a,#0xFF
   6D86 57            [ 4] 1654 	ld	d,a
   6D87 DD 6E FB      [19] 1655 	ld	l,-5 (ix)
   6D8A DD 66 FC      [19] 1656 	ld	h,-4 (ix)
   6D8D 73            [ 7] 1657 	ld	(hl),e
   6D8E 23            [ 6] 1658 	inc	hl
   6D8F 72            [ 7] 1659 	ld	(hl),d
                           1660 ;src/main.c:335: enemy->x = enemy->camino[enemy->iter];
   6D90 DD 6E F5      [19] 1661 	ld	l,-11 (ix)
   6D93 DD 66 F6      [19] 1662 	ld	h,-10 (ix)
   6D96 19            [11] 1663 	add	hl,de
   6D97 7E            [ 7] 1664 	ld	a,(hl)
   6D98 02            [ 7] 1665 	ld	(bc),a
                           1666 ;src/main.c:336: --enemy->iter;
   6D99 DD 7E FD      [19] 1667 	ld	a,-3 (ix)
   6D9C C6 FC         [ 7] 1668 	add	a,#0xFC
   6D9E 4F            [ 4] 1669 	ld	c,a
   6D9F DD 7E FE      [19] 1670 	ld	a,-2 (ix)
   6DA2 CE FF         [ 7] 1671 	adc	a,#0xFF
   6DA4 47            [ 4] 1672 	ld	b,a
   6DA5 DD 6E FB      [19] 1673 	ld	l,-5 (ix)
   6DA8 DD 66 FC      [19] 1674 	ld	h,-4 (ix)
   6DAB 71            [ 7] 1675 	ld	(hl),c
   6DAC 23            [ 6] 1676 	inc	hl
   6DAD 70            [ 7] 1677 	ld	(hl),b
   6DAE 18 5E         [12] 1678 	jr	00118$
   6DB0                    1679 00108$:
                           1680 ;src/main.c:338: enemy->mover = SI;
   6DB0 DD 6E F7      [19] 1681 	ld	l,-9 (ix)
   6DB3 DD 66 F8      [19] 1682 	ld	h,-8 (ix)
   6DB6 36 01         [10] 1683 	ld	(hl),#0x01
                           1684 ;src/main.c:339: enemy->y = enemy->camino[enemy->iter];
   6DB8 DD 6E FB      [19] 1685 	ld	l,-5 (ix)
   6DBB DD 66 FC      [19] 1686 	ld	h,-4 (ix)
   6DBE 5E            [ 7] 1687 	ld	e,(hl)
   6DBF 23            [ 6] 1688 	inc	hl
   6DC0 56            [ 7] 1689 	ld	d,(hl)
   6DC1 DD 6E F5      [19] 1690 	ld	l,-11 (ix)
   6DC4 DD 66 F6      [19] 1691 	ld	h,-10 (ix)
   6DC7 19            [11] 1692 	add	hl,de
   6DC8 5E            [ 7] 1693 	ld	e,(hl)
   6DC9 E1            [10] 1694 	pop	hl
   6DCA E5            [11] 1695 	push	hl
   6DCB 73            [ 7] 1696 	ld	(hl),e
                           1697 ;src/main.c:340: --enemy->iter;
   6DCC DD 6E FB      [19] 1698 	ld	l,-5 (ix)
   6DCF DD 66 FC      [19] 1699 	ld	h,-4 (ix)
   6DD2 5E            [ 7] 1700 	ld	e,(hl)
   6DD3 23            [ 6] 1701 	inc	hl
   6DD4 56            [ 7] 1702 	ld	d,(hl)
   6DD5 1B            [ 6] 1703 	dec	de
   6DD6 DD 6E FB      [19] 1704 	ld	l,-5 (ix)
   6DD9 DD 66 FC      [19] 1705 	ld	h,-4 (ix)
   6DDC 73            [ 7] 1706 	ld	(hl),e
   6DDD 23            [ 6] 1707 	inc	hl
   6DDE 72            [ 7] 1708 	ld	(hl),d
                           1709 ;src/main.c:341: enemy->x = enemy->camino[enemy->iter];
   6DDF DD 6E F5      [19] 1710 	ld	l,-11 (ix)
   6DE2 DD 66 F6      [19] 1711 	ld	h,-10 (ix)
   6DE5 19            [11] 1712 	add	hl,de
   6DE6 7E            [ 7] 1713 	ld	a,(hl)
   6DE7 02            [ 7] 1714 	ld	(bc),a
                           1715 ;src/main.c:342: --enemy->iter;
   6DE8 1B            [ 6] 1716 	dec	de
   6DE9 DD 6E FB      [19] 1717 	ld	l,-5 (ix)
   6DEC DD 66 FC      [19] 1718 	ld	h,-4 (ix)
   6DEF 73            [ 7] 1719 	ld	(hl),e
   6DF0 23            [ 6] 1720 	inc	hl
   6DF1 72            [ 7] 1721 	ld	(hl),d
   6DF2 18 1A         [12] 1722 	jr	00118$
   6DF4                    1723 00111$:
                           1724 ;src/main.c:346: enemy->mover = NO;
   6DF4 DD 6E F7      [19] 1725 	ld	l,-9 (ix)
   6DF7 DD 66 F8      [19] 1726 	ld	h,-8 (ix)
   6DFA 36 00         [10] 1727 	ld	(hl),#0x00
                           1728 ;src/main.c:347: enemy->iter = 0;
   6DFC DD 6E FB      [19] 1729 	ld	l,-5 (ix)
   6DFF DD 66 FC      [19] 1730 	ld	h,-4 (ix)
   6E02 AF            [ 4] 1731 	xor	a, a
   6E03 77            [ 7] 1732 	ld	(hl), a
   6E04 23            [ 6] 1733 	inc	hl
   6E05 77            [ 7] 1734 	ld	(hl), a
                           1735 ;src/main.c:348: enemy->reversePatrol = 0;
   6E06 DD 6E F9      [19] 1736 	ld	l,-7 (ix)
   6E09 DD 66 FA      [19] 1737 	ld	h,-6 (ix)
   6E0C 36 00         [10] 1738 	ld	(hl),#0x00
   6E0E                    1739 00118$:
   6E0E DD F9         [10] 1740 	ld	sp, ix
   6E10 DD E1         [14] 1741 	pop	ix
   6E12 C9            [10] 1742 	ret
                           1743 ;src/main.c:354: void lookFor(TEnemy* enemy){
                           1744 ;	---------------------------------
                           1745 ; Function lookFor
                           1746 ; ---------------------------------
   6E13                    1747 _lookFor::
   6E13 DD E5         [15] 1748 	push	ix
   6E15 DD 21 00 00   [14] 1749 	ld	ix,#0
   6E19 DD 39         [15] 1750 	add	ix,sp
   6E1B 21 F9 FF      [10] 1751 	ld	hl,#-7
   6E1E 39            [11] 1752 	add	hl,sp
   6E1F F9            [ 6] 1753 	ld	sp,hl
                           1754 ;src/main.c:360: i16 difx = abs((i16)(enemy->x - prota.x));
   6E20 DD 5E 04      [19] 1755 	ld	e,4 (ix)
   6E23 DD 56 05      [19] 1756 	ld	d,5 (ix)
   6E26 1A            [ 7] 1757 	ld	a,(de)
   6E27 4F            [ 4] 1758 	ld	c,a
   6E28 06 00         [ 7] 1759 	ld	b,#0x00
   6E2A 21 39 64      [10] 1760 	ld	hl,#_prota+0
   6E2D 6E            [ 7] 1761 	ld	l,(hl)
   6E2E 26 00         [ 7] 1762 	ld	h,#0x00
   6E30 79            [ 4] 1763 	ld	a,c
   6E31 95            [ 4] 1764 	sub	a, l
   6E32 4F            [ 4] 1765 	ld	c,a
   6E33 78            [ 4] 1766 	ld	a,b
   6E34 9C            [ 4] 1767 	sbc	a, h
   6E35 47            [ 4] 1768 	ld	b,a
   6E36 D5            [11] 1769 	push	de
   6E37 C5            [11] 1770 	push	bc
   6E38 CD B5 4B      [17] 1771 	call	_abs
   6E3B F1            [10] 1772 	pop	af
   6E3C D1            [10] 1773 	pop	de
   6E3D DD 75 FA      [19] 1774 	ld	-6 (ix),l
   6E40 DD 74 FB      [19] 1775 	ld	-5 (ix),h
                           1776 ;src/main.c:361: i16 dify = abs((i16)(enemy->y - prota.y));
   6E43 21 01 00      [10] 1777 	ld	hl,#0x0001
   6E46 19            [11] 1778 	add	hl,de
   6E47 DD 75 FE      [19] 1779 	ld	-2 (ix),l
   6E4A DD 74 FF      [19] 1780 	ld	-1 (ix),h
   6E4D DD 6E FE      [19] 1781 	ld	l,-2 (ix)
   6E50 DD 66 FF      [19] 1782 	ld	h,-1 (ix)
   6E53 4E            [ 7] 1783 	ld	c,(hl)
   6E54 06 00         [ 7] 1784 	ld	b,#0x00
   6E56 21 3A 64      [10] 1785 	ld	hl, #(_prota + 0x0001) + 0
   6E59 6E            [ 7] 1786 	ld	l,(hl)
   6E5A 26 00         [ 7] 1787 	ld	h,#0x00
   6E5C 79            [ 4] 1788 	ld	a,c
   6E5D 95            [ 4] 1789 	sub	a, l
   6E5E 4F            [ 4] 1790 	ld	c,a
   6E5F 78            [ 4] 1791 	ld	a,b
   6E60 9C            [ 4] 1792 	sbc	a, h
   6E61 47            [ 4] 1793 	ld	b,a
   6E62 D5            [11] 1794 	push	de
   6E63 C5            [11] 1795 	push	bc
   6E64 CD B5 4B      [17] 1796 	call	_abs
   6E67 F1            [10] 1797 	pop	af
   6E68 D1            [10] 1798 	pop	de
                           1799 ;src/main.c:363: dist = difx + dify; // manhattan
   6E69 DD 4E FA      [19] 1800 	ld	c,-6 (ix)
   6E6C 09            [11] 1801 	add	hl, bc
   6E6D DD 75 F9      [19] 1802 	ld	-7 (ix),l
                           1803 ;src/main.c:364: enemy->seen = NO;
   6E70 21 12 00      [10] 1804 	ld	hl,#0x0012
   6E73 19            [11] 1805 	add	hl,de
   6E74 DD 75 FC      [19] 1806 	ld	-4 (ix),l
   6E77 DD 74 FD      [19] 1807 	ld	-3 (ix),h
   6E7A DD 6E FC      [19] 1808 	ld	l,-4 (ix)
   6E7D DD 66 FD      [19] 1809 	ld	h,-3 (ix)
   6E80 36 00         [10] 1810 	ld	(hl),#0x00
                           1811 ;src/main.c:365: enemy->in_range = NO;
   6E82 21 11 00      [10] 1812 	ld	hl,#0x0011
   6E85 19            [11] 1813 	add	hl,de
   6E86 4D            [ 4] 1814 	ld	c,l
   6E87 44            [ 4] 1815 	ld	b,h
   6E88 AF            [ 4] 1816 	xor	a, a
   6E89 02            [ 7] 1817 	ld	(bc),a
                           1818 ;src/main.c:367: if(!enemy->seek){
   6E8A D5            [11] 1819 	push	de
   6E8B FD E1         [14] 1820 	pop	iy
   6E8D FD 7E 14      [19] 1821 	ld	a,20 (iy)
   6E90 B7            [ 4] 1822 	or	a, a
   6E91 C2 17 6F      [10] 1823 	jp	NZ,00111$
                           1824 ;src/main.c:368: if (dist <= 17) {// te detectan los sensores de proximidad
   6E94 3E 11         [ 7] 1825 	ld	a,#0x11
   6E96 DD 96 F9      [19] 1826 	sub	a, -7 (ix)
   6E99 38 13         [12] 1827 	jr	C,00107$
                           1828 ;src/main.c:369: enemy->in_range = 1;
   6E9B 3E 01         [ 7] 1829 	ld	a,#0x01
   6E9D 02            [ 7] 1830 	ld	(bc),a
                           1831 ;src/main.c:370: enemy->engage = 1;
   6E9E 21 16 00      [10] 1832 	ld	hl,#0x0016
   6EA1 19            [11] 1833 	add	hl,de
   6EA2 36 01         [10] 1834 	ld	(hl),#0x01
                           1835 ;src/main.c:371: enemy->seen = SI;
   6EA4 DD 6E FC      [19] 1836 	ld	l,-4 (ix)
   6EA7 DD 66 FD      [19] 1837 	ld	h,-3 (ix)
   6EAA 36 01         [10] 1838 	ld	(hl),#0x01
   6EAC 18 69         [12] 1839 	jr	00111$
   6EAE                    1840 00107$:
                           1841 ;src/main.c:372: }else if(prota.x > enemy->x - 20 && prota.x < enemy->x + 20
   6EAE 21 39 64      [10] 1842 	ld	hl, #_prota + 0
   6EB1 4E            [ 7] 1843 	ld	c,(hl)
   6EB2 1A            [ 7] 1844 	ld	a,(de)
   6EB3 5F            [ 4] 1845 	ld	e,a
   6EB4 16 00         [ 7] 1846 	ld	d,#0x00
   6EB6 7B            [ 4] 1847 	ld	a,e
   6EB7 C6 EC         [ 7] 1848 	add	a,#0xEC
   6EB9 6F            [ 4] 1849 	ld	l,a
   6EBA 7A            [ 4] 1850 	ld	a,d
   6EBB CE FF         [ 7] 1851 	adc	a,#0xFF
   6EBD 67            [ 4] 1852 	ld	h,a
   6EBE 06 00         [ 7] 1853 	ld	b,#0x00
   6EC0 7D            [ 4] 1854 	ld	a,l
   6EC1 91            [ 4] 1855 	sub	a, c
   6EC2 7C            [ 4] 1856 	ld	a,h
   6EC3 98            [ 4] 1857 	sbc	a, b
   6EC4 E2 C9 6E      [10] 1858 	jp	PO, 00137$
   6EC7 EE 80         [ 7] 1859 	xor	a, #0x80
   6EC9                    1860 00137$:
   6EC9 F2 17 6F      [10] 1861 	jp	P,00111$
   6ECC 21 14 00      [10] 1862 	ld	hl,#0x0014
   6ECF 19            [11] 1863 	add	hl,de
   6ED0 79            [ 4] 1864 	ld	a,c
   6ED1 95            [ 4] 1865 	sub	a, l
   6ED2 78            [ 4] 1866 	ld	a,b
   6ED3 9C            [ 4] 1867 	sbc	a, h
   6ED4 E2 D9 6E      [10] 1868 	jp	PO, 00138$
   6ED7 EE 80         [ 7] 1869 	xor	a, #0x80
   6ED9                    1870 00138$:
   6ED9 F2 17 6F      [10] 1871 	jp	P,00111$
                           1872 ;src/main.c:373: && prota.y > enemy->y - 20*2 && prota.y < enemy->y + 20*2){
   6EDC 21 3A 64      [10] 1873 	ld	hl, #(_prota + 0x0001) + 0
   6EDF 4E            [ 7] 1874 	ld	c,(hl)
   6EE0 DD 6E FE      [19] 1875 	ld	l,-2 (ix)
   6EE3 DD 66 FF      [19] 1876 	ld	h,-1 (ix)
   6EE6 5E            [ 7] 1877 	ld	e,(hl)
   6EE7 16 00         [ 7] 1878 	ld	d,#0x00
   6EE9 7B            [ 4] 1879 	ld	a,e
   6EEA C6 D8         [ 7] 1880 	add	a,#0xD8
   6EEC 6F            [ 4] 1881 	ld	l,a
   6EED 7A            [ 4] 1882 	ld	a,d
   6EEE CE FF         [ 7] 1883 	adc	a,#0xFF
   6EF0 67            [ 4] 1884 	ld	h,a
   6EF1 06 00         [ 7] 1885 	ld	b,#0x00
   6EF3 7D            [ 4] 1886 	ld	a,l
   6EF4 91            [ 4] 1887 	sub	a, c
   6EF5 7C            [ 4] 1888 	ld	a,h
   6EF6 98            [ 4] 1889 	sbc	a, b
   6EF7 E2 FC 6E      [10] 1890 	jp	PO, 00139$
   6EFA EE 80         [ 7] 1891 	xor	a, #0x80
   6EFC                    1892 00139$:
   6EFC F2 17 6F      [10] 1893 	jp	P,00111$
   6EFF 21 28 00      [10] 1894 	ld	hl,#0x0028
   6F02 19            [11] 1895 	add	hl,de
   6F03 79            [ 4] 1896 	ld	a,c
   6F04 95            [ 4] 1897 	sub	a, l
   6F05 78            [ 4] 1898 	ld	a,b
   6F06 9C            [ 4] 1899 	sbc	a, h
   6F07 E2 0C 6F      [10] 1900 	jp	PO, 00140$
   6F0A EE 80         [ 7] 1901 	xor	a, #0x80
   6F0C                    1902 00140$:
   6F0C F2 17 6F      [10] 1903 	jp	P,00111$
                           1904 ;src/main.c:374: enemy->seen = SI;
   6F0F DD 6E FC      [19] 1905 	ld	l,-4 (ix)
   6F12 DD 66 FD      [19] 1906 	ld	h,-3 (ix)
   6F15 36 01         [10] 1907 	ld	(hl),#0x01
   6F17                    1908 00111$:
   6F17 DD F9         [10] 1909 	ld	sp, ix
   6F19 DD E1         [14] 1910 	pop	ix
   6F1B C9            [10] 1911 	ret
                           1912 ;src/main.c:379: void moverEnemigoSeek(TEnemy* actual){
                           1913 ;	---------------------------------
                           1914 ; Function moverEnemigoSeek
                           1915 ; ---------------------------------
   6F1C                    1916 _moverEnemigoSeek::
   6F1C DD E5         [15] 1917 	push	ix
   6F1E DD 21 00 00   [14] 1918 	ld	ix,#0
   6F22 DD 39         [15] 1919 	add	ix,sp
   6F24 21 F6 FF      [10] 1920 	ld	hl,#-10
   6F27 39            [11] 1921 	add	hl,sp
   6F28 F9            [ 6] 1922 	ld	sp,hl
                           1923 ;src/main.c:381: if(!actual->muerto){
   6F29 DD 4E 04      [19] 1924 	ld	c,4 (ix)
   6F2C DD 46 05      [19] 1925 	ld	b,5 (ix)
   6F2F C5            [11] 1926 	push	bc
   6F30 FD E1         [14] 1927 	pop	iy
   6F32 FD 7E 08      [19] 1928 	ld	a, 8 (iy)
   6F35 B7            [ 4] 1929 	or	a, a
   6F36 C2 C9 70      [10] 1930 	jp	NZ,00114$
                           1931 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6F39 21 0E 00      [10] 1932 	ld	hl,#0x000E
   6F3C 09            [11] 1933 	add	hl,bc
   6F3D DD 75 FE      [19] 1934 	ld	-2 (ix),l
   6F40 DD 74 FF      [19] 1935 	ld	-1 (ix),h
   6F43 DD 6E FE      [19] 1936 	ld	l,-2 (ix)
   6F46 DD 66 FF      [19] 1937 	ld	h,-1 (ix)
   6F49 7E            [ 7] 1938 	ld	a,(hl)
   6F4A DD 77 FC      [19] 1939 	ld	-4 (ix),a
   6F4D 23            [ 6] 1940 	inc	hl
   6F4E 7E            [ 7] 1941 	ld	a,(hl)
   6F4F DD 77 FD      [19] 1942 	ld	-3 (ix),a
   6F52 69            [ 4] 1943 	ld	l, c
   6F53 60            [ 4] 1944 	ld	h, b
   6F54 11 E2 00      [10] 1945 	ld	de, #0x00E2
   6F57 19            [11] 1946 	add	hl, de
   6F58 5E            [ 7] 1947 	ld	e,(hl)
   6F59 16 00         [ 7] 1948 	ld	d,#0x00
                           1949 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6F5B 21 01 00      [10] 1950 	ld	hl,#0x0001
   6F5E 09            [11] 1951 	add	hl,bc
   6F5F DD 75 FA      [19] 1952 	ld	-6 (ix),l
   6F62 DD 74 FB      [19] 1953 	ld	-5 (ix),h
                           1954 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6F65 DD 7E FC      [19] 1955 	ld	a,-4 (ix)
   6F68 93            [ 4] 1956 	sub	a, e
   6F69 DD 7E FD      [19] 1957 	ld	a,-3 (ix)
   6F6C 9A            [ 4] 1958 	sbc	a, d
   6F6D E2 72 6F      [10] 1959 	jp	PO, 00136$
   6F70 EE 80         [ 7] 1960 	xor	a, #0x80
   6F72                    1961 00136$:
   6F72 F2 06 70      [10] 1962 	jp	P,00110$
                           1963 ;src/main.c:389: actual->mover = SI;
   6F75 21 06 00      [10] 1964 	ld	hl,#0x0006
   6F78 09            [11] 1965 	add	hl,bc
                           1966 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6F79 79            [ 4] 1967 	ld	a,c
   6F7A C6 1A         [ 7] 1968 	add	a, #0x1A
   6F7C 5F            [ 4] 1969 	ld	e,a
   6F7D 78            [ 4] 1970 	ld	a,b
   6F7E CE 00         [ 7] 1971 	adc	a, #0x00
   6F80 57            [ 4] 1972 	ld	d,a
                           1973 ;src/main.c:387: if(actual->iter == 0){
   6F81 DD 7E FD      [19] 1974 	ld	a,-3 (ix)
   6F84 DD B6 FC      [19] 1975 	or	a,-4 (ix)
   6F87 20 44         [12] 1976 	jr	NZ,00102$
                           1977 ;src/main.c:389: actual->mover = SI;
   6F89 36 01         [10] 1978 	ld	(hl),#0x01
                           1979 ;src/main.c:390: actual->iter = 2;
   6F8B DD 6E FE      [19] 1980 	ld	l,-2 (ix)
   6F8E DD 66 FF      [19] 1981 	ld	h,-1 (ix)
   6F91 36 02         [10] 1982 	ld	(hl),#0x02
   6F93 23            [ 6] 1983 	inc	hl
   6F94 36 00         [10] 1984 	ld	(hl),#0x00
                           1985 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6F96 DD 6E FE      [19] 1986 	ld	l,-2 (ix)
   6F99 DD 66 FF      [19] 1987 	ld	h,-1 (ix)
   6F9C 7E            [ 7] 1988 	ld	a, (hl)
   6F9D 23            [ 6] 1989 	inc	hl
   6F9E 66            [ 7] 1990 	ld	h,(hl)
   6F9F 6F            [ 4] 1991 	ld	l,a
   6FA0 19            [11] 1992 	add	hl,de
   6FA1 7E            [ 7] 1993 	ld	a,(hl)
   6FA2 02            [ 7] 1994 	ld	(bc),a
                           1995 ;src/main.c:392: ++actual->iter;
   6FA3 DD 6E FE      [19] 1996 	ld	l,-2 (ix)
   6FA6 DD 66 FF      [19] 1997 	ld	h,-1 (ix)
   6FA9 4E            [ 7] 1998 	ld	c,(hl)
   6FAA 23            [ 6] 1999 	inc	hl
   6FAB 46            [ 7] 2000 	ld	b,(hl)
   6FAC 03            [ 6] 2001 	inc	bc
   6FAD DD 6E FE      [19] 2002 	ld	l,-2 (ix)
   6FB0 DD 66 FF      [19] 2003 	ld	h,-1 (ix)
   6FB3 71            [ 7] 2004 	ld	(hl),c
   6FB4 23            [ 6] 2005 	inc	hl
   6FB5 70            [ 7] 2006 	ld	(hl),b
                           2007 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6FB6 EB            [ 4] 2008 	ex	de,hl
   6FB7 09            [11] 2009 	add	hl,bc
   6FB8 5E            [ 7] 2010 	ld	e,(hl)
   6FB9 DD 6E FA      [19] 2011 	ld	l,-6 (ix)
   6FBC DD 66 FB      [19] 2012 	ld	h,-5 (ix)
   6FBF 73            [ 7] 2013 	ld	(hl),e
                           2014 ;src/main.c:394: ++actual->iter;
   6FC0 03            [ 6] 2015 	inc	bc
   6FC1 DD 6E FE      [19] 2016 	ld	l,-2 (ix)
   6FC4 DD 66 FF      [19] 2017 	ld	h,-1 (ix)
   6FC7 71            [ 7] 2018 	ld	(hl),c
   6FC8 23            [ 6] 2019 	inc	hl
   6FC9 70            [ 7] 2020 	ld	(hl),b
   6FCA C3 C9 70      [10] 2021 	jp	00114$
   6FCD                    2022 00102$:
                           2023 ;src/main.c:397: actual->mover = SI;
   6FCD 36 01         [10] 2024 	ld	(hl),#0x01
                           2025 ;src/main.c:398: actual->x = actual->camino[actual->iter];
   6FCF DD 6E FE      [19] 2026 	ld	l,-2 (ix)
   6FD2 DD 66 FF      [19] 2027 	ld	h,-1 (ix)
   6FD5 7E            [ 7] 2028 	ld	a, (hl)
   6FD6 23            [ 6] 2029 	inc	hl
   6FD7 66            [ 7] 2030 	ld	h,(hl)
   6FD8 6F            [ 4] 2031 	ld	l,a
   6FD9 19            [11] 2032 	add	hl,de
   6FDA 7E            [ 7] 2033 	ld	a,(hl)
   6FDB 02            [ 7] 2034 	ld	(bc),a
                           2035 ;src/main.c:399: ++actual->iter;
   6FDC DD 6E FE      [19] 2036 	ld	l,-2 (ix)
   6FDF DD 66 FF      [19] 2037 	ld	h,-1 (ix)
   6FE2 4E            [ 7] 2038 	ld	c,(hl)
   6FE3 23            [ 6] 2039 	inc	hl
   6FE4 46            [ 7] 2040 	ld	b,(hl)
   6FE5 03            [ 6] 2041 	inc	bc
   6FE6 DD 6E FE      [19] 2042 	ld	l,-2 (ix)
   6FE9 DD 66 FF      [19] 2043 	ld	h,-1 (ix)
   6FEC 71            [ 7] 2044 	ld	(hl),c
   6FED 23            [ 6] 2045 	inc	hl
   6FEE 70            [ 7] 2046 	ld	(hl),b
                           2047 ;src/main.c:400: actual->y = actual->camino[actual->iter];
   6FEF EB            [ 4] 2048 	ex	de,hl
   6FF0 09            [11] 2049 	add	hl,bc
   6FF1 5E            [ 7] 2050 	ld	e,(hl)
   6FF2 DD 6E FA      [19] 2051 	ld	l,-6 (ix)
   6FF5 DD 66 FB      [19] 2052 	ld	h,-5 (ix)
   6FF8 73            [ 7] 2053 	ld	(hl),e
                           2054 ;src/main.c:401: ++actual->iter;
   6FF9 03            [ 6] 2055 	inc	bc
   6FFA DD 6E FE      [19] 2056 	ld	l,-2 (ix)
   6FFD DD 66 FF      [19] 2057 	ld	h,-1 (ix)
   7000 71            [ 7] 2058 	ld	(hl),c
   7001 23            [ 6] 2059 	inc	hl
   7002 70            [ 7] 2060 	ld	(hl),b
   7003 C3 C9 70      [10] 2061 	jp	00114$
   7006                    2062 00110$:
                           2063 ;src/main.c:407: actual->seek = 0;
   7006 21 14 00      [10] 2064 	ld	hl,#0x0014
   7009 09            [11] 2065 	add	hl,bc
   700A DD 75 FC      [19] 2066 	ld	-4 (ix),l
   700D DD 74 FD      [19] 2067 	ld	-3 (ix),h
   7010 DD 6E FC      [19] 2068 	ld	l,-4 (ix)
   7013 DD 66 FD      [19] 2069 	ld	h,-3 (ix)
   7016 36 00         [10] 2070 	ld	(hl),#0x00
                           2071 ;src/main.c:408: lookFor(actual);
   7018 C5            [11] 2072 	push	bc
   7019 C5            [11] 2073 	push	bc
   701A CD 13 6E      [17] 2074 	call	_lookFor
   701D F1            [10] 2075 	pop	af
   701E C1            [10] 2076 	pop	bc
                           2077 ;src/main.c:409: if(!actual->seen){
   701F 69            [ 4] 2078 	ld	l, c
   7020 60            [ 4] 2079 	ld	h, b
   7021 11 12 00      [10] 2080 	ld	de, #0x0012
   7024 19            [11] 2081 	add	hl, de
   7025 7E            [ 7] 2082 	ld	a,(hl)
   7026 DD 77 F9      [19] 2083 	ld	-7 (ix),a
                           2084 ;src/main.c:410: actual->patrolling = 1;
   7029 21 0B 00      [10] 2085 	ld	hl,#0x000B
   702C 09            [11] 2086 	add	hl,bc
   702D DD 75 F7      [19] 2087 	ld	-9 (ix),l
   7030 DD 74 F8      [19] 2088 	ld	-8 (ix),h
                           2089 ;src/main.c:409: if(!actual->seen){
   7033 DD 7E F9      [19] 2090 	ld	a,-7 (ix)
   7036 B7            [ 4] 2091 	or	a, a
   7037 20 3C         [12] 2092 	jr	NZ,00107$
                           2093 ;src/main.c:410: actual->patrolling = 1;
   7039 DD 6E F7      [19] 2094 	ld	l,-9 (ix)
   703C DD 66 F8      [19] 2095 	ld	h,-8 (ix)
   703F 36 01         [10] 2096 	ld	(hl),#0x01
                           2097 ;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7041 C5            [11] 2098 	push	bc
   7042 FD E1         [14] 2099 	pop	iy
   7044 FD 7E 18      [19] 2100 	ld	a,24 (iy)
   7047 DD 77 F9      [19] 2101 	ld	-7 (ix),a
   704A C5            [11] 2102 	push	bc
   704B FD E1         [14] 2103 	pop	iy
   704D FD 56 17      [19] 2104 	ld	d,23 (iy)
   7050 DD 6E FA      [19] 2105 	ld	l,-6 (ix)
   7053 DD 66 FB      [19] 2106 	ld	h,-5 (ix)
   7056 5E            [ 7] 2107 	ld	e,(hl)
   7057 0A            [ 7] 2108 	ld	a,(bc)
   7058 DD 77 F6      [19] 2109 	ld	-10 (ix),a
   705B 2A 1B 65      [16] 2110 	ld	hl,(_mapa)
   705E E5            [11] 2111 	push	hl
   705F C5            [11] 2112 	push	bc
   7060 DD 7E F9      [19] 2113 	ld	a,-7 (ix)
   7063 F5            [11] 2114 	push	af
   7064 33            [ 6] 2115 	inc	sp
   7065 D5            [11] 2116 	push	de
   7066 DD 7E F6      [19] 2117 	ld	a,-10 (ix)
   7069 F5            [11] 2118 	push	af
   706A 33            [ 6] 2119 	inc	sp
   706B CD 72 49      [17] 2120 	call	_pathFinding
   706E 21 08 00      [10] 2121 	ld	hl,#8
   7071 39            [11] 2122 	add	hl,sp
   7072 F9            [ 6] 2123 	ld	sp,hl
   7073 18 4A         [12] 2124 	jr	00108$
   7075                    2125 00107$:
                           2126 ;src/main.c:413: actual->patrolling = 0;
   7075 DD 6E F7      [19] 2127 	ld	l,-9 (ix)
   7078 DD 66 F8      [19] 2128 	ld	h,-8 (ix)
   707B 36 00         [10] 2129 	ld	(hl),#0x00
                           2130 ;src/main.c:414: if(!actual->engage){
   707D C5            [11] 2131 	push	bc
   707E FD E1         [14] 2132 	pop	iy
   7080 FD 7E 16      [19] 2133 	ld	a,22 (iy)
   7083 B7            [ 4] 2134 	or	a, a
   7084 20 39         [12] 2135 	jr	NZ,00108$
                           2136 ;src/main.c:415: actual->seek = 1;
   7086 DD 6E FC      [19] 2137 	ld	l,-4 (ix)
   7089 DD 66 FD      [19] 2138 	ld	h,-3 (ix)
   708C 36 01         [10] 2139 	ld	(hl),#0x01
                           2140 ;src/main.c:416: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   708E 3A 3A 64      [13] 2141 	ld	a,(#_prota + 1)
   7091 DD 77 F6      [19] 2142 	ld	-10 (ix),a
   7094 21 39 64      [10] 2143 	ld	hl, #_prota + 0
   7097 5E            [ 7] 2144 	ld	e,(hl)
   7098 DD 6E FA      [19] 2145 	ld	l,-6 (ix)
   709B DD 66 FB      [19] 2146 	ld	h,-5 (ix)
   709E 56            [ 7] 2147 	ld	d,(hl)
   709F 0A            [ 7] 2148 	ld	a,(bc)
   70A0 DD 77 F7      [19] 2149 	ld	-9 (ix),a
   70A3 2A 1B 65      [16] 2150 	ld	hl,(_mapa)
   70A6 E5            [11] 2151 	push	hl
   70A7 C5            [11] 2152 	push	bc
   70A8 DD 7E F6      [19] 2153 	ld	a,-10 (ix)
   70AB F5            [11] 2154 	push	af
   70AC 33            [ 6] 2155 	inc	sp
   70AD 7B            [ 4] 2156 	ld	a,e
   70AE F5            [11] 2157 	push	af
   70AF 33            [ 6] 2158 	inc	sp
   70B0 D5            [11] 2159 	push	de
   70B1 33            [ 6] 2160 	inc	sp
   70B2 DD 7E F7      [19] 2161 	ld	a,-9 (ix)
   70B5 F5            [11] 2162 	push	af
   70B6 33            [ 6] 2163 	inc	sp
   70B7 CD 72 49      [17] 2164 	call	_pathFinding
   70BA 21 08 00      [10] 2165 	ld	hl,#8
   70BD 39            [11] 2166 	add	hl,sp
   70BE F9            [ 6] 2167 	ld	sp,hl
   70BF                    2168 00108$:
                           2169 ;src/main.c:419: actual->iter = 0;
   70BF DD 6E FE      [19] 2170 	ld	l,-2 (ix)
   70C2 DD 66 FF      [19] 2171 	ld	h,-1 (ix)
   70C5 AF            [ 4] 2172 	xor	a, a
   70C6 77            [ 7] 2173 	ld	(hl), a
   70C7 23            [ 6] 2174 	inc	hl
   70C8 77            [ 7] 2175 	ld	(hl), a
   70C9                    2176 00114$:
   70C9 DD F9         [10] 2177 	ld	sp, ix
   70CB DD E1         [14] 2178 	pop	ix
   70CD C9            [10] 2179 	ret
                           2180 ;src/main.c:425: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2181 ;	---------------------------------
                           2182 ; Function engage
                           2183 ; ---------------------------------
   70CE                    2184 _engage::
   70CE DD E5         [15] 2185 	push	ix
   70D0 DD 21 00 00   [14] 2186 	ld	ix,#0
   70D4 DD 39         [15] 2187 	add	ix,sp
   70D6 21 ED FF      [10] 2188 	ld	hl,#-19
   70D9 39            [11] 2189 	add	hl,sp
   70DA F9            [ 6] 2190 	ld	sp,hl
                           2191 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70DB DD 7E 04      [19] 2192 	ld	a,4 (ix)
   70DE DD 77 F1      [19] 2193 	ld	-15 (ix),a
   70E1 DD 7E 05      [19] 2194 	ld	a,5 (ix)
   70E4 DD 77 F2      [19] 2195 	ld	-14 (ix),a
   70E7 DD 6E F1      [19] 2196 	ld	l,-15 (ix)
   70EA DD 66 F2      [19] 2197 	ld	h,-14 (ix)
   70ED 4E            [ 7] 2198 	ld	c,(hl)
   70EE 06 00         [ 7] 2199 	ld	b,#0x00
   70F0 21 39 64      [10] 2200 	ld	hl,#_prota+0
   70F3 5E            [ 7] 2201 	ld	e,(hl)
   70F4 16 00         [ 7] 2202 	ld	d,#0x00
   70F6 79            [ 4] 2203 	ld	a,c
   70F7 93            [ 4] 2204 	sub	a, e
   70F8 4F            [ 4] 2205 	ld	c,a
   70F9 78            [ 4] 2206 	ld	a,b
   70FA 9A            [ 4] 2207 	sbc	a, d
   70FB 47            [ 4] 2208 	ld	b,a
   70FC C5            [11] 2209 	push	bc
   70FD CD B5 4B      [17] 2210 	call	_abs
   7100 F1            [10] 2211 	pop	af
   7101 4D            [ 4] 2212 	ld	c,l
                           2213 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   7102 DD 7E F1      [19] 2214 	ld	a,-15 (ix)
   7105 C6 01         [ 7] 2215 	add	a, #0x01
   7107 DD 77 F3      [19] 2216 	ld	-13 (ix),a
   710A DD 7E F2      [19] 2217 	ld	a,-14 (ix)
   710D CE 00         [ 7] 2218 	adc	a, #0x00
   710F DD 77 F4      [19] 2219 	ld	-12 (ix),a
   7112 DD 6E F3      [19] 2220 	ld	l,-13 (ix)
   7115 DD 66 F4      [19] 2221 	ld	h,-12 (ix)
   7118 5E            [ 7] 2222 	ld	e,(hl)
   7119 16 00         [ 7] 2223 	ld	d,#0x00
   711B 21 3A 64      [10] 2224 	ld	hl, #_prota + 1
   711E 6E            [ 7] 2225 	ld	l,(hl)
   711F 26 00         [ 7] 2226 	ld	h,#0x00
   7121 7B            [ 4] 2227 	ld	a,e
   7122 95            [ 4] 2228 	sub	a, l
   7123 5F            [ 4] 2229 	ld	e,a
   7124 7A            [ 4] 2230 	ld	a,d
   7125 9C            [ 4] 2231 	sbc	a, h
   7126 57            [ 4] 2232 	ld	d,a
   7127 C5            [11] 2233 	push	bc
   7128 D5            [11] 2234 	push	de
   7129 CD B5 4B      [17] 2235 	call	_abs
   712C F1            [10] 2236 	pop	af
   712D C1            [10] 2237 	pop	bc
                           2238 ;src/main.c:428: u8 dist = difx + dify; // manhattan
   712E 09            [11] 2239 	add	hl, bc
   712F DD 75 ED      [19] 2240 	ld	-19 (ix),l
                           2241 ;src/main.c:430: u8 movX = 0;
   7132 DD 36 F0 00   [19] 2242 	ld	-16 (ix),#0x00
                           2243 ;src/main.c:431: u8 movY = 0;
   7136 DD 36 EF 00   [19] 2244 	ld	-17 (ix),#0x00
                           2245 ;src/main.c:432: u8 distConstraint = 25;
   713A DD 36 EE 19   [19] 2246 	ld	-18 (ix),#0x19
                           2247 ;src/main.c:433: enemy->mover = NO;
   713E DD 7E F1      [19] 2248 	ld	a,-15 (ix)
   7141 C6 06         [ 7] 2249 	add	a, #0x06
   7143 DD 77 F5      [19] 2250 	ld	-11 (ix),a
   7146 DD 7E F2      [19] 2251 	ld	a,-14 (ix)
   7149 CE 00         [ 7] 2252 	adc	a, #0x00
   714B DD 77 F6      [19] 2253 	ld	-10 (ix),a
   714E DD 6E F5      [19] 2254 	ld	l,-11 (ix)
   7151 DD 66 F6      [19] 2255 	ld	h,-10 (ix)
   7154 36 00         [10] 2256 	ld	(hl),#0x00
                           2257 ;src/main.c:442: enemy->patrolling = 1;
   7156 DD 7E F1      [19] 2258 	ld	a,-15 (ix)
   7159 C6 0B         [ 7] 2259 	add	a, #0x0B
   715B 4F            [ 4] 2260 	ld	c,a
   715C DD 7E F2      [19] 2261 	ld	a,-14 (ix)
   715F CE 00         [ 7] 2262 	adc	a, #0x00
   7161 47            [ 4] 2263 	ld	b,a
                           2264 ;src/main.c:435: if (dist < 20) {
   7162 DD 7E ED      [19] 2265 	ld	a,-19 (ix)
   7165 D6 14         [ 7] 2266 	sub	a, #0x14
   7167 30 29         [12] 2267 	jr	NC,00104$
                           2268 ;src/main.c:436: vidas--;
   7169 21 50 64      [10] 2269 	ld	hl, #_vidas+0
   716C 35            [11] 2270 	dec	(hl)
                           2271 ;src/main.c:437: if (vidas == 1) {
   716D 3A 50 64      [13] 2272 	ld	a,(#_vidas + 0)
   7170 3D            [ 4] 2273 	dec	a
   7171 20 0E         [12] 2274 	jr	NZ,00102$
                           2275 ;src/main.c:438: menuFin(puntuacion);
   7173 FD 21 1E 65   [14] 2276 	ld	iy,#_puntuacion
   7177 FD 6E 00      [19] 2277 	ld	l,0 (iy)
   717A 26 00         [ 7] 2278 	ld	h,#0x00
   717C C5            [11] 2279 	push	bc
   717D CD F5 4B      [17] 2280 	call	_menuFin
   7180 C1            [10] 2281 	pop	bc
   7181                    2282 00102$:
                           2283 ;src/main.c:442: enemy->patrolling = 1;
   7181 3E 01         [ 7] 2284 	ld	a,#0x01
   7183 02            [ 7] 2285 	ld	(bc),a
                           2286 ;src/main.c:443: enemy->engage = 0;
   7184 DD 7E F1      [19] 2287 	ld	a,-15 (ix)
   7187 C6 16         [ 7] 2288 	add	a, #0x16
   7189 5F            [ 4] 2289 	ld	e,a
   718A DD 7E F2      [19] 2290 	ld	a,-14 (ix)
   718D CE 00         [ 7] 2291 	adc	a, #0x00
   718F 57            [ 4] 2292 	ld	d,a
   7190 AF            [ 4] 2293 	xor	a, a
   7191 12            [ 7] 2294 	ld	(de),a
   7192                    2295 00104$:
                           2296 ;src/main.c:446: if (!enemy->patrolling) {
   7192 0A            [ 7] 2297 	ld	a,(bc)
   7193 DD 77 F7      [19] 2298 	ld	-9 (ix), a
   7196 B7            [ 4] 2299 	or	a, a
   7197 C2 4E 79      [10] 2300 	jp	NZ,00205$
                           2301 ;src/main.c:447: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   719A DD 6E F3      [19] 2302 	ld	l,-13 (ix)
   719D DD 66 F4      [19] 2303 	ld	h,-12 (ix)
   71A0 7E            [ 7] 2304 	ld	a,(hl)
   71A1 DD 77 F7      [19] 2305 	ld	-9 (ix),a
                           2306 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71A4 DD 6E F1      [19] 2307 	ld	l,-15 (ix)
   71A7 DD 66 F2      [19] 2308 	ld	h,-14 (ix)
   71AA 7E            [ 7] 2309 	ld	a,(hl)
                           2310 ;src/main.c:460: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   71AB DD 77 F8      [19] 2311 	ld	-8 (ix), a
   71AE C6 04         [ 7] 2312 	add	a, #0x04
   71B0 DD 77 F9      [19] 2313 	ld	-7 (ix),a
                           2314 ;src/main.c:447: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   71B3 DD 7E F7      [19] 2315 	ld	a,-9 (ix)
   71B6 DD 96 07      [19] 2316 	sub	a, 7 (ix)
   71B9 28 2B         [12] 2317 	jr	Z,00198$
   71BB DD 4E 07      [19] 2318 	ld	c,7 (ix)
   71BE 06 00         [ 7] 2319 	ld	b,#0x00
   71C0 21 01 00      [10] 2320 	ld	hl,#0x0001
   71C3 09            [11] 2321 	add	hl,bc
   71C4 DD 75 FA      [19] 2322 	ld	-6 (ix),l
   71C7 DD 74 FB      [19] 2323 	ld	-5 (ix),h
   71CA DD 5E F7      [19] 2324 	ld	e,-9 (ix)
   71CD 16 00         [ 7] 2325 	ld	d,#0x00
   71CF 7B            [ 4] 2326 	ld	a,e
   71D0 DD 96 FA      [19] 2327 	sub	a, -6 (ix)
   71D3 20 06         [12] 2328 	jr	NZ,00442$
   71D5 7A            [ 4] 2329 	ld	a,d
   71D6 DD 96 FB      [19] 2330 	sub	a, -5 (ix)
   71D9 28 0B         [12] 2331 	jr	Z,00198$
   71DB                    2332 00442$:
   71DB 0B            [ 6] 2333 	dec	bc
   71DC 7B            [ 4] 2334 	ld	a,e
   71DD 91            [ 4] 2335 	sub	a, c
   71DE C2 EA 72      [10] 2336 	jp	NZ,00199$
   71E1 7A            [ 4] 2337 	ld	a,d
   71E2 90            [ 4] 2338 	sub	a, b
   71E3 C2 EA 72      [10] 2339 	jp	NZ,00199$
   71E6                    2340 00198$:
                           2341 ;src/main.c:448: if (dx < enemy->x) { // izquierda
   71E6 DD 7E 06      [19] 2342 	ld	a,6 (ix)
   71E9 DD 96 F8      [19] 2343 	sub	a, -8 (ix)
   71EC 30 79         [12] 2344 	jr	NC,00118$
                           2345 ;src/main.c:449: if (dist > 11) {
   71EE 3E 0B         [ 7] 2346 	ld	a,#0x0B
   71F0 DD 96 ED      [19] 2347 	sub	a, -19 (ix)
   71F3 D2 4E 79      [10] 2348 	jp	NC,00205$
                           2349 ;src/main.c:450: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   71F6 DD 66 F7      [19] 2350 	ld	h,-9 (ix)
   71F9 DD 6E F8      [19] 2351 	ld	l,-8 (ix)
   71FC E5            [11] 2352 	push	hl
   71FD 2A 1B 65      [16] 2353 	ld	hl,(_mapa)
   7200 E5            [11] 2354 	push	hl
   7201 CD 71 4B      [17] 2355 	call	_getTilePtr
   7204 F1            [10] 2356 	pop	af
   7205 F1            [10] 2357 	pop	af
   7206 4E            [ 7] 2358 	ld	c,(hl)
   7207 3E 02         [ 7] 2359 	ld	a,#0x02
   7209 91            [ 4] 2360 	sub	a, c
   720A DA 4E 79      [10] 2361 	jp	C,00205$
                           2362 ;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   720D DD 6E F3      [19] 2363 	ld	l,-13 (ix)
   7210 DD 66 F4      [19] 2364 	ld	h,-12 (ix)
   7213 7E            [ 7] 2365 	ld	a,(hl)
   7214 C6 0B         [ 7] 2366 	add	a, #0x0B
   7216 47            [ 4] 2367 	ld	b,a
   7217 DD 6E F1      [19] 2368 	ld	l,-15 (ix)
   721A DD 66 F2      [19] 2369 	ld	h,-14 (ix)
   721D 4E            [ 7] 2370 	ld	c, (hl)
   721E C5            [11] 2371 	push	bc
   721F 2A 1B 65      [16] 2372 	ld	hl,(_mapa)
   7222 E5            [11] 2373 	push	hl
   7223 CD 71 4B      [17] 2374 	call	_getTilePtr
   7226 F1            [10] 2375 	pop	af
   7227 F1            [10] 2376 	pop	af
   7228 4E            [ 7] 2377 	ld	c,(hl)
   7229 3E 02         [ 7] 2378 	ld	a,#0x02
   722B 91            [ 4] 2379 	sub	a, c
   722C DA 4E 79      [10] 2380 	jp	C,00205$
                           2381 ;src/main.c:452: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   722F DD 6E F3      [19] 2382 	ld	l,-13 (ix)
   7232 DD 66 F4      [19] 2383 	ld	h,-12 (ix)
   7235 7E            [ 7] 2384 	ld	a,(hl)
   7236 C6 16         [ 7] 2385 	add	a, #0x16
   7238 47            [ 4] 2386 	ld	b,a
   7239 DD 6E F1      [19] 2387 	ld	l,-15 (ix)
   723C DD 66 F2      [19] 2388 	ld	h,-14 (ix)
   723F 4E            [ 7] 2389 	ld	c, (hl)
   7240 C5            [11] 2390 	push	bc
   7241 2A 1B 65      [16] 2391 	ld	hl,(_mapa)
   7244 E5            [11] 2392 	push	hl
   7245 CD 71 4B      [17] 2393 	call	_getTilePtr
   7248 F1            [10] 2394 	pop	af
   7249 F1            [10] 2395 	pop	af
   724A 4E            [ 7] 2396 	ld	c,(hl)
   724B 3E 02         [ 7] 2397 	ld	a,#0x02
   724D 91            [ 4] 2398 	sub	a, c
   724E DA 4E 79      [10] 2399 	jp	C,00205$
                           2400 ;src/main.c:453: moverEnemigoIzquierda(enemy);
   7251 DD 6E F1      [19] 2401 	ld	l,-15 (ix)
   7254 DD 66 F2      [19] 2402 	ld	h,-14 (ix)
   7257 E5            [11] 2403 	push	hl
   7258 CD B8 6B      [17] 2404 	call	_moverEnemigoIzquierda
   725B F1            [10] 2405 	pop	af
                           2406 ;src/main.c:455: enemy->mover = SI;
   725C DD 6E F5      [19] 2407 	ld	l,-11 (ix)
   725F DD 66 F6      [19] 2408 	ld	h,-10 (ix)
   7262 36 01         [10] 2409 	ld	(hl),#0x01
   7264 C3 4E 79      [10] 2410 	jp	00205$
   7267                    2411 00118$:
                           2412 ;src/main.c:459: if (dist > G_ENEMY_W + 3) {
   7267 3E 07         [ 7] 2413 	ld	a,#0x07
   7269 DD 96 ED      [19] 2414 	sub	a, -19 (ix)
   726C D2 4E 79      [10] 2415 	jp	NC,00205$
                           2416 ;src/main.c:460: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   726F DD 66 F7      [19] 2417 	ld	h,-9 (ix)
   7272 DD 6E F9      [19] 2418 	ld	l,-7 (ix)
   7275 E5            [11] 2419 	push	hl
   7276 2A 1B 65      [16] 2420 	ld	hl,(_mapa)
   7279 E5            [11] 2421 	push	hl
   727A CD 71 4B      [17] 2422 	call	_getTilePtr
   727D F1            [10] 2423 	pop	af
   727E F1            [10] 2424 	pop	af
   727F 4E            [ 7] 2425 	ld	c,(hl)
   7280 3E 02         [ 7] 2426 	ld	a,#0x02
   7282 91            [ 4] 2427 	sub	a, c
   7283 DA 4E 79      [10] 2428 	jp	C,00205$
                           2429 ;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7286 DD 6E F3      [19] 2430 	ld	l,-13 (ix)
   7289 DD 66 F4      [19] 2431 	ld	h,-12 (ix)
   728C 7E            [ 7] 2432 	ld	a,(hl)
   728D C6 0B         [ 7] 2433 	add	a, #0x0B
   728F 47            [ 4] 2434 	ld	b,a
   7290 DD 6E F1      [19] 2435 	ld	l,-15 (ix)
   7293 DD 66 F2      [19] 2436 	ld	h,-14 (ix)
   7296 7E            [ 7] 2437 	ld	a,(hl)
   7297 C6 04         [ 7] 2438 	add	a, #0x04
   7299 C5            [11] 2439 	push	bc
   729A 33            [ 6] 2440 	inc	sp
   729B F5            [11] 2441 	push	af
   729C 33            [ 6] 2442 	inc	sp
   729D 2A 1B 65      [16] 2443 	ld	hl,(_mapa)
   72A0 E5            [11] 2444 	push	hl
   72A1 CD 71 4B      [17] 2445 	call	_getTilePtr
   72A4 F1            [10] 2446 	pop	af
   72A5 F1            [10] 2447 	pop	af
   72A6 4E            [ 7] 2448 	ld	c,(hl)
   72A7 3E 02         [ 7] 2449 	ld	a,#0x02
   72A9 91            [ 4] 2450 	sub	a, c
   72AA DA 4E 79      [10] 2451 	jp	C,00205$
                           2452 ;src/main.c:462: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   72AD DD 6E F3      [19] 2453 	ld	l,-13 (ix)
   72B0 DD 66 F4      [19] 2454 	ld	h,-12 (ix)
   72B3 7E            [ 7] 2455 	ld	a,(hl)
   72B4 C6 16         [ 7] 2456 	add	a, #0x16
   72B6 47            [ 4] 2457 	ld	b,a
   72B7 DD 6E F1      [19] 2458 	ld	l,-15 (ix)
   72BA DD 66 F2      [19] 2459 	ld	h,-14 (ix)
   72BD 7E            [ 7] 2460 	ld	a,(hl)
   72BE C6 04         [ 7] 2461 	add	a, #0x04
   72C0 C5            [11] 2462 	push	bc
   72C1 33            [ 6] 2463 	inc	sp
   72C2 F5            [11] 2464 	push	af
   72C3 33            [ 6] 2465 	inc	sp
   72C4 2A 1B 65      [16] 2466 	ld	hl,(_mapa)
   72C7 E5            [11] 2467 	push	hl
   72C8 CD 71 4B      [17] 2468 	call	_getTilePtr
   72CB F1            [10] 2469 	pop	af
   72CC F1            [10] 2470 	pop	af
   72CD 4E            [ 7] 2471 	ld	c,(hl)
   72CE 3E 02         [ 7] 2472 	ld	a,#0x02
   72D0 91            [ 4] 2473 	sub	a, c
   72D1 DA 4E 79      [10] 2474 	jp	C,00205$
                           2475 ;src/main.c:463: moverEnemigoDerecha(enemy);
   72D4 DD 6E F1      [19] 2476 	ld	l,-15 (ix)
   72D7 DD 66 F2      [19] 2477 	ld	h,-14 (ix)
   72DA E5            [11] 2478 	push	hl
   72DB CD A8 6B      [17] 2479 	call	_moverEnemigoDerecha
   72DE F1            [10] 2480 	pop	af
                           2481 ;src/main.c:465: enemy->mover = SI;
   72DF DD 6E F5      [19] 2482 	ld	l,-11 (ix)
   72E2 DD 66 F6      [19] 2483 	ld	h,-10 (ix)
   72E5 36 01         [10] 2484 	ld	(hl),#0x01
   72E7 C3 4E 79      [10] 2485 	jp	00205$
   72EA                    2486 00199$:
                           2487 ;src/main.c:470: else if (enemy->x == dx) {
   72EA DD 7E F8      [19] 2488 	ld	a,-8 (ix)
   72ED DD 96 06      [19] 2489 	sub	a, 6 (ix)
   72F0 C2 07 74      [10] 2490 	jp	NZ,00196$
                           2491 ;src/main.c:471: if (dy < enemy->y) {
   72F3 DD 7E 07      [19] 2492 	ld	a,7 (ix)
   72F6 DD 96 F7      [19] 2493 	sub	a, -9 (ix)
   72F9 D2 80 73      [10] 2494 	jp	NC,00133$
                           2495 ;src/main.c:472: if (dist > G_HERO_H + 5) {
   72FC 3E 1B         [ 7] 2496 	ld	a,#0x1B
   72FE DD 96 ED      [19] 2497 	sub	a, -19 (ix)
   7301 D2 4E 79      [10] 2498 	jp	NC,00205$
                           2499 ;src/main.c:473: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7304 DD 46 F7      [19] 2500 	ld	b,-9 (ix)
   7307 05            [ 4] 2501 	dec	b
   7308 05            [ 4] 2502 	dec	b
   7309 C5            [11] 2503 	push	bc
   730A 33            [ 6] 2504 	inc	sp
   730B DD 7E F8      [19] 2505 	ld	a,-8 (ix)
   730E F5            [11] 2506 	push	af
   730F 33            [ 6] 2507 	inc	sp
   7310 2A 1B 65      [16] 2508 	ld	hl,(_mapa)
   7313 E5            [11] 2509 	push	hl
   7314 CD 71 4B      [17] 2510 	call	_getTilePtr
   7317 F1            [10] 2511 	pop	af
   7318 F1            [10] 2512 	pop	af
   7319 4E            [ 7] 2513 	ld	c,(hl)
   731A 3E 02         [ 7] 2514 	ld	a,#0x02
   731C 91            [ 4] 2515 	sub	a, c
   731D DA 4E 79      [10] 2516 	jp	C,00205$
                           2517 ;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7320 DD 6E F3      [19] 2518 	ld	l,-13 (ix)
   7323 DD 66 F4      [19] 2519 	ld	h,-12 (ix)
   7326 46            [ 7] 2520 	ld	b,(hl)
   7327 05            [ 4] 2521 	dec	b
   7328 05            [ 4] 2522 	dec	b
   7329 DD 6E F1      [19] 2523 	ld	l,-15 (ix)
   732C DD 66 F2      [19] 2524 	ld	h,-14 (ix)
   732F 56            [ 7] 2525 	ld	d,(hl)
   7330 14            [ 4] 2526 	inc	d
   7331 14            [ 4] 2527 	inc	d
   7332 4A            [ 4] 2528 	ld	c, d
   7333 C5            [11] 2529 	push	bc
   7334 2A 1B 65      [16] 2530 	ld	hl,(_mapa)
   7337 E5            [11] 2531 	push	hl
   7338 CD 71 4B      [17] 2532 	call	_getTilePtr
   733B F1            [10] 2533 	pop	af
   733C F1            [10] 2534 	pop	af
   733D 4E            [ 7] 2535 	ld	c,(hl)
   733E 3E 02         [ 7] 2536 	ld	a,#0x02
   7340 91            [ 4] 2537 	sub	a, c
   7341 DA 4E 79      [10] 2538 	jp	C,00205$
                           2539 ;src/main.c:475: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7344 DD 6E F3      [19] 2540 	ld	l,-13 (ix)
   7347 DD 66 F4      [19] 2541 	ld	h,-12 (ix)
   734A 46            [ 7] 2542 	ld	b,(hl)
   734B 05            [ 4] 2543 	dec	b
   734C 05            [ 4] 2544 	dec	b
   734D DD 6E F1      [19] 2545 	ld	l,-15 (ix)
   7350 DD 66 F2      [19] 2546 	ld	h,-14 (ix)
   7353 7E            [ 7] 2547 	ld	a,(hl)
   7354 C6 04         [ 7] 2548 	add	a, #0x04
   7356 C5            [11] 2549 	push	bc
   7357 33            [ 6] 2550 	inc	sp
   7358 F5            [11] 2551 	push	af
   7359 33            [ 6] 2552 	inc	sp
   735A 2A 1B 65      [16] 2553 	ld	hl,(_mapa)
   735D E5            [11] 2554 	push	hl
   735E CD 71 4B      [17] 2555 	call	_getTilePtr
   7361 F1            [10] 2556 	pop	af
   7362 F1            [10] 2557 	pop	af
   7363 4E            [ 7] 2558 	ld	c,(hl)
   7364 3E 02         [ 7] 2559 	ld	a,#0x02
   7366 91            [ 4] 2560 	sub	a, c
   7367 DA 4E 79      [10] 2561 	jp	C,00205$
                           2562 ;src/main.c:476: moverEnemigoArriba(enemy);
   736A DD 6E F1      [19] 2563 	ld	l,-15 (ix)
   736D DD 66 F2      [19] 2564 	ld	h,-14 (ix)
   7370 E5            [11] 2565 	push	hl
   7371 CD 6A 6B      [17] 2566 	call	_moverEnemigoArriba
   7374 F1            [10] 2567 	pop	af
                           2568 ;src/main.c:478: enemy->mover = SI;
   7375 DD 6E F5      [19] 2569 	ld	l,-11 (ix)
   7378 DD 66 F6      [19] 2570 	ld	h,-10 (ix)
   737B 36 01         [10] 2571 	ld	(hl),#0x01
   737D C3 4E 79      [10] 2572 	jp	00205$
   7380                    2573 00133$:
                           2574 ;src/main.c:482: if(dist > G_ENEMY_H + 7) {
   7380 3E 1D         [ 7] 2575 	ld	a,#0x1D
   7382 DD 96 ED      [19] 2576 	sub	a, -19 (ix)
   7385 D2 4E 79      [10] 2577 	jp	NC,00205$
                           2578 ;src/main.c:483: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7388 DD 7E F7      [19] 2579 	ld	a,-9 (ix)
   738B C6 18         [ 7] 2580 	add	a, #0x18
   738D 47            [ 4] 2581 	ld	b,a
   738E C5            [11] 2582 	push	bc
   738F 33            [ 6] 2583 	inc	sp
   7390 DD 7E F8      [19] 2584 	ld	a,-8 (ix)
   7393 F5            [11] 2585 	push	af
   7394 33            [ 6] 2586 	inc	sp
   7395 2A 1B 65      [16] 2587 	ld	hl,(_mapa)
   7398 E5            [11] 2588 	push	hl
   7399 CD 71 4B      [17] 2589 	call	_getTilePtr
   739C F1            [10] 2590 	pop	af
   739D F1            [10] 2591 	pop	af
   739E 4E            [ 7] 2592 	ld	c,(hl)
   739F 3E 02         [ 7] 2593 	ld	a,#0x02
   73A1 91            [ 4] 2594 	sub	a, c
   73A2 DA 4E 79      [10] 2595 	jp	C,00205$
                           2596 ;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   73A5 DD 6E F3      [19] 2597 	ld	l,-13 (ix)
   73A8 DD 66 F4      [19] 2598 	ld	h,-12 (ix)
   73AB 7E            [ 7] 2599 	ld	a,(hl)
   73AC C6 18         [ 7] 2600 	add	a, #0x18
   73AE 47            [ 4] 2601 	ld	b,a
   73AF DD 6E F1      [19] 2602 	ld	l,-15 (ix)
   73B2 DD 66 F2      [19] 2603 	ld	h,-14 (ix)
   73B5 56            [ 7] 2604 	ld	d,(hl)
   73B6 14            [ 4] 2605 	inc	d
   73B7 14            [ 4] 2606 	inc	d
   73B8 4A            [ 4] 2607 	ld	c, d
   73B9 C5            [11] 2608 	push	bc
   73BA 2A 1B 65      [16] 2609 	ld	hl,(_mapa)
   73BD E5            [11] 2610 	push	hl
   73BE CD 71 4B      [17] 2611 	call	_getTilePtr
   73C1 F1            [10] 2612 	pop	af
   73C2 F1            [10] 2613 	pop	af
   73C3 4E            [ 7] 2614 	ld	c,(hl)
   73C4 3E 02         [ 7] 2615 	ld	a,#0x02
   73C6 91            [ 4] 2616 	sub	a, c
   73C7 DA 4E 79      [10] 2617 	jp	C,00205$
                           2618 ;src/main.c:485: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   73CA DD 6E F3      [19] 2619 	ld	l,-13 (ix)
   73CD DD 66 F4      [19] 2620 	ld	h,-12 (ix)
   73D0 7E            [ 7] 2621 	ld	a,(hl)
   73D1 C6 18         [ 7] 2622 	add	a, #0x18
   73D3 47            [ 4] 2623 	ld	b,a
   73D4 DD 6E F1      [19] 2624 	ld	l,-15 (ix)
   73D7 DD 66 F2      [19] 2625 	ld	h,-14 (ix)
   73DA 7E            [ 7] 2626 	ld	a,(hl)
   73DB C6 04         [ 7] 2627 	add	a, #0x04
   73DD C5            [11] 2628 	push	bc
   73DE 33            [ 6] 2629 	inc	sp
   73DF F5            [11] 2630 	push	af
   73E0 33            [ 6] 2631 	inc	sp
   73E1 2A 1B 65      [16] 2632 	ld	hl,(_mapa)
   73E4 E5            [11] 2633 	push	hl
   73E5 CD 71 4B      [17] 2634 	call	_getTilePtr
   73E8 F1            [10] 2635 	pop	af
   73E9 F1            [10] 2636 	pop	af
   73EA 4E            [ 7] 2637 	ld	c,(hl)
   73EB 3E 02         [ 7] 2638 	ld	a,#0x02
   73ED 91            [ 4] 2639 	sub	a, c
   73EE DA 4E 79      [10] 2640 	jp	C,00205$
                           2641 ;src/main.c:486: moverEnemigoAbajo(enemy);
   73F1 DD 6E F1      [19] 2642 	ld	l,-15 (ix)
   73F4 DD 66 F2      [19] 2643 	ld	h,-14 (ix)
   73F7 E5            [11] 2644 	push	hl
   73F8 CD 89 6B      [17] 2645 	call	_moverEnemigoAbajo
   73FB F1            [10] 2646 	pop	af
                           2647 ;src/main.c:488: enemy->mover = SI;
   73FC DD 6E F5      [19] 2648 	ld	l,-11 (ix)
   73FF DD 66 F6      [19] 2649 	ld	h,-10 (ix)
   7402 36 01         [10] 2650 	ld	(hl),#0x01
   7404 C3 4E 79      [10] 2651 	jp	00205$
   7407                    2652 00196$:
                           2653 ;src/main.c:494: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7407 3A 3F 64      [13] 2654 	ld	a, (#_prota + 6)
   740A B7            [ 4] 2655 	or	a, a
   740B 20 04         [12] 2656 	jr	NZ,00136$
   740D DD 36 EE 14   [19] 2657 	ld	-18 (ix),#0x14
   7411                    2658 00136$:
                           2659 ;src/main.c:496: if (dist > distConstraint) {
   7411 DD 7E EE      [19] 2660 	ld	a,-18 (ix)
   7414 DD 96 ED      [19] 2661 	sub	a, -19 (ix)
   7417 D2 4E 79      [10] 2662 	jp	NC,00205$
                           2663 ;src/main.c:497: if (dx + 1 < enemy->x) {
   741A DD 4E 06      [19] 2664 	ld	c,6 (ix)
   741D 06 00         [ 7] 2665 	ld	b,#0x00
   741F 03            [ 6] 2666 	inc	bc
   7420 DD 71 FA      [19] 2667 	ld	-6 (ix),c
   7423 DD 70 FB      [19] 2668 	ld	-5 (ix),b
   7426 DD 7E F8      [19] 2669 	ld	a,-8 (ix)
   7429 DD 77 FC      [19] 2670 	ld	-4 (ix),a
   742C DD 36 FD 00   [19] 2671 	ld	-3 (ix),#0x00
   7430 DD 7E FA      [19] 2672 	ld	a,-6 (ix)
   7433 DD 96 FC      [19] 2673 	sub	a, -4 (ix)
   7436 DD 7E FB      [19] 2674 	ld	a,-5 (ix)
   7439 DD 9E FD      [19] 2675 	sbc	a, -3 (ix)
   743C E2 41 74      [10] 2676 	jp	PO, 00447$
   743F EE 80         [ 7] 2677 	xor	a, #0x80
   7441                    2678 00447$:
   7441 F2 D8 74      [10] 2679 	jp	P,00148$
                           2680 ;src/main.c:498: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7444 DD 66 F7      [19] 2681 	ld	h,-9 (ix)
   7447 DD 6E F8      [19] 2682 	ld	l,-8 (ix)
   744A E5            [11] 2683 	push	hl
   744B 2A 1B 65      [16] 2684 	ld	hl,(_mapa)
   744E E5            [11] 2685 	push	hl
   744F CD 71 4B      [17] 2686 	call	_getTilePtr
   7452 F1            [10] 2687 	pop	af
   7453 F1            [10] 2688 	pop	af
   7454 DD 74 FF      [19] 2689 	ld	-1 (ix),h
   7457 DD 75 FE      [19] 2690 	ld	-2 (ix), l
   745A DD 66 FF      [19] 2691 	ld	h,-1 (ix)
   745D 4E            [ 7] 2692 	ld	c,(hl)
   745E 3E 02         [ 7] 2693 	ld	a,#0x02
   7460 91            [ 4] 2694 	sub	a, c
   7461 DA 65 75      [10] 2695 	jp	C,00149$
                           2696 ;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7464 DD 6E F3      [19] 2697 	ld	l,-13 (ix)
   7467 DD 66 F4      [19] 2698 	ld	h,-12 (ix)
   746A 7E            [ 7] 2699 	ld	a,(hl)
   746B DD 77 FE      [19] 2700 	ld	-2 (ix), a
   746E C6 0B         [ 7] 2701 	add	a, #0x0B
   7470 DD 77 FE      [19] 2702 	ld	-2 (ix),a
   7473 DD 6E F1      [19] 2703 	ld	l,-15 (ix)
   7476 DD 66 F2      [19] 2704 	ld	h,-14 (ix)
   7479 46            [ 7] 2705 	ld	b,(hl)
   747A DD 7E FE      [19] 2706 	ld	a,-2 (ix)
   747D F5            [11] 2707 	push	af
   747E 33            [ 6] 2708 	inc	sp
   747F C5            [11] 2709 	push	bc
   7480 33            [ 6] 2710 	inc	sp
   7481 2A 1B 65      [16] 2711 	ld	hl,(_mapa)
   7484 E5            [11] 2712 	push	hl
   7485 CD 71 4B      [17] 2713 	call	_getTilePtr
   7488 F1            [10] 2714 	pop	af
   7489 F1            [10] 2715 	pop	af
   748A 4E            [ 7] 2716 	ld	c,(hl)
   748B 3E 02         [ 7] 2717 	ld	a,#0x02
   748D 91            [ 4] 2718 	sub	a, c
   748E DA 65 75      [10] 2719 	jp	C,00149$
                           2720 ;src/main.c:500: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7491 DD 6E F3      [19] 2721 	ld	l,-13 (ix)
   7494 DD 66 F4      [19] 2722 	ld	h,-12 (ix)
   7497 7E            [ 7] 2723 	ld	a,(hl)
   7498 DD 77 FE      [19] 2724 	ld	-2 (ix), a
   749B C6 16         [ 7] 2725 	add	a, #0x16
   749D DD 77 FE      [19] 2726 	ld	-2 (ix),a
   74A0 DD 6E F1      [19] 2727 	ld	l,-15 (ix)
   74A3 DD 66 F2      [19] 2728 	ld	h,-14 (ix)
   74A6 46            [ 7] 2729 	ld	b,(hl)
   74A7 DD 7E FE      [19] 2730 	ld	a,-2 (ix)
   74AA F5            [11] 2731 	push	af
   74AB 33            [ 6] 2732 	inc	sp
   74AC C5            [11] 2733 	push	bc
   74AD 33            [ 6] 2734 	inc	sp
   74AE 2A 1B 65      [16] 2735 	ld	hl,(_mapa)
   74B1 E5            [11] 2736 	push	hl
   74B2 CD 71 4B      [17] 2737 	call	_getTilePtr
   74B5 F1            [10] 2738 	pop	af
   74B6 F1            [10] 2739 	pop	af
   74B7 4E            [ 7] 2740 	ld	c,(hl)
   74B8 3E 02         [ 7] 2741 	ld	a,#0x02
   74BA 91            [ 4] 2742 	sub	a, c
   74BB DA 65 75      [10] 2743 	jp	C,00149$
                           2744 ;src/main.c:501: moverEnemigoIzquierda(enemy);
   74BE DD 6E F1      [19] 2745 	ld	l,-15 (ix)
   74C1 DD 66 F2      [19] 2746 	ld	h,-14 (ix)
   74C4 E5            [11] 2747 	push	hl
   74C5 CD B8 6B      [17] 2748 	call	_moverEnemigoIzquierda
   74C8 F1            [10] 2749 	pop	af
                           2750 ;src/main.c:502: movX = 1;
   74C9 DD 36 F0 01   [19] 2751 	ld	-16 (ix),#0x01
                           2752 ;src/main.c:503: enemy->mover = SI;
   74CD DD 6E F5      [19] 2753 	ld	l,-11 (ix)
   74D0 DD 66 F6      [19] 2754 	ld	h,-10 (ix)
   74D3 36 01         [10] 2755 	ld	(hl),#0x01
   74D5 C3 65 75      [10] 2756 	jp	00149$
   74D8                    2757 00148$:
                           2758 ;src/main.c:505: } else if (dx + 1 > enemy->x){
   74D8 DD 7E FC      [19] 2759 	ld	a,-4 (ix)
   74DB DD 96 FA      [19] 2760 	sub	a, -6 (ix)
   74DE DD 7E FD      [19] 2761 	ld	a,-3 (ix)
   74E1 DD 9E FB      [19] 2762 	sbc	a, -5 (ix)
   74E4 E2 E9 74      [10] 2763 	jp	PO, 00448$
   74E7 EE 80         [ 7] 2764 	xor	a, #0x80
   74E9                    2765 00448$:
   74E9 F2 65 75      [10] 2766 	jp	P,00149$
                           2767 ;src/main.c:506: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   74EC DD 66 F7      [19] 2768 	ld	h,-9 (ix)
   74EF DD 6E F9      [19] 2769 	ld	l,-7 (ix)
   74F2 E5            [11] 2770 	push	hl
   74F3 2A 1B 65      [16] 2771 	ld	hl,(_mapa)
   74F6 E5            [11] 2772 	push	hl
   74F7 CD 71 4B      [17] 2773 	call	_getTilePtr
   74FA F1            [10] 2774 	pop	af
   74FB F1            [10] 2775 	pop	af
   74FC 4E            [ 7] 2776 	ld	c,(hl)
   74FD 3E 02         [ 7] 2777 	ld	a,#0x02
   74FF 91            [ 4] 2778 	sub	a, c
   7500 38 63         [12] 2779 	jr	C,00149$
                           2780 ;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7502 DD 6E F3      [19] 2781 	ld	l,-13 (ix)
   7505 DD 66 F4      [19] 2782 	ld	h,-12 (ix)
   7508 7E            [ 7] 2783 	ld	a,(hl)
   7509 C6 0B         [ 7] 2784 	add	a, #0x0B
   750B 47            [ 4] 2785 	ld	b,a
   750C DD 6E F1      [19] 2786 	ld	l,-15 (ix)
   750F DD 66 F2      [19] 2787 	ld	h,-14 (ix)
   7512 7E            [ 7] 2788 	ld	a,(hl)
   7513 C6 04         [ 7] 2789 	add	a, #0x04
   7515 C5            [11] 2790 	push	bc
   7516 33            [ 6] 2791 	inc	sp
   7517 F5            [11] 2792 	push	af
   7518 33            [ 6] 2793 	inc	sp
   7519 2A 1B 65      [16] 2794 	ld	hl,(_mapa)
   751C E5            [11] 2795 	push	hl
   751D CD 71 4B      [17] 2796 	call	_getTilePtr
   7520 F1            [10] 2797 	pop	af
   7521 F1            [10] 2798 	pop	af
   7522 4E            [ 7] 2799 	ld	c,(hl)
   7523 3E 02         [ 7] 2800 	ld	a,#0x02
   7525 91            [ 4] 2801 	sub	a, c
   7526 38 3D         [12] 2802 	jr	C,00149$
                           2803 ;src/main.c:508: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7528 DD 6E F3      [19] 2804 	ld	l,-13 (ix)
   752B DD 66 F4      [19] 2805 	ld	h,-12 (ix)
   752E 7E            [ 7] 2806 	ld	a,(hl)
   752F C6 16         [ 7] 2807 	add	a, #0x16
   7531 47            [ 4] 2808 	ld	b,a
   7532 DD 6E F1      [19] 2809 	ld	l,-15 (ix)
   7535 DD 66 F2      [19] 2810 	ld	h,-14 (ix)
   7538 7E            [ 7] 2811 	ld	a,(hl)
   7539 C6 04         [ 7] 2812 	add	a, #0x04
   753B C5            [11] 2813 	push	bc
   753C 33            [ 6] 2814 	inc	sp
   753D F5            [11] 2815 	push	af
   753E 33            [ 6] 2816 	inc	sp
   753F 2A 1B 65      [16] 2817 	ld	hl,(_mapa)
   7542 E5            [11] 2818 	push	hl
   7543 CD 71 4B      [17] 2819 	call	_getTilePtr
   7546 F1            [10] 2820 	pop	af
   7547 F1            [10] 2821 	pop	af
   7548 4E            [ 7] 2822 	ld	c,(hl)
   7549 3E 02         [ 7] 2823 	ld	a,#0x02
   754B 91            [ 4] 2824 	sub	a, c
   754C 38 17         [12] 2825 	jr	C,00149$
                           2826 ;src/main.c:509: moverEnemigoDerecha(enemy);
   754E DD 6E F1      [19] 2827 	ld	l,-15 (ix)
   7551 DD 66 F2      [19] 2828 	ld	h,-14 (ix)
   7554 E5            [11] 2829 	push	hl
   7555 CD A8 6B      [17] 2830 	call	_moverEnemigoDerecha
   7558 F1            [10] 2831 	pop	af
                           2832 ;src/main.c:510: movX = 1;
   7559 DD 36 F0 01   [19] 2833 	ld	-16 (ix),#0x01
                           2834 ;src/main.c:511: enemy->mover = SI;
   755D DD 6E F5      [19] 2835 	ld	l,-11 (ix)
   7560 DD 66 F6      [19] 2836 	ld	h,-10 (ix)
   7563 36 01         [10] 2837 	ld	(hl),#0x01
   7565                    2838 00149$:
                           2839 ;src/main.c:514: if (dy < enemy->y) {
   7565 DD 6E F3      [19] 2840 	ld	l,-13 (ix)
   7568 DD 66 F4      [19] 2841 	ld	h,-12 (ix)
   756B 7E            [ 7] 2842 	ld	a,(hl)
   756C DD 77 FE      [19] 2843 	ld	-2 (ix),a
                           2844 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   756F DD 6E F1      [19] 2845 	ld	l,-15 (ix)
   7572 DD 66 F2      [19] 2846 	ld	h,-14 (ix)
   7575 7E            [ 7] 2847 	ld	a,(hl)
   7576 DD 77 FC      [19] 2848 	ld	-4 (ix),a
                           2849 ;src/main.c:514: if (dy < enemy->y) {
   7579 DD 7E 07      [19] 2850 	ld	a,7 (ix)
   757C DD 96 FE      [19] 2851 	sub	a, -2 (ix)
   757F D2 04 76      [10] 2852 	jp	NC,00159$
                           2853 ;src/main.c:515: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7582 DD 46 FE      [19] 2854 	ld	b,-2 (ix)
   7585 05            [ 4] 2855 	dec	b
   7586 05            [ 4] 2856 	dec	b
   7587 C5            [11] 2857 	push	bc
   7588 33            [ 6] 2858 	inc	sp
   7589 DD 7E FC      [19] 2859 	ld	a,-4 (ix)
   758C F5            [11] 2860 	push	af
   758D 33            [ 6] 2861 	inc	sp
   758E 2A 1B 65      [16] 2862 	ld	hl,(_mapa)
   7591 E5            [11] 2863 	push	hl
   7592 CD 71 4B      [17] 2864 	call	_getTilePtr
   7595 F1            [10] 2865 	pop	af
   7596 F1            [10] 2866 	pop	af
   7597 4E            [ 7] 2867 	ld	c,(hl)
   7598 3E 02         [ 7] 2868 	ld	a,#0x02
   759A 91            [ 4] 2869 	sub	a, c
   759B DA 83 76      [10] 2870 	jp	C,00160$
                           2871 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   759E DD 6E F3      [19] 2872 	ld	l,-13 (ix)
   75A1 DD 66 F4      [19] 2873 	ld	h,-12 (ix)
   75A4 56            [ 7] 2874 	ld	d,(hl)
   75A5 15            [ 4] 2875 	dec	d
   75A6 15            [ 4] 2876 	dec	d
   75A7 DD 6E F1      [19] 2877 	ld	l,-15 (ix)
   75AA DD 66 F2      [19] 2878 	ld	h,-14 (ix)
   75AD 46            [ 7] 2879 	ld	b,(hl)
   75AE 04            [ 4] 2880 	inc	b
   75AF 04            [ 4] 2881 	inc	b
   75B0 D5            [11] 2882 	push	de
   75B1 33            [ 6] 2883 	inc	sp
   75B2 C5            [11] 2884 	push	bc
   75B3 33            [ 6] 2885 	inc	sp
   75B4 2A 1B 65      [16] 2886 	ld	hl,(_mapa)
   75B7 E5            [11] 2887 	push	hl
   75B8 CD 71 4B      [17] 2888 	call	_getTilePtr
   75BB F1            [10] 2889 	pop	af
   75BC F1            [10] 2890 	pop	af
   75BD 4E            [ 7] 2891 	ld	c,(hl)
   75BE 3E 02         [ 7] 2892 	ld	a,#0x02
   75C0 91            [ 4] 2893 	sub	a, c
   75C1 DA 83 76      [10] 2894 	jp	C,00160$
                           2895 ;src/main.c:517: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   75C4 DD 6E F3      [19] 2896 	ld	l,-13 (ix)
   75C7 DD 66 F4      [19] 2897 	ld	h,-12 (ix)
   75CA 46            [ 7] 2898 	ld	b,(hl)
   75CB 05            [ 4] 2899 	dec	b
   75CC 05            [ 4] 2900 	dec	b
   75CD DD 6E F1      [19] 2901 	ld	l,-15 (ix)
   75D0 DD 66 F2      [19] 2902 	ld	h,-14 (ix)
   75D3 7E            [ 7] 2903 	ld	a,(hl)
   75D4 C6 04         [ 7] 2904 	add	a, #0x04
   75D6 C5            [11] 2905 	push	bc
   75D7 33            [ 6] 2906 	inc	sp
   75D8 F5            [11] 2907 	push	af
   75D9 33            [ 6] 2908 	inc	sp
   75DA 2A 1B 65      [16] 2909 	ld	hl,(_mapa)
   75DD E5            [11] 2910 	push	hl
   75DE CD 71 4B      [17] 2911 	call	_getTilePtr
   75E1 F1            [10] 2912 	pop	af
   75E2 F1            [10] 2913 	pop	af
   75E3 4E            [ 7] 2914 	ld	c,(hl)
   75E4 3E 02         [ 7] 2915 	ld	a,#0x02
   75E6 91            [ 4] 2916 	sub	a, c
   75E7 DA 83 76      [10] 2917 	jp	C,00160$
                           2918 ;src/main.c:518: moverEnemigoArriba(enemy);
   75EA DD 6E F1      [19] 2919 	ld	l,-15 (ix)
   75ED DD 66 F2      [19] 2920 	ld	h,-14 (ix)
   75F0 E5            [11] 2921 	push	hl
   75F1 CD 6A 6B      [17] 2922 	call	_moverEnemigoArriba
   75F4 F1            [10] 2923 	pop	af
                           2924 ;src/main.c:519: movY = 1;
   75F5 DD 36 EF 01   [19] 2925 	ld	-17 (ix),#0x01
                           2926 ;src/main.c:520: enemy->mover = SI;
   75F9 DD 6E F5      [19] 2927 	ld	l,-11 (ix)
   75FC DD 66 F6      [19] 2928 	ld	h,-10 (ix)
   75FF 36 01         [10] 2929 	ld	(hl),#0x01
   7601 C3 83 76      [10] 2930 	jp	00160$
   7604                    2931 00159$:
                           2932 ;src/main.c:523: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7604 DD 7E FE      [19] 2933 	ld	a,-2 (ix)
   7607 C6 18         [ 7] 2934 	add	a, #0x18
   7609 47            [ 4] 2935 	ld	b,a
   760A C5            [11] 2936 	push	bc
   760B 33            [ 6] 2937 	inc	sp
   760C DD 7E FC      [19] 2938 	ld	a,-4 (ix)
   760F F5            [11] 2939 	push	af
   7610 33            [ 6] 2940 	inc	sp
   7611 2A 1B 65      [16] 2941 	ld	hl,(_mapa)
   7614 E5            [11] 2942 	push	hl
   7615 CD 71 4B      [17] 2943 	call	_getTilePtr
   7618 F1            [10] 2944 	pop	af
   7619 F1            [10] 2945 	pop	af
   761A 4E            [ 7] 2946 	ld	c,(hl)
   761B 3E 02         [ 7] 2947 	ld	a,#0x02
   761D 91            [ 4] 2948 	sub	a, c
   761E 38 63         [12] 2949 	jr	C,00160$
                           2950 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7620 DD 6E F3      [19] 2951 	ld	l,-13 (ix)
   7623 DD 66 F4      [19] 2952 	ld	h,-12 (ix)
   7626 7E            [ 7] 2953 	ld	a,(hl)
   7627 C6 18         [ 7] 2954 	add	a, #0x18
   7629 57            [ 4] 2955 	ld	d,a
   762A DD 6E F1      [19] 2956 	ld	l,-15 (ix)
   762D DD 66 F2      [19] 2957 	ld	h,-14 (ix)
   7630 46            [ 7] 2958 	ld	b,(hl)
   7631 04            [ 4] 2959 	inc	b
   7632 04            [ 4] 2960 	inc	b
   7633 D5            [11] 2961 	push	de
   7634 33            [ 6] 2962 	inc	sp
   7635 C5            [11] 2963 	push	bc
   7636 33            [ 6] 2964 	inc	sp
   7637 2A 1B 65      [16] 2965 	ld	hl,(_mapa)
   763A E5            [11] 2966 	push	hl
   763B CD 71 4B      [17] 2967 	call	_getTilePtr
   763E F1            [10] 2968 	pop	af
   763F F1            [10] 2969 	pop	af
   7640 4E            [ 7] 2970 	ld	c,(hl)
   7641 3E 02         [ 7] 2971 	ld	a,#0x02
   7643 91            [ 4] 2972 	sub	a, c
   7644 38 3D         [12] 2973 	jr	C,00160$
                           2974 ;src/main.c:525: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7646 DD 6E F3      [19] 2975 	ld	l,-13 (ix)
   7649 DD 66 F4      [19] 2976 	ld	h,-12 (ix)
   764C 7E            [ 7] 2977 	ld	a,(hl)
   764D C6 18         [ 7] 2978 	add	a, #0x18
   764F 47            [ 4] 2979 	ld	b,a
   7650 DD 6E F1      [19] 2980 	ld	l,-15 (ix)
   7653 DD 66 F2      [19] 2981 	ld	h,-14 (ix)
   7656 7E            [ 7] 2982 	ld	a,(hl)
   7657 C6 04         [ 7] 2983 	add	a, #0x04
   7659 C5            [11] 2984 	push	bc
   765A 33            [ 6] 2985 	inc	sp
   765B F5            [11] 2986 	push	af
   765C 33            [ 6] 2987 	inc	sp
   765D 2A 1B 65      [16] 2988 	ld	hl,(_mapa)
   7660 E5            [11] 2989 	push	hl
   7661 CD 71 4B      [17] 2990 	call	_getTilePtr
   7664 F1            [10] 2991 	pop	af
   7665 F1            [10] 2992 	pop	af
   7666 4E            [ 7] 2993 	ld	c,(hl)
   7667 3E 02         [ 7] 2994 	ld	a,#0x02
   7669 91            [ 4] 2995 	sub	a, c
   766A 38 17         [12] 2996 	jr	C,00160$
                           2997 ;src/main.c:526: moverEnemigoAbajo(enemy);
   766C DD 6E F1      [19] 2998 	ld	l,-15 (ix)
   766F DD 66 F2      [19] 2999 	ld	h,-14 (ix)
   7672 E5            [11] 3000 	push	hl
   7673 CD 89 6B      [17] 3001 	call	_moverEnemigoAbajo
   7676 F1            [10] 3002 	pop	af
                           3003 ;src/main.c:527: movY = 1;
   7677 DD 36 EF 01   [19] 3004 	ld	-17 (ix),#0x01
                           3005 ;src/main.c:528: enemy->mover = SI;
   767B DD 6E F5      [19] 3006 	ld	l,-11 (ix)
   767E DD 66 F6      [19] 3007 	ld	h,-10 (ix)
   7681 36 01         [10] 3008 	ld	(hl),#0x01
   7683                    3009 00160$:
                           3010 ;src/main.c:531: if (!enemy->mover) {
   7683 DD 6E F5      [19] 3011 	ld	l,-11 (ix)
   7686 DD 66 F6      [19] 3012 	ld	h,-10 (ix)
   7689 7E            [ 7] 3013 	ld	a,(hl)
   768A B7            [ 4] 3014 	or	a, a
   768B C2 4E 79      [10] 3015 	jp	NZ,00205$
                           3016 ;src/main.c:532: if (!movX) {
   768E DD 7E F0      [19] 3017 	ld	a,-16 (ix)
   7691 B7            [ 4] 3018 	or	a, a
   7692 C2 BB 77      [10] 3019 	jp	NZ,00175$
                           3020 ;src/main.c:533: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7695 DD 6E F3      [19] 3021 	ld	l,-13 (ix)
   7698 DD 66 F4      [19] 3022 	ld	h,-12 (ix)
   769B 5E            [ 7] 3023 	ld	e,(hl)
                           3024 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   769C DD 6E F1      [19] 3025 	ld	l,-15 (ix)
   769F DD 66 F2      [19] 3026 	ld	h,-14 (ix)
   76A2 4E            [ 7] 3027 	ld	c,(hl)
                           3028 ;src/main.c:533: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76A3 3E 70         [ 7] 3029 	ld	a,#0x70
   76A5 93            [ 4] 3030 	sub	a, e
   76A6 D2 36 77      [10] 3031 	jp	NC,00172$
                           3032 ;src/main.c:534: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   76A9 7B            [ 4] 3033 	ld	a,e
   76AA C6 18         [ 7] 3034 	add	a, #0x18
   76AC 47            [ 4] 3035 	ld	b,a
   76AD C5            [11] 3036 	push	bc
   76AE 2A 1B 65      [16] 3037 	ld	hl,(_mapa)
   76B1 E5            [11] 3038 	push	hl
   76B2 CD 71 4B      [17] 3039 	call	_getTilePtr
   76B5 F1            [10] 3040 	pop	af
   76B6 F1            [10] 3041 	pop	af
   76B7 4E            [ 7] 3042 	ld	c,(hl)
   76B8 3E 02         [ 7] 3043 	ld	a,#0x02
   76BA 91            [ 4] 3044 	sub	a, c
   76BB 38 63         [12] 3045 	jr	C,00162$
                           3046 ;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   76BD DD 6E F3      [19] 3047 	ld	l,-13 (ix)
   76C0 DD 66 F4      [19] 3048 	ld	h,-12 (ix)
   76C3 7E            [ 7] 3049 	ld	a,(hl)
   76C4 C6 18         [ 7] 3050 	add	a, #0x18
   76C6 57            [ 4] 3051 	ld	d,a
   76C7 DD 6E F1      [19] 3052 	ld	l,-15 (ix)
   76CA DD 66 F2      [19] 3053 	ld	h,-14 (ix)
   76CD 4E            [ 7] 3054 	ld	c,(hl)
   76CE 41            [ 4] 3055 	ld	b,c
   76CF 04            [ 4] 3056 	inc	b
   76D0 04            [ 4] 3057 	inc	b
   76D1 D5            [11] 3058 	push	de
   76D2 33            [ 6] 3059 	inc	sp
   76D3 C5            [11] 3060 	push	bc
   76D4 33            [ 6] 3061 	inc	sp
   76D5 2A 1B 65      [16] 3062 	ld	hl,(_mapa)
   76D8 E5            [11] 3063 	push	hl
   76D9 CD 71 4B      [17] 3064 	call	_getTilePtr
   76DC F1            [10] 3065 	pop	af
   76DD F1            [10] 3066 	pop	af
   76DE 4E            [ 7] 3067 	ld	c,(hl)
   76DF 3E 02         [ 7] 3068 	ld	a,#0x02
   76E1 91            [ 4] 3069 	sub	a, c
   76E2 38 3C         [12] 3070 	jr	C,00162$
                           3071 ;src/main.c:536: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76E4 DD 6E F3      [19] 3072 	ld	l,-13 (ix)
   76E7 DD 66 F4      [19] 3073 	ld	h,-12 (ix)
   76EA 7E            [ 7] 3074 	ld	a,(hl)
   76EB C6 18         [ 7] 3075 	add	a, #0x18
   76ED 47            [ 4] 3076 	ld	b,a
   76EE DD 6E F1      [19] 3077 	ld	l,-15 (ix)
   76F1 DD 66 F2      [19] 3078 	ld	h,-14 (ix)
   76F4 7E            [ 7] 3079 	ld	a,(hl)
   76F5 C6 04         [ 7] 3080 	add	a, #0x04
   76F7 C5            [11] 3081 	push	bc
   76F8 33            [ 6] 3082 	inc	sp
   76F9 F5            [11] 3083 	push	af
   76FA 33            [ 6] 3084 	inc	sp
   76FB 2A 1B 65      [16] 3085 	ld	hl,(_mapa)
   76FE E5            [11] 3086 	push	hl
   76FF CD 71 4B      [17] 3087 	call	_getTilePtr
   7702 F1            [10] 3088 	pop	af
   7703 F1            [10] 3089 	pop	af
   7704 4E            [ 7] 3090 	ld	c,(hl)
   7705 3E 02         [ 7] 3091 	ld	a,#0x02
   7707 91            [ 4] 3092 	sub	a, c
   7708 38 16         [12] 3093 	jr	C,00162$
                           3094 ;src/main.c:537: moverEnemigoAbajo(enemy);
   770A DD 6E F1      [19] 3095 	ld	l,-15 (ix)
   770D DD 66 F2      [19] 3096 	ld	h,-14 (ix)
   7710 E5            [11] 3097 	push	hl
   7711 CD 89 6B      [17] 3098 	call	_moverEnemigoAbajo
   7714 F1            [10] 3099 	pop	af
                           3100 ;src/main.c:538: enemy->mover = SI;
   7715 DD 6E F5      [19] 3101 	ld	l,-11 (ix)
   7718 DD 66 F6      [19] 3102 	ld	h,-10 (ix)
   771B 36 01         [10] 3103 	ld	(hl),#0x01
   771D C3 BB 77      [10] 3104 	jp	00175$
   7720                    3105 00162$:
                           3106 ;src/main.c:540: moverEnemigoArriba(enemy);
   7720 DD 6E F1      [19] 3107 	ld	l,-15 (ix)
   7723 DD 66 F2      [19] 3108 	ld	h,-14 (ix)
   7726 E5            [11] 3109 	push	hl
   7727 CD 6A 6B      [17] 3110 	call	_moverEnemigoArriba
   772A F1            [10] 3111 	pop	af
                           3112 ;src/main.c:541: enemy->mover = SI;
   772B DD 6E F5      [19] 3113 	ld	l,-11 (ix)
   772E DD 66 F6      [19] 3114 	ld	h,-10 (ix)
   7731 36 01         [10] 3115 	ld	(hl),#0x01
   7733 C3 BB 77      [10] 3116 	jp	00175$
   7736                    3117 00172$:
                           3118 ;src/main.c:544: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7736 43            [ 4] 3119 	ld	b,e
   7737 05            [ 4] 3120 	dec	b
   7738 05            [ 4] 3121 	dec	b
   7739 C5            [11] 3122 	push	bc
   773A 2A 1B 65      [16] 3123 	ld	hl,(_mapa)
   773D E5            [11] 3124 	push	hl
   773E CD 71 4B      [17] 3125 	call	_getTilePtr
   7741 F1            [10] 3126 	pop	af
   7742 F1            [10] 3127 	pop	af
   7743 4E            [ 7] 3128 	ld	c,(hl)
   7744 3E 02         [ 7] 3129 	ld	a,#0x02
   7746 91            [ 4] 3130 	sub	a, c
   7747 38 5F         [12] 3131 	jr	C,00167$
                           3132 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7749 DD 6E F3      [19] 3133 	ld	l,-13 (ix)
   774C DD 66 F4      [19] 3134 	ld	h,-12 (ix)
   774F 56            [ 7] 3135 	ld	d,(hl)
   7750 15            [ 4] 3136 	dec	d
   7751 15            [ 4] 3137 	dec	d
   7752 DD 6E F1      [19] 3138 	ld	l,-15 (ix)
   7755 DD 66 F2      [19] 3139 	ld	h,-14 (ix)
   7758 46            [ 7] 3140 	ld	b,(hl)
   7759 04            [ 4] 3141 	inc	b
   775A 04            [ 4] 3142 	inc	b
   775B D5            [11] 3143 	push	de
   775C 33            [ 6] 3144 	inc	sp
   775D C5            [11] 3145 	push	bc
   775E 33            [ 6] 3146 	inc	sp
   775F 2A 1B 65      [16] 3147 	ld	hl,(_mapa)
   7762 E5            [11] 3148 	push	hl
   7763 CD 71 4B      [17] 3149 	call	_getTilePtr
   7766 F1            [10] 3150 	pop	af
   7767 F1            [10] 3151 	pop	af
   7768 4E            [ 7] 3152 	ld	c,(hl)
   7769 3E 02         [ 7] 3153 	ld	a,#0x02
   776B 91            [ 4] 3154 	sub	a, c
   776C 38 3A         [12] 3155 	jr	C,00167$
                           3156 ;src/main.c:546: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   776E DD 6E F3      [19] 3157 	ld	l,-13 (ix)
   7771 DD 66 F4      [19] 3158 	ld	h,-12 (ix)
   7774 46            [ 7] 3159 	ld	b,(hl)
   7775 05            [ 4] 3160 	dec	b
   7776 05            [ 4] 3161 	dec	b
   7777 DD 6E F1      [19] 3162 	ld	l,-15 (ix)
   777A DD 66 F2      [19] 3163 	ld	h,-14 (ix)
   777D 7E            [ 7] 3164 	ld	a,(hl)
   777E C6 04         [ 7] 3165 	add	a, #0x04
   7780 C5            [11] 3166 	push	bc
   7781 33            [ 6] 3167 	inc	sp
   7782 F5            [11] 3168 	push	af
   7783 33            [ 6] 3169 	inc	sp
   7784 2A 1B 65      [16] 3170 	ld	hl,(_mapa)
   7787 E5            [11] 3171 	push	hl
   7788 CD 71 4B      [17] 3172 	call	_getTilePtr
   778B F1            [10] 3173 	pop	af
   778C F1            [10] 3174 	pop	af
   778D 4E            [ 7] 3175 	ld	c,(hl)
   778E 3E 02         [ 7] 3176 	ld	a,#0x02
   7790 91            [ 4] 3177 	sub	a, c
   7791 38 15         [12] 3178 	jr	C,00167$
                           3179 ;src/main.c:547: moverEnemigoArriba(enemy);
   7793 DD 6E F1      [19] 3180 	ld	l,-15 (ix)
   7796 DD 66 F2      [19] 3181 	ld	h,-14 (ix)
   7799 E5            [11] 3182 	push	hl
   779A CD 6A 6B      [17] 3183 	call	_moverEnemigoArriba
   779D F1            [10] 3184 	pop	af
                           3185 ;src/main.c:548: enemy->mover = SI;
   779E DD 6E F5      [19] 3186 	ld	l,-11 (ix)
   77A1 DD 66 F6      [19] 3187 	ld	h,-10 (ix)
   77A4 36 01         [10] 3188 	ld	(hl),#0x01
   77A6 18 13         [12] 3189 	jr	00175$
   77A8                    3190 00167$:
                           3191 ;src/main.c:550: moverEnemigoAbajo(enemy);
   77A8 DD 6E F1      [19] 3192 	ld	l,-15 (ix)
   77AB DD 66 F2      [19] 3193 	ld	h,-14 (ix)
   77AE E5            [11] 3194 	push	hl
   77AF CD 89 6B      [17] 3195 	call	_moverEnemigoAbajo
   77B2 F1            [10] 3196 	pop	af
                           3197 ;src/main.c:551: enemy->mover = SI;
   77B3 DD 6E F5      [19] 3198 	ld	l,-11 (ix)
   77B6 DD 66 F6      [19] 3199 	ld	h,-10 (ix)
   77B9 36 01         [10] 3200 	ld	(hl),#0x01
   77BB                    3201 00175$:
                           3202 ;src/main.c:556: if (!movY) {
   77BB DD 7E EF      [19] 3203 	ld	a,-17 (ix)
   77BE B7            [ 4] 3204 	or	a, a
   77BF C2 4E 79      [10] 3205 	jp	NZ,00205$
                           3206 ;src/main.c:557: if (enemy->x < ANCHO_PANTALLA/2) {
   77C2 DD 6E F1      [19] 3207 	ld	l,-15 (ix)
   77C5 DD 66 F2      [19] 3208 	ld	h,-14 (ix)
   77C8 7E            [ 7] 3209 	ld	a,(hl)
   77C9 DD 77 FE      [19] 3210 	ld	-2 (ix),a
                           3211 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   77CC DD 6E F3      [19] 3212 	ld	l,-13 (ix)
   77CF DD 66 F4      [19] 3213 	ld	h,-12 (ix)
   77D2 7E            [ 7] 3214 	ld	a,(hl)
   77D3 DD 77 FC      [19] 3215 	ld	-4 (ix),a
                           3216 ;src/main.c:557: if (enemy->x < ANCHO_PANTALLA/2) {
   77D6 DD 7E FE      [19] 3217 	ld	a,-2 (ix)
   77D9 D6 28         [ 7] 3218 	sub	a, #0x28
   77DB D2 A3 78      [10] 3219 	jp	NC,00187$
                           3220 ;src/main.c:558: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   77DE DD 66 FC      [19] 3221 	ld	h,-4 (ix)
   77E1 DD 6E FE      [19] 3222 	ld	l,-2 (ix)
   77E4 E5            [11] 3223 	push	hl
   77E5 2A 1B 65      [16] 3224 	ld	hl,(_mapa)
   77E8 E5            [11] 3225 	push	hl
   77E9 CD 71 4B      [17] 3226 	call	_getTilePtr
   77EC F1            [10] 3227 	pop	af
   77ED F1            [10] 3228 	pop	af
   77EE DD 74 FB      [19] 3229 	ld	-5 (ix),h
   77F1 DD 75 FA      [19] 3230 	ld	-6 (ix), l
   77F4 DD 66 FB      [19] 3231 	ld	h,-5 (ix)
   77F7 7E            [ 7] 3232 	ld	a,(hl)
   77F8 DD 77 FA      [19] 3233 	ld	-6 (ix),a
   77FB 3E 02         [ 7] 3234 	ld	a,#0x02
   77FD DD 96 FA      [19] 3235 	sub	a, -6 (ix)
   7800 DA 8D 78      [10] 3236 	jp	C,00177$
                           3237 ;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7803 DD 6E F3      [19] 3238 	ld	l,-13 (ix)
   7806 DD 66 F4      [19] 3239 	ld	h,-12 (ix)
   7809 7E            [ 7] 3240 	ld	a,(hl)
   780A C6 0B         [ 7] 3241 	add	a, #0x0B
   780C DD 77 FA      [19] 3242 	ld	-6 (ix),a
   780F DD 6E F1      [19] 3243 	ld	l,-15 (ix)
   7812 DD 66 F2      [19] 3244 	ld	h,-14 (ix)
   7815 7E            [ 7] 3245 	ld	a,(hl)
   7816 DD 77 F9      [19] 3246 	ld	-7 (ix),a
   7819 DD 66 FA      [19] 3247 	ld	h,-6 (ix)
   781C DD 6E F9      [19] 3248 	ld	l,-7 (ix)
   781F E5            [11] 3249 	push	hl
   7820 2A 1B 65      [16] 3250 	ld	hl,(_mapa)
   7823 E5            [11] 3251 	push	hl
   7824 CD 71 4B      [17] 3252 	call	_getTilePtr
   7827 F1            [10] 3253 	pop	af
   7828 F1            [10] 3254 	pop	af
   7829 DD 74 FB      [19] 3255 	ld	-5 (ix),h
   782C DD 75 FA      [19] 3256 	ld	-6 (ix), l
   782F DD 66 FB      [19] 3257 	ld	h,-5 (ix)
   7832 7E            [ 7] 3258 	ld	a,(hl)
   7833 DD 77 FA      [19] 3259 	ld	-6 (ix),a
   7836 3E 02         [ 7] 3260 	ld	a,#0x02
   7838 DD 96 FA      [19] 3261 	sub	a, -6 (ix)
   783B 38 50         [12] 3262 	jr	C,00177$
                           3263 ;src/main.c:560: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   783D DD 6E F3      [19] 3264 	ld	l,-13 (ix)
   7840 DD 66 F4      [19] 3265 	ld	h,-12 (ix)
   7843 7E            [ 7] 3266 	ld	a,(hl)
   7844 C6 16         [ 7] 3267 	add	a, #0x16
   7846 DD 77 FA      [19] 3268 	ld	-6 (ix),a
   7849 DD 6E F1      [19] 3269 	ld	l,-15 (ix)
   784C DD 66 F2      [19] 3270 	ld	h,-14 (ix)
   784F 7E            [ 7] 3271 	ld	a,(hl)
   7850 DD 77 F9      [19] 3272 	ld	-7 (ix),a
   7853 DD 66 FA      [19] 3273 	ld	h,-6 (ix)
   7856 DD 6E F9      [19] 3274 	ld	l,-7 (ix)
   7859 E5            [11] 3275 	push	hl
   785A 2A 1B 65      [16] 3276 	ld	hl,(_mapa)
   785D E5            [11] 3277 	push	hl
   785E CD 71 4B      [17] 3278 	call	_getTilePtr
   7861 F1            [10] 3279 	pop	af
   7862 F1            [10] 3280 	pop	af
   7863 DD 74 FB      [19] 3281 	ld	-5 (ix),h
   7866 DD 75 FA      [19] 3282 	ld	-6 (ix), l
   7869 DD 66 FB      [19] 3283 	ld	h,-5 (ix)
   786C 7E            [ 7] 3284 	ld	a,(hl)
   786D DD 77 FA      [19] 3285 	ld	-6 (ix),a
   7870 3E 02         [ 7] 3286 	ld	a,#0x02
   7872 DD 96 FA      [19] 3287 	sub	a, -6 (ix)
   7875 38 16         [12] 3288 	jr	C,00177$
                           3289 ;src/main.c:561: moverEnemigoIzquierda(enemy);
   7877 DD 6E F1      [19] 3290 	ld	l,-15 (ix)
   787A DD 66 F2      [19] 3291 	ld	h,-14 (ix)
   787D E5            [11] 3292 	push	hl
   787E CD B8 6B      [17] 3293 	call	_moverEnemigoIzquierda
   7881 F1            [10] 3294 	pop	af
                           3295 ;src/main.c:562: enemy->mover = SI;
   7882 DD 6E F5      [19] 3296 	ld	l,-11 (ix)
   7885 DD 66 F6      [19] 3297 	ld	h,-10 (ix)
   7888 36 01         [10] 3298 	ld	(hl),#0x01
   788A C3 4E 79      [10] 3299 	jp	00205$
   788D                    3300 00177$:
                           3301 ;src/main.c:564: moverEnemigoDerecha(enemy);
   788D DD 6E F1      [19] 3302 	ld	l,-15 (ix)
   7890 DD 66 F2      [19] 3303 	ld	h,-14 (ix)
   7893 E5            [11] 3304 	push	hl
   7894 CD A8 6B      [17] 3305 	call	_moverEnemigoDerecha
   7897 F1            [10] 3306 	pop	af
                           3307 ;src/main.c:565: enemy->mover = SI;
   7898 DD 6E F5      [19] 3308 	ld	l,-11 (ix)
   789B DD 66 F6      [19] 3309 	ld	h,-10 (ix)
   789E 36 01         [10] 3310 	ld	(hl),#0x01
   78A0 C3 4E 79      [10] 3311 	jp	00205$
   78A3                    3312 00187$:
                           3313 ;src/main.c:568: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   78A3 DD 7E FE      [19] 3314 	ld	a,-2 (ix)
   78A6 C6 04         [ 7] 3315 	add	a, #0x04
   78A8 DD 77 FE      [19] 3316 	ld	-2 (ix),a
   78AB DD 66 FC      [19] 3317 	ld	h,-4 (ix)
   78AE DD 6E FE      [19] 3318 	ld	l,-2 (ix)
   78B1 E5            [11] 3319 	push	hl
   78B2 2A 1B 65      [16] 3320 	ld	hl,(_mapa)
   78B5 E5            [11] 3321 	push	hl
   78B6 CD 71 4B      [17] 3322 	call	_getTilePtr
   78B9 F1            [10] 3323 	pop	af
   78BA F1            [10] 3324 	pop	af
   78BB DD 74 FF      [19] 3325 	ld	-1 (ix),h
   78BE DD 75 FE      [19] 3326 	ld	-2 (ix), l
   78C1 DD 66 FF      [19] 3327 	ld	h,-1 (ix)
   78C4 7E            [ 7] 3328 	ld	a,(hl)
   78C5 DD 77 FE      [19] 3329 	ld	-2 (ix),a
   78C8 3E 02         [ 7] 3330 	ld	a,#0x02
   78CA DD 96 FE      [19] 3331 	sub	a, -2 (ix)
   78CD 38 6C         [12] 3332 	jr	C,00182$
                           3333 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78CF DD 6E F3      [19] 3334 	ld	l,-13 (ix)
   78D2 DD 66 F4      [19] 3335 	ld	h,-12 (ix)
   78D5 7E            [ 7] 3336 	ld	a,(hl)
   78D6 C6 0B         [ 7] 3337 	add	a, #0x0B
   78D8 DD 77 FE      [19] 3338 	ld	-2 (ix),a
   78DB DD 6E F1      [19] 3339 	ld	l,-15 (ix)
   78DE DD 66 F2      [19] 3340 	ld	h,-14 (ix)
   78E1 7E            [ 7] 3341 	ld	a,(hl)
   78E2 DD 77 FC      [19] 3342 	ld	-4 (ix), a
   78E5 C6 04         [ 7] 3343 	add	a, #0x04
   78E7 DD 77 FC      [19] 3344 	ld	-4 (ix),a
   78EA DD 66 FE      [19] 3345 	ld	h,-2 (ix)
   78ED DD 6E FC      [19] 3346 	ld	l,-4 (ix)
   78F0 E5            [11] 3347 	push	hl
   78F1 2A 1B 65      [16] 3348 	ld	hl,(_mapa)
   78F4 E5            [11] 3349 	push	hl
   78F5 CD 71 4B      [17] 3350 	call	_getTilePtr
   78F8 F1            [10] 3351 	pop	af
   78F9 F1            [10] 3352 	pop	af
   78FA 4E            [ 7] 3353 	ld	c,(hl)
   78FB 3E 02         [ 7] 3354 	ld	a,#0x02
   78FD 91            [ 4] 3355 	sub	a, c
   78FE 38 3B         [12] 3356 	jr	C,00182$
                           3357 ;src/main.c:570: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7900 DD 6E F3      [19] 3358 	ld	l,-13 (ix)
   7903 DD 66 F4      [19] 3359 	ld	h,-12 (ix)
   7906 7E            [ 7] 3360 	ld	a,(hl)
   7907 C6 16         [ 7] 3361 	add	a, #0x16
   7909 4F            [ 4] 3362 	ld	c,a
   790A DD 6E F1      [19] 3363 	ld	l,-15 (ix)
   790D DD 66 F2      [19] 3364 	ld	h,-14 (ix)
   7910 5E            [ 7] 3365 	ld	e,(hl)
   7911 1C            [ 4] 3366 	inc	e
   7912 1C            [ 4] 3367 	inc	e
   7913 1C            [ 4] 3368 	inc	e
   7914 1C            [ 4] 3369 	inc	e
   7915 51            [ 4] 3370 	ld	d, c
   7916 D5            [11] 3371 	push	de
   7917 2A 1B 65      [16] 3372 	ld	hl,(_mapa)
   791A E5            [11] 3373 	push	hl
   791B CD 71 4B      [17] 3374 	call	_getTilePtr
   791E F1            [10] 3375 	pop	af
   791F F1            [10] 3376 	pop	af
   7920 4E            [ 7] 3377 	ld	c,(hl)
   7921 3E 02         [ 7] 3378 	ld	a,#0x02
   7923 91            [ 4] 3379 	sub	a, c
   7924 38 15         [12] 3380 	jr	C,00182$
                           3381 ;src/main.c:571: moverEnemigoDerecha(enemy);
   7926 DD 6E F1      [19] 3382 	ld	l,-15 (ix)
   7929 DD 66 F2      [19] 3383 	ld	h,-14 (ix)
   792C E5            [11] 3384 	push	hl
   792D CD A8 6B      [17] 3385 	call	_moverEnemigoDerecha
   7930 F1            [10] 3386 	pop	af
                           3387 ;src/main.c:572: enemy->mover = SI;
   7931 DD 6E F5      [19] 3388 	ld	l,-11 (ix)
   7934 DD 66 F6      [19] 3389 	ld	h,-10 (ix)
   7937 36 01         [10] 3390 	ld	(hl),#0x01
   7939 18 13         [12] 3391 	jr	00205$
   793B                    3392 00182$:
                           3393 ;src/main.c:575: moverEnemigoIzquierda(enemy);
   793B DD 6E F1      [19] 3394 	ld	l,-15 (ix)
   793E DD 66 F2      [19] 3395 	ld	h,-14 (ix)
   7941 E5            [11] 3396 	push	hl
   7942 CD B8 6B      [17] 3397 	call	_moverEnemigoIzquierda
   7945 F1            [10] 3398 	pop	af
                           3399 ;src/main.c:576: enemy->mover = SI;
   7946 DD 6E F5      [19] 3400 	ld	l,-11 (ix)
   7949 DD 66 F6      [19] 3401 	ld	h,-10 (ix)
   794C 36 01         [10] 3402 	ld	(hl),#0x01
   794E                    3403 00205$:
   794E DD F9         [10] 3404 	ld	sp, ix
   7950 DD E1         [14] 3405 	pop	ix
   7952 C9            [10] 3406 	ret
                           3407 ;src/main.c:586: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3408 ;	---------------------------------
                           3409 ; Function updateEnemy
                           3410 ; ---------------------------------
   7953                    3411 _updateEnemy::
   7953 DD E5         [15] 3412 	push	ix
   7955 DD 21 00 00   [14] 3413 	ld	ix,#0
   7959 DD 39         [15] 3414 	add	ix,sp
   795B 21 F4 FF      [10] 3415 	ld	hl,#-12
   795E 39            [11] 3416 	add	hl,sp
   795F F9            [ 6] 3417 	ld	sp,hl
                           3418 ;src/main.c:593: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7960 DD 4E 04      [19] 3419 	ld	c,4 (ix)
   7963 DD 46 05      [19] 3420 	ld	b,5 (ix)
   7966 21 16 00      [10] 3421 	ld	hl,#0x0016
   7969 09            [11] 3422 	add	hl,bc
   796A DD 75 FE      [19] 3423 	ld	-2 (ix),l
   796D DD 74 FF      [19] 3424 	ld	-1 (ix),h
   7970 DD 6E FE      [19] 3425 	ld	l,-2 (ix)
   7973 DD 66 FF      [19] 3426 	ld	h,-1 (ix)
   7976 7E            [ 7] 3427 	ld	a,(hl)
   7977 B7            [ 4] 3428 	or	a, a
   7978 28 19         [12] 3429 	jr	Z,00115$
                           3430 ;src/main.c:594: enemy->patrolling = 0;
   797A 21 B8 60      [10] 3431 	ld	hl,#(_enemy + 0x000b)
   797D 36 00         [10] 3432 	ld	(hl),#0x00
                           3433 ;src/main.c:595: engage(actual, prota.x, prota.y);
   797F 3A 3A 64      [13] 3434 	ld	a, (#_prota + 1)
   7982 21 39 64      [10] 3435 	ld	hl, #_prota + 0
   7985 56            [ 7] 3436 	ld	d,(hl)
   7986 F5            [11] 3437 	push	af
   7987 33            [ 6] 3438 	inc	sp
   7988 D5            [11] 3439 	push	de
   7989 33            [ 6] 3440 	inc	sp
   798A C5            [11] 3441 	push	bc
   798B CD CE 70      [17] 3442 	call	_engage
   798E F1            [10] 3443 	pop	af
   798F F1            [10] 3444 	pop	af
   7990 C3 BB 7A      [10] 3445 	jp	00117$
   7993                    3446 00115$:
                           3447 ;src/main.c:597: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7993 C5            [11] 3448 	push	bc
   7994 C5            [11] 3449 	push	bc
   7995 CD 13 6E      [17] 3450 	call	_lookFor
   7998 F1            [10] 3451 	pop	af
   7999 C1            [10] 3452 	pop	bc
                           3453 ;src/main.c:603: actual->patrolling = 0;
   799A 21 0B 00      [10] 3454 	ld	hl,#0x000B
   799D 09            [11] 3455 	add	hl,bc
   799E DD 75 FC      [19] 3456 	ld	-4 (ix),l
   79A1 DD 74 FD      [19] 3457 	ld	-3 (ix),h
                           3458 ;src/main.c:598: if (actual->patrolling) {
   79A4 DD 6E FC      [19] 3459 	ld	l,-4 (ix)
   79A7 DD 66 FD      [19] 3460 	ld	h,-3 (ix)
   79AA 6E            [ 7] 3461 	ld	l,(hl)
                           3462 ;src/main.c:601: if (actual->in_range) {
   79AB 79            [ 4] 3463 	ld	a,c
   79AC C6 11         [ 7] 3464 	add	a, #0x11
   79AE 5F            [ 4] 3465 	ld	e,a
   79AF 78            [ 4] 3466 	ld	a,b
   79B0 CE 00         [ 7] 3467 	adc	a, #0x00
   79B2 57            [ 4] 3468 	ld	d,a
                           3469 ;src/main.c:609: actual->seek = 1;
   79B3 79            [ 4] 3470 	ld	a,c
   79B4 C6 14         [ 7] 3471 	add	a, #0x14
   79B6 DD 77 FA      [19] 3472 	ld	-6 (ix),a
   79B9 78            [ 4] 3473 	ld	a,b
   79BA CE 00         [ 7] 3474 	adc	a, #0x00
   79BC DD 77 FB      [19] 3475 	ld	-5 (ix),a
                           3476 ;src/main.c:598: if (actual->patrolling) {
   79BF 7D            [ 4] 3477 	ld	a,l
   79C0 B7            [ 4] 3478 	or	a, a
   79C1 CA 83 7A      [10] 3479 	jp	Z,00112$
                           3480 ;src/main.c:600: moverEnemigoPatrol(actual);
   79C4 C5            [11] 3481 	push	bc
   79C5 D5            [11] 3482 	push	de
   79C6 C5            [11] 3483 	push	bc
   79C7 CD CA 6B      [17] 3484 	call	_moverEnemigoPatrol
   79CA F1            [10] 3485 	pop	af
   79CB D1            [10] 3486 	pop	de
   79CC C1            [10] 3487 	pop	bc
                           3488 ;src/main.c:601: if (actual->in_range) {
   79CD 1A            [ 7] 3489 	ld	a,(de)
   79CE B7            [ 4] 3490 	or	a, a
   79CF 28 24         [12] 3491 	jr	Z,00104$
                           3492 ;src/main.c:602: engage(actual, prota.x, prota.y);
   79D1 3A 3A 64      [13] 3493 	ld	a, (#_prota + 1)
   79D4 21 39 64      [10] 3494 	ld	hl, #_prota + 0
   79D7 56            [ 7] 3495 	ld	d,(hl)
   79D8 F5            [11] 3496 	push	af
   79D9 33            [ 6] 3497 	inc	sp
   79DA D5            [11] 3498 	push	de
   79DB 33            [ 6] 3499 	inc	sp
   79DC C5            [11] 3500 	push	bc
   79DD CD CE 70      [17] 3501 	call	_engage
   79E0 F1            [10] 3502 	pop	af
   79E1 F1            [10] 3503 	pop	af
                           3504 ;src/main.c:603: actual->patrolling = 0;
   79E2 DD 6E FC      [19] 3505 	ld	l,-4 (ix)
   79E5 DD 66 FD      [19] 3506 	ld	h,-3 (ix)
   79E8 36 00         [10] 3507 	ld	(hl),#0x00
                           3508 ;src/main.c:604: actual->engage = 1;
   79EA DD 6E FE      [19] 3509 	ld	l,-2 (ix)
   79ED DD 66 FF      [19] 3510 	ld	h,-1 (ix)
   79F0 36 01         [10] 3511 	ld	(hl),#0x01
   79F2 C3 BB 7A      [10] 3512 	jp	00117$
   79F5                    3513 00104$:
                           3514 ;src/main.c:605: } else if (actual->seen) {
   79F5 21 12 00      [10] 3515 	ld	hl,#0x0012
   79F8 09            [11] 3516 	add	hl,bc
   79F9 DD 75 F5      [19] 3517 	ld	-11 (ix),l
   79FC DD 74 F6      [19] 3518 	ld	-10 (ix),h
   79FF DD 6E F5      [19] 3519 	ld	l,-11 (ix)
   7A02 DD 66 F6      [19] 3520 	ld	h,-10 (ix)
   7A05 7E            [ 7] 3521 	ld	a,(hl)
   7A06 B7            [ 4] 3522 	or	a, a
   7A07 CA BB 7A      [10] 3523 	jp	Z,00117$
                           3524 ;src/main.c:606: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   7A0A 3A 3A 64      [13] 3525 	ld	a,(#_prota + 1)
   7A0D DD 77 F4      [19] 3526 	ld	-12 (ix),a
   7A10 21 39 64      [10] 3527 	ld	hl, #_prota + 0
   7A13 5E            [ 7] 3528 	ld	e,(hl)
   7A14 21 01 00      [10] 3529 	ld	hl,#0x0001
   7A17 09            [11] 3530 	add	hl,bc
   7A18 DD 75 F8      [19] 3531 	ld	-8 (ix),l
   7A1B DD 74 F9      [19] 3532 	ld	-7 (ix),h
   7A1E DD 6E F8      [19] 3533 	ld	l,-8 (ix)
   7A21 DD 66 F9      [19] 3534 	ld	h,-7 (ix)
   7A24 56            [ 7] 3535 	ld	d,(hl)
   7A25 0A            [ 7] 3536 	ld	a,(bc)
   7A26 DD 77 F7      [19] 3537 	ld	-9 (ix),a
   7A29 C5            [11] 3538 	push	bc
   7A2A 2A 1B 65      [16] 3539 	ld	hl,(_mapa)
   7A2D E5            [11] 3540 	push	hl
   7A2E C5            [11] 3541 	push	bc
   7A2F DD 7E F4      [19] 3542 	ld	a,-12 (ix)
   7A32 F5            [11] 3543 	push	af
   7A33 33            [ 6] 3544 	inc	sp
   7A34 7B            [ 4] 3545 	ld	a,e
   7A35 F5            [11] 3546 	push	af
   7A36 33            [ 6] 3547 	inc	sp
   7A37 D5            [11] 3548 	push	de
   7A38 33            [ 6] 3549 	inc	sp
   7A39 DD 7E F7      [19] 3550 	ld	a,-9 (ix)
   7A3C F5            [11] 3551 	push	af
   7A3D 33            [ 6] 3552 	inc	sp
   7A3E CD 72 49      [17] 3553 	call	_pathFinding
   7A41 21 08 00      [10] 3554 	ld	hl,#8
   7A44 39            [11] 3555 	add	hl,sp
   7A45 F9            [ 6] 3556 	ld	sp,hl
   7A46 C1            [10] 3557 	pop	bc
                           3558 ;src/main.c:607: actual->p_seek_x = actual->x;
   7A47 21 17 00      [10] 3559 	ld	hl,#0x0017
   7A4A 09            [11] 3560 	add	hl,bc
   7A4B EB            [ 4] 3561 	ex	de,hl
   7A4C 0A            [ 7] 3562 	ld	a,(bc)
   7A4D 12            [ 7] 3563 	ld	(de),a
                           3564 ;src/main.c:608: actual->p_seek_y = actual->y;
   7A4E 21 18 00      [10] 3565 	ld	hl,#0x0018
   7A51 09            [11] 3566 	add	hl,bc
   7A52 EB            [ 4] 3567 	ex	de,hl
   7A53 DD 6E F8      [19] 3568 	ld	l,-8 (ix)
   7A56 DD 66 F9      [19] 3569 	ld	h,-7 (ix)
   7A59 7E            [ 7] 3570 	ld	a,(hl)
   7A5A 12            [ 7] 3571 	ld	(de),a
                           3572 ;src/main.c:609: actual->seek = 1;
   7A5B DD 6E FA      [19] 3573 	ld	l,-6 (ix)
   7A5E DD 66 FB      [19] 3574 	ld	h,-5 (ix)
   7A61 36 01         [10] 3575 	ld	(hl),#0x01
                           3576 ;src/main.c:610: actual->iter=0;
   7A63 21 0E 00      [10] 3577 	ld	hl,#0x000E
   7A66 09            [11] 3578 	add	hl,bc
   7A67 AF            [ 4] 3579 	xor	a, a
   7A68 77            [ 7] 3580 	ld	(hl), a
   7A69 23            [ 6] 3581 	inc	hl
   7A6A 77            [ 7] 3582 	ld	(hl), a
                           3583 ;src/main.c:611: actual->reversePatrol = NO;
   7A6B 21 0C 00      [10] 3584 	ld	hl,#0x000C
   7A6E 09            [11] 3585 	add	hl,bc
   7A6F 36 00         [10] 3586 	ld	(hl),#0x00
                           3587 ;src/main.c:612: actual->patrolling = 0;
   7A71 DD 6E FC      [19] 3588 	ld	l,-4 (ix)
   7A74 DD 66 FD      [19] 3589 	ld	h,-3 (ix)
   7A77 36 00         [10] 3590 	ld	(hl),#0x00
                           3591 ;src/main.c:613: actual->seen = 0;
   7A79 DD 6E F5      [19] 3592 	ld	l,-11 (ix)
   7A7C DD 66 F6      [19] 3593 	ld	h,-10 (ix)
   7A7F 36 00         [10] 3594 	ld	(hl),#0x00
   7A81 18 38         [12] 3595 	jr	00117$
   7A83                    3596 00112$:
                           3597 ;src/main.c:615: } else if (actual->seek) {
   7A83 DD 6E FA      [19] 3598 	ld	l,-6 (ix)
   7A86 DD 66 FB      [19] 3599 	ld	h,-5 (ix)
   7A89 7E            [ 7] 3600 	ld	a,(hl)
   7A8A B7            [ 4] 3601 	or	a, a
   7A8B 28 2E         [12] 3602 	jr	Z,00117$
                           3603 ;src/main.c:616: moverEnemigoSeek(actual);
   7A8D C5            [11] 3604 	push	bc
   7A8E D5            [11] 3605 	push	de
   7A8F C5            [11] 3606 	push	bc
   7A90 CD 1C 6F      [17] 3607 	call	_moverEnemigoSeek
   7A93 F1            [10] 3608 	pop	af
   7A94 D1            [10] 3609 	pop	de
   7A95 C1            [10] 3610 	pop	bc
                           3611 ;src/main.c:617: if (actual->in_range) {
   7A96 1A            [ 7] 3612 	ld	a,(de)
   7A97 B7            [ 4] 3613 	or	a, a
   7A98 28 21         [12] 3614 	jr	Z,00117$
                           3615 ;src/main.c:618: engage(actual, prota.x, prota.y);
   7A9A 3A 3A 64      [13] 3616 	ld	a, (#_prota + 1)
   7A9D 21 39 64      [10] 3617 	ld	hl, #_prota + 0
   7AA0 56            [ 7] 3618 	ld	d,(hl)
   7AA1 F5            [11] 3619 	push	af
   7AA2 33            [ 6] 3620 	inc	sp
   7AA3 D5            [11] 3621 	push	de
   7AA4 33            [ 6] 3622 	inc	sp
   7AA5 C5            [11] 3623 	push	bc
   7AA6 CD CE 70      [17] 3624 	call	_engage
   7AA9 F1            [10] 3625 	pop	af
   7AAA F1            [10] 3626 	pop	af
                           3627 ;src/main.c:619: actual->seek = 0;
   7AAB DD 6E FA      [19] 3628 	ld	l,-6 (ix)
   7AAE DD 66 FB      [19] 3629 	ld	h,-5 (ix)
   7AB1 36 00         [10] 3630 	ld	(hl),#0x00
                           3631 ;src/main.c:620: actual->engage = 1;
   7AB3 DD 6E FE      [19] 3632 	ld	l,-2 (ix)
   7AB6 DD 66 FF      [19] 3633 	ld	h,-1 (ix)
   7AB9 36 01         [10] 3634 	ld	(hl),#0x01
                           3635 ;src/main.c:621: } else if (actual->seen) {
   7ABB                    3636 00117$:
   7ABB DD F9         [10] 3637 	ld	sp, ix
   7ABD DD E1         [14] 3638 	pop	ix
   7ABF C9            [10] 3639 	ret
                           3640 ;src/main.c:628: void inicializarEnemy() {
                           3641 ;	---------------------------------
                           3642 ; Function inicializarEnemy
                           3643 ; ---------------------------------
   7AC0                    3644 _inicializarEnemy::
   7AC0 DD E5         [15] 3645 	push	ix
   7AC2 DD 21 00 00   [14] 3646 	ld	ix,#0
   7AC6 DD 39         [15] 3647 	add	ix,sp
   7AC8 21 F9 FF      [10] 3648 	ld	hl,#-7
   7ACB 39            [11] 3649 	add	hl,sp
   7ACC F9            [ 6] 3650 	ld	sp,hl
                           3651 ;src/main.c:629: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7ACD 3A 1D 65      [13] 3652 	ld	a,(#_num_mapa + 0)
   7AD0 C6 02         [ 7] 3653 	add	a, #0x02
   7AD2 DD 77 FB      [19] 3654 	ld	-5 (ix),a
                           3655 ;src/main.c:639: actual = enemy;
   7AD5 11 AD 60      [10] 3656 	ld	de,#_enemy+0
                           3657 ;src/main.c:640: while(i){
   7AD8                    3658 00101$:
   7AD8 DD 7E FB      [19] 3659 	ld	a,-5 (ix)
   7ADB B7            [ 4] 3660 	or	a, a
   7ADC CA D2 7B      [10] 3661 	jp	Z,00104$
                           3662 ;src/main.c:641: --i;
   7ADF DD 35 FB      [23] 3663 	dec	-5 (ix)
                           3664 ;src/main.c:642: actual->x = actual->px = spawnX[i];
   7AE2 4B            [ 4] 3665 	ld	c, e
   7AE3 42            [ 4] 3666 	ld	b, d
   7AE4 03            [ 6] 3667 	inc	bc
   7AE5 03            [ 6] 3668 	inc	bc
   7AE6 3E 3F         [ 7] 3669 	ld	a,#<(_spawnX)
   7AE8 DD 86 FB      [19] 3670 	add	a, -5 (ix)
   7AEB DD 77 F9      [19] 3671 	ld	-7 (ix),a
   7AEE 3E 65         [ 7] 3672 	ld	a,#>(_spawnX)
   7AF0 CE 00         [ 7] 3673 	adc	a, #0x00
   7AF2 DD 77 FA      [19] 3674 	ld	-6 (ix),a
   7AF5 E1            [10] 3675 	pop	hl
   7AF6 E5            [11] 3676 	push	hl
   7AF7 7E            [ 7] 3677 	ld	a,(hl)
   7AF8 02            [ 7] 3678 	ld	(bc),a
   7AF9 12            [ 7] 3679 	ld	(de),a
                           3680 ;src/main.c:643: actual->y = actual->py = spawnY[i];
   7AFA D5            [11] 3681 	push	de
   7AFB FD E1         [14] 3682 	pop	iy
   7AFD FD 23         [10] 3683 	inc	iy
   7AFF 4B            [ 4] 3684 	ld	c, e
   7B00 42            [ 4] 3685 	ld	b, d
   7B01 03            [ 6] 3686 	inc	bc
   7B02 03            [ 6] 3687 	inc	bc
   7B03 03            [ 6] 3688 	inc	bc
   7B04 3E 43         [ 7] 3689 	ld	a,#<(_spawnY)
   7B06 DD 86 FB      [19] 3690 	add	a, -5 (ix)
   7B09 DD 77 FE      [19] 3691 	ld	-2 (ix),a
   7B0C 3E 65         [ 7] 3692 	ld	a,#>(_spawnY)
   7B0E CE 00         [ 7] 3693 	adc	a, #0x00
   7B10 DD 77 FF      [19] 3694 	ld	-1 (ix),a
   7B13 DD 6E FE      [19] 3695 	ld	l,-2 (ix)
   7B16 DD 66 FF      [19] 3696 	ld	h,-1 (ix)
   7B19 7E            [ 7] 3697 	ld	a,(hl)
   7B1A 02            [ 7] 3698 	ld	(bc),a
   7B1B FD 77 00      [19] 3699 	ld	0 (iy), a
                           3700 ;src/main.c:644: actual->mover  = NO;
   7B1E 21 06 00      [10] 3701 	ld	hl,#0x0006
   7B21 19            [11] 3702 	add	hl,de
   7B22 36 00         [10] 3703 	ld	(hl),#0x00
                           3704 ;src/main.c:645: actual->mira   = M_abajo;
   7B24 21 07 00      [10] 3705 	ld	hl,#0x0007
   7B27 19            [11] 3706 	add	hl,de
   7B28 36 03         [10] 3707 	ld	(hl),#0x03
                           3708 ;src/main.c:646: actual->sprite = g_enemy;
   7B2A 21 04 00      [10] 3709 	ld	hl,#0x0004
   7B2D 19            [11] 3710 	add	hl,de
   7B2E 36 3A         [10] 3711 	ld	(hl),#<(_g_enemy)
   7B30 23            [ 6] 3712 	inc	hl
   7B31 36 3C         [10] 3713 	ld	(hl),#>(_g_enemy)
                           3714 ;src/main.c:647: actual->muerto = NO;
   7B33 21 08 00      [10] 3715 	ld	hl,#0x0008
   7B36 19            [11] 3716 	add	hl,de
   7B37 36 00         [10] 3717 	ld	(hl),#0x00
                           3718 ;src/main.c:648: actual->muertes = 0;
   7B39 21 0A 00      [10] 3719 	ld	hl,#0x000A
   7B3C 19            [11] 3720 	add	hl,de
   7B3D 36 00         [10] 3721 	ld	(hl),#0x00
                           3722 ;src/main.c:649: actual->patrolling = SI;
   7B3F 21 0B 00      [10] 3723 	ld	hl,#0x000B
   7B42 19            [11] 3724 	add	hl,de
   7B43 36 01         [10] 3725 	ld	(hl),#0x01
                           3726 ;src/main.c:650: actual->reversePatrol = NO;
   7B45 21 0C 00      [10] 3727 	ld	hl,#0x000C
   7B48 19            [11] 3728 	add	hl,de
   7B49 36 00         [10] 3729 	ld	(hl),#0x00
                           3730 ;src/main.c:651: actual->iter = 0;
   7B4B 21 0E 00      [10] 3731 	ld	hl,#0x000E
   7B4E 19            [11] 3732 	add	hl,de
   7B4F AF            [ 4] 3733 	xor	a, a
   7B50 77            [ 7] 3734 	ld	(hl), a
   7B51 23            [ 6] 3735 	inc	hl
   7B52 77            [ 7] 3736 	ld	(hl), a
                           3737 ;src/main.c:652: actual->lastIter = 0;
   7B53 21 10 00      [10] 3738 	ld	hl,#0x0010
   7B56 19            [11] 3739 	add	hl,de
   7B57 36 00         [10] 3740 	ld	(hl),#0x00
                           3741 ;src/main.c:653: actual->seen = 0;
   7B59 21 12 00      [10] 3742 	ld	hl,#0x0012
   7B5C 19            [11] 3743 	add	hl,de
   7B5D 36 00         [10] 3744 	ld	(hl),#0x00
                           3745 ;src/main.c:654: actual->found = 0;
   7B5F 21 13 00      [10] 3746 	ld	hl,#0x0013
   7B62 19            [11] 3747 	add	hl,de
   7B63 36 00         [10] 3748 	ld	(hl),#0x00
                           3749 ;src/main.c:655: actual->engage = 0;
   7B65 21 16 00      [10] 3750 	ld	hl,#0x0016
   7B68 19            [11] 3751 	add	hl,de
   7B69 36 00         [10] 3752 	ld	(hl),#0x00
                           3753 ;src/main.c:656: actual->xplot = NO;
   7B6B 21 19 00      [10] 3754 	ld	hl,#0x0019
   7B6E 19            [11] 3755 	add	hl,de
   7B6F 36 00         [10] 3756 	ld	(hl),#0x00
                           3757 ;src/main.c:657: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B71 21 1D 65      [10] 3758 	ld	hl,#_num_mapa + 0
   7B74 4E            [ 7] 3759 	ld	c, (hl)
   7B75 0C            [ 4] 3760 	inc	c
   7B76 06 00         [ 7] 3761 	ld	b,#0x00
   7B78 69            [ 4] 3762 	ld	l, c
   7B79 60            [ 4] 3763 	ld	h, b
   7B7A 29            [11] 3764 	add	hl, hl
   7B7B 29            [11] 3765 	add	hl, hl
   7B7C 09            [11] 3766 	add	hl, bc
   7B7D 4D            [ 4] 3767 	ld	c,l
   7B7E 44            [ 4] 3768 	ld	b,h
   7B7F 21 5B 65      [10] 3769 	ld	hl,#_patrolY
   7B82 09            [11] 3770 	add	hl,bc
   7B83 7D            [ 4] 3771 	ld	a,l
   7B84 DD 86 FB      [19] 3772 	add	a, -5 (ix)
   7B87 6F            [ 4] 3773 	ld	l,a
   7B88 7C            [ 4] 3774 	ld	a,h
   7B89 CE 00         [ 7] 3775 	adc	a, #0x00
   7B8B 67            [ 4] 3776 	ld	h,a
   7B8C 7E            [ 7] 3777 	ld	a,(hl)
   7B8D DD 77 FD      [19] 3778 	ld	-3 (ix),a
   7B90 21 47 65      [10] 3779 	ld	hl,#_patrolX
   7B93 09            [11] 3780 	add	hl,bc
   7B94 DD 4E FB      [19] 3781 	ld	c,-5 (ix)
   7B97 06 00         [ 7] 3782 	ld	b,#0x00
   7B99 09            [11] 3783 	add	hl,bc
   7B9A 7E            [ 7] 3784 	ld	a,(hl)
   7B9B DD 77 FC      [19] 3785 	ld	-4 (ix),a
   7B9E DD 6E FE      [19] 3786 	ld	l,-2 (ix)
   7BA1 DD 66 FF      [19] 3787 	ld	h,-1 (ix)
   7BA4 4E            [ 7] 3788 	ld	c,(hl)
   7BA5 E1            [10] 3789 	pop	hl
   7BA6 E5            [11] 3790 	push	hl
   7BA7 46            [ 7] 3791 	ld	b,(hl)
   7BA8 D5            [11] 3792 	push	de
   7BA9 2A 1B 65      [16] 3793 	ld	hl,(_mapa)
   7BAC E5            [11] 3794 	push	hl
   7BAD D5            [11] 3795 	push	de
   7BAE DD 66 FD      [19] 3796 	ld	h,-3 (ix)
   7BB1 DD 6E FC      [19] 3797 	ld	l,-4 (ix)
   7BB4 E5            [11] 3798 	push	hl
   7BB5 79            [ 4] 3799 	ld	a,c
   7BB6 F5            [11] 3800 	push	af
   7BB7 33            [ 6] 3801 	inc	sp
   7BB8 C5            [11] 3802 	push	bc
   7BB9 33            [ 6] 3803 	inc	sp
   7BBA CD 72 49      [17] 3804 	call	_pathFinding
   7BBD 21 08 00      [10] 3805 	ld	hl,#8
   7BC0 39            [11] 3806 	add	hl,sp
   7BC1 F9            [ 6] 3807 	ld	sp,hl
   7BC2 D1            [10] 3808 	pop	de
                           3809 ;src/main.c:658: dibujarEnemigo(actual);
   7BC3 D5            [11] 3810 	push	de
   7BC4 D5            [11] 3811 	push	de
   7BC5 CD F5 67      [17] 3812 	call	_dibujarEnemigo
   7BC8 F1            [10] 3813 	pop	af
   7BC9 D1            [10] 3814 	pop	de
                           3815 ;src/main.c:659: ++actual;
   7BCA 21 E3 00      [10] 3816 	ld	hl,#0x00E3
   7BCD 19            [11] 3817 	add	hl,de
   7BCE EB            [ 4] 3818 	ex	de,hl
   7BCF C3 D8 7A      [10] 3819 	jp	00101$
   7BD2                    3820 00104$:
   7BD2 DD F9         [10] 3821 	ld	sp, ix
   7BD4 DD E1         [14] 3822 	pop	ix
   7BD6 C9            [10] 3823 	ret
                           3824 ;src/main.c:663: void avanzarMapa() {
                           3825 ;	---------------------------------
                           3826 ; Function avanzarMapa
                           3827 ; ---------------------------------
   7BD7                    3828 _avanzarMapa::
                           3829 ;src/main.c:664: if(num_mapa < NUM_MAPAS -1) {
   7BD7 3A 1D 65      [13] 3830 	ld	a,(#_num_mapa + 0)
   7BDA D6 02         [ 7] 3831 	sub	a, #0x02
   7BDC 30 34         [12] 3832 	jr	NC,00102$
                           3833 ;src/main.c:665: mapa = mapas[++num_mapa];
   7BDE 01 39 65      [10] 3834 	ld	bc,#_mapas+0
   7BE1 21 1D 65      [10] 3835 	ld	hl, #_num_mapa+0
   7BE4 34            [11] 3836 	inc	(hl)
   7BE5 FD 21 1D 65   [14] 3837 	ld	iy,#_num_mapa
   7BE9 FD 6E 00      [19] 3838 	ld	l,0 (iy)
   7BEC 26 00         [ 7] 3839 	ld	h,#0x00
   7BEE 29            [11] 3840 	add	hl, hl
   7BEF 09            [11] 3841 	add	hl,bc
   7BF0 7E            [ 7] 3842 	ld	a,(hl)
   7BF1 FD 21 1B 65   [14] 3843 	ld	iy,#_mapa
   7BF5 FD 77 00      [19] 3844 	ld	0 (iy),a
   7BF8 23            [ 6] 3845 	inc	hl
   7BF9 7E            [ 7] 3846 	ld	a,(hl)
   7BFA 32 1C 65      [13] 3847 	ld	(#_mapa + 1),a
                           3848 ;src/main.c:666: prota.x = prota.px = 2;
   7BFD 21 3B 64      [10] 3849 	ld	hl,#(_prota + 0x0002)
   7C00 36 02         [10] 3850 	ld	(hl),#0x02
   7C02 21 39 64      [10] 3851 	ld	hl,#_prota
   7C05 36 02         [10] 3852 	ld	(hl),#0x02
                           3853 ;src/main.c:667: prota.mover = SI;
   7C07 21 3F 64      [10] 3854 	ld	hl,#(_prota + 0x0006)
   7C0A 36 01         [10] 3855 	ld	(hl),#0x01
                           3856 ;src/main.c:668: dibujarMapa();
   7C0C CD 23 65      [17] 3857 	call	_dibujarMapa
                           3858 ;src/main.c:669: inicializarEnemy();
   7C0F C3 C0 7A      [10] 3859 	jp  _inicializarEnemy
   7C12                    3860 00102$:
                           3861 ;src/main.c:672: menuFin(puntuacion);
   7C12 FD 21 1E 65   [14] 3862 	ld	iy,#_puntuacion
   7C16 FD 6E 00      [19] 3863 	ld	l,0 (iy)
   7C19 26 00         [ 7] 3864 	ld	h,#0x00
   7C1B C3 F5 4B      [10] 3865 	jp  _menuFin
                           3866 ;src/main.c:676: void moverIzquierda() {
                           3867 ;	---------------------------------
                           3868 ; Function moverIzquierda
                           3869 ; ---------------------------------
   7C1E                    3870 _moverIzquierda::
                           3871 ;src/main.c:677: prota.mira = M_izquierda;
   7C1E 01 39 64      [10] 3872 	ld	bc,#_prota+0
   7C21 21 40 64      [10] 3873 	ld	hl,#(_prota + 0x0007)
   7C24 36 01         [10] 3874 	ld	(hl),#0x01
                           3875 ;src/main.c:678: if (!checkCollision(M_izquierda)) {
   7C26 C5            [11] 3876 	push	bc
   7C27 3E 01         [ 7] 3877 	ld	a,#0x01
   7C29 F5            [11] 3878 	push	af
   7C2A 33            [ 6] 3879 	inc	sp
   7C2B CD 84 66      [17] 3880 	call	_checkCollision
   7C2E 33            [ 6] 3881 	inc	sp
   7C2F C1            [10] 3882 	pop	bc
   7C30 7D            [ 4] 3883 	ld	a,l
   7C31 B7            [ 4] 3884 	or	a, a
   7C32 C0            [11] 3885 	ret	NZ
                           3886 ;src/main.c:679: prota.x--;
   7C33 0A            [ 7] 3887 	ld	a,(bc)
   7C34 C6 FF         [ 7] 3888 	add	a,#0xFF
   7C36 02            [ 7] 3889 	ld	(bc),a
                           3890 ;src/main.c:680: prota.mover = SI;
   7C37 21 3F 64      [10] 3891 	ld	hl,#(_prota + 0x0006)
   7C3A 36 01         [10] 3892 	ld	(hl),#0x01
                           3893 ;src/main.c:681: prota.sprite = g_hero_left;
   7C3C 21 C6 3D      [10] 3894 	ld	hl,#_g_hero_left
   7C3F 22 3D 64      [16] 3895 	ld	((_prota + 0x0004)), hl
   7C42 C9            [10] 3896 	ret
                           3897 ;src/main.c:685: void moverDerecha() {
                           3898 ;	---------------------------------
                           3899 ; Function moverDerecha
                           3900 ; ---------------------------------
   7C43                    3901 _moverDerecha::
                           3902 ;src/main.c:686: prota.mira = M_derecha;
   7C43 21 40 64      [10] 3903 	ld	hl,#(_prota + 0x0007)
   7C46 36 00         [10] 3904 	ld	(hl),#0x00
                           3905 ;src/main.c:687: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C48 AF            [ 4] 3906 	xor	a, a
   7C49 F5            [11] 3907 	push	af
   7C4A 33            [ 6] 3908 	inc	sp
   7C4B CD 84 66      [17] 3909 	call	_checkCollision
   7C4E 33            [ 6] 3910 	inc	sp
   7C4F 45            [ 4] 3911 	ld	b,l
   7C50 21 39 64      [10] 3912 	ld	hl, #_prota + 0
   7C53 4E            [ 7] 3913 	ld	c,(hl)
   7C54 59            [ 4] 3914 	ld	e,c
   7C55 16 00         [ 7] 3915 	ld	d,#0x00
   7C57 21 07 00      [10] 3916 	ld	hl,#0x0007
   7C5A 19            [11] 3917 	add	hl,de
   7C5B 11 50 80      [10] 3918 	ld	de, #0x8050
   7C5E 29            [11] 3919 	add	hl, hl
   7C5F 3F            [ 4] 3920 	ccf
   7C60 CB 1C         [ 8] 3921 	rr	h
   7C62 CB 1D         [ 8] 3922 	rr	l
   7C64 ED 52         [15] 3923 	sbc	hl, de
   7C66 3E 00         [ 7] 3924 	ld	a,#0x00
   7C68 17            [ 4] 3925 	rla
   7C69 5F            [ 4] 3926 	ld	e,a
   7C6A 78            [ 4] 3927 	ld	a,b
   7C6B B7            [ 4] 3928 	or	a,a
   7C6C 20 14         [12] 3929 	jr	NZ,00104$
   7C6E B3            [ 4] 3930 	or	a,e
   7C6F 28 11         [12] 3931 	jr	Z,00104$
                           3932 ;src/main.c:688: prota.x++;
   7C71 0C            [ 4] 3933 	inc	c
   7C72 21 39 64      [10] 3934 	ld	hl,#_prota
   7C75 71            [ 7] 3935 	ld	(hl),c
                           3936 ;src/main.c:689: prota.mover = SI;
   7C76 21 3F 64      [10] 3937 	ld	hl,#(_prota + 0x0006)
   7C79 36 01         [10] 3938 	ld	(hl),#0x01
                           3939 ;src/main.c:690: prota.sprite = g_hero;
   7C7B 21 70 3E      [10] 3940 	ld	hl,#_g_hero
   7C7E 22 3D 64      [16] 3941 	ld	((_prota + 0x0004)), hl
   7C81 C9            [10] 3942 	ret
   7C82                    3943 00104$:
                           3944 ;src/main.c:691: }else if( prota.x + G_HERO_W >= 80){
   7C82 7B            [ 4] 3945 	ld	a,e
   7C83 B7            [ 4] 3946 	or	a, a
   7C84 C0            [11] 3947 	ret	NZ
                           3948 ;src/main.c:692: avanzarMapa();
   7C85 C3 D7 7B      [10] 3949 	jp  _avanzarMapa
                           3950 ;src/main.c:696: void moverArriba() {
                           3951 ;	---------------------------------
                           3952 ; Function moverArriba
                           3953 ; ---------------------------------
   7C88                    3954 _moverArriba::
                           3955 ;src/main.c:697: prota.mira = M_arriba;
   7C88 21 40 64      [10] 3956 	ld	hl,#(_prota + 0x0007)
   7C8B 36 02         [10] 3957 	ld	(hl),#0x02
                           3958 ;src/main.c:698: if (!checkCollision(M_arriba)) {
   7C8D 3E 02         [ 7] 3959 	ld	a,#0x02
   7C8F F5            [11] 3960 	push	af
   7C90 33            [ 6] 3961 	inc	sp
   7C91 CD 84 66      [17] 3962 	call	_checkCollision
   7C94 33            [ 6] 3963 	inc	sp
   7C95 7D            [ 4] 3964 	ld	a,l
   7C96 B7            [ 4] 3965 	or	a, a
   7C97 C0            [11] 3966 	ret	NZ
                           3967 ;src/main.c:699: prota.y--;
   7C98 21 3A 64      [10] 3968 	ld	hl,#_prota + 1
   7C9B 4E            [ 7] 3969 	ld	c,(hl)
   7C9C 0D            [ 4] 3970 	dec	c
   7C9D 71            [ 7] 3971 	ld	(hl),c
                           3972 ;src/main.c:700: prota.y--;
   7C9E 0D            [ 4] 3973 	dec	c
   7C9F 71            [ 7] 3974 	ld	(hl),c
                           3975 ;src/main.c:701: prota.mover  = SI;
   7CA0 21 3F 64      [10] 3976 	ld	hl,#(_prota + 0x0006)
   7CA3 36 01         [10] 3977 	ld	(hl),#0x01
                           3978 ;src/main.c:702: prota.sprite = g_hero_up;
   7CA5 21 2C 3D      [10] 3979 	ld	hl,#_g_hero_up
   7CA8 22 3D 64      [16] 3980 	ld	((_prota + 0x0004)), hl
   7CAB C9            [10] 3981 	ret
                           3982 ;src/main.c:706: void moverAbajo() {
                           3983 ;	---------------------------------
                           3984 ; Function moverAbajo
                           3985 ; ---------------------------------
   7CAC                    3986 _moverAbajo::
                           3987 ;src/main.c:707: prota.mira = M_abajo;
   7CAC 21 40 64      [10] 3988 	ld	hl,#(_prota + 0x0007)
   7CAF 36 03         [10] 3989 	ld	(hl),#0x03
                           3990 ;src/main.c:708: if (!checkCollision(M_abajo) ) {
   7CB1 3E 03         [ 7] 3991 	ld	a,#0x03
   7CB3 F5            [11] 3992 	push	af
   7CB4 33            [ 6] 3993 	inc	sp
   7CB5 CD 84 66      [17] 3994 	call	_checkCollision
   7CB8 33            [ 6] 3995 	inc	sp
   7CB9 7D            [ 4] 3996 	ld	a,l
   7CBA B7            [ 4] 3997 	or	a, a
   7CBB C0            [11] 3998 	ret	NZ
                           3999 ;src/main.c:709: prota.y++;
   7CBC 01 3A 64      [10] 4000 	ld	bc,#_prota + 1
   7CBF 0A            [ 7] 4001 	ld	a,(bc)
   7CC0 3C            [ 4] 4002 	inc	a
   7CC1 02            [ 7] 4003 	ld	(bc),a
                           4004 ;src/main.c:710: prota.y++;
   7CC2 3C            [ 4] 4005 	inc	a
   7CC3 02            [ 7] 4006 	ld	(bc),a
                           4007 ;src/main.c:711: prota.mover  = SI;
   7CC4 21 3F 64      [10] 4008 	ld	hl,#(_prota + 0x0006)
   7CC7 36 01         [10] 4009 	ld	(hl),#0x01
                           4010 ;src/main.c:712: prota.sprite = g_hero_down;
   7CC9 21 92 3C      [10] 4011 	ld	hl,#_g_hero_down
   7CCC 22 3D 64      [16] 4012 	ld	((_prota + 0x0004)), hl
   7CCF C9            [10] 4013 	ret
                           4014 ;src/main.c:719: void intHandler() {
                           4015 ;	---------------------------------
                           4016 ; Function intHandler
                           4017 ; ---------------------------------
   7CD0                    4018 _intHandler::
                           4019 ;src/main.c:720: if (++i == 6) {
   7CD0 21 51 64      [10] 4020 	ld	hl, #_i+0
   7CD3 34            [11] 4021 	inc	(hl)
   7CD4 3A 51 64      [13] 4022 	ld	a,(#_i + 0)
   7CD7 D6 06         [ 7] 4023 	sub	a, #0x06
   7CD9 C0            [11] 4024 	ret	NZ
                           4025 ;src/main.c:721: play();
   7CDA CD 81 53      [17] 4026 	call	_play
                           4027 ;src/main.c:722: i=0;
   7CDD 21 51 64      [10] 4028 	ld	hl,#_i + 0
   7CE0 36 00         [10] 4029 	ld	(hl), #0x00
   7CE2 C9            [10] 4030 	ret
                           4031 ;src/main.c:726: void inicializarCPC() {
                           4032 ;	---------------------------------
                           4033 ; Function inicializarCPC
                           4034 ; ---------------------------------
   7CE3                    4035 _inicializarCPC::
                           4036 ;src/main.c:727: cpct_disableFirmware();
   7CE3 CD 28 57      [17] 4037 	call	_cpct_disableFirmware
                           4038 ;src/main.c:728: cpct_setVideoMode(0);
   7CE6 2E 00         [ 7] 4039 	ld	l,#0x00
   7CE8 CD FC 56      [17] 4040 	call	_cpct_setVideoMode
                           4041 ;src/main.c:729: cpct_setBorder(HW_BLACK);
   7CEB 21 10 14      [10] 4042 	ld	hl,#0x1410
   7CEE E5            [11] 4043 	push	hl
   7CEF CD 5F 54      [17] 4044 	call	_cpct_setPALColour
                           4045 ;src/main.c:730: cpct_setPalette(g_palette, 16);
   7CF2 21 10 00      [10] 4046 	ld	hl,#0x0010
   7CF5 E5            [11] 4047 	push	hl
   7CF6 21 60 3E      [10] 4048 	ld	hl,#_g_palette
   7CF9 E5            [11] 4049 	push	hl
   7CFA CD 3C 54      [17] 4050 	call	_cpct_setPalette
   7CFD C9            [10] 4051 	ret
                           4052 ;src/main.c:735: void inicializarJuego() {
                           4053 ;	---------------------------------
                           4054 ; Function inicializarJuego
                           4055 ; ---------------------------------
   7CFE                    4056 _inicializarJuego::
                           4057 ;src/main.c:736: cambio = 0;
   7CFE 21 4D 64      [10] 4058 	ld	hl,#_cambio + 0
   7D01 36 00         [10] 4059 	ld	(hl), #0x00
                           4060 ;src/main.c:737: timer = 0;
   7D03 21 00 00      [10] 4061 	ld	hl,#0x0000
   7D06 22 4E 64      [16] 4062 	ld	(_timer),hl
                           4063 ;src/main.c:738: parpadeo = 0;
   7D09 21 4C 64      [10] 4064 	ld	hl,#_parpadeo + 0
   7D0C 36 00         [10] 4065 	ld	(hl), #0x00
                           4066 ;src/main.c:740: num_mapa = 0;
   7D0E 21 1D 65      [10] 4067 	ld	hl,#_num_mapa + 0
   7D11 36 00         [10] 4068 	ld	(hl), #0x00
                           4069 ;src/main.c:741: mapa = mapas[num_mapa];
   7D13 21 39 65      [10] 4070 	ld	hl, #_mapas + 0
   7D16 7E            [ 7] 4071 	ld	a,(hl)
   7D17 FD 21 1B 65   [14] 4072 	ld	iy,#_mapa
   7D1B FD 77 00      [19] 4073 	ld	0 (iy),a
   7D1E 23            [ 6] 4074 	inc	hl
   7D1F 7E            [ 7] 4075 	ld	a,(hl)
   7D20 32 1C 65      [13] 4076 	ld	(#_mapa + 1),a
                           4077 ;src/main.c:742: cpct_etm_setTileset2x4(g_tileset);
   7D23 21 E0 17      [10] 4078 	ld	hl,#_g_tileset
   7D26 CD 50 56      [17] 4079 	call	_cpct_etm_setTileset2x4
                           4080 ;src/main.c:744: dibujarMapa();
   7D29 CD 23 65      [17] 4081 	call	_dibujarMapa
                           4082 ;src/main.c:747: barraPuntuacionInicial();
   7D2C CD 95 51      [17] 4083 	call	_barraPuntuacionInicial
                           4084 ;src/main.c:750: prota.x = prota.px = 4;
   7D2F 21 3B 64      [10] 4085 	ld	hl,#(_prota + 0x0002)
   7D32 36 04         [10] 4086 	ld	(hl),#0x04
   7D34 21 39 64      [10] 4087 	ld	hl,#_prota
   7D37 36 04         [10] 4088 	ld	(hl),#0x04
                           4089 ;src/main.c:751: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D39 21 3C 64      [10] 4090 	ld	hl,#(_prota + 0x0003)
   7D3C 36 68         [10] 4091 	ld	(hl),#0x68
   7D3E 21 3A 64      [10] 4092 	ld	hl,#(_prota + 0x0001)
   7D41 36 68         [10] 4093 	ld	(hl),#0x68
                           4094 ;src/main.c:752: prota.mover  = NO;
   7D43 21 3F 64      [10] 4095 	ld	hl,#(_prota + 0x0006)
   7D46 36 00         [10] 4096 	ld	(hl),#0x00
                           4097 ;src/main.c:753: prota.mira=M_derecha;
   7D48 21 40 64      [10] 4098 	ld	hl,#(_prota + 0x0007)
   7D4B 36 00         [10] 4099 	ld	(hl),#0x00
                           4100 ;src/main.c:754: prota.sprite = g_hero;
   7D4D 21 70 3E      [10] 4101 	ld	hl,#_g_hero
   7D50 22 3D 64      [16] 4102 	ld	((_prota + 0x0004)), hl
                           4103 ;src/main.c:758: cu.x = cu.px = 0;
   7D53 21 43 64      [10] 4104 	ld	hl,#(_cu + 0x0002)
   7D56 36 00         [10] 4105 	ld	(hl),#0x00
   7D58 21 41 64      [10] 4106 	ld	hl,#_cu
   7D5B 36 00         [10] 4107 	ld	(hl),#0x00
                           4108 ;src/main.c:759: cu.y = cu.py = 0;
   7D5D 21 44 64      [10] 4109 	ld	hl,#(_cu + 0x0003)
   7D60 36 00         [10] 4110 	ld	(hl),#0x00
   7D62 21 42 64      [10] 4111 	ld	hl,#(_cu + 0x0001)
   7D65 36 00         [10] 4112 	ld	(hl),#0x00
                           4113 ;src/main.c:760: cu.lanzado = NO;
   7D67 21 47 64      [10] 4114 	ld	hl,#(_cu + 0x0006)
   7D6A 36 00         [10] 4115 	ld	(hl),#0x00
                           4116 ;src/main.c:761: cu.mover = NO;
   7D6C 21 4A 64      [10] 4117 	ld	hl,#(_cu + 0x0009)
   7D6F 36 00         [10] 4118 	ld	(hl),#0x00
                           4119 ;src/main.c:762: cu.off_bound = NO;
   7D71 21 4B 64      [10] 4120 	ld	hl,#(_cu + 0x000a)
   7D74 36 00         [10] 4121 	ld	(hl),#0x00
                           4122 ;src/main.c:764: inicializarEnemy();
   7D76 CD C0 7A      [17] 4123 	call	_inicializarEnemy
                           4124 ;src/main.c:766: dibujarProta();
   7D79 C3 6F 65      [10] 4125 	jp  _dibujarProta
                           4126 ;src/main.c:769: void main(void) {
                           4127 ;	---------------------------------
                           4128 ; Function main
                           4129 ; ---------------------------------
   7D7C                    4130 _main::
   7D7C DD E5         [15] 4131 	push	ix
   7D7E DD 21 00 00   [14] 4132 	ld	ix,#0
   7D82 DD 39         [15] 4133 	add	ix,sp
   7D84 21 F3 FF      [10] 4134 	ld	hl,#-13
   7D87 39            [11] 4135 	add	hl,sp
   7D88 F9            [ 6] 4136 	ld	sp,hl
                           4137 ;src/main.c:774: vidas = 6;
   7D89 21 50 64      [10] 4138 	ld	hl,#_vidas + 0
   7D8C 36 06         [10] 4139 	ld	(hl), #0x06
                           4140 ;src/main.c:776: inicializarCPC();
   7D8E CD E3 7C      [17] 4141 	call	_inicializarCPC
                           4142 ;src/main.c:778: menuInicio();
   7D91 CD B6 50      [17] 4143 	call	_menuInicio
                           4144 ;src/main.c:780: inicializarJuego();
   7D94 CD FE 7C      [17] 4145 	call	_inicializarJuego
                           4146 ;src/main.c:784: while (1) {
   7D97                    4147 00145$:
                           4148 ;src/main.c:785: ++timer;
   7D97 21 4E 64      [10] 4149 	ld	hl, #_timer+0
   7D9A 34            [11] 4150 	inc	(hl)
   7D9B 20 04         [12] 4151 	jr	NZ,00259$
   7D9D 21 4F 64      [10] 4152 	ld	hl, #_timer+1
   7DA0 34            [11] 4153 	inc	(hl)
   7DA1                    4154 00259$:
                           4155 ;src/main.c:786: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7DA1 3A 4E 64      [13] 4156 	ld	a,(#_timer + 0)
   7DA4 D6 04         [ 7] 4157 	sub	a, #0x04
   7DA6 20 30         [12] 4158 	jr	NZ,00104$
   7DA8 3A 4F 64      [13] 4159 	ld	a,(#_timer + 1)
   7DAB B7            [ 4] 4160 	or	a, a
   7DAC 20 2A         [12] 4161 	jr	NZ,00104$
   7DAE 3A 4D 64      [13] 4162 	ld	a,(#_cambio + 0)
   7DB1 B7            [ 4] 4163 	or	a, a
   7DB2 28 24         [12] 4164 	jr	Z,00104$
   7DB4 3E 0C         [ 7] 4165 	ld	a,#0x0C
   7DB6 FD 21 4D 64   [14] 4166 	ld	iy,#_cambio
   7DBA FD 96 00      [19] 4167 	sub	a, 0 (iy)
   7DBD 38 19         [12] 4168 	jr	C,00104$
                           4169 ;src/main.c:787: timer = 0;
   7DBF 21 00 00      [10] 4170 	ld	hl,#0x0000
   7DC2 22 4E 64      [16] 4171 	ld	(_timer),hl
                           4172 ;src/main.c:788: parpadeo = !parpadeo;
   7DC5 3A 4C 64      [13] 4173 	ld	a,(#_parpadeo + 0)
   7DC8 D6 01         [ 7] 4174 	sub	a,#0x01
   7DCA 3E 00         [ 7] 4175 	ld	a,#0x00
   7DCC 17            [ 4] 4176 	rla
   7DCD 4F            [ 4] 4177 	ld	c,a
   7DCE 21 4C 64      [10] 4178 	ld	hl,#_parpadeo + 0
   7DD1 71            [ 7] 4179 	ld	(hl), c
                           4180 ;src/main.c:789: cambio ++;
   7DD2 21 4D 64      [10] 4181 	ld	hl, #_cambio+0
   7DD5 34            [11] 4182 	inc	(hl)
   7DD6 18 0C         [12] 4183 	jr	00105$
   7DD8                    4184 00104$:
                           4185 ;src/main.c:790: }else if(cambio == 12){
   7DD8 3A 4D 64      [13] 4186 	ld	a,(#_cambio + 0)
   7DDB D6 0C         [ 7] 4187 	sub	a, #0x0C
   7DDD 20 05         [12] 4188 	jr	NZ,00105$
                           4189 ;src/main.c:791: cambio = 0;
   7DDF 21 4D 64      [10] 4190 	ld	hl,#_cambio + 0
   7DE2 36 00         [10] 4191 	ld	(hl), #0x00
   7DE4                    4192 00105$:
                           4193 ;src/main.c:793: i = 2 + num_mapa;
   7DE4 21 1D 65      [10] 4194 	ld	hl,#_num_mapa + 0
   7DE7 4E            [ 7] 4195 	ld	c, (hl)
   7DE8 0C            [ 4] 4196 	inc	c
   7DE9 0C            [ 4] 4197 	inc	c
                           4198 ;src/main.c:794: actual = enemy;
                           4199 ;src/main.c:796: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7DEA C5            [11] 4200 	push	bc
   7DEB 21 00 01      [10] 4201 	ld	hl,#_g_tablatrans
   7DEE E5            [11] 4202 	push	hl
   7DEF 2A 1B 65      [16] 4203 	ld	hl,(_mapa)
   7DF2 E5            [11] 4204 	push	hl
   7DF3 21 39 64      [10] 4205 	ld	hl,#_prota
   7DF6 E5            [11] 4206 	push	hl
   7DF7 21 41 64      [10] 4207 	ld	hl,#_cu
   7DFA E5            [11] 4208 	push	hl
   7DFB CD 1D 66      [17] 4209 	call	_comprobarTeclado
   7DFE 21 08 00      [10] 4210 	ld	hl,#8
   7E01 39            [11] 4211 	add	hl,sp
   7E02 F9            [ 6] 4212 	ld	sp,hl
   7E03 2A 1B 65      [16] 4213 	ld	hl,(_mapa)
   7E06 E5            [11] 4214 	push	hl
   7E07 21 41 64      [10] 4215 	ld	hl,#_cu
   7E0A E5            [11] 4216 	push	hl
   7E0B CD 15 43      [17] 4217 	call	_moverCuchillo
   7E0E F1            [10] 4218 	pop	af
   7E0F F1            [10] 4219 	pop	af
   7E10 C1            [10] 4220 	pop	bc
                           4221 ;src/main.c:798: while(i){
   7E11 DD 71 FB      [19] 4222 	ld	-5 (ix),c
   7E14 DD 36 F7 AD   [19] 4223 	ld	-9 (ix),#<(_enemy)
   7E18 DD 36 F8 60   [19] 4224 	ld	-8 (ix),#>(_enemy)
   7E1C                    4225 00112$:
   7E1C DD 7E FB      [19] 4226 	ld	a,-5 (ix)
   7E1F B7            [ 4] 4227 	or	a, a
   7E20 28 56         [12] 4228 	jr	Z,00114$
                           4229 ;src/main.c:800: --i;
   7E22 DD 35 FB      [23] 4230 	dec	-5 (ix)
                           4231 ;src/main.c:801: if(!actual->muerto){
   7E25 DD 7E F7      [19] 4232 	ld	a,-9 (ix)
   7E28 C6 08         [ 7] 4233 	add	a, #0x08
   7E2A DD 77 FE      [19] 4234 	ld	-2 (ix),a
   7E2D DD 7E F8      [19] 4235 	ld	a,-8 (ix)
   7E30 CE 00         [ 7] 4236 	adc	a, #0x00
   7E32 DD 77 FF      [19] 4237 	ld	-1 (ix),a
   7E35 DD 6E FE      [19] 4238 	ld	l,-2 (ix)
   7E38 DD 66 FF      [19] 4239 	ld	h,-1 (ix)
   7E3B 7E            [ 7] 4240 	ld	a,(hl)
   7E3C B7            [ 4] 4241 	or	a, a
   7E3D 20 12         [12] 4242 	jr	NZ,00109$
                           4243 ;src/main.c:802: checkEnemyDead(cu.direccion, actual);
   7E3F 21 48 64      [10] 4244 	ld	hl, #_cu + 7
   7E42 46            [ 7] 4245 	ld	b,(hl)
   7E43 DD 6E F7      [19] 4246 	ld	l,-9 (ix)
   7E46 DD 66 F8      [19] 4247 	ld	h,-8 (ix)
   7E49 E5            [11] 4248 	push	hl
   7E4A C5            [11] 4249 	push	bc
   7E4B 33            [ 6] 4250 	inc	sp
   7E4C CD 77 69      [17] 4251 	call	_checkEnemyDead
   7E4F F1            [10] 4252 	pop	af
   7E50 33            [ 6] 4253 	inc	sp
   7E51                    4254 00109$:
                           4255 ;src/main.c:804: if(!actual->muerto){
   7E51 DD 6E FE      [19] 4256 	ld	l,-2 (ix)
   7E54 DD 66 FF      [19] 4257 	ld	h,-1 (ix)
   7E57 7E            [ 7] 4258 	ld	a,(hl)
   7E58 B7            [ 4] 4259 	or	a, a
   7E59 20 0B         [12] 4260 	jr	NZ,00111$
                           4261 ;src/main.c:805: updateEnemy(actual);
   7E5B DD 6E F7      [19] 4262 	ld	l,-9 (ix)
   7E5E DD 66 F8      [19] 4263 	ld	h,-8 (ix)
   7E61 E5            [11] 4264 	push	hl
   7E62 CD 53 79      [17] 4265 	call	_updateEnemy
   7E65 F1            [10] 4266 	pop	af
   7E66                    4267 00111$:
                           4268 ;src/main.c:807: ++actual;
   7E66 DD 7E F7      [19] 4269 	ld	a,-9 (ix)
   7E69 C6 E3         [ 7] 4270 	add	a, #0xE3
   7E6B DD 77 F7      [19] 4271 	ld	-9 (ix),a
   7E6E DD 7E F8      [19] 4272 	ld	a,-8 (ix)
   7E71 CE 00         [ 7] 4273 	adc	a, #0x00
   7E73 DD 77 F8      [19] 4274 	ld	-8 (ix),a
   7E76 18 A4         [12] 4275 	jr	00112$
   7E78                    4276 00114$:
                           4277 ;src/main.c:810: cpct_waitVSYNC();
   7E78 CD F4 56      [17] 4278 	call	_cpct_waitVSYNC
                           4279 ;src/main.c:813: if (prota.mover) {
   7E7B 01 3F 64      [10] 4280 	ld	bc,#_prota + 6
   7E7E 0A            [ 7] 4281 	ld	a,(bc)
   7E7F B7            [ 4] 4282 	or	a, a
   7E80 28 07         [12] 4283 	jr	Z,00116$
                           4284 ;src/main.c:814: redibujarProta();
   7E82 C5            [11] 4285 	push	bc
   7E83 CD 09 66      [17] 4286 	call	_redibujarProta
   7E86 C1            [10] 4287 	pop	bc
                           4288 ;src/main.c:815: prota.mover = NO;
   7E87 AF            [ 4] 4289 	xor	a, a
   7E88 02            [ 7] 4290 	ld	(bc),a
   7E89                    4291 00116$:
                           4292 ;src/main.c:817: if(cu.lanzado && cu.mover){
   7E89 21 47 64      [10] 4293 	ld	hl, #(_cu + 0x0006) + 0
   7E8C 4E            [ 7] 4294 	ld	c,(hl)
                           4295 ;src/main.c:818: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4296 ;src/main.c:817: if(cu.lanzado && cu.mover){
   7E8D 79            [ 4] 4297 	ld	a,c
   7E8E B7            [ 4] 4298 	or	a, a
   7E8F 28 30         [12] 4299 	jr	Z,00121$
   7E91 3A 4A 64      [13] 4300 	ld	a, (#(_cu + 0x0009) + 0)
   7E94 B7            [ 4] 4301 	or	a, a
   7E95 28 2A         [12] 4302 	jr	Z,00121$
                           4303 ;src/main.c:818: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E97 21 42 64      [10] 4304 	ld	hl, #(_cu + 0x0001) + 0
   7E9A 4E            [ 7] 4305 	ld	c,(hl)
   7E9B 21 41 64      [10] 4306 	ld	hl, #_cu + 0
   7E9E 46            [ 7] 4307 	ld	b,(hl)
   7E9F 21 49 64      [10] 4308 	ld	hl, #(_cu + 0x0008) + 0
   7EA2 5E            [ 7] 4309 	ld	e,(hl)
   7EA3 2A 1B 65      [16] 4310 	ld	hl,(_mapa)
   7EA6 E5            [11] 4311 	push	hl
   7EA7 21 00 01      [10] 4312 	ld	hl,#_g_tablatrans
   7EAA E5            [11] 4313 	push	hl
   7EAB 21 41 64      [10] 4314 	ld	hl,#_cu
   7EAE E5            [11] 4315 	push	hl
   7EAF 79            [ 4] 4316 	ld	a,c
   7EB0 F5            [11] 4317 	push	af
   7EB1 33            [ 6] 4318 	inc	sp
   7EB2 C5            [11] 4319 	push	bc
   7EB3 33            [ 6] 4320 	inc	sp
   7EB4 7B            [ 4] 4321 	ld	a,e
   7EB5 F5            [11] 4322 	push	af
   7EB6 33            [ 6] 4323 	inc	sp
   7EB7 CD 25 40      [17] 4324 	call	_redibujarCuchillo
   7EBA 21 09 00      [10] 4325 	ld	hl,#9
   7EBD 39            [11] 4326 	add	hl,sp
   7EBE F9            [ 6] 4327 	ld	sp,hl
   7EBF 18 32         [12] 4328 	jr	00122$
   7EC1                    4329 00121$:
                           4330 ;src/main.c:819: }else if (cu.lanzado && !cu.mover){
   7EC1 79            [ 4] 4331 	ld	a,c
   7EC2 B7            [ 4] 4332 	or	a, a
   7EC3 28 2E         [12] 4333 	jr	Z,00122$
   7EC5 3A 4A 64      [13] 4334 	ld	a, (#(_cu + 0x0009) + 0)
   7EC8 B7            [ 4] 4335 	or	a, a
   7EC9 20 28         [12] 4336 	jr	NZ,00122$
                           4337 ;src/main.c:820: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7ECB 21 42 64      [10] 4338 	ld	hl, #(_cu + 0x0001) + 0
   7ECE 46            [ 7] 4339 	ld	b,(hl)
   7ECF 21 41 64      [10] 4340 	ld	hl, #_cu + 0
   7ED2 4E            [ 7] 4341 	ld	c,(hl)
   7ED3 21 49 64      [10] 4342 	ld	hl, #(_cu + 0x0008) + 0
   7ED6 56            [ 7] 4343 	ld	d,(hl)
   7ED7 2A 1B 65      [16] 4344 	ld	hl,(_mapa)
   7EDA E5            [11] 4345 	push	hl
   7EDB C5            [11] 4346 	push	bc
   7EDC D5            [11] 4347 	push	de
   7EDD 33            [ 6] 4348 	inc	sp
   7EDE CD 92 3F      [17] 4349 	call	_borrarCuchillo
   7EE1 F1            [10] 4350 	pop	af
   7EE2 F1            [10] 4351 	pop	af
   7EE3 33            [ 6] 4352 	inc	sp
                           4353 ;src/main.c:821: cu.lanzado = NO;
   7EE4 21 47 64      [10] 4354 	ld	hl,#(_cu + 0x0006)
   7EE7 36 00         [10] 4355 	ld	(hl),#0x00
                           4356 ;src/main.c:823: cu.x = 0;
   7EE9 21 41 64      [10] 4357 	ld	hl,#_cu
   7EEC 36 00         [10] 4358 	ld	(hl),#0x00
                           4359 ;src/main.c:824: cu.y=0;
   7EEE 21 42 64      [10] 4360 	ld	hl,#(_cu + 0x0001)
   7EF1 36 00         [10] 4361 	ld	(hl),#0x00
   7EF3                    4362 00122$:
                           4363 ;src/main.c:827: i = 2 + num_mapa;
   7EF3 21 1D 65      [10] 4364 	ld	hl,#_num_mapa + 0
   7EF6 4E            [ 7] 4365 	ld	c, (hl)
   7EF7 0C            [ 4] 4366 	inc	c
   7EF8 0C            [ 4] 4367 	inc	c
                           4368 ;src/main.c:828: actual = enemy;
   7EF9 11 AD 60      [10] 4369 	ld	de,#_enemy
                           4370 ;src/main.c:829: while(i){
   7EFC                    4371 00141$:
   7EFC 79            [ 4] 4372 	ld	a,c
   7EFD B7            [ 4] 4373 	or	a, a
   7EFE CA 69 80      [10] 4374 	jp	Z,00143$
                           4375 ;src/main.c:831: --i;
   7F01 0D            [ 4] 4376 	dec	c
                           4377 ;src/main.c:832: if(actual->mover){
   7F02 21 06 00      [10] 4378 	ld	hl,#0x0006
   7F05 19            [11] 4379 	add	hl,de
   7F06 DD 75 FE      [19] 4380 	ld	-2 (ix),l
   7F09 DD 74 FF      [19] 4381 	ld	-1 (ix),h
   7F0C DD 6E FE      [19] 4382 	ld	l,-2 (ix)
   7F0F DD 66 FF      [19] 4383 	ld	h,-1 (ix)
   7F12 46            [ 7] 4384 	ld	b,(hl)
                           4385 ;src/main.c:833: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F13 21 03 00      [10] 4386 	ld	hl,#0x0003
   7F16 19            [11] 4387 	add	hl,de
   7F17 DD 75 F7      [19] 4388 	ld	-9 (ix),l
   7F1A DD 74 F8      [19] 4389 	ld	-8 (ix),h
   7F1D 21 02 00      [10] 4390 	ld	hl,#0x0002
   7F20 19            [11] 4391 	add	hl,de
   7F21 DD 75 FC      [19] 4392 	ld	-4 (ix),l
   7F24 DD 74 FD      [19] 4393 	ld	-3 (ix),h
                           4394 ;src/main.c:832: if(actual->mover){
   7F27 78            [ 4] 4395 	ld	a,b
   7F28 B7            [ 4] 4396 	or	a, a
   7F29 28 22         [12] 4397 	jr	Z,00125$
                           4398 ;src/main.c:833: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F2B DD 6E F7      [19] 4399 	ld	l,-9 (ix)
   7F2E DD 66 F8      [19] 4400 	ld	h,-8 (ix)
   7F31 7E            [ 7] 4401 	ld	a,(hl)
   7F32 DD 77 FB      [19] 4402 	ld	-5 (ix),a
   7F35 DD 6E FC      [19] 4403 	ld	l,-4 (ix)
   7F38 DD 66 FD      [19] 4404 	ld	h,-3 (ix)
   7F3B 46            [ 7] 4405 	ld	b,(hl)
   7F3C C5            [11] 4406 	push	bc
   7F3D D5            [11] 4407 	push	de
   7F3E D5            [11] 4408 	push	de
   7F3F DD 7E FB      [19] 4409 	ld	a,-5 (ix)
   7F42 F5            [11] 4410 	push	af
   7F43 33            [ 6] 4411 	inc	sp
   7F44 C5            [11] 4412 	push	bc
   7F45 33            [ 6] 4413 	inc	sp
   7F46 CD 46 69      [17] 4414 	call	_redibujarEnemigo
   7F49 F1            [10] 4415 	pop	af
   7F4A F1            [10] 4416 	pop	af
   7F4B D1            [10] 4417 	pop	de
   7F4C C1            [10] 4418 	pop	bc
   7F4D                    4419 00125$:
                           4420 ;src/main.c:836: if (actual->muerto && actual->muertes == 0){
   7F4D 21 08 00      [10] 4421 	ld	hl,#0x0008
   7F50 19            [11] 4422 	add	hl,de
   7F51 E3            [19] 4423 	ex	(sp), hl
   7F52 E1            [10] 4424 	pop	hl
   7F53 E5            [11] 4425 	push	hl
   7F54 7E            [ 7] 4426 	ld	a,(hl)
   7F55 B7            [ 4] 4427 	or	a, a
   7F56 CA EC 7F      [10] 4428 	jp	Z,00127$
   7F59 21 0A 00      [10] 4429 	ld	hl,#0x000A
   7F5C 19            [11] 4430 	add	hl,de
   7F5D DD 75 F5      [19] 4431 	ld	-11 (ix),l
   7F60 DD 74 F6      [19] 4432 	ld	-10 (ix),h
   7F63 DD 6E F5      [19] 4433 	ld	l,-11 (ix)
   7F66 DD 66 F6      [19] 4434 	ld	h,-10 (ix)
   7F69 7E            [ 7] 4435 	ld	a,(hl)
   7F6A B7            [ 4] 4436 	or	a, a
   7F6B C2 EC 7F      [10] 4437 	jp	NZ,00127$
                           4438 ;src/main.c:837: timer = 3;
   7F6E 21 03 00      [10] 4439 	ld	hl,#0x0003
   7F71 22 4E 64      [16] 4440 	ld	(_timer),hl
                           4441 ;src/main.c:838: cambio++;
   7F74 FD 21 4D 64   [14] 4442 	ld	iy,#_cambio
   7F78 FD 34 00      [23] 4443 	inc	0 (iy)
                           4444 ;src/main.c:839: parpadeo = 1;
   7F7B FD 21 4C 64   [14] 4445 	ld	iy,#_parpadeo
   7F7F FD 36 00 01   [19] 4446 	ld	0 (iy),#0x01
                           4447 ;src/main.c:840: borrarEnemigo((*actual).x, (*actual).y);
   7F83 2E 01         [ 7] 4448 	ld	l, #0x01
   7F85 19            [11] 4449 	add	hl,de
   7F86 DD 75 F9      [19] 4450 	ld	-7 (ix),l
   7F89 DD 74 FA      [19] 4451 	ld	-6 (ix),h
   7F8C DD 6E F9      [19] 4452 	ld	l,-7 (ix)
   7F8F DD 66 FA      [19] 4453 	ld	h,-6 (ix)
   7F92 46            [ 7] 4454 	ld	b,(hl)
   7F93 1A            [ 7] 4455 	ld	a,(de)
   7F94 C5            [11] 4456 	push	bc
   7F95 D5            [11] 4457 	push	de
   7F96 C5            [11] 4458 	push	bc
   7F97 33            [ 6] 4459 	inc	sp
   7F98 F5            [11] 4460 	push	af
   7F99 33            [ 6] 4461 	inc	sp
   7F9A CD D6 68      [17] 4462 	call	_borrarEnemigo
   7F9D F1            [10] 4463 	pop	af
   7F9E D1            [10] 4464 	pop	de
   7F9F C1            [10] 4465 	pop	bc
                           4466 ;src/main.c:841: puntuacion_aux = puntuacion;
   7FA0 FD 21 1E 65   [14] 4467 	ld	iy,#_puntuacion
   7FA4 FD 6E 00      [19] 4468 	ld	l,0 (iy)
   7FA7 26 00         [ 7] 4469 	ld	h,#0x00
                           4470 ;src/main.c:842: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7FA9 C5            [11] 4471 	push	bc
   7FAA D5            [11] 4472 	push	de
   7FAB E5            [11] 4473 	push	hl
   7FAC CD 6E 53      [17] 4474 	call	_aumentarPuntuacion
   7FAF F1            [10] 4475 	pop	af
   7FB0 D1            [10] 4476 	pop	de
   7FB1 C1            [10] 4477 	pop	bc
   7FB2 FD 21 1E 65   [14] 4478 	ld	iy,#_puntuacion
   7FB6 FD 75 00      [19] 4479 	ld	0 (iy),l
                           4480 ;src/main.c:843: modificarPuntuacion(puntuacion);
   7FB9 FD 21 1E 65   [14] 4481 	ld	iy,#_puntuacion
   7FBD FD 6E 00      [19] 4482 	ld	l,0 (iy)
   7FC0 26 00         [ 7] 4483 	ld	h,#0x00
   7FC2 C5            [11] 4484 	push	bc
   7FC3 D5            [11] 4485 	push	de
   7FC4 E5            [11] 4486 	push	hl
   7FC5 CD 31 52      [17] 4487 	call	_modificarPuntuacion
   7FC8 F1            [10] 4488 	pop	af
   7FC9 D1            [10] 4489 	pop	de
   7FCA C1            [10] 4490 	pop	bc
                           4491 ;src/main.c:844: actual->mover = NO;
   7FCB DD 6E FE      [19] 4492 	ld	l,-2 (ix)
   7FCE DD 66 FF      [19] 4493 	ld	h,-1 (ix)
   7FD1 36 00         [10] 4494 	ld	(hl),#0x00
                           4495 ;src/main.c:845: actual->muertes++;
   7FD3 DD 6E F5      [19] 4496 	ld	l,-11 (ix)
   7FD6 DD 66 F6      [19] 4497 	ld	h,-10 (ix)
   7FD9 46            [ 7] 4498 	ld	b,(hl)
   7FDA 04            [ 4] 4499 	inc	b
   7FDB DD 6E F5      [19] 4500 	ld	l,-11 (ix)
   7FDE DD 66 F6      [19] 4501 	ld	h,-10 (ix)
   7FE1 70            [ 7] 4502 	ld	(hl),b
                           4503 ;src/main.c:846: actual->x = 0;
   7FE2 AF            [ 4] 4504 	xor	a, a
   7FE3 12            [ 7] 4505 	ld	(de),a
                           4506 ;src/main.c:847: actual->y = 0;
   7FE4 DD 6E F9      [19] 4507 	ld	l,-7 (ix)
   7FE7 DD 66 FA      [19] 4508 	ld	h,-6 (ix)
   7FEA 36 00         [10] 4509 	ld	(hl),#0x00
   7FEC                    4510 00127$:
                           4511 ;src/main.c:849: if(parpadeo && actual->muerto && !actual->xplot){
   7FEC 21 19 00      [10] 4512 	ld	hl,#0x0019
   7FEF 19            [11] 4513 	add	hl,de
   7FF0 DD 75 F9      [19] 4514 	ld	-7 (ix),l
   7FF3 DD 74 FA      [19] 4515 	ld	-6 (ix),h
   7FF6 3A 4C 64      [13] 4516 	ld	a,(#_parpadeo + 0)
   7FF9 B7            [ 4] 4517 	or	a, a
   7FFA 28 1B         [12] 4518 	jr	Z,00137$
   7FFC E1            [10] 4519 	pop	hl
   7FFD E5            [11] 4520 	push	hl
   7FFE 7E            [ 7] 4521 	ld	a,(hl)
   7FFF B7            [ 4] 4522 	or	a, a
   8000 28 15         [12] 4523 	jr	Z,00137$
   8002 DD 6E F9      [19] 4524 	ld	l,-7 (ix)
   8005 DD 66 FA      [19] 4525 	ld	h,-6 (ix)
   8008 7E            [ 7] 4526 	ld	a,(hl)
   8009 B7            [ 4] 4527 	or	a, a
   800A 20 0B         [12] 4528 	jr	NZ,00137$
                           4529 ;src/main.c:850: dibujarExplosion(actual);
   800C C5            [11] 4530 	push	bc
   800D D5            [11] 4531 	push	de
   800E D5            [11] 4532 	push	de
   800F CD 2D 68      [17] 4533 	call	_dibujarExplosion
   8012 F1            [10] 4534 	pop	af
   8013 D1            [10] 4535 	pop	de
   8014 C1            [10] 4536 	pop	bc
   8015 18 4A         [12] 4537 	jr	00138$
   8017                    4538 00137$:
                           4539 ;src/main.c:851: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   8017 3A 4C 64      [13] 4540 	ld	a,(#_parpadeo + 0)
   801A B7            [ 4] 4541 	or	a, a
   801B 20 44         [12] 4542 	jr	NZ,00138$
   801D E1            [10] 4543 	pop	hl
   801E E5            [11] 4544 	push	hl
   801F 7E            [ 7] 4545 	ld	a,(hl)
   8020 B7            [ 4] 4546 	or	a, a
   8021 28 3E         [12] 4547 	jr	Z,00138$
   8023 3E 0C         [ 7] 4548 	ld	a,#0x0C
   8025 FD 21 4D 64   [14] 4549 	ld	iy,#_cambio
   8029 FD 96 00      [19] 4550 	sub	a, 0 (iy)
   802C 38 33         [12] 4551 	jr	C,00138$
   802E DD 6E F9      [19] 4552 	ld	l,-7 (ix)
   8031 DD 66 FA      [19] 4553 	ld	h,-6 (ix)
   8034 7E            [ 7] 4554 	ld	a,(hl)
   8035 B7            [ 4] 4555 	or	a, a
   8036 20 29         [12] 4556 	jr	NZ,00138$
                           4557 ;src/main.c:852: borrarExplosion((*actual).px, (*actual).py);
   8038 DD 6E F7      [19] 4558 	ld	l,-9 (ix)
   803B DD 66 F8      [19] 4559 	ld	h,-8 (ix)
   803E 7E            [ 7] 4560 	ld	a,(hl)
   803F DD 6E FC      [19] 4561 	ld	l,-4 (ix)
   8042 DD 66 FD      [19] 4562 	ld	h,-3 (ix)
   8045 46            [ 7] 4563 	ld	b,(hl)
   8046 C5            [11] 4564 	push	bc
   8047 D5            [11] 4565 	push	de
   8048 F5            [11] 4566 	push	af
   8049 33            [ 6] 4567 	inc	sp
   804A C5            [11] 4568 	push	bc
   804B 33            [ 6] 4569 	inc	sp
   804C CD 66 68      [17] 4570 	call	_borrarExplosion
   804F F1            [10] 4571 	pop	af
   8050 D1            [10] 4572 	pop	de
   8051 C1            [10] 4573 	pop	bc
                           4574 ;src/main.c:853: if(cambio == 12){
   8052 3A 4D 64      [13] 4575 	ld	a,(#_cambio + 0)
   8055 D6 0C         [ 7] 4576 	sub	a, #0x0C
   8057 20 08         [12] 4577 	jr	NZ,00138$
                           4578 ;src/main.c:854: actual->xplot = SI;
   8059 DD 6E F9      [19] 4579 	ld	l,-7 (ix)
   805C DD 66 FA      [19] 4580 	ld	h,-6 (ix)
   805F 36 01         [10] 4581 	ld	(hl),#0x01
   8061                    4582 00138$:
                           4583 ;src/main.c:857: ++actual;
   8061 21 E3 00      [10] 4584 	ld	hl,#0x00E3
   8064 19            [11] 4585 	add	hl,de
   8065 EB            [ 4] 4586 	ex	de,hl
   8066 C3 FC 7E      [10] 4587 	jp	00141$
   8069                    4588 00143$:
                           4589 ;src/main.c:859: cpct_waitVSYNC();
   8069 CD F4 56      [17] 4590 	call	_cpct_waitVSYNC
   806C C3 97 7D      [10] 4591 	jp	00145$
                           4592 	.area _CODE
                           4593 	.area _INITIALIZER
   651F                    4594 __xinit__mapa:
   651F 00 00              4595 	.dw #0x0000
   6521                    4596 __xinit__num_mapa:
   6521 00                 4597 	.db #0x00	; 0
   6522                    4598 __xinit__puntuacion:
   6522 00                 4599 	.db #0x00	; 0
                           4600 	.area _CABS (ABS)
