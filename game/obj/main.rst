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
                             51 	.globl _modificarVidas
                             52 	.globl _modificarPuntuacion
                             53 	.globl _barraPuntuacionInicial
                             54 	.globl _menuInicio
                             55 	.globl _menuFin
                             56 	.globl _cpct_etm_setTileset2x4
                             57 	.globl _cpct_etm_drawTileBox2x4
                             58 	.globl _cpct_getScreenPtr
                             59 	.globl _cpct_setPALColour
                             60 	.globl _cpct_setPalette
                             61 	.globl _cpct_waitVSYNC
                             62 	.globl _cpct_setVideoMode
                             63 	.globl _cpct_drawSpriteMaskedAlignedTable
                             64 	.globl _cpct_isAnyKeyPressed
                             65 	.globl _cpct_isKeyPressed
                             66 	.globl _cpct_scanKeyboard_if
                             67 	.globl _cpct_disableFirmware
                             68 	.globl _vidas
                             69 	.globl _puntuacion
                             70 	.globl _num_mapa
                             71 	.globl _mapa
                             72 	.globl _i
                             73 	.globl _cu
                             74 	.globl _prota
                             75 	.globl _enemy
                             76 	.globl _patrolY
                             77 	.globl _patrolX
                             78 	.globl _spawnY
                             79 	.globl _spawnX
                             80 	.globl _mapas
                             81 ;--------------------------------------------------------
                             82 ; special function registers
                             83 ;--------------------------------------------------------
                             84 ;--------------------------------------------------------
                             85 ; ram data
                             86 ;--------------------------------------------------------
                             87 	.area _DATA
   60A9                      88 _enemy::
   60A9                      89 	.ds 904
   6431                      90 _prota::
   6431                      91 	.ds 8
   6439                      92 _cu::
   6439                      93 	.ds 11
   6444                      94 _i::
   6444                      95 	.ds 1
                             96 ;--------------------------------------------------------
                             97 ; ram data
                             98 ;--------------------------------------------------------
                             99 	.area _INITIALIZED
   650E                     100 _mapa::
   650E                     101 	.ds 2
   6510                     102 _num_mapa::
   6510                     103 	.ds 1
   6511                     104 _puntuacion::
   6511                     105 	.ds 1
   6512                     106 _vidas::
   6512                     107 	.ds 1
                            108 ;--------------------------------------------------------
                            109 ; absolute external ram data
                            110 ;--------------------------------------------------------
                            111 	.area _DABS (ABS)
                            112 ;--------------------------------------------------------
                            113 ; global & static initialisations
                            114 ;--------------------------------------------------------
                            115 	.area _HOME
                            116 	.area _GSINIT
                            117 	.area _GSFINAL
                            118 	.area _GSINIT
                            119 ;--------------------------------------------------------
                            120 ; Home
                            121 ;--------------------------------------------------------
                            122 	.area _HOME
                            123 	.area _HOME
                            124 ;--------------------------------------------------------
                            125 ; code
                            126 ;--------------------------------------------------------
                            127 	.area _CODE
                            128 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            129 ;	---------------------------------
                            130 ; Function dummy_cpct_transparentMaskTable0M0_container
                            131 ; ---------------------------------
   3F0A                     132 _dummy_cpct_transparentMaskTable0M0_container::
                            133 	.area _g_tablatrans_ (ABS) 
   0100                     134 	.org 0x0100 
   0100                     135 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   136 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   138 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   144 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   146 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   157 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            168 	.area _CSEG (REL, CON) 
                            169 ;src/main.c:112: void dibujarMapa() {
                            170 ;	---------------------------------
                            171 ; Function dibujarMapa
                            172 ; ---------------------------------
   6518                     173 _dibujarMapa::
                            174 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6518 2A 0E 65      [16]  175 	ld	hl,(_mapa)
   651B E5            [11]  176 	push	hl
   651C 21 F0 C0      [10]  177 	ld	hl,#0xC0F0
   651F E5            [11]  178 	push	hl
   6520 21 2C 28      [10]  179 	ld	hl,#0x282C
   6523 E5            [11]  180 	push	hl
   6524 2E 00         [ 7]  181 	ld	l, #0x00
   6526 E5            [11]  182 	push	hl
   6527 AF            [ 4]  183 	xor	a, a
   6528 F5            [11]  184 	push	af
   6529 33            [ 6]  185 	inc	sp
   652A CD 30 55      [17]  186 	call	_cpct_etm_drawTileBox2x4
   652D C9            [10]  187 	ret
   652E                     188 _mapas:
   652E C0 10               189 	.dw _g_map1
   6530 E0 09               190 	.dw _g_map2
   6532 00 03               191 	.dw _g_map3
   6534                     192 _spawnX:
   6534 24                  193 	.db #0x24	; 36
   6535 47                  194 	.db #0x47	; 71	'G'
   6536 30                  195 	.db #0x30	; 48	'0'
   6537 18                  196 	.db #0x18	; 24
   6538                     197 _spawnY:
   6538 2C                  198 	.db #0x2C	; 44
   6539 66                  199 	.db #0x66	; 102	'f'
   653A 9A                  200 	.db #0x9A	; 154
   653B 40                  201 	.db #0x40	; 64
   653C                     202 _patrolX:
   653C 00                  203 	.db #0x00	; 0
   653D 00                  204 	.db #0x00	; 0
   653E 00                  205 	.db #0x00	; 0
   653F 00                  206 	.db #0x00	; 0
   6540 00                  207 	.db #0x00	; 0
   6541 42                  208 	.db #0x42	; 66	'B'
   6542 33                  209 	.db #0x33	; 51	'3'
   6543 00                  210 	.db #0x00	; 0
   6544 00                  211 	.db #0x00	; 0
   6545 00                  212 	.db 0x00
   6546 34                  213 	.db #0x34	; 52	'4'
   6547 33                  214 	.db #0x33	; 51	'3'
   6548 14                  215 	.db #0x14	; 20
   6549 00                  216 	.db #0x00	; 0
   654A 00                  217 	.db 0x00
   654B 38                  218 	.db #0x38	; 56	'8'
   654C 3C                  219 	.db #0x3C	; 60
   654D 23                  220 	.db #0x23	; 35
   654E 18                  221 	.db #0x18	; 24
   654F 00                  222 	.db 0x00
   6550                     223 _patrolY:
   6550 00                  224 	.db #0x00	; 0
   6551 00                  225 	.db #0x00	; 0
   6552 00                  226 	.db #0x00	; 0
   6553 00                  227 	.db #0x00	; 0
   6554 00                  228 	.db 0x00
   6555 5E                  229 	.db #0x5E	; 94
   6556 A6                  230 	.db #0xA6	; 166
   6557 00                  231 	.db #0x00	; 0
   6558 00                  232 	.db #0x00	; 0
   6559 00                  233 	.db 0x00
   655A A0                  234 	.db #0xA0	; 160
   655B 66                  235 	.db #0x66	; 102	'f'
   655C 2C                  236 	.db #0x2C	; 44
   655D 00                  237 	.db #0x00	; 0
   655E 00                  238 	.db 0x00
   655F AE                  239 	.db #0xAE	; 174
   6560 66                  240 	.db #0x66	; 102	'f'
   6561 22                  241 	.db #0x22	; 34
   6562 86                  242 	.db #0x86	; 134
   6563 00                  243 	.db 0x00
                            244 ;src/main.c:118: void dibujarProta() {
                            245 ;	---------------------------------
                            246 ; Function dibujarProta
                            247 ; ---------------------------------
   6564                     248 _dibujarProta::
                            249 ;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6564 21 32 64      [10]  250 	ld	hl, #_prota + 1
   6567 56            [ 7]  251 	ld	d,(hl)
   6568 21 31 64      [10]  252 	ld	hl, #_prota + 0
   656B 46            [ 7]  253 	ld	b,(hl)
   656C D5            [11]  254 	push	de
   656D 33            [ 6]  255 	inc	sp
   656E C5            [11]  256 	push	bc
   656F 33            [ 6]  257 	inc	sp
   6570 21 00 C0      [10]  258 	ld	hl,#0xC000
   6573 E5            [11]  259 	push	hl
   6574 CD 4E 60      [17]  260 	call	_cpct_getScreenPtr
   6577 EB            [ 4]  261 	ex	de,hl
                            262 ;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6578 ED 4B 35 64   [20]  263 	ld	bc, (#_prota + 4)
   657C 21 00 01      [10]  264 	ld	hl,#_g_tablatrans
   657F E5            [11]  265 	push	hl
   6580 21 07 16      [10]  266 	ld	hl,#0x1607
   6583 E5            [11]  267 	push	hl
   6584 D5            [11]  268 	push	de
   6585 C5            [11]  269 	push	bc
   6586 CD 6E 60      [17]  270 	call	_cpct_drawSpriteMaskedAlignedTable
   6589 C9            [10]  271 	ret
                            272 ;src/main.c:123: void borrarProta() {
                            273 ;	---------------------------------
                            274 ; Function borrarProta
                            275 ; ---------------------------------
   658A                     276 _borrarProta::
   658A DD E5         [15]  277 	push	ix
   658C DD 21 00 00   [14]  278 	ld	ix,#0
   6590 DD 39         [15]  279 	add	ix,sp
   6592 F5            [11]  280 	push	af
   6593 3B            [ 6]  281 	dec	sp
                            282 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   6594 21 33 64      [10]  283 	ld	hl, #_prota + 2
   6597 4E            [ 7]  284 	ld	c,(hl)
   6598 79            [ 4]  285 	ld	a,c
   6599 E6 01         [ 7]  286 	and	a, #0x01
   659B 47            [ 4]  287 	ld	b,a
   659C 04            [ 4]  288 	inc	b
   659D 04            [ 4]  289 	inc	b
   659E 04            [ 4]  290 	inc	b
   659F 04            [ 4]  291 	inc	b
                            292 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   65A0 21 34 64      [10]  293 	ld	hl, #_prota + 3
   65A3 5E            [ 7]  294 	ld	e,(hl)
   65A4 CB 4B         [ 8]  295 	bit	1, e
   65A6 28 04         [12]  296 	jr	Z,00103$
   65A8 3E 01         [ 7]  297 	ld	a,#0x01
   65AA 18 02         [12]  298 	jr	00104$
   65AC                     299 00103$:
   65AC 3E 00         [ 7]  300 	ld	a,#0x00
   65AE                     301 00104$:
   65AE C6 06         [ 7]  302 	add	a, #0x06
   65B0 DD 77 FD      [19]  303 	ld	-3 (ix),a
                            304 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   65B3 FD 2A 0E 65   [20]  305 	ld	iy,(_mapa)
   65B7 16 00         [ 7]  306 	ld	d,#0x00
   65B9 7B            [ 4]  307 	ld	a,e
   65BA C6 E8         [ 7]  308 	add	a,#0xE8
   65BC DD 77 FE      [19]  309 	ld	-2 (ix),a
   65BF 7A            [ 4]  310 	ld	a,d
   65C0 CE FF         [ 7]  311 	adc	a,#0xFF
   65C2 DD 77 FF      [19]  312 	ld	-1 (ix),a
   65C5 DD 6E FE      [19]  313 	ld	l,-2 (ix)
   65C8 DD 66 FF      [19]  314 	ld	h,-1 (ix)
   65CB DD CB FF 7E   [20]  315 	bit	7, -1 (ix)
   65CF 28 04         [12]  316 	jr	Z,00105$
   65D1 21 EB FF      [10]  317 	ld	hl,#0xFFEB
   65D4 19            [11]  318 	add	hl,de
   65D5                     319 00105$:
   65D5 CB 2C         [ 8]  320 	sra	h
   65D7 CB 1D         [ 8]  321 	rr	l
   65D9 CB 2C         [ 8]  322 	sra	h
   65DB CB 1D         [ 8]  323 	rr	l
   65DD 55            [ 4]  324 	ld	d,l
   65DE CB 39         [ 8]  325 	srl	c
   65E0 FD E5         [15]  326 	push	iy
   65E2 21 F0 C0      [10]  327 	ld	hl,#0xC0F0
   65E5 E5            [11]  328 	push	hl
   65E6 3E 28         [ 7]  329 	ld	a,#0x28
   65E8 F5            [11]  330 	push	af
   65E9 33            [ 6]  331 	inc	sp
   65EA DD 7E FD      [19]  332 	ld	a,-3 (ix)
   65ED F5            [11]  333 	push	af
   65EE 33            [ 6]  334 	inc	sp
   65EF C5            [11]  335 	push	bc
   65F0 33            [ 6]  336 	inc	sp
   65F1 D5            [11]  337 	push	de
   65F2 33            [ 6]  338 	inc	sp
   65F3 79            [ 4]  339 	ld	a,c
   65F4 F5            [11]  340 	push	af
   65F5 33            [ 6]  341 	inc	sp
   65F6 CD 30 55      [17]  342 	call	_cpct_etm_drawTileBox2x4
   65F9 DD F9         [10]  343 	ld	sp, ix
   65FB DD E1         [14]  344 	pop	ix
   65FD C9            [10]  345 	ret
                            346 ;src/main.c:135: void redibujarProta() {
                            347 ;	---------------------------------
                            348 ; Function redibujarProta
                            349 ; ---------------------------------
   65FE                     350 _redibujarProta::
                            351 ;src/main.c:136: borrarProta();
   65FE CD 8A 65      [17]  352 	call	_borrarProta
                            353 ;src/main.c:137: prota.px = prota.x;
   6601 01 33 64      [10]  354 	ld	bc,#_prota + 2
   6604 3A 31 64      [13]  355 	ld	a, (#_prota + 0)
   6607 02            [ 7]  356 	ld	(bc),a
                            357 ;src/main.c:138: prota.py = prota.y;
   6608 01 34 64      [10]  358 	ld	bc,#_prota + 3
   660B 3A 32 64      [13]  359 	ld	a, (#_prota + 1)
   660E 02            [ 7]  360 	ld	(bc),a
                            361 ;src/main.c:139: dibujarProta();
   660F C3 64 65      [10]  362 	jp  _dibujarProta
                            363 ;src/main.c:142: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            364 ;	---------------------------------
                            365 ; Function comprobarTeclado
                            366 ; ---------------------------------
   6612                     367 _comprobarTeclado::
                            368 ;src/main.c:143: cpct_scanKeyboard_if();
   6612 CD 88 56      [17]  369 	call	_cpct_scanKeyboard_if
                            370 ;src/main.c:145: if (cpct_isAnyKeyPressed()) {
   6615 CD 7B 56      [17]  371 	call	_cpct_isAnyKeyPressed
   6618 7D            [ 4]  372 	ld	a,l
   6619 B7            [ 4]  373 	or	a, a
   661A C8            [11]  374 	ret	Z
                            375 ;src/main.c:146: if (cpct_isKeyPressed(Key_CursorLeft)){
   661B 21 01 01      [10]  376 	ld	hl,#0x0101
   661E CD 4F 54      [17]  377 	call	_cpct_isKeyPressed
   6621 7D            [ 4]  378 	ld	a,l
   6622 B7            [ 4]  379 	or	a, a
                            380 ;src/main.c:147: moverIzquierda();
   6623 C2 E9 7B      [10]  381 	jp	NZ,_moverIzquierda
                            382 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6626 21 00 02      [10]  383 	ld	hl,#0x0200
   6629 CD 4F 54      [17]  384 	call	_cpct_isKeyPressed
   662C 7D            [ 4]  385 	ld	a,l
   662D B7            [ 4]  386 	or	a, a
                            387 ;src/main.c:149: moverDerecha();
   662E C2 0E 7C      [10]  388 	jp	NZ,_moverDerecha
                            389 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6631 21 00 01      [10]  390 	ld	hl,#0x0100
   6634 CD 4F 54      [17]  391 	call	_cpct_isKeyPressed
   6637 7D            [ 4]  392 	ld	a,l
   6638 B7            [ 4]  393 	or	a, a
                            394 ;src/main.c:151: moverArriba();
   6639 C2 53 7C      [10]  395 	jp	NZ,_moverArriba
                            396 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   663C 21 00 04      [10]  397 	ld	hl,#0x0400
   663F CD 4F 54      [17]  398 	call	_cpct_isKeyPressed
   6642 7D            [ 4]  399 	ld	a,l
   6643 B7            [ 4]  400 	or	a, a
                            401 ;src/main.c:153: moverAbajo();
   6644 C2 77 7C      [10]  402 	jp	NZ,_moverAbajo
                            403 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_Space)){
   6647 21 05 80      [10]  404 	ld	hl,#0x8005
   664A CD 4F 54      [17]  405 	call	_cpct_isKeyPressed
   664D 7D            [ 4]  406 	ld	a,l
   664E B7            [ 4]  407 	or	a, a
   664F C8            [11]  408 	ret	Z
                            409 ;src/main.c:155: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6650 21 08 00      [10]  410 	ld	hl, #8
   6653 39            [11]  411 	add	hl, sp
   6654 4E            [ 7]  412 	ld	c, (hl)
   6655 23            [ 6]  413 	inc	hl
   6656 46            [ 7]  414 	ld	b, (hl)
   6657 C5            [11]  415 	push	bc
   6658 21 08 00      [10]  416 	ld	hl, #8
   665B 39            [11]  417 	add	hl, sp
   665C 4E            [ 7]  418 	ld	c, (hl)
   665D 23            [ 6]  419 	inc	hl
   665E 46            [ 7]  420 	ld	b, (hl)
   665F C5            [11]  421 	push	bc
   6660 21 08 00      [10]  422 	ld	hl, #8
   6663 39            [11]  423 	add	hl, sp
   6664 4E            [ 7]  424 	ld	c, (hl)
   6665 23            [ 6]  425 	inc	hl
   6666 46            [ 7]  426 	ld	b, (hl)
   6667 C5            [11]  427 	push	bc
   6668 21 08 00      [10]  428 	ld	hl, #8
   666B 39            [11]  429 	add	hl, sp
   666C 4E            [ 7]  430 	ld	c, (hl)
   666D 23            [ 6]  431 	inc	hl
   666E 46            [ 7]  432 	ld	b, (hl)
   666F C5            [11]  433 	push	bc
   6670 CD 91 47      [17]  434 	call	_lanzarCuchillo
   6673 21 08 00      [10]  435 	ld	hl,#8
   6676 39            [11]  436 	add	hl,sp
   6677 F9            [ 6]  437 	ld	sp,hl
   6678 C9            [10]  438 	ret
                            439 ;src/main.c:160: u8 checkCollision(u8 direction) { // check optimization
                            440 ;	---------------------------------
                            441 ; Function checkCollision
                            442 ; ---------------------------------
   6679                     443 _checkCollision::
   6679 DD E5         [15]  444 	push	ix
   667B DD 21 00 00   [14]  445 	ld	ix,#0
   667F DD 39         [15]  446 	add	ix,sp
   6681 F5            [11]  447 	push	af
                            448 ;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6682 21 00 00      [10]  449 	ld	hl,#0x0000
   6685 E3            [19]  450 	ex	(sp), hl
   6686 11 00 00      [10]  451 	ld	de,#0x0000
   6689 01 00 00      [10]  452 	ld	bc,#0x0000
                            453 ;src/main.c:163: switch (direction) {
   668C 3E 03         [ 7]  454 	ld	a,#0x03
   668E DD 96 04      [19]  455 	sub	a, 4 (ix)
   6691 DA C9 67      [10]  456 	jp	C,00105$
   6694 DD 5E 04      [19]  457 	ld	e,4 (ix)
   6697 16 00         [ 7]  458 	ld	d,#0x00
   6699 21 A0 66      [10]  459 	ld	hl,#00124$
   669C 19            [11]  460 	add	hl,de
   669D 19            [11]  461 	add	hl,de
   669E 19            [11]  462 	add	hl,de
   669F E9            [ 4]  463 	jp	(hl)
   66A0                     464 00124$:
   66A0 C3 AC 66      [10]  465 	jp	00101$
   66A3 C3 01 67      [10]  466 	jp	00102$
   66A6 C3 51 67      [10]  467 	jp	00103$
   66A9 C3 8E 67      [10]  468 	jp	00104$
                            469 ;src/main.c:164: case 0:
   66AC                     470 00101$:
                            471 ;src/main.c:165: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   66AC 21 32 64      [10]  472 	ld	hl, #(_prota + 0x0001) + 0
   66AF 4E            [ 7]  473 	ld	c,(hl)
   66B0 3A 31 64      [13]  474 	ld	a, (#_prota + 0)
   66B3 C6 07         [ 7]  475 	add	a, #0x07
   66B5 47            [ 4]  476 	ld	b,a
   66B6 79            [ 4]  477 	ld	a,c
   66B7 F5            [11]  478 	push	af
   66B8 33            [ 6]  479 	inc	sp
   66B9 C5            [11]  480 	push	bc
   66BA 33            [ 6]  481 	inc	sp
   66BB 2A 0E 65      [16]  482 	ld	hl,(_mapa)
   66BE E5            [11]  483 	push	hl
   66BF CD 61 4B      [17]  484 	call	_getTilePtr
   66C2 F1            [10]  485 	pop	af
   66C3 F1            [10]  486 	pop	af
   66C4 33            [ 6]  487 	inc	sp
   66C5 33            [ 6]  488 	inc	sp
   66C6 E5            [11]  489 	push	hl
                            490 ;src/main.c:166: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   66C7 3A 32 64      [13]  491 	ld	a, (#(_prota + 0x0001) + 0)
   66CA C6 14         [ 7]  492 	add	a, #0x14
   66CC 4F            [ 4]  493 	ld	c,a
   66CD 3A 31 64      [13]  494 	ld	a, (#_prota + 0)
   66D0 C6 07         [ 7]  495 	add	a, #0x07
   66D2 47            [ 4]  496 	ld	b,a
   66D3 79            [ 4]  497 	ld	a,c
   66D4 F5            [11]  498 	push	af
   66D5 33            [ 6]  499 	inc	sp
   66D6 C5            [11]  500 	push	bc
   66D7 33            [ 6]  501 	inc	sp
   66D8 2A 0E 65      [16]  502 	ld	hl,(_mapa)
   66DB E5            [11]  503 	push	hl
   66DC CD 61 4B      [17]  504 	call	_getTilePtr
   66DF F1            [10]  505 	pop	af
   66E0 F1            [10]  506 	pop	af
   66E1 EB            [ 4]  507 	ex	de,hl
                            508 ;src/main.c:167: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   66E2 3A 32 64      [13]  509 	ld	a, (#(_prota + 0x0001) + 0)
   66E5 C6 0B         [ 7]  510 	add	a, #0x0B
   66E7 47            [ 4]  511 	ld	b,a
   66E8 3A 31 64      [13]  512 	ld	a, (#_prota + 0)
   66EB C6 07         [ 7]  513 	add	a, #0x07
   66ED D5            [11]  514 	push	de
   66EE C5            [11]  515 	push	bc
   66EF 33            [ 6]  516 	inc	sp
   66F0 F5            [11]  517 	push	af
   66F1 33            [ 6]  518 	inc	sp
   66F2 2A 0E 65      [16]  519 	ld	hl,(_mapa)
   66F5 E5            [11]  520 	push	hl
   66F6 CD 61 4B      [17]  521 	call	_getTilePtr
   66F9 F1            [10]  522 	pop	af
   66FA F1            [10]  523 	pop	af
   66FB 4D            [ 4]  524 	ld	c,l
   66FC 44            [ 4]  525 	ld	b,h
   66FD D1            [10]  526 	pop	de
                            527 ;src/main.c:168: break;
   66FE C3 C9 67      [10]  528 	jp	00105$
                            529 ;src/main.c:169: case 1:
   6701                     530 00102$:
                            531 ;src/main.c:170: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6701 21 32 64      [10]  532 	ld	hl, #(_prota + 0x0001) + 0
   6704 56            [ 7]  533 	ld	d,(hl)
   6705 21 31 64      [10]  534 	ld	hl, #_prota + 0
   6708 46            [ 7]  535 	ld	b,(hl)
   6709 05            [ 4]  536 	dec	b
   670A D5            [11]  537 	push	de
   670B 33            [ 6]  538 	inc	sp
   670C C5            [11]  539 	push	bc
   670D 33            [ 6]  540 	inc	sp
   670E 2A 0E 65      [16]  541 	ld	hl,(_mapa)
   6711 E5            [11]  542 	push	hl
   6712 CD 61 4B      [17]  543 	call	_getTilePtr
   6715 F1            [10]  544 	pop	af
   6716 F1            [10]  545 	pop	af
   6717 33            [ 6]  546 	inc	sp
   6718 33            [ 6]  547 	inc	sp
   6719 E5            [11]  548 	push	hl
                            549 ;src/main.c:171: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   671A 3A 32 64      [13]  550 	ld	a, (#(_prota + 0x0001) + 0)
   671D C6 14         [ 7]  551 	add	a, #0x14
   671F 57            [ 4]  552 	ld	d,a
   6720 21 31 64      [10]  553 	ld	hl, #_prota + 0
   6723 46            [ 7]  554 	ld	b,(hl)
   6724 05            [ 4]  555 	dec	b
   6725 D5            [11]  556 	push	de
   6726 33            [ 6]  557 	inc	sp
   6727 C5            [11]  558 	push	bc
   6728 33            [ 6]  559 	inc	sp
   6729 2A 0E 65      [16]  560 	ld	hl,(_mapa)
   672C E5            [11]  561 	push	hl
   672D CD 61 4B      [17]  562 	call	_getTilePtr
   6730 F1            [10]  563 	pop	af
   6731 F1            [10]  564 	pop	af
   6732 EB            [ 4]  565 	ex	de,hl
                            566 ;src/main.c:172: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   6733 3A 32 64      [13]  567 	ld	a, (#(_prota + 0x0001) + 0)
   6736 C6 0B         [ 7]  568 	add	a, #0x0B
   6738 47            [ 4]  569 	ld	b,a
   6739 3A 31 64      [13]  570 	ld	a, (#_prota + 0)
   673C C6 FF         [ 7]  571 	add	a,#0xFF
   673E D5            [11]  572 	push	de
   673F C5            [11]  573 	push	bc
   6740 33            [ 6]  574 	inc	sp
   6741 F5            [11]  575 	push	af
   6742 33            [ 6]  576 	inc	sp
   6743 2A 0E 65      [16]  577 	ld	hl,(_mapa)
   6746 E5            [11]  578 	push	hl
   6747 CD 61 4B      [17]  579 	call	_getTilePtr
   674A F1            [10]  580 	pop	af
   674B F1            [10]  581 	pop	af
   674C 4D            [ 4]  582 	ld	c,l
   674D 44            [ 4]  583 	ld	b,h
   674E D1            [10]  584 	pop	de
                            585 ;src/main.c:173: break;
   674F 18 78         [12]  586 	jr	00105$
                            587 ;src/main.c:174: case 2:
   6751                     588 00103$:
                            589 ;src/main.c:175: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6751 3A 32 64      [13]  590 	ld	a, (#(_prota + 0x0001) + 0)
   6754 C6 FE         [ 7]  591 	add	a,#0xFE
   6756 21 31 64      [10]  592 	ld	hl, #_prota + 0
   6759 56            [ 7]  593 	ld	d,(hl)
   675A C5            [11]  594 	push	bc
   675B F5            [11]  595 	push	af
   675C 33            [ 6]  596 	inc	sp
   675D D5            [11]  597 	push	de
   675E 33            [ 6]  598 	inc	sp
   675F 2A 0E 65      [16]  599 	ld	hl,(_mapa)
   6762 E5            [11]  600 	push	hl
   6763 CD 61 4B      [17]  601 	call	_getTilePtr
   6766 F1            [10]  602 	pop	af
   6767 F1            [10]  603 	pop	af
   6768 C1            [10]  604 	pop	bc
   6769 33            [ 6]  605 	inc	sp
   676A 33            [ 6]  606 	inc	sp
   676B E5            [11]  607 	push	hl
                            608 ;src/main.c:176: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   676C 21 32 64      [10]  609 	ld	hl, #(_prota + 0x0001) + 0
   676F 56            [ 7]  610 	ld	d,(hl)
   6770 15            [ 4]  611 	dec	d
   6771 15            [ 4]  612 	dec	d
   6772 3A 31 64      [13]  613 	ld	a, (#_prota + 0)
   6775 C6 03         [ 7]  614 	add	a, #0x03
   6777 C5            [11]  615 	push	bc
   6778 D5            [11]  616 	push	de
   6779 33            [ 6]  617 	inc	sp
   677A F5            [11]  618 	push	af
   677B 33            [ 6]  619 	inc	sp
   677C 2A 0E 65      [16]  620 	ld	hl,(_mapa)
   677F E5            [11]  621 	push	hl
   6780 CD 61 4B      [17]  622 	call	_getTilePtr
   6783 F1            [10]  623 	pop	af
   6784 F1            [10]  624 	pop	af
   6785 EB            [ 4]  625 	ex	de,hl
   6786 C1            [10]  626 	pop	bc
                            627 ;src/main.c:177: *waistTile = 0;
   6787 21 00 00      [10]  628 	ld	hl,#0x0000
   678A 36 00         [10]  629 	ld	(hl),#0x00
                            630 ;src/main.c:178: break;
   678C 18 3B         [12]  631 	jr	00105$
                            632 ;src/main.c:179: case 3:
   678E                     633 00104$:
                            634 ;src/main.c:180: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   678E 3A 32 64      [13]  635 	ld	a, (#(_prota + 0x0001) + 0)
   6791 C6 16         [ 7]  636 	add	a, #0x16
   6793 21 31 64      [10]  637 	ld	hl, #_prota + 0
   6796 56            [ 7]  638 	ld	d,(hl)
   6797 C5            [11]  639 	push	bc
   6798 F5            [11]  640 	push	af
   6799 33            [ 6]  641 	inc	sp
   679A D5            [11]  642 	push	de
   679B 33            [ 6]  643 	inc	sp
   679C 2A 0E 65      [16]  644 	ld	hl,(_mapa)
   679F E5            [11]  645 	push	hl
   67A0 CD 61 4B      [17]  646 	call	_getTilePtr
   67A3 F1            [10]  647 	pop	af
   67A4 F1            [10]  648 	pop	af
   67A5 C1            [10]  649 	pop	bc
   67A6 33            [ 6]  650 	inc	sp
   67A7 33            [ 6]  651 	inc	sp
   67A8 E5            [11]  652 	push	hl
                            653 ;src/main.c:181: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   67A9 3A 32 64      [13]  654 	ld	a, (#(_prota + 0x0001) + 0)
   67AC C6 16         [ 7]  655 	add	a, #0x16
   67AE 57            [ 4]  656 	ld	d,a
   67AF 3A 31 64      [13]  657 	ld	a, (#_prota + 0)
   67B2 C6 03         [ 7]  658 	add	a, #0x03
   67B4 C5            [11]  659 	push	bc
   67B5 D5            [11]  660 	push	de
   67B6 33            [ 6]  661 	inc	sp
   67B7 F5            [11]  662 	push	af
   67B8 33            [ 6]  663 	inc	sp
   67B9 2A 0E 65      [16]  664 	ld	hl,(_mapa)
   67BC E5            [11]  665 	push	hl
   67BD CD 61 4B      [17]  666 	call	_getTilePtr
   67C0 F1            [10]  667 	pop	af
   67C1 F1            [10]  668 	pop	af
   67C2 EB            [ 4]  669 	ex	de,hl
   67C3 C1            [10]  670 	pop	bc
                            671 ;src/main.c:182: *waistTile = 0;
   67C4 21 00 00      [10]  672 	ld	hl,#0x0000
   67C7 36 00         [10]  673 	ld	(hl),#0x00
                            674 ;src/main.c:184: }
   67C9                     675 00105$:
                            676 ;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   67C9 E1            [10]  677 	pop	hl
   67CA E5            [11]  678 	push	hl
   67CB 6E            [ 7]  679 	ld	l,(hl)
   67CC 3E 02         [ 7]  680 	ld	a,#0x02
   67CE 95            [ 4]  681 	sub	a, l
   67CF 38 0E         [12]  682 	jr	C,00106$
   67D1 1A            [ 7]  683 	ld	a,(de)
   67D2 5F            [ 4]  684 	ld	e,a
   67D3 3E 02         [ 7]  685 	ld	a,#0x02
   67D5 93            [ 4]  686 	sub	a, e
   67D6 38 07         [12]  687 	jr	C,00106$
   67D8 0A            [ 7]  688 	ld	a,(bc)
   67D9 4F            [ 4]  689 	ld	c,a
   67DA 3E 02         [ 7]  690 	ld	a,#0x02
   67DC 91            [ 4]  691 	sub	a, c
   67DD 30 04         [12]  692 	jr	NC,00107$
   67DF                     693 00106$:
                            694 ;src/main.c:187: return 1;
   67DF 2E 01         [ 7]  695 	ld	l,#0x01
   67E1 18 02         [12]  696 	jr	00110$
   67E3                     697 00107$:
                            698 ;src/main.c:189: return 0;
   67E3 2E 00         [ 7]  699 	ld	l,#0x00
   67E5                     700 00110$:
   67E5 DD F9         [10]  701 	ld	sp, ix
   67E7 DD E1         [14]  702 	pop	ix
   67E9 C9            [10]  703 	ret
                            704 ;src/main.c:192: void dibujarEnemigo(TEnemy *enemy) {
                            705 ;	---------------------------------
                            706 ; Function dibujarEnemigo
                            707 ; ---------------------------------
   67EA                     708 _dibujarEnemigo::
   67EA DD E5         [15]  709 	push	ix
   67EC DD 21 00 00   [14]  710 	ld	ix,#0
   67F0 DD 39         [15]  711 	add	ix,sp
                            712 ;src/main.c:193: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   67F2 DD 4E 04      [19]  713 	ld	c,4 (ix)
   67F5 DD 46 05      [19]  714 	ld	b,5 (ix)
   67F8 69            [ 4]  715 	ld	l, c
   67F9 60            [ 4]  716 	ld	h, b
   67FA 23            [ 6]  717 	inc	hl
   67FB 56            [ 7]  718 	ld	d,(hl)
   67FC 0A            [ 7]  719 	ld	a,(bc)
   67FD C5            [11]  720 	push	bc
   67FE D5            [11]  721 	push	de
   67FF 33            [ 6]  722 	inc	sp
   6800 F5            [11]  723 	push	af
   6801 33            [ 6]  724 	inc	sp
   6802 21 00 C0      [10]  725 	ld	hl,#0xC000
   6805 E5            [11]  726 	push	hl
   6806 CD 4E 60      [17]  727 	call	_cpct_getScreenPtr
   6809 EB            [ 4]  728 	ex	de,hl
                            729 ;src/main.c:194: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   680A E1            [10]  730 	pop	hl
   680B 01 04 00      [10]  731 	ld	bc, #0x0004
   680E 09            [11]  732 	add	hl, bc
   680F 4E            [ 7]  733 	ld	c,(hl)
   6810 23            [ 6]  734 	inc	hl
   6811 46            [ 7]  735 	ld	b,(hl)
   6812 21 00 01      [10]  736 	ld	hl,#_g_tablatrans
   6815 E5            [11]  737 	push	hl
   6816 21 04 16      [10]  738 	ld	hl,#0x1604
   6819 E5            [11]  739 	push	hl
   681A D5            [11]  740 	push	de
   681B C5            [11]  741 	push	bc
   681C CD 6E 60      [17]  742 	call	_cpct_drawSpriteMaskedAlignedTable
   681F DD E1         [14]  743 	pop	ix
   6821 C9            [10]  744 	ret
                            745 ;src/main.c:197: void dibujarExplosion(TEnemy *enemy) {
                            746 ;	---------------------------------
                            747 ; Function dibujarExplosion
                            748 ; ---------------------------------
   6822                     749 _dibujarExplosion::
   6822 DD E5         [15]  750 	push	ix
   6824 DD 21 00 00   [14]  751 	ld	ix,#0
   6828 DD 39         [15]  752 	add	ix,sp
                            753 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   682A DD 4E 04      [19]  754 	ld	c,4 (ix)
   682D DD 46 05      [19]  755 	ld	b,5 (ix)
   6830 69            [ 4]  756 	ld	l, c
   6831 60            [ 4]  757 	ld	h, b
   6832 23            [ 6]  758 	inc	hl
   6833 56            [ 7]  759 	ld	d,(hl)
   6834 0A            [ 7]  760 	ld	a,(bc)
   6835 47            [ 4]  761 	ld	b,a
   6836 D5            [11]  762 	push	de
   6837 33            [ 6]  763 	inc	sp
   6838 C5            [11]  764 	push	bc
   6839 33            [ 6]  765 	inc	sp
   683A 21 00 C0      [10]  766 	ld	hl,#0xC000
   683D E5            [11]  767 	push	hl
   683E CD 4E 60      [17]  768 	call	_cpct_getScreenPtr
   6841 4D            [ 4]  769 	ld	c,l
   6842 44            [ 4]  770 	ld	b,h
                            771 ;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6843 11 00 01      [10]  772 	ld	de,#_g_tablatrans+0
   6846 D5            [11]  773 	push	de
   6847 21 04 16      [10]  774 	ld	hl,#0x1604
   684A E5            [11]  775 	push	hl
   684B C5            [11]  776 	push	bc
   684C 21 70 19      [10]  777 	ld	hl,#_g_explosion
   684F E5            [11]  778 	push	hl
   6850 CD 6E 60      [17]  779 	call	_cpct_drawSpriteMaskedAlignedTable
   6853 DD E1         [14]  780 	pop	ix
   6855 C9            [10]  781 	ret
                            782 ;src/main.c:202: void borrarExplosion(TEnemy *enemy) {
                            783 ;	---------------------------------
                            784 ; Function borrarExplosion
                            785 ; ---------------------------------
   6856                     786 _borrarExplosion::
   6856 DD E5         [15]  787 	push	ix
   6858 DD 21 00 00   [14]  788 	ld	ix,#0
   685C DD 39         [15]  789 	add	ix,sp
   685E F5            [11]  790 	push	af
   685F 3B            [ 6]  791 	dec	sp
                            792 ;src/main.c:205: u8 w = 4 + (enemy->px & 1);
   6860 DD 5E 04      [19]  793 	ld	e,4 (ix)
   6863 DD 56 05      [19]  794 	ld	d,5 (ix)
   6866 6B            [ 4]  795 	ld	l, e
   6867 62            [ 4]  796 	ld	h, d
   6868 23            [ 6]  797 	inc	hl
   6869 23            [ 6]  798 	inc	hl
   686A 4E            [ 7]  799 	ld	c,(hl)
   686B 79            [ 4]  800 	ld	a,c
   686C E6 01         [ 7]  801 	and	a, #0x01
   686E 47            [ 4]  802 	ld	b,a
   686F 04            [ 4]  803 	inc	b
   6870 04            [ 4]  804 	inc	b
   6871 04            [ 4]  805 	inc	b
   6872 04            [ 4]  806 	inc	b
                            807 ;src/main.c:206: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   6873 EB            [ 4]  808 	ex	de,hl
   6874 23            [ 6]  809 	inc	hl
   6875 23            [ 6]  810 	inc	hl
   6876 23            [ 6]  811 	inc	hl
   6877 5E            [ 7]  812 	ld	e,(hl)
   6878 CB 4B         [ 8]  813 	bit	1, e
   687A 28 04         [12]  814 	jr	Z,00103$
   687C 3E 01         [ 7]  815 	ld	a,#0x01
   687E 18 02         [12]  816 	jr	00104$
   6880                     817 00103$:
   6880 3E 00         [ 7]  818 	ld	a,#0x00
   6882                     819 00104$:
   6882 C6 06         [ 7]  820 	add	a, #0x06
   6884 DD 77 FD      [19]  821 	ld	-3 (ix),a
                            822 ;src/main.c:208: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6887 FD 2A 0E 65   [20]  823 	ld	iy,(_mapa)
   688B 16 00         [ 7]  824 	ld	d,#0x00
   688D 7B            [ 4]  825 	ld	a,e
   688E C6 E8         [ 7]  826 	add	a,#0xE8
   6890 DD 77 FE      [19]  827 	ld	-2 (ix),a
   6893 7A            [ 4]  828 	ld	a,d
   6894 CE FF         [ 7]  829 	adc	a,#0xFF
   6896 DD 77 FF      [19]  830 	ld	-1 (ix),a
   6899 DD 6E FE      [19]  831 	ld	l,-2 (ix)
   689C DD 66 FF      [19]  832 	ld	h,-1 (ix)
   689F DD CB FF 7E   [20]  833 	bit	7, -1 (ix)
   68A3 28 04         [12]  834 	jr	Z,00105$
   68A5 21 EB FF      [10]  835 	ld	hl,#0xFFEB
   68A8 19            [11]  836 	add	hl,de
   68A9                     837 00105$:
   68A9 CB 2C         [ 8]  838 	sra	h
   68AB CB 1D         [ 8]  839 	rr	l
   68AD CB 2C         [ 8]  840 	sra	h
   68AF CB 1D         [ 8]  841 	rr	l
   68B1 55            [ 4]  842 	ld	d,l
   68B2 CB 39         [ 8]  843 	srl	c
   68B4 FD E5         [15]  844 	push	iy
   68B6 21 F0 C0      [10]  845 	ld	hl,#0xC0F0
   68B9 E5            [11]  846 	push	hl
   68BA 3E 28         [ 7]  847 	ld	a,#0x28
   68BC F5            [11]  848 	push	af
   68BD 33            [ 6]  849 	inc	sp
   68BE DD 7E FD      [19]  850 	ld	a,-3 (ix)
   68C1 F5            [11]  851 	push	af
   68C2 33            [ 6]  852 	inc	sp
   68C3 C5            [11]  853 	push	bc
   68C4 33            [ 6]  854 	inc	sp
   68C5 D5            [11]  855 	push	de
   68C6 33            [ 6]  856 	inc	sp
   68C7 79            [ 4]  857 	ld	a,c
   68C8 F5            [11]  858 	push	af
   68C9 33            [ 6]  859 	inc	sp
   68CA CD 30 55      [17]  860 	call	_cpct_etm_drawTileBox2x4
   68CD DD F9         [10]  861 	ld	sp, ix
   68CF DD E1         [14]  862 	pop	ix
   68D1 C9            [10]  863 	ret
                            864 ;src/main.c:212: void borrarEnemigo(u8 x, u8 y) {
                            865 ;	---------------------------------
                            866 ; Function borrarEnemigo
                            867 ; ---------------------------------
   68D2                     868 _borrarEnemigo::
   68D2 DD E5         [15]  869 	push	ix
   68D4 DD 21 00 00   [14]  870 	ld	ix,#0
   68D8 DD 39         [15]  871 	add	ix,sp
   68DA F5            [11]  872 	push	af
   68DB F5            [11]  873 	push	af
                            874 ;src/main.c:216: u8 w = 4 + (x & 1);
   68DC DD 7E 04      [19]  875 	ld	a,4 (ix)
   68DF E6 01         [ 7]  876 	and	a, #0x01
   68E1 4F            [ 4]  877 	ld	c,a
   68E2 0C            [ 4]  878 	inc	c
   68E3 0C            [ 4]  879 	inc	c
   68E4 0C            [ 4]  880 	inc	c
   68E5 0C            [ 4]  881 	inc	c
                            882 ;src/main.c:218: u8 h = 6 + (y & 3 ? 1 : 0);
   68E6 DD 7E 05      [19]  883 	ld	a,5 (ix)
   68E9 E6 03         [ 7]  884 	and	a, #0x03
   68EB 28 04         [12]  885 	jr	Z,00103$
   68ED 3E 01         [ 7]  886 	ld	a,#0x01
   68EF 18 02         [12]  887 	jr	00104$
   68F1                     888 00103$:
   68F1 3E 00         [ 7]  889 	ld	a,#0x00
   68F3                     890 00104$:
   68F3 C6 06         [ 7]  891 	add	a, #0x06
   68F5 47            [ 4]  892 	ld	b,a
                            893 ;src/main.c:220: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68F6 2A 0E 65      [16]  894 	ld	hl,(_mapa)
   68F9 DD 75 FE      [19]  895 	ld	-2 (ix),l
   68FC DD 74 FF      [19]  896 	ld	-1 (ix),h
   68FF DD 5E 05      [19]  897 	ld	e,5 (ix)
   6902 16 00         [ 7]  898 	ld	d,#0x00
   6904 7B            [ 4]  899 	ld	a,e
   6905 C6 E8         [ 7]  900 	add	a,#0xE8
   6907 DD 77 FC      [19]  901 	ld	-4 (ix),a
   690A 7A            [ 4]  902 	ld	a,d
   690B CE FF         [ 7]  903 	adc	a,#0xFF
   690D DD 77 FD      [19]  904 	ld	-3 (ix),a
   6910 E1            [10]  905 	pop	hl
   6911 E5            [11]  906 	push	hl
   6912 DD CB FD 7E   [20]  907 	bit	7, -3 (ix)
   6916 28 04         [12]  908 	jr	Z,00105$
   6918 21 EB FF      [10]  909 	ld	hl,#0xFFEB
   691B 19            [11]  910 	add	hl,de
   691C                     911 00105$:
   691C CB 2C         [ 8]  912 	sra	h
   691E CB 1D         [ 8]  913 	rr	l
   6920 CB 2C         [ 8]  914 	sra	h
   6922 CB 1D         [ 8]  915 	rr	l
   6924 5D            [ 4]  916 	ld	e,l
   6925 DD 56 04      [19]  917 	ld	d,4 (ix)
   6928 CB 3A         [ 8]  918 	srl	d
   692A DD 6E FE      [19]  919 	ld	l,-2 (ix)
   692D DD 66 FF      [19]  920 	ld	h,-1 (ix)
   6930 E5            [11]  921 	push	hl
   6931 21 F0 C0      [10]  922 	ld	hl,#0xC0F0
   6934 E5            [11]  923 	push	hl
   6935 3E 28         [ 7]  924 	ld	a,#0x28
   6937 F5            [11]  925 	push	af
   6938 33            [ 6]  926 	inc	sp
   6939 C5            [11]  927 	push	bc
   693A 7B            [ 4]  928 	ld	a,e
   693B F5            [11]  929 	push	af
   693C 33            [ 6]  930 	inc	sp
   693D D5            [11]  931 	push	de
   693E 33            [ 6]  932 	inc	sp
   693F CD 30 55      [17]  933 	call	_cpct_etm_drawTileBox2x4
   6942 DD F9         [10]  934 	ld	sp, ix
   6944 DD E1         [14]  935 	pop	ix
   6946 C9            [10]  936 	ret
                            937 ;src/main.c:223: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            938 ;	---------------------------------
                            939 ; Function redibujarEnemigo
                            940 ; ---------------------------------
   6947                     941 _redibujarEnemigo::
   6947 DD E5         [15]  942 	push	ix
   6949 DD 21 00 00   [14]  943 	ld	ix,#0
   694D DD 39         [15]  944 	add	ix,sp
                            945 ;src/main.c:224: borrarEnemigo(x, y);
   694F DD 66 05      [19]  946 	ld	h,5 (ix)
   6952 DD 6E 04      [19]  947 	ld	l,4 (ix)
   6955 E5            [11]  948 	push	hl
   6956 CD D2 68      [17]  949 	call	_borrarEnemigo
   6959 F1            [10]  950 	pop	af
                            951 ;src/main.c:225: enemy->px = enemy->x;
   695A DD 4E 06      [19]  952 	ld	c,6 (ix)
   695D DD 46 07      [19]  953 	ld	b,7 (ix)
   6960 59            [ 4]  954 	ld	e, c
   6961 50            [ 4]  955 	ld	d, b
   6962 13            [ 6]  956 	inc	de
   6963 13            [ 6]  957 	inc	de
   6964 0A            [ 7]  958 	ld	a,(bc)
   6965 12            [ 7]  959 	ld	(de),a
                            960 ;src/main.c:226: enemy->py = enemy->y;
   6966 59            [ 4]  961 	ld	e, c
   6967 50            [ 4]  962 	ld	d, b
   6968 13            [ 6]  963 	inc	de
   6969 13            [ 6]  964 	inc	de
   696A 13            [ 6]  965 	inc	de
   696B 69            [ 4]  966 	ld	l, c
   696C 60            [ 4]  967 	ld	h, b
   696D 23            [ 6]  968 	inc	hl
   696E 7E            [ 7]  969 	ld	a,(hl)
   696F 12            [ 7]  970 	ld	(de),a
                            971 ;src/main.c:227: dibujarEnemigo(enemy);
   6970 C5            [11]  972 	push	bc
   6971 CD EA 67      [17]  973 	call	_dibujarEnemigo
   6974 F1            [10]  974 	pop	af
   6975 DD E1         [14]  975 	pop	ix
   6977 C9            [10]  976 	ret
                            977 ;src/main.c:231: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            978 ;	---------------------------------
                            979 ; Function checkEnemyDead
                            980 ; ---------------------------------
   6978                     981 _checkEnemyDead::
   6978 DD E5         [15]  982 	push	ix
   697A DD 21 00 00   [14]  983 	ld	ix,#0
   697E DD 39         [15]  984 	add	ix,sp
   6980 21 FA FF      [10]  985 	ld	hl,#-6
   6983 39            [11]  986 	add	hl,sp
   6984 F9            [ 6]  987 	ld	sp,hl
                            988 ;src/main.c:233: switch (direction) {
   6985 3E 03         [ 7]  989 	ld	a,#0x03
   6987 DD 96 04      [19]  990 	sub	a, 4 (ix)
   698A DA 60 6B      [10]  991 	jp	C,00134$
                            992 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   698D DD 7E 05      [19]  993 	ld	a,5 (ix)
   6990 DD 77 FC      [19]  994 	ld	-4 (ix),a
   6993 DD 7E 06      [19]  995 	ld	a,6 (ix)
   6996 DD 77 FD      [19]  996 	ld	-3 (ix),a
   6999 DD 7E FC      [19]  997 	ld	a,-4 (ix)
   699C C6 01         [ 7]  998 	add	a, #0x01
   699E DD 77 FA      [19]  999 	ld	-6 (ix),a
   69A1 DD 7E FD      [19] 1000 	ld	a,-3 (ix)
   69A4 CE 00         [ 7] 1001 	adc	a, #0x00
   69A6 DD 77 FB      [19] 1002 	ld	-5 (ix),a
                           1003 ;src/main.c:238: enemy->muerto = SI;
   69A9 DD 7E FC      [19] 1004 	ld	a,-4 (ix)
   69AC C6 08         [ 7] 1005 	add	a, #0x08
   69AE DD 77 FE      [19] 1006 	ld	-2 (ix),a
   69B1 DD 7E FD      [19] 1007 	ld	a,-3 (ix)
   69B4 CE 00         [ 7] 1008 	adc	a, #0x00
   69B6 DD 77 FF      [19] 1009 	ld	-1 (ix),a
                           1010 ;src/main.c:233: switch (direction) {
   69B9 DD 5E 04      [19] 1011 	ld	e,4 (ix)
   69BC 16 00         [ 7] 1012 	ld	d,#0x00
   69BE 21 C5 69      [10] 1013 	ld	hl,#00196$
   69C1 19            [11] 1014 	add	hl,de
   69C2 19            [11] 1015 	add	hl,de
   69C3 19            [11] 1016 	add	hl,de
   69C4 E9            [ 4] 1017 	jp	(hl)
   69C5                    1018 00196$:
   69C5 C3 39 6A      [10] 1019 	jp	00109$
   69C8 C3 D1 69      [10] 1020 	jp	00101$
   69CB C3 02 6B      [10] 1021 	jp	00125$
   69CE C3 A1 6A      [10] 1022 	jp	00117$
                           1023 ;src/main.c:234: case 1:
   69D1                    1024 00101$:
                           1025 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69D1 21 3A 64      [10] 1026 	ld	hl, #_cu + 1
   69D4 4E            [ 7] 1027 	ld	c,(hl)
   69D5 06 00         [ 7] 1028 	ld	b,#0x00
   69D7 21 04 00      [10] 1029 	ld	hl,#0x0004
   69DA 09            [11] 1030 	add	hl,bc
   69DB 5D            [ 4] 1031 	ld	e,l
   69DC 7C            [ 4] 1032 	ld	a, h
   69DD B3            [ 4] 1033 	or	a, e
   69DE D6 01         [ 7] 1034 	sub	a,#0x01
   69E0 3E 00         [ 7] 1035 	ld	a,#0x00
   69E2 17            [ 4] 1036 	rla
   69E3 5F            [ 4] 1037 	ld	e,a
   69E4 E1            [10] 1038 	pop	hl
   69E5 E5            [11] 1039 	push	hl
   69E6 6E            [ 7] 1040 	ld	l,(hl)
   69E7 55            [ 4] 1041 	ld	d,l
   69E8 7B            [ 4] 1042 	ld	a,e
   69E9 92            [ 4] 1043 	sub	a, d
   69EA E2 EF 69      [10] 1044 	jp	PO, 00197$
   69ED EE 80         [ 7] 1045 	xor	a, #0x80
   69EF                    1046 00197$:
   69EF FA 04 6A      [10] 1047 	jp	M,00106$
   69F2 26 00         [ 7] 1048 	ld	h,#0x00
   69F4 11 16 00      [10] 1049 	ld	de,#0x0016
   69F7 19            [11] 1050 	add	hl,de
   69F8 7D            [ 4] 1051 	ld	a,l
   69F9 91            [ 4] 1052 	sub	a, c
   69FA 7C            [ 4] 1053 	ld	a,h
   69FB 98            [ 4] 1054 	sbc	a, b
   69FC E2 01 6A      [10] 1055 	jp	PO, 00198$
   69FF EE 80         [ 7] 1056 	xor	a, #0x80
   6A01                    1057 00198$:
   6A01 F2 60 6B      [10] 1058 	jp	P,00134$
   6A04                    1059 00106$:
                           1060 ;src/main.c:236: if(cu.x > enemy->x){ //si el cu esta abajo
   6A04 21 39 64      [10] 1061 	ld	hl, #_cu + 0
   6A07 4E            [ 7] 1062 	ld	c,(hl)
   6A08 DD 6E FC      [19] 1063 	ld	l,-4 (ix)
   6A0B DD 66 FD      [19] 1064 	ld	h,-3 (ix)
   6A0E 5E            [ 7] 1065 	ld	e,(hl)
   6A0F 7B            [ 4] 1066 	ld	a,e
   6A10 91            [ 4] 1067 	sub	a, c
   6A11 D2 60 6B      [10] 1068 	jp	NC,00134$
                           1069 ;src/main.c:237: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A14 69            [ 4] 1070 	ld	l,c
   6A15 26 00         [ 7] 1071 	ld	h,#0x00
   6A17 16 00         [ 7] 1072 	ld	d,#0x00
   6A19 13            [ 6] 1073 	inc	de
   6A1A 13            [ 6] 1074 	inc	de
   6A1B 13            [ 6] 1075 	inc	de
   6A1C 13            [ 6] 1076 	inc	de
   6A1D BF            [ 4] 1077 	cp	a, a
   6A1E ED 52         [15] 1078 	sbc	hl, de
   6A20 3E 01         [ 7] 1079 	ld	a,#0x01
   6A22 BD            [ 4] 1080 	cp	a, l
   6A23 3E 00         [ 7] 1081 	ld	a,#0x00
   6A25 9C            [ 4] 1082 	sbc	a, h
   6A26 E2 2B 6A      [10] 1083 	jp	PO, 00199$
   6A29 EE 80         [ 7] 1084 	xor	a, #0x80
   6A2B                    1085 00199$:
   6A2B FA 60 6B      [10] 1086 	jp	M,00134$
                           1087 ;src/main.c:238: enemy->muerto = SI;
   6A2E DD 6E FE      [19] 1088 	ld	l,-2 (ix)
   6A31 DD 66 FF      [19] 1089 	ld	h,-1 (ix)
   6A34 36 01         [10] 1090 	ld	(hl),#0x01
                           1091 ;src/main.c:242: break;
   6A36 C3 60 6B      [10] 1092 	jp	00134$
                           1093 ;src/main.c:243: case 0:
   6A39                    1094 00109$:
                           1095 ;src/main.c:244: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6A39 21 3A 64      [10] 1096 	ld	hl, #_cu + 1
   6A3C 4E            [ 7] 1097 	ld	c,(hl)
   6A3D 06 00         [ 7] 1098 	ld	b,#0x00
   6A3F 21 04 00      [10] 1099 	ld	hl,#0x0004
   6A42 09            [11] 1100 	add	hl,bc
   6A43 5D            [ 4] 1101 	ld	e,l
   6A44 7C            [ 4] 1102 	ld	a, h
   6A45 B3            [ 4] 1103 	or	a, e
   6A46 D6 01         [ 7] 1104 	sub	a,#0x01
   6A48 3E 00         [ 7] 1105 	ld	a,#0x00
   6A4A 17            [ 4] 1106 	rla
   6A4B 5F            [ 4] 1107 	ld	e,a
   6A4C E1            [10] 1108 	pop	hl
   6A4D E5            [11] 1109 	push	hl
   6A4E 6E            [ 7] 1110 	ld	l,(hl)
   6A4F 55            [ 4] 1111 	ld	d,l
   6A50 7B            [ 4] 1112 	ld	a,e
   6A51 92            [ 4] 1113 	sub	a, d
   6A52 E2 57 6A      [10] 1114 	jp	PO, 00200$
   6A55 EE 80         [ 7] 1115 	xor	a, #0x80
   6A57                    1116 00200$:
   6A57 FA 6C 6A      [10] 1117 	jp	M,00114$
   6A5A 26 00         [ 7] 1118 	ld	h,#0x00
   6A5C 11 16 00      [10] 1119 	ld	de,#0x0016
   6A5F 19            [11] 1120 	add	hl,de
   6A60 7D            [ 4] 1121 	ld	a,l
   6A61 91            [ 4] 1122 	sub	a, c
   6A62 7C            [ 4] 1123 	ld	a,h
   6A63 98            [ 4] 1124 	sbc	a, b
   6A64 E2 69 6A      [10] 1125 	jp	PO, 00201$
   6A67 EE 80         [ 7] 1126 	xor	a, #0x80
   6A69                    1127 00201$:
   6A69 F2 60 6B      [10] 1128 	jp	P,00134$
   6A6C                    1129 00114$:
                           1130 ;src/main.c:245: if(enemy->x > cu.x){ //si el cu esta abajo
   6A6C DD 6E FC      [19] 1131 	ld	l,-4 (ix)
   6A6F DD 66 FD      [19] 1132 	ld	h,-3 (ix)
   6A72 4E            [ 7] 1133 	ld	c,(hl)
   6A73 21 39 64      [10] 1134 	ld	hl, #_cu + 0
   6A76 5E            [ 7] 1135 	ld	e,(hl)
   6A77 7B            [ 4] 1136 	ld	a,e
   6A78 91            [ 4] 1137 	sub	a, c
   6A79 D2 60 6B      [10] 1138 	jp	NC,00134$
                           1139 ;src/main.c:246: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A7C 69            [ 4] 1140 	ld	l,c
   6A7D 26 00         [ 7] 1141 	ld	h,#0x00
   6A7F 16 00         [ 7] 1142 	ld	d,#0x00
   6A81 13            [ 6] 1143 	inc	de
   6A82 13            [ 6] 1144 	inc	de
   6A83 13            [ 6] 1145 	inc	de
   6A84 13            [ 6] 1146 	inc	de
   6A85 BF            [ 4] 1147 	cp	a, a
   6A86 ED 52         [15] 1148 	sbc	hl, de
   6A88 3E 01         [ 7] 1149 	ld	a,#0x01
   6A8A BD            [ 4] 1150 	cp	a, l
   6A8B 3E 00         [ 7] 1151 	ld	a,#0x00
   6A8D 9C            [ 4] 1152 	sbc	a, h
   6A8E E2 93 6A      [10] 1153 	jp	PO, 00202$
   6A91 EE 80         [ 7] 1154 	xor	a, #0x80
   6A93                    1155 00202$:
   6A93 FA 60 6B      [10] 1156 	jp	M,00134$
                           1157 ;src/main.c:247: enemy->muerto = SI;
   6A96 DD 6E FE      [19] 1158 	ld	l,-2 (ix)
   6A99 DD 66 FF      [19] 1159 	ld	h,-1 (ix)
   6A9C 36 01         [10] 1160 	ld	(hl),#0x01
                           1161 ;src/main.c:251: break;
   6A9E C3 60 6B      [10] 1162 	jp	00134$
                           1163 ;src/main.c:252: case 3:
   6AA1                    1164 00117$:
                           1165 ;src/main.c:253: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6AA1 21 39 64      [10] 1166 	ld	hl, #_cu + 0
   6AA4 4E            [ 7] 1167 	ld	c,(hl)
   6AA5 06 00         [ 7] 1168 	ld	b,#0x00
   6AA7 59            [ 4] 1169 	ld	e, c
   6AA8 50            [ 4] 1170 	ld	d, b
   6AA9 13            [ 6] 1171 	inc	de
   6AAA 13            [ 6] 1172 	inc	de
   6AAB DD 6E FC      [19] 1173 	ld	l,-4 (ix)
   6AAE DD 66 FD      [19] 1174 	ld	h,-3 (ix)
   6AB1 6E            [ 7] 1175 	ld	l,(hl)
   6AB2 26 00         [ 7] 1176 	ld	h,#0x00
   6AB4 7B            [ 4] 1177 	ld	a,e
   6AB5 95            [ 4] 1178 	sub	a, l
   6AB6 7A            [ 4] 1179 	ld	a,d
   6AB7 9C            [ 4] 1180 	sbc	a, h
   6AB8 E2 BD 6A      [10] 1181 	jp	PO, 00203$
   6ABB EE 80         [ 7] 1182 	xor	a, #0x80
   6ABD                    1183 00203$:
   6ABD FA 60 6B      [10] 1184 	jp	M,00134$
   6AC0 11 04 00      [10] 1185 	ld	de,#0x0004
   6AC3 19            [11] 1186 	add	hl,de
   6AC4 7D            [ 4] 1187 	ld	a,l
   6AC5 91            [ 4] 1188 	sub	a, c
   6AC6 7C            [ 4] 1189 	ld	a,h
   6AC7 98            [ 4] 1190 	sbc	a, b
   6AC8 E2 CD 6A      [10] 1191 	jp	PO, 00204$
   6ACB EE 80         [ 7] 1192 	xor	a, #0x80
   6ACD                    1193 00204$:
   6ACD FA 60 6B      [10] 1194 	jp	M,00134$
                           1195 ;src/main.c:254: if(enemy->y>cu.y){
   6AD0 E1            [10] 1196 	pop	hl
   6AD1 E5            [11] 1197 	push	hl
   6AD2 4E            [ 7] 1198 	ld	c,(hl)
   6AD3 21 3A 64      [10] 1199 	ld	hl, #(_cu + 0x0001) + 0
   6AD6 5E            [ 7] 1200 	ld	e,(hl)
   6AD7 7B            [ 4] 1201 	ld	a,e
   6AD8 91            [ 4] 1202 	sub	a, c
   6AD9 D2 60 6B      [10] 1203 	jp	NC,00134$
                           1204 ;src/main.c:255: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6ADC 06 00         [ 7] 1205 	ld	b,#0x00
   6ADE 16 00         [ 7] 1206 	ld	d,#0x00
   6AE0 21 08 00      [10] 1207 	ld	hl,#0x0008
   6AE3 19            [11] 1208 	add	hl,de
   6AE4 79            [ 4] 1209 	ld	a,c
   6AE5 95            [ 4] 1210 	sub	a, l
   6AE6 4F            [ 4] 1211 	ld	c,a
   6AE7 78            [ 4] 1212 	ld	a,b
   6AE8 9C            [ 4] 1213 	sbc	a, h
   6AE9 47            [ 4] 1214 	ld	b,a
   6AEA 3E 02         [ 7] 1215 	ld	a,#0x02
   6AEC B9            [ 4] 1216 	cp	a, c
   6AED 3E 00         [ 7] 1217 	ld	a,#0x00
   6AEF 98            [ 4] 1218 	sbc	a, b
   6AF0 E2 F5 6A      [10] 1219 	jp	PO, 00205$
   6AF3 EE 80         [ 7] 1220 	xor	a, #0x80
   6AF5                    1221 00205$:
   6AF5 F2 60 6B      [10] 1222 	jp	P,00134$
                           1223 ;src/main.c:256: enemy->muerto = SI;
   6AF8 DD 6E FE      [19] 1224 	ld	l,-2 (ix)
   6AFB DD 66 FF      [19] 1225 	ld	h,-1 (ix)
   6AFE 36 01         [10] 1226 	ld	(hl),#0x01
                           1227 ;src/main.c:260: break;
   6B00 18 5E         [12] 1228 	jr	00134$
                           1229 ;src/main.c:261: case 2:
   6B02                    1230 00125$:
                           1231 ;src/main.c:262: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6B02 21 39 64      [10] 1232 	ld	hl, #_cu + 0
   6B05 4E            [ 7] 1233 	ld	c,(hl)
   6B06 06 00         [ 7] 1234 	ld	b,#0x00
   6B08 59            [ 4] 1235 	ld	e, c
   6B09 50            [ 4] 1236 	ld	d, b
   6B0A 13            [ 6] 1237 	inc	de
   6B0B 13            [ 6] 1238 	inc	de
   6B0C DD 6E FC      [19] 1239 	ld	l,-4 (ix)
   6B0F DD 66 FD      [19] 1240 	ld	h,-3 (ix)
   6B12 6E            [ 7] 1241 	ld	l,(hl)
   6B13 26 00         [ 7] 1242 	ld	h,#0x00
   6B15 7B            [ 4] 1243 	ld	a,e
   6B16 95            [ 4] 1244 	sub	a, l
   6B17 7A            [ 4] 1245 	ld	a,d
   6B18 9C            [ 4] 1246 	sbc	a, h
   6B19 E2 1E 6B      [10] 1247 	jp	PO, 00206$
   6B1C EE 80         [ 7] 1248 	xor	a, #0x80
   6B1E                    1249 00206$:
   6B1E FA 60 6B      [10] 1250 	jp	M,00134$
   6B21 11 04 00      [10] 1251 	ld	de,#0x0004
   6B24 19            [11] 1252 	add	hl,de
   6B25 7D            [ 4] 1253 	ld	a,l
   6B26 91            [ 4] 1254 	sub	a, c
   6B27 7C            [ 4] 1255 	ld	a,h
   6B28 98            [ 4] 1256 	sbc	a, b
   6B29 E2 2E 6B      [10] 1257 	jp	PO, 00207$
   6B2C EE 80         [ 7] 1258 	xor	a, #0x80
   6B2E                    1259 00207$:
   6B2E FA 60 6B      [10] 1260 	jp	M,00134$
                           1261 ;src/main.c:263: if(cu.y > enemy->y){ //si el cu esta abajo
   6B31 21 3A 64      [10] 1262 	ld	hl, #(_cu + 0x0001) + 0
   6B34 4E            [ 7] 1263 	ld	c,(hl)
   6B35 E1            [10] 1264 	pop	hl
   6B36 E5            [11] 1265 	push	hl
   6B37 5E            [ 7] 1266 	ld	e,(hl)
   6B38 7B            [ 4] 1267 	ld	a,e
   6B39 91            [ 4] 1268 	sub	a, c
   6B3A 30 24         [12] 1269 	jr	NC,00134$
                           1270 ;src/main.c:264: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6B3C 06 00         [ 7] 1271 	ld	b,#0x00
   6B3E 16 00         [ 7] 1272 	ld	d,#0x00
   6B40 21 16 00      [10] 1273 	ld	hl,#0x0016
   6B43 19            [11] 1274 	add	hl,de
   6B44 79            [ 4] 1275 	ld	a,c
   6B45 95            [ 4] 1276 	sub	a, l
   6B46 4F            [ 4] 1277 	ld	c,a
   6B47 78            [ 4] 1278 	ld	a,b
   6B48 9C            [ 4] 1279 	sbc	a, h
   6B49 47            [ 4] 1280 	ld	b,a
   6B4A 3E 02         [ 7] 1281 	ld	a,#0x02
   6B4C B9            [ 4] 1282 	cp	a, c
   6B4D 3E 00         [ 7] 1283 	ld	a,#0x00
   6B4F 98            [ 4] 1284 	sbc	a, b
   6B50 E2 55 6B      [10] 1285 	jp	PO, 00208$
   6B53 EE 80         [ 7] 1286 	xor	a, #0x80
   6B55                    1287 00208$:
   6B55 F2 60 6B      [10] 1288 	jp	P,00134$
                           1289 ;src/main.c:265: enemy->muerto = SI;
   6B58 DD 6E FE      [19] 1290 	ld	l,-2 (ix)
   6B5B DD 66 FF      [19] 1291 	ld	h,-1 (ix)
   6B5E 36 01         [10] 1292 	ld	(hl),#0x01
                           1293 ;src/main.c:271: }
   6B60                    1294 00134$:
   6B60 DD F9         [10] 1295 	ld	sp, ix
   6B62 DD E1         [14] 1296 	pop	ix
   6B64 C9            [10] 1297 	ret
                           1298 ;src/main.c:274: void moverEnemigoArriba(TEnemy *enemy){
                           1299 ;	---------------------------------
                           1300 ; Function moverEnemigoArriba
                           1301 ; ---------------------------------
   6B65                    1302 _moverEnemigoArriba::
   6B65 DD E5         [15] 1303 	push	ix
   6B67 DD 21 00 00   [14] 1304 	ld	ix,#0
   6B6B DD 39         [15] 1305 	add	ix,sp
                           1306 ;src/main.c:275: enemy->y--;
   6B6D DD 4E 04      [19] 1307 	ld	c,4 (ix)
   6B70 DD 46 05      [19] 1308 	ld	b,5 (ix)
   6B73 69            [ 4] 1309 	ld	l, c
   6B74 60            [ 4] 1310 	ld	h, b
   6B75 23            [ 6] 1311 	inc	hl
   6B76 5E            [ 7] 1312 	ld	e,(hl)
   6B77 1D            [ 4] 1313 	dec	e
   6B78 73            [ 7] 1314 	ld	(hl),e
                           1315 ;src/main.c:276: enemy->y--;
   6B79 1D            [ 4] 1316 	dec	e
   6B7A 73            [ 7] 1317 	ld	(hl),e
                           1318 ;src/main.c:277: enemy->mover = SI;
   6B7B 21 06 00      [10] 1319 	ld	hl,#0x0006
   6B7E 09            [11] 1320 	add	hl,bc
   6B7F 36 01         [10] 1321 	ld	(hl),#0x01
   6B81 DD E1         [14] 1322 	pop	ix
   6B83 C9            [10] 1323 	ret
                           1324 ;src/main.c:280: void moverEnemigoAbajo(TEnemy *enemy){
                           1325 ;	---------------------------------
                           1326 ; Function moverEnemigoAbajo
                           1327 ; ---------------------------------
   6B84                    1328 _moverEnemigoAbajo::
   6B84 DD E5         [15] 1329 	push	ix
   6B86 DD 21 00 00   [14] 1330 	ld	ix,#0
   6B8A DD 39         [15] 1331 	add	ix,sp
                           1332 ;src/main.c:281: enemy->y++;
   6B8C DD 4E 04      [19] 1333 	ld	c,4 (ix)
   6B8F DD 46 05      [19] 1334 	ld	b,5 (ix)
   6B92 59            [ 4] 1335 	ld	e, c
   6B93 50            [ 4] 1336 	ld	d, b
   6B94 13            [ 6] 1337 	inc	de
   6B95 1A            [ 7] 1338 	ld	a,(de)
   6B96 3C            [ 4] 1339 	inc	a
   6B97 12            [ 7] 1340 	ld	(de),a
                           1341 ;src/main.c:282: enemy->y++;
   6B98 3C            [ 4] 1342 	inc	a
   6B99 12            [ 7] 1343 	ld	(de),a
                           1344 ;src/main.c:283: enemy->mover = SI;
   6B9A 21 06 00      [10] 1345 	ld	hl,#0x0006
   6B9D 09            [11] 1346 	add	hl,bc
   6B9E 36 01         [10] 1347 	ld	(hl),#0x01
   6BA0 DD E1         [14] 1348 	pop	ix
   6BA2 C9            [10] 1349 	ret
                           1350 ;src/main.c:286: void moverEnemigoDerecha(TEnemy *enemy){
                           1351 ;	---------------------------------
                           1352 ; Function moverEnemigoDerecha
                           1353 ; ---------------------------------
   6BA3                    1354 _moverEnemigoDerecha::
                           1355 ;src/main.c:287: enemy->x++;
   6BA3 D1            [10] 1356 	pop	de
   6BA4 C1            [10] 1357 	pop	bc
   6BA5 C5            [11] 1358 	push	bc
   6BA6 D5            [11] 1359 	push	de
   6BA7 0A            [ 7] 1360 	ld	a,(bc)
   6BA8 3C            [ 4] 1361 	inc	a
   6BA9 02            [ 7] 1362 	ld	(bc),a
                           1363 ;src/main.c:288: enemy->x++;
   6BAA 3C            [ 4] 1364 	inc	a
   6BAB 02            [ 7] 1365 	ld	(bc),a
                           1366 ;src/main.c:289: enemy->mover = SI;
   6BAC 21 06 00      [10] 1367 	ld	hl,#0x0006
   6BAF 09            [11] 1368 	add	hl,bc
   6BB0 36 01         [10] 1369 	ld	(hl),#0x01
   6BB2 C9            [10] 1370 	ret
                           1371 ;src/main.c:292: void moverEnemigoIzquierda(TEnemy *enemy){
                           1372 ;	---------------------------------
                           1373 ; Function moverEnemigoIzquierda
                           1374 ; ---------------------------------
   6BB3                    1375 _moverEnemigoIzquierda::
                           1376 ;src/main.c:293: enemy->x--;
   6BB3 D1            [10] 1377 	pop	de
   6BB4 C1            [10] 1378 	pop	bc
   6BB5 C5            [11] 1379 	push	bc
   6BB6 D5            [11] 1380 	push	de
   6BB7 0A            [ 7] 1381 	ld	a,(bc)
   6BB8 C6 FF         [ 7] 1382 	add	a,#0xFF
   6BBA 02            [ 7] 1383 	ld	(bc),a
                           1384 ;src/main.c:294: enemy->x--;
   6BBB C6 FF         [ 7] 1385 	add	a,#0xFF
   6BBD 02            [ 7] 1386 	ld	(bc),a
                           1387 ;src/main.c:295: enemy->mover = SI;
   6BBE 21 06 00      [10] 1388 	ld	hl,#0x0006
   6BC1 09            [11] 1389 	add	hl,bc
   6BC2 36 01         [10] 1390 	ld	(hl),#0x01
   6BC4 C9            [10] 1391 	ret
                           1392 ;src/main.c:298: void moverEnemigoPatrol(TEnemy* enemy){
                           1393 ;	---------------------------------
                           1394 ; Function moverEnemigoPatrol
                           1395 ; ---------------------------------
   6BC5                    1396 _moverEnemigoPatrol::
   6BC5 DD E5         [15] 1397 	push	ix
   6BC7 DD 21 00 00   [14] 1398 	ld	ix,#0
   6BCB DD 39         [15] 1399 	add	ix,sp
   6BCD 21 F3 FF      [10] 1400 	ld	hl,#-13
   6BD0 39            [11] 1401 	add	hl,sp
   6BD1 F9            [ 6] 1402 	ld	sp,hl
                           1403 ;src/main.c:300: if(!enemy->muerto){
   6BD2 DD 4E 04      [19] 1404 	ld	c,4 (ix)
   6BD5 DD 46 05      [19] 1405 	ld	b,5 (ix)
   6BD8 C5            [11] 1406 	push	bc
   6BD9 FD E1         [14] 1407 	pop	iy
   6BDB FD 7E 08      [19] 1408 	ld	a,8 (iy)
   6BDE B7            [ 4] 1409 	or	a, a
   6BDF C2 F8 6D      [10] 1410 	jp	NZ,00118$
                           1411 ;src/main.c:301: if (!enemy->reversePatrol) {
   6BE2 21 0C 00      [10] 1412 	ld	hl,#0x000C
   6BE5 09            [11] 1413 	add	hl,bc
   6BE6 DD 75 FC      [19] 1414 	ld	-4 (ix),l
   6BE9 DD 74 FD      [19] 1415 	ld	-3 (ix),h
   6BEC DD 6E FC      [19] 1416 	ld	l,-4 (ix)
   6BEF DD 66 FD      [19] 1417 	ld	h,-3 (ix)
   6BF2 7E            [ 7] 1418 	ld	a,(hl)
   6BF3 DD 77 FB      [19] 1419 	ld	-5 (ix),a
                           1420 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6BF6 21 0E 00      [10] 1421 	ld	hl,#0x000E
   6BF9 09            [11] 1422 	add	hl,bc
   6BFA DD 75 F9      [19] 1423 	ld	-7 (ix),l
   6BFD DD 74 FA      [19] 1424 	ld	-6 (ix),h
   6C00 DD 6E F9      [19] 1425 	ld	l,-7 (ix)
   6C03 DD 66 FA      [19] 1426 	ld	h,-6 (ix)
   6C06 5E            [ 7] 1427 	ld	e,(hl)
   6C07 23            [ 6] 1428 	inc	hl
   6C08 56            [ 7] 1429 	ld	d,(hl)
   6C09 21 E1 00      [10] 1430 	ld	hl,#0x00E1
   6C0C 09            [11] 1431 	add	hl,bc
   6C0D DD 75 F7      [19] 1432 	ld	-9 (ix),l
   6C10 DD 74 F8      [19] 1433 	ld	-8 (ix),h
                           1434 ;src/main.c:304: enemy->mover = SI;
   6C13 21 06 00      [10] 1435 	ld	hl,#0x0006
   6C16 09            [11] 1436 	add	hl,bc
   6C17 DD 75 F5      [19] 1437 	ld	-11 (ix),l
   6C1A DD 74 F6      [19] 1438 	ld	-10 (ix),h
                           1439 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6C1D 21 19 00      [10] 1440 	ld	hl,#0x0019
   6C20 09            [11] 1441 	add	hl,bc
   6C21 E3            [19] 1442 	ex	(sp), hl
                           1443 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6C22 21 01 00      [10] 1444 	ld	hl,#0x0001
   6C25 09            [11] 1445 	add	hl,bc
   6C26 DD 75 FE      [19] 1446 	ld	-2 (ix),l
   6C29 DD 74 FF      [19] 1447 	ld	-1 (ix),h
                           1448 ;src/main.c:301: if (!enemy->reversePatrol) {
   6C2C DD 7E FB      [19] 1449 	ld	a,-5 (ix)
   6C2F B7            [ 4] 1450 	or	a, a
   6C30 C2 FF 6C      [10] 1451 	jp	NZ,00114$
                           1452 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6C33 DD 6E F7      [19] 1453 	ld	l,-9 (ix)
   6C36 DD 66 F8      [19] 1454 	ld	h,-8 (ix)
   6C39 6E            [ 7] 1455 	ld	l,(hl)
   6C3A 26 00         [ 7] 1456 	ld	h,#0x00
   6C3C 7B            [ 4] 1457 	ld	a,e
   6C3D 95            [ 4] 1458 	sub	a, l
   6C3E 7A            [ 4] 1459 	ld	a,d
   6C3F 9C            [ 4] 1460 	sbc	a, h
   6C40 E2 45 6C      [10] 1461 	jp	PO, 00144$
   6C43 EE 80         [ 7] 1462 	xor	a, #0x80
   6C45                    1463 00144$:
   6C45 F2 DA 6C      [10] 1464 	jp	P,00105$
                           1465 ;src/main.c:303: if(enemy->iter == 0){
   6C48 7A            [ 4] 1466 	ld	a,d
   6C49 B3            [ 4] 1467 	or	a,e
   6C4A 20 4C         [12] 1468 	jr	NZ,00102$
                           1469 ;src/main.c:304: enemy->mover = SI;
   6C4C DD 6E F5      [19] 1470 	ld	l,-11 (ix)
   6C4F DD 66 F6      [19] 1471 	ld	h,-10 (ix)
   6C52 36 01         [10] 1472 	ld	(hl),#0x01
                           1473 ;src/main.c:305: enemy->iter = 2;
   6C54 DD 6E F9      [19] 1474 	ld	l,-7 (ix)
   6C57 DD 66 FA      [19] 1475 	ld	h,-6 (ix)
   6C5A 36 02         [10] 1476 	ld	(hl),#0x02
   6C5C 23            [ 6] 1477 	inc	hl
   6C5D 36 00         [10] 1478 	ld	(hl),#0x00
                           1479 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6C5F DD 6E F9      [19] 1480 	ld	l,-7 (ix)
   6C62 DD 66 FA      [19] 1481 	ld	h,-6 (ix)
   6C65 5E            [ 7] 1482 	ld	e,(hl)
   6C66 23            [ 6] 1483 	inc	hl
   6C67 56            [ 7] 1484 	ld	d,(hl)
   6C68 E1            [10] 1485 	pop	hl
   6C69 E5            [11] 1486 	push	hl
   6C6A 19            [11] 1487 	add	hl,de
   6C6B 7E            [ 7] 1488 	ld	a,(hl)
   6C6C 02            [ 7] 1489 	ld	(bc),a
                           1490 ;src/main.c:307: ++enemy->iter;
   6C6D DD 6E F9      [19] 1491 	ld	l,-7 (ix)
   6C70 DD 66 FA      [19] 1492 	ld	h,-6 (ix)
   6C73 4E            [ 7] 1493 	ld	c,(hl)
   6C74 23            [ 6] 1494 	inc	hl
   6C75 46            [ 7] 1495 	ld	b,(hl)
   6C76 03            [ 6] 1496 	inc	bc
   6C77 DD 6E F9      [19] 1497 	ld	l,-7 (ix)
   6C7A DD 66 FA      [19] 1498 	ld	h,-6 (ix)
   6C7D 71            [ 7] 1499 	ld	(hl),c
   6C7E 23            [ 6] 1500 	inc	hl
   6C7F 70            [ 7] 1501 	ld	(hl),b
                           1502 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6C80 E1            [10] 1503 	pop	hl
   6C81 E5            [11] 1504 	push	hl
   6C82 09            [11] 1505 	add	hl,bc
   6C83 5E            [ 7] 1506 	ld	e,(hl)
   6C84 DD 6E FE      [19] 1507 	ld	l,-2 (ix)
   6C87 DD 66 FF      [19] 1508 	ld	h,-1 (ix)
   6C8A 73            [ 7] 1509 	ld	(hl),e
                           1510 ;src/main.c:309: ++enemy->iter;
   6C8B 03            [ 6] 1511 	inc	bc
   6C8C DD 6E F9      [19] 1512 	ld	l,-7 (ix)
   6C8F DD 66 FA      [19] 1513 	ld	h,-6 (ix)
   6C92 71            [ 7] 1514 	ld	(hl),c
   6C93 23            [ 6] 1515 	inc	hl
   6C94 70            [ 7] 1516 	ld	(hl),b
   6C95 C3 F8 6D      [10] 1517 	jp	00118$
   6C98                    1518 00102$:
                           1519 ;src/main.c:311: enemy->mover = SI;
   6C98 DD 6E F5      [19] 1520 	ld	l,-11 (ix)
   6C9B DD 66 F6      [19] 1521 	ld	h,-10 (ix)
   6C9E 36 01         [10] 1522 	ld	(hl),#0x01
                           1523 ;src/main.c:312: enemy->x = enemy->camino[enemy->iter];
   6CA0 DD 6E F9      [19] 1524 	ld	l,-7 (ix)
   6CA3 DD 66 FA      [19] 1525 	ld	h,-6 (ix)
   6CA6 5E            [ 7] 1526 	ld	e,(hl)
   6CA7 23            [ 6] 1527 	inc	hl
   6CA8 56            [ 7] 1528 	ld	d,(hl)
   6CA9 E1            [10] 1529 	pop	hl
   6CAA E5            [11] 1530 	push	hl
   6CAB 19            [11] 1531 	add	hl,de
   6CAC 7E            [ 7] 1532 	ld	a,(hl)
   6CAD 02            [ 7] 1533 	ld	(bc),a
                           1534 ;src/main.c:313: ++enemy->iter;
   6CAE DD 6E F9      [19] 1535 	ld	l,-7 (ix)
   6CB1 DD 66 FA      [19] 1536 	ld	h,-6 (ix)
   6CB4 5E            [ 7] 1537 	ld	e,(hl)
   6CB5 23            [ 6] 1538 	inc	hl
   6CB6 56            [ 7] 1539 	ld	d,(hl)
   6CB7 13            [ 6] 1540 	inc	de
   6CB8 DD 6E F9      [19] 1541 	ld	l,-7 (ix)
   6CBB DD 66 FA      [19] 1542 	ld	h,-6 (ix)
   6CBE 73            [ 7] 1543 	ld	(hl),e
   6CBF 23            [ 6] 1544 	inc	hl
   6CC0 72            [ 7] 1545 	ld	(hl),d
                           1546 ;src/main.c:314: enemy->y = enemy->camino[enemy->iter];
   6CC1 E1            [10] 1547 	pop	hl
   6CC2 E5            [11] 1548 	push	hl
   6CC3 19            [11] 1549 	add	hl,de
   6CC4 7E            [ 7] 1550 	ld	a,(hl)
   6CC5 DD 6E FE      [19] 1551 	ld	l,-2 (ix)
   6CC8 DD 66 FF      [19] 1552 	ld	h,-1 (ix)
   6CCB 77            [ 7] 1553 	ld	(hl),a
                           1554 ;src/main.c:315: ++enemy->iter;
   6CCC 13            [ 6] 1555 	inc	de
   6CCD 4B            [ 4] 1556 	ld	c,e
   6CCE DD 6E F9      [19] 1557 	ld	l,-7 (ix)
   6CD1 DD 66 FA      [19] 1558 	ld	h,-6 (ix)
   6CD4 71            [ 7] 1559 	ld	(hl),c
   6CD5 23            [ 6] 1560 	inc	hl
   6CD6 72            [ 7] 1561 	ld	(hl),d
   6CD7 C3 F8 6D      [10] 1562 	jp	00118$
   6CDA                    1563 00105$:
                           1564 ;src/main.c:319: enemy->mover = NO;
   6CDA DD 6E F5      [19] 1565 	ld	l,-11 (ix)
   6CDD DD 66 F6      [19] 1566 	ld	h,-10 (ix)
   6CE0 36 00         [10] 1567 	ld	(hl),#0x00
                           1568 ;src/main.c:320: enemy->iter = enemy->longitud_camino;
   6CE2 DD 6E F7      [19] 1569 	ld	l,-9 (ix)
   6CE5 DD 66 F8      [19] 1570 	ld	h,-8 (ix)
   6CE8 4E            [ 7] 1571 	ld	c,(hl)
   6CE9 06 00         [ 7] 1572 	ld	b,#0x00
   6CEB DD 6E F9      [19] 1573 	ld	l,-7 (ix)
   6CEE DD 66 FA      [19] 1574 	ld	h,-6 (ix)
   6CF1 71            [ 7] 1575 	ld	(hl),c
   6CF2 23            [ 6] 1576 	inc	hl
   6CF3 70            [ 7] 1577 	ld	(hl),b
                           1578 ;src/main.c:321: enemy->reversePatrol = 1;
   6CF4 DD 6E FC      [19] 1579 	ld	l,-4 (ix)
   6CF7 DD 66 FD      [19] 1580 	ld	h,-3 (ix)
   6CFA 36 01         [10] 1581 	ld	(hl),#0x01
   6CFC C3 F8 6D      [10] 1582 	jp	00118$
   6CFF                    1583 00114$:
                           1584 ;src/main.c:324: if(enemy->iter > 0){
   6CFF AF            [ 4] 1585 	xor	a, a
   6D00 BB            [ 4] 1586 	cp	a, e
   6D01 9A            [ 4] 1587 	sbc	a, d
   6D02 E2 07 6D      [10] 1588 	jp	PO, 00145$
   6D05 EE 80         [ 7] 1589 	xor	a, #0x80
   6D07                    1590 00145$:
   6D07 F2 DE 6D      [10] 1591 	jp	P,00111$
                           1592 ;src/main.c:325: if(enemy->iter == enemy->longitud_camino){
   6D0A DD 6E F7      [19] 1593 	ld	l,-9 (ix)
   6D0D DD 66 F8      [19] 1594 	ld	h,-8 (ix)
   6D10 6E            [ 7] 1595 	ld	l,(hl)
   6D11 DD 75 F7      [19] 1596 	ld	-9 (ix),l
   6D14 DD 36 F8 00   [19] 1597 	ld	-8 (ix),#0x00
   6D18 7B            [ 4] 1598 	ld	a,e
   6D19 DD 96 F7      [19] 1599 	sub	a, -9 (ix)
   6D1C C2 9E 6D      [10] 1600 	jp	NZ,00108$
   6D1F 7A            [ 4] 1601 	ld	a,d
   6D20 DD 96 F8      [19] 1602 	sub	a, -8 (ix)
   6D23 20 79         [12] 1603 	jr	NZ,00108$
                           1604 ;src/main.c:326: enemy->mover = SI;
   6D25 DD 6E F5      [19] 1605 	ld	l,-11 (ix)
   6D28 DD 66 F6      [19] 1606 	ld	h,-10 (ix)
   6D2B 36 01         [10] 1607 	ld	(hl),#0x01
                           1608 ;src/main.c:327: enemy->iter = enemy->iter - 1;
   6D2D DD 6E F9      [19] 1609 	ld	l,-7 (ix)
   6D30 DD 66 FA      [19] 1610 	ld	h,-6 (ix)
   6D33 5E            [ 7] 1611 	ld	e,(hl)
   6D34 23            [ 6] 1612 	inc	hl
   6D35 56            [ 7] 1613 	ld	d,(hl)
   6D36 7B            [ 4] 1614 	ld	a,e
   6D37 C6 FF         [ 7] 1615 	add	a,#0xFF
   6D39 DD 77 F7      [19] 1616 	ld	-9 (ix),a
   6D3C 7A            [ 4] 1617 	ld	a,d
   6D3D CE FF         [ 7] 1618 	adc	a,#0xFF
   6D3F DD 77 F8      [19] 1619 	ld	-8 (ix),a
   6D42 DD 6E F9      [19] 1620 	ld	l,-7 (ix)
   6D45 DD 66 FA      [19] 1621 	ld	h,-6 (ix)
   6D48 DD 7E F7      [19] 1622 	ld	a,-9 (ix)
   6D4B 77            [ 7] 1623 	ld	(hl),a
   6D4C 23            [ 6] 1624 	inc	hl
   6D4D DD 7E F8      [19] 1625 	ld	a,-8 (ix)
   6D50 77            [ 7] 1626 	ld	(hl),a
                           1627 ;src/main.c:328: enemy->iter = enemy->iter - 2;
   6D51 DD 5E F7      [19] 1628 	ld	e,-9 (ix)
   6D54 DD 56 F8      [19] 1629 	ld	d,-8 (ix)
   6D57 1B            [ 6] 1630 	dec	de
   6D58 1B            [ 6] 1631 	dec	de
   6D59 DD 6E F9      [19] 1632 	ld	l,-7 (ix)
   6D5C DD 66 FA      [19] 1633 	ld	h,-6 (ix)
   6D5F 73            [ 7] 1634 	ld	(hl),e
   6D60 23            [ 6] 1635 	inc	hl
   6D61 72            [ 7] 1636 	ld	(hl),d
                           1637 ;src/main.c:329: enemy->y = enemy->camino[enemy->iter];
   6D62 E1            [10] 1638 	pop	hl
   6D63 E5            [11] 1639 	push	hl
   6D64 19            [11] 1640 	add	hl,de
   6D65 5E            [ 7] 1641 	ld	e,(hl)
   6D66 DD 6E FE      [19] 1642 	ld	l,-2 (ix)
   6D69 DD 66 FF      [19] 1643 	ld	h,-1 (ix)
   6D6C 73            [ 7] 1644 	ld	(hl),e
                           1645 ;src/main.c:330: --enemy->iter;
   6D6D DD 7E F7      [19] 1646 	ld	a,-9 (ix)
   6D70 C6 FD         [ 7] 1647 	add	a,#0xFD
   6D72 5F            [ 4] 1648 	ld	e,a
   6D73 DD 7E F8      [19] 1649 	ld	a,-8 (ix)
   6D76 CE FF         [ 7] 1650 	adc	a,#0xFF
   6D78 57            [ 4] 1651 	ld	d,a
   6D79 DD 6E F9      [19] 1652 	ld	l,-7 (ix)
   6D7C DD 66 FA      [19] 1653 	ld	h,-6 (ix)
   6D7F 73            [ 7] 1654 	ld	(hl),e
   6D80 23            [ 6] 1655 	inc	hl
   6D81 72            [ 7] 1656 	ld	(hl),d
                           1657 ;src/main.c:331: enemy->x = enemy->camino[enemy->iter];
   6D82 E1            [10] 1658 	pop	hl
   6D83 E5            [11] 1659 	push	hl
   6D84 19            [11] 1660 	add	hl,de
   6D85 7E            [ 7] 1661 	ld	a,(hl)
   6D86 02            [ 7] 1662 	ld	(bc),a
                           1663 ;src/main.c:332: --enemy->iter;
   6D87 DD 7E F7      [19] 1664 	ld	a,-9 (ix)
   6D8A C6 FC         [ 7] 1665 	add	a,#0xFC
   6D8C 4F            [ 4] 1666 	ld	c,a
   6D8D DD 7E F8      [19] 1667 	ld	a,-8 (ix)
   6D90 CE FF         [ 7] 1668 	adc	a,#0xFF
   6D92 47            [ 4] 1669 	ld	b,a
   6D93 DD 6E F9      [19] 1670 	ld	l,-7 (ix)
   6D96 DD 66 FA      [19] 1671 	ld	h,-6 (ix)
   6D99 71            [ 7] 1672 	ld	(hl),c
   6D9A 23            [ 6] 1673 	inc	hl
   6D9B 70            [ 7] 1674 	ld	(hl),b
   6D9C 18 5A         [12] 1675 	jr	00118$
   6D9E                    1676 00108$:
                           1677 ;src/main.c:334: enemy->mover = SI;
   6D9E DD 6E F5      [19] 1678 	ld	l,-11 (ix)
   6DA1 DD 66 F6      [19] 1679 	ld	h,-10 (ix)
   6DA4 36 01         [10] 1680 	ld	(hl),#0x01
                           1681 ;src/main.c:335: enemy->y = enemy->camino[enemy->iter];
   6DA6 DD 6E F9      [19] 1682 	ld	l,-7 (ix)
   6DA9 DD 66 FA      [19] 1683 	ld	h,-6 (ix)
   6DAC 5E            [ 7] 1684 	ld	e,(hl)
   6DAD 23            [ 6] 1685 	inc	hl
   6DAE 56            [ 7] 1686 	ld	d,(hl)
   6DAF E1            [10] 1687 	pop	hl
   6DB0 E5            [11] 1688 	push	hl
   6DB1 19            [11] 1689 	add	hl,de
   6DB2 5E            [ 7] 1690 	ld	e,(hl)
   6DB3 DD 6E FE      [19] 1691 	ld	l,-2 (ix)
   6DB6 DD 66 FF      [19] 1692 	ld	h,-1 (ix)
   6DB9 73            [ 7] 1693 	ld	(hl),e
                           1694 ;src/main.c:336: --enemy->iter;
   6DBA DD 6E F9      [19] 1695 	ld	l,-7 (ix)
   6DBD DD 66 FA      [19] 1696 	ld	h,-6 (ix)
   6DC0 5E            [ 7] 1697 	ld	e,(hl)
   6DC1 23            [ 6] 1698 	inc	hl
   6DC2 56            [ 7] 1699 	ld	d,(hl)
   6DC3 1B            [ 6] 1700 	dec	de
   6DC4 DD 6E F9      [19] 1701 	ld	l,-7 (ix)
   6DC7 DD 66 FA      [19] 1702 	ld	h,-6 (ix)
   6DCA 73            [ 7] 1703 	ld	(hl),e
   6DCB 23            [ 6] 1704 	inc	hl
   6DCC 72            [ 7] 1705 	ld	(hl),d
                           1706 ;src/main.c:337: enemy->x = enemy->camino[enemy->iter];
   6DCD E1            [10] 1707 	pop	hl
   6DCE E5            [11] 1708 	push	hl
   6DCF 19            [11] 1709 	add	hl,de
   6DD0 7E            [ 7] 1710 	ld	a,(hl)
   6DD1 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:338: --enemy->iter;
   6DD2 1B            [ 6] 1713 	dec	de
   6DD3 DD 6E F9      [19] 1714 	ld	l,-7 (ix)
   6DD6 DD 66 FA      [19] 1715 	ld	h,-6 (ix)
   6DD9 73            [ 7] 1716 	ld	(hl),e
   6DDA 23            [ 6] 1717 	inc	hl
   6DDB 72            [ 7] 1718 	ld	(hl),d
   6DDC 18 1A         [12] 1719 	jr	00118$
   6DDE                    1720 00111$:
                           1721 ;src/main.c:342: enemy->mover = NO;
   6DDE DD 6E F5      [19] 1722 	ld	l,-11 (ix)
   6DE1 DD 66 F6      [19] 1723 	ld	h,-10 (ix)
   6DE4 36 00         [10] 1724 	ld	(hl),#0x00
                           1725 ;src/main.c:343: enemy->iter = 0;
   6DE6 DD 6E F9      [19] 1726 	ld	l,-7 (ix)
   6DE9 DD 66 FA      [19] 1727 	ld	h,-6 (ix)
   6DEC AF            [ 4] 1728 	xor	a, a
   6DED 77            [ 7] 1729 	ld	(hl), a
   6DEE 23            [ 6] 1730 	inc	hl
   6DEF 77            [ 7] 1731 	ld	(hl), a
                           1732 ;src/main.c:344: enemy->reversePatrol = 0;
   6DF0 DD 6E FC      [19] 1733 	ld	l,-4 (ix)
   6DF3 DD 66 FD      [19] 1734 	ld	h,-3 (ix)
   6DF6 36 00         [10] 1735 	ld	(hl),#0x00
   6DF8                    1736 00118$:
   6DF8 DD F9         [10] 1737 	ld	sp, ix
   6DFA DD E1         [14] 1738 	pop	ix
   6DFC C9            [10] 1739 	ret
                           1740 ;src/main.c:350: void lookFor(TEnemy* enemy){
                           1741 ;	---------------------------------
                           1742 ; Function lookFor
                           1743 ; ---------------------------------
   6DFD                    1744 _lookFor::
   6DFD DD E5         [15] 1745 	push	ix
   6DFF DD 21 00 00   [14] 1746 	ld	ix,#0
   6E03 DD 39         [15] 1747 	add	ix,sp
   6E05 21 F9 FF      [10] 1748 	ld	hl,#-7
   6E08 39            [11] 1749 	add	hl,sp
   6E09 F9            [ 6] 1750 	ld	sp,hl
                           1751 ;src/main.c:356: i16 difx = abs((i16)(enemy->x - prota.x));
   6E0A DD 5E 04      [19] 1752 	ld	e,4 (ix)
   6E0D DD 56 05      [19] 1753 	ld	d,5 (ix)
   6E10 1A            [ 7] 1754 	ld	a,(de)
   6E11 4F            [ 4] 1755 	ld	c,a
   6E12 06 00         [ 7] 1756 	ld	b,#0x00
   6E14 21 31 64      [10] 1757 	ld	hl,#_prota+0
   6E17 6E            [ 7] 1758 	ld	l,(hl)
   6E18 26 00         [ 7] 1759 	ld	h,#0x00
   6E1A 79            [ 4] 1760 	ld	a,c
   6E1B 95            [ 4] 1761 	sub	a, l
   6E1C 4F            [ 4] 1762 	ld	c,a
   6E1D 78            [ 4] 1763 	ld	a,b
   6E1E 9C            [ 4] 1764 	sbc	a, h
   6E1F 47            [ 4] 1765 	ld	b,a
   6E20 D5            [11] 1766 	push	de
   6E21 C5            [11] 1767 	push	bc
   6E22 CD A5 4B      [17] 1768 	call	_abs
   6E25 F1            [10] 1769 	pop	af
   6E26 D1            [10] 1770 	pop	de
   6E27 33            [ 6] 1771 	inc	sp
   6E28 33            [ 6] 1772 	inc	sp
   6E29 E5            [11] 1773 	push	hl
                           1774 ;src/main.c:357: i16 dify = abs((i16)(enemy->y - prota.y));
   6E2A 21 01 00      [10] 1775 	ld	hl,#0x0001
   6E2D 19            [11] 1776 	add	hl,de
   6E2E DD 75 FE      [19] 1777 	ld	-2 (ix),l
   6E31 DD 74 FF      [19] 1778 	ld	-1 (ix),h
   6E34 DD 6E FE      [19] 1779 	ld	l,-2 (ix)
   6E37 DD 66 FF      [19] 1780 	ld	h,-1 (ix)
   6E3A 4E            [ 7] 1781 	ld	c,(hl)
   6E3B 06 00         [ 7] 1782 	ld	b,#0x00
   6E3D 21 32 64      [10] 1783 	ld	hl, #(_prota + 0x0001) + 0
   6E40 6E            [ 7] 1784 	ld	l,(hl)
   6E41 26 00         [ 7] 1785 	ld	h,#0x00
   6E43 79            [ 4] 1786 	ld	a,c
   6E44 95            [ 4] 1787 	sub	a, l
   6E45 4F            [ 4] 1788 	ld	c,a
   6E46 78            [ 4] 1789 	ld	a,b
   6E47 9C            [ 4] 1790 	sbc	a, h
   6E48 47            [ 4] 1791 	ld	b,a
   6E49 D5            [11] 1792 	push	de
   6E4A C5            [11] 1793 	push	bc
   6E4B CD A5 4B      [17] 1794 	call	_abs
   6E4E F1            [10] 1795 	pop	af
   6E4F D1            [10] 1796 	pop	de
                           1797 ;src/main.c:359: dist = difx + dify; // manhattan
   6E50 DD 4E F9      [19] 1798 	ld	c,-7 (ix)
   6E53 09            [11] 1799 	add	hl, bc
   6E54 DD 75 FB      [19] 1800 	ld	-5 (ix),l
                           1801 ;src/main.c:360: enemy->seen = NO;
   6E57 21 12 00      [10] 1802 	ld	hl,#0x0012
   6E5A 19            [11] 1803 	add	hl,de
   6E5B DD 75 FC      [19] 1804 	ld	-4 (ix),l
   6E5E DD 74 FD      [19] 1805 	ld	-3 (ix),h
   6E61 DD 6E FC      [19] 1806 	ld	l,-4 (ix)
   6E64 DD 66 FD      [19] 1807 	ld	h,-3 (ix)
   6E67 36 00         [10] 1808 	ld	(hl),#0x00
                           1809 ;src/main.c:361: enemy->in_range = NO;
   6E69 21 11 00      [10] 1810 	ld	hl,#0x0011
   6E6C 19            [11] 1811 	add	hl,de
   6E6D 4D            [ 4] 1812 	ld	c,l
   6E6E 44            [ 4] 1813 	ld	b,h
   6E6F AF            [ 4] 1814 	xor	a, a
   6E70 02            [ 7] 1815 	ld	(bc),a
                           1816 ;src/main.c:363: if(!enemy->seek){
   6E71 D5            [11] 1817 	push	de
   6E72 FD E1         [14] 1818 	pop	iy
   6E74 FD 7E 14      [19] 1819 	ld	a,20 (iy)
   6E77 B7            [ 4] 1820 	or	a, a
   6E78 C2 FE 6E      [10] 1821 	jp	NZ,00111$
                           1822 ;src/main.c:364: if (dist <= 10) {// te detectan los sensores de proximidad
   6E7B 3E 0A         [ 7] 1823 	ld	a,#0x0A
   6E7D DD 96 FB      [19] 1824 	sub	a, -5 (ix)
   6E80 38 13         [12] 1825 	jr	C,00107$
                           1826 ;src/main.c:365: enemy->in_range = 1;
   6E82 3E 01         [ 7] 1827 	ld	a,#0x01
   6E84 02            [ 7] 1828 	ld	(bc),a
                           1829 ;src/main.c:366: enemy->engage = 1;
   6E85 21 16 00      [10] 1830 	ld	hl,#0x0016
   6E88 19            [11] 1831 	add	hl,de
   6E89 36 01         [10] 1832 	ld	(hl),#0x01
                           1833 ;src/main.c:367: enemy->seen = SI;
   6E8B DD 6E FC      [19] 1834 	ld	l,-4 (ix)
   6E8E DD 66 FD      [19] 1835 	ld	h,-3 (ix)
   6E91 36 01         [10] 1836 	ld	(hl),#0x01
   6E93 18 69         [12] 1837 	jr	00111$
   6E95                    1838 00107$:
                           1839 ;src/main.c:368: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6E95 21 31 64      [10] 1840 	ld	hl, #_prota + 0
   6E98 4E            [ 7] 1841 	ld	c,(hl)
   6E99 1A            [ 7] 1842 	ld	a,(de)
   6E9A 5F            [ 4] 1843 	ld	e,a
   6E9B 16 00         [ 7] 1844 	ld	d,#0x00
   6E9D 7B            [ 4] 1845 	ld	a,e
   6E9E C6 E7         [ 7] 1846 	add	a,#0xE7
   6EA0 6F            [ 4] 1847 	ld	l,a
   6EA1 7A            [ 4] 1848 	ld	a,d
   6EA2 CE FF         [ 7] 1849 	adc	a,#0xFF
   6EA4 67            [ 4] 1850 	ld	h,a
   6EA5 06 00         [ 7] 1851 	ld	b,#0x00
   6EA7 7D            [ 4] 1852 	ld	a,l
   6EA8 91            [ 4] 1853 	sub	a, c
   6EA9 7C            [ 4] 1854 	ld	a,h
   6EAA 98            [ 4] 1855 	sbc	a, b
   6EAB E2 B0 6E      [10] 1856 	jp	PO, 00137$
   6EAE EE 80         [ 7] 1857 	xor	a, #0x80
   6EB0                    1858 00137$:
   6EB0 F2 FE 6E      [10] 1859 	jp	P,00111$
   6EB3 21 19 00      [10] 1860 	ld	hl,#0x0019
   6EB6 19            [11] 1861 	add	hl,de
   6EB7 79            [ 4] 1862 	ld	a,c
   6EB8 95            [ 4] 1863 	sub	a, l
   6EB9 78            [ 4] 1864 	ld	a,b
   6EBA 9C            [ 4] 1865 	sbc	a, h
   6EBB E2 C0 6E      [10] 1866 	jp	PO, 00138$
   6EBE EE 80         [ 7] 1867 	xor	a, #0x80
   6EC0                    1868 00138$:
   6EC0 F2 FE 6E      [10] 1869 	jp	P,00111$
                           1870 ;src/main.c:369: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6EC3 21 32 64      [10] 1871 	ld	hl, #(_prota + 0x0001) + 0
   6EC6 4E            [ 7] 1872 	ld	c,(hl)
   6EC7 DD 6E FE      [19] 1873 	ld	l,-2 (ix)
   6ECA DD 66 FF      [19] 1874 	ld	h,-1 (ix)
   6ECD 5E            [ 7] 1875 	ld	e,(hl)
   6ECE 16 00         [ 7] 1876 	ld	d,#0x00
   6ED0 7B            [ 4] 1877 	ld	a,e
   6ED1 C6 CC         [ 7] 1878 	add	a,#0xCC
   6ED3 6F            [ 4] 1879 	ld	l,a
   6ED4 7A            [ 4] 1880 	ld	a,d
   6ED5 CE FF         [ 7] 1881 	adc	a,#0xFF
   6ED7 67            [ 4] 1882 	ld	h,a
   6ED8 06 00         [ 7] 1883 	ld	b,#0x00
   6EDA 7D            [ 4] 1884 	ld	a,l
   6EDB 91            [ 4] 1885 	sub	a, c
   6EDC 7C            [ 4] 1886 	ld	a,h
   6EDD 98            [ 4] 1887 	sbc	a, b
   6EDE E2 E3 6E      [10] 1888 	jp	PO, 00139$
   6EE1 EE 80         [ 7] 1889 	xor	a, #0x80
   6EE3                    1890 00139$:
   6EE3 F2 FE 6E      [10] 1891 	jp	P,00111$
   6EE6 21 34 00      [10] 1892 	ld	hl,#0x0034
   6EE9 19            [11] 1893 	add	hl,de
   6EEA 79            [ 4] 1894 	ld	a,c
   6EEB 95            [ 4] 1895 	sub	a, l
   6EEC 78            [ 4] 1896 	ld	a,b
   6EED 9C            [ 4] 1897 	sbc	a, h
   6EEE E2 F3 6E      [10] 1898 	jp	PO, 00140$
   6EF1 EE 80         [ 7] 1899 	xor	a, #0x80
   6EF3                    1900 00140$:
   6EF3 F2 FE 6E      [10] 1901 	jp	P,00111$
                           1902 ;src/main.c:370: enemy->seen = SI;
   6EF6 DD 6E FC      [19] 1903 	ld	l,-4 (ix)
   6EF9 DD 66 FD      [19] 1904 	ld	h,-3 (ix)
   6EFC 36 01         [10] 1905 	ld	(hl),#0x01
   6EFE                    1906 00111$:
   6EFE DD F9         [10] 1907 	ld	sp, ix
   6F00 DD E1         [14] 1908 	pop	ix
   6F02 C9            [10] 1909 	ret
                           1910 ;src/main.c:375: void moverEnemigoSeek(TEnemy* actual){
                           1911 ;	---------------------------------
                           1912 ; Function moverEnemigoSeek
                           1913 ; ---------------------------------
   6F03                    1914 _moverEnemigoSeek::
   6F03 DD E5         [15] 1915 	push	ix
   6F05 DD 21 00 00   [14] 1916 	ld	ix,#0
   6F09 DD 39         [15] 1917 	add	ix,sp
   6F0B 21 F6 FF      [10] 1918 	ld	hl,#-10
   6F0E 39            [11] 1919 	add	hl,sp
   6F0F F9            [ 6] 1920 	ld	sp,hl
                           1921 ;src/main.c:377: if(!actual->muerto){
   6F10 DD 4E 04      [19] 1922 	ld	c,4 (ix)
   6F13 DD 46 05      [19] 1923 	ld	b,5 (ix)
   6F16 C5            [11] 1924 	push	bc
   6F17 FD E1         [14] 1925 	pop	iy
   6F19 FD 7E 08      [19] 1926 	ld	a, 8 (iy)
   6F1C B7            [ 4] 1927 	or	a, a
   6F1D C2 9B 70      [10] 1928 	jp	NZ,00114$
                           1929 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6F20 21 0E 00      [10] 1930 	ld	hl,#0x000E
   6F23 09            [11] 1931 	add	hl,bc
   6F24 DD 75 FA      [19] 1932 	ld	-6 (ix),l
   6F27 DD 74 FB      [19] 1933 	ld	-5 (ix),h
   6F2A DD 6E FA      [19] 1934 	ld	l,-6 (ix)
   6F2D DD 66 FB      [19] 1935 	ld	h,-5 (ix)
   6F30 7E            [ 7] 1936 	ld	a,(hl)
   6F31 DD 77 F8      [19] 1937 	ld	-8 (ix),a
   6F34 23            [ 6] 1938 	inc	hl
   6F35 7E            [ 7] 1939 	ld	a,(hl)
   6F36 DD 77 F9      [19] 1940 	ld	-7 (ix),a
   6F39 69            [ 4] 1941 	ld	l, c
   6F3A 60            [ 4] 1942 	ld	h, b
   6F3B 11 E1 00      [10] 1943 	ld	de, #0x00E1
   6F3E 19            [11] 1944 	add	hl, de
   6F3F 5E            [ 7] 1945 	ld	e,(hl)
   6F40 16 00         [ 7] 1946 	ld	d,#0x00
                           1947 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F42 21 01 00      [10] 1948 	ld	hl,#0x0001
   6F45 09            [11] 1949 	add	hl,bc
   6F46 E3            [19] 1950 	ex	(sp), hl
                           1951 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6F47 DD 7E F8      [19] 1952 	ld	a,-8 (ix)
   6F4A 93            [ 4] 1953 	sub	a, e
   6F4B DD 7E F9      [19] 1954 	ld	a,-7 (ix)
   6F4E 9A            [ 4] 1955 	sbc	a, d
   6F4F E2 54 6F      [10] 1956 	jp	PO, 00136$
   6F52 EE 80         [ 7] 1957 	xor	a, #0x80
   6F54                    1958 00136$:
   6F54 F2 E0 6F      [10] 1959 	jp	P,00110$
                           1960 ;src/main.c:385: actual->mover = SI;
   6F57 21 06 00      [10] 1961 	ld	hl,#0x0006
   6F5A 09            [11] 1962 	add	hl,bc
                           1963 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F5B 79            [ 4] 1964 	ld	a,c
   6F5C C6 19         [ 7] 1965 	add	a, #0x19
   6F5E 5F            [ 4] 1966 	ld	e,a
   6F5F 78            [ 4] 1967 	ld	a,b
   6F60 CE 00         [ 7] 1968 	adc	a, #0x00
   6F62 57            [ 4] 1969 	ld	d,a
                           1970 ;src/main.c:383: if(actual->iter == 0){
   6F63 DD 7E F9      [19] 1971 	ld	a,-7 (ix)
   6F66 DD B6 F8      [19] 1972 	or	a,-8 (ix)
   6F69 20 40         [12] 1973 	jr	NZ,00102$
                           1974 ;src/main.c:385: actual->mover = SI;
   6F6B 36 01         [10] 1975 	ld	(hl),#0x01
                           1976 ;src/main.c:386: actual->iter = 2;
   6F6D DD 6E FA      [19] 1977 	ld	l,-6 (ix)
   6F70 DD 66 FB      [19] 1978 	ld	h,-5 (ix)
   6F73 36 02         [10] 1979 	ld	(hl),#0x02
   6F75 23            [ 6] 1980 	inc	hl
   6F76 36 00         [10] 1981 	ld	(hl),#0x00
                           1982 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F78 DD 6E FA      [19] 1983 	ld	l,-6 (ix)
   6F7B DD 66 FB      [19] 1984 	ld	h,-5 (ix)
   6F7E 7E            [ 7] 1985 	ld	a, (hl)
   6F7F 23            [ 6] 1986 	inc	hl
   6F80 66            [ 7] 1987 	ld	h,(hl)
   6F81 6F            [ 4] 1988 	ld	l,a
   6F82 19            [11] 1989 	add	hl,de
   6F83 7E            [ 7] 1990 	ld	a,(hl)
   6F84 02            [ 7] 1991 	ld	(bc),a
                           1992 ;src/main.c:388: ++actual->iter;
   6F85 DD 6E FA      [19] 1993 	ld	l,-6 (ix)
   6F88 DD 66 FB      [19] 1994 	ld	h,-5 (ix)
   6F8B 4E            [ 7] 1995 	ld	c,(hl)
   6F8C 23            [ 6] 1996 	inc	hl
   6F8D 46            [ 7] 1997 	ld	b,(hl)
   6F8E 03            [ 6] 1998 	inc	bc
   6F8F DD 6E FA      [19] 1999 	ld	l,-6 (ix)
   6F92 DD 66 FB      [19] 2000 	ld	h,-5 (ix)
   6F95 71            [ 7] 2001 	ld	(hl),c
   6F96 23            [ 6] 2002 	inc	hl
   6F97 70            [ 7] 2003 	ld	(hl),b
                           2004 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F98 EB            [ 4] 2005 	ex	de,hl
   6F99 09            [11] 2006 	add	hl,bc
   6F9A 5E            [ 7] 2007 	ld	e,(hl)
   6F9B E1            [10] 2008 	pop	hl
   6F9C E5            [11] 2009 	push	hl
   6F9D 73            [ 7] 2010 	ld	(hl),e
                           2011 ;src/main.c:390: ++actual->iter;
   6F9E 03            [ 6] 2012 	inc	bc
   6F9F DD 6E FA      [19] 2013 	ld	l,-6 (ix)
   6FA2 DD 66 FB      [19] 2014 	ld	h,-5 (ix)
   6FA5 71            [ 7] 2015 	ld	(hl),c
   6FA6 23            [ 6] 2016 	inc	hl
   6FA7 70            [ 7] 2017 	ld	(hl),b
   6FA8 C3 9B 70      [10] 2018 	jp	00114$
   6FAB                    2019 00102$:
                           2020 ;src/main.c:393: actual->mover = SI;
   6FAB 36 01         [10] 2021 	ld	(hl),#0x01
                           2022 ;src/main.c:394: actual->x = actual->camino[actual->iter];
   6FAD DD 6E FA      [19] 2023 	ld	l,-6 (ix)
   6FB0 DD 66 FB      [19] 2024 	ld	h,-5 (ix)
   6FB3 7E            [ 7] 2025 	ld	a, (hl)
   6FB4 23            [ 6] 2026 	inc	hl
   6FB5 66            [ 7] 2027 	ld	h,(hl)
   6FB6 6F            [ 4] 2028 	ld	l,a
   6FB7 19            [11] 2029 	add	hl,de
   6FB8 7E            [ 7] 2030 	ld	a,(hl)
   6FB9 02            [ 7] 2031 	ld	(bc),a
                           2032 ;src/main.c:395: ++actual->iter;
   6FBA DD 6E FA      [19] 2033 	ld	l,-6 (ix)
   6FBD DD 66 FB      [19] 2034 	ld	h,-5 (ix)
   6FC0 4E            [ 7] 2035 	ld	c,(hl)
   6FC1 23            [ 6] 2036 	inc	hl
   6FC2 46            [ 7] 2037 	ld	b,(hl)
   6FC3 03            [ 6] 2038 	inc	bc
   6FC4 DD 6E FA      [19] 2039 	ld	l,-6 (ix)
   6FC7 DD 66 FB      [19] 2040 	ld	h,-5 (ix)
   6FCA 71            [ 7] 2041 	ld	(hl),c
   6FCB 23            [ 6] 2042 	inc	hl
   6FCC 70            [ 7] 2043 	ld	(hl),b
                           2044 ;src/main.c:396: actual->y = actual->camino[actual->iter];
   6FCD EB            [ 4] 2045 	ex	de,hl
   6FCE 09            [11] 2046 	add	hl,bc
   6FCF 5E            [ 7] 2047 	ld	e,(hl)
   6FD0 E1            [10] 2048 	pop	hl
   6FD1 E5            [11] 2049 	push	hl
   6FD2 73            [ 7] 2050 	ld	(hl),e
                           2051 ;src/main.c:397: ++actual->iter;
   6FD3 03            [ 6] 2052 	inc	bc
   6FD4 DD 6E FA      [19] 2053 	ld	l,-6 (ix)
   6FD7 DD 66 FB      [19] 2054 	ld	h,-5 (ix)
   6FDA 71            [ 7] 2055 	ld	(hl),c
   6FDB 23            [ 6] 2056 	inc	hl
   6FDC 70            [ 7] 2057 	ld	(hl),b
   6FDD C3 9B 70      [10] 2058 	jp	00114$
   6FE0                    2059 00110$:
                           2060 ;src/main.c:403: actual->seek = 0;
   6FE0 21 14 00      [10] 2061 	ld	hl,#0x0014
   6FE3 09            [11] 2062 	add	hl,bc
   6FE4 DD 75 F8      [19] 2063 	ld	-8 (ix),l
   6FE7 DD 74 F9      [19] 2064 	ld	-7 (ix),h
   6FEA DD 6E F8      [19] 2065 	ld	l,-8 (ix)
   6FED DD 66 F9      [19] 2066 	ld	h,-7 (ix)
   6FF0 36 00         [10] 2067 	ld	(hl),#0x00
                           2068 ;src/main.c:404: lookFor(actual);
   6FF2 C5            [11] 2069 	push	bc
   6FF3 C5            [11] 2070 	push	bc
   6FF4 CD FD 6D      [17] 2071 	call	_lookFor
   6FF7 F1            [10] 2072 	pop	af
   6FF8 C1            [10] 2073 	pop	bc
                           2074 ;src/main.c:405: if(!actual->seen){
   6FF9 69            [ 4] 2075 	ld	l, c
   6FFA 60            [ 4] 2076 	ld	h, b
   6FFB 11 12 00      [10] 2077 	ld	de, #0x0012
   6FFE 19            [11] 2078 	add	hl, de
   6FFF 7E            [ 7] 2079 	ld	a,(hl)
   7000 DD 77 FF      [19] 2080 	ld	-1 (ix),a
                           2081 ;src/main.c:406: actual->patrolling = 1;
   7003 21 0B 00      [10] 2082 	ld	hl,#0x000B
   7006 09            [11] 2083 	add	hl,bc
   7007 DD 75 FD      [19] 2084 	ld	-3 (ix),l
   700A DD 74 FE      [19] 2085 	ld	-2 (ix),h
                           2086 ;src/main.c:405: if(!actual->seen){
   700D DD 7E FF      [19] 2087 	ld	a,-1 (ix)
   7010 B7            [ 4] 2088 	or	a, a
   7011 20 38         [12] 2089 	jr	NZ,00107$
                           2090 ;src/main.c:406: actual->patrolling = 1;
   7013 DD 6E FD      [19] 2091 	ld	l,-3 (ix)
   7016 DD 66 FE      [19] 2092 	ld	h,-2 (ix)
   7019 36 01         [10] 2093 	ld	(hl),#0x01
                           2094 ;src/main.c:407: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   701B C5            [11] 2095 	push	bc
   701C FD E1         [14] 2096 	pop	iy
   701E FD 7E 18      [19] 2097 	ld	a,24 (iy)
   7021 DD 77 FF      [19] 2098 	ld	-1 (ix),a
   7024 C5            [11] 2099 	push	bc
   7025 FD E1         [14] 2100 	pop	iy
   7027 FD 56 17      [19] 2101 	ld	d,23 (iy)
   702A E1            [10] 2102 	pop	hl
   702B E5            [11] 2103 	push	hl
   702C 5E            [ 7] 2104 	ld	e,(hl)
   702D 0A            [ 7] 2105 	ld	a,(bc)
   702E DD 77 FC      [19] 2106 	ld	-4 (ix),a
   7031 2A 0E 65      [16] 2107 	ld	hl,(_mapa)
   7034 E5            [11] 2108 	push	hl
   7035 C5            [11] 2109 	push	bc
   7036 DD 7E FF      [19] 2110 	ld	a,-1 (ix)
   7039 F5            [11] 2111 	push	af
   703A 33            [ 6] 2112 	inc	sp
   703B D5            [11] 2113 	push	de
   703C DD 7E FC      [19] 2114 	ld	a,-4 (ix)
   703F F5            [11] 2115 	push	af
   7040 33            [ 6] 2116 	inc	sp
   7041 CD 30 44      [17] 2117 	call	_pathFinding
   7044 21 08 00      [10] 2118 	ld	hl,#8
   7047 39            [11] 2119 	add	hl,sp
   7048 F9            [ 6] 2120 	ld	sp,hl
   7049 18 46         [12] 2121 	jr	00108$
   704B                    2122 00107$:
                           2123 ;src/main.c:409: actual->patrolling = 0;
   704B DD 6E FD      [19] 2124 	ld	l,-3 (ix)
   704E DD 66 FE      [19] 2125 	ld	h,-2 (ix)
   7051 36 00         [10] 2126 	ld	(hl),#0x00
                           2127 ;src/main.c:410: if(!actual->engage){
   7053 C5            [11] 2128 	push	bc
   7054 FD E1         [14] 2129 	pop	iy
   7056 FD 7E 16      [19] 2130 	ld	a,22 (iy)
   7059 B7            [ 4] 2131 	or	a, a
   705A 20 35         [12] 2132 	jr	NZ,00108$
                           2133 ;src/main.c:411: actual->seek = 1;
   705C DD 6E F8      [19] 2134 	ld	l,-8 (ix)
   705F DD 66 F9      [19] 2135 	ld	h,-7 (ix)
   7062 36 01         [10] 2136 	ld	(hl),#0x01
                           2137 ;src/main.c:412: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7064 3A 32 64      [13] 2138 	ld	a,(#_prota + 1)
   7067 DD 77 FC      [19] 2139 	ld	-4 (ix),a
   706A 21 31 64      [10] 2140 	ld	hl, #_prota + 0
   706D 5E            [ 7] 2141 	ld	e,(hl)
   706E E1            [10] 2142 	pop	hl
   706F E5            [11] 2143 	push	hl
   7070 56            [ 7] 2144 	ld	d,(hl)
   7071 0A            [ 7] 2145 	ld	a,(bc)
   7072 DD 77 FD      [19] 2146 	ld	-3 (ix),a
   7075 2A 0E 65      [16] 2147 	ld	hl,(_mapa)
   7078 E5            [11] 2148 	push	hl
   7079 C5            [11] 2149 	push	bc
   707A DD 7E FC      [19] 2150 	ld	a,-4 (ix)
   707D F5            [11] 2151 	push	af
   707E 33            [ 6] 2152 	inc	sp
   707F 7B            [ 4] 2153 	ld	a,e
   7080 F5            [11] 2154 	push	af
   7081 33            [ 6] 2155 	inc	sp
   7082 D5            [11] 2156 	push	de
   7083 33            [ 6] 2157 	inc	sp
   7084 DD 7E FD      [19] 2158 	ld	a,-3 (ix)
   7087 F5            [11] 2159 	push	af
   7088 33            [ 6] 2160 	inc	sp
   7089 CD 30 44      [17] 2161 	call	_pathFinding
   708C 21 08 00      [10] 2162 	ld	hl,#8
   708F 39            [11] 2163 	add	hl,sp
   7090 F9            [ 6] 2164 	ld	sp,hl
   7091                    2165 00108$:
                           2166 ;src/main.c:415: actual->iter = 0;
   7091 DD 6E FA      [19] 2167 	ld	l,-6 (ix)
   7094 DD 66 FB      [19] 2168 	ld	h,-5 (ix)
   7097 AF            [ 4] 2169 	xor	a, a
   7098 77            [ 7] 2170 	ld	(hl), a
   7099 23            [ 6] 2171 	inc	hl
   709A 77            [ 7] 2172 	ld	(hl), a
   709B                    2173 00114$:
   709B DD F9         [10] 2174 	ld	sp, ix
   709D DD E1         [14] 2175 	pop	ix
   709F C9            [10] 2176 	ret
                           2177 ;src/main.c:421: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2178 ;	---------------------------------
                           2179 ; Function engage
                           2180 ; ---------------------------------
   70A0                    2181 _engage::
   70A0 DD E5         [15] 2182 	push	ix
   70A2 DD 21 00 00   [14] 2183 	ld	ix,#0
   70A6 DD 39         [15] 2184 	add	ix,sp
   70A8 21 ED FF      [10] 2185 	ld	hl,#-19
   70AB 39            [11] 2186 	add	hl,sp
   70AC F9            [ 6] 2187 	ld	sp,hl
                           2188 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70AD DD 7E 04      [19] 2189 	ld	a,4 (ix)
   70B0 DD 77 F1      [19] 2190 	ld	-15 (ix),a
   70B3 DD 7E 05      [19] 2191 	ld	a,5 (ix)
   70B6 DD 77 F2      [19] 2192 	ld	-14 (ix),a
   70B9 DD 6E F1      [19] 2193 	ld	l,-15 (ix)
   70BC DD 66 F2      [19] 2194 	ld	h,-14 (ix)
   70BF 4E            [ 7] 2195 	ld	c,(hl)
   70C0 06 00         [ 7] 2196 	ld	b,#0x00
   70C2 21 31 64      [10] 2197 	ld	hl,#_prota+0
   70C5 5E            [ 7] 2198 	ld	e,(hl)
   70C6 16 00         [ 7] 2199 	ld	d,#0x00
   70C8 79            [ 4] 2200 	ld	a,c
   70C9 93            [ 4] 2201 	sub	a, e
   70CA 4F            [ 4] 2202 	ld	c,a
   70CB 78            [ 4] 2203 	ld	a,b
   70CC 9A            [ 4] 2204 	sbc	a, d
   70CD 47            [ 4] 2205 	ld	b,a
   70CE C5            [11] 2206 	push	bc
   70CF CD A5 4B      [17] 2207 	call	_abs
   70D2 F1            [10] 2208 	pop	af
   70D3 4D            [ 4] 2209 	ld	c,l
                           2210 ;src/main.c:423: u8 dify = abs(enemy->y - prota.y);
   70D4 DD 7E F1      [19] 2211 	ld	a,-15 (ix)
   70D7 C6 01         [ 7] 2212 	add	a, #0x01
   70D9 DD 77 F3      [19] 2213 	ld	-13 (ix),a
   70DC DD 7E F2      [19] 2214 	ld	a,-14 (ix)
   70DF CE 00         [ 7] 2215 	adc	a, #0x00
   70E1 DD 77 F4      [19] 2216 	ld	-12 (ix),a
   70E4 DD 6E F3      [19] 2217 	ld	l,-13 (ix)
   70E7 DD 66 F4      [19] 2218 	ld	h,-12 (ix)
   70EA 5E            [ 7] 2219 	ld	e,(hl)
   70EB 16 00         [ 7] 2220 	ld	d,#0x00
   70ED 21 32 64      [10] 2221 	ld	hl, #_prota + 1
   70F0 6E            [ 7] 2222 	ld	l,(hl)
   70F1 26 00         [ 7] 2223 	ld	h,#0x00
   70F3 7B            [ 4] 2224 	ld	a,e
   70F4 95            [ 4] 2225 	sub	a, l
   70F5 5F            [ 4] 2226 	ld	e,a
   70F6 7A            [ 4] 2227 	ld	a,d
   70F7 9C            [ 4] 2228 	sbc	a, h
   70F8 57            [ 4] 2229 	ld	d,a
   70F9 C5            [11] 2230 	push	bc
   70FA D5            [11] 2231 	push	de
   70FB CD A5 4B      [17] 2232 	call	_abs
   70FE F1            [10] 2233 	pop	af
   70FF C1            [10] 2234 	pop	bc
                           2235 ;src/main.c:424: u8 dist = difx + dify; // manhattan
   7100 09            [11] 2236 	add	hl, bc
   7101 DD 75 F0      [19] 2237 	ld	-16 (ix),l
                           2238 ;src/main.c:426: u8 movX = 0;
   7104 DD 36 ED 00   [19] 2239 	ld	-19 (ix),#0x00
                           2240 ;src/main.c:427: u8 movY = 0;
   7108 DD 36 EF 00   [19] 2241 	ld	-17 (ix),#0x00
                           2242 ;src/main.c:428: u8 distConstraint = 25;
   710C DD 36 EE 19   [19] 2243 	ld	-18 (ix),#0x19
                           2244 ;src/main.c:429: enemy->mover = NO;
   7110 DD 7E F1      [19] 2245 	ld	a,-15 (ix)
   7113 C6 06         [ 7] 2246 	add	a, #0x06
   7115 DD 77 F5      [19] 2247 	ld	-11 (ix),a
   7118 DD 7E F2      [19] 2248 	ld	a,-14 (ix)
   711B CE 00         [ 7] 2249 	adc	a, #0x00
   711D DD 77 F6      [19] 2250 	ld	-10 (ix),a
   7120 DD 6E F5      [19] 2251 	ld	l,-11 (ix)
   7123 DD 66 F6      [19] 2252 	ld	h,-10 (ix)
   7126 36 00         [10] 2253 	ld	(hl),#0x00
                           2254 ;src/main.c:438: enemy->patrolling = SI;
   7128 DD 7E F1      [19] 2255 	ld	a,-15 (ix)
   712B C6 0B         [ 7] 2256 	add	a, #0x0B
   712D 4F            [ 4] 2257 	ld	c,a
   712E DD 7E F2      [19] 2258 	ld	a,-14 (ix)
   7131 CE 00         [ 7] 2259 	adc	a, #0x00
   7133 47            [ 4] 2260 	ld	b,a
                           2261 ;src/main.c:431: if (dist < 20) {
   7134 DD 7E F0      [19] 2262 	ld	a,-16 (ix)
   7137 D6 14         [ 7] 2263 	sub	a, #0x14
   7139 30 28         [12] 2264 	jr	NC,00105$
                           2265 ;src/main.c:432: vidas--;
   713B 21 12 65      [10] 2266 	ld	hl, #_vidas+0
   713E 35            [11] 2267 	dec	(hl)
                           2268 ;src/main.c:433: if (vidas == 0) {
   713F 3A 12 65      [13] 2269 	ld	a,(#_vidas + 0)
   7142 B7            [ 4] 2270 	or	a, a
   7143 20 10         [12] 2271 	jr	NZ,00102$
                           2272 ;src/main.c:434: menuFin(puntuacion);
   7145 FD 21 11 65   [14] 2273 	ld	iy,#_puntuacion
   7149 FD 6E 00      [19] 2274 	ld	l,0 (iy)
   714C 26 00         [ 7] 2275 	ld	h,#0x00
   714E C5            [11] 2276 	push	bc
   714F CD E5 4B      [17] 2277 	call	_menuFin
   7152 C1            [10] 2278 	pop	bc
   7153 18 0B         [12] 2279 	jr	00103$
   7155                    2280 00102$:
                           2281 ;src/main.c:436: modificarVidas(vidas);
   7155 C5            [11] 2282 	push	bc
   7156 3A 12 65      [13] 2283 	ld	a,(_vidas)
   7159 F5            [11] 2284 	push	af
   715A 33            [ 6] 2285 	inc	sp
   715B CD 28 53      [17] 2286 	call	_modificarVidas
   715E 33            [ 6] 2287 	inc	sp
   715F C1            [10] 2288 	pop	bc
   7160                    2289 00103$:
                           2290 ;src/main.c:438: enemy->patrolling = SI;
   7160 3E 01         [ 7] 2291 	ld	a,#0x01
   7162 02            [ 7] 2292 	ld	(bc),a
   7163                    2293 00105$:
                           2294 ;src/main.c:441: if (!enemy->patrolling) {
   7163 0A            [ 7] 2295 	ld	a,(bc)
   7164 DD 77 F7      [19] 2296 	ld	-9 (ix), a
   7167 B7            [ 4] 2297 	or	a, a
   7168 C2 1F 79      [10] 2298 	jp	NZ,00206$
                           2299 ;src/main.c:442: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   716B DD 6E F3      [19] 2300 	ld	l,-13 (ix)
   716E DD 66 F4      [19] 2301 	ld	h,-12 (ix)
   7171 7E            [ 7] 2302 	ld	a,(hl)
   7172 DD 77 F7      [19] 2303 	ld	-9 (ix),a
                           2304 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7175 DD 6E F1      [19] 2305 	ld	l,-15 (ix)
   7178 DD 66 F2      [19] 2306 	ld	h,-14 (ix)
   717B 7E            [ 7] 2307 	ld	a,(hl)
                           2308 ;src/main.c:455: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   717C DD 77 F8      [19] 2309 	ld	-8 (ix), a
   717F C6 04         [ 7] 2310 	add	a, #0x04
   7181 DD 77 F9      [19] 2311 	ld	-7 (ix),a
                           2312 ;src/main.c:442: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7184 DD 7E F7      [19] 2313 	ld	a,-9 (ix)
   7187 DD 96 07      [19] 2314 	sub	a, 7 (ix)
   718A 28 2B         [12] 2315 	jr	Z,00199$
   718C DD 4E 07      [19] 2316 	ld	c,7 (ix)
   718F 06 00         [ 7] 2317 	ld	b,#0x00
   7191 21 01 00      [10] 2318 	ld	hl,#0x0001
   7194 09            [11] 2319 	add	hl,bc
   7195 DD 75 FA      [19] 2320 	ld	-6 (ix),l
   7198 DD 74 FB      [19] 2321 	ld	-5 (ix),h
   719B DD 5E F7      [19] 2322 	ld	e,-9 (ix)
   719E 16 00         [ 7] 2323 	ld	d,#0x00
   71A0 7B            [ 4] 2324 	ld	a,e
   71A1 DD 96 FA      [19] 2325 	sub	a, -6 (ix)
   71A4 20 06         [12] 2326 	jr	NZ,00441$
   71A6 7A            [ 4] 2327 	ld	a,d
   71A7 DD 96 FB      [19] 2328 	sub	a, -5 (ix)
   71AA 28 0B         [12] 2329 	jr	Z,00199$
   71AC                    2330 00441$:
   71AC 0B            [ 6] 2331 	dec	bc
   71AD 7B            [ 4] 2332 	ld	a,e
   71AE 91            [ 4] 2333 	sub	a, c
   71AF C2 BB 72      [10] 2334 	jp	NZ,00200$
   71B2 7A            [ 4] 2335 	ld	a,d
   71B3 90            [ 4] 2336 	sub	a, b
   71B4 C2 BB 72      [10] 2337 	jp	NZ,00200$
   71B7                    2338 00199$:
                           2339 ;src/main.c:443: if (dx < enemy->x) { // izquierda
   71B7 DD 7E 06      [19] 2340 	ld	a,6 (ix)
   71BA DD 96 F8      [19] 2341 	sub	a, -8 (ix)
   71BD 30 79         [12] 2342 	jr	NC,00119$
                           2343 ;src/main.c:444: if (dist > 11) {
   71BF 3E 0B         [ 7] 2344 	ld	a,#0x0B
   71C1 DD 96 F0      [19] 2345 	sub	a, -16 (ix)
   71C4 D2 1F 79      [10] 2346 	jp	NC,00206$
                           2347 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   71C7 DD 66 F7      [19] 2348 	ld	h,-9 (ix)
   71CA DD 6E F8      [19] 2349 	ld	l,-8 (ix)
   71CD E5            [11] 2350 	push	hl
   71CE 2A 0E 65      [16] 2351 	ld	hl,(_mapa)
   71D1 E5            [11] 2352 	push	hl
   71D2 CD 61 4B      [17] 2353 	call	_getTilePtr
   71D5 F1            [10] 2354 	pop	af
   71D6 F1            [10] 2355 	pop	af
   71D7 4E            [ 7] 2356 	ld	c,(hl)
   71D8 3E 02         [ 7] 2357 	ld	a,#0x02
   71DA 91            [ 4] 2358 	sub	a, c
   71DB DA 1F 79      [10] 2359 	jp	C,00206$
                           2360 ;src/main.c:446: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   71DE DD 6E F3      [19] 2361 	ld	l,-13 (ix)
   71E1 DD 66 F4      [19] 2362 	ld	h,-12 (ix)
   71E4 7E            [ 7] 2363 	ld	a,(hl)
   71E5 C6 0B         [ 7] 2364 	add	a, #0x0B
   71E7 47            [ 4] 2365 	ld	b,a
   71E8 DD 6E F1      [19] 2366 	ld	l,-15 (ix)
   71EB DD 66 F2      [19] 2367 	ld	h,-14 (ix)
   71EE 4E            [ 7] 2368 	ld	c, (hl)
   71EF C5            [11] 2369 	push	bc
   71F0 2A 0E 65      [16] 2370 	ld	hl,(_mapa)
   71F3 E5            [11] 2371 	push	hl
   71F4 CD 61 4B      [17] 2372 	call	_getTilePtr
   71F7 F1            [10] 2373 	pop	af
   71F8 F1            [10] 2374 	pop	af
   71F9 4E            [ 7] 2375 	ld	c,(hl)
   71FA 3E 02         [ 7] 2376 	ld	a,#0x02
   71FC 91            [ 4] 2377 	sub	a, c
   71FD DA 1F 79      [10] 2378 	jp	C,00206$
                           2379 ;src/main.c:447: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7200 DD 6E F3      [19] 2380 	ld	l,-13 (ix)
   7203 DD 66 F4      [19] 2381 	ld	h,-12 (ix)
   7206 7E            [ 7] 2382 	ld	a,(hl)
   7207 C6 16         [ 7] 2383 	add	a, #0x16
   7209 47            [ 4] 2384 	ld	b,a
   720A DD 6E F1      [19] 2385 	ld	l,-15 (ix)
   720D DD 66 F2      [19] 2386 	ld	h,-14 (ix)
   7210 4E            [ 7] 2387 	ld	c, (hl)
   7211 C5            [11] 2388 	push	bc
   7212 2A 0E 65      [16] 2389 	ld	hl,(_mapa)
   7215 E5            [11] 2390 	push	hl
   7216 CD 61 4B      [17] 2391 	call	_getTilePtr
   7219 F1            [10] 2392 	pop	af
   721A F1            [10] 2393 	pop	af
   721B 4E            [ 7] 2394 	ld	c,(hl)
   721C 3E 02         [ 7] 2395 	ld	a,#0x02
   721E 91            [ 4] 2396 	sub	a, c
   721F DA 1F 79      [10] 2397 	jp	C,00206$
                           2398 ;src/main.c:448: moverEnemigoIzquierda(enemy);
   7222 DD 6E F1      [19] 2399 	ld	l,-15 (ix)
   7225 DD 66 F2      [19] 2400 	ld	h,-14 (ix)
   7228 E5            [11] 2401 	push	hl
   7229 CD B3 6B      [17] 2402 	call	_moverEnemigoIzquierda
   722C F1            [10] 2403 	pop	af
                           2404 ;src/main.c:450: enemy->mover = SI;
   722D DD 6E F5      [19] 2405 	ld	l,-11 (ix)
   7230 DD 66 F6      [19] 2406 	ld	h,-10 (ix)
   7233 36 01         [10] 2407 	ld	(hl),#0x01
   7235 C3 1F 79      [10] 2408 	jp	00206$
   7238                    2409 00119$:
                           2410 ;src/main.c:454: if (dist > G_ENEMY_W + 3) {
   7238 3E 07         [ 7] 2411 	ld	a,#0x07
   723A DD 96 F0      [19] 2412 	sub	a, -16 (ix)
   723D D2 1F 79      [10] 2413 	jp	NC,00206$
                           2414 ;src/main.c:455: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7240 DD 66 F7      [19] 2415 	ld	h,-9 (ix)
   7243 DD 6E F9      [19] 2416 	ld	l,-7 (ix)
   7246 E5            [11] 2417 	push	hl
   7247 2A 0E 65      [16] 2418 	ld	hl,(_mapa)
   724A E5            [11] 2419 	push	hl
   724B CD 61 4B      [17] 2420 	call	_getTilePtr
   724E F1            [10] 2421 	pop	af
   724F F1            [10] 2422 	pop	af
   7250 4E            [ 7] 2423 	ld	c,(hl)
   7251 3E 02         [ 7] 2424 	ld	a,#0x02
   7253 91            [ 4] 2425 	sub	a, c
   7254 DA 1F 79      [10] 2426 	jp	C,00206$
                           2427 ;src/main.c:456: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7257 DD 6E F3      [19] 2428 	ld	l,-13 (ix)
   725A DD 66 F4      [19] 2429 	ld	h,-12 (ix)
   725D 7E            [ 7] 2430 	ld	a,(hl)
   725E C6 0B         [ 7] 2431 	add	a, #0x0B
   7260 47            [ 4] 2432 	ld	b,a
   7261 DD 6E F1      [19] 2433 	ld	l,-15 (ix)
   7264 DD 66 F2      [19] 2434 	ld	h,-14 (ix)
   7267 7E            [ 7] 2435 	ld	a,(hl)
   7268 C6 04         [ 7] 2436 	add	a, #0x04
   726A C5            [11] 2437 	push	bc
   726B 33            [ 6] 2438 	inc	sp
   726C F5            [11] 2439 	push	af
   726D 33            [ 6] 2440 	inc	sp
   726E 2A 0E 65      [16] 2441 	ld	hl,(_mapa)
   7271 E5            [11] 2442 	push	hl
   7272 CD 61 4B      [17] 2443 	call	_getTilePtr
   7275 F1            [10] 2444 	pop	af
   7276 F1            [10] 2445 	pop	af
   7277 4E            [ 7] 2446 	ld	c,(hl)
   7278 3E 02         [ 7] 2447 	ld	a,#0x02
   727A 91            [ 4] 2448 	sub	a, c
   727B DA 1F 79      [10] 2449 	jp	C,00206$
                           2450 ;src/main.c:457: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   727E DD 6E F3      [19] 2451 	ld	l,-13 (ix)
   7281 DD 66 F4      [19] 2452 	ld	h,-12 (ix)
   7284 7E            [ 7] 2453 	ld	a,(hl)
   7285 C6 16         [ 7] 2454 	add	a, #0x16
   7287 47            [ 4] 2455 	ld	b,a
   7288 DD 6E F1      [19] 2456 	ld	l,-15 (ix)
   728B DD 66 F2      [19] 2457 	ld	h,-14 (ix)
   728E 7E            [ 7] 2458 	ld	a,(hl)
   728F C6 04         [ 7] 2459 	add	a, #0x04
   7291 C5            [11] 2460 	push	bc
   7292 33            [ 6] 2461 	inc	sp
   7293 F5            [11] 2462 	push	af
   7294 33            [ 6] 2463 	inc	sp
   7295 2A 0E 65      [16] 2464 	ld	hl,(_mapa)
   7298 E5            [11] 2465 	push	hl
   7299 CD 61 4B      [17] 2466 	call	_getTilePtr
   729C F1            [10] 2467 	pop	af
   729D F1            [10] 2468 	pop	af
   729E 4E            [ 7] 2469 	ld	c,(hl)
   729F 3E 02         [ 7] 2470 	ld	a,#0x02
   72A1 91            [ 4] 2471 	sub	a, c
   72A2 DA 1F 79      [10] 2472 	jp	C,00206$
                           2473 ;src/main.c:458: moverEnemigoDerecha(enemy);
   72A5 DD 6E F1      [19] 2474 	ld	l,-15 (ix)
   72A8 DD 66 F2      [19] 2475 	ld	h,-14 (ix)
   72AB E5            [11] 2476 	push	hl
   72AC CD A3 6B      [17] 2477 	call	_moverEnemigoDerecha
   72AF F1            [10] 2478 	pop	af
                           2479 ;src/main.c:460: enemy->mover = SI;
   72B0 DD 6E F5      [19] 2480 	ld	l,-11 (ix)
   72B3 DD 66 F6      [19] 2481 	ld	h,-10 (ix)
   72B6 36 01         [10] 2482 	ld	(hl),#0x01
   72B8 C3 1F 79      [10] 2483 	jp	00206$
   72BB                    2484 00200$:
                           2485 ;src/main.c:465: else if (enemy->x == dx) {
   72BB DD 7E F8      [19] 2486 	ld	a,-8 (ix)
   72BE DD 96 06      [19] 2487 	sub	a, 6 (ix)
   72C1 C2 D8 73      [10] 2488 	jp	NZ,00197$
                           2489 ;src/main.c:466: if (dy < enemy->y) {
   72C4 DD 7E 07      [19] 2490 	ld	a,7 (ix)
   72C7 DD 96 F7      [19] 2491 	sub	a, -9 (ix)
   72CA D2 51 73      [10] 2492 	jp	NC,00134$
                           2493 ;src/main.c:467: if (dist > G_HERO_H + 5) {
   72CD 3E 1B         [ 7] 2494 	ld	a,#0x1B
   72CF DD 96 F0      [19] 2495 	sub	a, -16 (ix)
   72D2 D2 1F 79      [10] 2496 	jp	NC,00206$
                           2497 ;src/main.c:468: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   72D5 DD 46 F7      [19] 2498 	ld	b,-9 (ix)
   72D8 05            [ 4] 2499 	dec	b
   72D9 05            [ 4] 2500 	dec	b
   72DA C5            [11] 2501 	push	bc
   72DB 33            [ 6] 2502 	inc	sp
   72DC DD 7E F8      [19] 2503 	ld	a,-8 (ix)
   72DF F5            [11] 2504 	push	af
   72E0 33            [ 6] 2505 	inc	sp
   72E1 2A 0E 65      [16] 2506 	ld	hl,(_mapa)
   72E4 E5            [11] 2507 	push	hl
   72E5 CD 61 4B      [17] 2508 	call	_getTilePtr
   72E8 F1            [10] 2509 	pop	af
   72E9 F1            [10] 2510 	pop	af
   72EA 4E            [ 7] 2511 	ld	c,(hl)
   72EB 3E 02         [ 7] 2512 	ld	a,#0x02
   72ED 91            [ 4] 2513 	sub	a, c
   72EE DA 1F 79      [10] 2514 	jp	C,00206$
                           2515 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   72F1 DD 6E F3      [19] 2516 	ld	l,-13 (ix)
   72F4 DD 66 F4      [19] 2517 	ld	h,-12 (ix)
   72F7 46            [ 7] 2518 	ld	b,(hl)
   72F8 05            [ 4] 2519 	dec	b
   72F9 05            [ 4] 2520 	dec	b
   72FA DD 6E F1      [19] 2521 	ld	l,-15 (ix)
   72FD DD 66 F2      [19] 2522 	ld	h,-14 (ix)
   7300 56            [ 7] 2523 	ld	d,(hl)
   7301 14            [ 4] 2524 	inc	d
   7302 14            [ 4] 2525 	inc	d
   7303 4A            [ 4] 2526 	ld	c, d
   7304 C5            [11] 2527 	push	bc
   7305 2A 0E 65      [16] 2528 	ld	hl,(_mapa)
   7308 E5            [11] 2529 	push	hl
   7309 CD 61 4B      [17] 2530 	call	_getTilePtr
   730C F1            [10] 2531 	pop	af
   730D F1            [10] 2532 	pop	af
   730E 4E            [ 7] 2533 	ld	c,(hl)
   730F 3E 02         [ 7] 2534 	ld	a,#0x02
   7311 91            [ 4] 2535 	sub	a, c
   7312 DA 1F 79      [10] 2536 	jp	C,00206$
                           2537 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7315 DD 6E F3      [19] 2538 	ld	l,-13 (ix)
   7318 DD 66 F4      [19] 2539 	ld	h,-12 (ix)
   731B 46            [ 7] 2540 	ld	b,(hl)
   731C 05            [ 4] 2541 	dec	b
   731D 05            [ 4] 2542 	dec	b
   731E DD 6E F1      [19] 2543 	ld	l,-15 (ix)
   7321 DD 66 F2      [19] 2544 	ld	h,-14 (ix)
   7324 7E            [ 7] 2545 	ld	a,(hl)
   7325 C6 04         [ 7] 2546 	add	a, #0x04
   7327 C5            [11] 2547 	push	bc
   7328 33            [ 6] 2548 	inc	sp
   7329 F5            [11] 2549 	push	af
   732A 33            [ 6] 2550 	inc	sp
   732B 2A 0E 65      [16] 2551 	ld	hl,(_mapa)
   732E E5            [11] 2552 	push	hl
   732F CD 61 4B      [17] 2553 	call	_getTilePtr
   7332 F1            [10] 2554 	pop	af
   7333 F1            [10] 2555 	pop	af
   7334 4E            [ 7] 2556 	ld	c,(hl)
   7335 3E 02         [ 7] 2557 	ld	a,#0x02
   7337 91            [ 4] 2558 	sub	a, c
   7338 DA 1F 79      [10] 2559 	jp	C,00206$
                           2560 ;src/main.c:471: moverEnemigoArriba(enemy);
   733B DD 6E F1      [19] 2561 	ld	l,-15 (ix)
   733E DD 66 F2      [19] 2562 	ld	h,-14 (ix)
   7341 E5            [11] 2563 	push	hl
   7342 CD 65 6B      [17] 2564 	call	_moverEnemigoArriba
   7345 F1            [10] 2565 	pop	af
                           2566 ;src/main.c:473: enemy->mover = SI;
   7346 DD 6E F5      [19] 2567 	ld	l,-11 (ix)
   7349 DD 66 F6      [19] 2568 	ld	h,-10 (ix)
   734C 36 01         [10] 2569 	ld	(hl),#0x01
   734E C3 1F 79      [10] 2570 	jp	00206$
   7351                    2571 00134$:
                           2572 ;src/main.c:477: if(dist > G_ENEMY_H + 7) {
   7351 3E 1D         [ 7] 2573 	ld	a,#0x1D
   7353 DD 96 F0      [19] 2574 	sub	a, -16 (ix)
   7356 D2 1F 79      [10] 2575 	jp	NC,00206$
                           2576 ;src/main.c:478: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7359 DD 7E F7      [19] 2577 	ld	a,-9 (ix)
   735C C6 18         [ 7] 2578 	add	a, #0x18
   735E 47            [ 4] 2579 	ld	b,a
   735F C5            [11] 2580 	push	bc
   7360 33            [ 6] 2581 	inc	sp
   7361 DD 7E F8      [19] 2582 	ld	a,-8 (ix)
   7364 F5            [11] 2583 	push	af
   7365 33            [ 6] 2584 	inc	sp
   7366 2A 0E 65      [16] 2585 	ld	hl,(_mapa)
   7369 E5            [11] 2586 	push	hl
   736A CD 61 4B      [17] 2587 	call	_getTilePtr
   736D F1            [10] 2588 	pop	af
   736E F1            [10] 2589 	pop	af
   736F 4E            [ 7] 2590 	ld	c,(hl)
   7370 3E 02         [ 7] 2591 	ld	a,#0x02
   7372 91            [ 4] 2592 	sub	a, c
   7373 DA 1F 79      [10] 2593 	jp	C,00206$
                           2594 ;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7376 DD 6E F3      [19] 2595 	ld	l,-13 (ix)
   7379 DD 66 F4      [19] 2596 	ld	h,-12 (ix)
   737C 7E            [ 7] 2597 	ld	a,(hl)
   737D C6 18         [ 7] 2598 	add	a, #0x18
   737F 47            [ 4] 2599 	ld	b,a
   7380 DD 6E F1      [19] 2600 	ld	l,-15 (ix)
   7383 DD 66 F2      [19] 2601 	ld	h,-14 (ix)
   7386 56            [ 7] 2602 	ld	d,(hl)
   7387 14            [ 4] 2603 	inc	d
   7388 14            [ 4] 2604 	inc	d
   7389 4A            [ 4] 2605 	ld	c, d
   738A C5            [11] 2606 	push	bc
   738B 2A 0E 65      [16] 2607 	ld	hl,(_mapa)
   738E E5            [11] 2608 	push	hl
   738F CD 61 4B      [17] 2609 	call	_getTilePtr
   7392 F1            [10] 2610 	pop	af
   7393 F1            [10] 2611 	pop	af
   7394 4E            [ 7] 2612 	ld	c,(hl)
   7395 3E 02         [ 7] 2613 	ld	a,#0x02
   7397 91            [ 4] 2614 	sub	a, c
   7398 DA 1F 79      [10] 2615 	jp	C,00206$
                           2616 ;src/main.c:480: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   739B DD 6E F3      [19] 2617 	ld	l,-13 (ix)
   739E DD 66 F4      [19] 2618 	ld	h,-12 (ix)
   73A1 7E            [ 7] 2619 	ld	a,(hl)
   73A2 C6 18         [ 7] 2620 	add	a, #0x18
   73A4 47            [ 4] 2621 	ld	b,a
   73A5 DD 6E F1      [19] 2622 	ld	l,-15 (ix)
   73A8 DD 66 F2      [19] 2623 	ld	h,-14 (ix)
   73AB 7E            [ 7] 2624 	ld	a,(hl)
   73AC C6 04         [ 7] 2625 	add	a, #0x04
   73AE C5            [11] 2626 	push	bc
   73AF 33            [ 6] 2627 	inc	sp
   73B0 F5            [11] 2628 	push	af
   73B1 33            [ 6] 2629 	inc	sp
   73B2 2A 0E 65      [16] 2630 	ld	hl,(_mapa)
   73B5 E5            [11] 2631 	push	hl
   73B6 CD 61 4B      [17] 2632 	call	_getTilePtr
   73B9 F1            [10] 2633 	pop	af
   73BA F1            [10] 2634 	pop	af
   73BB 4E            [ 7] 2635 	ld	c,(hl)
   73BC 3E 02         [ 7] 2636 	ld	a,#0x02
   73BE 91            [ 4] 2637 	sub	a, c
   73BF DA 1F 79      [10] 2638 	jp	C,00206$
                           2639 ;src/main.c:481: moverEnemigoAbajo(enemy);
   73C2 DD 6E F1      [19] 2640 	ld	l,-15 (ix)
   73C5 DD 66 F2      [19] 2641 	ld	h,-14 (ix)
   73C8 E5            [11] 2642 	push	hl
   73C9 CD 84 6B      [17] 2643 	call	_moverEnemigoAbajo
   73CC F1            [10] 2644 	pop	af
                           2645 ;src/main.c:483: enemy->mover = SI;
   73CD DD 6E F5      [19] 2646 	ld	l,-11 (ix)
   73D0 DD 66 F6      [19] 2647 	ld	h,-10 (ix)
   73D3 36 01         [10] 2648 	ld	(hl),#0x01
   73D5 C3 1F 79      [10] 2649 	jp	00206$
   73D8                    2650 00197$:
                           2651 ;src/main.c:489: if (!prota.mover) distConstraint = 20; // ajuste en parado
   73D8 3A 37 64      [13] 2652 	ld	a, (#_prota + 6)
   73DB B7            [ 4] 2653 	or	a, a
   73DC 20 04         [12] 2654 	jr	NZ,00137$
   73DE DD 36 EE 14   [19] 2655 	ld	-18 (ix),#0x14
   73E2                    2656 00137$:
                           2657 ;src/main.c:491: if (dist > distConstraint) {
   73E2 DD 7E EE      [19] 2658 	ld	a,-18 (ix)
   73E5 DD 96 F0      [19] 2659 	sub	a, -16 (ix)
   73E8 D2 1F 79      [10] 2660 	jp	NC,00206$
                           2661 ;src/main.c:492: if (dx + 1 < enemy->x) {
   73EB DD 4E 06      [19] 2662 	ld	c,6 (ix)
   73EE 06 00         [ 7] 2663 	ld	b,#0x00
   73F0 03            [ 6] 2664 	inc	bc
   73F1 DD 71 FA      [19] 2665 	ld	-6 (ix),c
   73F4 DD 70 FB      [19] 2666 	ld	-5 (ix),b
   73F7 DD 7E F8      [19] 2667 	ld	a,-8 (ix)
   73FA DD 77 FC      [19] 2668 	ld	-4 (ix),a
   73FD DD 36 FD 00   [19] 2669 	ld	-3 (ix),#0x00
   7401 DD 7E FA      [19] 2670 	ld	a,-6 (ix)
   7404 DD 96 FC      [19] 2671 	sub	a, -4 (ix)
   7407 DD 7E FB      [19] 2672 	ld	a,-5 (ix)
   740A DD 9E FD      [19] 2673 	sbc	a, -3 (ix)
   740D E2 12 74      [10] 2674 	jp	PO, 00446$
   7410 EE 80         [ 7] 2675 	xor	a, #0x80
   7412                    2676 00446$:
   7412 F2 A9 74      [10] 2677 	jp	P,00149$
                           2678 ;src/main.c:493: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7415 DD 66 F7      [19] 2679 	ld	h,-9 (ix)
   7418 DD 6E F8      [19] 2680 	ld	l,-8 (ix)
   741B E5            [11] 2681 	push	hl
   741C 2A 0E 65      [16] 2682 	ld	hl,(_mapa)
   741F E5            [11] 2683 	push	hl
   7420 CD 61 4B      [17] 2684 	call	_getTilePtr
   7423 F1            [10] 2685 	pop	af
   7424 F1            [10] 2686 	pop	af
   7425 DD 74 FF      [19] 2687 	ld	-1 (ix),h
   7428 DD 75 FE      [19] 2688 	ld	-2 (ix), l
   742B DD 66 FF      [19] 2689 	ld	h,-1 (ix)
   742E 4E            [ 7] 2690 	ld	c,(hl)
   742F 3E 02         [ 7] 2691 	ld	a,#0x02
   7431 91            [ 4] 2692 	sub	a, c
   7432 DA 36 75      [10] 2693 	jp	C,00150$
                           2694 ;src/main.c:494: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7435 DD 6E F3      [19] 2695 	ld	l,-13 (ix)
   7438 DD 66 F4      [19] 2696 	ld	h,-12 (ix)
   743B 7E            [ 7] 2697 	ld	a,(hl)
   743C DD 77 FE      [19] 2698 	ld	-2 (ix), a
   743F C6 0B         [ 7] 2699 	add	a, #0x0B
   7441 DD 77 FE      [19] 2700 	ld	-2 (ix),a
   7444 DD 6E F1      [19] 2701 	ld	l,-15 (ix)
   7447 DD 66 F2      [19] 2702 	ld	h,-14 (ix)
   744A 46            [ 7] 2703 	ld	b,(hl)
   744B DD 7E FE      [19] 2704 	ld	a,-2 (ix)
   744E F5            [11] 2705 	push	af
   744F 33            [ 6] 2706 	inc	sp
   7450 C5            [11] 2707 	push	bc
   7451 33            [ 6] 2708 	inc	sp
   7452 2A 0E 65      [16] 2709 	ld	hl,(_mapa)
   7455 E5            [11] 2710 	push	hl
   7456 CD 61 4B      [17] 2711 	call	_getTilePtr
   7459 F1            [10] 2712 	pop	af
   745A F1            [10] 2713 	pop	af
   745B 4E            [ 7] 2714 	ld	c,(hl)
   745C 3E 02         [ 7] 2715 	ld	a,#0x02
   745E 91            [ 4] 2716 	sub	a, c
   745F DA 36 75      [10] 2717 	jp	C,00150$
                           2718 ;src/main.c:495: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7462 DD 6E F3      [19] 2719 	ld	l,-13 (ix)
   7465 DD 66 F4      [19] 2720 	ld	h,-12 (ix)
   7468 7E            [ 7] 2721 	ld	a,(hl)
   7469 DD 77 FE      [19] 2722 	ld	-2 (ix), a
   746C C6 16         [ 7] 2723 	add	a, #0x16
   746E DD 77 FE      [19] 2724 	ld	-2 (ix),a
   7471 DD 6E F1      [19] 2725 	ld	l,-15 (ix)
   7474 DD 66 F2      [19] 2726 	ld	h,-14 (ix)
   7477 46            [ 7] 2727 	ld	b,(hl)
   7478 DD 7E FE      [19] 2728 	ld	a,-2 (ix)
   747B F5            [11] 2729 	push	af
   747C 33            [ 6] 2730 	inc	sp
   747D C5            [11] 2731 	push	bc
   747E 33            [ 6] 2732 	inc	sp
   747F 2A 0E 65      [16] 2733 	ld	hl,(_mapa)
   7482 E5            [11] 2734 	push	hl
   7483 CD 61 4B      [17] 2735 	call	_getTilePtr
   7486 F1            [10] 2736 	pop	af
   7487 F1            [10] 2737 	pop	af
   7488 4E            [ 7] 2738 	ld	c,(hl)
   7489 3E 02         [ 7] 2739 	ld	a,#0x02
   748B 91            [ 4] 2740 	sub	a, c
   748C DA 36 75      [10] 2741 	jp	C,00150$
                           2742 ;src/main.c:496: moverEnemigoIzquierda(enemy);
   748F DD 6E F1      [19] 2743 	ld	l,-15 (ix)
   7492 DD 66 F2      [19] 2744 	ld	h,-14 (ix)
   7495 E5            [11] 2745 	push	hl
   7496 CD B3 6B      [17] 2746 	call	_moverEnemigoIzquierda
   7499 F1            [10] 2747 	pop	af
                           2748 ;src/main.c:497: movX = 1;
   749A DD 36 ED 01   [19] 2749 	ld	-19 (ix),#0x01
                           2750 ;src/main.c:498: enemy->mover = SI;
   749E DD 6E F5      [19] 2751 	ld	l,-11 (ix)
   74A1 DD 66 F6      [19] 2752 	ld	h,-10 (ix)
   74A4 36 01         [10] 2753 	ld	(hl),#0x01
   74A6 C3 36 75      [10] 2754 	jp	00150$
   74A9                    2755 00149$:
                           2756 ;src/main.c:500: } else if (dx + 1 > enemy->x){
   74A9 DD 7E FC      [19] 2757 	ld	a,-4 (ix)
   74AC DD 96 FA      [19] 2758 	sub	a, -6 (ix)
   74AF DD 7E FD      [19] 2759 	ld	a,-3 (ix)
   74B2 DD 9E FB      [19] 2760 	sbc	a, -5 (ix)
   74B5 E2 BA 74      [10] 2761 	jp	PO, 00447$
   74B8 EE 80         [ 7] 2762 	xor	a, #0x80
   74BA                    2763 00447$:
   74BA F2 36 75      [10] 2764 	jp	P,00150$
                           2765 ;src/main.c:501: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   74BD DD 66 F7      [19] 2766 	ld	h,-9 (ix)
   74C0 DD 6E F9      [19] 2767 	ld	l,-7 (ix)
   74C3 E5            [11] 2768 	push	hl
   74C4 2A 0E 65      [16] 2769 	ld	hl,(_mapa)
   74C7 E5            [11] 2770 	push	hl
   74C8 CD 61 4B      [17] 2771 	call	_getTilePtr
   74CB F1            [10] 2772 	pop	af
   74CC F1            [10] 2773 	pop	af
   74CD 4E            [ 7] 2774 	ld	c,(hl)
   74CE 3E 02         [ 7] 2775 	ld	a,#0x02
   74D0 91            [ 4] 2776 	sub	a, c
   74D1 38 63         [12] 2777 	jr	C,00150$
                           2778 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   74D3 DD 6E F3      [19] 2779 	ld	l,-13 (ix)
   74D6 DD 66 F4      [19] 2780 	ld	h,-12 (ix)
   74D9 7E            [ 7] 2781 	ld	a,(hl)
   74DA C6 0B         [ 7] 2782 	add	a, #0x0B
   74DC 47            [ 4] 2783 	ld	b,a
   74DD DD 6E F1      [19] 2784 	ld	l,-15 (ix)
   74E0 DD 66 F2      [19] 2785 	ld	h,-14 (ix)
   74E3 7E            [ 7] 2786 	ld	a,(hl)
   74E4 C6 04         [ 7] 2787 	add	a, #0x04
   74E6 C5            [11] 2788 	push	bc
   74E7 33            [ 6] 2789 	inc	sp
   74E8 F5            [11] 2790 	push	af
   74E9 33            [ 6] 2791 	inc	sp
   74EA 2A 0E 65      [16] 2792 	ld	hl,(_mapa)
   74ED E5            [11] 2793 	push	hl
   74EE CD 61 4B      [17] 2794 	call	_getTilePtr
   74F1 F1            [10] 2795 	pop	af
   74F2 F1            [10] 2796 	pop	af
   74F3 4E            [ 7] 2797 	ld	c,(hl)
   74F4 3E 02         [ 7] 2798 	ld	a,#0x02
   74F6 91            [ 4] 2799 	sub	a, c
   74F7 38 3D         [12] 2800 	jr	C,00150$
                           2801 ;src/main.c:503: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   74F9 DD 6E F3      [19] 2802 	ld	l,-13 (ix)
   74FC DD 66 F4      [19] 2803 	ld	h,-12 (ix)
   74FF 7E            [ 7] 2804 	ld	a,(hl)
   7500 C6 16         [ 7] 2805 	add	a, #0x16
   7502 47            [ 4] 2806 	ld	b,a
   7503 DD 6E F1      [19] 2807 	ld	l,-15 (ix)
   7506 DD 66 F2      [19] 2808 	ld	h,-14 (ix)
   7509 7E            [ 7] 2809 	ld	a,(hl)
   750A C6 04         [ 7] 2810 	add	a, #0x04
   750C C5            [11] 2811 	push	bc
   750D 33            [ 6] 2812 	inc	sp
   750E F5            [11] 2813 	push	af
   750F 33            [ 6] 2814 	inc	sp
   7510 2A 0E 65      [16] 2815 	ld	hl,(_mapa)
   7513 E5            [11] 2816 	push	hl
   7514 CD 61 4B      [17] 2817 	call	_getTilePtr
   7517 F1            [10] 2818 	pop	af
   7518 F1            [10] 2819 	pop	af
   7519 4E            [ 7] 2820 	ld	c,(hl)
   751A 3E 02         [ 7] 2821 	ld	a,#0x02
   751C 91            [ 4] 2822 	sub	a, c
   751D 38 17         [12] 2823 	jr	C,00150$
                           2824 ;src/main.c:504: moverEnemigoDerecha(enemy);
   751F DD 6E F1      [19] 2825 	ld	l,-15 (ix)
   7522 DD 66 F2      [19] 2826 	ld	h,-14 (ix)
   7525 E5            [11] 2827 	push	hl
   7526 CD A3 6B      [17] 2828 	call	_moverEnemigoDerecha
   7529 F1            [10] 2829 	pop	af
                           2830 ;src/main.c:505: movX = 1;
   752A DD 36 ED 01   [19] 2831 	ld	-19 (ix),#0x01
                           2832 ;src/main.c:506: enemy->mover = SI;
   752E DD 6E F5      [19] 2833 	ld	l,-11 (ix)
   7531 DD 66 F6      [19] 2834 	ld	h,-10 (ix)
   7534 36 01         [10] 2835 	ld	(hl),#0x01
   7536                    2836 00150$:
                           2837 ;src/main.c:509: if (dy < enemy->y) {
   7536 DD 6E F3      [19] 2838 	ld	l,-13 (ix)
   7539 DD 66 F4      [19] 2839 	ld	h,-12 (ix)
   753C 7E            [ 7] 2840 	ld	a,(hl)
   753D DD 77 FE      [19] 2841 	ld	-2 (ix),a
                           2842 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7540 DD 6E F1      [19] 2843 	ld	l,-15 (ix)
   7543 DD 66 F2      [19] 2844 	ld	h,-14 (ix)
   7546 7E            [ 7] 2845 	ld	a,(hl)
   7547 DD 77 FC      [19] 2846 	ld	-4 (ix),a
                           2847 ;src/main.c:509: if (dy < enemy->y) {
   754A DD 7E 07      [19] 2848 	ld	a,7 (ix)
   754D DD 96 FE      [19] 2849 	sub	a, -2 (ix)
   7550 D2 D5 75      [10] 2850 	jp	NC,00160$
                           2851 ;src/main.c:510: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7553 DD 46 FE      [19] 2852 	ld	b,-2 (ix)
   7556 05            [ 4] 2853 	dec	b
   7557 05            [ 4] 2854 	dec	b
   7558 C5            [11] 2855 	push	bc
   7559 33            [ 6] 2856 	inc	sp
   755A DD 7E FC      [19] 2857 	ld	a,-4 (ix)
   755D F5            [11] 2858 	push	af
   755E 33            [ 6] 2859 	inc	sp
   755F 2A 0E 65      [16] 2860 	ld	hl,(_mapa)
   7562 E5            [11] 2861 	push	hl
   7563 CD 61 4B      [17] 2862 	call	_getTilePtr
   7566 F1            [10] 2863 	pop	af
   7567 F1            [10] 2864 	pop	af
   7568 4E            [ 7] 2865 	ld	c,(hl)
   7569 3E 02         [ 7] 2866 	ld	a,#0x02
   756B 91            [ 4] 2867 	sub	a, c
   756C DA 54 76      [10] 2868 	jp	C,00161$
                           2869 ;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   756F DD 6E F3      [19] 2870 	ld	l,-13 (ix)
   7572 DD 66 F4      [19] 2871 	ld	h,-12 (ix)
   7575 56            [ 7] 2872 	ld	d,(hl)
   7576 15            [ 4] 2873 	dec	d
   7577 15            [ 4] 2874 	dec	d
   7578 DD 6E F1      [19] 2875 	ld	l,-15 (ix)
   757B DD 66 F2      [19] 2876 	ld	h,-14 (ix)
   757E 46            [ 7] 2877 	ld	b,(hl)
   757F 04            [ 4] 2878 	inc	b
   7580 04            [ 4] 2879 	inc	b
   7581 D5            [11] 2880 	push	de
   7582 33            [ 6] 2881 	inc	sp
   7583 C5            [11] 2882 	push	bc
   7584 33            [ 6] 2883 	inc	sp
   7585 2A 0E 65      [16] 2884 	ld	hl,(_mapa)
   7588 E5            [11] 2885 	push	hl
   7589 CD 61 4B      [17] 2886 	call	_getTilePtr
   758C F1            [10] 2887 	pop	af
   758D F1            [10] 2888 	pop	af
   758E 4E            [ 7] 2889 	ld	c,(hl)
   758F 3E 02         [ 7] 2890 	ld	a,#0x02
   7591 91            [ 4] 2891 	sub	a, c
   7592 DA 54 76      [10] 2892 	jp	C,00161$
                           2893 ;src/main.c:512: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7595 DD 6E F3      [19] 2894 	ld	l,-13 (ix)
   7598 DD 66 F4      [19] 2895 	ld	h,-12 (ix)
   759B 46            [ 7] 2896 	ld	b,(hl)
   759C 05            [ 4] 2897 	dec	b
   759D 05            [ 4] 2898 	dec	b
   759E DD 6E F1      [19] 2899 	ld	l,-15 (ix)
   75A1 DD 66 F2      [19] 2900 	ld	h,-14 (ix)
   75A4 7E            [ 7] 2901 	ld	a,(hl)
   75A5 C6 04         [ 7] 2902 	add	a, #0x04
   75A7 C5            [11] 2903 	push	bc
   75A8 33            [ 6] 2904 	inc	sp
   75A9 F5            [11] 2905 	push	af
   75AA 33            [ 6] 2906 	inc	sp
   75AB 2A 0E 65      [16] 2907 	ld	hl,(_mapa)
   75AE E5            [11] 2908 	push	hl
   75AF CD 61 4B      [17] 2909 	call	_getTilePtr
   75B2 F1            [10] 2910 	pop	af
   75B3 F1            [10] 2911 	pop	af
   75B4 4E            [ 7] 2912 	ld	c,(hl)
   75B5 3E 02         [ 7] 2913 	ld	a,#0x02
   75B7 91            [ 4] 2914 	sub	a, c
   75B8 DA 54 76      [10] 2915 	jp	C,00161$
                           2916 ;src/main.c:513: moverEnemigoArriba(enemy);
   75BB DD 6E F1      [19] 2917 	ld	l,-15 (ix)
   75BE DD 66 F2      [19] 2918 	ld	h,-14 (ix)
   75C1 E5            [11] 2919 	push	hl
   75C2 CD 65 6B      [17] 2920 	call	_moverEnemigoArriba
   75C5 F1            [10] 2921 	pop	af
                           2922 ;src/main.c:514: movY = 1;
   75C6 DD 36 EF 01   [19] 2923 	ld	-17 (ix),#0x01
                           2924 ;src/main.c:515: enemy->mover = SI;
   75CA DD 6E F5      [19] 2925 	ld	l,-11 (ix)
   75CD DD 66 F6      [19] 2926 	ld	h,-10 (ix)
   75D0 36 01         [10] 2927 	ld	(hl),#0x01
   75D2 C3 54 76      [10] 2928 	jp	00161$
   75D5                    2929 00160$:
                           2930 ;src/main.c:518: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75D5 DD 7E FE      [19] 2931 	ld	a,-2 (ix)
   75D8 C6 18         [ 7] 2932 	add	a, #0x18
   75DA 47            [ 4] 2933 	ld	b,a
   75DB C5            [11] 2934 	push	bc
   75DC 33            [ 6] 2935 	inc	sp
   75DD DD 7E FC      [19] 2936 	ld	a,-4 (ix)
   75E0 F5            [11] 2937 	push	af
   75E1 33            [ 6] 2938 	inc	sp
   75E2 2A 0E 65      [16] 2939 	ld	hl,(_mapa)
   75E5 E5            [11] 2940 	push	hl
   75E6 CD 61 4B      [17] 2941 	call	_getTilePtr
   75E9 F1            [10] 2942 	pop	af
   75EA F1            [10] 2943 	pop	af
   75EB 4E            [ 7] 2944 	ld	c,(hl)
   75EC 3E 02         [ 7] 2945 	ld	a,#0x02
   75EE 91            [ 4] 2946 	sub	a, c
   75EF 38 63         [12] 2947 	jr	C,00161$
                           2948 ;src/main.c:519: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   75F1 DD 6E F3      [19] 2949 	ld	l,-13 (ix)
   75F4 DD 66 F4      [19] 2950 	ld	h,-12 (ix)
   75F7 7E            [ 7] 2951 	ld	a,(hl)
   75F8 C6 18         [ 7] 2952 	add	a, #0x18
   75FA 57            [ 4] 2953 	ld	d,a
   75FB DD 6E F1      [19] 2954 	ld	l,-15 (ix)
   75FE DD 66 F2      [19] 2955 	ld	h,-14 (ix)
   7601 46            [ 7] 2956 	ld	b,(hl)
   7602 04            [ 4] 2957 	inc	b
   7603 04            [ 4] 2958 	inc	b
   7604 D5            [11] 2959 	push	de
   7605 33            [ 6] 2960 	inc	sp
   7606 C5            [11] 2961 	push	bc
   7607 33            [ 6] 2962 	inc	sp
   7608 2A 0E 65      [16] 2963 	ld	hl,(_mapa)
   760B E5            [11] 2964 	push	hl
   760C CD 61 4B      [17] 2965 	call	_getTilePtr
   760F F1            [10] 2966 	pop	af
   7610 F1            [10] 2967 	pop	af
   7611 4E            [ 7] 2968 	ld	c,(hl)
   7612 3E 02         [ 7] 2969 	ld	a,#0x02
   7614 91            [ 4] 2970 	sub	a, c
   7615 38 3D         [12] 2971 	jr	C,00161$
                           2972 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7617 DD 6E F3      [19] 2973 	ld	l,-13 (ix)
   761A DD 66 F4      [19] 2974 	ld	h,-12 (ix)
   761D 7E            [ 7] 2975 	ld	a,(hl)
   761E C6 18         [ 7] 2976 	add	a, #0x18
   7620 47            [ 4] 2977 	ld	b,a
   7621 DD 6E F1      [19] 2978 	ld	l,-15 (ix)
   7624 DD 66 F2      [19] 2979 	ld	h,-14 (ix)
   7627 7E            [ 7] 2980 	ld	a,(hl)
   7628 C6 04         [ 7] 2981 	add	a, #0x04
   762A C5            [11] 2982 	push	bc
   762B 33            [ 6] 2983 	inc	sp
   762C F5            [11] 2984 	push	af
   762D 33            [ 6] 2985 	inc	sp
   762E 2A 0E 65      [16] 2986 	ld	hl,(_mapa)
   7631 E5            [11] 2987 	push	hl
   7632 CD 61 4B      [17] 2988 	call	_getTilePtr
   7635 F1            [10] 2989 	pop	af
   7636 F1            [10] 2990 	pop	af
   7637 4E            [ 7] 2991 	ld	c,(hl)
   7638 3E 02         [ 7] 2992 	ld	a,#0x02
   763A 91            [ 4] 2993 	sub	a, c
   763B 38 17         [12] 2994 	jr	C,00161$
                           2995 ;src/main.c:521: moverEnemigoAbajo(enemy);
   763D DD 6E F1      [19] 2996 	ld	l,-15 (ix)
   7640 DD 66 F2      [19] 2997 	ld	h,-14 (ix)
   7643 E5            [11] 2998 	push	hl
   7644 CD 84 6B      [17] 2999 	call	_moverEnemigoAbajo
   7647 F1            [10] 3000 	pop	af
                           3001 ;src/main.c:522: movY = 1;
   7648 DD 36 EF 01   [19] 3002 	ld	-17 (ix),#0x01
                           3003 ;src/main.c:523: enemy->mover = SI;
   764C DD 6E F5      [19] 3004 	ld	l,-11 (ix)
   764F DD 66 F6      [19] 3005 	ld	h,-10 (ix)
   7652 36 01         [10] 3006 	ld	(hl),#0x01
   7654                    3007 00161$:
                           3008 ;src/main.c:526: if (!enemy->mover) {
   7654 DD 6E F5      [19] 3009 	ld	l,-11 (ix)
   7657 DD 66 F6      [19] 3010 	ld	h,-10 (ix)
   765A 7E            [ 7] 3011 	ld	a,(hl)
   765B B7            [ 4] 3012 	or	a, a
   765C C2 1F 79      [10] 3013 	jp	NZ,00206$
                           3014 ;src/main.c:527: if (!movX) {
   765F DD 7E ED      [19] 3015 	ld	a,-19 (ix)
   7662 B7            [ 4] 3016 	or	a, a
   7663 C2 8C 77      [10] 3017 	jp	NZ,00176$
                           3018 ;src/main.c:528: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7666 DD 6E F3      [19] 3019 	ld	l,-13 (ix)
   7669 DD 66 F4      [19] 3020 	ld	h,-12 (ix)
   766C 5E            [ 7] 3021 	ld	e,(hl)
                           3022 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   766D DD 6E F1      [19] 3023 	ld	l,-15 (ix)
   7670 DD 66 F2      [19] 3024 	ld	h,-14 (ix)
   7673 4E            [ 7] 3025 	ld	c,(hl)
                           3026 ;src/main.c:528: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7674 3E 70         [ 7] 3027 	ld	a,#0x70
   7676 93            [ 4] 3028 	sub	a, e
   7677 D2 07 77      [10] 3029 	jp	NC,00173$
                           3030 ;src/main.c:529: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   767A 7B            [ 4] 3031 	ld	a,e
   767B C6 18         [ 7] 3032 	add	a, #0x18
   767D 47            [ 4] 3033 	ld	b,a
   767E C5            [11] 3034 	push	bc
   767F 2A 0E 65      [16] 3035 	ld	hl,(_mapa)
   7682 E5            [11] 3036 	push	hl
   7683 CD 61 4B      [17] 3037 	call	_getTilePtr
   7686 F1            [10] 3038 	pop	af
   7687 F1            [10] 3039 	pop	af
   7688 4E            [ 7] 3040 	ld	c,(hl)
   7689 3E 02         [ 7] 3041 	ld	a,#0x02
   768B 91            [ 4] 3042 	sub	a, c
   768C 38 63         [12] 3043 	jr	C,00163$
                           3044 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   768E DD 6E F3      [19] 3045 	ld	l,-13 (ix)
   7691 DD 66 F4      [19] 3046 	ld	h,-12 (ix)
   7694 7E            [ 7] 3047 	ld	a,(hl)
   7695 C6 18         [ 7] 3048 	add	a, #0x18
   7697 57            [ 4] 3049 	ld	d,a
   7698 DD 6E F1      [19] 3050 	ld	l,-15 (ix)
   769B DD 66 F2      [19] 3051 	ld	h,-14 (ix)
   769E 4E            [ 7] 3052 	ld	c,(hl)
   769F 41            [ 4] 3053 	ld	b,c
   76A0 04            [ 4] 3054 	inc	b
   76A1 04            [ 4] 3055 	inc	b
   76A2 D5            [11] 3056 	push	de
   76A3 33            [ 6] 3057 	inc	sp
   76A4 C5            [11] 3058 	push	bc
   76A5 33            [ 6] 3059 	inc	sp
   76A6 2A 0E 65      [16] 3060 	ld	hl,(_mapa)
   76A9 E5            [11] 3061 	push	hl
   76AA CD 61 4B      [17] 3062 	call	_getTilePtr
   76AD F1            [10] 3063 	pop	af
   76AE F1            [10] 3064 	pop	af
   76AF 4E            [ 7] 3065 	ld	c,(hl)
   76B0 3E 02         [ 7] 3066 	ld	a,#0x02
   76B2 91            [ 4] 3067 	sub	a, c
   76B3 38 3C         [12] 3068 	jr	C,00163$
                           3069 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76B5 DD 6E F3      [19] 3070 	ld	l,-13 (ix)
   76B8 DD 66 F4      [19] 3071 	ld	h,-12 (ix)
   76BB 7E            [ 7] 3072 	ld	a,(hl)
   76BC C6 18         [ 7] 3073 	add	a, #0x18
   76BE 47            [ 4] 3074 	ld	b,a
   76BF DD 6E F1      [19] 3075 	ld	l,-15 (ix)
   76C2 DD 66 F2      [19] 3076 	ld	h,-14 (ix)
   76C5 7E            [ 7] 3077 	ld	a,(hl)
   76C6 C6 04         [ 7] 3078 	add	a, #0x04
   76C8 C5            [11] 3079 	push	bc
   76C9 33            [ 6] 3080 	inc	sp
   76CA F5            [11] 3081 	push	af
   76CB 33            [ 6] 3082 	inc	sp
   76CC 2A 0E 65      [16] 3083 	ld	hl,(_mapa)
   76CF E5            [11] 3084 	push	hl
   76D0 CD 61 4B      [17] 3085 	call	_getTilePtr
   76D3 F1            [10] 3086 	pop	af
   76D4 F1            [10] 3087 	pop	af
   76D5 4E            [ 7] 3088 	ld	c,(hl)
   76D6 3E 02         [ 7] 3089 	ld	a,#0x02
   76D8 91            [ 4] 3090 	sub	a, c
   76D9 38 16         [12] 3091 	jr	C,00163$
                           3092 ;src/main.c:532: moverEnemigoAbajo(enemy);
   76DB DD 6E F1      [19] 3093 	ld	l,-15 (ix)
   76DE DD 66 F2      [19] 3094 	ld	h,-14 (ix)
   76E1 E5            [11] 3095 	push	hl
   76E2 CD 84 6B      [17] 3096 	call	_moverEnemigoAbajo
   76E5 F1            [10] 3097 	pop	af
                           3098 ;src/main.c:533: enemy->mover = SI;
   76E6 DD 6E F5      [19] 3099 	ld	l,-11 (ix)
   76E9 DD 66 F6      [19] 3100 	ld	h,-10 (ix)
   76EC 36 01         [10] 3101 	ld	(hl),#0x01
   76EE C3 8C 77      [10] 3102 	jp	00176$
   76F1                    3103 00163$:
                           3104 ;src/main.c:535: moverEnemigoArriba(enemy);
   76F1 DD 6E F1      [19] 3105 	ld	l,-15 (ix)
   76F4 DD 66 F2      [19] 3106 	ld	h,-14 (ix)
   76F7 E5            [11] 3107 	push	hl
   76F8 CD 65 6B      [17] 3108 	call	_moverEnemigoArriba
   76FB F1            [10] 3109 	pop	af
                           3110 ;src/main.c:536: enemy->mover = SI;
   76FC DD 6E F5      [19] 3111 	ld	l,-11 (ix)
   76FF DD 66 F6      [19] 3112 	ld	h,-10 (ix)
   7702 36 01         [10] 3113 	ld	(hl),#0x01
   7704 C3 8C 77      [10] 3114 	jp	00176$
   7707                    3115 00173$:
                           3116 ;src/main.c:539: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7707 43            [ 4] 3117 	ld	b,e
   7708 05            [ 4] 3118 	dec	b
   7709 05            [ 4] 3119 	dec	b
   770A C5            [11] 3120 	push	bc
   770B 2A 0E 65      [16] 3121 	ld	hl,(_mapa)
   770E E5            [11] 3122 	push	hl
   770F CD 61 4B      [17] 3123 	call	_getTilePtr
   7712 F1            [10] 3124 	pop	af
   7713 F1            [10] 3125 	pop	af
   7714 4E            [ 7] 3126 	ld	c,(hl)
   7715 3E 02         [ 7] 3127 	ld	a,#0x02
   7717 91            [ 4] 3128 	sub	a, c
   7718 38 5F         [12] 3129 	jr	C,00168$
                           3130 ;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   771A DD 6E F3      [19] 3131 	ld	l,-13 (ix)
   771D DD 66 F4      [19] 3132 	ld	h,-12 (ix)
   7720 56            [ 7] 3133 	ld	d,(hl)
   7721 15            [ 4] 3134 	dec	d
   7722 15            [ 4] 3135 	dec	d
   7723 DD 6E F1      [19] 3136 	ld	l,-15 (ix)
   7726 DD 66 F2      [19] 3137 	ld	h,-14 (ix)
   7729 46            [ 7] 3138 	ld	b,(hl)
   772A 04            [ 4] 3139 	inc	b
   772B 04            [ 4] 3140 	inc	b
   772C D5            [11] 3141 	push	de
   772D 33            [ 6] 3142 	inc	sp
   772E C5            [11] 3143 	push	bc
   772F 33            [ 6] 3144 	inc	sp
   7730 2A 0E 65      [16] 3145 	ld	hl,(_mapa)
   7733 E5            [11] 3146 	push	hl
   7734 CD 61 4B      [17] 3147 	call	_getTilePtr
   7737 F1            [10] 3148 	pop	af
   7738 F1            [10] 3149 	pop	af
   7739 4E            [ 7] 3150 	ld	c,(hl)
   773A 3E 02         [ 7] 3151 	ld	a,#0x02
   773C 91            [ 4] 3152 	sub	a, c
   773D 38 3A         [12] 3153 	jr	C,00168$
                           3154 ;src/main.c:541: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   773F DD 6E F3      [19] 3155 	ld	l,-13 (ix)
   7742 DD 66 F4      [19] 3156 	ld	h,-12 (ix)
   7745 46            [ 7] 3157 	ld	b,(hl)
   7746 05            [ 4] 3158 	dec	b
   7747 05            [ 4] 3159 	dec	b
   7748 DD 6E F1      [19] 3160 	ld	l,-15 (ix)
   774B DD 66 F2      [19] 3161 	ld	h,-14 (ix)
   774E 7E            [ 7] 3162 	ld	a,(hl)
   774F C6 04         [ 7] 3163 	add	a, #0x04
   7751 C5            [11] 3164 	push	bc
   7752 33            [ 6] 3165 	inc	sp
   7753 F5            [11] 3166 	push	af
   7754 33            [ 6] 3167 	inc	sp
   7755 2A 0E 65      [16] 3168 	ld	hl,(_mapa)
   7758 E5            [11] 3169 	push	hl
   7759 CD 61 4B      [17] 3170 	call	_getTilePtr
   775C F1            [10] 3171 	pop	af
   775D F1            [10] 3172 	pop	af
   775E 4E            [ 7] 3173 	ld	c,(hl)
   775F 3E 02         [ 7] 3174 	ld	a,#0x02
   7761 91            [ 4] 3175 	sub	a, c
   7762 38 15         [12] 3176 	jr	C,00168$
                           3177 ;src/main.c:542: moverEnemigoArriba(enemy);
   7764 DD 6E F1      [19] 3178 	ld	l,-15 (ix)
   7767 DD 66 F2      [19] 3179 	ld	h,-14 (ix)
   776A E5            [11] 3180 	push	hl
   776B CD 65 6B      [17] 3181 	call	_moverEnemigoArriba
   776E F1            [10] 3182 	pop	af
                           3183 ;src/main.c:543: enemy->mover = SI;
   776F DD 6E F5      [19] 3184 	ld	l,-11 (ix)
   7772 DD 66 F6      [19] 3185 	ld	h,-10 (ix)
   7775 36 01         [10] 3186 	ld	(hl),#0x01
   7777 18 13         [12] 3187 	jr	00176$
   7779                    3188 00168$:
                           3189 ;src/main.c:545: moverEnemigoAbajo(enemy);
   7779 DD 6E F1      [19] 3190 	ld	l,-15 (ix)
   777C DD 66 F2      [19] 3191 	ld	h,-14 (ix)
   777F E5            [11] 3192 	push	hl
   7780 CD 84 6B      [17] 3193 	call	_moverEnemigoAbajo
   7783 F1            [10] 3194 	pop	af
                           3195 ;src/main.c:546: enemy->mover = SI;
   7784 DD 6E F5      [19] 3196 	ld	l,-11 (ix)
   7787 DD 66 F6      [19] 3197 	ld	h,-10 (ix)
   778A 36 01         [10] 3198 	ld	(hl),#0x01
   778C                    3199 00176$:
                           3200 ;src/main.c:551: if (!movY) {
   778C DD 7E EF      [19] 3201 	ld	a,-17 (ix)
   778F B7            [ 4] 3202 	or	a, a
   7790 C2 1F 79      [10] 3203 	jp	NZ,00206$
                           3204 ;src/main.c:552: if (enemy->x < ANCHO_PANTALLA/2) {
   7793 DD 6E F1      [19] 3205 	ld	l,-15 (ix)
   7796 DD 66 F2      [19] 3206 	ld	h,-14 (ix)
   7799 7E            [ 7] 3207 	ld	a,(hl)
   779A DD 77 FE      [19] 3208 	ld	-2 (ix),a
                           3209 ;src/main.c:423: u8 dify = abs(enemy->y - prota.y);
   779D DD 6E F3      [19] 3210 	ld	l,-13 (ix)
   77A0 DD 66 F4      [19] 3211 	ld	h,-12 (ix)
   77A3 7E            [ 7] 3212 	ld	a,(hl)
   77A4 DD 77 FC      [19] 3213 	ld	-4 (ix),a
                           3214 ;src/main.c:552: if (enemy->x < ANCHO_PANTALLA/2) {
   77A7 DD 7E FE      [19] 3215 	ld	a,-2 (ix)
   77AA D6 28         [ 7] 3216 	sub	a, #0x28
   77AC D2 74 78      [10] 3217 	jp	NC,00188$
                           3218 ;src/main.c:553: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   77AF DD 66 FC      [19] 3219 	ld	h,-4 (ix)
   77B2 DD 6E FE      [19] 3220 	ld	l,-2 (ix)
   77B5 E5            [11] 3221 	push	hl
   77B6 2A 0E 65      [16] 3222 	ld	hl,(_mapa)
   77B9 E5            [11] 3223 	push	hl
   77BA CD 61 4B      [17] 3224 	call	_getTilePtr
   77BD F1            [10] 3225 	pop	af
   77BE F1            [10] 3226 	pop	af
   77BF DD 74 FB      [19] 3227 	ld	-5 (ix),h
   77C2 DD 75 FA      [19] 3228 	ld	-6 (ix), l
   77C5 DD 66 FB      [19] 3229 	ld	h,-5 (ix)
   77C8 7E            [ 7] 3230 	ld	a,(hl)
   77C9 DD 77 FA      [19] 3231 	ld	-6 (ix),a
   77CC 3E 02         [ 7] 3232 	ld	a,#0x02
   77CE DD 96 FA      [19] 3233 	sub	a, -6 (ix)
   77D1 DA 5E 78      [10] 3234 	jp	C,00178$
                           3235 ;src/main.c:554: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   77D4 DD 6E F3      [19] 3236 	ld	l,-13 (ix)
   77D7 DD 66 F4      [19] 3237 	ld	h,-12 (ix)
   77DA 7E            [ 7] 3238 	ld	a,(hl)
   77DB C6 0B         [ 7] 3239 	add	a, #0x0B
   77DD DD 77 FA      [19] 3240 	ld	-6 (ix),a
   77E0 DD 6E F1      [19] 3241 	ld	l,-15 (ix)
   77E3 DD 66 F2      [19] 3242 	ld	h,-14 (ix)
   77E6 7E            [ 7] 3243 	ld	a,(hl)
   77E7 DD 77 F9      [19] 3244 	ld	-7 (ix),a
   77EA DD 66 FA      [19] 3245 	ld	h,-6 (ix)
   77ED DD 6E F9      [19] 3246 	ld	l,-7 (ix)
   77F0 E5            [11] 3247 	push	hl
   77F1 2A 0E 65      [16] 3248 	ld	hl,(_mapa)
   77F4 E5            [11] 3249 	push	hl
   77F5 CD 61 4B      [17] 3250 	call	_getTilePtr
   77F8 F1            [10] 3251 	pop	af
   77F9 F1            [10] 3252 	pop	af
   77FA DD 74 FB      [19] 3253 	ld	-5 (ix),h
   77FD DD 75 FA      [19] 3254 	ld	-6 (ix), l
   7800 DD 66 FB      [19] 3255 	ld	h,-5 (ix)
   7803 7E            [ 7] 3256 	ld	a,(hl)
   7804 DD 77 FA      [19] 3257 	ld	-6 (ix),a
   7807 3E 02         [ 7] 3258 	ld	a,#0x02
   7809 DD 96 FA      [19] 3259 	sub	a, -6 (ix)
   780C 38 50         [12] 3260 	jr	C,00178$
                           3261 ;src/main.c:555: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   780E DD 6E F3      [19] 3262 	ld	l,-13 (ix)
   7811 DD 66 F4      [19] 3263 	ld	h,-12 (ix)
   7814 7E            [ 7] 3264 	ld	a,(hl)
   7815 C6 16         [ 7] 3265 	add	a, #0x16
   7817 DD 77 FA      [19] 3266 	ld	-6 (ix),a
   781A DD 6E F1      [19] 3267 	ld	l,-15 (ix)
   781D DD 66 F2      [19] 3268 	ld	h,-14 (ix)
   7820 7E            [ 7] 3269 	ld	a,(hl)
   7821 DD 77 F9      [19] 3270 	ld	-7 (ix),a
   7824 DD 66 FA      [19] 3271 	ld	h,-6 (ix)
   7827 DD 6E F9      [19] 3272 	ld	l,-7 (ix)
   782A E5            [11] 3273 	push	hl
   782B 2A 0E 65      [16] 3274 	ld	hl,(_mapa)
   782E E5            [11] 3275 	push	hl
   782F CD 61 4B      [17] 3276 	call	_getTilePtr
   7832 F1            [10] 3277 	pop	af
   7833 F1            [10] 3278 	pop	af
   7834 DD 74 FB      [19] 3279 	ld	-5 (ix),h
   7837 DD 75 FA      [19] 3280 	ld	-6 (ix), l
   783A DD 66 FB      [19] 3281 	ld	h,-5 (ix)
   783D 7E            [ 7] 3282 	ld	a,(hl)
   783E DD 77 FA      [19] 3283 	ld	-6 (ix),a
   7841 3E 02         [ 7] 3284 	ld	a,#0x02
   7843 DD 96 FA      [19] 3285 	sub	a, -6 (ix)
   7846 38 16         [12] 3286 	jr	C,00178$
                           3287 ;src/main.c:556: moverEnemigoIzquierda(enemy);
   7848 DD 6E F1      [19] 3288 	ld	l,-15 (ix)
   784B DD 66 F2      [19] 3289 	ld	h,-14 (ix)
   784E E5            [11] 3290 	push	hl
   784F CD B3 6B      [17] 3291 	call	_moverEnemigoIzquierda
   7852 F1            [10] 3292 	pop	af
                           3293 ;src/main.c:557: enemy->mover = SI;
   7853 DD 6E F5      [19] 3294 	ld	l,-11 (ix)
   7856 DD 66 F6      [19] 3295 	ld	h,-10 (ix)
   7859 36 01         [10] 3296 	ld	(hl),#0x01
   785B C3 1F 79      [10] 3297 	jp	00206$
   785E                    3298 00178$:
                           3299 ;src/main.c:559: moverEnemigoDerecha(enemy);
   785E DD 6E F1      [19] 3300 	ld	l,-15 (ix)
   7861 DD 66 F2      [19] 3301 	ld	h,-14 (ix)
   7864 E5            [11] 3302 	push	hl
   7865 CD A3 6B      [17] 3303 	call	_moverEnemigoDerecha
   7868 F1            [10] 3304 	pop	af
                           3305 ;src/main.c:560: enemy->mover = SI;
   7869 DD 6E F5      [19] 3306 	ld	l,-11 (ix)
   786C DD 66 F6      [19] 3307 	ld	h,-10 (ix)
   786F 36 01         [10] 3308 	ld	(hl),#0x01
   7871 C3 1F 79      [10] 3309 	jp	00206$
   7874                    3310 00188$:
                           3311 ;src/main.c:563: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7874 DD 7E FE      [19] 3312 	ld	a,-2 (ix)
   7877 C6 04         [ 7] 3313 	add	a, #0x04
   7879 DD 77 FE      [19] 3314 	ld	-2 (ix),a
   787C DD 66 FC      [19] 3315 	ld	h,-4 (ix)
   787F DD 6E FE      [19] 3316 	ld	l,-2 (ix)
   7882 E5            [11] 3317 	push	hl
   7883 2A 0E 65      [16] 3318 	ld	hl,(_mapa)
   7886 E5            [11] 3319 	push	hl
   7887 CD 61 4B      [17] 3320 	call	_getTilePtr
   788A F1            [10] 3321 	pop	af
   788B F1            [10] 3322 	pop	af
   788C DD 74 FF      [19] 3323 	ld	-1 (ix),h
   788F DD 75 FE      [19] 3324 	ld	-2 (ix), l
   7892 DD 66 FF      [19] 3325 	ld	h,-1 (ix)
   7895 7E            [ 7] 3326 	ld	a,(hl)
   7896 DD 77 FE      [19] 3327 	ld	-2 (ix),a
   7899 3E 02         [ 7] 3328 	ld	a,#0x02
   789B DD 96 FE      [19] 3329 	sub	a, -2 (ix)
   789E 38 6C         [12] 3330 	jr	C,00183$
                           3331 ;src/main.c:564: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78A0 DD 6E F3      [19] 3332 	ld	l,-13 (ix)
   78A3 DD 66 F4      [19] 3333 	ld	h,-12 (ix)
   78A6 7E            [ 7] 3334 	ld	a,(hl)
   78A7 C6 0B         [ 7] 3335 	add	a, #0x0B
   78A9 DD 77 FE      [19] 3336 	ld	-2 (ix),a
   78AC DD 6E F1      [19] 3337 	ld	l,-15 (ix)
   78AF DD 66 F2      [19] 3338 	ld	h,-14 (ix)
   78B2 7E            [ 7] 3339 	ld	a,(hl)
   78B3 DD 77 FC      [19] 3340 	ld	-4 (ix), a
   78B6 C6 04         [ 7] 3341 	add	a, #0x04
   78B8 DD 77 FC      [19] 3342 	ld	-4 (ix),a
   78BB DD 66 FE      [19] 3343 	ld	h,-2 (ix)
   78BE DD 6E FC      [19] 3344 	ld	l,-4 (ix)
   78C1 E5            [11] 3345 	push	hl
   78C2 2A 0E 65      [16] 3346 	ld	hl,(_mapa)
   78C5 E5            [11] 3347 	push	hl
   78C6 CD 61 4B      [17] 3348 	call	_getTilePtr
   78C9 F1            [10] 3349 	pop	af
   78CA F1            [10] 3350 	pop	af
   78CB 4E            [ 7] 3351 	ld	c,(hl)
   78CC 3E 02         [ 7] 3352 	ld	a,#0x02
   78CE 91            [ 4] 3353 	sub	a, c
   78CF 38 3B         [12] 3354 	jr	C,00183$
                           3355 ;src/main.c:565: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78D1 DD 6E F3      [19] 3356 	ld	l,-13 (ix)
   78D4 DD 66 F4      [19] 3357 	ld	h,-12 (ix)
   78D7 7E            [ 7] 3358 	ld	a,(hl)
   78D8 C6 16         [ 7] 3359 	add	a, #0x16
   78DA 4F            [ 4] 3360 	ld	c,a
   78DB DD 6E F1      [19] 3361 	ld	l,-15 (ix)
   78DE DD 66 F2      [19] 3362 	ld	h,-14 (ix)
   78E1 5E            [ 7] 3363 	ld	e,(hl)
   78E2 1C            [ 4] 3364 	inc	e
   78E3 1C            [ 4] 3365 	inc	e
   78E4 1C            [ 4] 3366 	inc	e
   78E5 1C            [ 4] 3367 	inc	e
   78E6 51            [ 4] 3368 	ld	d, c
   78E7 D5            [11] 3369 	push	de
   78E8 2A 0E 65      [16] 3370 	ld	hl,(_mapa)
   78EB E5            [11] 3371 	push	hl
   78EC CD 61 4B      [17] 3372 	call	_getTilePtr
   78EF F1            [10] 3373 	pop	af
   78F0 F1            [10] 3374 	pop	af
   78F1 4E            [ 7] 3375 	ld	c,(hl)
   78F2 3E 02         [ 7] 3376 	ld	a,#0x02
   78F4 91            [ 4] 3377 	sub	a, c
   78F5 38 15         [12] 3378 	jr	C,00183$
                           3379 ;src/main.c:566: moverEnemigoDerecha(enemy);
   78F7 DD 6E F1      [19] 3380 	ld	l,-15 (ix)
   78FA DD 66 F2      [19] 3381 	ld	h,-14 (ix)
   78FD E5            [11] 3382 	push	hl
   78FE CD A3 6B      [17] 3383 	call	_moverEnemigoDerecha
   7901 F1            [10] 3384 	pop	af
                           3385 ;src/main.c:567: enemy->mover = SI;
   7902 DD 6E F5      [19] 3386 	ld	l,-11 (ix)
   7905 DD 66 F6      [19] 3387 	ld	h,-10 (ix)
   7908 36 01         [10] 3388 	ld	(hl),#0x01
   790A 18 13         [12] 3389 	jr	00206$
   790C                    3390 00183$:
                           3391 ;src/main.c:570: moverEnemigoIzquierda(enemy);
   790C DD 6E F1      [19] 3392 	ld	l,-15 (ix)
   790F DD 66 F2      [19] 3393 	ld	h,-14 (ix)
   7912 E5            [11] 3394 	push	hl
   7913 CD B3 6B      [17] 3395 	call	_moverEnemigoIzquierda
   7916 F1            [10] 3396 	pop	af
                           3397 ;src/main.c:571: enemy->mover = SI;
   7917 DD 6E F5      [19] 3398 	ld	l,-11 (ix)
   791A DD 66 F6      [19] 3399 	ld	h,-10 (ix)
   791D 36 01         [10] 3400 	ld	(hl),#0x01
   791F                    3401 00206$:
   791F DD F9         [10] 3402 	ld	sp, ix
   7921 DD E1         [14] 3403 	pop	ix
   7923 C9            [10] 3404 	ret
                           3405 ;src/main.c:581: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3406 ;	---------------------------------
                           3407 ; Function updateEnemy
                           3408 ; ---------------------------------
   7924                    3409 _updateEnemy::
   7924 DD E5         [15] 3410 	push	ix
   7926 DD 21 00 00   [14] 3411 	ld	ix,#0
   792A DD 39         [15] 3412 	add	ix,sp
   792C 21 F4 FF      [10] 3413 	ld	hl,#-12
   792F 39            [11] 3414 	add	hl,sp
   7930 F9            [ 6] 3415 	ld	sp,hl
                           3416 ;src/main.c:588: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7931 DD 4E 04      [19] 3417 	ld	c,4 (ix)
   7934 DD 46 05      [19] 3418 	ld	b,5 (ix)
   7937 21 16 00      [10] 3419 	ld	hl,#0x0016
   793A 09            [11] 3420 	add	hl,bc
   793B DD 75 FC      [19] 3421 	ld	-4 (ix),l
   793E DD 74 FD      [19] 3422 	ld	-3 (ix),h
   7941 DD 6E FC      [19] 3423 	ld	l,-4 (ix)
   7944 DD 66 FD      [19] 3424 	ld	h,-3 (ix)
   7947 7E            [ 7] 3425 	ld	a,(hl)
   7948 B7            [ 4] 3426 	or	a, a
   7949 28 19         [12] 3427 	jr	Z,00115$
                           3428 ;src/main.c:589: enemy->patrolling = 0;
   794B 21 B4 60      [10] 3429 	ld	hl,#(_enemy + 0x000b)
   794E 36 00         [10] 3430 	ld	(hl),#0x00
                           3431 ;src/main.c:590: engage(actual, prota.x, prota.y);
   7950 3A 32 64      [13] 3432 	ld	a, (#_prota + 1)
   7953 21 31 64      [10] 3433 	ld	hl, #_prota + 0
   7956 56            [ 7] 3434 	ld	d,(hl)
   7957 F5            [11] 3435 	push	af
   7958 33            [ 6] 3436 	inc	sp
   7959 D5            [11] 3437 	push	de
   795A 33            [ 6] 3438 	inc	sp
   795B C5            [11] 3439 	push	bc
   795C CD A0 70      [17] 3440 	call	_engage
   795F F1            [10] 3441 	pop	af
   7960 F1            [10] 3442 	pop	af
   7961 C3 8C 7A      [10] 3443 	jp	00117$
   7964                    3444 00115$:
                           3445 ;src/main.c:592: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7964 C5            [11] 3446 	push	bc
   7965 C5            [11] 3447 	push	bc
   7966 CD FD 6D      [17] 3448 	call	_lookFor
   7969 F1            [10] 3449 	pop	af
   796A C1            [10] 3450 	pop	bc
                           3451 ;src/main.c:598: actual->patrolling = 0;
   796B 21 0B 00      [10] 3452 	ld	hl,#0x000B
   796E 09            [11] 3453 	add	hl,bc
   796F DD 75 FA      [19] 3454 	ld	-6 (ix),l
   7972 DD 74 FB      [19] 3455 	ld	-5 (ix),h
                           3456 ;src/main.c:593: if (actual->patrolling) {
   7975 DD 6E FA      [19] 3457 	ld	l,-6 (ix)
   7978 DD 66 FB      [19] 3458 	ld	h,-5 (ix)
   797B 6E            [ 7] 3459 	ld	l,(hl)
                           3460 ;src/main.c:596: if (actual->in_range) {
   797C 79            [ 4] 3461 	ld	a,c
   797D C6 11         [ 7] 3462 	add	a, #0x11
   797F 5F            [ 4] 3463 	ld	e,a
   7980 78            [ 4] 3464 	ld	a,b
   7981 CE 00         [ 7] 3465 	adc	a, #0x00
   7983 57            [ 4] 3466 	ld	d,a
                           3467 ;src/main.c:604: actual->seek = 1;
   7984 79            [ 4] 3468 	ld	a,c
   7985 C6 14         [ 7] 3469 	add	a, #0x14
   7987 DD 77 F6      [19] 3470 	ld	-10 (ix),a
   798A 78            [ 4] 3471 	ld	a,b
   798B CE 00         [ 7] 3472 	adc	a, #0x00
   798D DD 77 F7      [19] 3473 	ld	-9 (ix),a
                           3474 ;src/main.c:593: if (actual->patrolling) {
   7990 7D            [ 4] 3475 	ld	a,l
   7991 B7            [ 4] 3476 	or	a, a
   7992 CA 54 7A      [10] 3477 	jp	Z,00112$
                           3478 ;src/main.c:595: moverEnemigoPatrol(actual);
   7995 C5            [11] 3479 	push	bc
   7996 D5            [11] 3480 	push	de
   7997 C5            [11] 3481 	push	bc
   7998 CD C5 6B      [17] 3482 	call	_moverEnemigoPatrol
   799B F1            [10] 3483 	pop	af
   799C D1            [10] 3484 	pop	de
   799D C1            [10] 3485 	pop	bc
                           3486 ;src/main.c:596: if (actual->in_range) {
   799E 1A            [ 7] 3487 	ld	a,(de)
   799F B7            [ 4] 3488 	or	a, a
   79A0 28 24         [12] 3489 	jr	Z,00104$
                           3490 ;src/main.c:597: engage(actual, prota.x, prota.y);
   79A2 3A 32 64      [13] 3491 	ld	a, (#_prota + 1)
   79A5 21 31 64      [10] 3492 	ld	hl, #_prota + 0
   79A8 56            [ 7] 3493 	ld	d,(hl)
   79A9 F5            [11] 3494 	push	af
   79AA 33            [ 6] 3495 	inc	sp
   79AB D5            [11] 3496 	push	de
   79AC 33            [ 6] 3497 	inc	sp
   79AD C5            [11] 3498 	push	bc
   79AE CD A0 70      [17] 3499 	call	_engage
   79B1 F1            [10] 3500 	pop	af
   79B2 F1            [10] 3501 	pop	af
                           3502 ;src/main.c:598: actual->patrolling = 0;
   79B3 DD 6E FA      [19] 3503 	ld	l,-6 (ix)
   79B6 DD 66 FB      [19] 3504 	ld	h,-5 (ix)
   79B9 36 00         [10] 3505 	ld	(hl),#0x00
                           3506 ;src/main.c:599: actual->engage = 1;
   79BB DD 6E FC      [19] 3507 	ld	l,-4 (ix)
   79BE DD 66 FD      [19] 3508 	ld	h,-3 (ix)
   79C1 36 01         [10] 3509 	ld	(hl),#0x01
   79C3 C3 8C 7A      [10] 3510 	jp	00117$
   79C6                    3511 00104$:
                           3512 ;src/main.c:600: } else if (actual->seen) {
   79C6 21 12 00      [10] 3513 	ld	hl,#0x0012
   79C9 09            [11] 3514 	add	hl,bc
   79CA DD 75 F8      [19] 3515 	ld	-8 (ix),l
   79CD DD 74 F9      [19] 3516 	ld	-7 (ix),h
   79D0 DD 6E F8      [19] 3517 	ld	l,-8 (ix)
   79D3 DD 66 F9      [19] 3518 	ld	h,-7 (ix)
   79D6 7E            [ 7] 3519 	ld	a,(hl)
   79D7 B7            [ 4] 3520 	or	a, a
   79D8 CA 8C 7A      [10] 3521 	jp	Z,00117$
                           3522 ;src/main.c:601: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79DB 3A 32 64      [13] 3523 	ld	a,(#_prota + 1)
   79DE DD 77 F4      [19] 3524 	ld	-12 (ix),a
   79E1 21 31 64      [10] 3525 	ld	hl, #_prota + 0
   79E4 5E            [ 7] 3526 	ld	e,(hl)
   79E5 21 01 00      [10] 3527 	ld	hl,#0x0001
   79E8 09            [11] 3528 	add	hl,bc
   79E9 DD 75 FE      [19] 3529 	ld	-2 (ix),l
   79EC DD 74 FF      [19] 3530 	ld	-1 (ix),h
   79EF DD 6E FE      [19] 3531 	ld	l,-2 (ix)
   79F2 DD 66 FF      [19] 3532 	ld	h,-1 (ix)
   79F5 56            [ 7] 3533 	ld	d,(hl)
   79F6 0A            [ 7] 3534 	ld	a,(bc)
   79F7 DD 77 F5      [19] 3535 	ld	-11 (ix),a
   79FA C5            [11] 3536 	push	bc
   79FB 2A 0E 65      [16] 3537 	ld	hl,(_mapa)
   79FE E5            [11] 3538 	push	hl
   79FF C5            [11] 3539 	push	bc
   7A00 DD 7E F4      [19] 3540 	ld	a,-12 (ix)
   7A03 F5            [11] 3541 	push	af
   7A04 33            [ 6] 3542 	inc	sp
   7A05 7B            [ 4] 3543 	ld	a,e
   7A06 F5            [11] 3544 	push	af
   7A07 33            [ 6] 3545 	inc	sp
   7A08 D5            [11] 3546 	push	de
   7A09 33            [ 6] 3547 	inc	sp
   7A0A DD 7E F5      [19] 3548 	ld	a,-11 (ix)
   7A0D F5            [11] 3549 	push	af
   7A0E 33            [ 6] 3550 	inc	sp
   7A0F CD 30 44      [17] 3551 	call	_pathFinding
   7A12 21 08 00      [10] 3552 	ld	hl,#8
   7A15 39            [11] 3553 	add	hl,sp
   7A16 F9            [ 6] 3554 	ld	sp,hl
   7A17 C1            [10] 3555 	pop	bc
                           3556 ;src/main.c:602: actual->p_seek_x = actual->x;
   7A18 21 17 00      [10] 3557 	ld	hl,#0x0017
   7A1B 09            [11] 3558 	add	hl,bc
   7A1C EB            [ 4] 3559 	ex	de,hl
   7A1D 0A            [ 7] 3560 	ld	a,(bc)
   7A1E 12            [ 7] 3561 	ld	(de),a
                           3562 ;src/main.c:603: actual->p_seek_y = actual->y;
   7A1F 21 18 00      [10] 3563 	ld	hl,#0x0018
   7A22 09            [11] 3564 	add	hl,bc
   7A23 EB            [ 4] 3565 	ex	de,hl
   7A24 DD 6E FE      [19] 3566 	ld	l,-2 (ix)
   7A27 DD 66 FF      [19] 3567 	ld	h,-1 (ix)
   7A2A 7E            [ 7] 3568 	ld	a,(hl)
   7A2B 12            [ 7] 3569 	ld	(de),a
                           3570 ;src/main.c:604: actual->seek = 1;
   7A2C DD 6E F6      [19] 3571 	ld	l,-10 (ix)
   7A2F DD 66 F7      [19] 3572 	ld	h,-9 (ix)
   7A32 36 01         [10] 3573 	ld	(hl),#0x01
                           3574 ;src/main.c:605: actual->iter=0;
   7A34 21 0E 00      [10] 3575 	ld	hl,#0x000E
   7A37 09            [11] 3576 	add	hl,bc
   7A38 AF            [ 4] 3577 	xor	a, a
   7A39 77            [ 7] 3578 	ld	(hl), a
   7A3A 23            [ 6] 3579 	inc	hl
   7A3B 77            [ 7] 3580 	ld	(hl), a
                           3581 ;src/main.c:606: actual->reversePatrol = NO;
   7A3C 21 0C 00      [10] 3582 	ld	hl,#0x000C
   7A3F 09            [11] 3583 	add	hl,bc
   7A40 36 00         [10] 3584 	ld	(hl),#0x00
                           3585 ;src/main.c:607: actual->patrolling = 0;
   7A42 DD 6E FA      [19] 3586 	ld	l,-6 (ix)
   7A45 DD 66 FB      [19] 3587 	ld	h,-5 (ix)
   7A48 36 00         [10] 3588 	ld	(hl),#0x00
                           3589 ;src/main.c:608: actual->seen = 0;
   7A4A DD 6E F8      [19] 3590 	ld	l,-8 (ix)
   7A4D DD 66 F9      [19] 3591 	ld	h,-7 (ix)
   7A50 36 00         [10] 3592 	ld	(hl),#0x00
   7A52 18 38         [12] 3593 	jr	00117$
   7A54                    3594 00112$:
                           3595 ;src/main.c:610: } else if (actual->seek) {
   7A54 DD 6E F6      [19] 3596 	ld	l,-10 (ix)
   7A57 DD 66 F7      [19] 3597 	ld	h,-9 (ix)
   7A5A 7E            [ 7] 3598 	ld	a,(hl)
   7A5B B7            [ 4] 3599 	or	a, a
   7A5C 28 2E         [12] 3600 	jr	Z,00117$
                           3601 ;src/main.c:611: moverEnemigoSeek(actual);
   7A5E C5            [11] 3602 	push	bc
   7A5F D5            [11] 3603 	push	de
   7A60 C5            [11] 3604 	push	bc
   7A61 CD 03 6F      [17] 3605 	call	_moverEnemigoSeek
   7A64 F1            [10] 3606 	pop	af
   7A65 D1            [10] 3607 	pop	de
   7A66 C1            [10] 3608 	pop	bc
                           3609 ;src/main.c:612: if (actual->in_range) {
   7A67 1A            [ 7] 3610 	ld	a,(de)
   7A68 B7            [ 4] 3611 	or	a, a
   7A69 28 21         [12] 3612 	jr	Z,00117$
                           3613 ;src/main.c:613: engage(actual, prota.x, prota.y);
   7A6B 3A 32 64      [13] 3614 	ld	a, (#_prota + 1)
   7A6E 21 31 64      [10] 3615 	ld	hl, #_prota + 0
   7A71 56            [ 7] 3616 	ld	d,(hl)
   7A72 F5            [11] 3617 	push	af
   7A73 33            [ 6] 3618 	inc	sp
   7A74 D5            [11] 3619 	push	de
   7A75 33            [ 6] 3620 	inc	sp
   7A76 C5            [11] 3621 	push	bc
   7A77 CD A0 70      [17] 3622 	call	_engage
   7A7A F1            [10] 3623 	pop	af
   7A7B F1            [10] 3624 	pop	af
                           3625 ;src/main.c:614: actual->seek = 0;
   7A7C DD 6E F6      [19] 3626 	ld	l,-10 (ix)
   7A7F DD 66 F7      [19] 3627 	ld	h,-9 (ix)
   7A82 36 00         [10] 3628 	ld	(hl),#0x00
                           3629 ;src/main.c:615: actual->engage = 1;
   7A84 DD 6E FC      [19] 3630 	ld	l,-4 (ix)
   7A87 DD 66 FD      [19] 3631 	ld	h,-3 (ix)
   7A8A 36 01         [10] 3632 	ld	(hl),#0x01
                           3633 ;src/main.c:616: } else if (actual->seen) {
   7A8C                    3634 00117$:
   7A8C DD F9         [10] 3635 	ld	sp, ix
   7A8E DD E1         [14] 3636 	pop	ix
   7A90 C9            [10] 3637 	ret
                           3638 ;src/main.c:623: void inicializarEnemy() {
                           3639 ;	---------------------------------
                           3640 ; Function inicializarEnemy
                           3641 ; ---------------------------------
   7A91                    3642 _inicializarEnemy::
   7A91 DD E5         [15] 3643 	push	ix
   7A93 DD 21 00 00   [14] 3644 	ld	ix,#0
   7A97 DD 39         [15] 3645 	add	ix,sp
   7A99 21 F9 FF      [10] 3646 	ld	hl,#-7
   7A9C 39            [11] 3647 	add	hl,sp
   7A9D F9            [ 6] 3648 	ld	sp,hl
                           3649 ;src/main.c:624: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7A9E 3A 10 65      [13] 3650 	ld	a,(#_num_mapa + 0)
   7AA1 C6 02         [ 7] 3651 	add	a, #0x02
   7AA3 DD 77 FB      [19] 3652 	ld	-5 (ix),a
                           3653 ;src/main.c:634: actual = enemy;
   7AA6 11 A9 60      [10] 3654 	ld	de,#_enemy+0
                           3655 ;src/main.c:635: while(i){
   7AA9                    3656 00101$:
   7AA9 DD 7E FB      [19] 3657 	ld	a,-5 (ix)
   7AAC B7            [ 4] 3658 	or	a, a
   7AAD CA 9D 7B      [10] 3659 	jp	Z,00104$
                           3660 ;src/main.c:636: --i;
   7AB0 DD 35 FB      [23] 3661 	dec	-5 (ix)
                           3662 ;src/main.c:637: actual->x = actual->px = spawnX[i];
   7AB3 4B            [ 4] 3663 	ld	c, e
   7AB4 42            [ 4] 3664 	ld	b, d
   7AB5 03            [ 6] 3665 	inc	bc
   7AB6 03            [ 6] 3666 	inc	bc
   7AB7 3E 34         [ 7] 3667 	ld	a,#<(_spawnX)
   7AB9 DD 86 FB      [19] 3668 	add	a, -5 (ix)
   7ABC DD 77 F9      [19] 3669 	ld	-7 (ix),a
   7ABF 3E 65         [ 7] 3670 	ld	a,#>(_spawnX)
   7AC1 CE 00         [ 7] 3671 	adc	a, #0x00
   7AC3 DD 77 FA      [19] 3672 	ld	-6 (ix),a
   7AC6 E1            [10] 3673 	pop	hl
   7AC7 E5            [11] 3674 	push	hl
   7AC8 7E            [ 7] 3675 	ld	a,(hl)
   7AC9 02            [ 7] 3676 	ld	(bc),a
   7ACA 12            [ 7] 3677 	ld	(de),a
                           3678 ;src/main.c:638: actual->y = actual->py = spawnY[i];
   7ACB D5            [11] 3679 	push	de
   7ACC FD E1         [14] 3680 	pop	iy
   7ACE FD 23         [10] 3681 	inc	iy
   7AD0 4B            [ 4] 3682 	ld	c, e
   7AD1 42            [ 4] 3683 	ld	b, d
   7AD2 03            [ 6] 3684 	inc	bc
   7AD3 03            [ 6] 3685 	inc	bc
   7AD4 03            [ 6] 3686 	inc	bc
   7AD5 3E 38         [ 7] 3687 	ld	a,#<(_spawnY)
   7AD7 DD 86 FB      [19] 3688 	add	a, -5 (ix)
   7ADA DD 77 FE      [19] 3689 	ld	-2 (ix),a
   7ADD 3E 65         [ 7] 3690 	ld	a,#>(_spawnY)
   7ADF CE 00         [ 7] 3691 	adc	a, #0x00
   7AE1 DD 77 FF      [19] 3692 	ld	-1 (ix),a
   7AE4 DD 6E FE      [19] 3693 	ld	l,-2 (ix)
   7AE7 DD 66 FF      [19] 3694 	ld	h,-1 (ix)
   7AEA 7E            [ 7] 3695 	ld	a,(hl)
   7AEB 02            [ 7] 3696 	ld	(bc),a
   7AEC FD 77 00      [19] 3697 	ld	0 (iy), a
                           3698 ;src/main.c:639: actual->mover  = NO;
   7AEF 21 06 00      [10] 3699 	ld	hl,#0x0006
   7AF2 19            [11] 3700 	add	hl,de
   7AF3 36 00         [10] 3701 	ld	(hl),#0x00
                           3702 ;src/main.c:640: actual->mira   = M_abajo;
   7AF5 21 07 00      [10] 3703 	ld	hl,#0x0007
   7AF8 19            [11] 3704 	add	hl,de
   7AF9 36 03         [10] 3705 	ld	(hl),#0x03
                           3706 ;src/main.c:641: actual->sprite = g_enemy;
   7AFB 21 04 00      [10] 3707 	ld	hl,#0x0004
   7AFE 19            [11] 3708 	add	hl,de
   7AFF 36 3A         [10] 3709 	ld	(hl),#<(_g_enemy)
   7B01 23            [ 6] 3710 	inc	hl
   7B02 36 3C         [10] 3711 	ld	(hl),#>(_g_enemy)
                           3712 ;src/main.c:642: actual->muerto = NO;
   7B04 21 08 00      [10] 3713 	ld	hl,#0x0008
   7B07 19            [11] 3714 	add	hl,de
   7B08 36 00         [10] 3715 	ld	(hl),#0x00
                           3716 ;src/main.c:643: actual->muertes = 0;
   7B0A 21 0A 00      [10] 3717 	ld	hl,#0x000A
   7B0D 19            [11] 3718 	add	hl,de
   7B0E 36 00         [10] 3719 	ld	(hl),#0x00
                           3720 ;src/main.c:644: actual->patrolling = SI;
   7B10 21 0B 00      [10] 3721 	ld	hl,#0x000B
   7B13 19            [11] 3722 	add	hl,de
   7B14 36 01         [10] 3723 	ld	(hl),#0x01
                           3724 ;src/main.c:645: actual->reversePatrol = NO;
   7B16 21 0C 00      [10] 3725 	ld	hl,#0x000C
   7B19 19            [11] 3726 	add	hl,de
   7B1A 36 00         [10] 3727 	ld	(hl),#0x00
                           3728 ;src/main.c:646: actual->iter = 0;
   7B1C 21 0E 00      [10] 3729 	ld	hl,#0x000E
   7B1F 19            [11] 3730 	add	hl,de
   7B20 AF            [ 4] 3731 	xor	a, a
   7B21 77            [ 7] 3732 	ld	(hl), a
   7B22 23            [ 6] 3733 	inc	hl
   7B23 77            [ 7] 3734 	ld	(hl), a
                           3735 ;src/main.c:647: actual->lastIter = 0;
   7B24 21 10 00      [10] 3736 	ld	hl,#0x0010
   7B27 19            [11] 3737 	add	hl,de
   7B28 36 00         [10] 3738 	ld	(hl),#0x00
                           3739 ;src/main.c:648: actual->seen = 0;
   7B2A 21 12 00      [10] 3740 	ld	hl,#0x0012
   7B2D 19            [11] 3741 	add	hl,de
   7B2E 36 00         [10] 3742 	ld	(hl),#0x00
                           3743 ;src/main.c:649: actual->found = 0;
   7B30 21 13 00      [10] 3744 	ld	hl,#0x0013
   7B33 19            [11] 3745 	add	hl,de
   7B34 36 00         [10] 3746 	ld	(hl),#0x00
                           3747 ;src/main.c:650: actual->engage = 0;
   7B36 21 16 00      [10] 3748 	ld	hl,#0x0016
   7B39 19            [11] 3749 	add	hl,de
   7B3A 36 00         [10] 3750 	ld	(hl),#0x00
                           3751 ;src/main.c:651: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B3C 21 10 65      [10] 3752 	ld	hl,#_num_mapa + 0
   7B3F 4E            [ 7] 3753 	ld	c, (hl)
   7B40 0C            [ 4] 3754 	inc	c
   7B41 06 00         [ 7] 3755 	ld	b,#0x00
   7B43 69            [ 4] 3756 	ld	l, c
   7B44 60            [ 4] 3757 	ld	h, b
   7B45 29            [11] 3758 	add	hl, hl
   7B46 29            [11] 3759 	add	hl, hl
   7B47 09            [11] 3760 	add	hl, bc
   7B48 4D            [ 4] 3761 	ld	c,l
   7B49 44            [ 4] 3762 	ld	b,h
   7B4A 21 50 65      [10] 3763 	ld	hl,#_patrolY
   7B4D 09            [11] 3764 	add	hl,bc
   7B4E 7D            [ 4] 3765 	ld	a,l
   7B4F DD 86 FB      [19] 3766 	add	a, -5 (ix)
   7B52 6F            [ 4] 3767 	ld	l,a
   7B53 7C            [ 4] 3768 	ld	a,h
   7B54 CE 00         [ 7] 3769 	adc	a, #0x00
   7B56 67            [ 4] 3770 	ld	h,a
   7B57 7E            [ 7] 3771 	ld	a,(hl)
   7B58 DD 77 FD      [19] 3772 	ld	-3 (ix),a
   7B5B 21 3C 65      [10] 3773 	ld	hl,#_patrolX
   7B5E 09            [11] 3774 	add	hl,bc
   7B5F DD 4E FB      [19] 3775 	ld	c,-5 (ix)
   7B62 06 00         [ 7] 3776 	ld	b,#0x00
   7B64 09            [11] 3777 	add	hl,bc
   7B65 7E            [ 7] 3778 	ld	a,(hl)
   7B66 DD 77 FC      [19] 3779 	ld	-4 (ix),a
   7B69 DD 6E FE      [19] 3780 	ld	l,-2 (ix)
   7B6C DD 66 FF      [19] 3781 	ld	h,-1 (ix)
   7B6F 4E            [ 7] 3782 	ld	c,(hl)
   7B70 E1            [10] 3783 	pop	hl
   7B71 E5            [11] 3784 	push	hl
   7B72 46            [ 7] 3785 	ld	b,(hl)
   7B73 D5            [11] 3786 	push	de
   7B74 2A 0E 65      [16] 3787 	ld	hl,(_mapa)
   7B77 E5            [11] 3788 	push	hl
   7B78 D5            [11] 3789 	push	de
   7B79 DD 66 FD      [19] 3790 	ld	h,-3 (ix)
   7B7C DD 6E FC      [19] 3791 	ld	l,-4 (ix)
   7B7F E5            [11] 3792 	push	hl
   7B80 79            [ 4] 3793 	ld	a,c
   7B81 F5            [11] 3794 	push	af
   7B82 33            [ 6] 3795 	inc	sp
   7B83 C5            [11] 3796 	push	bc
   7B84 33            [ 6] 3797 	inc	sp
   7B85 CD 30 44      [17] 3798 	call	_pathFinding
   7B88 21 08 00      [10] 3799 	ld	hl,#8
   7B8B 39            [11] 3800 	add	hl,sp
   7B8C F9            [ 6] 3801 	ld	sp,hl
   7B8D D1            [10] 3802 	pop	de
                           3803 ;src/main.c:652: dibujarEnemigo(actual);
   7B8E D5            [11] 3804 	push	de
   7B8F D5            [11] 3805 	push	de
   7B90 CD EA 67      [17] 3806 	call	_dibujarEnemigo
   7B93 F1            [10] 3807 	pop	af
   7B94 D1            [10] 3808 	pop	de
                           3809 ;src/main.c:653: ++actual;
   7B95 21 E2 00      [10] 3810 	ld	hl,#0x00E2
   7B98 19            [11] 3811 	add	hl,de
   7B99 EB            [ 4] 3812 	ex	de,hl
   7B9A C3 A9 7A      [10] 3813 	jp	00101$
   7B9D                    3814 00104$:
   7B9D DD F9         [10] 3815 	ld	sp, ix
   7B9F DD E1         [14] 3816 	pop	ix
   7BA1 C9            [10] 3817 	ret
                           3818 ;src/main.c:657: void avanzarMapa() {
                           3819 ;	---------------------------------
                           3820 ; Function avanzarMapa
                           3821 ; ---------------------------------
   7BA2                    3822 _avanzarMapa::
                           3823 ;src/main.c:658: if(num_mapa < NUM_MAPAS -1) {
   7BA2 3A 10 65      [13] 3824 	ld	a,(#_num_mapa + 0)
   7BA5 D6 02         [ 7] 3825 	sub	a, #0x02
   7BA7 30 34         [12] 3826 	jr	NC,00102$
                           3827 ;src/main.c:659: mapa = mapas[++num_mapa];
   7BA9 01 2E 65      [10] 3828 	ld	bc,#_mapas+0
   7BAC 21 10 65      [10] 3829 	ld	hl, #_num_mapa+0
   7BAF 34            [11] 3830 	inc	(hl)
   7BB0 FD 21 10 65   [14] 3831 	ld	iy,#_num_mapa
   7BB4 FD 6E 00      [19] 3832 	ld	l,0 (iy)
   7BB7 26 00         [ 7] 3833 	ld	h,#0x00
   7BB9 29            [11] 3834 	add	hl, hl
   7BBA 09            [11] 3835 	add	hl,bc
   7BBB 7E            [ 7] 3836 	ld	a,(hl)
   7BBC FD 21 0E 65   [14] 3837 	ld	iy,#_mapa
   7BC0 FD 77 00      [19] 3838 	ld	0 (iy),a
   7BC3 23            [ 6] 3839 	inc	hl
   7BC4 7E            [ 7] 3840 	ld	a,(hl)
   7BC5 32 0F 65      [13] 3841 	ld	(#_mapa + 1),a
                           3842 ;src/main.c:660: prota.x = prota.px = 2;
   7BC8 21 33 64      [10] 3843 	ld	hl,#(_prota + 0x0002)
   7BCB 36 02         [10] 3844 	ld	(hl),#0x02
   7BCD 21 31 64      [10] 3845 	ld	hl,#_prota
   7BD0 36 02         [10] 3846 	ld	(hl),#0x02
                           3847 ;src/main.c:661: prota.mover = SI;
   7BD2 21 37 64      [10] 3848 	ld	hl,#(_prota + 0x0006)
   7BD5 36 01         [10] 3849 	ld	(hl),#0x01
                           3850 ;src/main.c:662: dibujarMapa();
   7BD7 CD 18 65      [17] 3851 	call	_dibujarMapa
                           3852 ;src/main.c:663: inicializarEnemy();
   7BDA C3 91 7A      [10] 3853 	jp  _inicializarEnemy
   7BDD                    3854 00102$:
                           3855 ;src/main.c:666: menuFin(puntuacion);
   7BDD FD 21 11 65   [14] 3856 	ld	iy,#_puntuacion
   7BE1 FD 6E 00      [19] 3857 	ld	l,0 (iy)
   7BE4 26 00         [ 7] 3858 	ld	h,#0x00
   7BE6 C3 E5 4B      [10] 3859 	jp  _menuFin
                           3860 ;src/main.c:670: void moverIzquierda() {
                           3861 ;	---------------------------------
                           3862 ; Function moverIzquierda
                           3863 ; ---------------------------------
   7BE9                    3864 _moverIzquierda::
                           3865 ;src/main.c:671: prota.mira = M_izquierda;
   7BE9 01 31 64      [10] 3866 	ld	bc,#_prota+0
   7BEC 21 38 64      [10] 3867 	ld	hl,#(_prota + 0x0007)
   7BEF 36 01         [10] 3868 	ld	(hl),#0x01
                           3869 ;src/main.c:672: if (!checkCollision(M_izquierda)) {
   7BF1 C5            [11] 3870 	push	bc
   7BF2 3E 01         [ 7] 3871 	ld	a,#0x01
   7BF4 F5            [11] 3872 	push	af
   7BF5 33            [ 6] 3873 	inc	sp
   7BF6 CD 79 66      [17] 3874 	call	_checkCollision
   7BF9 33            [ 6] 3875 	inc	sp
   7BFA C1            [10] 3876 	pop	bc
   7BFB 7D            [ 4] 3877 	ld	a,l
   7BFC B7            [ 4] 3878 	or	a, a
   7BFD C0            [11] 3879 	ret	NZ
                           3880 ;src/main.c:673: prota.x--;
   7BFE 0A            [ 7] 3881 	ld	a,(bc)
   7BFF C6 FF         [ 7] 3882 	add	a,#0xFF
   7C01 02            [ 7] 3883 	ld	(bc),a
                           3884 ;src/main.c:674: prota.mover = SI;
   7C02 21 37 64      [10] 3885 	ld	hl,#(_prota + 0x0006)
   7C05 36 01         [10] 3886 	ld	(hl),#0x01
                           3887 ;src/main.c:675: prota.sprite = g_hero_left;
   7C07 21 C6 3D      [10] 3888 	ld	hl,#_g_hero_left
   7C0A 22 35 64      [16] 3889 	ld	((_prota + 0x0004)), hl
   7C0D C9            [10] 3890 	ret
                           3891 ;src/main.c:679: void moverDerecha() {
                           3892 ;	---------------------------------
                           3893 ; Function moverDerecha
                           3894 ; ---------------------------------
   7C0E                    3895 _moverDerecha::
                           3896 ;src/main.c:680: prota.mira = M_derecha;
   7C0E 21 38 64      [10] 3897 	ld	hl,#(_prota + 0x0007)
   7C11 36 00         [10] 3898 	ld	(hl),#0x00
                           3899 ;src/main.c:681: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C13 AF            [ 4] 3900 	xor	a, a
   7C14 F5            [11] 3901 	push	af
   7C15 33            [ 6] 3902 	inc	sp
   7C16 CD 79 66      [17] 3903 	call	_checkCollision
   7C19 33            [ 6] 3904 	inc	sp
   7C1A 45            [ 4] 3905 	ld	b,l
   7C1B 21 31 64      [10] 3906 	ld	hl, #_prota + 0
   7C1E 4E            [ 7] 3907 	ld	c,(hl)
   7C1F 59            [ 4] 3908 	ld	e,c
   7C20 16 00         [ 7] 3909 	ld	d,#0x00
   7C22 21 07 00      [10] 3910 	ld	hl,#0x0007
   7C25 19            [11] 3911 	add	hl,de
   7C26 11 50 80      [10] 3912 	ld	de, #0x8050
   7C29 29            [11] 3913 	add	hl, hl
   7C2A 3F            [ 4] 3914 	ccf
   7C2B CB 1C         [ 8] 3915 	rr	h
   7C2D CB 1D         [ 8] 3916 	rr	l
   7C2F ED 52         [15] 3917 	sbc	hl, de
   7C31 3E 00         [ 7] 3918 	ld	a,#0x00
   7C33 17            [ 4] 3919 	rla
   7C34 5F            [ 4] 3920 	ld	e,a
   7C35 78            [ 4] 3921 	ld	a,b
   7C36 B7            [ 4] 3922 	or	a,a
   7C37 20 14         [12] 3923 	jr	NZ,00104$
   7C39 B3            [ 4] 3924 	or	a,e
   7C3A 28 11         [12] 3925 	jr	Z,00104$
                           3926 ;src/main.c:682: prota.x++;
   7C3C 0C            [ 4] 3927 	inc	c
   7C3D 21 31 64      [10] 3928 	ld	hl,#_prota
   7C40 71            [ 7] 3929 	ld	(hl),c
                           3930 ;src/main.c:683: prota.mover = SI;
   7C41 21 37 64      [10] 3931 	ld	hl,#(_prota + 0x0006)
   7C44 36 01         [10] 3932 	ld	(hl),#0x01
                           3933 ;src/main.c:684: prota.sprite = g_hero;
   7C46 21 70 3E      [10] 3934 	ld	hl,#_g_hero
   7C49 22 35 64      [16] 3935 	ld	((_prota + 0x0004)), hl
   7C4C C9            [10] 3936 	ret
   7C4D                    3937 00104$:
                           3938 ;src/main.c:685: }else if( prota.x + G_HERO_W >= 80){
   7C4D 7B            [ 4] 3939 	ld	a,e
   7C4E B7            [ 4] 3940 	or	a, a
   7C4F C0            [11] 3941 	ret	NZ
                           3942 ;src/main.c:686: avanzarMapa();
   7C50 C3 A2 7B      [10] 3943 	jp  _avanzarMapa
                           3944 ;src/main.c:690: void moverArriba() {
                           3945 ;	---------------------------------
                           3946 ; Function moverArriba
                           3947 ; ---------------------------------
   7C53                    3948 _moverArriba::
                           3949 ;src/main.c:691: prota.mira = M_arriba;
   7C53 21 38 64      [10] 3950 	ld	hl,#(_prota + 0x0007)
   7C56 36 02         [10] 3951 	ld	(hl),#0x02
                           3952 ;src/main.c:692: if (!checkCollision(M_arriba)) {
   7C58 3E 02         [ 7] 3953 	ld	a,#0x02
   7C5A F5            [11] 3954 	push	af
   7C5B 33            [ 6] 3955 	inc	sp
   7C5C CD 79 66      [17] 3956 	call	_checkCollision
   7C5F 33            [ 6] 3957 	inc	sp
   7C60 7D            [ 4] 3958 	ld	a,l
   7C61 B7            [ 4] 3959 	or	a, a
   7C62 C0            [11] 3960 	ret	NZ
                           3961 ;src/main.c:693: prota.y--;
   7C63 21 32 64      [10] 3962 	ld	hl,#_prota + 1
   7C66 4E            [ 7] 3963 	ld	c,(hl)
   7C67 0D            [ 4] 3964 	dec	c
   7C68 71            [ 7] 3965 	ld	(hl),c
                           3966 ;src/main.c:694: prota.y--;
   7C69 0D            [ 4] 3967 	dec	c
   7C6A 71            [ 7] 3968 	ld	(hl),c
                           3969 ;src/main.c:695: prota.mover  = SI;
   7C6B 21 37 64      [10] 3970 	ld	hl,#(_prota + 0x0006)
   7C6E 36 01         [10] 3971 	ld	(hl),#0x01
                           3972 ;src/main.c:696: prota.sprite = g_hero_up;
   7C70 21 2C 3D      [10] 3973 	ld	hl,#_g_hero_up
   7C73 22 35 64      [16] 3974 	ld	((_prota + 0x0004)), hl
   7C76 C9            [10] 3975 	ret
                           3976 ;src/main.c:700: void moverAbajo() {
                           3977 ;	---------------------------------
                           3978 ; Function moverAbajo
                           3979 ; ---------------------------------
   7C77                    3980 _moverAbajo::
                           3981 ;src/main.c:701: prota.mira = M_abajo;
   7C77 21 38 64      [10] 3982 	ld	hl,#(_prota + 0x0007)
   7C7A 36 03         [10] 3983 	ld	(hl),#0x03
                           3984 ;src/main.c:702: if (!checkCollision(M_abajo) ) {
   7C7C 3E 03         [ 7] 3985 	ld	a,#0x03
   7C7E F5            [11] 3986 	push	af
   7C7F 33            [ 6] 3987 	inc	sp
   7C80 CD 79 66      [17] 3988 	call	_checkCollision
   7C83 33            [ 6] 3989 	inc	sp
   7C84 7D            [ 4] 3990 	ld	a,l
   7C85 B7            [ 4] 3991 	or	a, a
   7C86 C0            [11] 3992 	ret	NZ
                           3993 ;src/main.c:703: prota.y++;
   7C87 01 32 64      [10] 3994 	ld	bc,#_prota + 1
   7C8A 0A            [ 7] 3995 	ld	a,(bc)
   7C8B 3C            [ 4] 3996 	inc	a
   7C8C 02            [ 7] 3997 	ld	(bc),a
                           3998 ;src/main.c:704: prota.y++;
   7C8D 3C            [ 4] 3999 	inc	a
   7C8E 02            [ 7] 4000 	ld	(bc),a
                           4001 ;src/main.c:705: prota.mover  = SI;
   7C8F 21 37 64      [10] 4002 	ld	hl,#(_prota + 0x0006)
   7C92 36 01         [10] 4003 	ld	(hl),#0x01
                           4004 ;src/main.c:706: prota.sprite = g_hero_down;
   7C94 21 92 3C      [10] 4005 	ld	hl,#_g_hero_down
   7C97 22 35 64      [16] 4006 	ld	((_prota + 0x0004)), hl
   7C9A C9            [10] 4007 	ret
                           4008 ;src/main.c:713: void intHandler() {
                           4009 ;	---------------------------------
                           4010 ; Function intHandler
                           4011 ; ---------------------------------
   7C9B                    4012 _intHandler::
                           4013 ;src/main.c:714: if (++i == 6) {
   7C9B 21 44 64      [10] 4014 	ld	hl, #_i+0
   7C9E 34            [11] 4015 	inc	(hl)
   7C9F 3A 44 64      [13] 4016 	ld	a,(#_i + 0)
   7CA2 D6 06         [ 7] 4017 	sub	a, #0x06
   7CA4 C0            [11] 4018 	ret	NZ
                           4019 ;src/main.c:715: play();
   7CA5 CD 7D 53      [17] 4020 	call	_play
                           4021 ;src/main.c:716: i=0;
   7CA8 21 44 64      [10] 4022 	ld	hl,#_i + 0
   7CAB 36 00         [10] 4023 	ld	(hl), #0x00
   7CAD C9            [10] 4024 	ret
                           4025 ;src/main.c:720: void inicializarCPC() {
                           4026 ;	---------------------------------
                           4027 ; Function inicializarCPC
                           4028 ; ---------------------------------
   7CAE                    4029 _inicializarCPC::
                           4030 ;src/main.c:721: cpct_disableFirmware();
   7CAE CD 24 57      [17] 4031 	call	_cpct_disableFirmware
                           4032 ;src/main.c:722: cpct_setVideoMode(0);
   7CB1 2E 00         [ 7] 4033 	ld	l,#0x00
   7CB3 CD F8 56      [17] 4034 	call	_cpct_setVideoMode
                           4035 ;src/main.c:723: cpct_setBorder(HW_BLACK);
   7CB6 21 10 14      [10] 4036 	ld	hl,#0x1410
   7CB9 E5            [11] 4037 	push	hl
   7CBA CD 5B 54      [17] 4038 	call	_cpct_setPALColour
                           4039 ;src/main.c:724: cpct_setPalette(g_palette, 16);
   7CBD 21 10 00      [10] 4040 	ld	hl,#0x0010
   7CC0 E5            [11] 4041 	push	hl
   7CC1 21 60 3E      [10] 4042 	ld	hl,#_g_palette
   7CC4 E5            [11] 4043 	push	hl
   7CC5 CD 38 54      [17] 4044 	call	_cpct_setPalette
   7CC8 C9            [10] 4045 	ret
                           4046 ;src/main.c:729: void inicializarJuego() {
                           4047 ;	---------------------------------
                           4048 ; Function inicializarJuego
                           4049 ; ---------------------------------
   7CC9                    4050 _inicializarJuego::
                           4051 ;src/main.c:731: num_mapa = 0;
   7CC9 21 10 65      [10] 4052 	ld	hl,#_num_mapa + 0
   7CCC 36 00         [10] 4053 	ld	(hl), #0x00
                           4054 ;src/main.c:732: mapa = mapas[num_mapa];
   7CCE 21 2E 65      [10] 4055 	ld	hl, #_mapas + 0
   7CD1 7E            [ 7] 4056 	ld	a,(hl)
   7CD2 FD 21 0E 65   [14] 4057 	ld	iy,#_mapa
   7CD6 FD 77 00      [19] 4058 	ld	0 (iy),a
   7CD9 23            [ 6] 4059 	inc	hl
   7CDA 7E            [ 7] 4060 	ld	a,(hl)
   7CDB 32 0F 65      [13] 4061 	ld	(#_mapa + 1),a
                           4062 ;src/main.c:733: cpct_etm_setTileset2x4(g_tileset);
   7CDE 21 E0 17      [10] 4063 	ld	hl,#_g_tileset
   7CE1 CD 4C 56      [17] 4064 	call	_cpct_etm_setTileset2x4
                           4065 ;src/main.c:735: dibujarMapa();
   7CE4 CD 18 65      [17] 4066 	call	_dibujarMapa
                           4067 ;src/main.c:738: barraPuntuacionInicial();
   7CE7 CD 85 51      [17] 4068 	call	_barraPuntuacionInicial
                           4069 ;src/main.c:741: prota.x = prota.px = 4;
   7CEA 21 33 64      [10] 4070 	ld	hl,#(_prota + 0x0002)
   7CED 36 04         [10] 4071 	ld	(hl),#0x04
   7CEF 21 31 64      [10] 4072 	ld	hl,#_prota
   7CF2 36 04         [10] 4073 	ld	(hl),#0x04
                           4074 ;src/main.c:742: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7CF4 21 34 64      [10] 4075 	ld	hl,#(_prota + 0x0003)
   7CF7 36 68         [10] 4076 	ld	(hl),#0x68
   7CF9 21 32 64      [10] 4077 	ld	hl,#(_prota + 0x0001)
   7CFC 36 68         [10] 4078 	ld	(hl),#0x68
                           4079 ;src/main.c:743: prota.mover  = NO;
   7CFE 21 37 64      [10] 4080 	ld	hl,#(_prota + 0x0006)
   7D01 36 00         [10] 4081 	ld	(hl),#0x00
                           4082 ;src/main.c:744: prota.mira=M_derecha;
   7D03 21 38 64      [10] 4083 	ld	hl,#(_prota + 0x0007)
   7D06 36 00         [10] 4084 	ld	(hl),#0x00
                           4085 ;src/main.c:745: prota.sprite = g_hero;
   7D08 21 70 3E      [10] 4086 	ld	hl,#_g_hero
   7D0B 22 35 64      [16] 4087 	ld	((_prota + 0x0004)), hl
                           4088 ;src/main.c:749: cu.x = cu.px = 0;
   7D0E 21 3B 64      [10] 4089 	ld	hl,#(_cu + 0x0002)
   7D11 36 00         [10] 4090 	ld	(hl),#0x00
   7D13 21 39 64      [10] 4091 	ld	hl,#_cu
   7D16 36 00         [10] 4092 	ld	(hl),#0x00
                           4093 ;src/main.c:750: cu.y = cu.py = 0;
   7D18 21 3C 64      [10] 4094 	ld	hl,#(_cu + 0x0003)
   7D1B 36 00         [10] 4095 	ld	(hl),#0x00
   7D1D 21 3A 64      [10] 4096 	ld	hl,#(_cu + 0x0001)
   7D20 36 00         [10] 4097 	ld	(hl),#0x00
                           4098 ;src/main.c:751: cu.lanzado = NO;
   7D22 21 3F 64      [10] 4099 	ld	hl,#(_cu + 0x0006)
   7D25 36 00         [10] 4100 	ld	(hl),#0x00
                           4101 ;src/main.c:752: cu.mover = NO;
   7D27 21 42 64      [10] 4102 	ld	hl,#(_cu + 0x0009)
   7D2A 36 00         [10] 4103 	ld	(hl),#0x00
                           4104 ;src/main.c:753: cu.off_bound = NO;
   7D2C 21 43 64      [10] 4105 	ld	hl,#(_cu + 0x000a)
   7D2F 36 00         [10] 4106 	ld	(hl),#0x00
                           4107 ;src/main.c:755: inicializarEnemy();
   7D31 CD 91 7A      [17] 4108 	call	_inicializarEnemy
                           4109 ;src/main.c:757: dibujarProta();
   7D34 C3 64 65      [10] 4110 	jp  _dibujarProta
                           4111 ;src/main.c:760: void main(void) {
                           4112 ;	---------------------------------
                           4113 ; Function main
                           4114 ; ---------------------------------
   7D37                    4115 _main::
   7D37 DD E5         [15] 4116 	push	ix
   7D39 DD 21 00 00   [14] 4117 	ld	ix,#0
   7D3D DD 39         [15] 4118 	add	ix,sp
   7D3F 21 F9 FF      [10] 4119 	ld	hl,#-7
   7D42 39            [11] 4120 	add	hl,sp
   7D43 F9            [ 6] 4121 	ld	sp,hl
                           4122 ;src/main.c:766: inicializarCPC();
   7D44 CD AE 7C      [17] 4123 	call	_inicializarCPC
                           4124 ;src/main.c:768: menuInicio();
   7D47 CD A6 50      [17] 4125 	call	_menuInicio
                           4126 ;src/main.c:770: inicializarJuego();
   7D4A CD C9 7C      [17] 4127 	call	_inicializarJuego
                           4128 ;src/main.c:774: while (1) {
   7D4D                    4129 00126$:
                           4130 ;src/main.c:776: i = 2 + num_mapa;
   7D4D 21 10 65      [10] 4131 	ld	hl,#_num_mapa + 0
   7D50 4E            [ 7] 4132 	ld	c, (hl)
   7D51 0C            [ 4] 4133 	inc	c
   7D52 0C            [ 4] 4134 	inc	c
                           4135 ;src/main.c:777: actual = enemy;
                           4136 ;src/main.c:779: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D53 C5            [11] 4137 	push	bc
   7D54 21 00 01      [10] 4138 	ld	hl,#_g_tablatrans
   7D57 E5            [11] 4139 	push	hl
   7D58 2A 0E 65      [16] 4140 	ld	hl,(_mapa)
   7D5B E5            [11] 4141 	push	hl
   7D5C 21 31 64      [10] 4142 	ld	hl,#_prota
   7D5F E5            [11] 4143 	push	hl
   7D60 21 39 64      [10] 4144 	ld	hl,#_cu
   7D63 E5            [11] 4145 	push	hl
   7D64 CD 12 66      [17] 4146 	call	_comprobarTeclado
   7D67 21 08 00      [10] 4147 	ld	hl,#8
   7D6A 39            [11] 4148 	add	hl,sp
   7D6B F9            [ 6] 4149 	ld	sp,hl
   7D6C 2A 0E 65      [16] 4150 	ld	hl,(_mapa)
   7D6F E5            [11] 4151 	push	hl
   7D70 21 39 64      [10] 4152 	ld	hl,#_cu
   7D73 E5            [11] 4153 	push	hl
   7D74 CD 2A 4A      [17] 4154 	call	_moverCuchillo
   7D77 F1            [10] 4155 	pop	af
   7D78 F1            [10] 4156 	pop	af
   7D79 C1            [10] 4157 	pop	bc
                           4158 ;src/main.c:781: while(i){
   7D7A DD 71 FD      [19] 4159 	ld	-3 (ix),c
   7D7D DD 36 FE A9   [19] 4160 	ld	-2 (ix),#<(_enemy)
   7D81 DD 36 FF 60   [19] 4161 	ld	-1 (ix),#>(_enemy)
   7D85                    4162 00105$:
   7D85 DD 7E FD      [19] 4163 	ld	a,-3 (ix)
   7D88 B7            [ 4] 4164 	or	a, a
   7D89 28 4E         [12] 4165 	jr	Z,00107$
                           4166 ;src/main.c:783: --i;
   7D8B DD 35 FD      [23] 4167 	dec	-3 (ix)
                           4168 ;src/main.c:784: if(!actual->muerto){
   7D8E DD 7E FE      [19] 4169 	ld	a,-2 (ix)
   7D91 C6 08         [ 7] 4170 	add	a, #0x08
   7D93 DD 77 F9      [19] 4171 	ld	-7 (ix),a
   7D96 DD 7E FF      [19] 4172 	ld	a,-1 (ix)
   7D99 CE 00         [ 7] 4173 	adc	a, #0x00
   7D9B DD 77 FA      [19] 4174 	ld	-6 (ix),a
   7D9E E1            [10] 4175 	pop	hl
   7D9F E5            [11] 4176 	push	hl
   7DA0 7E            [ 7] 4177 	ld	a,(hl)
   7DA1 B7            [ 4] 4178 	or	a, a
   7DA2 20 12         [12] 4179 	jr	NZ,00102$
                           4180 ;src/main.c:785: checkEnemyDead(cu.direccion, actual);
   7DA4 21 40 64      [10] 4181 	ld	hl, #_cu + 7
   7DA7 46            [ 7] 4182 	ld	b,(hl)
   7DA8 DD 6E FE      [19] 4183 	ld	l,-2 (ix)
   7DAB DD 66 FF      [19] 4184 	ld	h,-1 (ix)
   7DAE E5            [11] 4185 	push	hl
   7DAF C5            [11] 4186 	push	bc
   7DB0 33            [ 6] 4187 	inc	sp
   7DB1 CD 78 69      [17] 4188 	call	_checkEnemyDead
   7DB4 F1            [10] 4189 	pop	af
   7DB5 33            [ 6] 4190 	inc	sp
   7DB6                    4191 00102$:
                           4192 ;src/main.c:787: if(!actual->muerto){
   7DB6 E1            [10] 4193 	pop	hl
   7DB7 E5            [11] 4194 	push	hl
   7DB8 7E            [ 7] 4195 	ld	a,(hl)
   7DB9 B7            [ 4] 4196 	or	a, a
   7DBA 20 0B         [12] 4197 	jr	NZ,00104$
                           4198 ;src/main.c:788: updateEnemy(actual);
   7DBC DD 6E FE      [19] 4199 	ld	l,-2 (ix)
   7DBF DD 66 FF      [19] 4200 	ld	h,-1 (ix)
   7DC2 E5            [11] 4201 	push	hl
   7DC3 CD 24 79      [17] 4202 	call	_updateEnemy
   7DC6 F1            [10] 4203 	pop	af
   7DC7                    4204 00104$:
                           4205 ;src/main.c:790: ++actual;
   7DC7 DD 7E FE      [19] 4206 	ld	a,-2 (ix)
   7DCA C6 E2         [ 7] 4207 	add	a, #0xE2
   7DCC DD 77 FE      [19] 4208 	ld	-2 (ix),a
   7DCF DD 7E FF      [19] 4209 	ld	a,-1 (ix)
   7DD2 CE 00         [ 7] 4210 	adc	a, #0x00
   7DD4 DD 77 FF      [19] 4211 	ld	-1 (ix),a
   7DD7 18 AC         [12] 4212 	jr	00105$
   7DD9                    4213 00107$:
                           4214 ;src/main.c:793: cpct_waitVSYNC();
   7DD9 CD F0 56      [17] 4215 	call	_cpct_waitVSYNC
                           4216 ;src/main.c:796: if (prota.mover) {
   7DDC 01 37 64      [10] 4217 	ld	bc,#_prota + 6
   7DDF 0A            [ 7] 4218 	ld	a,(bc)
   7DE0 B7            [ 4] 4219 	or	a, a
   7DE1 28 07         [12] 4220 	jr	Z,00109$
                           4221 ;src/main.c:797: redibujarProta();
   7DE3 C5            [11] 4222 	push	bc
   7DE4 CD FE 65      [17] 4223 	call	_redibujarProta
   7DE7 C1            [10] 4224 	pop	bc
                           4225 ;src/main.c:798: prota.mover = NO;
   7DE8 AF            [ 4] 4226 	xor	a, a
   7DE9 02            [ 7] 4227 	ld	(bc),a
   7DEA                    4228 00109$:
                           4229 ;src/main.c:800: if(cu.lanzado && cu.mover){
   7DEA 21 3F 64      [10] 4230 	ld	hl, #(_cu + 0x0006) + 0
   7DED 4E            [ 7] 4231 	ld	c,(hl)
                           4232 ;src/main.c:801: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4233 ;src/main.c:800: if(cu.lanzado && cu.mover){
   7DEE 79            [ 4] 4234 	ld	a,c
   7DEF B7            [ 4] 4235 	or	a, a
   7DF0 28 30         [12] 4236 	jr	Z,00114$
   7DF2 3A 42 64      [13] 4237 	ld	a, (#(_cu + 0x0009) + 0)
   7DF5 B7            [ 4] 4238 	or	a, a
   7DF6 28 2A         [12] 4239 	jr	Z,00114$
                           4240 ;src/main.c:801: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7DF8 21 3A 64      [10] 4241 	ld	hl, #(_cu + 0x0001) + 0
   7DFB 4E            [ 7] 4242 	ld	c,(hl)
   7DFC 21 39 64      [10] 4243 	ld	hl, #_cu + 0
   7DFF 46            [ 7] 4244 	ld	b,(hl)
   7E00 21 41 64      [10] 4245 	ld	hl, #(_cu + 0x0008) + 0
   7E03 5E            [ 7] 4246 	ld	e,(hl)
   7E04 2A 0E 65      [16] 4247 	ld	hl,(_mapa)
   7E07 E5            [11] 4248 	push	hl
   7E08 21 00 01      [10] 4249 	ld	hl,#_g_tablatrans
   7E0B E5            [11] 4250 	push	hl
   7E0C 21 39 64      [10] 4251 	ld	hl,#_cu
   7E0F E5            [11] 4252 	push	hl
   7E10 79            [ 4] 4253 	ld	a,c
   7E11 F5            [11] 4254 	push	af
   7E12 33            [ 6] 4255 	inc	sp
   7E13 C5            [11] 4256 	push	bc
   7E14 33            [ 6] 4257 	inc	sp
   7E15 7B            [ 4] 4258 	ld	a,e
   7E16 F5            [11] 4259 	push	af
   7E17 33            [ 6] 4260 	inc	sp
   7E18 CD 4A 47      [17] 4261 	call	_redibujarCuchillo
   7E1B 21 09 00      [10] 4262 	ld	hl,#9
   7E1E 39            [11] 4263 	add	hl,sp
   7E1F F9            [ 6] 4264 	ld	sp,hl
   7E20 18 28         [12] 4265 	jr	00115$
   7E22                    4266 00114$:
                           4267 ;src/main.c:802: }else if (cu.lanzado && !cu.mover){
   7E22 79            [ 4] 4268 	ld	a,c
   7E23 B7            [ 4] 4269 	or	a, a
   7E24 28 24         [12] 4270 	jr	Z,00115$
   7E26 3A 42 64      [13] 4271 	ld	a, (#(_cu + 0x0009) + 0)
   7E29 B7            [ 4] 4272 	or	a, a
   7E2A 20 1E         [12] 4273 	jr	NZ,00115$
                           4274 ;src/main.c:803: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E2C 21 3A 64      [10] 4275 	ld	hl, #(_cu + 0x0001) + 0
   7E2F 46            [ 7] 4276 	ld	b,(hl)
   7E30 21 39 64      [10] 4277 	ld	hl, #_cu + 0
   7E33 4E            [ 7] 4278 	ld	c,(hl)
   7E34 21 41 64      [10] 4279 	ld	hl, #(_cu + 0x0008) + 0
   7E37 56            [ 7] 4280 	ld	d,(hl)
   7E38 2A 0E 65      [16] 4281 	ld	hl,(_mapa)
   7E3B E5            [11] 4282 	push	hl
   7E3C C5            [11] 4283 	push	bc
   7E3D D5            [11] 4284 	push	de
   7E3E 33            [ 6] 4285 	inc	sp
   7E3F CD B7 46      [17] 4286 	call	_borrarCuchillo
   7E42 F1            [10] 4287 	pop	af
   7E43 F1            [10] 4288 	pop	af
   7E44 33            [ 6] 4289 	inc	sp
                           4290 ;src/main.c:804: cu.lanzado = NO;
   7E45 21 3F 64      [10] 4291 	ld	hl,#(_cu + 0x0006)
   7E48 36 00         [10] 4292 	ld	(hl),#0x00
   7E4A                    4293 00115$:
                           4294 ;src/main.c:807: i = 2 + num_mapa;
   7E4A 3A 10 65      [13] 4295 	ld	a,(#_num_mapa + 0)
   7E4D C6 02         [ 7] 4296 	add	a, #0x02
   7E4F DD 77 F9      [19] 4297 	ld	-7 (ix),a
                           4298 ;src/main.c:808: actual = enemy;
   7E52 01 A9 60      [10] 4299 	ld	bc,#_enemy
                           4300 ;src/main.c:809: while(i){
   7E55                    4301 00122$:
   7E55 DD 7E F9      [19] 4302 	ld	a,-7 (ix)
   7E58 B7            [ 4] 4303 	or	a, a
   7E59 CA 15 7F      [10] 4304 	jp	Z,00124$
                           4305 ;src/main.c:811: --i;
   7E5C DD 35 F9      [23] 4306 	dec	-7 (ix)
                           4307 ;src/main.c:812: if(actual->mover){
   7E5F 21 06 00      [10] 4308 	ld	hl,#0x0006
   7E62 09            [11] 4309 	add	hl,bc
   7E63 DD 75 FE      [19] 4310 	ld	-2 (ix),l
   7E66 DD 74 FF      [19] 4311 	ld	-1 (ix),h
   7E69 DD 6E FE      [19] 4312 	ld	l,-2 (ix)
   7E6C DD 66 FF      [19] 4313 	ld	h,-1 (ix)
   7E6F 7E            [ 7] 4314 	ld	a,(hl)
   7E70 B7            [ 4] 4315 	or	a, a
   7E71 28 18         [12] 4316 	jr	Z,00118$
                           4317 ;src/main.c:813: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7E73 69            [ 4] 4318 	ld	l, c
   7E74 60            [ 4] 4319 	ld	h, b
   7E75 23            [ 6] 4320 	inc	hl
   7E76 23            [ 6] 4321 	inc	hl
   7E77 23            [ 6] 4322 	inc	hl
   7E78 5E            [ 7] 4323 	ld	e,(hl)
   7E79 69            [ 4] 4324 	ld	l, c
   7E7A 60            [ 4] 4325 	ld	h, b
   7E7B 23            [ 6] 4326 	inc	hl
   7E7C 23            [ 6] 4327 	inc	hl
   7E7D 56            [ 7] 4328 	ld	d,(hl)
   7E7E C5            [11] 4329 	push	bc
   7E7F C5            [11] 4330 	push	bc
   7E80 7B            [ 4] 4331 	ld	a,e
   7E81 F5            [11] 4332 	push	af
   7E82 33            [ 6] 4333 	inc	sp
   7E83 D5            [11] 4334 	push	de
   7E84 33            [ 6] 4335 	inc	sp
   7E85 CD 47 69      [17] 4336 	call	_redibujarEnemigo
   7E88 F1            [10] 4337 	pop	af
   7E89 F1            [10] 4338 	pop	af
   7E8A C1            [10] 4339 	pop	bc
   7E8B                    4340 00118$:
                           4341 ;src/main.c:816: if (actual->muerto && actual->muertes == 0){
   7E8B C5            [11] 4342 	push	bc
   7E8C FD E1         [14] 4343 	pop	iy
   7E8E FD 7E 08      [19] 4344 	ld	a,8 (iy)
   7E91 B7            [ 4] 4345 	or	a, a
   7E92 28 78         [12] 4346 	jr	Z,00120$
   7E94 21 0A 00      [10] 4347 	ld	hl,#0x000A
   7E97 09            [11] 4348 	add	hl,bc
   7E98 EB            [ 4] 4349 	ex	de,hl
   7E99 1A            [ 7] 4350 	ld	a,(de)
   7E9A B7            [ 4] 4351 	or	a, a
   7E9B 20 6F         [12] 4352 	jr	NZ,00120$
                           4353 ;src/main.c:817: borrarEnemigo((*actual).x, (*actual).y);
   7E9D 21 01 00      [10] 4354 	ld	hl,#0x0001
   7EA0 09            [11] 4355 	add	hl,bc
   7EA1 DD 75 FB      [19] 4356 	ld	-5 (ix),l
   7EA4 DD 74 FC      [19] 4357 	ld	-4 (ix),h
   7EA7 DD 6E FB      [19] 4358 	ld	l,-5 (ix)
   7EAA DD 66 FC      [19] 4359 	ld	h,-4 (ix)
   7EAD 7E            [ 7] 4360 	ld	a,(hl)
   7EAE F5            [11] 4361 	push	af
   7EAF 0A            [ 7] 4362 	ld	a,(bc)
   7EB0 DD 77 FD      [19] 4363 	ld	-3 (ix),a
   7EB3 F1            [10] 4364 	pop	af
   7EB4 C5            [11] 4365 	push	bc
   7EB5 D5            [11] 4366 	push	de
   7EB6 F5            [11] 4367 	push	af
   7EB7 33            [ 6] 4368 	inc	sp
   7EB8 DD 7E FD      [19] 4369 	ld	a,-3 (ix)
   7EBB F5            [11] 4370 	push	af
   7EBC 33            [ 6] 4371 	inc	sp
   7EBD CD D2 68      [17] 4372 	call	_borrarEnemigo
   7EC0 F1            [10] 4373 	pop	af
   7EC1 D1            [10] 4374 	pop	de
   7EC2 C1            [10] 4375 	pop	bc
                           4376 ;src/main.c:818: dibujarExplosion(actual);
   7EC3 C5            [11] 4377 	push	bc
   7EC4 D5            [11] 4378 	push	de
   7EC5 C5            [11] 4379 	push	bc
   7EC6 CD 22 68      [17] 4380 	call	_dibujarExplosion
   7EC9 F1            [10] 4381 	pop	af
   7ECA D1            [10] 4382 	pop	de
   7ECB C1            [10] 4383 	pop	bc
                           4384 ;src/main.c:819: puntuacion_aux = puntuacion;
   7ECC FD 21 11 65   [14] 4385 	ld	iy,#_puntuacion
   7ED0 FD 6E 00      [19] 4386 	ld	l,0 (iy)
   7ED3 26 00         [ 7] 4387 	ld	h,#0x00
                           4388 ;src/main.c:820: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7ED5 C5            [11] 4389 	push	bc
   7ED6 D5            [11] 4390 	push	de
   7ED7 E5            [11] 4391 	push	hl
   7ED8 CD 6A 53      [17] 4392 	call	_aumentarPuntuacion
   7EDB F1            [10] 4393 	pop	af
   7EDC D1            [10] 4394 	pop	de
   7EDD C1            [10] 4395 	pop	bc
   7EDE FD 21 11 65   [14] 4396 	ld	iy,#_puntuacion
   7EE2 FD 75 00      [19] 4397 	ld	0 (iy),l
                           4398 ;src/main.c:821: modificarPuntuacion(puntuacion);
   7EE5 FD 21 11 65   [14] 4399 	ld	iy,#_puntuacion
   7EE9 FD 6E 00      [19] 4400 	ld	l,0 (iy)
   7EEC 26 00         [ 7] 4401 	ld	h,#0x00
   7EEE C5            [11] 4402 	push	bc
   7EEF D5            [11] 4403 	push	de
   7EF0 E5            [11] 4404 	push	hl
   7EF1 CD 21 52      [17] 4405 	call	_modificarPuntuacion
   7EF4 F1            [10] 4406 	pop	af
   7EF5 D1            [10] 4407 	pop	de
   7EF6 C1            [10] 4408 	pop	bc
                           4409 ;src/main.c:822: actual->mover = NO;
   7EF7 DD 6E FE      [19] 4410 	ld	l,-2 (ix)
   7EFA DD 66 FF      [19] 4411 	ld	h,-1 (ix)
   7EFD 36 00         [10] 4412 	ld	(hl),#0x00
                           4413 ;src/main.c:823: actual->muertes++;
   7EFF 1A            [ 7] 4414 	ld	a,(de)
   7F00 3C            [ 4] 4415 	inc	a
   7F01 12            [ 7] 4416 	ld	(de),a
                           4417 ;src/main.c:824: actual->x = 0;
   7F02 AF            [ 4] 4418 	xor	a, a
   7F03 02            [ 7] 4419 	ld	(bc),a
                           4420 ;src/main.c:825: actual->y = 0;
   7F04 DD 6E FB      [19] 4421 	ld	l,-5 (ix)
   7F07 DD 66 FC      [19] 4422 	ld	h,-4 (ix)
   7F0A 36 00         [10] 4423 	ld	(hl),#0x00
   7F0C                    4424 00120$:
                           4425 ;src/main.c:827: ++actual;
   7F0C 21 E2 00      [10] 4426 	ld	hl,#0x00E2
   7F0F 09            [11] 4427 	add	hl,bc
   7F10 4D            [ 4] 4428 	ld	c,l
   7F11 44            [ 4] 4429 	ld	b,h
   7F12 C3 55 7E      [10] 4430 	jp	00122$
   7F15                    4431 00124$:
                           4432 ;src/main.c:829: cpct_waitVSYNC();
   7F15 CD F0 56      [17] 4433 	call	_cpct_waitVSYNC
   7F18 C3 4D 7D      [10] 4434 	jp	00126$
                           4435 	.area _CODE
                           4436 	.area _INITIALIZER
   6513                    4437 __xinit__mapa:
   6513 00 00              4438 	.dw #0x0000
   6515                    4439 __xinit__num_mapa:
   6515 00                 4440 	.db #0x00	; 0
   6516                    4441 __xinit__puntuacion:
   6516 00                 4442 	.db #0x00	; 0
   6517                    4443 __xinit__vidas:
   6517 05                 4444 	.db #0x05	; 5
                           4445 	.area _CABS (ABS)
