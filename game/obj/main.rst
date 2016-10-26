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
   609D                      87 _enemy::
   609D                      88 	.ds 904
   6425                      89 _prota::
   6425                      90 	.ds 8
   642D                      91 _cu::
   642D                      92 	.ds 11
   6438                      93 _vidas::
   6438                      94 	.ds 1
   6439                      95 _i::
   6439                      96 	.ds 1
                             97 ;--------------------------------------------------------
                             98 ; ram data
                             99 ;--------------------------------------------------------
                            100 	.area _INITIALIZED
   6503                     101 _mapa::
   6503                     102 	.ds 2
   6505                     103 _num_mapa::
   6505                     104 	.ds 1
   6506                     105 _puntuacion::
   6506                     106 	.ds 1
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
   3F0A                     131 _dummy_cpct_transparentMaskTable0M0_container::
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
   650B                     172 _dibujarMapa::
                            173 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   650B 2A 03 65      [16]  174 	ld	hl,(_mapa)
   650E E5            [11]  175 	push	hl
   650F 21 F0 C0      [10]  176 	ld	hl,#0xC0F0
   6512 E5            [11]  177 	push	hl
   6513 21 2C 28      [10]  178 	ld	hl,#0x282C
   6516 E5            [11]  179 	push	hl
   6517 2E 00         [ 7]  180 	ld	l, #0x00
   6519 E5            [11]  181 	push	hl
   651A AF            [ 4]  182 	xor	a, a
   651B F5            [11]  183 	push	af
   651C 33            [ 6]  184 	inc	sp
   651D CD 24 55      [17]  185 	call	_cpct_etm_drawTileBox2x4
   6520 C9            [10]  186 	ret
   6521                     187 _mapas:
   6521 C0 10               188 	.dw _g_map1
   6523 E0 09               189 	.dw _g_map2
   6525 00 03               190 	.dw _g_map3
   6527                     191 _spawnX:
   6527 24                  192 	.db #0x24	; 36
   6528 47                  193 	.db #0x47	; 71	'G'
   6529 30                  194 	.db #0x30	; 48	'0'
   652A 18                  195 	.db #0x18	; 24
   652B                     196 _spawnY:
   652B 2C                  197 	.db #0x2C	; 44
   652C 66                  198 	.db #0x66	; 102	'f'
   652D 9A                  199 	.db #0x9A	; 154
   652E 40                  200 	.db #0x40	; 64
   652F                     201 _patrolX:
   652F 00                  202 	.db #0x00	; 0
   6530 00                  203 	.db #0x00	; 0
   6531 00                  204 	.db #0x00	; 0
   6532 00                  205 	.db #0x00	; 0
   6533 00                  206 	.db #0x00	; 0
   6534 42                  207 	.db #0x42	; 66	'B'
   6535 33                  208 	.db #0x33	; 51	'3'
   6536 00                  209 	.db #0x00	; 0
   6537 00                  210 	.db #0x00	; 0
   6538 00                  211 	.db 0x00
   6539 34                  212 	.db #0x34	; 52	'4'
   653A 33                  213 	.db #0x33	; 51	'3'
   653B 14                  214 	.db #0x14	; 20
   653C 00                  215 	.db #0x00	; 0
   653D 00                  216 	.db 0x00
   653E 38                  217 	.db #0x38	; 56	'8'
   653F 3C                  218 	.db #0x3C	; 60
   6540 23                  219 	.db #0x23	; 35
   6541 18                  220 	.db #0x18	; 24
   6542 00                  221 	.db 0x00
   6543                     222 _patrolY:
   6543 00                  223 	.db #0x00	; 0
   6544 00                  224 	.db #0x00	; 0
   6545 00                  225 	.db #0x00	; 0
   6546 00                  226 	.db #0x00	; 0
   6547 00                  227 	.db 0x00
   6548 5E                  228 	.db #0x5E	; 94
   6549 A6                  229 	.db #0xA6	; 166
   654A 00                  230 	.db #0x00	; 0
   654B 00                  231 	.db #0x00	; 0
   654C 00                  232 	.db 0x00
   654D A0                  233 	.db #0xA0	; 160
   654E 66                  234 	.db #0x66	; 102	'f'
   654F 2C                  235 	.db #0x2C	; 44
   6550 00                  236 	.db #0x00	; 0
   6551 00                  237 	.db 0x00
   6552 AE                  238 	.db #0xAE	; 174
   6553 66                  239 	.db #0x66	; 102	'f'
   6554 22                  240 	.db #0x22	; 34
   6555 86                  241 	.db #0x86	; 134
   6556 00                  242 	.db 0x00
                            243 ;src/main.c:118: void dibujarProta() {
                            244 ;	---------------------------------
                            245 ; Function dibujarProta
                            246 ; ---------------------------------
   6557                     247 _dibujarProta::
                            248 ;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6557 21 26 64      [10]  249 	ld	hl, #_prota + 1
   655A 56            [ 7]  250 	ld	d,(hl)
   655B 21 25 64      [10]  251 	ld	hl, #_prota + 0
   655E 46            [ 7]  252 	ld	b,(hl)
   655F D5            [11]  253 	push	de
   6560 33            [ 6]  254 	inc	sp
   6561 C5            [11]  255 	push	bc
   6562 33            [ 6]  256 	inc	sp
   6563 21 00 C0      [10]  257 	ld	hl,#0xC000
   6566 E5            [11]  258 	push	hl
   6567 CD 42 60      [17]  259 	call	_cpct_getScreenPtr
   656A EB            [ 4]  260 	ex	de,hl
                            261 ;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   656B ED 4B 29 64   [20]  262 	ld	bc, (#_prota + 4)
   656F 21 00 01      [10]  263 	ld	hl,#_g_tablatrans
   6572 E5            [11]  264 	push	hl
   6573 21 07 16      [10]  265 	ld	hl,#0x1607
   6576 E5            [11]  266 	push	hl
   6577 D5            [11]  267 	push	de
   6578 C5            [11]  268 	push	bc
   6579 CD 62 60      [17]  269 	call	_cpct_drawSpriteMaskedAlignedTable
   657C C9            [10]  270 	ret
                            271 ;src/main.c:123: void borrarProta() {
                            272 ;	---------------------------------
                            273 ; Function borrarProta
                            274 ; ---------------------------------
   657D                     275 _borrarProta::
   657D DD E5         [15]  276 	push	ix
   657F DD 21 00 00   [14]  277 	ld	ix,#0
   6583 DD 39         [15]  278 	add	ix,sp
   6585 F5            [11]  279 	push	af
   6586 3B            [ 6]  280 	dec	sp
                            281 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   6587 21 27 64      [10]  282 	ld	hl, #_prota + 2
   658A 4E            [ 7]  283 	ld	c,(hl)
   658B 79            [ 4]  284 	ld	a,c
   658C E6 01         [ 7]  285 	and	a, #0x01
   658E 47            [ 4]  286 	ld	b,a
   658F 04            [ 4]  287 	inc	b
   6590 04            [ 4]  288 	inc	b
   6591 04            [ 4]  289 	inc	b
   6592 04            [ 4]  290 	inc	b
                            291 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6593 21 28 64      [10]  292 	ld	hl, #_prota + 3
   6596 5E            [ 7]  293 	ld	e,(hl)
   6597 CB 4B         [ 8]  294 	bit	1, e
   6599 28 04         [12]  295 	jr	Z,00103$
   659B 3E 01         [ 7]  296 	ld	a,#0x01
   659D 18 02         [12]  297 	jr	00104$
   659F                     298 00103$:
   659F 3E 00         [ 7]  299 	ld	a,#0x00
   65A1                     300 00104$:
   65A1 C6 06         [ 7]  301 	add	a, #0x06
   65A3 DD 77 FD      [19]  302 	ld	-3 (ix),a
                            303 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   65A6 FD 2A 03 65   [20]  304 	ld	iy,(_mapa)
   65AA 16 00         [ 7]  305 	ld	d,#0x00
   65AC 7B            [ 4]  306 	ld	a,e
   65AD C6 E8         [ 7]  307 	add	a,#0xE8
   65AF DD 77 FE      [19]  308 	ld	-2 (ix),a
   65B2 7A            [ 4]  309 	ld	a,d
   65B3 CE FF         [ 7]  310 	adc	a,#0xFF
   65B5 DD 77 FF      [19]  311 	ld	-1 (ix),a
   65B8 DD 6E FE      [19]  312 	ld	l,-2 (ix)
   65BB DD 66 FF      [19]  313 	ld	h,-1 (ix)
   65BE DD CB FF 7E   [20]  314 	bit	7, -1 (ix)
   65C2 28 04         [12]  315 	jr	Z,00105$
   65C4 21 EB FF      [10]  316 	ld	hl,#0xFFEB
   65C7 19            [11]  317 	add	hl,de
   65C8                     318 00105$:
   65C8 CB 2C         [ 8]  319 	sra	h
   65CA CB 1D         [ 8]  320 	rr	l
   65CC CB 2C         [ 8]  321 	sra	h
   65CE CB 1D         [ 8]  322 	rr	l
   65D0 55            [ 4]  323 	ld	d,l
   65D1 CB 39         [ 8]  324 	srl	c
   65D3 FD E5         [15]  325 	push	iy
   65D5 21 F0 C0      [10]  326 	ld	hl,#0xC0F0
   65D8 E5            [11]  327 	push	hl
   65D9 3E 28         [ 7]  328 	ld	a,#0x28
   65DB F5            [11]  329 	push	af
   65DC 33            [ 6]  330 	inc	sp
   65DD DD 7E FD      [19]  331 	ld	a,-3 (ix)
   65E0 F5            [11]  332 	push	af
   65E1 33            [ 6]  333 	inc	sp
   65E2 C5            [11]  334 	push	bc
   65E3 33            [ 6]  335 	inc	sp
   65E4 D5            [11]  336 	push	de
   65E5 33            [ 6]  337 	inc	sp
   65E6 79            [ 4]  338 	ld	a,c
   65E7 F5            [11]  339 	push	af
   65E8 33            [ 6]  340 	inc	sp
   65E9 CD 24 55      [17]  341 	call	_cpct_etm_drawTileBox2x4
   65EC DD F9         [10]  342 	ld	sp, ix
   65EE DD E1         [14]  343 	pop	ix
   65F0 C9            [10]  344 	ret
                            345 ;src/main.c:135: void redibujarProta() {
                            346 ;	---------------------------------
                            347 ; Function redibujarProta
                            348 ; ---------------------------------
   65F1                     349 _redibujarProta::
                            350 ;src/main.c:136: borrarProta();
   65F1 CD 7D 65      [17]  351 	call	_borrarProta
                            352 ;src/main.c:137: prota.px = prota.x;
   65F4 01 27 64      [10]  353 	ld	bc,#_prota + 2
   65F7 3A 25 64      [13]  354 	ld	a, (#_prota + 0)
   65FA 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:138: prota.py = prota.y;
   65FB 01 28 64      [10]  357 	ld	bc,#_prota + 3
   65FE 3A 26 64      [13]  358 	ld	a, (#_prota + 1)
   6601 02            [ 7]  359 	ld	(bc),a
                            360 ;src/main.c:139: dibujarProta();
   6602 C3 57 65      [10]  361 	jp  _dibujarProta
                            362 ;src/main.c:142: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            363 ;	---------------------------------
                            364 ; Function comprobarTeclado
                            365 ; ---------------------------------
   6605                     366 _comprobarTeclado::
                            367 ;src/main.c:143: cpct_scanKeyboard_if();
   6605 CD 7C 56      [17]  368 	call	_cpct_scanKeyboard_if
                            369 ;src/main.c:145: if (cpct_isAnyKeyPressed()) {
   6608 CD 6F 56      [17]  370 	call	_cpct_isAnyKeyPressed
   660B 7D            [ 4]  371 	ld	a,l
   660C B7            [ 4]  372 	or	a, a
   660D C8            [11]  373 	ret	Z
                            374 ;src/main.c:146: if (cpct_isKeyPressed(Key_CursorLeft)){
   660E 21 01 01      [10]  375 	ld	hl,#0x0101
   6611 CD 43 54      [17]  376 	call	_cpct_isKeyPressed
   6614 7D            [ 4]  377 	ld	a,l
   6615 B7            [ 4]  378 	or	a, a
                            379 ;src/main.c:147: moverIzquierda();
   6616 C2 F7 7B      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6619 21 00 02      [10]  382 	ld	hl,#0x0200
   661C CD 43 54      [17]  383 	call	_cpct_isKeyPressed
   661F 7D            [ 4]  384 	ld	a,l
   6620 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   6621 C2 1C 7C      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6624 21 00 01      [10]  389 	ld	hl,#0x0100
   6627 CD 43 54      [17]  390 	call	_cpct_isKeyPressed
   662A 7D            [ 4]  391 	ld	a,l
   662B B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   662C C2 61 7C      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   662F 21 00 04      [10]  396 	ld	hl,#0x0400
   6632 CD 43 54      [17]  397 	call	_cpct_isKeyPressed
   6635 7D            [ 4]  398 	ld	a,l
   6636 B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   6637 C2 85 7C      [10]  401 	jp	NZ,_moverAbajo
                            402 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_Space)){
   663A 21 05 80      [10]  403 	ld	hl,#0x8005
   663D CD 43 54      [17]  404 	call	_cpct_isKeyPressed
   6640 7D            [ 4]  405 	ld	a,l
   6641 B7            [ 4]  406 	or	a, a
   6642 C8            [11]  407 	ret	Z
                            408 ;src/main.c:155: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6643 21 08 00      [10]  409 	ld	hl, #8
   6646 39            [11]  410 	add	hl, sp
   6647 4E            [ 7]  411 	ld	c, (hl)
   6648 23            [ 6]  412 	inc	hl
   6649 46            [ 7]  413 	ld	b, (hl)
   664A C5            [11]  414 	push	bc
   664B 21 08 00      [10]  415 	ld	hl, #8
   664E 39            [11]  416 	add	hl, sp
   664F 4E            [ 7]  417 	ld	c, (hl)
   6650 23            [ 6]  418 	inc	hl
   6651 46            [ 7]  419 	ld	b, (hl)
   6652 C5            [11]  420 	push	bc
   6653 21 08 00      [10]  421 	ld	hl, #8
   6656 39            [11]  422 	add	hl, sp
   6657 4E            [ 7]  423 	ld	c, (hl)
   6658 23            [ 6]  424 	inc	hl
   6659 46            [ 7]  425 	ld	b, (hl)
   665A C5            [11]  426 	push	bc
   665B 21 08 00      [10]  427 	ld	hl, #8
   665E 39            [11]  428 	add	hl, sp
   665F 4E            [ 7]  429 	ld	c, (hl)
   6660 23            [ 6]  430 	inc	hl
   6661 46            [ 7]  431 	ld	b, (hl)
   6662 C5            [11]  432 	push	bc
   6663 CD 91 47      [17]  433 	call	_lanzarCuchillo
   6666 21 08 00      [10]  434 	ld	hl,#8
   6669 39            [11]  435 	add	hl,sp
   666A F9            [ 6]  436 	ld	sp,hl
   666B C9            [10]  437 	ret
                            438 ;src/main.c:160: u8 checkCollision(u8 direction) { // check optimization
                            439 ;	---------------------------------
                            440 ; Function checkCollision
                            441 ; ---------------------------------
   666C                     442 _checkCollision::
   666C DD E5         [15]  443 	push	ix
   666E DD 21 00 00   [14]  444 	ld	ix,#0
   6672 DD 39         [15]  445 	add	ix,sp
   6674 F5            [11]  446 	push	af
                            447 ;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6675 21 00 00      [10]  448 	ld	hl,#0x0000
   6678 E3            [19]  449 	ex	(sp), hl
   6679 11 00 00      [10]  450 	ld	de,#0x0000
   667C 01 00 00      [10]  451 	ld	bc,#0x0000
                            452 ;src/main.c:163: switch (direction) {
   667F 3E 03         [ 7]  453 	ld	a,#0x03
   6681 DD 96 04      [19]  454 	sub	a, 4 (ix)
   6684 DA BC 67      [10]  455 	jp	C,00105$
   6687 DD 5E 04      [19]  456 	ld	e,4 (ix)
   668A 16 00         [ 7]  457 	ld	d,#0x00
   668C 21 93 66      [10]  458 	ld	hl,#00124$
   668F 19            [11]  459 	add	hl,de
   6690 19            [11]  460 	add	hl,de
   6691 19            [11]  461 	add	hl,de
   6692 E9            [ 4]  462 	jp	(hl)
   6693                     463 00124$:
   6693 C3 9F 66      [10]  464 	jp	00101$
   6696 C3 F4 66      [10]  465 	jp	00102$
   6699 C3 44 67      [10]  466 	jp	00103$
   669C C3 81 67      [10]  467 	jp	00104$
                            468 ;src/main.c:164: case 0:
   669F                     469 00101$:
                            470 ;src/main.c:165: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   669F 21 26 64      [10]  471 	ld	hl, #(_prota + 0x0001) + 0
   66A2 4E            [ 7]  472 	ld	c,(hl)
   66A3 3A 25 64      [13]  473 	ld	a, (#_prota + 0)
   66A6 C6 07         [ 7]  474 	add	a, #0x07
   66A8 47            [ 4]  475 	ld	b,a
   66A9 79            [ 4]  476 	ld	a,c
   66AA F5            [11]  477 	push	af
   66AB 33            [ 6]  478 	inc	sp
   66AC C5            [11]  479 	push	bc
   66AD 33            [ 6]  480 	inc	sp
   66AE 2A 03 65      [16]  481 	ld	hl,(_mapa)
   66B1 E5            [11]  482 	push	hl
   66B2 CD 61 4B      [17]  483 	call	_getTilePtr
   66B5 F1            [10]  484 	pop	af
   66B6 F1            [10]  485 	pop	af
   66B7 33            [ 6]  486 	inc	sp
   66B8 33            [ 6]  487 	inc	sp
   66B9 E5            [11]  488 	push	hl
                            489 ;src/main.c:166: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   66BA 3A 26 64      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   66BD C6 14         [ 7]  491 	add	a, #0x14
   66BF 4F            [ 4]  492 	ld	c,a
   66C0 3A 25 64      [13]  493 	ld	a, (#_prota + 0)
   66C3 C6 07         [ 7]  494 	add	a, #0x07
   66C5 47            [ 4]  495 	ld	b,a
   66C6 79            [ 4]  496 	ld	a,c
   66C7 F5            [11]  497 	push	af
   66C8 33            [ 6]  498 	inc	sp
   66C9 C5            [11]  499 	push	bc
   66CA 33            [ 6]  500 	inc	sp
   66CB 2A 03 65      [16]  501 	ld	hl,(_mapa)
   66CE E5            [11]  502 	push	hl
   66CF CD 61 4B      [17]  503 	call	_getTilePtr
   66D2 F1            [10]  504 	pop	af
   66D3 F1            [10]  505 	pop	af
   66D4 EB            [ 4]  506 	ex	de,hl
                            507 ;src/main.c:167: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   66D5 3A 26 64      [13]  508 	ld	a, (#(_prota + 0x0001) + 0)
   66D8 C6 0B         [ 7]  509 	add	a, #0x0B
   66DA 47            [ 4]  510 	ld	b,a
   66DB 3A 25 64      [13]  511 	ld	a, (#_prota + 0)
   66DE C6 07         [ 7]  512 	add	a, #0x07
   66E0 D5            [11]  513 	push	de
   66E1 C5            [11]  514 	push	bc
   66E2 33            [ 6]  515 	inc	sp
   66E3 F5            [11]  516 	push	af
   66E4 33            [ 6]  517 	inc	sp
   66E5 2A 03 65      [16]  518 	ld	hl,(_mapa)
   66E8 E5            [11]  519 	push	hl
   66E9 CD 61 4B      [17]  520 	call	_getTilePtr
   66EC F1            [10]  521 	pop	af
   66ED F1            [10]  522 	pop	af
   66EE 4D            [ 4]  523 	ld	c,l
   66EF 44            [ 4]  524 	ld	b,h
   66F0 D1            [10]  525 	pop	de
                            526 ;src/main.c:168: break;
   66F1 C3 BC 67      [10]  527 	jp	00105$
                            528 ;src/main.c:169: case 1:
   66F4                     529 00102$:
                            530 ;src/main.c:170: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   66F4 21 26 64      [10]  531 	ld	hl, #(_prota + 0x0001) + 0
   66F7 56            [ 7]  532 	ld	d,(hl)
   66F8 21 25 64      [10]  533 	ld	hl, #_prota + 0
   66FB 46            [ 7]  534 	ld	b,(hl)
   66FC 05            [ 4]  535 	dec	b
   66FD D5            [11]  536 	push	de
   66FE 33            [ 6]  537 	inc	sp
   66FF C5            [11]  538 	push	bc
   6700 33            [ 6]  539 	inc	sp
   6701 2A 03 65      [16]  540 	ld	hl,(_mapa)
   6704 E5            [11]  541 	push	hl
   6705 CD 61 4B      [17]  542 	call	_getTilePtr
   6708 F1            [10]  543 	pop	af
   6709 F1            [10]  544 	pop	af
   670A 33            [ 6]  545 	inc	sp
   670B 33            [ 6]  546 	inc	sp
   670C E5            [11]  547 	push	hl
                            548 ;src/main.c:171: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   670D 3A 26 64      [13]  549 	ld	a, (#(_prota + 0x0001) + 0)
   6710 C6 14         [ 7]  550 	add	a, #0x14
   6712 57            [ 4]  551 	ld	d,a
   6713 21 25 64      [10]  552 	ld	hl, #_prota + 0
   6716 46            [ 7]  553 	ld	b,(hl)
   6717 05            [ 4]  554 	dec	b
   6718 D5            [11]  555 	push	de
   6719 33            [ 6]  556 	inc	sp
   671A C5            [11]  557 	push	bc
   671B 33            [ 6]  558 	inc	sp
   671C 2A 03 65      [16]  559 	ld	hl,(_mapa)
   671F E5            [11]  560 	push	hl
   6720 CD 61 4B      [17]  561 	call	_getTilePtr
   6723 F1            [10]  562 	pop	af
   6724 F1            [10]  563 	pop	af
   6725 EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:172: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   6726 3A 26 64      [13]  566 	ld	a, (#(_prota + 0x0001) + 0)
   6729 C6 0B         [ 7]  567 	add	a, #0x0B
   672B 47            [ 4]  568 	ld	b,a
   672C 3A 25 64      [13]  569 	ld	a, (#_prota + 0)
   672F C6 FF         [ 7]  570 	add	a,#0xFF
   6731 D5            [11]  571 	push	de
   6732 C5            [11]  572 	push	bc
   6733 33            [ 6]  573 	inc	sp
   6734 F5            [11]  574 	push	af
   6735 33            [ 6]  575 	inc	sp
   6736 2A 03 65      [16]  576 	ld	hl,(_mapa)
   6739 E5            [11]  577 	push	hl
   673A CD 61 4B      [17]  578 	call	_getTilePtr
   673D F1            [10]  579 	pop	af
   673E F1            [10]  580 	pop	af
   673F 4D            [ 4]  581 	ld	c,l
   6740 44            [ 4]  582 	ld	b,h
   6741 D1            [10]  583 	pop	de
                            584 ;src/main.c:173: break;
   6742 18 78         [12]  585 	jr	00105$
                            586 ;src/main.c:174: case 2:
   6744                     587 00103$:
                            588 ;src/main.c:175: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6744 3A 26 64      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   6747 C6 FE         [ 7]  590 	add	a,#0xFE
   6749 21 25 64      [10]  591 	ld	hl, #_prota + 0
   674C 56            [ 7]  592 	ld	d,(hl)
   674D C5            [11]  593 	push	bc
   674E F5            [11]  594 	push	af
   674F 33            [ 6]  595 	inc	sp
   6750 D5            [11]  596 	push	de
   6751 33            [ 6]  597 	inc	sp
   6752 2A 03 65      [16]  598 	ld	hl,(_mapa)
   6755 E5            [11]  599 	push	hl
   6756 CD 61 4B      [17]  600 	call	_getTilePtr
   6759 F1            [10]  601 	pop	af
   675A F1            [10]  602 	pop	af
   675B C1            [10]  603 	pop	bc
   675C 33            [ 6]  604 	inc	sp
   675D 33            [ 6]  605 	inc	sp
   675E E5            [11]  606 	push	hl
                            607 ;src/main.c:176: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   675F 21 26 64      [10]  608 	ld	hl, #(_prota + 0x0001) + 0
   6762 56            [ 7]  609 	ld	d,(hl)
   6763 15            [ 4]  610 	dec	d
   6764 15            [ 4]  611 	dec	d
   6765 3A 25 64      [13]  612 	ld	a, (#_prota + 0)
   6768 C6 03         [ 7]  613 	add	a, #0x03
   676A C5            [11]  614 	push	bc
   676B D5            [11]  615 	push	de
   676C 33            [ 6]  616 	inc	sp
   676D F5            [11]  617 	push	af
   676E 33            [ 6]  618 	inc	sp
   676F 2A 03 65      [16]  619 	ld	hl,(_mapa)
   6772 E5            [11]  620 	push	hl
   6773 CD 61 4B      [17]  621 	call	_getTilePtr
   6776 F1            [10]  622 	pop	af
   6777 F1            [10]  623 	pop	af
   6778 EB            [ 4]  624 	ex	de,hl
   6779 C1            [10]  625 	pop	bc
                            626 ;src/main.c:177: *waistTile = 0;
   677A 21 00 00      [10]  627 	ld	hl,#0x0000
   677D 36 00         [10]  628 	ld	(hl),#0x00
                            629 ;src/main.c:178: break;
   677F 18 3B         [12]  630 	jr	00105$
                            631 ;src/main.c:179: case 3:
   6781                     632 00104$:
                            633 ;src/main.c:180: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6781 3A 26 64      [13]  634 	ld	a, (#(_prota + 0x0001) + 0)
   6784 C6 16         [ 7]  635 	add	a, #0x16
   6786 21 25 64      [10]  636 	ld	hl, #_prota + 0
   6789 56            [ 7]  637 	ld	d,(hl)
   678A C5            [11]  638 	push	bc
   678B F5            [11]  639 	push	af
   678C 33            [ 6]  640 	inc	sp
   678D D5            [11]  641 	push	de
   678E 33            [ 6]  642 	inc	sp
   678F 2A 03 65      [16]  643 	ld	hl,(_mapa)
   6792 E5            [11]  644 	push	hl
   6793 CD 61 4B      [17]  645 	call	_getTilePtr
   6796 F1            [10]  646 	pop	af
   6797 F1            [10]  647 	pop	af
   6798 C1            [10]  648 	pop	bc
   6799 33            [ 6]  649 	inc	sp
   679A 33            [ 6]  650 	inc	sp
   679B E5            [11]  651 	push	hl
                            652 ;src/main.c:181: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   679C 3A 26 64      [13]  653 	ld	a, (#(_prota + 0x0001) + 0)
   679F C6 16         [ 7]  654 	add	a, #0x16
   67A1 57            [ 4]  655 	ld	d,a
   67A2 3A 25 64      [13]  656 	ld	a, (#_prota + 0)
   67A5 C6 03         [ 7]  657 	add	a, #0x03
   67A7 C5            [11]  658 	push	bc
   67A8 D5            [11]  659 	push	de
   67A9 33            [ 6]  660 	inc	sp
   67AA F5            [11]  661 	push	af
   67AB 33            [ 6]  662 	inc	sp
   67AC 2A 03 65      [16]  663 	ld	hl,(_mapa)
   67AF E5            [11]  664 	push	hl
   67B0 CD 61 4B      [17]  665 	call	_getTilePtr
   67B3 F1            [10]  666 	pop	af
   67B4 F1            [10]  667 	pop	af
   67B5 EB            [ 4]  668 	ex	de,hl
   67B6 C1            [10]  669 	pop	bc
                            670 ;src/main.c:182: *waistTile = 0;
   67B7 21 00 00      [10]  671 	ld	hl,#0x0000
   67BA 36 00         [10]  672 	ld	(hl),#0x00
                            673 ;src/main.c:184: }
   67BC                     674 00105$:
                            675 ;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   67BC E1            [10]  676 	pop	hl
   67BD E5            [11]  677 	push	hl
   67BE 6E            [ 7]  678 	ld	l,(hl)
   67BF 3E 02         [ 7]  679 	ld	a,#0x02
   67C1 95            [ 4]  680 	sub	a, l
   67C2 38 0E         [12]  681 	jr	C,00106$
   67C4 1A            [ 7]  682 	ld	a,(de)
   67C5 5F            [ 4]  683 	ld	e,a
   67C6 3E 02         [ 7]  684 	ld	a,#0x02
   67C8 93            [ 4]  685 	sub	a, e
   67C9 38 07         [12]  686 	jr	C,00106$
   67CB 0A            [ 7]  687 	ld	a,(bc)
   67CC 4F            [ 4]  688 	ld	c,a
   67CD 3E 02         [ 7]  689 	ld	a,#0x02
   67CF 91            [ 4]  690 	sub	a, c
   67D0 30 04         [12]  691 	jr	NC,00107$
   67D2                     692 00106$:
                            693 ;src/main.c:187: return 1;
   67D2 2E 01         [ 7]  694 	ld	l,#0x01
   67D4 18 02         [12]  695 	jr	00110$
   67D6                     696 00107$:
                            697 ;src/main.c:189: return 0;
   67D6 2E 00         [ 7]  698 	ld	l,#0x00
   67D8                     699 00110$:
   67D8 DD F9         [10]  700 	ld	sp, ix
   67DA DD E1         [14]  701 	pop	ix
   67DC C9            [10]  702 	ret
                            703 ;src/main.c:192: void dibujarEnemigo(TEnemy *enemy) {
                            704 ;	---------------------------------
                            705 ; Function dibujarEnemigo
                            706 ; ---------------------------------
   67DD                     707 _dibujarEnemigo::
   67DD DD E5         [15]  708 	push	ix
   67DF DD 21 00 00   [14]  709 	ld	ix,#0
   67E3 DD 39         [15]  710 	add	ix,sp
                            711 ;src/main.c:193: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   67E5 DD 4E 04      [19]  712 	ld	c,4 (ix)
   67E8 DD 46 05      [19]  713 	ld	b,5 (ix)
   67EB 69            [ 4]  714 	ld	l, c
   67EC 60            [ 4]  715 	ld	h, b
   67ED 23            [ 6]  716 	inc	hl
   67EE 56            [ 7]  717 	ld	d,(hl)
   67EF 0A            [ 7]  718 	ld	a,(bc)
   67F0 C5            [11]  719 	push	bc
   67F1 D5            [11]  720 	push	de
   67F2 33            [ 6]  721 	inc	sp
   67F3 F5            [11]  722 	push	af
   67F4 33            [ 6]  723 	inc	sp
   67F5 21 00 C0      [10]  724 	ld	hl,#0xC000
   67F8 E5            [11]  725 	push	hl
   67F9 CD 42 60      [17]  726 	call	_cpct_getScreenPtr
   67FC EB            [ 4]  727 	ex	de,hl
                            728 ;src/main.c:194: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   67FD E1            [10]  729 	pop	hl
   67FE 01 04 00      [10]  730 	ld	bc, #0x0004
   6801 09            [11]  731 	add	hl, bc
   6802 4E            [ 7]  732 	ld	c,(hl)
   6803 23            [ 6]  733 	inc	hl
   6804 46            [ 7]  734 	ld	b,(hl)
   6805 21 00 01      [10]  735 	ld	hl,#_g_tablatrans
   6808 E5            [11]  736 	push	hl
   6809 21 04 16      [10]  737 	ld	hl,#0x1604
   680C E5            [11]  738 	push	hl
   680D D5            [11]  739 	push	de
   680E C5            [11]  740 	push	bc
   680F CD 62 60      [17]  741 	call	_cpct_drawSpriteMaskedAlignedTable
   6812 DD E1         [14]  742 	pop	ix
   6814 C9            [10]  743 	ret
                            744 ;src/main.c:197: void dibujarExplosion(TEnemy *enemy) {
                            745 ;	---------------------------------
                            746 ; Function dibujarExplosion
                            747 ; ---------------------------------
   6815                     748 _dibujarExplosion::
   6815 DD E5         [15]  749 	push	ix
   6817 DD 21 00 00   [14]  750 	ld	ix,#0
   681B DD 39         [15]  751 	add	ix,sp
                            752 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   681D DD 4E 04      [19]  753 	ld	c,4 (ix)
   6820 DD 46 05      [19]  754 	ld	b,5 (ix)
   6823 69            [ 4]  755 	ld	l, c
   6824 60            [ 4]  756 	ld	h, b
   6825 23            [ 6]  757 	inc	hl
   6826 56            [ 7]  758 	ld	d,(hl)
   6827 0A            [ 7]  759 	ld	a,(bc)
   6828 47            [ 4]  760 	ld	b,a
   6829 D5            [11]  761 	push	de
   682A 33            [ 6]  762 	inc	sp
   682B C5            [11]  763 	push	bc
   682C 33            [ 6]  764 	inc	sp
   682D 21 00 C0      [10]  765 	ld	hl,#0xC000
   6830 E5            [11]  766 	push	hl
   6831 CD 42 60      [17]  767 	call	_cpct_getScreenPtr
   6834 4D            [ 4]  768 	ld	c,l
   6835 44            [ 4]  769 	ld	b,h
                            770 ;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6836 11 00 01      [10]  771 	ld	de,#_g_tablatrans+0
   6839 D5            [11]  772 	push	de
   683A 21 04 16      [10]  773 	ld	hl,#0x1604
   683D E5            [11]  774 	push	hl
   683E C5            [11]  775 	push	bc
   683F 21 70 19      [10]  776 	ld	hl,#_g_explosion
   6842 E5            [11]  777 	push	hl
   6843 CD 62 60      [17]  778 	call	_cpct_drawSpriteMaskedAlignedTable
   6846 DD E1         [14]  779 	pop	ix
   6848 C9            [10]  780 	ret
                            781 ;src/main.c:202: void borrarExplosion(TEnemy *enemy) {
                            782 ;	---------------------------------
                            783 ; Function borrarExplosion
                            784 ; ---------------------------------
   6849                     785 _borrarExplosion::
   6849 DD E5         [15]  786 	push	ix
   684B DD 21 00 00   [14]  787 	ld	ix,#0
   684F DD 39         [15]  788 	add	ix,sp
   6851 F5            [11]  789 	push	af
   6852 3B            [ 6]  790 	dec	sp
                            791 ;src/main.c:205: u8 w = 4 + (enemy->px & 1);
   6853 DD 5E 04      [19]  792 	ld	e,4 (ix)
   6856 DD 56 05      [19]  793 	ld	d,5 (ix)
   6859 6B            [ 4]  794 	ld	l, e
   685A 62            [ 4]  795 	ld	h, d
   685B 23            [ 6]  796 	inc	hl
   685C 23            [ 6]  797 	inc	hl
   685D 4E            [ 7]  798 	ld	c,(hl)
   685E 79            [ 4]  799 	ld	a,c
   685F E6 01         [ 7]  800 	and	a, #0x01
   6861 47            [ 4]  801 	ld	b,a
   6862 04            [ 4]  802 	inc	b
   6863 04            [ 4]  803 	inc	b
   6864 04            [ 4]  804 	inc	b
   6865 04            [ 4]  805 	inc	b
                            806 ;src/main.c:206: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   6866 EB            [ 4]  807 	ex	de,hl
   6867 23            [ 6]  808 	inc	hl
   6868 23            [ 6]  809 	inc	hl
   6869 23            [ 6]  810 	inc	hl
   686A 5E            [ 7]  811 	ld	e,(hl)
   686B CB 4B         [ 8]  812 	bit	1, e
   686D 28 04         [12]  813 	jr	Z,00103$
   686F 3E 01         [ 7]  814 	ld	a,#0x01
   6871 18 02         [12]  815 	jr	00104$
   6873                     816 00103$:
   6873 3E 00         [ 7]  817 	ld	a,#0x00
   6875                     818 00104$:
   6875 C6 06         [ 7]  819 	add	a, #0x06
   6877 DD 77 FD      [19]  820 	ld	-3 (ix),a
                            821 ;src/main.c:208: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   687A FD 2A 03 65   [20]  822 	ld	iy,(_mapa)
   687E 16 00         [ 7]  823 	ld	d,#0x00
   6880 7B            [ 4]  824 	ld	a,e
   6881 C6 E8         [ 7]  825 	add	a,#0xE8
   6883 DD 77 FE      [19]  826 	ld	-2 (ix),a
   6886 7A            [ 4]  827 	ld	a,d
   6887 CE FF         [ 7]  828 	adc	a,#0xFF
   6889 DD 77 FF      [19]  829 	ld	-1 (ix),a
   688C DD 6E FE      [19]  830 	ld	l,-2 (ix)
   688F DD 66 FF      [19]  831 	ld	h,-1 (ix)
   6892 DD CB FF 7E   [20]  832 	bit	7, -1 (ix)
   6896 28 04         [12]  833 	jr	Z,00105$
   6898 21 EB FF      [10]  834 	ld	hl,#0xFFEB
   689B 19            [11]  835 	add	hl,de
   689C                     836 00105$:
   689C CB 2C         [ 8]  837 	sra	h
   689E CB 1D         [ 8]  838 	rr	l
   68A0 CB 2C         [ 8]  839 	sra	h
   68A2 CB 1D         [ 8]  840 	rr	l
   68A4 55            [ 4]  841 	ld	d,l
   68A5 CB 39         [ 8]  842 	srl	c
   68A7 FD E5         [15]  843 	push	iy
   68A9 21 F0 C0      [10]  844 	ld	hl,#0xC0F0
   68AC E5            [11]  845 	push	hl
   68AD 3E 28         [ 7]  846 	ld	a,#0x28
   68AF F5            [11]  847 	push	af
   68B0 33            [ 6]  848 	inc	sp
   68B1 DD 7E FD      [19]  849 	ld	a,-3 (ix)
   68B4 F5            [11]  850 	push	af
   68B5 33            [ 6]  851 	inc	sp
   68B6 C5            [11]  852 	push	bc
   68B7 33            [ 6]  853 	inc	sp
   68B8 D5            [11]  854 	push	de
   68B9 33            [ 6]  855 	inc	sp
   68BA 79            [ 4]  856 	ld	a,c
   68BB F5            [11]  857 	push	af
   68BC 33            [ 6]  858 	inc	sp
   68BD CD 24 55      [17]  859 	call	_cpct_etm_drawTileBox2x4
   68C0 DD F9         [10]  860 	ld	sp, ix
   68C2 DD E1         [14]  861 	pop	ix
   68C4 C9            [10]  862 	ret
                            863 ;src/main.c:212: void borrarEnemigo(u8 x, u8 y) {
                            864 ;	---------------------------------
                            865 ; Function borrarEnemigo
                            866 ; ---------------------------------
   68C5                     867 _borrarEnemigo::
   68C5 DD E5         [15]  868 	push	ix
   68C7 DD 21 00 00   [14]  869 	ld	ix,#0
   68CB DD 39         [15]  870 	add	ix,sp
   68CD F5            [11]  871 	push	af
   68CE F5            [11]  872 	push	af
                            873 ;src/main.c:216: u8 w = 4 + (x & 1);
   68CF DD 7E 04      [19]  874 	ld	a,4 (ix)
   68D2 E6 01         [ 7]  875 	and	a, #0x01
   68D4 4F            [ 4]  876 	ld	c,a
   68D5 0C            [ 4]  877 	inc	c
   68D6 0C            [ 4]  878 	inc	c
   68D7 0C            [ 4]  879 	inc	c
   68D8 0C            [ 4]  880 	inc	c
                            881 ;src/main.c:218: u8 h = 6 + (y & 3 ? 1 : 0);
   68D9 DD 7E 05      [19]  882 	ld	a,5 (ix)
   68DC E6 03         [ 7]  883 	and	a, #0x03
   68DE 28 04         [12]  884 	jr	Z,00103$
   68E0 3E 01         [ 7]  885 	ld	a,#0x01
   68E2 18 02         [12]  886 	jr	00104$
   68E4                     887 00103$:
   68E4 3E 00         [ 7]  888 	ld	a,#0x00
   68E6                     889 00104$:
   68E6 C6 06         [ 7]  890 	add	a, #0x06
   68E8 47            [ 4]  891 	ld	b,a
                            892 ;src/main.c:220: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68E9 2A 03 65      [16]  893 	ld	hl,(_mapa)
   68EC E3            [19]  894 	ex	(sp), hl
   68ED DD 5E 05      [19]  895 	ld	e,5 (ix)
   68F0 16 00         [ 7]  896 	ld	d,#0x00
   68F2 7B            [ 4]  897 	ld	a,e
   68F3 C6 E8         [ 7]  898 	add	a,#0xE8
   68F5 DD 77 FE      [19]  899 	ld	-2 (ix),a
   68F8 7A            [ 4]  900 	ld	a,d
   68F9 CE FF         [ 7]  901 	adc	a,#0xFF
   68FB DD 77 FF      [19]  902 	ld	-1 (ix),a
   68FE DD 6E FE      [19]  903 	ld	l,-2 (ix)
   6901 DD 66 FF      [19]  904 	ld	h,-1 (ix)
   6904 DD CB FF 7E   [20]  905 	bit	7, -1 (ix)
   6908 28 04         [12]  906 	jr	Z,00105$
   690A 21 EB FF      [10]  907 	ld	hl,#0xFFEB
   690D 19            [11]  908 	add	hl,de
   690E                     909 00105$:
   690E CB 2C         [ 8]  910 	sra	h
   6910 CB 1D         [ 8]  911 	rr	l
   6912 CB 2C         [ 8]  912 	sra	h
   6914 CB 1D         [ 8]  913 	rr	l
   6916 5D            [ 4]  914 	ld	e,l
   6917 DD 56 04      [19]  915 	ld	d,4 (ix)
   691A CB 3A         [ 8]  916 	srl	d
   691C E1            [10]  917 	pop	hl
   691D E5            [11]  918 	push	hl
   691E E5            [11]  919 	push	hl
   691F 21 F0 C0      [10]  920 	ld	hl,#0xC0F0
   6922 E5            [11]  921 	push	hl
   6923 3E 28         [ 7]  922 	ld	a,#0x28
   6925 F5            [11]  923 	push	af
   6926 33            [ 6]  924 	inc	sp
   6927 C5            [11]  925 	push	bc
   6928 7B            [ 4]  926 	ld	a,e
   6929 F5            [11]  927 	push	af
   692A 33            [ 6]  928 	inc	sp
   692B D5            [11]  929 	push	de
   692C 33            [ 6]  930 	inc	sp
   692D CD 24 55      [17]  931 	call	_cpct_etm_drawTileBox2x4
   6930 DD F9         [10]  932 	ld	sp, ix
   6932 DD E1         [14]  933 	pop	ix
   6934 C9            [10]  934 	ret
                            935 ;src/main.c:223: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            936 ;	---------------------------------
                            937 ; Function redibujarEnemigo
                            938 ; ---------------------------------
   6935                     939 _redibujarEnemigo::
   6935 DD E5         [15]  940 	push	ix
   6937 DD 21 00 00   [14]  941 	ld	ix,#0
   693B DD 39         [15]  942 	add	ix,sp
                            943 ;src/main.c:224: borrarEnemigo(x, y);
   693D DD 66 05      [19]  944 	ld	h,5 (ix)
   6940 DD 6E 04      [19]  945 	ld	l,4 (ix)
   6943 E5            [11]  946 	push	hl
   6944 CD C5 68      [17]  947 	call	_borrarEnemigo
   6947 F1            [10]  948 	pop	af
                            949 ;src/main.c:225: enemy->px = enemy->x;
   6948 DD 4E 06      [19]  950 	ld	c,6 (ix)
   694B DD 46 07      [19]  951 	ld	b,7 (ix)
   694E 59            [ 4]  952 	ld	e, c
   694F 50            [ 4]  953 	ld	d, b
   6950 13            [ 6]  954 	inc	de
   6951 13            [ 6]  955 	inc	de
   6952 0A            [ 7]  956 	ld	a,(bc)
   6953 12            [ 7]  957 	ld	(de),a
                            958 ;src/main.c:226: enemy->py = enemy->y;
   6954 59            [ 4]  959 	ld	e, c
   6955 50            [ 4]  960 	ld	d, b
   6956 13            [ 6]  961 	inc	de
   6957 13            [ 6]  962 	inc	de
   6958 13            [ 6]  963 	inc	de
   6959 69            [ 4]  964 	ld	l, c
   695A 60            [ 4]  965 	ld	h, b
   695B 23            [ 6]  966 	inc	hl
   695C 7E            [ 7]  967 	ld	a,(hl)
   695D 12            [ 7]  968 	ld	(de),a
                            969 ;src/main.c:227: dibujarEnemigo(enemy);
   695E C5            [11]  970 	push	bc
   695F CD DD 67      [17]  971 	call	_dibujarEnemigo
   6962 F1            [10]  972 	pop	af
   6963 DD E1         [14]  973 	pop	ix
   6965 C9            [10]  974 	ret
                            975 ;src/main.c:231: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            976 ;	---------------------------------
                            977 ; Function checkEnemyDead
                            978 ; ---------------------------------
   6966                     979 _checkEnemyDead::
   6966 DD E5         [15]  980 	push	ix
   6968 DD 21 00 00   [14]  981 	ld	ix,#0
   696C DD 39         [15]  982 	add	ix,sp
   696E 21 FA FF      [10]  983 	ld	hl,#-6
   6971 39            [11]  984 	add	hl,sp
   6972 F9            [ 6]  985 	ld	sp,hl
                            986 ;src/main.c:233: switch (direction) {
   6973 3E 03         [ 7]  987 	ld	a,#0x03
   6975 DD 96 04      [19]  988 	sub	a, 4 (ix)
   6978 DA 54 6B      [10]  989 	jp	C,00134$
                            990 ;src/main.c:237: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   697B DD 7E 05      [19]  991 	ld	a,5 (ix)
   697E DD 77 FC      [19]  992 	ld	-4 (ix),a
   6981 DD 7E 06      [19]  993 	ld	a,6 (ix)
   6984 DD 77 FD      [19]  994 	ld	-3 (ix),a
   6987 DD 7E FC      [19]  995 	ld	a,-4 (ix)
   698A C6 01         [ 7]  996 	add	a, #0x01
   698C DD 77 FA      [19]  997 	ld	-6 (ix),a
   698F DD 7E FD      [19]  998 	ld	a,-3 (ix)
   6992 CE 00         [ 7]  999 	adc	a, #0x00
   6994 DD 77 FB      [19] 1000 	ld	-5 (ix),a
                           1001 ;src/main.c:240: enemy->muerto = SI;
   6997 DD 7E FC      [19] 1002 	ld	a,-4 (ix)
   699A C6 08         [ 7] 1003 	add	a, #0x08
   699C DD 77 FE      [19] 1004 	ld	-2 (ix),a
   699F DD 7E FD      [19] 1005 	ld	a,-3 (ix)
   69A2 CE 00         [ 7] 1006 	adc	a, #0x00
   69A4 DD 77 FF      [19] 1007 	ld	-1 (ix),a
                           1008 ;src/main.c:233: switch (direction) {
   69A7 DD 5E 04      [19] 1009 	ld	e,4 (ix)
   69AA 16 00         [ 7] 1010 	ld	d,#0x00
   69AC 21 B3 69      [10] 1011 	ld	hl,#00204$
   69AF 19            [11] 1012 	add	hl,de
   69B0 19            [11] 1013 	add	hl,de
   69B1 19            [11] 1014 	add	hl,de
   69B2 E9            [ 4] 1015 	jp	(hl)
   69B3                    1016 00204$:
   69B3 C3 BF 69      [10] 1017 	jp	00101$
   69B6 C3 27 6A      [10] 1018 	jp	00109$
   69B9 C3 8F 6A      [10] 1019 	jp	00117$
   69BC C3 F6 6A      [10] 1020 	jp	00125$
                           1021 ;src/main.c:236: case 0:
   69BF                    1022 00101$:
                           1023 ;src/main.c:237: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69BF 21 2E 64      [10] 1024 	ld	hl, #_cu + 1
   69C2 4E            [ 7] 1025 	ld	c,(hl)
   69C3 06 00         [ 7] 1026 	ld	b,#0x00
   69C5 21 04 00      [10] 1027 	ld	hl,#0x0004
   69C8 09            [11] 1028 	add	hl,bc
   69C9 EB            [ 4] 1029 	ex	de,hl
   69CA E1            [10] 1030 	pop	hl
   69CB E5            [11] 1031 	push	hl
   69CC 6E            [ 7] 1032 	ld	l,(hl)
   69CD 26 00         [ 7] 1033 	ld	h,#0x00
   69CF 7B            [ 4] 1034 	ld	a,e
   69D0 95            [ 4] 1035 	sub	a, l
   69D1 7A            [ 4] 1036 	ld	a,d
   69D2 9C            [ 4] 1037 	sbc	a, h
   69D3 E2 D8 69      [10] 1038 	jp	PO, 00205$
   69D6 EE 80         [ 7] 1039 	xor	a, #0x80
   69D8                    1040 00205$:
   69D8 FA 54 6B      [10] 1041 	jp	M,00134$
   69DB 11 16 00      [10] 1042 	ld	de,#0x0016
   69DE 19            [11] 1043 	add	hl,de
   69DF 7D            [ 4] 1044 	ld	a,l
   69E0 91            [ 4] 1045 	sub	a, c
   69E1 7C            [ 4] 1046 	ld	a,h
   69E2 98            [ 4] 1047 	sbc	a, b
   69E3 E2 E8 69      [10] 1048 	jp	PO, 00206$
   69E6 EE 80         [ 7] 1049 	xor	a, #0x80
   69E8                    1050 00206$:
   69E8 FA 54 6B      [10] 1051 	jp	M,00134$
                           1052 ;src/main.c:238: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   69EB DD 6E FC      [19] 1053 	ld	l,-4 (ix)
   69EE DD 66 FD      [19] 1054 	ld	h,-3 (ix)
   69F1 4E            [ 7] 1055 	ld	c,(hl)
   69F2 21 2D 64      [10] 1056 	ld	hl, #_cu + 0
   69F5 5E            [ 7] 1057 	ld	e,(hl)
   69F6 16 00         [ 7] 1058 	ld	d,#0x00
   69F8 13            [ 6] 1059 	inc	de
   69F9 13            [ 6] 1060 	inc	de
   69FA 13            [ 6] 1061 	inc	de
   69FB 13            [ 6] 1062 	inc	de
   69FC 69            [ 4] 1063 	ld	l,c
   69FD 26 00         [ 7] 1064 	ld	h,#0x00
   69FF 7B            [ 4] 1065 	ld	a,e
   6A00 95            [ 4] 1066 	sub	a, l
   6A01 7A            [ 4] 1067 	ld	a,d
   6A02 9C            [ 4] 1068 	sbc	a, h
   6A03 E2 08 6A      [10] 1069 	jp	PO, 00207$
   6A06 EE 80         [ 7] 1070 	xor	a, #0x80
   6A08                    1071 00207$:
   6A08 F2 54 6B      [10] 1072 	jp	P,00134$
                           1073 ;src/main.c:239: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A0B BF            [ 4] 1074 	cp	a, a
   6A0C ED 52         [15] 1075 	sbc	hl, de
   6A0E 3E 01         [ 7] 1076 	ld	a,#0x01
   6A10 BD            [ 4] 1077 	cp	a, l
   6A11 3E 00         [ 7] 1078 	ld	a,#0x00
   6A13 9C            [ 4] 1079 	sbc	a, h
   6A14 E2 19 6A      [10] 1080 	jp	PO, 00208$
   6A17 EE 80         [ 7] 1081 	xor	a, #0x80
   6A19                    1082 00208$:
   6A19 FA 54 6B      [10] 1083 	jp	M,00134$
                           1084 ;src/main.c:240: enemy->muerto = SI;
   6A1C DD 6E FE      [19] 1085 	ld	l,-2 (ix)
   6A1F DD 66 FF      [19] 1086 	ld	h,-1 (ix)
   6A22 36 01         [10] 1087 	ld	(hl),#0x01
                           1088 ;src/main.c:244: break;
   6A24 C3 54 6B      [10] 1089 	jp	00134$
                           1090 ;src/main.c:245: case 1:
   6A27                    1091 00109$:
                           1092 ;src/main.c:246: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A27 21 2E 64      [10] 1093 	ld	hl, #_cu + 1
   6A2A 4E            [ 7] 1094 	ld	c,(hl)
   6A2B 06 00         [ 7] 1095 	ld	b,#0x00
   6A2D 21 04 00      [10] 1096 	ld	hl,#0x0004
   6A30 09            [11] 1097 	add	hl,bc
   6A31 EB            [ 4] 1098 	ex	de,hl
   6A32 E1            [10] 1099 	pop	hl
   6A33 E5            [11] 1100 	push	hl
   6A34 6E            [ 7] 1101 	ld	l,(hl)
   6A35 26 00         [ 7] 1102 	ld	h,#0x00
   6A37 7B            [ 4] 1103 	ld	a,e
   6A38 95            [ 4] 1104 	sub	a, l
   6A39 7A            [ 4] 1105 	ld	a,d
   6A3A 9C            [ 4] 1106 	sbc	a, h
   6A3B E2 40 6A      [10] 1107 	jp	PO, 00209$
   6A3E EE 80         [ 7] 1108 	xor	a, #0x80
   6A40                    1109 00209$:
   6A40 FA 54 6B      [10] 1110 	jp	M,00134$
   6A43 11 16 00      [10] 1111 	ld	de,#0x0016
   6A46 19            [11] 1112 	add	hl,de
   6A47 7D            [ 4] 1113 	ld	a,l
   6A48 91            [ 4] 1114 	sub	a, c
   6A49 7C            [ 4] 1115 	ld	a,h
   6A4A 98            [ 4] 1116 	sbc	a, b
   6A4B E2 50 6A      [10] 1117 	jp	PO, 00210$
   6A4E EE 80         [ 7] 1118 	xor	a, #0x80
   6A50                    1119 00210$:
   6A50 FA 54 6B      [10] 1120 	jp	M,00134$
                           1121 ;src/main.c:247: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6A53 21 2D 64      [10] 1122 	ld	hl, #_cu + 0
   6A56 4E            [ 7] 1123 	ld	c,(hl)
   6A57 DD 6E FC      [19] 1124 	ld	l,-4 (ix)
   6A5A DD 66 FD      [19] 1125 	ld	h,-3 (ix)
   6A5D 5E            [ 7] 1126 	ld	e,(hl)
   6A5E 16 00         [ 7] 1127 	ld	d,#0x00
   6A60 13            [ 6] 1128 	inc	de
   6A61 13            [ 6] 1129 	inc	de
   6A62 13            [ 6] 1130 	inc	de
   6A63 13            [ 6] 1131 	inc	de
   6A64 69            [ 4] 1132 	ld	l,c
   6A65 26 00         [ 7] 1133 	ld	h,#0x00
   6A67 7B            [ 4] 1134 	ld	a,e
   6A68 95            [ 4] 1135 	sub	a, l
   6A69 7A            [ 4] 1136 	ld	a,d
   6A6A 9C            [ 4] 1137 	sbc	a, h
   6A6B E2 70 6A      [10] 1138 	jp	PO, 00211$
   6A6E EE 80         [ 7] 1139 	xor	a, #0x80
   6A70                    1140 00211$:
   6A70 F2 54 6B      [10] 1141 	jp	P,00134$
                           1142 ;src/main.c:248: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A73 BF            [ 4] 1143 	cp	a, a
   6A74 ED 52         [15] 1144 	sbc	hl, de
   6A76 3E 01         [ 7] 1145 	ld	a,#0x01
   6A78 BD            [ 4] 1146 	cp	a, l
   6A79 3E 00         [ 7] 1147 	ld	a,#0x00
   6A7B 9C            [ 4] 1148 	sbc	a, h
   6A7C E2 81 6A      [10] 1149 	jp	PO, 00212$
   6A7F EE 80         [ 7] 1150 	xor	a, #0x80
   6A81                    1151 00212$:
   6A81 FA 54 6B      [10] 1152 	jp	M,00134$
                           1153 ;src/main.c:249: enemy->muerto = SI;
   6A84 DD 6E FE      [19] 1154 	ld	l,-2 (ix)
   6A87 DD 66 FF      [19] 1155 	ld	h,-1 (ix)
   6A8A 36 01         [10] 1156 	ld	(hl),#0x01
                           1157 ;src/main.c:253: break;
   6A8C C3 54 6B      [10] 1158 	jp	00134$
                           1159 ;src/main.c:255: case 2:
   6A8F                    1160 00117$:
                           1161 ;src/main.c:256: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6A8F 21 2D 64      [10] 1162 	ld	hl, #_cu + 0
   6A92 4E            [ 7] 1163 	ld	c,(hl)
   6A93 06 00         [ 7] 1164 	ld	b,#0x00
   6A95 59            [ 4] 1165 	ld	e, c
   6A96 50            [ 4] 1166 	ld	d, b
   6A97 13            [ 6] 1167 	inc	de
   6A98 13            [ 6] 1168 	inc	de
   6A99 DD 6E FC      [19] 1169 	ld	l,-4 (ix)
   6A9C DD 66 FD      [19] 1170 	ld	h,-3 (ix)
   6A9F 6E            [ 7] 1171 	ld	l,(hl)
   6AA0 26 00         [ 7] 1172 	ld	h,#0x00
   6AA2 7B            [ 4] 1173 	ld	a,e
   6AA3 95            [ 4] 1174 	sub	a, l
   6AA4 7A            [ 4] 1175 	ld	a,d
   6AA5 9C            [ 4] 1176 	sbc	a, h
   6AA6 E2 AB 6A      [10] 1177 	jp	PO, 00213$
   6AA9 EE 80         [ 7] 1178 	xor	a, #0x80
   6AAB                    1179 00213$:
   6AAB FA 54 6B      [10] 1180 	jp	M,00134$
   6AAE 11 04 00      [10] 1181 	ld	de,#0x0004
   6AB1 19            [11] 1182 	add	hl,de
   6AB2 7D            [ 4] 1183 	ld	a,l
   6AB3 91            [ 4] 1184 	sub	a, c
   6AB4 7C            [ 4] 1185 	ld	a,h
   6AB5 98            [ 4] 1186 	sbc	a, b
   6AB6 E2 BB 6A      [10] 1187 	jp	PO, 00214$
   6AB9 EE 80         [ 7] 1188 	xor	a, #0x80
   6ABB                    1189 00214$:
   6ABB FA 54 6B      [10] 1190 	jp	M,00134$
                           1191 ;src/main.c:257: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6ABE 21 2E 64      [10] 1192 	ld	hl, #(_cu + 0x0001) + 0
   6AC1 4E            [ 7] 1193 	ld	c,(hl)
   6AC2 E1            [10] 1194 	pop	hl
   6AC3 E5            [11] 1195 	push	hl
   6AC4 5E            [ 7] 1196 	ld	e,(hl)
   6AC5 16 00         [ 7] 1197 	ld	d,#0x00
   6AC7 21 16 00      [10] 1198 	ld	hl,#0x0016
   6ACA 19            [11] 1199 	add	hl,de
   6ACB EB            [ 4] 1200 	ex	de,hl
   6ACC 69            [ 4] 1201 	ld	l,c
   6ACD 26 00         [ 7] 1202 	ld	h,#0x00
   6ACF 7B            [ 4] 1203 	ld	a,e
   6AD0 95            [ 4] 1204 	sub	a, l
   6AD1 7A            [ 4] 1205 	ld	a,d
   6AD2 9C            [ 4] 1206 	sbc	a, h
   6AD3 E2 D8 6A      [10] 1207 	jp	PO, 00215$
   6AD6 EE 80         [ 7] 1208 	xor	a, #0x80
   6AD8                    1209 00215$:
   6AD8 F2 54 6B      [10] 1210 	jp	P,00134$
                           1211 ;src/main.c:258: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6ADB BF            [ 4] 1212 	cp	a, a
   6ADC ED 52         [15] 1213 	sbc	hl, de
   6ADE 3E 02         [ 7] 1214 	ld	a,#0x02
   6AE0 BD            [ 4] 1215 	cp	a, l
   6AE1 3E 00         [ 7] 1216 	ld	a,#0x00
   6AE3 9C            [ 4] 1217 	sbc	a, h
   6AE4 E2 E9 6A      [10] 1218 	jp	PO, 00216$
   6AE7 EE 80         [ 7] 1219 	xor	a, #0x80
   6AE9                    1220 00216$:
   6AE9 FA 54 6B      [10] 1221 	jp	M,00134$
                           1222 ;src/main.c:259: enemy->muerto = SI;
   6AEC DD 6E FE      [19] 1223 	ld	l,-2 (ix)
   6AEF DD 66 FF      [19] 1224 	ld	h,-1 (ix)
   6AF2 36 01         [10] 1225 	ld	(hl),#0x01
                           1226 ;src/main.c:263: break;
   6AF4 18 5E         [12] 1227 	jr	00134$
                           1228 ;src/main.c:264: case 3:
   6AF6                    1229 00125$:
                           1230 ;src/main.c:265: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6AF6 21 2D 64      [10] 1231 	ld	hl, #_cu + 0
   6AF9 4E            [ 7] 1232 	ld	c,(hl)
   6AFA 06 00         [ 7] 1233 	ld	b,#0x00
   6AFC 59            [ 4] 1234 	ld	e, c
   6AFD 50            [ 4] 1235 	ld	d, b
   6AFE 13            [ 6] 1236 	inc	de
   6AFF 13            [ 6] 1237 	inc	de
   6B00 DD 6E FC      [19] 1238 	ld	l,-4 (ix)
   6B03 DD 66 FD      [19] 1239 	ld	h,-3 (ix)
   6B06 6E            [ 7] 1240 	ld	l,(hl)
   6B07 26 00         [ 7] 1241 	ld	h,#0x00
   6B09 7B            [ 4] 1242 	ld	a,e
   6B0A 95            [ 4] 1243 	sub	a, l
   6B0B 7A            [ 4] 1244 	ld	a,d
   6B0C 9C            [ 4] 1245 	sbc	a, h
   6B0D E2 12 6B      [10] 1246 	jp	PO, 00217$
   6B10 EE 80         [ 7] 1247 	xor	a, #0x80
   6B12                    1248 00217$:
   6B12 FA 54 6B      [10] 1249 	jp	M,00134$
   6B15 11 04 00      [10] 1250 	ld	de,#0x0004
   6B18 19            [11] 1251 	add	hl,de
   6B19 7D            [ 4] 1252 	ld	a,l
   6B1A 91            [ 4] 1253 	sub	a, c
   6B1B 7C            [ 4] 1254 	ld	a,h
   6B1C 98            [ 4] 1255 	sbc	a, b
   6B1D E2 22 6B      [10] 1256 	jp	PO, 00218$
   6B20 EE 80         [ 7] 1257 	xor	a, #0x80
   6B22                    1258 00218$:
   6B22 FA 54 6B      [10] 1259 	jp	M,00134$
                           1260 ;src/main.c:266: if(enemy->y>cu.y){
   6B25 E1            [10] 1261 	pop	hl
   6B26 E5            [11] 1262 	push	hl
   6B27 4E            [ 7] 1263 	ld	c,(hl)
   6B28 21 2E 64      [10] 1264 	ld	hl, #(_cu + 0x0001) + 0
   6B2B 5E            [ 7] 1265 	ld	e,(hl)
   6B2C 7B            [ 4] 1266 	ld	a,e
   6B2D 91            [ 4] 1267 	sub	a, c
   6B2E 30 24         [12] 1268 	jr	NC,00134$
                           1269 ;src/main.c:267: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6B30 06 00         [ 7] 1270 	ld	b,#0x00
   6B32 16 00         [ 7] 1271 	ld	d,#0x00
   6B34 21 08 00      [10] 1272 	ld	hl,#0x0008
   6B37 19            [11] 1273 	add	hl,de
   6B38 79            [ 4] 1274 	ld	a,c
   6B39 95            [ 4] 1275 	sub	a, l
   6B3A 4F            [ 4] 1276 	ld	c,a
   6B3B 78            [ 4] 1277 	ld	a,b
   6B3C 9C            [ 4] 1278 	sbc	a, h
   6B3D 47            [ 4] 1279 	ld	b,a
   6B3E 3E 02         [ 7] 1280 	ld	a,#0x02
   6B40 B9            [ 4] 1281 	cp	a, c
   6B41 3E 00         [ 7] 1282 	ld	a,#0x00
   6B43 98            [ 4] 1283 	sbc	a, b
   6B44 E2 49 6B      [10] 1284 	jp	PO, 00219$
   6B47 EE 80         [ 7] 1285 	xor	a, #0x80
   6B49                    1286 00219$:
   6B49 FA 54 6B      [10] 1287 	jp	M,00134$
                           1288 ;src/main.c:268: enemy->muerto = SI;
   6B4C DD 6E FE      [19] 1289 	ld	l,-2 (ix)
   6B4F DD 66 FF      [19] 1290 	ld	h,-1 (ix)
   6B52 36 01         [10] 1291 	ld	(hl),#0x01
                           1292 ;src/main.c:273: }
   6B54                    1293 00134$:
   6B54 DD F9         [10] 1294 	ld	sp, ix
   6B56 DD E1         [14] 1295 	pop	ix
   6B58 C9            [10] 1296 	ret
                           1297 ;src/main.c:276: void moverEnemigoArriba(TEnemy *enemy){
                           1298 ;	---------------------------------
                           1299 ; Function moverEnemigoArriba
                           1300 ; ---------------------------------
   6B59                    1301 _moverEnemigoArriba::
   6B59 DD E5         [15] 1302 	push	ix
   6B5B DD 21 00 00   [14] 1303 	ld	ix,#0
   6B5F DD 39         [15] 1304 	add	ix,sp
                           1305 ;src/main.c:277: enemy->y--;
   6B61 DD 4E 04      [19] 1306 	ld	c,4 (ix)
   6B64 DD 46 05      [19] 1307 	ld	b,5 (ix)
   6B67 69            [ 4] 1308 	ld	l, c
   6B68 60            [ 4] 1309 	ld	h, b
   6B69 23            [ 6] 1310 	inc	hl
   6B6A 5E            [ 7] 1311 	ld	e,(hl)
   6B6B 1D            [ 4] 1312 	dec	e
   6B6C 73            [ 7] 1313 	ld	(hl),e
                           1314 ;src/main.c:278: enemy->y--;
   6B6D 1D            [ 4] 1315 	dec	e
   6B6E 73            [ 7] 1316 	ld	(hl),e
                           1317 ;src/main.c:279: enemy->mover = SI;
   6B6F 21 06 00      [10] 1318 	ld	hl,#0x0006
   6B72 09            [11] 1319 	add	hl,bc
   6B73 36 01         [10] 1320 	ld	(hl),#0x01
   6B75 DD E1         [14] 1321 	pop	ix
   6B77 C9            [10] 1322 	ret
                           1323 ;src/main.c:282: void moverEnemigoAbajo(TEnemy *enemy){
                           1324 ;	---------------------------------
                           1325 ; Function moverEnemigoAbajo
                           1326 ; ---------------------------------
   6B78                    1327 _moverEnemigoAbajo::
   6B78 DD E5         [15] 1328 	push	ix
   6B7A DD 21 00 00   [14] 1329 	ld	ix,#0
   6B7E DD 39         [15] 1330 	add	ix,sp
                           1331 ;src/main.c:283: enemy->y++;
   6B80 DD 4E 04      [19] 1332 	ld	c,4 (ix)
   6B83 DD 46 05      [19] 1333 	ld	b,5 (ix)
   6B86 59            [ 4] 1334 	ld	e, c
   6B87 50            [ 4] 1335 	ld	d, b
   6B88 13            [ 6] 1336 	inc	de
   6B89 1A            [ 7] 1337 	ld	a,(de)
   6B8A 3C            [ 4] 1338 	inc	a
   6B8B 12            [ 7] 1339 	ld	(de),a
                           1340 ;src/main.c:284: enemy->y++;
   6B8C 3C            [ 4] 1341 	inc	a
   6B8D 12            [ 7] 1342 	ld	(de),a
                           1343 ;src/main.c:285: enemy->mover = SI;
   6B8E 21 06 00      [10] 1344 	ld	hl,#0x0006
   6B91 09            [11] 1345 	add	hl,bc
   6B92 36 01         [10] 1346 	ld	(hl),#0x01
   6B94 DD E1         [14] 1347 	pop	ix
   6B96 C9            [10] 1348 	ret
                           1349 ;src/main.c:288: void moverEnemigoDerecha(TEnemy *enemy){
                           1350 ;	---------------------------------
                           1351 ; Function moverEnemigoDerecha
                           1352 ; ---------------------------------
   6B97                    1353 _moverEnemigoDerecha::
                           1354 ;src/main.c:289: enemy->x++;
   6B97 D1            [10] 1355 	pop	de
   6B98 C1            [10] 1356 	pop	bc
   6B99 C5            [11] 1357 	push	bc
   6B9A D5            [11] 1358 	push	de
   6B9B 0A            [ 7] 1359 	ld	a,(bc)
   6B9C 3C            [ 4] 1360 	inc	a
   6B9D 02            [ 7] 1361 	ld	(bc),a
                           1362 ;src/main.c:290: enemy->x++;
   6B9E 3C            [ 4] 1363 	inc	a
   6B9F 02            [ 7] 1364 	ld	(bc),a
                           1365 ;src/main.c:291: enemy->mover = SI;
   6BA0 21 06 00      [10] 1366 	ld	hl,#0x0006
   6BA3 09            [11] 1367 	add	hl,bc
   6BA4 36 01         [10] 1368 	ld	(hl),#0x01
   6BA6 C9            [10] 1369 	ret
                           1370 ;src/main.c:294: void moverEnemigoIzquierda(TEnemy *enemy){
                           1371 ;	---------------------------------
                           1372 ; Function moverEnemigoIzquierda
                           1373 ; ---------------------------------
   6BA7                    1374 _moverEnemigoIzquierda::
                           1375 ;src/main.c:295: enemy->x--;
   6BA7 D1            [10] 1376 	pop	de
   6BA8 C1            [10] 1377 	pop	bc
   6BA9 C5            [11] 1378 	push	bc
   6BAA D5            [11] 1379 	push	de
   6BAB 0A            [ 7] 1380 	ld	a,(bc)
   6BAC C6 FF         [ 7] 1381 	add	a,#0xFF
   6BAE 02            [ 7] 1382 	ld	(bc),a
                           1383 ;src/main.c:296: enemy->x--;
   6BAF C6 FF         [ 7] 1384 	add	a,#0xFF
   6BB1 02            [ 7] 1385 	ld	(bc),a
                           1386 ;src/main.c:297: enemy->mover = SI;
   6BB2 21 06 00      [10] 1387 	ld	hl,#0x0006
   6BB5 09            [11] 1388 	add	hl,bc
   6BB6 36 01         [10] 1389 	ld	(hl),#0x01
   6BB8 C9            [10] 1390 	ret
                           1391 ;src/main.c:300: void moverEnemigoPatrol(TEnemy* enemy){
                           1392 ;	---------------------------------
                           1393 ; Function moverEnemigoPatrol
                           1394 ; ---------------------------------
   6BB9                    1395 _moverEnemigoPatrol::
   6BB9 DD E5         [15] 1396 	push	ix
   6BBB DD 21 00 00   [14] 1397 	ld	ix,#0
   6BBF DD 39         [15] 1398 	add	ix,sp
   6BC1 21 F3 FF      [10] 1399 	ld	hl,#-13
   6BC4 39            [11] 1400 	add	hl,sp
   6BC5 F9            [ 6] 1401 	ld	sp,hl
                           1402 ;src/main.c:302: if(!enemy->muerto){
   6BC6 DD 4E 04      [19] 1403 	ld	c,4 (ix)
   6BC9 DD 46 05      [19] 1404 	ld	b,5 (ix)
   6BCC C5            [11] 1405 	push	bc
   6BCD FD E1         [14] 1406 	pop	iy
   6BCF FD 7E 08      [19] 1407 	ld	a,8 (iy)
   6BD2 B7            [ 4] 1408 	or	a, a
   6BD3 C2 01 6E      [10] 1409 	jp	NZ,00118$
                           1410 ;src/main.c:303: if (!enemy->reversePatrol) {
   6BD6 21 0B 00      [10] 1411 	ld	hl,#0x000B
   6BD9 09            [11] 1412 	add	hl,bc
   6BDA E3            [19] 1413 	ex	(sp), hl
   6BDB E1            [10] 1414 	pop	hl
   6BDC E5            [11] 1415 	push	hl
   6BDD 7E            [ 7] 1416 	ld	a,(hl)
   6BDE DD 77 FF      [19] 1417 	ld	-1 (ix),a
                           1418 ;src/main.c:304: if(enemy->iter < enemy->longitud_camino){
   6BE1 21 0D 00      [10] 1419 	ld	hl,#0x000D
   6BE4 09            [11] 1420 	add	hl,bc
   6BE5 DD 75 FD      [19] 1421 	ld	-3 (ix),l
   6BE8 DD 74 FE      [19] 1422 	ld	-2 (ix),h
   6BEB DD 6E FD      [19] 1423 	ld	l,-3 (ix)
   6BEE DD 66 FE      [19] 1424 	ld	h,-2 (ix)
   6BF1 5E            [ 7] 1425 	ld	e,(hl)
   6BF2 23            [ 6] 1426 	inc	hl
   6BF3 56            [ 7] 1427 	ld	d,(hl)
   6BF4 21 E1 00      [10] 1428 	ld	hl,#0x00E1
   6BF7 09            [11] 1429 	add	hl,bc
   6BF8 DD 75 FB      [19] 1430 	ld	-5 (ix),l
   6BFB DD 74 FC      [19] 1431 	ld	-4 (ix),h
                           1432 ;src/main.c:306: enemy->mover = SI;
   6BFE 21 06 00      [10] 1433 	ld	hl,#0x0006
   6C01 09            [11] 1434 	add	hl,bc
   6C02 DD 75 F9      [19] 1435 	ld	-7 (ix),l
   6C05 DD 74 FA      [19] 1436 	ld	-6 (ix),h
                           1437 ;src/main.c:308: enemy->x = enemy->camino[enemy->iter];
   6C08 21 19 00      [10] 1438 	ld	hl,#0x0019
   6C0B 09            [11] 1439 	add	hl,bc
   6C0C DD 75 F7      [19] 1440 	ld	-9 (ix),l
   6C0F DD 74 F8      [19] 1441 	ld	-8 (ix),h
                           1442 ;src/main.c:310: enemy->y = enemy->camino[enemy->iter];
   6C12 21 01 00      [10] 1443 	ld	hl,#0x0001
   6C15 09            [11] 1444 	add	hl,bc
   6C16 DD 75 F5      [19] 1445 	ld	-11 (ix),l
   6C19 DD 74 F6      [19] 1446 	ld	-10 (ix),h
                           1447 ;src/main.c:303: if (!enemy->reversePatrol) {
   6C1C DD 7E FF      [19] 1448 	ld	a,-1 (ix)
   6C1F B7            [ 4] 1449 	or	a, a
   6C20 C2 FB 6C      [10] 1450 	jp	NZ,00114$
                           1451 ;src/main.c:304: if(enemy->iter < enemy->longitud_camino){
   6C23 DD 6E FB      [19] 1452 	ld	l,-5 (ix)
   6C26 DD 66 FC      [19] 1453 	ld	h,-4 (ix)
   6C29 6E            [ 7] 1454 	ld	l,(hl)
   6C2A 26 00         [ 7] 1455 	ld	h,#0x00
   6C2C 7B            [ 4] 1456 	ld	a,e
   6C2D 95            [ 4] 1457 	sub	a, l
   6C2E 7A            [ 4] 1458 	ld	a,d
   6C2F 9C            [ 4] 1459 	sbc	a, h
   6C30 E2 35 6C      [10] 1460 	jp	PO, 00144$
   6C33 EE 80         [ 7] 1461 	xor	a, #0x80
   6C35                    1462 00144$:
   6C35 F2 DA 6C      [10] 1463 	jp	P,00105$
                           1464 ;src/main.c:305: if(enemy->iter == 0){
   6C38 7A            [ 4] 1465 	ld	a,d
   6C39 B3            [ 4] 1466 	or	a,e
   6C3A 20 54         [12] 1467 	jr	NZ,00102$
                           1468 ;src/main.c:306: enemy->mover = SI;
   6C3C DD 6E F9      [19] 1469 	ld	l,-7 (ix)
   6C3F DD 66 FA      [19] 1470 	ld	h,-6 (ix)
   6C42 36 01         [10] 1471 	ld	(hl),#0x01
                           1472 ;src/main.c:307: enemy->iter = 2;
   6C44 DD 6E FD      [19] 1473 	ld	l,-3 (ix)
   6C47 DD 66 FE      [19] 1474 	ld	h,-2 (ix)
   6C4A 36 02         [10] 1475 	ld	(hl),#0x02
   6C4C 23            [ 6] 1476 	inc	hl
   6C4D 36 00         [10] 1477 	ld	(hl),#0x00
                           1478 ;src/main.c:308: enemy->x = enemy->camino[enemy->iter];
   6C4F DD 6E FD      [19] 1479 	ld	l,-3 (ix)
   6C52 DD 66 FE      [19] 1480 	ld	h,-2 (ix)
   6C55 5E            [ 7] 1481 	ld	e,(hl)
   6C56 23            [ 6] 1482 	inc	hl
   6C57 56            [ 7] 1483 	ld	d,(hl)
   6C58 DD 6E F7      [19] 1484 	ld	l,-9 (ix)
   6C5B DD 66 F8      [19] 1485 	ld	h,-8 (ix)
   6C5E 19            [11] 1486 	add	hl,de
   6C5F 7E            [ 7] 1487 	ld	a,(hl)
   6C60 02            [ 7] 1488 	ld	(bc),a
                           1489 ;src/main.c:309: ++enemy->iter;
   6C61 DD 6E FD      [19] 1490 	ld	l,-3 (ix)
   6C64 DD 66 FE      [19] 1491 	ld	h,-2 (ix)
   6C67 4E            [ 7] 1492 	ld	c,(hl)
   6C68 23            [ 6] 1493 	inc	hl
   6C69 46            [ 7] 1494 	ld	b,(hl)
   6C6A 03            [ 6] 1495 	inc	bc
   6C6B DD 6E FD      [19] 1496 	ld	l,-3 (ix)
   6C6E DD 66 FE      [19] 1497 	ld	h,-2 (ix)
   6C71 71            [ 7] 1498 	ld	(hl),c
   6C72 23            [ 6] 1499 	inc	hl
   6C73 70            [ 7] 1500 	ld	(hl),b
                           1501 ;src/main.c:310: enemy->y = enemy->camino[enemy->iter];
   6C74 DD 6E F7      [19] 1502 	ld	l,-9 (ix)
   6C77 DD 66 F8      [19] 1503 	ld	h,-8 (ix)
   6C7A 09            [11] 1504 	add	hl,bc
   6C7B 5E            [ 7] 1505 	ld	e,(hl)
   6C7C DD 6E F5      [19] 1506 	ld	l,-11 (ix)
   6C7F DD 66 F6      [19] 1507 	ld	h,-10 (ix)
   6C82 73            [ 7] 1508 	ld	(hl),e
                           1509 ;src/main.c:311: ++enemy->iter;
   6C83 03            [ 6] 1510 	inc	bc
   6C84 DD 6E FD      [19] 1511 	ld	l,-3 (ix)
   6C87 DD 66 FE      [19] 1512 	ld	h,-2 (ix)
   6C8A 71            [ 7] 1513 	ld	(hl),c
   6C8B 23            [ 6] 1514 	inc	hl
   6C8C 70            [ 7] 1515 	ld	(hl),b
   6C8D C3 01 6E      [10] 1516 	jp	00118$
   6C90                    1517 00102$:
                           1518 ;src/main.c:313: enemy->mover = SI;
   6C90 DD 6E F9      [19] 1519 	ld	l,-7 (ix)
   6C93 DD 66 FA      [19] 1520 	ld	h,-6 (ix)
   6C96 36 01         [10] 1521 	ld	(hl),#0x01
                           1522 ;src/main.c:314: enemy->x = enemy->camino[enemy->iter];
   6C98 DD 6E FD      [19] 1523 	ld	l,-3 (ix)
   6C9B DD 66 FE      [19] 1524 	ld	h,-2 (ix)
   6C9E 5E            [ 7] 1525 	ld	e,(hl)
   6C9F 23            [ 6] 1526 	inc	hl
   6CA0 56            [ 7] 1527 	ld	d,(hl)
   6CA1 DD 6E F7      [19] 1528 	ld	l,-9 (ix)
   6CA4 DD 66 F8      [19] 1529 	ld	h,-8 (ix)
   6CA7 19            [11] 1530 	add	hl,de
   6CA8 7E            [ 7] 1531 	ld	a,(hl)
   6CA9 02            [ 7] 1532 	ld	(bc),a
                           1533 ;src/main.c:315: ++enemy->iter;
   6CAA DD 6E FD      [19] 1534 	ld	l,-3 (ix)
   6CAD DD 66 FE      [19] 1535 	ld	h,-2 (ix)
   6CB0 5E            [ 7] 1536 	ld	e,(hl)
   6CB1 23            [ 6] 1537 	inc	hl
   6CB2 56            [ 7] 1538 	ld	d,(hl)
   6CB3 13            [ 6] 1539 	inc	de
   6CB4 DD 6E FD      [19] 1540 	ld	l,-3 (ix)
   6CB7 DD 66 FE      [19] 1541 	ld	h,-2 (ix)
   6CBA 73            [ 7] 1542 	ld	(hl),e
   6CBB 23            [ 6] 1543 	inc	hl
   6CBC 72            [ 7] 1544 	ld	(hl),d
                           1545 ;src/main.c:316: enemy->y = enemy->camino[enemy->iter];
   6CBD DD 6E F7      [19] 1546 	ld	l,-9 (ix)
   6CC0 DD 66 F8      [19] 1547 	ld	h,-8 (ix)
   6CC3 19            [11] 1548 	add	hl,de
   6CC4 7E            [ 7] 1549 	ld	a,(hl)
   6CC5 DD 6E F5      [19] 1550 	ld	l,-11 (ix)
   6CC8 DD 66 F6      [19] 1551 	ld	h,-10 (ix)
   6CCB 77            [ 7] 1552 	ld	(hl),a
                           1553 ;src/main.c:317: ++enemy->iter;
   6CCC 13            [ 6] 1554 	inc	de
   6CCD 4B            [ 4] 1555 	ld	c,e
   6CCE DD 6E FD      [19] 1556 	ld	l,-3 (ix)
   6CD1 DD 66 FE      [19] 1557 	ld	h,-2 (ix)
   6CD4 71            [ 7] 1558 	ld	(hl),c
   6CD5 23            [ 6] 1559 	inc	hl
   6CD6 72            [ 7] 1560 	ld	(hl),d
   6CD7 C3 01 6E      [10] 1561 	jp	00118$
   6CDA                    1562 00105$:
                           1563 ;src/main.c:321: enemy->mover = NO;
   6CDA DD 6E F9      [19] 1564 	ld	l,-7 (ix)
   6CDD DD 66 FA      [19] 1565 	ld	h,-6 (ix)
   6CE0 36 00         [10] 1566 	ld	(hl),#0x00
                           1567 ;src/main.c:322: enemy->iter = enemy->longitud_camino;
   6CE2 DD 6E FB      [19] 1568 	ld	l,-5 (ix)
   6CE5 DD 66 FC      [19] 1569 	ld	h,-4 (ix)
   6CE8 4E            [ 7] 1570 	ld	c,(hl)
   6CE9 06 00         [ 7] 1571 	ld	b,#0x00
   6CEB DD 6E FD      [19] 1572 	ld	l,-3 (ix)
   6CEE DD 66 FE      [19] 1573 	ld	h,-2 (ix)
   6CF1 71            [ 7] 1574 	ld	(hl),c
   6CF2 23            [ 6] 1575 	inc	hl
   6CF3 70            [ 7] 1576 	ld	(hl),b
                           1577 ;src/main.c:323: enemy->reversePatrol = 1;
   6CF4 E1            [10] 1578 	pop	hl
   6CF5 E5            [11] 1579 	push	hl
   6CF6 36 01         [10] 1580 	ld	(hl),#0x01
   6CF8 C3 01 6E      [10] 1581 	jp	00118$
   6CFB                    1582 00114$:
                           1583 ;src/main.c:326: if(enemy->iter > 0){
   6CFB AF            [ 4] 1584 	xor	a, a
   6CFC BB            [ 4] 1585 	cp	a, e
   6CFD 9A            [ 4] 1586 	sbc	a, d
   6CFE E2 03 6D      [10] 1587 	jp	PO, 00145$
   6D01 EE 80         [ 7] 1588 	xor	a, #0x80
   6D03                    1589 00145$:
   6D03 F2 EB 6D      [10] 1590 	jp	P,00111$
                           1591 ;src/main.c:327: if(enemy->iter == enemy->longitud_camino){
   6D06 DD 6E FB      [19] 1592 	ld	l,-5 (ix)
   6D09 DD 66 FC      [19] 1593 	ld	h,-4 (ix)
   6D0C 6E            [ 7] 1594 	ld	l,(hl)
   6D0D DD 75 FB      [19] 1595 	ld	-5 (ix),l
   6D10 DD 36 FC 00   [19] 1596 	ld	-4 (ix),#0x00
   6D14 7B            [ 4] 1597 	ld	a,e
   6D15 DD 96 FB      [19] 1598 	sub	a, -5 (ix)
   6D18 C2 A3 6D      [10] 1599 	jp	NZ,00108$
   6D1B 7A            [ 4] 1600 	ld	a,d
   6D1C DD 96 FC      [19] 1601 	sub	a, -4 (ix)
   6D1F C2 A3 6D      [10] 1602 	jp	NZ,00108$
                           1603 ;src/main.c:328: enemy->mover = SI;
   6D22 DD 6E F9      [19] 1604 	ld	l,-7 (ix)
   6D25 DD 66 FA      [19] 1605 	ld	h,-6 (ix)
   6D28 36 01         [10] 1606 	ld	(hl),#0x01
                           1607 ;src/main.c:329: enemy->iter = enemy->iter - 1;
   6D2A DD 6E FD      [19] 1608 	ld	l,-3 (ix)
   6D2D DD 66 FE      [19] 1609 	ld	h,-2 (ix)
   6D30 5E            [ 7] 1610 	ld	e,(hl)
   6D31 23            [ 6] 1611 	inc	hl
   6D32 56            [ 7] 1612 	ld	d,(hl)
   6D33 7B            [ 4] 1613 	ld	a,e
   6D34 C6 FF         [ 7] 1614 	add	a,#0xFF
   6D36 DD 77 FB      [19] 1615 	ld	-5 (ix),a
   6D39 7A            [ 4] 1616 	ld	a,d
   6D3A CE FF         [ 7] 1617 	adc	a,#0xFF
   6D3C DD 77 FC      [19] 1618 	ld	-4 (ix),a
   6D3F DD 6E FD      [19] 1619 	ld	l,-3 (ix)
   6D42 DD 66 FE      [19] 1620 	ld	h,-2 (ix)
   6D45 DD 7E FB      [19] 1621 	ld	a,-5 (ix)
   6D48 77            [ 7] 1622 	ld	(hl),a
   6D49 23            [ 6] 1623 	inc	hl
   6D4A DD 7E FC      [19] 1624 	ld	a,-4 (ix)
   6D4D 77            [ 7] 1625 	ld	(hl),a
                           1626 ;src/main.c:330: enemy->iter = enemy->iter - 2;
   6D4E DD 5E FB      [19] 1627 	ld	e,-5 (ix)
   6D51 DD 56 FC      [19] 1628 	ld	d,-4 (ix)
   6D54 1B            [ 6] 1629 	dec	de
   6D55 1B            [ 6] 1630 	dec	de
   6D56 DD 6E FD      [19] 1631 	ld	l,-3 (ix)
   6D59 DD 66 FE      [19] 1632 	ld	h,-2 (ix)
   6D5C 73            [ 7] 1633 	ld	(hl),e
   6D5D 23            [ 6] 1634 	inc	hl
   6D5E 72            [ 7] 1635 	ld	(hl),d
                           1636 ;src/main.c:331: enemy->y = enemy->camino[enemy->iter];
   6D5F DD 6E F7      [19] 1637 	ld	l,-9 (ix)
   6D62 DD 66 F8      [19] 1638 	ld	h,-8 (ix)
   6D65 19            [11] 1639 	add	hl,de
   6D66 5E            [ 7] 1640 	ld	e,(hl)
   6D67 DD 6E F5      [19] 1641 	ld	l,-11 (ix)
   6D6A DD 66 F6      [19] 1642 	ld	h,-10 (ix)
   6D6D 73            [ 7] 1643 	ld	(hl),e
                           1644 ;src/main.c:332: --enemy->iter;
   6D6E DD 7E FB      [19] 1645 	ld	a,-5 (ix)
   6D71 C6 FD         [ 7] 1646 	add	a,#0xFD
   6D73 5F            [ 4] 1647 	ld	e,a
   6D74 DD 7E FC      [19] 1648 	ld	a,-4 (ix)
   6D77 CE FF         [ 7] 1649 	adc	a,#0xFF
   6D79 57            [ 4] 1650 	ld	d,a
   6D7A DD 6E FD      [19] 1651 	ld	l,-3 (ix)
   6D7D DD 66 FE      [19] 1652 	ld	h,-2 (ix)
   6D80 73            [ 7] 1653 	ld	(hl),e
   6D81 23            [ 6] 1654 	inc	hl
   6D82 72            [ 7] 1655 	ld	(hl),d
                           1656 ;src/main.c:333: enemy->x = enemy->camino[enemy->iter];
   6D83 DD 6E F7      [19] 1657 	ld	l,-9 (ix)
   6D86 DD 66 F8      [19] 1658 	ld	h,-8 (ix)
   6D89 19            [11] 1659 	add	hl,de
   6D8A 7E            [ 7] 1660 	ld	a,(hl)
   6D8B 02            [ 7] 1661 	ld	(bc),a
                           1662 ;src/main.c:334: --enemy->iter;
   6D8C DD 7E FB      [19] 1663 	ld	a,-5 (ix)
   6D8F C6 FC         [ 7] 1664 	add	a,#0xFC
   6D91 4F            [ 4] 1665 	ld	c,a
   6D92 DD 7E FC      [19] 1666 	ld	a,-4 (ix)
   6D95 CE FF         [ 7] 1667 	adc	a,#0xFF
   6D97 47            [ 4] 1668 	ld	b,a
   6D98 DD 6E FD      [19] 1669 	ld	l,-3 (ix)
   6D9B DD 66 FE      [19] 1670 	ld	h,-2 (ix)
   6D9E 71            [ 7] 1671 	ld	(hl),c
   6D9F 23            [ 6] 1672 	inc	hl
   6DA0 70            [ 7] 1673 	ld	(hl),b
   6DA1 18 5E         [12] 1674 	jr	00118$
   6DA3                    1675 00108$:
                           1676 ;src/main.c:336: enemy->mover = SI;
   6DA3 DD 6E F9      [19] 1677 	ld	l,-7 (ix)
   6DA6 DD 66 FA      [19] 1678 	ld	h,-6 (ix)
   6DA9 36 01         [10] 1679 	ld	(hl),#0x01
                           1680 ;src/main.c:337: enemy->y = enemy->camino[enemy->iter];
   6DAB DD 6E FD      [19] 1681 	ld	l,-3 (ix)
   6DAE DD 66 FE      [19] 1682 	ld	h,-2 (ix)
   6DB1 5E            [ 7] 1683 	ld	e,(hl)
   6DB2 23            [ 6] 1684 	inc	hl
   6DB3 56            [ 7] 1685 	ld	d,(hl)
   6DB4 DD 6E F7      [19] 1686 	ld	l,-9 (ix)
   6DB7 DD 66 F8      [19] 1687 	ld	h,-8 (ix)
   6DBA 19            [11] 1688 	add	hl,de
   6DBB 5E            [ 7] 1689 	ld	e,(hl)
   6DBC DD 6E F5      [19] 1690 	ld	l,-11 (ix)
   6DBF DD 66 F6      [19] 1691 	ld	h,-10 (ix)
   6DC2 73            [ 7] 1692 	ld	(hl),e
                           1693 ;src/main.c:338: --enemy->iter;
   6DC3 DD 6E FD      [19] 1694 	ld	l,-3 (ix)
   6DC6 DD 66 FE      [19] 1695 	ld	h,-2 (ix)
   6DC9 5E            [ 7] 1696 	ld	e,(hl)
   6DCA 23            [ 6] 1697 	inc	hl
   6DCB 56            [ 7] 1698 	ld	d,(hl)
   6DCC 1B            [ 6] 1699 	dec	de
   6DCD DD 6E FD      [19] 1700 	ld	l,-3 (ix)
   6DD0 DD 66 FE      [19] 1701 	ld	h,-2 (ix)
   6DD3 73            [ 7] 1702 	ld	(hl),e
   6DD4 23            [ 6] 1703 	inc	hl
   6DD5 72            [ 7] 1704 	ld	(hl),d
                           1705 ;src/main.c:339: enemy->x = enemy->camino[enemy->iter];
   6DD6 DD 6E F7      [19] 1706 	ld	l,-9 (ix)
   6DD9 DD 66 F8      [19] 1707 	ld	h,-8 (ix)
   6DDC 19            [11] 1708 	add	hl,de
   6DDD 7E            [ 7] 1709 	ld	a,(hl)
   6DDE 02            [ 7] 1710 	ld	(bc),a
                           1711 ;src/main.c:340: --enemy->iter;
   6DDF 1B            [ 6] 1712 	dec	de
   6DE0 DD 6E FD      [19] 1713 	ld	l,-3 (ix)
   6DE3 DD 66 FE      [19] 1714 	ld	h,-2 (ix)
   6DE6 73            [ 7] 1715 	ld	(hl),e
   6DE7 23            [ 6] 1716 	inc	hl
   6DE8 72            [ 7] 1717 	ld	(hl),d
   6DE9 18 16         [12] 1718 	jr	00118$
   6DEB                    1719 00111$:
                           1720 ;src/main.c:344: enemy->mover = NO;
   6DEB DD 6E F9      [19] 1721 	ld	l,-7 (ix)
   6DEE DD 66 FA      [19] 1722 	ld	h,-6 (ix)
   6DF1 36 00         [10] 1723 	ld	(hl),#0x00
                           1724 ;src/main.c:345: enemy->iter = 0;
   6DF3 DD 6E FD      [19] 1725 	ld	l,-3 (ix)
   6DF6 DD 66 FE      [19] 1726 	ld	h,-2 (ix)
   6DF9 AF            [ 4] 1727 	xor	a, a
   6DFA 77            [ 7] 1728 	ld	(hl), a
   6DFB 23            [ 6] 1729 	inc	hl
   6DFC 77            [ 7] 1730 	ld	(hl), a
                           1731 ;src/main.c:346: enemy->reversePatrol = 0;
   6DFD E1            [10] 1732 	pop	hl
   6DFE E5            [11] 1733 	push	hl
   6DFF 36 00         [10] 1734 	ld	(hl),#0x00
   6E01                    1735 00118$:
   6E01 DD F9         [10] 1736 	ld	sp, ix
   6E03 DD E1         [14] 1737 	pop	ix
   6E05 C9            [10] 1738 	ret
                           1739 ;src/main.c:352: void lookFor(TEnemy* enemy){
                           1740 ;	---------------------------------
                           1741 ; Function lookFor
                           1742 ; ---------------------------------
   6E06                    1743 _lookFor::
   6E06 DD E5         [15] 1744 	push	ix
   6E08 DD 21 00 00   [14] 1745 	ld	ix,#0
   6E0C DD 39         [15] 1746 	add	ix,sp
   6E0E 21 F9 FF      [10] 1747 	ld	hl,#-7
   6E11 39            [11] 1748 	add	hl,sp
   6E12 F9            [ 6] 1749 	ld	sp,hl
                           1750 ;src/main.c:358: i16 difx = abs((i16)(enemy->x - prota.x));
   6E13 DD 5E 04      [19] 1751 	ld	e,4 (ix)
   6E16 DD 56 05      [19] 1752 	ld	d,5 (ix)
   6E19 1A            [ 7] 1753 	ld	a,(de)
   6E1A 4F            [ 4] 1754 	ld	c,a
   6E1B 06 00         [ 7] 1755 	ld	b,#0x00
   6E1D 21 25 64      [10] 1756 	ld	hl,#_prota+0
   6E20 6E            [ 7] 1757 	ld	l,(hl)
   6E21 26 00         [ 7] 1758 	ld	h,#0x00
   6E23 79            [ 4] 1759 	ld	a,c
   6E24 95            [ 4] 1760 	sub	a, l
   6E25 4F            [ 4] 1761 	ld	c,a
   6E26 78            [ 4] 1762 	ld	a,b
   6E27 9C            [ 4] 1763 	sbc	a, h
   6E28 47            [ 4] 1764 	ld	b,a
   6E29 D5            [11] 1765 	push	de
   6E2A C5            [11] 1766 	push	bc
   6E2B CD A5 4B      [17] 1767 	call	_abs
   6E2E F1            [10] 1768 	pop	af
   6E2F D1            [10] 1769 	pop	de
   6E30 33            [ 6] 1770 	inc	sp
   6E31 33            [ 6] 1771 	inc	sp
   6E32 E5            [11] 1772 	push	hl
                           1773 ;src/main.c:359: i16 dify = abs((i16)(enemy->y - prota.y));
   6E33 21 01 00      [10] 1774 	ld	hl,#0x0001
   6E36 19            [11] 1775 	add	hl,de
   6E37 DD 75 FC      [19] 1776 	ld	-4 (ix),l
   6E3A DD 74 FD      [19] 1777 	ld	-3 (ix),h
   6E3D DD 6E FC      [19] 1778 	ld	l,-4 (ix)
   6E40 DD 66 FD      [19] 1779 	ld	h,-3 (ix)
   6E43 4E            [ 7] 1780 	ld	c,(hl)
   6E44 06 00         [ 7] 1781 	ld	b,#0x00
   6E46 21 26 64      [10] 1782 	ld	hl, #(_prota + 0x0001) + 0
   6E49 6E            [ 7] 1783 	ld	l,(hl)
   6E4A 26 00         [ 7] 1784 	ld	h,#0x00
   6E4C 79            [ 4] 1785 	ld	a,c
   6E4D 95            [ 4] 1786 	sub	a, l
   6E4E 4F            [ 4] 1787 	ld	c,a
   6E4F 78            [ 4] 1788 	ld	a,b
   6E50 9C            [ 4] 1789 	sbc	a, h
   6E51 47            [ 4] 1790 	ld	b,a
   6E52 D5            [11] 1791 	push	de
   6E53 C5            [11] 1792 	push	bc
   6E54 CD A5 4B      [17] 1793 	call	_abs
   6E57 F1            [10] 1794 	pop	af
   6E58 D1            [10] 1795 	pop	de
                           1796 ;src/main.c:361: dist = difx + dify; // manhattan
   6E59 DD 4E F9      [19] 1797 	ld	c,-7 (ix)
   6E5C 09            [11] 1798 	add	hl, bc
   6E5D DD 75 FB      [19] 1799 	ld	-5 (ix),l
                           1800 ;src/main.c:362: enemy->seen = NO;
   6E60 21 11 00      [10] 1801 	ld	hl,#0x0011
   6E63 19            [11] 1802 	add	hl,de
   6E64 DD 75 FE      [19] 1803 	ld	-2 (ix),l
   6E67 DD 74 FF      [19] 1804 	ld	-1 (ix),h
   6E6A DD 6E FE      [19] 1805 	ld	l,-2 (ix)
   6E6D DD 66 FF      [19] 1806 	ld	h,-1 (ix)
   6E70 36 00         [10] 1807 	ld	(hl),#0x00
                           1808 ;src/main.c:363: enemy->in_range = NO;
   6E72 21 10 00      [10] 1809 	ld	hl,#0x0010
   6E75 19            [11] 1810 	add	hl,de
   6E76 4D            [ 4] 1811 	ld	c,l
   6E77 44            [ 4] 1812 	ld	b,h
   6E78 AF            [ 4] 1813 	xor	a, a
   6E79 02            [ 7] 1814 	ld	(bc),a
                           1815 ;src/main.c:365: if(!enemy->seek){
   6E7A D5            [11] 1816 	push	de
   6E7B FD E1         [14] 1817 	pop	iy
   6E7D FD 7E 13      [19] 1818 	ld	a,19 (iy)
   6E80 B7            [ 4] 1819 	or	a, a
   6E81 C2 07 6F      [10] 1820 	jp	NZ,00111$
                           1821 ;src/main.c:366: if (dist <= 10) {// te detectan los sensores de proximidad
   6E84 3E 0A         [ 7] 1822 	ld	a,#0x0A
   6E86 DD 96 FB      [19] 1823 	sub	a, -5 (ix)
   6E89 38 13         [12] 1824 	jr	C,00107$
                           1825 ;src/main.c:367: enemy->in_range = 1;
   6E8B 3E 01         [ 7] 1826 	ld	a,#0x01
   6E8D 02            [ 7] 1827 	ld	(bc),a
                           1828 ;src/main.c:368: enemy->engage = 1;
   6E8E 21 15 00      [10] 1829 	ld	hl,#0x0015
   6E91 19            [11] 1830 	add	hl,de
   6E92 36 01         [10] 1831 	ld	(hl),#0x01
                           1832 ;src/main.c:369: enemy->seen = SI;
   6E94 DD 6E FE      [19] 1833 	ld	l,-2 (ix)
   6E97 DD 66 FF      [19] 1834 	ld	h,-1 (ix)
   6E9A 36 01         [10] 1835 	ld	(hl),#0x01
   6E9C 18 69         [12] 1836 	jr	00111$
   6E9E                    1837 00107$:
                           1838 ;src/main.c:370: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6E9E 21 25 64      [10] 1839 	ld	hl, #_prota + 0
   6EA1 4E            [ 7] 1840 	ld	c,(hl)
   6EA2 1A            [ 7] 1841 	ld	a,(de)
   6EA3 5F            [ 4] 1842 	ld	e,a
   6EA4 16 00         [ 7] 1843 	ld	d,#0x00
   6EA6 7B            [ 4] 1844 	ld	a,e
   6EA7 C6 E7         [ 7] 1845 	add	a,#0xE7
   6EA9 6F            [ 4] 1846 	ld	l,a
   6EAA 7A            [ 4] 1847 	ld	a,d
   6EAB CE FF         [ 7] 1848 	adc	a,#0xFF
   6EAD 67            [ 4] 1849 	ld	h,a
   6EAE 06 00         [ 7] 1850 	ld	b,#0x00
   6EB0 7D            [ 4] 1851 	ld	a,l
   6EB1 91            [ 4] 1852 	sub	a, c
   6EB2 7C            [ 4] 1853 	ld	a,h
   6EB3 98            [ 4] 1854 	sbc	a, b
   6EB4 E2 B9 6E      [10] 1855 	jp	PO, 00137$
   6EB7 EE 80         [ 7] 1856 	xor	a, #0x80
   6EB9                    1857 00137$:
   6EB9 F2 07 6F      [10] 1858 	jp	P,00111$
   6EBC 21 19 00      [10] 1859 	ld	hl,#0x0019
   6EBF 19            [11] 1860 	add	hl,de
   6EC0 79            [ 4] 1861 	ld	a,c
   6EC1 95            [ 4] 1862 	sub	a, l
   6EC2 78            [ 4] 1863 	ld	a,b
   6EC3 9C            [ 4] 1864 	sbc	a, h
   6EC4 E2 C9 6E      [10] 1865 	jp	PO, 00138$
   6EC7 EE 80         [ 7] 1866 	xor	a, #0x80
   6EC9                    1867 00138$:
   6EC9 F2 07 6F      [10] 1868 	jp	P,00111$
                           1869 ;src/main.c:371: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6ECC 21 26 64      [10] 1870 	ld	hl, #(_prota + 0x0001) + 0
   6ECF 4E            [ 7] 1871 	ld	c,(hl)
   6ED0 DD 6E FC      [19] 1872 	ld	l,-4 (ix)
   6ED3 DD 66 FD      [19] 1873 	ld	h,-3 (ix)
   6ED6 5E            [ 7] 1874 	ld	e,(hl)
   6ED7 16 00         [ 7] 1875 	ld	d,#0x00
   6ED9 7B            [ 4] 1876 	ld	a,e
   6EDA C6 CC         [ 7] 1877 	add	a,#0xCC
   6EDC 6F            [ 4] 1878 	ld	l,a
   6EDD 7A            [ 4] 1879 	ld	a,d
   6EDE CE FF         [ 7] 1880 	adc	a,#0xFF
   6EE0 67            [ 4] 1881 	ld	h,a
   6EE1 06 00         [ 7] 1882 	ld	b,#0x00
   6EE3 7D            [ 4] 1883 	ld	a,l
   6EE4 91            [ 4] 1884 	sub	a, c
   6EE5 7C            [ 4] 1885 	ld	a,h
   6EE6 98            [ 4] 1886 	sbc	a, b
   6EE7 E2 EC 6E      [10] 1887 	jp	PO, 00139$
   6EEA EE 80         [ 7] 1888 	xor	a, #0x80
   6EEC                    1889 00139$:
   6EEC F2 07 6F      [10] 1890 	jp	P,00111$
   6EEF 21 34 00      [10] 1891 	ld	hl,#0x0034
   6EF2 19            [11] 1892 	add	hl,de
   6EF3 79            [ 4] 1893 	ld	a,c
   6EF4 95            [ 4] 1894 	sub	a, l
   6EF5 78            [ 4] 1895 	ld	a,b
   6EF6 9C            [ 4] 1896 	sbc	a, h
   6EF7 E2 FC 6E      [10] 1897 	jp	PO, 00140$
   6EFA EE 80         [ 7] 1898 	xor	a, #0x80
   6EFC                    1899 00140$:
   6EFC F2 07 6F      [10] 1900 	jp	P,00111$
                           1901 ;src/main.c:372: enemy->seen = SI;
   6EFF DD 6E FE      [19] 1902 	ld	l,-2 (ix)
   6F02 DD 66 FF      [19] 1903 	ld	h,-1 (ix)
   6F05 36 01         [10] 1904 	ld	(hl),#0x01
   6F07                    1905 00111$:
   6F07 DD F9         [10] 1906 	ld	sp, ix
   6F09 DD E1         [14] 1907 	pop	ix
   6F0B C9            [10] 1908 	ret
                           1909 ;src/main.c:377: void moverEnemigoSeek(TEnemy* actual){
                           1910 ;	---------------------------------
                           1911 ; Function moverEnemigoSeek
                           1912 ; ---------------------------------
   6F0C                    1913 _moverEnemigoSeek::
   6F0C DD E5         [15] 1914 	push	ix
   6F0E DD 21 00 00   [14] 1915 	ld	ix,#0
   6F12 DD 39         [15] 1916 	add	ix,sp
   6F14 21 F6 FF      [10] 1917 	ld	hl,#-10
   6F17 39            [11] 1918 	add	hl,sp
   6F18 F9            [ 6] 1919 	ld	sp,hl
                           1920 ;src/main.c:379: if(!actual->muerto){
   6F19 DD 4E 04      [19] 1921 	ld	c,4 (ix)
   6F1C DD 46 05      [19] 1922 	ld	b,5 (ix)
   6F1F C5            [11] 1923 	push	bc
   6F20 FD E1         [14] 1924 	pop	iy
   6F22 FD 7E 08      [19] 1925 	ld	a, 8 (iy)
   6F25 B7            [ 4] 1926 	or	a, a
   6F26 C2 B9 70      [10] 1927 	jp	NZ,00114$
                           1928 ;src/main.c:382: if(actual->iter < actual->longitud_camino){
   6F29 21 0D 00      [10] 1929 	ld	hl,#0x000D
   6F2C 09            [11] 1930 	add	hl,bc
   6F2D DD 75 FB      [19] 1931 	ld	-5 (ix),l
   6F30 DD 74 FC      [19] 1932 	ld	-4 (ix),h
   6F33 DD 6E FB      [19] 1933 	ld	l,-5 (ix)
   6F36 DD 66 FC      [19] 1934 	ld	h,-4 (ix)
   6F39 7E            [ 7] 1935 	ld	a,(hl)
   6F3A DD 77 F9      [19] 1936 	ld	-7 (ix),a
   6F3D 23            [ 6] 1937 	inc	hl
   6F3E 7E            [ 7] 1938 	ld	a,(hl)
   6F3F DD 77 FA      [19] 1939 	ld	-6 (ix),a
   6F42 69            [ 4] 1940 	ld	l, c
   6F43 60            [ 4] 1941 	ld	h, b
   6F44 11 E1 00      [10] 1942 	ld	de, #0x00E1
   6F47 19            [11] 1943 	add	hl, de
   6F48 5E            [ 7] 1944 	ld	e,(hl)
   6F49 16 00         [ 7] 1945 	ld	d,#0x00
                           1946 ;src/main.c:391: actual->y = actual->camino[actual->iter];
   6F4B 21 01 00      [10] 1947 	ld	hl,#0x0001
   6F4E 09            [11] 1948 	add	hl,bc
   6F4F DD 75 F7      [19] 1949 	ld	-9 (ix),l
   6F52 DD 74 F8      [19] 1950 	ld	-8 (ix),h
                           1951 ;src/main.c:382: if(actual->iter < actual->longitud_camino){
   6F55 DD 7E F9      [19] 1952 	ld	a,-7 (ix)
   6F58 93            [ 4] 1953 	sub	a, e
   6F59 DD 7E FA      [19] 1954 	ld	a,-6 (ix)
   6F5C 9A            [ 4] 1955 	sbc	a, d
   6F5D E2 62 6F      [10] 1956 	jp	PO, 00136$
   6F60 EE 80         [ 7] 1957 	xor	a, #0x80
   6F62                    1958 00136$:
   6F62 F2 F6 6F      [10] 1959 	jp	P,00110$
                           1960 ;src/main.c:387: actual->mover = SI;
   6F65 21 06 00      [10] 1961 	ld	hl,#0x0006
   6F68 09            [11] 1962 	add	hl,bc
                           1963 ;src/main.c:389: actual->x = actual->camino[actual->iter];
   6F69 79            [ 4] 1964 	ld	a,c
   6F6A C6 19         [ 7] 1965 	add	a, #0x19
   6F6C 5F            [ 4] 1966 	ld	e,a
   6F6D 78            [ 4] 1967 	ld	a,b
   6F6E CE 00         [ 7] 1968 	adc	a, #0x00
   6F70 57            [ 4] 1969 	ld	d,a
                           1970 ;src/main.c:385: if(actual->iter == 0){
   6F71 DD 7E FA      [19] 1971 	ld	a,-6 (ix)
   6F74 DD B6 F9      [19] 1972 	or	a,-7 (ix)
   6F77 20 44         [12] 1973 	jr	NZ,00102$
                           1974 ;src/main.c:387: actual->mover = SI;
   6F79 36 01         [10] 1975 	ld	(hl),#0x01
                           1976 ;src/main.c:388: actual->iter = 2;
   6F7B DD 6E FB      [19] 1977 	ld	l,-5 (ix)
   6F7E DD 66 FC      [19] 1978 	ld	h,-4 (ix)
   6F81 36 02         [10] 1979 	ld	(hl),#0x02
   6F83 23            [ 6] 1980 	inc	hl
   6F84 36 00         [10] 1981 	ld	(hl),#0x00
                           1982 ;src/main.c:389: actual->x = actual->camino[actual->iter];
   6F86 DD 6E FB      [19] 1983 	ld	l,-5 (ix)
   6F89 DD 66 FC      [19] 1984 	ld	h,-4 (ix)
   6F8C 7E            [ 7] 1985 	ld	a, (hl)
   6F8D 23            [ 6] 1986 	inc	hl
   6F8E 66            [ 7] 1987 	ld	h,(hl)
   6F8F 6F            [ 4] 1988 	ld	l,a
   6F90 19            [11] 1989 	add	hl,de
   6F91 7E            [ 7] 1990 	ld	a,(hl)
   6F92 02            [ 7] 1991 	ld	(bc),a
                           1992 ;src/main.c:390: ++actual->iter;
   6F93 DD 6E FB      [19] 1993 	ld	l,-5 (ix)
   6F96 DD 66 FC      [19] 1994 	ld	h,-4 (ix)
   6F99 4E            [ 7] 1995 	ld	c,(hl)
   6F9A 23            [ 6] 1996 	inc	hl
   6F9B 46            [ 7] 1997 	ld	b,(hl)
   6F9C 03            [ 6] 1998 	inc	bc
   6F9D DD 6E FB      [19] 1999 	ld	l,-5 (ix)
   6FA0 DD 66 FC      [19] 2000 	ld	h,-4 (ix)
   6FA3 71            [ 7] 2001 	ld	(hl),c
   6FA4 23            [ 6] 2002 	inc	hl
   6FA5 70            [ 7] 2003 	ld	(hl),b
                           2004 ;src/main.c:391: actual->y = actual->camino[actual->iter];
   6FA6 EB            [ 4] 2005 	ex	de,hl
   6FA7 09            [11] 2006 	add	hl,bc
   6FA8 5E            [ 7] 2007 	ld	e,(hl)
   6FA9 DD 6E F7      [19] 2008 	ld	l,-9 (ix)
   6FAC DD 66 F8      [19] 2009 	ld	h,-8 (ix)
   6FAF 73            [ 7] 2010 	ld	(hl),e
                           2011 ;src/main.c:392: ++actual->iter;
   6FB0 03            [ 6] 2012 	inc	bc
   6FB1 DD 6E FB      [19] 2013 	ld	l,-5 (ix)
   6FB4 DD 66 FC      [19] 2014 	ld	h,-4 (ix)
   6FB7 71            [ 7] 2015 	ld	(hl),c
   6FB8 23            [ 6] 2016 	inc	hl
   6FB9 70            [ 7] 2017 	ld	(hl),b
   6FBA C3 B9 70      [10] 2018 	jp	00114$
   6FBD                    2019 00102$:
                           2020 ;src/main.c:395: actual->mover = SI;
   6FBD 36 01         [10] 2021 	ld	(hl),#0x01
                           2022 ;src/main.c:396: actual->x = actual->camino[actual->iter];
   6FBF DD 6E FB      [19] 2023 	ld	l,-5 (ix)
   6FC2 DD 66 FC      [19] 2024 	ld	h,-4 (ix)
   6FC5 7E            [ 7] 2025 	ld	a, (hl)
   6FC6 23            [ 6] 2026 	inc	hl
   6FC7 66            [ 7] 2027 	ld	h,(hl)
   6FC8 6F            [ 4] 2028 	ld	l,a
   6FC9 19            [11] 2029 	add	hl,de
   6FCA 7E            [ 7] 2030 	ld	a,(hl)
   6FCB 02            [ 7] 2031 	ld	(bc),a
                           2032 ;src/main.c:397: ++actual->iter;
   6FCC DD 6E FB      [19] 2033 	ld	l,-5 (ix)
   6FCF DD 66 FC      [19] 2034 	ld	h,-4 (ix)
   6FD2 4E            [ 7] 2035 	ld	c,(hl)
   6FD3 23            [ 6] 2036 	inc	hl
   6FD4 46            [ 7] 2037 	ld	b,(hl)
   6FD5 03            [ 6] 2038 	inc	bc
   6FD6 DD 6E FB      [19] 2039 	ld	l,-5 (ix)
   6FD9 DD 66 FC      [19] 2040 	ld	h,-4 (ix)
   6FDC 71            [ 7] 2041 	ld	(hl),c
   6FDD 23            [ 6] 2042 	inc	hl
   6FDE 70            [ 7] 2043 	ld	(hl),b
                           2044 ;src/main.c:398: actual->y = actual->camino[actual->iter];
   6FDF EB            [ 4] 2045 	ex	de,hl
   6FE0 09            [11] 2046 	add	hl,bc
   6FE1 5E            [ 7] 2047 	ld	e,(hl)
   6FE2 DD 6E F7      [19] 2048 	ld	l,-9 (ix)
   6FE5 DD 66 F8      [19] 2049 	ld	h,-8 (ix)
   6FE8 73            [ 7] 2050 	ld	(hl),e
                           2051 ;src/main.c:399: ++actual->iter;
   6FE9 03            [ 6] 2052 	inc	bc
   6FEA DD 6E FB      [19] 2053 	ld	l,-5 (ix)
   6FED DD 66 FC      [19] 2054 	ld	h,-4 (ix)
   6FF0 71            [ 7] 2055 	ld	(hl),c
   6FF1 23            [ 6] 2056 	inc	hl
   6FF2 70            [ 7] 2057 	ld	(hl),b
   6FF3 C3 B9 70      [10] 2058 	jp	00114$
   6FF6                    2059 00110$:
                           2060 ;src/main.c:405: actual->seek = 0;
   6FF6 21 13 00      [10] 2061 	ld	hl,#0x0013
   6FF9 09            [11] 2062 	add	hl,bc
   6FFA DD 75 F9      [19] 2063 	ld	-7 (ix),l
   6FFD DD 74 FA      [19] 2064 	ld	-6 (ix),h
   7000 DD 6E F9      [19] 2065 	ld	l,-7 (ix)
   7003 DD 66 FA      [19] 2066 	ld	h,-6 (ix)
   7006 36 00         [10] 2067 	ld	(hl),#0x00
                           2068 ;src/main.c:406: lookFor(actual);
   7008 C5            [11] 2069 	push	bc
   7009 C5            [11] 2070 	push	bc
   700A CD 06 6E      [17] 2071 	call	_lookFor
   700D F1            [10] 2072 	pop	af
   700E C1            [10] 2073 	pop	bc
                           2074 ;src/main.c:407: if(!actual->seen){
   700F 69            [ 4] 2075 	ld	l, c
   7010 60            [ 4] 2076 	ld	h, b
   7011 11 11 00      [10] 2077 	ld	de, #0x0011
   7014 19            [11] 2078 	add	hl, de
   7015 7E            [ 7] 2079 	ld	a,(hl)
   7016 DD 77 F6      [19] 2080 	ld	-10 (ix),a
                           2081 ;src/main.c:408: actual->patrolling = 1;
   7019 21 0A 00      [10] 2082 	ld	hl,#0x000A
   701C 09            [11] 2083 	add	hl,bc
   701D DD 75 FE      [19] 2084 	ld	-2 (ix),l
   7020 DD 74 FF      [19] 2085 	ld	-1 (ix),h
                           2086 ;src/main.c:407: if(!actual->seen){
   7023 DD 7E F6      [19] 2087 	ld	a,-10 (ix)
   7026 B7            [ 4] 2088 	or	a, a
   7027 20 3C         [12] 2089 	jr	NZ,00107$
                           2090 ;src/main.c:408: actual->patrolling = 1;
   7029 DD 6E FE      [19] 2091 	ld	l,-2 (ix)
   702C DD 66 FF      [19] 2092 	ld	h,-1 (ix)
   702F 36 01         [10] 2093 	ld	(hl),#0x01
                           2094 ;src/main.c:409: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7031 C5            [11] 2095 	push	bc
   7032 FD E1         [14] 2096 	pop	iy
   7034 FD 7E 18      [19] 2097 	ld	a,24 (iy)
   7037 DD 77 F6      [19] 2098 	ld	-10 (ix),a
   703A C5            [11] 2099 	push	bc
   703B FD E1         [14] 2100 	pop	iy
   703D FD 56 17      [19] 2101 	ld	d,23 (iy)
   7040 DD 6E F7      [19] 2102 	ld	l,-9 (ix)
   7043 DD 66 F8      [19] 2103 	ld	h,-8 (ix)
   7046 5E            [ 7] 2104 	ld	e,(hl)
   7047 0A            [ 7] 2105 	ld	a,(bc)
   7048 DD 77 FD      [19] 2106 	ld	-3 (ix),a
   704B 2A 03 65      [16] 2107 	ld	hl,(_mapa)
   704E E5            [11] 2108 	push	hl
   704F C5            [11] 2109 	push	bc
   7050 DD 7E F6      [19] 2110 	ld	a,-10 (ix)
   7053 F5            [11] 2111 	push	af
   7054 33            [ 6] 2112 	inc	sp
   7055 D5            [11] 2113 	push	de
   7056 DD 7E FD      [19] 2114 	ld	a,-3 (ix)
   7059 F5            [11] 2115 	push	af
   705A 33            [ 6] 2116 	inc	sp
   705B CD 30 44      [17] 2117 	call	_pathFinding
   705E 21 08 00      [10] 2118 	ld	hl,#8
   7061 39            [11] 2119 	add	hl,sp
   7062 F9            [ 6] 2120 	ld	sp,hl
   7063 18 4A         [12] 2121 	jr	00108$
   7065                    2122 00107$:
                           2123 ;src/main.c:411: actual->patrolling = 0;
   7065 DD 6E FE      [19] 2124 	ld	l,-2 (ix)
   7068 DD 66 FF      [19] 2125 	ld	h,-1 (ix)
   706B 36 00         [10] 2126 	ld	(hl),#0x00
                           2127 ;src/main.c:412: if(!actual->engage){
   706D C5            [11] 2128 	push	bc
   706E FD E1         [14] 2129 	pop	iy
   7070 FD 7E 15      [19] 2130 	ld	a,21 (iy)
   7073 B7            [ 4] 2131 	or	a, a
   7074 20 39         [12] 2132 	jr	NZ,00108$
                           2133 ;src/main.c:413: actual->seek = 1;
   7076 DD 6E F9      [19] 2134 	ld	l,-7 (ix)
   7079 DD 66 FA      [19] 2135 	ld	h,-6 (ix)
   707C 36 01         [10] 2136 	ld	(hl),#0x01
                           2137 ;src/main.c:414: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   707E 3A 26 64      [13] 2138 	ld	a,(#_prota + 1)
   7081 DD 77 FD      [19] 2139 	ld	-3 (ix),a
   7084 21 25 64      [10] 2140 	ld	hl, #_prota + 0
   7087 5E            [ 7] 2141 	ld	e,(hl)
   7088 DD 6E F7      [19] 2142 	ld	l,-9 (ix)
   708B DD 66 F8      [19] 2143 	ld	h,-8 (ix)
   708E 56            [ 7] 2144 	ld	d,(hl)
   708F 0A            [ 7] 2145 	ld	a,(bc)
   7090 DD 77 FE      [19] 2146 	ld	-2 (ix),a
   7093 2A 03 65      [16] 2147 	ld	hl,(_mapa)
   7096 E5            [11] 2148 	push	hl
   7097 C5            [11] 2149 	push	bc
   7098 DD 7E FD      [19] 2150 	ld	a,-3 (ix)
   709B F5            [11] 2151 	push	af
   709C 33            [ 6] 2152 	inc	sp
   709D 7B            [ 4] 2153 	ld	a,e
   709E F5            [11] 2154 	push	af
   709F 33            [ 6] 2155 	inc	sp
   70A0 D5            [11] 2156 	push	de
   70A1 33            [ 6] 2157 	inc	sp
   70A2 DD 7E FE      [19] 2158 	ld	a,-2 (ix)
   70A5 F5            [11] 2159 	push	af
   70A6 33            [ 6] 2160 	inc	sp
   70A7 CD 30 44      [17] 2161 	call	_pathFinding
   70AA 21 08 00      [10] 2162 	ld	hl,#8
   70AD 39            [11] 2163 	add	hl,sp
   70AE F9            [ 6] 2164 	ld	sp,hl
   70AF                    2165 00108$:
                           2166 ;src/main.c:417: actual->iter = 0;
   70AF DD 6E FB      [19] 2167 	ld	l,-5 (ix)
   70B2 DD 66 FC      [19] 2168 	ld	h,-4 (ix)
   70B5 AF            [ 4] 2169 	xor	a, a
   70B6 77            [ 7] 2170 	ld	(hl), a
   70B7 23            [ 6] 2171 	inc	hl
   70B8 77            [ 7] 2172 	ld	(hl), a
   70B9                    2173 00114$:
   70B9 DD F9         [10] 2174 	ld	sp, ix
   70BB DD E1         [14] 2175 	pop	ix
   70BD C9            [10] 2176 	ret
                           2177 ;src/main.c:423: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2178 ;	---------------------------------
                           2179 ; Function engage
                           2180 ; ---------------------------------
   70BE                    2181 _engage::
   70BE DD E5         [15] 2182 	push	ix
   70C0 DD 21 00 00   [14] 2183 	ld	ix,#0
   70C4 DD 39         [15] 2184 	add	ix,sp
   70C6 21 ED FF      [10] 2185 	ld	hl,#-19
   70C9 39            [11] 2186 	add	hl,sp
   70CA F9            [ 6] 2187 	ld	sp,hl
                           2188 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70CB DD 7E 04      [19] 2189 	ld	a,4 (ix)
   70CE DD 77 F1      [19] 2190 	ld	-15 (ix),a
   70D1 DD 7E 05      [19] 2191 	ld	a,5 (ix)
   70D4 DD 77 F2      [19] 2192 	ld	-14 (ix),a
   70D7 DD 6E F1      [19] 2193 	ld	l,-15 (ix)
   70DA DD 66 F2      [19] 2194 	ld	h,-14 (ix)
   70DD 4E            [ 7] 2195 	ld	c,(hl)
   70DE 06 00         [ 7] 2196 	ld	b,#0x00
   70E0 21 25 64      [10] 2197 	ld	hl,#_prota+0
   70E3 5E            [ 7] 2198 	ld	e,(hl)
   70E4 16 00         [ 7] 2199 	ld	d,#0x00
   70E6 79            [ 4] 2200 	ld	a,c
   70E7 93            [ 4] 2201 	sub	a, e
   70E8 4F            [ 4] 2202 	ld	c,a
   70E9 78            [ 4] 2203 	ld	a,b
   70EA 9A            [ 4] 2204 	sbc	a, d
   70EB 47            [ 4] 2205 	ld	b,a
   70EC C5            [11] 2206 	push	bc
   70ED CD A5 4B      [17] 2207 	call	_abs
   70F0 F1            [10] 2208 	pop	af
   70F1 4D            [ 4] 2209 	ld	c,l
                           2210 ;src/main.c:425: u8 dify = abs(enemy->y - prota.y);
   70F2 DD 7E F1      [19] 2211 	ld	a,-15 (ix)
   70F5 C6 01         [ 7] 2212 	add	a, #0x01
   70F7 DD 77 F3      [19] 2213 	ld	-13 (ix),a
   70FA DD 7E F2      [19] 2214 	ld	a,-14 (ix)
   70FD CE 00         [ 7] 2215 	adc	a, #0x00
   70FF DD 77 F4      [19] 2216 	ld	-12 (ix),a
   7102 DD 6E F3      [19] 2217 	ld	l,-13 (ix)
   7105 DD 66 F4      [19] 2218 	ld	h,-12 (ix)
   7108 5E            [ 7] 2219 	ld	e,(hl)
   7109 16 00         [ 7] 2220 	ld	d,#0x00
   710B 21 26 64      [10] 2221 	ld	hl, #_prota + 1
   710E 6E            [ 7] 2222 	ld	l,(hl)
   710F 26 00         [ 7] 2223 	ld	h,#0x00
   7111 7B            [ 4] 2224 	ld	a,e
   7112 95            [ 4] 2225 	sub	a, l
   7113 5F            [ 4] 2226 	ld	e,a
   7114 7A            [ 4] 2227 	ld	a,d
   7115 9C            [ 4] 2228 	sbc	a, h
   7116 57            [ 4] 2229 	ld	d,a
   7117 C5            [11] 2230 	push	bc
   7118 D5            [11] 2231 	push	de
   7119 CD A5 4B      [17] 2232 	call	_abs
   711C F1            [10] 2233 	pop	af
   711D C1            [10] 2234 	pop	bc
                           2235 ;src/main.c:426: u8 dist = difx + dify; // manhattan
   711E 09            [11] 2236 	add	hl, bc
   711F DD 75 ED      [19] 2237 	ld	-19 (ix),l
                           2238 ;src/main.c:428: u8 movX = 0;
   7122 DD 36 F0 00   [19] 2239 	ld	-16 (ix),#0x00
                           2240 ;src/main.c:429: u8 movY = 0;
   7126 DD 36 EF 00   [19] 2241 	ld	-17 (ix),#0x00
                           2242 ;src/main.c:430: u8 distConstraint = 25;
   712A DD 36 EE 19   [19] 2243 	ld	-18 (ix),#0x19
                           2244 ;src/main.c:431: enemy->mover = NO;
   712E DD 7E F1      [19] 2245 	ld	a,-15 (ix)
   7131 C6 06         [ 7] 2246 	add	a, #0x06
   7133 DD 77 F5      [19] 2247 	ld	-11 (ix),a
   7136 DD 7E F2      [19] 2248 	ld	a,-14 (ix)
   7139 CE 00         [ 7] 2249 	adc	a, #0x00
   713B DD 77 F6      [19] 2250 	ld	-10 (ix),a
   713E DD 6E F5      [19] 2251 	ld	l,-11 (ix)
   7141 DD 66 F6      [19] 2252 	ld	h,-10 (ix)
   7144 36 00         [10] 2253 	ld	(hl),#0x00
                           2254 ;src/main.c:440: enemy->didDamage = 1;
   7146 DD 7E F1      [19] 2255 	ld	a,-15 (ix)
   7149 C6 16         [ 7] 2256 	add	a, #0x16
   714B 4F            [ 4] 2257 	ld	c,a
   714C DD 7E F2      [19] 2258 	ld	a,-14 (ix)
   714F CE 00         [ 7] 2259 	adc	a, #0x00
   7151 47            [ 4] 2260 	ld	b,a
                           2261 ;src/main.c:433: if (dist < 20) {
   7152 DD 7E ED      [19] 2262 	ld	a,-19 (ix)
   7155 D6 14         [ 7] 2263 	sub	a, #0x14
   7157 30 1B         [12] 2264 	jr	NC,00104$
                           2265 ;src/main.c:434: vidas--;
   7159 21 38 64      [10] 2266 	ld	hl, #_vidas+0
   715C 35            [11] 2267 	dec	(hl)
                           2268 ;src/main.c:435: if (vidas == 1) {
   715D 3A 38 64      [13] 2269 	ld	a,(#_vidas + 0)
   7160 3D            [ 4] 2270 	dec	a
   7161 20 0E         [12] 2271 	jr	NZ,00102$
                           2272 ;src/main.c:436: menuFin(puntuacion);
   7163 FD 21 06 65   [14] 2273 	ld	iy,#_puntuacion
   7167 FD 6E 00      [19] 2274 	ld	l,0 (iy)
   716A 26 00         [ 7] 2275 	ld	h,#0x00
   716C C5            [11] 2276 	push	bc
   716D CD E5 4B      [17] 2277 	call	_menuFin
   7170 C1            [10] 2278 	pop	bc
   7171                    2279 00102$:
                           2280 ;src/main.c:440: enemy->didDamage = 1;
   7171 3E 01         [ 7] 2281 	ld	a,#0x01
   7173 02            [ 7] 2282 	ld	(bc),a
   7174                    2283 00104$:
                           2284 ;src/main.c:442: if (!enemy->didDamage) {
   7174 0A            [ 7] 2285 	ld	a,(bc)
   7175 DD 77 F7      [19] 2286 	ld	-9 (ix), a
   7178 B7            [ 4] 2287 	or	a, a
   7179 C2 30 79      [10] 2288 	jp	NZ,00205$
                           2289 ;src/main.c:443: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   717C DD 6E F3      [19] 2290 	ld	l,-13 (ix)
   717F DD 66 F4      [19] 2291 	ld	h,-12 (ix)
   7182 7E            [ 7] 2292 	ld	a,(hl)
   7183 DD 77 F7      [19] 2293 	ld	-9 (ix),a
                           2294 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7186 DD 6E F1      [19] 2295 	ld	l,-15 (ix)
   7189 DD 66 F2      [19] 2296 	ld	h,-14 (ix)
   718C 7E            [ 7] 2297 	ld	a,(hl)
                           2298 ;src/main.c:456: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   718D DD 77 F8      [19] 2299 	ld	-8 (ix), a
   7190 C6 04         [ 7] 2300 	add	a, #0x04
   7192 DD 77 F9      [19] 2301 	ld	-7 (ix),a
                           2302 ;src/main.c:443: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7195 DD 7E F7      [19] 2303 	ld	a,-9 (ix)
   7198 DD 96 07      [19] 2304 	sub	a, 7 (ix)
   719B 28 2B         [12] 2305 	jr	Z,00198$
   719D DD 4E 07      [19] 2306 	ld	c,7 (ix)
   71A0 06 00         [ 7] 2307 	ld	b,#0x00
   71A2 21 01 00      [10] 2308 	ld	hl,#0x0001
   71A5 09            [11] 2309 	add	hl,bc
   71A6 DD 75 FA      [19] 2310 	ld	-6 (ix),l
   71A9 DD 74 FB      [19] 2311 	ld	-5 (ix),h
   71AC DD 5E F7      [19] 2312 	ld	e,-9 (ix)
   71AF 16 00         [ 7] 2313 	ld	d,#0x00
   71B1 7B            [ 4] 2314 	ld	a,e
   71B2 DD 96 FA      [19] 2315 	sub	a, -6 (ix)
   71B5 20 06         [12] 2316 	jr	NZ,00442$
   71B7 7A            [ 4] 2317 	ld	a,d
   71B8 DD 96 FB      [19] 2318 	sub	a, -5 (ix)
   71BB 28 0B         [12] 2319 	jr	Z,00198$
   71BD                    2320 00442$:
   71BD 0B            [ 6] 2321 	dec	bc
   71BE 7B            [ 4] 2322 	ld	a,e
   71BF 91            [ 4] 2323 	sub	a, c
   71C0 C2 CC 72      [10] 2324 	jp	NZ,00199$
   71C3 7A            [ 4] 2325 	ld	a,d
   71C4 90            [ 4] 2326 	sub	a, b
   71C5 C2 CC 72      [10] 2327 	jp	NZ,00199$
   71C8                    2328 00198$:
                           2329 ;src/main.c:444: if (dx < enemy->x) { // izquierda
   71C8 DD 7E 06      [19] 2330 	ld	a,6 (ix)
   71CB DD 96 F8      [19] 2331 	sub	a, -8 (ix)
   71CE 30 79         [12] 2332 	jr	NC,00118$
                           2333 ;src/main.c:445: if (dist > 11) {
   71D0 3E 0B         [ 7] 2334 	ld	a,#0x0B
   71D2 DD 96 ED      [19] 2335 	sub	a, -19 (ix)
   71D5 D2 30 79      [10] 2336 	jp	NC,00205$
                           2337 ;src/main.c:446: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   71D8 DD 66 F7      [19] 2338 	ld	h,-9 (ix)
   71DB DD 6E F8      [19] 2339 	ld	l,-8 (ix)
   71DE E5            [11] 2340 	push	hl
   71DF 2A 03 65      [16] 2341 	ld	hl,(_mapa)
   71E2 E5            [11] 2342 	push	hl
   71E3 CD 61 4B      [17] 2343 	call	_getTilePtr
   71E6 F1            [10] 2344 	pop	af
   71E7 F1            [10] 2345 	pop	af
   71E8 4E            [ 7] 2346 	ld	c,(hl)
   71E9 3E 02         [ 7] 2347 	ld	a,#0x02
   71EB 91            [ 4] 2348 	sub	a, c
   71EC DA 30 79      [10] 2349 	jp	C,00205$
                           2350 ;src/main.c:447: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   71EF DD 6E F3      [19] 2351 	ld	l,-13 (ix)
   71F2 DD 66 F4      [19] 2352 	ld	h,-12 (ix)
   71F5 7E            [ 7] 2353 	ld	a,(hl)
   71F6 C6 0B         [ 7] 2354 	add	a, #0x0B
   71F8 47            [ 4] 2355 	ld	b,a
   71F9 DD 6E F1      [19] 2356 	ld	l,-15 (ix)
   71FC DD 66 F2      [19] 2357 	ld	h,-14 (ix)
   71FF 4E            [ 7] 2358 	ld	c, (hl)
   7200 C5            [11] 2359 	push	bc
   7201 2A 03 65      [16] 2360 	ld	hl,(_mapa)
   7204 E5            [11] 2361 	push	hl
   7205 CD 61 4B      [17] 2362 	call	_getTilePtr
   7208 F1            [10] 2363 	pop	af
   7209 F1            [10] 2364 	pop	af
   720A 4E            [ 7] 2365 	ld	c,(hl)
   720B 3E 02         [ 7] 2366 	ld	a,#0x02
   720D 91            [ 4] 2367 	sub	a, c
   720E DA 30 79      [10] 2368 	jp	C,00205$
                           2369 ;src/main.c:448: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7211 DD 6E F3      [19] 2370 	ld	l,-13 (ix)
   7214 DD 66 F4      [19] 2371 	ld	h,-12 (ix)
   7217 7E            [ 7] 2372 	ld	a,(hl)
   7218 C6 16         [ 7] 2373 	add	a, #0x16
   721A 47            [ 4] 2374 	ld	b,a
   721B DD 6E F1      [19] 2375 	ld	l,-15 (ix)
   721E DD 66 F2      [19] 2376 	ld	h,-14 (ix)
   7221 4E            [ 7] 2377 	ld	c, (hl)
   7222 C5            [11] 2378 	push	bc
   7223 2A 03 65      [16] 2379 	ld	hl,(_mapa)
   7226 E5            [11] 2380 	push	hl
   7227 CD 61 4B      [17] 2381 	call	_getTilePtr
   722A F1            [10] 2382 	pop	af
   722B F1            [10] 2383 	pop	af
   722C 4E            [ 7] 2384 	ld	c,(hl)
   722D 3E 02         [ 7] 2385 	ld	a,#0x02
   722F 91            [ 4] 2386 	sub	a, c
   7230 DA 30 79      [10] 2387 	jp	C,00205$
                           2388 ;src/main.c:449: moverEnemigoIzquierda(enemy);
   7233 DD 6E F1      [19] 2389 	ld	l,-15 (ix)
   7236 DD 66 F2      [19] 2390 	ld	h,-14 (ix)
   7239 E5            [11] 2391 	push	hl
   723A CD A7 6B      [17] 2392 	call	_moverEnemigoIzquierda
   723D F1            [10] 2393 	pop	af
                           2394 ;src/main.c:451: enemy->mover = SI;
   723E DD 6E F5      [19] 2395 	ld	l,-11 (ix)
   7241 DD 66 F6      [19] 2396 	ld	h,-10 (ix)
   7244 36 01         [10] 2397 	ld	(hl),#0x01
   7246 C3 30 79      [10] 2398 	jp	00205$
   7249                    2399 00118$:
                           2400 ;src/main.c:455: if (dist > G_ENEMY_W + 3) {
   7249 3E 07         [ 7] 2401 	ld	a,#0x07
   724B DD 96 ED      [19] 2402 	sub	a, -19 (ix)
   724E D2 30 79      [10] 2403 	jp	NC,00205$
                           2404 ;src/main.c:456: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7251 DD 66 F7      [19] 2405 	ld	h,-9 (ix)
   7254 DD 6E F9      [19] 2406 	ld	l,-7 (ix)
   7257 E5            [11] 2407 	push	hl
   7258 2A 03 65      [16] 2408 	ld	hl,(_mapa)
   725B E5            [11] 2409 	push	hl
   725C CD 61 4B      [17] 2410 	call	_getTilePtr
   725F F1            [10] 2411 	pop	af
   7260 F1            [10] 2412 	pop	af
   7261 4E            [ 7] 2413 	ld	c,(hl)
   7262 3E 02         [ 7] 2414 	ld	a,#0x02
   7264 91            [ 4] 2415 	sub	a, c
   7265 DA 30 79      [10] 2416 	jp	C,00205$
                           2417 ;src/main.c:457: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7268 DD 6E F3      [19] 2418 	ld	l,-13 (ix)
   726B DD 66 F4      [19] 2419 	ld	h,-12 (ix)
   726E 7E            [ 7] 2420 	ld	a,(hl)
   726F C6 0B         [ 7] 2421 	add	a, #0x0B
   7271 47            [ 4] 2422 	ld	b,a
   7272 DD 6E F1      [19] 2423 	ld	l,-15 (ix)
   7275 DD 66 F2      [19] 2424 	ld	h,-14 (ix)
   7278 7E            [ 7] 2425 	ld	a,(hl)
   7279 C6 04         [ 7] 2426 	add	a, #0x04
   727B C5            [11] 2427 	push	bc
   727C 33            [ 6] 2428 	inc	sp
   727D F5            [11] 2429 	push	af
   727E 33            [ 6] 2430 	inc	sp
   727F 2A 03 65      [16] 2431 	ld	hl,(_mapa)
   7282 E5            [11] 2432 	push	hl
   7283 CD 61 4B      [17] 2433 	call	_getTilePtr
   7286 F1            [10] 2434 	pop	af
   7287 F1            [10] 2435 	pop	af
   7288 4E            [ 7] 2436 	ld	c,(hl)
   7289 3E 02         [ 7] 2437 	ld	a,#0x02
   728B 91            [ 4] 2438 	sub	a, c
   728C DA 30 79      [10] 2439 	jp	C,00205$
                           2440 ;src/main.c:458: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   728F DD 6E F3      [19] 2441 	ld	l,-13 (ix)
   7292 DD 66 F4      [19] 2442 	ld	h,-12 (ix)
   7295 7E            [ 7] 2443 	ld	a,(hl)
   7296 C6 16         [ 7] 2444 	add	a, #0x16
   7298 47            [ 4] 2445 	ld	b,a
   7299 DD 6E F1      [19] 2446 	ld	l,-15 (ix)
   729C DD 66 F2      [19] 2447 	ld	h,-14 (ix)
   729F 7E            [ 7] 2448 	ld	a,(hl)
   72A0 C6 04         [ 7] 2449 	add	a, #0x04
   72A2 C5            [11] 2450 	push	bc
   72A3 33            [ 6] 2451 	inc	sp
   72A4 F5            [11] 2452 	push	af
   72A5 33            [ 6] 2453 	inc	sp
   72A6 2A 03 65      [16] 2454 	ld	hl,(_mapa)
   72A9 E5            [11] 2455 	push	hl
   72AA CD 61 4B      [17] 2456 	call	_getTilePtr
   72AD F1            [10] 2457 	pop	af
   72AE F1            [10] 2458 	pop	af
   72AF 4E            [ 7] 2459 	ld	c,(hl)
   72B0 3E 02         [ 7] 2460 	ld	a,#0x02
   72B2 91            [ 4] 2461 	sub	a, c
   72B3 DA 30 79      [10] 2462 	jp	C,00205$
                           2463 ;src/main.c:459: moverEnemigoDerecha(enemy);
   72B6 DD 6E F1      [19] 2464 	ld	l,-15 (ix)
   72B9 DD 66 F2      [19] 2465 	ld	h,-14 (ix)
   72BC E5            [11] 2466 	push	hl
   72BD CD 97 6B      [17] 2467 	call	_moverEnemigoDerecha
   72C0 F1            [10] 2468 	pop	af
                           2469 ;src/main.c:461: enemy->mover = SI;
   72C1 DD 6E F5      [19] 2470 	ld	l,-11 (ix)
   72C4 DD 66 F6      [19] 2471 	ld	h,-10 (ix)
   72C7 36 01         [10] 2472 	ld	(hl),#0x01
   72C9 C3 30 79      [10] 2473 	jp	00205$
   72CC                    2474 00199$:
                           2475 ;src/main.c:466: else if (enemy->x == dx) {
   72CC DD 7E F8      [19] 2476 	ld	a,-8 (ix)
   72CF DD 96 06      [19] 2477 	sub	a, 6 (ix)
   72D2 C2 E9 73      [10] 2478 	jp	NZ,00196$
                           2479 ;src/main.c:467: if (dy < enemy->y) {
   72D5 DD 7E 07      [19] 2480 	ld	a,7 (ix)
   72D8 DD 96 F7      [19] 2481 	sub	a, -9 (ix)
   72DB D2 62 73      [10] 2482 	jp	NC,00133$
                           2483 ;src/main.c:468: if (dist > G_HERO_H + 5) {
   72DE 3E 1B         [ 7] 2484 	ld	a,#0x1B
   72E0 DD 96 ED      [19] 2485 	sub	a, -19 (ix)
   72E3 D2 30 79      [10] 2486 	jp	NC,00205$
                           2487 ;src/main.c:469: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   72E6 DD 46 F7      [19] 2488 	ld	b,-9 (ix)
   72E9 05            [ 4] 2489 	dec	b
   72EA 05            [ 4] 2490 	dec	b
   72EB C5            [11] 2491 	push	bc
   72EC 33            [ 6] 2492 	inc	sp
   72ED DD 7E F8      [19] 2493 	ld	a,-8 (ix)
   72F0 F5            [11] 2494 	push	af
   72F1 33            [ 6] 2495 	inc	sp
   72F2 2A 03 65      [16] 2496 	ld	hl,(_mapa)
   72F5 E5            [11] 2497 	push	hl
   72F6 CD 61 4B      [17] 2498 	call	_getTilePtr
   72F9 F1            [10] 2499 	pop	af
   72FA F1            [10] 2500 	pop	af
   72FB 4E            [ 7] 2501 	ld	c,(hl)
   72FC 3E 02         [ 7] 2502 	ld	a,#0x02
   72FE 91            [ 4] 2503 	sub	a, c
   72FF DA 30 79      [10] 2504 	jp	C,00205$
                           2505 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7302 DD 6E F3      [19] 2506 	ld	l,-13 (ix)
   7305 DD 66 F4      [19] 2507 	ld	h,-12 (ix)
   7308 46            [ 7] 2508 	ld	b,(hl)
   7309 05            [ 4] 2509 	dec	b
   730A 05            [ 4] 2510 	dec	b
   730B DD 6E F1      [19] 2511 	ld	l,-15 (ix)
   730E DD 66 F2      [19] 2512 	ld	h,-14 (ix)
   7311 56            [ 7] 2513 	ld	d,(hl)
   7312 14            [ 4] 2514 	inc	d
   7313 14            [ 4] 2515 	inc	d
   7314 4A            [ 4] 2516 	ld	c, d
   7315 C5            [11] 2517 	push	bc
   7316 2A 03 65      [16] 2518 	ld	hl,(_mapa)
   7319 E5            [11] 2519 	push	hl
   731A CD 61 4B      [17] 2520 	call	_getTilePtr
   731D F1            [10] 2521 	pop	af
   731E F1            [10] 2522 	pop	af
   731F 4E            [ 7] 2523 	ld	c,(hl)
   7320 3E 02         [ 7] 2524 	ld	a,#0x02
   7322 91            [ 4] 2525 	sub	a, c
   7323 DA 30 79      [10] 2526 	jp	C,00205$
                           2527 ;src/main.c:471: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7326 DD 6E F3      [19] 2528 	ld	l,-13 (ix)
   7329 DD 66 F4      [19] 2529 	ld	h,-12 (ix)
   732C 46            [ 7] 2530 	ld	b,(hl)
   732D 05            [ 4] 2531 	dec	b
   732E 05            [ 4] 2532 	dec	b
   732F DD 6E F1      [19] 2533 	ld	l,-15 (ix)
   7332 DD 66 F2      [19] 2534 	ld	h,-14 (ix)
   7335 7E            [ 7] 2535 	ld	a,(hl)
   7336 C6 04         [ 7] 2536 	add	a, #0x04
   7338 C5            [11] 2537 	push	bc
   7339 33            [ 6] 2538 	inc	sp
   733A F5            [11] 2539 	push	af
   733B 33            [ 6] 2540 	inc	sp
   733C 2A 03 65      [16] 2541 	ld	hl,(_mapa)
   733F E5            [11] 2542 	push	hl
   7340 CD 61 4B      [17] 2543 	call	_getTilePtr
   7343 F1            [10] 2544 	pop	af
   7344 F1            [10] 2545 	pop	af
   7345 4E            [ 7] 2546 	ld	c,(hl)
   7346 3E 02         [ 7] 2547 	ld	a,#0x02
   7348 91            [ 4] 2548 	sub	a, c
   7349 DA 30 79      [10] 2549 	jp	C,00205$
                           2550 ;src/main.c:472: moverEnemigoArriba(enemy);
   734C DD 6E F1      [19] 2551 	ld	l,-15 (ix)
   734F DD 66 F2      [19] 2552 	ld	h,-14 (ix)
   7352 E5            [11] 2553 	push	hl
   7353 CD 59 6B      [17] 2554 	call	_moverEnemigoArriba
   7356 F1            [10] 2555 	pop	af
                           2556 ;src/main.c:474: enemy->mover = SI;
   7357 DD 6E F5      [19] 2557 	ld	l,-11 (ix)
   735A DD 66 F6      [19] 2558 	ld	h,-10 (ix)
   735D 36 01         [10] 2559 	ld	(hl),#0x01
   735F C3 30 79      [10] 2560 	jp	00205$
   7362                    2561 00133$:
                           2562 ;src/main.c:478: if(dist > G_ENEMY_H + 7) {
   7362 3E 1D         [ 7] 2563 	ld	a,#0x1D
   7364 DD 96 ED      [19] 2564 	sub	a, -19 (ix)
   7367 D2 30 79      [10] 2565 	jp	NC,00205$
                           2566 ;src/main.c:479: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   736A DD 7E F7      [19] 2567 	ld	a,-9 (ix)
   736D C6 18         [ 7] 2568 	add	a, #0x18
   736F 47            [ 4] 2569 	ld	b,a
   7370 C5            [11] 2570 	push	bc
   7371 33            [ 6] 2571 	inc	sp
   7372 DD 7E F8      [19] 2572 	ld	a,-8 (ix)
   7375 F5            [11] 2573 	push	af
   7376 33            [ 6] 2574 	inc	sp
   7377 2A 03 65      [16] 2575 	ld	hl,(_mapa)
   737A E5            [11] 2576 	push	hl
   737B CD 61 4B      [17] 2577 	call	_getTilePtr
   737E F1            [10] 2578 	pop	af
   737F F1            [10] 2579 	pop	af
   7380 4E            [ 7] 2580 	ld	c,(hl)
   7381 3E 02         [ 7] 2581 	ld	a,#0x02
   7383 91            [ 4] 2582 	sub	a, c
   7384 DA 30 79      [10] 2583 	jp	C,00205$
                           2584 ;src/main.c:480: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7387 DD 6E F3      [19] 2585 	ld	l,-13 (ix)
   738A DD 66 F4      [19] 2586 	ld	h,-12 (ix)
   738D 7E            [ 7] 2587 	ld	a,(hl)
   738E C6 18         [ 7] 2588 	add	a, #0x18
   7390 47            [ 4] 2589 	ld	b,a
   7391 DD 6E F1      [19] 2590 	ld	l,-15 (ix)
   7394 DD 66 F2      [19] 2591 	ld	h,-14 (ix)
   7397 56            [ 7] 2592 	ld	d,(hl)
   7398 14            [ 4] 2593 	inc	d
   7399 14            [ 4] 2594 	inc	d
   739A 4A            [ 4] 2595 	ld	c, d
   739B C5            [11] 2596 	push	bc
   739C 2A 03 65      [16] 2597 	ld	hl,(_mapa)
   739F E5            [11] 2598 	push	hl
   73A0 CD 61 4B      [17] 2599 	call	_getTilePtr
   73A3 F1            [10] 2600 	pop	af
   73A4 F1            [10] 2601 	pop	af
   73A5 4E            [ 7] 2602 	ld	c,(hl)
   73A6 3E 02         [ 7] 2603 	ld	a,#0x02
   73A8 91            [ 4] 2604 	sub	a, c
   73A9 DA 30 79      [10] 2605 	jp	C,00205$
                           2606 ;src/main.c:481: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   73AC DD 6E F3      [19] 2607 	ld	l,-13 (ix)
   73AF DD 66 F4      [19] 2608 	ld	h,-12 (ix)
   73B2 7E            [ 7] 2609 	ld	a,(hl)
   73B3 C6 18         [ 7] 2610 	add	a, #0x18
   73B5 47            [ 4] 2611 	ld	b,a
   73B6 DD 6E F1      [19] 2612 	ld	l,-15 (ix)
   73B9 DD 66 F2      [19] 2613 	ld	h,-14 (ix)
   73BC 7E            [ 7] 2614 	ld	a,(hl)
   73BD C6 04         [ 7] 2615 	add	a, #0x04
   73BF C5            [11] 2616 	push	bc
   73C0 33            [ 6] 2617 	inc	sp
   73C1 F5            [11] 2618 	push	af
   73C2 33            [ 6] 2619 	inc	sp
   73C3 2A 03 65      [16] 2620 	ld	hl,(_mapa)
   73C6 E5            [11] 2621 	push	hl
   73C7 CD 61 4B      [17] 2622 	call	_getTilePtr
   73CA F1            [10] 2623 	pop	af
   73CB F1            [10] 2624 	pop	af
   73CC 4E            [ 7] 2625 	ld	c,(hl)
   73CD 3E 02         [ 7] 2626 	ld	a,#0x02
   73CF 91            [ 4] 2627 	sub	a, c
   73D0 DA 30 79      [10] 2628 	jp	C,00205$
                           2629 ;src/main.c:482: moverEnemigoAbajo(enemy);
   73D3 DD 6E F1      [19] 2630 	ld	l,-15 (ix)
   73D6 DD 66 F2      [19] 2631 	ld	h,-14 (ix)
   73D9 E5            [11] 2632 	push	hl
   73DA CD 78 6B      [17] 2633 	call	_moverEnemigoAbajo
   73DD F1            [10] 2634 	pop	af
                           2635 ;src/main.c:484: enemy->mover = SI;
   73DE DD 6E F5      [19] 2636 	ld	l,-11 (ix)
   73E1 DD 66 F6      [19] 2637 	ld	h,-10 (ix)
   73E4 36 01         [10] 2638 	ld	(hl),#0x01
   73E6 C3 30 79      [10] 2639 	jp	00205$
   73E9                    2640 00196$:
                           2641 ;src/main.c:490: if (!prota.mover) distConstraint = 20; // ajuste en parado
   73E9 3A 2B 64      [13] 2642 	ld	a, (#_prota + 6)
   73EC B7            [ 4] 2643 	or	a, a
   73ED 20 04         [12] 2644 	jr	NZ,00136$
   73EF DD 36 EE 14   [19] 2645 	ld	-18 (ix),#0x14
   73F3                    2646 00136$:
                           2647 ;src/main.c:492: if (dist > distConstraint) {
   73F3 DD 7E EE      [19] 2648 	ld	a,-18 (ix)
   73F6 DD 96 ED      [19] 2649 	sub	a, -19 (ix)
   73F9 D2 30 79      [10] 2650 	jp	NC,00205$
                           2651 ;src/main.c:493: if (dx + 1 < enemy->x) {
   73FC DD 4E 06      [19] 2652 	ld	c,6 (ix)
   73FF 06 00         [ 7] 2653 	ld	b,#0x00
   7401 03            [ 6] 2654 	inc	bc
   7402 DD 71 FA      [19] 2655 	ld	-6 (ix),c
   7405 DD 70 FB      [19] 2656 	ld	-5 (ix),b
   7408 DD 7E F8      [19] 2657 	ld	a,-8 (ix)
   740B DD 77 FC      [19] 2658 	ld	-4 (ix),a
   740E DD 36 FD 00   [19] 2659 	ld	-3 (ix),#0x00
   7412 DD 7E FA      [19] 2660 	ld	a,-6 (ix)
   7415 DD 96 FC      [19] 2661 	sub	a, -4 (ix)
   7418 DD 7E FB      [19] 2662 	ld	a,-5 (ix)
   741B DD 9E FD      [19] 2663 	sbc	a, -3 (ix)
   741E E2 23 74      [10] 2664 	jp	PO, 00447$
   7421 EE 80         [ 7] 2665 	xor	a, #0x80
   7423                    2666 00447$:
   7423 F2 BA 74      [10] 2667 	jp	P,00148$
                           2668 ;src/main.c:494: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7426 DD 66 F7      [19] 2669 	ld	h,-9 (ix)
   7429 DD 6E F8      [19] 2670 	ld	l,-8 (ix)
   742C E5            [11] 2671 	push	hl
   742D 2A 03 65      [16] 2672 	ld	hl,(_mapa)
   7430 E5            [11] 2673 	push	hl
   7431 CD 61 4B      [17] 2674 	call	_getTilePtr
   7434 F1            [10] 2675 	pop	af
   7435 F1            [10] 2676 	pop	af
   7436 DD 74 FF      [19] 2677 	ld	-1 (ix),h
   7439 DD 75 FE      [19] 2678 	ld	-2 (ix), l
   743C DD 66 FF      [19] 2679 	ld	h,-1 (ix)
   743F 4E            [ 7] 2680 	ld	c,(hl)
   7440 3E 02         [ 7] 2681 	ld	a,#0x02
   7442 91            [ 4] 2682 	sub	a, c
   7443 DA 47 75      [10] 2683 	jp	C,00149$
                           2684 ;src/main.c:495: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7446 DD 6E F3      [19] 2685 	ld	l,-13 (ix)
   7449 DD 66 F4      [19] 2686 	ld	h,-12 (ix)
   744C 7E            [ 7] 2687 	ld	a,(hl)
   744D DD 77 FE      [19] 2688 	ld	-2 (ix), a
   7450 C6 0B         [ 7] 2689 	add	a, #0x0B
   7452 DD 77 FE      [19] 2690 	ld	-2 (ix),a
   7455 DD 6E F1      [19] 2691 	ld	l,-15 (ix)
   7458 DD 66 F2      [19] 2692 	ld	h,-14 (ix)
   745B 46            [ 7] 2693 	ld	b,(hl)
   745C DD 7E FE      [19] 2694 	ld	a,-2 (ix)
   745F F5            [11] 2695 	push	af
   7460 33            [ 6] 2696 	inc	sp
   7461 C5            [11] 2697 	push	bc
   7462 33            [ 6] 2698 	inc	sp
   7463 2A 03 65      [16] 2699 	ld	hl,(_mapa)
   7466 E5            [11] 2700 	push	hl
   7467 CD 61 4B      [17] 2701 	call	_getTilePtr
   746A F1            [10] 2702 	pop	af
   746B F1            [10] 2703 	pop	af
   746C 4E            [ 7] 2704 	ld	c,(hl)
   746D 3E 02         [ 7] 2705 	ld	a,#0x02
   746F 91            [ 4] 2706 	sub	a, c
   7470 DA 47 75      [10] 2707 	jp	C,00149$
                           2708 ;src/main.c:496: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7473 DD 6E F3      [19] 2709 	ld	l,-13 (ix)
   7476 DD 66 F4      [19] 2710 	ld	h,-12 (ix)
   7479 7E            [ 7] 2711 	ld	a,(hl)
   747A DD 77 FE      [19] 2712 	ld	-2 (ix), a
   747D C6 16         [ 7] 2713 	add	a, #0x16
   747F DD 77 FE      [19] 2714 	ld	-2 (ix),a
   7482 DD 6E F1      [19] 2715 	ld	l,-15 (ix)
   7485 DD 66 F2      [19] 2716 	ld	h,-14 (ix)
   7488 46            [ 7] 2717 	ld	b,(hl)
   7489 DD 7E FE      [19] 2718 	ld	a,-2 (ix)
   748C F5            [11] 2719 	push	af
   748D 33            [ 6] 2720 	inc	sp
   748E C5            [11] 2721 	push	bc
   748F 33            [ 6] 2722 	inc	sp
   7490 2A 03 65      [16] 2723 	ld	hl,(_mapa)
   7493 E5            [11] 2724 	push	hl
   7494 CD 61 4B      [17] 2725 	call	_getTilePtr
   7497 F1            [10] 2726 	pop	af
   7498 F1            [10] 2727 	pop	af
   7499 4E            [ 7] 2728 	ld	c,(hl)
   749A 3E 02         [ 7] 2729 	ld	a,#0x02
   749C 91            [ 4] 2730 	sub	a, c
   749D DA 47 75      [10] 2731 	jp	C,00149$
                           2732 ;src/main.c:497: moverEnemigoIzquierda(enemy);
   74A0 DD 6E F1      [19] 2733 	ld	l,-15 (ix)
   74A3 DD 66 F2      [19] 2734 	ld	h,-14 (ix)
   74A6 E5            [11] 2735 	push	hl
   74A7 CD A7 6B      [17] 2736 	call	_moverEnemigoIzquierda
   74AA F1            [10] 2737 	pop	af
                           2738 ;src/main.c:498: movX = 1;
   74AB DD 36 F0 01   [19] 2739 	ld	-16 (ix),#0x01
                           2740 ;src/main.c:499: enemy->mover = SI;
   74AF DD 6E F5      [19] 2741 	ld	l,-11 (ix)
   74B2 DD 66 F6      [19] 2742 	ld	h,-10 (ix)
   74B5 36 01         [10] 2743 	ld	(hl),#0x01
   74B7 C3 47 75      [10] 2744 	jp	00149$
   74BA                    2745 00148$:
                           2746 ;src/main.c:501: } else if (dx + 1 > enemy->x){
   74BA DD 7E FC      [19] 2747 	ld	a,-4 (ix)
   74BD DD 96 FA      [19] 2748 	sub	a, -6 (ix)
   74C0 DD 7E FD      [19] 2749 	ld	a,-3 (ix)
   74C3 DD 9E FB      [19] 2750 	sbc	a, -5 (ix)
   74C6 E2 CB 74      [10] 2751 	jp	PO, 00448$
   74C9 EE 80         [ 7] 2752 	xor	a, #0x80
   74CB                    2753 00448$:
   74CB F2 47 75      [10] 2754 	jp	P,00149$
                           2755 ;src/main.c:502: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   74CE DD 66 F7      [19] 2756 	ld	h,-9 (ix)
   74D1 DD 6E F9      [19] 2757 	ld	l,-7 (ix)
   74D4 E5            [11] 2758 	push	hl
   74D5 2A 03 65      [16] 2759 	ld	hl,(_mapa)
   74D8 E5            [11] 2760 	push	hl
   74D9 CD 61 4B      [17] 2761 	call	_getTilePtr
   74DC F1            [10] 2762 	pop	af
   74DD F1            [10] 2763 	pop	af
   74DE 4E            [ 7] 2764 	ld	c,(hl)
   74DF 3E 02         [ 7] 2765 	ld	a,#0x02
   74E1 91            [ 4] 2766 	sub	a, c
   74E2 38 63         [12] 2767 	jr	C,00149$
                           2768 ;src/main.c:503: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   74E4 DD 6E F3      [19] 2769 	ld	l,-13 (ix)
   74E7 DD 66 F4      [19] 2770 	ld	h,-12 (ix)
   74EA 7E            [ 7] 2771 	ld	a,(hl)
   74EB C6 0B         [ 7] 2772 	add	a, #0x0B
   74ED 47            [ 4] 2773 	ld	b,a
   74EE DD 6E F1      [19] 2774 	ld	l,-15 (ix)
   74F1 DD 66 F2      [19] 2775 	ld	h,-14 (ix)
   74F4 7E            [ 7] 2776 	ld	a,(hl)
   74F5 C6 04         [ 7] 2777 	add	a, #0x04
   74F7 C5            [11] 2778 	push	bc
   74F8 33            [ 6] 2779 	inc	sp
   74F9 F5            [11] 2780 	push	af
   74FA 33            [ 6] 2781 	inc	sp
   74FB 2A 03 65      [16] 2782 	ld	hl,(_mapa)
   74FE E5            [11] 2783 	push	hl
   74FF CD 61 4B      [17] 2784 	call	_getTilePtr
   7502 F1            [10] 2785 	pop	af
   7503 F1            [10] 2786 	pop	af
   7504 4E            [ 7] 2787 	ld	c,(hl)
   7505 3E 02         [ 7] 2788 	ld	a,#0x02
   7507 91            [ 4] 2789 	sub	a, c
   7508 38 3D         [12] 2790 	jr	C,00149$
                           2791 ;src/main.c:504: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   750A DD 6E F3      [19] 2792 	ld	l,-13 (ix)
   750D DD 66 F4      [19] 2793 	ld	h,-12 (ix)
   7510 7E            [ 7] 2794 	ld	a,(hl)
   7511 C6 16         [ 7] 2795 	add	a, #0x16
   7513 47            [ 4] 2796 	ld	b,a
   7514 DD 6E F1      [19] 2797 	ld	l,-15 (ix)
   7517 DD 66 F2      [19] 2798 	ld	h,-14 (ix)
   751A 7E            [ 7] 2799 	ld	a,(hl)
   751B C6 04         [ 7] 2800 	add	a, #0x04
   751D C5            [11] 2801 	push	bc
   751E 33            [ 6] 2802 	inc	sp
   751F F5            [11] 2803 	push	af
   7520 33            [ 6] 2804 	inc	sp
   7521 2A 03 65      [16] 2805 	ld	hl,(_mapa)
   7524 E5            [11] 2806 	push	hl
   7525 CD 61 4B      [17] 2807 	call	_getTilePtr
   7528 F1            [10] 2808 	pop	af
   7529 F1            [10] 2809 	pop	af
   752A 4E            [ 7] 2810 	ld	c,(hl)
   752B 3E 02         [ 7] 2811 	ld	a,#0x02
   752D 91            [ 4] 2812 	sub	a, c
   752E 38 17         [12] 2813 	jr	C,00149$
                           2814 ;src/main.c:505: moverEnemigoDerecha(enemy);
   7530 DD 6E F1      [19] 2815 	ld	l,-15 (ix)
   7533 DD 66 F2      [19] 2816 	ld	h,-14 (ix)
   7536 E5            [11] 2817 	push	hl
   7537 CD 97 6B      [17] 2818 	call	_moverEnemigoDerecha
   753A F1            [10] 2819 	pop	af
                           2820 ;src/main.c:506: movX = 1;
   753B DD 36 F0 01   [19] 2821 	ld	-16 (ix),#0x01
                           2822 ;src/main.c:507: enemy->mover = SI;
   753F DD 6E F5      [19] 2823 	ld	l,-11 (ix)
   7542 DD 66 F6      [19] 2824 	ld	h,-10 (ix)
   7545 36 01         [10] 2825 	ld	(hl),#0x01
   7547                    2826 00149$:
                           2827 ;src/main.c:510: if (dy < enemy->y) {
   7547 DD 6E F3      [19] 2828 	ld	l,-13 (ix)
   754A DD 66 F4      [19] 2829 	ld	h,-12 (ix)
   754D 7E            [ 7] 2830 	ld	a,(hl)
   754E DD 77 FE      [19] 2831 	ld	-2 (ix),a
                           2832 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7551 DD 6E F1      [19] 2833 	ld	l,-15 (ix)
   7554 DD 66 F2      [19] 2834 	ld	h,-14 (ix)
   7557 7E            [ 7] 2835 	ld	a,(hl)
   7558 DD 77 FC      [19] 2836 	ld	-4 (ix),a
                           2837 ;src/main.c:510: if (dy < enemy->y) {
   755B DD 7E 07      [19] 2838 	ld	a,7 (ix)
   755E DD 96 FE      [19] 2839 	sub	a, -2 (ix)
   7561 D2 E6 75      [10] 2840 	jp	NC,00159$
                           2841 ;src/main.c:511: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7564 DD 46 FE      [19] 2842 	ld	b,-2 (ix)
   7567 05            [ 4] 2843 	dec	b
   7568 05            [ 4] 2844 	dec	b
   7569 C5            [11] 2845 	push	bc
   756A 33            [ 6] 2846 	inc	sp
   756B DD 7E FC      [19] 2847 	ld	a,-4 (ix)
   756E F5            [11] 2848 	push	af
   756F 33            [ 6] 2849 	inc	sp
   7570 2A 03 65      [16] 2850 	ld	hl,(_mapa)
   7573 E5            [11] 2851 	push	hl
   7574 CD 61 4B      [17] 2852 	call	_getTilePtr
   7577 F1            [10] 2853 	pop	af
   7578 F1            [10] 2854 	pop	af
   7579 4E            [ 7] 2855 	ld	c,(hl)
   757A 3E 02         [ 7] 2856 	ld	a,#0x02
   757C 91            [ 4] 2857 	sub	a, c
   757D DA 65 76      [10] 2858 	jp	C,00160$
                           2859 ;src/main.c:512: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7580 DD 6E F3      [19] 2860 	ld	l,-13 (ix)
   7583 DD 66 F4      [19] 2861 	ld	h,-12 (ix)
   7586 56            [ 7] 2862 	ld	d,(hl)
   7587 15            [ 4] 2863 	dec	d
   7588 15            [ 4] 2864 	dec	d
   7589 DD 6E F1      [19] 2865 	ld	l,-15 (ix)
   758C DD 66 F2      [19] 2866 	ld	h,-14 (ix)
   758F 46            [ 7] 2867 	ld	b,(hl)
   7590 04            [ 4] 2868 	inc	b
   7591 04            [ 4] 2869 	inc	b
   7592 D5            [11] 2870 	push	de
   7593 33            [ 6] 2871 	inc	sp
   7594 C5            [11] 2872 	push	bc
   7595 33            [ 6] 2873 	inc	sp
   7596 2A 03 65      [16] 2874 	ld	hl,(_mapa)
   7599 E5            [11] 2875 	push	hl
   759A CD 61 4B      [17] 2876 	call	_getTilePtr
   759D F1            [10] 2877 	pop	af
   759E F1            [10] 2878 	pop	af
   759F 4E            [ 7] 2879 	ld	c,(hl)
   75A0 3E 02         [ 7] 2880 	ld	a,#0x02
   75A2 91            [ 4] 2881 	sub	a, c
   75A3 DA 65 76      [10] 2882 	jp	C,00160$
                           2883 ;src/main.c:513: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   75A6 DD 6E F3      [19] 2884 	ld	l,-13 (ix)
   75A9 DD 66 F4      [19] 2885 	ld	h,-12 (ix)
   75AC 46            [ 7] 2886 	ld	b,(hl)
   75AD 05            [ 4] 2887 	dec	b
   75AE 05            [ 4] 2888 	dec	b
   75AF DD 6E F1      [19] 2889 	ld	l,-15 (ix)
   75B2 DD 66 F2      [19] 2890 	ld	h,-14 (ix)
   75B5 7E            [ 7] 2891 	ld	a,(hl)
   75B6 C6 04         [ 7] 2892 	add	a, #0x04
   75B8 C5            [11] 2893 	push	bc
   75B9 33            [ 6] 2894 	inc	sp
   75BA F5            [11] 2895 	push	af
   75BB 33            [ 6] 2896 	inc	sp
   75BC 2A 03 65      [16] 2897 	ld	hl,(_mapa)
   75BF E5            [11] 2898 	push	hl
   75C0 CD 61 4B      [17] 2899 	call	_getTilePtr
   75C3 F1            [10] 2900 	pop	af
   75C4 F1            [10] 2901 	pop	af
   75C5 4E            [ 7] 2902 	ld	c,(hl)
   75C6 3E 02         [ 7] 2903 	ld	a,#0x02
   75C8 91            [ 4] 2904 	sub	a, c
   75C9 DA 65 76      [10] 2905 	jp	C,00160$
                           2906 ;src/main.c:514: moverEnemigoArriba(enemy);
   75CC DD 6E F1      [19] 2907 	ld	l,-15 (ix)
   75CF DD 66 F2      [19] 2908 	ld	h,-14 (ix)
   75D2 E5            [11] 2909 	push	hl
   75D3 CD 59 6B      [17] 2910 	call	_moverEnemigoArriba
   75D6 F1            [10] 2911 	pop	af
                           2912 ;src/main.c:515: movY = 1;
   75D7 DD 36 EF 01   [19] 2913 	ld	-17 (ix),#0x01
                           2914 ;src/main.c:516: enemy->mover = SI;
   75DB DD 6E F5      [19] 2915 	ld	l,-11 (ix)
   75DE DD 66 F6      [19] 2916 	ld	h,-10 (ix)
   75E1 36 01         [10] 2917 	ld	(hl),#0x01
   75E3 C3 65 76      [10] 2918 	jp	00160$
   75E6                    2919 00159$:
                           2920 ;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75E6 DD 7E FE      [19] 2921 	ld	a,-2 (ix)
   75E9 C6 18         [ 7] 2922 	add	a, #0x18
   75EB 47            [ 4] 2923 	ld	b,a
   75EC C5            [11] 2924 	push	bc
   75ED 33            [ 6] 2925 	inc	sp
   75EE DD 7E FC      [19] 2926 	ld	a,-4 (ix)
   75F1 F5            [11] 2927 	push	af
   75F2 33            [ 6] 2928 	inc	sp
   75F3 2A 03 65      [16] 2929 	ld	hl,(_mapa)
   75F6 E5            [11] 2930 	push	hl
   75F7 CD 61 4B      [17] 2931 	call	_getTilePtr
   75FA F1            [10] 2932 	pop	af
   75FB F1            [10] 2933 	pop	af
   75FC 4E            [ 7] 2934 	ld	c,(hl)
   75FD 3E 02         [ 7] 2935 	ld	a,#0x02
   75FF 91            [ 4] 2936 	sub	a, c
   7600 38 63         [12] 2937 	jr	C,00160$
                           2938 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7602 DD 6E F3      [19] 2939 	ld	l,-13 (ix)
   7605 DD 66 F4      [19] 2940 	ld	h,-12 (ix)
   7608 7E            [ 7] 2941 	ld	a,(hl)
   7609 C6 18         [ 7] 2942 	add	a, #0x18
   760B 57            [ 4] 2943 	ld	d,a
   760C DD 6E F1      [19] 2944 	ld	l,-15 (ix)
   760F DD 66 F2      [19] 2945 	ld	h,-14 (ix)
   7612 46            [ 7] 2946 	ld	b,(hl)
   7613 04            [ 4] 2947 	inc	b
   7614 04            [ 4] 2948 	inc	b
   7615 D5            [11] 2949 	push	de
   7616 33            [ 6] 2950 	inc	sp
   7617 C5            [11] 2951 	push	bc
   7618 33            [ 6] 2952 	inc	sp
   7619 2A 03 65      [16] 2953 	ld	hl,(_mapa)
   761C E5            [11] 2954 	push	hl
   761D CD 61 4B      [17] 2955 	call	_getTilePtr
   7620 F1            [10] 2956 	pop	af
   7621 F1            [10] 2957 	pop	af
   7622 4E            [ 7] 2958 	ld	c,(hl)
   7623 3E 02         [ 7] 2959 	ld	a,#0x02
   7625 91            [ 4] 2960 	sub	a, c
   7626 38 3D         [12] 2961 	jr	C,00160$
                           2962 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7628 DD 6E F3      [19] 2963 	ld	l,-13 (ix)
   762B DD 66 F4      [19] 2964 	ld	h,-12 (ix)
   762E 7E            [ 7] 2965 	ld	a,(hl)
   762F C6 18         [ 7] 2966 	add	a, #0x18
   7631 47            [ 4] 2967 	ld	b,a
   7632 DD 6E F1      [19] 2968 	ld	l,-15 (ix)
   7635 DD 66 F2      [19] 2969 	ld	h,-14 (ix)
   7638 7E            [ 7] 2970 	ld	a,(hl)
   7639 C6 04         [ 7] 2971 	add	a, #0x04
   763B C5            [11] 2972 	push	bc
   763C 33            [ 6] 2973 	inc	sp
   763D F5            [11] 2974 	push	af
   763E 33            [ 6] 2975 	inc	sp
   763F 2A 03 65      [16] 2976 	ld	hl,(_mapa)
   7642 E5            [11] 2977 	push	hl
   7643 CD 61 4B      [17] 2978 	call	_getTilePtr
   7646 F1            [10] 2979 	pop	af
   7647 F1            [10] 2980 	pop	af
   7648 4E            [ 7] 2981 	ld	c,(hl)
   7649 3E 02         [ 7] 2982 	ld	a,#0x02
   764B 91            [ 4] 2983 	sub	a, c
   764C 38 17         [12] 2984 	jr	C,00160$
                           2985 ;src/main.c:522: moverEnemigoAbajo(enemy);
   764E DD 6E F1      [19] 2986 	ld	l,-15 (ix)
   7651 DD 66 F2      [19] 2987 	ld	h,-14 (ix)
   7654 E5            [11] 2988 	push	hl
   7655 CD 78 6B      [17] 2989 	call	_moverEnemigoAbajo
   7658 F1            [10] 2990 	pop	af
                           2991 ;src/main.c:523: movY = 1;
   7659 DD 36 EF 01   [19] 2992 	ld	-17 (ix),#0x01
                           2993 ;src/main.c:524: enemy->mover = SI;
   765D DD 6E F5      [19] 2994 	ld	l,-11 (ix)
   7660 DD 66 F6      [19] 2995 	ld	h,-10 (ix)
   7663 36 01         [10] 2996 	ld	(hl),#0x01
   7665                    2997 00160$:
                           2998 ;src/main.c:527: if (!enemy->mover) {
   7665 DD 6E F5      [19] 2999 	ld	l,-11 (ix)
   7668 DD 66 F6      [19] 3000 	ld	h,-10 (ix)
   766B 7E            [ 7] 3001 	ld	a,(hl)
   766C B7            [ 4] 3002 	or	a, a
   766D C2 30 79      [10] 3003 	jp	NZ,00205$
                           3004 ;src/main.c:528: if (!movX) {
   7670 DD 7E F0      [19] 3005 	ld	a,-16 (ix)
   7673 B7            [ 4] 3006 	or	a, a
   7674 C2 9D 77      [10] 3007 	jp	NZ,00175$
                           3008 ;src/main.c:529: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7677 DD 6E F3      [19] 3009 	ld	l,-13 (ix)
   767A DD 66 F4      [19] 3010 	ld	h,-12 (ix)
   767D 5E            [ 7] 3011 	ld	e,(hl)
                           3012 ;src/main.c:424: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   767E DD 6E F1      [19] 3013 	ld	l,-15 (ix)
   7681 DD 66 F2      [19] 3014 	ld	h,-14 (ix)
   7684 4E            [ 7] 3015 	ld	c,(hl)
                           3016 ;src/main.c:529: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7685 3E 70         [ 7] 3017 	ld	a,#0x70
   7687 93            [ 4] 3018 	sub	a, e
   7688 D2 18 77      [10] 3019 	jp	NC,00172$
                           3020 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   768B 7B            [ 4] 3021 	ld	a,e
   768C C6 18         [ 7] 3022 	add	a, #0x18
   768E 47            [ 4] 3023 	ld	b,a
   768F C5            [11] 3024 	push	bc
   7690 2A 03 65      [16] 3025 	ld	hl,(_mapa)
   7693 E5            [11] 3026 	push	hl
   7694 CD 61 4B      [17] 3027 	call	_getTilePtr
   7697 F1            [10] 3028 	pop	af
   7698 F1            [10] 3029 	pop	af
   7699 4E            [ 7] 3030 	ld	c,(hl)
   769A 3E 02         [ 7] 3031 	ld	a,#0x02
   769C 91            [ 4] 3032 	sub	a, c
   769D 38 63         [12] 3033 	jr	C,00162$
                           3034 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   769F DD 6E F3      [19] 3035 	ld	l,-13 (ix)
   76A2 DD 66 F4      [19] 3036 	ld	h,-12 (ix)
   76A5 7E            [ 7] 3037 	ld	a,(hl)
   76A6 C6 18         [ 7] 3038 	add	a, #0x18
   76A8 57            [ 4] 3039 	ld	d,a
   76A9 DD 6E F1      [19] 3040 	ld	l,-15 (ix)
   76AC DD 66 F2      [19] 3041 	ld	h,-14 (ix)
   76AF 4E            [ 7] 3042 	ld	c,(hl)
   76B0 41            [ 4] 3043 	ld	b,c
   76B1 04            [ 4] 3044 	inc	b
   76B2 04            [ 4] 3045 	inc	b
   76B3 D5            [11] 3046 	push	de
   76B4 33            [ 6] 3047 	inc	sp
   76B5 C5            [11] 3048 	push	bc
   76B6 33            [ 6] 3049 	inc	sp
   76B7 2A 03 65      [16] 3050 	ld	hl,(_mapa)
   76BA E5            [11] 3051 	push	hl
   76BB CD 61 4B      [17] 3052 	call	_getTilePtr
   76BE F1            [10] 3053 	pop	af
   76BF F1            [10] 3054 	pop	af
   76C0 4E            [ 7] 3055 	ld	c,(hl)
   76C1 3E 02         [ 7] 3056 	ld	a,#0x02
   76C3 91            [ 4] 3057 	sub	a, c
   76C4 38 3C         [12] 3058 	jr	C,00162$
                           3059 ;src/main.c:532: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76C6 DD 6E F3      [19] 3060 	ld	l,-13 (ix)
   76C9 DD 66 F4      [19] 3061 	ld	h,-12 (ix)
   76CC 7E            [ 7] 3062 	ld	a,(hl)
   76CD C6 18         [ 7] 3063 	add	a, #0x18
   76CF 47            [ 4] 3064 	ld	b,a
   76D0 DD 6E F1      [19] 3065 	ld	l,-15 (ix)
   76D3 DD 66 F2      [19] 3066 	ld	h,-14 (ix)
   76D6 7E            [ 7] 3067 	ld	a,(hl)
   76D7 C6 04         [ 7] 3068 	add	a, #0x04
   76D9 C5            [11] 3069 	push	bc
   76DA 33            [ 6] 3070 	inc	sp
   76DB F5            [11] 3071 	push	af
   76DC 33            [ 6] 3072 	inc	sp
   76DD 2A 03 65      [16] 3073 	ld	hl,(_mapa)
   76E0 E5            [11] 3074 	push	hl
   76E1 CD 61 4B      [17] 3075 	call	_getTilePtr
   76E4 F1            [10] 3076 	pop	af
   76E5 F1            [10] 3077 	pop	af
   76E6 4E            [ 7] 3078 	ld	c,(hl)
   76E7 3E 02         [ 7] 3079 	ld	a,#0x02
   76E9 91            [ 4] 3080 	sub	a, c
   76EA 38 16         [12] 3081 	jr	C,00162$
                           3082 ;src/main.c:533: moverEnemigoAbajo(enemy);
   76EC DD 6E F1      [19] 3083 	ld	l,-15 (ix)
   76EF DD 66 F2      [19] 3084 	ld	h,-14 (ix)
   76F2 E5            [11] 3085 	push	hl
   76F3 CD 78 6B      [17] 3086 	call	_moverEnemigoAbajo
   76F6 F1            [10] 3087 	pop	af
                           3088 ;src/main.c:534: enemy->mover = SI;
   76F7 DD 6E F5      [19] 3089 	ld	l,-11 (ix)
   76FA DD 66 F6      [19] 3090 	ld	h,-10 (ix)
   76FD 36 01         [10] 3091 	ld	(hl),#0x01
   76FF C3 9D 77      [10] 3092 	jp	00175$
   7702                    3093 00162$:
                           3094 ;src/main.c:536: moverEnemigoArriba(enemy);
   7702 DD 6E F1      [19] 3095 	ld	l,-15 (ix)
   7705 DD 66 F2      [19] 3096 	ld	h,-14 (ix)
   7708 E5            [11] 3097 	push	hl
   7709 CD 59 6B      [17] 3098 	call	_moverEnemigoArriba
   770C F1            [10] 3099 	pop	af
                           3100 ;src/main.c:537: enemy->mover = SI;
   770D DD 6E F5      [19] 3101 	ld	l,-11 (ix)
   7710 DD 66 F6      [19] 3102 	ld	h,-10 (ix)
   7713 36 01         [10] 3103 	ld	(hl),#0x01
   7715 C3 9D 77      [10] 3104 	jp	00175$
   7718                    3105 00172$:
                           3106 ;src/main.c:540: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7718 43            [ 4] 3107 	ld	b,e
   7719 05            [ 4] 3108 	dec	b
   771A 05            [ 4] 3109 	dec	b
   771B C5            [11] 3110 	push	bc
   771C 2A 03 65      [16] 3111 	ld	hl,(_mapa)
   771F E5            [11] 3112 	push	hl
   7720 CD 61 4B      [17] 3113 	call	_getTilePtr
   7723 F1            [10] 3114 	pop	af
   7724 F1            [10] 3115 	pop	af
   7725 4E            [ 7] 3116 	ld	c,(hl)
   7726 3E 02         [ 7] 3117 	ld	a,#0x02
   7728 91            [ 4] 3118 	sub	a, c
   7729 38 5F         [12] 3119 	jr	C,00167$
                           3120 ;src/main.c:541: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   772B DD 6E F3      [19] 3121 	ld	l,-13 (ix)
   772E DD 66 F4      [19] 3122 	ld	h,-12 (ix)
   7731 56            [ 7] 3123 	ld	d,(hl)
   7732 15            [ 4] 3124 	dec	d
   7733 15            [ 4] 3125 	dec	d
   7734 DD 6E F1      [19] 3126 	ld	l,-15 (ix)
   7737 DD 66 F2      [19] 3127 	ld	h,-14 (ix)
   773A 46            [ 7] 3128 	ld	b,(hl)
   773B 04            [ 4] 3129 	inc	b
   773C 04            [ 4] 3130 	inc	b
   773D D5            [11] 3131 	push	de
   773E 33            [ 6] 3132 	inc	sp
   773F C5            [11] 3133 	push	bc
   7740 33            [ 6] 3134 	inc	sp
   7741 2A 03 65      [16] 3135 	ld	hl,(_mapa)
   7744 E5            [11] 3136 	push	hl
   7745 CD 61 4B      [17] 3137 	call	_getTilePtr
   7748 F1            [10] 3138 	pop	af
   7749 F1            [10] 3139 	pop	af
   774A 4E            [ 7] 3140 	ld	c,(hl)
   774B 3E 02         [ 7] 3141 	ld	a,#0x02
   774D 91            [ 4] 3142 	sub	a, c
   774E 38 3A         [12] 3143 	jr	C,00167$
                           3144 ;src/main.c:542: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7750 DD 6E F3      [19] 3145 	ld	l,-13 (ix)
   7753 DD 66 F4      [19] 3146 	ld	h,-12 (ix)
   7756 46            [ 7] 3147 	ld	b,(hl)
   7757 05            [ 4] 3148 	dec	b
   7758 05            [ 4] 3149 	dec	b
   7759 DD 6E F1      [19] 3150 	ld	l,-15 (ix)
   775C DD 66 F2      [19] 3151 	ld	h,-14 (ix)
   775F 7E            [ 7] 3152 	ld	a,(hl)
   7760 C6 04         [ 7] 3153 	add	a, #0x04
   7762 C5            [11] 3154 	push	bc
   7763 33            [ 6] 3155 	inc	sp
   7764 F5            [11] 3156 	push	af
   7765 33            [ 6] 3157 	inc	sp
   7766 2A 03 65      [16] 3158 	ld	hl,(_mapa)
   7769 E5            [11] 3159 	push	hl
   776A CD 61 4B      [17] 3160 	call	_getTilePtr
   776D F1            [10] 3161 	pop	af
   776E F1            [10] 3162 	pop	af
   776F 4E            [ 7] 3163 	ld	c,(hl)
   7770 3E 02         [ 7] 3164 	ld	a,#0x02
   7772 91            [ 4] 3165 	sub	a, c
   7773 38 15         [12] 3166 	jr	C,00167$
                           3167 ;src/main.c:543: moverEnemigoArriba(enemy);
   7775 DD 6E F1      [19] 3168 	ld	l,-15 (ix)
   7778 DD 66 F2      [19] 3169 	ld	h,-14 (ix)
   777B E5            [11] 3170 	push	hl
   777C CD 59 6B      [17] 3171 	call	_moverEnemigoArriba
   777F F1            [10] 3172 	pop	af
                           3173 ;src/main.c:544: enemy->mover = SI;
   7780 DD 6E F5      [19] 3174 	ld	l,-11 (ix)
   7783 DD 66 F6      [19] 3175 	ld	h,-10 (ix)
   7786 36 01         [10] 3176 	ld	(hl),#0x01
   7788 18 13         [12] 3177 	jr	00175$
   778A                    3178 00167$:
                           3179 ;src/main.c:546: moverEnemigoAbajo(enemy);
   778A DD 6E F1      [19] 3180 	ld	l,-15 (ix)
   778D DD 66 F2      [19] 3181 	ld	h,-14 (ix)
   7790 E5            [11] 3182 	push	hl
   7791 CD 78 6B      [17] 3183 	call	_moverEnemigoAbajo
   7794 F1            [10] 3184 	pop	af
                           3185 ;src/main.c:547: enemy->mover = SI;
   7795 DD 6E F5      [19] 3186 	ld	l,-11 (ix)
   7798 DD 66 F6      [19] 3187 	ld	h,-10 (ix)
   779B 36 01         [10] 3188 	ld	(hl),#0x01
   779D                    3189 00175$:
                           3190 ;src/main.c:552: if (!movY) {
   779D DD 7E EF      [19] 3191 	ld	a,-17 (ix)
   77A0 B7            [ 4] 3192 	or	a, a
   77A1 C2 30 79      [10] 3193 	jp	NZ,00205$
                           3194 ;src/main.c:553: if (enemy->x < ANCHO_PANTALLA/2) {
   77A4 DD 6E F1      [19] 3195 	ld	l,-15 (ix)
   77A7 DD 66 F2      [19] 3196 	ld	h,-14 (ix)
   77AA 7E            [ 7] 3197 	ld	a,(hl)
   77AB DD 77 FE      [19] 3198 	ld	-2 (ix),a
                           3199 ;src/main.c:425: u8 dify = abs(enemy->y - prota.y);
   77AE DD 6E F3      [19] 3200 	ld	l,-13 (ix)
   77B1 DD 66 F4      [19] 3201 	ld	h,-12 (ix)
   77B4 7E            [ 7] 3202 	ld	a,(hl)
   77B5 DD 77 FC      [19] 3203 	ld	-4 (ix),a
                           3204 ;src/main.c:553: if (enemy->x < ANCHO_PANTALLA/2) {
   77B8 DD 7E FE      [19] 3205 	ld	a,-2 (ix)
   77BB D6 28         [ 7] 3206 	sub	a, #0x28
   77BD D2 85 78      [10] 3207 	jp	NC,00187$
                           3208 ;src/main.c:554: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   77C0 DD 66 FC      [19] 3209 	ld	h,-4 (ix)
   77C3 DD 6E FE      [19] 3210 	ld	l,-2 (ix)
   77C6 E5            [11] 3211 	push	hl
   77C7 2A 03 65      [16] 3212 	ld	hl,(_mapa)
   77CA E5            [11] 3213 	push	hl
   77CB CD 61 4B      [17] 3214 	call	_getTilePtr
   77CE F1            [10] 3215 	pop	af
   77CF F1            [10] 3216 	pop	af
   77D0 DD 74 FB      [19] 3217 	ld	-5 (ix),h
   77D3 DD 75 FA      [19] 3218 	ld	-6 (ix), l
   77D6 DD 66 FB      [19] 3219 	ld	h,-5 (ix)
   77D9 7E            [ 7] 3220 	ld	a,(hl)
   77DA DD 77 FA      [19] 3221 	ld	-6 (ix),a
   77DD 3E 02         [ 7] 3222 	ld	a,#0x02
   77DF DD 96 FA      [19] 3223 	sub	a, -6 (ix)
   77E2 DA 6F 78      [10] 3224 	jp	C,00177$
                           3225 ;src/main.c:555: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   77E5 DD 6E F3      [19] 3226 	ld	l,-13 (ix)
   77E8 DD 66 F4      [19] 3227 	ld	h,-12 (ix)
   77EB 7E            [ 7] 3228 	ld	a,(hl)
   77EC C6 0B         [ 7] 3229 	add	a, #0x0B
   77EE DD 77 FA      [19] 3230 	ld	-6 (ix),a
   77F1 DD 6E F1      [19] 3231 	ld	l,-15 (ix)
   77F4 DD 66 F2      [19] 3232 	ld	h,-14 (ix)
   77F7 7E            [ 7] 3233 	ld	a,(hl)
   77F8 DD 77 F9      [19] 3234 	ld	-7 (ix),a
   77FB DD 66 FA      [19] 3235 	ld	h,-6 (ix)
   77FE DD 6E F9      [19] 3236 	ld	l,-7 (ix)
   7801 E5            [11] 3237 	push	hl
   7802 2A 03 65      [16] 3238 	ld	hl,(_mapa)
   7805 E5            [11] 3239 	push	hl
   7806 CD 61 4B      [17] 3240 	call	_getTilePtr
   7809 F1            [10] 3241 	pop	af
   780A F1            [10] 3242 	pop	af
   780B DD 74 FB      [19] 3243 	ld	-5 (ix),h
   780E DD 75 FA      [19] 3244 	ld	-6 (ix), l
   7811 DD 66 FB      [19] 3245 	ld	h,-5 (ix)
   7814 7E            [ 7] 3246 	ld	a,(hl)
   7815 DD 77 FA      [19] 3247 	ld	-6 (ix),a
   7818 3E 02         [ 7] 3248 	ld	a,#0x02
   781A DD 96 FA      [19] 3249 	sub	a, -6 (ix)
   781D 38 50         [12] 3250 	jr	C,00177$
                           3251 ;src/main.c:556: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   781F DD 6E F3      [19] 3252 	ld	l,-13 (ix)
   7822 DD 66 F4      [19] 3253 	ld	h,-12 (ix)
   7825 7E            [ 7] 3254 	ld	a,(hl)
   7826 C6 16         [ 7] 3255 	add	a, #0x16
   7828 DD 77 FA      [19] 3256 	ld	-6 (ix),a
   782B DD 6E F1      [19] 3257 	ld	l,-15 (ix)
   782E DD 66 F2      [19] 3258 	ld	h,-14 (ix)
   7831 7E            [ 7] 3259 	ld	a,(hl)
   7832 DD 77 F9      [19] 3260 	ld	-7 (ix),a
   7835 DD 66 FA      [19] 3261 	ld	h,-6 (ix)
   7838 DD 6E F9      [19] 3262 	ld	l,-7 (ix)
   783B E5            [11] 3263 	push	hl
   783C 2A 03 65      [16] 3264 	ld	hl,(_mapa)
   783F E5            [11] 3265 	push	hl
   7840 CD 61 4B      [17] 3266 	call	_getTilePtr
   7843 F1            [10] 3267 	pop	af
   7844 F1            [10] 3268 	pop	af
   7845 DD 74 FB      [19] 3269 	ld	-5 (ix),h
   7848 DD 75 FA      [19] 3270 	ld	-6 (ix), l
   784B DD 66 FB      [19] 3271 	ld	h,-5 (ix)
   784E 7E            [ 7] 3272 	ld	a,(hl)
   784F DD 77 FA      [19] 3273 	ld	-6 (ix),a
   7852 3E 02         [ 7] 3274 	ld	a,#0x02
   7854 DD 96 FA      [19] 3275 	sub	a, -6 (ix)
   7857 38 16         [12] 3276 	jr	C,00177$
                           3277 ;src/main.c:557: moverEnemigoIzquierda(enemy);
   7859 DD 6E F1      [19] 3278 	ld	l,-15 (ix)
   785C DD 66 F2      [19] 3279 	ld	h,-14 (ix)
   785F E5            [11] 3280 	push	hl
   7860 CD A7 6B      [17] 3281 	call	_moverEnemigoIzquierda
   7863 F1            [10] 3282 	pop	af
                           3283 ;src/main.c:558: enemy->mover = SI;
   7864 DD 6E F5      [19] 3284 	ld	l,-11 (ix)
   7867 DD 66 F6      [19] 3285 	ld	h,-10 (ix)
   786A 36 01         [10] 3286 	ld	(hl),#0x01
   786C C3 30 79      [10] 3287 	jp	00205$
   786F                    3288 00177$:
                           3289 ;src/main.c:560: moverEnemigoDerecha(enemy);
   786F DD 6E F1      [19] 3290 	ld	l,-15 (ix)
   7872 DD 66 F2      [19] 3291 	ld	h,-14 (ix)
   7875 E5            [11] 3292 	push	hl
   7876 CD 97 6B      [17] 3293 	call	_moverEnemigoDerecha
   7879 F1            [10] 3294 	pop	af
                           3295 ;src/main.c:561: enemy->mover = SI;
   787A DD 6E F5      [19] 3296 	ld	l,-11 (ix)
   787D DD 66 F6      [19] 3297 	ld	h,-10 (ix)
   7880 36 01         [10] 3298 	ld	(hl),#0x01
   7882 C3 30 79      [10] 3299 	jp	00205$
   7885                    3300 00187$:
                           3301 ;src/main.c:564: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7885 DD 7E FE      [19] 3302 	ld	a,-2 (ix)
   7888 C6 04         [ 7] 3303 	add	a, #0x04
   788A DD 77 FE      [19] 3304 	ld	-2 (ix),a
   788D DD 66 FC      [19] 3305 	ld	h,-4 (ix)
   7890 DD 6E FE      [19] 3306 	ld	l,-2 (ix)
   7893 E5            [11] 3307 	push	hl
   7894 2A 03 65      [16] 3308 	ld	hl,(_mapa)
   7897 E5            [11] 3309 	push	hl
   7898 CD 61 4B      [17] 3310 	call	_getTilePtr
   789B F1            [10] 3311 	pop	af
   789C F1            [10] 3312 	pop	af
   789D DD 74 FF      [19] 3313 	ld	-1 (ix),h
   78A0 DD 75 FE      [19] 3314 	ld	-2 (ix), l
   78A3 DD 66 FF      [19] 3315 	ld	h,-1 (ix)
   78A6 7E            [ 7] 3316 	ld	a,(hl)
   78A7 DD 77 FE      [19] 3317 	ld	-2 (ix),a
   78AA 3E 02         [ 7] 3318 	ld	a,#0x02
   78AC DD 96 FE      [19] 3319 	sub	a, -2 (ix)
   78AF 38 6C         [12] 3320 	jr	C,00182$
                           3321 ;src/main.c:565: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78B1 DD 6E F3      [19] 3322 	ld	l,-13 (ix)
   78B4 DD 66 F4      [19] 3323 	ld	h,-12 (ix)
   78B7 7E            [ 7] 3324 	ld	a,(hl)
   78B8 C6 0B         [ 7] 3325 	add	a, #0x0B
   78BA DD 77 FE      [19] 3326 	ld	-2 (ix),a
   78BD DD 6E F1      [19] 3327 	ld	l,-15 (ix)
   78C0 DD 66 F2      [19] 3328 	ld	h,-14 (ix)
   78C3 7E            [ 7] 3329 	ld	a,(hl)
   78C4 DD 77 FC      [19] 3330 	ld	-4 (ix), a
   78C7 C6 04         [ 7] 3331 	add	a, #0x04
   78C9 DD 77 FC      [19] 3332 	ld	-4 (ix),a
   78CC DD 66 FE      [19] 3333 	ld	h,-2 (ix)
   78CF DD 6E FC      [19] 3334 	ld	l,-4 (ix)
   78D2 E5            [11] 3335 	push	hl
   78D3 2A 03 65      [16] 3336 	ld	hl,(_mapa)
   78D6 E5            [11] 3337 	push	hl
   78D7 CD 61 4B      [17] 3338 	call	_getTilePtr
   78DA F1            [10] 3339 	pop	af
   78DB F1            [10] 3340 	pop	af
   78DC 4E            [ 7] 3341 	ld	c,(hl)
   78DD 3E 02         [ 7] 3342 	ld	a,#0x02
   78DF 91            [ 4] 3343 	sub	a, c
   78E0 38 3B         [12] 3344 	jr	C,00182$
                           3345 ;src/main.c:566: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78E2 DD 6E F3      [19] 3346 	ld	l,-13 (ix)
   78E5 DD 66 F4      [19] 3347 	ld	h,-12 (ix)
   78E8 7E            [ 7] 3348 	ld	a,(hl)
   78E9 C6 16         [ 7] 3349 	add	a, #0x16
   78EB 4F            [ 4] 3350 	ld	c,a
   78EC DD 6E F1      [19] 3351 	ld	l,-15 (ix)
   78EF DD 66 F2      [19] 3352 	ld	h,-14 (ix)
   78F2 5E            [ 7] 3353 	ld	e,(hl)
   78F3 1C            [ 4] 3354 	inc	e
   78F4 1C            [ 4] 3355 	inc	e
   78F5 1C            [ 4] 3356 	inc	e
   78F6 1C            [ 4] 3357 	inc	e
   78F7 51            [ 4] 3358 	ld	d, c
   78F8 D5            [11] 3359 	push	de
   78F9 2A 03 65      [16] 3360 	ld	hl,(_mapa)
   78FC E5            [11] 3361 	push	hl
   78FD CD 61 4B      [17] 3362 	call	_getTilePtr
   7900 F1            [10] 3363 	pop	af
   7901 F1            [10] 3364 	pop	af
   7902 4E            [ 7] 3365 	ld	c,(hl)
   7903 3E 02         [ 7] 3366 	ld	a,#0x02
   7905 91            [ 4] 3367 	sub	a, c
   7906 38 15         [12] 3368 	jr	C,00182$
                           3369 ;src/main.c:567: moverEnemigoDerecha(enemy);
   7908 DD 6E F1      [19] 3370 	ld	l,-15 (ix)
   790B DD 66 F2      [19] 3371 	ld	h,-14 (ix)
   790E E5            [11] 3372 	push	hl
   790F CD 97 6B      [17] 3373 	call	_moverEnemigoDerecha
   7912 F1            [10] 3374 	pop	af
                           3375 ;src/main.c:568: enemy->mover = SI;
   7913 DD 6E F5      [19] 3376 	ld	l,-11 (ix)
   7916 DD 66 F6      [19] 3377 	ld	h,-10 (ix)
   7919 36 01         [10] 3378 	ld	(hl),#0x01
   791B 18 13         [12] 3379 	jr	00205$
   791D                    3380 00182$:
                           3381 ;src/main.c:571: moverEnemigoIzquierda(enemy);
   791D DD 6E F1      [19] 3382 	ld	l,-15 (ix)
   7920 DD 66 F2      [19] 3383 	ld	h,-14 (ix)
   7923 E5            [11] 3384 	push	hl
   7924 CD A7 6B      [17] 3385 	call	_moverEnemigoIzquierda
   7927 F1            [10] 3386 	pop	af
                           3387 ;src/main.c:572: enemy->mover = SI;
   7928 DD 6E F5      [19] 3388 	ld	l,-11 (ix)
   792B DD 66 F6      [19] 3389 	ld	h,-10 (ix)
   792E 36 01         [10] 3390 	ld	(hl),#0x01
   7930                    3391 00205$:
   7930 DD F9         [10] 3392 	ld	sp, ix
   7932 DD E1         [14] 3393 	pop	ix
   7934 C9            [10] 3394 	ret
                           3395 ;src/main.c:582: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3396 ;	---------------------------------
                           3397 ; Function updateEnemy
                           3398 ; ---------------------------------
   7935                    3399 _updateEnemy::
   7935 DD E5         [15] 3400 	push	ix
   7937 DD 21 00 00   [14] 3401 	ld	ix,#0
   793B DD 39         [15] 3402 	add	ix,sp
   793D 21 F4 FF      [10] 3403 	ld	hl,#-12
   7940 39            [11] 3404 	add	hl,sp
   7941 F9            [ 6] 3405 	ld	sp,hl
                           3406 ;src/main.c:589: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7942 DD 4E 04      [19] 3407 	ld	c,4 (ix)
   7945 DD 46 05      [19] 3408 	ld	b,5 (ix)
   7948 21 15 00      [10] 3409 	ld	hl,#0x0015
   794B 09            [11] 3410 	add	hl,bc
   794C E3            [19] 3411 	ex	(sp), hl
   794D E1            [10] 3412 	pop	hl
   794E E5            [11] 3413 	push	hl
   794F 7E            [ 7] 3414 	ld	a,(hl)
   7950 B7            [ 4] 3415 	or	a, a
   7951 28 19         [12] 3416 	jr	Z,00115$
                           3417 ;src/main.c:590: enemy->patrolling = 0;
   7953 21 A7 60      [10] 3418 	ld	hl,#(_enemy + 0x000a)
   7956 36 00         [10] 3419 	ld	(hl),#0x00
                           3420 ;src/main.c:591: engage(actual, prota.x, prota.y);
   7958 3A 26 64      [13] 3421 	ld	a, (#_prota + 1)
   795B 21 25 64      [10] 3422 	ld	hl, #_prota + 0
   795E 56            [ 7] 3423 	ld	d,(hl)
   795F F5            [11] 3424 	push	af
   7960 33            [ 6] 3425 	inc	sp
   7961 D5            [11] 3426 	push	de
   7962 33            [ 6] 3427 	inc	sp
   7963 C5            [11] 3428 	push	bc
   7964 CD BE 70      [17] 3429 	call	_engage
   7967 F1            [10] 3430 	pop	af
   7968 F1            [10] 3431 	pop	af
   7969 C3 8C 7A      [10] 3432 	jp	00117$
   796C                    3433 00115$:
                           3434 ;src/main.c:593: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   796C C5            [11] 3435 	push	bc
   796D C5            [11] 3436 	push	bc
   796E CD 06 6E      [17] 3437 	call	_lookFor
   7971 F1            [10] 3438 	pop	af
   7972 C1            [10] 3439 	pop	bc
                           3440 ;src/main.c:599: actual->patrolling = 0;
   7973 21 0A 00      [10] 3441 	ld	hl,#0x000A
   7976 09            [11] 3442 	add	hl,bc
   7977 DD 75 FB      [19] 3443 	ld	-5 (ix),l
   797A DD 74 FC      [19] 3444 	ld	-4 (ix),h
                           3445 ;src/main.c:594: if (actual->patrolling) {
   797D DD 6E FB      [19] 3446 	ld	l,-5 (ix)
   7980 DD 66 FC      [19] 3447 	ld	h,-4 (ix)
   7983 6E            [ 7] 3448 	ld	l,(hl)
                           3449 ;src/main.c:597: if (actual->in_range) {
   7984 79            [ 4] 3450 	ld	a,c
   7985 C6 10         [ 7] 3451 	add	a, #0x10
   7987 5F            [ 4] 3452 	ld	e,a
   7988 78            [ 4] 3453 	ld	a,b
   7989 CE 00         [ 7] 3454 	adc	a, #0x00
   798B 57            [ 4] 3455 	ld	d,a
                           3456 ;src/main.c:605: actual->seek = 1;
   798C 79            [ 4] 3457 	ld	a,c
   798D C6 13         [ 7] 3458 	add	a, #0x13
   798F DD 77 F8      [19] 3459 	ld	-8 (ix),a
   7992 78            [ 4] 3460 	ld	a,b
   7993 CE 00         [ 7] 3461 	adc	a, #0x00
   7995 DD 77 F9      [19] 3462 	ld	-7 (ix),a
                           3463 ;src/main.c:594: if (actual->patrolling) {
   7998 7D            [ 4] 3464 	ld	a,l
   7999 B7            [ 4] 3465 	or	a, a
   799A CA 58 7A      [10] 3466 	jp	Z,00112$
                           3467 ;src/main.c:596: moverEnemigoPatrol(actual);
   799D C5            [11] 3468 	push	bc
   799E D5            [11] 3469 	push	de
   799F C5            [11] 3470 	push	bc
   79A0 CD B9 6B      [17] 3471 	call	_moverEnemigoPatrol
   79A3 F1            [10] 3472 	pop	af
   79A4 D1            [10] 3473 	pop	de
   79A5 C1            [10] 3474 	pop	bc
                           3475 ;src/main.c:597: if (actual->in_range) {
   79A6 1A            [ 7] 3476 	ld	a,(de)
   79A7 B7            [ 4] 3477 	or	a, a
   79A8 28 20         [12] 3478 	jr	Z,00104$
                           3479 ;src/main.c:598: engage(actual, prota.x, prota.y);
   79AA 3A 26 64      [13] 3480 	ld	a, (#_prota + 1)
   79AD 21 25 64      [10] 3481 	ld	hl, #_prota + 0
   79B0 56            [ 7] 3482 	ld	d,(hl)
   79B1 F5            [11] 3483 	push	af
   79B2 33            [ 6] 3484 	inc	sp
   79B3 D5            [11] 3485 	push	de
   79B4 33            [ 6] 3486 	inc	sp
   79B5 C5            [11] 3487 	push	bc
   79B6 CD BE 70      [17] 3488 	call	_engage
   79B9 F1            [10] 3489 	pop	af
   79BA F1            [10] 3490 	pop	af
                           3491 ;src/main.c:599: actual->patrolling = 0;
   79BB DD 6E FB      [19] 3492 	ld	l,-5 (ix)
   79BE DD 66 FC      [19] 3493 	ld	h,-4 (ix)
   79C1 36 00         [10] 3494 	ld	(hl),#0x00
                           3495 ;src/main.c:600: actual->engage = 1;
   79C3 E1            [10] 3496 	pop	hl
   79C4 E5            [11] 3497 	push	hl
   79C5 36 01         [10] 3498 	ld	(hl),#0x01
   79C7 C3 8C 7A      [10] 3499 	jp	00117$
   79CA                    3500 00104$:
                           3501 ;src/main.c:601: } else if (actual->seen) {
   79CA 21 11 00      [10] 3502 	ld	hl,#0x0011
   79CD 09            [11] 3503 	add	hl,bc
   79CE DD 75 FD      [19] 3504 	ld	-3 (ix),l
   79D1 DD 74 FE      [19] 3505 	ld	-2 (ix),h
   79D4 DD 6E FD      [19] 3506 	ld	l,-3 (ix)
   79D7 DD 66 FE      [19] 3507 	ld	h,-2 (ix)
   79DA 7E            [ 7] 3508 	ld	a,(hl)
   79DB B7            [ 4] 3509 	or	a, a
   79DC CA 8C 7A      [10] 3510 	jp	Z,00117$
                           3511 ;src/main.c:602: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79DF 3A 26 64      [13] 3512 	ld	a,(#_prota + 1)
   79E2 DD 77 FA      [19] 3513 	ld	-6 (ix),a
   79E5 21 25 64      [10] 3514 	ld	hl, #_prota + 0
   79E8 5E            [ 7] 3515 	ld	e,(hl)
   79E9 21 01 00      [10] 3516 	ld	hl,#0x0001
   79EC 09            [11] 3517 	add	hl,bc
   79ED DD 75 F6      [19] 3518 	ld	-10 (ix),l
   79F0 DD 74 F7      [19] 3519 	ld	-9 (ix),h
   79F3 DD 6E F6      [19] 3520 	ld	l,-10 (ix)
   79F6 DD 66 F7      [19] 3521 	ld	h,-9 (ix)
   79F9 56            [ 7] 3522 	ld	d,(hl)
   79FA 0A            [ 7] 3523 	ld	a,(bc)
   79FB DD 77 FF      [19] 3524 	ld	-1 (ix),a
   79FE C5            [11] 3525 	push	bc
   79FF 2A 03 65      [16] 3526 	ld	hl,(_mapa)
   7A02 E5            [11] 3527 	push	hl
   7A03 C5            [11] 3528 	push	bc
   7A04 DD 7E FA      [19] 3529 	ld	a,-6 (ix)
   7A07 F5            [11] 3530 	push	af
   7A08 33            [ 6] 3531 	inc	sp
   7A09 7B            [ 4] 3532 	ld	a,e
   7A0A F5            [11] 3533 	push	af
   7A0B 33            [ 6] 3534 	inc	sp
   7A0C D5            [11] 3535 	push	de
   7A0D 33            [ 6] 3536 	inc	sp
   7A0E DD 7E FF      [19] 3537 	ld	a,-1 (ix)
   7A11 F5            [11] 3538 	push	af
   7A12 33            [ 6] 3539 	inc	sp
   7A13 CD 30 44      [17] 3540 	call	_pathFinding
   7A16 21 08 00      [10] 3541 	ld	hl,#8
   7A19 39            [11] 3542 	add	hl,sp
   7A1A F9            [ 6] 3543 	ld	sp,hl
   7A1B C1            [10] 3544 	pop	bc
                           3545 ;src/main.c:603: actual->p_seek_x = actual->x;
   7A1C 21 17 00      [10] 3546 	ld	hl,#0x0017
   7A1F 09            [11] 3547 	add	hl,bc
   7A20 EB            [ 4] 3548 	ex	de,hl
   7A21 0A            [ 7] 3549 	ld	a,(bc)
   7A22 12            [ 7] 3550 	ld	(de),a
                           3551 ;src/main.c:604: actual->p_seek_y = actual->y;
   7A23 21 18 00      [10] 3552 	ld	hl,#0x0018
   7A26 09            [11] 3553 	add	hl,bc
   7A27 EB            [ 4] 3554 	ex	de,hl
   7A28 DD 6E F6      [19] 3555 	ld	l,-10 (ix)
   7A2B DD 66 F7      [19] 3556 	ld	h,-9 (ix)
   7A2E 7E            [ 7] 3557 	ld	a,(hl)
   7A2F 12            [ 7] 3558 	ld	(de),a
                           3559 ;src/main.c:605: actual->seek = 1;
   7A30 DD 6E F8      [19] 3560 	ld	l,-8 (ix)
   7A33 DD 66 F9      [19] 3561 	ld	h,-7 (ix)
   7A36 36 01         [10] 3562 	ld	(hl),#0x01
                           3563 ;src/main.c:606: actual->iter=0;
   7A38 21 0D 00      [10] 3564 	ld	hl,#0x000D
   7A3B 09            [11] 3565 	add	hl,bc
   7A3C AF            [ 4] 3566 	xor	a, a
   7A3D 77            [ 7] 3567 	ld	(hl), a
   7A3E 23            [ 6] 3568 	inc	hl
   7A3F 77            [ 7] 3569 	ld	(hl), a
                           3570 ;src/main.c:607: actual->reversePatrol = NO;
   7A40 21 0B 00      [10] 3571 	ld	hl,#0x000B
   7A43 09            [11] 3572 	add	hl,bc
   7A44 36 00         [10] 3573 	ld	(hl),#0x00
                           3574 ;src/main.c:608: actual->patrolling = 0;
   7A46 DD 6E FB      [19] 3575 	ld	l,-5 (ix)
   7A49 DD 66 FC      [19] 3576 	ld	h,-4 (ix)
   7A4C 36 00         [10] 3577 	ld	(hl),#0x00
                           3578 ;src/main.c:609: actual->seen = 0;
   7A4E DD 6E FD      [19] 3579 	ld	l,-3 (ix)
   7A51 DD 66 FE      [19] 3580 	ld	h,-2 (ix)
   7A54 36 00         [10] 3581 	ld	(hl),#0x00
   7A56 18 34         [12] 3582 	jr	00117$
   7A58                    3583 00112$:
                           3584 ;src/main.c:611: } else if (actual->seek) {
   7A58 DD 6E F8      [19] 3585 	ld	l,-8 (ix)
   7A5B DD 66 F9      [19] 3586 	ld	h,-7 (ix)
   7A5E 7E            [ 7] 3587 	ld	a,(hl)
   7A5F B7            [ 4] 3588 	or	a, a
   7A60 28 2A         [12] 3589 	jr	Z,00117$
                           3590 ;src/main.c:612: moverEnemigoSeek(actual);
   7A62 C5            [11] 3591 	push	bc
   7A63 D5            [11] 3592 	push	de
   7A64 C5            [11] 3593 	push	bc
   7A65 CD 0C 6F      [17] 3594 	call	_moverEnemigoSeek
   7A68 F1            [10] 3595 	pop	af
   7A69 D1            [10] 3596 	pop	de
   7A6A C1            [10] 3597 	pop	bc
                           3598 ;src/main.c:613: if (actual->in_range) {
   7A6B 1A            [ 7] 3599 	ld	a,(de)
   7A6C B7            [ 4] 3600 	or	a, a
   7A6D 28 1D         [12] 3601 	jr	Z,00117$
                           3602 ;src/main.c:614: engage(actual, prota.x, prota.y);
   7A6F 3A 26 64      [13] 3603 	ld	a, (#_prota + 1)
   7A72 21 25 64      [10] 3604 	ld	hl, #_prota + 0
   7A75 56            [ 7] 3605 	ld	d,(hl)
   7A76 F5            [11] 3606 	push	af
   7A77 33            [ 6] 3607 	inc	sp
   7A78 D5            [11] 3608 	push	de
   7A79 33            [ 6] 3609 	inc	sp
   7A7A C5            [11] 3610 	push	bc
   7A7B CD BE 70      [17] 3611 	call	_engage
   7A7E F1            [10] 3612 	pop	af
   7A7F F1            [10] 3613 	pop	af
                           3614 ;src/main.c:615: actual->seek = 0;
   7A80 DD 6E F8      [19] 3615 	ld	l,-8 (ix)
   7A83 DD 66 F9      [19] 3616 	ld	h,-7 (ix)
   7A86 36 00         [10] 3617 	ld	(hl),#0x00
                           3618 ;src/main.c:616: actual->engage = 1;
   7A88 E1            [10] 3619 	pop	hl
   7A89 E5            [11] 3620 	push	hl
   7A8A 36 01         [10] 3621 	ld	(hl),#0x01
                           3622 ;src/main.c:617: } else if (actual->seen) {
   7A8C                    3623 00117$:
   7A8C DD F9         [10] 3624 	ld	sp, ix
   7A8E DD E1         [14] 3625 	pop	ix
   7A90 C9            [10] 3626 	ret
                           3627 ;src/main.c:624: void inicializarEnemy() {
                           3628 ;	---------------------------------
                           3629 ; Function inicializarEnemy
                           3630 ; ---------------------------------
   7A91                    3631 _inicializarEnemy::
   7A91 DD E5         [15] 3632 	push	ix
   7A93 DD 21 00 00   [14] 3633 	ld	ix,#0
   7A97 DD 39         [15] 3634 	add	ix,sp
   7A99 21 F9 FF      [10] 3635 	ld	hl,#-7
   7A9C 39            [11] 3636 	add	hl,sp
   7A9D F9            [ 6] 3637 	ld	sp,hl
                           3638 ;src/main.c:625: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7A9E 3A 05 65      [13] 3639 	ld	a,(#_num_mapa + 0)
   7AA1 C6 02         [ 7] 3640 	add	a, #0x02
   7AA3 DD 77 F9      [19] 3641 	ld	-7 (ix),a
                           3642 ;src/main.c:635: actual = enemy;
   7AA6 11 9D 60      [10] 3643 	ld	de,#_enemy+0
                           3644 ;src/main.c:636: while(i){
   7AA9                    3645 00101$:
   7AA9 DD 7E F9      [19] 3646 	ld	a,-7 (ix)
   7AAC B7            [ 4] 3647 	or	a, a
   7AAD CA AB 7B      [10] 3648 	jp	Z,00104$
                           3649 ;src/main.c:637: --i;
   7AB0 DD 35 F9      [23] 3650 	dec	-7 (ix)
                           3651 ;src/main.c:638: actual->x = actual->px = spawnX[i];
   7AB3 4B            [ 4] 3652 	ld	c, e
   7AB4 42            [ 4] 3653 	ld	b, d
   7AB5 03            [ 6] 3654 	inc	bc
   7AB6 03            [ 6] 3655 	inc	bc
   7AB7 3E 27         [ 7] 3656 	ld	a,#<(_spawnX)
   7AB9 DD 86 F9      [19] 3657 	add	a, -7 (ix)
   7ABC DD 77 FE      [19] 3658 	ld	-2 (ix),a
   7ABF 3E 65         [ 7] 3659 	ld	a,#>(_spawnX)
   7AC1 CE 00         [ 7] 3660 	adc	a, #0x00
   7AC3 DD 77 FF      [19] 3661 	ld	-1 (ix),a
   7AC6 DD 6E FE      [19] 3662 	ld	l,-2 (ix)
   7AC9 DD 66 FF      [19] 3663 	ld	h,-1 (ix)
   7ACC 7E            [ 7] 3664 	ld	a,(hl)
   7ACD 02            [ 7] 3665 	ld	(bc),a
   7ACE 12            [ 7] 3666 	ld	(de),a
                           3667 ;src/main.c:639: actual->y = actual->py = spawnY[i];
   7ACF D5            [11] 3668 	push	de
   7AD0 FD E1         [14] 3669 	pop	iy
   7AD2 FD 23         [10] 3670 	inc	iy
   7AD4 4B            [ 4] 3671 	ld	c, e
   7AD5 42            [ 4] 3672 	ld	b, d
   7AD6 03            [ 6] 3673 	inc	bc
   7AD7 03            [ 6] 3674 	inc	bc
   7AD8 03            [ 6] 3675 	inc	bc
   7AD9 3E 2B         [ 7] 3676 	ld	a,#<(_spawnY)
   7ADB DD 86 F9      [19] 3677 	add	a, -7 (ix)
   7ADE DD 77 FC      [19] 3678 	ld	-4 (ix),a
   7AE1 3E 65         [ 7] 3679 	ld	a,#>(_spawnY)
   7AE3 CE 00         [ 7] 3680 	adc	a, #0x00
   7AE5 DD 77 FD      [19] 3681 	ld	-3 (ix),a
   7AE8 DD 6E FC      [19] 3682 	ld	l,-4 (ix)
   7AEB DD 66 FD      [19] 3683 	ld	h,-3 (ix)
   7AEE 7E            [ 7] 3684 	ld	a,(hl)
   7AEF 02            [ 7] 3685 	ld	(bc),a
   7AF0 FD 77 00      [19] 3686 	ld	0 (iy), a
                           3687 ;src/main.c:640: actual->mover  = NO;
   7AF3 21 06 00      [10] 3688 	ld	hl,#0x0006
   7AF6 19            [11] 3689 	add	hl,de
   7AF7 36 00         [10] 3690 	ld	(hl),#0x00
                           3691 ;src/main.c:641: actual->mira   = M_abajo;
   7AF9 21 07 00      [10] 3692 	ld	hl,#0x0007
   7AFC 19            [11] 3693 	add	hl,de
   7AFD 36 03         [10] 3694 	ld	(hl),#0x03
                           3695 ;src/main.c:642: actual->sprite = g_enemy;
   7AFF 21 04 00      [10] 3696 	ld	hl,#0x0004
   7B02 19            [11] 3697 	add	hl,de
   7B03 36 3A         [10] 3698 	ld	(hl),#<(_g_enemy)
   7B05 23            [ 6] 3699 	inc	hl
   7B06 36 3C         [10] 3700 	ld	(hl),#>(_g_enemy)
                           3701 ;src/main.c:643: actual->muerto = NO;
   7B08 21 08 00      [10] 3702 	ld	hl,#0x0008
   7B0B 19            [11] 3703 	add	hl,de
   7B0C 36 00         [10] 3704 	ld	(hl),#0x00
                           3705 ;src/main.c:644: actual->muertes = 0;
   7B0E 21 09 00      [10] 3706 	ld	hl,#0x0009
   7B11 19            [11] 3707 	add	hl,de
   7B12 36 00         [10] 3708 	ld	(hl),#0x00
                           3709 ;src/main.c:645: actual->patrolling = SI;
   7B14 21 0A 00      [10] 3710 	ld	hl,#0x000A
   7B17 19            [11] 3711 	add	hl,de
   7B18 36 01         [10] 3712 	ld	(hl),#0x01
                           3713 ;src/main.c:646: actual->reversePatrol = NO;
   7B1A 21 0B 00      [10] 3714 	ld	hl,#0x000B
   7B1D 19            [11] 3715 	add	hl,de
   7B1E 36 00         [10] 3716 	ld	(hl),#0x00
                           3717 ;src/main.c:647: actual->didDamage = 0;
   7B20 21 16 00      [10] 3718 	ld	hl,#0x0016
   7B23 19            [11] 3719 	add	hl,de
   7B24 36 00         [10] 3720 	ld	(hl),#0x00
                           3721 ;src/main.c:648: actual->iter = 0;
   7B26 21 0D 00      [10] 3722 	ld	hl,#0x000D
   7B29 19            [11] 3723 	add	hl,de
   7B2A AF            [ 4] 3724 	xor	a, a
   7B2B 77            [ 7] 3725 	ld	(hl), a
   7B2C 23            [ 6] 3726 	inc	hl
   7B2D 77            [ 7] 3727 	ld	(hl), a
                           3728 ;src/main.c:649: actual->lastIter = 0;
   7B2E 21 0F 00      [10] 3729 	ld	hl,#0x000F
   7B31 19            [11] 3730 	add	hl,de
   7B32 36 00         [10] 3731 	ld	(hl),#0x00
                           3732 ;src/main.c:650: actual->seen = 0;
   7B34 21 11 00      [10] 3733 	ld	hl,#0x0011
   7B37 19            [11] 3734 	add	hl,de
   7B38 36 00         [10] 3735 	ld	(hl),#0x00
                           3736 ;src/main.c:651: actual->found = 0;
   7B3A 21 12 00      [10] 3737 	ld	hl,#0x0012
   7B3D 19            [11] 3738 	add	hl,de
   7B3E 36 00         [10] 3739 	ld	(hl),#0x00
                           3740 ;src/main.c:652: actual->engage = 0;
   7B40 21 15 00      [10] 3741 	ld	hl,#0x0015
   7B43 19            [11] 3742 	add	hl,de
   7B44 36 00         [10] 3743 	ld	(hl),#0x00
                           3744 ;src/main.c:653: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B46 21 05 65      [10] 3745 	ld	hl,#_num_mapa + 0
   7B49 4E            [ 7] 3746 	ld	c, (hl)
   7B4A 0C            [ 4] 3747 	inc	c
   7B4B 06 00         [ 7] 3748 	ld	b,#0x00
   7B4D 69            [ 4] 3749 	ld	l, c
   7B4E 60            [ 4] 3750 	ld	h, b
   7B4F 29            [11] 3751 	add	hl, hl
   7B50 29            [11] 3752 	add	hl, hl
   7B51 09            [11] 3753 	add	hl, bc
   7B52 4D            [ 4] 3754 	ld	c,l
   7B53 44            [ 4] 3755 	ld	b,h
   7B54 21 43 65      [10] 3756 	ld	hl,#_patrolY
   7B57 09            [11] 3757 	add	hl,bc
   7B58 7D            [ 4] 3758 	ld	a,l
   7B59 DD 86 F9      [19] 3759 	add	a, -7 (ix)
   7B5C 6F            [ 4] 3760 	ld	l,a
   7B5D 7C            [ 4] 3761 	ld	a,h
   7B5E CE 00         [ 7] 3762 	adc	a, #0x00
   7B60 67            [ 4] 3763 	ld	h,a
   7B61 7E            [ 7] 3764 	ld	a,(hl)
   7B62 DD 77 FB      [19] 3765 	ld	-5 (ix),a
   7B65 21 2F 65      [10] 3766 	ld	hl,#_patrolX
   7B68 09            [11] 3767 	add	hl,bc
   7B69 DD 4E F9      [19] 3768 	ld	c,-7 (ix)
   7B6C 06 00         [ 7] 3769 	ld	b,#0x00
   7B6E 09            [11] 3770 	add	hl,bc
   7B6F 7E            [ 7] 3771 	ld	a,(hl)
   7B70 DD 77 FA      [19] 3772 	ld	-6 (ix),a
   7B73 DD 6E FC      [19] 3773 	ld	l,-4 (ix)
   7B76 DD 66 FD      [19] 3774 	ld	h,-3 (ix)
   7B79 4E            [ 7] 3775 	ld	c,(hl)
   7B7A DD 6E FE      [19] 3776 	ld	l,-2 (ix)
   7B7D DD 66 FF      [19] 3777 	ld	h,-1 (ix)
   7B80 46            [ 7] 3778 	ld	b,(hl)
   7B81 D5            [11] 3779 	push	de
   7B82 2A 03 65      [16] 3780 	ld	hl,(_mapa)
   7B85 E5            [11] 3781 	push	hl
   7B86 D5            [11] 3782 	push	de
   7B87 DD 66 FB      [19] 3783 	ld	h,-5 (ix)
   7B8A DD 6E FA      [19] 3784 	ld	l,-6 (ix)
   7B8D E5            [11] 3785 	push	hl
   7B8E 79            [ 4] 3786 	ld	a,c
   7B8F F5            [11] 3787 	push	af
   7B90 33            [ 6] 3788 	inc	sp
   7B91 C5            [11] 3789 	push	bc
   7B92 33            [ 6] 3790 	inc	sp
   7B93 CD 30 44      [17] 3791 	call	_pathFinding
   7B96 21 08 00      [10] 3792 	ld	hl,#8
   7B99 39            [11] 3793 	add	hl,sp
   7B9A F9            [ 6] 3794 	ld	sp,hl
   7B9B D1            [10] 3795 	pop	de
                           3796 ;src/main.c:654: dibujarEnemigo(actual);
   7B9C D5            [11] 3797 	push	de
   7B9D D5            [11] 3798 	push	de
   7B9E CD DD 67      [17] 3799 	call	_dibujarEnemigo
   7BA1 F1            [10] 3800 	pop	af
   7BA2 D1            [10] 3801 	pop	de
                           3802 ;src/main.c:655: ++actual;
   7BA3 21 E2 00      [10] 3803 	ld	hl,#0x00E2
   7BA6 19            [11] 3804 	add	hl,de
   7BA7 EB            [ 4] 3805 	ex	de,hl
   7BA8 C3 A9 7A      [10] 3806 	jp	00101$
   7BAB                    3807 00104$:
   7BAB DD F9         [10] 3808 	ld	sp, ix
   7BAD DD E1         [14] 3809 	pop	ix
   7BAF C9            [10] 3810 	ret
                           3811 ;src/main.c:659: void avanzarMapa() {
                           3812 ;	---------------------------------
                           3813 ; Function avanzarMapa
                           3814 ; ---------------------------------
   7BB0                    3815 _avanzarMapa::
                           3816 ;src/main.c:660: if(num_mapa < NUM_MAPAS -1) {
   7BB0 3A 05 65      [13] 3817 	ld	a,(#_num_mapa + 0)
   7BB3 D6 02         [ 7] 3818 	sub	a, #0x02
   7BB5 30 34         [12] 3819 	jr	NC,00102$
                           3820 ;src/main.c:661: mapa = mapas[++num_mapa];
   7BB7 01 21 65      [10] 3821 	ld	bc,#_mapas+0
   7BBA 21 05 65      [10] 3822 	ld	hl, #_num_mapa+0
   7BBD 34            [11] 3823 	inc	(hl)
   7BBE FD 21 05 65   [14] 3824 	ld	iy,#_num_mapa
   7BC2 FD 6E 00      [19] 3825 	ld	l,0 (iy)
   7BC5 26 00         [ 7] 3826 	ld	h,#0x00
   7BC7 29            [11] 3827 	add	hl, hl
   7BC8 09            [11] 3828 	add	hl,bc
   7BC9 7E            [ 7] 3829 	ld	a,(hl)
   7BCA FD 21 03 65   [14] 3830 	ld	iy,#_mapa
   7BCE FD 77 00      [19] 3831 	ld	0 (iy),a
   7BD1 23            [ 6] 3832 	inc	hl
   7BD2 7E            [ 7] 3833 	ld	a,(hl)
   7BD3 32 04 65      [13] 3834 	ld	(#_mapa + 1),a
                           3835 ;src/main.c:662: prota.x = prota.px = 2;
   7BD6 21 27 64      [10] 3836 	ld	hl,#(_prota + 0x0002)
   7BD9 36 02         [10] 3837 	ld	(hl),#0x02
   7BDB 21 25 64      [10] 3838 	ld	hl,#_prota
   7BDE 36 02         [10] 3839 	ld	(hl),#0x02
                           3840 ;src/main.c:663: prota.mover = SI;
   7BE0 21 2B 64      [10] 3841 	ld	hl,#(_prota + 0x0006)
   7BE3 36 01         [10] 3842 	ld	(hl),#0x01
                           3843 ;src/main.c:664: dibujarMapa();
   7BE5 CD 0B 65      [17] 3844 	call	_dibujarMapa
                           3845 ;src/main.c:665: inicializarEnemy();
   7BE8 C3 91 7A      [10] 3846 	jp  _inicializarEnemy
   7BEB                    3847 00102$:
                           3848 ;src/main.c:668: menuFin(puntuacion);
   7BEB FD 21 06 65   [14] 3849 	ld	iy,#_puntuacion
   7BEF FD 6E 00      [19] 3850 	ld	l,0 (iy)
   7BF2 26 00         [ 7] 3851 	ld	h,#0x00
   7BF4 C3 E5 4B      [10] 3852 	jp  _menuFin
                           3853 ;src/main.c:672: void moverIzquierda() {
                           3854 ;	---------------------------------
                           3855 ; Function moverIzquierda
                           3856 ; ---------------------------------
   7BF7                    3857 _moverIzquierda::
                           3858 ;src/main.c:673: prota.mira = M_izquierda;
   7BF7 01 25 64      [10] 3859 	ld	bc,#_prota+0
   7BFA 21 2C 64      [10] 3860 	ld	hl,#(_prota + 0x0007)
   7BFD 36 01         [10] 3861 	ld	(hl),#0x01
                           3862 ;src/main.c:674: if (!checkCollision(M_izquierda)) {
   7BFF C5            [11] 3863 	push	bc
   7C00 3E 01         [ 7] 3864 	ld	a,#0x01
   7C02 F5            [11] 3865 	push	af
   7C03 33            [ 6] 3866 	inc	sp
   7C04 CD 6C 66      [17] 3867 	call	_checkCollision
   7C07 33            [ 6] 3868 	inc	sp
   7C08 C1            [10] 3869 	pop	bc
   7C09 7D            [ 4] 3870 	ld	a,l
   7C0A B7            [ 4] 3871 	or	a, a
   7C0B C0            [11] 3872 	ret	NZ
                           3873 ;src/main.c:675: prota.x--;
   7C0C 0A            [ 7] 3874 	ld	a,(bc)
   7C0D C6 FF         [ 7] 3875 	add	a,#0xFF
   7C0F 02            [ 7] 3876 	ld	(bc),a
                           3877 ;src/main.c:676: prota.mover = SI;
   7C10 21 2B 64      [10] 3878 	ld	hl,#(_prota + 0x0006)
   7C13 36 01         [10] 3879 	ld	(hl),#0x01
                           3880 ;src/main.c:677: prota.sprite = g_hero_left;
   7C15 21 C6 3D      [10] 3881 	ld	hl,#_g_hero_left
   7C18 22 29 64      [16] 3882 	ld	((_prota + 0x0004)), hl
   7C1B C9            [10] 3883 	ret
                           3884 ;src/main.c:681: void moverDerecha() {
                           3885 ;	---------------------------------
                           3886 ; Function moverDerecha
                           3887 ; ---------------------------------
   7C1C                    3888 _moverDerecha::
                           3889 ;src/main.c:682: prota.mira = M_derecha;
   7C1C 21 2C 64      [10] 3890 	ld	hl,#(_prota + 0x0007)
   7C1F 36 00         [10] 3891 	ld	(hl),#0x00
                           3892 ;src/main.c:683: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C21 AF            [ 4] 3893 	xor	a, a
   7C22 F5            [11] 3894 	push	af
   7C23 33            [ 6] 3895 	inc	sp
   7C24 CD 6C 66      [17] 3896 	call	_checkCollision
   7C27 33            [ 6] 3897 	inc	sp
   7C28 45            [ 4] 3898 	ld	b,l
   7C29 21 25 64      [10] 3899 	ld	hl, #_prota + 0
   7C2C 4E            [ 7] 3900 	ld	c,(hl)
   7C2D 59            [ 4] 3901 	ld	e,c
   7C2E 16 00         [ 7] 3902 	ld	d,#0x00
   7C30 21 07 00      [10] 3903 	ld	hl,#0x0007
   7C33 19            [11] 3904 	add	hl,de
   7C34 11 50 80      [10] 3905 	ld	de, #0x8050
   7C37 29            [11] 3906 	add	hl, hl
   7C38 3F            [ 4] 3907 	ccf
   7C39 CB 1C         [ 8] 3908 	rr	h
   7C3B CB 1D         [ 8] 3909 	rr	l
   7C3D ED 52         [15] 3910 	sbc	hl, de
   7C3F 3E 00         [ 7] 3911 	ld	a,#0x00
   7C41 17            [ 4] 3912 	rla
   7C42 5F            [ 4] 3913 	ld	e,a
   7C43 78            [ 4] 3914 	ld	a,b
   7C44 B7            [ 4] 3915 	or	a,a
   7C45 20 14         [12] 3916 	jr	NZ,00104$
   7C47 B3            [ 4] 3917 	or	a,e
   7C48 28 11         [12] 3918 	jr	Z,00104$
                           3919 ;src/main.c:684: prota.x++;
   7C4A 0C            [ 4] 3920 	inc	c
   7C4B 21 25 64      [10] 3921 	ld	hl,#_prota
   7C4E 71            [ 7] 3922 	ld	(hl),c
                           3923 ;src/main.c:685: prota.mover = SI;
   7C4F 21 2B 64      [10] 3924 	ld	hl,#(_prota + 0x0006)
   7C52 36 01         [10] 3925 	ld	(hl),#0x01
                           3926 ;src/main.c:686: prota.sprite = g_hero;
   7C54 21 70 3E      [10] 3927 	ld	hl,#_g_hero
   7C57 22 29 64      [16] 3928 	ld	((_prota + 0x0004)), hl
   7C5A C9            [10] 3929 	ret
   7C5B                    3930 00104$:
                           3931 ;src/main.c:687: }else if( prota.x + G_HERO_W >= 80){
   7C5B 7B            [ 4] 3932 	ld	a,e
   7C5C B7            [ 4] 3933 	or	a, a
   7C5D C0            [11] 3934 	ret	NZ
                           3935 ;src/main.c:688: avanzarMapa();
   7C5E C3 B0 7B      [10] 3936 	jp  _avanzarMapa
                           3937 ;src/main.c:692: void moverArriba() {
                           3938 ;	---------------------------------
                           3939 ; Function moverArriba
                           3940 ; ---------------------------------
   7C61                    3941 _moverArriba::
                           3942 ;src/main.c:693: prota.mira = M_arriba;
   7C61 21 2C 64      [10] 3943 	ld	hl,#(_prota + 0x0007)
   7C64 36 02         [10] 3944 	ld	(hl),#0x02
                           3945 ;src/main.c:694: if (!checkCollision(M_arriba)) {
   7C66 3E 02         [ 7] 3946 	ld	a,#0x02
   7C68 F5            [11] 3947 	push	af
   7C69 33            [ 6] 3948 	inc	sp
   7C6A CD 6C 66      [17] 3949 	call	_checkCollision
   7C6D 33            [ 6] 3950 	inc	sp
   7C6E 7D            [ 4] 3951 	ld	a,l
   7C6F B7            [ 4] 3952 	or	a, a
   7C70 C0            [11] 3953 	ret	NZ
                           3954 ;src/main.c:695: prota.y--;
   7C71 21 26 64      [10] 3955 	ld	hl,#_prota + 1
   7C74 4E            [ 7] 3956 	ld	c,(hl)
   7C75 0D            [ 4] 3957 	dec	c
   7C76 71            [ 7] 3958 	ld	(hl),c
                           3959 ;src/main.c:696: prota.y--;
   7C77 0D            [ 4] 3960 	dec	c
   7C78 71            [ 7] 3961 	ld	(hl),c
                           3962 ;src/main.c:697: prota.mover  = SI;
   7C79 21 2B 64      [10] 3963 	ld	hl,#(_prota + 0x0006)
   7C7C 36 01         [10] 3964 	ld	(hl),#0x01
                           3965 ;src/main.c:698: prota.sprite = g_hero_up;
   7C7E 21 2C 3D      [10] 3966 	ld	hl,#_g_hero_up
   7C81 22 29 64      [16] 3967 	ld	((_prota + 0x0004)), hl
   7C84 C9            [10] 3968 	ret
                           3969 ;src/main.c:702: void moverAbajo() {
                           3970 ;	---------------------------------
                           3971 ; Function moverAbajo
                           3972 ; ---------------------------------
   7C85                    3973 _moverAbajo::
                           3974 ;src/main.c:703: prota.mira = M_abajo;
   7C85 21 2C 64      [10] 3975 	ld	hl,#(_prota + 0x0007)
   7C88 36 03         [10] 3976 	ld	(hl),#0x03
                           3977 ;src/main.c:704: if (!checkCollision(M_abajo) ) {
   7C8A 3E 03         [ 7] 3978 	ld	a,#0x03
   7C8C F5            [11] 3979 	push	af
   7C8D 33            [ 6] 3980 	inc	sp
   7C8E CD 6C 66      [17] 3981 	call	_checkCollision
   7C91 33            [ 6] 3982 	inc	sp
   7C92 7D            [ 4] 3983 	ld	a,l
   7C93 B7            [ 4] 3984 	or	a, a
   7C94 C0            [11] 3985 	ret	NZ
                           3986 ;src/main.c:705: prota.y++;
   7C95 01 26 64      [10] 3987 	ld	bc,#_prota + 1
   7C98 0A            [ 7] 3988 	ld	a,(bc)
   7C99 3C            [ 4] 3989 	inc	a
   7C9A 02            [ 7] 3990 	ld	(bc),a
                           3991 ;src/main.c:706: prota.y++;
   7C9B 3C            [ 4] 3992 	inc	a
   7C9C 02            [ 7] 3993 	ld	(bc),a
                           3994 ;src/main.c:707: prota.mover  = SI;
   7C9D 21 2B 64      [10] 3995 	ld	hl,#(_prota + 0x0006)
   7CA0 36 01         [10] 3996 	ld	(hl),#0x01
                           3997 ;src/main.c:708: prota.sprite = g_hero_down;
   7CA2 21 92 3C      [10] 3998 	ld	hl,#_g_hero_down
   7CA5 22 29 64      [16] 3999 	ld	((_prota + 0x0004)), hl
   7CA8 C9            [10] 4000 	ret
                           4001 ;src/main.c:715: void intHandler() {
                           4002 ;	---------------------------------
                           4003 ; Function intHandler
                           4004 ; ---------------------------------
   7CA9                    4005 _intHandler::
                           4006 ;src/main.c:716: if (++i == 6) {
   7CA9 21 39 64      [10] 4007 	ld	hl, #_i+0
   7CAC 34            [11] 4008 	inc	(hl)
   7CAD 3A 39 64      [13] 4009 	ld	a,(#_i + 0)
   7CB0 D6 06         [ 7] 4010 	sub	a, #0x06
   7CB2 C0            [11] 4011 	ret	NZ
                           4012 ;src/main.c:717: play();
   7CB3 CD 71 53      [17] 4013 	call	_play
                           4014 ;src/main.c:718: i=0;
   7CB6 21 39 64      [10] 4015 	ld	hl,#_i + 0
   7CB9 36 00         [10] 4016 	ld	(hl), #0x00
   7CBB C9            [10] 4017 	ret
                           4018 ;src/main.c:722: void inicializarCPC() {
                           4019 ;	---------------------------------
                           4020 ; Function inicializarCPC
                           4021 ; ---------------------------------
   7CBC                    4022 _inicializarCPC::
                           4023 ;src/main.c:723: cpct_disableFirmware();
   7CBC CD 18 57      [17] 4024 	call	_cpct_disableFirmware
                           4025 ;src/main.c:724: cpct_setVideoMode(0);
   7CBF 2E 00         [ 7] 4026 	ld	l,#0x00
   7CC1 CD EC 56      [17] 4027 	call	_cpct_setVideoMode
                           4028 ;src/main.c:725: cpct_setBorder(HW_BLACK);
   7CC4 21 10 14      [10] 4029 	ld	hl,#0x1410
   7CC7 E5            [11] 4030 	push	hl
   7CC8 CD 4F 54      [17] 4031 	call	_cpct_setPALColour
                           4032 ;src/main.c:726: cpct_setPalette(g_palette, 16);
   7CCB 21 10 00      [10] 4033 	ld	hl,#0x0010
   7CCE E5            [11] 4034 	push	hl
   7CCF 21 60 3E      [10] 4035 	ld	hl,#_g_palette
   7CD2 E5            [11] 4036 	push	hl
   7CD3 CD 2C 54      [17] 4037 	call	_cpct_setPalette
   7CD6 C9            [10] 4038 	ret
                           4039 ;src/main.c:731: void inicializarJuego() {
                           4040 ;	---------------------------------
                           4041 ; Function inicializarJuego
                           4042 ; ---------------------------------
   7CD7                    4043 _inicializarJuego::
                           4044 ;src/main.c:733: num_mapa = 0;
   7CD7 21 05 65      [10] 4045 	ld	hl,#_num_mapa + 0
   7CDA 36 00         [10] 4046 	ld	(hl), #0x00
                           4047 ;src/main.c:734: mapa = mapas[num_mapa];
   7CDC 21 21 65      [10] 4048 	ld	hl, #_mapas + 0
   7CDF 7E            [ 7] 4049 	ld	a,(hl)
   7CE0 FD 21 03 65   [14] 4050 	ld	iy,#_mapa
   7CE4 FD 77 00      [19] 4051 	ld	0 (iy),a
   7CE7 23            [ 6] 4052 	inc	hl
   7CE8 7E            [ 7] 4053 	ld	a,(hl)
   7CE9 32 04 65      [13] 4054 	ld	(#_mapa + 1),a
                           4055 ;src/main.c:735: cpct_etm_setTileset2x4(g_tileset);
   7CEC 21 E0 17      [10] 4056 	ld	hl,#_g_tileset
   7CEF CD 40 56      [17] 4057 	call	_cpct_etm_setTileset2x4
                           4058 ;src/main.c:737: dibujarMapa();
   7CF2 CD 0B 65      [17] 4059 	call	_dibujarMapa
                           4060 ;src/main.c:740: barraPuntuacionInicial();
   7CF5 CD 85 51      [17] 4061 	call	_barraPuntuacionInicial
                           4062 ;src/main.c:743: prota.x = prota.px = 4;
   7CF8 21 27 64      [10] 4063 	ld	hl,#(_prota + 0x0002)
   7CFB 36 04         [10] 4064 	ld	(hl),#0x04
   7CFD 21 25 64      [10] 4065 	ld	hl,#_prota
   7D00 36 04         [10] 4066 	ld	(hl),#0x04
                           4067 ;src/main.c:744: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D02 21 28 64      [10] 4068 	ld	hl,#(_prota + 0x0003)
   7D05 36 68         [10] 4069 	ld	(hl),#0x68
   7D07 21 26 64      [10] 4070 	ld	hl,#(_prota + 0x0001)
   7D0A 36 68         [10] 4071 	ld	(hl),#0x68
                           4072 ;src/main.c:745: prota.mover  = NO;
   7D0C 21 2B 64      [10] 4073 	ld	hl,#(_prota + 0x0006)
   7D0F 36 00         [10] 4074 	ld	(hl),#0x00
                           4075 ;src/main.c:746: prota.mira=M_derecha;
   7D11 21 2C 64      [10] 4076 	ld	hl,#(_prota + 0x0007)
   7D14 36 00         [10] 4077 	ld	(hl),#0x00
                           4078 ;src/main.c:747: prota.sprite = g_hero;
   7D16 21 70 3E      [10] 4079 	ld	hl,#_g_hero
   7D19 22 29 64      [16] 4080 	ld	((_prota + 0x0004)), hl
                           4081 ;src/main.c:751: cu.x = cu.px = 0;
   7D1C 21 2F 64      [10] 4082 	ld	hl,#(_cu + 0x0002)
   7D1F 36 00         [10] 4083 	ld	(hl),#0x00
   7D21 21 2D 64      [10] 4084 	ld	hl,#_cu
   7D24 36 00         [10] 4085 	ld	(hl),#0x00
                           4086 ;src/main.c:752: cu.y = cu.py = 0;
   7D26 21 30 64      [10] 4087 	ld	hl,#(_cu + 0x0003)
   7D29 36 00         [10] 4088 	ld	(hl),#0x00
   7D2B 21 2E 64      [10] 4089 	ld	hl,#(_cu + 0x0001)
   7D2E 36 00         [10] 4090 	ld	(hl),#0x00
                           4091 ;src/main.c:753: cu.lanzado = NO;
   7D30 21 33 64      [10] 4092 	ld	hl,#(_cu + 0x0006)
   7D33 36 00         [10] 4093 	ld	(hl),#0x00
                           4094 ;src/main.c:754: cu.mover = NO;
   7D35 21 36 64      [10] 4095 	ld	hl,#(_cu + 0x0009)
   7D38 36 00         [10] 4096 	ld	(hl),#0x00
                           4097 ;src/main.c:755: cu.off_bound = NO;
   7D3A 21 37 64      [10] 4098 	ld	hl,#(_cu + 0x000a)
   7D3D 36 00         [10] 4099 	ld	(hl),#0x00
                           4100 ;src/main.c:757: inicializarEnemy();
   7D3F CD 91 7A      [17] 4101 	call	_inicializarEnemy
                           4102 ;src/main.c:759: dibujarProta();
   7D42 C3 57 65      [10] 4103 	jp  _dibujarProta
                           4104 ;src/main.c:762: void main(void) {
                           4105 ;	---------------------------------
                           4106 ; Function main
                           4107 ; ---------------------------------
   7D45                    4108 _main::
   7D45 DD E5         [15] 4109 	push	ix
   7D47 DD 21 00 00   [14] 4110 	ld	ix,#0
   7D4B DD 39         [15] 4111 	add	ix,sp
   7D4D 21 F9 FF      [10] 4112 	ld	hl,#-7
   7D50 39            [11] 4113 	add	hl,sp
   7D51 F9            [ 6] 4114 	ld	sp,hl
                           4115 ;src/main.c:767: vidas = 6;
   7D52 21 38 64      [10] 4116 	ld	hl,#_vidas + 0
   7D55 36 06         [10] 4117 	ld	(hl), #0x06
                           4118 ;src/main.c:769: inicializarCPC();
   7D57 CD BC 7C      [17] 4119 	call	_inicializarCPC
                           4120 ;src/main.c:771: menuInicio();
   7D5A CD A6 50      [17] 4121 	call	_menuInicio
                           4122 ;src/main.c:773: inicializarJuego();
   7D5D CD D7 7C      [17] 4123 	call	_inicializarJuego
                           4124 ;src/main.c:777: while (1) {
   7D60                    4125 00129$:
                           4126 ;src/main.c:779: i = 2 + num_mapa;
   7D60 21 05 65      [10] 4127 	ld	hl,#_num_mapa + 0
   7D63 4E            [ 7] 4128 	ld	c, (hl)
   7D64 0C            [ 4] 4129 	inc	c
   7D65 0C            [ 4] 4130 	inc	c
                           4131 ;src/main.c:780: actual = enemy;
                           4132 ;src/main.c:782: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D66 C5            [11] 4133 	push	bc
   7D67 21 00 01      [10] 4134 	ld	hl,#_g_tablatrans
   7D6A E5            [11] 4135 	push	hl
   7D6B 2A 03 65      [16] 4136 	ld	hl,(_mapa)
   7D6E E5            [11] 4137 	push	hl
   7D6F 21 25 64      [10] 4138 	ld	hl,#_prota
   7D72 E5            [11] 4139 	push	hl
   7D73 21 2D 64      [10] 4140 	ld	hl,#_cu
   7D76 E5            [11] 4141 	push	hl
   7D77 CD 05 66      [17] 4142 	call	_comprobarTeclado
   7D7A 21 08 00      [10] 4143 	ld	hl,#8
   7D7D 39            [11] 4144 	add	hl,sp
   7D7E F9            [ 6] 4145 	ld	sp,hl
   7D7F 2A 03 65      [16] 4146 	ld	hl,(_mapa)
   7D82 E5            [11] 4147 	push	hl
   7D83 21 2D 64      [10] 4148 	ld	hl,#_cu
   7D86 E5            [11] 4149 	push	hl
   7D87 CD 2A 4A      [17] 4150 	call	_moverCuchillo
   7D8A F1            [10] 4151 	pop	af
   7D8B F1            [10] 4152 	pop	af
   7D8C C1            [10] 4153 	pop	bc
                           4154 ;src/main.c:784: while(i){
   7D8D DD 71 FF      [19] 4155 	ld	-1 (ix),c
   7D90 DD 36 FB 9D   [19] 4156 	ld	-5 (ix),#<(_enemy)
   7D94 DD 36 FC 60   [19] 4157 	ld	-4 (ix),#>(_enemy)
   7D98                    4158 00108$:
   7D98 DD 7E FF      [19] 4159 	ld	a,-1 (ix)
   7D9B B7            [ 4] 4160 	or	a, a
   7D9C 28 66         [12] 4161 	jr	Z,00110$
                           4162 ;src/main.c:786: --i;
   7D9E DD 35 FF      [23] 4163 	dec	-1 (ix)
                           4164 ;src/main.c:787: if(!actual->muerto){
   7DA1 DD 7E FB      [19] 4165 	ld	a,-5 (ix)
   7DA4 C6 08         [ 7] 4166 	add	a, #0x08
   7DA6 DD 77 FD      [19] 4167 	ld	-3 (ix),a
   7DA9 DD 7E FC      [19] 4168 	ld	a,-4 (ix)
   7DAC CE 00         [ 7] 4169 	adc	a, #0x00
   7DAE DD 77 FE      [19] 4170 	ld	-2 (ix),a
   7DB1 DD 6E FD      [19] 4171 	ld	l,-3 (ix)
   7DB4 DD 66 FE      [19] 4172 	ld	h,-2 (ix)
   7DB7 7E            [ 7] 4173 	ld	a,(hl)
   7DB8 B7            [ 4] 4174 	or	a, a
   7DB9 20 10         [12] 4175 	jr	NZ,00102$
                           4176 ;src/main.c:788: checkEnemyDead(cu.direccion, actual);
   7DBB 21 34 64      [10] 4177 	ld	hl, #_cu + 7
   7DBE 46            [ 7] 4178 	ld	b,(hl)
   7DBF D1            [10] 4179 	pop	de
   7DC0 E1            [10] 4180 	pop	hl
   7DC1 E5            [11] 4181 	push	hl
   7DC2 D5            [11] 4182 	push	de
   7DC3 E5            [11] 4183 	push	hl
   7DC4 C5            [11] 4184 	push	bc
   7DC5 33            [ 6] 4185 	inc	sp
   7DC6 CD 66 69      [17] 4186 	call	_checkEnemyDead
   7DC9 F1            [10] 4187 	pop	af
   7DCA 33            [ 6] 4188 	inc	sp
   7DCB                    4189 00102$:
                           4190 ;src/main.c:790: if(!actual->muerto){
   7DCB DD 6E FD      [19] 4191 	ld	l,-3 (ix)
   7DCE DD 66 FE      [19] 4192 	ld	h,-2 (ix)
   7DD1 7E            [ 7] 4193 	ld	a,(hl)
   7DD2 B7            [ 4] 4194 	or	a, a
   7DD3 20 1D         [12] 4195 	jr	NZ,00107$
                           4196 ;src/main.c:791: if (!actual->didDamage)
   7DD5 DD 7E FB      [19] 4197 	ld	a,-5 (ix)
   7DD8 C6 16         [ 7] 4198 	add	a, #0x16
   7DDA 4F            [ 4] 4199 	ld	c,a
   7DDB DD 7E FC      [19] 4200 	ld	a,-4 (ix)
   7DDE CE 00         [ 7] 4201 	adc	a, #0x00
   7DE0 47            [ 4] 4202 	ld	b,a
   7DE1 0A            [ 7] 4203 	ld	a,(bc)
   7DE2 B7            [ 4] 4204 	or	a, a
   7DE3 20 0B         [12] 4205 	jr	NZ,00104$
                           4206 ;src/main.c:792: updateEnemy(actual);
   7DE5 C1            [10] 4207 	pop	bc
   7DE6 E1            [10] 4208 	pop	hl
   7DE7 E5            [11] 4209 	push	hl
   7DE8 C5            [11] 4210 	push	bc
   7DE9 E5            [11] 4211 	push	hl
   7DEA CD 35 79      [17] 4212 	call	_updateEnemy
   7DED F1            [10] 4213 	pop	af
   7DEE 18 02         [12] 4214 	jr	00107$
   7DF0                    4215 00104$:
                           4216 ;src/main.c:794: actual->didDamage = 0;
   7DF0 AF            [ 4] 4217 	xor	a, a
   7DF1 02            [ 7] 4218 	ld	(bc),a
   7DF2                    4219 00107$:
                           4220 ;src/main.c:796: ++actual;
   7DF2 DD 7E FB      [19] 4221 	ld	a,-5 (ix)
   7DF5 C6 E2         [ 7] 4222 	add	a, #0xE2
   7DF7 DD 77 FB      [19] 4223 	ld	-5 (ix),a
   7DFA DD 7E FC      [19] 4224 	ld	a,-4 (ix)
   7DFD CE 00         [ 7] 4225 	adc	a, #0x00
   7DFF DD 77 FC      [19] 4226 	ld	-4 (ix),a
   7E02 18 94         [12] 4227 	jr	00108$
   7E04                    4228 00110$:
                           4229 ;src/main.c:799: cpct_waitVSYNC();
   7E04 CD E4 56      [17] 4230 	call	_cpct_waitVSYNC
                           4231 ;src/main.c:802: if (prota.mover) {
   7E07 01 2B 64      [10] 4232 	ld	bc,#_prota + 6
   7E0A 0A            [ 7] 4233 	ld	a,(bc)
   7E0B B7            [ 4] 4234 	or	a, a
   7E0C 28 07         [12] 4235 	jr	Z,00112$
                           4236 ;src/main.c:803: redibujarProta();
   7E0E C5            [11] 4237 	push	bc
   7E0F CD F1 65      [17] 4238 	call	_redibujarProta
   7E12 C1            [10] 4239 	pop	bc
                           4240 ;src/main.c:804: prota.mover = NO;
   7E13 AF            [ 4] 4241 	xor	a, a
   7E14 02            [ 7] 4242 	ld	(bc),a
   7E15                    4243 00112$:
                           4244 ;src/main.c:806: if(cu.lanzado && cu.mover){
   7E15 21 33 64      [10] 4245 	ld	hl, #(_cu + 0x0006) + 0
   7E18 4E            [ 7] 4246 	ld	c,(hl)
                           4247 ;src/main.c:807: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4248 ;src/main.c:806: if(cu.lanzado && cu.mover){
   7E19 79            [ 4] 4249 	ld	a,c
   7E1A B7            [ 4] 4250 	or	a, a
   7E1B 28 30         [12] 4251 	jr	Z,00117$
   7E1D 3A 36 64      [13] 4252 	ld	a, (#(_cu + 0x0009) + 0)
   7E20 B7            [ 4] 4253 	or	a, a
   7E21 28 2A         [12] 4254 	jr	Z,00117$
                           4255 ;src/main.c:807: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E23 21 2E 64      [10] 4256 	ld	hl, #(_cu + 0x0001) + 0
   7E26 4E            [ 7] 4257 	ld	c,(hl)
   7E27 21 2D 64      [10] 4258 	ld	hl, #_cu + 0
   7E2A 46            [ 7] 4259 	ld	b,(hl)
   7E2B 21 35 64      [10] 4260 	ld	hl, #(_cu + 0x0008) + 0
   7E2E 5E            [ 7] 4261 	ld	e,(hl)
   7E2F 2A 03 65      [16] 4262 	ld	hl,(_mapa)
   7E32 E5            [11] 4263 	push	hl
   7E33 21 00 01      [10] 4264 	ld	hl,#_g_tablatrans
   7E36 E5            [11] 4265 	push	hl
   7E37 21 2D 64      [10] 4266 	ld	hl,#_cu
   7E3A E5            [11] 4267 	push	hl
   7E3B 79            [ 4] 4268 	ld	a,c
   7E3C F5            [11] 4269 	push	af
   7E3D 33            [ 6] 4270 	inc	sp
   7E3E C5            [11] 4271 	push	bc
   7E3F 33            [ 6] 4272 	inc	sp
   7E40 7B            [ 4] 4273 	ld	a,e
   7E41 F5            [11] 4274 	push	af
   7E42 33            [ 6] 4275 	inc	sp
   7E43 CD 4A 47      [17] 4276 	call	_redibujarCuchillo
   7E46 21 09 00      [10] 4277 	ld	hl,#9
   7E49 39            [11] 4278 	add	hl,sp
   7E4A F9            [ 6] 4279 	ld	sp,hl
   7E4B 18 32         [12] 4280 	jr	00118$
   7E4D                    4281 00117$:
                           4282 ;src/main.c:808: }else if (cu.lanzado && !cu.mover){
   7E4D 79            [ 4] 4283 	ld	a,c
   7E4E B7            [ 4] 4284 	or	a, a
   7E4F 28 2E         [12] 4285 	jr	Z,00118$
   7E51 3A 36 64      [13] 4286 	ld	a, (#(_cu + 0x0009) + 0)
   7E54 B7            [ 4] 4287 	or	a, a
   7E55 20 28         [12] 4288 	jr	NZ,00118$
                           4289 ;src/main.c:809: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E57 21 2E 64      [10] 4290 	ld	hl, #(_cu + 0x0001) + 0
   7E5A 46            [ 7] 4291 	ld	b,(hl)
   7E5B 21 2D 64      [10] 4292 	ld	hl, #_cu + 0
   7E5E 4E            [ 7] 4293 	ld	c,(hl)
   7E5F 21 35 64      [10] 4294 	ld	hl, #(_cu + 0x0008) + 0
   7E62 56            [ 7] 4295 	ld	d,(hl)
   7E63 2A 03 65      [16] 4296 	ld	hl,(_mapa)
   7E66 E5            [11] 4297 	push	hl
   7E67 C5            [11] 4298 	push	bc
   7E68 D5            [11] 4299 	push	de
   7E69 33            [ 6] 4300 	inc	sp
   7E6A CD B7 46      [17] 4301 	call	_borrarCuchillo
   7E6D F1            [10] 4302 	pop	af
   7E6E F1            [10] 4303 	pop	af
   7E6F 33            [ 6] 4304 	inc	sp
                           4305 ;src/main.c:810: cu.lanzado = NO;
   7E70 21 33 64      [10] 4306 	ld	hl,#(_cu + 0x0006)
   7E73 36 00         [10] 4307 	ld	(hl),#0x00
                           4308 ;src/main.c:812: cu.x = 0;
   7E75 21 2D 64      [10] 4309 	ld	hl,#_cu
   7E78 36 00         [10] 4310 	ld	(hl),#0x00
                           4311 ;src/main.c:813: cu.y=0;
   7E7A 21 2E 64      [10] 4312 	ld	hl,#(_cu + 0x0001)
   7E7D 36 00         [10] 4313 	ld	(hl),#0x00
   7E7F                    4314 00118$:
                           4315 ;src/main.c:816: i = 2 + num_mapa;
   7E7F 3A 05 65      [13] 4316 	ld	a,(#_num_mapa + 0)
   7E82 C6 02         [ 7] 4317 	add	a, #0x02
   7E84 DD 77 FD      [19] 4318 	ld	-3 (ix),a
                           4319 ;src/main.c:817: actual = enemy;
   7E87 01 9D 60      [10] 4320 	ld	bc,#_enemy
                           4321 ;src/main.c:818: while(i){
   7E8A                    4322 00125$:
   7E8A DD 7E FD      [19] 4323 	ld	a,-3 (ix)
   7E8D B7            [ 4] 4324 	or	a, a
   7E8E CA 3D 7F      [10] 4325 	jp	Z,00127$
                           4326 ;src/main.c:820: --i;
   7E91 DD 35 FD      [23] 4327 	dec	-3 (ix)
                           4328 ;src/main.c:821: if(actual->mover){
   7E94 21 06 00      [10] 4329 	ld	hl,#0x0006
   7E97 09            [11] 4330 	add	hl,bc
   7E98 DD 75 FB      [19] 4331 	ld	-5 (ix),l
   7E9B DD 74 FC      [19] 4332 	ld	-4 (ix),h
   7E9E DD 6E FB      [19] 4333 	ld	l,-5 (ix)
   7EA1 DD 66 FC      [19] 4334 	ld	h,-4 (ix)
   7EA4 7E            [ 7] 4335 	ld	a,(hl)
   7EA5 B7            [ 4] 4336 	or	a, a
   7EA6 28 18         [12] 4337 	jr	Z,00121$
                           4338 ;src/main.c:822: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7EA8 69            [ 4] 4339 	ld	l, c
   7EA9 60            [ 4] 4340 	ld	h, b
   7EAA 23            [ 6] 4341 	inc	hl
   7EAB 23            [ 6] 4342 	inc	hl
   7EAC 23            [ 6] 4343 	inc	hl
   7EAD 5E            [ 7] 4344 	ld	e,(hl)
   7EAE 69            [ 4] 4345 	ld	l, c
   7EAF 60            [ 4] 4346 	ld	h, b
   7EB0 23            [ 6] 4347 	inc	hl
   7EB1 23            [ 6] 4348 	inc	hl
   7EB2 56            [ 7] 4349 	ld	d,(hl)
   7EB3 C5            [11] 4350 	push	bc
   7EB4 C5            [11] 4351 	push	bc
   7EB5 7B            [ 4] 4352 	ld	a,e
   7EB6 F5            [11] 4353 	push	af
   7EB7 33            [ 6] 4354 	inc	sp
   7EB8 D5            [11] 4355 	push	de
   7EB9 33            [ 6] 4356 	inc	sp
   7EBA CD 35 69      [17] 4357 	call	_redibujarEnemigo
   7EBD F1            [10] 4358 	pop	af
   7EBE F1            [10] 4359 	pop	af
   7EBF C1            [10] 4360 	pop	bc
   7EC0                    4361 00121$:
                           4362 ;src/main.c:825: if (actual->muerto && actual->muertes == 0){
   7EC0 C5            [11] 4363 	push	bc
   7EC1 FD E1         [14] 4364 	pop	iy
   7EC3 FD 7E 08      [19] 4365 	ld	a,8 (iy)
   7EC6 B7            [ 4] 4366 	or	a, a
   7EC7 28 6B         [12] 4367 	jr	Z,00123$
   7EC9 21 09 00      [10] 4368 	ld	hl,#0x0009
   7ECC 09            [11] 4369 	add	hl,bc
   7ECD EB            [ 4] 4370 	ex	de,hl
   7ECE 1A            [ 7] 4371 	ld	a,(de)
   7ECF B7            [ 4] 4372 	or	a, a
   7ED0 20 62         [12] 4373 	jr	NZ,00123$
                           4374 ;src/main.c:826: borrarEnemigo((*actual).x, (*actual).y);
   7ED2 21 01 00      [10] 4375 	ld	hl,#0x0001
   7ED5 09            [11] 4376 	add	hl,bc
   7ED6 E3            [19] 4377 	ex	(sp), hl
   7ED7 E1            [10] 4378 	pop	hl
   7ED8 E5            [11] 4379 	push	hl
   7ED9 7E            [ 7] 4380 	ld	a,(hl)
   7EDA F5            [11] 4381 	push	af
   7EDB 0A            [ 7] 4382 	ld	a,(bc)
   7EDC DD 77 FF      [19] 4383 	ld	-1 (ix),a
   7EDF F1            [10] 4384 	pop	af
   7EE0 C5            [11] 4385 	push	bc
   7EE1 D5            [11] 4386 	push	de
   7EE2 F5            [11] 4387 	push	af
   7EE3 33            [ 6] 4388 	inc	sp
   7EE4 DD 7E FF      [19] 4389 	ld	a,-1 (ix)
   7EE7 F5            [11] 4390 	push	af
   7EE8 33            [ 6] 4391 	inc	sp
   7EE9 CD C5 68      [17] 4392 	call	_borrarEnemigo
   7EEC F1            [10] 4393 	pop	af
   7EED D1            [10] 4394 	pop	de
   7EEE C1            [10] 4395 	pop	bc
                           4396 ;src/main.c:827: dibujarExplosion(actual);
   7EEF C5            [11] 4397 	push	bc
   7EF0 D5            [11] 4398 	push	de
   7EF1 C5            [11] 4399 	push	bc
   7EF2 CD 15 68      [17] 4400 	call	_dibujarExplosion
   7EF5 F1            [10] 4401 	pop	af
   7EF6 D1            [10] 4402 	pop	de
   7EF7 C1            [10] 4403 	pop	bc
                           4404 ;src/main.c:828: puntuacion_aux = puntuacion;
   7EF8 FD 21 06 65   [14] 4405 	ld	iy,#_puntuacion
   7EFC FD 6E 00      [19] 4406 	ld	l,0 (iy)
   7EFF 26 00         [ 7] 4407 	ld	h,#0x00
                           4408 ;src/main.c:829: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7F01 C5            [11] 4409 	push	bc
   7F02 D5            [11] 4410 	push	de
   7F03 E5            [11] 4411 	push	hl
   7F04 CD 5E 53      [17] 4412 	call	_aumentarPuntuacion
   7F07 F1            [10] 4413 	pop	af
   7F08 D1            [10] 4414 	pop	de
   7F09 C1            [10] 4415 	pop	bc
   7F0A FD 21 06 65   [14] 4416 	ld	iy,#_puntuacion
   7F0E FD 75 00      [19] 4417 	ld	0 (iy),l
                           4418 ;src/main.c:830: modificarPuntuacion(puntuacion);
   7F11 FD 21 06 65   [14] 4419 	ld	iy,#_puntuacion
   7F15 FD 6E 00      [19] 4420 	ld	l,0 (iy)
   7F18 26 00         [ 7] 4421 	ld	h,#0x00
   7F1A C5            [11] 4422 	push	bc
   7F1B D5            [11] 4423 	push	de
   7F1C E5            [11] 4424 	push	hl
   7F1D CD 21 52      [17] 4425 	call	_modificarPuntuacion
   7F20 F1            [10] 4426 	pop	af
   7F21 D1            [10] 4427 	pop	de
   7F22 C1            [10] 4428 	pop	bc
                           4429 ;src/main.c:831: actual->mover = NO;
   7F23 DD 6E FB      [19] 4430 	ld	l,-5 (ix)
   7F26 DD 66 FC      [19] 4431 	ld	h,-4 (ix)
   7F29 36 00         [10] 4432 	ld	(hl),#0x00
                           4433 ;src/main.c:832: actual->muertes++;
   7F2B 1A            [ 7] 4434 	ld	a,(de)
   7F2C 3C            [ 4] 4435 	inc	a
   7F2D 12            [ 7] 4436 	ld	(de),a
                           4437 ;src/main.c:833: actual->x = 0;
   7F2E AF            [ 4] 4438 	xor	a, a
   7F2F 02            [ 7] 4439 	ld	(bc),a
                           4440 ;src/main.c:834: actual->y = 0;
   7F30 E1            [10] 4441 	pop	hl
   7F31 E5            [11] 4442 	push	hl
   7F32 36 00         [10] 4443 	ld	(hl),#0x00
   7F34                    4444 00123$:
                           4445 ;src/main.c:836: ++actual;
   7F34 21 E2 00      [10] 4446 	ld	hl,#0x00E2
   7F37 09            [11] 4447 	add	hl,bc
   7F38 4D            [ 4] 4448 	ld	c,l
   7F39 44            [ 4] 4449 	ld	b,h
   7F3A C3 8A 7E      [10] 4450 	jp	00125$
   7F3D                    4451 00127$:
                           4452 ;src/main.c:838: cpct_waitVSYNC();
   7F3D CD E4 56      [17] 4453 	call	_cpct_waitVSYNC
   7F40 C3 60 7D      [10] 4454 	jp	00129$
                           4455 	.area _CODE
                           4456 	.area _INITIALIZER
   6507                    4457 __xinit__mapa:
   6507 00 00              4458 	.dw #0x0000
   6509                    4459 __xinit__num_mapa:
   6509 00                 4460 	.db #0x00	; 0
   650A                    4461 __xinit__puntuacion:
   650A 00                 4462 	.db #0x00	; 0
                           4463 	.area _CABS (ABS)
