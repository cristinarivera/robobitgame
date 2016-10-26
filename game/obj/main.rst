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
   60CA                      91 _enemy::
   60CA                      92 	.ds 908
   6456                      93 _prota::
   6456                      94 	.ds 8
   645E                      95 _cu::
   645E                      96 	.ds 11
   6469                      97 _parpadeo::
   6469                      98 	.ds 1
   646A                      99 _cambio::
   646A                     100 	.ds 1
   646B                     101 _timer::
   646B                     102 	.ds 2
   646D                     103 _vidas::
   646D                     104 	.ds 1
   646E                     105 _i::
   646E                     106 	.ds 1
                            107 ;--------------------------------------------------------
                            108 ; ram data
                            109 ;--------------------------------------------------------
                            110 	.area _INITIALIZED
   6538                     111 _mapa::
   6538                     112 	.ds 2
   653A                     113 _num_mapa::
   653A                     114 	.ds 1
   653B                     115 _puntuacion::
   653B                     116 	.ds 1
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
   3F0A                     141 _dummy_cpct_transparentMaskTable0M0_container::
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
   6540                     182 _dibujarMapa::
                            183 ;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6540 2A 38 65      [16]  184 	ld	hl,(_mapa)
   6543 E5            [11]  185 	push	hl
   6544 21 F0 C0      [10]  186 	ld	hl,#0xC0F0
   6547 E5            [11]  187 	push	hl
   6548 21 2C 28      [10]  188 	ld	hl,#0x282C
   654B E5            [11]  189 	push	hl
   654C 2E 00         [ 7]  190 	ld	l, #0x00
   654E E5            [11]  191 	push	hl
   654F AF            [ 4]  192 	xor	a, a
   6550 F5            [11]  193 	push	af
   6551 33            [ 6]  194 	inc	sp
   6552 CD 51 55      [17]  195 	call	_cpct_etm_drawTileBox2x4
   6555 C9            [10]  196 	ret
   6556                     197 _mapas:
   6556 C0 10               198 	.dw _g_map1
   6558 E0 09               199 	.dw _g_map2
   655A 00 03               200 	.dw _g_map3
   655C                     201 _spawnX:
   655C 24                  202 	.db #0x24	; 36
   655D 47                  203 	.db #0x47	; 71	'G'
   655E 30                  204 	.db #0x30	; 48	'0'
   655F 18                  205 	.db #0x18	; 24
   6560                     206 _spawnY:
   6560 2C                  207 	.db #0x2C	; 44
   6561 66                  208 	.db #0x66	; 102	'f'
   6562 9A                  209 	.db #0x9A	; 154
   6563 40                  210 	.db #0x40	; 64
   6564                     211 _patrolX:
   6564 00                  212 	.db #0x00	; 0
   6565 00                  213 	.db #0x00	; 0
   6566 00                  214 	.db #0x00	; 0
   6567 00                  215 	.db #0x00	; 0
   6568 00                  216 	.db #0x00	; 0
   6569 42                  217 	.db #0x42	; 66	'B'
   656A 33                  218 	.db #0x33	; 51	'3'
   656B 00                  219 	.db #0x00	; 0
   656C 00                  220 	.db #0x00	; 0
   656D 00                  221 	.db 0x00
   656E 34                  222 	.db #0x34	; 52	'4'
   656F 33                  223 	.db #0x33	; 51	'3'
   6570 14                  224 	.db #0x14	; 20
   6571 00                  225 	.db #0x00	; 0
   6572 00                  226 	.db 0x00
   6573 38                  227 	.db #0x38	; 56	'8'
   6574 3C                  228 	.db #0x3C	; 60
   6575 23                  229 	.db #0x23	; 35
   6576 18                  230 	.db #0x18	; 24
   6577 00                  231 	.db 0x00
   6578                     232 _patrolY:
   6578 00                  233 	.db #0x00	; 0
   6579 00                  234 	.db #0x00	; 0
   657A 00                  235 	.db #0x00	; 0
   657B 00                  236 	.db #0x00	; 0
   657C 00                  237 	.db 0x00
   657D 5E                  238 	.db #0x5E	; 94
   657E A6                  239 	.db #0xA6	; 166
   657F 00                  240 	.db #0x00	; 0
   6580 00                  241 	.db #0x00	; 0
   6581 00                  242 	.db 0x00
   6582 A0                  243 	.db #0xA0	; 160
   6583 66                  244 	.db #0x66	; 102	'f'
   6584 2C                  245 	.db #0x2C	; 44
   6585 00                  246 	.db #0x00	; 0
   6586 00                  247 	.db 0x00
   6587 AE                  248 	.db #0xAE	; 174
   6588 66                  249 	.db #0x66	; 102	'f'
   6589 22                  250 	.db #0x22	; 34
   658A 86                  251 	.db #0x86	; 134
   658B 00                  252 	.db 0x00
                            253 ;src/main.c:120: void dibujarProta() {
                            254 ;	---------------------------------
                            255 ; Function dibujarProta
                            256 ; ---------------------------------
   658C                     257 _dibujarProta::
                            258 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   658C 21 57 64      [10]  259 	ld	hl, #_prota + 1
   658F 56            [ 7]  260 	ld	d,(hl)
   6590 21 56 64      [10]  261 	ld	hl, #_prota + 0
   6593 46            [ 7]  262 	ld	b,(hl)
   6594 D5            [11]  263 	push	de
   6595 33            [ 6]  264 	inc	sp
   6596 C5            [11]  265 	push	bc
   6597 33            [ 6]  266 	inc	sp
   6598 21 00 C0      [10]  267 	ld	hl,#0xC000
   659B E5            [11]  268 	push	hl
   659C CD 6F 60      [17]  269 	call	_cpct_getScreenPtr
   659F EB            [ 4]  270 	ex	de,hl
                            271 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   65A0 ED 4B 5A 64   [20]  272 	ld	bc, (#_prota + 4)
   65A4 21 00 01      [10]  273 	ld	hl,#_g_tablatrans
   65A7 E5            [11]  274 	push	hl
   65A8 21 07 16      [10]  275 	ld	hl,#0x1607
   65AB E5            [11]  276 	push	hl
   65AC D5            [11]  277 	push	de
   65AD C5            [11]  278 	push	bc
   65AE CD 8F 60      [17]  279 	call	_cpct_drawSpriteMaskedAlignedTable
   65B1 C9            [10]  280 	ret
                            281 ;src/main.c:125: void borrarProta() {
                            282 ;	---------------------------------
                            283 ; Function borrarProta
                            284 ; ---------------------------------
   65B2                     285 _borrarProta::
   65B2 DD E5         [15]  286 	push	ix
   65B4 DD 21 00 00   [14]  287 	ld	ix,#0
   65B8 DD 39         [15]  288 	add	ix,sp
   65BA F5            [11]  289 	push	af
   65BB 3B            [ 6]  290 	dec	sp
                            291 ;src/main.c:129: u8 w = 4 + (prota.px & 1);
   65BC 21 58 64      [10]  292 	ld	hl, #_prota + 2
   65BF 4E            [ 7]  293 	ld	c,(hl)
   65C0 79            [ 4]  294 	ld	a,c
   65C1 E6 01         [ 7]  295 	and	a, #0x01
   65C3 47            [ 4]  296 	ld	b,a
   65C4 04            [ 4]  297 	inc	b
   65C5 04            [ 4]  298 	inc	b
   65C6 04            [ 4]  299 	inc	b
   65C7 04            [ 4]  300 	inc	b
                            301 ;src/main.c:132: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   65C8 21 59 64      [10]  302 	ld	hl, #_prota + 3
   65CB 5E            [ 7]  303 	ld	e,(hl)
   65CC CB 4B         [ 8]  304 	bit	1, e
   65CE 28 04         [12]  305 	jr	Z,00103$
   65D0 3E 01         [ 7]  306 	ld	a,#0x01
   65D2 18 02         [12]  307 	jr	00104$
   65D4                     308 00103$:
   65D4 3E 00         [ 7]  309 	ld	a,#0x00
   65D6                     310 00104$:
   65D6 C6 06         [ 7]  311 	add	a, #0x06
   65D8 DD 77 FD      [19]  312 	ld	-3 (ix),a
                            313 ;src/main.c:134: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   65DB FD 2A 38 65   [20]  314 	ld	iy,(_mapa)
   65DF 16 00         [ 7]  315 	ld	d,#0x00
   65E1 7B            [ 4]  316 	ld	a,e
   65E2 C6 E8         [ 7]  317 	add	a,#0xE8
   65E4 DD 77 FE      [19]  318 	ld	-2 (ix),a
   65E7 7A            [ 4]  319 	ld	a,d
   65E8 CE FF         [ 7]  320 	adc	a,#0xFF
   65EA DD 77 FF      [19]  321 	ld	-1 (ix),a
   65ED DD 6E FE      [19]  322 	ld	l,-2 (ix)
   65F0 DD 66 FF      [19]  323 	ld	h,-1 (ix)
   65F3 DD CB FF 7E   [20]  324 	bit	7, -1 (ix)
   65F7 28 04         [12]  325 	jr	Z,00105$
   65F9 21 EB FF      [10]  326 	ld	hl,#0xFFEB
   65FC 19            [11]  327 	add	hl,de
   65FD                     328 00105$:
   65FD CB 2C         [ 8]  329 	sra	h
   65FF CB 1D         [ 8]  330 	rr	l
   6601 CB 2C         [ 8]  331 	sra	h
   6603 CB 1D         [ 8]  332 	rr	l
   6605 55            [ 4]  333 	ld	d,l
   6606 CB 39         [ 8]  334 	srl	c
   6608 FD E5         [15]  335 	push	iy
   660A 21 F0 C0      [10]  336 	ld	hl,#0xC0F0
   660D E5            [11]  337 	push	hl
   660E 3E 28         [ 7]  338 	ld	a,#0x28
   6610 F5            [11]  339 	push	af
   6611 33            [ 6]  340 	inc	sp
   6612 DD 7E FD      [19]  341 	ld	a,-3 (ix)
   6615 F5            [11]  342 	push	af
   6616 33            [ 6]  343 	inc	sp
   6617 C5            [11]  344 	push	bc
   6618 33            [ 6]  345 	inc	sp
   6619 D5            [11]  346 	push	de
   661A 33            [ 6]  347 	inc	sp
   661B 79            [ 4]  348 	ld	a,c
   661C F5            [11]  349 	push	af
   661D 33            [ 6]  350 	inc	sp
   661E CD 51 55      [17]  351 	call	_cpct_etm_drawTileBox2x4
   6621 DD F9         [10]  352 	ld	sp, ix
   6623 DD E1         [14]  353 	pop	ix
   6625 C9            [10]  354 	ret
                            355 ;src/main.c:137: void redibujarProta() {
                            356 ;	---------------------------------
                            357 ; Function redibujarProta
                            358 ; ---------------------------------
   6626                     359 _redibujarProta::
                            360 ;src/main.c:138: borrarProta();
   6626 CD B2 65      [17]  361 	call	_borrarProta
                            362 ;src/main.c:139: prota.px = prota.x;
   6629 01 58 64      [10]  363 	ld	bc,#_prota + 2
   662C 3A 56 64      [13]  364 	ld	a, (#_prota + 0)
   662F 02            [ 7]  365 	ld	(bc),a
                            366 ;src/main.c:140: prota.py = prota.y;
   6630 01 59 64      [10]  367 	ld	bc,#_prota + 3
   6633 3A 57 64      [13]  368 	ld	a, (#_prota + 1)
   6636 02            [ 7]  369 	ld	(bc),a
                            370 ;src/main.c:141: dibujarProta();
   6637 C3 8C 65      [10]  371 	jp  _dibujarProta
                            372 ;src/main.c:144: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            373 ;	---------------------------------
                            374 ; Function comprobarTeclado
                            375 ; ---------------------------------
   663A                     376 _comprobarTeclado::
                            377 ;src/main.c:145: cpct_scanKeyboard_if();
   663A CD C0 56      [17]  378 	call	_cpct_scanKeyboard_if
                            379 ;src/main.c:147: if (cpct_isAnyKeyPressed()) {
   663D CD B3 56      [17]  380 	call	_cpct_isAnyKeyPressed
   6640 7D            [ 4]  381 	ld	a,l
   6641 B7            [ 4]  382 	or	a, a
   6642 C8            [11]  383 	ret	Z
                            384 ;src/main.c:148: if (cpct_isKeyPressed(Key_CursorLeft)){
   6643 21 01 01      [10]  385 	ld	hl,#0x0101
   6646 CD 70 54      [17]  386 	call	_cpct_isKeyPressed
   6649 7D            [ 4]  387 	ld	a,l
   664A B7            [ 4]  388 	or	a, a
                            389 ;src/main.c:149: moverIzquierda();
   664B C2 E9 7B      [10]  390 	jp	NZ,_moverIzquierda
                            391 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorRight)){
   664E 21 00 02      [10]  392 	ld	hl,#0x0200
   6651 CD 70 54      [17]  393 	call	_cpct_isKeyPressed
   6654 7D            [ 4]  394 	ld	a,l
   6655 B7            [ 4]  395 	or	a, a
                            396 ;src/main.c:151: moverDerecha();
   6656 C2 0E 7C      [10]  397 	jp	NZ,_moverDerecha
                            398 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6659 21 00 01      [10]  399 	ld	hl,#0x0100
   665C CD 70 54      [17]  400 	call	_cpct_isKeyPressed
   665F 7D            [ 4]  401 	ld	a,l
   6660 B7            [ 4]  402 	or	a, a
                            403 ;src/main.c:153: moverArriba();
   6661 C2 53 7C      [10]  404 	jp	NZ,_moverArriba
                            405 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6664 21 00 04      [10]  406 	ld	hl,#0x0400
   6667 CD 70 54      [17]  407 	call	_cpct_isKeyPressed
   666A 7D            [ 4]  408 	ld	a,l
   666B B7            [ 4]  409 	or	a, a
                            410 ;src/main.c:155: moverAbajo();
   666C C2 77 7C      [10]  411 	jp	NZ,_moverAbajo
                            412 ;src/main.c:156: }else if (cpct_isKeyPressed(Key_Space)){
   666F 21 05 80      [10]  413 	ld	hl,#0x8005
   6672 CD 70 54      [17]  414 	call	_cpct_isKeyPressed
   6675 7D            [ 4]  415 	ld	a,l
   6676 B7            [ 4]  416 	or	a, a
   6677 C8            [11]  417 	ret	Z
                            418 ;src/main.c:157: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6678 21 08 00      [10]  419 	ld	hl, #8
   667B 39            [11]  420 	add	hl, sp
   667C 4E            [ 7]  421 	ld	c, (hl)
   667D 23            [ 6]  422 	inc	hl
   667E 46            [ 7]  423 	ld	b, (hl)
   667F C5            [11]  424 	push	bc
   6680 21 08 00      [10]  425 	ld	hl, #8
   6683 39            [11]  426 	add	hl, sp
   6684 4E            [ 7]  427 	ld	c, (hl)
   6685 23            [ 6]  428 	inc	hl
   6686 46            [ 7]  429 	ld	b, (hl)
   6687 C5            [11]  430 	push	bc
   6688 21 08 00      [10]  431 	ld	hl, #8
   668B 39            [11]  432 	add	hl, sp
   668C 4E            [ 7]  433 	ld	c, (hl)
   668D 23            [ 6]  434 	inc	hl
   668E 46            [ 7]  435 	ld	b, (hl)
   668F C5            [11]  436 	push	bc
   6690 21 08 00      [10]  437 	ld	hl, #8
   6693 39            [11]  438 	add	hl, sp
   6694 4E            [ 7]  439 	ld	c, (hl)
   6695 23            [ 6]  440 	inc	hl
   6696 46            [ 7]  441 	ld	b, (hl)
   6697 C5            [11]  442 	push	bc
   6698 CD 91 47      [17]  443 	call	_lanzarCuchillo
   669B 21 08 00      [10]  444 	ld	hl,#8
   669E 39            [11]  445 	add	hl,sp
   669F F9            [ 6]  446 	ld	sp,hl
   66A0 C9            [10]  447 	ret
                            448 ;src/main.c:162: u8 checkCollision(u8 direction) { // check optimization
                            449 ;	---------------------------------
                            450 ; Function checkCollision
                            451 ; ---------------------------------
   66A1                     452 _checkCollision::
   66A1 DD E5         [15]  453 	push	ix
   66A3 DD 21 00 00   [14]  454 	ld	ix,#0
   66A7 DD 39         [15]  455 	add	ix,sp
   66A9 F5            [11]  456 	push	af
                            457 ;src/main.c:163: u8 *headTile=0, *feetTile=0, *waistTile=0;
   66AA 21 00 00      [10]  458 	ld	hl,#0x0000
   66AD E3            [19]  459 	ex	(sp), hl
   66AE 11 00 00      [10]  460 	ld	de,#0x0000
   66B1 01 00 00      [10]  461 	ld	bc,#0x0000
                            462 ;src/main.c:165: switch (direction) {
   66B4 3E 03         [ 7]  463 	ld	a,#0x03
   66B6 DD 96 04      [19]  464 	sub	a, 4 (ix)
   66B9 DA F1 67      [10]  465 	jp	C,00105$
   66BC DD 5E 04      [19]  466 	ld	e,4 (ix)
   66BF 16 00         [ 7]  467 	ld	d,#0x00
   66C1 21 C8 66      [10]  468 	ld	hl,#00124$
   66C4 19            [11]  469 	add	hl,de
   66C5 19            [11]  470 	add	hl,de
   66C6 19            [11]  471 	add	hl,de
   66C7 E9            [ 4]  472 	jp	(hl)
   66C8                     473 00124$:
   66C8 C3 D4 66      [10]  474 	jp	00101$
   66CB C3 29 67      [10]  475 	jp	00102$
   66CE C3 79 67      [10]  476 	jp	00103$
   66D1 C3 B6 67      [10]  477 	jp	00104$
                            478 ;src/main.c:166: case 0:
   66D4                     479 00101$:
                            480 ;src/main.c:167: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   66D4 21 57 64      [10]  481 	ld	hl, #(_prota + 0x0001) + 0
   66D7 4E            [ 7]  482 	ld	c,(hl)
   66D8 3A 56 64      [13]  483 	ld	a, (#_prota + 0)
   66DB C6 07         [ 7]  484 	add	a, #0x07
   66DD 47            [ 4]  485 	ld	b,a
   66DE 79            [ 4]  486 	ld	a,c
   66DF F5            [11]  487 	push	af
   66E0 33            [ 6]  488 	inc	sp
   66E1 C5            [11]  489 	push	bc
   66E2 33            [ 6]  490 	inc	sp
   66E3 2A 38 65      [16]  491 	ld	hl,(_mapa)
   66E6 E5            [11]  492 	push	hl
   66E7 CD 61 4B      [17]  493 	call	_getTilePtr
   66EA F1            [10]  494 	pop	af
   66EB F1            [10]  495 	pop	af
   66EC 33            [ 6]  496 	inc	sp
   66ED 33            [ 6]  497 	inc	sp
   66EE E5            [11]  498 	push	hl
                            499 ;src/main.c:168: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   66EF 3A 57 64      [13]  500 	ld	a, (#(_prota + 0x0001) + 0)
   66F2 C6 14         [ 7]  501 	add	a, #0x14
   66F4 4F            [ 4]  502 	ld	c,a
   66F5 3A 56 64      [13]  503 	ld	a, (#_prota + 0)
   66F8 C6 07         [ 7]  504 	add	a, #0x07
   66FA 47            [ 4]  505 	ld	b,a
   66FB 79            [ 4]  506 	ld	a,c
   66FC F5            [11]  507 	push	af
   66FD 33            [ 6]  508 	inc	sp
   66FE C5            [11]  509 	push	bc
   66FF 33            [ 6]  510 	inc	sp
   6700 2A 38 65      [16]  511 	ld	hl,(_mapa)
   6703 E5            [11]  512 	push	hl
   6704 CD 61 4B      [17]  513 	call	_getTilePtr
   6707 F1            [10]  514 	pop	af
   6708 F1            [10]  515 	pop	af
   6709 EB            [ 4]  516 	ex	de,hl
                            517 ;src/main.c:169: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   670A 3A 57 64      [13]  518 	ld	a, (#(_prota + 0x0001) + 0)
   670D C6 0B         [ 7]  519 	add	a, #0x0B
   670F 47            [ 4]  520 	ld	b,a
   6710 3A 56 64      [13]  521 	ld	a, (#_prota + 0)
   6713 C6 07         [ 7]  522 	add	a, #0x07
   6715 D5            [11]  523 	push	de
   6716 C5            [11]  524 	push	bc
   6717 33            [ 6]  525 	inc	sp
   6718 F5            [11]  526 	push	af
   6719 33            [ 6]  527 	inc	sp
   671A 2A 38 65      [16]  528 	ld	hl,(_mapa)
   671D E5            [11]  529 	push	hl
   671E CD 61 4B      [17]  530 	call	_getTilePtr
   6721 F1            [10]  531 	pop	af
   6722 F1            [10]  532 	pop	af
   6723 4D            [ 4]  533 	ld	c,l
   6724 44            [ 4]  534 	ld	b,h
   6725 D1            [10]  535 	pop	de
                            536 ;src/main.c:170: break;
   6726 C3 F1 67      [10]  537 	jp	00105$
                            538 ;src/main.c:171: case 1:
   6729                     539 00102$:
                            540 ;src/main.c:172: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6729 21 57 64      [10]  541 	ld	hl, #(_prota + 0x0001) + 0
   672C 56            [ 7]  542 	ld	d,(hl)
   672D 21 56 64      [10]  543 	ld	hl, #_prota + 0
   6730 46            [ 7]  544 	ld	b,(hl)
   6731 05            [ 4]  545 	dec	b
   6732 D5            [11]  546 	push	de
   6733 33            [ 6]  547 	inc	sp
   6734 C5            [11]  548 	push	bc
   6735 33            [ 6]  549 	inc	sp
   6736 2A 38 65      [16]  550 	ld	hl,(_mapa)
   6739 E5            [11]  551 	push	hl
   673A CD 61 4B      [17]  552 	call	_getTilePtr
   673D F1            [10]  553 	pop	af
   673E F1            [10]  554 	pop	af
   673F 33            [ 6]  555 	inc	sp
   6740 33            [ 6]  556 	inc	sp
   6741 E5            [11]  557 	push	hl
                            558 ;src/main.c:173: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6742 3A 57 64      [13]  559 	ld	a, (#(_prota + 0x0001) + 0)
   6745 C6 14         [ 7]  560 	add	a, #0x14
   6747 57            [ 4]  561 	ld	d,a
   6748 21 56 64      [10]  562 	ld	hl, #_prota + 0
   674B 46            [ 7]  563 	ld	b,(hl)
   674C 05            [ 4]  564 	dec	b
   674D D5            [11]  565 	push	de
   674E 33            [ 6]  566 	inc	sp
   674F C5            [11]  567 	push	bc
   6750 33            [ 6]  568 	inc	sp
   6751 2A 38 65      [16]  569 	ld	hl,(_mapa)
   6754 E5            [11]  570 	push	hl
   6755 CD 61 4B      [17]  571 	call	_getTilePtr
   6758 F1            [10]  572 	pop	af
   6759 F1            [10]  573 	pop	af
   675A EB            [ 4]  574 	ex	de,hl
                            575 ;src/main.c:174: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   675B 3A 57 64      [13]  576 	ld	a, (#(_prota + 0x0001) + 0)
   675E C6 0B         [ 7]  577 	add	a, #0x0B
   6760 47            [ 4]  578 	ld	b,a
   6761 3A 56 64      [13]  579 	ld	a, (#_prota + 0)
   6764 C6 FF         [ 7]  580 	add	a,#0xFF
   6766 D5            [11]  581 	push	de
   6767 C5            [11]  582 	push	bc
   6768 33            [ 6]  583 	inc	sp
   6769 F5            [11]  584 	push	af
   676A 33            [ 6]  585 	inc	sp
   676B 2A 38 65      [16]  586 	ld	hl,(_mapa)
   676E E5            [11]  587 	push	hl
   676F CD 61 4B      [17]  588 	call	_getTilePtr
   6772 F1            [10]  589 	pop	af
   6773 F1            [10]  590 	pop	af
   6774 4D            [ 4]  591 	ld	c,l
   6775 44            [ 4]  592 	ld	b,h
   6776 D1            [10]  593 	pop	de
                            594 ;src/main.c:175: break;
   6777 18 78         [12]  595 	jr	00105$
                            596 ;src/main.c:176: case 2:
   6779                     597 00103$:
                            598 ;src/main.c:177: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6779 3A 57 64      [13]  599 	ld	a, (#(_prota + 0x0001) + 0)
   677C C6 FE         [ 7]  600 	add	a,#0xFE
   677E 21 56 64      [10]  601 	ld	hl, #_prota + 0
   6781 56            [ 7]  602 	ld	d,(hl)
   6782 C5            [11]  603 	push	bc
   6783 F5            [11]  604 	push	af
   6784 33            [ 6]  605 	inc	sp
   6785 D5            [11]  606 	push	de
   6786 33            [ 6]  607 	inc	sp
   6787 2A 38 65      [16]  608 	ld	hl,(_mapa)
   678A E5            [11]  609 	push	hl
   678B CD 61 4B      [17]  610 	call	_getTilePtr
   678E F1            [10]  611 	pop	af
   678F F1            [10]  612 	pop	af
   6790 C1            [10]  613 	pop	bc
   6791 33            [ 6]  614 	inc	sp
   6792 33            [ 6]  615 	inc	sp
   6793 E5            [11]  616 	push	hl
                            617 ;src/main.c:178: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6794 21 57 64      [10]  618 	ld	hl, #(_prota + 0x0001) + 0
   6797 56            [ 7]  619 	ld	d,(hl)
   6798 15            [ 4]  620 	dec	d
   6799 15            [ 4]  621 	dec	d
   679A 3A 56 64      [13]  622 	ld	a, (#_prota + 0)
   679D C6 03         [ 7]  623 	add	a, #0x03
   679F C5            [11]  624 	push	bc
   67A0 D5            [11]  625 	push	de
   67A1 33            [ 6]  626 	inc	sp
   67A2 F5            [11]  627 	push	af
   67A3 33            [ 6]  628 	inc	sp
   67A4 2A 38 65      [16]  629 	ld	hl,(_mapa)
   67A7 E5            [11]  630 	push	hl
   67A8 CD 61 4B      [17]  631 	call	_getTilePtr
   67AB F1            [10]  632 	pop	af
   67AC F1            [10]  633 	pop	af
   67AD EB            [ 4]  634 	ex	de,hl
   67AE C1            [10]  635 	pop	bc
                            636 ;src/main.c:179: *waistTile = 0;
   67AF 21 00 00      [10]  637 	ld	hl,#0x0000
   67B2 36 00         [10]  638 	ld	(hl),#0x00
                            639 ;src/main.c:180: break;
   67B4 18 3B         [12]  640 	jr	00105$
                            641 ;src/main.c:181: case 3:
   67B6                     642 00104$:
                            643 ;src/main.c:182: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   67B6 3A 57 64      [13]  644 	ld	a, (#(_prota + 0x0001) + 0)
   67B9 C6 16         [ 7]  645 	add	a, #0x16
   67BB 21 56 64      [10]  646 	ld	hl, #_prota + 0
   67BE 56            [ 7]  647 	ld	d,(hl)
   67BF C5            [11]  648 	push	bc
   67C0 F5            [11]  649 	push	af
   67C1 33            [ 6]  650 	inc	sp
   67C2 D5            [11]  651 	push	de
   67C3 33            [ 6]  652 	inc	sp
   67C4 2A 38 65      [16]  653 	ld	hl,(_mapa)
   67C7 E5            [11]  654 	push	hl
   67C8 CD 61 4B      [17]  655 	call	_getTilePtr
   67CB F1            [10]  656 	pop	af
   67CC F1            [10]  657 	pop	af
   67CD C1            [10]  658 	pop	bc
   67CE 33            [ 6]  659 	inc	sp
   67CF 33            [ 6]  660 	inc	sp
   67D0 E5            [11]  661 	push	hl
                            662 ;src/main.c:183: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   67D1 3A 57 64      [13]  663 	ld	a, (#(_prota + 0x0001) + 0)
   67D4 C6 16         [ 7]  664 	add	a, #0x16
   67D6 57            [ 4]  665 	ld	d,a
   67D7 3A 56 64      [13]  666 	ld	a, (#_prota + 0)
   67DA C6 03         [ 7]  667 	add	a, #0x03
   67DC C5            [11]  668 	push	bc
   67DD D5            [11]  669 	push	de
   67DE 33            [ 6]  670 	inc	sp
   67DF F5            [11]  671 	push	af
   67E0 33            [ 6]  672 	inc	sp
   67E1 2A 38 65      [16]  673 	ld	hl,(_mapa)
   67E4 E5            [11]  674 	push	hl
   67E5 CD 61 4B      [17]  675 	call	_getTilePtr
   67E8 F1            [10]  676 	pop	af
   67E9 F1            [10]  677 	pop	af
   67EA EB            [ 4]  678 	ex	de,hl
   67EB C1            [10]  679 	pop	bc
                            680 ;src/main.c:184: *waistTile = 0;
   67EC 21 00 00      [10]  681 	ld	hl,#0x0000
   67EF 36 00         [10]  682 	ld	(hl),#0x00
                            683 ;src/main.c:186: }
   67F1                     684 00105$:
                            685 ;src/main.c:188: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   67F1 E1            [10]  686 	pop	hl
   67F2 E5            [11]  687 	push	hl
   67F3 6E            [ 7]  688 	ld	l,(hl)
   67F4 3E 02         [ 7]  689 	ld	a,#0x02
   67F6 95            [ 4]  690 	sub	a, l
   67F7 38 0E         [12]  691 	jr	C,00106$
   67F9 1A            [ 7]  692 	ld	a,(de)
   67FA 5F            [ 4]  693 	ld	e,a
   67FB 3E 02         [ 7]  694 	ld	a,#0x02
   67FD 93            [ 4]  695 	sub	a, e
   67FE 38 07         [12]  696 	jr	C,00106$
   6800 0A            [ 7]  697 	ld	a,(bc)
   6801 4F            [ 4]  698 	ld	c,a
   6802 3E 02         [ 7]  699 	ld	a,#0x02
   6804 91            [ 4]  700 	sub	a, c
   6805 30 04         [12]  701 	jr	NC,00107$
   6807                     702 00106$:
                            703 ;src/main.c:189: return 1;
   6807 2E 01         [ 7]  704 	ld	l,#0x01
   6809 18 02         [12]  705 	jr	00110$
   680B                     706 00107$:
                            707 ;src/main.c:191: return 0;
   680B 2E 00         [ 7]  708 	ld	l,#0x00
   680D                     709 00110$:
   680D DD F9         [10]  710 	ld	sp, ix
   680F DD E1         [14]  711 	pop	ix
   6811 C9            [10]  712 	ret
                            713 ;src/main.c:194: void dibujarEnemigo(TEnemy *enemy) {
                            714 ;	---------------------------------
                            715 ; Function dibujarEnemigo
                            716 ; ---------------------------------
   6812                     717 _dibujarEnemigo::
   6812 DD E5         [15]  718 	push	ix
   6814 DD 21 00 00   [14]  719 	ld	ix,#0
   6818 DD 39         [15]  720 	add	ix,sp
                            721 ;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   681A DD 4E 04      [19]  722 	ld	c,4 (ix)
   681D DD 46 05      [19]  723 	ld	b,5 (ix)
   6820 69            [ 4]  724 	ld	l, c
   6821 60            [ 4]  725 	ld	h, b
   6822 23            [ 6]  726 	inc	hl
   6823 56            [ 7]  727 	ld	d,(hl)
   6824 0A            [ 7]  728 	ld	a,(bc)
   6825 C5            [11]  729 	push	bc
   6826 D5            [11]  730 	push	de
   6827 33            [ 6]  731 	inc	sp
   6828 F5            [11]  732 	push	af
   6829 33            [ 6]  733 	inc	sp
   682A 21 00 C0      [10]  734 	ld	hl,#0xC000
   682D E5            [11]  735 	push	hl
   682E CD 6F 60      [17]  736 	call	_cpct_getScreenPtr
   6831 EB            [ 4]  737 	ex	de,hl
                            738 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6832 E1            [10]  739 	pop	hl
   6833 01 04 00      [10]  740 	ld	bc, #0x0004
   6836 09            [11]  741 	add	hl, bc
   6837 4E            [ 7]  742 	ld	c,(hl)
   6838 23            [ 6]  743 	inc	hl
   6839 46            [ 7]  744 	ld	b,(hl)
   683A 21 00 01      [10]  745 	ld	hl,#_g_tablatrans
   683D E5            [11]  746 	push	hl
   683E 21 04 16      [10]  747 	ld	hl,#0x1604
   6841 E5            [11]  748 	push	hl
   6842 D5            [11]  749 	push	de
   6843 C5            [11]  750 	push	bc
   6844 CD 8F 60      [17]  751 	call	_cpct_drawSpriteMaskedAlignedTable
   6847 DD E1         [14]  752 	pop	ix
   6849 C9            [10]  753 	ret
                            754 ;src/main.c:199: void dibujarExplosion(TEnemy *enemy) {
                            755 ;	---------------------------------
                            756 ; Function dibujarExplosion
                            757 ; ---------------------------------
   684A                     758 _dibujarExplosion::
   684A DD E5         [15]  759 	push	ix
   684C DD 21 00 00   [14]  760 	ld	ix,#0
   6850 DD 39         [15]  761 	add	ix,sp
                            762 ;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   6852 DD 4E 04      [19]  763 	ld	c,4 (ix)
   6855 DD 46 05      [19]  764 	ld	b,5 (ix)
   6858 69            [ 4]  765 	ld	l, c
   6859 60            [ 4]  766 	ld	h, b
   685A 23            [ 6]  767 	inc	hl
   685B 23            [ 6]  768 	inc	hl
   685C 23            [ 6]  769 	inc	hl
   685D 56            [ 7]  770 	ld	d,(hl)
   685E 69            [ 4]  771 	ld	l, c
   685F 60            [ 4]  772 	ld	h, b
   6860 23            [ 6]  773 	inc	hl
   6861 23            [ 6]  774 	inc	hl
   6862 46            [ 7]  775 	ld	b,(hl)
   6863 D5            [11]  776 	push	de
   6864 33            [ 6]  777 	inc	sp
   6865 C5            [11]  778 	push	bc
   6866 33            [ 6]  779 	inc	sp
   6867 21 00 C0      [10]  780 	ld	hl,#0xC000
   686A E5            [11]  781 	push	hl
   686B CD 6F 60      [17]  782 	call	_cpct_getScreenPtr
   686E 4D            [ 4]  783 	ld	c,l
   686F 44            [ 4]  784 	ld	b,h
                            785 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6870 11 00 01      [10]  786 	ld	de,#_g_tablatrans+0
   6873 D5            [11]  787 	push	de
   6874 21 04 16      [10]  788 	ld	hl,#0x1604
   6877 E5            [11]  789 	push	hl
   6878 C5            [11]  790 	push	bc
   6879 21 70 19      [10]  791 	ld	hl,#_g_explosion
   687C E5            [11]  792 	push	hl
   687D CD 8F 60      [17]  793 	call	_cpct_drawSpriteMaskedAlignedTable
   6880 DD E1         [14]  794 	pop	ix
   6882 C9            [10]  795 	ret
                            796 ;src/main.c:204: void borrarExplosion(u8 x, u8 y) {
                            797 ;	---------------------------------
                            798 ; Function borrarExplosion
                            799 ; ---------------------------------
   6883                     800 _borrarExplosion::
   6883 DD E5         [15]  801 	push	ix
   6885 DD 21 00 00   [14]  802 	ld	ix,#0
   6889 DD 39         [15]  803 	add	ix,sp
   688B F5            [11]  804 	push	af
   688C F5            [11]  805 	push	af
                            806 ;src/main.c:207: u8 w = 4 + (x & 1);
   688D DD 7E 04      [19]  807 	ld	a,4 (ix)
   6890 E6 01         [ 7]  808 	and	a, #0x01
   6892 4F            [ 4]  809 	ld	c,a
   6893 0C            [ 4]  810 	inc	c
   6894 0C            [ 4]  811 	inc	c
   6895 0C            [ 4]  812 	inc	c
   6896 0C            [ 4]  813 	inc	c
                            814 ;src/main.c:208: u8 h = 6 + (y & 3 ? 1 : 0);
   6897 DD 7E 05      [19]  815 	ld	a,5 (ix)
   689A E6 03         [ 7]  816 	and	a, #0x03
   689C 28 04         [12]  817 	jr	Z,00103$
   689E 3E 01         [ 7]  818 	ld	a,#0x01
   68A0 18 02         [12]  819 	jr	00104$
   68A2                     820 00103$:
   68A2 3E 00         [ 7]  821 	ld	a,#0x00
   68A4                     822 00104$:
   68A4 C6 06         [ 7]  823 	add	a, #0x06
   68A6 47            [ 4]  824 	ld	b,a
                            825 ;src/main.c:210: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68A7 2A 38 65      [16]  826 	ld	hl,(_mapa)
   68AA DD 75 FE      [19]  827 	ld	-2 (ix),l
   68AD DD 74 FF      [19]  828 	ld	-1 (ix),h
   68B0 DD 5E 05      [19]  829 	ld	e,5 (ix)
   68B3 16 00         [ 7]  830 	ld	d,#0x00
   68B5 7B            [ 4]  831 	ld	a,e
   68B6 C6 E8         [ 7]  832 	add	a,#0xE8
   68B8 DD 77 FC      [19]  833 	ld	-4 (ix),a
   68BB 7A            [ 4]  834 	ld	a,d
   68BC CE FF         [ 7]  835 	adc	a,#0xFF
   68BE DD 77 FD      [19]  836 	ld	-3 (ix),a
   68C1 E1            [10]  837 	pop	hl
   68C2 E5            [11]  838 	push	hl
   68C3 DD CB FD 7E   [20]  839 	bit	7, -3 (ix)
   68C7 28 04         [12]  840 	jr	Z,00105$
   68C9 21 EB FF      [10]  841 	ld	hl,#0xFFEB
   68CC 19            [11]  842 	add	hl,de
   68CD                     843 00105$:
   68CD CB 2C         [ 8]  844 	sra	h
   68CF CB 1D         [ 8]  845 	rr	l
   68D1 CB 2C         [ 8]  846 	sra	h
   68D3 CB 1D         [ 8]  847 	rr	l
   68D5 5D            [ 4]  848 	ld	e,l
   68D6 DD 56 04      [19]  849 	ld	d,4 (ix)
   68D9 CB 3A         [ 8]  850 	srl	d
   68DB DD 6E FE      [19]  851 	ld	l,-2 (ix)
   68DE DD 66 FF      [19]  852 	ld	h,-1 (ix)
   68E1 E5            [11]  853 	push	hl
   68E2 21 F0 C0      [10]  854 	ld	hl,#0xC0F0
   68E5 E5            [11]  855 	push	hl
   68E6 3E 28         [ 7]  856 	ld	a,#0x28
   68E8 F5            [11]  857 	push	af
   68E9 33            [ 6]  858 	inc	sp
   68EA C5            [11]  859 	push	bc
   68EB 7B            [ 4]  860 	ld	a,e
   68EC F5            [11]  861 	push	af
   68ED 33            [ 6]  862 	inc	sp
   68EE D5            [11]  863 	push	de
   68EF 33            [ 6]  864 	inc	sp
   68F0 CD 51 55      [17]  865 	call	_cpct_etm_drawTileBox2x4
   68F3 DD F9         [10]  866 	ld	sp, ix
   68F5 DD E1         [14]  867 	pop	ix
   68F7 C9            [10]  868 	ret
                            869 ;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
                            870 ;	---------------------------------
                            871 ; Function borrarEnemigo
                            872 ; ---------------------------------
   68F8                     873 _borrarEnemigo::
   68F8 DD E5         [15]  874 	push	ix
   68FA DD 21 00 00   [14]  875 	ld	ix,#0
   68FE DD 39         [15]  876 	add	ix,sp
   6900 F5            [11]  877 	push	af
   6901 F5            [11]  878 	push	af
                            879 ;src/main.c:218: u8 w = 4 + (x & 1);
   6902 DD 7E 04      [19]  880 	ld	a,4 (ix)
   6905 E6 01         [ 7]  881 	and	a, #0x01
   6907 4F            [ 4]  882 	ld	c,a
   6908 0C            [ 4]  883 	inc	c
   6909 0C            [ 4]  884 	inc	c
   690A 0C            [ 4]  885 	inc	c
   690B 0C            [ 4]  886 	inc	c
                            887 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   690C DD 7E 05      [19]  888 	ld	a,5 (ix)
   690F E6 03         [ 7]  889 	and	a, #0x03
   6911 28 04         [12]  890 	jr	Z,00103$
   6913 3E 01         [ 7]  891 	ld	a,#0x01
   6915 18 02         [12]  892 	jr	00104$
   6917                     893 00103$:
   6917 3E 00         [ 7]  894 	ld	a,#0x00
   6919                     895 00104$:
   6919 C6 06         [ 7]  896 	add	a, #0x06
   691B 47            [ 4]  897 	ld	b,a
                            898 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   691C 2A 38 65      [16]  899 	ld	hl,(_mapa)
   691F DD 75 FE      [19]  900 	ld	-2 (ix),l
   6922 DD 74 FF      [19]  901 	ld	-1 (ix),h
   6925 DD 5E 05      [19]  902 	ld	e,5 (ix)
   6928 16 00         [ 7]  903 	ld	d,#0x00
   692A 7B            [ 4]  904 	ld	a,e
   692B C6 E8         [ 7]  905 	add	a,#0xE8
   692D DD 77 FC      [19]  906 	ld	-4 (ix),a
   6930 7A            [ 4]  907 	ld	a,d
   6931 CE FF         [ 7]  908 	adc	a,#0xFF
   6933 DD 77 FD      [19]  909 	ld	-3 (ix),a
   6936 E1            [10]  910 	pop	hl
   6937 E5            [11]  911 	push	hl
   6938 DD CB FD 7E   [20]  912 	bit	7, -3 (ix)
   693C 28 04         [12]  913 	jr	Z,00105$
   693E 21 EB FF      [10]  914 	ld	hl,#0xFFEB
   6941 19            [11]  915 	add	hl,de
   6942                     916 00105$:
   6942 CB 2C         [ 8]  917 	sra	h
   6944 CB 1D         [ 8]  918 	rr	l
   6946 CB 2C         [ 8]  919 	sra	h
   6948 CB 1D         [ 8]  920 	rr	l
   694A 5D            [ 4]  921 	ld	e,l
   694B DD 56 04      [19]  922 	ld	d,4 (ix)
   694E CB 3A         [ 8]  923 	srl	d
   6950 DD 6E FE      [19]  924 	ld	l,-2 (ix)
   6953 DD 66 FF      [19]  925 	ld	h,-1 (ix)
   6956 E5            [11]  926 	push	hl
   6957 21 F0 C0      [10]  927 	ld	hl,#0xC0F0
   695A E5            [11]  928 	push	hl
   695B 3E 28         [ 7]  929 	ld	a,#0x28
   695D F5            [11]  930 	push	af
   695E 33            [ 6]  931 	inc	sp
   695F C5            [11]  932 	push	bc
   6960 7B            [ 4]  933 	ld	a,e
   6961 F5            [11]  934 	push	af
   6962 33            [ 6]  935 	inc	sp
   6963 D5            [11]  936 	push	de
   6964 33            [ 6]  937 	inc	sp
   6965 CD 51 55      [17]  938 	call	_cpct_etm_drawTileBox2x4
   6968 DD F9         [10]  939 	ld	sp, ix
   696A DD E1         [14]  940 	pop	ix
   696C C9            [10]  941 	ret
                            942 ;src/main.c:225: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            943 ;	---------------------------------
                            944 ; Function redibujarEnemigo
                            945 ; ---------------------------------
   696D                     946 _redibujarEnemigo::
   696D DD E5         [15]  947 	push	ix
   696F DD 21 00 00   [14]  948 	ld	ix,#0
   6973 DD 39         [15]  949 	add	ix,sp
                            950 ;src/main.c:226: borrarEnemigo(x, y);
   6975 DD 66 05      [19]  951 	ld	h,5 (ix)
   6978 DD 6E 04      [19]  952 	ld	l,4 (ix)
   697B E5            [11]  953 	push	hl
   697C CD F8 68      [17]  954 	call	_borrarEnemigo
   697F F1            [10]  955 	pop	af
                            956 ;src/main.c:227: enemy->px = enemy->x;
   6980 DD 4E 06      [19]  957 	ld	c,6 (ix)
   6983 DD 46 07      [19]  958 	ld	b,7 (ix)
   6986 59            [ 4]  959 	ld	e, c
   6987 50            [ 4]  960 	ld	d, b
   6988 13            [ 6]  961 	inc	de
   6989 13            [ 6]  962 	inc	de
   698A 0A            [ 7]  963 	ld	a,(bc)
   698B 12            [ 7]  964 	ld	(de),a
                            965 ;src/main.c:228: enemy->py = enemy->y;
   698C 59            [ 4]  966 	ld	e, c
   698D 50            [ 4]  967 	ld	d, b
   698E 13            [ 6]  968 	inc	de
   698F 13            [ 6]  969 	inc	de
   6990 13            [ 6]  970 	inc	de
   6991 69            [ 4]  971 	ld	l, c
   6992 60            [ 4]  972 	ld	h, b
   6993 23            [ 6]  973 	inc	hl
   6994 7E            [ 7]  974 	ld	a,(hl)
   6995 12            [ 7]  975 	ld	(de),a
                            976 ;src/main.c:229: dibujarEnemigo(enemy);
   6996 C5            [11]  977 	push	bc
   6997 CD 12 68      [17]  978 	call	_dibujarEnemigo
   699A F1            [10]  979 	pop	af
   699B DD E1         [14]  980 	pop	ix
   699D C9            [10]  981 	ret
                            982 ;src/main.c:233: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            983 ;	---------------------------------
                            984 ; Function checkEnemyDead
                            985 ; ---------------------------------
   699E                     986 _checkEnemyDead::
   699E DD E5         [15]  987 	push	ix
   69A0 DD 21 00 00   [14]  988 	ld	ix,#0
   69A4 DD 39         [15]  989 	add	ix,sp
   69A6 21 FA FF      [10]  990 	ld	hl,#-6
   69A9 39            [11]  991 	add	hl,sp
   69AA F9            [ 6]  992 	ld	sp,hl
                            993 ;src/main.c:235: switch (direction) {
   69AB 3E 03         [ 7]  994 	ld	a,#0x03
   69AD DD 96 04      [19]  995 	sub	a, 4 (ix)
   69B0 DA 8C 6B      [10]  996 	jp	C,00134$
                            997 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69B3 DD 7E 05      [19]  998 	ld	a,5 (ix)
   69B6 DD 77 FA      [19]  999 	ld	-6 (ix),a
   69B9 DD 7E 06      [19] 1000 	ld	a,6 (ix)
   69BC DD 77 FB      [19] 1001 	ld	-5 (ix),a
   69BF DD 7E FA      [19] 1002 	ld	a,-6 (ix)
   69C2 C6 01         [ 7] 1003 	add	a, #0x01
   69C4 DD 77 FE      [19] 1004 	ld	-2 (ix),a
   69C7 DD 7E FB      [19] 1005 	ld	a,-5 (ix)
   69CA CE 00         [ 7] 1006 	adc	a, #0x00
   69CC DD 77 FF      [19] 1007 	ld	-1 (ix),a
                           1008 ;src/main.c:242: enemy->muerto = SI;
   69CF DD 7E FA      [19] 1009 	ld	a,-6 (ix)
   69D2 C6 08         [ 7] 1010 	add	a, #0x08
   69D4 DD 77 FC      [19] 1011 	ld	-4 (ix),a
   69D7 DD 7E FB      [19] 1012 	ld	a,-5 (ix)
   69DA CE 00         [ 7] 1013 	adc	a, #0x00
   69DC DD 77 FD      [19] 1014 	ld	-3 (ix),a
                           1015 ;src/main.c:235: switch (direction) {
   69DF DD 5E 04      [19] 1016 	ld	e,4 (ix)
   69E2 16 00         [ 7] 1017 	ld	d,#0x00
   69E4 21 EB 69      [10] 1018 	ld	hl,#00204$
   69E7 19            [11] 1019 	add	hl,de
   69E8 19            [11] 1020 	add	hl,de
   69E9 19            [11] 1021 	add	hl,de
   69EA E9            [ 4] 1022 	jp	(hl)
   69EB                    1023 00204$:
   69EB C3 F7 69      [10] 1024 	jp	00101$
   69EE C3 5F 6A      [10] 1025 	jp	00109$
   69F1 C3 C7 6A      [10] 1026 	jp	00117$
   69F4 C3 2E 6B      [10] 1027 	jp	00125$
                           1028 ;src/main.c:238: case 0:
   69F7                    1029 00101$:
                           1030 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69F7 21 5F 64      [10] 1031 	ld	hl, #_cu + 1
   69FA 4E            [ 7] 1032 	ld	c,(hl)
   69FB 06 00         [ 7] 1033 	ld	b,#0x00
   69FD 21 04 00      [10] 1034 	ld	hl,#0x0004
   6A00 09            [11] 1035 	add	hl,bc
   6A01 EB            [ 4] 1036 	ex	de,hl
   6A02 DD 6E FE      [19] 1037 	ld	l,-2 (ix)
   6A05 DD 66 FF      [19] 1038 	ld	h,-1 (ix)
   6A08 6E            [ 7] 1039 	ld	l,(hl)
   6A09 26 00         [ 7] 1040 	ld	h,#0x00
   6A0B 7B            [ 4] 1041 	ld	a,e
   6A0C 95            [ 4] 1042 	sub	a, l
   6A0D 7A            [ 4] 1043 	ld	a,d
   6A0E 9C            [ 4] 1044 	sbc	a, h
   6A0F E2 14 6A      [10] 1045 	jp	PO, 00205$
   6A12 EE 80         [ 7] 1046 	xor	a, #0x80
   6A14                    1047 00205$:
   6A14 FA 8C 6B      [10] 1048 	jp	M,00134$
   6A17 11 16 00      [10] 1049 	ld	de,#0x0016
   6A1A 19            [11] 1050 	add	hl,de
   6A1B 7D            [ 4] 1051 	ld	a,l
   6A1C 91            [ 4] 1052 	sub	a, c
   6A1D 7C            [ 4] 1053 	ld	a,h
   6A1E 98            [ 4] 1054 	sbc	a, b
   6A1F E2 24 6A      [10] 1055 	jp	PO, 00206$
   6A22 EE 80         [ 7] 1056 	xor	a, #0x80
   6A24                    1057 00206$:
   6A24 FA 8C 6B      [10] 1058 	jp	M,00134$
                           1059 ;src/main.c:240: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   6A27 E1            [10] 1060 	pop	hl
   6A28 E5            [11] 1061 	push	hl
   6A29 4E            [ 7] 1062 	ld	c,(hl)
   6A2A 21 5E 64      [10] 1063 	ld	hl, #_cu + 0
   6A2D 5E            [ 7] 1064 	ld	e,(hl)
   6A2E 16 00         [ 7] 1065 	ld	d,#0x00
   6A30 13            [ 6] 1066 	inc	de
   6A31 13            [ 6] 1067 	inc	de
   6A32 13            [ 6] 1068 	inc	de
   6A33 13            [ 6] 1069 	inc	de
   6A34 69            [ 4] 1070 	ld	l,c
   6A35 26 00         [ 7] 1071 	ld	h,#0x00
   6A37 7B            [ 4] 1072 	ld	a,e
   6A38 95            [ 4] 1073 	sub	a, l
   6A39 7A            [ 4] 1074 	ld	a,d
   6A3A 9C            [ 4] 1075 	sbc	a, h
   6A3B E2 40 6A      [10] 1076 	jp	PO, 00207$
   6A3E EE 80         [ 7] 1077 	xor	a, #0x80
   6A40                    1078 00207$:
   6A40 F2 8C 6B      [10] 1079 	jp	P,00134$
                           1080 ;src/main.c:241: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A43 BF            [ 4] 1081 	cp	a, a
   6A44 ED 52         [15] 1082 	sbc	hl, de
   6A46 3E 01         [ 7] 1083 	ld	a,#0x01
   6A48 BD            [ 4] 1084 	cp	a, l
   6A49 3E 00         [ 7] 1085 	ld	a,#0x00
   6A4B 9C            [ 4] 1086 	sbc	a, h
   6A4C E2 51 6A      [10] 1087 	jp	PO, 00208$
   6A4F EE 80         [ 7] 1088 	xor	a, #0x80
   6A51                    1089 00208$:
   6A51 FA 8C 6B      [10] 1090 	jp	M,00134$
                           1091 ;src/main.c:242: enemy->muerto = SI;
   6A54 DD 6E FC      [19] 1092 	ld	l,-4 (ix)
   6A57 DD 66 FD      [19] 1093 	ld	h,-3 (ix)
   6A5A 36 01         [10] 1094 	ld	(hl),#0x01
                           1095 ;src/main.c:246: break;
   6A5C C3 8C 6B      [10] 1096 	jp	00134$
                           1097 ;src/main.c:247: case 1:
   6A5F                    1098 00109$:
                           1099 ;src/main.c:248: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A5F 21 5F 64      [10] 1100 	ld	hl, #_cu + 1
   6A62 4E            [ 7] 1101 	ld	c,(hl)
   6A63 06 00         [ 7] 1102 	ld	b,#0x00
   6A65 21 04 00      [10] 1103 	ld	hl,#0x0004
   6A68 09            [11] 1104 	add	hl,bc
   6A69 EB            [ 4] 1105 	ex	de,hl
   6A6A DD 6E FE      [19] 1106 	ld	l,-2 (ix)
   6A6D DD 66 FF      [19] 1107 	ld	h,-1 (ix)
   6A70 6E            [ 7] 1108 	ld	l,(hl)
   6A71 26 00         [ 7] 1109 	ld	h,#0x00
   6A73 7B            [ 4] 1110 	ld	a,e
   6A74 95            [ 4] 1111 	sub	a, l
   6A75 7A            [ 4] 1112 	ld	a,d
   6A76 9C            [ 4] 1113 	sbc	a, h
   6A77 E2 7C 6A      [10] 1114 	jp	PO, 00209$
   6A7A EE 80         [ 7] 1115 	xor	a, #0x80
   6A7C                    1116 00209$:
   6A7C FA 8C 6B      [10] 1117 	jp	M,00134$
   6A7F 11 16 00      [10] 1118 	ld	de,#0x0016
   6A82 19            [11] 1119 	add	hl,de
   6A83 7D            [ 4] 1120 	ld	a,l
   6A84 91            [ 4] 1121 	sub	a, c
   6A85 7C            [ 4] 1122 	ld	a,h
   6A86 98            [ 4] 1123 	sbc	a, b
   6A87 E2 8C 6A      [10] 1124 	jp	PO, 00210$
   6A8A EE 80         [ 7] 1125 	xor	a, #0x80
   6A8C                    1126 00210$:
   6A8C FA 8C 6B      [10] 1127 	jp	M,00134$
                           1128 ;src/main.c:249: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6A8F 21 5E 64      [10] 1129 	ld	hl, #_cu + 0
   6A92 4E            [ 7] 1130 	ld	c,(hl)
   6A93 E1            [10] 1131 	pop	hl
   6A94 E5            [11] 1132 	push	hl
   6A95 5E            [ 7] 1133 	ld	e,(hl)
   6A96 16 00         [ 7] 1134 	ld	d,#0x00
   6A98 13            [ 6] 1135 	inc	de
   6A99 13            [ 6] 1136 	inc	de
   6A9A 13            [ 6] 1137 	inc	de
   6A9B 13            [ 6] 1138 	inc	de
   6A9C 69            [ 4] 1139 	ld	l,c
   6A9D 26 00         [ 7] 1140 	ld	h,#0x00
   6A9F 7B            [ 4] 1141 	ld	a,e
   6AA0 95            [ 4] 1142 	sub	a, l
   6AA1 7A            [ 4] 1143 	ld	a,d
   6AA2 9C            [ 4] 1144 	sbc	a, h
   6AA3 E2 A8 6A      [10] 1145 	jp	PO, 00211$
   6AA6 EE 80         [ 7] 1146 	xor	a, #0x80
   6AA8                    1147 00211$:
   6AA8 F2 8C 6B      [10] 1148 	jp	P,00134$
                           1149 ;src/main.c:250: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6AAB BF            [ 4] 1150 	cp	a, a
   6AAC ED 52         [15] 1151 	sbc	hl, de
   6AAE 3E 01         [ 7] 1152 	ld	a,#0x01
   6AB0 BD            [ 4] 1153 	cp	a, l
   6AB1 3E 00         [ 7] 1154 	ld	a,#0x00
   6AB3 9C            [ 4] 1155 	sbc	a, h
   6AB4 E2 B9 6A      [10] 1156 	jp	PO, 00212$
   6AB7 EE 80         [ 7] 1157 	xor	a, #0x80
   6AB9                    1158 00212$:
   6AB9 FA 8C 6B      [10] 1159 	jp	M,00134$
                           1160 ;src/main.c:251: enemy->muerto = SI;
   6ABC DD 6E FC      [19] 1161 	ld	l,-4 (ix)
   6ABF DD 66 FD      [19] 1162 	ld	h,-3 (ix)
   6AC2 36 01         [10] 1163 	ld	(hl),#0x01
                           1164 ;src/main.c:255: break;
   6AC4 C3 8C 6B      [10] 1165 	jp	00134$
                           1166 ;src/main.c:257: case 2:
   6AC7                    1167 00117$:
                           1168 ;src/main.c:258: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AC7 21 5E 64      [10] 1169 	ld	hl, #_cu + 0
   6ACA 4E            [ 7] 1170 	ld	c,(hl)
   6ACB 06 00         [ 7] 1171 	ld	b,#0x00
   6ACD 59            [ 4] 1172 	ld	e, c
   6ACE 50            [ 4] 1173 	ld	d, b
   6ACF 13            [ 6] 1174 	inc	de
   6AD0 13            [ 6] 1175 	inc	de
   6AD1 E1            [10] 1176 	pop	hl
   6AD2 E5            [11] 1177 	push	hl
   6AD3 6E            [ 7] 1178 	ld	l,(hl)
   6AD4 26 00         [ 7] 1179 	ld	h,#0x00
   6AD6 7B            [ 4] 1180 	ld	a,e
   6AD7 95            [ 4] 1181 	sub	a, l
   6AD8 7A            [ 4] 1182 	ld	a,d
   6AD9 9C            [ 4] 1183 	sbc	a, h
   6ADA E2 DF 6A      [10] 1184 	jp	PO, 00213$
   6ADD EE 80         [ 7] 1185 	xor	a, #0x80
   6ADF                    1186 00213$:
   6ADF FA 8C 6B      [10] 1187 	jp	M,00134$
   6AE2 11 04 00      [10] 1188 	ld	de,#0x0004
   6AE5 19            [11] 1189 	add	hl,de
   6AE6 7D            [ 4] 1190 	ld	a,l
   6AE7 91            [ 4] 1191 	sub	a, c
   6AE8 7C            [ 4] 1192 	ld	a,h
   6AE9 98            [ 4] 1193 	sbc	a, b
   6AEA E2 EF 6A      [10] 1194 	jp	PO, 00214$
   6AED EE 80         [ 7] 1195 	xor	a, #0x80
   6AEF                    1196 00214$:
   6AEF FA 8C 6B      [10] 1197 	jp	M,00134$
                           1198 ;src/main.c:259: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6AF2 21 5F 64      [10] 1199 	ld	hl, #(_cu + 0x0001) + 0
   6AF5 4E            [ 7] 1200 	ld	c,(hl)
   6AF6 DD 6E FE      [19] 1201 	ld	l,-2 (ix)
   6AF9 DD 66 FF      [19] 1202 	ld	h,-1 (ix)
   6AFC 5E            [ 7] 1203 	ld	e,(hl)
   6AFD 16 00         [ 7] 1204 	ld	d,#0x00
   6AFF 21 16 00      [10] 1205 	ld	hl,#0x0016
   6B02 19            [11] 1206 	add	hl,de
   6B03 EB            [ 4] 1207 	ex	de,hl
   6B04 69            [ 4] 1208 	ld	l,c
   6B05 26 00         [ 7] 1209 	ld	h,#0x00
   6B07 7B            [ 4] 1210 	ld	a,e
   6B08 95            [ 4] 1211 	sub	a, l
   6B09 7A            [ 4] 1212 	ld	a,d
   6B0A 9C            [ 4] 1213 	sbc	a, h
   6B0B E2 10 6B      [10] 1214 	jp	PO, 00215$
   6B0E EE 80         [ 7] 1215 	xor	a, #0x80
   6B10                    1216 00215$:
   6B10 F2 8C 6B      [10] 1217 	jp	P,00134$
                           1218 ;src/main.c:260: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6B13 BF            [ 4] 1219 	cp	a, a
   6B14 ED 52         [15] 1220 	sbc	hl, de
   6B16 3E 02         [ 7] 1221 	ld	a,#0x02
   6B18 BD            [ 4] 1222 	cp	a, l
   6B19 3E 00         [ 7] 1223 	ld	a,#0x00
   6B1B 9C            [ 4] 1224 	sbc	a, h
   6B1C E2 21 6B      [10] 1225 	jp	PO, 00216$
   6B1F EE 80         [ 7] 1226 	xor	a, #0x80
   6B21                    1227 00216$:
   6B21 FA 8C 6B      [10] 1228 	jp	M,00134$
                           1229 ;src/main.c:261: enemy->muerto = SI;
   6B24 DD 6E FC      [19] 1230 	ld	l,-4 (ix)
   6B27 DD 66 FD      [19] 1231 	ld	h,-3 (ix)
   6B2A 36 01         [10] 1232 	ld	(hl),#0x01
                           1233 ;src/main.c:265: break;
   6B2C 18 5E         [12] 1234 	jr	00134$
                           1235 ;src/main.c:266: case 3:
   6B2E                    1236 00125$:
                           1237 ;src/main.c:267: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6B2E 21 5E 64      [10] 1238 	ld	hl, #_cu + 0
   6B31 4E            [ 7] 1239 	ld	c,(hl)
   6B32 06 00         [ 7] 1240 	ld	b,#0x00
   6B34 59            [ 4] 1241 	ld	e, c
   6B35 50            [ 4] 1242 	ld	d, b
   6B36 13            [ 6] 1243 	inc	de
   6B37 13            [ 6] 1244 	inc	de
   6B38 E1            [10] 1245 	pop	hl
   6B39 E5            [11] 1246 	push	hl
   6B3A 6E            [ 7] 1247 	ld	l,(hl)
   6B3B 26 00         [ 7] 1248 	ld	h,#0x00
   6B3D 7B            [ 4] 1249 	ld	a,e
   6B3E 95            [ 4] 1250 	sub	a, l
   6B3F 7A            [ 4] 1251 	ld	a,d
   6B40 9C            [ 4] 1252 	sbc	a, h
   6B41 E2 46 6B      [10] 1253 	jp	PO, 00217$
   6B44 EE 80         [ 7] 1254 	xor	a, #0x80
   6B46                    1255 00217$:
   6B46 FA 8C 6B      [10] 1256 	jp	M,00134$
   6B49 11 04 00      [10] 1257 	ld	de,#0x0004
   6B4C 19            [11] 1258 	add	hl,de
   6B4D 7D            [ 4] 1259 	ld	a,l
   6B4E 91            [ 4] 1260 	sub	a, c
   6B4F 7C            [ 4] 1261 	ld	a,h
   6B50 98            [ 4] 1262 	sbc	a, b
   6B51 E2 56 6B      [10] 1263 	jp	PO, 00218$
   6B54 EE 80         [ 7] 1264 	xor	a, #0x80
   6B56                    1265 00218$:
   6B56 FA 8C 6B      [10] 1266 	jp	M,00134$
                           1267 ;src/main.c:268: if(enemy->y>cu.y){
   6B59 DD 6E FE      [19] 1268 	ld	l,-2 (ix)
   6B5C DD 66 FF      [19] 1269 	ld	h,-1 (ix)
   6B5F 4E            [ 7] 1270 	ld	c,(hl)
   6B60 21 5F 64      [10] 1271 	ld	hl, #(_cu + 0x0001) + 0
   6B63 5E            [ 7] 1272 	ld	e,(hl)
   6B64 7B            [ 4] 1273 	ld	a,e
   6B65 91            [ 4] 1274 	sub	a, c
   6B66 30 24         [12] 1275 	jr	NC,00134$
                           1276 ;src/main.c:269: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6B68 06 00         [ 7] 1277 	ld	b,#0x00
   6B6A 16 00         [ 7] 1278 	ld	d,#0x00
   6B6C 21 08 00      [10] 1279 	ld	hl,#0x0008
   6B6F 19            [11] 1280 	add	hl,de
   6B70 79            [ 4] 1281 	ld	a,c
   6B71 95            [ 4] 1282 	sub	a, l
   6B72 4F            [ 4] 1283 	ld	c,a
   6B73 78            [ 4] 1284 	ld	a,b
   6B74 9C            [ 4] 1285 	sbc	a, h
   6B75 47            [ 4] 1286 	ld	b,a
   6B76 3E 02         [ 7] 1287 	ld	a,#0x02
   6B78 B9            [ 4] 1288 	cp	a, c
   6B79 3E 00         [ 7] 1289 	ld	a,#0x00
   6B7B 98            [ 4] 1290 	sbc	a, b
   6B7C E2 81 6B      [10] 1291 	jp	PO, 00219$
   6B7F EE 80         [ 7] 1292 	xor	a, #0x80
   6B81                    1293 00219$:
   6B81 FA 8C 6B      [10] 1294 	jp	M,00134$
                           1295 ;src/main.c:270: enemy->muerto = SI;
   6B84 DD 6E FC      [19] 1296 	ld	l,-4 (ix)
   6B87 DD 66 FD      [19] 1297 	ld	h,-3 (ix)
   6B8A 36 01         [10] 1298 	ld	(hl),#0x01
                           1299 ;src/main.c:275: }
   6B8C                    1300 00134$:
   6B8C DD F9         [10] 1301 	ld	sp, ix
   6B8E DD E1         [14] 1302 	pop	ix
   6B90 C9            [10] 1303 	ret
                           1304 ;src/main.c:278: void moverEnemigoArriba(TEnemy *enemy){
                           1305 ;	---------------------------------
                           1306 ; Function moverEnemigoArriba
                           1307 ; ---------------------------------
   6B91                    1308 _moverEnemigoArriba::
   6B91 DD E5         [15] 1309 	push	ix
   6B93 DD 21 00 00   [14] 1310 	ld	ix,#0
   6B97 DD 39         [15] 1311 	add	ix,sp
                           1312 ;src/main.c:279: enemy->y--;
   6B99 DD 4E 04      [19] 1313 	ld	c,4 (ix)
   6B9C DD 46 05      [19] 1314 	ld	b,5 (ix)
   6B9F 69            [ 4] 1315 	ld	l, c
   6BA0 60            [ 4] 1316 	ld	h, b
   6BA1 23            [ 6] 1317 	inc	hl
   6BA2 5E            [ 7] 1318 	ld	e,(hl)
   6BA3 1D            [ 4] 1319 	dec	e
   6BA4 73            [ 7] 1320 	ld	(hl),e
                           1321 ;src/main.c:280: enemy->y--;
   6BA5 1D            [ 4] 1322 	dec	e
   6BA6 73            [ 7] 1323 	ld	(hl),e
                           1324 ;src/main.c:281: enemy->mover = SI;
   6BA7 21 06 00      [10] 1325 	ld	hl,#0x0006
   6BAA 09            [11] 1326 	add	hl,bc
   6BAB 36 01         [10] 1327 	ld	(hl),#0x01
   6BAD DD E1         [14] 1328 	pop	ix
   6BAF C9            [10] 1329 	ret
                           1330 ;src/main.c:284: void moverEnemigoAbajo(TEnemy *enemy){
                           1331 ;	---------------------------------
                           1332 ; Function moverEnemigoAbajo
                           1333 ; ---------------------------------
   6BB0                    1334 _moverEnemigoAbajo::
   6BB0 DD E5         [15] 1335 	push	ix
   6BB2 DD 21 00 00   [14] 1336 	ld	ix,#0
   6BB6 DD 39         [15] 1337 	add	ix,sp
                           1338 ;src/main.c:285: enemy->y++;
   6BB8 DD 4E 04      [19] 1339 	ld	c,4 (ix)
   6BBB DD 46 05      [19] 1340 	ld	b,5 (ix)
   6BBE 59            [ 4] 1341 	ld	e, c
   6BBF 50            [ 4] 1342 	ld	d, b
   6BC0 13            [ 6] 1343 	inc	de
   6BC1 1A            [ 7] 1344 	ld	a,(de)
   6BC2 3C            [ 4] 1345 	inc	a
   6BC3 12            [ 7] 1346 	ld	(de),a
                           1347 ;src/main.c:286: enemy->y++;
   6BC4 3C            [ 4] 1348 	inc	a
   6BC5 12            [ 7] 1349 	ld	(de),a
                           1350 ;src/main.c:287: enemy->mover = SI;
   6BC6 21 06 00      [10] 1351 	ld	hl,#0x0006
   6BC9 09            [11] 1352 	add	hl,bc
   6BCA 36 01         [10] 1353 	ld	(hl),#0x01
   6BCC DD E1         [14] 1354 	pop	ix
   6BCE C9            [10] 1355 	ret
                           1356 ;src/main.c:290: void moverEnemigoDerecha(TEnemy *enemy){
                           1357 ;	---------------------------------
                           1358 ; Function moverEnemigoDerecha
                           1359 ; ---------------------------------
   6BCF                    1360 _moverEnemigoDerecha::
                           1361 ;src/main.c:291: enemy->x++;
   6BCF D1            [10] 1362 	pop	de
   6BD0 C1            [10] 1363 	pop	bc
   6BD1 C5            [11] 1364 	push	bc
   6BD2 D5            [11] 1365 	push	de
   6BD3 0A            [ 7] 1366 	ld	a,(bc)
   6BD4 3C            [ 4] 1367 	inc	a
   6BD5 02            [ 7] 1368 	ld	(bc),a
                           1369 ;src/main.c:292: enemy->x++;
   6BD6 3C            [ 4] 1370 	inc	a
   6BD7 02            [ 7] 1371 	ld	(bc),a
                           1372 ;src/main.c:293: enemy->mover = SI;
   6BD8 21 06 00      [10] 1373 	ld	hl,#0x0006
   6BDB 09            [11] 1374 	add	hl,bc
   6BDC 36 01         [10] 1375 	ld	(hl),#0x01
   6BDE C9            [10] 1376 	ret
                           1377 ;src/main.c:296: void moverEnemigoIzquierda(TEnemy *enemy){
                           1378 ;	---------------------------------
                           1379 ; Function moverEnemigoIzquierda
                           1380 ; ---------------------------------
   6BDF                    1381 _moverEnemigoIzquierda::
                           1382 ;src/main.c:297: enemy->x--;
   6BDF D1            [10] 1383 	pop	de
   6BE0 C1            [10] 1384 	pop	bc
   6BE1 C5            [11] 1385 	push	bc
   6BE2 D5            [11] 1386 	push	de
   6BE3 0A            [ 7] 1387 	ld	a,(bc)
   6BE4 C6 FF         [ 7] 1388 	add	a,#0xFF
   6BE6 02            [ 7] 1389 	ld	(bc),a
                           1390 ;src/main.c:298: enemy->x--;
   6BE7 C6 FF         [ 7] 1391 	add	a,#0xFF
   6BE9 02            [ 7] 1392 	ld	(bc),a
                           1393 ;src/main.c:299: enemy->mover = SI;
   6BEA 21 06 00      [10] 1394 	ld	hl,#0x0006
   6BED 09            [11] 1395 	add	hl,bc
   6BEE 36 01         [10] 1396 	ld	(hl),#0x01
   6BF0 C9            [10] 1397 	ret
                           1398 ;src/main.c:302: void moverEnemigoPatrol(TEnemy* enemy){
                           1399 ;	---------------------------------
                           1400 ; Function moverEnemigoPatrol
                           1401 ; ---------------------------------
   6BF1                    1402 _moverEnemigoPatrol::
   6BF1 DD E5         [15] 1403 	push	ix
   6BF3 DD 21 00 00   [14] 1404 	ld	ix,#0
   6BF7 DD 39         [15] 1405 	add	ix,sp
   6BF9 21 F3 FF      [10] 1406 	ld	hl,#-13
   6BFC 39            [11] 1407 	add	hl,sp
   6BFD F9            [ 6] 1408 	ld	sp,hl
                           1409 ;src/main.c:304: if(!enemy->muerto){
   6BFE DD 4E 04      [19] 1410 	ld	c,4 (ix)
   6C01 DD 46 05      [19] 1411 	ld	b,5 (ix)
   6C04 C5            [11] 1412 	push	bc
   6C05 FD E1         [14] 1413 	pop	iy
   6C07 FD 7E 08      [19] 1414 	ld	a,8 (iy)
   6C0A B7            [ 4] 1415 	or	a, a
   6C0B C2 4A 6E      [10] 1416 	jp	NZ,00118$
                           1417 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C0E 21 0B 00      [10] 1418 	ld	hl,#0x000B
   6C11 09            [11] 1419 	add	hl,bc
   6C12 DD 75 F4      [19] 1420 	ld	-12 (ix),l
   6C15 DD 74 F5      [19] 1421 	ld	-11 (ix),h
   6C18 DD 6E F4      [19] 1422 	ld	l,-12 (ix)
   6C1B DD 66 F5      [19] 1423 	ld	h,-11 (ix)
   6C1E 7E            [ 7] 1424 	ld	a,(hl)
   6C1F DD 77 F3      [19] 1425 	ld	-13 (ix),a
                           1426 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C22 21 0D 00      [10] 1427 	ld	hl,#0x000D
   6C25 09            [11] 1428 	add	hl,bc
   6C26 DD 75 FE      [19] 1429 	ld	-2 (ix),l
   6C29 DD 74 FF      [19] 1430 	ld	-1 (ix),h
   6C2C DD 6E FE      [19] 1431 	ld	l,-2 (ix)
   6C2F DD 66 FF      [19] 1432 	ld	h,-1 (ix)
   6C32 5E            [ 7] 1433 	ld	e,(hl)
   6C33 23            [ 6] 1434 	inc	hl
   6C34 56            [ 7] 1435 	ld	d,(hl)
   6C35 21 E2 00      [10] 1436 	ld	hl,#0x00E2
   6C38 09            [11] 1437 	add	hl,bc
   6C39 DD 75 FC      [19] 1438 	ld	-4 (ix),l
   6C3C DD 74 FD      [19] 1439 	ld	-3 (ix),h
                           1440 ;src/main.c:308: enemy->mover = SI;
   6C3F 21 06 00      [10] 1441 	ld	hl,#0x0006
   6C42 09            [11] 1442 	add	hl,bc
   6C43 DD 75 FA      [19] 1443 	ld	-6 (ix),l
   6C46 DD 74 FB      [19] 1444 	ld	-5 (ix),h
                           1445 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C49 21 1A 00      [10] 1446 	ld	hl,#0x001A
   6C4C 09            [11] 1447 	add	hl,bc
   6C4D DD 75 F8      [19] 1448 	ld	-8 (ix),l
   6C50 DD 74 F9      [19] 1449 	ld	-7 (ix),h
                           1450 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6C53 21 01 00      [10] 1451 	ld	hl,#0x0001
   6C56 09            [11] 1452 	add	hl,bc
   6C57 DD 75 F6      [19] 1453 	ld	-10 (ix),l
   6C5A DD 74 F7      [19] 1454 	ld	-9 (ix),h
                           1455 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C5D DD 7E F3      [19] 1456 	ld	a,-13 (ix)
   6C60 B7            [ 4] 1457 	or	a, a
   6C61 C2 40 6D      [10] 1458 	jp	NZ,00114$
                           1459 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C64 DD 6E FC      [19] 1460 	ld	l,-4 (ix)
   6C67 DD 66 FD      [19] 1461 	ld	h,-3 (ix)
   6C6A 6E            [ 7] 1462 	ld	l,(hl)
   6C6B 26 00         [ 7] 1463 	ld	h,#0x00
   6C6D 7B            [ 4] 1464 	ld	a,e
   6C6E 95            [ 4] 1465 	sub	a, l
   6C6F 7A            [ 4] 1466 	ld	a,d
   6C70 9C            [ 4] 1467 	sbc	a, h
   6C71 E2 76 6C      [10] 1468 	jp	PO, 00144$
   6C74 EE 80         [ 7] 1469 	xor	a, #0x80
   6C76                    1470 00144$:
   6C76 F2 1B 6D      [10] 1471 	jp	P,00105$
                           1472 ;src/main.c:307: if(enemy->iter == 0){
   6C79 7A            [ 4] 1473 	ld	a,d
   6C7A B3            [ 4] 1474 	or	a,e
   6C7B 20 54         [12] 1475 	jr	NZ,00102$
                           1476 ;src/main.c:308: enemy->mover = SI;
   6C7D DD 6E FA      [19] 1477 	ld	l,-6 (ix)
   6C80 DD 66 FB      [19] 1478 	ld	h,-5 (ix)
   6C83 36 01         [10] 1479 	ld	(hl),#0x01
                           1480 ;src/main.c:309: enemy->iter = 2;
   6C85 DD 6E FE      [19] 1481 	ld	l,-2 (ix)
   6C88 DD 66 FF      [19] 1482 	ld	h,-1 (ix)
   6C8B 36 02         [10] 1483 	ld	(hl),#0x02
   6C8D 23            [ 6] 1484 	inc	hl
   6C8E 36 00         [10] 1485 	ld	(hl),#0x00
                           1486 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C90 DD 6E FE      [19] 1487 	ld	l,-2 (ix)
   6C93 DD 66 FF      [19] 1488 	ld	h,-1 (ix)
   6C96 5E            [ 7] 1489 	ld	e,(hl)
   6C97 23            [ 6] 1490 	inc	hl
   6C98 56            [ 7] 1491 	ld	d,(hl)
   6C99 DD 6E F8      [19] 1492 	ld	l,-8 (ix)
   6C9C DD 66 F9      [19] 1493 	ld	h,-7 (ix)
   6C9F 19            [11] 1494 	add	hl,de
   6CA0 7E            [ 7] 1495 	ld	a,(hl)
   6CA1 02            [ 7] 1496 	ld	(bc),a
                           1497 ;src/main.c:311: ++enemy->iter;
   6CA2 DD 6E FE      [19] 1498 	ld	l,-2 (ix)
   6CA5 DD 66 FF      [19] 1499 	ld	h,-1 (ix)
   6CA8 4E            [ 7] 1500 	ld	c,(hl)
   6CA9 23            [ 6] 1501 	inc	hl
   6CAA 46            [ 7] 1502 	ld	b,(hl)
   6CAB 03            [ 6] 1503 	inc	bc
   6CAC DD 6E FE      [19] 1504 	ld	l,-2 (ix)
   6CAF DD 66 FF      [19] 1505 	ld	h,-1 (ix)
   6CB2 71            [ 7] 1506 	ld	(hl),c
   6CB3 23            [ 6] 1507 	inc	hl
   6CB4 70            [ 7] 1508 	ld	(hl),b
                           1509 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6CB5 DD 6E F8      [19] 1510 	ld	l,-8 (ix)
   6CB8 DD 66 F9      [19] 1511 	ld	h,-7 (ix)
   6CBB 09            [11] 1512 	add	hl,bc
   6CBC 5E            [ 7] 1513 	ld	e,(hl)
   6CBD DD 6E F6      [19] 1514 	ld	l,-10 (ix)
   6CC0 DD 66 F7      [19] 1515 	ld	h,-9 (ix)
   6CC3 73            [ 7] 1516 	ld	(hl),e
                           1517 ;src/main.c:313: ++enemy->iter;
   6CC4 03            [ 6] 1518 	inc	bc
   6CC5 DD 6E FE      [19] 1519 	ld	l,-2 (ix)
   6CC8 DD 66 FF      [19] 1520 	ld	h,-1 (ix)
   6CCB 71            [ 7] 1521 	ld	(hl),c
   6CCC 23            [ 6] 1522 	inc	hl
   6CCD 70            [ 7] 1523 	ld	(hl),b
   6CCE C3 4A 6E      [10] 1524 	jp	00118$
   6CD1                    1525 00102$:
                           1526 ;src/main.c:315: enemy->mover = SI;
   6CD1 DD 6E FA      [19] 1527 	ld	l,-6 (ix)
   6CD4 DD 66 FB      [19] 1528 	ld	h,-5 (ix)
   6CD7 36 01         [10] 1529 	ld	(hl),#0x01
                           1530 ;src/main.c:316: enemy->x = enemy->camino[enemy->iter];
   6CD9 DD 6E FE      [19] 1531 	ld	l,-2 (ix)
   6CDC DD 66 FF      [19] 1532 	ld	h,-1 (ix)
   6CDF 5E            [ 7] 1533 	ld	e,(hl)
   6CE0 23            [ 6] 1534 	inc	hl
   6CE1 56            [ 7] 1535 	ld	d,(hl)
   6CE2 DD 6E F8      [19] 1536 	ld	l,-8 (ix)
   6CE5 DD 66 F9      [19] 1537 	ld	h,-7 (ix)
   6CE8 19            [11] 1538 	add	hl,de
   6CE9 7E            [ 7] 1539 	ld	a,(hl)
   6CEA 02            [ 7] 1540 	ld	(bc),a
                           1541 ;src/main.c:317: ++enemy->iter;
   6CEB DD 6E FE      [19] 1542 	ld	l,-2 (ix)
   6CEE DD 66 FF      [19] 1543 	ld	h,-1 (ix)
   6CF1 5E            [ 7] 1544 	ld	e,(hl)
   6CF2 23            [ 6] 1545 	inc	hl
   6CF3 56            [ 7] 1546 	ld	d,(hl)
   6CF4 13            [ 6] 1547 	inc	de
   6CF5 DD 6E FE      [19] 1548 	ld	l,-2 (ix)
   6CF8 DD 66 FF      [19] 1549 	ld	h,-1 (ix)
   6CFB 73            [ 7] 1550 	ld	(hl),e
   6CFC 23            [ 6] 1551 	inc	hl
   6CFD 72            [ 7] 1552 	ld	(hl),d
                           1553 ;src/main.c:318: enemy->y = enemy->camino[enemy->iter];
   6CFE DD 6E F8      [19] 1554 	ld	l,-8 (ix)
   6D01 DD 66 F9      [19] 1555 	ld	h,-7 (ix)
   6D04 19            [11] 1556 	add	hl,de
   6D05 7E            [ 7] 1557 	ld	a,(hl)
   6D06 DD 6E F6      [19] 1558 	ld	l,-10 (ix)
   6D09 DD 66 F7      [19] 1559 	ld	h,-9 (ix)
   6D0C 77            [ 7] 1560 	ld	(hl),a
                           1561 ;src/main.c:319: ++enemy->iter;
   6D0D 13            [ 6] 1562 	inc	de
   6D0E 4B            [ 4] 1563 	ld	c,e
   6D0F DD 6E FE      [19] 1564 	ld	l,-2 (ix)
   6D12 DD 66 FF      [19] 1565 	ld	h,-1 (ix)
   6D15 71            [ 7] 1566 	ld	(hl),c
   6D16 23            [ 6] 1567 	inc	hl
   6D17 72            [ 7] 1568 	ld	(hl),d
   6D18 C3 4A 6E      [10] 1569 	jp	00118$
   6D1B                    1570 00105$:
                           1571 ;src/main.c:323: enemy->mover = NO;
   6D1B DD 6E FA      [19] 1572 	ld	l,-6 (ix)
   6D1E DD 66 FB      [19] 1573 	ld	h,-5 (ix)
   6D21 36 00         [10] 1574 	ld	(hl),#0x00
                           1575 ;src/main.c:324: enemy->iter = enemy->longitud_camino;
   6D23 DD 6E FC      [19] 1576 	ld	l,-4 (ix)
   6D26 DD 66 FD      [19] 1577 	ld	h,-3 (ix)
   6D29 4E            [ 7] 1578 	ld	c,(hl)
   6D2A 06 00         [ 7] 1579 	ld	b,#0x00
   6D2C DD 6E FE      [19] 1580 	ld	l,-2 (ix)
   6D2F DD 66 FF      [19] 1581 	ld	h,-1 (ix)
   6D32 71            [ 7] 1582 	ld	(hl),c
   6D33 23            [ 6] 1583 	inc	hl
   6D34 70            [ 7] 1584 	ld	(hl),b
                           1585 ;src/main.c:325: enemy->reversePatrol = 1;
   6D35 DD 6E F4      [19] 1586 	ld	l,-12 (ix)
   6D38 DD 66 F5      [19] 1587 	ld	h,-11 (ix)
   6D3B 36 01         [10] 1588 	ld	(hl),#0x01
   6D3D C3 4A 6E      [10] 1589 	jp	00118$
   6D40                    1590 00114$:
                           1591 ;src/main.c:328: if(enemy->iter > 0){
   6D40 AF            [ 4] 1592 	xor	a, a
   6D41 BB            [ 4] 1593 	cp	a, e
   6D42 9A            [ 4] 1594 	sbc	a, d
   6D43 E2 48 6D      [10] 1595 	jp	PO, 00145$
   6D46 EE 80         [ 7] 1596 	xor	a, #0x80
   6D48                    1597 00145$:
   6D48 F2 30 6E      [10] 1598 	jp	P,00111$
                           1599 ;src/main.c:329: if(enemy->iter == enemy->longitud_camino){
   6D4B DD 6E FC      [19] 1600 	ld	l,-4 (ix)
   6D4E DD 66 FD      [19] 1601 	ld	h,-3 (ix)
   6D51 6E            [ 7] 1602 	ld	l,(hl)
   6D52 DD 75 FC      [19] 1603 	ld	-4 (ix),l
   6D55 DD 36 FD 00   [19] 1604 	ld	-3 (ix),#0x00
   6D59 7B            [ 4] 1605 	ld	a,e
   6D5A DD 96 FC      [19] 1606 	sub	a, -4 (ix)
   6D5D C2 E8 6D      [10] 1607 	jp	NZ,00108$
   6D60 7A            [ 4] 1608 	ld	a,d
   6D61 DD 96 FD      [19] 1609 	sub	a, -3 (ix)
   6D64 C2 E8 6D      [10] 1610 	jp	NZ,00108$
                           1611 ;src/main.c:330: enemy->mover = SI;
   6D67 DD 6E FA      [19] 1612 	ld	l,-6 (ix)
   6D6A DD 66 FB      [19] 1613 	ld	h,-5 (ix)
   6D6D 36 01         [10] 1614 	ld	(hl),#0x01
                           1615 ;src/main.c:331: enemy->iter = enemy->iter - 1;
   6D6F DD 6E FE      [19] 1616 	ld	l,-2 (ix)
   6D72 DD 66 FF      [19] 1617 	ld	h,-1 (ix)
   6D75 5E            [ 7] 1618 	ld	e,(hl)
   6D76 23            [ 6] 1619 	inc	hl
   6D77 56            [ 7] 1620 	ld	d,(hl)
   6D78 7B            [ 4] 1621 	ld	a,e
   6D79 C6 FF         [ 7] 1622 	add	a,#0xFF
   6D7B DD 77 FC      [19] 1623 	ld	-4 (ix),a
   6D7E 7A            [ 4] 1624 	ld	a,d
   6D7F CE FF         [ 7] 1625 	adc	a,#0xFF
   6D81 DD 77 FD      [19] 1626 	ld	-3 (ix),a
   6D84 DD 6E FE      [19] 1627 	ld	l,-2 (ix)
   6D87 DD 66 FF      [19] 1628 	ld	h,-1 (ix)
   6D8A DD 7E FC      [19] 1629 	ld	a,-4 (ix)
   6D8D 77            [ 7] 1630 	ld	(hl),a
   6D8E 23            [ 6] 1631 	inc	hl
   6D8F DD 7E FD      [19] 1632 	ld	a,-3 (ix)
   6D92 77            [ 7] 1633 	ld	(hl),a
                           1634 ;src/main.c:332: enemy->iter = enemy->iter - 2;
   6D93 DD 5E FC      [19] 1635 	ld	e,-4 (ix)
   6D96 DD 56 FD      [19] 1636 	ld	d,-3 (ix)
   6D99 1B            [ 6] 1637 	dec	de
   6D9A 1B            [ 6] 1638 	dec	de
   6D9B DD 6E FE      [19] 1639 	ld	l,-2 (ix)
   6D9E DD 66 FF      [19] 1640 	ld	h,-1 (ix)
   6DA1 73            [ 7] 1641 	ld	(hl),e
   6DA2 23            [ 6] 1642 	inc	hl
   6DA3 72            [ 7] 1643 	ld	(hl),d
                           1644 ;src/main.c:333: enemy->y = enemy->camino[enemy->iter];
   6DA4 DD 6E F8      [19] 1645 	ld	l,-8 (ix)
   6DA7 DD 66 F9      [19] 1646 	ld	h,-7 (ix)
   6DAA 19            [11] 1647 	add	hl,de
   6DAB 5E            [ 7] 1648 	ld	e,(hl)
   6DAC DD 6E F6      [19] 1649 	ld	l,-10 (ix)
   6DAF DD 66 F7      [19] 1650 	ld	h,-9 (ix)
   6DB2 73            [ 7] 1651 	ld	(hl),e
                           1652 ;src/main.c:334: --enemy->iter;
   6DB3 DD 7E FC      [19] 1653 	ld	a,-4 (ix)
   6DB6 C6 FD         [ 7] 1654 	add	a,#0xFD
   6DB8 5F            [ 4] 1655 	ld	e,a
   6DB9 DD 7E FD      [19] 1656 	ld	a,-3 (ix)
   6DBC CE FF         [ 7] 1657 	adc	a,#0xFF
   6DBE 57            [ 4] 1658 	ld	d,a
   6DBF DD 6E FE      [19] 1659 	ld	l,-2 (ix)
   6DC2 DD 66 FF      [19] 1660 	ld	h,-1 (ix)
   6DC5 73            [ 7] 1661 	ld	(hl),e
   6DC6 23            [ 6] 1662 	inc	hl
   6DC7 72            [ 7] 1663 	ld	(hl),d
                           1664 ;src/main.c:335: enemy->x = enemy->camino[enemy->iter];
   6DC8 DD 6E F8      [19] 1665 	ld	l,-8 (ix)
   6DCB DD 66 F9      [19] 1666 	ld	h,-7 (ix)
   6DCE 19            [11] 1667 	add	hl,de
   6DCF 7E            [ 7] 1668 	ld	a,(hl)
   6DD0 02            [ 7] 1669 	ld	(bc),a
                           1670 ;src/main.c:336: --enemy->iter;
   6DD1 DD 7E FC      [19] 1671 	ld	a,-4 (ix)
   6DD4 C6 FC         [ 7] 1672 	add	a,#0xFC
   6DD6 4F            [ 4] 1673 	ld	c,a
   6DD7 DD 7E FD      [19] 1674 	ld	a,-3 (ix)
   6DDA CE FF         [ 7] 1675 	adc	a,#0xFF
   6DDC 47            [ 4] 1676 	ld	b,a
   6DDD DD 6E FE      [19] 1677 	ld	l,-2 (ix)
   6DE0 DD 66 FF      [19] 1678 	ld	h,-1 (ix)
   6DE3 71            [ 7] 1679 	ld	(hl),c
   6DE4 23            [ 6] 1680 	inc	hl
   6DE5 70            [ 7] 1681 	ld	(hl),b
   6DE6 18 62         [12] 1682 	jr	00118$
   6DE8                    1683 00108$:
                           1684 ;src/main.c:338: enemy->mover = SI;
   6DE8 DD 6E FA      [19] 1685 	ld	l,-6 (ix)
   6DEB DD 66 FB      [19] 1686 	ld	h,-5 (ix)
   6DEE 36 01         [10] 1687 	ld	(hl),#0x01
                           1688 ;src/main.c:339: enemy->y = enemy->camino[enemy->iter];
   6DF0 DD 6E FE      [19] 1689 	ld	l,-2 (ix)
   6DF3 DD 66 FF      [19] 1690 	ld	h,-1 (ix)
   6DF6 5E            [ 7] 1691 	ld	e,(hl)
   6DF7 23            [ 6] 1692 	inc	hl
   6DF8 56            [ 7] 1693 	ld	d,(hl)
   6DF9 DD 6E F8      [19] 1694 	ld	l,-8 (ix)
   6DFC DD 66 F9      [19] 1695 	ld	h,-7 (ix)
   6DFF 19            [11] 1696 	add	hl,de
   6E00 5E            [ 7] 1697 	ld	e,(hl)
   6E01 DD 6E F6      [19] 1698 	ld	l,-10 (ix)
   6E04 DD 66 F7      [19] 1699 	ld	h,-9 (ix)
   6E07 73            [ 7] 1700 	ld	(hl),e
                           1701 ;src/main.c:340: --enemy->iter;
   6E08 DD 6E FE      [19] 1702 	ld	l,-2 (ix)
   6E0B DD 66 FF      [19] 1703 	ld	h,-1 (ix)
   6E0E 5E            [ 7] 1704 	ld	e,(hl)
   6E0F 23            [ 6] 1705 	inc	hl
   6E10 56            [ 7] 1706 	ld	d,(hl)
   6E11 1B            [ 6] 1707 	dec	de
   6E12 DD 6E FE      [19] 1708 	ld	l,-2 (ix)
   6E15 DD 66 FF      [19] 1709 	ld	h,-1 (ix)
   6E18 73            [ 7] 1710 	ld	(hl),e
   6E19 23            [ 6] 1711 	inc	hl
   6E1A 72            [ 7] 1712 	ld	(hl),d
                           1713 ;src/main.c:341: enemy->x = enemy->camino[enemy->iter];
   6E1B DD 6E F8      [19] 1714 	ld	l,-8 (ix)
   6E1E DD 66 F9      [19] 1715 	ld	h,-7 (ix)
   6E21 19            [11] 1716 	add	hl,de
   6E22 7E            [ 7] 1717 	ld	a,(hl)
   6E23 02            [ 7] 1718 	ld	(bc),a
                           1719 ;src/main.c:342: --enemy->iter;
   6E24 1B            [ 6] 1720 	dec	de
   6E25 DD 6E FE      [19] 1721 	ld	l,-2 (ix)
   6E28 DD 66 FF      [19] 1722 	ld	h,-1 (ix)
   6E2B 73            [ 7] 1723 	ld	(hl),e
   6E2C 23            [ 6] 1724 	inc	hl
   6E2D 72            [ 7] 1725 	ld	(hl),d
   6E2E 18 1A         [12] 1726 	jr	00118$
   6E30                    1727 00111$:
                           1728 ;src/main.c:346: enemy->mover = NO;
   6E30 DD 6E FA      [19] 1729 	ld	l,-6 (ix)
   6E33 DD 66 FB      [19] 1730 	ld	h,-5 (ix)
   6E36 36 00         [10] 1731 	ld	(hl),#0x00
                           1732 ;src/main.c:347: enemy->iter = 0;
   6E38 DD 6E FE      [19] 1733 	ld	l,-2 (ix)
   6E3B DD 66 FF      [19] 1734 	ld	h,-1 (ix)
   6E3E AF            [ 4] 1735 	xor	a, a
   6E3F 77            [ 7] 1736 	ld	(hl), a
   6E40 23            [ 6] 1737 	inc	hl
   6E41 77            [ 7] 1738 	ld	(hl), a
                           1739 ;src/main.c:348: enemy->reversePatrol = 0;
   6E42 DD 6E F4      [19] 1740 	ld	l,-12 (ix)
   6E45 DD 66 F5      [19] 1741 	ld	h,-11 (ix)
   6E48 36 00         [10] 1742 	ld	(hl),#0x00
   6E4A                    1743 00118$:
   6E4A DD F9         [10] 1744 	ld	sp, ix
   6E4C DD E1         [14] 1745 	pop	ix
   6E4E C9            [10] 1746 	ret
                           1747 ;src/main.c:354: void lookFor(TEnemy* enemy){
                           1748 ;	---------------------------------
                           1749 ; Function lookFor
                           1750 ; ---------------------------------
   6E4F                    1751 _lookFor::
   6E4F DD E5         [15] 1752 	push	ix
   6E51 DD 21 00 00   [14] 1753 	ld	ix,#0
   6E55 DD 39         [15] 1754 	add	ix,sp
   6E57 21 F9 FF      [10] 1755 	ld	hl,#-7
   6E5A 39            [11] 1756 	add	hl,sp
   6E5B F9            [ 6] 1757 	ld	sp,hl
                           1758 ;src/main.c:360: i16 difx = abs((i16)(enemy->x - prota.x));
   6E5C DD 5E 04      [19] 1759 	ld	e,4 (ix)
   6E5F DD 56 05      [19] 1760 	ld	d,5 (ix)
   6E62 1A            [ 7] 1761 	ld	a,(de)
   6E63 4F            [ 4] 1762 	ld	c,a
   6E64 06 00         [ 7] 1763 	ld	b,#0x00
   6E66 21 56 64      [10] 1764 	ld	hl,#_prota+0
   6E69 6E            [ 7] 1765 	ld	l,(hl)
   6E6A 26 00         [ 7] 1766 	ld	h,#0x00
   6E6C 79            [ 4] 1767 	ld	a,c
   6E6D 95            [ 4] 1768 	sub	a, l
   6E6E 4F            [ 4] 1769 	ld	c,a
   6E6F 78            [ 4] 1770 	ld	a,b
   6E70 9C            [ 4] 1771 	sbc	a, h
   6E71 47            [ 4] 1772 	ld	b,a
   6E72 D5            [11] 1773 	push	de
   6E73 C5            [11] 1774 	push	bc
   6E74 CD A5 4B      [17] 1775 	call	_abs
   6E77 F1            [10] 1776 	pop	af
   6E78 D1            [10] 1777 	pop	de
   6E79 DD 75 FA      [19] 1778 	ld	-6 (ix),l
   6E7C DD 74 FB      [19] 1779 	ld	-5 (ix),h
                           1780 ;src/main.c:361: i16 dify = abs((i16)(enemy->y - prota.y));
   6E7F 21 01 00      [10] 1781 	ld	hl,#0x0001
   6E82 19            [11] 1782 	add	hl,de
   6E83 DD 75 FC      [19] 1783 	ld	-4 (ix),l
   6E86 DD 74 FD      [19] 1784 	ld	-3 (ix),h
   6E89 DD 6E FC      [19] 1785 	ld	l,-4 (ix)
   6E8C DD 66 FD      [19] 1786 	ld	h,-3 (ix)
   6E8F 4E            [ 7] 1787 	ld	c,(hl)
   6E90 06 00         [ 7] 1788 	ld	b,#0x00
   6E92 21 57 64      [10] 1789 	ld	hl, #(_prota + 0x0001) + 0
   6E95 6E            [ 7] 1790 	ld	l,(hl)
   6E96 26 00         [ 7] 1791 	ld	h,#0x00
   6E98 79            [ 4] 1792 	ld	a,c
   6E99 95            [ 4] 1793 	sub	a, l
   6E9A 4F            [ 4] 1794 	ld	c,a
   6E9B 78            [ 4] 1795 	ld	a,b
   6E9C 9C            [ 4] 1796 	sbc	a, h
   6E9D 47            [ 4] 1797 	ld	b,a
   6E9E D5            [11] 1798 	push	de
   6E9F C5            [11] 1799 	push	bc
   6EA0 CD A5 4B      [17] 1800 	call	_abs
   6EA3 F1            [10] 1801 	pop	af
   6EA4 D1            [10] 1802 	pop	de
                           1803 ;src/main.c:363: dist = difx + dify; // manhattan
   6EA5 DD 4E FA      [19] 1804 	ld	c,-6 (ix)
   6EA8 09            [11] 1805 	add	hl, bc
   6EA9 DD 75 F9      [19] 1806 	ld	-7 (ix),l
                           1807 ;src/main.c:364: enemy->seen = NO;
   6EAC 21 11 00      [10] 1808 	ld	hl,#0x0011
   6EAF 19            [11] 1809 	add	hl,de
   6EB0 DD 75 FE      [19] 1810 	ld	-2 (ix),l
   6EB3 DD 74 FF      [19] 1811 	ld	-1 (ix),h
   6EB6 DD 6E FE      [19] 1812 	ld	l,-2 (ix)
   6EB9 DD 66 FF      [19] 1813 	ld	h,-1 (ix)
   6EBC 36 00         [10] 1814 	ld	(hl),#0x00
                           1815 ;src/main.c:365: enemy->in_range = NO;
   6EBE 21 10 00      [10] 1816 	ld	hl,#0x0010
   6EC1 19            [11] 1817 	add	hl,de
   6EC2 4D            [ 4] 1818 	ld	c,l
   6EC3 44            [ 4] 1819 	ld	b,h
   6EC4 AF            [ 4] 1820 	xor	a, a
   6EC5 02            [ 7] 1821 	ld	(bc),a
                           1822 ;src/main.c:367: if(!enemy->seek){
   6EC6 D5            [11] 1823 	push	de
   6EC7 FD E1         [14] 1824 	pop	iy
   6EC9 FD 7E 13      [19] 1825 	ld	a,19 (iy)
   6ECC B7            [ 4] 1826 	or	a, a
   6ECD C2 53 6F      [10] 1827 	jp	NZ,00111$
                           1828 ;src/main.c:368: if (dist <= 17) {// te detectan los sensores de proximidad
   6ED0 3E 11         [ 7] 1829 	ld	a,#0x11
   6ED2 DD 96 F9      [19] 1830 	sub	a, -7 (ix)
   6ED5 38 13         [12] 1831 	jr	C,00107$
                           1832 ;src/main.c:369: enemy->in_range = 1;
   6ED7 3E 01         [ 7] 1833 	ld	a,#0x01
   6ED9 02            [ 7] 1834 	ld	(bc),a
                           1835 ;src/main.c:370: enemy->engage = 1;
   6EDA 21 15 00      [10] 1836 	ld	hl,#0x0015
   6EDD 19            [11] 1837 	add	hl,de
   6EDE 36 01         [10] 1838 	ld	(hl),#0x01
                           1839 ;src/main.c:371: enemy->seen = SI;
   6EE0 DD 6E FE      [19] 1840 	ld	l,-2 (ix)
   6EE3 DD 66 FF      [19] 1841 	ld	h,-1 (ix)
   6EE6 36 01         [10] 1842 	ld	(hl),#0x01
   6EE8 18 69         [12] 1843 	jr	00111$
   6EEA                    1844 00107$:
                           1845 ;src/main.c:372: }else if(prota.x > enemy->x - 20 && prota.x < enemy->x + 20
   6EEA 21 56 64      [10] 1846 	ld	hl, #_prota + 0
   6EED 4E            [ 7] 1847 	ld	c,(hl)
   6EEE 1A            [ 7] 1848 	ld	a,(de)
   6EEF 5F            [ 4] 1849 	ld	e,a
   6EF0 16 00         [ 7] 1850 	ld	d,#0x00
   6EF2 7B            [ 4] 1851 	ld	a,e
   6EF3 C6 EC         [ 7] 1852 	add	a,#0xEC
   6EF5 6F            [ 4] 1853 	ld	l,a
   6EF6 7A            [ 4] 1854 	ld	a,d
   6EF7 CE FF         [ 7] 1855 	adc	a,#0xFF
   6EF9 67            [ 4] 1856 	ld	h,a
   6EFA 06 00         [ 7] 1857 	ld	b,#0x00
   6EFC 7D            [ 4] 1858 	ld	a,l
   6EFD 91            [ 4] 1859 	sub	a, c
   6EFE 7C            [ 4] 1860 	ld	a,h
   6EFF 98            [ 4] 1861 	sbc	a, b
   6F00 E2 05 6F      [10] 1862 	jp	PO, 00137$
   6F03 EE 80         [ 7] 1863 	xor	a, #0x80
   6F05                    1864 00137$:
   6F05 F2 53 6F      [10] 1865 	jp	P,00111$
   6F08 21 14 00      [10] 1866 	ld	hl,#0x0014
   6F0B 19            [11] 1867 	add	hl,de
   6F0C 79            [ 4] 1868 	ld	a,c
   6F0D 95            [ 4] 1869 	sub	a, l
   6F0E 78            [ 4] 1870 	ld	a,b
   6F0F 9C            [ 4] 1871 	sbc	a, h
   6F10 E2 15 6F      [10] 1872 	jp	PO, 00138$
   6F13 EE 80         [ 7] 1873 	xor	a, #0x80
   6F15                    1874 00138$:
   6F15 F2 53 6F      [10] 1875 	jp	P,00111$
                           1876 ;src/main.c:373: && prota.y > enemy->y - 20*2 && prota.y < enemy->y + 20*2){
   6F18 21 57 64      [10] 1877 	ld	hl, #(_prota + 0x0001) + 0
   6F1B 4E            [ 7] 1878 	ld	c,(hl)
   6F1C DD 6E FC      [19] 1879 	ld	l,-4 (ix)
   6F1F DD 66 FD      [19] 1880 	ld	h,-3 (ix)
   6F22 5E            [ 7] 1881 	ld	e,(hl)
   6F23 16 00         [ 7] 1882 	ld	d,#0x00
   6F25 7B            [ 4] 1883 	ld	a,e
   6F26 C6 D8         [ 7] 1884 	add	a,#0xD8
   6F28 6F            [ 4] 1885 	ld	l,a
   6F29 7A            [ 4] 1886 	ld	a,d
   6F2A CE FF         [ 7] 1887 	adc	a,#0xFF
   6F2C 67            [ 4] 1888 	ld	h,a
   6F2D 06 00         [ 7] 1889 	ld	b,#0x00
   6F2F 7D            [ 4] 1890 	ld	a,l
   6F30 91            [ 4] 1891 	sub	a, c
   6F31 7C            [ 4] 1892 	ld	a,h
   6F32 98            [ 4] 1893 	sbc	a, b
   6F33 E2 38 6F      [10] 1894 	jp	PO, 00139$
   6F36 EE 80         [ 7] 1895 	xor	a, #0x80
   6F38                    1896 00139$:
   6F38 F2 53 6F      [10] 1897 	jp	P,00111$
   6F3B 21 28 00      [10] 1898 	ld	hl,#0x0028
   6F3E 19            [11] 1899 	add	hl,de
   6F3F 79            [ 4] 1900 	ld	a,c
   6F40 95            [ 4] 1901 	sub	a, l
   6F41 78            [ 4] 1902 	ld	a,b
   6F42 9C            [ 4] 1903 	sbc	a, h
   6F43 E2 48 6F      [10] 1904 	jp	PO, 00140$
   6F46 EE 80         [ 7] 1905 	xor	a, #0x80
   6F48                    1906 00140$:
   6F48 F2 53 6F      [10] 1907 	jp	P,00111$
                           1908 ;src/main.c:374: enemy->seen = SI;
   6F4B DD 6E FE      [19] 1909 	ld	l,-2 (ix)
   6F4E DD 66 FF      [19] 1910 	ld	h,-1 (ix)
   6F51 36 01         [10] 1911 	ld	(hl),#0x01
   6F53                    1912 00111$:
   6F53 DD F9         [10] 1913 	ld	sp, ix
   6F55 DD E1         [14] 1914 	pop	ix
   6F57 C9            [10] 1915 	ret
                           1916 ;src/main.c:379: void moverEnemigoSeek(TEnemy* actual){
                           1917 ;	---------------------------------
                           1918 ; Function moverEnemigoSeek
                           1919 ; ---------------------------------
   6F58                    1920 _moverEnemigoSeek::
   6F58 DD E5         [15] 1921 	push	ix
   6F5A DD 21 00 00   [14] 1922 	ld	ix,#0
   6F5E DD 39         [15] 1923 	add	ix,sp
   6F60 21 F6 FF      [10] 1924 	ld	hl,#-10
   6F63 39            [11] 1925 	add	hl,sp
   6F64 F9            [ 6] 1926 	ld	sp,hl
                           1927 ;src/main.c:381: if(!actual->muerto){
   6F65 DD 4E 04      [19] 1928 	ld	c,4 (ix)
   6F68 DD 46 05      [19] 1929 	ld	b,5 (ix)
   6F6B C5            [11] 1930 	push	bc
   6F6C FD E1         [14] 1931 	pop	iy
   6F6E FD 7E 08      [19] 1932 	ld	a, 8 (iy)
   6F71 B7            [ 4] 1933 	or	a, a
   6F72 C2 F8 70      [10] 1934 	jp	NZ,00114$
                           1935 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6F75 21 0D 00      [10] 1936 	ld	hl,#0x000D
   6F78 09            [11] 1937 	add	hl,bc
   6F79 DD 75 F8      [19] 1938 	ld	-8 (ix),l
   6F7C DD 74 F9      [19] 1939 	ld	-7 (ix),h
   6F7F DD 6E F8      [19] 1940 	ld	l,-8 (ix)
   6F82 DD 66 F9      [19] 1941 	ld	h,-7 (ix)
   6F85 7E            [ 7] 1942 	ld	a,(hl)
   6F86 DD 77 F6      [19] 1943 	ld	-10 (ix),a
   6F89 23            [ 6] 1944 	inc	hl
   6F8A 7E            [ 7] 1945 	ld	a,(hl)
   6F8B DD 77 F7      [19] 1946 	ld	-9 (ix),a
   6F8E 69            [ 4] 1947 	ld	l, c
   6F8F 60            [ 4] 1948 	ld	h, b
   6F90 11 E2 00      [10] 1949 	ld	de, #0x00E2
   6F93 19            [11] 1950 	add	hl, de
   6F94 5E            [ 7] 1951 	ld	e,(hl)
   6F95 16 00         [ 7] 1952 	ld	d,#0x00
                           1953 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6F97 21 01 00      [10] 1954 	ld	hl,#0x0001
   6F9A 09            [11] 1955 	add	hl,bc
   6F9B DD 75 FE      [19] 1956 	ld	-2 (ix),l
   6F9E DD 74 FF      [19] 1957 	ld	-1 (ix),h
                           1958 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6FA1 DD 7E F6      [19] 1959 	ld	a,-10 (ix)
   6FA4 93            [ 4] 1960 	sub	a, e
   6FA5 DD 7E F7      [19] 1961 	ld	a,-9 (ix)
   6FA8 9A            [ 4] 1962 	sbc	a, d
   6FA9 E2 AE 6F      [10] 1963 	jp	PO, 00136$
   6FAC EE 80         [ 7] 1964 	xor	a, #0x80
   6FAE                    1965 00136$:
   6FAE F2 42 70      [10] 1966 	jp	P,00110$
                           1967 ;src/main.c:389: actual->mover = SI;
   6FB1 21 06 00      [10] 1968 	ld	hl,#0x0006
   6FB4 09            [11] 1969 	add	hl,bc
                           1970 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6FB5 79            [ 4] 1971 	ld	a,c
   6FB6 C6 1A         [ 7] 1972 	add	a, #0x1A
   6FB8 5F            [ 4] 1973 	ld	e,a
   6FB9 78            [ 4] 1974 	ld	a,b
   6FBA CE 00         [ 7] 1975 	adc	a, #0x00
   6FBC 57            [ 4] 1976 	ld	d,a
                           1977 ;src/main.c:387: if(actual->iter == 0){
   6FBD DD 7E F7      [19] 1978 	ld	a,-9 (ix)
   6FC0 DD B6 F6      [19] 1979 	or	a,-10 (ix)
   6FC3 20 44         [12] 1980 	jr	NZ,00102$
                           1981 ;src/main.c:389: actual->mover = SI;
   6FC5 36 01         [10] 1982 	ld	(hl),#0x01
                           1983 ;src/main.c:390: actual->iter = 2;
   6FC7 DD 6E F8      [19] 1984 	ld	l,-8 (ix)
   6FCA DD 66 F9      [19] 1985 	ld	h,-7 (ix)
   6FCD 36 02         [10] 1986 	ld	(hl),#0x02
   6FCF 23            [ 6] 1987 	inc	hl
   6FD0 36 00         [10] 1988 	ld	(hl),#0x00
                           1989 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6FD2 DD 6E F8      [19] 1990 	ld	l,-8 (ix)
   6FD5 DD 66 F9      [19] 1991 	ld	h,-7 (ix)
   6FD8 7E            [ 7] 1992 	ld	a, (hl)
   6FD9 23            [ 6] 1993 	inc	hl
   6FDA 66            [ 7] 1994 	ld	h,(hl)
   6FDB 6F            [ 4] 1995 	ld	l,a
   6FDC 19            [11] 1996 	add	hl,de
   6FDD 7E            [ 7] 1997 	ld	a,(hl)
   6FDE 02            [ 7] 1998 	ld	(bc),a
                           1999 ;src/main.c:392: ++actual->iter;
   6FDF DD 6E F8      [19] 2000 	ld	l,-8 (ix)
   6FE2 DD 66 F9      [19] 2001 	ld	h,-7 (ix)
   6FE5 4E            [ 7] 2002 	ld	c,(hl)
   6FE6 23            [ 6] 2003 	inc	hl
   6FE7 46            [ 7] 2004 	ld	b,(hl)
   6FE8 03            [ 6] 2005 	inc	bc
   6FE9 DD 6E F8      [19] 2006 	ld	l,-8 (ix)
   6FEC DD 66 F9      [19] 2007 	ld	h,-7 (ix)
   6FEF 71            [ 7] 2008 	ld	(hl),c
   6FF0 23            [ 6] 2009 	inc	hl
   6FF1 70            [ 7] 2010 	ld	(hl),b
                           2011 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6FF2 EB            [ 4] 2012 	ex	de,hl
   6FF3 09            [11] 2013 	add	hl,bc
   6FF4 5E            [ 7] 2014 	ld	e,(hl)
   6FF5 DD 6E FE      [19] 2015 	ld	l,-2 (ix)
   6FF8 DD 66 FF      [19] 2016 	ld	h,-1 (ix)
   6FFB 73            [ 7] 2017 	ld	(hl),e
                           2018 ;src/main.c:394: ++actual->iter;
   6FFC 03            [ 6] 2019 	inc	bc
   6FFD DD 6E F8      [19] 2020 	ld	l,-8 (ix)
   7000 DD 66 F9      [19] 2021 	ld	h,-7 (ix)
   7003 71            [ 7] 2022 	ld	(hl),c
   7004 23            [ 6] 2023 	inc	hl
   7005 70            [ 7] 2024 	ld	(hl),b
   7006 C3 F8 70      [10] 2025 	jp	00114$
   7009                    2026 00102$:
                           2027 ;src/main.c:397: actual->mover = SI;
   7009 36 01         [10] 2028 	ld	(hl),#0x01
                           2029 ;src/main.c:398: actual->x = actual->camino[actual->iter];
   700B DD 6E F8      [19] 2030 	ld	l,-8 (ix)
   700E DD 66 F9      [19] 2031 	ld	h,-7 (ix)
   7011 7E            [ 7] 2032 	ld	a, (hl)
   7012 23            [ 6] 2033 	inc	hl
   7013 66            [ 7] 2034 	ld	h,(hl)
   7014 6F            [ 4] 2035 	ld	l,a
   7015 19            [11] 2036 	add	hl,de
   7016 7E            [ 7] 2037 	ld	a,(hl)
   7017 02            [ 7] 2038 	ld	(bc),a
                           2039 ;src/main.c:399: ++actual->iter;
   7018 DD 6E F8      [19] 2040 	ld	l,-8 (ix)
   701B DD 66 F9      [19] 2041 	ld	h,-7 (ix)
   701E 4E            [ 7] 2042 	ld	c,(hl)
   701F 23            [ 6] 2043 	inc	hl
   7020 46            [ 7] 2044 	ld	b,(hl)
   7021 03            [ 6] 2045 	inc	bc
   7022 DD 6E F8      [19] 2046 	ld	l,-8 (ix)
   7025 DD 66 F9      [19] 2047 	ld	h,-7 (ix)
   7028 71            [ 7] 2048 	ld	(hl),c
   7029 23            [ 6] 2049 	inc	hl
   702A 70            [ 7] 2050 	ld	(hl),b
                           2051 ;src/main.c:400: actual->y = actual->camino[actual->iter];
   702B EB            [ 4] 2052 	ex	de,hl
   702C 09            [11] 2053 	add	hl,bc
   702D 5E            [ 7] 2054 	ld	e,(hl)
   702E DD 6E FE      [19] 2055 	ld	l,-2 (ix)
   7031 DD 66 FF      [19] 2056 	ld	h,-1 (ix)
   7034 73            [ 7] 2057 	ld	(hl),e
                           2058 ;src/main.c:401: ++actual->iter;
   7035 03            [ 6] 2059 	inc	bc
   7036 DD 6E F8      [19] 2060 	ld	l,-8 (ix)
   7039 DD 66 F9      [19] 2061 	ld	h,-7 (ix)
   703C 71            [ 7] 2062 	ld	(hl),c
   703D 23            [ 6] 2063 	inc	hl
   703E 70            [ 7] 2064 	ld	(hl),b
   703F C3 F8 70      [10] 2065 	jp	00114$
   7042                    2066 00110$:
                           2067 ;src/main.c:407: actual->seek = 0;
   7042 21 13 00      [10] 2068 	ld	hl,#0x0013
   7045 09            [11] 2069 	add	hl,bc
   7046 E3            [19] 2070 	ex	(sp), hl
   7047 E1            [10] 2071 	pop	hl
   7048 E5            [11] 2072 	push	hl
   7049 36 00         [10] 2073 	ld	(hl),#0x00
                           2074 ;src/main.c:408: lookFor(actual);
   704B C5            [11] 2075 	push	bc
   704C C5            [11] 2076 	push	bc
   704D CD 4F 6E      [17] 2077 	call	_lookFor
   7050 F1            [10] 2078 	pop	af
   7051 C1            [10] 2079 	pop	bc
                           2080 ;src/main.c:409: if(!actual->seen){
   7052 69            [ 4] 2081 	ld	l, c
   7053 60            [ 4] 2082 	ld	h, b
   7054 11 11 00      [10] 2083 	ld	de, #0x0011
   7057 19            [11] 2084 	add	hl, de
   7058 7E            [ 7] 2085 	ld	a,(hl)
   7059 DD 77 FD      [19] 2086 	ld	-3 (ix),a
                           2087 ;src/main.c:410: actual->patrolling = 1;
   705C 21 0A 00      [10] 2088 	ld	hl,#0x000A
   705F 09            [11] 2089 	add	hl,bc
   7060 DD 75 FB      [19] 2090 	ld	-5 (ix),l
   7063 DD 74 FC      [19] 2091 	ld	-4 (ix),h
                           2092 ;src/main.c:409: if(!actual->seen){
   7066 DD 7E FD      [19] 2093 	ld	a,-3 (ix)
   7069 B7            [ 4] 2094 	or	a, a
   706A 20 3C         [12] 2095 	jr	NZ,00107$
                           2096 ;src/main.c:410: actual->patrolling = 1;
   706C DD 6E FB      [19] 2097 	ld	l,-5 (ix)
   706F DD 66 FC      [19] 2098 	ld	h,-4 (ix)
   7072 36 01         [10] 2099 	ld	(hl),#0x01
                           2100 ;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7074 C5            [11] 2101 	push	bc
   7075 FD E1         [14] 2102 	pop	iy
   7077 FD 7E 18      [19] 2103 	ld	a,24 (iy)
   707A DD 77 FD      [19] 2104 	ld	-3 (ix),a
   707D C5            [11] 2105 	push	bc
   707E FD E1         [14] 2106 	pop	iy
   7080 FD 56 17      [19] 2107 	ld	d,23 (iy)
   7083 DD 6E FE      [19] 2108 	ld	l,-2 (ix)
   7086 DD 66 FF      [19] 2109 	ld	h,-1 (ix)
   7089 5E            [ 7] 2110 	ld	e,(hl)
   708A 0A            [ 7] 2111 	ld	a,(bc)
   708B DD 77 FA      [19] 2112 	ld	-6 (ix),a
   708E 2A 38 65      [16] 2113 	ld	hl,(_mapa)
   7091 E5            [11] 2114 	push	hl
   7092 C5            [11] 2115 	push	bc
   7093 DD 7E FD      [19] 2116 	ld	a,-3 (ix)
   7096 F5            [11] 2117 	push	af
   7097 33            [ 6] 2118 	inc	sp
   7098 D5            [11] 2119 	push	de
   7099 DD 7E FA      [19] 2120 	ld	a,-6 (ix)
   709C F5            [11] 2121 	push	af
   709D 33            [ 6] 2122 	inc	sp
   709E CD 30 44      [17] 2123 	call	_pathFinding
   70A1 21 08 00      [10] 2124 	ld	hl,#8
   70A4 39            [11] 2125 	add	hl,sp
   70A5 F9            [ 6] 2126 	ld	sp,hl
   70A6 18 46         [12] 2127 	jr	00108$
   70A8                    2128 00107$:
                           2129 ;src/main.c:413: actual->patrolling = 0;
   70A8 DD 6E FB      [19] 2130 	ld	l,-5 (ix)
   70AB DD 66 FC      [19] 2131 	ld	h,-4 (ix)
   70AE 36 00         [10] 2132 	ld	(hl),#0x00
                           2133 ;src/main.c:414: if(!actual->engage){
   70B0 C5            [11] 2134 	push	bc
   70B1 FD E1         [14] 2135 	pop	iy
   70B3 FD 7E 15      [19] 2136 	ld	a,21 (iy)
   70B6 B7            [ 4] 2137 	or	a, a
   70B7 20 35         [12] 2138 	jr	NZ,00108$
                           2139 ;src/main.c:415: actual->seek = 1;
   70B9 E1            [10] 2140 	pop	hl
   70BA E5            [11] 2141 	push	hl
   70BB 36 01         [10] 2142 	ld	(hl),#0x01
                           2143 ;src/main.c:416: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   70BD 3A 57 64      [13] 2144 	ld	a,(#_prota + 1)
   70C0 DD 77 FA      [19] 2145 	ld	-6 (ix),a
   70C3 21 56 64      [10] 2146 	ld	hl, #_prota + 0
   70C6 5E            [ 7] 2147 	ld	e,(hl)
   70C7 DD 6E FE      [19] 2148 	ld	l,-2 (ix)
   70CA DD 66 FF      [19] 2149 	ld	h,-1 (ix)
   70CD 56            [ 7] 2150 	ld	d,(hl)
   70CE 0A            [ 7] 2151 	ld	a,(bc)
   70CF DD 77 FB      [19] 2152 	ld	-5 (ix),a
   70D2 2A 38 65      [16] 2153 	ld	hl,(_mapa)
   70D5 E5            [11] 2154 	push	hl
   70D6 C5            [11] 2155 	push	bc
   70D7 DD 7E FA      [19] 2156 	ld	a,-6 (ix)
   70DA F5            [11] 2157 	push	af
   70DB 33            [ 6] 2158 	inc	sp
   70DC 7B            [ 4] 2159 	ld	a,e
   70DD F5            [11] 2160 	push	af
   70DE 33            [ 6] 2161 	inc	sp
   70DF D5            [11] 2162 	push	de
   70E0 33            [ 6] 2163 	inc	sp
   70E1 DD 7E FB      [19] 2164 	ld	a,-5 (ix)
   70E4 F5            [11] 2165 	push	af
   70E5 33            [ 6] 2166 	inc	sp
   70E6 CD 30 44      [17] 2167 	call	_pathFinding
   70E9 21 08 00      [10] 2168 	ld	hl,#8
   70EC 39            [11] 2169 	add	hl,sp
   70ED F9            [ 6] 2170 	ld	sp,hl
   70EE                    2171 00108$:
                           2172 ;src/main.c:419: actual->iter = 0;
   70EE DD 6E F8      [19] 2173 	ld	l,-8 (ix)
   70F1 DD 66 F9      [19] 2174 	ld	h,-7 (ix)
   70F4 AF            [ 4] 2175 	xor	a, a
   70F5 77            [ 7] 2176 	ld	(hl), a
   70F6 23            [ 6] 2177 	inc	hl
   70F7 77            [ 7] 2178 	ld	(hl), a
   70F8                    2179 00114$:
   70F8 DD F9         [10] 2180 	ld	sp, ix
   70FA DD E1         [14] 2181 	pop	ix
   70FC C9            [10] 2182 	ret
                           2183 ;src/main.c:425: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2184 ;	---------------------------------
                           2185 ; Function engage
                           2186 ; ---------------------------------
   70FD                    2187 _engage::
   70FD DD E5         [15] 2188 	push	ix
   70FF DD 21 00 00   [14] 2189 	ld	ix,#0
   7103 DD 39         [15] 2190 	add	ix,sp
   7105 21 F0 FF      [10] 2191 	ld	hl,#-16
   7108 39            [11] 2192 	add	hl,sp
   7109 F9            [ 6] 2193 	ld	sp,hl
                           2194 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   710A DD 7E 04      [19] 2195 	ld	a,4 (ix)
   710D DD 77 F4      [19] 2196 	ld	-12 (ix),a
   7110 DD 7E 05      [19] 2197 	ld	a,5 (ix)
   7113 DD 77 F5      [19] 2198 	ld	-11 (ix),a
   7116 DD 6E F4      [19] 2199 	ld	l,-12 (ix)
   7119 DD 66 F5      [19] 2200 	ld	h,-11 (ix)
   711C 4E            [ 7] 2201 	ld	c,(hl)
   711D 06 00         [ 7] 2202 	ld	b,#0x00
   711F 21 56 64      [10] 2203 	ld	hl,#_prota+0
   7122 5E            [ 7] 2204 	ld	e,(hl)
   7123 16 00         [ 7] 2205 	ld	d,#0x00
   7125 79            [ 4] 2206 	ld	a,c
   7126 93            [ 4] 2207 	sub	a, e
   7127 4F            [ 4] 2208 	ld	c,a
   7128 78            [ 4] 2209 	ld	a,b
   7129 9A            [ 4] 2210 	sbc	a, d
   712A 47            [ 4] 2211 	ld	b,a
   712B C5            [11] 2212 	push	bc
   712C CD A5 4B      [17] 2213 	call	_abs
   712F F1            [10] 2214 	pop	af
   7130 4D            [ 4] 2215 	ld	c,l
                           2216 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   7131 DD 7E F4      [19] 2217 	ld	a,-12 (ix)
   7134 C6 01         [ 7] 2218 	add	a, #0x01
   7136 DD 77 F6      [19] 2219 	ld	-10 (ix),a
   7139 DD 7E F5      [19] 2220 	ld	a,-11 (ix)
   713C CE 00         [ 7] 2221 	adc	a, #0x00
   713E DD 77 F7      [19] 2222 	ld	-9 (ix),a
   7141 DD 6E F6      [19] 2223 	ld	l,-10 (ix)
   7144 DD 66 F7      [19] 2224 	ld	h,-9 (ix)
   7147 5E            [ 7] 2225 	ld	e,(hl)
   7148 16 00         [ 7] 2226 	ld	d,#0x00
   714A 21 57 64      [10] 2227 	ld	hl, #_prota + 1
   714D 6E            [ 7] 2228 	ld	l,(hl)
   714E 26 00         [ 7] 2229 	ld	h,#0x00
   7150 7B            [ 4] 2230 	ld	a,e
   7151 95            [ 4] 2231 	sub	a, l
   7152 5F            [ 4] 2232 	ld	e,a
   7153 7A            [ 4] 2233 	ld	a,d
   7154 9C            [ 4] 2234 	sbc	a, h
   7155 57            [ 4] 2235 	ld	d,a
   7156 C5            [11] 2236 	push	bc
   7157 D5            [11] 2237 	push	de
   7158 CD A5 4B      [17] 2238 	call	_abs
   715B F1            [10] 2239 	pop	af
   715C C1            [10] 2240 	pop	bc
                           2241 ;src/main.c:428: u8 dist = difx + dify; // manhattan
   715D 09            [11] 2242 	add	hl, bc
   715E DD 75 F3      [19] 2243 	ld	-13 (ix),l
                           2244 ;src/main.c:430: u8 movX = 0;
   7161 DD 36 F2 00   [19] 2245 	ld	-14 (ix),#0x00
                           2246 ;src/main.c:431: u8 movY = 0;
   7165 DD 36 F1 00   [19] 2247 	ld	-15 (ix),#0x00
                           2248 ;src/main.c:432: u8 distConstraint = 25;
   7169 DD 36 F0 19   [19] 2249 	ld	-16 (ix),#0x19
                           2250 ;src/main.c:433: enemy->mover = NO;
   716D DD 7E F4      [19] 2251 	ld	a,-12 (ix)
   7170 C6 06         [ 7] 2252 	add	a, #0x06
   7172 DD 77 F8      [19] 2253 	ld	-8 (ix),a
   7175 DD 7E F5      [19] 2254 	ld	a,-11 (ix)
   7178 CE 00         [ 7] 2255 	adc	a, #0x00
   717A DD 77 F9      [19] 2256 	ld	-7 (ix),a
   717D DD 6E F8      [19] 2257 	ld	l,-8 (ix)
   7180 DD 66 F9      [19] 2258 	ld	h,-7 (ix)
   7183 36 00         [10] 2259 	ld	(hl),#0x00
                           2260 ;src/main.c:443: enemy->didDamage = 1;
   7185 DD 7E F4      [19] 2261 	ld	a,-12 (ix)
   7188 C6 16         [ 7] 2262 	add	a, #0x16
   718A 4F            [ 4] 2263 	ld	c,a
   718B DD 7E F5      [19] 2264 	ld	a,-11 (ix)
   718E CE 00         [ 7] 2265 	adc	a, #0x00
   7190 47            [ 4] 2266 	ld	b,a
                           2267 ;src/main.c:435: if (dist < 20) {
   7191 DD 7E F3      [19] 2268 	ld	a,-13 (ix)
   7194 D6 14         [ 7] 2269 	sub	a, #0x14
   7196 30 3B         [12] 2270 	jr	NC,00107$
                           2271 ;src/main.c:436: vidas--;
   7198 21 6D 64      [10] 2272 	ld	hl, #_vidas+0
   719B 35            [11] 2273 	dec	(hl)
                           2274 ;src/main.c:437: if(vidas % 20 == 0){
   719C C5            [11] 2275 	push	bc
   719D 3E 14         [ 7] 2276 	ld	a,#0x14
   719F F5            [11] 2277 	push	af
   71A0 33            [ 6] 2278 	inc	sp
   71A1 3A 6D 64      [13] 2279 	ld	a,(_vidas)
   71A4 F5            [11] 2280 	push	af
   71A5 33            [ 6] 2281 	inc	sp
   71A6 CD 71 56      [17] 2282 	call	__moduchar
   71A9 F1            [10] 2283 	pop	af
   71AA C1            [10] 2284 	pop	bc
   71AB 7D            [ 4] 2285 	ld	a,l
   71AC B7            [ 4] 2286 	or	a, a
   71AD 20 21         [12] 2287 	jr	NZ,00105$
                           2288 ;src/main.c:438: if (vidas == 0) {
   71AF 3A 6D 64      [13] 2289 	ld	a,(#_vidas + 0)
   71B2 B7            [ 4] 2290 	or	a, a
   71B3 20 10         [12] 2291 	jr	NZ,00102$
                           2292 ;src/main.c:439: menuFin(puntuacion);
   71B5 FD 21 3B 65   [14] 2293 	ld	iy,#_puntuacion
   71B9 FD 6E 00      [19] 2294 	ld	l,0 (iy)
   71BC 26 00         [ 7] 2295 	ld	h,#0x00
   71BE C5            [11] 2296 	push	bc
   71BF CD E5 4B      [17] 2297 	call	_menuFin
   71C2 C1            [10] 2298 	pop	bc
   71C3 18 0B         [12] 2299 	jr	00105$
   71C5                    2300 00102$:
                           2301 ;src/main.c:441: modificarVidas(vidas);
   71C5 C5            [11] 2302 	push	bc
   71C6 3A 6D 64      [13] 2303 	ld	a,(_vidas)
   71C9 F5            [11] 2304 	push	af
   71CA 33            [ 6] 2305 	inc	sp
   71CB CD 28 53      [17] 2306 	call	_modificarVidas
   71CE 33            [ 6] 2307 	inc	sp
   71CF C1            [10] 2308 	pop	bc
   71D0                    2309 00105$:
                           2310 ;src/main.c:443: enemy->didDamage = 1;
   71D0 3E 01         [ 7] 2311 	ld	a,#0x01
   71D2 02            [ 7] 2312 	ld	(bc),a
   71D3                    2313 00107$:
                           2314 ;src/main.c:445: if (!enemy->didDamage) {
   71D3 0A            [ 7] 2315 	ld	a,(bc)
   71D4 B7            [ 4] 2316 	or	a, a
   71D5 C2 0B 79      [10] 2317 	jp	NZ,00208$
                           2318 ;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   71D8 DD 6E F6      [19] 2319 	ld	l,-10 (ix)
   71DB DD 66 F7      [19] 2320 	ld	h,-9 (ix)
   71DE 4E            [ 7] 2321 	ld	c,(hl)
                           2322 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71DF DD 6E F4      [19] 2323 	ld	l,-12 (ix)
   71E2 DD 66 F5      [19] 2324 	ld	h,-11 (ix)
   71E5 7E            [ 7] 2325 	ld	a,(hl)
                           2326 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   71E6 DD 77 FA      [19] 2327 	ld	-6 (ix), a
   71E9 C6 04         [ 7] 2328 	add	a, #0x04
   71EB DD 77 FB      [19] 2329 	ld	-5 (ix),a
                           2330 ;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   71EE DD 7E 07      [19] 2331 	ld	a,7 (ix)
   71F1 91            [ 4] 2332 	sub	a, c
   71F2 28 35         [12] 2333 	jr	Z,00201$
   71F4 DD 5E 07      [19] 2334 	ld	e,7 (ix)
   71F7 16 00         [ 7] 2335 	ld	d,#0x00
   71F9 21 01 00      [10] 2336 	ld	hl,#0x0001
   71FC 19            [11] 2337 	add	hl,de
   71FD DD 75 FC      [19] 2338 	ld	-4 (ix),l
   7200 DD 74 FD      [19] 2339 	ld	-3 (ix),h
   7203 DD 71 FE      [19] 2340 	ld	-2 (ix),c
   7206 DD 36 FF 00   [19] 2341 	ld	-1 (ix),#0x00
   720A DD 7E FC      [19] 2342 	ld	a,-4 (ix)
   720D DD 96 FE      [19] 2343 	sub	a, -2 (ix)
   7210 20 08         [12] 2344 	jr	NZ,00447$
   7212 DD 7E FD      [19] 2345 	ld	a,-3 (ix)
   7215 DD 96 FF      [19] 2346 	sub	a, -1 (ix)
   7218 28 0F         [12] 2347 	jr	Z,00201$
   721A                    2348 00447$:
   721A 1B            [ 6] 2349 	dec	de
   721B DD 7E FE      [19] 2350 	ld	a,-2 (ix)
   721E 93            [ 4] 2351 	sub	a, e
   721F C2 36 73      [10] 2352 	jp	NZ,00202$
   7222 DD 7E FF      [19] 2353 	ld	a,-1 (ix)
   7225 92            [ 4] 2354 	sub	a, d
   7226 C2 36 73      [10] 2355 	jp	NZ,00202$
   7229                    2356 00201$:
                           2357 ;src/main.c:447: if (dx < enemy->x) { // izquierda
   7229 DD 7E 06      [19] 2358 	ld	a,6 (ix)
   722C DD 96 FA      [19] 2359 	sub	a, -6 (ix)
   722F D2 B2 72      [10] 2360 	jp	NC,00121$
                           2361 ;src/main.c:448: if (dist > 11) {
   7232 3E 0B         [ 7] 2362 	ld	a,#0x0B
   7234 DD 96 F3      [19] 2363 	sub	a, -13 (ix)
   7237 D2 0B 79      [10] 2364 	jp	NC,00208$
                           2365 ;src/main.c:449: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   723A 79            [ 4] 2366 	ld	a,c
   723B F5            [11] 2367 	push	af
   723C 33            [ 6] 2368 	inc	sp
   723D DD 7E FA      [19] 2369 	ld	a,-6 (ix)
   7240 F5            [11] 2370 	push	af
   7241 33            [ 6] 2371 	inc	sp
   7242 2A 38 65      [16] 2372 	ld	hl,(_mapa)
   7245 E5            [11] 2373 	push	hl
   7246 CD 61 4B      [17] 2374 	call	_getTilePtr
   7249 F1            [10] 2375 	pop	af
   724A F1            [10] 2376 	pop	af
   724B 4E            [ 7] 2377 	ld	c,(hl)
   724C 3E 02         [ 7] 2378 	ld	a,#0x02
   724E 91            [ 4] 2379 	sub	a, c
   724F DA 0B 79      [10] 2380 	jp	C,00208$
                           2381 ;src/main.c:450: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7252 DD 6E F6      [19] 2382 	ld	l,-10 (ix)
   7255 DD 66 F7      [19] 2383 	ld	h,-9 (ix)
   7258 7E            [ 7] 2384 	ld	a,(hl)
   7259 C6 0B         [ 7] 2385 	add	a, #0x0B
   725B 57            [ 4] 2386 	ld	d,a
   725C DD 6E F4      [19] 2387 	ld	l,-12 (ix)
   725F DD 66 F5      [19] 2388 	ld	h,-11 (ix)
   7262 46            [ 7] 2389 	ld	b,(hl)
   7263 D5            [11] 2390 	push	de
   7264 33            [ 6] 2391 	inc	sp
   7265 C5            [11] 2392 	push	bc
   7266 33            [ 6] 2393 	inc	sp
   7267 2A 38 65      [16] 2394 	ld	hl,(_mapa)
   726A E5            [11] 2395 	push	hl
   726B CD 61 4B      [17] 2396 	call	_getTilePtr
   726E F1            [10] 2397 	pop	af
   726F F1            [10] 2398 	pop	af
   7270 4E            [ 7] 2399 	ld	c,(hl)
   7271 3E 02         [ 7] 2400 	ld	a,#0x02
   7273 91            [ 4] 2401 	sub	a, c
   7274 DA 0B 79      [10] 2402 	jp	C,00208$
                           2403 ;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7277 DD 6E F6      [19] 2404 	ld	l,-10 (ix)
   727A DD 66 F7      [19] 2405 	ld	h,-9 (ix)
   727D 7E            [ 7] 2406 	ld	a,(hl)
   727E C6 16         [ 7] 2407 	add	a, #0x16
   7280 57            [ 4] 2408 	ld	d,a
   7281 DD 6E F4      [19] 2409 	ld	l,-12 (ix)
   7284 DD 66 F5      [19] 2410 	ld	h,-11 (ix)
   7287 46            [ 7] 2411 	ld	b,(hl)
   7288 D5            [11] 2412 	push	de
   7289 33            [ 6] 2413 	inc	sp
   728A C5            [11] 2414 	push	bc
   728B 33            [ 6] 2415 	inc	sp
   728C 2A 38 65      [16] 2416 	ld	hl,(_mapa)
   728F E5            [11] 2417 	push	hl
   7290 CD 61 4B      [17] 2418 	call	_getTilePtr
   7293 F1            [10] 2419 	pop	af
   7294 F1            [10] 2420 	pop	af
   7295 4E            [ 7] 2421 	ld	c,(hl)
   7296 3E 02         [ 7] 2422 	ld	a,#0x02
   7298 91            [ 4] 2423 	sub	a, c
   7299 DA 0B 79      [10] 2424 	jp	C,00208$
                           2425 ;src/main.c:452: moverEnemigoIzquierda(enemy);
   729C DD 6E F4      [19] 2426 	ld	l,-12 (ix)
   729F DD 66 F5      [19] 2427 	ld	h,-11 (ix)
   72A2 E5            [11] 2428 	push	hl
   72A3 CD DF 6B      [17] 2429 	call	_moverEnemigoIzquierda
   72A6 F1            [10] 2430 	pop	af
                           2431 ;src/main.c:454: enemy->mover = SI;
   72A7 DD 6E F8      [19] 2432 	ld	l,-8 (ix)
   72AA DD 66 F9      [19] 2433 	ld	h,-7 (ix)
   72AD 36 01         [10] 2434 	ld	(hl),#0x01
   72AF C3 0B 79      [10] 2435 	jp	00208$
   72B2                    2436 00121$:
                           2437 ;src/main.c:458: if (dist > G_ENEMY_W + 3) {
   72B2 3E 07         [ 7] 2438 	ld	a,#0x07
   72B4 DD 96 F3      [19] 2439 	sub	a, -13 (ix)
   72B7 D2 0B 79      [10] 2440 	jp	NC,00208$
                           2441 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   72BA 79            [ 4] 2442 	ld	a,c
   72BB F5            [11] 2443 	push	af
   72BC 33            [ 6] 2444 	inc	sp
   72BD DD 7E FB      [19] 2445 	ld	a,-5 (ix)
   72C0 F5            [11] 2446 	push	af
   72C1 33            [ 6] 2447 	inc	sp
   72C2 2A 38 65      [16] 2448 	ld	hl,(_mapa)
   72C5 E5            [11] 2449 	push	hl
   72C6 CD 61 4B      [17] 2450 	call	_getTilePtr
   72C9 F1            [10] 2451 	pop	af
   72CA F1            [10] 2452 	pop	af
   72CB 4E            [ 7] 2453 	ld	c,(hl)
   72CC 3E 02         [ 7] 2454 	ld	a,#0x02
   72CE 91            [ 4] 2455 	sub	a, c
   72CF DA 0B 79      [10] 2456 	jp	C,00208$
                           2457 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   72D2 DD 6E F6      [19] 2458 	ld	l,-10 (ix)
   72D5 DD 66 F7      [19] 2459 	ld	h,-9 (ix)
   72D8 7E            [ 7] 2460 	ld	a,(hl)
   72D9 C6 0B         [ 7] 2461 	add	a, #0x0B
   72DB 47            [ 4] 2462 	ld	b,a
   72DC DD 6E F4      [19] 2463 	ld	l,-12 (ix)
   72DF DD 66 F5      [19] 2464 	ld	h,-11 (ix)
   72E2 7E            [ 7] 2465 	ld	a,(hl)
   72E3 C6 04         [ 7] 2466 	add	a, #0x04
   72E5 C5            [11] 2467 	push	bc
   72E6 33            [ 6] 2468 	inc	sp
   72E7 F5            [11] 2469 	push	af
   72E8 33            [ 6] 2470 	inc	sp
   72E9 2A 38 65      [16] 2471 	ld	hl,(_mapa)
   72EC E5            [11] 2472 	push	hl
   72ED CD 61 4B      [17] 2473 	call	_getTilePtr
   72F0 F1            [10] 2474 	pop	af
   72F1 F1            [10] 2475 	pop	af
   72F2 4E            [ 7] 2476 	ld	c,(hl)
   72F3 3E 02         [ 7] 2477 	ld	a,#0x02
   72F5 91            [ 4] 2478 	sub	a, c
   72F6 DA 0B 79      [10] 2479 	jp	C,00208$
                           2480 ;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   72F9 DD 6E F6      [19] 2481 	ld	l,-10 (ix)
   72FC DD 66 F7      [19] 2482 	ld	h,-9 (ix)
   72FF 7E            [ 7] 2483 	ld	a,(hl)
   7300 C6 16         [ 7] 2484 	add	a, #0x16
   7302 47            [ 4] 2485 	ld	b,a
   7303 DD 6E F4      [19] 2486 	ld	l,-12 (ix)
   7306 DD 66 F5      [19] 2487 	ld	h,-11 (ix)
   7309 7E            [ 7] 2488 	ld	a,(hl)
   730A C6 04         [ 7] 2489 	add	a, #0x04
   730C C5            [11] 2490 	push	bc
   730D 33            [ 6] 2491 	inc	sp
   730E F5            [11] 2492 	push	af
   730F 33            [ 6] 2493 	inc	sp
   7310 2A 38 65      [16] 2494 	ld	hl,(_mapa)
   7313 E5            [11] 2495 	push	hl
   7314 CD 61 4B      [17] 2496 	call	_getTilePtr
   7317 F1            [10] 2497 	pop	af
   7318 F1            [10] 2498 	pop	af
   7319 4E            [ 7] 2499 	ld	c,(hl)
   731A 3E 02         [ 7] 2500 	ld	a,#0x02
   731C 91            [ 4] 2501 	sub	a, c
   731D DA 0B 79      [10] 2502 	jp	C,00208$
                           2503 ;src/main.c:462: moverEnemigoDerecha(enemy);
   7320 DD 6E F4      [19] 2504 	ld	l,-12 (ix)
   7323 DD 66 F5      [19] 2505 	ld	h,-11 (ix)
   7326 E5            [11] 2506 	push	hl
   7327 CD CF 6B      [17] 2507 	call	_moverEnemigoDerecha
   732A F1            [10] 2508 	pop	af
                           2509 ;src/main.c:464: enemy->mover = SI;
   732B DD 6E F8      [19] 2510 	ld	l,-8 (ix)
   732E DD 66 F9      [19] 2511 	ld	h,-7 (ix)
   7331 36 01         [10] 2512 	ld	(hl),#0x01
   7333 C3 0B 79      [10] 2513 	jp	00208$
   7336                    2514 00202$:
                           2515 ;src/main.c:469: else if (enemy->x == dx) {
   7336 DD 7E FA      [19] 2516 	ld	a,-6 (ix)
   7339 DD 96 06      [19] 2517 	sub	a, 6 (ix)
   733C C2 51 74      [10] 2518 	jp	NZ,00199$
                           2519 ;src/main.c:470: if (dy < enemy->y) {
   733F DD 7E 07      [19] 2520 	ld	a,7 (ix)
   7342 91            [ 4] 2521 	sub	a, c
   7343 D2 CA 73      [10] 2522 	jp	NC,00136$
                           2523 ;src/main.c:471: if (dist > G_HERO_H + 5) {
   7346 3E 1B         [ 7] 2524 	ld	a,#0x1B
   7348 DD 96 F3      [19] 2525 	sub	a, -13 (ix)
   734B D2 0B 79      [10] 2526 	jp	NC,00208$
                           2527 ;src/main.c:472: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   734E 41            [ 4] 2528 	ld	b,c
   734F 05            [ 4] 2529 	dec	b
   7350 05            [ 4] 2530 	dec	b
   7351 C5            [11] 2531 	push	bc
   7352 33            [ 6] 2532 	inc	sp
   7353 DD 7E FA      [19] 2533 	ld	a,-6 (ix)
   7356 F5            [11] 2534 	push	af
   7357 33            [ 6] 2535 	inc	sp
   7358 2A 38 65      [16] 2536 	ld	hl,(_mapa)
   735B E5            [11] 2537 	push	hl
   735C CD 61 4B      [17] 2538 	call	_getTilePtr
   735F F1            [10] 2539 	pop	af
   7360 F1            [10] 2540 	pop	af
   7361 4E            [ 7] 2541 	ld	c,(hl)
   7362 3E 02         [ 7] 2542 	ld	a,#0x02
   7364 91            [ 4] 2543 	sub	a, c
   7365 DA 0B 79      [10] 2544 	jp	C,00208$
                           2545 ;src/main.c:473: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7368 DD 6E F6      [19] 2546 	ld	l,-10 (ix)
   736B DD 66 F7      [19] 2547 	ld	h,-9 (ix)
   736E 56            [ 7] 2548 	ld	d,(hl)
   736F 15            [ 4] 2549 	dec	d
   7370 15            [ 4] 2550 	dec	d
   7371 DD 6E F4      [19] 2551 	ld	l,-12 (ix)
   7374 DD 66 F5      [19] 2552 	ld	h,-11 (ix)
   7377 46            [ 7] 2553 	ld	b,(hl)
   7378 04            [ 4] 2554 	inc	b
   7379 04            [ 4] 2555 	inc	b
   737A D5            [11] 2556 	push	de
   737B 33            [ 6] 2557 	inc	sp
   737C C5            [11] 2558 	push	bc
   737D 33            [ 6] 2559 	inc	sp
   737E 2A 38 65      [16] 2560 	ld	hl,(_mapa)
   7381 E5            [11] 2561 	push	hl
   7382 CD 61 4B      [17] 2562 	call	_getTilePtr
   7385 F1            [10] 2563 	pop	af
   7386 F1            [10] 2564 	pop	af
   7387 4E            [ 7] 2565 	ld	c,(hl)
   7388 3E 02         [ 7] 2566 	ld	a,#0x02
   738A 91            [ 4] 2567 	sub	a, c
   738B DA 0B 79      [10] 2568 	jp	C,00208$
                           2569 ;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   738E DD 6E F6      [19] 2570 	ld	l,-10 (ix)
   7391 DD 66 F7      [19] 2571 	ld	h,-9 (ix)
   7394 46            [ 7] 2572 	ld	b,(hl)
   7395 05            [ 4] 2573 	dec	b
   7396 05            [ 4] 2574 	dec	b
   7397 DD 6E F4      [19] 2575 	ld	l,-12 (ix)
   739A DD 66 F5      [19] 2576 	ld	h,-11 (ix)
   739D 7E            [ 7] 2577 	ld	a,(hl)
   739E C6 04         [ 7] 2578 	add	a, #0x04
   73A0 C5            [11] 2579 	push	bc
   73A1 33            [ 6] 2580 	inc	sp
   73A2 F5            [11] 2581 	push	af
   73A3 33            [ 6] 2582 	inc	sp
   73A4 2A 38 65      [16] 2583 	ld	hl,(_mapa)
   73A7 E5            [11] 2584 	push	hl
   73A8 CD 61 4B      [17] 2585 	call	_getTilePtr
   73AB F1            [10] 2586 	pop	af
   73AC F1            [10] 2587 	pop	af
   73AD 4E            [ 7] 2588 	ld	c,(hl)
   73AE 3E 02         [ 7] 2589 	ld	a,#0x02
   73B0 91            [ 4] 2590 	sub	a, c
   73B1 DA 0B 79      [10] 2591 	jp	C,00208$
                           2592 ;src/main.c:475: moverEnemigoArriba(enemy);
   73B4 DD 6E F4      [19] 2593 	ld	l,-12 (ix)
   73B7 DD 66 F5      [19] 2594 	ld	h,-11 (ix)
   73BA E5            [11] 2595 	push	hl
   73BB CD 91 6B      [17] 2596 	call	_moverEnemigoArriba
   73BE F1            [10] 2597 	pop	af
                           2598 ;src/main.c:477: enemy->mover = SI;
   73BF DD 6E F8      [19] 2599 	ld	l,-8 (ix)
   73C2 DD 66 F9      [19] 2600 	ld	h,-7 (ix)
   73C5 36 01         [10] 2601 	ld	(hl),#0x01
   73C7 C3 0B 79      [10] 2602 	jp	00208$
   73CA                    2603 00136$:
                           2604 ;src/main.c:481: if(dist > G_ENEMY_H + 7) {
   73CA 3E 1D         [ 7] 2605 	ld	a,#0x1D
   73CC DD 96 F3      [19] 2606 	sub	a, -13 (ix)
   73CF D2 0B 79      [10] 2607 	jp	NC,00208$
                           2608 ;src/main.c:482: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   73D2 79            [ 4] 2609 	ld	a,c
   73D3 C6 18         [ 7] 2610 	add	a, #0x18
   73D5 47            [ 4] 2611 	ld	b,a
   73D6 C5            [11] 2612 	push	bc
   73D7 33            [ 6] 2613 	inc	sp
   73D8 DD 7E FA      [19] 2614 	ld	a,-6 (ix)
   73DB F5            [11] 2615 	push	af
   73DC 33            [ 6] 2616 	inc	sp
   73DD 2A 38 65      [16] 2617 	ld	hl,(_mapa)
   73E0 E5            [11] 2618 	push	hl
   73E1 CD 61 4B      [17] 2619 	call	_getTilePtr
   73E4 F1            [10] 2620 	pop	af
   73E5 F1            [10] 2621 	pop	af
   73E6 4E            [ 7] 2622 	ld	c,(hl)
   73E7 3E 02         [ 7] 2623 	ld	a,#0x02
   73E9 91            [ 4] 2624 	sub	a, c
   73EA DA 0B 79      [10] 2625 	jp	C,00208$
                           2626 ;src/main.c:483: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   73ED DD 6E F6      [19] 2627 	ld	l,-10 (ix)
   73F0 DD 66 F7      [19] 2628 	ld	h,-9 (ix)
   73F3 7E            [ 7] 2629 	ld	a,(hl)
   73F4 C6 18         [ 7] 2630 	add	a, #0x18
   73F6 57            [ 4] 2631 	ld	d,a
   73F7 DD 6E F4      [19] 2632 	ld	l,-12 (ix)
   73FA DD 66 F5      [19] 2633 	ld	h,-11 (ix)
   73FD 46            [ 7] 2634 	ld	b,(hl)
   73FE 04            [ 4] 2635 	inc	b
   73FF 04            [ 4] 2636 	inc	b
   7400 D5            [11] 2637 	push	de
   7401 33            [ 6] 2638 	inc	sp
   7402 C5            [11] 2639 	push	bc
   7403 33            [ 6] 2640 	inc	sp
   7404 2A 38 65      [16] 2641 	ld	hl,(_mapa)
   7407 E5            [11] 2642 	push	hl
   7408 CD 61 4B      [17] 2643 	call	_getTilePtr
   740B F1            [10] 2644 	pop	af
   740C F1            [10] 2645 	pop	af
   740D 4E            [ 7] 2646 	ld	c,(hl)
   740E 3E 02         [ 7] 2647 	ld	a,#0x02
   7410 91            [ 4] 2648 	sub	a, c
   7411 DA 0B 79      [10] 2649 	jp	C,00208$
                           2650 ;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7414 DD 6E F6      [19] 2651 	ld	l,-10 (ix)
   7417 DD 66 F7      [19] 2652 	ld	h,-9 (ix)
   741A 7E            [ 7] 2653 	ld	a,(hl)
   741B C6 18         [ 7] 2654 	add	a, #0x18
   741D 47            [ 4] 2655 	ld	b,a
   741E DD 6E F4      [19] 2656 	ld	l,-12 (ix)
   7421 DD 66 F5      [19] 2657 	ld	h,-11 (ix)
   7424 7E            [ 7] 2658 	ld	a,(hl)
   7425 C6 04         [ 7] 2659 	add	a, #0x04
   7427 C5            [11] 2660 	push	bc
   7428 33            [ 6] 2661 	inc	sp
   7429 F5            [11] 2662 	push	af
   742A 33            [ 6] 2663 	inc	sp
   742B 2A 38 65      [16] 2664 	ld	hl,(_mapa)
   742E E5            [11] 2665 	push	hl
   742F CD 61 4B      [17] 2666 	call	_getTilePtr
   7432 F1            [10] 2667 	pop	af
   7433 F1            [10] 2668 	pop	af
   7434 4E            [ 7] 2669 	ld	c,(hl)
   7435 3E 02         [ 7] 2670 	ld	a,#0x02
   7437 91            [ 4] 2671 	sub	a, c
   7438 DA 0B 79      [10] 2672 	jp	C,00208$
                           2673 ;src/main.c:485: moverEnemigoAbajo(enemy);
   743B DD 6E F4      [19] 2674 	ld	l,-12 (ix)
   743E DD 66 F5      [19] 2675 	ld	h,-11 (ix)
   7441 E5            [11] 2676 	push	hl
   7442 CD B0 6B      [17] 2677 	call	_moverEnemigoAbajo
   7445 F1            [10] 2678 	pop	af
                           2679 ;src/main.c:487: enemy->mover = SI;
   7446 DD 6E F8      [19] 2680 	ld	l,-8 (ix)
   7449 DD 66 F9      [19] 2681 	ld	h,-7 (ix)
   744C 36 01         [10] 2682 	ld	(hl),#0x01
   744E C3 0B 79      [10] 2683 	jp	00208$
   7451                    2684 00199$:
                           2685 ;src/main.c:493: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7451 3A 5C 64      [13] 2686 	ld	a, (#_prota + 6)
   7454 B7            [ 4] 2687 	or	a, a
   7455 20 04         [12] 2688 	jr	NZ,00139$
   7457 DD 36 F0 14   [19] 2689 	ld	-16 (ix),#0x14
   745B                    2690 00139$:
                           2691 ;src/main.c:495: if (dist > distConstraint) {
   745B DD 7E F0      [19] 2692 	ld	a,-16 (ix)
   745E DD 96 F3      [19] 2693 	sub	a, -13 (ix)
   7461 D2 0B 79      [10] 2694 	jp	NC,00208$
                           2695 ;src/main.c:496: if (dx + 1 < enemy->x) {
   7464 DD 5E 06      [19] 2696 	ld	e,6 (ix)
   7467 16 00         [ 7] 2697 	ld	d,#0x00
   7469 13            [ 6] 2698 	inc	de
   746A DD 7E FA      [19] 2699 	ld	a,-6 (ix)
   746D DD 77 FE      [19] 2700 	ld	-2 (ix),a
   7470 DD 36 FF 00   [19] 2701 	ld	-1 (ix),#0x00
   7474 7B            [ 4] 2702 	ld	a,e
   7475 DD 96 FE      [19] 2703 	sub	a, -2 (ix)
   7478 7A            [ 4] 2704 	ld	a,d
   7479 DD 9E FF      [19] 2705 	sbc	a, -1 (ix)
   747C E2 81 74      [10] 2706 	jp	PO, 00452$
   747F EE 80         [ 7] 2707 	xor	a, #0x80
   7481                    2708 00452$:
   7481 F2 00 75      [10] 2709 	jp	P,00151$
                           2710 ;src/main.c:497: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7484 79            [ 4] 2711 	ld	a,c
   7485 F5            [11] 2712 	push	af
   7486 33            [ 6] 2713 	inc	sp
   7487 DD 7E FA      [19] 2714 	ld	a,-6 (ix)
   748A F5            [11] 2715 	push	af
   748B 33            [ 6] 2716 	inc	sp
   748C 2A 38 65      [16] 2717 	ld	hl,(_mapa)
   748F E5            [11] 2718 	push	hl
   7490 CD 61 4B      [17] 2719 	call	_getTilePtr
   7493 F1            [10] 2720 	pop	af
   7494 F1            [10] 2721 	pop	af
   7495 4E            [ 7] 2722 	ld	c,(hl)
   7496 3E 02         [ 7] 2723 	ld	a,#0x02
   7498 91            [ 4] 2724 	sub	a, c
   7499 DA 8A 75      [10] 2725 	jp	C,00152$
                           2726 ;src/main.c:498: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   749C DD 6E F6      [19] 2727 	ld	l,-10 (ix)
   749F DD 66 F7      [19] 2728 	ld	h,-9 (ix)
   74A2 7E            [ 7] 2729 	ld	a,(hl)
   74A3 C6 0B         [ 7] 2730 	add	a, #0x0B
   74A5 57            [ 4] 2731 	ld	d,a
   74A6 DD 6E F4      [19] 2732 	ld	l,-12 (ix)
   74A9 DD 66 F5      [19] 2733 	ld	h,-11 (ix)
   74AC 46            [ 7] 2734 	ld	b,(hl)
   74AD D5            [11] 2735 	push	de
   74AE 33            [ 6] 2736 	inc	sp
   74AF C5            [11] 2737 	push	bc
   74B0 33            [ 6] 2738 	inc	sp
   74B1 2A 38 65      [16] 2739 	ld	hl,(_mapa)
   74B4 E5            [11] 2740 	push	hl
   74B5 CD 61 4B      [17] 2741 	call	_getTilePtr
   74B8 F1            [10] 2742 	pop	af
   74B9 F1            [10] 2743 	pop	af
   74BA 4E            [ 7] 2744 	ld	c,(hl)
   74BB 3E 02         [ 7] 2745 	ld	a,#0x02
   74BD 91            [ 4] 2746 	sub	a, c
   74BE DA 8A 75      [10] 2747 	jp	C,00152$
                           2748 ;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   74C1 DD 6E F6      [19] 2749 	ld	l,-10 (ix)
   74C4 DD 66 F7      [19] 2750 	ld	h,-9 (ix)
   74C7 7E            [ 7] 2751 	ld	a,(hl)
   74C8 C6 16         [ 7] 2752 	add	a, #0x16
   74CA 57            [ 4] 2753 	ld	d,a
   74CB DD 6E F4      [19] 2754 	ld	l,-12 (ix)
   74CE DD 66 F5      [19] 2755 	ld	h,-11 (ix)
   74D1 46            [ 7] 2756 	ld	b,(hl)
   74D2 D5            [11] 2757 	push	de
   74D3 33            [ 6] 2758 	inc	sp
   74D4 C5            [11] 2759 	push	bc
   74D5 33            [ 6] 2760 	inc	sp
   74D6 2A 38 65      [16] 2761 	ld	hl,(_mapa)
   74D9 E5            [11] 2762 	push	hl
   74DA CD 61 4B      [17] 2763 	call	_getTilePtr
   74DD F1            [10] 2764 	pop	af
   74DE F1            [10] 2765 	pop	af
   74DF 4E            [ 7] 2766 	ld	c,(hl)
   74E0 3E 02         [ 7] 2767 	ld	a,#0x02
   74E2 91            [ 4] 2768 	sub	a, c
   74E3 DA 8A 75      [10] 2769 	jp	C,00152$
                           2770 ;src/main.c:500: moverEnemigoIzquierda(enemy);
   74E6 DD 6E F4      [19] 2771 	ld	l,-12 (ix)
   74E9 DD 66 F5      [19] 2772 	ld	h,-11 (ix)
   74EC E5            [11] 2773 	push	hl
   74ED CD DF 6B      [17] 2774 	call	_moverEnemigoIzquierda
   74F0 F1            [10] 2775 	pop	af
                           2776 ;src/main.c:501: movX = 1;
   74F1 DD 36 F2 01   [19] 2777 	ld	-14 (ix),#0x01
                           2778 ;src/main.c:502: enemy->mover = SI;
   74F5 DD 6E F8      [19] 2779 	ld	l,-8 (ix)
   74F8 DD 66 F9      [19] 2780 	ld	h,-7 (ix)
   74FB 36 01         [10] 2781 	ld	(hl),#0x01
   74FD C3 8A 75      [10] 2782 	jp	00152$
   7500                    2783 00151$:
                           2784 ;src/main.c:504: } else if (dx + 1 > enemy->x){
   7500 DD 7E FE      [19] 2785 	ld	a,-2 (ix)
   7503 93            [ 4] 2786 	sub	a, e
   7504 DD 7E FF      [19] 2787 	ld	a,-1 (ix)
   7507 9A            [ 4] 2788 	sbc	a, d
   7508 E2 0D 75      [10] 2789 	jp	PO, 00453$
   750B EE 80         [ 7] 2790 	xor	a, #0x80
   750D                    2791 00453$:
   750D F2 8A 75      [10] 2792 	jp	P,00152$
                           2793 ;src/main.c:505: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7510 79            [ 4] 2794 	ld	a,c
   7511 F5            [11] 2795 	push	af
   7512 33            [ 6] 2796 	inc	sp
   7513 DD 7E FB      [19] 2797 	ld	a,-5 (ix)
   7516 F5            [11] 2798 	push	af
   7517 33            [ 6] 2799 	inc	sp
   7518 2A 38 65      [16] 2800 	ld	hl,(_mapa)
   751B E5            [11] 2801 	push	hl
   751C CD 61 4B      [17] 2802 	call	_getTilePtr
   751F F1            [10] 2803 	pop	af
   7520 F1            [10] 2804 	pop	af
   7521 4E            [ 7] 2805 	ld	c,(hl)
   7522 3E 02         [ 7] 2806 	ld	a,#0x02
   7524 91            [ 4] 2807 	sub	a, c
   7525 38 63         [12] 2808 	jr	C,00152$
                           2809 ;src/main.c:506: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7527 DD 6E F6      [19] 2810 	ld	l,-10 (ix)
   752A DD 66 F7      [19] 2811 	ld	h,-9 (ix)
   752D 7E            [ 7] 2812 	ld	a,(hl)
   752E C6 0B         [ 7] 2813 	add	a, #0x0B
   7530 47            [ 4] 2814 	ld	b,a
   7531 DD 6E F4      [19] 2815 	ld	l,-12 (ix)
   7534 DD 66 F5      [19] 2816 	ld	h,-11 (ix)
   7537 7E            [ 7] 2817 	ld	a,(hl)
   7538 C6 04         [ 7] 2818 	add	a, #0x04
   753A C5            [11] 2819 	push	bc
   753B 33            [ 6] 2820 	inc	sp
   753C F5            [11] 2821 	push	af
   753D 33            [ 6] 2822 	inc	sp
   753E 2A 38 65      [16] 2823 	ld	hl,(_mapa)
   7541 E5            [11] 2824 	push	hl
   7542 CD 61 4B      [17] 2825 	call	_getTilePtr
   7545 F1            [10] 2826 	pop	af
   7546 F1            [10] 2827 	pop	af
   7547 4E            [ 7] 2828 	ld	c,(hl)
   7548 3E 02         [ 7] 2829 	ld	a,#0x02
   754A 91            [ 4] 2830 	sub	a, c
   754B 38 3D         [12] 2831 	jr	C,00152$
                           2832 ;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   754D DD 6E F6      [19] 2833 	ld	l,-10 (ix)
   7550 DD 66 F7      [19] 2834 	ld	h,-9 (ix)
   7553 7E            [ 7] 2835 	ld	a,(hl)
   7554 C6 16         [ 7] 2836 	add	a, #0x16
   7556 47            [ 4] 2837 	ld	b,a
   7557 DD 6E F4      [19] 2838 	ld	l,-12 (ix)
   755A DD 66 F5      [19] 2839 	ld	h,-11 (ix)
   755D 7E            [ 7] 2840 	ld	a,(hl)
   755E C6 04         [ 7] 2841 	add	a, #0x04
   7560 C5            [11] 2842 	push	bc
   7561 33            [ 6] 2843 	inc	sp
   7562 F5            [11] 2844 	push	af
   7563 33            [ 6] 2845 	inc	sp
   7564 2A 38 65      [16] 2846 	ld	hl,(_mapa)
   7567 E5            [11] 2847 	push	hl
   7568 CD 61 4B      [17] 2848 	call	_getTilePtr
   756B F1            [10] 2849 	pop	af
   756C F1            [10] 2850 	pop	af
   756D 4E            [ 7] 2851 	ld	c,(hl)
   756E 3E 02         [ 7] 2852 	ld	a,#0x02
   7570 91            [ 4] 2853 	sub	a, c
   7571 38 17         [12] 2854 	jr	C,00152$
                           2855 ;src/main.c:508: moverEnemigoDerecha(enemy);
   7573 DD 6E F4      [19] 2856 	ld	l,-12 (ix)
   7576 DD 66 F5      [19] 2857 	ld	h,-11 (ix)
   7579 E5            [11] 2858 	push	hl
   757A CD CF 6B      [17] 2859 	call	_moverEnemigoDerecha
   757D F1            [10] 2860 	pop	af
                           2861 ;src/main.c:509: movX = 1;
   757E DD 36 F2 01   [19] 2862 	ld	-14 (ix),#0x01
                           2863 ;src/main.c:510: enemy->mover = SI;
   7582 DD 6E F8      [19] 2864 	ld	l,-8 (ix)
   7585 DD 66 F9      [19] 2865 	ld	h,-7 (ix)
   7588 36 01         [10] 2866 	ld	(hl),#0x01
   758A                    2867 00152$:
                           2868 ;src/main.c:513: if (dy < enemy->y) {
   758A DD 6E F6      [19] 2869 	ld	l,-10 (ix)
   758D DD 66 F7      [19] 2870 	ld	h,-9 (ix)
   7590 7E            [ 7] 2871 	ld	a,(hl)
   7591 DD 77 FE      [19] 2872 	ld	-2 (ix),a
                           2873 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7594 DD 6E F4      [19] 2874 	ld	l,-12 (ix)
   7597 DD 66 F5      [19] 2875 	ld	h,-11 (ix)
   759A 7E            [ 7] 2876 	ld	a,(hl)
   759B DD 77 FC      [19] 2877 	ld	-4 (ix),a
                           2878 ;src/main.c:513: if (dy < enemy->y) {
   759E DD 7E 07      [19] 2879 	ld	a,7 (ix)
   75A1 DD 96 FE      [19] 2880 	sub	a, -2 (ix)
   75A4 D2 29 76      [10] 2881 	jp	NC,00162$
                           2882 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75A7 DD 46 FE      [19] 2883 	ld	b,-2 (ix)
   75AA 05            [ 4] 2884 	dec	b
   75AB 05            [ 4] 2885 	dec	b
   75AC C5            [11] 2886 	push	bc
   75AD 33            [ 6] 2887 	inc	sp
   75AE DD 7E FC      [19] 2888 	ld	a,-4 (ix)
   75B1 F5            [11] 2889 	push	af
   75B2 33            [ 6] 2890 	inc	sp
   75B3 2A 38 65      [16] 2891 	ld	hl,(_mapa)
   75B6 E5            [11] 2892 	push	hl
   75B7 CD 61 4B      [17] 2893 	call	_getTilePtr
   75BA F1            [10] 2894 	pop	af
   75BB F1            [10] 2895 	pop	af
   75BC 4E            [ 7] 2896 	ld	c,(hl)
   75BD 3E 02         [ 7] 2897 	ld	a,#0x02
   75BF 91            [ 4] 2898 	sub	a, c
   75C0 DA A8 76      [10] 2899 	jp	C,00163$
                           2900 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75C3 DD 6E F6      [19] 2901 	ld	l,-10 (ix)
   75C6 DD 66 F7      [19] 2902 	ld	h,-9 (ix)
   75C9 56            [ 7] 2903 	ld	d,(hl)
   75CA 15            [ 4] 2904 	dec	d
   75CB 15            [ 4] 2905 	dec	d
   75CC DD 6E F4      [19] 2906 	ld	l,-12 (ix)
   75CF DD 66 F5      [19] 2907 	ld	h,-11 (ix)
   75D2 46            [ 7] 2908 	ld	b,(hl)
   75D3 04            [ 4] 2909 	inc	b
   75D4 04            [ 4] 2910 	inc	b
   75D5 D5            [11] 2911 	push	de
   75D6 33            [ 6] 2912 	inc	sp
   75D7 C5            [11] 2913 	push	bc
   75D8 33            [ 6] 2914 	inc	sp
   75D9 2A 38 65      [16] 2915 	ld	hl,(_mapa)
   75DC E5            [11] 2916 	push	hl
   75DD CD 61 4B      [17] 2917 	call	_getTilePtr
   75E0 F1            [10] 2918 	pop	af
   75E1 F1            [10] 2919 	pop	af
   75E2 4E            [ 7] 2920 	ld	c,(hl)
   75E3 3E 02         [ 7] 2921 	ld	a,#0x02
   75E5 91            [ 4] 2922 	sub	a, c
   75E6 DA A8 76      [10] 2923 	jp	C,00163$
                           2924 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   75E9 DD 6E F6      [19] 2925 	ld	l,-10 (ix)
   75EC DD 66 F7      [19] 2926 	ld	h,-9 (ix)
   75EF 46            [ 7] 2927 	ld	b,(hl)
   75F0 05            [ 4] 2928 	dec	b
   75F1 05            [ 4] 2929 	dec	b
   75F2 DD 6E F4      [19] 2930 	ld	l,-12 (ix)
   75F5 DD 66 F5      [19] 2931 	ld	h,-11 (ix)
   75F8 7E            [ 7] 2932 	ld	a,(hl)
   75F9 C6 04         [ 7] 2933 	add	a, #0x04
   75FB C5            [11] 2934 	push	bc
   75FC 33            [ 6] 2935 	inc	sp
   75FD F5            [11] 2936 	push	af
   75FE 33            [ 6] 2937 	inc	sp
   75FF 2A 38 65      [16] 2938 	ld	hl,(_mapa)
   7602 E5            [11] 2939 	push	hl
   7603 CD 61 4B      [17] 2940 	call	_getTilePtr
   7606 F1            [10] 2941 	pop	af
   7607 F1            [10] 2942 	pop	af
   7608 4E            [ 7] 2943 	ld	c,(hl)
   7609 3E 02         [ 7] 2944 	ld	a,#0x02
   760B 91            [ 4] 2945 	sub	a, c
   760C DA A8 76      [10] 2946 	jp	C,00163$
                           2947 ;src/main.c:517: moverEnemigoArriba(enemy);
   760F DD 6E F4      [19] 2948 	ld	l,-12 (ix)
   7612 DD 66 F5      [19] 2949 	ld	h,-11 (ix)
   7615 E5            [11] 2950 	push	hl
   7616 CD 91 6B      [17] 2951 	call	_moverEnemigoArriba
   7619 F1            [10] 2952 	pop	af
                           2953 ;src/main.c:518: movY = 1;
   761A DD 36 F1 01   [19] 2954 	ld	-15 (ix),#0x01
                           2955 ;src/main.c:519: enemy->mover = SI;
   761E DD 6E F8      [19] 2956 	ld	l,-8 (ix)
   7621 DD 66 F9      [19] 2957 	ld	h,-7 (ix)
   7624 36 01         [10] 2958 	ld	(hl),#0x01
   7626 C3 A8 76      [10] 2959 	jp	00163$
   7629                    2960 00162$:
                           2961 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7629 DD 7E FE      [19] 2962 	ld	a,-2 (ix)
   762C C6 18         [ 7] 2963 	add	a, #0x18
   762E 47            [ 4] 2964 	ld	b,a
   762F C5            [11] 2965 	push	bc
   7630 33            [ 6] 2966 	inc	sp
   7631 DD 7E FC      [19] 2967 	ld	a,-4 (ix)
   7634 F5            [11] 2968 	push	af
   7635 33            [ 6] 2969 	inc	sp
   7636 2A 38 65      [16] 2970 	ld	hl,(_mapa)
   7639 E5            [11] 2971 	push	hl
   763A CD 61 4B      [17] 2972 	call	_getTilePtr
   763D F1            [10] 2973 	pop	af
   763E F1            [10] 2974 	pop	af
   763F 4E            [ 7] 2975 	ld	c,(hl)
   7640 3E 02         [ 7] 2976 	ld	a,#0x02
   7642 91            [ 4] 2977 	sub	a, c
   7643 38 63         [12] 2978 	jr	C,00163$
                           2979 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7645 DD 6E F6      [19] 2980 	ld	l,-10 (ix)
   7648 DD 66 F7      [19] 2981 	ld	h,-9 (ix)
   764B 7E            [ 7] 2982 	ld	a,(hl)
   764C C6 18         [ 7] 2983 	add	a, #0x18
   764E 57            [ 4] 2984 	ld	d,a
   764F DD 6E F4      [19] 2985 	ld	l,-12 (ix)
   7652 DD 66 F5      [19] 2986 	ld	h,-11 (ix)
   7655 46            [ 7] 2987 	ld	b,(hl)
   7656 04            [ 4] 2988 	inc	b
   7657 04            [ 4] 2989 	inc	b
   7658 D5            [11] 2990 	push	de
   7659 33            [ 6] 2991 	inc	sp
   765A C5            [11] 2992 	push	bc
   765B 33            [ 6] 2993 	inc	sp
   765C 2A 38 65      [16] 2994 	ld	hl,(_mapa)
   765F E5            [11] 2995 	push	hl
   7660 CD 61 4B      [17] 2996 	call	_getTilePtr
   7663 F1            [10] 2997 	pop	af
   7664 F1            [10] 2998 	pop	af
   7665 4E            [ 7] 2999 	ld	c,(hl)
   7666 3E 02         [ 7] 3000 	ld	a,#0x02
   7668 91            [ 4] 3001 	sub	a, c
   7669 38 3D         [12] 3002 	jr	C,00163$
                           3003 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   766B DD 6E F6      [19] 3004 	ld	l,-10 (ix)
   766E DD 66 F7      [19] 3005 	ld	h,-9 (ix)
   7671 7E            [ 7] 3006 	ld	a,(hl)
   7672 C6 18         [ 7] 3007 	add	a, #0x18
   7674 47            [ 4] 3008 	ld	b,a
   7675 DD 6E F4      [19] 3009 	ld	l,-12 (ix)
   7678 DD 66 F5      [19] 3010 	ld	h,-11 (ix)
   767B 7E            [ 7] 3011 	ld	a,(hl)
   767C C6 04         [ 7] 3012 	add	a, #0x04
   767E C5            [11] 3013 	push	bc
   767F 33            [ 6] 3014 	inc	sp
   7680 F5            [11] 3015 	push	af
   7681 33            [ 6] 3016 	inc	sp
   7682 2A 38 65      [16] 3017 	ld	hl,(_mapa)
   7685 E5            [11] 3018 	push	hl
   7686 CD 61 4B      [17] 3019 	call	_getTilePtr
   7689 F1            [10] 3020 	pop	af
   768A F1            [10] 3021 	pop	af
   768B 4E            [ 7] 3022 	ld	c,(hl)
   768C 3E 02         [ 7] 3023 	ld	a,#0x02
   768E 91            [ 4] 3024 	sub	a, c
   768F 38 17         [12] 3025 	jr	C,00163$
                           3026 ;src/main.c:525: moverEnemigoAbajo(enemy);
   7691 DD 6E F4      [19] 3027 	ld	l,-12 (ix)
   7694 DD 66 F5      [19] 3028 	ld	h,-11 (ix)
   7697 E5            [11] 3029 	push	hl
   7698 CD B0 6B      [17] 3030 	call	_moverEnemigoAbajo
   769B F1            [10] 3031 	pop	af
                           3032 ;src/main.c:526: movY = 1;
   769C DD 36 F1 01   [19] 3033 	ld	-15 (ix),#0x01
                           3034 ;src/main.c:527: enemy->mover = SI;
   76A0 DD 6E F8      [19] 3035 	ld	l,-8 (ix)
   76A3 DD 66 F9      [19] 3036 	ld	h,-7 (ix)
   76A6 36 01         [10] 3037 	ld	(hl),#0x01
   76A8                    3038 00163$:
                           3039 ;src/main.c:530: if (!enemy->mover) {
   76A8 DD 6E F8      [19] 3040 	ld	l,-8 (ix)
   76AB DD 66 F9      [19] 3041 	ld	h,-7 (ix)
   76AE 7E            [ 7] 3042 	ld	a,(hl)
   76AF B7            [ 4] 3043 	or	a, a
   76B0 C2 0B 79      [10] 3044 	jp	NZ,00208$
                           3045 ;src/main.c:531: if (!movX) {
   76B3 DD 7E F2      [19] 3046 	ld	a,-14 (ix)
   76B6 B7            [ 4] 3047 	or	a, a
   76B7 C2 E0 77      [10] 3048 	jp	NZ,00178$
                           3049 ;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76BA DD 6E F6      [19] 3050 	ld	l,-10 (ix)
   76BD DD 66 F7      [19] 3051 	ld	h,-9 (ix)
   76C0 5E            [ 7] 3052 	ld	e,(hl)
                           3053 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   76C1 DD 6E F4      [19] 3054 	ld	l,-12 (ix)
   76C4 DD 66 F5      [19] 3055 	ld	h,-11 (ix)
   76C7 4E            [ 7] 3056 	ld	c,(hl)
                           3057 ;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76C8 3E 70         [ 7] 3058 	ld	a,#0x70
   76CA 93            [ 4] 3059 	sub	a, e
   76CB D2 5B 77      [10] 3060 	jp	NC,00175$
                           3061 ;src/main.c:533: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   76CE 7B            [ 4] 3062 	ld	a,e
   76CF C6 18         [ 7] 3063 	add	a, #0x18
   76D1 47            [ 4] 3064 	ld	b,a
   76D2 C5            [11] 3065 	push	bc
   76D3 2A 38 65      [16] 3066 	ld	hl,(_mapa)
   76D6 E5            [11] 3067 	push	hl
   76D7 CD 61 4B      [17] 3068 	call	_getTilePtr
   76DA F1            [10] 3069 	pop	af
   76DB F1            [10] 3070 	pop	af
   76DC 4E            [ 7] 3071 	ld	c,(hl)
   76DD 3E 02         [ 7] 3072 	ld	a,#0x02
   76DF 91            [ 4] 3073 	sub	a, c
   76E0 38 63         [12] 3074 	jr	C,00165$
                           3075 ;src/main.c:534: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   76E2 DD 6E F6      [19] 3076 	ld	l,-10 (ix)
   76E5 DD 66 F7      [19] 3077 	ld	h,-9 (ix)
   76E8 7E            [ 7] 3078 	ld	a,(hl)
   76E9 C6 18         [ 7] 3079 	add	a, #0x18
   76EB 57            [ 4] 3080 	ld	d,a
   76EC DD 6E F4      [19] 3081 	ld	l,-12 (ix)
   76EF DD 66 F5      [19] 3082 	ld	h,-11 (ix)
   76F2 4E            [ 7] 3083 	ld	c,(hl)
   76F3 41            [ 4] 3084 	ld	b,c
   76F4 04            [ 4] 3085 	inc	b
   76F5 04            [ 4] 3086 	inc	b
   76F6 D5            [11] 3087 	push	de
   76F7 33            [ 6] 3088 	inc	sp
   76F8 C5            [11] 3089 	push	bc
   76F9 33            [ 6] 3090 	inc	sp
   76FA 2A 38 65      [16] 3091 	ld	hl,(_mapa)
   76FD E5            [11] 3092 	push	hl
   76FE CD 61 4B      [17] 3093 	call	_getTilePtr
   7701 F1            [10] 3094 	pop	af
   7702 F1            [10] 3095 	pop	af
   7703 4E            [ 7] 3096 	ld	c,(hl)
   7704 3E 02         [ 7] 3097 	ld	a,#0x02
   7706 91            [ 4] 3098 	sub	a, c
   7707 38 3C         [12] 3099 	jr	C,00165$
                           3100 ;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7709 DD 6E F6      [19] 3101 	ld	l,-10 (ix)
   770C DD 66 F7      [19] 3102 	ld	h,-9 (ix)
   770F 7E            [ 7] 3103 	ld	a,(hl)
   7710 C6 18         [ 7] 3104 	add	a, #0x18
   7712 47            [ 4] 3105 	ld	b,a
   7713 DD 6E F4      [19] 3106 	ld	l,-12 (ix)
   7716 DD 66 F5      [19] 3107 	ld	h,-11 (ix)
   7719 7E            [ 7] 3108 	ld	a,(hl)
   771A C6 04         [ 7] 3109 	add	a, #0x04
   771C C5            [11] 3110 	push	bc
   771D 33            [ 6] 3111 	inc	sp
   771E F5            [11] 3112 	push	af
   771F 33            [ 6] 3113 	inc	sp
   7720 2A 38 65      [16] 3114 	ld	hl,(_mapa)
   7723 E5            [11] 3115 	push	hl
   7724 CD 61 4B      [17] 3116 	call	_getTilePtr
   7727 F1            [10] 3117 	pop	af
   7728 F1            [10] 3118 	pop	af
   7729 4E            [ 7] 3119 	ld	c,(hl)
   772A 3E 02         [ 7] 3120 	ld	a,#0x02
   772C 91            [ 4] 3121 	sub	a, c
   772D 38 16         [12] 3122 	jr	C,00165$
                           3123 ;src/main.c:536: moverEnemigoAbajo(enemy);
   772F DD 6E F4      [19] 3124 	ld	l,-12 (ix)
   7732 DD 66 F5      [19] 3125 	ld	h,-11 (ix)
   7735 E5            [11] 3126 	push	hl
   7736 CD B0 6B      [17] 3127 	call	_moverEnemigoAbajo
   7739 F1            [10] 3128 	pop	af
                           3129 ;src/main.c:537: enemy->mover = SI;
   773A DD 6E F8      [19] 3130 	ld	l,-8 (ix)
   773D DD 66 F9      [19] 3131 	ld	h,-7 (ix)
   7740 36 01         [10] 3132 	ld	(hl),#0x01
   7742 C3 E0 77      [10] 3133 	jp	00178$
   7745                    3134 00165$:
                           3135 ;src/main.c:539: moverEnemigoArriba(enemy);
   7745 DD 6E F4      [19] 3136 	ld	l,-12 (ix)
   7748 DD 66 F5      [19] 3137 	ld	h,-11 (ix)
   774B E5            [11] 3138 	push	hl
   774C CD 91 6B      [17] 3139 	call	_moverEnemigoArriba
   774F F1            [10] 3140 	pop	af
                           3141 ;src/main.c:540: enemy->mover = SI;
   7750 DD 6E F8      [19] 3142 	ld	l,-8 (ix)
   7753 DD 66 F9      [19] 3143 	ld	h,-7 (ix)
   7756 36 01         [10] 3144 	ld	(hl),#0x01
   7758 C3 E0 77      [10] 3145 	jp	00178$
   775B                    3146 00175$:
                           3147 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   775B 43            [ 4] 3148 	ld	b,e
   775C 05            [ 4] 3149 	dec	b
   775D 05            [ 4] 3150 	dec	b
   775E C5            [11] 3151 	push	bc
   775F 2A 38 65      [16] 3152 	ld	hl,(_mapa)
   7762 E5            [11] 3153 	push	hl
   7763 CD 61 4B      [17] 3154 	call	_getTilePtr
   7766 F1            [10] 3155 	pop	af
   7767 F1            [10] 3156 	pop	af
   7768 4E            [ 7] 3157 	ld	c,(hl)
   7769 3E 02         [ 7] 3158 	ld	a,#0x02
   776B 91            [ 4] 3159 	sub	a, c
   776C 38 5F         [12] 3160 	jr	C,00170$
                           3161 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   776E DD 6E F6      [19] 3162 	ld	l,-10 (ix)
   7771 DD 66 F7      [19] 3163 	ld	h,-9 (ix)
   7774 56            [ 7] 3164 	ld	d,(hl)
   7775 15            [ 4] 3165 	dec	d
   7776 15            [ 4] 3166 	dec	d
   7777 DD 6E F4      [19] 3167 	ld	l,-12 (ix)
   777A DD 66 F5      [19] 3168 	ld	h,-11 (ix)
   777D 46            [ 7] 3169 	ld	b,(hl)
   777E 04            [ 4] 3170 	inc	b
   777F 04            [ 4] 3171 	inc	b
   7780 D5            [11] 3172 	push	de
   7781 33            [ 6] 3173 	inc	sp
   7782 C5            [11] 3174 	push	bc
   7783 33            [ 6] 3175 	inc	sp
   7784 2A 38 65      [16] 3176 	ld	hl,(_mapa)
   7787 E5            [11] 3177 	push	hl
   7788 CD 61 4B      [17] 3178 	call	_getTilePtr
   778B F1            [10] 3179 	pop	af
   778C F1            [10] 3180 	pop	af
   778D 4E            [ 7] 3181 	ld	c,(hl)
   778E 3E 02         [ 7] 3182 	ld	a,#0x02
   7790 91            [ 4] 3183 	sub	a, c
   7791 38 3A         [12] 3184 	jr	C,00170$
                           3185 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7793 DD 6E F6      [19] 3186 	ld	l,-10 (ix)
   7796 DD 66 F7      [19] 3187 	ld	h,-9 (ix)
   7799 46            [ 7] 3188 	ld	b,(hl)
   779A 05            [ 4] 3189 	dec	b
   779B 05            [ 4] 3190 	dec	b
   779C DD 6E F4      [19] 3191 	ld	l,-12 (ix)
   779F DD 66 F5      [19] 3192 	ld	h,-11 (ix)
   77A2 7E            [ 7] 3193 	ld	a,(hl)
   77A3 C6 04         [ 7] 3194 	add	a, #0x04
   77A5 C5            [11] 3195 	push	bc
   77A6 33            [ 6] 3196 	inc	sp
   77A7 F5            [11] 3197 	push	af
   77A8 33            [ 6] 3198 	inc	sp
   77A9 2A 38 65      [16] 3199 	ld	hl,(_mapa)
   77AC E5            [11] 3200 	push	hl
   77AD CD 61 4B      [17] 3201 	call	_getTilePtr
   77B0 F1            [10] 3202 	pop	af
   77B1 F1            [10] 3203 	pop	af
   77B2 4E            [ 7] 3204 	ld	c,(hl)
   77B3 3E 02         [ 7] 3205 	ld	a,#0x02
   77B5 91            [ 4] 3206 	sub	a, c
   77B6 38 15         [12] 3207 	jr	C,00170$
                           3208 ;src/main.c:546: moverEnemigoArriba(enemy);
   77B8 DD 6E F4      [19] 3209 	ld	l,-12 (ix)
   77BB DD 66 F5      [19] 3210 	ld	h,-11 (ix)
   77BE E5            [11] 3211 	push	hl
   77BF CD 91 6B      [17] 3212 	call	_moverEnemigoArriba
   77C2 F1            [10] 3213 	pop	af
                           3214 ;src/main.c:547: enemy->mover = SI;
   77C3 DD 6E F8      [19] 3215 	ld	l,-8 (ix)
   77C6 DD 66 F9      [19] 3216 	ld	h,-7 (ix)
   77C9 36 01         [10] 3217 	ld	(hl),#0x01
   77CB 18 13         [12] 3218 	jr	00178$
   77CD                    3219 00170$:
                           3220 ;src/main.c:549: moverEnemigoAbajo(enemy);
   77CD DD 6E F4      [19] 3221 	ld	l,-12 (ix)
   77D0 DD 66 F5      [19] 3222 	ld	h,-11 (ix)
   77D3 E5            [11] 3223 	push	hl
   77D4 CD B0 6B      [17] 3224 	call	_moverEnemigoAbajo
   77D7 F1            [10] 3225 	pop	af
                           3226 ;src/main.c:550: enemy->mover = SI;
   77D8 DD 6E F8      [19] 3227 	ld	l,-8 (ix)
   77DB DD 66 F9      [19] 3228 	ld	h,-7 (ix)
   77DE 36 01         [10] 3229 	ld	(hl),#0x01
   77E0                    3230 00178$:
                           3231 ;src/main.c:555: if (!movY) {
   77E0 DD 7E F1      [19] 3232 	ld	a,-15 (ix)
   77E3 B7            [ 4] 3233 	or	a, a
   77E4 C2 0B 79      [10] 3234 	jp	NZ,00208$
                           3235 ;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
   77E7 DD 6E F4      [19] 3236 	ld	l,-12 (ix)
   77EA DD 66 F5      [19] 3237 	ld	h,-11 (ix)
   77ED 4E            [ 7] 3238 	ld	c,(hl)
                           3239 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   77EE DD 6E F6      [19] 3240 	ld	l,-10 (ix)
   77F1 DD 66 F7      [19] 3241 	ld	h,-9 (ix)
   77F4 56            [ 7] 3242 	ld	d,(hl)
                           3243 ;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
   77F5 79            [ 4] 3244 	ld	a,c
   77F6 D6 28         [ 7] 3245 	sub	a, #0x28
   77F8 D2 81 78      [10] 3246 	jp	NC,00190$
                           3247 ;src/main.c:557: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   77FB D5            [11] 3248 	push	de
   77FC 33            [ 6] 3249 	inc	sp
   77FD 79            [ 4] 3250 	ld	a,c
   77FE F5            [11] 3251 	push	af
   77FF 33            [ 6] 3252 	inc	sp
   7800 2A 38 65      [16] 3253 	ld	hl,(_mapa)
   7803 E5            [11] 3254 	push	hl
   7804 CD 61 4B      [17] 3255 	call	_getTilePtr
   7807 F1            [10] 3256 	pop	af
   7808 F1            [10] 3257 	pop	af
   7809 4E            [ 7] 3258 	ld	c,(hl)
   780A 3E 02         [ 7] 3259 	ld	a,#0x02
   780C 91            [ 4] 3260 	sub	a, c
   780D 38 5C         [12] 3261 	jr	C,00180$
                           3262 ;src/main.c:558: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   780F DD 6E F6      [19] 3263 	ld	l,-10 (ix)
   7812 DD 66 F7      [19] 3264 	ld	h,-9 (ix)
   7815 7E            [ 7] 3265 	ld	a,(hl)
   7816 C6 0B         [ 7] 3266 	add	a, #0x0B
   7818 DD 6E F4      [19] 3267 	ld	l,-12 (ix)
   781B DD 66 F5      [19] 3268 	ld	h,-11 (ix)
   781E 46            [ 7] 3269 	ld	b,(hl)
   781F F5            [11] 3270 	push	af
   7820 33            [ 6] 3271 	inc	sp
   7821 C5            [11] 3272 	push	bc
   7822 33            [ 6] 3273 	inc	sp
   7823 2A 38 65      [16] 3274 	ld	hl,(_mapa)
   7826 E5            [11] 3275 	push	hl
   7827 CD 61 4B      [17] 3276 	call	_getTilePtr
   782A F1            [10] 3277 	pop	af
   782B F1            [10] 3278 	pop	af
   782C 4E            [ 7] 3279 	ld	c,(hl)
   782D 3E 02         [ 7] 3280 	ld	a,#0x02
   782F 91            [ 4] 3281 	sub	a, c
   7830 38 39         [12] 3282 	jr	C,00180$
                           3283 ;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7832 DD 6E F6      [19] 3284 	ld	l,-10 (ix)
   7835 DD 66 F7      [19] 3285 	ld	h,-9 (ix)
   7838 7E            [ 7] 3286 	ld	a,(hl)
   7839 C6 16         [ 7] 3287 	add	a, #0x16
   783B DD 6E F4      [19] 3288 	ld	l,-12 (ix)
   783E DD 66 F5      [19] 3289 	ld	h,-11 (ix)
   7841 46            [ 7] 3290 	ld	b,(hl)
   7842 F5            [11] 3291 	push	af
   7843 33            [ 6] 3292 	inc	sp
   7844 C5            [11] 3293 	push	bc
   7845 33            [ 6] 3294 	inc	sp
   7846 2A 38 65      [16] 3295 	ld	hl,(_mapa)
   7849 E5            [11] 3296 	push	hl
   784A CD 61 4B      [17] 3297 	call	_getTilePtr
   784D F1            [10] 3298 	pop	af
   784E F1            [10] 3299 	pop	af
   784F 4E            [ 7] 3300 	ld	c,(hl)
   7850 3E 02         [ 7] 3301 	ld	a,#0x02
   7852 91            [ 4] 3302 	sub	a, c
   7853 38 16         [12] 3303 	jr	C,00180$
                           3304 ;src/main.c:560: moverEnemigoIzquierda(enemy);
   7855 DD 6E F4      [19] 3305 	ld	l,-12 (ix)
   7858 DD 66 F5      [19] 3306 	ld	h,-11 (ix)
   785B E5            [11] 3307 	push	hl
   785C CD DF 6B      [17] 3308 	call	_moverEnemigoIzquierda
   785F F1            [10] 3309 	pop	af
                           3310 ;src/main.c:561: enemy->mover = SI;
   7860 DD 6E F8      [19] 3311 	ld	l,-8 (ix)
   7863 DD 66 F9      [19] 3312 	ld	h,-7 (ix)
   7866 36 01         [10] 3313 	ld	(hl),#0x01
   7868 C3 0B 79      [10] 3314 	jp	00208$
   786B                    3315 00180$:
                           3316 ;src/main.c:563: moverEnemigoDerecha(enemy);
   786B DD 6E F4      [19] 3317 	ld	l,-12 (ix)
   786E DD 66 F5      [19] 3318 	ld	h,-11 (ix)
   7871 E5            [11] 3319 	push	hl
   7872 CD CF 6B      [17] 3320 	call	_moverEnemigoDerecha
   7875 F1            [10] 3321 	pop	af
                           3322 ;src/main.c:564: enemy->mover = SI;
   7876 DD 6E F8      [19] 3323 	ld	l,-8 (ix)
   7879 DD 66 F9      [19] 3324 	ld	h,-7 (ix)
   787C 36 01         [10] 3325 	ld	(hl),#0x01
   787E C3 0B 79      [10] 3326 	jp	00208$
   7881                    3327 00190$:
                           3328 ;src/main.c:567: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7881 79            [ 4] 3329 	ld	a,c
   7882 C6 04         [ 7] 3330 	add	a, #0x04
   7884 D5            [11] 3331 	push	de
   7885 33            [ 6] 3332 	inc	sp
   7886 F5            [11] 3333 	push	af
   7887 33            [ 6] 3334 	inc	sp
   7888 2A 38 65      [16] 3335 	ld	hl,(_mapa)
   788B E5            [11] 3336 	push	hl
   788C CD 61 4B      [17] 3337 	call	_getTilePtr
   788F F1            [10] 3338 	pop	af
   7890 F1            [10] 3339 	pop	af
   7891 4E            [ 7] 3340 	ld	c,(hl)
   7892 3E 02         [ 7] 3341 	ld	a,#0x02
   7894 91            [ 4] 3342 	sub	a, c
   7895 38 61         [12] 3343 	jr	C,00185$
                           3344 ;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7897 DD 6E F6      [19] 3345 	ld	l,-10 (ix)
   789A DD 66 F7      [19] 3346 	ld	h,-9 (ix)
   789D 7E            [ 7] 3347 	ld	a,(hl)
   789E C6 0B         [ 7] 3348 	add	a, #0x0B
   78A0 47            [ 4] 3349 	ld	b,a
   78A1 DD 6E F4      [19] 3350 	ld	l,-12 (ix)
   78A4 DD 66 F5      [19] 3351 	ld	h,-11 (ix)
   78A7 7E            [ 7] 3352 	ld	a,(hl)
   78A8 C6 04         [ 7] 3353 	add	a, #0x04
   78AA C5            [11] 3354 	push	bc
   78AB 33            [ 6] 3355 	inc	sp
   78AC F5            [11] 3356 	push	af
   78AD 33            [ 6] 3357 	inc	sp
   78AE 2A 38 65      [16] 3358 	ld	hl,(_mapa)
   78B1 E5            [11] 3359 	push	hl
   78B2 CD 61 4B      [17] 3360 	call	_getTilePtr
   78B5 F1            [10] 3361 	pop	af
   78B6 F1            [10] 3362 	pop	af
   78B7 4E            [ 7] 3363 	ld	c,(hl)
   78B8 3E 02         [ 7] 3364 	ld	a,#0x02
   78BA 91            [ 4] 3365 	sub	a, c
   78BB 38 3B         [12] 3366 	jr	C,00185$
                           3367 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78BD DD 6E F6      [19] 3368 	ld	l,-10 (ix)
   78C0 DD 66 F7      [19] 3369 	ld	h,-9 (ix)
   78C3 7E            [ 7] 3370 	ld	a,(hl)
   78C4 C6 16         [ 7] 3371 	add	a, #0x16
   78C6 47            [ 4] 3372 	ld	b,a
   78C7 DD 6E F4      [19] 3373 	ld	l,-12 (ix)
   78CA DD 66 F5      [19] 3374 	ld	h,-11 (ix)
   78CD 7E            [ 7] 3375 	ld	a,(hl)
   78CE C6 04         [ 7] 3376 	add	a, #0x04
   78D0 C5            [11] 3377 	push	bc
   78D1 33            [ 6] 3378 	inc	sp
   78D2 F5            [11] 3379 	push	af
   78D3 33            [ 6] 3380 	inc	sp
   78D4 2A 38 65      [16] 3381 	ld	hl,(_mapa)
   78D7 E5            [11] 3382 	push	hl
   78D8 CD 61 4B      [17] 3383 	call	_getTilePtr
   78DB F1            [10] 3384 	pop	af
   78DC F1            [10] 3385 	pop	af
   78DD 4E            [ 7] 3386 	ld	c,(hl)
   78DE 3E 02         [ 7] 3387 	ld	a,#0x02
   78E0 91            [ 4] 3388 	sub	a, c
   78E1 38 15         [12] 3389 	jr	C,00185$
                           3390 ;src/main.c:570: moverEnemigoDerecha(enemy);
   78E3 DD 6E F4      [19] 3391 	ld	l,-12 (ix)
   78E6 DD 66 F5      [19] 3392 	ld	h,-11 (ix)
   78E9 E5            [11] 3393 	push	hl
   78EA CD CF 6B      [17] 3394 	call	_moverEnemigoDerecha
   78ED F1            [10] 3395 	pop	af
                           3396 ;src/main.c:571: enemy->mover = SI;
   78EE DD 6E F8      [19] 3397 	ld	l,-8 (ix)
   78F1 DD 66 F9      [19] 3398 	ld	h,-7 (ix)
   78F4 36 01         [10] 3399 	ld	(hl),#0x01
   78F6 18 13         [12] 3400 	jr	00208$
   78F8                    3401 00185$:
                           3402 ;src/main.c:574: moverEnemigoIzquierda(enemy);
   78F8 DD 6E F4      [19] 3403 	ld	l,-12 (ix)
   78FB DD 66 F5      [19] 3404 	ld	h,-11 (ix)
   78FE E5            [11] 3405 	push	hl
   78FF CD DF 6B      [17] 3406 	call	_moverEnemigoIzquierda
   7902 F1            [10] 3407 	pop	af
                           3408 ;src/main.c:575: enemy->mover = SI;
   7903 DD 6E F8      [19] 3409 	ld	l,-8 (ix)
   7906 DD 66 F9      [19] 3410 	ld	h,-7 (ix)
   7909 36 01         [10] 3411 	ld	(hl),#0x01
   790B                    3412 00208$:
   790B DD F9         [10] 3413 	ld	sp, ix
   790D DD E1         [14] 3414 	pop	ix
   790F C9            [10] 3415 	ret
                           3416 ;src/main.c:585: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3417 ;	---------------------------------
                           3418 ; Function updateEnemy
                           3419 ; ---------------------------------
   7910                    3420 _updateEnemy::
   7910 DD E5         [15] 3421 	push	ix
   7912 DD 21 00 00   [14] 3422 	ld	ix,#0
   7916 DD 39         [15] 3423 	add	ix,sp
   7918 21 F4 FF      [10] 3424 	ld	hl,#-12
   791B 39            [11] 3425 	add	hl,sp
   791C F9            [ 6] 3426 	ld	sp,hl
                           3427 ;src/main.c:592: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   791D DD 4E 04      [19] 3428 	ld	c,4 (ix)
   7920 DD 46 05      [19] 3429 	ld	b,5 (ix)
   7923 21 15 00      [10] 3430 	ld	hl,#0x0015
   7926 09            [11] 3431 	add	hl,bc
   7927 DD 75 F8      [19] 3432 	ld	-8 (ix),l
   792A DD 74 F9      [19] 3433 	ld	-7 (ix),h
   792D DD 6E F8      [19] 3434 	ld	l,-8 (ix)
   7930 DD 66 F9      [19] 3435 	ld	h,-7 (ix)
   7933 7E            [ 7] 3436 	ld	a,(hl)
   7934 B7            [ 4] 3437 	or	a, a
   7935 28 19         [12] 3438 	jr	Z,00115$
                           3439 ;src/main.c:593: enemy->patrolling = 0;
   7937 21 D4 60      [10] 3440 	ld	hl,#(_enemy + 0x000a)
   793A 36 00         [10] 3441 	ld	(hl),#0x00
                           3442 ;src/main.c:594: engage(actual, prota.x, prota.y);
   793C 3A 57 64      [13] 3443 	ld	a, (#_prota + 1)
   793F 21 56 64      [10] 3444 	ld	hl, #_prota + 0
   7942 56            [ 7] 3445 	ld	d,(hl)
   7943 F5            [11] 3446 	push	af
   7944 33            [ 6] 3447 	inc	sp
   7945 D5            [11] 3448 	push	de
   7946 33            [ 6] 3449 	inc	sp
   7947 C5            [11] 3450 	push	bc
   7948 CD FD 70      [17] 3451 	call	_engage
   794B F1            [10] 3452 	pop	af
   794C F1            [10] 3453 	pop	af
   794D C3 78 7A      [10] 3454 	jp	00117$
   7950                    3455 00115$:
                           3456 ;src/main.c:596: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7950 C5            [11] 3457 	push	bc
   7951 C5            [11] 3458 	push	bc
   7952 CD 4F 6E      [17] 3459 	call	_lookFor
   7955 F1            [10] 3460 	pop	af
   7956 C1            [10] 3461 	pop	bc
                           3462 ;src/main.c:602: actual->patrolling = 0;
   7957 21 0A 00      [10] 3463 	ld	hl,#0x000A
   795A 09            [11] 3464 	add	hl,bc
   795B DD 75 FC      [19] 3465 	ld	-4 (ix),l
   795E DD 74 FD      [19] 3466 	ld	-3 (ix),h
                           3467 ;src/main.c:597: if (actual->patrolling) {
   7961 DD 6E FC      [19] 3468 	ld	l,-4 (ix)
   7964 DD 66 FD      [19] 3469 	ld	h,-3 (ix)
   7967 6E            [ 7] 3470 	ld	l,(hl)
                           3471 ;src/main.c:600: if (actual->in_range) {
   7968 79            [ 4] 3472 	ld	a,c
   7969 C6 10         [ 7] 3473 	add	a, #0x10
   796B 5F            [ 4] 3474 	ld	e,a
   796C 78            [ 4] 3475 	ld	a,b
   796D CE 00         [ 7] 3476 	adc	a, #0x00
   796F 57            [ 4] 3477 	ld	d,a
                           3478 ;src/main.c:608: actual->seek = 1;
   7970 79            [ 4] 3479 	ld	a,c
   7971 C6 13         [ 7] 3480 	add	a, #0x13
   7973 DD 77 F5      [19] 3481 	ld	-11 (ix),a
   7976 78            [ 4] 3482 	ld	a,b
   7977 CE 00         [ 7] 3483 	adc	a, #0x00
   7979 DD 77 F6      [19] 3484 	ld	-10 (ix),a
                           3485 ;src/main.c:597: if (actual->patrolling) {
   797C 7D            [ 4] 3486 	ld	a,l
   797D B7            [ 4] 3487 	or	a, a
   797E CA 40 7A      [10] 3488 	jp	Z,00112$
                           3489 ;src/main.c:599: moverEnemigoPatrol(actual);
   7981 C5            [11] 3490 	push	bc
   7982 D5            [11] 3491 	push	de
   7983 C5            [11] 3492 	push	bc
   7984 CD F1 6B      [17] 3493 	call	_moverEnemigoPatrol
   7987 F1            [10] 3494 	pop	af
   7988 D1            [10] 3495 	pop	de
   7989 C1            [10] 3496 	pop	bc
                           3497 ;src/main.c:600: if (actual->in_range) {
   798A 1A            [ 7] 3498 	ld	a,(de)
   798B B7            [ 4] 3499 	or	a, a
   798C 28 24         [12] 3500 	jr	Z,00104$
                           3501 ;src/main.c:601: engage(actual, prota.x, prota.y);
   798E 3A 57 64      [13] 3502 	ld	a, (#_prota + 1)
   7991 21 56 64      [10] 3503 	ld	hl, #_prota + 0
   7994 56            [ 7] 3504 	ld	d,(hl)
   7995 F5            [11] 3505 	push	af
   7996 33            [ 6] 3506 	inc	sp
   7997 D5            [11] 3507 	push	de
   7998 33            [ 6] 3508 	inc	sp
   7999 C5            [11] 3509 	push	bc
   799A CD FD 70      [17] 3510 	call	_engage
   799D F1            [10] 3511 	pop	af
   799E F1            [10] 3512 	pop	af
                           3513 ;src/main.c:602: actual->patrolling = 0;
   799F DD 6E FC      [19] 3514 	ld	l,-4 (ix)
   79A2 DD 66 FD      [19] 3515 	ld	h,-3 (ix)
   79A5 36 00         [10] 3516 	ld	(hl),#0x00
                           3517 ;src/main.c:603: actual->engage = 1;
   79A7 DD 6E F8      [19] 3518 	ld	l,-8 (ix)
   79AA DD 66 F9      [19] 3519 	ld	h,-7 (ix)
   79AD 36 01         [10] 3520 	ld	(hl),#0x01
   79AF C3 78 7A      [10] 3521 	jp	00117$
   79B2                    3522 00104$:
                           3523 ;src/main.c:604: } else if (actual->seen) {
   79B2 21 11 00      [10] 3524 	ld	hl,#0x0011
   79B5 09            [11] 3525 	add	hl,bc
   79B6 DD 75 FA      [19] 3526 	ld	-6 (ix),l
   79B9 DD 74 FB      [19] 3527 	ld	-5 (ix),h
   79BC DD 6E FA      [19] 3528 	ld	l,-6 (ix)
   79BF DD 66 FB      [19] 3529 	ld	h,-5 (ix)
   79C2 7E            [ 7] 3530 	ld	a,(hl)
   79C3 B7            [ 4] 3531 	or	a, a
   79C4 CA 78 7A      [10] 3532 	jp	Z,00117$
                           3533 ;src/main.c:605: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79C7 3A 57 64      [13] 3534 	ld	a,(#_prota + 1)
   79CA DD 77 F7      [19] 3535 	ld	-9 (ix),a
   79CD 21 56 64      [10] 3536 	ld	hl, #_prota + 0
   79D0 5E            [ 7] 3537 	ld	e,(hl)
   79D1 21 01 00      [10] 3538 	ld	hl,#0x0001
   79D4 09            [11] 3539 	add	hl,bc
   79D5 DD 75 FE      [19] 3540 	ld	-2 (ix),l
   79D8 DD 74 FF      [19] 3541 	ld	-1 (ix),h
   79DB DD 6E FE      [19] 3542 	ld	l,-2 (ix)
   79DE DD 66 FF      [19] 3543 	ld	h,-1 (ix)
   79E1 56            [ 7] 3544 	ld	d,(hl)
   79E2 0A            [ 7] 3545 	ld	a,(bc)
   79E3 DD 77 F4      [19] 3546 	ld	-12 (ix),a
   79E6 C5            [11] 3547 	push	bc
   79E7 2A 38 65      [16] 3548 	ld	hl,(_mapa)
   79EA E5            [11] 3549 	push	hl
   79EB C5            [11] 3550 	push	bc
   79EC DD 7E F7      [19] 3551 	ld	a,-9 (ix)
   79EF F5            [11] 3552 	push	af
   79F0 33            [ 6] 3553 	inc	sp
   79F1 7B            [ 4] 3554 	ld	a,e
   79F2 F5            [11] 3555 	push	af
   79F3 33            [ 6] 3556 	inc	sp
   79F4 D5            [11] 3557 	push	de
   79F5 33            [ 6] 3558 	inc	sp
   79F6 DD 7E F4      [19] 3559 	ld	a,-12 (ix)
   79F9 F5            [11] 3560 	push	af
   79FA 33            [ 6] 3561 	inc	sp
   79FB CD 30 44      [17] 3562 	call	_pathFinding
   79FE 21 08 00      [10] 3563 	ld	hl,#8
   7A01 39            [11] 3564 	add	hl,sp
   7A02 F9            [ 6] 3565 	ld	sp,hl
   7A03 C1            [10] 3566 	pop	bc
                           3567 ;src/main.c:606: actual->p_seek_x = actual->x;
   7A04 21 17 00      [10] 3568 	ld	hl,#0x0017
   7A07 09            [11] 3569 	add	hl,bc
   7A08 EB            [ 4] 3570 	ex	de,hl
   7A09 0A            [ 7] 3571 	ld	a,(bc)
   7A0A 12            [ 7] 3572 	ld	(de),a
                           3573 ;src/main.c:607: actual->p_seek_y = actual->y;
   7A0B 21 18 00      [10] 3574 	ld	hl,#0x0018
   7A0E 09            [11] 3575 	add	hl,bc
   7A0F EB            [ 4] 3576 	ex	de,hl
   7A10 DD 6E FE      [19] 3577 	ld	l,-2 (ix)
   7A13 DD 66 FF      [19] 3578 	ld	h,-1 (ix)
   7A16 7E            [ 7] 3579 	ld	a,(hl)
   7A17 12            [ 7] 3580 	ld	(de),a
                           3581 ;src/main.c:608: actual->seek = 1;
   7A18 DD 6E F5      [19] 3582 	ld	l,-11 (ix)
   7A1B DD 66 F6      [19] 3583 	ld	h,-10 (ix)
   7A1E 36 01         [10] 3584 	ld	(hl),#0x01
                           3585 ;src/main.c:609: actual->iter=0;
   7A20 21 0D 00      [10] 3586 	ld	hl,#0x000D
   7A23 09            [11] 3587 	add	hl,bc
   7A24 AF            [ 4] 3588 	xor	a, a
   7A25 77            [ 7] 3589 	ld	(hl), a
   7A26 23            [ 6] 3590 	inc	hl
   7A27 77            [ 7] 3591 	ld	(hl), a
                           3592 ;src/main.c:610: actual->reversePatrol = NO;
   7A28 21 0B 00      [10] 3593 	ld	hl,#0x000B
   7A2B 09            [11] 3594 	add	hl,bc
   7A2C 36 00         [10] 3595 	ld	(hl),#0x00
                           3596 ;src/main.c:611: actual->patrolling = 0;
   7A2E DD 6E FC      [19] 3597 	ld	l,-4 (ix)
   7A31 DD 66 FD      [19] 3598 	ld	h,-3 (ix)
   7A34 36 00         [10] 3599 	ld	(hl),#0x00
                           3600 ;src/main.c:612: actual->seen = 0;
   7A36 DD 6E FA      [19] 3601 	ld	l,-6 (ix)
   7A39 DD 66 FB      [19] 3602 	ld	h,-5 (ix)
   7A3C 36 00         [10] 3603 	ld	(hl),#0x00
   7A3E 18 38         [12] 3604 	jr	00117$
   7A40                    3605 00112$:
                           3606 ;src/main.c:614: } else if (actual->seek) {
   7A40 DD 6E F5      [19] 3607 	ld	l,-11 (ix)
   7A43 DD 66 F6      [19] 3608 	ld	h,-10 (ix)
   7A46 7E            [ 7] 3609 	ld	a,(hl)
   7A47 B7            [ 4] 3610 	or	a, a
   7A48 28 2E         [12] 3611 	jr	Z,00117$
                           3612 ;src/main.c:615: moverEnemigoSeek(actual);
   7A4A C5            [11] 3613 	push	bc
   7A4B D5            [11] 3614 	push	de
   7A4C C5            [11] 3615 	push	bc
   7A4D CD 58 6F      [17] 3616 	call	_moverEnemigoSeek
   7A50 F1            [10] 3617 	pop	af
   7A51 D1            [10] 3618 	pop	de
   7A52 C1            [10] 3619 	pop	bc
                           3620 ;src/main.c:616: if (actual->in_range) {
   7A53 1A            [ 7] 3621 	ld	a,(de)
   7A54 B7            [ 4] 3622 	or	a, a
   7A55 28 21         [12] 3623 	jr	Z,00117$
                           3624 ;src/main.c:617: engage(actual, prota.x, prota.y);
   7A57 3A 57 64      [13] 3625 	ld	a, (#_prota + 1)
   7A5A 21 56 64      [10] 3626 	ld	hl, #_prota + 0
   7A5D 56            [ 7] 3627 	ld	d,(hl)
   7A5E F5            [11] 3628 	push	af
   7A5F 33            [ 6] 3629 	inc	sp
   7A60 D5            [11] 3630 	push	de
   7A61 33            [ 6] 3631 	inc	sp
   7A62 C5            [11] 3632 	push	bc
   7A63 CD FD 70      [17] 3633 	call	_engage
   7A66 F1            [10] 3634 	pop	af
   7A67 F1            [10] 3635 	pop	af
                           3636 ;src/main.c:618: actual->seek = 0;
   7A68 DD 6E F5      [19] 3637 	ld	l,-11 (ix)
   7A6B DD 66 F6      [19] 3638 	ld	h,-10 (ix)
   7A6E 36 00         [10] 3639 	ld	(hl),#0x00
                           3640 ;src/main.c:619: actual->engage = 1;
   7A70 DD 6E F8      [19] 3641 	ld	l,-8 (ix)
   7A73 DD 66 F9      [19] 3642 	ld	h,-7 (ix)
   7A76 36 01         [10] 3643 	ld	(hl),#0x01
                           3644 ;src/main.c:620: } else if (actual->seen) {
   7A78                    3645 00117$:
   7A78 DD F9         [10] 3646 	ld	sp, ix
   7A7A DD E1         [14] 3647 	pop	ix
   7A7C C9            [10] 3648 	ret
                           3649 ;src/main.c:627: void inicializarEnemy() {
                           3650 ;	---------------------------------
                           3651 ; Function inicializarEnemy
                           3652 ; ---------------------------------
   7A7D                    3653 _inicializarEnemy::
   7A7D DD E5         [15] 3654 	push	ix
   7A7F DD 21 00 00   [14] 3655 	ld	ix,#0
   7A83 DD 39         [15] 3656 	add	ix,sp
   7A85 21 F9 FF      [10] 3657 	ld	hl,#-7
   7A88 39            [11] 3658 	add	hl,sp
   7A89 F9            [ 6] 3659 	ld	sp,hl
                           3660 ;src/main.c:628: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7A8A 3A 3A 65      [13] 3661 	ld	a,(#_num_mapa + 0)
   7A8D C6 02         [ 7] 3662 	add	a, #0x02
   7A8F DD 77 F9      [19] 3663 	ld	-7 (ix),a
                           3664 ;src/main.c:638: actual = enemy;
   7A92 11 CA 60      [10] 3665 	ld	de,#_enemy+0
                           3666 ;src/main.c:639: while(i){
   7A95                    3667 00101$:
   7A95 DD 7E F9      [19] 3668 	ld	a,-7 (ix)
   7A98 B7            [ 4] 3669 	or	a, a
   7A99 CA 9D 7B      [10] 3670 	jp	Z,00104$
                           3671 ;src/main.c:640: --i;
   7A9C DD 35 F9      [23] 3672 	dec	-7 (ix)
                           3673 ;src/main.c:641: actual->x = actual->px = spawnX[i];
   7A9F 4B            [ 4] 3674 	ld	c, e
   7AA0 42            [ 4] 3675 	ld	b, d
   7AA1 03            [ 6] 3676 	inc	bc
   7AA2 03            [ 6] 3677 	inc	bc
   7AA3 3E 5C         [ 7] 3678 	ld	a,#<(_spawnX)
   7AA5 DD 86 F9      [19] 3679 	add	a, -7 (ix)
   7AA8 DD 77 FD      [19] 3680 	ld	-3 (ix),a
   7AAB 3E 65         [ 7] 3681 	ld	a,#>(_spawnX)
   7AAD CE 00         [ 7] 3682 	adc	a, #0x00
   7AAF DD 77 FE      [19] 3683 	ld	-2 (ix),a
   7AB2 DD 6E FD      [19] 3684 	ld	l,-3 (ix)
   7AB5 DD 66 FE      [19] 3685 	ld	h,-2 (ix)
   7AB8 7E            [ 7] 3686 	ld	a,(hl)
   7AB9 02            [ 7] 3687 	ld	(bc),a
   7ABA 12            [ 7] 3688 	ld	(de),a
                           3689 ;src/main.c:642: actual->y = actual->py = spawnY[i];
   7ABB D5            [11] 3690 	push	de
   7ABC FD E1         [14] 3691 	pop	iy
   7ABE FD 23         [10] 3692 	inc	iy
   7AC0 4B            [ 4] 3693 	ld	c, e
   7AC1 42            [ 4] 3694 	ld	b, d
   7AC2 03            [ 6] 3695 	inc	bc
   7AC3 03            [ 6] 3696 	inc	bc
   7AC4 03            [ 6] 3697 	inc	bc
   7AC5 3E 60         [ 7] 3698 	ld	a,#<(_spawnY)
   7AC7 DD 86 F9      [19] 3699 	add	a, -7 (ix)
   7ACA DD 77 FB      [19] 3700 	ld	-5 (ix),a
   7ACD 3E 65         [ 7] 3701 	ld	a,#>(_spawnY)
   7ACF CE 00         [ 7] 3702 	adc	a, #0x00
   7AD1 DD 77 FC      [19] 3703 	ld	-4 (ix),a
   7AD4 DD 6E FB      [19] 3704 	ld	l,-5 (ix)
   7AD7 DD 66 FC      [19] 3705 	ld	h,-4 (ix)
   7ADA 7E            [ 7] 3706 	ld	a,(hl)
   7ADB 02            [ 7] 3707 	ld	(bc),a
   7ADC FD 77 00      [19] 3708 	ld	0 (iy), a
                           3709 ;src/main.c:643: actual->mover  = NO;
   7ADF 21 06 00      [10] 3710 	ld	hl,#0x0006
   7AE2 19            [11] 3711 	add	hl,de
   7AE3 36 00         [10] 3712 	ld	(hl),#0x00
                           3713 ;src/main.c:644: actual->mira   = M_abajo;
   7AE5 21 07 00      [10] 3714 	ld	hl,#0x0007
   7AE8 19            [11] 3715 	add	hl,de
   7AE9 36 03         [10] 3716 	ld	(hl),#0x03
                           3717 ;src/main.c:645: actual->sprite = g_enemy;
   7AEB 21 04 00      [10] 3718 	ld	hl,#0x0004
   7AEE 19            [11] 3719 	add	hl,de
   7AEF 36 3A         [10] 3720 	ld	(hl),#<(_g_enemy)
   7AF1 23            [ 6] 3721 	inc	hl
   7AF2 36 3C         [10] 3722 	ld	(hl),#>(_g_enemy)
                           3723 ;src/main.c:646: actual->muerto = NO;
   7AF4 21 08 00      [10] 3724 	ld	hl,#0x0008
   7AF7 19            [11] 3725 	add	hl,de
   7AF8 36 00         [10] 3726 	ld	(hl),#0x00
                           3727 ;src/main.c:647: actual->muertes = 0;
   7AFA 21 09 00      [10] 3728 	ld	hl,#0x0009
   7AFD 19            [11] 3729 	add	hl,de
   7AFE 36 00         [10] 3730 	ld	(hl),#0x00
                           3731 ;src/main.c:648: actual->patrolling = SI;
   7B00 21 0A 00      [10] 3732 	ld	hl,#0x000A
   7B03 19            [11] 3733 	add	hl,de
   7B04 36 01         [10] 3734 	ld	(hl),#0x01
                           3735 ;src/main.c:649: actual->reversePatrol = NO;
   7B06 21 0B 00      [10] 3736 	ld	hl,#0x000B
   7B09 19            [11] 3737 	add	hl,de
   7B0A 36 00         [10] 3738 	ld	(hl),#0x00
                           3739 ;src/main.c:650: actual->didDamage = 0;
   7B0C 21 16 00      [10] 3740 	ld	hl,#0x0016
   7B0F 19            [11] 3741 	add	hl,de
   7B10 36 00         [10] 3742 	ld	(hl),#0x00
                           3743 ;src/main.c:651: actual->iter = 0;
   7B12 21 0D 00      [10] 3744 	ld	hl,#0x000D
   7B15 19            [11] 3745 	add	hl,de
   7B16 AF            [ 4] 3746 	xor	a, a
   7B17 77            [ 7] 3747 	ld	(hl), a
   7B18 23            [ 6] 3748 	inc	hl
   7B19 77            [ 7] 3749 	ld	(hl), a
                           3750 ;src/main.c:652: actual->lastIter = 0;
   7B1A 21 0F 00      [10] 3751 	ld	hl,#0x000F
   7B1D 19            [11] 3752 	add	hl,de
   7B1E 36 00         [10] 3753 	ld	(hl),#0x00
                           3754 ;src/main.c:653: actual->seen = 0;
   7B20 21 11 00      [10] 3755 	ld	hl,#0x0011
   7B23 19            [11] 3756 	add	hl,de
   7B24 36 00         [10] 3757 	ld	(hl),#0x00
                           3758 ;src/main.c:654: actual->found = 0;
   7B26 21 12 00      [10] 3759 	ld	hl,#0x0012
   7B29 19            [11] 3760 	add	hl,de
   7B2A 36 00         [10] 3761 	ld	(hl),#0x00
                           3762 ;src/main.c:655: actual->engage = 0;
   7B2C 21 15 00      [10] 3763 	ld	hl,#0x0015
   7B2F 19            [11] 3764 	add	hl,de
   7B30 36 00         [10] 3765 	ld	(hl),#0x00
                           3766 ;src/main.c:656: actual->xplot = NO;
   7B32 21 19 00      [10] 3767 	ld	hl,#0x0019
   7B35 19            [11] 3768 	add	hl,de
   7B36 36 00         [10] 3769 	ld	(hl),#0x00
                           3770 ;src/main.c:657: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B38 21 3A 65      [10] 3771 	ld	hl,#_num_mapa + 0
   7B3B 4E            [ 7] 3772 	ld	c, (hl)
   7B3C 0C            [ 4] 3773 	inc	c
   7B3D 06 00         [ 7] 3774 	ld	b,#0x00
   7B3F 69            [ 4] 3775 	ld	l, c
   7B40 60            [ 4] 3776 	ld	h, b
   7B41 29            [11] 3777 	add	hl, hl
   7B42 29            [11] 3778 	add	hl, hl
   7B43 09            [11] 3779 	add	hl, bc
   7B44 4D            [ 4] 3780 	ld	c,l
   7B45 44            [ 4] 3781 	ld	b,h
   7B46 21 78 65      [10] 3782 	ld	hl,#_patrolY
   7B49 09            [11] 3783 	add	hl,bc
   7B4A 7D            [ 4] 3784 	ld	a,l
   7B4B DD 86 F9      [19] 3785 	add	a, -7 (ix)
   7B4E 6F            [ 4] 3786 	ld	l,a
   7B4F 7C            [ 4] 3787 	ld	a,h
   7B50 CE 00         [ 7] 3788 	adc	a, #0x00
   7B52 67            [ 4] 3789 	ld	h,a
   7B53 7E            [ 7] 3790 	ld	a,(hl)
   7B54 DD 77 FA      [19] 3791 	ld	-6 (ix),a
   7B57 21 64 65      [10] 3792 	ld	hl,#_patrolX
   7B5A 09            [11] 3793 	add	hl,bc
   7B5B DD 4E F9      [19] 3794 	ld	c,-7 (ix)
   7B5E 06 00         [ 7] 3795 	ld	b,#0x00
   7B60 09            [11] 3796 	add	hl,bc
   7B61 7E            [ 7] 3797 	ld	a,(hl)
   7B62 DD 77 FF      [19] 3798 	ld	-1 (ix),a
   7B65 DD 6E FB      [19] 3799 	ld	l,-5 (ix)
   7B68 DD 66 FC      [19] 3800 	ld	h,-4 (ix)
   7B6B 4E            [ 7] 3801 	ld	c,(hl)
   7B6C DD 6E FD      [19] 3802 	ld	l,-3 (ix)
   7B6F DD 66 FE      [19] 3803 	ld	h,-2 (ix)
   7B72 46            [ 7] 3804 	ld	b,(hl)
   7B73 D5            [11] 3805 	push	de
   7B74 2A 38 65      [16] 3806 	ld	hl,(_mapa)
   7B77 E5            [11] 3807 	push	hl
   7B78 D5            [11] 3808 	push	de
   7B79 DD 66 FA      [19] 3809 	ld	h,-6 (ix)
   7B7C DD 6E FF      [19] 3810 	ld	l,-1 (ix)
   7B7F E5            [11] 3811 	push	hl
   7B80 79            [ 4] 3812 	ld	a,c
   7B81 F5            [11] 3813 	push	af
   7B82 33            [ 6] 3814 	inc	sp
   7B83 C5            [11] 3815 	push	bc
   7B84 33            [ 6] 3816 	inc	sp
   7B85 CD 30 44      [17] 3817 	call	_pathFinding
   7B88 21 08 00      [10] 3818 	ld	hl,#8
   7B8B 39            [11] 3819 	add	hl,sp
   7B8C F9            [ 6] 3820 	ld	sp,hl
   7B8D D1            [10] 3821 	pop	de
                           3822 ;src/main.c:658: dibujarEnemigo(actual);
   7B8E D5            [11] 3823 	push	de
   7B8F D5            [11] 3824 	push	de
   7B90 CD 12 68      [17] 3825 	call	_dibujarEnemigo
   7B93 F1            [10] 3826 	pop	af
   7B94 D1            [10] 3827 	pop	de
                           3828 ;src/main.c:659: ++actual;
   7B95 21 E3 00      [10] 3829 	ld	hl,#0x00E3
   7B98 19            [11] 3830 	add	hl,de
   7B99 EB            [ 4] 3831 	ex	de,hl
   7B9A C3 95 7A      [10] 3832 	jp	00101$
   7B9D                    3833 00104$:
   7B9D DD F9         [10] 3834 	ld	sp, ix
   7B9F DD E1         [14] 3835 	pop	ix
   7BA1 C9            [10] 3836 	ret
                           3837 ;src/main.c:663: void avanzarMapa() {
                           3838 ;	---------------------------------
                           3839 ; Function avanzarMapa
                           3840 ; ---------------------------------
   7BA2                    3841 _avanzarMapa::
                           3842 ;src/main.c:664: if(num_mapa < NUM_MAPAS -1) {
   7BA2 3A 3A 65      [13] 3843 	ld	a,(#_num_mapa + 0)
   7BA5 D6 02         [ 7] 3844 	sub	a, #0x02
   7BA7 30 34         [12] 3845 	jr	NC,00102$
                           3846 ;src/main.c:665: mapa = mapas[++num_mapa];
   7BA9 01 56 65      [10] 3847 	ld	bc,#_mapas+0
   7BAC 21 3A 65      [10] 3848 	ld	hl, #_num_mapa+0
   7BAF 34            [11] 3849 	inc	(hl)
   7BB0 FD 21 3A 65   [14] 3850 	ld	iy,#_num_mapa
   7BB4 FD 6E 00      [19] 3851 	ld	l,0 (iy)
   7BB7 26 00         [ 7] 3852 	ld	h,#0x00
   7BB9 29            [11] 3853 	add	hl, hl
   7BBA 09            [11] 3854 	add	hl,bc
   7BBB 7E            [ 7] 3855 	ld	a,(hl)
   7BBC FD 21 38 65   [14] 3856 	ld	iy,#_mapa
   7BC0 FD 77 00      [19] 3857 	ld	0 (iy),a
   7BC3 23            [ 6] 3858 	inc	hl
   7BC4 7E            [ 7] 3859 	ld	a,(hl)
   7BC5 32 39 65      [13] 3860 	ld	(#_mapa + 1),a
                           3861 ;src/main.c:666: prota.x = prota.px = 2;
   7BC8 21 58 64      [10] 3862 	ld	hl,#(_prota + 0x0002)
   7BCB 36 02         [10] 3863 	ld	(hl),#0x02
   7BCD 21 56 64      [10] 3864 	ld	hl,#_prota
   7BD0 36 02         [10] 3865 	ld	(hl),#0x02
                           3866 ;src/main.c:667: prota.mover = SI;
   7BD2 21 5C 64      [10] 3867 	ld	hl,#(_prota + 0x0006)
   7BD5 36 01         [10] 3868 	ld	(hl),#0x01
                           3869 ;src/main.c:668: dibujarMapa();
   7BD7 CD 40 65      [17] 3870 	call	_dibujarMapa
                           3871 ;src/main.c:669: inicializarEnemy();
   7BDA C3 7D 7A      [10] 3872 	jp  _inicializarEnemy
   7BDD                    3873 00102$:
                           3874 ;src/main.c:672: menuFin(puntuacion);
   7BDD FD 21 3B 65   [14] 3875 	ld	iy,#_puntuacion
   7BE1 FD 6E 00      [19] 3876 	ld	l,0 (iy)
   7BE4 26 00         [ 7] 3877 	ld	h,#0x00
   7BE6 C3 E5 4B      [10] 3878 	jp  _menuFin
                           3879 ;src/main.c:676: void moverIzquierda() {
                           3880 ;	---------------------------------
                           3881 ; Function moverIzquierda
                           3882 ; ---------------------------------
   7BE9                    3883 _moverIzquierda::
                           3884 ;src/main.c:677: prota.mira = M_izquierda;
   7BE9 01 56 64      [10] 3885 	ld	bc,#_prota+0
   7BEC 21 5D 64      [10] 3886 	ld	hl,#(_prota + 0x0007)
   7BEF 36 01         [10] 3887 	ld	(hl),#0x01
                           3888 ;src/main.c:678: if (!checkCollision(M_izquierda)) {
   7BF1 C5            [11] 3889 	push	bc
   7BF2 3E 01         [ 7] 3890 	ld	a,#0x01
   7BF4 F5            [11] 3891 	push	af
   7BF5 33            [ 6] 3892 	inc	sp
   7BF6 CD A1 66      [17] 3893 	call	_checkCollision
   7BF9 33            [ 6] 3894 	inc	sp
   7BFA C1            [10] 3895 	pop	bc
   7BFB 7D            [ 4] 3896 	ld	a,l
   7BFC B7            [ 4] 3897 	or	a, a
   7BFD C0            [11] 3898 	ret	NZ
                           3899 ;src/main.c:679: prota.x--;
   7BFE 0A            [ 7] 3900 	ld	a,(bc)
   7BFF C6 FF         [ 7] 3901 	add	a,#0xFF
   7C01 02            [ 7] 3902 	ld	(bc),a
                           3903 ;src/main.c:680: prota.mover = SI;
   7C02 21 5C 64      [10] 3904 	ld	hl,#(_prota + 0x0006)
   7C05 36 01         [10] 3905 	ld	(hl),#0x01
                           3906 ;src/main.c:681: prota.sprite = g_hero_left;
   7C07 21 C6 3D      [10] 3907 	ld	hl,#_g_hero_left
   7C0A 22 5A 64      [16] 3908 	ld	((_prota + 0x0004)), hl
   7C0D C9            [10] 3909 	ret
                           3910 ;src/main.c:685: void moverDerecha() {
                           3911 ;	---------------------------------
                           3912 ; Function moverDerecha
                           3913 ; ---------------------------------
   7C0E                    3914 _moverDerecha::
                           3915 ;src/main.c:686: prota.mira = M_derecha;
   7C0E 21 5D 64      [10] 3916 	ld	hl,#(_prota + 0x0007)
   7C11 36 00         [10] 3917 	ld	(hl),#0x00
                           3918 ;src/main.c:687: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C13 AF            [ 4] 3919 	xor	a, a
   7C14 F5            [11] 3920 	push	af
   7C15 33            [ 6] 3921 	inc	sp
   7C16 CD A1 66      [17] 3922 	call	_checkCollision
   7C19 33            [ 6] 3923 	inc	sp
   7C1A 45            [ 4] 3924 	ld	b,l
   7C1B 21 56 64      [10] 3925 	ld	hl, #_prota + 0
   7C1E 4E            [ 7] 3926 	ld	c,(hl)
   7C1F 59            [ 4] 3927 	ld	e,c
   7C20 16 00         [ 7] 3928 	ld	d,#0x00
   7C22 21 07 00      [10] 3929 	ld	hl,#0x0007
   7C25 19            [11] 3930 	add	hl,de
   7C26 11 50 80      [10] 3931 	ld	de, #0x8050
   7C29 29            [11] 3932 	add	hl, hl
   7C2A 3F            [ 4] 3933 	ccf
   7C2B CB 1C         [ 8] 3934 	rr	h
   7C2D CB 1D         [ 8] 3935 	rr	l
   7C2F ED 52         [15] 3936 	sbc	hl, de
   7C31 3E 00         [ 7] 3937 	ld	a,#0x00
   7C33 17            [ 4] 3938 	rla
   7C34 5F            [ 4] 3939 	ld	e,a
   7C35 78            [ 4] 3940 	ld	a,b
   7C36 B7            [ 4] 3941 	or	a,a
   7C37 20 14         [12] 3942 	jr	NZ,00104$
   7C39 B3            [ 4] 3943 	or	a,e
   7C3A 28 11         [12] 3944 	jr	Z,00104$
                           3945 ;src/main.c:688: prota.x++;
   7C3C 0C            [ 4] 3946 	inc	c
   7C3D 21 56 64      [10] 3947 	ld	hl,#_prota
   7C40 71            [ 7] 3948 	ld	(hl),c
                           3949 ;src/main.c:689: prota.mover = SI;
   7C41 21 5C 64      [10] 3950 	ld	hl,#(_prota + 0x0006)
   7C44 36 01         [10] 3951 	ld	(hl),#0x01
                           3952 ;src/main.c:690: prota.sprite = g_hero;
   7C46 21 70 3E      [10] 3953 	ld	hl,#_g_hero
   7C49 22 5A 64      [16] 3954 	ld	((_prota + 0x0004)), hl
   7C4C C9            [10] 3955 	ret
   7C4D                    3956 00104$:
                           3957 ;src/main.c:691: }else if( prota.x + G_HERO_W >= 80){
   7C4D 7B            [ 4] 3958 	ld	a,e
   7C4E B7            [ 4] 3959 	or	a, a
   7C4F C0            [11] 3960 	ret	NZ
                           3961 ;src/main.c:692: avanzarMapa();
   7C50 C3 A2 7B      [10] 3962 	jp  _avanzarMapa
                           3963 ;src/main.c:696: void moverArriba() {
                           3964 ;	---------------------------------
                           3965 ; Function moverArriba
                           3966 ; ---------------------------------
   7C53                    3967 _moverArriba::
                           3968 ;src/main.c:697: prota.mira = M_arriba;
   7C53 21 5D 64      [10] 3969 	ld	hl,#(_prota + 0x0007)
   7C56 36 02         [10] 3970 	ld	(hl),#0x02
                           3971 ;src/main.c:698: if (!checkCollision(M_arriba)) {
   7C58 3E 02         [ 7] 3972 	ld	a,#0x02
   7C5A F5            [11] 3973 	push	af
   7C5B 33            [ 6] 3974 	inc	sp
   7C5C CD A1 66      [17] 3975 	call	_checkCollision
   7C5F 33            [ 6] 3976 	inc	sp
   7C60 7D            [ 4] 3977 	ld	a,l
   7C61 B7            [ 4] 3978 	or	a, a
   7C62 C0            [11] 3979 	ret	NZ
                           3980 ;src/main.c:699: prota.y--;
   7C63 21 57 64      [10] 3981 	ld	hl,#_prota + 1
   7C66 4E            [ 7] 3982 	ld	c,(hl)
   7C67 0D            [ 4] 3983 	dec	c
   7C68 71            [ 7] 3984 	ld	(hl),c
                           3985 ;src/main.c:700: prota.y--;
   7C69 0D            [ 4] 3986 	dec	c
   7C6A 71            [ 7] 3987 	ld	(hl),c
                           3988 ;src/main.c:701: prota.mover  = SI;
   7C6B 21 5C 64      [10] 3989 	ld	hl,#(_prota + 0x0006)
   7C6E 36 01         [10] 3990 	ld	(hl),#0x01
                           3991 ;src/main.c:702: prota.sprite = g_hero_up;
   7C70 21 2C 3D      [10] 3992 	ld	hl,#_g_hero_up
   7C73 22 5A 64      [16] 3993 	ld	((_prota + 0x0004)), hl
   7C76 C9            [10] 3994 	ret
                           3995 ;src/main.c:706: void moverAbajo() {
                           3996 ;	---------------------------------
                           3997 ; Function moverAbajo
                           3998 ; ---------------------------------
   7C77                    3999 _moverAbajo::
                           4000 ;src/main.c:707: prota.mira = M_abajo;
   7C77 21 5D 64      [10] 4001 	ld	hl,#(_prota + 0x0007)
   7C7A 36 03         [10] 4002 	ld	(hl),#0x03
                           4003 ;src/main.c:708: if (!checkCollision(M_abajo) ) {
   7C7C 3E 03         [ 7] 4004 	ld	a,#0x03
   7C7E F5            [11] 4005 	push	af
   7C7F 33            [ 6] 4006 	inc	sp
   7C80 CD A1 66      [17] 4007 	call	_checkCollision
   7C83 33            [ 6] 4008 	inc	sp
   7C84 7D            [ 4] 4009 	ld	a,l
   7C85 B7            [ 4] 4010 	or	a, a
   7C86 C0            [11] 4011 	ret	NZ
                           4012 ;src/main.c:709: prota.y++;
   7C87 01 57 64      [10] 4013 	ld	bc,#_prota + 1
   7C8A 0A            [ 7] 4014 	ld	a,(bc)
   7C8B 3C            [ 4] 4015 	inc	a
   7C8C 02            [ 7] 4016 	ld	(bc),a
                           4017 ;src/main.c:710: prota.y++;
   7C8D 3C            [ 4] 4018 	inc	a
   7C8E 02            [ 7] 4019 	ld	(bc),a
                           4020 ;src/main.c:711: prota.mover  = SI;
   7C8F 21 5C 64      [10] 4021 	ld	hl,#(_prota + 0x0006)
   7C92 36 01         [10] 4022 	ld	(hl),#0x01
                           4023 ;src/main.c:712: prota.sprite = g_hero_down;
   7C94 21 92 3C      [10] 4024 	ld	hl,#_g_hero_down
   7C97 22 5A 64      [16] 4025 	ld	((_prota + 0x0004)), hl
   7C9A C9            [10] 4026 	ret
                           4027 ;src/main.c:719: void intHandler() {
                           4028 ;	---------------------------------
                           4029 ; Function intHandler
                           4030 ; ---------------------------------
   7C9B                    4031 _intHandler::
                           4032 ;src/main.c:720: if (++i == 6) {
   7C9B 21 6E 64      [10] 4033 	ld	hl, #_i+0
   7C9E 34            [11] 4034 	inc	(hl)
   7C9F 3A 6E 64      [13] 4035 	ld	a,(#_i + 0)
   7CA2 D6 06         [ 7] 4036 	sub	a, #0x06
   7CA4 C0            [11] 4037 	ret	NZ
                           4038 ;src/main.c:721: play();
   7CA5 CD 9E 53      [17] 4039 	call	_play
                           4040 ;src/main.c:722: i=0;
   7CA8 21 6E 64      [10] 4041 	ld	hl,#_i + 0
   7CAB 36 00         [10] 4042 	ld	(hl), #0x00
   7CAD C9            [10] 4043 	ret
                           4044 ;src/main.c:726: void inicializarCPC() {
                           4045 ;	---------------------------------
                           4046 ; Function inicializarCPC
                           4047 ; ---------------------------------
   7CAE                    4048 _inicializarCPC::
                           4049 ;src/main.c:727: cpct_disableFirmware();
   7CAE CD 5C 57      [17] 4050 	call	_cpct_disableFirmware
                           4051 ;src/main.c:728: cpct_setVideoMode(0);
   7CB1 2E 00         [ 7] 4052 	ld	l,#0x00
   7CB3 CD 30 57      [17] 4053 	call	_cpct_setVideoMode
                           4054 ;src/main.c:729: cpct_setBorder(HW_BLACK);
   7CB6 21 10 14      [10] 4055 	ld	hl,#0x1410
   7CB9 E5            [11] 4056 	push	hl
   7CBA CD 7C 54      [17] 4057 	call	_cpct_setPALColour
                           4058 ;src/main.c:730: cpct_setPalette(g_palette, 16);
   7CBD 21 10 00      [10] 4059 	ld	hl,#0x0010
   7CC0 E5            [11] 4060 	push	hl
   7CC1 21 60 3E      [10] 4061 	ld	hl,#_g_palette
   7CC4 E5            [11] 4062 	push	hl
   7CC5 CD 59 54      [17] 4063 	call	_cpct_setPalette
   7CC8 C9            [10] 4064 	ret
                           4065 ;src/main.c:735: void inicializarJuego() {
                           4066 ;	---------------------------------
                           4067 ; Function inicializarJuego
                           4068 ; ---------------------------------
   7CC9                    4069 _inicializarJuego::
                           4070 ;src/main.c:736: cambio = 0;
   7CC9 21 6A 64      [10] 4071 	ld	hl,#_cambio + 0
   7CCC 36 00         [10] 4072 	ld	(hl), #0x00
                           4073 ;src/main.c:737: timer = 0;
   7CCE 21 00 00      [10] 4074 	ld	hl,#0x0000
   7CD1 22 6B 64      [16] 4075 	ld	(_timer),hl
                           4076 ;src/main.c:738: parpadeo = 0;
   7CD4 21 69 64      [10] 4077 	ld	hl,#_parpadeo + 0
   7CD7 36 00         [10] 4078 	ld	(hl), #0x00
                           4079 ;src/main.c:740: num_mapa = 0;
   7CD9 21 3A 65      [10] 4080 	ld	hl,#_num_mapa + 0
   7CDC 36 00         [10] 4081 	ld	(hl), #0x00
                           4082 ;src/main.c:741: mapa = mapas[num_mapa];
   7CDE 21 56 65      [10] 4083 	ld	hl, #_mapas + 0
   7CE1 7E            [ 7] 4084 	ld	a,(hl)
   7CE2 FD 21 38 65   [14] 4085 	ld	iy,#_mapa
   7CE6 FD 77 00      [19] 4086 	ld	0 (iy),a
   7CE9 23            [ 6] 4087 	inc	hl
   7CEA 7E            [ 7] 4088 	ld	a,(hl)
   7CEB 32 39 65      [13] 4089 	ld	(#_mapa + 1),a
                           4090 ;src/main.c:742: cpct_etm_setTileset2x4(g_tileset);
   7CEE 21 E0 17      [10] 4091 	ld	hl,#_g_tileset
   7CF1 CD 6D 56      [17] 4092 	call	_cpct_etm_setTileset2x4
                           4093 ;src/main.c:744: dibujarMapa();
   7CF4 CD 40 65      [17] 4094 	call	_dibujarMapa
                           4095 ;src/main.c:747: barraPuntuacionInicial();
   7CF7 CD 85 51      [17] 4096 	call	_barraPuntuacionInicial
                           4097 ;src/main.c:750: prota.x = prota.px = 4;
   7CFA 21 58 64      [10] 4098 	ld	hl,#(_prota + 0x0002)
   7CFD 36 04         [10] 4099 	ld	(hl),#0x04
   7CFF 21 56 64      [10] 4100 	ld	hl,#_prota
   7D02 36 04         [10] 4101 	ld	(hl),#0x04
                           4102 ;src/main.c:751: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D04 21 59 64      [10] 4103 	ld	hl,#(_prota + 0x0003)
   7D07 36 68         [10] 4104 	ld	(hl),#0x68
   7D09 21 57 64      [10] 4105 	ld	hl,#(_prota + 0x0001)
   7D0C 36 68         [10] 4106 	ld	(hl),#0x68
                           4107 ;src/main.c:752: prota.mover  = NO;
   7D0E 21 5C 64      [10] 4108 	ld	hl,#(_prota + 0x0006)
   7D11 36 00         [10] 4109 	ld	(hl),#0x00
                           4110 ;src/main.c:753: prota.mira=M_derecha;
   7D13 21 5D 64      [10] 4111 	ld	hl,#(_prota + 0x0007)
   7D16 36 00         [10] 4112 	ld	(hl),#0x00
                           4113 ;src/main.c:754: prota.sprite = g_hero;
   7D18 21 70 3E      [10] 4114 	ld	hl,#_g_hero
   7D1B 22 5A 64      [16] 4115 	ld	((_prota + 0x0004)), hl
                           4116 ;src/main.c:758: cu.x = cu.px = 0;
   7D1E 21 60 64      [10] 4117 	ld	hl,#(_cu + 0x0002)
   7D21 36 00         [10] 4118 	ld	(hl),#0x00
   7D23 21 5E 64      [10] 4119 	ld	hl,#_cu
   7D26 36 00         [10] 4120 	ld	(hl),#0x00
                           4121 ;src/main.c:759: cu.y = cu.py = 0;
   7D28 21 61 64      [10] 4122 	ld	hl,#(_cu + 0x0003)
   7D2B 36 00         [10] 4123 	ld	(hl),#0x00
   7D2D 21 5F 64      [10] 4124 	ld	hl,#(_cu + 0x0001)
   7D30 36 00         [10] 4125 	ld	(hl),#0x00
                           4126 ;src/main.c:760: cu.lanzado = NO;
   7D32 21 64 64      [10] 4127 	ld	hl,#(_cu + 0x0006)
   7D35 36 00         [10] 4128 	ld	(hl),#0x00
                           4129 ;src/main.c:761: cu.mover = NO;
   7D37 21 67 64      [10] 4130 	ld	hl,#(_cu + 0x0009)
   7D3A 36 00         [10] 4131 	ld	(hl),#0x00
                           4132 ;src/main.c:762: cu.off_bound = NO;
   7D3C 21 68 64      [10] 4133 	ld	hl,#(_cu + 0x000a)
   7D3F 36 00         [10] 4134 	ld	(hl),#0x00
                           4135 ;src/main.c:764: inicializarEnemy();
   7D41 CD 7D 7A      [17] 4136 	call	_inicializarEnemy
                           4137 ;src/main.c:766: dibujarProta();
   7D44 C3 8C 65      [10] 4138 	jp  _dibujarProta
                           4139 ;src/main.c:769: void main(void) {
                           4140 ;	---------------------------------
                           4141 ; Function main
                           4142 ; ---------------------------------
   7D47                    4143 _main::
   7D47 DD E5         [15] 4144 	push	ix
   7D49 DD 21 00 00   [14] 4145 	ld	ix,#0
   7D4D DD 39         [15] 4146 	add	ix,sp
   7D4F 21 F3 FF      [10] 4147 	ld	hl,#-13
   7D52 39            [11] 4148 	add	hl,sp
   7D53 F9            [ 6] 4149 	ld	sp,hl
                           4150 ;src/main.c:774: vidas = 100;
   7D54 21 6D 64      [10] 4151 	ld	hl,#_vidas + 0
   7D57 36 64         [10] 4152 	ld	(hl), #0x64
                           4153 ;src/main.c:776: inicializarCPC();
   7D59 CD AE 7C      [17] 4154 	call	_inicializarCPC
                           4155 ;src/main.c:778: menuInicio();
   7D5C CD A6 50      [17] 4156 	call	_menuInicio
                           4157 ;src/main.c:780: inicializarJuego();
   7D5F CD C9 7C      [17] 4158 	call	_inicializarJuego
                           4159 ;src/main.c:784: while (1) {
   7D62                    4160 00148$:
                           4161 ;src/main.c:785: ++timer;
   7D62 21 6B 64      [10] 4162 	ld	hl, #_timer+0
   7D65 34            [11] 4163 	inc	(hl)
   7D66 20 04         [12] 4164 	jr	NZ,00266$
   7D68 21 6C 64      [10] 4165 	ld	hl, #_timer+1
   7D6B 34            [11] 4166 	inc	(hl)
   7D6C                    4167 00266$:
                           4168 ;src/main.c:786: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7D6C 3A 6B 64      [13] 4169 	ld	a,(#_timer + 0)
   7D6F D6 04         [ 7] 4170 	sub	a, #0x04
   7D71 20 30         [12] 4171 	jr	NZ,00104$
   7D73 3A 6C 64      [13] 4172 	ld	a,(#_timer + 1)
   7D76 B7            [ 4] 4173 	or	a, a
   7D77 20 2A         [12] 4174 	jr	NZ,00104$
   7D79 3A 6A 64      [13] 4175 	ld	a,(#_cambio + 0)
   7D7C B7            [ 4] 4176 	or	a, a
   7D7D 28 24         [12] 4177 	jr	Z,00104$
   7D7F 3E 0C         [ 7] 4178 	ld	a,#0x0C
   7D81 FD 21 6A 64   [14] 4179 	ld	iy,#_cambio
   7D85 FD 96 00      [19] 4180 	sub	a, 0 (iy)
   7D88 38 19         [12] 4181 	jr	C,00104$
                           4182 ;src/main.c:787: timer = 0;
   7D8A 21 00 00      [10] 4183 	ld	hl,#0x0000
   7D8D 22 6B 64      [16] 4184 	ld	(_timer),hl
                           4185 ;src/main.c:788: parpadeo = !parpadeo;
   7D90 3A 69 64      [13] 4186 	ld	a,(#_parpadeo + 0)
   7D93 D6 01         [ 7] 4187 	sub	a,#0x01
   7D95 3E 00         [ 7] 4188 	ld	a,#0x00
   7D97 17            [ 4] 4189 	rla
   7D98 4F            [ 4] 4190 	ld	c,a
   7D99 21 69 64      [10] 4191 	ld	hl,#_parpadeo + 0
   7D9C 71            [ 7] 4192 	ld	(hl), c
                           4193 ;src/main.c:789: cambio ++;
   7D9D 21 6A 64      [10] 4194 	ld	hl, #_cambio+0
   7DA0 34            [11] 4195 	inc	(hl)
   7DA1 18 0C         [12] 4196 	jr	00105$
   7DA3                    4197 00104$:
                           4198 ;src/main.c:790: }else if(cambio == 12){
   7DA3 3A 6A 64      [13] 4199 	ld	a,(#_cambio + 0)
   7DA6 D6 0C         [ 7] 4200 	sub	a, #0x0C
   7DA8 20 05         [12] 4201 	jr	NZ,00105$
                           4202 ;src/main.c:791: cambio = 0;
   7DAA 21 6A 64      [10] 4203 	ld	hl,#_cambio + 0
   7DAD 36 00         [10] 4204 	ld	(hl), #0x00
   7DAF                    4205 00105$:
                           4206 ;src/main.c:793: i = 2 + num_mapa;
   7DAF 21 3A 65      [10] 4207 	ld	hl,#_num_mapa + 0
   7DB2 4E            [ 7] 4208 	ld	c, (hl)
   7DB3 0C            [ 4] 4209 	inc	c
   7DB4 0C            [ 4] 4210 	inc	c
                           4211 ;src/main.c:794: actual = enemy;
                           4212 ;src/main.c:796: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7DB5 C5            [11] 4213 	push	bc
   7DB6 21 00 01      [10] 4214 	ld	hl,#_g_tablatrans
   7DB9 E5            [11] 4215 	push	hl
   7DBA 2A 38 65      [16] 4216 	ld	hl,(_mapa)
   7DBD E5            [11] 4217 	push	hl
   7DBE 21 56 64      [10] 4218 	ld	hl,#_prota
   7DC1 E5            [11] 4219 	push	hl
   7DC2 21 5E 64      [10] 4220 	ld	hl,#_cu
   7DC5 E5            [11] 4221 	push	hl
   7DC6 CD 3A 66      [17] 4222 	call	_comprobarTeclado
   7DC9 21 08 00      [10] 4223 	ld	hl,#8
   7DCC 39            [11] 4224 	add	hl,sp
   7DCD F9            [ 6] 4225 	ld	sp,hl
   7DCE 2A 38 65      [16] 4226 	ld	hl,(_mapa)
   7DD1 E5            [11] 4227 	push	hl
   7DD2 21 5E 64      [10] 4228 	ld	hl,#_cu
   7DD5 E5            [11] 4229 	push	hl
   7DD6 CD 2A 4A      [17] 4230 	call	_moverCuchillo
   7DD9 F1            [10] 4231 	pop	af
   7DDA F1            [10] 4232 	pop	af
   7DDB C1            [10] 4233 	pop	bc
                           4234 ;src/main.c:798: while(i){
   7DDC DD 71 F5      [19] 4235 	ld	-11 (ix),c
   7DDF DD 36 F6 CA   [19] 4236 	ld	-10 (ix),#<(_enemy)
   7DE3 DD 36 F7 60   [19] 4237 	ld	-9 (ix),#>(_enemy)
   7DE7                    4238 00115$:
   7DE7 DD 7E F5      [19] 4239 	ld	a,-11 (ix)
   7DEA B7            [ 4] 4240 	or	a, a
   7DEB 28 6A         [12] 4241 	jr	Z,00117$
                           4242 ;src/main.c:800: --i;
   7DED DD 35 F5      [23] 4243 	dec	-11 (ix)
                           4244 ;src/main.c:801: if(!actual->muerto){
   7DF0 DD 7E F6      [19] 4245 	ld	a,-10 (ix)
   7DF3 C6 08         [ 7] 4246 	add	a, #0x08
   7DF5 DD 77 F8      [19] 4247 	ld	-8 (ix),a
   7DF8 DD 7E F7      [19] 4248 	ld	a,-9 (ix)
   7DFB CE 00         [ 7] 4249 	adc	a, #0x00
   7DFD DD 77 F9      [19] 4250 	ld	-7 (ix),a
   7E00 DD 6E F8      [19] 4251 	ld	l,-8 (ix)
   7E03 DD 66 F9      [19] 4252 	ld	h,-7 (ix)
   7E06 7E            [ 7] 4253 	ld	a,(hl)
   7E07 B7            [ 4] 4254 	or	a, a
   7E08 20 12         [12] 4255 	jr	NZ,00109$
                           4256 ;src/main.c:802: checkEnemyDead(cu.direccion, actual);
   7E0A 21 65 64      [10] 4257 	ld	hl, #_cu + 7
   7E0D 46            [ 7] 4258 	ld	b,(hl)
   7E0E DD 6E F6      [19] 4259 	ld	l,-10 (ix)
   7E11 DD 66 F7      [19] 4260 	ld	h,-9 (ix)
   7E14 E5            [11] 4261 	push	hl
   7E15 C5            [11] 4262 	push	bc
   7E16 33            [ 6] 4263 	inc	sp
   7E17 CD 9E 69      [17] 4264 	call	_checkEnemyDead
   7E1A F1            [10] 4265 	pop	af
   7E1B 33            [ 6] 4266 	inc	sp
   7E1C                    4267 00109$:
                           4268 ;src/main.c:804: if(!actual->muerto){
   7E1C DD 6E F8      [19] 4269 	ld	l,-8 (ix)
   7E1F DD 66 F9      [19] 4270 	ld	h,-7 (ix)
   7E22 7E            [ 7] 4271 	ld	a,(hl)
   7E23 B7            [ 4] 4272 	or	a, a
   7E24 20 1F         [12] 4273 	jr	NZ,00114$
                           4274 ;src/main.c:805: if (!actual->didDamage)
   7E26 DD 7E F6      [19] 4275 	ld	a,-10 (ix)
   7E29 C6 16         [ 7] 4276 	add	a, #0x16
   7E2B 4F            [ 4] 4277 	ld	c,a
   7E2C DD 7E F7      [19] 4278 	ld	a,-9 (ix)
   7E2F CE 00         [ 7] 4279 	adc	a, #0x00
   7E31 47            [ 4] 4280 	ld	b,a
   7E32 0A            [ 7] 4281 	ld	a,(bc)
   7E33 B7            [ 4] 4282 	or	a, a
   7E34 20 0D         [12] 4283 	jr	NZ,00111$
                           4284 ;src/main.c:806: updateEnemy(actual);
   7E36 DD 6E F6      [19] 4285 	ld	l,-10 (ix)
   7E39 DD 66 F7      [19] 4286 	ld	h,-9 (ix)
   7E3C E5            [11] 4287 	push	hl
   7E3D CD 10 79      [17] 4288 	call	_updateEnemy
   7E40 F1            [10] 4289 	pop	af
   7E41 18 02         [12] 4290 	jr	00114$
   7E43                    4291 00111$:
                           4292 ;src/main.c:808: actual->didDamage = 0;
   7E43 AF            [ 4] 4293 	xor	a, a
   7E44 02            [ 7] 4294 	ld	(bc),a
   7E45                    4295 00114$:
                           4296 ;src/main.c:810: ++actual;
   7E45 DD 7E F6      [19] 4297 	ld	a,-10 (ix)
   7E48 C6 E3         [ 7] 4298 	add	a, #0xE3
   7E4A DD 77 F6      [19] 4299 	ld	-10 (ix),a
   7E4D DD 7E F7      [19] 4300 	ld	a,-9 (ix)
   7E50 CE 00         [ 7] 4301 	adc	a, #0x00
   7E52 DD 77 F7      [19] 4302 	ld	-9 (ix),a
   7E55 18 90         [12] 4303 	jr	00115$
   7E57                    4304 00117$:
                           4305 ;src/main.c:813: cpct_waitVSYNC();
   7E57 CD 28 57      [17] 4306 	call	_cpct_waitVSYNC
                           4307 ;src/main.c:816: if (prota.mover) {
   7E5A 01 5C 64      [10] 4308 	ld	bc,#_prota + 6
   7E5D 0A            [ 7] 4309 	ld	a,(bc)
   7E5E B7            [ 4] 4310 	or	a, a
   7E5F 28 07         [12] 4311 	jr	Z,00119$
                           4312 ;src/main.c:817: redibujarProta();
   7E61 C5            [11] 4313 	push	bc
   7E62 CD 26 66      [17] 4314 	call	_redibujarProta
   7E65 C1            [10] 4315 	pop	bc
                           4316 ;src/main.c:818: prota.mover = NO;
   7E66 AF            [ 4] 4317 	xor	a, a
   7E67 02            [ 7] 4318 	ld	(bc),a
   7E68                    4319 00119$:
                           4320 ;src/main.c:820: if(cu.lanzado && cu.mover){
   7E68 21 64 64      [10] 4321 	ld	hl, #(_cu + 0x0006) + 0
   7E6B 4E            [ 7] 4322 	ld	c,(hl)
                           4323 ;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4324 ;src/main.c:820: if(cu.lanzado && cu.mover){
   7E6C 79            [ 4] 4325 	ld	a,c
   7E6D B7            [ 4] 4326 	or	a, a
   7E6E 28 30         [12] 4327 	jr	Z,00124$
   7E70 3A 67 64      [13] 4328 	ld	a, (#(_cu + 0x0009) + 0)
   7E73 B7            [ 4] 4329 	or	a, a
   7E74 28 2A         [12] 4330 	jr	Z,00124$
                           4331 ;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E76 21 5F 64      [10] 4332 	ld	hl, #(_cu + 0x0001) + 0
   7E79 4E            [ 7] 4333 	ld	c,(hl)
   7E7A 21 5E 64      [10] 4334 	ld	hl, #_cu + 0
   7E7D 46            [ 7] 4335 	ld	b,(hl)
   7E7E 21 66 64      [10] 4336 	ld	hl, #(_cu + 0x0008) + 0
   7E81 5E            [ 7] 4337 	ld	e,(hl)
   7E82 2A 38 65      [16] 4338 	ld	hl,(_mapa)
   7E85 E5            [11] 4339 	push	hl
   7E86 21 00 01      [10] 4340 	ld	hl,#_g_tablatrans
   7E89 E5            [11] 4341 	push	hl
   7E8A 21 5E 64      [10] 4342 	ld	hl,#_cu
   7E8D E5            [11] 4343 	push	hl
   7E8E 79            [ 4] 4344 	ld	a,c
   7E8F F5            [11] 4345 	push	af
   7E90 33            [ 6] 4346 	inc	sp
   7E91 C5            [11] 4347 	push	bc
   7E92 33            [ 6] 4348 	inc	sp
   7E93 7B            [ 4] 4349 	ld	a,e
   7E94 F5            [11] 4350 	push	af
   7E95 33            [ 6] 4351 	inc	sp
   7E96 CD 4A 47      [17] 4352 	call	_redibujarCuchillo
   7E99 21 09 00      [10] 4353 	ld	hl,#9
   7E9C 39            [11] 4354 	add	hl,sp
   7E9D F9            [ 6] 4355 	ld	sp,hl
   7E9E 18 32         [12] 4356 	jr	00125$
   7EA0                    4357 00124$:
                           4358 ;src/main.c:822: }else if (cu.lanzado && !cu.mover){
   7EA0 79            [ 4] 4359 	ld	a,c
   7EA1 B7            [ 4] 4360 	or	a, a
   7EA2 28 2E         [12] 4361 	jr	Z,00125$
   7EA4 3A 67 64      [13] 4362 	ld	a, (#(_cu + 0x0009) + 0)
   7EA7 B7            [ 4] 4363 	or	a, a
   7EA8 20 28         [12] 4364 	jr	NZ,00125$
                           4365 ;src/main.c:823: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7EAA 21 5F 64      [10] 4366 	ld	hl, #(_cu + 0x0001) + 0
   7EAD 46            [ 7] 4367 	ld	b,(hl)
   7EAE 21 5E 64      [10] 4368 	ld	hl, #_cu + 0
   7EB1 4E            [ 7] 4369 	ld	c,(hl)
   7EB2 21 66 64      [10] 4370 	ld	hl, #(_cu + 0x0008) + 0
   7EB5 56            [ 7] 4371 	ld	d,(hl)
   7EB6 2A 38 65      [16] 4372 	ld	hl,(_mapa)
   7EB9 E5            [11] 4373 	push	hl
   7EBA C5            [11] 4374 	push	bc
   7EBB D5            [11] 4375 	push	de
   7EBC 33            [ 6] 4376 	inc	sp
   7EBD CD B7 46      [17] 4377 	call	_borrarCuchillo
   7EC0 F1            [10] 4378 	pop	af
   7EC1 F1            [10] 4379 	pop	af
   7EC2 33            [ 6] 4380 	inc	sp
                           4381 ;src/main.c:824: cu.lanzado = NO;
   7EC3 21 64 64      [10] 4382 	ld	hl,#(_cu + 0x0006)
   7EC6 36 00         [10] 4383 	ld	(hl),#0x00
                           4384 ;src/main.c:826: cu.x = 0;
   7EC8 21 5E 64      [10] 4385 	ld	hl,#_cu
   7ECB 36 00         [10] 4386 	ld	(hl),#0x00
                           4387 ;src/main.c:827: cu.y=0;
   7ECD 21 5F 64      [10] 4388 	ld	hl,#(_cu + 0x0001)
   7ED0 36 00         [10] 4389 	ld	(hl),#0x00
   7ED2                    4390 00125$:
                           4391 ;src/main.c:830: i = 2 + num_mapa;
   7ED2 21 3A 65      [10] 4392 	ld	hl,#_num_mapa + 0
   7ED5 4E            [ 7] 4393 	ld	c, (hl)
   7ED6 0C            [ 4] 4394 	inc	c
   7ED7 0C            [ 4] 4395 	inc	c
                           4396 ;src/main.c:831: actual = enemy;
   7ED8 11 CA 60      [10] 4397 	ld	de,#_enemy
                           4398 ;src/main.c:832: while(i){
   7EDB                    4399 00144$:
   7EDB 79            [ 4] 4400 	ld	a,c
   7EDC B7            [ 4] 4401 	or	a, a
   7EDD CA 47 80      [10] 4402 	jp	Z,00146$
                           4403 ;src/main.c:834: --i;
   7EE0 0D            [ 4] 4404 	dec	c
                           4405 ;src/main.c:835: if(actual->mover){
   7EE1 21 06 00      [10] 4406 	ld	hl,#0x0006
   7EE4 19            [11] 4407 	add	hl,de
   7EE5 DD 75 F8      [19] 4408 	ld	-8 (ix),l
   7EE8 DD 74 F9      [19] 4409 	ld	-7 (ix),h
   7EEB DD 6E F8      [19] 4410 	ld	l,-8 (ix)
   7EEE DD 66 F9      [19] 4411 	ld	h,-7 (ix)
   7EF1 46            [ 7] 4412 	ld	b,(hl)
                           4413 ;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7EF2 21 03 00      [10] 4414 	ld	hl,#0x0003
   7EF5 19            [11] 4415 	add	hl,de
   7EF6 DD 75 F6      [19] 4416 	ld	-10 (ix),l
   7EF9 DD 74 F7      [19] 4417 	ld	-9 (ix),h
   7EFC 21 02 00      [10] 4418 	ld	hl,#0x0002
   7EFF 19            [11] 4419 	add	hl,de
   7F00 DD 75 FC      [19] 4420 	ld	-4 (ix),l
   7F03 DD 74 FD      [19] 4421 	ld	-3 (ix),h
                           4422 ;src/main.c:835: if(actual->mover){
   7F06 78            [ 4] 4423 	ld	a,b
   7F07 B7            [ 4] 4424 	or	a, a
   7F08 28 22         [12] 4425 	jr	Z,00128$
                           4426 ;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F0A DD 6E F6      [19] 4427 	ld	l,-10 (ix)
   7F0D DD 66 F7      [19] 4428 	ld	h,-9 (ix)
   7F10 7E            [ 7] 4429 	ld	a,(hl)
   7F11 DD 77 F5      [19] 4430 	ld	-11 (ix),a
   7F14 DD 6E FC      [19] 4431 	ld	l,-4 (ix)
   7F17 DD 66 FD      [19] 4432 	ld	h,-3 (ix)
   7F1A 46            [ 7] 4433 	ld	b,(hl)
   7F1B C5            [11] 4434 	push	bc
   7F1C D5            [11] 4435 	push	de
   7F1D D5            [11] 4436 	push	de
   7F1E DD 7E F5      [19] 4437 	ld	a,-11 (ix)
   7F21 F5            [11] 4438 	push	af
   7F22 33            [ 6] 4439 	inc	sp
   7F23 C5            [11] 4440 	push	bc
   7F24 33            [ 6] 4441 	inc	sp
   7F25 CD 6D 69      [17] 4442 	call	_redibujarEnemigo
   7F28 F1            [10] 4443 	pop	af
   7F29 F1            [10] 4444 	pop	af
   7F2A D1            [10] 4445 	pop	de
   7F2B C1            [10] 4446 	pop	bc
   7F2C                    4447 00128$:
                           4448 ;src/main.c:839: if (actual->muerto && actual->muertes == 0){
   7F2C 21 08 00      [10] 4449 	ld	hl,#0x0008
   7F2F 19            [11] 4450 	add	hl,de
   7F30 DD 75 FE      [19] 4451 	ld	-2 (ix),l
   7F33 DD 74 FF      [19] 4452 	ld	-1 (ix),h
   7F36 DD 6E FE      [19] 4453 	ld	l,-2 (ix)
   7F39 DD 66 FF      [19] 4454 	ld	h,-1 (ix)
   7F3C 7E            [ 7] 4455 	ld	a,(hl)
   7F3D B7            [ 4] 4456 	or	a, a
   7F3E CA C2 7F      [10] 4457 	jp	Z,00130$
   7F41 21 09 00      [10] 4458 	ld	hl,#0x0009
   7F44 19            [11] 4459 	add	hl,de
   7F45 E3            [19] 4460 	ex	(sp), hl
   7F46 E1            [10] 4461 	pop	hl
   7F47 E5            [11] 4462 	push	hl
   7F48 7E            [ 7] 4463 	ld	a,(hl)
   7F49 B7            [ 4] 4464 	or	a, a
   7F4A 20 76         [12] 4465 	jr	NZ,00130$
                           4466 ;src/main.c:840: timer = 3;
   7F4C 21 03 00      [10] 4467 	ld	hl,#0x0003
   7F4F 22 6B 64      [16] 4468 	ld	(_timer),hl
                           4469 ;src/main.c:841: cambio++;
   7F52 FD 21 6A 64   [14] 4470 	ld	iy,#_cambio
   7F56 FD 34 00      [23] 4471 	inc	0 (iy)
                           4472 ;src/main.c:842: parpadeo = 1;
   7F59 FD 21 69 64   [14] 4473 	ld	iy,#_parpadeo
   7F5D FD 36 00 01   [19] 4474 	ld	0 (iy),#0x01
                           4475 ;src/main.c:843: borrarEnemigo((*actual).x, (*actual).y);
   7F61 2E 01         [ 7] 4476 	ld	l, #0x01
   7F63 19            [11] 4477 	add	hl,de
   7F64 DD 75 FA      [19] 4478 	ld	-6 (ix),l
   7F67 DD 74 FB      [19] 4479 	ld	-5 (ix),h
   7F6A DD 6E FA      [19] 4480 	ld	l,-6 (ix)
   7F6D DD 66 FB      [19] 4481 	ld	h,-5 (ix)
   7F70 46            [ 7] 4482 	ld	b,(hl)
   7F71 1A            [ 7] 4483 	ld	a,(de)
   7F72 C5            [11] 4484 	push	bc
   7F73 D5            [11] 4485 	push	de
   7F74 C5            [11] 4486 	push	bc
   7F75 33            [ 6] 4487 	inc	sp
   7F76 F5            [11] 4488 	push	af
   7F77 33            [ 6] 4489 	inc	sp
   7F78 CD F8 68      [17] 4490 	call	_borrarEnemigo
   7F7B F1            [10] 4491 	pop	af
   7F7C D1            [10] 4492 	pop	de
   7F7D C1            [10] 4493 	pop	bc
                           4494 ;src/main.c:844: puntuacion_aux = puntuacion;
   7F7E FD 21 3B 65   [14] 4495 	ld	iy,#_puntuacion
   7F82 FD 6E 00      [19] 4496 	ld	l,0 (iy)
   7F85 26 00         [ 7] 4497 	ld	h,#0x00
                           4498 ;src/main.c:845: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7F87 C5            [11] 4499 	push	bc
   7F88 D5            [11] 4500 	push	de
   7F89 E5            [11] 4501 	push	hl
   7F8A CD 8B 53      [17] 4502 	call	_aumentarPuntuacion
   7F8D F1            [10] 4503 	pop	af
   7F8E D1            [10] 4504 	pop	de
   7F8F C1            [10] 4505 	pop	bc
   7F90 FD 21 3B 65   [14] 4506 	ld	iy,#_puntuacion
   7F94 FD 75 00      [19] 4507 	ld	0 (iy),l
                           4508 ;src/main.c:846: modificarPuntuacion(puntuacion);
   7F97 FD 21 3B 65   [14] 4509 	ld	iy,#_puntuacion
   7F9B FD 6E 00      [19] 4510 	ld	l,0 (iy)
   7F9E 26 00         [ 7] 4511 	ld	h,#0x00
   7FA0 C5            [11] 4512 	push	bc
   7FA1 D5            [11] 4513 	push	de
   7FA2 E5            [11] 4514 	push	hl
   7FA3 CD 21 52      [17] 4515 	call	_modificarPuntuacion
   7FA6 F1            [10] 4516 	pop	af
   7FA7 D1            [10] 4517 	pop	de
   7FA8 C1            [10] 4518 	pop	bc
                           4519 ;src/main.c:847: actual->mover = NO;
   7FA9 DD 6E F8      [19] 4520 	ld	l,-8 (ix)
   7FAC DD 66 F9      [19] 4521 	ld	h,-7 (ix)
   7FAF 36 00         [10] 4522 	ld	(hl),#0x00
                           4523 ;src/main.c:848: actual->muertes++;
   7FB1 E1            [10] 4524 	pop	hl
   7FB2 E5            [11] 4525 	push	hl
   7FB3 46            [ 7] 4526 	ld	b,(hl)
   7FB4 04            [ 4] 4527 	inc	b
   7FB5 E1            [10] 4528 	pop	hl
   7FB6 E5            [11] 4529 	push	hl
   7FB7 70            [ 7] 4530 	ld	(hl),b
                           4531 ;src/main.c:849: actual->x = 0;
   7FB8 AF            [ 4] 4532 	xor	a, a
   7FB9 12            [ 7] 4533 	ld	(de),a
                           4534 ;src/main.c:850: actual->y = 0;
   7FBA DD 6E FA      [19] 4535 	ld	l,-6 (ix)
   7FBD DD 66 FB      [19] 4536 	ld	h,-5 (ix)
   7FC0 36 00         [10] 4537 	ld	(hl),#0x00
   7FC2                    4538 00130$:
                           4539 ;src/main.c:852: if(parpadeo && actual->muerto && !actual->xplot){
   7FC2 21 19 00      [10] 4540 	ld	hl,#0x0019
   7FC5 19            [11] 4541 	add	hl,de
   7FC6 DD 75 FA      [19] 4542 	ld	-6 (ix),l
   7FC9 DD 74 FB      [19] 4543 	ld	-5 (ix),h
   7FCC 3A 69 64      [13] 4544 	ld	a,(#_parpadeo + 0)
   7FCF B7            [ 4] 4545 	or	a, a
   7FD0 28 1F         [12] 4546 	jr	Z,00140$
   7FD2 DD 6E FE      [19] 4547 	ld	l,-2 (ix)
   7FD5 DD 66 FF      [19] 4548 	ld	h,-1 (ix)
   7FD8 7E            [ 7] 4549 	ld	a,(hl)
   7FD9 B7            [ 4] 4550 	or	a, a
   7FDA 28 15         [12] 4551 	jr	Z,00140$
   7FDC DD 6E FA      [19] 4552 	ld	l,-6 (ix)
   7FDF DD 66 FB      [19] 4553 	ld	h,-5 (ix)
   7FE2 7E            [ 7] 4554 	ld	a,(hl)
   7FE3 B7            [ 4] 4555 	or	a, a
   7FE4 20 0B         [12] 4556 	jr	NZ,00140$
                           4557 ;src/main.c:853: dibujarExplosion(actual);
   7FE6 C5            [11] 4558 	push	bc
   7FE7 D5            [11] 4559 	push	de
   7FE8 D5            [11] 4560 	push	de
   7FE9 CD 4A 68      [17] 4561 	call	_dibujarExplosion
   7FEC F1            [10] 4562 	pop	af
   7FED D1            [10] 4563 	pop	de
   7FEE C1            [10] 4564 	pop	bc
   7FEF 18 4E         [12] 4565 	jr	00141$
   7FF1                    4566 00140$:
                           4567 ;src/main.c:854: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   7FF1 3A 69 64      [13] 4568 	ld	a,(#_parpadeo + 0)
   7FF4 B7            [ 4] 4569 	or	a, a
   7FF5 20 48         [12] 4570 	jr	NZ,00141$
   7FF7 DD 6E FE      [19] 4571 	ld	l,-2 (ix)
   7FFA DD 66 FF      [19] 4572 	ld	h,-1 (ix)
   7FFD 7E            [ 7] 4573 	ld	a,(hl)
   7FFE B7            [ 4] 4574 	or	a, a
   7FFF 28 3E         [12] 4575 	jr	Z,00141$
   8001 3E 0C         [ 7] 4576 	ld	a,#0x0C
   8003 FD 21 6A 64   [14] 4577 	ld	iy,#_cambio
   8007 FD 96 00      [19] 4578 	sub	a, 0 (iy)
   800A 38 33         [12] 4579 	jr	C,00141$
   800C DD 6E FA      [19] 4580 	ld	l,-6 (ix)
   800F DD 66 FB      [19] 4581 	ld	h,-5 (ix)
   8012 7E            [ 7] 4582 	ld	a,(hl)
   8013 B7            [ 4] 4583 	or	a, a
   8014 20 29         [12] 4584 	jr	NZ,00141$
                           4585 ;src/main.c:855: borrarExplosion((*actual).px, (*actual).py);
   8016 DD 6E F6      [19] 4586 	ld	l,-10 (ix)
   8019 DD 66 F7      [19] 4587 	ld	h,-9 (ix)
   801C 7E            [ 7] 4588 	ld	a,(hl)
   801D DD 6E FC      [19] 4589 	ld	l,-4 (ix)
   8020 DD 66 FD      [19] 4590 	ld	h,-3 (ix)
   8023 46            [ 7] 4591 	ld	b,(hl)
   8024 C5            [11] 4592 	push	bc
   8025 D5            [11] 4593 	push	de
   8026 F5            [11] 4594 	push	af
   8027 33            [ 6] 4595 	inc	sp
   8028 C5            [11] 4596 	push	bc
   8029 33            [ 6] 4597 	inc	sp
   802A CD 83 68      [17] 4598 	call	_borrarExplosion
   802D F1            [10] 4599 	pop	af
   802E D1            [10] 4600 	pop	de
   802F C1            [10] 4601 	pop	bc
                           4602 ;src/main.c:856: if(cambio == 12){
   8030 3A 6A 64      [13] 4603 	ld	a,(#_cambio + 0)
   8033 D6 0C         [ 7] 4604 	sub	a, #0x0C
   8035 20 08         [12] 4605 	jr	NZ,00141$
                           4606 ;src/main.c:857: actual->xplot = SI;
   8037 DD 6E FA      [19] 4607 	ld	l,-6 (ix)
   803A DD 66 FB      [19] 4608 	ld	h,-5 (ix)
   803D 36 01         [10] 4609 	ld	(hl),#0x01
   803F                    4610 00141$:
                           4611 ;src/main.c:860: ++actual;
   803F 21 E3 00      [10] 4612 	ld	hl,#0x00E3
   8042 19            [11] 4613 	add	hl,de
   8043 EB            [ 4] 4614 	ex	de,hl
   8044 C3 DB 7E      [10] 4615 	jp	00144$
   8047                    4616 00146$:
                           4617 ;src/main.c:862: cpct_waitVSYNC();
   8047 CD 28 57      [17] 4618 	call	_cpct_waitVSYNC
   804A C3 62 7D      [10] 4619 	jp	00148$
                           4620 	.area _CODE
                           4621 	.area _INITIALIZER
   653C                    4622 __xinit__mapa:
   653C 00 00              4623 	.dw #0x0000
   653E                    4624 __xinit__num_mapa:
   653E 00                 4625 	.db #0x00	; 0
   653F                    4626 __xinit__puntuacion:
   653F 00                 4627 	.db #0x00	; 0
                           4628 	.area _CABS (ABS)
