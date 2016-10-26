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
                             67 	.globl _i
                             68 	.globl _vidas
                             69 	.globl _puntuacion
                             70 	.globl _num_mapa
                             71 	.globl _mapa
                             72 	.globl _cu
                             73 	.globl _prota
                             74 	.globl _enemy
                             75 	.globl _patrolY
                             76 	.globl _patrolX
                             77 	.globl _spawnY
                             78 	.globl _spawnX
                             79 	.globl _mapas
                             80 ;--------------------------------------------------------
                             81 ; special function registers
                             82 ;--------------------------------------------------------
                             83 ;--------------------------------------------------------
                             84 ; ram data
                             85 ;--------------------------------------------------------
                             86 	.area _DATA
   60B5                      87 _enemy::
   60B5                      88 	.ds 904
   643D                      89 _prota::
   643D                      90 	.ds 8
   6445                      91 _cu::
   6445                      92 	.ds 11
   6450                      93 _mapa::
   6450                      94 	.ds 2
   6452                      95 _num_mapa::
   6452                      96 	.ds 1
   6453                      97 _puntuacion::
   6453                      98 	.ds 1
   6454                      99 _vidas::
   6454                     100 	.ds 1
   6455                     101 _i::
   6455                     102 	.ds 1
                            103 ;--------------------------------------------------------
                            104 ; ram data
                            105 ;--------------------------------------------------------
                            106 	.area _INITIALIZED
                            107 ;--------------------------------------------------------
                            108 ; absolute external ram data
                            109 ;--------------------------------------------------------
                            110 	.area _DABS (ABS)
                            111 ;--------------------------------------------------------
                            112 ; global & static initialisations
                            113 ;--------------------------------------------------------
                            114 	.area _HOME
                            115 	.area _GSINIT
                            116 	.area _GSFINAL
                            117 	.area _GSINIT
                            118 ;--------------------------------------------------------
                            119 ; Home
                            120 ;--------------------------------------------------------
                            121 	.area _HOME
                            122 	.area _HOME
                            123 ;--------------------------------------------------------
                            124 ; code
                            125 ;--------------------------------------------------------
                            126 	.area _CODE
                            127 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            128 ;	---------------------------------
                            129 ; Function dummy_cpct_transparentMaskTable0M0_container
                            130 ; ---------------------------------
   444C                     131 _dummy_cpct_transparentMaskTable0M0_container::
                            132 	.area _g_tablatrans_ (ABS) 
   0100                     133 	.org 0x0100 
   0100                     134 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   135 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   136 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   139 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   145 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   151 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   155 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            167 	.area _CSEG (REL, CON) 
                            168 ;src/main.c:112: void dibujarMapa() {
                            169 ;	---------------------------------
                            170 ; Function dibujarMapa
                            171 ; ---------------------------------
   651F                     172 _dibujarMapa::
                            173 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   651F 2A 50 64      [16]  174 	ld	hl,(_mapa)
   6522 E5            [11]  175 	push	hl
   6523 21 F0 C0      [10]  176 	ld	hl,#0xC0F0
   6526 E5            [11]  177 	push	hl
   6527 21 2C 28      [10]  178 	ld	hl,#0x282C
   652A E5            [11]  179 	push	hl
   652B 2E 00         [ 7]  180 	ld	l, #0x00
   652D E5            [11]  181 	push	hl
   652E AF            [ 4]  182 	xor	a, a
   652F F5            [11]  183 	push	af
   6530 33            [ 6]  184 	inc	sp
   6531 CD 3C 55      [17]  185 	call	_cpct_etm_drawTileBox2x4
   6534 C9            [10]  186 	ret
   6535                     187 _mapas:
   6535 C0 10               188 	.dw _g_map1
   6537 E0 09               189 	.dw _g_map2
   6539 00 03               190 	.dw _g_map3
   653B                     191 _spawnX:
   653B 24                  192 	.db #0x24	; 36
   653C 47                  193 	.db #0x47	; 71	'G'
   653D 30                  194 	.db #0x30	; 48	'0'
   653E 18                  195 	.db #0x18	; 24
   653F                     196 _spawnY:
   653F 2C                  197 	.db #0x2C	; 44
   6540 66                  198 	.db #0x66	; 102	'f'
   6541 9A                  199 	.db #0x9A	; 154
   6542 40                  200 	.db #0x40	; 64
   6543                     201 _patrolX:
   6543 00                  202 	.db #0x00	; 0
   6544 00                  203 	.db #0x00	; 0
   6545 00                  204 	.db #0x00	; 0
   6546 00                  205 	.db #0x00	; 0
   6547 00                  206 	.db #0x00	; 0
   6548 42                  207 	.db #0x42	; 66	'B'
   6549 33                  208 	.db #0x33	; 51	'3'
   654A 00                  209 	.db #0x00	; 0
   654B 00                  210 	.db #0x00	; 0
   654C 00                  211 	.db 0x00
   654D 10                  212 	.db #0x10	; 16
   654E 33                  213 	.db #0x33	; 51	'3'
   654F 19                  214 	.db #0x19	; 25
   6550 00                  215 	.db #0x00	; 0
   6551 00                  216 	.db 0x00
   6552 24                  217 	.db #0x24	; 36
   6553 3C                  218 	.db #0x3C	; 60
   6554 30                  219 	.db #0x30	; 48	'0'
   6555 18                  220 	.db #0x18	; 24
   6556 00                  221 	.db 0x00
   6557                     222 _patrolY:
   6557 00                  223 	.db #0x00	; 0
   6558 00                  224 	.db #0x00	; 0
   6559 00                  225 	.db #0x00	; 0
   655A 00                  226 	.db #0x00	; 0
   655B 00                  227 	.db 0x00
   655C 5E                  228 	.db #0x5E	; 94
   655D A6                  229 	.db #0xA6	; 166
   655E 00                  230 	.db #0x00	; 0
   655F 00                  231 	.db #0x00	; 0
   6560 00                  232 	.db 0x00
   6561 2C                  233 	.db #0x2C	; 44
   6562 66                  234 	.db #0x66	; 102	'f'
   6563 9A                  235 	.db #0x9A	; 154
   6564 00                  236 	.db #0x00	; 0
   6565 00                  237 	.db 0x00
   6566 90                  238 	.db #0x90	; 144
   6567 66                  239 	.db #0x66	; 102	'f'
   6568 2C                  240 	.db #0x2C	; 44
   6569 86                  241 	.db #0x86	; 134
   656A 00                  242 	.db 0x00
                            243 ;src/main.c:118: void dibujarProta() {
                            244 ;	---------------------------------
                            245 ; Function dibujarProta
                            246 ; ---------------------------------
   656B                     247 _dibujarProta::
                            248 ;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   656B 21 3E 64      [10]  249 	ld	hl, #_prota + 1
   656E 56            [ 7]  250 	ld	d,(hl)
   656F 21 3D 64      [10]  251 	ld	hl, #_prota + 0
   6572 46            [ 7]  252 	ld	b,(hl)
   6573 D5            [11]  253 	push	de
   6574 33            [ 6]  254 	inc	sp
   6575 C5            [11]  255 	push	bc
   6576 33            [ 6]  256 	inc	sp
   6577 21 00 C0      [10]  257 	ld	hl,#0xC000
   657A E5            [11]  258 	push	hl
   657B CD 5A 60      [17]  259 	call	_cpct_getScreenPtr
   657E EB            [ 4]  260 	ex	de,hl
                            261 ;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   657F ED 4B 41 64   [20]  262 	ld	bc, (#_prota + 4)
   6583 21 00 01      [10]  263 	ld	hl,#_g_tablatrans
   6586 E5            [11]  264 	push	hl
   6587 21 07 16      [10]  265 	ld	hl,#0x1607
   658A E5            [11]  266 	push	hl
   658B D5            [11]  267 	push	de
   658C C5            [11]  268 	push	bc
   658D CD 7A 60      [17]  269 	call	_cpct_drawSpriteMaskedAlignedTable
   6590 C9            [10]  270 	ret
                            271 ;src/main.c:123: void borrarProta() {
                            272 ;	---------------------------------
                            273 ; Function borrarProta
                            274 ; ---------------------------------
   6591                     275 _borrarProta::
   6591 DD E5         [15]  276 	push	ix
   6593 DD 21 00 00   [14]  277 	ld	ix,#0
   6597 DD 39         [15]  278 	add	ix,sp
   6599 F5            [11]  279 	push	af
   659A 3B            [ 6]  280 	dec	sp
                            281 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   659B 21 3F 64      [10]  282 	ld	hl, #_prota + 2
   659E 4E            [ 7]  283 	ld	c,(hl)
   659F 79            [ 4]  284 	ld	a,c
   65A0 E6 01         [ 7]  285 	and	a, #0x01
   65A2 47            [ 4]  286 	ld	b,a
   65A3 04            [ 4]  287 	inc	b
   65A4 04            [ 4]  288 	inc	b
   65A5 04            [ 4]  289 	inc	b
   65A6 04            [ 4]  290 	inc	b
                            291 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   65A7 21 40 64      [10]  292 	ld	hl, #_prota + 3
   65AA 5E            [ 7]  293 	ld	e,(hl)
   65AB CB 4B         [ 8]  294 	bit	1, e
   65AD 28 04         [12]  295 	jr	Z,00103$
   65AF 3E 01         [ 7]  296 	ld	a,#0x01
   65B1 18 02         [12]  297 	jr	00104$
   65B3                     298 00103$:
   65B3 3E 00         [ 7]  299 	ld	a,#0x00
   65B5                     300 00104$:
   65B5 C6 06         [ 7]  301 	add	a, #0x06
   65B7 DD 77 FD      [19]  302 	ld	-3 (ix),a
                            303 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   65BA FD 2A 50 64   [20]  304 	ld	iy,(_mapa)
   65BE 16 00         [ 7]  305 	ld	d,#0x00
   65C0 7B            [ 4]  306 	ld	a,e
   65C1 C6 E8         [ 7]  307 	add	a,#0xE8
   65C3 DD 77 FE      [19]  308 	ld	-2 (ix),a
   65C6 7A            [ 4]  309 	ld	a,d
   65C7 CE FF         [ 7]  310 	adc	a,#0xFF
   65C9 DD 77 FF      [19]  311 	ld	-1 (ix),a
   65CC DD 6E FE      [19]  312 	ld	l,-2 (ix)
   65CF DD 66 FF      [19]  313 	ld	h,-1 (ix)
   65D2 DD CB FF 7E   [20]  314 	bit	7, -1 (ix)
   65D6 28 04         [12]  315 	jr	Z,00105$
   65D8 21 EB FF      [10]  316 	ld	hl,#0xFFEB
   65DB 19            [11]  317 	add	hl,de
   65DC                     318 00105$:
   65DC CB 2C         [ 8]  319 	sra	h
   65DE CB 1D         [ 8]  320 	rr	l
   65E0 CB 2C         [ 8]  321 	sra	h
   65E2 CB 1D         [ 8]  322 	rr	l
   65E4 55            [ 4]  323 	ld	d,l
   65E5 CB 39         [ 8]  324 	srl	c
   65E7 FD E5         [15]  325 	push	iy
   65E9 21 F0 C0      [10]  326 	ld	hl,#0xC0F0
   65EC E5            [11]  327 	push	hl
   65ED 3E 28         [ 7]  328 	ld	a,#0x28
   65EF F5            [11]  329 	push	af
   65F0 33            [ 6]  330 	inc	sp
   65F1 DD 7E FD      [19]  331 	ld	a,-3 (ix)
   65F4 F5            [11]  332 	push	af
   65F5 33            [ 6]  333 	inc	sp
   65F6 C5            [11]  334 	push	bc
   65F7 33            [ 6]  335 	inc	sp
   65F8 D5            [11]  336 	push	de
   65F9 33            [ 6]  337 	inc	sp
   65FA 79            [ 4]  338 	ld	a,c
   65FB F5            [11]  339 	push	af
   65FC 33            [ 6]  340 	inc	sp
   65FD CD 3C 55      [17]  341 	call	_cpct_etm_drawTileBox2x4
   6600 DD F9         [10]  342 	ld	sp, ix
   6602 DD E1         [14]  343 	pop	ix
   6604 C9            [10]  344 	ret
                            345 ;src/main.c:135: void redibujarProta() {
                            346 ;	---------------------------------
                            347 ; Function redibujarProta
                            348 ; ---------------------------------
   6605                     349 _redibujarProta::
                            350 ;src/main.c:136: borrarProta();
   6605 CD 91 65      [17]  351 	call	_borrarProta
                            352 ;src/main.c:137: prota.px = prota.x;
   6608 01 3F 64      [10]  353 	ld	bc,#_prota + 2
   660B 3A 3D 64      [13]  354 	ld	a, (#_prota + 0)
   660E 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:138: prota.py = prota.y;
   660F 01 40 64      [10]  357 	ld	bc,#_prota + 3
   6612 3A 3E 64      [13]  358 	ld	a, (#_prota + 1)
   6615 02            [ 7]  359 	ld	(bc),a
                            360 ;src/main.c:139: dibujarProta();
   6616 C3 6B 65      [10]  361 	jp  _dibujarProta
                            362 ;src/main.c:142: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            363 ;	---------------------------------
                            364 ; Function comprobarTeclado
                            365 ; ---------------------------------
   6619                     366 _comprobarTeclado::
                            367 ;src/main.c:143: cpct_scanKeyboard_if();
   6619 CD 94 56      [17]  368 	call	_cpct_scanKeyboard_if
                            369 ;src/main.c:145: if (cpct_isAnyKeyPressed()) {
   661C CD 87 56      [17]  370 	call	_cpct_isAnyKeyPressed
   661F 7D            [ 4]  371 	ld	a,l
   6620 B7            [ 4]  372 	or	a, a
   6621 C8            [11]  373 	ret	Z
                            374 ;src/main.c:146: if (cpct_isKeyPressed(Key_CursorLeft)){
   6622 21 01 01      [10]  375 	ld	hl,#0x0101
   6625 CD 5B 54      [17]  376 	call	_cpct_isKeyPressed
   6628 7D            [ 4]  377 	ld	a,l
   6629 B7            [ 4]  378 	or	a, a
                            379 ;src/main.c:147: moverIzquierda();
   662A C2 4C 7B      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   662D 21 00 02      [10]  382 	ld	hl,#0x0200
   6630 CD 5B 54      [17]  383 	call	_cpct_isKeyPressed
   6633 7D            [ 4]  384 	ld	a,l
   6634 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   6635 C2 71 7B      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6638 21 00 01      [10]  389 	ld	hl,#0x0100
   663B CD 5B 54      [17]  390 	call	_cpct_isKeyPressed
   663E 7D            [ 4]  391 	ld	a,l
   663F B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   6640 C2 B6 7B      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6643 21 00 04      [10]  396 	ld	hl,#0x0400
   6646 CD 5B 54      [17]  397 	call	_cpct_isKeyPressed
   6649 7D            [ 4]  398 	ld	a,l
   664A B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   664B C2 DA 7B      [10]  401 	jp	NZ,_moverAbajo
                            402 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_Space)){
   664E 21 05 80      [10]  403 	ld	hl,#0x8005
   6651 CD 5B 54      [17]  404 	call	_cpct_isKeyPressed
   6654 7D            [ 4]  405 	ld	a,l
   6655 B7            [ 4]  406 	or	a, a
   6656 C8            [11]  407 	ret	Z
                            408 ;src/main.c:155: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6657 21 08 00      [10]  409 	ld	hl, #8
   665A 39            [11]  410 	add	hl, sp
   665B 4E            [ 7]  411 	ld	c, (hl)
   665C 23            [ 6]  412 	inc	hl
   665D 46            [ 7]  413 	ld	b, (hl)
   665E C5            [11]  414 	push	bc
   665F 21 08 00      [10]  415 	ld	hl, #8
   6662 39            [11]  416 	add	hl, sp
   6663 4E            [ 7]  417 	ld	c, (hl)
   6664 23            [ 6]  418 	inc	hl
   6665 46            [ 7]  419 	ld	b, (hl)
   6666 C5            [11]  420 	push	bc
   6667 21 08 00      [10]  421 	ld	hl, #8
   666A 39            [11]  422 	add	hl, sp
   666B 4E            [ 7]  423 	ld	c, (hl)
   666C 23            [ 6]  424 	inc	hl
   666D 46            [ 7]  425 	ld	b, (hl)
   666E C5            [11]  426 	push	bc
   666F 21 08 00      [10]  427 	ld	hl, #8
   6672 39            [11]  428 	add	hl, sp
   6673 4E            [ 7]  429 	ld	c, (hl)
   6674 23            [ 6]  430 	inc	hl
   6675 46            [ 7]  431 	ld	b, (hl)
   6676 C5            [11]  432 	push	bc
   6677 CD 6C 40      [17]  433 	call	_lanzarCuchillo
   667A 21 08 00      [10]  434 	ld	hl,#8
   667D 39            [11]  435 	add	hl,sp
   667E F9            [ 6]  436 	ld	sp,hl
   667F C9            [10]  437 	ret
                            438 ;src/main.c:160: u8 checkCollision(u8 direction) { // check optimization
                            439 ;	---------------------------------
                            440 ; Function checkCollision
                            441 ; ---------------------------------
   6680                     442 _checkCollision::
   6680 DD E5         [15]  443 	push	ix
   6682 DD 21 00 00   [14]  444 	ld	ix,#0
   6686 DD 39         [15]  445 	add	ix,sp
   6688 F5            [11]  446 	push	af
                            447 ;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6689 21 00 00      [10]  448 	ld	hl,#0x0000
   668C E3            [19]  449 	ex	(sp), hl
   668D 11 00 00      [10]  450 	ld	de,#0x0000
   6690 01 00 00      [10]  451 	ld	bc,#0x0000
                            452 ;src/main.c:163: switch (direction) {
   6693 3E 03         [ 7]  453 	ld	a,#0x03
   6695 DD 96 04      [19]  454 	sub	a, 4 (ix)
   6698 DA D0 67      [10]  455 	jp	C,00105$
   669B DD 5E 04      [19]  456 	ld	e,4 (ix)
   669E 16 00         [ 7]  457 	ld	d,#0x00
   66A0 21 A7 66      [10]  458 	ld	hl,#00124$
   66A3 19            [11]  459 	add	hl,de
   66A4 19            [11]  460 	add	hl,de
   66A5 19            [11]  461 	add	hl,de
   66A6 E9            [ 4]  462 	jp	(hl)
   66A7                     463 00124$:
   66A7 C3 B3 66      [10]  464 	jp	00101$
   66AA C3 08 67      [10]  465 	jp	00102$
   66AD C3 58 67      [10]  466 	jp	00103$
   66B0 C3 95 67      [10]  467 	jp	00104$
                            468 ;src/main.c:164: case 0:
   66B3                     469 00101$:
                            470 ;src/main.c:165: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   66B3 21 3E 64      [10]  471 	ld	hl, #(_prota + 0x0001) + 0
   66B6 4E            [ 7]  472 	ld	c,(hl)
   66B7 3A 3D 64      [13]  473 	ld	a, (#_prota + 0)
   66BA C6 07         [ 7]  474 	add	a, #0x07
   66BC 47            [ 4]  475 	ld	b,a
   66BD 79            [ 4]  476 	ld	a,c
   66BE F5            [11]  477 	push	af
   66BF 33            [ 6]  478 	inc	sp
   66C0 C5            [11]  479 	push	bc
   66C1 33            [ 6]  480 	inc	sp
   66C2 2A 50 64      [16]  481 	ld	hl,(_mapa)
   66C5 E5            [11]  482 	push	hl
   66C6 CD 71 4B      [17]  483 	call	_getTilePtr
   66C9 F1            [10]  484 	pop	af
   66CA F1            [10]  485 	pop	af
   66CB 33            [ 6]  486 	inc	sp
   66CC 33            [ 6]  487 	inc	sp
   66CD E5            [11]  488 	push	hl
                            489 ;src/main.c:166: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   66CE 3A 3E 64      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   66D1 C6 14         [ 7]  491 	add	a, #0x14
   66D3 4F            [ 4]  492 	ld	c,a
   66D4 3A 3D 64      [13]  493 	ld	a, (#_prota + 0)
   66D7 C6 07         [ 7]  494 	add	a, #0x07
   66D9 47            [ 4]  495 	ld	b,a
   66DA 79            [ 4]  496 	ld	a,c
   66DB F5            [11]  497 	push	af
   66DC 33            [ 6]  498 	inc	sp
   66DD C5            [11]  499 	push	bc
   66DE 33            [ 6]  500 	inc	sp
   66DF 2A 50 64      [16]  501 	ld	hl,(_mapa)
   66E2 E5            [11]  502 	push	hl
   66E3 CD 71 4B      [17]  503 	call	_getTilePtr
   66E6 F1            [10]  504 	pop	af
   66E7 F1            [10]  505 	pop	af
   66E8 EB            [ 4]  506 	ex	de,hl
                            507 ;src/main.c:167: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   66E9 3A 3E 64      [13]  508 	ld	a, (#(_prota + 0x0001) + 0)
   66EC C6 0B         [ 7]  509 	add	a, #0x0B
   66EE 47            [ 4]  510 	ld	b,a
   66EF 3A 3D 64      [13]  511 	ld	a, (#_prota + 0)
   66F2 C6 07         [ 7]  512 	add	a, #0x07
   66F4 D5            [11]  513 	push	de
   66F5 C5            [11]  514 	push	bc
   66F6 33            [ 6]  515 	inc	sp
   66F7 F5            [11]  516 	push	af
   66F8 33            [ 6]  517 	inc	sp
   66F9 2A 50 64      [16]  518 	ld	hl,(_mapa)
   66FC E5            [11]  519 	push	hl
   66FD CD 71 4B      [17]  520 	call	_getTilePtr
   6700 F1            [10]  521 	pop	af
   6701 F1            [10]  522 	pop	af
   6702 4D            [ 4]  523 	ld	c,l
   6703 44            [ 4]  524 	ld	b,h
   6704 D1            [10]  525 	pop	de
                            526 ;src/main.c:168: break;
   6705 C3 D0 67      [10]  527 	jp	00105$
                            528 ;src/main.c:169: case 1:
   6708                     529 00102$:
                            530 ;src/main.c:170: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6708 21 3E 64      [10]  531 	ld	hl, #(_prota + 0x0001) + 0
   670B 56            [ 7]  532 	ld	d,(hl)
   670C 21 3D 64      [10]  533 	ld	hl, #_prota + 0
   670F 46            [ 7]  534 	ld	b,(hl)
   6710 05            [ 4]  535 	dec	b
   6711 D5            [11]  536 	push	de
   6712 33            [ 6]  537 	inc	sp
   6713 C5            [11]  538 	push	bc
   6714 33            [ 6]  539 	inc	sp
   6715 2A 50 64      [16]  540 	ld	hl,(_mapa)
   6718 E5            [11]  541 	push	hl
   6719 CD 71 4B      [17]  542 	call	_getTilePtr
   671C F1            [10]  543 	pop	af
   671D F1            [10]  544 	pop	af
   671E 33            [ 6]  545 	inc	sp
   671F 33            [ 6]  546 	inc	sp
   6720 E5            [11]  547 	push	hl
                            548 ;src/main.c:171: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6721 3A 3E 64      [13]  549 	ld	a, (#(_prota + 0x0001) + 0)
   6724 C6 14         [ 7]  550 	add	a, #0x14
   6726 57            [ 4]  551 	ld	d,a
   6727 21 3D 64      [10]  552 	ld	hl, #_prota + 0
   672A 46            [ 7]  553 	ld	b,(hl)
   672B 05            [ 4]  554 	dec	b
   672C D5            [11]  555 	push	de
   672D 33            [ 6]  556 	inc	sp
   672E C5            [11]  557 	push	bc
   672F 33            [ 6]  558 	inc	sp
   6730 2A 50 64      [16]  559 	ld	hl,(_mapa)
   6733 E5            [11]  560 	push	hl
   6734 CD 71 4B      [17]  561 	call	_getTilePtr
   6737 F1            [10]  562 	pop	af
   6738 F1            [10]  563 	pop	af
   6739 EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:172: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   673A 3A 3E 64      [13]  566 	ld	a, (#(_prota + 0x0001) + 0)
   673D C6 0B         [ 7]  567 	add	a, #0x0B
   673F 47            [ 4]  568 	ld	b,a
   6740 3A 3D 64      [13]  569 	ld	a, (#_prota + 0)
   6743 C6 FF         [ 7]  570 	add	a,#0xFF
   6745 D5            [11]  571 	push	de
   6746 C5            [11]  572 	push	bc
   6747 33            [ 6]  573 	inc	sp
   6748 F5            [11]  574 	push	af
   6749 33            [ 6]  575 	inc	sp
   674A 2A 50 64      [16]  576 	ld	hl,(_mapa)
   674D E5            [11]  577 	push	hl
   674E CD 71 4B      [17]  578 	call	_getTilePtr
   6751 F1            [10]  579 	pop	af
   6752 F1            [10]  580 	pop	af
   6753 4D            [ 4]  581 	ld	c,l
   6754 44            [ 4]  582 	ld	b,h
   6755 D1            [10]  583 	pop	de
                            584 ;src/main.c:173: break;
   6756 18 78         [12]  585 	jr	00105$
                            586 ;src/main.c:174: case 2:
   6758                     587 00103$:
                            588 ;src/main.c:175: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6758 3A 3E 64      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   675B C6 FE         [ 7]  590 	add	a,#0xFE
   675D 21 3D 64      [10]  591 	ld	hl, #_prota + 0
   6760 56            [ 7]  592 	ld	d,(hl)
   6761 C5            [11]  593 	push	bc
   6762 F5            [11]  594 	push	af
   6763 33            [ 6]  595 	inc	sp
   6764 D5            [11]  596 	push	de
   6765 33            [ 6]  597 	inc	sp
   6766 2A 50 64      [16]  598 	ld	hl,(_mapa)
   6769 E5            [11]  599 	push	hl
   676A CD 71 4B      [17]  600 	call	_getTilePtr
   676D F1            [10]  601 	pop	af
   676E F1            [10]  602 	pop	af
   676F C1            [10]  603 	pop	bc
   6770 33            [ 6]  604 	inc	sp
   6771 33            [ 6]  605 	inc	sp
   6772 E5            [11]  606 	push	hl
                            607 ;src/main.c:176: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6773 21 3E 64      [10]  608 	ld	hl, #(_prota + 0x0001) + 0
   6776 56            [ 7]  609 	ld	d,(hl)
   6777 15            [ 4]  610 	dec	d
   6778 15            [ 4]  611 	dec	d
   6779 3A 3D 64      [13]  612 	ld	a, (#_prota + 0)
   677C C6 03         [ 7]  613 	add	a, #0x03
   677E C5            [11]  614 	push	bc
   677F D5            [11]  615 	push	de
   6780 33            [ 6]  616 	inc	sp
   6781 F5            [11]  617 	push	af
   6782 33            [ 6]  618 	inc	sp
   6783 2A 50 64      [16]  619 	ld	hl,(_mapa)
   6786 E5            [11]  620 	push	hl
   6787 CD 71 4B      [17]  621 	call	_getTilePtr
   678A F1            [10]  622 	pop	af
   678B F1            [10]  623 	pop	af
   678C EB            [ 4]  624 	ex	de,hl
   678D C1            [10]  625 	pop	bc
                            626 ;src/main.c:177: *waistTile = 0;
   678E 21 00 00      [10]  627 	ld	hl,#0x0000
   6791 36 00         [10]  628 	ld	(hl),#0x00
                            629 ;src/main.c:178: break;
   6793 18 3B         [12]  630 	jr	00105$
                            631 ;src/main.c:179: case 3:
   6795                     632 00104$:
                            633 ;src/main.c:180: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6795 3A 3E 64      [13]  634 	ld	a, (#(_prota + 0x0001) + 0)
   6798 C6 16         [ 7]  635 	add	a, #0x16
   679A 21 3D 64      [10]  636 	ld	hl, #_prota + 0
   679D 56            [ 7]  637 	ld	d,(hl)
   679E C5            [11]  638 	push	bc
   679F F5            [11]  639 	push	af
   67A0 33            [ 6]  640 	inc	sp
   67A1 D5            [11]  641 	push	de
   67A2 33            [ 6]  642 	inc	sp
   67A3 2A 50 64      [16]  643 	ld	hl,(_mapa)
   67A6 E5            [11]  644 	push	hl
   67A7 CD 71 4B      [17]  645 	call	_getTilePtr
   67AA F1            [10]  646 	pop	af
   67AB F1            [10]  647 	pop	af
   67AC C1            [10]  648 	pop	bc
   67AD 33            [ 6]  649 	inc	sp
   67AE 33            [ 6]  650 	inc	sp
   67AF E5            [11]  651 	push	hl
                            652 ;src/main.c:181: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   67B0 3A 3E 64      [13]  653 	ld	a, (#(_prota + 0x0001) + 0)
   67B3 C6 16         [ 7]  654 	add	a, #0x16
   67B5 57            [ 4]  655 	ld	d,a
   67B6 3A 3D 64      [13]  656 	ld	a, (#_prota + 0)
   67B9 C6 03         [ 7]  657 	add	a, #0x03
   67BB C5            [11]  658 	push	bc
   67BC D5            [11]  659 	push	de
   67BD 33            [ 6]  660 	inc	sp
   67BE F5            [11]  661 	push	af
   67BF 33            [ 6]  662 	inc	sp
   67C0 2A 50 64      [16]  663 	ld	hl,(_mapa)
   67C3 E5            [11]  664 	push	hl
   67C4 CD 71 4B      [17]  665 	call	_getTilePtr
   67C7 F1            [10]  666 	pop	af
   67C8 F1            [10]  667 	pop	af
   67C9 EB            [ 4]  668 	ex	de,hl
   67CA C1            [10]  669 	pop	bc
                            670 ;src/main.c:182: *waistTile = 0;
   67CB 21 00 00      [10]  671 	ld	hl,#0x0000
   67CE 36 00         [10]  672 	ld	(hl),#0x00
                            673 ;src/main.c:184: }
   67D0                     674 00105$:
                            675 ;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   67D0 E1            [10]  676 	pop	hl
   67D1 E5            [11]  677 	push	hl
   67D2 6E            [ 7]  678 	ld	l,(hl)
   67D3 3E 02         [ 7]  679 	ld	a,#0x02
   67D5 95            [ 4]  680 	sub	a, l
   67D6 38 0E         [12]  681 	jr	C,00106$
   67D8 1A            [ 7]  682 	ld	a,(de)
   67D9 5F            [ 4]  683 	ld	e,a
   67DA 3E 02         [ 7]  684 	ld	a,#0x02
   67DC 93            [ 4]  685 	sub	a, e
   67DD 38 07         [12]  686 	jr	C,00106$
   67DF 0A            [ 7]  687 	ld	a,(bc)
   67E0 4F            [ 4]  688 	ld	c,a
   67E1 3E 02         [ 7]  689 	ld	a,#0x02
   67E3 91            [ 4]  690 	sub	a, c
   67E4 30 04         [12]  691 	jr	NC,00107$
   67E6                     692 00106$:
                            693 ;src/main.c:187: return 1;
   67E6 2E 01         [ 7]  694 	ld	l,#0x01
   67E8 18 02         [12]  695 	jr	00110$
   67EA                     696 00107$:
                            697 ;src/main.c:189: return 0;
   67EA 2E 00         [ 7]  698 	ld	l,#0x00
   67EC                     699 00110$:
   67EC DD F9         [10]  700 	ld	sp, ix
   67EE DD E1         [14]  701 	pop	ix
   67F0 C9            [10]  702 	ret
                            703 ;src/main.c:192: void dibujarEnemigo(TEnemy *enemy) {
                            704 ;	---------------------------------
                            705 ; Function dibujarEnemigo
                            706 ; ---------------------------------
   67F1                     707 _dibujarEnemigo::
   67F1 DD E5         [15]  708 	push	ix
   67F3 DD 21 00 00   [14]  709 	ld	ix,#0
   67F7 DD 39         [15]  710 	add	ix,sp
                            711 ;src/main.c:193: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   67F9 DD 4E 04      [19]  712 	ld	c,4 (ix)
   67FC DD 46 05      [19]  713 	ld	b,5 (ix)
   67FF 69            [ 4]  714 	ld	l, c
   6800 60            [ 4]  715 	ld	h, b
   6801 23            [ 6]  716 	inc	hl
   6802 56            [ 7]  717 	ld	d,(hl)
   6803 0A            [ 7]  718 	ld	a,(bc)
   6804 C5            [11]  719 	push	bc
   6805 D5            [11]  720 	push	de
   6806 33            [ 6]  721 	inc	sp
   6807 F5            [11]  722 	push	af
   6808 33            [ 6]  723 	inc	sp
   6809 21 00 C0      [10]  724 	ld	hl,#0xC000
   680C E5            [11]  725 	push	hl
   680D CD 5A 60      [17]  726 	call	_cpct_getScreenPtr
   6810 EB            [ 4]  727 	ex	de,hl
                            728 ;src/main.c:194: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6811 E1            [10]  729 	pop	hl
   6812 01 04 00      [10]  730 	ld	bc, #0x0004
   6815 09            [11]  731 	add	hl, bc
   6816 4E            [ 7]  732 	ld	c,(hl)
   6817 23            [ 6]  733 	inc	hl
   6818 46            [ 7]  734 	ld	b,(hl)
   6819 21 00 01      [10]  735 	ld	hl,#_g_tablatrans
   681C E5            [11]  736 	push	hl
   681D 21 04 16      [10]  737 	ld	hl,#0x1604
   6820 E5            [11]  738 	push	hl
   6821 D5            [11]  739 	push	de
   6822 C5            [11]  740 	push	bc
   6823 CD 7A 60      [17]  741 	call	_cpct_drawSpriteMaskedAlignedTable
   6826 DD E1         [14]  742 	pop	ix
   6828 C9            [10]  743 	ret
                            744 ;src/main.c:197: void dibujarExplosion(TEnemy *enemy) {
                            745 ;	---------------------------------
                            746 ; Function dibujarExplosion
                            747 ; ---------------------------------
   6829                     748 _dibujarExplosion::
   6829 DD E5         [15]  749 	push	ix
   682B DD 21 00 00   [14]  750 	ld	ix,#0
   682F DD 39         [15]  751 	add	ix,sp
                            752 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6831 DD 4E 04      [19]  753 	ld	c,4 (ix)
   6834 DD 46 05      [19]  754 	ld	b,5 (ix)
   6837 69            [ 4]  755 	ld	l, c
   6838 60            [ 4]  756 	ld	h, b
   6839 23            [ 6]  757 	inc	hl
   683A 56            [ 7]  758 	ld	d,(hl)
   683B 0A            [ 7]  759 	ld	a,(bc)
   683C 47            [ 4]  760 	ld	b,a
   683D D5            [11]  761 	push	de
   683E 33            [ 6]  762 	inc	sp
   683F C5            [11]  763 	push	bc
   6840 33            [ 6]  764 	inc	sp
   6841 21 00 C0      [10]  765 	ld	hl,#0xC000
   6844 E5            [11]  766 	push	hl
   6845 CD 5A 60      [17]  767 	call	_cpct_getScreenPtr
   6848 4D            [ 4]  768 	ld	c,l
   6849 44            [ 4]  769 	ld	b,h
                            770 ;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   684A 11 00 01      [10]  771 	ld	de,#_g_tablatrans+0
   684D D5            [11]  772 	push	de
   684E 21 04 16      [10]  773 	ld	hl,#0x1604
   6851 E5            [11]  774 	push	hl
   6852 C5            [11]  775 	push	bc
   6853 21 70 19      [10]  776 	ld	hl,#_g_explosion
   6856 E5            [11]  777 	push	hl
   6857 CD 7A 60      [17]  778 	call	_cpct_drawSpriteMaskedAlignedTable
   685A DD E1         [14]  779 	pop	ix
   685C C9            [10]  780 	ret
                            781 ;src/main.c:202: void borrarExplosion(TEnemy *enemy) {
                            782 ;	---------------------------------
                            783 ; Function borrarExplosion
                            784 ; ---------------------------------
   685D                     785 _borrarExplosion::
   685D DD E5         [15]  786 	push	ix
   685F DD 21 00 00   [14]  787 	ld	ix,#0
   6863 DD 39         [15]  788 	add	ix,sp
   6865 F5            [11]  789 	push	af
   6866 3B            [ 6]  790 	dec	sp
                            791 ;src/main.c:205: u8 w = 4 + (enemy->px & 1);
   6867 DD 5E 04      [19]  792 	ld	e,4 (ix)
   686A DD 56 05      [19]  793 	ld	d,5 (ix)
   686D 6B            [ 4]  794 	ld	l, e
   686E 62            [ 4]  795 	ld	h, d
   686F 23            [ 6]  796 	inc	hl
   6870 23            [ 6]  797 	inc	hl
   6871 4E            [ 7]  798 	ld	c,(hl)
   6872 79            [ 4]  799 	ld	a,c
   6873 E6 01         [ 7]  800 	and	a, #0x01
   6875 47            [ 4]  801 	ld	b,a
   6876 04            [ 4]  802 	inc	b
   6877 04            [ 4]  803 	inc	b
   6878 04            [ 4]  804 	inc	b
   6879 04            [ 4]  805 	inc	b
                            806 ;src/main.c:206: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   687A EB            [ 4]  807 	ex	de,hl
   687B 23            [ 6]  808 	inc	hl
   687C 23            [ 6]  809 	inc	hl
   687D 23            [ 6]  810 	inc	hl
   687E 5E            [ 7]  811 	ld	e,(hl)
   687F CB 4B         [ 8]  812 	bit	1, e
   6881 28 04         [12]  813 	jr	Z,00103$
   6883 3E 01         [ 7]  814 	ld	a,#0x01
   6885 18 02         [12]  815 	jr	00104$
   6887                     816 00103$:
   6887 3E 00         [ 7]  817 	ld	a,#0x00
   6889                     818 00104$:
   6889 C6 06         [ 7]  819 	add	a, #0x06
   688B DD 77 FD      [19]  820 	ld	-3 (ix),a
                            821 ;src/main.c:208: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   688E FD 2A 50 64   [20]  822 	ld	iy,(_mapa)
   6892 16 00         [ 7]  823 	ld	d,#0x00
   6894 7B            [ 4]  824 	ld	a,e
   6895 C6 E8         [ 7]  825 	add	a,#0xE8
   6897 DD 77 FE      [19]  826 	ld	-2 (ix),a
   689A 7A            [ 4]  827 	ld	a,d
   689B CE FF         [ 7]  828 	adc	a,#0xFF
   689D DD 77 FF      [19]  829 	ld	-1 (ix),a
   68A0 DD 6E FE      [19]  830 	ld	l,-2 (ix)
   68A3 DD 66 FF      [19]  831 	ld	h,-1 (ix)
   68A6 DD CB FF 7E   [20]  832 	bit	7, -1 (ix)
   68AA 28 04         [12]  833 	jr	Z,00105$
   68AC 21 EB FF      [10]  834 	ld	hl,#0xFFEB
   68AF 19            [11]  835 	add	hl,de
   68B0                     836 00105$:
   68B0 CB 2C         [ 8]  837 	sra	h
   68B2 CB 1D         [ 8]  838 	rr	l
   68B4 CB 2C         [ 8]  839 	sra	h
   68B6 CB 1D         [ 8]  840 	rr	l
   68B8 55            [ 4]  841 	ld	d,l
   68B9 CB 39         [ 8]  842 	srl	c
   68BB FD E5         [15]  843 	push	iy
   68BD 21 F0 C0      [10]  844 	ld	hl,#0xC0F0
   68C0 E5            [11]  845 	push	hl
   68C1 3E 28         [ 7]  846 	ld	a,#0x28
   68C3 F5            [11]  847 	push	af
   68C4 33            [ 6]  848 	inc	sp
   68C5 DD 7E FD      [19]  849 	ld	a,-3 (ix)
   68C8 F5            [11]  850 	push	af
   68C9 33            [ 6]  851 	inc	sp
   68CA C5            [11]  852 	push	bc
   68CB 33            [ 6]  853 	inc	sp
   68CC D5            [11]  854 	push	de
   68CD 33            [ 6]  855 	inc	sp
   68CE 79            [ 4]  856 	ld	a,c
   68CF F5            [11]  857 	push	af
   68D0 33            [ 6]  858 	inc	sp
   68D1 CD 3C 55      [17]  859 	call	_cpct_etm_drawTileBox2x4
   68D4 DD F9         [10]  860 	ld	sp, ix
   68D6 DD E1         [14]  861 	pop	ix
   68D8 C9            [10]  862 	ret
                            863 ;src/main.c:212: void borrarEnemigo(u8 x, u8 y) {
                            864 ;	---------------------------------
                            865 ; Function borrarEnemigo
                            866 ; ---------------------------------
   68D9                     867 _borrarEnemigo::
   68D9 DD E5         [15]  868 	push	ix
   68DB DD 21 00 00   [14]  869 	ld	ix,#0
   68DF DD 39         [15]  870 	add	ix,sp
   68E1 F5            [11]  871 	push	af
   68E2 F5            [11]  872 	push	af
                            873 ;src/main.c:216: u8 w = 4 + (x & 1);
   68E3 DD 7E 04      [19]  874 	ld	a,4 (ix)
   68E6 E6 01         [ 7]  875 	and	a, #0x01
   68E8 4F            [ 4]  876 	ld	c,a
   68E9 0C            [ 4]  877 	inc	c
   68EA 0C            [ 4]  878 	inc	c
   68EB 0C            [ 4]  879 	inc	c
   68EC 0C            [ 4]  880 	inc	c
                            881 ;src/main.c:218: u8 h = 6 + (y & 3 ? 1 : 0);
   68ED DD 7E 05      [19]  882 	ld	a,5 (ix)
   68F0 E6 03         [ 7]  883 	and	a, #0x03
   68F2 28 04         [12]  884 	jr	Z,00103$
   68F4 3E 01         [ 7]  885 	ld	a,#0x01
   68F6 18 02         [12]  886 	jr	00104$
   68F8                     887 00103$:
   68F8 3E 00         [ 7]  888 	ld	a,#0x00
   68FA                     889 00104$:
   68FA C6 06         [ 7]  890 	add	a, #0x06
   68FC 47            [ 4]  891 	ld	b,a
                            892 ;src/main.c:220: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68FD 2A 50 64      [16]  893 	ld	hl,(_mapa)
   6900 DD 75 FE      [19]  894 	ld	-2 (ix),l
   6903 DD 74 FF      [19]  895 	ld	-1 (ix),h
   6906 DD 5E 05      [19]  896 	ld	e,5 (ix)
   6909 16 00         [ 7]  897 	ld	d,#0x00
   690B 7B            [ 4]  898 	ld	a,e
   690C C6 E8         [ 7]  899 	add	a,#0xE8
   690E DD 77 FC      [19]  900 	ld	-4 (ix),a
   6911 7A            [ 4]  901 	ld	a,d
   6912 CE FF         [ 7]  902 	adc	a,#0xFF
   6914 DD 77 FD      [19]  903 	ld	-3 (ix),a
   6917 E1            [10]  904 	pop	hl
   6918 E5            [11]  905 	push	hl
   6919 DD CB FD 7E   [20]  906 	bit	7, -3 (ix)
   691D 28 04         [12]  907 	jr	Z,00105$
   691F 21 EB FF      [10]  908 	ld	hl,#0xFFEB
   6922 19            [11]  909 	add	hl,de
   6923                     910 00105$:
   6923 CB 2C         [ 8]  911 	sra	h
   6925 CB 1D         [ 8]  912 	rr	l
   6927 CB 2C         [ 8]  913 	sra	h
   6929 CB 1D         [ 8]  914 	rr	l
   692B 5D            [ 4]  915 	ld	e,l
   692C DD 56 04      [19]  916 	ld	d,4 (ix)
   692F CB 3A         [ 8]  917 	srl	d
   6931 DD 6E FE      [19]  918 	ld	l,-2 (ix)
   6934 DD 66 FF      [19]  919 	ld	h,-1 (ix)
   6937 E5            [11]  920 	push	hl
   6938 21 F0 C0      [10]  921 	ld	hl,#0xC0F0
   693B E5            [11]  922 	push	hl
   693C 3E 28         [ 7]  923 	ld	a,#0x28
   693E F5            [11]  924 	push	af
   693F 33            [ 6]  925 	inc	sp
   6940 C5            [11]  926 	push	bc
   6941 7B            [ 4]  927 	ld	a,e
   6942 F5            [11]  928 	push	af
   6943 33            [ 6]  929 	inc	sp
   6944 D5            [11]  930 	push	de
   6945 33            [ 6]  931 	inc	sp
   6946 CD 3C 55      [17]  932 	call	_cpct_etm_drawTileBox2x4
   6949 DD F9         [10]  933 	ld	sp, ix
   694B DD E1         [14]  934 	pop	ix
   694D C9            [10]  935 	ret
                            936 ;src/main.c:223: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            937 ;	---------------------------------
                            938 ; Function redibujarEnemigo
                            939 ; ---------------------------------
   694E                     940 _redibujarEnemigo::
   694E DD E5         [15]  941 	push	ix
   6950 DD 21 00 00   [14]  942 	ld	ix,#0
   6954 DD 39         [15]  943 	add	ix,sp
                            944 ;src/main.c:224: borrarEnemigo(x, y);
   6956 DD 66 05      [19]  945 	ld	h,5 (ix)
   6959 DD 6E 04      [19]  946 	ld	l,4 (ix)
   695C E5            [11]  947 	push	hl
   695D CD D9 68      [17]  948 	call	_borrarEnemigo
   6960 F1            [10]  949 	pop	af
                            950 ;src/main.c:225: enemy->px = enemy->x;
   6961 DD 4E 06      [19]  951 	ld	c,6 (ix)
   6964 DD 46 07      [19]  952 	ld	b,7 (ix)
   6967 59            [ 4]  953 	ld	e, c
   6968 50            [ 4]  954 	ld	d, b
   6969 13            [ 6]  955 	inc	de
   696A 13            [ 6]  956 	inc	de
   696B 0A            [ 7]  957 	ld	a,(bc)
   696C 12            [ 7]  958 	ld	(de),a
                            959 ;src/main.c:226: enemy->py = enemy->y;
   696D 59            [ 4]  960 	ld	e, c
   696E 50            [ 4]  961 	ld	d, b
   696F 13            [ 6]  962 	inc	de
   6970 13            [ 6]  963 	inc	de
   6971 13            [ 6]  964 	inc	de
   6972 69            [ 4]  965 	ld	l, c
   6973 60            [ 4]  966 	ld	h, b
   6974 23            [ 6]  967 	inc	hl
   6975 7E            [ 7]  968 	ld	a,(hl)
   6976 12            [ 7]  969 	ld	(de),a
                            970 ;src/main.c:227: dibujarEnemigo(enemy);
   6977 C5            [11]  971 	push	bc
   6978 CD F1 67      [17]  972 	call	_dibujarEnemigo
   697B F1            [10]  973 	pop	af
   697C DD E1         [14]  974 	pop	ix
   697E C9            [10]  975 	ret
                            976 ;src/main.c:231: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            977 ;	---------------------------------
                            978 ; Function checkEnemyDead
                            979 ; ---------------------------------
   697F                     980 _checkEnemyDead::
   697F DD E5         [15]  981 	push	ix
   6981 DD 21 00 00   [14]  982 	ld	ix,#0
   6985 DD 39         [15]  983 	add	ix,sp
   6987 21 FA FF      [10]  984 	ld	hl,#-6
   698A 39            [11]  985 	add	hl,sp
   698B F9            [ 6]  986 	ld	sp,hl
                            987 ;src/main.c:233: switch (direction) {
   698C 3E 03         [ 7]  988 	ld	a,#0x03
   698E DD 96 04      [19]  989 	sub	a, 4 (ix)
   6991 DA 6D 6B      [10]  990 	jp	C,00134$
                            991 ;src/main.c:236: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6994 DD 7E 05      [19]  992 	ld	a,5 (ix)
   6997 DD 77 FC      [19]  993 	ld	-4 (ix),a
   699A DD 7E 06      [19]  994 	ld	a,6 (ix)
   699D DD 77 FD      [19]  995 	ld	-3 (ix),a
   69A0 DD 7E FC      [19]  996 	ld	a,-4 (ix)
   69A3 C6 01         [ 7]  997 	add	a, #0x01
   69A5 DD 77 FA      [19]  998 	ld	-6 (ix),a
   69A8 DD 7E FD      [19]  999 	ld	a,-3 (ix)
   69AB CE 00         [ 7] 1000 	adc	a, #0x00
   69AD DD 77 FB      [19] 1001 	ld	-5 (ix),a
                           1002 ;src/main.c:239: enemy->muerto = SI;
   69B0 DD 7E FC      [19] 1003 	ld	a,-4 (ix)
   69B3 C6 08         [ 7] 1004 	add	a, #0x08
   69B5 DD 77 FE      [19] 1005 	ld	-2 (ix),a
   69B8 DD 7E FD      [19] 1006 	ld	a,-3 (ix)
   69BB CE 00         [ 7] 1007 	adc	a, #0x00
   69BD DD 77 FF      [19] 1008 	ld	-1 (ix),a
                           1009 ;src/main.c:233: switch (direction) {
   69C0 DD 5E 04      [19] 1010 	ld	e,4 (ix)
   69C3 16 00         [ 7] 1011 	ld	d,#0x00
   69C5 21 CC 69      [10] 1012 	ld	hl,#00204$
   69C8 19            [11] 1013 	add	hl,de
   69C9 19            [11] 1014 	add	hl,de
   69CA 19            [11] 1015 	add	hl,de
   69CB E9            [ 4] 1016 	jp	(hl)
   69CC                    1017 00204$:
   69CC C3 D8 69      [10] 1018 	jp	00101$
   69CF C3 40 6A      [10] 1019 	jp	00109$
   69D2 C3 A8 6A      [10] 1020 	jp	00117$
   69D5 C3 0F 6B      [10] 1021 	jp	00125$
                           1022 ;src/main.c:235: case 0:
   69D8                    1023 00101$:
                           1024 ;src/main.c:236: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69D8 21 46 64      [10] 1025 	ld	hl, #_cu + 1
   69DB 4E            [ 7] 1026 	ld	c,(hl)
   69DC 06 00         [ 7] 1027 	ld	b,#0x00
   69DE 21 04 00      [10] 1028 	ld	hl,#0x0004
   69E1 09            [11] 1029 	add	hl,bc
   69E2 EB            [ 4] 1030 	ex	de,hl
   69E3 E1            [10] 1031 	pop	hl
   69E4 E5            [11] 1032 	push	hl
   69E5 6E            [ 7] 1033 	ld	l,(hl)
   69E6 26 00         [ 7] 1034 	ld	h,#0x00
   69E8 7B            [ 4] 1035 	ld	a,e
   69E9 95            [ 4] 1036 	sub	a, l
   69EA 7A            [ 4] 1037 	ld	a,d
   69EB 9C            [ 4] 1038 	sbc	a, h
   69EC E2 F1 69      [10] 1039 	jp	PO, 00205$
   69EF EE 80         [ 7] 1040 	xor	a, #0x80
   69F1                    1041 00205$:
   69F1 FA 6D 6B      [10] 1042 	jp	M,00134$
   69F4 11 16 00      [10] 1043 	ld	de,#0x0016
   69F7 19            [11] 1044 	add	hl,de
   69F8 7D            [ 4] 1045 	ld	a,l
   69F9 91            [ 4] 1046 	sub	a, c
   69FA 7C            [ 4] 1047 	ld	a,h
   69FB 98            [ 4] 1048 	sbc	a, b
   69FC E2 01 6A      [10] 1049 	jp	PO, 00206$
   69FF EE 80         [ 7] 1050 	xor	a, #0x80
   6A01                    1051 00206$:
   6A01 FA 6D 6B      [10] 1052 	jp	M,00134$
                           1053 ;src/main.c:237: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   6A04 DD 6E FC      [19] 1054 	ld	l,-4 (ix)
   6A07 DD 66 FD      [19] 1055 	ld	h,-3 (ix)
   6A0A 4E            [ 7] 1056 	ld	c,(hl)
   6A0B 21 45 64      [10] 1057 	ld	hl, #_cu + 0
   6A0E 5E            [ 7] 1058 	ld	e,(hl)
   6A0F 16 00         [ 7] 1059 	ld	d,#0x00
   6A11 13            [ 6] 1060 	inc	de
   6A12 13            [ 6] 1061 	inc	de
   6A13 13            [ 6] 1062 	inc	de
   6A14 13            [ 6] 1063 	inc	de
   6A15 69            [ 4] 1064 	ld	l,c
   6A16 26 00         [ 7] 1065 	ld	h,#0x00
   6A18 7B            [ 4] 1066 	ld	a,e
   6A19 95            [ 4] 1067 	sub	a, l
   6A1A 7A            [ 4] 1068 	ld	a,d
   6A1B 9C            [ 4] 1069 	sbc	a, h
   6A1C E2 21 6A      [10] 1070 	jp	PO, 00207$
   6A1F EE 80         [ 7] 1071 	xor	a, #0x80
   6A21                    1072 00207$:
   6A21 F2 6D 6B      [10] 1073 	jp	P,00134$
                           1074 ;src/main.c:238: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A24 BF            [ 4] 1075 	cp	a, a
   6A25 ED 52         [15] 1076 	sbc	hl, de
   6A27 3E 01         [ 7] 1077 	ld	a,#0x01
   6A29 BD            [ 4] 1078 	cp	a, l
   6A2A 3E 00         [ 7] 1079 	ld	a,#0x00
   6A2C 9C            [ 4] 1080 	sbc	a, h
   6A2D E2 32 6A      [10] 1081 	jp	PO, 00208$
   6A30 EE 80         [ 7] 1082 	xor	a, #0x80
   6A32                    1083 00208$:
   6A32 FA 6D 6B      [10] 1084 	jp	M,00134$
                           1085 ;src/main.c:239: enemy->muerto = SI;
   6A35 DD 6E FE      [19] 1086 	ld	l,-2 (ix)
   6A38 DD 66 FF      [19] 1087 	ld	h,-1 (ix)
   6A3B 36 01         [10] 1088 	ld	(hl),#0x01
                           1089 ;src/main.c:243: break;
   6A3D C3 6D 6B      [10] 1090 	jp	00134$
                           1091 ;src/main.c:244: case 1:
   6A40                    1092 00109$:
                           1093 ;src/main.c:245: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A40 21 46 64      [10] 1094 	ld	hl, #_cu + 1
   6A43 4E            [ 7] 1095 	ld	c,(hl)
   6A44 06 00         [ 7] 1096 	ld	b,#0x00
   6A46 21 04 00      [10] 1097 	ld	hl,#0x0004
   6A49 09            [11] 1098 	add	hl,bc
   6A4A EB            [ 4] 1099 	ex	de,hl
   6A4B E1            [10] 1100 	pop	hl
   6A4C E5            [11] 1101 	push	hl
   6A4D 6E            [ 7] 1102 	ld	l,(hl)
   6A4E 26 00         [ 7] 1103 	ld	h,#0x00
   6A50 7B            [ 4] 1104 	ld	a,e
   6A51 95            [ 4] 1105 	sub	a, l
   6A52 7A            [ 4] 1106 	ld	a,d
   6A53 9C            [ 4] 1107 	sbc	a, h
   6A54 E2 59 6A      [10] 1108 	jp	PO, 00209$
   6A57 EE 80         [ 7] 1109 	xor	a, #0x80
   6A59                    1110 00209$:
   6A59 FA 6D 6B      [10] 1111 	jp	M,00134$
   6A5C 11 16 00      [10] 1112 	ld	de,#0x0016
   6A5F 19            [11] 1113 	add	hl,de
   6A60 7D            [ 4] 1114 	ld	a,l
   6A61 91            [ 4] 1115 	sub	a, c
   6A62 7C            [ 4] 1116 	ld	a,h
   6A63 98            [ 4] 1117 	sbc	a, b
   6A64 E2 69 6A      [10] 1118 	jp	PO, 00210$
   6A67 EE 80         [ 7] 1119 	xor	a, #0x80
   6A69                    1120 00210$:
   6A69 FA 6D 6B      [10] 1121 	jp	M,00134$
                           1122 ;src/main.c:246: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6A6C 21 45 64      [10] 1123 	ld	hl, #_cu + 0
   6A6F 4E            [ 7] 1124 	ld	c,(hl)
   6A70 DD 6E FC      [19] 1125 	ld	l,-4 (ix)
   6A73 DD 66 FD      [19] 1126 	ld	h,-3 (ix)
   6A76 5E            [ 7] 1127 	ld	e,(hl)
   6A77 16 00         [ 7] 1128 	ld	d,#0x00
   6A79 13            [ 6] 1129 	inc	de
   6A7A 13            [ 6] 1130 	inc	de
   6A7B 13            [ 6] 1131 	inc	de
   6A7C 13            [ 6] 1132 	inc	de
   6A7D 69            [ 4] 1133 	ld	l,c
   6A7E 26 00         [ 7] 1134 	ld	h,#0x00
   6A80 7B            [ 4] 1135 	ld	a,e
   6A81 95            [ 4] 1136 	sub	a, l
   6A82 7A            [ 4] 1137 	ld	a,d
   6A83 9C            [ 4] 1138 	sbc	a, h
   6A84 E2 89 6A      [10] 1139 	jp	PO, 00211$
   6A87 EE 80         [ 7] 1140 	xor	a, #0x80
   6A89                    1141 00211$:
   6A89 F2 6D 6B      [10] 1142 	jp	P,00134$
                           1143 ;src/main.c:247: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A8C BF            [ 4] 1144 	cp	a, a
   6A8D ED 52         [15] 1145 	sbc	hl, de
   6A8F 3E 01         [ 7] 1146 	ld	a,#0x01
   6A91 BD            [ 4] 1147 	cp	a, l
   6A92 3E 00         [ 7] 1148 	ld	a,#0x00
   6A94 9C            [ 4] 1149 	sbc	a, h
   6A95 E2 9A 6A      [10] 1150 	jp	PO, 00212$
   6A98 EE 80         [ 7] 1151 	xor	a, #0x80
   6A9A                    1152 00212$:
   6A9A FA 6D 6B      [10] 1153 	jp	M,00134$
                           1154 ;src/main.c:248: enemy->muerto = SI;
   6A9D DD 6E FE      [19] 1155 	ld	l,-2 (ix)
   6AA0 DD 66 FF      [19] 1156 	ld	h,-1 (ix)
   6AA3 36 01         [10] 1157 	ld	(hl),#0x01
                           1158 ;src/main.c:252: break;
   6AA5 C3 6D 6B      [10] 1159 	jp	00134$
                           1160 ;src/main.c:254: case 2:
   6AA8                    1161 00117$:
                           1162 ;src/main.c:255: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AA8 21 45 64      [10] 1163 	ld	hl, #_cu + 0
   6AAB 4E            [ 7] 1164 	ld	c,(hl)
   6AAC 06 00         [ 7] 1165 	ld	b,#0x00
   6AAE 59            [ 4] 1166 	ld	e, c
   6AAF 50            [ 4] 1167 	ld	d, b
   6AB0 13            [ 6] 1168 	inc	de
   6AB1 13            [ 6] 1169 	inc	de
   6AB2 DD 6E FC      [19] 1170 	ld	l,-4 (ix)
   6AB5 DD 66 FD      [19] 1171 	ld	h,-3 (ix)
   6AB8 6E            [ 7] 1172 	ld	l,(hl)
   6AB9 26 00         [ 7] 1173 	ld	h,#0x00
   6ABB 7B            [ 4] 1174 	ld	a,e
   6ABC 95            [ 4] 1175 	sub	a, l
   6ABD 7A            [ 4] 1176 	ld	a,d
   6ABE 9C            [ 4] 1177 	sbc	a, h
   6ABF E2 C4 6A      [10] 1178 	jp	PO, 00213$
   6AC2 EE 80         [ 7] 1179 	xor	a, #0x80
   6AC4                    1180 00213$:
   6AC4 FA 6D 6B      [10] 1181 	jp	M,00134$
   6AC7 11 04 00      [10] 1182 	ld	de,#0x0004
   6ACA 19            [11] 1183 	add	hl,de
   6ACB 7D            [ 4] 1184 	ld	a,l
   6ACC 91            [ 4] 1185 	sub	a, c
   6ACD 7C            [ 4] 1186 	ld	a,h
   6ACE 98            [ 4] 1187 	sbc	a, b
   6ACF E2 D4 6A      [10] 1188 	jp	PO, 00214$
   6AD2 EE 80         [ 7] 1189 	xor	a, #0x80
   6AD4                    1190 00214$:
   6AD4 FA 6D 6B      [10] 1191 	jp	M,00134$
                           1192 ;src/main.c:256: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6AD7 21 46 64      [10] 1193 	ld	hl, #(_cu + 0x0001) + 0
   6ADA 4E            [ 7] 1194 	ld	c,(hl)
   6ADB E1            [10] 1195 	pop	hl
   6ADC E5            [11] 1196 	push	hl
   6ADD 5E            [ 7] 1197 	ld	e,(hl)
   6ADE 16 00         [ 7] 1198 	ld	d,#0x00
   6AE0 21 16 00      [10] 1199 	ld	hl,#0x0016
   6AE3 19            [11] 1200 	add	hl,de
   6AE4 EB            [ 4] 1201 	ex	de,hl
   6AE5 69            [ 4] 1202 	ld	l,c
   6AE6 26 00         [ 7] 1203 	ld	h,#0x00
   6AE8 7B            [ 4] 1204 	ld	a,e
   6AE9 95            [ 4] 1205 	sub	a, l
   6AEA 7A            [ 4] 1206 	ld	a,d
   6AEB 9C            [ 4] 1207 	sbc	a, h
   6AEC E2 F1 6A      [10] 1208 	jp	PO, 00215$
   6AEF EE 80         [ 7] 1209 	xor	a, #0x80
   6AF1                    1210 00215$:
   6AF1 F2 6D 6B      [10] 1211 	jp	P,00134$
                           1212 ;src/main.c:257: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6AF4 BF            [ 4] 1213 	cp	a, a
   6AF5 ED 52         [15] 1214 	sbc	hl, de
   6AF7 3E 02         [ 7] 1215 	ld	a,#0x02
   6AF9 BD            [ 4] 1216 	cp	a, l
   6AFA 3E 00         [ 7] 1217 	ld	a,#0x00
   6AFC 9C            [ 4] 1218 	sbc	a, h
   6AFD E2 02 6B      [10] 1219 	jp	PO, 00216$
   6B00 EE 80         [ 7] 1220 	xor	a, #0x80
   6B02                    1221 00216$:
   6B02 FA 6D 6B      [10] 1222 	jp	M,00134$
                           1223 ;src/main.c:258: enemy->muerto = SI;
   6B05 DD 6E FE      [19] 1224 	ld	l,-2 (ix)
   6B08 DD 66 FF      [19] 1225 	ld	h,-1 (ix)
   6B0B 36 01         [10] 1226 	ld	(hl),#0x01
                           1227 ;src/main.c:262: break;
   6B0D 18 5E         [12] 1228 	jr	00134$
                           1229 ;src/main.c:263: case 3:
   6B0F                    1230 00125$:
                           1231 ;src/main.c:264: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6B0F 21 45 64      [10] 1232 	ld	hl, #_cu + 0
   6B12 4E            [ 7] 1233 	ld	c,(hl)
   6B13 06 00         [ 7] 1234 	ld	b,#0x00
   6B15 59            [ 4] 1235 	ld	e, c
   6B16 50            [ 4] 1236 	ld	d, b
   6B17 13            [ 6] 1237 	inc	de
   6B18 13            [ 6] 1238 	inc	de
   6B19 DD 6E FC      [19] 1239 	ld	l,-4 (ix)
   6B1C DD 66 FD      [19] 1240 	ld	h,-3 (ix)
   6B1F 6E            [ 7] 1241 	ld	l,(hl)
   6B20 26 00         [ 7] 1242 	ld	h,#0x00
   6B22 7B            [ 4] 1243 	ld	a,e
   6B23 95            [ 4] 1244 	sub	a, l
   6B24 7A            [ 4] 1245 	ld	a,d
   6B25 9C            [ 4] 1246 	sbc	a, h
   6B26 E2 2B 6B      [10] 1247 	jp	PO, 00217$
   6B29 EE 80         [ 7] 1248 	xor	a, #0x80
   6B2B                    1249 00217$:
   6B2B FA 6D 6B      [10] 1250 	jp	M,00134$
   6B2E 11 04 00      [10] 1251 	ld	de,#0x0004
   6B31 19            [11] 1252 	add	hl,de
   6B32 7D            [ 4] 1253 	ld	a,l
   6B33 91            [ 4] 1254 	sub	a, c
   6B34 7C            [ 4] 1255 	ld	a,h
   6B35 98            [ 4] 1256 	sbc	a, b
   6B36 E2 3B 6B      [10] 1257 	jp	PO, 00218$
   6B39 EE 80         [ 7] 1258 	xor	a, #0x80
   6B3B                    1259 00218$:
   6B3B FA 6D 6B      [10] 1260 	jp	M,00134$
                           1261 ;src/main.c:265: if(enemy->y>cu.y){
   6B3E E1            [10] 1262 	pop	hl
   6B3F E5            [11] 1263 	push	hl
   6B40 4E            [ 7] 1264 	ld	c,(hl)
   6B41 21 46 64      [10] 1265 	ld	hl, #(_cu + 0x0001) + 0
   6B44 5E            [ 7] 1266 	ld	e,(hl)
   6B45 7B            [ 4] 1267 	ld	a,e
   6B46 91            [ 4] 1268 	sub	a, c
   6B47 30 24         [12] 1269 	jr	NC,00134$
                           1270 ;src/main.c:266: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6B49 06 00         [ 7] 1271 	ld	b,#0x00
   6B4B 16 00         [ 7] 1272 	ld	d,#0x00
   6B4D 21 08 00      [10] 1273 	ld	hl,#0x0008
   6B50 19            [11] 1274 	add	hl,de
   6B51 79            [ 4] 1275 	ld	a,c
   6B52 95            [ 4] 1276 	sub	a, l
   6B53 4F            [ 4] 1277 	ld	c,a
   6B54 78            [ 4] 1278 	ld	a,b
   6B55 9C            [ 4] 1279 	sbc	a, h
   6B56 47            [ 4] 1280 	ld	b,a
   6B57 3E 02         [ 7] 1281 	ld	a,#0x02
   6B59 B9            [ 4] 1282 	cp	a, c
   6B5A 3E 00         [ 7] 1283 	ld	a,#0x00
   6B5C 98            [ 4] 1284 	sbc	a, b
   6B5D E2 62 6B      [10] 1285 	jp	PO, 00219$
   6B60 EE 80         [ 7] 1286 	xor	a, #0x80
   6B62                    1287 00219$:
   6B62 FA 6D 6B      [10] 1288 	jp	M,00134$
                           1289 ;src/main.c:267: enemy->muerto = SI;
   6B65 DD 6E FE      [19] 1290 	ld	l,-2 (ix)
   6B68 DD 66 FF      [19] 1291 	ld	h,-1 (ix)
   6B6B 36 01         [10] 1292 	ld	(hl),#0x01
                           1293 ;src/main.c:272: }
   6B6D                    1294 00134$:
   6B6D DD F9         [10] 1295 	ld	sp, ix
   6B6F DD E1         [14] 1296 	pop	ix
   6B71 C9            [10] 1297 	ret
                           1298 ;src/main.c:275: void moverEnemigoArriba(TEnemy *enemy){
                           1299 ;	---------------------------------
                           1300 ; Function moverEnemigoArriba
                           1301 ; ---------------------------------
   6B72                    1302 _moverEnemigoArriba::
   6B72 DD E5         [15] 1303 	push	ix
   6B74 DD 21 00 00   [14] 1304 	ld	ix,#0
   6B78 DD 39         [15] 1305 	add	ix,sp
                           1306 ;src/main.c:276: enemy->y--;
   6B7A DD 4E 04      [19] 1307 	ld	c,4 (ix)
   6B7D DD 46 05      [19] 1308 	ld	b,5 (ix)
   6B80 69            [ 4] 1309 	ld	l, c
   6B81 60            [ 4] 1310 	ld	h, b
   6B82 23            [ 6] 1311 	inc	hl
   6B83 5E            [ 7] 1312 	ld	e,(hl)
   6B84 1D            [ 4] 1313 	dec	e
   6B85 73            [ 7] 1314 	ld	(hl),e
                           1315 ;src/main.c:277: enemy->y--;
   6B86 1D            [ 4] 1316 	dec	e
   6B87 73            [ 7] 1317 	ld	(hl),e
                           1318 ;src/main.c:278: enemy->mover = SI;
   6B88 21 06 00      [10] 1319 	ld	hl,#0x0006
   6B8B 09            [11] 1320 	add	hl,bc
   6B8C 36 01         [10] 1321 	ld	(hl),#0x01
   6B8E DD E1         [14] 1322 	pop	ix
   6B90 C9            [10] 1323 	ret
                           1324 ;src/main.c:281: void moverEnemigoAbajo(TEnemy *enemy){
                           1325 ;	---------------------------------
                           1326 ; Function moverEnemigoAbajo
                           1327 ; ---------------------------------
   6B91                    1328 _moverEnemigoAbajo::
   6B91 DD E5         [15] 1329 	push	ix
   6B93 DD 21 00 00   [14] 1330 	ld	ix,#0
   6B97 DD 39         [15] 1331 	add	ix,sp
                           1332 ;src/main.c:282: enemy->y++;
   6B99 DD 4E 04      [19] 1333 	ld	c,4 (ix)
   6B9C DD 46 05      [19] 1334 	ld	b,5 (ix)
   6B9F 59            [ 4] 1335 	ld	e, c
   6BA0 50            [ 4] 1336 	ld	d, b
   6BA1 13            [ 6] 1337 	inc	de
   6BA2 1A            [ 7] 1338 	ld	a,(de)
   6BA3 3C            [ 4] 1339 	inc	a
   6BA4 12            [ 7] 1340 	ld	(de),a
                           1341 ;src/main.c:283: enemy->y++;
   6BA5 3C            [ 4] 1342 	inc	a
   6BA6 12            [ 7] 1343 	ld	(de),a
                           1344 ;src/main.c:284: enemy->mover = SI;
   6BA7 21 06 00      [10] 1345 	ld	hl,#0x0006
   6BAA 09            [11] 1346 	add	hl,bc
   6BAB 36 01         [10] 1347 	ld	(hl),#0x01
   6BAD DD E1         [14] 1348 	pop	ix
   6BAF C9            [10] 1349 	ret
                           1350 ;src/main.c:287: void moverEnemigoDerecha(TEnemy *enemy){
                           1351 ;	---------------------------------
                           1352 ; Function moverEnemigoDerecha
                           1353 ; ---------------------------------
   6BB0                    1354 _moverEnemigoDerecha::
                           1355 ;src/main.c:288: enemy->x++;
   6BB0 D1            [10] 1356 	pop	de
   6BB1 C1            [10] 1357 	pop	bc
   6BB2 C5            [11] 1358 	push	bc
   6BB3 D5            [11] 1359 	push	de
   6BB4 0A            [ 7] 1360 	ld	a,(bc)
   6BB5 3C            [ 4] 1361 	inc	a
   6BB6 02            [ 7] 1362 	ld	(bc),a
                           1363 ;src/main.c:289: enemy->x++;
   6BB7 3C            [ 4] 1364 	inc	a
   6BB8 02            [ 7] 1365 	ld	(bc),a
                           1366 ;src/main.c:290: enemy->mover = SI;
   6BB9 21 06 00      [10] 1367 	ld	hl,#0x0006
   6BBC 09            [11] 1368 	add	hl,bc
   6BBD 36 01         [10] 1369 	ld	(hl),#0x01
   6BBF C9            [10] 1370 	ret
                           1371 ;src/main.c:293: void moverEnemigoIzquierda(TEnemy *enemy){
                           1372 ;	---------------------------------
                           1373 ; Function moverEnemigoIzquierda
                           1374 ; ---------------------------------
   6BC0                    1375 _moverEnemigoIzquierda::
                           1376 ;src/main.c:294: enemy->x--;
   6BC0 D1            [10] 1377 	pop	de
   6BC1 C1            [10] 1378 	pop	bc
   6BC2 C5            [11] 1379 	push	bc
   6BC3 D5            [11] 1380 	push	de
   6BC4 0A            [ 7] 1381 	ld	a,(bc)
   6BC5 C6 FF         [ 7] 1382 	add	a,#0xFF
   6BC7 02            [ 7] 1383 	ld	(bc),a
                           1384 ;src/main.c:295: enemy->x--;
   6BC8 C6 FF         [ 7] 1385 	add	a,#0xFF
   6BCA 02            [ 7] 1386 	ld	(bc),a
                           1387 ;src/main.c:296: enemy->mover = SI;
   6BCB 21 06 00      [10] 1388 	ld	hl,#0x0006
   6BCE 09            [11] 1389 	add	hl,bc
   6BCF 36 01         [10] 1390 	ld	(hl),#0x01
   6BD1 C9            [10] 1391 	ret
                           1392 ;src/main.c:299: void moverEnemigoPatrol(TEnemy* enemy){
                           1393 ;	---------------------------------
                           1394 ; Function moverEnemigoPatrol
                           1395 ; ---------------------------------
   6BD2                    1396 _moverEnemigoPatrol::
   6BD2 DD E5         [15] 1397 	push	ix
   6BD4 DD 21 00 00   [14] 1398 	ld	ix,#0
   6BD8 DD 39         [15] 1399 	add	ix,sp
   6BDA 21 F3 FF      [10] 1400 	ld	hl,#-13
   6BDD 39            [11] 1401 	add	hl,sp
   6BDE F9            [ 6] 1402 	ld	sp,hl
                           1403 ;src/main.c:301: if(!enemy->muerto){
   6BDF DD 4E 04      [19] 1404 	ld	c,4 (ix)
   6BE2 DD 46 05      [19] 1405 	ld	b,5 (ix)
   6BE5 C5            [11] 1406 	push	bc
   6BE6 FD E1         [14] 1407 	pop	iy
   6BE8 FD 7E 08      [19] 1408 	ld	a,8 (iy)
   6BEB B7            [ 4] 1409 	or	a, a
   6BEC C2 16 6E      [10] 1410 	jp	NZ,00118$
                           1411 ;src/main.c:302: if (!enemy->reversePatrol) {
   6BEF 21 0C 00      [10] 1412 	ld	hl,#0x000C
   6BF2 09            [11] 1413 	add	hl,bc
   6BF3 DD 75 FE      [19] 1414 	ld	-2 (ix),l
   6BF6 DD 74 FF      [19] 1415 	ld	-1 (ix),h
   6BF9 DD 6E FE      [19] 1416 	ld	l,-2 (ix)
   6BFC DD 66 FF      [19] 1417 	ld	h,-1 (ix)
   6BFF 7E            [ 7] 1418 	ld	a,(hl)
   6C00 DD 77 FD      [19] 1419 	ld	-3 (ix),a
                           1420 ;src/main.c:303: if(enemy->iter < enemy->longitud_camino){
   6C03 21 0E 00      [10] 1421 	ld	hl,#0x000E
   6C06 09            [11] 1422 	add	hl,bc
   6C07 DD 75 FB      [19] 1423 	ld	-5 (ix),l
   6C0A DD 74 FC      [19] 1424 	ld	-4 (ix),h
   6C0D DD 6E FB      [19] 1425 	ld	l,-5 (ix)
   6C10 DD 66 FC      [19] 1426 	ld	h,-4 (ix)
   6C13 5E            [ 7] 1427 	ld	e,(hl)
   6C14 23            [ 6] 1428 	inc	hl
   6C15 56            [ 7] 1429 	ld	d,(hl)
   6C16 21 E1 00      [10] 1430 	ld	hl,#0x00E1
   6C19 09            [11] 1431 	add	hl,bc
   6C1A DD 75 F9      [19] 1432 	ld	-7 (ix),l
   6C1D DD 74 FA      [19] 1433 	ld	-6 (ix),h
                           1434 ;src/main.c:305: enemy->mover = SI;
   6C20 21 06 00      [10] 1435 	ld	hl,#0x0006
   6C23 09            [11] 1436 	add	hl,bc
   6C24 DD 75 F7      [19] 1437 	ld	-9 (ix),l
   6C27 DD 74 F8      [19] 1438 	ld	-8 (ix),h
                           1439 ;src/main.c:307: enemy->x = enemy->camino[enemy->iter];
   6C2A 21 19 00      [10] 1440 	ld	hl,#0x0019
   6C2D 09            [11] 1441 	add	hl,bc
   6C2E DD 75 F5      [19] 1442 	ld	-11 (ix),l
   6C31 DD 74 F6      [19] 1443 	ld	-10 (ix),h
                           1444 ;src/main.c:309: enemy->y = enemy->camino[enemy->iter];
   6C34 21 01 00      [10] 1445 	ld	hl,#0x0001
   6C37 09            [11] 1446 	add	hl,bc
   6C38 E3            [19] 1447 	ex	(sp), hl
                           1448 ;src/main.c:302: if (!enemy->reversePatrol) {
   6C39 DD 7E FD      [19] 1449 	ld	a,-3 (ix)
   6C3C B7            [ 4] 1450 	or	a, a
   6C3D C2 14 6D      [10] 1451 	jp	NZ,00114$
                           1452 ;src/main.c:303: if(enemy->iter < enemy->longitud_camino){
   6C40 DD 6E F9      [19] 1453 	ld	l,-7 (ix)
   6C43 DD 66 FA      [19] 1454 	ld	h,-6 (ix)
   6C46 6E            [ 7] 1455 	ld	l,(hl)
   6C47 26 00         [ 7] 1456 	ld	h,#0x00
   6C49 7B            [ 4] 1457 	ld	a,e
   6C4A 95            [ 4] 1458 	sub	a, l
   6C4B 7A            [ 4] 1459 	ld	a,d
   6C4C 9C            [ 4] 1460 	sbc	a, h
   6C4D E2 52 6C      [10] 1461 	jp	PO, 00144$
   6C50 EE 80         [ 7] 1462 	xor	a, #0x80
   6C52                    1463 00144$:
   6C52 F2 EF 6C      [10] 1464 	jp	P,00105$
                           1465 ;src/main.c:304: if(enemy->iter == 0){
   6C55 7A            [ 4] 1466 	ld	a,d
   6C56 B3            [ 4] 1467 	or	a,e
   6C57 20 50         [12] 1468 	jr	NZ,00102$
                           1469 ;src/main.c:305: enemy->mover = SI;
   6C59 DD 6E F7      [19] 1470 	ld	l,-9 (ix)
   6C5C DD 66 F8      [19] 1471 	ld	h,-8 (ix)
   6C5F 36 01         [10] 1472 	ld	(hl),#0x01
                           1473 ;src/main.c:306: enemy->iter = 2;
   6C61 DD 6E FB      [19] 1474 	ld	l,-5 (ix)
   6C64 DD 66 FC      [19] 1475 	ld	h,-4 (ix)
   6C67 36 02         [10] 1476 	ld	(hl),#0x02
   6C69 23            [ 6] 1477 	inc	hl
   6C6A 36 00         [10] 1478 	ld	(hl),#0x00
                           1479 ;src/main.c:307: enemy->x = enemy->camino[enemy->iter];
   6C6C DD 6E FB      [19] 1480 	ld	l,-5 (ix)
   6C6F DD 66 FC      [19] 1481 	ld	h,-4 (ix)
   6C72 5E            [ 7] 1482 	ld	e,(hl)
   6C73 23            [ 6] 1483 	inc	hl
   6C74 56            [ 7] 1484 	ld	d,(hl)
   6C75 DD 6E F5      [19] 1485 	ld	l,-11 (ix)
   6C78 DD 66 F6      [19] 1486 	ld	h,-10 (ix)
   6C7B 19            [11] 1487 	add	hl,de
   6C7C 7E            [ 7] 1488 	ld	a,(hl)
   6C7D 02            [ 7] 1489 	ld	(bc),a
                           1490 ;src/main.c:308: ++enemy->iter;
   6C7E DD 6E FB      [19] 1491 	ld	l,-5 (ix)
   6C81 DD 66 FC      [19] 1492 	ld	h,-4 (ix)
   6C84 4E            [ 7] 1493 	ld	c,(hl)
   6C85 23            [ 6] 1494 	inc	hl
   6C86 46            [ 7] 1495 	ld	b,(hl)
   6C87 03            [ 6] 1496 	inc	bc
   6C88 DD 6E FB      [19] 1497 	ld	l,-5 (ix)
   6C8B DD 66 FC      [19] 1498 	ld	h,-4 (ix)
   6C8E 71            [ 7] 1499 	ld	(hl),c
   6C8F 23            [ 6] 1500 	inc	hl
   6C90 70            [ 7] 1501 	ld	(hl),b
                           1502 ;src/main.c:309: enemy->y = enemy->camino[enemy->iter];
   6C91 DD 6E F5      [19] 1503 	ld	l,-11 (ix)
   6C94 DD 66 F6      [19] 1504 	ld	h,-10 (ix)
   6C97 09            [11] 1505 	add	hl,bc
   6C98 5E            [ 7] 1506 	ld	e,(hl)
   6C99 E1            [10] 1507 	pop	hl
   6C9A E5            [11] 1508 	push	hl
   6C9B 73            [ 7] 1509 	ld	(hl),e
                           1510 ;src/main.c:310: ++enemy->iter;
   6C9C 03            [ 6] 1511 	inc	bc
   6C9D DD 6E FB      [19] 1512 	ld	l,-5 (ix)
   6CA0 DD 66 FC      [19] 1513 	ld	h,-4 (ix)
   6CA3 71            [ 7] 1514 	ld	(hl),c
   6CA4 23            [ 6] 1515 	inc	hl
   6CA5 70            [ 7] 1516 	ld	(hl),b
   6CA6 C3 16 6E      [10] 1517 	jp	00118$
   6CA9                    1518 00102$:
                           1519 ;src/main.c:312: enemy->mover = SI;
   6CA9 DD 6E F7      [19] 1520 	ld	l,-9 (ix)
   6CAC DD 66 F8      [19] 1521 	ld	h,-8 (ix)
   6CAF 36 01         [10] 1522 	ld	(hl),#0x01
                           1523 ;src/main.c:313: enemy->x = enemy->camino[enemy->iter];
   6CB1 DD 6E FB      [19] 1524 	ld	l,-5 (ix)
   6CB4 DD 66 FC      [19] 1525 	ld	h,-4 (ix)
   6CB7 5E            [ 7] 1526 	ld	e,(hl)
   6CB8 23            [ 6] 1527 	inc	hl
   6CB9 56            [ 7] 1528 	ld	d,(hl)
   6CBA DD 6E F5      [19] 1529 	ld	l,-11 (ix)
   6CBD DD 66 F6      [19] 1530 	ld	h,-10 (ix)
   6CC0 19            [11] 1531 	add	hl,de
   6CC1 7E            [ 7] 1532 	ld	a,(hl)
   6CC2 02            [ 7] 1533 	ld	(bc),a
                           1534 ;src/main.c:314: ++enemy->iter;
   6CC3 DD 6E FB      [19] 1535 	ld	l,-5 (ix)
   6CC6 DD 66 FC      [19] 1536 	ld	h,-4 (ix)
   6CC9 5E            [ 7] 1537 	ld	e,(hl)
   6CCA 23            [ 6] 1538 	inc	hl
   6CCB 56            [ 7] 1539 	ld	d,(hl)
   6CCC 13            [ 6] 1540 	inc	de
   6CCD DD 6E FB      [19] 1541 	ld	l,-5 (ix)
   6CD0 DD 66 FC      [19] 1542 	ld	h,-4 (ix)
   6CD3 73            [ 7] 1543 	ld	(hl),e
   6CD4 23            [ 6] 1544 	inc	hl
   6CD5 72            [ 7] 1545 	ld	(hl),d
                           1546 ;src/main.c:315: enemy->y = enemy->camino[enemy->iter];
   6CD6 DD 6E F5      [19] 1547 	ld	l,-11 (ix)
   6CD9 DD 66 F6      [19] 1548 	ld	h,-10 (ix)
   6CDC 19            [11] 1549 	add	hl,de
   6CDD 7E            [ 7] 1550 	ld	a,(hl)
   6CDE E1            [10] 1551 	pop	hl
   6CDF E5            [11] 1552 	push	hl
   6CE0 77            [ 7] 1553 	ld	(hl),a
                           1554 ;src/main.c:316: ++enemy->iter;
   6CE1 13            [ 6] 1555 	inc	de
   6CE2 4B            [ 4] 1556 	ld	c,e
   6CE3 DD 6E FB      [19] 1557 	ld	l,-5 (ix)
   6CE6 DD 66 FC      [19] 1558 	ld	h,-4 (ix)
   6CE9 71            [ 7] 1559 	ld	(hl),c
   6CEA 23            [ 6] 1560 	inc	hl
   6CEB 72            [ 7] 1561 	ld	(hl),d
   6CEC C3 16 6E      [10] 1562 	jp	00118$
   6CEF                    1563 00105$:
                           1564 ;src/main.c:320: enemy->mover = NO;
   6CEF DD 6E F7      [19] 1565 	ld	l,-9 (ix)
   6CF2 DD 66 F8      [19] 1566 	ld	h,-8 (ix)
   6CF5 36 00         [10] 1567 	ld	(hl),#0x00
                           1568 ;src/main.c:321: enemy->iter = enemy->longitud_camino;
   6CF7 DD 6E F9      [19] 1569 	ld	l,-7 (ix)
   6CFA DD 66 FA      [19] 1570 	ld	h,-6 (ix)
   6CFD 4E            [ 7] 1571 	ld	c,(hl)
   6CFE 06 00         [ 7] 1572 	ld	b,#0x00
   6D00 DD 6E FB      [19] 1573 	ld	l,-5 (ix)
   6D03 DD 66 FC      [19] 1574 	ld	h,-4 (ix)
   6D06 71            [ 7] 1575 	ld	(hl),c
   6D07 23            [ 6] 1576 	inc	hl
   6D08 70            [ 7] 1577 	ld	(hl),b
                           1578 ;src/main.c:322: enemy->reversePatrol = 1;
   6D09 DD 6E FE      [19] 1579 	ld	l,-2 (ix)
   6D0C DD 66 FF      [19] 1580 	ld	h,-1 (ix)
   6D0F 36 01         [10] 1581 	ld	(hl),#0x01
   6D11 C3 16 6E      [10] 1582 	jp	00118$
   6D14                    1583 00114$:
                           1584 ;src/main.c:325: if(enemy->iter > 0){
   6D14 AF            [ 4] 1585 	xor	a, a
   6D15 BB            [ 4] 1586 	cp	a, e
   6D16 9A            [ 4] 1587 	sbc	a, d
   6D17 E2 1C 6D      [10] 1588 	jp	PO, 00145$
   6D1A EE 80         [ 7] 1589 	xor	a, #0x80
   6D1C                    1590 00145$:
   6D1C F2 FC 6D      [10] 1591 	jp	P,00111$
                           1592 ;src/main.c:326: if(enemy->iter == enemy->longitud_camino){
   6D1F DD 6E F9      [19] 1593 	ld	l,-7 (ix)
   6D22 DD 66 FA      [19] 1594 	ld	h,-6 (ix)
   6D25 6E            [ 7] 1595 	ld	l,(hl)
   6D26 DD 75 F9      [19] 1596 	ld	-7 (ix),l
   6D29 DD 36 FA 00   [19] 1597 	ld	-6 (ix),#0x00
   6D2D 7B            [ 4] 1598 	ld	a,e
   6D2E DD 96 F9      [19] 1599 	sub	a, -7 (ix)
   6D31 C2 B8 6D      [10] 1600 	jp	NZ,00108$
   6D34 7A            [ 4] 1601 	ld	a,d
   6D35 DD 96 FA      [19] 1602 	sub	a, -6 (ix)
   6D38 C2 B8 6D      [10] 1603 	jp	NZ,00108$
                           1604 ;src/main.c:327: enemy->mover = SI;
   6D3B DD 6E F7      [19] 1605 	ld	l,-9 (ix)
   6D3E DD 66 F8      [19] 1606 	ld	h,-8 (ix)
   6D41 36 01         [10] 1607 	ld	(hl),#0x01
                           1608 ;src/main.c:328: enemy->iter = enemy->iter - 1;
   6D43 DD 6E FB      [19] 1609 	ld	l,-5 (ix)
   6D46 DD 66 FC      [19] 1610 	ld	h,-4 (ix)
   6D49 5E            [ 7] 1611 	ld	e,(hl)
   6D4A 23            [ 6] 1612 	inc	hl
   6D4B 56            [ 7] 1613 	ld	d,(hl)
   6D4C 7B            [ 4] 1614 	ld	a,e
   6D4D C6 FF         [ 7] 1615 	add	a,#0xFF
   6D4F DD 77 F9      [19] 1616 	ld	-7 (ix),a
   6D52 7A            [ 4] 1617 	ld	a,d
   6D53 CE FF         [ 7] 1618 	adc	a,#0xFF
   6D55 DD 77 FA      [19] 1619 	ld	-6 (ix),a
   6D58 DD 6E FB      [19] 1620 	ld	l,-5 (ix)
   6D5B DD 66 FC      [19] 1621 	ld	h,-4 (ix)
   6D5E DD 7E F9      [19] 1622 	ld	a,-7 (ix)
   6D61 77            [ 7] 1623 	ld	(hl),a
   6D62 23            [ 6] 1624 	inc	hl
   6D63 DD 7E FA      [19] 1625 	ld	a,-6 (ix)
   6D66 77            [ 7] 1626 	ld	(hl),a
                           1627 ;src/main.c:329: enemy->iter = enemy->iter - 2;
   6D67 DD 5E F9      [19] 1628 	ld	e,-7 (ix)
   6D6A DD 56 FA      [19] 1629 	ld	d,-6 (ix)
   6D6D 1B            [ 6] 1630 	dec	de
   6D6E 1B            [ 6] 1631 	dec	de
   6D6F DD 6E FB      [19] 1632 	ld	l,-5 (ix)
   6D72 DD 66 FC      [19] 1633 	ld	h,-4 (ix)
   6D75 73            [ 7] 1634 	ld	(hl),e
   6D76 23            [ 6] 1635 	inc	hl
   6D77 72            [ 7] 1636 	ld	(hl),d
                           1637 ;src/main.c:330: enemy->y = enemy->camino[enemy->iter];
   6D78 DD 6E F5      [19] 1638 	ld	l,-11 (ix)
   6D7B DD 66 F6      [19] 1639 	ld	h,-10 (ix)
   6D7E 19            [11] 1640 	add	hl,de
   6D7F 5E            [ 7] 1641 	ld	e,(hl)
   6D80 E1            [10] 1642 	pop	hl
   6D81 E5            [11] 1643 	push	hl
   6D82 73            [ 7] 1644 	ld	(hl),e
                           1645 ;src/main.c:331: --enemy->iter;
   6D83 DD 7E F9      [19] 1646 	ld	a,-7 (ix)
   6D86 C6 FD         [ 7] 1647 	add	a,#0xFD
   6D88 5F            [ 4] 1648 	ld	e,a
   6D89 DD 7E FA      [19] 1649 	ld	a,-6 (ix)
   6D8C CE FF         [ 7] 1650 	adc	a,#0xFF
   6D8E 57            [ 4] 1651 	ld	d,a
   6D8F DD 6E FB      [19] 1652 	ld	l,-5 (ix)
   6D92 DD 66 FC      [19] 1653 	ld	h,-4 (ix)
   6D95 73            [ 7] 1654 	ld	(hl),e
   6D96 23            [ 6] 1655 	inc	hl
   6D97 72            [ 7] 1656 	ld	(hl),d
                           1657 ;src/main.c:332: enemy->x = enemy->camino[enemy->iter];
   6D98 DD 6E F5      [19] 1658 	ld	l,-11 (ix)
   6D9B DD 66 F6      [19] 1659 	ld	h,-10 (ix)
   6D9E 19            [11] 1660 	add	hl,de
   6D9F 7E            [ 7] 1661 	ld	a,(hl)
   6DA0 02            [ 7] 1662 	ld	(bc),a
                           1663 ;src/main.c:333: --enemy->iter;
   6DA1 DD 7E F9      [19] 1664 	ld	a,-7 (ix)
   6DA4 C6 FC         [ 7] 1665 	add	a,#0xFC
   6DA6 4F            [ 4] 1666 	ld	c,a
   6DA7 DD 7E FA      [19] 1667 	ld	a,-6 (ix)
   6DAA CE FF         [ 7] 1668 	adc	a,#0xFF
   6DAC 47            [ 4] 1669 	ld	b,a
   6DAD DD 6E FB      [19] 1670 	ld	l,-5 (ix)
   6DB0 DD 66 FC      [19] 1671 	ld	h,-4 (ix)
   6DB3 71            [ 7] 1672 	ld	(hl),c
   6DB4 23            [ 6] 1673 	inc	hl
   6DB5 70            [ 7] 1674 	ld	(hl),b
   6DB6 18 5E         [12] 1675 	jr	00118$
   6DB8                    1676 00108$:
                           1677 ;src/main.c:335: enemy->mover = SI;
   6DB8 DD 6E F7      [19] 1678 	ld	l,-9 (ix)
   6DBB DD 66 F8      [19] 1679 	ld	h,-8 (ix)
   6DBE 36 01         [10] 1680 	ld	(hl),#0x01
                           1681 ;src/main.c:336: enemy->y = enemy->camino[enemy->iter];
   6DC0 DD 6E FB      [19] 1682 	ld	l,-5 (ix)
   6DC3 DD 66 FC      [19] 1683 	ld	h,-4 (ix)
   6DC6 5E            [ 7] 1684 	ld	e,(hl)
   6DC7 23            [ 6] 1685 	inc	hl
   6DC8 56            [ 7] 1686 	ld	d,(hl)
   6DC9 DD 6E F5      [19] 1687 	ld	l,-11 (ix)
   6DCC DD 66 F6      [19] 1688 	ld	h,-10 (ix)
   6DCF 19            [11] 1689 	add	hl,de
   6DD0 5E            [ 7] 1690 	ld	e,(hl)
   6DD1 E1            [10] 1691 	pop	hl
   6DD2 E5            [11] 1692 	push	hl
   6DD3 73            [ 7] 1693 	ld	(hl),e
                           1694 ;src/main.c:337: --enemy->iter;
   6DD4 DD 6E FB      [19] 1695 	ld	l,-5 (ix)
   6DD7 DD 66 FC      [19] 1696 	ld	h,-4 (ix)
   6DDA 5E            [ 7] 1697 	ld	e,(hl)
   6DDB 23            [ 6] 1698 	inc	hl
   6DDC 56            [ 7] 1699 	ld	d,(hl)
   6DDD 1B            [ 6] 1700 	dec	de
   6DDE DD 6E FB      [19] 1701 	ld	l,-5 (ix)
   6DE1 DD 66 FC      [19] 1702 	ld	h,-4 (ix)
   6DE4 73            [ 7] 1703 	ld	(hl),e
   6DE5 23            [ 6] 1704 	inc	hl
   6DE6 72            [ 7] 1705 	ld	(hl),d
                           1706 ;src/main.c:338: enemy->x = enemy->camino[enemy->iter];
   6DE7 DD 6E F5      [19] 1707 	ld	l,-11 (ix)
   6DEA DD 66 F6      [19] 1708 	ld	h,-10 (ix)
   6DED 19            [11] 1709 	add	hl,de
   6DEE 7E            [ 7] 1710 	ld	a,(hl)
   6DEF 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:339: --enemy->iter;
   6DF0 1B            [ 6] 1713 	dec	de
   6DF1 DD 6E FB      [19] 1714 	ld	l,-5 (ix)
   6DF4 DD 66 FC      [19] 1715 	ld	h,-4 (ix)
   6DF7 73            [ 7] 1716 	ld	(hl),e
   6DF8 23            [ 6] 1717 	inc	hl
   6DF9 72            [ 7] 1718 	ld	(hl),d
   6DFA 18 1A         [12] 1719 	jr	00118$
   6DFC                    1720 00111$:
                           1721 ;src/main.c:343: enemy->mover = NO;
   6DFC DD 6E F7      [19] 1722 	ld	l,-9 (ix)
   6DFF DD 66 F8      [19] 1723 	ld	h,-8 (ix)
   6E02 36 00         [10] 1724 	ld	(hl),#0x00
                           1725 ;src/main.c:344: enemy->iter = 0;
   6E04 DD 6E FB      [19] 1726 	ld	l,-5 (ix)
   6E07 DD 66 FC      [19] 1727 	ld	h,-4 (ix)
   6E0A AF            [ 4] 1728 	xor	a, a
   6E0B 77            [ 7] 1729 	ld	(hl), a
   6E0C 23            [ 6] 1730 	inc	hl
   6E0D 77            [ 7] 1731 	ld	(hl), a
                           1732 ;src/main.c:345: enemy->reversePatrol = 0;
   6E0E DD 6E FE      [19] 1733 	ld	l,-2 (ix)
   6E11 DD 66 FF      [19] 1734 	ld	h,-1 (ix)
   6E14 36 00         [10] 1735 	ld	(hl),#0x00
   6E16                    1736 00118$:
   6E16 DD F9         [10] 1737 	ld	sp, ix
   6E18 DD E1         [14] 1738 	pop	ix
   6E1A C9            [10] 1739 	ret
                           1740 ;src/main.c:351: void lookFor(TEnemy* enemy){
                           1741 ;	---------------------------------
                           1742 ; Function lookFor
                           1743 ; ---------------------------------
   6E1B                    1744 _lookFor::
   6E1B DD E5         [15] 1745 	push	ix
   6E1D DD 21 00 00   [14] 1746 	ld	ix,#0
   6E21 DD 39         [15] 1747 	add	ix,sp
   6E23 21 F9 FF      [10] 1748 	ld	hl,#-7
   6E26 39            [11] 1749 	add	hl,sp
   6E27 F9            [ 6] 1750 	ld	sp,hl
                           1751 ;src/main.c:357: i16 difx = abs((i16)(enemy->x - prota.x));
   6E28 DD 5E 04      [19] 1752 	ld	e,4 (ix)
   6E2B DD 56 05      [19] 1753 	ld	d,5 (ix)
   6E2E 1A            [ 7] 1754 	ld	a,(de)
   6E2F 4F            [ 4] 1755 	ld	c,a
   6E30 06 00         [ 7] 1756 	ld	b,#0x00
   6E32 21 3D 64      [10] 1757 	ld	hl,#_prota+0
   6E35 6E            [ 7] 1758 	ld	l,(hl)
   6E36 26 00         [ 7] 1759 	ld	h,#0x00
   6E38 79            [ 4] 1760 	ld	a,c
   6E39 95            [ 4] 1761 	sub	a, l
   6E3A 4F            [ 4] 1762 	ld	c,a
   6E3B 78            [ 4] 1763 	ld	a,b
   6E3C 9C            [ 4] 1764 	sbc	a, h
   6E3D 47            [ 4] 1765 	ld	b,a
   6E3E D5            [11] 1766 	push	de
   6E3F C5            [11] 1767 	push	bc
   6E40 CD B5 4B      [17] 1768 	call	_abs
   6E43 F1            [10] 1769 	pop	af
   6E44 D1            [10] 1770 	pop	de
   6E45 DD 75 FA      [19] 1771 	ld	-6 (ix),l
   6E48 DD 74 FB      [19] 1772 	ld	-5 (ix),h
                           1773 ;src/main.c:358: i16 dify = abs((i16)(enemy->y/2 - prota.y/2));
   6E4B 21 01 00      [10] 1774 	ld	hl,#0x0001
   6E4E 19            [11] 1775 	add	hl,de
   6E4F DD 75 FC      [19] 1776 	ld	-4 (ix),l
   6E52 DD 74 FD      [19] 1777 	ld	-3 (ix),h
   6E55 DD 6E FC      [19] 1778 	ld	l,-4 (ix)
   6E58 DD 66 FD      [19] 1779 	ld	h,-3 (ix)
   6E5B 4E            [ 7] 1780 	ld	c,(hl)
   6E5C CB 39         [ 8] 1781 	srl	c
   6E5E 06 00         [ 7] 1782 	ld	b,#0x00
   6E60 21 3E 64      [10] 1783 	ld	hl, #(_prota + 0x0001) + 0
   6E63 6E            [ 7] 1784 	ld	l,(hl)
   6E64 CB 3D         [ 8] 1785 	srl	l
   6E66 26 00         [ 7] 1786 	ld	h,#0x00
   6E68 79            [ 4] 1787 	ld	a,c
   6E69 95            [ 4] 1788 	sub	a, l
   6E6A 4F            [ 4] 1789 	ld	c,a
   6E6B 78            [ 4] 1790 	ld	a,b
   6E6C 9C            [ 4] 1791 	sbc	a, h
   6E6D 47            [ 4] 1792 	ld	b,a
   6E6E D5            [11] 1793 	push	de
   6E6F C5            [11] 1794 	push	bc
   6E70 CD B5 4B      [17] 1795 	call	_abs
   6E73 F1            [10] 1796 	pop	af
   6E74 D1            [10] 1797 	pop	de
                           1798 ;src/main.c:360: dist = difx + dify; // manhattan
   6E75 DD 4E FA      [19] 1799 	ld	c,-6 (ix)
   6E78 09            [11] 1800 	add	hl, bc
   6E79 DD 75 F9      [19] 1801 	ld	-7 (ix),l
                           1802 ;src/main.c:361: enemy->seen = NO;
   6E7C 21 12 00      [10] 1803 	ld	hl,#0x0012
   6E7F 19            [11] 1804 	add	hl,de
   6E80 DD 75 FE      [19] 1805 	ld	-2 (ix),l
   6E83 DD 74 FF      [19] 1806 	ld	-1 (ix),h
   6E86 DD 6E FE      [19] 1807 	ld	l,-2 (ix)
   6E89 DD 66 FF      [19] 1808 	ld	h,-1 (ix)
   6E8C 36 00         [10] 1809 	ld	(hl),#0x00
                           1810 ;src/main.c:362: enemy->in_range = NO;
   6E8E 21 11 00      [10] 1811 	ld	hl,#0x0011
   6E91 19            [11] 1812 	add	hl,de
   6E92 4D            [ 4] 1813 	ld	c,l
   6E93 44            [ 4] 1814 	ld	b,h
   6E94 AF            [ 4] 1815 	xor	a, a
   6E95 02            [ 7] 1816 	ld	(bc),a
                           1817 ;src/main.c:364: if(!enemy->seek){
   6E96 D5            [11] 1818 	push	de
   6E97 FD E1         [14] 1819 	pop	iy
   6E99 FD 7E 14      [19] 1820 	ld	a,20 (iy)
   6E9C B7            [ 4] 1821 	or	a, a
   6E9D C2 23 6F      [10] 1822 	jp	NZ,00111$
                           1823 ;src/main.c:365: if (dist <= 20) {// te detectan los sensores de proximidad
   6EA0 3E 14         [ 7] 1824 	ld	a,#0x14
   6EA2 DD 96 F9      [19] 1825 	sub	a, -7 (ix)
   6EA5 38 13         [12] 1826 	jr	C,00107$
                           1827 ;src/main.c:366: enemy->in_range = 1;
   6EA7 3E 01         [ 7] 1828 	ld	a,#0x01
   6EA9 02            [ 7] 1829 	ld	(bc),a
                           1830 ;src/main.c:367: enemy->engage = 1;
   6EAA 21 16 00      [10] 1831 	ld	hl,#0x0016
   6EAD 19            [11] 1832 	add	hl,de
   6EAE 36 01         [10] 1833 	ld	(hl),#0x01
                           1834 ;src/main.c:368: enemy->seen = SI;
   6EB0 DD 6E FE      [19] 1835 	ld	l,-2 (ix)
   6EB3 DD 66 FF      [19] 1836 	ld	h,-1 (ix)
   6EB6 36 01         [10] 1837 	ld	(hl),#0x01
   6EB8 18 69         [12] 1838 	jr	00111$
   6EBA                    1839 00107$:
                           1840 ;src/main.c:369: }else if(prota.x > enemy->x - 16 && prota.x < enemy->x + 16
   6EBA 21 3D 64      [10] 1841 	ld	hl, #_prota + 0
   6EBD 4E            [ 7] 1842 	ld	c,(hl)
   6EBE 1A            [ 7] 1843 	ld	a,(de)
   6EBF 5F            [ 4] 1844 	ld	e,a
   6EC0 16 00         [ 7] 1845 	ld	d,#0x00
   6EC2 7B            [ 4] 1846 	ld	a,e
   6EC3 C6 F0         [ 7] 1847 	add	a,#0xF0
   6EC5 6F            [ 4] 1848 	ld	l,a
   6EC6 7A            [ 4] 1849 	ld	a,d
   6EC7 CE FF         [ 7] 1850 	adc	a,#0xFF
   6EC9 67            [ 4] 1851 	ld	h,a
   6ECA 06 00         [ 7] 1852 	ld	b,#0x00
   6ECC 7D            [ 4] 1853 	ld	a,l
   6ECD 91            [ 4] 1854 	sub	a, c
   6ECE 7C            [ 4] 1855 	ld	a,h
   6ECF 98            [ 4] 1856 	sbc	a, b
   6ED0 E2 D5 6E      [10] 1857 	jp	PO, 00137$
   6ED3 EE 80         [ 7] 1858 	xor	a, #0x80
   6ED5                    1859 00137$:
   6ED5 F2 23 6F      [10] 1860 	jp	P,00111$
   6ED8 21 10 00      [10] 1861 	ld	hl,#0x0010
   6EDB 19            [11] 1862 	add	hl,de
   6EDC 79            [ 4] 1863 	ld	a,c
   6EDD 95            [ 4] 1864 	sub	a, l
   6EDE 78            [ 4] 1865 	ld	a,b
   6EDF 9C            [ 4] 1866 	sbc	a, h
   6EE0 E2 E5 6E      [10] 1867 	jp	PO, 00138$
   6EE3 EE 80         [ 7] 1868 	xor	a, #0x80
   6EE5                    1869 00138$:
   6EE5 F2 23 6F      [10] 1870 	jp	P,00111$
                           1871 ;src/main.c:370: && prota.y > enemy->y - 16*2 && prota.y < enemy->y +16*2){
   6EE8 21 3E 64      [10] 1872 	ld	hl, #(_prota + 0x0001) + 0
   6EEB 4E            [ 7] 1873 	ld	c,(hl)
   6EEC DD 6E FC      [19] 1874 	ld	l,-4 (ix)
   6EEF DD 66 FD      [19] 1875 	ld	h,-3 (ix)
   6EF2 5E            [ 7] 1876 	ld	e,(hl)
   6EF3 16 00         [ 7] 1877 	ld	d,#0x00
   6EF5 7B            [ 4] 1878 	ld	a,e
   6EF6 C6 E0         [ 7] 1879 	add	a,#0xE0
   6EF8 6F            [ 4] 1880 	ld	l,a
   6EF9 7A            [ 4] 1881 	ld	a,d
   6EFA CE FF         [ 7] 1882 	adc	a,#0xFF
   6EFC 67            [ 4] 1883 	ld	h,a
   6EFD 06 00         [ 7] 1884 	ld	b,#0x00
   6EFF 7D            [ 4] 1885 	ld	a,l
   6F00 91            [ 4] 1886 	sub	a, c
   6F01 7C            [ 4] 1887 	ld	a,h
   6F02 98            [ 4] 1888 	sbc	a, b
   6F03 E2 08 6F      [10] 1889 	jp	PO, 00139$
   6F06 EE 80         [ 7] 1890 	xor	a, #0x80
   6F08                    1891 00139$:
   6F08 F2 23 6F      [10] 1892 	jp	P,00111$
   6F0B 21 20 00      [10] 1893 	ld	hl,#0x0020
   6F0E 19            [11] 1894 	add	hl,de
   6F0F 79            [ 4] 1895 	ld	a,c
   6F10 95            [ 4] 1896 	sub	a, l
   6F11 78            [ 4] 1897 	ld	a,b
   6F12 9C            [ 4] 1898 	sbc	a, h
   6F13 E2 18 6F      [10] 1899 	jp	PO, 00140$
   6F16 EE 80         [ 7] 1900 	xor	a, #0x80
   6F18                    1901 00140$:
   6F18 F2 23 6F      [10] 1902 	jp	P,00111$
                           1903 ;src/main.c:371: enemy->seen = SI;
   6F1B DD 6E FE      [19] 1904 	ld	l,-2 (ix)
   6F1E DD 66 FF      [19] 1905 	ld	h,-1 (ix)
   6F21 36 01         [10] 1906 	ld	(hl),#0x01
   6F23                    1907 00111$:
   6F23 DD F9         [10] 1908 	ld	sp, ix
   6F25 DD E1         [14] 1909 	pop	ix
   6F27 C9            [10] 1910 	ret
                           1911 ;src/main.c:376: void moverEnemigoSeek(TEnemy* actual){
                           1912 ;	---------------------------------
                           1913 ; Function moverEnemigoSeek
                           1914 ; ---------------------------------
   6F28                    1915 _moverEnemigoSeek::
   6F28 DD E5         [15] 1916 	push	ix
   6F2A DD 21 00 00   [14] 1917 	ld	ix,#0
   6F2E DD 39         [15] 1918 	add	ix,sp
   6F30 21 F6 FF      [10] 1919 	ld	hl,#-10
   6F33 39            [11] 1920 	add	hl,sp
   6F34 F9            [ 6] 1921 	ld	sp,hl
                           1922 ;src/main.c:378: if(!actual->muerto){
   6F35 DD 4E 04      [19] 1923 	ld	c,4 (ix)
   6F38 DD 46 05      [19] 1924 	ld	b,5 (ix)
   6F3B C5            [11] 1925 	push	bc
   6F3C FD E1         [14] 1926 	pop	iy
   6F3E FD 7E 08      [19] 1927 	ld	a, 8 (iy)
   6F41 B7            [ 4] 1928 	or	a, a
   6F42 C2 D5 70      [10] 1929 	jp	NZ,00114$
                           1930 ;src/main.c:381: if(actual->iter < actual->longitud_camino){
   6F45 21 0E 00      [10] 1931 	ld	hl,#0x000E
   6F48 09            [11] 1932 	add	hl,bc
   6F49 DD 75 FB      [19] 1933 	ld	-5 (ix),l
   6F4C DD 74 FC      [19] 1934 	ld	-4 (ix),h
   6F4F DD 6E FB      [19] 1935 	ld	l,-5 (ix)
   6F52 DD 66 FC      [19] 1936 	ld	h,-4 (ix)
   6F55 7E            [ 7] 1937 	ld	a,(hl)
   6F56 DD 77 F9      [19] 1938 	ld	-7 (ix),a
   6F59 23            [ 6] 1939 	inc	hl
   6F5A 7E            [ 7] 1940 	ld	a,(hl)
   6F5B DD 77 FA      [19] 1941 	ld	-6 (ix),a
   6F5E 69            [ 4] 1942 	ld	l, c
   6F5F 60            [ 4] 1943 	ld	h, b
   6F60 11 E1 00      [10] 1944 	ld	de, #0x00E1
   6F63 19            [11] 1945 	add	hl, de
   6F64 5E            [ 7] 1946 	ld	e,(hl)
   6F65 16 00         [ 7] 1947 	ld	d,#0x00
                           1948 ;src/main.c:390: actual->y = actual->camino[actual->iter];
   6F67 21 01 00      [10] 1949 	ld	hl,#0x0001
   6F6A 09            [11] 1950 	add	hl,bc
   6F6B DD 75 F7      [19] 1951 	ld	-9 (ix),l
   6F6E DD 74 F8      [19] 1952 	ld	-8 (ix),h
                           1953 ;src/main.c:381: if(actual->iter < actual->longitud_camino){
   6F71 DD 7E F9      [19] 1954 	ld	a,-7 (ix)
   6F74 93            [ 4] 1955 	sub	a, e
   6F75 DD 7E FA      [19] 1956 	ld	a,-6 (ix)
   6F78 9A            [ 4] 1957 	sbc	a, d
   6F79 E2 7E 6F      [10] 1958 	jp	PO, 00136$
   6F7C EE 80         [ 7] 1959 	xor	a, #0x80
   6F7E                    1960 00136$:
   6F7E F2 12 70      [10] 1961 	jp	P,00110$
                           1962 ;src/main.c:386: actual->mover = SI;
   6F81 21 06 00      [10] 1963 	ld	hl,#0x0006
   6F84 09            [11] 1964 	add	hl,bc
                           1965 ;src/main.c:388: actual->x = actual->camino[actual->iter];
   6F85 79            [ 4] 1966 	ld	a,c
   6F86 C6 19         [ 7] 1967 	add	a, #0x19
   6F88 5F            [ 4] 1968 	ld	e,a
   6F89 78            [ 4] 1969 	ld	a,b
   6F8A CE 00         [ 7] 1970 	adc	a, #0x00
   6F8C 57            [ 4] 1971 	ld	d,a
                           1972 ;src/main.c:384: if(actual->iter == 0){
   6F8D DD 7E FA      [19] 1973 	ld	a,-6 (ix)
   6F90 DD B6 F9      [19] 1974 	or	a,-7 (ix)
   6F93 20 44         [12] 1975 	jr	NZ,00102$
                           1976 ;src/main.c:386: actual->mover = SI;
   6F95 36 01         [10] 1977 	ld	(hl),#0x01
                           1978 ;src/main.c:387: actual->iter = 2;
   6F97 DD 6E FB      [19] 1979 	ld	l,-5 (ix)
   6F9A DD 66 FC      [19] 1980 	ld	h,-4 (ix)
   6F9D 36 02         [10] 1981 	ld	(hl),#0x02
   6F9F 23            [ 6] 1982 	inc	hl
   6FA0 36 00         [10] 1983 	ld	(hl),#0x00
                           1984 ;src/main.c:388: actual->x = actual->camino[actual->iter];
   6FA2 DD 6E FB      [19] 1985 	ld	l,-5 (ix)
   6FA5 DD 66 FC      [19] 1986 	ld	h,-4 (ix)
   6FA8 7E            [ 7] 1987 	ld	a, (hl)
   6FA9 23            [ 6] 1988 	inc	hl
   6FAA 66            [ 7] 1989 	ld	h,(hl)
   6FAB 6F            [ 4] 1990 	ld	l,a
   6FAC 19            [11] 1991 	add	hl,de
   6FAD 7E            [ 7] 1992 	ld	a,(hl)
   6FAE 02            [ 7] 1993 	ld	(bc),a
                           1994 ;src/main.c:389: ++actual->iter;
   6FAF DD 6E FB      [19] 1995 	ld	l,-5 (ix)
   6FB2 DD 66 FC      [19] 1996 	ld	h,-4 (ix)
   6FB5 4E            [ 7] 1997 	ld	c,(hl)
   6FB6 23            [ 6] 1998 	inc	hl
   6FB7 46            [ 7] 1999 	ld	b,(hl)
   6FB8 03            [ 6] 2000 	inc	bc
   6FB9 DD 6E FB      [19] 2001 	ld	l,-5 (ix)
   6FBC DD 66 FC      [19] 2002 	ld	h,-4 (ix)
   6FBF 71            [ 7] 2003 	ld	(hl),c
   6FC0 23            [ 6] 2004 	inc	hl
   6FC1 70            [ 7] 2005 	ld	(hl),b
                           2006 ;src/main.c:390: actual->y = actual->camino[actual->iter];
   6FC2 EB            [ 4] 2007 	ex	de,hl
   6FC3 09            [11] 2008 	add	hl,bc
   6FC4 5E            [ 7] 2009 	ld	e,(hl)
   6FC5 DD 6E F7      [19] 2010 	ld	l,-9 (ix)
   6FC8 DD 66 F8      [19] 2011 	ld	h,-8 (ix)
   6FCB 73            [ 7] 2012 	ld	(hl),e
                           2013 ;src/main.c:391: ++actual->iter;
   6FCC 03            [ 6] 2014 	inc	bc
   6FCD DD 6E FB      [19] 2015 	ld	l,-5 (ix)
   6FD0 DD 66 FC      [19] 2016 	ld	h,-4 (ix)
   6FD3 71            [ 7] 2017 	ld	(hl),c
   6FD4 23            [ 6] 2018 	inc	hl
   6FD5 70            [ 7] 2019 	ld	(hl),b
   6FD6 C3 D5 70      [10] 2020 	jp	00114$
   6FD9                    2021 00102$:
                           2022 ;src/main.c:394: actual->mover = SI;
   6FD9 36 01         [10] 2023 	ld	(hl),#0x01
                           2024 ;src/main.c:395: actual->x = actual->camino[actual->iter];
   6FDB DD 6E FB      [19] 2025 	ld	l,-5 (ix)
   6FDE DD 66 FC      [19] 2026 	ld	h,-4 (ix)
   6FE1 7E            [ 7] 2027 	ld	a, (hl)
   6FE2 23            [ 6] 2028 	inc	hl
   6FE3 66            [ 7] 2029 	ld	h,(hl)
   6FE4 6F            [ 4] 2030 	ld	l,a
   6FE5 19            [11] 2031 	add	hl,de
   6FE6 7E            [ 7] 2032 	ld	a,(hl)
   6FE7 02            [ 7] 2033 	ld	(bc),a
                           2034 ;src/main.c:396: ++actual->iter;
   6FE8 DD 6E FB      [19] 2035 	ld	l,-5 (ix)
   6FEB DD 66 FC      [19] 2036 	ld	h,-4 (ix)
   6FEE 4E            [ 7] 2037 	ld	c,(hl)
   6FEF 23            [ 6] 2038 	inc	hl
   6FF0 46            [ 7] 2039 	ld	b,(hl)
   6FF1 03            [ 6] 2040 	inc	bc
   6FF2 DD 6E FB      [19] 2041 	ld	l,-5 (ix)
   6FF5 DD 66 FC      [19] 2042 	ld	h,-4 (ix)
   6FF8 71            [ 7] 2043 	ld	(hl),c
   6FF9 23            [ 6] 2044 	inc	hl
   6FFA 70            [ 7] 2045 	ld	(hl),b
                           2046 ;src/main.c:397: actual->y = actual->camino[actual->iter];
   6FFB EB            [ 4] 2047 	ex	de,hl
   6FFC 09            [11] 2048 	add	hl,bc
   6FFD 5E            [ 7] 2049 	ld	e,(hl)
   6FFE DD 6E F7      [19] 2050 	ld	l,-9 (ix)
   7001 DD 66 F8      [19] 2051 	ld	h,-8 (ix)
   7004 73            [ 7] 2052 	ld	(hl),e
                           2053 ;src/main.c:398: ++actual->iter;
   7005 03            [ 6] 2054 	inc	bc
   7006 DD 6E FB      [19] 2055 	ld	l,-5 (ix)
   7009 DD 66 FC      [19] 2056 	ld	h,-4 (ix)
   700C 71            [ 7] 2057 	ld	(hl),c
   700D 23            [ 6] 2058 	inc	hl
   700E 70            [ 7] 2059 	ld	(hl),b
   700F C3 D5 70      [10] 2060 	jp	00114$
   7012                    2061 00110$:
                           2062 ;src/main.c:404: actual->seek = 0;
   7012 21 14 00      [10] 2063 	ld	hl,#0x0014
   7015 09            [11] 2064 	add	hl,bc
   7016 DD 75 F9      [19] 2065 	ld	-7 (ix),l
   7019 DD 74 FA      [19] 2066 	ld	-6 (ix),h
   701C DD 6E F9      [19] 2067 	ld	l,-7 (ix)
   701F DD 66 FA      [19] 2068 	ld	h,-6 (ix)
   7022 36 00         [10] 2069 	ld	(hl),#0x00
                           2070 ;src/main.c:405: lookFor(actual);
   7024 C5            [11] 2071 	push	bc
   7025 C5            [11] 2072 	push	bc
   7026 CD 1B 6E      [17] 2073 	call	_lookFor
   7029 F1            [10] 2074 	pop	af
   702A C1            [10] 2075 	pop	bc
                           2076 ;src/main.c:406: if(!actual->seen){
   702B 69            [ 4] 2077 	ld	l, c
   702C 60            [ 4] 2078 	ld	h, b
   702D 11 12 00      [10] 2079 	ld	de, #0x0012
   7030 19            [11] 2080 	add	hl, de
   7031 7E            [ 7] 2081 	ld	a,(hl)
   7032 DD 77 F6      [19] 2082 	ld	-10 (ix),a
                           2083 ;src/main.c:407: actual->patrolling = 1;
   7035 21 0B 00      [10] 2084 	ld	hl,#0x000B
   7038 09            [11] 2085 	add	hl,bc
   7039 DD 75 FE      [19] 2086 	ld	-2 (ix),l
   703C DD 74 FF      [19] 2087 	ld	-1 (ix),h
                           2088 ;src/main.c:406: if(!actual->seen){
   703F DD 7E F6      [19] 2089 	ld	a,-10 (ix)
   7042 B7            [ 4] 2090 	or	a, a
   7043 20 3C         [12] 2091 	jr	NZ,00107$
                           2092 ;src/main.c:407: actual->patrolling = 1;
   7045 DD 6E FE      [19] 2093 	ld	l,-2 (ix)
   7048 DD 66 FF      [19] 2094 	ld	h,-1 (ix)
   704B 36 01         [10] 2095 	ld	(hl),#0x01
                           2096 ;src/main.c:408: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   704D C5            [11] 2097 	push	bc
   704E FD E1         [14] 2098 	pop	iy
   7050 FD 7E 18      [19] 2099 	ld	a,24 (iy)
   7053 DD 77 F6      [19] 2100 	ld	-10 (ix),a
   7056 C5            [11] 2101 	push	bc
   7057 FD E1         [14] 2102 	pop	iy
   7059 FD 56 17      [19] 2103 	ld	d,23 (iy)
   705C DD 6E F7      [19] 2104 	ld	l,-9 (ix)
   705F DD 66 F8      [19] 2105 	ld	h,-8 (ix)
   7062 5E            [ 7] 2106 	ld	e,(hl)
   7063 0A            [ 7] 2107 	ld	a,(bc)
   7064 DD 77 FD      [19] 2108 	ld	-3 (ix),a
   7067 2A 50 64      [16] 2109 	ld	hl,(_mapa)
   706A E5            [11] 2110 	push	hl
   706B C5            [11] 2111 	push	bc
   706C DD 7E F6      [19] 2112 	ld	a,-10 (ix)
   706F F5            [11] 2113 	push	af
   7070 33            [ 6] 2114 	inc	sp
   7071 D5            [11] 2115 	push	de
   7072 DD 7E FD      [19] 2116 	ld	a,-3 (ix)
   7075 F5            [11] 2117 	push	af
   7076 33            [ 6] 2118 	inc	sp
   7077 CD 72 49      [17] 2119 	call	_pathFinding
   707A 21 08 00      [10] 2120 	ld	hl,#8
   707D 39            [11] 2121 	add	hl,sp
   707E F9            [ 6] 2122 	ld	sp,hl
   707F 18 4A         [12] 2123 	jr	00108$
   7081                    2124 00107$:
                           2125 ;src/main.c:410: actual->patrolling = 0;
   7081 DD 6E FE      [19] 2126 	ld	l,-2 (ix)
   7084 DD 66 FF      [19] 2127 	ld	h,-1 (ix)
   7087 36 00         [10] 2128 	ld	(hl),#0x00
                           2129 ;src/main.c:411: if(!actual->engage){
   7089 C5            [11] 2130 	push	bc
   708A FD E1         [14] 2131 	pop	iy
   708C FD 7E 16      [19] 2132 	ld	a,22 (iy)
   708F B7            [ 4] 2133 	or	a, a
   7090 20 39         [12] 2134 	jr	NZ,00108$
                           2135 ;src/main.c:412: actual->seek = 1;
   7092 DD 6E F9      [19] 2136 	ld	l,-7 (ix)
   7095 DD 66 FA      [19] 2137 	ld	h,-6 (ix)
   7098 36 01         [10] 2138 	ld	(hl),#0x01
                           2139 ;src/main.c:413: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   709A 3A 3E 64      [13] 2140 	ld	a,(#_prota + 1)
   709D DD 77 FD      [19] 2141 	ld	-3 (ix),a
   70A0 21 3D 64      [10] 2142 	ld	hl, #_prota + 0
   70A3 5E            [ 7] 2143 	ld	e,(hl)
   70A4 DD 6E F7      [19] 2144 	ld	l,-9 (ix)
   70A7 DD 66 F8      [19] 2145 	ld	h,-8 (ix)
   70AA 56            [ 7] 2146 	ld	d,(hl)
   70AB 0A            [ 7] 2147 	ld	a,(bc)
   70AC DD 77 FE      [19] 2148 	ld	-2 (ix),a
   70AF 2A 50 64      [16] 2149 	ld	hl,(_mapa)
   70B2 E5            [11] 2150 	push	hl
   70B3 C5            [11] 2151 	push	bc
   70B4 DD 7E FD      [19] 2152 	ld	a,-3 (ix)
   70B7 F5            [11] 2153 	push	af
   70B8 33            [ 6] 2154 	inc	sp
   70B9 7B            [ 4] 2155 	ld	a,e
   70BA F5            [11] 2156 	push	af
   70BB 33            [ 6] 2157 	inc	sp
   70BC D5            [11] 2158 	push	de
   70BD 33            [ 6] 2159 	inc	sp
   70BE DD 7E FE      [19] 2160 	ld	a,-2 (ix)
   70C1 F5            [11] 2161 	push	af
   70C2 33            [ 6] 2162 	inc	sp
   70C3 CD 72 49      [17] 2163 	call	_pathFinding
   70C6 21 08 00      [10] 2164 	ld	hl,#8
   70C9 39            [11] 2165 	add	hl,sp
   70CA F9            [ 6] 2166 	ld	sp,hl
   70CB                    2167 00108$:
                           2168 ;src/main.c:416: actual->iter = 0;
   70CB DD 6E FB      [19] 2169 	ld	l,-5 (ix)
   70CE DD 66 FC      [19] 2170 	ld	h,-4 (ix)
   70D1 AF            [ 4] 2171 	xor	a, a
   70D2 77            [ 7] 2172 	ld	(hl), a
   70D3 23            [ 6] 2173 	inc	hl
   70D4 77            [ 7] 2174 	ld	(hl), a
   70D5                    2175 00114$:
   70D5 DD F9         [10] 2176 	ld	sp, ix
   70D7 DD E1         [14] 2177 	pop	ix
   70D9 C9            [10] 2178 	ret
                           2179 ;src/main.c:423: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2180 ;	---------------------------------
                           2181 ; Function engage
                           2182 ; ---------------------------------
   70DA                    2183 _engage::
   70DA DD E5         [15] 2184 	push	ix
   70DC DD 21 00 00   [14] 2185 	ld	ix,#0
   70E0 DD 39         [15] 2186 	add	ix,sp
   70E2 21 F1 FF      [10] 2187 	ld	hl,#-15
   70E5 39            [11] 2188 	add	hl,sp
   70E6 F9            [ 6] 2189 	ld	sp,hl
                           2190 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70E7 DD 7E 04      [19] 2191 	ld	a,4 (ix)
   70EA DD 77 F4      [19] 2192 	ld	-12 (ix),a
   70ED DD 7E 05      [19] 2193 	ld	a,5 (ix)
   70F0 DD 77 F5      [19] 2194 	ld	-11 (ix),a
   70F3 DD 6E F4      [19] 2195 	ld	l,-12 (ix)
   70F6 DD 66 F5      [19] 2196 	ld	h,-11 (ix)
   70F9 4E            [ 7] 2197 	ld	c,(hl)
   70FA 06 00         [ 7] 2198 	ld	b,#0x00
   70FC 21 3D 64      [10] 2199 	ld	hl,#_prota+0
   70FF 5E            [ 7] 2200 	ld	e,(hl)
   7100 16 00         [ 7] 2201 	ld	d,#0x00
   7102 79            [ 4] 2202 	ld	a,c
   7103 93            [ 4] 2203 	sub	a, e
   7104 4F            [ 4] 2204 	ld	c,a
   7105 78            [ 4] 2205 	ld	a,b
   7106 9A            [ 4] 2206 	sbc	a, d
   7107 47            [ 4] 2207 	ld	b,a
   7108 C5            [11] 2208 	push	bc
   7109 CD B5 4B      [17] 2209 	call	_abs
   710C F1            [10] 2210 	pop	af
   710D 4D            [ 4] 2211 	ld	c,l
                           2212 ;src/main.c:425: u8 dify = abs(enemy->y - prota.y);
   710E DD 7E F4      [19] 2213 	ld	a,-12 (ix)
   7111 C6 01         [ 7] 2214 	add	a, #0x01
   7113 DD 77 F6      [19] 2215 	ld	-10 (ix),a
   7116 DD 7E F5      [19] 2216 	ld	a,-11 (ix)
   7119 CE 00         [ 7] 2217 	adc	a, #0x00
   711B DD 77 F7      [19] 2218 	ld	-9 (ix),a
   711E DD 6E F6      [19] 2219 	ld	l,-10 (ix)
   7121 DD 66 F7      [19] 2220 	ld	h,-9 (ix)
   7124 5E            [ 7] 2221 	ld	e,(hl)
   7125 16 00         [ 7] 2222 	ld	d,#0x00
   7127 21 3E 64      [10] 2223 	ld	hl, #_prota + 1
   712A 6E            [ 7] 2224 	ld	l,(hl)
   712B 26 00         [ 7] 2225 	ld	h,#0x00
   712D 7B            [ 4] 2226 	ld	a,e
   712E 95            [ 4] 2227 	sub	a, l
   712F 5F            [ 4] 2228 	ld	e,a
   7130 7A            [ 4] 2229 	ld	a,d
   7131 9C            [ 4] 2230 	sbc	a, h
   7132 57            [ 4] 2231 	ld	d,a
   7133 C5            [11] 2232 	push	bc
   7134 D5            [11] 2233 	push	de
   7135 CD B5 4B      [17] 2234 	call	_abs
   7138 F1            [10] 2235 	pop	af
   7139 C1            [10] 2236 	pop	bc
                           2237 ;src/main.c:426: u8 dist = difx + dify; // manhattan
   713A 09            [11] 2238 	add	hl, bc
   713B DD 75 F1      [19] 2239 	ld	-15 (ix),l
                           2240 ;src/main.c:428: u8 movX = 0;
   713E DD 36 F2 00   [19] 2241 	ld	-14 (ix),#0x00
                           2242 ;src/main.c:429: u8 movY = 0;
   7142 DD 36 F3 00   [19] 2243 	ld	-13 (ix),#0x00
                           2244 ;src/main.c:430: u8 distConstraint = 25;
   7146 0E 19         [ 7] 2245 	ld	c,#0x19
                           2246 ;src/main.c:431: enemy->mover = NO;
   7148 DD 7E F4      [19] 2247 	ld	a,-12 (ix)
   714B C6 06         [ 7] 2248 	add	a, #0x06
   714D DD 77 F8      [19] 2249 	ld	-8 (ix),a
   7150 DD 7E F5      [19] 2250 	ld	a,-11 (ix)
   7153 CE 00         [ 7] 2251 	adc	a, #0x00
   7155 DD 77 F9      [19] 2252 	ld	-7 (ix),a
   7158 DD 6E F8      [19] 2253 	ld	l,-8 (ix)
   715B DD 66 F9      [19] 2254 	ld	h,-7 (ix)
   715E 36 00         [10] 2255 	ld	(hl),#0x00
                           2256 ;src/main.c:433: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7160 DD 6E F6      [19] 2257 	ld	l,-10 (ix)
   7163 DD 66 F7      [19] 2258 	ld	h,-9 (ix)
   7166 7E            [ 7] 2259 	ld	a,(hl)
   7167 DD 77 FA      [19] 2260 	ld	-6 (ix),a
                           2261 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   716A DD 6E F4      [19] 2262 	ld	l,-12 (ix)
   716D DD 66 F5      [19] 2263 	ld	h,-11 (ix)
   7170 46            [ 7] 2264 	ld	b,(hl)
                           2265 ;src/main.c:446: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7171 78            [ 4] 2266 	ld	a,b
   7172 C6 04         [ 7] 2267 	add	a, #0x04
   7174 DD 77 FB      [19] 2268 	ld	-5 (ix),a
                           2269 ;src/main.c:433: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7177 DD 7E 07      [19] 2270 	ld	a,7 (ix)
   717A DD 96 FA      [19] 2271 	sub	a, -6 (ix)
   717D 28 38         [12] 2272 	jr	Z,00194$
   717F DD 5E 07      [19] 2273 	ld	e,7 (ix)
   7182 16 00         [ 7] 2274 	ld	d,#0x00
   7184 21 01 00      [10] 2275 	ld	hl,#0x0001
   7187 19            [11] 2276 	add	hl,de
   7188 DD 75 FC      [19] 2277 	ld	-4 (ix),l
   718B DD 74 FD      [19] 2278 	ld	-3 (ix),h
   718E DD 7E FA      [19] 2279 	ld	a,-6 (ix)
   7191 DD 77 FE      [19] 2280 	ld	-2 (ix),a
   7194 DD 36 FF 00   [19] 2281 	ld	-1 (ix),#0x00
   7198 DD 7E FE      [19] 2282 	ld	a,-2 (ix)
   719B DD 96 FC      [19] 2283 	sub	a, -4 (ix)
   719E 20 08         [12] 2284 	jr	NZ,00422$
   71A0 DD 7E FF      [19] 2285 	ld	a,-1 (ix)
   71A3 DD 96 FD      [19] 2286 	sub	a, -3 (ix)
   71A6 28 0F         [12] 2287 	jr	Z,00194$
   71A8                    2288 00422$:
   71A8 1B            [ 6] 2289 	dec	de
   71A9 DD 7E FE      [19] 2290 	ld	a,-2 (ix)
   71AC 93            [ 4] 2291 	sub	a, e
   71AD C2 C0 72      [10] 2292 	jp	NZ,00195$
   71B0 DD 7E FF      [19] 2293 	ld	a,-1 (ix)
   71B3 92            [ 4] 2294 	sub	a, d
   71B4 C2 C0 72      [10] 2295 	jp	NZ,00195$
   71B7                    2296 00194$:
                           2297 ;src/main.c:434: if (dx < enemy->x) { // izquierda
   71B7 DD 7E 06      [19] 2298 	ld	a,6 (ix)
   71BA 90            [ 4] 2299 	sub	a, b
   71BB D2 3D 72      [10] 2300 	jp	NC,00114$
                           2301 ;src/main.c:435: if (dist > 11) {
   71BE 3E 0B         [ 7] 2302 	ld	a,#0x0B
   71C0 DD 96 F1      [19] 2303 	sub	a, -15 (ix)
   71C3 D2 80 78      [10] 2304 	jp	NC,00199$
                           2305 ;src/main.c:436: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   71C6 DD 7E FA      [19] 2306 	ld	a,-6 (ix)
   71C9 F5            [11] 2307 	push	af
   71CA 33            [ 6] 2308 	inc	sp
   71CB C5            [11] 2309 	push	bc
   71CC 33            [ 6] 2310 	inc	sp
   71CD 2A 50 64      [16] 2311 	ld	hl,(_mapa)
   71D0 E5            [11] 2312 	push	hl
   71D1 CD 71 4B      [17] 2313 	call	_getTilePtr
   71D4 F1            [10] 2314 	pop	af
   71D5 F1            [10] 2315 	pop	af
   71D6 4E            [ 7] 2316 	ld	c,(hl)
   71D7 3E 02         [ 7] 2317 	ld	a,#0x02
   71D9 91            [ 4] 2318 	sub	a, c
   71DA DA 80 78      [10] 2319 	jp	C,00199$
                           2320 ;src/main.c:437: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   71DD DD 6E F6      [19] 2321 	ld	l,-10 (ix)
   71E0 DD 66 F7      [19] 2322 	ld	h,-9 (ix)
   71E3 7E            [ 7] 2323 	ld	a,(hl)
   71E4 C6 0B         [ 7] 2324 	add	a, #0x0B
   71E6 57            [ 4] 2325 	ld	d,a
   71E7 DD 6E F4      [19] 2326 	ld	l,-12 (ix)
   71EA DD 66 F5      [19] 2327 	ld	h,-11 (ix)
   71ED 46            [ 7] 2328 	ld	b,(hl)
   71EE D5            [11] 2329 	push	de
   71EF 33            [ 6] 2330 	inc	sp
   71F0 C5            [11] 2331 	push	bc
   71F1 33            [ 6] 2332 	inc	sp
   71F2 2A 50 64      [16] 2333 	ld	hl,(_mapa)
   71F5 E5            [11] 2334 	push	hl
   71F6 CD 71 4B      [17] 2335 	call	_getTilePtr
   71F9 F1            [10] 2336 	pop	af
   71FA F1            [10] 2337 	pop	af
   71FB 4E            [ 7] 2338 	ld	c,(hl)
   71FC 3E 02         [ 7] 2339 	ld	a,#0x02
   71FE 91            [ 4] 2340 	sub	a, c
   71FF DA 80 78      [10] 2341 	jp	C,00199$
                           2342 ;src/main.c:438: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7202 DD 6E F6      [19] 2343 	ld	l,-10 (ix)
   7205 DD 66 F7      [19] 2344 	ld	h,-9 (ix)
   7208 7E            [ 7] 2345 	ld	a,(hl)
   7209 C6 16         [ 7] 2346 	add	a, #0x16
   720B 57            [ 4] 2347 	ld	d,a
   720C DD 6E F4      [19] 2348 	ld	l,-12 (ix)
   720F DD 66 F5      [19] 2349 	ld	h,-11 (ix)
   7212 46            [ 7] 2350 	ld	b,(hl)
   7213 D5            [11] 2351 	push	de
   7214 33            [ 6] 2352 	inc	sp
   7215 C5            [11] 2353 	push	bc
   7216 33            [ 6] 2354 	inc	sp
   7217 2A 50 64      [16] 2355 	ld	hl,(_mapa)
   721A E5            [11] 2356 	push	hl
   721B CD 71 4B      [17] 2357 	call	_getTilePtr
   721E F1            [10] 2358 	pop	af
   721F F1            [10] 2359 	pop	af
   7220 4E            [ 7] 2360 	ld	c,(hl)
   7221 3E 02         [ 7] 2361 	ld	a,#0x02
   7223 91            [ 4] 2362 	sub	a, c
   7224 DA 80 78      [10] 2363 	jp	C,00199$
                           2364 ;src/main.c:439: moverEnemigoIzquierda(enemy);
   7227 DD 6E F4      [19] 2365 	ld	l,-12 (ix)
   722A DD 66 F5      [19] 2366 	ld	h,-11 (ix)
   722D E5            [11] 2367 	push	hl
   722E CD C0 6B      [17] 2368 	call	_moverEnemigoIzquierda
   7231 F1            [10] 2369 	pop	af
                           2370 ;src/main.c:441: enemy->mover = SI;
   7232 DD 6E F8      [19] 2371 	ld	l,-8 (ix)
   7235 DD 66 F9      [19] 2372 	ld	h,-7 (ix)
   7238 36 01         [10] 2373 	ld	(hl),#0x01
   723A C3 80 78      [10] 2374 	jp	00199$
   723D                    2375 00114$:
                           2376 ;src/main.c:445: if (dist > G_ENEMY_W + 3) {
   723D 3E 07         [ 7] 2377 	ld	a,#0x07
   723F DD 96 F1      [19] 2378 	sub	a, -15 (ix)
   7242 D2 80 78      [10] 2379 	jp	NC,00199$
                           2380 ;src/main.c:446: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7245 DD 66 FA      [19] 2381 	ld	h,-6 (ix)
   7248 DD 6E FB      [19] 2382 	ld	l,-5 (ix)
   724B E5            [11] 2383 	push	hl
   724C 2A 50 64      [16] 2384 	ld	hl,(_mapa)
   724F E5            [11] 2385 	push	hl
   7250 CD 71 4B      [17] 2386 	call	_getTilePtr
   7253 F1            [10] 2387 	pop	af
   7254 F1            [10] 2388 	pop	af
   7255 4E            [ 7] 2389 	ld	c,(hl)
   7256 3E 02         [ 7] 2390 	ld	a,#0x02
   7258 91            [ 4] 2391 	sub	a, c
   7259 DA 80 78      [10] 2392 	jp	C,00199$
                           2393 ;src/main.c:447: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   725C DD 6E F6      [19] 2394 	ld	l,-10 (ix)
   725F DD 66 F7      [19] 2395 	ld	h,-9 (ix)
   7262 7E            [ 7] 2396 	ld	a,(hl)
   7263 C6 0B         [ 7] 2397 	add	a, #0x0B
   7265 47            [ 4] 2398 	ld	b,a
   7266 DD 6E F4      [19] 2399 	ld	l,-12 (ix)
   7269 DD 66 F5      [19] 2400 	ld	h,-11 (ix)
   726C 7E            [ 7] 2401 	ld	a,(hl)
   726D C6 04         [ 7] 2402 	add	a, #0x04
   726F C5            [11] 2403 	push	bc
   7270 33            [ 6] 2404 	inc	sp
   7271 F5            [11] 2405 	push	af
   7272 33            [ 6] 2406 	inc	sp
   7273 2A 50 64      [16] 2407 	ld	hl,(_mapa)
   7276 E5            [11] 2408 	push	hl
   7277 CD 71 4B      [17] 2409 	call	_getTilePtr
   727A F1            [10] 2410 	pop	af
   727B F1            [10] 2411 	pop	af
   727C 4E            [ 7] 2412 	ld	c,(hl)
   727D 3E 02         [ 7] 2413 	ld	a,#0x02
   727F 91            [ 4] 2414 	sub	a, c
   7280 DA 80 78      [10] 2415 	jp	C,00199$
                           2416 ;src/main.c:448: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7283 DD 6E F6      [19] 2417 	ld	l,-10 (ix)
   7286 DD 66 F7      [19] 2418 	ld	h,-9 (ix)
   7289 7E            [ 7] 2419 	ld	a,(hl)
   728A C6 16         [ 7] 2420 	add	a, #0x16
   728C 47            [ 4] 2421 	ld	b,a
   728D DD 6E F4      [19] 2422 	ld	l,-12 (ix)
   7290 DD 66 F5      [19] 2423 	ld	h,-11 (ix)
   7293 7E            [ 7] 2424 	ld	a,(hl)
   7294 C6 04         [ 7] 2425 	add	a, #0x04
   7296 C5            [11] 2426 	push	bc
   7297 33            [ 6] 2427 	inc	sp
   7298 F5            [11] 2428 	push	af
   7299 33            [ 6] 2429 	inc	sp
   729A 2A 50 64      [16] 2430 	ld	hl,(_mapa)
   729D E5            [11] 2431 	push	hl
   729E CD 71 4B      [17] 2432 	call	_getTilePtr
   72A1 F1            [10] 2433 	pop	af
   72A2 F1            [10] 2434 	pop	af
   72A3 4E            [ 7] 2435 	ld	c,(hl)
   72A4 3E 02         [ 7] 2436 	ld	a,#0x02
   72A6 91            [ 4] 2437 	sub	a, c
   72A7 DA 80 78      [10] 2438 	jp	C,00199$
                           2439 ;src/main.c:449: moverEnemigoDerecha(enemy);
   72AA DD 6E F4      [19] 2440 	ld	l,-12 (ix)
   72AD DD 66 F5      [19] 2441 	ld	h,-11 (ix)
   72B0 E5            [11] 2442 	push	hl
   72B1 CD B0 6B      [17] 2443 	call	_moverEnemigoDerecha
   72B4 F1            [10] 2444 	pop	af
                           2445 ;src/main.c:451: enemy->mover = SI;
   72B5 DD 6E F8      [19] 2446 	ld	l,-8 (ix)
   72B8 DD 66 F9      [19] 2447 	ld	h,-7 (ix)
   72BB 36 01         [10] 2448 	ld	(hl),#0x01
   72BD C3 80 78      [10] 2449 	jp	00199$
   72C0                    2450 00195$:
                           2451 ;src/main.c:456: else if (enemy->x == dx) {
   72C0 DD 7E 06      [19] 2452 	ld	a,6 (ix)
   72C3 90            [ 4] 2453 	sub	a, b
   72C4 C2 D9 73      [10] 2454 	jp	NZ,00192$
                           2455 ;src/main.c:457: if (dy < enemy->y) {
   72C7 DD 7E 07      [19] 2456 	ld	a,7 (ix)
   72CA DD 96 FA      [19] 2457 	sub	a, -6 (ix)
   72CD D2 53 73      [10] 2458 	jp	NC,00129$
                           2459 ;src/main.c:458: if (dist > G_HERO_H + 5) {
   72D0 3E 1B         [ 7] 2460 	ld	a,#0x1B
   72D2 DD 96 F1      [19] 2461 	sub	a, -15 (ix)
   72D5 D2 80 78      [10] 2462 	jp	NC,00199$
                           2463 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   72D8 DD 56 FA      [19] 2464 	ld	d,-6 (ix)
   72DB 15            [ 4] 2465 	dec	d
   72DC 15            [ 4] 2466 	dec	d
   72DD D5            [11] 2467 	push	de
   72DE 33            [ 6] 2468 	inc	sp
   72DF C5            [11] 2469 	push	bc
   72E0 33            [ 6] 2470 	inc	sp
   72E1 2A 50 64      [16] 2471 	ld	hl,(_mapa)
   72E4 E5            [11] 2472 	push	hl
   72E5 CD 71 4B      [17] 2473 	call	_getTilePtr
   72E8 F1            [10] 2474 	pop	af
   72E9 F1            [10] 2475 	pop	af
   72EA 4E            [ 7] 2476 	ld	c,(hl)
   72EB 3E 02         [ 7] 2477 	ld	a,#0x02
   72ED 91            [ 4] 2478 	sub	a, c
   72EE DA 80 78      [10] 2479 	jp	C,00199$
                           2480 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   72F1 DD 6E F6      [19] 2481 	ld	l,-10 (ix)
   72F4 DD 66 F7      [19] 2482 	ld	h,-9 (ix)
   72F7 56            [ 7] 2483 	ld	d,(hl)
   72F8 15            [ 4] 2484 	dec	d
   72F9 15            [ 4] 2485 	dec	d
   72FA DD 6E F4      [19] 2486 	ld	l,-12 (ix)
   72FD DD 66 F5      [19] 2487 	ld	h,-11 (ix)
   7300 46            [ 7] 2488 	ld	b,(hl)
   7301 04            [ 4] 2489 	inc	b
   7302 04            [ 4] 2490 	inc	b
   7303 D5            [11] 2491 	push	de
   7304 33            [ 6] 2492 	inc	sp
   7305 C5            [11] 2493 	push	bc
   7306 33            [ 6] 2494 	inc	sp
   7307 2A 50 64      [16] 2495 	ld	hl,(_mapa)
   730A E5            [11] 2496 	push	hl
   730B CD 71 4B      [17] 2497 	call	_getTilePtr
   730E F1            [10] 2498 	pop	af
   730F F1            [10] 2499 	pop	af
   7310 4E            [ 7] 2500 	ld	c,(hl)
   7311 3E 02         [ 7] 2501 	ld	a,#0x02
   7313 91            [ 4] 2502 	sub	a, c
   7314 DA 80 78      [10] 2503 	jp	C,00199$
                           2504 ;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7317 DD 6E F6      [19] 2505 	ld	l,-10 (ix)
   731A DD 66 F7      [19] 2506 	ld	h,-9 (ix)
   731D 46            [ 7] 2507 	ld	b,(hl)
   731E 05            [ 4] 2508 	dec	b
   731F 05            [ 4] 2509 	dec	b
   7320 DD 6E F4      [19] 2510 	ld	l,-12 (ix)
   7323 DD 66 F5      [19] 2511 	ld	h,-11 (ix)
   7326 7E            [ 7] 2512 	ld	a,(hl)
   7327 C6 04         [ 7] 2513 	add	a, #0x04
   7329 C5            [11] 2514 	push	bc
   732A 33            [ 6] 2515 	inc	sp
   732B F5            [11] 2516 	push	af
   732C 33            [ 6] 2517 	inc	sp
   732D 2A 50 64      [16] 2518 	ld	hl,(_mapa)
   7330 E5            [11] 2519 	push	hl
   7331 CD 71 4B      [17] 2520 	call	_getTilePtr
   7334 F1            [10] 2521 	pop	af
   7335 F1            [10] 2522 	pop	af
   7336 4E            [ 7] 2523 	ld	c,(hl)
   7337 3E 02         [ 7] 2524 	ld	a,#0x02
   7339 91            [ 4] 2525 	sub	a, c
   733A DA 80 78      [10] 2526 	jp	C,00199$
                           2527 ;src/main.c:462: moverEnemigoArriba(enemy);
   733D DD 6E F4      [19] 2528 	ld	l,-12 (ix)
   7340 DD 66 F5      [19] 2529 	ld	h,-11 (ix)
   7343 E5            [11] 2530 	push	hl
   7344 CD 72 6B      [17] 2531 	call	_moverEnemigoArriba
   7347 F1            [10] 2532 	pop	af
                           2533 ;src/main.c:464: enemy->mover = SI;
   7348 DD 6E F8      [19] 2534 	ld	l,-8 (ix)
   734B DD 66 F9      [19] 2535 	ld	h,-7 (ix)
   734E 36 01         [10] 2536 	ld	(hl),#0x01
   7350 C3 80 78      [10] 2537 	jp	00199$
   7353                    2538 00129$:
                           2539 ;src/main.c:468: if(dist > G_ENEMY_H + 7) {
   7353 3E 1D         [ 7] 2540 	ld	a,#0x1D
   7355 DD 96 F1      [19] 2541 	sub	a, -15 (ix)
   7358 D2 80 78      [10] 2542 	jp	NC,00199$
                           2543 ;src/main.c:469: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   735B DD 7E FA      [19] 2544 	ld	a,-6 (ix)
   735E C6 18         [ 7] 2545 	add	a, #0x18
   7360 57            [ 4] 2546 	ld	d,a
   7361 D5            [11] 2547 	push	de
   7362 33            [ 6] 2548 	inc	sp
   7363 C5            [11] 2549 	push	bc
   7364 33            [ 6] 2550 	inc	sp
   7365 2A 50 64      [16] 2551 	ld	hl,(_mapa)
   7368 E5            [11] 2552 	push	hl
   7369 CD 71 4B      [17] 2553 	call	_getTilePtr
   736C F1            [10] 2554 	pop	af
   736D F1            [10] 2555 	pop	af
   736E 4E            [ 7] 2556 	ld	c,(hl)
   736F 3E 02         [ 7] 2557 	ld	a,#0x02
   7371 91            [ 4] 2558 	sub	a, c
   7372 DA 80 78      [10] 2559 	jp	C,00199$
                           2560 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7375 DD 6E F6      [19] 2561 	ld	l,-10 (ix)
   7378 DD 66 F7      [19] 2562 	ld	h,-9 (ix)
   737B 7E            [ 7] 2563 	ld	a,(hl)
   737C C6 18         [ 7] 2564 	add	a, #0x18
   737E 57            [ 4] 2565 	ld	d,a
   737F DD 6E F4      [19] 2566 	ld	l,-12 (ix)
   7382 DD 66 F5      [19] 2567 	ld	h,-11 (ix)
   7385 46            [ 7] 2568 	ld	b,(hl)
   7386 04            [ 4] 2569 	inc	b
   7387 04            [ 4] 2570 	inc	b
   7388 D5            [11] 2571 	push	de
   7389 33            [ 6] 2572 	inc	sp
   738A C5            [11] 2573 	push	bc
   738B 33            [ 6] 2574 	inc	sp
   738C 2A 50 64      [16] 2575 	ld	hl,(_mapa)
   738F E5            [11] 2576 	push	hl
   7390 CD 71 4B      [17] 2577 	call	_getTilePtr
   7393 F1            [10] 2578 	pop	af
   7394 F1            [10] 2579 	pop	af
   7395 4E            [ 7] 2580 	ld	c,(hl)
   7396 3E 02         [ 7] 2581 	ld	a,#0x02
   7398 91            [ 4] 2582 	sub	a, c
   7399 DA 80 78      [10] 2583 	jp	C,00199$
                           2584 ;src/main.c:471: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   739C DD 6E F6      [19] 2585 	ld	l,-10 (ix)
   739F DD 66 F7      [19] 2586 	ld	h,-9 (ix)
   73A2 7E            [ 7] 2587 	ld	a,(hl)
   73A3 C6 18         [ 7] 2588 	add	a, #0x18
   73A5 47            [ 4] 2589 	ld	b,a
   73A6 DD 6E F4      [19] 2590 	ld	l,-12 (ix)
   73A9 DD 66 F5      [19] 2591 	ld	h,-11 (ix)
   73AC 7E            [ 7] 2592 	ld	a,(hl)
   73AD C6 04         [ 7] 2593 	add	a, #0x04
   73AF C5            [11] 2594 	push	bc
   73B0 33            [ 6] 2595 	inc	sp
   73B1 F5            [11] 2596 	push	af
   73B2 33            [ 6] 2597 	inc	sp
   73B3 2A 50 64      [16] 2598 	ld	hl,(_mapa)
   73B6 E5            [11] 2599 	push	hl
   73B7 CD 71 4B      [17] 2600 	call	_getTilePtr
   73BA F1            [10] 2601 	pop	af
   73BB F1            [10] 2602 	pop	af
   73BC 4E            [ 7] 2603 	ld	c,(hl)
   73BD 3E 02         [ 7] 2604 	ld	a,#0x02
   73BF 91            [ 4] 2605 	sub	a, c
   73C0 DA 80 78      [10] 2606 	jp	C,00199$
                           2607 ;src/main.c:472: moverEnemigoAbajo(enemy);
   73C3 DD 6E F4      [19] 2608 	ld	l,-12 (ix)
   73C6 DD 66 F5      [19] 2609 	ld	h,-11 (ix)
   73C9 E5            [11] 2610 	push	hl
   73CA CD 91 6B      [17] 2611 	call	_moverEnemigoAbajo
   73CD F1            [10] 2612 	pop	af
                           2613 ;src/main.c:474: enemy->mover = SI;
   73CE DD 6E F8      [19] 2614 	ld	l,-8 (ix)
   73D1 DD 66 F9      [19] 2615 	ld	h,-7 (ix)
   73D4 36 01         [10] 2616 	ld	(hl),#0x01
   73D6 C3 80 78      [10] 2617 	jp	00199$
   73D9                    2618 00192$:
                           2619 ;src/main.c:480: if (!prota.mover) distConstraint = 20; // ajuste en parado
   73D9 3A 43 64      [13] 2620 	ld	a, (#_prota + 6)
   73DC B7            [ 4] 2621 	or	a, a
   73DD 20 02         [12] 2622 	jr	NZ,00132$
   73DF 0E 14         [ 7] 2623 	ld	c,#0x14
   73E1                    2624 00132$:
                           2625 ;src/main.c:482: if (dist > distConstraint) {
   73E1 79            [ 4] 2626 	ld	a,c
   73E2 DD 96 F1      [19] 2627 	sub	a, -15 (ix)
   73E5 D2 80 78      [10] 2628 	jp	NC,00199$
                           2629 ;src/main.c:483: if (dx + 1 < enemy->x) {
   73E8 DD 5E 06      [19] 2630 	ld	e,6 (ix)
   73EB 16 00         [ 7] 2631 	ld	d,#0x00
   73ED 13            [ 6] 2632 	inc	de
   73EE DD 73 FE      [19] 2633 	ld	-2 (ix),e
   73F1 DD 72 FF      [19] 2634 	ld	-1 (ix),d
   73F4 DD 70 FC      [19] 2635 	ld	-4 (ix),b
   73F7 DD 36 FD 00   [19] 2636 	ld	-3 (ix),#0x00
   73FB DD 7E FE      [19] 2637 	ld	a,-2 (ix)
   73FE DD 96 FC      [19] 2638 	sub	a, -4 (ix)
   7401 DD 7E FF      [19] 2639 	ld	a,-1 (ix)
   7404 DD 9E FD      [19] 2640 	sbc	a, -3 (ix)
   7407 E2 0C 74      [10] 2641 	jp	PO, 00427$
   740A EE 80         [ 7] 2642 	xor	a, #0x80
   740C                    2643 00427$:
   740C F2 88 74      [10] 2644 	jp	P,00144$
                           2645 ;src/main.c:484: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   740F DD 7E FA      [19] 2646 	ld	a,-6 (ix)
   7412 F5            [11] 2647 	push	af
   7413 33            [ 6] 2648 	inc	sp
   7414 C5            [11] 2649 	push	bc
   7415 33            [ 6] 2650 	inc	sp
   7416 2A 50 64      [16] 2651 	ld	hl,(_mapa)
   7419 E5            [11] 2652 	push	hl
   741A CD 71 4B      [17] 2653 	call	_getTilePtr
   741D F1            [10] 2654 	pop	af
   741E F1            [10] 2655 	pop	af
   741F 4E            [ 7] 2656 	ld	c,(hl)
   7420 3E 02         [ 7] 2657 	ld	a,#0x02
   7422 91            [ 4] 2658 	sub	a, c
   7423 DA 15 75      [10] 2659 	jp	C,00145$
                           2660 ;src/main.c:485: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7426 DD 6E F6      [19] 2661 	ld	l,-10 (ix)
   7429 DD 66 F7      [19] 2662 	ld	h,-9 (ix)
   742C 7E            [ 7] 2663 	ld	a,(hl)
   742D C6 0B         [ 7] 2664 	add	a, #0x0B
   742F DD 6E F4      [19] 2665 	ld	l,-12 (ix)
   7432 DD 66 F5      [19] 2666 	ld	h,-11 (ix)
   7435 46            [ 7] 2667 	ld	b,(hl)
   7436 F5            [11] 2668 	push	af
   7437 33            [ 6] 2669 	inc	sp
   7438 C5            [11] 2670 	push	bc
   7439 33            [ 6] 2671 	inc	sp
   743A 2A 50 64      [16] 2672 	ld	hl,(_mapa)
   743D E5            [11] 2673 	push	hl
   743E CD 71 4B      [17] 2674 	call	_getTilePtr
   7441 F1            [10] 2675 	pop	af
   7442 F1            [10] 2676 	pop	af
   7443 4E            [ 7] 2677 	ld	c,(hl)
   7444 3E 02         [ 7] 2678 	ld	a,#0x02
   7446 91            [ 4] 2679 	sub	a, c
   7447 DA 15 75      [10] 2680 	jp	C,00145$
                           2681 ;src/main.c:486: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   744A DD 6E F6      [19] 2682 	ld	l,-10 (ix)
   744D DD 66 F7      [19] 2683 	ld	h,-9 (ix)
   7450 7E            [ 7] 2684 	ld	a,(hl)
   7451 C6 16         [ 7] 2685 	add	a, #0x16
   7453 DD 6E F4      [19] 2686 	ld	l,-12 (ix)
   7456 DD 66 F5      [19] 2687 	ld	h,-11 (ix)
   7459 46            [ 7] 2688 	ld	b,(hl)
   745A F5            [11] 2689 	push	af
   745B 33            [ 6] 2690 	inc	sp
   745C C5            [11] 2691 	push	bc
   745D 33            [ 6] 2692 	inc	sp
   745E 2A 50 64      [16] 2693 	ld	hl,(_mapa)
   7461 E5            [11] 2694 	push	hl
   7462 CD 71 4B      [17] 2695 	call	_getTilePtr
   7465 F1            [10] 2696 	pop	af
   7466 F1            [10] 2697 	pop	af
   7467 4E            [ 7] 2698 	ld	c,(hl)
   7468 3E 02         [ 7] 2699 	ld	a,#0x02
   746A 91            [ 4] 2700 	sub	a, c
   746B DA 15 75      [10] 2701 	jp	C,00145$
                           2702 ;src/main.c:487: moverEnemigoIzquierda(enemy);
   746E DD 6E F4      [19] 2703 	ld	l,-12 (ix)
   7471 DD 66 F5      [19] 2704 	ld	h,-11 (ix)
   7474 E5            [11] 2705 	push	hl
   7475 CD C0 6B      [17] 2706 	call	_moverEnemigoIzquierda
   7478 F1            [10] 2707 	pop	af
                           2708 ;src/main.c:488: movX = 1;
   7479 DD 36 F2 01   [19] 2709 	ld	-14 (ix),#0x01
                           2710 ;src/main.c:489: enemy->mover = SI;
   747D DD 6E F8      [19] 2711 	ld	l,-8 (ix)
   7480 DD 66 F9      [19] 2712 	ld	h,-7 (ix)
   7483 36 01         [10] 2713 	ld	(hl),#0x01
   7485 C3 15 75      [10] 2714 	jp	00145$
   7488                    2715 00144$:
                           2716 ;src/main.c:491: } else if (dx + 1 > enemy->x){
   7488 DD 7E FC      [19] 2717 	ld	a,-4 (ix)
   748B DD 96 FE      [19] 2718 	sub	a, -2 (ix)
   748E DD 7E FD      [19] 2719 	ld	a,-3 (ix)
   7491 DD 9E FF      [19] 2720 	sbc	a, -1 (ix)
   7494 E2 99 74      [10] 2721 	jp	PO, 00428$
   7497 EE 80         [ 7] 2722 	xor	a, #0x80
   7499                    2723 00428$:
   7499 F2 15 75      [10] 2724 	jp	P,00145$
                           2725 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   749C DD 66 FA      [19] 2726 	ld	h,-6 (ix)
   749F DD 6E FB      [19] 2727 	ld	l,-5 (ix)
   74A2 E5            [11] 2728 	push	hl
   74A3 2A 50 64      [16] 2729 	ld	hl,(_mapa)
   74A6 E5            [11] 2730 	push	hl
   74A7 CD 71 4B      [17] 2731 	call	_getTilePtr
   74AA F1            [10] 2732 	pop	af
   74AB F1            [10] 2733 	pop	af
   74AC 4E            [ 7] 2734 	ld	c,(hl)
   74AD 3E 02         [ 7] 2735 	ld	a,#0x02
   74AF 91            [ 4] 2736 	sub	a, c
   74B0 38 63         [12] 2737 	jr	C,00145$
                           2738 ;src/main.c:493: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   74B2 DD 6E F6      [19] 2739 	ld	l,-10 (ix)
   74B5 DD 66 F7      [19] 2740 	ld	h,-9 (ix)
   74B8 7E            [ 7] 2741 	ld	a,(hl)
   74B9 C6 0B         [ 7] 2742 	add	a, #0x0B
   74BB 47            [ 4] 2743 	ld	b,a
   74BC DD 6E F4      [19] 2744 	ld	l,-12 (ix)
   74BF DD 66 F5      [19] 2745 	ld	h,-11 (ix)
   74C2 7E            [ 7] 2746 	ld	a,(hl)
   74C3 C6 04         [ 7] 2747 	add	a, #0x04
   74C5 C5            [11] 2748 	push	bc
   74C6 33            [ 6] 2749 	inc	sp
   74C7 F5            [11] 2750 	push	af
   74C8 33            [ 6] 2751 	inc	sp
   74C9 2A 50 64      [16] 2752 	ld	hl,(_mapa)
   74CC E5            [11] 2753 	push	hl
   74CD CD 71 4B      [17] 2754 	call	_getTilePtr
   74D0 F1            [10] 2755 	pop	af
   74D1 F1            [10] 2756 	pop	af
   74D2 4E            [ 7] 2757 	ld	c,(hl)
   74D3 3E 02         [ 7] 2758 	ld	a,#0x02
   74D5 91            [ 4] 2759 	sub	a, c
   74D6 38 3D         [12] 2760 	jr	C,00145$
                           2761 ;src/main.c:494: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   74D8 DD 6E F6      [19] 2762 	ld	l,-10 (ix)
   74DB DD 66 F7      [19] 2763 	ld	h,-9 (ix)
   74DE 7E            [ 7] 2764 	ld	a,(hl)
   74DF C6 16         [ 7] 2765 	add	a, #0x16
   74E1 47            [ 4] 2766 	ld	b,a
   74E2 DD 6E F4      [19] 2767 	ld	l,-12 (ix)
   74E5 DD 66 F5      [19] 2768 	ld	h,-11 (ix)
   74E8 7E            [ 7] 2769 	ld	a,(hl)
   74E9 C6 04         [ 7] 2770 	add	a, #0x04
   74EB C5            [11] 2771 	push	bc
   74EC 33            [ 6] 2772 	inc	sp
   74ED F5            [11] 2773 	push	af
   74EE 33            [ 6] 2774 	inc	sp
   74EF 2A 50 64      [16] 2775 	ld	hl,(_mapa)
   74F2 E5            [11] 2776 	push	hl
   74F3 CD 71 4B      [17] 2777 	call	_getTilePtr
   74F6 F1            [10] 2778 	pop	af
   74F7 F1            [10] 2779 	pop	af
   74F8 4E            [ 7] 2780 	ld	c,(hl)
   74F9 3E 02         [ 7] 2781 	ld	a,#0x02
   74FB 91            [ 4] 2782 	sub	a, c
   74FC 38 17         [12] 2783 	jr	C,00145$
                           2784 ;src/main.c:495: moverEnemigoDerecha(enemy);
   74FE DD 6E F4      [19] 2785 	ld	l,-12 (ix)
   7501 DD 66 F5      [19] 2786 	ld	h,-11 (ix)
   7504 E5            [11] 2787 	push	hl
   7505 CD B0 6B      [17] 2788 	call	_moverEnemigoDerecha
   7508 F1            [10] 2789 	pop	af
                           2790 ;src/main.c:496: movX = 1;
   7509 DD 36 F2 01   [19] 2791 	ld	-14 (ix),#0x01
                           2792 ;src/main.c:497: enemy->mover = SI;
   750D DD 6E F8      [19] 2793 	ld	l,-8 (ix)
   7510 DD 66 F9      [19] 2794 	ld	h,-7 (ix)
   7513 36 01         [10] 2795 	ld	(hl),#0x01
   7515                    2796 00145$:
                           2797 ;src/main.c:500: if (dy < enemy->y) {
   7515 DD 6E F6      [19] 2798 	ld	l,-10 (ix)
   7518 DD 66 F7      [19] 2799 	ld	h,-9 (ix)
   751B 4E            [ 7] 2800 	ld	c,(hl)
                           2801 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   751C DD 6E F4      [19] 2802 	ld	l,-12 (ix)
   751F DD 66 F5      [19] 2803 	ld	h,-11 (ix)
   7522 46            [ 7] 2804 	ld	b,(hl)
                           2805 ;src/main.c:500: if (dy < enemy->y) {
   7523 DD 7E 07      [19] 2806 	ld	a,7 (ix)
   7526 91            [ 4] 2807 	sub	a, c
   7527 D2 A7 75      [10] 2808 	jp	NC,00155$
                           2809 ;src/main.c:501: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   752A 51            [ 4] 2810 	ld	d,c
   752B 15            [ 4] 2811 	dec	d
   752C 15            [ 4] 2812 	dec	d
   752D D5            [11] 2813 	push	de
   752E 33            [ 6] 2814 	inc	sp
   752F C5            [11] 2815 	push	bc
   7530 33            [ 6] 2816 	inc	sp
   7531 2A 50 64      [16] 2817 	ld	hl,(_mapa)
   7534 E5            [11] 2818 	push	hl
   7535 CD 71 4B      [17] 2819 	call	_getTilePtr
   7538 F1            [10] 2820 	pop	af
   7539 F1            [10] 2821 	pop	af
   753A 4E            [ 7] 2822 	ld	c,(hl)
   753B 3E 02         [ 7] 2823 	ld	a,#0x02
   753D 91            [ 4] 2824 	sub	a, c
   753E DA 21 76      [10] 2825 	jp	C,00156$
                           2826 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7541 DD 6E F6      [19] 2827 	ld	l,-10 (ix)
   7544 DD 66 F7      [19] 2828 	ld	h,-9 (ix)
   7547 56            [ 7] 2829 	ld	d,(hl)
   7548 15            [ 4] 2830 	dec	d
   7549 15            [ 4] 2831 	dec	d
   754A DD 6E F4      [19] 2832 	ld	l,-12 (ix)
   754D DD 66 F5      [19] 2833 	ld	h,-11 (ix)
   7550 46            [ 7] 2834 	ld	b,(hl)
   7551 04            [ 4] 2835 	inc	b
   7552 04            [ 4] 2836 	inc	b
   7553 D5            [11] 2837 	push	de
   7554 33            [ 6] 2838 	inc	sp
   7555 C5            [11] 2839 	push	bc
   7556 33            [ 6] 2840 	inc	sp
   7557 2A 50 64      [16] 2841 	ld	hl,(_mapa)
   755A E5            [11] 2842 	push	hl
   755B CD 71 4B      [17] 2843 	call	_getTilePtr
   755E F1            [10] 2844 	pop	af
   755F F1            [10] 2845 	pop	af
   7560 4E            [ 7] 2846 	ld	c,(hl)
   7561 3E 02         [ 7] 2847 	ld	a,#0x02
   7563 91            [ 4] 2848 	sub	a, c
   7564 DA 21 76      [10] 2849 	jp	C,00156$
                           2850 ;src/main.c:503: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7567 DD 6E F6      [19] 2851 	ld	l,-10 (ix)
   756A DD 66 F7      [19] 2852 	ld	h,-9 (ix)
   756D 46            [ 7] 2853 	ld	b,(hl)
   756E 05            [ 4] 2854 	dec	b
   756F 05            [ 4] 2855 	dec	b
   7570 DD 6E F4      [19] 2856 	ld	l,-12 (ix)
   7573 DD 66 F5      [19] 2857 	ld	h,-11 (ix)
   7576 7E            [ 7] 2858 	ld	a,(hl)
   7577 C6 04         [ 7] 2859 	add	a, #0x04
   7579 C5            [11] 2860 	push	bc
   757A 33            [ 6] 2861 	inc	sp
   757B F5            [11] 2862 	push	af
   757C 33            [ 6] 2863 	inc	sp
   757D 2A 50 64      [16] 2864 	ld	hl,(_mapa)
   7580 E5            [11] 2865 	push	hl
   7581 CD 71 4B      [17] 2866 	call	_getTilePtr
   7584 F1            [10] 2867 	pop	af
   7585 F1            [10] 2868 	pop	af
   7586 4E            [ 7] 2869 	ld	c,(hl)
   7587 3E 02         [ 7] 2870 	ld	a,#0x02
   7589 91            [ 4] 2871 	sub	a, c
   758A DA 21 76      [10] 2872 	jp	C,00156$
                           2873 ;src/main.c:504: moverEnemigoArriba(enemy);
   758D DD 6E F4      [19] 2874 	ld	l,-12 (ix)
   7590 DD 66 F5      [19] 2875 	ld	h,-11 (ix)
   7593 E5            [11] 2876 	push	hl
   7594 CD 72 6B      [17] 2877 	call	_moverEnemigoArriba
   7597 F1            [10] 2878 	pop	af
                           2879 ;src/main.c:505: movY = 1;
   7598 DD 36 F3 01   [19] 2880 	ld	-13 (ix),#0x01
                           2881 ;src/main.c:506: enemy->mover = SI;
   759C DD 6E F8      [19] 2882 	ld	l,-8 (ix)
   759F DD 66 F9      [19] 2883 	ld	h,-7 (ix)
   75A2 36 01         [10] 2884 	ld	(hl),#0x01
   75A4 C3 21 76      [10] 2885 	jp	00156$
   75A7                    2886 00155$:
                           2887 ;src/main.c:509: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75A7 79            [ 4] 2888 	ld	a,c
   75A8 C6 18         [ 7] 2889 	add	a, #0x18
   75AA 57            [ 4] 2890 	ld	d,a
   75AB D5            [11] 2891 	push	de
   75AC 33            [ 6] 2892 	inc	sp
   75AD C5            [11] 2893 	push	bc
   75AE 33            [ 6] 2894 	inc	sp
   75AF 2A 50 64      [16] 2895 	ld	hl,(_mapa)
   75B2 E5            [11] 2896 	push	hl
   75B3 CD 71 4B      [17] 2897 	call	_getTilePtr
   75B6 F1            [10] 2898 	pop	af
   75B7 F1            [10] 2899 	pop	af
   75B8 4E            [ 7] 2900 	ld	c,(hl)
   75B9 3E 02         [ 7] 2901 	ld	a,#0x02
   75BB 91            [ 4] 2902 	sub	a, c
   75BC 38 63         [12] 2903 	jr	C,00156$
                           2904 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   75BE DD 6E F6      [19] 2905 	ld	l,-10 (ix)
   75C1 DD 66 F7      [19] 2906 	ld	h,-9 (ix)
   75C4 7E            [ 7] 2907 	ld	a,(hl)
   75C5 C6 18         [ 7] 2908 	add	a, #0x18
   75C7 57            [ 4] 2909 	ld	d,a
   75C8 DD 6E F4      [19] 2910 	ld	l,-12 (ix)
   75CB DD 66 F5      [19] 2911 	ld	h,-11 (ix)
   75CE 46            [ 7] 2912 	ld	b,(hl)
   75CF 04            [ 4] 2913 	inc	b
   75D0 04            [ 4] 2914 	inc	b
   75D1 D5            [11] 2915 	push	de
   75D2 33            [ 6] 2916 	inc	sp
   75D3 C5            [11] 2917 	push	bc
   75D4 33            [ 6] 2918 	inc	sp
   75D5 2A 50 64      [16] 2919 	ld	hl,(_mapa)
   75D8 E5            [11] 2920 	push	hl
   75D9 CD 71 4B      [17] 2921 	call	_getTilePtr
   75DC F1            [10] 2922 	pop	af
   75DD F1            [10] 2923 	pop	af
   75DE 4E            [ 7] 2924 	ld	c,(hl)
   75DF 3E 02         [ 7] 2925 	ld	a,#0x02
   75E1 91            [ 4] 2926 	sub	a, c
   75E2 38 3D         [12] 2927 	jr	C,00156$
                           2928 ;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   75E4 DD 6E F6      [19] 2929 	ld	l,-10 (ix)
   75E7 DD 66 F7      [19] 2930 	ld	h,-9 (ix)
   75EA 7E            [ 7] 2931 	ld	a,(hl)
   75EB C6 18         [ 7] 2932 	add	a, #0x18
   75ED 47            [ 4] 2933 	ld	b,a
   75EE DD 6E F4      [19] 2934 	ld	l,-12 (ix)
   75F1 DD 66 F5      [19] 2935 	ld	h,-11 (ix)
   75F4 7E            [ 7] 2936 	ld	a,(hl)
   75F5 C6 04         [ 7] 2937 	add	a, #0x04
   75F7 C5            [11] 2938 	push	bc
   75F8 33            [ 6] 2939 	inc	sp
   75F9 F5            [11] 2940 	push	af
   75FA 33            [ 6] 2941 	inc	sp
   75FB 2A 50 64      [16] 2942 	ld	hl,(_mapa)
   75FE E5            [11] 2943 	push	hl
   75FF CD 71 4B      [17] 2944 	call	_getTilePtr
   7602 F1            [10] 2945 	pop	af
   7603 F1            [10] 2946 	pop	af
   7604 4E            [ 7] 2947 	ld	c,(hl)
   7605 3E 02         [ 7] 2948 	ld	a,#0x02
   7607 91            [ 4] 2949 	sub	a, c
   7608 38 17         [12] 2950 	jr	C,00156$
                           2951 ;src/main.c:512: moverEnemigoAbajo(enemy);
   760A DD 6E F4      [19] 2952 	ld	l,-12 (ix)
   760D DD 66 F5      [19] 2953 	ld	h,-11 (ix)
   7610 E5            [11] 2954 	push	hl
   7611 CD 91 6B      [17] 2955 	call	_moverEnemigoAbajo
   7614 F1            [10] 2956 	pop	af
                           2957 ;src/main.c:513: movY = 1;
   7615 DD 36 F3 01   [19] 2958 	ld	-13 (ix),#0x01
                           2959 ;src/main.c:514: enemy->mover = SI;
   7619 DD 6E F8      [19] 2960 	ld	l,-8 (ix)
   761C DD 66 F9      [19] 2961 	ld	h,-7 (ix)
   761F 36 01         [10] 2962 	ld	(hl),#0x01
   7621                    2963 00156$:
                           2964 ;src/main.c:517: if (!enemy->mover) {
   7621 DD 6E F8      [19] 2965 	ld	l,-8 (ix)
   7624 DD 66 F9      [19] 2966 	ld	h,-7 (ix)
   7627 7E            [ 7] 2967 	ld	a,(hl)
   7628 B7            [ 4] 2968 	or	a, a
   7629 C2 80 78      [10] 2969 	jp	NZ,00199$
                           2970 ;src/main.c:518: if (!movX) {
   762C DD 7E F2      [19] 2971 	ld	a,-14 (ix)
   762F B7            [ 4] 2972 	or	a, a
   7630 C2 59 77      [10] 2973 	jp	NZ,00171$
                           2974 ;src/main.c:519: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7633 DD 6E F6      [19] 2975 	ld	l,-10 (ix)
   7636 DD 66 F7      [19] 2976 	ld	h,-9 (ix)
   7639 5E            [ 7] 2977 	ld	e,(hl)
                           2978 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   763A DD 6E F4      [19] 2979 	ld	l,-12 (ix)
   763D DD 66 F5      [19] 2980 	ld	h,-11 (ix)
   7640 4E            [ 7] 2981 	ld	c,(hl)
                           2982 ;src/main.c:519: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7641 3E 70         [ 7] 2983 	ld	a,#0x70
   7643 93            [ 4] 2984 	sub	a, e
   7644 D2 D4 76      [10] 2985 	jp	NC,00168$
                           2986 ;src/main.c:520: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7647 7B            [ 4] 2987 	ld	a,e
   7648 C6 18         [ 7] 2988 	add	a, #0x18
   764A 47            [ 4] 2989 	ld	b,a
   764B C5            [11] 2990 	push	bc
   764C 2A 50 64      [16] 2991 	ld	hl,(_mapa)
   764F E5            [11] 2992 	push	hl
   7650 CD 71 4B      [17] 2993 	call	_getTilePtr
   7653 F1            [10] 2994 	pop	af
   7654 F1            [10] 2995 	pop	af
   7655 4E            [ 7] 2996 	ld	c,(hl)
   7656 3E 02         [ 7] 2997 	ld	a,#0x02
   7658 91            [ 4] 2998 	sub	a, c
   7659 38 63         [12] 2999 	jr	C,00158$
                           3000 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   765B DD 6E F6      [19] 3001 	ld	l,-10 (ix)
   765E DD 66 F7      [19] 3002 	ld	h,-9 (ix)
   7661 7E            [ 7] 3003 	ld	a,(hl)
   7662 C6 18         [ 7] 3004 	add	a, #0x18
   7664 57            [ 4] 3005 	ld	d,a
   7665 DD 6E F4      [19] 3006 	ld	l,-12 (ix)
   7668 DD 66 F5      [19] 3007 	ld	h,-11 (ix)
   766B 4E            [ 7] 3008 	ld	c,(hl)
   766C 41            [ 4] 3009 	ld	b,c
   766D 04            [ 4] 3010 	inc	b
   766E 04            [ 4] 3011 	inc	b
   766F D5            [11] 3012 	push	de
   7670 33            [ 6] 3013 	inc	sp
   7671 C5            [11] 3014 	push	bc
   7672 33            [ 6] 3015 	inc	sp
   7673 2A 50 64      [16] 3016 	ld	hl,(_mapa)
   7676 E5            [11] 3017 	push	hl
   7677 CD 71 4B      [17] 3018 	call	_getTilePtr
   767A F1            [10] 3019 	pop	af
   767B F1            [10] 3020 	pop	af
   767C 4E            [ 7] 3021 	ld	c,(hl)
   767D 3E 02         [ 7] 3022 	ld	a,#0x02
   767F 91            [ 4] 3023 	sub	a, c
   7680 38 3C         [12] 3024 	jr	C,00158$
                           3025 ;src/main.c:522: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7682 DD 6E F6      [19] 3026 	ld	l,-10 (ix)
   7685 DD 66 F7      [19] 3027 	ld	h,-9 (ix)
   7688 7E            [ 7] 3028 	ld	a,(hl)
   7689 C6 18         [ 7] 3029 	add	a, #0x18
   768B 47            [ 4] 3030 	ld	b,a
   768C DD 6E F4      [19] 3031 	ld	l,-12 (ix)
   768F DD 66 F5      [19] 3032 	ld	h,-11 (ix)
   7692 7E            [ 7] 3033 	ld	a,(hl)
   7693 C6 04         [ 7] 3034 	add	a, #0x04
   7695 C5            [11] 3035 	push	bc
   7696 33            [ 6] 3036 	inc	sp
   7697 F5            [11] 3037 	push	af
   7698 33            [ 6] 3038 	inc	sp
   7699 2A 50 64      [16] 3039 	ld	hl,(_mapa)
   769C E5            [11] 3040 	push	hl
   769D CD 71 4B      [17] 3041 	call	_getTilePtr
   76A0 F1            [10] 3042 	pop	af
   76A1 F1            [10] 3043 	pop	af
   76A2 4E            [ 7] 3044 	ld	c,(hl)
   76A3 3E 02         [ 7] 3045 	ld	a,#0x02
   76A5 91            [ 4] 3046 	sub	a, c
   76A6 38 16         [12] 3047 	jr	C,00158$
                           3048 ;src/main.c:523: moverEnemigoAbajo(enemy);
   76A8 DD 6E F4      [19] 3049 	ld	l,-12 (ix)
   76AB DD 66 F5      [19] 3050 	ld	h,-11 (ix)
   76AE E5            [11] 3051 	push	hl
   76AF CD 91 6B      [17] 3052 	call	_moverEnemigoAbajo
   76B2 F1            [10] 3053 	pop	af
                           3054 ;src/main.c:524: enemy->mover = SI;
   76B3 DD 6E F8      [19] 3055 	ld	l,-8 (ix)
   76B6 DD 66 F9      [19] 3056 	ld	h,-7 (ix)
   76B9 36 01         [10] 3057 	ld	(hl),#0x01
   76BB C3 59 77      [10] 3058 	jp	00171$
   76BE                    3059 00158$:
                           3060 ;src/main.c:526: moverEnemigoArriba(enemy);
   76BE DD 6E F4      [19] 3061 	ld	l,-12 (ix)
   76C1 DD 66 F5      [19] 3062 	ld	h,-11 (ix)
   76C4 E5            [11] 3063 	push	hl
   76C5 CD 72 6B      [17] 3064 	call	_moverEnemigoArriba
   76C8 F1            [10] 3065 	pop	af
                           3066 ;src/main.c:527: enemy->mover = SI;
   76C9 DD 6E F8      [19] 3067 	ld	l,-8 (ix)
   76CC DD 66 F9      [19] 3068 	ld	h,-7 (ix)
   76CF 36 01         [10] 3069 	ld	(hl),#0x01
   76D1 C3 59 77      [10] 3070 	jp	00171$
   76D4                    3071 00168$:
                           3072 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   76D4 43            [ 4] 3073 	ld	b,e
   76D5 05            [ 4] 3074 	dec	b
   76D6 05            [ 4] 3075 	dec	b
   76D7 C5            [11] 3076 	push	bc
   76D8 2A 50 64      [16] 3077 	ld	hl,(_mapa)
   76DB E5            [11] 3078 	push	hl
   76DC CD 71 4B      [17] 3079 	call	_getTilePtr
   76DF F1            [10] 3080 	pop	af
   76E0 F1            [10] 3081 	pop	af
   76E1 4E            [ 7] 3082 	ld	c,(hl)
   76E2 3E 02         [ 7] 3083 	ld	a,#0x02
   76E4 91            [ 4] 3084 	sub	a, c
   76E5 38 5F         [12] 3085 	jr	C,00163$
                           3086 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   76E7 DD 6E F6      [19] 3087 	ld	l,-10 (ix)
   76EA DD 66 F7      [19] 3088 	ld	h,-9 (ix)
   76ED 56            [ 7] 3089 	ld	d,(hl)
   76EE 15            [ 4] 3090 	dec	d
   76EF 15            [ 4] 3091 	dec	d
   76F0 DD 6E F4      [19] 3092 	ld	l,-12 (ix)
   76F3 DD 66 F5      [19] 3093 	ld	h,-11 (ix)
   76F6 46            [ 7] 3094 	ld	b,(hl)
   76F7 04            [ 4] 3095 	inc	b
   76F8 04            [ 4] 3096 	inc	b
   76F9 D5            [11] 3097 	push	de
   76FA 33            [ 6] 3098 	inc	sp
   76FB C5            [11] 3099 	push	bc
   76FC 33            [ 6] 3100 	inc	sp
   76FD 2A 50 64      [16] 3101 	ld	hl,(_mapa)
   7700 E5            [11] 3102 	push	hl
   7701 CD 71 4B      [17] 3103 	call	_getTilePtr
   7704 F1            [10] 3104 	pop	af
   7705 F1            [10] 3105 	pop	af
   7706 4E            [ 7] 3106 	ld	c,(hl)
   7707 3E 02         [ 7] 3107 	ld	a,#0x02
   7709 91            [ 4] 3108 	sub	a, c
   770A 38 3A         [12] 3109 	jr	C,00163$
                           3110 ;src/main.c:532: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   770C DD 6E F6      [19] 3111 	ld	l,-10 (ix)
   770F DD 66 F7      [19] 3112 	ld	h,-9 (ix)
   7712 46            [ 7] 3113 	ld	b,(hl)
   7713 05            [ 4] 3114 	dec	b
   7714 05            [ 4] 3115 	dec	b
   7715 DD 6E F4      [19] 3116 	ld	l,-12 (ix)
   7718 DD 66 F5      [19] 3117 	ld	h,-11 (ix)
   771B 7E            [ 7] 3118 	ld	a,(hl)
   771C C6 04         [ 7] 3119 	add	a, #0x04
   771E C5            [11] 3120 	push	bc
   771F 33            [ 6] 3121 	inc	sp
   7720 F5            [11] 3122 	push	af
   7721 33            [ 6] 3123 	inc	sp
   7722 2A 50 64      [16] 3124 	ld	hl,(_mapa)
   7725 E5            [11] 3125 	push	hl
   7726 CD 71 4B      [17] 3126 	call	_getTilePtr
   7729 F1            [10] 3127 	pop	af
   772A F1            [10] 3128 	pop	af
   772B 4E            [ 7] 3129 	ld	c,(hl)
   772C 3E 02         [ 7] 3130 	ld	a,#0x02
   772E 91            [ 4] 3131 	sub	a, c
   772F 38 15         [12] 3132 	jr	C,00163$
                           3133 ;src/main.c:533: moverEnemigoArriba(enemy);
   7731 DD 6E F4      [19] 3134 	ld	l,-12 (ix)
   7734 DD 66 F5      [19] 3135 	ld	h,-11 (ix)
   7737 E5            [11] 3136 	push	hl
   7738 CD 72 6B      [17] 3137 	call	_moverEnemigoArriba
   773B F1            [10] 3138 	pop	af
                           3139 ;src/main.c:534: enemy->mover = SI;
   773C DD 6E F8      [19] 3140 	ld	l,-8 (ix)
   773F DD 66 F9      [19] 3141 	ld	h,-7 (ix)
   7742 36 01         [10] 3142 	ld	(hl),#0x01
   7744 18 13         [12] 3143 	jr	00171$
   7746                    3144 00163$:
                           3145 ;src/main.c:536: moverEnemigoAbajo(enemy);
   7746 DD 6E F4      [19] 3146 	ld	l,-12 (ix)
   7749 DD 66 F5      [19] 3147 	ld	h,-11 (ix)
   774C E5            [11] 3148 	push	hl
   774D CD 91 6B      [17] 3149 	call	_moverEnemigoAbajo
   7750 F1            [10] 3150 	pop	af
                           3151 ;src/main.c:537: enemy->mover = SI;
   7751 DD 6E F8      [19] 3152 	ld	l,-8 (ix)
   7754 DD 66 F9      [19] 3153 	ld	h,-7 (ix)
   7757 36 01         [10] 3154 	ld	(hl),#0x01
   7759                    3155 00171$:
                           3156 ;src/main.c:542: if (!movY) {
   7759 DD 7E F3      [19] 3157 	ld	a,-13 (ix)
   775C B7            [ 4] 3158 	or	a, a
   775D C2 80 78      [10] 3159 	jp	NZ,00199$
                           3160 ;src/main.c:543: if (enemy->x < ANCHO_PANTALLA/2) {
   7760 DD 6E F4      [19] 3161 	ld	l,-12 (ix)
   7763 DD 66 F5      [19] 3162 	ld	h,-11 (ix)
   7766 4E            [ 7] 3163 	ld	c,(hl)
                           3164 ;src/main.c:425: u8 dify = abs(enemy->y - prota.y);
   7767 DD 6E F6      [19] 3165 	ld	l,-10 (ix)
   776A DD 66 F7      [19] 3166 	ld	h,-9 (ix)
   776D 46            [ 7] 3167 	ld	b,(hl)
                           3168 ;src/main.c:543: if (enemy->x < ANCHO_PANTALLA/2) {
   776E 79            [ 4] 3169 	ld	a,c
   776F D6 28         [ 7] 3170 	sub	a, #0x28
   7771 D2 F6 77      [10] 3171 	jp	NC,00183$
                           3172 ;src/main.c:544: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7774 C5            [11] 3173 	push	bc
   7775 2A 50 64      [16] 3174 	ld	hl,(_mapa)
   7778 E5            [11] 3175 	push	hl
   7779 CD 71 4B      [17] 3176 	call	_getTilePtr
   777C F1            [10] 3177 	pop	af
   777D F1            [10] 3178 	pop	af
   777E 4E            [ 7] 3179 	ld	c,(hl)
   777F 3E 02         [ 7] 3180 	ld	a,#0x02
   7781 91            [ 4] 3181 	sub	a, c
   7782 38 5C         [12] 3182 	jr	C,00173$
                           3183 ;src/main.c:545: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7784 DD 6E F6      [19] 3184 	ld	l,-10 (ix)
   7787 DD 66 F7      [19] 3185 	ld	h,-9 (ix)
   778A 7E            [ 7] 3186 	ld	a,(hl)
   778B C6 0B         [ 7] 3187 	add	a, #0x0B
   778D DD 6E F4      [19] 3188 	ld	l,-12 (ix)
   7790 DD 66 F5      [19] 3189 	ld	h,-11 (ix)
   7793 46            [ 7] 3190 	ld	b,(hl)
   7794 F5            [11] 3191 	push	af
   7795 33            [ 6] 3192 	inc	sp
   7796 C5            [11] 3193 	push	bc
   7797 33            [ 6] 3194 	inc	sp
   7798 2A 50 64      [16] 3195 	ld	hl,(_mapa)
   779B E5            [11] 3196 	push	hl
   779C CD 71 4B      [17] 3197 	call	_getTilePtr
   779F F1            [10] 3198 	pop	af
   77A0 F1            [10] 3199 	pop	af
   77A1 4E            [ 7] 3200 	ld	c,(hl)
   77A2 3E 02         [ 7] 3201 	ld	a,#0x02
   77A4 91            [ 4] 3202 	sub	a, c
   77A5 38 39         [12] 3203 	jr	C,00173$
                           3204 ;src/main.c:546: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   77A7 DD 6E F6      [19] 3205 	ld	l,-10 (ix)
   77AA DD 66 F7      [19] 3206 	ld	h,-9 (ix)
   77AD 7E            [ 7] 3207 	ld	a,(hl)
   77AE C6 16         [ 7] 3208 	add	a, #0x16
   77B0 DD 6E F4      [19] 3209 	ld	l,-12 (ix)
   77B3 DD 66 F5      [19] 3210 	ld	h,-11 (ix)
   77B6 46            [ 7] 3211 	ld	b,(hl)
   77B7 F5            [11] 3212 	push	af
   77B8 33            [ 6] 3213 	inc	sp
   77B9 C5            [11] 3214 	push	bc
   77BA 33            [ 6] 3215 	inc	sp
   77BB 2A 50 64      [16] 3216 	ld	hl,(_mapa)
   77BE E5            [11] 3217 	push	hl
   77BF CD 71 4B      [17] 3218 	call	_getTilePtr
   77C2 F1            [10] 3219 	pop	af
   77C3 F1            [10] 3220 	pop	af
   77C4 4E            [ 7] 3221 	ld	c,(hl)
   77C5 3E 02         [ 7] 3222 	ld	a,#0x02
   77C7 91            [ 4] 3223 	sub	a, c
   77C8 38 16         [12] 3224 	jr	C,00173$
                           3225 ;src/main.c:547: moverEnemigoIzquierda(enemy);
   77CA DD 6E F4      [19] 3226 	ld	l,-12 (ix)
   77CD DD 66 F5      [19] 3227 	ld	h,-11 (ix)
   77D0 E5            [11] 3228 	push	hl
   77D1 CD C0 6B      [17] 3229 	call	_moverEnemigoIzquierda
   77D4 F1            [10] 3230 	pop	af
                           3231 ;src/main.c:548: enemy->mover = SI;
   77D5 DD 6E F8      [19] 3232 	ld	l,-8 (ix)
   77D8 DD 66 F9      [19] 3233 	ld	h,-7 (ix)
   77DB 36 01         [10] 3234 	ld	(hl),#0x01
   77DD C3 80 78      [10] 3235 	jp	00199$
   77E0                    3236 00173$:
                           3237 ;src/main.c:550: moverEnemigoDerecha(enemy);
   77E0 DD 6E F4      [19] 3238 	ld	l,-12 (ix)
   77E3 DD 66 F5      [19] 3239 	ld	h,-11 (ix)
   77E6 E5            [11] 3240 	push	hl
   77E7 CD B0 6B      [17] 3241 	call	_moverEnemigoDerecha
   77EA F1            [10] 3242 	pop	af
                           3243 ;src/main.c:551: enemy->mover = SI;
   77EB DD 6E F8      [19] 3244 	ld	l,-8 (ix)
   77EE DD 66 F9      [19] 3245 	ld	h,-7 (ix)
   77F1 36 01         [10] 3246 	ld	(hl),#0x01
   77F3 C3 80 78      [10] 3247 	jp	00199$
   77F6                    3248 00183$:
                           3249 ;src/main.c:554: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   77F6 79            [ 4] 3250 	ld	a,c
   77F7 C6 04         [ 7] 3251 	add	a, #0x04
   77F9 C5            [11] 3252 	push	bc
   77FA 33            [ 6] 3253 	inc	sp
   77FB F5            [11] 3254 	push	af
   77FC 33            [ 6] 3255 	inc	sp
   77FD 2A 50 64      [16] 3256 	ld	hl,(_mapa)
   7800 E5            [11] 3257 	push	hl
   7801 CD 71 4B      [17] 3258 	call	_getTilePtr
   7804 F1            [10] 3259 	pop	af
   7805 F1            [10] 3260 	pop	af
   7806 4E            [ 7] 3261 	ld	c,(hl)
   7807 3E 02         [ 7] 3262 	ld	a,#0x02
   7809 91            [ 4] 3263 	sub	a, c
   780A 38 61         [12] 3264 	jr	C,00178$
                           3265 ;src/main.c:555: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   780C DD 6E F6      [19] 3266 	ld	l,-10 (ix)
   780F DD 66 F7      [19] 3267 	ld	h,-9 (ix)
   7812 7E            [ 7] 3268 	ld	a,(hl)
   7813 C6 0B         [ 7] 3269 	add	a, #0x0B
   7815 47            [ 4] 3270 	ld	b,a
   7816 DD 6E F4      [19] 3271 	ld	l,-12 (ix)
   7819 DD 66 F5      [19] 3272 	ld	h,-11 (ix)
   781C 7E            [ 7] 3273 	ld	a,(hl)
   781D C6 04         [ 7] 3274 	add	a, #0x04
   781F C5            [11] 3275 	push	bc
   7820 33            [ 6] 3276 	inc	sp
   7821 F5            [11] 3277 	push	af
   7822 33            [ 6] 3278 	inc	sp
   7823 2A 50 64      [16] 3279 	ld	hl,(_mapa)
   7826 E5            [11] 3280 	push	hl
   7827 CD 71 4B      [17] 3281 	call	_getTilePtr
   782A F1            [10] 3282 	pop	af
   782B F1            [10] 3283 	pop	af
   782C 4E            [ 7] 3284 	ld	c,(hl)
   782D 3E 02         [ 7] 3285 	ld	a,#0x02
   782F 91            [ 4] 3286 	sub	a, c
   7830 38 3B         [12] 3287 	jr	C,00178$
                           3288 ;src/main.c:556: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7832 DD 6E F6      [19] 3289 	ld	l,-10 (ix)
   7835 DD 66 F7      [19] 3290 	ld	h,-9 (ix)
   7838 7E            [ 7] 3291 	ld	a,(hl)
   7839 C6 16         [ 7] 3292 	add	a, #0x16
   783B 47            [ 4] 3293 	ld	b,a
   783C DD 6E F4      [19] 3294 	ld	l,-12 (ix)
   783F DD 66 F5      [19] 3295 	ld	h,-11 (ix)
   7842 7E            [ 7] 3296 	ld	a,(hl)
   7843 C6 04         [ 7] 3297 	add	a, #0x04
   7845 C5            [11] 3298 	push	bc
   7846 33            [ 6] 3299 	inc	sp
   7847 F5            [11] 3300 	push	af
   7848 33            [ 6] 3301 	inc	sp
   7849 2A 50 64      [16] 3302 	ld	hl,(_mapa)
   784C E5            [11] 3303 	push	hl
   784D CD 71 4B      [17] 3304 	call	_getTilePtr
   7850 F1            [10] 3305 	pop	af
   7851 F1            [10] 3306 	pop	af
   7852 4E            [ 7] 3307 	ld	c,(hl)
   7853 3E 02         [ 7] 3308 	ld	a,#0x02
   7855 91            [ 4] 3309 	sub	a, c
   7856 38 15         [12] 3310 	jr	C,00178$
                           3311 ;src/main.c:557: moverEnemigoDerecha(enemy);
   7858 DD 6E F4      [19] 3312 	ld	l,-12 (ix)
   785B DD 66 F5      [19] 3313 	ld	h,-11 (ix)
   785E E5            [11] 3314 	push	hl
   785F CD B0 6B      [17] 3315 	call	_moverEnemigoDerecha
   7862 F1            [10] 3316 	pop	af
                           3317 ;src/main.c:558: enemy->mover = SI;
   7863 DD 6E F8      [19] 3318 	ld	l,-8 (ix)
   7866 DD 66 F9      [19] 3319 	ld	h,-7 (ix)
   7869 36 01         [10] 3320 	ld	(hl),#0x01
   786B 18 13         [12] 3321 	jr	00199$
   786D                    3322 00178$:
                           3323 ;src/main.c:561: moverEnemigoIzquierda(enemy);
   786D DD 6E F4      [19] 3324 	ld	l,-12 (ix)
   7870 DD 66 F5      [19] 3325 	ld	h,-11 (ix)
   7873 E5            [11] 3326 	push	hl
   7874 CD C0 6B      [17] 3327 	call	_moverEnemigoIzquierda
   7877 F1            [10] 3328 	pop	af
                           3329 ;src/main.c:562: enemy->mover = SI;
   7878 DD 6E F8      [19] 3330 	ld	l,-8 (ix)
   787B DD 66 F9      [19] 3331 	ld	h,-7 (ix)
   787E 36 01         [10] 3332 	ld	(hl),#0x01
   7880                    3333 00199$:
   7880 DD F9         [10] 3334 	ld	sp, ix
   7882 DD E1         [14] 3335 	pop	ix
   7884 C9            [10] 3336 	ret
                           3337 ;src/main.c:571: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3338 ;	---------------------------------
                           3339 ; Function updateEnemy
                           3340 ; ---------------------------------
   7885                    3341 _updateEnemy::
   7885 DD E5         [15] 3342 	push	ix
   7887 DD 21 00 00   [14] 3343 	ld	ix,#0
   788B DD 39         [15] 3344 	add	ix,sp
   788D 21 F4 FF      [10] 3345 	ld	hl,#-12
   7890 39            [11] 3346 	add	hl,sp
   7891 F9            [ 6] 3347 	ld	sp,hl
                           3348 ;src/main.c:573: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7892 DD 4E 04      [19] 3349 	ld	c,4 (ix)
   7895 DD 46 05      [19] 3350 	ld	b,5 (ix)
   7898 21 16 00      [10] 3351 	ld	hl,#0x0016
   789B 09            [11] 3352 	add	hl,bc
   789C DD 75 FD      [19] 3353 	ld	-3 (ix),l
   789F DD 74 FE      [19] 3354 	ld	-2 (ix),h
   78A2 DD 6E FD      [19] 3355 	ld	l,-3 (ix)
   78A5 DD 66 FE      [19] 3356 	ld	h,-2 (ix)
   78A8 7E            [ 7] 3357 	ld	a,(hl)
   78A9 B7            [ 4] 3358 	or	a, a
   78AA 28 14         [12] 3359 	jr	Z,00115$
                           3360 ;src/main.c:574: engage(actual, prota.x, prota.y);
   78AC 3A 3E 64      [13] 3361 	ld	a, (#_prota + 1)
   78AF 21 3D 64      [10] 3362 	ld	hl, #_prota + 0
   78B2 56            [ 7] 3363 	ld	d,(hl)
   78B3 F5            [11] 3364 	push	af
   78B4 33            [ 6] 3365 	inc	sp
   78B5 D5            [11] 3366 	push	de
   78B6 33            [ 6] 3367 	inc	sp
   78B7 C5            [11] 3368 	push	bc
   78B8 CD DA 70      [17] 3369 	call	_engage
   78BB F1            [10] 3370 	pop	af
   78BC F1            [10] 3371 	pop	af
   78BD C3 DB 79      [10] 3372 	jp	00117$
   78C0                    3373 00115$:
                           3374 ;src/main.c:576: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   78C0 C5            [11] 3375 	push	bc
   78C1 C5            [11] 3376 	push	bc
   78C2 CD 1B 6E      [17] 3377 	call	_lookFor
   78C5 F1            [10] 3378 	pop	af
   78C6 C1            [10] 3379 	pop	bc
                           3380 ;src/main.c:582: actual->patrolling = 0;
   78C7 21 0B 00      [10] 3381 	ld	hl,#0x000B
   78CA 09            [11] 3382 	add	hl,bc
   78CB DD 75 F8      [19] 3383 	ld	-8 (ix),l
   78CE DD 74 F9      [19] 3384 	ld	-7 (ix),h
                           3385 ;src/main.c:577: if (actual->patrolling) {
   78D1 DD 6E F8      [19] 3386 	ld	l,-8 (ix)
   78D4 DD 66 F9      [19] 3387 	ld	h,-7 (ix)
   78D7 6E            [ 7] 3388 	ld	l,(hl)
                           3389 ;src/main.c:580: if (actual->in_range) {
   78D8 79            [ 4] 3390 	ld	a,c
   78D9 C6 11         [ 7] 3391 	add	a, #0x11
   78DB 5F            [ 4] 3392 	ld	e,a
   78DC 78            [ 4] 3393 	ld	a,b
   78DD CE 00         [ 7] 3394 	adc	a, #0x00
   78DF 57            [ 4] 3395 	ld	d,a
                           3396 ;src/main.c:588: actual->seek = 1;
   78E0 79            [ 4] 3397 	ld	a,c
   78E1 C6 14         [ 7] 3398 	add	a, #0x14
   78E3 DD 77 FB      [19] 3399 	ld	-5 (ix),a
   78E6 78            [ 4] 3400 	ld	a,b
   78E7 CE 00         [ 7] 3401 	adc	a, #0x00
   78E9 DD 77 FC      [19] 3402 	ld	-4 (ix),a
                           3403 ;src/main.c:577: if (actual->patrolling) {
   78EC 7D            [ 4] 3404 	ld	a,l
   78ED B7            [ 4] 3405 	or	a, a
   78EE CA A3 79      [10] 3406 	jp	Z,00112$
                           3407 ;src/main.c:579: moverEnemigoPatrol(actual);
   78F1 C5            [11] 3408 	push	bc
   78F2 D5            [11] 3409 	push	de
   78F3 C5            [11] 3410 	push	bc
   78F4 CD D2 6B      [17] 3411 	call	_moverEnemigoPatrol
   78F7 F1            [10] 3412 	pop	af
   78F8 D1            [10] 3413 	pop	de
   78F9 C1            [10] 3414 	pop	bc
                           3415 ;src/main.c:580: if (actual->in_range) {
   78FA 1A            [ 7] 3416 	ld	a,(de)
   78FB B7            [ 4] 3417 	or	a, a
   78FC 28 24         [12] 3418 	jr	Z,00104$
                           3419 ;src/main.c:581: engage(actual, prota.x, prota.y);
   78FE 3A 3E 64      [13] 3420 	ld	a, (#_prota + 1)
   7901 21 3D 64      [10] 3421 	ld	hl, #_prota + 0
   7904 56            [ 7] 3422 	ld	d,(hl)
   7905 F5            [11] 3423 	push	af
   7906 33            [ 6] 3424 	inc	sp
   7907 D5            [11] 3425 	push	de
   7908 33            [ 6] 3426 	inc	sp
   7909 C5            [11] 3427 	push	bc
   790A CD DA 70      [17] 3428 	call	_engage
   790D F1            [10] 3429 	pop	af
   790E F1            [10] 3430 	pop	af
                           3431 ;src/main.c:582: actual->patrolling = 0;
   790F DD 6E F8      [19] 3432 	ld	l,-8 (ix)
   7912 DD 66 F9      [19] 3433 	ld	h,-7 (ix)
   7915 36 00         [10] 3434 	ld	(hl),#0x00
                           3435 ;src/main.c:583: actual->engage = 1;
   7917 DD 6E FD      [19] 3436 	ld	l,-3 (ix)
   791A DD 66 FE      [19] 3437 	ld	h,-2 (ix)
   791D 36 01         [10] 3438 	ld	(hl),#0x01
   791F C3 DB 79      [10] 3439 	jp	00117$
   7922                    3440 00104$:
                           3441 ;src/main.c:584: } else if (actual->seen) {
   7922 21 12 00      [10] 3442 	ld	hl,#0x0012
   7925 09            [11] 3443 	add	hl,bc
   7926 DD 75 F6      [19] 3444 	ld	-10 (ix),l
   7929 DD 74 F7      [19] 3445 	ld	-9 (ix),h
   792C DD 6E F6      [19] 3446 	ld	l,-10 (ix)
   792F DD 66 F7      [19] 3447 	ld	h,-9 (ix)
   7932 7E            [ 7] 3448 	ld	a,(hl)
   7933 B7            [ 4] 3449 	or	a, a
   7934 CA DB 79      [10] 3450 	jp	Z,00117$
                           3451 ;src/main.c:585: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   7937 3A 3E 64      [13] 3452 	ld	a,(#_prota + 1)
   793A DD 77 FA      [19] 3453 	ld	-6 (ix),a
   793D 21 3D 64      [10] 3454 	ld	hl, #_prota + 0
   7940 5E            [ 7] 3455 	ld	e,(hl)
   7941 21 01 00      [10] 3456 	ld	hl,#0x0001
   7944 09            [11] 3457 	add	hl,bc
   7945 E3            [19] 3458 	ex	(sp), hl
   7946 E1            [10] 3459 	pop	hl
   7947 E5            [11] 3460 	push	hl
   7948 56            [ 7] 3461 	ld	d,(hl)
   7949 0A            [ 7] 3462 	ld	a,(bc)
   794A DD 77 FF      [19] 3463 	ld	-1 (ix),a
   794D C5            [11] 3464 	push	bc
   794E 2A 50 64      [16] 3465 	ld	hl,(_mapa)
   7951 E5            [11] 3466 	push	hl
   7952 C5            [11] 3467 	push	bc
   7953 DD 7E FA      [19] 3468 	ld	a,-6 (ix)
   7956 F5            [11] 3469 	push	af
   7957 33            [ 6] 3470 	inc	sp
   7958 7B            [ 4] 3471 	ld	a,e
   7959 F5            [11] 3472 	push	af
   795A 33            [ 6] 3473 	inc	sp
   795B D5            [11] 3474 	push	de
   795C 33            [ 6] 3475 	inc	sp
   795D DD 7E FF      [19] 3476 	ld	a,-1 (ix)
   7960 F5            [11] 3477 	push	af
   7961 33            [ 6] 3478 	inc	sp
   7962 CD 72 49      [17] 3479 	call	_pathFinding
   7965 21 08 00      [10] 3480 	ld	hl,#8
   7968 39            [11] 3481 	add	hl,sp
   7969 F9            [ 6] 3482 	ld	sp,hl
   796A C1            [10] 3483 	pop	bc
                           3484 ;src/main.c:586: actual->p_seek_x = actual->x;
   796B 21 17 00      [10] 3485 	ld	hl,#0x0017
   796E 09            [11] 3486 	add	hl,bc
   796F EB            [ 4] 3487 	ex	de,hl
   7970 0A            [ 7] 3488 	ld	a,(bc)
   7971 12            [ 7] 3489 	ld	(de),a
                           3490 ;src/main.c:587: actual->p_seek_y = actual->y;
   7972 21 18 00      [10] 3491 	ld	hl,#0x0018
   7975 09            [11] 3492 	add	hl,bc
   7976 EB            [ 4] 3493 	ex	de,hl
   7977 E1            [10] 3494 	pop	hl
   7978 E5            [11] 3495 	push	hl
   7979 7E            [ 7] 3496 	ld	a,(hl)
   797A 12            [ 7] 3497 	ld	(de),a
                           3498 ;src/main.c:588: actual->seek = 1;
   797B DD 6E FB      [19] 3499 	ld	l,-5 (ix)
   797E DD 66 FC      [19] 3500 	ld	h,-4 (ix)
   7981 36 01         [10] 3501 	ld	(hl),#0x01
                           3502 ;src/main.c:589: actual->iter=0;
   7983 21 0E 00      [10] 3503 	ld	hl,#0x000E
   7986 09            [11] 3504 	add	hl,bc
   7987 AF            [ 4] 3505 	xor	a, a
   7988 77            [ 7] 3506 	ld	(hl), a
   7989 23            [ 6] 3507 	inc	hl
   798A 77            [ 7] 3508 	ld	(hl), a
                           3509 ;src/main.c:590: actual->reversePatrol = NO;
   798B 21 0C 00      [10] 3510 	ld	hl,#0x000C
   798E 09            [11] 3511 	add	hl,bc
   798F 36 00         [10] 3512 	ld	(hl),#0x00
                           3513 ;src/main.c:591: actual->patrolling = 0;
   7991 DD 6E F8      [19] 3514 	ld	l,-8 (ix)
   7994 DD 66 F9      [19] 3515 	ld	h,-7 (ix)
   7997 36 00         [10] 3516 	ld	(hl),#0x00
                           3517 ;src/main.c:592: actual->seen = 0;
   7999 DD 6E F6      [19] 3518 	ld	l,-10 (ix)
   799C DD 66 F7      [19] 3519 	ld	h,-9 (ix)
   799F 36 00         [10] 3520 	ld	(hl),#0x00
   79A1 18 38         [12] 3521 	jr	00117$
   79A3                    3522 00112$:
                           3523 ;src/main.c:594: } else if (actual->seek) {
   79A3 DD 6E FB      [19] 3524 	ld	l,-5 (ix)
   79A6 DD 66 FC      [19] 3525 	ld	h,-4 (ix)
   79A9 7E            [ 7] 3526 	ld	a,(hl)
   79AA B7            [ 4] 3527 	or	a, a
   79AB 28 2E         [12] 3528 	jr	Z,00117$
                           3529 ;src/main.c:595: moverEnemigoSeek(actual);
   79AD C5            [11] 3530 	push	bc
   79AE D5            [11] 3531 	push	de
   79AF C5            [11] 3532 	push	bc
   79B0 CD 28 6F      [17] 3533 	call	_moverEnemigoSeek
   79B3 F1            [10] 3534 	pop	af
   79B4 D1            [10] 3535 	pop	de
   79B5 C1            [10] 3536 	pop	bc
                           3537 ;src/main.c:596: if (actual->in_range) {
   79B6 1A            [ 7] 3538 	ld	a,(de)
   79B7 B7            [ 4] 3539 	or	a, a
   79B8 28 21         [12] 3540 	jr	Z,00117$
                           3541 ;src/main.c:597: engage(actual, prota.x, prota.y);
   79BA 3A 3E 64      [13] 3542 	ld	a, (#_prota + 1)
   79BD 21 3D 64      [10] 3543 	ld	hl, #_prota + 0
   79C0 56            [ 7] 3544 	ld	d,(hl)
   79C1 F5            [11] 3545 	push	af
   79C2 33            [ 6] 3546 	inc	sp
   79C3 D5            [11] 3547 	push	de
   79C4 33            [ 6] 3548 	inc	sp
   79C5 C5            [11] 3549 	push	bc
   79C6 CD DA 70      [17] 3550 	call	_engage
   79C9 F1            [10] 3551 	pop	af
   79CA F1            [10] 3552 	pop	af
                           3553 ;src/main.c:598: actual->seek = 0;
   79CB DD 6E FB      [19] 3554 	ld	l,-5 (ix)
   79CE DD 66 FC      [19] 3555 	ld	h,-4 (ix)
   79D1 36 00         [10] 3556 	ld	(hl),#0x00
                           3557 ;src/main.c:599: actual->engage = 1;
   79D3 DD 6E FD      [19] 3558 	ld	l,-3 (ix)
   79D6 DD 66 FE      [19] 3559 	ld	h,-2 (ix)
   79D9 36 01         [10] 3560 	ld	(hl),#0x01
                           3561 ;src/main.c:600: } else if (actual->seen) {
   79DB                    3562 00117$:
   79DB DD F9         [10] 3563 	ld	sp, ix
   79DD DD E1         [14] 3564 	pop	ix
   79DF C9            [10] 3565 	ret
                           3566 ;src/main.c:607: void inicializarEnemy() {
                           3567 ;	---------------------------------
                           3568 ; Function inicializarEnemy
                           3569 ; ---------------------------------
   79E0                    3570 _inicializarEnemy::
   79E0 DD E5         [15] 3571 	push	ix
   79E2 DD 21 00 00   [14] 3572 	ld	ix,#0
   79E6 DD 39         [15] 3573 	add	ix,sp
   79E8 21 F9 FF      [10] 3574 	ld	hl,#-7
   79EB 39            [11] 3575 	add	hl,sp
   79EC F9            [ 6] 3576 	ld	sp,hl
                           3577 ;src/main.c:608: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   79ED 3A 52 64      [13] 3578 	ld	a,(#_num_mapa + 0)
   79F0 C6 02         [ 7] 3579 	add	a, #0x02
   79F2 DD 77 FF      [19] 3580 	ld	-1 (ix),a
                           3581 ;src/main.c:618: actual = enemy;
   79F5 11 B5 60      [10] 3582 	ld	de,#_enemy+0
                           3583 ;src/main.c:619: while(i){
   79F8                    3584 00101$:
   79F8 DD 7E FF      [19] 3585 	ld	a,-1 (ix)
   79FB B7            [ 4] 3586 	or	a, a
   79FC CA 00 7B      [10] 3587 	jp	Z,00104$
                           3588 ;src/main.c:620: --i;
   79FF DD 35 FF      [23] 3589 	dec	-1 (ix)
                           3590 ;src/main.c:621: actual->x = actual->px = spawnX[i];
   7A02 4B            [ 4] 3591 	ld	c, e
   7A03 42            [ 4] 3592 	ld	b, d
   7A04 03            [ 6] 3593 	inc	bc
   7A05 03            [ 6] 3594 	inc	bc
   7A06 3E 3B         [ 7] 3595 	ld	a,#<(_spawnX)
   7A08 DD 86 FF      [19] 3596 	add	a, -1 (ix)
   7A0B DD 77 FD      [19] 3597 	ld	-3 (ix),a
   7A0E 3E 65         [ 7] 3598 	ld	a,#>(_spawnX)
   7A10 CE 00         [ 7] 3599 	adc	a, #0x00
   7A12 DD 77 FE      [19] 3600 	ld	-2 (ix),a
   7A15 DD 6E FD      [19] 3601 	ld	l,-3 (ix)
   7A18 DD 66 FE      [19] 3602 	ld	h,-2 (ix)
   7A1B 7E            [ 7] 3603 	ld	a,(hl)
   7A1C 02            [ 7] 3604 	ld	(bc),a
   7A1D 12            [ 7] 3605 	ld	(de),a
                           3606 ;src/main.c:622: actual->y = actual->py = spawnY[i];
   7A1E D5            [11] 3607 	push	de
   7A1F FD E1         [14] 3608 	pop	iy
   7A21 FD 23         [10] 3609 	inc	iy
   7A23 4B            [ 4] 3610 	ld	c, e
   7A24 42            [ 4] 3611 	ld	b, d
   7A25 03            [ 6] 3612 	inc	bc
   7A26 03            [ 6] 3613 	inc	bc
   7A27 03            [ 6] 3614 	inc	bc
   7A28 3E 3F         [ 7] 3615 	ld	a,#<(_spawnY)
   7A2A DD 86 FF      [19] 3616 	add	a, -1 (ix)
   7A2D DD 77 FB      [19] 3617 	ld	-5 (ix),a
   7A30 3E 65         [ 7] 3618 	ld	a,#>(_spawnY)
   7A32 CE 00         [ 7] 3619 	adc	a, #0x00
   7A34 DD 77 FC      [19] 3620 	ld	-4 (ix),a
   7A37 DD 6E FB      [19] 3621 	ld	l,-5 (ix)
   7A3A DD 66 FC      [19] 3622 	ld	h,-4 (ix)
   7A3D 7E            [ 7] 3623 	ld	a,(hl)
   7A3E 02            [ 7] 3624 	ld	(bc),a
   7A3F FD 77 00      [19] 3625 	ld	0 (iy), a
                           3626 ;src/main.c:623: actual->mover  = NO;
   7A42 21 06 00      [10] 3627 	ld	hl,#0x0006
   7A45 19            [11] 3628 	add	hl,de
   7A46 36 00         [10] 3629 	ld	(hl),#0x00
                           3630 ;src/main.c:624: actual->mira   = M_abajo;
   7A48 21 07 00      [10] 3631 	ld	hl,#0x0007
   7A4B 19            [11] 3632 	add	hl,de
   7A4C 36 03         [10] 3633 	ld	(hl),#0x03
                           3634 ;src/main.c:625: actual->sprite = g_enemy;
   7A4E 21 04 00      [10] 3635 	ld	hl,#0x0004
   7A51 19            [11] 3636 	add	hl,de
   7A52 36 3A         [10] 3637 	ld	(hl),#<(_g_enemy)
   7A54 23            [ 6] 3638 	inc	hl
   7A55 36 3C         [10] 3639 	ld	(hl),#>(_g_enemy)
                           3640 ;src/main.c:626: actual->muerto = NO;
   7A57 21 08 00      [10] 3641 	ld	hl,#0x0008
   7A5A 19            [11] 3642 	add	hl,de
   7A5B 36 00         [10] 3643 	ld	(hl),#0x00
                           3644 ;src/main.c:627: actual->muertes = 0;
   7A5D 21 0A 00      [10] 3645 	ld	hl,#0x000A
   7A60 19            [11] 3646 	add	hl,de
   7A61 36 00         [10] 3647 	ld	(hl),#0x00
                           3648 ;src/main.c:628: actual->patrolling = SI;
   7A63 21 0B 00      [10] 3649 	ld	hl,#0x000B
   7A66 19            [11] 3650 	add	hl,de
   7A67 36 01         [10] 3651 	ld	(hl),#0x01
                           3652 ;src/main.c:629: actual->reversePatrol = NO;
   7A69 21 0C 00      [10] 3653 	ld	hl,#0x000C
   7A6C 19            [11] 3654 	add	hl,de
   7A6D 36 00         [10] 3655 	ld	(hl),#0x00
                           3656 ;src/main.c:630: actual->iter = 0;
   7A6F 21 0E 00      [10] 3657 	ld	hl,#0x000E
   7A72 19            [11] 3658 	add	hl,de
   7A73 AF            [ 4] 3659 	xor	a, a
   7A74 77            [ 7] 3660 	ld	(hl), a
   7A75 23            [ 6] 3661 	inc	hl
   7A76 77            [ 7] 3662 	ld	(hl), a
                           3663 ;src/main.c:631: actual->lastIter = 0;
   7A77 21 10 00      [10] 3664 	ld	hl,#0x0010
   7A7A 19            [11] 3665 	add	hl,de
   7A7B 36 00         [10] 3666 	ld	(hl),#0x00
                           3667 ;src/main.c:632: actual->in_range = 0,
   7A7D 21 11 00      [10] 3668 	ld	hl,#0x0011
   7A80 19            [11] 3669 	add	hl,de
   7A81 36 00         [10] 3670 	ld	(hl),#0x00
                           3671 ;src/main.c:633: actual->seek = 0;
   7A83 21 14 00      [10] 3672 	ld	hl,#0x0014
   7A86 19            [11] 3673 	add	hl,de
   7A87 36 00         [10] 3674 	ld	(hl),#0x00
                           3675 ;src/main.c:634: actual->seen = 0;
   7A89 21 12 00      [10] 3676 	ld	hl,#0x0012
   7A8C 19            [11] 3677 	add	hl,de
   7A8D 36 00         [10] 3678 	ld	(hl),#0x00
                           3679 ;src/main.c:635: actual->found = 0;
   7A8F 21 13 00      [10] 3680 	ld	hl,#0x0013
   7A92 19            [11] 3681 	add	hl,de
   7A93 36 00         [10] 3682 	ld	(hl),#0x00
                           3683 ;src/main.c:636: actual->engage = 0;
   7A95 21 16 00      [10] 3684 	ld	hl,#0x0016
   7A98 19            [11] 3685 	add	hl,de
   7A99 36 00         [10] 3686 	ld	(hl),#0x00
                           3687 ;src/main.c:637: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7A9B 21 52 64      [10] 3688 	ld	hl,#_num_mapa + 0
   7A9E 4E            [ 7] 3689 	ld	c, (hl)
   7A9F 0C            [ 4] 3690 	inc	c
   7AA0 06 00         [ 7] 3691 	ld	b,#0x00
   7AA2 69            [ 4] 3692 	ld	l, c
   7AA3 60            [ 4] 3693 	ld	h, b
   7AA4 29            [11] 3694 	add	hl, hl
   7AA5 29            [11] 3695 	add	hl, hl
   7AA6 09            [11] 3696 	add	hl, bc
   7AA7 4D            [ 4] 3697 	ld	c,l
   7AA8 44            [ 4] 3698 	ld	b,h
   7AA9 21 57 65      [10] 3699 	ld	hl,#_patrolY
   7AAC 09            [11] 3700 	add	hl,bc
   7AAD 7D            [ 4] 3701 	ld	a,l
   7AAE DD 86 FF      [19] 3702 	add	a, -1 (ix)
   7AB1 6F            [ 4] 3703 	ld	l,a
   7AB2 7C            [ 4] 3704 	ld	a,h
   7AB3 CE 00         [ 7] 3705 	adc	a, #0x00
   7AB5 67            [ 4] 3706 	ld	h,a
   7AB6 7E            [ 7] 3707 	ld	a,(hl)
   7AB7 DD 77 FA      [19] 3708 	ld	-6 (ix),a
   7ABA 21 43 65      [10] 3709 	ld	hl,#_patrolX
   7ABD 09            [11] 3710 	add	hl,bc
   7ABE DD 4E FF      [19] 3711 	ld	c,-1 (ix)
   7AC1 06 00         [ 7] 3712 	ld	b,#0x00
   7AC3 09            [11] 3713 	add	hl,bc
   7AC4 7E            [ 7] 3714 	ld	a,(hl)
   7AC5 DD 77 F9      [19] 3715 	ld	-7 (ix),a
   7AC8 DD 6E FB      [19] 3716 	ld	l,-5 (ix)
   7ACB DD 66 FC      [19] 3717 	ld	h,-4 (ix)
   7ACE 4E            [ 7] 3718 	ld	c,(hl)
   7ACF DD 6E FD      [19] 3719 	ld	l,-3 (ix)
   7AD2 DD 66 FE      [19] 3720 	ld	h,-2 (ix)
   7AD5 46            [ 7] 3721 	ld	b,(hl)
   7AD6 D5            [11] 3722 	push	de
   7AD7 2A 50 64      [16] 3723 	ld	hl,(_mapa)
   7ADA E5            [11] 3724 	push	hl
   7ADB D5            [11] 3725 	push	de
   7ADC DD 66 FA      [19] 3726 	ld	h,-6 (ix)
   7ADF DD 6E F9      [19] 3727 	ld	l,-7 (ix)
   7AE2 E5            [11] 3728 	push	hl
   7AE3 79            [ 4] 3729 	ld	a,c
   7AE4 F5            [11] 3730 	push	af
   7AE5 33            [ 6] 3731 	inc	sp
   7AE6 C5            [11] 3732 	push	bc
   7AE7 33            [ 6] 3733 	inc	sp
   7AE8 CD 72 49      [17] 3734 	call	_pathFinding
   7AEB 21 08 00      [10] 3735 	ld	hl,#8
   7AEE 39            [11] 3736 	add	hl,sp
   7AEF F9            [ 6] 3737 	ld	sp,hl
   7AF0 D1            [10] 3738 	pop	de
                           3739 ;src/main.c:638: dibujarEnemigo(actual);
   7AF1 D5            [11] 3740 	push	de
   7AF2 D5            [11] 3741 	push	de
   7AF3 CD F1 67      [17] 3742 	call	_dibujarEnemigo
   7AF6 F1            [10] 3743 	pop	af
   7AF7 D1            [10] 3744 	pop	de
                           3745 ;src/main.c:639: ++actual;
   7AF8 21 E2 00      [10] 3746 	ld	hl,#0x00E2
   7AFB 19            [11] 3747 	add	hl,de
   7AFC EB            [ 4] 3748 	ex	de,hl
   7AFD C3 F8 79      [10] 3749 	jp	00101$
   7B00                    3750 00104$:
   7B00 DD F9         [10] 3751 	ld	sp, ix
   7B02 DD E1         [14] 3752 	pop	ix
   7B04 C9            [10] 3753 	ret
                           3754 ;src/main.c:643: void avanzarMapa() {
                           3755 ;	---------------------------------
                           3756 ; Function avanzarMapa
                           3757 ; ---------------------------------
   7B05                    3758 _avanzarMapa::
                           3759 ;src/main.c:644: if(num_mapa < NUM_MAPAS -1) {
   7B05 3A 52 64      [13] 3760 	ld	a,(#_num_mapa + 0)
   7B08 D6 02         [ 7] 3761 	sub	a, #0x02
   7B0A 30 34         [12] 3762 	jr	NC,00102$
                           3763 ;src/main.c:645: mapa = mapas[++num_mapa];
   7B0C 01 35 65      [10] 3764 	ld	bc,#_mapas+0
   7B0F 21 52 64      [10] 3765 	ld	hl, #_num_mapa+0
   7B12 34            [11] 3766 	inc	(hl)
   7B13 FD 21 52 64   [14] 3767 	ld	iy,#_num_mapa
   7B17 FD 6E 00      [19] 3768 	ld	l,0 (iy)
   7B1A 26 00         [ 7] 3769 	ld	h,#0x00
   7B1C 29            [11] 3770 	add	hl, hl
   7B1D 09            [11] 3771 	add	hl,bc
   7B1E 7E            [ 7] 3772 	ld	a,(hl)
   7B1F FD 21 50 64   [14] 3773 	ld	iy,#_mapa
   7B23 FD 77 00      [19] 3774 	ld	0 (iy),a
   7B26 23            [ 6] 3775 	inc	hl
   7B27 7E            [ 7] 3776 	ld	a,(hl)
   7B28 32 51 64      [13] 3777 	ld	(#_mapa + 1),a
                           3778 ;src/main.c:646: prota.x = prota.px = 2;
   7B2B 21 3F 64      [10] 3779 	ld	hl,#(_prota + 0x0002)
   7B2E 36 02         [10] 3780 	ld	(hl),#0x02
   7B30 21 3D 64      [10] 3781 	ld	hl,#_prota
   7B33 36 02         [10] 3782 	ld	(hl),#0x02
                           3783 ;src/main.c:647: prota.mover = SI;
   7B35 21 43 64      [10] 3784 	ld	hl,#(_prota + 0x0006)
   7B38 36 01         [10] 3785 	ld	(hl),#0x01
                           3786 ;src/main.c:648: dibujarMapa();
   7B3A CD 1F 65      [17] 3787 	call	_dibujarMapa
                           3788 ;src/main.c:649: inicializarEnemy();
   7B3D C3 E0 79      [10] 3789 	jp  _inicializarEnemy
   7B40                    3790 00102$:
                           3791 ;src/main.c:652: menuFin(puntuacion);
   7B40 FD 21 53 64   [14] 3792 	ld	iy,#_puntuacion
   7B44 FD 6E 00      [19] 3793 	ld	l,0 (iy)
   7B47 26 00         [ 7] 3794 	ld	h,#0x00
   7B49 C3 F5 4B      [10] 3795 	jp  _menuFin
                           3796 ;src/main.c:656: void moverIzquierda() {
                           3797 ;	---------------------------------
                           3798 ; Function moverIzquierda
                           3799 ; ---------------------------------
   7B4C                    3800 _moverIzquierda::
                           3801 ;src/main.c:657: prota.mira = M_izquierda;
   7B4C 01 3D 64      [10] 3802 	ld	bc,#_prota+0
   7B4F 21 44 64      [10] 3803 	ld	hl,#(_prota + 0x0007)
   7B52 36 01         [10] 3804 	ld	(hl),#0x01
                           3805 ;src/main.c:658: if (!checkCollision(M_izquierda)) {
   7B54 C5            [11] 3806 	push	bc
   7B55 3E 01         [ 7] 3807 	ld	a,#0x01
   7B57 F5            [11] 3808 	push	af
   7B58 33            [ 6] 3809 	inc	sp
   7B59 CD 80 66      [17] 3810 	call	_checkCollision
   7B5C 33            [ 6] 3811 	inc	sp
   7B5D C1            [10] 3812 	pop	bc
   7B5E 7D            [ 4] 3813 	ld	a,l
   7B5F B7            [ 4] 3814 	or	a, a
   7B60 C0            [11] 3815 	ret	NZ
                           3816 ;src/main.c:659: prota.x--;
   7B61 0A            [ 7] 3817 	ld	a,(bc)
   7B62 C6 FF         [ 7] 3818 	add	a,#0xFF
   7B64 02            [ 7] 3819 	ld	(bc),a
                           3820 ;src/main.c:660: prota.mover = SI;
   7B65 21 43 64      [10] 3821 	ld	hl,#(_prota + 0x0006)
   7B68 36 01         [10] 3822 	ld	(hl),#0x01
                           3823 ;src/main.c:661: prota.sprite = g_hero_left;
   7B6A 21 C6 3D      [10] 3824 	ld	hl,#_g_hero_left
   7B6D 22 41 64      [16] 3825 	ld	((_prota + 0x0004)), hl
   7B70 C9            [10] 3826 	ret
                           3827 ;src/main.c:665: void moverDerecha() {
                           3828 ;	---------------------------------
                           3829 ; Function moverDerecha
                           3830 ; ---------------------------------
   7B71                    3831 _moverDerecha::
                           3832 ;src/main.c:666: prota.mira = M_derecha;
   7B71 21 44 64      [10] 3833 	ld	hl,#(_prota + 0x0007)
   7B74 36 00         [10] 3834 	ld	(hl),#0x00
                           3835 ;src/main.c:667: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7B76 AF            [ 4] 3836 	xor	a, a
   7B77 F5            [11] 3837 	push	af
   7B78 33            [ 6] 3838 	inc	sp
   7B79 CD 80 66      [17] 3839 	call	_checkCollision
   7B7C 33            [ 6] 3840 	inc	sp
   7B7D 45            [ 4] 3841 	ld	b,l
   7B7E 21 3D 64      [10] 3842 	ld	hl, #_prota + 0
   7B81 4E            [ 7] 3843 	ld	c,(hl)
   7B82 59            [ 4] 3844 	ld	e,c
   7B83 16 00         [ 7] 3845 	ld	d,#0x00
   7B85 21 07 00      [10] 3846 	ld	hl,#0x0007
   7B88 19            [11] 3847 	add	hl,de
   7B89 11 50 80      [10] 3848 	ld	de, #0x8050
   7B8C 29            [11] 3849 	add	hl, hl
   7B8D 3F            [ 4] 3850 	ccf
   7B8E CB 1C         [ 8] 3851 	rr	h
   7B90 CB 1D         [ 8] 3852 	rr	l
   7B92 ED 52         [15] 3853 	sbc	hl, de
   7B94 3E 00         [ 7] 3854 	ld	a,#0x00
   7B96 17            [ 4] 3855 	rla
   7B97 5F            [ 4] 3856 	ld	e,a
   7B98 78            [ 4] 3857 	ld	a,b
   7B99 B7            [ 4] 3858 	or	a,a
   7B9A 20 14         [12] 3859 	jr	NZ,00104$
   7B9C B3            [ 4] 3860 	or	a,e
   7B9D 28 11         [12] 3861 	jr	Z,00104$
                           3862 ;src/main.c:668: prota.x++;
   7B9F 0C            [ 4] 3863 	inc	c
   7BA0 21 3D 64      [10] 3864 	ld	hl,#_prota
   7BA3 71            [ 7] 3865 	ld	(hl),c
                           3866 ;src/main.c:669: prota.mover = SI;
   7BA4 21 43 64      [10] 3867 	ld	hl,#(_prota + 0x0006)
   7BA7 36 01         [10] 3868 	ld	(hl),#0x01
                           3869 ;src/main.c:670: prota.sprite = g_hero;
   7BA9 21 70 3E      [10] 3870 	ld	hl,#_g_hero
   7BAC 22 41 64      [16] 3871 	ld	((_prota + 0x0004)), hl
   7BAF C9            [10] 3872 	ret
   7BB0                    3873 00104$:
                           3874 ;src/main.c:671: }else if( prota.x + G_HERO_W >= 80){
   7BB0 7B            [ 4] 3875 	ld	a,e
   7BB1 B7            [ 4] 3876 	or	a, a
   7BB2 C0            [11] 3877 	ret	NZ
                           3878 ;src/main.c:672: avanzarMapa();
   7BB3 C3 05 7B      [10] 3879 	jp  _avanzarMapa
                           3880 ;src/main.c:676: void moverArriba() {
                           3881 ;	---------------------------------
                           3882 ; Function moverArriba
                           3883 ; ---------------------------------
   7BB6                    3884 _moverArriba::
                           3885 ;src/main.c:677: prota.mira = M_arriba;
   7BB6 21 44 64      [10] 3886 	ld	hl,#(_prota + 0x0007)
   7BB9 36 02         [10] 3887 	ld	(hl),#0x02
                           3888 ;src/main.c:678: if (!checkCollision(M_arriba)) {
   7BBB 3E 02         [ 7] 3889 	ld	a,#0x02
   7BBD F5            [11] 3890 	push	af
   7BBE 33            [ 6] 3891 	inc	sp
   7BBF CD 80 66      [17] 3892 	call	_checkCollision
   7BC2 33            [ 6] 3893 	inc	sp
   7BC3 7D            [ 4] 3894 	ld	a,l
   7BC4 B7            [ 4] 3895 	or	a, a
   7BC5 C0            [11] 3896 	ret	NZ
                           3897 ;src/main.c:679: prota.y--;
   7BC6 21 3E 64      [10] 3898 	ld	hl,#_prota + 1
   7BC9 4E            [ 7] 3899 	ld	c,(hl)
   7BCA 0D            [ 4] 3900 	dec	c
   7BCB 71            [ 7] 3901 	ld	(hl),c
                           3902 ;src/main.c:680: prota.y--;
   7BCC 0D            [ 4] 3903 	dec	c
   7BCD 71            [ 7] 3904 	ld	(hl),c
                           3905 ;src/main.c:681: prota.mover  = SI;
   7BCE 21 43 64      [10] 3906 	ld	hl,#(_prota + 0x0006)
   7BD1 36 01         [10] 3907 	ld	(hl),#0x01
                           3908 ;src/main.c:682: prota.sprite = g_hero_up;
   7BD3 21 2C 3D      [10] 3909 	ld	hl,#_g_hero_up
   7BD6 22 41 64      [16] 3910 	ld	((_prota + 0x0004)), hl
   7BD9 C9            [10] 3911 	ret
                           3912 ;src/main.c:686: void moverAbajo() {
                           3913 ;	---------------------------------
                           3914 ; Function moverAbajo
                           3915 ; ---------------------------------
   7BDA                    3916 _moverAbajo::
                           3917 ;src/main.c:687: prota.mira = M_abajo;
   7BDA 21 44 64      [10] 3918 	ld	hl,#(_prota + 0x0007)
   7BDD 36 03         [10] 3919 	ld	(hl),#0x03
                           3920 ;src/main.c:688: if (!checkCollision(M_abajo) ) {
   7BDF 3E 03         [ 7] 3921 	ld	a,#0x03
   7BE1 F5            [11] 3922 	push	af
   7BE2 33            [ 6] 3923 	inc	sp
   7BE3 CD 80 66      [17] 3924 	call	_checkCollision
   7BE6 33            [ 6] 3925 	inc	sp
   7BE7 7D            [ 4] 3926 	ld	a,l
   7BE8 B7            [ 4] 3927 	or	a, a
   7BE9 C0            [11] 3928 	ret	NZ
                           3929 ;src/main.c:689: prota.y++;
   7BEA 01 3E 64      [10] 3930 	ld	bc,#_prota + 1
   7BED 0A            [ 7] 3931 	ld	a,(bc)
   7BEE 3C            [ 4] 3932 	inc	a
   7BEF 02            [ 7] 3933 	ld	(bc),a
                           3934 ;src/main.c:690: prota.y++;
   7BF0 3C            [ 4] 3935 	inc	a
   7BF1 02            [ 7] 3936 	ld	(bc),a
                           3937 ;src/main.c:691: prota.mover  = SI;
   7BF2 21 43 64      [10] 3938 	ld	hl,#(_prota + 0x0006)
   7BF5 36 01         [10] 3939 	ld	(hl),#0x01
                           3940 ;src/main.c:692: prota.sprite = g_hero_down;
   7BF7 21 92 3C      [10] 3941 	ld	hl,#_g_hero_down
   7BFA 22 41 64      [16] 3942 	ld	((_prota + 0x0004)), hl
   7BFD C9            [10] 3943 	ret
                           3944 ;src/main.c:699: void intHandler() {
                           3945 ;	---------------------------------
                           3946 ; Function intHandler
                           3947 ; ---------------------------------
   7BFE                    3948 _intHandler::
                           3949 ;src/main.c:700: if (++i == 6) {
   7BFE 21 55 64      [10] 3950 	ld	hl, #_i+0
   7C01 34            [11] 3951 	inc	(hl)
   7C02 3A 55 64      [13] 3952 	ld	a,(#_i + 0)
   7C05 D6 06         [ 7] 3953 	sub	a, #0x06
   7C07 C0            [11] 3954 	ret	NZ
                           3955 ;src/main.c:701: play();
   7C08 CD 89 53      [17] 3956 	call	_play
                           3957 ;src/main.c:702: i=0;
   7C0B 21 55 64      [10] 3958 	ld	hl,#_i + 0
   7C0E 36 00         [10] 3959 	ld	(hl), #0x00
   7C10 C9            [10] 3960 	ret
                           3961 ;src/main.c:706: void inicializarCPC() {
                           3962 ;	---------------------------------
                           3963 ; Function inicializarCPC
                           3964 ; ---------------------------------
   7C11                    3965 _inicializarCPC::
                           3966 ;src/main.c:707: cpct_disableFirmware();
   7C11 CD 30 57      [17] 3967 	call	_cpct_disableFirmware
                           3968 ;src/main.c:708: cpct_setVideoMode(0);
   7C14 2E 00         [ 7] 3969 	ld	l,#0x00
   7C16 CD 04 57      [17] 3970 	call	_cpct_setVideoMode
                           3971 ;src/main.c:709: cpct_setBorder(HW_BLACK);
   7C19 21 10 14      [10] 3972 	ld	hl,#0x1410
   7C1C E5            [11] 3973 	push	hl
   7C1D CD 67 54      [17] 3974 	call	_cpct_setPALColour
                           3975 ;src/main.c:710: cpct_setPalette(g_palette, 16);
   7C20 21 10 00      [10] 3976 	ld	hl,#0x0010
   7C23 E5            [11] 3977 	push	hl
   7C24 21 60 3E      [10] 3978 	ld	hl,#_g_palette
   7C27 E5            [11] 3979 	push	hl
   7C28 CD 44 54      [17] 3980 	call	_cpct_setPalette
   7C2B C9            [10] 3981 	ret
                           3982 ;src/main.c:715: void inicializarJuego() {
                           3983 ;	---------------------------------
                           3984 ; Function inicializarJuego
                           3985 ; ---------------------------------
   7C2C                    3986 _inicializarJuego::
                           3987 ;src/main.c:717: num_mapa = 2;
   7C2C 21 52 64      [10] 3988 	ld	hl,#_num_mapa + 0
   7C2F 36 02         [10] 3989 	ld	(hl), #0x02
                           3990 ;src/main.c:723: puntuacion = 0;
   7C31 21 53 64      [10] 3991 	ld	hl,#_puntuacion + 0
   7C34 36 00         [10] 3992 	ld	(hl), #0x00
                           3993 ;src/main.c:724: vidas = 5;
   7C36 21 54 64      [10] 3994 	ld	hl,#_vidas + 0
   7C39 36 05         [10] 3995 	ld	(hl), #0x05
                           3996 ;src/main.c:725: mapa = mapas[num_mapa];
   7C3B 21 39 65      [10] 3997 	ld	hl, #(_mapas + 0x0004) + 0
   7C3E 7E            [ 7] 3998 	ld	a,(hl)
   7C3F FD 21 50 64   [14] 3999 	ld	iy,#_mapa
   7C43 FD 77 00      [19] 4000 	ld	0 (iy),a
   7C46 23            [ 6] 4001 	inc	hl
   7C47 7E            [ 7] 4002 	ld	a,(hl)
   7C48 32 51 64      [13] 4003 	ld	(#_mapa + 1),a
                           4004 ;src/main.c:726: cpct_etm_setTileset2x4(g_tileset);
   7C4B 21 E0 17      [10] 4005 	ld	hl,#_g_tileset
   7C4E CD 58 56      [17] 4006 	call	_cpct_etm_setTileset2x4
                           4007 ;src/main.c:728: dibujarMapa();
   7C51 CD 1F 65      [17] 4008 	call	_dibujarMapa
                           4009 ;src/main.c:731: barraPuntuacionInicial();
   7C54 CD 95 51      [17] 4010 	call	_barraPuntuacionInicial
                           4011 ;src/main.c:734: prota.x = prota.px = 4;
   7C57 21 3F 64      [10] 4012 	ld	hl,#(_prota + 0x0002)
   7C5A 36 04         [10] 4013 	ld	(hl),#0x04
   7C5C 21 3D 64      [10] 4014 	ld	hl,#_prota
   7C5F 36 04         [10] 4015 	ld	(hl),#0x04
                           4016 ;src/main.c:735: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7C61 21 40 64      [10] 4017 	ld	hl,#(_prota + 0x0003)
   7C64 36 68         [10] 4018 	ld	(hl),#0x68
   7C66 21 3E 64      [10] 4019 	ld	hl,#(_prota + 0x0001)
   7C69 36 68         [10] 4020 	ld	(hl),#0x68
                           4021 ;src/main.c:736: prota.mover  = NO;
   7C6B 21 43 64      [10] 4022 	ld	hl,#(_prota + 0x0006)
   7C6E 36 00         [10] 4023 	ld	(hl),#0x00
                           4024 ;src/main.c:737: prota.mira=M_derecha;
   7C70 21 44 64      [10] 4025 	ld	hl,#(_prota + 0x0007)
   7C73 36 00         [10] 4026 	ld	(hl),#0x00
                           4027 ;src/main.c:738: prota.sprite = g_hero;
   7C75 21 70 3E      [10] 4028 	ld	hl,#_g_hero
   7C78 22 41 64      [16] 4029 	ld	((_prota + 0x0004)), hl
                           4030 ;src/main.c:742: cu.x = cu.px = 0;
   7C7B 21 47 64      [10] 4031 	ld	hl,#(_cu + 0x0002)
   7C7E 36 00         [10] 4032 	ld	(hl),#0x00
   7C80 21 45 64      [10] 4033 	ld	hl,#_cu
   7C83 36 00         [10] 4034 	ld	(hl),#0x00
                           4035 ;src/main.c:743: cu.y = cu.py = 0;
   7C85 21 48 64      [10] 4036 	ld	hl,#(_cu + 0x0003)
   7C88 36 00         [10] 4037 	ld	(hl),#0x00
   7C8A 21 46 64      [10] 4038 	ld	hl,#(_cu + 0x0001)
   7C8D 36 00         [10] 4039 	ld	(hl),#0x00
                           4040 ;src/main.c:744: cu.lanzado = NO;
   7C8F 21 4B 64      [10] 4041 	ld	hl,#(_cu + 0x0006)
   7C92 36 00         [10] 4042 	ld	(hl),#0x00
                           4043 ;src/main.c:745: cu.mover = NO;
   7C94 21 4E 64      [10] 4044 	ld	hl,#(_cu + 0x0009)
   7C97 36 00         [10] 4045 	ld	(hl),#0x00
                           4046 ;src/main.c:746: cu.off_bound = NO;
   7C99 21 4F 64      [10] 4047 	ld	hl,#(_cu + 0x000a)
   7C9C 36 00         [10] 4048 	ld	(hl),#0x00
                           4049 ;src/main.c:748: inicializarEnemy();
   7C9E CD E0 79      [17] 4050 	call	_inicializarEnemy
                           4051 ;src/main.c:750: dibujarProta();
   7CA1 C3 6B 65      [10] 4052 	jp  _dibujarProta
                           4053 ;src/main.c:753: void main(void) {
                           4054 ;	---------------------------------
                           4055 ; Function main
                           4056 ; ---------------------------------
   7CA4                    4057 _main::
   7CA4 DD E5         [15] 4058 	push	ix
   7CA6 DD 21 00 00   [14] 4059 	ld	ix,#0
   7CAA DD 39         [15] 4060 	add	ix,sp
   7CAC 21 F9 FF      [10] 4061 	ld	hl,#-7
   7CAF 39            [11] 4062 	add	hl,sp
   7CB0 F9            [ 6] 4063 	ld	sp,hl
                           4064 ;src/main.c:758: inicializarCPC();
   7CB1 CD 11 7C      [17] 4065 	call	_inicializarCPC
                           4066 ;src/main.c:760: menuInicio();
   7CB4 CD B6 50      [17] 4067 	call	_menuInicio
                           4068 ;src/main.c:762: inicializarJuego();
   7CB7 CD 2C 7C      [17] 4069 	call	_inicializarJuego
                           4070 ;src/main.c:766: while (1) {
   7CBA                    4071 00126$:
                           4072 ;src/main.c:768: i = 2 + num_mapa;
   7CBA 21 52 64      [10] 4073 	ld	hl,#_num_mapa + 0
   7CBD 4E            [ 7] 4074 	ld	c, (hl)
   7CBE 0C            [ 4] 4075 	inc	c
   7CBF 0C            [ 4] 4076 	inc	c
                           4077 ;src/main.c:769: actual = enemy;
                           4078 ;src/main.c:771: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7CC0 C5            [11] 4079 	push	bc
   7CC1 21 00 01      [10] 4080 	ld	hl,#_g_tablatrans
   7CC4 E5            [11] 4081 	push	hl
   7CC5 2A 50 64      [16] 4082 	ld	hl,(_mapa)
   7CC8 E5            [11] 4083 	push	hl
   7CC9 21 3D 64      [10] 4084 	ld	hl,#_prota
   7CCC E5            [11] 4085 	push	hl
   7CCD 21 45 64      [10] 4086 	ld	hl,#_cu
   7CD0 E5            [11] 4087 	push	hl
   7CD1 CD 19 66      [17] 4088 	call	_comprobarTeclado
   7CD4 21 08 00      [10] 4089 	ld	hl,#8
   7CD7 39            [11] 4090 	add	hl,sp
   7CD8 F9            [ 6] 4091 	ld	sp,hl
   7CD9 2A 50 64      [16] 4092 	ld	hl,(_mapa)
   7CDC E5            [11] 4093 	push	hl
   7CDD 21 45 64      [10] 4094 	ld	hl,#_cu
   7CE0 E5            [11] 4095 	push	hl
   7CE1 CD 15 43      [17] 4096 	call	_moverCuchillo
   7CE4 F1            [10] 4097 	pop	af
   7CE5 F1            [10] 4098 	pop	af
   7CE6 C1            [10] 4099 	pop	bc
                           4100 ;src/main.c:773: while(i){
   7CE7 DD 71 FF      [19] 4101 	ld	-1 (ix),c
   7CEA DD 36 FD B5   [19] 4102 	ld	-3 (ix),#<(_enemy)
   7CEE DD 36 FE 60   [19] 4103 	ld	-2 (ix),#>(_enemy)
   7CF2                    4104 00105$:
   7CF2 DD 7E FF      [19] 4105 	ld	a,-1 (ix)
   7CF5 B7            [ 4] 4106 	or	a, a
   7CF6 28 56         [12] 4107 	jr	Z,00107$
                           4108 ;src/main.c:775: --i;
   7CF8 DD 35 FF      [23] 4109 	dec	-1 (ix)
                           4110 ;src/main.c:776: if(!actual->muerto){
   7CFB DD 7E FD      [19] 4111 	ld	a,-3 (ix)
   7CFE C6 08         [ 7] 4112 	add	a, #0x08
   7D00 DD 77 FB      [19] 4113 	ld	-5 (ix),a
   7D03 DD 7E FE      [19] 4114 	ld	a,-2 (ix)
   7D06 CE 00         [ 7] 4115 	adc	a, #0x00
   7D08 DD 77 FC      [19] 4116 	ld	-4 (ix),a
   7D0B DD 6E FB      [19] 4117 	ld	l,-5 (ix)
   7D0E DD 66 FC      [19] 4118 	ld	h,-4 (ix)
   7D11 7E            [ 7] 4119 	ld	a,(hl)
   7D12 B7            [ 4] 4120 	or	a, a
   7D13 20 12         [12] 4121 	jr	NZ,00102$
                           4122 ;src/main.c:777: checkEnemyDead(cu.direccion, actual);
   7D15 21 4C 64      [10] 4123 	ld	hl, #_cu + 7
   7D18 46            [ 7] 4124 	ld	b,(hl)
   7D19 DD 6E FD      [19] 4125 	ld	l,-3 (ix)
   7D1C DD 66 FE      [19] 4126 	ld	h,-2 (ix)
   7D1F E5            [11] 4127 	push	hl
   7D20 C5            [11] 4128 	push	bc
   7D21 33            [ 6] 4129 	inc	sp
   7D22 CD 7F 69      [17] 4130 	call	_checkEnemyDead
   7D25 F1            [10] 4131 	pop	af
   7D26 33            [ 6] 4132 	inc	sp
   7D27                    4133 00102$:
                           4134 ;src/main.c:779: if(!actual->muerto){
   7D27 DD 6E FB      [19] 4135 	ld	l,-5 (ix)
   7D2A DD 66 FC      [19] 4136 	ld	h,-4 (ix)
   7D2D 7E            [ 7] 4137 	ld	a,(hl)
   7D2E B7            [ 4] 4138 	or	a, a
   7D2F 20 0B         [12] 4139 	jr	NZ,00104$
                           4140 ;src/main.c:780: updateEnemy(actual);
   7D31 DD 6E FD      [19] 4141 	ld	l,-3 (ix)
   7D34 DD 66 FE      [19] 4142 	ld	h,-2 (ix)
   7D37 E5            [11] 4143 	push	hl
   7D38 CD 85 78      [17] 4144 	call	_updateEnemy
   7D3B F1            [10] 4145 	pop	af
   7D3C                    4146 00104$:
                           4147 ;src/main.c:782: ++actual;
   7D3C DD 7E FD      [19] 4148 	ld	a,-3 (ix)
   7D3F C6 E2         [ 7] 4149 	add	a, #0xE2
   7D41 DD 77 FD      [19] 4150 	ld	-3 (ix),a
   7D44 DD 7E FE      [19] 4151 	ld	a,-2 (ix)
   7D47 CE 00         [ 7] 4152 	adc	a, #0x00
   7D49 DD 77 FE      [19] 4153 	ld	-2 (ix),a
   7D4C 18 A4         [12] 4154 	jr	00105$
   7D4E                    4155 00107$:
                           4156 ;src/main.c:785: cpct_waitVSYNC();
   7D4E CD FC 56      [17] 4157 	call	_cpct_waitVSYNC
                           4158 ;src/main.c:788: if (prota.mover) {
   7D51 01 43 64      [10] 4159 	ld	bc,#_prota + 6
   7D54 0A            [ 7] 4160 	ld	a,(bc)
   7D55 B7            [ 4] 4161 	or	a, a
   7D56 28 07         [12] 4162 	jr	Z,00109$
                           4163 ;src/main.c:789: redibujarProta();
   7D58 C5            [11] 4164 	push	bc
   7D59 CD 05 66      [17] 4165 	call	_redibujarProta
   7D5C C1            [10] 4166 	pop	bc
                           4167 ;src/main.c:790: prota.mover = NO;
   7D5D AF            [ 4] 4168 	xor	a, a
   7D5E 02            [ 7] 4169 	ld	(bc),a
   7D5F                    4170 00109$:
                           4171 ;src/main.c:792: if(cu.lanzado && cu.mover){
   7D5F 21 4B 64      [10] 4172 	ld	hl, #(_cu + 0x0006) + 0
   7D62 4E            [ 7] 4173 	ld	c,(hl)
                           4174 ;src/main.c:793: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4175 ;src/main.c:792: if(cu.lanzado && cu.mover){
   7D63 79            [ 4] 4176 	ld	a,c
   7D64 B7            [ 4] 4177 	or	a, a
   7D65 28 30         [12] 4178 	jr	Z,00114$
   7D67 3A 4E 64      [13] 4179 	ld	a, (#(_cu + 0x0009) + 0)
   7D6A B7            [ 4] 4180 	or	a, a
   7D6B 28 2A         [12] 4181 	jr	Z,00114$
                           4182 ;src/main.c:793: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7D6D 21 46 64      [10] 4183 	ld	hl, #(_cu + 0x0001) + 0
   7D70 4E            [ 7] 4184 	ld	c,(hl)
   7D71 21 45 64      [10] 4185 	ld	hl, #_cu + 0
   7D74 46            [ 7] 4186 	ld	b,(hl)
   7D75 21 4D 64      [10] 4187 	ld	hl, #(_cu + 0x0008) + 0
   7D78 5E            [ 7] 4188 	ld	e,(hl)
   7D79 2A 50 64      [16] 4189 	ld	hl,(_mapa)
   7D7C E5            [11] 4190 	push	hl
   7D7D 21 00 01      [10] 4191 	ld	hl,#_g_tablatrans
   7D80 E5            [11] 4192 	push	hl
   7D81 21 45 64      [10] 4193 	ld	hl,#_cu
   7D84 E5            [11] 4194 	push	hl
   7D85 79            [ 4] 4195 	ld	a,c
   7D86 F5            [11] 4196 	push	af
   7D87 33            [ 6] 4197 	inc	sp
   7D88 C5            [11] 4198 	push	bc
   7D89 33            [ 6] 4199 	inc	sp
   7D8A 7B            [ 4] 4200 	ld	a,e
   7D8B F5            [11] 4201 	push	af
   7D8C 33            [ 6] 4202 	inc	sp
   7D8D CD 25 40      [17] 4203 	call	_redibujarCuchillo
   7D90 21 09 00      [10] 4204 	ld	hl,#9
   7D93 39            [11] 4205 	add	hl,sp
   7D94 F9            [ 6] 4206 	ld	sp,hl
   7D95 18 32         [12] 4207 	jr	00115$
   7D97                    4208 00114$:
                           4209 ;src/main.c:794: }else if (cu.lanzado && !cu.mover){
   7D97 79            [ 4] 4210 	ld	a,c
   7D98 B7            [ 4] 4211 	or	a, a
   7D99 28 2E         [12] 4212 	jr	Z,00115$
   7D9B 3A 4E 64      [13] 4213 	ld	a, (#(_cu + 0x0009) + 0)
   7D9E B7            [ 4] 4214 	or	a, a
   7D9F 20 28         [12] 4215 	jr	NZ,00115$
                           4216 ;src/main.c:795: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7DA1 21 46 64      [10] 4217 	ld	hl, #(_cu + 0x0001) + 0
   7DA4 46            [ 7] 4218 	ld	b,(hl)
   7DA5 21 45 64      [10] 4219 	ld	hl, #_cu + 0
   7DA8 4E            [ 7] 4220 	ld	c,(hl)
   7DA9 21 4D 64      [10] 4221 	ld	hl, #(_cu + 0x0008) + 0
   7DAC 56            [ 7] 4222 	ld	d,(hl)
   7DAD 2A 50 64      [16] 4223 	ld	hl,(_mapa)
   7DB0 E5            [11] 4224 	push	hl
   7DB1 C5            [11] 4225 	push	bc
   7DB2 D5            [11] 4226 	push	de
   7DB3 33            [ 6] 4227 	inc	sp
   7DB4 CD 92 3F      [17] 4228 	call	_borrarCuchillo
   7DB7 F1            [10] 4229 	pop	af
   7DB8 F1            [10] 4230 	pop	af
   7DB9 33            [ 6] 4231 	inc	sp
                           4232 ;src/main.c:796: cu.lanzado = NO;
   7DBA 21 4B 64      [10] 4233 	ld	hl,#(_cu + 0x0006)
   7DBD 36 00         [10] 4234 	ld	(hl),#0x00
                           4235 ;src/main.c:797: cu.x = 0;
   7DBF 21 45 64      [10] 4236 	ld	hl,#_cu
   7DC2 36 00         [10] 4237 	ld	(hl),#0x00
                           4238 ;src/main.c:798: cu.y=0;
   7DC4 21 46 64      [10] 4239 	ld	hl,#(_cu + 0x0001)
   7DC7 36 00         [10] 4240 	ld	(hl),#0x00
   7DC9                    4241 00115$:
                           4242 ;src/main.c:801: i = 2 + num_mapa;
   7DC9 3A 52 64      [13] 4243 	ld	a,(#_num_mapa + 0)
   7DCC C6 02         [ 7] 4244 	add	a, #0x02
   7DCE DD 77 FB      [19] 4245 	ld	-5 (ix),a
                           4246 ;src/main.c:802: actual = enemy;
   7DD1 01 B5 60      [10] 4247 	ld	bc,#_enemy
                           4248 ;src/main.c:803: while(i){
   7DD4                    4249 00122$:
   7DD4 DD 7E FB      [19] 4250 	ld	a,-5 (ix)
   7DD7 B7            [ 4] 4251 	or	a, a
   7DD8 CA 87 7E      [10] 4252 	jp	Z,00124$
                           4253 ;src/main.c:805: --i;
   7DDB DD 35 FB      [23] 4254 	dec	-5 (ix)
                           4255 ;src/main.c:806: if(actual->mover){
   7DDE 21 06 00      [10] 4256 	ld	hl,#0x0006
   7DE1 09            [11] 4257 	add	hl,bc
   7DE2 DD 75 FD      [19] 4258 	ld	-3 (ix),l
   7DE5 DD 74 FE      [19] 4259 	ld	-2 (ix),h
   7DE8 DD 6E FD      [19] 4260 	ld	l,-3 (ix)
   7DEB DD 66 FE      [19] 4261 	ld	h,-2 (ix)
   7DEE 7E            [ 7] 4262 	ld	a,(hl)
   7DEF B7            [ 4] 4263 	or	a, a
   7DF0 28 18         [12] 4264 	jr	Z,00118$
                           4265 ;src/main.c:807: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7DF2 69            [ 4] 4266 	ld	l, c
   7DF3 60            [ 4] 4267 	ld	h, b
   7DF4 23            [ 6] 4268 	inc	hl
   7DF5 23            [ 6] 4269 	inc	hl
   7DF6 23            [ 6] 4270 	inc	hl
   7DF7 5E            [ 7] 4271 	ld	e,(hl)
   7DF8 69            [ 4] 4272 	ld	l, c
   7DF9 60            [ 4] 4273 	ld	h, b
   7DFA 23            [ 6] 4274 	inc	hl
   7DFB 23            [ 6] 4275 	inc	hl
   7DFC 56            [ 7] 4276 	ld	d,(hl)
   7DFD C5            [11] 4277 	push	bc
   7DFE C5            [11] 4278 	push	bc
   7DFF 7B            [ 4] 4279 	ld	a,e
   7E00 F5            [11] 4280 	push	af
   7E01 33            [ 6] 4281 	inc	sp
   7E02 D5            [11] 4282 	push	de
   7E03 33            [ 6] 4283 	inc	sp
   7E04 CD 4E 69      [17] 4284 	call	_redibujarEnemigo
   7E07 F1            [10] 4285 	pop	af
   7E08 F1            [10] 4286 	pop	af
   7E09 C1            [10] 4287 	pop	bc
   7E0A                    4288 00118$:
                           4289 ;src/main.c:810: if (actual->muerto && actual->muertes == 0){
   7E0A C5            [11] 4290 	push	bc
   7E0B FD E1         [14] 4291 	pop	iy
   7E0D FD 7E 08      [19] 4292 	ld	a,8 (iy)
   7E10 B7            [ 4] 4293 	or	a, a
   7E11 28 6B         [12] 4294 	jr	Z,00120$
   7E13 21 0A 00      [10] 4295 	ld	hl,#0x000A
   7E16 09            [11] 4296 	add	hl,bc
   7E17 EB            [ 4] 4297 	ex	de,hl
   7E18 1A            [ 7] 4298 	ld	a,(de)
   7E19 B7            [ 4] 4299 	or	a, a
   7E1A 20 62         [12] 4300 	jr	NZ,00120$
                           4301 ;src/main.c:811: borrarEnemigo((*actual).x, (*actual).y);
   7E1C 21 01 00      [10] 4302 	ld	hl,#0x0001
   7E1F 09            [11] 4303 	add	hl,bc
   7E20 E3            [19] 4304 	ex	(sp), hl
   7E21 E1            [10] 4305 	pop	hl
   7E22 E5            [11] 4306 	push	hl
   7E23 7E            [ 7] 4307 	ld	a,(hl)
   7E24 F5            [11] 4308 	push	af
   7E25 0A            [ 7] 4309 	ld	a,(bc)
   7E26 DD 77 FF      [19] 4310 	ld	-1 (ix),a
   7E29 F1            [10] 4311 	pop	af
   7E2A C5            [11] 4312 	push	bc
   7E2B D5            [11] 4313 	push	de
   7E2C F5            [11] 4314 	push	af
   7E2D 33            [ 6] 4315 	inc	sp
   7E2E DD 7E FF      [19] 4316 	ld	a,-1 (ix)
   7E31 F5            [11] 4317 	push	af
   7E32 33            [ 6] 4318 	inc	sp
   7E33 CD D9 68      [17] 4319 	call	_borrarEnemigo
   7E36 F1            [10] 4320 	pop	af
   7E37 D1            [10] 4321 	pop	de
   7E38 C1            [10] 4322 	pop	bc
                           4323 ;src/main.c:812: dibujarExplosion(actual);
   7E39 C5            [11] 4324 	push	bc
   7E3A D5            [11] 4325 	push	de
   7E3B C5            [11] 4326 	push	bc
   7E3C CD 29 68      [17] 4327 	call	_dibujarExplosion
   7E3F F1            [10] 4328 	pop	af
   7E40 D1            [10] 4329 	pop	de
   7E41 C1            [10] 4330 	pop	bc
                           4331 ;src/main.c:813: puntuacion_aux = puntuacion;
   7E42 FD 21 53 64   [14] 4332 	ld	iy,#_puntuacion
   7E46 FD 6E 00      [19] 4333 	ld	l,0 (iy)
   7E49 26 00         [ 7] 4334 	ld	h,#0x00
                           4335 ;src/main.c:814: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7E4B C5            [11] 4336 	push	bc
   7E4C D5            [11] 4337 	push	de
   7E4D E5            [11] 4338 	push	hl
   7E4E CD 6E 53      [17] 4339 	call	_aumentarPuntuacion
   7E51 F1            [10] 4340 	pop	af
   7E52 D1            [10] 4341 	pop	de
   7E53 C1            [10] 4342 	pop	bc
   7E54 FD 21 53 64   [14] 4343 	ld	iy,#_puntuacion
   7E58 FD 75 00      [19] 4344 	ld	0 (iy),l
                           4345 ;src/main.c:815: modificarPuntuacion(puntuacion);
   7E5B FD 21 53 64   [14] 4346 	ld	iy,#_puntuacion
   7E5F FD 6E 00      [19] 4347 	ld	l,0 (iy)
   7E62 26 00         [ 7] 4348 	ld	h,#0x00
   7E64 C5            [11] 4349 	push	bc
   7E65 D5            [11] 4350 	push	de
   7E66 E5            [11] 4351 	push	hl
   7E67 CD 31 52      [17] 4352 	call	_modificarPuntuacion
   7E6A F1            [10] 4353 	pop	af
   7E6B D1            [10] 4354 	pop	de
   7E6C C1            [10] 4355 	pop	bc
                           4356 ;src/main.c:816: actual->mover = NO;
   7E6D DD 6E FD      [19] 4357 	ld	l,-3 (ix)
   7E70 DD 66 FE      [19] 4358 	ld	h,-2 (ix)
   7E73 36 00         [10] 4359 	ld	(hl),#0x00
                           4360 ;src/main.c:817: actual->muertes++;
   7E75 1A            [ 7] 4361 	ld	a,(de)
   7E76 3C            [ 4] 4362 	inc	a
   7E77 12            [ 7] 4363 	ld	(de),a
                           4364 ;src/main.c:818: actual->x = 0;
   7E78 AF            [ 4] 4365 	xor	a, a
   7E79 02            [ 7] 4366 	ld	(bc),a
                           4367 ;src/main.c:819: actual->y = 0;
   7E7A E1            [10] 4368 	pop	hl
   7E7B E5            [11] 4369 	push	hl
   7E7C 36 00         [10] 4370 	ld	(hl),#0x00
   7E7E                    4371 00120$:
                           4372 ;src/main.c:821: ++actual;
   7E7E 21 E2 00      [10] 4373 	ld	hl,#0x00E2
   7E81 09            [11] 4374 	add	hl,bc
   7E82 4D            [ 4] 4375 	ld	c,l
   7E83 44            [ 4] 4376 	ld	b,h
   7E84 C3 D4 7D      [10] 4377 	jp	00122$
   7E87                    4378 00124$:
                           4379 ;src/main.c:823: cpct_waitVSYNC();
   7E87 CD FC 56      [17] 4380 	call	_cpct_waitVSYNC
   7E8A C3 BA 7C      [10] 4381 	jp	00126$
                           4382 	.area _CODE
                           4383 	.area _INITIALIZER
                           4384 	.area _CABS (ABS)
