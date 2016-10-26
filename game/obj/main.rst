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
   6616 C2 E5 7B      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6619 21 00 02      [10]  382 	ld	hl,#0x0200
   661C CD 43 54      [17]  383 	call	_cpct_isKeyPressed
   661F 7D            [ 4]  384 	ld	a,l
   6620 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   6621 C2 0A 7C      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6624 21 00 01      [10]  389 	ld	hl,#0x0100
   6627 CD 43 54      [17]  390 	call	_cpct_isKeyPressed
   662A 7D            [ 4]  391 	ld	a,l
   662B B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   662C C2 4F 7C      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   662F 21 00 04      [10]  396 	ld	hl,#0x0400
   6632 CD 43 54      [17]  397 	call	_cpct_isKeyPressed
   6635 7D            [ 4]  398 	ld	a,l
   6636 B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   6637 C2 73 7C      [10]  401 	jp	NZ,_moverAbajo
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
   6BD0 21 0C 00      [10] 1410 	ld	hl,#0x000C
   6BD3 09            [11] 1411 	add	hl,bc
   6BD4 DD 75 FE      [19] 1412 	ld	-2 (ix),l
   6BD7 DD 74 FF      [19] 1413 	ld	-1 (ix),h
   6BDA DD 6E FE      [19] 1414 	ld	l,-2 (ix)
   6BDD DD 66 FF      [19] 1415 	ld	h,-1 (ix)
   6BE0 7E            [ 7] 1416 	ld	a,(hl)
   6BE1 DD 77 FD      [19] 1417 	ld	-3 (ix),a
                           1418 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6BE4 21 0E 00      [10] 1419 	ld	hl,#0x000E
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
   6E56 21 12 00      [10] 1800 	ld	hl,#0x0012
   6E59 19            [11] 1801 	add	hl,de
   6E5A DD 75 FE      [19] 1802 	ld	-2 (ix),l
   6E5D DD 74 FF      [19] 1803 	ld	-1 (ix),h
   6E60 DD 6E FE      [19] 1804 	ld	l,-2 (ix)
   6E63 DD 66 FF      [19] 1805 	ld	h,-1 (ix)
   6E66 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:361: enemy->in_range = NO;
   6E68 21 11 00      [10] 1808 	ld	hl,#0x0011
   6E6B 19            [11] 1809 	add	hl,de
   6E6C 4D            [ 4] 1810 	ld	c,l
   6E6D 44            [ 4] 1811 	ld	b,h
   6E6E AF            [ 4] 1812 	xor	a, a
   6E6F 02            [ 7] 1813 	ld	(bc),a
                           1814 ;src/main.c:363: if(!enemy->seek){
   6E70 D5            [11] 1815 	push	de
   6E71 FD E1         [14] 1816 	pop	iy
   6E73 FD 7E 14      [19] 1817 	ld	a,20 (iy)
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
   6E84 21 16 00      [10] 1828 	ld	hl,#0x0016
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
   6F1F 21 0E 00      [10] 1928 	ld	hl,#0x000E
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
   6FEC 21 14 00      [10] 2060 	ld	hl,#0x0014
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
   6FFE 11 12 00      [10] 2075 	ld	de, #0x0012
   7001 19            [11] 2076 	add	hl, de
   7002 7E            [ 7] 2077 	ld	a,(hl)
   7003 DD 77 FD      [19] 2078 	ld	-3 (ix),a
                           2079 ;src/main.c:406: actual->patrolling = 1;
   7006 21 0B 00      [10] 2080 	ld	hl,#0x000B
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
   705D FD 7E 16      [19] 2128 	ld	a,22 (iy)
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
   70AF 21 ED FF      [10] 2183 	ld	hl,#-19
   70B2 39            [11] 2184 	add	hl,sp
   70B3 F9            [ 6] 2185 	ld	sp,hl
                           2186 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70B4 DD 7E 04      [19] 2187 	ld	a,4 (ix)
   70B7 DD 77 F1      [19] 2188 	ld	-15 (ix),a
   70BA DD 7E 05      [19] 2189 	ld	a,5 (ix)
   70BD DD 77 F2      [19] 2190 	ld	-14 (ix),a
   70C0 DD 6E F1      [19] 2191 	ld	l,-15 (ix)
   70C3 DD 66 F2      [19] 2192 	ld	h,-14 (ix)
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
   70DB DD 7E F1      [19] 2209 	ld	a,-15 (ix)
   70DE C6 01         [ 7] 2210 	add	a, #0x01
   70E0 DD 77 F3      [19] 2211 	ld	-13 (ix),a
   70E3 DD 7E F2      [19] 2212 	ld	a,-14 (ix)
   70E6 CE 00         [ 7] 2213 	adc	a, #0x00
   70E8 DD 77 F4      [19] 2214 	ld	-12 (ix),a
   70EB DD 6E F3      [19] 2215 	ld	l,-13 (ix)
   70EE DD 66 F4      [19] 2216 	ld	h,-12 (ix)
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
   7108 DD 75 ED      [19] 2235 	ld	-19 (ix),l
                           2236 ;src/main.c:426: u8 movX = 0;
   710B DD 36 F0 00   [19] 2237 	ld	-16 (ix),#0x00
                           2238 ;src/main.c:427: u8 movY = 0;
   710F DD 36 EF 00   [19] 2239 	ld	-17 (ix),#0x00
                           2240 ;src/main.c:428: u8 distConstraint = 25;
   7113 DD 36 EE 19   [19] 2241 	ld	-18 (ix),#0x19
                           2242 ;src/main.c:429: enemy->mover = NO;
   7117 DD 7E F1      [19] 2243 	ld	a,-15 (ix)
   711A C6 06         [ 7] 2244 	add	a, #0x06
   711C DD 77 F5      [19] 2245 	ld	-11 (ix),a
   711F DD 7E F2      [19] 2246 	ld	a,-14 (ix)
   7122 CE 00         [ 7] 2247 	adc	a, #0x00
   7124 DD 77 F6      [19] 2248 	ld	-10 (ix),a
   7127 DD 6E F5      [19] 2249 	ld	l,-11 (ix)
   712A DD 66 F6      [19] 2250 	ld	h,-10 (ix)
   712D 36 00         [10] 2251 	ld	(hl),#0x00
                           2252 ;src/main.c:438: enemy->patrolling = 1;
   712F DD 7E F1      [19] 2253 	ld	a,-15 (ix)
   7132 C6 0B         [ 7] 2254 	add	a, #0x0B
   7134 4F            [ 4] 2255 	ld	c,a
   7135 DD 7E F2      [19] 2256 	ld	a,-14 (ix)
   7138 CE 00         [ 7] 2257 	adc	a, #0x00
   713A 47            [ 4] 2258 	ld	b,a
                           2259 ;src/main.c:431: if (dist < 20) {
   713B DD 7E ED      [19] 2260 	ld	a,-19 (ix)
   713E D6 14         [ 7] 2261 	sub	a, #0x14
   7140 30 29         [12] 2262 	jr	NC,00104$
                           2263 ;src/main.c:432: vidas--;
   7142 21 38 64      [10] 2264 	ld	hl, #_vidas+0
   7145 35            [11] 2265 	dec	(hl)
                           2266 ;src/main.c:433: if (vidas == 1) {
   7146 3A 38 64      [13] 2267 	ld	a,(#_vidas + 0)
   7149 3D            [ 4] 2268 	dec	a
   714A 20 0E         [12] 2269 	jr	NZ,00102$
                           2270 ;src/main.c:434: menuFin(puntuacion);
   714C FD 21 06 65   [14] 2271 	ld	iy,#_puntuacion
   7150 FD 6E 00      [19] 2272 	ld	l,0 (iy)
   7153 26 00         [ 7] 2273 	ld	h,#0x00
   7155 C5            [11] 2274 	push	bc
   7156 CD E5 4B      [17] 2275 	call	_menuFin
   7159 C1            [10] 2276 	pop	bc
   715A                    2277 00102$:
                           2278 ;src/main.c:438: enemy->patrolling = 1;
   715A 3E 01         [ 7] 2279 	ld	a,#0x01
   715C 02            [ 7] 2280 	ld	(bc),a
                           2281 ;src/main.c:439: enemy->engage = 0;
   715D DD 7E F1      [19] 2282 	ld	a,-15 (ix)
   7160 C6 16         [ 7] 2283 	add	a, #0x16
   7162 5F            [ 4] 2284 	ld	e,a
   7163 DD 7E F2      [19] 2285 	ld	a,-14 (ix)
   7166 CE 00         [ 7] 2286 	adc	a, #0x00
   7168 57            [ 4] 2287 	ld	d,a
   7169 AF            [ 4] 2288 	xor	a, a
   716A 12            [ 7] 2289 	ld	(de),a
   716B                    2290 00104$:
                           2291 ;src/main.c:442: if (!enemy->patrolling) {
   716B 0A            [ 7] 2292 	ld	a,(bc)
   716C DD 77 F7      [19] 2293 	ld	-9 (ix), a
   716F B7            [ 4] 2294 	or	a, a
   7170 C2 27 79      [10] 2295 	jp	NZ,00205$
                           2296 ;src/main.c:443: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7173 DD 6E F3      [19] 2297 	ld	l,-13 (ix)
   7176 DD 66 F4      [19] 2298 	ld	h,-12 (ix)
   7179 7E            [ 7] 2299 	ld	a,(hl)
   717A DD 77 F7      [19] 2300 	ld	-9 (ix),a
                           2301 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   717D DD 6E F1      [19] 2302 	ld	l,-15 (ix)
   7180 DD 66 F2      [19] 2303 	ld	h,-14 (ix)
   7183 7E            [ 7] 2304 	ld	a,(hl)
                           2305 ;src/main.c:456: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7184 DD 77 F8      [19] 2306 	ld	-8 (ix), a
   7187 C6 04         [ 7] 2307 	add	a, #0x04
   7189 DD 77 F9      [19] 2308 	ld	-7 (ix),a
                           2309 ;src/main.c:443: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   718C DD 7E F7      [19] 2310 	ld	a,-9 (ix)
   718F DD 96 07      [19] 2311 	sub	a, 7 (ix)
   7192 28 2B         [12] 2312 	jr	Z,00198$
   7194 DD 4E 07      [19] 2313 	ld	c,7 (ix)
   7197 06 00         [ 7] 2314 	ld	b,#0x00
   7199 21 01 00      [10] 2315 	ld	hl,#0x0001
   719C 09            [11] 2316 	add	hl,bc
   719D DD 75 FA      [19] 2317 	ld	-6 (ix),l
   71A0 DD 74 FB      [19] 2318 	ld	-5 (ix),h
   71A3 DD 5E F7      [19] 2319 	ld	e,-9 (ix)
   71A6 16 00         [ 7] 2320 	ld	d,#0x00
   71A8 7B            [ 4] 2321 	ld	a,e
   71A9 DD 96 FA      [19] 2322 	sub	a, -6 (ix)
   71AC 20 06         [12] 2323 	jr	NZ,00442$
   71AE 7A            [ 4] 2324 	ld	a,d
   71AF DD 96 FB      [19] 2325 	sub	a, -5 (ix)
   71B2 28 0B         [12] 2326 	jr	Z,00198$
   71B4                    2327 00442$:
   71B4 0B            [ 6] 2328 	dec	bc
   71B5 7B            [ 4] 2329 	ld	a,e
   71B6 91            [ 4] 2330 	sub	a, c
   71B7 C2 C3 72      [10] 2331 	jp	NZ,00199$
   71BA 7A            [ 4] 2332 	ld	a,d
   71BB 90            [ 4] 2333 	sub	a, b
   71BC C2 C3 72      [10] 2334 	jp	NZ,00199$
   71BF                    2335 00198$:
                           2336 ;src/main.c:444: if (dx < enemy->x) { // izquierda
   71BF DD 7E 06      [19] 2337 	ld	a,6 (ix)
   71C2 DD 96 F8      [19] 2338 	sub	a, -8 (ix)
   71C5 30 79         [12] 2339 	jr	NC,00118$
                           2340 ;src/main.c:445: if (dist > 11) {
   71C7 3E 0B         [ 7] 2341 	ld	a,#0x0B
   71C9 DD 96 ED      [19] 2342 	sub	a, -19 (ix)
   71CC D2 27 79      [10] 2343 	jp	NC,00205$
                           2344 ;src/main.c:446: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   71CF DD 66 F7      [19] 2345 	ld	h,-9 (ix)
   71D2 DD 6E F8      [19] 2346 	ld	l,-8 (ix)
   71D5 E5            [11] 2347 	push	hl
   71D6 2A 03 65      [16] 2348 	ld	hl,(_mapa)
   71D9 E5            [11] 2349 	push	hl
   71DA CD 61 4B      [17] 2350 	call	_getTilePtr
   71DD F1            [10] 2351 	pop	af
   71DE F1            [10] 2352 	pop	af
   71DF 4E            [ 7] 2353 	ld	c,(hl)
   71E0 3E 02         [ 7] 2354 	ld	a,#0x02
   71E2 91            [ 4] 2355 	sub	a, c
   71E3 DA 27 79      [10] 2356 	jp	C,00205$
                           2357 ;src/main.c:447: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   71E6 DD 6E F3      [19] 2358 	ld	l,-13 (ix)
   71E9 DD 66 F4      [19] 2359 	ld	h,-12 (ix)
   71EC 7E            [ 7] 2360 	ld	a,(hl)
   71ED C6 0B         [ 7] 2361 	add	a, #0x0B
   71EF 47            [ 4] 2362 	ld	b,a
   71F0 DD 6E F1      [19] 2363 	ld	l,-15 (ix)
   71F3 DD 66 F2      [19] 2364 	ld	h,-14 (ix)
   71F6 4E            [ 7] 2365 	ld	c, (hl)
   71F7 C5            [11] 2366 	push	bc
   71F8 2A 03 65      [16] 2367 	ld	hl,(_mapa)
   71FB E5            [11] 2368 	push	hl
   71FC CD 61 4B      [17] 2369 	call	_getTilePtr
   71FF F1            [10] 2370 	pop	af
   7200 F1            [10] 2371 	pop	af
   7201 4E            [ 7] 2372 	ld	c,(hl)
   7202 3E 02         [ 7] 2373 	ld	a,#0x02
   7204 91            [ 4] 2374 	sub	a, c
   7205 DA 27 79      [10] 2375 	jp	C,00205$
                           2376 ;src/main.c:448: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7208 DD 6E F3      [19] 2377 	ld	l,-13 (ix)
   720B DD 66 F4      [19] 2378 	ld	h,-12 (ix)
   720E 7E            [ 7] 2379 	ld	a,(hl)
   720F C6 16         [ 7] 2380 	add	a, #0x16
   7211 47            [ 4] 2381 	ld	b,a
   7212 DD 6E F1      [19] 2382 	ld	l,-15 (ix)
   7215 DD 66 F2      [19] 2383 	ld	h,-14 (ix)
   7218 4E            [ 7] 2384 	ld	c, (hl)
   7219 C5            [11] 2385 	push	bc
   721A 2A 03 65      [16] 2386 	ld	hl,(_mapa)
   721D E5            [11] 2387 	push	hl
   721E CD 61 4B      [17] 2388 	call	_getTilePtr
   7221 F1            [10] 2389 	pop	af
   7222 F1            [10] 2390 	pop	af
   7223 4E            [ 7] 2391 	ld	c,(hl)
   7224 3E 02         [ 7] 2392 	ld	a,#0x02
   7226 91            [ 4] 2393 	sub	a, c
   7227 DA 27 79      [10] 2394 	jp	C,00205$
                           2395 ;src/main.c:449: moverEnemigoIzquierda(enemy);
   722A DD 6E F1      [19] 2396 	ld	l,-15 (ix)
   722D DD 66 F2      [19] 2397 	ld	h,-14 (ix)
   7230 E5            [11] 2398 	push	hl
   7231 CD A1 6B      [17] 2399 	call	_moverEnemigoIzquierda
   7234 F1            [10] 2400 	pop	af
                           2401 ;src/main.c:451: enemy->mover = SI;
   7235 DD 6E F5      [19] 2402 	ld	l,-11 (ix)
   7238 DD 66 F6      [19] 2403 	ld	h,-10 (ix)
   723B 36 01         [10] 2404 	ld	(hl),#0x01
   723D C3 27 79      [10] 2405 	jp	00205$
   7240                    2406 00118$:
                           2407 ;src/main.c:455: if (dist > G_ENEMY_W + 3) {
   7240 3E 07         [ 7] 2408 	ld	a,#0x07
   7242 DD 96 ED      [19] 2409 	sub	a, -19 (ix)
   7245 D2 27 79      [10] 2410 	jp	NC,00205$
                           2411 ;src/main.c:456: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7248 DD 66 F7      [19] 2412 	ld	h,-9 (ix)
   724B DD 6E F9      [19] 2413 	ld	l,-7 (ix)
   724E E5            [11] 2414 	push	hl
   724F 2A 03 65      [16] 2415 	ld	hl,(_mapa)
   7252 E5            [11] 2416 	push	hl
   7253 CD 61 4B      [17] 2417 	call	_getTilePtr
   7256 F1            [10] 2418 	pop	af
   7257 F1            [10] 2419 	pop	af
   7258 4E            [ 7] 2420 	ld	c,(hl)
   7259 3E 02         [ 7] 2421 	ld	a,#0x02
   725B 91            [ 4] 2422 	sub	a, c
   725C DA 27 79      [10] 2423 	jp	C,00205$
                           2424 ;src/main.c:457: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   725F DD 6E F3      [19] 2425 	ld	l,-13 (ix)
   7262 DD 66 F4      [19] 2426 	ld	h,-12 (ix)
   7265 7E            [ 7] 2427 	ld	a,(hl)
   7266 C6 0B         [ 7] 2428 	add	a, #0x0B
   7268 47            [ 4] 2429 	ld	b,a
   7269 DD 6E F1      [19] 2430 	ld	l,-15 (ix)
   726C DD 66 F2      [19] 2431 	ld	h,-14 (ix)
   726F 7E            [ 7] 2432 	ld	a,(hl)
   7270 C6 04         [ 7] 2433 	add	a, #0x04
   7272 C5            [11] 2434 	push	bc
   7273 33            [ 6] 2435 	inc	sp
   7274 F5            [11] 2436 	push	af
   7275 33            [ 6] 2437 	inc	sp
   7276 2A 03 65      [16] 2438 	ld	hl,(_mapa)
   7279 E5            [11] 2439 	push	hl
   727A CD 61 4B      [17] 2440 	call	_getTilePtr
   727D F1            [10] 2441 	pop	af
   727E F1            [10] 2442 	pop	af
   727F 4E            [ 7] 2443 	ld	c,(hl)
   7280 3E 02         [ 7] 2444 	ld	a,#0x02
   7282 91            [ 4] 2445 	sub	a, c
   7283 DA 27 79      [10] 2446 	jp	C,00205$
                           2447 ;src/main.c:458: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7286 DD 6E F3      [19] 2448 	ld	l,-13 (ix)
   7289 DD 66 F4      [19] 2449 	ld	h,-12 (ix)
   728C 7E            [ 7] 2450 	ld	a,(hl)
   728D C6 16         [ 7] 2451 	add	a, #0x16
   728F 47            [ 4] 2452 	ld	b,a
   7290 DD 6E F1      [19] 2453 	ld	l,-15 (ix)
   7293 DD 66 F2      [19] 2454 	ld	h,-14 (ix)
   7296 7E            [ 7] 2455 	ld	a,(hl)
   7297 C6 04         [ 7] 2456 	add	a, #0x04
   7299 C5            [11] 2457 	push	bc
   729A 33            [ 6] 2458 	inc	sp
   729B F5            [11] 2459 	push	af
   729C 33            [ 6] 2460 	inc	sp
   729D 2A 03 65      [16] 2461 	ld	hl,(_mapa)
   72A0 E5            [11] 2462 	push	hl
   72A1 CD 61 4B      [17] 2463 	call	_getTilePtr
   72A4 F1            [10] 2464 	pop	af
   72A5 F1            [10] 2465 	pop	af
   72A6 4E            [ 7] 2466 	ld	c,(hl)
   72A7 3E 02         [ 7] 2467 	ld	a,#0x02
   72A9 91            [ 4] 2468 	sub	a, c
   72AA DA 27 79      [10] 2469 	jp	C,00205$
                           2470 ;src/main.c:459: moverEnemigoDerecha(enemy);
   72AD DD 6E F1      [19] 2471 	ld	l,-15 (ix)
   72B0 DD 66 F2      [19] 2472 	ld	h,-14 (ix)
   72B3 E5            [11] 2473 	push	hl
   72B4 CD 91 6B      [17] 2474 	call	_moverEnemigoDerecha
   72B7 F1            [10] 2475 	pop	af
                           2476 ;src/main.c:461: enemy->mover = SI;
   72B8 DD 6E F5      [19] 2477 	ld	l,-11 (ix)
   72BB DD 66 F6      [19] 2478 	ld	h,-10 (ix)
   72BE 36 01         [10] 2479 	ld	(hl),#0x01
   72C0 C3 27 79      [10] 2480 	jp	00205$
   72C3                    2481 00199$:
                           2482 ;src/main.c:466: else if (enemy->x == dx) {
   72C3 DD 7E F8      [19] 2483 	ld	a,-8 (ix)
   72C6 DD 96 06      [19] 2484 	sub	a, 6 (ix)
   72C9 C2 E0 73      [10] 2485 	jp	NZ,00196$
                           2486 ;src/main.c:467: if (dy < enemy->y) {
   72CC DD 7E 07      [19] 2487 	ld	a,7 (ix)
   72CF DD 96 F7      [19] 2488 	sub	a, -9 (ix)
   72D2 D2 59 73      [10] 2489 	jp	NC,00133$
                           2490 ;src/main.c:468: if (dist > G_HERO_H + 5) {
   72D5 3E 1B         [ 7] 2491 	ld	a,#0x1B
   72D7 DD 96 ED      [19] 2492 	sub	a, -19 (ix)
   72DA D2 27 79      [10] 2493 	jp	NC,00205$
                           2494 ;src/main.c:469: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   72DD DD 46 F7      [19] 2495 	ld	b,-9 (ix)
   72E0 05            [ 4] 2496 	dec	b
   72E1 05            [ 4] 2497 	dec	b
   72E2 C5            [11] 2498 	push	bc
   72E3 33            [ 6] 2499 	inc	sp
   72E4 DD 7E F8      [19] 2500 	ld	a,-8 (ix)
   72E7 F5            [11] 2501 	push	af
   72E8 33            [ 6] 2502 	inc	sp
   72E9 2A 03 65      [16] 2503 	ld	hl,(_mapa)
   72EC E5            [11] 2504 	push	hl
   72ED CD 61 4B      [17] 2505 	call	_getTilePtr
   72F0 F1            [10] 2506 	pop	af
   72F1 F1            [10] 2507 	pop	af
   72F2 4E            [ 7] 2508 	ld	c,(hl)
   72F3 3E 02         [ 7] 2509 	ld	a,#0x02
   72F5 91            [ 4] 2510 	sub	a, c
   72F6 DA 27 79      [10] 2511 	jp	C,00205$
                           2512 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   72F9 DD 6E F3      [19] 2513 	ld	l,-13 (ix)
   72FC DD 66 F4      [19] 2514 	ld	h,-12 (ix)
   72FF 46            [ 7] 2515 	ld	b,(hl)
   7300 05            [ 4] 2516 	dec	b
   7301 05            [ 4] 2517 	dec	b
   7302 DD 6E F1      [19] 2518 	ld	l,-15 (ix)
   7305 DD 66 F2      [19] 2519 	ld	h,-14 (ix)
   7308 56            [ 7] 2520 	ld	d,(hl)
   7309 14            [ 4] 2521 	inc	d
   730A 14            [ 4] 2522 	inc	d
   730B 4A            [ 4] 2523 	ld	c, d
   730C C5            [11] 2524 	push	bc
   730D 2A 03 65      [16] 2525 	ld	hl,(_mapa)
   7310 E5            [11] 2526 	push	hl
   7311 CD 61 4B      [17] 2527 	call	_getTilePtr
   7314 F1            [10] 2528 	pop	af
   7315 F1            [10] 2529 	pop	af
   7316 4E            [ 7] 2530 	ld	c,(hl)
   7317 3E 02         [ 7] 2531 	ld	a,#0x02
   7319 91            [ 4] 2532 	sub	a, c
   731A DA 27 79      [10] 2533 	jp	C,00205$
                           2534 ;src/main.c:471: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   731D DD 6E F3      [19] 2535 	ld	l,-13 (ix)
   7320 DD 66 F4      [19] 2536 	ld	h,-12 (ix)
   7323 46            [ 7] 2537 	ld	b,(hl)
   7324 05            [ 4] 2538 	dec	b
   7325 05            [ 4] 2539 	dec	b
   7326 DD 6E F1      [19] 2540 	ld	l,-15 (ix)
   7329 DD 66 F2      [19] 2541 	ld	h,-14 (ix)
   732C 7E            [ 7] 2542 	ld	a,(hl)
   732D C6 04         [ 7] 2543 	add	a, #0x04
   732F C5            [11] 2544 	push	bc
   7330 33            [ 6] 2545 	inc	sp
   7331 F5            [11] 2546 	push	af
   7332 33            [ 6] 2547 	inc	sp
   7333 2A 03 65      [16] 2548 	ld	hl,(_mapa)
   7336 E5            [11] 2549 	push	hl
   7337 CD 61 4B      [17] 2550 	call	_getTilePtr
   733A F1            [10] 2551 	pop	af
   733B F1            [10] 2552 	pop	af
   733C 4E            [ 7] 2553 	ld	c,(hl)
   733D 3E 02         [ 7] 2554 	ld	a,#0x02
   733F 91            [ 4] 2555 	sub	a, c
   7340 DA 27 79      [10] 2556 	jp	C,00205$
                           2557 ;src/main.c:472: moverEnemigoArriba(enemy);
   7343 DD 6E F1      [19] 2558 	ld	l,-15 (ix)
   7346 DD 66 F2      [19] 2559 	ld	h,-14 (ix)
   7349 E5            [11] 2560 	push	hl
   734A CD 53 6B      [17] 2561 	call	_moverEnemigoArriba
   734D F1            [10] 2562 	pop	af
                           2563 ;src/main.c:474: enemy->mover = SI;
   734E DD 6E F5      [19] 2564 	ld	l,-11 (ix)
   7351 DD 66 F6      [19] 2565 	ld	h,-10 (ix)
   7354 36 01         [10] 2566 	ld	(hl),#0x01
   7356 C3 27 79      [10] 2567 	jp	00205$
   7359                    2568 00133$:
                           2569 ;src/main.c:478: if(dist > G_ENEMY_H + 7) {
   7359 3E 1D         [ 7] 2570 	ld	a,#0x1D
   735B DD 96 ED      [19] 2571 	sub	a, -19 (ix)
   735E D2 27 79      [10] 2572 	jp	NC,00205$
                           2573 ;src/main.c:479: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7361 DD 7E F7      [19] 2574 	ld	a,-9 (ix)
   7364 C6 18         [ 7] 2575 	add	a, #0x18
   7366 47            [ 4] 2576 	ld	b,a
   7367 C5            [11] 2577 	push	bc
   7368 33            [ 6] 2578 	inc	sp
   7369 DD 7E F8      [19] 2579 	ld	a,-8 (ix)
   736C F5            [11] 2580 	push	af
   736D 33            [ 6] 2581 	inc	sp
   736E 2A 03 65      [16] 2582 	ld	hl,(_mapa)
   7371 E5            [11] 2583 	push	hl
   7372 CD 61 4B      [17] 2584 	call	_getTilePtr
   7375 F1            [10] 2585 	pop	af
   7376 F1            [10] 2586 	pop	af
   7377 4E            [ 7] 2587 	ld	c,(hl)
   7378 3E 02         [ 7] 2588 	ld	a,#0x02
   737A 91            [ 4] 2589 	sub	a, c
   737B DA 27 79      [10] 2590 	jp	C,00205$
                           2591 ;src/main.c:480: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   737E DD 6E F3      [19] 2592 	ld	l,-13 (ix)
   7381 DD 66 F4      [19] 2593 	ld	h,-12 (ix)
   7384 7E            [ 7] 2594 	ld	a,(hl)
   7385 C6 18         [ 7] 2595 	add	a, #0x18
   7387 47            [ 4] 2596 	ld	b,a
   7388 DD 6E F1      [19] 2597 	ld	l,-15 (ix)
   738B DD 66 F2      [19] 2598 	ld	h,-14 (ix)
   738E 56            [ 7] 2599 	ld	d,(hl)
   738F 14            [ 4] 2600 	inc	d
   7390 14            [ 4] 2601 	inc	d
   7391 4A            [ 4] 2602 	ld	c, d
   7392 C5            [11] 2603 	push	bc
   7393 2A 03 65      [16] 2604 	ld	hl,(_mapa)
   7396 E5            [11] 2605 	push	hl
   7397 CD 61 4B      [17] 2606 	call	_getTilePtr
   739A F1            [10] 2607 	pop	af
   739B F1            [10] 2608 	pop	af
   739C 4E            [ 7] 2609 	ld	c,(hl)
   739D 3E 02         [ 7] 2610 	ld	a,#0x02
   739F 91            [ 4] 2611 	sub	a, c
   73A0 DA 27 79      [10] 2612 	jp	C,00205$
                           2613 ;src/main.c:481: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   73A3 DD 6E F3      [19] 2614 	ld	l,-13 (ix)
   73A6 DD 66 F4      [19] 2615 	ld	h,-12 (ix)
   73A9 7E            [ 7] 2616 	ld	a,(hl)
   73AA C6 18         [ 7] 2617 	add	a, #0x18
   73AC 47            [ 4] 2618 	ld	b,a
   73AD DD 6E F1      [19] 2619 	ld	l,-15 (ix)
   73B0 DD 66 F2      [19] 2620 	ld	h,-14 (ix)
   73B3 7E            [ 7] 2621 	ld	a,(hl)
   73B4 C6 04         [ 7] 2622 	add	a, #0x04
   73B6 C5            [11] 2623 	push	bc
   73B7 33            [ 6] 2624 	inc	sp
   73B8 F5            [11] 2625 	push	af
   73B9 33            [ 6] 2626 	inc	sp
   73BA 2A 03 65      [16] 2627 	ld	hl,(_mapa)
   73BD E5            [11] 2628 	push	hl
   73BE CD 61 4B      [17] 2629 	call	_getTilePtr
   73C1 F1            [10] 2630 	pop	af
   73C2 F1            [10] 2631 	pop	af
   73C3 4E            [ 7] 2632 	ld	c,(hl)
   73C4 3E 02         [ 7] 2633 	ld	a,#0x02
   73C6 91            [ 4] 2634 	sub	a, c
   73C7 DA 27 79      [10] 2635 	jp	C,00205$
                           2636 ;src/main.c:482: moverEnemigoAbajo(enemy);
   73CA DD 6E F1      [19] 2637 	ld	l,-15 (ix)
   73CD DD 66 F2      [19] 2638 	ld	h,-14 (ix)
   73D0 E5            [11] 2639 	push	hl
   73D1 CD 72 6B      [17] 2640 	call	_moverEnemigoAbajo
   73D4 F1            [10] 2641 	pop	af
                           2642 ;src/main.c:484: enemy->mover = SI;
   73D5 DD 6E F5      [19] 2643 	ld	l,-11 (ix)
   73D8 DD 66 F6      [19] 2644 	ld	h,-10 (ix)
   73DB 36 01         [10] 2645 	ld	(hl),#0x01
   73DD C3 27 79      [10] 2646 	jp	00205$
   73E0                    2647 00196$:
                           2648 ;src/main.c:490: if (!prota.mover) distConstraint = 20; // ajuste en parado
   73E0 3A 2B 64      [13] 2649 	ld	a, (#_prota + 6)
   73E3 B7            [ 4] 2650 	or	a, a
   73E4 20 04         [12] 2651 	jr	NZ,00136$
   73E6 DD 36 EE 14   [19] 2652 	ld	-18 (ix),#0x14
   73EA                    2653 00136$:
                           2654 ;src/main.c:492: if (dist > distConstraint) {
   73EA DD 7E EE      [19] 2655 	ld	a,-18 (ix)
   73ED DD 96 ED      [19] 2656 	sub	a, -19 (ix)
   73F0 D2 27 79      [10] 2657 	jp	NC,00205$
                           2658 ;src/main.c:493: if (dx + 1 < enemy->x) {
   73F3 DD 4E 06      [19] 2659 	ld	c,6 (ix)
   73F6 06 00         [ 7] 2660 	ld	b,#0x00
   73F8 03            [ 6] 2661 	inc	bc
   73F9 DD 71 FA      [19] 2662 	ld	-6 (ix),c
   73FC DD 70 FB      [19] 2663 	ld	-5 (ix),b
   73FF DD 7E F8      [19] 2664 	ld	a,-8 (ix)
   7402 DD 77 FC      [19] 2665 	ld	-4 (ix),a
   7405 DD 36 FD 00   [19] 2666 	ld	-3 (ix),#0x00
   7409 DD 7E FA      [19] 2667 	ld	a,-6 (ix)
   740C DD 96 FC      [19] 2668 	sub	a, -4 (ix)
   740F DD 7E FB      [19] 2669 	ld	a,-5 (ix)
   7412 DD 9E FD      [19] 2670 	sbc	a, -3 (ix)
   7415 E2 1A 74      [10] 2671 	jp	PO, 00447$
   7418 EE 80         [ 7] 2672 	xor	a, #0x80
   741A                    2673 00447$:
   741A F2 B1 74      [10] 2674 	jp	P,00148$
                           2675 ;src/main.c:494: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   741D DD 66 F7      [19] 2676 	ld	h,-9 (ix)
   7420 DD 6E F8      [19] 2677 	ld	l,-8 (ix)
   7423 E5            [11] 2678 	push	hl
   7424 2A 03 65      [16] 2679 	ld	hl,(_mapa)
   7427 E5            [11] 2680 	push	hl
   7428 CD 61 4B      [17] 2681 	call	_getTilePtr
   742B F1            [10] 2682 	pop	af
   742C F1            [10] 2683 	pop	af
   742D DD 74 FF      [19] 2684 	ld	-1 (ix),h
   7430 DD 75 FE      [19] 2685 	ld	-2 (ix), l
   7433 DD 66 FF      [19] 2686 	ld	h,-1 (ix)
   7436 4E            [ 7] 2687 	ld	c,(hl)
   7437 3E 02         [ 7] 2688 	ld	a,#0x02
   7439 91            [ 4] 2689 	sub	a, c
   743A DA 3E 75      [10] 2690 	jp	C,00149$
                           2691 ;src/main.c:495: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   743D DD 6E F3      [19] 2692 	ld	l,-13 (ix)
   7440 DD 66 F4      [19] 2693 	ld	h,-12 (ix)
   7443 7E            [ 7] 2694 	ld	a,(hl)
   7444 DD 77 FE      [19] 2695 	ld	-2 (ix), a
   7447 C6 0B         [ 7] 2696 	add	a, #0x0B
   7449 DD 77 FE      [19] 2697 	ld	-2 (ix),a
   744C DD 6E F1      [19] 2698 	ld	l,-15 (ix)
   744F DD 66 F2      [19] 2699 	ld	h,-14 (ix)
   7452 46            [ 7] 2700 	ld	b,(hl)
   7453 DD 7E FE      [19] 2701 	ld	a,-2 (ix)
   7456 F5            [11] 2702 	push	af
   7457 33            [ 6] 2703 	inc	sp
   7458 C5            [11] 2704 	push	bc
   7459 33            [ 6] 2705 	inc	sp
   745A 2A 03 65      [16] 2706 	ld	hl,(_mapa)
   745D E5            [11] 2707 	push	hl
   745E CD 61 4B      [17] 2708 	call	_getTilePtr
   7461 F1            [10] 2709 	pop	af
   7462 F1            [10] 2710 	pop	af
   7463 4E            [ 7] 2711 	ld	c,(hl)
   7464 3E 02         [ 7] 2712 	ld	a,#0x02
   7466 91            [ 4] 2713 	sub	a, c
   7467 DA 3E 75      [10] 2714 	jp	C,00149$
                           2715 ;src/main.c:496: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   746A DD 6E F3      [19] 2716 	ld	l,-13 (ix)
   746D DD 66 F4      [19] 2717 	ld	h,-12 (ix)
   7470 7E            [ 7] 2718 	ld	a,(hl)
   7471 DD 77 FE      [19] 2719 	ld	-2 (ix), a
   7474 C6 16         [ 7] 2720 	add	a, #0x16
   7476 DD 77 FE      [19] 2721 	ld	-2 (ix),a
   7479 DD 6E F1      [19] 2722 	ld	l,-15 (ix)
   747C DD 66 F2      [19] 2723 	ld	h,-14 (ix)
   747F 46            [ 7] 2724 	ld	b,(hl)
   7480 DD 7E FE      [19] 2725 	ld	a,-2 (ix)
   7483 F5            [11] 2726 	push	af
   7484 33            [ 6] 2727 	inc	sp
   7485 C5            [11] 2728 	push	bc
   7486 33            [ 6] 2729 	inc	sp
   7487 2A 03 65      [16] 2730 	ld	hl,(_mapa)
   748A E5            [11] 2731 	push	hl
   748B CD 61 4B      [17] 2732 	call	_getTilePtr
   748E F1            [10] 2733 	pop	af
   748F F1            [10] 2734 	pop	af
   7490 4E            [ 7] 2735 	ld	c,(hl)
   7491 3E 02         [ 7] 2736 	ld	a,#0x02
   7493 91            [ 4] 2737 	sub	a, c
   7494 DA 3E 75      [10] 2738 	jp	C,00149$
                           2739 ;src/main.c:497: moverEnemigoIzquierda(enemy);
   7497 DD 6E F1      [19] 2740 	ld	l,-15 (ix)
   749A DD 66 F2      [19] 2741 	ld	h,-14 (ix)
   749D E5            [11] 2742 	push	hl
   749E CD A1 6B      [17] 2743 	call	_moverEnemigoIzquierda
   74A1 F1            [10] 2744 	pop	af
                           2745 ;src/main.c:498: movX = 1;
   74A2 DD 36 F0 01   [19] 2746 	ld	-16 (ix),#0x01
                           2747 ;src/main.c:499: enemy->mover = SI;
   74A6 DD 6E F5      [19] 2748 	ld	l,-11 (ix)
   74A9 DD 66 F6      [19] 2749 	ld	h,-10 (ix)
   74AC 36 01         [10] 2750 	ld	(hl),#0x01
   74AE C3 3E 75      [10] 2751 	jp	00149$
   74B1                    2752 00148$:
                           2753 ;src/main.c:501: } else if (dx + 1 > enemy->x){
   74B1 DD 7E FC      [19] 2754 	ld	a,-4 (ix)
   74B4 DD 96 FA      [19] 2755 	sub	a, -6 (ix)
   74B7 DD 7E FD      [19] 2756 	ld	a,-3 (ix)
   74BA DD 9E FB      [19] 2757 	sbc	a, -5 (ix)
   74BD E2 C2 74      [10] 2758 	jp	PO, 00448$
   74C0 EE 80         [ 7] 2759 	xor	a, #0x80
   74C2                    2760 00448$:
   74C2 F2 3E 75      [10] 2761 	jp	P,00149$
                           2762 ;src/main.c:502: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   74C5 DD 66 F7      [19] 2763 	ld	h,-9 (ix)
   74C8 DD 6E F9      [19] 2764 	ld	l,-7 (ix)
   74CB E5            [11] 2765 	push	hl
   74CC 2A 03 65      [16] 2766 	ld	hl,(_mapa)
   74CF E5            [11] 2767 	push	hl
   74D0 CD 61 4B      [17] 2768 	call	_getTilePtr
   74D3 F1            [10] 2769 	pop	af
   74D4 F1            [10] 2770 	pop	af
   74D5 4E            [ 7] 2771 	ld	c,(hl)
   74D6 3E 02         [ 7] 2772 	ld	a,#0x02
   74D8 91            [ 4] 2773 	sub	a, c
   74D9 38 63         [12] 2774 	jr	C,00149$
                           2775 ;src/main.c:503: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   74DB DD 6E F3      [19] 2776 	ld	l,-13 (ix)
   74DE DD 66 F4      [19] 2777 	ld	h,-12 (ix)
   74E1 7E            [ 7] 2778 	ld	a,(hl)
   74E2 C6 0B         [ 7] 2779 	add	a, #0x0B
   74E4 47            [ 4] 2780 	ld	b,a
   74E5 DD 6E F1      [19] 2781 	ld	l,-15 (ix)
   74E8 DD 66 F2      [19] 2782 	ld	h,-14 (ix)
   74EB 7E            [ 7] 2783 	ld	a,(hl)
   74EC C6 04         [ 7] 2784 	add	a, #0x04
   74EE C5            [11] 2785 	push	bc
   74EF 33            [ 6] 2786 	inc	sp
   74F0 F5            [11] 2787 	push	af
   74F1 33            [ 6] 2788 	inc	sp
   74F2 2A 03 65      [16] 2789 	ld	hl,(_mapa)
   74F5 E5            [11] 2790 	push	hl
   74F6 CD 61 4B      [17] 2791 	call	_getTilePtr
   74F9 F1            [10] 2792 	pop	af
   74FA F1            [10] 2793 	pop	af
   74FB 4E            [ 7] 2794 	ld	c,(hl)
   74FC 3E 02         [ 7] 2795 	ld	a,#0x02
   74FE 91            [ 4] 2796 	sub	a, c
   74FF 38 3D         [12] 2797 	jr	C,00149$
                           2798 ;src/main.c:504: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7501 DD 6E F3      [19] 2799 	ld	l,-13 (ix)
   7504 DD 66 F4      [19] 2800 	ld	h,-12 (ix)
   7507 7E            [ 7] 2801 	ld	a,(hl)
   7508 C6 16         [ 7] 2802 	add	a, #0x16
   750A 47            [ 4] 2803 	ld	b,a
   750B DD 6E F1      [19] 2804 	ld	l,-15 (ix)
   750E DD 66 F2      [19] 2805 	ld	h,-14 (ix)
   7511 7E            [ 7] 2806 	ld	a,(hl)
   7512 C6 04         [ 7] 2807 	add	a, #0x04
   7514 C5            [11] 2808 	push	bc
   7515 33            [ 6] 2809 	inc	sp
   7516 F5            [11] 2810 	push	af
   7517 33            [ 6] 2811 	inc	sp
   7518 2A 03 65      [16] 2812 	ld	hl,(_mapa)
   751B E5            [11] 2813 	push	hl
   751C CD 61 4B      [17] 2814 	call	_getTilePtr
   751F F1            [10] 2815 	pop	af
   7520 F1            [10] 2816 	pop	af
   7521 4E            [ 7] 2817 	ld	c,(hl)
   7522 3E 02         [ 7] 2818 	ld	a,#0x02
   7524 91            [ 4] 2819 	sub	a, c
   7525 38 17         [12] 2820 	jr	C,00149$
                           2821 ;src/main.c:505: moverEnemigoDerecha(enemy);
   7527 DD 6E F1      [19] 2822 	ld	l,-15 (ix)
   752A DD 66 F2      [19] 2823 	ld	h,-14 (ix)
   752D E5            [11] 2824 	push	hl
   752E CD 91 6B      [17] 2825 	call	_moverEnemigoDerecha
   7531 F1            [10] 2826 	pop	af
                           2827 ;src/main.c:506: movX = 1;
   7532 DD 36 F0 01   [19] 2828 	ld	-16 (ix),#0x01
                           2829 ;src/main.c:507: enemy->mover = SI;
   7536 DD 6E F5      [19] 2830 	ld	l,-11 (ix)
   7539 DD 66 F6      [19] 2831 	ld	h,-10 (ix)
   753C 36 01         [10] 2832 	ld	(hl),#0x01
   753E                    2833 00149$:
                           2834 ;src/main.c:510: if (dy < enemy->y) {
   753E DD 6E F3      [19] 2835 	ld	l,-13 (ix)
   7541 DD 66 F4      [19] 2836 	ld	h,-12 (ix)
   7544 7E            [ 7] 2837 	ld	a,(hl)
   7545 DD 77 FE      [19] 2838 	ld	-2 (ix),a
                           2839 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7548 DD 6E F1      [19] 2840 	ld	l,-15 (ix)
   754B DD 66 F2      [19] 2841 	ld	h,-14 (ix)
   754E 7E            [ 7] 2842 	ld	a,(hl)
   754F DD 77 FC      [19] 2843 	ld	-4 (ix),a
                           2844 ;src/main.c:510: if (dy < enemy->y) {
   7552 DD 7E 07      [19] 2845 	ld	a,7 (ix)
   7555 DD 96 FE      [19] 2846 	sub	a, -2 (ix)
   7558 D2 DD 75      [10] 2847 	jp	NC,00159$
                           2848 ;src/main.c:511: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   755B DD 46 FE      [19] 2849 	ld	b,-2 (ix)
   755E 05            [ 4] 2850 	dec	b
   755F 05            [ 4] 2851 	dec	b
   7560 C5            [11] 2852 	push	bc
   7561 33            [ 6] 2853 	inc	sp
   7562 DD 7E FC      [19] 2854 	ld	a,-4 (ix)
   7565 F5            [11] 2855 	push	af
   7566 33            [ 6] 2856 	inc	sp
   7567 2A 03 65      [16] 2857 	ld	hl,(_mapa)
   756A E5            [11] 2858 	push	hl
   756B CD 61 4B      [17] 2859 	call	_getTilePtr
   756E F1            [10] 2860 	pop	af
   756F F1            [10] 2861 	pop	af
   7570 4E            [ 7] 2862 	ld	c,(hl)
   7571 3E 02         [ 7] 2863 	ld	a,#0x02
   7573 91            [ 4] 2864 	sub	a, c
   7574 DA 5C 76      [10] 2865 	jp	C,00160$
                           2866 ;src/main.c:512: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7577 DD 6E F3      [19] 2867 	ld	l,-13 (ix)
   757A DD 66 F4      [19] 2868 	ld	h,-12 (ix)
   757D 56            [ 7] 2869 	ld	d,(hl)
   757E 15            [ 4] 2870 	dec	d
   757F 15            [ 4] 2871 	dec	d
   7580 DD 6E F1      [19] 2872 	ld	l,-15 (ix)
   7583 DD 66 F2      [19] 2873 	ld	h,-14 (ix)
   7586 46            [ 7] 2874 	ld	b,(hl)
   7587 04            [ 4] 2875 	inc	b
   7588 04            [ 4] 2876 	inc	b
   7589 D5            [11] 2877 	push	de
   758A 33            [ 6] 2878 	inc	sp
   758B C5            [11] 2879 	push	bc
   758C 33            [ 6] 2880 	inc	sp
   758D 2A 03 65      [16] 2881 	ld	hl,(_mapa)
   7590 E5            [11] 2882 	push	hl
   7591 CD 61 4B      [17] 2883 	call	_getTilePtr
   7594 F1            [10] 2884 	pop	af
   7595 F1            [10] 2885 	pop	af
   7596 4E            [ 7] 2886 	ld	c,(hl)
   7597 3E 02         [ 7] 2887 	ld	a,#0x02
   7599 91            [ 4] 2888 	sub	a, c
   759A DA 5C 76      [10] 2889 	jp	C,00160$
                           2890 ;src/main.c:513: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   759D DD 6E F3      [19] 2891 	ld	l,-13 (ix)
   75A0 DD 66 F4      [19] 2892 	ld	h,-12 (ix)
   75A3 46            [ 7] 2893 	ld	b,(hl)
   75A4 05            [ 4] 2894 	dec	b
   75A5 05            [ 4] 2895 	dec	b
   75A6 DD 6E F1      [19] 2896 	ld	l,-15 (ix)
   75A9 DD 66 F2      [19] 2897 	ld	h,-14 (ix)
   75AC 7E            [ 7] 2898 	ld	a,(hl)
   75AD C6 04         [ 7] 2899 	add	a, #0x04
   75AF C5            [11] 2900 	push	bc
   75B0 33            [ 6] 2901 	inc	sp
   75B1 F5            [11] 2902 	push	af
   75B2 33            [ 6] 2903 	inc	sp
   75B3 2A 03 65      [16] 2904 	ld	hl,(_mapa)
   75B6 E5            [11] 2905 	push	hl
   75B7 CD 61 4B      [17] 2906 	call	_getTilePtr
   75BA F1            [10] 2907 	pop	af
   75BB F1            [10] 2908 	pop	af
   75BC 4E            [ 7] 2909 	ld	c,(hl)
   75BD 3E 02         [ 7] 2910 	ld	a,#0x02
   75BF 91            [ 4] 2911 	sub	a, c
   75C0 DA 5C 76      [10] 2912 	jp	C,00160$
                           2913 ;src/main.c:514: moverEnemigoArriba(enemy);
   75C3 DD 6E F1      [19] 2914 	ld	l,-15 (ix)
   75C6 DD 66 F2      [19] 2915 	ld	h,-14 (ix)
   75C9 E5            [11] 2916 	push	hl
   75CA CD 53 6B      [17] 2917 	call	_moverEnemigoArriba
   75CD F1            [10] 2918 	pop	af
                           2919 ;src/main.c:515: movY = 1;
   75CE DD 36 EF 01   [19] 2920 	ld	-17 (ix),#0x01
                           2921 ;src/main.c:516: enemy->mover = SI;
   75D2 DD 6E F5      [19] 2922 	ld	l,-11 (ix)
   75D5 DD 66 F6      [19] 2923 	ld	h,-10 (ix)
   75D8 36 01         [10] 2924 	ld	(hl),#0x01
   75DA C3 5C 76      [10] 2925 	jp	00160$
   75DD                    2926 00159$:
                           2927 ;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75DD DD 7E FE      [19] 2928 	ld	a,-2 (ix)
   75E0 C6 18         [ 7] 2929 	add	a, #0x18
   75E2 47            [ 4] 2930 	ld	b,a
   75E3 C5            [11] 2931 	push	bc
   75E4 33            [ 6] 2932 	inc	sp
   75E5 DD 7E FC      [19] 2933 	ld	a,-4 (ix)
   75E8 F5            [11] 2934 	push	af
   75E9 33            [ 6] 2935 	inc	sp
   75EA 2A 03 65      [16] 2936 	ld	hl,(_mapa)
   75ED E5            [11] 2937 	push	hl
   75EE CD 61 4B      [17] 2938 	call	_getTilePtr
   75F1 F1            [10] 2939 	pop	af
   75F2 F1            [10] 2940 	pop	af
   75F3 4E            [ 7] 2941 	ld	c,(hl)
   75F4 3E 02         [ 7] 2942 	ld	a,#0x02
   75F6 91            [ 4] 2943 	sub	a, c
   75F7 38 63         [12] 2944 	jr	C,00160$
                           2945 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   75F9 DD 6E F3      [19] 2946 	ld	l,-13 (ix)
   75FC DD 66 F4      [19] 2947 	ld	h,-12 (ix)
   75FF 7E            [ 7] 2948 	ld	a,(hl)
   7600 C6 18         [ 7] 2949 	add	a, #0x18
   7602 57            [ 4] 2950 	ld	d,a
   7603 DD 6E F1      [19] 2951 	ld	l,-15 (ix)
   7606 DD 66 F2      [19] 2952 	ld	h,-14 (ix)
   7609 46            [ 7] 2953 	ld	b,(hl)
   760A 04            [ 4] 2954 	inc	b
   760B 04            [ 4] 2955 	inc	b
   760C D5            [11] 2956 	push	de
   760D 33            [ 6] 2957 	inc	sp
   760E C5            [11] 2958 	push	bc
   760F 33            [ 6] 2959 	inc	sp
   7610 2A 03 65      [16] 2960 	ld	hl,(_mapa)
   7613 E5            [11] 2961 	push	hl
   7614 CD 61 4B      [17] 2962 	call	_getTilePtr
   7617 F1            [10] 2963 	pop	af
   7618 F1            [10] 2964 	pop	af
   7619 4E            [ 7] 2965 	ld	c,(hl)
   761A 3E 02         [ 7] 2966 	ld	a,#0x02
   761C 91            [ 4] 2967 	sub	a, c
   761D 38 3D         [12] 2968 	jr	C,00160$
                           2969 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   761F DD 6E F3      [19] 2970 	ld	l,-13 (ix)
   7622 DD 66 F4      [19] 2971 	ld	h,-12 (ix)
   7625 7E            [ 7] 2972 	ld	a,(hl)
   7626 C6 18         [ 7] 2973 	add	a, #0x18
   7628 47            [ 4] 2974 	ld	b,a
   7629 DD 6E F1      [19] 2975 	ld	l,-15 (ix)
   762C DD 66 F2      [19] 2976 	ld	h,-14 (ix)
   762F 7E            [ 7] 2977 	ld	a,(hl)
   7630 C6 04         [ 7] 2978 	add	a, #0x04
   7632 C5            [11] 2979 	push	bc
   7633 33            [ 6] 2980 	inc	sp
   7634 F5            [11] 2981 	push	af
   7635 33            [ 6] 2982 	inc	sp
   7636 2A 03 65      [16] 2983 	ld	hl,(_mapa)
   7639 E5            [11] 2984 	push	hl
   763A CD 61 4B      [17] 2985 	call	_getTilePtr
   763D F1            [10] 2986 	pop	af
   763E F1            [10] 2987 	pop	af
   763F 4E            [ 7] 2988 	ld	c,(hl)
   7640 3E 02         [ 7] 2989 	ld	a,#0x02
   7642 91            [ 4] 2990 	sub	a, c
   7643 38 17         [12] 2991 	jr	C,00160$
                           2992 ;src/main.c:522: moverEnemigoAbajo(enemy);
   7645 DD 6E F1      [19] 2993 	ld	l,-15 (ix)
   7648 DD 66 F2      [19] 2994 	ld	h,-14 (ix)
   764B E5            [11] 2995 	push	hl
   764C CD 72 6B      [17] 2996 	call	_moverEnemigoAbajo
   764F F1            [10] 2997 	pop	af
                           2998 ;src/main.c:523: movY = 1;
   7650 DD 36 EF 01   [19] 2999 	ld	-17 (ix),#0x01
                           3000 ;src/main.c:524: enemy->mover = SI;
   7654 DD 6E F5      [19] 3001 	ld	l,-11 (ix)
   7657 DD 66 F6      [19] 3002 	ld	h,-10 (ix)
   765A 36 01         [10] 3003 	ld	(hl),#0x01
   765C                    3004 00160$:
                           3005 ;src/main.c:527: if (!enemy->mover) {
   765C DD 6E F5      [19] 3006 	ld	l,-11 (ix)
   765F DD 66 F6      [19] 3007 	ld	h,-10 (ix)
   7662 7E            [ 7] 3008 	ld	a,(hl)
   7663 B7            [ 4] 3009 	or	a, a
   7664 C2 27 79      [10] 3010 	jp	NZ,00205$
                           3011 ;src/main.c:528: if (!movX) {
   7667 DD 7E F0      [19] 3012 	ld	a,-16 (ix)
   766A B7            [ 4] 3013 	or	a, a
   766B C2 94 77      [10] 3014 	jp	NZ,00175$
                           3015 ;src/main.c:529: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   766E DD 6E F3      [19] 3016 	ld	l,-13 (ix)
   7671 DD 66 F4      [19] 3017 	ld	h,-12 (ix)
   7674 5E            [ 7] 3018 	ld	e,(hl)
                           3019 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7675 DD 6E F1      [19] 3020 	ld	l,-15 (ix)
   7678 DD 66 F2      [19] 3021 	ld	h,-14 (ix)
   767B 4E            [ 7] 3022 	ld	c,(hl)
                           3023 ;src/main.c:529: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   767C 3E 70         [ 7] 3024 	ld	a,#0x70
   767E 93            [ 4] 3025 	sub	a, e
   767F D2 0F 77      [10] 3026 	jp	NC,00172$
                           3027 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7682 7B            [ 4] 3028 	ld	a,e
   7683 C6 18         [ 7] 3029 	add	a, #0x18
   7685 47            [ 4] 3030 	ld	b,a
   7686 C5            [11] 3031 	push	bc
   7687 2A 03 65      [16] 3032 	ld	hl,(_mapa)
   768A E5            [11] 3033 	push	hl
   768B CD 61 4B      [17] 3034 	call	_getTilePtr
   768E F1            [10] 3035 	pop	af
   768F F1            [10] 3036 	pop	af
   7690 4E            [ 7] 3037 	ld	c,(hl)
   7691 3E 02         [ 7] 3038 	ld	a,#0x02
   7693 91            [ 4] 3039 	sub	a, c
   7694 38 63         [12] 3040 	jr	C,00162$
                           3041 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7696 DD 6E F3      [19] 3042 	ld	l,-13 (ix)
   7699 DD 66 F4      [19] 3043 	ld	h,-12 (ix)
   769C 7E            [ 7] 3044 	ld	a,(hl)
   769D C6 18         [ 7] 3045 	add	a, #0x18
   769F 57            [ 4] 3046 	ld	d,a
   76A0 DD 6E F1      [19] 3047 	ld	l,-15 (ix)
   76A3 DD 66 F2      [19] 3048 	ld	h,-14 (ix)
   76A6 4E            [ 7] 3049 	ld	c,(hl)
   76A7 41            [ 4] 3050 	ld	b,c
   76A8 04            [ 4] 3051 	inc	b
   76A9 04            [ 4] 3052 	inc	b
   76AA D5            [11] 3053 	push	de
   76AB 33            [ 6] 3054 	inc	sp
   76AC C5            [11] 3055 	push	bc
   76AD 33            [ 6] 3056 	inc	sp
   76AE 2A 03 65      [16] 3057 	ld	hl,(_mapa)
   76B1 E5            [11] 3058 	push	hl
   76B2 CD 61 4B      [17] 3059 	call	_getTilePtr
   76B5 F1            [10] 3060 	pop	af
   76B6 F1            [10] 3061 	pop	af
   76B7 4E            [ 7] 3062 	ld	c,(hl)
   76B8 3E 02         [ 7] 3063 	ld	a,#0x02
   76BA 91            [ 4] 3064 	sub	a, c
   76BB 38 3C         [12] 3065 	jr	C,00162$
                           3066 ;src/main.c:532: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76BD DD 6E F3      [19] 3067 	ld	l,-13 (ix)
   76C0 DD 66 F4      [19] 3068 	ld	h,-12 (ix)
   76C3 7E            [ 7] 3069 	ld	a,(hl)
   76C4 C6 18         [ 7] 3070 	add	a, #0x18
   76C6 47            [ 4] 3071 	ld	b,a
   76C7 DD 6E F1      [19] 3072 	ld	l,-15 (ix)
   76CA DD 66 F2      [19] 3073 	ld	h,-14 (ix)
   76CD 7E            [ 7] 3074 	ld	a,(hl)
   76CE C6 04         [ 7] 3075 	add	a, #0x04
   76D0 C5            [11] 3076 	push	bc
   76D1 33            [ 6] 3077 	inc	sp
   76D2 F5            [11] 3078 	push	af
   76D3 33            [ 6] 3079 	inc	sp
   76D4 2A 03 65      [16] 3080 	ld	hl,(_mapa)
   76D7 E5            [11] 3081 	push	hl
   76D8 CD 61 4B      [17] 3082 	call	_getTilePtr
   76DB F1            [10] 3083 	pop	af
   76DC F1            [10] 3084 	pop	af
   76DD 4E            [ 7] 3085 	ld	c,(hl)
   76DE 3E 02         [ 7] 3086 	ld	a,#0x02
   76E0 91            [ 4] 3087 	sub	a, c
   76E1 38 16         [12] 3088 	jr	C,00162$
                           3089 ;src/main.c:533: moverEnemigoAbajo(enemy);
   76E3 DD 6E F1      [19] 3090 	ld	l,-15 (ix)
   76E6 DD 66 F2      [19] 3091 	ld	h,-14 (ix)
   76E9 E5            [11] 3092 	push	hl
   76EA CD 72 6B      [17] 3093 	call	_moverEnemigoAbajo
   76ED F1            [10] 3094 	pop	af
                           3095 ;src/main.c:534: enemy->mover = SI;
   76EE DD 6E F5      [19] 3096 	ld	l,-11 (ix)
   76F1 DD 66 F6      [19] 3097 	ld	h,-10 (ix)
   76F4 36 01         [10] 3098 	ld	(hl),#0x01
   76F6 C3 94 77      [10] 3099 	jp	00175$
   76F9                    3100 00162$:
                           3101 ;src/main.c:536: moverEnemigoArriba(enemy);
   76F9 DD 6E F1      [19] 3102 	ld	l,-15 (ix)
   76FC DD 66 F2      [19] 3103 	ld	h,-14 (ix)
   76FF E5            [11] 3104 	push	hl
   7700 CD 53 6B      [17] 3105 	call	_moverEnemigoArriba
   7703 F1            [10] 3106 	pop	af
                           3107 ;src/main.c:537: enemy->mover = SI;
   7704 DD 6E F5      [19] 3108 	ld	l,-11 (ix)
   7707 DD 66 F6      [19] 3109 	ld	h,-10 (ix)
   770A 36 01         [10] 3110 	ld	(hl),#0x01
   770C C3 94 77      [10] 3111 	jp	00175$
   770F                    3112 00172$:
                           3113 ;src/main.c:540: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   770F 43            [ 4] 3114 	ld	b,e
   7710 05            [ 4] 3115 	dec	b
   7711 05            [ 4] 3116 	dec	b
   7712 C5            [11] 3117 	push	bc
   7713 2A 03 65      [16] 3118 	ld	hl,(_mapa)
   7716 E5            [11] 3119 	push	hl
   7717 CD 61 4B      [17] 3120 	call	_getTilePtr
   771A F1            [10] 3121 	pop	af
   771B F1            [10] 3122 	pop	af
   771C 4E            [ 7] 3123 	ld	c,(hl)
   771D 3E 02         [ 7] 3124 	ld	a,#0x02
   771F 91            [ 4] 3125 	sub	a, c
   7720 38 5F         [12] 3126 	jr	C,00167$
                           3127 ;src/main.c:541: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7722 DD 6E F3      [19] 3128 	ld	l,-13 (ix)
   7725 DD 66 F4      [19] 3129 	ld	h,-12 (ix)
   7728 56            [ 7] 3130 	ld	d,(hl)
   7729 15            [ 4] 3131 	dec	d
   772A 15            [ 4] 3132 	dec	d
   772B DD 6E F1      [19] 3133 	ld	l,-15 (ix)
   772E DD 66 F2      [19] 3134 	ld	h,-14 (ix)
   7731 46            [ 7] 3135 	ld	b,(hl)
   7732 04            [ 4] 3136 	inc	b
   7733 04            [ 4] 3137 	inc	b
   7734 D5            [11] 3138 	push	de
   7735 33            [ 6] 3139 	inc	sp
   7736 C5            [11] 3140 	push	bc
   7737 33            [ 6] 3141 	inc	sp
   7738 2A 03 65      [16] 3142 	ld	hl,(_mapa)
   773B E5            [11] 3143 	push	hl
   773C CD 61 4B      [17] 3144 	call	_getTilePtr
   773F F1            [10] 3145 	pop	af
   7740 F1            [10] 3146 	pop	af
   7741 4E            [ 7] 3147 	ld	c,(hl)
   7742 3E 02         [ 7] 3148 	ld	a,#0x02
   7744 91            [ 4] 3149 	sub	a, c
   7745 38 3A         [12] 3150 	jr	C,00167$
                           3151 ;src/main.c:542: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7747 DD 6E F3      [19] 3152 	ld	l,-13 (ix)
   774A DD 66 F4      [19] 3153 	ld	h,-12 (ix)
   774D 46            [ 7] 3154 	ld	b,(hl)
   774E 05            [ 4] 3155 	dec	b
   774F 05            [ 4] 3156 	dec	b
   7750 DD 6E F1      [19] 3157 	ld	l,-15 (ix)
   7753 DD 66 F2      [19] 3158 	ld	h,-14 (ix)
   7756 7E            [ 7] 3159 	ld	a,(hl)
   7757 C6 04         [ 7] 3160 	add	a, #0x04
   7759 C5            [11] 3161 	push	bc
   775A 33            [ 6] 3162 	inc	sp
   775B F5            [11] 3163 	push	af
   775C 33            [ 6] 3164 	inc	sp
   775D 2A 03 65      [16] 3165 	ld	hl,(_mapa)
   7760 E5            [11] 3166 	push	hl
   7761 CD 61 4B      [17] 3167 	call	_getTilePtr
   7764 F1            [10] 3168 	pop	af
   7765 F1            [10] 3169 	pop	af
   7766 4E            [ 7] 3170 	ld	c,(hl)
   7767 3E 02         [ 7] 3171 	ld	a,#0x02
   7769 91            [ 4] 3172 	sub	a, c
   776A 38 15         [12] 3173 	jr	C,00167$
                           3174 ;src/main.c:543: moverEnemigoArriba(enemy);
   776C DD 6E F1      [19] 3175 	ld	l,-15 (ix)
   776F DD 66 F2      [19] 3176 	ld	h,-14 (ix)
   7772 E5            [11] 3177 	push	hl
   7773 CD 53 6B      [17] 3178 	call	_moverEnemigoArriba
   7776 F1            [10] 3179 	pop	af
                           3180 ;src/main.c:544: enemy->mover = SI;
   7777 DD 6E F5      [19] 3181 	ld	l,-11 (ix)
   777A DD 66 F6      [19] 3182 	ld	h,-10 (ix)
   777D 36 01         [10] 3183 	ld	(hl),#0x01
   777F 18 13         [12] 3184 	jr	00175$
   7781                    3185 00167$:
                           3186 ;src/main.c:546: moverEnemigoAbajo(enemy);
   7781 DD 6E F1      [19] 3187 	ld	l,-15 (ix)
   7784 DD 66 F2      [19] 3188 	ld	h,-14 (ix)
   7787 E5            [11] 3189 	push	hl
   7788 CD 72 6B      [17] 3190 	call	_moverEnemigoAbajo
   778B F1            [10] 3191 	pop	af
                           3192 ;src/main.c:547: enemy->mover = SI;
   778C DD 6E F5      [19] 3193 	ld	l,-11 (ix)
   778F DD 66 F6      [19] 3194 	ld	h,-10 (ix)
   7792 36 01         [10] 3195 	ld	(hl),#0x01
   7794                    3196 00175$:
                           3197 ;src/main.c:552: if (!movY) {
   7794 DD 7E EF      [19] 3198 	ld	a,-17 (ix)
   7797 B7            [ 4] 3199 	or	a, a
   7798 C2 27 79      [10] 3200 	jp	NZ,00205$
                           3201 ;src/main.c:553: if (enemy->x < ANCHO_PANTALLA/2) {
   779B DD 6E F1      [19] 3202 	ld	l,-15 (ix)
   779E DD 66 F2      [19] 3203 	ld	h,-14 (ix)
   77A1 7E            [ 7] 3204 	ld	a,(hl)
   77A2 DD 77 FE      [19] 3205 	ld	-2 (ix),a
                           3206 ;src/main.c:423: u8 dify = abs(enemy->y - prota.y);
   77A5 DD 6E F3      [19] 3207 	ld	l,-13 (ix)
   77A8 DD 66 F4      [19] 3208 	ld	h,-12 (ix)
   77AB 7E            [ 7] 3209 	ld	a,(hl)
   77AC DD 77 FC      [19] 3210 	ld	-4 (ix),a
                           3211 ;src/main.c:553: if (enemy->x < ANCHO_PANTALLA/2) {
   77AF DD 7E FE      [19] 3212 	ld	a,-2 (ix)
   77B2 D6 28         [ 7] 3213 	sub	a, #0x28
   77B4 D2 7C 78      [10] 3214 	jp	NC,00187$
                           3215 ;src/main.c:554: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   77B7 DD 66 FC      [19] 3216 	ld	h,-4 (ix)
   77BA DD 6E FE      [19] 3217 	ld	l,-2 (ix)
   77BD E5            [11] 3218 	push	hl
   77BE 2A 03 65      [16] 3219 	ld	hl,(_mapa)
   77C1 E5            [11] 3220 	push	hl
   77C2 CD 61 4B      [17] 3221 	call	_getTilePtr
   77C5 F1            [10] 3222 	pop	af
   77C6 F1            [10] 3223 	pop	af
   77C7 DD 74 FB      [19] 3224 	ld	-5 (ix),h
   77CA DD 75 FA      [19] 3225 	ld	-6 (ix), l
   77CD DD 66 FB      [19] 3226 	ld	h,-5 (ix)
   77D0 7E            [ 7] 3227 	ld	a,(hl)
   77D1 DD 77 FA      [19] 3228 	ld	-6 (ix),a
   77D4 3E 02         [ 7] 3229 	ld	a,#0x02
   77D6 DD 96 FA      [19] 3230 	sub	a, -6 (ix)
   77D9 DA 66 78      [10] 3231 	jp	C,00177$
                           3232 ;src/main.c:555: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   77DC DD 6E F3      [19] 3233 	ld	l,-13 (ix)
   77DF DD 66 F4      [19] 3234 	ld	h,-12 (ix)
   77E2 7E            [ 7] 3235 	ld	a,(hl)
   77E3 C6 0B         [ 7] 3236 	add	a, #0x0B
   77E5 DD 77 FA      [19] 3237 	ld	-6 (ix),a
   77E8 DD 6E F1      [19] 3238 	ld	l,-15 (ix)
   77EB DD 66 F2      [19] 3239 	ld	h,-14 (ix)
   77EE 7E            [ 7] 3240 	ld	a,(hl)
   77EF DD 77 F9      [19] 3241 	ld	-7 (ix),a
   77F2 DD 66 FA      [19] 3242 	ld	h,-6 (ix)
   77F5 DD 6E F9      [19] 3243 	ld	l,-7 (ix)
   77F8 E5            [11] 3244 	push	hl
   77F9 2A 03 65      [16] 3245 	ld	hl,(_mapa)
   77FC E5            [11] 3246 	push	hl
   77FD CD 61 4B      [17] 3247 	call	_getTilePtr
   7800 F1            [10] 3248 	pop	af
   7801 F1            [10] 3249 	pop	af
   7802 DD 74 FB      [19] 3250 	ld	-5 (ix),h
   7805 DD 75 FA      [19] 3251 	ld	-6 (ix), l
   7808 DD 66 FB      [19] 3252 	ld	h,-5 (ix)
   780B 7E            [ 7] 3253 	ld	a,(hl)
   780C DD 77 FA      [19] 3254 	ld	-6 (ix),a
   780F 3E 02         [ 7] 3255 	ld	a,#0x02
   7811 DD 96 FA      [19] 3256 	sub	a, -6 (ix)
   7814 38 50         [12] 3257 	jr	C,00177$
                           3258 ;src/main.c:556: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7816 DD 6E F3      [19] 3259 	ld	l,-13 (ix)
   7819 DD 66 F4      [19] 3260 	ld	h,-12 (ix)
   781C 7E            [ 7] 3261 	ld	a,(hl)
   781D C6 16         [ 7] 3262 	add	a, #0x16
   781F DD 77 FA      [19] 3263 	ld	-6 (ix),a
   7822 DD 6E F1      [19] 3264 	ld	l,-15 (ix)
   7825 DD 66 F2      [19] 3265 	ld	h,-14 (ix)
   7828 7E            [ 7] 3266 	ld	a,(hl)
   7829 DD 77 F9      [19] 3267 	ld	-7 (ix),a
   782C DD 66 FA      [19] 3268 	ld	h,-6 (ix)
   782F DD 6E F9      [19] 3269 	ld	l,-7 (ix)
   7832 E5            [11] 3270 	push	hl
   7833 2A 03 65      [16] 3271 	ld	hl,(_mapa)
   7836 E5            [11] 3272 	push	hl
   7837 CD 61 4B      [17] 3273 	call	_getTilePtr
   783A F1            [10] 3274 	pop	af
   783B F1            [10] 3275 	pop	af
   783C DD 74 FB      [19] 3276 	ld	-5 (ix),h
   783F DD 75 FA      [19] 3277 	ld	-6 (ix), l
   7842 DD 66 FB      [19] 3278 	ld	h,-5 (ix)
   7845 7E            [ 7] 3279 	ld	a,(hl)
   7846 DD 77 FA      [19] 3280 	ld	-6 (ix),a
   7849 3E 02         [ 7] 3281 	ld	a,#0x02
   784B DD 96 FA      [19] 3282 	sub	a, -6 (ix)
   784E 38 16         [12] 3283 	jr	C,00177$
                           3284 ;src/main.c:557: moverEnemigoIzquierda(enemy);
   7850 DD 6E F1      [19] 3285 	ld	l,-15 (ix)
   7853 DD 66 F2      [19] 3286 	ld	h,-14 (ix)
   7856 E5            [11] 3287 	push	hl
   7857 CD A1 6B      [17] 3288 	call	_moverEnemigoIzquierda
   785A F1            [10] 3289 	pop	af
                           3290 ;src/main.c:558: enemy->mover = SI;
   785B DD 6E F5      [19] 3291 	ld	l,-11 (ix)
   785E DD 66 F6      [19] 3292 	ld	h,-10 (ix)
   7861 36 01         [10] 3293 	ld	(hl),#0x01
   7863 C3 27 79      [10] 3294 	jp	00205$
   7866                    3295 00177$:
                           3296 ;src/main.c:560: moverEnemigoDerecha(enemy);
   7866 DD 6E F1      [19] 3297 	ld	l,-15 (ix)
   7869 DD 66 F2      [19] 3298 	ld	h,-14 (ix)
   786C E5            [11] 3299 	push	hl
   786D CD 91 6B      [17] 3300 	call	_moverEnemigoDerecha
   7870 F1            [10] 3301 	pop	af
                           3302 ;src/main.c:561: enemy->mover = SI;
   7871 DD 6E F5      [19] 3303 	ld	l,-11 (ix)
   7874 DD 66 F6      [19] 3304 	ld	h,-10 (ix)
   7877 36 01         [10] 3305 	ld	(hl),#0x01
   7879 C3 27 79      [10] 3306 	jp	00205$
   787C                    3307 00187$:
                           3308 ;src/main.c:564: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   787C DD 7E FE      [19] 3309 	ld	a,-2 (ix)
   787F C6 04         [ 7] 3310 	add	a, #0x04
   7881 DD 77 FE      [19] 3311 	ld	-2 (ix),a
   7884 DD 66 FC      [19] 3312 	ld	h,-4 (ix)
   7887 DD 6E FE      [19] 3313 	ld	l,-2 (ix)
   788A E5            [11] 3314 	push	hl
   788B 2A 03 65      [16] 3315 	ld	hl,(_mapa)
   788E E5            [11] 3316 	push	hl
   788F CD 61 4B      [17] 3317 	call	_getTilePtr
   7892 F1            [10] 3318 	pop	af
   7893 F1            [10] 3319 	pop	af
   7894 DD 74 FF      [19] 3320 	ld	-1 (ix),h
   7897 DD 75 FE      [19] 3321 	ld	-2 (ix), l
   789A DD 66 FF      [19] 3322 	ld	h,-1 (ix)
   789D 7E            [ 7] 3323 	ld	a,(hl)
   789E DD 77 FE      [19] 3324 	ld	-2 (ix),a
   78A1 3E 02         [ 7] 3325 	ld	a,#0x02
   78A3 DD 96 FE      [19] 3326 	sub	a, -2 (ix)
   78A6 38 6C         [12] 3327 	jr	C,00182$
                           3328 ;src/main.c:565: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78A8 DD 6E F3      [19] 3329 	ld	l,-13 (ix)
   78AB DD 66 F4      [19] 3330 	ld	h,-12 (ix)
   78AE 7E            [ 7] 3331 	ld	a,(hl)
   78AF C6 0B         [ 7] 3332 	add	a, #0x0B
   78B1 DD 77 FE      [19] 3333 	ld	-2 (ix),a
   78B4 DD 6E F1      [19] 3334 	ld	l,-15 (ix)
   78B7 DD 66 F2      [19] 3335 	ld	h,-14 (ix)
   78BA 7E            [ 7] 3336 	ld	a,(hl)
   78BB DD 77 FC      [19] 3337 	ld	-4 (ix), a
   78BE C6 04         [ 7] 3338 	add	a, #0x04
   78C0 DD 77 FC      [19] 3339 	ld	-4 (ix),a
   78C3 DD 66 FE      [19] 3340 	ld	h,-2 (ix)
   78C6 DD 6E FC      [19] 3341 	ld	l,-4 (ix)
   78C9 E5            [11] 3342 	push	hl
   78CA 2A 03 65      [16] 3343 	ld	hl,(_mapa)
   78CD E5            [11] 3344 	push	hl
   78CE CD 61 4B      [17] 3345 	call	_getTilePtr
   78D1 F1            [10] 3346 	pop	af
   78D2 F1            [10] 3347 	pop	af
   78D3 4E            [ 7] 3348 	ld	c,(hl)
   78D4 3E 02         [ 7] 3349 	ld	a,#0x02
   78D6 91            [ 4] 3350 	sub	a, c
   78D7 38 3B         [12] 3351 	jr	C,00182$
                           3352 ;src/main.c:566: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78D9 DD 6E F3      [19] 3353 	ld	l,-13 (ix)
   78DC DD 66 F4      [19] 3354 	ld	h,-12 (ix)
   78DF 7E            [ 7] 3355 	ld	a,(hl)
   78E0 C6 16         [ 7] 3356 	add	a, #0x16
   78E2 4F            [ 4] 3357 	ld	c,a
   78E3 DD 6E F1      [19] 3358 	ld	l,-15 (ix)
   78E6 DD 66 F2      [19] 3359 	ld	h,-14 (ix)
   78E9 5E            [ 7] 3360 	ld	e,(hl)
   78EA 1C            [ 4] 3361 	inc	e
   78EB 1C            [ 4] 3362 	inc	e
   78EC 1C            [ 4] 3363 	inc	e
   78ED 1C            [ 4] 3364 	inc	e
   78EE 51            [ 4] 3365 	ld	d, c
   78EF D5            [11] 3366 	push	de
   78F0 2A 03 65      [16] 3367 	ld	hl,(_mapa)
   78F3 E5            [11] 3368 	push	hl
   78F4 CD 61 4B      [17] 3369 	call	_getTilePtr
   78F7 F1            [10] 3370 	pop	af
   78F8 F1            [10] 3371 	pop	af
   78F9 4E            [ 7] 3372 	ld	c,(hl)
   78FA 3E 02         [ 7] 3373 	ld	a,#0x02
   78FC 91            [ 4] 3374 	sub	a, c
   78FD 38 15         [12] 3375 	jr	C,00182$
                           3376 ;src/main.c:567: moverEnemigoDerecha(enemy);
   78FF DD 6E F1      [19] 3377 	ld	l,-15 (ix)
   7902 DD 66 F2      [19] 3378 	ld	h,-14 (ix)
   7905 E5            [11] 3379 	push	hl
   7906 CD 91 6B      [17] 3380 	call	_moverEnemigoDerecha
   7909 F1            [10] 3381 	pop	af
                           3382 ;src/main.c:568: enemy->mover = SI;
   790A DD 6E F5      [19] 3383 	ld	l,-11 (ix)
   790D DD 66 F6      [19] 3384 	ld	h,-10 (ix)
   7910 36 01         [10] 3385 	ld	(hl),#0x01
   7912 18 13         [12] 3386 	jr	00205$
   7914                    3387 00182$:
                           3388 ;src/main.c:571: moverEnemigoIzquierda(enemy);
   7914 DD 6E F1      [19] 3389 	ld	l,-15 (ix)
   7917 DD 66 F2      [19] 3390 	ld	h,-14 (ix)
   791A E5            [11] 3391 	push	hl
   791B CD A1 6B      [17] 3392 	call	_moverEnemigoIzquierda
   791E F1            [10] 3393 	pop	af
                           3394 ;src/main.c:572: enemy->mover = SI;
   791F DD 6E F5      [19] 3395 	ld	l,-11 (ix)
   7922 DD 66 F6      [19] 3396 	ld	h,-10 (ix)
   7925 36 01         [10] 3397 	ld	(hl),#0x01
   7927                    3398 00205$:
   7927 DD F9         [10] 3399 	ld	sp, ix
   7929 DD E1         [14] 3400 	pop	ix
   792B C9            [10] 3401 	ret
                           3402 ;src/main.c:582: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3403 ;	---------------------------------
                           3404 ; Function updateEnemy
                           3405 ; ---------------------------------
   792C                    3406 _updateEnemy::
   792C DD E5         [15] 3407 	push	ix
   792E DD 21 00 00   [14] 3408 	ld	ix,#0
   7932 DD 39         [15] 3409 	add	ix,sp
   7934 21 F4 FF      [10] 3410 	ld	hl,#-12
   7937 39            [11] 3411 	add	hl,sp
   7938 F9            [ 6] 3412 	ld	sp,hl
                           3413 ;src/main.c:589: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7939 DD 4E 04      [19] 3414 	ld	c,4 (ix)
   793C DD 46 05      [19] 3415 	ld	b,5 (ix)
   793F 21 16 00      [10] 3416 	ld	hl,#0x0016
   7942 09            [11] 3417 	add	hl,bc
   7943 DD 75 FC      [19] 3418 	ld	-4 (ix),l
   7946 DD 74 FD      [19] 3419 	ld	-3 (ix),h
   7949 DD 6E FC      [19] 3420 	ld	l,-4 (ix)
   794C DD 66 FD      [19] 3421 	ld	h,-3 (ix)
   794F 7E            [ 7] 3422 	ld	a,(hl)
   7950 B7            [ 4] 3423 	or	a, a
   7951 28 19         [12] 3424 	jr	Z,00115$
                           3425 ;src/main.c:590: enemy->patrolling = 0;
   7953 21 A8 60      [10] 3426 	ld	hl,#(_enemy + 0x000b)
   7956 36 00         [10] 3427 	ld	(hl),#0x00
                           3428 ;src/main.c:591: engage(actual, prota.x, prota.y);
   7958 3A 26 64      [13] 3429 	ld	a, (#_prota + 1)
   795B 21 25 64      [10] 3430 	ld	hl, #_prota + 0
   795E 56            [ 7] 3431 	ld	d,(hl)
   795F F5            [11] 3432 	push	af
   7960 33            [ 6] 3433 	inc	sp
   7961 D5            [11] 3434 	push	de
   7962 33            [ 6] 3435 	inc	sp
   7963 C5            [11] 3436 	push	bc
   7964 CD A7 70      [17] 3437 	call	_engage
   7967 F1            [10] 3438 	pop	af
   7968 F1            [10] 3439 	pop	af
   7969 C3 88 7A      [10] 3440 	jp	00117$
   796C                    3441 00115$:
                           3442 ;src/main.c:593: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   796C C5            [11] 3443 	push	bc
   796D C5            [11] 3444 	push	bc
   796E CD FC 6D      [17] 3445 	call	_lookFor
   7971 F1            [10] 3446 	pop	af
   7972 C1            [10] 3447 	pop	bc
                           3448 ;src/main.c:599: actual->patrolling = 0;
   7973 21 0B 00      [10] 3449 	ld	hl,#0x000B
   7976 09            [11] 3450 	add	hl,bc
   7977 DD 75 F6      [19] 3451 	ld	-10 (ix),l
   797A DD 74 F7      [19] 3452 	ld	-9 (ix),h
                           3453 ;src/main.c:594: if (actual->patrolling) {
   797D DD 6E F6      [19] 3454 	ld	l,-10 (ix)
   7980 DD 66 F7      [19] 3455 	ld	h,-9 (ix)
   7983 6E            [ 7] 3456 	ld	l,(hl)
                           3457 ;src/main.c:597: if (actual->in_range) {
   7984 79            [ 4] 3458 	ld	a,c
   7985 C6 11         [ 7] 3459 	add	a, #0x11
   7987 5F            [ 4] 3460 	ld	e,a
   7988 78            [ 4] 3461 	ld	a,b
   7989 CE 00         [ 7] 3462 	adc	a, #0x00
   798B 57            [ 4] 3463 	ld	d,a
                           3464 ;src/main.c:605: actual->seek = 1;
   798C 79            [ 4] 3465 	ld	a,c
   798D C6 14         [ 7] 3466 	add	a, #0x14
   798F DD 77 F4      [19] 3467 	ld	-12 (ix),a
   7992 78            [ 4] 3468 	ld	a,b
   7993 CE 00         [ 7] 3469 	adc	a, #0x00
   7995 DD 77 F5      [19] 3470 	ld	-11 (ix),a
                           3471 ;src/main.c:594: if (actual->patrolling) {
   7998 7D            [ 4] 3472 	ld	a,l
   7999 B7            [ 4] 3473 	or	a, a
   799A CA 58 7A      [10] 3474 	jp	Z,00112$
                           3475 ;src/main.c:596: moverEnemigoPatrol(actual);
   799D C5            [11] 3476 	push	bc
   799E D5            [11] 3477 	push	de
   799F C5            [11] 3478 	push	bc
   79A0 CD B3 6B      [17] 3479 	call	_moverEnemigoPatrol
   79A3 F1            [10] 3480 	pop	af
   79A4 D1            [10] 3481 	pop	de
   79A5 C1            [10] 3482 	pop	bc
                           3483 ;src/main.c:597: if (actual->in_range) {
   79A6 1A            [ 7] 3484 	ld	a,(de)
   79A7 B7            [ 4] 3485 	or	a, a
   79A8 28 24         [12] 3486 	jr	Z,00104$
                           3487 ;src/main.c:598: engage(actual, prota.x, prota.y);
   79AA 3A 26 64      [13] 3488 	ld	a, (#_prota + 1)
   79AD 21 25 64      [10] 3489 	ld	hl, #_prota + 0
   79B0 56            [ 7] 3490 	ld	d,(hl)
   79B1 F5            [11] 3491 	push	af
   79B2 33            [ 6] 3492 	inc	sp
   79B3 D5            [11] 3493 	push	de
   79B4 33            [ 6] 3494 	inc	sp
   79B5 C5            [11] 3495 	push	bc
   79B6 CD A7 70      [17] 3496 	call	_engage
   79B9 F1            [10] 3497 	pop	af
   79BA F1            [10] 3498 	pop	af
                           3499 ;src/main.c:599: actual->patrolling = 0;
   79BB DD 6E F6      [19] 3500 	ld	l,-10 (ix)
   79BE DD 66 F7      [19] 3501 	ld	h,-9 (ix)
   79C1 36 00         [10] 3502 	ld	(hl),#0x00
                           3503 ;src/main.c:600: actual->engage = 1;
   79C3 DD 6E FC      [19] 3504 	ld	l,-4 (ix)
   79C6 DD 66 FD      [19] 3505 	ld	h,-3 (ix)
   79C9 36 01         [10] 3506 	ld	(hl),#0x01
   79CB C3 88 7A      [10] 3507 	jp	00117$
   79CE                    3508 00104$:
                           3509 ;src/main.c:601: } else if (actual->seen) {
   79CE 21 12 00      [10] 3510 	ld	hl,#0x0012
   79D1 09            [11] 3511 	add	hl,bc
   79D2 DD 75 F9      [19] 3512 	ld	-7 (ix),l
   79D5 DD 74 FA      [19] 3513 	ld	-6 (ix),h
   79D8 DD 6E F9      [19] 3514 	ld	l,-7 (ix)
   79DB DD 66 FA      [19] 3515 	ld	h,-6 (ix)
   79DE 7E            [ 7] 3516 	ld	a,(hl)
   79DF B7            [ 4] 3517 	or	a, a
   79E0 CA 88 7A      [10] 3518 	jp	Z,00117$
                           3519 ;src/main.c:602: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79E3 3A 26 64      [13] 3520 	ld	a,(#_prota + 1)
   79E6 DD 77 FB      [19] 3521 	ld	-5 (ix),a
   79E9 21 25 64      [10] 3522 	ld	hl, #_prota + 0
   79EC 5E            [ 7] 3523 	ld	e,(hl)
   79ED 21 01 00      [10] 3524 	ld	hl,#0x0001
   79F0 09            [11] 3525 	add	hl,bc
   79F1 DD 75 FE      [19] 3526 	ld	-2 (ix),l
   79F4 DD 74 FF      [19] 3527 	ld	-1 (ix),h
   79F7 DD 6E FE      [19] 3528 	ld	l,-2 (ix)
   79FA DD 66 FF      [19] 3529 	ld	h,-1 (ix)
   79FD 56            [ 7] 3530 	ld	d,(hl)
   79FE 0A            [ 7] 3531 	ld	a,(bc)
   79FF DD 77 F8      [19] 3532 	ld	-8 (ix),a
   7A02 C5            [11] 3533 	push	bc
   7A03 2A 03 65      [16] 3534 	ld	hl,(_mapa)
   7A06 E5            [11] 3535 	push	hl
   7A07 C5            [11] 3536 	push	bc
   7A08 DD 7E FB      [19] 3537 	ld	a,-5 (ix)
   7A0B F5            [11] 3538 	push	af
   7A0C 33            [ 6] 3539 	inc	sp
   7A0D 7B            [ 4] 3540 	ld	a,e
   7A0E F5            [11] 3541 	push	af
   7A0F 33            [ 6] 3542 	inc	sp
   7A10 D5            [11] 3543 	push	de
   7A11 33            [ 6] 3544 	inc	sp
   7A12 DD 7E F8      [19] 3545 	ld	a,-8 (ix)
   7A15 F5            [11] 3546 	push	af
   7A16 33            [ 6] 3547 	inc	sp
   7A17 CD 30 44      [17] 3548 	call	_pathFinding
   7A1A 21 08 00      [10] 3549 	ld	hl,#8
   7A1D 39            [11] 3550 	add	hl,sp
   7A1E F9            [ 6] 3551 	ld	sp,hl
   7A1F C1            [10] 3552 	pop	bc
                           3553 ;src/main.c:603: actual->p_seek_x = actual->x;
   7A20 21 17 00      [10] 3554 	ld	hl,#0x0017
   7A23 09            [11] 3555 	add	hl,bc
   7A24 EB            [ 4] 3556 	ex	de,hl
   7A25 0A            [ 7] 3557 	ld	a,(bc)
   7A26 12            [ 7] 3558 	ld	(de),a
                           3559 ;src/main.c:604: actual->p_seek_y = actual->y;
   7A27 21 18 00      [10] 3560 	ld	hl,#0x0018
   7A2A 09            [11] 3561 	add	hl,bc
   7A2B EB            [ 4] 3562 	ex	de,hl
   7A2C DD 6E FE      [19] 3563 	ld	l,-2 (ix)
   7A2F DD 66 FF      [19] 3564 	ld	h,-1 (ix)
   7A32 7E            [ 7] 3565 	ld	a,(hl)
   7A33 12            [ 7] 3566 	ld	(de),a
                           3567 ;src/main.c:605: actual->seek = 1;
   7A34 E1            [10] 3568 	pop	hl
   7A35 E5            [11] 3569 	push	hl
   7A36 36 01         [10] 3570 	ld	(hl),#0x01
                           3571 ;src/main.c:606: actual->iter=0;
   7A38 21 0E 00      [10] 3572 	ld	hl,#0x000E
   7A3B 09            [11] 3573 	add	hl,bc
   7A3C AF            [ 4] 3574 	xor	a, a
   7A3D 77            [ 7] 3575 	ld	(hl), a
   7A3E 23            [ 6] 3576 	inc	hl
   7A3F 77            [ 7] 3577 	ld	(hl), a
                           3578 ;src/main.c:607: actual->reversePatrol = NO;
   7A40 21 0C 00      [10] 3579 	ld	hl,#0x000C
   7A43 09            [11] 3580 	add	hl,bc
   7A44 36 00         [10] 3581 	ld	(hl),#0x00
                           3582 ;src/main.c:608: actual->patrolling = 0;
   7A46 DD 6E F6      [19] 3583 	ld	l,-10 (ix)
   7A49 DD 66 F7      [19] 3584 	ld	h,-9 (ix)
   7A4C 36 00         [10] 3585 	ld	(hl),#0x00
                           3586 ;src/main.c:609: actual->seen = 0;
   7A4E DD 6E F9      [19] 3587 	ld	l,-7 (ix)
   7A51 DD 66 FA      [19] 3588 	ld	h,-6 (ix)
   7A54 36 00         [10] 3589 	ld	(hl),#0x00
   7A56 18 30         [12] 3590 	jr	00117$
   7A58                    3591 00112$:
                           3592 ;src/main.c:611: } else if (actual->seek) {
   7A58 E1            [10] 3593 	pop	hl
   7A59 E5            [11] 3594 	push	hl
   7A5A 7E            [ 7] 3595 	ld	a,(hl)
   7A5B B7            [ 4] 3596 	or	a, a
   7A5C 28 2A         [12] 3597 	jr	Z,00117$
                           3598 ;src/main.c:612: moverEnemigoSeek(actual);
   7A5E C5            [11] 3599 	push	bc
   7A5F D5            [11] 3600 	push	de
   7A60 C5            [11] 3601 	push	bc
   7A61 CD 02 6F      [17] 3602 	call	_moverEnemigoSeek
   7A64 F1            [10] 3603 	pop	af
   7A65 D1            [10] 3604 	pop	de
   7A66 C1            [10] 3605 	pop	bc
                           3606 ;src/main.c:613: if (actual->in_range) {
   7A67 1A            [ 7] 3607 	ld	a,(de)
   7A68 B7            [ 4] 3608 	or	a, a
   7A69 28 1D         [12] 3609 	jr	Z,00117$
                           3610 ;src/main.c:614: engage(actual, prota.x, prota.y);
   7A6B 3A 26 64      [13] 3611 	ld	a, (#_prota + 1)
   7A6E 21 25 64      [10] 3612 	ld	hl, #_prota + 0
   7A71 56            [ 7] 3613 	ld	d,(hl)
   7A72 F5            [11] 3614 	push	af
   7A73 33            [ 6] 3615 	inc	sp
   7A74 D5            [11] 3616 	push	de
   7A75 33            [ 6] 3617 	inc	sp
   7A76 C5            [11] 3618 	push	bc
   7A77 CD A7 70      [17] 3619 	call	_engage
   7A7A F1            [10] 3620 	pop	af
   7A7B F1            [10] 3621 	pop	af
                           3622 ;src/main.c:615: actual->seek = 0;
   7A7C E1            [10] 3623 	pop	hl
   7A7D E5            [11] 3624 	push	hl
   7A7E 36 00         [10] 3625 	ld	(hl),#0x00
                           3626 ;src/main.c:616: actual->engage = 1;
   7A80 DD 6E FC      [19] 3627 	ld	l,-4 (ix)
   7A83 DD 66 FD      [19] 3628 	ld	h,-3 (ix)
   7A86 36 01         [10] 3629 	ld	(hl),#0x01
                           3630 ;src/main.c:617: } else if (actual->seen) {
   7A88                    3631 00117$:
   7A88 DD F9         [10] 3632 	ld	sp, ix
   7A8A DD E1         [14] 3633 	pop	ix
   7A8C C9            [10] 3634 	ret
                           3635 ;src/main.c:624: void inicializarEnemy() {
                           3636 ;	---------------------------------
                           3637 ; Function inicializarEnemy
                           3638 ; ---------------------------------
   7A8D                    3639 _inicializarEnemy::
   7A8D DD E5         [15] 3640 	push	ix
   7A8F DD 21 00 00   [14] 3641 	ld	ix,#0
   7A93 DD 39         [15] 3642 	add	ix,sp
   7A95 21 F9 FF      [10] 3643 	ld	hl,#-7
   7A98 39            [11] 3644 	add	hl,sp
   7A99 F9            [ 6] 3645 	ld	sp,hl
                           3646 ;src/main.c:625: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7A9A 3A 05 65      [13] 3647 	ld	a,(#_num_mapa + 0)
   7A9D C6 02         [ 7] 3648 	add	a, #0x02
   7A9F DD 77 FD      [19] 3649 	ld	-3 (ix),a
                           3650 ;src/main.c:635: actual = enemy;
   7AA2 11 9D 60      [10] 3651 	ld	de,#_enemy+0
                           3652 ;src/main.c:636: while(i){
   7AA5                    3653 00101$:
   7AA5 DD 7E FD      [19] 3654 	ld	a,-3 (ix)
   7AA8 B7            [ 4] 3655 	or	a, a
   7AA9 CA 99 7B      [10] 3656 	jp	Z,00104$
                           3657 ;src/main.c:637: --i;
   7AAC DD 35 FD      [23] 3658 	dec	-3 (ix)
                           3659 ;src/main.c:638: actual->x = actual->px = spawnX[i];
   7AAF 4B            [ 4] 3660 	ld	c, e
   7AB0 42            [ 4] 3661 	ld	b, d
   7AB1 03            [ 6] 3662 	inc	bc
   7AB2 03            [ 6] 3663 	inc	bc
   7AB3 3E 27         [ 7] 3664 	ld	a,#<(_spawnX)
   7AB5 DD 86 FD      [19] 3665 	add	a, -3 (ix)
   7AB8 DD 77 FB      [19] 3666 	ld	-5 (ix),a
   7ABB 3E 65         [ 7] 3667 	ld	a,#>(_spawnX)
   7ABD CE 00         [ 7] 3668 	adc	a, #0x00
   7ABF DD 77 FC      [19] 3669 	ld	-4 (ix),a
   7AC2 DD 6E FB      [19] 3670 	ld	l,-5 (ix)
   7AC5 DD 66 FC      [19] 3671 	ld	h,-4 (ix)
   7AC8 7E            [ 7] 3672 	ld	a,(hl)
   7AC9 02            [ 7] 3673 	ld	(bc),a
   7ACA 12            [ 7] 3674 	ld	(de),a
                           3675 ;src/main.c:639: actual->y = actual->py = spawnY[i];
   7ACB D5            [11] 3676 	push	de
   7ACC FD E1         [14] 3677 	pop	iy
   7ACE FD 23         [10] 3678 	inc	iy
   7AD0 4B            [ 4] 3679 	ld	c, e
   7AD1 42            [ 4] 3680 	ld	b, d
   7AD2 03            [ 6] 3681 	inc	bc
   7AD3 03            [ 6] 3682 	inc	bc
   7AD4 03            [ 6] 3683 	inc	bc
   7AD5 3E 2B         [ 7] 3684 	ld	a,#<(_spawnY)
   7AD7 DD 86 FD      [19] 3685 	add	a, -3 (ix)
   7ADA DD 77 F9      [19] 3686 	ld	-7 (ix),a
   7ADD 3E 65         [ 7] 3687 	ld	a,#>(_spawnY)
   7ADF CE 00         [ 7] 3688 	adc	a, #0x00
   7AE1 DD 77 FA      [19] 3689 	ld	-6 (ix),a
   7AE4 E1            [10] 3690 	pop	hl
   7AE5 E5            [11] 3691 	push	hl
   7AE6 7E            [ 7] 3692 	ld	a,(hl)
   7AE7 02            [ 7] 3693 	ld	(bc),a
   7AE8 FD 77 00      [19] 3694 	ld	0 (iy), a
                           3695 ;src/main.c:640: actual->mover  = NO;
   7AEB 21 06 00      [10] 3696 	ld	hl,#0x0006
   7AEE 19            [11] 3697 	add	hl,de
   7AEF 36 00         [10] 3698 	ld	(hl),#0x00
                           3699 ;src/main.c:641: actual->mira   = M_abajo;
   7AF1 21 07 00      [10] 3700 	ld	hl,#0x0007
   7AF4 19            [11] 3701 	add	hl,de
   7AF5 36 03         [10] 3702 	ld	(hl),#0x03
                           3703 ;src/main.c:642: actual->sprite = g_enemy;
   7AF7 21 04 00      [10] 3704 	ld	hl,#0x0004
   7AFA 19            [11] 3705 	add	hl,de
   7AFB 36 3A         [10] 3706 	ld	(hl),#<(_g_enemy)
   7AFD 23            [ 6] 3707 	inc	hl
   7AFE 36 3C         [10] 3708 	ld	(hl),#>(_g_enemy)
                           3709 ;src/main.c:643: actual->muerto = NO;
   7B00 21 08 00      [10] 3710 	ld	hl,#0x0008
   7B03 19            [11] 3711 	add	hl,de
   7B04 36 00         [10] 3712 	ld	(hl),#0x00
                           3713 ;src/main.c:644: actual->muertes = 0;
   7B06 21 0A 00      [10] 3714 	ld	hl,#0x000A
   7B09 19            [11] 3715 	add	hl,de
   7B0A 36 00         [10] 3716 	ld	(hl),#0x00
                           3717 ;src/main.c:645: actual->patrolling = SI;
   7B0C 21 0B 00      [10] 3718 	ld	hl,#0x000B
   7B0F 19            [11] 3719 	add	hl,de
   7B10 36 01         [10] 3720 	ld	(hl),#0x01
                           3721 ;src/main.c:646: actual->reversePatrol = NO;
   7B12 21 0C 00      [10] 3722 	ld	hl,#0x000C
   7B15 19            [11] 3723 	add	hl,de
   7B16 36 00         [10] 3724 	ld	(hl),#0x00
                           3725 ;src/main.c:647: actual->iter = 0;
   7B18 21 0E 00      [10] 3726 	ld	hl,#0x000E
   7B1B 19            [11] 3727 	add	hl,de
   7B1C AF            [ 4] 3728 	xor	a, a
   7B1D 77            [ 7] 3729 	ld	(hl), a
   7B1E 23            [ 6] 3730 	inc	hl
   7B1F 77            [ 7] 3731 	ld	(hl), a
                           3732 ;src/main.c:648: actual->lastIter = 0;
   7B20 21 10 00      [10] 3733 	ld	hl,#0x0010
   7B23 19            [11] 3734 	add	hl,de
   7B24 36 00         [10] 3735 	ld	(hl),#0x00
                           3736 ;src/main.c:649: actual->seen = 0;
   7B26 21 12 00      [10] 3737 	ld	hl,#0x0012
   7B29 19            [11] 3738 	add	hl,de
   7B2A 36 00         [10] 3739 	ld	(hl),#0x00
                           3740 ;src/main.c:650: actual->found = 0;
   7B2C 21 13 00      [10] 3741 	ld	hl,#0x0013
   7B2F 19            [11] 3742 	add	hl,de
   7B30 36 00         [10] 3743 	ld	(hl),#0x00
                           3744 ;src/main.c:651: actual->engage = 0;
   7B32 21 16 00      [10] 3745 	ld	hl,#0x0016
   7B35 19            [11] 3746 	add	hl,de
   7B36 36 00         [10] 3747 	ld	(hl),#0x00
                           3748 ;src/main.c:652: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B38 21 05 65      [10] 3749 	ld	hl,#_num_mapa + 0
   7B3B 4E            [ 7] 3750 	ld	c, (hl)
   7B3C 0C            [ 4] 3751 	inc	c
   7B3D 06 00         [ 7] 3752 	ld	b,#0x00
   7B3F 69            [ 4] 3753 	ld	l, c
   7B40 60            [ 4] 3754 	ld	h, b
   7B41 29            [11] 3755 	add	hl, hl
   7B42 29            [11] 3756 	add	hl, hl
   7B43 09            [11] 3757 	add	hl, bc
   7B44 4D            [ 4] 3758 	ld	c,l
   7B45 44            [ 4] 3759 	ld	b,h
   7B46 21 43 65      [10] 3760 	ld	hl,#_patrolY
   7B49 09            [11] 3761 	add	hl,bc
   7B4A 7D            [ 4] 3762 	ld	a,l
   7B4B DD 86 FD      [19] 3763 	add	a, -3 (ix)
   7B4E 6F            [ 4] 3764 	ld	l,a
   7B4F 7C            [ 4] 3765 	ld	a,h
   7B50 CE 00         [ 7] 3766 	adc	a, #0x00
   7B52 67            [ 4] 3767 	ld	h,a
   7B53 7E            [ 7] 3768 	ld	a,(hl)
   7B54 DD 77 FF      [19] 3769 	ld	-1 (ix),a
   7B57 21 2F 65      [10] 3770 	ld	hl,#_patrolX
   7B5A 09            [11] 3771 	add	hl,bc
   7B5B DD 4E FD      [19] 3772 	ld	c,-3 (ix)
   7B5E 06 00         [ 7] 3773 	ld	b,#0x00
   7B60 09            [11] 3774 	add	hl,bc
   7B61 7E            [ 7] 3775 	ld	a,(hl)
   7B62 DD 77 FE      [19] 3776 	ld	-2 (ix),a
   7B65 E1            [10] 3777 	pop	hl
   7B66 E5            [11] 3778 	push	hl
   7B67 4E            [ 7] 3779 	ld	c,(hl)
   7B68 DD 6E FB      [19] 3780 	ld	l,-5 (ix)
   7B6B DD 66 FC      [19] 3781 	ld	h,-4 (ix)
   7B6E 46            [ 7] 3782 	ld	b,(hl)
   7B6F D5            [11] 3783 	push	de
   7B70 2A 03 65      [16] 3784 	ld	hl,(_mapa)
   7B73 E5            [11] 3785 	push	hl
   7B74 D5            [11] 3786 	push	de
   7B75 DD 66 FF      [19] 3787 	ld	h,-1 (ix)
   7B78 DD 6E FE      [19] 3788 	ld	l,-2 (ix)
   7B7B E5            [11] 3789 	push	hl
   7B7C 79            [ 4] 3790 	ld	a,c
   7B7D F5            [11] 3791 	push	af
   7B7E 33            [ 6] 3792 	inc	sp
   7B7F C5            [11] 3793 	push	bc
   7B80 33            [ 6] 3794 	inc	sp
   7B81 CD 30 44      [17] 3795 	call	_pathFinding
   7B84 21 08 00      [10] 3796 	ld	hl,#8
   7B87 39            [11] 3797 	add	hl,sp
   7B88 F9            [ 6] 3798 	ld	sp,hl
   7B89 D1            [10] 3799 	pop	de
                           3800 ;src/main.c:653: dibujarEnemigo(actual);
   7B8A D5            [11] 3801 	push	de
   7B8B D5            [11] 3802 	push	de
   7B8C CD DD 67      [17] 3803 	call	_dibujarEnemigo
   7B8F F1            [10] 3804 	pop	af
   7B90 D1            [10] 3805 	pop	de
                           3806 ;src/main.c:654: ++actual;
   7B91 21 E2 00      [10] 3807 	ld	hl,#0x00E2
   7B94 19            [11] 3808 	add	hl,de
   7B95 EB            [ 4] 3809 	ex	de,hl
   7B96 C3 A5 7A      [10] 3810 	jp	00101$
   7B99                    3811 00104$:
   7B99 DD F9         [10] 3812 	ld	sp, ix
   7B9B DD E1         [14] 3813 	pop	ix
   7B9D C9            [10] 3814 	ret
                           3815 ;src/main.c:658: void avanzarMapa() {
                           3816 ;	---------------------------------
                           3817 ; Function avanzarMapa
                           3818 ; ---------------------------------
   7B9E                    3819 _avanzarMapa::
                           3820 ;src/main.c:659: if(num_mapa < NUM_MAPAS -1) {
   7B9E 3A 05 65      [13] 3821 	ld	a,(#_num_mapa + 0)
   7BA1 D6 02         [ 7] 3822 	sub	a, #0x02
   7BA3 30 34         [12] 3823 	jr	NC,00102$
                           3824 ;src/main.c:660: mapa = mapas[++num_mapa];
   7BA5 01 21 65      [10] 3825 	ld	bc,#_mapas+0
   7BA8 21 05 65      [10] 3826 	ld	hl, #_num_mapa+0
   7BAB 34            [11] 3827 	inc	(hl)
   7BAC FD 21 05 65   [14] 3828 	ld	iy,#_num_mapa
   7BB0 FD 6E 00      [19] 3829 	ld	l,0 (iy)
   7BB3 26 00         [ 7] 3830 	ld	h,#0x00
   7BB5 29            [11] 3831 	add	hl, hl
   7BB6 09            [11] 3832 	add	hl,bc
   7BB7 7E            [ 7] 3833 	ld	a,(hl)
   7BB8 FD 21 03 65   [14] 3834 	ld	iy,#_mapa
   7BBC FD 77 00      [19] 3835 	ld	0 (iy),a
   7BBF 23            [ 6] 3836 	inc	hl
   7BC0 7E            [ 7] 3837 	ld	a,(hl)
   7BC1 32 04 65      [13] 3838 	ld	(#_mapa + 1),a
                           3839 ;src/main.c:661: prota.x = prota.px = 2;
   7BC4 21 27 64      [10] 3840 	ld	hl,#(_prota + 0x0002)
   7BC7 36 02         [10] 3841 	ld	(hl),#0x02
   7BC9 21 25 64      [10] 3842 	ld	hl,#_prota
   7BCC 36 02         [10] 3843 	ld	(hl),#0x02
                           3844 ;src/main.c:662: prota.mover = SI;
   7BCE 21 2B 64      [10] 3845 	ld	hl,#(_prota + 0x0006)
   7BD1 36 01         [10] 3846 	ld	(hl),#0x01
                           3847 ;src/main.c:663: dibujarMapa();
   7BD3 CD 0B 65      [17] 3848 	call	_dibujarMapa
                           3849 ;src/main.c:664: inicializarEnemy();
   7BD6 C3 8D 7A      [10] 3850 	jp  _inicializarEnemy
   7BD9                    3851 00102$:
                           3852 ;src/main.c:667: menuFin(puntuacion);
   7BD9 FD 21 06 65   [14] 3853 	ld	iy,#_puntuacion
   7BDD FD 6E 00      [19] 3854 	ld	l,0 (iy)
   7BE0 26 00         [ 7] 3855 	ld	h,#0x00
   7BE2 C3 E5 4B      [10] 3856 	jp  _menuFin
                           3857 ;src/main.c:671: void moverIzquierda() {
                           3858 ;	---------------------------------
                           3859 ; Function moverIzquierda
                           3860 ; ---------------------------------
   7BE5                    3861 _moverIzquierda::
                           3862 ;src/main.c:672: prota.mira = M_izquierda;
   7BE5 01 25 64      [10] 3863 	ld	bc,#_prota+0
   7BE8 21 2C 64      [10] 3864 	ld	hl,#(_prota + 0x0007)
   7BEB 36 01         [10] 3865 	ld	(hl),#0x01
                           3866 ;src/main.c:673: if (!checkCollision(M_izquierda)) {
   7BED C5            [11] 3867 	push	bc
   7BEE 3E 01         [ 7] 3868 	ld	a,#0x01
   7BF0 F5            [11] 3869 	push	af
   7BF1 33            [ 6] 3870 	inc	sp
   7BF2 CD 6C 66      [17] 3871 	call	_checkCollision
   7BF5 33            [ 6] 3872 	inc	sp
   7BF6 C1            [10] 3873 	pop	bc
   7BF7 7D            [ 4] 3874 	ld	a,l
   7BF8 B7            [ 4] 3875 	or	a, a
   7BF9 C0            [11] 3876 	ret	NZ
                           3877 ;src/main.c:674: prota.x--;
   7BFA 0A            [ 7] 3878 	ld	a,(bc)
   7BFB C6 FF         [ 7] 3879 	add	a,#0xFF
   7BFD 02            [ 7] 3880 	ld	(bc),a
                           3881 ;src/main.c:675: prota.mover = SI;
   7BFE 21 2B 64      [10] 3882 	ld	hl,#(_prota + 0x0006)
   7C01 36 01         [10] 3883 	ld	(hl),#0x01
                           3884 ;src/main.c:676: prota.sprite = g_hero_left;
   7C03 21 C6 3D      [10] 3885 	ld	hl,#_g_hero_left
   7C06 22 29 64      [16] 3886 	ld	((_prota + 0x0004)), hl
   7C09 C9            [10] 3887 	ret
                           3888 ;src/main.c:680: void moverDerecha() {
                           3889 ;	---------------------------------
                           3890 ; Function moverDerecha
                           3891 ; ---------------------------------
   7C0A                    3892 _moverDerecha::
                           3893 ;src/main.c:681: prota.mira = M_derecha;
   7C0A 21 2C 64      [10] 3894 	ld	hl,#(_prota + 0x0007)
   7C0D 36 00         [10] 3895 	ld	(hl),#0x00
                           3896 ;src/main.c:682: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C0F AF            [ 4] 3897 	xor	a, a
   7C10 F5            [11] 3898 	push	af
   7C11 33            [ 6] 3899 	inc	sp
   7C12 CD 6C 66      [17] 3900 	call	_checkCollision
   7C15 33            [ 6] 3901 	inc	sp
   7C16 45            [ 4] 3902 	ld	b,l
   7C17 21 25 64      [10] 3903 	ld	hl, #_prota + 0
   7C1A 4E            [ 7] 3904 	ld	c,(hl)
   7C1B 59            [ 4] 3905 	ld	e,c
   7C1C 16 00         [ 7] 3906 	ld	d,#0x00
   7C1E 21 07 00      [10] 3907 	ld	hl,#0x0007
   7C21 19            [11] 3908 	add	hl,de
   7C22 11 50 80      [10] 3909 	ld	de, #0x8050
   7C25 29            [11] 3910 	add	hl, hl
   7C26 3F            [ 4] 3911 	ccf
   7C27 CB 1C         [ 8] 3912 	rr	h
   7C29 CB 1D         [ 8] 3913 	rr	l
   7C2B ED 52         [15] 3914 	sbc	hl, de
   7C2D 3E 00         [ 7] 3915 	ld	a,#0x00
   7C2F 17            [ 4] 3916 	rla
   7C30 5F            [ 4] 3917 	ld	e,a
   7C31 78            [ 4] 3918 	ld	a,b
   7C32 B7            [ 4] 3919 	or	a,a
   7C33 20 14         [12] 3920 	jr	NZ,00104$
   7C35 B3            [ 4] 3921 	or	a,e
   7C36 28 11         [12] 3922 	jr	Z,00104$
                           3923 ;src/main.c:683: prota.x++;
   7C38 0C            [ 4] 3924 	inc	c
   7C39 21 25 64      [10] 3925 	ld	hl,#_prota
   7C3C 71            [ 7] 3926 	ld	(hl),c
                           3927 ;src/main.c:684: prota.mover = SI;
   7C3D 21 2B 64      [10] 3928 	ld	hl,#(_prota + 0x0006)
   7C40 36 01         [10] 3929 	ld	(hl),#0x01
                           3930 ;src/main.c:685: prota.sprite = g_hero;
   7C42 21 70 3E      [10] 3931 	ld	hl,#_g_hero
   7C45 22 29 64      [16] 3932 	ld	((_prota + 0x0004)), hl
   7C48 C9            [10] 3933 	ret
   7C49                    3934 00104$:
                           3935 ;src/main.c:686: }else if( prota.x + G_HERO_W >= 80){
   7C49 7B            [ 4] 3936 	ld	a,e
   7C4A B7            [ 4] 3937 	or	a, a
   7C4B C0            [11] 3938 	ret	NZ
                           3939 ;src/main.c:687: avanzarMapa();
   7C4C C3 9E 7B      [10] 3940 	jp  _avanzarMapa
                           3941 ;src/main.c:691: void moverArriba() {
                           3942 ;	---------------------------------
                           3943 ; Function moverArriba
                           3944 ; ---------------------------------
   7C4F                    3945 _moverArriba::
                           3946 ;src/main.c:692: prota.mira = M_arriba;
   7C4F 21 2C 64      [10] 3947 	ld	hl,#(_prota + 0x0007)
   7C52 36 02         [10] 3948 	ld	(hl),#0x02
                           3949 ;src/main.c:693: if (!checkCollision(M_arriba)) {
   7C54 3E 02         [ 7] 3950 	ld	a,#0x02
   7C56 F5            [11] 3951 	push	af
   7C57 33            [ 6] 3952 	inc	sp
   7C58 CD 6C 66      [17] 3953 	call	_checkCollision
   7C5B 33            [ 6] 3954 	inc	sp
   7C5C 7D            [ 4] 3955 	ld	a,l
   7C5D B7            [ 4] 3956 	or	a, a
   7C5E C0            [11] 3957 	ret	NZ
                           3958 ;src/main.c:694: prota.y--;
   7C5F 21 26 64      [10] 3959 	ld	hl,#_prota + 1
   7C62 4E            [ 7] 3960 	ld	c,(hl)
   7C63 0D            [ 4] 3961 	dec	c
   7C64 71            [ 7] 3962 	ld	(hl),c
                           3963 ;src/main.c:695: prota.y--;
   7C65 0D            [ 4] 3964 	dec	c
   7C66 71            [ 7] 3965 	ld	(hl),c
                           3966 ;src/main.c:696: prota.mover  = SI;
   7C67 21 2B 64      [10] 3967 	ld	hl,#(_prota + 0x0006)
   7C6A 36 01         [10] 3968 	ld	(hl),#0x01
                           3969 ;src/main.c:697: prota.sprite = g_hero_up;
   7C6C 21 2C 3D      [10] 3970 	ld	hl,#_g_hero_up
   7C6F 22 29 64      [16] 3971 	ld	((_prota + 0x0004)), hl
   7C72 C9            [10] 3972 	ret
                           3973 ;src/main.c:701: void moverAbajo() {
                           3974 ;	---------------------------------
                           3975 ; Function moverAbajo
                           3976 ; ---------------------------------
   7C73                    3977 _moverAbajo::
                           3978 ;src/main.c:702: prota.mira = M_abajo;
   7C73 21 2C 64      [10] 3979 	ld	hl,#(_prota + 0x0007)
   7C76 36 03         [10] 3980 	ld	(hl),#0x03
                           3981 ;src/main.c:703: if (!checkCollision(M_abajo) ) {
   7C78 3E 03         [ 7] 3982 	ld	a,#0x03
   7C7A F5            [11] 3983 	push	af
   7C7B 33            [ 6] 3984 	inc	sp
   7C7C CD 6C 66      [17] 3985 	call	_checkCollision
   7C7F 33            [ 6] 3986 	inc	sp
   7C80 7D            [ 4] 3987 	ld	a,l
   7C81 B7            [ 4] 3988 	or	a, a
   7C82 C0            [11] 3989 	ret	NZ
                           3990 ;src/main.c:704: prota.y++;
   7C83 01 26 64      [10] 3991 	ld	bc,#_prota + 1
   7C86 0A            [ 7] 3992 	ld	a,(bc)
   7C87 3C            [ 4] 3993 	inc	a
   7C88 02            [ 7] 3994 	ld	(bc),a
                           3995 ;src/main.c:705: prota.y++;
   7C89 3C            [ 4] 3996 	inc	a
   7C8A 02            [ 7] 3997 	ld	(bc),a
                           3998 ;src/main.c:706: prota.mover  = SI;
   7C8B 21 2B 64      [10] 3999 	ld	hl,#(_prota + 0x0006)
   7C8E 36 01         [10] 4000 	ld	(hl),#0x01
                           4001 ;src/main.c:707: prota.sprite = g_hero_down;
   7C90 21 92 3C      [10] 4002 	ld	hl,#_g_hero_down
   7C93 22 29 64      [16] 4003 	ld	((_prota + 0x0004)), hl
   7C96 C9            [10] 4004 	ret
                           4005 ;src/main.c:714: void intHandler() {
                           4006 ;	---------------------------------
                           4007 ; Function intHandler
                           4008 ; ---------------------------------
   7C97                    4009 _intHandler::
                           4010 ;src/main.c:715: if (++i == 6) {
   7C97 21 39 64      [10] 4011 	ld	hl, #_i+0
   7C9A 34            [11] 4012 	inc	(hl)
   7C9B 3A 39 64      [13] 4013 	ld	a,(#_i + 0)
   7C9E D6 06         [ 7] 4014 	sub	a, #0x06
   7CA0 C0            [11] 4015 	ret	NZ
                           4016 ;src/main.c:716: play();
   7CA1 CD 71 53      [17] 4017 	call	_play
                           4018 ;src/main.c:717: i=0;
   7CA4 21 39 64      [10] 4019 	ld	hl,#_i + 0
   7CA7 36 00         [10] 4020 	ld	(hl), #0x00
   7CA9 C9            [10] 4021 	ret
                           4022 ;src/main.c:721: void inicializarCPC() {
                           4023 ;	---------------------------------
                           4024 ; Function inicializarCPC
                           4025 ; ---------------------------------
   7CAA                    4026 _inicializarCPC::
                           4027 ;src/main.c:722: cpct_disableFirmware();
   7CAA CD 18 57      [17] 4028 	call	_cpct_disableFirmware
                           4029 ;src/main.c:723: cpct_setVideoMode(0);
   7CAD 2E 00         [ 7] 4030 	ld	l,#0x00
   7CAF CD EC 56      [17] 4031 	call	_cpct_setVideoMode
                           4032 ;src/main.c:724: cpct_setBorder(HW_BLACK);
   7CB2 21 10 14      [10] 4033 	ld	hl,#0x1410
   7CB5 E5            [11] 4034 	push	hl
   7CB6 CD 4F 54      [17] 4035 	call	_cpct_setPALColour
                           4036 ;src/main.c:725: cpct_setPalette(g_palette, 16);
   7CB9 21 10 00      [10] 4037 	ld	hl,#0x0010
   7CBC E5            [11] 4038 	push	hl
   7CBD 21 60 3E      [10] 4039 	ld	hl,#_g_palette
   7CC0 E5            [11] 4040 	push	hl
   7CC1 CD 2C 54      [17] 4041 	call	_cpct_setPalette
   7CC4 C9            [10] 4042 	ret
                           4043 ;src/main.c:730: void inicializarJuego() {
                           4044 ;	---------------------------------
                           4045 ; Function inicializarJuego
                           4046 ; ---------------------------------
   7CC5                    4047 _inicializarJuego::
                           4048 ;src/main.c:732: num_mapa = 0;
   7CC5 21 05 65      [10] 4049 	ld	hl,#_num_mapa + 0
   7CC8 36 00         [10] 4050 	ld	(hl), #0x00
                           4051 ;src/main.c:733: mapa = mapas[num_mapa];
   7CCA 21 21 65      [10] 4052 	ld	hl, #_mapas + 0
   7CCD 7E            [ 7] 4053 	ld	a,(hl)
   7CCE FD 21 03 65   [14] 4054 	ld	iy,#_mapa
   7CD2 FD 77 00      [19] 4055 	ld	0 (iy),a
   7CD5 23            [ 6] 4056 	inc	hl
   7CD6 7E            [ 7] 4057 	ld	a,(hl)
   7CD7 32 04 65      [13] 4058 	ld	(#_mapa + 1),a
                           4059 ;src/main.c:734: cpct_etm_setTileset2x4(g_tileset);
   7CDA 21 E0 17      [10] 4060 	ld	hl,#_g_tileset
   7CDD CD 40 56      [17] 4061 	call	_cpct_etm_setTileset2x4
                           4062 ;src/main.c:736: dibujarMapa();
   7CE0 CD 0B 65      [17] 4063 	call	_dibujarMapa
                           4064 ;src/main.c:739: barraPuntuacionInicial();
   7CE3 CD 85 51      [17] 4065 	call	_barraPuntuacionInicial
                           4066 ;src/main.c:742: prota.x = prota.px = 4;
   7CE6 21 27 64      [10] 4067 	ld	hl,#(_prota + 0x0002)
   7CE9 36 04         [10] 4068 	ld	(hl),#0x04
   7CEB 21 25 64      [10] 4069 	ld	hl,#_prota
   7CEE 36 04         [10] 4070 	ld	(hl),#0x04
                           4071 ;src/main.c:743: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7CF0 21 28 64      [10] 4072 	ld	hl,#(_prota + 0x0003)
   7CF3 36 68         [10] 4073 	ld	(hl),#0x68
   7CF5 21 26 64      [10] 4074 	ld	hl,#(_prota + 0x0001)
   7CF8 36 68         [10] 4075 	ld	(hl),#0x68
                           4076 ;src/main.c:744: prota.mover  = NO;
   7CFA 21 2B 64      [10] 4077 	ld	hl,#(_prota + 0x0006)
   7CFD 36 00         [10] 4078 	ld	(hl),#0x00
                           4079 ;src/main.c:745: prota.mira=M_derecha;
   7CFF 21 2C 64      [10] 4080 	ld	hl,#(_prota + 0x0007)
   7D02 36 00         [10] 4081 	ld	(hl),#0x00
                           4082 ;src/main.c:746: prota.sprite = g_hero;
   7D04 21 70 3E      [10] 4083 	ld	hl,#_g_hero
   7D07 22 29 64      [16] 4084 	ld	((_prota + 0x0004)), hl
                           4085 ;src/main.c:750: cu.x = cu.px = 0;
   7D0A 21 2F 64      [10] 4086 	ld	hl,#(_cu + 0x0002)
   7D0D 36 00         [10] 4087 	ld	(hl),#0x00
   7D0F 21 2D 64      [10] 4088 	ld	hl,#_cu
   7D12 36 00         [10] 4089 	ld	(hl),#0x00
                           4090 ;src/main.c:751: cu.y = cu.py = 0;
   7D14 21 30 64      [10] 4091 	ld	hl,#(_cu + 0x0003)
   7D17 36 00         [10] 4092 	ld	(hl),#0x00
   7D19 21 2E 64      [10] 4093 	ld	hl,#(_cu + 0x0001)
   7D1C 36 00         [10] 4094 	ld	(hl),#0x00
                           4095 ;src/main.c:752: cu.lanzado = NO;
   7D1E 21 33 64      [10] 4096 	ld	hl,#(_cu + 0x0006)
   7D21 36 00         [10] 4097 	ld	(hl),#0x00
                           4098 ;src/main.c:753: cu.mover = NO;
   7D23 21 36 64      [10] 4099 	ld	hl,#(_cu + 0x0009)
   7D26 36 00         [10] 4100 	ld	(hl),#0x00
                           4101 ;src/main.c:754: cu.off_bound = NO;
   7D28 21 37 64      [10] 4102 	ld	hl,#(_cu + 0x000a)
   7D2B 36 00         [10] 4103 	ld	(hl),#0x00
                           4104 ;src/main.c:756: inicializarEnemy();
   7D2D CD 8D 7A      [17] 4105 	call	_inicializarEnemy
                           4106 ;src/main.c:758: dibujarProta();
   7D30 C3 57 65      [10] 4107 	jp  _dibujarProta
                           4108 ;src/main.c:761: void main(void) {
                           4109 ;	---------------------------------
                           4110 ; Function main
                           4111 ; ---------------------------------
   7D33                    4112 _main::
   7D33 DD E5         [15] 4113 	push	ix
   7D35 DD 21 00 00   [14] 4114 	ld	ix,#0
   7D39 DD 39         [15] 4115 	add	ix,sp
   7D3B 21 F9 FF      [10] 4116 	ld	hl,#-7
   7D3E 39            [11] 4117 	add	hl,sp
   7D3F F9            [ 6] 4118 	ld	sp,hl
                           4119 ;src/main.c:766: vidas = 6;
   7D40 21 38 64      [10] 4120 	ld	hl,#_vidas + 0
   7D43 36 06         [10] 4121 	ld	(hl), #0x06
                           4122 ;src/main.c:768: inicializarCPC();
   7D45 CD AA 7C      [17] 4123 	call	_inicializarCPC
                           4124 ;src/main.c:770: menuInicio();
   7D48 CD A6 50      [17] 4125 	call	_menuInicio
                           4126 ;src/main.c:772: inicializarJuego();
   7D4B CD C5 7C      [17] 4127 	call	_inicializarJuego
                           4128 ;src/main.c:776: while (1) {
   7D4E                    4129 00126$:
                           4130 ;src/main.c:778: i = 2 + num_mapa;
   7D4E 21 05 65      [10] 4131 	ld	hl,#_num_mapa + 0
   7D51 4E            [ 7] 4132 	ld	c, (hl)
   7D52 0C            [ 4] 4133 	inc	c
   7D53 0C            [ 4] 4134 	inc	c
                           4135 ;src/main.c:779: actual = enemy;
                           4136 ;src/main.c:781: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D54 C5            [11] 4137 	push	bc
   7D55 21 00 01      [10] 4138 	ld	hl,#_g_tablatrans
   7D58 E5            [11] 4139 	push	hl
   7D59 2A 03 65      [16] 4140 	ld	hl,(_mapa)
   7D5C E5            [11] 4141 	push	hl
   7D5D 21 25 64      [10] 4142 	ld	hl,#_prota
   7D60 E5            [11] 4143 	push	hl
   7D61 21 2D 64      [10] 4144 	ld	hl,#_cu
   7D64 E5            [11] 4145 	push	hl
   7D65 CD 05 66      [17] 4146 	call	_comprobarTeclado
   7D68 21 08 00      [10] 4147 	ld	hl,#8
   7D6B 39            [11] 4148 	add	hl,sp
   7D6C F9            [ 6] 4149 	ld	sp,hl
   7D6D 2A 03 65      [16] 4150 	ld	hl,(_mapa)
   7D70 E5            [11] 4151 	push	hl
   7D71 21 2D 64      [10] 4152 	ld	hl,#_cu
   7D74 E5            [11] 4153 	push	hl
   7D75 CD 2A 4A      [17] 4154 	call	_moverCuchillo
   7D78 F1            [10] 4155 	pop	af
   7D79 F1            [10] 4156 	pop	af
   7D7A C1            [10] 4157 	pop	bc
                           4158 ;src/main.c:783: while(i){
   7D7B DD 71 FD      [19] 4159 	ld	-3 (ix),c
   7D7E DD 36 F9 9D   [19] 4160 	ld	-7 (ix),#<(_enemy)
   7D82 DD 36 FA 60   [19] 4161 	ld	-6 (ix),#>(_enemy)
   7D86                    4162 00105$:
   7D86 DD 7E FD      [19] 4163 	ld	a,-3 (ix)
   7D89 B7            [ 4] 4164 	or	a, a
   7D8A 28 4E         [12] 4165 	jr	Z,00107$
                           4166 ;src/main.c:785: --i;
   7D8C DD 35 FD      [23] 4167 	dec	-3 (ix)
                           4168 ;src/main.c:786: if(!actual->muerto){
   7D8F DD 7E F9      [19] 4169 	ld	a,-7 (ix)
   7D92 C6 08         [ 7] 4170 	add	a, #0x08
   7D94 DD 77 FE      [19] 4171 	ld	-2 (ix),a
   7D97 DD 7E FA      [19] 4172 	ld	a,-6 (ix)
   7D9A CE 00         [ 7] 4173 	adc	a, #0x00
   7D9C DD 77 FF      [19] 4174 	ld	-1 (ix),a
   7D9F DD 6E FE      [19] 4175 	ld	l,-2 (ix)
   7DA2 DD 66 FF      [19] 4176 	ld	h,-1 (ix)
   7DA5 7E            [ 7] 4177 	ld	a,(hl)
   7DA6 B7            [ 4] 4178 	or	a, a
   7DA7 20 0E         [12] 4179 	jr	NZ,00102$
                           4180 ;src/main.c:787: checkEnemyDead(cu.direccion, actual);
   7DA9 21 34 64      [10] 4181 	ld	hl, #_cu + 7
   7DAC 46            [ 7] 4182 	ld	b,(hl)
   7DAD E1            [10] 4183 	pop	hl
   7DAE E5            [11] 4184 	push	hl
   7DAF E5            [11] 4185 	push	hl
   7DB0 C5            [11] 4186 	push	bc
   7DB1 33            [ 6] 4187 	inc	sp
   7DB2 CD 66 69      [17] 4188 	call	_checkEnemyDead
   7DB5 F1            [10] 4189 	pop	af
   7DB6 33            [ 6] 4190 	inc	sp
   7DB7                    4191 00102$:
                           4192 ;src/main.c:789: if(!actual->muerto){
   7DB7 DD 6E FE      [19] 4193 	ld	l,-2 (ix)
   7DBA DD 66 FF      [19] 4194 	ld	h,-1 (ix)
   7DBD 7E            [ 7] 4195 	ld	a,(hl)
   7DBE B7            [ 4] 4196 	or	a, a
   7DBF 20 07         [12] 4197 	jr	NZ,00104$
                           4198 ;src/main.c:790: updateEnemy(actual);
   7DC1 E1            [10] 4199 	pop	hl
   7DC2 E5            [11] 4200 	push	hl
   7DC3 E5            [11] 4201 	push	hl
   7DC4 CD 2C 79      [17] 4202 	call	_updateEnemy
   7DC7 F1            [10] 4203 	pop	af
   7DC8                    4204 00104$:
                           4205 ;src/main.c:792: ++actual;
   7DC8 DD 7E F9      [19] 4206 	ld	a,-7 (ix)
   7DCB C6 E2         [ 7] 4207 	add	a, #0xE2
   7DCD DD 77 F9      [19] 4208 	ld	-7 (ix),a
   7DD0 DD 7E FA      [19] 4209 	ld	a,-6 (ix)
   7DD3 CE 00         [ 7] 4210 	adc	a, #0x00
   7DD5 DD 77 FA      [19] 4211 	ld	-6 (ix),a
   7DD8 18 AC         [12] 4212 	jr	00105$
   7DDA                    4213 00107$:
                           4214 ;src/main.c:795: cpct_waitVSYNC();
   7DDA CD E4 56      [17] 4215 	call	_cpct_waitVSYNC
                           4216 ;src/main.c:798: if (prota.mover) {
   7DDD 01 2B 64      [10] 4217 	ld	bc,#_prota + 6
   7DE0 0A            [ 7] 4218 	ld	a,(bc)
   7DE1 B7            [ 4] 4219 	or	a, a
   7DE2 28 07         [12] 4220 	jr	Z,00109$
                           4221 ;src/main.c:799: redibujarProta();
   7DE4 C5            [11] 4222 	push	bc
   7DE5 CD F1 65      [17] 4223 	call	_redibujarProta
   7DE8 C1            [10] 4224 	pop	bc
                           4225 ;src/main.c:800: prota.mover = NO;
   7DE9 AF            [ 4] 4226 	xor	a, a
   7DEA 02            [ 7] 4227 	ld	(bc),a
   7DEB                    4228 00109$:
                           4229 ;src/main.c:802: if(cu.lanzado && cu.mover){
   7DEB 21 33 64      [10] 4230 	ld	hl, #(_cu + 0x0006) + 0
   7DEE 4E            [ 7] 4231 	ld	c,(hl)
                           4232 ;src/main.c:803: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4233 ;src/main.c:802: if(cu.lanzado && cu.mover){
   7DEF 79            [ 4] 4234 	ld	a,c
   7DF0 B7            [ 4] 4235 	or	a, a
   7DF1 28 30         [12] 4236 	jr	Z,00114$
   7DF3 3A 36 64      [13] 4237 	ld	a, (#(_cu + 0x0009) + 0)
   7DF6 B7            [ 4] 4238 	or	a, a
   7DF7 28 2A         [12] 4239 	jr	Z,00114$
                           4240 ;src/main.c:803: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7DF9 21 2E 64      [10] 4241 	ld	hl, #(_cu + 0x0001) + 0
   7DFC 4E            [ 7] 4242 	ld	c,(hl)
   7DFD 21 2D 64      [10] 4243 	ld	hl, #_cu + 0
   7E00 46            [ 7] 4244 	ld	b,(hl)
   7E01 21 35 64      [10] 4245 	ld	hl, #(_cu + 0x0008) + 0
   7E04 5E            [ 7] 4246 	ld	e,(hl)
   7E05 2A 03 65      [16] 4247 	ld	hl,(_mapa)
   7E08 E5            [11] 4248 	push	hl
   7E09 21 00 01      [10] 4249 	ld	hl,#_g_tablatrans
   7E0C E5            [11] 4250 	push	hl
   7E0D 21 2D 64      [10] 4251 	ld	hl,#_cu
   7E10 E5            [11] 4252 	push	hl
   7E11 79            [ 4] 4253 	ld	a,c
   7E12 F5            [11] 4254 	push	af
   7E13 33            [ 6] 4255 	inc	sp
   7E14 C5            [11] 4256 	push	bc
   7E15 33            [ 6] 4257 	inc	sp
   7E16 7B            [ 4] 4258 	ld	a,e
   7E17 F5            [11] 4259 	push	af
   7E18 33            [ 6] 4260 	inc	sp
   7E19 CD 4A 47      [17] 4261 	call	_redibujarCuchillo
   7E1C 21 09 00      [10] 4262 	ld	hl,#9
   7E1F 39            [11] 4263 	add	hl,sp
   7E20 F9            [ 6] 4264 	ld	sp,hl
   7E21 18 28         [12] 4265 	jr	00115$
   7E23                    4266 00114$:
                           4267 ;src/main.c:804: }else if (cu.lanzado && !cu.mover){
   7E23 79            [ 4] 4268 	ld	a,c
   7E24 B7            [ 4] 4269 	or	a, a
   7E25 28 24         [12] 4270 	jr	Z,00115$
   7E27 3A 36 64      [13] 4271 	ld	a, (#(_cu + 0x0009) + 0)
   7E2A B7            [ 4] 4272 	or	a, a
   7E2B 20 1E         [12] 4273 	jr	NZ,00115$
                           4274 ;src/main.c:805: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E2D 21 2E 64      [10] 4275 	ld	hl, #(_cu + 0x0001) + 0
   7E30 46            [ 7] 4276 	ld	b,(hl)
   7E31 21 2D 64      [10] 4277 	ld	hl, #_cu + 0
   7E34 4E            [ 7] 4278 	ld	c,(hl)
   7E35 21 35 64      [10] 4279 	ld	hl, #(_cu + 0x0008) + 0
   7E38 56            [ 7] 4280 	ld	d,(hl)
   7E39 2A 03 65      [16] 4281 	ld	hl,(_mapa)
   7E3C E5            [11] 4282 	push	hl
   7E3D C5            [11] 4283 	push	bc
   7E3E D5            [11] 4284 	push	de
   7E3F 33            [ 6] 4285 	inc	sp
   7E40 CD B7 46      [17] 4286 	call	_borrarCuchillo
   7E43 F1            [10] 4287 	pop	af
   7E44 F1            [10] 4288 	pop	af
   7E45 33            [ 6] 4289 	inc	sp
                           4290 ;src/main.c:806: cu.lanzado = NO;
   7E46 21 33 64      [10] 4291 	ld	hl,#(_cu + 0x0006)
   7E49 36 00         [10] 4292 	ld	(hl),#0x00
   7E4B                    4293 00115$:
                           4294 ;src/main.c:809: i = 2 + num_mapa;
   7E4B 3A 05 65      [13] 4295 	ld	a,(#_num_mapa + 0)
   7E4E C6 02         [ 7] 4296 	add	a, #0x02
   7E50 DD 77 FE      [19] 4297 	ld	-2 (ix),a
                           4298 ;src/main.c:810: actual = enemy;
   7E53 01 9D 60      [10] 4299 	ld	bc,#_enemy
                           4300 ;src/main.c:811: while(i){
   7E56                    4301 00122$:
   7E56 DD 7E FE      [19] 4302 	ld	a,-2 (ix)
   7E59 B7            [ 4] 4303 	or	a, a
   7E5A CA 09 7F      [10] 4304 	jp	Z,00124$
                           4305 ;src/main.c:813: --i;
   7E5D DD 35 FE      [23] 4306 	dec	-2 (ix)
                           4307 ;src/main.c:814: if(actual->mover){
   7E60 21 06 00      [10] 4308 	ld	hl,#0x0006
   7E63 09            [11] 4309 	add	hl,bc
   7E64 E3            [19] 4310 	ex	(sp), hl
   7E65 E1            [10] 4311 	pop	hl
   7E66 E5            [11] 4312 	push	hl
   7E67 7E            [ 7] 4313 	ld	a,(hl)
   7E68 B7            [ 4] 4314 	or	a, a
   7E69 28 18         [12] 4315 	jr	Z,00118$
                           4316 ;src/main.c:815: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7E6B 69            [ 4] 4317 	ld	l, c
   7E6C 60            [ 4] 4318 	ld	h, b
   7E6D 23            [ 6] 4319 	inc	hl
   7E6E 23            [ 6] 4320 	inc	hl
   7E6F 23            [ 6] 4321 	inc	hl
   7E70 5E            [ 7] 4322 	ld	e,(hl)
   7E71 69            [ 4] 4323 	ld	l, c
   7E72 60            [ 4] 4324 	ld	h, b
   7E73 23            [ 6] 4325 	inc	hl
   7E74 23            [ 6] 4326 	inc	hl
   7E75 56            [ 7] 4327 	ld	d,(hl)
   7E76 C5            [11] 4328 	push	bc
   7E77 C5            [11] 4329 	push	bc
   7E78 7B            [ 4] 4330 	ld	a,e
   7E79 F5            [11] 4331 	push	af
   7E7A 33            [ 6] 4332 	inc	sp
   7E7B D5            [11] 4333 	push	de
   7E7C 33            [ 6] 4334 	inc	sp
   7E7D CD 35 69      [17] 4335 	call	_redibujarEnemigo
   7E80 F1            [10] 4336 	pop	af
   7E81 F1            [10] 4337 	pop	af
   7E82 C1            [10] 4338 	pop	bc
   7E83                    4339 00118$:
                           4340 ;src/main.c:818: if (actual->muerto && actual->muertes == 0){
   7E83 C5            [11] 4341 	push	bc
   7E84 FD E1         [14] 4342 	pop	iy
   7E86 FD 7E 08      [19] 4343 	ld	a,8 (iy)
   7E89 B7            [ 4] 4344 	or	a, a
   7E8A 28 74         [12] 4345 	jr	Z,00120$
   7E8C 21 0A 00      [10] 4346 	ld	hl,#0x000A
   7E8F 09            [11] 4347 	add	hl,bc
   7E90 EB            [ 4] 4348 	ex	de,hl
   7E91 1A            [ 7] 4349 	ld	a,(de)
   7E92 B7            [ 4] 4350 	or	a, a
   7E93 20 6B         [12] 4351 	jr	NZ,00120$
                           4352 ;src/main.c:819: borrarEnemigo((*actual).x, (*actual).y);
   7E95 21 01 00      [10] 4353 	ld	hl,#0x0001
   7E98 09            [11] 4354 	add	hl,bc
   7E99 DD 75 FB      [19] 4355 	ld	-5 (ix),l
   7E9C DD 74 FC      [19] 4356 	ld	-4 (ix),h
   7E9F DD 6E FB      [19] 4357 	ld	l,-5 (ix)
   7EA2 DD 66 FC      [19] 4358 	ld	h,-4 (ix)
   7EA5 7E            [ 7] 4359 	ld	a,(hl)
   7EA6 F5            [11] 4360 	push	af
   7EA7 0A            [ 7] 4361 	ld	a,(bc)
   7EA8 DD 77 FD      [19] 4362 	ld	-3 (ix),a
   7EAB F1            [10] 4363 	pop	af
   7EAC C5            [11] 4364 	push	bc
   7EAD D5            [11] 4365 	push	de
   7EAE F5            [11] 4366 	push	af
   7EAF 33            [ 6] 4367 	inc	sp
   7EB0 DD 7E FD      [19] 4368 	ld	a,-3 (ix)
   7EB3 F5            [11] 4369 	push	af
   7EB4 33            [ 6] 4370 	inc	sp
   7EB5 CD C5 68      [17] 4371 	call	_borrarEnemigo
   7EB8 F1            [10] 4372 	pop	af
   7EB9 D1            [10] 4373 	pop	de
   7EBA C1            [10] 4374 	pop	bc
                           4375 ;src/main.c:820: dibujarExplosion(actual);
   7EBB C5            [11] 4376 	push	bc
   7EBC D5            [11] 4377 	push	de
   7EBD C5            [11] 4378 	push	bc
   7EBE CD 15 68      [17] 4379 	call	_dibujarExplosion
   7EC1 F1            [10] 4380 	pop	af
   7EC2 D1            [10] 4381 	pop	de
   7EC3 C1            [10] 4382 	pop	bc
                           4383 ;src/main.c:821: puntuacion_aux = puntuacion;
   7EC4 FD 21 06 65   [14] 4384 	ld	iy,#_puntuacion
   7EC8 FD 6E 00      [19] 4385 	ld	l,0 (iy)
   7ECB 26 00         [ 7] 4386 	ld	h,#0x00
                           4387 ;src/main.c:822: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7ECD C5            [11] 4388 	push	bc
   7ECE D5            [11] 4389 	push	de
   7ECF E5            [11] 4390 	push	hl
   7ED0 CD 5E 53      [17] 4391 	call	_aumentarPuntuacion
   7ED3 F1            [10] 4392 	pop	af
   7ED4 D1            [10] 4393 	pop	de
   7ED5 C1            [10] 4394 	pop	bc
   7ED6 FD 21 06 65   [14] 4395 	ld	iy,#_puntuacion
   7EDA FD 75 00      [19] 4396 	ld	0 (iy),l
                           4397 ;src/main.c:823: modificarPuntuacion(puntuacion);
   7EDD FD 21 06 65   [14] 4398 	ld	iy,#_puntuacion
   7EE1 FD 6E 00      [19] 4399 	ld	l,0 (iy)
   7EE4 26 00         [ 7] 4400 	ld	h,#0x00
   7EE6 C5            [11] 4401 	push	bc
   7EE7 D5            [11] 4402 	push	de
   7EE8 E5            [11] 4403 	push	hl
   7EE9 CD 21 52      [17] 4404 	call	_modificarPuntuacion
   7EEC F1            [10] 4405 	pop	af
   7EED D1            [10] 4406 	pop	de
   7EEE C1            [10] 4407 	pop	bc
                           4408 ;src/main.c:824: actual->mover = NO;
   7EEF E1            [10] 4409 	pop	hl
   7EF0 E5            [11] 4410 	push	hl
   7EF1 36 00         [10] 4411 	ld	(hl),#0x00
                           4412 ;src/main.c:825: actual->muertes++;
   7EF3 1A            [ 7] 4413 	ld	a,(de)
   7EF4 3C            [ 4] 4414 	inc	a
   7EF5 12            [ 7] 4415 	ld	(de),a
                           4416 ;src/main.c:826: actual->x = 0;
   7EF6 AF            [ 4] 4417 	xor	a, a
   7EF7 02            [ 7] 4418 	ld	(bc),a
                           4419 ;src/main.c:827: actual->y = 0;
   7EF8 DD 6E FB      [19] 4420 	ld	l,-5 (ix)
   7EFB DD 66 FC      [19] 4421 	ld	h,-4 (ix)
   7EFE 36 00         [10] 4422 	ld	(hl),#0x00
   7F00                    4423 00120$:
                           4424 ;src/main.c:829: ++actual;
   7F00 21 E2 00      [10] 4425 	ld	hl,#0x00E2
   7F03 09            [11] 4426 	add	hl,bc
   7F04 4D            [ 4] 4427 	ld	c,l
   7F05 44            [ 4] 4428 	ld	b,h
   7F06 C3 56 7E      [10] 4429 	jp	00122$
   7F09                    4430 00124$:
                           4431 ;src/main.c:831: cpct_waitVSYNC();
   7F09 CD E4 56      [17] 4432 	call	_cpct_waitVSYNC
   7F0C C3 4E 7D      [10] 4433 	jp	00126$
                           4434 	.area _CODE
                           4435 	.area _INITIALIZER
   6507                    4436 __xinit__mapa:
   6507 00 00              4437 	.dw #0x0000
   6509                    4438 __xinit__num_mapa:
   6509 00                 4439 	.db #0x00	; 0
   650A                    4440 __xinit__puntuacion:
   650A 00                 4441 	.db #0x00	; 0
                           4442 	.area _CABS (ABS)
