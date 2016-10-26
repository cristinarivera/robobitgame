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
   65DA C2 C8 7A      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   65DD 21 00 02      [10]  382 	ld	hl,#0x0200
   65E0 CD 06 54      [17]  383 	call	_cpct_isKeyPressed
   65E3 7D            [ 4]  384 	ld	a,l
   65E4 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   65E5 C2 ED 7A      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   65E8 21 00 01      [10]  389 	ld	hl,#0x0100
   65EB CD 06 54      [17]  390 	call	_cpct_isKeyPressed
   65EE 7D            [ 4]  391 	ld	a,l
   65EF B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   65F0 C2 32 7B      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   65F3 21 00 04      [10]  396 	ld	hl,#0x0400
   65F6 CD 06 54      [17]  397 	call	_cpct_isKeyPressed
   65F9 7D            [ 4]  398 	ld	a,l
   65FA B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   65FB C2 56 7B      [10]  401 	jp	NZ,_moverAbajo
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
   6627 CD 6C 40      [17]  433 	call	_lanzarCuchillo
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
   68B0 DD 75 FE      [19]  894 	ld	-2 (ix),l
   68B3 DD 74 FF      [19]  895 	ld	-1 (ix),h
   68B6 DD 5E 05      [19]  896 	ld	e,5 (ix)
   68B9 16 00         [ 7]  897 	ld	d,#0x00
   68BB 7B            [ 4]  898 	ld	a,e
   68BC C6 E8         [ 7]  899 	add	a,#0xE8
   68BE DD 77 FC      [19]  900 	ld	-4 (ix),a
   68C1 7A            [ 4]  901 	ld	a,d
   68C2 CE FF         [ 7]  902 	adc	a,#0xFF
   68C4 DD 77 FD      [19]  903 	ld	-3 (ix),a
   68C7 E1            [10]  904 	pop	hl
   68C8 E5            [11]  905 	push	hl
   68C9 DD CB FD 7E   [20]  906 	bit	7, -3 (ix)
   68CD 28 04         [12]  907 	jr	Z,00105$
   68CF 21 EB FF      [10]  908 	ld	hl,#0xFFEB
   68D2 19            [11]  909 	add	hl,de
   68D3                     910 00105$:
   68D3 CB 2C         [ 8]  911 	sra	h
   68D5 CB 1D         [ 8]  912 	rr	l
   68D7 CB 2C         [ 8]  913 	sra	h
   68D9 CB 1D         [ 8]  914 	rr	l
   68DB 5D            [ 4]  915 	ld	e,l
   68DC DD 56 04      [19]  916 	ld	d,4 (ix)
   68DF CB 3A         [ 8]  917 	srl	d
   68E1 DD 6E FE      [19]  918 	ld	l,-2 (ix)
   68E4 DD 66 FF      [19]  919 	ld	h,-1 (ix)
   68E7 E5            [11]  920 	push	hl
   68E8 21 F0 C0      [10]  921 	ld	hl,#0xC0F0
   68EB E5            [11]  922 	push	hl
   68EC 3E 28         [ 7]  923 	ld	a,#0x28
   68EE F5            [11]  924 	push	af
   68EF 33            [ 6]  925 	inc	sp
   68F0 C5            [11]  926 	push	bc
   68F1 7B            [ 4]  927 	ld	a,e
   68F2 F5            [11]  928 	push	af
   68F3 33            [ 6]  929 	inc	sp
   68F4 D5            [11]  930 	push	de
   68F5 33            [ 6]  931 	inc	sp
   68F6 CD E7 54      [17]  932 	call	_cpct_etm_drawTileBox2x4
   68F9 DD F9         [10]  933 	ld	sp, ix
   68FB DD E1         [14]  934 	pop	ix
   68FD C9            [10]  935 	ret
                            936 ;src/main.c:223: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            937 ;	---------------------------------
                            938 ; Function redibujarEnemigo
                            939 ; ---------------------------------
   68FE                     940 _redibujarEnemigo::
   68FE DD E5         [15]  941 	push	ix
   6900 DD 21 00 00   [14]  942 	ld	ix,#0
   6904 DD 39         [15]  943 	add	ix,sp
                            944 ;src/main.c:224: borrarEnemigo(x, y);
   6906 DD 66 05      [19]  945 	ld	h,5 (ix)
   6909 DD 6E 04      [19]  946 	ld	l,4 (ix)
   690C E5            [11]  947 	push	hl
   690D CD 89 68      [17]  948 	call	_borrarEnemigo
   6910 F1            [10]  949 	pop	af
                            950 ;src/main.c:225: enemy->px = enemy->x;
   6911 DD 4E 06      [19]  951 	ld	c,6 (ix)
   6914 DD 46 07      [19]  952 	ld	b,7 (ix)
   6917 59            [ 4]  953 	ld	e, c
   6918 50            [ 4]  954 	ld	d, b
   6919 13            [ 6]  955 	inc	de
   691A 13            [ 6]  956 	inc	de
   691B 0A            [ 7]  957 	ld	a,(bc)
   691C 12            [ 7]  958 	ld	(de),a
                            959 ;src/main.c:226: enemy->py = enemy->y;
   691D 59            [ 4]  960 	ld	e, c
   691E 50            [ 4]  961 	ld	d, b
   691F 13            [ 6]  962 	inc	de
   6920 13            [ 6]  963 	inc	de
   6921 13            [ 6]  964 	inc	de
   6922 69            [ 4]  965 	ld	l, c
   6923 60            [ 4]  966 	ld	h, b
   6924 23            [ 6]  967 	inc	hl
   6925 7E            [ 7]  968 	ld	a,(hl)
   6926 12            [ 7]  969 	ld	(de),a
                            970 ;src/main.c:227: dibujarEnemigo(enemy);
   6927 C5            [11]  971 	push	bc
   6928 CD A1 67      [17]  972 	call	_dibujarEnemigo
   692B F1            [10]  973 	pop	af
   692C DD E1         [14]  974 	pop	ix
   692E C9            [10]  975 	ret
                            976 ;src/main.c:231: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            977 ;	---------------------------------
                            978 ; Function checkEnemyDead
                            979 ; ---------------------------------
   692F                     980 _checkEnemyDead::
   692F DD E5         [15]  981 	push	ix
   6931 DD 21 00 00   [14]  982 	ld	ix,#0
   6935 DD 39         [15]  983 	add	ix,sp
   6937 21 FA FF      [10]  984 	ld	hl,#-6
   693A 39            [11]  985 	add	hl,sp
   693B F9            [ 6]  986 	ld	sp,hl
                            987 ;src/main.c:233: switch (direction) {
   693C 3E 03         [ 7]  988 	ld	a,#0x03
   693E DD 96 04      [19]  989 	sub	a, 4 (ix)
   6941 DA 17 6B      [10]  990 	jp	C,00134$
                            991 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6944 DD 7E 05      [19]  992 	ld	a,5 (ix)
   6947 DD 77 FC      [19]  993 	ld	-4 (ix),a
   694A DD 7E 06      [19]  994 	ld	a,6 (ix)
   694D DD 77 FD      [19]  995 	ld	-3 (ix),a
   6950 DD 7E FC      [19]  996 	ld	a,-4 (ix)
   6953 C6 01         [ 7]  997 	add	a, #0x01
   6955 DD 77 FE      [19]  998 	ld	-2 (ix),a
   6958 DD 7E FD      [19]  999 	ld	a,-3 (ix)
   695B CE 00         [ 7] 1000 	adc	a, #0x00
   695D DD 77 FF      [19] 1001 	ld	-1 (ix),a
                           1002 ;src/main.c:238: enemy->muerto = SI;
   6960 DD 7E FC      [19] 1003 	ld	a,-4 (ix)
   6963 C6 08         [ 7] 1004 	add	a, #0x08
   6965 DD 77 FA      [19] 1005 	ld	-6 (ix),a
   6968 DD 7E FD      [19] 1006 	ld	a,-3 (ix)
   696B CE 00         [ 7] 1007 	adc	a, #0x00
   696D DD 77 FB      [19] 1008 	ld	-5 (ix),a
                           1009 ;src/main.c:233: switch (direction) {
   6970 DD 5E 04      [19] 1010 	ld	e,4 (ix)
   6973 16 00         [ 7] 1011 	ld	d,#0x00
   6975 21 7C 69      [10] 1012 	ld	hl,#00196$
   6978 19            [11] 1013 	add	hl,de
   6979 19            [11] 1014 	add	hl,de
   697A 19            [11] 1015 	add	hl,de
   697B E9            [ 4] 1016 	jp	(hl)
   697C                    1017 00196$:
   697C C3 F0 69      [10] 1018 	jp	00109$
   697F C3 88 69      [10] 1019 	jp	00101$
   6982 C3 B9 6A      [10] 1020 	jp	00125$
   6985 C3 58 6A      [10] 1021 	jp	00117$
                           1022 ;src/main.c:234: case 1:
   6988                    1023 00101$:
                           1024 ;src/main.c:235: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6988 21 F1 63      [10] 1025 	ld	hl, #_cu + 1
   698B 4E            [ 7] 1026 	ld	c,(hl)
   698C 06 00         [ 7] 1027 	ld	b,#0x00
   698E 21 04 00      [10] 1028 	ld	hl,#0x0004
   6991 09            [11] 1029 	add	hl,bc
   6992 5D            [ 4] 1030 	ld	e,l
   6993 7C            [ 4] 1031 	ld	a, h
   6994 B3            [ 4] 1032 	or	a, e
   6995 D6 01         [ 7] 1033 	sub	a,#0x01
   6997 3E 00         [ 7] 1034 	ld	a,#0x00
   6999 17            [ 4] 1035 	rla
   699A 5F            [ 4] 1036 	ld	e,a
   699B DD 6E FE      [19] 1037 	ld	l,-2 (ix)
   699E DD 66 FF      [19] 1038 	ld	h,-1 (ix)
   69A1 6E            [ 7] 1039 	ld	l,(hl)
   69A2 55            [ 4] 1040 	ld	d,l
   69A3 7B            [ 4] 1041 	ld	a,e
   69A4 92            [ 4] 1042 	sub	a, d
   69A5 E2 AA 69      [10] 1043 	jp	PO, 00197$
   69A8 EE 80         [ 7] 1044 	xor	a, #0x80
   69AA                    1045 00197$:
   69AA FA BF 69      [10] 1046 	jp	M,00106$
   69AD 26 00         [ 7] 1047 	ld	h,#0x00
   69AF 11 16 00      [10] 1048 	ld	de,#0x0016
   69B2 19            [11] 1049 	add	hl,de
   69B3 7D            [ 4] 1050 	ld	a,l
   69B4 91            [ 4] 1051 	sub	a, c
   69B5 7C            [ 4] 1052 	ld	a,h
   69B6 98            [ 4] 1053 	sbc	a, b
   69B7 E2 BC 69      [10] 1054 	jp	PO, 00198$
   69BA EE 80         [ 7] 1055 	xor	a, #0x80
   69BC                    1056 00198$:
   69BC F2 17 6B      [10] 1057 	jp	P,00134$
   69BF                    1058 00106$:
                           1059 ;src/main.c:236: if(cu.x > enemy->x){ //si el cu esta abajo
   69BF 21 F0 63      [10] 1060 	ld	hl, #_cu + 0
   69C2 4E            [ 7] 1061 	ld	c,(hl)
   69C3 DD 6E FC      [19] 1062 	ld	l,-4 (ix)
   69C6 DD 66 FD      [19] 1063 	ld	h,-3 (ix)
   69C9 5E            [ 7] 1064 	ld	e,(hl)
   69CA 7B            [ 4] 1065 	ld	a,e
   69CB 91            [ 4] 1066 	sub	a, c
   69CC D2 17 6B      [10] 1067 	jp	NC,00134$
                           1068 ;src/main.c:237: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   69CF 69            [ 4] 1069 	ld	l,c
   69D0 26 00         [ 7] 1070 	ld	h,#0x00
   69D2 16 00         [ 7] 1071 	ld	d,#0x00
   69D4 13            [ 6] 1072 	inc	de
   69D5 13            [ 6] 1073 	inc	de
   69D6 13            [ 6] 1074 	inc	de
   69D7 13            [ 6] 1075 	inc	de
   69D8 BF            [ 4] 1076 	cp	a, a
   69D9 ED 52         [15] 1077 	sbc	hl, de
   69DB 3E 01         [ 7] 1078 	ld	a,#0x01
   69DD BD            [ 4] 1079 	cp	a, l
   69DE 3E 00         [ 7] 1080 	ld	a,#0x00
   69E0 9C            [ 4] 1081 	sbc	a, h
   69E1 E2 E6 69      [10] 1082 	jp	PO, 00199$
   69E4 EE 80         [ 7] 1083 	xor	a, #0x80
   69E6                    1084 00199$:
   69E6 FA 17 6B      [10] 1085 	jp	M,00134$
                           1086 ;src/main.c:238: enemy->muerto = SI;
   69E9 E1            [10] 1087 	pop	hl
   69EA E5            [11] 1088 	push	hl
   69EB 36 01         [10] 1089 	ld	(hl),#0x01
                           1090 ;src/main.c:242: break;
   69ED C3 17 6B      [10] 1091 	jp	00134$
                           1092 ;src/main.c:243: case 0:
   69F0                    1093 00109$:
                           1094 ;src/main.c:244: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69F0 21 F1 63      [10] 1095 	ld	hl, #_cu + 1
   69F3 4E            [ 7] 1096 	ld	c,(hl)
   69F4 06 00         [ 7] 1097 	ld	b,#0x00
   69F6 21 04 00      [10] 1098 	ld	hl,#0x0004
   69F9 09            [11] 1099 	add	hl,bc
   69FA 5D            [ 4] 1100 	ld	e,l
   69FB 7C            [ 4] 1101 	ld	a, h
   69FC B3            [ 4] 1102 	or	a, e
   69FD D6 01         [ 7] 1103 	sub	a,#0x01
   69FF 3E 00         [ 7] 1104 	ld	a,#0x00
   6A01 17            [ 4] 1105 	rla
   6A02 5F            [ 4] 1106 	ld	e,a
   6A03 DD 6E FE      [19] 1107 	ld	l,-2 (ix)
   6A06 DD 66 FF      [19] 1108 	ld	h,-1 (ix)
   6A09 6E            [ 7] 1109 	ld	l,(hl)
   6A0A 55            [ 4] 1110 	ld	d,l
   6A0B 7B            [ 4] 1111 	ld	a,e
   6A0C 92            [ 4] 1112 	sub	a, d
   6A0D E2 12 6A      [10] 1113 	jp	PO, 00200$
   6A10 EE 80         [ 7] 1114 	xor	a, #0x80
   6A12                    1115 00200$:
   6A12 FA 27 6A      [10] 1116 	jp	M,00114$
   6A15 26 00         [ 7] 1117 	ld	h,#0x00
   6A17 11 16 00      [10] 1118 	ld	de,#0x0016
   6A1A 19            [11] 1119 	add	hl,de
   6A1B 7D            [ 4] 1120 	ld	a,l
   6A1C 91            [ 4] 1121 	sub	a, c
   6A1D 7C            [ 4] 1122 	ld	a,h
   6A1E 98            [ 4] 1123 	sbc	a, b
   6A1F E2 24 6A      [10] 1124 	jp	PO, 00201$
   6A22 EE 80         [ 7] 1125 	xor	a, #0x80
   6A24                    1126 00201$:
   6A24 F2 17 6B      [10] 1127 	jp	P,00134$
   6A27                    1128 00114$:
                           1129 ;src/main.c:245: if(enemy->x > cu.x){ //si el cu esta abajo
   6A27 DD 6E FC      [19] 1130 	ld	l,-4 (ix)
   6A2A DD 66 FD      [19] 1131 	ld	h,-3 (ix)
   6A2D 4E            [ 7] 1132 	ld	c,(hl)
   6A2E 21 F0 63      [10] 1133 	ld	hl, #_cu + 0
   6A31 5E            [ 7] 1134 	ld	e,(hl)
   6A32 7B            [ 4] 1135 	ld	a,e
   6A33 91            [ 4] 1136 	sub	a, c
   6A34 D2 17 6B      [10] 1137 	jp	NC,00134$
                           1138 ;src/main.c:246: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A37 69            [ 4] 1139 	ld	l,c
   6A38 26 00         [ 7] 1140 	ld	h,#0x00
   6A3A 16 00         [ 7] 1141 	ld	d,#0x00
   6A3C 13            [ 6] 1142 	inc	de
   6A3D 13            [ 6] 1143 	inc	de
   6A3E 13            [ 6] 1144 	inc	de
   6A3F 13            [ 6] 1145 	inc	de
   6A40 BF            [ 4] 1146 	cp	a, a
   6A41 ED 52         [15] 1147 	sbc	hl, de
   6A43 3E 01         [ 7] 1148 	ld	a,#0x01
   6A45 BD            [ 4] 1149 	cp	a, l
   6A46 3E 00         [ 7] 1150 	ld	a,#0x00
   6A48 9C            [ 4] 1151 	sbc	a, h
   6A49 E2 4E 6A      [10] 1152 	jp	PO, 00202$
   6A4C EE 80         [ 7] 1153 	xor	a, #0x80
   6A4E                    1154 00202$:
   6A4E FA 17 6B      [10] 1155 	jp	M,00134$
                           1156 ;src/main.c:247: enemy->muerto = SI;
   6A51 E1            [10] 1157 	pop	hl
   6A52 E5            [11] 1158 	push	hl
   6A53 36 01         [10] 1159 	ld	(hl),#0x01
                           1160 ;src/main.c:251: break;
   6A55 C3 17 6B      [10] 1161 	jp	00134$
                           1162 ;src/main.c:252: case 3:
   6A58                    1163 00117$:
                           1164 ;src/main.c:253: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6A58 21 F0 63      [10] 1165 	ld	hl, #_cu + 0
   6A5B 4E            [ 7] 1166 	ld	c,(hl)
   6A5C 06 00         [ 7] 1167 	ld	b,#0x00
   6A5E 59            [ 4] 1168 	ld	e, c
   6A5F 50            [ 4] 1169 	ld	d, b
   6A60 13            [ 6] 1170 	inc	de
   6A61 13            [ 6] 1171 	inc	de
   6A62 DD 6E FC      [19] 1172 	ld	l,-4 (ix)
   6A65 DD 66 FD      [19] 1173 	ld	h,-3 (ix)
   6A68 6E            [ 7] 1174 	ld	l,(hl)
   6A69 26 00         [ 7] 1175 	ld	h,#0x00
   6A6B 7B            [ 4] 1176 	ld	a,e
   6A6C 95            [ 4] 1177 	sub	a, l
   6A6D 7A            [ 4] 1178 	ld	a,d
   6A6E 9C            [ 4] 1179 	sbc	a, h
   6A6F E2 74 6A      [10] 1180 	jp	PO, 00203$
   6A72 EE 80         [ 7] 1181 	xor	a, #0x80
   6A74                    1182 00203$:
   6A74 FA 17 6B      [10] 1183 	jp	M,00134$
   6A77 11 04 00      [10] 1184 	ld	de,#0x0004
   6A7A 19            [11] 1185 	add	hl,de
   6A7B 7D            [ 4] 1186 	ld	a,l
   6A7C 91            [ 4] 1187 	sub	a, c
   6A7D 7C            [ 4] 1188 	ld	a,h
   6A7E 98            [ 4] 1189 	sbc	a, b
   6A7F E2 84 6A      [10] 1190 	jp	PO, 00204$
   6A82 EE 80         [ 7] 1191 	xor	a, #0x80
   6A84                    1192 00204$:
   6A84 FA 17 6B      [10] 1193 	jp	M,00134$
                           1194 ;src/main.c:254: if(enemy->y>cu.y){
   6A87 DD 6E FE      [19] 1195 	ld	l,-2 (ix)
   6A8A DD 66 FF      [19] 1196 	ld	h,-1 (ix)
   6A8D 4E            [ 7] 1197 	ld	c,(hl)
   6A8E 21 F1 63      [10] 1198 	ld	hl, #(_cu + 0x0001) + 0
   6A91 5E            [ 7] 1199 	ld	e,(hl)
   6A92 7B            [ 4] 1200 	ld	a,e
   6A93 91            [ 4] 1201 	sub	a, c
   6A94 D2 17 6B      [10] 1202 	jp	NC,00134$
                           1203 ;src/main.c:255: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6A97 06 00         [ 7] 1204 	ld	b,#0x00
   6A99 16 00         [ 7] 1205 	ld	d,#0x00
   6A9B 21 08 00      [10] 1206 	ld	hl,#0x0008
   6A9E 19            [11] 1207 	add	hl,de
   6A9F 79            [ 4] 1208 	ld	a,c
   6AA0 95            [ 4] 1209 	sub	a, l
   6AA1 4F            [ 4] 1210 	ld	c,a
   6AA2 78            [ 4] 1211 	ld	a,b
   6AA3 9C            [ 4] 1212 	sbc	a, h
   6AA4 47            [ 4] 1213 	ld	b,a
   6AA5 3E 02         [ 7] 1214 	ld	a,#0x02
   6AA7 B9            [ 4] 1215 	cp	a, c
   6AA8 3E 00         [ 7] 1216 	ld	a,#0x00
   6AAA 98            [ 4] 1217 	sbc	a, b
   6AAB E2 B0 6A      [10] 1218 	jp	PO, 00205$
   6AAE EE 80         [ 7] 1219 	xor	a, #0x80
   6AB0                    1220 00205$:
   6AB0 F2 17 6B      [10] 1221 	jp	P,00134$
                           1222 ;src/main.c:256: enemy->muerto = SI;
   6AB3 E1            [10] 1223 	pop	hl
   6AB4 E5            [11] 1224 	push	hl
   6AB5 36 01         [10] 1225 	ld	(hl),#0x01
                           1226 ;src/main.c:260: break;
   6AB7 18 5E         [12] 1227 	jr	00134$
                           1228 ;src/main.c:261: case 2:
   6AB9                    1229 00125$:
                           1230 ;src/main.c:262: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AB9 21 F0 63      [10] 1231 	ld	hl, #_cu + 0
   6ABC 4E            [ 7] 1232 	ld	c,(hl)
   6ABD 06 00         [ 7] 1233 	ld	b,#0x00
   6ABF 59            [ 4] 1234 	ld	e, c
   6AC0 50            [ 4] 1235 	ld	d, b
   6AC1 13            [ 6] 1236 	inc	de
   6AC2 13            [ 6] 1237 	inc	de
   6AC3 DD 6E FC      [19] 1238 	ld	l,-4 (ix)
   6AC6 DD 66 FD      [19] 1239 	ld	h,-3 (ix)
   6AC9 6E            [ 7] 1240 	ld	l,(hl)
   6ACA 26 00         [ 7] 1241 	ld	h,#0x00
   6ACC 7B            [ 4] 1242 	ld	a,e
   6ACD 95            [ 4] 1243 	sub	a, l
   6ACE 7A            [ 4] 1244 	ld	a,d
   6ACF 9C            [ 4] 1245 	sbc	a, h
   6AD0 E2 D5 6A      [10] 1246 	jp	PO, 00206$
   6AD3 EE 80         [ 7] 1247 	xor	a, #0x80
   6AD5                    1248 00206$:
   6AD5 FA 17 6B      [10] 1249 	jp	M,00134$
   6AD8 11 04 00      [10] 1250 	ld	de,#0x0004
   6ADB 19            [11] 1251 	add	hl,de
   6ADC 7D            [ 4] 1252 	ld	a,l
   6ADD 91            [ 4] 1253 	sub	a, c
   6ADE 7C            [ 4] 1254 	ld	a,h
   6ADF 98            [ 4] 1255 	sbc	a, b
   6AE0 E2 E5 6A      [10] 1256 	jp	PO, 00207$
   6AE3 EE 80         [ 7] 1257 	xor	a, #0x80
   6AE5                    1258 00207$:
   6AE5 FA 17 6B      [10] 1259 	jp	M,00134$
                           1260 ;src/main.c:263: if(cu.y > enemy->y){ //si el cu esta abajo
   6AE8 21 F1 63      [10] 1261 	ld	hl, #(_cu + 0x0001) + 0
   6AEB 4E            [ 7] 1262 	ld	c,(hl)
   6AEC DD 6E FE      [19] 1263 	ld	l,-2 (ix)
   6AEF DD 66 FF      [19] 1264 	ld	h,-1 (ix)
   6AF2 5E            [ 7] 1265 	ld	e,(hl)
   6AF3 7B            [ 4] 1266 	ld	a,e
   6AF4 91            [ 4] 1267 	sub	a, c
   6AF5 30 20         [12] 1268 	jr	NC,00134$
                           1269 ;src/main.c:264: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6AF7 06 00         [ 7] 1270 	ld	b,#0x00
   6AF9 16 00         [ 7] 1271 	ld	d,#0x00
   6AFB 21 16 00      [10] 1272 	ld	hl,#0x0016
   6AFE 19            [11] 1273 	add	hl,de
   6AFF 79            [ 4] 1274 	ld	a,c
   6B00 95            [ 4] 1275 	sub	a, l
   6B01 4F            [ 4] 1276 	ld	c,a
   6B02 78            [ 4] 1277 	ld	a,b
   6B03 9C            [ 4] 1278 	sbc	a, h
   6B04 47            [ 4] 1279 	ld	b,a
   6B05 3E 02         [ 7] 1280 	ld	a,#0x02
   6B07 B9            [ 4] 1281 	cp	a, c
   6B08 3E 00         [ 7] 1282 	ld	a,#0x00
   6B0A 98            [ 4] 1283 	sbc	a, b
   6B0B E2 10 6B      [10] 1284 	jp	PO, 00208$
   6B0E EE 80         [ 7] 1285 	xor	a, #0x80
   6B10                    1286 00208$:
   6B10 F2 17 6B      [10] 1287 	jp	P,00134$
                           1288 ;src/main.c:265: enemy->muerto = SI;
   6B13 E1            [10] 1289 	pop	hl
   6B14 E5            [11] 1290 	push	hl
   6B15 36 01         [10] 1291 	ld	(hl),#0x01
                           1292 ;src/main.c:271: }
   6B17                    1293 00134$:
   6B17 DD F9         [10] 1294 	ld	sp, ix
   6B19 DD E1         [14] 1295 	pop	ix
   6B1B C9            [10] 1296 	ret
                           1297 ;src/main.c:274: void moverEnemigoArriba(TEnemy *enemy){
                           1298 ;	---------------------------------
                           1299 ; Function moverEnemigoArriba
                           1300 ; ---------------------------------
   6B1C                    1301 _moverEnemigoArriba::
   6B1C DD E5         [15] 1302 	push	ix
   6B1E DD 21 00 00   [14] 1303 	ld	ix,#0
   6B22 DD 39         [15] 1304 	add	ix,sp
                           1305 ;src/main.c:275: enemy->y--;
   6B24 DD 4E 04      [19] 1306 	ld	c,4 (ix)
   6B27 DD 46 05      [19] 1307 	ld	b,5 (ix)
   6B2A 69            [ 4] 1308 	ld	l, c
   6B2B 60            [ 4] 1309 	ld	h, b
   6B2C 23            [ 6] 1310 	inc	hl
   6B2D 5E            [ 7] 1311 	ld	e,(hl)
   6B2E 1D            [ 4] 1312 	dec	e
   6B2F 73            [ 7] 1313 	ld	(hl),e
                           1314 ;src/main.c:276: enemy->y--;
   6B30 1D            [ 4] 1315 	dec	e
   6B31 73            [ 7] 1316 	ld	(hl),e
                           1317 ;src/main.c:277: enemy->mover = SI;
   6B32 21 06 00      [10] 1318 	ld	hl,#0x0006
   6B35 09            [11] 1319 	add	hl,bc
   6B36 36 01         [10] 1320 	ld	(hl),#0x01
   6B38 DD E1         [14] 1321 	pop	ix
   6B3A C9            [10] 1322 	ret
                           1323 ;src/main.c:280: void moverEnemigoAbajo(TEnemy *enemy){
                           1324 ;	---------------------------------
                           1325 ; Function moverEnemigoAbajo
                           1326 ; ---------------------------------
   6B3B                    1327 _moverEnemigoAbajo::
   6B3B DD E5         [15] 1328 	push	ix
   6B3D DD 21 00 00   [14] 1329 	ld	ix,#0
   6B41 DD 39         [15] 1330 	add	ix,sp
                           1331 ;src/main.c:281: enemy->y++;
   6B43 DD 4E 04      [19] 1332 	ld	c,4 (ix)
   6B46 DD 46 05      [19] 1333 	ld	b,5 (ix)
   6B49 59            [ 4] 1334 	ld	e, c
   6B4A 50            [ 4] 1335 	ld	d, b
   6B4B 13            [ 6] 1336 	inc	de
   6B4C 1A            [ 7] 1337 	ld	a,(de)
   6B4D 3C            [ 4] 1338 	inc	a
   6B4E 12            [ 7] 1339 	ld	(de),a
                           1340 ;src/main.c:282: enemy->y++;
   6B4F 3C            [ 4] 1341 	inc	a
   6B50 12            [ 7] 1342 	ld	(de),a
                           1343 ;src/main.c:283: enemy->mover = SI;
   6B51 21 06 00      [10] 1344 	ld	hl,#0x0006
   6B54 09            [11] 1345 	add	hl,bc
   6B55 36 01         [10] 1346 	ld	(hl),#0x01
   6B57 DD E1         [14] 1347 	pop	ix
   6B59 C9            [10] 1348 	ret
                           1349 ;src/main.c:286: void moverEnemigoDerecha(TEnemy *enemy){
                           1350 ;	---------------------------------
                           1351 ; Function moverEnemigoDerecha
                           1352 ; ---------------------------------
   6B5A                    1353 _moverEnemigoDerecha::
                           1354 ;src/main.c:287: enemy->x++;
   6B5A D1            [10] 1355 	pop	de
   6B5B C1            [10] 1356 	pop	bc
   6B5C C5            [11] 1357 	push	bc
   6B5D D5            [11] 1358 	push	de
   6B5E 0A            [ 7] 1359 	ld	a,(bc)
   6B5F 3C            [ 4] 1360 	inc	a
   6B60 02            [ 7] 1361 	ld	(bc),a
                           1362 ;src/main.c:288: enemy->x++;
   6B61 3C            [ 4] 1363 	inc	a
   6B62 02            [ 7] 1364 	ld	(bc),a
                           1365 ;src/main.c:289: enemy->mover = SI;
   6B63 21 06 00      [10] 1366 	ld	hl,#0x0006
   6B66 09            [11] 1367 	add	hl,bc
   6B67 36 01         [10] 1368 	ld	(hl),#0x01
   6B69 C9            [10] 1369 	ret
                           1370 ;src/main.c:292: void moverEnemigoIzquierda(TEnemy *enemy){
                           1371 ;	---------------------------------
                           1372 ; Function moverEnemigoIzquierda
                           1373 ; ---------------------------------
   6B6A                    1374 _moverEnemigoIzquierda::
                           1375 ;src/main.c:293: enemy->x--;
   6B6A D1            [10] 1376 	pop	de
   6B6B C1            [10] 1377 	pop	bc
   6B6C C5            [11] 1378 	push	bc
   6B6D D5            [11] 1379 	push	de
   6B6E 0A            [ 7] 1380 	ld	a,(bc)
   6B6F C6 FF         [ 7] 1381 	add	a,#0xFF
   6B71 02            [ 7] 1382 	ld	(bc),a
                           1383 ;src/main.c:294: enemy->x--;
   6B72 C6 FF         [ 7] 1384 	add	a,#0xFF
   6B74 02            [ 7] 1385 	ld	(bc),a
                           1386 ;src/main.c:295: enemy->mover = SI;
   6B75 21 06 00      [10] 1387 	ld	hl,#0x0006
   6B78 09            [11] 1388 	add	hl,bc
   6B79 36 01         [10] 1389 	ld	(hl),#0x01
   6B7B C9            [10] 1390 	ret
                           1391 ;src/main.c:298: void moverEnemigoPatrol(TEnemy* enemy){
                           1392 ;	---------------------------------
                           1393 ; Function moverEnemigoPatrol
                           1394 ; ---------------------------------
   6B7C                    1395 _moverEnemigoPatrol::
   6B7C DD E5         [15] 1396 	push	ix
   6B7E DD 21 00 00   [14] 1397 	ld	ix,#0
   6B82 DD 39         [15] 1398 	add	ix,sp
   6B84 21 F3 FF      [10] 1399 	ld	hl,#-13
   6B87 39            [11] 1400 	add	hl,sp
   6B88 F9            [ 6] 1401 	ld	sp,hl
                           1402 ;src/main.c:300: if(!enemy->muerto){
   6B89 DD 4E 04      [19] 1403 	ld	c,4 (ix)
   6B8C DD 46 05      [19] 1404 	ld	b,5 (ix)
   6B8F C5            [11] 1405 	push	bc
   6B90 FD E1         [14] 1406 	pop	iy
   6B92 FD 7E 08      [19] 1407 	ld	a,8 (iy)
   6B95 B7            [ 4] 1408 	or	a, a
   6B96 C2 C0 6D      [10] 1409 	jp	NZ,00118$
                           1410 ;src/main.c:301: if (!enemy->reversePatrol) {
   6B99 21 0C 00      [10] 1411 	ld	hl,#0x000C
   6B9C 09            [11] 1412 	add	hl,bc
   6B9D DD 75 FE      [19] 1413 	ld	-2 (ix),l
   6BA0 DD 74 FF      [19] 1414 	ld	-1 (ix),h
   6BA3 DD 6E FE      [19] 1415 	ld	l,-2 (ix)
   6BA6 DD 66 FF      [19] 1416 	ld	h,-1 (ix)
   6BA9 7E            [ 7] 1417 	ld	a,(hl)
   6BAA DD 77 FD      [19] 1418 	ld	-3 (ix),a
                           1419 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6BAD 21 0E 00      [10] 1420 	ld	hl,#0x000E
   6BB0 09            [11] 1421 	add	hl,bc
   6BB1 DD 75 FB      [19] 1422 	ld	-5 (ix),l
   6BB4 DD 74 FC      [19] 1423 	ld	-4 (ix),h
   6BB7 DD 6E FB      [19] 1424 	ld	l,-5 (ix)
   6BBA DD 66 FC      [19] 1425 	ld	h,-4 (ix)
   6BBD 5E            [ 7] 1426 	ld	e,(hl)
   6BBE 23            [ 6] 1427 	inc	hl
   6BBF 56            [ 7] 1428 	ld	d,(hl)
   6BC0 21 E1 00      [10] 1429 	ld	hl,#0x00E1
   6BC3 09            [11] 1430 	add	hl,bc
   6BC4 DD 75 F9      [19] 1431 	ld	-7 (ix),l
   6BC7 DD 74 FA      [19] 1432 	ld	-6 (ix),h
                           1433 ;src/main.c:304: enemy->mover = SI;
   6BCA 21 06 00      [10] 1434 	ld	hl,#0x0006
   6BCD 09            [11] 1435 	add	hl,bc
   6BCE DD 75 F7      [19] 1436 	ld	-9 (ix),l
   6BD1 DD 74 F8      [19] 1437 	ld	-8 (ix),h
                           1438 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6BD4 21 19 00      [10] 1439 	ld	hl,#0x0019
   6BD7 09            [11] 1440 	add	hl,bc
   6BD8 DD 75 F5      [19] 1441 	ld	-11 (ix),l
   6BDB DD 74 F6      [19] 1442 	ld	-10 (ix),h
                           1443 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6BDE 21 01 00      [10] 1444 	ld	hl,#0x0001
   6BE1 09            [11] 1445 	add	hl,bc
   6BE2 E3            [19] 1446 	ex	(sp), hl
                           1447 ;src/main.c:301: if (!enemy->reversePatrol) {
   6BE3 DD 7E FD      [19] 1448 	ld	a,-3 (ix)
   6BE6 B7            [ 4] 1449 	or	a, a
   6BE7 C2 BE 6C      [10] 1450 	jp	NZ,00114$
                           1451 ;src/main.c:302: if(enemy->iter < enemy->longitud_camino){
   6BEA DD 6E F9      [19] 1452 	ld	l,-7 (ix)
   6BED DD 66 FA      [19] 1453 	ld	h,-6 (ix)
   6BF0 6E            [ 7] 1454 	ld	l,(hl)
   6BF1 26 00         [ 7] 1455 	ld	h,#0x00
   6BF3 7B            [ 4] 1456 	ld	a,e
   6BF4 95            [ 4] 1457 	sub	a, l
   6BF5 7A            [ 4] 1458 	ld	a,d
   6BF6 9C            [ 4] 1459 	sbc	a, h
   6BF7 E2 FC 6B      [10] 1460 	jp	PO, 00144$
   6BFA EE 80         [ 7] 1461 	xor	a, #0x80
   6BFC                    1462 00144$:
   6BFC F2 99 6C      [10] 1463 	jp	P,00105$
                           1464 ;src/main.c:303: if(enemy->iter == 0){
   6BFF 7A            [ 4] 1465 	ld	a,d
   6C00 B3            [ 4] 1466 	or	a,e
   6C01 20 50         [12] 1467 	jr	NZ,00102$
                           1468 ;src/main.c:304: enemy->mover = SI;
   6C03 DD 6E F7      [19] 1469 	ld	l,-9 (ix)
   6C06 DD 66 F8      [19] 1470 	ld	h,-8 (ix)
   6C09 36 01         [10] 1471 	ld	(hl),#0x01
                           1472 ;src/main.c:305: enemy->iter = 2;
   6C0B DD 6E FB      [19] 1473 	ld	l,-5 (ix)
   6C0E DD 66 FC      [19] 1474 	ld	h,-4 (ix)
   6C11 36 02         [10] 1475 	ld	(hl),#0x02
   6C13 23            [ 6] 1476 	inc	hl
   6C14 36 00         [10] 1477 	ld	(hl),#0x00
                           1478 ;src/main.c:306: enemy->x = enemy->camino[enemy->iter];
   6C16 DD 6E FB      [19] 1479 	ld	l,-5 (ix)
   6C19 DD 66 FC      [19] 1480 	ld	h,-4 (ix)
   6C1C 5E            [ 7] 1481 	ld	e,(hl)
   6C1D 23            [ 6] 1482 	inc	hl
   6C1E 56            [ 7] 1483 	ld	d,(hl)
   6C1F DD 6E F5      [19] 1484 	ld	l,-11 (ix)
   6C22 DD 66 F6      [19] 1485 	ld	h,-10 (ix)
   6C25 19            [11] 1486 	add	hl,de
   6C26 7E            [ 7] 1487 	ld	a,(hl)
   6C27 02            [ 7] 1488 	ld	(bc),a
                           1489 ;src/main.c:307: ++enemy->iter;
   6C28 DD 6E FB      [19] 1490 	ld	l,-5 (ix)
   6C2B DD 66 FC      [19] 1491 	ld	h,-4 (ix)
   6C2E 4E            [ 7] 1492 	ld	c,(hl)
   6C2F 23            [ 6] 1493 	inc	hl
   6C30 46            [ 7] 1494 	ld	b,(hl)
   6C31 03            [ 6] 1495 	inc	bc
   6C32 DD 6E FB      [19] 1496 	ld	l,-5 (ix)
   6C35 DD 66 FC      [19] 1497 	ld	h,-4 (ix)
   6C38 71            [ 7] 1498 	ld	(hl),c
   6C39 23            [ 6] 1499 	inc	hl
   6C3A 70            [ 7] 1500 	ld	(hl),b
                           1501 ;src/main.c:308: enemy->y = enemy->camino[enemy->iter];
   6C3B DD 6E F5      [19] 1502 	ld	l,-11 (ix)
   6C3E DD 66 F6      [19] 1503 	ld	h,-10 (ix)
   6C41 09            [11] 1504 	add	hl,bc
   6C42 5E            [ 7] 1505 	ld	e,(hl)
   6C43 E1            [10] 1506 	pop	hl
   6C44 E5            [11] 1507 	push	hl
   6C45 73            [ 7] 1508 	ld	(hl),e
                           1509 ;src/main.c:309: ++enemy->iter;
   6C46 03            [ 6] 1510 	inc	bc
   6C47 DD 6E FB      [19] 1511 	ld	l,-5 (ix)
   6C4A DD 66 FC      [19] 1512 	ld	h,-4 (ix)
   6C4D 71            [ 7] 1513 	ld	(hl),c
   6C4E 23            [ 6] 1514 	inc	hl
   6C4F 70            [ 7] 1515 	ld	(hl),b
   6C50 C3 C0 6D      [10] 1516 	jp	00118$
   6C53                    1517 00102$:
                           1518 ;src/main.c:311: enemy->mover = SI;
   6C53 DD 6E F7      [19] 1519 	ld	l,-9 (ix)
   6C56 DD 66 F8      [19] 1520 	ld	h,-8 (ix)
   6C59 36 01         [10] 1521 	ld	(hl),#0x01
                           1522 ;src/main.c:312: enemy->x = enemy->camino[enemy->iter];
   6C5B DD 6E FB      [19] 1523 	ld	l,-5 (ix)
   6C5E DD 66 FC      [19] 1524 	ld	h,-4 (ix)
   6C61 5E            [ 7] 1525 	ld	e,(hl)
   6C62 23            [ 6] 1526 	inc	hl
   6C63 56            [ 7] 1527 	ld	d,(hl)
   6C64 DD 6E F5      [19] 1528 	ld	l,-11 (ix)
   6C67 DD 66 F6      [19] 1529 	ld	h,-10 (ix)
   6C6A 19            [11] 1530 	add	hl,de
   6C6B 7E            [ 7] 1531 	ld	a,(hl)
   6C6C 02            [ 7] 1532 	ld	(bc),a
                           1533 ;src/main.c:313: ++enemy->iter;
   6C6D DD 6E FB      [19] 1534 	ld	l,-5 (ix)
   6C70 DD 66 FC      [19] 1535 	ld	h,-4 (ix)
   6C73 5E            [ 7] 1536 	ld	e,(hl)
   6C74 23            [ 6] 1537 	inc	hl
   6C75 56            [ 7] 1538 	ld	d,(hl)
   6C76 13            [ 6] 1539 	inc	de
   6C77 DD 6E FB      [19] 1540 	ld	l,-5 (ix)
   6C7A DD 66 FC      [19] 1541 	ld	h,-4 (ix)
   6C7D 73            [ 7] 1542 	ld	(hl),e
   6C7E 23            [ 6] 1543 	inc	hl
   6C7F 72            [ 7] 1544 	ld	(hl),d
                           1545 ;src/main.c:314: enemy->y = enemy->camino[enemy->iter];
   6C80 DD 6E F5      [19] 1546 	ld	l,-11 (ix)
   6C83 DD 66 F6      [19] 1547 	ld	h,-10 (ix)
   6C86 19            [11] 1548 	add	hl,de
   6C87 7E            [ 7] 1549 	ld	a,(hl)
   6C88 E1            [10] 1550 	pop	hl
   6C89 E5            [11] 1551 	push	hl
   6C8A 77            [ 7] 1552 	ld	(hl),a
                           1553 ;src/main.c:315: ++enemy->iter;
   6C8B 13            [ 6] 1554 	inc	de
   6C8C 4B            [ 4] 1555 	ld	c,e
   6C8D DD 6E FB      [19] 1556 	ld	l,-5 (ix)
   6C90 DD 66 FC      [19] 1557 	ld	h,-4 (ix)
   6C93 71            [ 7] 1558 	ld	(hl),c
   6C94 23            [ 6] 1559 	inc	hl
   6C95 72            [ 7] 1560 	ld	(hl),d
   6C96 C3 C0 6D      [10] 1561 	jp	00118$
   6C99                    1562 00105$:
                           1563 ;src/main.c:319: enemy->mover = NO;
   6C99 DD 6E F7      [19] 1564 	ld	l,-9 (ix)
   6C9C DD 66 F8      [19] 1565 	ld	h,-8 (ix)
   6C9F 36 00         [10] 1566 	ld	(hl),#0x00
                           1567 ;src/main.c:320: enemy->iter = enemy->longitud_camino;
   6CA1 DD 6E F9      [19] 1568 	ld	l,-7 (ix)
   6CA4 DD 66 FA      [19] 1569 	ld	h,-6 (ix)
   6CA7 4E            [ 7] 1570 	ld	c,(hl)
   6CA8 06 00         [ 7] 1571 	ld	b,#0x00
   6CAA DD 6E FB      [19] 1572 	ld	l,-5 (ix)
   6CAD DD 66 FC      [19] 1573 	ld	h,-4 (ix)
   6CB0 71            [ 7] 1574 	ld	(hl),c
   6CB1 23            [ 6] 1575 	inc	hl
   6CB2 70            [ 7] 1576 	ld	(hl),b
                           1577 ;src/main.c:321: enemy->reversePatrol = 1;
   6CB3 DD 6E FE      [19] 1578 	ld	l,-2 (ix)
   6CB6 DD 66 FF      [19] 1579 	ld	h,-1 (ix)
   6CB9 36 01         [10] 1580 	ld	(hl),#0x01
   6CBB C3 C0 6D      [10] 1581 	jp	00118$
   6CBE                    1582 00114$:
                           1583 ;src/main.c:324: if(enemy->iter > 0){
   6CBE AF            [ 4] 1584 	xor	a, a
   6CBF BB            [ 4] 1585 	cp	a, e
   6CC0 9A            [ 4] 1586 	sbc	a, d
   6CC1 E2 C6 6C      [10] 1587 	jp	PO, 00145$
   6CC4 EE 80         [ 7] 1588 	xor	a, #0x80
   6CC6                    1589 00145$:
   6CC6 F2 A6 6D      [10] 1590 	jp	P,00111$
                           1591 ;src/main.c:325: if(enemy->iter == enemy->longitud_camino){
   6CC9 DD 6E F9      [19] 1592 	ld	l,-7 (ix)
   6CCC DD 66 FA      [19] 1593 	ld	h,-6 (ix)
   6CCF 6E            [ 7] 1594 	ld	l,(hl)
   6CD0 DD 75 F9      [19] 1595 	ld	-7 (ix),l
   6CD3 DD 36 FA 00   [19] 1596 	ld	-6 (ix),#0x00
   6CD7 7B            [ 4] 1597 	ld	a,e
   6CD8 DD 96 F9      [19] 1598 	sub	a, -7 (ix)
   6CDB C2 62 6D      [10] 1599 	jp	NZ,00108$
   6CDE 7A            [ 4] 1600 	ld	a,d
   6CDF DD 96 FA      [19] 1601 	sub	a, -6 (ix)
   6CE2 C2 62 6D      [10] 1602 	jp	NZ,00108$
                           1603 ;src/main.c:326: enemy->mover = SI;
   6CE5 DD 6E F7      [19] 1604 	ld	l,-9 (ix)
   6CE8 DD 66 F8      [19] 1605 	ld	h,-8 (ix)
   6CEB 36 01         [10] 1606 	ld	(hl),#0x01
                           1607 ;src/main.c:327: enemy->iter = enemy->iter - 1;
   6CED DD 6E FB      [19] 1608 	ld	l,-5 (ix)
   6CF0 DD 66 FC      [19] 1609 	ld	h,-4 (ix)
   6CF3 5E            [ 7] 1610 	ld	e,(hl)
   6CF4 23            [ 6] 1611 	inc	hl
   6CF5 56            [ 7] 1612 	ld	d,(hl)
   6CF6 7B            [ 4] 1613 	ld	a,e
   6CF7 C6 FF         [ 7] 1614 	add	a,#0xFF
   6CF9 DD 77 F9      [19] 1615 	ld	-7 (ix),a
   6CFC 7A            [ 4] 1616 	ld	a,d
   6CFD CE FF         [ 7] 1617 	adc	a,#0xFF
   6CFF DD 77 FA      [19] 1618 	ld	-6 (ix),a
   6D02 DD 6E FB      [19] 1619 	ld	l,-5 (ix)
   6D05 DD 66 FC      [19] 1620 	ld	h,-4 (ix)
   6D08 DD 7E F9      [19] 1621 	ld	a,-7 (ix)
   6D0B 77            [ 7] 1622 	ld	(hl),a
   6D0C 23            [ 6] 1623 	inc	hl
   6D0D DD 7E FA      [19] 1624 	ld	a,-6 (ix)
   6D10 77            [ 7] 1625 	ld	(hl),a
                           1626 ;src/main.c:328: enemy->iter = enemy->iter - 2;
   6D11 DD 5E F9      [19] 1627 	ld	e,-7 (ix)
   6D14 DD 56 FA      [19] 1628 	ld	d,-6 (ix)
   6D17 1B            [ 6] 1629 	dec	de
   6D18 1B            [ 6] 1630 	dec	de
   6D19 DD 6E FB      [19] 1631 	ld	l,-5 (ix)
   6D1C DD 66 FC      [19] 1632 	ld	h,-4 (ix)
   6D1F 73            [ 7] 1633 	ld	(hl),e
   6D20 23            [ 6] 1634 	inc	hl
   6D21 72            [ 7] 1635 	ld	(hl),d
                           1636 ;src/main.c:329: enemy->y = enemy->camino[enemy->iter];
   6D22 DD 6E F5      [19] 1637 	ld	l,-11 (ix)
   6D25 DD 66 F6      [19] 1638 	ld	h,-10 (ix)
   6D28 19            [11] 1639 	add	hl,de
   6D29 5E            [ 7] 1640 	ld	e,(hl)
   6D2A E1            [10] 1641 	pop	hl
   6D2B E5            [11] 1642 	push	hl
   6D2C 73            [ 7] 1643 	ld	(hl),e
                           1644 ;src/main.c:330: --enemy->iter;
   6D2D DD 7E F9      [19] 1645 	ld	a,-7 (ix)
   6D30 C6 FD         [ 7] 1646 	add	a,#0xFD
   6D32 5F            [ 4] 1647 	ld	e,a
   6D33 DD 7E FA      [19] 1648 	ld	a,-6 (ix)
   6D36 CE FF         [ 7] 1649 	adc	a,#0xFF
   6D38 57            [ 4] 1650 	ld	d,a
   6D39 DD 6E FB      [19] 1651 	ld	l,-5 (ix)
   6D3C DD 66 FC      [19] 1652 	ld	h,-4 (ix)
   6D3F 73            [ 7] 1653 	ld	(hl),e
   6D40 23            [ 6] 1654 	inc	hl
   6D41 72            [ 7] 1655 	ld	(hl),d
                           1656 ;src/main.c:331: enemy->x = enemy->camino[enemy->iter];
   6D42 DD 6E F5      [19] 1657 	ld	l,-11 (ix)
   6D45 DD 66 F6      [19] 1658 	ld	h,-10 (ix)
   6D48 19            [11] 1659 	add	hl,de
   6D49 7E            [ 7] 1660 	ld	a,(hl)
   6D4A 02            [ 7] 1661 	ld	(bc),a
                           1662 ;src/main.c:332: --enemy->iter;
   6D4B DD 7E F9      [19] 1663 	ld	a,-7 (ix)
   6D4E C6 FC         [ 7] 1664 	add	a,#0xFC
   6D50 4F            [ 4] 1665 	ld	c,a
   6D51 DD 7E FA      [19] 1666 	ld	a,-6 (ix)
   6D54 CE FF         [ 7] 1667 	adc	a,#0xFF
   6D56 47            [ 4] 1668 	ld	b,a
   6D57 DD 6E FB      [19] 1669 	ld	l,-5 (ix)
   6D5A DD 66 FC      [19] 1670 	ld	h,-4 (ix)
   6D5D 71            [ 7] 1671 	ld	(hl),c
   6D5E 23            [ 6] 1672 	inc	hl
   6D5F 70            [ 7] 1673 	ld	(hl),b
   6D60 18 5E         [12] 1674 	jr	00118$
   6D62                    1675 00108$:
                           1676 ;src/main.c:334: enemy->mover = SI;
   6D62 DD 6E F7      [19] 1677 	ld	l,-9 (ix)
   6D65 DD 66 F8      [19] 1678 	ld	h,-8 (ix)
   6D68 36 01         [10] 1679 	ld	(hl),#0x01
                           1680 ;src/main.c:335: enemy->y = enemy->camino[enemy->iter];
   6D6A DD 6E FB      [19] 1681 	ld	l,-5 (ix)
   6D6D DD 66 FC      [19] 1682 	ld	h,-4 (ix)
   6D70 5E            [ 7] 1683 	ld	e,(hl)
   6D71 23            [ 6] 1684 	inc	hl
   6D72 56            [ 7] 1685 	ld	d,(hl)
   6D73 DD 6E F5      [19] 1686 	ld	l,-11 (ix)
   6D76 DD 66 F6      [19] 1687 	ld	h,-10 (ix)
   6D79 19            [11] 1688 	add	hl,de
   6D7A 5E            [ 7] 1689 	ld	e,(hl)
   6D7B E1            [10] 1690 	pop	hl
   6D7C E5            [11] 1691 	push	hl
   6D7D 73            [ 7] 1692 	ld	(hl),e
                           1693 ;src/main.c:336: --enemy->iter;
   6D7E DD 6E FB      [19] 1694 	ld	l,-5 (ix)
   6D81 DD 66 FC      [19] 1695 	ld	h,-4 (ix)
   6D84 5E            [ 7] 1696 	ld	e,(hl)
   6D85 23            [ 6] 1697 	inc	hl
   6D86 56            [ 7] 1698 	ld	d,(hl)
   6D87 1B            [ 6] 1699 	dec	de
   6D88 DD 6E FB      [19] 1700 	ld	l,-5 (ix)
   6D8B DD 66 FC      [19] 1701 	ld	h,-4 (ix)
   6D8E 73            [ 7] 1702 	ld	(hl),e
   6D8F 23            [ 6] 1703 	inc	hl
   6D90 72            [ 7] 1704 	ld	(hl),d
                           1705 ;src/main.c:337: enemy->x = enemy->camino[enemy->iter];
   6D91 DD 6E F5      [19] 1706 	ld	l,-11 (ix)
   6D94 DD 66 F6      [19] 1707 	ld	h,-10 (ix)
   6D97 19            [11] 1708 	add	hl,de
   6D98 7E            [ 7] 1709 	ld	a,(hl)
   6D99 02            [ 7] 1710 	ld	(bc),a
                           1711 ;src/main.c:338: --enemy->iter;
   6D9A 1B            [ 6] 1712 	dec	de
   6D9B DD 6E FB      [19] 1713 	ld	l,-5 (ix)
   6D9E DD 66 FC      [19] 1714 	ld	h,-4 (ix)
   6DA1 73            [ 7] 1715 	ld	(hl),e
   6DA2 23            [ 6] 1716 	inc	hl
   6DA3 72            [ 7] 1717 	ld	(hl),d
   6DA4 18 1A         [12] 1718 	jr	00118$
   6DA6                    1719 00111$:
                           1720 ;src/main.c:342: enemy->mover = NO;
   6DA6 DD 6E F7      [19] 1721 	ld	l,-9 (ix)
   6DA9 DD 66 F8      [19] 1722 	ld	h,-8 (ix)
   6DAC 36 00         [10] 1723 	ld	(hl),#0x00
                           1724 ;src/main.c:343: enemy->iter = 0;
   6DAE DD 6E FB      [19] 1725 	ld	l,-5 (ix)
   6DB1 DD 66 FC      [19] 1726 	ld	h,-4 (ix)
   6DB4 AF            [ 4] 1727 	xor	a, a
   6DB5 77            [ 7] 1728 	ld	(hl), a
   6DB6 23            [ 6] 1729 	inc	hl
   6DB7 77            [ 7] 1730 	ld	(hl), a
                           1731 ;src/main.c:344: enemy->reversePatrol = 0;
   6DB8 DD 6E FE      [19] 1732 	ld	l,-2 (ix)
   6DBB DD 66 FF      [19] 1733 	ld	h,-1 (ix)
   6DBE 36 00         [10] 1734 	ld	(hl),#0x00
   6DC0                    1735 00118$:
   6DC0 DD F9         [10] 1736 	ld	sp, ix
   6DC2 DD E1         [14] 1737 	pop	ix
   6DC4 C9            [10] 1738 	ret
                           1739 ;src/main.c:350: void lookFor(TEnemy* enemy){
                           1740 ;	---------------------------------
                           1741 ; Function lookFor
                           1742 ; ---------------------------------
   6DC5                    1743 _lookFor::
   6DC5 DD E5         [15] 1744 	push	ix
   6DC7 DD 21 00 00   [14] 1745 	ld	ix,#0
   6DCB DD 39         [15] 1746 	add	ix,sp
   6DCD 21 F9 FF      [10] 1747 	ld	hl,#-7
   6DD0 39            [11] 1748 	add	hl,sp
   6DD1 F9            [ 6] 1749 	ld	sp,hl
                           1750 ;src/main.c:356: i16 difx = abs((i16)(enemy->x - prota.x));
   6DD2 DD 5E 04      [19] 1751 	ld	e,4 (ix)
   6DD5 DD 56 05      [19] 1752 	ld	d,5 (ix)
   6DD8 1A            [ 7] 1753 	ld	a,(de)
   6DD9 4F            [ 4] 1754 	ld	c,a
   6DDA 06 00         [ 7] 1755 	ld	b,#0x00
   6DDC 21 E8 63      [10] 1756 	ld	hl,#_prota+0
   6DDF 6E            [ 7] 1757 	ld	l,(hl)
   6DE0 26 00         [ 7] 1758 	ld	h,#0x00
   6DE2 79            [ 4] 1759 	ld	a,c
   6DE3 95            [ 4] 1760 	sub	a, l
   6DE4 4F            [ 4] 1761 	ld	c,a
   6DE5 78            [ 4] 1762 	ld	a,b
   6DE6 9C            [ 4] 1763 	sbc	a, h
   6DE7 47            [ 4] 1764 	ld	b,a
   6DE8 D5            [11] 1765 	push	de
   6DE9 C5            [11] 1766 	push	bc
   6DEA CD 60 4B      [17] 1767 	call	_abs
   6DED F1            [10] 1768 	pop	af
   6DEE D1            [10] 1769 	pop	de
   6DEF 33            [ 6] 1770 	inc	sp
   6DF0 33            [ 6] 1771 	inc	sp
   6DF1 E5            [11] 1772 	push	hl
                           1773 ;src/main.c:357: i16 dify = abs((i16)(enemy->y - prota.y));
   6DF2 21 01 00      [10] 1774 	ld	hl,#0x0001
   6DF5 19            [11] 1775 	add	hl,de
   6DF6 DD 75 FE      [19] 1776 	ld	-2 (ix),l
   6DF9 DD 74 FF      [19] 1777 	ld	-1 (ix),h
   6DFC DD 6E FE      [19] 1778 	ld	l,-2 (ix)
   6DFF DD 66 FF      [19] 1779 	ld	h,-1 (ix)
   6E02 4E            [ 7] 1780 	ld	c,(hl)
   6E03 06 00         [ 7] 1781 	ld	b,#0x00
   6E05 21 E9 63      [10] 1782 	ld	hl, #(_prota + 0x0001) + 0
   6E08 6E            [ 7] 1783 	ld	l,(hl)
   6E09 26 00         [ 7] 1784 	ld	h,#0x00
   6E0B 79            [ 4] 1785 	ld	a,c
   6E0C 95            [ 4] 1786 	sub	a, l
   6E0D 4F            [ 4] 1787 	ld	c,a
   6E0E 78            [ 4] 1788 	ld	a,b
   6E0F 9C            [ 4] 1789 	sbc	a, h
   6E10 47            [ 4] 1790 	ld	b,a
   6E11 D5            [11] 1791 	push	de
   6E12 C5            [11] 1792 	push	bc
   6E13 CD 60 4B      [17] 1793 	call	_abs
   6E16 F1            [10] 1794 	pop	af
   6E17 D1            [10] 1795 	pop	de
                           1796 ;src/main.c:359: dist = difx + dify; // manhattan
   6E18 DD 4E F9      [19] 1797 	ld	c,-7 (ix)
   6E1B 09            [11] 1798 	add	hl, bc
   6E1C DD 75 FB      [19] 1799 	ld	-5 (ix),l
                           1800 ;src/main.c:360: enemy->seen = NO;
   6E1F 21 12 00      [10] 1801 	ld	hl,#0x0012
   6E22 19            [11] 1802 	add	hl,de
   6E23 DD 75 FC      [19] 1803 	ld	-4 (ix),l
   6E26 DD 74 FD      [19] 1804 	ld	-3 (ix),h
   6E29 DD 6E FC      [19] 1805 	ld	l,-4 (ix)
   6E2C DD 66 FD      [19] 1806 	ld	h,-3 (ix)
   6E2F 36 00         [10] 1807 	ld	(hl),#0x00
                           1808 ;src/main.c:361: enemy->in_range = NO;
   6E31 21 11 00      [10] 1809 	ld	hl,#0x0011
   6E34 19            [11] 1810 	add	hl,de
   6E35 4D            [ 4] 1811 	ld	c,l
   6E36 44            [ 4] 1812 	ld	b,h
   6E37 AF            [ 4] 1813 	xor	a, a
   6E38 02            [ 7] 1814 	ld	(bc),a
                           1815 ;src/main.c:363: if(!enemy->seek){
   6E39 D5            [11] 1816 	push	de
   6E3A FD E1         [14] 1817 	pop	iy
   6E3C FD 7E 14      [19] 1818 	ld	a,20 (iy)
   6E3F B7            [ 4] 1819 	or	a, a
   6E40 C2 C6 6E      [10] 1820 	jp	NZ,00111$
                           1821 ;src/main.c:364: if (dist <= 10) {// te detectan los sensores de proximidad
   6E43 3E 0A         [ 7] 1822 	ld	a,#0x0A
   6E45 DD 96 FB      [19] 1823 	sub	a, -5 (ix)
   6E48 38 13         [12] 1824 	jr	C,00107$
                           1825 ;src/main.c:365: enemy->in_range = 1;
   6E4A 3E 01         [ 7] 1826 	ld	a,#0x01
   6E4C 02            [ 7] 1827 	ld	(bc),a
                           1828 ;src/main.c:366: enemy->engage = 1;
   6E4D 21 16 00      [10] 1829 	ld	hl,#0x0016
   6E50 19            [11] 1830 	add	hl,de
   6E51 36 01         [10] 1831 	ld	(hl),#0x01
                           1832 ;src/main.c:367: enemy->seen = SI;
   6E53 DD 6E FC      [19] 1833 	ld	l,-4 (ix)
   6E56 DD 66 FD      [19] 1834 	ld	h,-3 (ix)
   6E59 36 01         [10] 1835 	ld	(hl),#0x01
   6E5B 18 69         [12] 1836 	jr	00111$
   6E5D                    1837 00107$:
                           1838 ;src/main.c:368: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6E5D 21 E8 63      [10] 1839 	ld	hl, #_prota + 0
   6E60 4E            [ 7] 1840 	ld	c,(hl)
   6E61 1A            [ 7] 1841 	ld	a,(de)
   6E62 5F            [ 4] 1842 	ld	e,a
   6E63 16 00         [ 7] 1843 	ld	d,#0x00
   6E65 7B            [ 4] 1844 	ld	a,e
   6E66 C6 E7         [ 7] 1845 	add	a,#0xE7
   6E68 6F            [ 4] 1846 	ld	l,a
   6E69 7A            [ 4] 1847 	ld	a,d
   6E6A CE FF         [ 7] 1848 	adc	a,#0xFF
   6E6C 67            [ 4] 1849 	ld	h,a
   6E6D 06 00         [ 7] 1850 	ld	b,#0x00
   6E6F 7D            [ 4] 1851 	ld	a,l
   6E70 91            [ 4] 1852 	sub	a, c
   6E71 7C            [ 4] 1853 	ld	a,h
   6E72 98            [ 4] 1854 	sbc	a, b
   6E73 E2 78 6E      [10] 1855 	jp	PO, 00137$
   6E76 EE 80         [ 7] 1856 	xor	a, #0x80
   6E78                    1857 00137$:
   6E78 F2 C6 6E      [10] 1858 	jp	P,00111$
   6E7B 21 19 00      [10] 1859 	ld	hl,#0x0019
   6E7E 19            [11] 1860 	add	hl,de
   6E7F 79            [ 4] 1861 	ld	a,c
   6E80 95            [ 4] 1862 	sub	a, l
   6E81 78            [ 4] 1863 	ld	a,b
   6E82 9C            [ 4] 1864 	sbc	a, h
   6E83 E2 88 6E      [10] 1865 	jp	PO, 00138$
   6E86 EE 80         [ 7] 1866 	xor	a, #0x80
   6E88                    1867 00138$:
   6E88 F2 C6 6E      [10] 1868 	jp	P,00111$
                           1869 ;src/main.c:369: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6E8B 21 E9 63      [10] 1870 	ld	hl, #(_prota + 0x0001) + 0
   6E8E 4E            [ 7] 1871 	ld	c,(hl)
   6E8F DD 6E FE      [19] 1872 	ld	l,-2 (ix)
   6E92 DD 66 FF      [19] 1873 	ld	h,-1 (ix)
   6E95 5E            [ 7] 1874 	ld	e,(hl)
   6E96 16 00         [ 7] 1875 	ld	d,#0x00
   6E98 7B            [ 4] 1876 	ld	a,e
   6E99 C6 CC         [ 7] 1877 	add	a,#0xCC
   6E9B 6F            [ 4] 1878 	ld	l,a
   6E9C 7A            [ 4] 1879 	ld	a,d
   6E9D CE FF         [ 7] 1880 	adc	a,#0xFF
   6E9F 67            [ 4] 1881 	ld	h,a
   6EA0 06 00         [ 7] 1882 	ld	b,#0x00
   6EA2 7D            [ 4] 1883 	ld	a,l
   6EA3 91            [ 4] 1884 	sub	a, c
   6EA4 7C            [ 4] 1885 	ld	a,h
   6EA5 98            [ 4] 1886 	sbc	a, b
   6EA6 E2 AB 6E      [10] 1887 	jp	PO, 00139$
   6EA9 EE 80         [ 7] 1888 	xor	a, #0x80
   6EAB                    1889 00139$:
   6EAB F2 C6 6E      [10] 1890 	jp	P,00111$
   6EAE 21 34 00      [10] 1891 	ld	hl,#0x0034
   6EB1 19            [11] 1892 	add	hl,de
   6EB2 79            [ 4] 1893 	ld	a,c
   6EB3 95            [ 4] 1894 	sub	a, l
   6EB4 78            [ 4] 1895 	ld	a,b
   6EB5 9C            [ 4] 1896 	sbc	a, h
   6EB6 E2 BB 6E      [10] 1897 	jp	PO, 00140$
   6EB9 EE 80         [ 7] 1898 	xor	a, #0x80
   6EBB                    1899 00140$:
   6EBB F2 C6 6E      [10] 1900 	jp	P,00111$
                           1901 ;src/main.c:370: enemy->seen = SI;
   6EBE DD 6E FC      [19] 1902 	ld	l,-4 (ix)
   6EC1 DD 66 FD      [19] 1903 	ld	h,-3 (ix)
   6EC4 36 01         [10] 1904 	ld	(hl),#0x01
   6EC6                    1905 00111$:
   6EC6 DD F9         [10] 1906 	ld	sp, ix
   6EC8 DD E1         [14] 1907 	pop	ix
   6ECA C9            [10] 1908 	ret
                           1909 ;src/main.c:375: void moverEnemigoSeek(TEnemy* actual){
                           1910 ;	---------------------------------
                           1911 ; Function moverEnemigoSeek
                           1912 ; ---------------------------------
   6ECB                    1913 _moverEnemigoSeek::
   6ECB DD E5         [15] 1914 	push	ix
   6ECD DD 21 00 00   [14] 1915 	ld	ix,#0
   6ED1 DD 39         [15] 1916 	add	ix,sp
   6ED3 21 F6 FF      [10] 1917 	ld	hl,#-10
   6ED6 39            [11] 1918 	add	hl,sp
   6ED7 F9            [ 6] 1919 	ld	sp,hl
                           1920 ;src/main.c:377: if(!actual->muerto){
   6ED8 DD 4E 04      [19] 1921 	ld	c,4 (ix)
   6EDB DD 46 05      [19] 1922 	ld	b,5 (ix)
   6EDE C5            [11] 1923 	push	bc
   6EDF FD E1         [14] 1924 	pop	iy
   6EE1 FD 7E 08      [19] 1925 	ld	a, 8 (iy)
   6EE4 B7            [ 4] 1926 	or	a, a
   6EE5 C2 63 70      [10] 1927 	jp	NZ,00114$
                           1928 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6EE8 21 0E 00      [10] 1929 	ld	hl,#0x000E
   6EEB 09            [11] 1930 	add	hl,bc
   6EEC DD 75 FA      [19] 1931 	ld	-6 (ix),l
   6EEF DD 74 FB      [19] 1932 	ld	-5 (ix),h
   6EF2 DD 6E FA      [19] 1933 	ld	l,-6 (ix)
   6EF5 DD 66 FB      [19] 1934 	ld	h,-5 (ix)
   6EF8 7E            [ 7] 1935 	ld	a,(hl)
   6EF9 DD 77 F8      [19] 1936 	ld	-8 (ix),a
   6EFC 23            [ 6] 1937 	inc	hl
   6EFD 7E            [ 7] 1938 	ld	a,(hl)
   6EFE DD 77 F9      [19] 1939 	ld	-7 (ix),a
   6F01 69            [ 4] 1940 	ld	l, c
   6F02 60            [ 4] 1941 	ld	h, b
   6F03 11 E1 00      [10] 1942 	ld	de, #0x00E1
   6F06 19            [11] 1943 	add	hl, de
   6F07 5E            [ 7] 1944 	ld	e,(hl)
   6F08 16 00         [ 7] 1945 	ld	d,#0x00
                           1946 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F0A 21 01 00      [10] 1947 	ld	hl,#0x0001
   6F0D 09            [11] 1948 	add	hl,bc
   6F0E E3            [19] 1949 	ex	(sp), hl
                           1950 ;src/main.c:380: if(actual->iter < actual->longitud_camino){
   6F0F DD 7E F8      [19] 1951 	ld	a,-8 (ix)
   6F12 93            [ 4] 1952 	sub	a, e
   6F13 DD 7E F9      [19] 1953 	ld	a,-7 (ix)
   6F16 9A            [ 4] 1954 	sbc	a, d
   6F17 E2 1C 6F      [10] 1955 	jp	PO, 00136$
   6F1A EE 80         [ 7] 1956 	xor	a, #0x80
   6F1C                    1957 00136$:
   6F1C F2 A8 6F      [10] 1958 	jp	P,00110$
                           1959 ;src/main.c:385: actual->mover = SI;
   6F1F 21 06 00      [10] 1960 	ld	hl,#0x0006
   6F22 09            [11] 1961 	add	hl,bc
                           1962 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F23 79            [ 4] 1963 	ld	a,c
   6F24 C6 19         [ 7] 1964 	add	a, #0x19
   6F26 5F            [ 4] 1965 	ld	e,a
   6F27 78            [ 4] 1966 	ld	a,b
   6F28 CE 00         [ 7] 1967 	adc	a, #0x00
   6F2A 57            [ 4] 1968 	ld	d,a
                           1969 ;src/main.c:383: if(actual->iter == 0){
   6F2B DD 7E F9      [19] 1970 	ld	a,-7 (ix)
   6F2E DD B6 F8      [19] 1971 	or	a,-8 (ix)
   6F31 20 40         [12] 1972 	jr	NZ,00102$
                           1973 ;src/main.c:385: actual->mover = SI;
   6F33 36 01         [10] 1974 	ld	(hl),#0x01
                           1975 ;src/main.c:386: actual->iter = 2;
   6F35 DD 6E FA      [19] 1976 	ld	l,-6 (ix)
   6F38 DD 66 FB      [19] 1977 	ld	h,-5 (ix)
   6F3B 36 02         [10] 1978 	ld	(hl),#0x02
   6F3D 23            [ 6] 1979 	inc	hl
   6F3E 36 00         [10] 1980 	ld	(hl),#0x00
                           1981 ;src/main.c:387: actual->x = actual->camino[actual->iter];
   6F40 DD 6E FA      [19] 1982 	ld	l,-6 (ix)
   6F43 DD 66 FB      [19] 1983 	ld	h,-5 (ix)
   6F46 7E            [ 7] 1984 	ld	a, (hl)
   6F47 23            [ 6] 1985 	inc	hl
   6F48 66            [ 7] 1986 	ld	h,(hl)
   6F49 6F            [ 4] 1987 	ld	l,a
   6F4A 19            [11] 1988 	add	hl,de
   6F4B 7E            [ 7] 1989 	ld	a,(hl)
   6F4C 02            [ 7] 1990 	ld	(bc),a
                           1991 ;src/main.c:388: ++actual->iter;
   6F4D DD 6E FA      [19] 1992 	ld	l,-6 (ix)
   6F50 DD 66 FB      [19] 1993 	ld	h,-5 (ix)
   6F53 4E            [ 7] 1994 	ld	c,(hl)
   6F54 23            [ 6] 1995 	inc	hl
   6F55 46            [ 7] 1996 	ld	b,(hl)
   6F56 03            [ 6] 1997 	inc	bc
   6F57 DD 6E FA      [19] 1998 	ld	l,-6 (ix)
   6F5A DD 66 FB      [19] 1999 	ld	h,-5 (ix)
   6F5D 71            [ 7] 2000 	ld	(hl),c
   6F5E 23            [ 6] 2001 	inc	hl
   6F5F 70            [ 7] 2002 	ld	(hl),b
                           2003 ;src/main.c:389: actual->y = actual->camino[actual->iter];
   6F60 EB            [ 4] 2004 	ex	de,hl
   6F61 09            [11] 2005 	add	hl,bc
   6F62 5E            [ 7] 2006 	ld	e,(hl)
   6F63 E1            [10] 2007 	pop	hl
   6F64 E5            [11] 2008 	push	hl
   6F65 73            [ 7] 2009 	ld	(hl),e
                           2010 ;src/main.c:390: ++actual->iter;
   6F66 03            [ 6] 2011 	inc	bc
   6F67 DD 6E FA      [19] 2012 	ld	l,-6 (ix)
   6F6A DD 66 FB      [19] 2013 	ld	h,-5 (ix)
   6F6D 71            [ 7] 2014 	ld	(hl),c
   6F6E 23            [ 6] 2015 	inc	hl
   6F6F 70            [ 7] 2016 	ld	(hl),b
   6F70 C3 63 70      [10] 2017 	jp	00114$
   6F73                    2018 00102$:
                           2019 ;src/main.c:393: actual->mover = SI;
   6F73 36 01         [10] 2020 	ld	(hl),#0x01
                           2021 ;src/main.c:394: actual->x = actual->camino[actual->iter];
   6F75 DD 6E FA      [19] 2022 	ld	l,-6 (ix)
   6F78 DD 66 FB      [19] 2023 	ld	h,-5 (ix)
   6F7B 7E            [ 7] 2024 	ld	a, (hl)
   6F7C 23            [ 6] 2025 	inc	hl
   6F7D 66            [ 7] 2026 	ld	h,(hl)
   6F7E 6F            [ 4] 2027 	ld	l,a
   6F7F 19            [11] 2028 	add	hl,de
   6F80 7E            [ 7] 2029 	ld	a,(hl)
   6F81 02            [ 7] 2030 	ld	(bc),a
                           2031 ;src/main.c:395: ++actual->iter;
   6F82 DD 6E FA      [19] 2032 	ld	l,-6 (ix)
   6F85 DD 66 FB      [19] 2033 	ld	h,-5 (ix)
   6F88 4E            [ 7] 2034 	ld	c,(hl)
   6F89 23            [ 6] 2035 	inc	hl
   6F8A 46            [ 7] 2036 	ld	b,(hl)
   6F8B 03            [ 6] 2037 	inc	bc
   6F8C DD 6E FA      [19] 2038 	ld	l,-6 (ix)
   6F8F DD 66 FB      [19] 2039 	ld	h,-5 (ix)
   6F92 71            [ 7] 2040 	ld	(hl),c
   6F93 23            [ 6] 2041 	inc	hl
   6F94 70            [ 7] 2042 	ld	(hl),b
                           2043 ;src/main.c:396: actual->y = actual->camino[actual->iter];
   6F95 EB            [ 4] 2044 	ex	de,hl
   6F96 09            [11] 2045 	add	hl,bc
   6F97 5E            [ 7] 2046 	ld	e,(hl)
   6F98 E1            [10] 2047 	pop	hl
   6F99 E5            [11] 2048 	push	hl
   6F9A 73            [ 7] 2049 	ld	(hl),e
                           2050 ;src/main.c:397: ++actual->iter;
   6F9B 03            [ 6] 2051 	inc	bc
   6F9C DD 6E FA      [19] 2052 	ld	l,-6 (ix)
   6F9F DD 66 FB      [19] 2053 	ld	h,-5 (ix)
   6FA2 71            [ 7] 2054 	ld	(hl),c
   6FA3 23            [ 6] 2055 	inc	hl
   6FA4 70            [ 7] 2056 	ld	(hl),b
   6FA5 C3 63 70      [10] 2057 	jp	00114$
   6FA8                    2058 00110$:
                           2059 ;src/main.c:403: actual->seek = 0;
   6FA8 21 14 00      [10] 2060 	ld	hl,#0x0014
   6FAB 09            [11] 2061 	add	hl,bc
   6FAC DD 75 F8      [19] 2062 	ld	-8 (ix),l
   6FAF DD 74 F9      [19] 2063 	ld	-7 (ix),h
   6FB2 DD 6E F8      [19] 2064 	ld	l,-8 (ix)
   6FB5 DD 66 F9      [19] 2065 	ld	h,-7 (ix)
   6FB8 36 00         [10] 2066 	ld	(hl),#0x00
                           2067 ;src/main.c:404: lookFor(actual);
   6FBA C5            [11] 2068 	push	bc
   6FBB C5            [11] 2069 	push	bc
   6FBC CD C5 6D      [17] 2070 	call	_lookFor
   6FBF F1            [10] 2071 	pop	af
   6FC0 C1            [10] 2072 	pop	bc
                           2073 ;src/main.c:405: if(!actual->seen){
   6FC1 69            [ 4] 2074 	ld	l, c
   6FC2 60            [ 4] 2075 	ld	h, b
   6FC3 11 12 00      [10] 2076 	ld	de, #0x0012
   6FC6 19            [11] 2077 	add	hl, de
   6FC7 7E            [ 7] 2078 	ld	a,(hl)
   6FC8 DD 77 FF      [19] 2079 	ld	-1 (ix),a
                           2080 ;src/main.c:406: actual->patrolling = 1;
   6FCB 21 0B 00      [10] 2081 	ld	hl,#0x000B
   6FCE 09            [11] 2082 	add	hl,bc
   6FCF DD 75 FD      [19] 2083 	ld	-3 (ix),l
   6FD2 DD 74 FE      [19] 2084 	ld	-2 (ix),h
                           2085 ;src/main.c:405: if(!actual->seen){
   6FD5 DD 7E FF      [19] 2086 	ld	a,-1 (ix)
   6FD8 B7            [ 4] 2087 	or	a, a
   6FD9 20 38         [12] 2088 	jr	NZ,00107$
                           2089 ;src/main.c:406: actual->patrolling = 1;
   6FDB DD 6E FD      [19] 2090 	ld	l,-3 (ix)
   6FDE DD 66 FE      [19] 2091 	ld	h,-2 (ix)
   6FE1 36 01         [10] 2092 	ld	(hl),#0x01
                           2093 ;src/main.c:407: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6FE3 C5            [11] 2094 	push	bc
   6FE4 FD E1         [14] 2095 	pop	iy
   6FE6 FD 7E 18      [19] 2096 	ld	a,24 (iy)
   6FE9 DD 77 FF      [19] 2097 	ld	-1 (ix),a
   6FEC C5            [11] 2098 	push	bc
   6FED FD E1         [14] 2099 	pop	iy
   6FEF FD 56 17      [19] 2100 	ld	d,23 (iy)
   6FF2 E1            [10] 2101 	pop	hl
   6FF3 E5            [11] 2102 	push	hl
   6FF4 5E            [ 7] 2103 	ld	e,(hl)
   6FF5 0A            [ 7] 2104 	ld	a,(bc)
   6FF6 DD 77 FC      [19] 2105 	ld	-4 (ix),a
   6FF9 2A C5 64      [16] 2106 	ld	hl,(_mapa)
   6FFC E5            [11] 2107 	push	hl
   6FFD C5            [11] 2108 	push	bc
   6FFE DD 7E FF      [19] 2109 	ld	a,-1 (ix)
   7001 F5            [11] 2110 	push	af
   7002 33            [ 6] 2111 	inc	sp
   7003 D5            [11] 2112 	push	de
   7004 DD 7E FC      [19] 2113 	ld	a,-4 (ix)
   7007 F5            [11] 2114 	push	af
   7008 33            [ 6] 2115 	inc	sp
   7009 CD 72 49      [17] 2116 	call	_pathFinding
   700C 21 08 00      [10] 2117 	ld	hl,#8
   700F 39            [11] 2118 	add	hl,sp
   7010 F9            [ 6] 2119 	ld	sp,hl
   7011 18 46         [12] 2120 	jr	00108$
   7013                    2121 00107$:
                           2122 ;src/main.c:409: actual->patrolling = 0;
   7013 DD 6E FD      [19] 2123 	ld	l,-3 (ix)
   7016 DD 66 FE      [19] 2124 	ld	h,-2 (ix)
   7019 36 00         [10] 2125 	ld	(hl),#0x00
                           2126 ;src/main.c:410: if(!actual->engage){
   701B C5            [11] 2127 	push	bc
   701C FD E1         [14] 2128 	pop	iy
   701E FD 7E 16      [19] 2129 	ld	a,22 (iy)
   7021 B7            [ 4] 2130 	or	a, a
   7022 20 35         [12] 2131 	jr	NZ,00108$
                           2132 ;src/main.c:411: actual->seek = 1;
   7024 DD 6E F8      [19] 2133 	ld	l,-8 (ix)
   7027 DD 66 F9      [19] 2134 	ld	h,-7 (ix)
   702A 36 01         [10] 2135 	ld	(hl),#0x01
                           2136 ;src/main.c:412: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   702C 3A E9 63      [13] 2137 	ld	a,(#_prota + 1)
   702F DD 77 FC      [19] 2138 	ld	-4 (ix),a
   7032 21 E8 63      [10] 2139 	ld	hl, #_prota + 0
   7035 5E            [ 7] 2140 	ld	e,(hl)
   7036 E1            [10] 2141 	pop	hl
   7037 E5            [11] 2142 	push	hl
   7038 56            [ 7] 2143 	ld	d,(hl)
   7039 0A            [ 7] 2144 	ld	a,(bc)
   703A DD 77 FD      [19] 2145 	ld	-3 (ix),a
   703D 2A C5 64      [16] 2146 	ld	hl,(_mapa)
   7040 E5            [11] 2147 	push	hl
   7041 C5            [11] 2148 	push	bc
   7042 DD 7E FC      [19] 2149 	ld	a,-4 (ix)
   7045 F5            [11] 2150 	push	af
   7046 33            [ 6] 2151 	inc	sp
   7047 7B            [ 4] 2152 	ld	a,e
   7048 F5            [11] 2153 	push	af
   7049 33            [ 6] 2154 	inc	sp
   704A D5            [11] 2155 	push	de
   704B 33            [ 6] 2156 	inc	sp
   704C DD 7E FD      [19] 2157 	ld	a,-3 (ix)
   704F F5            [11] 2158 	push	af
   7050 33            [ 6] 2159 	inc	sp
   7051 CD 72 49      [17] 2160 	call	_pathFinding
   7054 21 08 00      [10] 2161 	ld	hl,#8
   7057 39            [11] 2162 	add	hl,sp
   7058 F9            [ 6] 2163 	ld	sp,hl
   7059                    2164 00108$:
                           2165 ;src/main.c:415: actual->iter = 0;
   7059 DD 6E FA      [19] 2166 	ld	l,-6 (ix)
   705C DD 66 FB      [19] 2167 	ld	h,-5 (ix)
   705F AF            [ 4] 2168 	xor	a, a
   7060 77            [ 7] 2169 	ld	(hl), a
   7061 23            [ 6] 2170 	inc	hl
   7062 77            [ 7] 2171 	ld	(hl), a
   7063                    2172 00114$:
   7063 DD F9         [10] 2173 	ld	sp, ix
   7065 DD E1         [14] 2174 	pop	ix
   7067 C9            [10] 2175 	ret
                           2176 ;src/main.c:422: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2177 ;	---------------------------------
                           2178 ; Function engage
                           2179 ; ---------------------------------
   7068                    2180 _engage::
   7068 DD E5         [15] 2181 	push	ix
   706A DD 21 00 00   [14] 2182 	ld	ix,#0
   706E DD 39         [15] 2183 	add	ix,sp
   7070 21 F1 FF      [10] 2184 	ld	hl,#-15
   7073 39            [11] 2185 	add	hl,sp
   7074 F9            [ 6] 2186 	ld	sp,hl
                           2187 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7075 DD 7E 04      [19] 2188 	ld	a,4 (ix)
   7078 DD 77 F4      [19] 2189 	ld	-12 (ix),a
   707B DD 7E 05      [19] 2190 	ld	a,5 (ix)
   707E DD 77 F5      [19] 2191 	ld	-11 (ix),a
   7081 DD 6E F4      [19] 2192 	ld	l,-12 (ix)
   7084 DD 66 F5      [19] 2193 	ld	h,-11 (ix)
   7087 4E            [ 7] 2194 	ld	c,(hl)
   7088 06 00         [ 7] 2195 	ld	b,#0x00
   708A 21 E8 63      [10] 2196 	ld	hl,#_prota+0
   708D 5E            [ 7] 2197 	ld	e,(hl)
   708E 16 00         [ 7] 2198 	ld	d,#0x00
   7090 79            [ 4] 2199 	ld	a,c
   7091 93            [ 4] 2200 	sub	a, e
   7092 4F            [ 4] 2201 	ld	c,a
   7093 78            [ 4] 2202 	ld	a,b
   7094 9A            [ 4] 2203 	sbc	a, d
   7095 47            [ 4] 2204 	ld	b,a
   7096 C5            [11] 2205 	push	bc
   7097 CD 60 4B      [17] 2206 	call	_abs
   709A F1            [10] 2207 	pop	af
   709B 4D            [ 4] 2208 	ld	c,l
                           2209 ;src/main.c:424: u8 dify = abs(enemy->y - prota.y);
   709C DD 7E F4      [19] 2210 	ld	a,-12 (ix)
   709F C6 01         [ 7] 2211 	add	a, #0x01
   70A1 DD 77 F6      [19] 2212 	ld	-10 (ix),a
   70A4 DD 7E F5      [19] 2213 	ld	a,-11 (ix)
   70A7 CE 00         [ 7] 2214 	adc	a, #0x00
   70A9 DD 77 F7      [19] 2215 	ld	-9 (ix),a
   70AC DD 6E F6      [19] 2216 	ld	l,-10 (ix)
   70AF DD 66 F7      [19] 2217 	ld	h,-9 (ix)
   70B2 5E            [ 7] 2218 	ld	e,(hl)
   70B3 16 00         [ 7] 2219 	ld	d,#0x00
   70B5 21 E9 63      [10] 2220 	ld	hl, #_prota + 1
   70B8 6E            [ 7] 2221 	ld	l,(hl)
   70B9 26 00         [ 7] 2222 	ld	h,#0x00
   70BB 7B            [ 4] 2223 	ld	a,e
   70BC 95            [ 4] 2224 	sub	a, l
   70BD 5F            [ 4] 2225 	ld	e,a
   70BE 7A            [ 4] 2226 	ld	a,d
   70BF 9C            [ 4] 2227 	sbc	a, h
   70C0 57            [ 4] 2228 	ld	d,a
   70C1 C5            [11] 2229 	push	bc
   70C2 D5            [11] 2230 	push	de
   70C3 CD 60 4B      [17] 2231 	call	_abs
   70C6 F1            [10] 2232 	pop	af
   70C7 C1            [10] 2233 	pop	bc
                           2234 ;src/main.c:425: u8 dist = difx + dify; // manhattan
   70C8 09            [11] 2235 	add	hl, bc
   70C9 DD 75 F2      [19] 2236 	ld	-14 (ix),l
                           2237 ;src/main.c:427: u8 movX = 0;
   70CC DD 36 F1 00   [19] 2238 	ld	-15 (ix),#0x00
                           2239 ;src/main.c:428: u8 movY = 0;
   70D0 DD 36 F3 00   [19] 2240 	ld	-13 (ix),#0x00
                           2241 ;src/main.c:429: u8 distConstraint = 25;
   70D4 0E 19         [ 7] 2242 	ld	c,#0x19
                           2243 ;src/main.c:430: enemy->mover = NO;
   70D6 DD 7E F4      [19] 2244 	ld	a,-12 (ix)
   70D9 C6 06         [ 7] 2245 	add	a, #0x06
   70DB DD 77 F8      [19] 2246 	ld	-8 (ix),a
   70DE DD 7E F5      [19] 2247 	ld	a,-11 (ix)
   70E1 CE 00         [ 7] 2248 	adc	a, #0x00
   70E3 DD 77 F9      [19] 2249 	ld	-7 (ix),a
   70E6 DD 6E F8      [19] 2250 	ld	l,-8 (ix)
   70E9 DD 66 F9      [19] 2251 	ld	h,-7 (ix)
   70EC 36 00         [10] 2252 	ld	(hl),#0x00
                           2253 ;src/main.c:432: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   70EE DD 6E F6      [19] 2254 	ld	l,-10 (ix)
   70F1 DD 66 F7      [19] 2255 	ld	h,-9 (ix)
   70F4 7E            [ 7] 2256 	ld	a,(hl)
   70F5 DD 77 FA      [19] 2257 	ld	-6 (ix),a
                           2258 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   70F8 DD 6E F4      [19] 2259 	ld	l,-12 (ix)
   70FB DD 66 F5      [19] 2260 	ld	h,-11 (ix)
   70FE 46            [ 7] 2261 	ld	b,(hl)
                           2262 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   70FF 78            [ 4] 2263 	ld	a,b
   7100 C6 04         [ 7] 2264 	add	a, #0x04
   7102 DD 77 FB      [19] 2265 	ld	-5 (ix),a
                           2266 ;src/main.c:432: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7105 DD 7E 07      [19] 2267 	ld	a,7 (ix)
   7108 DD 96 FA      [19] 2268 	sub	a, -6 (ix)
   710B 28 38         [12] 2269 	jr	Z,00194$
   710D DD 5E 07      [19] 2270 	ld	e,7 (ix)
   7110 16 00         [ 7] 2271 	ld	d,#0x00
   7112 21 01 00      [10] 2272 	ld	hl,#0x0001
   7115 19            [11] 2273 	add	hl,de
   7116 DD 75 FC      [19] 2274 	ld	-4 (ix),l
   7119 DD 74 FD      [19] 2275 	ld	-3 (ix),h
   711C DD 7E FA      [19] 2276 	ld	a,-6 (ix)
   711F DD 77 FE      [19] 2277 	ld	-2 (ix),a
   7122 DD 36 FF 00   [19] 2278 	ld	-1 (ix),#0x00
   7126 DD 7E FE      [19] 2279 	ld	a,-2 (ix)
   7129 DD 96 FC      [19] 2280 	sub	a, -4 (ix)
   712C 20 08         [12] 2281 	jr	NZ,00422$
   712E DD 7E FF      [19] 2282 	ld	a,-1 (ix)
   7131 DD 96 FD      [19] 2283 	sub	a, -3 (ix)
   7134 28 0F         [12] 2284 	jr	Z,00194$
   7136                    2285 00422$:
   7136 1B            [ 6] 2286 	dec	de
   7137 DD 7E FE      [19] 2287 	ld	a,-2 (ix)
   713A 93            [ 4] 2288 	sub	a, e
   713B C2 4E 72      [10] 2289 	jp	NZ,00195$
   713E DD 7E FF      [19] 2290 	ld	a,-1 (ix)
   7141 92            [ 4] 2291 	sub	a, d
   7142 C2 4E 72      [10] 2292 	jp	NZ,00195$
   7145                    2293 00194$:
                           2294 ;src/main.c:433: if (dx < enemy->x) { // izquierda
   7145 DD 7E 06      [19] 2295 	ld	a,6 (ix)
   7148 90            [ 4] 2296 	sub	a, b
   7149 D2 CB 71      [10] 2297 	jp	NC,00114$
                           2298 ;src/main.c:434: if (dist > 11) {
   714C 3E 0B         [ 7] 2299 	ld	a,#0x0B
   714E DD 96 F2      [19] 2300 	sub	a, -14 (ix)
   7151 D2 0E 78      [10] 2301 	jp	NC,00199$
                           2302 ;src/main.c:435: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7154 DD 7E FA      [19] 2303 	ld	a,-6 (ix)
   7157 F5            [11] 2304 	push	af
   7158 33            [ 6] 2305 	inc	sp
   7159 C5            [11] 2306 	push	bc
   715A 33            [ 6] 2307 	inc	sp
   715B 2A C5 64      [16] 2308 	ld	hl,(_mapa)
   715E E5            [11] 2309 	push	hl
   715F CD 1C 4B      [17] 2310 	call	_getTilePtr
   7162 F1            [10] 2311 	pop	af
   7163 F1            [10] 2312 	pop	af
   7164 4E            [ 7] 2313 	ld	c,(hl)
   7165 3E 02         [ 7] 2314 	ld	a,#0x02
   7167 91            [ 4] 2315 	sub	a, c
   7168 DA 0E 78      [10] 2316 	jp	C,00199$
                           2317 ;src/main.c:436: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   716B DD 6E F6      [19] 2318 	ld	l,-10 (ix)
   716E DD 66 F7      [19] 2319 	ld	h,-9 (ix)
   7171 7E            [ 7] 2320 	ld	a,(hl)
   7172 C6 0B         [ 7] 2321 	add	a, #0x0B
   7174 57            [ 4] 2322 	ld	d,a
   7175 DD 6E F4      [19] 2323 	ld	l,-12 (ix)
   7178 DD 66 F5      [19] 2324 	ld	h,-11 (ix)
   717B 46            [ 7] 2325 	ld	b,(hl)
   717C D5            [11] 2326 	push	de
   717D 33            [ 6] 2327 	inc	sp
   717E C5            [11] 2328 	push	bc
   717F 33            [ 6] 2329 	inc	sp
   7180 2A C5 64      [16] 2330 	ld	hl,(_mapa)
   7183 E5            [11] 2331 	push	hl
   7184 CD 1C 4B      [17] 2332 	call	_getTilePtr
   7187 F1            [10] 2333 	pop	af
   7188 F1            [10] 2334 	pop	af
   7189 4E            [ 7] 2335 	ld	c,(hl)
   718A 3E 02         [ 7] 2336 	ld	a,#0x02
   718C 91            [ 4] 2337 	sub	a, c
   718D DA 0E 78      [10] 2338 	jp	C,00199$
                           2339 ;src/main.c:437: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7190 DD 6E F6      [19] 2340 	ld	l,-10 (ix)
   7193 DD 66 F7      [19] 2341 	ld	h,-9 (ix)
   7196 7E            [ 7] 2342 	ld	a,(hl)
   7197 C6 16         [ 7] 2343 	add	a, #0x16
   7199 57            [ 4] 2344 	ld	d,a
   719A DD 6E F4      [19] 2345 	ld	l,-12 (ix)
   719D DD 66 F5      [19] 2346 	ld	h,-11 (ix)
   71A0 46            [ 7] 2347 	ld	b,(hl)
   71A1 D5            [11] 2348 	push	de
   71A2 33            [ 6] 2349 	inc	sp
   71A3 C5            [11] 2350 	push	bc
   71A4 33            [ 6] 2351 	inc	sp
   71A5 2A C5 64      [16] 2352 	ld	hl,(_mapa)
   71A8 E5            [11] 2353 	push	hl
   71A9 CD 1C 4B      [17] 2354 	call	_getTilePtr
   71AC F1            [10] 2355 	pop	af
   71AD F1            [10] 2356 	pop	af
   71AE 4E            [ 7] 2357 	ld	c,(hl)
   71AF 3E 02         [ 7] 2358 	ld	a,#0x02
   71B1 91            [ 4] 2359 	sub	a, c
   71B2 DA 0E 78      [10] 2360 	jp	C,00199$
                           2361 ;src/main.c:438: moverEnemigoIzquierda(enemy);
   71B5 DD 6E F4      [19] 2362 	ld	l,-12 (ix)
   71B8 DD 66 F5      [19] 2363 	ld	h,-11 (ix)
   71BB E5            [11] 2364 	push	hl
   71BC CD 6A 6B      [17] 2365 	call	_moverEnemigoIzquierda
   71BF F1            [10] 2366 	pop	af
                           2367 ;src/main.c:440: enemy->mover = SI;
   71C0 DD 6E F8      [19] 2368 	ld	l,-8 (ix)
   71C3 DD 66 F9      [19] 2369 	ld	h,-7 (ix)
   71C6 36 01         [10] 2370 	ld	(hl),#0x01
   71C8 C3 0E 78      [10] 2371 	jp	00199$
   71CB                    2372 00114$:
                           2373 ;src/main.c:444: if (dist > G_ENEMY_W + 3) {
   71CB 3E 07         [ 7] 2374 	ld	a,#0x07
   71CD DD 96 F2      [19] 2375 	sub	a, -14 (ix)
   71D0 D2 0E 78      [10] 2376 	jp	NC,00199$
                           2377 ;src/main.c:445: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   71D3 DD 66 FA      [19] 2378 	ld	h,-6 (ix)
   71D6 DD 6E FB      [19] 2379 	ld	l,-5 (ix)
   71D9 E5            [11] 2380 	push	hl
   71DA 2A C5 64      [16] 2381 	ld	hl,(_mapa)
   71DD E5            [11] 2382 	push	hl
   71DE CD 1C 4B      [17] 2383 	call	_getTilePtr
   71E1 F1            [10] 2384 	pop	af
   71E2 F1            [10] 2385 	pop	af
   71E3 4E            [ 7] 2386 	ld	c,(hl)
   71E4 3E 02         [ 7] 2387 	ld	a,#0x02
   71E6 91            [ 4] 2388 	sub	a, c
   71E7 DA 0E 78      [10] 2389 	jp	C,00199$
                           2390 ;src/main.c:446: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   71EA DD 6E F6      [19] 2391 	ld	l,-10 (ix)
   71ED DD 66 F7      [19] 2392 	ld	h,-9 (ix)
   71F0 7E            [ 7] 2393 	ld	a,(hl)
   71F1 C6 0B         [ 7] 2394 	add	a, #0x0B
   71F3 47            [ 4] 2395 	ld	b,a
   71F4 DD 6E F4      [19] 2396 	ld	l,-12 (ix)
   71F7 DD 66 F5      [19] 2397 	ld	h,-11 (ix)
   71FA 7E            [ 7] 2398 	ld	a,(hl)
   71FB C6 04         [ 7] 2399 	add	a, #0x04
   71FD C5            [11] 2400 	push	bc
   71FE 33            [ 6] 2401 	inc	sp
   71FF F5            [11] 2402 	push	af
   7200 33            [ 6] 2403 	inc	sp
   7201 2A C5 64      [16] 2404 	ld	hl,(_mapa)
   7204 E5            [11] 2405 	push	hl
   7205 CD 1C 4B      [17] 2406 	call	_getTilePtr
   7208 F1            [10] 2407 	pop	af
   7209 F1            [10] 2408 	pop	af
   720A 4E            [ 7] 2409 	ld	c,(hl)
   720B 3E 02         [ 7] 2410 	ld	a,#0x02
   720D 91            [ 4] 2411 	sub	a, c
   720E DA 0E 78      [10] 2412 	jp	C,00199$
                           2413 ;src/main.c:447: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7211 DD 6E F6      [19] 2414 	ld	l,-10 (ix)
   7214 DD 66 F7      [19] 2415 	ld	h,-9 (ix)
   7217 7E            [ 7] 2416 	ld	a,(hl)
   7218 C6 16         [ 7] 2417 	add	a, #0x16
   721A 47            [ 4] 2418 	ld	b,a
   721B DD 6E F4      [19] 2419 	ld	l,-12 (ix)
   721E DD 66 F5      [19] 2420 	ld	h,-11 (ix)
   7221 7E            [ 7] 2421 	ld	a,(hl)
   7222 C6 04         [ 7] 2422 	add	a, #0x04
   7224 C5            [11] 2423 	push	bc
   7225 33            [ 6] 2424 	inc	sp
   7226 F5            [11] 2425 	push	af
   7227 33            [ 6] 2426 	inc	sp
   7228 2A C5 64      [16] 2427 	ld	hl,(_mapa)
   722B E5            [11] 2428 	push	hl
   722C CD 1C 4B      [17] 2429 	call	_getTilePtr
   722F F1            [10] 2430 	pop	af
   7230 F1            [10] 2431 	pop	af
   7231 4E            [ 7] 2432 	ld	c,(hl)
   7232 3E 02         [ 7] 2433 	ld	a,#0x02
   7234 91            [ 4] 2434 	sub	a, c
   7235 DA 0E 78      [10] 2435 	jp	C,00199$
                           2436 ;src/main.c:448: moverEnemigoDerecha(enemy);
   7238 DD 6E F4      [19] 2437 	ld	l,-12 (ix)
   723B DD 66 F5      [19] 2438 	ld	h,-11 (ix)
   723E E5            [11] 2439 	push	hl
   723F CD 5A 6B      [17] 2440 	call	_moverEnemigoDerecha
   7242 F1            [10] 2441 	pop	af
                           2442 ;src/main.c:450: enemy->mover = SI;
   7243 DD 6E F8      [19] 2443 	ld	l,-8 (ix)
   7246 DD 66 F9      [19] 2444 	ld	h,-7 (ix)
   7249 36 01         [10] 2445 	ld	(hl),#0x01
   724B C3 0E 78      [10] 2446 	jp	00199$
   724E                    2447 00195$:
                           2448 ;src/main.c:455: else if (enemy->x == dx) {
   724E DD 7E 06      [19] 2449 	ld	a,6 (ix)
   7251 90            [ 4] 2450 	sub	a, b
   7252 C2 67 73      [10] 2451 	jp	NZ,00192$
                           2452 ;src/main.c:456: if (dy < enemy->y) {
   7255 DD 7E 07      [19] 2453 	ld	a,7 (ix)
   7258 DD 96 FA      [19] 2454 	sub	a, -6 (ix)
   725B D2 E1 72      [10] 2455 	jp	NC,00129$
                           2456 ;src/main.c:457: if (dist > G_HERO_H + 5) {
   725E 3E 1B         [ 7] 2457 	ld	a,#0x1B
   7260 DD 96 F2      [19] 2458 	sub	a, -14 (ix)
   7263 D2 0E 78      [10] 2459 	jp	NC,00199$
                           2460 ;src/main.c:458: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7266 DD 56 FA      [19] 2461 	ld	d,-6 (ix)
   7269 15            [ 4] 2462 	dec	d
   726A 15            [ 4] 2463 	dec	d
   726B D5            [11] 2464 	push	de
   726C 33            [ 6] 2465 	inc	sp
   726D C5            [11] 2466 	push	bc
   726E 33            [ 6] 2467 	inc	sp
   726F 2A C5 64      [16] 2468 	ld	hl,(_mapa)
   7272 E5            [11] 2469 	push	hl
   7273 CD 1C 4B      [17] 2470 	call	_getTilePtr
   7276 F1            [10] 2471 	pop	af
   7277 F1            [10] 2472 	pop	af
   7278 4E            [ 7] 2473 	ld	c,(hl)
   7279 3E 02         [ 7] 2474 	ld	a,#0x02
   727B 91            [ 4] 2475 	sub	a, c
   727C DA 0E 78      [10] 2476 	jp	C,00199$
                           2477 ;src/main.c:459: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   727F DD 6E F6      [19] 2478 	ld	l,-10 (ix)
   7282 DD 66 F7      [19] 2479 	ld	h,-9 (ix)
   7285 56            [ 7] 2480 	ld	d,(hl)
   7286 15            [ 4] 2481 	dec	d
   7287 15            [ 4] 2482 	dec	d
   7288 DD 6E F4      [19] 2483 	ld	l,-12 (ix)
   728B DD 66 F5      [19] 2484 	ld	h,-11 (ix)
   728E 46            [ 7] 2485 	ld	b,(hl)
   728F 04            [ 4] 2486 	inc	b
   7290 04            [ 4] 2487 	inc	b
   7291 D5            [11] 2488 	push	de
   7292 33            [ 6] 2489 	inc	sp
   7293 C5            [11] 2490 	push	bc
   7294 33            [ 6] 2491 	inc	sp
   7295 2A C5 64      [16] 2492 	ld	hl,(_mapa)
   7298 E5            [11] 2493 	push	hl
   7299 CD 1C 4B      [17] 2494 	call	_getTilePtr
   729C F1            [10] 2495 	pop	af
   729D F1            [10] 2496 	pop	af
   729E 4E            [ 7] 2497 	ld	c,(hl)
   729F 3E 02         [ 7] 2498 	ld	a,#0x02
   72A1 91            [ 4] 2499 	sub	a, c
   72A2 DA 0E 78      [10] 2500 	jp	C,00199$
                           2501 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   72A5 DD 6E F6      [19] 2502 	ld	l,-10 (ix)
   72A8 DD 66 F7      [19] 2503 	ld	h,-9 (ix)
   72AB 46            [ 7] 2504 	ld	b,(hl)
   72AC 05            [ 4] 2505 	dec	b
   72AD 05            [ 4] 2506 	dec	b
   72AE DD 6E F4      [19] 2507 	ld	l,-12 (ix)
   72B1 DD 66 F5      [19] 2508 	ld	h,-11 (ix)
   72B4 7E            [ 7] 2509 	ld	a,(hl)
   72B5 C6 04         [ 7] 2510 	add	a, #0x04
   72B7 C5            [11] 2511 	push	bc
   72B8 33            [ 6] 2512 	inc	sp
   72B9 F5            [11] 2513 	push	af
   72BA 33            [ 6] 2514 	inc	sp
   72BB 2A C5 64      [16] 2515 	ld	hl,(_mapa)
   72BE E5            [11] 2516 	push	hl
   72BF CD 1C 4B      [17] 2517 	call	_getTilePtr
   72C2 F1            [10] 2518 	pop	af
   72C3 F1            [10] 2519 	pop	af
   72C4 4E            [ 7] 2520 	ld	c,(hl)
   72C5 3E 02         [ 7] 2521 	ld	a,#0x02
   72C7 91            [ 4] 2522 	sub	a, c
   72C8 DA 0E 78      [10] 2523 	jp	C,00199$
                           2524 ;src/main.c:461: moverEnemigoArriba(enemy);
   72CB DD 6E F4      [19] 2525 	ld	l,-12 (ix)
   72CE DD 66 F5      [19] 2526 	ld	h,-11 (ix)
   72D1 E5            [11] 2527 	push	hl
   72D2 CD 1C 6B      [17] 2528 	call	_moverEnemigoArriba
   72D5 F1            [10] 2529 	pop	af
                           2530 ;src/main.c:463: enemy->mover = SI;
   72D6 DD 6E F8      [19] 2531 	ld	l,-8 (ix)
   72D9 DD 66 F9      [19] 2532 	ld	h,-7 (ix)
   72DC 36 01         [10] 2533 	ld	(hl),#0x01
   72DE C3 0E 78      [10] 2534 	jp	00199$
   72E1                    2535 00129$:
                           2536 ;src/main.c:467: if(dist > G_ENEMY_H + 7) {
   72E1 3E 1D         [ 7] 2537 	ld	a,#0x1D
   72E3 DD 96 F2      [19] 2538 	sub	a, -14 (ix)
   72E6 D2 0E 78      [10] 2539 	jp	NC,00199$
                           2540 ;src/main.c:468: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   72E9 DD 7E FA      [19] 2541 	ld	a,-6 (ix)
   72EC C6 18         [ 7] 2542 	add	a, #0x18
   72EE 57            [ 4] 2543 	ld	d,a
   72EF D5            [11] 2544 	push	de
   72F0 33            [ 6] 2545 	inc	sp
   72F1 C5            [11] 2546 	push	bc
   72F2 33            [ 6] 2547 	inc	sp
   72F3 2A C5 64      [16] 2548 	ld	hl,(_mapa)
   72F6 E5            [11] 2549 	push	hl
   72F7 CD 1C 4B      [17] 2550 	call	_getTilePtr
   72FA F1            [10] 2551 	pop	af
   72FB F1            [10] 2552 	pop	af
   72FC 4E            [ 7] 2553 	ld	c,(hl)
   72FD 3E 02         [ 7] 2554 	ld	a,#0x02
   72FF 91            [ 4] 2555 	sub	a, c
   7300 DA 0E 78      [10] 2556 	jp	C,00199$
                           2557 ;src/main.c:469: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7303 DD 6E F6      [19] 2558 	ld	l,-10 (ix)
   7306 DD 66 F7      [19] 2559 	ld	h,-9 (ix)
   7309 7E            [ 7] 2560 	ld	a,(hl)
   730A C6 18         [ 7] 2561 	add	a, #0x18
   730C 57            [ 4] 2562 	ld	d,a
   730D DD 6E F4      [19] 2563 	ld	l,-12 (ix)
   7310 DD 66 F5      [19] 2564 	ld	h,-11 (ix)
   7313 46            [ 7] 2565 	ld	b,(hl)
   7314 04            [ 4] 2566 	inc	b
   7315 04            [ 4] 2567 	inc	b
   7316 D5            [11] 2568 	push	de
   7317 33            [ 6] 2569 	inc	sp
   7318 C5            [11] 2570 	push	bc
   7319 33            [ 6] 2571 	inc	sp
   731A 2A C5 64      [16] 2572 	ld	hl,(_mapa)
   731D E5            [11] 2573 	push	hl
   731E CD 1C 4B      [17] 2574 	call	_getTilePtr
   7321 F1            [10] 2575 	pop	af
   7322 F1            [10] 2576 	pop	af
   7323 4E            [ 7] 2577 	ld	c,(hl)
   7324 3E 02         [ 7] 2578 	ld	a,#0x02
   7326 91            [ 4] 2579 	sub	a, c
   7327 DA 0E 78      [10] 2580 	jp	C,00199$
                           2581 ;src/main.c:470: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   732A DD 6E F6      [19] 2582 	ld	l,-10 (ix)
   732D DD 66 F7      [19] 2583 	ld	h,-9 (ix)
   7330 7E            [ 7] 2584 	ld	a,(hl)
   7331 C6 18         [ 7] 2585 	add	a, #0x18
   7333 47            [ 4] 2586 	ld	b,a
   7334 DD 6E F4      [19] 2587 	ld	l,-12 (ix)
   7337 DD 66 F5      [19] 2588 	ld	h,-11 (ix)
   733A 7E            [ 7] 2589 	ld	a,(hl)
   733B C6 04         [ 7] 2590 	add	a, #0x04
   733D C5            [11] 2591 	push	bc
   733E 33            [ 6] 2592 	inc	sp
   733F F5            [11] 2593 	push	af
   7340 33            [ 6] 2594 	inc	sp
   7341 2A C5 64      [16] 2595 	ld	hl,(_mapa)
   7344 E5            [11] 2596 	push	hl
   7345 CD 1C 4B      [17] 2597 	call	_getTilePtr
   7348 F1            [10] 2598 	pop	af
   7349 F1            [10] 2599 	pop	af
   734A 4E            [ 7] 2600 	ld	c,(hl)
   734B 3E 02         [ 7] 2601 	ld	a,#0x02
   734D 91            [ 4] 2602 	sub	a, c
   734E DA 0E 78      [10] 2603 	jp	C,00199$
                           2604 ;src/main.c:471: moverEnemigoAbajo(enemy);
   7351 DD 6E F4      [19] 2605 	ld	l,-12 (ix)
   7354 DD 66 F5      [19] 2606 	ld	h,-11 (ix)
   7357 E5            [11] 2607 	push	hl
   7358 CD 3B 6B      [17] 2608 	call	_moverEnemigoAbajo
   735B F1            [10] 2609 	pop	af
                           2610 ;src/main.c:473: enemy->mover = SI;
   735C DD 6E F8      [19] 2611 	ld	l,-8 (ix)
   735F DD 66 F9      [19] 2612 	ld	h,-7 (ix)
   7362 36 01         [10] 2613 	ld	(hl),#0x01
   7364 C3 0E 78      [10] 2614 	jp	00199$
   7367                    2615 00192$:
                           2616 ;src/main.c:479: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7367 3A EE 63      [13] 2617 	ld	a, (#_prota + 6)
   736A B7            [ 4] 2618 	or	a, a
   736B 20 02         [12] 2619 	jr	NZ,00132$
   736D 0E 14         [ 7] 2620 	ld	c,#0x14
   736F                    2621 00132$:
                           2622 ;src/main.c:481: if (dist > distConstraint) {
   736F 79            [ 4] 2623 	ld	a,c
   7370 DD 96 F2      [19] 2624 	sub	a, -14 (ix)
   7373 D2 0E 78      [10] 2625 	jp	NC,00199$
                           2626 ;src/main.c:482: if (dx + 1 < enemy->x) {
   7376 DD 5E 06      [19] 2627 	ld	e,6 (ix)
   7379 16 00         [ 7] 2628 	ld	d,#0x00
   737B 13            [ 6] 2629 	inc	de
   737C DD 73 FE      [19] 2630 	ld	-2 (ix),e
   737F DD 72 FF      [19] 2631 	ld	-1 (ix),d
   7382 DD 70 FC      [19] 2632 	ld	-4 (ix),b
   7385 DD 36 FD 00   [19] 2633 	ld	-3 (ix),#0x00
   7389 DD 7E FE      [19] 2634 	ld	a,-2 (ix)
   738C DD 96 FC      [19] 2635 	sub	a, -4 (ix)
   738F DD 7E FF      [19] 2636 	ld	a,-1 (ix)
   7392 DD 9E FD      [19] 2637 	sbc	a, -3 (ix)
   7395 E2 9A 73      [10] 2638 	jp	PO, 00427$
   7398 EE 80         [ 7] 2639 	xor	a, #0x80
   739A                    2640 00427$:
   739A F2 16 74      [10] 2641 	jp	P,00144$
                           2642 ;src/main.c:483: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   739D DD 7E FA      [19] 2643 	ld	a,-6 (ix)
   73A0 F5            [11] 2644 	push	af
   73A1 33            [ 6] 2645 	inc	sp
   73A2 C5            [11] 2646 	push	bc
   73A3 33            [ 6] 2647 	inc	sp
   73A4 2A C5 64      [16] 2648 	ld	hl,(_mapa)
   73A7 E5            [11] 2649 	push	hl
   73A8 CD 1C 4B      [17] 2650 	call	_getTilePtr
   73AB F1            [10] 2651 	pop	af
   73AC F1            [10] 2652 	pop	af
   73AD 4E            [ 7] 2653 	ld	c,(hl)
   73AE 3E 02         [ 7] 2654 	ld	a,#0x02
   73B0 91            [ 4] 2655 	sub	a, c
   73B1 DA A3 74      [10] 2656 	jp	C,00145$
                           2657 ;src/main.c:484: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   73B4 DD 6E F6      [19] 2658 	ld	l,-10 (ix)
   73B7 DD 66 F7      [19] 2659 	ld	h,-9 (ix)
   73BA 7E            [ 7] 2660 	ld	a,(hl)
   73BB C6 0B         [ 7] 2661 	add	a, #0x0B
   73BD DD 6E F4      [19] 2662 	ld	l,-12 (ix)
   73C0 DD 66 F5      [19] 2663 	ld	h,-11 (ix)
   73C3 46            [ 7] 2664 	ld	b,(hl)
   73C4 F5            [11] 2665 	push	af
   73C5 33            [ 6] 2666 	inc	sp
   73C6 C5            [11] 2667 	push	bc
   73C7 33            [ 6] 2668 	inc	sp
   73C8 2A C5 64      [16] 2669 	ld	hl,(_mapa)
   73CB E5            [11] 2670 	push	hl
   73CC CD 1C 4B      [17] 2671 	call	_getTilePtr
   73CF F1            [10] 2672 	pop	af
   73D0 F1            [10] 2673 	pop	af
   73D1 4E            [ 7] 2674 	ld	c,(hl)
   73D2 3E 02         [ 7] 2675 	ld	a,#0x02
   73D4 91            [ 4] 2676 	sub	a, c
   73D5 DA A3 74      [10] 2677 	jp	C,00145$
                           2678 ;src/main.c:485: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   73D8 DD 6E F6      [19] 2679 	ld	l,-10 (ix)
   73DB DD 66 F7      [19] 2680 	ld	h,-9 (ix)
   73DE 7E            [ 7] 2681 	ld	a,(hl)
   73DF C6 16         [ 7] 2682 	add	a, #0x16
   73E1 DD 6E F4      [19] 2683 	ld	l,-12 (ix)
   73E4 DD 66 F5      [19] 2684 	ld	h,-11 (ix)
   73E7 46            [ 7] 2685 	ld	b,(hl)
   73E8 F5            [11] 2686 	push	af
   73E9 33            [ 6] 2687 	inc	sp
   73EA C5            [11] 2688 	push	bc
   73EB 33            [ 6] 2689 	inc	sp
   73EC 2A C5 64      [16] 2690 	ld	hl,(_mapa)
   73EF E5            [11] 2691 	push	hl
   73F0 CD 1C 4B      [17] 2692 	call	_getTilePtr
   73F3 F1            [10] 2693 	pop	af
   73F4 F1            [10] 2694 	pop	af
   73F5 4E            [ 7] 2695 	ld	c,(hl)
   73F6 3E 02         [ 7] 2696 	ld	a,#0x02
   73F8 91            [ 4] 2697 	sub	a, c
   73F9 DA A3 74      [10] 2698 	jp	C,00145$
                           2699 ;src/main.c:486: moverEnemigoIzquierda(enemy);
   73FC DD 6E F4      [19] 2700 	ld	l,-12 (ix)
   73FF DD 66 F5      [19] 2701 	ld	h,-11 (ix)
   7402 E5            [11] 2702 	push	hl
   7403 CD 6A 6B      [17] 2703 	call	_moverEnemigoIzquierda
   7406 F1            [10] 2704 	pop	af
                           2705 ;src/main.c:487: movX = 1;
   7407 DD 36 F1 01   [19] 2706 	ld	-15 (ix),#0x01
                           2707 ;src/main.c:488: enemy->mover = SI;
   740B DD 6E F8      [19] 2708 	ld	l,-8 (ix)
   740E DD 66 F9      [19] 2709 	ld	h,-7 (ix)
   7411 36 01         [10] 2710 	ld	(hl),#0x01
   7413 C3 A3 74      [10] 2711 	jp	00145$
   7416                    2712 00144$:
                           2713 ;src/main.c:490: } else if (dx + 1 > enemy->x){
   7416 DD 7E FC      [19] 2714 	ld	a,-4 (ix)
   7419 DD 96 FE      [19] 2715 	sub	a, -2 (ix)
   741C DD 7E FD      [19] 2716 	ld	a,-3 (ix)
   741F DD 9E FF      [19] 2717 	sbc	a, -1 (ix)
   7422 E2 27 74      [10] 2718 	jp	PO, 00428$
   7425 EE 80         [ 7] 2719 	xor	a, #0x80
   7427                    2720 00428$:
   7427 F2 A3 74      [10] 2721 	jp	P,00145$
                           2722 ;src/main.c:491: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   742A DD 66 FA      [19] 2723 	ld	h,-6 (ix)
   742D DD 6E FB      [19] 2724 	ld	l,-5 (ix)
   7430 E5            [11] 2725 	push	hl
   7431 2A C5 64      [16] 2726 	ld	hl,(_mapa)
   7434 E5            [11] 2727 	push	hl
   7435 CD 1C 4B      [17] 2728 	call	_getTilePtr
   7438 F1            [10] 2729 	pop	af
   7439 F1            [10] 2730 	pop	af
   743A 4E            [ 7] 2731 	ld	c,(hl)
   743B 3E 02         [ 7] 2732 	ld	a,#0x02
   743D 91            [ 4] 2733 	sub	a, c
   743E 38 63         [12] 2734 	jr	C,00145$
                           2735 ;src/main.c:492: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7440 DD 6E F6      [19] 2736 	ld	l,-10 (ix)
   7443 DD 66 F7      [19] 2737 	ld	h,-9 (ix)
   7446 7E            [ 7] 2738 	ld	a,(hl)
   7447 C6 0B         [ 7] 2739 	add	a, #0x0B
   7449 47            [ 4] 2740 	ld	b,a
   744A DD 6E F4      [19] 2741 	ld	l,-12 (ix)
   744D DD 66 F5      [19] 2742 	ld	h,-11 (ix)
   7450 7E            [ 7] 2743 	ld	a,(hl)
   7451 C6 04         [ 7] 2744 	add	a, #0x04
   7453 C5            [11] 2745 	push	bc
   7454 33            [ 6] 2746 	inc	sp
   7455 F5            [11] 2747 	push	af
   7456 33            [ 6] 2748 	inc	sp
   7457 2A C5 64      [16] 2749 	ld	hl,(_mapa)
   745A E5            [11] 2750 	push	hl
   745B CD 1C 4B      [17] 2751 	call	_getTilePtr
   745E F1            [10] 2752 	pop	af
   745F F1            [10] 2753 	pop	af
   7460 4E            [ 7] 2754 	ld	c,(hl)
   7461 3E 02         [ 7] 2755 	ld	a,#0x02
   7463 91            [ 4] 2756 	sub	a, c
   7464 38 3D         [12] 2757 	jr	C,00145$
                           2758 ;src/main.c:493: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7466 DD 6E F6      [19] 2759 	ld	l,-10 (ix)
   7469 DD 66 F7      [19] 2760 	ld	h,-9 (ix)
   746C 7E            [ 7] 2761 	ld	a,(hl)
   746D C6 16         [ 7] 2762 	add	a, #0x16
   746F 47            [ 4] 2763 	ld	b,a
   7470 DD 6E F4      [19] 2764 	ld	l,-12 (ix)
   7473 DD 66 F5      [19] 2765 	ld	h,-11 (ix)
   7476 7E            [ 7] 2766 	ld	a,(hl)
   7477 C6 04         [ 7] 2767 	add	a, #0x04
   7479 C5            [11] 2768 	push	bc
   747A 33            [ 6] 2769 	inc	sp
   747B F5            [11] 2770 	push	af
   747C 33            [ 6] 2771 	inc	sp
   747D 2A C5 64      [16] 2772 	ld	hl,(_mapa)
   7480 E5            [11] 2773 	push	hl
   7481 CD 1C 4B      [17] 2774 	call	_getTilePtr
   7484 F1            [10] 2775 	pop	af
   7485 F1            [10] 2776 	pop	af
   7486 4E            [ 7] 2777 	ld	c,(hl)
   7487 3E 02         [ 7] 2778 	ld	a,#0x02
   7489 91            [ 4] 2779 	sub	a, c
   748A 38 17         [12] 2780 	jr	C,00145$
                           2781 ;src/main.c:494: moverEnemigoDerecha(enemy);
   748C DD 6E F4      [19] 2782 	ld	l,-12 (ix)
   748F DD 66 F5      [19] 2783 	ld	h,-11 (ix)
   7492 E5            [11] 2784 	push	hl
   7493 CD 5A 6B      [17] 2785 	call	_moverEnemigoDerecha
   7496 F1            [10] 2786 	pop	af
                           2787 ;src/main.c:495: movX = 1;
   7497 DD 36 F1 01   [19] 2788 	ld	-15 (ix),#0x01
                           2789 ;src/main.c:496: enemy->mover = SI;
   749B DD 6E F8      [19] 2790 	ld	l,-8 (ix)
   749E DD 66 F9      [19] 2791 	ld	h,-7 (ix)
   74A1 36 01         [10] 2792 	ld	(hl),#0x01
   74A3                    2793 00145$:
                           2794 ;src/main.c:499: if (dy < enemy->y) {
   74A3 DD 6E F6      [19] 2795 	ld	l,-10 (ix)
   74A6 DD 66 F7      [19] 2796 	ld	h,-9 (ix)
   74A9 4E            [ 7] 2797 	ld	c,(hl)
                           2798 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   74AA DD 6E F4      [19] 2799 	ld	l,-12 (ix)
   74AD DD 66 F5      [19] 2800 	ld	h,-11 (ix)
   74B0 46            [ 7] 2801 	ld	b,(hl)
                           2802 ;src/main.c:499: if (dy < enemy->y) {
   74B1 DD 7E 07      [19] 2803 	ld	a,7 (ix)
   74B4 91            [ 4] 2804 	sub	a, c
   74B5 D2 35 75      [10] 2805 	jp	NC,00155$
                           2806 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   74B8 51            [ 4] 2807 	ld	d,c
   74B9 15            [ 4] 2808 	dec	d
   74BA 15            [ 4] 2809 	dec	d
   74BB D5            [11] 2810 	push	de
   74BC 33            [ 6] 2811 	inc	sp
   74BD C5            [11] 2812 	push	bc
   74BE 33            [ 6] 2813 	inc	sp
   74BF 2A C5 64      [16] 2814 	ld	hl,(_mapa)
   74C2 E5            [11] 2815 	push	hl
   74C3 CD 1C 4B      [17] 2816 	call	_getTilePtr
   74C6 F1            [10] 2817 	pop	af
   74C7 F1            [10] 2818 	pop	af
   74C8 4E            [ 7] 2819 	ld	c,(hl)
   74C9 3E 02         [ 7] 2820 	ld	a,#0x02
   74CB 91            [ 4] 2821 	sub	a, c
   74CC DA AF 75      [10] 2822 	jp	C,00156$
                           2823 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   74CF DD 6E F6      [19] 2824 	ld	l,-10 (ix)
   74D2 DD 66 F7      [19] 2825 	ld	h,-9 (ix)
   74D5 56            [ 7] 2826 	ld	d,(hl)
   74D6 15            [ 4] 2827 	dec	d
   74D7 15            [ 4] 2828 	dec	d
   74D8 DD 6E F4      [19] 2829 	ld	l,-12 (ix)
   74DB DD 66 F5      [19] 2830 	ld	h,-11 (ix)
   74DE 46            [ 7] 2831 	ld	b,(hl)
   74DF 04            [ 4] 2832 	inc	b
   74E0 04            [ 4] 2833 	inc	b
   74E1 D5            [11] 2834 	push	de
   74E2 33            [ 6] 2835 	inc	sp
   74E3 C5            [11] 2836 	push	bc
   74E4 33            [ 6] 2837 	inc	sp
   74E5 2A C5 64      [16] 2838 	ld	hl,(_mapa)
   74E8 E5            [11] 2839 	push	hl
   74E9 CD 1C 4B      [17] 2840 	call	_getTilePtr
   74EC F1            [10] 2841 	pop	af
   74ED F1            [10] 2842 	pop	af
   74EE 4E            [ 7] 2843 	ld	c,(hl)
   74EF 3E 02         [ 7] 2844 	ld	a,#0x02
   74F1 91            [ 4] 2845 	sub	a, c
   74F2 DA AF 75      [10] 2846 	jp	C,00156$
                           2847 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   74F5 DD 6E F6      [19] 2848 	ld	l,-10 (ix)
   74F8 DD 66 F7      [19] 2849 	ld	h,-9 (ix)
   74FB 46            [ 7] 2850 	ld	b,(hl)
   74FC 05            [ 4] 2851 	dec	b
   74FD 05            [ 4] 2852 	dec	b
   74FE DD 6E F4      [19] 2853 	ld	l,-12 (ix)
   7501 DD 66 F5      [19] 2854 	ld	h,-11 (ix)
   7504 7E            [ 7] 2855 	ld	a,(hl)
   7505 C6 04         [ 7] 2856 	add	a, #0x04
   7507 C5            [11] 2857 	push	bc
   7508 33            [ 6] 2858 	inc	sp
   7509 F5            [11] 2859 	push	af
   750A 33            [ 6] 2860 	inc	sp
   750B 2A C5 64      [16] 2861 	ld	hl,(_mapa)
   750E E5            [11] 2862 	push	hl
   750F CD 1C 4B      [17] 2863 	call	_getTilePtr
   7512 F1            [10] 2864 	pop	af
   7513 F1            [10] 2865 	pop	af
   7514 4E            [ 7] 2866 	ld	c,(hl)
   7515 3E 02         [ 7] 2867 	ld	a,#0x02
   7517 91            [ 4] 2868 	sub	a, c
   7518 DA AF 75      [10] 2869 	jp	C,00156$
                           2870 ;src/main.c:503: moverEnemigoArriba(enemy);
   751B DD 6E F4      [19] 2871 	ld	l,-12 (ix)
   751E DD 66 F5      [19] 2872 	ld	h,-11 (ix)
   7521 E5            [11] 2873 	push	hl
   7522 CD 1C 6B      [17] 2874 	call	_moverEnemigoArriba
   7525 F1            [10] 2875 	pop	af
                           2876 ;src/main.c:504: movY = 1;
   7526 DD 36 F3 01   [19] 2877 	ld	-13 (ix),#0x01
                           2878 ;src/main.c:505: enemy->mover = SI;
   752A DD 6E F8      [19] 2879 	ld	l,-8 (ix)
   752D DD 66 F9      [19] 2880 	ld	h,-7 (ix)
   7530 36 01         [10] 2881 	ld	(hl),#0x01
   7532 C3 AF 75      [10] 2882 	jp	00156$
   7535                    2883 00155$:
                           2884 ;src/main.c:508: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7535 79            [ 4] 2885 	ld	a,c
   7536 C6 18         [ 7] 2886 	add	a, #0x18
   7538 57            [ 4] 2887 	ld	d,a
   7539 D5            [11] 2888 	push	de
   753A 33            [ 6] 2889 	inc	sp
   753B C5            [11] 2890 	push	bc
   753C 33            [ 6] 2891 	inc	sp
   753D 2A C5 64      [16] 2892 	ld	hl,(_mapa)
   7540 E5            [11] 2893 	push	hl
   7541 CD 1C 4B      [17] 2894 	call	_getTilePtr
   7544 F1            [10] 2895 	pop	af
   7545 F1            [10] 2896 	pop	af
   7546 4E            [ 7] 2897 	ld	c,(hl)
   7547 3E 02         [ 7] 2898 	ld	a,#0x02
   7549 91            [ 4] 2899 	sub	a, c
   754A 38 63         [12] 2900 	jr	C,00156$
                           2901 ;src/main.c:509: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   754C DD 6E F6      [19] 2902 	ld	l,-10 (ix)
   754F DD 66 F7      [19] 2903 	ld	h,-9 (ix)
   7552 7E            [ 7] 2904 	ld	a,(hl)
   7553 C6 18         [ 7] 2905 	add	a, #0x18
   7555 57            [ 4] 2906 	ld	d,a
   7556 DD 6E F4      [19] 2907 	ld	l,-12 (ix)
   7559 DD 66 F5      [19] 2908 	ld	h,-11 (ix)
   755C 46            [ 7] 2909 	ld	b,(hl)
   755D 04            [ 4] 2910 	inc	b
   755E 04            [ 4] 2911 	inc	b
   755F D5            [11] 2912 	push	de
   7560 33            [ 6] 2913 	inc	sp
   7561 C5            [11] 2914 	push	bc
   7562 33            [ 6] 2915 	inc	sp
   7563 2A C5 64      [16] 2916 	ld	hl,(_mapa)
   7566 E5            [11] 2917 	push	hl
   7567 CD 1C 4B      [17] 2918 	call	_getTilePtr
   756A F1            [10] 2919 	pop	af
   756B F1            [10] 2920 	pop	af
   756C 4E            [ 7] 2921 	ld	c,(hl)
   756D 3E 02         [ 7] 2922 	ld	a,#0x02
   756F 91            [ 4] 2923 	sub	a, c
   7570 38 3D         [12] 2924 	jr	C,00156$
                           2925 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7572 DD 6E F6      [19] 2926 	ld	l,-10 (ix)
   7575 DD 66 F7      [19] 2927 	ld	h,-9 (ix)
   7578 7E            [ 7] 2928 	ld	a,(hl)
   7579 C6 18         [ 7] 2929 	add	a, #0x18
   757B 47            [ 4] 2930 	ld	b,a
   757C DD 6E F4      [19] 2931 	ld	l,-12 (ix)
   757F DD 66 F5      [19] 2932 	ld	h,-11 (ix)
   7582 7E            [ 7] 2933 	ld	a,(hl)
   7583 C6 04         [ 7] 2934 	add	a, #0x04
   7585 C5            [11] 2935 	push	bc
   7586 33            [ 6] 2936 	inc	sp
   7587 F5            [11] 2937 	push	af
   7588 33            [ 6] 2938 	inc	sp
   7589 2A C5 64      [16] 2939 	ld	hl,(_mapa)
   758C E5            [11] 2940 	push	hl
   758D CD 1C 4B      [17] 2941 	call	_getTilePtr
   7590 F1            [10] 2942 	pop	af
   7591 F1            [10] 2943 	pop	af
   7592 4E            [ 7] 2944 	ld	c,(hl)
   7593 3E 02         [ 7] 2945 	ld	a,#0x02
   7595 91            [ 4] 2946 	sub	a, c
   7596 38 17         [12] 2947 	jr	C,00156$
                           2948 ;src/main.c:511: moverEnemigoAbajo(enemy);
   7598 DD 6E F4      [19] 2949 	ld	l,-12 (ix)
   759B DD 66 F5      [19] 2950 	ld	h,-11 (ix)
   759E E5            [11] 2951 	push	hl
   759F CD 3B 6B      [17] 2952 	call	_moverEnemigoAbajo
   75A2 F1            [10] 2953 	pop	af
                           2954 ;src/main.c:512: movY = 1;
   75A3 DD 36 F3 01   [19] 2955 	ld	-13 (ix),#0x01
                           2956 ;src/main.c:513: enemy->mover = SI;
   75A7 DD 6E F8      [19] 2957 	ld	l,-8 (ix)
   75AA DD 66 F9      [19] 2958 	ld	h,-7 (ix)
   75AD 36 01         [10] 2959 	ld	(hl),#0x01
   75AF                    2960 00156$:
                           2961 ;src/main.c:516: if (!enemy->mover) {
   75AF DD 6E F8      [19] 2962 	ld	l,-8 (ix)
   75B2 DD 66 F9      [19] 2963 	ld	h,-7 (ix)
   75B5 7E            [ 7] 2964 	ld	a,(hl)
   75B6 B7            [ 4] 2965 	or	a, a
   75B7 C2 0E 78      [10] 2966 	jp	NZ,00199$
                           2967 ;src/main.c:517: if (!movX) {
   75BA DD 7E F1      [19] 2968 	ld	a,-15 (ix)
   75BD B7            [ 4] 2969 	or	a, a
   75BE C2 E7 76      [10] 2970 	jp	NZ,00171$
                           2971 ;src/main.c:518: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   75C1 DD 6E F6      [19] 2972 	ld	l,-10 (ix)
   75C4 DD 66 F7      [19] 2973 	ld	h,-9 (ix)
   75C7 5E            [ 7] 2974 	ld	e,(hl)
                           2975 ;src/main.c:423: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75C8 DD 6E F4      [19] 2976 	ld	l,-12 (ix)
   75CB DD 66 F5      [19] 2977 	ld	h,-11 (ix)
   75CE 4E            [ 7] 2978 	ld	c,(hl)
                           2979 ;src/main.c:518: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   75CF 3E 70         [ 7] 2980 	ld	a,#0x70
   75D1 93            [ 4] 2981 	sub	a, e
   75D2 D2 62 76      [10] 2982 	jp	NC,00168$
                           2983 ;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75D5 7B            [ 4] 2984 	ld	a,e
   75D6 C6 18         [ 7] 2985 	add	a, #0x18
   75D8 47            [ 4] 2986 	ld	b,a
   75D9 C5            [11] 2987 	push	bc
   75DA 2A C5 64      [16] 2988 	ld	hl,(_mapa)
   75DD E5            [11] 2989 	push	hl
   75DE CD 1C 4B      [17] 2990 	call	_getTilePtr
   75E1 F1            [10] 2991 	pop	af
   75E2 F1            [10] 2992 	pop	af
   75E3 4E            [ 7] 2993 	ld	c,(hl)
   75E4 3E 02         [ 7] 2994 	ld	a,#0x02
   75E6 91            [ 4] 2995 	sub	a, c
   75E7 38 63         [12] 2996 	jr	C,00158$
                           2997 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   75E9 DD 6E F6      [19] 2998 	ld	l,-10 (ix)
   75EC DD 66 F7      [19] 2999 	ld	h,-9 (ix)
   75EF 7E            [ 7] 3000 	ld	a,(hl)
   75F0 C6 18         [ 7] 3001 	add	a, #0x18
   75F2 57            [ 4] 3002 	ld	d,a
   75F3 DD 6E F4      [19] 3003 	ld	l,-12 (ix)
   75F6 DD 66 F5      [19] 3004 	ld	h,-11 (ix)
   75F9 4E            [ 7] 3005 	ld	c,(hl)
   75FA 41            [ 4] 3006 	ld	b,c
   75FB 04            [ 4] 3007 	inc	b
   75FC 04            [ 4] 3008 	inc	b
   75FD D5            [11] 3009 	push	de
   75FE 33            [ 6] 3010 	inc	sp
   75FF C5            [11] 3011 	push	bc
   7600 33            [ 6] 3012 	inc	sp
   7601 2A C5 64      [16] 3013 	ld	hl,(_mapa)
   7604 E5            [11] 3014 	push	hl
   7605 CD 1C 4B      [17] 3015 	call	_getTilePtr
   7608 F1            [10] 3016 	pop	af
   7609 F1            [10] 3017 	pop	af
   760A 4E            [ 7] 3018 	ld	c,(hl)
   760B 3E 02         [ 7] 3019 	ld	a,#0x02
   760D 91            [ 4] 3020 	sub	a, c
   760E 38 3C         [12] 3021 	jr	C,00158$
                           3022 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7610 DD 6E F6      [19] 3023 	ld	l,-10 (ix)
   7613 DD 66 F7      [19] 3024 	ld	h,-9 (ix)
   7616 7E            [ 7] 3025 	ld	a,(hl)
   7617 C6 18         [ 7] 3026 	add	a, #0x18
   7619 47            [ 4] 3027 	ld	b,a
   761A DD 6E F4      [19] 3028 	ld	l,-12 (ix)
   761D DD 66 F5      [19] 3029 	ld	h,-11 (ix)
   7620 7E            [ 7] 3030 	ld	a,(hl)
   7621 C6 04         [ 7] 3031 	add	a, #0x04
   7623 C5            [11] 3032 	push	bc
   7624 33            [ 6] 3033 	inc	sp
   7625 F5            [11] 3034 	push	af
   7626 33            [ 6] 3035 	inc	sp
   7627 2A C5 64      [16] 3036 	ld	hl,(_mapa)
   762A E5            [11] 3037 	push	hl
   762B CD 1C 4B      [17] 3038 	call	_getTilePtr
   762E F1            [10] 3039 	pop	af
   762F F1            [10] 3040 	pop	af
   7630 4E            [ 7] 3041 	ld	c,(hl)
   7631 3E 02         [ 7] 3042 	ld	a,#0x02
   7633 91            [ 4] 3043 	sub	a, c
   7634 38 16         [12] 3044 	jr	C,00158$
                           3045 ;src/main.c:522: moverEnemigoAbajo(enemy);
   7636 DD 6E F4      [19] 3046 	ld	l,-12 (ix)
   7639 DD 66 F5      [19] 3047 	ld	h,-11 (ix)
   763C E5            [11] 3048 	push	hl
   763D CD 3B 6B      [17] 3049 	call	_moverEnemigoAbajo
   7640 F1            [10] 3050 	pop	af
                           3051 ;src/main.c:523: enemy->mover = SI;
   7641 DD 6E F8      [19] 3052 	ld	l,-8 (ix)
   7644 DD 66 F9      [19] 3053 	ld	h,-7 (ix)
   7647 36 01         [10] 3054 	ld	(hl),#0x01
   7649 C3 E7 76      [10] 3055 	jp	00171$
   764C                    3056 00158$:
                           3057 ;src/main.c:525: moverEnemigoArriba(enemy);
   764C DD 6E F4      [19] 3058 	ld	l,-12 (ix)
   764F DD 66 F5      [19] 3059 	ld	h,-11 (ix)
   7652 E5            [11] 3060 	push	hl
   7653 CD 1C 6B      [17] 3061 	call	_moverEnemigoArriba
   7656 F1            [10] 3062 	pop	af
                           3063 ;src/main.c:526: enemy->mover = SI;
   7657 DD 6E F8      [19] 3064 	ld	l,-8 (ix)
   765A DD 66 F9      [19] 3065 	ld	h,-7 (ix)
   765D 36 01         [10] 3066 	ld	(hl),#0x01
   765F C3 E7 76      [10] 3067 	jp	00171$
   7662                    3068 00168$:
                           3069 ;src/main.c:529: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7662 43            [ 4] 3070 	ld	b,e
   7663 05            [ 4] 3071 	dec	b
   7664 05            [ 4] 3072 	dec	b
   7665 C5            [11] 3073 	push	bc
   7666 2A C5 64      [16] 3074 	ld	hl,(_mapa)
   7669 E5            [11] 3075 	push	hl
   766A CD 1C 4B      [17] 3076 	call	_getTilePtr
   766D F1            [10] 3077 	pop	af
   766E F1            [10] 3078 	pop	af
   766F 4E            [ 7] 3079 	ld	c,(hl)
   7670 3E 02         [ 7] 3080 	ld	a,#0x02
   7672 91            [ 4] 3081 	sub	a, c
   7673 38 5F         [12] 3082 	jr	C,00163$
                           3083 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7675 DD 6E F6      [19] 3084 	ld	l,-10 (ix)
   7678 DD 66 F7      [19] 3085 	ld	h,-9 (ix)
   767B 56            [ 7] 3086 	ld	d,(hl)
   767C 15            [ 4] 3087 	dec	d
   767D 15            [ 4] 3088 	dec	d
   767E DD 6E F4      [19] 3089 	ld	l,-12 (ix)
   7681 DD 66 F5      [19] 3090 	ld	h,-11 (ix)
   7684 46            [ 7] 3091 	ld	b,(hl)
   7685 04            [ 4] 3092 	inc	b
   7686 04            [ 4] 3093 	inc	b
   7687 D5            [11] 3094 	push	de
   7688 33            [ 6] 3095 	inc	sp
   7689 C5            [11] 3096 	push	bc
   768A 33            [ 6] 3097 	inc	sp
   768B 2A C5 64      [16] 3098 	ld	hl,(_mapa)
   768E E5            [11] 3099 	push	hl
   768F CD 1C 4B      [17] 3100 	call	_getTilePtr
   7692 F1            [10] 3101 	pop	af
   7693 F1            [10] 3102 	pop	af
   7694 4E            [ 7] 3103 	ld	c,(hl)
   7695 3E 02         [ 7] 3104 	ld	a,#0x02
   7697 91            [ 4] 3105 	sub	a, c
   7698 38 3A         [12] 3106 	jr	C,00163$
                           3107 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   769A DD 6E F6      [19] 3108 	ld	l,-10 (ix)
   769D DD 66 F7      [19] 3109 	ld	h,-9 (ix)
   76A0 46            [ 7] 3110 	ld	b,(hl)
   76A1 05            [ 4] 3111 	dec	b
   76A2 05            [ 4] 3112 	dec	b
   76A3 DD 6E F4      [19] 3113 	ld	l,-12 (ix)
   76A6 DD 66 F5      [19] 3114 	ld	h,-11 (ix)
   76A9 7E            [ 7] 3115 	ld	a,(hl)
   76AA C6 04         [ 7] 3116 	add	a, #0x04
   76AC C5            [11] 3117 	push	bc
   76AD 33            [ 6] 3118 	inc	sp
   76AE F5            [11] 3119 	push	af
   76AF 33            [ 6] 3120 	inc	sp
   76B0 2A C5 64      [16] 3121 	ld	hl,(_mapa)
   76B3 E5            [11] 3122 	push	hl
   76B4 CD 1C 4B      [17] 3123 	call	_getTilePtr
   76B7 F1            [10] 3124 	pop	af
   76B8 F1            [10] 3125 	pop	af
   76B9 4E            [ 7] 3126 	ld	c,(hl)
   76BA 3E 02         [ 7] 3127 	ld	a,#0x02
   76BC 91            [ 4] 3128 	sub	a, c
   76BD 38 15         [12] 3129 	jr	C,00163$
                           3130 ;src/main.c:532: moverEnemigoArriba(enemy);
   76BF DD 6E F4      [19] 3131 	ld	l,-12 (ix)
   76C2 DD 66 F5      [19] 3132 	ld	h,-11 (ix)
   76C5 E5            [11] 3133 	push	hl
   76C6 CD 1C 6B      [17] 3134 	call	_moverEnemigoArriba
   76C9 F1            [10] 3135 	pop	af
                           3136 ;src/main.c:533: enemy->mover = SI;
   76CA DD 6E F8      [19] 3137 	ld	l,-8 (ix)
   76CD DD 66 F9      [19] 3138 	ld	h,-7 (ix)
   76D0 36 01         [10] 3139 	ld	(hl),#0x01
   76D2 18 13         [12] 3140 	jr	00171$
   76D4                    3141 00163$:
                           3142 ;src/main.c:535: moverEnemigoAbajo(enemy);
   76D4 DD 6E F4      [19] 3143 	ld	l,-12 (ix)
   76D7 DD 66 F5      [19] 3144 	ld	h,-11 (ix)
   76DA E5            [11] 3145 	push	hl
   76DB CD 3B 6B      [17] 3146 	call	_moverEnemigoAbajo
   76DE F1            [10] 3147 	pop	af
                           3148 ;src/main.c:536: enemy->mover = SI;
   76DF DD 6E F8      [19] 3149 	ld	l,-8 (ix)
   76E2 DD 66 F9      [19] 3150 	ld	h,-7 (ix)
   76E5 36 01         [10] 3151 	ld	(hl),#0x01
   76E7                    3152 00171$:
                           3153 ;src/main.c:541: if (!movY) {
   76E7 DD 7E F3      [19] 3154 	ld	a,-13 (ix)
   76EA B7            [ 4] 3155 	or	a, a
   76EB C2 0E 78      [10] 3156 	jp	NZ,00199$
                           3157 ;src/main.c:542: if (enemy->x < ANCHO_PANTALLA/2) {
   76EE DD 6E F4      [19] 3158 	ld	l,-12 (ix)
   76F1 DD 66 F5      [19] 3159 	ld	h,-11 (ix)
   76F4 4E            [ 7] 3160 	ld	c,(hl)
                           3161 ;src/main.c:424: u8 dify = abs(enemy->y - prota.y);
   76F5 DD 6E F6      [19] 3162 	ld	l,-10 (ix)
   76F8 DD 66 F7      [19] 3163 	ld	h,-9 (ix)
   76FB 46            [ 7] 3164 	ld	b,(hl)
                           3165 ;src/main.c:542: if (enemy->x < ANCHO_PANTALLA/2) {
   76FC 79            [ 4] 3166 	ld	a,c
   76FD D6 28         [ 7] 3167 	sub	a, #0x28
   76FF D2 84 77      [10] 3168 	jp	NC,00183$
                           3169 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7702 C5            [11] 3170 	push	bc
   7703 2A C5 64      [16] 3171 	ld	hl,(_mapa)
   7706 E5            [11] 3172 	push	hl
   7707 CD 1C 4B      [17] 3173 	call	_getTilePtr
   770A F1            [10] 3174 	pop	af
   770B F1            [10] 3175 	pop	af
   770C 4E            [ 7] 3176 	ld	c,(hl)
   770D 3E 02         [ 7] 3177 	ld	a,#0x02
   770F 91            [ 4] 3178 	sub	a, c
   7710 38 5C         [12] 3179 	jr	C,00173$
                           3180 ;src/main.c:544: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7712 DD 6E F6      [19] 3181 	ld	l,-10 (ix)
   7715 DD 66 F7      [19] 3182 	ld	h,-9 (ix)
   7718 7E            [ 7] 3183 	ld	a,(hl)
   7719 C6 0B         [ 7] 3184 	add	a, #0x0B
   771B DD 6E F4      [19] 3185 	ld	l,-12 (ix)
   771E DD 66 F5      [19] 3186 	ld	h,-11 (ix)
   7721 46            [ 7] 3187 	ld	b,(hl)
   7722 F5            [11] 3188 	push	af
   7723 33            [ 6] 3189 	inc	sp
   7724 C5            [11] 3190 	push	bc
   7725 33            [ 6] 3191 	inc	sp
   7726 2A C5 64      [16] 3192 	ld	hl,(_mapa)
   7729 E5            [11] 3193 	push	hl
   772A CD 1C 4B      [17] 3194 	call	_getTilePtr
   772D F1            [10] 3195 	pop	af
   772E F1            [10] 3196 	pop	af
   772F 4E            [ 7] 3197 	ld	c,(hl)
   7730 3E 02         [ 7] 3198 	ld	a,#0x02
   7732 91            [ 4] 3199 	sub	a, c
   7733 38 39         [12] 3200 	jr	C,00173$
                           3201 ;src/main.c:545: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7735 DD 6E F6      [19] 3202 	ld	l,-10 (ix)
   7738 DD 66 F7      [19] 3203 	ld	h,-9 (ix)
   773B 7E            [ 7] 3204 	ld	a,(hl)
   773C C6 16         [ 7] 3205 	add	a, #0x16
   773E DD 6E F4      [19] 3206 	ld	l,-12 (ix)
   7741 DD 66 F5      [19] 3207 	ld	h,-11 (ix)
   7744 46            [ 7] 3208 	ld	b,(hl)
   7745 F5            [11] 3209 	push	af
   7746 33            [ 6] 3210 	inc	sp
   7747 C5            [11] 3211 	push	bc
   7748 33            [ 6] 3212 	inc	sp
   7749 2A C5 64      [16] 3213 	ld	hl,(_mapa)
   774C E5            [11] 3214 	push	hl
   774D CD 1C 4B      [17] 3215 	call	_getTilePtr
   7750 F1            [10] 3216 	pop	af
   7751 F1            [10] 3217 	pop	af
   7752 4E            [ 7] 3218 	ld	c,(hl)
   7753 3E 02         [ 7] 3219 	ld	a,#0x02
   7755 91            [ 4] 3220 	sub	a, c
   7756 38 16         [12] 3221 	jr	C,00173$
                           3222 ;src/main.c:546: moverEnemigoIzquierda(enemy);
   7758 DD 6E F4      [19] 3223 	ld	l,-12 (ix)
   775B DD 66 F5      [19] 3224 	ld	h,-11 (ix)
   775E E5            [11] 3225 	push	hl
   775F CD 6A 6B      [17] 3226 	call	_moverEnemigoIzquierda
   7762 F1            [10] 3227 	pop	af
                           3228 ;src/main.c:547: enemy->mover = SI;
   7763 DD 6E F8      [19] 3229 	ld	l,-8 (ix)
   7766 DD 66 F9      [19] 3230 	ld	h,-7 (ix)
   7769 36 01         [10] 3231 	ld	(hl),#0x01
   776B C3 0E 78      [10] 3232 	jp	00199$
   776E                    3233 00173$:
                           3234 ;src/main.c:549: moverEnemigoDerecha(enemy);
   776E DD 6E F4      [19] 3235 	ld	l,-12 (ix)
   7771 DD 66 F5      [19] 3236 	ld	h,-11 (ix)
   7774 E5            [11] 3237 	push	hl
   7775 CD 5A 6B      [17] 3238 	call	_moverEnemigoDerecha
   7778 F1            [10] 3239 	pop	af
                           3240 ;src/main.c:550: enemy->mover = SI;
   7779 DD 6E F8      [19] 3241 	ld	l,-8 (ix)
   777C DD 66 F9      [19] 3242 	ld	h,-7 (ix)
   777F 36 01         [10] 3243 	ld	(hl),#0x01
   7781 C3 0E 78      [10] 3244 	jp	00199$
   7784                    3245 00183$:
                           3246 ;src/main.c:553: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7784 79            [ 4] 3247 	ld	a,c
   7785 C6 04         [ 7] 3248 	add	a, #0x04
   7787 C5            [11] 3249 	push	bc
   7788 33            [ 6] 3250 	inc	sp
   7789 F5            [11] 3251 	push	af
   778A 33            [ 6] 3252 	inc	sp
   778B 2A C5 64      [16] 3253 	ld	hl,(_mapa)
   778E E5            [11] 3254 	push	hl
   778F CD 1C 4B      [17] 3255 	call	_getTilePtr
   7792 F1            [10] 3256 	pop	af
   7793 F1            [10] 3257 	pop	af
   7794 4E            [ 7] 3258 	ld	c,(hl)
   7795 3E 02         [ 7] 3259 	ld	a,#0x02
   7797 91            [ 4] 3260 	sub	a, c
   7798 38 61         [12] 3261 	jr	C,00178$
                           3262 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   779A DD 6E F6      [19] 3263 	ld	l,-10 (ix)
   779D DD 66 F7      [19] 3264 	ld	h,-9 (ix)
   77A0 7E            [ 7] 3265 	ld	a,(hl)
   77A1 C6 0B         [ 7] 3266 	add	a, #0x0B
   77A3 47            [ 4] 3267 	ld	b,a
   77A4 DD 6E F4      [19] 3268 	ld	l,-12 (ix)
   77A7 DD 66 F5      [19] 3269 	ld	h,-11 (ix)
   77AA 7E            [ 7] 3270 	ld	a,(hl)
   77AB C6 04         [ 7] 3271 	add	a, #0x04
   77AD C5            [11] 3272 	push	bc
   77AE 33            [ 6] 3273 	inc	sp
   77AF F5            [11] 3274 	push	af
   77B0 33            [ 6] 3275 	inc	sp
   77B1 2A C5 64      [16] 3276 	ld	hl,(_mapa)
   77B4 E5            [11] 3277 	push	hl
   77B5 CD 1C 4B      [17] 3278 	call	_getTilePtr
   77B8 F1            [10] 3279 	pop	af
   77B9 F1            [10] 3280 	pop	af
   77BA 4E            [ 7] 3281 	ld	c,(hl)
   77BB 3E 02         [ 7] 3282 	ld	a,#0x02
   77BD 91            [ 4] 3283 	sub	a, c
   77BE 38 3B         [12] 3284 	jr	C,00178$
                           3285 ;src/main.c:555: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   77C0 DD 6E F6      [19] 3286 	ld	l,-10 (ix)
   77C3 DD 66 F7      [19] 3287 	ld	h,-9 (ix)
   77C6 7E            [ 7] 3288 	ld	a,(hl)
   77C7 C6 16         [ 7] 3289 	add	a, #0x16
   77C9 47            [ 4] 3290 	ld	b,a
   77CA DD 6E F4      [19] 3291 	ld	l,-12 (ix)
   77CD DD 66 F5      [19] 3292 	ld	h,-11 (ix)
   77D0 7E            [ 7] 3293 	ld	a,(hl)
   77D1 C6 04         [ 7] 3294 	add	a, #0x04
   77D3 C5            [11] 3295 	push	bc
   77D4 33            [ 6] 3296 	inc	sp
   77D5 F5            [11] 3297 	push	af
   77D6 33            [ 6] 3298 	inc	sp
   77D7 2A C5 64      [16] 3299 	ld	hl,(_mapa)
   77DA E5            [11] 3300 	push	hl
   77DB CD 1C 4B      [17] 3301 	call	_getTilePtr
   77DE F1            [10] 3302 	pop	af
   77DF F1            [10] 3303 	pop	af
   77E0 4E            [ 7] 3304 	ld	c,(hl)
   77E1 3E 02         [ 7] 3305 	ld	a,#0x02
   77E3 91            [ 4] 3306 	sub	a, c
   77E4 38 15         [12] 3307 	jr	C,00178$
                           3308 ;src/main.c:556: moverEnemigoDerecha(enemy);
   77E6 DD 6E F4      [19] 3309 	ld	l,-12 (ix)
   77E9 DD 66 F5      [19] 3310 	ld	h,-11 (ix)
   77EC E5            [11] 3311 	push	hl
   77ED CD 5A 6B      [17] 3312 	call	_moverEnemigoDerecha
   77F0 F1            [10] 3313 	pop	af
                           3314 ;src/main.c:557: enemy->mover = SI;
   77F1 DD 6E F8      [19] 3315 	ld	l,-8 (ix)
   77F4 DD 66 F9      [19] 3316 	ld	h,-7 (ix)
   77F7 36 01         [10] 3317 	ld	(hl),#0x01
   77F9 18 13         [12] 3318 	jr	00199$
   77FB                    3319 00178$:
                           3320 ;src/main.c:560: moverEnemigoIzquierda(enemy);
   77FB DD 6E F4      [19] 3321 	ld	l,-12 (ix)
   77FE DD 66 F5      [19] 3322 	ld	h,-11 (ix)
   7801 E5            [11] 3323 	push	hl
   7802 CD 6A 6B      [17] 3324 	call	_moverEnemigoIzquierda
   7805 F1            [10] 3325 	pop	af
                           3326 ;src/main.c:561: enemy->mover = SI;
   7806 DD 6E F8      [19] 3327 	ld	l,-8 (ix)
   7809 DD 66 F9      [19] 3328 	ld	h,-7 (ix)
   780C 36 01         [10] 3329 	ld	(hl),#0x01
   780E                    3330 00199$:
   780E DD F9         [10] 3331 	ld	sp, ix
   7810 DD E1         [14] 3332 	pop	ix
   7812 C9            [10] 3333 	ret
                           3334 ;src/main.c:570: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3335 ;	---------------------------------
                           3336 ; Function updateEnemy
                           3337 ; ---------------------------------
   7813                    3338 _updateEnemy::
   7813 DD E5         [15] 3339 	push	ix
   7815 DD 21 00 00   [14] 3340 	ld	ix,#0
   7819 DD 39         [15] 3341 	add	ix,sp
   781B 21 F4 FF      [10] 3342 	ld	hl,#-12
   781E 39            [11] 3343 	add	hl,sp
   781F F9            [ 6] 3344 	ld	sp,hl
                           3345 ;src/main.c:577: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7820 DD 4E 04      [19] 3346 	ld	c,4 (ix)
   7823 DD 46 05      [19] 3347 	ld	b,5 (ix)
   7826 21 16 00      [10] 3348 	ld	hl,#0x0016
   7829 09            [11] 3349 	add	hl,bc
   782A DD 75 F8      [19] 3350 	ld	-8 (ix),l
   782D DD 74 F9      [19] 3351 	ld	-7 (ix),h
   7830 DD 6E F8      [19] 3352 	ld	l,-8 (ix)
   7833 DD 66 F9      [19] 3353 	ld	h,-7 (ix)
   7836 7E            [ 7] 3354 	ld	a,(hl)
   7837 B7            [ 4] 3355 	or	a, a
   7838 28 14         [12] 3356 	jr	Z,00115$
                           3357 ;src/main.c:578: engage(actual, prota.x, prota.y);
   783A 3A E9 63      [13] 3358 	ld	a, (#_prota + 1)
   783D 21 E8 63      [10] 3359 	ld	hl, #_prota + 0
   7840 56            [ 7] 3360 	ld	d,(hl)
   7841 F5            [11] 3361 	push	af
   7842 33            [ 6] 3362 	inc	sp
   7843 D5            [11] 3363 	push	de
   7844 33            [ 6] 3364 	inc	sp
   7845 C5            [11] 3365 	push	bc
   7846 CD 68 70      [17] 3366 	call	_engage
   7849 F1            [10] 3367 	pop	af
   784A F1            [10] 3368 	pop	af
   784B C3 69 79      [10] 3369 	jp	00117$
   784E                    3370 00115$:
                           3371 ;src/main.c:580: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   784E C5            [11] 3372 	push	bc
   784F C5            [11] 3373 	push	bc
   7850 CD C5 6D      [17] 3374 	call	_lookFor
   7853 F1            [10] 3375 	pop	af
   7854 C1            [10] 3376 	pop	bc
                           3377 ;src/main.c:586: actual->patrolling = 0;
   7855 21 0B 00      [10] 3378 	ld	hl,#0x000B
   7858 09            [11] 3379 	add	hl,bc
   7859 DD 75 F6      [19] 3380 	ld	-10 (ix),l
   785C DD 74 F7      [19] 3381 	ld	-9 (ix),h
                           3382 ;src/main.c:581: if (actual->patrolling) {
   785F DD 6E F6      [19] 3383 	ld	l,-10 (ix)
   7862 DD 66 F7      [19] 3384 	ld	h,-9 (ix)
   7865 6E            [ 7] 3385 	ld	l,(hl)
                           3386 ;src/main.c:584: if (actual->in_range) {
   7866 79            [ 4] 3387 	ld	a,c
   7867 C6 11         [ 7] 3388 	add	a, #0x11
   7869 5F            [ 4] 3389 	ld	e,a
   786A 78            [ 4] 3390 	ld	a,b
   786B CE 00         [ 7] 3391 	adc	a, #0x00
   786D 57            [ 4] 3392 	ld	d,a
                           3393 ;src/main.c:592: actual->seek = 1;
   786E 79            [ 4] 3394 	ld	a,c
   786F C6 14         [ 7] 3395 	add	a, #0x14
   7871 DD 77 FD      [19] 3396 	ld	-3 (ix),a
   7874 78            [ 4] 3397 	ld	a,b
   7875 CE 00         [ 7] 3398 	adc	a, #0x00
   7877 DD 77 FE      [19] 3399 	ld	-2 (ix),a
                           3400 ;src/main.c:581: if (actual->patrolling) {
   787A 7D            [ 4] 3401 	ld	a,l
   787B B7            [ 4] 3402 	or	a, a
   787C CA 31 79      [10] 3403 	jp	Z,00112$
                           3404 ;src/main.c:583: moverEnemigoPatrol(actual);
   787F C5            [11] 3405 	push	bc
   7880 D5            [11] 3406 	push	de
   7881 C5            [11] 3407 	push	bc
   7882 CD 7C 6B      [17] 3408 	call	_moverEnemigoPatrol
   7885 F1            [10] 3409 	pop	af
   7886 D1            [10] 3410 	pop	de
   7887 C1            [10] 3411 	pop	bc
                           3412 ;src/main.c:584: if (actual->in_range) {
   7888 1A            [ 7] 3413 	ld	a,(de)
   7889 B7            [ 4] 3414 	or	a, a
   788A 28 24         [12] 3415 	jr	Z,00104$
                           3416 ;src/main.c:585: engage(actual, prota.x, prota.y);
   788C 3A E9 63      [13] 3417 	ld	a, (#_prota + 1)
   788F 21 E8 63      [10] 3418 	ld	hl, #_prota + 0
   7892 56            [ 7] 3419 	ld	d,(hl)
   7893 F5            [11] 3420 	push	af
   7894 33            [ 6] 3421 	inc	sp
   7895 D5            [11] 3422 	push	de
   7896 33            [ 6] 3423 	inc	sp
   7897 C5            [11] 3424 	push	bc
   7898 CD 68 70      [17] 3425 	call	_engage
   789B F1            [10] 3426 	pop	af
   789C F1            [10] 3427 	pop	af
                           3428 ;src/main.c:586: actual->patrolling = 0;
   789D DD 6E F6      [19] 3429 	ld	l,-10 (ix)
   78A0 DD 66 F7      [19] 3430 	ld	h,-9 (ix)
   78A3 36 00         [10] 3431 	ld	(hl),#0x00
                           3432 ;src/main.c:587: actual->engage = 1;
   78A5 DD 6E F8      [19] 3433 	ld	l,-8 (ix)
   78A8 DD 66 F9      [19] 3434 	ld	h,-7 (ix)
   78AB 36 01         [10] 3435 	ld	(hl),#0x01
   78AD C3 69 79      [10] 3436 	jp	00117$
   78B0                    3437 00104$:
                           3438 ;src/main.c:588: } else if (actual->seen) {
   78B0 21 12 00      [10] 3439 	ld	hl,#0x0012
   78B3 09            [11] 3440 	add	hl,bc
   78B4 E3            [19] 3441 	ex	(sp), hl
   78B5 E1            [10] 3442 	pop	hl
   78B6 E5            [11] 3443 	push	hl
   78B7 7E            [ 7] 3444 	ld	a,(hl)
   78B8 B7            [ 4] 3445 	or	a, a
   78B9 CA 69 79      [10] 3446 	jp	Z,00117$
                           3447 ;src/main.c:589: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   78BC 3A E9 63      [13] 3448 	ld	a,(#_prota + 1)
   78BF DD 77 FA      [19] 3449 	ld	-6 (ix),a
   78C2 21 E8 63      [10] 3450 	ld	hl, #_prota + 0
   78C5 5E            [ 7] 3451 	ld	e,(hl)
   78C6 21 01 00      [10] 3452 	ld	hl,#0x0001
   78C9 09            [11] 3453 	add	hl,bc
   78CA DD 75 FB      [19] 3454 	ld	-5 (ix),l
   78CD DD 74 FC      [19] 3455 	ld	-4 (ix),h
   78D0 DD 6E FB      [19] 3456 	ld	l,-5 (ix)
   78D3 DD 66 FC      [19] 3457 	ld	h,-4 (ix)
   78D6 56            [ 7] 3458 	ld	d,(hl)
   78D7 0A            [ 7] 3459 	ld	a,(bc)
   78D8 DD 77 FF      [19] 3460 	ld	-1 (ix),a
   78DB C5            [11] 3461 	push	bc
   78DC 2A C5 64      [16] 3462 	ld	hl,(_mapa)
   78DF E5            [11] 3463 	push	hl
   78E0 C5            [11] 3464 	push	bc
   78E1 DD 7E FA      [19] 3465 	ld	a,-6 (ix)
   78E4 F5            [11] 3466 	push	af
   78E5 33            [ 6] 3467 	inc	sp
   78E6 7B            [ 4] 3468 	ld	a,e
   78E7 F5            [11] 3469 	push	af
   78E8 33            [ 6] 3470 	inc	sp
   78E9 D5            [11] 3471 	push	de
   78EA 33            [ 6] 3472 	inc	sp
   78EB DD 7E FF      [19] 3473 	ld	a,-1 (ix)
   78EE F5            [11] 3474 	push	af
   78EF 33            [ 6] 3475 	inc	sp
   78F0 CD 72 49      [17] 3476 	call	_pathFinding
   78F3 21 08 00      [10] 3477 	ld	hl,#8
   78F6 39            [11] 3478 	add	hl,sp
   78F7 F9            [ 6] 3479 	ld	sp,hl
   78F8 C1            [10] 3480 	pop	bc
                           3481 ;src/main.c:590: actual->p_seek_x = actual->x;
   78F9 21 17 00      [10] 3482 	ld	hl,#0x0017
   78FC 09            [11] 3483 	add	hl,bc
   78FD EB            [ 4] 3484 	ex	de,hl
   78FE 0A            [ 7] 3485 	ld	a,(bc)
   78FF 12            [ 7] 3486 	ld	(de),a
                           3487 ;src/main.c:591: actual->p_seek_y = actual->y;
   7900 21 18 00      [10] 3488 	ld	hl,#0x0018
   7903 09            [11] 3489 	add	hl,bc
   7904 EB            [ 4] 3490 	ex	de,hl
   7905 DD 6E FB      [19] 3491 	ld	l,-5 (ix)
   7908 DD 66 FC      [19] 3492 	ld	h,-4 (ix)
   790B 7E            [ 7] 3493 	ld	a,(hl)
   790C 12            [ 7] 3494 	ld	(de),a
                           3495 ;src/main.c:592: actual->seek = 1;
   790D DD 6E FD      [19] 3496 	ld	l,-3 (ix)
   7910 DD 66 FE      [19] 3497 	ld	h,-2 (ix)
   7913 36 01         [10] 3498 	ld	(hl),#0x01
                           3499 ;src/main.c:593: actual->iter=0;
   7915 21 0E 00      [10] 3500 	ld	hl,#0x000E
   7918 09            [11] 3501 	add	hl,bc
   7919 AF            [ 4] 3502 	xor	a, a
   791A 77            [ 7] 3503 	ld	(hl), a
   791B 23            [ 6] 3504 	inc	hl
   791C 77            [ 7] 3505 	ld	(hl), a
                           3506 ;src/main.c:594: actual->reversePatrol = NO;
   791D 21 0C 00      [10] 3507 	ld	hl,#0x000C
   7920 09            [11] 3508 	add	hl,bc
   7921 36 00         [10] 3509 	ld	(hl),#0x00
                           3510 ;src/main.c:595: actual->patrolling = 0;
   7923 DD 6E F6      [19] 3511 	ld	l,-10 (ix)
   7926 DD 66 F7      [19] 3512 	ld	h,-9 (ix)
   7929 36 00         [10] 3513 	ld	(hl),#0x00
                           3514 ;src/main.c:596: actual->seen = 0;
   792B E1            [10] 3515 	pop	hl
   792C E5            [11] 3516 	push	hl
   792D 36 00         [10] 3517 	ld	(hl),#0x00
   792F 18 38         [12] 3518 	jr	00117$
   7931                    3519 00112$:
                           3520 ;src/main.c:598: } else if (actual->seek) {
   7931 DD 6E FD      [19] 3521 	ld	l,-3 (ix)
   7934 DD 66 FE      [19] 3522 	ld	h,-2 (ix)
   7937 7E            [ 7] 3523 	ld	a,(hl)
   7938 B7            [ 4] 3524 	or	a, a
   7939 28 2E         [12] 3525 	jr	Z,00117$
                           3526 ;src/main.c:599: moverEnemigoSeek(actual);
   793B C5            [11] 3527 	push	bc
   793C D5            [11] 3528 	push	de
   793D C5            [11] 3529 	push	bc
   793E CD CB 6E      [17] 3530 	call	_moverEnemigoSeek
   7941 F1            [10] 3531 	pop	af
   7942 D1            [10] 3532 	pop	de
   7943 C1            [10] 3533 	pop	bc
                           3534 ;src/main.c:600: if (actual->in_range) {
   7944 1A            [ 7] 3535 	ld	a,(de)
   7945 B7            [ 4] 3536 	or	a, a
   7946 28 21         [12] 3537 	jr	Z,00117$
                           3538 ;src/main.c:601: engage(actual, prota.x, prota.y);
   7948 3A E9 63      [13] 3539 	ld	a, (#_prota + 1)
   794B 21 E8 63      [10] 3540 	ld	hl, #_prota + 0
   794E 56            [ 7] 3541 	ld	d,(hl)
   794F F5            [11] 3542 	push	af
   7950 33            [ 6] 3543 	inc	sp
   7951 D5            [11] 3544 	push	de
   7952 33            [ 6] 3545 	inc	sp
   7953 C5            [11] 3546 	push	bc
   7954 CD 68 70      [17] 3547 	call	_engage
   7957 F1            [10] 3548 	pop	af
   7958 F1            [10] 3549 	pop	af
                           3550 ;src/main.c:602: actual->seek = 0;
   7959 DD 6E FD      [19] 3551 	ld	l,-3 (ix)
   795C DD 66 FE      [19] 3552 	ld	h,-2 (ix)
   795F 36 00         [10] 3553 	ld	(hl),#0x00
                           3554 ;src/main.c:603: actual->engage = 1;
   7961 DD 6E F8      [19] 3555 	ld	l,-8 (ix)
   7964 DD 66 F9      [19] 3556 	ld	h,-7 (ix)
   7967 36 01         [10] 3557 	ld	(hl),#0x01
                           3558 ;src/main.c:604: } else if (actual->seen) {
   7969                    3559 00117$:
   7969 DD F9         [10] 3560 	ld	sp, ix
   796B DD E1         [14] 3561 	pop	ix
   796D C9            [10] 3562 	ret
                           3563 ;src/main.c:611: void inicializarEnemy() {
                           3564 ;	---------------------------------
                           3565 ; Function inicializarEnemy
                           3566 ; ---------------------------------
   796E                    3567 _inicializarEnemy::
   796E DD E5         [15] 3568 	push	ix
   7970 DD 21 00 00   [14] 3569 	ld	ix,#0
   7974 DD 39         [15] 3570 	add	ix,sp
   7976 21 F9 FF      [10] 3571 	ld	hl,#-7
   7979 39            [11] 3572 	add	hl,sp
   797A F9            [ 6] 3573 	ld	sp,hl
                           3574 ;src/main.c:612: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   797B 3A C7 64      [13] 3575 	ld	a,(#_num_mapa + 0)
   797E C6 02         [ 7] 3576 	add	a, #0x02
   7980 DD 77 FA      [19] 3577 	ld	-6 (ix),a
                           3578 ;src/main.c:622: actual = enemy;
   7983 11 60 60      [10] 3579 	ld	de,#_enemy+0
                           3580 ;src/main.c:623: while(i){
   7986                    3581 00101$:
   7986 DD 7E FA      [19] 3582 	ld	a,-6 (ix)
   7989 B7            [ 4] 3583 	or	a, a
   798A CA 7C 7A      [10] 3584 	jp	Z,00104$
                           3585 ;src/main.c:624: --i;
   798D DD 35 FA      [23] 3586 	dec	-6 (ix)
                           3587 ;src/main.c:625: actual->x = actual->px = spawnX[i];
   7990 4B            [ 4] 3588 	ld	c, e
   7991 42            [ 4] 3589 	ld	b, d
   7992 03            [ 6] 3590 	inc	bc
   7993 03            [ 6] 3591 	inc	bc
   7994 3E EB         [ 7] 3592 	ld	a,#<(_spawnX)
   7996 DD 86 FA      [19] 3593 	add	a, -6 (ix)
   7999 DD 77 FC      [19] 3594 	ld	-4 (ix),a
   799C 3E 64         [ 7] 3595 	ld	a,#>(_spawnX)
   799E CE 00         [ 7] 3596 	adc	a, #0x00
   79A0 DD 77 FD      [19] 3597 	ld	-3 (ix),a
   79A3 DD 6E FC      [19] 3598 	ld	l,-4 (ix)
   79A6 DD 66 FD      [19] 3599 	ld	h,-3 (ix)
   79A9 7E            [ 7] 3600 	ld	a,(hl)
   79AA 02            [ 7] 3601 	ld	(bc),a
   79AB 12            [ 7] 3602 	ld	(de),a
                           3603 ;src/main.c:626: actual->y = actual->py = spawnY[i];
   79AC D5            [11] 3604 	push	de
   79AD FD E1         [14] 3605 	pop	iy
   79AF FD 23         [10] 3606 	inc	iy
   79B1 4B            [ 4] 3607 	ld	c, e
   79B2 42            [ 4] 3608 	ld	b, d
   79B3 03            [ 6] 3609 	inc	bc
   79B4 03            [ 6] 3610 	inc	bc
   79B5 03            [ 6] 3611 	inc	bc
   79B6 3E EF         [ 7] 3612 	ld	a,#<(_spawnY)
   79B8 DD 86 FA      [19] 3613 	add	a, -6 (ix)
   79BB DD 77 FE      [19] 3614 	ld	-2 (ix),a
   79BE 3E 64         [ 7] 3615 	ld	a,#>(_spawnY)
   79C0 CE 00         [ 7] 3616 	adc	a, #0x00
   79C2 DD 77 FF      [19] 3617 	ld	-1 (ix),a
   79C5 DD 6E FE      [19] 3618 	ld	l,-2 (ix)
   79C8 DD 66 FF      [19] 3619 	ld	h,-1 (ix)
   79CB 7E            [ 7] 3620 	ld	a,(hl)
   79CC 02            [ 7] 3621 	ld	(bc),a
   79CD FD 77 00      [19] 3622 	ld	0 (iy), a
                           3623 ;src/main.c:627: actual->mover  = NO;
   79D0 21 06 00      [10] 3624 	ld	hl,#0x0006
   79D3 19            [11] 3625 	add	hl,de
   79D4 36 00         [10] 3626 	ld	(hl),#0x00
                           3627 ;src/main.c:628: actual->mira   = M_abajo;
   79D6 21 07 00      [10] 3628 	ld	hl,#0x0007
   79D9 19            [11] 3629 	add	hl,de
   79DA 36 03         [10] 3630 	ld	(hl),#0x03
                           3631 ;src/main.c:629: actual->sprite = g_enemy;
   79DC 21 04 00      [10] 3632 	ld	hl,#0x0004
   79DF 19            [11] 3633 	add	hl,de
   79E0 36 3A         [10] 3634 	ld	(hl),#<(_g_enemy)
   79E2 23            [ 6] 3635 	inc	hl
   79E3 36 3C         [10] 3636 	ld	(hl),#>(_g_enemy)
                           3637 ;src/main.c:630: actual->muerto = NO;
   79E5 21 08 00      [10] 3638 	ld	hl,#0x0008
   79E8 19            [11] 3639 	add	hl,de
   79E9 36 00         [10] 3640 	ld	(hl),#0x00
                           3641 ;src/main.c:631: actual->muertes = 0;
   79EB 21 0A 00      [10] 3642 	ld	hl,#0x000A
   79EE 19            [11] 3643 	add	hl,de
   79EF 36 00         [10] 3644 	ld	(hl),#0x00
                           3645 ;src/main.c:632: actual->patrolling = SI;
   79F1 21 0B 00      [10] 3646 	ld	hl,#0x000B
   79F4 19            [11] 3647 	add	hl,de
   79F5 36 01         [10] 3648 	ld	(hl),#0x01
                           3649 ;src/main.c:633: actual->reversePatrol = NO;
   79F7 21 0C 00      [10] 3650 	ld	hl,#0x000C
   79FA 19            [11] 3651 	add	hl,de
   79FB 36 00         [10] 3652 	ld	(hl),#0x00
                           3653 ;src/main.c:634: actual->iter = 0;
   79FD 21 0E 00      [10] 3654 	ld	hl,#0x000E
   7A00 19            [11] 3655 	add	hl,de
   7A01 AF            [ 4] 3656 	xor	a, a
   7A02 77            [ 7] 3657 	ld	(hl), a
   7A03 23            [ 6] 3658 	inc	hl
   7A04 77            [ 7] 3659 	ld	(hl), a
                           3660 ;src/main.c:635: actual->lastIter = 0;
   7A05 21 10 00      [10] 3661 	ld	hl,#0x0010
   7A08 19            [11] 3662 	add	hl,de
   7A09 36 00         [10] 3663 	ld	(hl),#0x00
                           3664 ;src/main.c:636: actual->seen = 0;
   7A0B 21 12 00      [10] 3665 	ld	hl,#0x0012
   7A0E 19            [11] 3666 	add	hl,de
   7A0F 36 00         [10] 3667 	ld	(hl),#0x00
                           3668 ;src/main.c:637: actual->found = 0;
   7A11 21 13 00      [10] 3669 	ld	hl,#0x0013
   7A14 19            [11] 3670 	add	hl,de
   7A15 36 00         [10] 3671 	ld	(hl),#0x00
                           3672 ;src/main.c:638: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7A17 21 C7 64      [10] 3673 	ld	hl,#_num_mapa + 0
   7A1A 4E            [ 7] 3674 	ld	c, (hl)
   7A1B 0C            [ 4] 3675 	inc	c
   7A1C 06 00         [ 7] 3676 	ld	b,#0x00
   7A1E 69            [ 4] 3677 	ld	l, c
   7A1F 60            [ 4] 3678 	ld	h, b
   7A20 29            [11] 3679 	add	hl, hl
   7A21 29            [11] 3680 	add	hl, hl
   7A22 09            [11] 3681 	add	hl, bc
   7A23 4D            [ 4] 3682 	ld	c,l
   7A24 44            [ 4] 3683 	ld	b,h
   7A25 21 07 65      [10] 3684 	ld	hl,#_patrolY
   7A28 09            [11] 3685 	add	hl,bc
   7A29 7D            [ 4] 3686 	ld	a,l
   7A2A DD 86 FA      [19] 3687 	add	a, -6 (ix)
   7A2D 6F            [ 4] 3688 	ld	l,a
   7A2E 7C            [ 4] 3689 	ld	a,h
   7A2F CE 00         [ 7] 3690 	adc	a, #0x00
   7A31 67            [ 4] 3691 	ld	h,a
   7A32 7E            [ 7] 3692 	ld	a,(hl)
   7A33 DD 77 FB      [19] 3693 	ld	-5 (ix),a
   7A36 21 F3 64      [10] 3694 	ld	hl,#_patrolX
   7A39 09            [11] 3695 	add	hl,bc
   7A3A DD 4E FA      [19] 3696 	ld	c,-6 (ix)
   7A3D 06 00         [ 7] 3697 	ld	b,#0x00
   7A3F 09            [11] 3698 	add	hl,bc
   7A40 7E            [ 7] 3699 	ld	a,(hl)
   7A41 DD 77 F9      [19] 3700 	ld	-7 (ix),a
   7A44 DD 6E FE      [19] 3701 	ld	l,-2 (ix)
   7A47 DD 66 FF      [19] 3702 	ld	h,-1 (ix)
   7A4A 4E            [ 7] 3703 	ld	c,(hl)
   7A4B DD 6E FC      [19] 3704 	ld	l,-4 (ix)
   7A4E DD 66 FD      [19] 3705 	ld	h,-3 (ix)
   7A51 46            [ 7] 3706 	ld	b,(hl)
   7A52 D5            [11] 3707 	push	de
   7A53 2A C5 64      [16] 3708 	ld	hl,(_mapa)
   7A56 E5            [11] 3709 	push	hl
   7A57 D5            [11] 3710 	push	de
   7A58 DD 66 FB      [19] 3711 	ld	h,-5 (ix)
   7A5B DD 6E F9      [19] 3712 	ld	l,-7 (ix)
   7A5E E5            [11] 3713 	push	hl
   7A5F 79            [ 4] 3714 	ld	a,c
   7A60 F5            [11] 3715 	push	af
   7A61 33            [ 6] 3716 	inc	sp
   7A62 C5            [11] 3717 	push	bc
   7A63 33            [ 6] 3718 	inc	sp
   7A64 CD 72 49      [17] 3719 	call	_pathFinding
   7A67 21 08 00      [10] 3720 	ld	hl,#8
   7A6A 39            [11] 3721 	add	hl,sp
   7A6B F9            [ 6] 3722 	ld	sp,hl
   7A6C D1            [10] 3723 	pop	de
                           3724 ;src/main.c:639: dibujarEnemigo(actual);
   7A6D D5            [11] 3725 	push	de
   7A6E D5            [11] 3726 	push	de
   7A6F CD A1 67      [17] 3727 	call	_dibujarEnemigo
   7A72 F1            [10] 3728 	pop	af
   7A73 D1            [10] 3729 	pop	de
                           3730 ;src/main.c:640: ++actual;
   7A74 21 E2 00      [10] 3731 	ld	hl,#0x00E2
   7A77 19            [11] 3732 	add	hl,de
   7A78 EB            [ 4] 3733 	ex	de,hl
   7A79 C3 86 79      [10] 3734 	jp	00101$
   7A7C                    3735 00104$:
   7A7C DD F9         [10] 3736 	ld	sp, ix
   7A7E DD E1         [14] 3737 	pop	ix
   7A80 C9            [10] 3738 	ret
                           3739 ;src/main.c:644: void avanzarMapa() {
                           3740 ;	---------------------------------
                           3741 ; Function avanzarMapa
                           3742 ; ---------------------------------
   7A81                    3743 _avanzarMapa::
                           3744 ;src/main.c:645: if(num_mapa < NUM_MAPAS -1) {
   7A81 3A C7 64      [13] 3745 	ld	a,(#_num_mapa + 0)
   7A84 D6 02         [ 7] 3746 	sub	a, #0x02
   7A86 30 34         [12] 3747 	jr	NC,00102$
                           3748 ;src/main.c:646: mapa = mapas[++num_mapa];
   7A88 01 E5 64      [10] 3749 	ld	bc,#_mapas+0
   7A8B 21 C7 64      [10] 3750 	ld	hl, #_num_mapa+0
   7A8E 34            [11] 3751 	inc	(hl)
   7A8F FD 21 C7 64   [14] 3752 	ld	iy,#_num_mapa
   7A93 FD 6E 00      [19] 3753 	ld	l,0 (iy)
   7A96 26 00         [ 7] 3754 	ld	h,#0x00
   7A98 29            [11] 3755 	add	hl, hl
   7A99 09            [11] 3756 	add	hl,bc
   7A9A 7E            [ 7] 3757 	ld	a,(hl)
   7A9B FD 21 C5 64   [14] 3758 	ld	iy,#_mapa
   7A9F FD 77 00      [19] 3759 	ld	0 (iy),a
   7AA2 23            [ 6] 3760 	inc	hl
   7AA3 7E            [ 7] 3761 	ld	a,(hl)
   7AA4 32 C6 64      [13] 3762 	ld	(#_mapa + 1),a
                           3763 ;src/main.c:647: prota.x = prota.px = 2;
   7AA7 21 EA 63      [10] 3764 	ld	hl,#(_prota + 0x0002)
   7AAA 36 02         [10] 3765 	ld	(hl),#0x02
   7AAC 21 E8 63      [10] 3766 	ld	hl,#_prota
   7AAF 36 02         [10] 3767 	ld	(hl),#0x02
                           3768 ;src/main.c:648: prota.mover = SI;
   7AB1 21 EE 63      [10] 3769 	ld	hl,#(_prota + 0x0006)
   7AB4 36 01         [10] 3770 	ld	(hl),#0x01
                           3771 ;src/main.c:649: dibujarMapa();
   7AB6 CD CF 64      [17] 3772 	call	_dibujarMapa
                           3773 ;src/main.c:650: inicializarEnemy();
   7AB9 C3 6E 79      [10] 3774 	jp  _inicializarEnemy
   7ABC                    3775 00102$:
                           3776 ;src/main.c:653: menuFin(puntuacion);
   7ABC FD 21 C8 64   [14] 3777 	ld	iy,#_puntuacion
   7AC0 FD 6E 00      [19] 3778 	ld	l,0 (iy)
   7AC3 26 00         [ 7] 3779 	ld	h,#0x00
   7AC5 C3 A0 4B      [10] 3780 	jp  _menuFin
                           3781 ;src/main.c:657: void moverIzquierda() {
                           3782 ;	---------------------------------
                           3783 ; Function moverIzquierda
                           3784 ; ---------------------------------
   7AC8                    3785 _moverIzquierda::
                           3786 ;src/main.c:658: prota.mira = M_izquierda;
   7AC8 01 E8 63      [10] 3787 	ld	bc,#_prota+0
   7ACB 21 EF 63      [10] 3788 	ld	hl,#(_prota + 0x0007)
   7ACE 36 01         [10] 3789 	ld	(hl),#0x01
                           3790 ;src/main.c:659: if (!checkCollision(M_izquierda)) {
   7AD0 C5            [11] 3791 	push	bc
   7AD1 3E 01         [ 7] 3792 	ld	a,#0x01
   7AD3 F5            [11] 3793 	push	af
   7AD4 33            [ 6] 3794 	inc	sp
   7AD5 CD 30 66      [17] 3795 	call	_checkCollision
   7AD8 33            [ 6] 3796 	inc	sp
   7AD9 C1            [10] 3797 	pop	bc
   7ADA 7D            [ 4] 3798 	ld	a,l
   7ADB B7            [ 4] 3799 	or	a, a
   7ADC C0            [11] 3800 	ret	NZ
                           3801 ;src/main.c:660: prota.x--;
   7ADD 0A            [ 7] 3802 	ld	a,(bc)
   7ADE C6 FF         [ 7] 3803 	add	a,#0xFF
   7AE0 02            [ 7] 3804 	ld	(bc),a
                           3805 ;src/main.c:661: prota.mover = SI;
   7AE1 21 EE 63      [10] 3806 	ld	hl,#(_prota + 0x0006)
   7AE4 36 01         [10] 3807 	ld	(hl),#0x01
                           3808 ;src/main.c:662: prota.sprite = g_hero_left;
   7AE6 21 C6 3D      [10] 3809 	ld	hl,#_g_hero_left
   7AE9 22 EC 63      [16] 3810 	ld	((_prota + 0x0004)), hl
   7AEC C9            [10] 3811 	ret
                           3812 ;src/main.c:666: void moverDerecha() {
                           3813 ;	---------------------------------
                           3814 ; Function moverDerecha
                           3815 ; ---------------------------------
   7AED                    3816 _moverDerecha::
                           3817 ;src/main.c:667: prota.mira = M_derecha;
   7AED 21 EF 63      [10] 3818 	ld	hl,#(_prota + 0x0007)
   7AF0 36 00         [10] 3819 	ld	(hl),#0x00
                           3820 ;src/main.c:668: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7AF2 AF            [ 4] 3821 	xor	a, a
   7AF3 F5            [11] 3822 	push	af
   7AF4 33            [ 6] 3823 	inc	sp
   7AF5 CD 30 66      [17] 3824 	call	_checkCollision
   7AF8 33            [ 6] 3825 	inc	sp
   7AF9 45            [ 4] 3826 	ld	b,l
   7AFA 21 E8 63      [10] 3827 	ld	hl, #_prota + 0
   7AFD 4E            [ 7] 3828 	ld	c,(hl)
   7AFE 59            [ 4] 3829 	ld	e,c
   7AFF 16 00         [ 7] 3830 	ld	d,#0x00
   7B01 21 07 00      [10] 3831 	ld	hl,#0x0007
   7B04 19            [11] 3832 	add	hl,de
   7B05 11 50 80      [10] 3833 	ld	de, #0x8050
   7B08 29            [11] 3834 	add	hl, hl
   7B09 3F            [ 4] 3835 	ccf
   7B0A CB 1C         [ 8] 3836 	rr	h
   7B0C CB 1D         [ 8] 3837 	rr	l
   7B0E ED 52         [15] 3838 	sbc	hl, de
   7B10 3E 00         [ 7] 3839 	ld	a,#0x00
   7B12 17            [ 4] 3840 	rla
   7B13 5F            [ 4] 3841 	ld	e,a
   7B14 78            [ 4] 3842 	ld	a,b
   7B15 B7            [ 4] 3843 	or	a,a
   7B16 20 14         [12] 3844 	jr	NZ,00104$
   7B18 B3            [ 4] 3845 	or	a,e
   7B19 28 11         [12] 3846 	jr	Z,00104$
                           3847 ;src/main.c:669: prota.x++;
   7B1B 0C            [ 4] 3848 	inc	c
   7B1C 21 E8 63      [10] 3849 	ld	hl,#_prota
   7B1F 71            [ 7] 3850 	ld	(hl),c
                           3851 ;src/main.c:670: prota.mover = SI;
   7B20 21 EE 63      [10] 3852 	ld	hl,#(_prota + 0x0006)
   7B23 36 01         [10] 3853 	ld	(hl),#0x01
                           3854 ;src/main.c:671: prota.sprite = g_hero;
   7B25 21 70 3E      [10] 3855 	ld	hl,#_g_hero
   7B28 22 EC 63      [16] 3856 	ld	((_prota + 0x0004)), hl
   7B2B C9            [10] 3857 	ret
   7B2C                    3858 00104$:
                           3859 ;src/main.c:672: }else if( prota.x + G_HERO_W >= 80){
   7B2C 7B            [ 4] 3860 	ld	a,e
   7B2D B7            [ 4] 3861 	or	a, a
   7B2E C0            [11] 3862 	ret	NZ
                           3863 ;src/main.c:673: avanzarMapa();
   7B2F C3 81 7A      [10] 3864 	jp  _avanzarMapa
                           3865 ;src/main.c:677: void moverArriba() {
                           3866 ;	---------------------------------
                           3867 ; Function moverArriba
                           3868 ; ---------------------------------
   7B32                    3869 _moverArriba::
                           3870 ;src/main.c:678: prota.mira = M_arriba;
   7B32 21 EF 63      [10] 3871 	ld	hl,#(_prota + 0x0007)
   7B35 36 02         [10] 3872 	ld	(hl),#0x02
                           3873 ;src/main.c:679: if (!checkCollision(M_arriba)) {
   7B37 3E 02         [ 7] 3874 	ld	a,#0x02
   7B39 F5            [11] 3875 	push	af
   7B3A 33            [ 6] 3876 	inc	sp
   7B3B CD 30 66      [17] 3877 	call	_checkCollision
   7B3E 33            [ 6] 3878 	inc	sp
   7B3F 7D            [ 4] 3879 	ld	a,l
   7B40 B7            [ 4] 3880 	or	a, a
   7B41 C0            [11] 3881 	ret	NZ
                           3882 ;src/main.c:680: prota.y--;
   7B42 21 E9 63      [10] 3883 	ld	hl,#_prota + 1
   7B45 4E            [ 7] 3884 	ld	c,(hl)
   7B46 0D            [ 4] 3885 	dec	c
   7B47 71            [ 7] 3886 	ld	(hl),c
                           3887 ;src/main.c:681: prota.y--;
   7B48 0D            [ 4] 3888 	dec	c
   7B49 71            [ 7] 3889 	ld	(hl),c
                           3890 ;src/main.c:682: prota.mover  = SI;
   7B4A 21 EE 63      [10] 3891 	ld	hl,#(_prota + 0x0006)
   7B4D 36 01         [10] 3892 	ld	(hl),#0x01
                           3893 ;src/main.c:683: prota.sprite = g_hero_up;
   7B4F 21 2C 3D      [10] 3894 	ld	hl,#_g_hero_up
   7B52 22 EC 63      [16] 3895 	ld	((_prota + 0x0004)), hl
   7B55 C9            [10] 3896 	ret
                           3897 ;src/main.c:687: void moverAbajo() {
                           3898 ;	---------------------------------
                           3899 ; Function moverAbajo
                           3900 ; ---------------------------------
   7B56                    3901 _moverAbajo::
                           3902 ;src/main.c:688: prota.mira = M_abajo;
   7B56 21 EF 63      [10] 3903 	ld	hl,#(_prota + 0x0007)
   7B59 36 03         [10] 3904 	ld	(hl),#0x03
                           3905 ;src/main.c:689: if (!checkCollision(M_abajo) ) {
   7B5B 3E 03         [ 7] 3906 	ld	a,#0x03
   7B5D F5            [11] 3907 	push	af
   7B5E 33            [ 6] 3908 	inc	sp
   7B5F CD 30 66      [17] 3909 	call	_checkCollision
   7B62 33            [ 6] 3910 	inc	sp
   7B63 7D            [ 4] 3911 	ld	a,l
   7B64 B7            [ 4] 3912 	or	a, a
   7B65 C0            [11] 3913 	ret	NZ
                           3914 ;src/main.c:690: prota.y++;
   7B66 01 E9 63      [10] 3915 	ld	bc,#_prota + 1
   7B69 0A            [ 7] 3916 	ld	a,(bc)
   7B6A 3C            [ 4] 3917 	inc	a
   7B6B 02            [ 7] 3918 	ld	(bc),a
                           3919 ;src/main.c:691: prota.y++;
   7B6C 3C            [ 4] 3920 	inc	a
   7B6D 02            [ 7] 3921 	ld	(bc),a
                           3922 ;src/main.c:692: prota.mover  = SI;
   7B6E 21 EE 63      [10] 3923 	ld	hl,#(_prota + 0x0006)
   7B71 36 01         [10] 3924 	ld	(hl),#0x01
                           3925 ;src/main.c:693: prota.sprite = g_hero_down;
   7B73 21 92 3C      [10] 3926 	ld	hl,#_g_hero_down
   7B76 22 EC 63      [16] 3927 	ld	((_prota + 0x0004)), hl
   7B79 C9            [10] 3928 	ret
                           3929 ;src/main.c:700: void intHandler() {
                           3930 ;	---------------------------------
                           3931 ; Function intHandler
                           3932 ; ---------------------------------
   7B7A                    3933 _intHandler::
                           3934 ;src/main.c:701: if (++i == 6) {
   7B7A 21 FB 63      [10] 3935 	ld	hl, #_i+0
   7B7D 34            [11] 3936 	inc	(hl)
   7B7E 3A FB 63      [13] 3937 	ld	a,(#_i + 0)
   7B81 D6 06         [ 7] 3938 	sub	a, #0x06
   7B83 C0            [11] 3939 	ret	NZ
                           3940 ;src/main.c:702: play();
   7B84 CD 34 53      [17] 3941 	call	_play
                           3942 ;src/main.c:703: i=0;
   7B87 21 FB 63      [10] 3943 	ld	hl,#_i + 0
   7B8A 36 00         [10] 3944 	ld	(hl), #0x00
   7B8C C9            [10] 3945 	ret
                           3946 ;src/main.c:707: void inicializarCPC() {
                           3947 ;	---------------------------------
                           3948 ; Function inicializarCPC
                           3949 ; ---------------------------------
   7B8D                    3950 _inicializarCPC::
                           3951 ;src/main.c:708: cpct_disableFirmware();
   7B8D CD DB 56      [17] 3952 	call	_cpct_disableFirmware
                           3953 ;src/main.c:709: cpct_setVideoMode(0);
   7B90 2E 00         [ 7] 3954 	ld	l,#0x00
   7B92 CD AF 56      [17] 3955 	call	_cpct_setVideoMode
                           3956 ;src/main.c:710: cpct_setBorder(HW_BLACK);
   7B95 21 10 14      [10] 3957 	ld	hl,#0x1410
   7B98 E5            [11] 3958 	push	hl
   7B99 CD 12 54      [17] 3959 	call	_cpct_setPALColour
                           3960 ;src/main.c:711: cpct_setPalette(g_palette, 16);
   7B9C 21 10 00      [10] 3961 	ld	hl,#0x0010
   7B9F E5            [11] 3962 	push	hl
   7BA0 21 60 3E      [10] 3963 	ld	hl,#_g_palette
   7BA3 E5            [11] 3964 	push	hl
   7BA4 CD EF 53      [17] 3965 	call	_cpct_setPalette
   7BA7 C9            [10] 3966 	ret
                           3967 ;src/main.c:716: void inicializarJuego() {
                           3968 ;	---------------------------------
                           3969 ; Function inicializarJuego
                           3970 ; ---------------------------------
   7BA8                    3971 _inicializarJuego::
                           3972 ;src/main.c:718: num_mapa = 0;
   7BA8 21 C7 64      [10] 3973 	ld	hl,#_num_mapa + 0
   7BAB 36 00         [10] 3974 	ld	(hl), #0x00
                           3975 ;src/main.c:719: mapa = mapas[num_mapa];
   7BAD 21 E5 64      [10] 3976 	ld	hl, #_mapas + 0
   7BB0 7E            [ 7] 3977 	ld	a,(hl)
   7BB1 FD 21 C5 64   [14] 3978 	ld	iy,#_mapa
   7BB5 FD 77 00      [19] 3979 	ld	0 (iy),a
   7BB8 23            [ 6] 3980 	inc	hl
   7BB9 7E            [ 7] 3981 	ld	a,(hl)
   7BBA 32 C6 64      [13] 3982 	ld	(#_mapa + 1),a
                           3983 ;src/main.c:720: cpct_etm_setTileset2x4(g_tileset);
   7BBD 21 E0 17      [10] 3984 	ld	hl,#_g_tileset
   7BC0 CD 03 56      [17] 3985 	call	_cpct_etm_setTileset2x4
                           3986 ;src/main.c:722: dibujarMapa();
   7BC3 CD CF 64      [17] 3987 	call	_dibujarMapa
                           3988 ;src/main.c:725: barraPuntuacionInicial();
   7BC6 CD 40 51      [17] 3989 	call	_barraPuntuacionInicial
                           3990 ;src/main.c:728: prota.x = prota.px = 4;
   7BC9 21 EA 63      [10] 3991 	ld	hl,#(_prota + 0x0002)
   7BCC 36 04         [10] 3992 	ld	(hl),#0x04
   7BCE 21 E8 63      [10] 3993 	ld	hl,#_prota
   7BD1 36 04         [10] 3994 	ld	(hl),#0x04
                           3995 ;src/main.c:729: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7BD3 21 EB 63      [10] 3996 	ld	hl,#(_prota + 0x0003)
   7BD6 36 68         [10] 3997 	ld	(hl),#0x68
   7BD8 21 E9 63      [10] 3998 	ld	hl,#(_prota + 0x0001)
   7BDB 36 68         [10] 3999 	ld	(hl),#0x68
                           4000 ;src/main.c:730: prota.mover  = NO;
   7BDD 21 EE 63      [10] 4001 	ld	hl,#(_prota + 0x0006)
   7BE0 36 00         [10] 4002 	ld	(hl),#0x00
                           4003 ;src/main.c:731: prota.mira=M_derecha;
   7BE2 21 EF 63      [10] 4004 	ld	hl,#(_prota + 0x0007)
   7BE5 36 00         [10] 4005 	ld	(hl),#0x00
                           4006 ;src/main.c:732: prota.sprite = g_hero;
   7BE7 21 70 3E      [10] 4007 	ld	hl,#_g_hero
   7BEA 22 EC 63      [16] 4008 	ld	((_prota + 0x0004)), hl
                           4009 ;src/main.c:736: cu.x = cu.px = 0;
   7BED 21 F2 63      [10] 4010 	ld	hl,#(_cu + 0x0002)
   7BF0 36 00         [10] 4011 	ld	(hl),#0x00
   7BF2 21 F0 63      [10] 4012 	ld	hl,#_cu
   7BF5 36 00         [10] 4013 	ld	(hl),#0x00
                           4014 ;src/main.c:737: cu.y = cu.py = 0;
   7BF7 21 F3 63      [10] 4015 	ld	hl,#(_cu + 0x0003)
   7BFA 36 00         [10] 4016 	ld	(hl),#0x00
   7BFC 21 F1 63      [10] 4017 	ld	hl,#(_cu + 0x0001)
   7BFF 36 00         [10] 4018 	ld	(hl),#0x00
                           4019 ;src/main.c:738: cu.lanzado = NO;
   7C01 21 F6 63      [10] 4020 	ld	hl,#(_cu + 0x0006)
   7C04 36 00         [10] 4021 	ld	(hl),#0x00
                           4022 ;src/main.c:739: cu.mover = NO;
   7C06 21 F9 63      [10] 4023 	ld	hl,#(_cu + 0x0009)
   7C09 36 00         [10] 4024 	ld	(hl),#0x00
                           4025 ;src/main.c:740: cu.off_bound = NO;
   7C0B 21 FA 63      [10] 4026 	ld	hl,#(_cu + 0x000a)
   7C0E 36 00         [10] 4027 	ld	(hl),#0x00
                           4028 ;src/main.c:742: inicializarEnemy();
   7C10 CD 6E 79      [17] 4029 	call	_inicializarEnemy
                           4030 ;src/main.c:744: dibujarProta();
   7C13 C3 1B 65      [10] 4031 	jp  _dibujarProta
                           4032 ;src/main.c:747: void main(void) {
                           4033 ;	---------------------------------
                           4034 ; Function main
                           4035 ; ---------------------------------
   7C16                    4036 _main::
   7C16 DD E5         [15] 4037 	push	ix
   7C18 DD 21 00 00   [14] 4038 	ld	ix,#0
   7C1C DD 39         [15] 4039 	add	ix,sp
   7C1E 21 F9 FF      [10] 4040 	ld	hl,#-7
   7C21 39            [11] 4041 	add	hl,sp
   7C22 F9            [ 6] 4042 	ld	sp,hl
                           4043 ;src/main.c:752: inicializarCPC();
   7C23 CD 8D 7B      [17] 4044 	call	_inicializarCPC
                           4045 ;src/main.c:754: menuInicio();
   7C26 CD 61 50      [17] 4046 	call	_menuInicio
                           4047 ;src/main.c:756: inicializarJuego();
   7C29 CD A8 7B      [17] 4048 	call	_inicializarJuego
                           4049 ;src/main.c:760: while (1) {
   7C2C                    4050 00126$:
                           4051 ;src/main.c:762: i = 2 + num_mapa;
   7C2C 21 C7 64      [10] 4052 	ld	hl,#_num_mapa + 0
   7C2F 4E            [ 7] 4053 	ld	c, (hl)
   7C30 0C            [ 4] 4054 	inc	c
   7C31 0C            [ 4] 4055 	inc	c
                           4056 ;src/main.c:763: actual = enemy;
                           4057 ;src/main.c:765: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7C32 C5            [11] 4058 	push	bc
   7C33 21 00 01      [10] 4059 	ld	hl,#_g_tablatrans
   7C36 E5            [11] 4060 	push	hl
   7C37 2A C5 64      [16] 4061 	ld	hl,(_mapa)
   7C3A E5            [11] 4062 	push	hl
   7C3B 21 E8 63      [10] 4063 	ld	hl,#_prota
   7C3E E5            [11] 4064 	push	hl
   7C3F 21 F0 63      [10] 4065 	ld	hl,#_cu
   7C42 E5            [11] 4066 	push	hl
   7C43 CD C9 65      [17] 4067 	call	_comprobarTeclado
   7C46 21 08 00      [10] 4068 	ld	hl,#8
   7C49 39            [11] 4069 	add	hl,sp
   7C4A F9            [ 6] 4070 	ld	sp,hl
   7C4B 2A C5 64      [16] 4071 	ld	hl,(_mapa)
   7C4E E5            [11] 4072 	push	hl
   7C4F 21 F0 63      [10] 4073 	ld	hl,#_cu
   7C52 E5            [11] 4074 	push	hl
   7C53 CD 15 43      [17] 4075 	call	_moverCuchillo
   7C56 F1            [10] 4076 	pop	af
   7C57 F1            [10] 4077 	pop	af
   7C58 C1            [10] 4078 	pop	bc
                           4079 ;src/main.c:767: while(i){
   7C59 DD 71 FB      [19] 4080 	ld	-5 (ix),c
   7C5C DD 36 F9 60   [19] 4081 	ld	-7 (ix),#<(_enemy)
   7C60 DD 36 FA 60   [19] 4082 	ld	-6 (ix),#>(_enemy)
   7C64                    4083 00105$:
   7C64 DD 7E FB      [19] 4084 	ld	a,-5 (ix)
   7C67 B7            [ 4] 4085 	or	a, a
   7C68 28 4E         [12] 4086 	jr	Z,00107$
                           4087 ;src/main.c:769: --i;
   7C6A DD 35 FB      [23] 4088 	dec	-5 (ix)
                           4089 ;src/main.c:770: if(!actual->muerto){
   7C6D DD 7E F9      [19] 4090 	ld	a,-7 (ix)
   7C70 C6 08         [ 7] 4091 	add	a, #0x08
   7C72 DD 77 FE      [19] 4092 	ld	-2 (ix),a
   7C75 DD 7E FA      [19] 4093 	ld	a,-6 (ix)
   7C78 CE 00         [ 7] 4094 	adc	a, #0x00
   7C7A DD 77 FF      [19] 4095 	ld	-1 (ix),a
   7C7D DD 6E FE      [19] 4096 	ld	l,-2 (ix)
   7C80 DD 66 FF      [19] 4097 	ld	h,-1 (ix)
   7C83 7E            [ 7] 4098 	ld	a,(hl)
   7C84 B7            [ 4] 4099 	or	a, a
   7C85 20 0E         [12] 4100 	jr	NZ,00102$
                           4101 ;src/main.c:771: checkEnemyDead(cu.direccion, actual);
   7C87 21 F7 63      [10] 4102 	ld	hl, #_cu + 7
   7C8A 46            [ 7] 4103 	ld	b,(hl)
   7C8B E1            [10] 4104 	pop	hl
   7C8C E5            [11] 4105 	push	hl
   7C8D E5            [11] 4106 	push	hl
   7C8E C5            [11] 4107 	push	bc
   7C8F 33            [ 6] 4108 	inc	sp
   7C90 CD 2F 69      [17] 4109 	call	_checkEnemyDead
   7C93 F1            [10] 4110 	pop	af
   7C94 33            [ 6] 4111 	inc	sp
   7C95                    4112 00102$:
                           4113 ;src/main.c:773: if(!actual->muerto){
   7C95 DD 6E FE      [19] 4114 	ld	l,-2 (ix)
   7C98 DD 66 FF      [19] 4115 	ld	h,-1 (ix)
   7C9B 7E            [ 7] 4116 	ld	a,(hl)
   7C9C B7            [ 4] 4117 	or	a, a
   7C9D 20 07         [12] 4118 	jr	NZ,00104$
                           4119 ;src/main.c:774: updateEnemy(actual);
   7C9F E1            [10] 4120 	pop	hl
   7CA0 E5            [11] 4121 	push	hl
   7CA1 E5            [11] 4122 	push	hl
   7CA2 CD 13 78      [17] 4123 	call	_updateEnemy
   7CA5 F1            [10] 4124 	pop	af
   7CA6                    4125 00104$:
                           4126 ;src/main.c:776: ++actual;
   7CA6 DD 7E F9      [19] 4127 	ld	a,-7 (ix)
   7CA9 C6 E2         [ 7] 4128 	add	a, #0xE2
   7CAB DD 77 F9      [19] 4129 	ld	-7 (ix),a
   7CAE DD 7E FA      [19] 4130 	ld	a,-6 (ix)
   7CB1 CE 00         [ 7] 4131 	adc	a, #0x00
   7CB3 DD 77 FA      [19] 4132 	ld	-6 (ix),a
   7CB6 18 AC         [12] 4133 	jr	00105$
   7CB8                    4134 00107$:
                           4135 ;src/main.c:779: cpct_waitVSYNC();
   7CB8 CD A7 56      [17] 4136 	call	_cpct_waitVSYNC
                           4137 ;src/main.c:782: if (prota.mover) {
   7CBB 01 EE 63      [10] 4138 	ld	bc,#_prota + 6
   7CBE 0A            [ 7] 4139 	ld	a,(bc)
   7CBF B7            [ 4] 4140 	or	a, a
   7CC0 28 07         [12] 4141 	jr	Z,00109$
                           4142 ;src/main.c:783: redibujarProta();
   7CC2 C5            [11] 4143 	push	bc
   7CC3 CD B5 65      [17] 4144 	call	_redibujarProta
   7CC6 C1            [10] 4145 	pop	bc
                           4146 ;src/main.c:784: prota.mover = NO;
   7CC7 AF            [ 4] 4147 	xor	a, a
   7CC8 02            [ 7] 4148 	ld	(bc),a
   7CC9                    4149 00109$:
                           4150 ;src/main.c:786: if(cu.lanzado && cu.mover){
   7CC9 21 F6 63      [10] 4151 	ld	hl, #(_cu + 0x0006) + 0
   7CCC 4E            [ 7] 4152 	ld	c,(hl)
                           4153 ;src/main.c:787: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4154 ;src/main.c:786: if(cu.lanzado && cu.mover){
   7CCD 79            [ 4] 4155 	ld	a,c
   7CCE B7            [ 4] 4156 	or	a, a
   7CCF 28 30         [12] 4157 	jr	Z,00114$
   7CD1 3A F9 63      [13] 4158 	ld	a, (#(_cu + 0x0009) + 0)
   7CD4 B7            [ 4] 4159 	or	a, a
   7CD5 28 2A         [12] 4160 	jr	Z,00114$
                           4161 ;src/main.c:787: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7CD7 21 F1 63      [10] 4162 	ld	hl, #(_cu + 0x0001) + 0
   7CDA 4E            [ 7] 4163 	ld	c,(hl)
   7CDB 21 F0 63      [10] 4164 	ld	hl, #_cu + 0
   7CDE 46            [ 7] 4165 	ld	b,(hl)
   7CDF 21 F8 63      [10] 4166 	ld	hl, #(_cu + 0x0008) + 0
   7CE2 5E            [ 7] 4167 	ld	e,(hl)
   7CE3 2A C5 64      [16] 4168 	ld	hl,(_mapa)
   7CE6 E5            [11] 4169 	push	hl
   7CE7 21 00 01      [10] 4170 	ld	hl,#_g_tablatrans
   7CEA E5            [11] 4171 	push	hl
   7CEB 21 F0 63      [10] 4172 	ld	hl,#_cu
   7CEE E5            [11] 4173 	push	hl
   7CEF 79            [ 4] 4174 	ld	a,c
   7CF0 F5            [11] 4175 	push	af
   7CF1 33            [ 6] 4176 	inc	sp
   7CF2 C5            [11] 4177 	push	bc
   7CF3 33            [ 6] 4178 	inc	sp
   7CF4 7B            [ 4] 4179 	ld	a,e
   7CF5 F5            [11] 4180 	push	af
   7CF6 33            [ 6] 4181 	inc	sp
   7CF7 CD 25 40      [17] 4182 	call	_redibujarCuchillo
   7CFA 21 09 00      [10] 4183 	ld	hl,#9
   7CFD 39            [11] 4184 	add	hl,sp
   7CFE F9            [ 6] 4185 	ld	sp,hl
   7CFF 18 28         [12] 4186 	jr	00115$
   7D01                    4187 00114$:
                           4188 ;src/main.c:788: }else if (cu.lanzado && !cu.mover){
   7D01 79            [ 4] 4189 	ld	a,c
   7D02 B7            [ 4] 4190 	or	a, a
   7D03 28 24         [12] 4191 	jr	Z,00115$
   7D05 3A F9 63      [13] 4192 	ld	a, (#(_cu + 0x0009) + 0)
   7D08 B7            [ 4] 4193 	or	a, a
   7D09 20 1E         [12] 4194 	jr	NZ,00115$
                           4195 ;src/main.c:789: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7D0B 21 F1 63      [10] 4196 	ld	hl, #(_cu + 0x0001) + 0
   7D0E 46            [ 7] 4197 	ld	b,(hl)
   7D0F 21 F0 63      [10] 4198 	ld	hl, #_cu + 0
   7D12 4E            [ 7] 4199 	ld	c,(hl)
   7D13 21 F8 63      [10] 4200 	ld	hl, #(_cu + 0x0008) + 0
   7D16 56            [ 7] 4201 	ld	d,(hl)
   7D17 2A C5 64      [16] 4202 	ld	hl,(_mapa)
   7D1A E5            [11] 4203 	push	hl
   7D1B C5            [11] 4204 	push	bc
   7D1C D5            [11] 4205 	push	de
   7D1D 33            [ 6] 4206 	inc	sp
   7D1E CD 92 3F      [17] 4207 	call	_borrarCuchillo
   7D21 F1            [10] 4208 	pop	af
   7D22 F1            [10] 4209 	pop	af
   7D23 33            [ 6] 4210 	inc	sp
                           4211 ;src/main.c:790: cu.lanzado = NO;
   7D24 21 F6 63      [10] 4212 	ld	hl,#(_cu + 0x0006)
   7D27 36 00         [10] 4213 	ld	(hl),#0x00
   7D29                    4214 00115$:
                           4215 ;src/main.c:793: i = 2 + num_mapa;
   7D29 3A C7 64      [13] 4216 	ld	a,(#_num_mapa + 0)
   7D2C C6 02         [ 7] 4217 	add	a, #0x02
   7D2E DD 77 FE      [19] 4218 	ld	-2 (ix),a
                           4219 ;src/main.c:794: actual = enemy;
   7D31 01 60 60      [10] 4220 	ld	bc,#_enemy
                           4221 ;src/main.c:795: while(i){
   7D34                    4222 00122$:
   7D34 DD 7E FE      [19] 4223 	ld	a,-2 (ix)
   7D37 B7            [ 4] 4224 	or	a, a
   7D38 CA E7 7D      [10] 4225 	jp	Z,00124$
                           4226 ;src/main.c:797: --i;
   7D3B DD 35 FE      [23] 4227 	dec	-2 (ix)
                           4228 ;src/main.c:798: if(actual->mover){
   7D3E 21 06 00      [10] 4229 	ld	hl,#0x0006
   7D41 09            [11] 4230 	add	hl,bc
   7D42 E3            [19] 4231 	ex	(sp), hl
   7D43 E1            [10] 4232 	pop	hl
   7D44 E5            [11] 4233 	push	hl
   7D45 7E            [ 7] 4234 	ld	a,(hl)
   7D46 B7            [ 4] 4235 	or	a, a
   7D47 28 18         [12] 4236 	jr	Z,00118$
                           4237 ;src/main.c:799: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7D49 69            [ 4] 4238 	ld	l, c
   7D4A 60            [ 4] 4239 	ld	h, b
   7D4B 23            [ 6] 4240 	inc	hl
   7D4C 23            [ 6] 4241 	inc	hl
   7D4D 23            [ 6] 4242 	inc	hl
   7D4E 5E            [ 7] 4243 	ld	e,(hl)
   7D4F 69            [ 4] 4244 	ld	l, c
   7D50 60            [ 4] 4245 	ld	h, b
   7D51 23            [ 6] 4246 	inc	hl
   7D52 23            [ 6] 4247 	inc	hl
   7D53 56            [ 7] 4248 	ld	d,(hl)
   7D54 C5            [11] 4249 	push	bc
   7D55 C5            [11] 4250 	push	bc
   7D56 7B            [ 4] 4251 	ld	a,e
   7D57 F5            [11] 4252 	push	af
   7D58 33            [ 6] 4253 	inc	sp
   7D59 D5            [11] 4254 	push	de
   7D5A 33            [ 6] 4255 	inc	sp
   7D5B CD FE 68      [17] 4256 	call	_redibujarEnemigo
   7D5E F1            [10] 4257 	pop	af
   7D5F F1            [10] 4258 	pop	af
   7D60 C1            [10] 4259 	pop	bc
   7D61                    4260 00118$:
                           4261 ;src/main.c:802: if (actual->muerto && actual->muertes == 0){
   7D61 C5            [11] 4262 	push	bc
   7D62 FD E1         [14] 4263 	pop	iy
   7D64 FD 7E 08      [19] 4264 	ld	a,8 (iy)
   7D67 B7            [ 4] 4265 	or	a, a
   7D68 28 74         [12] 4266 	jr	Z,00120$
   7D6A 21 0A 00      [10] 4267 	ld	hl,#0x000A
   7D6D 09            [11] 4268 	add	hl,bc
   7D6E EB            [ 4] 4269 	ex	de,hl
   7D6F 1A            [ 7] 4270 	ld	a,(de)
   7D70 B7            [ 4] 4271 	or	a, a
   7D71 20 6B         [12] 4272 	jr	NZ,00120$
                           4273 ;src/main.c:803: borrarEnemigo((*actual).x, (*actual).y);
   7D73 21 01 00      [10] 4274 	ld	hl,#0x0001
   7D76 09            [11] 4275 	add	hl,bc
   7D77 DD 75 FC      [19] 4276 	ld	-4 (ix),l
   7D7A DD 74 FD      [19] 4277 	ld	-3 (ix),h
   7D7D DD 6E FC      [19] 4278 	ld	l,-4 (ix)
   7D80 DD 66 FD      [19] 4279 	ld	h,-3 (ix)
   7D83 7E            [ 7] 4280 	ld	a,(hl)
   7D84 F5            [11] 4281 	push	af
   7D85 0A            [ 7] 4282 	ld	a,(bc)
   7D86 DD 77 FB      [19] 4283 	ld	-5 (ix),a
   7D89 F1            [10] 4284 	pop	af
   7D8A C5            [11] 4285 	push	bc
   7D8B D5            [11] 4286 	push	de
   7D8C F5            [11] 4287 	push	af
   7D8D 33            [ 6] 4288 	inc	sp
   7D8E DD 7E FB      [19] 4289 	ld	a,-5 (ix)
   7D91 F5            [11] 4290 	push	af
   7D92 33            [ 6] 4291 	inc	sp
   7D93 CD 89 68      [17] 4292 	call	_borrarEnemigo
   7D96 F1            [10] 4293 	pop	af
   7D97 D1            [10] 4294 	pop	de
   7D98 C1            [10] 4295 	pop	bc
                           4296 ;src/main.c:804: dibujarExplosion(actual);
   7D99 C5            [11] 4297 	push	bc
   7D9A D5            [11] 4298 	push	de
   7D9B C5            [11] 4299 	push	bc
   7D9C CD D9 67      [17] 4300 	call	_dibujarExplosion
   7D9F F1            [10] 4301 	pop	af
   7DA0 D1            [10] 4302 	pop	de
   7DA1 C1            [10] 4303 	pop	bc
                           4304 ;src/main.c:805: puntuacion_aux = puntuacion;
   7DA2 FD 21 C8 64   [14] 4305 	ld	iy,#_puntuacion
   7DA6 FD 6E 00      [19] 4306 	ld	l,0 (iy)
   7DA9 26 00         [ 7] 4307 	ld	h,#0x00
                           4308 ;src/main.c:806: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7DAB C5            [11] 4309 	push	bc
   7DAC D5            [11] 4310 	push	de
   7DAD E5            [11] 4311 	push	hl
   7DAE CD 19 53      [17] 4312 	call	_aumentarPuntuacion
   7DB1 F1            [10] 4313 	pop	af
   7DB2 D1            [10] 4314 	pop	de
   7DB3 C1            [10] 4315 	pop	bc
   7DB4 FD 21 C8 64   [14] 4316 	ld	iy,#_puntuacion
   7DB8 FD 75 00      [19] 4317 	ld	0 (iy),l
                           4318 ;src/main.c:807: modificarPuntuacion(puntuacion);
   7DBB FD 21 C8 64   [14] 4319 	ld	iy,#_puntuacion
   7DBF FD 6E 00      [19] 4320 	ld	l,0 (iy)
   7DC2 26 00         [ 7] 4321 	ld	h,#0x00
   7DC4 C5            [11] 4322 	push	bc
   7DC5 D5            [11] 4323 	push	de
   7DC6 E5            [11] 4324 	push	hl
   7DC7 CD DC 51      [17] 4325 	call	_modificarPuntuacion
   7DCA F1            [10] 4326 	pop	af
   7DCB D1            [10] 4327 	pop	de
   7DCC C1            [10] 4328 	pop	bc
                           4329 ;src/main.c:808: actual->mover = NO;
   7DCD E1            [10] 4330 	pop	hl
   7DCE E5            [11] 4331 	push	hl
   7DCF 36 00         [10] 4332 	ld	(hl),#0x00
                           4333 ;src/main.c:809: actual->muertes++;
   7DD1 1A            [ 7] 4334 	ld	a,(de)
   7DD2 3C            [ 4] 4335 	inc	a
   7DD3 12            [ 7] 4336 	ld	(de),a
                           4337 ;src/main.c:810: actual->x = 0;
   7DD4 AF            [ 4] 4338 	xor	a, a
   7DD5 02            [ 7] 4339 	ld	(bc),a
                           4340 ;src/main.c:811: actual->y = 0;
   7DD6 DD 6E FC      [19] 4341 	ld	l,-4 (ix)
   7DD9 DD 66 FD      [19] 4342 	ld	h,-3 (ix)
   7DDC 36 00         [10] 4343 	ld	(hl),#0x00
   7DDE                    4344 00120$:
                           4345 ;src/main.c:813: ++actual;
   7DDE 21 E2 00      [10] 4346 	ld	hl,#0x00E2
   7DE1 09            [11] 4347 	add	hl,bc
   7DE2 4D            [ 4] 4348 	ld	c,l
   7DE3 44            [ 4] 4349 	ld	b,h
   7DE4 C3 34 7D      [10] 4350 	jp	00122$
   7DE7                    4351 00124$:
                           4352 ;src/main.c:815: cpct_waitVSYNC();
   7DE7 CD A7 56      [17] 4353 	call	_cpct_waitVSYNC
   7DEA C3 2C 7C      [10] 4354 	jp	00126$
                           4355 	.area _CODE
                           4356 	.area _INITIALIZER
   64CA                    4357 __xinit__mapa:
   64CA 00 00              4358 	.dw #0x0000
   64CC                    4359 __xinit__num_mapa:
   64CC 00                 4360 	.db #0x00	; 0
   64CD                    4361 __xinit__puntuacion:
   64CD 00                 4362 	.db #0x00	; 0
   64CE                    4363 __xinit__vidas:
   64CE 05                 4364 	.db #0x05	; 5
                           4365 	.area _CABS (ABS)
