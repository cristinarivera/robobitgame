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
   662A C2 70 7A      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   662D 21 00 02      [10]  382 	ld	hl,#0x0200
   6630 CD 5B 54      [17]  383 	call	_cpct_isKeyPressed
   6633 7D            [ 4]  384 	ld	a,l
   6634 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   6635 C2 95 7A      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6638 21 00 01      [10]  389 	ld	hl,#0x0100
   663B CD 5B 54      [17]  390 	call	_cpct_isKeyPressed
   663E 7D            [ 4]  391 	ld	a,l
   663F B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   6640 C2 DA 7A      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6643 21 00 04      [10]  396 	ld	hl,#0x0400
   6646 CD 5B 54      [17]  397 	call	_cpct_isKeyPressed
   6649 7D            [ 4]  398 	ld	a,l
   664A B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   664B C2 FE 7A      [10]  401 	jp	NZ,_moverAbajo
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
   6991 DA B4 6A      [10]  990 	jp	C,00134$
                            991 ;src/main.c:235: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6994 DD 4E 05      [19]  992 	ld	c,5 (ix)
   6997 DD 46 06      [19]  993 	ld	b,6 (ix)
   699A 21 01 00      [10]  994 	ld	hl,#0x0001
   699D 09            [11]  995 	add	hl,bc
   699E DD 75 FE      [19]  996 	ld	-2 (ix),l
   69A1 DD 74 FF      [19]  997 	ld	-1 (ix),h
                            998 ;src/main.c:238: enemy->muerto = SI;
   69A4 21 08 00      [10]  999 	ld	hl,#0x0008
   69A7 09            [11] 1000 	add	hl,bc
   69A8 E3            [19] 1001 	ex	(sp), hl
                           1002 ;src/main.c:233: switch (direction) {
   69A9 DD 5E 04      [19] 1003 	ld	e,4 (ix)
   69AC 16 00         [ 7] 1004 	ld	d,#0x00
   69AE 21 B5 69      [10] 1005 	ld	hl,#00178$
   69B1 19            [11] 1006 	add	hl,de
   69B2 19            [11] 1007 	add	hl,de
   69B3 19            [11] 1008 	add	hl,de
   69B4 E9            [ 4] 1009 	jp	(hl)
   69B5                    1010 00178$:
   69B5 C3 2F 6A      [10] 1011 	jp	00109$
   69B8 C3 C1 69      [10] 1012 	jp	00101$
   69BB C3 B4 6A      [10] 1013 	jp	00125$
   69BE C3 9C 6A      [10] 1014 	jp	00117$
                           1015 ;src/main.c:234: case 1:
   69C1                    1016 00101$:
                           1017 ;src/main.c:235: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69C1 21 46 64      [10] 1018 	ld	hl, #_cu + 1
   69C4 5E            [ 7] 1019 	ld	e,(hl)
   69C5 16 00         [ 7] 1020 	ld	d,#0x00
   69C7 21 04 00      [10] 1021 	ld	hl,#0x0004
   69CA 19            [11] 1022 	add	hl,de
   69CB DD 75 FC      [19] 1023 	ld	-4 (ix),l
   69CE DD 74 FD      [19] 1024 	ld	-3 (ix),h
   69D1 DD 6E FE      [19] 1025 	ld	l,-2 (ix)
   69D4 DD 66 FF      [19] 1026 	ld	h,-1 (ix)
   69D7 6E            [ 7] 1027 	ld	l,(hl)
   69D8 26 00         [ 7] 1028 	ld	h,#0x00
   69DA DD 7E FC      [19] 1029 	ld	a,-4 (ix)
   69DD 95            [ 4] 1030 	sub	a, l
   69DE DD 7E FD      [19] 1031 	ld	a,-3 (ix)
   69E1 9C            [ 4] 1032 	sbc	a, h
   69E2 E2 E7 69      [10] 1033 	jp	PO, 00179$
   69E5 EE 80         [ 7] 1034 	xor	a, #0x80
   69E7                    1035 00179$:
   69E7 FA B4 6A      [10] 1036 	jp	M,00134$
   69EA D5            [11] 1037 	push	de
   69EB 11 16 00      [10] 1038 	ld	de,#0x0016
   69EE 19            [11] 1039 	add	hl, de
   69EF D1            [10] 1040 	pop	de
   69F0 7D            [ 4] 1041 	ld	a,l
   69F1 93            [ 4] 1042 	sub	a, e
   69F2 7C            [ 4] 1043 	ld	a,h
   69F3 9A            [ 4] 1044 	sbc	a, d
   69F4 E2 F9 69      [10] 1045 	jp	PO, 00180$
   69F7 EE 80         [ 7] 1046 	xor	a, #0x80
   69F9                    1047 00180$:
   69F9 FA B4 6A      [10] 1048 	jp	M,00134$
                           1049 ;src/main.c:236: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   69FC 21 45 64      [10] 1050 	ld	hl, #_cu + 0
   69FF 5E            [ 7] 1051 	ld	e,(hl)
   6A00 0A            [ 7] 1052 	ld	a,(bc)
   6A01 4F            [ 4] 1053 	ld	c,a
   6A02 06 00         [ 7] 1054 	ld	b,#0x00
   6A04 03            [ 6] 1055 	inc	bc
   6A05 03            [ 6] 1056 	inc	bc
   6A06 03            [ 6] 1057 	inc	bc
   6A07 03            [ 6] 1058 	inc	bc
   6A08 6B            [ 4] 1059 	ld	l,e
   6A09 26 00         [ 7] 1060 	ld	h,#0x00
   6A0B 79            [ 4] 1061 	ld	a,c
   6A0C 95            [ 4] 1062 	sub	a, l
   6A0D 78            [ 4] 1063 	ld	a,b
   6A0E 9C            [ 4] 1064 	sbc	a, h
   6A0F E2 14 6A      [10] 1065 	jp	PO, 00181$
   6A12 EE 80         [ 7] 1066 	xor	a, #0x80
   6A14                    1067 00181$:
   6A14 F2 B4 6A      [10] 1068 	jp	P,00134$
                           1069 ;src/main.c:237: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A17 BF            [ 4] 1070 	cp	a, a
   6A18 ED 42         [15] 1071 	sbc	hl, bc
   6A1A 3E 01         [ 7] 1072 	ld	a,#0x01
   6A1C BD            [ 4] 1073 	cp	a, l
   6A1D 3E 00         [ 7] 1074 	ld	a,#0x00
   6A1F 9C            [ 4] 1075 	sbc	a, h
   6A20 E2 25 6A      [10] 1076 	jp	PO, 00182$
   6A23 EE 80         [ 7] 1077 	xor	a, #0x80
   6A25                    1078 00182$:
   6A25 FA B4 6A      [10] 1079 	jp	M,00134$
                           1080 ;src/main.c:238: enemy->muerto = SI;
   6A28 E1            [10] 1081 	pop	hl
   6A29 E5            [11] 1082 	push	hl
   6A2A 36 01         [10] 1083 	ld	(hl),#0x01
                           1084 ;src/main.c:242: break;
   6A2C C3 B4 6A      [10] 1085 	jp	00134$
                           1086 ;src/main.c:243: case 0:
   6A2F                    1087 00109$:
                           1088 ;src/main.c:244: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A2F 21 46 64      [10] 1089 	ld	hl, #_cu + 1
   6A32 5E            [ 7] 1090 	ld	e,(hl)
   6A33 16 00         [ 7] 1091 	ld	d,#0x00
   6A35 21 04 00      [10] 1092 	ld	hl,#0x0004
   6A38 19            [11] 1093 	add	hl,de
   6A39 DD 75 FC      [19] 1094 	ld	-4 (ix),l
   6A3C DD 74 FD      [19] 1095 	ld	-3 (ix),h
   6A3F DD 6E FE      [19] 1096 	ld	l,-2 (ix)
   6A42 DD 66 FF      [19] 1097 	ld	h,-1 (ix)
   6A45 6E            [ 7] 1098 	ld	l,(hl)
   6A46 26 00         [ 7] 1099 	ld	h,#0x00
   6A48 DD 7E FC      [19] 1100 	ld	a,-4 (ix)
   6A4B 95            [ 4] 1101 	sub	a, l
   6A4C DD 7E FD      [19] 1102 	ld	a,-3 (ix)
   6A4F 9C            [ 4] 1103 	sbc	a, h
   6A50 E2 55 6A      [10] 1104 	jp	PO, 00183$
   6A53 EE 80         [ 7] 1105 	xor	a, #0x80
   6A55                    1106 00183$:
   6A55 FA B4 6A      [10] 1107 	jp	M,00134$
   6A58 D5            [11] 1108 	push	de
   6A59 11 16 00      [10] 1109 	ld	de,#0x0016
   6A5C 19            [11] 1110 	add	hl, de
   6A5D D1            [10] 1111 	pop	de
   6A5E 7D            [ 4] 1112 	ld	a,l
   6A5F 93            [ 4] 1113 	sub	a, e
   6A60 7C            [ 4] 1114 	ld	a,h
   6A61 9A            [ 4] 1115 	sbc	a, d
   6A62 E2 67 6A      [10] 1116 	jp	PO, 00184$
   6A65 EE 80         [ 7] 1117 	xor	a, #0x80
   6A67                    1118 00184$:
   6A67 FA B4 6A      [10] 1119 	jp	M,00134$
                           1120 ;src/main.c:245: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   6A6A 0A            [ 7] 1121 	ld	a,(bc)
   6A6B 5F            [ 4] 1122 	ld	e,a
   6A6C 21 45 64      [10] 1123 	ld	hl, #_cu + 0
   6A6F 4E            [ 7] 1124 	ld	c,(hl)
   6A70 06 00         [ 7] 1125 	ld	b,#0x00
   6A72 03            [ 6] 1126 	inc	bc
   6A73 03            [ 6] 1127 	inc	bc
   6A74 03            [ 6] 1128 	inc	bc
   6A75 03            [ 6] 1129 	inc	bc
   6A76 6B            [ 4] 1130 	ld	l,e
   6A77 26 00         [ 7] 1131 	ld	h,#0x00
   6A79 79            [ 4] 1132 	ld	a,c
   6A7A 95            [ 4] 1133 	sub	a, l
   6A7B 78            [ 4] 1134 	ld	a,b
   6A7C 9C            [ 4] 1135 	sbc	a, h
   6A7D E2 82 6A      [10] 1136 	jp	PO, 00185$
   6A80 EE 80         [ 7] 1137 	xor	a, #0x80
   6A82                    1138 00185$:
   6A82 F2 B4 6A      [10] 1139 	jp	P,00134$
                           1140 ;src/main.c:246: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A85 BF            [ 4] 1141 	cp	a, a
   6A86 ED 42         [15] 1142 	sbc	hl, bc
   6A88 3E 01         [ 7] 1143 	ld	a,#0x01
   6A8A BD            [ 4] 1144 	cp	a, l
   6A8B 3E 00         [ 7] 1145 	ld	a,#0x00
   6A8D 9C            [ 4] 1146 	sbc	a, h
   6A8E E2 93 6A      [10] 1147 	jp	PO, 00186$
   6A91 EE 80         [ 7] 1148 	xor	a, #0x80
   6A93                    1149 00186$:
   6A93 FA B4 6A      [10] 1150 	jp	M,00134$
                           1151 ;src/main.c:247: enemy->muerto = SI;
   6A96 E1            [10] 1152 	pop	hl
   6A97 E5            [11] 1153 	push	hl
   6A98 36 01         [10] 1154 	ld	(hl),#0x01
                           1155 ;src/main.c:251: break;
   6A9A 18 18         [12] 1156 	jr	00134$
                           1157 ;src/main.c:252: case 3:
   6A9C                    1158 00117$:
                           1159 ;src/main.c:253: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6A9C 21 45 64      [10] 1160 	ld	hl,#_cu+0
   6A9F 5E            [ 7] 1161 	ld	e,(hl)
   6AA0 16 00         [ 7] 1162 	ld	d,#0x00
   6AA2 13            [ 6] 1163 	inc	de
   6AA3 13            [ 6] 1164 	inc	de
   6AA4 0A            [ 7] 1165 	ld	a,(bc)
   6AA5 4F            [ 4] 1166 	ld	c,a
   6AA6 06 00         [ 7] 1167 	ld	b,#0x00
   6AA8 7B            [ 4] 1168 	ld	a,e
   6AA9 91            [ 4] 1169 	sub	a, c
   6AAA 7A            [ 4] 1170 	ld	a,d
   6AAB 98            [ 4] 1171 	sbc	a, b
   6AAC E2 B1 6A      [10] 1172 	jp	PO, 00187$
   6AAF EE 80         [ 7] 1173 	xor	a, #0x80
   6AB1                    1174 00187$:
   6AB1 07            [ 4] 1175 	rlca
   6AB2 E6 01         [ 7] 1176 	and	a,#0x01
                           1177 ;src/main.c:260: break;
                           1178 ;src/main.c:261: case 2:
                           1179 ;src/main.c:271: }
   6AB4                    1180 00125$:
   6AB4                    1181 00134$:
   6AB4 DD F9         [10] 1182 	ld	sp, ix
   6AB6 DD E1         [14] 1183 	pop	ix
   6AB8 C9            [10] 1184 	ret
                           1185 ;src/main.c:274: void moverEnemigoArriba(TEnemy *enemy){
                           1186 ;	---------------------------------
                           1187 ; Function moverEnemigoArriba
                           1188 ; ---------------------------------
   6AB9                    1189 _moverEnemigoArriba::
   6AB9 DD E5         [15] 1190 	push	ix
   6ABB DD 21 00 00   [14] 1191 	ld	ix,#0
   6ABF DD 39         [15] 1192 	add	ix,sp
                           1193 ;src/main.c:275: enemy->y--;
   6AC1 DD 4E 04      [19] 1194 	ld	c,4 (ix)
   6AC4 DD 46 05      [19] 1195 	ld	b,5 (ix)
   6AC7 69            [ 4] 1196 	ld	l, c
   6AC8 60            [ 4] 1197 	ld	h, b
   6AC9 23            [ 6] 1198 	inc	hl
   6ACA 5E            [ 7] 1199 	ld	e,(hl)
   6ACB 1D            [ 4] 1200 	dec	e
   6ACC 73            [ 7] 1201 	ld	(hl),e
                           1202 ;src/main.c:276: enemy->y--;
   6ACD 1D            [ 4] 1203 	dec	e
   6ACE 73            [ 7] 1204 	ld	(hl),e
                           1205 ;src/main.c:277: enemy->mover = SI;
   6ACF 21 06 00      [10] 1206 	ld	hl,#0x0006
   6AD2 09            [11] 1207 	add	hl,bc
   6AD3 36 01         [10] 1208 	ld	(hl),#0x01
   6AD5 DD E1         [14] 1209 	pop	ix
   6AD7 C9            [10] 1210 	ret
                           1211 ;src/main.c:280: void moverEnemigoAbajo(TEnemy *enemy){
                           1212 ;	---------------------------------
                           1213 ; Function moverEnemigoAbajo
                           1214 ; ---------------------------------
   6AD8                    1215 _moverEnemigoAbajo::
   6AD8 DD E5         [15] 1216 	push	ix
   6ADA DD 21 00 00   [14] 1217 	ld	ix,#0
   6ADE DD 39         [15] 1218 	add	ix,sp
                           1219 ;src/main.c:281: enemy->y++;
   6AE0 DD 4E 04      [19] 1220 	ld	c,4 (ix)
   6AE3 DD 46 05      [19] 1221 	ld	b,5 (ix)
   6AE6 59            [ 4] 1222 	ld	e, c
   6AE7 50            [ 4] 1223 	ld	d, b
   6AE8 13            [ 6] 1224 	inc	de
   6AE9 1A            [ 7] 1225 	ld	a,(de)
   6AEA 3C            [ 4] 1226 	inc	a
   6AEB 12            [ 7] 1227 	ld	(de),a
                           1228 ;src/main.c:282: enemy->y++;
   6AEC 3C            [ 4] 1229 	inc	a
   6AED 12            [ 7] 1230 	ld	(de),a
                           1231 ;src/main.c:283: enemy->mover = SI;
   6AEE 21 06 00      [10] 1232 	ld	hl,#0x0006
   6AF1 09            [11] 1233 	add	hl,bc
   6AF2 36 01         [10] 1234 	ld	(hl),#0x01
   6AF4 DD E1         [14] 1235 	pop	ix
   6AF6 C9            [10] 1236 	ret
                           1237 ;src/main.c:286: void moverEnemigoDerecha(TEnemy *enemy){
                           1238 ;	---------------------------------
                           1239 ; Function moverEnemigoDerecha
                           1240 ; ---------------------------------
   6AF7                    1241 _moverEnemigoDerecha::
                           1242 ;src/main.c:287: enemy->x++;
   6AF7 D1            [10] 1243 	pop	de
   6AF8 C1            [10] 1244 	pop	bc
   6AF9 C5            [11] 1245 	push	bc
   6AFA D5            [11] 1246 	push	de
   6AFB 0A            [ 7] 1247 	ld	a,(bc)
   6AFC 3C            [ 4] 1248 	inc	a
   6AFD 02            [ 7] 1249 	ld	(bc),a
                           1250 ;src/main.c:288: enemy->x++;
   6AFE 3C            [ 4] 1251 	inc	a
   6AFF 02            [ 7] 1252 	ld	(bc),a
                           1253 ;src/main.c:289: enemy->mover = SI;
   6B00 21 06 00      [10] 1254 	ld	hl,#0x0006
   6B03 09            [11] 1255 	add	hl,bc
   6B04 36 01         [10] 1256 	ld	(hl),#0x01
   6B06 C9            [10] 1257 	ret
                           1258 ;src/main.c:292: void moverEnemigoIzquierda(TEnemy *enemy){
                           1259 ;	---------------------------------
                           1260 ; Function moverEnemigoIzquierda
                           1261 ; ---------------------------------
   6B07                    1262 _moverEnemigoIzquierda::
                           1263 ;src/main.c:293: enemy->x--;
   6B07 D1            [10] 1264 	pop	de
   6B08 C1            [10] 1265 	pop	bc
   6B09 C5            [11] 1266 	push	bc
   6B0A D5            [11] 1267 	push	de
   6B0B 0A            [ 7] 1268 	ld	a,(bc)
   6B0C C6 FF         [ 7] 1269 	add	a,#0xFF
   6B0E 02            [ 7] 1270 	ld	(bc),a
                           1271 ;src/main.c:294: enemy->x--;
   6B0F C6 FF         [ 7] 1272 	add	a,#0xFF
   6B11 02            [ 7] 1273 	ld	(bc),a
                           1274 ;src/main.c:295: enemy->mover = SI;
   6B12 21 06 00      [10] 1275 	ld	hl,#0x0006
   6B15 09            [11] 1276 	add	hl,bc
   6B16 36 01         [10] 1277 	ld	(hl),#0x01
   6B18 C9            [10] 1278 	ret
                           1279 ;src/main.c:298: void moverEnemigoPatrol(TEnemy* enemy){
                           1280 ;	---------------------------------
                           1281 ; Function moverEnemigoPatrol
                           1282 ; ---------------------------------
   6B19                    1283 _moverEnemigoPatrol::
   6B19 DD E5         [15] 1284 	push	ix
   6B1B DD 21 00 00   [14] 1285 	ld	ix,#0
   6B1F DD 39         [15] 1286 	add	ix,sp
   6B21 21 F3 FF      [10] 1287 	ld	hl,#-13
   6B24 39            [11] 1288 	add	hl,sp
   6B25 F9            [ 6] 1289 	ld	sp,hl
                           1290 ;src/main.c:300: if(!enemy->muerto){
   6B26 DD 4E 04      [19] 1291 	ld	c,4 (ix)
   6B29 DD 46 05      [19] 1292 	ld	b,5 (ix)
   6B2C C5            [11] 1293 	push	bc
   6B2D FD E1         [14] 1294 	pop	iy
   6B2F FD 7E 08      [19] 1295 	ld	a,8 (iy)
   6B32 B7            [ 4] 1296 	or	a, a
   6B33 C2 72 6D      [10] 1297 	jp	NZ,00118$
                           1298 ;src/main.c:301: if (!enemy->reversePatrol) {
   6B36 21 0C 00      [10] 1299 	ld	hl,#0x000C
   6B39 09            [11] 1300 	add	hl,bc
   6B3A DD 75 F4      [19] 1301 	ld	-12 (ix),l
   6B3D DD 74 F5      [19] 1302 	ld	-11 (ix),h
   6B40 DD 6E F4      [19] 1303 	ld	l,-12 (ix)
   6B43 DD 66 F5      [19] 1304 	ld	h,-11 (ix)
   6B46 7E            [ 7] 1305 	ld	a,(hl)
   6B47 DD 77 F3      [19] 1306 	ld	-13 (ix),a
                           1307 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6B4A 21 0E 00      [10] 1308 	ld	hl,#0x000E
   6B4D 09            [11] 1309 	add	hl,bc
   6B4E DD 75 F8      [19] 1310 	ld	-8 (ix),l
   6B51 DD 74 F9      [19] 1311 	ld	-7 (ix),h
   6B54 DD 6E F8      [19] 1312 	ld	l,-8 (ix)
   6B57 DD 66 F9      [19] 1313 	ld	h,-7 (ix)
   6B5A 5E            [ 7] 1314 	ld	e,(hl)
   6B5B 23            [ 6] 1315 	inc	hl
   6B5C 56            [ 7] 1316 	ld	d,(hl)
   6B5D 21 E1 00      [10] 1317 	ld	hl,#0x00E1
   6B60 09            [11] 1318 	add	hl,bc
   6B61 DD 75 FA      [19] 1319 	ld	-6 (ix),l
   6B64 DD 74 FB      [19] 1320 	ld	-5 (ix),h
                           1321 ;src/main.c:304: enemy->mover = SI;
   6B67 21 06 00      [10] 1322 	ld	hl,#0x0006
   6B6A 09            [11] 1323 	add	hl,bc
   6B6B DD 75 FE      [19] 1324 	ld	-2 (ix),l
   6B6E DD 74 FF      [19] 1325 	ld	-1 (ix),h
                           1326 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6B71 21 19 00      [10] 1327 	ld	hl,#0x0019
   6B74 09            [11] 1328 	add	hl,bc
   6B75 DD 75 F6      [19] 1329 	ld	-10 (ix),l
   6B78 DD 74 F7      [19] 1330 	ld	-9 (ix),h
                           1331 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6B7B 21 01 00      [10] 1332 	ld	hl,#0x0001
   6B7E 09            [11] 1333 	add	hl,bc
   6B7F DD 75 FC      [19] 1334 	ld	-4 (ix),l
   6B82 DD 74 FD      [19] 1335 	ld	-3 (ix),h
                           1336 ;src/main.c:301: if (!enemy->reversePatrol) {
   6B85 DD 7E F3      [19] 1337 	ld	a,-13 (ix)
   6B88 B7            [ 4] 1338 	or	a, a
   6B89 C2 68 6C      [10] 1339 	jp	NZ,00114$
                           1340 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6B8C DD 6E FA      [19] 1341 	ld	l,-6 (ix)
   6B8F DD 66 FB      [19] 1342 	ld	h,-5 (ix)
   6B92 6E            [ 7] 1343 	ld	l,(hl)
   6B93 26 00         [ 7] 1344 	ld	h,#0x00
   6B95 7B            [ 4] 1345 	ld	a,e
   6B96 95            [ 4] 1346 	sub	a, l
   6B97 7A            [ 4] 1347 	ld	a,d
   6B98 9C            [ 4] 1348 	sbc	a, h
   6B99 E2 9E 6B      [10] 1349 	jp	PO, 00144$
   6B9C EE 80         [ 7] 1350 	xor	a, #0x80
   6B9E                    1351 00144$:
   6B9E F2 43 6C      [10] 1352 	jp	P,00105$
                           1353 ;src/main.c:303: if(enemy->iter == 0){
   6BA1 7A            [ 4] 1354 	ld	a,d
   6BA2 B3            [ 4] 1355 	or	a,e
   6BA3 20 54         [12] 1356 	jr	NZ,00102$
                           1357 ;src/main.c:304: enemy->mover = SI;
   6BA5 DD 6E FE      [19] 1358 	ld	l,-2 (ix)
   6BA8 DD 66 FF      [19] 1359 	ld	h,-1 (ix)
   6BAB 36 01         [10] 1360 	ld	(hl),#0x01
                           1361 ;src/main.c:305: enemy->iter = 2;
   6BAD DD 6E F8      [19] 1362 	ld	l,-8 (ix)
   6BB0 DD 66 F9      [19] 1363 	ld	h,-7 (ix)
   6BB3 36 02         [10] 1364 	ld	(hl),#0x02
   6BB5 23            [ 6] 1365 	inc	hl
   6BB6 36 00         [10] 1366 	ld	(hl),#0x00
                           1367 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6BB8 DD 6E F8      [19] 1368 	ld	l,-8 (ix)
   6BBB DD 66 F9      [19] 1369 	ld	h,-7 (ix)
   6BBE 5E            [ 7] 1370 	ld	e,(hl)
   6BBF 23            [ 6] 1371 	inc	hl
   6BC0 56            [ 7] 1372 	ld	d,(hl)
   6BC1 DD 6E F6      [19] 1373 	ld	l,-10 (ix)
   6BC4 DD 66 F7      [19] 1374 	ld	h,-9 (ix)
   6BC7 19            [11] 1375 	add	hl,de
   6BC8 7E            [ 7] 1376 	ld	a,(hl)
   6BC9 02            [ 7] 1377 	ld	(bc),a
                           1378 ;src/main.c:307: ++enemy->iter;
   6BCA DD 6E F8      [19] 1379 	ld	l,-8 (ix)
   6BCD DD 66 F9      [19] 1380 	ld	h,-7 (ix)
   6BD0 4E            [ 7] 1381 	ld	c,(hl)
   6BD1 23            [ 6] 1382 	inc	hl
   6BD2 46            [ 7] 1383 	ld	b,(hl)
   6BD3 03            [ 6] 1384 	inc	bc
   6BD4 DD 6E F8      [19] 1385 	ld	l,-8 (ix)
   6BD7 DD 66 F9      [19] 1386 	ld	h,-7 (ix)
   6BDA 71            [ 7] 1387 	ld	(hl),c
   6BDB 23            [ 6] 1388 	inc	hl
   6BDC 70            [ 7] 1389 	ld	(hl),b
                           1390 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6BDD DD 6E F6      [19] 1391 	ld	l,-10 (ix)
   6BE0 DD 66 F7      [19] 1392 	ld	h,-9 (ix)
   6BE3 09            [11] 1393 	add	hl,bc
   6BE4 5E            [ 7] 1394 	ld	e,(hl)
   6BE5 DD 6E FC      [19] 1395 	ld	l,-4 (ix)
   6BE8 DD 66 FD      [19] 1396 	ld	h,-3 (ix)
   6BEB 73            [ 7] 1397 	ld	(hl),e
                           1398 ;src/main.c:309: ++enemy->iter;
   6BEC 03            [ 6] 1399 	inc	bc
   6BED DD 6E F8      [19] 1400 	ld	l,-8 (ix)
   6BF0 DD 66 F9      [19] 1401 	ld	h,-7 (ix)
   6BF3 71            [ 7] 1402 	ld	(hl),c
   6BF4 23            [ 6] 1403 	inc	hl
   6BF5 70            [ 7] 1404 	ld	(hl),b
   6BF6 C3 72 6D      [10] 1405 	jp	00118$
   6BF9                    1406 00102$:
                           1407 ;src/main.c:311: enemy->mover = SI;
   6BF9 DD 6E FE      [19] 1408 	ld	l,-2 (ix)
   6BFC DD 66 FF      [19] 1409 	ld	h,-1 (ix)
   6BFF 36 01         [10] 1410 	ld	(hl),#0x01
                           1411 ;src/main.c:312: enemy->x = enemy->camino[enemy->iter];
   6C01 DD 6E F8      [19] 1412 	ld	l,-8 (ix)
   6C04 DD 66 F9      [19] 1413 	ld	h,-7 (ix)
   6C07 5E            [ 7] 1414 	ld	e,(hl)
   6C08 23            [ 6] 1415 	inc	hl
   6C09 56            [ 7] 1416 	ld	d,(hl)
   6C0A DD 6E F6      [19] 1417 	ld	l,-10 (ix)
   6C0D DD 66 F7      [19] 1418 	ld	h,-9 (ix)
   6C10 19            [11] 1419 	add	hl,de
   6C11 7E            [ 7] 1420 	ld	a,(hl)
   6C12 02            [ 7] 1421 	ld	(bc),a
                           1422 ;src/main.c:313: ++enemy->iter;
   6C13 DD 6E F8      [19] 1423 	ld	l,-8 (ix)
   6C16 DD 66 F9      [19] 1424 	ld	h,-7 (ix)
   6C19 5E            [ 7] 1425 	ld	e,(hl)
   6C1A 23            [ 6] 1426 	inc	hl
   6C1B 56            [ 7] 1427 	ld	d,(hl)
   6C1C 13            [ 6] 1428 	inc	de
   6C1D DD 6E F8      [19] 1429 	ld	l,-8 (ix)
   6C20 DD 66 F9      [19] 1430 	ld	h,-7 (ix)
   6C23 73            [ 7] 1431 	ld	(hl),e
   6C24 23            [ 6] 1432 	inc	hl
   6C25 72            [ 7] 1433 	ld	(hl),d
                           1434 ;src/main.c:314: enemy->y = enemy->camino[enemy->iter];
   6C26 DD 6E F6      [19] 1435 	ld	l,-10 (ix)
   6C29 DD 66 F7      [19] 1436 	ld	h,-9 (ix)
   6C2C 19            [11] 1437 	add	hl,de
   6C2D 7E            [ 7] 1438 	ld	a,(hl)
   6C2E DD 6E FC      [19] 1439 	ld	l,-4 (ix)
   6C31 DD 66 FD      [19] 1440 	ld	h,-3 (ix)
   6C34 77            [ 7] 1441 	ld	(hl),a
                           1442 ;src/main.c:315: ++enemy->iter;
   6C35 13            [ 6] 1443 	inc	de
   6C36 4B            [ 4] 1444 	ld	c,e
   6C37 DD 6E F8      [19] 1445 	ld	l,-8 (ix)
   6C3A DD 66 F9      [19] 1446 	ld	h,-7 (ix)
   6C3D 71            [ 7] 1447 	ld	(hl),c
   6C3E 23            [ 6] 1448 	inc	hl
   6C3F 72            [ 7] 1449 	ld	(hl),d
   6C40 C3 72 6D      [10] 1450 	jp	00118$
   6C43                    1451 00105$:
                           1452 ;src/main.c:319: enemy->mover = NO;
   6C43 DD 6E FE      [19] 1453 	ld	l,-2 (ix)
   6C46 DD 66 FF      [19] 1454 	ld	h,-1 (ix)
   6C49 36 00         [10] 1455 	ld	(hl),#0x00
                           1456 ;src/main.c:320: enemy->iter = enemy->longitud_camino;
   6C4B DD 6E FA      [19] 1457 	ld	l,-6 (ix)
   6C4E DD 66 FB      [19] 1458 	ld	h,-5 (ix)
   6C51 4E            [ 7] 1459 	ld	c,(hl)
   6C52 06 00         [ 7] 1460 	ld	b,#0x00
   6C54 DD 6E F8      [19] 1461 	ld	l,-8 (ix)
   6C57 DD 66 F9      [19] 1462 	ld	h,-7 (ix)
   6C5A 71            [ 7] 1463 	ld	(hl),c
   6C5B 23            [ 6] 1464 	inc	hl
   6C5C 70            [ 7] 1465 	ld	(hl),b
                           1466 ;src/main.c:321: enemy->reversePatrol = 1;
   6C5D DD 6E F4      [19] 1467 	ld	l,-12 (ix)
   6C60 DD 66 F5      [19] 1468 	ld	h,-11 (ix)
   6C63 36 01         [10] 1469 	ld	(hl),#0x01
   6C65 C3 72 6D      [10] 1470 	jp	00118$
   6C68                    1471 00114$:
                           1472 ;src/main.c:324: if(enemy->iter > 0){
   6C68 AF            [ 4] 1473 	xor	a, a
   6C69 BB            [ 4] 1474 	cp	a, e
   6C6A 9A            [ 4] 1475 	sbc	a, d
   6C6B E2 70 6C      [10] 1476 	jp	PO, 00145$
   6C6E EE 80         [ 7] 1477 	xor	a, #0x80
   6C70                    1478 00145$:
   6C70 F2 58 6D      [10] 1479 	jp	P,00111$
                           1480 ;src/main.c:325: if(enemy->iter == enemy->longitud_camino){
   6C73 DD 6E FA      [19] 1481 	ld	l,-6 (ix)
   6C76 DD 66 FB      [19] 1482 	ld	h,-5 (ix)
   6C79 6E            [ 7] 1483 	ld	l,(hl)
   6C7A DD 75 FA      [19] 1484 	ld	-6 (ix),l
   6C7D DD 36 FB 00   [19] 1485 	ld	-5 (ix),#0x00
   6C81 7B            [ 4] 1486 	ld	a,e
   6C82 DD 96 FA      [19] 1487 	sub	a, -6 (ix)
   6C85 C2 10 6D      [10] 1488 	jp	NZ,00108$
   6C88 7A            [ 4] 1489 	ld	a,d
   6C89 DD 96 FB      [19] 1490 	sub	a, -5 (ix)
   6C8C C2 10 6D      [10] 1491 	jp	NZ,00108$
                           1492 ;src/main.c:326: enemy->mover = SI;
   6C8F DD 6E FE      [19] 1493 	ld	l,-2 (ix)
   6C92 DD 66 FF      [19] 1494 	ld	h,-1 (ix)
   6C95 36 01         [10] 1495 	ld	(hl),#0x01
                           1496 ;src/main.c:327: enemy->iter = enemy->iter - 1;
   6C97 DD 6E F8      [19] 1497 	ld	l,-8 (ix)
   6C9A DD 66 F9      [19] 1498 	ld	h,-7 (ix)
   6C9D 5E            [ 7] 1499 	ld	e,(hl)
   6C9E 23            [ 6] 1500 	inc	hl
   6C9F 56            [ 7] 1501 	ld	d,(hl)
   6CA0 7B            [ 4] 1502 	ld	a,e
   6CA1 C6 FF         [ 7] 1503 	add	a,#0xFF
   6CA3 DD 77 FA      [19] 1504 	ld	-6 (ix),a
   6CA6 7A            [ 4] 1505 	ld	a,d
   6CA7 CE FF         [ 7] 1506 	adc	a,#0xFF
   6CA9 DD 77 FB      [19] 1507 	ld	-5 (ix),a
   6CAC DD 6E F8      [19] 1508 	ld	l,-8 (ix)
   6CAF DD 66 F9      [19] 1509 	ld	h,-7 (ix)
   6CB2 DD 7E FA      [19] 1510 	ld	a,-6 (ix)
   6CB5 77            [ 7] 1511 	ld	(hl),a
   6CB6 23            [ 6] 1512 	inc	hl
   6CB7 DD 7E FB      [19] 1513 	ld	a,-5 (ix)
   6CBA 77            [ 7] 1514 	ld	(hl),a
                           1515 ;src/main.c:328: enemy->iter = enemy->iter - 2;
   6CBB DD 5E FA      [19] 1516 	ld	e,-6 (ix)
   6CBE DD 56 FB      [19] 1517 	ld	d,-5 (ix)
   6CC1 1B            [ 6] 1518 	dec	de
   6CC2 1B            [ 6] 1519 	dec	de
   6CC3 DD 6E F8      [19] 1520 	ld	l,-8 (ix)
   6CC6 DD 66 F9      [19] 1521 	ld	h,-7 (ix)
   6CC9 73            [ 7] 1522 	ld	(hl),e
   6CCA 23            [ 6] 1523 	inc	hl
   6CCB 72            [ 7] 1524 	ld	(hl),d
                           1525 ;src/main.c:329: enemy->y = enemy->camino[enemy->iter];
   6CCC DD 6E F6      [19] 1526 	ld	l,-10 (ix)
   6CCF DD 66 F7      [19] 1527 	ld	h,-9 (ix)
   6CD2 19            [11] 1528 	add	hl,de
   6CD3 5E            [ 7] 1529 	ld	e,(hl)
   6CD4 DD 6E FC      [19] 1530 	ld	l,-4 (ix)
   6CD7 DD 66 FD      [19] 1531 	ld	h,-3 (ix)
   6CDA 73            [ 7] 1532 	ld	(hl),e
                           1533 ;src/main.c:330: --enemy->iter;
   6CDB DD 7E FA      [19] 1534 	ld	a,-6 (ix)
   6CDE C6 FD         [ 7] 1535 	add	a,#0xFD
   6CE0 5F            [ 4] 1536 	ld	e,a
   6CE1 DD 7E FB      [19] 1537 	ld	a,-5 (ix)
   6CE4 CE FF         [ 7] 1538 	adc	a,#0xFF
   6CE6 57            [ 4] 1539 	ld	d,a
   6CE7 DD 6E F8      [19] 1540 	ld	l,-8 (ix)
   6CEA DD 66 F9      [19] 1541 	ld	h,-7 (ix)
   6CED 73            [ 7] 1542 	ld	(hl),e
   6CEE 23            [ 6] 1543 	inc	hl
   6CEF 72            [ 7] 1544 	ld	(hl),d
                           1545 ;src/main.c:331: enemy->x = enemy->camino[enemy->iter];
   6CF0 DD 6E F6      [19] 1546 	ld	l,-10 (ix)
   6CF3 DD 66 F7      [19] 1547 	ld	h,-9 (ix)
   6CF6 19            [11] 1548 	add	hl,de
   6CF7 7E            [ 7] 1549 	ld	a,(hl)
   6CF8 02            [ 7] 1550 	ld	(bc),a
                           1551 ;src/main.c:332: --enemy->iter;
   6CF9 DD 7E FA      [19] 1552 	ld	a,-6 (ix)
   6CFC C6 FC         [ 7] 1553 	add	a,#0xFC
   6CFE 4F            [ 4] 1554 	ld	c,a
   6CFF DD 7E FB      [19] 1555 	ld	a,-5 (ix)
   6D02 CE FF         [ 7] 1556 	adc	a,#0xFF
   6D04 47            [ 4] 1557 	ld	b,a
   6D05 DD 6E F8      [19] 1558 	ld	l,-8 (ix)
   6D08 DD 66 F9      [19] 1559 	ld	h,-7 (ix)
   6D0B 71            [ 7] 1560 	ld	(hl),c
   6D0C 23            [ 6] 1561 	inc	hl
   6D0D 70            [ 7] 1562 	ld	(hl),b
   6D0E 18 62         [12] 1563 	jr	00118$
   6D10                    1564 00108$:
                           1565 ;src/main.c:334: enemy->mover = SI;
   6D10 DD 6E FE      [19] 1566 	ld	l,-2 (ix)
   6D13 DD 66 FF      [19] 1567 	ld	h,-1 (ix)
   6D16 36 01         [10] 1568 	ld	(hl),#0x01
                           1569 ;src/main.c:335: enemy->y = enemy->camino[enemy->iter];
   6D18 DD 6E F8      [19] 1570 	ld	l,-8 (ix)
   6D1B DD 66 F9      [19] 1571 	ld	h,-7 (ix)
   6D1E 5E            [ 7] 1572 	ld	e,(hl)
   6D1F 23            [ 6] 1573 	inc	hl
   6D20 56            [ 7] 1574 	ld	d,(hl)
   6D21 DD 6E F6      [19] 1575 	ld	l,-10 (ix)
   6D24 DD 66 F7      [19] 1576 	ld	h,-9 (ix)
   6D27 19            [11] 1577 	add	hl,de
   6D28 5E            [ 7] 1578 	ld	e,(hl)
   6D29 DD 6E FC      [19] 1579 	ld	l,-4 (ix)
   6D2C DD 66 FD      [19] 1580 	ld	h,-3 (ix)
   6D2F 73            [ 7] 1581 	ld	(hl),e
                           1582 ;src/main.c:336: --enemy->iter;
   6D30 DD 6E F8      [19] 1583 	ld	l,-8 (ix)
   6D33 DD 66 F9      [19] 1584 	ld	h,-7 (ix)
   6D36 5E            [ 7] 1585 	ld	e,(hl)
   6D37 23            [ 6] 1586 	inc	hl
   6D38 56            [ 7] 1587 	ld	d,(hl)
   6D39 1B            [ 6] 1588 	dec	de
   6D3A DD 6E F8      [19] 1589 	ld	l,-8 (ix)
   6D3D DD 66 F9      [19] 1590 	ld	h,-7 (ix)
   6D40 73            [ 7] 1591 	ld	(hl),e
   6D41 23            [ 6] 1592 	inc	hl
   6D42 72            [ 7] 1593 	ld	(hl),d
                           1594 ;src/main.c:337: enemy->x = enemy->camino[enemy->iter];
   6D43 DD 6E F6      [19] 1595 	ld	l,-10 (ix)
   6D46 DD 66 F7      [19] 1596 	ld	h,-9 (ix)
   6D49 19            [11] 1597 	add	hl,de
   6D4A 7E            [ 7] 1598 	ld	a,(hl)
   6D4B 02            [ 7] 1599 	ld	(bc),a
                           1600 ;src/main.c:338: --enemy->iter;
   6D4C 1B            [ 6] 1601 	dec	de
   6D4D DD 6E F8      [19] 1602 	ld	l,-8 (ix)
   6D50 DD 66 F9      [19] 1603 	ld	h,-7 (ix)
   6D53 73            [ 7] 1604 	ld	(hl),e
   6D54 23            [ 6] 1605 	inc	hl
   6D55 72            [ 7] 1606 	ld	(hl),d
   6D56 18 1A         [12] 1607 	jr	00118$
   6D58                    1608 00111$:
                           1609 ;src/main.c:342: enemy->mover = NO;
   6D58 DD 6E FE      [19] 1610 	ld	l,-2 (ix)
   6D5B DD 66 FF      [19] 1611 	ld	h,-1 (ix)
   6D5E 36 00         [10] 1612 	ld	(hl),#0x00
                           1613 ;src/main.c:343: enemy->iter = 0;
   6D60 DD 6E F8      [19] 1614 	ld	l,-8 (ix)
   6D63 DD 66 F9      [19] 1615 	ld	h,-7 (ix)
   6D66 AF            [ 4] 1616 	xor	a, a
   6D67 77            [ 7] 1617 	ld	(hl), a
   6D68 23            [ 6] 1618 	inc	hl
   6D69 77            [ 7] 1619 	ld	(hl), a
                           1620 ;src/main.c:344: enemy->reversePatrol = 0;
   6D6A DD 6E F4      [19] 1621 	ld	l,-12 (ix)
   6D6D DD 66 F5      [19] 1622 	ld	h,-11 (ix)
   6D70 36 00         [10] 1623 	ld	(hl),#0x00
   6D72                    1624 00118$:
   6D72 DD F9         [10] 1625 	ld	sp, ix
   6D74 DD E1         [14] 1626 	pop	ix
   6D76 C9            [10] 1627 	ret
                           1628 ;src/main.c:350: void lookFor(TEnemy* enemy){
                           1629 ;	---------------------------------
                           1630 ; Function lookFor
                           1631 ; ---------------------------------
   6D77                    1632 _lookFor::
   6D77 DD E5         [15] 1633 	push	ix
   6D79 DD 21 00 00   [14] 1634 	ld	ix,#0
   6D7D DD 39         [15] 1635 	add	ix,sp
   6D7F 21 F9 FF      [10] 1636 	ld	hl,#-7
   6D82 39            [11] 1637 	add	hl,sp
   6D83 F9            [ 6] 1638 	ld	sp,hl
                           1639 ;src/main.c:356: i16 difx = abs((i16)(enemy->x - prota.x));
   6D84 DD 5E 04      [19] 1640 	ld	e,4 (ix)
   6D87 DD 56 05      [19] 1641 	ld	d,5 (ix)
   6D8A 1A            [ 7] 1642 	ld	a,(de)
   6D8B 4F            [ 4] 1643 	ld	c,a
   6D8C 06 00         [ 7] 1644 	ld	b,#0x00
   6D8E 21 3D 64      [10] 1645 	ld	hl,#_prota+0
   6D91 6E            [ 7] 1646 	ld	l,(hl)
   6D92 26 00         [ 7] 1647 	ld	h,#0x00
   6D94 79            [ 4] 1648 	ld	a,c
   6D95 95            [ 4] 1649 	sub	a, l
   6D96 4F            [ 4] 1650 	ld	c,a
   6D97 78            [ 4] 1651 	ld	a,b
   6D98 9C            [ 4] 1652 	sbc	a, h
   6D99 47            [ 4] 1653 	ld	b,a
   6D9A D5            [11] 1654 	push	de
   6D9B C5            [11] 1655 	push	bc
   6D9C CD B5 4B      [17] 1656 	call	_abs
   6D9F F1            [10] 1657 	pop	af
   6DA0 D1            [10] 1658 	pop	de
   6DA1 33            [ 6] 1659 	inc	sp
   6DA2 33            [ 6] 1660 	inc	sp
   6DA3 E5            [11] 1661 	push	hl
                           1662 ;src/main.c:357: i16 dify = abs((i16)(enemy->y/2 - prota.y/2));
   6DA4 21 01 00      [10] 1663 	ld	hl,#0x0001
   6DA7 19            [11] 1664 	add	hl,de
   6DA8 DD 75 FC      [19] 1665 	ld	-4 (ix),l
   6DAB DD 74 FD      [19] 1666 	ld	-3 (ix),h
   6DAE DD 6E FC      [19] 1667 	ld	l,-4 (ix)
   6DB1 DD 66 FD      [19] 1668 	ld	h,-3 (ix)
   6DB4 4E            [ 7] 1669 	ld	c,(hl)
   6DB5 CB 39         [ 8] 1670 	srl	c
   6DB7 06 00         [ 7] 1671 	ld	b,#0x00
   6DB9 21 3E 64      [10] 1672 	ld	hl, #(_prota + 0x0001) + 0
   6DBC 6E            [ 7] 1673 	ld	l,(hl)
   6DBD CB 3D         [ 8] 1674 	srl	l
   6DBF 26 00         [ 7] 1675 	ld	h,#0x00
   6DC1 79            [ 4] 1676 	ld	a,c
   6DC2 95            [ 4] 1677 	sub	a, l
   6DC3 4F            [ 4] 1678 	ld	c,a
   6DC4 78            [ 4] 1679 	ld	a,b
   6DC5 9C            [ 4] 1680 	sbc	a, h
   6DC6 47            [ 4] 1681 	ld	b,a
   6DC7 D5            [11] 1682 	push	de
   6DC8 C5            [11] 1683 	push	bc
   6DC9 CD B5 4B      [17] 1684 	call	_abs
   6DCC F1            [10] 1685 	pop	af
   6DCD D1            [10] 1686 	pop	de
                           1687 ;src/main.c:359: dist = difx + dify; // manhattan
   6DCE DD 4E F9      [19] 1688 	ld	c,-7 (ix)
   6DD1 09            [11] 1689 	add	hl, bc
   6DD2 DD 75 FB      [19] 1690 	ld	-5 (ix),l
                           1691 ;src/main.c:360: enemy->seen = NO;
   6DD5 21 12 00      [10] 1692 	ld	hl,#0x0012
   6DD8 19            [11] 1693 	add	hl,de
   6DD9 DD 75 FE      [19] 1694 	ld	-2 (ix),l
   6DDC DD 74 FF      [19] 1695 	ld	-1 (ix),h
   6DDF DD 6E FE      [19] 1696 	ld	l,-2 (ix)
   6DE2 DD 66 FF      [19] 1697 	ld	h,-1 (ix)
   6DE5 36 00         [10] 1698 	ld	(hl),#0x00
                           1699 ;src/main.c:361: enemy->in_range = NO;
   6DE7 21 11 00      [10] 1700 	ld	hl,#0x0011
   6DEA 19            [11] 1701 	add	hl,de
   6DEB 4D            [ 4] 1702 	ld	c,l
   6DEC 44            [ 4] 1703 	ld	b,h
   6DED AF            [ 4] 1704 	xor	a, a
   6DEE 02            [ 7] 1705 	ld	(bc),a
                           1706 ;src/main.c:363: if(!enemy->seek){
   6DEF D5            [11] 1707 	push	de
   6DF0 FD E1         [14] 1708 	pop	iy
   6DF2 FD 7E 14      [19] 1709 	ld	a,20 (iy)
   6DF5 B7            [ 4] 1710 	or	a, a
   6DF6 C2 7C 6E      [10] 1711 	jp	NZ,00111$
                           1712 ;src/main.c:364: if (dist <= 20) {// te detectan los sensores de proximidad
   6DF9 3E 14         [ 7] 1713 	ld	a,#0x14
   6DFB DD 96 FB      [19] 1714 	sub	a, -5 (ix)
   6DFE 38 13         [12] 1715 	jr	C,00107$
                           1716 ;src/main.c:365: enemy->in_range = 1;
   6E00 3E 01         [ 7] 1717 	ld	a,#0x01
   6E02 02            [ 7] 1718 	ld	(bc),a
                           1719 ;src/main.c:366: enemy->engage = 1;
   6E03 21 16 00      [10] 1720 	ld	hl,#0x0016
   6E06 19            [11] 1721 	add	hl,de
   6E07 36 01         [10] 1722 	ld	(hl),#0x01
                           1723 ;src/main.c:367: enemy->seen = SI;
   6E09 DD 6E FE      [19] 1724 	ld	l,-2 (ix)
   6E0C DD 66 FF      [19] 1725 	ld	h,-1 (ix)
   6E0F 36 01         [10] 1726 	ld	(hl),#0x01
   6E11 18 69         [12] 1727 	jr	00111$
   6E13                    1728 00107$:
                           1729 ;src/main.c:368: }else if(prota.x > enemy->x - 16 && prota.x < enemy->x + 16
   6E13 21 3D 64      [10] 1730 	ld	hl, #_prota + 0
   6E16 4E            [ 7] 1731 	ld	c,(hl)
   6E17 1A            [ 7] 1732 	ld	a,(de)
   6E18 5F            [ 4] 1733 	ld	e,a
   6E19 16 00         [ 7] 1734 	ld	d,#0x00
   6E1B 7B            [ 4] 1735 	ld	a,e
   6E1C C6 F0         [ 7] 1736 	add	a,#0xF0
   6E1E 6F            [ 4] 1737 	ld	l,a
   6E1F 7A            [ 4] 1738 	ld	a,d
   6E20 CE FF         [ 7] 1739 	adc	a,#0xFF
   6E22 67            [ 4] 1740 	ld	h,a
   6E23 06 00         [ 7] 1741 	ld	b,#0x00
   6E25 7D            [ 4] 1742 	ld	a,l
   6E26 91            [ 4] 1743 	sub	a, c
   6E27 7C            [ 4] 1744 	ld	a,h
   6E28 98            [ 4] 1745 	sbc	a, b
   6E29 E2 2E 6E      [10] 1746 	jp	PO, 00137$
   6E2C EE 80         [ 7] 1747 	xor	a, #0x80
   6E2E                    1748 00137$:
   6E2E F2 7C 6E      [10] 1749 	jp	P,00111$
   6E31 21 10 00      [10] 1750 	ld	hl,#0x0010
   6E34 19            [11] 1751 	add	hl,de
   6E35 79            [ 4] 1752 	ld	a,c
   6E36 95            [ 4] 1753 	sub	a, l
   6E37 78            [ 4] 1754 	ld	a,b
   6E38 9C            [ 4] 1755 	sbc	a, h
   6E39 E2 3E 6E      [10] 1756 	jp	PO, 00138$
   6E3C EE 80         [ 7] 1757 	xor	a, #0x80
   6E3E                    1758 00138$:
   6E3E F2 7C 6E      [10] 1759 	jp	P,00111$
                           1760 ;src/main.c:369: && prota.y > enemy->y - 16*2 && prota.y < enemy->y +16*2){
   6E41 21 3E 64      [10] 1761 	ld	hl, #(_prota + 0x0001) + 0
   6E44 4E            [ 7] 1762 	ld	c,(hl)
   6E45 DD 6E FC      [19] 1763 	ld	l,-4 (ix)
   6E48 DD 66 FD      [19] 1764 	ld	h,-3 (ix)
   6E4B 5E            [ 7] 1765 	ld	e,(hl)
   6E4C 16 00         [ 7] 1766 	ld	d,#0x00
   6E4E 7B            [ 4] 1767 	ld	a,e
   6E4F C6 E0         [ 7] 1768 	add	a,#0xE0
   6E51 6F            [ 4] 1769 	ld	l,a
   6E52 7A            [ 4] 1770 	ld	a,d
   6E53 CE FF         [ 7] 1771 	adc	a,#0xFF
   6E55 67            [ 4] 1772 	ld	h,a
   6E56 06 00         [ 7] 1773 	ld	b,#0x00
   6E58 7D            [ 4] 1774 	ld	a,l
   6E59 91            [ 4] 1775 	sub	a, c
   6E5A 7C            [ 4] 1776 	ld	a,h
   6E5B 98            [ 4] 1777 	sbc	a, b
   6E5C E2 61 6E      [10] 1778 	jp	PO, 00139$
   6E5F EE 80         [ 7] 1779 	xor	a, #0x80
   6E61                    1780 00139$:
   6E61 F2 7C 6E      [10] 1781 	jp	P,00111$
   6E64 21 20 00      [10] 1782 	ld	hl,#0x0020
   6E67 19            [11] 1783 	add	hl,de
   6E68 79            [ 4] 1784 	ld	a,c
   6E69 95            [ 4] 1785 	sub	a, l
   6E6A 78            [ 4] 1786 	ld	a,b
   6E6B 9C            [ 4] 1787 	sbc	a, h
   6E6C E2 71 6E      [10] 1788 	jp	PO, 00140$
   6E6F EE 80         [ 7] 1789 	xor	a, #0x80
   6E71                    1790 00140$:
   6E71 F2 7C 6E      [10] 1791 	jp	P,00111$
                           1792 ;src/main.c:370: enemy->seen = SI;
   6E74 DD 6E FE      [19] 1793 	ld	l,-2 (ix)
   6E77 DD 66 FF      [19] 1794 	ld	h,-1 (ix)
   6E7A 36 01         [10] 1795 	ld	(hl),#0x01
   6E7C                    1796 00111$:
   6E7C DD F9         [10] 1797 	ld	sp, ix
   6E7E DD E1         [14] 1798 	pop	ix
   6E80 C9            [10] 1799 	ret
                           1800 ;src/main.c:375: void moverEnemigoSeek(TEnemy* actual){
                           1801 ;	---------------------------------
                           1802 ; Function moverEnemigoSeek
                           1803 ; ---------------------------------
   6E81                    1804 _moverEnemigoSeek::
   6E81 DD E5         [15] 1805 	push	ix
   6E83 DD 21 00 00   [14] 1806 	ld	ix,#0
   6E87 DD 39         [15] 1807 	add	ix,sp
   6E89 21 F6 FF      [10] 1808 	ld	hl,#-10
   6E8C 39            [11] 1809 	add	hl,sp
   6E8D F9            [ 6] 1810 	ld	sp,hl
                           1811 ;src/main.c:377: if(!actual->muerto){
   6E8E DD 4E 04      [19] 1812 	ld	c,4 (ix)
   6E91 DD 46 05      [19] 1813 	ld	b,5 (ix)
   6E94 C5            [11] 1814 	push	bc
   6E95 FD E1         [14] 1815 	pop	iy
   6E97 FD 7E 08      [19] 1816 	ld	a, 8 (iy)
   6E9A B7            [ 4] 1817 	or	a, a
   6E9B C2 FD 6F      [10] 1818 	jp	NZ,00114$
                           1819 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6E9E 21 0E 00      [10] 1820 	ld	hl,#0x000E
   6EA1 09            [11] 1821 	add	hl,bc
   6EA2 E3            [19] 1822 	ex	(sp), hl
   6EA3 E1            [10] 1823 	pop	hl
   6EA4 E5            [11] 1824 	push	hl
   6EA5 7E            [ 7] 1825 	ld	a,(hl)
   6EA6 DD 77 FE      [19] 1826 	ld	-2 (ix),a
   6EA9 23            [ 6] 1827 	inc	hl
   6EAA 7E            [ 7] 1828 	ld	a,(hl)
   6EAB DD 77 FF      [19] 1829 	ld	-1 (ix),a
   6EAE 69            [ 4] 1830 	ld	l, c
   6EAF 60            [ 4] 1831 	ld	h, b
   6EB0 11 E1 00      [10] 1832 	ld	de, #0x00E1
   6EB3 19            [11] 1833 	add	hl, de
   6EB4 5E            [ 7] 1834 	ld	e,(hl)
   6EB5 16 00         [ 7] 1835 	ld	d,#0x00
                           1836 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6EB7 21 01 00      [10] 1837 	ld	hl,#0x0001
   6EBA 09            [11] 1838 	add	hl,bc
   6EBB DD 75 FC      [19] 1839 	ld	-4 (ix),l
   6EBE DD 74 FD      [19] 1840 	ld	-3 (ix),h
                           1841 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6EC1 DD 7E FE      [19] 1842 	ld	a,-2 (ix)
   6EC4 93            [ 4] 1843 	sub	a, e
   6EC5 DD 7E FF      [19] 1844 	ld	a,-1 (ix)
   6EC8 9A            [ 4] 1845 	sbc	a, d
   6EC9 E2 CE 6E      [10] 1846 	jp	PO, 00136$
   6ECC EE 80         [ 7] 1847 	xor	a, #0x80
   6ECE                    1848 00136$:
   6ECE F2 3E 6F      [10] 1849 	jp	P,00110$
                           1850 ;src/main.c:385: actual->mover = SI;
   6ED1 21 06 00      [10] 1851 	ld	hl,#0x0006
   6ED4 09            [11] 1852 	add	hl,bc
                           1853 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6ED5 79            [ 4] 1854 	ld	a,c
   6ED6 C6 19         [ 7] 1855 	add	a, #0x19
   6ED8 5F            [ 4] 1856 	ld	e,a
   6ED9 78            [ 4] 1857 	ld	a,b
   6EDA CE 00         [ 7] 1858 	adc	a, #0x00
   6EDC 57            [ 4] 1859 	ld	d,a
                           1860 ;src/main.c:383: if(actual->iter == 0){
   6EDD DD 7E FF      [19] 1861 	ld	a,-1 (ix)
   6EE0 DD B6 FE      [19] 1862 	or	a,-2 (ix)
   6EE3 20 30         [12] 1863 	jr	NZ,00102$
                           1864 ;src/main.c:385: actual->mover = SI;
   6EE5 36 01         [10] 1865 	ld	(hl),#0x01
                           1866 ;src/main.c:386: actual->iter = 2;
   6EE7 E1            [10] 1867 	pop	hl
   6EE8 E5            [11] 1868 	push	hl
   6EE9 36 02         [10] 1869 	ld	(hl),#0x02
   6EEB 23            [ 6] 1870 	inc	hl
   6EEC 36 00         [10] 1871 	ld	(hl),#0x00
                           1872 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6EEE E1            [10] 1873 	pop	hl
   6EEF E5            [11] 1874 	push	hl
   6EF0 7E            [ 7] 1875 	ld	a, (hl)
   6EF1 23            [ 6] 1876 	inc	hl
   6EF2 66            [ 7] 1877 	ld	h,(hl)
   6EF3 6F            [ 4] 1878 	ld	l,a
   6EF4 19            [11] 1879 	add	hl,de
   6EF5 7E            [ 7] 1880 	ld	a,(hl)
   6EF6 02            [ 7] 1881 	ld	(bc),a
                           1882 ;src/main.c:388: ++actual->iter;
   6EF7 E1            [10] 1883 	pop	hl
   6EF8 E5            [11] 1884 	push	hl
   6EF9 4E            [ 7] 1885 	ld	c,(hl)
   6EFA 23            [ 6] 1886 	inc	hl
   6EFB 46            [ 7] 1887 	ld	b,(hl)
   6EFC 03            [ 6] 1888 	inc	bc
   6EFD E1            [10] 1889 	pop	hl
   6EFE E5            [11] 1890 	push	hl
   6EFF 71            [ 7] 1891 	ld	(hl),c
   6F00 23            [ 6] 1892 	inc	hl
   6F01 70            [ 7] 1893 	ld	(hl),b
                           1894 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F02 EB            [ 4] 1895 	ex	de,hl
   6F03 09            [11] 1896 	add	hl,bc
   6F04 5E            [ 7] 1897 	ld	e,(hl)
   6F05 DD 6E FC      [19] 1898 	ld	l,-4 (ix)
   6F08 DD 66 FD      [19] 1899 	ld	h,-3 (ix)
   6F0B 73            [ 7] 1900 	ld	(hl),e
                           1901 ;src/main.c:390: ++actual->iter;
   6F0C 03            [ 6] 1902 	inc	bc
   6F0D E1            [10] 1903 	pop	hl
   6F0E E5            [11] 1904 	push	hl
   6F0F 71            [ 7] 1905 	ld	(hl),c
   6F10 23            [ 6] 1906 	inc	hl
   6F11 70            [ 7] 1907 	ld	(hl),b
   6F12 C3 FD 6F      [10] 1908 	jp	00114$
   6F15                    1909 00102$:
                           1910 ;src/main.c:393: actual->mover = SI;
   6F15 36 01         [10] 1911 	ld	(hl),#0x01
                           1912 ;src/main.c:394: actual->x = actual->camino[actual->iter];
   6F17 E1            [10] 1913 	pop	hl
   6F18 E5            [11] 1914 	push	hl
   6F19 7E            [ 7] 1915 	ld	a, (hl)
   6F1A 23            [ 6] 1916 	inc	hl
   6F1B 66            [ 7] 1917 	ld	h,(hl)
   6F1C 6F            [ 4] 1918 	ld	l,a
   6F1D 19            [11] 1919 	add	hl,de
   6F1E 7E            [ 7] 1920 	ld	a,(hl)
   6F1F 02            [ 7] 1921 	ld	(bc),a
                           1922 ;src/main.c:395: ++actual->iter;
   6F20 E1            [10] 1923 	pop	hl
   6F21 E5            [11] 1924 	push	hl
   6F22 4E            [ 7] 1925 	ld	c,(hl)
   6F23 23            [ 6] 1926 	inc	hl
   6F24 46            [ 7] 1927 	ld	b,(hl)
   6F25 03            [ 6] 1928 	inc	bc
   6F26 E1            [10] 1929 	pop	hl
   6F27 E5            [11] 1930 	push	hl
   6F28 71            [ 7] 1931 	ld	(hl),c
   6F29 23            [ 6] 1932 	inc	hl
   6F2A 70            [ 7] 1933 	ld	(hl),b
                           1934 ;src/main.c:396: actual->y = actual->camino[actual->iter];
   6F2B EB            [ 4] 1935 	ex	de,hl
   6F2C 09            [11] 1936 	add	hl,bc
   6F2D 5E            [ 7] 1937 	ld	e,(hl)
   6F2E DD 6E FC      [19] 1938 	ld	l,-4 (ix)
   6F31 DD 66 FD      [19] 1939 	ld	h,-3 (ix)
   6F34 73            [ 7] 1940 	ld	(hl),e
                           1941 ;src/main.c:397: ++actual->iter;
   6F35 03            [ 6] 1942 	inc	bc
   6F36 E1            [10] 1943 	pop	hl
   6F37 E5            [11] 1944 	push	hl
   6F38 71            [ 7] 1945 	ld	(hl),c
   6F39 23            [ 6] 1946 	inc	hl
   6F3A 70            [ 7] 1947 	ld	(hl),b
   6F3B C3 FD 6F      [10] 1948 	jp	00114$
   6F3E                    1949 00110$:
                           1950 ;src/main.c:403: actual->seek = 0;
   6F3E 21 14 00      [10] 1951 	ld	hl,#0x0014
   6F41 09            [11] 1952 	add	hl,bc
   6F42 DD 75 FE      [19] 1953 	ld	-2 (ix),l
   6F45 DD 74 FF      [19] 1954 	ld	-1 (ix),h
   6F48 DD 6E FE      [19] 1955 	ld	l,-2 (ix)
   6F4B DD 66 FF      [19] 1956 	ld	h,-1 (ix)
   6F4E 36 00         [10] 1957 	ld	(hl),#0x00
                           1958 ;src/main.c:404: lookFor(actual);
   6F50 C5            [11] 1959 	push	bc
   6F51 C5            [11] 1960 	push	bc
   6F52 CD 77 6D      [17] 1961 	call	_lookFor
   6F55 F1            [10] 1962 	pop	af
   6F56 C1            [10] 1963 	pop	bc
                           1964 ;src/main.c:405: if(!actual->seen){
   6F57 69            [ 4] 1965 	ld	l, c
   6F58 60            [ 4] 1966 	ld	h, b
   6F59 11 12 00      [10] 1967 	ld	de, #0x0012
   6F5C 19            [11] 1968 	add	hl, de
   6F5D 7E            [ 7] 1969 	ld	a,(hl)
   6F5E DD 77 FB      [19] 1970 	ld	-5 (ix),a
                           1971 ;src/main.c:406: actual->patrolling = 1;
   6F61 21 0B 00      [10] 1972 	ld	hl,#0x000B
   6F64 09            [11] 1973 	add	hl,bc
   6F65 DD 75 F9      [19] 1974 	ld	-7 (ix),l
   6F68 DD 74 FA      [19] 1975 	ld	-6 (ix),h
                           1976 ;src/main.c:405: if(!actual->seen){
   6F6B DD 7E FB      [19] 1977 	ld	a,-5 (ix)
   6F6E B7            [ 4] 1978 	or	a, a
   6F6F 20 3C         [12] 1979 	jr	NZ,00107$
                           1980 ;src/main.c:406: actual->patrolling = 1;
   6F71 DD 6E F9      [19] 1981 	ld	l,-7 (ix)
   6F74 DD 66 FA      [19] 1982 	ld	h,-6 (ix)
   6F77 36 01         [10] 1983 	ld	(hl),#0x01
                           1984 ;src/main.c:407: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6F79 C5            [11] 1985 	push	bc
   6F7A FD E1         [14] 1986 	pop	iy
   6F7C FD 7E 18      [19] 1987 	ld	a,24 (iy)
   6F7F DD 77 FB      [19] 1988 	ld	-5 (ix),a
   6F82 C5            [11] 1989 	push	bc
   6F83 FD E1         [14] 1990 	pop	iy
   6F85 FD 56 17      [19] 1991 	ld	d,23 (iy)
   6F88 DD 6E FC      [19] 1992 	ld	l,-4 (ix)
   6F8B DD 66 FD      [19] 1993 	ld	h,-3 (ix)
   6F8E 5E            [ 7] 1994 	ld	e,(hl)
   6F8F 0A            [ 7] 1995 	ld	a,(bc)
   6F90 DD 77 F8      [19] 1996 	ld	-8 (ix),a
   6F93 2A 50 64      [16] 1997 	ld	hl,(_mapa)
   6F96 E5            [11] 1998 	push	hl
   6F97 C5            [11] 1999 	push	bc
   6F98 DD 7E FB      [19] 2000 	ld	a,-5 (ix)
   6F9B F5            [11] 2001 	push	af
   6F9C 33            [ 6] 2002 	inc	sp
   6F9D D5            [11] 2003 	push	de
   6F9E DD 7E F8      [19] 2004 	ld	a,-8 (ix)
   6FA1 F5            [11] 2005 	push	af
   6FA2 33            [ 6] 2006 	inc	sp
   6FA3 CD 72 49      [17] 2007 	call	_pathFinding
   6FA6 21 08 00      [10] 2008 	ld	hl,#8
   6FA9 39            [11] 2009 	add	hl,sp
   6FAA F9            [ 6] 2010 	ld	sp,hl
   6FAB 18 4A         [12] 2011 	jr	00108$
   6FAD                    2012 00107$:
                           2013 ;src/main.c:409: actual->patrolling = 0;
   6FAD DD 6E F9      [19] 2014 	ld	l,-7 (ix)
   6FB0 DD 66 FA      [19] 2015 	ld	h,-6 (ix)
   6FB3 36 00         [10] 2016 	ld	(hl),#0x00
                           2017 ;src/main.c:410: if(!actual->engage){
   6FB5 C5            [11] 2018 	push	bc
   6FB6 FD E1         [14] 2019 	pop	iy
   6FB8 FD 7E 16      [19] 2020 	ld	a,22 (iy)
   6FBB B7            [ 4] 2021 	or	a, a
   6FBC 20 39         [12] 2022 	jr	NZ,00108$
                           2023 ;src/main.c:411: actual->seek = 1;
   6FBE DD 6E FE      [19] 2024 	ld	l,-2 (ix)
   6FC1 DD 66 FF      [19] 2025 	ld	h,-1 (ix)
   6FC4 36 01         [10] 2026 	ld	(hl),#0x01
                           2027 ;src/main.c:412: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   6FC6 3A 3E 64      [13] 2028 	ld	a,(#_prota + 1)
   6FC9 DD 77 F8      [19] 2029 	ld	-8 (ix),a
   6FCC 21 3D 64      [10] 2030 	ld	hl, #_prota + 0
   6FCF 5E            [ 7] 2031 	ld	e,(hl)
   6FD0 DD 6E FC      [19] 2032 	ld	l,-4 (ix)
   6FD3 DD 66 FD      [19] 2033 	ld	h,-3 (ix)
   6FD6 56            [ 7] 2034 	ld	d,(hl)
   6FD7 0A            [ 7] 2035 	ld	a,(bc)
   6FD8 DD 77 F9      [19] 2036 	ld	-7 (ix),a
   6FDB 2A 50 64      [16] 2037 	ld	hl,(_mapa)
   6FDE E5            [11] 2038 	push	hl
   6FDF C5            [11] 2039 	push	bc
   6FE0 DD 7E F8      [19] 2040 	ld	a,-8 (ix)
   6FE3 F5            [11] 2041 	push	af
   6FE4 33            [ 6] 2042 	inc	sp
   6FE5 7B            [ 4] 2043 	ld	a,e
   6FE6 F5            [11] 2044 	push	af
   6FE7 33            [ 6] 2045 	inc	sp
   6FE8 D5            [11] 2046 	push	de
   6FE9 33            [ 6] 2047 	inc	sp
   6FEA DD 7E F9      [19] 2048 	ld	a,-7 (ix)
   6FED F5            [11] 2049 	push	af
   6FEE 33            [ 6] 2050 	inc	sp
   6FEF CD 72 49      [17] 2051 	call	_pathFinding
   6FF2 21 08 00      [10] 2052 	ld	hl,#8
   6FF5 39            [11] 2053 	add	hl,sp
   6FF6 F9            [ 6] 2054 	ld	sp,hl
   6FF7                    2055 00108$:
                           2056 ;src/main.c:415: actual->iter = 0;
   6FF7 E1            [10] 2057 	pop	hl
   6FF8 E5            [11] 2058 	push	hl
   6FF9 AF            [ 4] 2059 	xor	a, a
   6FFA 77            [ 7] 2060 	ld	(hl), a
   6FFB 23            [ 6] 2061 	inc	hl
   6FFC 77            [ 7] 2062 	ld	(hl), a
   6FFD                    2063 00114$:
   6FFD DD F9         [10] 2064 	ld	sp, ix
   6FFF DD E1         [14] 2065 	pop	ix
   7001 C9            [10] 2066 	ret
                           2067 ;src/main.c:422: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2068 ;	---------------------------------
                           2069 ; Function engage
                           2070 ; ---------------------------------
   7002                    2071 _engage::
   7002 DD E5         [15] 2072 	push	ix
   7004 DD 21 00 00   [14] 2073 	ld	ix,#0
   7008 DD 39         [15] 2074 	add	ix,sp
   700A 21 F1 FF      [10] 2075 	ld	hl,#-15
   700D 39            [11] 2076 	add	hl,sp
   700E F9            [ 6] 2077 	ld	sp,hl
                           2078 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   700F DD 7E 04      [19] 2079 	ld	a,4 (ix)
   7012 DD 77 F4      [19] 2080 	ld	-12 (ix),a
   7015 DD 7E 05      [19] 2081 	ld	a,5 (ix)
   7018 DD 77 F5      [19] 2082 	ld	-11 (ix),a
   701B DD 6E F4      [19] 2083 	ld	l,-12 (ix)
   701E DD 66 F5      [19] 2084 	ld	h,-11 (ix)
   7021 4E            [ 7] 2085 	ld	c,(hl)
   7022 06 00         [ 7] 2086 	ld	b,#0x00
   7024 21 3D 64      [10] 2087 	ld	hl,#_prota+0
   7027 5E            [ 7] 2088 	ld	e,(hl)
   7028 16 00         [ 7] 2089 	ld	d,#0x00
   702A 79            [ 4] 2090 	ld	a,c
   702B 93            [ 4] 2091 	sub	a, e
   702C 4F            [ 4] 2092 	ld	c,a
   702D 78            [ 4] 2093 	ld	a,b
   702E 9A            [ 4] 2094 	sbc	a, d
   702F 47            [ 4] 2095 	ld	b,a
   7030 C5            [11] 2096 	push	bc
   7031 CD B5 4B      [17] 2097 	call	_abs
   7034 F1            [10] 2098 	pop	af
   7035 4D            [ 4] 2099 	ld	c,l
                           2100 ;src/main.c:424: u8 dify = abs(enemy->y - prota.y);
   7036 DD 7E F4      [19] 2101 	ld	a,-12 (ix)
   7039 C6 01         [ 7] 2102 	add	a, #0x01
   703B DD 77 F6      [19] 2103 	ld	-10 (ix),a
   703E DD 7E F5      [19] 2104 	ld	a,-11 (ix)
   7041 CE 00         [ 7] 2105 	adc	a, #0x00
   7043 DD 77 F7      [19] 2106 	ld	-9 (ix),a
   7046 DD 6E F6      [19] 2107 	ld	l,-10 (ix)
   7049 DD 66 F7      [19] 2108 	ld	h,-9 (ix)
   704C 5E            [ 7] 2109 	ld	e,(hl)
   704D 16 00         [ 7] 2110 	ld	d,#0x00
   704F 21 3E 64      [10] 2111 	ld	hl, #_prota + 1
   7052 6E            [ 7] 2112 	ld	l,(hl)
   7053 26 00         [ 7] 2113 	ld	h,#0x00
   7055 7B            [ 4] 2114 	ld	a,e
   7056 95            [ 4] 2115 	sub	a, l
   7057 5F            [ 4] 2116 	ld	e,a
   7058 7A            [ 4] 2117 	ld	a,d
   7059 9C            [ 4] 2118 	sbc	a, h
   705A 57            [ 4] 2119 	ld	d,a
   705B C5            [11] 2120 	push	bc
   705C D5            [11] 2121 	push	de
   705D CD B5 4B      [17] 2122 	call	_abs
   7060 F1            [10] 2123 	pop	af
   7061 C1            [10] 2124 	pop	bc
                           2125 ;src/main.c:425: u8 dist = difx + dify; // manhattan
   7062 09            [11] 2126 	add	hl, bc
   7063 DD 75 F3      [19] 2127 	ld	-13 (ix),l
                           2128 ;src/main.c:427: u8 movX = 0;
   7066 DD 36 F2 00   [19] 2129 	ld	-14 (ix),#0x00
                           2130 ;src/main.c:428: u8 movY = 0;
   706A DD 36 F1 00   [19] 2131 	ld	-15 (ix),#0x00
                           2132 ;src/main.c:429: u8 distConstraint = 25;
   706E 0E 19         [ 7] 2133 	ld	c,#0x19
                           2134 ;src/main.c:430: enemy->mover = NO;
   7070 DD 7E F4      [19] 2135 	ld	a,-12 (ix)
   7073 C6 06         [ 7] 2136 	add	a, #0x06
   7075 DD 77 F8      [19] 2137 	ld	-8 (ix),a
   7078 DD 7E F5      [19] 2138 	ld	a,-11 (ix)
   707B CE 00         [ 7] 2139 	adc	a, #0x00
   707D DD 77 F9      [19] 2140 	ld	-7 (ix),a
   7080 DD 6E F8      [19] 2141 	ld	l,-8 (ix)
   7083 DD 66 F9      [19] 2142 	ld	h,-7 (ix)
   7086 36 00         [10] 2143 	ld	(hl),#0x00
                           2144 ;src/main.c:432: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7088 DD 6E F6      [19] 2145 	ld	l,-10 (ix)
   708B DD 66 F7      [19] 2146 	ld	h,-9 (ix)
   708E 7E            [ 7] 2147 	ld	a,(hl)
   708F DD 77 FA      [19] 2148 	ld	-6 (ix),a
                           2149 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7092 DD 6E F4      [19] 2150 	ld	l,-12 (ix)
   7095 DD 66 F5      [19] 2151 	ld	h,-11 (ix)
   7098 46            [ 7] 2152 	ld	b,(hl)
                           2153 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7099 78            [ 4] 2154 	ld	a,b
   709A C6 04         [ 7] 2155 	add	a, #0x04
   709C DD 77 FB      [19] 2156 	ld	-5 (ix),a
                           2157 ;src/main.c:432: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   709F DD 7E 07      [19] 2158 	ld	a,7 (ix)
   70A2 DD 96 FA      [19] 2159 	sub	a, -6 (ix)
   70A5 28 38         [12] 2160 	jr	Z,00194$
   70A7 DD 5E 07      [19] 2161 	ld	e,7 (ix)
   70AA 16 00         [ 7] 2162 	ld	d,#0x00
   70AC 21 01 00      [10] 2163 	ld	hl,#0x0001
   70AF 19            [11] 2164 	add	hl,de
   70B0 DD 75 FC      [19] 2165 	ld	-4 (ix),l
   70B3 DD 74 FD      [19] 2166 	ld	-3 (ix),h
   70B6 DD 7E FA      [19] 2167 	ld	a,-6 (ix)
   70B9 DD 77 FE      [19] 2168 	ld	-2 (ix),a
   70BC DD 36 FF 00   [19] 2169 	ld	-1 (ix),#0x00
   70C0 DD 7E FE      [19] 2170 	ld	a,-2 (ix)
   70C3 DD 96 FC      [19] 2171 	sub	a, -4 (ix)
   70C6 20 08         [12] 2172 	jr	NZ,00422$
   70C8 DD 7E FF      [19] 2173 	ld	a,-1 (ix)
   70CB DD 96 FD      [19] 2174 	sub	a, -3 (ix)
   70CE 28 0F         [12] 2175 	jr	Z,00194$
   70D0                    2176 00422$:
   70D0 1B            [ 6] 2177 	dec	de
   70D1 DD 7E FE      [19] 2178 	ld	a,-2 (ix)
   70D4 93            [ 4] 2179 	sub	a, e
   70D5 C2 E8 71      [10] 2180 	jp	NZ,00195$
   70D8 DD 7E FF      [19] 2181 	ld	a,-1 (ix)
   70DB 92            [ 4] 2182 	sub	a, d
   70DC C2 E8 71      [10] 2183 	jp	NZ,00195$
   70DF                    2184 00194$:
                           2185 ;src/main.c:433: if (dx < enemy->x) { // izquierda
   70DF DD 7E 06      [19] 2186 	ld	a,6 (ix)
   70E2 90            [ 4] 2187 	sub	a, b
   70E3 D2 65 71      [10] 2188 	jp	NC,00114$
                           2189 ;src/main.c:434: if (dist > 11) {
   70E6 3E 0B         [ 7] 2190 	ld	a,#0x0B
   70E8 DD 96 F3      [19] 2191 	sub	a, -13 (ix)
   70EB D2 A8 77      [10] 2192 	jp	NC,00199$
                           2193 ;src/main.c:435: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   70EE DD 7E FA      [19] 2194 	ld	a,-6 (ix)
   70F1 F5            [11] 2195 	push	af
   70F2 33            [ 6] 2196 	inc	sp
   70F3 C5            [11] 2197 	push	bc
   70F4 33            [ 6] 2198 	inc	sp
   70F5 2A 50 64      [16] 2199 	ld	hl,(_mapa)
   70F8 E5            [11] 2200 	push	hl
   70F9 CD 71 4B      [17] 2201 	call	_getTilePtr
   70FC F1            [10] 2202 	pop	af
   70FD F1            [10] 2203 	pop	af
   70FE 4E            [ 7] 2204 	ld	c,(hl)
   70FF 3E 02         [ 7] 2205 	ld	a,#0x02
   7101 91            [ 4] 2206 	sub	a, c
   7102 DA A8 77      [10] 2207 	jp	C,00199$
                           2208 ;src/main.c:436: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7105 DD 6E F6      [19] 2209 	ld	l,-10 (ix)
   7108 DD 66 F7      [19] 2210 	ld	h,-9 (ix)
   710B 7E            [ 7] 2211 	ld	a,(hl)
   710C C6 0B         [ 7] 2212 	add	a, #0x0B
   710E 57            [ 4] 2213 	ld	d,a
   710F DD 6E F4      [19] 2214 	ld	l,-12 (ix)
   7112 DD 66 F5      [19] 2215 	ld	h,-11 (ix)
   7115 46            [ 7] 2216 	ld	b,(hl)
   7116 D5            [11] 2217 	push	de
   7117 33            [ 6] 2218 	inc	sp
   7118 C5            [11] 2219 	push	bc
   7119 33            [ 6] 2220 	inc	sp
   711A 2A 50 64      [16] 2221 	ld	hl,(_mapa)
   711D E5            [11] 2222 	push	hl
   711E CD 71 4B      [17] 2223 	call	_getTilePtr
   7121 F1            [10] 2224 	pop	af
   7122 F1            [10] 2225 	pop	af
   7123 4E            [ 7] 2226 	ld	c,(hl)
   7124 3E 02         [ 7] 2227 	ld	a,#0x02
   7126 91            [ 4] 2228 	sub	a, c
   7127 DA A8 77      [10] 2229 	jp	C,00199$
                           2230 ;src/main.c:437: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   712A DD 6E F6      [19] 2231 	ld	l,-10 (ix)
   712D DD 66 F7      [19] 2232 	ld	h,-9 (ix)
   7130 7E            [ 7] 2233 	ld	a,(hl)
   7131 C6 16         [ 7] 2234 	add	a, #0x16
   7133 57            [ 4] 2235 	ld	d,a
   7134 DD 6E F4      [19] 2236 	ld	l,-12 (ix)
   7137 DD 66 F5      [19] 2237 	ld	h,-11 (ix)
   713A 46            [ 7] 2238 	ld	b,(hl)
   713B D5            [11] 2239 	push	de
   713C 33            [ 6] 2240 	inc	sp
   713D C5            [11] 2241 	push	bc
   713E 33            [ 6] 2242 	inc	sp
   713F 2A 50 64      [16] 2243 	ld	hl,(_mapa)
   7142 E5            [11] 2244 	push	hl
   7143 CD 71 4B      [17] 2245 	call	_getTilePtr
   7146 F1            [10] 2246 	pop	af
   7147 F1            [10] 2247 	pop	af
   7148 4E            [ 7] 2248 	ld	c,(hl)
   7149 3E 02         [ 7] 2249 	ld	a,#0x02
   714B 91            [ 4] 2250 	sub	a, c
   714C DA A8 77      [10] 2251 	jp	C,00199$
                           2252 ;src/main.c:438: moverEnemigoIzquierda(enemy);
   714F DD 6E F4      [19] 2253 	ld	l,-12 (ix)
   7152 DD 66 F5      [19] 2254 	ld	h,-11 (ix)
   7155 E5            [11] 2255 	push	hl
   7156 CD 07 6B      [17] 2256 	call	_moverEnemigoIzquierda
   7159 F1            [10] 2257 	pop	af
                           2258 ;src/main.c:440: enemy->mover = SI;
   715A DD 6E F8      [19] 2259 	ld	l,-8 (ix)
   715D DD 66 F9      [19] 2260 	ld	h,-7 (ix)
   7160 36 01         [10] 2261 	ld	(hl),#0x01
   7162 C3 A8 77      [10] 2262 	jp	00199$
   7165                    2263 00114$:
                           2264 ;src/main.c:444: if (dist > G_ENEMY_W + 3) {
   7165 3E 07         [ 7] 2265 	ld	a,#0x07
   7167 DD 96 F3      [19] 2266 	sub	a, -13 (ix)
   716A D2 A8 77      [10] 2267 	jp	NC,00199$
                           2268 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   716D DD 66 FA      [19] 2269 	ld	h,-6 (ix)
   7170 DD 6E FB      [19] 2270 	ld	l,-5 (ix)
   7173 E5            [11] 2271 	push	hl
   7174 2A 50 64      [16] 2272 	ld	hl,(_mapa)
   7177 E5            [11] 2273 	push	hl
   7178 CD 71 4B      [17] 2274 	call	_getTilePtr
   717B F1            [10] 2275 	pop	af
   717C F1            [10] 2276 	pop	af
   717D 4E            [ 7] 2277 	ld	c,(hl)
   717E 3E 02         [ 7] 2278 	ld	a,#0x02
   7180 91            [ 4] 2279 	sub	a, c
   7181 DA A8 77      [10] 2280 	jp	C,00199$
                           2281 ;src/main.c:446: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7184 DD 6E F6      [19] 2282 	ld	l,-10 (ix)
   7187 DD 66 F7      [19] 2283 	ld	h,-9 (ix)
   718A 7E            [ 7] 2284 	ld	a,(hl)
   718B C6 0B         [ 7] 2285 	add	a, #0x0B
   718D 47            [ 4] 2286 	ld	b,a
   718E DD 6E F4      [19] 2287 	ld	l,-12 (ix)
   7191 DD 66 F5      [19] 2288 	ld	h,-11 (ix)
   7194 7E            [ 7] 2289 	ld	a,(hl)
   7195 C6 04         [ 7] 2290 	add	a, #0x04
   7197 C5            [11] 2291 	push	bc
   7198 33            [ 6] 2292 	inc	sp
   7199 F5            [11] 2293 	push	af
   719A 33            [ 6] 2294 	inc	sp
   719B 2A 50 64      [16] 2295 	ld	hl,(_mapa)
   719E E5            [11] 2296 	push	hl
   719F CD 71 4B      [17] 2297 	call	_getTilePtr
   71A2 F1            [10] 2298 	pop	af
   71A3 F1            [10] 2299 	pop	af
   71A4 4E            [ 7] 2300 	ld	c,(hl)
   71A5 3E 02         [ 7] 2301 	ld	a,#0x02
   71A7 91            [ 4] 2302 	sub	a, c
   71A8 DA A8 77      [10] 2303 	jp	C,00199$
                           2304 ;src/main.c:447: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   71AB DD 6E F6      [19] 2305 	ld	l,-10 (ix)
   71AE DD 66 F7      [19] 2306 	ld	h,-9 (ix)
   71B1 7E            [ 7] 2307 	ld	a,(hl)
   71B2 C6 16         [ 7] 2308 	add	a, #0x16
   71B4 47            [ 4] 2309 	ld	b,a
   71B5 DD 6E F4      [19] 2310 	ld	l,-12 (ix)
   71B8 DD 66 F5      [19] 2311 	ld	h,-11 (ix)
   71BB 7E            [ 7] 2312 	ld	a,(hl)
   71BC C6 04         [ 7] 2313 	add	a, #0x04
   71BE C5            [11] 2314 	push	bc
   71BF 33            [ 6] 2315 	inc	sp
   71C0 F5            [11] 2316 	push	af
   71C1 33            [ 6] 2317 	inc	sp
   71C2 2A 50 64      [16] 2318 	ld	hl,(_mapa)
   71C5 E5            [11] 2319 	push	hl
   71C6 CD 71 4B      [17] 2320 	call	_getTilePtr
   71C9 F1            [10] 2321 	pop	af
   71CA F1            [10] 2322 	pop	af
   71CB 4E            [ 7] 2323 	ld	c,(hl)
   71CC 3E 02         [ 7] 2324 	ld	a,#0x02
   71CE 91            [ 4] 2325 	sub	a, c
   71CF DA A8 77      [10] 2326 	jp	C,00199$
                           2327 ;src/main.c:448: moverEnemigoDerecha(enemy);
   71D2 DD 6E F4      [19] 2328 	ld	l,-12 (ix)
   71D5 DD 66 F5      [19] 2329 	ld	h,-11 (ix)
   71D8 E5            [11] 2330 	push	hl
   71D9 CD F7 6A      [17] 2331 	call	_moverEnemigoDerecha
   71DC F1            [10] 2332 	pop	af
                           2333 ;src/main.c:450: enemy->mover = SI;
   71DD DD 6E F8      [19] 2334 	ld	l,-8 (ix)
   71E0 DD 66 F9      [19] 2335 	ld	h,-7 (ix)
   71E3 36 01         [10] 2336 	ld	(hl),#0x01
   71E5 C3 A8 77      [10] 2337 	jp	00199$
   71E8                    2338 00195$:
                           2339 ;src/main.c:455: else if (enemy->x == dx) {
   71E8 DD 7E 06      [19] 2340 	ld	a,6 (ix)
   71EB 90            [ 4] 2341 	sub	a, b
   71EC C2 01 73      [10] 2342 	jp	NZ,00192$
                           2343 ;src/main.c:456: if (dy < enemy->y) {
   71EF DD 7E 07      [19] 2344 	ld	a,7 (ix)
   71F2 DD 96 FA      [19] 2345 	sub	a, -6 (ix)
   71F5 D2 7B 72      [10] 2346 	jp	NC,00129$
                           2347 ;src/main.c:457: if (dist > G_HERO_H + 5) {
   71F8 3E 1B         [ 7] 2348 	ld	a,#0x1B
   71FA DD 96 F3      [19] 2349 	sub	a, -13 (ix)
   71FD D2 A8 77      [10] 2350 	jp	NC,00199$
                           2351 ;src/main.c:458: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7200 DD 56 FA      [19] 2352 	ld	d,-6 (ix)
   7203 15            [ 4] 2353 	dec	d
   7204 15            [ 4] 2354 	dec	d
   7205 D5            [11] 2355 	push	de
   7206 33            [ 6] 2356 	inc	sp
   7207 C5            [11] 2357 	push	bc
   7208 33            [ 6] 2358 	inc	sp
   7209 2A 50 64      [16] 2359 	ld	hl,(_mapa)
   720C E5            [11] 2360 	push	hl
   720D CD 71 4B      [17] 2361 	call	_getTilePtr
   7210 F1            [10] 2362 	pop	af
   7211 F1            [10] 2363 	pop	af
   7212 4E            [ 7] 2364 	ld	c,(hl)
   7213 3E 02         [ 7] 2365 	ld	a,#0x02
   7215 91            [ 4] 2366 	sub	a, c
   7216 DA A8 77      [10] 2367 	jp	C,00199$
                           2368 ;src/main.c:459: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7219 DD 6E F6      [19] 2369 	ld	l,-10 (ix)
   721C DD 66 F7      [19] 2370 	ld	h,-9 (ix)
   721F 56            [ 7] 2371 	ld	d,(hl)
   7220 15            [ 4] 2372 	dec	d
   7221 15            [ 4] 2373 	dec	d
   7222 DD 6E F4      [19] 2374 	ld	l,-12 (ix)
   7225 DD 66 F5      [19] 2375 	ld	h,-11 (ix)
   7228 46            [ 7] 2376 	ld	b,(hl)
   7229 04            [ 4] 2377 	inc	b
   722A 04            [ 4] 2378 	inc	b
   722B D5            [11] 2379 	push	de
   722C 33            [ 6] 2380 	inc	sp
   722D C5            [11] 2381 	push	bc
   722E 33            [ 6] 2382 	inc	sp
   722F 2A 50 64      [16] 2383 	ld	hl,(_mapa)
   7232 E5            [11] 2384 	push	hl
   7233 CD 71 4B      [17] 2385 	call	_getTilePtr
   7236 F1            [10] 2386 	pop	af
   7237 F1            [10] 2387 	pop	af
   7238 4E            [ 7] 2388 	ld	c,(hl)
   7239 3E 02         [ 7] 2389 	ld	a,#0x02
   723B 91            [ 4] 2390 	sub	a, c
   723C DA A8 77      [10] 2391 	jp	C,00199$
                           2392 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   723F DD 6E F6      [19] 2393 	ld	l,-10 (ix)
   7242 DD 66 F7      [19] 2394 	ld	h,-9 (ix)
   7245 46            [ 7] 2395 	ld	b,(hl)
   7246 05            [ 4] 2396 	dec	b
   7247 05            [ 4] 2397 	dec	b
   7248 DD 6E F4      [19] 2398 	ld	l,-12 (ix)
   724B DD 66 F5      [19] 2399 	ld	h,-11 (ix)
   724E 7E            [ 7] 2400 	ld	a,(hl)
   724F C6 04         [ 7] 2401 	add	a, #0x04
   7251 C5            [11] 2402 	push	bc
   7252 33            [ 6] 2403 	inc	sp
   7253 F5            [11] 2404 	push	af
   7254 33            [ 6] 2405 	inc	sp
   7255 2A 50 64      [16] 2406 	ld	hl,(_mapa)
   7258 E5            [11] 2407 	push	hl
   7259 CD 71 4B      [17] 2408 	call	_getTilePtr
   725C F1            [10] 2409 	pop	af
   725D F1            [10] 2410 	pop	af
   725E 4E            [ 7] 2411 	ld	c,(hl)
   725F 3E 02         [ 7] 2412 	ld	a,#0x02
   7261 91            [ 4] 2413 	sub	a, c
   7262 DA A8 77      [10] 2414 	jp	C,00199$
                           2415 ;src/main.c:461: moverEnemigoArriba(enemy);
   7265 DD 6E F4      [19] 2416 	ld	l,-12 (ix)
   7268 DD 66 F5      [19] 2417 	ld	h,-11 (ix)
   726B E5            [11] 2418 	push	hl
   726C CD B9 6A      [17] 2419 	call	_moverEnemigoArriba
   726F F1            [10] 2420 	pop	af
                           2421 ;src/main.c:463: enemy->mover = SI;
   7270 DD 6E F8      [19] 2422 	ld	l,-8 (ix)
   7273 DD 66 F9      [19] 2423 	ld	h,-7 (ix)
   7276 36 01         [10] 2424 	ld	(hl),#0x01
   7278 C3 A8 77      [10] 2425 	jp	00199$
   727B                    2426 00129$:
                           2427 ;src/main.c:467: if(dist > G_ENEMY_H + 7) {
   727B 3E 1D         [ 7] 2428 	ld	a,#0x1D
   727D DD 96 F3      [19] 2429 	sub	a, -13 (ix)
   7280 D2 A8 77      [10] 2430 	jp	NC,00199$
                           2431 ;src/main.c:468: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7283 DD 7E FA      [19] 2432 	ld	a,-6 (ix)
   7286 C6 18         [ 7] 2433 	add	a, #0x18
   7288 57            [ 4] 2434 	ld	d,a
   7289 D5            [11] 2435 	push	de
   728A 33            [ 6] 2436 	inc	sp
   728B C5            [11] 2437 	push	bc
   728C 33            [ 6] 2438 	inc	sp
   728D 2A 50 64      [16] 2439 	ld	hl,(_mapa)
   7290 E5            [11] 2440 	push	hl
   7291 CD 71 4B      [17] 2441 	call	_getTilePtr
   7294 F1            [10] 2442 	pop	af
   7295 F1            [10] 2443 	pop	af
   7296 4E            [ 7] 2444 	ld	c,(hl)
   7297 3E 02         [ 7] 2445 	ld	a,#0x02
   7299 91            [ 4] 2446 	sub	a, c
   729A DA A8 77      [10] 2447 	jp	C,00199$
                           2448 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   729D DD 6E F6      [19] 2449 	ld	l,-10 (ix)
   72A0 DD 66 F7      [19] 2450 	ld	h,-9 (ix)
   72A3 7E            [ 7] 2451 	ld	a,(hl)
   72A4 C6 18         [ 7] 2452 	add	a, #0x18
   72A6 57            [ 4] 2453 	ld	d,a
   72A7 DD 6E F4      [19] 2454 	ld	l,-12 (ix)
   72AA DD 66 F5      [19] 2455 	ld	h,-11 (ix)
   72AD 46            [ 7] 2456 	ld	b,(hl)
   72AE 04            [ 4] 2457 	inc	b
   72AF 04            [ 4] 2458 	inc	b
   72B0 D5            [11] 2459 	push	de
   72B1 33            [ 6] 2460 	inc	sp
   72B2 C5            [11] 2461 	push	bc
   72B3 33            [ 6] 2462 	inc	sp
   72B4 2A 50 64      [16] 2463 	ld	hl,(_mapa)
   72B7 E5            [11] 2464 	push	hl
   72B8 CD 71 4B      [17] 2465 	call	_getTilePtr
   72BB F1            [10] 2466 	pop	af
   72BC F1            [10] 2467 	pop	af
   72BD 4E            [ 7] 2468 	ld	c,(hl)
   72BE 3E 02         [ 7] 2469 	ld	a,#0x02
   72C0 91            [ 4] 2470 	sub	a, c
   72C1 DA A8 77      [10] 2471 	jp	C,00199$
                           2472 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   72C4 DD 6E F6      [19] 2473 	ld	l,-10 (ix)
   72C7 DD 66 F7      [19] 2474 	ld	h,-9 (ix)
   72CA 7E            [ 7] 2475 	ld	a,(hl)
   72CB C6 18         [ 7] 2476 	add	a, #0x18
   72CD 47            [ 4] 2477 	ld	b,a
   72CE DD 6E F4      [19] 2478 	ld	l,-12 (ix)
   72D1 DD 66 F5      [19] 2479 	ld	h,-11 (ix)
   72D4 7E            [ 7] 2480 	ld	a,(hl)
   72D5 C6 04         [ 7] 2481 	add	a, #0x04
   72D7 C5            [11] 2482 	push	bc
   72D8 33            [ 6] 2483 	inc	sp
   72D9 F5            [11] 2484 	push	af
   72DA 33            [ 6] 2485 	inc	sp
   72DB 2A 50 64      [16] 2486 	ld	hl,(_mapa)
   72DE E5            [11] 2487 	push	hl
   72DF CD 71 4B      [17] 2488 	call	_getTilePtr
   72E2 F1            [10] 2489 	pop	af
   72E3 F1            [10] 2490 	pop	af
   72E4 4E            [ 7] 2491 	ld	c,(hl)
   72E5 3E 02         [ 7] 2492 	ld	a,#0x02
   72E7 91            [ 4] 2493 	sub	a, c
   72E8 DA A8 77      [10] 2494 	jp	C,00199$
                           2495 ;src/main.c:471: moverEnemigoAbajo(enemy);
   72EB DD 6E F4      [19] 2496 	ld	l,-12 (ix)
   72EE DD 66 F5      [19] 2497 	ld	h,-11 (ix)
   72F1 E5            [11] 2498 	push	hl
   72F2 CD D8 6A      [17] 2499 	call	_moverEnemigoAbajo
   72F5 F1            [10] 2500 	pop	af
                           2501 ;src/main.c:473: enemy->mover = SI;
   72F6 DD 6E F8      [19] 2502 	ld	l,-8 (ix)
   72F9 DD 66 F9      [19] 2503 	ld	h,-7 (ix)
   72FC 36 01         [10] 2504 	ld	(hl),#0x01
   72FE C3 A8 77      [10] 2505 	jp	00199$
   7301                    2506 00192$:
                           2507 ;src/main.c:479: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7301 3A 43 64      [13] 2508 	ld	a, (#_prota + 6)
   7304 B7            [ 4] 2509 	or	a, a
   7305 20 02         [12] 2510 	jr	NZ,00132$
   7307 0E 14         [ 7] 2511 	ld	c,#0x14
   7309                    2512 00132$:
                           2513 ;src/main.c:481: if (dist > distConstraint) {
   7309 79            [ 4] 2514 	ld	a,c
   730A DD 96 F3      [19] 2515 	sub	a, -13 (ix)
   730D D2 A8 77      [10] 2516 	jp	NC,00199$
                           2517 ;src/main.c:482: if (dx + 1 < enemy->x) {
   7310 DD 5E 06      [19] 2518 	ld	e,6 (ix)
   7313 16 00         [ 7] 2519 	ld	d,#0x00
   7315 13            [ 6] 2520 	inc	de
   7316 DD 73 FE      [19] 2521 	ld	-2 (ix),e
   7319 DD 72 FF      [19] 2522 	ld	-1 (ix),d
   731C DD 70 FC      [19] 2523 	ld	-4 (ix),b
   731F DD 36 FD 00   [19] 2524 	ld	-3 (ix),#0x00
   7323 DD 7E FE      [19] 2525 	ld	a,-2 (ix)
   7326 DD 96 FC      [19] 2526 	sub	a, -4 (ix)
   7329 DD 7E FF      [19] 2527 	ld	a,-1 (ix)
   732C DD 9E FD      [19] 2528 	sbc	a, -3 (ix)
   732F E2 34 73      [10] 2529 	jp	PO, 00427$
   7332 EE 80         [ 7] 2530 	xor	a, #0x80
   7334                    2531 00427$:
   7334 F2 B0 73      [10] 2532 	jp	P,00144$
                           2533 ;src/main.c:483: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7337 DD 7E FA      [19] 2534 	ld	a,-6 (ix)
   733A F5            [11] 2535 	push	af
   733B 33            [ 6] 2536 	inc	sp
   733C C5            [11] 2537 	push	bc
   733D 33            [ 6] 2538 	inc	sp
   733E 2A 50 64      [16] 2539 	ld	hl,(_mapa)
   7341 E5            [11] 2540 	push	hl
   7342 CD 71 4B      [17] 2541 	call	_getTilePtr
   7345 F1            [10] 2542 	pop	af
   7346 F1            [10] 2543 	pop	af
   7347 4E            [ 7] 2544 	ld	c,(hl)
   7348 3E 02         [ 7] 2545 	ld	a,#0x02
   734A 91            [ 4] 2546 	sub	a, c
   734B DA 3D 74      [10] 2547 	jp	C,00145$
                           2548 ;src/main.c:484: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   734E DD 6E F6      [19] 2549 	ld	l,-10 (ix)
   7351 DD 66 F7      [19] 2550 	ld	h,-9 (ix)
   7354 7E            [ 7] 2551 	ld	a,(hl)
   7355 C6 0B         [ 7] 2552 	add	a, #0x0B
   7357 DD 6E F4      [19] 2553 	ld	l,-12 (ix)
   735A DD 66 F5      [19] 2554 	ld	h,-11 (ix)
   735D 46            [ 7] 2555 	ld	b,(hl)
   735E F5            [11] 2556 	push	af
   735F 33            [ 6] 2557 	inc	sp
   7360 C5            [11] 2558 	push	bc
   7361 33            [ 6] 2559 	inc	sp
   7362 2A 50 64      [16] 2560 	ld	hl,(_mapa)
   7365 E5            [11] 2561 	push	hl
   7366 CD 71 4B      [17] 2562 	call	_getTilePtr
   7369 F1            [10] 2563 	pop	af
   736A F1            [10] 2564 	pop	af
   736B 4E            [ 7] 2565 	ld	c,(hl)
   736C 3E 02         [ 7] 2566 	ld	a,#0x02
   736E 91            [ 4] 2567 	sub	a, c
   736F DA 3D 74      [10] 2568 	jp	C,00145$
                           2569 ;src/main.c:485: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7372 DD 6E F6      [19] 2570 	ld	l,-10 (ix)
   7375 DD 66 F7      [19] 2571 	ld	h,-9 (ix)
   7378 7E            [ 7] 2572 	ld	a,(hl)
   7379 C6 16         [ 7] 2573 	add	a, #0x16
   737B DD 6E F4      [19] 2574 	ld	l,-12 (ix)
   737E DD 66 F5      [19] 2575 	ld	h,-11 (ix)
   7381 46            [ 7] 2576 	ld	b,(hl)
   7382 F5            [11] 2577 	push	af
   7383 33            [ 6] 2578 	inc	sp
   7384 C5            [11] 2579 	push	bc
   7385 33            [ 6] 2580 	inc	sp
   7386 2A 50 64      [16] 2581 	ld	hl,(_mapa)
   7389 E5            [11] 2582 	push	hl
   738A CD 71 4B      [17] 2583 	call	_getTilePtr
   738D F1            [10] 2584 	pop	af
   738E F1            [10] 2585 	pop	af
   738F 4E            [ 7] 2586 	ld	c,(hl)
   7390 3E 02         [ 7] 2587 	ld	a,#0x02
   7392 91            [ 4] 2588 	sub	a, c
   7393 DA 3D 74      [10] 2589 	jp	C,00145$
                           2590 ;src/main.c:486: moverEnemigoIzquierda(enemy);
   7396 DD 6E F4      [19] 2591 	ld	l,-12 (ix)
   7399 DD 66 F5      [19] 2592 	ld	h,-11 (ix)
   739C E5            [11] 2593 	push	hl
   739D CD 07 6B      [17] 2594 	call	_moverEnemigoIzquierda
   73A0 F1            [10] 2595 	pop	af
                           2596 ;src/main.c:487: movX = 1;
   73A1 DD 36 F2 01   [19] 2597 	ld	-14 (ix),#0x01
                           2598 ;src/main.c:488: enemy->mover = SI;
   73A5 DD 6E F8      [19] 2599 	ld	l,-8 (ix)
   73A8 DD 66 F9      [19] 2600 	ld	h,-7 (ix)
   73AB 36 01         [10] 2601 	ld	(hl),#0x01
   73AD C3 3D 74      [10] 2602 	jp	00145$
   73B0                    2603 00144$:
                           2604 ;src/main.c:490: } else if (dx + 1 > enemy->x){
   73B0 DD 7E FC      [19] 2605 	ld	a,-4 (ix)
   73B3 DD 96 FE      [19] 2606 	sub	a, -2 (ix)
   73B6 DD 7E FD      [19] 2607 	ld	a,-3 (ix)
   73B9 DD 9E FF      [19] 2608 	sbc	a, -1 (ix)
   73BC E2 C1 73      [10] 2609 	jp	PO, 00428$
   73BF EE 80         [ 7] 2610 	xor	a, #0x80
   73C1                    2611 00428$:
   73C1 F2 3D 74      [10] 2612 	jp	P,00145$
                           2613 ;src/main.c:491: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   73C4 DD 66 FA      [19] 2614 	ld	h,-6 (ix)
   73C7 DD 6E FB      [19] 2615 	ld	l,-5 (ix)
   73CA E5            [11] 2616 	push	hl
   73CB 2A 50 64      [16] 2617 	ld	hl,(_mapa)
   73CE E5            [11] 2618 	push	hl
   73CF CD 71 4B      [17] 2619 	call	_getTilePtr
   73D2 F1            [10] 2620 	pop	af
   73D3 F1            [10] 2621 	pop	af
   73D4 4E            [ 7] 2622 	ld	c,(hl)
   73D5 3E 02         [ 7] 2623 	ld	a,#0x02
   73D7 91            [ 4] 2624 	sub	a, c
   73D8 38 63         [12] 2625 	jr	C,00145$
                           2626 ;src/main.c:492: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   73DA DD 6E F6      [19] 2627 	ld	l,-10 (ix)
   73DD DD 66 F7      [19] 2628 	ld	h,-9 (ix)
   73E0 7E            [ 7] 2629 	ld	a,(hl)
   73E1 C6 0B         [ 7] 2630 	add	a, #0x0B
   73E3 47            [ 4] 2631 	ld	b,a
   73E4 DD 6E F4      [19] 2632 	ld	l,-12 (ix)
   73E7 DD 66 F5      [19] 2633 	ld	h,-11 (ix)
   73EA 7E            [ 7] 2634 	ld	a,(hl)
   73EB C6 04         [ 7] 2635 	add	a, #0x04
   73ED C5            [11] 2636 	push	bc
   73EE 33            [ 6] 2637 	inc	sp
   73EF F5            [11] 2638 	push	af
   73F0 33            [ 6] 2639 	inc	sp
   73F1 2A 50 64      [16] 2640 	ld	hl,(_mapa)
   73F4 E5            [11] 2641 	push	hl
   73F5 CD 71 4B      [17] 2642 	call	_getTilePtr
   73F8 F1            [10] 2643 	pop	af
   73F9 F1            [10] 2644 	pop	af
   73FA 4E            [ 7] 2645 	ld	c,(hl)
   73FB 3E 02         [ 7] 2646 	ld	a,#0x02
   73FD 91            [ 4] 2647 	sub	a, c
   73FE 38 3D         [12] 2648 	jr	C,00145$
                           2649 ;src/main.c:493: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7400 DD 6E F6      [19] 2650 	ld	l,-10 (ix)
   7403 DD 66 F7      [19] 2651 	ld	h,-9 (ix)
   7406 7E            [ 7] 2652 	ld	a,(hl)
   7407 C6 16         [ 7] 2653 	add	a, #0x16
   7409 47            [ 4] 2654 	ld	b,a
   740A DD 6E F4      [19] 2655 	ld	l,-12 (ix)
   740D DD 66 F5      [19] 2656 	ld	h,-11 (ix)
   7410 7E            [ 7] 2657 	ld	a,(hl)
   7411 C6 04         [ 7] 2658 	add	a, #0x04
   7413 C5            [11] 2659 	push	bc
   7414 33            [ 6] 2660 	inc	sp
   7415 F5            [11] 2661 	push	af
   7416 33            [ 6] 2662 	inc	sp
   7417 2A 50 64      [16] 2663 	ld	hl,(_mapa)
   741A E5            [11] 2664 	push	hl
   741B CD 71 4B      [17] 2665 	call	_getTilePtr
   741E F1            [10] 2666 	pop	af
   741F F1            [10] 2667 	pop	af
   7420 4E            [ 7] 2668 	ld	c,(hl)
   7421 3E 02         [ 7] 2669 	ld	a,#0x02
   7423 91            [ 4] 2670 	sub	a, c
   7424 38 17         [12] 2671 	jr	C,00145$
                           2672 ;src/main.c:494: moverEnemigoDerecha(enemy);
   7426 DD 6E F4      [19] 2673 	ld	l,-12 (ix)
   7429 DD 66 F5      [19] 2674 	ld	h,-11 (ix)
   742C E5            [11] 2675 	push	hl
   742D CD F7 6A      [17] 2676 	call	_moverEnemigoDerecha
   7430 F1            [10] 2677 	pop	af
                           2678 ;src/main.c:495: movX = 1;
   7431 DD 36 F2 01   [19] 2679 	ld	-14 (ix),#0x01
                           2680 ;src/main.c:496: enemy->mover = SI;
   7435 DD 6E F8      [19] 2681 	ld	l,-8 (ix)
   7438 DD 66 F9      [19] 2682 	ld	h,-7 (ix)
   743B 36 01         [10] 2683 	ld	(hl),#0x01
   743D                    2684 00145$:
                           2685 ;src/main.c:499: if (dy < enemy->y) {
   743D DD 6E F6      [19] 2686 	ld	l,-10 (ix)
   7440 DD 66 F7      [19] 2687 	ld	h,-9 (ix)
   7443 4E            [ 7] 2688 	ld	c,(hl)
                           2689 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7444 DD 6E F4      [19] 2690 	ld	l,-12 (ix)
   7447 DD 66 F5      [19] 2691 	ld	h,-11 (ix)
   744A 46            [ 7] 2692 	ld	b,(hl)
                           2693 ;src/main.c:499: if (dy < enemy->y) {
   744B DD 7E 07      [19] 2694 	ld	a,7 (ix)
   744E 91            [ 4] 2695 	sub	a, c
   744F D2 CF 74      [10] 2696 	jp	NC,00155$
                           2697 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7452 51            [ 4] 2698 	ld	d,c
   7453 15            [ 4] 2699 	dec	d
   7454 15            [ 4] 2700 	dec	d
   7455 D5            [11] 2701 	push	de
   7456 33            [ 6] 2702 	inc	sp
   7457 C5            [11] 2703 	push	bc
   7458 33            [ 6] 2704 	inc	sp
   7459 2A 50 64      [16] 2705 	ld	hl,(_mapa)
   745C E5            [11] 2706 	push	hl
   745D CD 71 4B      [17] 2707 	call	_getTilePtr
   7460 F1            [10] 2708 	pop	af
   7461 F1            [10] 2709 	pop	af
   7462 4E            [ 7] 2710 	ld	c,(hl)
   7463 3E 02         [ 7] 2711 	ld	a,#0x02
   7465 91            [ 4] 2712 	sub	a, c
   7466 DA 49 75      [10] 2713 	jp	C,00156$
                           2714 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7469 DD 6E F6      [19] 2715 	ld	l,-10 (ix)
   746C DD 66 F7      [19] 2716 	ld	h,-9 (ix)
   746F 56            [ 7] 2717 	ld	d,(hl)
   7470 15            [ 4] 2718 	dec	d
   7471 15            [ 4] 2719 	dec	d
   7472 DD 6E F4      [19] 2720 	ld	l,-12 (ix)
   7475 DD 66 F5      [19] 2721 	ld	h,-11 (ix)
   7478 46            [ 7] 2722 	ld	b,(hl)
   7479 04            [ 4] 2723 	inc	b
   747A 04            [ 4] 2724 	inc	b
   747B D5            [11] 2725 	push	de
   747C 33            [ 6] 2726 	inc	sp
   747D C5            [11] 2727 	push	bc
   747E 33            [ 6] 2728 	inc	sp
   747F 2A 50 64      [16] 2729 	ld	hl,(_mapa)
   7482 E5            [11] 2730 	push	hl
   7483 CD 71 4B      [17] 2731 	call	_getTilePtr
   7486 F1            [10] 2732 	pop	af
   7487 F1            [10] 2733 	pop	af
   7488 4E            [ 7] 2734 	ld	c,(hl)
   7489 3E 02         [ 7] 2735 	ld	a,#0x02
   748B 91            [ 4] 2736 	sub	a, c
   748C DA 49 75      [10] 2737 	jp	C,00156$
                           2738 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   748F DD 6E F6      [19] 2739 	ld	l,-10 (ix)
   7492 DD 66 F7      [19] 2740 	ld	h,-9 (ix)
   7495 46            [ 7] 2741 	ld	b,(hl)
   7496 05            [ 4] 2742 	dec	b
   7497 05            [ 4] 2743 	dec	b
   7498 DD 6E F4      [19] 2744 	ld	l,-12 (ix)
   749B DD 66 F5      [19] 2745 	ld	h,-11 (ix)
   749E 7E            [ 7] 2746 	ld	a,(hl)
   749F C6 04         [ 7] 2747 	add	a, #0x04
   74A1 C5            [11] 2748 	push	bc
   74A2 33            [ 6] 2749 	inc	sp
   74A3 F5            [11] 2750 	push	af
   74A4 33            [ 6] 2751 	inc	sp
   74A5 2A 50 64      [16] 2752 	ld	hl,(_mapa)
   74A8 E5            [11] 2753 	push	hl
   74A9 CD 71 4B      [17] 2754 	call	_getTilePtr
   74AC F1            [10] 2755 	pop	af
   74AD F1            [10] 2756 	pop	af
   74AE 4E            [ 7] 2757 	ld	c,(hl)
   74AF 3E 02         [ 7] 2758 	ld	a,#0x02
   74B1 91            [ 4] 2759 	sub	a, c
   74B2 DA 49 75      [10] 2760 	jp	C,00156$
                           2761 ;src/main.c:503: moverEnemigoArriba(enemy);
   74B5 DD 6E F4      [19] 2762 	ld	l,-12 (ix)
   74B8 DD 66 F5      [19] 2763 	ld	h,-11 (ix)
   74BB E5            [11] 2764 	push	hl
   74BC CD B9 6A      [17] 2765 	call	_moverEnemigoArriba
   74BF F1            [10] 2766 	pop	af
                           2767 ;src/main.c:504: movY = 1;
   74C0 DD 36 F1 01   [19] 2768 	ld	-15 (ix),#0x01
                           2769 ;src/main.c:505: enemy->mover = SI;
   74C4 DD 6E F8      [19] 2770 	ld	l,-8 (ix)
   74C7 DD 66 F9      [19] 2771 	ld	h,-7 (ix)
   74CA 36 01         [10] 2772 	ld	(hl),#0x01
   74CC C3 49 75      [10] 2773 	jp	00156$
   74CF                    2774 00155$:
                           2775 ;src/main.c:508: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   74CF 79            [ 4] 2776 	ld	a,c
   74D0 C6 18         [ 7] 2777 	add	a, #0x18
   74D2 57            [ 4] 2778 	ld	d,a
   74D3 D5            [11] 2779 	push	de
   74D4 33            [ 6] 2780 	inc	sp
   74D5 C5            [11] 2781 	push	bc
   74D6 33            [ 6] 2782 	inc	sp
   74D7 2A 50 64      [16] 2783 	ld	hl,(_mapa)
   74DA E5            [11] 2784 	push	hl
   74DB CD 71 4B      [17] 2785 	call	_getTilePtr
   74DE F1            [10] 2786 	pop	af
   74DF F1            [10] 2787 	pop	af
   74E0 4E            [ 7] 2788 	ld	c,(hl)
   74E1 3E 02         [ 7] 2789 	ld	a,#0x02
   74E3 91            [ 4] 2790 	sub	a, c
   74E4 38 63         [12] 2791 	jr	C,00156$
                           2792 ;src/main.c:509: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   74E6 DD 6E F6      [19] 2793 	ld	l,-10 (ix)
   74E9 DD 66 F7      [19] 2794 	ld	h,-9 (ix)
   74EC 7E            [ 7] 2795 	ld	a,(hl)
   74ED C6 18         [ 7] 2796 	add	a, #0x18
   74EF 57            [ 4] 2797 	ld	d,a
   74F0 DD 6E F4      [19] 2798 	ld	l,-12 (ix)
   74F3 DD 66 F5      [19] 2799 	ld	h,-11 (ix)
   74F6 46            [ 7] 2800 	ld	b,(hl)
   74F7 04            [ 4] 2801 	inc	b
   74F8 04            [ 4] 2802 	inc	b
   74F9 D5            [11] 2803 	push	de
   74FA 33            [ 6] 2804 	inc	sp
   74FB C5            [11] 2805 	push	bc
   74FC 33            [ 6] 2806 	inc	sp
   74FD 2A 50 64      [16] 2807 	ld	hl,(_mapa)
   7500 E5            [11] 2808 	push	hl
   7501 CD 71 4B      [17] 2809 	call	_getTilePtr
   7504 F1            [10] 2810 	pop	af
   7505 F1            [10] 2811 	pop	af
   7506 4E            [ 7] 2812 	ld	c,(hl)
   7507 3E 02         [ 7] 2813 	ld	a,#0x02
   7509 91            [ 4] 2814 	sub	a, c
   750A 38 3D         [12] 2815 	jr	C,00156$
                           2816 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   750C DD 6E F6      [19] 2817 	ld	l,-10 (ix)
   750F DD 66 F7      [19] 2818 	ld	h,-9 (ix)
   7512 7E            [ 7] 2819 	ld	a,(hl)
   7513 C6 18         [ 7] 2820 	add	a, #0x18
   7515 47            [ 4] 2821 	ld	b,a
   7516 DD 6E F4      [19] 2822 	ld	l,-12 (ix)
   7519 DD 66 F5      [19] 2823 	ld	h,-11 (ix)
   751C 7E            [ 7] 2824 	ld	a,(hl)
   751D C6 04         [ 7] 2825 	add	a, #0x04
   751F C5            [11] 2826 	push	bc
   7520 33            [ 6] 2827 	inc	sp
   7521 F5            [11] 2828 	push	af
   7522 33            [ 6] 2829 	inc	sp
   7523 2A 50 64      [16] 2830 	ld	hl,(_mapa)
   7526 E5            [11] 2831 	push	hl
   7527 CD 71 4B      [17] 2832 	call	_getTilePtr
   752A F1            [10] 2833 	pop	af
   752B F1            [10] 2834 	pop	af
   752C 4E            [ 7] 2835 	ld	c,(hl)
   752D 3E 02         [ 7] 2836 	ld	a,#0x02
   752F 91            [ 4] 2837 	sub	a, c
   7530 38 17         [12] 2838 	jr	C,00156$
                           2839 ;src/main.c:511: moverEnemigoAbajo(enemy);
   7532 DD 6E F4      [19] 2840 	ld	l,-12 (ix)
   7535 DD 66 F5      [19] 2841 	ld	h,-11 (ix)
   7538 E5            [11] 2842 	push	hl
   7539 CD D8 6A      [17] 2843 	call	_moverEnemigoAbajo
   753C F1            [10] 2844 	pop	af
                           2845 ;src/main.c:512: movY = 1;
   753D DD 36 F1 01   [19] 2846 	ld	-15 (ix),#0x01
                           2847 ;src/main.c:513: enemy->mover = SI;
   7541 DD 6E F8      [19] 2848 	ld	l,-8 (ix)
   7544 DD 66 F9      [19] 2849 	ld	h,-7 (ix)
   7547 36 01         [10] 2850 	ld	(hl),#0x01
   7549                    2851 00156$:
                           2852 ;src/main.c:516: if (!enemy->mover) {
   7549 DD 6E F8      [19] 2853 	ld	l,-8 (ix)
   754C DD 66 F9      [19] 2854 	ld	h,-7 (ix)
   754F 7E            [ 7] 2855 	ld	a,(hl)
   7550 B7            [ 4] 2856 	or	a, a
   7551 C2 A8 77      [10] 2857 	jp	NZ,00199$
                           2858 ;src/main.c:517: if (!movX) {
   7554 DD 7E F2      [19] 2859 	ld	a,-14 (ix)
   7557 B7            [ 4] 2860 	or	a, a
   7558 C2 81 76      [10] 2861 	jp	NZ,00171$
                           2862 ;src/main.c:518: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   755B DD 6E F6      [19] 2863 	ld	l,-10 (ix)
   755E DD 66 F7      [19] 2864 	ld	h,-9 (ix)
   7561 5E            [ 7] 2865 	ld	e,(hl)
                           2866 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7562 DD 6E F4      [19] 2867 	ld	l,-12 (ix)
   7565 DD 66 F5      [19] 2868 	ld	h,-11 (ix)
   7568 4E            [ 7] 2869 	ld	c,(hl)
                           2870 ;src/main.c:518: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7569 3E 70         [ 7] 2871 	ld	a,#0x70
   756B 93            [ 4] 2872 	sub	a, e
   756C D2 FC 75      [10] 2873 	jp	NC,00168$
                           2874 ;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   756F 7B            [ 4] 2875 	ld	a,e
   7570 C6 18         [ 7] 2876 	add	a, #0x18
   7572 47            [ 4] 2877 	ld	b,a
   7573 C5            [11] 2878 	push	bc
   7574 2A 50 64      [16] 2879 	ld	hl,(_mapa)
   7577 E5            [11] 2880 	push	hl
   7578 CD 71 4B      [17] 2881 	call	_getTilePtr
   757B F1            [10] 2882 	pop	af
   757C F1            [10] 2883 	pop	af
   757D 4E            [ 7] 2884 	ld	c,(hl)
   757E 3E 02         [ 7] 2885 	ld	a,#0x02
   7580 91            [ 4] 2886 	sub	a, c
   7581 38 63         [12] 2887 	jr	C,00158$
                           2888 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7583 DD 6E F6      [19] 2889 	ld	l,-10 (ix)
   7586 DD 66 F7      [19] 2890 	ld	h,-9 (ix)
   7589 7E            [ 7] 2891 	ld	a,(hl)
   758A C6 18         [ 7] 2892 	add	a, #0x18
   758C 57            [ 4] 2893 	ld	d,a
   758D DD 6E F4      [19] 2894 	ld	l,-12 (ix)
   7590 DD 66 F5      [19] 2895 	ld	h,-11 (ix)
   7593 4E            [ 7] 2896 	ld	c,(hl)
   7594 41            [ 4] 2897 	ld	b,c
   7595 04            [ 4] 2898 	inc	b
   7596 04            [ 4] 2899 	inc	b
   7597 D5            [11] 2900 	push	de
   7598 33            [ 6] 2901 	inc	sp
   7599 C5            [11] 2902 	push	bc
   759A 33            [ 6] 2903 	inc	sp
   759B 2A 50 64      [16] 2904 	ld	hl,(_mapa)
   759E E5            [11] 2905 	push	hl
   759F CD 71 4B      [17] 2906 	call	_getTilePtr
   75A2 F1            [10] 2907 	pop	af
   75A3 F1            [10] 2908 	pop	af
   75A4 4E            [ 7] 2909 	ld	c,(hl)
   75A5 3E 02         [ 7] 2910 	ld	a,#0x02
   75A7 91            [ 4] 2911 	sub	a, c
   75A8 38 3C         [12] 2912 	jr	C,00158$
                           2913 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   75AA DD 6E F6      [19] 2914 	ld	l,-10 (ix)
   75AD DD 66 F7      [19] 2915 	ld	h,-9 (ix)
   75B0 7E            [ 7] 2916 	ld	a,(hl)
   75B1 C6 18         [ 7] 2917 	add	a, #0x18
   75B3 47            [ 4] 2918 	ld	b,a
   75B4 DD 6E F4      [19] 2919 	ld	l,-12 (ix)
   75B7 DD 66 F5      [19] 2920 	ld	h,-11 (ix)
   75BA 7E            [ 7] 2921 	ld	a,(hl)
   75BB C6 04         [ 7] 2922 	add	a, #0x04
   75BD C5            [11] 2923 	push	bc
   75BE 33            [ 6] 2924 	inc	sp
   75BF F5            [11] 2925 	push	af
   75C0 33            [ 6] 2926 	inc	sp
   75C1 2A 50 64      [16] 2927 	ld	hl,(_mapa)
   75C4 E5            [11] 2928 	push	hl
   75C5 CD 71 4B      [17] 2929 	call	_getTilePtr
   75C8 F1            [10] 2930 	pop	af
   75C9 F1            [10] 2931 	pop	af
   75CA 4E            [ 7] 2932 	ld	c,(hl)
   75CB 3E 02         [ 7] 2933 	ld	a,#0x02
   75CD 91            [ 4] 2934 	sub	a, c
   75CE 38 16         [12] 2935 	jr	C,00158$
                           2936 ;src/main.c:522: moverEnemigoAbajo(enemy);
   75D0 DD 6E F4      [19] 2937 	ld	l,-12 (ix)
   75D3 DD 66 F5      [19] 2938 	ld	h,-11 (ix)
   75D6 E5            [11] 2939 	push	hl
   75D7 CD D8 6A      [17] 2940 	call	_moverEnemigoAbajo
   75DA F1            [10] 2941 	pop	af
                           2942 ;src/main.c:523: enemy->mover = SI;
   75DB DD 6E F8      [19] 2943 	ld	l,-8 (ix)
   75DE DD 66 F9      [19] 2944 	ld	h,-7 (ix)
   75E1 36 01         [10] 2945 	ld	(hl),#0x01
   75E3 C3 81 76      [10] 2946 	jp	00171$
   75E6                    2947 00158$:
                           2948 ;src/main.c:525: moverEnemigoArriba(enemy);
   75E6 DD 6E F4      [19] 2949 	ld	l,-12 (ix)
   75E9 DD 66 F5      [19] 2950 	ld	h,-11 (ix)
   75EC E5            [11] 2951 	push	hl
   75ED CD B9 6A      [17] 2952 	call	_moverEnemigoArriba
   75F0 F1            [10] 2953 	pop	af
                           2954 ;src/main.c:526: enemy->mover = SI;
   75F1 DD 6E F8      [19] 2955 	ld	l,-8 (ix)
   75F4 DD 66 F9      [19] 2956 	ld	h,-7 (ix)
   75F7 36 01         [10] 2957 	ld	(hl),#0x01
   75F9 C3 81 76      [10] 2958 	jp	00171$
   75FC                    2959 00168$:
                           2960 ;src/main.c:529: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75FC 43            [ 4] 2961 	ld	b,e
   75FD 05            [ 4] 2962 	dec	b
   75FE 05            [ 4] 2963 	dec	b
   75FF C5            [11] 2964 	push	bc
   7600 2A 50 64      [16] 2965 	ld	hl,(_mapa)
   7603 E5            [11] 2966 	push	hl
   7604 CD 71 4B      [17] 2967 	call	_getTilePtr
   7607 F1            [10] 2968 	pop	af
   7608 F1            [10] 2969 	pop	af
   7609 4E            [ 7] 2970 	ld	c,(hl)
   760A 3E 02         [ 7] 2971 	ld	a,#0x02
   760C 91            [ 4] 2972 	sub	a, c
   760D 38 5F         [12] 2973 	jr	C,00163$
                           2974 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   760F DD 6E F6      [19] 2975 	ld	l,-10 (ix)
   7612 DD 66 F7      [19] 2976 	ld	h,-9 (ix)
   7615 56            [ 7] 2977 	ld	d,(hl)
   7616 15            [ 4] 2978 	dec	d
   7617 15            [ 4] 2979 	dec	d
   7618 DD 6E F4      [19] 2980 	ld	l,-12 (ix)
   761B DD 66 F5      [19] 2981 	ld	h,-11 (ix)
   761E 46            [ 7] 2982 	ld	b,(hl)
   761F 04            [ 4] 2983 	inc	b
   7620 04            [ 4] 2984 	inc	b
   7621 D5            [11] 2985 	push	de
   7622 33            [ 6] 2986 	inc	sp
   7623 C5            [11] 2987 	push	bc
   7624 33            [ 6] 2988 	inc	sp
   7625 2A 50 64      [16] 2989 	ld	hl,(_mapa)
   7628 E5            [11] 2990 	push	hl
   7629 CD 71 4B      [17] 2991 	call	_getTilePtr
   762C F1            [10] 2992 	pop	af
   762D F1            [10] 2993 	pop	af
   762E 4E            [ 7] 2994 	ld	c,(hl)
   762F 3E 02         [ 7] 2995 	ld	a,#0x02
   7631 91            [ 4] 2996 	sub	a, c
   7632 38 3A         [12] 2997 	jr	C,00163$
                           2998 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7634 DD 6E F6      [19] 2999 	ld	l,-10 (ix)
   7637 DD 66 F7      [19] 3000 	ld	h,-9 (ix)
   763A 46            [ 7] 3001 	ld	b,(hl)
   763B 05            [ 4] 3002 	dec	b
   763C 05            [ 4] 3003 	dec	b
   763D DD 6E F4      [19] 3004 	ld	l,-12 (ix)
   7640 DD 66 F5      [19] 3005 	ld	h,-11 (ix)
   7643 7E            [ 7] 3006 	ld	a,(hl)
   7644 C6 04         [ 7] 3007 	add	a, #0x04
   7646 C5            [11] 3008 	push	bc
   7647 33            [ 6] 3009 	inc	sp
   7648 F5            [11] 3010 	push	af
   7649 33            [ 6] 3011 	inc	sp
   764A 2A 50 64      [16] 3012 	ld	hl,(_mapa)
   764D E5            [11] 3013 	push	hl
   764E CD 71 4B      [17] 3014 	call	_getTilePtr
   7651 F1            [10] 3015 	pop	af
   7652 F1            [10] 3016 	pop	af
   7653 4E            [ 7] 3017 	ld	c,(hl)
   7654 3E 02         [ 7] 3018 	ld	a,#0x02
   7656 91            [ 4] 3019 	sub	a, c
   7657 38 15         [12] 3020 	jr	C,00163$
                           3021 ;src/main.c:532: moverEnemigoArriba(enemy);
   7659 DD 6E F4      [19] 3022 	ld	l,-12 (ix)
   765C DD 66 F5      [19] 3023 	ld	h,-11 (ix)
   765F E5            [11] 3024 	push	hl
   7660 CD B9 6A      [17] 3025 	call	_moverEnemigoArriba
   7663 F1            [10] 3026 	pop	af
                           3027 ;src/main.c:533: enemy->mover = SI;
   7664 DD 6E F8      [19] 3028 	ld	l,-8 (ix)
   7667 DD 66 F9      [19] 3029 	ld	h,-7 (ix)
   766A 36 01         [10] 3030 	ld	(hl),#0x01
   766C 18 13         [12] 3031 	jr	00171$
   766E                    3032 00163$:
                           3033 ;src/main.c:535: moverEnemigoAbajo(enemy);
   766E DD 6E F4      [19] 3034 	ld	l,-12 (ix)
   7671 DD 66 F5      [19] 3035 	ld	h,-11 (ix)
   7674 E5            [11] 3036 	push	hl
   7675 CD D8 6A      [17] 3037 	call	_moverEnemigoAbajo
   7678 F1            [10] 3038 	pop	af
                           3039 ;src/main.c:536: enemy->mover = SI;
   7679 DD 6E F8      [19] 3040 	ld	l,-8 (ix)
   767C DD 66 F9      [19] 3041 	ld	h,-7 (ix)
   767F 36 01         [10] 3042 	ld	(hl),#0x01
   7681                    3043 00171$:
                           3044 ;src/main.c:541: if (!movY) {
   7681 DD 7E F1      [19] 3045 	ld	a,-15 (ix)
   7684 B7            [ 4] 3046 	or	a, a
   7685 C2 A8 77      [10] 3047 	jp	NZ,00199$
                           3048 ;src/main.c:542: if (enemy->x < ANCHO_PANTALLA/2) {
   7688 DD 6E F4      [19] 3049 	ld	l,-12 (ix)
   768B DD 66 F5      [19] 3050 	ld	h,-11 (ix)
   768E 4E            [ 7] 3051 	ld	c,(hl)
                           3052 ;src/main.c:424: u8 dify = abs(enemy->y - prota.y);
   768F DD 6E F6      [19] 3053 	ld	l,-10 (ix)
   7692 DD 66 F7      [19] 3054 	ld	h,-9 (ix)
   7695 46            [ 7] 3055 	ld	b,(hl)
                           3056 ;src/main.c:542: if (enemy->x < ANCHO_PANTALLA/2) {
   7696 79            [ 4] 3057 	ld	a,c
   7697 D6 28         [ 7] 3058 	sub	a, #0x28
   7699 D2 1E 77      [10] 3059 	jp	NC,00183$
                           3060 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   769C C5            [11] 3061 	push	bc
   769D 2A 50 64      [16] 3062 	ld	hl,(_mapa)
   76A0 E5            [11] 3063 	push	hl
   76A1 CD 71 4B      [17] 3064 	call	_getTilePtr
   76A4 F1            [10] 3065 	pop	af
   76A5 F1            [10] 3066 	pop	af
   76A6 4E            [ 7] 3067 	ld	c,(hl)
   76A7 3E 02         [ 7] 3068 	ld	a,#0x02
   76A9 91            [ 4] 3069 	sub	a, c
   76AA 38 5C         [12] 3070 	jr	C,00173$
                           3071 ;src/main.c:544: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   76AC DD 6E F6      [19] 3072 	ld	l,-10 (ix)
   76AF DD 66 F7      [19] 3073 	ld	h,-9 (ix)
   76B2 7E            [ 7] 3074 	ld	a,(hl)
   76B3 C6 0B         [ 7] 3075 	add	a, #0x0B
   76B5 DD 6E F4      [19] 3076 	ld	l,-12 (ix)
   76B8 DD 66 F5      [19] 3077 	ld	h,-11 (ix)
   76BB 46            [ 7] 3078 	ld	b,(hl)
   76BC F5            [11] 3079 	push	af
   76BD 33            [ 6] 3080 	inc	sp
   76BE C5            [11] 3081 	push	bc
   76BF 33            [ 6] 3082 	inc	sp
   76C0 2A 50 64      [16] 3083 	ld	hl,(_mapa)
   76C3 E5            [11] 3084 	push	hl
   76C4 CD 71 4B      [17] 3085 	call	_getTilePtr
   76C7 F1            [10] 3086 	pop	af
   76C8 F1            [10] 3087 	pop	af
   76C9 4E            [ 7] 3088 	ld	c,(hl)
   76CA 3E 02         [ 7] 3089 	ld	a,#0x02
   76CC 91            [ 4] 3090 	sub	a, c
   76CD 38 39         [12] 3091 	jr	C,00173$
                           3092 ;src/main.c:545: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   76CF DD 6E F6      [19] 3093 	ld	l,-10 (ix)
   76D2 DD 66 F7      [19] 3094 	ld	h,-9 (ix)
   76D5 7E            [ 7] 3095 	ld	a,(hl)
   76D6 C6 16         [ 7] 3096 	add	a, #0x16
   76D8 DD 6E F4      [19] 3097 	ld	l,-12 (ix)
   76DB DD 66 F5      [19] 3098 	ld	h,-11 (ix)
   76DE 46            [ 7] 3099 	ld	b,(hl)
   76DF F5            [11] 3100 	push	af
   76E0 33            [ 6] 3101 	inc	sp
   76E1 C5            [11] 3102 	push	bc
   76E2 33            [ 6] 3103 	inc	sp
   76E3 2A 50 64      [16] 3104 	ld	hl,(_mapa)
   76E6 E5            [11] 3105 	push	hl
   76E7 CD 71 4B      [17] 3106 	call	_getTilePtr
   76EA F1            [10] 3107 	pop	af
   76EB F1            [10] 3108 	pop	af
   76EC 4E            [ 7] 3109 	ld	c,(hl)
   76ED 3E 02         [ 7] 3110 	ld	a,#0x02
   76EF 91            [ 4] 3111 	sub	a, c
   76F0 38 16         [12] 3112 	jr	C,00173$
                           3113 ;src/main.c:546: moverEnemigoIzquierda(enemy);
   76F2 DD 6E F4      [19] 3114 	ld	l,-12 (ix)
   76F5 DD 66 F5      [19] 3115 	ld	h,-11 (ix)
   76F8 E5            [11] 3116 	push	hl
   76F9 CD 07 6B      [17] 3117 	call	_moverEnemigoIzquierda
   76FC F1            [10] 3118 	pop	af
                           3119 ;src/main.c:547: enemy->mover = SI;
   76FD DD 6E F8      [19] 3120 	ld	l,-8 (ix)
   7700 DD 66 F9      [19] 3121 	ld	h,-7 (ix)
   7703 36 01         [10] 3122 	ld	(hl),#0x01
   7705 C3 A8 77      [10] 3123 	jp	00199$
   7708                    3124 00173$:
                           3125 ;src/main.c:549: moverEnemigoDerecha(enemy);
   7708 DD 6E F4      [19] 3126 	ld	l,-12 (ix)
   770B DD 66 F5      [19] 3127 	ld	h,-11 (ix)
   770E E5            [11] 3128 	push	hl
   770F CD F7 6A      [17] 3129 	call	_moverEnemigoDerecha
   7712 F1            [10] 3130 	pop	af
                           3131 ;src/main.c:550: enemy->mover = SI;
   7713 DD 6E F8      [19] 3132 	ld	l,-8 (ix)
   7716 DD 66 F9      [19] 3133 	ld	h,-7 (ix)
   7719 36 01         [10] 3134 	ld	(hl),#0x01
   771B C3 A8 77      [10] 3135 	jp	00199$
   771E                    3136 00183$:
                           3137 ;src/main.c:553: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   771E 79            [ 4] 3138 	ld	a,c
   771F C6 04         [ 7] 3139 	add	a, #0x04
   7721 C5            [11] 3140 	push	bc
   7722 33            [ 6] 3141 	inc	sp
   7723 F5            [11] 3142 	push	af
   7724 33            [ 6] 3143 	inc	sp
   7725 2A 50 64      [16] 3144 	ld	hl,(_mapa)
   7728 E5            [11] 3145 	push	hl
   7729 CD 71 4B      [17] 3146 	call	_getTilePtr
   772C F1            [10] 3147 	pop	af
   772D F1            [10] 3148 	pop	af
   772E 4E            [ 7] 3149 	ld	c,(hl)
   772F 3E 02         [ 7] 3150 	ld	a,#0x02
   7731 91            [ 4] 3151 	sub	a, c
   7732 38 61         [12] 3152 	jr	C,00178$
                           3153 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7734 DD 6E F6      [19] 3154 	ld	l,-10 (ix)
   7737 DD 66 F7      [19] 3155 	ld	h,-9 (ix)
   773A 7E            [ 7] 3156 	ld	a,(hl)
   773B C6 0B         [ 7] 3157 	add	a, #0x0B
   773D 47            [ 4] 3158 	ld	b,a
   773E DD 6E F4      [19] 3159 	ld	l,-12 (ix)
   7741 DD 66 F5      [19] 3160 	ld	h,-11 (ix)
   7744 7E            [ 7] 3161 	ld	a,(hl)
   7745 C6 04         [ 7] 3162 	add	a, #0x04
   7747 C5            [11] 3163 	push	bc
   7748 33            [ 6] 3164 	inc	sp
   7749 F5            [11] 3165 	push	af
   774A 33            [ 6] 3166 	inc	sp
   774B 2A 50 64      [16] 3167 	ld	hl,(_mapa)
   774E E5            [11] 3168 	push	hl
   774F CD 71 4B      [17] 3169 	call	_getTilePtr
   7752 F1            [10] 3170 	pop	af
   7753 F1            [10] 3171 	pop	af
   7754 4E            [ 7] 3172 	ld	c,(hl)
   7755 3E 02         [ 7] 3173 	ld	a,#0x02
   7757 91            [ 4] 3174 	sub	a, c
   7758 38 3B         [12] 3175 	jr	C,00178$
                           3176 ;src/main.c:555: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   775A DD 6E F6      [19] 3177 	ld	l,-10 (ix)
   775D DD 66 F7      [19] 3178 	ld	h,-9 (ix)
   7760 7E            [ 7] 3179 	ld	a,(hl)
   7761 C6 16         [ 7] 3180 	add	a, #0x16
   7763 47            [ 4] 3181 	ld	b,a
   7764 DD 6E F4      [19] 3182 	ld	l,-12 (ix)
   7767 DD 66 F5      [19] 3183 	ld	h,-11 (ix)
   776A 7E            [ 7] 3184 	ld	a,(hl)
   776B C6 04         [ 7] 3185 	add	a, #0x04
   776D C5            [11] 3186 	push	bc
   776E 33            [ 6] 3187 	inc	sp
   776F F5            [11] 3188 	push	af
   7770 33            [ 6] 3189 	inc	sp
   7771 2A 50 64      [16] 3190 	ld	hl,(_mapa)
   7774 E5            [11] 3191 	push	hl
   7775 CD 71 4B      [17] 3192 	call	_getTilePtr
   7778 F1            [10] 3193 	pop	af
   7779 F1            [10] 3194 	pop	af
   777A 4E            [ 7] 3195 	ld	c,(hl)
   777B 3E 02         [ 7] 3196 	ld	a,#0x02
   777D 91            [ 4] 3197 	sub	a, c
   777E 38 15         [12] 3198 	jr	C,00178$
                           3199 ;src/main.c:556: moverEnemigoDerecha(enemy);
   7780 DD 6E F4      [19] 3200 	ld	l,-12 (ix)
   7783 DD 66 F5      [19] 3201 	ld	h,-11 (ix)
   7786 E5            [11] 3202 	push	hl
   7787 CD F7 6A      [17] 3203 	call	_moverEnemigoDerecha
   778A F1            [10] 3204 	pop	af
                           3205 ;src/main.c:557: enemy->mover = SI;
   778B DD 6E F8      [19] 3206 	ld	l,-8 (ix)
   778E DD 66 F9      [19] 3207 	ld	h,-7 (ix)
   7791 36 01         [10] 3208 	ld	(hl),#0x01
   7793 18 13         [12] 3209 	jr	00199$
   7795                    3210 00178$:
                           3211 ;src/main.c:560: moverEnemigoIzquierda(enemy);
   7795 DD 6E F4      [19] 3212 	ld	l,-12 (ix)
   7798 DD 66 F5      [19] 3213 	ld	h,-11 (ix)
   779B E5            [11] 3214 	push	hl
   779C CD 07 6B      [17] 3215 	call	_moverEnemigoIzquierda
   779F F1            [10] 3216 	pop	af
                           3217 ;src/main.c:561: enemy->mover = SI;
   77A0 DD 6E F8      [19] 3218 	ld	l,-8 (ix)
   77A3 DD 66 F9      [19] 3219 	ld	h,-7 (ix)
   77A6 36 01         [10] 3220 	ld	(hl),#0x01
   77A8                    3221 00199$:
   77A8 DD F9         [10] 3222 	ld	sp, ix
   77AA DD E1         [14] 3223 	pop	ix
   77AC C9            [10] 3224 	ret
                           3225 ;src/main.c:570: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3226 ;	---------------------------------
                           3227 ; Function updateEnemy
                           3228 ; ---------------------------------
   77AD                    3229 _updateEnemy::
   77AD DD E5         [15] 3230 	push	ix
   77AF DD 21 00 00   [14] 3231 	ld	ix,#0
   77B3 DD 39         [15] 3232 	add	ix,sp
   77B5 21 F4 FF      [10] 3233 	ld	hl,#-12
   77B8 39            [11] 3234 	add	hl,sp
   77B9 F9            [ 6] 3235 	ld	sp,hl
                           3236 ;src/main.c:572: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   77BA DD 4E 04      [19] 3237 	ld	c,4 (ix)
   77BD DD 46 05      [19] 3238 	ld	b,5 (ix)
   77C0 21 16 00      [10] 3239 	ld	hl,#0x0016
   77C3 09            [11] 3240 	add	hl,bc
   77C4 DD 75 F6      [19] 3241 	ld	-10 (ix),l
   77C7 DD 74 F7      [19] 3242 	ld	-9 (ix),h
   77CA DD 6E F6      [19] 3243 	ld	l,-10 (ix)
   77CD DD 66 F7      [19] 3244 	ld	h,-9 (ix)
   77D0 7E            [ 7] 3245 	ld	a,(hl)
   77D1 B7            [ 4] 3246 	or	a, a
   77D2 28 14         [12] 3247 	jr	Z,00115$
                           3248 ;src/main.c:573: engage(actual, prota.x, prota.y);
   77D4 3A 3E 64      [13] 3249 	ld	a, (#_prota + 1)
   77D7 21 3D 64      [10] 3250 	ld	hl, #_prota + 0
   77DA 56            [ 7] 3251 	ld	d,(hl)
   77DB F5            [11] 3252 	push	af
   77DC 33            [ 6] 3253 	inc	sp
   77DD D5            [11] 3254 	push	de
   77DE 33            [ 6] 3255 	inc	sp
   77DF C5            [11] 3256 	push	bc
   77E0 CD 02 70      [17] 3257 	call	_engage
   77E3 F1            [10] 3258 	pop	af
   77E4 F1            [10] 3259 	pop	af
   77E5 C3 FF 78      [10] 3260 	jp	00117$
   77E8                    3261 00115$:
                           3262 ;src/main.c:575: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   77E8 C5            [11] 3263 	push	bc
   77E9 C5            [11] 3264 	push	bc
   77EA CD 77 6D      [17] 3265 	call	_lookFor
   77ED F1            [10] 3266 	pop	af
   77EE C1            [10] 3267 	pop	bc
                           3268 ;src/main.c:581: actual->patrolling = 0;
   77EF 21 0B 00      [10] 3269 	ld	hl,#0x000B
   77F2 09            [11] 3270 	add	hl,bc
   77F3 E3            [19] 3271 	ex	(sp), hl
                           3272 ;src/main.c:576: if (actual->patrolling) {
   77F4 E1            [10] 3273 	pop	hl
   77F5 E5            [11] 3274 	push	hl
   77F6 6E            [ 7] 3275 	ld	l,(hl)
                           3276 ;src/main.c:579: if (actual->in_range) {
   77F7 79            [ 4] 3277 	ld	a,c
   77F8 C6 11         [ 7] 3278 	add	a, #0x11
   77FA 5F            [ 4] 3279 	ld	e,a
   77FB 78            [ 4] 3280 	ld	a,b
   77FC CE 00         [ 7] 3281 	adc	a, #0x00
   77FE 57            [ 4] 3282 	ld	d,a
                           3283 ;src/main.c:587: actual->seek = 1;
   77FF 79            [ 4] 3284 	ld	a,c
   7800 C6 14         [ 7] 3285 	add	a, #0x14
   7802 DD 77 FB      [19] 3286 	ld	-5 (ix),a
   7805 78            [ 4] 3287 	ld	a,b
   7806 CE 00         [ 7] 3288 	adc	a, #0x00
   7808 DD 77 FC      [19] 3289 	ld	-4 (ix),a
                           3290 ;src/main.c:576: if (actual->patrolling) {
   780B 7D            [ 4] 3291 	ld	a,l
   780C B7            [ 4] 3292 	or	a, a
   780D CA C7 78      [10] 3293 	jp	Z,00112$
                           3294 ;src/main.c:578: moverEnemigoPatrol(actual);
   7810 C5            [11] 3295 	push	bc
   7811 D5            [11] 3296 	push	de
   7812 C5            [11] 3297 	push	bc
   7813 CD 19 6B      [17] 3298 	call	_moverEnemigoPatrol
   7816 F1            [10] 3299 	pop	af
   7817 D1            [10] 3300 	pop	de
   7818 C1            [10] 3301 	pop	bc
                           3302 ;src/main.c:579: if (actual->in_range) {
   7819 1A            [ 7] 3303 	ld	a,(de)
   781A B7            [ 4] 3304 	or	a, a
   781B 28 20         [12] 3305 	jr	Z,00104$
                           3306 ;src/main.c:580: engage(actual, prota.x, prota.y);
   781D 3A 3E 64      [13] 3307 	ld	a, (#_prota + 1)
   7820 21 3D 64      [10] 3308 	ld	hl, #_prota + 0
   7823 56            [ 7] 3309 	ld	d,(hl)
   7824 F5            [11] 3310 	push	af
   7825 33            [ 6] 3311 	inc	sp
   7826 D5            [11] 3312 	push	de
   7827 33            [ 6] 3313 	inc	sp
   7828 C5            [11] 3314 	push	bc
   7829 CD 02 70      [17] 3315 	call	_engage
   782C F1            [10] 3316 	pop	af
   782D F1            [10] 3317 	pop	af
                           3318 ;src/main.c:581: actual->patrolling = 0;
   782E E1            [10] 3319 	pop	hl
   782F E5            [11] 3320 	push	hl
   7830 36 00         [10] 3321 	ld	(hl),#0x00
                           3322 ;src/main.c:582: actual->engage = 1;
   7832 DD 6E F6      [19] 3323 	ld	l,-10 (ix)
   7835 DD 66 F7      [19] 3324 	ld	h,-9 (ix)
   7838 36 01         [10] 3325 	ld	(hl),#0x01
   783A C3 FF 78      [10] 3326 	jp	00117$
   783D                    3327 00104$:
                           3328 ;src/main.c:583: } else if (actual->seen) {
   783D 21 12 00      [10] 3329 	ld	hl,#0x0012
   7840 09            [11] 3330 	add	hl,bc
   7841 DD 75 FD      [19] 3331 	ld	-3 (ix),l
   7844 DD 74 FE      [19] 3332 	ld	-2 (ix),h
   7847 DD 6E FD      [19] 3333 	ld	l,-3 (ix)
   784A DD 66 FE      [19] 3334 	ld	h,-2 (ix)
   784D 7E            [ 7] 3335 	ld	a,(hl)
   784E B7            [ 4] 3336 	or	a, a
   784F CA FF 78      [10] 3337 	jp	Z,00117$
                           3338 ;src/main.c:584: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   7852 3A 3E 64      [13] 3339 	ld	a,(#_prota + 1)
   7855 DD 77 F8      [19] 3340 	ld	-8 (ix),a
   7858 21 3D 64      [10] 3341 	ld	hl, #_prota + 0
   785B 5E            [ 7] 3342 	ld	e,(hl)
   785C 21 01 00      [10] 3343 	ld	hl,#0x0001
   785F 09            [11] 3344 	add	hl,bc
   7860 DD 75 F9      [19] 3345 	ld	-7 (ix),l
   7863 DD 74 FA      [19] 3346 	ld	-6 (ix),h
   7866 DD 6E F9      [19] 3347 	ld	l,-7 (ix)
   7869 DD 66 FA      [19] 3348 	ld	h,-6 (ix)
   786C 56            [ 7] 3349 	ld	d,(hl)
   786D 0A            [ 7] 3350 	ld	a,(bc)
   786E DD 77 FF      [19] 3351 	ld	-1 (ix),a
   7871 C5            [11] 3352 	push	bc
   7872 2A 50 64      [16] 3353 	ld	hl,(_mapa)
   7875 E5            [11] 3354 	push	hl
   7876 C5            [11] 3355 	push	bc
   7877 DD 7E F8      [19] 3356 	ld	a,-8 (ix)
   787A F5            [11] 3357 	push	af
   787B 33            [ 6] 3358 	inc	sp
   787C 7B            [ 4] 3359 	ld	a,e
   787D F5            [11] 3360 	push	af
   787E 33            [ 6] 3361 	inc	sp
   787F D5            [11] 3362 	push	de
   7880 33            [ 6] 3363 	inc	sp
   7881 DD 7E FF      [19] 3364 	ld	a,-1 (ix)
   7884 F5            [11] 3365 	push	af
   7885 33            [ 6] 3366 	inc	sp
   7886 CD 72 49      [17] 3367 	call	_pathFinding
   7889 21 08 00      [10] 3368 	ld	hl,#8
   788C 39            [11] 3369 	add	hl,sp
   788D F9            [ 6] 3370 	ld	sp,hl
   788E C1            [10] 3371 	pop	bc
                           3372 ;src/main.c:585: actual->p_seek_x = actual->x;
   788F 21 17 00      [10] 3373 	ld	hl,#0x0017
   7892 09            [11] 3374 	add	hl,bc
   7893 EB            [ 4] 3375 	ex	de,hl
   7894 0A            [ 7] 3376 	ld	a,(bc)
   7895 12            [ 7] 3377 	ld	(de),a
                           3378 ;src/main.c:586: actual->p_seek_y = actual->y;
   7896 21 18 00      [10] 3379 	ld	hl,#0x0018
   7899 09            [11] 3380 	add	hl,bc
   789A EB            [ 4] 3381 	ex	de,hl
   789B DD 6E F9      [19] 3382 	ld	l,-7 (ix)
   789E DD 66 FA      [19] 3383 	ld	h,-6 (ix)
   78A1 7E            [ 7] 3384 	ld	a,(hl)
   78A2 12            [ 7] 3385 	ld	(de),a
                           3386 ;src/main.c:587: actual->seek = 1;
   78A3 DD 6E FB      [19] 3387 	ld	l,-5 (ix)
   78A6 DD 66 FC      [19] 3388 	ld	h,-4 (ix)
   78A9 36 01         [10] 3389 	ld	(hl),#0x01
                           3390 ;src/main.c:588: actual->iter=0;
   78AB 21 0E 00      [10] 3391 	ld	hl,#0x000E
   78AE 09            [11] 3392 	add	hl,bc
   78AF AF            [ 4] 3393 	xor	a, a
   78B0 77            [ 7] 3394 	ld	(hl), a
   78B1 23            [ 6] 3395 	inc	hl
   78B2 77            [ 7] 3396 	ld	(hl), a
                           3397 ;src/main.c:589: actual->reversePatrol = NO;
   78B3 21 0C 00      [10] 3398 	ld	hl,#0x000C
   78B6 09            [11] 3399 	add	hl,bc
   78B7 36 00         [10] 3400 	ld	(hl),#0x00
                           3401 ;src/main.c:590: actual->patrolling = 0;
   78B9 E1            [10] 3402 	pop	hl
   78BA E5            [11] 3403 	push	hl
   78BB 36 00         [10] 3404 	ld	(hl),#0x00
                           3405 ;src/main.c:591: actual->seen = 0;
   78BD DD 6E FD      [19] 3406 	ld	l,-3 (ix)
   78C0 DD 66 FE      [19] 3407 	ld	h,-2 (ix)
   78C3 36 00         [10] 3408 	ld	(hl),#0x00
   78C5 18 38         [12] 3409 	jr	00117$
   78C7                    3410 00112$:
                           3411 ;src/main.c:593: } else if (actual->seek) {
   78C7 DD 6E FB      [19] 3412 	ld	l,-5 (ix)
   78CA DD 66 FC      [19] 3413 	ld	h,-4 (ix)
   78CD 7E            [ 7] 3414 	ld	a,(hl)
   78CE B7            [ 4] 3415 	or	a, a
   78CF 28 2E         [12] 3416 	jr	Z,00117$
                           3417 ;src/main.c:594: moverEnemigoSeek(actual);
   78D1 C5            [11] 3418 	push	bc
   78D2 D5            [11] 3419 	push	de
   78D3 C5            [11] 3420 	push	bc
   78D4 CD 81 6E      [17] 3421 	call	_moverEnemigoSeek
   78D7 F1            [10] 3422 	pop	af
   78D8 D1            [10] 3423 	pop	de
   78D9 C1            [10] 3424 	pop	bc
                           3425 ;src/main.c:595: if (actual->in_range) {
   78DA 1A            [ 7] 3426 	ld	a,(de)
   78DB B7            [ 4] 3427 	or	a, a
   78DC 28 21         [12] 3428 	jr	Z,00117$
                           3429 ;src/main.c:596: engage(actual, prota.x, prota.y);
   78DE 3A 3E 64      [13] 3430 	ld	a, (#_prota + 1)
   78E1 21 3D 64      [10] 3431 	ld	hl, #_prota + 0
   78E4 56            [ 7] 3432 	ld	d,(hl)
   78E5 F5            [11] 3433 	push	af
   78E6 33            [ 6] 3434 	inc	sp
   78E7 D5            [11] 3435 	push	de
   78E8 33            [ 6] 3436 	inc	sp
   78E9 C5            [11] 3437 	push	bc
   78EA CD 02 70      [17] 3438 	call	_engage
   78ED F1            [10] 3439 	pop	af
   78EE F1            [10] 3440 	pop	af
                           3441 ;src/main.c:597: actual->seek = 0;
   78EF DD 6E FB      [19] 3442 	ld	l,-5 (ix)
   78F2 DD 66 FC      [19] 3443 	ld	h,-4 (ix)
   78F5 36 00         [10] 3444 	ld	(hl),#0x00
                           3445 ;src/main.c:598: actual->engage = 1;
   78F7 DD 6E F6      [19] 3446 	ld	l,-10 (ix)
   78FA DD 66 F7      [19] 3447 	ld	h,-9 (ix)
   78FD 36 01         [10] 3448 	ld	(hl),#0x01
                           3449 ;src/main.c:599: } else if (actual->seen) {
   78FF                    3450 00117$:
   78FF DD F9         [10] 3451 	ld	sp, ix
   7901 DD E1         [14] 3452 	pop	ix
   7903 C9            [10] 3453 	ret
                           3454 ;src/main.c:606: void inicializarEnemy() {
                           3455 ;	---------------------------------
                           3456 ; Function inicializarEnemy
                           3457 ; ---------------------------------
   7904                    3458 _inicializarEnemy::
   7904 DD E5         [15] 3459 	push	ix
   7906 DD 21 00 00   [14] 3460 	ld	ix,#0
   790A DD 39         [15] 3461 	add	ix,sp
   790C 21 F9 FF      [10] 3462 	ld	hl,#-7
   790F 39            [11] 3463 	add	hl,sp
   7910 F9            [ 6] 3464 	ld	sp,hl
                           3465 ;src/main.c:607: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7911 3A 52 64      [13] 3466 	ld	a,(#_num_mapa + 0)
   7914 C6 02         [ 7] 3467 	add	a, #0x02
   7916 DD 77 FF      [19] 3468 	ld	-1 (ix),a
                           3469 ;src/main.c:617: actual = enemy;
   7919 11 B5 60      [10] 3470 	ld	de,#_enemy+0
                           3471 ;src/main.c:618: while(i){
   791C                    3472 00101$:
   791C DD 7E FF      [19] 3473 	ld	a,-1 (ix)
   791F B7            [ 4] 3474 	or	a, a
   7920 CA 24 7A      [10] 3475 	jp	Z,00104$
                           3476 ;src/main.c:619: --i;
   7923 DD 35 FF      [23] 3477 	dec	-1 (ix)
                           3478 ;src/main.c:620: actual->x = actual->px = spawnX[i];
   7926 4B            [ 4] 3479 	ld	c, e
   7927 42            [ 4] 3480 	ld	b, d
   7928 03            [ 6] 3481 	inc	bc
   7929 03            [ 6] 3482 	inc	bc
   792A 3E 3B         [ 7] 3483 	ld	a,#<(_spawnX)
   792C DD 86 FF      [19] 3484 	add	a, -1 (ix)
   792F DD 77 FD      [19] 3485 	ld	-3 (ix),a
   7932 3E 65         [ 7] 3486 	ld	a,#>(_spawnX)
   7934 CE 00         [ 7] 3487 	adc	a, #0x00
   7936 DD 77 FE      [19] 3488 	ld	-2 (ix),a
   7939 DD 6E FD      [19] 3489 	ld	l,-3 (ix)
   793C DD 66 FE      [19] 3490 	ld	h,-2 (ix)
   793F 7E            [ 7] 3491 	ld	a,(hl)
   7940 02            [ 7] 3492 	ld	(bc),a
   7941 12            [ 7] 3493 	ld	(de),a
                           3494 ;src/main.c:621: actual->y = actual->py = spawnY[i];
   7942 D5            [11] 3495 	push	de
   7943 FD E1         [14] 3496 	pop	iy
   7945 FD 23         [10] 3497 	inc	iy
   7947 4B            [ 4] 3498 	ld	c, e
   7948 42            [ 4] 3499 	ld	b, d
   7949 03            [ 6] 3500 	inc	bc
   794A 03            [ 6] 3501 	inc	bc
   794B 03            [ 6] 3502 	inc	bc
   794C 3E 3F         [ 7] 3503 	ld	a,#<(_spawnY)
   794E DD 86 FF      [19] 3504 	add	a, -1 (ix)
   7951 DD 77 FB      [19] 3505 	ld	-5 (ix),a
   7954 3E 65         [ 7] 3506 	ld	a,#>(_spawnY)
   7956 CE 00         [ 7] 3507 	adc	a, #0x00
   7958 DD 77 FC      [19] 3508 	ld	-4 (ix),a
   795B DD 6E FB      [19] 3509 	ld	l,-5 (ix)
   795E DD 66 FC      [19] 3510 	ld	h,-4 (ix)
   7961 7E            [ 7] 3511 	ld	a,(hl)
   7962 02            [ 7] 3512 	ld	(bc),a
   7963 FD 77 00      [19] 3513 	ld	0 (iy), a
                           3514 ;src/main.c:622: actual->mover  = NO;
   7966 21 06 00      [10] 3515 	ld	hl,#0x0006
   7969 19            [11] 3516 	add	hl,de
   796A 36 00         [10] 3517 	ld	(hl),#0x00
                           3518 ;src/main.c:623: actual->mira   = M_abajo;
   796C 21 07 00      [10] 3519 	ld	hl,#0x0007
   796F 19            [11] 3520 	add	hl,de
   7970 36 03         [10] 3521 	ld	(hl),#0x03
                           3522 ;src/main.c:624: actual->sprite = g_enemy;
   7972 21 04 00      [10] 3523 	ld	hl,#0x0004
   7975 19            [11] 3524 	add	hl,de
   7976 36 3A         [10] 3525 	ld	(hl),#<(_g_enemy)
   7978 23            [ 6] 3526 	inc	hl
   7979 36 3C         [10] 3527 	ld	(hl),#>(_g_enemy)
                           3528 ;src/main.c:625: actual->muerto = NO;
   797B 21 08 00      [10] 3529 	ld	hl,#0x0008
   797E 19            [11] 3530 	add	hl,de
   797F 36 00         [10] 3531 	ld	(hl),#0x00
                           3532 ;src/main.c:626: actual->muertes = 0;
   7981 21 0A 00      [10] 3533 	ld	hl,#0x000A
   7984 19            [11] 3534 	add	hl,de
   7985 36 00         [10] 3535 	ld	(hl),#0x00
                           3536 ;src/main.c:627: actual->patrolling = SI;
   7987 21 0B 00      [10] 3537 	ld	hl,#0x000B
   798A 19            [11] 3538 	add	hl,de
   798B 36 01         [10] 3539 	ld	(hl),#0x01
                           3540 ;src/main.c:628: actual->reversePatrol = NO;
   798D 21 0C 00      [10] 3541 	ld	hl,#0x000C
   7990 19            [11] 3542 	add	hl,de
   7991 36 00         [10] 3543 	ld	(hl),#0x00
                           3544 ;src/main.c:629: actual->iter = 0;
   7993 21 0E 00      [10] 3545 	ld	hl,#0x000E
   7996 19            [11] 3546 	add	hl,de
   7997 AF            [ 4] 3547 	xor	a, a
   7998 77            [ 7] 3548 	ld	(hl), a
   7999 23            [ 6] 3549 	inc	hl
   799A 77            [ 7] 3550 	ld	(hl), a
                           3551 ;src/main.c:630: actual->lastIter = 0;
   799B 21 10 00      [10] 3552 	ld	hl,#0x0010
   799E 19            [11] 3553 	add	hl,de
   799F 36 00         [10] 3554 	ld	(hl),#0x00
                           3555 ;src/main.c:631: actual->in_range = 0,
   79A1 21 11 00      [10] 3556 	ld	hl,#0x0011
   79A4 19            [11] 3557 	add	hl,de
   79A5 36 00         [10] 3558 	ld	(hl),#0x00
                           3559 ;src/main.c:632: actual->seek = 0;
   79A7 21 14 00      [10] 3560 	ld	hl,#0x0014
   79AA 19            [11] 3561 	add	hl,de
   79AB 36 00         [10] 3562 	ld	(hl),#0x00
                           3563 ;src/main.c:633: actual->seen = 0;
   79AD 21 12 00      [10] 3564 	ld	hl,#0x0012
   79B0 19            [11] 3565 	add	hl,de
   79B1 36 00         [10] 3566 	ld	(hl),#0x00
                           3567 ;src/main.c:634: actual->found = 0;
   79B3 21 13 00      [10] 3568 	ld	hl,#0x0013
   79B6 19            [11] 3569 	add	hl,de
   79B7 36 00         [10] 3570 	ld	(hl),#0x00
                           3571 ;src/main.c:635: actual->engage = 0;
   79B9 21 16 00      [10] 3572 	ld	hl,#0x0016
   79BC 19            [11] 3573 	add	hl,de
   79BD 36 00         [10] 3574 	ld	(hl),#0x00
                           3575 ;src/main.c:636: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   79BF 21 52 64      [10] 3576 	ld	hl,#_num_mapa + 0
   79C2 4E            [ 7] 3577 	ld	c, (hl)
   79C3 0C            [ 4] 3578 	inc	c
   79C4 06 00         [ 7] 3579 	ld	b,#0x00
   79C6 69            [ 4] 3580 	ld	l, c
   79C7 60            [ 4] 3581 	ld	h, b
   79C8 29            [11] 3582 	add	hl, hl
   79C9 29            [11] 3583 	add	hl, hl
   79CA 09            [11] 3584 	add	hl, bc
   79CB 4D            [ 4] 3585 	ld	c,l
   79CC 44            [ 4] 3586 	ld	b,h
   79CD 21 57 65      [10] 3587 	ld	hl,#_patrolY
   79D0 09            [11] 3588 	add	hl,bc
   79D1 7D            [ 4] 3589 	ld	a,l
   79D2 DD 86 FF      [19] 3590 	add	a, -1 (ix)
   79D5 6F            [ 4] 3591 	ld	l,a
   79D6 7C            [ 4] 3592 	ld	a,h
   79D7 CE 00         [ 7] 3593 	adc	a, #0x00
   79D9 67            [ 4] 3594 	ld	h,a
   79DA 7E            [ 7] 3595 	ld	a,(hl)
   79DB DD 77 FA      [19] 3596 	ld	-6 (ix),a
   79DE 21 43 65      [10] 3597 	ld	hl,#_patrolX
   79E1 09            [11] 3598 	add	hl,bc
   79E2 DD 4E FF      [19] 3599 	ld	c,-1 (ix)
   79E5 06 00         [ 7] 3600 	ld	b,#0x00
   79E7 09            [11] 3601 	add	hl,bc
   79E8 7E            [ 7] 3602 	ld	a,(hl)
   79E9 DD 77 F9      [19] 3603 	ld	-7 (ix),a
   79EC DD 6E FB      [19] 3604 	ld	l,-5 (ix)
   79EF DD 66 FC      [19] 3605 	ld	h,-4 (ix)
   79F2 4E            [ 7] 3606 	ld	c,(hl)
   79F3 DD 6E FD      [19] 3607 	ld	l,-3 (ix)
   79F6 DD 66 FE      [19] 3608 	ld	h,-2 (ix)
   79F9 46            [ 7] 3609 	ld	b,(hl)
   79FA D5            [11] 3610 	push	de
   79FB 2A 50 64      [16] 3611 	ld	hl,(_mapa)
   79FE E5            [11] 3612 	push	hl
   79FF D5            [11] 3613 	push	de
   7A00 DD 66 FA      [19] 3614 	ld	h,-6 (ix)
   7A03 DD 6E F9      [19] 3615 	ld	l,-7 (ix)
   7A06 E5            [11] 3616 	push	hl
   7A07 79            [ 4] 3617 	ld	a,c
   7A08 F5            [11] 3618 	push	af
   7A09 33            [ 6] 3619 	inc	sp
   7A0A C5            [11] 3620 	push	bc
   7A0B 33            [ 6] 3621 	inc	sp
   7A0C CD 72 49      [17] 3622 	call	_pathFinding
   7A0F 21 08 00      [10] 3623 	ld	hl,#8
   7A12 39            [11] 3624 	add	hl,sp
   7A13 F9            [ 6] 3625 	ld	sp,hl
   7A14 D1            [10] 3626 	pop	de
                           3627 ;src/main.c:637: dibujarEnemigo(actual);
   7A15 D5            [11] 3628 	push	de
   7A16 D5            [11] 3629 	push	de
   7A17 CD F1 67      [17] 3630 	call	_dibujarEnemigo
   7A1A F1            [10] 3631 	pop	af
   7A1B D1            [10] 3632 	pop	de
                           3633 ;src/main.c:638: ++actual;
   7A1C 21 E2 00      [10] 3634 	ld	hl,#0x00E2
   7A1F 19            [11] 3635 	add	hl,de
   7A20 EB            [ 4] 3636 	ex	de,hl
   7A21 C3 1C 79      [10] 3637 	jp	00101$
   7A24                    3638 00104$:
   7A24 DD F9         [10] 3639 	ld	sp, ix
   7A26 DD E1         [14] 3640 	pop	ix
   7A28 C9            [10] 3641 	ret
                           3642 ;src/main.c:642: void avanzarMapa() {
                           3643 ;	---------------------------------
                           3644 ; Function avanzarMapa
                           3645 ; ---------------------------------
   7A29                    3646 _avanzarMapa::
                           3647 ;src/main.c:643: if(num_mapa < NUM_MAPAS -1) {
   7A29 3A 52 64      [13] 3648 	ld	a,(#_num_mapa + 0)
   7A2C D6 02         [ 7] 3649 	sub	a, #0x02
   7A2E 30 34         [12] 3650 	jr	NC,00102$
                           3651 ;src/main.c:644: mapa = mapas[++num_mapa];
   7A30 01 35 65      [10] 3652 	ld	bc,#_mapas+0
   7A33 21 52 64      [10] 3653 	ld	hl, #_num_mapa+0
   7A36 34            [11] 3654 	inc	(hl)
   7A37 FD 21 52 64   [14] 3655 	ld	iy,#_num_mapa
   7A3B FD 6E 00      [19] 3656 	ld	l,0 (iy)
   7A3E 26 00         [ 7] 3657 	ld	h,#0x00
   7A40 29            [11] 3658 	add	hl, hl
   7A41 09            [11] 3659 	add	hl,bc
   7A42 7E            [ 7] 3660 	ld	a,(hl)
   7A43 FD 21 50 64   [14] 3661 	ld	iy,#_mapa
   7A47 FD 77 00      [19] 3662 	ld	0 (iy),a
   7A4A 23            [ 6] 3663 	inc	hl
   7A4B 7E            [ 7] 3664 	ld	a,(hl)
   7A4C 32 51 64      [13] 3665 	ld	(#_mapa + 1),a
                           3666 ;src/main.c:645: prota.x = prota.px = 2;
   7A4F 21 3F 64      [10] 3667 	ld	hl,#(_prota + 0x0002)
   7A52 36 02         [10] 3668 	ld	(hl),#0x02
   7A54 21 3D 64      [10] 3669 	ld	hl,#_prota
   7A57 36 02         [10] 3670 	ld	(hl),#0x02
                           3671 ;src/main.c:646: prota.mover = SI;
   7A59 21 43 64      [10] 3672 	ld	hl,#(_prota + 0x0006)
   7A5C 36 01         [10] 3673 	ld	(hl),#0x01
                           3674 ;src/main.c:647: dibujarMapa();
   7A5E CD 1F 65      [17] 3675 	call	_dibujarMapa
                           3676 ;src/main.c:648: inicializarEnemy();
   7A61 C3 04 79      [10] 3677 	jp  _inicializarEnemy
   7A64                    3678 00102$:
                           3679 ;src/main.c:651: menuFin(puntuacion);
   7A64 FD 21 53 64   [14] 3680 	ld	iy,#_puntuacion
   7A68 FD 6E 00      [19] 3681 	ld	l,0 (iy)
   7A6B 26 00         [ 7] 3682 	ld	h,#0x00
   7A6D C3 F5 4B      [10] 3683 	jp  _menuFin
                           3684 ;src/main.c:655: void moverIzquierda() {
                           3685 ;	---------------------------------
                           3686 ; Function moverIzquierda
                           3687 ; ---------------------------------
   7A70                    3688 _moverIzquierda::
                           3689 ;src/main.c:656: prota.mira = M_izquierda;
   7A70 01 3D 64      [10] 3690 	ld	bc,#_prota+0
   7A73 21 44 64      [10] 3691 	ld	hl,#(_prota + 0x0007)
   7A76 36 01         [10] 3692 	ld	(hl),#0x01
                           3693 ;src/main.c:657: if (!checkCollision(M_izquierda)) {
   7A78 C5            [11] 3694 	push	bc
   7A79 3E 01         [ 7] 3695 	ld	a,#0x01
   7A7B F5            [11] 3696 	push	af
   7A7C 33            [ 6] 3697 	inc	sp
   7A7D CD 80 66      [17] 3698 	call	_checkCollision
   7A80 33            [ 6] 3699 	inc	sp
   7A81 C1            [10] 3700 	pop	bc
   7A82 7D            [ 4] 3701 	ld	a,l
   7A83 B7            [ 4] 3702 	or	a, a
   7A84 C0            [11] 3703 	ret	NZ
                           3704 ;src/main.c:658: prota.x--;
   7A85 0A            [ 7] 3705 	ld	a,(bc)
   7A86 C6 FF         [ 7] 3706 	add	a,#0xFF
   7A88 02            [ 7] 3707 	ld	(bc),a
                           3708 ;src/main.c:659: prota.mover = SI;
   7A89 21 43 64      [10] 3709 	ld	hl,#(_prota + 0x0006)
   7A8C 36 01         [10] 3710 	ld	(hl),#0x01
                           3711 ;src/main.c:660: prota.sprite = g_hero_left;
   7A8E 21 C6 3D      [10] 3712 	ld	hl,#_g_hero_left
   7A91 22 41 64      [16] 3713 	ld	((_prota + 0x0004)), hl
   7A94 C9            [10] 3714 	ret
                           3715 ;src/main.c:664: void moverDerecha() {
                           3716 ;	---------------------------------
                           3717 ; Function moverDerecha
                           3718 ; ---------------------------------
   7A95                    3719 _moverDerecha::
                           3720 ;src/main.c:665: prota.mira = M_derecha;
   7A95 21 44 64      [10] 3721 	ld	hl,#(_prota + 0x0007)
   7A98 36 00         [10] 3722 	ld	(hl),#0x00
                           3723 ;src/main.c:666: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7A9A AF            [ 4] 3724 	xor	a, a
   7A9B F5            [11] 3725 	push	af
   7A9C 33            [ 6] 3726 	inc	sp
   7A9D CD 80 66      [17] 3727 	call	_checkCollision
   7AA0 33            [ 6] 3728 	inc	sp
   7AA1 45            [ 4] 3729 	ld	b,l
   7AA2 21 3D 64      [10] 3730 	ld	hl, #_prota + 0
   7AA5 4E            [ 7] 3731 	ld	c,(hl)
   7AA6 59            [ 4] 3732 	ld	e,c
   7AA7 16 00         [ 7] 3733 	ld	d,#0x00
   7AA9 21 07 00      [10] 3734 	ld	hl,#0x0007
   7AAC 19            [11] 3735 	add	hl,de
   7AAD 11 50 80      [10] 3736 	ld	de, #0x8050
   7AB0 29            [11] 3737 	add	hl, hl
   7AB1 3F            [ 4] 3738 	ccf
   7AB2 CB 1C         [ 8] 3739 	rr	h
   7AB4 CB 1D         [ 8] 3740 	rr	l
   7AB6 ED 52         [15] 3741 	sbc	hl, de
   7AB8 3E 00         [ 7] 3742 	ld	a,#0x00
   7ABA 17            [ 4] 3743 	rla
   7ABB 5F            [ 4] 3744 	ld	e,a
   7ABC 78            [ 4] 3745 	ld	a,b
   7ABD B7            [ 4] 3746 	or	a,a
   7ABE 20 14         [12] 3747 	jr	NZ,00104$
   7AC0 B3            [ 4] 3748 	or	a,e
   7AC1 28 11         [12] 3749 	jr	Z,00104$
                           3750 ;src/main.c:667: prota.x++;
   7AC3 0C            [ 4] 3751 	inc	c
   7AC4 21 3D 64      [10] 3752 	ld	hl,#_prota
   7AC7 71            [ 7] 3753 	ld	(hl),c
                           3754 ;src/main.c:668: prota.mover = SI;
   7AC8 21 43 64      [10] 3755 	ld	hl,#(_prota + 0x0006)
   7ACB 36 01         [10] 3756 	ld	(hl),#0x01
                           3757 ;src/main.c:669: prota.sprite = g_hero;
   7ACD 21 70 3E      [10] 3758 	ld	hl,#_g_hero
   7AD0 22 41 64      [16] 3759 	ld	((_prota + 0x0004)), hl
   7AD3 C9            [10] 3760 	ret
   7AD4                    3761 00104$:
                           3762 ;src/main.c:670: }else if( prota.x + G_HERO_W >= 80){
   7AD4 7B            [ 4] 3763 	ld	a,e
   7AD5 B7            [ 4] 3764 	or	a, a
   7AD6 C0            [11] 3765 	ret	NZ
                           3766 ;src/main.c:671: avanzarMapa();
   7AD7 C3 29 7A      [10] 3767 	jp  _avanzarMapa
                           3768 ;src/main.c:675: void moverArriba() {
                           3769 ;	---------------------------------
                           3770 ; Function moverArriba
                           3771 ; ---------------------------------
   7ADA                    3772 _moverArriba::
                           3773 ;src/main.c:676: prota.mira = M_arriba;
   7ADA 21 44 64      [10] 3774 	ld	hl,#(_prota + 0x0007)
   7ADD 36 02         [10] 3775 	ld	(hl),#0x02
                           3776 ;src/main.c:677: if (!checkCollision(M_arriba)) {
   7ADF 3E 02         [ 7] 3777 	ld	a,#0x02
   7AE1 F5            [11] 3778 	push	af
   7AE2 33            [ 6] 3779 	inc	sp
   7AE3 CD 80 66      [17] 3780 	call	_checkCollision
   7AE6 33            [ 6] 3781 	inc	sp
   7AE7 7D            [ 4] 3782 	ld	a,l
   7AE8 B7            [ 4] 3783 	or	a, a
   7AE9 C0            [11] 3784 	ret	NZ
                           3785 ;src/main.c:678: prota.y--;
   7AEA 21 3E 64      [10] 3786 	ld	hl,#_prota + 1
   7AED 4E            [ 7] 3787 	ld	c,(hl)
   7AEE 0D            [ 4] 3788 	dec	c
   7AEF 71            [ 7] 3789 	ld	(hl),c
                           3790 ;src/main.c:679: prota.y--;
   7AF0 0D            [ 4] 3791 	dec	c
   7AF1 71            [ 7] 3792 	ld	(hl),c
                           3793 ;src/main.c:680: prota.mover  = SI;
   7AF2 21 43 64      [10] 3794 	ld	hl,#(_prota + 0x0006)
   7AF5 36 01         [10] 3795 	ld	(hl),#0x01
                           3796 ;src/main.c:681: prota.sprite = g_hero_up;
   7AF7 21 2C 3D      [10] 3797 	ld	hl,#_g_hero_up
   7AFA 22 41 64      [16] 3798 	ld	((_prota + 0x0004)), hl
   7AFD C9            [10] 3799 	ret
                           3800 ;src/main.c:685: void moverAbajo() {
                           3801 ;	---------------------------------
                           3802 ; Function moverAbajo
                           3803 ; ---------------------------------
   7AFE                    3804 _moverAbajo::
                           3805 ;src/main.c:686: prota.mira = M_abajo;
   7AFE 21 44 64      [10] 3806 	ld	hl,#(_prota + 0x0007)
   7B01 36 03         [10] 3807 	ld	(hl),#0x03
                           3808 ;src/main.c:687: if (!checkCollision(M_abajo) ) {
   7B03 3E 03         [ 7] 3809 	ld	a,#0x03
   7B05 F5            [11] 3810 	push	af
   7B06 33            [ 6] 3811 	inc	sp
   7B07 CD 80 66      [17] 3812 	call	_checkCollision
   7B0A 33            [ 6] 3813 	inc	sp
   7B0B 7D            [ 4] 3814 	ld	a,l
   7B0C B7            [ 4] 3815 	or	a, a
   7B0D C0            [11] 3816 	ret	NZ
                           3817 ;src/main.c:688: prota.y++;
   7B0E 01 3E 64      [10] 3818 	ld	bc,#_prota + 1
   7B11 0A            [ 7] 3819 	ld	a,(bc)
   7B12 3C            [ 4] 3820 	inc	a
   7B13 02            [ 7] 3821 	ld	(bc),a
                           3822 ;src/main.c:689: prota.y++;
   7B14 3C            [ 4] 3823 	inc	a
   7B15 02            [ 7] 3824 	ld	(bc),a
                           3825 ;src/main.c:690: prota.mover  = SI;
   7B16 21 43 64      [10] 3826 	ld	hl,#(_prota + 0x0006)
   7B19 36 01         [10] 3827 	ld	(hl),#0x01
                           3828 ;src/main.c:691: prota.sprite = g_hero_down;
   7B1B 21 92 3C      [10] 3829 	ld	hl,#_g_hero_down
   7B1E 22 41 64      [16] 3830 	ld	((_prota + 0x0004)), hl
   7B21 C9            [10] 3831 	ret
                           3832 ;src/main.c:698: void intHandler() {
                           3833 ;	---------------------------------
                           3834 ; Function intHandler
                           3835 ; ---------------------------------
   7B22                    3836 _intHandler::
                           3837 ;src/main.c:699: if (++i == 6) {
   7B22 21 55 64      [10] 3838 	ld	hl, #_i+0
   7B25 34            [11] 3839 	inc	(hl)
   7B26 3A 55 64      [13] 3840 	ld	a,(#_i + 0)
   7B29 D6 06         [ 7] 3841 	sub	a, #0x06
   7B2B C0            [11] 3842 	ret	NZ
                           3843 ;src/main.c:700: play();
   7B2C CD 89 53      [17] 3844 	call	_play
                           3845 ;src/main.c:701: i=0;
   7B2F 21 55 64      [10] 3846 	ld	hl,#_i + 0
   7B32 36 00         [10] 3847 	ld	(hl), #0x00
   7B34 C9            [10] 3848 	ret
                           3849 ;src/main.c:705: void inicializarCPC() {
                           3850 ;	---------------------------------
                           3851 ; Function inicializarCPC
                           3852 ; ---------------------------------
   7B35                    3853 _inicializarCPC::
                           3854 ;src/main.c:706: cpct_disableFirmware();
   7B35 CD 30 57      [17] 3855 	call	_cpct_disableFirmware
                           3856 ;src/main.c:707: cpct_setVideoMode(0);
   7B38 2E 00         [ 7] 3857 	ld	l,#0x00
   7B3A CD 04 57      [17] 3858 	call	_cpct_setVideoMode
                           3859 ;src/main.c:708: cpct_setBorder(HW_BLACK);
   7B3D 21 10 14      [10] 3860 	ld	hl,#0x1410
   7B40 E5            [11] 3861 	push	hl
   7B41 CD 67 54      [17] 3862 	call	_cpct_setPALColour
                           3863 ;src/main.c:709: cpct_setPalette(g_palette, 16);
   7B44 21 10 00      [10] 3864 	ld	hl,#0x0010
   7B47 E5            [11] 3865 	push	hl
   7B48 21 60 3E      [10] 3866 	ld	hl,#_g_palette
   7B4B E5            [11] 3867 	push	hl
   7B4C CD 44 54      [17] 3868 	call	_cpct_setPalette
   7B4F C9            [10] 3869 	ret
                           3870 ;src/main.c:714: void inicializarJuego() {
                           3871 ;	---------------------------------
                           3872 ; Function inicializarJuego
                           3873 ; ---------------------------------
   7B50                    3874 _inicializarJuego::
                           3875 ;src/main.c:716: num_mapa = 2;
   7B50 21 52 64      [10] 3876 	ld	hl,#_num_mapa + 0
   7B53 36 02         [10] 3877 	ld	(hl), #0x02
                           3878 ;src/main.c:722: puntuacion = 0;
   7B55 21 53 64      [10] 3879 	ld	hl,#_puntuacion + 0
   7B58 36 00         [10] 3880 	ld	(hl), #0x00
                           3881 ;src/main.c:723: vidas = 5;
   7B5A 21 54 64      [10] 3882 	ld	hl,#_vidas + 0
   7B5D 36 05         [10] 3883 	ld	(hl), #0x05
                           3884 ;src/main.c:724: mapa = mapas[num_mapa];
   7B5F 21 39 65      [10] 3885 	ld	hl, #(_mapas + 0x0004) + 0
   7B62 7E            [ 7] 3886 	ld	a,(hl)
   7B63 FD 21 50 64   [14] 3887 	ld	iy,#_mapa
   7B67 FD 77 00      [19] 3888 	ld	0 (iy),a
   7B6A 23            [ 6] 3889 	inc	hl
   7B6B 7E            [ 7] 3890 	ld	a,(hl)
   7B6C 32 51 64      [13] 3891 	ld	(#_mapa + 1),a
                           3892 ;src/main.c:725: cpct_etm_setTileset2x4(g_tileset);
   7B6F 21 E0 17      [10] 3893 	ld	hl,#_g_tileset
   7B72 CD 58 56      [17] 3894 	call	_cpct_etm_setTileset2x4
                           3895 ;src/main.c:727: dibujarMapa();
   7B75 CD 1F 65      [17] 3896 	call	_dibujarMapa
                           3897 ;src/main.c:730: barraPuntuacionInicial();
   7B78 CD 95 51      [17] 3898 	call	_barraPuntuacionInicial
                           3899 ;src/main.c:733: prota.x = prota.px = 4;
   7B7B 21 3F 64      [10] 3900 	ld	hl,#(_prota + 0x0002)
   7B7E 36 04         [10] 3901 	ld	(hl),#0x04
   7B80 21 3D 64      [10] 3902 	ld	hl,#_prota
   7B83 36 04         [10] 3903 	ld	(hl),#0x04
                           3904 ;src/main.c:734: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7B85 21 40 64      [10] 3905 	ld	hl,#(_prota + 0x0003)
   7B88 36 68         [10] 3906 	ld	(hl),#0x68
   7B8A 21 3E 64      [10] 3907 	ld	hl,#(_prota + 0x0001)
   7B8D 36 68         [10] 3908 	ld	(hl),#0x68
                           3909 ;src/main.c:735: prota.mover  = NO;
   7B8F 21 43 64      [10] 3910 	ld	hl,#(_prota + 0x0006)
   7B92 36 00         [10] 3911 	ld	(hl),#0x00
                           3912 ;src/main.c:736: prota.mira=M_derecha;
   7B94 21 44 64      [10] 3913 	ld	hl,#(_prota + 0x0007)
   7B97 36 00         [10] 3914 	ld	(hl),#0x00
                           3915 ;src/main.c:737: prota.sprite = g_hero;
   7B99 21 70 3E      [10] 3916 	ld	hl,#_g_hero
   7B9C 22 41 64      [16] 3917 	ld	((_prota + 0x0004)), hl
                           3918 ;src/main.c:741: cu.x = cu.px = 0;
   7B9F 21 47 64      [10] 3919 	ld	hl,#(_cu + 0x0002)
   7BA2 36 00         [10] 3920 	ld	(hl),#0x00
   7BA4 21 45 64      [10] 3921 	ld	hl,#_cu
   7BA7 36 00         [10] 3922 	ld	(hl),#0x00
                           3923 ;src/main.c:742: cu.y = cu.py = 0;
   7BA9 21 48 64      [10] 3924 	ld	hl,#(_cu + 0x0003)
   7BAC 36 00         [10] 3925 	ld	(hl),#0x00
   7BAE 21 46 64      [10] 3926 	ld	hl,#(_cu + 0x0001)
   7BB1 36 00         [10] 3927 	ld	(hl),#0x00
                           3928 ;src/main.c:743: cu.lanzado = NO;
   7BB3 21 4B 64      [10] 3929 	ld	hl,#(_cu + 0x0006)
   7BB6 36 00         [10] 3930 	ld	(hl),#0x00
                           3931 ;src/main.c:744: cu.mover = NO;
   7BB8 21 4E 64      [10] 3932 	ld	hl,#(_cu + 0x0009)
   7BBB 36 00         [10] 3933 	ld	(hl),#0x00
                           3934 ;src/main.c:745: cu.off_bound = NO;
   7BBD 21 4F 64      [10] 3935 	ld	hl,#(_cu + 0x000a)
   7BC0 36 00         [10] 3936 	ld	(hl),#0x00
                           3937 ;src/main.c:747: inicializarEnemy();
   7BC2 CD 04 79      [17] 3938 	call	_inicializarEnemy
                           3939 ;src/main.c:749: dibujarProta();
   7BC5 C3 6B 65      [10] 3940 	jp  _dibujarProta
                           3941 ;src/main.c:752: void main(void) {
                           3942 ;	---------------------------------
                           3943 ; Function main
                           3944 ; ---------------------------------
   7BC8                    3945 _main::
   7BC8 DD E5         [15] 3946 	push	ix
   7BCA DD 21 00 00   [14] 3947 	ld	ix,#0
   7BCE DD 39         [15] 3948 	add	ix,sp
   7BD0 21 F9 FF      [10] 3949 	ld	hl,#-7
   7BD3 39            [11] 3950 	add	hl,sp
   7BD4 F9            [ 6] 3951 	ld	sp,hl
                           3952 ;src/main.c:757: inicializarCPC();
   7BD5 CD 35 7B      [17] 3953 	call	_inicializarCPC
                           3954 ;src/main.c:759: menuInicio();
   7BD8 CD B6 50      [17] 3955 	call	_menuInicio
                           3956 ;src/main.c:761: inicializarJuego();
   7BDB CD 50 7B      [17] 3957 	call	_inicializarJuego
                           3958 ;src/main.c:765: while (1) {
   7BDE                    3959 00126$:
                           3960 ;src/main.c:767: i = 2 + num_mapa;
   7BDE 21 52 64      [10] 3961 	ld	hl,#_num_mapa + 0
   7BE1 4E            [ 7] 3962 	ld	c, (hl)
   7BE2 0C            [ 4] 3963 	inc	c
   7BE3 0C            [ 4] 3964 	inc	c
                           3965 ;src/main.c:768: actual = enemy;
                           3966 ;src/main.c:770: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7BE4 C5            [11] 3967 	push	bc
   7BE5 21 00 01      [10] 3968 	ld	hl,#_g_tablatrans
   7BE8 E5            [11] 3969 	push	hl
   7BE9 2A 50 64      [16] 3970 	ld	hl,(_mapa)
   7BEC E5            [11] 3971 	push	hl
   7BED 21 3D 64      [10] 3972 	ld	hl,#_prota
   7BF0 E5            [11] 3973 	push	hl
   7BF1 21 45 64      [10] 3974 	ld	hl,#_cu
   7BF4 E5            [11] 3975 	push	hl
   7BF5 CD 19 66      [17] 3976 	call	_comprobarTeclado
   7BF8 21 08 00      [10] 3977 	ld	hl,#8
   7BFB 39            [11] 3978 	add	hl,sp
   7BFC F9            [ 6] 3979 	ld	sp,hl
   7BFD 2A 50 64      [16] 3980 	ld	hl,(_mapa)
   7C00 E5            [11] 3981 	push	hl
   7C01 21 45 64      [10] 3982 	ld	hl,#_cu
   7C04 E5            [11] 3983 	push	hl
   7C05 CD 15 43      [17] 3984 	call	_moverCuchillo
   7C08 F1            [10] 3985 	pop	af
   7C09 F1            [10] 3986 	pop	af
   7C0A C1            [10] 3987 	pop	bc
                           3988 ;src/main.c:772: while(i){
   7C0B DD 71 FB      [19] 3989 	ld	-5 (ix),c
   7C0E DD 36 F9 B5   [19] 3990 	ld	-7 (ix),#<(_enemy)
   7C12 DD 36 FA 60   [19] 3991 	ld	-6 (ix),#>(_enemy)
   7C16                    3992 00105$:
   7C16 DD 7E FB      [19] 3993 	ld	a,-5 (ix)
   7C19 B7            [ 4] 3994 	or	a, a
   7C1A 28 4E         [12] 3995 	jr	Z,00107$
                           3996 ;src/main.c:774: --i;
   7C1C DD 35 FB      [23] 3997 	dec	-5 (ix)
                           3998 ;src/main.c:775: if(!actual->muerto){
   7C1F DD 7E F9      [19] 3999 	ld	a,-7 (ix)
   7C22 C6 08         [ 7] 4000 	add	a, #0x08
   7C24 DD 77 FC      [19] 4001 	ld	-4 (ix),a
   7C27 DD 7E FA      [19] 4002 	ld	a,-6 (ix)
   7C2A CE 00         [ 7] 4003 	adc	a, #0x00
   7C2C DD 77 FD      [19] 4004 	ld	-3 (ix),a
   7C2F DD 6E FC      [19] 4005 	ld	l,-4 (ix)
   7C32 DD 66 FD      [19] 4006 	ld	h,-3 (ix)
   7C35 7E            [ 7] 4007 	ld	a,(hl)
   7C36 B7            [ 4] 4008 	or	a, a
   7C37 20 0E         [12] 4009 	jr	NZ,00102$
                           4010 ;src/main.c:776: checkEnemyDead(cu.direccion, actual);
   7C39 21 4C 64      [10] 4011 	ld	hl, #_cu + 7
   7C3C 46            [ 7] 4012 	ld	b,(hl)
   7C3D E1            [10] 4013 	pop	hl
   7C3E E5            [11] 4014 	push	hl
   7C3F E5            [11] 4015 	push	hl
   7C40 C5            [11] 4016 	push	bc
   7C41 33            [ 6] 4017 	inc	sp
   7C42 CD 7F 69      [17] 4018 	call	_checkEnemyDead
   7C45 F1            [10] 4019 	pop	af
   7C46 33            [ 6] 4020 	inc	sp
   7C47                    4021 00102$:
                           4022 ;src/main.c:778: if(!actual->muerto){
   7C47 DD 6E FC      [19] 4023 	ld	l,-4 (ix)
   7C4A DD 66 FD      [19] 4024 	ld	h,-3 (ix)
   7C4D 7E            [ 7] 4025 	ld	a,(hl)
   7C4E B7            [ 4] 4026 	or	a, a
   7C4F 20 07         [12] 4027 	jr	NZ,00104$
                           4028 ;src/main.c:779: updateEnemy(actual);
   7C51 E1            [10] 4029 	pop	hl
   7C52 E5            [11] 4030 	push	hl
   7C53 E5            [11] 4031 	push	hl
   7C54 CD AD 77      [17] 4032 	call	_updateEnemy
   7C57 F1            [10] 4033 	pop	af
   7C58                    4034 00104$:
                           4035 ;src/main.c:781: ++actual;
   7C58 DD 7E F9      [19] 4036 	ld	a,-7 (ix)
   7C5B C6 E2         [ 7] 4037 	add	a, #0xE2
   7C5D DD 77 F9      [19] 4038 	ld	-7 (ix),a
   7C60 DD 7E FA      [19] 4039 	ld	a,-6 (ix)
   7C63 CE 00         [ 7] 4040 	adc	a, #0x00
   7C65 DD 77 FA      [19] 4041 	ld	-6 (ix),a
   7C68 18 AC         [12] 4042 	jr	00105$
   7C6A                    4043 00107$:
                           4044 ;src/main.c:784: cpct_waitVSYNC();
   7C6A CD FC 56      [17] 4045 	call	_cpct_waitVSYNC
                           4046 ;src/main.c:787: if (prota.mover) {
   7C6D 01 43 64      [10] 4047 	ld	bc,#_prota + 6
   7C70 0A            [ 7] 4048 	ld	a,(bc)
   7C71 B7            [ 4] 4049 	or	a, a
   7C72 28 07         [12] 4050 	jr	Z,00109$
                           4051 ;src/main.c:788: redibujarProta();
   7C74 C5            [11] 4052 	push	bc
   7C75 CD 05 66      [17] 4053 	call	_redibujarProta
   7C78 C1            [10] 4054 	pop	bc
                           4055 ;src/main.c:789: prota.mover = NO;
   7C79 AF            [ 4] 4056 	xor	a, a
   7C7A 02            [ 7] 4057 	ld	(bc),a
   7C7B                    4058 00109$:
                           4059 ;src/main.c:791: if(cu.lanzado && cu.mover){
   7C7B 21 4B 64      [10] 4060 	ld	hl, #(_cu + 0x0006) + 0
   7C7E 4E            [ 7] 4061 	ld	c,(hl)
                           4062 ;src/main.c:792: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4063 ;src/main.c:791: if(cu.lanzado && cu.mover){
   7C7F 79            [ 4] 4064 	ld	a,c
   7C80 B7            [ 4] 4065 	or	a, a
   7C81 28 30         [12] 4066 	jr	Z,00114$
   7C83 3A 4E 64      [13] 4067 	ld	a, (#(_cu + 0x0009) + 0)
   7C86 B7            [ 4] 4068 	or	a, a
   7C87 28 2A         [12] 4069 	jr	Z,00114$
                           4070 ;src/main.c:792: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7C89 21 46 64      [10] 4071 	ld	hl, #(_cu + 0x0001) + 0
   7C8C 4E            [ 7] 4072 	ld	c,(hl)
   7C8D 21 45 64      [10] 4073 	ld	hl, #_cu + 0
   7C90 46            [ 7] 4074 	ld	b,(hl)
   7C91 21 4D 64      [10] 4075 	ld	hl, #(_cu + 0x0008) + 0
   7C94 5E            [ 7] 4076 	ld	e,(hl)
   7C95 2A 50 64      [16] 4077 	ld	hl,(_mapa)
   7C98 E5            [11] 4078 	push	hl
   7C99 21 00 01      [10] 4079 	ld	hl,#_g_tablatrans
   7C9C E5            [11] 4080 	push	hl
   7C9D 21 45 64      [10] 4081 	ld	hl,#_cu
   7CA0 E5            [11] 4082 	push	hl
   7CA1 79            [ 4] 4083 	ld	a,c
   7CA2 F5            [11] 4084 	push	af
   7CA3 33            [ 6] 4085 	inc	sp
   7CA4 C5            [11] 4086 	push	bc
   7CA5 33            [ 6] 4087 	inc	sp
   7CA6 7B            [ 4] 4088 	ld	a,e
   7CA7 F5            [11] 4089 	push	af
   7CA8 33            [ 6] 4090 	inc	sp
   7CA9 CD 25 40      [17] 4091 	call	_redibujarCuchillo
   7CAC 21 09 00      [10] 4092 	ld	hl,#9
   7CAF 39            [11] 4093 	add	hl,sp
   7CB0 F9            [ 6] 4094 	ld	sp,hl
   7CB1 18 28         [12] 4095 	jr	00115$
   7CB3                    4096 00114$:
                           4097 ;src/main.c:793: }else if (cu.lanzado && !cu.mover){
   7CB3 79            [ 4] 4098 	ld	a,c
   7CB4 B7            [ 4] 4099 	or	a, a
   7CB5 28 24         [12] 4100 	jr	Z,00115$
   7CB7 3A 4E 64      [13] 4101 	ld	a, (#(_cu + 0x0009) + 0)
   7CBA B7            [ 4] 4102 	or	a, a
   7CBB 20 1E         [12] 4103 	jr	NZ,00115$
                           4104 ;src/main.c:794: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7CBD 21 46 64      [10] 4105 	ld	hl, #(_cu + 0x0001) + 0
   7CC0 46            [ 7] 4106 	ld	b,(hl)
   7CC1 21 45 64      [10] 4107 	ld	hl, #_cu + 0
   7CC4 4E            [ 7] 4108 	ld	c,(hl)
   7CC5 21 4D 64      [10] 4109 	ld	hl, #(_cu + 0x0008) + 0
   7CC8 56            [ 7] 4110 	ld	d,(hl)
   7CC9 2A 50 64      [16] 4111 	ld	hl,(_mapa)
   7CCC E5            [11] 4112 	push	hl
   7CCD C5            [11] 4113 	push	bc
   7CCE D5            [11] 4114 	push	de
   7CCF 33            [ 6] 4115 	inc	sp
   7CD0 CD 92 3F      [17] 4116 	call	_borrarCuchillo
   7CD3 F1            [10] 4117 	pop	af
   7CD4 F1            [10] 4118 	pop	af
   7CD5 33            [ 6] 4119 	inc	sp
                           4120 ;src/main.c:795: cu.lanzado = NO;
   7CD6 21 4B 64      [10] 4121 	ld	hl,#(_cu + 0x0006)
   7CD9 36 00         [10] 4122 	ld	(hl),#0x00
   7CDB                    4123 00115$:
                           4124 ;src/main.c:798: i = 2 + num_mapa;
   7CDB 3A 52 64      [13] 4125 	ld	a,(#_num_mapa + 0)
   7CDE C6 02         [ 7] 4126 	add	a, #0x02
   7CE0 DD 77 FC      [19] 4127 	ld	-4 (ix),a
                           4128 ;src/main.c:799: actual = enemy;
   7CE3 01 B5 60      [10] 4129 	ld	bc,#_enemy
                           4130 ;src/main.c:800: while(i){
   7CE6                    4131 00122$:
   7CE6 DD 7E FC      [19] 4132 	ld	a,-4 (ix)
   7CE9 B7            [ 4] 4133 	or	a, a
   7CEA CA 99 7D      [10] 4134 	jp	Z,00124$
                           4135 ;src/main.c:802: --i;
   7CED DD 35 FC      [23] 4136 	dec	-4 (ix)
                           4137 ;src/main.c:803: if(actual->mover){
   7CF0 21 06 00      [10] 4138 	ld	hl,#0x0006
   7CF3 09            [11] 4139 	add	hl,bc
   7CF4 E3            [19] 4140 	ex	(sp), hl
   7CF5 E1            [10] 4141 	pop	hl
   7CF6 E5            [11] 4142 	push	hl
   7CF7 7E            [ 7] 4143 	ld	a,(hl)
   7CF8 B7            [ 4] 4144 	or	a, a
   7CF9 28 18         [12] 4145 	jr	Z,00118$
                           4146 ;src/main.c:804: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7CFB 69            [ 4] 4147 	ld	l, c
   7CFC 60            [ 4] 4148 	ld	h, b
   7CFD 23            [ 6] 4149 	inc	hl
   7CFE 23            [ 6] 4150 	inc	hl
   7CFF 23            [ 6] 4151 	inc	hl
   7D00 5E            [ 7] 4152 	ld	e,(hl)
   7D01 69            [ 4] 4153 	ld	l, c
   7D02 60            [ 4] 4154 	ld	h, b
   7D03 23            [ 6] 4155 	inc	hl
   7D04 23            [ 6] 4156 	inc	hl
   7D05 56            [ 7] 4157 	ld	d,(hl)
   7D06 C5            [11] 4158 	push	bc
   7D07 C5            [11] 4159 	push	bc
   7D08 7B            [ 4] 4160 	ld	a,e
   7D09 F5            [11] 4161 	push	af
   7D0A 33            [ 6] 4162 	inc	sp
   7D0B D5            [11] 4163 	push	de
   7D0C 33            [ 6] 4164 	inc	sp
   7D0D CD 4E 69      [17] 4165 	call	_redibujarEnemigo
   7D10 F1            [10] 4166 	pop	af
   7D11 F1            [10] 4167 	pop	af
   7D12 C1            [10] 4168 	pop	bc
   7D13                    4169 00118$:
                           4170 ;src/main.c:807: if (actual->muerto && actual->muertes == 0){
   7D13 C5            [11] 4171 	push	bc
   7D14 FD E1         [14] 4172 	pop	iy
   7D16 FD 7E 08      [19] 4173 	ld	a,8 (iy)
   7D19 B7            [ 4] 4174 	or	a, a
   7D1A 28 74         [12] 4175 	jr	Z,00120$
   7D1C 21 0A 00      [10] 4176 	ld	hl,#0x000A
   7D1F 09            [11] 4177 	add	hl,bc
   7D20 EB            [ 4] 4178 	ex	de,hl
   7D21 1A            [ 7] 4179 	ld	a,(de)
   7D22 B7            [ 4] 4180 	or	a, a
   7D23 20 6B         [12] 4181 	jr	NZ,00120$
                           4182 ;src/main.c:808: borrarEnemigo((*actual).x, (*actual).y);
   7D25 21 01 00      [10] 4183 	ld	hl,#0x0001
   7D28 09            [11] 4184 	add	hl,bc
   7D29 DD 75 FE      [19] 4185 	ld	-2 (ix),l
   7D2C DD 74 FF      [19] 4186 	ld	-1 (ix),h
   7D2F DD 6E FE      [19] 4187 	ld	l,-2 (ix)
   7D32 DD 66 FF      [19] 4188 	ld	h,-1 (ix)
   7D35 7E            [ 7] 4189 	ld	a,(hl)
   7D36 F5            [11] 4190 	push	af
   7D37 0A            [ 7] 4191 	ld	a,(bc)
   7D38 DD 77 FB      [19] 4192 	ld	-5 (ix),a
   7D3B F1            [10] 4193 	pop	af
   7D3C C5            [11] 4194 	push	bc
   7D3D D5            [11] 4195 	push	de
   7D3E F5            [11] 4196 	push	af
   7D3F 33            [ 6] 4197 	inc	sp
   7D40 DD 7E FB      [19] 4198 	ld	a,-5 (ix)
   7D43 F5            [11] 4199 	push	af
   7D44 33            [ 6] 4200 	inc	sp
   7D45 CD D9 68      [17] 4201 	call	_borrarEnemigo
   7D48 F1            [10] 4202 	pop	af
   7D49 D1            [10] 4203 	pop	de
   7D4A C1            [10] 4204 	pop	bc
                           4205 ;src/main.c:809: dibujarExplosion(actual);
   7D4B C5            [11] 4206 	push	bc
   7D4C D5            [11] 4207 	push	de
   7D4D C5            [11] 4208 	push	bc
   7D4E CD 29 68      [17] 4209 	call	_dibujarExplosion
   7D51 F1            [10] 4210 	pop	af
   7D52 D1            [10] 4211 	pop	de
   7D53 C1            [10] 4212 	pop	bc
                           4213 ;src/main.c:810: puntuacion_aux = puntuacion;
   7D54 FD 21 53 64   [14] 4214 	ld	iy,#_puntuacion
   7D58 FD 6E 00      [19] 4215 	ld	l,0 (iy)
   7D5B 26 00         [ 7] 4216 	ld	h,#0x00
                           4217 ;src/main.c:811: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7D5D C5            [11] 4218 	push	bc
   7D5E D5            [11] 4219 	push	de
   7D5F E5            [11] 4220 	push	hl
   7D60 CD 6E 53      [17] 4221 	call	_aumentarPuntuacion
   7D63 F1            [10] 4222 	pop	af
   7D64 D1            [10] 4223 	pop	de
   7D65 C1            [10] 4224 	pop	bc
   7D66 FD 21 53 64   [14] 4225 	ld	iy,#_puntuacion
   7D6A FD 75 00      [19] 4226 	ld	0 (iy),l
                           4227 ;src/main.c:812: modificarPuntuacion(puntuacion);
   7D6D FD 21 53 64   [14] 4228 	ld	iy,#_puntuacion
   7D71 FD 6E 00      [19] 4229 	ld	l,0 (iy)
   7D74 26 00         [ 7] 4230 	ld	h,#0x00
   7D76 C5            [11] 4231 	push	bc
   7D77 D5            [11] 4232 	push	de
   7D78 E5            [11] 4233 	push	hl
   7D79 CD 31 52      [17] 4234 	call	_modificarPuntuacion
   7D7C F1            [10] 4235 	pop	af
   7D7D D1            [10] 4236 	pop	de
   7D7E C1            [10] 4237 	pop	bc
                           4238 ;src/main.c:813: actual->mover = NO;
   7D7F E1            [10] 4239 	pop	hl
   7D80 E5            [11] 4240 	push	hl
   7D81 36 00         [10] 4241 	ld	(hl),#0x00
                           4242 ;src/main.c:814: actual->muertes++;
   7D83 1A            [ 7] 4243 	ld	a,(de)
   7D84 3C            [ 4] 4244 	inc	a
   7D85 12            [ 7] 4245 	ld	(de),a
                           4246 ;src/main.c:815: actual->x = 0;
   7D86 AF            [ 4] 4247 	xor	a, a
   7D87 02            [ 7] 4248 	ld	(bc),a
                           4249 ;src/main.c:816: actual->y = 0;
   7D88 DD 6E FE      [19] 4250 	ld	l,-2 (ix)
   7D8B DD 66 FF      [19] 4251 	ld	h,-1 (ix)
   7D8E 36 00         [10] 4252 	ld	(hl),#0x00
   7D90                    4253 00120$:
                           4254 ;src/main.c:818: ++actual;
   7D90 21 E2 00      [10] 4255 	ld	hl,#0x00E2
   7D93 09            [11] 4256 	add	hl,bc
   7D94 4D            [ 4] 4257 	ld	c,l
   7D95 44            [ 4] 4258 	ld	b,h
   7D96 C3 E6 7C      [10] 4259 	jp	00122$
   7D99                    4260 00124$:
                           4261 ;src/main.c:820: cpct_waitVSYNC();
   7D99 CD FC 56      [17] 4262 	call	_cpct_waitVSYNC
   7D9C C3 DE 7B      [10] 4263 	jp	00126$
                           4264 	.area _CODE
                           4265 	.area _INITIALIZER
                           4266 	.area _CABS (ABS)
