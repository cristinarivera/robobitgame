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
   6616 C2 3D 7B      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6619 21 00 02      [10]  382 	ld	hl,#0x0200
   661C CD 43 54      [17]  383 	call	_cpct_isKeyPressed
   661F 7D            [ 4]  384 	ld	a,l
   6620 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   6621 C2 62 7B      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6624 21 00 01      [10]  389 	ld	hl,#0x0100
   6627 CD 43 54      [17]  390 	call	_cpct_isKeyPressed
   662A 7D            [ 4]  391 	ld	a,l
   662B B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   662C C2 A7 7B      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   662F 21 00 04      [10]  396 	ld	hl,#0x0400
   6632 CD 43 54      [17]  397 	call	_cpct_isKeyPressed
   6635 7D            [ 4]  398 	ld	a,l
   6636 B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   6637 C2 CB 7B      [10]  401 	jp	NZ,_moverAbajo
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
   6978 DA 4E 6B      [10]  989 	jp	C,00134$
                            990 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   697B DD 7E 05      [19]  991 	ld	a,5 (ix)
   697E DD 77 FE      [19]  992 	ld	-2 (ix),a
   6981 DD 7E 06      [19]  993 	ld	a,6 (ix)
   6984 DD 77 FF      [19]  994 	ld	-1 (ix),a
   6987 DD 7E FE      [19]  995 	ld	a,-2 (ix)
   698A C6 01         [ 7]  996 	add	a, #0x01
   698C DD 77 FC      [19]  997 	ld	-4 (ix),a
   698F DD 7E FF      [19]  998 	ld	a,-1 (ix)
   6992 CE 00         [ 7]  999 	adc	a, #0x00
   6994 DD 77 FD      [19] 1000 	ld	-3 (ix),a
                           1001 ;src/main.c:238: enemy->muerto = SI;
   6997 DD 7E FE      [19] 1002 	ld	a,-2 (ix)
   699A C6 08         [ 7] 1003 	add	a, #0x08
   699C DD 77 FA      [19] 1004 	ld	-6 (ix),a
   699F DD 7E FF      [19] 1005 	ld	a,-1 (ix)
   69A2 CE 00         [ 7] 1006 	adc	a, #0x00
   69A4 DD 77 FB      [19] 1007 	ld	-5 (ix),a
                           1008 ;src/main.c:233: switch (direction) {
   69A7 DD 5E 04      [19] 1009 	ld	e,4 (ix)
   69AA 16 00         [ 7] 1010 	ld	d,#0x00
   69AC 21 B3 69      [10] 1011 	ld	hl,#00196$
   69AF 19            [11] 1012 	add	hl,de
   69B0 19            [11] 1013 	add	hl,de
   69B1 19            [11] 1014 	add	hl,de
   69B2 E9            [ 4] 1015 	jp	(hl)
   69B3                    1016 00196$:
   69B3 C3 27 6A      [10] 1017 	jp	00109$
   69B6 C3 BF 69      [10] 1018 	jp	00101$
   69B9 C3 F0 6A      [10] 1019 	jp	00125$
   69BC C3 8F 6A      [10] 1020 	jp	00117$
                           1021 ;src/main.c:234: case 1:
   69BF                    1022 00101$:
                           1023 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69BF 21 2E 64      [10] 1024 	ld	hl, #_cu + 1
   69C2 4E            [ 7] 1025 	ld	c,(hl)
   69C3 06 00         [ 7] 1026 	ld	b,#0x00
   69C5 21 04 00      [10] 1027 	ld	hl,#0x0004
   69C8 09            [11] 1028 	add	hl,bc
   69C9 5D            [ 4] 1029 	ld	e,l
   69CA 7C            [ 4] 1030 	ld	a, h
   69CB B3            [ 4] 1031 	or	a, e
   69CC D6 01         [ 7] 1032 	sub	a,#0x01
   69CE 3E 00         [ 7] 1033 	ld	a,#0x00
   69D0 17            [ 4] 1034 	rla
   69D1 5F            [ 4] 1035 	ld	e,a
   69D2 DD 6E FC      [19] 1036 	ld	l,-4 (ix)
   69D5 DD 66 FD      [19] 1037 	ld	h,-3 (ix)
   69D8 6E            [ 7] 1038 	ld	l,(hl)
   69D9 55            [ 4] 1039 	ld	d,l
   69DA 7B            [ 4] 1040 	ld	a,e
   69DB 92            [ 4] 1041 	sub	a, d
   69DC E2 E1 69      [10] 1042 	jp	PO, 00197$
   69DF EE 80         [ 7] 1043 	xor	a, #0x80
   69E1                    1044 00197$:
   69E1 FA F6 69      [10] 1045 	jp	M,00106$
   69E4 26 00         [ 7] 1046 	ld	h,#0x00
   69E6 11 16 00      [10] 1047 	ld	de,#0x0016
   69E9 19            [11] 1048 	add	hl,de
   69EA 7D            [ 4] 1049 	ld	a,l
   69EB 91            [ 4] 1050 	sub	a, c
   69EC 7C            [ 4] 1051 	ld	a,h
   69ED 98            [ 4] 1052 	sbc	a, b
   69EE E2 F3 69      [10] 1053 	jp	PO, 00198$
   69F1 EE 80         [ 7] 1054 	xor	a, #0x80
   69F3                    1055 00198$:
   69F3 F2 4E 6B      [10] 1056 	jp	P,00134$
   69F6                    1057 00106$:
                           1058 ;src/main.c:236: if(cu.x > enemy->x){ //si el cu esta abajo
   69F6 21 2D 64      [10] 1059 	ld	hl, #_cu + 0
   69F9 4E            [ 7] 1060 	ld	c,(hl)
   69FA DD 6E FE      [19] 1061 	ld	l,-2 (ix)
   69FD DD 66 FF      [19] 1062 	ld	h,-1 (ix)
   6A00 5E            [ 7] 1063 	ld	e,(hl)
   6A01 7B            [ 4] 1064 	ld	a,e
   6A02 91            [ 4] 1065 	sub	a, c
   6A03 D2 4E 6B      [10] 1066 	jp	NC,00134$
                           1067 ;src/main.c:237: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A06 69            [ 4] 1068 	ld	l,c
   6A07 26 00         [ 7] 1069 	ld	h,#0x00
   6A09 16 00         [ 7] 1070 	ld	d,#0x00
   6A0B 13            [ 6] 1071 	inc	de
   6A0C 13            [ 6] 1072 	inc	de
   6A0D 13            [ 6] 1073 	inc	de
   6A0E 13            [ 6] 1074 	inc	de
   6A0F BF            [ 4] 1075 	cp	a, a
   6A10 ED 52         [15] 1076 	sbc	hl, de
   6A12 3E 01         [ 7] 1077 	ld	a,#0x01
   6A14 BD            [ 4] 1078 	cp	a, l
   6A15 3E 00         [ 7] 1079 	ld	a,#0x00
   6A17 9C            [ 4] 1080 	sbc	a, h
   6A18 E2 1D 6A      [10] 1081 	jp	PO, 00199$
   6A1B EE 80         [ 7] 1082 	xor	a, #0x80
   6A1D                    1083 00199$:
   6A1D FA 4E 6B      [10] 1084 	jp	M,00134$
                           1085 ;src/main.c:238: enemy->muerto = SI;
   6A20 E1            [10] 1086 	pop	hl
   6A21 E5            [11] 1087 	push	hl
   6A22 36 01         [10] 1088 	ld	(hl),#0x01
                           1089 ;src/main.c:242: break;
   6A24 C3 4E 6B      [10] 1090 	jp	00134$
                           1091 ;src/main.c:243: case 0:
   6A27                    1092 00109$:
                           1093 ;src/main.c:244: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6A27 21 2E 64      [10] 1094 	ld	hl, #_cu + 1
   6A2A 4E            [ 7] 1095 	ld	c,(hl)
   6A2B 06 00         [ 7] 1096 	ld	b,#0x00
   6A2D 21 04 00      [10] 1097 	ld	hl,#0x0004
   6A30 09            [11] 1098 	add	hl,bc
   6A31 5D            [ 4] 1099 	ld	e,l
   6A32 7C            [ 4] 1100 	ld	a, h
   6A33 B3            [ 4] 1101 	or	a, e
   6A34 D6 01         [ 7] 1102 	sub	a,#0x01
   6A36 3E 00         [ 7] 1103 	ld	a,#0x00
   6A38 17            [ 4] 1104 	rla
   6A39 5F            [ 4] 1105 	ld	e,a
   6A3A DD 6E FC      [19] 1106 	ld	l,-4 (ix)
   6A3D DD 66 FD      [19] 1107 	ld	h,-3 (ix)
   6A40 6E            [ 7] 1108 	ld	l,(hl)
   6A41 55            [ 4] 1109 	ld	d,l
   6A42 7B            [ 4] 1110 	ld	a,e
   6A43 92            [ 4] 1111 	sub	a, d
   6A44 E2 49 6A      [10] 1112 	jp	PO, 00200$
   6A47 EE 80         [ 7] 1113 	xor	a, #0x80
   6A49                    1114 00200$:
   6A49 FA 5E 6A      [10] 1115 	jp	M,00114$
   6A4C 26 00         [ 7] 1116 	ld	h,#0x00
   6A4E 11 16 00      [10] 1117 	ld	de,#0x0016
   6A51 19            [11] 1118 	add	hl,de
   6A52 7D            [ 4] 1119 	ld	a,l
   6A53 91            [ 4] 1120 	sub	a, c
   6A54 7C            [ 4] 1121 	ld	a,h
   6A55 98            [ 4] 1122 	sbc	a, b
   6A56 E2 5B 6A      [10] 1123 	jp	PO, 00201$
   6A59 EE 80         [ 7] 1124 	xor	a, #0x80
   6A5B                    1125 00201$:
   6A5B F2 4E 6B      [10] 1126 	jp	P,00134$
   6A5E                    1127 00114$:
                           1128 ;src/main.c:245: if(enemy->x > cu.x){ //si el cu esta abajo
   6A5E DD 6E FE      [19] 1129 	ld	l,-2 (ix)
   6A61 DD 66 FF      [19] 1130 	ld	h,-1 (ix)
   6A64 4E            [ 7] 1131 	ld	c,(hl)
   6A65 21 2D 64      [10] 1132 	ld	hl, #_cu + 0
   6A68 5E            [ 7] 1133 	ld	e,(hl)
   6A69 7B            [ 4] 1134 	ld	a,e
   6A6A 91            [ 4] 1135 	sub	a, c
   6A6B D2 4E 6B      [10] 1136 	jp	NC,00134$
                           1137 ;src/main.c:246: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A6E 69            [ 4] 1138 	ld	l,c
   6A6F 26 00         [ 7] 1139 	ld	h,#0x00
   6A71 16 00         [ 7] 1140 	ld	d,#0x00
   6A73 13            [ 6] 1141 	inc	de
   6A74 13            [ 6] 1142 	inc	de
   6A75 13            [ 6] 1143 	inc	de
   6A76 13            [ 6] 1144 	inc	de
   6A77 BF            [ 4] 1145 	cp	a, a
   6A78 ED 52         [15] 1146 	sbc	hl, de
   6A7A 3E 01         [ 7] 1147 	ld	a,#0x01
   6A7C BD            [ 4] 1148 	cp	a, l
   6A7D 3E 00         [ 7] 1149 	ld	a,#0x00
   6A7F 9C            [ 4] 1150 	sbc	a, h
   6A80 E2 85 6A      [10] 1151 	jp	PO, 00202$
   6A83 EE 80         [ 7] 1152 	xor	a, #0x80
   6A85                    1153 00202$:
   6A85 FA 4E 6B      [10] 1154 	jp	M,00134$
                           1155 ;src/main.c:247: enemy->muerto = SI;
   6A88 E1            [10] 1156 	pop	hl
   6A89 E5            [11] 1157 	push	hl
   6A8A 36 01         [10] 1158 	ld	(hl),#0x01
                           1159 ;src/main.c:251: break;
   6A8C C3 4E 6B      [10] 1160 	jp	00134$
                           1161 ;src/main.c:252: case 3:
   6A8F                    1162 00117$:
                           1163 ;src/main.c:253: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6A8F 21 2D 64      [10] 1164 	ld	hl, #_cu + 0
   6A92 4E            [ 7] 1165 	ld	c,(hl)
   6A93 06 00         [ 7] 1166 	ld	b,#0x00
   6A95 59            [ 4] 1167 	ld	e, c
   6A96 50            [ 4] 1168 	ld	d, b
   6A97 13            [ 6] 1169 	inc	de
   6A98 13            [ 6] 1170 	inc	de
   6A99 DD 6E FE      [19] 1171 	ld	l,-2 (ix)
   6A9C DD 66 FF      [19] 1172 	ld	h,-1 (ix)
   6A9F 6E            [ 7] 1173 	ld	l,(hl)
   6AA0 26 00         [ 7] 1174 	ld	h,#0x00
   6AA2 7B            [ 4] 1175 	ld	a,e
   6AA3 95            [ 4] 1176 	sub	a, l
   6AA4 7A            [ 4] 1177 	ld	a,d
   6AA5 9C            [ 4] 1178 	sbc	a, h
   6AA6 E2 AB 6A      [10] 1179 	jp	PO, 00203$
   6AA9 EE 80         [ 7] 1180 	xor	a, #0x80
   6AAB                    1181 00203$:
   6AAB FA 4E 6B      [10] 1182 	jp	M,00134$
   6AAE 11 04 00      [10] 1183 	ld	de,#0x0004
   6AB1 19            [11] 1184 	add	hl,de
   6AB2 7D            [ 4] 1185 	ld	a,l
   6AB3 91            [ 4] 1186 	sub	a, c
   6AB4 7C            [ 4] 1187 	ld	a,h
   6AB5 98            [ 4] 1188 	sbc	a, b
   6AB6 E2 BB 6A      [10] 1189 	jp	PO, 00204$
   6AB9 EE 80         [ 7] 1190 	xor	a, #0x80
   6ABB                    1191 00204$:
   6ABB FA 4E 6B      [10] 1192 	jp	M,00134$
                           1193 ;src/main.c:254: if(enemy->y>cu.y){
   6ABE DD 6E FC      [19] 1194 	ld	l,-4 (ix)
   6AC1 DD 66 FD      [19] 1195 	ld	h,-3 (ix)
   6AC4 4E            [ 7] 1196 	ld	c,(hl)
   6AC5 21 2E 64      [10] 1197 	ld	hl, #(_cu + 0x0001) + 0
   6AC8 5E            [ 7] 1198 	ld	e,(hl)
   6AC9 7B            [ 4] 1199 	ld	a,e
   6ACA 91            [ 4] 1200 	sub	a, c
   6ACB D2 4E 6B      [10] 1201 	jp	NC,00134$
                           1202 ;src/main.c:255: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6ACE 06 00         [ 7] 1203 	ld	b,#0x00
   6AD0 16 00         [ 7] 1204 	ld	d,#0x00
   6AD2 21 08 00      [10] 1205 	ld	hl,#0x0008
   6AD5 19            [11] 1206 	add	hl,de
   6AD6 79            [ 4] 1207 	ld	a,c
   6AD7 95            [ 4] 1208 	sub	a, l
   6AD8 4F            [ 4] 1209 	ld	c,a
   6AD9 78            [ 4] 1210 	ld	a,b
   6ADA 9C            [ 4] 1211 	sbc	a, h
   6ADB 47            [ 4] 1212 	ld	b,a
   6ADC 3E 02         [ 7] 1213 	ld	a,#0x02
   6ADE B9            [ 4] 1214 	cp	a, c
   6ADF 3E 00         [ 7] 1215 	ld	a,#0x00
   6AE1 98            [ 4] 1216 	sbc	a, b
   6AE2 E2 E7 6A      [10] 1217 	jp	PO, 00205$
   6AE5 EE 80         [ 7] 1218 	xor	a, #0x80
   6AE7                    1219 00205$:
   6AE7 F2 4E 6B      [10] 1220 	jp	P,00134$
                           1221 ;src/main.c:256: enemy->muerto = SI;
   6AEA E1            [10] 1222 	pop	hl
   6AEB E5            [11] 1223 	push	hl
   6AEC 36 01         [10] 1224 	ld	(hl),#0x01
                           1225 ;src/main.c:260: break;
   6AEE 18 5E         [12] 1226 	jr	00134$
                           1227 ;src/main.c:261: case 2:
   6AF0                    1228 00125$:
                           1229 ;src/main.c:262: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AF0 21 2D 64      [10] 1230 	ld	hl, #_cu + 0
   6AF3 4E            [ 7] 1231 	ld	c,(hl)
   6AF4 06 00         [ 7] 1232 	ld	b,#0x00
   6AF6 59            [ 4] 1233 	ld	e, c
   6AF7 50            [ 4] 1234 	ld	d, b
   6AF8 13            [ 6] 1235 	inc	de
   6AF9 13            [ 6] 1236 	inc	de
   6AFA DD 6E FE      [19] 1237 	ld	l,-2 (ix)
   6AFD DD 66 FF      [19] 1238 	ld	h,-1 (ix)
   6B00 6E            [ 7] 1239 	ld	l,(hl)
   6B01 26 00         [ 7] 1240 	ld	h,#0x00
   6B03 7B            [ 4] 1241 	ld	a,e
   6B04 95            [ 4] 1242 	sub	a, l
   6B05 7A            [ 4] 1243 	ld	a,d
   6B06 9C            [ 4] 1244 	sbc	a, h
   6B07 E2 0C 6B      [10] 1245 	jp	PO, 00206$
   6B0A EE 80         [ 7] 1246 	xor	a, #0x80
   6B0C                    1247 00206$:
   6B0C FA 4E 6B      [10] 1248 	jp	M,00134$
   6B0F 11 04 00      [10] 1249 	ld	de,#0x0004
   6B12 19            [11] 1250 	add	hl,de
   6B13 7D            [ 4] 1251 	ld	a,l
   6B14 91            [ 4] 1252 	sub	a, c
   6B15 7C            [ 4] 1253 	ld	a,h
   6B16 98            [ 4] 1254 	sbc	a, b
   6B17 E2 1C 6B      [10] 1255 	jp	PO, 00207$
   6B1A EE 80         [ 7] 1256 	xor	a, #0x80
   6B1C                    1257 00207$:
   6B1C FA 4E 6B      [10] 1258 	jp	M,00134$
                           1259 ;src/main.c:263: if(cu.y > enemy->y){ //si el cu esta abajo
   6B1F 21 2E 64      [10] 1260 	ld	hl, #(_cu + 0x0001) + 0
   6B22 4E            [ 7] 1261 	ld	c,(hl)
   6B23 DD 6E FC      [19] 1262 	ld	l,-4 (ix)
   6B26 DD 66 FD      [19] 1263 	ld	h,-3 (ix)
   6B29 5E            [ 7] 1264 	ld	e,(hl)
   6B2A 7B            [ 4] 1265 	ld	a,e
   6B2B 91            [ 4] 1266 	sub	a, c
   6B2C 30 20         [12] 1267 	jr	NC,00134$
                           1268 ;src/main.c:264: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6B2E 06 00         [ 7] 1269 	ld	b,#0x00
   6B30 16 00         [ 7] 1270 	ld	d,#0x00
   6B32 21 16 00      [10] 1271 	ld	hl,#0x0016
   6B35 19            [11] 1272 	add	hl,de
   6B36 79            [ 4] 1273 	ld	a,c
   6B37 95            [ 4] 1274 	sub	a, l
   6B38 4F            [ 4] 1275 	ld	c,a
   6B39 78            [ 4] 1276 	ld	a,b
   6B3A 9C            [ 4] 1277 	sbc	a, h
   6B3B 47            [ 4] 1278 	ld	b,a
   6B3C 3E 02         [ 7] 1279 	ld	a,#0x02
   6B3E B9            [ 4] 1280 	cp	a, c
   6B3F 3E 00         [ 7] 1281 	ld	a,#0x00
   6B41 98            [ 4] 1282 	sbc	a, b
   6B42 E2 47 6B      [10] 1283 	jp	PO, 00208$
   6B45 EE 80         [ 7] 1284 	xor	a, #0x80
   6B47                    1285 00208$:
   6B47 F2 4E 6B      [10] 1286 	jp	P,00134$
                           1287 ;src/main.c:265: enemy->muerto = SI;
   6B4A E1            [10] 1288 	pop	hl
   6B4B E5            [11] 1289 	push	hl
   6B4C 36 01         [10] 1290 	ld	(hl),#0x01
                           1291 ;src/main.c:271: }
   6B4E                    1292 00134$:
   6B4E DD F9         [10] 1293 	ld	sp, ix
   6B50 DD E1         [14] 1294 	pop	ix
   6B52 C9            [10] 1295 	ret
                           1296 ;src/main.c:274: void moverEnemigoArriba(TEnemy *enemy){
                           1297 ;	---------------------------------
                           1298 ; Function moverEnemigoArriba
                           1299 ; ---------------------------------
   6B53                    1300 _moverEnemigoArriba::
   6B53 DD E5         [15] 1301 	push	ix
   6B55 DD 21 00 00   [14] 1302 	ld	ix,#0
   6B59 DD 39         [15] 1303 	add	ix,sp
                           1304 ;src/main.c:275: enemy->y--;
   6B5B DD 4E 04      [19] 1305 	ld	c,4 (ix)
   6B5E DD 46 05      [19] 1306 	ld	b,5 (ix)
   6B61 69            [ 4] 1307 	ld	l, c
   6B62 60            [ 4] 1308 	ld	h, b
   6B63 23            [ 6] 1309 	inc	hl
   6B64 5E            [ 7] 1310 	ld	e,(hl)
   6B65 1D            [ 4] 1311 	dec	e
   6B66 73            [ 7] 1312 	ld	(hl),e
                           1313 ;src/main.c:276: enemy->y--;
   6B67 1D            [ 4] 1314 	dec	e
   6B68 73            [ 7] 1315 	ld	(hl),e
                           1316 ;src/main.c:277: enemy->mover = SI;
   6B69 21 06 00      [10] 1317 	ld	hl,#0x0006
   6B6C 09            [11] 1318 	add	hl,bc
   6B6D 36 01         [10] 1319 	ld	(hl),#0x01
   6B6F DD E1         [14] 1320 	pop	ix
   6B71 C9            [10] 1321 	ret
                           1322 ;src/main.c:280: void moverEnemigoAbajo(TEnemy *enemy){
                           1323 ;	---------------------------------
                           1324 ; Function moverEnemigoAbajo
                           1325 ; ---------------------------------
   6B72                    1326 _moverEnemigoAbajo::
   6B72 DD E5         [15] 1327 	push	ix
   6B74 DD 21 00 00   [14] 1328 	ld	ix,#0
   6B78 DD 39         [15] 1329 	add	ix,sp
                           1330 ;src/main.c:281: enemy->y++;
   6B7A DD 4E 04      [19] 1331 	ld	c,4 (ix)
   6B7D DD 46 05      [19] 1332 	ld	b,5 (ix)
   6B80 59            [ 4] 1333 	ld	e, c
   6B81 50            [ 4] 1334 	ld	d, b
   6B82 13            [ 6] 1335 	inc	de
   6B83 1A            [ 7] 1336 	ld	a,(de)
   6B84 3C            [ 4] 1337 	inc	a
   6B85 12            [ 7] 1338 	ld	(de),a
                           1339 ;src/main.c:282: enemy->y++;
   6B86 3C            [ 4] 1340 	inc	a
   6B87 12            [ 7] 1341 	ld	(de),a
                           1342 ;src/main.c:283: enemy->mover = SI;
   6B88 21 06 00      [10] 1343 	ld	hl,#0x0006
   6B8B 09            [11] 1344 	add	hl,bc
   6B8C 36 01         [10] 1345 	ld	(hl),#0x01
   6B8E DD E1         [14] 1346 	pop	ix
   6B90 C9            [10] 1347 	ret
                           1348 ;src/main.c:286: void moverEnemigoDerecha(TEnemy *enemy){
                           1349 ;	---------------------------------
                           1350 ; Function moverEnemigoDerecha
                           1351 ; ---------------------------------
   6B91                    1352 _moverEnemigoDerecha::
                           1353 ;src/main.c:287: enemy->x++;
   6B91 D1            [10] 1354 	pop	de
   6B92 C1            [10] 1355 	pop	bc
   6B93 C5            [11] 1356 	push	bc
   6B94 D5            [11] 1357 	push	de
   6B95 0A            [ 7] 1358 	ld	a,(bc)
   6B96 3C            [ 4] 1359 	inc	a
   6B97 02            [ 7] 1360 	ld	(bc),a
                           1361 ;src/main.c:288: enemy->x++;
   6B98 3C            [ 4] 1362 	inc	a
   6B99 02            [ 7] 1363 	ld	(bc),a
                           1364 ;src/main.c:289: enemy->mover = SI;
   6B9A 21 06 00      [10] 1365 	ld	hl,#0x0006
   6B9D 09            [11] 1366 	add	hl,bc
   6B9E 36 01         [10] 1367 	ld	(hl),#0x01
   6BA0 C9            [10] 1368 	ret
                           1369 ;src/main.c:292: void moverEnemigoIzquierda(TEnemy *enemy){
                           1370 ;	---------------------------------
                           1371 ; Function moverEnemigoIzquierda
                           1372 ; ---------------------------------
   6BA1                    1373 _moverEnemigoIzquierda::
                           1374 ;src/main.c:293: enemy->x--;
   6BA1 D1            [10] 1375 	pop	de
   6BA2 C1            [10] 1376 	pop	bc
   6BA3 C5            [11] 1377 	push	bc
   6BA4 D5            [11] 1378 	push	de
   6BA5 0A            [ 7] 1379 	ld	a,(bc)
   6BA6 C6 FF         [ 7] 1380 	add	a,#0xFF
   6BA8 02            [ 7] 1381 	ld	(bc),a
                           1382 ;src/main.c:294: enemy->x--;
   6BA9 C6 FF         [ 7] 1383 	add	a,#0xFF
   6BAB 02            [ 7] 1384 	ld	(bc),a
                           1385 ;src/main.c:295: enemy->mover = SI;
   6BAC 21 06 00      [10] 1386 	ld	hl,#0x0006
   6BAF 09            [11] 1387 	add	hl,bc
   6BB0 36 01         [10] 1388 	ld	(hl),#0x01
   6BB2 C9            [10] 1389 	ret
                           1390 ;src/main.c:298: void moverEnemigoPatrol(TEnemy* enemy){
                           1391 ;	---------------------------------
                           1392 ; Function moverEnemigoPatrol
                           1393 ; ---------------------------------
   6BB3                    1394 _moverEnemigoPatrol::
   6BB3 DD E5         [15] 1395 	push	ix
   6BB5 DD 21 00 00   [14] 1396 	ld	ix,#0
   6BB9 DD 39         [15] 1397 	add	ix,sp
   6BBB 21 F3 FF      [10] 1398 	ld	hl,#-13
   6BBE 39            [11] 1399 	add	hl,sp
   6BBF F9            [ 6] 1400 	ld	sp,hl
                           1401 ;src/main.c:300: if(!enemy->muerto){
   6BC0 DD 4E 04      [19] 1402 	ld	c,4 (ix)
   6BC3 DD 46 05      [19] 1403 	ld	b,5 (ix)
   6BC6 C5            [11] 1404 	push	bc
   6BC7 FD E1         [14] 1405 	pop	iy
   6BC9 FD 7E 08      [19] 1406 	ld	a,8 (iy)
   6BCC B7            [ 4] 1407 	or	a, a
   6BCD C2 F7 6D      [10] 1408 	jp	NZ,00118$
                           1409 ;src/main.c:301: if (!enemy->reversePatrol) {
   6BD0 21 0B 00      [10] 1410 	ld	hl,#0x000B
   6BD3 09            [11] 1411 	add	hl,bc
   6BD4 DD 75 FE      [19] 1412 	ld	-2 (ix),l
   6BD7 DD 74 FF      [19] 1413 	ld	-1 (ix),h
   6BDA DD 6E FE      [19] 1414 	ld	l,-2 (ix)
   6BDD DD 66 FF      [19] 1415 	ld	h,-1 (ix)
   6BE0 7E            [ 7] 1416 	ld	a,(hl)
   6BE1 DD 77 FD      [19] 1417 	ld	-3 (ix),a
                           1418 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6BE4 21 0D 00      [10] 1419 	ld	hl,#0x000D
   6BE7 09            [11] 1420 	add	hl,bc
   6BE8 DD 75 FB      [19] 1421 	ld	-5 (ix),l
   6BEB DD 74 FC      [19] 1422 	ld	-4 (ix),h
   6BEE DD 6E FB      [19] 1423 	ld	l,-5 (ix)
   6BF1 DD 66 FC      [19] 1424 	ld	h,-4 (ix)
   6BF4 5E            [ 7] 1425 	ld	e,(hl)
   6BF5 23            [ 6] 1426 	inc	hl
   6BF6 56            [ 7] 1427 	ld	d,(hl)
   6BF7 21 E1 00      [10] 1428 	ld	hl,#0x00E1
   6BFA 09            [11] 1429 	add	hl,bc
   6BFB DD 75 F9      [19] 1430 	ld	-7 (ix),l
   6BFE DD 74 FA      [19] 1431 	ld	-6 (ix),h
                           1432 ;src/main.c:304: enemy->mover = SI;
   6C01 21 06 00      [10] 1433 	ld	hl,#0x0006
   6C04 09            [11] 1434 	add	hl,bc
   6C05 DD 75 F7      [19] 1435 	ld	-9 (ix),l
   6C08 DD 74 F8      [19] 1436 	ld	-8 (ix),h
                           1437 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6C0B 21 19 00      [10] 1438 	ld	hl,#0x0019
   6C0E 09            [11] 1439 	add	hl,bc
   6C0F DD 75 F5      [19] 1440 	ld	-11 (ix),l
   6C12 DD 74 F6      [19] 1441 	ld	-10 (ix),h
                           1442 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6C15 21 01 00      [10] 1443 	ld	hl,#0x0001
   6C18 09            [11] 1444 	add	hl,bc
   6C19 E3            [19] 1445 	ex	(sp), hl
                           1446 ;src/main.c:301: if (!enemy->reversePatrol) {
   6C1A DD 7E FD      [19] 1447 	ld	a,-3 (ix)
   6C1D B7            [ 4] 1448 	or	a, a
   6C1E C2 F5 6C      [10] 1449 	jp	NZ,00114$
                           1450 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6C21 DD 6E F9      [19] 1451 	ld	l,-7 (ix)
   6C24 DD 66 FA      [19] 1452 	ld	h,-6 (ix)
   6C27 6E            [ 7] 1453 	ld	l,(hl)
   6C28 26 00         [ 7] 1454 	ld	h,#0x00
   6C2A 7B            [ 4] 1455 	ld	a,e
   6C2B 95            [ 4] 1456 	sub	a, l
   6C2C 7A            [ 4] 1457 	ld	a,d
   6C2D 9C            [ 4] 1458 	sbc	a, h
   6C2E E2 33 6C      [10] 1459 	jp	PO, 00144$
   6C31 EE 80         [ 7] 1460 	xor	a, #0x80
   6C33                    1461 00144$:
   6C33 F2 D0 6C      [10] 1462 	jp	P,00105$
                           1463 ;src/main.c:303: if(enemy->iter == 0){
   6C36 7A            [ 4] 1464 	ld	a,d
   6C37 B3            [ 4] 1465 	or	a,e
   6C38 20 50         [12] 1466 	jr	NZ,00102$
                           1467 ;src/main.c:304: enemy->mover = SI;
   6C3A DD 6E F7      [19] 1468 	ld	l,-9 (ix)
   6C3D DD 66 F8      [19] 1469 	ld	h,-8 (ix)
   6C40 36 01         [10] 1470 	ld	(hl),#0x01
                           1471 ;src/main.c:305: enemy->iter = 2;
   6C42 DD 6E FB      [19] 1472 	ld	l,-5 (ix)
   6C45 DD 66 FC      [19] 1473 	ld	h,-4 (ix)
   6C48 36 02         [10] 1474 	ld	(hl),#0x02
   6C4A 23            [ 6] 1475 	inc	hl
   6C4B 36 00         [10] 1476 	ld	(hl),#0x00
                           1477 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6C4D DD 6E FB      [19] 1478 	ld	l,-5 (ix)
   6C50 DD 66 FC      [19] 1479 	ld	h,-4 (ix)
   6C53 5E            [ 7] 1480 	ld	e,(hl)
   6C54 23            [ 6] 1481 	inc	hl
   6C55 56            [ 7] 1482 	ld	d,(hl)
   6C56 DD 6E F5      [19] 1483 	ld	l,-11 (ix)
   6C59 DD 66 F6      [19] 1484 	ld	h,-10 (ix)
   6C5C 19            [11] 1485 	add	hl,de
   6C5D 7E            [ 7] 1486 	ld	a,(hl)
   6C5E 02            [ 7] 1487 	ld	(bc),a
                           1488 ;src/main.c:307: ++enemy->iter;
   6C5F DD 6E FB      [19] 1489 	ld	l,-5 (ix)
   6C62 DD 66 FC      [19] 1490 	ld	h,-4 (ix)
   6C65 4E            [ 7] 1491 	ld	c,(hl)
   6C66 23            [ 6] 1492 	inc	hl
   6C67 46            [ 7] 1493 	ld	b,(hl)
   6C68 03            [ 6] 1494 	inc	bc
   6C69 DD 6E FB      [19] 1495 	ld	l,-5 (ix)
   6C6C DD 66 FC      [19] 1496 	ld	h,-4 (ix)
   6C6F 71            [ 7] 1497 	ld	(hl),c
   6C70 23            [ 6] 1498 	inc	hl
   6C71 70            [ 7] 1499 	ld	(hl),b
                           1500 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6C72 DD 6E F5      [19] 1501 	ld	l,-11 (ix)
   6C75 DD 66 F6      [19] 1502 	ld	h,-10 (ix)
   6C78 09            [11] 1503 	add	hl,bc
   6C79 5E            [ 7] 1504 	ld	e,(hl)
   6C7A E1            [10] 1505 	pop	hl
   6C7B E5            [11] 1506 	push	hl
   6C7C 73            [ 7] 1507 	ld	(hl),e
                           1508 ;src/main.c:309: ++enemy->iter;
   6C7D 03            [ 6] 1509 	inc	bc
   6C7E DD 6E FB      [19] 1510 	ld	l,-5 (ix)
   6C81 DD 66 FC      [19] 1511 	ld	h,-4 (ix)
   6C84 71            [ 7] 1512 	ld	(hl),c
   6C85 23            [ 6] 1513 	inc	hl
   6C86 70            [ 7] 1514 	ld	(hl),b
   6C87 C3 F7 6D      [10] 1515 	jp	00118$
   6C8A                    1516 00102$:
                           1517 ;src/main.c:311: enemy->mover = SI;
   6C8A DD 6E F7      [19] 1518 	ld	l,-9 (ix)
   6C8D DD 66 F8      [19] 1519 	ld	h,-8 (ix)
   6C90 36 01         [10] 1520 	ld	(hl),#0x01
                           1521 ;src/main.c:312: enemy->x = enemy->camino[enemy->iter];
   6C92 DD 6E FB      [19] 1522 	ld	l,-5 (ix)
   6C95 DD 66 FC      [19] 1523 	ld	h,-4 (ix)
   6C98 5E            [ 7] 1524 	ld	e,(hl)
   6C99 23            [ 6] 1525 	inc	hl
   6C9A 56            [ 7] 1526 	ld	d,(hl)
   6C9B DD 6E F5      [19] 1527 	ld	l,-11 (ix)
   6C9E DD 66 F6      [19] 1528 	ld	h,-10 (ix)
   6CA1 19            [11] 1529 	add	hl,de
   6CA2 7E            [ 7] 1530 	ld	a,(hl)
   6CA3 02            [ 7] 1531 	ld	(bc),a
                           1532 ;src/main.c:313: ++enemy->iter;
   6CA4 DD 6E FB      [19] 1533 	ld	l,-5 (ix)
   6CA7 DD 66 FC      [19] 1534 	ld	h,-4 (ix)
   6CAA 5E            [ 7] 1535 	ld	e,(hl)
   6CAB 23            [ 6] 1536 	inc	hl
   6CAC 56            [ 7] 1537 	ld	d,(hl)
   6CAD 13            [ 6] 1538 	inc	de
   6CAE DD 6E FB      [19] 1539 	ld	l,-5 (ix)
   6CB1 DD 66 FC      [19] 1540 	ld	h,-4 (ix)
   6CB4 73            [ 7] 1541 	ld	(hl),e
   6CB5 23            [ 6] 1542 	inc	hl
   6CB6 72            [ 7] 1543 	ld	(hl),d
                           1544 ;src/main.c:314: enemy->y = enemy->camino[enemy->iter];
   6CB7 DD 6E F5      [19] 1545 	ld	l,-11 (ix)
   6CBA DD 66 F6      [19] 1546 	ld	h,-10 (ix)
   6CBD 19            [11] 1547 	add	hl,de
   6CBE 7E            [ 7] 1548 	ld	a,(hl)
   6CBF E1            [10] 1549 	pop	hl
   6CC0 E5            [11] 1550 	push	hl
   6CC1 77            [ 7] 1551 	ld	(hl),a
                           1552 ;src/main.c:315: ++enemy->iter;
   6CC2 13            [ 6] 1553 	inc	de
   6CC3 4B            [ 4] 1554 	ld	c,e
   6CC4 DD 6E FB      [19] 1555 	ld	l,-5 (ix)
   6CC7 DD 66 FC      [19] 1556 	ld	h,-4 (ix)
   6CCA 71            [ 7] 1557 	ld	(hl),c
   6CCB 23            [ 6] 1558 	inc	hl
   6CCC 72            [ 7] 1559 	ld	(hl),d
   6CCD C3 F7 6D      [10] 1560 	jp	00118$
   6CD0                    1561 00105$:
                           1562 ;src/main.c:319: enemy->mover = NO;
   6CD0 DD 6E F7      [19] 1563 	ld	l,-9 (ix)
   6CD3 DD 66 F8      [19] 1564 	ld	h,-8 (ix)
   6CD6 36 00         [10] 1565 	ld	(hl),#0x00
                           1566 ;src/main.c:320: enemy->iter = enemy->longitud_camino;
   6CD8 DD 6E F9      [19] 1567 	ld	l,-7 (ix)
   6CDB DD 66 FA      [19] 1568 	ld	h,-6 (ix)
   6CDE 4E            [ 7] 1569 	ld	c,(hl)
   6CDF 06 00         [ 7] 1570 	ld	b,#0x00
   6CE1 DD 6E FB      [19] 1571 	ld	l,-5 (ix)
   6CE4 DD 66 FC      [19] 1572 	ld	h,-4 (ix)
   6CE7 71            [ 7] 1573 	ld	(hl),c
   6CE8 23            [ 6] 1574 	inc	hl
   6CE9 70            [ 7] 1575 	ld	(hl),b
                           1576 ;src/main.c:321: enemy->reversePatrol = 1;
   6CEA DD 6E FE      [19] 1577 	ld	l,-2 (ix)
   6CED DD 66 FF      [19] 1578 	ld	h,-1 (ix)
   6CF0 36 01         [10] 1579 	ld	(hl),#0x01
   6CF2 C3 F7 6D      [10] 1580 	jp	00118$
   6CF5                    1581 00114$:
                           1582 ;src/main.c:324: if(enemy->iter > 0){
   6CF5 AF            [ 4] 1583 	xor	a, a
   6CF6 BB            [ 4] 1584 	cp	a, e
   6CF7 9A            [ 4] 1585 	sbc	a, d
   6CF8 E2 FD 6C      [10] 1586 	jp	PO, 00145$
   6CFB EE 80         [ 7] 1587 	xor	a, #0x80
   6CFD                    1588 00145$:
   6CFD F2 DD 6D      [10] 1589 	jp	P,00111$
                           1590 ;src/main.c:325: if(enemy->iter == enemy->longitud_camino){
   6D00 DD 6E F9      [19] 1591 	ld	l,-7 (ix)
   6D03 DD 66 FA      [19] 1592 	ld	h,-6 (ix)
   6D06 6E            [ 7] 1593 	ld	l,(hl)
   6D07 DD 75 F9      [19] 1594 	ld	-7 (ix),l
   6D0A DD 36 FA 00   [19] 1595 	ld	-6 (ix),#0x00
   6D0E 7B            [ 4] 1596 	ld	a,e
   6D0F DD 96 F9      [19] 1597 	sub	a, -7 (ix)
   6D12 C2 99 6D      [10] 1598 	jp	NZ,00108$
   6D15 7A            [ 4] 1599 	ld	a,d
   6D16 DD 96 FA      [19] 1600 	sub	a, -6 (ix)
   6D19 C2 99 6D      [10] 1601 	jp	NZ,00108$
                           1602 ;src/main.c:326: enemy->mover = SI;
   6D1C DD 6E F7      [19] 1603 	ld	l,-9 (ix)
   6D1F DD 66 F8      [19] 1604 	ld	h,-8 (ix)
   6D22 36 01         [10] 1605 	ld	(hl),#0x01
                           1606 ;src/main.c:327: enemy->iter = enemy->iter - 1;
   6D24 DD 6E FB      [19] 1607 	ld	l,-5 (ix)
   6D27 DD 66 FC      [19] 1608 	ld	h,-4 (ix)
   6D2A 5E            [ 7] 1609 	ld	e,(hl)
   6D2B 23            [ 6] 1610 	inc	hl
   6D2C 56            [ 7] 1611 	ld	d,(hl)
   6D2D 7B            [ 4] 1612 	ld	a,e
   6D2E C6 FF         [ 7] 1613 	add	a,#0xFF
   6D30 DD 77 F9      [19] 1614 	ld	-7 (ix),a
   6D33 7A            [ 4] 1615 	ld	a,d
   6D34 CE FF         [ 7] 1616 	adc	a,#0xFF
   6D36 DD 77 FA      [19] 1617 	ld	-6 (ix),a
   6D39 DD 6E FB      [19] 1618 	ld	l,-5 (ix)
   6D3C DD 66 FC      [19] 1619 	ld	h,-4 (ix)
   6D3F DD 7E F9      [19] 1620 	ld	a,-7 (ix)
   6D42 77            [ 7] 1621 	ld	(hl),a
   6D43 23            [ 6] 1622 	inc	hl
   6D44 DD 7E FA      [19] 1623 	ld	a,-6 (ix)
   6D47 77            [ 7] 1624 	ld	(hl),a
                           1625 ;src/main.c:328: enemy->iter = enemy->iter - 2;
   6D48 DD 5E F9      [19] 1626 	ld	e,-7 (ix)
   6D4B DD 56 FA      [19] 1627 	ld	d,-6 (ix)
   6D4E 1B            [ 6] 1628 	dec	de
   6D4F 1B            [ 6] 1629 	dec	de
   6D50 DD 6E FB      [19] 1630 	ld	l,-5 (ix)
   6D53 DD 66 FC      [19] 1631 	ld	h,-4 (ix)
   6D56 73            [ 7] 1632 	ld	(hl),e
   6D57 23            [ 6] 1633 	inc	hl
   6D58 72            [ 7] 1634 	ld	(hl),d
                           1635 ;src/main.c:329: enemy->y = enemy->camino[enemy->iter];
   6D59 DD 6E F5      [19] 1636 	ld	l,-11 (ix)
   6D5C DD 66 F6      [19] 1637 	ld	h,-10 (ix)
   6D5F 19            [11] 1638 	add	hl,de
   6D60 5E            [ 7] 1639 	ld	e,(hl)
   6D61 E1            [10] 1640 	pop	hl
   6D62 E5            [11] 1641 	push	hl
   6D63 73            [ 7] 1642 	ld	(hl),e
                           1643 ;src/main.c:330: --enemy->iter;
   6D64 DD 7E F9      [19] 1644 	ld	a,-7 (ix)
   6D67 C6 FD         [ 7] 1645 	add	a,#0xFD
   6D69 5F            [ 4] 1646 	ld	e,a
   6D6A DD 7E FA      [19] 1647 	ld	a,-6 (ix)
   6D6D CE FF         [ 7] 1648 	adc	a,#0xFF
   6D6F 57            [ 4] 1649 	ld	d,a
   6D70 DD 6E FB      [19] 1650 	ld	l,-5 (ix)
   6D73 DD 66 FC      [19] 1651 	ld	h,-4 (ix)
   6D76 73            [ 7] 1652 	ld	(hl),e
   6D77 23            [ 6] 1653 	inc	hl
   6D78 72            [ 7] 1654 	ld	(hl),d
                           1655 ;src/main.c:331: enemy->x = enemy->camino[enemy->iter];
   6D79 DD 6E F5      [19] 1656 	ld	l,-11 (ix)
   6D7C DD 66 F6      [19] 1657 	ld	h,-10 (ix)
   6D7F 19            [11] 1658 	add	hl,de
   6D80 7E            [ 7] 1659 	ld	a,(hl)
   6D81 02            [ 7] 1660 	ld	(bc),a
                           1661 ;src/main.c:332: --enemy->iter;
   6D82 DD 7E F9      [19] 1662 	ld	a,-7 (ix)
   6D85 C6 FC         [ 7] 1663 	add	a,#0xFC
   6D87 4F            [ 4] 1664 	ld	c,a
   6D88 DD 7E FA      [19] 1665 	ld	a,-6 (ix)
   6D8B CE FF         [ 7] 1666 	adc	a,#0xFF
   6D8D 47            [ 4] 1667 	ld	b,a
   6D8E DD 6E FB      [19] 1668 	ld	l,-5 (ix)
   6D91 DD 66 FC      [19] 1669 	ld	h,-4 (ix)
   6D94 71            [ 7] 1670 	ld	(hl),c
   6D95 23            [ 6] 1671 	inc	hl
   6D96 70            [ 7] 1672 	ld	(hl),b
   6D97 18 5E         [12] 1673 	jr	00118$
   6D99                    1674 00108$:
                           1675 ;src/main.c:334: enemy->mover = SI;
   6D99 DD 6E F7      [19] 1676 	ld	l,-9 (ix)
   6D9C DD 66 F8      [19] 1677 	ld	h,-8 (ix)
   6D9F 36 01         [10] 1678 	ld	(hl),#0x01
                           1679 ;src/main.c:335: enemy->y = enemy->camino[enemy->iter];
   6DA1 DD 6E FB      [19] 1680 	ld	l,-5 (ix)
   6DA4 DD 66 FC      [19] 1681 	ld	h,-4 (ix)
   6DA7 5E            [ 7] 1682 	ld	e,(hl)
   6DA8 23            [ 6] 1683 	inc	hl
   6DA9 56            [ 7] 1684 	ld	d,(hl)
   6DAA DD 6E F5      [19] 1685 	ld	l,-11 (ix)
   6DAD DD 66 F6      [19] 1686 	ld	h,-10 (ix)
   6DB0 19            [11] 1687 	add	hl,de
   6DB1 5E            [ 7] 1688 	ld	e,(hl)
   6DB2 E1            [10] 1689 	pop	hl
   6DB3 E5            [11] 1690 	push	hl
   6DB4 73            [ 7] 1691 	ld	(hl),e
                           1692 ;src/main.c:336: --enemy->iter;
   6DB5 DD 6E FB      [19] 1693 	ld	l,-5 (ix)
   6DB8 DD 66 FC      [19] 1694 	ld	h,-4 (ix)
   6DBB 5E            [ 7] 1695 	ld	e,(hl)
   6DBC 23            [ 6] 1696 	inc	hl
   6DBD 56            [ 7] 1697 	ld	d,(hl)
   6DBE 1B            [ 6] 1698 	dec	de
   6DBF DD 6E FB      [19] 1699 	ld	l,-5 (ix)
   6DC2 DD 66 FC      [19] 1700 	ld	h,-4 (ix)
   6DC5 73            [ 7] 1701 	ld	(hl),e
   6DC6 23            [ 6] 1702 	inc	hl
   6DC7 72            [ 7] 1703 	ld	(hl),d
                           1704 ;src/main.c:337: enemy->x = enemy->camino[enemy->iter];
   6DC8 DD 6E F5      [19] 1705 	ld	l,-11 (ix)
   6DCB DD 66 F6      [19] 1706 	ld	h,-10 (ix)
   6DCE 19            [11] 1707 	add	hl,de
   6DCF 7E            [ 7] 1708 	ld	a,(hl)
   6DD0 02            [ 7] 1709 	ld	(bc),a
                           1710 ;src/main.c:338: --enemy->iter;
   6DD1 1B            [ 6] 1711 	dec	de
   6DD2 DD 6E FB      [19] 1712 	ld	l,-5 (ix)
   6DD5 DD 66 FC      [19] 1713 	ld	h,-4 (ix)
   6DD8 73            [ 7] 1714 	ld	(hl),e
   6DD9 23            [ 6] 1715 	inc	hl
   6DDA 72            [ 7] 1716 	ld	(hl),d
   6DDB 18 1A         [12] 1717 	jr	00118$
   6DDD                    1718 00111$:
                           1719 ;src/main.c:342: enemy->mover = NO;
   6DDD DD 6E F7      [19] 1720 	ld	l,-9 (ix)
   6DE0 DD 66 F8      [19] 1721 	ld	h,-8 (ix)
   6DE3 36 00         [10] 1722 	ld	(hl),#0x00
                           1723 ;src/main.c:343: enemy->iter = 0;
   6DE5 DD 6E FB      [19] 1724 	ld	l,-5 (ix)
   6DE8 DD 66 FC      [19] 1725 	ld	h,-4 (ix)
   6DEB AF            [ 4] 1726 	xor	a, a
   6DEC 77            [ 7] 1727 	ld	(hl), a
   6DED 23            [ 6] 1728 	inc	hl
   6DEE 77            [ 7] 1729 	ld	(hl), a
                           1730 ;src/main.c:344: enemy->reversePatrol = 0;
   6DEF DD 6E FE      [19] 1731 	ld	l,-2 (ix)
   6DF2 DD 66 FF      [19] 1732 	ld	h,-1 (ix)
   6DF5 36 00         [10] 1733 	ld	(hl),#0x00
   6DF7                    1734 00118$:
   6DF7 DD F9         [10] 1735 	ld	sp, ix
   6DF9 DD E1         [14] 1736 	pop	ix
   6DFB C9            [10] 1737 	ret
                           1738 ;src/main.c:350: void lookFor(TEnemy* enemy){
                           1739 ;	---------------------------------
                           1740 ; Function lookFor
                           1741 ; ---------------------------------
   6DFC                    1742 _lookFor::
   6DFC DD E5         [15] 1743 	push	ix
   6DFE DD 21 00 00   [14] 1744 	ld	ix,#0
   6E02 DD 39         [15] 1745 	add	ix,sp
   6E04 21 F9 FF      [10] 1746 	ld	hl,#-7
   6E07 39            [11] 1747 	add	hl,sp
   6E08 F9            [ 6] 1748 	ld	sp,hl
                           1749 ;src/main.c:356: i16 difx = abs((i16)(enemy->x - prota.x));
   6E09 DD 5E 04      [19] 1750 	ld	e,4 (ix)
   6E0C DD 56 05      [19] 1751 	ld	d,5 (ix)
   6E0F 1A            [ 7] 1752 	ld	a,(de)
   6E10 4F            [ 4] 1753 	ld	c,a
   6E11 06 00         [ 7] 1754 	ld	b,#0x00
   6E13 21 25 64      [10] 1755 	ld	hl,#_prota+0
   6E16 6E            [ 7] 1756 	ld	l,(hl)
   6E17 26 00         [ 7] 1757 	ld	h,#0x00
   6E19 79            [ 4] 1758 	ld	a,c
   6E1A 95            [ 4] 1759 	sub	a, l
   6E1B 4F            [ 4] 1760 	ld	c,a
   6E1C 78            [ 4] 1761 	ld	a,b
   6E1D 9C            [ 4] 1762 	sbc	a, h
   6E1E 47            [ 4] 1763 	ld	b,a
   6E1F D5            [11] 1764 	push	de
   6E20 C5            [11] 1765 	push	bc
   6E21 CD A5 4B      [17] 1766 	call	_abs
   6E24 F1            [10] 1767 	pop	af
   6E25 D1            [10] 1768 	pop	de
   6E26 33            [ 6] 1769 	inc	sp
   6E27 33            [ 6] 1770 	inc	sp
   6E28 E5            [11] 1771 	push	hl
                           1772 ;src/main.c:357: i16 dify = abs((i16)(enemy->y - prota.y));
   6E29 21 01 00      [10] 1773 	ld	hl,#0x0001
   6E2C 19            [11] 1774 	add	hl,de
   6E2D DD 75 FC      [19] 1775 	ld	-4 (ix),l
   6E30 DD 74 FD      [19] 1776 	ld	-3 (ix),h
   6E33 DD 6E FC      [19] 1777 	ld	l,-4 (ix)
   6E36 DD 66 FD      [19] 1778 	ld	h,-3 (ix)
   6E39 4E            [ 7] 1779 	ld	c,(hl)
   6E3A 06 00         [ 7] 1780 	ld	b,#0x00
   6E3C 21 26 64      [10] 1781 	ld	hl, #(_prota + 0x0001) + 0
   6E3F 6E            [ 7] 1782 	ld	l,(hl)
   6E40 26 00         [ 7] 1783 	ld	h,#0x00
   6E42 79            [ 4] 1784 	ld	a,c
   6E43 95            [ 4] 1785 	sub	a, l
   6E44 4F            [ 4] 1786 	ld	c,a
   6E45 78            [ 4] 1787 	ld	a,b
   6E46 9C            [ 4] 1788 	sbc	a, h
   6E47 47            [ 4] 1789 	ld	b,a
   6E48 D5            [11] 1790 	push	de
   6E49 C5            [11] 1791 	push	bc
   6E4A CD A5 4B      [17] 1792 	call	_abs
   6E4D F1            [10] 1793 	pop	af
   6E4E D1            [10] 1794 	pop	de
                           1795 ;src/main.c:359: dist = difx + dify; // manhattan
   6E4F DD 4E F9      [19] 1796 	ld	c,-7 (ix)
   6E52 09            [11] 1797 	add	hl, bc
   6E53 DD 75 FB      [19] 1798 	ld	-5 (ix),l
                           1799 ;src/main.c:360: enemy->seen = NO;
   6E56 21 11 00      [10] 1800 	ld	hl,#0x0011
   6E59 19            [11] 1801 	add	hl,de
   6E5A DD 75 FE      [19] 1802 	ld	-2 (ix),l
   6E5D DD 74 FF      [19] 1803 	ld	-1 (ix),h
   6E60 DD 6E FE      [19] 1804 	ld	l,-2 (ix)
   6E63 DD 66 FF      [19] 1805 	ld	h,-1 (ix)
   6E66 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:361: enemy->in_range = NO;
   6E68 21 10 00      [10] 1808 	ld	hl,#0x0010
   6E6B 19            [11] 1809 	add	hl,de
   6E6C 4D            [ 4] 1810 	ld	c,l
   6E6D 44            [ 4] 1811 	ld	b,h
   6E6E AF            [ 4] 1812 	xor	a, a
   6E6F 02            [ 7] 1813 	ld	(bc),a
                           1814 ;src/main.c:363: if(!enemy->seek){
   6E70 D5            [11] 1815 	push	de
   6E71 FD E1         [14] 1816 	pop	iy
   6E73 FD 7E 13      [19] 1817 	ld	a,19 (iy)
   6E76 B7            [ 4] 1818 	or	a, a
   6E77 C2 FD 6E      [10] 1819 	jp	NZ,00111$
                           1820 ;src/main.c:364: if (dist <= 10) {// te detectan los sensores de proximidad
   6E7A 3E 0A         [ 7] 1821 	ld	a,#0x0A
   6E7C DD 96 FB      [19] 1822 	sub	a, -5 (ix)
   6E7F 38 13         [12] 1823 	jr	C,00107$
                           1824 ;src/main.c:365: enemy->in_range = 1;
   6E81 3E 01         [ 7] 1825 	ld	a,#0x01
   6E83 02            [ 7] 1826 	ld	(bc),a
                           1827 ;src/main.c:366: enemy->engage = 1;
   6E84 21 15 00      [10] 1828 	ld	hl,#0x0015
   6E87 19            [11] 1829 	add	hl,de
   6E88 36 01         [10] 1830 	ld	(hl),#0x01
                           1831 ;src/main.c:367: enemy->seen = SI;
   6E8A DD 6E FE      [19] 1832 	ld	l,-2 (ix)
   6E8D DD 66 FF      [19] 1833 	ld	h,-1 (ix)
   6E90 36 01         [10] 1834 	ld	(hl),#0x01
   6E92 18 69         [12] 1835 	jr	00111$
   6E94                    1836 00107$:
                           1837 ;src/main.c:368: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6E94 21 25 64      [10] 1838 	ld	hl, #_prota + 0
   6E97 4E            [ 7] 1839 	ld	c,(hl)
   6E98 1A            [ 7] 1840 	ld	a,(de)
   6E99 5F            [ 4] 1841 	ld	e,a
   6E9A 16 00         [ 7] 1842 	ld	d,#0x00
   6E9C 7B            [ 4] 1843 	ld	a,e
   6E9D C6 E7         [ 7] 1844 	add	a,#0xE7
   6E9F 6F            [ 4] 1845 	ld	l,a
   6EA0 7A            [ 4] 1846 	ld	a,d
   6EA1 CE FF         [ 7] 1847 	adc	a,#0xFF
   6EA3 67            [ 4] 1848 	ld	h,a
   6EA4 06 00         [ 7] 1849 	ld	b,#0x00
   6EA6 7D            [ 4] 1850 	ld	a,l
   6EA7 91            [ 4] 1851 	sub	a, c
   6EA8 7C            [ 4] 1852 	ld	a,h
   6EA9 98            [ 4] 1853 	sbc	a, b
   6EAA E2 AF 6E      [10] 1854 	jp	PO, 00137$
   6EAD EE 80         [ 7] 1855 	xor	a, #0x80
   6EAF                    1856 00137$:
   6EAF F2 FD 6E      [10] 1857 	jp	P,00111$
   6EB2 21 19 00      [10] 1858 	ld	hl,#0x0019
   6EB5 19            [11] 1859 	add	hl,de
   6EB6 79            [ 4] 1860 	ld	a,c
   6EB7 95            [ 4] 1861 	sub	a, l
   6EB8 78            [ 4] 1862 	ld	a,b
   6EB9 9C            [ 4] 1863 	sbc	a, h
   6EBA E2 BF 6E      [10] 1864 	jp	PO, 00138$
   6EBD EE 80         [ 7] 1865 	xor	a, #0x80
   6EBF                    1866 00138$:
   6EBF F2 FD 6E      [10] 1867 	jp	P,00111$
                           1868 ;src/main.c:369: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6EC2 21 26 64      [10] 1869 	ld	hl, #(_prota + 0x0001) + 0
   6EC5 4E            [ 7] 1870 	ld	c,(hl)
   6EC6 DD 6E FC      [19] 1871 	ld	l,-4 (ix)
   6EC9 DD 66 FD      [19] 1872 	ld	h,-3 (ix)
   6ECC 5E            [ 7] 1873 	ld	e,(hl)
   6ECD 16 00         [ 7] 1874 	ld	d,#0x00
   6ECF 7B            [ 4] 1875 	ld	a,e
   6ED0 C6 CC         [ 7] 1876 	add	a,#0xCC
   6ED2 6F            [ 4] 1877 	ld	l,a
   6ED3 7A            [ 4] 1878 	ld	a,d
   6ED4 CE FF         [ 7] 1879 	adc	a,#0xFF
   6ED6 67            [ 4] 1880 	ld	h,a
   6ED7 06 00         [ 7] 1881 	ld	b,#0x00
   6ED9 7D            [ 4] 1882 	ld	a,l
   6EDA 91            [ 4] 1883 	sub	a, c
   6EDB 7C            [ 4] 1884 	ld	a,h
   6EDC 98            [ 4] 1885 	sbc	a, b
   6EDD E2 E2 6E      [10] 1886 	jp	PO, 00139$
   6EE0 EE 80         [ 7] 1887 	xor	a, #0x80
   6EE2                    1888 00139$:
   6EE2 F2 FD 6E      [10] 1889 	jp	P,00111$
   6EE5 21 34 00      [10] 1890 	ld	hl,#0x0034
   6EE8 19            [11] 1891 	add	hl,de
   6EE9 79            [ 4] 1892 	ld	a,c
   6EEA 95            [ 4] 1893 	sub	a, l
   6EEB 78            [ 4] 1894 	ld	a,b
   6EEC 9C            [ 4] 1895 	sbc	a, h
   6EED E2 F2 6E      [10] 1896 	jp	PO, 00140$
   6EF0 EE 80         [ 7] 1897 	xor	a, #0x80
   6EF2                    1898 00140$:
   6EF2 F2 FD 6E      [10] 1899 	jp	P,00111$
                           1900 ;src/main.c:370: enemy->seen = SI;
   6EF5 DD 6E FE      [19] 1901 	ld	l,-2 (ix)
   6EF8 DD 66 FF      [19] 1902 	ld	h,-1 (ix)
   6EFB 36 01         [10] 1903 	ld	(hl),#0x01
   6EFD                    1904 00111$:
   6EFD DD F9         [10] 1905 	ld	sp, ix
   6EFF DD E1         [14] 1906 	pop	ix
   6F01 C9            [10] 1907 	ret
                           1908 ;src/main.c:375: void moverEnemigoSeek(TEnemy* actual){
                           1909 ;	---------------------------------
                           1910 ; Function moverEnemigoSeek
                           1911 ; ---------------------------------
   6F02                    1912 _moverEnemigoSeek::
   6F02 DD E5         [15] 1913 	push	ix
   6F04 DD 21 00 00   [14] 1914 	ld	ix,#0
   6F08 DD 39         [15] 1915 	add	ix,sp
   6F0A 21 F6 FF      [10] 1916 	ld	hl,#-10
   6F0D 39            [11] 1917 	add	hl,sp
   6F0E F9            [ 6] 1918 	ld	sp,hl
                           1919 ;src/main.c:377: if(!actual->muerto){
   6F0F DD 4E 04      [19] 1920 	ld	c,4 (ix)
   6F12 DD 46 05      [19] 1921 	ld	b,5 (ix)
   6F15 C5            [11] 1922 	push	bc
   6F16 FD E1         [14] 1923 	pop	iy
   6F18 FD 7E 08      [19] 1924 	ld	a, 8 (iy)
   6F1B B7            [ 4] 1925 	or	a, a
   6F1C C2 A2 70      [10] 1926 	jp	NZ,00114$
                           1927 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6F1F 21 0D 00      [10] 1928 	ld	hl,#0x000D
   6F22 09            [11] 1929 	add	hl,bc
   6F23 DD 75 F8      [19] 1930 	ld	-8 (ix),l
   6F26 DD 74 F9      [19] 1931 	ld	-7 (ix),h
   6F29 DD 6E F8      [19] 1932 	ld	l,-8 (ix)
   6F2C DD 66 F9      [19] 1933 	ld	h,-7 (ix)
   6F2F 7E            [ 7] 1934 	ld	a,(hl)
   6F30 DD 77 F6      [19] 1935 	ld	-10 (ix),a
   6F33 23            [ 6] 1936 	inc	hl
   6F34 7E            [ 7] 1937 	ld	a,(hl)
   6F35 DD 77 F7      [19] 1938 	ld	-9 (ix),a
   6F38 69            [ 4] 1939 	ld	l, c
   6F39 60            [ 4] 1940 	ld	h, b
   6F3A 11 E1 00      [10] 1941 	ld	de, #0x00E1
   6F3D 19            [11] 1942 	add	hl, de
   6F3E 5E            [ 7] 1943 	ld	e,(hl)
   6F3F 16 00         [ 7] 1944 	ld	d,#0x00
                           1945 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F41 21 01 00      [10] 1946 	ld	hl,#0x0001
   6F44 09            [11] 1947 	add	hl,bc
   6F45 DD 75 FE      [19] 1948 	ld	-2 (ix),l
   6F48 DD 74 FF      [19] 1949 	ld	-1 (ix),h
                           1950 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6F4B DD 7E F6      [19] 1951 	ld	a,-10 (ix)
   6F4E 93            [ 4] 1952 	sub	a, e
   6F4F DD 7E F7      [19] 1953 	ld	a,-9 (ix)
   6F52 9A            [ 4] 1954 	sbc	a, d
   6F53 E2 58 6F      [10] 1955 	jp	PO, 00136$
   6F56 EE 80         [ 7] 1956 	xor	a, #0x80
   6F58                    1957 00136$:
   6F58 F2 EC 6F      [10] 1958 	jp	P,00110$
                           1959 ;src/main.c:385: actual->mover = SI;
   6F5B 21 06 00      [10] 1960 	ld	hl,#0x0006
   6F5E 09            [11] 1961 	add	hl,bc
                           1962 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F5F 79            [ 4] 1963 	ld	a,c
   6F60 C6 19         [ 7] 1964 	add	a, #0x19
   6F62 5F            [ 4] 1965 	ld	e,a
   6F63 78            [ 4] 1966 	ld	a,b
   6F64 CE 00         [ 7] 1967 	adc	a, #0x00
   6F66 57            [ 4] 1968 	ld	d,a
                           1969 ;src/main.c:383: if(actual->iter == 0){
   6F67 DD 7E F7      [19] 1970 	ld	a,-9 (ix)
   6F6A DD B6 F6      [19] 1971 	or	a,-10 (ix)
   6F6D 20 44         [12] 1972 	jr	NZ,00102$
                           1973 ;src/main.c:385: actual->mover = SI;
   6F6F 36 01         [10] 1974 	ld	(hl),#0x01
                           1975 ;src/main.c:386: actual->iter = 2;
   6F71 DD 6E F8      [19] 1976 	ld	l,-8 (ix)
   6F74 DD 66 F9      [19] 1977 	ld	h,-7 (ix)
   6F77 36 02         [10] 1978 	ld	(hl),#0x02
   6F79 23            [ 6] 1979 	inc	hl
   6F7A 36 00         [10] 1980 	ld	(hl),#0x00
                           1981 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F7C DD 6E F8      [19] 1982 	ld	l,-8 (ix)
   6F7F DD 66 F9      [19] 1983 	ld	h,-7 (ix)
   6F82 7E            [ 7] 1984 	ld	a, (hl)
   6F83 23            [ 6] 1985 	inc	hl
   6F84 66            [ 7] 1986 	ld	h,(hl)
   6F85 6F            [ 4] 1987 	ld	l,a
   6F86 19            [11] 1988 	add	hl,de
   6F87 7E            [ 7] 1989 	ld	a,(hl)
   6F88 02            [ 7] 1990 	ld	(bc),a
                           1991 ;src/main.c:388: ++actual->iter;
   6F89 DD 6E F8      [19] 1992 	ld	l,-8 (ix)
   6F8C DD 66 F9      [19] 1993 	ld	h,-7 (ix)
   6F8F 4E            [ 7] 1994 	ld	c,(hl)
   6F90 23            [ 6] 1995 	inc	hl
   6F91 46            [ 7] 1996 	ld	b,(hl)
   6F92 03            [ 6] 1997 	inc	bc
   6F93 DD 6E F8      [19] 1998 	ld	l,-8 (ix)
   6F96 DD 66 F9      [19] 1999 	ld	h,-7 (ix)
   6F99 71            [ 7] 2000 	ld	(hl),c
   6F9A 23            [ 6] 2001 	inc	hl
   6F9B 70            [ 7] 2002 	ld	(hl),b
                           2003 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F9C EB            [ 4] 2004 	ex	de,hl
   6F9D 09            [11] 2005 	add	hl,bc
   6F9E 5E            [ 7] 2006 	ld	e,(hl)
   6F9F DD 6E FE      [19] 2007 	ld	l,-2 (ix)
   6FA2 DD 66 FF      [19] 2008 	ld	h,-1 (ix)
   6FA5 73            [ 7] 2009 	ld	(hl),e
                           2010 ;src/main.c:390: ++actual->iter;
   6FA6 03            [ 6] 2011 	inc	bc
   6FA7 DD 6E F8      [19] 2012 	ld	l,-8 (ix)
   6FAA DD 66 F9      [19] 2013 	ld	h,-7 (ix)
   6FAD 71            [ 7] 2014 	ld	(hl),c
   6FAE 23            [ 6] 2015 	inc	hl
   6FAF 70            [ 7] 2016 	ld	(hl),b
   6FB0 C3 A2 70      [10] 2017 	jp	00114$
   6FB3                    2018 00102$:
                           2019 ;src/main.c:393: actual->mover = SI;
   6FB3 36 01         [10] 2020 	ld	(hl),#0x01
                           2021 ;src/main.c:394: actual->x = actual->camino[actual->iter];
   6FB5 DD 6E F8      [19] 2022 	ld	l,-8 (ix)
   6FB8 DD 66 F9      [19] 2023 	ld	h,-7 (ix)
   6FBB 7E            [ 7] 2024 	ld	a, (hl)
   6FBC 23            [ 6] 2025 	inc	hl
   6FBD 66            [ 7] 2026 	ld	h,(hl)
   6FBE 6F            [ 4] 2027 	ld	l,a
   6FBF 19            [11] 2028 	add	hl,de
   6FC0 7E            [ 7] 2029 	ld	a,(hl)
   6FC1 02            [ 7] 2030 	ld	(bc),a
                           2031 ;src/main.c:395: ++actual->iter;
   6FC2 DD 6E F8      [19] 2032 	ld	l,-8 (ix)
   6FC5 DD 66 F9      [19] 2033 	ld	h,-7 (ix)
   6FC8 4E            [ 7] 2034 	ld	c,(hl)
   6FC9 23            [ 6] 2035 	inc	hl
   6FCA 46            [ 7] 2036 	ld	b,(hl)
   6FCB 03            [ 6] 2037 	inc	bc
   6FCC DD 6E F8      [19] 2038 	ld	l,-8 (ix)
   6FCF DD 66 F9      [19] 2039 	ld	h,-7 (ix)
   6FD2 71            [ 7] 2040 	ld	(hl),c
   6FD3 23            [ 6] 2041 	inc	hl
   6FD4 70            [ 7] 2042 	ld	(hl),b
                           2043 ;src/main.c:396: actual->y = actual->camino[actual->iter];
   6FD5 EB            [ 4] 2044 	ex	de,hl
   6FD6 09            [11] 2045 	add	hl,bc
   6FD7 5E            [ 7] 2046 	ld	e,(hl)
   6FD8 DD 6E FE      [19] 2047 	ld	l,-2 (ix)
   6FDB DD 66 FF      [19] 2048 	ld	h,-1 (ix)
   6FDE 73            [ 7] 2049 	ld	(hl),e
                           2050 ;src/main.c:397: ++actual->iter;
   6FDF 03            [ 6] 2051 	inc	bc
   6FE0 DD 6E F8      [19] 2052 	ld	l,-8 (ix)
   6FE3 DD 66 F9      [19] 2053 	ld	h,-7 (ix)
   6FE6 71            [ 7] 2054 	ld	(hl),c
   6FE7 23            [ 6] 2055 	inc	hl
   6FE8 70            [ 7] 2056 	ld	(hl),b
   6FE9 C3 A2 70      [10] 2057 	jp	00114$
   6FEC                    2058 00110$:
                           2059 ;src/main.c:403: actual->seek = 0;
   6FEC 21 13 00      [10] 2060 	ld	hl,#0x0013
   6FEF 09            [11] 2061 	add	hl,bc
   6FF0 E3            [19] 2062 	ex	(sp), hl
   6FF1 E1            [10] 2063 	pop	hl
   6FF2 E5            [11] 2064 	push	hl
   6FF3 36 00         [10] 2065 	ld	(hl),#0x00
                           2066 ;src/main.c:404: lookFor(actual);
   6FF5 C5            [11] 2067 	push	bc
   6FF6 C5            [11] 2068 	push	bc
   6FF7 CD FC 6D      [17] 2069 	call	_lookFor
   6FFA F1            [10] 2070 	pop	af
   6FFB C1            [10] 2071 	pop	bc
                           2072 ;src/main.c:405: if(!actual->seen){
   6FFC 69            [ 4] 2073 	ld	l, c
   6FFD 60            [ 4] 2074 	ld	h, b
   6FFE 11 11 00      [10] 2075 	ld	de, #0x0011
   7001 19            [11] 2076 	add	hl, de
   7002 7E            [ 7] 2077 	ld	a,(hl)
   7003 DD 77 FD      [19] 2078 	ld	-3 (ix),a
                           2079 ;src/main.c:406: actual->patrolling = 1;
   7006 21 0A 00      [10] 2080 	ld	hl,#0x000A
   7009 09            [11] 2081 	add	hl,bc
   700A DD 75 FB      [19] 2082 	ld	-5 (ix),l
   700D DD 74 FC      [19] 2083 	ld	-4 (ix),h
                           2084 ;src/main.c:405: if(!actual->seen){
   7010 DD 7E FD      [19] 2085 	ld	a,-3 (ix)
   7013 B7            [ 4] 2086 	or	a, a
   7014 20 3C         [12] 2087 	jr	NZ,00107$
                           2088 ;src/main.c:406: actual->patrolling = 1;
   7016 DD 6E FB      [19] 2089 	ld	l,-5 (ix)
   7019 DD 66 FC      [19] 2090 	ld	h,-4 (ix)
   701C 36 01         [10] 2091 	ld	(hl),#0x01
                           2092 ;src/main.c:407: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   701E C5            [11] 2093 	push	bc
   701F FD E1         [14] 2094 	pop	iy
   7021 FD 7E 18      [19] 2095 	ld	a,24 (iy)
   7024 DD 77 FD      [19] 2096 	ld	-3 (ix),a
   7027 C5            [11] 2097 	push	bc
   7028 FD E1         [14] 2098 	pop	iy
   702A FD 56 17      [19] 2099 	ld	d,23 (iy)
   702D DD 6E FE      [19] 2100 	ld	l,-2 (ix)
   7030 DD 66 FF      [19] 2101 	ld	h,-1 (ix)
   7033 5E            [ 7] 2102 	ld	e,(hl)
   7034 0A            [ 7] 2103 	ld	a,(bc)
   7035 DD 77 FA      [19] 2104 	ld	-6 (ix),a
   7038 2A 03 65      [16] 2105 	ld	hl,(_mapa)
   703B E5            [11] 2106 	push	hl
   703C C5            [11] 2107 	push	bc
   703D DD 7E FD      [19] 2108 	ld	a,-3 (ix)
   7040 F5            [11] 2109 	push	af
   7041 33            [ 6] 2110 	inc	sp
   7042 D5            [11] 2111 	push	de
   7043 DD 7E FA      [19] 2112 	ld	a,-6 (ix)
   7046 F5            [11] 2113 	push	af
   7047 33            [ 6] 2114 	inc	sp
   7048 CD 30 44      [17] 2115 	call	_pathFinding
   704B 21 08 00      [10] 2116 	ld	hl,#8
   704E 39            [11] 2117 	add	hl,sp
   704F F9            [ 6] 2118 	ld	sp,hl
   7050 18 46         [12] 2119 	jr	00108$
   7052                    2120 00107$:
                           2121 ;src/main.c:409: actual->patrolling = 0;
   7052 DD 6E FB      [19] 2122 	ld	l,-5 (ix)
   7055 DD 66 FC      [19] 2123 	ld	h,-4 (ix)
   7058 36 00         [10] 2124 	ld	(hl),#0x00
                           2125 ;src/main.c:410: if(!actual->engage){
   705A C5            [11] 2126 	push	bc
   705B FD E1         [14] 2127 	pop	iy
   705D FD 7E 15      [19] 2128 	ld	a,21 (iy)
   7060 B7            [ 4] 2129 	or	a, a
   7061 20 35         [12] 2130 	jr	NZ,00108$
                           2131 ;src/main.c:411: actual->seek = 1;
   7063 E1            [10] 2132 	pop	hl
   7064 E5            [11] 2133 	push	hl
   7065 36 01         [10] 2134 	ld	(hl),#0x01
                           2135 ;src/main.c:412: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7067 3A 26 64      [13] 2136 	ld	a,(#_prota + 1)
   706A DD 77 FA      [19] 2137 	ld	-6 (ix),a
   706D 21 25 64      [10] 2138 	ld	hl, #_prota + 0
   7070 5E            [ 7] 2139 	ld	e,(hl)
   7071 DD 6E FE      [19] 2140 	ld	l,-2 (ix)
   7074 DD 66 FF      [19] 2141 	ld	h,-1 (ix)
   7077 56            [ 7] 2142 	ld	d,(hl)
   7078 0A            [ 7] 2143 	ld	a,(bc)
   7079 DD 77 FB      [19] 2144 	ld	-5 (ix),a
   707C 2A 03 65      [16] 2145 	ld	hl,(_mapa)
   707F E5            [11] 2146 	push	hl
   7080 C5            [11] 2147 	push	bc
   7081 DD 7E FA      [19] 2148 	ld	a,-6 (ix)
   7084 F5            [11] 2149 	push	af
   7085 33            [ 6] 2150 	inc	sp
   7086 7B            [ 4] 2151 	ld	a,e
   7087 F5            [11] 2152 	push	af
   7088 33            [ 6] 2153 	inc	sp
   7089 D5            [11] 2154 	push	de
   708A 33            [ 6] 2155 	inc	sp
   708B DD 7E FB      [19] 2156 	ld	a,-5 (ix)
   708E F5            [11] 2157 	push	af
   708F 33            [ 6] 2158 	inc	sp
   7090 CD 30 44      [17] 2159 	call	_pathFinding
   7093 21 08 00      [10] 2160 	ld	hl,#8
   7096 39            [11] 2161 	add	hl,sp
   7097 F9            [ 6] 2162 	ld	sp,hl
   7098                    2163 00108$:
                           2164 ;src/main.c:415: actual->iter = 0;
   7098 DD 6E F8      [19] 2165 	ld	l,-8 (ix)
   709B DD 66 F9      [19] 2166 	ld	h,-7 (ix)
   709E AF            [ 4] 2167 	xor	a, a
   709F 77            [ 7] 2168 	ld	(hl), a
   70A0 23            [ 6] 2169 	inc	hl
   70A1 77            [ 7] 2170 	ld	(hl), a
   70A2                    2171 00114$:
   70A2 DD F9         [10] 2172 	ld	sp, ix
   70A4 DD E1         [14] 2173 	pop	ix
   70A6 C9            [10] 2174 	ret
                           2175 ;src/main.c:421: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2176 ;	---------------------------------
                           2177 ; Function engage
                           2178 ; ---------------------------------
   70A7                    2179 _engage::
   70A7 DD E5         [15] 2180 	push	ix
   70A9 DD 21 00 00   [14] 2181 	ld	ix,#0
   70AD DD 39         [15] 2182 	add	ix,sp
   70AF 21 F0 FF      [10] 2183 	ld	hl,#-16
   70B2 39            [11] 2184 	add	hl,sp
   70B3 F9            [ 6] 2185 	ld	sp,hl
                           2186 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70B4 DD 7E 04      [19] 2187 	ld	a,4 (ix)
   70B7 DD 77 F4      [19] 2188 	ld	-12 (ix),a
   70BA DD 7E 05      [19] 2189 	ld	a,5 (ix)
   70BD DD 77 F5      [19] 2190 	ld	-11 (ix),a
   70C0 DD 6E F4      [19] 2191 	ld	l,-12 (ix)
   70C3 DD 66 F5      [19] 2192 	ld	h,-11 (ix)
   70C6 4E            [ 7] 2193 	ld	c,(hl)
   70C7 06 00         [ 7] 2194 	ld	b,#0x00
   70C9 21 25 64      [10] 2195 	ld	hl,#_prota+0
   70CC 5E            [ 7] 2196 	ld	e,(hl)
   70CD 16 00         [ 7] 2197 	ld	d,#0x00
   70CF 79            [ 4] 2198 	ld	a,c
   70D0 93            [ 4] 2199 	sub	a, e
   70D1 4F            [ 4] 2200 	ld	c,a
   70D2 78            [ 4] 2201 	ld	a,b
   70D3 9A            [ 4] 2202 	sbc	a, d
   70D4 47            [ 4] 2203 	ld	b,a
   70D5 C5            [11] 2204 	push	bc
   70D6 CD A5 4B      [17] 2205 	call	_abs
   70D9 F1            [10] 2206 	pop	af
   70DA 4D            [ 4] 2207 	ld	c,l
                           2208 ;src/main.c:423: u8 dify = abs(enemy->y - prota.y);
   70DB DD 7E F4      [19] 2209 	ld	a,-12 (ix)
   70DE C6 01         [ 7] 2210 	add	a, #0x01
   70E0 DD 77 F6      [19] 2211 	ld	-10 (ix),a
   70E3 DD 7E F5      [19] 2212 	ld	a,-11 (ix)
   70E6 CE 00         [ 7] 2213 	adc	a, #0x00
   70E8 DD 77 F7      [19] 2214 	ld	-9 (ix),a
   70EB DD 6E F6      [19] 2215 	ld	l,-10 (ix)
   70EE DD 66 F7      [19] 2216 	ld	h,-9 (ix)
   70F1 5E            [ 7] 2217 	ld	e,(hl)
   70F2 16 00         [ 7] 2218 	ld	d,#0x00
   70F4 21 26 64      [10] 2219 	ld	hl, #_prota + 1
   70F7 6E            [ 7] 2220 	ld	l,(hl)
   70F8 26 00         [ 7] 2221 	ld	h,#0x00
   70FA 7B            [ 4] 2222 	ld	a,e
   70FB 95            [ 4] 2223 	sub	a, l
   70FC 5F            [ 4] 2224 	ld	e,a
   70FD 7A            [ 4] 2225 	ld	a,d
   70FE 9C            [ 4] 2226 	sbc	a, h
   70FF 57            [ 4] 2227 	ld	d,a
   7100 C5            [11] 2228 	push	bc
   7101 D5            [11] 2229 	push	de
   7102 CD A5 4B      [17] 2230 	call	_abs
   7105 F1            [10] 2231 	pop	af
   7106 C1            [10] 2232 	pop	bc
                           2233 ;src/main.c:424: u8 dist = difx + dify; // manhattan
   7107 09            [11] 2234 	add	hl, bc
   7108 DD 75 F0      [19] 2235 	ld	-16 (ix),l
                           2236 ;src/main.c:426: u8 movX = 0;
   710B DD 36 F3 00   [19] 2237 	ld	-13 (ix),#0x00
                           2238 ;src/main.c:427: u8 movY = 0;
   710F DD 36 F2 00   [19] 2239 	ld	-14 (ix),#0x00
                           2240 ;src/main.c:428: u8 distConstraint = 25;
   7113 DD 36 F1 19   [19] 2241 	ld	-15 (ix),#0x19
                           2242 ;src/main.c:429: enemy->mover = NO;
   7117 DD 7E F4      [19] 2243 	ld	a,-12 (ix)
   711A C6 06         [ 7] 2244 	add	a, #0x06
   711C DD 77 F8      [19] 2245 	ld	-8 (ix),a
   711F DD 7E F5      [19] 2246 	ld	a,-11 (ix)
   7122 CE 00         [ 7] 2247 	adc	a, #0x00
   7124 DD 77 F9      [19] 2248 	ld	-7 (ix),a
   7127 DD 6E F8      [19] 2249 	ld	l,-8 (ix)
   712A DD 66 F9      [19] 2250 	ld	h,-7 (ix)
   712D 36 00         [10] 2251 	ld	(hl),#0x00
                           2252 ;src/main.c:431: if (dist < 20) {
   712F DD 7E F0      [19] 2253 	ld	a,-16 (ix)
   7132 D6 14         [ 7] 2254 	sub	a, #0x14
   7134 30 24         [12] 2255 	jr	NC,00104$
                           2256 ;src/main.c:432: vidas--;
   7136 21 38 64      [10] 2257 	ld	hl, #_vidas+0
   7139 35            [11] 2258 	dec	(hl)
                           2259 ;src/main.c:433: if (vidas == 1) {
   713A 3A 38 64      [13] 2260 	ld	a,(#_vidas + 0)
   713D 3D            [ 4] 2261 	dec	a
   713E 20 0C         [12] 2262 	jr	NZ,00102$
                           2263 ;src/main.c:434: menuFin(puntuacion);
   7140 FD 21 06 65   [14] 2264 	ld	iy,#_puntuacion
   7144 FD 6E 00      [19] 2265 	ld	l,0 (iy)
   7147 26 00         [ 7] 2266 	ld	h,#0x00
   7149 CD E5 4B      [17] 2267 	call	_menuFin
   714C                    2268 00102$:
                           2269 ;src/main.c:438: enemy->didDamage = 1;
   714C DD 7E F4      [19] 2270 	ld	a,-12 (ix)
   714F C6 16         [ 7] 2271 	add	a, #0x16
   7151 6F            [ 4] 2272 	ld	l,a
   7152 DD 7E F5      [19] 2273 	ld	a,-11 (ix)
   7155 CE 00         [ 7] 2274 	adc	a, #0x00
   7157 67            [ 4] 2275 	ld	h,a
   7158 36 01         [10] 2276 	ld	(hl),#0x01
   715A                    2277 00104$:
                           2278 ;src/main.c:441: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   715A DD 6E F6      [19] 2279 	ld	l,-10 (ix)
   715D DD 66 F7      [19] 2280 	ld	h,-9 (ix)
   7160 7E            [ 7] 2281 	ld	a,(hl)
   7161 DD 77 FA      [19] 2282 	ld	-6 (ix),a
                           2283 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7164 DD 6E F4      [19] 2284 	ld	l,-12 (ix)
   7167 DD 66 F5      [19] 2285 	ld	h,-11 (ix)
   716A 46            [ 7] 2286 	ld	b,(hl)
                           2287 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   716B 78            [ 4] 2288 	ld	a,b
   716C C6 04         [ 7] 2289 	add	a, #0x04
   716E DD 77 FB      [19] 2290 	ld	-5 (ix),a
                           2291 ;src/main.c:441: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7171 DD 7E 07      [19] 2292 	ld	a,7 (ix)
   7174 DD 96 FA      [19] 2293 	sub	a, -6 (ix)
   7177 28 38         [12] 2294 	jr	Z,00198$
   7179 DD 5E 07      [19] 2295 	ld	e,7 (ix)
   717C 16 00         [ 7] 2296 	ld	d,#0x00
   717E 21 01 00      [10] 2297 	ld	hl,#0x0001
   7181 19            [11] 2298 	add	hl,de
   7182 DD 75 FC      [19] 2299 	ld	-4 (ix),l
   7185 DD 74 FD      [19] 2300 	ld	-3 (ix),h
   7188 DD 7E FA      [19] 2301 	ld	a,-6 (ix)
   718B DD 77 FE      [19] 2302 	ld	-2 (ix),a
   718E DD 36 FF 00   [19] 2303 	ld	-1 (ix),#0x00
   7192 DD 7E FC      [19] 2304 	ld	a,-4 (ix)
   7195 DD 96 FE      [19] 2305 	sub	a, -2 (ix)
   7198 20 08         [12] 2306 	jr	NZ,00436$
   719A DD 7E FD      [19] 2307 	ld	a,-3 (ix)
   719D DD 96 FF      [19] 2308 	sub	a, -1 (ix)
   71A0 28 0F         [12] 2309 	jr	Z,00198$
   71A2                    2310 00436$:
   71A2 1B            [ 6] 2311 	dec	de
   71A3 DD 7E FE      [19] 2312 	ld	a,-2 (ix)
   71A6 93            [ 4] 2313 	sub	a, e
   71A7 C2 BA 72      [10] 2314 	jp	NZ,00199$
   71AA DD 7E FF      [19] 2315 	ld	a,-1 (ix)
   71AD 92            [ 4] 2316 	sub	a, d
   71AE C2 BA 72      [10] 2317 	jp	NZ,00199$
   71B1                    2318 00198$:
                           2319 ;src/main.c:442: if (dx < enemy->x) { // izquierda
   71B1 DD 7E 06      [19] 2320 	ld	a,6 (ix)
   71B4 90            [ 4] 2321 	sub	a, b
   71B5 D2 37 72      [10] 2322 	jp	NC,00118$
                           2323 ;src/main.c:443: if (dist > 11) {
   71B8 3E 0B         [ 7] 2324 	ld	a,#0x0B
   71BA DD 96 F0      [19] 2325 	sub	a, -16 (ix)
   71BD D2 7E 78      [10] 2326 	jp	NC,00203$
                           2327 ;src/main.c:444: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   71C0 DD 7E FA      [19] 2328 	ld	a,-6 (ix)
   71C3 F5            [11] 2329 	push	af
   71C4 33            [ 6] 2330 	inc	sp
   71C5 C5            [11] 2331 	push	bc
   71C6 33            [ 6] 2332 	inc	sp
   71C7 2A 03 65      [16] 2333 	ld	hl,(_mapa)
   71CA E5            [11] 2334 	push	hl
   71CB CD 61 4B      [17] 2335 	call	_getTilePtr
   71CE F1            [10] 2336 	pop	af
   71CF F1            [10] 2337 	pop	af
   71D0 4E            [ 7] 2338 	ld	c,(hl)
   71D1 3E 02         [ 7] 2339 	ld	a,#0x02
   71D3 91            [ 4] 2340 	sub	a, c
   71D4 DA 7E 78      [10] 2341 	jp	C,00203$
                           2342 ;src/main.c:445: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   71D7 DD 6E F6      [19] 2343 	ld	l,-10 (ix)
   71DA DD 66 F7      [19] 2344 	ld	h,-9 (ix)
   71DD 7E            [ 7] 2345 	ld	a,(hl)
   71DE C6 0B         [ 7] 2346 	add	a, #0x0B
   71E0 57            [ 4] 2347 	ld	d,a
   71E1 DD 6E F4      [19] 2348 	ld	l,-12 (ix)
   71E4 DD 66 F5      [19] 2349 	ld	h,-11 (ix)
   71E7 46            [ 7] 2350 	ld	b,(hl)
   71E8 D5            [11] 2351 	push	de
   71E9 33            [ 6] 2352 	inc	sp
   71EA C5            [11] 2353 	push	bc
   71EB 33            [ 6] 2354 	inc	sp
   71EC 2A 03 65      [16] 2355 	ld	hl,(_mapa)
   71EF E5            [11] 2356 	push	hl
   71F0 CD 61 4B      [17] 2357 	call	_getTilePtr
   71F3 F1            [10] 2358 	pop	af
   71F4 F1            [10] 2359 	pop	af
   71F5 4E            [ 7] 2360 	ld	c,(hl)
   71F6 3E 02         [ 7] 2361 	ld	a,#0x02
   71F8 91            [ 4] 2362 	sub	a, c
   71F9 DA 7E 78      [10] 2363 	jp	C,00203$
                           2364 ;src/main.c:446: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   71FC DD 6E F6      [19] 2365 	ld	l,-10 (ix)
   71FF DD 66 F7      [19] 2366 	ld	h,-9 (ix)
   7202 7E            [ 7] 2367 	ld	a,(hl)
   7203 C6 16         [ 7] 2368 	add	a, #0x16
   7205 57            [ 4] 2369 	ld	d,a
   7206 DD 6E F4      [19] 2370 	ld	l,-12 (ix)
   7209 DD 66 F5      [19] 2371 	ld	h,-11 (ix)
   720C 46            [ 7] 2372 	ld	b,(hl)
   720D D5            [11] 2373 	push	de
   720E 33            [ 6] 2374 	inc	sp
   720F C5            [11] 2375 	push	bc
   7210 33            [ 6] 2376 	inc	sp
   7211 2A 03 65      [16] 2377 	ld	hl,(_mapa)
   7214 E5            [11] 2378 	push	hl
   7215 CD 61 4B      [17] 2379 	call	_getTilePtr
   7218 F1            [10] 2380 	pop	af
   7219 F1            [10] 2381 	pop	af
   721A 4E            [ 7] 2382 	ld	c,(hl)
   721B 3E 02         [ 7] 2383 	ld	a,#0x02
   721D 91            [ 4] 2384 	sub	a, c
   721E DA 7E 78      [10] 2385 	jp	C,00203$
                           2386 ;src/main.c:447: moverEnemigoIzquierda(enemy);
   7221 DD 6E F4      [19] 2387 	ld	l,-12 (ix)
   7224 DD 66 F5      [19] 2388 	ld	h,-11 (ix)
   7227 E5            [11] 2389 	push	hl
   7228 CD A1 6B      [17] 2390 	call	_moverEnemigoIzquierda
   722B F1            [10] 2391 	pop	af
                           2392 ;src/main.c:449: enemy->mover = SI;
   722C DD 6E F8      [19] 2393 	ld	l,-8 (ix)
   722F DD 66 F9      [19] 2394 	ld	h,-7 (ix)
   7232 36 01         [10] 2395 	ld	(hl),#0x01
   7234 C3 7E 78      [10] 2396 	jp	00203$
   7237                    2397 00118$:
                           2398 ;src/main.c:453: if (dist > G_ENEMY_W + 3) {
   7237 3E 07         [ 7] 2399 	ld	a,#0x07
   7239 DD 96 F0      [19] 2400 	sub	a, -16 (ix)
   723C D2 7E 78      [10] 2401 	jp	NC,00203$
                           2402 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   723F DD 66 FA      [19] 2403 	ld	h,-6 (ix)
   7242 DD 6E FB      [19] 2404 	ld	l,-5 (ix)
   7245 E5            [11] 2405 	push	hl
   7246 2A 03 65      [16] 2406 	ld	hl,(_mapa)
   7249 E5            [11] 2407 	push	hl
   724A CD 61 4B      [17] 2408 	call	_getTilePtr
   724D F1            [10] 2409 	pop	af
   724E F1            [10] 2410 	pop	af
   724F 4E            [ 7] 2411 	ld	c,(hl)
   7250 3E 02         [ 7] 2412 	ld	a,#0x02
   7252 91            [ 4] 2413 	sub	a, c
   7253 DA 7E 78      [10] 2414 	jp	C,00203$
                           2415 ;src/main.c:455: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7256 DD 6E F6      [19] 2416 	ld	l,-10 (ix)
   7259 DD 66 F7      [19] 2417 	ld	h,-9 (ix)
   725C 7E            [ 7] 2418 	ld	a,(hl)
   725D C6 0B         [ 7] 2419 	add	a, #0x0B
   725F 47            [ 4] 2420 	ld	b,a
   7260 DD 6E F4      [19] 2421 	ld	l,-12 (ix)
   7263 DD 66 F5      [19] 2422 	ld	h,-11 (ix)
   7266 7E            [ 7] 2423 	ld	a,(hl)
   7267 C6 04         [ 7] 2424 	add	a, #0x04
   7269 C5            [11] 2425 	push	bc
   726A 33            [ 6] 2426 	inc	sp
   726B F5            [11] 2427 	push	af
   726C 33            [ 6] 2428 	inc	sp
   726D 2A 03 65      [16] 2429 	ld	hl,(_mapa)
   7270 E5            [11] 2430 	push	hl
   7271 CD 61 4B      [17] 2431 	call	_getTilePtr
   7274 F1            [10] 2432 	pop	af
   7275 F1            [10] 2433 	pop	af
   7276 4E            [ 7] 2434 	ld	c,(hl)
   7277 3E 02         [ 7] 2435 	ld	a,#0x02
   7279 91            [ 4] 2436 	sub	a, c
   727A DA 7E 78      [10] 2437 	jp	C,00203$
                           2438 ;src/main.c:456: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   727D DD 6E F6      [19] 2439 	ld	l,-10 (ix)
   7280 DD 66 F7      [19] 2440 	ld	h,-9 (ix)
   7283 7E            [ 7] 2441 	ld	a,(hl)
   7284 C6 16         [ 7] 2442 	add	a, #0x16
   7286 47            [ 4] 2443 	ld	b,a
   7287 DD 6E F4      [19] 2444 	ld	l,-12 (ix)
   728A DD 66 F5      [19] 2445 	ld	h,-11 (ix)
   728D 7E            [ 7] 2446 	ld	a,(hl)
   728E C6 04         [ 7] 2447 	add	a, #0x04
   7290 C5            [11] 2448 	push	bc
   7291 33            [ 6] 2449 	inc	sp
   7292 F5            [11] 2450 	push	af
   7293 33            [ 6] 2451 	inc	sp
   7294 2A 03 65      [16] 2452 	ld	hl,(_mapa)
   7297 E5            [11] 2453 	push	hl
   7298 CD 61 4B      [17] 2454 	call	_getTilePtr
   729B F1            [10] 2455 	pop	af
   729C F1            [10] 2456 	pop	af
   729D 4E            [ 7] 2457 	ld	c,(hl)
   729E 3E 02         [ 7] 2458 	ld	a,#0x02
   72A0 91            [ 4] 2459 	sub	a, c
   72A1 DA 7E 78      [10] 2460 	jp	C,00203$
                           2461 ;src/main.c:457: moverEnemigoDerecha(enemy);
   72A4 DD 6E F4      [19] 2462 	ld	l,-12 (ix)
   72A7 DD 66 F5      [19] 2463 	ld	h,-11 (ix)
   72AA E5            [11] 2464 	push	hl
   72AB CD 91 6B      [17] 2465 	call	_moverEnemigoDerecha
   72AE F1            [10] 2466 	pop	af
                           2467 ;src/main.c:459: enemy->mover = SI;
   72AF DD 6E F8      [19] 2468 	ld	l,-8 (ix)
   72B2 DD 66 F9      [19] 2469 	ld	h,-7 (ix)
   72B5 36 01         [10] 2470 	ld	(hl),#0x01
   72B7 C3 7E 78      [10] 2471 	jp	00203$
   72BA                    2472 00199$:
                           2473 ;src/main.c:464: else if (enemy->x == dx) {
   72BA DD 7E 06      [19] 2474 	ld	a,6 (ix)
   72BD 90            [ 4] 2475 	sub	a, b
   72BE C2 D3 73      [10] 2476 	jp	NZ,00196$
                           2477 ;src/main.c:465: if (dy < enemy->y) {
   72C1 DD 7E 07      [19] 2478 	ld	a,7 (ix)
   72C4 DD 96 FA      [19] 2479 	sub	a, -6 (ix)
   72C7 D2 4D 73      [10] 2480 	jp	NC,00133$
                           2481 ;src/main.c:466: if (dist > G_HERO_H + 5) {
   72CA 3E 1B         [ 7] 2482 	ld	a,#0x1B
   72CC DD 96 F0      [19] 2483 	sub	a, -16 (ix)
   72CF D2 7E 78      [10] 2484 	jp	NC,00203$
                           2485 ;src/main.c:467: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   72D2 DD 56 FA      [19] 2486 	ld	d,-6 (ix)
   72D5 15            [ 4] 2487 	dec	d
   72D6 15            [ 4] 2488 	dec	d
   72D7 D5            [11] 2489 	push	de
   72D8 33            [ 6] 2490 	inc	sp
   72D9 C5            [11] 2491 	push	bc
   72DA 33            [ 6] 2492 	inc	sp
   72DB 2A 03 65      [16] 2493 	ld	hl,(_mapa)
   72DE E5            [11] 2494 	push	hl
   72DF CD 61 4B      [17] 2495 	call	_getTilePtr
   72E2 F1            [10] 2496 	pop	af
   72E3 F1            [10] 2497 	pop	af
   72E4 4E            [ 7] 2498 	ld	c,(hl)
   72E5 3E 02         [ 7] 2499 	ld	a,#0x02
   72E7 91            [ 4] 2500 	sub	a, c
   72E8 DA 7E 78      [10] 2501 	jp	C,00203$
                           2502 ;src/main.c:468: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   72EB DD 6E F6      [19] 2503 	ld	l,-10 (ix)
   72EE DD 66 F7      [19] 2504 	ld	h,-9 (ix)
   72F1 56            [ 7] 2505 	ld	d,(hl)
   72F2 15            [ 4] 2506 	dec	d
   72F3 15            [ 4] 2507 	dec	d
   72F4 DD 6E F4      [19] 2508 	ld	l,-12 (ix)
   72F7 DD 66 F5      [19] 2509 	ld	h,-11 (ix)
   72FA 46            [ 7] 2510 	ld	b,(hl)
   72FB 04            [ 4] 2511 	inc	b
   72FC 04            [ 4] 2512 	inc	b
   72FD D5            [11] 2513 	push	de
   72FE 33            [ 6] 2514 	inc	sp
   72FF C5            [11] 2515 	push	bc
   7300 33            [ 6] 2516 	inc	sp
   7301 2A 03 65      [16] 2517 	ld	hl,(_mapa)
   7304 E5            [11] 2518 	push	hl
   7305 CD 61 4B      [17] 2519 	call	_getTilePtr
   7308 F1            [10] 2520 	pop	af
   7309 F1            [10] 2521 	pop	af
   730A 4E            [ 7] 2522 	ld	c,(hl)
   730B 3E 02         [ 7] 2523 	ld	a,#0x02
   730D 91            [ 4] 2524 	sub	a, c
   730E DA 7E 78      [10] 2525 	jp	C,00203$
                           2526 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7311 DD 6E F6      [19] 2527 	ld	l,-10 (ix)
   7314 DD 66 F7      [19] 2528 	ld	h,-9 (ix)
   7317 46            [ 7] 2529 	ld	b,(hl)
   7318 05            [ 4] 2530 	dec	b
   7319 05            [ 4] 2531 	dec	b
   731A DD 6E F4      [19] 2532 	ld	l,-12 (ix)
   731D DD 66 F5      [19] 2533 	ld	h,-11 (ix)
   7320 7E            [ 7] 2534 	ld	a,(hl)
   7321 C6 04         [ 7] 2535 	add	a, #0x04
   7323 C5            [11] 2536 	push	bc
   7324 33            [ 6] 2537 	inc	sp
   7325 F5            [11] 2538 	push	af
   7326 33            [ 6] 2539 	inc	sp
   7327 2A 03 65      [16] 2540 	ld	hl,(_mapa)
   732A E5            [11] 2541 	push	hl
   732B CD 61 4B      [17] 2542 	call	_getTilePtr
   732E F1            [10] 2543 	pop	af
   732F F1            [10] 2544 	pop	af
   7330 4E            [ 7] 2545 	ld	c,(hl)
   7331 3E 02         [ 7] 2546 	ld	a,#0x02
   7333 91            [ 4] 2547 	sub	a, c
   7334 DA 7E 78      [10] 2548 	jp	C,00203$
                           2549 ;src/main.c:470: moverEnemigoArriba(enemy);
   7337 DD 6E F4      [19] 2550 	ld	l,-12 (ix)
   733A DD 66 F5      [19] 2551 	ld	h,-11 (ix)
   733D E5            [11] 2552 	push	hl
   733E CD 53 6B      [17] 2553 	call	_moverEnemigoArriba
   7341 F1            [10] 2554 	pop	af
                           2555 ;src/main.c:472: enemy->mover = SI;
   7342 DD 6E F8      [19] 2556 	ld	l,-8 (ix)
   7345 DD 66 F9      [19] 2557 	ld	h,-7 (ix)
   7348 36 01         [10] 2558 	ld	(hl),#0x01
   734A C3 7E 78      [10] 2559 	jp	00203$
   734D                    2560 00133$:
                           2561 ;src/main.c:476: if(dist > G_ENEMY_H + 7) {
   734D 3E 1D         [ 7] 2562 	ld	a,#0x1D
   734F DD 96 F0      [19] 2563 	sub	a, -16 (ix)
   7352 D2 7E 78      [10] 2564 	jp	NC,00203$
                           2565 ;src/main.c:477: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7355 DD 7E FA      [19] 2566 	ld	a,-6 (ix)
   7358 C6 18         [ 7] 2567 	add	a, #0x18
   735A 57            [ 4] 2568 	ld	d,a
   735B D5            [11] 2569 	push	de
   735C 33            [ 6] 2570 	inc	sp
   735D C5            [11] 2571 	push	bc
   735E 33            [ 6] 2572 	inc	sp
   735F 2A 03 65      [16] 2573 	ld	hl,(_mapa)
   7362 E5            [11] 2574 	push	hl
   7363 CD 61 4B      [17] 2575 	call	_getTilePtr
   7366 F1            [10] 2576 	pop	af
   7367 F1            [10] 2577 	pop	af
   7368 4E            [ 7] 2578 	ld	c,(hl)
   7369 3E 02         [ 7] 2579 	ld	a,#0x02
   736B 91            [ 4] 2580 	sub	a, c
   736C DA 7E 78      [10] 2581 	jp	C,00203$
                           2582 ;src/main.c:478: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   736F DD 6E F6      [19] 2583 	ld	l,-10 (ix)
   7372 DD 66 F7      [19] 2584 	ld	h,-9 (ix)
   7375 7E            [ 7] 2585 	ld	a,(hl)
   7376 C6 18         [ 7] 2586 	add	a, #0x18
   7378 57            [ 4] 2587 	ld	d,a
   7379 DD 6E F4      [19] 2588 	ld	l,-12 (ix)
   737C DD 66 F5      [19] 2589 	ld	h,-11 (ix)
   737F 46            [ 7] 2590 	ld	b,(hl)
   7380 04            [ 4] 2591 	inc	b
   7381 04            [ 4] 2592 	inc	b
   7382 D5            [11] 2593 	push	de
   7383 33            [ 6] 2594 	inc	sp
   7384 C5            [11] 2595 	push	bc
   7385 33            [ 6] 2596 	inc	sp
   7386 2A 03 65      [16] 2597 	ld	hl,(_mapa)
   7389 E5            [11] 2598 	push	hl
   738A CD 61 4B      [17] 2599 	call	_getTilePtr
   738D F1            [10] 2600 	pop	af
   738E F1            [10] 2601 	pop	af
   738F 4E            [ 7] 2602 	ld	c,(hl)
   7390 3E 02         [ 7] 2603 	ld	a,#0x02
   7392 91            [ 4] 2604 	sub	a, c
   7393 DA 7E 78      [10] 2605 	jp	C,00203$
                           2606 ;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7396 DD 6E F6      [19] 2607 	ld	l,-10 (ix)
   7399 DD 66 F7      [19] 2608 	ld	h,-9 (ix)
   739C 7E            [ 7] 2609 	ld	a,(hl)
   739D C6 18         [ 7] 2610 	add	a, #0x18
   739F 47            [ 4] 2611 	ld	b,a
   73A0 DD 6E F4      [19] 2612 	ld	l,-12 (ix)
   73A3 DD 66 F5      [19] 2613 	ld	h,-11 (ix)
   73A6 7E            [ 7] 2614 	ld	a,(hl)
   73A7 C6 04         [ 7] 2615 	add	a, #0x04
   73A9 C5            [11] 2616 	push	bc
   73AA 33            [ 6] 2617 	inc	sp
   73AB F5            [11] 2618 	push	af
   73AC 33            [ 6] 2619 	inc	sp
   73AD 2A 03 65      [16] 2620 	ld	hl,(_mapa)
   73B0 E5            [11] 2621 	push	hl
   73B1 CD 61 4B      [17] 2622 	call	_getTilePtr
   73B4 F1            [10] 2623 	pop	af
   73B5 F1            [10] 2624 	pop	af
   73B6 4E            [ 7] 2625 	ld	c,(hl)
   73B7 3E 02         [ 7] 2626 	ld	a,#0x02
   73B9 91            [ 4] 2627 	sub	a, c
   73BA DA 7E 78      [10] 2628 	jp	C,00203$
                           2629 ;src/main.c:480: moverEnemigoAbajo(enemy);
   73BD DD 6E F4      [19] 2630 	ld	l,-12 (ix)
   73C0 DD 66 F5      [19] 2631 	ld	h,-11 (ix)
   73C3 E5            [11] 2632 	push	hl
   73C4 CD 72 6B      [17] 2633 	call	_moverEnemigoAbajo
   73C7 F1            [10] 2634 	pop	af
                           2635 ;src/main.c:482: enemy->mover = SI;
   73C8 DD 6E F8      [19] 2636 	ld	l,-8 (ix)
   73CB DD 66 F9      [19] 2637 	ld	h,-7 (ix)
   73CE 36 01         [10] 2638 	ld	(hl),#0x01
   73D0 C3 7E 78      [10] 2639 	jp	00203$
   73D3                    2640 00196$:
                           2641 ;src/main.c:488: if (!prota.mover) distConstraint = 20; // ajuste en parado
   73D3 3A 2B 64      [13] 2642 	ld	a, (#_prota + 6)
   73D6 B7            [ 4] 2643 	or	a, a
   73D7 20 04         [12] 2644 	jr	NZ,00136$
   73D9 DD 36 F1 14   [19] 2645 	ld	-15 (ix),#0x14
   73DD                    2646 00136$:
                           2647 ;src/main.c:490: if (dist > distConstraint) {
   73DD DD 7E F1      [19] 2648 	ld	a,-15 (ix)
   73E0 DD 96 F0      [19] 2649 	sub	a, -16 (ix)
   73E3 D2 7E 78      [10] 2650 	jp	NC,00203$
                           2651 ;src/main.c:491: if (dx + 1 < enemy->x) {
   73E6 DD 5E 06      [19] 2652 	ld	e,6 (ix)
   73E9 16 00         [ 7] 2653 	ld	d,#0x00
   73EB 13            [ 6] 2654 	inc	de
   73EC DD 73 FE      [19] 2655 	ld	-2 (ix),e
   73EF DD 72 FF      [19] 2656 	ld	-1 (ix),d
   73F2 DD 70 FC      [19] 2657 	ld	-4 (ix),b
   73F5 DD 36 FD 00   [19] 2658 	ld	-3 (ix),#0x00
   73F9 DD 7E FE      [19] 2659 	ld	a,-2 (ix)
   73FC DD 96 FC      [19] 2660 	sub	a, -4 (ix)
   73FF DD 7E FF      [19] 2661 	ld	a,-1 (ix)
   7402 DD 9E FD      [19] 2662 	sbc	a, -3 (ix)
   7405 E2 0A 74      [10] 2663 	jp	PO, 00441$
   7408 EE 80         [ 7] 2664 	xor	a, #0x80
   740A                    2665 00441$:
   740A F2 86 74      [10] 2666 	jp	P,00148$
                           2667 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   740D DD 7E FA      [19] 2668 	ld	a,-6 (ix)
   7410 F5            [11] 2669 	push	af
   7411 33            [ 6] 2670 	inc	sp
   7412 C5            [11] 2671 	push	bc
   7413 33            [ 6] 2672 	inc	sp
   7414 2A 03 65      [16] 2673 	ld	hl,(_mapa)
   7417 E5            [11] 2674 	push	hl
   7418 CD 61 4B      [17] 2675 	call	_getTilePtr
   741B F1            [10] 2676 	pop	af
   741C F1            [10] 2677 	pop	af
   741D 4E            [ 7] 2678 	ld	c,(hl)
   741E 3E 02         [ 7] 2679 	ld	a,#0x02
   7420 91            [ 4] 2680 	sub	a, c
   7421 DA 13 75      [10] 2681 	jp	C,00149$
                           2682 ;src/main.c:493: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7424 DD 6E F6      [19] 2683 	ld	l,-10 (ix)
   7427 DD 66 F7      [19] 2684 	ld	h,-9 (ix)
   742A 7E            [ 7] 2685 	ld	a,(hl)
   742B C6 0B         [ 7] 2686 	add	a, #0x0B
   742D DD 6E F4      [19] 2687 	ld	l,-12 (ix)
   7430 DD 66 F5      [19] 2688 	ld	h,-11 (ix)
   7433 46            [ 7] 2689 	ld	b,(hl)
   7434 F5            [11] 2690 	push	af
   7435 33            [ 6] 2691 	inc	sp
   7436 C5            [11] 2692 	push	bc
   7437 33            [ 6] 2693 	inc	sp
   7438 2A 03 65      [16] 2694 	ld	hl,(_mapa)
   743B E5            [11] 2695 	push	hl
   743C CD 61 4B      [17] 2696 	call	_getTilePtr
   743F F1            [10] 2697 	pop	af
   7440 F1            [10] 2698 	pop	af
   7441 4E            [ 7] 2699 	ld	c,(hl)
   7442 3E 02         [ 7] 2700 	ld	a,#0x02
   7444 91            [ 4] 2701 	sub	a, c
   7445 DA 13 75      [10] 2702 	jp	C,00149$
                           2703 ;src/main.c:494: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7448 DD 6E F6      [19] 2704 	ld	l,-10 (ix)
   744B DD 66 F7      [19] 2705 	ld	h,-9 (ix)
   744E 7E            [ 7] 2706 	ld	a,(hl)
   744F C6 16         [ 7] 2707 	add	a, #0x16
   7451 DD 6E F4      [19] 2708 	ld	l,-12 (ix)
   7454 DD 66 F5      [19] 2709 	ld	h,-11 (ix)
   7457 46            [ 7] 2710 	ld	b,(hl)
   7458 F5            [11] 2711 	push	af
   7459 33            [ 6] 2712 	inc	sp
   745A C5            [11] 2713 	push	bc
   745B 33            [ 6] 2714 	inc	sp
   745C 2A 03 65      [16] 2715 	ld	hl,(_mapa)
   745F E5            [11] 2716 	push	hl
   7460 CD 61 4B      [17] 2717 	call	_getTilePtr
   7463 F1            [10] 2718 	pop	af
   7464 F1            [10] 2719 	pop	af
   7465 4E            [ 7] 2720 	ld	c,(hl)
   7466 3E 02         [ 7] 2721 	ld	a,#0x02
   7468 91            [ 4] 2722 	sub	a, c
   7469 DA 13 75      [10] 2723 	jp	C,00149$
                           2724 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   746C DD 6E F4      [19] 2725 	ld	l,-12 (ix)
   746F DD 66 F5      [19] 2726 	ld	h,-11 (ix)
   7472 E5            [11] 2727 	push	hl
   7473 CD A1 6B      [17] 2728 	call	_moverEnemigoIzquierda
   7476 F1            [10] 2729 	pop	af
                           2730 ;src/main.c:496: movX = 1;
   7477 DD 36 F3 01   [19] 2731 	ld	-13 (ix),#0x01
                           2732 ;src/main.c:497: enemy->mover = SI;
   747B DD 6E F8      [19] 2733 	ld	l,-8 (ix)
   747E DD 66 F9      [19] 2734 	ld	h,-7 (ix)
   7481 36 01         [10] 2735 	ld	(hl),#0x01
   7483 C3 13 75      [10] 2736 	jp	00149$
   7486                    2737 00148$:
                           2738 ;src/main.c:499: } else if (dx + 1 > enemy->x){
   7486 DD 7E FC      [19] 2739 	ld	a,-4 (ix)
   7489 DD 96 FE      [19] 2740 	sub	a, -2 (ix)
   748C DD 7E FD      [19] 2741 	ld	a,-3 (ix)
   748F DD 9E FF      [19] 2742 	sbc	a, -1 (ix)
   7492 E2 97 74      [10] 2743 	jp	PO, 00442$
   7495 EE 80         [ 7] 2744 	xor	a, #0x80
   7497                    2745 00442$:
   7497 F2 13 75      [10] 2746 	jp	P,00149$
                           2747 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   749A DD 66 FA      [19] 2748 	ld	h,-6 (ix)
   749D DD 6E FB      [19] 2749 	ld	l,-5 (ix)
   74A0 E5            [11] 2750 	push	hl
   74A1 2A 03 65      [16] 2751 	ld	hl,(_mapa)
   74A4 E5            [11] 2752 	push	hl
   74A5 CD 61 4B      [17] 2753 	call	_getTilePtr
   74A8 F1            [10] 2754 	pop	af
   74A9 F1            [10] 2755 	pop	af
   74AA 4E            [ 7] 2756 	ld	c,(hl)
   74AB 3E 02         [ 7] 2757 	ld	a,#0x02
   74AD 91            [ 4] 2758 	sub	a, c
   74AE 38 63         [12] 2759 	jr	C,00149$
                           2760 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   74B0 DD 6E F6      [19] 2761 	ld	l,-10 (ix)
   74B3 DD 66 F7      [19] 2762 	ld	h,-9 (ix)
   74B6 7E            [ 7] 2763 	ld	a,(hl)
   74B7 C6 0B         [ 7] 2764 	add	a, #0x0B
   74B9 47            [ 4] 2765 	ld	b,a
   74BA DD 6E F4      [19] 2766 	ld	l,-12 (ix)
   74BD DD 66 F5      [19] 2767 	ld	h,-11 (ix)
   74C0 7E            [ 7] 2768 	ld	a,(hl)
   74C1 C6 04         [ 7] 2769 	add	a, #0x04
   74C3 C5            [11] 2770 	push	bc
   74C4 33            [ 6] 2771 	inc	sp
   74C5 F5            [11] 2772 	push	af
   74C6 33            [ 6] 2773 	inc	sp
   74C7 2A 03 65      [16] 2774 	ld	hl,(_mapa)
   74CA E5            [11] 2775 	push	hl
   74CB CD 61 4B      [17] 2776 	call	_getTilePtr
   74CE F1            [10] 2777 	pop	af
   74CF F1            [10] 2778 	pop	af
   74D0 4E            [ 7] 2779 	ld	c,(hl)
   74D1 3E 02         [ 7] 2780 	ld	a,#0x02
   74D3 91            [ 4] 2781 	sub	a, c
   74D4 38 3D         [12] 2782 	jr	C,00149$
                           2783 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   74D6 DD 6E F6      [19] 2784 	ld	l,-10 (ix)
   74D9 DD 66 F7      [19] 2785 	ld	h,-9 (ix)
   74DC 7E            [ 7] 2786 	ld	a,(hl)
   74DD C6 16         [ 7] 2787 	add	a, #0x16
   74DF 47            [ 4] 2788 	ld	b,a
   74E0 DD 6E F4      [19] 2789 	ld	l,-12 (ix)
   74E3 DD 66 F5      [19] 2790 	ld	h,-11 (ix)
   74E6 7E            [ 7] 2791 	ld	a,(hl)
   74E7 C6 04         [ 7] 2792 	add	a, #0x04
   74E9 C5            [11] 2793 	push	bc
   74EA 33            [ 6] 2794 	inc	sp
   74EB F5            [11] 2795 	push	af
   74EC 33            [ 6] 2796 	inc	sp
   74ED 2A 03 65      [16] 2797 	ld	hl,(_mapa)
   74F0 E5            [11] 2798 	push	hl
   74F1 CD 61 4B      [17] 2799 	call	_getTilePtr
   74F4 F1            [10] 2800 	pop	af
   74F5 F1            [10] 2801 	pop	af
   74F6 4E            [ 7] 2802 	ld	c,(hl)
   74F7 3E 02         [ 7] 2803 	ld	a,#0x02
   74F9 91            [ 4] 2804 	sub	a, c
   74FA 38 17         [12] 2805 	jr	C,00149$
                           2806 ;src/main.c:503: moverEnemigoDerecha(enemy);
   74FC DD 6E F4      [19] 2807 	ld	l,-12 (ix)
   74FF DD 66 F5      [19] 2808 	ld	h,-11 (ix)
   7502 E5            [11] 2809 	push	hl
   7503 CD 91 6B      [17] 2810 	call	_moverEnemigoDerecha
   7506 F1            [10] 2811 	pop	af
                           2812 ;src/main.c:504: movX = 1;
   7507 DD 36 F3 01   [19] 2813 	ld	-13 (ix),#0x01
                           2814 ;src/main.c:505: enemy->mover = SI;
   750B DD 6E F8      [19] 2815 	ld	l,-8 (ix)
   750E DD 66 F9      [19] 2816 	ld	h,-7 (ix)
   7511 36 01         [10] 2817 	ld	(hl),#0x01
   7513                    2818 00149$:
                           2819 ;src/main.c:508: if (dy < enemy->y) {
   7513 DD 6E F6      [19] 2820 	ld	l,-10 (ix)
   7516 DD 66 F7      [19] 2821 	ld	h,-9 (ix)
   7519 4E            [ 7] 2822 	ld	c,(hl)
                           2823 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   751A DD 6E F4      [19] 2824 	ld	l,-12 (ix)
   751D DD 66 F5      [19] 2825 	ld	h,-11 (ix)
   7520 46            [ 7] 2826 	ld	b,(hl)
                           2827 ;src/main.c:508: if (dy < enemy->y) {
   7521 DD 7E 07      [19] 2828 	ld	a,7 (ix)
   7524 91            [ 4] 2829 	sub	a, c
   7525 D2 A5 75      [10] 2830 	jp	NC,00159$
                           2831 ;src/main.c:509: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7528 51            [ 4] 2832 	ld	d,c
   7529 15            [ 4] 2833 	dec	d
   752A 15            [ 4] 2834 	dec	d
   752B D5            [11] 2835 	push	de
   752C 33            [ 6] 2836 	inc	sp
   752D C5            [11] 2837 	push	bc
   752E 33            [ 6] 2838 	inc	sp
   752F 2A 03 65      [16] 2839 	ld	hl,(_mapa)
   7532 E5            [11] 2840 	push	hl
   7533 CD 61 4B      [17] 2841 	call	_getTilePtr
   7536 F1            [10] 2842 	pop	af
   7537 F1            [10] 2843 	pop	af
   7538 4E            [ 7] 2844 	ld	c,(hl)
   7539 3E 02         [ 7] 2845 	ld	a,#0x02
   753B 91            [ 4] 2846 	sub	a, c
   753C DA 1F 76      [10] 2847 	jp	C,00160$
                           2848 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   753F DD 6E F6      [19] 2849 	ld	l,-10 (ix)
   7542 DD 66 F7      [19] 2850 	ld	h,-9 (ix)
   7545 56            [ 7] 2851 	ld	d,(hl)
   7546 15            [ 4] 2852 	dec	d
   7547 15            [ 4] 2853 	dec	d
   7548 DD 6E F4      [19] 2854 	ld	l,-12 (ix)
   754B DD 66 F5      [19] 2855 	ld	h,-11 (ix)
   754E 46            [ 7] 2856 	ld	b,(hl)
   754F 04            [ 4] 2857 	inc	b
   7550 04            [ 4] 2858 	inc	b
   7551 D5            [11] 2859 	push	de
   7552 33            [ 6] 2860 	inc	sp
   7553 C5            [11] 2861 	push	bc
   7554 33            [ 6] 2862 	inc	sp
   7555 2A 03 65      [16] 2863 	ld	hl,(_mapa)
   7558 E5            [11] 2864 	push	hl
   7559 CD 61 4B      [17] 2865 	call	_getTilePtr
   755C F1            [10] 2866 	pop	af
   755D F1            [10] 2867 	pop	af
   755E 4E            [ 7] 2868 	ld	c,(hl)
   755F 3E 02         [ 7] 2869 	ld	a,#0x02
   7561 91            [ 4] 2870 	sub	a, c
   7562 DA 1F 76      [10] 2871 	jp	C,00160$
                           2872 ;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7565 DD 6E F6      [19] 2873 	ld	l,-10 (ix)
   7568 DD 66 F7      [19] 2874 	ld	h,-9 (ix)
   756B 46            [ 7] 2875 	ld	b,(hl)
   756C 05            [ 4] 2876 	dec	b
   756D 05            [ 4] 2877 	dec	b
   756E DD 6E F4      [19] 2878 	ld	l,-12 (ix)
   7571 DD 66 F5      [19] 2879 	ld	h,-11 (ix)
   7574 7E            [ 7] 2880 	ld	a,(hl)
   7575 C6 04         [ 7] 2881 	add	a, #0x04
   7577 C5            [11] 2882 	push	bc
   7578 33            [ 6] 2883 	inc	sp
   7579 F5            [11] 2884 	push	af
   757A 33            [ 6] 2885 	inc	sp
   757B 2A 03 65      [16] 2886 	ld	hl,(_mapa)
   757E E5            [11] 2887 	push	hl
   757F CD 61 4B      [17] 2888 	call	_getTilePtr
   7582 F1            [10] 2889 	pop	af
   7583 F1            [10] 2890 	pop	af
   7584 4E            [ 7] 2891 	ld	c,(hl)
   7585 3E 02         [ 7] 2892 	ld	a,#0x02
   7587 91            [ 4] 2893 	sub	a, c
   7588 DA 1F 76      [10] 2894 	jp	C,00160$
                           2895 ;src/main.c:512: moverEnemigoArriba(enemy);
   758B DD 6E F4      [19] 2896 	ld	l,-12 (ix)
   758E DD 66 F5      [19] 2897 	ld	h,-11 (ix)
   7591 E5            [11] 2898 	push	hl
   7592 CD 53 6B      [17] 2899 	call	_moverEnemigoArriba
   7595 F1            [10] 2900 	pop	af
                           2901 ;src/main.c:513: movY = 1;
   7596 DD 36 F2 01   [19] 2902 	ld	-14 (ix),#0x01
                           2903 ;src/main.c:514: enemy->mover = SI;
   759A DD 6E F8      [19] 2904 	ld	l,-8 (ix)
   759D DD 66 F9      [19] 2905 	ld	h,-7 (ix)
   75A0 36 01         [10] 2906 	ld	(hl),#0x01
   75A2 C3 1F 76      [10] 2907 	jp	00160$
   75A5                    2908 00159$:
                           2909 ;src/main.c:517: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75A5 79            [ 4] 2910 	ld	a,c
   75A6 C6 18         [ 7] 2911 	add	a, #0x18
   75A8 57            [ 4] 2912 	ld	d,a
   75A9 D5            [11] 2913 	push	de
   75AA 33            [ 6] 2914 	inc	sp
   75AB C5            [11] 2915 	push	bc
   75AC 33            [ 6] 2916 	inc	sp
   75AD 2A 03 65      [16] 2917 	ld	hl,(_mapa)
   75B0 E5            [11] 2918 	push	hl
   75B1 CD 61 4B      [17] 2919 	call	_getTilePtr
   75B4 F1            [10] 2920 	pop	af
   75B5 F1            [10] 2921 	pop	af
   75B6 4E            [ 7] 2922 	ld	c,(hl)
   75B7 3E 02         [ 7] 2923 	ld	a,#0x02
   75B9 91            [ 4] 2924 	sub	a, c
   75BA 38 63         [12] 2925 	jr	C,00160$
                           2926 ;src/main.c:518: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   75BC DD 6E F6      [19] 2927 	ld	l,-10 (ix)
   75BF DD 66 F7      [19] 2928 	ld	h,-9 (ix)
   75C2 7E            [ 7] 2929 	ld	a,(hl)
   75C3 C6 18         [ 7] 2930 	add	a, #0x18
   75C5 57            [ 4] 2931 	ld	d,a
   75C6 DD 6E F4      [19] 2932 	ld	l,-12 (ix)
   75C9 DD 66 F5      [19] 2933 	ld	h,-11 (ix)
   75CC 46            [ 7] 2934 	ld	b,(hl)
   75CD 04            [ 4] 2935 	inc	b
   75CE 04            [ 4] 2936 	inc	b
   75CF D5            [11] 2937 	push	de
   75D0 33            [ 6] 2938 	inc	sp
   75D1 C5            [11] 2939 	push	bc
   75D2 33            [ 6] 2940 	inc	sp
   75D3 2A 03 65      [16] 2941 	ld	hl,(_mapa)
   75D6 E5            [11] 2942 	push	hl
   75D7 CD 61 4B      [17] 2943 	call	_getTilePtr
   75DA F1            [10] 2944 	pop	af
   75DB F1            [10] 2945 	pop	af
   75DC 4E            [ 7] 2946 	ld	c,(hl)
   75DD 3E 02         [ 7] 2947 	ld	a,#0x02
   75DF 91            [ 4] 2948 	sub	a, c
   75E0 38 3D         [12] 2949 	jr	C,00160$
                           2950 ;src/main.c:519: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   75E2 DD 6E F6      [19] 2951 	ld	l,-10 (ix)
   75E5 DD 66 F7      [19] 2952 	ld	h,-9 (ix)
   75E8 7E            [ 7] 2953 	ld	a,(hl)
   75E9 C6 18         [ 7] 2954 	add	a, #0x18
   75EB 47            [ 4] 2955 	ld	b,a
   75EC DD 6E F4      [19] 2956 	ld	l,-12 (ix)
   75EF DD 66 F5      [19] 2957 	ld	h,-11 (ix)
   75F2 7E            [ 7] 2958 	ld	a,(hl)
   75F3 C6 04         [ 7] 2959 	add	a, #0x04
   75F5 C5            [11] 2960 	push	bc
   75F6 33            [ 6] 2961 	inc	sp
   75F7 F5            [11] 2962 	push	af
   75F8 33            [ 6] 2963 	inc	sp
   75F9 2A 03 65      [16] 2964 	ld	hl,(_mapa)
   75FC E5            [11] 2965 	push	hl
   75FD CD 61 4B      [17] 2966 	call	_getTilePtr
   7600 F1            [10] 2967 	pop	af
   7601 F1            [10] 2968 	pop	af
   7602 4E            [ 7] 2969 	ld	c,(hl)
   7603 3E 02         [ 7] 2970 	ld	a,#0x02
   7605 91            [ 4] 2971 	sub	a, c
   7606 38 17         [12] 2972 	jr	C,00160$
                           2973 ;src/main.c:520: moverEnemigoAbajo(enemy);
   7608 DD 6E F4      [19] 2974 	ld	l,-12 (ix)
   760B DD 66 F5      [19] 2975 	ld	h,-11 (ix)
   760E E5            [11] 2976 	push	hl
   760F CD 72 6B      [17] 2977 	call	_moverEnemigoAbajo
   7612 F1            [10] 2978 	pop	af
                           2979 ;src/main.c:521: movY = 1;
   7613 DD 36 F2 01   [19] 2980 	ld	-14 (ix),#0x01
                           2981 ;src/main.c:522: enemy->mover = SI;
   7617 DD 6E F8      [19] 2982 	ld	l,-8 (ix)
   761A DD 66 F9      [19] 2983 	ld	h,-7 (ix)
   761D 36 01         [10] 2984 	ld	(hl),#0x01
   761F                    2985 00160$:
                           2986 ;src/main.c:525: if (!enemy->mover) {
   761F DD 6E F8      [19] 2987 	ld	l,-8 (ix)
   7622 DD 66 F9      [19] 2988 	ld	h,-7 (ix)
   7625 7E            [ 7] 2989 	ld	a,(hl)
   7626 B7            [ 4] 2990 	or	a, a
   7627 C2 7E 78      [10] 2991 	jp	NZ,00203$
                           2992 ;src/main.c:526: if (!movX) {
   762A DD 7E F3      [19] 2993 	ld	a,-13 (ix)
   762D B7            [ 4] 2994 	or	a, a
   762E C2 57 77      [10] 2995 	jp	NZ,00175$
                           2996 ;src/main.c:527: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7631 DD 6E F6      [19] 2997 	ld	l,-10 (ix)
   7634 DD 66 F7      [19] 2998 	ld	h,-9 (ix)
   7637 5E            [ 7] 2999 	ld	e,(hl)
                           3000 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7638 DD 6E F4      [19] 3001 	ld	l,-12 (ix)
   763B DD 66 F5      [19] 3002 	ld	h,-11 (ix)
   763E 4E            [ 7] 3003 	ld	c,(hl)
                           3004 ;src/main.c:527: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   763F 3E 70         [ 7] 3005 	ld	a,#0x70
   7641 93            [ 4] 3006 	sub	a, e
   7642 D2 D2 76      [10] 3007 	jp	NC,00172$
                           3008 ;src/main.c:528: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7645 7B            [ 4] 3009 	ld	a,e
   7646 C6 18         [ 7] 3010 	add	a, #0x18
   7648 47            [ 4] 3011 	ld	b,a
   7649 C5            [11] 3012 	push	bc
   764A 2A 03 65      [16] 3013 	ld	hl,(_mapa)
   764D E5            [11] 3014 	push	hl
   764E CD 61 4B      [17] 3015 	call	_getTilePtr
   7651 F1            [10] 3016 	pop	af
   7652 F1            [10] 3017 	pop	af
   7653 4E            [ 7] 3018 	ld	c,(hl)
   7654 3E 02         [ 7] 3019 	ld	a,#0x02
   7656 91            [ 4] 3020 	sub	a, c
   7657 38 63         [12] 3021 	jr	C,00162$
                           3022 ;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7659 DD 6E F6      [19] 3023 	ld	l,-10 (ix)
   765C DD 66 F7      [19] 3024 	ld	h,-9 (ix)
   765F 7E            [ 7] 3025 	ld	a,(hl)
   7660 C6 18         [ 7] 3026 	add	a, #0x18
   7662 57            [ 4] 3027 	ld	d,a
   7663 DD 6E F4      [19] 3028 	ld	l,-12 (ix)
   7666 DD 66 F5      [19] 3029 	ld	h,-11 (ix)
   7669 4E            [ 7] 3030 	ld	c,(hl)
   766A 41            [ 4] 3031 	ld	b,c
   766B 04            [ 4] 3032 	inc	b
   766C 04            [ 4] 3033 	inc	b
   766D D5            [11] 3034 	push	de
   766E 33            [ 6] 3035 	inc	sp
   766F C5            [11] 3036 	push	bc
   7670 33            [ 6] 3037 	inc	sp
   7671 2A 03 65      [16] 3038 	ld	hl,(_mapa)
   7674 E5            [11] 3039 	push	hl
   7675 CD 61 4B      [17] 3040 	call	_getTilePtr
   7678 F1            [10] 3041 	pop	af
   7679 F1            [10] 3042 	pop	af
   767A 4E            [ 7] 3043 	ld	c,(hl)
   767B 3E 02         [ 7] 3044 	ld	a,#0x02
   767D 91            [ 4] 3045 	sub	a, c
   767E 38 3C         [12] 3046 	jr	C,00162$
                           3047 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7680 DD 6E F6      [19] 3048 	ld	l,-10 (ix)
   7683 DD 66 F7      [19] 3049 	ld	h,-9 (ix)
   7686 7E            [ 7] 3050 	ld	a,(hl)
   7687 C6 18         [ 7] 3051 	add	a, #0x18
   7689 47            [ 4] 3052 	ld	b,a
   768A DD 6E F4      [19] 3053 	ld	l,-12 (ix)
   768D DD 66 F5      [19] 3054 	ld	h,-11 (ix)
   7690 7E            [ 7] 3055 	ld	a,(hl)
   7691 C6 04         [ 7] 3056 	add	a, #0x04
   7693 C5            [11] 3057 	push	bc
   7694 33            [ 6] 3058 	inc	sp
   7695 F5            [11] 3059 	push	af
   7696 33            [ 6] 3060 	inc	sp
   7697 2A 03 65      [16] 3061 	ld	hl,(_mapa)
   769A E5            [11] 3062 	push	hl
   769B CD 61 4B      [17] 3063 	call	_getTilePtr
   769E F1            [10] 3064 	pop	af
   769F F1            [10] 3065 	pop	af
   76A0 4E            [ 7] 3066 	ld	c,(hl)
   76A1 3E 02         [ 7] 3067 	ld	a,#0x02
   76A3 91            [ 4] 3068 	sub	a, c
   76A4 38 16         [12] 3069 	jr	C,00162$
                           3070 ;src/main.c:531: moverEnemigoAbajo(enemy);
   76A6 DD 6E F4      [19] 3071 	ld	l,-12 (ix)
   76A9 DD 66 F5      [19] 3072 	ld	h,-11 (ix)
   76AC E5            [11] 3073 	push	hl
   76AD CD 72 6B      [17] 3074 	call	_moverEnemigoAbajo
   76B0 F1            [10] 3075 	pop	af
                           3076 ;src/main.c:532: enemy->mover = SI;
   76B1 DD 6E F8      [19] 3077 	ld	l,-8 (ix)
   76B4 DD 66 F9      [19] 3078 	ld	h,-7 (ix)
   76B7 36 01         [10] 3079 	ld	(hl),#0x01
   76B9 C3 57 77      [10] 3080 	jp	00175$
   76BC                    3081 00162$:
                           3082 ;src/main.c:534: moverEnemigoArriba(enemy);
   76BC DD 6E F4      [19] 3083 	ld	l,-12 (ix)
   76BF DD 66 F5      [19] 3084 	ld	h,-11 (ix)
   76C2 E5            [11] 3085 	push	hl
   76C3 CD 53 6B      [17] 3086 	call	_moverEnemigoArriba
   76C6 F1            [10] 3087 	pop	af
                           3088 ;src/main.c:535: enemy->mover = SI;
   76C7 DD 6E F8      [19] 3089 	ld	l,-8 (ix)
   76CA DD 66 F9      [19] 3090 	ld	h,-7 (ix)
   76CD 36 01         [10] 3091 	ld	(hl),#0x01
   76CF C3 57 77      [10] 3092 	jp	00175$
   76D2                    3093 00172$:
                           3094 ;src/main.c:538: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   76D2 43            [ 4] 3095 	ld	b,e
   76D3 05            [ 4] 3096 	dec	b
   76D4 05            [ 4] 3097 	dec	b
   76D5 C5            [11] 3098 	push	bc
   76D6 2A 03 65      [16] 3099 	ld	hl,(_mapa)
   76D9 E5            [11] 3100 	push	hl
   76DA CD 61 4B      [17] 3101 	call	_getTilePtr
   76DD F1            [10] 3102 	pop	af
   76DE F1            [10] 3103 	pop	af
   76DF 4E            [ 7] 3104 	ld	c,(hl)
   76E0 3E 02         [ 7] 3105 	ld	a,#0x02
   76E2 91            [ 4] 3106 	sub	a, c
   76E3 38 5F         [12] 3107 	jr	C,00167$
                           3108 ;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   76E5 DD 6E F6      [19] 3109 	ld	l,-10 (ix)
   76E8 DD 66 F7      [19] 3110 	ld	h,-9 (ix)
   76EB 56            [ 7] 3111 	ld	d,(hl)
   76EC 15            [ 4] 3112 	dec	d
   76ED 15            [ 4] 3113 	dec	d
   76EE DD 6E F4      [19] 3114 	ld	l,-12 (ix)
   76F1 DD 66 F5      [19] 3115 	ld	h,-11 (ix)
   76F4 46            [ 7] 3116 	ld	b,(hl)
   76F5 04            [ 4] 3117 	inc	b
   76F6 04            [ 4] 3118 	inc	b
   76F7 D5            [11] 3119 	push	de
   76F8 33            [ 6] 3120 	inc	sp
   76F9 C5            [11] 3121 	push	bc
   76FA 33            [ 6] 3122 	inc	sp
   76FB 2A 03 65      [16] 3123 	ld	hl,(_mapa)
   76FE E5            [11] 3124 	push	hl
   76FF CD 61 4B      [17] 3125 	call	_getTilePtr
   7702 F1            [10] 3126 	pop	af
   7703 F1            [10] 3127 	pop	af
   7704 4E            [ 7] 3128 	ld	c,(hl)
   7705 3E 02         [ 7] 3129 	ld	a,#0x02
   7707 91            [ 4] 3130 	sub	a, c
   7708 38 3A         [12] 3131 	jr	C,00167$
                           3132 ;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   770A DD 6E F6      [19] 3133 	ld	l,-10 (ix)
   770D DD 66 F7      [19] 3134 	ld	h,-9 (ix)
   7710 46            [ 7] 3135 	ld	b,(hl)
   7711 05            [ 4] 3136 	dec	b
   7712 05            [ 4] 3137 	dec	b
   7713 DD 6E F4      [19] 3138 	ld	l,-12 (ix)
   7716 DD 66 F5      [19] 3139 	ld	h,-11 (ix)
   7719 7E            [ 7] 3140 	ld	a,(hl)
   771A C6 04         [ 7] 3141 	add	a, #0x04
   771C C5            [11] 3142 	push	bc
   771D 33            [ 6] 3143 	inc	sp
   771E F5            [11] 3144 	push	af
   771F 33            [ 6] 3145 	inc	sp
   7720 2A 03 65      [16] 3146 	ld	hl,(_mapa)
   7723 E5            [11] 3147 	push	hl
   7724 CD 61 4B      [17] 3148 	call	_getTilePtr
   7727 F1            [10] 3149 	pop	af
   7728 F1            [10] 3150 	pop	af
   7729 4E            [ 7] 3151 	ld	c,(hl)
   772A 3E 02         [ 7] 3152 	ld	a,#0x02
   772C 91            [ 4] 3153 	sub	a, c
   772D 38 15         [12] 3154 	jr	C,00167$
                           3155 ;src/main.c:541: moverEnemigoArriba(enemy);
   772F DD 6E F4      [19] 3156 	ld	l,-12 (ix)
   7732 DD 66 F5      [19] 3157 	ld	h,-11 (ix)
   7735 E5            [11] 3158 	push	hl
   7736 CD 53 6B      [17] 3159 	call	_moverEnemigoArriba
   7739 F1            [10] 3160 	pop	af
                           3161 ;src/main.c:542: enemy->mover = SI;
   773A DD 6E F8      [19] 3162 	ld	l,-8 (ix)
   773D DD 66 F9      [19] 3163 	ld	h,-7 (ix)
   7740 36 01         [10] 3164 	ld	(hl),#0x01
   7742 18 13         [12] 3165 	jr	00175$
   7744                    3166 00167$:
                           3167 ;src/main.c:544: moverEnemigoAbajo(enemy);
   7744 DD 6E F4      [19] 3168 	ld	l,-12 (ix)
   7747 DD 66 F5      [19] 3169 	ld	h,-11 (ix)
   774A E5            [11] 3170 	push	hl
   774B CD 72 6B      [17] 3171 	call	_moverEnemigoAbajo
   774E F1            [10] 3172 	pop	af
                           3173 ;src/main.c:545: enemy->mover = SI;
   774F DD 6E F8      [19] 3174 	ld	l,-8 (ix)
   7752 DD 66 F9      [19] 3175 	ld	h,-7 (ix)
   7755 36 01         [10] 3176 	ld	(hl),#0x01
   7757                    3177 00175$:
                           3178 ;src/main.c:550: if (!movY) {
   7757 DD 7E F2      [19] 3179 	ld	a,-14 (ix)
   775A B7            [ 4] 3180 	or	a, a
   775B C2 7E 78      [10] 3181 	jp	NZ,00203$
                           3182 ;src/main.c:551: if (enemy->x < ANCHO_PANTALLA/2) {
   775E DD 6E F4      [19] 3183 	ld	l,-12 (ix)
   7761 DD 66 F5      [19] 3184 	ld	h,-11 (ix)
   7764 4E            [ 7] 3185 	ld	c,(hl)
                           3186 ;src/main.c:423: u8 dify = abs(enemy->y - prota.y);
   7765 DD 6E F6      [19] 3187 	ld	l,-10 (ix)
   7768 DD 66 F7      [19] 3188 	ld	h,-9 (ix)
   776B 46            [ 7] 3189 	ld	b,(hl)
                           3190 ;src/main.c:551: if (enemy->x < ANCHO_PANTALLA/2) {
   776C 79            [ 4] 3191 	ld	a,c
   776D D6 28         [ 7] 3192 	sub	a, #0x28
   776F D2 F4 77      [10] 3193 	jp	NC,00187$
                           3194 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7772 C5            [11] 3195 	push	bc
   7773 2A 03 65      [16] 3196 	ld	hl,(_mapa)
   7776 E5            [11] 3197 	push	hl
   7777 CD 61 4B      [17] 3198 	call	_getTilePtr
   777A F1            [10] 3199 	pop	af
   777B F1            [10] 3200 	pop	af
   777C 4E            [ 7] 3201 	ld	c,(hl)
   777D 3E 02         [ 7] 3202 	ld	a,#0x02
   777F 91            [ 4] 3203 	sub	a, c
   7780 38 5C         [12] 3204 	jr	C,00177$
                           3205 ;src/main.c:553: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7782 DD 6E F6      [19] 3206 	ld	l,-10 (ix)
   7785 DD 66 F7      [19] 3207 	ld	h,-9 (ix)
   7788 7E            [ 7] 3208 	ld	a,(hl)
   7789 C6 0B         [ 7] 3209 	add	a, #0x0B
   778B DD 6E F4      [19] 3210 	ld	l,-12 (ix)
   778E DD 66 F5      [19] 3211 	ld	h,-11 (ix)
   7791 46            [ 7] 3212 	ld	b,(hl)
   7792 F5            [11] 3213 	push	af
   7793 33            [ 6] 3214 	inc	sp
   7794 C5            [11] 3215 	push	bc
   7795 33            [ 6] 3216 	inc	sp
   7796 2A 03 65      [16] 3217 	ld	hl,(_mapa)
   7799 E5            [11] 3218 	push	hl
   779A CD 61 4B      [17] 3219 	call	_getTilePtr
   779D F1            [10] 3220 	pop	af
   779E F1            [10] 3221 	pop	af
   779F 4E            [ 7] 3222 	ld	c,(hl)
   77A0 3E 02         [ 7] 3223 	ld	a,#0x02
   77A2 91            [ 4] 3224 	sub	a, c
   77A3 38 39         [12] 3225 	jr	C,00177$
                           3226 ;src/main.c:554: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   77A5 DD 6E F6      [19] 3227 	ld	l,-10 (ix)
   77A8 DD 66 F7      [19] 3228 	ld	h,-9 (ix)
   77AB 7E            [ 7] 3229 	ld	a,(hl)
   77AC C6 16         [ 7] 3230 	add	a, #0x16
   77AE DD 6E F4      [19] 3231 	ld	l,-12 (ix)
   77B1 DD 66 F5      [19] 3232 	ld	h,-11 (ix)
   77B4 46            [ 7] 3233 	ld	b,(hl)
   77B5 F5            [11] 3234 	push	af
   77B6 33            [ 6] 3235 	inc	sp
   77B7 C5            [11] 3236 	push	bc
   77B8 33            [ 6] 3237 	inc	sp
   77B9 2A 03 65      [16] 3238 	ld	hl,(_mapa)
   77BC E5            [11] 3239 	push	hl
   77BD CD 61 4B      [17] 3240 	call	_getTilePtr
   77C0 F1            [10] 3241 	pop	af
   77C1 F1            [10] 3242 	pop	af
   77C2 4E            [ 7] 3243 	ld	c,(hl)
   77C3 3E 02         [ 7] 3244 	ld	a,#0x02
   77C5 91            [ 4] 3245 	sub	a, c
   77C6 38 16         [12] 3246 	jr	C,00177$
                           3247 ;src/main.c:555: moverEnemigoIzquierda(enemy);
   77C8 DD 6E F4      [19] 3248 	ld	l,-12 (ix)
   77CB DD 66 F5      [19] 3249 	ld	h,-11 (ix)
   77CE E5            [11] 3250 	push	hl
   77CF CD A1 6B      [17] 3251 	call	_moverEnemigoIzquierda
   77D2 F1            [10] 3252 	pop	af
                           3253 ;src/main.c:556: enemy->mover = SI;
   77D3 DD 6E F8      [19] 3254 	ld	l,-8 (ix)
   77D6 DD 66 F9      [19] 3255 	ld	h,-7 (ix)
   77D9 36 01         [10] 3256 	ld	(hl),#0x01
   77DB C3 7E 78      [10] 3257 	jp	00203$
   77DE                    3258 00177$:
                           3259 ;src/main.c:558: moverEnemigoDerecha(enemy);
   77DE DD 6E F4      [19] 3260 	ld	l,-12 (ix)
   77E1 DD 66 F5      [19] 3261 	ld	h,-11 (ix)
   77E4 E5            [11] 3262 	push	hl
   77E5 CD 91 6B      [17] 3263 	call	_moverEnemigoDerecha
   77E8 F1            [10] 3264 	pop	af
                           3265 ;src/main.c:559: enemy->mover = SI;
   77E9 DD 6E F8      [19] 3266 	ld	l,-8 (ix)
   77EC DD 66 F9      [19] 3267 	ld	h,-7 (ix)
   77EF 36 01         [10] 3268 	ld	(hl),#0x01
   77F1 C3 7E 78      [10] 3269 	jp	00203$
   77F4                    3270 00187$:
                           3271 ;src/main.c:562: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   77F4 79            [ 4] 3272 	ld	a,c
   77F5 C6 04         [ 7] 3273 	add	a, #0x04
   77F7 C5            [11] 3274 	push	bc
   77F8 33            [ 6] 3275 	inc	sp
   77F9 F5            [11] 3276 	push	af
   77FA 33            [ 6] 3277 	inc	sp
   77FB 2A 03 65      [16] 3278 	ld	hl,(_mapa)
   77FE E5            [11] 3279 	push	hl
   77FF CD 61 4B      [17] 3280 	call	_getTilePtr
   7802 F1            [10] 3281 	pop	af
   7803 F1            [10] 3282 	pop	af
   7804 4E            [ 7] 3283 	ld	c,(hl)
   7805 3E 02         [ 7] 3284 	ld	a,#0x02
   7807 91            [ 4] 3285 	sub	a, c
   7808 38 61         [12] 3286 	jr	C,00182$
                           3287 ;src/main.c:563: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   780A DD 6E F6      [19] 3288 	ld	l,-10 (ix)
   780D DD 66 F7      [19] 3289 	ld	h,-9 (ix)
   7810 7E            [ 7] 3290 	ld	a,(hl)
   7811 C6 0B         [ 7] 3291 	add	a, #0x0B
   7813 47            [ 4] 3292 	ld	b,a
   7814 DD 6E F4      [19] 3293 	ld	l,-12 (ix)
   7817 DD 66 F5      [19] 3294 	ld	h,-11 (ix)
   781A 7E            [ 7] 3295 	ld	a,(hl)
   781B C6 04         [ 7] 3296 	add	a, #0x04
   781D C5            [11] 3297 	push	bc
   781E 33            [ 6] 3298 	inc	sp
   781F F5            [11] 3299 	push	af
   7820 33            [ 6] 3300 	inc	sp
   7821 2A 03 65      [16] 3301 	ld	hl,(_mapa)
   7824 E5            [11] 3302 	push	hl
   7825 CD 61 4B      [17] 3303 	call	_getTilePtr
   7828 F1            [10] 3304 	pop	af
   7829 F1            [10] 3305 	pop	af
   782A 4E            [ 7] 3306 	ld	c,(hl)
   782B 3E 02         [ 7] 3307 	ld	a,#0x02
   782D 91            [ 4] 3308 	sub	a, c
   782E 38 3B         [12] 3309 	jr	C,00182$
                           3310 ;src/main.c:564: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7830 DD 6E F6      [19] 3311 	ld	l,-10 (ix)
   7833 DD 66 F7      [19] 3312 	ld	h,-9 (ix)
   7836 7E            [ 7] 3313 	ld	a,(hl)
   7837 C6 16         [ 7] 3314 	add	a, #0x16
   7839 47            [ 4] 3315 	ld	b,a
   783A DD 6E F4      [19] 3316 	ld	l,-12 (ix)
   783D DD 66 F5      [19] 3317 	ld	h,-11 (ix)
   7840 7E            [ 7] 3318 	ld	a,(hl)
   7841 C6 04         [ 7] 3319 	add	a, #0x04
   7843 C5            [11] 3320 	push	bc
   7844 33            [ 6] 3321 	inc	sp
   7845 F5            [11] 3322 	push	af
   7846 33            [ 6] 3323 	inc	sp
   7847 2A 03 65      [16] 3324 	ld	hl,(_mapa)
   784A E5            [11] 3325 	push	hl
   784B CD 61 4B      [17] 3326 	call	_getTilePtr
   784E F1            [10] 3327 	pop	af
   784F F1            [10] 3328 	pop	af
   7850 4E            [ 7] 3329 	ld	c,(hl)
   7851 3E 02         [ 7] 3330 	ld	a,#0x02
   7853 91            [ 4] 3331 	sub	a, c
   7854 38 15         [12] 3332 	jr	C,00182$
                           3333 ;src/main.c:565: moverEnemigoDerecha(enemy);
   7856 DD 6E F4      [19] 3334 	ld	l,-12 (ix)
   7859 DD 66 F5      [19] 3335 	ld	h,-11 (ix)
   785C E5            [11] 3336 	push	hl
   785D CD 91 6B      [17] 3337 	call	_moverEnemigoDerecha
   7860 F1            [10] 3338 	pop	af
                           3339 ;src/main.c:566: enemy->mover = SI;
   7861 DD 6E F8      [19] 3340 	ld	l,-8 (ix)
   7864 DD 66 F9      [19] 3341 	ld	h,-7 (ix)
   7867 36 01         [10] 3342 	ld	(hl),#0x01
   7869 18 13         [12] 3343 	jr	00203$
   786B                    3344 00182$:
                           3345 ;src/main.c:569: moverEnemigoIzquierda(enemy);
   786B DD 6E F4      [19] 3346 	ld	l,-12 (ix)
   786E DD 66 F5      [19] 3347 	ld	h,-11 (ix)
   7871 E5            [11] 3348 	push	hl
   7872 CD A1 6B      [17] 3349 	call	_moverEnemigoIzquierda
   7875 F1            [10] 3350 	pop	af
                           3351 ;src/main.c:570: enemy->mover = SI;
   7876 DD 6E F8      [19] 3352 	ld	l,-8 (ix)
   7879 DD 66 F9      [19] 3353 	ld	h,-7 (ix)
   787C 36 01         [10] 3354 	ld	(hl),#0x01
   787E                    3355 00203$:
   787E DD F9         [10] 3356 	ld	sp, ix
   7880 DD E1         [14] 3357 	pop	ix
   7882 C9            [10] 3358 	ret
                           3359 ;src/main.c:579: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3360 ;	---------------------------------
                           3361 ; Function updateEnemy
                           3362 ; ---------------------------------
   7883                    3363 _updateEnemy::
   7883 DD E5         [15] 3364 	push	ix
   7885 DD 21 00 00   [14] 3365 	ld	ix,#0
   7889 DD 39         [15] 3366 	add	ix,sp
   788B 21 F4 FF      [10] 3367 	ld	hl,#-12
   788E 39            [11] 3368 	add	hl,sp
   788F F9            [ 6] 3369 	ld	sp,hl
                           3370 ;src/main.c:586: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7890 DD 4E 04      [19] 3371 	ld	c,4 (ix)
   7893 DD 46 05      [19] 3372 	ld	b,5 (ix)
   7896 21 15 00      [10] 3373 	ld	hl,#0x0015
   7899 09            [11] 3374 	add	hl,bc
   789A E3            [19] 3375 	ex	(sp), hl
   789B E1            [10] 3376 	pop	hl
   789C E5            [11] 3377 	push	hl
   789D 7E            [ 7] 3378 	ld	a,(hl)
   789E B7            [ 4] 3379 	or	a, a
   789F 28 19         [12] 3380 	jr	Z,00115$
                           3381 ;src/main.c:587: enemy->patrolling = 0;
   78A1 21 A7 60      [10] 3382 	ld	hl,#(_enemy + 0x000a)
   78A4 36 00         [10] 3383 	ld	(hl),#0x00
                           3384 ;src/main.c:588: engage(actual, prota.x, prota.y);
   78A6 3A 26 64      [13] 3385 	ld	a, (#_prota + 1)
   78A9 21 25 64      [10] 3386 	ld	hl, #_prota + 0
   78AC 56            [ 7] 3387 	ld	d,(hl)
   78AD F5            [11] 3388 	push	af
   78AE 33            [ 6] 3389 	inc	sp
   78AF D5            [11] 3390 	push	de
   78B0 33            [ 6] 3391 	inc	sp
   78B1 C5            [11] 3392 	push	bc
   78B2 CD A7 70      [17] 3393 	call	_engage
   78B5 F1            [10] 3394 	pop	af
   78B6 F1            [10] 3395 	pop	af
   78B7 C3 DA 79      [10] 3396 	jp	00117$
   78BA                    3397 00115$:
                           3398 ;src/main.c:590: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   78BA C5            [11] 3399 	push	bc
   78BB C5            [11] 3400 	push	bc
   78BC CD FC 6D      [17] 3401 	call	_lookFor
   78BF F1            [10] 3402 	pop	af
   78C0 C1            [10] 3403 	pop	bc
                           3404 ;src/main.c:596: actual->patrolling = 0;
   78C1 21 0A 00      [10] 3405 	ld	hl,#0x000A
   78C4 09            [11] 3406 	add	hl,bc
   78C5 DD 75 FE      [19] 3407 	ld	-2 (ix),l
   78C8 DD 74 FF      [19] 3408 	ld	-1 (ix),h
                           3409 ;src/main.c:591: if (actual->patrolling) {
   78CB DD 6E FE      [19] 3410 	ld	l,-2 (ix)
   78CE DD 66 FF      [19] 3411 	ld	h,-1 (ix)
   78D1 6E            [ 7] 3412 	ld	l,(hl)
                           3413 ;src/main.c:594: if (actual->in_range) {
   78D2 79            [ 4] 3414 	ld	a,c
   78D3 C6 10         [ 7] 3415 	add	a, #0x10
   78D5 5F            [ 4] 3416 	ld	e,a
   78D6 78            [ 4] 3417 	ld	a,b
   78D7 CE 00         [ 7] 3418 	adc	a, #0x00
   78D9 57            [ 4] 3419 	ld	d,a
                           3420 ;src/main.c:602: actual->seek = 1;
   78DA 79            [ 4] 3421 	ld	a,c
   78DB C6 13         [ 7] 3422 	add	a, #0x13
   78DD DD 77 FC      [19] 3423 	ld	-4 (ix),a
   78E0 78            [ 4] 3424 	ld	a,b
   78E1 CE 00         [ 7] 3425 	adc	a, #0x00
   78E3 DD 77 FD      [19] 3426 	ld	-3 (ix),a
                           3427 ;src/main.c:591: if (actual->patrolling) {
   78E6 7D            [ 4] 3428 	ld	a,l
   78E7 B7            [ 4] 3429 	or	a, a
   78E8 CA A6 79      [10] 3430 	jp	Z,00112$
                           3431 ;src/main.c:593: moverEnemigoPatrol(actual);
   78EB C5            [11] 3432 	push	bc
   78EC D5            [11] 3433 	push	de
   78ED C5            [11] 3434 	push	bc
   78EE CD B3 6B      [17] 3435 	call	_moverEnemigoPatrol
   78F1 F1            [10] 3436 	pop	af
   78F2 D1            [10] 3437 	pop	de
   78F3 C1            [10] 3438 	pop	bc
                           3439 ;src/main.c:594: if (actual->in_range) {
   78F4 1A            [ 7] 3440 	ld	a,(de)
   78F5 B7            [ 4] 3441 	or	a, a
   78F6 28 20         [12] 3442 	jr	Z,00104$
                           3443 ;src/main.c:595: engage(actual, prota.x, prota.y);
   78F8 3A 26 64      [13] 3444 	ld	a, (#_prota + 1)
   78FB 21 25 64      [10] 3445 	ld	hl, #_prota + 0
   78FE 56            [ 7] 3446 	ld	d,(hl)
   78FF F5            [11] 3447 	push	af
   7900 33            [ 6] 3448 	inc	sp
   7901 D5            [11] 3449 	push	de
   7902 33            [ 6] 3450 	inc	sp
   7903 C5            [11] 3451 	push	bc
   7904 CD A7 70      [17] 3452 	call	_engage
   7907 F1            [10] 3453 	pop	af
   7908 F1            [10] 3454 	pop	af
                           3455 ;src/main.c:596: actual->patrolling = 0;
   7909 DD 6E FE      [19] 3456 	ld	l,-2 (ix)
   790C DD 66 FF      [19] 3457 	ld	h,-1 (ix)
   790F 36 00         [10] 3458 	ld	(hl),#0x00
                           3459 ;src/main.c:597: actual->engage = 1;
   7911 E1            [10] 3460 	pop	hl
   7912 E5            [11] 3461 	push	hl
   7913 36 01         [10] 3462 	ld	(hl),#0x01
   7915 C3 DA 79      [10] 3463 	jp	00117$
   7918                    3464 00104$:
                           3465 ;src/main.c:598: } else if (actual->seen) {
   7918 21 11 00      [10] 3466 	ld	hl,#0x0011
   791B 09            [11] 3467 	add	hl,bc
   791C DD 75 F9      [19] 3468 	ld	-7 (ix),l
   791F DD 74 FA      [19] 3469 	ld	-6 (ix),h
   7922 DD 6E F9      [19] 3470 	ld	l,-7 (ix)
   7925 DD 66 FA      [19] 3471 	ld	h,-6 (ix)
   7928 7E            [ 7] 3472 	ld	a,(hl)
   7929 B7            [ 4] 3473 	or	a, a
   792A CA DA 79      [10] 3474 	jp	Z,00117$
                           3475 ;src/main.c:599: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   792D 3A 26 64      [13] 3476 	ld	a,(#_prota + 1)
   7930 DD 77 F8      [19] 3477 	ld	-8 (ix),a
   7933 21 25 64      [10] 3478 	ld	hl, #_prota + 0
   7936 5E            [ 7] 3479 	ld	e,(hl)
   7937 21 01 00      [10] 3480 	ld	hl,#0x0001
   793A 09            [11] 3481 	add	hl,bc
   793B DD 75 F6      [19] 3482 	ld	-10 (ix),l
   793E DD 74 F7      [19] 3483 	ld	-9 (ix),h
   7941 DD 6E F6      [19] 3484 	ld	l,-10 (ix)
   7944 DD 66 F7      [19] 3485 	ld	h,-9 (ix)
   7947 56            [ 7] 3486 	ld	d,(hl)
   7948 0A            [ 7] 3487 	ld	a,(bc)
   7949 DD 77 FB      [19] 3488 	ld	-5 (ix),a
   794C C5            [11] 3489 	push	bc
   794D 2A 03 65      [16] 3490 	ld	hl,(_mapa)
   7950 E5            [11] 3491 	push	hl
   7951 C5            [11] 3492 	push	bc
   7952 DD 7E F8      [19] 3493 	ld	a,-8 (ix)
   7955 F5            [11] 3494 	push	af
   7956 33            [ 6] 3495 	inc	sp
   7957 7B            [ 4] 3496 	ld	a,e
   7958 F5            [11] 3497 	push	af
   7959 33            [ 6] 3498 	inc	sp
   795A D5            [11] 3499 	push	de
   795B 33            [ 6] 3500 	inc	sp
   795C DD 7E FB      [19] 3501 	ld	a,-5 (ix)
   795F F5            [11] 3502 	push	af
   7960 33            [ 6] 3503 	inc	sp
   7961 CD 30 44      [17] 3504 	call	_pathFinding
   7964 21 08 00      [10] 3505 	ld	hl,#8
   7967 39            [11] 3506 	add	hl,sp
   7968 F9            [ 6] 3507 	ld	sp,hl
   7969 C1            [10] 3508 	pop	bc
                           3509 ;src/main.c:600: actual->p_seek_x = actual->x;
   796A 21 17 00      [10] 3510 	ld	hl,#0x0017
   796D 09            [11] 3511 	add	hl,bc
   796E EB            [ 4] 3512 	ex	de,hl
   796F 0A            [ 7] 3513 	ld	a,(bc)
   7970 12            [ 7] 3514 	ld	(de),a
                           3515 ;src/main.c:601: actual->p_seek_y = actual->y;
   7971 21 18 00      [10] 3516 	ld	hl,#0x0018
   7974 09            [11] 3517 	add	hl,bc
   7975 EB            [ 4] 3518 	ex	de,hl
   7976 DD 6E F6      [19] 3519 	ld	l,-10 (ix)
   7979 DD 66 F7      [19] 3520 	ld	h,-9 (ix)
   797C 7E            [ 7] 3521 	ld	a,(hl)
   797D 12            [ 7] 3522 	ld	(de),a
                           3523 ;src/main.c:602: actual->seek = 1;
   797E DD 6E FC      [19] 3524 	ld	l,-4 (ix)
   7981 DD 66 FD      [19] 3525 	ld	h,-3 (ix)
   7984 36 01         [10] 3526 	ld	(hl),#0x01
                           3527 ;src/main.c:603: actual->iter=0;
   7986 21 0D 00      [10] 3528 	ld	hl,#0x000D
   7989 09            [11] 3529 	add	hl,bc
   798A AF            [ 4] 3530 	xor	a, a
   798B 77            [ 7] 3531 	ld	(hl), a
   798C 23            [ 6] 3532 	inc	hl
   798D 77            [ 7] 3533 	ld	(hl), a
                           3534 ;src/main.c:604: actual->reversePatrol = NO;
   798E 21 0B 00      [10] 3535 	ld	hl,#0x000B
   7991 09            [11] 3536 	add	hl,bc
   7992 36 00         [10] 3537 	ld	(hl),#0x00
                           3538 ;src/main.c:605: actual->patrolling = 0;
   7994 DD 6E FE      [19] 3539 	ld	l,-2 (ix)
   7997 DD 66 FF      [19] 3540 	ld	h,-1 (ix)
   799A 36 00         [10] 3541 	ld	(hl),#0x00
                           3542 ;src/main.c:606: actual->seen = 0;
   799C DD 6E F9      [19] 3543 	ld	l,-7 (ix)
   799F DD 66 FA      [19] 3544 	ld	h,-6 (ix)
   79A2 36 00         [10] 3545 	ld	(hl),#0x00
   79A4 18 34         [12] 3546 	jr	00117$
   79A6                    3547 00112$:
                           3548 ;src/main.c:608: } else if (actual->seek) {
   79A6 DD 6E FC      [19] 3549 	ld	l,-4 (ix)
   79A9 DD 66 FD      [19] 3550 	ld	h,-3 (ix)
   79AC 7E            [ 7] 3551 	ld	a,(hl)
   79AD B7            [ 4] 3552 	or	a, a
   79AE 28 2A         [12] 3553 	jr	Z,00117$
                           3554 ;src/main.c:609: moverEnemigoSeek(actual);
   79B0 C5            [11] 3555 	push	bc
   79B1 D5            [11] 3556 	push	de
   79B2 C5            [11] 3557 	push	bc
   79B3 CD 02 6F      [17] 3558 	call	_moverEnemigoSeek
   79B6 F1            [10] 3559 	pop	af
   79B7 D1            [10] 3560 	pop	de
   79B8 C1            [10] 3561 	pop	bc
                           3562 ;src/main.c:610: if (actual->in_range) {
   79B9 1A            [ 7] 3563 	ld	a,(de)
   79BA B7            [ 4] 3564 	or	a, a
   79BB 28 1D         [12] 3565 	jr	Z,00117$
                           3566 ;src/main.c:611: engage(actual, prota.x, prota.y);
   79BD 3A 26 64      [13] 3567 	ld	a, (#_prota + 1)
   79C0 21 25 64      [10] 3568 	ld	hl, #_prota + 0
   79C3 56            [ 7] 3569 	ld	d,(hl)
   79C4 F5            [11] 3570 	push	af
   79C5 33            [ 6] 3571 	inc	sp
   79C6 D5            [11] 3572 	push	de
   79C7 33            [ 6] 3573 	inc	sp
   79C8 C5            [11] 3574 	push	bc
   79C9 CD A7 70      [17] 3575 	call	_engage
   79CC F1            [10] 3576 	pop	af
   79CD F1            [10] 3577 	pop	af
                           3578 ;src/main.c:612: actual->seek = 0;
   79CE DD 6E FC      [19] 3579 	ld	l,-4 (ix)
   79D1 DD 66 FD      [19] 3580 	ld	h,-3 (ix)
   79D4 36 00         [10] 3581 	ld	(hl),#0x00
                           3582 ;src/main.c:613: actual->engage = 1;
   79D6 E1            [10] 3583 	pop	hl
   79D7 E5            [11] 3584 	push	hl
   79D8 36 01         [10] 3585 	ld	(hl),#0x01
                           3586 ;src/main.c:614: } else if (actual->seen) {
   79DA                    3587 00117$:
   79DA DD F9         [10] 3588 	ld	sp, ix
   79DC DD E1         [14] 3589 	pop	ix
   79DE C9            [10] 3590 	ret
                           3591 ;src/main.c:621: void inicializarEnemy() {
                           3592 ;	---------------------------------
                           3593 ; Function inicializarEnemy
                           3594 ; ---------------------------------
   79DF                    3595 _inicializarEnemy::
   79DF DD E5         [15] 3596 	push	ix
   79E1 DD 21 00 00   [14] 3597 	ld	ix,#0
   79E5 DD 39         [15] 3598 	add	ix,sp
   79E7 21 F9 FF      [10] 3599 	ld	hl,#-7
   79EA 39            [11] 3600 	add	hl,sp
   79EB F9            [ 6] 3601 	ld	sp,hl
                           3602 ;src/main.c:622: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   79EC 3A 05 65      [13] 3603 	ld	a,(#_num_mapa + 0)
   79EF C6 02         [ 7] 3604 	add	a, #0x02
   79F1 DD 77 FF      [19] 3605 	ld	-1 (ix),a
                           3606 ;src/main.c:632: actual = enemy;
   79F4 11 9D 60      [10] 3607 	ld	de,#_enemy+0
                           3608 ;src/main.c:633: while(i){
   79F7                    3609 00101$:
   79F7 DD 7E FF      [19] 3610 	ld	a,-1 (ix)
   79FA B7            [ 4] 3611 	or	a, a
   79FB CA F1 7A      [10] 3612 	jp	Z,00104$
                           3613 ;src/main.c:634: --i;
   79FE DD 35 FF      [23] 3614 	dec	-1 (ix)
                           3615 ;src/main.c:635: actual->x = actual->px = spawnX[i];
   7A01 4B            [ 4] 3616 	ld	c, e
   7A02 42            [ 4] 3617 	ld	b, d
   7A03 03            [ 6] 3618 	inc	bc
   7A04 03            [ 6] 3619 	inc	bc
   7A05 3E 27         [ 7] 3620 	ld	a,#<(_spawnX)
   7A07 DD 86 FF      [19] 3621 	add	a, -1 (ix)
   7A0A DD 77 FB      [19] 3622 	ld	-5 (ix),a
   7A0D 3E 65         [ 7] 3623 	ld	a,#>(_spawnX)
   7A0F CE 00         [ 7] 3624 	adc	a, #0x00
   7A11 DD 77 FC      [19] 3625 	ld	-4 (ix),a
   7A14 DD 6E FB      [19] 3626 	ld	l,-5 (ix)
   7A17 DD 66 FC      [19] 3627 	ld	h,-4 (ix)
   7A1A 7E            [ 7] 3628 	ld	a,(hl)
   7A1B 02            [ 7] 3629 	ld	(bc),a
   7A1C 12            [ 7] 3630 	ld	(de),a
                           3631 ;src/main.c:636: actual->y = actual->py = spawnY[i];
   7A1D D5            [11] 3632 	push	de
   7A1E FD E1         [14] 3633 	pop	iy
   7A20 FD 23         [10] 3634 	inc	iy
   7A22 4B            [ 4] 3635 	ld	c, e
   7A23 42            [ 4] 3636 	ld	b, d
   7A24 03            [ 6] 3637 	inc	bc
   7A25 03            [ 6] 3638 	inc	bc
   7A26 03            [ 6] 3639 	inc	bc
   7A27 3E 2B         [ 7] 3640 	ld	a,#<(_spawnY)
   7A29 DD 86 FF      [19] 3641 	add	a, -1 (ix)
   7A2C DD 77 F9      [19] 3642 	ld	-7 (ix),a
   7A2F 3E 65         [ 7] 3643 	ld	a,#>(_spawnY)
   7A31 CE 00         [ 7] 3644 	adc	a, #0x00
   7A33 DD 77 FA      [19] 3645 	ld	-6 (ix),a
   7A36 E1            [10] 3646 	pop	hl
   7A37 E5            [11] 3647 	push	hl
   7A38 7E            [ 7] 3648 	ld	a,(hl)
   7A39 02            [ 7] 3649 	ld	(bc),a
   7A3A FD 77 00      [19] 3650 	ld	0 (iy), a
                           3651 ;src/main.c:637: actual->mover  = NO;
   7A3D 21 06 00      [10] 3652 	ld	hl,#0x0006
   7A40 19            [11] 3653 	add	hl,de
   7A41 36 00         [10] 3654 	ld	(hl),#0x00
                           3655 ;src/main.c:638: actual->mira   = M_abajo;
   7A43 21 07 00      [10] 3656 	ld	hl,#0x0007
   7A46 19            [11] 3657 	add	hl,de
   7A47 36 03         [10] 3658 	ld	(hl),#0x03
                           3659 ;src/main.c:639: actual->sprite = g_enemy;
   7A49 21 04 00      [10] 3660 	ld	hl,#0x0004
   7A4C 19            [11] 3661 	add	hl,de
   7A4D 36 3A         [10] 3662 	ld	(hl),#<(_g_enemy)
   7A4F 23            [ 6] 3663 	inc	hl
   7A50 36 3C         [10] 3664 	ld	(hl),#>(_g_enemy)
                           3665 ;src/main.c:640: actual->muerto = NO;
   7A52 21 08 00      [10] 3666 	ld	hl,#0x0008
   7A55 19            [11] 3667 	add	hl,de
   7A56 36 00         [10] 3668 	ld	(hl),#0x00
                           3669 ;src/main.c:641: actual->muertes = 0;
   7A58 21 09 00      [10] 3670 	ld	hl,#0x0009
   7A5B 19            [11] 3671 	add	hl,de
   7A5C 36 00         [10] 3672 	ld	(hl),#0x00
                           3673 ;src/main.c:642: actual->patrolling = SI;
   7A5E 21 0A 00      [10] 3674 	ld	hl,#0x000A
   7A61 19            [11] 3675 	add	hl,de
   7A62 36 01         [10] 3676 	ld	(hl),#0x01
                           3677 ;src/main.c:643: actual->reversePatrol = NO;
   7A64 21 0B 00      [10] 3678 	ld	hl,#0x000B
   7A67 19            [11] 3679 	add	hl,de
   7A68 36 00         [10] 3680 	ld	(hl),#0x00
                           3681 ;src/main.c:644: actual->didDamage = 0;
   7A6A 21 16 00      [10] 3682 	ld	hl,#0x0016
   7A6D 19            [11] 3683 	add	hl,de
   7A6E 36 00         [10] 3684 	ld	(hl),#0x00
                           3685 ;src/main.c:645: actual->iter = 0;
   7A70 21 0D 00      [10] 3686 	ld	hl,#0x000D
   7A73 19            [11] 3687 	add	hl,de
   7A74 AF            [ 4] 3688 	xor	a, a
   7A75 77            [ 7] 3689 	ld	(hl), a
   7A76 23            [ 6] 3690 	inc	hl
   7A77 77            [ 7] 3691 	ld	(hl), a
                           3692 ;src/main.c:646: actual->lastIter = 0;
   7A78 21 0F 00      [10] 3693 	ld	hl,#0x000F
   7A7B 19            [11] 3694 	add	hl,de
   7A7C 36 00         [10] 3695 	ld	(hl),#0x00
                           3696 ;src/main.c:647: actual->seen = 0;
   7A7E 21 11 00      [10] 3697 	ld	hl,#0x0011
   7A81 19            [11] 3698 	add	hl,de
   7A82 36 00         [10] 3699 	ld	(hl),#0x00
                           3700 ;src/main.c:648: actual->found = 0;
   7A84 21 12 00      [10] 3701 	ld	hl,#0x0012
   7A87 19            [11] 3702 	add	hl,de
   7A88 36 00         [10] 3703 	ld	(hl),#0x00
                           3704 ;src/main.c:649: actual->engage = 0;
   7A8A 21 15 00      [10] 3705 	ld	hl,#0x0015
   7A8D 19            [11] 3706 	add	hl,de
   7A8E 36 00         [10] 3707 	ld	(hl),#0x00
                           3708 ;src/main.c:650: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7A90 21 05 65      [10] 3709 	ld	hl,#_num_mapa + 0
   7A93 4E            [ 7] 3710 	ld	c, (hl)
   7A94 0C            [ 4] 3711 	inc	c
   7A95 06 00         [ 7] 3712 	ld	b,#0x00
   7A97 69            [ 4] 3713 	ld	l, c
   7A98 60            [ 4] 3714 	ld	h, b
   7A99 29            [11] 3715 	add	hl, hl
   7A9A 29            [11] 3716 	add	hl, hl
   7A9B 09            [11] 3717 	add	hl, bc
   7A9C 4D            [ 4] 3718 	ld	c,l
   7A9D 44            [ 4] 3719 	ld	b,h
   7A9E 21 43 65      [10] 3720 	ld	hl,#_patrolY
   7AA1 09            [11] 3721 	add	hl,bc
   7AA2 7D            [ 4] 3722 	ld	a,l
   7AA3 DD 86 FF      [19] 3723 	add	a, -1 (ix)
   7AA6 6F            [ 4] 3724 	ld	l,a
   7AA7 7C            [ 4] 3725 	ld	a,h
   7AA8 CE 00         [ 7] 3726 	adc	a, #0x00
   7AAA 67            [ 4] 3727 	ld	h,a
   7AAB 7E            [ 7] 3728 	ld	a,(hl)
   7AAC DD 77 FE      [19] 3729 	ld	-2 (ix),a
   7AAF 21 2F 65      [10] 3730 	ld	hl,#_patrolX
   7AB2 09            [11] 3731 	add	hl,bc
   7AB3 DD 4E FF      [19] 3732 	ld	c,-1 (ix)
   7AB6 06 00         [ 7] 3733 	ld	b,#0x00
   7AB8 09            [11] 3734 	add	hl,bc
   7AB9 7E            [ 7] 3735 	ld	a,(hl)
   7ABA DD 77 FD      [19] 3736 	ld	-3 (ix),a
   7ABD E1            [10] 3737 	pop	hl
   7ABE E5            [11] 3738 	push	hl
   7ABF 4E            [ 7] 3739 	ld	c,(hl)
   7AC0 DD 6E FB      [19] 3740 	ld	l,-5 (ix)
   7AC3 DD 66 FC      [19] 3741 	ld	h,-4 (ix)
   7AC6 46            [ 7] 3742 	ld	b,(hl)
   7AC7 D5            [11] 3743 	push	de
   7AC8 2A 03 65      [16] 3744 	ld	hl,(_mapa)
   7ACB E5            [11] 3745 	push	hl
   7ACC D5            [11] 3746 	push	de
   7ACD DD 66 FE      [19] 3747 	ld	h,-2 (ix)
   7AD0 DD 6E FD      [19] 3748 	ld	l,-3 (ix)
   7AD3 E5            [11] 3749 	push	hl
   7AD4 79            [ 4] 3750 	ld	a,c
   7AD5 F5            [11] 3751 	push	af
   7AD6 33            [ 6] 3752 	inc	sp
   7AD7 C5            [11] 3753 	push	bc
   7AD8 33            [ 6] 3754 	inc	sp
   7AD9 CD 30 44      [17] 3755 	call	_pathFinding
   7ADC 21 08 00      [10] 3756 	ld	hl,#8
   7ADF 39            [11] 3757 	add	hl,sp
   7AE0 F9            [ 6] 3758 	ld	sp,hl
   7AE1 D1            [10] 3759 	pop	de
                           3760 ;src/main.c:651: dibujarEnemigo(actual);
   7AE2 D5            [11] 3761 	push	de
   7AE3 D5            [11] 3762 	push	de
   7AE4 CD DD 67      [17] 3763 	call	_dibujarEnemigo
   7AE7 F1            [10] 3764 	pop	af
   7AE8 D1            [10] 3765 	pop	de
                           3766 ;src/main.c:652: ++actual;
   7AE9 21 E2 00      [10] 3767 	ld	hl,#0x00E2
   7AEC 19            [11] 3768 	add	hl,de
   7AED EB            [ 4] 3769 	ex	de,hl
   7AEE C3 F7 79      [10] 3770 	jp	00101$
   7AF1                    3771 00104$:
   7AF1 DD F9         [10] 3772 	ld	sp, ix
   7AF3 DD E1         [14] 3773 	pop	ix
   7AF5 C9            [10] 3774 	ret
                           3775 ;src/main.c:656: void avanzarMapa() {
                           3776 ;	---------------------------------
                           3777 ; Function avanzarMapa
                           3778 ; ---------------------------------
   7AF6                    3779 _avanzarMapa::
                           3780 ;src/main.c:657: if(num_mapa < NUM_MAPAS -1) {
   7AF6 3A 05 65      [13] 3781 	ld	a,(#_num_mapa + 0)
   7AF9 D6 02         [ 7] 3782 	sub	a, #0x02
   7AFB 30 34         [12] 3783 	jr	NC,00102$
                           3784 ;src/main.c:658: mapa = mapas[++num_mapa];
   7AFD 01 21 65      [10] 3785 	ld	bc,#_mapas+0
   7B00 21 05 65      [10] 3786 	ld	hl, #_num_mapa+0
   7B03 34            [11] 3787 	inc	(hl)
   7B04 FD 21 05 65   [14] 3788 	ld	iy,#_num_mapa
   7B08 FD 6E 00      [19] 3789 	ld	l,0 (iy)
   7B0B 26 00         [ 7] 3790 	ld	h,#0x00
   7B0D 29            [11] 3791 	add	hl, hl
   7B0E 09            [11] 3792 	add	hl,bc
   7B0F 7E            [ 7] 3793 	ld	a,(hl)
   7B10 FD 21 03 65   [14] 3794 	ld	iy,#_mapa
   7B14 FD 77 00      [19] 3795 	ld	0 (iy),a
   7B17 23            [ 6] 3796 	inc	hl
   7B18 7E            [ 7] 3797 	ld	a,(hl)
   7B19 32 04 65      [13] 3798 	ld	(#_mapa + 1),a
                           3799 ;src/main.c:659: prota.x = prota.px = 2;
   7B1C 21 27 64      [10] 3800 	ld	hl,#(_prota + 0x0002)
   7B1F 36 02         [10] 3801 	ld	(hl),#0x02
   7B21 21 25 64      [10] 3802 	ld	hl,#_prota
   7B24 36 02         [10] 3803 	ld	(hl),#0x02
                           3804 ;src/main.c:660: prota.mover = SI;
   7B26 21 2B 64      [10] 3805 	ld	hl,#(_prota + 0x0006)
   7B29 36 01         [10] 3806 	ld	(hl),#0x01
                           3807 ;src/main.c:661: dibujarMapa();
   7B2B CD 0B 65      [17] 3808 	call	_dibujarMapa
                           3809 ;src/main.c:662: inicializarEnemy();
   7B2E C3 DF 79      [10] 3810 	jp  _inicializarEnemy
   7B31                    3811 00102$:
                           3812 ;src/main.c:665: menuFin(puntuacion);
   7B31 FD 21 06 65   [14] 3813 	ld	iy,#_puntuacion
   7B35 FD 6E 00      [19] 3814 	ld	l,0 (iy)
   7B38 26 00         [ 7] 3815 	ld	h,#0x00
   7B3A C3 E5 4B      [10] 3816 	jp  _menuFin
                           3817 ;src/main.c:669: void moverIzquierda() {
                           3818 ;	---------------------------------
                           3819 ; Function moverIzquierda
                           3820 ; ---------------------------------
   7B3D                    3821 _moverIzquierda::
                           3822 ;src/main.c:670: prota.mira = M_izquierda;
   7B3D 01 25 64      [10] 3823 	ld	bc,#_prota+0
   7B40 21 2C 64      [10] 3824 	ld	hl,#(_prota + 0x0007)
   7B43 36 01         [10] 3825 	ld	(hl),#0x01
                           3826 ;src/main.c:671: if (!checkCollision(M_izquierda)) {
   7B45 C5            [11] 3827 	push	bc
   7B46 3E 01         [ 7] 3828 	ld	a,#0x01
   7B48 F5            [11] 3829 	push	af
   7B49 33            [ 6] 3830 	inc	sp
   7B4A CD 6C 66      [17] 3831 	call	_checkCollision
   7B4D 33            [ 6] 3832 	inc	sp
   7B4E C1            [10] 3833 	pop	bc
   7B4F 7D            [ 4] 3834 	ld	a,l
   7B50 B7            [ 4] 3835 	or	a, a
   7B51 C0            [11] 3836 	ret	NZ
                           3837 ;src/main.c:672: prota.x--;
   7B52 0A            [ 7] 3838 	ld	a,(bc)
   7B53 C6 FF         [ 7] 3839 	add	a,#0xFF
   7B55 02            [ 7] 3840 	ld	(bc),a
                           3841 ;src/main.c:673: prota.mover = SI;
   7B56 21 2B 64      [10] 3842 	ld	hl,#(_prota + 0x0006)
   7B59 36 01         [10] 3843 	ld	(hl),#0x01
                           3844 ;src/main.c:674: prota.sprite = g_hero_left;
   7B5B 21 C6 3D      [10] 3845 	ld	hl,#_g_hero_left
   7B5E 22 29 64      [16] 3846 	ld	((_prota + 0x0004)), hl
   7B61 C9            [10] 3847 	ret
                           3848 ;src/main.c:678: void moverDerecha() {
                           3849 ;	---------------------------------
                           3850 ; Function moverDerecha
                           3851 ; ---------------------------------
   7B62                    3852 _moverDerecha::
                           3853 ;src/main.c:679: prota.mira = M_derecha;
   7B62 21 2C 64      [10] 3854 	ld	hl,#(_prota + 0x0007)
   7B65 36 00         [10] 3855 	ld	(hl),#0x00
                           3856 ;src/main.c:680: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7B67 AF            [ 4] 3857 	xor	a, a
   7B68 F5            [11] 3858 	push	af
   7B69 33            [ 6] 3859 	inc	sp
   7B6A CD 6C 66      [17] 3860 	call	_checkCollision
   7B6D 33            [ 6] 3861 	inc	sp
   7B6E 45            [ 4] 3862 	ld	b,l
   7B6F 21 25 64      [10] 3863 	ld	hl, #_prota + 0
   7B72 4E            [ 7] 3864 	ld	c,(hl)
   7B73 59            [ 4] 3865 	ld	e,c
   7B74 16 00         [ 7] 3866 	ld	d,#0x00
   7B76 21 07 00      [10] 3867 	ld	hl,#0x0007
   7B79 19            [11] 3868 	add	hl,de
   7B7A 11 50 80      [10] 3869 	ld	de, #0x8050
   7B7D 29            [11] 3870 	add	hl, hl
   7B7E 3F            [ 4] 3871 	ccf
   7B7F CB 1C         [ 8] 3872 	rr	h
   7B81 CB 1D         [ 8] 3873 	rr	l
   7B83 ED 52         [15] 3874 	sbc	hl, de
   7B85 3E 00         [ 7] 3875 	ld	a,#0x00
   7B87 17            [ 4] 3876 	rla
   7B88 5F            [ 4] 3877 	ld	e,a
   7B89 78            [ 4] 3878 	ld	a,b
   7B8A B7            [ 4] 3879 	or	a,a
   7B8B 20 14         [12] 3880 	jr	NZ,00104$
   7B8D B3            [ 4] 3881 	or	a,e
   7B8E 28 11         [12] 3882 	jr	Z,00104$
                           3883 ;src/main.c:681: prota.x++;
   7B90 0C            [ 4] 3884 	inc	c
   7B91 21 25 64      [10] 3885 	ld	hl,#_prota
   7B94 71            [ 7] 3886 	ld	(hl),c
                           3887 ;src/main.c:682: prota.mover = SI;
   7B95 21 2B 64      [10] 3888 	ld	hl,#(_prota + 0x0006)
   7B98 36 01         [10] 3889 	ld	(hl),#0x01
                           3890 ;src/main.c:683: prota.sprite = g_hero;
   7B9A 21 70 3E      [10] 3891 	ld	hl,#_g_hero
   7B9D 22 29 64      [16] 3892 	ld	((_prota + 0x0004)), hl
   7BA0 C9            [10] 3893 	ret
   7BA1                    3894 00104$:
                           3895 ;src/main.c:684: }else if( prota.x + G_HERO_W >= 80){
   7BA1 7B            [ 4] 3896 	ld	a,e
   7BA2 B7            [ 4] 3897 	or	a, a
   7BA3 C0            [11] 3898 	ret	NZ
                           3899 ;src/main.c:685: avanzarMapa();
   7BA4 C3 F6 7A      [10] 3900 	jp  _avanzarMapa
                           3901 ;src/main.c:689: void moverArriba() {
                           3902 ;	---------------------------------
                           3903 ; Function moverArriba
                           3904 ; ---------------------------------
   7BA7                    3905 _moverArriba::
                           3906 ;src/main.c:690: prota.mira = M_arriba;
   7BA7 21 2C 64      [10] 3907 	ld	hl,#(_prota + 0x0007)
   7BAA 36 02         [10] 3908 	ld	(hl),#0x02
                           3909 ;src/main.c:691: if (!checkCollision(M_arriba)) {
   7BAC 3E 02         [ 7] 3910 	ld	a,#0x02
   7BAE F5            [11] 3911 	push	af
   7BAF 33            [ 6] 3912 	inc	sp
   7BB0 CD 6C 66      [17] 3913 	call	_checkCollision
   7BB3 33            [ 6] 3914 	inc	sp
   7BB4 7D            [ 4] 3915 	ld	a,l
   7BB5 B7            [ 4] 3916 	or	a, a
   7BB6 C0            [11] 3917 	ret	NZ
                           3918 ;src/main.c:692: prota.y--;
   7BB7 21 26 64      [10] 3919 	ld	hl,#_prota + 1
   7BBA 4E            [ 7] 3920 	ld	c,(hl)
   7BBB 0D            [ 4] 3921 	dec	c
   7BBC 71            [ 7] 3922 	ld	(hl),c
                           3923 ;src/main.c:693: prota.y--;
   7BBD 0D            [ 4] 3924 	dec	c
   7BBE 71            [ 7] 3925 	ld	(hl),c
                           3926 ;src/main.c:694: prota.mover  = SI;
   7BBF 21 2B 64      [10] 3927 	ld	hl,#(_prota + 0x0006)
   7BC2 36 01         [10] 3928 	ld	(hl),#0x01
                           3929 ;src/main.c:695: prota.sprite = g_hero_up;
   7BC4 21 2C 3D      [10] 3930 	ld	hl,#_g_hero_up
   7BC7 22 29 64      [16] 3931 	ld	((_prota + 0x0004)), hl
   7BCA C9            [10] 3932 	ret
                           3933 ;src/main.c:699: void moverAbajo() {
                           3934 ;	---------------------------------
                           3935 ; Function moverAbajo
                           3936 ; ---------------------------------
   7BCB                    3937 _moverAbajo::
                           3938 ;src/main.c:700: prota.mira = M_abajo;
   7BCB 21 2C 64      [10] 3939 	ld	hl,#(_prota + 0x0007)
   7BCE 36 03         [10] 3940 	ld	(hl),#0x03
                           3941 ;src/main.c:701: if (!checkCollision(M_abajo) ) {
   7BD0 3E 03         [ 7] 3942 	ld	a,#0x03
   7BD2 F5            [11] 3943 	push	af
   7BD3 33            [ 6] 3944 	inc	sp
   7BD4 CD 6C 66      [17] 3945 	call	_checkCollision
   7BD7 33            [ 6] 3946 	inc	sp
   7BD8 7D            [ 4] 3947 	ld	a,l
   7BD9 B7            [ 4] 3948 	or	a, a
   7BDA C0            [11] 3949 	ret	NZ
                           3950 ;src/main.c:702: prota.y++;
   7BDB 01 26 64      [10] 3951 	ld	bc,#_prota + 1
   7BDE 0A            [ 7] 3952 	ld	a,(bc)
   7BDF 3C            [ 4] 3953 	inc	a
   7BE0 02            [ 7] 3954 	ld	(bc),a
                           3955 ;src/main.c:703: prota.y++;
   7BE1 3C            [ 4] 3956 	inc	a
   7BE2 02            [ 7] 3957 	ld	(bc),a
                           3958 ;src/main.c:704: prota.mover  = SI;
   7BE3 21 2B 64      [10] 3959 	ld	hl,#(_prota + 0x0006)
   7BE6 36 01         [10] 3960 	ld	(hl),#0x01
                           3961 ;src/main.c:705: prota.sprite = g_hero_down;
   7BE8 21 92 3C      [10] 3962 	ld	hl,#_g_hero_down
   7BEB 22 29 64      [16] 3963 	ld	((_prota + 0x0004)), hl
   7BEE C9            [10] 3964 	ret
                           3965 ;src/main.c:712: void intHandler() {
                           3966 ;	---------------------------------
                           3967 ; Function intHandler
                           3968 ; ---------------------------------
   7BEF                    3969 _intHandler::
                           3970 ;src/main.c:713: if (++i == 6) {
   7BEF 21 39 64      [10] 3971 	ld	hl, #_i+0
   7BF2 34            [11] 3972 	inc	(hl)
   7BF3 3A 39 64      [13] 3973 	ld	a,(#_i + 0)
   7BF6 D6 06         [ 7] 3974 	sub	a, #0x06
   7BF8 C0            [11] 3975 	ret	NZ
                           3976 ;src/main.c:714: play();
   7BF9 CD 71 53      [17] 3977 	call	_play
                           3978 ;src/main.c:715: i=0;
   7BFC 21 39 64      [10] 3979 	ld	hl,#_i + 0
   7BFF 36 00         [10] 3980 	ld	(hl), #0x00
   7C01 C9            [10] 3981 	ret
                           3982 ;src/main.c:719: void inicializarCPC() {
                           3983 ;	---------------------------------
                           3984 ; Function inicializarCPC
                           3985 ; ---------------------------------
   7C02                    3986 _inicializarCPC::
                           3987 ;src/main.c:720: cpct_disableFirmware();
   7C02 CD 18 57      [17] 3988 	call	_cpct_disableFirmware
                           3989 ;src/main.c:721: cpct_setVideoMode(0);
   7C05 2E 00         [ 7] 3990 	ld	l,#0x00
   7C07 CD EC 56      [17] 3991 	call	_cpct_setVideoMode
                           3992 ;src/main.c:722: cpct_setBorder(HW_BLACK);
   7C0A 21 10 14      [10] 3993 	ld	hl,#0x1410
   7C0D E5            [11] 3994 	push	hl
   7C0E CD 4F 54      [17] 3995 	call	_cpct_setPALColour
                           3996 ;src/main.c:723: cpct_setPalette(g_palette, 16);
   7C11 21 10 00      [10] 3997 	ld	hl,#0x0010
   7C14 E5            [11] 3998 	push	hl
   7C15 21 60 3E      [10] 3999 	ld	hl,#_g_palette
   7C18 E5            [11] 4000 	push	hl
   7C19 CD 2C 54      [17] 4001 	call	_cpct_setPalette
   7C1C C9            [10] 4002 	ret
                           4003 ;src/main.c:728: void inicializarJuego() {
                           4004 ;	---------------------------------
                           4005 ; Function inicializarJuego
                           4006 ; ---------------------------------
   7C1D                    4007 _inicializarJuego::
                           4008 ;src/main.c:730: num_mapa = 0;
   7C1D 21 05 65      [10] 4009 	ld	hl,#_num_mapa + 0
   7C20 36 00         [10] 4010 	ld	(hl), #0x00
                           4011 ;src/main.c:731: mapa = mapas[num_mapa];
   7C22 21 21 65      [10] 4012 	ld	hl, #_mapas + 0
   7C25 7E            [ 7] 4013 	ld	a,(hl)
   7C26 FD 21 03 65   [14] 4014 	ld	iy,#_mapa
   7C2A FD 77 00      [19] 4015 	ld	0 (iy),a
   7C2D 23            [ 6] 4016 	inc	hl
   7C2E 7E            [ 7] 4017 	ld	a,(hl)
   7C2F 32 04 65      [13] 4018 	ld	(#_mapa + 1),a
                           4019 ;src/main.c:732: cpct_etm_setTileset2x4(g_tileset);
   7C32 21 E0 17      [10] 4020 	ld	hl,#_g_tileset
   7C35 CD 40 56      [17] 4021 	call	_cpct_etm_setTileset2x4
                           4022 ;src/main.c:734: dibujarMapa();
   7C38 CD 0B 65      [17] 4023 	call	_dibujarMapa
                           4024 ;src/main.c:737: barraPuntuacionInicial();
   7C3B CD 85 51      [17] 4025 	call	_barraPuntuacionInicial
                           4026 ;src/main.c:740: prota.x = prota.px = 4;
   7C3E 21 27 64      [10] 4027 	ld	hl,#(_prota + 0x0002)
   7C41 36 04         [10] 4028 	ld	(hl),#0x04
   7C43 21 25 64      [10] 4029 	ld	hl,#_prota
   7C46 36 04         [10] 4030 	ld	(hl),#0x04
                           4031 ;src/main.c:741: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7C48 21 28 64      [10] 4032 	ld	hl,#(_prota + 0x0003)
   7C4B 36 68         [10] 4033 	ld	(hl),#0x68
   7C4D 21 26 64      [10] 4034 	ld	hl,#(_prota + 0x0001)
   7C50 36 68         [10] 4035 	ld	(hl),#0x68
                           4036 ;src/main.c:742: prota.mover  = NO;
   7C52 21 2B 64      [10] 4037 	ld	hl,#(_prota + 0x0006)
   7C55 36 00         [10] 4038 	ld	(hl),#0x00
                           4039 ;src/main.c:743: prota.mira=M_derecha;
   7C57 21 2C 64      [10] 4040 	ld	hl,#(_prota + 0x0007)
   7C5A 36 00         [10] 4041 	ld	(hl),#0x00
                           4042 ;src/main.c:744: prota.sprite = g_hero;
   7C5C 21 70 3E      [10] 4043 	ld	hl,#_g_hero
   7C5F 22 29 64      [16] 4044 	ld	((_prota + 0x0004)), hl
                           4045 ;src/main.c:748: cu.x = cu.px = 0;
   7C62 21 2F 64      [10] 4046 	ld	hl,#(_cu + 0x0002)
   7C65 36 00         [10] 4047 	ld	(hl),#0x00
   7C67 21 2D 64      [10] 4048 	ld	hl,#_cu
   7C6A 36 00         [10] 4049 	ld	(hl),#0x00
                           4050 ;src/main.c:749: cu.y = cu.py = 0;
   7C6C 21 30 64      [10] 4051 	ld	hl,#(_cu + 0x0003)
   7C6F 36 00         [10] 4052 	ld	(hl),#0x00
   7C71 21 2E 64      [10] 4053 	ld	hl,#(_cu + 0x0001)
   7C74 36 00         [10] 4054 	ld	(hl),#0x00
                           4055 ;src/main.c:750: cu.lanzado = NO;
   7C76 21 33 64      [10] 4056 	ld	hl,#(_cu + 0x0006)
   7C79 36 00         [10] 4057 	ld	(hl),#0x00
                           4058 ;src/main.c:751: cu.mover = NO;
   7C7B 21 36 64      [10] 4059 	ld	hl,#(_cu + 0x0009)
   7C7E 36 00         [10] 4060 	ld	(hl),#0x00
                           4061 ;src/main.c:752: cu.off_bound = NO;
   7C80 21 37 64      [10] 4062 	ld	hl,#(_cu + 0x000a)
   7C83 36 00         [10] 4063 	ld	(hl),#0x00
                           4064 ;src/main.c:754: inicializarEnemy();
   7C85 CD DF 79      [17] 4065 	call	_inicializarEnemy
                           4066 ;src/main.c:756: dibujarProta();
   7C88 C3 57 65      [10] 4067 	jp  _dibujarProta
                           4068 ;src/main.c:759: void main(void) {
                           4069 ;	---------------------------------
                           4070 ; Function main
                           4071 ; ---------------------------------
   7C8B                    4072 _main::
   7C8B DD E5         [15] 4073 	push	ix
   7C8D DD 21 00 00   [14] 4074 	ld	ix,#0
   7C91 DD 39         [15] 4075 	add	ix,sp
   7C93 21 F9 FF      [10] 4076 	ld	hl,#-7
   7C96 39            [11] 4077 	add	hl,sp
   7C97 F9            [ 6] 4078 	ld	sp,hl
                           4079 ;src/main.c:764: vidas = 6;
   7C98 21 38 64      [10] 4080 	ld	hl,#_vidas + 0
   7C9B 36 06         [10] 4081 	ld	(hl), #0x06
                           4082 ;src/main.c:766: inicializarCPC();
   7C9D CD 02 7C      [17] 4083 	call	_inicializarCPC
                           4084 ;src/main.c:768: menuInicio();
   7CA0 CD A6 50      [17] 4085 	call	_menuInicio
                           4086 ;src/main.c:770: inicializarJuego();
   7CA3 CD 1D 7C      [17] 4087 	call	_inicializarJuego
                           4088 ;src/main.c:774: while (1) {
   7CA6                    4089 00129$:
                           4090 ;src/main.c:776: i = 2 + num_mapa;
   7CA6 21 05 65      [10] 4091 	ld	hl,#_num_mapa + 0
   7CA9 4E            [ 7] 4092 	ld	c, (hl)
   7CAA 0C            [ 4] 4093 	inc	c
   7CAB 0C            [ 4] 4094 	inc	c
                           4095 ;src/main.c:777: actual = enemy;
                           4096 ;src/main.c:779: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7CAC C5            [11] 4097 	push	bc
   7CAD 21 00 01      [10] 4098 	ld	hl,#_g_tablatrans
   7CB0 E5            [11] 4099 	push	hl
   7CB1 2A 03 65      [16] 4100 	ld	hl,(_mapa)
   7CB4 E5            [11] 4101 	push	hl
   7CB5 21 25 64      [10] 4102 	ld	hl,#_prota
   7CB8 E5            [11] 4103 	push	hl
   7CB9 21 2D 64      [10] 4104 	ld	hl,#_cu
   7CBC E5            [11] 4105 	push	hl
   7CBD CD 05 66      [17] 4106 	call	_comprobarTeclado
   7CC0 21 08 00      [10] 4107 	ld	hl,#8
   7CC3 39            [11] 4108 	add	hl,sp
   7CC4 F9            [ 6] 4109 	ld	sp,hl
   7CC5 2A 03 65      [16] 4110 	ld	hl,(_mapa)
   7CC8 E5            [11] 4111 	push	hl
   7CC9 21 2D 64      [10] 4112 	ld	hl,#_cu
   7CCC E5            [11] 4113 	push	hl
   7CCD CD 2A 4A      [17] 4114 	call	_moverCuchillo
   7CD0 F1            [10] 4115 	pop	af
   7CD1 F1            [10] 4116 	pop	af
   7CD2 C1            [10] 4117 	pop	bc
                           4118 ;src/main.c:781: while(i){
   7CD3 DD 71 FB      [19] 4119 	ld	-5 (ix),c
   7CD6 DD 36 FC 9D   [19] 4120 	ld	-4 (ix),#<(_enemy)
   7CDA DD 36 FD 60   [19] 4121 	ld	-3 (ix),#>(_enemy)
   7CDE                    4122 00108$:
   7CDE DD 7E FB      [19] 4123 	ld	a,-5 (ix)
   7CE1 B7            [ 4] 4124 	or	a, a
   7CE2 28 6A         [12] 4125 	jr	Z,00110$
                           4126 ;src/main.c:783: --i;
   7CE4 DD 35 FB      [23] 4127 	dec	-5 (ix)
                           4128 ;src/main.c:784: if(!actual->muerto){
   7CE7 DD 7E FC      [19] 4129 	ld	a,-4 (ix)
   7CEA C6 08         [ 7] 4130 	add	a, #0x08
   7CEC DD 77 FE      [19] 4131 	ld	-2 (ix),a
   7CEF DD 7E FD      [19] 4132 	ld	a,-3 (ix)
   7CF2 CE 00         [ 7] 4133 	adc	a, #0x00
   7CF4 DD 77 FF      [19] 4134 	ld	-1 (ix),a
   7CF7 DD 6E FE      [19] 4135 	ld	l,-2 (ix)
   7CFA DD 66 FF      [19] 4136 	ld	h,-1 (ix)
   7CFD 7E            [ 7] 4137 	ld	a,(hl)
   7CFE B7            [ 4] 4138 	or	a, a
   7CFF 20 12         [12] 4139 	jr	NZ,00102$
                           4140 ;src/main.c:785: checkEnemyDead(cu.direccion, actual);
   7D01 21 34 64      [10] 4141 	ld	hl, #_cu + 7
   7D04 46            [ 7] 4142 	ld	b,(hl)
   7D05 DD 6E FC      [19] 4143 	ld	l,-4 (ix)
   7D08 DD 66 FD      [19] 4144 	ld	h,-3 (ix)
   7D0B E5            [11] 4145 	push	hl
   7D0C C5            [11] 4146 	push	bc
   7D0D 33            [ 6] 4147 	inc	sp
   7D0E CD 66 69      [17] 4148 	call	_checkEnemyDead
   7D11 F1            [10] 4149 	pop	af
   7D12 33            [ 6] 4150 	inc	sp
   7D13                    4151 00102$:
                           4152 ;src/main.c:787: if(!actual->muerto){
   7D13 DD 6E FE      [19] 4153 	ld	l,-2 (ix)
   7D16 DD 66 FF      [19] 4154 	ld	h,-1 (ix)
   7D19 7E            [ 7] 4155 	ld	a,(hl)
   7D1A B7            [ 4] 4156 	or	a, a
   7D1B 20 1F         [12] 4157 	jr	NZ,00107$
                           4158 ;src/main.c:788: if (!actual->didDamage)
   7D1D DD 7E FC      [19] 4159 	ld	a,-4 (ix)
   7D20 C6 16         [ 7] 4160 	add	a, #0x16
   7D22 4F            [ 4] 4161 	ld	c,a
   7D23 DD 7E FD      [19] 4162 	ld	a,-3 (ix)
   7D26 CE 00         [ 7] 4163 	adc	a, #0x00
   7D28 47            [ 4] 4164 	ld	b,a
   7D29 0A            [ 7] 4165 	ld	a,(bc)
   7D2A B7            [ 4] 4166 	or	a, a
   7D2B 20 0D         [12] 4167 	jr	NZ,00104$
                           4168 ;src/main.c:789: updateEnemy(actual);
   7D2D DD 6E FC      [19] 4169 	ld	l,-4 (ix)
   7D30 DD 66 FD      [19] 4170 	ld	h,-3 (ix)
   7D33 E5            [11] 4171 	push	hl
   7D34 CD 83 78      [17] 4172 	call	_updateEnemy
   7D37 F1            [10] 4173 	pop	af
   7D38 18 02         [12] 4174 	jr	00107$
   7D3A                    4175 00104$:
                           4176 ;src/main.c:791: actual->didDamage = 0;
   7D3A AF            [ 4] 4177 	xor	a, a
   7D3B 02            [ 7] 4178 	ld	(bc),a
   7D3C                    4179 00107$:
                           4180 ;src/main.c:793: ++actual;
   7D3C DD 7E FC      [19] 4181 	ld	a,-4 (ix)
   7D3F C6 E2         [ 7] 4182 	add	a, #0xE2
   7D41 DD 77 FC      [19] 4183 	ld	-4 (ix),a
   7D44 DD 7E FD      [19] 4184 	ld	a,-3 (ix)
   7D47 CE 00         [ 7] 4185 	adc	a, #0x00
   7D49 DD 77 FD      [19] 4186 	ld	-3 (ix),a
   7D4C 18 90         [12] 4187 	jr	00108$
   7D4E                    4188 00110$:
                           4189 ;src/main.c:796: cpct_waitVSYNC();
   7D4E CD E4 56      [17] 4190 	call	_cpct_waitVSYNC
                           4191 ;src/main.c:799: if (prota.mover) {
   7D51 01 2B 64      [10] 4192 	ld	bc,#_prota + 6
   7D54 0A            [ 7] 4193 	ld	a,(bc)
   7D55 B7            [ 4] 4194 	or	a, a
   7D56 28 07         [12] 4195 	jr	Z,00112$
                           4196 ;src/main.c:800: redibujarProta();
   7D58 C5            [11] 4197 	push	bc
   7D59 CD F1 65      [17] 4198 	call	_redibujarProta
   7D5C C1            [10] 4199 	pop	bc
                           4200 ;src/main.c:801: prota.mover = NO;
   7D5D AF            [ 4] 4201 	xor	a, a
   7D5E 02            [ 7] 4202 	ld	(bc),a
   7D5F                    4203 00112$:
                           4204 ;src/main.c:803: if(cu.lanzado && cu.mover){
   7D5F 21 33 64      [10] 4205 	ld	hl, #(_cu + 0x0006) + 0
   7D62 4E            [ 7] 4206 	ld	c,(hl)
                           4207 ;src/main.c:804: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4208 ;src/main.c:803: if(cu.lanzado && cu.mover){
   7D63 79            [ 4] 4209 	ld	a,c
   7D64 B7            [ 4] 4210 	or	a, a
   7D65 28 30         [12] 4211 	jr	Z,00117$
   7D67 3A 36 64      [13] 4212 	ld	a, (#(_cu + 0x0009) + 0)
   7D6A B7            [ 4] 4213 	or	a, a
   7D6B 28 2A         [12] 4214 	jr	Z,00117$
                           4215 ;src/main.c:804: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7D6D 21 2E 64      [10] 4216 	ld	hl, #(_cu + 0x0001) + 0
   7D70 4E            [ 7] 4217 	ld	c,(hl)
   7D71 21 2D 64      [10] 4218 	ld	hl, #_cu + 0
   7D74 46            [ 7] 4219 	ld	b,(hl)
   7D75 21 35 64      [10] 4220 	ld	hl, #(_cu + 0x0008) + 0
   7D78 5E            [ 7] 4221 	ld	e,(hl)
   7D79 2A 03 65      [16] 4222 	ld	hl,(_mapa)
   7D7C E5            [11] 4223 	push	hl
   7D7D 21 00 01      [10] 4224 	ld	hl,#_g_tablatrans
   7D80 E5            [11] 4225 	push	hl
   7D81 21 2D 64      [10] 4226 	ld	hl,#_cu
   7D84 E5            [11] 4227 	push	hl
   7D85 79            [ 4] 4228 	ld	a,c
   7D86 F5            [11] 4229 	push	af
   7D87 33            [ 6] 4230 	inc	sp
   7D88 C5            [11] 4231 	push	bc
   7D89 33            [ 6] 4232 	inc	sp
   7D8A 7B            [ 4] 4233 	ld	a,e
   7D8B F5            [11] 4234 	push	af
   7D8C 33            [ 6] 4235 	inc	sp
   7D8D CD 4A 47      [17] 4236 	call	_redibujarCuchillo
   7D90 21 09 00      [10] 4237 	ld	hl,#9
   7D93 39            [11] 4238 	add	hl,sp
   7D94 F9            [ 6] 4239 	ld	sp,hl
   7D95 18 28         [12] 4240 	jr	00118$
   7D97                    4241 00117$:
                           4242 ;src/main.c:805: }else if (cu.lanzado && !cu.mover){
   7D97 79            [ 4] 4243 	ld	a,c
   7D98 B7            [ 4] 4244 	or	a, a
   7D99 28 24         [12] 4245 	jr	Z,00118$
   7D9B 3A 36 64      [13] 4246 	ld	a, (#(_cu + 0x0009) + 0)
   7D9E B7            [ 4] 4247 	or	a, a
   7D9F 20 1E         [12] 4248 	jr	NZ,00118$
                           4249 ;src/main.c:806: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7DA1 21 2E 64      [10] 4250 	ld	hl, #(_cu + 0x0001) + 0
   7DA4 46            [ 7] 4251 	ld	b,(hl)
   7DA5 21 2D 64      [10] 4252 	ld	hl, #_cu + 0
   7DA8 4E            [ 7] 4253 	ld	c,(hl)
   7DA9 21 35 64      [10] 4254 	ld	hl, #(_cu + 0x0008) + 0
   7DAC 56            [ 7] 4255 	ld	d,(hl)
   7DAD 2A 03 65      [16] 4256 	ld	hl,(_mapa)
   7DB0 E5            [11] 4257 	push	hl
   7DB1 C5            [11] 4258 	push	bc
   7DB2 D5            [11] 4259 	push	de
   7DB3 33            [ 6] 4260 	inc	sp
   7DB4 CD B7 46      [17] 4261 	call	_borrarCuchillo
   7DB7 F1            [10] 4262 	pop	af
   7DB8 F1            [10] 4263 	pop	af
   7DB9 33            [ 6] 4264 	inc	sp
                           4265 ;src/main.c:807: cu.lanzado = NO;
   7DBA 21 33 64      [10] 4266 	ld	hl,#(_cu + 0x0006)
   7DBD 36 00         [10] 4267 	ld	(hl),#0x00
   7DBF                    4268 00118$:
                           4269 ;src/main.c:810: i = 2 + num_mapa;
   7DBF 3A 05 65      [13] 4270 	ld	a,(#_num_mapa + 0)
   7DC2 C6 02         [ 7] 4271 	add	a, #0x02
   7DC4 DD 77 FE      [19] 4272 	ld	-2 (ix),a
                           4273 ;src/main.c:811: actual = enemy;
   7DC7 01 9D 60      [10] 4274 	ld	bc,#_enemy
                           4275 ;src/main.c:812: while(i){
   7DCA                    4276 00125$:
   7DCA DD 7E FE      [19] 4277 	ld	a,-2 (ix)
   7DCD B7            [ 4] 4278 	or	a, a
   7DCE CA 7D 7E      [10] 4279 	jp	Z,00127$
                           4280 ;src/main.c:814: --i;
   7DD1 DD 35 FE      [23] 4281 	dec	-2 (ix)
                           4282 ;src/main.c:815: if(actual->mover){
   7DD4 21 06 00      [10] 4283 	ld	hl,#0x0006
   7DD7 09            [11] 4284 	add	hl,bc
   7DD8 DD 75 FC      [19] 4285 	ld	-4 (ix),l
   7DDB DD 74 FD      [19] 4286 	ld	-3 (ix),h
   7DDE DD 6E FC      [19] 4287 	ld	l,-4 (ix)
   7DE1 DD 66 FD      [19] 4288 	ld	h,-3 (ix)
   7DE4 7E            [ 7] 4289 	ld	a,(hl)
   7DE5 B7            [ 4] 4290 	or	a, a
   7DE6 28 18         [12] 4291 	jr	Z,00121$
                           4292 ;src/main.c:816: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7DE8 69            [ 4] 4293 	ld	l, c
   7DE9 60            [ 4] 4294 	ld	h, b
   7DEA 23            [ 6] 4295 	inc	hl
   7DEB 23            [ 6] 4296 	inc	hl
   7DEC 23            [ 6] 4297 	inc	hl
   7DED 5E            [ 7] 4298 	ld	e,(hl)
   7DEE 69            [ 4] 4299 	ld	l, c
   7DEF 60            [ 4] 4300 	ld	h, b
   7DF0 23            [ 6] 4301 	inc	hl
   7DF1 23            [ 6] 4302 	inc	hl
   7DF2 56            [ 7] 4303 	ld	d,(hl)
   7DF3 C5            [11] 4304 	push	bc
   7DF4 C5            [11] 4305 	push	bc
   7DF5 7B            [ 4] 4306 	ld	a,e
   7DF6 F5            [11] 4307 	push	af
   7DF7 33            [ 6] 4308 	inc	sp
   7DF8 D5            [11] 4309 	push	de
   7DF9 33            [ 6] 4310 	inc	sp
   7DFA CD 35 69      [17] 4311 	call	_redibujarEnemigo
   7DFD F1            [10] 4312 	pop	af
   7DFE F1            [10] 4313 	pop	af
   7DFF C1            [10] 4314 	pop	bc
   7E00                    4315 00121$:
                           4316 ;src/main.c:819: if (actual->muerto && actual->muertes == 0){
   7E00 C5            [11] 4317 	push	bc
   7E01 FD E1         [14] 4318 	pop	iy
   7E03 FD 7E 08      [19] 4319 	ld	a,8 (iy)
   7E06 B7            [ 4] 4320 	or	a, a
   7E07 28 6B         [12] 4321 	jr	Z,00123$
   7E09 21 09 00      [10] 4322 	ld	hl,#0x0009
   7E0C 09            [11] 4323 	add	hl,bc
   7E0D EB            [ 4] 4324 	ex	de,hl
   7E0E 1A            [ 7] 4325 	ld	a,(de)
   7E0F B7            [ 4] 4326 	or	a, a
   7E10 20 62         [12] 4327 	jr	NZ,00123$
                           4328 ;src/main.c:820: borrarEnemigo((*actual).x, (*actual).y);
   7E12 21 01 00      [10] 4329 	ld	hl,#0x0001
   7E15 09            [11] 4330 	add	hl,bc
   7E16 E3            [19] 4331 	ex	(sp), hl
   7E17 E1            [10] 4332 	pop	hl
   7E18 E5            [11] 4333 	push	hl
   7E19 7E            [ 7] 4334 	ld	a,(hl)
   7E1A F5            [11] 4335 	push	af
   7E1B 0A            [ 7] 4336 	ld	a,(bc)
   7E1C DD 77 FB      [19] 4337 	ld	-5 (ix),a
   7E1F F1            [10] 4338 	pop	af
   7E20 C5            [11] 4339 	push	bc
   7E21 D5            [11] 4340 	push	de
   7E22 F5            [11] 4341 	push	af
   7E23 33            [ 6] 4342 	inc	sp
   7E24 DD 7E FB      [19] 4343 	ld	a,-5 (ix)
   7E27 F5            [11] 4344 	push	af
   7E28 33            [ 6] 4345 	inc	sp
   7E29 CD C5 68      [17] 4346 	call	_borrarEnemigo
   7E2C F1            [10] 4347 	pop	af
   7E2D D1            [10] 4348 	pop	de
   7E2E C1            [10] 4349 	pop	bc
                           4350 ;src/main.c:821: dibujarExplosion(actual);
   7E2F C5            [11] 4351 	push	bc
   7E30 D5            [11] 4352 	push	de
   7E31 C5            [11] 4353 	push	bc
   7E32 CD 15 68      [17] 4354 	call	_dibujarExplosion
   7E35 F1            [10] 4355 	pop	af
   7E36 D1            [10] 4356 	pop	de
   7E37 C1            [10] 4357 	pop	bc
                           4358 ;src/main.c:822: puntuacion_aux = puntuacion;
   7E38 FD 21 06 65   [14] 4359 	ld	iy,#_puntuacion
   7E3C FD 6E 00      [19] 4360 	ld	l,0 (iy)
   7E3F 26 00         [ 7] 4361 	ld	h,#0x00
                           4362 ;src/main.c:823: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7E41 C5            [11] 4363 	push	bc
   7E42 D5            [11] 4364 	push	de
   7E43 E5            [11] 4365 	push	hl
   7E44 CD 5E 53      [17] 4366 	call	_aumentarPuntuacion
   7E47 F1            [10] 4367 	pop	af
   7E48 D1            [10] 4368 	pop	de
   7E49 C1            [10] 4369 	pop	bc
   7E4A FD 21 06 65   [14] 4370 	ld	iy,#_puntuacion
   7E4E FD 75 00      [19] 4371 	ld	0 (iy),l
                           4372 ;src/main.c:824: modificarPuntuacion(puntuacion);
   7E51 FD 21 06 65   [14] 4373 	ld	iy,#_puntuacion
   7E55 FD 6E 00      [19] 4374 	ld	l,0 (iy)
   7E58 26 00         [ 7] 4375 	ld	h,#0x00
   7E5A C5            [11] 4376 	push	bc
   7E5B D5            [11] 4377 	push	de
   7E5C E5            [11] 4378 	push	hl
   7E5D CD 21 52      [17] 4379 	call	_modificarPuntuacion
   7E60 F1            [10] 4380 	pop	af
   7E61 D1            [10] 4381 	pop	de
   7E62 C1            [10] 4382 	pop	bc
                           4383 ;src/main.c:825: actual->mover = NO;
   7E63 DD 6E FC      [19] 4384 	ld	l,-4 (ix)
   7E66 DD 66 FD      [19] 4385 	ld	h,-3 (ix)
   7E69 36 00         [10] 4386 	ld	(hl),#0x00
                           4387 ;src/main.c:826: actual->muertes++;
   7E6B 1A            [ 7] 4388 	ld	a,(de)
   7E6C 3C            [ 4] 4389 	inc	a
   7E6D 12            [ 7] 4390 	ld	(de),a
                           4391 ;src/main.c:827: actual->x = 0;
   7E6E AF            [ 4] 4392 	xor	a, a
   7E6F 02            [ 7] 4393 	ld	(bc),a
                           4394 ;src/main.c:828: actual->y = 0;
   7E70 E1            [10] 4395 	pop	hl
   7E71 E5            [11] 4396 	push	hl
   7E72 36 00         [10] 4397 	ld	(hl),#0x00
   7E74                    4398 00123$:
                           4399 ;src/main.c:830: ++actual;
   7E74 21 E2 00      [10] 4400 	ld	hl,#0x00E2
   7E77 09            [11] 4401 	add	hl,bc
   7E78 4D            [ 4] 4402 	ld	c,l
   7E79 44            [ 4] 4403 	ld	b,h
   7E7A C3 CA 7D      [10] 4404 	jp	00125$
   7E7D                    4405 00127$:
                           4406 ;src/main.c:832: cpct_waitVSYNC();
   7E7D CD E4 56      [17] 4407 	call	_cpct_waitVSYNC
   7E80 C3 A6 7C      [10] 4408 	jp	00129$
                           4409 	.area _CODE
                           4410 	.area _INITIALIZER
   6507                    4411 __xinit__mapa:
   6507 00 00              4412 	.dw #0x0000
   6509                    4413 __xinit__num_mapa:
   6509 00                 4414 	.db #0x00	; 0
   650A                    4415 __xinit__puntuacion:
   650A 00                 4416 	.db #0x00	; 0
                           4417 	.area _CABS (ABS)
