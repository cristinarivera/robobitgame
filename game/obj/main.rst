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
                             68 	.globl _puntuacion
                             69 	.globl _num_mapa
                             70 	.globl _mapa
                             71 	.globl _i
                             72 	.globl _vidas
                             73 	.globl _timer
                             74 	.globl _cambio
                             75 	.globl _parpadeo
                             76 	.globl _cu
                             77 	.globl _prota
                             78 	.globl _enemy
                             79 	.globl _patrolY
                             80 	.globl _patrolX
                             81 	.globl _spawnY
                             82 	.globl _spawnX
                             83 	.globl _mapas
                             84 ;--------------------------------------------------------
                             85 ; special function registers
                             86 ;--------------------------------------------------------
                             87 ;--------------------------------------------------------
                             88 ; ram data
                             89 ;--------------------------------------------------------
                             90 	.area _DATA
   60DA                      91 _enemy::
   60DA                      92 	.ds 908
   6466                      93 _prota::
   6466                      94 	.ds 8
   646E                      95 _cu::
   646E                      96 	.ds 11
   6479                      97 _parpadeo::
   6479                      98 	.ds 1
   647A                      99 _cambio::
   647A                     100 	.ds 1
   647B                     101 _timer::
   647B                     102 	.ds 2
   647D                     103 _vidas::
   647D                     104 	.ds 1
   647E                     105 _i::
   647E                     106 	.ds 1
                            107 ;--------------------------------------------------------
                            108 ; ram data
                            109 ;--------------------------------------------------------
                            110 	.area _INITIALIZED
   6548                     111 _mapa::
   6548                     112 	.ds 2
   654A                     113 _num_mapa::
   654A                     114 	.ds 1
   654B                     115 _puntuacion::
   654B                     116 	.ds 1
                            117 ;--------------------------------------------------------
                            118 ; absolute external ram data
                            119 ;--------------------------------------------------------
                            120 	.area _DABS (ABS)
                            121 ;--------------------------------------------------------
                            122 ; global & static initialisations
                            123 ;--------------------------------------------------------
                            124 	.area _HOME
                            125 	.area _GSINIT
                            126 	.area _GSFINAL
                            127 	.area _GSINIT
                            128 ;--------------------------------------------------------
                            129 ; Home
                            130 ;--------------------------------------------------------
                            131 	.area _HOME
                            132 	.area _HOME
                            133 ;--------------------------------------------------------
                            134 ; code
                            135 ;--------------------------------------------------------
                            136 	.area _CODE
                            137 ;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            138 ;	---------------------------------
                            139 ; Function dummy_cpct_transparentMaskTable0M0_container
                            140 ; ---------------------------------
   444C                     141 _dummy_cpct_transparentMaskTable0M0_container::
                            142 	.area _g_tablatrans_ (ABS) 
   0100                     143 	.org 0x0100 
   0100                     144 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   145 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   146 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   147 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   153 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   155 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   161 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   162 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   165 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   166 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   172 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   173 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   174 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   175 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   176 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            177 	.area _CSEG (REL, CON) 
                            178 ;src/main.c:114: void dibujarMapa() {
                            179 ;	---------------------------------
                            180 ; Function dibujarMapa
                            181 ; ---------------------------------
   6550                     182 _dibujarMapa::
                            183 ;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6550 2A 48 65      [16]  184 	ld	hl,(_mapa)
   6553 E5            [11]  185 	push	hl
   6554 21 F0 C0      [10]  186 	ld	hl,#0xC0F0
   6557 E5            [11]  187 	push	hl
   6558 21 2C 28      [10]  188 	ld	hl,#0x282C
   655B E5            [11]  189 	push	hl
   655C 2E 00         [ 7]  190 	ld	l, #0x00
   655E E5            [11]  191 	push	hl
   655F AF            [ 4]  192 	xor	a, a
   6560 F5            [11]  193 	push	af
   6561 33            [ 6]  194 	inc	sp
   6562 CD 61 55      [17]  195 	call	_cpct_etm_drawTileBox2x4
   6565 C9            [10]  196 	ret
   6566                     197 _mapas:
   6566 C0 10               198 	.dw _g_map1
   6568 E0 09               199 	.dw _g_map2
   656A 00 03               200 	.dw _g_map3
   656C                     201 _spawnX:
   656C 24                  202 	.db #0x24	; 36
   656D 47                  203 	.db #0x47	; 71	'G'
   656E 30                  204 	.db #0x30	; 48	'0'
   656F 18                  205 	.db #0x18	; 24
   6570                     206 _spawnY:
   6570 2C                  207 	.db #0x2C	; 44
   6571 66                  208 	.db #0x66	; 102	'f'
   6572 9A                  209 	.db #0x9A	; 154
   6573 40                  210 	.db #0x40	; 64
   6574                     211 _patrolX:
   6574 00                  212 	.db #0x00	; 0
   6575 00                  213 	.db #0x00	; 0
   6576 00                  214 	.db #0x00	; 0
   6577 00                  215 	.db #0x00	; 0
   6578 00                  216 	.db #0x00	; 0
   6579 42                  217 	.db #0x42	; 66	'B'
   657A 33                  218 	.db #0x33	; 51	'3'
   657B 00                  219 	.db #0x00	; 0
   657C 00                  220 	.db #0x00	; 0
   657D 00                  221 	.db 0x00
   657E 34                  222 	.db #0x34	; 52	'4'
   657F 33                  223 	.db #0x33	; 51	'3'
   6580 14                  224 	.db #0x14	; 20
   6581 00                  225 	.db #0x00	; 0
   6582 00                  226 	.db 0x00
   6583 38                  227 	.db #0x38	; 56	'8'
   6584 3C                  228 	.db #0x3C	; 60
   6585 23                  229 	.db #0x23	; 35
   6586 18                  230 	.db #0x18	; 24
   6587 00                  231 	.db 0x00
   6588                     232 _patrolY:
   6588 00                  233 	.db #0x00	; 0
   6589 00                  234 	.db #0x00	; 0
   658A 00                  235 	.db #0x00	; 0
   658B 00                  236 	.db #0x00	; 0
   658C 00                  237 	.db 0x00
   658D 5E                  238 	.db #0x5E	; 94
   658E A6                  239 	.db #0xA6	; 166
   658F 00                  240 	.db #0x00	; 0
   6590 00                  241 	.db #0x00	; 0
   6591 00                  242 	.db 0x00
   6592 A0                  243 	.db #0xA0	; 160
   6593 66                  244 	.db #0x66	; 102	'f'
   6594 2C                  245 	.db #0x2C	; 44
   6595 00                  246 	.db #0x00	; 0
   6596 00                  247 	.db 0x00
   6597 AE                  248 	.db #0xAE	; 174
   6598 66                  249 	.db #0x66	; 102	'f'
   6599 22                  250 	.db #0x22	; 34
   659A 86                  251 	.db #0x86	; 134
   659B 00                  252 	.db 0x00
                            253 ;src/main.c:120: void dibujarProta() {
                            254 ;	---------------------------------
                            255 ; Function dibujarProta
                            256 ; ---------------------------------
   659C                     257 _dibujarProta::
                            258 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   659C 21 67 64      [10]  259 	ld	hl, #_prota + 1
   659F 56            [ 7]  260 	ld	d,(hl)
   65A0 21 66 64      [10]  261 	ld	hl, #_prota + 0
   65A3 46            [ 7]  262 	ld	b,(hl)
   65A4 D5            [11]  263 	push	de
   65A5 33            [ 6]  264 	inc	sp
   65A6 C5            [11]  265 	push	bc
   65A7 33            [ 6]  266 	inc	sp
   65A8 21 00 C0      [10]  267 	ld	hl,#0xC000
   65AB E5            [11]  268 	push	hl
   65AC CD 7F 60      [17]  269 	call	_cpct_getScreenPtr
   65AF EB            [ 4]  270 	ex	de,hl
                            271 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   65B0 ED 4B 6A 64   [20]  272 	ld	bc, (#_prota + 4)
   65B4 21 00 01      [10]  273 	ld	hl,#_g_tablatrans
   65B7 E5            [11]  274 	push	hl
   65B8 21 07 16      [10]  275 	ld	hl,#0x1607
   65BB E5            [11]  276 	push	hl
   65BC D5            [11]  277 	push	de
   65BD C5            [11]  278 	push	bc
   65BE CD 9F 60      [17]  279 	call	_cpct_drawSpriteMaskedAlignedTable
   65C1 C9            [10]  280 	ret
                            281 ;src/main.c:125: void borrarProta() {
                            282 ;	---------------------------------
                            283 ; Function borrarProta
                            284 ; ---------------------------------
   65C2                     285 _borrarProta::
   65C2 DD E5         [15]  286 	push	ix
   65C4 DD 21 00 00   [14]  287 	ld	ix,#0
   65C8 DD 39         [15]  288 	add	ix,sp
   65CA F5            [11]  289 	push	af
   65CB 3B            [ 6]  290 	dec	sp
                            291 ;src/main.c:129: u8 w = 4 + (prota.px & 1);
   65CC 21 68 64      [10]  292 	ld	hl, #_prota + 2
   65CF 4E            [ 7]  293 	ld	c,(hl)
   65D0 79            [ 4]  294 	ld	a,c
   65D1 E6 01         [ 7]  295 	and	a, #0x01
   65D3 47            [ 4]  296 	ld	b,a
   65D4 04            [ 4]  297 	inc	b
   65D5 04            [ 4]  298 	inc	b
   65D6 04            [ 4]  299 	inc	b
   65D7 04            [ 4]  300 	inc	b
                            301 ;src/main.c:132: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   65D8 21 69 64      [10]  302 	ld	hl, #_prota + 3
   65DB 5E            [ 7]  303 	ld	e,(hl)
   65DC CB 4B         [ 8]  304 	bit	1, e
   65DE 28 04         [12]  305 	jr	Z,00103$
   65E0 3E 01         [ 7]  306 	ld	a,#0x01
   65E2 18 02         [12]  307 	jr	00104$
   65E4                     308 00103$:
   65E4 3E 00         [ 7]  309 	ld	a,#0x00
   65E6                     310 00104$:
   65E6 C6 06         [ 7]  311 	add	a, #0x06
   65E8 DD 77 FD      [19]  312 	ld	-3 (ix),a
                            313 ;src/main.c:134: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   65EB FD 2A 48 65   [20]  314 	ld	iy,(_mapa)
   65EF 16 00         [ 7]  315 	ld	d,#0x00
   65F1 7B            [ 4]  316 	ld	a,e
   65F2 C6 E8         [ 7]  317 	add	a,#0xE8
   65F4 DD 77 FE      [19]  318 	ld	-2 (ix),a
   65F7 7A            [ 4]  319 	ld	a,d
   65F8 CE FF         [ 7]  320 	adc	a,#0xFF
   65FA DD 77 FF      [19]  321 	ld	-1 (ix),a
   65FD DD 6E FE      [19]  322 	ld	l,-2 (ix)
   6600 DD 66 FF      [19]  323 	ld	h,-1 (ix)
   6603 DD CB FF 7E   [20]  324 	bit	7, -1 (ix)
   6607 28 04         [12]  325 	jr	Z,00105$
   6609 21 EB FF      [10]  326 	ld	hl,#0xFFEB
   660C 19            [11]  327 	add	hl,de
   660D                     328 00105$:
   660D CB 2C         [ 8]  329 	sra	h
   660F CB 1D         [ 8]  330 	rr	l
   6611 CB 2C         [ 8]  331 	sra	h
   6613 CB 1D         [ 8]  332 	rr	l
   6615 55            [ 4]  333 	ld	d,l
   6616 CB 39         [ 8]  334 	srl	c
   6618 FD E5         [15]  335 	push	iy
   661A 21 F0 C0      [10]  336 	ld	hl,#0xC0F0
   661D E5            [11]  337 	push	hl
   661E 3E 28         [ 7]  338 	ld	a,#0x28
   6620 F5            [11]  339 	push	af
   6621 33            [ 6]  340 	inc	sp
   6622 DD 7E FD      [19]  341 	ld	a,-3 (ix)
   6625 F5            [11]  342 	push	af
   6626 33            [ 6]  343 	inc	sp
   6627 C5            [11]  344 	push	bc
   6628 33            [ 6]  345 	inc	sp
   6629 D5            [11]  346 	push	de
   662A 33            [ 6]  347 	inc	sp
   662B 79            [ 4]  348 	ld	a,c
   662C F5            [11]  349 	push	af
   662D 33            [ 6]  350 	inc	sp
   662E CD 61 55      [17]  351 	call	_cpct_etm_drawTileBox2x4
   6631 DD F9         [10]  352 	ld	sp, ix
   6633 DD E1         [14]  353 	pop	ix
   6635 C9            [10]  354 	ret
                            355 ;src/main.c:137: void redibujarProta() {
                            356 ;	---------------------------------
                            357 ; Function redibujarProta
                            358 ; ---------------------------------
   6636                     359 _redibujarProta::
                            360 ;src/main.c:138: borrarProta();
   6636 CD C2 65      [17]  361 	call	_borrarProta
                            362 ;src/main.c:139: prota.px = prota.x;
   6639 01 68 64      [10]  363 	ld	bc,#_prota + 2
   663C 3A 66 64      [13]  364 	ld	a, (#_prota + 0)
   663F 02            [ 7]  365 	ld	(bc),a
                            366 ;src/main.c:140: prota.py = prota.y;
   6640 01 69 64      [10]  367 	ld	bc,#_prota + 3
   6643 3A 67 64      [13]  368 	ld	a, (#_prota + 1)
   6646 02            [ 7]  369 	ld	(bc),a
                            370 ;src/main.c:141: dibujarProta();
   6647 C3 9C 65      [10]  371 	jp  _dibujarProta
                            372 ;src/main.c:144: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            373 ;	---------------------------------
                            374 ; Function comprobarTeclado
                            375 ; ---------------------------------
   664A                     376 _comprobarTeclado::
                            377 ;src/main.c:145: cpct_scanKeyboard_if();
   664A CD D0 56      [17]  378 	call	_cpct_scanKeyboard_if
                            379 ;src/main.c:147: if (cpct_isAnyKeyPressed()) {
   664D CD C3 56      [17]  380 	call	_cpct_isAnyKeyPressed
   6650 7D            [ 4]  381 	ld	a,l
   6651 B7            [ 4]  382 	or	a, a
   6652 C8            [11]  383 	ret	Z
                            384 ;src/main.c:148: if (cpct_isKeyPressed(Key_CursorLeft)){
   6653 21 01 01      [10]  385 	ld	hl,#0x0101
   6656 CD 80 54      [17]  386 	call	_cpct_isKeyPressed
   6659 7D            [ 4]  387 	ld	a,l
   665A B7            [ 4]  388 	or	a, a
                            389 ;src/main.c:149: moverIzquierda();
   665B C2 D6 7B      [10]  390 	jp	NZ,_moverIzquierda
                            391 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorRight)){
   665E 21 00 02      [10]  392 	ld	hl,#0x0200
   6661 CD 80 54      [17]  393 	call	_cpct_isKeyPressed
   6664 7D            [ 4]  394 	ld	a,l
   6665 B7            [ 4]  395 	or	a, a
                            396 ;src/main.c:151: moverDerecha();
   6666 C2 FB 7B      [10]  397 	jp	NZ,_moverDerecha
                            398 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6669 21 00 01      [10]  399 	ld	hl,#0x0100
   666C CD 80 54      [17]  400 	call	_cpct_isKeyPressed
   666F 7D            [ 4]  401 	ld	a,l
   6670 B7            [ 4]  402 	or	a, a
                            403 ;src/main.c:153: moverArriba();
   6671 C2 40 7C      [10]  404 	jp	NZ,_moverArriba
                            405 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6674 21 00 04      [10]  406 	ld	hl,#0x0400
   6677 CD 80 54      [17]  407 	call	_cpct_isKeyPressed
   667A 7D            [ 4]  408 	ld	a,l
   667B B7            [ 4]  409 	or	a, a
                            410 ;src/main.c:155: moverAbajo();
   667C C2 64 7C      [10]  411 	jp	NZ,_moverAbajo
                            412 ;src/main.c:156: }else if (cpct_isKeyPressed(Key_Space)){
   667F 21 05 80      [10]  413 	ld	hl,#0x8005
   6682 CD 80 54      [17]  414 	call	_cpct_isKeyPressed
   6685 7D            [ 4]  415 	ld	a,l
   6686 B7            [ 4]  416 	or	a, a
   6687 C8            [11]  417 	ret	Z
                            418 ;src/main.c:157: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6688 21 08 00      [10]  419 	ld	hl, #8
   668B 39            [11]  420 	add	hl, sp
   668C 4E            [ 7]  421 	ld	c, (hl)
   668D 23            [ 6]  422 	inc	hl
   668E 46            [ 7]  423 	ld	b, (hl)
   668F C5            [11]  424 	push	bc
   6690 21 08 00      [10]  425 	ld	hl, #8
   6693 39            [11]  426 	add	hl, sp
   6694 4E            [ 7]  427 	ld	c, (hl)
   6695 23            [ 6]  428 	inc	hl
   6696 46            [ 7]  429 	ld	b, (hl)
   6697 C5            [11]  430 	push	bc
   6698 21 08 00      [10]  431 	ld	hl, #8
   669B 39            [11]  432 	add	hl, sp
   669C 4E            [ 7]  433 	ld	c, (hl)
   669D 23            [ 6]  434 	inc	hl
   669E 46            [ 7]  435 	ld	b, (hl)
   669F C5            [11]  436 	push	bc
   66A0 21 08 00      [10]  437 	ld	hl, #8
   66A3 39            [11]  438 	add	hl, sp
   66A4 4E            [ 7]  439 	ld	c, (hl)
   66A5 23            [ 6]  440 	inc	hl
   66A6 46            [ 7]  441 	ld	b, (hl)
   66A7 C5            [11]  442 	push	bc
   66A8 CD 6C 40      [17]  443 	call	_lanzarCuchillo
   66AB 21 08 00      [10]  444 	ld	hl,#8
   66AE 39            [11]  445 	add	hl,sp
   66AF F9            [ 6]  446 	ld	sp,hl
   66B0 C9            [10]  447 	ret
                            448 ;src/main.c:162: u8 checkCollision(u8 direction) { // check optimization
                            449 ;	---------------------------------
                            450 ; Function checkCollision
                            451 ; ---------------------------------
   66B1                     452 _checkCollision::
   66B1 DD E5         [15]  453 	push	ix
   66B3 DD 21 00 00   [14]  454 	ld	ix,#0
   66B7 DD 39         [15]  455 	add	ix,sp
   66B9 F5            [11]  456 	push	af
                            457 ;src/main.c:163: u8 *headTile=0, *feetTile=0, *waistTile=0;
   66BA 21 00 00      [10]  458 	ld	hl,#0x0000
   66BD E3            [19]  459 	ex	(sp), hl
   66BE 11 00 00      [10]  460 	ld	de,#0x0000
   66C1 01 00 00      [10]  461 	ld	bc,#0x0000
                            462 ;src/main.c:165: switch (direction) {
   66C4 3E 03         [ 7]  463 	ld	a,#0x03
   66C6 DD 96 04      [19]  464 	sub	a, 4 (ix)
   66C9 DA 01 68      [10]  465 	jp	C,00105$
   66CC DD 5E 04      [19]  466 	ld	e,4 (ix)
   66CF 16 00         [ 7]  467 	ld	d,#0x00
   66D1 21 D8 66      [10]  468 	ld	hl,#00124$
   66D4 19            [11]  469 	add	hl,de
   66D5 19            [11]  470 	add	hl,de
   66D6 19            [11]  471 	add	hl,de
   66D7 E9            [ 4]  472 	jp	(hl)
   66D8                     473 00124$:
   66D8 C3 E4 66      [10]  474 	jp	00101$
   66DB C3 39 67      [10]  475 	jp	00102$
   66DE C3 89 67      [10]  476 	jp	00103$
   66E1 C3 C6 67      [10]  477 	jp	00104$
                            478 ;src/main.c:166: case 0:
   66E4                     479 00101$:
                            480 ;src/main.c:167: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   66E4 21 67 64      [10]  481 	ld	hl, #(_prota + 0x0001) + 0
   66E7 4E            [ 7]  482 	ld	c,(hl)
   66E8 3A 66 64      [13]  483 	ld	a, (#_prota + 0)
   66EB C6 07         [ 7]  484 	add	a, #0x07
   66ED 47            [ 4]  485 	ld	b,a
   66EE 79            [ 4]  486 	ld	a,c
   66EF F5            [11]  487 	push	af
   66F0 33            [ 6]  488 	inc	sp
   66F1 C5            [11]  489 	push	bc
   66F2 33            [ 6]  490 	inc	sp
   66F3 2A 48 65      [16]  491 	ld	hl,(_mapa)
   66F6 E5            [11]  492 	push	hl
   66F7 CD 71 4B      [17]  493 	call	_getTilePtr
   66FA F1            [10]  494 	pop	af
   66FB F1            [10]  495 	pop	af
   66FC 33            [ 6]  496 	inc	sp
   66FD 33            [ 6]  497 	inc	sp
   66FE E5            [11]  498 	push	hl
                            499 ;src/main.c:168: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   66FF 3A 67 64      [13]  500 	ld	a, (#(_prota + 0x0001) + 0)
   6702 C6 14         [ 7]  501 	add	a, #0x14
   6704 4F            [ 4]  502 	ld	c,a
   6705 3A 66 64      [13]  503 	ld	a, (#_prota + 0)
   6708 C6 07         [ 7]  504 	add	a, #0x07
   670A 47            [ 4]  505 	ld	b,a
   670B 79            [ 4]  506 	ld	a,c
   670C F5            [11]  507 	push	af
   670D 33            [ 6]  508 	inc	sp
   670E C5            [11]  509 	push	bc
   670F 33            [ 6]  510 	inc	sp
   6710 2A 48 65      [16]  511 	ld	hl,(_mapa)
   6713 E5            [11]  512 	push	hl
   6714 CD 71 4B      [17]  513 	call	_getTilePtr
   6717 F1            [10]  514 	pop	af
   6718 F1            [10]  515 	pop	af
   6719 EB            [ 4]  516 	ex	de,hl
                            517 ;src/main.c:169: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   671A 3A 67 64      [13]  518 	ld	a, (#(_prota + 0x0001) + 0)
   671D C6 0B         [ 7]  519 	add	a, #0x0B
   671F 47            [ 4]  520 	ld	b,a
   6720 3A 66 64      [13]  521 	ld	a, (#_prota + 0)
   6723 C6 07         [ 7]  522 	add	a, #0x07
   6725 D5            [11]  523 	push	de
   6726 C5            [11]  524 	push	bc
   6727 33            [ 6]  525 	inc	sp
   6728 F5            [11]  526 	push	af
   6729 33            [ 6]  527 	inc	sp
   672A 2A 48 65      [16]  528 	ld	hl,(_mapa)
   672D E5            [11]  529 	push	hl
   672E CD 71 4B      [17]  530 	call	_getTilePtr
   6731 F1            [10]  531 	pop	af
   6732 F1            [10]  532 	pop	af
   6733 4D            [ 4]  533 	ld	c,l
   6734 44            [ 4]  534 	ld	b,h
   6735 D1            [10]  535 	pop	de
                            536 ;src/main.c:170: break;
   6736 C3 01 68      [10]  537 	jp	00105$
                            538 ;src/main.c:171: case 1:
   6739                     539 00102$:
                            540 ;src/main.c:172: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6739 21 67 64      [10]  541 	ld	hl, #(_prota + 0x0001) + 0
   673C 56            [ 7]  542 	ld	d,(hl)
   673D 21 66 64      [10]  543 	ld	hl, #_prota + 0
   6740 46            [ 7]  544 	ld	b,(hl)
   6741 05            [ 4]  545 	dec	b
   6742 D5            [11]  546 	push	de
   6743 33            [ 6]  547 	inc	sp
   6744 C5            [11]  548 	push	bc
   6745 33            [ 6]  549 	inc	sp
   6746 2A 48 65      [16]  550 	ld	hl,(_mapa)
   6749 E5            [11]  551 	push	hl
   674A CD 71 4B      [17]  552 	call	_getTilePtr
   674D F1            [10]  553 	pop	af
   674E F1            [10]  554 	pop	af
   674F 33            [ 6]  555 	inc	sp
   6750 33            [ 6]  556 	inc	sp
   6751 E5            [11]  557 	push	hl
                            558 ;src/main.c:173: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6752 3A 67 64      [13]  559 	ld	a, (#(_prota + 0x0001) + 0)
   6755 C6 14         [ 7]  560 	add	a, #0x14
   6757 57            [ 4]  561 	ld	d,a
   6758 21 66 64      [10]  562 	ld	hl, #_prota + 0
   675B 46            [ 7]  563 	ld	b,(hl)
   675C 05            [ 4]  564 	dec	b
   675D D5            [11]  565 	push	de
   675E 33            [ 6]  566 	inc	sp
   675F C5            [11]  567 	push	bc
   6760 33            [ 6]  568 	inc	sp
   6761 2A 48 65      [16]  569 	ld	hl,(_mapa)
   6764 E5            [11]  570 	push	hl
   6765 CD 71 4B      [17]  571 	call	_getTilePtr
   6768 F1            [10]  572 	pop	af
   6769 F1            [10]  573 	pop	af
   676A EB            [ 4]  574 	ex	de,hl
                            575 ;src/main.c:174: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   676B 3A 67 64      [13]  576 	ld	a, (#(_prota + 0x0001) + 0)
   676E C6 0B         [ 7]  577 	add	a, #0x0B
   6770 47            [ 4]  578 	ld	b,a
   6771 3A 66 64      [13]  579 	ld	a, (#_prota + 0)
   6774 C6 FF         [ 7]  580 	add	a,#0xFF
   6776 D5            [11]  581 	push	de
   6777 C5            [11]  582 	push	bc
   6778 33            [ 6]  583 	inc	sp
   6779 F5            [11]  584 	push	af
   677A 33            [ 6]  585 	inc	sp
   677B 2A 48 65      [16]  586 	ld	hl,(_mapa)
   677E E5            [11]  587 	push	hl
   677F CD 71 4B      [17]  588 	call	_getTilePtr
   6782 F1            [10]  589 	pop	af
   6783 F1            [10]  590 	pop	af
   6784 4D            [ 4]  591 	ld	c,l
   6785 44            [ 4]  592 	ld	b,h
   6786 D1            [10]  593 	pop	de
                            594 ;src/main.c:175: break;
   6787 18 78         [12]  595 	jr	00105$
                            596 ;src/main.c:176: case 2:
   6789                     597 00103$:
                            598 ;src/main.c:177: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6789 3A 67 64      [13]  599 	ld	a, (#(_prota + 0x0001) + 0)
   678C C6 FE         [ 7]  600 	add	a,#0xFE
   678E 21 66 64      [10]  601 	ld	hl, #_prota + 0
   6791 56            [ 7]  602 	ld	d,(hl)
   6792 C5            [11]  603 	push	bc
   6793 F5            [11]  604 	push	af
   6794 33            [ 6]  605 	inc	sp
   6795 D5            [11]  606 	push	de
   6796 33            [ 6]  607 	inc	sp
   6797 2A 48 65      [16]  608 	ld	hl,(_mapa)
   679A E5            [11]  609 	push	hl
   679B CD 71 4B      [17]  610 	call	_getTilePtr
   679E F1            [10]  611 	pop	af
   679F F1            [10]  612 	pop	af
   67A0 C1            [10]  613 	pop	bc
   67A1 33            [ 6]  614 	inc	sp
   67A2 33            [ 6]  615 	inc	sp
   67A3 E5            [11]  616 	push	hl
                            617 ;src/main.c:178: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   67A4 21 67 64      [10]  618 	ld	hl, #(_prota + 0x0001) + 0
   67A7 56            [ 7]  619 	ld	d,(hl)
   67A8 15            [ 4]  620 	dec	d
   67A9 15            [ 4]  621 	dec	d
   67AA 3A 66 64      [13]  622 	ld	a, (#_prota + 0)
   67AD C6 03         [ 7]  623 	add	a, #0x03
   67AF C5            [11]  624 	push	bc
   67B0 D5            [11]  625 	push	de
   67B1 33            [ 6]  626 	inc	sp
   67B2 F5            [11]  627 	push	af
   67B3 33            [ 6]  628 	inc	sp
   67B4 2A 48 65      [16]  629 	ld	hl,(_mapa)
   67B7 E5            [11]  630 	push	hl
   67B8 CD 71 4B      [17]  631 	call	_getTilePtr
   67BB F1            [10]  632 	pop	af
   67BC F1            [10]  633 	pop	af
   67BD EB            [ 4]  634 	ex	de,hl
   67BE C1            [10]  635 	pop	bc
                            636 ;src/main.c:179: *waistTile = 0;
   67BF 21 00 00      [10]  637 	ld	hl,#0x0000
   67C2 36 00         [10]  638 	ld	(hl),#0x00
                            639 ;src/main.c:180: break;
   67C4 18 3B         [12]  640 	jr	00105$
                            641 ;src/main.c:181: case 3:
   67C6                     642 00104$:
                            643 ;src/main.c:182: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   67C6 3A 67 64      [13]  644 	ld	a, (#(_prota + 0x0001) + 0)
   67C9 C6 16         [ 7]  645 	add	a, #0x16
   67CB 21 66 64      [10]  646 	ld	hl, #_prota + 0
   67CE 56            [ 7]  647 	ld	d,(hl)
   67CF C5            [11]  648 	push	bc
   67D0 F5            [11]  649 	push	af
   67D1 33            [ 6]  650 	inc	sp
   67D2 D5            [11]  651 	push	de
   67D3 33            [ 6]  652 	inc	sp
   67D4 2A 48 65      [16]  653 	ld	hl,(_mapa)
   67D7 E5            [11]  654 	push	hl
   67D8 CD 71 4B      [17]  655 	call	_getTilePtr
   67DB F1            [10]  656 	pop	af
   67DC F1            [10]  657 	pop	af
   67DD C1            [10]  658 	pop	bc
   67DE 33            [ 6]  659 	inc	sp
   67DF 33            [ 6]  660 	inc	sp
   67E0 E5            [11]  661 	push	hl
                            662 ;src/main.c:183: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   67E1 3A 67 64      [13]  663 	ld	a, (#(_prota + 0x0001) + 0)
   67E4 C6 16         [ 7]  664 	add	a, #0x16
   67E6 57            [ 4]  665 	ld	d,a
   67E7 3A 66 64      [13]  666 	ld	a, (#_prota + 0)
   67EA C6 03         [ 7]  667 	add	a, #0x03
   67EC C5            [11]  668 	push	bc
   67ED D5            [11]  669 	push	de
   67EE 33            [ 6]  670 	inc	sp
   67EF F5            [11]  671 	push	af
   67F0 33            [ 6]  672 	inc	sp
   67F1 2A 48 65      [16]  673 	ld	hl,(_mapa)
   67F4 E5            [11]  674 	push	hl
   67F5 CD 71 4B      [17]  675 	call	_getTilePtr
   67F8 F1            [10]  676 	pop	af
   67F9 F1            [10]  677 	pop	af
   67FA EB            [ 4]  678 	ex	de,hl
   67FB C1            [10]  679 	pop	bc
                            680 ;src/main.c:184: *waistTile = 0;
   67FC 21 00 00      [10]  681 	ld	hl,#0x0000
   67FF 36 00         [10]  682 	ld	(hl),#0x00
                            683 ;src/main.c:186: }
   6801                     684 00105$:
                            685 ;src/main.c:188: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6801 E1            [10]  686 	pop	hl
   6802 E5            [11]  687 	push	hl
   6803 6E            [ 7]  688 	ld	l,(hl)
   6804 3E 02         [ 7]  689 	ld	a,#0x02
   6806 95            [ 4]  690 	sub	a, l
   6807 38 0E         [12]  691 	jr	C,00106$
   6809 1A            [ 7]  692 	ld	a,(de)
   680A 5F            [ 4]  693 	ld	e,a
   680B 3E 02         [ 7]  694 	ld	a,#0x02
   680D 93            [ 4]  695 	sub	a, e
   680E 38 07         [12]  696 	jr	C,00106$
   6810 0A            [ 7]  697 	ld	a,(bc)
   6811 4F            [ 4]  698 	ld	c,a
   6812 3E 02         [ 7]  699 	ld	a,#0x02
   6814 91            [ 4]  700 	sub	a, c
   6815 30 04         [12]  701 	jr	NC,00107$
   6817                     702 00106$:
                            703 ;src/main.c:189: return 1;
   6817 2E 01         [ 7]  704 	ld	l,#0x01
   6819 18 02         [12]  705 	jr	00110$
   681B                     706 00107$:
                            707 ;src/main.c:191: return 0;
   681B 2E 00         [ 7]  708 	ld	l,#0x00
   681D                     709 00110$:
   681D DD F9         [10]  710 	ld	sp, ix
   681F DD E1         [14]  711 	pop	ix
   6821 C9            [10]  712 	ret
                            713 ;src/main.c:194: void dibujarEnemigo(TEnemy *enemy) {
                            714 ;	---------------------------------
                            715 ; Function dibujarEnemigo
                            716 ; ---------------------------------
   6822                     717 _dibujarEnemigo::
   6822 DD E5         [15]  718 	push	ix
   6824 DD 21 00 00   [14]  719 	ld	ix,#0
   6828 DD 39         [15]  720 	add	ix,sp
                            721 ;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   682A DD 4E 04      [19]  722 	ld	c,4 (ix)
   682D DD 46 05      [19]  723 	ld	b,5 (ix)
   6830 69            [ 4]  724 	ld	l, c
   6831 60            [ 4]  725 	ld	h, b
   6832 23            [ 6]  726 	inc	hl
   6833 56            [ 7]  727 	ld	d,(hl)
   6834 0A            [ 7]  728 	ld	a,(bc)
   6835 C5            [11]  729 	push	bc
   6836 D5            [11]  730 	push	de
   6837 33            [ 6]  731 	inc	sp
   6838 F5            [11]  732 	push	af
   6839 33            [ 6]  733 	inc	sp
   683A 21 00 C0      [10]  734 	ld	hl,#0xC000
   683D E5            [11]  735 	push	hl
   683E CD 7F 60      [17]  736 	call	_cpct_getScreenPtr
   6841 EB            [ 4]  737 	ex	de,hl
                            738 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6842 E1            [10]  739 	pop	hl
   6843 01 04 00      [10]  740 	ld	bc, #0x0004
   6846 09            [11]  741 	add	hl, bc
   6847 4E            [ 7]  742 	ld	c,(hl)
   6848 23            [ 6]  743 	inc	hl
   6849 46            [ 7]  744 	ld	b,(hl)
   684A 21 00 01      [10]  745 	ld	hl,#_g_tablatrans
   684D E5            [11]  746 	push	hl
   684E 21 04 16      [10]  747 	ld	hl,#0x1604
   6851 E5            [11]  748 	push	hl
   6852 D5            [11]  749 	push	de
   6853 C5            [11]  750 	push	bc
   6854 CD 9F 60      [17]  751 	call	_cpct_drawSpriteMaskedAlignedTable
   6857 DD E1         [14]  752 	pop	ix
   6859 C9            [10]  753 	ret
                            754 ;src/main.c:199: void dibujarExplosion(TEnemy *enemy) {
                            755 ;	---------------------------------
                            756 ; Function dibujarExplosion
                            757 ; ---------------------------------
   685A                     758 _dibujarExplosion::
   685A DD E5         [15]  759 	push	ix
   685C DD 21 00 00   [14]  760 	ld	ix,#0
   6860 DD 39         [15]  761 	add	ix,sp
                            762 ;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   6862 DD 4E 04      [19]  763 	ld	c,4 (ix)
   6865 DD 46 05      [19]  764 	ld	b,5 (ix)
   6868 69            [ 4]  765 	ld	l, c
   6869 60            [ 4]  766 	ld	h, b
   686A 23            [ 6]  767 	inc	hl
   686B 23            [ 6]  768 	inc	hl
   686C 23            [ 6]  769 	inc	hl
   686D 56            [ 7]  770 	ld	d,(hl)
   686E 69            [ 4]  771 	ld	l, c
   686F 60            [ 4]  772 	ld	h, b
   6870 23            [ 6]  773 	inc	hl
   6871 23            [ 6]  774 	inc	hl
   6872 46            [ 7]  775 	ld	b,(hl)
   6873 D5            [11]  776 	push	de
   6874 33            [ 6]  777 	inc	sp
   6875 C5            [11]  778 	push	bc
   6876 33            [ 6]  779 	inc	sp
   6877 21 00 C0      [10]  780 	ld	hl,#0xC000
   687A E5            [11]  781 	push	hl
   687B CD 7F 60      [17]  782 	call	_cpct_getScreenPtr
   687E 4D            [ 4]  783 	ld	c,l
   687F 44            [ 4]  784 	ld	b,h
                            785 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6880 11 00 01      [10]  786 	ld	de,#_g_tablatrans+0
   6883 D5            [11]  787 	push	de
   6884 21 04 16      [10]  788 	ld	hl,#0x1604
   6887 E5            [11]  789 	push	hl
   6888 C5            [11]  790 	push	bc
   6889 21 70 19      [10]  791 	ld	hl,#_g_explosion
   688C E5            [11]  792 	push	hl
   688D CD 9F 60      [17]  793 	call	_cpct_drawSpriteMaskedAlignedTable
   6890 DD E1         [14]  794 	pop	ix
   6892 C9            [10]  795 	ret
                            796 ;src/main.c:204: void borrarExplosion(u8 x, u8 y) {
                            797 ;	---------------------------------
                            798 ; Function borrarExplosion
                            799 ; ---------------------------------
   6893                     800 _borrarExplosion::
   6893 DD E5         [15]  801 	push	ix
   6895 DD 21 00 00   [14]  802 	ld	ix,#0
   6899 DD 39         [15]  803 	add	ix,sp
   689B F5            [11]  804 	push	af
   689C F5            [11]  805 	push	af
                            806 ;src/main.c:207: u8 w = 4 + (x & 1);
   689D DD 7E 04      [19]  807 	ld	a,4 (ix)
   68A0 E6 01         [ 7]  808 	and	a, #0x01
   68A2 4F            [ 4]  809 	ld	c,a
   68A3 0C            [ 4]  810 	inc	c
   68A4 0C            [ 4]  811 	inc	c
   68A5 0C            [ 4]  812 	inc	c
   68A6 0C            [ 4]  813 	inc	c
                            814 ;src/main.c:208: u8 h = 6 + (y & 3 ? 1 : 0);
   68A7 DD 7E 05      [19]  815 	ld	a,5 (ix)
   68AA E6 03         [ 7]  816 	and	a, #0x03
   68AC 28 04         [12]  817 	jr	Z,00103$
   68AE 3E 01         [ 7]  818 	ld	a,#0x01
   68B0 18 02         [12]  819 	jr	00104$
   68B2                     820 00103$:
   68B2 3E 00         [ 7]  821 	ld	a,#0x00
   68B4                     822 00104$:
   68B4 C6 06         [ 7]  823 	add	a, #0x06
   68B6 47            [ 4]  824 	ld	b,a
                            825 ;src/main.c:210: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68B7 2A 48 65      [16]  826 	ld	hl,(_mapa)
   68BA E3            [19]  827 	ex	(sp), hl
   68BB DD 5E 05      [19]  828 	ld	e,5 (ix)
   68BE 16 00         [ 7]  829 	ld	d,#0x00
   68C0 7B            [ 4]  830 	ld	a,e
   68C1 C6 E8         [ 7]  831 	add	a,#0xE8
   68C3 DD 77 FE      [19]  832 	ld	-2 (ix),a
   68C6 7A            [ 4]  833 	ld	a,d
   68C7 CE FF         [ 7]  834 	adc	a,#0xFF
   68C9 DD 77 FF      [19]  835 	ld	-1 (ix),a
   68CC DD 6E FE      [19]  836 	ld	l,-2 (ix)
   68CF DD 66 FF      [19]  837 	ld	h,-1 (ix)
   68D2 DD CB FF 7E   [20]  838 	bit	7, -1 (ix)
   68D6 28 04         [12]  839 	jr	Z,00105$
   68D8 21 EB FF      [10]  840 	ld	hl,#0xFFEB
   68DB 19            [11]  841 	add	hl,de
   68DC                     842 00105$:
   68DC CB 2C         [ 8]  843 	sra	h
   68DE CB 1D         [ 8]  844 	rr	l
   68E0 CB 2C         [ 8]  845 	sra	h
   68E2 CB 1D         [ 8]  846 	rr	l
   68E4 5D            [ 4]  847 	ld	e,l
   68E5 DD 56 04      [19]  848 	ld	d,4 (ix)
   68E8 CB 3A         [ 8]  849 	srl	d
   68EA E1            [10]  850 	pop	hl
   68EB E5            [11]  851 	push	hl
   68EC E5            [11]  852 	push	hl
   68ED 21 F0 C0      [10]  853 	ld	hl,#0xC0F0
   68F0 E5            [11]  854 	push	hl
   68F1 3E 28         [ 7]  855 	ld	a,#0x28
   68F3 F5            [11]  856 	push	af
   68F4 33            [ 6]  857 	inc	sp
   68F5 C5            [11]  858 	push	bc
   68F6 7B            [ 4]  859 	ld	a,e
   68F7 F5            [11]  860 	push	af
   68F8 33            [ 6]  861 	inc	sp
   68F9 D5            [11]  862 	push	de
   68FA 33            [ 6]  863 	inc	sp
   68FB CD 61 55      [17]  864 	call	_cpct_etm_drawTileBox2x4
   68FE DD F9         [10]  865 	ld	sp, ix
   6900 DD E1         [14]  866 	pop	ix
   6902 C9            [10]  867 	ret
                            868 ;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
                            869 ;	---------------------------------
                            870 ; Function borrarEnemigo
                            871 ; ---------------------------------
   6903                     872 _borrarEnemigo::
   6903 DD E5         [15]  873 	push	ix
   6905 DD 21 00 00   [14]  874 	ld	ix,#0
   6909 DD 39         [15]  875 	add	ix,sp
   690B F5            [11]  876 	push	af
   690C F5            [11]  877 	push	af
                            878 ;src/main.c:218: u8 w = 4 + (x & 1);
   690D DD 7E 04      [19]  879 	ld	a,4 (ix)
   6910 E6 01         [ 7]  880 	and	a, #0x01
   6912 4F            [ 4]  881 	ld	c,a
   6913 0C            [ 4]  882 	inc	c
   6914 0C            [ 4]  883 	inc	c
   6915 0C            [ 4]  884 	inc	c
   6916 0C            [ 4]  885 	inc	c
                            886 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   6917 DD 7E 05      [19]  887 	ld	a,5 (ix)
   691A E6 03         [ 7]  888 	and	a, #0x03
   691C 28 04         [12]  889 	jr	Z,00103$
   691E 3E 01         [ 7]  890 	ld	a,#0x01
   6920 18 02         [12]  891 	jr	00104$
   6922                     892 00103$:
   6922 3E 00         [ 7]  893 	ld	a,#0x00
   6924                     894 00104$:
   6924 C6 06         [ 7]  895 	add	a, #0x06
   6926 47            [ 4]  896 	ld	b,a
                            897 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6927 2A 48 65      [16]  898 	ld	hl,(_mapa)
   692A E3            [19]  899 	ex	(sp), hl
   692B DD 5E 05      [19]  900 	ld	e,5 (ix)
   692E 16 00         [ 7]  901 	ld	d,#0x00
   6930 7B            [ 4]  902 	ld	a,e
   6931 C6 E8         [ 7]  903 	add	a,#0xE8
   6933 DD 77 FE      [19]  904 	ld	-2 (ix),a
   6936 7A            [ 4]  905 	ld	a,d
   6937 CE FF         [ 7]  906 	adc	a,#0xFF
   6939 DD 77 FF      [19]  907 	ld	-1 (ix),a
   693C DD 6E FE      [19]  908 	ld	l,-2 (ix)
   693F DD 66 FF      [19]  909 	ld	h,-1 (ix)
   6942 DD CB FF 7E   [20]  910 	bit	7, -1 (ix)
   6946 28 04         [12]  911 	jr	Z,00105$
   6948 21 EB FF      [10]  912 	ld	hl,#0xFFEB
   694B 19            [11]  913 	add	hl,de
   694C                     914 00105$:
   694C CB 2C         [ 8]  915 	sra	h
   694E CB 1D         [ 8]  916 	rr	l
   6950 CB 2C         [ 8]  917 	sra	h
   6952 CB 1D         [ 8]  918 	rr	l
   6954 5D            [ 4]  919 	ld	e,l
   6955 DD 56 04      [19]  920 	ld	d,4 (ix)
   6958 CB 3A         [ 8]  921 	srl	d
   695A E1            [10]  922 	pop	hl
   695B E5            [11]  923 	push	hl
   695C E5            [11]  924 	push	hl
   695D 21 F0 C0      [10]  925 	ld	hl,#0xC0F0
   6960 E5            [11]  926 	push	hl
   6961 3E 28         [ 7]  927 	ld	a,#0x28
   6963 F5            [11]  928 	push	af
   6964 33            [ 6]  929 	inc	sp
   6965 C5            [11]  930 	push	bc
   6966 7B            [ 4]  931 	ld	a,e
   6967 F5            [11]  932 	push	af
   6968 33            [ 6]  933 	inc	sp
   6969 D5            [11]  934 	push	de
   696A 33            [ 6]  935 	inc	sp
   696B CD 61 55      [17]  936 	call	_cpct_etm_drawTileBox2x4
   696E DD F9         [10]  937 	ld	sp, ix
   6970 DD E1         [14]  938 	pop	ix
   6972 C9            [10]  939 	ret
                            940 ;src/main.c:225: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            941 ;	---------------------------------
                            942 ; Function redibujarEnemigo
                            943 ; ---------------------------------
   6973                     944 _redibujarEnemigo::
   6973 DD E5         [15]  945 	push	ix
   6975 DD 21 00 00   [14]  946 	ld	ix,#0
   6979 DD 39         [15]  947 	add	ix,sp
                            948 ;src/main.c:226: borrarEnemigo(x, y);
   697B DD 66 05      [19]  949 	ld	h,5 (ix)
   697E DD 6E 04      [19]  950 	ld	l,4 (ix)
   6981 E5            [11]  951 	push	hl
   6982 CD 03 69      [17]  952 	call	_borrarEnemigo
   6985 F1            [10]  953 	pop	af
                            954 ;src/main.c:227: enemy->px = enemy->x;
   6986 DD 4E 06      [19]  955 	ld	c,6 (ix)
   6989 DD 46 07      [19]  956 	ld	b,7 (ix)
   698C 59            [ 4]  957 	ld	e, c
   698D 50            [ 4]  958 	ld	d, b
   698E 13            [ 6]  959 	inc	de
   698F 13            [ 6]  960 	inc	de
   6990 0A            [ 7]  961 	ld	a,(bc)
   6991 12            [ 7]  962 	ld	(de),a
                            963 ;src/main.c:228: enemy->py = enemy->y;
   6992 59            [ 4]  964 	ld	e, c
   6993 50            [ 4]  965 	ld	d, b
   6994 13            [ 6]  966 	inc	de
   6995 13            [ 6]  967 	inc	de
   6996 13            [ 6]  968 	inc	de
   6997 69            [ 4]  969 	ld	l, c
   6998 60            [ 4]  970 	ld	h, b
   6999 23            [ 6]  971 	inc	hl
   699A 7E            [ 7]  972 	ld	a,(hl)
   699B 12            [ 7]  973 	ld	(de),a
                            974 ;src/main.c:229: dibujarEnemigo(enemy);
   699C C5            [11]  975 	push	bc
   699D CD 22 68      [17]  976 	call	_dibujarEnemigo
   69A0 F1            [10]  977 	pop	af
   69A1 DD E1         [14]  978 	pop	ix
   69A3 C9            [10]  979 	ret
                            980 ;src/main.c:233: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            981 ;	---------------------------------
                            982 ; Function checkEnemyDead
                            983 ; ---------------------------------
   69A4                     984 _checkEnemyDead::
   69A4 DD E5         [15]  985 	push	ix
   69A6 DD 21 00 00   [14]  986 	ld	ix,#0
   69AA DD 39         [15]  987 	add	ix,sp
   69AC 21 FA FF      [10]  988 	ld	hl,#-6
   69AF 39            [11]  989 	add	hl,sp
   69B0 F9            [ 6]  990 	ld	sp,hl
                            991 ;src/main.c:235: switch (direction) {
   69B1 3E 03         [ 7]  992 	ld	a,#0x03
   69B3 DD 96 04      [19]  993 	sub	a, 4 (ix)
   69B6 DA 92 6B      [10]  994 	jp	C,00134$
                            995 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69B9 DD 7E 05      [19]  996 	ld	a,5 (ix)
   69BC DD 77 FC      [19]  997 	ld	-4 (ix),a
   69BF DD 7E 06      [19]  998 	ld	a,6 (ix)
   69C2 DD 77 FD      [19]  999 	ld	-3 (ix),a
   69C5 DD 7E FC      [19] 1000 	ld	a,-4 (ix)
   69C8 C6 01         [ 7] 1001 	add	a, #0x01
   69CA DD 77 FE      [19] 1002 	ld	-2 (ix),a
   69CD DD 7E FD      [19] 1003 	ld	a,-3 (ix)
   69D0 CE 00         [ 7] 1004 	adc	a, #0x00
   69D2 DD 77 FF      [19] 1005 	ld	-1 (ix),a
                           1006 ;src/main.c:242: enemy->muerto = SI;
   69D5 DD 7E FC      [19] 1007 	ld	a,-4 (ix)
   69D8 C6 08         [ 7] 1008 	add	a, #0x08
   69DA DD 77 FA      [19] 1009 	ld	-6 (ix),a
   69DD DD 7E FD      [19] 1010 	ld	a,-3 (ix)
   69E0 CE 00         [ 7] 1011 	adc	a, #0x00
   69E2 DD 77 FB      [19] 1012 	ld	-5 (ix),a
                           1013 ;src/main.c:235: switch (direction) {
   69E5 DD 5E 04      [19] 1014 	ld	e,4 (ix)
   69E8 16 00         [ 7] 1015 	ld	d,#0x00
   69EA 21 F1 69      [10] 1016 	ld	hl,#00204$
   69ED 19            [11] 1017 	add	hl,de
   69EE 19            [11] 1018 	add	hl,de
   69EF 19            [11] 1019 	add	hl,de
   69F0 E9            [ 4] 1020 	jp	(hl)
   69F1                    1021 00204$:
   69F1 C3 FD 69      [10] 1022 	jp	00101$
   69F4 C3 65 6A      [10] 1023 	jp	00109$
   69F7 C3 CD 6A      [10] 1024 	jp	00117$
   69FA C3 34 6B      [10] 1025 	jp	00125$
                           1026 ;src/main.c:238: case 0:
   69FD                    1027 00101$:
                           1028 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69FD 21 6F 64      [10] 1029 	ld	hl, #_cu + 1
   6A00 4E            [ 7] 1030 	ld	c,(hl)
   6A01 06 00         [ 7] 1031 	ld	b,#0x00
   6A03 21 04 00      [10] 1032 	ld	hl,#0x0004
   6A06 09            [11] 1033 	add	hl,bc
   6A07 EB            [ 4] 1034 	ex	de,hl
   6A08 DD 6E FE      [19] 1035 	ld	l,-2 (ix)
   6A0B DD 66 FF      [19] 1036 	ld	h,-1 (ix)
   6A0E 6E            [ 7] 1037 	ld	l,(hl)
   6A0F 26 00         [ 7] 1038 	ld	h,#0x00
   6A11 7B            [ 4] 1039 	ld	a,e
   6A12 95            [ 4] 1040 	sub	a, l
   6A13 7A            [ 4] 1041 	ld	a,d
   6A14 9C            [ 4] 1042 	sbc	a, h
   6A15 E2 1A 6A      [10] 1043 	jp	PO, 00205$
   6A18 EE 80         [ 7] 1044 	xor	a, #0x80
   6A1A                    1045 00205$:
   6A1A FA 92 6B      [10] 1046 	jp	M,00134$
   6A1D 11 16 00      [10] 1047 	ld	de,#0x0016
   6A20 19            [11] 1048 	add	hl,de
   6A21 7D            [ 4] 1049 	ld	a,l
   6A22 91            [ 4] 1050 	sub	a, c
   6A23 7C            [ 4] 1051 	ld	a,h
   6A24 98            [ 4] 1052 	sbc	a, b
   6A25 E2 2A 6A      [10] 1053 	jp	PO, 00206$
   6A28 EE 80         [ 7] 1054 	xor	a, #0x80
   6A2A                    1055 00206$:
   6A2A FA 92 6B      [10] 1056 	jp	M,00134$
                           1057 ;src/main.c:240: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   6A2D DD 6E FC      [19] 1058 	ld	l,-4 (ix)
   6A30 DD 66 FD      [19] 1059 	ld	h,-3 (ix)
   6A33 4E            [ 7] 1060 	ld	c,(hl)
   6A34 21 6E 64      [10] 1061 	ld	hl, #_cu + 0
   6A37 5E            [ 7] 1062 	ld	e,(hl)
   6A38 16 00         [ 7] 1063 	ld	d,#0x00
   6A3A 13            [ 6] 1064 	inc	de
   6A3B 13            [ 6] 1065 	inc	de
   6A3C 13            [ 6] 1066 	inc	de
   6A3D 13            [ 6] 1067 	inc	de
   6A3E 69            [ 4] 1068 	ld	l,c
   6A3F 26 00         [ 7] 1069 	ld	h,#0x00
   6A41 7B            [ 4] 1070 	ld	a,e
   6A42 95            [ 4] 1071 	sub	a, l
   6A43 7A            [ 4] 1072 	ld	a,d
   6A44 9C            [ 4] 1073 	sbc	a, h
   6A45 E2 4A 6A      [10] 1074 	jp	PO, 00207$
   6A48 EE 80         [ 7] 1075 	xor	a, #0x80
   6A4A                    1076 00207$:
   6A4A F2 92 6B      [10] 1077 	jp	P,00134$
                           1078 ;src/main.c:241: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A4D BF            [ 4] 1079 	cp	a, a
   6A4E ED 52         [15] 1080 	sbc	hl, de
   6A50 3E 01         [ 7] 1081 	ld	a,#0x01
   6A52 BD            [ 4] 1082 	cp	a, l
   6A53 3E 00         [ 7] 1083 	ld	a,#0x00
   6A55 9C            [ 4] 1084 	sbc	a, h
   6A56 E2 5B 6A      [10] 1085 	jp	PO, 00208$
   6A59 EE 80         [ 7] 1086 	xor	a, #0x80
   6A5B                    1087 00208$:
   6A5B FA 92 6B      [10] 1088 	jp	M,00134$
                           1089 ;src/main.c:242: enemy->muerto = SI;
   6A5E E1            [10] 1090 	pop	hl
   6A5F E5            [11] 1091 	push	hl
   6A60 36 01         [10] 1092 	ld	(hl),#0x01
                           1093 ;src/main.c:246: break;
   6A62 C3 92 6B      [10] 1094 	jp	00134$
                           1095 ;src/main.c:247: case 1:
   6A65                    1096 00109$:
                           1097 ;src/main.c:248: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A65 21 6F 64      [10] 1098 	ld	hl, #_cu + 1
   6A68 4E            [ 7] 1099 	ld	c,(hl)
   6A69 06 00         [ 7] 1100 	ld	b,#0x00
   6A6B 21 04 00      [10] 1101 	ld	hl,#0x0004
   6A6E 09            [11] 1102 	add	hl,bc
   6A6F EB            [ 4] 1103 	ex	de,hl
   6A70 DD 6E FE      [19] 1104 	ld	l,-2 (ix)
   6A73 DD 66 FF      [19] 1105 	ld	h,-1 (ix)
   6A76 6E            [ 7] 1106 	ld	l,(hl)
   6A77 26 00         [ 7] 1107 	ld	h,#0x00
   6A79 7B            [ 4] 1108 	ld	a,e
   6A7A 95            [ 4] 1109 	sub	a, l
   6A7B 7A            [ 4] 1110 	ld	a,d
   6A7C 9C            [ 4] 1111 	sbc	a, h
   6A7D E2 82 6A      [10] 1112 	jp	PO, 00209$
   6A80 EE 80         [ 7] 1113 	xor	a, #0x80
   6A82                    1114 00209$:
   6A82 FA 92 6B      [10] 1115 	jp	M,00134$
   6A85 11 16 00      [10] 1116 	ld	de,#0x0016
   6A88 19            [11] 1117 	add	hl,de
   6A89 7D            [ 4] 1118 	ld	a,l
   6A8A 91            [ 4] 1119 	sub	a, c
   6A8B 7C            [ 4] 1120 	ld	a,h
   6A8C 98            [ 4] 1121 	sbc	a, b
   6A8D E2 92 6A      [10] 1122 	jp	PO, 00210$
   6A90 EE 80         [ 7] 1123 	xor	a, #0x80
   6A92                    1124 00210$:
   6A92 FA 92 6B      [10] 1125 	jp	M,00134$
                           1126 ;src/main.c:249: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6A95 21 6E 64      [10] 1127 	ld	hl, #_cu + 0
   6A98 4E            [ 7] 1128 	ld	c,(hl)
   6A99 DD 6E FC      [19] 1129 	ld	l,-4 (ix)
   6A9C DD 66 FD      [19] 1130 	ld	h,-3 (ix)
   6A9F 5E            [ 7] 1131 	ld	e,(hl)
   6AA0 16 00         [ 7] 1132 	ld	d,#0x00
   6AA2 13            [ 6] 1133 	inc	de
   6AA3 13            [ 6] 1134 	inc	de
   6AA4 13            [ 6] 1135 	inc	de
   6AA5 13            [ 6] 1136 	inc	de
   6AA6 69            [ 4] 1137 	ld	l,c
   6AA7 26 00         [ 7] 1138 	ld	h,#0x00
   6AA9 7B            [ 4] 1139 	ld	a,e
   6AAA 95            [ 4] 1140 	sub	a, l
   6AAB 7A            [ 4] 1141 	ld	a,d
   6AAC 9C            [ 4] 1142 	sbc	a, h
   6AAD E2 B2 6A      [10] 1143 	jp	PO, 00211$
   6AB0 EE 80         [ 7] 1144 	xor	a, #0x80
   6AB2                    1145 00211$:
   6AB2 F2 92 6B      [10] 1146 	jp	P,00134$
                           1147 ;src/main.c:250: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6AB5 BF            [ 4] 1148 	cp	a, a
   6AB6 ED 52         [15] 1149 	sbc	hl, de
   6AB8 3E 01         [ 7] 1150 	ld	a,#0x01
   6ABA BD            [ 4] 1151 	cp	a, l
   6ABB 3E 00         [ 7] 1152 	ld	a,#0x00
   6ABD 9C            [ 4] 1153 	sbc	a, h
   6ABE E2 C3 6A      [10] 1154 	jp	PO, 00212$
   6AC1 EE 80         [ 7] 1155 	xor	a, #0x80
   6AC3                    1156 00212$:
   6AC3 FA 92 6B      [10] 1157 	jp	M,00134$
                           1158 ;src/main.c:251: enemy->muerto = SI;
   6AC6 E1            [10] 1159 	pop	hl
   6AC7 E5            [11] 1160 	push	hl
   6AC8 36 01         [10] 1161 	ld	(hl),#0x01
                           1162 ;src/main.c:255: break;
   6ACA C3 92 6B      [10] 1163 	jp	00134$
                           1164 ;src/main.c:257: case 2:
   6ACD                    1165 00117$:
                           1166 ;src/main.c:258: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6ACD 21 6E 64      [10] 1167 	ld	hl, #_cu + 0
   6AD0 4E            [ 7] 1168 	ld	c,(hl)
   6AD1 06 00         [ 7] 1169 	ld	b,#0x00
   6AD3 59            [ 4] 1170 	ld	e, c
   6AD4 50            [ 4] 1171 	ld	d, b
   6AD5 13            [ 6] 1172 	inc	de
   6AD6 13            [ 6] 1173 	inc	de
   6AD7 DD 6E FC      [19] 1174 	ld	l,-4 (ix)
   6ADA DD 66 FD      [19] 1175 	ld	h,-3 (ix)
   6ADD 6E            [ 7] 1176 	ld	l,(hl)
   6ADE 26 00         [ 7] 1177 	ld	h,#0x00
   6AE0 7B            [ 4] 1178 	ld	a,e
   6AE1 95            [ 4] 1179 	sub	a, l
   6AE2 7A            [ 4] 1180 	ld	a,d
   6AE3 9C            [ 4] 1181 	sbc	a, h
   6AE4 E2 E9 6A      [10] 1182 	jp	PO, 00213$
   6AE7 EE 80         [ 7] 1183 	xor	a, #0x80
   6AE9                    1184 00213$:
   6AE9 FA 92 6B      [10] 1185 	jp	M,00134$
   6AEC 11 04 00      [10] 1186 	ld	de,#0x0004
   6AEF 19            [11] 1187 	add	hl,de
   6AF0 7D            [ 4] 1188 	ld	a,l
   6AF1 91            [ 4] 1189 	sub	a, c
   6AF2 7C            [ 4] 1190 	ld	a,h
   6AF3 98            [ 4] 1191 	sbc	a, b
   6AF4 E2 F9 6A      [10] 1192 	jp	PO, 00214$
   6AF7 EE 80         [ 7] 1193 	xor	a, #0x80
   6AF9                    1194 00214$:
   6AF9 FA 92 6B      [10] 1195 	jp	M,00134$
                           1196 ;src/main.c:259: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6AFC 21 6F 64      [10] 1197 	ld	hl, #(_cu + 0x0001) + 0
   6AFF 4E            [ 7] 1198 	ld	c,(hl)
   6B00 DD 6E FE      [19] 1199 	ld	l,-2 (ix)
   6B03 DD 66 FF      [19] 1200 	ld	h,-1 (ix)
   6B06 5E            [ 7] 1201 	ld	e,(hl)
   6B07 16 00         [ 7] 1202 	ld	d,#0x00
   6B09 21 16 00      [10] 1203 	ld	hl,#0x0016
   6B0C 19            [11] 1204 	add	hl,de
   6B0D EB            [ 4] 1205 	ex	de,hl
   6B0E 69            [ 4] 1206 	ld	l,c
   6B0F 26 00         [ 7] 1207 	ld	h,#0x00
   6B11 7B            [ 4] 1208 	ld	a,e
   6B12 95            [ 4] 1209 	sub	a, l
   6B13 7A            [ 4] 1210 	ld	a,d
   6B14 9C            [ 4] 1211 	sbc	a, h
   6B15 E2 1A 6B      [10] 1212 	jp	PO, 00215$
   6B18 EE 80         [ 7] 1213 	xor	a, #0x80
   6B1A                    1214 00215$:
   6B1A F2 92 6B      [10] 1215 	jp	P,00134$
                           1216 ;src/main.c:260: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6B1D BF            [ 4] 1217 	cp	a, a
   6B1E ED 52         [15] 1218 	sbc	hl, de
   6B20 3E 02         [ 7] 1219 	ld	a,#0x02
   6B22 BD            [ 4] 1220 	cp	a, l
   6B23 3E 00         [ 7] 1221 	ld	a,#0x00
   6B25 9C            [ 4] 1222 	sbc	a, h
   6B26 E2 2B 6B      [10] 1223 	jp	PO, 00216$
   6B29 EE 80         [ 7] 1224 	xor	a, #0x80
   6B2B                    1225 00216$:
   6B2B FA 92 6B      [10] 1226 	jp	M,00134$
                           1227 ;src/main.c:261: enemy->muerto = SI;
   6B2E E1            [10] 1228 	pop	hl
   6B2F E5            [11] 1229 	push	hl
   6B30 36 01         [10] 1230 	ld	(hl),#0x01
                           1231 ;src/main.c:265: break;
   6B32 18 5E         [12] 1232 	jr	00134$
                           1233 ;src/main.c:266: case 3:
   6B34                    1234 00125$:
                           1235 ;src/main.c:267: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6B34 21 6E 64      [10] 1236 	ld	hl, #_cu + 0
   6B37 4E            [ 7] 1237 	ld	c,(hl)
   6B38 06 00         [ 7] 1238 	ld	b,#0x00
   6B3A 59            [ 4] 1239 	ld	e, c
   6B3B 50            [ 4] 1240 	ld	d, b
   6B3C 13            [ 6] 1241 	inc	de
   6B3D 13            [ 6] 1242 	inc	de
   6B3E DD 6E FC      [19] 1243 	ld	l,-4 (ix)
   6B41 DD 66 FD      [19] 1244 	ld	h,-3 (ix)
   6B44 6E            [ 7] 1245 	ld	l,(hl)
   6B45 26 00         [ 7] 1246 	ld	h,#0x00
   6B47 7B            [ 4] 1247 	ld	a,e
   6B48 95            [ 4] 1248 	sub	a, l
   6B49 7A            [ 4] 1249 	ld	a,d
   6B4A 9C            [ 4] 1250 	sbc	a, h
   6B4B E2 50 6B      [10] 1251 	jp	PO, 00217$
   6B4E EE 80         [ 7] 1252 	xor	a, #0x80
   6B50                    1253 00217$:
   6B50 FA 92 6B      [10] 1254 	jp	M,00134$
   6B53 11 04 00      [10] 1255 	ld	de,#0x0004
   6B56 19            [11] 1256 	add	hl,de
   6B57 7D            [ 4] 1257 	ld	a,l
   6B58 91            [ 4] 1258 	sub	a, c
   6B59 7C            [ 4] 1259 	ld	a,h
   6B5A 98            [ 4] 1260 	sbc	a, b
   6B5B E2 60 6B      [10] 1261 	jp	PO, 00218$
   6B5E EE 80         [ 7] 1262 	xor	a, #0x80
   6B60                    1263 00218$:
   6B60 FA 92 6B      [10] 1264 	jp	M,00134$
                           1265 ;src/main.c:268: if(enemy->y>cu.y){
   6B63 DD 6E FE      [19] 1266 	ld	l,-2 (ix)
   6B66 DD 66 FF      [19] 1267 	ld	h,-1 (ix)
   6B69 4E            [ 7] 1268 	ld	c,(hl)
   6B6A 21 6F 64      [10] 1269 	ld	hl, #(_cu + 0x0001) + 0
   6B6D 5E            [ 7] 1270 	ld	e,(hl)
   6B6E 7B            [ 4] 1271 	ld	a,e
   6B6F 91            [ 4] 1272 	sub	a, c
   6B70 30 20         [12] 1273 	jr	NC,00134$
                           1274 ;src/main.c:269: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6B72 06 00         [ 7] 1275 	ld	b,#0x00
   6B74 16 00         [ 7] 1276 	ld	d,#0x00
   6B76 21 08 00      [10] 1277 	ld	hl,#0x0008
   6B79 19            [11] 1278 	add	hl,de
   6B7A 79            [ 4] 1279 	ld	a,c
   6B7B 95            [ 4] 1280 	sub	a, l
   6B7C 4F            [ 4] 1281 	ld	c,a
   6B7D 78            [ 4] 1282 	ld	a,b
   6B7E 9C            [ 4] 1283 	sbc	a, h
   6B7F 47            [ 4] 1284 	ld	b,a
   6B80 3E 02         [ 7] 1285 	ld	a,#0x02
   6B82 B9            [ 4] 1286 	cp	a, c
   6B83 3E 00         [ 7] 1287 	ld	a,#0x00
   6B85 98            [ 4] 1288 	sbc	a, b
   6B86 E2 8B 6B      [10] 1289 	jp	PO, 00219$
   6B89 EE 80         [ 7] 1290 	xor	a, #0x80
   6B8B                    1291 00219$:
   6B8B FA 92 6B      [10] 1292 	jp	M,00134$
                           1293 ;src/main.c:270: enemy->muerto = SI;
   6B8E E1            [10] 1294 	pop	hl
   6B8F E5            [11] 1295 	push	hl
   6B90 36 01         [10] 1296 	ld	(hl),#0x01
                           1297 ;src/main.c:275: }
   6B92                    1298 00134$:
   6B92 DD F9         [10] 1299 	ld	sp, ix
   6B94 DD E1         [14] 1300 	pop	ix
   6B96 C9            [10] 1301 	ret
                           1302 ;src/main.c:278: void moverEnemigoArriba(TEnemy *enemy){
                           1303 ;	---------------------------------
                           1304 ; Function moverEnemigoArriba
                           1305 ; ---------------------------------
   6B97                    1306 _moverEnemigoArriba::
   6B97 DD E5         [15] 1307 	push	ix
   6B99 DD 21 00 00   [14] 1308 	ld	ix,#0
   6B9D DD 39         [15] 1309 	add	ix,sp
                           1310 ;src/main.c:279: enemy->y--;
   6B9F DD 4E 04      [19] 1311 	ld	c,4 (ix)
   6BA2 DD 46 05      [19] 1312 	ld	b,5 (ix)
   6BA5 69            [ 4] 1313 	ld	l, c
   6BA6 60            [ 4] 1314 	ld	h, b
   6BA7 23            [ 6] 1315 	inc	hl
   6BA8 5E            [ 7] 1316 	ld	e,(hl)
   6BA9 1D            [ 4] 1317 	dec	e
   6BAA 73            [ 7] 1318 	ld	(hl),e
                           1319 ;src/main.c:280: enemy->y--;
   6BAB 1D            [ 4] 1320 	dec	e
   6BAC 73            [ 7] 1321 	ld	(hl),e
                           1322 ;src/main.c:281: enemy->mover = SI;
   6BAD 21 06 00      [10] 1323 	ld	hl,#0x0006
   6BB0 09            [11] 1324 	add	hl,bc
   6BB1 36 01         [10] 1325 	ld	(hl),#0x01
   6BB3 DD E1         [14] 1326 	pop	ix
   6BB5 C9            [10] 1327 	ret
                           1328 ;src/main.c:284: void moverEnemigoAbajo(TEnemy *enemy){
                           1329 ;	---------------------------------
                           1330 ; Function moverEnemigoAbajo
                           1331 ; ---------------------------------
   6BB6                    1332 _moverEnemigoAbajo::
   6BB6 DD E5         [15] 1333 	push	ix
   6BB8 DD 21 00 00   [14] 1334 	ld	ix,#0
   6BBC DD 39         [15] 1335 	add	ix,sp
                           1336 ;src/main.c:285: enemy->y++;
   6BBE DD 4E 04      [19] 1337 	ld	c,4 (ix)
   6BC1 DD 46 05      [19] 1338 	ld	b,5 (ix)
   6BC4 59            [ 4] 1339 	ld	e, c
   6BC5 50            [ 4] 1340 	ld	d, b
   6BC6 13            [ 6] 1341 	inc	de
   6BC7 1A            [ 7] 1342 	ld	a,(de)
   6BC8 3C            [ 4] 1343 	inc	a
   6BC9 12            [ 7] 1344 	ld	(de),a
                           1345 ;src/main.c:286: enemy->y++;
   6BCA 3C            [ 4] 1346 	inc	a
   6BCB 12            [ 7] 1347 	ld	(de),a
                           1348 ;src/main.c:287: enemy->mover = SI;
   6BCC 21 06 00      [10] 1349 	ld	hl,#0x0006
   6BCF 09            [11] 1350 	add	hl,bc
   6BD0 36 01         [10] 1351 	ld	(hl),#0x01
   6BD2 DD E1         [14] 1352 	pop	ix
   6BD4 C9            [10] 1353 	ret
                           1354 ;src/main.c:290: void moverEnemigoDerecha(TEnemy *enemy){
                           1355 ;	---------------------------------
                           1356 ; Function moverEnemigoDerecha
                           1357 ; ---------------------------------
   6BD5                    1358 _moverEnemigoDerecha::
                           1359 ;src/main.c:291: enemy->x++;
   6BD5 D1            [10] 1360 	pop	de
   6BD6 C1            [10] 1361 	pop	bc
   6BD7 C5            [11] 1362 	push	bc
   6BD8 D5            [11] 1363 	push	de
   6BD9 0A            [ 7] 1364 	ld	a,(bc)
   6BDA 3C            [ 4] 1365 	inc	a
   6BDB 02            [ 7] 1366 	ld	(bc),a
                           1367 ;src/main.c:292: enemy->x++;
   6BDC 3C            [ 4] 1368 	inc	a
   6BDD 02            [ 7] 1369 	ld	(bc),a
                           1370 ;src/main.c:293: enemy->mover = SI;
   6BDE 21 06 00      [10] 1371 	ld	hl,#0x0006
   6BE1 09            [11] 1372 	add	hl,bc
   6BE2 36 01         [10] 1373 	ld	(hl),#0x01
   6BE4 C9            [10] 1374 	ret
                           1375 ;src/main.c:296: void moverEnemigoIzquierda(TEnemy *enemy){
                           1376 ;	---------------------------------
                           1377 ; Function moverEnemigoIzquierda
                           1378 ; ---------------------------------
   6BE5                    1379 _moverEnemigoIzquierda::
                           1380 ;src/main.c:297: enemy->x--;
   6BE5 D1            [10] 1381 	pop	de
   6BE6 C1            [10] 1382 	pop	bc
   6BE7 C5            [11] 1383 	push	bc
   6BE8 D5            [11] 1384 	push	de
   6BE9 0A            [ 7] 1385 	ld	a,(bc)
   6BEA C6 FF         [ 7] 1386 	add	a,#0xFF
   6BEC 02            [ 7] 1387 	ld	(bc),a
                           1388 ;src/main.c:298: enemy->x--;
   6BED C6 FF         [ 7] 1389 	add	a,#0xFF
   6BEF 02            [ 7] 1390 	ld	(bc),a
                           1391 ;src/main.c:299: enemy->mover = SI;
   6BF0 21 06 00      [10] 1392 	ld	hl,#0x0006
   6BF3 09            [11] 1393 	add	hl,bc
   6BF4 36 01         [10] 1394 	ld	(hl),#0x01
   6BF6 C9            [10] 1395 	ret
                           1396 ;src/main.c:302: void moverEnemigoPatrol(TEnemy* enemy){
                           1397 ;	---------------------------------
                           1398 ; Function moverEnemigoPatrol
                           1399 ; ---------------------------------
   6BF7                    1400 _moverEnemigoPatrol::
   6BF7 DD E5         [15] 1401 	push	ix
   6BF9 DD 21 00 00   [14] 1402 	ld	ix,#0
   6BFD DD 39         [15] 1403 	add	ix,sp
   6BFF 21 F3 FF      [10] 1404 	ld	hl,#-13
   6C02 39            [11] 1405 	add	hl,sp
   6C03 F9            [ 6] 1406 	ld	sp,hl
                           1407 ;src/main.c:304: if(!enemy->muerto){
   6C04 DD 4E 04      [19] 1408 	ld	c,4 (ix)
   6C07 DD 46 05      [19] 1409 	ld	b,5 (ix)
   6C0A C5            [11] 1410 	push	bc
   6C0B FD E1         [14] 1411 	pop	iy
   6C0D FD 7E 08      [19] 1412 	ld	a,8 (iy)
   6C10 B7            [ 4] 1413 	or	a, a
   6C11 C2 3B 6E      [10] 1414 	jp	NZ,00118$
                           1415 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C14 21 0B 00      [10] 1416 	ld	hl,#0x000B
   6C17 09            [11] 1417 	add	hl,bc
   6C18 DD 75 F9      [19] 1418 	ld	-7 (ix),l
   6C1B DD 74 FA      [19] 1419 	ld	-6 (ix),h
   6C1E DD 6E F9      [19] 1420 	ld	l,-7 (ix)
   6C21 DD 66 FA      [19] 1421 	ld	h,-6 (ix)
   6C24 7E            [ 7] 1422 	ld	a,(hl)
   6C25 DD 77 FF      [19] 1423 	ld	-1 (ix),a
                           1424 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C28 21 0D 00      [10] 1425 	ld	hl,#0x000D
   6C2B 09            [11] 1426 	add	hl,bc
   6C2C DD 75 FB      [19] 1427 	ld	-5 (ix),l
   6C2F DD 74 FC      [19] 1428 	ld	-4 (ix),h
   6C32 DD 6E FB      [19] 1429 	ld	l,-5 (ix)
   6C35 DD 66 FC      [19] 1430 	ld	h,-4 (ix)
   6C38 5E            [ 7] 1431 	ld	e,(hl)
   6C39 23            [ 6] 1432 	inc	hl
   6C3A 56            [ 7] 1433 	ld	d,(hl)
   6C3B 21 E2 00      [10] 1434 	ld	hl,#0x00E2
   6C3E 09            [11] 1435 	add	hl,bc
   6C3F DD 75 FD      [19] 1436 	ld	-3 (ix),l
   6C42 DD 74 FE      [19] 1437 	ld	-2 (ix),h
                           1438 ;src/main.c:308: enemy->mover = SI;
   6C45 21 06 00      [10] 1439 	ld	hl,#0x0006
   6C48 09            [11] 1440 	add	hl,bc
   6C49 DD 75 F7      [19] 1441 	ld	-9 (ix),l
   6C4C DD 74 F8      [19] 1442 	ld	-8 (ix),h
                           1443 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C4F 21 1A 00      [10] 1444 	ld	hl,#0x001A
   6C52 09            [11] 1445 	add	hl,bc
   6C53 DD 75 F5      [19] 1446 	ld	-11 (ix),l
   6C56 DD 74 F6      [19] 1447 	ld	-10 (ix),h
                           1448 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6C59 21 01 00      [10] 1449 	ld	hl,#0x0001
   6C5C 09            [11] 1450 	add	hl,bc
   6C5D E3            [19] 1451 	ex	(sp), hl
                           1452 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C5E DD 7E FF      [19] 1453 	ld	a,-1 (ix)
   6C61 B7            [ 4] 1454 	or	a, a
   6C62 C2 39 6D      [10] 1455 	jp	NZ,00114$
                           1456 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C65 DD 6E FD      [19] 1457 	ld	l,-3 (ix)
   6C68 DD 66 FE      [19] 1458 	ld	h,-2 (ix)
   6C6B 6E            [ 7] 1459 	ld	l,(hl)
   6C6C 26 00         [ 7] 1460 	ld	h,#0x00
   6C6E 7B            [ 4] 1461 	ld	a,e
   6C6F 95            [ 4] 1462 	sub	a, l
   6C70 7A            [ 4] 1463 	ld	a,d
   6C71 9C            [ 4] 1464 	sbc	a, h
   6C72 E2 77 6C      [10] 1465 	jp	PO, 00144$
   6C75 EE 80         [ 7] 1466 	xor	a, #0x80
   6C77                    1467 00144$:
   6C77 F2 14 6D      [10] 1468 	jp	P,00105$
                           1469 ;src/main.c:307: if(enemy->iter == 0){
   6C7A 7A            [ 4] 1470 	ld	a,d
   6C7B B3            [ 4] 1471 	or	a,e
   6C7C 20 50         [12] 1472 	jr	NZ,00102$
                           1473 ;src/main.c:308: enemy->mover = SI;
   6C7E DD 6E F7      [19] 1474 	ld	l,-9 (ix)
   6C81 DD 66 F8      [19] 1475 	ld	h,-8 (ix)
   6C84 36 01         [10] 1476 	ld	(hl),#0x01
                           1477 ;src/main.c:309: enemy->iter = 2;
   6C86 DD 6E FB      [19] 1478 	ld	l,-5 (ix)
   6C89 DD 66 FC      [19] 1479 	ld	h,-4 (ix)
   6C8C 36 02         [10] 1480 	ld	(hl),#0x02
   6C8E 23            [ 6] 1481 	inc	hl
   6C8F 36 00         [10] 1482 	ld	(hl),#0x00
                           1483 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C91 DD 6E FB      [19] 1484 	ld	l,-5 (ix)
   6C94 DD 66 FC      [19] 1485 	ld	h,-4 (ix)
   6C97 5E            [ 7] 1486 	ld	e,(hl)
   6C98 23            [ 6] 1487 	inc	hl
   6C99 56            [ 7] 1488 	ld	d,(hl)
   6C9A DD 6E F5      [19] 1489 	ld	l,-11 (ix)
   6C9D DD 66 F6      [19] 1490 	ld	h,-10 (ix)
   6CA0 19            [11] 1491 	add	hl,de
   6CA1 7E            [ 7] 1492 	ld	a,(hl)
   6CA2 02            [ 7] 1493 	ld	(bc),a
                           1494 ;src/main.c:311: ++enemy->iter;
   6CA3 DD 6E FB      [19] 1495 	ld	l,-5 (ix)
   6CA6 DD 66 FC      [19] 1496 	ld	h,-4 (ix)
   6CA9 4E            [ 7] 1497 	ld	c,(hl)
   6CAA 23            [ 6] 1498 	inc	hl
   6CAB 46            [ 7] 1499 	ld	b,(hl)
   6CAC 03            [ 6] 1500 	inc	bc
   6CAD DD 6E FB      [19] 1501 	ld	l,-5 (ix)
   6CB0 DD 66 FC      [19] 1502 	ld	h,-4 (ix)
   6CB3 71            [ 7] 1503 	ld	(hl),c
   6CB4 23            [ 6] 1504 	inc	hl
   6CB5 70            [ 7] 1505 	ld	(hl),b
                           1506 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6CB6 DD 6E F5      [19] 1507 	ld	l,-11 (ix)
   6CB9 DD 66 F6      [19] 1508 	ld	h,-10 (ix)
   6CBC 09            [11] 1509 	add	hl,bc
   6CBD 5E            [ 7] 1510 	ld	e,(hl)
   6CBE E1            [10] 1511 	pop	hl
   6CBF E5            [11] 1512 	push	hl
   6CC0 73            [ 7] 1513 	ld	(hl),e
                           1514 ;src/main.c:313: ++enemy->iter;
   6CC1 03            [ 6] 1515 	inc	bc
   6CC2 DD 6E FB      [19] 1516 	ld	l,-5 (ix)
   6CC5 DD 66 FC      [19] 1517 	ld	h,-4 (ix)
   6CC8 71            [ 7] 1518 	ld	(hl),c
   6CC9 23            [ 6] 1519 	inc	hl
   6CCA 70            [ 7] 1520 	ld	(hl),b
   6CCB C3 3B 6E      [10] 1521 	jp	00118$
   6CCE                    1522 00102$:
                           1523 ;src/main.c:315: enemy->mover = SI;
   6CCE DD 6E F7      [19] 1524 	ld	l,-9 (ix)
   6CD1 DD 66 F8      [19] 1525 	ld	h,-8 (ix)
   6CD4 36 01         [10] 1526 	ld	(hl),#0x01
                           1527 ;src/main.c:316: enemy->x = enemy->camino[enemy->iter];
   6CD6 DD 6E FB      [19] 1528 	ld	l,-5 (ix)
   6CD9 DD 66 FC      [19] 1529 	ld	h,-4 (ix)
   6CDC 5E            [ 7] 1530 	ld	e,(hl)
   6CDD 23            [ 6] 1531 	inc	hl
   6CDE 56            [ 7] 1532 	ld	d,(hl)
   6CDF DD 6E F5      [19] 1533 	ld	l,-11 (ix)
   6CE2 DD 66 F6      [19] 1534 	ld	h,-10 (ix)
   6CE5 19            [11] 1535 	add	hl,de
   6CE6 7E            [ 7] 1536 	ld	a,(hl)
   6CE7 02            [ 7] 1537 	ld	(bc),a
                           1538 ;src/main.c:317: ++enemy->iter;
   6CE8 DD 6E FB      [19] 1539 	ld	l,-5 (ix)
   6CEB DD 66 FC      [19] 1540 	ld	h,-4 (ix)
   6CEE 5E            [ 7] 1541 	ld	e,(hl)
   6CEF 23            [ 6] 1542 	inc	hl
   6CF0 56            [ 7] 1543 	ld	d,(hl)
   6CF1 13            [ 6] 1544 	inc	de
   6CF2 DD 6E FB      [19] 1545 	ld	l,-5 (ix)
   6CF5 DD 66 FC      [19] 1546 	ld	h,-4 (ix)
   6CF8 73            [ 7] 1547 	ld	(hl),e
   6CF9 23            [ 6] 1548 	inc	hl
   6CFA 72            [ 7] 1549 	ld	(hl),d
                           1550 ;src/main.c:318: enemy->y = enemy->camino[enemy->iter];
   6CFB DD 6E F5      [19] 1551 	ld	l,-11 (ix)
   6CFE DD 66 F6      [19] 1552 	ld	h,-10 (ix)
   6D01 19            [11] 1553 	add	hl,de
   6D02 7E            [ 7] 1554 	ld	a,(hl)
   6D03 E1            [10] 1555 	pop	hl
   6D04 E5            [11] 1556 	push	hl
   6D05 77            [ 7] 1557 	ld	(hl),a
                           1558 ;src/main.c:319: ++enemy->iter;
   6D06 13            [ 6] 1559 	inc	de
   6D07 4B            [ 4] 1560 	ld	c,e
   6D08 DD 6E FB      [19] 1561 	ld	l,-5 (ix)
   6D0B DD 66 FC      [19] 1562 	ld	h,-4 (ix)
   6D0E 71            [ 7] 1563 	ld	(hl),c
   6D0F 23            [ 6] 1564 	inc	hl
   6D10 72            [ 7] 1565 	ld	(hl),d
   6D11 C3 3B 6E      [10] 1566 	jp	00118$
   6D14                    1567 00105$:
                           1568 ;src/main.c:323: enemy->mover = NO;
   6D14 DD 6E F7      [19] 1569 	ld	l,-9 (ix)
   6D17 DD 66 F8      [19] 1570 	ld	h,-8 (ix)
   6D1A 36 00         [10] 1571 	ld	(hl),#0x00
                           1572 ;src/main.c:324: enemy->iter = enemy->longitud_camino;
   6D1C DD 6E FD      [19] 1573 	ld	l,-3 (ix)
   6D1F DD 66 FE      [19] 1574 	ld	h,-2 (ix)
   6D22 4E            [ 7] 1575 	ld	c,(hl)
   6D23 06 00         [ 7] 1576 	ld	b,#0x00
   6D25 DD 6E FB      [19] 1577 	ld	l,-5 (ix)
   6D28 DD 66 FC      [19] 1578 	ld	h,-4 (ix)
   6D2B 71            [ 7] 1579 	ld	(hl),c
   6D2C 23            [ 6] 1580 	inc	hl
   6D2D 70            [ 7] 1581 	ld	(hl),b
                           1582 ;src/main.c:325: enemy->reversePatrol = 1;
   6D2E DD 6E F9      [19] 1583 	ld	l,-7 (ix)
   6D31 DD 66 FA      [19] 1584 	ld	h,-6 (ix)
   6D34 36 01         [10] 1585 	ld	(hl),#0x01
   6D36 C3 3B 6E      [10] 1586 	jp	00118$
   6D39                    1587 00114$:
                           1588 ;src/main.c:328: if(enemy->iter > 0){
   6D39 AF            [ 4] 1589 	xor	a, a
   6D3A BB            [ 4] 1590 	cp	a, e
   6D3B 9A            [ 4] 1591 	sbc	a, d
   6D3C E2 41 6D      [10] 1592 	jp	PO, 00145$
   6D3F EE 80         [ 7] 1593 	xor	a, #0x80
   6D41                    1594 00145$:
   6D41 F2 21 6E      [10] 1595 	jp	P,00111$
                           1596 ;src/main.c:329: if(enemy->iter == enemy->longitud_camino){
   6D44 DD 6E FD      [19] 1597 	ld	l,-3 (ix)
   6D47 DD 66 FE      [19] 1598 	ld	h,-2 (ix)
   6D4A 6E            [ 7] 1599 	ld	l,(hl)
   6D4B DD 75 FD      [19] 1600 	ld	-3 (ix),l
   6D4E DD 36 FE 00   [19] 1601 	ld	-2 (ix),#0x00
   6D52 7B            [ 4] 1602 	ld	a,e
   6D53 DD 96 FD      [19] 1603 	sub	a, -3 (ix)
   6D56 C2 DD 6D      [10] 1604 	jp	NZ,00108$
   6D59 7A            [ 4] 1605 	ld	a,d
   6D5A DD 96 FE      [19] 1606 	sub	a, -2 (ix)
   6D5D C2 DD 6D      [10] 1607 	jp	NZ,00108$
                           1608 ;src/main.c:330: enemy->mover = SI;
   6D60 DD 6E F7      [19] 1609 	ld	l,-9 (ix)
   6D63 DD 66 F8      [19] 1610 	ld	h,-8 (ix)
   6D66 36 01         [10] 1611 	ld	(hl),#0x01
                           1612 ;src/main.c:331: enemy->iter = enemy->iter - 1;
   6D68 DD 6E FB      [19] 1613 	ld	l,-5 (ix)
   6D6B DD 66 FC      [19] 1614 	ld	h,-4 (ix)
   6D6E 5E            [ 7] 1615 	ld	e,(hl)
   6D6F 23            [ 6] 1616 	inc	hl
   6D70 56            [ 7] 1617 	ld	d,(hl)
   6D71 7B            [ 4] 1618 	ld	a,e
   6D72 C6 FF         [ 7] 1619 	add	a,#0xFF
   6D74 DD 77 FD      [19] 1620 	ld	-3 (ix),a
   6D77 7A            [ 4] 1621 	ld	a,d
   6D78 CE FF         [ 7] 1622 	adc	a,#0xFF
   6D7A DD 77 FE      [19] 1623 	ld	-2 (ix),a
   6D7D DD 6E FB      [19] 1624 	ld	l,-5 (ix)
   6D80 DD 66 FC      [19] 1625 	ld	h,-4 (ix)
   6D83 DD 7E FD      [19] 1626 	ld	a,-3 (ix)
   6D86 77            [ 7] 1627 	ld	(hl),a
   6D87 23            [ 6] 1628 	inc	hl
   6D88 DD 7E FE      [19] 1629 	ld	a,-2 (ix)
   6D8B 77            [ 7] 1630 	ld	(hl),a
                           1631 ;src/main.c:332: enemy->iter = enemy->iter - 2;
   6D8C DD 5E FD      [19] 1632 	ld	e,-3 (ix)
   6D8F DD 56 FE      [19] 1633 	ld	d,-2 (ix)
   6D92 1B            [ 6] 1634 	dec	de
   6D93 1B            [ 6] 1635 	dec	de
   6D94 DD 6E FB      [19] 1636 	ld	l,-5 (ix)
   6D97 DD 66 FC      [19] 1637 	ld	h,-4 (ix)
   6D9A 73            [ 7] 1638 	ld	(hl),e
   6D9B 23            [ 6] 1639 	inc	hl
   6D9C 72            [ 7] 1640 	ld	(hl),d
                           1641 ;src/main.c:333: enemy->y = enemy->camino[enemy->iter];
   6D9D DD 6E F5      [19] 1642 	ld	l,-11 (ix)
   6DA0 DD 66 F6      [19] 1643 	ld	h,-10 (ix)
   6DA3 19            [11] 1644 	add	hl,de
   6DA4 5E            [ 7] 1645 	ld	e,(hl)
   6DA5 E1            [10] 1646 	pop	hl
   6DA6 E5            [11] 1647 	push	hl
   6DA7 73            [ 7] 1648 	ld	(hl),e
                           1649 ;src/main.c:334: --enemy->iter;
   6DA8 DD 7E FD      [19] 1650 	ld	a,-3 (ix)
   6DAB C6 FD         [ 7] 1651 	add	a,#0xFD
   6DAD 5F            [ 4] 1652 	ld	e,a
   6DAE DD 7E FE      [19] 1653 	ld	a,-2 (ix)
   6DB1 CE FF         [ 7] 1654 	adc	a,#0xFF
   6DB3 57            [ 4] 1655 	ld	d,a
   6DB4 DD 6E FB      [19] 1656 	ld	l,-5 (ix)
   6DB7 DD 66 FC      [19] 1657 	ld	h,-4 (ix)
   6DBA 73            [ 7] 1658 	ld	(hl),e
   6DBB 23            [ 6] 1659 	inc	hl
   6DBC 72            [ 7] 1660 	ld	(hl),d
                           1661 ;src/main.c:335: enemy->x = enemy->camino[enemy->iter];
   6DBD DD 6E F5      [19] 1662 	ld	l,-11 (ix)
   6DC0 DD 66 F6      [19] 1663 	ld	h,-10 (ix)
   6DC3 19            [11] 1664 	add	hl,de
   6DC4 7E            [ 7] 1665 	ld	a,(hl)
   6DC5 02            [ 7] 1666 	ld	(bc),a
                           1667 ;src/main.c:336: --enemy->iter;
   6DC6 DD 7E FD      [19] 1668 	ld	a,-3 (ix)
   6DC9 C6 FC         [ 7] 1669 	add	a,#0xFC
   6DCB 4F            [ 4] 1670 	ld	c,a
   6DCC DD 7E FE      [19] 1671 	ld	a,-2 (ix)
   6DCF CE FF         [ 7] 1672 	adc	a,#0xFF
   6DD1 47            [ 4] 1673 	ld	b,a
   6DD2 DD 6E FB      [19] 1674 	ld	l,-5 (ix)
   6DD5 DD 66 FC      [19] 1675 	ld	h,-4 (ix)
   6DD8 71            [ 7] 1676 	ld	(hl),c
   6DD9 23            [ 6] 1677 	inc	hl
   6DDA 70            [ 7] 1678 	ld	(hl),b
   6DDB 18 5E         [12] 1679 	jr	00118$
   6DDD                    1680 00108$:
                           1681 ;src/main.c:338: enemy->mover = SI;
   6DDD DD 6E F7      [19] 1682 	ld	l,-9 (ix)
   6DE0 DD 66 F8      [19] 1683 	ld	h,-8 (ix)
   6DE3 36 01         [10] 1684 	ld	(hl),#0x01
                           1685 ;src/main.c:339: enemy->y = enemy->camino[enemy->iter];
   6DE5 DD 6E FB      [19] 1686 	ld	l,-5 (ix)
   6DE8 DD 66 FC      [19] 1687 	ld	h,-4 (ix)
   6DEB 5E            [ 7] 1688 	ld	e,(hl)
   6DEC 23            [ 6] 1689 	inc	hl
   6DED 56            [ 7] 1690 	ld	d,(hl)
   6DEE DD 6E F5      [19] 1691 	ld	l,-11 (ix)
   6DF1 DD 66 F6      [19] 1692 	ld	h,-10 (ix)
   6DF4 19            [11] 1693 	add	hl,de
   6DF5 5E            [ 7] 1694 	ld	e,(hl)
   6DF6 E1            [10] 1695 	pop	hl
   6DF7 E5            [11] 1696 	push	hl
   6DF8 73            [ 7] 1697 	ld	(hl),e
                           1698 ;src/main.c:340: --enemy->iter;
   6DF9 DD 6E FB      [19] 1699 	ld	l,-5 (ix)
   6DFC DD 66 FC      [19] 1700 	ld	h,-4 (ix)
   6DFF 5E            [ 7] 1701 	ld	e,(hl)
   6E00 23            [ 6] 1702 	inc	hl
   6E01 56            [ 7] 1703 	ld	d,(hl)
   6E02 1B            [ 6] 1704 	dec	de
   6E03 DD 6E FB      [19] 1705 	ld	l,-5 (ix)
   6E06 DD 66 FC      [19] 1706 	ld	h,-4 (ix)
   6E09 73            [ 7] 1707 	ld	(hl),e
   6E0A 23            [ 6] 1708 	inc	hl
   6E0B 72            [ 7] 1709 	ld	(hl),d
                           1710 ;src/main.c:341: enemy->x = enemy->camino[enemy->iter];
   6E0C DD 6E F5      [19] 1711 	ld	l,-11 (ix)
   6E0F DD 66 F6      [19] 1712 	ld	h,-10 (ix)
   6E12 19            [11] 1713 	add	hl,de
   6E13 7E            [ 7] 1714 	ld	a,(hl)
   6E14 02            [ 7] 1715 	ld	(bc),a
                           1716 ;src/main.c:342: --enemy->iter;
   6E15 1B            [ 6] 1717 	dec	de
   6E16 DD 6E FB      [19] 1718 	ld	l,-5 (ix)
   6E19 DD 66 FC      [19] 1719 	ld	h,-4 (ix)
   6E1C 73            [ 7] 1720 	ld	(hl),e
   6E1D 23            [ 6] 1721 	inc	hl
   6E1E 72            [ 7] 1722 	ld	(hl),d
   6E1F 18 1A         [12] 1723 	jr	00118$
   6E21                    1724 00111$:
                           1725 ;src/main.c:346: enemy->mover = NO;
   6E21 DD 6E F7      [19] 1726 	ld	l,-9 (ix)
   6E24 DD 66 F8      [19] 1727 	ld	h,-8 (ix)
   6E27 36 00         [10] 1728 	ld	(hl),#0x00
                           1729 ;src/main.c:347: enemy->iter = 0;
   6E29 DD 6E FB      [19] 1730 	ld	l,-5 (ix)
   6E2C DD 66 FC      [19] 1731 	ld	h,-4 (ix)
   6E2F AF            [ 4] 1732 	xor	a, a
   6E30 77            [ 7] 1733 	ld	(hl), a
   6E31 23            [ 6] 1734 	inc	hl
   6E32 77            [ 7] 1735 	ld	(hl), a
                           1736 ;src/main.c:348: enemy->reversePatrol = 0;
   6E33 DD 6E F9      [19] 1737 	ld	l,-7 (ix)
   6E36 DD 66 FA      [19] 1738 	ld	h,-6 (ix)
   6E39 36 00         [10] 1739 	ld	(hl),#0x00
   6E3B                    1740 00118$:
   6E3B DD F9         [10] 1741 	ld	sp, ix
   6E3D DD E1         [14] 1742 	pop	ix
   6E3F C9            [10] 1743 	ret
                           1744 ;src/main.c:354: void lookFor(TEnemy* enemy){
                           1745 ;	---------------------------------
                           1746 ; Function lookFor
                           1747 ; ---------------------------------
   6E40                    1748 _lookFor::
   6E40 DD E5         [15] 1749 	push	ix
   6E42 DD 21 00 00   [14] 1750 	ld	ix,#0
   6E46 DD 39         [15] 1751 	add	ix,sp
   6E48 21 F9 FF      [10] 1752 	ld	hl,#-7
   6E4B 39            [11] 1753 	add	hl,sp
   6E4C F9            [ 6] 1754 	ld	sp,hl
                           1755 ;src/main.c:360: i16 difx = abs((i16)(enemy->x - prota.x));
   6E4D DD 5E 04      [19] 1756 	ld	e,4 (ix)
   6E50 DD 56 05      [19] 1757 	ld	d,5 (ix)
   6E53 1A            [ 7] 1758 	ld	a,(de)
   6E54 4F            [ 4] 1759 	ld	c,a
   6E55 06 00         [ 7] 1760 	ld	b,#0x00
   6E57 21 66 64      [10] 1761 	ld	hl,#_prota+0
   6E5A 6E            [ 7] 1762 	ld	l,(hl)
   6E5B 26 00         [ 7] 1763 	ld	h,#0x00
   6E5D 79            [ 4] 1764 	ld	a,c
   6E5E 95            [ 4] 1765 	sub	a, l
   6E5F 4F            [ 4] 1766 	ld	c,a
   6E60 78            [ 4] 1767 	ld	a,b
   6E61 9C            [ 4] 1768 	sbc	a, h
   6E62 47            [ 4] 1769 	ld	b,a
   6E63 D5            [11] 1770 	push	de
   6E64 C5            [11] 1771 	push	bc
   6E65 CD B5 4B      [17] 1772 	call	_abs
   6E68 F1            [10] 1773 	pop	af
   6E69 D1            [10] 1774 	pop	de
   6E6A DD 75 FA      [19] 1775 	ld	-6 (ix),l
   6E6D DD 74 FB      [19] 1776 	ld	-5 (ix),h
                           1777 ;src/main.c:361: i16 dify = abs((i16)(enemy->y - prota.y));
   6E70 21 01 00      [10] 1778 	ld	hl,#0x0001
   6E73 19            [11] 1779 	add	hl,de
   6E74 DD 75 FE      [19] 1780 	ld	-2 (ix),l
   6E77 DD 74 FF      [19] 1781 	ld	-1 (ix),h
   6E7A DD 6E FE      [19] 1782 	ld	l,-2 (ix)
   6E7D DD 66 FF      [19] 1783 	ld	h,-1 (ix)
   6E80 4E            [ 7] 1784 	ld	c,(hl)
   6E81 06 00         [ 7] 1785 	ld	b,#0x00
   6E83 21 67 64      [10] 1786 	ld	hl, #(_prota + 0x0001) + 0
   6E86 6E            [ 7] 1787 	ld	l,(hl)
   6E87 26 00         [ 7] 1788 	ld	h,#0x00
   6E89 79            [ 4] 1789 	ld	a,c
   6E8A 95            [ 4] 1790 	sub	a, l
   6E8B 4F            [ 4] 1791 	ld	c,a
   6E8C 78            [ 4] 1792 	ld	a,b
   6E8D 9C            [ 4] 1793 	sbc	a, h
   6E8E 47            [ 4] 1794 	ld	b,a
   6E8F D5            [11] 1795 	push	de
   6E90 C5            [11] 1796 	push	bc
   6E91 CD B5 4B      [17] 1797 	call	_abs
   6E94 F1            [10] 1798 	pop	af
   6E95 D1            [10] 1799 	pop	de
                           1800 ;src/main.c:363: dist = difx + dify; // manhattan
   6E96 DD 4E FA      [19] 1801 	ld	c,-6 (ix)
   6E99 09            [11] 1802 	add	hl, bc
   6E9A DD 75 F9      [19] 1803 	ld	-7 (ix),l
                           1804 ;src/main.c:364: enemy->seen = NO;
   6E9D 21 11 00      [10] 1805 	ld	hl,#0x0011
   6EA0 19            [11] 1806 	add	hl,de
   6EA1 DD 75 FC      [19] 1807 	ld	-4 (ix),l
   6EA4 DD 74 FD      [19] 1808 	ld	-3 (ix),h
   6EA7 DD 6E FC      [19] 1809 	ld	l,-4 (ix)
   6EAA DD 66 FD      [19] 1810 	ld	h,-3 (ix)
   6EAD 36 00         [10] 1811 	ld	(hl),#0x00
                           1812 ;src/main.c:365: enemy->in_range = NO;
   6EAF 21 10 00      [10] 1813 	ld	hl,#0x0010
   6EB2 19            [11] 1814 	add	hl,de
   6EB3 4D            [ 4] 1815 	ld	c,l
   6EB4 44            [ 4] 1816 	ld	b,h
   6EB5 AF            [ 4] 1817 	xor	a, a
   6EB6 02            [ 7] 1818 	ld	(bc),a
                           1819 ;src/main.c:367: if(!enemy->seek){
   6EB7 D5            [11] 1820 	push	de
   6EB8 FD E1         [14] 1821 	pop	iy
   6EBA FD 7E 13      [19] 1822 	ld	a,19 (iy)
   6EBD B7            [ 4] 1823 	or	a, a
   6EBE C2 44 6F      [10] 1824 	jp	NZ,00111$
                           1825 ;src/main.c:368: if (dist <= 17) {// te detectan los sensores de proximidad
   6EC1 3E 11         [ 7] 1826 	ld	a,#0x11
   6EC3 DD 96 F9      [19] 1827 	sub	a, -7 (ix)
   6EC6 38 13         [12] 1828 	jr	C,00107$
                           1829 ;src/main.c:369: enemy->in_range = 1;
   6EC8 3E 01         [ 7] 1830 	ld	a,#0x01
   6ECA 02            [ 7] 1831 	ld	(bc),a
                           1832 ;src/main.c:370: enemy->engage = 1;
   6ECB 21 15 00      [10] 1833 	ld	hl,#0x0015
   6ECE 19            [11] 1834 	add	hl,de
   6ECF 36 01         [10] 1835 	ld	(hl),#0x01
                           1836 ;src/main.c:371: enemy->seen = SI;
   6ED1 DD 6E FC      [19] 1837 	ld	l,-4 (ix)
   6ED4 DD 66 FD      [19] 1838 	ld	h,-3 (ix)
   6ED7 36 01         [10] 1839 	ld	(hl),#0x01
   6ED9 18 69         [12] 1840 	jr	00111$
   6EDB                    1841 00107$:
                           1842 ;src/main.c:372: }else if(prota.x > enemy->x - 20 && prota.x < enemy->x + 20
   6EDB 21 66 64      [10] 1843 	ld	hl, #_prota + 0
   6EDE 4E            [ 7] 1844 	ld	c,(hl)
   6EDF 1A            [ 7] 1845 	ld	a,(de)
   6EE0 5F            [ 4] 1846 	ld	e,a
   6EE1 16 00         [ 7] 1847 	ld	d,#0x00
   6EE3 7B            [ 4] 1848 	ld	a,e
   6EE4 C6 EC         [ 7] 1849 	add	a,#0xEC
   6EE6 6F            [ 4] 1850 	ld	l,a
   6EE7 7A            [ 4] 1851 	ld	a,d
   6EE8 CE FF         [ 7] 1852 	adc	a,#0xFF
   6EEA 67            [ 4] 1853 	ld	h,a
   6EEB 06 00         [ 7] 1854 	ld	b,#0x00
   6EED 7D            [ 4] 1855 	ld	a,l
   6EEE 91            [ 4] 1856 	sub	a, c
   6EEF 7C            [ 4] 1857 	ld	a,h
   6EF0 98            [ 4] 1858 	sbc	a, b
   6EF1 E2 F6 6E      [10] 1859 	jp	PO, 00137$
   6EF4 EE 80         [ 7] 1860 	xor	a, #0x80
   6EF6                    1861 00137$:
   6EF6 F2 44 6F      [10] 1862 	jp	P,00111$
   6EF9 21 14 00      [10] 1863 	ld	hl,#0x0014
   6EFC 19            [11] 1864 	add	hl,de
   6EFD 79            [ 4] 1865 	ld	a,c
   6EFE 95            [ 4] 1866 	sub	a, l
   6EFF 78            [ 4] 1867 	ld	a,b
   6F00 9C            [ 4] 1868 	sbc	a, h
   6F01 E2 06 6F      [10] 1869 	jp	PO, 00138$
   6F04 EE 80         [ 7] 1870 	xor	a, #0x80
   6F06                    1871 00138$:
   6F06 F2 44 6F      [10] 1872 	jp	P,00111$
                           1873 ;src/main.c:373: && prota.y > enemy->y - 20*2 && prota.y < enemy->y + 20*2){
   6F09 21 67 64      [10] 1874 	ld	hl, #(_prota + 0x0001) + 0
   6F0C 4E            [ 7] 1875 	ld	c,(hl)
   6F0D DD 6E FE      [19] 1876 	ld	l,-2 (ix)
   6F10 DD 66 FF      [19] 1877 	ld	h,-1 (ix)
   6F13 5E            [ 7] 1878 	ld	e,(hl)
   6F14 16 00         [ 7] 1879 	ld	d,#0x00
   6F16 7B            [ 4] 1880 	ld	a,e
   6F17 C6 D8         [ 7] 1881 	add	a,#0xD8
   6F19 6F            [ 4] 1882 	ld	l,a
   6F1A 7A            [ 4] 1883 	ld	a,d
   6F1B CE FF         [ 7] 1884 	adc	a,#0xFF
   6F1D 67            [ 4] 1885 	ld	h,a
   6F1E 06 00         [ 7] 1886 	ld	b,#0x00
   6F20 7D            [ 4] 1887 	ld	a,l
   6F21 91            [ 4] 1888 	sub	a, c
   6F22 7C            [ 4] 1889 	ld	a,h
   6F23 98            [ 4] 1890 	sbc	a, b
   6F24 E2 29 6F      [10] 1891 	jp	PO, 00139$
   6F27 EE 80         [ 7] 1892 	xor	a, #0x80
   6F29                    1893 00139$:
   6F29 F2 44 6F      [10] 1894 	jp	P,00111$
   6F2C 21 28 00      [10] 1895 	ld	hl,#0x0028
   6F2F 19            [11] 1896 	add	hl,de
   6F30 79            [ 4] 1897 	ld	a,c
   6F31 95            [ 4] 1898 	sub	a, l
   6F32 78            [ 4] 1899 	ld	a,b
   6F33 9C            [ 4] 1900 	sbc	a, h
   6F34 E2 39 6F      [10] 1901 	jp	PO, 00140$
   6F37 EE 80         [ 7] 1902 	xor	a, #0x80
   6F39                    1903 00140$:
   6F39 F2 44 6F      [10] 1904 	jp	P,00111$
                           1905 ;src/main.c:374: enemy->seen = SI;
   6F3C DD 6E FC      [19] 1906 	ld	l,-4 (ix)
   6F3F DD 66 FD      [19] 1907 	ld	h,-3 (ix)
   6F42 36 01         [10] 1908 	ld	(hl),#0x01
   6F44                    1909 00111$:
   6F44 DD F9         [10] 1910 	ld	sp, ix
   6F46 DD E1         [14] 1911 	pop	ix
   6F48 C9            [10] 1912 	ret
                           1913 ;src/main.c:379: void moverEnemigoSeek(TEnemy* actual){
                           1914 ;	---------------------------------
                           1915 ; Function moverEnemigoSeek
                           1916 ; ---------------------------------
   6F49                    1917 _moverEnemigoSeek::
   6F49 DD E5         [15] 1918 	push	ix
   6F4B DD 21 00 00   [14] 1919 	ld	ix,#0
   6F4F DD 39         [15] 1920 	add	ix,sp
   6F51 21 F6 FF      [10] 1921 	ld	hl,#-10
   6F54 39            [11] 1922 	add	hl,sp
   6F55 F9            [ 6] 1923 	ld	sp,hl
                           1924 ;src/main.c:381: if(!actual->muerto){
   6F56 DD 4E 04      [19] 1925 	ld	c,4 (ix)
   6F59 DD 46 05      [19] 1926 	ld	b,5 (ix)
   6F5C C5            [11] 1927 	push	bc
   6F5D FD E1         [14] 1928 	pop	iy
   6F5F FD 7E 08      [19] 1929 	ld	a, 8 (iy)
   6F62 B7            [ 4] 1930 	or	a, a
   6F63 C2 F6 70      [10] 1931 	jp	NZ,00114$
                           1932 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6F66 21 0D 00      [10] 1933 	ld	hl,#0x000D
   6F69 09            [11] 1934 	add	hl,bc
   6F6A DD 75 FE      [19] 1935 	ld	-2 (ix),l
   6F6D DD 74 FF      [19] 1936 	ld	-1 (ix),h
   6F70 DD 6E FE      [19] 1937 	ld	l,-2 (ix)
   6F73 DD 66 FF      [19] 1938 	ld	h,-1 (ix)
   6F76 7E            [ 7] 1939 	ld	a,(hl)
   6F77 DD 77 FC      [19] 1940 	ld	-4 (ix),a
   6F7A 23            [ 6] 1941 	inc	hl
   6F7B 7E            [ 7] 1942 	ld	a,(hl)
   6F7C DD 77 FD      [19] 1943 	ld	-3 (ix),a
   6F7F 69            [ 4] 1944 	ld	l, c
   6F80 60            [ 4] 1945 	ld	h, b
   6F81 11 E2 00      [10] 1946 	ld	de, #0x00E2
   6F84 19            [11] 1947 	add	hl, de
   6F85 5E            [ 7] 1948 	ld	e,(hl)
   6F86 16 00         [ 7] 1949 	ld	d,#0x00
                           1950 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6F88 21 01 00      [10] 1951 	ld	hl,#0x0001
   6F8B 09            [11] 1952 	add	hl,bc
   6F8C DD 75 FA      [19] 1953 	ld	-6 (ix),l
   6F8F DD 74 FB      [19] 1954 	ld	-5 (ix),h
                           1955 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6F92 DD 7E FC      [19] 1956 	ld	a,-4 (ix)
   6F95 93            [ 4] 1957 	sub	a, e
   6F96 DD 7E FD      [19] 1958 	ld	a,-3 (ix)
   6F99 9A            [ 4] 1959 	sbc	a, d
   6F9A E2 9F 6F      [10] 1960 	jp	PO, 00136$
   6F9D EE 80         [ 7] 1961 	xor	a, #0x80
   6F9F                    1962 00136$:
   6F9F F2 33 70      [10] 1963 	jp	P,00110$
                           1964 ;src/main.c:389: actual->mover = SI;
   6FA2 21 06 00      [10] 1965 	ld	hl,#0x0006
   6FA5 09            [11] 1966 	add	hl,bc
                           1967 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6FA6 79            [ 4] 1968 	ld	a,c
   6FA7 C6 1A         [ 7] 1969 	add	a, #0x1A
   6FA9 5F            [ 4] 1970 	ld	e,a
   6FAA 78            [ 4] 1971 	ld	a,b
   6FAB CE 00         [ 7] 1972 	adc	a, #0x00
   6FAD 57            [ 4] 1973 	ld	d,a
                           1974 ;src/main.c:387: if(actual->iter == 0){
   6FAE DD 7E FD      [19] 1975 	ld	a,-3 (ix)
   6FB1 DD B6 FC      [19] 1976 	or	a,-4 (ix)
   6FB4 20 44         [12] 1977 	jr	NZ,00102$
                           1978 ;src/main.c:389: actual->mover = SI;
   6FB6 36 01         [10] 1979 	ld	(hl),#0x01
                           1980 ;src/main.c:390: actual->iter = 2;
   6FB8 DD 6E FE      [19] 1981 	ld	l,-2 (ix)
   6FBB DD 66 FF      [19] 1982 	ld	h,-1 (ix)
   6FBE 36 02         [10] 1983 	ld	(hl),#0x02
   6FC0 23            [ 6] 1984 	inc	hl
   6FC1 36 00         [10] 1985 	ld	(hl),#0x00
                           1986 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6FC3 DD 6E FE      [19] 1987 	ld	l,-2 (ix)
   6FC6 DD 66 FF      [19] 1988 	ld	h,-1 (ix)
   6FC9 7E            [ 7] 1989 	ld	a, (hl)
   6FCA 23            [ 6] 1990 	inc	hl
   6FCB 66            [ 7] 1991 	ld	h,(hl)
   6FCC 6F            [ 4] 1992 	ld	l,a
   6FCD 19            [11] 1993 	add	hl,de
   6FCE 7E            [ 7] 1994 	ld	a,(hl)
   6FCF 02            [ 7] 1995 	ld	(bc),a
                           1996 ;src/main.c:392: ++actual->iter;
   6FD0 DD 6E FE      [19] 1997 	ld	l,-2 (ix)
   6FD3 DD 66 FF      [19] 1998 	ld	h,-1 (ix)
   6FD6 4E            [ 7] 1999 	ld	c,(hl)
   6FD7 23            [ 6] 2000 	inc	hl
   6FD8 46            [ 7] 2001 	ld	b,(hl)
   6FD9 03            [ 6] 2002 	inc	bc
   6FDA DD 6E FE      [19] 2003 	ld	l,-2 (ix)
   6FDD DD 66 FF      [19] 2004 	ld	h,-1 (ix)
   6FE0 71            [ 7] 2005 	ld	(hl),c
   6FE1 23            [ 6] 2006 	inc	hl
   6FE2 70            [ 7] 2007 	ld	(hl),b
                           2008 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6FE3 EB            [ 4] 2009 	ex	de,hl
   6FE4 09            [11] 2010 	add	hl,bc
   6FE5 5E            [ 7] 2011 	ld	e,(hl)
   6FE6 DD 6E FA      [19] 2012 	ld	l,-6 (ix)
   6FE9 DD 66 FB      [19] 2013 	ld	h,-5 (ix)
   6FEC 73            [ 7] 2014 	ld	(hl),e
                           2015 ;src/main.c:394: ++actual->iter;
   6FED 03            [ 6] 2016 	inc	bc
   6FEE DD 6E FE      [19] 2017 	ld	l,-2 (ix)
   6FF1 DD 66 FF      [19] 2018 	ld	h,-1 (ix)
   6FF4 71            [ 7] 2019 	ld	(hl),c
   6FF5 23            [ 6] 2020 	inc	hl
   6FF6 70            [ 7] 2021 	ld	(hl),b
   6FF7 C3 F6 70      [10] 2022 	jp	00114$
   6FFA                    2023 00102$:
                           2024 ;src/main.c:397: actual->mover = SI;
   6FFA 36 01         [10] 2025 	ld	(hl),#0x01
                           2026 ;src/main.c:398: actual->x = actual->camino[actual->iter];
   6FFC DD 6E FE      [19] 2027 	ld	l,-2 (ix)
   6FFF DD 66 FF      [19] 2028 	ld	h,-1 (ix)
   7002 7E            [ 7] 2029 	ld	a, (hl)
   7003 23            [ 6] 2030 	inc	hl
   7004 66            [ 7] 2031 	ld	h,(hl)
   7005 6F            [ 4] 2032 	ld	l,a
   7006 19            [11] 2033 	add	hl,de
   7007 7E            [ 7] 2034 	ld	a,(hl)
   7008 02            [ 7] 2035 	ld	(bc),a
                           2036 ;src/main.c:399: ++actual->iter;
   7009 DD 6E FE      [19] 2037 	ld	l,-2 (ix)
   700C DD 66 FF      [19] 2038 	ld	h,-1 (ix)
   700F 4E            [ 7] 2039 	ld	c,(hl)
   7010 23            [ 6] 2040 	inc	hl
   7011 46            [ 7] 2041 	ld	b,(hl)
   7012 03            [ 6] 2042 	inc	bc
   7013 DD 6E FE      [19] 2043 	ld	l,-2 (ix)
   7016 DD 66 FF      [19] 2044 	ld	h,-1 (ix)
   7019 71            [ 7] 2045 	ld	(hl),c
   701A 23            [ 6] 2046 	inc	hl
   701B 70            [ 7] 2047 	ld	(hl),b
                           2048 ;src/main.c:400: actual->y = actual->camino[actual->iter];
   701C EB            [ 4] 2049 	ex	de,hl
   701D 09            [11] 2050 	add	hl,bc
   701E 5E            [ 7] 2051 	ld	e,(hl)
   701F DD 6E FA      [19] 2052 	ld	l,-6 (ix)
   7022 DD 66 FB      [19] 2053 	ld	h,-5 (ix)
   7025 73            [ 7] 2054 	ld	(hl),e
                           2055 ;src/main.c:401: ++actual->iter;
   7026 03            [ 6] 2056 	inc	bc
   7027 DD 6E FE      [19] 2057 	ld	l,-2 (ix)
   702A DD 66 FF      [19] 2058 	ld	h,-1 (ix)
   702D 71            [ 7] 2059 	ld	(hl),c
   702E 23            [ 6] 2060 	inc	hl
   702F 70            [ 7] 2061 	ld	(hl),b
   7030 C3 F6 70      [10] 2062 	jp	00114$
   7033                    2063 00110$:
                           2064 ;src/main.c:407: actual->seek = 0;
   7033 21 13 00      [10] 2065 	ld	hl,#0x0013
   7036 09            [11] 2066 	add	hl,bc
   7037 DD 75 FC      [19] 2067 	ld	-4 (ix),l
   703A DD 74 FD      [19] 2068 	ld	-3 (ix),h
   703D DD 6E FC      [19] 2069 	ld	l,-4 (ix)
   7040 DD 66 FD      [19] 2070 	ld	h,-3 (ix)
   7043 36 00         [10] 2071 	ld	(hl),#0x00
                           2072 ;src/main.c:408: lookFor(actual);
   7045 C5            [11] 2073 	push	bc
   7046 C5            [11] 2074 	push	bc
   7047 CD 40 6E      [17] 2075 	call	_lookFor
   704A F1            [10] 2076 	pop	af
   704B C1            [10] 2077 	pop	bc
                           2078 ;src/main.c:409: if(!actual->seen){
   704C 69            [ 4] 2079 	ld	l, c
   704D 60            [ 4] 2080 	ld	h, b
   704E 11 11 00      [10] 2081 	ld	de, #0x0011
   7051 19            [11] 2082 	add	hl, de
   7052 7E            [ 7] 2083 	ld	a,(hl)
   7053 DD 77 F9      [19] 2084 	ld	-7 (ix),a
                           2085 ;src/main.c:410: actual->patrolling = 1;
   7056 21 0A 00      [10] 2086 	ld	hl,#0x000A
   7059 09            [11] 2087 	add	hl,bc
   705A DD 75 F7      [19] 2088 	ld	-9 (ix),l
   705D DD 74 F8      [19] 2089 	ld	-8 (ix),h
                           2090 ;src/main.c:409: if(!actual->seen){
   7060 DD 7E F9      [19] 2091 	ld	a,-7 (ix)
   7063 B7            [ 4] 2092 	or	a, a
   7064 20 3C         [12] 2093 	jr	NZ,00107$
                           2094 ;src/main.c:410: actual->patrolling = 1;
   7066 DD 6E F7      [19] 2095 	ld	l,-9 (ix)
   7069 DD 66 F8      [19] 2096 	ld	h,-8 (ix)
   706C 36 01         [10] 2097 	ld	(hl),#0x01
                           2098 ;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   706E C5            [11] 2099 	push	bc
   706F FD E1         [14] 2100 	pop	iy
   7071 FD 7E 18      [19] 2101 	ld	a,24 (iy)
   7074 DD 77 F9      [19] 2102 	ld	-7 (ix),a
   7077 C5            [11] 2103 	push	bc
   7078 FD E1         [14] 2104 	pop	iy
   707A FD 56 17      [19] 2105 	ld	d,23 (iy)
   707D DD 6E FA      [19] 2106 	ld	l,-6 (ix)
   7080 DD 66 FB      [19] 2107 	ld	h,-5 (ix)
   7083 5E            [ 7] 2108 	ld	e,(hl)
   7084 0A            [ 7] 2109 	ld	a,(bc)
   7085 DD 77 F6      [19] 2110 	ld	-10 (ix),a
   7088 2A 48 65      [16] 2111 	ld	hl,(_mapa)
   708B E5            [11] 2112 	push	hl
   708C C5            [11] 2113 	push	bc
   708D DD 7E F9      [19] 2114 	ld	a,-7 (ix)
   7090 F5            [11] 2115 	push	af
   7091 33            [ 6] 2116 	inc	sp
   7092 D5            [11] 2117 	push	de
   7093 DD 7E F6      [19] 2118 	ld	a,-10 (ix)
   7096 F5            [11] 2119 	push	af
   7097 33            [ 6] 2120 	inc	sp
   7098 CD 72 49      [17] 2121 	call	_pathFinding
   709B 21 08 00      [10] 2122 	ld	hl,#8
   709E 39            [11] 2123 	add	hl,sp
   709F F9            [ 6] 2124 	ld	sp,hl
   70A0 18 4A         [12] 2125 	jr	00108$
   70A2                    2126 00107$:
                           2127 ;src/main.c:413: actual->patrolling = 0;
   70A2 DD 6E F7      [19] 2128 	ld	l,-9 (ix)
   70A5 DD 66 F8      [19] 2129 	ld	h,-8 (ix)
   70A8 36 00         [10] 2130 	ld	(hl),#0x00
                           2131 ;src/main.c:414: if(!actual->engage){
   70AA C5            [11] 2132 	push	bc
   70AB FD E1         [14] 2133 	pop	iy
   70AD FD 7E 15      [19] 2134 	ld	a,21 (iy)
   70B0 B7            [ 4] 2135 	or	a, a
   70B1 20 39         [12] 2136 	jr	NZ,00108$
                           2137 ;src/main.c:415: actual->seek = 1;
   70B3 DD 6E FC      [19] 2138 	ld	l,-4 (ix)
   70B6 DD 66 FD      [19] 2139 	ld	h,-3 (ix)
   70B9 36 01         [10] 2140 	ld	(hl),#0x01
                           2141 ;src/main.c:416: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   70BB 3A 67 64      [13] 2142 	ld	a,(#_prota + 1)
   70BE DD 77 F6      [19] 2143 	ld	-10 (ix),a
   70C1 21 66 64      [10] 2144 	ld	hl, #_prota + 0
   70C4 5E            [ 7] 2145 	ld	e,(hl)
   70C5 DD 6E FA      [19] 2146 	ld	l,-6 (ix)
   70C8 DD 66 FB      [19] 2147 	ld	h,-5 (ix)
   70CB 56            [ 7] 2148 	ld	d,(hl)
   70CC 0A            [ 7] 2149 	ld	a,(bc)
   70CD DD 77 F7      [19] 2150 	ld	-9 (ix),a
   70D0 2A 48 65      [16] 2151 	ld	hl,(_mapa)
   70D3 E5            [11] 2152 	push	hl
   70D4 C5            [11] 2153 	push	bc
   70D5 DD 7E F6      [19] 2154 	ld	a,-10 (ix)
   70D8 F5            [11] 2155 	push	af
   70D9 33            [ 6] 2156 	inc	sp
   70DA 7B            [ 4] 2157 	ld	a,e
   70DB F5            [11] 2158 	push	af
   70DC 33            [ 6] 2159 	inc	sp
   70DD D5            [11] 2160 	push	de
   70DE 33            [ 6] 2161 	inc	sp
   70DF DD 7E F7      [19] 2162 	ld	a,-9 (ix)
   70E2 F5            [11] 2163 	push	af
   70E3 33            [ 6] 2164 	inc	sp
   70E4 CD 72 49      [17] 2165 	call	_pathFinding
   70E7 21 08 00      [10] 2166 	ld	hl,#8
   70EA 39            [11] 2167 	add	hl,sp
   70EB F9            [ 6] 2168 	ld	sp,hl
   70EC                    2169 00108$:
                           2170 ;src/main.c:419: actual->iter = 0;
   70EC DD 6E FE      [19] 2171 	ld	l,-2 (ix)
   70EF DD 66 FF      [19] 2172 	ld	h,-1 (ix)
   70F2 AF            [ 4] 2173 	xor	a, a
   70F3 77            [ 7] 2174 	ld	(hl), a
   70F4 23            [ 6] 2175 	inc	hl
   70F5 77            [ 7] 2176 	ld	(hl), a
   70F6                    2177 00114$:
   70F6 DD F9         [10] 2178 	ld	sp, ix
   70F8 DD E1         [14] 2179 	pop	ix
   70FA C9            [10] 2180 	ret
                           2181 ;src/main.c:425: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2182 ;	---------------------------------
                           2183 ; Function engage
                           2184 ; ---------------------------------
   70FB                    2185 _engage::
   70FB DD E5         [15] 2186 	push	ix
   70FD DD 21 00 00   [14] 2187 	ld	ix,#0
   7101 DD 39         [15] 2188 	add	ix,sp
   7103 21 F0 FF      [10] 2189 	ld	hl,#-16
   7106 39            [11] 2190 	add	hl,sp
   7107 F9            [ 6] 2191 	ld	sp,hl
                           2192 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7108 DD 7E 04      [19] 2193 	ld	a,4 (ix)
   710B DD 77 F4      [19] 2194 	ld	-12 (ix),a
   710E DD 7E 05      [19] 2195 	ld	a,5 (ix)
   7111 DD 77 F5      [19] 2196 	ld	-11 (ix),a
   7114 DD 6E F4      [19] 2197 	ld	l,-12 (ix)
   7117 DD 66 F5      [19] 2198 	ld	h,-11 (ix)
   711A 4E            [ 7] 2199 	ld	c,(hl)
   711B 06 00         [ 7] 2200 	ld	b,#0x00
   711D 21 66 64      [10] 2201 	ld	hl,#_prota+0
   7120 5E            [ 7] 2202 	ld	e,(hl)
   7121 16 00         [ 7] 2203 	ld	d,#0x00
   7123 79            [ 4] 2204 	ld	a,c
   7124 93            [ 4] 2205 	sub	a, e
   7125 4F            [ 4] 2206 	ld	c,a
   7126 78            [ 4] 2207 	ld	a,b
   7127 9A            [ 4] 2208 	sbc	a, d
   7128 47            [ 4] 2209 	ld	b,a
   7129 C5            [11] 2210 	push	bc
   712A CD B5 4B      [17] 2211 	call	_abs
   712D F1            [10] 2212 	pop	af
   712E 4D            [ 4] 2213 	ld	c,l
                           2214 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   712F DD 7E F4      [19] 2215 	ld	a,-12 (ix)
   7132 C6 01         [ 7] 2216 	add	a, #0x01
   7134 DD 77 F6      [19] 2217 	ld	-10 (ix),a
   7137 DD 7E F5      [19] 2218 	ld	a,-11 (ix)
   713A CE 00         [ 7] 2219 	adc	a, #0x00
   713C DD 77 F7      [19] 2220 	ld	-9 (ix),a
   713F DD 6E F6      [19] 2221 	ld	l,-10 (ix)
   7142 DD 66 F7      [19] 2222 	ld	h,-9 (ix)
   7145 5E            [ 7] 2223 	ld	e,(hl)
   7146 16 00         [ 7] 2224 	ld	d,#0x00
   7148 21 67 64      [10] 2225 	ld	hl, #_prota + 1
   714B 6E            [ 7] 2226 	ld	l,(hl)
   714C 26 00         [ 7] 2227 	ld	h,#0x00
   714E 7B            [ 4] 2228 	ld	a,e
   714F 95            [ 4] 2229 	sub	a, l
   7150 5F            [ 4] 2230 	ld	e,a
   7151 7A            [ 4] 2231 	ld	a,d
   7152 9C            [ 4] 2232 	sbc	a, h
   7153 57            [ 4] 2233 	ld	d,a
   7154 C5            [11] 2234 	push	bc
   7155 D5            [11] 2235 	push	de
   7156 CD B5 4B      [17] 2236 	call	_abs
   7159 F1            [10] 2237 	pop	af
   715A C1            [10] 2238 	pop	bc
                           2239 ;src/main.c:428: u8 dist = difx + dify; // manhattan
   715B 09            [11] 2240 	add	hl, bc
   715C DD 75 F0      [19] 2241 	ld	-16 (ix),l
                           2242 ;src/main.c:430: u8 movX = 0;
   715F DD 36 F3 00   [19] 2243 	ld	-13 (ix),#0x00
                           2244 ;src/main.c:431: u8 movY = 0;
   7163 DD 36 F2 00   [19] 2245 	ld	-14 (ix),#0x00
                           2246 ;src/main.c:432: u8 distConstraint = 25;
   7167 DD 36 F1 19   [19] 2247 	ld	-15 (ix),#0x19
                           2248 ;src/main.c:433: enemy->mover = NO;
   716B DD 7E F4      [19] 2249 	ld	a,-12 (ix)
   716E C6 06         [ 7] 2250 	add	a, #0x06
   7170 DD 77 F8      [19] 2251 	ld	-8 (ix),a
   7173 DD 7E F5      [19] 2252 	ld	a,-11 (ix)
   7176 CE 00         [ 7] 2253 	adc	a, #0x00
   7178 DD 77 F9      [19] 2254 	ld	-7 (ix),a
   717B DD 6E F8      [19] 2255 	ld	l,-8 (ix)
   717E DD 66 F9      [19] 2256 	ld	h,-7 (ix)
   7181 36 00         [10] 2257 	ld	(hl),#0x00
                           2258 ;src/main.c:443: enemy->didDamage = 1;
   7183 DD 7E F4      [19] 2259 	ld	a,-12 (ix)
   7186 C6 16         [ 7] 2260 	add	a, #0x16
   7188 4F            [ 4] 2261 	ld	c,a
   7189 DD 7E F5      [19] 2262 	ld	a,-11 (ix)
   718C CE 00         [ 7] 2263 	adc	a, #0x00
   718E 47            [ 4] 2264 	ld	b,a
                           2265 ;src/main.c:435: if (dist < 20) {
   718F DD 7E F0      [19] 2266 	ld	a,-16 (ix)
   7192 D6 14         [ 7] 2267 	sub	a, #0x14
   7194 30 3B         [12] 2268 	jr	NC,00107$
                           2269 ;src/main.c:436: vidas--;
   7196 21 7D 64      [10] 2270 	ld	hl, #_vidas+0
   7199 35            [11] 2271 	dec	(hl)
                           2272 ;src/main.c:437: if(vidas % 20 == 0){
   719A C5            [11] 2273 	push	bc
   719B 3E 14         [ 7] 2274 	ld	a,#0x14
   719D F5            [11] 2275 	push	af
   719E 33            [ 6] 2276 	inc	sp
   719F 3A 7D 64      [13] 2277 	ld	a,(_vidas)
   71A2 F5            [11] 2278 	push	af
   71A3 33            [ 6] 2279 	inc	sp
   71A4 CD 81 56      [17] 2280 	call	__moduchar
   71A7 F1            [10] 2281 	pop	af
   71A8 C1            [10] 2282 	pop	bc
   71A9 7D            [ 4] 2283 	ld	a,l
   71AA B7            [ 4] 2284 	or	a, a
   71AB 20 21         [12] 2285 	jr	NZ,00105$
                           2286 ;src/main.c:438: if (vidas == 0) {
   71AD 3A 7D 64      [13] 2287 	ld	a,(#_vidas + 0)
   71B0 B7            [ 4] 2288 	or	a, a
   71B1 20 10         [12] 2289 	jr	NZ,00102$
                           2290 ;src/main.c:439: menuFin(puntuacion);
   71B3 FD 21 4B 65   [14] 2291 	ld	iy,#_puntuacion
   71B7 FD 6E 00      [19] 2292 	ld	l,0 (iy)
   71BA 26 00         [ 7] 2293 	ld	h,#0x00
   71BC C5            [11] 2294 	push	bc
   71BD CD F5 4B      [17] 2295 	call	_menuFin
   71C0 C1            [10] 2296 	pop	bc
   71C1 18 0B         [12] 2297 	jr	00105$
   71C3                    2298 00102$:
                           2299 ;src/main.c:441: modificarVidas(vidas);
   71C3 C5            [11] 2300 	push	bc
   71C4 3A 7D 64      [13] 2301 	ld	a,(_vidas)
   71C7 F5            [11] 2302 	push	af
   71C8 33            [ 6] 2303 	inc	sp
   71C9 CD 38 53      [17] 2304 	call	_modificarVidas
   71CC 33            [ 6] 2305 	inc	sp
   71CD C1            [10] 2306 	pop	bc
   71CE                    2307 00105$:
                           2308 ;src/main.c:443: enemy->didDamage = 1;
   71CE 3E 01         [ 7] 2309 	ld	a,#0x01
   71D0 02            [ 7] 2310 	ld	(bc),a
   71D1                    2311 00107$:
                           2312 ;src/main.c:445: if (!enemy->didDamage) {
   71D1 0A            [ 7] 2313 	ld	a,(bc)
   71D2 B7            [ 4] 2314 	or	a, a
   71D3 C2 09 79      [10] 2315 	jp	NZ,00208$
                           2316 ;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   71D6 DD 6E F6      [19] 2317 	ld	l,-10 (ix)
   71D9 DD 66 F7      [19] 2318 	ld	h,-9 (ix)
   71DC 4E            [ 7] 2319 	ld	c,(hl)
                           2320 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71DD DD 6E F4      [19] 2321 	ld	l,-12 (ix)
   71E0 DD 66 F5      [19] 2322 	ld	h,-11 (ix)
   71E3 7E            [ 7] 2323 	ld	a,(hl)
                           2324 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   71E4 DD 77 FA      [19] 2325 	ld	-6 (ix), a
   71E7 C6 04         [ 7] 2326 	add	a, #0x04
   71E9 DD 77 FB      [19] 2327 	ld	-5 (ix),a
                           2328 ;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   71EC DD 7E 07      [19] 2329 	ld	a,7 (ix)
   71EF 91            [ 4] 2330 	sub	a, c
   71F0 28 35         [12] 2331 	jr	Z,00201$
   71F2 DD 5E 07      [19] 2332 	ld	e,7 (ix)
   71F5 16 00         [ 7] 2333 	ld	d,#0x00
   71F7 21 01 00      [10] 2334 	ld	hl,#0x0001
   71FA 19            [11] 2335 	add	hl,de
   71FB DD 75 FC      [19] 2336 	ld	-4 (ix),l
   71FE DD 74 FD      [19] 2337 	ld	-3 (ix),h
   7201 DD 71 FE      [19] 2338 	ld	-2 (ix),c
   7204 DD 36 FF 00   [19] 2339 	ld	-1 (ix),#0x00
   7208 DD 7E FC      [19] 2340 	ld	a,-4 (ix)
   720B DD 96 FE      [19] 2341 	sub	a, -2 (ix)
   720E 20 08         [12] 2342 	jr	NZ,00447$
   7210 DD 7E FD      [19] 2343 	ld	a,-3 (ix)
   7213 DD 96 FF      [19] 2344 	sub	a, -1 (ix)
   7216 28 0F         [12] 2345 	jr	Z,00201$
   7218                    2346 00447$:
   7218 1B            [ 6] 2347 	dec	de
   7219 DD 7E FE      [19] 2348 	ld	a,-2 (ix)
   721C 93            [ 4] 2349 	sub	a, e
   721D C2 34 73      [10] 2350 	jp	NZ,00202$
   7220 DD 7E FF      [19] 2351 	ld	a,-1 (ix)
   7223 92            [ 4] 2352 	sub	a, d
   7224 C2 34 73      [10] 2353 	jp	NZ,00202$
   7227                    2354 00201$:
                           2355 ;src/main.c:447: if (dx < enemy->x) { // izquierda
   7227 DD 7E 06      [19] 2356 	ld	a,6 (ix)
   722A DD 96 FA      [19] 2357 	sub	a, -6 (ix)
   722D D2 B0 72      [10] 2358 	jp	NC,00121$
                           2359 ;src/main.c:448: if (dist > 11) {
   7230 3E 0B         [ 7] 2360 	ld	a,#0x0B
   7232 DD 96 F0      [19] 2361 	sub	a, -16 (ix)
   7235 D2 09 79      [10] 2362 	jp	NC,00208$
                           2363 ;src/main.c:449: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7238 79            [ 4] 2364 	ld	a,c
   7239 F5            [11] 2365 	push	af
   723A 33            [ 6] 2366 	inc	sp
   723B DD 7E FA      [19] 2367 	ld	a,-6 (ix)
   723E F5            [11] 2368 	push	af
   723F 33            [ 6] 2369 	inc	sp
   7240 2A 48 65      [16] 2370 	ld	hl,(_mapa)
   7243 E5            [11] 2371 	push	hl
   7244 CD 71 4B      [17] 2372 	call	_getTilePtr
   7247 F1            [10] 2373 	pop	af
   7248 F1            [10] 2374 	pop	af
   7249 4E            [ 7] 2375 	ld	c,(hl)
   724A 3E 02         [ 7] 2376 	ld	a,#0x02
   724C 91            [ 4] 2377 	sub	a, c
   724D DA 09 79      [10] 2378 	jp	C,00208$
                           2379 ;src/main.c:450: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7250 DD 6E F6      [19] 2380 	ld	l,-10 (ix)
   7253 DD 66 F7      [19] 2381 	ld	h,-9 (ix)
   7256 7E            [ 7] 2382 	ld	a,(hl)
   7257 C6 0B         [ 7] 2383 	add	a, #0x0B
   7259 57            [ 4] 2384 	ld	d,a
   725A DD 6E F4      [19] 2385 	ld	l,-12 (ix)
   725D DD 66 F5      [19] 2386 	ld	h,-11 (ix)
   7260 46            [ 7] 2387 	ld	b,(hl)
   7261 D5            [11] 2388 	push	de
   7262 33            [ 6] 2389 	inc	sp
   7263 C5            [11] 2390 	push	bc
   7264 33            [ 6] 2391 	inc	sp
   7265 2A 48 65      [16] 2392 	ld	hl,(_mapa)
   7268 E5            [11] 2393 	push	hl
   7269 CD 71 4B      [17] 2394 	call	_getTilePtr
   726C F1            [10] 2395 	pop	af
   726D F1            [10] 2396 	pop	af
   726E 4E            [ 7] 2397 	ld	c,(hl)
   726F 3E 02         [ 7] 2398 	ld	a,#0x02
   7271 91            [ 4] 2399 	sub	a, c
   7272 DA 09 79      [10] 2400 	jp	C,00208$
                           2401 ;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7275 DD 6E F6      [19] 2402 	ld	l,-10 (ix)
   7278 DD 66 F7      [19] 2403 	ld	h,-9 (ix)
   727B 7E            [ 7] 2404 	ld	a,(hl)
   727C C6 16         [ 7] 2405 	add	a, #0x16
   727E 57            [ 4] 2406 	ld	d,a
   727F DD 6E F4      [19] 2407 	ld	l,-12 (ix)
   7282 DD 66 F5      [19] 2408 	ld	h,-11 (ix)
   7285 46            [ 7] 2409 	ld	b,(hl)
   7286 D5            [11] 2410 	push	de
   7287 33            [ 6] 2411 	inc	sp
   7288 C5            [11] 2412 	push	bc
   7289 33            [ 6] 2413 	inc	sp
   728A 2A 48 65      [16] 2414 	ld	hl,(_mapa)
   728D E5            [11] 2415 	push	hl
   728E CD 71 4B      [17] 2416 	call	_getTilePtr
   7291 F1            [10] 2417 	pop	af
   7292 F1            [10] 2418 	pop	af
   7293 4E            [ 7] 2419 	ld	c,(hl)
   7294 3E 02         [ 7] 2420 	ld	a,#0x02
   7296 91            [ 4] 2421 	sub	a, c
   7297 DA 09 79      [10] 2422 	jp	C,00208$
                           2423 ;src/main.c:452: moverEnemigoIzquierda(enemy);
   729A DD 6E F4      [19] 2424 	ld	l,-12 (ix)
   729D DD 66 F5      [19] 2425 	ld	h,-11 (ix)
   72A0 E5            [11] 2426 	push	hl
   72A1 CD E5 6B      [17] 2427 	call	_moverEnemigoIzquierda
   72A4 F1            [10] 2428 	pop	af
                           2429 ;src/main.c:454: enemy->mover = SI;
   72A5 DD 6E F8      [19] 2430 	ld	l,-8 (ix)
   72A8 DD 66 F9      [19] 2431 	ld	h,-7 (ix)
   72AB 36 01         [10] 2432 	ld	(hl),#0x01
   72AD C3 09 79      [10] 2433 	jp	00208$
   72B0                    2434 00121$:
                           2435 ;src/main.c:458: if (dist > G_ENEMY_W + 3) {
   72B0 3E 07         [ 7] 2436 	ld	a,#0x07
   72B2 DD 96 F0      [19] 2437 	sub	a, -16 (ix)
   72B5 D2 09 79      [10] 2438 	jp	NC,00208$
                           2439 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   72B8 79            [ 4] 2440 	ld	a,c
   72B9 F5            [11] 2441 	push	af
   72BA 33            [ 6] 2442 	inc	sp
   72BB DD 7E FB      [19] 2443 	ld	a,-5 (ix)
   72BE F5            [11] 2444 	push	af
   72BF 33            [ 6] 2445 	inc	sp
   72C0 2A 48 65      [16] 2446 	ld	hl,(_mapa)
   72C3 E5            [11] 2447 	push	hl
   72C4 CD 71 4B      [17] 2448 	call	_getTilePtr
   72C7 F1            [10] 2449 	pop	af
   72C8 F1            [10] 2450 	pop	af
   72C9 4E            [ 7] 2451 	ld	c,(hl)
   72CA 3E 02         [ 7] 2452 	ld	a,#0x02
   72CC 91            [ 4] 2453 	sub	a, c
   72CD DA 09 79      [10] 2454 	jp	C,00208$
                           2455 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   72D0 DD 6E F6      [19] 2456 	ld	l,-10 (ix)
   72D3 DD 66 F7      [19] 2457 	ld	h,-9 (ix)
   72D6 7E            [ 7] 2458 	ld	a,(hl)
   72D7 C6 0B         [ 7] 2459 	add	a, #0x0B
   72D9 47            [ 4] 2460 	ld	b,a
   72DA DD 6E F4      [19] 2461 	ld	l,-12 (ix)
   72DD DD 66 F5      [19] 2462 	ld	h,-11 (ix)
   72E0 7E            [ 7] 2463 	ld	a,(hl)
   72E1 C6 04         [ 7] 2464 	add	a, #0x04
   72E3 C5            [11] 2465 	push	bc
   72E4 33            [ 6] 2466 	inc	sp
   72E5 F5            [11] 2467 	push	af
   72E6 33            [ 6] 2468 	inc	sp
   72E7 2A 48 65      [16] 2469 	ld	hl,(_mapa)
   72EA E5            [11] 2470 	push	hl
   72EB CD 71 4B      [17] 2471 	call	_getTilePtr
   72EE F1            [10] 2472 	pop	af
   72EF F1            [10] 2473 	pop	af
   72F0 4E            [ 7] 2474 	ld	c,(hl)
   72F1 3E 02         [ 7] 2475 	ld	a,#0x02
   72F3 91            [ 4] 2476 	sub	a, c
   72F4 DA 09 79      [10] 2477 	jp	C,00208$
                           2478 ;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   72F7 DD 6E F6      [19] 2479 	ld	l,-10 (ix)
   72FA DD 66 F7      [19] 2480 	ld	h,-9 (ix)
   72FD 7E            [ 7] 2481 	ld	a,(hl)
   72FE C6 16         [ 7] 2482 	add	a, #0x16
   7300 47            [ 4] 2483 	ld	b,a
   7301 DD 6E F4      [19] 2484 	ld	l,-12 (ix)
   7304 DD 66 F5      [19] 2485 	ld	h,-11 (ix)
   7307 7E            [ 7] 2486 	ld	a,(hl)
   7308 C6 04         [ 7] 2487 	add	a, #0x04
   730A C5            [11] 2488 	push	bc
   730B 33            [ 6] 2489 	inc	sp
   730C F5            [11] 2490 	push	af
   730D 33            [ 6] 2491 	inc	sp
   730E 2A 48 65      [16] 2492 	ld	hl,(_mapa)
   7311 E5            [11] 2493 	push	hl
   7312 CD 71 4B      [17] 2494 	call	_getTilePtr
   7315 F1            [10] 2495 	pop	af
   7316 F1            [10] 2496 	pop	af
   7317 4E            [ 7] 2497 	ld	c,(hl)
   7318 3E 02         [ 7] 2498 	ld	a,#0x02
   731A 91            [ 4] 2499 	sub	a, c
   731B DA 09 79      [10] 2500 	jp	C,00208$
                           2501 ;src/main.c:462: moverEnemigoDerecha(enemy);
   731E DD 6E F4      [19] 2502 	ld	l,-12 (ix)
   7321 DD 66 F5      [19] 2503 	ld	h,-11 (ix)
   7324 E5            [11] 2504 	push	hl
   7325 CD D5 6B      [17] 2505 	call	_moverEnemigoDerecha
   7328 F1            [10] 2506 	pop	af
                           2507 ;src/main.c:464: enemy->mover = SI;
   7329 DD 6E F8      [19] 2508 	ld	l,-8 (ix)
   732C DD 66 F9      [19] 2509 	ld	h,-7 (ix)
   732F 36 01         [10] 2510 	ld	(hl),#0x01
   7331 C3 09 79      [10] 2511 	jp	00208$
   7334                    2512 00202$:
                           2513 ;src/main.c:469: else if (enemy->x == dx) {
   7334 DD 7E FA      [19] 2514 	ld	a,-6 (ix)
   7337 DD 96 06      [19] 2515 	sub	a, 6 (ix)
   733A C2 4F 74      [10] 2516 	jp	NZ,00199$
                           2517 ;src/main.c:470: if (dy < enemy->y) {
   733D DD 7E 07      [19] 2518 	ld	a,7 (ix)
   7340 91            [ 4] 2519 	sub	a, c
   7341 D2 C8 73      [10] 2520 	jp	NC,00136$
                           2521 ;src/main.c:471: if (dist > G_HERO_H + 5) {
   7344 3E 1B         [ 7] 2522 	ld	a,#0x1B
   7346 DD 96 F0      [19] 2523 	sub	a, -16 (ix)
   7349 D2 09 79      [10] 2524 	jp	NC,00208$
                           2525 ;src/main.c:472: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   734C 41            [ 4] 2526 	ld	b,c
   734D 05            [ 4] 2527 	dec	b
   734E 05            [ 4] 2528 	dec	b
   734F C5            [11] 2529 	push	bc
   7350 33            [ 6] 2530 	inc	sp
   7351 DD 7E FA      [19] 2531 	ld	a,-6 (ix)
   7354 F5            [11] 2532 	push	af
   7355 33            [ 6] 2533 	inc	sp
   7356 2A 48 65      [16] 2534 	ld	hl,(_mapa)
   7359 E5            [11] 2535 	push	hl
   735A CD 71 4B      [17] 2536 	call	_getTilePtr
   735D F1            [10] 2537 	pop	af
   735E F1            [10] 2538 	pop	af
   735F 4E            [ 7] 2539 	ld	c,(hl)
   7360 3E 02         [ 7] 2540 	ld	a,#0x02
   7362 91            [ 4] 2541 	sub	a, c
   7363 DA 09 79      [10] 2542 	jp	C,00208$
                           2543 ;src/main.c:473: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7366 DD 6E F6      [19] 2544 	ld	l,-10 (ix)
   7369 DD 66 F7      [19] 2545 	ld	h,-9 (ix)
   736C 56            [ 7] 2546 	ld	d,(hl)
   736D 15            [ 4] 2547 	dec	d
   736E 15            [ 4] 2548 	dec	d
   736F DD 6E F4      [19] 2549 	ld	l,-12 (ix)
   7372 DD 66 F5      [19] 2550 	ld	h,-11 (ix)
   7375 46            [ 7] 2551 	ld	b,(hl)
   7376 04            [ 4] 2552 	inc	b
   7377 04            [ 4] 2553 	inc	b
   7378 D5            [11] 2554 	push	de
   7379 33            [ 6] 2555 	inc	sp
   737A C5            [11] 2556 	push	bc
   737B 33            [ 6] 2557 	inc	sp
   737C 2A 48 65      [16] 2558 	ld	hl,(_mapa)
   737F E5            [11] 2559 	push	hl
   7380 CD 71 4B      [17] 2560 	call	_getTilePtr
   7383 F1            [10] 2561 	pop	af
   7384 F1            [10] 2562 	pop	af
   7385 4E            [ 7] 2563 	ld	c,(hl)
   7386 3E 02         [ 7] 2564 	ld	a,#0x02
   7388 91            [ 4] 2565 	sub	a, c
   7389 DA 09 79      [10] 2566 	jp	C,00208$
                           2567 ;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   738C DD 6E F6      [19] 2568 	ld	l,-10 (ix)
   738F DD 66 F7      [19] 2569 	ld	h,-9 (ix)
   7392 46            [ 7] 2570 	ld	b,(hl)
   7393 05            [ 4] 2571 	dec	b
   7394 05            [ 4] 2572 	dec	b
   7395 DD 6E F4      [19] 2573 	ld	l,-12 (ix)
   7398 DD 66 F5      [19] 2574 	ld	h,-11 (ix)
   739B 7E            [ 7] 2575 	ld	a,(hl)
   739C C6 04         [ 7] 2576 	add	a, #0x04
   739E C5            [11] 2577 	push	bc
   739F 33            [ 6] 2578 	inc	sp
   73A0 F5            [11] 2579 	push	af
   73A1 33            [ 6] 2580 	inc	sp
   73A2 2A 48 65      [16] 2581 	ld	hl,(_mapa)
   73A5 E5            [11] 2582 	push	hl
   73A6 CD 71 4B      [17] 2583 	call	_getTilePtr
   73A9 F1            [10] 2584 	pop	af
   73AA F1            [10] 2585 	pop	af
   73AB 4E            [ 7] 2586 	ld	c,(hl)
   73AC 3E 02         [ 7] 2587 	ld	a,#0x02
   73AE 91            [ 4] 2588 	sub	a, c
   73AF DA 09 79      [10] 2589 	jp	C,00208$
                           2590 ;src/main.c:475: moverEnemigoArriba(enemy);
   73B2 DD 6E F4      [19] 2591 	ld	l,-12 (ix)
   73B5 DD 66 F5      [19] 2592 	ld	h,-11 (ix)
   73B8 E5            [11] 2593 	push	hl
   73B9 CD 97 6B      [17] 2594 	call	_moverEnemigoArriba
   73BC F1            [10] 2595 	pop	af
                           2596 ;src/main.c:477: enemy->mover = SI;
   73BD DD 6E F8      [19] 2597 	ld	l,-8 (ix)
   73C0 DD 66 F9      [19] 2598 	ld	h,-7 (ix)
   73C3 36 01         [10] 2599 	ld	(hl),#0x01
   73C5 C3 09 79      [10] 2600 	jp	00208$
   73C8                    2601 00136$:
                           2602 ;src/main.c:481: if(dist > G_ENEMY_H + 7) {
   73C8 3E 1D         [ 7] 2603 	ld	a,#0x1D
   73CA DD 96 F0      [19] 2604 	sub	a, -16 (ix)
   73CD D2 09 79      [10] 2605 	jp	NC,00208$
                           2606 ;src/main.c:482: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   73D0 79            [ 4] 2607 	ld	a,c
   73D1 C6 18         [ 7] 2608 	add	a, #0x18
   73D3 47            [ 4] 2609 	ld	b,a
   73D4 C5            [11] 2610 	push	bc
   73D5 33            [ 6] 2611 	inc	sp
   73D6 DD 7E FA      [19] 2612 	ld	a,-6 (ix)
   73D9 F5            [11] 2613 	push	af
   73DA 33            [ 6] 2614 	inc	sp
   73DB 2A 48 65      [16] 2615 	ld	hl,(_mapa)
   73DE E5            [11] 2616 	push	hl
   73DF CD 71 4B      [17] 2617 	call	_getTilePtr
   73E2 F1            [10] 2618 	pop	af
   73E3 F1            [10] 2619 	pop	af
   73E4 4E            [ 7] 2620 	ld	c,(hl)
   73E5 3E 02         [ 7] 2621 	ld	a,#0x02
   73E7 91            [ 4] 2622 	sub	a, c
   73E8 DA 09 79      [10] 2623 	jp	C,00208$
                           2624 ;src/main.c:483: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   73EB DD 6E F6      [19] 2625 	ld	l,-10 (ix)
   73EE DD 66 F7      [19] 2626 	ld	h,-9 (ix)
   73F1 7E            [ 7] 2627 	ld	a,(hl)
   73F2 C6 18         [ 7] 2628 	add	a, #0x18
   73F4 57            [ 4] 2629 	ld	d,a
   73F5 DD 6E F4      [19] 2630 	ld	l,-12 (ix)
   73F8 DD 66 F5      [19] 2631 	ld	h,-11 (ix)
   73FB 46            [ 7] 2632 	ld	b,(hl)
   73FC 04            [ 4] 2633 	inc	b
   73FD 04            [ 4] 2634 	inc	b
   73FE D5            [11] 2635 	push	de
   73FF 33            [ 6] 2636 	inc	sp
   7400 C5            [11] 2637 	push	bc
   7401 33            [ 6] 2638 	inc	sp
   7402 2A 48 65      [16] 2639 	ld	hl,(_mapa)
   7405 E5            [11] 2640 	push	hl
   7406 CD 71 4B      [17] 2641 	call	_getTilePtr
   7409 F1            [10] 2642 	pop	af
   740A F1            [10] 2643 	pop	af
   740B 4E            [ 7] 2644 	ld	c,(hl)
   740C 3E 02         [ 7] 2645 	ld	a,#0x02
   740E 91            [ 4] 2646 	sub	a, c
   740F DA 09 79      [10] 2647 	jp	C,00208$
                           2648 ;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7412 DD 6E F6      [19] 2649 	ld	l,-10 (ix)
   7415 DD 66 F7      [19] 2650 	ld	h,-9 (ix)
   7418 7E            [ 7] 2651 	ld	a,(hl)
   7419 C6 18         [ 7] 2652 	add	a, #0x18
   741B 47            [ 4] 2653 	ld	b,a
   741C DD 6E F4      [19] 2654 	ld	l,-12 (ix)
   741F DD 66 F5      [19] 2655 	ld	h,-11 (ix)
   7422 7E            [ 7] 2656 	ld	a,(hl)
   7423 C6 04         [ 7] 2657 	add	a, #0x04
   7425 C5            [11] 2658 	push	bc
   7426 33            [ 6] 2659 	inc	sp
   7427 F5            [11] 2660 	push	af
   7428 33            [ 6] 2661 	inc	sp
   7429 2A 48 65      [16] 2662 	ld	hl,(_mapa)
   742C E5            [11] 2663 	push	hl
   742D CD 71 4B      [17] 2664 	call	_getTilePtr
   7430 F1            [10] 2665 	pop	af
   7431 F1            [10] 2666 	pop	af
   7432 4E            [ 7] 2667 	ld	c,(hl)
   7433 3E 02         [ 7] 2668 	ld	a,#0x02
   7435 91            [ 4] 2669 	sub	a, c
   7436 DA 09 79      [10] 2670 	jp	C,00208$
                           2671 ;src/main.c:485: moverEnemigoAbajo(enemy);
   7439 DD 6E F4      [19] 2672 	ld	l,-12 (ix)
   743C DD 66 F5      [19] 2673 	ld	h,-11 (ix)
   743F E5            [11] 2674 	push	hl
   7440 CD B6 6B      [17] 2675 	call	_moverEnemigoAbajo
   7443 F1            [10] 2676 	pop	af
                           2677 ;src/main.c:487: enemy->mover = SI;
   7444 DD 6E F8      [19] 2678 	ld	l,-8 (ix)
   7447 DD 66 F9      [19] 2679 	ld	h,-7 (ix)
   744A 36 01         [10] 2680 	ld	(hl),#0x01
   744C C3 09 79      [10] 2681 	jp	00208$
   744F                    2682 00199$:
                           2683 ;src/main.c:493: if (!prota.mover) distConstraint = 20; // ajuste en parado
   744F 3A 6C 64      [13] 2684 	ld	a, (#_prota + 6)
   7452 B7            [ 4] 2685 	or	a, a
   7453 20 04         [12] 2686 	jr	NZ,00139$
   7455 DD 36 F1 14   [19] 2687 	ld	-15 (ix),#0x14
   7459                    2688 00139$:
                           2689 ;src/main.c:495: if (dist > distConstraint) {
   7459 DD 7E F1      [19] 2690 	ld	a,-15 (ix)
   745C DD 96 F0      [19] 2691 	sub	a, -16 (ix)
   745F D2 09 79      [10] 2692 	jp	NC,00208$
                           2693 ;src/main.c:496: if (dx + 1 < enemy->x) {
   7462 DD 5E 06      [19] 2694 	ld	e,6 (ix)
   7465 16 00         [ 7] 2695 	ld	d,#0x00
   7467 13            [ 6] 2696 	inc	de
   7468 DD 7E FA      [19] 2697 	ld	a,-6 (ix)
   746B DD 77 FE      [19] 2698 	ld	-2 (ix),a
   746E DD 36 FF 00   [19] 2699 	ld	-1 (ix),#0x00
   7472 7B            [ 4] 2700 	ld	a,e
   7473 DD 96 FE      [19] 2701 	sub	a, -2 (ix)
   7476 7A            [ 4] 2702 	ld	a,d
   7477 DD 9E FF      [19] 2703 	sbc	a, -1 (ix)
   747A E2 7F 74      [10] 2704 	jp	PO, 00452$
   747D EE 80         [ 7] 2705 	xor	a, #0x80
   747F                    2706 00452$:
   747F F2 FE 74      [10] 2707 	jp	P,00151$
                           2708 ;src/main.c:497: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7482 79            [ 4] 2709 	ld	a,c
   7483 F5            [11] 2710 	push	af
   7484 33            [ 6] 2711 	inc	sp
   7485 DD 7E FA      [19] 2712 	ld	a,-6 (ix)
   7488 F5            [11] 2713 	push	af
   7489 33            [ 6] 2714 	inc	sp
   748A 2A 48 65      [16] 2715 	ld	hl,(_mapa)
   748D E5            [11] 2716 	push	hl
   748E CD 71 4B      [17] 2717 	call	_getTilePtr
   7491 F1            [10] 2718 	pop	af
   7492 F1            [10] 2719 	pop	af
   7493 4E            [ 7] 2720 	ld	c,(hl)
   7494 3E 02         [ 7] 2721 	ld	a,#0x02
   7496 91            [ 4] 2722 	sub	a, c
   7497 DA 88 75      [10] 2723 	jp	C,00152$
                           2724 ;src/main.c:498: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   749A DD 6E F6      [19] 2725 	ld	l,-10 (ix)
   749D DD 66 F7      [19] 2726 	ld	h,-9 (ix)
   74A0 7E            [ 7] 2727 	ld	a,(hl)
   74A1 C6 0B         [ 7] 2728 	add	a, #0x0B
   74A3 57            [ 4] 2729 	ld	d,a
   74A4 DD 6E F4      [19] 2730 	ld	l,-12 (ix)
   74A7 DD 66 F5      [19] 2731 	ld	h,-11 (ix)
   74AA 46            [ 7] 2732 	ld	b,(hl)
   74AB D5            [11] 2733 	push	de
   74AC 33            [ 6] 2734 	inc	sp
   74AD C5            [11] 2735 	push	bc
   74AE 33            [ 6] 2736 	inc	sp
   74AF 2A 48 65      [16] 2737 	ld	hl,(_mapa)
   74B2 E5            [11] 2738 	push	hl
   74B3 CD 71 4B      [17] 2739 	call	_getTilePtr
   74B6 F1            [10] 2740 	pop	af
   74B7 F1            [10] 2741 	pop	af
   74B8 4E            [ 7] 2742 	ld	c,(hl)
   74B9 3E 02         [ 7] 2743 	ld	a,#0x02
   74BB 91            [ 4] 2744 	sub	a, c
   74BC DA 88 75      [10] 2745 	jp	C,00152$
                           2746 ;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   74BF DD 6E F6      [19] 2747 	ld	l,-10 (ix)
   74C2 DD 66 F7      [19] 2748 	ld	h,-9 (ix)
   74C5 7E            [ 7] 2749 	ld	a,(hl)
   74C6 C6 16         [ 7] 2750 	add	a, #0x16
   74C8 57            [ 4] 2751 	ld	d,a
   74C9 DD 6E F4      [19] 2752 	ld	l,-12 (ix)
   74CC DD 66 F5      [19] 2753 	ld	h,-11 (ix)
   74CF 46            [ 7] 2754 	ld	b,(hl)
   74D0 D5            [11] 2755 	push	de
   74D1 33            [ 6] 2756 	inc	sp
   74D2 C5            [11] 2757 	push	bc
   74D3 33            [ 6] 2758 	inc	sp
   74D4 2A 48 65      [16] 2759 	ld	hl,(_mapa)
   74D7 E5            [11] 2760 	push	hl
   74D8 CD 71 4B      [17] 2761 	call	_getTilePtr
   74DB F1            [10] 2762 	pop	af
   74DC F1            [10] 2763 	pop	af
   74DD 4E            [ 7] 2764 	ld	c,(hl)
   74DE 3E 02         [ 7] 2765 	ld	a,#0x02
   74E0 91            [ 4] 2766 	sub	a, c
   74E1 DA 88 75      [10] 2767 	jp	C,00152$
                           2768 ;src/main.c:500: moverEnemigoIzquierda(enemy);
   74E4 DD 6E F4      [19] 2769 	ld	l,-12 (ix)
   74E7 DD 66 F5      [19] 2770 	ld	h,-11 (ix)
   74EA E5            [11] 2771 	push	hl
   74EB CD E5 6B      [17] 2772 	call	_moverEnemigoIzquierda
   74EE F1            [10] 2773 	pop	af
                           2774 ;src/main.c:501: movX = 1;
   74EF DD 36 F3 01   [19] 2775 	ld	-13 (ix),#0x01
                           2776 ;src/main.c:502: enemy->mover = SI;
   74F3 DD 6E F8      [19] 2777 	ld	l,-8 (ix)
   74F6 DD 66 F9      [19] 2778 	ld	h,-7 (ix)
   74F9 36 01         [10] 2779 	ld	(hl),#0x01
   74FB C3 88 75      [10] 2780 	jp	00152$
   74FE                    2781 00151$:
                           2782 ;src/main.c:504: } else if (dx + 1 > enemy->x){
   74FE DD 7E FE      [19] 2783 	ld	a,-2 (ix)
   7501 93            [ 4] 2784 	sub	a, e
   7502 DD 7E FF      [19] 2785 	ld	a,-1 (ix)
   7505 9A            [ 4] 2786 	sbc	a, d
   7506 E2 0B 75      [10] 2787 	jp	PO, 00453$
   7509 EE 80         [ 7] 2788 	xor	a, #0x80
   750B                    2789 00453$:
   750B F2 88 75      [10] 2790 	jp	P,00152$
                           2791 ;src/main.c:505: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   750E 79            [ 4] 2792 	ld	a,c
   750F F5            [11] 2793 	push	af
   7510 33            [ 6] 2794 	inc	sp
   7511 DD 7E FB      [19] 2795 	ld	a,-5 (ix)
   7514 F5            [11] 2796 	push	af
   7515 33            [ 6] 2797 	inc	sp
   7516 2A 48 65      [16] 2798 	ld	hl,(_mapa)
   7519 E5            [11] 2799 	push	hl
   751A CD 71 4B      [17] 2800 	call	_getTilePtr
   751D F1            [10] 2801 	pop	af
   751E F1            [10] 2802 	pop	af
   751F 4E            [ 7] 2803 	ld	c,(hl)
   7520 3E 02         [ 7] 2804 	ld	a,#0x02
   7522 91            [ 4] 2805 	sub	a, c
   7523 38 63         [12] 2806 	jr	C,00152$
                           2807 ;src/main.c:506: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7525 DD 6E F6      [19] 2808 	ld	l,-10 (ix)
   7528 DD 66 F7      [19] 2809 	ld	h,-9 (ix)
   752B 7E            [ 7] 2810 	ld	a,(hl)
   752C C6 0B         [ 7] 2811 	add	a, #0x0B
   752E 47            [ 4] 2812 	ld	b,a
   752F DD 6E F4      [19] 2813 	ld	l,-12 (ix)
   7532 DD 66 F5      [19] 2814 	ld	h,-11 (ix)
   7535 7E            [ 7] 2815 	ld	a,(hl)
   7536 C6 04         [ 7] 2816 	add	a, #0x04
   7538 C5            [11] 2817 	push	bc
   7539 33            [ 6] 2818 	inc	sp
   753A F5            [11] 2819 	push	af
   753B 33            [ 6] 2820 	inc	sp
   753C 2A 48 65      [16] 2821 	ld	hl,(_mapa)
   753F E5            [11] 2822 	push	hl
   7540 CD 71 4B      [17] 2823 	call	_getTilePtr
   7543 F1            [10] 2824 	pop	af
   7544 F1            [10] 2825 	pop	af
   7545 4E            [ 7] 2826 	ld	c,(hl)
   7546 3E 02         [ 7] 2827 	ld	a,#0x02
   7548 91            [ 4] 2828 	sub	a, c
   7549 38 3D         [12] 2829 	jr	C,00152$
                           2830 ;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   754B DD 6E F6      [19] 2831 	ld	l,-10 (ix)
   754E DD 66 F7      [19] 2832 	ld	h,-9 (ix)
   7551 7E            [ 7] 2833 	ld	a,(hl)
   7552 C6 16         [ 7] 2834 	add	a, #0x16
   7554 47            [ 4] 2835 	ld	b,a
   7555 DD 6E F4      [19] 2836 	ld	l,-12 (ix)
   7558 DD 66 F5      [19] 2837 	ld	h,-11 (ix)
   755B 7E            [ 7] 2838 	ld	a,(hl)
   755C C6 04         [ 7] 2839 	add	a, #0x04
   755E C5            [11] 2840 	push	bc
   755F 33            [ 6] 2841 	inc	sp
   7560 F5            [11] 2842 	push	af
   7561 33            [ 6] 2843 	inc	sp
   7562 2A 48 65      [16] 2844 	ld	hl,(_mapa)
   7565 E5            [11] 2845 	push	hl
   7566 CD 71 4B      [17] 2846 	call	_getTilePtr
   7569 F1            [10] 2847 	pop	af
   756A F1            [10] 2848 	pop	af
   756B 4E            [ 7] 2849 	ld	c,(hl)
   756C 3E 02         [ 7] 2850 	ld	a,#0x02
   756E 91            [ 4] 2851 	sub	a, c
   756F 38 17         [12] 2852 	jr	C,00152$
                           2853 ;src/main.c:508: moverEnemigoDerecha(enemy);
   7571 DD 6E F4      [19] 2854 	ld	l,-12 (ix)
   7574 DD 66 F5      [19] 2855 	ld	h,-11 (ix)
   7577 E5            [11] 2856 	push	hl
   7578 CD D5 6B      [17] 2857 	call	_moverEnemigoDerecha
   757B F1            [10] 2858 	pop	af
                           2859 ;src/main.c:509: movX = 1;
   757C DD 36 F3 01   [19] 2860 	ld	-13 (ix),#0x01
                           2861 ;src/main.c:510: enemy->mover = SI;
   7580 DD 6E F8      [19] 2862 	ld	l,-8 (ix)
   7583 DD 66 F9      [19] 2863 	ld	h,-7 (ix)
   7586 36 01         [10] 2864 	ld	(hl),#0x01
   7588                    2865 00152$:
                           2866 ;src/main.c:513: if (dy < enemy->y) {
   7588 DD 6E F6      [19] 2867 	ld	l,-10 (ix)
   758B DD 66 F7      [19] 2868 	ld	h,-9 (ix)
   758E 7E            [ 7] 2869 	ld	a,(hl)
   758F DD 77 FE      [19] 2870 	ld	-2 (ix),a
                           2871 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7592 DD 6E F4      [19] 2872 	ld	l,-12 (ix)
   7595 DD 66 F5      [19] 2873 	ld	h,-11 (ix)
   7598 7E            [ 7] 2874 	ld	a,(hl)
   7599 DD 77 FC      [19] 2875 	ld	-4 (ix),a
                           2876 ;src/main.c:513: if (dy < enemy->y) {
   759C DD 7E 07      [19] 2877 	ld	a,7 (ix)
   759F DD 96 FE      [19] 2878 	sub	a, -2 (ix)
   75A2 D2 27 76      [10] 2879 	jp	NC,00162$
                           2880 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75A5 DD 46 FE      [19] 2881 	ld	b,-2 (ix)
   75A8 05            [ 4] 2882 	dec	b
   75A9 05            [ 4] 2883 	dec	b
   75AA C5            [11] 2884 	push	bc
   75AB 33            [ 6] 2885 	inc	sp
   75AC DD 7E FC      [19] 2886 	ld	a,-4 (ix)
   75AF F5            [11] 2887 	push	af
   75B0 33            [ 6] 2888 	inc	sp
   75B1 2A 48 65      [16] 2889 	ld	hl,(_mapa)
   75B4 E5            [11] 2890 	push	hl
   75B5 CD 71 4B      [17] 2891 	call	_getTilePtr
   75B8 F1            [10] 2892 	pop	af
   75B9 F1            [10] 2893 	pop	af
   75BA 4E            [ 7] 2894 	ld	c,(hl)
   75BB 3E 02         [ 7] 2895 	ld	a,#0x02
   75BD 91            [ 4] 2896 	sub	a, c
   75BE DA A6 76      [10] 2897 	jp	C,00163$
                           2898 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75C1 DD 6E F6      [19] 2899 	ld	l,-10 (ix)
   75C4 DD 66 F7      [19] 2900 	ld	h,-9 (ix)
   75C7 56            [ 7] 2901 	ld	d,(hl)
   75C8 15            [ 4] 2902 	dec	d
   75C9 15            [ 4] 2903 	dec	d
   75CA DD 6E F4      [19] 2904 	ld	l,-12 (ix)
   75CD DD 66 F5      [19] 2905 	ld	h,-11 (ix)
   75D0 46            [ 7] 2906 	ld	b,(hl)
   75D1 04            [ 4] 2907 	inc	b
   75D2 04            [ 4] 2908 	inc	b
   75D3 D5            [11] 2909 	push	de
   75D4 33            [ 6] 2910 	inc	sp
   75D5 C5            [11] 2911 	push	bc
   75D6 33            [ 6] 2912 	inc	sp
   75D7 2A 48 65      [16] 2913 	ld	hl,(_mapa)
   75DA E5            [11] 2914 	push	hl
   75DB CD 71 4B      [17] 2915 	call	_getTilePtr
   75DE F1            [10] 2916 	pop	af
   75DF F1            [10] 2917 	pop	af
   75E0 4E            [ 7] 2918 	ld	c,(hl)
   75E1 3E 02         [ 7] 2919 	ld	a,#0x02
   75E3 91            [ 4] 2920 	sub	a, c
   75E4 DA A6 76      [10] 2921 	jp	C,00163$
                           2922 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   75E7 DD 6E F6      [19] 2923 	ld	l,-10 (ix)
   75EA DD 66 F7      [19] 2924 	ld	h,-9 (ix)
   75ED 46            [ 7] 2925 	ld	b,(hl)
   75EE 05            [ 4] 2926 	dec	b
   75EF 05            [ 4] 2927 	dec	b
   75F0 DD 6E F4      [19] 2928 	ld	l,-12 (ix)
   75F3 DD 66 F5      [19] 2929 	ld	h,-11 (ix)
   75F6 7E            [ 7] 2930 	ld	a,(hl)
   75F7 C6 04         [ 7] 2931 	add	a, #0x04
   75F9 C5            [11] 2932 	push	bc
   75FA 33            [ 6] 2933 	inc	sp
   75FB F5            [11] 2934 	push	af
   75FC 33            [ 6] 2935 	inc	sp
   75FD 2A 48 65      [16] 2936 	ld	hl,(_mapa)
   7600 E5            [11] 2937 	push	hl
   7601 CD 71 4B      [17] 2938 	call	_getTilePtr
   7604 F1            [10] 2939 	pop	af
   7605 F1            [10] 2940 	pop	af
   7606 4E            [ 7] 2941 	ld	c,(hl)
   7607 3E 02         [ 7] 2942 	ld	a,#0x02
   7609 91            [ 4] 2943 	sub	a, c
   760A DA A6 76      [10] 2944 	jp	C,00163$
                           2945 ;src/main.c:517: moverEnemigoArriba(enemy);
   760D DD 6E F4      [19] 2946 	ld	l,-12 (ix)
   7610 DD 66 F5      [19] 2947 	ld	h,-11 (ix)
   7613 E5            [11] 2948 	push	hl
   7614 CD 97 6B      [17] 2949 	call	_moverEnemigoArriba
   7617 F1            [10] 2950 	pop	af
                           2951 ;src/main.c:518: movY = 1;
   7618 DD 36 F2 01   [19] 2952 	ld	-14 (ix),#0x01
                           2953 ;src/main.c:519: enemy->mover = SI;
   761C DD 6E F8      [19] 2954 	ld	l,-8 (ix)
   761F DD 66 F9      [19] 2955 	ld	h,-7 (ix)
   7622 36 01         [10] 2956 	ld	(hl),#0x01
   7624 C3 A6 76      [10] 2957 	jp	00163$
   7627                    2958 00162$:
                           2959 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7627 DD 7E FE      [19] 2960 	ld	a,-2 (ix)
   762A C6 18         [ 7] 2961 	add	a, #0x18
   762C 47            [ 4] 2962 	ld	b,a
   762D C5            [11] 2963 	push	bc
   762E 33            [ 6] 2964 	inc	sp
   762F DD 7E FC      [19] 2965 	ld	a,-4 (ix)
   7632 F5            [11] 2966 	push	af
   7633 33            [ 6] 2967 	inc	sp
   7634 2A 48 65      [16] 2968 	ld	hl,(_mapa)
   7637 E5            [11] 2969 	push	hl
   7638 CD 71 4B      [17] 2970 	call	_getTilePtr
   763B F1            [10] 2971 	pop	af
   763C F1            [10] 2972 	pop	af
   763D 4E            [ 7] 2973 	ld	c,(hl)
   763E 3E 02         [ 7] 2974 	ld	a,#0x02
   7640 91            [ 4] 2975 	sub	a, c
   7641 38 63         [12] 2976 	jr	C,00163$
                           2977 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7643 DD 6E F6      [19] 2978 	ld	l,-10 (ix)
   7646 DD 66 F7      [19] 2979 	ld	h,-9 (ix)
   7649 7E            [ 7] 2980 	ld	a,(hl)
   764A C6 18         [ 7] 2981 	add	a, #0x18
   764C 57            [ 4] 2982 	ld	d,a
   764D DD 6E F4      [19] 2983 	ld	l,-12 (ix)
   7650 DD 66 F5      [19] 2984 	ld	h,-11 (ix)
   7653 46            [ 7] 2985 	ld	b,(hl)
   7654 04            [ 4] 2986 	inc	b
   7655 04            [ 4] 2987 	inc	b
   7656 D5            [11] 2988 	push	de
   7657 33            [ 6] 2989 	inc	sp
   7658 C5            [11] 2990 	push	bc
   7659 33            [ 6] 2991 	inc	sp
   765A 2A 48 65      [16] 2992 	ld	hl,(_mapa)
   765D E5            [11] 2993 	push	hl
   765E CD 71 4B      [17] 2994 	call	_getTilePtr
   7661 F1            [10] 2995 	pop	af
   7662 F1            [10] 2996 	pop	af
   7663 4E            [ 7] 2997 	ld	c,(hl)
   7664 3E 02         [ 7] 2998 	ld	a,#0x02
   7666 91            [ 4] 2999 	sub	a, c
   7667 38 3D         [12] 3000 	jr	C,00163$
                           3001 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7669 DD 6E F6      [19] 3002 	ld	l,-10 (ix)
   766C DD 66 F7      [19] 3003 	ld	h,-9 (ix)
   766F 7E            [ 7] 3004 	ld	a,(hl)
   7670 C6 18         [ 7] 3005 	add	a, #0x18
   7672 47            [ 4] 3006 	ld	b,a
   7673 DD 6E F4      [19] 3007 	ld	l,-12 (ix)
   7676 DD 66 F5      [19] 3008 	ld	h,-11 (ix)
   7679 7E            [ 7] 3009 	ld	a,(hl)
   767A C6 04         [ 7] 3010 	add	a, #0x04
   767C C5            [11] 3011 	push	bc
   767D 33            [ 6] 3012 	inc	sp
   767E F5            [11] 3013 	push	af
   767F 33            [ 6] 3014 	inc	sp
   7680 2A 48 65      [16] 3015 	ld	hl,(_mapa)
   7683 E5            [11] 3016 	push	hl
   7684 CD 71 4B      [17] 3017 	call	_getTilePtr
   7687 F1            [10] 3018 	pop	af
   7688 F1            [10] 3019 	pop	af
   7689 4E            [ 7] 3020 	ld	c,(hl)
   768A 3E 02         [ 7] 3021 	ld	a,#0x02
   768C 91            [ 4] 3022 	sub	a, c
   768D 38 17         [12] 3023 	jr	C,00163$
                           3024 ;src/main.c:525: moverEnemigoAbajo(enemy);
   768F DD 6E F4      [19] 3025 	ld	l,-12 (ix)
   7692 DD 66 F5      [19] 3026 	ld	h,-11 (ix)
   7695 E5            [11] 3027 	push	hl
   7696 CD B6 6B      [17] 3028 	call	_moverEnemigoAbajo
   7699 F1            [10] 3029 	pop	af
                           3030 ;src/main.c:526: movY = 1;
   769A DD 36 F2 01   [19] 3031 	ld	-14 (ix),#0x01
                           3032 ;src/main.c:527: enemy->mover = SI;
   769E DD 6E F8      [19] 3033 	ld	l,-8 (ix)
   76A1 DD 66 F9      [19] 3034 	ld	h,-7 (ix)
   76A4 36 01         [10] 3035 	ld	(hl),#0x01
   76A6                    3036 00163$:
                           3037 ;src/main.c:530: if (!enemy->mover) {
   76A6 DD 6E F8      [19] 3038 	ld	l,-8 (ix)
   76A9 DD 66 F9      [19] 3039 	ld	h,-7 (ix)
   76AC 7E            [ 7] 3040 	ld	a,(hl)
   76AD B7            [ 4] 3041 	or	a, a
   76AE C2 09 79      [10] 3042 	jp	NZ,00208$
                           3043 ;src/main.c:531: if (!movX) {
   76B1 DD 7E F3      [19] 3044 	ld	a,-13 (ix)
   76B4 B7            [ 4] 3045 	or	a, a
   76B5 C2 DE 77      [10] 3046 	jp	NZ,00178$
                           3047 ;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76B8 DD 6E F6      [19] 3048 	ld	l,-10 (ix)
   76BB DD 66 F7      [19] 3049 	ld	h,-9 (ix)
   76BE 5E            [ 7] 3050 	ld	e,(hl)
                           3051 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   76BF DD 6E F4      [19] 3052 	ld	l,-12 (ix)
   76C2 DD 66 F5      [19] 3053 	ld	h,-11 (ix)
   76C5 4E            [ 7] 3054 	ld	c,(hl)
                           3055 ;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76C6 3E 70         [ 7] 3056 	ld	a,#0x70
   76C8 93            [ 4] 3057 	sub	a, e
   76C9 D2 59 77      [10] 3058 	jp	NC,00175$
                           3059 ;src/main.c:533: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   76CC 7B            [ 4] 3060 	ld	a,e
   76CD C6 18         [ 7] 3061 	add	a, #0x18
   76CF 47            [ 4] 3062 	ld	b,a
   76D0 C5            [11] 3063 	push	bc
   76D1 2A 48 65      [16] 3064 	ld	hl,(_mapa)
   76D4 E5            [11] 3065 	push	hl
   76D5 CD 71 4B      [17] 3066 	call	_getTilePtr
   76D8 F1            [10] 3067 	pop	af
   76D9 F1            [10] 3068 	pop	af
   76DA 4E            [ 7] 3069 	ld	c,(hl)
   76DB 3E 02         [ 7] 3070 	ld	a,#0x02
   76DD 91            [ 4] 3071 	sub	a, c
   76DE 38 63         [12] 3072 	jr	C,00165$
                           3073 ;src/main.c:534: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   76E0 DD 6E F6      [19] 3074 	ld	l,-10 (ix)
   76E3 DD 66 F7      [19] 3075 	ld	h,-9 (ix)
   76E6 7E            [ 7] 3076 	ld	a,(hl)
   76E7 C6 18         [ 7] 3077 	add	a, #0x18
   76E9 57            [ 4] 3078 	ld	d,a
   76EA DD 6E F4      [19] 3079 	ld	l,-12 (ix)
   76ED DD 66 F5      [19] 3080 	ld	h,-11 (ix)
   76F0 4E            [ 7] 3081 	ld	c,(hl)
   76F1 41            [ 4] 3082 	ld	b,c
   76F2 04            [ 4] 3083 	inc	b
   76F3 04            [ 4] 3084 	inc	b
   76F4 D5            [11] 3085 	push	de
   76F5 33            [ 6] 3086 	inc	sp
   76F6 C5            [11] 3087 	push	bc
   76F7 33            [ 6] 3088 	inc	sp
   76F8 2A 48 65      [16] 3089 	ld	hl,(_mapa)
   76FB E5            [11] 3090 	push	hl
   76FC CD 71 4B      [17] 3091 	call	_getTilePtr
   76FF F1            [10] 3092 	pop	af
   7700 F1            [10] 3093 	pop	af
   7701 4E            [ 7] 3094 	ld	c,(hl)
   7702 3E 02         [ 7] 3095 	ld	a,#0x02
   7704 91            [ 4] 3096 	sub	a, c
   7705 38 3C         [12] 3097 	jr	C,00165$
                           3098 ;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7707 DD 6E F6      [19] 3099 	ld	l,-10 (ix)
   770A DD 66 F7      [19] 3100 	ld	h,-9 (ix)
   770D 7E            [ 7] 3101 	ld	a,(hl)
   770E C6 18         [ 7] 3102 	add	a, #0x18
   7710 47            [ 4] 3103 	ld	b,a
   7711 DD 6E F4      [19] 3104 	ld	l,-12 (ix)
   7714 DD 66 F5      [19] 3105 	ld	h,-11 (ix)
   7717 7E            [ 7] 3106 	ld	a,(hl)
   7718 C6 04         [ 7] 3107 	add	a, #0x04
   771A C5            [11] 3108 	push	bc
   771B 33            [ 6] 3109 	inc	sp
   771C F5            [11] 3110 	push	af
   771D 33            [ 6] 3111 	inc	sp
   771E 2A 48 65      [16] 3112 	ld	hl,(_mapa)
   7721 E5            [11] 3113 	push	hl
   7722 CD 71 4B      [17] 3114 	call	_getTilePtr
   7725 F1            [10] 3115 	pop	af
   7726 F1            [10] 3116 	pop	af
   7727 4E            [ 7] 3117 	ld	c,(hl)
   7728 3E 02         [ 7] 3118 	ld	a,#0x02
   772A 91            [ 4] 3119 	sub	a, c
   772B 38 16         [12] 3120 	jr	C,00165$
                           3121 ;src/main.c:536: moverEnemigoAbajo(enemy);
   772D DD 6E F4      [19] 3122 	ld	l,-12 (ix)
   7730 DD 66 F5      [19] 3123 	ld	h,-11 (ix)
   7733 E5            [11] 3124 	push	hl
   7734 CD B6 6B      [17] 3125 	call	_moverEnemigoAbajo
   7737 F1            [10] 3126 	pop	af
                           3127 ;src/main.c:537: enemy->mover = SI;
   7738 DD 6E F8      [19] 3128 	ld	l,-8 (ix)
   773B DD 66 F9      [19] 3129 	ld	h,-7 (ix)
   773E 36 01         [10] 3130 	ld	(hl),#0x01
   7740 C3 DE 77      [10] 3131 	jp	00178$
   7743                    3132 00165$:
                           3133 ;src/main.c:539: moverEnemigoArriba(enemy);
   7743 DD 6E F4      [19] 3134 	ld	l,-12 (ix)
   7746 DD 66 F5      [19] 3135 	ld	h,-11 (ix)
   7749 E5            [11] 3136 	push	hl
   774A CD 97 6B      [17] 3137 	call	_moverEnemigoArriba
   774D F1            [10] 3138 	pop	af
                           3139 ;src/main.c:540: enemy->mover = SI;
   774E DD 6E F8      [19] 3140 	ld	l,-8 (ix)
   7751 DD 66 F9      [19] 3141 	ld	h,-7 (ix)
   7754 36 01         [10] 3142 	ld	(hl),#0x01
   7756 C3 DE 77      [10] 3143 	jp	00178$
   7759                    3144 00175$:
                           3145 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7759 43            [ 4] 3146 	ld	b,e
   775A 05            [ 4] 3147 	dec	b
   775B 05            [ 4] 3148 	dec	b
   775C C5            [11] 3149 	push	bc
   775D 2A 48 65      [16] 3150 	ld	hl,(_mapa)
   7760 E5            [11] 3151 	push	hl
   7761 CD 71 4B      [17] 3152 	call	_getTilePtr
   7764 F1            [10] 3153 	pop	af
   7765 F1            [10] 3154 	pop	af
   7766 4E            [ 7] 3155 	ld	c,(hl)
   7767 3E 02         [ 7] 3156 	ld	a,#0x02
   7769 91            [ 4] 3157 	sub	a, c
   776A 38 5F         [12] 3158 	jr	C,00170$
                           3159 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   776C DD 6E F6      [19] 3160 	ld	l,-10 (ix)
   776F DD 66 F7      [19] 3161 	ld	h,-9 (ix)
   7772 56            [ 7] 3162 	ld	d,(hl)
   7773 15            [ 4] 3163 	dec	d
   7774 15            [ 4] 3164 	dec	d
   7775 DD 6E F4      [19] 3165 	ld	l,-12 (ix)
   7778 DD 66 F5      [19] 3166 	ld	h,-11 (ix)
   777B 46            [ 7] 3167 	ld	b,(hl)
   777C 04            [ 4] 3168 	inc	b
   777D 04            [ 4] 3169 	inc	b
   777E D5            [11] 3170 	push	de
   777F 33            [ 6] 3171 	inc	sp
   7780 C5            [11] 3172 	push	bc
   7781 33            [ 6] 3173 	inc	sp
   7782 2A 48 65      [16] 3174 	ld	hl,(_mapa)
   7785 E5            [11] 3175 	push	hl
   7786 CD 71 4B      [17] 3176 	call	_getTilePtr
   7789 F1            [10] 3177 	pop	af
   778A F1            [10] 3178 	pop	af
   778B 4E            [ 7] 3179 	ld	c,(hl)
   778C 3E 02         [ 7] 3180 	ld	a,#0x02
   778E 91            [ 4] 3181 	sub	a, c
   778F 38 3A         [12] 3182 	jr	C,00170$
                           3183 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7791 DD 6E F6      [19] 3184 	ld	l,-10 (ix)
   7794 DD 66 F7      [19] 3185 	ld	h,-9 (ix)
   7797 46            [ 7] 3186 	ld	b,(hl)
   7798 05            [ 4] 3187 	dec	b
   7799 05            [ 4] 3188 	dec	b
   779A DD 6E F4      [19] 3189 	ld	l,-12 (ix)
   779D DD 66 F5      [19] 3190 	ld	h,-11 (ix)
   77A0 7E            [ 7] 3191 	ld	a,(hl)
   77A1 C6 04         [ 7] 3192 	add	a, #0x04
   77A3 C5            [11] 3193 	push	bc
   77A4 33            [ 6] 3194 	inc	sp
   77A5 F5            [11] 3195 	push	af
   77A6 33            [ 6] 3196 	inc	sp
   77A7 2A 48 65      [16] 3197 	ld	hl,(_mapa)
   77AA E5            [11] 3198 	push	hl
   77AB CD 71 4B      [17] 3199 	call	_getTilePtr
   77AE F1            [10] 3200 	pop	af
   77AF F1            [10] 3201 	pop	af
   77B0 4E            [ 7] 3202 	ld	c,(hl)
   77B1 3E 02         [ 7] 3203 	ld	a,#0x02
   77B3 91            [ 4] 3204 	sub	a, c
   77B4 38 15         [12] 3205 	jr	C,00170$
                           3206 ;src/main.c:546: moverEnemigoArriba(enemy);
   77B6 DD 6E F4      [19] 3207 	ld	l,-12 (ix)
   77B9 DD 66 F5      [19] 3208 	ld	h,-11 (ix)
   77BC E5            [11] 3209 	push	hl
   77BD CD 97 6B      [17] 3210 	call	_moverEnemigoArriba
   77C0 F1            [10] 3211 	pop	af
                           3212 ;src/main.c:547: enemy->mover = SI;
   77C1 DD 6E F8      [19] 3213 	ld	l,-8 (ix)
   77C4 DD 66 F9      [19] 3214 	ld	h,-7 (ix)
   77C7 36 01         [10] 3215 	ld	(hl),#0x01
   77C9 18 13         [12] 3216 	jr	00178$
   77CB                    3217 00170$:
                           3218 ;src/main.c:549: moverEnemigoAbajo(enemy);
   77CB DD 6E F4      [19] 3219 	ld	l,-12 (ix)
   77CE DD 66 F5      [19] 3220 	ld	h,-11 (ix)
   77D1 E5            [11] 3221 	push	hl
   77D2 CD B6 6B      [17] 3222 	call	_moverEnemigoAbajo
   77D5 F1            [10] 3223 	pop	af
                           3224 ;src/main.c:550: enemy->mover = SI;
   77D6 DD 6E F8      [19] 3225 	ld	l,-8 (ix)
   77D9 DD 66 F9      [19] 3226 	ld	h,-7 (ix)
   77DC 36 01         [10] 3227 	ld	(hl),#0x01
   77DE                    3228 00178$:
                           3229 ;src/main.c:555: if (!movY) {
   77DE DD 7E F2      [19] 3230 	ld	a,-14 (ix)
   77E1 B7            [ 4] 3231 	or	a, a
   77E2 C2 09 79      [10] 3232 	jp	NZ,00208$
                           3233 ;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
   77E5 DD 6E F4      [19] 3234 	ld	l,-12 (ix)
   77E8 DD 66 F5      [19] 3235 	ld	h,-11 (ix)
   77EB 4E            [ 7] 3236 	ld	c,(hl)
                           3237 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   77EC DD 6E F6      [19] 3238 	ld	l,-10 (ix)
   77EF DD 66 F7      [19] 3239 	ld	h,-9 (ix)
   77F2 56            [ 7] 3240 	ld	d,(hl)
                           3241 ;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
   77F3 79            [ 4] 3242 	ld	a,c
   77F4 D6 28         [ 7] 3243 	sub	a, #0x28
   77F6 D2 7F 78      [10] 3244 	jp	NC,00190$
                           3245 ;src/main.c:557: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   77F9 D5            [11] 3246 	push	de
   77FA 33            [ 6] 3247 	inc	sp
   77FB 79            [ 4] 3248 	ld	a,c
   77FC F5            [11] 3249 	push	af
   77FD 33            [ 6] 3250 	inc	sp
   77FE 2A 48 65      [16] 3251 	ld	hl,(_mapa)
   7801 E5            [11] 3252 	push	hl
   7802 CD 71 4B      [17] 3253 	call	_getTilePtr
   7805 F1            [10] 3254 	pop	af
   7806 F1            [10] 3255 	pop	af
   7807 4E            [ 7] 3256 	ld	c,(hl)
   7808 3E 02         [ 7] 3257 	ld	a,#0x02
   780A 91            [ 4] 3258 	sub	a, c
   780B 38 5C         [12] 3259 	jr	C,00180$
                           3260 ;src/main.c:558: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   780D DD 6E F6      [19] 3261 	ld	l,-10 (ix)
   7810 DD 66 F7      [19] 3262 	ld	h,-9 (ix)
   7813 7E            [ 7] 3263 	ld	a,(hl)
   7814 C6 0B         [ 7] 3264 	add	a, #0x0B
   7816 DD 6E F4      [19] 3265 	ld	l,-12 (ix)
   7819 DD 66 F5      [19] 3266 	ld	h,-11 (ix)
   781C 46            [ 7] 3267 	ld	b,(hl)
   781D F5            [11] 3268 	push	af
   781E 33            [ 6] 3269 	inc	sp
   781F C5            [11] 3270 	push	bc
   7820 33            [ 6] 3271 	inc	sp
   7821 2A 48 65      [16] 3272 	ld	hl,(_mapa)
   7824 E5            [11] 3273 	push	hl
   7825 CD 71 4B      [17] 3274 	call	_getTilePtr
   7828 F1            [10] 3275 	pop	af
   7829 F1            [10] 3276 	pop	af
   782A 4E            [ 7] 3277 	ld	c,(hl)
   782B 3E 02         [ 7] 3278 	ld	a,#0x02
   782D 91            [ 4] 3279 	sub	a, c
   782E 38 39         [12] 3280 	jr	C,00180$
                           3281 ;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7830 DD 6E F6      [19] 3282 	ld	l,-10 (ix)
   7833 DD 66 F7      [19] 3283 	ld	h,-9 (ix)
   7836 7E            [ 7] 3284 	ld	a,(hl)
   7837 C6 16         [ 7] 3285 	add	a, #0x16
   7839 DD 6E F4      [19] 3286 	ld	l,-12 (ix)
   783C DD 66 F5      [19] 3287 	ld	h,-11 (ix)
   783F 46            [ 7] 3288 	ld	b,(hl)
   7840 F5            [11] 3289 	push	af
   7841 33            [ 6] 3290 	inc	sp
   7842 C5            [11] 3291 	push	bc
   7843 33            [ 6] 3292 	inc	sp
   7844 2A 48 65      [16] 3293 	ld	hl,(_mapa)
   7847 E5            [11] 3294 	push	hl
   7848 CD 71 4B      [17] 3295 	call	_getTilePtr
   784B F1            [10] 3296 	pop	af
   784C F1            [10] 3297 	pop	af
   784D 4E            [ 7] 3298 	ld	c,(hl)
   784E 3E 02         [ 7] 3299 	ld	a,#0x02
   7850 91            [ 4] 3300 	sub	a, c
   7851 38 16         [12] 3301 	jr	C,00180$
                           3302 ;src/main.c:560: moverEnemigoIzquierda(enemy);
   7853 DD 6E F4      [19] 3303 	ld	l,-12 (ix)
   7856 DD 66 F5      [19] 3304 	ld	h,-11 (ix)
   7859 E5            [11] 3305 	push	hl
   785A CD E5 6B      [17] 3306 	call	_moverEnemigoIzquierda
   785D F1            [10] 3307 	pop	af
                           3308 ;src/main.c:561: enemy->mover = SI;
   785E DD 6E F8      [19] 3309 	ld	l,-8 (ix)
   7861 DD 66 F9      [19] 3310 	ld	h,-7 (ix)
   7864 36 01         [10] 3311 	ld	(hl),#0x01
   7866 C3 09 79      [10] 3312 	jp	00208$
   7869                    3313 00180$:
                           3314 ;src/main.c:563: moverEnemigoDerecha(enemy);
   7869 DD 6E F4      [19] 3315 	ld	l,-12 (ix)
   786C DD 66 F5      [19] 3316 	ld	h,-11 (ix)
   786F E5            [11] 3317 	push	hl
   7870 CD D5 6B      [17] 3318 	call	_moverEnemigoDerecha
   7873 F1            [10] 3319 	pop	af
                           3320 ;src/main.c:564: enemy->mover = SI;
   7874 DD 6E F8      [19] 3321 	ld	l,-8 (ix)
   7877 DD 66 F9      [19] 3322 	ld	h,-7 (ix)
   787A 36 01         [10] 3323 	ld	(hl),#0x01
   787C C3 09 79      [10] 3324 	jp	00208$
   787F                    3325 00190$:
                           3326 ;src/main.c:567: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   787F 79            [ 4] 3327 	ld	a,c
   7880 C6 04         [ 7] 3328 	add	a, #0x04
   7882 D5            [11] 3329 	push	de
   7883 33            [ 6] 3330 	inc	sp
   7884 F5            [11] 3331 	push	af
   7885 33            [ 6] 3332 	inc	sp
   7886 2A 48 65      [16] 3333 	ld	hl,(_mapa)
   7889 E5            [11] 3334 	push	hl
   788A CD 71 4B      [17] 3335 	call	_getTilePtr
   788D F1            [10] 3336 	pop	af
   788E F1            [10] 3337 	pop	af
   788F 4E            [ 7] 3338 	ld	c,(hl)
   7890 3E 02         [ 7] 3339 	ld	a,#0x02
   7892 91            [ 4] 3340 	sub	a, c
   7893 38 61         [12] 3341 	jr	C,00185$
                           3342 ;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7895 DD 6E F6      [19] 3343 	ld	l,-10 (ix)
   7898 DD 66 F7      [19] 3344 	ld	h,-9 (ix)
   789B 7E            [ 7] 3345 	ld	a,(hl)
   789C C6 0B         [ 7] 3346 	add	a, #0x0B
   789E 47            [ 4] 3347 	ld	b,a
   789F DD 6E F4      [19] 3348 	ld	l,-12 (ix)
   78A2 DD 66 F5      [19] 3349 	ld	h,-11 (ix)
   78A5 7E            [ 7] 3350 	ld	a,(hl)
   78A6 C6 04         [ 7] 3351 	add	a, #0x04
   78A8 C5            [11] 3352 	push	bc
   78A9 33            [ 6] 3353 	inc	sp
   78AA F5            [11] 3354 	push	af
   78AB 33            [ 6] 3355 	inc	sp
   78AC 2A 48 65      [16] 3356 	ld	hl,(_mapa)
   78AF E5            [11] 3357 	push	hl
   78B0 CD 71 4B      [17] 3358 	call	_getTilePtr
   78B3 F1            [10] 3359 	pop	af
   78B4 F1            [10] 3360 	pop	af
   78B5 4E            [ 7] 3361 	ld	c,(hl)
   78B6 3E 02         [ 7] 3362 	ld	a,#0x02
   78B8 91            [ 4] 3363 	sub	a, c
   78B9 38 3B         [12] 3364 	jr	C,00185$
                           3365 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78BB DD 6E F6      [19] 3366 	ld	l,-10 (ix)
   78BE DD 66 F7      [19] 3367 	ld	h,-9 (ix)
   78C1 7E            [ 7] 3368 	ld	a,(hl)
   78C2 C6 16         [ 7] 3369 	add	a, #0x16
   78C4 47            [ 4] 3370 	ld	b,a
   78C5 DD 6E F4      [19] 3371 	ld	l,-12 (ix)
   78C8 DD 66 F5      [19] 3372 	ld	h,-11 (ix)
   78CB 7E            [ 7] 3373 	ld	a,(hl)
   78CC C6 04         [ 7] 3374 	add	a, #0x04
   78CE C5            [11] 3375 	push	bc
   78CF 33            [ 6] 3376 	inc	sp
   78D0 F5            [11] 3377 	push	af
   78D1 33            [ 6] 3378 	inc	sp
   78D2 2A 48 65      [16] 3379 	ld	hl,(_mapa)
   78D5 E5            [11] 3380 	push	hl
   78D6 CD 71 4B      [17] 3381 	call	_getTilePtr
   78D9 F1            [10] 3382 	pop	af
   78DA F1            [10] 3383 	pop	af
   78DB 4E            [ 7] 3384 	ld	c,(hl)
   78DC 3E 02         [ 7] 3385 	ld	a,#0x02
   78DE 91            [ 4] 3386 	sub	a, c
   78DF 38 15         [12] 3387 	jr	C,00185$
                           3388 ;src/main.c:570: moverEnemigoDerecha(enemy);
   78E1 DD 6E F4      [19] 3389 	ld	l,-12 (ix)
   78E4 DD 66 F5      [19] 3390 	ld	h,-11 (ix)
   78E7 E5            [11] 3391 	push	hl
   78E8 CD D5 6B      [17] 3392 	call	_moverEnemigoDerecha
   78EB F1            [10] 3393 	pop	af
                           3394 ;src/main.c:571: enemy->mover = SI;
   78EC DD 6E F8      [19] 3395 	ld	l,-8 (ix)
   78EF DD 66 F9      [19] 3396 	ld	h,-7 (ix)
   78F2 36 01         [10] 3397 	ld	(hl),#0x01
   78F4 18 13         [12] 3398 	jr	00208$
   78F6                    3399 00185$:
                           3400 ;src/main.c:574: moverEnemigoIzquierda(enemy);
   78F6 DD 6E F4      [19] 3401 	ld	l,-12 (ix)
   78F9 DD 66 F5      [19] 3402 	ld	h,-11 (ix)
   78FC E5            [11] 3403 	push	hl
   78FD CD E5 6B      [17] 3404 	call	_moverEnemigoIzquierda
   7900 F1            [10] 3405 	pop	af
                           3406 ;src/main.c:575: enemy->mover = SI;
   7901 DD 6E F8      [19] 3407 	ld	l,-8 (ix)
   7904 DD 66 F9      [19] 3408 	ld	h,-7 (ix)
   7907 36 01         [10] 3409 	ld	(hl),#0x01
   7909                    3410 00208$:
   7909 DD F9         [10] 3411 	ld	sp, ix
   790B DD E1         [14] 3412 	pop	ix
   790D C9            [10] 3413 	ret
                           3414 ;src/main.c:585: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3415 ;	---------------------------------
                           3416 ; Function updateEnemy
                           3417 ; ---------------------------------
   790E                    3418 _updateEnemy::
   790E DD E5         [15] 3419 	push	ix
   7910 DD 21 00 00   [14] 3420 	ld	ix,#0
   7914 DD 39         [15] 3421 	add	ix,sp
   7916 21 F4 FF      [10] 3422 	ld	hl,#-12
   7919 39            [11] 3423 	add	hl,sp
   791A F9            [ 6] 3424 	ld	sp,hl
                           3425 ;src/main.c:592: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   791B DD 4E 04      [19] 3426 	ld	c,4 (ix)
   791E DD 46 05      [19] 3427 	ld	b,5 (ix)
   7921 21 15 00      [10] 3428 	ld	hl,#0x0015
   7924 09            [11] 3429 	add	hl,bc
   7925 DD 75 FB      [19] 3430 	ld	-5 (ix),l
   7928 DD 74 FC      [19] 3431 	ld	-4 (ix),h
   792B DD 6E FB      [19] 3432 	ld	l,-5 (ix)
   792E DD 66 FC      [19] 3433 	ld	h,-4 (ix)
   7931 7E            [ 7] 3434 	ld	a,(hl)
   7932 B7            [ 4] 3435 	or	a, a
   7933 28 19         [12] 3436 	jr	Z,00115$
                           3437 ;src/main.c:593: enemy->patrolling = 0;
   7935 21 E4 60      [10] 3438 	ld	hl,#(_enemy + 0x000a)
   7938 36 00         [10] 3439 	ld	(hl),#0x00
                           3440 ;src/main.c:594: engage(actual, prota.x, prota.y);
   793A 3A 67 64      [13] 3441 	ld	a, (#_prota + 1)
   793D 21 66 64      [10] 3442 	ld	hl, #_prota + 0
   7940 56            [ 7] 3443 	ld	d,(hl)
   7941 F5            [11] 3444 	push	af
   7942 33            [ 6] 3445 	inc	sp
   7943 D5            [11] 3446 	push	de
   7944 33            [ 6] 3447 	inc	sp
   7945 C5            [11] 3448 	push	bc
   7946 CD FB 70      [17] 3449 	call	_engage
   7949 F1            [10] 3450 	pop	af
   794A F1            [10] 3451 	pop	af
   794B C3 65 7A      [10] 3452 	jp	00117$
   794E                    3453 00115$:
                           3454 ;src/main.c:596: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   794E C5            [11] 3455 	push	bc
   794F C5            [11] 3456 	push	bc
   7950 CD 40 6E      [17] 3457 	call	_lookFor
   7953 F1            [10] 3458 	pop	af
   7954 C1            [10] 3459 	pop	bc
                           3460 ;src/main.c:602: actual->patrolling = 0;
   7955 21 0A 00      [10] 3461 	ld	hl,#0x000A
   7958 09            [11] 3462 	add	hl,bc
   7959 E3            [19] 3463 	ex	(sp), hl
                           3464 ;src/main.c:597: if (actual->patrolling) {
   795A E1            [10] 3465 	pop	hl
   795B E5            [11] 3466 	push	hl
   795C 6E            [ 7] 3467 	ld	l,(hl)
                           3468 ;src/main.c:600: if (actual->in_range) {
   795D 79            [ 4] 3469 	ld	a,c
   795E C6 10         [ 7] 3470 	add	a, #0x10
   7960 5F            [ 4] 3471 	ld	e,a
   7961 78            [ 4] 3472 	ld	a,b
   7962 CE 00         [ 7] 3473 	adc	a, #0x00
   7964 57            [ 4] 3474 	ld	d,a
                           3475 ;src/main.c:608: actual->seek = 1;
   7965 79            [ 4] 3476 	ld	a,c
   7966 C6 13         [ 7] 3477 	add	a, #0x13
   7968 DD 77 FD      [19] 3478 	ld	-3 (ix),a
   796B 78            [ 4] 3479 	ld	a,b
   796C CE 00         [ 7] 3480 	adc	a, #0x00
   796E DD 77 FE      [19] 3481 	ld	-2 (ix),a
                           3482 ;src/main.c:597: if (actual->patrolling) {
   7971 7D            [ 4] 3483 	ld	a,l
   7972 B7            [ 4] 3484 	or	a, a
   7973 CA 2D 7A      [10] 3485 	jp	Z,00112$
                           3486 ;src/main.c:599: moverEnemigoPatrol(actual);
   7976 C5            [11] 3487 	push	bc
   7977 D5            [11] 3488 	push	de
   7978 C5            [11] 3489 	push	bc
   7979 CD F7 6B      [17] 3490 	call	_moverEnemigoPatrol
   797C F1            [10] 3491 	pop	af
   797D D1            [10] 3492 	pop	de
   797E C1            [10] 3493 	pop	bc
                           3494 ;src/main.c:600: if (actual->in_range) {
   797F 1A            [ 7] 3495 	ld	a,(de)
   7980 B7            [ 4] 3496 	or	a, a
   7981 28 20         [12] 3497 	jr	Z,00104$
                           3498 ;src/main.c:601: engage(actual, prota.x, prota.y);
   7983 3A 67 64      [13] 3499 	ld	a, (#_prota + 1)
   7986 21 66 64      [10] 3500 	ld	hl, #_prota + 0
   7989 56            [ 7] 3501 	ld	d,(hl)
   798A F5            [11] 3502 	push	af
   798B 33            [ 6] 3503 	inc	sp
   798C D5            [11] 3504 	push	de
   798D 33            [ 6] 3505 	inc	sp
   798E C5            [11] 3506 	push	bc
   798F CD FB 70      [17] 3507 	call	_engage
   7992 F1            [10] 3508 	pop	af
   7993 F1            [10] 3509 	pop	af
                           3510 ;src/main.c:602: actual->patrolling = 0;
   7994 E1            [10] 3511 	pop	hl
   7995 E5            [11] 3512 	push	hl
   7996 36 00         [10] 3513 	ld	(hl),#0x00
                           3514 ;src/main.c:603: actual->engage = 1;
   7998 DD 6E FB      [19] 3515 	ld	l,-5 (ix)
   799B DD 66 FC      [19] 3516 	ld	h,-4 (ix)
   799E 36 01         [10] 3517 	ld	(hl),#0x01
   79A0 C3 65 7A      [10] 3518 	jp	00117$
   79A3                    3519 00104$:
                           3520 ;src/main.c:604: } else if (actual->seen) {
   79A3 21 11 00      [10] 3521 	ld	hl,#0x0011
   79A6 09            [11] 3522 	add	hl,bc
   79A7 DD 75 F6      [19] 3523 	ld	-10 (ix),l
   79AA DD 74 F7      [19] 3524 	ld	-9 (ix),h
   79AD DD 6E F6      [19] 3525 	ld	l,-10 (ix)
   79B0 DD 66 F7      [19] 3526 	ld	h,-9 (ix)
   79B3 7E            [ 7] 3527 	ld	a,(hl)
   79B4 B7            [ 4] 3528 	or	a, a
   79B5 CA 65 7A      [10] 3529 	jp	Z,00117$
                           3530 ;src/main.c:605: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79B8 3A 67 64      [13] 3531 	ld	a,(#_prota + 1)
   79BB DD 77 F8      [19] 3532 	ld	-8 (ix),a
   79BE 21 66 64      [10] 3533 	ld	hl, #_prota + 0
   79C1 5E            [ 7] 3534 	ld	e,(hl)
   79C2 21 01 00      [10] 3535 	ld	hl,#0x0001
   79C5 09            [11] 3536 	add	hl,bc
   79C6 DD 75 F9      [19] 3537 	ld	-7 (ix),l
   79C9 DD 74 FA      [19] 3538 	ld	-6 (ix),h
   79CC DD 6E F9      [19] 3539 	ld	l,-7 (ix)
   79CF DD 66 FA      [19] 3540 	ld	h,-6 (ix)
   79D2 56            [ 7] 3541 	ld	d,(hl)
   79D3 0A            [ 7] 3542 	ld	a,(bc)
   79D4 DD 77 FF      [19] 3543 	ld	-1 (ix),a
   79D7 C5            [11] 3544 	push	bc
   79D8 2A 48 65      [16] 3545 	ld	hl,(_mapa)
   79DB E5            [11] 3546 	push	hl
   79DC C5            [11] 3547 	push	bc
   79DD DD 7E F8      [19] 3548 	ld	a,-8 (ix)
   79E0 F5            [11] 3549 	push	af
   79E1 33            [ 6] 3550 	inc	sp
   79E2 7B            [ 4] 3551 	ld	a,e
   79E3 F5            [11] 3552 	push	af
   79E4 33            [ 6] 3553 	inc	sp
   79E5 D5            [11] 3554 	push	de
   79E6 33            [ 6] 3555 	inc	sp
   79E7 DD 7E FF      [19] 3556 	ld	a,-1 (ix)
   79EA F5            [11] 3557 	push	af
   79EB 33            [ 6] 3558 	inc	sp
   79EC CD 72 49      [17] 3559 	call	_pathFinding
   79EF 21 08 00      [10] 3560 	ld	hl,#8
   79F2 39            [11] 3561 	add	hl,sp
   79F3 F9            [ 6] 3562 	ld	sp,hl
   79F4 C1            [10] 3563 	pop	bc
                           3564 ;src/main.c:606: actual->p_seek_x = actual->x;
   79F5 21 17 00      [10] 3565 	ld	hl,#0x0017
   79F8 09            [11] 3566 	add	hl,bc
   79F9 EB            [ 4] 3567 	ex	de,hl
   79FA 0A            [ 7] 3568 	ld	a,(bc)
   79FB 12            [ 7] 3569 	ld	(de),a
                           3570 ;src/main.c:607: actual->p_seek_y = actual->y;
   79FC 21 18 00      [10] 3571 	ld	hl,#0x0018
   79FF 09            [11] 3572 	add	hl,bc
   7A00 EB            [ 4] 3573 	ex	de,hl
   7A01 DD 6E F9      [19] 3574 	ld	l,-7 (ix)
   7A04 DD 66 FA      [19] 3575 	ld	h,-6 (ix)
   7A07 7E            [ 7] 3576 	ld	a,(hl)
   7A08 12            [ 7] 3577 	ld	(de),a
                           3578 ;src/main.c:608: actual->seek = 1;
   7A09 DD 6E FD      [19] 3579 	ld	l,-3 (ix)
   7A0C DD 66 FE      [19] 3580 	ld	h,-2 (ix)
   7A0F 36 01         [10] 3581 	ld	(hl),#0x01
                           3582 ;src/main.c:609: actual->iter=0;
   7A11 21 0D 00      [10] 3583 	ld	hl,#0x000D
   7A14 09            [11] 3584 	add	hl,bc
   7A15 AF            [ 4] 3585 	xor	a, a
   7A16 77            [ 7] 3586 	ld	(hl), a
   7A17 23            [ 6] 3587 	inc	hl
   7A18 77            [ 7] 3588 	ld	(hl), a
                           3589 ;src/main.c:610: actual->reversePatrol = NO;
   7A19 21 0B 00      [10] 3590 	ld	hl,#0x000B
   7A1C 09            [11] 3591 	add	hl,bc
   7A1D 36 00         [10] 3592 	ld	(hl),#0x00
                           3593 ;src/main.c:611: actual->patrolling = 0;
   7A1F E1            [10] 3594 	pop	hl
   7A20 E5            [11] 3595 	push	hl
   7A21 36 00         [10] 3596 	ld	(hl),#0x00
                           3597 ;src/main.c:612: actual->seen = 0;
   7A23 DD 6E F6      [19] 3598 	ld	l,-10 (ix)
   7A26 DD 66 F7      [19] 3599 	ld	h,-9 (ix)
   7A29 36 00         [10] 3600 	ld	(hl),#0x00
   7A2B 18 38         [12] 3601 	jr	00117$
   7A2D                    3602 00112$:
                           3603 ;src/main.c:614: } else if (actual->seek) {
   7A2D DD 6E FD      [19] 3604 	ld	l,-3 (ix)
   7A30 DD 66 FE      [19] 3605 	ld	h,-2 (ix)
   7A33 7E            [ 7] 3606 	ld	a,(hl)
   7A34 B7            [ 4] 3607 	or	a, a
   7A35 28 2E         [12] 3608 	jr	Z,00117$
                           3609 ;src/main.c:615: moverEnemigoSeek(actual);
   7A37 C5            [11] 3610 	push	bc
   7A38 D5            [11] 3611 	push	de
   7A39 C5            [11] 3612 	push	bc
   7A3A CD 49 6F      [17] 3613 	call	_moverEnemigoSeek
   7A3D F1            [10] 3614 	pop	af
   7A3E D1            [10] 3615 	pop	de
   7A3F C1            [10] 3616 	pop	bc
                           3617 ;src/main.c:616: if (actual->in_range) {
   7A40 1A            [ 7] 3618 	ld	a,(de)
   7A41 B7            [ 4] 3619 	or	a, a
   7A42 28 21         [12] 3620 	jr	Z,00117$
                           3621 ;src/main.c:617: engage(actual, prota.x, prota.y);
   7A44 3A 67 64      [13] 3622 	ld	a, (#_prota + 1)
   7A47 21 66 64      [10] 3623 	ld	hl, #_prota + 0
   7A4A 56            [ 7] 3624 	ld	d,(hl)
   7A4B F5            [11] 3625 	push	af
   7A4C 33            [ 6] 3626 	inc	sp
   7A4D D5            [11] 3627 	push	de
   7A4E 33            [ 6] 3628 	inc	sp
   7A4F C5            [11] 3629 	push	bc
   7A50 CD FB 70      [17] 3630 	call	_engage
   7A53 F1            [10] 3631 	pop	af
   7A54 F1            [10] 3632 	pop	af
                           3633 ;src/main.c:618: actual->seek = 0;
   7A55 DD 6E FD      [19] 3634 	ld	l,-3 (ix)
   7A58 DD 66 FE      [19] 3635 	ld	h,-2 (ix)
   7A5B 36 00         [10] 3636 	ld	(hl),#0x00
                           3637 ;src/main.c:619: actual->engage = 1;
   7A5D DD 6E FB      [19] 3638 	ld	l,-5 (ix)
   7A60 DD 66 FC      [19] 3639 	ld	h,-4 (ix)
   7A63 36 01         [10] 3640 	ld	(hl),#0x01
                           3641 ;src/main.c:620: } else if (actual->seen) {
   7A65                    3642 00117$:
   7A65 DD F9         [10] 3643 	ld	sp, ix
   7A67 DD E1         [14] 3644 	pop	ix
   7A69 C9            [10] 3645 	ret
                           3646 ;src/main.c:627: void inicializarEnemy() {
                           3647 ;	---------------------------------
                           3648 ; Function inicializarEnemy
                           3649 ; ---------------------------------
   7A6A                    3650 _inicializarEnemy::
   7A6A DD E5         [15] 3651 	push	ix
   7A6C DD 21 00 00   [14] 3652 	ld	ix,#0
   7A70 DD 39         [15] 3653 	add	ix,sp
   7A72 21 F9 FF      [10] 3654 	ld	hl,#-7
   7A75 39            [11] 3655 	add	hl,sp
   7A76 F9            [ 6] 3656 	ld	sp,hl
                           3657 ;src/main.c:628: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7A77 3A 4A 65      [13] 3658 	ld	a,(#_num_mapa + 0)
   7A7A C6 02         [ 7] 3659 	add	a, #0x02
   7A7C DD 77 FF      [19] 3660 	ld	-1 (ix),a
                           3661 ;src/main.c:638: actual = enemy;
   7A7F 11 DA 60      [10] 3662 	ld	de,#_enemy+0
                           3663 ;src/main.c:639: while(i){
   7A82                    3664 00101$:
   7A82 DD 7E FF      [19] 3665 	ld	a,-1 (ix)
   7A85 B7            [ 4] 3666 	or	a, a
   7A86 CA 8A 7B      [10] 3667 	jp	Z,00104$
                           3668 ;src/main.c:640: --i;
   7A89 DD 35 FF      [23] 3669 	dec	-1 (ix)
                           3670 ;src/main.c:641: actual->x = actual->px = spawnX[i];
   7A8C 4B            [ 4] 3671 	ld	c, e
   7A8D 42            [ 4] 3672 	ld	b, d
   7A8E 03            [ 6] 3673 	inc	bc
   7A8F 03            [ 6] 3674 	inc	bc
   7A90 3E 6C         [ 7] 3675 	ld	a,#<(_spawnX)
   7A92 DD 86 FF      [19] 3676 	add	a, -1 (ix)
   7A95 DD 77 FD      [19] 3677 	ld	-3 (ix),a
   7A98 3E 65         [ 7] 3678 	ld	a,#>(_spawnX)
   7A9A CE 00         [ 7] 3679 	adc	a, #0x00
   7A9C DD 77 FE      [19] 3680 	ld	-2 (ix),a
   7A9F DD 6E FD      [19] 3681 	ld	l,-3 (ix)
   7AA2 DD 66 FE      [19] 3682 	ld	h,-2 (ix)
   7AA5 7E            [ 7] 3683 	ld	a,(hl)
   7AA6 02            [ 7] 3684 	ld	(bc),a
   7AA7 12            [ 7] 3685 	ld	(de),a
                           3686 ;src/main.c:642: actual->y = actual->py = spawnY[i];
   7AA8 D5            [11] 3687 	push	de
   7AA9 FD E1         [14] 3688 	pop	iy
   7AAB FD 23         [10] 3689 	inc	iy
   7AAD 4B            [ 4] 3690 	ld	c, e
   7AAE 42            [ 4] 3691 	ld	b, d
   7AAF 03            [ 6] 3692 	inc	bc
   7AB0 03            [ 6] 3693 	inc	bc
   7AB1 03            [ 6] 3694 	inc	bc
   7AB2 3E 70         [ 7] 3695 	ld	a,#<(_spawnY)
   7AB4 DD 86 FF      [19] 3696 	add	a, -1 (ix)
   7AB7 DD 77 FB      [19] 3697 	ld	-5 (ix),a
   7ABA 3E 65         [ 7] 3698 	ld	a,#>(_spawnY)
   7ABC CE 00         [ 7] 3699 	adc	a, #0x00
   7ABE DD 77 FC      [19] 3700 	ld	-4 (ix),a
   7AC1 DD 6E FB      [19] 3701 	ld	l,-5 (ix)
   7AC4 DD 66 FC      [19] 3702 	ld	h,-4 (ix)
   7AC7 7E            [ 7] 3703 	ld	a,(hl)
   7AC8 02            [ 7] 3704 	ld	(bc),a
   7AC9 FD 77 00      [19] 3705 	ld	0 (iy), a
                           3706 ;src/main.c:643: actual->mover  = NO;
   7ACC 21 06 00      [10] 3707 	ld	hl,#0x0006
   7ACF 19            [11] 3708 	add	hl,de
   7AD0 36 00         [10] 3709 	ld	(hl),#0x00
                           3710 ;src/main.c:644: actual->mira   = M_abajo;
   7AD2 21 07 00      [10] 3711 	ld	hl,#0x0007
   7AD5 19            [11] 3712 	add	hl,de
   7AD6 36 03         [10] 3713 	ld	(hl),#0x03
                           3714 ;src/main.c:645: actual->sprite = g_enemy;
   7AD8 21 04 00      [10] 3715 	ld	hl,#0x0004
   7ADB 19            [11] 3716 	add	hl,de
   7ADC 36 3A         [10] 3717 	ld	(hl),#<(_g_enemy)
   7ADE 23            [ 6] 3718 	inc	hl
   7ADF 36 3C         [10] 3719 	ld	(hl),#>(_g_enemy)
                           3720 ;src/main.c:646: actual->muerto = NO;
   7AE1 21 08 00      [10] 3721 	ld	hl,#0x0008
   7AE4 19            [11] 3722 	add	hl,de
   7AE5 36 00         [10] 3723 	ld	(hl),#0x00
                           3724 ;src/main.c:647: actual->muertes = 0;
   7AE7 21 09 00      [10] 3725 	ld	hl,#0x0009
   7AEA 19            [11] 3726 	add	hl,de
   7AEB 36 00         [10] 3727 	ld	(hl),#0x00
                           3728 ;src/main.c:648: actual->patrolling = SI;
   7AED 21 0A 00      [10] 3729 	ld	hl,#0x000A
   7AF0 19            [11] 3730 	add	hl,de
   7AF1 36 01         [10] 3731 	ld	(hl),#0x01
                           3732 ;src/main.c:649: actual->reversePatrol = NO;
   7AF3 21 0B 00      [10] 3733 	ld	hl,#0x000B
   7AF6 19            [11] 3734 	add	hl,de
   7AF7 36 00         [10] 3735 	ld	(hl),#0x00
                           3736 ;src/main.c:650: actual->didDamage = 0;
   7AF9 21 16 00      [10] 3737 	ld	hl,#0x0016
   7AFC 19            [11] 3738 	add	hl,de
   7AFD 36 00         [10] 3739 	ld	(hl),#0x00
                           3740 ;src/main.c:651: actual->iter = 0;
   7AFF 21 0D 00      [10] 3741 	ld	hl,#0x000D
   7B02 19            [11] 3742 	add	hl,de
   7B03 AF            [ 4] 3743 	xor	a, a
   7B04 77            [ 7] 3744 	ld	(hl), a
   7B05 23            [ 6] 3745 	inc	hl
   7B06 77            [ 7] 3746 	ld	(hl), a
                           3747 ;src/main.c:652: actual->lastIter = 0;
   7B07 21 0F 00      [10] 3748 	ld	hl,#0x000F
   7B0A 19            [11] 3749 	add	hl,de
   7B0B 36 00         [10] 3750 	ld	(hl),#0x00
                           3751 ;src/main.c:653: actual->seen = 0;
   7B0D 21 11 00      [10] 3752 	ld	hl,#0x0011
   7B10 19            [11] 3753 	add	hl,de
   7B11 36 00         [10] 3754 	ld	(hl),#0x00
                           3755 ;src/main.c:654: actual->found = 0;
   7B13 21 12 00      [10] 3756 	ld	hl,#0x0012
   7B16 19            [11] 3757 	add	hl,de
   7B17 36 00         [10] 3758 	ld	(hl),#0x00
                           3759 ;src/main.c:655: actual->engage = 0;
   7B19 21 15 00      [10] 3760 	ld	hl,#0x0015
   7B1C 19            [11] 3761 	add	hl,de
   7B1D 36 00         [10] 3762 	ld	(hl),#0x00
                           3763 ;src/main.c:656: actual->xplot = NO;
   7B1F 21 19 00      [10] 3764 	ld	hl,#0x0019
   7B22 19            [11] 3765 	add	hl,de
   7B23 36 00         [10] 3766 	ld	(hl),#0x00
                           3767 ;src/main.c:657: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B25 21 4A 65      [10] 3768 	ld	hl,#_num_mapa + 0
   7B28 4E            [ 7] 3769 	ld	c, (hl)
   7B29 0C            [ 4] 3770 	inc	c
   7B2A 06 00         [ 7] 3771 	ld	b,#0x00
   7B2C 69            [ 4] 3772 	ld	l, c
   7B2D 60            [ 4] 3773 	ld	h, b
   7B2E 29            [11] 3774 	add	hl, hl
   7B2F 29            [11] 3775 	add	hl, hl
   7B30 09            [11] 3776 	add	hl, bc
   7B31 4D            [ 4] 3777 	ld	c,l
   7B32 44            [ 4] 3778 	ld	b,h
   7B33 21 88 65      [10] 3779 	ld	hl,#_patrolY
   7B36 09            [11] 3780 	add	hl,bc
   7B37 7D            [ 4] 3781 	ld	a,l
   7B38 DD 86 FF      [19] 3782 	add	a, -1 (ix)
   7B3B 6F            [ 4] 3783 	ld	l,a
   7B3C 7C            [ 4] 3784 	ld	a,h
   7B3D CE 00         [ 7] 3785 	adc	a, #0x00
   7B3F 67            [ 4] 3786 	ld	h,a
   7B40 7E            [ 7] 3787 	ld	a,(hl)
   7B41 DD 77 FA      [19] 3788 	ld	-6 (ix),a
   7B44 21 74 65      [10] 3789 	ld	hl,#_patrolX
   7B47 09            [11] 3790 	add	hl,bc
   7B48 DD 4E FF      [19] 3791 	ld	c,-1 (ix)
   7B4B 06 00         [ 7] 3792 	ld	b,#0x00
   7B4D 09            [11] 3793 	add	hl,bc
   7B4E 7E            [ 7] 3794 	ld	a,(hl)
   7B4F DD 77 F9      [19] 3795 	ld	-7 (ix),a
   7B52 DD 6E FB      [19] 3796 	ld	l,-5 (ix)
   7B55 DD 66 FC      [19] 3797 	ld	h,-4 (ix)
   7B58 4E            [ 7] 3798 	ld	c,(hl)
   7B59 DD 6E FD      [19] 3799 	ld	l,-3 (ix)
   7B5C DD 66 FE      [19] 3800 	ld	h,-2 (ix)
   7B5F 46            [ 7] 3801 	ld	b,(hl)
   7B60 D5            [11] 3802 	push	de
   7B61 2A 48 65      [16] 3803 	ld	hl,(_mapa)
   7B64 E5            [11] 3804 	push	hl
   7B65 D5            [11] 3805 	push	de
   7B66 DD 66 FA      [19] 3806 	ld	h,-6 (ix)
   7B69 DD 6E F9      [19] 3807 	ld	l,-7 (ix)
   7B6C E5            [11] 3808 	push	hl
   7B6D 79            [ 4] 3809 	ld	a,c
   7B6E F5            [11] 3810 	push	af
   7B6F 33            [ 6] 3811 	inc	sp
   7B70 C5            [11] 3812 	push	bc
   7B71 33            [ 6] 3813 	inc	sp
   7B72 CD 72 49      [17] 3814 	call	_pathFinding
   7B75 21 08 00      [10] 3815 	ld	hl,#8
   7B78 39            [11] 3816 	add	hl,sp
   7B79 F9            [ 6] 3817 	ld	sp,hl
   7B7A D1            [10] 3818 	pop	de
                           3819 ;src/main.c:658: dibujarEnemigo(actual);
   7B7B D5            [11] 3820 	push	de
   7B7C D5            [11] 3821 	push	de
   7B7D CD 22 68      [17] 3822 	call	_dibujarEnemigo
   7B80 F1            [10] 3823 	pop	af
   7B81 D1            [10] 3824 	pop	de
                           3825 ;src/main.c:659: ++actual;
   7B82 21 E3 00      [10] 3826 	ld	hl,#0x00E3
   7B85 19            [11] 3827 	add	hl,de
   7B86 EB            [ 4] 3828 	ex	de,hl
   7B87 C3 82 7A      [10] 3829 	jp	00101$
   7B8A                    3830 00104$:
   7B8A DD F9         [10] 3831 	ld	sp, ix
   7B8C DD E1         [14] 3832 	pop	ix
   7B8E C9            [10] 3833 	ret
                           3834 ;src/main.c:663: void avanzarMapa() {
                           3835 ;	---------------------------------
                           3836 ; Function avanzarMapa
                           3837 ; ---------------------------------
   7B8F                    3838 _avanzarMapa::
                           3839 ;src/main.c:664: if(num_mapa < NUM_MAPAS -1) {
   7B8F 3A 4A 65      [13] 3840 	ld	a,(#_num_mapa + 0)
   7B92 D6 02         [ 7] 3841 	sub	a, #0x02
   7B94 30 34         [12] 3842 	jr	NC,00102$
                           3843 ;src/main.c:665: mapa = mapas[++num_mapa];
   7B96 01 66 65      [10] 3844 	ld	bc,#_mapas+0
   7B99 21 4A 65      [10] 3845 	ld	hl, #_num_mapa+0
   7B9C 34            [11] 3846 	inc	(hl)
   7B9D FD 21 4A 65   [14] 3847 	ld	iy,#_num_mapa
   7BA1 FD 6E 00      [19] 3848 	ld	l,0 (iy)
   7BA4 26 00         [ 7] 3849 	ld	h,#0x00
   7BA6 29            [11] 3850 	add	hl, hl
   7BA7 09            [11] 3851 	add	hl,bc
   7BA8 7E            [ 7] 3852 	ld	a,(hl)
   7BA9 FD 21 48 65   [14] 3853 	ld	iy,#_mapa
   7BAD FD 77 00      [19] 3854 	ld	0 (iy),a
   7BB0 23            [ 6] 3855 	inc	hl
   7BB1 7E            [ 7] 3856 	ld	a,(hl)
   7BB2 32 49 65      [13] 3857 	ld	(#_mapa + 1),a
                           3858 ;src/main.c:666: prota.x = prota.px = 2;
   7BB5 21 68 64      [10] 3859 	ld	hl,#(_prota + 0x0002)
   7BB8 36 02         [10] 3860 	ld	(hl),#0x02
   7BBA 21 66 64      [10] 3861 	ld	hl,#_prota
   7BBD 36 02         [10] 3862 	ld	(hl),#0x02
                           3863 ;src/main.c:667: prota.mover = SI;
   7BBF 21 6C 64      [10] 3864 	ld	hl,#(_prota + 0x0006)
   7BC2 36 01         [10] 3865 	ld	(hl),#0x01
                           3866 ;src/main.c:668: dibujarMapa();
   7BC4 CD 50 65      [17] 3867 	call	_dibujarMapa
                           3868 ;src/main.c:669: inicializarEnemy();
   7BC7 C3 6A 7A      [10] 3869 	jp  _inicializarEnemy
   7BCA                    3870 00102$:
                           3871 ;src/main.c:672: menuFin(puntuacion);
   7BCA FD 21 4B 65   [14] 3872 	ld	iy,#_puntuacion
   7BCE FD 6E 00      [19] 3873 	ld	l,0 (iy)
   7BD1 26 00         [ 7] 3874 	ld	h,#0x00
   7BD3 C3 F5 4B      [10] 3875 	jp  _menuFin
                           3876 ;src/main.c:676: void moverIzquierda() {
                           3877 ;	---------------------------------
                           3878 ; Function moverIzquierda
                           3879 ; ---------------------------------
   7BD6                    3880 _moverIzquierda::
                           3881 ;src/main.c:677: prota.mira = M_izquierda;
   7BD6 01 66 64      [10] 3882 	ld	bc,#_prota+0
   7BD9 21 6D 64      [10] 3883 	ld	hl,#(_prota + 0x0007)
   7BDC 36 01         [10] 3884 	ld	(hl),#0x01
                           3885 ;src/main.c:678: if (!checkCollision(M_izquierda)) {
   7BDE C5            [11] 3886 	push	bc
   7BDF 3E 01         [ 7] 3887 	ld	a,#0x01
   7BE1 F5            [11] 3888 	push	af
   7BE2 33            [ 6] 3889 	inc	sp
   7BE3 CD B1 66      [17] 3890 	call	_checkCollision
   7BE6 33            [ 6] 3891 	inc	sp
   7BE7 C1            [10] 3892 	pop	bc
   7BE8 7D            [ 4] 3893 	ld	a,l
   7BE9 B7            [ 4] 3894 	or	a, a
   7BEA C0            [11] 3895 	ret	NZ
                           3896 ;src/main.c:679: prota.x--;
   7BEB 0A            [ 7] 3897 	ld	a,(bc)
   7BEC C6 FF         [ 7] 3898 	add	a,#0xFF
   7BEE 02            [ 7] 3899 	ld	(bc),a
                           3900 ;src/main.c:680: prota.mover = SI;
   7BEF 21 6C 64      [10] 3901 	ld	hl,#(_prota + 0x0006)
   7BF2 36 01         [10] 3902 	ld	(hl),#0x01
                           3903 ;src/main.c:681: prota.sprite = g_hero_left;
   7BF4 21 C6 3D      [10] 3904 	ld	hl,#_g_hero_left
   7BF7 22 6A 64      [16] 3905 	ld	((_prota + 0x0004)), hl
   7BFA C9            [10] 3906 	ret
                           3907 ;src/main.c:685: void moverDerecha() {
                           3908 ;	---------------------------------
                           3909 ; Function moverDerecha
                           3910 ; ---------------------------------
   7BFB                    3911 _moverDerecha::
                           3912 ;src/main.c:686: prota.mira = M_derecha;
   7BFB 21 6D 64      [10] 3913 	ld	hl,#(_prota + 0x0007)
   7BFE 36 00         [10] 3914 	ld	(hl),#0x00
                           3915 ;src/main.c:687: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C00 AF            [ 4] 3916 	xor	a, a
   7C01 F5            [11] 3917 	push	af
   7C02 33            [ 6] 3918 	inc	sp
   7C03 CD B1 66      [17] 3919 	call	_checkCollision
   7C06 33            [ 6] 3920 	inc	sp
   7C07 45            [ 4] 3921 	ld	b,l
   7C08 21 66 64      [10] 3922 	ld	hl, #_prota + 0
   7C0B 4E            [ 7] 3923 	ld	c,(hl)
   7C0C 59            [ 4] 3924 	ld	e,c
   7C0D 16 00         [ 7] 3925 	ld	d,#0x00
   7C0F 21 07 00      [10] 3926 	ld	hl,#0x0007
   7C12 19            [11] 3927 	add	hl,de
   7C13 11 50 80      [10] 3928 	ld	de, #0x8050
   7C16 29            [11] 3929 	add	hl, hl
   7C17 3F            [ 4] 3930 	ccf
   7C18 CB 1C         [ 8] 3931 	rr	h
   7C1A CB 1D         [ 8] 3932 	rr	l
   7C1C ED 52         [15] 3933 	sbc	hl, de
   7C1E 3E 00         [ 7] 3934 	ld	a,#0x00
   7C20 17            [ 4] 3935 	rla
   7C21 5F            [ 4] 3936 	ld	e,a
   7C22 78            [ 4] 3937 	ld	a,b
   7C23 B7            [ 4] 3938 	or	a,a
   7C24 20 14         [12] 3939 	jr	NZ,00104$
   7C26 B3            [ 4] 3940 	or	a,e
   7C27 28 11         [12] 3941 	jr	Z,00104$
                           3942 ;src/main.c:688: prota.x++;
   7C29 0C            [ 4] 3943 	inc	c
   7C2A 21 66 64      [10] 3944 	ld	hl,#_prota
   7C2D 71            [ 7] 3945 	ld	(hl),c
                           3946 ;src/main.c:689: prota.mover = SI;
   7C2E 21 6C 64      [10] 3947 	ld	hl,#(_prota + 0x0006)
   7C31 36 01         [10] 3948 	ld	(hl),#0x01
                           3949 ;src/main.c:690: prota.sprite = g_hero;
   7C33 21 70 3E      [10] 3950 	ld	hl,#_g_hero
   7C36 22 6A 64      [16] 3951 	ld	((_prota + 0x0004)), hl
   7C39 C9            [10] 3952 	ret
   7C3A                    3953 00104$:
                           3954 ;src/main.c:691: }else if( prota.x + G_HERO_W >= 80){
   7C3A 7B            [ 4] 3955 	ld	a,e
   7C3B B7            [ 4] 3956 	or	a, a
   7C3C C0            [11] 3957 	ret	NZ
                           3958 ;src/main.c:692: avanzarMapa();
   7C3D C3 8F 7B      [10] 3959 	jp  _avanzarMapa
                           3960 ;src/main.c:696: void moverArriba() {
                           3961 ;	---------------------------------
                           3962 ; Function moverArriba
                           3963 ; ---------------------------------
   7C40                    3964 _moverArriba::
                           3965 ;src/main.c:697: prota.mira = M_arriba;
   7C40 21 6D 64      [10] 3966 	ld	hl,#(_prota + 0x0007)
   7C43 36 02         [10] 3967 	ld	(hl),#0x02
                           3968 ;src/main.c:698: if (!checkCollision(M_arriba)) {
   7C45 3E 02         [ 7] 3969 	ld	a,#0x02
   7C47 F5            [11] 3970 	push	af
   7C48 33            [ 6] 3971 	inc	sp
   7C49 CD B1 66      [17] 3972 	call	_checkCollision
   7C4C 33            [ 6] 3973 	inc	sp
   7C4D 7D            [ 4] 3974 	ld	a,l
   7C4E B7            [ 4] 3975 	or	a, a
   7C4F C0            [11] 3976 	ret	NZ
                           3977 ;src/main.c:699: prota.y--;
   7C50 21 67 64      [10] 3978 	ld	hl,#_prota + 1
   7C53 4E            [ 7] 3979 	ld	c,(hl)
   7C54 0D            [ 4] 3980 	dec	c
   7C55 71            [ 7] 3981 	ld	(hl),c
                           3982 ;src/main.c:700: prota.y--;
   7C56 0D            [ 4] 3983 	dec	c
   7C57 71            [ 7] 3984 	ld	(hl),c
                           3985 ;src/main.c:701: prota.mover  = SI;
   7C58 21 6C 64      [10] 3986 	ld	hl,#(_prota + 0x0006)
   7C5B 36 01         [10] 3987 	ld	(hl),#0x01
                           3988 ;src/main.c:702: prota.sprite = g_hero_up;
   7C5D 21 2C 3D      [10] 3989 	ld	hl,#_g_hero_up
   7C60 22 6A 64      [16] 3990 	ld	((_prota + 0x0004)), hl
   7C63 C9            [10] 3991 	ret
                           3992 ;src/main.c:706: void moverAbajo() {
                           3993 ;	---------------------------------
                           3994 ; Function moverAbajo
                           3995 ; ---------------------------------
   7C64                    3996 _moverAbajo::
                           3997 ;src/main.c:707: prota.mira = M_abajo;
   7C64 21 6D 64      [10] 3998 	ld	hl,#(_prota + 0x0007)
   7C67 36 03         [10] 3999 	ld	(hl),#0x03
                           4000 ;src/main.c:708: if (!checkCollision(M_abajo) ) {
   7C69 3E 03         [ 7] 4001 	ld	a,#0x03
   7C6B F5            [11] 4002 	push	af
   7C6C 33            [ 6] 4003 	inc	sp
   7C6D CD B1 66      [17] 4004 	call	_checkCollision
   7C70 33            [ 6] 4005 	inc	sp
   7C71 7D            [ 4] 4006 	ld	a,l
   7C72 B7            [ 4] 4007 	or	a, a
   7C73 C0            [11] 4008 	ret	NZ
                           4009 ;src/main.c:709: prota.y++;
   7C74 01 67 64      [10] 4010 	ld	bc,#_prota + 1
   7C77 0A            [ 7] 4011 	ld	a,(bc)
   7C78 3C            [ 4] 4012 	inc	a
   7C79 02            [ 7] 4013 	ld	(bc),a
                           4014 ;src/main.c:710: prota.y++;
   7C7A 3C            [ 4] 4015 	inc	a
   7C7B 02            [ 7] 4016 	ld	(bc),a
                           4017 ;src/main.c:711: prota.mover  = SI;
   7C7C 21 6C 64      [10] 4018 	ld	hl,#(_prota + 0x0006)
   7C7F 36 01         [10] 4019 	ld	(hl),#0x01
                           4020 ;src/main.c:712: prota.sprite = g_hero_down;
   7C81 21 92 3C      [10] 4021 	ld	hl,#_g_hero_down
   7C84 22 6A 64      [16] 4022 	ld	((_prota + 0x0004)), hl
   7C87 C9            [10] 4023 	ret
                           4024 ;src/main.c:719: void intHandler() {
                           4025 ;	---------------------------------
                           4026 ; Function intHandler
                           4027 ; ---------------------------------
   7C88                    4028 _intHandler::
                           4029 ;src/main.c:720: if (++i == 6) {
   7C88 21 7E 64      [10] 4030 	ld	hl, #_i+0
   7C8B 34            [11] 4031 	inc	(hl)
   7C8C 3A 7E 64      [13] 4032 	ld	a,(#_i + 0)
   7C8F D6 06         [ 7] 4033 	sub	a, #0x06
   7C91 C0            [11] 4034 	ret	NZ
                           4035 ;src/main.c:721: play();
   7C92 CD AE 53      [17] 4036 	call	_play
                           4037 ;src/main.c:722: i=0;
   7C95 21 7E 64      [10] 4038 	ld	hl,#_i + 0
   7C98 36 00         [10] 4039 	ld	(hl), #0x00
   7C9A C9            [10] 4040 	ret
                           4041 ;src/main.c:726: void inicializarCPC() {
                           4042 ;	---------------------------------
                           4043 ; Function inicializarCPC
                           4044 ; ---------------------------------
   7C9B                    4045 _inicializarCPC::
                           4046 ;src/main.c:727: cpct_disableFirmware();
   7C9B CD 6C 57      [17] 4047 	call	_cpct_disableFirmware
                           4048 ;src/main.c:728: cpct_setVideoMode(0);
   7C9E 2E 00         [ 7] 4049 	ld	l,#0x00
   7CA0 CD 40 57      [17] 4050 	call	_cpct_setVideoMode
                           4051 ;src/main.c:729: cpct_setBorder(HW_BLACK);
   7CA3 21 10 14      [10] 4052 	ld	hl,#0x1410
   7CA6 E5            [11] 4053 	push	hl
   7CA7 CD 8C 54      [17] 4054 	call	_cpct_setPALColour
                           4055 ;src/main.c:730: cpct_setPalette(g_palette, 16);
   7CAA 21 10 00      [10] 4056 	ld	hl,#0x0010
   7CAD E5            [11] 4057 	push	hl
   7CAE 21 60 3E      [10] 4058 	ld	hl,#_g_palette
   7CB1 E5            [11] 4059 	push	hl
   7CB2 CD 69 54      [17] 4060 	call	_cpct_setPalette
   7CB5 C9            [10] 4061 	ret
                           4062 ;src/main.c:735: void inicializarJuego() {
                           4063 ;	---------------------------------
                           4064 ; Function inicializarJuego
                           4065 ; ---------------------------------
   7CB6                    4066 _inicializarJuego::
                           4067 ;src/main.c:736: cambio = 0;
   7CB6 21 7A 64      [10] 4068 	ld	hl,#_cambio + 0
   7CB9 36 00         [10] 4069 	ld	(hl), #0x00
                           4070 ;src/main.c:737: timer = 0;
   7CBB 21 00 00      [10] 4071 	ld	hl,#0x0000
   7CBE 22 7B 64      [16] 4072 	ld	(_timer),hl
                           4073 ;src/main.c:738: parpadeo = 0;
   7CC1 21 79 64      [10] 4074 	ld	hl,#_parpadeo + 0
   7CC4 36 00         [10] 4075 	ld	(hl), #0x00
                           4076 ;src/main.c:740: num_mapa = 0;
   7CC6 21 4A 65      [10] 4077 	ld	hl,#_num_mapa + 0
   7CC9 36 00         [10] 4078 	ld	(hl), #0x00
                           4079 ;src/main.c:741: mapa = mapas[num_mapa];
   7CCB 21 66 65      [10] 4080 	ld	hl, #_mapas + 0
   7CCE 7E            [ 7] 4081 	ld	a,(hl)
   7CCF FD 21 48 65   [14] 4082 	ld	iy,#_mapa
   7CD3 FD 77 00      [19] 4083 	ld	0 (iy),a
   7CD6 23            [ 6] 4084 	inc	hl
   7CD7 7E            [ 7] 4085 	ld	a,(hl)
   7CD8 32 49 65      [13] 4086 	ld	(#_mapa + 1),a
                           4087 ;src/main.c:742: cpct_etm_setTileset2x4(g_tileset);
   7CDB 21 E0 17      [10] 4088 	ld	hl,#_g_tileset
   7CDE CD 7D 56      [17] 4089 	call	_cpct_etm_setTileset2x4
                           4090 ;src/main.c:744: dibujarMapa();
   7CE1 CD 50 65      [17] 4091 	call	_dibujarMapa
                           4092 ;src/main.c:747: barraPuntuacionInicial();
   7CE4 CD 95 51      [17] 4093 	call	_barraPuntuacionInicial
                           4094 ;src/main.c:750: prota.x = prota.px = 4;
   7CE7 21 68 64      [10] 4095 	ld	hl,#(_prota + 0x0002)
   7CEA 36 04         [10] 4096 	ld	(hl),#0x04
   7CEC 21 66 64      [10] 4097 	ld	hl,#_prota
   7CEF 36 04         [10] 4098 	ld	(hl),#0x04
                           4099 ;src/main.c:751: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7CF1 21 69 64      [10] 4100 	ld	hl,#(_prota + 0x0003)
   7CF4 36 68         [10] 4101 	ld	(hl),#0x68
   7CF6 21 67 64      [10] 4102 	ld	hl,#(_prota + 0x0001)
   7CF9 36 68         [10] 4103 	ld	(hl),#0x68
                           4104 ;src/main.c:752: prota.mover  = NO;
   7CFB 21 6C 64      [10] 4105 	ld	hl,#(_prota + 0x0006)
   7CFE 36 00         [10] 4106 	ld	(hl),#0x00
                           4107 ;src/main.c:753: prota.mira=M_derecha;
   7D00 21 6D 64      [10] 4108 	ld	hl,#(_prota + 0x0007)
   7D03 36 00         [10] 4109 	ld	(hl),#0x00
                           4110 ;src/main.c:754: prota.sprite = g_hero;
   7D05 21 70 3E      [10] 4111 	ld	hl,#_g_hero
   7D08 22 6A 64      [16] 4112 	ld	((_prota + 0x0004)), hl
                           4113 ;src/main.c:758: cu.x = cu.px = 0;
   7D0B 21 70 64      [10] 4114 	ld	hl,#(_cu + 0x0002)
   7D0E 36 00         [10] 4115 	ld	(hl),#0x00
   7D10 21 6E 64      [10] 4116 	ld	hl,#_cu
   7D13 36 00         [10] 4117 	ld	(hl),#0x00
                           4118 ;src/main.c:759: cu.y = cu.py = 0;
   7D15 21 71 64      [10] 4119 	ld	hl,#(_cu + 0x0003)
   7D18 36 00         [10] 4120 	ld	(hl),#0x00
   7D1A 21 6F 64      [10] 4121 	ld	hl,#(_cu + 0x0001)
   7D1D 36 00         [10] 4122 	ld	(hl),#0x00
                           4123 ;src/main.c:760: cu.lanzado = NO;
   7D1F 21 74 64      [10] 4124 	ld	hl,#(_cu + 0x0006)
   7D22 36 00         [10] 4125 	ld	(hl),#0x00
                           4126 ;src/main.c:761: cu.mover = NO;
   7D24 21 77 64      [10] 4127 	ld	hl,#(_cu + 0x0009)
   7D27 36 00         [10] 4128 	ld	(hl),#0x00
                           4129 ;src/main.c:762: cu.off_bound = NO;
   7D29 21 78 64      [10] 4130 	ld	hl,#(_cu + 0x000a)
   7D2C 36 00         [10] 4131 	ld	(hl),#0x00
                           4132 ;src/main.c:764: inicializarEnemy();
   7D2E CD 6A 7A      [17] 4133 	call	_inicializarEnemy
                           4134 ;src/main.c:766: dibujarProta();
   7D31 C3 9C 65      [10] 4135 	jp  _dibujarProta
                           4136 ;src/main.c:769: void main(void) {
                           4137 ;	---------------------------------
                           4138 ; Function main
                           4139 ; ---------------------------------
   7D34                    4140 _main::
   7D34 DD E5         [15] 4141 	push	ix
   7D36 DD 21 00 00   [14] 4142 	ld	ix,#0
   7D3A DD 39         [15] 4143 	add	ix,sp
   7D3C 21 F3 FF      [10] 4144 	ld	hl,#-13
   7D3F 39            [11] 4145 	add	hl,sp
   7D40 F9            [ 6] 4146 	ld	sp,hl
                           4147 ;src/main.c:774: vidas = 100;
   7D41 21 7D 64      [10] 4148 	ld	hl,#_vidas + 0
   7D44 36 64         [10] 4149 	ld	(hl), #0x64
                           4150 ;src/main.c:776: inicializarCPC();
   7D46 CD 9B 7C      [17] 4151 	call	_inicializarCPC
                           4152 ;src/main.c:778: menuInicio();
   7D49 CD B6 50      [17] 4153 	call	_menuInicio
                           4154 ;src/main.c:780: inicializarJuego();
   7D4C CD B6 7C      [17] 4155 	call	_inicializarJuego
                           4156 ;src/main.c:784: while (1) {
   7D4F                    4157 00148$:
                           4158 ;src/main.c:785: ++timer;
   7D4F 21 7B 64      [10] 4159 	ld	hl, #_timer+0
   7D52 34            [11] 4160 	inc	(hl)
   7D53 20 04         [12] 4161 	jr	NZ,00266$
   7D55 21 7C 64      [10] 4162 	ld	hl, #_timer+1
   7D58 34            [11] 4163 	inc	(hl)
   7D59                    4164 00266$:
                           4165 ;src/main.c:786: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7D59 3A 7B 64      [13] 4166 	ld	a,(#_timer + 0)
   7D5C D6 04         [ 7] 4167 	sub	a, #0x04
   7D5E 20 30         [12] 4168 	jr	NZ,00104$
   7D60 3A 7C 64      [13] 4169 	ld	a,(#_timer + 1)
   7D63 B7            [ 4] 4170 	or	a, a
   7D64 20 2A         [12] 4171 	jr	NZ,00104$
   7D66 3A 7A 64      [13] 4172 	ld	a,(#_cambio + 0)
   7D69 B7            [ 4] 4173 	or	a, a
   7D6A 28 24         [12] 4174 	jr	Z,00104$
   7D6C 3E 0C         [ 7] 4175 	ld	a,#0x0C
   7D6E FD 21 7A 64   [14] 4176 	ld	iy,#_cambio
   7D72 FD 96 00      [19] 4177 	sub	a, 0 (iy)
   7D75 38 19         [12] 4178 	jr	C,00104$
                           4179 ;src/main.c:787: timer = 0;
   7D77 21 00 00      [10] 4180 	ld	hl,#0x0000
   7D7A 22 7B 64      [16] 4181 	ld	(_timer),hl
                           4182 ;src/main.c:788: parpadeo = !parpadeo;
   7D7D 3A 79 64      [13] 4183 	ld	a,(#_parpadeo + 0)
   7D80 D6 01         [ 7] 4184 	sub	a,#0x01
   7D82 3E 00         [ 7] 4185 	ld	a,#0x00
   7D84 17            [ 4] 4186 	rla
   7D85 4F            [ 4] 4187 	ld	c,a
   7D86 21 79 64      [10] 4188 	ld	hl,#_parpadeo + 0
   7D89 71            [ 7] 4189 	ld	(hl), c
                           4190 ;src/main.c:789: cambio ++;
   7D8A 21 7A 64      [10] 4191 	ld	hl, #_cambio+0
   7D8D 34            [11] 4192 	inc	(hl)
   7D8E 18 0C         [12] 4193 	jr	00105$
   7D90                    4194 00104$:
                           4195 ;src/main.c:790: }else if(cambio == 12){
   7D90 3A 7A 64      [13] 4196 	ld	a,(#_cambio + 0)
   7D93 D6 0C         [ 7] 4197 	sub	a, #0x0C
   7D95 20 05         [12] 4198 	jr	NZ,00105$
                           4199 ;src/main.c:791: cambio = 0;
   7D97 21 7A 64      [10] 4200 	ld	hl,#_cambio + 0
   7D9A 36 00         [10] 4201 	ld	(hl), #0x00
   7D9C                    4202 00105$:
                           4203 ;src/main.c:793: i = 2 + num_mapa;
   7D9C 21 4A 65      [10] 4204 	ld	hl,#_num_mapa + 0
   7D9F 4E            [ 7] 4205 	ld	c, (hl)
   7DA0 0C            [ 4] 4206 	inc	c
   7DA1 0C            [ 4] 4207 	inc	c
                           4208 ;src/main.c:794: actual = enemy;
                           4209 ;src/main.c:796: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7DA2 C5            [11] 4210 	push	bc
   7DA3 21 00 01      [10] 4211 	ld	hl,#_g_tablatrans
   7DA6 E5            [11] 4212 	push	hl
   7DA7 2A 48 65      [16] 4213 	ld	hl,(_mapa)
   7DAA E5            [11] 4214 	push	hl
   7DAB 21 66 64      [10] 4215 	ld	hl,#_prota
   7DAE E5            [11] 4216 	push	hl
   7DAF 21 6E 64      [10] 4217 	ld	hl,#_cu
   7DB2 E5            [11] 4218 	push	hl
   7DB3 CD 4A 66      [17] 4219 	call	_comprobarTeclado
   7DB6 21 08 00      [10] 4220 	ld	hl,#8
   7DB9 39            [11] 4221 	add	hl,sp
   7DBA F9            [ 6] 4222 	ld	sp,hl
   7DBB 2A 48 65      [16] 4223 	ld	hl,(_mapa)
   7DBE E5            [11] 4224 	push	hl
   7DBF 21 6E 64      [10] 4225 	ld	hl,#_cu
   7DC2 E5            [11] 4226 	push	hl
   7DC3 CD 15 43      [17] 4227 	call	_moverCuchillo
   7DC6 F1            [10] 4228 	pop	af
   7DC7 F1            [10] 4229 	pop	af
   7DC8 C1            [10] 4230 	pop	bc
                           4231 ;src/main.c:798: while(i){
   7DC9 DD 71 F3      [19] 4232 	ld	-13 (ix),c
   7DCC DD 36 FC DA   [19] 4233 	ld	-4 (ix),#<(_enemy)
   7DD0 DD 36 FD 60   [19] 4234 	ld	-3 (ix),#>(_enemy)
   7DD4                    4235 00115$:
   7DD4 DD 7E F3      [19] 4236 	ld	a,-13 (ix)
   7DD7 B7            [ 4] 4237 	or	a, a
   7DD8 28 6A         [12] 4238 	jr	Z,00117$
                           4239 ;src/main.c:800: --i;
   7DDA DD 35 F3      [23] 4240 	dec	-13 (ix)
                           4241 ;src/main.c:801: if(!actual->muerto){
   7DDD DD 7E FC      [19] 4242 	ld	a,-4 (ix)
   7DE0 C6 08         [ 7] 4243 	add	a, #0x08
   7DE2 DD 77 F6      [19] 4244 	ld	-10 (ix),a
   7DE5 DD 7E FD      [19] 4245 	ld	a,-3 (ix)
   7DE8 CE 00         [ 7] 4246 	adc	a, #0x00
   7DEA DD 77 F7      [19] 4247 	ld	-9 (ix),a
   7DED DD 6E F6      [19] 4248 	ld	l,-10 (ix)
   7DF0 DD 66 F7      [19] 4249 	ld	h,-9 (ix)
   7DF3 7E            [ 7] 4250 	ld	a,(hl)
   7DF4 B7            [ 4] 4251 	or	a, a
   7DF5 20 12         [12] 4252 	jr	NZ,00109$
                           4253 ;src/main.c:802: checkEnemyDead(cu.direccion, actual);
   7DF7 21 75 64      [10] 4254 	ld	hl, #_cu + 7
   7DFA 46            [ 7] 4255 	ld	b,(hl)
   7DFB DD 6E FC      [19] 4256 	ld	l,-4 (ix)
   7DFE DD 66 FD      [19] 4257 	ld	h,-3 (ix)
   7E01 E5            [11] 4258 	push	hl
   7E02 C5            [11] 4259 	push	bc
   7E03 33            [ 6] 4260 	inc	sp
   7E04 CD A4 69      [17] 4261 	call	_checkEnemyDead
   7E07 F1            [10] 4262 	pop	af
   7E08 33            [ 6] 4263 	inc	sp
   7E09                    4264 00109$:
                           4265 ;src/main.c:804: if(!actual->muerto){
   7E09 DD 6E F6      [19] 4266 	ld	l,-10 (ix)
   7E0C DD 66 F7      [19] 4267 	ld	h,-9 (ix)
   7E0F 7E            [ 7] 4268 	ld	a,(hl)
   7E10 B7            [ 4] 4269 	or	a, a
   7E11 20 1F         [12] 4270 	jr	NZ,00114$
                           4271 ;src/main.c:805: if (!actual->didDamage)
   7E13 DD 7E FC      [19] 4272 	ld	a,-4 (ix)
   7E16 C6 16         [ 7] 4273 	add	a, #0x16
   7E18 4F            [ 4] 4274 	ld	c,a
   7E19 DD 7E FD      [19] 4275 	ld	a,-3 (ix)
   7E1C CE 00         [ 7] 4276 	adc	a, #0x00
   7E1E 47            [ 4] 4277 	ld	b,a
   7E1F 0A            [ 7] 4278 	ld	a,(bc)
   7E20 B7            [ 4] 4279 	or	a, a
   7E21 20 0D         [12] 4280 	jr	NZ,00111$
                           4281 ;src/main.c:806: updateEnemy(actual);
   7E23 DD 6E FC      [19] 4282 	ld	l,-4 (ix)
   7E26 DD 66 FD      [19] 4283 	ld	h,-3 (ix)
   7E29 E5            [11] 4284 	push	hl
   7E2A CD 0E 79      [17] 4285 	call	_updateEnemy
   7E2D F1            [10] 4286 	pop	af
   7E2E 18 02         [12] 4287 	jr	00114$
   7E30                    4288 00111$:
                           4289 ;src/main.c:808: actual->didDamage = 0;
   7E30 AF            [ 4] 4290 	xor	a, a
   7E31 02            [ 7] 4291 	ld	(bc),a
   7E32                    4292 00114$:
                           4293 ;src/main.c:810: ++actual;
   7E32 DD 7E FC      [19] 4294 	ld	a,-4 (ix)
   7E35 C6 E3         [ 7] 4295 	add	a, #0xE3
   7E37 DD 77 FC      [19] 4296 	ld	-4 (ix),a
   7E3A DD 7E FD      [19] 4297 	ld	a,-3 (ix)
   7E3D CE 00         [ 7] 4298 	adc	a, #0x00
   7E3F DD 77 FD      [19] 4299 	ld	-3 (ix),a
   7E42 18 90         [12] 4300 	jr	00115$
   7E44                    4301 00117$:
                           4302 ;src/main.c:813: cpct_waitVSYNC();
   7E44 CD 38 57      [17] 4303 	call	_cpct_waitVSYNC
                           4304 ;src/main.c:816: if (prota.mover) {
   7E47 01 6C 64      [10] 4305 	ld	bc,#_prota + 6
   7E4A 0A            [ 7] 4306 	ld	a,(bc)
   7E4B B7            [ 4] 4307 	or	a, a
   7E4C 28 07         [12] 4308 	jr	Z,00119$
                           4309 ;src/main.c:817: redibujarProta();
   7E4E C5            [11] 4310 	push	bc
   7E4F CD 36 66      [17] 4311 	call	_redibujarProta
   7E52 C1            [10] 4312 	pop	bc
                           4313 ;src/main.c:818: prota.mover = NO;
   7E53 AF            [ 4] 4314 	xor	a, a
   7E54 02            [ 7] 4315 	ld	(bc),a
   7E55                    4316 00119$:
                           4317 ;src/main.c:820: if(cu.lanzado && cu.mover){
   7E55 21 74 64      [10] 4318 	ld	hl, #(_cu + 0x0006) + 0
   7E58 4E            [ 7] 4319 	ld	c,(hl)
                           4320 ;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4321 ;src/main.c:820: if(cu.lanzado && cu.mover){
   7E59 79            [ 4] 4322 	ld	a,c
   7E5A B7            [ 4] 4323 	or	a, a
   7E5B 28 30         [12] 4324 	jr	Z,00124$
   7E5D 3A 77 64      [13] 4325 	ld	a, (#(_cu + 0x0009) + 0)
   7E60 B7            [ 4] 4326 	or	a, a
   7E61 28 2A         [12] 4327 	jr	Z,00124$
                           4328 ;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E63 21 6F 64      [10] 4329 	ld	hl, #(_cu + 0x0001) + 0
   7E66 4E            [ 7] 4330 	ld	c,(hl)
   7E67 21 6E 64      [10] 4331 	ld	hl, #_cu + 0
   7E6A 46            [ 7] 4332 	ld	b,(hl)
   7E6B 21 76 64      [10] 4333 	ld	hl, #(_cu + 0x0008) + 0
   7E6E 5E            [ 7] 4334 	ld	e,(hl)
   7E6F 2A 48 65      [16] 4335 	ld	hl,(_mapa)
   7E72 E5            [11] 4336 	push	hl
   7E73 21 00 01      [10] 4337 	ld	hl,#_g_tablatrans
   7E76 E5            [11] 4338 	push	hl
   7E77 21 6E 64      [10] 4339 	ld	hl,#_cu
   7E7A E5            [11] 4340 	push	hl
   7E7B 79            [ 4] 4341 	ld	a,c
   7E7C F5            [11] 4342 	push	af
   7E7D 33            [ 6] 4343 	inc	sp
   7E7E C5            [11] 4344 	push	bc
   7E7F 33            [ 6] 4345 	inc	sp
   7E80 7B            [ 4] 4346 	ld	a,e
   7E81 F5            [11] 4347 	push	af
   7E82 33            [ 6] 4348 	inc	sp
   7E83 CD 25 40      [17] 4349 	call	_redibujarCuchillo
   7E86 21 09 00      [10] 4350 	ld	hl,#9
   7E89 39            [11] 4351 	add	hl,sp
   7E8A F9            [ 6] 4352 	ld	sp,hl
   7E8B 18 32         [12] 4353 	jr	00125$
   7E8D                    4354 00124$:
                           4355 ;src/main.c:822: }else if (cu.lanzado && !cu.mover){
   7E8D 79            [ 4] 4356 	ld	a,c
   7E8E B7            [ 4] 4357 	or	a, a
   7E8F 28 2E         [12] 4358 	jr	Z,00125$
   7E91 3A 77 64      [13] 4359 	ld	a, (#(_cu + 0x0009) + 0)
   7E94 B7            [ 4] 4360 	or	a, a
   7E95 20 28         [12] 4361 	jr	NZ,00125$
                           4362 ;src/main.c:823: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E97 21 6F 64      [10] 4363 	ld	hl, #(_cu + 0x0001) + 0
   7E9A 46            [ 7] 4364 	ld	b,(hl)
   7E9B 21 6E 64      [10] 4365 	ld	hl, #_cu + 0
   7E9E 4E            [ 7] 4366 	ld	c,(hl)
   7E9F 21 76 64      [10] 4367 	ld	hl, #(_cu + 0x0008) + 0
   7EA2 56            [ 7] 4368 	ld	d,(hl)
   7EA3 2A 48 65      [16] 4369 	ld	hl,(_mapa)
   7EA6 E5            [11] 4370 	push	hl
   7EA7 C5            [11] 4371 	push	bc
   7EA8 D5            [11] 4372 	push	de
   7EA9 33            [ 6] 4373 	inc	sp
   7EAA CD 92 3F      [17] 4374 	call	_borrarCuchillo
   7EAD F1            [10] 4375 	pop	af
   7EAE F1            [10] 4376 	pop	af
   7EAF 33            [ 6] 4377 	inc	sp
                           4378 ;src/main.c:824: cu.lanzado = NO;
   7EB0 21 74 64      [10] 4379 	ld	hl,#(_cu + 0x0006)
   7EB3 36 00         [10] 4380 	ld	(hl),#0x00
                           4381 ;src/main.c:826: cu.x = 0;
   7EB5 21 6E 64      [10] 4382 	ld	hl,#_cu
   7EB8 36 00         [10] 4383 	ld	(hl),#0x00
                           4384 ;src/main.c:827: cu.y=0;
   7EBA 21 6F 64      [10] 4385 	ld	hl,#(_cu + 0x0001)
   7EBD 36 00         [10] 4386 	ld	(hl),#0x00
   7EBF                    4387 00125$:
                           4388 ;src/main.c:830: i = 2 + num_mapa;
   7EBF 21 4A 65      [10] 4389 	ld	hl,#_num_mapa + 0
   7EC2 4E            [ 7] 4390 	ld	c, (hl)
   7EC3 0C            [ 4] 4391 	inc	c
   7EC4 0C            [ 4] 4392 	inc	c
                           4393 ;src/main.c:831: actual = enemy;
   7EC5 11 DA 60      [10] 4394 	ld	de,#_enemy
                           4395 ;src/main.c:832: while(i){
   7EC8                    4396 00144$:
   7EC8 79            [ 4] 4397 	ld	a,c
   7EC9 B7            [ 4] 4398 	or	a, a
   7ECA CA 46 80      [10] 4399 	jp	Z,00146$
                           4400 ;src/main.c:834: --i;
   7ECD 0D            [ 4] 4401 	dec	c
                           4402 ;src/main.c:835: if(actual->mover){
   7ECE 21 06 00      [10] 4403 	ld	hl,#0x0006
   7ED1 19            [11] 4404 	add	hl,de
   7ED2 DD 75 F6      [19] 4405 	ld	-10 (ix),l
   7ED5 DD 74 F7      [19] 4406 	ld	-9 (ix),h
   7ED8 DD 6E F6      [19] 4407 	ld	l,-10 (ix)
   7EDB DD 66 F7      [19] 4408 	ld	h,-9 (ix)
   7EDE 46            [ 7] 4409 	ld	b,(hl)
                           4410 ;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7EDF 21 03 00      [10] 4411 	ld	hl,#0x0003
   7EE2 19            [11] 4412 	add	hl,de
   7EE3 DD 75 FC      [19] 4413 	ld	-4 (ix),l
   7EE6 DD 74 FD      [19] 4414 	ld	-3 (ix),h
   7EE9 21 02 00      [10] 4415 	ld	hl,#0x0002
   7EEC 19            [11] 4416 	add	hl,de
   7EED DD 75 F4      [19] 4417 	ld	-12 (ix),l
   7EF0 DD 74 F5      [19] 4418 	ld	-11 (ix),h
                           4419 ;src/main.c:835: if(actual->mover){
   7EF3 78            [ 4] 4420 	ld	a,b
   7EF4 B7            [ 4] 4421 	or	a, a
   7EF5 28 22         [12] 4422 	jr	Z,00128$
                           4423 ;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7EF7 DD 6E FC      [19] 4424 	ld	l,-4 (ix)
   7EFA DD 66 FD      [19] 4425 	ld	h,-3 (ix)
   7EFD 7E            [ 7] 4426 	ld	a,(hl)
   7EFE DD 77 F3      [19] 4427 	ld	-13 (ix),a
   7F01 DD 6E F4      [19] 4428 	ld	l,-12 (ix)
   7F04 DD 66 F5      [19] 4429 	ld	h,-11 (ix)
   7F07 46            [ 7] 4430 	ld	b,(hl)
   7F08 C5            [11] 4431 	push	bc
   7F09 D5            [11] 4432 	push	de
   7F0A D5            [11] 4433 	push	de
   7F0B DD 7E F3      [19] 4434 	ld	a,-13 (ix)
   7F0E F5            [11] 4435 	push	af
   7F0F 33            [ 6] 4436 	inc	sp
   7F10 C5            [11] 4437 	push	bc
   7F11 33            [ 6] 4438 	inc	sp
   7F12 CD 73 69      [17] 4439 	call	_redibujarEnemigo
   7F15 F1            [10] 4440 	pop	af
   7F16 F1            [10] 4441 	pop	af
   7F17 D1            [10] 4442 	pop	de
   7F18 C1            [10] 4443 	pop	bc
   7F19                    4444 00128$:
                           4445 ;src/main.c:839: if (actual->muerto && actual->muertes == 0){
   7F19 21 08 00      [10] 4446 	ld	hl,#0x0008
   7F1C 19            [11] 4447 	add	hl,de
   7F1D DD 75 F8      [19] 4448 	ld	-8 (ix),l
   7F20 DD 74 F9      [19] 4449 	ld	-7 (ix),h
   7F23 DD 6E F8      [19] 4450 	ld	l,-8 (ix)
   7F26 DD 66 F9      [19] 4451 	ld	h,-7 (ix)
   7F29 7E            [ 7] 4452 	ld	a,(hl)
   7F2A B7            [ 4] 4453 	or	a, a
   7F2B CA C1 7F      [10] 4454 	jp	Z,00130$
   7F2E 21 09 00      [10] 4455 	ld	hl,#0x0009
   7F31 19            [11] 4456 	add	hl,de
   7F32 DD 75 FA      [19] 4457 	ld	-6 (ix),l
   7F35 DD 74 FB      [19] 4458 	ld	-5 (ix),h
   7F38 DD 6E FA      [19] 4459 	ld	l,-6 (ix)
   7F3B DD 66 FB      [19] 4460 	ld	h,-5 (ix)
   7F3E 7E            [ 7] 4461 	ld	a,(hl)
   7F3F B7            [ 4] 4462 	or	a, a
   7F40 C2 C1 7F      [10] 4463 	jp	NZ,00130$
                           4464 ;src/main.c:840: timer = 3;
   7F43 21 03 00      [10] 4465 	ld	hl,#0x0003
   7F46 22 7B 64      [16] 4466 	ld	(_timer),hl
                           4467 ;src/main.c:841: cambio++;
   7F49 FD 21 7A 64   [14] 4468 	ld	iy,#_cambio
   7F4D FD 34 00      [23] 4469 	inc	0 (iy)
                           4470 ;src/main.c:842: parpadeo = 1;
   7F50 FD 21 79 64   [14] 4471 	ld	iy,#_parpadeo
   7F54 FD 36 00 01   [19] 4472 	ld	0 (iy),#0x01
                           4473 ;src/main.c:843: borrarEnemigo((*actual).x, (*actual).y);
   7F58 2E 01         [ 7] 4474 	ld	l, #0x01
   7F5A 19            [11] 4475 	add	hl,de
   7F5B DD 75 FE      [19] 4476 	ld	-2 (ix),l
   7F5E DD 74 FF      [19] 4477 	ld	-1 (ix),h
   7F61 DD 6E FE      [19] 4478 	ld	l,-2 (ix)
   7F64 DD 66 FF      [19] 4479 	ld	h,-1 (ix)
   7F67 46            [ 7] 4480 	ld	b,(hl)
   7F68 1A            [ 7] 4481 	ld	a,(de)
   7F69 C5            [11] 4482 	push	bc
   7F6A D5            [11] 4483 	push	de
   7F6B C5            [11] 4484 	push	bc
   7F6C 33            [ 6] 4485 	inc	sp
   7F6D F5            [11] 4486 	push	af
   7F6E 33            [ 6] 4487 	inc	sp
   7F6F CD 03 69      [17] 4488 	call	_borrarEnemigo
   7F72 F1            [10] 4489 	pop	af
   7F73 D1            [10] 4490 	pop	de
   7F74 C1            [10] 4491 	pop	bc
                           4492 ;src/main.c:844: puntuacion_aux = puntuacion;
   7F75 FD 21 4B 65   [14] 4493 	ld	iy,#_puntuacion
   7F79 FD 6E 00      [19] 4494 	ld	l,0 (iy)
   7F7C 26 00         [ 7] 4495 	ld	h,#0x00
                           4496 ;src/main.c:845: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7F7E C5            [11] 4497 	push	bc
   7F7F D5            [11] 4498 	push	de
   7F80 E5            [11] 4499 	push	hl
   7F81 CD 9B 53      [17] 4500 	call	_aumentarPuntuacion
   7F84 F1            [10] 4501 	pop	af
   7F85 D1            [10] 4502 	pop	de
   7F86 C1            [10] 4503 	pop	bc
   7F87 FD 21 4B 65   [14] 4504 	ld	iy,#_puntuacion
   7F8B FD 75 00      [19] 4505 	ld	0 (iy),l
                           4506 ;src/main.c:846: modificarPuntuacion(puntuacion);
   7F8E FD 21 4B 65   [14] 4507 	ld	iy,#_puntuacion
   7F92 FD 6E 00      [19] 4508 	ld	l,0 (iy)
   7F95 26 00         [ 7] 4509 	ld	h,#0x00
   7F97 C5            [11] 4510 	push	bc
   7F98 D5            [11] 4511 	push	de
   7F99 E5            [11] 4512 	push	hl
   7F9A CD 31 52      [17] 4513 	call	_modificarPuntuacion
   7F9D F1            [10] 4514 	pop	af
   7F9E D1            [10] 4515 	pop	de
   7F9F C1            [10] 4516 	pop	bc
                           4517 ;src/main.c:847: actual->mover = NO;
   7FA0 DD 6E F6      [19] 4518 	ld	l,-10 (ix)
   7FA3 DD 66 F7      [19] 4519 	ld	h,-9 (ix)
   7FA6 36 00         [10] 4520 	ld	(hl),#0x00
                           4521 ;src/main.c:848: actual->muertes++;
   7FA8 DD 6E FA      [19] 4522 	ld	l,-6 (ix)
   7FAB DD 66 FB      [19] 4523 	ld	h,-5 (ix)
   7FAE 46            [ 7] 4524 	ld	b,(hl)
   7FAF 04            [ 4] 4525 	inc	b
   7FB0 DD 6E FA      [19] 4526 	ld	l,-6 (ix)
   7FB3 DD 66 FB      [19] 4527 	ld	h,-5 (ix)
   7FB6 70            [ 7] 4528 	ld	(hl),b
                           4529 ;src/main.c:849: actual->x = 0;
   7FB7 AF            [ 4] 4530 	xor	a, a
   7FB8 12            [ 7] 4531 	ld	(de),a
                           4532 ;src/main.c:850: actual->y = 0;
   7FB9 DD 6E FE      [19] 4533 	ld	l,-2 (ix)
   7FBC DD 66 FF      [19] 4534 	ld	h,-1 (ix)
   7FBF 36 00         [10] 4535 	ld	(hl),#0x00
   7FC1                    4536 00130$:
                           4537 ;src/main.c:852: if(parpadeo && actual->muerto && !actual->xplot){
   7FC1 21 19 00      [10] 4538 	ld	hl,#0x0019
   7FC4 19            [11] 4539 	add	hl,de
   7FC5 DD 75 FE      [19] 4540 	ld	-2 (ix),l
   7FC8 DD 74 FF      [19] 4541 	ld	-1 (ix),h
   7FCB 3A 79 64      [13] 4542 	ld	a,(#_parpadeo + 0)
   7FCE B7            [ 4] 4543 	or	a, a
   7FCF 28 1F         [12] 4544 	jr	Z,00140$
   7FD1 DD 6E F8      [19] 4545 	ld	l,-8 (ix)
   7FD4 DD 66 F9      [19] 4546 	ld	h,-7 (ix)
   7FD7 7E            [ 7] 4547 	ld	a,(hl)
   7FD8 B7            [ 4] 4548 	or	a, a
   7FD9 28 15         [12] 4549 	jr	Z,00140$
   7FDB DD 6E FE      [19] 4550 	ld	l,-2 (ix)
   7FDE DD 66 FF      [19] 4551 	ld	h,-1 (ix)
   7FE1 7E            [ 7] 4552 	ld	a,(hl)
   7FE2 B7            [ 4] 4553 	or	a, a
   7FE3 20 0B         [12] 4554 	jr	NZ,00140$
                           4555 ;src/main.c:853: dibujarExplosion(actual);
   7FE5 C5            [11] 4556 	push	bc
   7FE6 D5            [11] 4557 	push	de
   7FE7 D5            [11] 4558 	push	de
   7FE8 CD 5A 68      [17] 4559 	call	_dibujarExplosion
   7FEB F1            [10] 4560 	pop	af
   7FEC D1            [10] 4561 	pop	de
   7FED C1            [10] 4562 	pop	bc
   7FEE 18 4E         [12] 4563 	jr	00141$
   7FF0                    4564 00140$:
                           4565 ;src/main.c:854: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   7FF0 3A 79 64      [13] 4566 	ld	a,(#_parpadeo + 0)
   7FF3 B7            [ 4] 4567 	or	a, a
   7FF4 20 48         [12] 4568 	jr	NZ,00141$
   7FF6 DD 6E F8      [19] 4569 	ld	l,-8 (ix)
   7FF9 DD 66 F9      [19] 4570 	ld	h,-7 (ix)
   7FFC 7E            [ 7] 4571 	ld	a,(hl)
   7FFD B7            [ 4] 4572 	or	a, a
   7FFE 28 3E         [12] 4573 	jr	Z,00141$
   8000 3E 0C         [ 7] 4574 	ld	a,#0x0C
   8002 FD 21 7A 64   [14] 4575 	ld	iy,#_cambio
   8006 FD 96 00      [19] 4576 	sub	a, 0 (iy)
   8009 38 33         [12] 4577 	jr	C,00141$
   800B DD 6E FE      [19] 4578 	ld	l,-2 (ix)
   800E DD 66 FF      [19] 4579 	ld	h,-1 (ix)
   8011 7E            [ 7] 4580 	ld	a,(hl)
   8012 B7            [ 4] 4581 	or	a, a
   8013 20 29         [12] 4582 	jr	NZ,00141$
                           4583 ;src/main.c:855: borrarExplosion((*actual).px, (*actual).py);
   8015 DD 6E FC      [19] 4584 	ld	l,-4 (ix)
   8018 DD 66 FD      [19] 4585 	ld	h,-3 (ix)
   801B 7E            [ 7] 4586 	ld	a,(hl)
   801C DD 6E F4      [19] 4587 	ld	l,-12 (ix)
   801F DD 66 F5      [19] 4588 	ld	h,-11 (ix)
   8022 46            [ 7] 4589 	ld	b,(hl)
   8023 C5            [11] 4590 	push	bc
   8024 D5            [11] 4591 	push	de
   8025 F5            [11] 4592 	push	af
   8026 33            [ 6] 4593 	inc	sp
   8027 C5            [11] 4594 	push	bc
   8028 33            [ 6] 4595 	inc	sp
   8029 CD 93 68      [17] 4596 	call	_borrarExplosion
   802C F1            [10] 4597 	pop	af
   802D D1            [10] 4598 	pop	de
   802E C1            [10] 4599 	pop	bc
                           4600 ;src/main.c:856: if(cambio == 12){
   802F 3A 7A 64      [13] 4601 	ld	a,(#_cambio + 0)
   8032 D6 0C         [ 7] 4602 	sub	a, #0x0C
   8034 20 08         [12] 4603 	jr	NZ,00141$
                           4604 ;src/main.c:857: actual->xplot = SI;
   8036 DD 6E FE      [19] 4605 	ld	l,-2 (ix)
   8039 DD 66 FF      [19] 4606 	ld	h,-1 (ix)
   803C 36 01         [10] 4607 	ld	(hl),#0x01
   803E                    4608 00141$:
                           4609 ;src/main.c:860: ++actual;
   803E 21 E3 00      [10] 4610 	ld	hl,#0x00E3
   8041 19            [11] 4611 	add	hl,de
   8042 EB            [ 4] 4612 	ex	de,hl
   8043 C3 C8 7E      [10] 4613 	jp	00144$
   8046                    4614 00146$:
                           4615 ;src/main.c:862: cpct_waitVSYNC();
   8046 CD 38 57      [17] 4616 	call	_cpct_waitVSYNC
   8049 C3 4F 7D      [10] 4617 	jp	00148$
                           4618 	.area _CODE
                           4619 	.area _INITIALIZER
   654C                    4620 __xinit__mapa:
   654C 00 00              4621 	.dw #0x0000
   654E                    4622 __xinit__num_mapa:
   654E 00                 4623 	.db #0x00	; 0
   654F                    4624 __xinit__puntuacion:
   654F 00                 4625 	.db #0x00	; 0
                           4626 	.area _CABS (ABS)
