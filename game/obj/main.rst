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
                             67 	.globl _vidas
                             68 	.globl _puntuacion
                             69 	.globl _num_mapa
                             70 	.globl _mapa
                             71 	.globl _i
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
   6060                      87 _enemy::
   6060                      88 	.ds 904
   63E8                      89 _prota::
   63E8                      90 	.ds 8
   63F0                      91 _cu::
   63F0                      92 	.ds 11
   63FB                      93 _i::
   63FB                      94 	.ds 1
                             95 ;--------------------------------------------------------
                             96 ; ram data
                             97 ;--------------------------------------------------------
                             98 	.area _INITIALIZED
   64C5                      99 _mapa::
   64C5                     100 	.ds 2
   64C7                     101 _num_mapa::
   64C7                     102 	.ds 1
   64C8                     103 _puntuacion::
   64C8                     104 	.ds 1
   64C9                     105 _vidas::
   64C9                     106 	.ds 1
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
   64CF                     172 _dibujarMapa::
                            173 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   64CF 2A C5 64      [16]  174 	ld	hl,(_mapa)
   64D2 E5            [11]  175 	push	hl
   64D3 21 F0 C0      [10]  176 	ld	hl,#0xC0F0
   64D6 E5            [11]  177 	push	hl
   64D7 21 2C 28      [10]  178 	ld	hl,#0x282C
   64DA E5            [11]  179 	push	hl
   64DB 2E 00         [ 7]  180 	ld	l, #0x00
   64DD E5            [11]  181 	push	hl
   64DE AF            [ 4]  182 	xor	a, a
   64DF F5            [11]  183 	push	af
   64E0 33            [ 6]  184 	inc	sp
   64E1 CD E7 54      [17]  185 	call	_cpct_etm_drawTileBox2x4
   64E4 C9            [10]  186 	ret
   64E5                     187 _mapas:
   64E5 C0 10               188 	.dw _g_map1
   64E7 E0 09               189 	.dw _g_map2
   64E9 00 03               190 	.dw _g_map3
   64EB                     191 _spawnX:
   64EB 24                  192 	.db #0x24	; 36
   64EC 47                  193 	.db #0x47	; 71	'G'
   64ED 30                  194 	.db #0x30	; 48	'0'
   64EE 18                  195 	.db #0x18	; 24
   64EF                     196 _spawnY:
   64EF 2C                  197 	.db #0x2C	; 44
   64F0 66                  198 	.db #0x66	; 102	'f'
   64F1 9A                  199 	.db #0x9A	; 154
   64F2 40                  200 	.db #0x40	; 64
   64F3                     201 _patrolX:
   64F3 00                  202 	.db #0x00	; 0
   64F4 00                  203 	.db #0x00	; 0
   64F5 00                  204 	.db #0x00	; 0
   64F6 00                  205 	.db #0x00	; 0
   64F7 00                  206 	.db #0x00	; 0
   64F8 42                  207 	.db #0x42	; 66	'B'
   64F9 33                  208 	.db #0x33	; 51	'3'
   64FA 00                  209 	.db #0x00	; 0
   64FB 00                  210 	.db #0x00	; 0
   64FC 00                  211 	.db 0x00
   64FD 34                  212 	.db #0x34	; 52	'4'
   64FE 33                  213 	.db #0x33	; 51	'3'
   64FF 14                  214 	.db #0x14	; 20
   6500 00                  215 	.db #0x00	; 0
   6501 00                  216 	.db 0x00
   6502 38                  217 	.db #0x38	; 56	'8'
   6503 3C                  218 	.db #0x3C	; 60
   6504 23                  219 	.db #0x23	; 35
   6505 18                  220 	.db #0x18	; 24
   6506 00                  221 	.db 0x00
   6507                     222 _patrolY:
   6507 00                  223 	.db #0x00	; 0
   6508 00                  224 	.db #0x00	; 0
   6509 00                  225 	.db #0x00	; 0
   650A 00                  226 	.db #0x00	; 0
   650B 00                  227 	.db 0x00
   650C 5E                  228 	.db #0x5E	; 94
   650D A6                  229 	.db #0xA6	; 166
   650E 00                  230 	.db #0x00	; 0
   650F 00                  231 	.db #0x00	; 0
   6510 00                  232 	.db 0x00
   6511 A0                  233 	.db #0xA0	; 160
   6512 66                  234 	.db #0x66	; 102	'f'
   6513 2C                  235 	.db #0x2C	; 44
   6514 00                  236 	.db #0x00	; 0
   6515 00                  237 	.db 0x00
   6516 AE                  238 	.db #0xAE	; 174
   6517 66                  239 	.db #0x66	; 102	'f'
   6518 22                  240 	.db #0x22	; 34
   6519 86                  241 	.db #0x86	; 134
   651A 00                  242 	.db 0x00
                            243 ;src/main.c:118: void dibujarProta() {
                            244 ;	---------------------------------
                            245 ; Function dibujarProta
                            246 ; ---------------------------------
   651B                     247 _dibujarProta::
                            248 ;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   651B 21 E9 63      [10]  249 	ld	hl, #_prota + 1
   651E 56            [ 7]  250 	ld	d,(hl)
   651F 21 E8 63      [10]  251 	ld	hl, #_prota + 0
   6522 46            [ 7]  252 	ld	b,(hl)
   6523 D5            [11]  253 	push	de
   6524 33            [ 6]  254 	inc	sp
   6525 C5            [11]  255 	push	bc
   6526 33            [ 6]  256 	inc	sp
   6527 21 00 C0      [10]  257 	ld	hl,#0xC000
   652A E5            [11]  258 	push	hl
   652B CD 05 60      [17]  259 	call	_cpct_getScreenPtr
   652E EB            [ 4]  260 	ex	de,hl
                            261 ;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   652F ED 4B EC 63   [20]  262 	ld	bc, (#_prota + 4)
   6533 21 00 01      [10]  263 	ld	hl,#_g_tablatrans
   6536 E5            [11]  264 	push	hl
   6537 21 07 16      [10]  265 	ld	hl,#0x1607
   653A E5            [11]  266 	push	hl
   653B D5            [11]  267 	push	de
   653C C5            [11]  268 	push	bc
   653D CD 25 60      [17]  269 	call	_cpct_drawSpriteMaskedAlignedTable
   6540 C9            [10]  270 	ret
                            271 ;src/main.c:123: void borrarProta() {
                            272 ;	---------------------------------
                            273 ; Function borrarProta
                            274 ; ---------------------------------
   6541                     275 _borrarProta::
   6541 DD E5         [15]  276 	push	ix
   6543 DD 21 00 00   [14]  277 	ld	ix,#0
   6547 DD 39         [15]  278 	add	ix,sp
   6549 F5            [11]  279 	push	af
   654A 3B            [ 6]  280 	dec	sp
                            281 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   654B 21 EA 63      [10]  282 	ld	hl, #_prota + 2
   654E 4E            [ 7]  283 	ld	c,(hl)
   654F 79            [ 4]  284 	ld	a,c
   6550 E6 01         [ 7]  285 	and	a, #0x01
   6552 47            [ 4]  286 	ld	b,a
   6553 04            [ 4]  287 	inc	b
   6554 04            [ 4]  288 	inc	b
   6555 04            [ 4]  289 	inc	b
   6556 04            [ 4]  290 	inc	b
                            291 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6557 21 EB 63      [10]  292 	ld	hl, #_prota + 3
   655A 5E            [ 7]  293 	ld	e,(hl)
   655B CB 4B         [ 8]  294 	bit	1, e
   655D 28 04         [12]  295 	jr	Z,00103$
   655F 3E 01         [ 7]  296 	ld	a,#0x01
   6561 18 02         [12]  297 	jr	00104$
   6563                     298 00103$:
   6563 3E 00         [ 7]  299 	ld	a,#0x00
   6565                     300 00104$:
   6565 C6 06         [ 7]  301 	add	a, #0x06
   6567 DD 77 FD      [19]  302 	ld	-3 (ix),a
                            303 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   656A FD 2A C5 64   [20]  304 	ld	iy,(_mapa)
   656E 16 00         [ 7]  305 	ld	d,#0x00
   6570 7B            [ 4]  306 	ld	a,e
   6571 C6 E8         [ 7]  307 	add	a,#0xE8
   6573 DD 77 FE      [19]  308 	ld	-2 (ix),a
   6576 7A            [ 4]  309 	ld	a,d
   6577 CE FF         [ 7]  310 	adc	a,#0xFF
   6579 DD 77 FF      [19]  311 	ld	-1 (ix),a
   657C DD 6E FE      [19]  312 	ld	l,-2 (ix)
   657F DD 66 FF      [19]  313 	ld	h,-1 (ix)
   6582 DD CB FF 7E   [20]  314 	bit	7, -1 (ix)
   6586 28 04         [12]  315 	jr	Z,00105$
   6588 21 EB FF      [10]  316 	ld	hl,#0xFFEB
   658B 19            [11]  317 	add	hl,de
   658C                     318 00105$:
   658C CB 2C         [ 8]  319 	sra	h
   658E CB 1D         [ 8]  320 	rr	l
   6590 CB 2C         [ 8]  321 	sra	h
   6592 CB 1D         [ 8]  322 	rr	l
   6594 55            [ 4]  323 	ld	d,l
   6595 CB 39         [ 8]  324 	srl	c
   6597 FD E5         [15]  325 	push	iy
   6599 21 F0 C0      [10]  326 	ld	hl,#0xC0F0
   659C E5            [11]  327 	push	hl
   659D 3E 28         [ 7]  328 	ld	a,#0x28
   659F F5            [11]  329 	push	af
   65A0 33            [ 6]  330 	inc	sp
   65A1 DD 7E FD      [19]  331 	ld	a,-3 (ix)
   65A4 F5            [11]  332 	push	af
   65A5 33            [ 6]  333 	inc	sp
   65A6 C5            [11]  334 	push	bc
   65A7 33            [ 6]  335 	inc	sp
   65A8 D5            [11]  336 	push	de
   65A9 33            [ 6]  337 	inc	sp
   65AA 79            [ 4]  338 	ld	a,c
   65AB F5            [11]  339 	push	af
   65AC 33            [ 6]  340 	inc	sp
   65AD CD E7 54      [17]  341 	call	_cpct_etm_drawTileBox2x4
   65B0 DD F9         [10]  342 	ld	sp, ix
   65B2 DD E1         [14]  343 	pop	ix
   65B4 C9            [10]  344 	ret
                            345 ;src/main.c:135: void redibujarProta() {
                            346 ;	---------------------------------
                            347 ; Function redibujarProta
                            348 ; ---------------------------------
   65B5                     349 _redibujarProta::
                            350 ;src/main.c:136: borrarProta();
   65B5 CD 41 65      [17]  351 	call	_borrarProta
                            352 ;src/main.c:137: prota.px = prota.x;
   65B8 01 EA 63      [10]  353 	ld	bc,#_prota + 2
   65BB 3A E8 63      [13]  354 	ld	a, (#_prota + 0)
   65BE 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:138: prota.py = prota.y;
   65BF 01 EB 63      [10]  357 	ld	bc,#_prota + 3
   65C2 3A E9 63      [13]  358 	ld	a, (#_prota + 1)
   65C5 02            [ 7]  359 	ld	(bc),a
                            360 ;src/main.c:139: dibujarProta();
   65C6 C3 1B 65      [10]  361 	jp  _dibujarProta
                            362 ;src/main.c:142: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            363 ;	---------------------------------
                            364 ; Function comprobarTeclado
                            365 ; ---------------------------------
   65C9                     366 _comprobarTeclado::
                            367 ;src/main.c:143: cpct_scanKeyboard_if();
   65C9 CD 3F 56      [17]  368 	call	_cpct_scanKeyboard_if
                            369 ;src/main.c:145: if (cpct_isAnyKeyPressed()) {
   65CC CD 32 56      [17]  370 	call	_cpct_isAnyKeyPressed
   65CF 7D            [ 4]  371 	ld	a,l
   65D0 B7            [ 4]  372 	or	a, a
   65D1 C8            [11]  373 	ret	Z
                            374 ;src/main.c:146: if (cpct_isKeyPressed(Key_CursorLeft)){
   65D2 21 01 01      [10]  375 	ld	hl,#0x0101
   65D5 CD 06 54      [17]  376 	call	_cpct_isKeyPressed
   65D8 7D            [ 4]  377 	ld	a,l
   65D9 B7            [ 4]  378 	or	a, a
                            379 ;src/main.c:147: moverIzquierda();
   65DA C2 D6 7A      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   65DD 21 00 02      [10]  382 	ld	hl,#0x0200
   65E0 CD 06 54      [17]  383 	call	_cpct_isKeyPressed
   65E3 7D            [ 4]  384 	ld	a,l
   65E4 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   65E5 C2 FB 7A      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   65E8 21 00 01      [10]  389 	ld	hl,#0x0100
   65EB CD 06 54      [17]  390 	call	_cpct_isKeyPressed
   65EE 7D            [ 4]  391 	ld	a,l
   65EF B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   65F0 C2 40 7B      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   65F3 21 00 04      [10]  396 	ld	hl,#0x0400
   65F6 CD 06 54      [17]  397 	call	_cpct_isKeyPressed
   65F9 7D            [ 4]  398 	ld	a,l
   65FA B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   65FB C2 64 7B      [10]  401 	jp	NZ,_moverAbajo
                            402 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_Space)){
   65FE 21 05 80      [10]  403 	ld	hl,#0x8005
   6601 CD 06 54      [17]  404 	call	_cpct_isKeyPressed
   6604 7D            [ 4]  405 	ld	a,l
   6605 B7            [ 4]  406 	or	a, a
   6606 C8            [11]  407 	ret	Z
                            408 ;src/main.c:155: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6607 21 08 00      [10]  409 	ld	hl, #8
   660A 39            [11]  410 	add	hl, sp
   660B 4E            [ 7]  411 	ld	c, (hl)
   660C 23            [ 6]  412 	inc	hl
   660D 46            [ 7]  413 	ld	b, (hl)
   660E C5            [11]  414 	push	bc
   660F 21 08 00      [10]  415 	ld	hl, #8
   6612 39            [11]  416 	add	hl, sp
   6613 4E            [ 7]  417 	ld	c, (hl)
   6614 23            [ 6]  418 	inc	hl
   6615 46            [ 7]  419 	ld	b, (hl)
   6616 C5            [11]  420 	push	bc
   6617 21 08 00      [10]  421 	ld	hl, #8
   661A 39            [11]  422 	add	hl, sp
   661B 4E            [ 7]  423 	ld	c, (hl)
   661C 23            [ 6]  424 	inc	hl
   661D 46            [ 7]  425 	ld	b, (hl)
   661E C5            [11]  426 	push	bc
   661F 21 08 00      [10]  427 	ld	hl, #8
   6622 39            [11]  428 	add	hl, sp
   6623 4E            [ 7]  429 	ld	c, (hl)
   6624 23            [ 6]  430 	inc	hl
   6625 46            [ 7]  431 	ld	b, (hl)
   6626 C5            [11]  432 	push	bc
   6627 CD 3C 47      [17]  433 	call	_lanzarCuchillo
   662A 21 08 00      [10]  434 	ld	hl,#8
   662D 39            [11]  435 	add	hl,sp
   662E F9            [ 6]  436 	ld	sp,hl
   662F C9            [10]  437 	ret
                            438 ;src/main.c:160: u8 checkCollision(u8 direction) { // check optimization
                            439 ;	---------------------------------
                            440 ; Function checkCollision
                            441 ; ---------------------------------
   6630                     442 _checkCollision::
   6630 DD E5         [15]  443 	push	ix
   6632 DD 21 00 00   [14]  444 	ld	ix,#0
   6636 DD 39         [15]  445 	add	ix,sp
   6638 F5            [11]  446 	push	af
                            447 ;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6639 21 00 00      [10]  448 	ld	hl,#0x0000
   663C E3            [19]  449 	ex	(sp), hl
   663D 11 00 00      [10]  450 	ld	de,#0x0000
   6640 01 00 00      [10]  451 	ld	bc,#0x0000
                            452 ;src/main.c:163: switch (direction) {
   6643 3E 03         [ 7]  453 	ld	a,#0x03
   6645 DD 96 04      [19]  454 	sub	a, 4 (ix)
   6648 DA 80 67      [10]  455 	jp	C,00105$
   664B DD 5E 04      [19]  456 	ld	e,4 (ix)
   664E 16 00         [ 7]  457 	ld	d,#0x00
   6650 21 57 66      [10]  458 	ld	hl,#00124$
   6653 19            [11]  459 	add	hl,de
   6654 19            [11]  460 	add	hl,de
   6655 19            [11]  461 	add	hl,de
   6656 E9            [ 4]  462 	jp	(hl)
   6657                     463 00124$:
   6657 C3 63 66      [10]  464 	jp	00101$
   665A C3 B8 66      [10]  465 	jp	00102$
   665D C3 08 67      [10]  466 	jp	00103$
   6660 C3 45 67      [10]  467 	jp	00104$
                            468 ;src/main.c:164: case 0:
   6663                     469 00101$:
                            470 ;src/main.c:165: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   6663 21 E9 63      [10]  471 	ld	hl, #(_prota + 0x0001) + 0
   6666 4E            [ 7]  472 	ld	c,(hl)
   6667 3A E8 63      [13]  473 	ld	a, (#_prota + 0)
   666A C6 07         [ 7]  474 	add	a, #0x07
   666C 47            [ 4]  475 	ld	b,a
   666D 79            [ 4]  476 	ld	a,c
   666E F5            [11]  477 	push	af
   666F 33            [ 6]  478 	inc	sp
   6670 C5            [11]  479 	push	bc
   6671 33            [ 6]  480 	inc	sp
   6672 2A C5 64      [16]  481 	ld	hl,(_mapa)
   6675 E5            [11]  482 	push	hl
   6676 CD 1C 4B      [17]  483 	call	_getTilePtr
   6679 F1            [10]  484 	pop	af
   667A F1            [10]  485 	pop	af
   667B 33            [ 6]  486 	inc	sp
   667C 33            [ 6]  487 	inc	sp
   667D E5            [11]  488 	push	hl
                            489 ;src/main.c:166: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   667E 3A E9 63      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   6681 C6 14         [ 7]  491 	add	a, #0x14
   6683 4F            [ 4]  492 	ld	c,a
   6684 3A E8 63      [13]  493 	ld	a, (#_prota + 0)
   6687 C6 07         [ 7]  494 	add	a, #0x07
   6689 47            [ 4]  495 	ld	b,a
   668A 79            [ 4]  496 	ld	a,c
   668B F5            [11]  497 	push	af
   668C 33            [ 6]  498 	inc	sp
   668D C5            [11]  499 	push	bc
   668E 33            [ 6]  500 	inc	sp
   668F 2A C5 64      [16]  501 	ld	hl,(_mapa)
   6692 E5            [11]  502 	push	hl
   6693 CD 1C 4B      [17]  503 	call	_getTilePtr
   6696 F1            [10]  504 	pop	af
   6697 F1            [10]  505 	pop	af
   6698 EB            [ 4]  506 	ex	de,hl
                            507 ;src/main.c:167: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6699 3A E9 63      [13]  508 	ld	a, (#(_prota + 0x0001) + 0)
   669C C6 0B         [ 7]  509 	add	a, #0x0B
   669E 47            [ 4]  510 	ld	b,a
   669F 3A E8 63      [13]  511 	ld	a, (#_prota + 0)
   66A2 C6 07         [ 7]  512 	add	a, #0x07
   66A4 D5            [11]  513 	push	de
   66A5 C5            [11]  514 	push	bc
   66A6 33            [ 6]  515 	inc	sp
   66A7 F5            [11]  516 	push	af
   66A8 33            [ 6]  517 	inc	sp
   66A9 2A C5 64      [16]  518 	ld	hl,(_mapa)
   66AC E5            [11]  519 	push	hl
   66AD CD 1C 4B      [17]  520 	call	_getTilePtr
   66B0 F1            [10]  521 	pop	af
   66B1 F1            [10]  522 	pop	af
   66B2 4D            [ 4]  523 	ld	c,l
   66B3 44            [ 4]  524 	ld	b,h
   66B4 D1            [10]  525 	pop	de
                            526 ;src/main.c:168: break;
   66B5 C3 80 67      [10]  527 	jp	00105$
                            528 ;src/main.c:169: case 1:
   66B8                     529 00102$:
                            530 ;src/main.c:170: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   66B8 21 E9 63      [10]  531 	ld	hl, #(_prota + 0x0001) + 0
   66BB 56            [ 7]  532 	ld	d,(hl)
   66BC 21 E8 63      [10]  533 	ld	hl, #_prota + 0
   66BF 46            [ 7]  534 	ld	b,(hl)
   66C0 05            [ 4]  535 	dec	b
   66C1 D5            [11]  536 	push	de
   66C2 33            [ 6]  537 	inc	sp
   66C3 C5            [11]  538 	push	bc
   66C4 33            [ 6]  539 	inc	sp
   66C5 2A C5 64      [16]  540 	ld	hl,(_mapa)
   66C8 E5            [11]  541 	push	hl
   66C9 CD 1C 4B      [17]  542 	call	_getTilePtr
   66CC F1            [10]  543 	pop	af
   66CD F1            [10]  544 	pop	af
   66CE 33            [ 6]  545 	inc	sp
   66CF 33            [ 6]  546 	inc	sp
   66D0 E5            [11]  547 	push	hl
                            548 ;src/main.c:171: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   66D1 3A E9 63      [13]  549 	ld	a, (#(_prota + 0x0001) + 0)
   66D4 C6 14         [ 7]  550 	add	a, #0x14
   66D6 57            [ 4]  551 	ld	d,a
   66D7 21 E8 63      [10]  552 	ld	hl, #_prota + 0
   66DA 46            [ 7]  553 	ld	b,(hl)
   66DB 05            [ 4]  554 	dec	b
   66DC D5            [11]  555 	push	de
   66DD 33            [ 6]  556 	inc	sp
   66DE C5            [11]  557 	push	bc
   66DF 33            [ 6]  558 	inc	sp
   66E0 2A C5 64      [16]  559 	ld	hl,(_mapa)
   66E3 E5            [11]  560 	push	hl
   66E4 CD 1C 4B      [17]  561 	call	_getTilePtr
   66E7 F1            [10]  562 	pop	af
   66E8 F1            [10]  563 	pop	af
   66E9 EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:172: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   66EA 3A E9 63      [13]  566 	ld	a, (#(_prota + 0x0001) + 0)
   66ED C6 0B         [ 7]  567 	add	a, #0x0B
   66EF 47            [ 4]  568 	ld	b,a
   66F0 3A E8 63      [13]  569 	ld	a, (#_prota + 0)
   66F3 C6 FF         [ 7]  570 	add	a,#0xFF
   66F5 D5            [11]  571 	push	de
   66F6 C5            [11]  572 	push	bc
   66F7 33            [ 6]  573 	inc	sp
   66F8 F5            [11]  574 	push	af
   66F9 33            [ 6]  575 	inc	sp
   66FA 2A C5 64      [16]  576 	ld	hl,(_mapa)
   66FD E5            [11]  577 	push	hl
   66FE CD 1C 4B      [17]  578 	call	_getTilePtr
   6701 F1            [10]  579 	pop	af
   6702 F1            [10]  580 	pop	af
   6703 4D            [ 4]  581 	ld	c,l
   6704 44            [ 4]  582 	ld	b,h
   6705 D1            [10]  583 	pop	de
                            584 ;src/main.c:173: break;
   6706 18 78         [12]  585 	jr	00105$
                            586 ;src/main.c:174: case 2:
   6708                     587 00103$:
                            588 ;src/main.c:175: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6708 3A E9 63      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   670B C6 FE         [ 7]  590 	add	a,#0xFE
   670D 21 E8 63      [10]  591 	ld	hl, #_prota + 0
   6710 56            [ 7]  592 	ld	d,(hl)
   6711 C5            [11]  593 	push	bc
   6712 F5            [11]  594 	push	af
   6713 33            [ 6]  595 	inc	sp
   6714 D5            [11]  596 	push	de
   6715 33            [ 6]  597 	inc	sp
   6716 2A C5 64      [16]  598 	ld	hl,(_mapa)
   6719 E5            [11]  599 	push	hl
   671A CD 1C 4B      [17]  600 	call	_getTilePtr
   671D F1            [10]  601 	pop	af
   671E F1            [10]  602 	pop	af
   671F C1            [10]  603 	pop	bc
   6720 33            [ 6]  604 	inc	sp
   6721 33            [ 6]  605 	inc	sp
   6722 E5            [11]  606 	push	hl
                            607 ;src/main.c:176: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6723 21 E9 63      [10]  608 	ld	hl, #(_prota + 0x0001) + 0
   6726 56            [ 7]  609 	ld	d,(hl)
   6727 15            [ 4]  610 	dec	d
   6728 15            [ 4]  611 	dec	d
   6729 3A E8 63      [13]  612 	ld	a, (#_prota + 0)
   672C C6 03         [ 7]  613 	add	a, #0x03
   672E C5            [11]  614 	push	bc
   672F D5            [11]  615 	push	de
   6730 33            [ 6]  616 	inc	sp
   6731 F5            [11]  617 	push	af
   6732 33            [ 6]  618 	inc	sp
   6733 2A C5 64      [16]  619 	ld	hl,(_mapa)
   6736 E5            [11]  620 	push	hl
   6737 CD 1C 4B      [17]  621 	call	_getTilePtr
   673A F1            [10]  622 	pop	af
   673B F1            [10]  623 	pop	af
   673C EB            [ 4]  624 	ex	de,hl
   673D C1            [10]  625 	pop	bc
                            626 ;src/main.c:177: *waistTile = 0;
   673E 21 00 00      [10]  627 	ld	hl,#0x0000
   6741 36 00         [10]  628 	ld	(hl),#0x00
                            629 ;src/main.c:178: break;
   6743 18 3B         [12]  630 	jr	00105$
                            631 ;src/main.c:179: case 3:
   6745                     632 00104$:
                            633 ;src/main.c:180: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6745 3A E9 63      [13]  634 	ld	a, (#(_prota + 0x0001) + 0)
   6748 C6 16         [ 7]  635 	add	a, #0x16
   674A 21 E8 63      [10]  636 	ld	hl, #_prota + 0
   674D 56            [ 7]  637 	ld	d,(hl)
   674E C5            [11]  638 	push	bc
   674F F5            [11]  639 	push	af
   6750 33            [ 6]  640 	inc	sp
   6751 D5            [11]  641 	push	de
   6752 33            [ 6]  642 	inc	sp
   6753 2A C5 64      [16]  643 	ld	hl,(_mapa)
   6756 E5            [11]  644 	push	hl
   6757 CD 1C 4B      [17]  645 	call	_getTilePtr
   675A F1            [10]  646 	pop	af
   675B F1            [10]  647 	pop	af
   675C C1            [10]  648 	pop	bc
   675D 33            [ 6]  649 	inc	sp
   675E 33            [ 6]  650 	inc	sp
   675F E5            [11]  651 	push	hl
                            652 ;src/main.c:181: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6760 3A E9 63      [13]  653 	ld	a, (#(_prota + 0x0001) + 0)
   6763 C6 16         [ 7]  654 	add	a, #0x16
   6765 57            [ 4]  655 	ld	d,a
   6766 3A E8 63      [13]  656 	ld	a, (#_prota + 0)
   6769 C6 03         [ 7]  657 	add	a, #0x03
   676B C5            [11]  658 	push	bc
   676C D5            [11]  659 	push	de
   676D 33            [ 6]  660 	inc	sp
   676E F5            [11]  661 	push	af
   676F 33            [ 6]  662 	inc	sp
   6770 2A C5 64      [16]  663 	ld	hl,(_mapa)
   6773 E5            [11]  664 	push	hl
   6774 CD 1C 4B      [17]  665 	call	_getTilePtr
   6777 F1            [10]  666 	pop	af
   6778 F1            [10]  667 	pop	af
   6779 EB            [ 4]  668 	ex	de,hl
   677A C1            [10]  669 	pop	bc
                            670 ;src/main.c:182: *waistTile = 0;
   677B 21 00 00      [10]  671 	ld	hl,#0x0000
   677E 36 00         [10]  672 	ld	(hl),#0x00
                            673 ;src/main.c:184: }
   6780                     674 00105$:
                            675 ;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6780 E1            [10]  676 	pop	hl
   6781 E5            [11]  677 	push	hl
   6782 6E            [ 7]  678 	ld	l,(hl)
   6783 3E 02         [ 7]  679 	ld	a,#0x02
   6785 95            [ 4]  680 	sub	a, l
   6786 38 0E         [12]  681 	jr	C,00106$
   6788 1A            [ 7]  682 	ld	a,(de)
   6789 5F            [ 4]  683 	ld	e,a
   678A 3E 02         [ 7]  684 	ld	a,#0x02
   678C 93            [ 4]  685 	sub	a, e
   678D 38 07         [12]  686 	jr	C,00106$
   678F 0A            [ 7]  687 	ld	a,(bc)
   6790 4F            [ 4]  688 	ld	c,a
   6791 3E 02         [ 7]  689 	ld	a,#0x02
   6793 91            [ 4]  690 	sub	a, c
   6794 30 04         [12]  691 	jr	NC,00107$
   6796                     692 00106$:
                            693 ;src/main.c:187: return 1;
   6796 2E 01         [ 7]  694 	ld	l,#0x01
   6798 18 02         [12]  695 	jr	00110$
   679A                     696 00107$:
                            697 ;src/main.c:189: return 0;
   679A 2E 00         [ 7]  698 	ld	l,#0x00
   679C                     699 00110$:
   679C DD F9         [10]  700 	ld	sp, ix
   679E DD E1         [14]  701 	pop	ix
   67A0 C9            [10]  702 	ret
                            703 ;src/main.c:192: void dibujarEnemigo(TEnemy *enemy) {
                            704 ;	---------------------------------
                            705 ; Function dibujarEnemigo
                            706 ; ---------------------------------
   67A1                     707 _dibujarEnemigo::
   67A1 DD E5         [15]  708 	push	ix
   67A3 DD 21 00 00   [14]  709 	ld	ix,#0
   67A7 DD 39         [15]  710 	add	ix,sp
                            711 ;src/main.c:193: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   67A9 DD 4E 04      [19]  712 	ld	c,4 (ix)
   67AC DD 46 05      [19]  713 	ld	b,5 (ix)
   67AF 69            [ 4]  714 	ld	l, c
   67B0 60            [ 4]  715 	ld	h, b
   67B1 23            [ 6]  716 	inc	hl
   67B2 56            [ 7]  717 	ld	d,(hl)
   67B3 0A            [ 7]  718 	ld	a,(bc)
   67B4 C5            [11]  719 	push	bc
   67B5 D5            [11]  720 	push	de
   67B6 33            [ 6]  721 	inc	sp
   67B7 F5            [11]  722 	push	af
   67B8 33            [ 6]  723 	inc	sp
   67B9 21 00 C0      [10]  724 	ld	hl,#0xC000
   67BC E5            [11]  725 	push	hl
   67BD CD 05 60      [17]  726 	call	_cpct_getScreenPtr
   67C0 EB            [ 4]  727 	ex	de,hl
                            728 ;src/main.c:194: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   67C1 E1            [10]  729 	pop	hl
   67C2 01 04 00      [10]  730 	ld	bc, #0x0004
   67C5 09            [11]  731 	add	hl, bc
   67C6 4E            [ 7]  732 	ld	c,(hl)
   67C7 23            [ 6]  733 	inc	hl
   67C8 46            [ 7]  734 	ld	b,(hl)
   67C9 21 00 01      [10]  735 	ld	hl,#_g_tablatrans
   67CC E5            [11]  736 	push	hl
   67CD 21 04 16      [10]  737 	ld	hl,#0x1604
   67D0 E5            [11]  738 	push	hl
   67D1 D5            [11]  739 	push	de
   67D2 C5            [11]  740 	push	bc
   67D3 CD 25 60      [17]  741 	call	_cpct_drawSpriteMaskedAlignedTable
   67D6 DD E1         [14]  742 	pop	ix
   67D8 C9            [10]  743 	ret
                            744 ;src/main.c:197: void dibujarExplosion(TEnemy *enemy) {
                            745 ;	---------------------------------
                            746 ; Function dibujarExplosion
                            747 ; ---------------------------------
   67D9                     748 _dibujarExplosion::
   67D9 DD E5         [15]  749 	push	ix
   67DB DD 21 00 00   [14]  750 	ld	ix,#0
   67DF DD 39         [15]  751 	add	ix,sp
                            752 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   67E1 DD 4E 04      [19]  753 	ld	c,4 (ix)
   67E4 DD 46 05      [19]  754 	ld	b,5 (ix)
   67E7 69            [ 4]  755 	ld	l, c
   67E8 60            [ 4]  756 	ld	h, b
   67E9 23            [ 6]  757 	inc	hl
   67EA 56            [ 7]  758 	ld	d,(hl)
   67EB 0A            [ 7]  759 	ld	a,(bc)
   67EC 47            [ 4]  760 	ld	b,a
   67ED D5            [11]  761 	push	de
   67EE 33            [ 6]  762 	inc	sp
   67EF C5            [11]  763 	push	bc
   67F0 33            [ 6]  764 	inc	sp
   67F1 21 00 C0      [10]  765 	ld	hl,#0xC000
   67F4 E5            [11]  766 	push	hl
   67F5 CD 05 60      [17]  767 	call	_cpct_getScreenPtr
   67F8 4D            [ 4]  768 	ld	c,l
   67F9 44            [ 4]  769 	ld	b,h
                            770 ;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   67FA 11 00 01      [10]  771 	ld	de,#_g_tablatrans+0
   67FD D5            [11]  772 	push	de
   67FE 21 04 16      [10]  773 	ld	hl,#0x1604
   6801 E5            [11]  774 	push	hl
   6802 C5            [11]  775 	push	bc
   6803 21 70 19      [10]  776 	ld	hl,#_g_explosion
   6806 E5            [11]  777 	push	hl
   6807 CD 25 60      [17]  778 	call	_cpct_drawSpriteMaskedAlignedTable
   680A DD E1         [14]  779 	pop	ix
   680C C9            [10]  780 	ret
                            781 ;src/main.c:202: void borrarExplosion(TEnemy *enemy) {
                            782 ;	---------------------------------
                            783 ; Function borrarExplosion
                            784 ; ---------------------------------
   680D                     785 _borrarExplosion::
   680D DD E5         [15]  786 	push	ix
   680F DD 21 00 00   [14]  787 	ld	ix,#0
   6813 DD 39         [15]  788 	add	ix,sp
   6815 F5            [11]  789 	push	af
   6816 3B            [ 6]  790 	dec	sp
                            791 ;src/main.c:205: u8 w = 4 + (enemy->px & 1);
   6817 DD 5E 04      [19]  792 	ld	e,4 (ix)
   681A DD 56 05      [19]  793 	ld	d,5 (ix)
   681D 6B            [ 4]  794 	ld	l, e
   681E 62            [ 4]  795 	ld	h, d
   681F 23            [ 6]  796 	inc	hl
   6820 23            [ 6]  797 	inc	hl
   6821 4E            [ 7]  798 	ld	c,(hl)
   6822 79            [ 4]  799 	ld	a,c
   6823 E6 01         [ 7]  800 	and	a, #0x01
   6825 47            [ 4]  801 	ld	b,a
   6826 04            [ 4]  802 	inc	b
   6827 04            [ 4]  803 	inc	b
   6828 04            [ 4]  804 	inc	b
   6829 04            [ 4]  805 	inc	b
                            806 ;src/main.c:206: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   682A EB            [ 4]  807 	ex	de,hl
   682B 23            [ 6]  808 	inc	hl
   682C 23            [ 6]  809 	inc	hl
   682D 23            [ 6]  810 	inc	hl
   682E 5E            [ 7]  811 	ld	e,(hl)
   682F CB 4B         [ 8]  812 	bit	1, e
   6831 28 04         [12]  813 	jr	Z,00103$
   6833 3E 01         [ 7]  814 	ld	a,#0x01
   6835 18 02         [12]  815 	jr	00104$
   6837                     816 00103$:
   6837 3E 00         [ 7]  817 	ld	a,#0x00
   6839                     818 00104$:
   6839 C6 06         [ 7]  819 	add	a, #0x06
   683B DD 77 FD      [19]  820 	ld	-3 (ix),a
                            821 ;src/main.c:208: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   683E FD 2A C5 64   [20]  822 	ld	iy,(_mapa)
   6842 16 00         [ 7]  823 	ld	d,#0x00
   6844 7B            [ 4]  824 	ld	a,e
   6845 C6 E8         [ 7]  825 	add	a,#0xE8
   6847 DD 77 FE      [19]  826 	ld	-2 (ix),a
   684A 7A            [ 4]  827 	ld	a,d
   684B CE FF         [ 7]  828 	adc	a,#0xFF
   684D DD 77 FF      [19]  829 	ld	-1 (ix),a
   6850 DD 6E FE      [19]  830 	ld	l,-2 (ix)
   6853 DD 66 FF      [19]  831 	ld	h,-1 (ix)
   6856 DD CB FF 7E   [20]  832 	bit	7, -1 (ix)
   685A 28 04         [12]  833 	jr	Z,00105$
   685C 21 EB FF      [10]  834 	ld	hl,#0xFFEB
   685F 19            [11]  835 	add	hl,de
   6860                     836 00105$:
   6860 CB 2C         [ 8]  837 	sra	h
   6862 CB 1D         [ 8]  838 	rr	l
   6864 CB 2C         [ 8]  839 	sra	h
   6866 CB 1D         [ 8]  840 	rr	l
   6868 55            [ 4]  841 	ld	d,l
   6869 CB 39         [ 8]  842 	srl	c
   686B FD E5         [15]  843 	push	iy
   686D 21 F0 C0      [10]  844 	ld	hl,#0xC0F0
   6870 E5            [11]  845 	push	hl
   6871 3E 28         [ 7]  846 	ld	a,#0x28
   6873 F5            [11]  847 	push	af
   6874 33            [ 6]  848 	inc	sp
   6875 DD 7E FD      [19]  849 	ld	a,-3 (ix)
   6878 F5            [11]  850 	push	af
   6879 33            [ 6]  851 	inc	sp
   687A C5            [11]  852 	push	bc
   687B 33            [ 6]  853 	inc	sp
   687C D5            [11]  854 	push	de
   687D 33            [ 6]  855 	inc	sp
   687E 79            [ 4]  856 	ld	a,c
   687F F5            [11]  857 	push	af
   6880 33            [ 6]  858 	inc	sp
   6881 CD E7 54      [17]  859 	call	_cpct_etm_drawTileBox2x4
   6884 DD F9         [10]  860 	ld	sp, ix
   6886 DD E1         [14]  861 	pop	ix
   6888 C9            [10]  862 	ret
                            863 ;src/main.c:212: void borrarEnemigo(u8 x, u8 y) {
                            864 ;	---------------------------------
                            865 ; Function borrarEnemigo
                            866 ; ---------------------------------
   6889                     867 _borrarEnemigo::
   6889 DD E5         [15]  868 	push	ix
   688B DD 21 00 00   [14]  869 	ld	ix,#0
   688F DD 39         [15]  870 	add	ix,sp
   6891 F5            [11]  871 	push	af
   6892 F5            [11]  872 	push	af
                            873 ;src/main.c:216: u8 w = 4 + (x & 1);
   6893 DD 7E 04      [19]  874 	ld	a,4 (ix)
   6896 E6 01         [ 7]  875 	and	a, #0x01
   6898 4F            [ 4]  876 	ld	c,a
   6899 0C            [ 4]  877 	inc	c
   689A 0C            [ 4]  878 	inc	c
   689B 0C            [ 4]  879 	inc	c
   689C 0C            [ 4]  880 	inc	c
                            881 ;src/main.c:218: u8 h = 6 + (y & 3 ? 1 : 0);
   689D DD 7E 05      [19]  882 	ld	a,5 (ix)
   68A0 E6 03         [ 7]  883 	and	a, #0x03
   68A2 28 04         [12]  884 	jr	Z,00103$
   68A4 3E 01         [ 7]  885 	ld	a,#0x01
   68A6 18 02         [12]  886 	jr	00104$
   68A8                     887 00103$:
   68A8 3E 00         [ 7]  888 	ld	a,#0x00
   68AA                     889 00104$:
   68AA C6 06         [ 7]  890 	add	a, #0x06
   68AC 47            [ 4]  891 	ld	b,a
                            892 ;src/main.c:220: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68AD 2A C5 64      [16]  893 	ld	hl,(_mapa)
   68B0 E3            [19]  894 	ex	(sp), hl
   68B1 DD 5E 05      [19]  895 	ld	e,5 (ix)
   68B4 16 00         [ 7]  896 	ld	d,#0x00
   68B6 7B            [ 4]  897 	ld	a,e
   68B7 C6 E8         [ 7]  898 	add	a,#0xE8
   68B9 DD 77 FE      [19]  899 	ld	-2 (ix),a
   68BC 7A            [ 4]  900 	ld	a,d
   68BD CE FF         [ 7]  901 	adc	a,#0xFF
   68BF DD 77 FF      [19]  902 	ld	-1 (ix),a
   68C2 DD 6E FE      [19]  903 	ld	l,-2 (ix)
   68C5 DD 66 FF      [19]  904 	ld	h,-1 (ix)
   68C8 DD CB FF 7E   [20]  905 	bit	7, -1 (ix)
   68CC 28 04         [12]  906 	jr	Z,00105$
   68CE 21 EB FF      [10]  907 	ld	hl,#0xFFEB
   68D1 19            [11]  908 	add	hl,de
   68D2                     909 00105$:
   68D2 CB 2C         [ 8]  910 	sra	h
   68D4 CB 1D         [ 8]  911 	rr	l
   68D6 CB 2C         [ 8]  912 	sra	h
   68D8 CB 1D         [ 8]  913 	rr	l
   68DA 5D            [ 4]  914 	ld	e,l
   68DB DD 56 04      [19]  915 	ld	d,4 (ix)
   68DE CB 3A         [ 8]  916 	srl	d
   68E0 E1            [10]  917 	pop	hl
   68E1 E5            [11]  918 	push	hl
   68E2 E5            [11]  919 	push	hl
   68E3 21 F0 C0      [10]  920 	ld	hl,#0xC0F0
   68E6 E5            [11]  921 	push	hl
   68E7 3E 28         [ 7]  922 	ld	a,#0x28
   68E9 F5            [11]  923 	push	af
   68EA 33            [ 6]  924 	inc	sp
   68EB C5            [11]  925 	push	bc
   68EC 7B            [ 4]  926 	ld	a,e
   68ED F5            [11]  927 	push	af
   68EE 33            [ 6]  928 	inc	sp
   68EF D5            [11]  929 	push	de
   68F0 33            [ 6]  930 	inc	sp
   68F1 CD E7 54      [17]  931 	call	_cpct_etm_drawTileBox2x4
   68F4 DD F9         [10]  932 	ld	sp, ix
   68F6 DD E1         [14]  933 	pop	ix
   68F8 C9            [10]  934 	ret
                            935 ;src/main.c:223: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            936 ;	---------------------------------
                            937 ; Function redibujarEnemigo
                            938 ; ---------------------------------
   68F9                     939 _redibujarEnemigo::
   68F9 DD E5         [15]  940 	push	ix
   68FB DD 21 00 00   [14]  941 	ld	ix,#0
   68FF DD 39         [15]  942 	add	ix,sp
                            943 ;src/main.c:224: borrarEnemigo(x, y);
   6901 DD 66 05      [19]  944 	ld	h,5 (ix)
   6904 DD 6E 04      [19]  945 	ld	l,4 (ix)
   6907 E5            [11]  946 	push	hl
   6908 CD 89 68      [17]  947 	call	_borrarEnemigo
   690B F1            [10]  948 	pop	af
                            949 ;src/main.c:225: enemy->px = enemy->x;
   690C DD 4E 06      [19]  950 	ld	c,6 (ix)
   690F DD 46 07      [19]  951 	ld	b,7 (ix)
   6912 59            [ 4]  952 	ld	e, c
   6913 50            [ 4]  953 	ld	d, b
   6914 13            [ 6]  954 	inc	de
   6915 13            [ 6]  955 	inc	de
   6916 0A            [ 7]  956 	ld	a,(bc)
   6917 12            [ 7]  957 	ld	(de),a
                            958 ;src/main.c:226: enemy->py = enemy->y;
   6918 59            [ 4]  959 	ld	e, c
   6919 50            [ 4]  960 	ld	d, b
   691A 13            [ 6]  961 	inc	de
   691B 13            [ 6]  962 	inc	de
   691C 13            [ 6]  963 	inc	de
   691D 69            [ 4]  964 	ld	l, c
   691E 60            [ 4]  965 	ld	h, b
   691F 23            [ 6]  966 	inc	hl
   6920 7E            [ 7]  967 	ld	a,(hl)
   6921 12            [ 7]  968 	ld	(de),a
                            969 ;src/main.c:227: dibujarEnemigo(enemy);
   6922 C5            [11]  970 	push	bc
   6923 CD A1 67      [17]  971 	call	_dibujarEnemigo
   6926 F1            [10]  972 	pop	af
   6927 DD E1         [14]  973 	pop	ix
   6929 C9            [10]  974 	ret
                            975 ;src/main.c:231: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            976 ;	---------------------------------
                            977 ; Function checkEnemyDead
                            978 ; ---------------------------------
   692A                     979 _checkEnemyDead::
   692A DD E5         [15]  980 	push	ix
   692C DD 21 00 00   [14]  981 	ld	ix,#0
   6930 DD 39         [15]  982 	add	ix,sp
   6932 21 FA FF      [10]  983 	ld	hl,#-6
   6935 39            [11]  984 	add	hl,sp
   6936 F9            [ 6]  985 	ld	sp,hl
                            986 ;src/main.c:233: switch (direction) {
   6937 3E 03         [ 7]  987 	ld	a,#0x03
   6939 DD 96 04      [19]  988 	sub	a, 4 (ix)
   693C DA 12 6B      [10]  989 	jp	C,00134$
                            990 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   693F DD 7E 05      [19]  991 	ld	a,5 (ix)
   6942 DD 77 FE      [19]  992 	ld	-2 (ix),a
   6945 DD 7E 06      [19]  993 	ld	a,6 (ix)
   6948 DD 77 FF      [19]  994 	ld	-1 (ix),a
   694B DD 7E FE      [19]  995 	ld	a,-2 (ix)
   694E C6 01         [ 7]  996 	add	a, #0x01
   6950 DD 77 FA      [19]  997 	ld	-6 (ix),a
   6953 DD 7E FF      [19]  998 	ld	a,-1 (ix)
   6956 CE 00         [ 7]  999 	adc	a, #0x00
   6958 DD 77 FB      [19] 1000 	ld	-5 (ix),a
                           1001 ;src/main.c:238: enemy->muerto = SI;
   695B DD 7E FE      [19] 1002 	ld	a,-2 (ix)
   695E C6 08         [ 7] 1003 	add	a, #0x08
   6960 DD 77 FC      [19] 1004 	ld	-4 (ix),a
   6963 DD 7E FF      [19] 1005 	ld	a,-1 (ix)
   6966 CE 00         [ 7] 1006 	adc	a, #0x00
   6968 DD 77 FD      [19] 1007 	ld	-3 (ix),a
                           1008 ;src/main.c:233: switch (direction) {
   696B DD 5E 04      [19] 1009 	ld	e,4 (ix)
   696E 16 00         [ 7] 1010 	ld	d,#0x00
   6970 21 77 69      [10] 1011 	ld	hl,#00196$
   6973 19            [11] 1012 	add	hl,de
   6974 19            [11] 1013 	add	hl,de
   6975 19            [11] 1014 	add	hl,de
   6976 E9            [ 4] 1015 	jp	(hl)
   6977                    1016 00196$:
   6977 C3 EB 69      [10] 1017 	jp	00109$
   697A C3 83 69      [10] 1018 	jp	00101$
   697D C3 B4 6A      [10] 1019 	jp	00125$
   6980 C3 53 6A      [10] 1020 	jp	00117$
                           1021 ;src/main.c:234: case 1:
   6983                    1022 00101$:
                           1023 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6983 21 F1 63      [10] 1024 	ld	hl, #_cu + 1
   6986 4E            [ 7] 1025 	ld	c,(hl)
   6987 06 00         [ 7] 1026 	ld	b,#0x00
   6989 21 04 00      [10] 1027 	ld	hl,#0x0004
   698C 09            [11] 1028 	add	hl,bc
   698D 5D            [ 4] 1029 	ld	e,l
   698E 7C            [ 4] 1030 	ld	a, h
   698F B3            [ 4] 1031 	or	a, e
   6990 D6 01         [ 7] 1032 	sub	a,#0x01
   6992 3E 00         [ 7] 1033 	ld	a,#0x00
   6994 17            [ 4] 1034 	rla
   6995 5F            [ 4] 1035 	ld	e,a
   6996 E1            [10] 1036 	pop	hl
   6997 E5            [11] 1037 	push	hl
   6998 6E            [ 7] 1038 	ld	l,(hl)
   6999 55            [ 4] 1039 	ld	d,l
   699A 7B            [ 4] 1040 	ld	a,e
   699B 92            [ 4] 1041 	sub	a, d
   699C E2 A1 69      [10] 1042 	jp	PO, 00197$
   699F EE 80         [ 7] 1043 	xor	a, #0x80
   69A1                    1044 00197$:
   69A1 FA B6 69      [10] 1045 	jp	M,00106$
   69A4 26 00         [ 7] 1046 	ld	h,#0x00
   69A6 11 16 00      [10] 1047 	ld	de,#0x0016
   69A9 19            [11] 1048 	add	hl,de
   69AA 7D            [ 4] 1049 	ld	a,l
   69AB 91            [ 4] 1050 	sub	a, c
   69AC 7C            [ 4] 1051 	ld	a,h
   69AD 98            [ 4] 1052 	sbc	a, b
   69AE E2 B3 69      [10] 1053 	jp	PO, 00198$
   69B1 EE 80         [ 7] 1054 	xor	a, #0x80
   69B3                    1055 00198$:
   69B3 F2 12 6B      [10] 1056 	jp	P,00134$
   69B6                    1057 00106$:
                           1058 ;src/main.c:236: if(cu.x > enemy->x){ //si el cu esta abajo
   69B6 21 F0 63      [10] 1059 	ld	hl, #_cu + 0
   69B9 4E            [ 7] 1060 	ld	c,(hl)
   69BA DD 6E FE      [19] 1061 	ld	l,-2 (ix)
   69BD DD 66 FF      [19] 1062 	ld	h,-1 (ix)
   69C0 5E            [ 7] 1063 	ld	e,(hl)
   69C1 7B            [ 4] 1064 	ld	a,e
   69C2 91            [ 4] 1065 	sub	a, c
   69C3 D2 12 6B      [10] 1066 	jp	NC,00134$
                           1067 ;src/main.c:237: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   69C6 69            [ 4] 1068 	ld	l,c
   69C7 26 00         [ 7] 1069 	ld	h,#0x00
   69C9 16 00         [ 7] 1070 	ld	d,#0x00
   69CB 13            [ 6] 1071 	inc	de
   69CC 13            [ 6] 1072 	inc	de
   69CD 13            [ 6] 1073 	inc	de
   69CE 13            [ 6] 1074 	inc	de
   69CF BF            [ 4] 1075 	cp	a, a
   69D0 ED 52         [15] 1076 	sbc	hl, de
   69D2 3E 01         [ 7] 1077 	ld	a,#0x01
   69D4 BD            [ 4] 1078 	cp	a, l
   69D5 3E 00         [ 7] 1079 	ld	a,#0x00
   69D7 9C            [ 4] 1080 	sbc	a, h
   69D8 E2 DD 69      [10] 1081 	jp	PO, 00199$
   69DB EE 80         [ 7] 1082 	xor	a, #0x80
   69DD                    1083 00199$:
   69DD FA 12 6B      [10] 1084 	jp	M,00134$
                           1085 ;src/main.c:238: enemy->muerto = SI;
   69E0 DD 6E FC      [19] 1086 	ld	l,-4 (ix)
   69E3 DD 66 FD      [19] 1087 	ld	h,-3 (ix)
   69E6 36 01         [10] 1088 	ld	(hl),#0x01
                           1089 ;src/main.c:242: break;
   69E8 C3 12 6B      [10] 1090 	jp	00134$
                           1091 ;src/main.c:243: case 0:
   69EB                    1092 00109$:
                           1093 ;src/main.c:244: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69EB 21 F1 63      [10] 1094 	ld	hl, #_cu + 1
   69EE 4E            [ 7] 1095 	ld	c,(hl)
   69EF 06 00         [ 7] 1096 	ld	b,#0x00
   69F1 21 04 00      [10] 1097 	ld	hl,#0x0004
   69F4 09            [11] 1098 	add	hl,bc
   69F5 5D            [ 4] 1099 	ld	e,l
   69F6 7C            [ 4] 1100 	ld	a, h
   69F7 B3            [ 4] 1101 	or	a, e
   69F8 D6 01         [ 7] 1102 	sub	a,#0x01
   69FA 3E 00         [ 7] 1103 	ld	a,#0x00
   69FC 17            [ 4] 1104 	rla
   69FD 5F            [ 4] 1105 	ld	e,a
   69FE E1            [10] 1106 	pop	hl
   69FF E5            [11] 1107 	push	hl
   6A00 6E            [ 7] 1108 	ld	l,(hl)
   6A01 55            [ 4] 1109 	ld	d,l
   6A02 7B            [ 4] 1110 	ld	a,e
   6A03 92            [ 4] 1111 	sub	a, d
   6A04 E2 09 6A      [10] 1112 	jp	PO, 00200$
   6A07 EE 80         [ 7] 1113 	xor	a, #0x80
   6A09                    1114 00200$:
   6A09 FA 1E 6A      [10] 1115 	jp	M,00114$
   6A0C 26 00         [ 7] 1116 	ld	h,#0x00
   6A0E 11 16 00      [10] 1117 	ld	de,#0x0016
   6A11 19            [11] 1118 	add	hl,de
   6A12 7D            [ 4] 1119 	ld	a,l
   6A13 91            [ 4] 1120 	sub	a, c
   6A14 7C            [ 4] 1121 	ld	a,h
   6A15 98            [ 4] 1122 	sbc	a, b
   6A16 E2 1B 6A      [10] 1123 	jp	PO, 00201$
   6A19 EE 80         [ 7] 1124 	xor	a, #0x80
   6A1B                    1125 00201$:
   6A1B F2 12 6B      [10] 1126 	jp	P,00134$
   6A1E                    1127 00114$:
                           1128 ;src/main.c:245: if(enemy->x > cu.x){ //si el cu esta abajo
   6A1E DD 6E FE      [19] 1129 	ld	l,-2 (ix)
   6A21 DD 66 FF      [19] 1130 	ld	h,-1 (ix)
   6A24 4E            [ 7] 1131 	ld	c,(hl)
   6A25 21 F0 63      [10] 1132 	ld	hl, #_cu + 0
   6A28 5E            [ 7] 1133 	ld	e,(hl)
   6A29 7B            [ 4] 1134 	ld	a,e
   6A2A 91            [ 4] 1135 	sub	a, c
   6A2B D2 12 6B      [10] 1136 	jp	NC,00134$
                           1137 ;src/main.c:246: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A2E 69            [ 4] 1138 	ld	l,c
   6A2F 26 00         [ 7] 1139 	ld	h,#0x00
   6A31 16 00         [ 7] 1140 	ld	d,#0x00
   6A33 13            [ 6] 1141 	inc	de
   6A34 13            [ 6] 1142 	inc	de
   6A35 13            [ 6] 1143 	inc	de
   6A36 13            [ 6] 1144 	inc	de
   6A37 BF            [ 4] 1145 	cp	a, a
   6A38 ED 52         [15] 1146 	sbc	hl, de
   6A3A 3E 01         [ 7] 1147 	ld	a,#0x01
   6A3C BD            [ 4] 1148 	cp	a, l
   6A3D 3E 00         [ 7] 1149 	ld	a,#0x00
   6A3F 9C            [ 4] 1150 	sbc	a, h
   6A40 E2 45 6A      [10] 1151 	jp	PO, 00202$
   6A43 EE 80         [ 7] 1152 	xor	a, #0x80
   6A45                    1153 00202$:
   6A45 FA 12 6B      [10] 1154 	jp	M,00134$
                           1155 ;src/main.c:247: enemy->muerto = SI;
   6A48 DD 6E FC      [19] 1156 	ld	l,-4 (ix)
   6A4B DD 66 FD      [19] 1157 	ld	h,-3 (ix)
   6A4E 36 01         [10] 1158 	ld	(hl),#0x01
                           1159 ;src/main.c:251: break;
   6A50 C3 12 6B      [10] 1160 	jp	00134$
                           1161 ;src/main.c:252: case 3:
   6A53                    1162 00117$:
                           1163 ;src/main.c:253: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6A53 21 F0 63      [10] 1164 	ld	hl, #_cu + 0
   6A56 4E            [ 7] 1165 	ld	c,(hl)
   6A57 06 00         [ 7] 1166 	ld	b,#0x00
   6A59 59            [ 4] 1167 	ld	e, c
   6A5A 50            [ 4] 1168 	ld	d, b
   6A5B 13            [ 6] 1169 	inc	de
   6A5C 13            [ 6] 1170 	inc	de
   6A5D DD 6E FE      [19] 1171 	ld	l,-2 (ix)
   6A60 DD 66 FF      [19] 1172 	ld	h,-1 (ix)
   6A63 6E            [ 7] 1173 	ld	l,(hl)
   6A64 26 00         [ 7] 1174 	ld	h,#0x00
   6A66 7B            [ 4] 1175 	ld	a,e
   6A67 95            [ 4] 1176 	sub	a, l
   6A68 7A            [ 4] 1177 	ld	a,d
   6A69 9C            [ 4] 1178 	sbc	a, h
   6A6A E2 6F 6A      [10] 1179 	jp	PO, 00203$
   6A6D EE 80         [ 7] 1180 	xor	a, #0x80
   6A6F                    1181 00203$:
   6A6F FA 12 6B      [10] 1182 	jp	M,00134$
   6A72 11 04 00      [10] 1183 	ld	de,#0x0004
   6A75 19            [11] 1184 	add	hl,de
   6A76 7D            [ 4] 1185 	ld	a,l
   6A77 91            [ 4] 1186 	sub	a, c
   6A78 7C            [ 4] 1187 	ld	a,h
   6A79 98            [ 4] 1188 	sbc	a, b
   6A7A E2 7F 6A      [10] 1189 	jp	PO, 00204$
   6A7D EE 80         [ 7] 1190 	xor	a, #0x80
   6A7F                    1191 00204$:
   6A7F FA 12 6B      [10] 1192 	jp	M,00134$
                           1193 ;src/main.c:254: if(enemy->y>cu.y){
   6A82 E1            [10] 1194 	pop	hl
   6A83 E5            [11] 1195 	push	hl
   6A84 4E            [ 7] 1196 	ld	c,(hl)
   6A85 21 F1 63      [10] 1197 	ld	hl, #(_cu + 0x0001) + 0
   6A88 5E            [ 7] 1198 	ld	e,(hl)
   6A89 7B            [ 4] 1199 	ld	a,e
   6A8A 91            [ 4] 1200 	sub	a, c
   6A8B D2 12 6B      [10] 1201 	jp	NC,00134$
                           1202 ;src/main.c:255: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6A8E 06 00         [ 7] 1203 	ld	b,#0x00
   6A90 16 00         [ 7] 1204 	ld	d,#0x00
   6A92 21 08 00      [10] 1205 	ld	hl,#0x0008
   6A95 19            [11] 1206 	add	hl,de
   6A96 79            [ 4] 1207 	ld	a,c
   6A97 95            [ 4] 1208 	sub	a, l
   6A98 4F            [ 4] 1209 	ld	c,a
   6A99 78            [ 4] 1210 	ld	a,b
   6A9A 9C            [ 4] 1211 	sbc	a, h
   6A9B 47            [ 4] 1212 	ld	b,a
   6A9C 3E 02         [ 7] 1213 	ld	a,#0x02
   6A9E B9            [ 4] 1214 	cp	a, c
   6A9F 3E 00         [ 7] 1215 	ld	a,#0x00
   6AA1 98            [ 4] 1216 	sbc	a, b
   6AA2 E2 A7 6A      [10] 1217 	jp	PO, 00205$
   6AA5 EE 80         [ 7] 1218 	xor	a, #0x80
   6AA7                    1219 00205$:
   6AA7 F2 12 6B      [10] 1220 	jp	P,00134$
                           1221 ;src/main.c:256: enemy->muerto = SI;
   6AAA DD 6E FC      [19] 1222 	ld	l,-4 (ix)
   6AAD DD 66 FD      [19] 1223 	ld	h,-3 (ix)
   6AB0 36 01         [10] 1224 	ld	(hl),#0x01
                           1225 ;src/main.c:260: break;
   6AB2 18 5E         [12] 1226 	jr	00134$
                           1227 ;src/main.c:261: case 2:
   6AB4                    1228 00125$:
                           1229 ;src/main.c:262: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AB4 21 F0 63      [10] 1230 	ld	hl, #_cu + 0
   6AB7 4E            [ 7] 1231 	ld	c,(hl)
   6AB8 06 00         [ 7] 1232 	ld	b,#0x00
   6ABA 59            [ 4] 1233 	ld	e, c
   6ABB 50            [ 4] 1234 	ld	d, b
   6ABC 13            [ 6] 1235 	inc	de
   6ABD 13            [ 6] 1236 	inc	de
   6ABE DD 6E FE      [19] 1237 	ld	l,-2 (ix)
   6AC1 DD 66 FF      [19] 1238 	ld	h,-1 (ix)
   6AC4 6E            [ 7] 1239 	ld	l,(hl)
   6AC5 26 00         [ 7] 1240 	ld	h,#0x00
   6AC7 7B            [ 4] 1241 	ld	a,e
   6AC8 95            [ 4] 1242 	sub	a, l
   6AC9 7A            [ 4] 1243 	ld	a,d
   6ACA 9C            [ 4] 1244 	sbc	a, h
   6ACB E2 D0 6A      [10] 1245 	jp	PO, 00206$
   6ACE EE 80         [ 7] 1246 	xor	a, #0x80
   6AD0                    1247 00206$:
   6AD0 FA 12 6B      [10] 1248 	jp	M,00134$
   6AD3 11 04 00      [10] 1249 	ld	de,#0x0004
   6AD6 19            [11] 1250 	add	hl,de
   6AD7 7D            [ 4] 1251 	ld	a,l
   6AD8 91            [ 4] 1252 	sub	a, c
   6AD9 7C            [ 4] 1253 	ld	a,h
   6ADA 98            [ 4] 1254 	sbc	a, b
   6ADB E2 E0 6A      [10] 1255 	jp	PO, 00207$
   6ADE EE 80         [ 7] 1256 	xor	a, #0x80
   6AE0                    1257 00207$:
   6AE0 FA 12 6B      [10] 1258 	jp	M,00134$
                           1259 ;src/main.c:263: if(cu.y > enemy->y){ //si el cu esta abajo
   6AE3 21 F1 63      [10] 1260 	ld	hl, #(_cu + 0x0001) + 0
   6AE6 4E            [ 7] 1261 	ld	c,(hl)
   6AE7 E1            [10] 1262 	pop	hl
   6AE8 E5            [11] 1263 	push	hl
   6AE9 5E            [ 7] 1264 	ld	e,(hl)
   6AEA 7B            [ 4] 1265 	ld	a,e
   6AEB 91            [ 4] 1266 	sub	a, c
   6AEC 30 24         [12] 1267 	jr	NC,00134$
                           1268 ;src/main.c:264: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6AEE 06 00         [ 7] 1269 	ld	b,#0x00
   6AF0 16 00         [ 7] 1270 	ld	d,#0x00
   6AF2 21 16 00      [10] 1271 	ld	hl,#0x0016
   6AF5 19            [11] 1272 	add	hl,de
   6AF6 79            [ 4] 1273 	ld	a,c
   6AF7 95            [ 4] 1274 	sub	a, l
   6AF8 4F            [ 4] 1275 	ld	c,a
   6AF9 78            [ 4] 1276 	ld	a,b
   6AFA 9C            [ 4] 1277 	sbc	a, h
   6AFB 47            [ 4] 1278 	ld	b,a
   6AFC 3E 02         [ 7] 1279 	ld	a,#0x02
   6AFE B9            [ 4] 1280 	cp	a, c
   6AFF 3E 00         [ 7] 1281 	ld	a,#0x00
   6B01 98            [ 4] 1282 	sbc	a, b
   6B02 E2 07 6B      [10] 1283 	jp	PO, 00208$
   6B05 EE 80         [ 7] 1284 	xor	a, #0x80
   6B07                    1285 00208$:
   6B07 F2 12 6B      [10] 1286 	jp	P,00134$
                           1287 ;src/main.c:265: enemy->muerto = SI;
   6B0A DD 6E FC      [19] 1288 	ld	l,-4 (ix)
   6B0D DD 66 FD      [19] 1289 	ld	h,-3 (ix)
   6B10 36 01         [10] 1290 	ld	(hl),#0x01
                           1291 ;src/main.c:271: }
   6B12                    1292 00134$:
   6B12 DD F9         [10] 1293 	ld	sp, ix
   6B14 DD E1         [14] 1294 	pop	ix
   6B16 C9            [10] 1295 	ret
                           1296 ;src/main.c:274: void moverEnemigoArriba(TEnemy *enemy){
                           1297 ;	---------------------------------
                           1298 ; Function moverEnemigoArriba
                           1299 ; ---------------------------------
   6B17                    1300 _moverEnemigoArriba::
   6B17 DD E5         [15] 1301 	push	ix
   6B19 DD 21 00 00   [14] 1302 	ld	ix,#0
   6B1D DD 39         [15] 1303 	add	ix,sp
                           1304 ;src/main.c:275: enemy->y--;
   6B1F DD 4E 04      [19] 1305 	ld	c,4 (ix)
   6B22 DD 46 05      [19] 1306 	ld	b,5 (ix)
   6B25 69            [ 4] 1307 	ld	l, c
   6B26 60            [ 4] 1308 	ld	h, b
   6B27 23            [ 6] 1309 	inc	hl
   6B28 5E            [ 7] 1310 	ld	e,(hl)
   6B29 1D            [ 4] 1311 	dec	e
   6B2A 73            [ 7] 1312 	ld	(hl),e
                           1313 ;src/main.c:276: enemy->y--;
   6B2B 1D            [ 4] 1314 	dec	e
   6B2C 73            [ 7] 1315 	ld	(hl),e
                           1316 ;src/main.c:277: enemy->mover = SI;
   6B2D 21 06 00      [10] 1317 	ld	hl,#0x0006
   6B30 09            [11] 1318 	add	hl,bc
   6B31 36 01         [10] 1319 	ld	(hl),#0x01
   6B33 DD E1         [14] 1320 	pop	ix
   6B35 C9            [10] 1321 	ret
                           1322 ;src/main.c:280: void moverEnemigoAbajo(TEnemy *enemy){
                           1323 ;	---------------------------------
                           1324 ; Function moverEnemigoAbajo
                           1325 ; ---------------------------------
   6B36                    1326 _moverEnemigoAbajo::
   6B36 DD E5         [15] 1327 	push	ix
   6B38 DD 21 00 00   [14] 1328 	ld	ix,#0
   6B3C DD 39         [15] 1329 	add	ix,sp
                           1330 ;src/main.c:281: enemy->y++;
   6B3E DD 4E 04      [19] 1331 	ld	c,4 (ix)
   6B41 DD 46 05      [19] 1332 	ld	b,5 (ix)
   6B44 59            [ 4] 1333 	ld	e, c
   6B45 50            [ 4] 1334 	ld	d, b
   6B46 13            [ 6] 1335 	inc	de
   6B47 1A            [ 7] 1336 	ld	a,(de)
   6B48 3C            [ 4] 1337 	inc	a
   6B49 12            [ 7] 1338 	ld	(de),a
                           1339 ;src/main.c:282: enemy->y++;
   6B4A 3C            [ 4] 1340 	inc	a
   6B4B 12            [ 7] 1341 	ld	(de),a
                           1342 ;src/main.c:283: enemy->mover = SI;
   6B4C 21 06 00      [10] 1343 	ld	hl,#0x0006
   6B4F 09            [11] 1344 	add	hl,bc
   6B50 36 01         [10] 1345 	ld	(hl),#0x01
   6B52 DD E1         [14] 1346 	pop	ix
   6B54 C9            [10] 1347 	ret
                           1348 ;src/main.c:286: void moverEnemigoDerecha(TEnemy *enemy){
                           1349 ;	---------------------------------
                           1350 ; Function moverEnemigoDerecha
                           1351 ; ---------------------------------
   6B55                    1352 _moverEnemigoDerecha::
                           1353 ;src/main.c:287: enemy->x++;
   6B55 D1            [10] 1354 	pop	de
   6B56 C1            [10] 1355 	pop	bc
   6B57 C5            [11] 1356 	push	bc
   6B58 D5            [11] 1357 	push	de
   6B59 0A            [ 7] 1358 	ld	a,(bc)
   6B5A 3C            [ 4] 1359 	inc	a
   6B5B 02            [ 7] 1360 	ld	(bc),a
                           1361 ;src/main.c:288: enemy->x++;
   6B5C 3C            [ 4] 1362 	inc	a
   6B5D 02            [ 7] 1363 	ld	(bc),a
                           1364 ;src/main.c:289: enemy->mover = SI;
   6B5E 21 06 00      [10] 1365 	ld	hl,#0x0006
   6B61 09            [11] 1366 	add	hl,bc
   6B62 36 01         [10] 1367 	ld	(hl),#0x01
   6B64 C9            [10] 1368 	ret
                           1369 ;src/main.c:292: void moverEnemigoIzquierda(TEnemy *enemy){
                           1370 ;	---------------------------------
                           1371 ; Function moverEnemigoIzquierda
                           1372 ; ---------------------------------
   6B65                    1373 _moverEnemigoIzquierda::
                           1374 ;src/main.c:293: enemy->x--;
   6B65 D1            [10] 1375 	pop	de
   6B66 C1            [10] 1376 	pop	bc
   6B67 C5            [11] 1377 	push	bc
   6B68 D5            [11] 1378 	push	de
   6B69 0A            [ 7] 1379 	ld	a,(bc)
   6B6A C6 FF         [ 7] 1380 	add	a,#0xFF
   6B6C 02            [ 7] 1381 	ld	(bc),a
                           1382 ;src/main.c:294: enemy->x--;
   6B6D C6 FF         [ 7] 1383 	add	a,#0xFF
   6B6F 02            [ 7] 1384 	ld	(bc),a
                           1385 ;src/main.c:295: enemy->mover = SI;
   6B70 21 06 00      [10] 1386 	ld	hl,#0x0006
   6B73 09            [11] 1387 	add	hl,bc
   6B74 36 01         [10] 1388 	ld	(hl),#0x01
   6B76 C9            [10] 1389 	ret
                           1390 ;src/main.c:298: void moverEnemigoPatrol(TEnemy* enemy){
                           1391 ;	---------------------------------
                           1392 ; Function moverEnemigoPatrol
                           1393 ; ---------------------------------
   6B77                    1394 _moverEnemigoPatrol::
   6B77 DD E5         [15] 1395 	push	ix
   6B79 DD 21 00 00   [14] 1396 	ld	ix,#0
   6B7D DD 39         [15] 1397 	add	ix,sp
   6B7F 21 F3 FF      [10] 1398 	ld	hl,#-13
   6B82 39            [11] 1399 	add	hl,sp
   6B83 F9            [ 6] 1400 	ld	sp,hl
                           1401 ;src/main.c:300: if(!enemy->muerto){
   6B84 DD 4E 04      [19] 1402 	ld	c,4 (ix)
   6B87 DD 46 05      [19] 1403 	ld	b,5 (ix)
   6B8A C5            [11] 1404 	push	bc
   6B8B FD E1         [14] 1405 	pop	iy
   6B8D FD 7E 08      [19] 1406 	ld	a,8 (iy)
   6B90 B7            [ 4] 1407 	or	a, a
   6B91 C2 BF 6D      [10] 1408 	jp	NZ,00118$
                           1409 ;src/main.c:301: if (!enemy->reversePatrol) {
   6B94 21 0C 00      [10] 1410 	ld	hl,#0x000C
   6B97 09            [11] 1411 	add	hl,bc
   6B98 E3            [19] 1412 	ex	(sp), hl
   6B99 E1            [10] 1413 	pop	hl
   6B9A E5            [11] 1414 	push	hl
   6B9B 7E            [ 7] 1415 	ld	a,(hl)
   6B9C DD 77 F5      [19] 1416 	ld	-11 (ix),a
                           1417 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6B9F 21 0E 00      [10] 1418 	ld	hl,#0x000E
   6BA2 09            [11] 1419 	add	hl,bc
   6BA3 DD 75 FE      [19] 1420 	ld	-2 (ix),l
   6BA6 DD 74 FF      [19] 1421 	ld	-1 (ix),h
   6BA9 DD 6E FE      [19] 1422 	ld	l,-2 (ix)
   6BAC DD 66 FF      [19] 1423 	ld	h,-1 (ix)
   6BAF 5E            [ 7] 1424 	ld	e,(hl)
   6BB0 23            [ 6] 1425 	inc	hl
   6BB1 56            [ 7] 1426 	ld	d,(hl)
   6BB2 21 E1 00      [10] 1427 	ld	hl,#0x00E1
   6BB5 09            [11] 1428 	add	hl,bc
   6BB6 DD 75 FC      [19] 1429 	ld	-4 (ix),l
   6BB9 DD 74 FD      [19] 1430 	ld	-3 (ix),h
                           1431 ;src/main.c:304: enemy->mover = SI;
   6BBC 21 06 00      [10] 1432 	ld	hl,#0x0006
   6BBF 09            [11] 1433 	add	hl,bc
   6BC0 DD 75 FA      [19] 1434 	ld	-6 (ix),l
   6BC3 DD 74 FB      [19] 1435 	ld	-5 (ix),h
                           1436 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6BC6 21 19 00      [10] 1437 	ld	hl,#0x0019
   6BC9 09            [11] 1438 	add	hl,bc
   6BCA DD 75 F8      [19] 1439 	ld	-8 (ix),l
   6BCD DD 74 F9      [19] 1440 	ld	-7 (ix),h
                           1441 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6BD0 21 01 00      [10] 1442 	ld	hl,#0x0001
   6BD3 09            [11] 1443 	add	hl,bc
   6BD4 DD 75 F6      [19] 1444 	ld	-10 (ix),l
   6BD7 DD 74 F7      [19] 1445 	ld	-9 (ix),h
                           1446 ;src/main.c:301: if (!enemy->reversePatrol) {
   6BDA DD 7E F5      [19] 1447 	ld	a,-11 (ix)
   6BDD B7            [ 4] 1448 	or	a, a
   6BDE C2 B9 6C      [10] 1449 	jp	NZ,00114$
                           1450 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6BE1 DD 6E FC      [19] 1451 	ld	l,-4 (ix)
   6BE4 DD 66 FD      [19] 1452 	ld	h,-3 (ix)
   6BE7 6E            [ 7] 1453 	ld	l,(hl)
   6BE8 26 00         [ 7] 1454 	ld	h,#0x00
   6BEA 7B            [ 4] 1455 	ld	a,e
   6BEB 95            [ 4] 1456 	sub	a, l
   6BEC 7A            [ 4] 1457 	ld	a,d
   6BED 9C            [ 4] 1458 	sbc	a, h
   6BEE E2 F3 6B      [10] 1459 	jp	PO, 00144$
   6BF1 EE 80         [ 7] 1460 	xor	a, #0x80
   6BF3                    1461 00144$:
   6BF3 F2 98 6C      [10] 1462 	jp	P,00105$
                           1463 ;src/main.c:303: if(enemy->iter == 0){
   6BF6 7A            [ 4] 1464 	ld	a,d
   6BF7 B3            [ 4] 1465 	or	a,e
   6BF8 20 54         [12] 1466 	jr	NZ,00102$
                           1467 ;src/main.c:304: enemy->mover = SI;
   6BFA DD 6E FA      [19] 1468 	ld	l,-6 (ix)
   6BFD DD 66 FB      [19] 1469 	ld	h,-5 (ix)
   6C00 36 01         [10] 1470 	ld	(hl),#0x01
                           1471 ;src/main.c:305: enemy->iter = 2;
   6C02 DD 6E FE      [19] 1472 	ld	l,-2 (ix)
   6C05 DD 66 FF      [19] 1473 	ld	h,-1 (ix)
   6C08 36 02         [10] 1474 	ld	(hl),#0x02
   6C0A 23            [ 6] 1475 	inc	hl
   6C0B 36 00         [10] 1476 	ld	(hl),#0x00
                           1477 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6C0D DD 6E FE      [19] 1478 	ld	l,-2 (ix)
   6C10 DD 66 FF      [19] 1479 	ld	h,-1 (ix)
   6C13 5E            [ 7] 1480 	ld	e,(hl)
   6C14 23            [ 6] 1481 	inc	hl
   6C15 56            [ 7] 1482 	ld	d,(hl)
   6C16 DD 6E F8      [19] 1483 	ld	l,-8 (ix)
   6C19 DD 66 F9      [19] 1484 	ld	h,-7 (ix)
   6C1C 19            [11] 1485 	add	hl,de
   6C1D 7E            [ 7] 1486 	ld	a,(hl)
   6C1E 02            [ 7] 1487 	ld	(bc),a
                           1488 ;src/main.c:307: ++enemy->iter;
   6C1F DD 6E FE      [19] 1489 	ld	l,-2 (ix)
   6C22 DD 66 FF      [19] 1490 	ld	h,-1 (ix)
   6C25 4E            [ 7] 1491 	ld	c,(hl)
   6C26 23            [ 6] 1492 	inc	hl
   6C27 46            [ 7] 1493 	ld	b,(hl)
   6C28 03            [ 6] 1494 	inc	bc
   6C29 DD 6E FE      [19] 1495 	ld	l,-2 (ix)
   6C2C DD 66 FF      [19] 1496 	ld	h,-1 (ix)
   6C2F 71            [ 7] 1497 	ld	(hl),c
   6C30 23            [ 6] 1498 	inc	hl
   6C31 70            [ 7] 1499 	ld	(hl),b
                           1500 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6C32 DD 6E F8      [19] 1501 	ld	l,-8 (ix)
   6C35 DD 66 F9      [19] 1502 	ld	h,-7 (ix)
   6C38 09            [11] 1503 	add	hl,bc
   6C39 5E            [ 7] 1504 	ld	e,(hl)
   6C3A DD 6E F6      [19] 1505 	ld	l,-10 (ix)
   6C3D DD 66 F7      [19] 1506 	ld	h,-9 (ix)
   6C40 73            [ 7] 1507 	ld	(hl),e
                           1508 ;src/main.c:309: ++enemy->iter;
   6C41 03            [ 6] 1509 	inc	bc
   6C42 DD 6E FE      [19] 1510 	ld	l,-2 (ix)
   6C45 DD 66 FF      [19] 1511 	ld	h,-1 (ix)
   6C48 71            [ 7] 1512 	ld	(hl),c
   6C49 23            [ 6] 1513 	inc	hl
   6C4A 70            [ 7] 1514 	ld	(hl),b
   6C4B C3 BF 6D      [10] 1515 	jp	00118$
   6C4E                    1516 00102$:
                           1517 ;src/main.c:311: enemy->mover = SI;
   6C4E DD 6E FA      [19] 1518 	ld	l,-6 (ix)
   6C51 DD 66 FB      [19] 1519 	ld	h,-5 (ix)
   6C54 36 01         [10] 1520 	ld	(hl),#0x01
                           1521 ;src/main.c:312: enemy->x = enemy->camino[enemy->iter];
   6C56 DD 6E FE      [19] 1522 	ld	l,-2 (ix)
   6C59 DD 66 FF      [19] 1523 	ld	h,-1 (ix)
   6C5C 5E            [ 7] 1524 	ld	e,(hl)
   6C5D 23            [ 6] 1525 	inc	hl
   6C5E 56            [ 7] 1526 	ld	d,(hl)
   6C5F DD 6E F8      [19] 1527 	ld	l,-8 (ix)
   6C62 DD 66 F9      [19] 1528 	ld	h,-7 (ix)
   6C65 19            [11] 1529 	add	hl,de
   6C66 7E            [ 7] 1530 	ld	a,(hl)
   6C67 02            [ 7] 1531 	ld	(bc),a
                           1532 ;src/main.c:313: ++enemy->iter;
   6C68 DD 6E FE      [19] 1533 	ld	l,-2 (ix)
   6C6B DD 66 FF      [19] 1534 	ld	h,-1 (ix)
   6C6E 5E            [ 7] 1535 	ld	e,(hl)
   6C6F 23            [ 6] 1536 	inc	hl
   6C70 56            [ 7] 1537 	ld	d,(hl)
   6C71 13            [ 6] 1538 	inc	de
   6C72 DD 6E FE      [19] 1539 	ld	l,-2 (ix)
   6C75 DD 66 FF      [19] 1540 	ld	h,-1 (ix)
   6C78 73            [ 7] 1541 	ld	(hl),e
   6C79 23            [ 6] 1542 	inc	hl
   6C7A 72            [ 7] 1543 	ld	(hl),d
                           1544 ;src/main.c:314: enemy->y = enemy->camino[enemy->iter];
   6C7B DD 6E F8      [19] 1545 	ld	l,-8 (ix)
   6C7E DD 66 F9      [19] 1546 	ld	h,-7 (ix)
   6C81 19            [11] 1547 	add	hl,de
   6C82 7E            [ 7] 1548 	ld	a,(hl)
   6C83 DD 6E F6      [19] 1549 	ld	l,-10 (ix)
   6C86 DD 66 F7      [19] 1550 	ld	h,-9 (ix)
   6C89 77            [ 7] 1551 	ld	(hl),a
                           1552 ;src/main.c:315: ++enemy->iter;
   6C8A 13            [ 6] 1553 	inc	de
   6C8B 4B            [ 4] 1554 	ld	c,e
   6C8C DD 6E FE      [19] 1555 	ld	l,-2 (ix)
   6C8F DD 66 FF      [19] 1556 	ld	h,-1 (ix)
   6C92 71            [ 7] 1557 	ld	(hl),c
   6C93 23            [ 6] 1558 	inc	hl
   6C94 72            [ 7] 1559 	ld	(hl),d
   6C95 C3 BF 6D      [10] 1560 	jp	00118$
   6C98                    1561 00105$:
                           1562 ;src/main.c:319: enemy->mover = NO;
   6C98 DD 6E FA      [19] 1563 	ld	l,-6 (ix)
   6C9B DD 66 FB      [19] 1564 	ld	h,-5 (ix)
   6C9E 36 00         [10] 1565 	ld	(hl),#0x00
                           1566 ;src/main.c:320: enemy->iter = enemy->longitud_camino;
   6CA0 DD 6E FC      [19] 1567 	ld	l,-4 (ix)
   6CA3 DD 66 FD      [19] 1568 	ld	h,-3 (ix)
   6CA6 4E            [ 7] 1569 	ld	c,(hl)
   6CA7 06 00         [ 7] 1570 	ld	b,#0x00
   6CA9 DD 6E FE      [19] 1571 	ld	l,-2 (ix)
   6CAC DD 66 FF      [19] 1572 	ld	h,-1 (ix)
   6CAF 71            [ 7] 1573 	ld	(hl),c
   6CB0 23            [ 6] 1574 	inc	hl
   6CB1 70            [ 7] 1575 	ld	(hl),b
                           1576 ;src/main.c:321: enemy->reversePatrol = 1;
   6CB2 E1            [10] 1577 	pop	hl
   6CB3 E5            [11] 1578 	push	hl
   6CB4 36 01         [10] 1579 	ld	(hl),#0x01
   6CB6 C3 BF 6D      [10] 1580 	jp	00118$
   6CB9                    1581 00114$:
                           1582 ;src/main.c:324: if(enemy->iter > 0){
   6CB9 AF            [ 4] 1583 	xor	a, a
   6CBA BB            [ 4] 1584 	cp	a, e
   6CBB 9A            [ 4] 1585 	sbc	a, d
   6CBC E2 C1 6C      [10] 1586 	jp	PO, 00145$
   6CBF EE 80         [ 7] 1587 	xor	a, #0x80
   6CC1                    1588 00145$:
   6CC1 F2 A9 6D      [10] 1589 	jp	P,00111$
                           1590 ;src/main.c:325: if(enemy->iter == enemy->longitud_camino){
   6CC4 DD 6E FC      [19] 1591 	ld	l,-4 (ix)
   6CC7 DD 66 FD      [19] 1592 	ld	h,-3 (ix)
   6CCA 6E            [ 7] 1593 	ld	l,(hl)
   6CCB DD 75 FC      [19] 1594 	ld	-4 (ix),l
   6CCE DD 36 FD 00   [19] 1595 	ld	-3 (ix),#0x00
   6CD2 7B            [ 4] 1596 	ld	a,e
   6CD3 DD 96 FC      [19] 1597 	sub	a, -4 (ix)
   6CD6 C2 61 6D      [10] 1598 	jp	NZ,00108$
   6CD9 7A            [ 4] 1599 	ld	a,d
   6CDA DD 96 FD      [19] 1600 	sub	a, -3 (ix)
   6CDD C2 61 6D      [10] 1601 	jp	NZ,00108$
                           1602 ;src/main.c:326: enemy->mover = SI;
   6CE0 DD 6E FA      [19] 1603 	ld	l,-6 (ix)
   6CE3 DD 66 FB      [19] 1604 	ld	h,-5 (ix)
   6CE6 36 01         [10] 1605 	ld	(hl),#0x01
                           1606 ;src/main.c:327: enemy->iter = enemy->iter - 1;
   6CE8 DD 6E FE      [19] 1607 	ld	l,-2 (ix)
   6CEB DD 66 FF      [19] 1608 	ld	h,-1 (ix)
   6CEE 5E            [ 7] 1609 	ld	e,(hl)
   6CEF 23            [ 6] 1610 	inc	hl
   6CF0 56            [ 7] 1611 	ld	d,(hl)
   6CF1 7B            [ 4] 1612 	ld	a,e
   6CF2 C6 FF         [ 7] 1613 	add	a,#0xFF
   6CF4 DD 77 FC      [19] 1614 	ld	-4 (ix),a
   6CF7 7A            [ 4] 1615 	ld	a,d
   6CF8 CE FF         [ 7] 1616 	adc	a,#0xFF
   6CFA DD 77 FD      [19] 1617 	ld	-3 (ix),a
   6CFD DD 6E FE      [19] 1618 	ld	l,-2 (ix)
   6D00 DD 66 FF      [19] 1619 	ld	h,-1 (ix)
   6D03 DD 7E FC      [19] 1620 	ld	a,-4 (ix)
   6D06 77            [ 7] 1621 	ld	(hl),a
   6D07 23            [ 6] 1622 	inc	hl
   6D08 DD 7E FD      [19] 1623 	ld	a,-3 (ix)
   6D0B 77            [ 7] 1624 	ld	(hl),a
                           1625 ;src/main.c:328: enemy->iter = enemy->iter - 2;
   6D0C DD 5E FC      [19] 1626 	ld	e,-4 (ix)
   6D0F DD 56 FD      [19] 1627 	ld	d,-3 (ix)
   6D12 1B            [ 6] 1628 	dec	de
   6D13 1B            [ 6] 1629 	dec	de
   6D14 DD 6E FE      [19] 1630 	ld	l,-2 (ix)
   6D17 DD 66 FF      [19] 1631 	ld	h,-1 (ix)
   6D1A 73            [ 7] 1632 	ld	(hl),e
   6D1B 23            [ 6] 1633 	inc	hl
   6D1C 72            [ 7] 1634 	ld	(hl),d
                           1635 ;src/main.c:329: enemy->y = enemy->camino[enemy->iter];
   6D1D DD 6E F8      [19] 1636 	ld	l,-8 (ix)
   6D20 DD 66 F9      [19] 1637 	ld	h,-7 (ix)
   6D23 19            [11] 1638 	add	hl,de
   6D24 5E            [ 7] 1639 	ld	e,(hl)
   6D25 DD 6E F6      [19] 1640 	ld	l,-10 (ix)
   6D28 DD 66 F7      [19] 1641 	ld	h,-9 (ix)
   6D2B 73            [ 7] 1642 	ld	(hl),e
                           1643 ;src/main.c:330: --enemy->iter;
   6D2C DD 7E FC      [19] 1644 	ld	a,-4 (ix)
   6D2F C6 FD         [ 7] 1645 	add	a,#0xFD
   6D31 5F            [ 4] 1646 	ld	e,a
   6D32 DD 7E FD      [19] 1647 	ld	a,-3 (ix)
   6D35 CE FF         [ 7] 1648 	adc	a,#0xFF
   6D37 57            [ 4] 1649 	ld	d,a
   6D38 DD 6E FE      [19] 1650 	ld	l,-2 (ix)
   6D3B DD 66 FF      [19] 1651 	ld	h,-1 (ix)
   6D3E 73            [ 7] 1652 	ld	(hl),e
   6D3F 23            [ 6] 1653 	inc	hl
   6D40 72            [ 7] 1654 	ld	(hl),d
                           1655 ;src/main.c:331: enemy->x = enemy->camino[enemy->iter];
   6D41 DD 6E F8      [19] 1656 	ld	l,-8 (ix)
   6D44 DD 66 F9      [19] 1657 	ld	h,-7 (ix)
   6D47 19            [11] 1658 	add	hl,de
   6D48 7E            [ 7] 1659 	ld	a,(hl)
   6D49 02            [ 7] 1660 	ld	(bc),a
                           1661 ;src/main.c:332: --enemy->iter;
   6D4A DD 7E FC      [19] 1662 	ld	a,-4 (ix)
   6D4D C6 FC         [ 7] 1663 	add	a,#0xFC
   6D4F 4F            [ 4] 1664 	ld	c,a
   6D50 DD 7E FD      [19] 1665 	ld	a,-3 (ix)
   6D53 CE FF         [ 7] 1666 	adc	a,#0xFF
   6D55 47            [ 4] 1667 	ld	b,a
   6D56 DD 6E FE      [19] 1668 	ld	l,-2 (ix)
   6D59 DD 66 FF      [19] 1669 	ld	h,-1 (ix)
   6D5C 71            [ 7] 1670 	ld	(hl),c
   6D5D 23            [ 6] 1671 	inc	hl
   6D5E 70            [ 7] 1672 	ld	(hl),b
   6D5F 18 5E         [12] 1673 	jr	00118$
   6D61                    1674 00108$:
                           1675 ;src/main.c:334: enemy->mover = SI;
   6D61 DD 6E FA      [19] 1676 	ld	l,-6 (ix)
   6D64 DD 66 FB      [19] 1677 	ld	h,-5 (ix)
   6D67 36 01         [10] 1678 	ld	(hl),#0x01
                           1679 ;src/main.c:335: enemy->y = enemy->camino[enemy->iter];
   6D69 DD 6E FE      [19] 1680 	ld	l,-2 (ix)
   6D6C DD 66 FF      [19] 1681 	ld	h,-1 (ix)
   6D6F 5E            [ 7] 1682 	ld	e,(hl)
   6D70 23            [ 6] 1683 	inc	hl
   6D71 56            [ 7] 1684 	ld	d,(hl)
   6D72 DD 6E F8      [19] 1685 	ld	l,-8 (ix)
   6D75 DD 66 F9      [19] 1686 	ld	h,-7 (ix)
   6D78 19            [11] 1687 	add	hl,de
   6D79 5E            [ 7] 1688 	ld	e,(hl)
   6D7A DD 6E F6      [19] 1689 	ld	l,-10 (ix)
   6D7D DD 66 F7      [19] 1690 	ld	h,-9 (ix)
   6D80 73            [ 7] 1691 	ld	(hl),e
                           1692 ;src/main.c:336: --enemy->iter;
   6D81 DD 6E FE      [19] 1693 	ld	l,-2 (ix)
   6D84 DD 66 FF      [19] 1694 	ld	h,-1 (ix)
   6D87 5E            [ 7] 1695 	ld	e,(hl)
   6D88 23            [ 6] 1696 	inc	hl
   6D89 56            [ 7] 1697 	ld	d,(hl)
   6D8A 1B            [ 6] 1698 	dec	de
   6D8B DD 6E FE      [19] 1699 	ld	l,-2 (ix)
   6D8E DD 66 FF      [19] 1700 	ld	h,-1 (ix)
   6D91 73            [ 7] 1701 	ld	(hl),e
   6D92 23            [ 6] 1702 	inc	hl
   6D93 72            [ 7] 1703 	ld	(hl),d
                           1704 ;src/main.c:337: enemy->x = enemy->camino[enemy->iter];
   6D94 DD 6E F8      [19] 1705 	ld	l,-8 (ix)
   6D97 DD 66 F9      [19] 1706 	ld	h,-7 (ix)
   6D9A 19            [11] 1707 	add	hl,de
   6D9B 7E            [ 7] 1708 	ld	a,(hl)
   6D9C 02            [ 7] 1709 	ld	(bc),a
                           1710 ;src/main.c:338: --enemy->iter;
   6D9D 1B            [ 6] 1711 	dec	de
   6D9E DD 6E FE      [19] 1712 	ld	l,-2 (ix)
   6DA1 DD 66 FF      [19] 1713 	ld	h,-1 (ix)
   6DA4 73            [ 7] 1714 	ld	(hl),e
   6DA5 23            [ 6] 1715 	inc	hl
   6DA6 72            [ 7] 1716 	ld	(hl),d
   6DA7 18 16         [12] 1717 	jr	00118$
   6DA9                    1718 00111$:
                           1719 ;src/main.c:342: enemy->mover = NO;
   6DA9 DD 6E FA      [19] 1720 	ld	l,-6 (ix)
   6DAC DD 66 FB      [19] 1721 	ld	h,-5 (ix)
   6DAF 36 00         [10] 1722 	ld	(hl),#0x00
                           1723 ;src/main.c:343: enemy->iter = 0;
   6DB1 DD 6E FE      [19] 1724 	ld	l,-2 (ix)
   6DB4 DD 66 FF      [19] 1725 	ld	h,-1 (ix)
   6DB7 AF            [ 4] 1726 	xor	a, a
   6DB8 77            [ 7] 1727 	ld	(hl), a
   6DB9 23            [ 6] 1728 	inc	hl
   6DBA 77            [ 7] 1729 	ld	(hl), a
                           1730 ;src/main.c:344: enemy->reversePatrol = 0;
   6DBB E1            [10] 1731 	pop	hl
   6DBC E5            [11] 1732 	push	hl
   6DBD 36 00         [10] 1733 	ld	(hl),#0x00
   6DBF                    1734 00118$:
   6DBF DD F9         [10] 1735 	ld	sp, ix
   6DC1 DD E1         [14] 1736 	pop	ix
   6DC3 C9            [10] 1737 	ret
                           1738 ;src/main.c:350: void lookFor(TEnemy* enemy){
                           1739 ;	---------------------------------
                           1740 ; Function lookFor
                           1741 ; ---------------------------------
   6DC4                    1742 _lookFor::
   6DC4 DD E5         [15] 1743 	push	ix
   6DC6 DD 21 00 00   [14] 1744 	ld	ix,#0
   6DCA DD 39         [15] 1745 	add	ix,sp
   6DCC 21 F9 FF      [10] 1746 	ld	hl,#-7
   6DCF 39            [11] 1747 	add	hl,sp
   6DD0 F9            [ 6] 1748 	ld	sp,hl
                           1749 ;src/main.c:356: i16 difx = abs((i16)(enemy->x - prota.x));
   6DD1 DD 5E 04      [19] 1750 	ld	e,4 (ix)
   6DD4 DD 56 05      [19] 1751 	ld	d,5 (ix)
   6DD7 1A            [ 7] 1752 	ld	a,(de)
   6DD8 4F            [ 4] 1753 	ld	c,a
   6DD9 06 00         [ 7] 1754 	ld	b,#0x00
   6DDB 21 E8 63      [10] 1755 	ld	hl,#_prota+0
   6DDE 6E            [ 7] 1756 	ld	l,(hl)
   6DDF 26 00         [ 7] 1757 	ld	h,#0x00
   6DE1 79            [ 4] 1758 	ld	a,c
   6DE2 95            [ 4] 1759 	sub	a, l
   6DE3 4F            [ 4] 1760 	ld	c,a
   6DE4 78            [ 4] 1761 	ld	a,b
   6DE5 9C            [ 4] 1762 	sbc	a, h
   6DE6 47            [ 4] 1763 	ld	b,a
   6DE7 D5            [11] 1764 	push	de
   6DE8 C5            [11] 1765 	push	bc
   6DE9 CD 60 4B      [17] 1766 	call	_abs
   6DEC F1            [10] 1767 	pop	af
   6DED D1            [10] 1768 	pop	de
   6DEE 33            [ 6] 1769 	inc	sp
   6DEF 33            [ 6] 1770 	inc	sp
   6DF0 E5            [11] 1771 	push	hl
                           1772 ;src/main.c:357: i16 dify = abs((i16)(enemy->y - prota.y));
   6DF1 21 01 00      [10] 1773 	ld	hl,#0x0001
   6DF4 19            [11] 1774 	add	hl,de
   6DF5 DD 75 FE      [19] 1775 	ld	-2 (ix),l
   6DF8 DD 74 FF      [19] 1776 	ld	-1 (ix),h
   6DFB DD 6E FE      [19] 1777 	ld	l,-2 (ix)
   6DFE DD 66 FF      [19] 1778 	ld	h,-1 (ix)
   6E01 4E            [ 7] 1779 	ld	c,(hl)
   6E02 06 00         [ 7] 1780 	ld	b,#0x00
   6E04 21 E9 63      [10] 1781 	ld	hl, #(_prota + 0x0001) + 0
   6E07 6E            [ 7] 1782 	ld	l,(hl)
   6E08 26 00         [ 7] 1783 	ld	h,#0x00
   6E0A 79            [ 4] 1784 	ld	a,c
   6E0B 95            [ 4] 1785 	sub	a, l
   6E0C 4F            [ 4] 1786 	ld	c,a
   6E0D 78            [ 4] 1787 	ld	a,b
   6E0E 9C            [ 4] 1788 	sbc	a, h
   6E0F 47            [ 4] 1789 	ld	b,a
   6E10 D5            [11] 1790 	push	de
   6E11 C5            [11] 1791 	push	bc
   6E12 CD 60 4B      [17] 1792 	call	_abs
   6E15 F1            [10] 1793 	pop	af
   6E16 D1            [10] 1794 	pop	de
                           1795 ;src/main.c:359: dist = difx + dify; // manhattan
   6E17 DD 4E F9      [19] 1796 	ld	c,-7 (ix)
   6E1A 09            [11] 1797 	add	hl, bc
   6E1B DD 75 FB      [19] 1798 	ld	-5 (ix),l
                           1799 ;src/main.c:360: enemy->seen = NO;
   6E1E 21 12 00      [10] 1800 	ld	hl,#0x0012
   6E21 19            [11] 1801 	add	hl,de
   6E22 DD 75 FC      [19] 1802 	ld	-4 (ix),l
   6E25 DD 74 FD      [19] 1803 	ld	-3 (ix),h
   6E28 DD 6E FC      [19] 1804 	ld	l,-4 (ix)
   6E2B DD 66 FD      [19] 1805 	ld	h,-3 (ix)
   6E2E 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:361: enemy->in_range = NO;
   6E30 21 11 00      [10] 1808 	ld	hl,#0x0011
   6E33 19            [11] 1809 	add	hl,de
   6E34 4D            [ 4] 1810 	ld	c,l
   6E35 44            [ 4] 1811 	ld	b,h
   6E36 AF            [ 4] 1812 	xor	a, a
   6E37 02            [ 7] 1813 	ld	(bc),a
                           1814 ;src/main.c:363: if(!enemy->seek){
   6E38 D5            [11] 1815 	push	de
   6E39 FD E1         [14] 1816 	pop	iy
   6E3B FD 7E 14      [19] 1817 	ld	a,20 (iy)
   6E3E B7            [ 4] 1818 	or	a, a
   6E3F C2 C5 6E      [10] 1819 	jp	NZ,00111$
                           1820 ;src/main.c:364: if (dist <= 10) {// te detectan los sensores de proximidad
   6E42 3E 0A         [ 7] 1821 	ld	a,#0x0A
   6E44 DD 96 FB      [19] 1822 	sub	a, -5 (ix)
   6E47 38 13         [12] 1823 	jr	C,00107$
                           1824 ;src/main.c:365: enemy->in_range = 1;
   6E49 3E 01         [ 7] 1825 	ld	a,#0x01
   6E4B 02            [ 7] 1826 	ld	(bc),a
                           1827 ;src/main.c:366: enemy->engage = 1;
   6E4C 21 16 00      [10] 1828 	ld	hl,#0x0016
   6E4F 19            [11] 1829 	add	hl,de
   6E50 36 01         [10] 1830 	ld	(hl),#0x01
                           1831 ;src/main.c:367: enemy->seen = SI;
   6E52 DD 6E FC      [19] 1832 	ld	l,-4 (ix)
   6E55 DD 66 FD      [19] 1833 	ld	h,-3 (ix)
   6E58 36 01         [10] 1834 	ld	(hl),#0x01
   6E5A 18 69         [12] 1835 	jr	00111$
   6E5C                    1836 00107$:
                           1837 ;src/main.c:368: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6E5C 21 E8 63      [10] 1838 	ld	hl, #_prota + 0
   6E5F 4E            [ 7] 1839 	ld	c,(hl)
   6E60 1A            [ 7] 1840 	ld	a,(de)
   6E61 5F            [ 4] 1841 	ld	e,a
   6E62 16 00         [ 7] 1842 	ld	d,#0x00
   6E64 7B            [ 4] 1843 	ld	a,e
   6E65 C6 E7         [ 7] 1844 	add	a,#0xE7
   6E67 6F            [ 4] 1845 	ld	l,a
   6E68 7A            [ 4] 1846 	ld	a,d
   6E69 CE FF         [ 7] 1847 	adc	a,#0xFF
   6E6B 67            [ 4] 1848 	ld	h,a
   6E6C 06 00         [ 7] 1849 	ld	b,#0x00
   6E6E 7D            [ 4] 1850 	ld	a,l
   6E6F 91            [ 4] 1851 	sub	a, c
   6E70 7C            [ 4] 1852 	ld	a,h
   6E71 98            [ 4] 1853 	sbc	a, b
   6E72 E2 77 6E      [10] 1854 	jp	PO, 00137$
   6E75 EE 80         [ 7] 1855 	xor	a, #0x80
   6E77                    1856 00137$:
   6E77 F2 C5 6E      [10] 1857 	jp	P,00111$
   6E7A 21 19 00      [10] 1858 	ld	hl,#0x0019
   6E7D 19            [11] 1859 	add	hl,de
   6E7E 79            [ 4] 1860 	ld	a,c
   6E7F 95            [ 4] 1861 	sub	a, l
   6E80 78            [ 4] 1862 	ld	a,b
   6E81 9C            [ 4] 1863 	sbc	a, h
   6E82 E2 87 6E      [10] 1864 	jp	PO, 00138$
   6E85 EE 80         [ 7] 1865 	xor	a, #0x80
   6E87                    1866 00138$:
   6E87 F2 C5 6E      [10] 1867 	jp	P,00111$
                           1868 ;src/main.c:369: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6E8A 21 E9 63      [10] 1869 	ld	hl, #(_prota + 0x0001) + 0
   6E8D 4E            [ 7] 1870 	ld	c,(hl)
   6E8E DD 6E FE      [19] 1871 	ld	l,-2 (ix)
   6E91 DD 66 FF      [19] 1872 	ld	h,-1 (ix)
   6E94 5E            [ 7] 1873 	ld	e,(hl)
   6E95 16 00         [ 7] 1874 	ld	d,#0x00
   6E97 7B            [ 4] 1875 	ld	a,e
   6E98 C6 CC         [ 7] 1876 	add	a,#0xCC
   6E9A 6F            [ 4] 1877 	ld	l,a
   6E9B 7A            [ 4] 1878 	ld	a,d
   6E9C CE FF         [ 7] 1879 	adc	a,#0xFF
   6E9E 67            [ 4] 1880 	ld	h,a
   6E9F 06 00         [ 7] 1881 	ld	b,#0x00
   6EA1 7D            [ 4] 1882 	ld	a,l
   6EA2 91            [ 4] 1883 	sub	a, c
   6EA3 7C            [ 4] 1884 	ld	a,h
   6EA4 98            [ 4] 1885 	sbc	a, b
   6EA5 E2 AA 6E      [10] 1886 	jp	PO, 00139$
   6EA8 EE 80         [ 7] 1887 	xor	a, #0x80
   6EAA                    1888 00139$:
   6EAA F2 C5 6E      [10] 1889 	jp	P,00111$
   6EAD 21 34 00      [10] 1890 	ld	hl,#0x0034
   6EB0 19            [11] 1891 	add	hl,de
   6EB1 79            [ 4] 1892 	ld	a,c
   6EB2 95            [ 4] 1893 	sub	a, l
   6EB3 78            [ 4] 1894 	ld	a,b
   6EB4 9C            [ 4] 1895 	sbc	a, h
   6EB5 E2 BA 6E      [10] 1896 	jp	PO, 00140$
   6EB8 EE 80         [ 7] 1897 	xor	a, #0x80
   6EBA                    1898 00140$:
   6EBA F2 C5 6E      [10] 1899 	jp	P,00111$
                           1900 ;src/main.c:370: enemy->seen = SI;
   6EBD DD 6E FC      [19] 1901 	ld	l,-4 (ix)
   6EC0 DD 66 FD      [19] 1902 	ld	h,-3 (ix)
   6EC3 36 01         [10] 1903 	ld	(hl),#0x01
   6EC5                    1904 00111$:
   6EC5 DD F9         [10] 1905 	ld	sp, ix
   6EC7 DD E1         [14] 1906 	pop	ix
   6EC9 C9            [10] 1907 	ret
                           1908 ;src/main.c:375: void moverEnemigoSeek(TEnemy* actual){
                           1909 ;	---------------------------------
                           1910 ; Function moverEnemigoSeek
                           1911 ; ---------------------------------
   6ECA                    1912 _moverEnemigoSeek::
   6ECA DD E5         [15] 1913 	push	ix
   6ECC DD 21 00 00   [14] 1914 	ld	ix,#0
   6ED0 DD 39         [15] 1915 	add	ix,sp
   6ED2 21 F6 FF      [10] 1916 	ld	hl,#-10
   6ED5 39            [11] 1917 	add	hl,sp
   6ED6 F9            [ 6] 1918 	ld	sp,hl
                           1919 ;src/main.c:377: if(!actual->muerto){
   6ED7 DD 4E 04      [19] 1920 	ld	c,4 (ix)
   6EDA DD 46 05      [19] 1921 	ld	b,5 (ix)
   6EDD C5            [11] 1922 	push	bc
   6EDE FD E1         [14] 1923 	pop	iy
   6EE0 FD 7E 08      [19] 1924 	ld	a, 8 (iy)
   6EE3 B7            [ 4] 1925 	or	a, a
   6EE4 C2 6A 70      [10] 1926 	jp	NZ,00114$
                           1927 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6EE7 21 0E 00      [10] 1928 	ld	hl,#0x000E
   6EEA 09            [11] 1929 	add	hl,bc
   6EEB DD 75 F8      [19] 1930 	ld	-8 (ix),l
   6EEE DD 74 F9      [19] 1931 	ld	-7 (ix),h
   6EF1 DD 6E F8      [19] 1932 	ld	l,-8 (ix)
   6EF4 DD 66 F9      [19] 1933 	ld	h,-7 (ix)
   6EF7 7E            [ 7] 1934 	ld	a,(hl)
   6EF8 DD 77 F6      [19] 1935 	ld	-10 (ix),a
   6EFB 23            [ 6] 1936 	inc	hl
   6EFC 7E            [ 7] 1937 	ld	a,(hl)
   6EFD DD 77 F7      [19] 1938 	ld	-9 (ix),a
   6F00 69            [ 4] 1939 	ld	l, c
   6F01 60            [ 4] 1940 	ld	h, b
   6F02 11 E1 00      [10] 1941 	ld	de, #0x00E1
   6F05 19            [11] 1942 	add	hl, de
   6F06 5E            [ 7] 1943 	ld	e,(hl)
   6F07 16 00         [ 7] 1944 	ld	d,#0x00
                           1945 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F09 21 01 00      [10] 1946 	ld	hl,#0x0001
   6F0C 09            [11] 1947 	add	hl,bc
   6F0D DD 75 FB      [19] 1948 	ld	-5 (ix),l
   6F10 DD 74 FC      [19] 1949 	ld	-4 (ix),h
                           1950 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6F13 DD 7E F6      [19] 1951 	ld	a,-10 (ix)
   6F16 93            [ 4] 1952 	sub	a, e
   6F17 DD 7E F7      [19] 1953 	ld	a,-9 (ix)
   6F1A 9A            [ 4] 1954 	sbc	a, d
   6F1B E2 20 6F      [10] 1955 	jp	PO, 00136$
   6F1E EE 80         [ 7] 1956 	xor	a, #0x80
   6F20                    1957 00136$:
   6F20 F2 B4 6F      [10] 1958 	jp	P,00110$
                           1959 ;src/main.c:385: actual->mover = SI;
   6F23 21 06 00      [10] 1960 	ld	hl,#0x0006
   6F26 09            [11] 1961 	add	hl,bc
                           1962 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F27 79            [ 4] 1963 	ld	a,c
   6F28 C6 19         [ 7] 1964 	add	a, #0x19
   6F2A 5F            [ 4] 1965 	ld	e,a
   6F2B 78            [ 4] 1966 	ld	a,b
   6F2C CE 00         [ 7] 1967 	adc	a, #0x00
   6F2E 57            [ 4] 1968 	ld	d,a
                           1969 ;src/main.c:383: if(actual->iter == 0){
   6F2F DD 7E F7      [19] 1970 	ld	a,-9 (ix)
   6F32 DD B6 F6      [19] 1971 	or	a,-10 (ix)
   6F35 20 44         [12] 1972 	jr	NZ,00102$
                           1973 ;src/main.c:385: actual->mover = SI;
   6F37 36 01         [10] 1974 	ld	(hl),#0x01
                           1975 ;src/main.c:386: actual->iter = 2;
   6F39 DD 6E F8      [19] 1976 	ld	l,-8 (ix)
   6F3C DD 66 F9      [19] 1977 	ld	h,-7 (ix)
   6F3F 36 02         [10] 1978 	ld	(hl),#0x02
   6F41 23            [ 6] 1979 	inc	hl
   6F42 36 00         [10] 1980 	ld	(hl),#0x00
                           1981 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F44 DD 6E F8      [19] 1982 	ld	l,-8 (ix)
   6F47 DD 66 F9      [19] 1983 	ld	h,-7 (ix)
   6F4A 7E            [ 7] 1984 	ld	a, (hl)
   6F4B 23            [ 6] 1985 	inc	hl
   6F4C 66            [ 7] 1986 	ld	h,(hl)
   6F4D 6F            [ 4] 1987 	ld	l,a
   6F4E 19            [11] 1988 	add	hl,de
   6F4F 7E            [ 7] 1989 	ld	a,(hl)
   6F50 02            [ 7] 1990 	ld	(bc),a
                           1991 ;src/main.c:388: ++actual->iter;
   6F51 DD 6E F8      [19] 1992 	ld	l,-8 (ix)
   6F54 DD 66 F9      [19] 1993 	ld	h,-7 (ix)
   6F57 4E            [ 7] 1994 	ld	c,(hl)
   6F58 23            [ 6] 1995 	inc	hl
   6F59 46            [ 7] 1996 	ld	b,(hl)
   6F5A 03            [ 6] 1997 	inc	bc
   6F5B DD 6E F8      [19] 1998 	ld	l,-8 (ix)
   6F5E DD 66 F9      [19] 1999 	ld	h,-7 (ix)
   6F61 71            [ 7] 2000 	ld	(hl),c
   6F62 23            [ 6] 2001 	inc	hl
   6F63 70            [ 7] 2002 	ld	(hl),b
                           2003 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F64 EB            [ 4] 2004 	ex	de,hl
   6F65 09            [11] 2005 	add	hl,bc
   6F66 5E            [ 7] 2006 	ld	e,(hl)
   6F67 DD 6E FB      [19] 2007 	ld	l,-5 (ix)
   6F6A DD 66 FC      [19] 2008 	ld	h,-4 (ix)
   6F6D 73            [ 7] 2009 	ld	(hl),e
                           2010 ;src/main.c:390: ++actual->iter;
   6F6E 03            [ 6] 2011 	inc	bc
   6F6F DD 6E F8      [19] 2012 	ld	l,-8 (ix)
   6F72 DD 66 F9      [19] 2013 	ld	h,-7 (ix)
   6F75 71            [ 7] 2014 	ld	(hl),c
   6F76 23            [ 6] 2015 	inc	hl
   6F77 70            [ 7] 2016 	ld	(hl),b
   6F78 C3 6A 70      [10] 2017 	jp	00114$
   6F7B                    2018 00102$:
                           2019 ;src/main.c:393: actual->mover = SI;
   6F7B 36 01         [10] 2020 	ld	(hl),#0x01
                           2021 ;src/main.c:394: actual->x = actual->camino[actual->iter];
   6F7D DD 6E F8      [19] 2022 	ld	l,-8 (ix)
   6F80 DD 66 F9      [19] 2023 	ld	h,-7 (ix)
   6F83 7E            [ 7] 2024 	ld	a, (hl)
   6F84 23            [ 6] 2025 	inc	hl
   6F85 66            [ 7] 2026 	ld	h,(hl)
   6F86 6F            [ 4] 2027 	ld	l,a
   6F87 19            [11] 2028 	add	hl,de
   6F88 7E            [ 7] 2029 	ld	a,(hl)
   6F89 02            [ 7] 2030 	ld	(bc),a
                           2031 ;src/main.c:395: ++actual->iter;
   6F8A DD 6E F8      [19] 2032 	ld	l,-8 (ix)
   6F8D DD 66 F9      [19] 2033 	ld	h,-7 (ix)
   6F90 4E            [ 7] 2034 	ld	c,(hl)
   6F91 23            [ 6] 2035 	inc	hl
   6F92 46            [ 7] 2036 	ld	b,(hl)
   6F93 03            [ 6] 2037 	inc	bc
   6F94 DD 6E F8      [19] 2038 	ld	l,-8 (ix)
   6F97 DD 66 F9      [19] 2039 	ld	h,-7 (ix)
   6F9A 71            [ 7] 2040 	ld	(hl),c
   6F9B 23            [ 6] 2041 	inc	hl
   6F9C 70            [ 7] 2042 	ld	(hl),b
                           2043 ;src/main.c:396: actual->y = actual->camino[actual->iter];
   6F9D EB            [ 4] 2044 	ex	de,hl
   6F9E 09            [11] 2045 	add	hl,bc
   6F9F 5E            [ 7] 2046 	ld	e,(hl)
   6FA0 DD 6E FB      [19] 2047 	ld	l,-5 (ix)
   6FA3 DD 66 FC      [19] 2048 	ld	h,-4 (ix)
   6FA6 73            [ 7] 2049 	ld	(hl),e
                           2050 ;src/main.c:397: ++actual->iter;
   6FA7 03            [ 6] 2051 	inc	bc
   6FA8 DD 6E F8      [19] 2052 	ld	l,-8 (ix)
   6FAB DD 66 F9      [19] 2053 	ld	h,-7 (ix)
   6FAE 71            [ 7] 2054 	ld	(hl),c
   6FAF 23            [ 6] 2055 	inc	hl
   6FB0 70            [ 7] 2056 	ld	(hl),b
   6FB1 C3 6A 70      [10] 2057 	jp	00114$
   6FB4                    2058 00110$:
                           2059 ;src/main.c:403: actual->seek = 0;
   6FB4 21 14 00      [10] 2060 	ld	hl,#0x0014
   6FB7 09            [11] 2061 	add	hl,bc
   6FB8 E3            [19] 2062 	ex	(sp), hl
   6FB9 E1            [10] 2063 	pop	hl
   6FBA E5            [11] 2064 	push	hl
   6FBB 36 00         [10] 2065 	ld	(hl),#0x00
                           2066 ;src/main.c:404: lookFor(actual);
   6FBD C5            [11] 2067 	push	bc
   6FBE C5            [11] 2068 	push	bc
   6FBF CD C4 6D      [17] 2069 	call	_lookFor
   6FC2 F1            [10] 2070 	pop	af
   6FC3 C1            [10] 2071 	pop	bc
                           2072 ;src/main.c:405: if(!actual->seen){
   6FC4 69            [ 4] 2073 	ld	l, c
   6FC5 60            [ 4] 2074 	ld	h, b
   6FC6 11 12 00      [10] 2075 	ld	de, #0x0012
   6FC9 19            [11] 2076 	add	hl, de
   6FCA 7E            [ 7] 2077 	ld	a,(hl)
   6FCB DD 77 FA      [19] 2078 	ld	-6 (ix),a
                           2079 ;src/main.c:406: actual->patrolling = 1;
   6FCE 21 0B 00      [10] 2080 	ld	hl,#0x000B
   6FD1 09            [11] 2081 	add	hl,bc
   6FD2 DD 75 FE      [19] 2082 	ld	-2 (ix),l
   6FD5 DD 74 FF      [19] 2083 	ld	-1 (ix),h
                           2084 ;src/main.c:405: if(!actual->seen){
   6FD8 DD 7E FA      [19] 2085 	ld	a,-6 (ix)
   6FDB B7            [ 4] 2086 	or	a, a
   6FDC 20 3C         [12] 2087 	jr	NZ,00107$
                           2088 ;src/main.c:406: actual->patrolling = 1;
   6FDE DD 6E FE      [19] 2089 	ld	l,-2 (ix)
   6FE1 DD 66 FF      [19] 2090 	ld	h,-1 (ix)
   6FE4 36 01         [10] 2091 	ld	(hl),#0x01
                           2092 ;src/main.c:407: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6FE6 C5            [11] 2093 	push	bc
   6FE7 FD E1         [14] 2094 	pop	iy
   6FE9 FD 7E 18      [19] 2095 	ld	a,24 (iy)
   6FEC DD 77 FA      [19] 2096 	ld	-6 (ix),a
   6FEF C5            [11] 2097 	push	bc
   6FF0 FD E1         [14] 2098 	pop	iy
   6FF2 FD 56 17      [19] 2099 	ld	d,23 (iy)
   6FF5 DD 6E FB      [19] 2100 	ld	l,-5 (ix)
   6FF8 DD 66 FC      [19] 2101 	ld	h,-4 (ix)
   6FFB 5E            [ 7] 2102 	ld	e,(hl)
   6FFC 0A            [ 7] 2103 	ld	a,(bc)
   6FFD DD 77 FD      [19] 2104 	ld	-3 (ix),a
   7000 2A C5 64      [16] 2105 	ld	hl,(_mapa)
   7003 E5            [11] 2106 	push	hl
   7004 C5            [11] 2107 	push	bc
   7005 DD 7E FA      [19] 2108 	ld	a,-6 (ix)
   7008 F5            [11] 2109 	push	af
   7009 33            [ 6] 2110 	inc	sp
   700A D5            [11] 2111 	push	de
   700B DD 7E FD      [19] 2112 	ld	a,-3 (ix)
   700E F5            [11] 2113 	push	af
   700F 33            [ 6] 2114 	inc	sp
   7010 CD 30 44      [17] 2115 	call	_pathFinding
   7013 21 08 00      [10] 2116 	ld	hl,#8
   7016 39            [11] 2117 	add	hl,sp
   7017 F9            [ 6] 2118 	ld	sp,hl
   7018 18 46         [12] 2119 	jr	00108$
   701A                    2120 00107$:
                           2121 ;src/main.c:409: actual->patrolling = 0;
   701A DD 6E FE      [19] 2122 	ld	l,-2 (ix)
   701D DD 66 FF      [19] 2123 	ld	h,-1 (ix)
   7020 36 00         [10] 2124 	ld	(hl),#0x00
                           2125 ;src/main.c:410: if(!actual->engage){
   7022 C5            [11] 2126 	push	bc
   7023 FD E1         [14] 2127 	pop	iy
   7025 FD 7E 16      [19] 2128 	ld	a,22 (iy)
   7028 B7            [ 4] 2129 	or	a, a
   7029 20 35         [12] 2130 	jr	NZ,00108$
                           2131 ;src/main.c:411: actual->seek = 1;
   702B E1            [10] 2132 	pop	hl
   702C E5            [11] 2133 	push	hl
   702D 36 01         [10] 2134 	ld	(hl),#0x01
                           2135 ;src/main.c:412: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   702F 3A E9 63      [13] 2136 	ld	a,(#_prota + 1)
   7032 DD 77 FD      [19] 2137 	ld	-3 (ix),a
   7035 21 E8 63      [10] 2138 	ld	hl, #_prota + 0
   7038 5E            [ 7] 2139 	ld	e,(hl)
   7039 DD 6E FB      [19] 2140 	ld	l,-5 (ix)
   703C DD 66 FC      [19] 2141 	ld	h,-4 (ix)
   703F 56            [ 7] 2142 	ld	d,(hl)
   7040 0A            [ 7] 2143 	ld	a,(bc)
   7041 DD 77 FE      [19] 2144 	ld	-2 (ix),a
   7044 2A C5 64      [16] 2145 	ld	hl,(_mapa)
   7047 E5            [11] 2146 	push	hl
   7048 C5            [11] 2147 	push	bc
   7049 DD 7E FD      [19] 2148 	ld	a,-3 (ix)
   704C F5            [11] 2149 	push	af
   704D 33            [ 6] 2150 	inc	sp
   704E 7B            [ 4] 2151 	ld	a,e
   704F F5            [11] 2152 	push	af
   7050 33            [ 6] 2153 	inc	sp
   7051 D5            [11] 2154 	push	de
   7052 33            [ 6] 2155 	inc	sp
   7053 DD 7E FE      [19] 2156 	ld	a,-2 (ix)
   7056 F5            [11] 2157 	push	af
   7057 33            [ 6] 2158 	inc	sp
   7058 CD 30 44      [17] 2159 	call	_pathFinding
   705B 21 08 00      [10] 2160 	ld	hl,#8
   705E 39            [11] 2161 	add	hl,sp
   705F F9            [ 6] 2162 	ld	sp,hl
   7060                    2163 00108$:
                           2164 ;src/main.c:415: actual->iter = 0;
   7060 DD 6E F8      [19] 2165 	ld	l,-8 (ix)
   7063 DD 66 F9      [19] 2166 	ld	h,-7 (ix)
   7066 AF            [ 4] 2167 	xor	a, a
   7067 77            [ 7] 2168 	ld	(hl), a
   7068 23            [ 6] 2169 	inc	hl
   7069 77            [ 7] 2170 	ld	(hl), a
   706A                    2171 00114$:
   706A DD F9         [10] 2172 	ld	sp, ix
   706C DD E1         [14] 2173 	pop	ix
   706E C9            [10] 2174 	ret
                           2175 ;src/main.c:422: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2176 ;	---------------------------------
                           2177 ; Function engage
                           2178 ; ---------------------------------
   706F                    2179 _engage::
   706F DD E5         [15] 2180 	push	ix
   7071 DD 21 00 00   [14] 2181 	ld	ix,#0
   7075 DD 39         [15] 2182 	add	ix,sp
   7077 21 F1 FF      [10] 2183 	ld	hl,#-15
   707A 39            [11] 2184 	add	hl,sp
   707B F9            [ 6] 2185 	ld	sp,hl
                           2186 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   707C DD 7E 04      [19] 2187 	ld	a,4 (ix)
   707F DD 77 F4      [19] 2188 	ld	-12 (ix),a
   7082 DD 7E 05      [19] 2189 	ld	a,5 (ix)
   7085 DD 77 F5      [19] 2190 	ld	-11 (ix),a
   7088 DD 6E F4      [19] 2191 	ld	l,-12 (ix)
   708B DD 66 F5      [19] 2192 	ld	h,-11 (ix)
   708E 4E            [ 7] 2193 	ld	c,(hl)
   708F 06 00         [ 7] 2194 	ld	b,#0x00
   7091 21 E8 63      [10] 2195 	ld	hl,#_prota+0
   7094 5E            [ 7] 2196 	ld	e,(hl)
   7095 16 00         [ 7] 2197 	ld	d,#0x00
   7097 79            [ 4] 2198 	ld	a,c
   7098 93            [ 4] 2199 	sub	a, e
   7099 4F            [ 4] 2200 	ld	c,a
   709A 78            [ 4] 2201 	ld	a,b
   709B 9A            [ 4] 2202 	sbc	a, d
   709C 47            [ 4] 2203 	ld	b,a
   709D C5            [11] 2204 	push	bc
   709E CD 60 4B      [17] 2205 	call	_abs
   70A1 F1            [10] 2206 	pop	af
   70A2 4D            [ 4] 2207 	ld	c,l
                           2208 ;src/main.c:424: u8 dify = abs(enemy->y - prota.y);
   70A3 DD 7E F4      [19] 2209 	ld	a,-12 (ix)
   70A6 C6 01         [ 7] 2210 	add	a, #0x01
   70A8 DD 77 F6      [19] 2211 	ld	-10 (ix),a
   70AB DD 7E F5      [19] 2212 	ld	a,-11 (ix)
   70AE CE 00         [ 7] 2213 	adc	a, #0x00
   70B0 DD 77 F7      [19] 2214 	ld	-9 (ix),a
   70B3 DD 6E F6      [19] 2215 	ld	l,-10 (ix)
   70B6 DD 66 F7      [19] 2216 	ld	h,-9 (ix)
   70B9 5E            [ 7] 2217 	ld	e,(hl)
   70BA 16 00         [ 7] 2218 	ld	d,#0x00
   70BC 21 E9 63      [10] 2219 	ld	hl, #_prota + 1
   70BF 6E            [ 7] 2220 	ld	l,(hl)
   70C0 26 00         [ 7] 2221 	ld	h,#0x00
   70C2 7B            [ 4] 2222 	ld	a,e
   70C3 95            [ 4] 2223 	sub	a, l
   70C4 5F            [ 4] 2224 	ld	e,a
   70C5 7A            [ 4] 2225 	ld	a,d
   70C6 9C            [ 4] 2226 	sbc	a, h
   70C7 57            [ 4] 2227 	ld	d,a
   70C8 C5            [11] 2228 	push	bc
   70C9 D5            [11] 2229 	push	de
   70CA CD 60 4B      [17] 2230 	call	_abs
   70CD F1            [10] 2231 	pop	af
   70CE C1            [10] 2232 	pop	bc
                           2233 ;src/main.c:425: u8 dist = difx + dify; // manhattan
   70CF 09            [11] 2234 	add	hl, bc
   70D0 DD 75 F3      [19] 2235 	ld	-13 (ix),l
                           2236 ;src/main.c:427: u8 movX = 0;
   70D3 DD 36 F2 00   [19] 2237 	ld	-14 (ix),#0x00
                           2238 ;src/main.c:428: u8 movY = 0;
   70D7 DD 36 F1 00   [19] 2239 	ld	-15 (ix),#0x00
                           2240 ;src/main.c:429: u8 distConstraint = 25;
   70DB 0E 19         [ 7] 2241 	ld	c,#0x19
                           2242 ;src/main.c:430: enemy->mover = NO;
   70DD DD 7E F4      [19] 2243 	ld	a,-12 (ix)
   70E0 C6 06         [ 7] 2244 	add	a, #0x06
   70E2 DD 77 F8      [19] 2245 	ld	-8 (ix),a
   70E5 DD 7E F5      [19] 2246 	ld	a,-11 (ix)
   70E8 CE 00         [ 7] 2247 	adc	a, #0x00
   70EA DD 77 F9      [19] 2248 	ld	-7 (ix),a
   70ED DD 6E F8      [19] 2249 	ld	l,-8 (ix)
   70F0 DD 66 F9      [19] 2250 	ld	h,-7 (ix)
   70F3 36 00         [10] 2251 	ld	(hl),#0x00
                           2252 ;src/main.c:432: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   70F5 DD 6E F6      [19] 2253 	ld	l,-10 (ix)
   70F8 DD 66 F7      [19] 2254 	ld	h,-9 (ix)
   70FB 7E            [ 7] 2255 	ld	a,(hl)
   70FC DD 77 FA      [19] 2256 	ld	-6 (ix),a
                           2257 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70FF DD 6E F4      [19] 2258 	ld	l,-12 (ix)
   7102 DD 66 F5      [19] 2259 	ld	h,-11 (ix)
   7105 46            [ 7] 2260 	ld	b,(hl)
                           2261 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7106 78            [ 4] 2262 	ld	a,b
   7107 C6 04         [ 7] 2263 	add	a, #0x04
   7109 DD 77 FB      [19] 2264 	ld	-5 (ix),a
                           2265 ;src/main.c:432: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   710C DD 7E 07      [19] 2266 	ld	a,7 (ix)
   710F DD 96 FA      [19] 2267 	sub	a, -6 (ix)
   7112 28 38         [12] 2268 	jr	Z,00194$
   7114 DD 5E 07      [19] 2269 	ld	e,7 (ix)
   7117 16 00         [ 7] 2270 	ld	d,#0x00
   7119 21 01 00      [10] 2271 	ld	hl,#0x0001
   711C 19            [11] 2272 	add	hl,de
   711D DD 75 FC      [19] 2273 	ld	-4 (ix),l
   7120 DD 74 FD      [19] 2274 	ld	-3 (ix),h
   7123 DD 7E FA      [19] 2275 	ld	a,-6 (ix)
   7126 DD 77 FE      [19] 2276 	ld	-2 (ix),a
   7129 DD 36 FF 00   [19] 2277 	ld	-1 (ix),#0x00
   712D DD 7E FE      [19] 2278 	ld	a,-2 (ix)
   7130 DD 96 FC      [19] 2279 	sub	a, -4 (ix)
   7133 20 08         [12] 2280 	jr	NZ,00422$
   7135 DD 7E FF      [19] 2281 	ld	a,-1 (ix)
   7138 DD 96 FD      [19] 2282 	sub	a, -3 (ix)
   713B 28 0F         [12] 2283 	jr	Z,00194$
   713D                    2284 00422$:
   713D 1B            [ 6] 2285 	dec	de
   713E DD 7E FE      [19] 2286 	ld	a,-2 (ix)
   7141 93            [ 4] 2287 	sub	a, e
   7142 C2 55 72      [10] 2288 	jp	NZ,00195$
   7145 DD 7E FF      [19] 2289 	ld	a,-1 (ix)
   7148 92            [ 4] 2290 	sub	a, d
   7149 C2 55 72      [10] 2291 	jp	NZ,00195$
   714C                    2292 00194$:
                           2293 ;src/main.c:433: if (dx < enemy->x) { // izquierda
   714C DD 7E 06      [19] 2294 	ld	a,6 (ix)
   714F 90            [ 4] 2295 	sub	a, b
   7150 D2 D2 71      [10] 2296 	jp	NC,00114$
                           2297 ;src/main.c:434: if (dist > 11) {
   7153 3E 0B         [ 7] 2298 	ld	a,#0x0B
   7155 DD 96 F3      [19] 2299 	sub	a, -13 (ix)
   7158 D2 15 78      [10] 2300 	jp	NC,00199$
                           2301 ;src/main.c:435: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   715B DD 7E FA      [19] 2302 	ld	a,-6 (ix)
   715E F5            [11] 2303 	push	af
   715F 33            [ 6] 2304 	inc	sp
   7160 C5            [11] 2305 	push	bc
   7161 33            [ 6] 2306 	inc	sp
   7162 2A C5 64      [16] 2307 	ld	hl,(_mapa)
   7165 E5            [11] 2308 	push	hl
   7166 CD 1C 4B      [17] 2309 	call	_getTilePtr
   7169 F1            [10] 2310 	pop	af
   716A F1            [10] 2311 	pop	af
   716B 4E            [ 7] 2312 	ld	c,(hl)
   716C 3E 02         [ 7] 2313 	ld	a,#0x02
   716E 91            [ 4] 2314 	sub	a, c
   716F DA 15 78      [10] 2315 	jp	C,00199$
                           2316 ;src/main.c:436: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7172 DD 6E F6      [19] 2317 	ld	l,-10 (ix)
   7175 DD 66 F7      [19] 2318 	ld	h,-9 (ix)
   7178 7E            [ 7] 2319 	ld	a,(hl)
   7179 C6 0B         [ 7] 2320 	add	a, #0x0B
   717B 57            [ 4] 2321 	ld	d,a
   717C DD 6E F4      [19] 2322 	ld	l,-12 (ix)
   717F DD 66 F5      [19] 2323 	ld	h,-11 (ix)
   7182 46            [ 7] 2324 	ld	b,(hl)
   7183 D5            [11] 2325 	push	de
   7184 33            [ 6] 2326 	inc	sp
   7185 C5            [11] 2327 	push	bc
   7186 33            [ 6] 2328 	inc	sp
   7187 2A C5 64      [16] 2329 	ld	hl,(_mapa)
   718A E5            [11] 2330 	push	hl
   718B CD 1C 4B      [17] 2331 	call	_getTilePtr
   718E F1            [10] 2332 	pop	af
   718F F1            [10] 2333 	pop	af
   7190 4E            [ 7] 2334 	ld	c,(hl)
   7191 3E 02         [ 7] 2335 	ld	a,#0x02
   7193 91            [ 4] 2336 	sub	a, c
   7194 DA 15 78      [10] 2337 	jp	C,00199$
                           2338 ;src/main.c:437: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7197 DD 6E F6      [19] 2339 	ld	l,-10 (ix)
   719A DD 66 F7      [19] 2340 	ld	h,-9 (ix)
   719D 7E            [ 7] 2341 	ld	a,(hl)
   719E C6 16         [ 7] 2342 	add	a, #0x16
   71A0 57            [ 4] 2343 	ld	d,a
   71A1 DD 6E F4      [19] 2344 	ld	l,-12 (ix)
   71A4 DD 66 F5      [19] 2345 	ld	h,-11 (ix)
   71A7 46            [ 7] 2346 	ld	b,(hl)
   71A8 D5            [11] 2347 	push	de
   71A9 33            [ 6] 2348 	inc	sp
   71AA C5            [11] 2349 	push	bc
   71AB 33            [ 6] 2350 	inc	sp
   71AC 2A C5 64      [16] 2351 	ld	hl,(_mapa)
   71AF E5            [11] 2352 	push	hl
   71B0 CD 1C 4B      [17] 2353 	call	_getTilePtr
   71B3 F1            [10] 2354 	pop	af
   71B4 F1            [10] 2355 	pop	af
   71B5 4E            [ 7] 2356 	ld	c,(hl)
   71B6 3E 02         [ 7] 2357 	ld	a,#0x02
   71B8 91            [ 4] 2358 	sub	a, c
   71B9 DA 15 78      [10] 2359 	jp	C,00199$
                           2360 ;src/main.c:438: moverEnemigoIzquierda(enemy);
   71BC DD 6E F4      [19] 2361 	ld	l,-12 (ix)
   71BF DD 66 F5      [19] 2362 	ld	h,-11 (ix)
   71C2 E5            [11] 2363 	push	hl
   71C3 CD 65 6B      [17] 2364 	call	_moverEnemigoIzquierda
   71C6 F1            [10] 2365 	pop	af
                           2366 ;src/main.c:440: enemy->mover = SI;
   71C7 DD 6E F8      [19] 2367 	ld	l,-8 (ix)
   71CA DD 66 F9      [19] 2368 	ld	h,-7 (ix)
   71CD 36 01         [10] 2369 	ld	(hl),#0x01
   71CF C3 15 78      [10] 2370 	jp	00199$
   71D2                    2371 00114$:
                           2372 ;src/main.c:444: if (dist > G_ENEMY_W + 3) {
   71D2 3E 07         [ 7] 2373 	ld	a,#0x07
   71D4 DD 96 F3      [19] 2374 	sub	a, -13 (ix)
   71D7 D2 15 78      [10] 2375 	jp	NC,00199$
                           2376 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   71DA DD 66 FA      [19] 2377 	ld	h,-6 (ix)
   71DD DD 6E FB      [19] 2378 	ld	l,-5 (ix)
   71E0 E5            [11] 2379 	push	hl
   71E1 2A C5 64      [16] 2380 	ld	hl,(_mapa)
   71E4 E5            [11] 2381 	push	hl
   71E5 CD 1C 4B      [17] 2382 	call	_getTilePtr
   71E8 F1            [10] 2383 	pop	af
   71E9 F1            [10] 2384 	pop	af
   71EA 4E            [ 7] 2385 	ld	c,(hl)
   71EB 3E 02         [ 7] 2386 	ld	a,#0x02
   71ED 91            [ 4] 2387 	sub	a, c
   71EE DA 15 78      [10] 2388 	jp	C,00199$
                           2389 ;src/main.c:446: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   71F1 DD 6E F6      [19] 2390 	ld	l,-10 (ix)
   71F4 DD 66 F7      [19] 2391 	ld	h,-9 (ix)
   71F7 7E            [ 7] 2392 	ld	a,(hl)
   71F8 C6 0B         [ 7] 2393 	add	a, #0x0B
   71FA 47            [ 4] 2394 	ld	b,a
   71FB DD 6E F4      [19] 2395 	ld	l,-12 (ix)
   71FE DD 66 F5      [19] 2396 	ld	h,-11 (ix)
   7201 7E            [ 7] 2397 	ld	a,(hl)
   7202 C6 04         [ 7] 2398 	add	a, #0x04
   7204 C5            [11] 2399 	push	bc
   7205 33            [ 6] 2400 	inc	sp
   7206 F5            [11] 2401 	push	af
   7207 33            [ 6] 2402 	inc	sp
   7208 2A C5 64      [16] 2403 	ld	hl,(_mapa)
   720B E5            [11] 2404 	push	hl
   720C CD 1C 4B      [17] 2405 	call	_getTilePtr
   720F F1            [10] 2406 	pop	af
   7210 F1            [10] 2407 	pop	af
   7211 4E            [ 7] 2408 	ld	c,(hl)
   7212 3E 02         [ 7] 2409 	ld	a,#0x02
   7214 91            [ 4] 2410 	sub	a, c
   7215 DA 15 78      [10] 2411 	jp	C,00199$
                           2412 ;src/main.c:447: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7218 DD 6E F6      [19] 2413 	ld	l,-10 (ix)
   721B DD 66 F7      [19] 2414 	ld	h,-9 (ix)
   721E 7E            [ 7] 2415 	ld	a,(hl)
   721F C6 16         [ 7] 2416 	add	a, #0x16
   7221 47            [ 4] 2417 	ld	b,a
   7222 DD 6E F4      [19] 2418 	ld	l,-12 (ix)
   7225 DD 66 F5      [19] 2419 	ld	h,-11 (ix)
   7228 7E            [ 7] 2420 	ld	a,(hl)
   7229 C6 04         [ 7] 2421 	add	a, #0x04
   722B C5            [11] 2422 	push	bc
   722C 33            [ 6] 2423 	inc	sp
   722D F5            [11] 2424 	push	af
   722E 33            [ 6] 2425 	inc	sp
   722F 2A C5 64      [16] 2426 	ld	hl,(_mapa)
   7232 E5            [11] 2427 	push	hl
   7233 CD 1C 4B      [17] 2428 	call	_getTilePtr
   7236 F1            [10] 2429 	pop	af
   7237 F1            [10] 2430 	pop	af
   7238 4E            [ 7] 2431 	ld	c,(hl)
   7239 3E 02         [ 7] 2432 	ld	a,#0x02
   723B 91            [ 4] 2433 	sub	a, c
   723C DA 15 78      [10] 2434 	jp	C,00199$
                           2435 ;src/main.c:448: moverEnemigoDerecha(enemy);
   723F DD 6E F4      [19] 2436 	ld	l,-12 (ix)
   7242 DD 66 F5      [19] 2437 	ld	h,-11 (ix)
   7245 E5            [11] 2438 	push	hl
   7246 CD 55 6B      [17] 2439 	call	_moverEnemigoDerecha
   7249 F1            [10] 2440 	pop	af
                           2441 ;src/main.c:450: enemy->mover = SI;
   724A DD 6E F8      [19] 2442 	ld	l,-8 (ix)
   724D DD 66 F9      [19] 2443 	ld	h,-7 (ix)
   7250 36 01         [10] 2444 	ld	(hl),#0x01
   7252 C3 15 78      [10] 2445 	jp	00199$
   7255                    2446 00195$:
                           2447 ;src/main.c:455: else if (enemy->x == dx) {
   7255 DD 7E 06      [19] 2448 	ld	a,6 (ix)
   7258 90            [ 4] 2449 	sub	a, b
   7259 C2 6E 73      [10] 2450 	jp	NZ,00192$
                           2451 ;src/main.c:456: if (dy < enemy->y) {
   725C DD 7E 07      [19] 2452 	ld	a,7 (ix)
   725F DD 96 FA      [19] 2453 	sub	a, -6 (ix)
   7262 D2 E8 72      [10] 2454 	jp	NC,00129$
                           2455 ;src/main.c:457: if (dist > G_HERO_H + 5) {
   7265 3E 1B         [ 7] 2456 	ld	a,#0x1B
   7267 DD 96 F3      [19] 2457 	sub	a, -13 (ix)
   726A D2 15 78      [10] 2458 	jp	NC,00199$
                           2459 ;src/main.c:458: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   726D DD 56 FA      [19] 2460 	ld	d,-6 (ix)
   7270 15            [ 4] 2461 	dec	d
   7271 15            [ 4] 2462 	dec	d
   7272 D5            [11] 2463 	push	de
   7273 33            [ 6] 2464 	inc	sp
   7274 C5            [11] 2465 	push	bc
   7275 33            [ 6] 2466 	inc	sp
   7276 2A C5 64      [16] 2467 	ld	hl,(_mapa)
   7279 E5            [11] 2468 	push	hl
   727A CD 1C 4B      [17] 2469 	call	_getTilePtr
   727D F1            [10] 2470 	pop	af
   727E F1            [10] 2471 	pop	af
   727F 4E            [ 7] 2472 	ld	c,(hl)
   7280 3E 02         [ 7] 2473 	ld	a,#0x02
   7282 91            [ 4] 2474 	sub	a, c
   7283 DA 15 78      [10] 2475 	jp	C,00199$
                           2476 ;src/main.c:459: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7286 DD 6E F6      [19] 2477 	ld	l,-10 (ix)
   7289 DD 66 F7      [19] 2478 	ld	h,-9 (ix)
   728C 56            [ 7] 2479 	ld	d,(hl)
   728D 15            [ 4] 2480 	dec	d
   728E 15            [ 4] 2481 	dec	d
   728F DD 6E F4      [19] 2482 	ld	l,-12 (ix)
   7292 DD 66 F5      [19] 2483 	ld	h,-11 (ix)
   7295 46            [ 7] 2484 	ld	b,(hl)
   7296 04            [ 4] 2485 	inc	b
   7297 04            [ 4] 2486 	inc	b
   7298 D5            [11] 2487 	push	de
   7299 33            [ 6] 2488 	inc	sp
   729A C5            [11] 2489 	push	bc
   729B 33            [ 6] 2490 	inc	sp
   729C 2A C5 64      [16] 2491 	ld	hl,(_mapa)
   729F E5            [11] 2492 	push	hl
   72A0 CD 1C 4B      [17] 2493 	call	_getTilePtr
   72A3 F1            [10] 2494 	pop	af
   72A4 F1            [10] 2495 	pop	af
   72A5 4E            [ 7] 2496 	ld	c,(hl)
   72A6 3E 02         [ 7] 2497 	ld	a,#0x02
   72A8 91            [ 4] 2498 	sub	a, c
   72A9 DA 15 78      [10] 2499 	jp	C,00199$
                           2500 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   72AC DD 6E F6      [19] 2501 	ld	l,-10 (ix)
   72AF DD 66 F7      [19] 2502 	ld	h,-9 (ix)
   72B2 46            [ 7] 2503 	ld	b,(hl)
   72B3 05            [ 4] 2504 	dec	b
   72B4 05            [ 4] 2505 	dec	b
   72B5 DD 6E F4      [19] 2506 	ld	l,-12 (ix)
   72B8 DD 66 F5      [19] 2507 	ld	h,-11 (ix)
   72BB 7E            [ 7] 2508 	ld	a,(hl)
   72BC C6 04         [ 7] 2509 	add	a, #0x04
   72BE C5            [11] 2510 	push	bc
   72BF 33            [ 6] 2511 	inc	sp
   72C0 F5            [11] 2512 	push	af
   72C1 33            [ 6] 2513 	inc	sp
   72C2 2A C5 64      [16] 2514 	ld	hl,(_mapa)
   72C5 E5            [11] 2515 	push	hl
   72C6 CD 1C 4B      [17] 2516 	call	_getTilePtr
   72C9 F1            [10] 2517 	pop	af
   72CA F1            [10] 2518 	pop	af
   72CB 4E            [ 7] 2519 	ld	c,(hl)
   72CC 3E 02         [ 7] 2520 	ld	a,#0x02
   72CE 91            [ 4] 2521 	sub	a, c
   72CF DA 15 78      [10] 2522 	jp	C,00199$
                           2523 ;src/main.c:461: moverEnemigoArriba(enemy);
   72D2 DD 6E F4      [19] 2524 	ld	l,-12 (ix)
   72D5 DD 66 F5      [19] 2525 	ld	h,-11 (ix)
   72D8 E5            [11] 2526 	push	hl
   72D9 CD 17 6B      [17] 2527 	call	_moverEnemigoArriba
   72DC F1            [10] 2528 	pop	af
                           2529 ;src/main.c:463: enemy->mover = SI;
   72DD DD 6E F8      [19] 2530 	ld	l,-8 (ix)
   72E0 DD 66 F9      [19] 2531 	ld	h,-7 (ix)
   72E3 36 01         [10] 2532 	ld	(hl),#0x01
   72E5 C3 15 78      [10] 2533 	jp	00199$
   72E8                    2534 00129$:
                           2535 ;src/main.c:467: if(dist > G_ENEMY_H + 7) {
   72E8 3E 1D         [ 7] 2536 	ld	a,#0x1D
   72EA DD 96 F3      [19] 2537 	sub	a, -13 (ix)
   72ED D2 15 78      [10] 2538 	jp	NC,00199$
                           2539 ;src/main.c:468: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   72F0 DD 7E FA      [19] 2540 	ld	a,-6 (ix)
   72F3 C6 18         [ 7] 2541 	add	a, #0x18
   72F5 57            [ 4] 2542 	ld	d,a
   72F6 D5            [11] 2543 	push	de
   72F7 33            [ 6] 2544 	inc	sp
   72F8 C5            [11] 2545 	push	bc
   72F9 33            [ 6] 2546 	inc	sp
   72FA 2A C5 64      [16] 2547 	ld	hl,(_mapa)
   72FD E5            [11] 2548 	push	hl
   72FE CD 1C 4B      [17] 2549 	call	_getTilePtr
   7301 F1            [10] 2550 	pop	af
   7302 F1            [10] 2551 	pop	af
   7303 4E            [ 7] 2552 	ld	c,(hl)
   7304 3E 02         [ 7] 2553 	ld	a,#0x02
   7306 91            [ 4] 2554 	sub	a, c
   7307 DA 15 78      [10] 2555 	jp	C,00199$
                           2556 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   730A DD 6E F6      [19] 2557 	ld	l,-10 (ix)
   730D DD 66 F7      [19] 2558 	ld	h,-9 (ix)
   7310 7E            [ 7] 2559 	ld	a,(hl)
   7311 C6 18         [ 7] 2560 	add	a, #0x18
   7313 57            [ 4] 2561 	ld	d,a
   7314 DD 6E F4      [19] 2562 	ld	l,-12 (ix)
   7317 DD 66 F5      [19] 2563 	ld	h,-11 (ix)
   731A 46            [ 7] 2564 	ld	b,(hl)
   731B 04            [ 4] 2565 	inc	b
   731C 04            [ 4] 2566 	inc	b
   731D D5            [11] 2567 	push	de
   731E 33            [ 6] 2568 	inc	sp
   731F C5            [11] 2569 	push	bc
   7320 33            [ 6] 2570 	inc	sp
   7321 2A C5 64      [16] 2571 	ld	hl,(_mapa)
   7324 E5            [11] 2572 	push	hl
   7325 CD 1C 4B      [17] 2573 	call	_getTilePtr
   7328 F1            [10] 2574 	pop	af
   7329 F1            [10] 2575 	pop	af
   732A 4E            [ 7] 2576 	ld	c,(hl)
   732B 3E 02         [ 7] 2577 	ld	a,#0x02
   732D 91            [ 4] 2578 	sub	a, c
   732E DA 15 78      [10] 2579 	jp	C,00199$
                           2580 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7331 DD 6E F6      [19] 2581 	ld	l,-10 (ix)
   7334 DD 66 F7      [19] 2582 	ld	h,-9 (ix)
   7337 7E            [ 7] 2583 	ld	a,(hl)
   7338 C6 18         [ 7] 2584 	add	a, #0x18
   733A 47            [ 4] 2585 	ld	b,a
   733B DD 6E F4      [19] 2586 	ld	l,-12 (ix)
   733E DD 66 F5      [19] 2587 	ld	h,-11 (ix)
   7341 7E            [ 7] 2588 	ld	a,(hl)
   7342 C6 04         [ 7] 2589 	add	a, #0x04
   7344 C5            [11] 2590 	push	bc
   7345 33            [ 6] 2591 	inc	sp
   7346 F5            [11] 2592 	push	af
   7347 33            [ 6] 2593 	inc	sp
   7348 2A C5 64      [16] 2594 	ld	hl,(_mapa)
   734B E5            [11] 2595 	push	hl
   734C CD 1C 4B      [17] 2596 	call	_getTilePtr
   734F F1            [10] 2597 	pop	af
   7350 F1            [10] 2598 	pop	af
   7351 4E            [ 7] 2599 	ld	c,(hl)
   7352 3E 02         [ 7] 2600 	ld	a,#0x02
   7354 91            [ 4] 2601 	sub	a, c
   7355 DA 15 78      [10] 2602 	jp	C,00199$
                           2603 ;src/main.c:471: moverEnemigoAbajo(enemy);
   7358 DD 6E F4      [19] 2604 	ld	l,-12 (ix)
   735B DD 66 F5      [19] 2605 	ld	h,-11 (ix)
   735E E5            [11] 2606 	push	hl
   735F CD 36 6B      [17] 2607 	call	_moverEnemigoAbajo
   7362 F1            [10] 2608 	pop	af
                           2609 ;src/main.c:473: enemy->mover = SI;
   7363 DD 6E F8      [19] 2610 	ld	l,-8 (ix)
   7366 DD 66 F9      [19] 2611 	ld	h,-7 (ix)
   7369 36 01         [10] 2612 	ld	(hl),#0x01
   736B C3 15 78      [10] 2613 	jp	00199$
   736E                    2614 00192$:
                           2615 ;src/main.c:479: if (!prota.mover) distConstraint = 20; // ajuste en parado
   736E 3A EE 63      [13] 2616 	ld	a, (#_prota + 6)
   7371 B7            [ 4] 2617 	or	a, a
   7372 20 02         [12] 2618 	jr	NZ,00132$
   7374 0E 14         [ 7] 2619 	ld	c,#0x14
   7376                    2620 00132$:
                           2621 ;src/main.c:481: if (dist > distConstraint) {
   7376 79            [ 4] 2622 	ld	a,c
   7377 DD 96 F3      [19] 2623 	sub	a, -13 (ix)
   737A D2 15 78      [10] 2624 	jp	NC,00199$
                           2625 ;src/main.c:482: if (dx + 1 < enemy->x) {
   737D DD 5E 06      [19] 2626 	ld	e,6 (ix)
   7380 16 00         [ 7] 2627 	ld	d,#0x00
   7382 13            [ 6] 2628 	inc	de
   7383 DD 73 FE      [19] 2629 	ld	-2 (ix),e
   7386 DD 72 FF      [19] 2630 	ld	-1 (ix),d
   7389 DD 70 FC      [19] 2631 	ld	-4 (ix),b
   738C DD 36 FD 00   [19] 2632 	ld	-3 (ix),#0x00
   7390 DD 7E FE      [19] 2633 	ld	a,-2 (ix)
   7393 DD 96 FC      [19] 2634 	sub	a, -4 (ix)
   7396 DD 7E FF      [19] 2635 	ld	a,-1 (ix)
   7399 DD 9E FD      [19] 2636 	sbc	a, -3 (ix)
   739C E2 A1 73      [10] 2637 	jp	PO, 00427$
   739F EE 80         [ 7] 2638 	xor	a, #0x80
   73A1                    2639 00427$:
   73A1 F2 1D 74      [10] 2640 	jp	P,00144$
                           2641 ;src/main.c:483: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   73A4 DD 7E FA      [19] 2642 	ld	a,-6 (ix)
   73A7 F5            [11] 2643 	push	af
   73A8 33            [ 6] 2644 	inc	sp
   73A9 C5            [11] 2645 	push	bc
   73AA 33            [ 6] 2646 	inc	sp
   73AB 2A C5 64      [16] 2647 	ld	hl,(_mapa)
   73AE E5            [11] 2648 	push	hl
   73AF CD 1C 4B      [17] 2649 	call	_getTilePtr
   73B2 F1            [10] 2650 	pop	af
   73B3 F1            [10] 2651 	pop	af
   73B4 4E            [ 7] 2652 	ld	c,(hl)
   73B5 3E 02         [ 7] 2653 	ld	a,#0x02
   73B7 91            [ 4] 2654 	sub	a, c
   73B8 DA AA 74      [10] 2655 	jp	C,00145$
                           2656 ;src/main.c:484: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   73BB DD 6E F6      [19] 2657 	ld	l,-10 (ix)
   73BE DD 66 F7      [19] 2658 	ld	h,-9 (ix)
   73C1 7E            [ 7] 2659 	ld	a,(hl)
   73C2 C6 0B         [ 7] 2660 	add	a, #0x0B
   73C4 DD 6E F4      [19] 2661 	ld	l,-12 (ix)
   73C7 DD 66 F5      [19] 2662 	ld	h,-11 (ix)
   73CA 46            [ 7] 2663 	ld	b,(hl)
   73CB F5            [11] 2664 	push	af
   73CC 33            [ 6] 2665 	inc	sp
   73CD C5            [11] 2666 	push	bc
   73CE 33            [ 6] 2667 	inc	sp
   73CF 2A C5 64      [16] 2668 	ld	hl,(_mapa)
   73D2 E5            [11] 2669 	push	hl
   73D3 CD 1C 4B      [17] 2670 	call	_getTilePtr
   73D6 F1            [10] 2671 	pop	af
   73D7 F1            [10] 2672 	pop	af
   73D8 4E            [ 7] 2673 	ld	c,(hl)
   73D9 3E 02         [ 7] 2674 	ld	a,#0x02
   73DB 91            [ 4] 2675 	sub	a, c
   73DC DA AA 74      [10] 2676 	jp	C,00145$
                           2677 ;src/main.c:485: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   73DF DD 6E F6      [19] 2678 	ld	l,-10 (ix)
   73E2 DD 66 F7      [19] 2679 	ld	h,-9 (ix)
   73E5 7E            [ 7] 2680 	ld	a,(hl)
   73E6 C6 16         [ 7] 2681 	add	a, #0x16
   73E8 DD 6E F4      [19] 2682 	ld	l,-12 (ix)
   73EB DD 66 F5      [19] 2683 	ld	h,-11 (ix)
   73EE 46            [ 7] 2684 	ld	b,(hl)
   73EF F5            [11] 2685 	push	af
   73F0 33            [ 6] 2686 	inc	sp
   73F1 C5            [11] 2687 	push	bc
   73F2 33            [ 6] 2688 	inc	sp
   73F3 2A C5 64      [16] 2689 	ld	hl,(_mapa)
   73F6 E5            [11] 2690 	push	hl
   73F7 CD 1C 4B      [17] 2691 	call	_getTilePtr
   73FA F1            [10] 2692 	pop	af
   73FB F1            [10] 2693 	pop	af
   73FC 4E            [ 7] 2694 	ld	c,(hl)
   73FD 3E 02         [ 7] 2695 	ld	a,#0x02
   73FF 91            [ 4] 2696 	sub	a, c
   7400 DA AA 74      [10] 2697 	jp	C,00145$
                           2698 ;src/main.c:486: moverEnemigoIzquierda(enemy);
   7403 DD 6E F4      [19] 2699 	ld	l,-12 (ix)
   7406 DD 66 F5      [19] 2700 	ld	h,-11 (ix)
   7409 E5            [11] 2701 	push	hl
   740A CD 65 6B      [17] 2702 	call	_moverEnemigoIzquierda
   740D F1            [10] 2703 	pop	af
                           2704 ;src/main.c:487: movX = 1;
   740E DD 36 F2 01   [19] 2705 	ld	-14 (ix),#0x01
                           2706 ;src/main.c:488: enemy->mover = SI;
   7412 DD 6E F8      [19] 2707 	ld	l,-8 (ix)
   7415 DD 66 F9      [19] 2708 	ld	h,-7 (ix)
   7418 36 01         [10] 2709 	ld	(hl),#0x01
   741A C3 AA 74      [10] 2710 	jp	00145$
   741D                    2711 00144$:
                           2712 ;src/main.c:490: } else if (dx + 1 > enemy->x){
   741D DD 7E FC      [19] 2713 	ld	a,-4 (ix)
   7420 DD 96 FE      [19] 2714 	sub	a, -2 (ix)
   7423 DD 7E FD      [19] 2715 	ld	a,-3 (ix)
   7426 DD 9E FF      [19] 2716 	sbc	a, -1 (ix)
   7429 E2 2E 74      [10] 2717 	jp	PO, 00428$
   742C EE 80         [ 7] 2718 	xor	a, #0x80
   742E                    2719 00428$:
   742E F2 AA 74      [10] 2720 	jp	P,00145$
                           2721 ;src/main.c:491: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7431 DD 66 FA      [19] 2722 	ld	h,-6 (ix)
   7434 DD 6E FB      [19] 2723 	ld	l,-5 (ix)
   7437 E5            [11] 2724 	push	hl
   7438 2A C5 64      [16] 2725 	ld	hl,(_mapa)
   743B E5            [11] 2726 	push	hl
   743C CD 1C 4B      [17] 2727 	call	_getTilePtr
   743F F1            [10] 2728 	pop	af
   7440 F1            [10] 2729 	pop	af
   7441 4E            [ 7] 2730 	ld	c,(hl)
   7442 3E 02         [ 7] 2731 	ld	a,#0x02
   7444 91            [ 4] 2732 	sub	a, c
   7445 38 63         [12] 2733 	jr	C,00145$
                           2734 ;src/main.c:492: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7447 DD 6E F6      [19] 2735 	ld	l,-10 (ix)
   744A DD 66 F7      [19] 2736 	ld	h,-9 (ix)
   744D 7E            [ 7] 2737 	ld	a,(hl)
   744E C6 0B         [ 7] 2738 	add	a, #0x0B
   7450 47            [ 4] 2739 	ld	b,a
   7451 DD 6E F4      [19] 2740 	ld	l,-12 (ix)
   7454 DD 66 F5      [19] 2741 	ld	h,-11 (ix)
   7457 7E            [ 7] 2742 	ld	a,(hl)
   7458 C6 04         [ 7] 2743 	add	a, #0x04
   745A C5            [11] 2744 	push	bc
   745B 33            [ 6] 2745 	inc	sp
   745C F5            [11] 2746 	push	af
   745D 33            [ 6] 2747 	inc	sp
   745E 2A C5 64      [16] 2748 	ld	hl,(_mapa)
   7461 E5            [11] 2749 	push	hl
   7462 CD 1C 4B      [17] 2750 	call	_getTilePtr
   7465 F1            [10] 2751 	pop	af
   7466 F1            [10] 2752 	pop	af
   7467 4E            [ 7] 2753 	ld	c,(hl)
   7468 3E 02         [ 7] 2754 	ld	a,#0x02
   746A 91            [ 4] 2755 	sub	a, c
   746B 38 3D         [12] 2756 	jr	C,00145$
                           2757 ;src/main.c:493: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   746D DD 6E F6      [19] 2758 	ld	l,-10 (ix)
   7470 DD 66 F7      [19] 2759 	ld	h,-9 (ix)
   7473 7E            [ 7] 2760 	ld	a,(hl)
   7474 C6 16         [ 7] 2761 	add	a, #0x16
   7476 47            [ 4] 2762 	ld	b,a
   7477 DD 6E F4      [19] 2763 	ld	l,-12 (ix)
   747A DD 66 F5      [19] 2764 	ld	h,-11 (ix)
   747D 7E            [ 7] 2765 	ld	a,(hl)
   747E C6 04         [ 7] 2766 	add	a, #0x04
   7480 C5            [11] 2767 	push	bc
   7481 33            [ 6] 2768 	inc	sp
   7482 F5            [11] 2769 	push	af
   7483 33            [ 6] 2770 	inc	sp
   7484 2A C5 64      [16] 2771 	ld	hl,(_mapa)
   7487 E5            [11] 2772 	push	hl
   7488 CD 1C 4B      [17] 2773 	call	_getTilePtr
   748B F1            [10] 2774 	pop	af
   748C F1            [10] 2775 	pop	af
   748D 4E            [ 7] 2776 	ld	c,(hl)
   748E 3E 02         [ 7] 2777 	ld	a,#0x02
   7490 91            [ 4] 2778 	sub	a, c
   7491 38 17         [12] 2779 	jr	C,00145$
                           2780 ;src/main.c:494: moverEnemigoDerecha(enemy);
   7493 DD 6E F4      [19] 2781 	ld	l,-12 (ix)
   7496 DD 66 F5      [19] 2782 	ld	h,-11 (ix)
   7499 E5            [11] 2783 	push	hl
   749A CD 55 6B      [17] 2784 	call	_moverEnemigoDerecha
   749D F1            [10] 2785 	pop	af
                           2786 ;src/main.c:495: movX = 1;
   749E DD 36 F2 01   [19] 2787 	ld	-14 (ix),#0x01
                           2788 ;src/main.c:496: enemy->mover = SI;
   74A2 DD 6E F8      [19] 2789 	ld	l,-8 (ix)
   74A5 DD 66 F9      [19] 2790 	ld	h,-7 (ix)
   74A8 36 01         [10] 2791 	ld	(hl),#0x01
   74AA                    2792 00145$:
                           2793 ;src/main.c:499: if (dy < enemy->y) {
   74AA DD 6E F6      [19] 2794 	ld	l,-10 (ix)
   74AD DD 66 F7      [19] 2795 	ld	h,-9 (ix)
   74B0 4E            [ 7] 2796 	ld	c,(hl)
                           2797 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   74B1 DD 6E F4      [19] 2798 	ld	l,-12 (ix)
   74B4 DD 66 F5      [19] 2799 	ld	h,-11 (ix)
   74B7 46            [ 7] 2800 	ld	b,(hl)
                           2801 ;src/main.c:499: if (dy < enemy->y) {
   74B8 DD 7E 07      [19] 2802 	ld	a,7 (ix)
   74BB 91            [ 4] 2803 	sub	a, c
   74BC D2 3C 75      [10] 2804 	jp	NC,00155$
                           2805 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   74BF 51            [ 4] 2806 	ld	d,c
   74C0 15            [ 4] 2807 	dec	d
   74C1 15            [ 4] 2808 	dec	d
   74C2 D5            [11] 2809 	push	de
   74C3 33            [ 6] 2810 	inc	sp
   74C4 C5            [11] 2811 	push	bc
   74C5 33            [ 6] 2812 	inc	sp
   74C6 2A C5 64      [16] 2813 	ld	hl,(_mapa)
   74C9 E5            [11] 2814 	push	hl
   74CA CD 1C 4B      [17] 2815 	call	_getTilePtr
   74CD F1            [10] 2816 	pop	af
   74CE F1            [10] 2817 	pop	af
   74CF 4E            [ 7] 2818 	ld	c,(hl)
   74D0 3E 02         [ 7] 2819 	ld	a,#0x02
   74D2 91            [ 4] 2820 	sub	a, c
   74D3 DA B6 75      [10] 2821 	jp	C,00156$
                           2822 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   74D6 DD 6E F6      [19] 2823 	ld	l,-10 (ix)
   74D9 DD 66 F7      [19] 2824 	ld	h,-9 (ix)
   74DC 56            [ 7] 2825 	ld	d,(hl)
   74DD 15            [ 4] 2826 	dec	d
   74DE 15            [ 4] 2827 	dec	d
   74DF DD 6E F4      [19] 2828 	ld	l,-12 (ix)
   74E2 DD 66 F5      [19] 2829 	ld	h,-11 (ix)
   74E5 46            [ 7] 2830 	ld	b,(hl)
   74E6 04            [ 4] 2831 	inc	b
   74E7 04            [ 4] 2832 	inc	b
   74E8 D5            [11] 2833 	push	de
   74E9 33            [ 6] 2834 	inc	sp
   74EA C5            [11] 2835 	push	bc
   74EB 33            [ 6] 2836 	inc	sp
   74EC 2A C5 64      [16] 2837 	ld	hl,(_mapa)
   74EF E5            [11] 2838 	push	hl
   74F0 CD 1C 4B      [17] 2839 	call	_getTilePtr
   74F3 F1            [10] 2840 	pop	af
   74F4 F1            [10] 2841 	pop	af
   74F5 4E            [ 7] 2842 	ld	c,(hl)
   74F6 3E 02         [ 7] 2843 	ld	a,#0x02
   74F8 91            [ 4] 2844 	sub	a, c
   74F9 DA B6 75      [10] 2845 	jp	C,00156$
                           2846 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   74FC DD 6E F6      [19] 2847 	ld	l,-10 (ix)
   74FF DD 66 F7      [19] 2848 	ld	h,-9 (ix)
   7502 46            [ 7] 2849 	ld	b,(hl)
   7503 05            [ 4] 2850 	dec	b
   7504 05            [ 4] 2851 	dec	b
   7505 DD 6E F4      [19] 2852 	ld	l,-12 (ix)
   7508 DD 66 F5      [19] 2853 	ld	h,-11 (ix)
   750B 7E            [ 7] 2854 	ld	a,(hl)
   750C C6 04         [ 7] 2855 	add	a, #0x04
   750E C5            [11] 2856 	push	bc
   750F 33            [ 6] 2857 	inc	sp
   7510 F5            [11] 2858 	push	af
   7511 33            [ 6] 2859 	inc	sp
   7512 2A C5 64      [16] 2860 	ld	hl,(_mapa)
   7515 E5            [11] 2861 	push	hl
   7516 CD 1C 4B      [17] 2862 	call	_getTilePtr
   7519 F1            [10] 2863 	pop	af
   751A F1            [10] 2864 	pop	af
   751B 4E            [ 7] 2865 	ld	c,(hl)
   751C 3E 02         [ 7] 2866 	ld	a,#0x02
   751E 91            [ 4] 2867 	sub	a, c
   751F DA B6 75      [10] 2868 	jp	C,00156$
                           2869 ;src/main.c:503: moverEnemigoArriba(enemy);
   7522 DD 6E F4      [19] 2870 	ld	l,-12 (ix)
   7525 DD 66 F5      [19] 2871 	ld	h,-11 (ix)
   7528 E5            [11] 2872 	push	hl
   7529 CD 17 6B      [17] 2873 	call	_moverEnemigoArriba
   752C F1            [10] 2874 	pop	af
                           2875 ;src/main.c:504: movY = 1;
   752D DD 36 F1 01   [19] 2876 	ld	-15 (ix),#0x01
                           2877 ;src/main.c:505: enemy->mover = SI;
   7531 DD 6E F8      [19] 2878 	ld	l,-8 (ix)
   7534 DD 66 F9      [19] 2879 	ld	h,-7 (ix)
   7537 36 01         [10] 2880 	ld	(hl),#0x01
   7539 C3 B6 75      [10] 2881 	jp	00156$
   753C                    2882 00155$:
                           2883 ;src/main.c:508: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   753C 79            [ 4] 2884 	ld	a,c
   753D C6 18         [ 7] 2885 	add	a, #0x18
   753F 57            [ 4] 2886 	ld	d,a
   7540 D5            [11] 2887 	push	de
   7541 33            [ 6] 2888 	inc	sp
   7542 C5            [11] 2889 	push	bc
   7543 33            [ 6] 2890 	inc	sp
   7544 2A C5 64      [16] 2891 	ld	hl,(_mapa)
   7547 E5            [11] 2892 	push	hl
   7548 CD 1C 4B      [17] 2893 	call	_getTilePtr
   754B F1            [10] 2894 	pop	af
   754C F1            [10] 2895 	pop	af
   754D 4E            [ 7] 2896 	ld	c,(hl)
   754E 3E 02         [ 7] 2897 	ld	a,#0x02
   7550 91            [ 4] 2898 	sub	a, c
   7551 38 63         [12] 2899 	jr	C,00156$
                           2900 ;src/main.c:509: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7553 DD 6E F6      [19] 2901 	ld	l,-10 (ix)
   7556 DD 66 F7      [19] 2902 	ld	h,-9 (ix)
   7559 7E            [ 7] 2903 	ld	a,(hl)
   755A C6 18         [ 7] 2904 	add	a, #0x18
   755C 57            [ 4] 2905 	ld	d,a
   755D DD 6E F4      [19] 2906 	ld	l,-12 (ix)
   7560 DD 66 F5      [19] 2907 	ld	h,-11 (ix)
   7563 46            [ 7] 2908 	ld	b,(hl)
   7564 04            [ 4] 2909 	inc	b
   7565 04            [ 4] 2910 	inc	b
   7566 D5            [11] 2911 	push	de
   7567 33            [ 6] 2912 	inc	sp
   7568 C5            [11] 2913 	push	bc
   7569 33            [ 6] 2914 	inc	sp
   756A 2A C5 64      [16] 2915 	ld	hl,(_mapa)
   756D E5            [11] 2916 	push	hl
   756E CD 1C 4B      [17] 2917 	call	_getTilePtr
   7571 F1            [10] 2918 	pop	af
   7572 F1            [10] 2919 	pop	af
   7573 4E            [ 7] 2920 	ld	c,(hl)
   7574 3E 02         [ 7] 2921 	ld	a,#0x02
   7576 91            [ 4] 2922 	sub	a, c
   7577 38 3D         [12] 2923 	jr	C,00156$
                           2924 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7579 DD 6E F6      [19] 2925 	ld	l,-10 (ix)
   757C DD 66 F7      [19] 2926 	ld	h,-9 (ix)
   757F 7E            [ 7] 2927 	ld	a,(hl)
   7580 C6 18         [ 7] 2928 	add	a, #0x18
   7582 47            [ 4] 2929 	ld	b,a
   7583 DD 6E F4      [19] 2930 	ld	l,-12 (ix)
   7586 DD 66 F5      [19] 2931 	ld	h,-11 (ix)
   7589 7E            [ 7] 2932 	ld	a,(hl)
   758A C6 04         [ 7] 2933 	add	a, #0x04
   758C C5            [11] 2934 	push	bc
   758D 33            [ 6] 2935 	inc	sp
   758E F5            [11] 2936 	push	af
   758F 33            [ 6] 2937 	inc	sp
   7590 2A C5 64      [16] 2938 	ld	hl,(_mapa)
   7593 E5            [11] 2939 	push	hl
   7594 CD 1C 4B      [17] 2940 	call	_getTilePtr
   7597 F1            [10] 2941 	pop	af
   7598 F1            [10] 2942 	pop	af
   7599 4E            [ 7] 2943 	ld	c,(hl)
   759A 3E 02         [ 7] 2944 	ld	a,#0x02
   759C 91            [ 4] 2945 	sub	a, c
   759D 38 17         [12] 2946 	jr	C,00156$
                           2947 ;src/main.c:511: moverEnemigoAbajo(enemy);
   759F DD 6E F4      [19] 2948 	ld	l,-12 (ix)
   75A2 DD 66 F5      [19] 2949 	ld	h,-11 (ix)
   75A5 E5            [11] 2950 	push	hl
   75A6 CD 36 6B      [17] 2951 	call	_moverEnemigoAbajo
   75A9 F1            [10] 2952 	pop	af
                           2953 ;src/main.c:512: movY = 1;
   75AA DD 36 F1 01   [19] 2954 	ld	-15 (ix),#0x01
                           2955 ;src/main.c:513: enemy->mover = SI;
   75AE DD 6E F8      [19] 2956 	ld	l,-8 (ix)
   75B1 DD 66 F9      [19] 2957 	ld	h,-7 (ix)
   75B4 36 01         [10] 2958 	ld	(hl),#0x01
   75B6                    2959 00156$:
                           2960 ;src/main.c:516: if (!enemy->mover) {
   75B6 DD 6E F8      [19] 2961 	ld	l,-8 (ix)
   75B9 DD 66 F9      [19] 2962 	ld	h,-7 (ix)
   75BC 7E            [ 7] 2963 	ld	a,(hl)
   75BD B7            [ 4] 2964 	or	a, a
   75BE C2 15 78      [10] 2965 	jp	NZ,00199$
                           2966 ;src/main.c:517: if (!movX) {
   75C1 DD 7E F2      [19] 2967 	ld	a,-14 (ix)
   75C4 B7            [ 4] 2968 	or	a, a
   75C5 C2 EE 76      [10] 2969 	jp	NZ,00171$
                           2970 ;src/main.c:518: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   75C8 DD 6E F6      [19] 2971 	ld	l,-10 (ix)
   75CB DD 66 F7      [19] 2972 	ld	h,-9 (ix)
   75CE 5E            [ 7] 2973 	ld	e,(hl)
                           2974 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75CF DD 6E F4      [19] 2975 	ld	l,-12 (ix)
   75D2 DD 66 F5      [19] 2976 	ld	h,-11 (ix)
   75D5 4E            [ 7] 2977 	ld	c,(hl)
                           2978 ;src/main.c:518: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   75D6 3E 70         [ 7] 2979 	ld	a,#0x70
   75D8 93            [ 4] 2980 	sub	a, e
   75D9 D2 69 76      [10] 2981 	jp	NC,00168$
                           2982 ;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75DC 7B            [ 4] 2983 	ld	a,e
   75DD C6 18         [ 7] 2984 	add	a, #0x18
   75DF 47            [ 4] 2985 	ld	b,a
   75E0 C5            [11] 2986 	push	bc
   75E1 2A C5 64      [16] 2987 	ld	hl,(_mapa)
   75E4 E5            [11] 2988 	push	hl
   75E5 CD 1C 4B      [17] 2989 	call	_getTilePtr
   75E8 F1            [10] 2990 	pop	af
   75E9 F1            [10] 2991 	pop	af
   75EA 4E            [ 7] 2992 	ld	c,(hl)
   75EB 3E 02         [ 7] 2993 	ld	a,#0x02
   75ED 91            [ 4] 2994 	sub	a, c
   75EE 38 63         [12] 2995 	jr	C,00158$
                           2996 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   75F0 DD 6E F6      [19] 2997 	ld	l,-10 (ix)
   75F3 DD 66 F7      [19] 2998 	ld	h,-9 (ix)
   75F6 7E            [ 7] 2999 	ld	a,(hl)
   75F7 C6 18         [ 7] 3000 	add	a, #0x18
   75F9 57            [ 4] 3001 	ld	d,a
   75FA DD 6E F4      [19] 3002 	ld	l,-12 (ix)
   75FD DD 66 F5      [19] 3003 	ld	h,-11 (ix)
   7600 4E            [ 7] 3004 	ld	c,(hl)
   7601 41            [ 4] 3005 	ld	b,c
   7602 04            [ 4] 3006 	inc	b
   7603 04            [ 4] 3007 	inc	b
   7604 D5            [11] 3008 	push	de
   7605 33            [ 6] 3009 	inc	sp
   7606 C5            [11] 3010 	push	bc
   7607 33            [ 6] 3011 	inc	sp
   7608 2A C5 64      [16] 3012 	ld	hl,(_mapa)
   760B E5            [11] 3013 	push	hl
   760C CD 1C 4B      [17] 3014 	call	_getTilePtr
   760F F1            [10] 3015 	pop	af
   7610 F1            [10] 3016 	pop	af
   7611 4E            [ 7] 3017 	ld	c,(hl)
   7612 3E 02         [ 7] 3018 	ld	a,#0x02
   7614 91            [ 4] 3019 	sub	a, c
   7615 38 3C         [12] 3020 	jr	C,00158$
                           3021 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7617 DD 6E F6      [19] 3022 	ld	l,-10 (ix)
   761A DD 66 F7      [19] 3023 	ld	h,-9 (ix)
   761D 7E            [ 7] 3024 	ld	a,(hl)
   761E C6 18         [ 7] 3025 	add	a, #0x18
   7620 47            [ 4] 3026 	ld	b,a
   7621 DD 6E F4      [19] 3027 	ld	l,-12 (ix)
   7624 DD 66 F5      [19] 3028 	ld	h,-11 (ix)
   7627 7E            [ 7] 3029 	ld	a,(hl)
   7628 C6 04         [ 7] 3030 	add	a, #0x04
   762A C5            [11] 3031 	push	bc
   762B 33            [ 6] 3032 	inc	sp
   762C F5            [11] 3033 	push	af
   762D 33            [ 6] 3034 	inc	sp
   762E 2A C5 64      [16] 3035 	ld	hl,(_mapa)
   7631 E5            [11] 3036 	push	hl
   7632 CD 1C 4B      [17] 3037 	call	_getTilePtr
   7635 F1            [10] 3038 	pop	af
   7636 F1            [10] 3039 	pop	af
   7637 4E            [ 7] 3040 	ld	c,(hl)
   7638 3E 02         [ 7] 3041 	ld	a,#0x02
   763A 91            [ 4] 3042 	sub	a, c
   763B 38 16         [12] 3043 	jr	C,00158$
                           3044 ;src/main.c:522: moverEnemigoAbajo(enemy);
   763D DD 6E F4      [19] 3045 	ld	l,-12 (ix)
   7640 DD 66 F5      [19] 3046 	ld	h,-11 (ix)
   7643 E5            [11] 3047 	push	hl
   7644 CD 36 6B      [17] 3048 	call	_moverEnemigoAbajo
   7647 F1            [10] 3049 	pop	af
                           3050 ;src/main.c:523: enemy->mover = SI;
   7648 DD 6E F8      [19] 3051 	ld	l,-8 (ix)
   764B DD 66 F9      [19] 3052 	ld	h,-7 (ix)
   764E 36 01         [10] 3053 	ld	(hl),#0x01
   7650 C3 EE 76      [10] 3054 	jp	00171$
   7653                    3055 00158$:
                           3056 ;src/main.c:525: moverEnemigoArriba(enemy);
   7653 DD 6E F4      [19] 3057 	ld	l,-12 (ix)
   7656 DD 66 F5      [19] 3058 	ld	h,-11 (ix)
   7659 E5            [11] 3059 	push	hl
   765A CD 17 6B      [17] 3060 	call	_moverEnemigoArriba
   765D F1            [10] 3061 	pop	af
                           3062 ;src/main.c:526: enemy->mover = SI;
   765E DD 6E F8      [19] 3063 	ld	l,-8 (ix)
   7661 DD 66 F9      [19] 3064 	ld	h,-7 (ix)
   7664 36 01         [10] 3065 	ld	(hl),#0x01
   7666 C3 EE 76      [10] 3066 	jp	00171$
   7669                    3067 00168$:
                           3068 ;src/main.c:529: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7669 43            [ 4] 3069 	ld	b,e
   766A 05            [ 4] 3070 	dec	b
   766B 05            [ 4] 3071 	dec	b
   766C C5            [11] 3072 	push	bc
   766D 2A C5 64      [16] 3073 	ld	hl,(_mapa)
   7670 E5            [11] 3074 	push	hl
   7671 CD 1C 4B      [17] 3075 	call	_getTilePtr
   7674 F1            [10] 3076 	pop	af
   7675 F1            [10] 3077 	pop	af
   7676 4E            [ 7] 3078 	ld	c,(hl)
   7677 3E 02         [ 7] 3079 	ld	a,#0x02
   7679 91            [ 4] 3080 	sub	a, c
   767A 38 5F         [12] 3081 	jr	C,00163$
                           3082 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   767C DD 6E F6      [19] 3083 	ld	l,-10 (ix)
   767F DD 66 F7      [19] 3084 	ld	h,-9 (ix)
   7682 56            [ 7] 3085 	ld	d,(hl)
   7683 15            [ 4] 3086 	dec	d
   7684 15            [ 4] 3087 	dec	d
   7685 DD 6E F4      [19] 3088 	ld	l,-12 (ix)
   7688 DD 66 F5      [19] 3089 	ld	h,-11 (ix)
   768B 46            [ 7] 3090 	ld	b,(hl)
   768C 04            [ 4] 3091 	inc	b
   768D 04            [ 4] 3092 	inc	b
   768E D5            [11] 3093 	push	de
   768F 33            [ 6] 3094 	inc	sp
   7690 C5            [11] 3095 	push	bc
   7691 33            [ 6] 3096 	inc	sp
   7692 2A C5 64      [16] 3097 	ld	hl,(_mapa)
   7695 E5            [11] 3098 	push	hl
   7696 CD 1C 4B      [17] 3099 	call	_getTilePtr
   7699 F1            [10] 3100 	pop	af
   769A F1            [10] 3101 	pop	af
   769B 4E            [ 7] 3102 	ld	c,(hl)
   769C 3E 02         [ 7] 3103 	ld	a,#0x02
   769E 91            [ 4] 3104 	sub	a, c
   769F 38 3A         [12] 3105 	jr	C,00163$
                           3106 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   76A1 DD 6E F6      [19] 3107 	ld	l,-10 (ix)
   76A4 DD 66 F7      [19] 3108 	ld	h,-9 (ix)
   76A7 46            [ 7] 3109 	ld	b,(hl)
   76A8 05            [ 4] 3110 	dec	b
   76A9 05            [ 4] 3111 	dec	b
   76AA DD 6E F4      [19] 3112 	ld	l,-12 (ix)
   76AD DD 66 F5      [19] 3113 	ld	h,-11 (ix)
   76B0 7E            [ 7] 3114 	ld	a,(hl)
   76B1 C6 04         [ 7] 3115 	add	a, #0x04
   76B3 C5            [11] 3116 	push	bc
   76B4 33            [ 6] 3117 	inc	sp
   76B5 F5            [11] 3118 	push	af
   76B6 33            [ 6] 3119 	inc	sp
   76B7 2A C5 64      [16] 3120 	ld	hl,(_mapa)
   76BA E5            [11] 3121 	push	hl
   76BB CD 1C 4B      [17] 3122 	call	_getTilePtr
   76BE F1            [10] 3123 	pop	af
   76BF F1            [10] 3124 	pop	af
   76C0 4E            [ 7] 3125 	ld	c,(hl)
   76C1 3E 02         [ 7] 3126 	ld	a,#0x02
   76C3 91            [ 4] 3127 	sub	a, c
   76C4 38 15         [12] 3128 	jr	C,00163$
                           3129 ;src/main.c:532: moverEnemigoArriba(enemy);
   76C6 DD 6E F4      [19] 3130 	ld	l,-12 (ix)
   76C9 DD 66 F5      [19] 3131 	ld	h,-11 (ix)
   76CC E5            [11] 3132 	push	hl
   76CD CD 17 6B      [17] 3133 	call	_moverEnemigoArriba
   76D0 F1            [10] 3134 	pop	af
                           3135 ;src/main.c:533: enemy->mover = SI;
   76D1 DD 6E F8      [19] 3136 	ld	l,-8 (ix)
   76D4 DD 66 F9      [19] 3137 	ld	h,-7 (ix)
   76D7 36 01         [10] 3138 	ld	(hl),#0x01
   76D9 18 13         [12] 3139 	jr	00171$
   76DB                    3140 00163$:
                           3141 ;src/main.c:535: moverEnemigoAbajo(enemy);
   76DB DD 6E F4      [19] 3142 	ld	l,-12 (ix)
   76DE DD 66 F5      [19] 3143 	ld	h,-11 (ix)
   76E1 E5            [11] 3144 	push	hl
   76E2 CD 36 6B      [17] 3145 	call	_moverEnemigoAbajo
   76E5 F1            [10] 3146 	pop	af
                           3147 ;src/main.c:536: enemy->mover = SI;
   76E6 DD 6E F8      [19] 3148 	ld	l,-8 (ix)
   76E9 DD 66 F9      [19] 3149 	ld	h,-7 (ix)
   76EC 36 01         [10] 3150 	ld	(hl),#0x01
   76EE                    3151 00171$:
                           3152 ;src/main.c:541: if (!movY) {
   76EE DD 7E F1      [19] 3153 	ld	a,-15 (ix)
   76F1 B7            [ 4] 3154 	or	a, a
   76F2 C2 15 78      [10] 3155 	jp	NZ,00199$
                           3156 ;src/main.c:542: if (enemy->x < ANCHO_PANTALLA/2) {
   76F5 DD 6E F4      [19] 3157 	ld	l,-12 (ix)
   76F8 DD 66 F5      [19] 3158 	ld	h,-11 (ix)
   76FB 4E            [ 7] 3159 	ld	c,(hl)
                           3160 ;src/main.c:424: u8 dify = abs(enemy->y - prota.y);
   76FC DD 6E F6      [19] 3161 	ld	l,-10 (ix)
   76FF DD 66 F7      [19] 3162 	ld	h,-9 (ix)
   7702 46            [ 7] 3163 	ld	b,(hl)
                           3164 ;src/main.c:542: if (enemy->x < ANCHO_PANTALLA/2) {
   7703 79            [ 4] 3165 	ld	a,c
   7704 D6 28         [ 7] 3166 	sub	a, #0x28
   7706 D2 8B 77      [10] 3167 	jp	NC,00183$
                           3168 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7709 C5            [11] 3169 	push	bc
   770A 2A C5 64      [16] 3170 	ld	hl,(_mapa)
   770D E5            [11] 3171 	push	hl
   770E CD 1C 4B      [17] 3172 	call	_getTilePtr
   7711 F1            [10] 3173 	pop	af
   7712 F1            [10] 3174 	pop	af
   7713 4E            [ 7] 3175 	ld	c,(hl)
   7714 3E 02         [ 7] 3176 	ld	a,#0x02
   7716 91            [ 4] 3177 	sub	a, c
   7717 38 5C         [12] 3178 	jr	C,00173$
                           3179 ;src/main.c:544: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7719 DD 6E F6      [19] 3180 	ld	l,-10 (ix)
   771C DD 66 F7      [19] 3181 	ld	h,-9 (ix)
   771F 7E            [ 7] 3182 	ld	a,(hl)
   7720 C6 0B         [ 7] 3183 	add	a, #0x0B
   7722 DD 6E F4      [19] 3184 	ld	l,-12 (ix)
   7725 DD 66 F5      [19] 3185 	ld	h,-11 (ix)
   7728 46            [ 7] 3186 	ld	b,(hl)
   7729 F5            [11] 3187 	push	af
   772A 33            [ 6] 3188 	inc	sp
   772B C5            [11] 3189 	push	bc
   772C 33            [ 6] 3190 	inc	sp
   772D 2A C5 64      [16] 3191 	ld	hl,(_mapa)
   7730 E5            [11] 3192 	push	hl
   7731 CD 1C 4B      [17] 3193 	call	_getTilePtr
   7734 F1            [10] 3194 	pop	af
   7735 F1            [10] 3195 	pop	af
   7736 4E            [ 7] 3196 	ld	c,(hl)
   7737 3E 02         [ 7] 3197 	ld	a,#0x02
   7739 91            [ 4] 3198 	sub	a, c
   773A 38 39         [12] 3199 	jr	C,00173$
                           3200 ;src/main.c:545: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   773C DD 6E F6      [19] 3201 	ld	l,-10 (ix)
   773F DD 66 F7      [19] 3202 	ld	h,-9 (ix)
   7742 7E            [ 7] 3203 	ld	a,(hl)
   7743 C6 16         [ 7] 3204 	add	a, #0x16
   7745 DD 6E F4      [19] 3205 	ld	l,-12 (ix)
   7748 DD 66 F5      [19] 3206 	ld	h,-11 (ix)
   774B 46            [ 7] 3207 	ld	b,(hl)
   774C F5            [11] 3208 	push	af
   774D 33            [ 6] 3209 	inc	sp
   774E C5            [11] 3210 	push	bc
   774F 33            [ 6] 3211 	inc	sp
   7750 2A C5 64      [16] 3212 	ld	hl,(_mapa)
   7753 E5            [11] 3213 	push	hl
   7754 CD 1C 4B      [17] 3214 	call	_getTilePtr
   7757 F1            [10] 3215 	pop	af
   7758 F1            [10] 3216 	pop	af
   7759 4E            [ 7] 3217 	ld	c,(hl)
   775A 3E 02         [ 7] 3218 	ld	a,#0x02
   775C 91            [ 4] 3219 	sub	a, c
   775D 38 16         [12] 3220 	jr	C,00173$
                           3221 ;src/main.c:546: moverEnemigoIzquierda(enemy);
   775F DD 6E F4      [19] 3222 	ld	l,-12 (ix)
   7762 DD 66 F5      [19] 3223 	ld	h,-11 (ix)
   7765 E5            [11] 3224 	push	hl
   7766 CD 65 6B      [17] 3225 	call	_moverEnemigoIzquierda
   7769 F1            [10] 3226 	pop	af
                           3227 ;src/main.c:547: enemy->mover = SI;
   776A DD 6E F8      [19] 3228 	ld	l,-8 (ix)
   776D DD 66 F9      [19] 3229 	ld	h,-7 (ix)
   7770 36 01         [10] 3230 	ld	(hl),#0x01
   7772 C3 15 78      [10] 3231 	jp	00199$
   7775                    3232 00173$:
                           3233 ;src/main.c:549: moverEnemigoDerecha(enemy);
   7775 DD 6E F4      [19] 3234 	ld	l,-12 (ix)
   7778 DD 66 F5      [19] 3235 	ld	h,-11 (ix)
   777B E5            [11] 3236 	push	hl
   777C CD 55 6B      [17] 3237 	call	_moverEnemigoDerecha
   777F F1            [10] 3238 	pop	af
                           3239 ;src/main.c:550: enemy->mover = SI;
   7780 DD 6E F8      [19] 3240 	ld	l,-8 (ix)
   7783 DD 66 F9      [19] 3241 	ld	h,-7 (ix)
   7786 36 01         [10] 3242 	ld	(hl),#0x01
   7788 C3 15 78      [10] 3243 	jp	00199$
   778B                    3244 00183$:
                           3245 ;src/main.c:553: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   778B 79            [ 4] 3246 	ld	a,c
   778C C6 04         [ 7] 3247 	add	a, #0x04
   778E C5            [11] 3248 	push	bc
   778F 33            [ 6] 3249 	inc	sp
   7790 F5            [11] 3250 	push	af
   7791 33            [ 6] 3251 	inc	sp
   7792 2A C5 64      [16] 3252 	ld	hl,(_mapa)
   7795 E5            [11] 3253 	push	hl
   7796 CD 1C 4B      [17] 3254 	call	_getTilePtr
   7799 F1            [10] 3255 	pop	af
   779A F1            [10] 3256 	pop	af
   779B 4E            [ 7] 3257 	ld	c,(hl)
   779C 3E 02         [ 7] 3258 	ld	a,#0x02
   779E 91            [ 4] 3259 	sub	a, c
   779F 38 61         [12] 3260 	jr	C,00178$
                           3261 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   77A1 DD 6E F6      [19] 3262 	ld	l,-10 (ix)
   77A4 DD 66 F7      [19] 3263 	ld	h,-9 (ix)
   77A7 7E            [ 7] 3264 	ld	a,(hl)
   77A8 C6 0B         [ 7] 3265 	add	a, #0x0B
   77AA 47            [ 4] 3266 	ld	b,a
   77AB DD 6E F4      [19] 3267 	ld	l,-12 (ix)
   77AE DD 66 F5      [19] 3268 	ld	h,-11 (ix)
   77B1 7E            [ 7] 3269 	ld	a,(hl)
   77B2 C6 04         [ 7] 3270 	add	a, #0x04
   77B4 C5            [11] 3271 	push	bc
   77B5 33            [ 6] 3272 	inc	sp
   77B6 F5            [11] 3273 	push	af
   77B7 33            [ 6] 3274 	inc	sp
   77B8 2A C5 64      [16] 3275 	ld	hl,(_mapa)
   77BB E5            [11] 3276 	push	hl
   77BC CD 1C 4B      [17] 3277 	call	_getTilePtr
   77BF F1            [10] 3278 	pop	af
   77C0 F1            [10] 3279 	pop	af
   77C1 4E            [ 7] 3280 	ld	c,(hl)
   77C2 3E 02         [ 7] 3281 	ld	a,#0x02
   77C4 91            [ 4] 3282 	sub	a, c
   77C5 38 3B         [12] 3283 	jr	C,00178$
                           3284 ;src/main.c:555: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   77C7 DD 6E F6      [19] 3285 	ld	l,-10 (ix)
   77CA DD 66 F7      [19] 3286 	ld	h,-9 (ix)
   77CD 7E            [ 7] 3287 	ld	a,(hl)
   77CE C6 16         [ 7] 3288 	add	a, #0x16
   77D0 47            [ 4] 3289 	ld	b,a
   77D1 DD 6E F4      [19] 3290 	ld	l,-12 (ix)
   77D4 DD 66 F5      [19] 3291 	ld	h,-11 (ix)
   77D7 7E            [ 7] 3292 	ld	a,(hl)
   77D8 C6 04         [ 7] 3293 	add	a, #0x04
   77DA C5            [11] 3294 	push	bc
   77DB 33            [ 6] 3295 	inc	sp
   77DC F5            [11] 3296 	push	af
   77DD 33            [ 6] 3297 	inc	sp
   77DE 2A C5 64      [16] 3298 	ld	hl,(_mapa)
   77E1 E5            [11] 3299 	push	hl
   77E2 CD 1C 4B      [17] 3300 	call	_getTilePtr
   77E5 F1            [10] 3301 	pop	af
   77E6 F1            [10] 3302 	pop	af
   77E7 4E            [ 7] 3303 	ld	c,(hl)
   77E8 3E 02         [ 7] 3304 	ld	a,#0x02
   77EA 91            [ 4] 3305 	sub	a, c
   77EB 38 15         [12] 3306 	jr	C,00178$
                           3307 ;src/main.c:556: moverEnemigoDerecha(enemy);
   77ED DD 6E F4      [19] 3308 	ld	l,-12 (ix)
   77F0 DD 66 F5      [19] 3309 	ld	h,-11 (ix)
   77F3 E5            [11] 3310 	push	hl
   77F4 CD 55 6B      [17] 3311 	call	_moverEnemigoDerecha
   77F7 F1            [10] 3312 	pop	af
                           3313 ;src/main.c:557: enemy->mover = SI;
   77F8 DD 6E F8      [19] 3314 	ld	l,-8 (ix)
   77FB DD 66 F9      [19] 3315 	ld	h,-7 (ix)
   77FE 36 01         [10] 3316 	ld	(hl),#0x01
   7800 18 13         [12] 3317 	jr	00199$
   7802                    3318 00178$:
                           3319 ;src/main.c:560: moverEnemigoIzquierda(enemy);
   7802 DD 6E F4      [19] 3320 	ld	l,-12 (ix)
   7805 DD 66 F5      [19] 3321 	ld	h,-11 (ix)
   7808 E5            [11] 3322 	push	hl
   7809 CD 65 6B      [17] 3323 	call	_moverEnemigoIzquierda
   780C F1            [10] 3324 	pop	af
                           3325 ;src/main.c:561: enemy->mover = SI;
   780D DD 6E F8      [19] 3326 	ld	l,-8 (ix)
   7810 DD 66 F9      [19] 3327 	ld	h,-7 (ix)
   7813 36 01         [10] 3328 	ld	(hl),#0x01
   7815                    3329 00199$:
   7815 DD F9         [10] 3330 	ld	sp, ix
   7817 DD E1         [14] 3331 	pop	ix
   7819 C9            [10] 3332 	ret
                           3333 ;src/main.c:570: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3334 ;	---------------------------------
                           3335 ; Function updateEnemy
                           3336 ; ---------------------------------
   781A                    3337 _updateEnemy::
   781A DD E5         [15] 3338 	push	ix
   781C DD 21 00 00   [14] 3339 	ld	ix,#0
   7820 DD 39         [15] 3340 	add	ix,sp
   7822 21 F4 FF      [10] 3341 	ld	hl,#-12
   7825 39            [11] 3342 	add	hl,sp
   7826 F9            [ 6] 3343 	ld	sp,hl
                           3344 ;src/main.c:577: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7827 DD 4E 04      [19] 3345 	ld	c,4 (ix)
   782A DD 46 05      [19] 3346 	ld	b,5 (ix)
   782D 21 16 00      [10] 3347 	ld	hl,#0x0016
   7830 09            [11] 3348 	add	hl,bc
   7831 DD 75 FC      [19] 3349 	ld	-4 (ix),l
   7834 DD 74 FD      [19] 3350 	ld	-3 (ix),h
   7837 DD 6E FC      [19] 3351 	ld	l,-4 (ix)
   783A DD 66 FD      [19] 3352 	ld	h,-3 (ix)
   783D 7E            [ 7] 3353 	ld	a,(hl)
   783E B7            [ 4] 3354 	or	a, a
   783F 28 14         [12] 3355 	jr	Z,00115$
                           3356 ;src/main.c:578: engage(actual, prota.x, prota.y);
   7841 3A E9 63      [13] 3357 	ld	a, (#_prota + 1)
   7844 21 E8 63      [10] 3358 	ld	hl, #_prota + 0
   7847 56            [ 7] 3359 	ld	d,(hl)
   7848 F5            [11] 3360 	push	af
   7849 33            [ 6] 3361 	inc	sp
   784A D5            [11] 3362 	push	de
   784B 33            [ 6] 3363 	inc	sp
   784C C5            [11] 3364 	push	bc
   784D CD 6F 70      [17] 3365 	call	_engage
   7850 F1            [10] 3366 	pop	af
   7851 F1            [10] 3367 	pop	af
   7852 C3 71 79      [10] 3368 	jp	00117$
   7855                    3369 00115$:
                           3370 ;src/main.c:580: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7855 C5            [11] 3371 	push	bc
   7856 C5            [11] 3372 	push	bc
   7857 CD C4 6D      [17] 3373 	call	_lookFor
   785A F1            [10] 3374 	pop	af
   785B C1            [10] 3375 	pop	bc
                           3376 ;src/main.c:586: actual->patrolling = 0;
   785C 21 0B 00      [10] 3377 	ld	hl,#0x000B
   785F 09            [11] 3378 	add	hl,bc
   7860 DD 75 FA      [19] 3379 	ld	-6 (ix),l
   7863 DD 74 FB      [19] 3380 	ld	-5 (ix),h
                           3381 ;src/main.c:581: if (actual->patrolling) {
   7866 DD 6E FA      [19] 3382 	ld	l,-6 (ix)
   7869 DD 66 FB      [19] 3383 	ld	h,-5 (ix)
   786C 6E            [ 7] 3384 	ld	l,(hl)
                           3385 ;src/main.c:584: if (actual->in_range) {
   786D 79            [ 4] 3386 	ld	a,c
   786E C6 11         [ 7] 3387 	add	a, #0x11
   7870 5F            [ 4] 3388 	ld	e,a
   7871 78            [ 4] 3389 	ld	a,b
   7872 CE 00         [ 7] 3390 	adc	a, #0x00
   7874 57            [ 4] 3391 	ld	d,a
                           3392 ;src/main.c:592: actual->seek = 1;
   7875 79            [ 4] 3393 	ld	a,c
   7876 C6 14         [ 7] 3394 	add	a, #0x14
   7878 DD 77 F4      [19] 3395 	ld	-12 (ix),a
   787B 78            [ 4] 3396 	ld	a,b
   787C CE 00         [ 7] 3397 	adc	a, #0x00
   787E DD 77 F5      [19] 3398 	ld	-11 (ix),a
                           3399 ;src/main.c:581: if (actual->patrolling) {
   7881 7D            [ 4] 3400 	ld	a,l
   7882 B7            [ 4] 3401 	or	a, a
   7883 CA 41 79      [10] 3402 	jp	Z,00112$
                           3403 ;src/main.c:583: moverEnemigoPatrol(actual);
   7886 C5            [11] 3404 	push	bc
   7887 D5            [11] 3405 	push	de
   7888 C5            [11] 3406 	push	bc
   7889 CD 77 6B      [17] 3407 	call	_moverEnemigoPatrol
   788C F1            [10] 3408 	pop	af
   788D D1            [10] 3409 	pop	de
   788E C1            [10] 3410 	pop	bc
                           3411 ;src/main.c:584: if (actual->in_range) {
   788F 1A            [ 7] 3412 	ld	a,(de)
   7890 B7            [ 4] 3413 	or	a, a
   7891 28 24         [12] 3414 	jr	Z,00104$
                           3415 ;src/main.c:585: engage(actual, prota.x, prota.y);
   7893 3A E9 63      [13] 3416 	ld	a, (#_prota + 1)
   7896 21 E8 63      [10] 3417 	ld	hl, #_prota + 0
   7899 56            [ 7] 3418 	ld	d,(hl)
   789A F5            [11] 3419 	push	af
   789B 33            [ 6] 3420 	inc	sp
   789C D5            [11] 3421 	push	de
   789D 33            [ 6] 3422 	inc	sp
   789E C5            [11] 3423 	push	bc
   789F CD 6F 70      [17] 3424 	call	_engage
   78A2 F1            [10] 3425 	pop	af
   78A3 F1            [10] 3426 	pop	af
                           3427 ;src/main.c:586: actual->patrolling = 0;
   78A4 DD 6E FA      [19] 3428 	ld	l,-6 (ix)
   78A7 DD 66 FB      [19] 3429 	ld	h,-5 (ix)
   78AA 36 00         [10] 3430 	ld	(hl),#0x00
                           3431 ;src/main.c:587: actual->engage = 1;
   78AC DD 6E FC      [19] 3432 	ld	l,-4 (ix)
   78AF DD 66 FD      [19] 3433 	ld	h,-3 (ix)
   78B2 36 01         [10] 3434 	ld	(hl),#0x01
   78B4 C3 71 79      [10] 3435 	jp	00117$
   78B7                    3436 00104$:
                           3437 ;src/main.c:588: } else if (actual->seen) {
   78B7 21 12 00      [10] 3438 	ld	hl,#0x0012
   78BA 09            [11] 3439 	add	hl,bc
   78BB DD 75 FE      [19] 3440 	ld	-2 (ix),l
   78BE DD 74 FF      [19] 3441 	ld	-1 (ix),h
   78C1 DD 6E FE      [19] 3442 	ld	l,-2 (ix)
   78C4 DD 66 FF      [19] 3443 	ld	h,-1 (ix)
   78C7 7E            [ 7] 3444 	ld	a,(hl)
   78C8 B7            [ 4] 3445 	or	a, a
   78C9 CA 71 79      [10] 3446 	jp	Z,00117$
                           3447 ;src/main.c:589: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   78CC 3A E9 63      [13] 3448 	ld	a,(#_prota + 1)
   78CF DD 77 F6      [19] 3449 	ld	-10 (ix),a
   78D2 21 E8 63      [10] 3450 	ld	hl, #_prota + 0
   78D5 5E            [ 7] 3451 	ld	e,(hl)
   78D6 21 01 00      [10] 3452 	ld	hl,#0x0001
   78D9 09            [11] 3453 	add	hl,bc
   78DA DD 75 F7      [19] 3454 	ld	-9 (ix),l
   78DD DD 74 F8      [19] 3455 	ld	-8 (ix),h
   78E0 DD 6E F7      [19] 3456 	ld	l,-9 (ix)
   78E3 DD 66 F8      [19] 3457 	ld	h,-8 (ix)
   78E6 56            [ 7] 3458 	ld	d,(hl)
   78E7 0A            [ 7] 3459 	ld	a,(bc)
   78E8 DD 77 F9      [19] 3460 	ld	-7 (ix),a
   78EB C5            [11] 3461 	push	bc
   78EC 2A C5 64      [16] 3462 	ld	hl,(_mapa)
   78EF E5            [11] 3463 	push	hl
   78F0 C5            [11] 3464 	push	bc
   78F1 DD 7E F6      [19] 3465 	ld	a,-10 (ix)
   78F4 F5            [11] 3466 	push	af
   78F5 33            [ 6] 3467 	inc	sp
   78F6 7B            [ 4] 3468 	ld	a,e
   78F7 F5            [11] 3469 	push	af
   78F8 33            [ 6] 3470 	inc	sp
   78F9 D5            [11] 3471 	push	de
   78FA 33            [ 6] 3472 	inc	sp
   78FB DD 7E F9      [19] 3473 	ld	a,-7 (ix)
   78FE F5            [11] 3474 	push	af
   78FF 33            [ 6] 3475 	inc	sp
   7900 CD 30 44      [17] 3476 	call	_pathFinding
   7903 21 08 00      [10] 3477 	ld	hl,#8
   7906 39            [11] 3478 	add	hl,sp
   7907 F9            [ 6] 3479 	ld	sp,hl
   7908 C1            [10] 3480 	pop	bc
                           3481 ;src/main.c:590: actual->p_seek_x = actual->x;
   7909 21 17 00      [10] 3482 	ld	hl,#0x0017
   790C 09            [11] 3483 	add	hl,bc
   790D EB            [ 4] 3484 	ex	de,hl
   790E 0A            [ 7] 3485 	ld	a,(bc)
   790F 12            [ 7] 3486 	ld	(de),a
                           3487 ;src/main.c:591: actual->p_seek_y = actual->y;
   7910 21 18 00      [10] 3488 	ld	hl,#0x0018
   7913 09            [11] 3489 	add	hl,bc
   7914 EB            [ 4] 3490 	ex	de,hl
   7915 DD 6E F7      [19] 3491 	ld	l,-9 (ix)
   7918 DD 66 F8      [19] 3492 	ld	h,-8 (ix)
   791B 7E            [ 7] 3493 	ld	a,(hl)
   791C 12            [ 7] 3494 	ld	(de),a
                           3495 ;src/main.c:592: actual->seek = 1;
   791D E1            [10] 3496 	pop	hl
   791E E5            [11] 3497 	push	hl
   791F 36 01         [10] 3498 	ld	(hl),#0x01
                           3499 ;src/main.c:593: actual->iter=0;
   7921 21 0E 00      [10] 3500 	ld	hl,#0x000E
   7924 09            [11] 3501 	add	hl,bc
   7925 AF            [ 4] 3502 	xor	a, a
   7926 77            [ 7] 3503 	ld	(hl), a
   7927 23            [ 6] 3504 	inc	hl
   7928 77            [ 7] 3505 	ld	(hl), a
                           3506 ;src/main.c:594: actual->reversePatrol = NO;
   7929 21 0C 00      [10] 3507 	ld	hl,#0x000C
   792C 09            [11] 3508 	add	hl,bc
   792D 36 00         [10] 3509 	ld	(hl),#0x00
                           3510 ;src/main.c:595: actual->patrolling = 0;
   792F DD 6E FA      [19] 3511 	ld	l,-6 (ix)
   7932 DD 66 FB      [19] 3512 	ld	h,-5 (ix)
   7935 36 00         [10] 3513 	ld	(hl),#0x00
                           3514 ;src/main.c:596: actual->seen = 0;
   7937 DD 6E FE      [19] 3515 	ld	l,-2 (ix)
   793A DD 66 FF      [19] 3516 	ld	h,-1 (ix)
   793D 36 00         [10] 3517 	ld	(hl),#0x00
   793F 18 30         [12] 3518 	jr	00117$
   7941                    3519 00112$:
                           3520 ;src/main.c:598: } else if (actual->seek) {
   7941 E1            [10] 3521 	pop	hl
   7942 E5            [11] 3522 	push	hl
   7943 7E            [ 7] 3523 	ld	a,(hl)
   7944 B7            [ 4] 3524 	or	a, a
   7945 28 2A         [12] 3525 	jr	Z,00117$
                           3526 ;src/main.c:599: moverEnemigoSeek(actual);
   7947 C5            [11] 3527 	push	bc
   7948 D5            [11] 3528 	push	de
   7949 C5            [11] 3529 	push	bc
   794A CD CA 6E      [17] 3530 	call	_moverEnemigoSeek
   794D F1            [10] 3531 	pop	af
   794E D1            [10] 3532 	pop	de
   794F C1            [10] 3533 	pop	bc
                           3534 ;src/main.c:600: if (actual->in_range) {
   7950 1A            [ 7] 3535 	ld	a,(de)
   7951 B7            [ 4] 3536 	or	a, a
   7952 28 1D         [12] 3537 	jr	Z,00117$
                           3538 ;src/main.c:601: engage(actual, prota.x, prota.y);
   7954 3A E9 63      [13] 3539 	ld	a, (#_prota + 1)
   7957 21 E8 63      [10] 3540 	ld	hl, #_prota + 0
   795A 56            [ 7] 3541 	ld	d,(hl)
   795B F5            [11] 3542 	push	af
   795C 33            [ 6] 3543 	inc	sp
   795D D5            [11] 3544 	push	de
   795E 33            [ 6] 3545 	inc	sp
   795F C5            [11] 3546 	push	bc
   7960 CD 6F 70      [17] 3547 	call	_engage
   7963 F1            [10] 3548 	pop	af
   7964 F1            [10] 3549 	pop	af
                           3550 ;src/main.c:602: actual->seek = 0;
   7965 E1            [10] 3551 	pop	hl
   7966 E5            [11] 3552 	push	hl
   7967 36 00         [10] 3553 	ld	(hl),#0x00
                           3554 ;src/main.c:603: actual->engage = 1;
   7969 DD 6E FC      [19] 3555 	ld	l,-4 (ix)
   796C DD 66 FD      [19] 3556 	ld	h,-3 (ix)
   796F 36 01         [10] 3557 	ld	(hl),#0x01
                           3558 ;src/main.c:604: } else if (actual->seen) {
   7971                    3559 00117$:
   7971 DD F9         [10] 3560 	ld	sp, ix
   7973 DD E1         [14] 3561 	pop	ix
   7975 C9            [10] 3562 	ret
                           3563 ;src/main.c:611: void inicializarEnemy() {
                           3564 ;	---------------------------------
                           3565 ; Function inicializarEnemy
                           3566 ; ---------------------------------
   7976                    3567 _inicializarEnemy::
   7976 DD E5         [15] 3568 	push	ix
   7978 DD 21 00 00   [14] 3569 	ld	ix,#0
   797C DD 39         [15] 3570 	add	ix,sp
   797E 21 F9 FF      [10] 3571 	ld	hl,#-7
   7981 39            [11] 3572 	add	hl,sp
   7982 F9            [ 6] 3573 	ld	sp,hl
                           3574 ;src/main.c:612: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7983 3A C7 64      [13] 3575 	ld	a,(#_num_mapa + 0)
   7986 C6 02         [ 7] 3576 	add	a, #0x02
   7988 DD 77 F9      [19] 3577 	ld	-7 (ix),a
                           3578 ;src/main.c:622: actual = enemy;
   798B 11 60 60      [10] 3579 	ld	de,#_enemy+0
                           3580 ;src/main.c:623: while(i){
   798E                    3581 00101$:
   798E DD 7E F9      [19] 3582 	ld	a,-7 (ix)
   7991 B7            [ 4] 3583 	or	a, a
   7992 CA 8A 7A      [10] 3584 	jp	Z,00104$
                           3585 ;src/main.c:624: --i;
   7995 DD 35 F9      [23] 3586 	dec	-7 (ix)
                           3587 ;src/main.c:625: actual->x = actual->px = spawnX[i];
   7998 4B            [ 4] 3588 	ld	c, e
   7999 42            [ 4] 3589 	ld	b, d
   799A 03            [ 6] 3590 	inc	bc
   799B 03            [ 6] 3591 	inc	bc
   799C 3E EB         [ 7] 3592 	ld	a,#<(_spawnX)
   799E DD 86 F9      [19] 3593 	add	a, -7 (ix)
   79A1 DD 77 FA      [19] 3594 	ld	-6 (ix),a
   79A4 3E 64         [ 7] 3595 	ld	a,#>(_spawnX)
   79A6 CE 00         [ 7] 3596 	adc	a, #0x00
   79A8 DD 77 FB      [19] 3597 	ld	-5 (ix),a
   79AB DD 6E FA      [19] 3598 	ld	l,-6 (ix)
   79AE DD 66 FB      [19] 3599 	ld	h,-5 (ix)
   79B1 7E            [ 7] 3600 	ld	a,(hl)
   79B2 02            [ 7] 3601 	ld	(bc),a
   79B3 12            [ 7] 3602 	ld	(de),a
                           3603 ;src/main.c:626: actual->y = actual->py = spawnY[i];
   79B4 D5            [11] 3604 	push	de
   79B5 FD E1         [14] 3605 	pop	iy
   79B7 FD 23         [10] 3606 	inc	iy
   79B9 4B            [ 4] 3607 	ld	c, e
   79BA 42            [ 4] 3608 	ld	b, d
   79BB 03            [ 6] 3609 	inc	bc
   79BC 03            [ 6] 3610 	inc	bc
   79BD 03            [ 6] 3611 	inc	bc
   79BE 3E EF         [ 7] 3612 	ld	a,#<(_spawnY)
   79C0 DD 86 F9      [19] 3613 	add	a, -7 (ix)
   79C3 DD 77 FE      [19] 3614 	ld	-2 (ix),a
   79C6 3E 64         [ 7] 3615 	ld	a,#>(_spawnY)
   79C8 CE 00         [ 7] 3616 	adc	a, #0x00
   79CA DD 77 FF      [19] 3617 	ld	-1 (ix),a
   79CD DD 6E FE      [19] 3618 	ld	l,-2 (ix)
   79D0 DD 66 FF      [19] 3619 	ld	h,-1 (ix)
   79D3 7E            [ 7] 3620 	ld	a,(hl)
   79D4 02            [ 7] 3621 	ld	(bc),a
   79D5 FD 77 00      [19] 3622 	ld	0 (iy), a
                           3623 ;src/main.c:627: actual->mover  = NO;
   79D8 21 06 00      [10] 3624 	ld	hl,#0x0006
   79DB 19            [11] 3625 	add	hl,de
   79DC 36 00         [10] 3626 	ld	(hl),#0x00
                           3627 ;src/main.c:628: actual->mira   = M_abajo;
   79DE 21 07 00      [10] 3628 	ld	hl,#0x0007
   79E1 19            [11] 3629 	add	hl,de
   79E2 36 03         [10] 3630 	ld	(hl),#0x03
                           3631 ;src/main.c:629: actual->sprite = g_enemy;
   79E4 21 04 00      [10] 3632 	ld	hl,#0x0004
   79E7 19            [11] 3633 	add	hl,de
   79E8 36 3A         [10] 3634 	ld	(hl),#<(_g_enemy)
   79EA 23            [ 6] 3635 	inc	hl
   79EB 36 3C         [10] 3636 	ld	(hl),#>(_g_enemy)
                           3637 ;src/main.c:630: actual->muerto = NO;
   79ED 21 08 00      [10] 3638 	ld	hl,#0x0008
   79F0 19            [11] 3639 	add	hl,de
   79F1 36 00         [10] 3640 	ld	(hl),#0x00
                           3641 ;src/main.c:631: actual->muertes = 0;
   79F3 21 0A 00      [10] 3642 	ld	hl,#0x000A
   79F6 19            [11] 3643 	add	hl,de
   79F7 36 00         [10] 3644 	ld	(hl),#0x00
                           3645 ;src/main.c:632: actual->patrolling = SI;
   79F9 21 0B 00      [10] 3646 	ld	hl,#0x000B
   79FC 19            [11] 3647 	add	hl,de
   79FD 36 01         [10] 3648 	ld	(hl),#0x01
                           3649 ;src/main.c:633: actual->reversePatrol = NO;
   79FF 21 0C 00      [10] 3650 	ld	hl,#0x000C
   7A02 19            [11] 3651 	add	hl,de
   7A03 36 00         [10] 3652 	ld	(hl),#0x00
                           3653 ;src/main.c:634: actual->iter = 0;
   7A05 21 0E 00      [10] 3654 	ld	hl,#0x000E
   7A08 19            [11] 3655 	add	hl,de
   7A09 AF            [ 4] 3656 	xor	a, a
   7A0A 77            [ 7] 3657 	ld	(hl), a
   7A0B 23            [ 6] 3658 	inc	hl
   7A0C 77            [ 7] 3659 	ld	(hl), a
                           3660 ;src/main.c:635: actual->lastIter = 0;
   7A0D 21 10 00      [10] 3661 	ld	hl,#0x0010
   7A10 19            [11] 3662 	add	hl,de
   7A11 36 00         [10] 3663 	ld	(hl),#0x00
                           3664 ;src/main.c:636: actual->seen = 0;
   7A13 21 12 00      [10] 3665 	ld	hl,#0x0012
   7A16 19            [11] 3666 	add	hl,de
   7A17 36 00         [10] 3667 	ld	(hl),#0x00
                           3668 ;src/main.c:637: actual->found = 0;
   7A19 21 13 00      [10] 3669 	ld	hl,#0x0013
   7A1C 19            [11] 3670 	add	hl,de
   7A1D 36 00         [10] 3671 	ld	(hl),#0x00
                           3672 ;src/main.c:638: actual->engage = 0;
   7A1F 21 16 00      [10] 3673 	ld	hl,#0x0016
   7A22 19            [11] 3674 	add	hl,de
   7A23 36 00         [10] 3675 	ld	(hl),#0x00
                           3676 ;src/main.c:639: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7A25 21 C7 64      [10] 3677 	ld	hl,#_num_mapa + 0
   7A28 4E            [ 7] 3678 	ld	c, (hl)
   7A29 0C            [ 4] 3679 	inc	c
   7A2A 06 00         [ 7] 3680 	ld	b,#0x00
   7A2C 69            [ 4] 3681 	ld	l, c
   7A2D 60            [ 4] 3682 	ld	h, b
   7A2E 29            [11] 3683 	add	hl, hl
   7A2F 29            [11] 3684 	add	hl, hl
   7A30 09            [11] 3685 	add	hl, bc
   7A31 4D            [ 4] 3686 	ld	c,l
   7A32 44            [ 4] 3687 	ld	b,h
   7A33 21 07 65      [10] 3688 	ld	hl,#_patrolY
   7A36 09            [11] 3689 	add	hl,bc
   7A37 7D            [ 4] 3690 	ld	a,l
   7A38 DD 86 F9      [19] 3691 	add	a, -7 (ix)
   7A3B 6F            [ 4] 3692 	ld	l,a
   7A3C 7C            [ 4] 3693 	ld	a,h
   7A3D CE 00         [ 7] 3694 	adc	a, #0x00
   7A3F 67            [ 4] 3695 	ld	h,a
   7A40 7E            [ 7] 3696 	ld	a,(hl)
   7A41 DD 77 FD      [19] 3697 	ld	-3 (ix),a
   7A44 21 F3 64      [10] 3698 	ld	hl,#_patrolX
   7A47 09            [11] 3699 	add	hl,bc
   7A48 DD 4E F9      [19] 3700 	ld	c,-7 (ix)
   7A4B 06 00         [ 7] 3701 	ld	b,#0x00
   7A4D 09            [11] 3702 	add	hl,bc
   7A4E 7E            [ 7] 3703 	ld	a,(hl)
   7A4F DD 77 FC      [19] 3704 	ld	-4 (ix),a
   7A52 DD 6E FE      [19] 3705 	ld	l,-2 (ix)
   7A55 DD 66 FF      [19] 3706 	ld	h,-1 (ix)
   7A58 4E            [ 7] 3707 	ld	c,(hl)
   7A59 DD 6E FA      [19] 3708 	ld	l,-6 (ix)
   7A5C DD 66 FB      [19] 3709 	ld	h,-5 (ix)
   7A5F 46            [ 7] 3710 	ld	b,(hl)
   7A60 D5            [11] 3711 	push	de
   7A61 2A C5 64      [16] 3712 	ld	hl,(_mapa)
   7A64 E5            [11] 3713 	push	hl
   7A65 D5            [11] 3714 	push	de
   7A66 DD 66 FD      [19] 3715 	ld	h,-3 (ix)
   7A69 DD 6E FC      [19] 3716 	ld	l,-4 (ix)
   7A6C E5            [11] 3717 	push	hl
   7A6D 79            [ 4] 3718 	ld	a,c
   7A6E F5            [11] 3719 	push	af
   7A6F 33            [ 6] 3720 	inc	sp
   7A70 C5            [11] 3721 	push	bc
   7A71 33            [ 6] 3722 	inc	sp
   7A72 CD 30 44      [17] 3723 	call	_pathFinding
   7A75 21 08 00      [10] 3724 	ld	hl,#8
   7A78 39            [11] 3725 	add	hl,sp
   7A79 F9            [ 6] 3726 	ld	sp,hl
   7A7A D1            [10] 3727 	pop	de
                           3728 ;src/main.c:640: dibujarEnemigo(actual);
   7A7B D5            [11] 3729 	push	de
   7A7C D5            [11] 3730 	push	de
   7A7D CD A1 67      [17] 3731 	call	_dibujarEnemigo
   7A80 F1            [10] 3732 	pop	af
   7A81 D1            [10] 3733 	pop	de
                           3734 ;src/main.c:641: ++actual;
   7A82 21 E2 00      [10] 3735 	ld	hl,#0x00E2
   7A85 19            [11] 3736 	add	hl,de
   7A86 EB            [ 4] 3737 	ex	de,hl
   7A87 C3 8E 79      [10] 3738 	jp	00101$
   7A8A                    3739 00104$:
   7A8A DD F9         [10] 3740 	ld	sp, ix
   7A8C DD E1         [14] 3741 	pop	ix
   7A8E C9            [10] 3742 	ret
                           3743 ;src/main.c:645: void avanzarMapa() {
                           3744 ;	---------------------------------
                           3745 ; Function avanzarMapa
                           3746 ; ---------------------------------
   7A8F                    3747 _avanzarMapa::
                           3748 ;src/main.c:646: if(num_mapa < NUM_MAPAS -1) {
   7A8F 3A C7 64      [13] 3749 	ld	a,(#_num_mapa + 0)
   7A92 D6 02         [ 7] 3750 	sub	a, #0x02
   7A94 30 34         [12] 3751 	jr	NC,00102$
                           3752 ;src/main.c:647: mapa = mapas[++num_mapa];
   7A96 01 E5 64      [10] 3753 	ld	bc,#_mapas+0
   7A99 21 C7 64      [10] 3754 	ld	hl, #_num_mapa+0
   7A9C 34            [11] 3755 	inc	(hl)
   7A9D FD 21 C7 64   [14] 3756 	ld	iy,#_num_mapa
   7AA1 FD 6E 00      [19] 3757 	ld	l,0 (iy)
   7AA4 26 00         [ 7] 3758 	ld	h,#0x00
   7AA6 29            [11] 3759 	add	hl, hl
   7AA7 09            [11] 3760 	add	hl,bc
   7AA8 7E            [ 7] 3761 	ld	a,(hl)
   7AA9 FD 21 C5 64   [14] 3762 	ld	iy,#_mapa
   7AAD FD 77 00      [19] 3763 	ld	0 (iy),a
   7AB0 23            [ 6] 3764 	inc	hl
   7AB1 7E            [ 7] 3765 	ld	a,(hl)
   7AB2 32 C6 64      [13] 3766 	ld	(#_mapa + 1),a
                           3767 ;src/main.c:648: prota.x = prota.px = 2;
   7AB5 21 EA 63      [10] 3768 	ld	hl,#(_prota + 0x0002)
   7AB8 36 02         [10] 3769 	ld	(hl),#0x02
   7ABA 21 E8 63      [10] 3770 	ld	hl,#_prota
   7ABD 36 02         [10] 3771 	ld	(hl),#0x02
                           3772 ;src/main.c:649: prota.mover = SI;
   7ABF 21 EE 63      [10] 3773 	ld	hl,#(_prota + 0x0006)
   7AC2 36 01         [10] 3774 	ld	(hl),#0x01
                           3775 ;src/main.c:650: dibujarMapa();
   7AC4 CD CF 64      [17] 3776 	call	_dibujarMapa
                           3777 ;src/main.c:651: inicializarEnemy();
   7AC7 C3 76 79      [10] 3778 	jp  _inicializarEnemy
   7ACA                    3779 00102$:
                           3780 ;src/main.c:654: menuFin(puntuacion);
   7ACA FD 21 C8 64   [14] 3781 	ld	iy,#_puntuacion
   7ACE FD 6E 00      [19] 3782 	ld	l,0 (iy)
   7AD1 26 00         [ 7] 3783 	ld	h,#0x00
   7AD3 C3 A0 4B      [10] 3784 	jp  _menuFin
                           3785 ;src/main.c:658: void moverIzquierda() {
                           3786 ;	---------------------------------
                           3787 ; Function moverIzquierda
                           3788 ; ---------------------------------
   7AD6                    3789 _moverIzquierda::
                           3790 ;src/main.c:659: prota.mira = M_izquierda;
   7AD6 01 E8 63      [10] 3791 	ld	bc,#_prota+0
   7AD9 21 EF 63      [10] 3792 	ld	hl,#(_prota + 0x0007)
   7ADC 36 01         [10] 3793 	ld	(hl),#0x01
                           3794 ;src/main.c:660: if (!checkCollision(M_izquierda)) {
   7ADE C5            [11] 3795 	push	bc
   7ADF 3E 01         [ 7] 3796 	ld	a,#0x01
   7AE1 F5            [11] 3797 	push	af
   7AE2 33            [ 6] 3798 	inc	sp
   7AE3 CD 30 66      [17] 3799 	call	_checkCollision
   7AE6 33            [ 6] 3800 	inc	sp
   7AE7 C1            [10] 3801 	pop	bc
   7AE8 7D            [ 4] 3802 	ld	a,l
   7AE9 B7            [ 4] 3803 	or	a, a
   7AEA C0            [11] 3804 	ret	NZ
                           3805 ;src/main.c:661: prota.x--;
   7AEB 0A            [ 7] 3806 	ld	a,(bc)
   7AEC C6 FF         [ 7] 3807 	add	a,#0xFF
   7AEE 02            [ 7] 3808 	ld	(bc),a
                           3809 ;src/main.c:662: prota.mover = SI;
   7AEF 21 EE 63      [10] 3810 	ld	hl,#(_prota + 0x0006)
   7AF2 36 01         [10] 3811 	ld	(hl),#0x01
                           3812 ;src/main.c:663: prota.sprite = g_hero_left;
   7AF4 21 C6 3D      [10] 3813 	ld	hl,#_g_hero_left
   7AF7 22 EC 63      [16] 3814 	ld	((_prota + 0x0004)), hl
   7AFA C9            [10] 3815 	ret
                           3816 ;src/main.c:667: void moverDerecha() {
                           3817 ;	---------------------------------
                           3818 ; Function moverDerecha
                           3819 ; ---------------------------------
   7AFB                    3820 _moverDerecha::
                           3821 ;src/main.c:668: prota.mira = M_derecha;
   7AFB 21 EF 63      [10] 3822 	ld	hl,#(_prota + 0x0007)
   7AFE 36 00         [10] 3823 	ld	(hl),#0x00
                           3824 ;src/main.c:669: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7B00 AF            [ 4] 3825 	xor	a, a
   7B01 F5            [11] 3826 	push	af
   7B02 33            [ 6] 3827 	inc	sp
   7B03 CD 30 66      [17] 3828 	call	_checkCollision
   7B06 33            [ 6] 3829 	inc	sp
   7B07 45            [ 4] 3830 	ld	b,l
   7B08 21 E8 63      [10] 3831 	ld	hl, #_prota + 0
   7B0B 4E            [ 7] 3832 	ld	c,(hl)
   7B0C 59            [ 4] 3833 	ld	e,c
   7B0D 16 00         [ 7] 3834 	ld	d,#0x00
   7B0F 21 07 00      [10] 3835 	ld	hl,#0x0007
   7B12 19            [11] 3836 	add	hl,de
   7B13 11 50 80      [10] 3837 	ld	de, #0x8050
   7B16 29            [11] 3838 	add	hl, hl
   7B17 3F            [ 4] 3839 	ccf
   7B18 CB 1C         [ 8] 3840 	rr	h
   7B1A CB 1D         [ 8] 3841 	rr	l
   7B1C ED 52         [15] 3842 	sbc	hl, de
   7B1E 3E 00         [ 7] 3843 	ld	a,#0x00
   7B20 17            [ 4] 3844 	rla
   7B21 5F            [ 4] 3845 	ld	e,a
   7B22 78            [ 4] 3846 	ld	a,b
   7B23 B7            [ 4] 3847 	or	a,a
   7B24 20 14         [12] 3848 	jr	NZ,00104$
   7B26 B3            [ 4] 3849 	or	a,e
   7B27 28 11         [12] 3850 	jr	Z,00104$
                           3851 ;src/main.c:670: prota.x++;
   7B29 0C            [ 4] 3852 	inc	c
   7B2A 21 E8 63      [10] 3853 	ld	hl,#_prota
   7B2D 71            [ 7] 3854 	ld	(hl),c
                           3855 ;src/main.c:671: prota.mover = SI;
   7B2E 21 EE 63      [10] 3856 	ld	hl,#(_prota + 0x0006)
   7B31 36 01         [10] 3857 	ld	(hl),#0x01
                           3858 ;src/main.c:672: prota.sprite = g_hero;
   7B33 21 70 3E      [10] 3859 	ld	hl,#_g_hero
   7B36 22 EC 63      [16] 3860 	ld	((_prota + 0x0004)), hl
   7B39 C9            [10] 3861 	ret
   7B3A                    3862 00104$:
                           3863 ;src/main.c:673: }else if( prota.x + G_HERO_W >= 80){
   7B3A 7B            [ 4] 3864 	ld	a,e
   7B3B B7            [ 4] 3865 	or	a, a
   7B3C C0            [11] 3866 	ret	NZ
                           3867 ;src/main.c:674: avanzarMapa();
   7B3D C3 8F 7A      [10] 3868 	jp  _avanzarMapa
                           3869 ;src/main.c:678: void moverArriba() {
                           3870 ;	---------------------------------
                           3871 ; Function moverArriba
                           3872 ; ---------------------------------
   7B40                    3873 _moverArriba::
                           3874 ;src/main.c:679: prota.mira = M_arriba;
   7B40 21 EF 63      [10] 3875 	ld	hl,#(_prota + 0x0007)
   7B43 36 02         [10] 3876 	ld	(hl),#0x02
                           3877 ;src/main.c:680: if (!checkCollision(M_arriba)) {
   7B45 3E 02         [ 7] 3878 	ld	a,#0x02
   7B47 F5            [11] 3879 	push	af
   7B48 33            [ 6] 3880 	inc	sp
   7B49 CD 30 66      [17] 3881 	call	_checkCollision
   7B4C 33            [ 6] 3882 	inc	sp
   7B4D 7D            [ 4] 3883 	ld	a,l
   7B4E B7            [ 4] 3884 	or	a, a
   7B4F C0            [11] 3885 	ret	NZ
                           3886 ;src/main.c:681: prota.y--;
   7B50 21 E9 63      [10] 3887 	ld	hl,#_prota + 1
   7B53 4E            [ 7] 3888 	ld	c,(hl)
   7B54 0D            [ 4] 3889 	dec	c
   7B55 71            [ 7] 3890 	ld	(hl),c
                           3891 ;src/main.c:682: prota.y--;
   7B56 0D            [ 4] 3892 	dec	c
   7B57 71            [ 7] 3893 	ld	(hl),c
                           3894 ;src/main.c:683: prota.mover  = SI;
   7B58 21 EE 63      [10] 3895 	ld	hl,#(_prota + 0x0006)
   7B5B 36 01         [10] 3896 	ld	(hl),#0x01
                           3897 ;src/main.c:684: prota.sprite = g_hero_up;
   7B5D 21 2C 3D      [10] 3898 	ld	hl,#_g_hero_up
   7B60 22 EC 63      [16] 3899 	ld	((_prota + 0x0004)), hl
   7B63 C9            [10] 3900 	ret
                           3901 ;src/main.c:688: void moverAbajo() {
                           3902 ;	---------------------------------
                           3903 ; Function moverAbajo
                           3904 ; ---------------------------------
   7B64                    3905 _moverAbajo::
                           3906 ;src/main.c:689: prota.mira = M_abajo;
   7B64 21 EF 63      [10] 3907 	ld	hl,#(_prota + 0x0007)
   7B67 36 03         [10] 3908 	ld	(hl),#0x03
                           3909 ;src/main.c:690: if (!checkCollision(M_abajo) ) {
   7B69 3E 03         [ 7] 3910 	ld	a,#0x03
   7B6B F5            [11] 3911 	push	af
   7B6C 33            [ 6] 3912 	inc	sp
   7B6D CD 30 66      [17] 3913 	call	_checkCollision
   7B70 33            [ 6] 3914 	inc	sp
   7B71 7D            [ 4] 3915 	ld	a,l
   7B72 B7            [ 4] 3916 	or	a, a
   7B73 C0            [11] 3917 	ret	NZ
                           3918 ;src/main.c:691: prota.y++;
   7B74 01 E9 63      [10] 3919 	ld	bc,#_prota + 1
   7B77 0A            [ 7] 3920 	ld	a,(bc)
   7B78 3C            [ 4] 3921 	inc	a
   7B79 02            [ 7] 3922 	ld	(bc),a
                           3923 ;src/main.c:692: prota.y++;
   7B7A 3C            [ 4] 3924 	inc	a
   7B7B 02            [ 7] 3925 	ld	(bc),a
                           3926 ;src/main.c:693: prota.mover  = SI;
   7B7C 21 EE 63      [10] 3927 	ld	hl,#(_prota + 0x0006)
   7B7F 36 01         [10] 3928 	ld	(hl),#0x01
                           3929 ;src/main.c:694: prota.sprite = g_hero_down;
   7B81 21 92 3C      [10] 3930 	ld	hl,#_g_hero_down
   7B84 22 EC 63      [16] 3931 	ld	((_prota + 0x0004)), hl
   7B87 C9            [10] 3932 	ret
                           3933 ;src/main.c:701: void intHandler() {
                           3934 ;	---------------------------------
                           3935 ; Function intHandler
                           3936 ; ---------------------------------
   7B88                    3937 _intHandler::
                           3938 ;src/main.c:702: if (++i == 6) {
   7B88 21 FB 63      [10] 3939 	ld	hl, #_i+0
   7B8B 34            [11] 3940 	inc	(hl)
   7B8C 3A FB 63      [13] 3941 	ld	a,(#_i + 0)
   7B8F D6 06         [ 7] 3942 	sub	a, #0x06
   7B91 C0            [11] 3943 	ret	NZ
                           3944 ;src/main.c:703: play();
   7B92 CD 34 53      [17] 3945 	call	_play
                           3946 ;src/main.c:704: i=0;
   7B95 21 FB 63      [10] 3947 	ld	hl,#_i + 0
   7B98 36 00         [10] 3948 	ld	(hl), #0x00
   7B9A C9            [10] 3949 	ret
                           3950 ;src/main.c:708: void inicializarCPC() {
                           3951 ;	---------------------------------
                           3952 ; Function inicializarCPC
                           3953 ; ---------------------------------
   7B9B                    3954 _inicializarCPC::
                           3955 ;src/main.c:709: cpct_disableFirmware();
   7B9B CD DB 56      [17] 3956 	call	_cpct_disableFirmware
                           3957 ;src/main.c:710: cpct_setVideoMode(0);
   7B9E 2E 00         [ 7] 3958 	ld	l,#0x00
   7BA0 CD AF 56      [17] 3959 	call	_cpct_setVideoMode
                           3960 ;src/main.c:711: cpct_setBorder(HW_BLACK);
   7BA3 21 10 14      [10] 3961 	ld	hl,#0x1410
   7BA6 E5            [11] 3962 	push	hl
   7BA7 CD 12 54      [17] 3963 	call	_cpct_setPALColour
                           3964 ;src/main.c:712: cpct_setPalette(g_palette, 16);
   7BAA 21 10 00      [10] 3965 	ld	hl,#0x0010
   7BAD E5            [11] 3966 	push	hl
   7BAE 21 60 3E      [10] 3967 	ld	hl,#_g_palette
   7BB1 E5            [11] 3968 	push	hl
   7BB2 CD EF 53      [17] 3969 	call	_cpct_setPalette
   7BB5 C9            [10] 3970 	ret
                           3971 ;src/main.c:717: void inicializarJuego() {
                           3972 ;	---------------------------------
                           3973 ; Function inicializarJuego
                           3974 ; ---------------------------------
   7BB6                    3975 _inicializarJuego::
                           3976 ;src/main.c:719: num_mapa = 0;
   7BB6 21 C7 64      [10] 3977 	ld	hl,#_num_mapa + 0
   7BB9 36 00         [10] 3978 	ld	(hl), #0x00
                           3979 ;src/main.c:720: mapa = mapas[num_mapa];
   7BBB 21 E5 64      [10] 3980 	ld	hl, #_mapas + 0
   7BBE 7E            [ 7] 3981 	ld	a,(hl)
   7BBF FD 21 C5 64   [14] 3982 	ld	iy,#_mapa
   7BC3 FD 77 00      [19] 3983 	ld	0 (iy),a
   7BC6 23            [ 6] 3984 	inc	hl
   7BC7 7E            [ 7] 3985 	ld	a,(hl)
   7BC8 32 C6 64      [13] 3986 	ld	(#_mapa + 1),a
                           3987 ;src/main.c:721: cpct_etm_setTileset2x4(g_tileset);
   7BCB 21 E0 17      [10] 3988 	ld	hl,#_g_tileset
   7BCE CD 03 56      [17] 3989 	call	_cpct_etm_setTileset2x4
                           3990 ;src/main.c:723: dibujarMapa();
   7BD1 CD CF 64      [17] 3991 	call	_dibujarMapa
                           3992 ;src/main.c:726: barraPuntuacionInicial();
   7BD4 CD 40 51      [17] 3993 	call	_barraPuntuacionInicial
                           3994 ;src/main.c:729: prota.x = prota.px = 4;
   7BD7 21 EA 63      [10] 3995 	ld	hl,#(_prota + 0x0002)
   7BDA 36 04         [10] 3996 	ld	(hl),#0x04
   7BDC 21 E8 63      [10] 3997 	ld	hl,#_prota
   7BDF 36 04         [10] 3998 	ld	(hl),#0x04
                           3999 ;src/main.c:730: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7BE1 21 EB 63      [10] 4000 	ld	hl,#(_prota + 0x0003)
   7BE4 36 68         [10] 4001 	ld	(hl),#0x68
   7BE6 21 E9 63      [10] 4002 	ld	hl,#(_prota + 0x0001)
   7BE9 36 68         [10] 4003 	ld	(hl),#0x68
                           4004 ;src/main.c:731: prota.mover  = NO;
   7BEB 21 EE 63      [10] 4005 	ld	hl,#(_prota + 0x0006)
   7BEE 36 00         [10] 4006 	ld	(hl),#0x00
                           4007 ;src/main.c:732: prota.mira=M_derecha;
   7BF0 21 EF 63      [10] 4008 	ld	hl,#(_prota + 0x0007)
   7BF3 36 00         [10] 4009 	ld	(hl),#0x00
                           4010 ;src/main.c:733: prota.sprite = g_hero;
   7BF5 21 70 3E      [10] 4011 	ld	hl,#_g_hero
   7BF8 22 EC 63      [16] 4012 	ld	((_prota + 0x0004)), hl
                           4013 ;src/main.c:737: cu.x = cu.px = 0;
   7BFB 21 F2 63      [10] 4014 	ld	hl,#(_cu + 0x0002)
   7BFE 36 00         [10] 4015 	ld	(hl),#0x00
   7C00 21 F0 63      [10] 4016 	ld	hl,#_cu
   7C03 36 00         [10] 4017 	ld	(hl),#0x00
                           4018 ;src/main.c:738: cu.y = cu.py = 0;
   7C05 21 F3 63      [10] 4019 	ld	hl,#(_cu + 0x0003)
   7C08 36 00         [10] 4020 	ld	(hl),#0x00
   7C0A 21 F1 63      [10] 4021 	ld	hl,#(_cu + 0x0001)
   7C0D 36 00         [10] 4022 	ld	(hl),#0x00
                           4023 ;src/main.c:739: cu.lanzado = NO;
   7C0F 21 F6 63      [10] 4024 	ld	hl,#(_cu + 0x0006)
   7C12 36 00         [10] 4025 	ld	(hl),#0x00
                           4026 ;src/main.c:740: cu.mover = NO;
   7C14 21 F9 63      [10] 4027 	ld	hl,#(_cu + 0x0009)
   7C17 36 00         [10] 4028 	ld	(hl),#0x00
                           4029 ;src/main.c:741: cu.off_bound = NO;
   7C19 21 FA 63      [10] 4030 	ld	hl,#(_cu + 0x000a)
   7C1C 36 00         [10] 4031 	ld	(hl),#0x00
                           4032 ;src/main.c:743: inicializarEnemy();
   7C1E CD 76 79      [17] 4033 	call	_inicializarEnemy
                           4034 ;src/main.c:745: dibujarProta();
   7C21 C3 1B 65      [10] 4035 	jp  _dibujarProta
                           4036 ;src/main.c:748: void main(void) {
                           4037 ;	---------------------------------
                           4038 ; Function main
                           4039 ; ---------------------------------
   7C24                    4040 _main::
   7C24 DD E5         [15] 4041 	push	ix
   7C26 DD 21 00 00   [14] 4042 	ld	ix,#0
   7C2A DD 39         [15] 4043 	add	ix,sp
   7C2C 21 F9 FF      [10] 4044 	ld	hl,#-7
   7C2F 39            [11] 4045 	add	hl,sp
   7C30 F9            [ 6] 4046 	ld	sp,hl
                           4047 ;src/main.c:753: inicializarCPC();
   7C31 CD 9B 7B      [17] 4048 	call	_inicializarCPC
                           4049 ;src/main.c:755: menuInicio();
   7C34 CD 61 50      [17] 4050 	call	_menuInicio
                           4051 ;src/main.c:757: inicializarJuego();
   7C37 CD B6 7B      [17] 4052 	call	_inicializarJuego
                           4053 ;src/main.c:761: while (1) {
   7C3A                    4054 00126$:
                           4055 ;src/main.c:763: i = 2 + num_mapa;
   7C3A 21 C7 64      [10] 4056 	ld	hl,#_num_mapa + 0
   7C3D 4E            [ 7] 4057 	ld	c, (hl)
   7C3E 0C            [ 4] 4058 	inc	c
   7C3F 0C            [ 4] 4059 	inc	c
                           4060 ;src/main.c:764: actual = enemy;
                           4061 ;src/main.c:766: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7C40 C5            [11] 4062 	push	bc
   7C41 21 00 01      [10] 4063 	ld	hl,#_g_tablatrans
   7C44 E5            [11] 4064 	push	hl
   7C45 2A C5 64      [16] 4065 	ld	hl,(_mapa)
   7C48 E5            [11] 4066 	push	hl
   7C49 21 E8 63      [10] 4067 	ld	hl,#_prota
   7C4C E5            [11] 4068 	push	hl
   7C4D 21 F0 63      [10] 4069 	ld	hl,#_cu
   7C50 E5            [11] 4070 	push	hl
   7C51 CD C9 65      [17] 4071 	call	_comprobarTeclado
   7C54 21 08 00      [10] 4072 	ld	hl,#8
   7C57 39            [11] 4073 	add	hl,sp
   7C58 F9            [ 6] 4074 	ld	sp,hl
   7C59 2A C5 64      [16] 4075 	ld	hl,(_mapa)
   7C5C E5            [11] 4076 	push	hl
   7C5D 21 F0 63      [10] 4077 	ld	hl,#_cu
   7C60 E5            [11] 4078 	push	hl
   7C61 CD E5 49      [17] 4079 	call	_moverCuchillo
   7C64 F1            [10] 4080 	pop	af
   7C65 F1            [10] 4081 	pop	af
   7C66 C1            [10] 4082 	pop	bc
                           4083 ;src/main.c:768: while(i){
   7C67 DD 71 FF      [19] 4084 	ld	-1 (ix),c
   7C6A DD 36 FD 60   [19] 4085 	ld	-3 (ix),#<(_enemy)
   7C6E DD 36 FE 60   [19] 4086 	ld	-2 (ix),#>(_enemy)
   7C72                    4087 00105$:
   7C72 DD 7E FF      [19] 4088 	ld	a,-1 (ix)
   7C75 B7            [ 4] 4089 	or	a, a
   7C76 28 4E         [12] 4090 	jr	Z,00107$
                           4091 ;src/main.c:770: --i;
   7C78 DD 35 FF      [23] 4092 	dec	-1 (ix)
                           4093 ;src/main.c:771: if(!actual->muerto){
   7C7B DD 7E FD      [19] 4094 	ld	a,-3 (ix)
   7C7E C6 08         [ 7] 4095 	add	a, #0x08
   7C80 DD 77 F9      [19] 4096 	ld	-7 (ix),a
   7C83 DD 7E FE      [19] 4097 	ld	a,-2 (ix)
   7C86 CE 00         [ 7] 4098 	adc	a, #0x00
   7C88 DD 77 FA      [19] 4099 	ld	-6 (ix),a
   7C8B E1            [10] 4100 	pop	hl
   7C8C E5            [11] 4101 	push	hl
   7C8D 7E            [ 7] 4102 	ld	a,(hl)
   7C8E B7            [ 4] 4103 	or	a, a
   7C8F 20 12         [12] 4104 	jr	NZ,00102$
                           4105 ;src/main.c:772: checkEnemyDead(cu.direccion, actual);
   7C91 21 F7 63      [10] 4106 	ld	hl, #_cu + 7
   7C94 46            [ 7] 4107 	ld	b,(hl)
   7C95 DD 6E FD      [19] 4108 	ld	l,-3 (ix)
   7C98 DD 66 FE      [19] 4109 	ld	h,-2 (ix)
   7C9B E5            [11] 4110 	push	hl
   7C9C C5            [11] 4111 	push	bc
   7C9D 33            [ 6] 4112 	inc	sp
   7C9E CD 2A 69      [17] 4113 	call	_checkEnemyDead
   7CA1 F1            [10] 4114 	pop	af
   7CA2 33            [ 6] 4115 	inc	sp
   7CA3                    4116 00102$:
                           4117 ;src/main.c:774: if(!actual->muerto){
   7CA3 E1            [10] 4118 	pop	hl
   7CA4 E5            [11] 4119 	push	hl
   7CA5 7E            [ 7] 4120 	ld	a,(hl)
   7CA6 B7            [ 4] 4121 	or	a, a
   7CA7 20 0B         [12] 4122 	jr	NZ,00104$
                           4123 ;src/main.c:775: updateEnemy(actual);
   7CA9 DD 6E FD      [19] 4124 	ld	l,-3 (ix)
   7CAC DD 66 FE      [19] 4125 	ld	h,-2 (ix)
   7CAF E5            [11] 4126 	push	hl
   7CB0 CD 1A 78      [17] 4127 	call	_updateEnemy
   7CB3 F1            [10] 4128 	pop	af
   7CB4                    4129 00104$:
                           4130 ;src/main.c:777: ++actual;
   7CB4 DD 7E FD      [19] 4131 	ld	a,-3 (ix)
   7CB7 C6 E2         [ 7] 4132 	add	a, #0xE2
   7CB9 DD 77 FD      [19] 4133 	ld	-3 (ix),a
   7CBC DD 7E FE      [19] 4134 	ld	a,-2 (ix)
   7CBF CE 00         [ 7] 4135 	adc	a, #0x00
   7CC1 DD 77 FE      [19] 4136 	ld	-2 (ix),a
   7CC4 18 AC         [12] 4137 	jr	00105$
   7CC6                    4138 00107$:
                           4139 ;src/main.c:780: cpct_waitVSYNC();
   7CC6 CD A7 56      [17] 4140 	call	_cpct_waitVSYNC
                           4141 ;src/main.c:783: if (prota.mover) {
   7CC9 01 EE 63      [10] 4142 	ld	bc,#_prota + 6
   7CCC 0A            [ 7] 4143 	ld	a,(bc)
   7CCD B7            [ 4] 4144 	or	a, a
   7CCE 28 07         [12] 4145 	jr	Z,00109$
                           4146 ;src/main.c:784: redibujarProta();
   7CD0 C5            [11] 4147 	push	bc
   7CD1 CD B5 65      [17] 4148 	call	_redibujarProta
   7CD4 C1            [10] 4149 	pop	bc
                           4150 ;src/main.c:785: prota.mover = NO;
   7CD5 AF            [ 4] 4151 	xor	a, a
   7CD6 02            [ 7] 4152 	ld	(bc),a
   7CD7                    4153 00109$:
                           4154 ;src/main.c:787: if(cu.lanzado && cu.mover){
   7CD7 21 F6 63      [10] 4155 	ld	hl, #(_cu + 0x0006) + 0
   7CDA 4E            [ 7] 4156 	ld	c,(hl)
                           4157 ;src/main.c:788: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4158 ;src/main.c:787: if(cu.lanzado && cu.mover){
   7CDB 79            [ 4] 4159 	ld	a,c
   7CDC B7            [ 4] 4160 	or	a, a
   7CDD 28 30         [12] 4161 	jr	Z,00114$
   7CDF 3A F9 63      [13] 4162 	ld	a, (#(_cu + 0x0009) + 0)
   7CE2 B7            [ 4] 4163 	or	a, a
   7CE3 28 2A         [12] 4164 	jr	Z,00114$
                           4165 ;src/main.c:788: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7CE5 21 F1 63      [10] 4166 	ld	hl, #(_cu + 0x0001) + 0
   7CE8 4E            [ 7] 4167 	ld	c,(hl)
   7CE9 21 F0 63      [10] 4168 	ld	hl, #_cu + 0
   7CEC 46            [ 7] 4169 	ld	b,(hl)
   7CED 21 F8 63      [10] 4170 	ld	hl, #(_cu + 0x0008) + 0
   7CF0 5E            [ 7] 4171 	ld	e,(hl)
   7CF1 2A C5 64      [16] 4172 	ld	hl,(_mapa)
   7CF4 E5            [11] 4173 	push	hl
   7CF5 21 00 01      [10] 4174 	ld	hl,#_g_tablatrans
   7CF8 E5            [11] 4175 	push	hl
   7CF9 21 F0 63      [10] 4176 	ld	hl,#_cu
   7CFC E5            [11] 4177 	push	hl
   7CFD 79            [ 4] 4178 	ld	a,c
   7CFE F5            [11] 4179 	push	af
   7CFF 33            [ 6] 4180 	inc	sp
   7D00 C5            [11] 4181 	push	bc
   7D01 33            [ 6] 4182 	inc	sp
   7D02 7B            [ 4] 4183 	ld	a,e
   7D03 F5            [11] 4184 	push	af
   7D04 33            [ 6] 4185 	inc	sp
   7D05 CD F5 46      [17] 4186 	call	_redibujarCuchillo
   7D08 21 09 00      [10] 4187 	ld	hl,#9
   7D0B 39            [11] 4188 	add	hl,sp
   7D0C F9            [ 6] 4189 	ld	sp,hl
   7D0D 18 28         [12] 4190 	jr	00115$
   7D0F                    4191 00114$:
                           4192 ;src/main.c:789: }else if (cu.lanzado && !cu.mover){
   7D0F 79            [ 4] 4193 	ld	a,c
   7D10 B7            [ 4] 4194 	or	a, a
   7D11 28 24         [12] 4195 	jr	Z,00115$
   7D13 3A F9 63      [13] 4196 	ld	a, (#(_cu + 0x0009) + 0)
   7D16 B7            [ 4] 4197 	or	a, a
   7D17 20 1E         [12] 4198 	jr	NZ,00115$
                           4199 ;src/main.c:790: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7D19 21 F1 63      [10] 4200 	ld	hl, #(_cu + 0x0001) + 0
   7D1C 46            [ 7] 4201 	ld	b,(hl)
   7D1D 21 F0 63      [10] 4202 	ld	hl, #_cu + 0
   7D20 4E            [ 7] 4203 	ld	c,(hl)
   7D21 21 F8 63      [10] 4204 	ld	hl, #(_cu + 0x0008) + 0
   7D24 56            [ 7] 4205 	ld	d,(hl)
   7D25 2A C5 64      [16] 4206 	ld	hl,(_mapa)
   7D28 E5            [11] 4207 	push	hl
   7D29 C5            [11] 4208 	push	bc
   7D2A D5            [11] 4209 	push	de
   7D2B 33            [ 6] 4210 	inc	sp
   7D2C CD 62 46      [17] 4211 	call	_borrarCuchillo
   7D2F F1            [10] 4212 	pop	af
   7D30 F1            [10] 4213 	pop	af
   7D31 33            [ 6] 4214 	inc	sp
                           4215 ;src/main.c:791: cu.lanzado = NO;
   7D32 21 F6 63      [10] 4216 	ld	hl,#(_cu + 0x0006)
   7D35 36 00         [10] 4217 	ld	(hl),#0x00
   7D37                    4218 00115$:
                           4219 ;src/main.c:794: i = 2 + num_mapa;
   7D37 3A C7 64      [13] 4220 	ld	a,(#_num_mapa + 0)
   7D3A C6 02         [ 7] 4221 	add	a, #0x02
   7D3C DD 77 F9      [19] 4222 	ld	-7 (ix),a
                           4223 ;src/main.c:795: actual = enemy;
   7D3F 01 60 60      [10] 4224 	ld	bc,#_enemy
                           4225 ;src/main.c:796: while(i){
   7D42                    4226 00122$:
   7D42 DD 7E F9      [19] 4227 	ld	a,-7 (ix)
   7D45 B7            [ 4] 4228 	or	a, a
   7D46 CA 02 7E      [10] 4229 	jp	Z,00124$
                           4230 ;src/main.c:798: --i;
   7D49 DD 35 F9      [23] 4231 	dec	-7 (ix)
                           4232 ;src/main.c:799: if(actual->mover){
   7D4C 21 06 00      [10] 4233 	ld	hl,#0x0006
   7D4F 09            [11] 4234 	add	hl,bc
   7D50 DD 75 FD      [19] 4235 	ld	-3 (ix),l
   7D53 DD 74 FE      [19] 4236 	ld	-2 (ix),h
   7D56 DD 6E FD      [19] 4237 	ld	l,-3 (ix)
   7D59 DD 66 FE      [19] 4238 	ld	h,-2 (ix)
   7D5C 7E            [ 7] 4239 	ld	a,(hl)
   7D5D B7            [ 4] 4240 	or	a, a
   7D5E 28 18         [12] 4241 	jr	Z,00118$
                           4242 ;src/main.c:800: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7D60 69            [ 4] 4243 	ld	l, c
   7D61 60            [ 4] 4244 	ld	h, b
   7D62 23            [ 6] 4245 	inc	hl
   7D63 23            [ 6] 4246 	inc	hl
   7D64 23            [ 6] 4247 	inc	hl
   7D65 5E            [ 7] 4248 	ld	e,(hl)
   7D66 69            [ 4] 4249 	ld	l, c
   7D67 60            [ 4] 4250 	ld	h, b
   7D68 23            [ 6] 4251 	inc	hl
   7D69 23            [ 6] 4252 	inc	hl
   7D6A 56            [ 7] 4253 	ld	d,(hl)
   7D6B C5            [11] 4254 	push	bc
   7D6C C5            [11] 4255 	push	bc
   7D6D 7B            [ 4] 4256 	ld	a,e
   7D6E F5            [11] 4257 	push	af
   7D6F 33            [ 6] 4258 	inc	sp
   7D70 D5            [11] 4259 	push	de
   7D71 33            [ 6] 4260 	inc	sp
   7D72 CD F9 68      [17] 4261 	call	_redibujarEnemigo
   7D75 F1            [10] 4262 	pop	af
   7D76 F1            [10] 4263 	pop	af
   7D77 C1            [10] 4264 	pop	bc
   7D78                    4265 00118$:
                           4266 ;src/main.c:803: if (actual->muerto && actual->muertes == 0){
   7D78 C5            [11] 4267 	push	bc
   7D79 FD E1         [14] 4268 	pop	iy
   7D7B FD 7E 08      [19] 4269 	ld	a,8 (iy)
   7D7E B7            [ 4] 4270 	or	a, a
   7D7F 28 78         [12] 4271 	jr	Z,00120$
   7D81 21 0A 00      [10] 4272 	ld	hl,#0x000A
   7D84 09            [11] 4273 	add	hl,bc
   7D85 EB            [ 4] 4274 	ex	de,hl
   7D86 1A            [ 7] 4275 	ld	a,(de)
   7D87 B7            [ 4] 4276 	or	a, a
   7D88 20 6F         [12] 4277 	jr	NZ,00120$
                           4278 ;src/main.c:804: borrarEnemigo((*actual).x, (*actual).y);
   7D8A 21 01 00      [10] 4279 	ld	hl,#0x0001
   7D8D 09            [11] 4280 	add	hl,bc
   7D8E DD 75 FB      [19] 4281 	ld	-5 (ix),l
   7D91 DD 74 FC      [19] 4282 	ld	-4 (ix),h
   7D94 DD 6E FB      [19] 4283 	ld	l,-5 (ix)
   7D97 DD 66 FC      [19] 4284 	ld	h,-4 (ix)
   7D9A 7E            [ 7] 4285 	ld	a,(hl)
   7D9B F5            [11] 4286 	push	af
   7D9C 0A            [ 7] 4287 	ld	a,(bc)
   7D9D DD 77 FF      [19] 4288 	ld	-1 (ix),a
   7DA0 F1            [10] 4289 	pop	af
   7DA1 C5            [11] 4290 	push	bc
   7DA2 D5            [11] 4291 	push	de
   7DA3 F5            [11] 4292 	push	af
   7DA4 33            [ 6] 4293 	inc	sp
   7DA5 DD 7E FF      [19] 4294 	ld	a,-1 (ix)
   7DA8 F5            [11] 4295 	push	af
   7DA9 33            [ 6] 4296 	inc	sp
   7DAA CD 89 68      [17] 4297 	call	_borrarEnemigo
   7DAD F1            [10] 4298 	pop	af
   7DAE D1            [10] 4299 	pop	de
   7DAF C1            [10] 4300 	pop	bc
                           4301 ;src/main.c:805: dibujarExplosion(actual);
   7DB0 C5            [11] 4302 	push	bc
   7DB1 D5            [11] 4303 	push	de
   7DB2 C5            [11] 4304 	push	bc
   7DB3 CD D9 67      [17] 4305 	call	_dibujarExplosion
   7DB6 F1            [10] 4306 	pop	af
   7DB7 D1            [10] 4307 	pop	de
   7DB8 C1            [10] 4308 	pop	bc
                           4309 ;src/main.c:806: puntuacion_aux = puntuacion;
   7DB9 FD 21 C8 64   [14] 4310 	ld	iy,#_puntuacion
   7DBD FD 6E 00      [19] 4311 	ld	l,0 (iy)
   7DC0 26 00         [ 7] 4312 	ld	h,#0x00
                           4313 ;src/main.c:807: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7DC2 C5            [11] 4314 	push	bc
   7DC3 D5            [11] 4315 	push	de
   7DC4 E5            [11] 4316 	push	hl
   7DC5 CD 19 53      [17] 4317 	call	_aumentarPuntuacion
   7DC8 F1            [10] 4318 	pop	af
   7DC9 D1            [10] 4319 	pop	de
   7DCA C1            [10] 4320 	pop	bc
   7DCB FD 21 C8 64   [14] 4321 	ld	iy,#_puntuacion
   7DCF FD 75 00      [19] 4322 	ld	0 (iy),l
                           4323 ;src/main.c:808: modificarPuntuacion(puntuacion);
   7DD2 FD 21 C8 64   [14] 4324 	ld	iy,#_puntuacion
   7DD6 FD 6E 00      [19] 4325 	ld	l,0 (iy)
   7DD9 26 00         [ 7] 4326 	ld	h,#0x00
   7DDB C5            [11] 4327 	push	bc
   7DDC D5            [11] 4328 	push	de
   7DDD E5            [11] 4329 	push	hl
   7DDE CD DC 51      [17] 4330 	call	_modificarPuntuacion
   7DE1 F1            [10] 4331 	pop	af
   7DE2 D1            [10] 4332 	pop	de
   7DE3 C1            [10] 4333 	pop	bc
                           4334 ;src/main.c:809: actual->mover = NO;
   7DE4 DD 6E FD      [19] 4335 	ld	l,-3 (ix)
   7DE7 DD 66 FE      [19] 4336 	ld	h,-2 (ix)
   7DEA 36 00         [10] 4337 	ld	(hl),#0x00
                           4338 ;src/main.c:810: actual->muertes++;
   7DEC 1A            [ 7] 4339 	ld	a,(de)
   7DED 3C            [ 4] 4340 	inc	a
   7DEE 12            [ 7] 4341 	ld	(de),a
                           4342 ;src/main.c:811: actual->x = 0;
   7DEF AF            [ 4] 4343 	xor	a, a
   7DF0 02            [ 7] 4344 	ld	(bc),a
                           4345 ;src/main.c:812: actual->y = 0;
   7DF1 DD 6E FB      [19] 4346 	ld	l,-5 (ix)
   7DF4 DD 66 FC      [19] 4347 	ld	h,-4 (ix)
   7DF7 36 00         [10] 4348 	ld	(hl),#0x00
   7DF9                    4349 00120$:
                           4350 ;src/main.c:814: ++actual;
   7DF9 21 E2 00      [10] 4351 	ld	hl,#0x00E2
   7DFC 09            [11] 4352 	add	hl,bc
   7DFD 4D            [ 4] 4353 	ld	c,l
   7DFE 44            [ 4] 4354 	ld	b,h
   7DFF C3 42 7D      [10] 4355 	jp	00122$
   7E02                    4356 00124$:
                           4357 ;src/main.c:816: cpct_waitVSYNC();
   7E02 CD A7 56      [17] 4358 	call	_cpct_waitVSYNC
   7E05 C3 3A 7C      [10] 4359 	jp	00126$
                           4360 	.area _CODE
                           4361 	.area _INITIALIZER
   64CA                    4362 __xinit__mapa:
   64CA 00 00              4363 	.dw #0x0000
   64CC                    4364 __xinit__num_mapa:
   64CC 00                 4365 	.db #0x00	; 0
   64CD                    4366 __xinit__puntuacion:
   64CD 00                 4367 	.db #0x00	; 0
   64CE                    4368 __xinit__vidas:
   64CE 05                 4369 	.db #0x05	; 5
                           4370 	.area _CABS (ABS)
