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
   64ED 32                  194 	.db #0x32	; 50	'2'
   64EE 18                  195 	.db #0x18	; 24
   64EF                     196 _spawnY:
   64EF 2C                  197 	.db #0x2C	; 44
   64F0 66                  198 	.db #0x66	; 102	'f'
   64F1 9A                  199 	.db #0x9A	; 154
   64F2 68                  200 	.db #0x68	; 104	'h'
   64F3                     201 _patrolX:
   64F3 00                  202 	.db #0x00	; 0
   64F4 00                  203 	.db #0x00	; 0
   64F5 00                  204 	.db #0x00	; 0
   64F6 00                  205 	.db #0x00	; 0
   64F7 00                  206 	.db #0x00	; 0
   64F8 14                  207 	.db #0x14	; 20
   64F9 47                  208 	.db #0x47	; 71	'G'
   64FA 00                  209 	.db #0x00	; 0
   64FB 00                  210 	.db #0x00	; 0
   64FC 00                  211 	.db 0x00
   64FD 00                  212 	.db #0x00	; 0
   64FE 00                  213 	.db #0x00	; 0
   64FF 00                  214 	.db #0x00	; 0
   6500 00                  215 	.db #0x00	; 0
   6501 00                  216 	.db 0x00
   6502 00                  217 	.db #0x00	; 0
   6503 00                  218 	.db #0x00	; 0
   6504 00                  219 	.db #0x00	; 0
   6505 00                  220 	.db #0x00	; 0
   6506 00                  221 	.db 0x00
   6507                     222 _patrolY:
   6507 00                  223 	.db #0x00	; 0
   6508 00                  224 	.db #0x00	; 0
   6509 00                  225 	.db #0x00	; 0
   650A 00                  226 	.db #0x00	; 0
   650B 00                  227 	.db 0x00
   650C 5A                  228 	.db #0x5A	; 90	'Z'
   650D 9C                  229 	.db #0x9C	; 156
   650E 00                  230 	.db #0x00	; 0
   650F 00                  231 	.db #0x00	; 0
   6510 00                  232 	.db 0x00
   6511 00                  233 	.db #0x00	; 0
   6512 00                  234 	.db #0x00	; 0
   6513 00                  235 	.db #0x00	; 0
   6514 00                  236 	.db #0x00	; 0
   6515 00                  237 	.db 0x00
   6516 00                  238 	.db #0x00	; 0
   6517 00                  239 	.db #0x00	; 0
   6518 00                  240 	.db #0x00	; 0
   6519 00                  241 	.db #0x00	; 0
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
   65DA C2 ED 7A      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   65DD 21 00 02      [10]  382 	ld	hl,#0x0200
   65E0 CD 06 54      [17]  383 	call	_cpct_isKeyPressed
   65E3 7D            [ 4]  384 	ld	a,l
   65E4 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:149: moverDerecha();
   65E5 C2 12 7B      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   65E8 21 00 01      [10]  389 	ld	hl,#0x0100
   65EB CD 06 54      [17]  390 	call	_cpct_isKeyPressed
   65EE 7D            [ 4]  391 	ld	a,l
   65EF B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:151: moverArriba();
   65F0 C2 57 7B      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   65F3 21 00 04      [10]  396 	ld	hl,#0x0400
   65F6 CD 06 54      [17]  397 	call	_cpct_isKeyPressed
   65F9 7D            [ 4]  398 	ld	a,l
   65FA B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:153: moverAbajo();
   65FB C2 7B 7B      [10]  401 	jp	NZ,_moverAbajo
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
                            806 ;src/main.c:208: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
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
                            821 ;src/main.c:210: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
                            863 ;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
                            864 ;	---------------------------------
                            865 ; Function borrarEnemigo
                            866 ; ---------------------------------
   6889                     867 _borrarEnemigo::
   6889 DD E5         [15]  868 	push	ix
   688B DD 21 00 00   [14]  869 	ld	ix,#0
   688F DD 39         [15]  870 	add	ix,sp
   6891 F5            [11]  871 	push	af
   6892 F5            [11]  872 	push	af
                            873 ;src/main.c:218: u8 w = 4 + (x & 1);
   6893 DD 7E 04      [19]  874 	ld	a,4 (ix)
   6896 E6 01         [ 7]  875 	and	a, #0x01
   6898 4F            [ 4]  876 	ld	c,a
   6899 0C            [ 4]  877 	inc	c
   689A 0C            [ 4]  878 	inc	c
   689B 0C            [ 4]  879 	inc	c
   689C 0C            [ 4]  880 	inc	c
                            881 ;src/main.c:221: u8 h = 6 + (y & 3 ? 1 : 0);
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
                            892 ;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
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
                            936 ;src/main.c:226: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            937 ;	---------------------------------
                            938 ; Function redibujarEnemigo
                            939 ; ---------------------------------
   68FE                     940 _redibujarEnemigo::
   68FE DD E5         [15]  941 	push	ix
   6900 DD 21 00 00   [14]  942 	ld	ix,#0
   6904 DD 39         [15]  943 	add	ix,sp
                            944 ;src/main.c:227: borrarEnemigo(x, y);
   6906 DD 66 05      [19]  945 	ld	h,5 (ix)
   6909 DD 6E 04      [19]  946 	ld	l,4 (ix)
   690C E5            [11]  947 	push	hl
   690D CD 89 68      [17]  948 	call	_borrarEnemigo
   6910 F1            [10]  949 	pop	af
                            950 ;src/main.c:228: enemy->px = enemy->x;
   6911 DD 4E 06      [19]  951 	ld	c,6 (ix)
   6914 DD 46 07      [19]  952 	ld	b,7 (ix)
   6917 59            [ 4]  953 	ld	e, c
   6918 50            [ 4]  954 	ld	d, b
   6919 13            [ 6]  955 	inc	de
   691A 13            [ 6]  956 	inc	de
   691B 0A            [ 7]  957 	ld	a,(bc)
   691C 12            [ 7]  958 	ld	(de),a
                            959 ;src/main.c:229: enemy->py = enemy->y;
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
                            970 ;src/main.c:230: dibujarEnemigo(enemy);
   6927 C5            [11]  971 	push	bc
   6928 CD A1 67      [17]  972 	call	_dibujarEnemigo
   692B F1            [10]  973 	pop	af
   692C DD E1         [14]  974 	pop	ix
   692E C9            [10]  975 	ret
                            976 ;src/main.c:233: void checkEnemyDead(u8 direction, TEnemy *enemy){
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
                            987 ;src/main.c:235: switch (direction) {
   693C 3E 03         [ 7]  988 	ld	a,#0x03
   693E DD 96 04      [19]  989 	sub	a, 4 (ix)
   6941 DA 17 6B      [10]  990 	jp	C,00134$
                            991 ;src/main.c:237: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6944 DD 7E 05      [19]  992 	ld	a,5 (ix)
   6947 DD 77 FE      [19]  993 	ld	-2 (ix),a
   694A DD 7E 06      [19]  994 	ld	a,6 (ix)
   694D DD 77 FF      [19]  995 	ld	-1 (ix),a
   6950 DD 7E FE      [19]  996 	ld	a,-2 (ix)
   6953 C6 01         [ 7]  997 	add	a, #0x01
   6955 DD 77 FA      [19]  998 	ld	-6 (ix),a
   6958 DD 7E FF      [19]  999 	ld	a,-1 (ix)
   695B CE 00         [ 7] 1000 	adc	a, #0x00
   695D DD 77 FB      [19] 1001 	ld	-5 (ix),a
                           1002 ;src/main.c:240: enemy->muerto = SI;
   6960 DD 7E FE      [19] 1003 	ld	a,-2 (ix)
   6963 C6 08         [ 7] 1004 	add	a, #0x08
   6965 DD 77 FC      [19] 1005 	ld	-4 (ix),a
   6968 DD 7E FF      [19] 1006 	ld	a,-1 (ix)
   696B CE 00         [ 7] 1007 	adc	a, #0x00
   696D DD 77 FD      [19] 1008 	ld	-3 (ix),a
                           1009 ;src/main.c:235: switch (direction) {
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
                           1022 ;src/main.c:236: case 1:
   6988                    1023 00101$:
                           1024 ;src/main.c:237: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
   699B E1            [10] 1037 	pop	hl
   699C E5            [11] 1038 	push	hl
   699D 6E            [ 7] 1039 	ld	l,(hl)
   699E 55            [ 4] 1040 	ld	d,l
   699F 7B            [ 4] 1041 	ld	a,e
   69A0 92            [ 4] 1042 	sub	a, d
   69A1 E2 A6 69      [10] 1043 	jp	PO, 00197$
   69A4 EE 80         [ 7] 1044 	xor	a, #0x80
   69A6                    1045 00197$:
   69A6 FA BB 69      [10] 1046 	jp	M,00106$
   69A9 26 00         [ 7] 1047 	ld	h,#0x00
   69AB 11 16 00      [10] 1048 	ld	de,#0x0016
   69AE 19            [11] 1049 	add	hl,de
   69AF 7D            [ 4] 1050 	ld	a,l
   69B0 91            [ 4] 1051 	sub	a, c
   69B1 7C            [ 4] 1052 	ld	a,h
   69B2 98            [ 4] 1053 	sbc	a, b
   69B3 E2 B8 69      [10] 1054 	jp	PO, 00198$
   69B6 EE 80         [ 7] 1055 	xor	a, #0x80
   69B8                    1056 00198$:
   69B8 F2 17 6B      [10] 1057 	jp	P,00134$
   69BB                    1058 00106$:
                           1059 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   69BB 21 F0 63      [10] 1060 	ld	hl, #_cu + 0
   69BE 4E            [ 7] 1061 	ld	c,(hl)
   69BF DD 6E FE      [19] 1062 	ld	l,-2 (ix)
   69C2 DD 66 FF      [19] 1063 	ld	h,-1 (ix)
   69C5 5E            [ 7] 1064 	ld	e,(hl)
   69C6 7B            [ 4] 1065 	ld	a,e
   69C7 91            [ 4] 1066 	sub	a, c
   69C8 D2 17 6B      [10] 1067 	jp	NC,00134$
                           1068 ;src/main.c:239: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   69CB 69            [ 4] 1069 	ld	l,c
   69CC 26 00         [ 7] 1070 	ld	h,#0x00
   69CE 16 00         [ 7] 1071 	ld	d,#0x00
   69D0 13            [ 6] 1072 	inc	de
   69D1 13            [ 6] 1073 	inc	de
   69D2 13            [ 6] 1074 	inc	de
   69D3 13            [ 6] 1075 	inc	de
   69D4 BF            [ 4] 1076 	cp	a, a
   69D5 ED 52         [15] 1077 	sbc	hl, de
   69D7 3E 01         [ 7] 1078 	ld	a,#0x01
   69D9 BD            [ 4] 1079 	cp	a, l
   69DA 3E 00         [ 7] 1080 	ld	a,#0x00
   69DC 9C            [ 4] 1081 	sbc	a, h
   69DD E2 E2 69      [10] 1082 	jp	PO, 00199$
   69E0 EE 80         [ 7] 1083 	xor	a, #0x80
   69E2                    1084 00199$:
   69E2 FA 17 6B      [10] 1085 	jp	M,00134$
                           1086 ;src/main.c:240: enemy->muerto = SI;
   69E5 DD 6E FC      [19] 1087 	ld	l,-4 (ix)
   69E8 DD 66 FD      [19] 1088 	ld	h,-3 (ix)
   69EB 36 01         [10] 1089 	ld	(hl),#0x01
                           1090 ;src/main.c:244: break;
   69ED C3 17 6B      [10] 1091 	jp	00134$
                           1092 ;src/main.c:245: case 0:
   69F0                    1093 00109$:
                           1094 ;src/main.c:246: if( !(cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
   6A03 E1            [10] 1107 	pop	hl
   6A04 E5            [11] 1108 	push	hl
   6A05 6E            [ 7] 1109 	ld	l,(hl)
   6A06 55            [ 4] 1110 	ld	d,l
   6A07 7B            [ 4] 1111 	ld	a,e
   6A08 92            [ 4] 1112 	sub	a, d
   6A09 E2 0E 6A      [10] 1113 	jp	PO, 00200$
   6A0C EE 80         [ 7] 1114 	xor	a, #0x80
   6A0E                    1115 00200$:
   6A0E FA 23 6A      [10] 1116 	jp	M,00114$
   6A11 26 00         [ 7] 1117 	ld	h,#0x00
   6A13 11 16 00      [10] 1118 	ld	de,#0x0016
   6A16 19            [11] 1119 	add	hl,de
   6A17 7D            [ 4] 1120 	ld	a,l
   6A18 91            [ 4] 1121 	sub	a, c
   6A19 7C            [ 4] 1122 	ld	a,h
   6A1A 98            [ 4] 1123 	sbc	a, b
   6A1B E2 20 6A      [10] 1124 	jp	PO, 00201$
   6A1E EE 80         [ 7] 1125 	xor	a, #0x80
   6A20                    1126 00201$:
   6A20 F2 17 6B      [10] 1127 	jp	P,00134$
   6A23                    1128 00114$:
                           1129 ;src/main.c:247: if(enemy->x > cu.x){ //si el cu esta abajo
   6A23 DD 6E FE      [19] 1130 	ld	l,-2 (ix)
   6A26 DD 66 FF      [19] 1131 	ld	h,-1 (ix)
   6A29 4E            [ 7] 1132 	ld	c,(hl)
   6A2A 21 F0 63      [10] 1133 	ld	hl, #_cu + 0
   6A2D 5E            [ 7] 1134 	ld	e,(hl)
   6A2E 7B            [ 4] 1135 	ld	a,e
   6A2F 91            [ 4] 1136 	sub	a, c
   6A30 D2 17 6B      [10] 1137 	jp	NC,00134$
                           1138 ;src/main.c:248: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A33 69            [ 4] 1139 	ld	l,c
   6A34 26 00         [ 7] 1140 	ld	h,#0x00
   6A36 16 00         [ 7] 1141 	ld	d,#0x00
   6A38 13            [ 6] 1142 	inc	de
   6A39 13            [ 6] 1143 	inc	de
   6A3A 13            [ 6] 1144 	inc	de
   6A3B 13            [ 6] 1145 	inc	de
   6A3C BF            [ 4] 1146 	cp	a, a
   6A3D ED 52         [15] 1147 	sbc	hl, de
   6A3F 3E 01         [ 7] 1148 	ld	a,#0x01
   6A41 BD            [ 4] 1149 	cp	a, l
   6A42 3E 00         [ 7] 1150 	ld	a,#0x00
   6A44 9C            [ 4] 1151 	sbc	a, h
   6A45 E2 4A 6A      [10] 1152 	jp	PO, 00202$
   6A48 EE 80         [ 7] 1153 	xor	a, #0x80
   6A4A                    1154 00202$:
   6A4A FA 17 6B      [10] 1155 	jp	M,00134$
                           1156 ;src/main.c:249: enemy->muerto = SI;
   6A4D DD 6E FC      [19] 1157 	ld	l,-4 (ix)
   6A50 DD 66 FD      [19] 1158 	ld	h,-3 (ix)
   6A53 36 01         [10] 1159 	ld	(hl),#0x01
                           1160 ;src/main.c:253: break;
   6A55 C3 17 6B      [10] 1161 	jp	00134$
                           1162 ;src/main.c:254: case 3:
   6A58                    1163 00117$:
                           1164 ;src/main.c:255: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6A58 21 F0 63      [10] 1165 	ld	hl, #_cu + 0
   6A5B 4E            [ 7] 1166 	ld	c,(hl)
   6A5C 06 00         [ 7] 1167 	ld	b,#0x00
   6A5E 59            [ 4] 1168 	ld	e, c
   6A5F 50            [ 4] 1169 	ld	d, b
   6A60 13            [ 6] 1170 	inc	de
   6A61 13            [ 6] 1171 	inc	de
   6A62 DD 6E FE      [19] 1172 	ld	l,-2 (ix)
   6A65 DD 66 FF      [19] 1173 	ld	h,-1 (ix)
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
                           1194 ;src/main.c:256: if(enemy->y>cu.y){
   6A87 E1            [10] 1195 	pop	hl
   6A88 E5            [11] 1196 	push	hl
   6A89 4E            [ 7] 1197 	ld	c,(hl)
   6A8A 21 F1 63      [10] 1198 	ld	hl, #(_cu + 0x0001) + 0
   6A8D 5E            [ 7] 1199 	ld	e,(hl)
   6A8E 7B            [ 4] 1200 	ld	a,e
   6A8F 91            [ 4] 1201 	sub	a, c
   6A90 D2 17 6B      [10] 1202 	jp	NC,00134$
                           1203 ;src/main.c:257: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6A93 06 00         [ 7] 1204 	ld	b,#0x00
   6A95 16 00         [ 7] 1205 	ld	d,#0x00
   6A97 21 08 00      [10] 1206 	ld	hl,#0x0008
   6A9A 19            [11] 1207 	add	hl,de
   6A9B 79            [ 4] 1208 	ld	a,c
   6A9C 95            [ 4] 1209 	sub	a, l
   6A9D 4F            [ 4] 1210 	ld	c,a
   6A9E 78            [ 4] 1211 	ld	a,b
   6A9F 9C            [ 4] 1212 	sbc	a, h
   6AA0 47            [ 4] 1213 	ld	b,a
   6AA1 3E 02         [ 7] 1214 	ld	a,#0x02
   6AA3 B9            [ 4] 1215 	cp	a, c
   6AA4 3E 00         [ 7] 1216 	ld	a,#0x00
   6AA6 98            [ 4] 1217 	sbc	a, b
   6AA7 E2 AC 6A      [10] 1218 	jp	PO, 00205$
   6AAA EE 80         [ 7] 1219 	xor	a, #0x80
   6AAC                    1220 00205$:
   6AAC F2 17 6B      [10] 1221 	jp	P,00134$
                           1222 ;src/main.c:258: enemy->muerto = SI;
   6AAF DD 6E FC      [19] 1223 	ld	l,-4 (ix)
   6AB2 DD 66 FD      [19] 1224 	ld	h,-3 (ix)
   6AB5 36 01         [10] 1225 	ld	(hl),#0x01
                           1226 ;src/main.c:262: break;
   6AB7 18 5E         [12] 1227 	jr	00134$
                           1228 ;src/main.c:263: case 2:
   6AB9                    1229 00125$:
                           1230 ;src/main.c:264: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AB9 21 F0 63      [10] 1231 	ld	hl, #_cu + 0
   6ABC 4E            [ 7] 1232 	ld	c,(hl)
   6ABD 06 00         [ 7] 1233 	ld	b,#0x00
   6ABF 59            [ 4] 1234 	ld	e, c
   6AC0 50            [ 4] 1235 	ld	d, b
   6AC1 13            [ 6] 1236 	inc	de
   6AC2 13            [ 6] 1237 	inc	de
   6AC3 DD 6E FE      [19] 1238 	ld	l,-2 (ix)
   6AC6 DD 66 FF      [19] 1239 	ld	h,-1 (ix)
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
                           1260 ;src/main.c:265: if(cu.y > enemy->y){ //si el cu esta abajo
   6AE8 21 F1 63      [10] 1261 	ld	hl, #(_cu + 0x0001) + 0
   6AEB 4E            [ 7] 1262 	ld	c,(hl)
   6AEC E1            [10] 1263 	pop	hl
   6AED E5            [11] 1264 	push	hl
   6AEE 5E            [ 7] 1265 	ld	e,(hl)
   6AEF 7B            [ 4] 1266 	ld	a,e
   6AF0 91            [ 4] 1267 	sub	a, c
   6AF1 30 24         [12] 1268 	jr	NC,00134$
                           1269 ;src/main.c:266: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6AF3 06 00         [ 7] 1270 	ld	b,#0x00
   6AF5 16 00         [ 7] 1271 	ld	d,#0x00
   6AF7 21 16 00      [10] 1272 	ld	hl,#0x0016
   6AFA 19            [11] 1273 	add	hl,de
   6AFB 79            [ 4] 1274 	ld	a,c
   6AFC 95            [ 4] 1275 	sub	a, l
   6AFD 4F            [ 4] 1276 	ld	c,a
   6AFE 78            [ 4] 1277 	ld	a,b
   6AFF 9C            [ 4] 1278 	sbc	a, h
   6B00 47            [ 4] 1279 	ld	b,a
   6B01 3E 02         [ 7] 1280 	ld	a,#0x02
   6B03 B9            [ 4] 1281 	cp	a, c
   6B04 3E 00         [ 7] 1282 	ld	a,#0x00
   6B06 98            [ 4] 1283 	sbc	a, b
   6B07 E2 0C 6B      [10] 1284 	jp	PO, 00208$
   6B0A EE 80         [ 7] 1285 	xor	a, #0x80
   6B0C                    1286 00208$:
   6B0C F2 17 6B      [10] 1287 	jp	P,00134$
                           1288 ;src/main.c:267: enemy->muerto = SI;
   6B0F DD 6E FC      [19] 1289 	ld	l,-4 (ix)
   6B12 DD 66 FD      [19] 1290 	ld	h,-3 (ix)
   6B15 36 01         [10] 1291 	ld	(hl),#0x01
                           1292 ;src/main.c:273: }
   6B17                    1293 00134$:
   6B17 DD F9         [10] 1294 	ld	sp, ix
   6B19 DD E1         [14] 1295 	pop	ix
   6B1B C9            [10] 1296 	ret
                           1297 ;src/main.c:276: void moverEnemigoArriba(TEnemy *enemy){
                           1298 ;	---------------------------------
                           1299 ; Function moverEnemigoArriba
                           1300 ; ---------------------------------
   6B1C                    1301 _moverEnemigoArriba::
   6B1C DD E5         [15] 1302 	push	ix
   6B1E DD 21 00 00   [14] 1303 	ld	ix,#0
   6B22 DD 39         [15] 1304 	add	ix,sp
                           1305 ;src/main.c:277: enemy->y--;
   6B24 DD 4E 04      [19] 1306 	ld	c,4 (ix)
   6B27 DD 46 05      [19] 1307 	ld	b,5 (ix)
   6B2A 69            [ 4] 1308 	ld	l, c
   6B2B 60            [ 4] 1309 	ld	h, b
   6B2C 23            [ 6] 1310 	inc	hl
   6B2D 5E            [ 7] 1311 	ld	e,(hl)
   6B2E 1D            [ 4] 1312 	dec	e
   6B2F 73            [ 7] 1313 	ld	(hl),e
                           1314 ;src/main.c:278: enemy->y--;
   6B30 1D            [ 4] 1315 	dec	e
   6B31 73            [ 7] 1316 	ld	(hl),e
                           1317 ;src/main.c:279: enemy->mover = SI;
   6B32 21 06 00      [10] 1318 	ld	hl,#0x0006
   6B35 09            [11] 1319 	add	hl,bc
   6B36 36 01         [10] 1320 	ld	(hl),#0x01
   6B38 DD E1         [14] 1321 	pop	ix
   6B3A C9            [10] 1322 	ret
                           1323 ;src/main.c:282: void moverEnemigoAbajo(TEnemy *enemy){
                           1324 ;	---------------------------------
                           1325 ; Function moverEnemigoAbajo
                           1326 ; ---------------------------------
   6B3B                    1327 _moverEnemigoAbajo::
   6B3B DD E5         [15] 1328 	push	ix
   6B3D DD 21 00 00   [14] 1329 	ld	ix,#0
   6B41 DD 39         [15] 1330 	add	ix,sp
                           1331 ;src/main.c:283: enemy->y++;
   6B43 DD 4E 04      [19] 1332 	ld	c,4 (ix)
   6B46 DD 46 05      [19] 1333 	ld	b,5 (ix)
   6B49 59            [ 4] 1334 	ld	e, c
   6B4A 50            [ 4] 1335 	ld	d, b
   6B4B 13            [ 6] 1336 	inc	de
   6B4C 1A            [ 7] 1337 	ld	a,(de)
   6B4D 3C            [ 4] 1338 	inc	a
   6B4E 12            [ 7] 1339 	ld	(de),a
                           1340 ;src/main.c:284: enemy->y++;
   6B4F 3C            [ 4] 1341 	inc	a
   6B50 12            [ 7] 1342 	ld	(de),a
                           1343 ;src/main.c:285: enemy->mover = SI;
   6B51 21 06 00      [10] 1344 	ld	hl,#0x0006
   6B54 09            [11] 1345 	add	hl,bc
   6B55 36 01         [10] 1346 	ld	(hl),#0x01
   6B57 DD E1         [14] 1347 	pop	ix
   6B59 C9            [10] 1348 	ret
                           1349 ;src/main.c:288: void moverEnemigoDerecha(TEnemy *enemy){
                           1350 ;	---------------------------------
                           1351 ; Function moverEnemigoDerecha
                           1352 ; ---------------------------------
   6B5A                    1353 _moverEnemigoDerecha::
                           1354 ;src/main.c:289: enemy->x++;
   6B5A D1            [10] 1355 	pop	de
   6B5B C1            [10] 1356 	pop	bc
   6B5C C5            [11] 1357 	push	bc
   6B5D D5            [11] 1358 	push	de
   6B5E 0A            [ 7] 1359 	ld	a,(bc)
   6B5F 3C            [ 4] 1360 	inc	a
   6B60 02            [ 7] 1361 	ld	(bc),a
                           1362 ;src/main.c:290: enemy->x++;
   6B61 3C            [ 4] 1363 	inc	a
   6B62 02            [ 7] 1364 	ld	(bc),a
                           1365 ;src/main.c:291: enemy->mover = SI;
   6B63 21 06 00      [10] 1366 	ld	hl,#0x0006
   6B66 09            [11] 1367 	add	hl,bc
   6B67 36 01         [10] 1368 	ld	(hl),#0x01
   6B69 C9            [10] 1369 	ret
                           1370 ;src/main.c:294: void moverEnemigoIzquierda(TEnemy *enemy){
                           1371 ;	---------------------------------
                           1372 ; Function moverEnemigoIzquierda
                           1373 ; ---------------------------------
   6B6A                    1374 _moverEnemigoIzquierda::
                           1375 ;src/main.c:295: enemy->x--;
   6B6A D1            [10] 1376 	pop	de
   6B6B C1            [10] 1377 	pop	bc
   6B6C C5            [11] 1378 	push	bc
   6B6D D5            [11] 1379 	push	de
   6B6E 0A            [ 7] 1380 	ld	a,(bc)
   6B6F C6 FF         [ 7] 1381 	add	a,#0xFF
   6B71 02            [ 7] 1382 	ld	(bc),a
                           1383 ;src/main.c:296: enemy->x--;
   6B72 C6 FF         [ 7] 1384 	add	a,#0xFF
   6B74 02            [ 7] 1385 	ld	(bc),a
                           1386 ;src/main.c:297: enemy->mover = SI;
   6B75 21 06 00      [10] 1387 	ld	hl,#0x0006
   6B78 09            [11] 1388 	add	hl,bc
   6B79 36 01         [10] 1389 	ld	(hl),#0x01
   6B7B C9            [10] 1390 	ret
                           1391 ;src/main.c:300: void moverEnemigoPatrol(TEnemy* enemy){
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
                           1402 ;src/main.c:302: if(!enemy->muerto){
   6B89 DD 4E 04      [19] 1403 	ld	c,4 (ix)
   6B8C DD 46 05      [19] 1404 	ld	b,5 (ix)
   6B8F C5            [11] 1405 	push	bc
   6B90 FD E1         [14] 1406 	pop	iy
   6B92 FD 7E 08      [19] 1407 	ld	a,8 (iy)
   6B95 B7            [ 4] 1408 	or	a, a
   6B96 C2 C0 6D      [10] 1409 	jp	NZ,00118$
                           1410 ;src/main.c:305: if (!enemy->reversePatrol) {
   6B99 21 0C 00      [10] 1411 	ld	hl,#0x000C
   6B9C 09            [11] 1412 	add	hl,bc
   6B9D DD 75 FE      [19] 1413 	ld	-2 (ix),l
   6BA0 DD 74 FF      [19] 1414 	ld	-1 (ix),h
   6BA3 DD 6E FE      [19] 1415 	ld	l,-2 (ix)
   6BA6 DD 66 FF      [19] 1416 	ld	h,-1 (ix)
   6BA9 7E            [ 7] 1417 	ld	a,(hl)
   6BAA DD 77 FD      [19] 1418 	ld	-3 (ix),a
                           1419 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
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
                           1433 ;src/main.c:309: enemy->mover = SI;
   6BCA 21 06 00      [10] 1434 	ld	hl,#0x0006
   6BCD 09            [11] 1435 	add	hl,bc
   6BCE DD 75 F7      [19] 1436 	ld	-9 (ix),l
   6BD1 DD 74 F8      [19] 1437 	ld	-8 (ix),h
                           1438 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
   6BD4 21 19 00      [10] 1439 	ld	hl,#0x0019
   6BD7 09            [11] 1440 	add	hl,bc
   6BD8 DD 75 F5      [19] 1441 	ld	-11 (ix),l
   6BDB DD 74 F6      [19] 1442 	ld	-10 (ix),h
                           1443 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6BDE 21 01 00      [10] 1444 	ld	hl,#0x0001
   6BE1 09            [11] 1445 	add	hl,bc
   6BE2 E3            [19] 1446 	ex	(sp), hl
                           1447 ;src/main.c:305: if (!enemy->reversePatrol) {
   6BE3 DD 7E FD      [19] 1448 	ld	a,-3 (ix)
   6BE6 B7            [ 4] 1449 	or	a, a
   6BE7 C2 BE 6C      [10] 1450 	jp	NZ,00114$
                           1451 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
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
                           1464 ;src/main.c:307: if(enemy->iter == 0){
   6BFF 7A            [ 4] 1465 	ld	a,d
   6C00 B3            [ 4] 1466 	or	a,e
   6C01 20 50         [12] 1467 	jr	NZ,00102$
                           1468 ;src/main.c:309: enemy->mover = SI;
   6C03 DD 6E F7      [19] 1469 	ld	l,-9 (ix)
   6C06 DD 66 F8      [19] 1470 	ld	h,-8 (ix)
   6C09 36 01         [10] 1471 	ld	(hl),#0x01
                           1472 ;src/main.c:310: enemy->iter = 2;
   6C0B DD 6E FB      [19] 1473 	ld	l,-5 (ix)
   6C0E DD 66 FC      [19] 1474 	ld	h,-4 (ix)
   6C11 36 02         [10] 1475 	ld	(hl),#0x02
   6C13 23            [ 6] 1476 	inc	hl
   6C14 36 00         [10] 1477 	ld	(hl),#0x00
                           1478 ;src/main.c:311: enemy->x = enemy->camino[enemy->iter];
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
                           1489 ;src/main.c:312: ++enemy->iter;
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
                           1501 ;src/main.c:313: enemy->y = enemy->camino[enemy->iter];
   6C3B DD 6E F5      [19] 1502 	ld	l,-11 (ix)
   6C3E DD 66 F6      [19] 1503 	ld	h,-10 (ix)
   6C41 09            [11] 1504 	add	hl,bc
   6C42 5E            [ 7] 1505 	ld	e,(hl)
   6C43 E1            [10] 1506 	pop	hl
   6C44 E5            [11] 1507 	push	hl
   6C45 73            [ 7] 1508 	ld	(hl),e
                           1509 ;src/main.c:314: ++enemy->iter;
   6C46 03            [ 6] 1510 	inc	bc
   6C47 DD 6E FB      [19] 1511 	ld	l,-5 (ix)
   6C4A DD 66 FC      [19] 1512 	ld	h,-4 (ix)
   6C4D 71            [ 7] 1513 	ld	(hl),c
   6C4E 23            [ 6] 1514 	inc	hl
   6C4F 70            [ 7] 1515 	ld	(hl),b
   6C50 C3 C0 6D      [10] 1516 	jp	00118$
   6C53                    1517 00102$:
                           1518 ;src/main.c:317: enemy->mover = SI;
   6C53 DD 6E F7      [19] 1519 	ld	l,-9 (ix)
   6C56 DD 66 F8      [19] 1520 	ld	h,-8 (ix)
   6C59 36 01         [10] 1521 	ld	(hl),#0x01
                           1522 ;src/main.c:318: enemy->x = enemy->camino[enemy->iter];
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
                           1533 ;src/main.c:319: ++enemy->iter;
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
                           1545 ;src/main.c:320: enemy->y = enemy->camino[enemy->iter];
   6C80 DD 6E F5      [19] 1546 	ld	l,-11 (ix)
   6C83 DD 66 F6      [19] 1547 	ld	h,-10 (ix)
   6C86 19            [11] 1548 	add	hl,de
   6C87 7E            [ 7] 1549 	ld	a,(hl)
   6C88 E1            [10] 1550 	pop	hl
   6C89 E5            [11] 1551 	push	hl
   6C8A 77            [ 7] 1552 	ld	(hl),a
                           1553 ;src/main.c:321: ++enemy->iter;
   6C8B 13            [ 6] 1554 	inc	de
   6C8C 4B            [ 4] 1555 	ld	c,e
   6C8D DD 6E FB      [19] 1556 	ld	l,-5 (ix)
   6C90 DD 66 FC      [19] 1557 	ld	h,-4 (ix)
   6C93 71            [ 7] 1558 	ld	(hl),c
   6C94 23            [ 6] 1559 	inc	hl
   6C95 72            [ 7] 1560 	ld	(hl),d
   6C96 C3 C0 6D      [10] 1561 	jp	00118$
   6C99                    1562 00105$:
                           1563 ;src/main.c:326: enemy->mover = NO;
   6C99 DD 6E F7      [19] 1564 	ld	l,-9 (ix)
   6C9C DD 66 F8      [19] 1565 	ld	h,-8 (ix)
   6C9F 36 00         [10] 1566 	ld	(hl),#0x00
                           1567 ;src/main.c:327: enemy->iter = enemy->longitud_camino;
   6CA1 DD 6E F9      [19] 1568 	ld	l,-7 (ix)
   6CA4 DD 66 FA      [19] 1569 	ld	h,-6 (ix)
   6CA7 4E            [ 7] 1570 	ld	c,(hl)
   6CA8 06 00         [ 7] 1571 	ld	b,#0x00
   6CAA DD 6E FB      [19] 1572 	ld	l,-5 (ix)
   6CAD DD 66 FC      [19] 1573 	ld	h,-4 (ix)
   6CB0 71            [ 7] 1574 	ld	(hl),c
   6CB1 23            [ 6] 1575 	inc	hl
   6CB2 70            [ 7] 1576 	ld	(hl),b
                           1577 ;src/main.c:331: enemy->reversePatrol = 1;
   6CB3 DD 6E FE      [19] 1578 	ld	l,-2 (ix)
   6CB6 DD 66 FF      [19] 1579 	ld	h,-1 (ix)
   6CB9 36 01         [10] 1580 	ld	(hl),#0x01
   6CBB C3 C0 6D      [10] 1581 	jp	00118$
   6CBE                    1582 00114$:
                           1583 ;src/main.c:336: if(enemy->iter > 0){
   6CBE AF            [ 4] 1584 	xor	a, a
   6CBF BB            [ 4] 1585 	cp	a, e
   6CC0 9A            [ 4] 1586 	sbc	a, d
   6CC1 E2 C6 6C      [10] 1587 	jp	PO, 00145$
   6CC4 EE 80         [ 7] 1588 	xor	a, #0x80
   6CC6                    1589 00145$:
   6CC6 F2 A6 6D      [10] 1590 	jp	P,00111$
                           1591 ;src/main.c:337: if(enemy->iter == enemy->longitud_camino){
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
                           1603 ;src/main.c:338: enemy->mover = SI;
   6CE5 DD 6E F7      [19] 1604 	ld	l,-9 (ix)
   6CE8 DD 66 F8      [19] 1605 	ld	h,-8 (ix)
   6CEB 36 01         [10] 1606 	ld	(hl),#0x01
                           1607 ;src/main.c:339: enemy->iter = enemy->iter - 1;
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
                           1626 ;src/main.c:340: enemy->iter = enemy->iter - 2;
   6D11 DD 5E F9      [19] 1627 	ld	e,-7 (ix)
   6D14 DD 56 FA      [19] 1628 	ld	d,-6 (ix)
   6D17 1B            [ 6] 1629 	dec	de
   6D18 1B            [ 6] 1630 	dec	de
   6D19 DD 6E FB      [19] 1631 	ld	l,-5 (ix)
   6D1C DD 66 FC      [19] 1632 	ld	h,-4 (ix)
   6D1F 73            [ 7] 1633 	ld	(hl),e
   6D20 23            [ 6] 1634 	inc	hl
   6D21 72            [ 7] 1635 	ld	(hl),d
                           1636 ;src/main.c:341: enemy->y = enemy->camino[enemy->iter];
   6D22 DD 6E F5      [19] 1637 	ld	l,-11 (ix)
   6D25 DD 66 F6      [19] 1638 	ld	h,-10 (ix)
   6D28 19            [11] 1639 	add	hl,de
   6D29 5E            [ 7] 1640 	ld	e,(hl)
   6D2A E1            [10] 1641 	pop	hl
   6D2B E5            [11] 1642 	push	hl
   6D2C 73            [ 7] 1643 	ld	(hl),e
                           1644 ;src/main.c:342: --enemy->iter;
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
                           1656 ;src/main.c:343: enemy->x = enemy->camino[enemy->iter];
   6D42 DD 6E F5      [19] 1657 	ld	l,-11 (ix)
   6D45 DD 66 F6      [19] 1658 	ld	h,-10 (ix)
   6D48 19            [11] 1659 	add	hl,de
   6D49 7E            [ 7] 1660 	ld	a,(hl)
   6D4A 02            [ 7] 1661 	ld	(bc),a
                           1662 ;src/main.c:344: --enemy->iter;
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
                           1676 ;src/main.c:346: enemy->mover = SI;
   6D62 DD 6E F7      [19] 1677 	ld	l,-9 (ix)
   6D65 DD 66 F8      [19] 1678 	ld	h,-8 (ix)
   6D68 36 01         [10] 1679 	ld	(hl),#0x01
                           1680 ;src/main.c:347: enemy->y = enemy->camino[enemy->iter];
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
                           1693 ;src/main.c:348: --enemy->iter;
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
                           1705 ;src/main.c:349: enemy->x = enemy->camino[enemy->iter];
   6D91 DD 6E F5      [19] 1706 	ld	l,-11 (ix)
   6D94 DD 66 F6      [19] 1707 	ld	h,-10 (ix)
   6D97 19            [11] 1708 	add	hl,de
   6D98 7E            [ 7] 1709 	ld	a,(hl)
   6D99 02            [ 7] 1710 	ld	(bc),a
                           1711 ;src/main.c:350: --enemy->iter;
   6D9A 1B            [ 6] 1712 	dec	de
   6D9B DD 6E FB      [19] 1713 	ld	l,-5 (ix)
   6D9E DD 66 FC      [19] 1714 	ld	h,-4 (ix)
   6DA1 73            [ 7] 1715 	ld	(hl),e
   6DA2 23            [ 6] 1716 	inc	hl
   6DA3 72            [ 7] 1717 	ld	(hl),d
   6DA4 18 1A         [12] 1718 	jr	00118$
   6DA6                    1719 00111$:
                           1720 ;src/main.c:355: enemy->mover = NO;
   6DA6 DD 6E F7      [19] 1721 	ld	l,-9 (ix)
   6DA9 DD 66 F8      [19] 1722 	ld	h,-8 (ix)
   6DAC 36 00         [10] 1723 	ld	(hl),#0x00
                           1724 ;src/main.c:356: enemy->iter = 0;
   6DAE DD 6E FB      [19] 1725 	ld	l,-5 (ix)
   6DB1 DD 66 FC      [19] 1726 	ld	h,-4 (ix)
   6DB4 AF            [ 4] 1727 	xor	a, a
   6DB5 77            [ 7] 1728 	ld	(hl), a
   6DB6 23            [ 6] 1729 	inc	hl
   6DB7 77            [ 7] 1730 	ld	(hl), a
                           1731 ;src/main.c:358: enemy->reversePatrol = 0;
   6DB8 DD 6E FE      [19] 1732 	ld	l,-2 (ix)
   6DBB DD 66 FF      [19] 1733 	ld	h,-1 (ix)
   6DBE 36 00         [10] 1734 	ld	(hl),#0x00
   6DC0                    1735 00118$:
   6DC0 DD F9         [10] 1736 	ld	sp, ix
   6DC2 DD E1         [14] 1737 	pop	ix
   6DC4 C9            [10] 1738 	ret
                           1739 ;src/main.c:365: void lookFor(TEnemy* enemy){
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
                           1750 ;src/main.c:374: i16 difx = abs((i16)(enemy->x - prota.x));
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
                           1773 ;src/main.c:375: i16 dify = abs((i16)(enemy->y - prota.y));
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
                           1796 ;src/main.c:377: dist = difx + dify; // manhattan
   6E18 DD 4E F9      [19] 1797 	ld	c,-7 (ix)
   6E1B 09            [11] 1798 	add	hl, bc
   6E1C DD 75 FB      [19] 1799 	ld	-5 (ix),l
                           1800 ;src/main.c:378: enemy->seen = NO;
   6E1F 21 12 00      [10] 1801 	ld	hl,#0x0012
   6E22 19            [11] 1802 	add	hl,de
   6E23 DD 75 FC      [19] 1803 	ld	-4 (ix),l
   6E26 DD 74 FD      [19] 1804 	ld	-3 (ix),h
   6E29 DD 6E FC      [19] 1805 	ld	l,-4 (ix)
   6E2C DD 66 FD      [19] 1806 	ld	h,-3 (ix)
   6E2F 36 00         [10] 1807 	ld	(hl),#0x00
                           1808 ;src/main.c:379: enemy->in_range = NO;
   6E31 21 11 00      [10] 1809 	ld	hl,#0x0011
   6E34 19            [11] 1810 	add	hl,de
   6E35 4D            [ 4] 1811 	ld	c,l
   6E36 44            [ 4] 1812 	ld	b,h
   6E37 AF            [ 4] 1813 	xor	a, a
   6E38 02            [ 7] 1814 	ld	(bc),a
                           1815 ;src/main.c:380: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6E39 C5            [11] 1816 	push	bc
   6E3A D5            [11] 1817 	push	de
   6E3B 21 18 5A      [10] 1818 	ld	hl,#0x5A18
   6E3E E5            [11] 1819 	push	hl
   6E3F 21 00 C0      [10] 1820 	ld	hl,#0xC000
   6E42 E5            [11] 1821 	push	hl
   6E43 CD 05 60      [17] 1822 	call	_cpct_getScreenPtr
   6E46 D1            [10] 1823 	pop	de
   6E47 C1            [10] 1824 	pop	bc
                           1825 ;src/main.c:381: if(!enemy->seek){
   6E48 D5            [11] 1826 	push	de
   6E49 FD E1         [14] 1827 	pop	iy
   6E4B FD 7E 14      [19] 1828 	ld	a,20 (iy)
   6E4E B7            [ 4] 1829 	or	a, a
   6E4F C2 D5 6E      [10] 1830 	jp	NZ,00111$
                           1831 ;src/main.c:382: if (dist <= 10) {// te detectan los sensores de proximidad
   6E52 3E 0A         [ 7] 1832 	ld	a,#0x0A
   6E54 DD 96 FB      [19] 1833 	sub	a, -5 (ix)
   6E57 38 13         [12] 1834 	jr	C,00107$
                           1835 ;src/main.c:383: enemy->in_range = 1;
   6E59 3E 01         [ 7] 1836 	ld	a,#0x01
   6E5B 02            [ 7] 1837 	ld	(bc),a
                           1838 ;src/main.c:384: enemy->engage = 1;
   6E5C 21 16 00      [10] 1839 	ld	hl,#0x0016
   6E5F 19            [11] 1840 	add	hl,de
   6E60 36 01         [10] 1841 	ld	(hl),#0x01
                           1842 ;src/main.c:385: enemy->seen = SI;
   6E62 DD 6E FC      [19] 1843 	ld	l,-4 (ix)
   6E65 DD 66 FD      [19] 1844 	ld	h,-3 (ix)
   6E68 36 01         [10] 1845 	ld	(hl),#0x01
   6E6A 18 69         [12] 1846 	jr	00111$
   6E6C                    1847 00107$:
                           1848 ;src/main.c:386: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6E6C 21 E8 63      [10] 1849 	ld	hl, #_prota + 0
   6E6F 4E            [ 7] 1850 	ld	c,(hl)
   6E70 1A            [ 7] 1851 	ld	a,(de)
   6E71 5F            [ 4] 1852 	ld	e,a
   6E72 16 00         [ 7] 1853 	ld	d,#0x00
   6E74 7B            [ 4] 1854 	ld	a,e
   6E75 C6 E7         [ 7] 1855 	add	a,#0xE7
   6E77 6F            [ 4] 1856 	ld	l,a
   6E78 7A            [ 4] 1857 	ld	a,d
   6E79 CE FF         [ 7] 1858 	adc	a,#0xFF
   6E7B 67            [ 4] 1859 	ld	h,a
   6E7C 06 00         [ 7] 1860 	ld	b,#0x00
   6E7E 7D            [ 4] 1861 	ld	a,l
   6E7F 91            [ 4] 1862 	sub	a, c
   6E80 7C            [ 4] 1863 	ld	a,h
   6E81 98            [ 4] 1864 	sbc	a, b
   6E82 E2 87 6E      [10] 1865 	jp	PO, 00137$
   6E85 EE 80         [ 7] 1866 	xor	a, #0x80
   6E87                    1867 00137$:
   6E87 F2 D5 6E      [10] 1868 	jp	P,00111$
   6E8A 21 19 00      [10] 1869 	ld	hl,#0x0019
   6E8D 19            [11] 1870 	add	hl,de
   6E8E 79            [ 4] 1871 	ld	a,c
   6E8F 95            [ 4] 1872 	sub	a, l
   6E90 78            [ 4] 1873 	ld	a,b
   6E91 9C            [ 4] 1874 	sbc	a, h
   6E92 E2 97 6E      [10] 1875 	jp	PO, 00138$
   6E95 EE 80         [ 7] 1876 	xor	a, #0x80
   6E97                    1877 00138$:
   6E97 F2 D5 6E      [10] 1878 	jp	P,00111$
                           1879 ;src/main.c:387: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6E9A 21 E9 63      [10] 1880 	ld	hl, #(_prota + 0x0001) + 0
   6E9D 4E            [ 7] 1881 	ld	c,(hl)
   6E9E DD 6E FE      [19] 1882 	ld	l,-2 (ix)
   6EA1 DD 66 FF      [19] 1883 	ld	h,-1 (ix)
   6EA4 5E            [ 7] 1884 	ld	e,(hl)
   6EA5 16 00         [ 7] 1885 	ld	d,#0x00
   6EA7 7B            [ 4] 1886 	ld	a,e
   6EA8 C6 CC         [ 7] 1887 	add	a,#0xCC
   6EAA 6F            [ 4] 1888 	ld	l,a
   6EAB 7A            [ 4] 1889 	ld	a,d
   6EAC CE FF         [ 7] 1890 	adc	a,#0xFF
   6EAE 67            [ 4] 1891 	ld	h,a
   6EAF 06 00         [ 7] 1892 	ld	b,#0x00
   6EB1 7D            [ 4] 1893 	ld	a,l
   6EB2 91            [ 4] 1894 	sub	a, c
   6EB3 7C            [ 4] 1895 	ld	a,h
   6EB4 98            [ 4] 1896 	sbc	a, b
   6EB5 E2 BA 6E      [10] 1897 	jp	PO, 00139$
   6EB8 EE 80         [ 7] 1898 	xor	a, #0x80
   6EBA                    1899 00139$:
   6EBA F2 D5 6E      [10] 1900 	jp	P,00111$
   6EBD 21 34 00      [10] 1901 	ld	hl,#0x0034
   6EC0 19            [11] 1902 	add	hl,de
   6EC1 79            [ 4] 1903 	ld	a,c
   6EC2 95            [ 4] 1904 	sub	a, l
   6EC3 78            [ 4] 1905 	ld	a,b
   6EC4 9C            [ 4] 1906 	sbc	a, h
   6EC5 E2 CA 6E      [10] 1907 	jp	PO, 00140$
   6EC8 EE 80         [ 7] 1908 	xor	a, #0x80
   6ECA                    1909 00140$:
   6ECA F2 D5 6E      [10] 1910 	jp	P,00111$
                           1911 ;src/main.c:388: enemy->seen = SI;
   6ECD DD 6E FC      [19] 1912 	ld	l,-4 (ix)
   6ED0 DD 66 FD      [19] 1913 	ld	h,-3 (ix)
   6ED3 36 01         [10] 1914 	ld	(hl),#0x01
   6ED5                    1915 00111$:
   6ED5 DD F9         [10] 1916 	ld	sp, ix
   6ED7 DD E1         [14] 1917 	pop	ix
   6ED9 C9            [10] 1918 	ret
                           1919 ;src/main.c:394: void moverEnemigoSeek(TEnemy* actual){
                           1920 ;	---------------------------------
                           1921 ; Function moverEnemigoSeek
                           1922 ; ---------------------------------
   6EDA                    1923 _moverEnemigoSeek::
   6EDA DD E5         [15] 1924 	push	ix
   6EDC DD 21 00 00   [14] 1925 	ld	ix,#0
   6EE0 DD 39         [15] 1926 	add	ix,sp
   6EE2 21 F6 FF      [10] 1927 	ld	hl,#-10
   6EE5 39            [11] 1928 	add	hl,sp
   6EE6 F9            [ 6] 1929 	ld	sp,hl
                           1930 ;src/main.c:396: if(!actual->muerto){
   6EE7 DD 4E 04      [19] 1931 	ld	c,4 (ix)
   6EEA DD 46 05      [19] 1932 	ld	b,5 (ix)
   6EED C5            [11] 1933 	push	bc
   6EEE FD E1         [14] 1934 	pop	iy
   6EF0 FD 7E 08      [19] 1935 	ld	a, 8 (iy)
   6EF3 B7            [ 4] 1936 	or	a, a
   6EF4 C2 87 70      [10] 1937 	jp	NZ,00114$
                           1938 ;src/main.c:399: if(actual->iter < actual->longitud_camino){
   6EF7 21 0E 00      [10] 1939 	ld	hl,#0x000E
   6EFA 09            [11] 1940 	add	hl,bc
   6EFB DD 75 FE      [19] 1941 	ld	-2 (ix),l
   6EFE DD 74 FF      [19] 1942 	ld	-1 (ix),h
   6F01 DD 6E FE      [19] 1943 	ld	l,-2 (ix)
   6F04 DD 66 FF      [19] 1944 	ld	h,-1 (ix)
   6F07 7E            [ 7] 1945 	ld	a,(hl)
   6F08 DD 77 FC      [19] 1946 	ld	-4 (ix),a
   6F0B 23            [ 6] 1947 	inc	hl
   6F0C 7E            [ 7] 1948 	ld	a,(hl)
   6F0D DD 77 FD      [19] 1949 	ld	-3 (ix),a
   6F10 69            [ 4] 1950 	ld	l, c
   6F11 60            [ 4] 1951 	ld	h, b
   6F12 11 E1 00      [10] 1952 	ld	de, #0x00E1
   6F15 19            [11] 1953 	add	hl, de
   6F16 5E            [ 7] 1954 	ld	e,(hl)
   6F17 16 00         [ 7] 1955 	ld	d,#0x00
                           1956 ;src/main.c:408: actual->y = actual->camino[actual->iter];
   6F19 21 01 00      [10] 1957 	ld	hl,#0x0001
   6F1C 09            [11] 1958 	add	hl,bc
   6F1D DD 75 FA      [19] 1959 	ld	-6 (ix),l
   6F20 DD 74 FB      [19] 1960 	ld	-5 (ix),h
                           1961 ;src/main.c:399: if(actual->iter < actual->longitud_camino){
   6F23 DD 7E FC      [19] 1962 	ld	a,-4 (ix)
   6F26 93            [ 4] 1963 	sub	a, e
   6F27 DD 7E FD      [19] 1964 	ld	a,-3 (ix)
   6F2A 9A            [ 4] 1965 	sbc	a, d
   6F2B E2 30 6F      [10] 1966 	jp	PO, 00136$
   6F2E EE 80         [ 7] 1967 	xor	a, #0x80
   6F30                    1968 00136$:
   6F30 F2 C4 6F      [10] 1969 	jp	P,00110$
                           1970 ;src/main.c:404: actual->mover = SI;
   6F33 21 06 00      [10] 1971 	ld	hl,#0x0006
   6F36 09            [11] 1972 	add	hl,bc
                           1973 ;src/main.c:406: actual->x = actual->camino[actual->iter];
   6F37 79            [ 4] 1974 	ld	a,c
   6F38 C6 19         [ 7] 1975 	add	a, #0x19
   6F3A 5F            [ 4] 1976 	ld	e,a
   6F3B 78            [ 4] 1977 	ld	a,b
   6F3C CE 00         [ 7] 1978 	adc	a, #0x00
   6F3E 57            [ 4] 1979 	ld	d,a
                           1980 ;src/main.c:402: if(actual->iter == 0){
   6F3F DD 7E FD      [19] 1981 	ld	a,-3 (ix)
   6F42 DD B6 FC      [19] 1982 	or	a,-4 (ix)
   6F45 20 44         [12] 1983 	jr	NZ,00102$
                           1984 ;src/main.c:404: actual->mover = SI;
   6F47 36 01         [10] 1985 	ld	(hl),#0x01
                           1986 ;src/main.c:405: actual->iter = 2;
   6F49 DD 6E FE      [19] 1987 	ld	l,-2 (ix)
   6F4C DD 66 FF      [19] 1988 	ld	h,-1 (ix)
   6F4F 36 02         [10] 1989 	ld	(hl),#0x02
   6F51 23            [ 6] 1990 	inc	hl
   6F52 36 00         [10] 1991 	ld	(hl),#0x00
                           1992 ;src/main.c:406: actual->x = actual->camino[actual->iter];
   6F54 DD 6E FE      [19] 1993 	ld	l,-2 (ix)
   6F57 DD 66 FF      [19] 1994 	ld	h,-1 (ix)
   6F5A 7E            [ 7] 1995 	ld	a, (hl)
   6F5B 23            [ 6] 1996 	inc	hl
   6F5C 66            [ 7] 1997 	ld	h,(hl)
   6F5D 6F            [ 4] 1998 	ld	l,a
   6F5E 19            [11] 1999 	add	hl,de
   6F5F 7E            [ 7] 2000 	ld	a,(hl)
   6F60 02            [ 7] 2001 	ld	(bc),a
                           2002 ;src/main.c:407: ++actual->iter;
   6F61 DD 6E FE      [19] 2003 	ld	l,-2 (ix)
   6F64 DD 66 FF      [19] 2004 	ld	h,-1 (ix)
   6F67 4E            [ 7] 2005 	ld	c,(hl)
   6F68 23            [ 6] 2006 	inc	hl
   6F69 46            [ 7] 2007 	ld	b,(hl)
   6F6A 03            [ 6] 2008 	inc	bc
   6F6B DD 6E FE      [19] 2009 	ld	l,-2 (ix)
   6F6E DD 66 FF      [19] 2010 	ld	h,-1 (ix)
   6F71 71            [ 7] 2011 	ld	(hl),c
   6F72 23            [ 6] 2012 	inc	hl
   6F73 70            [ 7] 2013 	ld	(hl),b
                           2014 ;src/main.c:408: actual->y = actual->camino[actual->iter];
   6F74 EB            [ 4] 2015 	ex	de,hl
   6F75 09            [11] 2016 	add	hl,bc
   6F76 5E            [ 7] 2017 	ld	e,(hl)
   6F77 DD 6E FA      [19] 2018 	ld	l,-6 (ix)
   6F7A DD 66 FB      [19] 2019 	ld	h,-5 (ix)
   6F7D 73            [ 7] 2020 	ld	(hl),e
                           2021 ;src/main.c:409: ++actual->iter;
   6F7E 03            [ 6] 2022 	inc	bc
   6F7F DD 6E FE      [19] 2023 	ld	l,-2 (ix)
   6F82 DD 66 FF      [19] 2024 	ld	h,-1 (ix)
   6F85 71            [ 7] 2025 	ld	(hl),c
   6F86 23            [ 6] 2026 	inc	hl
   6F87 70            [ 7] 2027 	ld	(hl),b
   6F88 C3 87 70      [10] 2028 	jp	00114$
   6F8B                    2029 00102$:
                           2030 ;src/main.c:412: actual->mover = SI;
   6F8B 36 01         [10] 2031 	ld	(hl),#0x01
                           2032 ;src/main.c:413: actual->x = actual->camino[actual->iter];
   6F8D DD 6E FE      [19] 2033 	ld	l,-2 (ix)
   6F90 DD 66 FF      [19] 2034 	ld	h,-1 (ix)
   6F93 7E            [ 7] 2035 	ld	a, (hl)
   6F94 23            [ 6] 2036 	inc	hl
   6F95 66            [ 7] 2037 	ld	h,(hl)
   6F96 6F            [ 4] 2038 	ld	l,a
   6F97 19            [11] 2039 	add	hl,de
   6F98 7E            [ 7] 2040 	ld	a,(hl)
   6F99 02            [ 7] 2041 	ld	(bc),a
                           2042 ;src/main.c:414: ++actual->iter;
   6F9A DD 6E FE      [19] 2043 	ld	l,-2 (ix)
   6F9D DD 66 FF      [19] 2044 	ld	h,-1 (ix)
   6FA0 4E            [ 7] 2045 	ld	c,(hl)
   6FA1 23            [ 6] 2046 	inc	hl
   6FA2 46            [ 7] 2047 	ld	b,(hl)
   6FA3 03            [ 6] 2048 	inc	bc
   6FA4 DD 6E FE      [19] 2049 	ld	l,-2 (ix)
   6FA7 DD 66 FF      [19] 2050 	ld	h,-1 (ix)
   6FAA 71            [ 7] 2051 	ld	(hl),c
   6FAB 23            [ 6] 2052 	inc	hl
   6FAC 70            [ 7] 2053 	ld	(hl),b
                           2054 ;src/main.c:415: actual->y = actual->camino[actual->iter];
   6FAD EB            [ 4] 2055 	ex	de,hl
   6FAE 09            [11] 2056 	add	hl,bc
   6FAF 5E            [ 7] 2057 	ld	e,(hl)
   6FB0 DD 6E FA      [19] 2058 	ld	l,-6 (ix)
   6FB3 DD 66 FB      [19] 2059 	ld	h,-5 (ix)
   6FB6 73            [ 7] 2060 	ld	(hl),e
                           2061 ;src/main.c:416: ++actual->iter;
   6FB7 03            [ 6] 2062 	inc	bc
   6FB8 DD 6E FE      [19] 2063 	ld	l,-2 (ix)
   6FBB DD 66 FF      [19] 2064 	ld	h,-1 (ix)
   6FBE 71            [ 7] 2065 	ld	(hl),c
   6FBF 23            [ 6] 2066 	inc	hl
   6FC0 70            [ 7] 2067 	ld	(hl),b
   6FC1 C3 87 70      [10] 2068 	jp	00114$
   6FC4                    2069 00110$:
                           2070 ;src/main.c:421: actual->seek = 0;
   6FC4 21 14 00      [10] 2071 	ld	hl,#0x0014
   6FC7 09            [11] 2072 	add	hl,bc
   6FC8 DD 75 FC      [19] 2073 	ld	-4 (ix),l
   6FCB DD 74 FD      [19] 2074 	ld	-3 (ix),h
   6FCE DD 6E FC      [19] 2075 	ld	l,-4 (ix)
   6FD1 DD 66 FD      [19] 2076 	ld	h,-3 (ix)
   6FD4 36 00         [10] 2077 	ld	(hl),#0x00
                           2078 ;src/main.c:422: lookFor(actual);
   6FD6 C5            [11] 2079 	push	bc
   6FD7 C5            [11] 2080 	push	bc
   6FD8 CD C5 6D      [17] 2081 	call	_lookFor
   6FDB F1            [10] 2082 	pop	af
   6FDC C1            [10] 2083 	pop	bc
                           2084 ;src/main.c:423: if(!actual->seen){
   6FDD 69            [ 4] 2085 	ld	l, c
   6FDE 60            [ 4] 2086 	ld	h, b
   6FDF 11 12 00      [10] 2087 	ld	de, #0x0012
   6FE2 19            [11] 2088 	add	hl, de
   6FE3 7E            [ 7] 2089 	ld	a,(hl)
   6FE4 DD 77 F9      [19] 2090 	ld	-7 (ix),a
                           2091 ;src/main.c:424: actual->patrolling = 1;
   6FE7 21 0B 00      [10] 2092 	ld	hl,#0x000B
   6FEA 09            [11] 2093 	add	hl,bc
   6FEB DD 75 F7      [19] 2094 	ld	-9 (ix),l
   6FEE DD 74 F8      [19] 2095 	ld	-8 (ix),h
                           2096 ;src/main.c:423: if(!actual->seen){
   6FF1 DD 7E F9      [19] 2097 	ld	a,-7 (ix)
   6FF4 B7            [ 4] 2098 	or	a, a
   6FF5 20 3C         [12] 2099 	jr	NZ,00107$
                           2100 ;src/main.c:424: actual->patrolling = 1;
   6FF7 DD 6E F7      [19] 2101 	ld	l,-9 (ix)
   6FFA DD 66 F8      [19] 2102 	ld	h,-8 (ix)
   6FFD 36 01         [10] 2103 	ld	(hl),#0x01
                           2104 ;src/main.c:425: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   6FFF C5            [11] 2105 	push	bc
   7000 FD E1         [14] 2106 	pop	iy
   7002 FD 7E 18      [19] 2107 	ld	a,24 (iy)
   7005 DD 77 F9      [19] 2108 	ld	-7 (ix),a
   7008 C5            [11] 2109 	push	bc
   7009 FD E1         [14] 2110 	pop	iy
   700B FD 56 17      [19] 2111 	ld	d,23 (iy)
   700E DD 6E FA      [19] 2112 	ld	l,-6 (ix)
   7011 DD 66 FB      [19] 2113 	ld	h,-5 (ix)
   7014 5E            [ 7] 2114 	ld	e,(hl)
   7015 0A            [ 7] 2115 	ld	a,(bc)
   7016 DD 77 F6      [19] 2116 	ld	-10 (ix),a
   7019 2A C5 64      [16] 2117 	ld	hl,(_mapa)
   701C E5            [11] 2118 	push	hl
   701D C5            [11] 2119 	push	bc
   701E DD 7E F9      [19] 2120 	ld	a,-7 (ix)
   7021 F5            [11] 2121 	push	af
   7022 33            [ 6] 2122 	inc	sp
   7023 D5            [11] 2123 	push	de
   7024 DD 7E F6      [19] 2124 	ld	a,-10 (ix)
   7027 F5            [11] 2125 	push	af
   7028 33            [ 6] 2126 	inc	sp
   7029 CD 72 49      [17] 2127 	call	_pathFinding
   702C 21 08 00      [10] 2128 	ld	hl,#8
   702F 39            [11] 2129 	add	hl,sp
   7030 F9            [ 6] 2130 	ld	sp,hl
   7031 18 4A         [12] 2131 	jr	00108$
   7033                    2132 00107$:
                           2133 ;src/main.c:427: actual->patrolling = 0;
   7033 DD 6E F7      [19] 2134 	ld	l,-9 (ix)
   7036 DD 66 F8      [19] 2135 	ld	h,-8 (ix)
   7039 36 00         [10] 2136 	ld	(hl),#0x00
                           2137 ;src/main.c:428: if(!actual->engage){
   703B C5            [11] 2138 	push	bc
   703C FD E1         [14] 2139 	pop	iy
   703E FD 7E 16      [19] 2140 	ld	a,22 (iy)
   7041 B7            [ 4] 2141 	or	a, a
   7042 20 39         [12] 2142 	jr	NZ,00108$
                           2143 ;src/main.c:429: actual->seek = 1;
   7044 DD 6E FC      [19] 2144 	ld	l,-4 (ix)
   7047 DD 66 FD      [19] 2145 	ld	h,-3 (ix)
   704A 36 01         [10] 2146 	ld	(hl),#0x01
                           2147 ;src/main.c:430: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   704C 3A E9 63      [13] 2148 	ld	a,(#_prota + 1)
   704F DD 77 F6      [19] 2149 	ld	-10 (ix),a
   7052 21 E8 63      [10] 2150 	ld	hl, #_prota + 0
   7055 5E            [ 7] 2151 	ld	e,(hl)
   7056 DD 6E FA      [19] 2152 	ld	l,-6 (ix)
   7059 DD 66 FB      [19] 2153 	ld	h,-5 (ix)
   705C 56            [ 7] 2154 	ld	d,(hl)
   705D 0A            [ 7] 2155 	ld	a,(bc)
   705E DD 77 F7      [19] 2156 	ld	-9 (ix),a
   7061 2A C5 64      [16] 2157 	ld	hl,(_mapa)
   7064 E5            [11] 2158 	push	hl
   7065 C5            [11] 2159 	push	bc
   7066 DD 7E F6      [19] 2160 	ld	a,-10 (ix)
   7069 F5            [11] 2161 	push	af
   706A 33            [ 6] 2162 	inc	sp
   706B 7B            [ 4] 2163 	ld	a,e
   706C F5            [11] 2164 	push	af
   706D 33            [ 6] 2165 	inc	sp
   706E D5            [11] 2166 	push	de
   706F 33            [ 6] 2167 	inc	sp
   7070 DD 7E F7      [19] 2168 	ld	a,-9 (ix)
   7073 F5            [11] 2169 	push	af
   7074 33            [ 6] 2170 	inc	sp
   7075 CD 72 49      [17] 2171 	call	_pathFinding
   7078 21 08 00      [10] 2172 	ld	hl,#8
   707B 39            [11] 2173 	add	hl,sp
   707C F9            [ 6] 2174 	ld	sp,hl
   707D                    2175 00108$:
                           2176 ;src/main.c:433: actual->iter = 0;
   707D DD 6E FE      [19] 2177 	ld	l,-2 (ix)
   7080 DD 66 FF      [19] 2178 	ld	h,-1 (ix)
   7083 AF            [ 4] 2179 	xor	a, a
   7084 77            [ 7] 2180 	ld	(hl), a
   7085 23            [ 6] 2181 	inc	hl
   7086 77            [ 7] 2182 	ld	(hl), a
   7087                    2183 00114$:
   7087 DD F9         [10] 2184 	ld	sp, ix
   7089 DD E1         [14] 2185 	pop	ix
   708B C9            [10] 2186 	ret
                           2187 ;src/main.c:441: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2188 ;	---------------------------------
                           2189 ; Function engage
                           2190 ; ---------------------------------
   708C                    2191 _engage::
   708C DD E5         [15] 2192 	push	ix
   708E DD 21 00 00   [14] 2193 	ld	ix,#0
   7092 DD 39         [15] 2194 	add	ix,sp
   7094 21 F1 FF      [10] 2195 	ld	hl,#-15
   7097 39            [11] 2196 	add	hl,sp
   7098 F9            [ 6] 2197 	ld	sp,hl
                           2198 ;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7099 DD 7E 04      [19] 2199 	ld	a,4 (ix)
   709C DD 77 F4      [19] 2200 	ld	-12 (ix),a
   709F DD 7E 05      [19] 2201 	ld	a,5 (ix)
   70A2 DD 77 F5      [19] 2202 	ld	-11 (ix),a
   70A5 DD 6E F4      [19] 2203 	ld	l,-12 (ix)
   70A8 DD 66 F5      [19] 2204 	ld	h,-11 (ix)
   70AB 4E            [ 7] 2205 	ld	c,(hl)
   70AC 06 00         [ 7] 2206 	ld	b,#0x00
   70AE 21 E8 63      [10] 2207 	ld	hl,#_prota+0
   70B1 5E            [ 7] 2208 	ld	e,(hl)
   70B2 16 00         [ 7] 2209 	ld	d,#0x00
   70B4 79            [ 4] 2210 	ld	a,c
   70B5 93            [ 4] 2211 	sub	a, e
   70B6 4F            [ 4] 2212 	ld	c,a
   70B7 78            [ 4] 2213 	ld	a,b
   70B8 9A            [ 4] 2214 	sbc	a, d
   70B9 47            [ 4] 2215 	ld	b,a
   70BA C5            [11] 2216 	push	bc
   70BB CD 60 4B      [17] 2217 	call	_abs
   70BE F1            [10] 2218 	pop	af
   70BF 4D            [ 4] 2219 	ld	c,l
                           2220 ;src/main.c:443: u8 dify = abs(enemy->y - prota.y);
   70C0 DD 7E F4      [19] 2221 	ld	a,-12 (ix)
   70C3 C6 01         [ 7] 2222 	add	a, #0x01
   70C5 DD 77 F6      [19] 2223 	ld	-10 (ix),a
   70C8 DD 7E F5      [19] 2224 	ld	a,-11 (ix)
   70CB CE 00         [ 7] 2225 	adc	a, #0x00
   70CD DD 77 F7      [19] 2226 	ld	-9 (ix),a
   70D0 DD 6E F6      [19] 2227 	ld	l,-10 (ix)
   70D3 DD 66 F7      [19] 2228 	ld	h,-9 (ix)
   70D6 5E            [ 7] 2229 	ld	e,(hl)
   70D7 16 00         [ 7] 2230 	ld	d,#0x00
   70D9 21 E9 63      [10] 2231 	ld	hl, #_prota + 1
   70DC 6E            [ 7] 2232 	ld	l,(hl)
   70DD 26 00         [ 7] 2233 	ld	h,#0x00
   70DF 7B            [ 4] 2234 	ld	a,e
   70E0 95            [ 4] 2235 	sub	a, l
   70E1 5F            [ 4] 2236 	ld	e,a
   70E2 7A            [ 4] 2237 	ld	a,d
   70E3 9C            [ 4] 2238 	sbc	a, h
   70E4 57            [ 4] 2239 	ld	d,a
   70E5 C5            [11] 2240 	push	bc
   70E6 D5            [11] 2241 	push	de
   70E7 CD 60 4B      [17] 2242 	call	_abs
   70EA F1            [10] 2243 	pop	af
   70EB C1            [10] 2244 	pop	bc
                           2245 ;src/main.c:444: u8 dist = difx + dify; // manhattan
   70EC 09            [11] 2246 	add	hl, bc
   70ED DD 75 F1      [19] 2247 	ld	-15 (ix),l
                           2248 ;src/main.c:446: u8 movX = 0;
   70F0 DD 36 F2 00   [19] 2249 	ld	-14 (ix),#0x00
                           2250 ;src/main.c:447: u8 movY = 0;
   70F4 DD 36 F3 00   [19] 2251 	ld	-13 (ix),#0x00
                           2252 ;src/main.c:448: u8 distConstraint = 25;
   70F8 0E 19         [ 7] 2253 	ld	c,#0x19
                           2254 ;src/main.c:449: enemy->mover = NO;
   70FA DD 7E F4      [19] 2255 	ld	a,-12 (ix)
   70FD C6 06         [ 7] 2256 	add	a, #0x06
   70FF DD 77 F8      [19] 2257 	ld	-8 (ix),a
   7102 DD 7E F5      [19] 2258 	ld	a,-11 (ix)
   7105 CE 00         [ 7] 2259 	adc	a, #0x00
   7107 DD 77 F9      [19] 2260 	ld	-7 (ix),a
   710A DD 6E F8      [19] 2261 	ld	l,-8 (ix)
   710D DD 66 F9      [19] 2262 	ld	h,-7 (ix)
   7110 36 00         [10] 2263 	ld	(hl),#0x00
                           2264 ;src/main.c:451: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7112 DD 6E F6      [19] 2265 	ld	l,-10 (ix)
   7115 DD 66 F7      [19] 2266 	ld	h,-9 (ix)
   7118 7E            [ 7] 2267 	ld	a,(hl)
   7119 DD 77 FA      [19] 2268 	ld	-6 (ix),a
                           2269 ;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   711C DD 6E F4      [19] 2270 	ld	l,-12 (ix)
   711F DD 66 F5      [19] 2271 	ld	h,-11 (ix)
   7122 46            [ 7] 2272 	ld	b,(hl)
                           2273 ;src/main.c:464: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7123 78            [ 4] 2274 	ld	a,b
   7124 C6 04         [ 7] 2275 	add	a, #0x04
   7126 DD 77 FB      [19] 2276 	ld	-5 (ix),a
                           2277 ;src/main.c:451: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7129 DD 7E 07      [19] 2278 	ld	a,7 (ix)
   712C DD 96 FA      [19] 2279 	sub	a, -6 (ix)
   712F 28 38         [12] 2280 	jr	Z,00194$
   7131 DD 5E 07      [19] 2281 	ld	e,7 (ix)
   7134 16 00         [ 7] 2282 	ld	d,#0x00
   7136 21 01 00      [10] 2283 	ld	hl,#0x0001
   7139 19            [11] 2284 	add	hl,de
   713A DD 75 FC      [19] 2285 	ld	-4 (ix),l
   713D DD 74 FD      [19] 2286 	ld	-3 (ix),h
   7140 DD 7E FA      [19] 2287 	ld	a,-6 (ix)
   7143 DD 77 FE      [19] 2288 	ld	-2 (ix),a
   7146 DD 36 FF 00   [19] 2289 	ld	-1 (ix),#0x00
   714A DD 7E FE      [19] 2290 	ld	a,-2 (ix)
   714D DD 96 FC      [19] 2291 	sub	a, -4 (ix)
   7150 20 08         [12] 2292 	jr	NZ,00422$
   7152 DD 7E FF      [19] 2293 	ld	a,-1 (ix)
   7155 DD 96 FD      [19] 2294 	sub	a, -3 (ix)
   7158 28 0F         [12] 2295 	jr	Z,00194$
   715A                    2296 00422$:
   715A 1B            [ 6] 2297 	dec	de
   715B DD 7E FE      [19] 2298 	ld	a,-2 (ix)
   715E 93            [ 4] 2299 	sub	a, e
   715F C2 72 72      [10] 2300 	jp	NZ,00195$
   7162 DD 7E FF      [19] 2301 	ld	a,-1 (ix)
   7165 92            [ 4] 2302 	sub	a, d
   7166 C2 72 72      [10] 2303 	jp	NZ,00195$
   7169                    2304 00194$:
                           2305 ;src/main.c:452: if (dx < enemy->x) { // izquierda
   7169 DD 7E 06      [19] 2306 	ld	a,6 (ix)
   716C 90            [ 4] 2307 	sub	a, b
   716D D2 EF 71      [10] 2308 	jp	NC,00114$
                           2309 ;src/main.c:453: if (dist > 11) {
   7170 3E 0B         [ 7] 2310 	ld	a,#0x0B
   7172 DD 96 F1      [19] 2311 	sub	a, -15 (ix)
   7175 D2 32 78      [10] 2312 	jp	NC,00199$
                           2313 ;src/main.c:454: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7178 DD 7E FA      [19] 2314 	ld	a,-6 (ix)
   717B F5            [11] 2315 	push	af
   717C 33            [ 6] 2316 	inc	sp
   717D C5            [11] 2317 	push	bc
   717E 33            [ 6] 2318 	inc	sp
   717F 2A C5 64      [16] 2319 	ld	hl,(_mapa)
   7182 E5            [11] 2320 	push	hl
   7183 CD 1C 4B      [17] 2321 	call	_getTilePtr
   7186 F1            [10] 2322 	pop	af
   7187 F1            [10] 2323 	pop	af
   7188 4E            [ 7] 2324 	ld	c,(hl)
   7189 3E 02         [ 7] 2325 	ld	a,#0x02
   718B 91            [ 4] 2326 	sub	a, c
   718C DA 32 78      [10] 2327 	jp	C,00199$
                           2328 ;src/main.c:455: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   718F DD 6E F6      [19] 2329 	ld	l,-10 (ix)
   7192 DD 66 F7      [19] 2330 	ld	h,-9 (ix)
   7195 7E            [ 7] 2331 	ld	a,(hl)
   7196 C6 0B         [ 7] 2332 	add	a, #0x0B
   7198 57            [ 4] 2333 	ld	d,a
   7199 DD 6E F4      [19] 2334 	ld	l,-12 (ix)
   719C DD 66 F5      [19] 2335 	ld	h,-11 (ix)
   719F 46            [ 7] 2336 	ld	b,(hl)
   71A0 D5            [11] 2337 	push	de
   71A1 33            [ 6] 2338 	inc	sp
   71A2 C5            [11] 2339 	push	bc
   71A3 33            [ 6] 2340 	inc	sp
   71A4 2A C5 64      [16] 2341 	ld	hl,(_mapa)
   71A7 E5            [11] 2342 	push	hl
   71A8 CD 1C 4B      [17] 2343 	call	_getTilePtr
   71AB F1            [10] 2344 	pop	af
   71AC F1            [10] 2345 	pop	af
   71AD 4E            [ 7] 2346 	ld	c,(hl)
   71AE 3E 02         [ 7] 2347 	ld	a,#0x02
   71B0 91            [ 4] 2348 	sub	a, c
   71B1 DA 32 78      [10] 2349 	jp	C,00199$
                           2350 ;src/main.c:456: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   71B4 DD 6E F6      [19] 2351 	ld	l,-10 (ix)
   71B7 DD 66 F7      [19] 2352 	ld	h,-9 (ix)
   71BA 7E            [ 7] 2353 	ld	a,(hl)
   71BB C6 16         [ 7] 2354 	add	a, #0x16
   71BD 57            [ 4] 2355 	ld	d,a
   71BE DD 6E F4      [19] 2356 	ld	l,-12 (ix)
   71C1 DD 66 F5      [19] 2357 	ld	h,-11 (ix)
   71C4 46            [ 7] 2358 	ld	b,(hl)
   71C5 D5            [11] 2359 	push	de
   71C6 33            [ 6] 2360 	inc	sp
   71C7 C5            [11] 2361 	push	bc
   71C8 33            [ 6] 2362 	inc	sp
   71C9 2A C5 64      [16] 2363 	ld	hl,(_mapa)
   71CC E5            [11] 2364 	push	hl
   71CD CD 1C 4B      [17] 2365 	call	_getTilePtr
   71D0 F1            [10] 2366 	pop	af
   71D1 F1            [10] 2367 	pop	af
   71D2 4E            [ 7] 2368 	ld	c,(hl)
   71D3 3E 02         [ 7] 2369 	ld	a,#0x02
   71D5 91            [ 4] 2370 	sub	a, c
   71D6 DA 32 78      [10] 2371 	jp	C,00199$
                           2372 ;src/main.c:457: moverEnemigoIzquierda(enemy);
   71D9 DD 6E F4      [19] 2373 	ld	l,-12 (ix)
   71DC DD 66 F5      [19] 2374 	ld	h,-11 (ix)
   71DF E5            [11] 2375 	push	hl
   71E0 CD 6A 6B      [17] 2376 	call	_moverEnemigoIzquierda
   71E3 F1            [10] 2377 	pop	af
                           2378 ;src/main.c:459: enemy->mover = SI;
   71E4 DD 6E F8      [19] 2379 	ld	l,-8 (ix)
   71E7 DD 66 F9      [19] 2380 	ld	h,-7 (ix)
   71EA 36 01         [10] 2381 	ld	(hl),#0x01
   71EC C3 32 78      [10] 2382 	jp	00199$
   71EF                    2383 00114$:
                           2384 ;src/main.c:463: if (dist > G_ENEMY_W + 3) {
   71EF 3E 07         [ 7] 2385 	ld	a,#0x07
   71F1 DD 96 F1      [19] 2386 	sub	a, -15 (ix)
   71F4 D2 32 78      [10] 2387 	jp	NC,00199$
                           2388 ;src/main.c:464: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   71F7 DD 66 FA      [19] 2389 	ld	h,-6 (ix)
   71FA DD 6E FB      [19] 2390 	ld	l,-5 (ix)
   71FD E5            [11] 2391 	push	hl
   71FE 2A C5 64      [16] 2392 	ld	hl,(_mapa)
   7201 E5            [11] 2393 	push	hl
   7202 CD 1C 4B      [17] 2394 	call	_getTilePtr
   7205 F1            [10] 2395 	pop	af
   7206 F1            [10] 2396 	pop	af
   7207 4E            [ 7] 2397 	ld	c,(hl)
   7208 3E 02         [ 7] 2398 	ld	a,#0x02
   720A 91            [ 4] 2399 	sub	a, c
   720B DA 32 78      [10] 2400 	jp	C,00199$
                           2401 ;src/main.c:465: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   720E DD 6E F6      [19] 2402 	ld	l,-10 (ix)
   7211 DD 66 F7      [19] 2403 	ld	h,-9 (ix)
   7214 7E            [ 7] 2404 	ld	a,(hl)
   7215 C6 0B         [ 7] 2405 	add	a, #0x0B
   7217 47            [ 4] 2406 	ld	b,a
   7218 DD 6E F4      [19] 2407 	ld	l,-12 (ix)
   721B DD 66 F5      [19] 2408 	ld	h,-11 (ix)
   721E 7E            [ 7] 2409 	ld	a,(hl)
   721F C6 04         [ 7] 2410 	add	a, #0x04
   7221 C5            [11] 2411 	push	bc
   7222 33            [ 6] 2412 	inc	sp
   7223 F5            [11] 2413 	push	af
   7224 33            [ 6] 2414 	inc	sp
   7225 2A C5 64      [16] 2415 	ld	hl,(_mapa)
   7228 E5            [11] 2416 	push	hl
   7229 CD 1C 4B      [17] 2417 	call	_getTilePtr
   722C F1            [10] 2418 	pop	af
   722D F1            [10] 2419 	pop	af
   722E 4E            [ 7] 2420 	ld	c,(hl)
   722F 3E 02         [ 7] 2421 	ld	a,#0x02
   7231 91            [ 4] 2422 	sub	a, c
   7232 DA 32 78      [10] 2423 	jp	C,00199$
                           2424 ;src/main.c:466: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7235 DD 6E F6      [19] 2425 	ld	l,-10 (ix)
   7238 DD 66 F7      [19] 2426 	ld	h,-9 (ix)
   723B 7E            [ 7] 2427 	ld	a,(hl)
   723C C6 16         [ 7] 2428 	add	a, #0x16
   723E 47            [ 4] 2429 	ld	b,a
   723F DD 6E F4      [19] 2430 	ld	l,-12 (ix)
   7242 DD 66 F5      [19] 2431 	ld	h,-11 (ix)
   7245 7E            [ 7] 2432 	ld	a,(hl)
   7246 C6 04         [ 7] 2433 	add	a, #0x04
   7248 C5            [11] 2434 	push	bc
   7249 33            [ 6] 2435 	inc	sp
   724A F5            [11] 2436 	push	af
   724B 33            [ 6] 2437 	inc	sp
   724C 2A C5 64      [16] 2438 	ld	hl,(_mapa)
   724F E5            [11] 2439 	push	hl
   7250 CD 1C 4B      [17] 2440 	call	_getTilePtr
   7253 F1            [10] 2441 	pop	af
   7254 F1            [10] 2442 	pop	af
   7255 4E            [ 7] 2443 	ld	c,(hl)
   7256 3E 02         [ 7] 2444 	ld	a,#0x02
   7258 91            [ 4] 2445 	sub	a, c
   7259 DA 32 78      [10] 2446 	jp	C,00199$
                           2447 ;src/main.c:467: moverEnemigoDerecha(enemy);
   725C DD 6E F4      [19] 2448 	ld	l,-12 (ix)
   725F DD 66 F5      [19] 2449 	ld	h,-11 (ix)
   7262 E5            [11] 2450 	push	hl
   7263 CD 5A 6B      [17] 2451 	call	_moverEnemigoDerecha
   7266 F1            [10] 2452 	pop	af
                           2453 ;src/main.c:469: enemy->mover = SI;
   7267 DD 6E F8      [19] 2454 	ld	l,-8 (ix)
   726A DD 66 F9      [19] 2455 	ld	h,-7 (ix)
   726D 36 01         [10] 2456 	ld	(hl),#0x01
   726F C3 32 78      [10] 2457 	jp	00199$
   7272                    2458 00195$:
                           2459 ;src/main.c:474: else if (enemy->x == dx) {
   7272 DD 7E 06      [19] 2460 	ld	a,6 (ix)
   7275 90            [ 4] 2461 	sub	a, b
   7276 C2 8B 73      [10] 2462 	jp	NZ,00192$
                           2463 ;src/main.c:475: if (dy < enemy->y) {
   7279 DD 7E 07      [19] 2464 	ld	a,7 (ix)
   727C DD 96 FA      [19] 2465 	sub	a, -6 (ix)
   727F D2 05 73      [10] 2466 	jp	NC,00129$
                           2467 ;src/main.c:476: if (dist > G_HERO_H + 5) {
   7282 3E 1B         [ 7] 2468 	ld	a,#0x1B
   7284 DD 96 F1      [19] 2469 	sub	a, -15 (ix)
   7287 D2 32 78      [10] 2470 	jp	NC,00199$
                           2471 ;src/main.c:477: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   728A DD 56 FA      [19] 2472 	ld	d,-6 (ix)
   728D 15            [ 4] 2473 	dec	d
   728E 15            [ 4] 2474 	dec	d
   728F D5            [11] 2475 	push	de
   7290 33            [ 6] 2476 	inc	sp
   7291 C5            [11] 2477 	push	bc
   7292 33            [ 6] 2478 	inc	sp
   7293 2A C5 64      [16] 2479 	ld	hl,(_mapa)
   7296 E5            [11] 2480 	push	hl
   7297 CD 1C 4B      [17] 2481 	call	_getTilePtr
   729A F1            [10] 2482 	pop	af
   729B F1            [10] 2483 	pop	af
   729C 4E            [ 7] 2484 	ld	c,(hl)
   729D 3E 02         [ 7] 2485 	ld	a,#0x02
   729F 91            [ 4] 2486 	sub	a, c
   72A0 DA 32 78      [10] 2487 	jp	C,00199$
                           2488 ;src/main.c:478: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   72A3 DD 6E F6      [19] 2489 	ld	l,-10 (ix)
   72A6 DD 66 F7      [19] 2490 	ld	h,-9 (ix)
   72A9 56            [ 7] 2491 	ld	d,(hl)
   72AA 15            [ 4] 2492 	dec	d
   72AB 15            [ 4] 2493 	dec	d
   72AC DD 6E F4      [19] 2494 	ld	l,-12 (ix)
   72AF DD 66 F5      [19] 2495 	ld	h,-11 (ix)
   72B2 46            [ 7] 2496 	ld	b,(hl)
   72B3 04            [ 4] 2497 	inc	b
   72B4 04            [ 4] 2498 	inc	b
   72B5 D5            [11] 2499 	push	de
   72B6 33            [ 6] 2500 	inc	sp
   72B7 C5            [11] 2501 	push	bc
   72B8 33            [ 6] 2502 	inc	sp
   72B9 2A C5 64      [16] 2503 	ld	hl,(_mapa)
   72BC E5            [11] 2504 	push	hl
   72BD CD 1C 4B      [17] 2505 	call	_getTilePtr
   72C0 F1            [10] 2506 	pop	af
   72C1 F1            [10] 2507 	pop	af
   72C2 4E            [ 7] 2508 	ld	c,(hl)
   72C3 3E 02         [ 7] 2509 	ld	a,#0x02
   72C5 91            [ 4] 2510 	sub	a, c
   72C6 DA 32 78      [10] 2511 	jp	C,00199$
                           2512 ;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   72C9 DD 6E F6      [19] 2513 	ld	l,-10 (ix)
   72CC DD 66 F7      [19] 2514 	ld	h,-9 (ix)
   72CF 46            [ 7] 2515 	ld	b,(hl)
   72D0 05            [ 4] 2516 	dec	b
   72D1 05            [ 4] 2517 	dec	b
   72D2 DD 6E F4      [19] 2518 	ld	l,-12 (ix)
   72D5 DD 66 F5      [19] 2519 	ld	h,-11 (ix)
   72D8 7E            [ 7] 2520 	ld	a,(hl)
   72D9 C6 04         [ 7] 2521 	add	a, #0x04
   72DB C5            [11] 2522 	push	bc
   72DC 33            [ 6] 2523 	inc	sp
   72DD F5            [11] 2524 	push	af
   72DE 33            [ 6] 2525 	inc	sp
   72DF 2A C5 64      [16] 2526 	ld	hl,(_mapa)
   72E2 E5            [11] 2527 	push	hl
   72E3 CD 1C 4B      [17] 2528 	call	_getTilePtr
   72E6 F1            [10] 2529 	pop	af
   72E7 F1            [10] 2530 	pop	af
   72E8 4E            [ 7] 2531 	ld	c,(hl)
   72E9 3E 02         [ 7] 2532 	ld	a,#0x02
   72EB 91            [ 4] 2533 	sub	a, c
   72EC DA 32 78      [10] 2534 	jp	C,00199$
                           2535 ;src/main.c:480: moverEnemigoArriba(enemy);
   72EF DD 6E F4      [19] 2536 	ld	l,-12 (ix)
   72F2 DD 66 F5      [19] 2537 	ld	h,-11 (ix)
   72F5 E5            [11] 2538 	push	hl
   72F6 CD 1C 6B      [17] 2539 	call	_moverEnemigoArriba
   72F9 F1            [10] 2540 	pop	af
                           2541 ;src/main.c:482: enemy->mover = SI;
   72FA DD 6E F8      [19] 2542 	ld	l,-8 (ix)
   72FD DD 66 F9      [19] 2543 	ld	h,-7 (ix)
   7300 36 01         [10] 2544 	ld	(hl),#0x01
   7302 C3 32 78      [10] 2545 	jp	00199$
   7305                    2546 00129$:
                           2547 ;src/main.c:486: if(dist > G_ENEMY_H + 7) {
   7305 3E 1D         [ 7] 2548 	ld	a,#0x1D
   7307 DD 96 F1      [19] 2549 	sub	a, -15 (ix)
   730A D2 32 78      [10] 2550 	jp	NC,00199$
                           2551 ;src/main.c:487: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   730D DD 7E FA      [19] 2552 	ld	a,-6 (ix)
   7310 C6 18         [ 7] 2553 	add	a, #0x18
   7312 57            [ 4] 2554 	ld	d,a
   7313 D5            [11] 2555 	push	de
   7314 33            [ 6] 2556 	inc	sp
   7315 C5            [11] 2557 	push	bc
   7316 33            [ 6] 2558 	inc	sp
   7317 2A C5 64      [16] 2559 	ld	hl,(_mapa)
   731A E5            [11] 2560 	push	hl
   731B CD 1C 4B      [17] 2561 	call	_getTilePtr
   731E F1            [10] 2562 	pop	af
   731F F1            [10] 2563 	pop	af
   7320 4E            [ 7] 2564 	ld	c,(hl)
   7321 3E 02         [ 7] 2565 	ld	a,#0x02
   7323 91            [ 4] 2566 	sub	a, c
   7324 DA 32 78      [10] 2567 	jp	C,00199$
                           2568 ;src/main.c:488: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7327 DD 6E F6      [19] 2569 	ld	l,-10 (ix)
   732A DD 66 F7      [19] 2570 	ld	h,-9 (ix)
   732D 7E            [ 7] 2571 	ld	a,(hl)
   732E C6 18         [ 7] 2572 	add	a, #0x18
   7330 57            [ 4] 2573 	ld	d,a
   7331 DD 6E F4      [19] 2574 	ld	l,-12 (ix)
   7334 DD 66 F5      [19] 2575 	ld	h,-11 (ix)
   7337 46            [ 7] 2576 	ld	b,(hl)
   7338 04            [ 4] 2577 	inc	b
   7339 04            [ 4] 2578 	inc	b
   733A D5            [11] 2579 	push	de
   733B 33            [ 6] 2580 	inc	sp
   733C C5            [11] 2581 	push	bc
   733D 33            [ 6] 2582 	inc	sp
   733E 2A C5 64      [16] 2583 	ld	hl,(_mapa)
   7341 E5            [11] 2584 	push	hl
   7342 CD 1C 4B      [17] 2585 	call	_getTilePtr
   7345 F1            [10] 2586 	pop	af
   7346 F1            [10] 2587 	pop	af
   7347 4E            [ 7] 2588 	ld	c,(hl)
   7348 3E 02         [ 7] 2589 	ld	a,#0x02
   734A 91            [ 4] 2590 	sub	a, c
   734B DA 32 78      [10] 2591 	jp	C,00199$
                           2592 ;src/main.c:489: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   734E DD 6E F6      [19] 2593 	ld	l,-10 (ix)
   7351 DD 66 F7      [19] 2594 	ld	h,-9 (ix)
   7354 7E            [ 7] 2595 	ld	a,(hl)
   7355 C6 18         [ 7] 2596 	add	a, #0x18
   7357 47            [ 4] 2597 	ld	b,a
   7358 DD 6E F4      [19] 2598 	ld	l,-12 (ix)
   735B DD 66 F5      [19] 2599 	ld	h,-11 (ix)
   735E 7E            [ 7] 2600 	ld	a,(hl)
   735F C6 04         [ 7] 2601 	add	a, #0x04
   7361 C5            [11] 2602 	push	bc
   7362 33            [ 6] 2603 	inc	sp
   7363 F5            [11] 2604 	push	af
   7364 33            [ 6] 2605 	inc	sp
   7365 2A C5 64      [16] 2606 	ld	hl,(_mapa)
   7368 E5            [11] 2607 	push	hl
   7369 CD 1C 4B      [17] 2608 	call	_getTilePtr
   736C F1            [10] 2609 	pop	af
   736D F1            [10] 2610 	pop	af
   736E 4E            [ 7] 2611 	ld	c,(hl)
   736F 3E 02         [ 7] 2612 	ld	a,#0x02
   7371 91            [ 4] 2613 	sub	a, c
   7372 DA 32 78      [10] 2614 	jp	C,00199$
                           2615 ;src/main.c:490: moverEnemigoAbajo(enemy);
   7375 DD 6E F4      [19] 2616 	ld	l,-12 (ix)
   7378 DD 66 F5      [19] 2617 	ld	h,-11 (ix)
   737B E5            [11] 2618 	push	hl
   737C CD 3B 6B      [17] 2619 	call	_moverEnemigoAbajo
   737F F1            [10] 2620 	pop	af
                           2621 ;src/main.c:492: enemy->mover = SI;
   7380 DD 6E F8      [19] 2622 	ld	l,-8 (ix)
   7383 DD 66 F9      [19] 2623 	ld	h,-7 (ix)
   7386 36 01         [10] 2624 	ld	(hl),#0x01
   7388 C3 32 78      [10] 2625 	jp	00199$
   738B                    2626 00192$:
                           2627 ;src/main.c:498: if (!prota.mover) distConstraint = 20; // ajuste en parado
   738B 3A EE 63      [13] 2628 	ld	a, (#_prota + 6)
   738E B7            [ 4] 2629 	or	a, a
   738F 20 02         [12] 2630 	jr	NZ,00132$
   7391 0E 14         [ 7] 2631 	ld	c,#0x14
   7393                    2632 00132$:
                           2633 ;src/main.c:500: if (dist > distConstraint) {
   7393 79            [ 4] 2634 	ld	a,c
   7394 DD 96 F1      [19] 2635 	sub	a, -15 (ix)
   7397 D2 32 78      [10] 2636 	jp	NC,00199$
                           2637 ;src/main.c:501: if (dx + 1 < enemy->x) {
   739A DD 5E 06      [19] 2638 	ld	e,6 (ix)
   739D 16 00         [ 7] 2639 	ld	d,#0x00
   739F 13            [ 6] 2640 	inc	de
   73A0 DD 73 FE      [19] 2641 	ld	-2 (ix),e
   73A3 DD 72 FF      [19] 2642 	ld	-1 (ix),d
   73A6 DD 70 FC      [19] 2643 	ld	-4 (ix),b
   73A9 DD 36 FD 00   [19] 2644 	ld	-3 (ix),#0x00
   73AD DD 7E FE      [19] 2645 	ld	a,-2 (ix)
   73B0 DD 96 FC      [19] 2646 	sub	a, -4 (ix)
   73B3 DD 7E FF      [19] 2647 	ld	a,-1 (ix)
   73B6 DD 9E FD      [19] 2648 	sbc	a, -3 (ix)
   73B9 E2 BE 73      [10] 2649 	jp	PO, 00427$
   73BC EE 80         [ 7] 2650 	xor	a, #0x80
   73BE                    2651 00427$:
   73BE F2 3A 74      [10] 2652 	jp	P,00144$
                           2653 ;src/main.c:502: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   73C1 DD 7E FA      [19] 2654 	ld	a,-6 (ix)
   73C4 F5            [11] 2655 	push	af
   73C5 33            [ 6] 2656 	inc	sp
   73C6 C5            [11] 2657 	push	bc
   73C7 33            [ 6] 2658 	inc	sp
   73C8 2A C5 64      [16] 2659 	ld	hl,(_mapa)
   73CB E5            [11] 2660 	push	hl
   73CC CD 1C 4B      [17] 2661 	call	_getTilePtr
   73CF F1            [10] 2662 	pop	af
   73D0 F1            [10] 2663 	pop	af
   73D1 4E            [ 7] 2664 	ld	c,(hl)
   73D2 3E 02         [ 7] 2665 	ld	a,#0x02
   73D4 91            [ 4] 2666 	sub	a, c
   73D5 DA C7 74      [10] 2667 	jp	C,00145$
                           2668 ;src/main.c:503: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   73D8 DD 6E F6      [19] 2669 	ld	l,-10 (ix)
   73DB DD 66 F7      [19] 2670 	ld	h,-9 (ix)
   73DE 7E            [ 7] 2671 	ld	a,(hl)
   73DF C6 0B         [ 7] 2672 	add	a, #0x0B
   73E1 DD 6E F4      [19] 2673 	ld	l,-12 (ix)
   73E4 DD 66 F5      [19] 2674 	ld	h,-11 (ix)
   73E7 46            [ 7] 2675 	ld	b,(hl)
   73E8 F5            [11] 2676 	push	af
   73E9 33            [ 6] 2677 	inc	sp
   73EA C5            [11] 2678 	push	bc
   73EB 33            [ 6] 2679 	inc	sp
   73EC 2A C5 64      [16] 2680 	ld	hl,(_mapa)
   73EF E5            [11] 2681 	push	hl
   73F0 CD 1C 4B      [17] 2682 	call	_getTilePtr
   73F3 F1            [10] 2683 	pop	af
   73F4 F1            [10] 2684 	pop	af
   73F5 4E            [ 7] 2685 	ld	c,(hl)
   73F6 3E 02         [ 7] 2686 	ld	a,#0x02
   73F8 91            [ 4] 2687 	sub	a, c
   73F9 DA C7 74      [10] 2688 	jp	C,00145$
                           2689 ;src/main.c:504: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   73FC DD 6E F6      [19] 2690 	ld	l,-10 (ix)
   73FF DD 66 F7      [19] 2691 	ld	h,-9 (ix)
   7402 7E            [ 7] 2692 	ld	a,(hl)
   7403 C6 16         [ 7] 2693 	add	a, #0x16
   7405 DD 6E F4      [19] 2694 	ld	l,-12 (ix)
   7408 DD 66 F5      [19] 2695 	ld	h,-11 (ix)
   740B 46            [ 7] 2696 	ld	b,(hl)
   740C F5            [11] 2697 	push	af
   740D 33            [ 6] 2698 	inc	sp
   740E C5            [11] 2699 	push	bc
   740F 33            [ 6] 2700 	inc	sp
   7410 2A C5 64      [16] 2701 	ld	hl,(_mapa)
   7413 E5            [11] 2702 	push	hl
   7414 CD 1C 4B      [17] 2703 	call	_getTilePtr
   7417 F1            [10] 2704 	pop	af
   7418 F1            [10] 2705 	pop	af
   7419 4E            [ 7] 2706 	ld	c,(hl)
   741A 3E 02         [ 7] 2707 	ld	a,#0x02
   741C 91            [ 4] 2708 	sub	a, c
   741D DA C7 74      [10] 2709 	jp	C,00145$
                           2710 ;src/main.c:505: moverEnemigoIzquierda(enemy);
   7420 DD 6E F4      [19] 2711 	ld	l,-12 (ix)
   7423 DD 66 F5      [19] 2712 	ld	h,-11 (ix)
   7426 E5            [11] 2713 	push	hl
   7427 CD 6A 6B      [17] 2714 	call	_moverEnemigoIzquierda
   742A F1            [10] 2715 	pop	af
                           2716 ;src/main.c:506: movX = 1;
   742B DD 36 F2 01   [19] 2717 	ld	-14 (ix),#0x01
                           2718 ;src/main.c:507: enemy->mover = SI;
   742F DD 6E F8      [19] 2719 	ld	l,-8 (ix)
   7432 DD 66 F9      [19] 2720 	ld	h,-7 (ix)
   7435 36 01         [10] 2721 	ld	(hl),#0x01
   7437 C3 C7 74      [10] 2722 	jp	00145$
   743A                    2723 00144$:
                           2724 ;src/main.c:509: } else if (dx + 1 > enemy->x){
   743A DD 7E FC      [19] 2725 	ld	a,-4 (ix)
   743D DD 96 FE      [19] 2726 	sub	a, -2 (ix)
   7440 DD 7E FD      [19] 2727 	ld	a,-3 (ix)
   7443 DD 9E FF      [19] 2728 	sbc	a, -1 (ix)
   7446 E2 4B 74      [10] 2729 	jp	PO, 00428$
   7449 EE 80         [ 7] 2730 	xor	a, #0x80
   744B                    2731 00428$:
   744B F2 C7 74      [10] 2732 	jp	P,00145$
                           2733 ;src/main.c:510: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   744E DD 66 FA      [19] 2734 	ld	h,-6 (ix)
   7451 DD 6E FB      [19] 2735 	ld	l,-5 (ix)
   7454 E5            [11] 2736 	push	hl
   7455 2A C5 64      [16] 2737 	ld	hl,(_mapa)
   7458 E5            [11] 2738 	push	hl
   7459 CD 1C 4B      [17] 2739 	call	_getTilePtr
   745C F1            [10] 2740 	pop	af
   745D F1            [10] 2741 	pop	af
   745E 4E            [ 7] 2742 	ld	c,(hl)
   745F 3E 02         [ 7] 2743 	ld	a,#0x02
   7461 91            [ 4] 2744 	sub	a, c
   7462 38 63         [12] 2745 	jr	C,00145$
                           2746 ;src/main.c:511: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7464 DD 6E F6      [19] 2747 	ld	l,-10 (ix)
   7467 DD 66 F7      [19] 2748 	ld	h,-9 (ix)
   746A 7E            [ 7] 2749 	ld	a,(hl)
   746B C6 0B         [ 7] 2750 	add	a, #0x0B
   746D 47            [ 4] 2751 	ld	b,a
   746E DD 6E F4      [19] 2752 	ld	l,-12 (ix)
   7471 DD 66 F5      [19] 2753 	ld	h,-11 (ix)
   7474 7E            [ 7] 2754 	ld	a,(hl)
   7475 C6 04         [ 7] 2755 	add	a, #0x04
   7477 C5            [11] 2756 	push	bc
   7478 33            [ 6] 2757 	inc	sp
   7479 F5            [11] 2758 	push	af
   747A 33            [ 6] 2759 	inc	sp
   747B 2A C5 64      [16] 2760 	ld	hl,(_mapa)
   747E E5            [11] 2761 	push	hl
   747F CD 1C 4B      [17] 2762 	call	_getTilePtr
   7482 F1            [10] 2763 	pop	af
   7483 F1            [10] 2764 	pop	af
   7484 4E            [ 7] 2765 	ld	c,(hl)
   7485 3E 02         [ 7] 2766 	ld	a,#0x02
   7487 91            [ 4] 2767 	sub	a, c
   7488 38 3D         [12] 2768 	jr	C,00145$
                           2769 ;src/main.c:512: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   748A DD 6E F6      [19] 2770 	ld	l,-10 (ix)
   748D DD 66 F7      [19] 2771 	ld	h,-9 (ix)
   7490 7E            [ 7] 2772 	ld	a,(hl)
   7491 C6 16         [ 7] 2773 	add	a, #0x16
   7493 47            [ 4] 2774 	ld	b,a
   7494 DD 6E F4      [19] 2775 	ld	l,-12 (ix)
   7497 DD 66 F5      [19] 2776 	ld	h,-11 (ix)
   749A 7E            [ 7] 2777 	ld	a,(hl)
   749B C6 04         [ 7] 2778 	add	a, #0x04
   749D C5            [11] 2779 	push	bc
   749E 33            [ 6] 2780 	inc	sp
   749F F5            [11] 2781 	push	af
   74A0 33            [ 6] 2782 	inc	sp
   74A1 2A C5 64      [16] 2783 	ld	hl,(_mapa)
   74A4 E5            [11] 2784 	push	hl
   74A5 CD 1C 4B      [17] 2785 	call	_getTilePtr
   74A8 F1            [10] 2786 	pop	af
   74A9 F1            [10] 2787 	pop	af
   74AA 4E            [ 7] 2788 	ld	c,(hl)
   74AB 3E 02         [ 7] 2789 	ld	a,#0x02
   74AD 91            [ 4] 2790 	sub	a, c
   74AE 38 17         [12] 2791 	jr	C,00145$
                           2792 ;src/main.c:513: moverEnemigoDerecha(enemy);
   74B0 DD 6E F4      [19] 2793 	ld	l,-12 (ix)
   74B3 DD 66 F5      [19] 2794 	ld	h,-11 (ix)
   74B6 E5            [11] 2795 	push	hl
   74B7 CD 5A 6B      [17] 2796 	call	_moverEnemigoDerecha
   74BA F1            [10] 2797 	pop	af
                           2798 ;src/main.c:514: movX = 1;
   74BB DD 36 F2 01   [19] 2799 	ld	-14 (ix),#0x01
                           2800 ;src/main.c:515: enemy->mover = SI;
   74BF DD 6E F8      [19] 2801 	ld	l,-8 (ix)
   74C2 DD 66 F9      [19] 2802 	ld	h,-7 (ix)
   74C5 36 01         [10] 2803 	ld	(hl),#0x01
   74C7                    2804 00145$:
                           2805 ;src/main.c:518: if (dy < enemy->y) {
   74C7 DD 6E F6      [19] 2806 	ld	l,-10 (ix)
   74CA DD 66 F7      [19] 2807 	ld	h,-9 (ix)
   74CD 4E            [ 7] 2808 	ld	c,(hl)
                           2809 ;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   74CE DD 6E F4      [19] 2810 	ld	l,-12 (ix)
   74D1 DD 66 F5      [19] 2811 	ld	h,-11 (ix)
   74D4 46            [ 7] 2812 	ld	b,(hl)
                           2813 ;src/main.c:518: if (dy < enemy->y) {
   74D5 DD 7E 07      [19] 2814 	ld	a,7 (ix)
   74D8 91            [ 4] 2815 	sub	a, c
   74D9 D2 59 75      [10] 2816 	jp	NC,00155$
                           2817 ;src/main.c:519: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   74DC 51            [ 4] 2818 	ld	d,c
   74DD 15            [ 4] 2819 	dec	d
   74DE 15            [ 4] 2820 	dec	d
   74DF D5            [11] 2821 	push	de
   74E0 33            [ 6] 2822 	inc	sp
   74E1 C5            [11] 2823 	push	bc
   74E2 33            [ 6] 2824 	inc	sp
   74E3 2A C5 64      [16] 2825 	ld	hl,(_mapa)
   74E6 E5            [11] 2826 	push	hl
   74E7 CD 1C 4B      [17] 2827 	call	_getTilePtr
   74EA F1            [10] 2828 	pop	af
   74EB F1            [10] 2829 	pop	af
   74EC 4E            [ 7] 2830 	ld	c,(hl)
   74ED 3E 02         [ 7] 2831 	ld	a,#0x02
   74EF 91            [ 4] 2832 	sub	a, c
   74F0 DA D3 75      [10] 2833 	jp	C,00156$
                           2834 ;src/main.c:520: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   74F3 DD 6E F6      [19] 2835 	ld	l,-10 (ix)
   74F6 DD 66 F7      [19] 2836 	ld	h,-9 (ix)
   74F9 56            [ 7] 2837 	ld	d,(hl)
   74FA 15            [ 4] 2838 	dec	d
   74FB 15            [ 4] 2839 	dec	d
   74FC DD 6E F4      [19] 2840 	ld	l,-12 (ix)
   74FF DD 66 F5      [19] 2841 	ld	h,-11 (ix)
   7502 46            [ 7] 2842 	ld	b,(hl)
   7503 04            [ 4] 2843 	inc	b
   7504 04            [ 4] 2844 	inc	b
   7505 D5            [11] 2845 	push	de
   7506 33            [ 6] 2846 	inc	sp
   7507 C5            [11] 2847 	push	bc
   7508 33            [ 6] 2848 	inc	sp
   7509 2A C5 64      [16] 2849 	ld	hl,(_mapa)
   750C E5            [11] 2850 	push	hl
   750D CD 1C 4B      [17] 2851 	call	_getTilePtr
   7510 F1            [10] 2852 	pop	af
   7511 F1            [10] 2853 	pop	af
   7512 4E            [ 7] 2854 	ld	c,(hl)
   7513 3E 02         [ 7] 2855 	ld	a,#0x02
   7515 91            [ 4] 2856 	sub	a, c
   7516 DA D3 75      [10] 2857 	jp	C,00156$
                           2858 ;src/main.c:521: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7519 DD 6E F6      [19] 2859 	ld	l,-10 (ix)
   751C DD 66 F7      [19] 2860 	ld	h,-9 (ix)
   751F 46            [ 7] 2861 	ld	b,(hl)
   7520 05            [ 4] 2862 	dec	b
   7521 05            [ 4] 2863 	dec	b
   7522 DD 6E F4      [19] 2864 	ld	l,-12 (ix)
   7525 DD 66 F5      [19] 2865 	ld	h,-11 (ix)
   7528 7E            [ 7] 2866 	ld	a,(hl)
   7529 C6 04         [ 7] 2867 	add	a, #0x04
   752B C5            [11] 2868 	push	bc
   752C 33            [ 6] 2869 	inc	sp
   752D F5            [11] 2870 	push	af
   752E 33            [ 6] 2871 	inc	sp
   752F 2A C5 64      [16] 2872 	ld	hl,(_mapa)
   7532 E5            [11] 2873 	push	hl
   7533 CD 1C 4B      [17] 2874 	call	_getTilePtr
   7536 F1            [10] 2875 	pop	af
   7537 F1            [10] 2876 	pop	af
   7538 4E            [ 7] 2877 	ld	c,(hl)
   7539 3E 02         [ 7] 2878 	ld	a,#0x02
   753B 91            [ 4] 2879 	sub	a, c
   753C DA D3 75      [10] 2880 	jp	C,00156$
                           2881 ;src/main.c:522: moverEnemigoArriba(enemy);
   753F DD 6E F4      [19] 2882 	ld	l,-12 (ix)
   7542 DD 66 F5      [19] 2883 	ld	h,-11 (ix)
   7545 E5            [11] 2884 	push	hl
   7546 CD 1C 6B      [17] 2885 	call	_moverEnemigoArriba
   7549 F1            [10] 2886 	pop	af
                           2887 ;src/main.c:523: movY = 1;
   754A DD 36 F3 01   [19] 2888 	ld	-13 (ix),#0x01
                           2889 ;src/main.c:524: enemy->mover = SI;
   754E DD 6E F8      [19] 2890 	ld	l,-8 (ix)
   7551 DD 66 F9      [19] 2891 	ld	h,-7 (ix)
   7554 36 01         [10] 2892 	ld	(hl),#0x01
   7556 C3 D3 75      [10] 2893 	jp	00156$
   7559                    2894 00155$:
                           2895 ;src/main.c:527: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7559 79            [ 4] 2896 	ld	a,c
   755A C6 18         [ 7] 2897 	add	a, #0x18
   755C 57            [ 4] 2898 	ld	d,a
   755D D5            [11] 2899 	push	de
   755E 33            [ 6] 2900 	inc	sp
   755F C5            [11] 2901 	push	bc
   7560 33            [ 6] 2902 	inc	sp
   7561 2A C5 64      [16] 2903 	ld	hl,(_mapa)
   7564 E5            [11] 2904 	push	hl
   7565 CD 1C 4B      [17] 2905 	call	_getTilePtr
   7568 F1            [10] 2906 	pop	af
   7569 F1            [10] 2907 	pop	af
   756A 4E            [ 7] 2908 	ld	c,(hl)
   756B 3E 02         [ 7] 2909 	ld	a,#0x02
   756D 91            [ 4] 2910 	sub	a, c
   756E 38 63         [12] 2911 	jr	C,00156$
                           2912 ;src/main.c:528: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7570 DD 6E F6      [19] 2913 	ld	l,-10 (ix)
   7573 DD 66 F7      [19] 2914 	ld	h,-9 (ix)
   7576 7E            [ 7] 2915 	ld	a,(hl)
   7577 C6 18         [ 7] 2916 	add	a, #0x18
   7579 57            [ 4] 2917 	ld	d,a
   757A DD 6E F4      [19] 2918 	ld	l,-12 (ix)
   757D DD 66 F5      [19] 2919 	ld	h,-11 (ix)
   7580 46            [ 7] 2920 	ld	b,(hl)
   7581 04            [ 4] 2921 	inc	b
   7582 04            [ 4] 2922 	inc	b
   7583 D5            [11] 2923 	push	de
   7584 33            [ 6] 2924 	inc	sp
   7585 C5            [11] 2925 	push	bc
   7586 33            [ 6] 2926 	inc	sp
   7587 2A C5 64      [16] 2927 	ld	hl,(_mapa)
   758A E5            [11] 2928 	push	hl
   758B CD 1C 4B      [17] 2929 	call	_getTilePtr
   758E F1            [10] 2930 	pop	af
   758F F1            [10] 2931 	pop	af
   7590 4E            [ 7] 2932 	ld	c,(hl)
   7591 3E 02         [ 7] 2933 	ld	a,#0x02
   7593 91            [ 4] 2934 	sub	a, c
   7594 38 3D         [12] 2935 	jr	C,00156$
                           2936 ;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7596 DD 6E F6      [19] 2937 	ld	l,-10 (ix)
   7599 DD 66 F7      [19] 2938 	ld	h,-9 (ix)
   759C 7E            [ 7] 2939 	ld	a,(hl)
   759D C6 18         [ 7] 2940 	add	a, #0x18
   759F 47            [ 4] 2941 	ld	b,a
   75A0 DD 6E F4      [19] 2942 	ld	l,-12 (ix)
   75A3 DD 66 F5      [19] 2943 	ld	h,-11 (ix)
   75A6 7E            [ 7] 2944 	ld	a,(hl)
   75A7 C6 04         [ 7] 2945 	add	a, #0x04
   75A9 C5            [11] 2946 	push	bc
   75AA 33            [ 6] 2947 	inc	sp
   75AB F5            [11] 2948 	push	af
   75AC 33            [ 6] 2949 	inc	sp
   75AD 2A C5 64      [16] 2950 	ld	hl,(_mapa)
   75B0 E5            [11] 2951 	push	hl
   75B1 CD 1C 4B      [17] 2952 	call	_getTilePtr
   75B4 F1            [10] 2953 	pop	af
   75B5 F1            [10] 2954 	pop	af
   75B6 4E            [ 7] 2955 	ld	c,(hl)
   75B7 3E 02         [ 7] 2956 	ld	a,#0x02
   75B9 91            [ 4] 2957 	sub	a, c
   75BA 38 17         [12] 2958 	jr	C,00156$
                           2959 ;src/main.c:530: moverEnemigoAbajo(enemy);
   75BC DD 6E F4      [19] 2960 	ld	l,-12 (ix)
   75BF DD 66 F5      [19] 2961 	ld	h,-11 (ix)
   75C2 E5            [11] 2962 	push	hl
   75C3 CD 3B 6B      [17] 2963 	call	_moverEnemigoAbajo
   75C6 F1            [10] 2964 	pop	af
                           2965 ;src/main.c:531: movY = 1;
   75C7 DD 36 F3 01   [19] 2966 	ld	-13 (ix),#0x01
                           2967 ;src/main.c:532: enemy->mover = SI;
   75CB DD 6E F8      [19] 2968 	ld	l,-8 (ix)
   75CE DD 66 F9      [19] 2969 	ld	h,-7 (ix)
   75D1 36 01         [10] 2970 	ld	(hl),#0x01
   75D3                    2971 00156$:
                           2972 ;src/main.c:535: if (!enemy->mover) {
   75D3 DD 6E F8      [19] 2973 	ld	l,-8 (ix)
   75D6 DD 66 F9      [19] 2974 	ld	h,-7 (ix)
   75D9 7E            [ 7] 2975 	ld	a,(hl)
   75DA B7            [ 4] 2976 	or	a, a
   75DB C2 32 78      [10] 2977 	jp	NZ,00199$
                           2978 ;src/main.c:536: if (!movX) {
   75DE DD 7E F2      [19] 2979 	ld	a,-14 (ix)
   75E1 B7            [ 4] 2980 	or	a, a
   75E2 C2 0B 77      [10] 2981 	jp	NZ,00171$
                           2982 ;src/main.c:537: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   75E5 DD 6E F6      [19] 2983 	ld	l,-10 (ix)
   75E8 DD 66 F7      [19] 2984 	ld	h,-9 (ix)
   75EB 5E            [ 7] 2985 	ld	e,(hl)
                           2986 ;src/main.c:442: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75EC DD 6E F4      [19] 2987 	ld	l,-12 (ix)
   75EF DD 66 F5      [19] 2988 	ld	h,-11 (ix)
   75F2 4E            [ 7] 2989 	ld	c,(hl)
                           2990 ;src/main.c:537: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   75F3 3E 70         [ 7] 2991 	ld	a,#0x70
   75F5 93            [ 4] 2992 	sub	a, e
   75F6 D2 86 76      [10] 2993 	jp	NC,00168$
                           2994 ;src/main.c:538: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   75F9 7B            [ 4] 2995 	ld	a,e
   75FA C6 18         [ 7] 2996 	add	a, #0x18
   75FC 47            [ 4] 2997 	ld	b,a
   75FD C5            [11] 2998 	push	bc
   75FE 2A C5 64      [16] 2999 	ld	hl,(_mapa)
   7601 E5            [11] 3000 	push	hl
   7602 CD 1C 4B      [17] 3001 	call	_getTilePtr
   7605 F1            [10] 3002 	pop	af
   7606 F1            [10] 3003 	pop	af
   7607 4E            [ 7] 3004 	ld	c,(hl)
   7608 3E 02         [ 7] 3005 	ld	a,#0x02
   760A 91            [ 4] 3006 	sub	a, c
   760B 38 63         [12] 3007 	jr	C,00158$
                           3008 ;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   760D DD 6E F6      [19] 3009 	ld	l,-10 (ix)
   7610 DD 66 F7      [19] 3010 	ld	h,-9 (ix)
   7613 7E            [ 7] 3011 	ld	a,(hl)
   7614 C6 18         [ 7] 3012 	add	a, #0x18
   7616 57            [ 4] 3013 	ld	d,a
   7617 DD 6E F4      [19] 3014 	ld	l,-12 (ix)
   761A DD 66 F5      [19] 3015 	ld	h,-11 (ix)
   761D 4E            [ 7] 3016 	ld	c,(hl)
   761E 41            [ 4] 3017 	ld	b,c
   761F 04            [ 4] 3018 	inc	b
   7620 04            [ 4] 3019 	inc	b
   7621 D5            [11] 3020 	push	de
   7622 33            [ 6] 3021 	inc	sp
   7623 C5            [11] 3022 	push	bc
   7624 33            [ 6] 3023 	inc	sp
   7625 2A C5 64      [16] 3024 	ld	hl,(_mapa)
   7628 E5            [11] 3025 	push	hl
   7629 CD 1C 4B      [17] 3026 	call	_getTilePtr
   762C F1            [10] 3027 	pop	af
   762D F1            [10] 3028 	pop	af
   762E 4E            [ 7] 3029 	ld	c,(hl)
   762F 3E 02         [ 7] 3030 	ld	a,#0x02
   7631 91            [ 4] 3031 	sub	a, c
   7632 38 3C         [12] 3032 	jr	C,00158$
                           3033 ;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7634 DD 6E F6      [19] 3034 	ld	l,-10 (ix)
   7637 DD 66 F7      [19] 3035 	ld	h,-9 (ix)
   763A 7E            [ 7] 3036 	ld	a,(hl)
   763B C6 18         [ 7] 3037 	add	a, #0x18
   763D 47            [ 4] 3038 	ld	b,a
   763E DD 6E F4      [19] 3039 	ld	l,-12 (ix)
   7641 DD 66 F5      [19] 3040 	ld	h,-11 (ix)
   7644 7E            [ 7] 3041 	ld	a,(hl)
   7645 C6 04         [ 7] 3042 	add	a, #0x04
   7647 C5            [11] 3043 	push	bc
   7648 33            [ 6] 3044 	inc	sp
   7649 F5            [11] 3045 	push	af
   764A 33            [ 6] 3046 	inc	sp
   764B 2A C5 64      [16] 3047 	ld	hl,(_mapa)
   764E E5            [11] 3048 	push	hl
   764F CD 1C 4B      [17] 3049 	call	_getTilePtr
   7652 F1            [10] 3050 	pop	af
   7653 F1            [10] 3051 	pop	af
   7654 4E            [ 7] 3052 	ld	c,(hl)
   7655 3E 02         [ 7] 3053 	ld	a,#0x02
   7657 91            [ 4] 3054 	sub	a, c
   7658 38 16         [12] 3055 	jr	C,00158$
                           3056 ;src/main.c:541: moverEnemigoAbajo(enemy);
   765A DD 6E F4      [19] 3057 	ld	l,-12 (ix)
   765D DD 66 F5      [19] 3058 	ld	h,-11 (ix)
   7660 E5            [11] 3059 	push	hl
   7661 CD 3B 6B      [17] 3060 	call	_moverEnemigoAbajo
   7664 F1            [10] 3061 	pop	af
                           3062 ;src/main.c:542: enemy->mover = SI;
   7665 DD 6E F8      [19] 3063 	ld	l,-8 (ix)
   7668 DD 66 F9      [19] 3064 	ld	h,-7 (ix)
   766B 36 01         [10] 3065 	ld	(hl),#0x01
   766D C3 0B 77      [10] 3066 	jp	00171$
   7670                    3067 00158$:
                           3068 ;src/main.c:544: moverEnemigoArriba(enemy);
   7670 DD 6E F4      [19] 3069 	ld	l,-12 (ix)
   7673 DD 66 F5      [19] 3070 	ld	h,-11 (ix)
   7676 E5            [11] 3071 	push	hl
   7677 CD 1C 6B      [17] 3072 	call	_moverEnemigoArriba
   767A F1            [10] 3073 	pop	af
                           3074 ;src/main.c:545: enemy->mover = SI;
   767B DD 6E F8      [19] 3075 	ld	l,-8 (ix)
   767E DD 66 F9      [19] 3076 	ld	h,-7 (ix)
   7681 36 01         [10] 3077 	ld	(hl),#0x01
   7683 C3 0B 77      [10] 3078 	jp	00171$
   7686                    3079 00168$:
                           3080 ;src/main.c:548: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7686 43            [ 4] 3081 	ld	b,e
   7687 05            [ 4] 3082 	dec	b
   7688 05            [ 4] 3083 	dec	b
   7689 C5            [11] 3084 	push	bc
   768A 2A C5 64      [16] 3085 	ld	hl,(_mapa)
   768D E5            [11] 3086 	push	hl
   768E CD 1C 4B      [17] 3087 	call	_getTilePtr
   7691 F1            [10] 3088 	pop	af
   7692 F1            [10] 3089 	pop	af
   7693 4E            [ 7] 3090 	ld	c,(hl)
   7694 3E 02         [ 7] 3091 	ld	a,#0x02
   7696 91            [ 4] 3092 	sub	a, c
   7697 38 5F         [12] 3093 	jr	C,00163$
                           3094 ;src/main.c:549: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7699 DD 6E F6      [19] 3095 	ld	l,-10 (ix)
   769C DD 66 F7      [19] 3096 	ld	h,-9 (ix)
   769F 56            [ 7] 3097 	ld	d,(hl)
   76A0 15            [ 4] 3098 	dec	d
   76A1 15            [ 4] 3099 	dec	d
   76A2 DD 6E F4      [19] 3100 	ld	l,-12 (ix)
   76A5 DD 66 F5      [19] 3101 	ld	h,-11 (ix)
   76A8 46            [ 7] 3102 	ld	b,(hl)
   76A9 04            [ 4] 3103 	inc	b
   76AA 04            [ 4] 3104 	inc	b
   76AB D5            [11] 3105 	push	de
   76AC 33            [ 6] 3106 	inc	sp
   76AD C5            [11] 3107 	push	bc
   76AE 33            [ 6] 3108 	inc	sp
   76AF 2A C5 64      [16] 3109 	ld	hl,(_mapa)
   76B2 E5            [11] 3110 	push	hl
   76B3 CD 1C 4B      [17] 3111 	call	_getTilePtr
   76B6 F1            [10] 3112 	pop	af
   76B7 F1            [10] 3113 	pop	af
   76B8 4E            [ 7] 3114 	ld	c,(hl)
   76B9 3E 02         [ 7] 3115 	ld	a,#0x02
   76BB 91            [ 4] 3116 	sub	a, c
   76BC 38 3A         [12] 3117 	jr	C,00163$
                           3118 ;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   76BE DD 6E F6      [19] 3119 	ld	l,-10 (ix)
   76C1 DD 66 F7      [19] 3120 	ld	h,-9 (ix)
   76C4 46            [ 7] 3121 	ld	b,(hl)
   76C5 05            [ 4] 3122 	dec	b
   76C6 05            [ 4] 3123 	dec	b
   76C7 DD 6E F4      [19] 3124 	ld	l,-12 (ix)
   76CA DD 66 F5      [19] 3125 	ld	h,-11 (ix)
   76CD 7E            [ 7] 3126 	ld	a,(hl)
   76CE C6 04         [ 7] 3127 	add	a, #0x04
   76D0 C5            [11] 3128 	push	bc
   76D1 33            [ 6] 3129 	inc	sp
   76D2 F5            [11] 3130 	push	af
   76D3 33            [ 6] 3131 	inc	sp
   76D4 2A C5 64      [16] 3132 	ld	hl,(_mapa)
   76D7 E5            [11] 3133 	push	hl
   76D8 CD 1C 4B      [17] 3134 	call	_getTilePtr
   76DB F1            [10] 3135 	pop	af
   76DC F1            [10] 3136 	pop	af
   76DD 4E            [ 7] 3137 	ld	c,(hl)
   76DE 3E 02         [ 7] 3138 	ld	a,#0x02
   76E0 91            [ 4] 3139 	sub	a, c
   76E1 38 15         [12] 3140 	jr	C,00163$
                           3141 ;src/main.c:551: moverEnemigoArriba(enemy);
   76E3 DD 6E F4      [19] 3142 	ld	l,-12 (ix)
   76E6 DD 66 F5      [19] 3143 	ld	h,-11 (ix)
   76E9 E5            [11] 3144 	push	hl
   76EA CD 1C 6B      [17] 3145 	call	_moverEnemigoArriba
   76ED F1            [10] 3146 	pop	af
                           3147 ;src/main.c:552: enemy->mover = SI;
   76EE DD 6E F8      [19] 3148 	ld	l,-8 (ix)
   76F1 DD 66 F9      [19] 3149 	ld	h,-7 (ix)
   76F4 36 01         [10] 3150 	ld	(hl),#0x01
   76F6 18 13         [12] 3151 	jr	00171$
   76F8                    3152 00163$:
                           3153 ;src/main.c:554: moverEnemigoAbajo(enemy);
   76F8 DD 6E F4      [19] 3154 	ld	l,-12 (ix)
   76FB DD 66 F5      [19] 3155 	ld	h,-11 (ix)
   76FE E5            [11] 3156 	push	hl
   76FF CD 3B 6B      [17] 3157 	call	_moverEnemigoAbajo
   7702 F1            [10] 3158 	pop	af
                           3159 ;src/main.c:555: enemy->mover = SI;
   7703 DD 6E F8      [19] 3160 	ld	l,-8 (ix)
   7706 DD 66 F9      [19] 3161 	ld	h,-7 (ix)
   7709 36 01         [10] 3162 	ld	(hl),#0x01
   770B                    3163 00171$:
                           3164 ;src/main.c:560: if (!movY) {
   770B DD 7E F3      [19] 3165 	ld	a,-13 (ix)
   770E B7            [ 4] 3166 	or	a, a
   770F C2 32 78      [10] 3167 	jp	NZ,00199$
                           3168 ;src/main.c:561: if (enemy->x < ANCHO_PANTALLA/2) {
   7712 DD 6E F4      [19] 3169 	ld	l,-12 (ix)
   7715 DD 66 F5      [19] 3170 	ld	h,-11 (ix)
   7718 4E            [ 7] 3171 	ld	c,(hl)
                           3172 ;src/main.c:443: u8 dify = abs(enemy->y - prota.y);
   7719 DD 6E F6      [19] 3173 	ld	l,-10 (ix)
   771C DD 66 F7      [19] 3174 	ld	h,-9 (ix)
   771F 46            [ 7] 3175 	ld	b,(hl)
                           3176 ;src/main.c:561: if (enemy->x < ANCHO_PANTALLA/2) {
   7720 79            [ 4] 3177 	ld	a,c
   7721 D6 28         [ 7] 3178 	sub	a, #0x28
   7723 D2 A8 77      [10] 3179 	jp	NC,00183$
                           3180 ;src/main.c:562: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7726 C5            [11] 3181 	push	bc
   7727 2A C5 64      [16] 3182 	ld	hl,(_mapa)
   772A E5            [11] 3183 	push	hl
   772B CD 1C 4B      [17] 3184 	call	_getTilePtr
   772E F1            [10] 3185 	pop	af
   772F F1            [10] 3186 	pop	af
   7730 4E            [ 7] 3187 	ld	c,(hl)
   7731 3E 02         [ 7] 3188 	ld	a,#0x02
   7733 91            [ 4] 3189 	sub	a, c
   7734 38 5C         [12] 3190 	jr	C,00173$
                           3191 ;src/main.c:563: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7736 DD 6E F6      [19] 3192 	ld	l,-10 (ix)
   7739 DD 66 F7      [19] 3193 	ld	h,-9 (ix)
   773C 7E            [ 7] 3194 	ld	a,(hl)
   773D C6 0B         [ 7] 3195 	add	a, #0x0B
   773F DD 6E F4      [19] 3196 	ld	l,-12 (ix)
   7742 DD 66 F5      [19] 3197 	ld	h,-11 (ix)
   7745 46            [ 7] 3198 	ld	b,(hl)
   7746 F5            [11] 3199 	push	af
   7747 33            [ 6] 3200 	inc	sp
   7748 C5            [11] 3201 	push	bc
   7749 33            [ 6] 3202 	inc	sp
   774A 2A C5 64      [16] 3203 	ld	hl,(_mapa)
   774D E5            [11] 3204 	push	hl
   774E CD 1C 4B      [17] 3205 	call	_getTilePtr
   7751 F1            [10] 3206 	pop	af
   7752 F1            [10] 3207 	pop	af
   7753 4E            [ 7] 3208 	ld	c,(hl)
   7754 3E 02         [ 7] 3209 	ld	a,#0x02
   7756 91            [ 4] 3210 	sub	a, c
   7757 38 39         [12] 3211 	jr	C,00173$
                           3212 ;src/main.c:564: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7759 DD 6E F6      [19] 3213 	ld	l,-10 (ix)
   775C DD 66 F7      [19] 3214 	ld	h,-9 (ix)
   775F 7E            [ 7] 3215 	ld	a,(hl)
   7760 C6 16         [ 7] 3216 	add	a, #0x16
   7762 DD 6E F4      [19] 3217 	ld	l,-12 (ix)
   7765 DD 66 F5      [19] 3218 	ld	h,-11 (ix)
   7768 46            [ 7] 3219 	ld	b,(hl)
   7769 F5            [11] 3220 	push	af
   776A 33            [ 6] 3221 	inc	sp
   776B C5            [11] 3222 	push	bc
   776C 33            [ 6] 3223 	inc	sp
   776D 2A C5 64      [16] 3224 	ld	hl,(_mapa)
   7770 E5            [11] 3225 	push	hl
   7771 CD 1C 4B      [17] 3226 	call	_getTilePtr
   7774 F1            [10] 3227 	pop	af
   7775 F1            [10] 3228 	pop	af
   7776 4E            [ 7] 3229 	ld	c,(hl)
   7777 3E 02         [ 7] 3230 	ld	a,#0x02
   7779 91            [ 4] 3231 	sub	a, c
   777A 38 16         [12] 3232 	jr	C,00173$
                           3233 ;src/main.c:565: moverEnemigoIzquierda(enemy);
   777C DD 6E F4      [19] 3234 	ld	l,-12 (ix)
   777F DD 66 F5      [19] 3235 	ld	h,-11 (ix)
   7782 E5            [11] 3236 	push	hl
   7783 CD 6A 6B      [17] 3237 	call	_moverEnemigoIzquierda
   7786 F1            [10] 3238 	pop	af
                           3239 ;src/main.c:566: enemy->mover = SI;
   7787 DD 6E F8      [19] 3240 	ld	l,-8 (ix)
   778A DD 66 F9      [19] 3241 	ld	h,-7 (ix)
   778D 36 01         [10] 3242 	ld	(hl),#0x01
   778F C3 32 78      [10] 3243 	jp	00199$
   7792                    3244 00173$:
                           3245 ;src/main.c:568: moverEnemigoDerecha(enemy);
   7792 DD 6E F4      [19] 3246 	ld	l,-12 (ix)
   7795 DD 66 F5      [19] 3247 	ld	h,-11 (ix)
   7798 E5            [11] 3248 	push	hl
   7799 CD 5A 6B      [17] 3249 	call	_moverEnemigoDerecha
   779C F1            [10] 3250 	pop	af
                           3251 ;src/main.c:569: enemy->mover = SI;
   779D DD 6E F8      [19] 3252 	ld	l,-8 (ix)
   77A0 DD 66 F9      [19] 3253 	ld	h,-7 (ix)
   77A3 36 01         [10] 3254 	ld	(hl),#0x01
   77A5 C3 32 78      [10] 3255 	jp	00199$
   77A8                    3256 00183$:
                           3257 ;src/main.c:572: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   77A8 79            [ 4] 3258 	ld	a,c
   77A9 C6 04         [ 7] 3259 	add	a, #0x04
   77AB C5            [11] 3260 	push	bc
   77AC 33            [ 6] 3261 	inc	sp
   77AD F5            [11] 3262 	push	af
   77AE 33            [ 6] 3263 	inc	sp
   77AF 2A C5 64      [16] 3264 	ld	hl,(_mapa)
   77B2 E5            [11] 3265 	push	hl
   77B3 CD 1C 4B      [17] 3266 	call	_getTilePtr
   77B6 F1            [10] 3267 	pop	af
   77B7 F1            [10] 3268 	pop	af
   77B8 4E            [ 7] 3269 	ld	c,(hl)
   77B9 3E 02         [ 7] 3270 	ld	a,#0x02
   77BB 91            [ 4] 3271 	sub	a, c
   77BC 38 61         [12] 3272 	jr	C,00178$
                           3273 ;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   77BE DD 6E F6      [19] 3274 	ld	l,-10 (ix)
   77C1 DD 66 F7      [19] 3275 	ld	h,-9 (ix)
   77C4 7E            [ 7] 3276 	ld	a,(hl)
   77C5 C6 0B         [ 7] 3277 	add	a, #0x0B
   77C7 47            [ 4] 3278 	ld	b,a
   77C8 DD 6E F4      [19] 3279 	ld	l,-12 (ix)
   77CB DD 66 F5      [19] 3280 	ld	h,-11 (ix)
   77CE 7E            [ 7] 3281 	ld	a,(hl)
   77CF C6 04         [ 7] 3282 	add	a, #0x04
   77D1 C5            [11] 3283 	push	bc
   77D2 33            [ 6] 3284 	inc	sp
   77D3 F5            [11] 3285 	push	af
   77D4 33            [ 6] 3286 	inc	sp
   77D5 2A C5 64      [16] 3287 	ld	hl,(_mapa)
   77D8 E5            [11] 3288 	push	hl
   77D9 CD 1C 4B      [17] 3289 	call	_getTilePtr
   77DC F1            [10] 3290 	pop	af
   77DD F1            [10] 3291 	pop	af
   77DE 4E            [ 7] 3292 	ld	c,(hl)
   77DF 3E 02         [ 7] 3293 	ld	a,#0x02
   77E1 91            [ 4] 3294 	sub	a, c
   77E2 38 3B         [12] 3295 	jr	C,00178$
                           3296 ;src/main.c:574: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   77E4 DD 6E F6      [19] 3297 	ld	l,-10 (ix)
   77E7 DD 66 F7      [19] 3298 	ld	h,-9 (ix)
   77EA 7E            [ 7] 3299 	ld	a,(hl)
   77EB C6 16         [ 7] 3300 	add	a, #0x16
   77ED 47            [ 4] 3301 	ld	b,a
   77EE DD 6E F4      [19] 3302 	ld	l,-12 (ix)
   77F1 DD 66 F5      [19] 3303 	ld	h,-11 (ix)
   77F4 7E            [ 7] 3304 	ld	a,(hl)
   77F5 C6 04         [ 7] 3305 	add	a, #0x04
   77F7 C5            [11] 3306 	push	bc
   77F8 33            [ 6] 3307 	inc	sp
   77F9 F5            [11] 3308 	push	af
   77FA 33            [ 6] 3309 	inc	sp
   77FB 2A C5 64      [16] 3310 	ld	hl,(_mapa)
   77FE E5            [11] 3311 	push	hl
   77FF CD 1C 4B      [17] 3312 	call	_getTilePtr
   7802 F1            [10] 3313 	pop	af
   7803 F1            [10] 3314 	pop	af
   7804 4E            [ 7] 3315 	ld	c,(hl)
   7805 3E 02         [ 7] 3316 	ld	a,#0x02
   7807 91            [ 4] 3317 	sub	a, c
   7808 38 15         [12] 3318 	jr	C,00178$
                           3319 ;src/main.c:575: moverEnemigoDerecha(enemy);
   780A DD 6E F4      [19] 3320 	ld	l,-12 (ix)
   780D DD 66 F5      [19] 3321 	ld	h,-11 (ix)
   7810 E5            [11] 3322 	push	hl
   7811 CD 5A 6B      [17] 3323 	call	_moverEnemigoDerecha
   7814 F1            [10] 3324 	pop	af
                           3325 ;src/main.c:576: enemy->mover = SI;
   7815 DD 6E F8      [19] 3326 	ld	l,-8 (ix)
   7818 DD 66 F9      [19] 3327 	ld	h,-7 (ix)
   781B 36 01         [10] 3328 	ld	(hl),#0x01
   781D 18 13         [12] 3329 	jr	00199$
   781F                    3330 00178$:
                           3331 ;src/main.c:579: moverEnemigoIzquierda(enemy);
   781F DD 6E F4      [19] 3332 	ld	l,-12 (ix)
   7822 DD 66 F5      [19] 3333 	ld	h,-11 (ix)
   7825 E5            [11] 3334 	push	hl
   7826 CD 6A 6B      [17] 3335 	call	_moverEnemigoIzquierda
   7829 F1            [10] 3336 	pop	af
                           3337 ;src/main.c:580: enemy->mover = SI;
   782A DD 6E F8      [19] 3338 	ld	l,-8 (ix)
   782D DD 66 F9      [19] 3339 	ld	h,-7 (ix)
   7830 36 01         [10] 3340 	ld	(hl),#0x01
   7832                    3341 00199$:
   7832 DD F9         [10] 3342 	ld	sp, ix
   7834 DD E1         [14] 3343 	pop	ix
   7836 C9            [10] 3344 	ret
                           3345 ;src/main.c:589: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3346 ;	---------------------------------
                           3347 ; Function updateEnemy
                           3348 ; ---------------------------------
   7837                    3349 _updateEnemy::
   7837 DD E5         [15] 3350 	push	ix
   7839 DD 21 00 00   [14] 3351 	ld	ix,#0
   783D DD 39         [15] 3352 	add	ix,sp
   783F 21 F4 FF      [10] 3353 	ld	hl,#-12
   7842 39            [11] 3354 	add	hl,sp
   7843 F9            [ 6] 3355 	ld	sp,hl
                           3356 ;src/main.c:596: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7844 DD 4E 04      [19] 3357 	ld	c,4 (ix)
   7847 DD 46 05      [19] 3358 	ld	b,5 (ix)
   784A 21 16 00      [10] 3359 	ld	hl,#0x0016
   784D 09            [11] 3360 	add	hl,bc
   784E DD 75 F8      [19] 3361 	ld	-8 (ix),l
   7851 DD 74 F9      [19] 3362 	ld	-7 (ix),h
   7854 DD 6E F8      [19] 3363 	ld	l,-8 (ix)
   7857 DD 66 F9      [19] 3364 	ld	h,-7 (ix)
   785A 7E            [ 7] 3365 	ld	a,(hl)
   785B B7            [ 4] 3366 	or	a, a
   785C 28 14         [12] 3367 	jr	Z,00115$
                           3368 ;src/main.c:597: engage(actual, prota.x, prota.y);
   785E 3A E9 63      [13] 3369 	ld	a, (#_prota + 1)
   7861 21 E8 63      [10] 3370 	ld	hl, #_prota + 0
   7864 56            [ 7] 3371 	ld	d,(hl)
   7865 F5            [11] 3372 	push	af
   7866 33            [ 6] 3373 	inc	sp
   7867 D5            [11] 3374 	push	de
   7868 33            [ 6] 3375 	inc	sp
   7869 C5            [11] 3376 	push	bc
   786A CD 8C 70      [17] 3377 	call	_engage
   786D F1            [10] 3378 	pop	af
   786E F1            [10] 3379 	pop	af
   786F C3 8E 79      [10] 3380 	jp	00117$
   7872                    3381 00115$:
                           3382 ;src/main.c:599: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7872 C5            [11] 3383 	push	bc
   7873 C5            [11] 3384 	push	bc
   7874 CD C5 6D      [17] 3385 	call	_lookFor
   7877 F1            [10] 3386 	pop	af
   7878 C1            [10] 3387 	pop	bc
                           3388 ;src/main.c:606: actual->patrolling = 0;
   7879 21 0B 00      [10] 3389 	ld	hl,#0x000B
   787C 09            [11] 3390 	add	hl,bc
   787D DD 75 F6      [19] 3391 	ld	-10 (ix),l
   7880 DD 74 F7      [19] 3392 	ld	-9 (ix),h
                           3393 ;src/main.c:600: if (actual->patrolling) {
   7883 DD 6E F6      [19] 3394 	ld	l,-10 (ix)
   7886 DD 66 F7      [19] 3395 	ld	h,-9 (ix)
   7889 6E            [ 7] 3396 	ld	l,(hl)
                           3397 ;src/main.c:603: if (actual->in_range) {
   788A 79            [ 4] 3398 	ld	a,c
   788B C6 11         [ 7] 3399 	add	a, #0x11
   788D 5F            [ 4] 3400 	ld	e,a
   788E 78            [ 4] 3401 	ld	a,b
   788F CE 00         [ 7] 3402 	adc	a, #0x00
   7891 57            [ 4] 3403 	ld	d,a
                           3404 ;src/main.c:612: actual->seek = 1;
   7892 79            [ 4] 3405 	ld	a,c
   7893 C6 14         [ 7] 3406 	add	a, #0x14
   7895 DD 77 F4      [19] 3407 	ld	-12 (ix),a
   7898 78            [ 4] 3408 	ld	a,b
   7899 CE 00         [ 7] 3409 	adc	a, #0x00
   789B DD 77 F5      [19] 3410 	ld	-11 (ix),a
                           3411 ;src/main.c:600: if (actual->patrolling) {
   789E 7D            [ 4] 3412 	ld	a,l
   789F B7            [ 4] 3413 	or	a, a
   78A0 CA 5E 79      [10] 3414 	jp	Z,00112$
                           3415 ;src/main.c:602: moverEnemigoPatrol(actual);
   78A3 C5            [11] 3416 	push	bc
   78A4 D5            [11] 3417 	push	de
   78A5 C5            [11] 3418 	push	bc
   78A6 CD 7C 6B      [17] 3419 	call	_moverEnemigoPatrol
   78A9 F1            [10] 3420 	pop	af
   78AA D1            [10] 3421 	pop	de
   78AB C1            [10] 3422 	pop	bc
                           3423 ;src/main.c:603: if (actual->in_range) {
   78AC 1A            [ 7] 3424 	ld	a,(de)
   78AD B7            [ 4] 3425 	or	a, a
   78AE 28 24         [12] 3426 	jr	Z,00104$
                           3427 ;src/main.c:605: engage(actual, prota.x, prota.y);
   78B0 3A E9 63      [13] 3428 	ld	a, (#_prota + 1)
   78B3 21 E8 63      [10] 3429 	ld	hl, #_prota + 0
   78B6 56            [ 7] 3430 	ld	d,(hl)
   78B7 F5            [11] 3431 	push	af
   78B8 33            [ 6] 3432 	inc	sp
   78B9 D5            [11] 3433 	push	de
   78BA 33            [ 6] 3434 	inc	sp
   78BB C5            [11] 3435 	push	bc
   78BC CD 8C 70      [17] 3436 	call	_engage
   78BF F1            [10] 3437 	pop	af
   78C0 F1            [10] 3438 	pop	af
                           3439 ;src/main.c:606: actual->patrolling = 0;
   78C1 DD 6E F6      [19] 3440 	ld	l,-10 (ix)
   78C4 DD 66 F7      [19] 3441 	ld	h,-9 (ix)
   78C7 36 00         [10] 3442 	ld	(hl),#0x00
                           3443 ;src/main.c:607: actual->engage = 1;
   78C9 DD 6E F8      [19] 3444 	ld	l,-8 (ix)
   78CC DD 66 F9      [19] 3445 	ld	h,-7 (ix)
   78CF 36 01         [10] 3446 	ld	(hl),#0x01
   78D1 C3 8E 79      [10] 3447 	jp	00117$
   78D4                    3448 00104$:
                           3449 ;src/main.c:608: } else if (actual->seen) {
   78D4 21 12 00      [10] 3450 	ld	hl,#0x0012
   78D7 09            [11] 3451 	add	hl,bc
   78D8 DD 75 FA      [19] 3452 	ld	-6 (ix),l
   78DB DD 74 FB      [19] 3453 	ld	-5 (ix),h
   78DE DD 6E FA      [19] 3454 	ld	l,-6 (ix)
   78E1 DD 66 FB      [19] 3455 	ld	h,-5 (ix)
   78E4 7E            [ 7] 3456 	ld	a,(hl)
   78E5 B7            [ 4] 3457 	or	a, a
   78E6 CA 8E 79      [10] 3458 	jp	Z,00117$
                           3459 ;src/main.c:609: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   78E9 3A E9 63      [13] 3460 	ld	a,(#_prota + 1)
   78EC DD 77 FD      [19] 3461 	ld	-3 (ix),a
   78EF 21 E8 63      [10] 3462 	ld	hl, #_prota + 0
   78F2 5E            [ 7] 3463 	ld	e,(hl)
   78F3 21 01 00      [10] 3464 	ld	hl,#0x0001
   78F6 09            [11] 3465 	add	hl,bc
   78F7 DD 75 FE      [19] 3466 	ld	-2 (ix),l
   78FA DD 74 FF      [19] 3467 	ld	-1 (ix),h
   78FD DD 6E FE      [19] 3468 	ld	l,-2 (ix)
   7900 DD 66 FF      [19] 3469 	ld	h,-1 (ix)
   7903 56            [ 7] 3470 	ld	d,(hl)
   7904 0A            [ 7] 3471 	ld	a,(bc)
   7905 DD 77 FC      [19] 3472 	ld	-4 (ix),a
   7908 C5            [11] 3473 	push	bc
   7909 2A C5 64      [16] 3474 	ld	hl,(_mapa)
   790C E5            [11] 3475 	push	hl
   790D C5            [11] 3476 	push	bc
   790E DD 7E FD      [19] 3477 	ld	a,-3 (ix)
   7911 F5            [11] 3478 	push	af
   7912 33            [ 6] 3479 	inc	sp
   7913 7B            [ 4] 3480 	ld	a,e
   7914 F5            [11] 3481 	push	af
   7915 33            [ 6] 3482 	inc	sp
   7916 D5            [11] 3483 	push	de
   7917 33            [ 6] 3484 	inc	sp
   7918 DD 7E FC      [19] 3485 	ld	a,-4 (ix)
   791B F5            [11] 3486 	push	af
   791C 33            [ 6] 3487 	inc	sp
   791D CD 72 49      [17] 3488 	call	_pathFinding
   7920 21 08 00      [10] 3489 	ld	hl,#8
   7923 39            [11] 3490 	add	hl,sp
   7924 F9            [ 6] 3491 	ld	sp,hl
   7925 C1            [10] 3492 	pop	bc
                           3493 ;src/main.c:610: actual->p_seek_x = actual->x;
   7926 21 17 00      [10] 3494 	ld	hl,#0x0017
   7929 09            [11] 3495 	add	hl,bc
   792A EB            [ 4] 3496 	ex	de,hl
   792B 0A            [ 7] 3497 	ld	a,(bc)
   792C 12            [ 7] 3498 	ld	(de),a
                           3499 ;src/main.c:611: actual->p_seek_y = actual->y;
   792D 21 18 00      [10] 3500 	ld	hl,#0x0018
   7930 09            [11] 3501 	add	hl,bc
   7931 EB            [ 4] 3502 	ex	de,hl
   7932 DD 6E FE      [19] 3503 	ld	l,-2 (ix)
   7935 DD 66 FF      [19] 3504 	ld	h,-1 (ix)
   7938 7E            [ 7] 3505 	ld	a,(hl)
   7939 12            [ 7] 3506 	ld	(de),a
                           3507 ;src/main.c:612: actual->seek = 1;
   793A E1            [10] 3508 	pop	hl
   793B E5            [11] 3509 	push	hl
   793C 36 01         [10] 3510 	ld	(hl),#0x01
                           3511 ;src/main.c:613: actual->iter=0;
   793E 21 0E 00      [10] 3512 	ld	hl,#0x000E
   7941 09            [11] 3513 	add	hl,bc
   7942 AF            [ 4] 3514 	xor	a, a
   7943 77            [ 7] 3515 	ld	(hl), a
   7944 23            [ 6] 3516 	inc	hl
   7945 77            [ 7] 3517 	ld	(hl), a
                           3518 ;src/main.c:614: actual->reversePatrol = NO;
   7946 21 0C 00      [10] 3519 	ld	hl,#0x000C
   7949 09            [11] 3520 	add	hl,bc
   794A 36 00         [10] 3521 	ld	(hl),#0x00
                           3522 ;src/main.c:615: actual->patrolling = 0;
   794C DD 6E F6      [19] 3523 	ld	l,-10 (ix)
   794F DD 66 F7      [19] 3524 	ld	h,-9 (ix)
   7952 36 00         [10] 3525 	ld	(hl),#0x00
                           3526 ;src/main.c:616: actual->seen = 0;
   7954 DD 6E FA      [19] 3527 	ld	l,-6 (ix)
   7957 DD 66 FB      [19] 3528 	ld	h,-5 (ix)
   795A 36 00         [10] 3529 	ld	(hl),#0x00
   795C 18 30         [12] 3530 	jr	00117$
   795E                    3531 00112$:
                           3532 ;src/main.c:618: } else if (actual->seek) {
   795E E1            [10] 3533 	pop	hl
   795F E5            [11] 3534 	push	hl
   7960 7E            [ 7] 3535 	ld	a,(hl)
   7961 B7            [ 4] 3536 	or	a, a
   7962 28 2A         [12] 3537 	jr	Z,00117$
                           3538 ;src/main.c:619: moverEnemigoSeek(actual);
   7964 C5            [11] 3539 	push	bc
   7965 D5            [11] 3540 	push	de
   7966 C5            [11] 3541 	push	bc
   7967 CD DA 6E      [17] 3542 	call	_moverEnemigoSeek
   796A F1            [10] 3543 	pop	af
   796B D1            [10] 3544 	pop	de
   796C C1            [10] 3545 	pop	bc
                           3546 ;src/main.c:620: if (actual->in_range) {
   796D 1A            [ 7] 3547 	ld	a,(de)
   796E B7            [ 4] 3548 	or	a, a
   796F 28 1D         [12] 3549 	jr	Z,00117$
                           3550 ;src/main.c:621: engage(actual, prota.x, prota.y);
   7971 3A E9 63      [13] 3551 	ld	a, (#_prota + 1)
   7974 21 E8 63      [10] 3552 	ld	hl, #_prota + 0
   7977 56            [ 7] 3553 	ld	d,(hl)
   7978 F5            [11] 3554 	push	af
   7979 33            [ 6] 3555 	inc	sp
   797A D5            [11] 3556 	push	de
   797B 33            [ 6] 3557 	inc	sp
   797C C5            [11] 3558 	push	bc
   797D CD 8C 70      [17] 3559 	call	_engage
   7980 F1            [10] 3560 	pop	af
   7981 F1            [10] 3561 	pop	af
                           3562 ;src/main.c:622: actual->seek = 0;
   7982 E1            [10] 3563 	pop	hl
   7983 E5            [11] 3564 	push	hl
   7984 36 00         [10] 3565 	ld	(hl),#0x00
                           3566 ;src/main.c:623: actual->engage = 1;
   7986 DD 6E F8      [19] 3567 	ld	l,-8 (ix)
   7989 DD 66 F9      [19] 3568 	ld	h,-7 (ix)
   798C 36 01         [10] 3569 	ld	(hl),#0x01
                           3570 ;src/main.c:624: } else if (actual->seen) {
   798E                    3571 00117$:
   798E DD F9         [10] 3572 	ld	sp, ix
   7990 DD E1         [14] 3573 	pop	ix
   7992 C9            [10] 3574 	ret
                           3575 ;src/main.c:631: void inicializarEnemy() {
                           3576 ;	---------------------------------
                           3577 ; Function inicializarEnemy
                           3578 ; ---------------------------------
   7993                    3579 _inicializarEnemy::
   7993 DD E5         [15] 3580 	push	ix
   7995 DD 21 00 00   [14] 3581 	ld	ix,#0
   7999 DD 39         [15] 3582 	add	ix,sp
   799B 21 F9 FF      [10] 3583 	ld	hl,#-7
   799E 39            [11] 3584 	add	hl,sp
   799F F9            [ 6] 3585 	ld	sp,hl
                           3586 ;src/main.c:632: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   79A0 3A C7 64      [13] 3587 	ld	a,(#_num_mapa + 0)
   79A3 C6 02         [ 7] 3588 	add	a, #0x02
   79A5 DD 77 F9      [19] 3589 	ld	-7 (ix),a
                           3590 ;src/main.c:642: actual = enemy;
   79A8 11 60 60      [10] 3591 	ld	de,#_enemy+0
                           3592 ;src/main.c:643: while(i){
   79AB                    3593 00101$:
   79AB DD 7E F9      [19] 3594 	ld	a,-7 (ix)
   79AE B7            [ 4] 3595 	or	a, a
   79AF CA A1 7A      [10] 3596 	jp	Z,00104$
                           3597 ;src/main.c:644: --i;
   79B2 DD 35 F9      [23] 3598 	dec	-7 (ix)
                           3599 ;src/main.c:645: actual->x = actual->px = spawnX[i];
   79B5 4B            [ 4] 3600 	ld	c, e
   79B6 42            [ 4] 3601 	ld	b, d
   79B7 03            [ 6] 3602 	inc	bc
   79B8 03            [ 6] 3603 	inc	bc
   79B9 3E EB         [ 7] 3604 	ld	a,#<(_spawnX)
   79BB DD 86 F9      [19] 3605 	add	a, -7 (ix)
   79BE DD 77 FD      [19] 3606 	ld	-3 (ix),a
   79C1 3E 64         [ 7] 3607 	ld	a,#>(_spawnX)
   79C3 CE 00         [ 7] 3608 	adc	a, #0x00
   79C5 DD 77 FE      [19] 3609 	ld	-2 (ix),a
   79C8 DD 6E FD      [19] 3610 	ld	l,-3 (ix)
   79CB DD 66 FE      [19] 3611 	ld	h,-2 (ix)
   79CE 7E            [ 7] 3612 	ld	a,(hl)
   79CF 02            [ 7] 3613 	ld	(bc),a
   79D0 12            [ 7] 3614 	ld	(de),a
                           3615 ;src/main.c:646: actual->y = actual->py = spawnY[i];
   79D1 D5            [11] 3616 	push	de
   79D2 FD E1         [14] 3617 	pop	iy
   79D4 FD 23         [10] 3618 	inc	iy
   79D6 4B            [ 4] 3619 	ld	c, e
   79D7 42            [ 4] 3620 	ld	b, d
   79D8 03            [ 6] 3621 	inc	bc
   79D9 03            [ 6] 3622 	inc	bc
   79DA 03            [ 6] 3623 	inc	bc
   79DB 3E EF         [ 7] 3624 	ld	a,#<(_spawnY)
   79DD DD 86 F9      [19] 3625 	add	a, -7 (ix)
   79E0 DD 77 FB      [19] 3626 	ld	-5 (ix),a
   79E3 3E 64         [ 7] 3627 	ld	a,#>(_spawnY)
   79E5 CE 00         [ 7] 3628 	adc	a, #0x00
   79E7 DD 77 FC      [19] 3629 	ld	-4 (ix),a
   79EA DD 6E FB      [19] 3630 	ld	l,-5 (ix)
   79ED DD 66 FC      [19] 3631 	ld	h,-4 (ix)
   79F0 7E            [ 7] 3632 	ld	a,(hl)
   79F1 02            [ 7] 3633 	ld	(bc),a
   79F2 FD 77 00      [19] 3634 	ld	0 (iy), a
                           3635 ;src/main.c:647: actual->mover  = NO;
   79F5 21 06 00      [10] 3636 	ld	hl,#0x0006
   79F8 19            [11] 3637 	add	hl,de
   79F9 36 00         [10] 3638 	ld	(hl),#0x00
                           3639 ;src/main.c:648: actual->mira   = M_abajo;
   79FB 21 07 00      [10] 3640 	ld	hl,#0x0007
   79FE 19            [11] 3641 	add	hl,de
   79FF 36 03         [10] 3642 	ld	(hl),#0x03
                           3643 ;src/main.c:649: actual->sprite = g_enemy;
   7A01 21 04 00      [10] 3644 	ld	hl,#0x0004
   7A04 19            [11] 3645 	add	hl,de
   7A05 36 3A         [10] 3646 	ld	(hl),#<(_g_enemy)
   7A07 23            [ 6] 3647 	inc	hl
   7A08 36 3C         [10] 3648 	ld	(hl),#>(_g_enemy)
                           3649 ;src/main.c:650: actual->muerto = NO;
   7A0A 21 08 00      [10] 3650 	ld	hl,#0x0008
   7A0D 19            [11] 3651 	add	hl,de
   7A0E 36 00         [10] 3652 	ld	(hl),#0x00
                           3653 ;src/main.c:651: actual->muertes = 0;
   7A10 21 0A 00      [10] 3654 	ld	hl,#0x000A
   7A13 19            [11] 3655 	add	hl,de
   7A14 36 00         [10] 3656 	ld	(hl),#0x00
                           3657 ;src/main.c:652: actual->patrolling = SI;
   7A16 21 0B 00      [10] 3658 	ld	hl,#0x000B
   7A19 19            [11] 3659 	add	hl,de
   7A1A 36 01         [10] 3660 	ld	(hl),#0x01
                           3661 ;src/main.c:653: actual->reversePatrol = NO;
   7A1C 21 0C 00      [10] 3662 	ld	hl,#0x000C
   7A1F 19            [11] 3663 	add	hl,de
   7A20 36 00         [10] 3664 	ld	(hl),#0x00
                           3665 ;src/main.c:654: actual->iter = 0;
   7A22 21 0E 00      [10] 3666 	ld	hl,#0x000E
   7A25 19            [11] 3667 	add	hl,de
   7A26 AF            [ 4] 3668 	xor	a, a
   7A27 77            [ 7] 3669 	ld	(hl), a
   7A28 23            [ 6] 3670 	inc	hl
   7A29 77            [ 7] 3671 	ld	(hl), a
                           3672 ;src/main.c:655: actual->lastIter = 0;
   7A2A 21 10 00      [10] 3673 	ld	hl,#0x0010
   7A2D 19            [11] 3674 	add	hl,de
   7A2E 36 00         [10] 3675 	ld	(hl),#0x00
                           3676 ;src/main.c:656: actual->seen = 0;
   7A30 21 12 00      [10] 3677 	ld	hl,#0x0012
   7A33 19            [11] 3678 	add	hl,de
   7A34 36 00         [10] 3679 	ld	(hl),#0x00
                           3680 ;src/main.c:657: actual->found = 0;
   7A36 21 13 00      [10] 3681 	ld	hl,#0x0013
   7A39 19            [11] 3682 	add	hl,de
   7A3A 36 00         [10] 3683 	ld	(hl),#0x00
                           3684 ;src/main.c:658: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7A3C 21 C7 64      [10] 3685 	ld	hl,#_num_mapa + 0
   7A3F 4E            [ 7] 3686 	ld	c, (hl)
   7A40 0C            [ 4] 3687 	inc	c
   7A41 06 00         [ 7] 3688 	ld	b,#0x00
   7A43 69            [ 4] 3689 	ld	l, c
   7A44 60            [ 4] 3690 	ld	h, b
   7A45 29            [11] 3691 	add	hl, hl
   7A46 29            [11] 3692 	add	hl, hl
   7A47 09            [11] 3693 	add	hl, bc
   7A48 4D            [ 4] 3694 	ld	c,l
   7A49 44            [ 4] 3695 	ld	b,h
   7A4A 21 07 65      [10] 3696 	ld	hl,#_patrolY
   7A4D 09            [11] 3697 	add	hl,bc
   7A4E 7D            [ 4] 3698 	ld	a,l
   7A4F DD 86 F9      [19] 3699 	add	a, -7 (ix)
   7A52 6F            [ 4] 3700 	ld	l,a
   7A53 7C            [ 4] 3701 	ld	a,h
   7A54 CE 00         [ 7] 3702 	adc	a, #0x00
   7A56 67            [ 4] 3703 	ld	h,a
   7A57 7E            [ 7] 3704 	ld	a,(hl)
   7A58 DD 77 FF      [19] 3705 	ld	-1 (ix),a
   7A5B 21 F3 64      [10] 3706 	ld	hl,#_patrolX
   7A5E 09            [11] 3707 	add	hl,bc
   7A5F DD 4E F9      [19] 3708 	ld	c,-7 (ix)
   7A62 06 00         [ 7] 3709 	ld	b,#0x00
   7A64 09            [11] 3710 	add	hl,bc
   7A65 7E            [ 7] 3711 	ld	a,(hl)
   7A66 DD 77 FA      [19] 3712 	ld	-6 (ix),a
   7A69 DD 6E FB      [19] 3713 	ld	l,-5 (ix)
   7A6C DD 66 FC      [19] 3714 	ld	h,-4 (ix)
   7A6F 4E            [ 7] 3715 	ld	c,(hl)
   7A70 DD 6E FD      [19] 3716 	ld	l,-3 (ix)
   7A73 DD 66 FE      [19] 3717 	ld	h,-2 (ix)
   7A76 46            [ 7] 3718 	ld	b,(hl)
   7A77 D5            [11] 3719 	push	de
   7A78 2A C5 64      [16] 3720 	ld	hl,(_mapa)
   7A7B E5            [11] 3721 	push	hl
   7A7C D5            [11] 3722 	push	de
   7A7D DD 66 FF      [19] 3723 	ld	h,-1 (ix)
   7A80 DD 6E FA      [19] 3724 	ld	l,-6 (ix)
   7A83 E5            [11] 3725 	push	hl
   7A84 79            [ 4] 3726 	ld	a,c
   7A85 F5            [11] 3727 	push	af
   7A86 33            [ 6] 3728 	inc	sp
   7A87 C5            [11] 3729 	push	bc
   7A88 33            [ 6] 3730 	inc	sp
   7A89 CD 72 49      [17] 3731 	call	_pathFinding
   7A8C 21 08 00      [10] 3732 	ld	hl,#8
   7A8F 39            [11] 3733 	add	hl,sp
   7A90 F9            [ 6] 3734 	ld	sp,hl
   7A91 D1            [10] 3735 	pop	de
                           3736 ;src/main.c:681: dibujarEnemigo(actual);
   7A92 D5            [11] 3737 	push	de
   7A93 D5            [11] 3738 	push	de
   7A94 CD A1 67      [17] 3739 	call	_dibujarEnemigo
   7A97 F1            [10] 3740 	pop	af
   7A98 D1            [10] 3741 	pop	de
                           3742 ;src/main.c:682: ++actual;
   7A99 21 E2 00      [10] 3743 	ld	hl,#0x00E2
   7A9C 19            [11] 3744 	add	hl,de
   7A9D EB            [ 4] 3745 	ex	de,hl
   7A9E C3 AB 79      [10] 3746 	jp	00101$
   7AA1                    3747 00104$:
   7AA1 DD F9         [10] 3748 	ld	sp, ix
   7AA3 DD E1         [14] 3749 	pop	ix
   7AA5 C9            [10] 3750 	ret
                           3751 ;src/main.c:686: void avanzarMapa() {
                           3752 ;	---------------------------------
                           3753 ; Function avanzarMapa
                           3754 ; ---------------------------------
   7AA6                    3755 _avanzarMapa::
                           3756 ;src/main.c:687: if(num_mapa < NUM_MAPAS -1) {
   7AA6 3A C7 64      [13] 3757 	ld	a,(#_num_mapa + 0)
   7AA9 D6 02         [ 7] 3758 	sub	a, #0x02
   7AAB 30 34         [12] 3759 	jr	NC,00102$
                           3760 ;src/main.c:688: mapa = mapas[++num_mapa];
   7AAD 01 E5 64      [10] 3761 	ld	bc,#_mapas+0
   7AB0 21 C7 64      [10] 3762 	ld	hl, #_num_mapa+0
   7AB3 34            [11] 3763 	inc	(hl)
   7AB4 FD 21 C7 64   [14] 3764 	ld	iy,#_num_mapa
   7AB8 FD 6E 00      [19] 3765 	ld	l,0 (iy)
   7ABB 26 00         [ 7] 3766 	ld	h,#0x00
   7ABD 29            [11] 3767 	add	hl, hl
   7ABE 09            [11] 3768 	add	hl,bc
   7ABF 7E            [ 7] 3769 	ld	a,(hl)
   7AC0 FD 21 C5 64   [14] 3770 	ld	iy,#_mapa
   7AC4 FD 77 00      [19] 3771 	ld	0 (iy),a
   7AC7 23            [ 6] 3772 	inc	hl
   7AC8 7E            [ 7] 3773 	ld	a,(hl)
   7AC9 32 C6 64      [13] 3774 	ld	(#_mapa + 1),a
                           3775 ;src/main.c:689: prota.x = prota.px = 2;
   7ACC 21 EA 63      [10] 3776 	ld	hl,#(_prota + 0x0002)
   7ACF 36 02         [10] 3777 	ld	(hl),#0x02
   7AD1 21 E8 63      [10] 3778 	ld	hl,#_prota
   7AD4 36 02         [10] 3779 	ld	(hl),#0x02
                           3780 ;src/main.c:690: prota.mover = SI;
   7AD6 21 EE 63      [10] 3781 	ld	hl,#(_prota + 0x0006)
   7AD9 36 01         [10] 3782 	ld	(hl),#0x01
                           3783 ;src/main.c:691: dibujarMapa();
   7ADB CD CF 64      [17] 3784 	call	_dibujarMapa
                           3785 ;src/main.c:692: inicializarEnemy();
   7ADE C3 93 79      [10] 3786 	jp  _inicializarEnemy
   7AE1                    3787 00102$:
                           3788 ;src/main.c:695: menuFin(puntuacion);
   7AE1 FD 21 C8 64   [14] 3789 	ld	iy,#_puntuacion
   7AE5 FD 6E 00      [19] 3790 	ld	l,0 (iy)
   7AE8 26 00         [ 7] 3791 	ld	h,#0x00
   7AEA C3 A0 4B      [10] 3792 	jp  _menuFin
                           3793 ;src/main.c:699: void moverIzquierda() {
                           3794 ;	---------------------------------
                           3795 ; Function moverIzquierda
                           3796 ; ---------------------------------
   7AED                    3797 _moverIzquierda::
                           3798 ;src/main.c:700: prota.mira = M_izquierda;
   7AED 01 E8 63      [10] 3799 	ld	bc,#_prota+0
   7AF0 21 EF 63      [10] 3800 	ld	hl,#(_prota + 0x0007)
   7AF3 36 01         [10] 3801 	ld	(hl),#0x01
                           3802 ;src/main.c:701: if (!checkCollision(M_izquierda)) {
   7AF5 C5            [11] 3803 	push	bc
   7AF6 3E 01         [ 7] 3804 	ld	a,#0x01
   7AF8 F5            [11] 3805 	push	af
   7AF9 33            [ 6] 3806 	inc	sp
   7AFA CD 30 66      [17] 3807 	call	_checkCollision
   7AFD 33            [ 6] 3808 	inc	sp
   7AFE C1            [10] 3809 	pop	bc
   7AFF 7D            [ 4] 3810 	ld	a,l
   7B00 B7            [ 4] 3811 	or	a, a
   7B01 C0            [11] 3812 	ret	NZ
                           3813 ;src/main.c:702: prota.x--;
   7B02 0A            [ 7] 3814 	ld	a,(bc)
   7B03 C6 FF         [ 7] 3815 	add	a,#0xFF
   7B05 02            [ 7] 3816 	ld	(bc),a
                           3817 ;src/main.c:703: prota.mover = SI;
   7B06 21 EE 63      [10] 3818 	ld	hl,#(_prota + 0x0006)
   7B09 36 01         [10] 3819 	ld	(hl),#0x01
                           3820 ;src/main.c:704: prota.sprite = g_hero_left;
   7B0B 21 C6 3D      [10] 3821 	ld	hl,#_g_hero_left
   7B0E 22 EC 63      [16] 3822 	ld	((_prota + 0x0004)), hl
   7B11 C9            [10] 3823 	ret
                           3824 ;src/main.c:708: void moverDerecha() {
                           3825 ;	---------------------------------
                           3826 ; Function moverDerecha
                           3827 ; ---------------------------------
   7B12                    3828 _moverDerecha::
                           3829 ;src/main.c:709: prota.mira = M_derecha;
   7B12 21 EF 63      [10] 3830 	ld	hl,#(_prota + 0x0007)
   7B15 36 00         [10] 3831 	ld	(hl),#0x00
                           3832 ;src/main.c:710: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7B17 AF            [ 4] 3833 	xor	a, a
   7B18 F5            [11] 3834 	push	af
   7B19 33            [ 6] 3835 	inc	sp
   7B1A CD 30 66      [17] 3836 	call	_checkCollision
   7B1D 33            [ 6] 3837 	inc	sp
   7B1E 45            [ 4] 3838 	ld	b,l
   7B1F 21 E8 63      [10] 3839 	ld	hl, #_prota + 0
   7B22 4E            [ 7] 3840 	ld	c,(hl)
   7B23 59            [ 4] 3841 	ld	e,c
   7B24 16 00         [ 7] 3842 	ld	d,#0x00
   7B26 21 07 00      [10] 3843 	ld	hl,#0x0007
   7B29 19            [11] 3844 	add	hl,de
   7B2A 11 50 80      [10] 3845 	ld	de, #0x8050
   7B2D 29            [11] 3846 	add	hl, hl
   7B2E 3F            [ 4] 3847 	ccf
   7B2F CB 1C         [ 8] 3848 	rr	h
   7B31 CB 1D         [ 8] 3849 	rr	l
   7B33 ED 52         [15] 3850 	sbc	hl, de
   7B35 3E 00         [ 7] 3851 	ld	a,#0x00
   7B37 17            [ 4] 3852 	rla
   7B38 5F            [ 4] 3853 	ld	e,a
   7B39 78            [ 4] 3854 	ld	a,b
   7B3A B7            [ 4] 3855 	or	a,a
   7B3B 20 14         [12] 3856 	jr	NZ,00104$
   7B3D B3            [ 4] 3857 	or	a,e
   7B3E 28 11         [12] 3858 	jr	Z,00104$
                           3859 ;src/main.c:711: prota.x++;
   7B40 0C            [ 4] 3860 	inc	c
   7B41 21 E8 63      [10] 3861 	ld	hl,#_prota
   7B44 71            [ 7] 3862 	ld	(hl),c
                           3863 ;src/main.c:712: prota.mover = SI;
   7B45 21 EE 63      [10] 3864 	ld	hl,#(_prota + 0x0006)
   7B48 36 01         [10] 3865 	ld	(hl),#0x01
                           3866 ;src/main.c:713: prota.sprite = g_hero;
   7B4A 21 70 3E      [10] 3867 	ld	hl,#_g_hero
   7B4D 22 EC 63      [16] 3868 	ld	((_prota + 0x0004)), hl
   7B50 C9            [10] 3869 	ret
   7B51                    3870 00104$:
                           3871 ;src/main.c:715: }else if( prota.x + G_HERO_W >= 80){
   7B51 7B            [ 4] 3872 	ld	a,e
   7B52 B7            [ 4] 3873 	or	a, a
   7B53 C0            [11] 3874 	ret	NZ
                           3875 ;src/main.c:716: avanzarMapa();
   7B54 C3 A6 7A      [10] 3876 	jp  _avanzarMapa
                           3877 ;src/main.c:720: void moverArriba() {
                           3878 ;	---------------------------------
                           3879 ; Function moverArriba
                           3880 ; ---------------------------------
   7B57                    3881 _moverArriba::
                           3882 ;src/main.c:721: prota.mira = M_arriba;
   7B57 21 EF 63      [10] 3883 	ld	hl,#(_prota + 0x0007)
   7B5A 36 02         [10] 3884 	ld	(hl),#0x02
                           3885 ;src/main.c:722: if (!checkCollision(M_arriba)) {
   7B5C 3E 02         [ 7] 3886 	ld	a,#0x02
   7B5E F5            [11] 3887 	push	af
   7B5F 33            [ 6] 3888 	inc	sp
   7B60 CD 30 66      [17] 3889 	call	_checkCollision
   7B63 33            [ 6] 3890 	inc	sp
   7B64 7D            [ 4] 3891 	ld	a,l
   7B65 B7            [ 4] 3892 	or	a, a
   7B66 C0            [11] 3893 	ret	NZ
                           3894 ;src/main.c:723: prota.y--;
   7B67 21 E9 63      [10] 3895 	ld	hl,#_prota + 1
   7B6A 4E            [ 7] 3896 	ld	c,(hl)
   7B6B 0D            [ 4] 3897 	dec	c
   7B6C 71            [ 7] 3898 	ld	(hl),c
                           3899 ;src/main.c:724: prota.y--;
   7B6D 0D            [ 4] 3900 	dec	c
   7B6E 71            [ 7] 3901 	ld	(hl),c
                           3902 ;src/main.c:725: prota.mover  = SI;
   7B6F 21 EE 63      [10] 3903 	ld	hl,#(_prota + 0x0006)
   7B72 36 01         [10] 3904 	ld	(hl),#0x01
                           3905 ;src/main.c:726: prota.sprite = g_hero_up;
   7B74 21 2C 3D      [10] 3906 	ld	hl,#_g_hero_up
   7B77 22 EC 63      [16] 3907 	ld	((_prota + 0x0004)), hl
   7B7A C9            [10] 3908 	ret
                           3909 ;src/main.c:730: void moverAbajo() {
                           3910 ;	---------------------------------
                           3911 ; Function moverAbajo
                           3912 ; ---------------------------------
   7B7B                    3913 _moverAbajo::
                           3914 ;src/main.c:731: prota.mira = M_abajo;
   7B7B 21 EF 63      [10] 3915 	ld	hl,#(_prota + 0x0007)
   7B7E 36 03         [10] 3916 	ld	(hl),#0x03
                           3917 ;src/main.c:732: if (!checkCollision(M_abajo) ) {
   7B80 3E 03         [ 7] 3918 	ld	a,#0x03
   7B82 F5            [11] 3919 	push	af
   7B83 33            [ 6] 3920 	inc	sp
   7B84 CD 30 66      [17] 3921 	call	_checkCollision
   7B87 33            [ 6] 3922 	inc	sp
   7B88 7D            [ 4] 3923 	ld	a,l
   7B89 B7            [ 4] 3924 	or	a, a
   7B8A C0            [11] 3925 	ret	NZ
                           3926 ;src/main.c:733: prota.y++;
   7B8B 01 E9 63      [10] 3927 	ld	bc,#_prota + 1
   7B8E 0A            [ 7] 3928 	ld	a,(bc)
   7B8F 3C            [ 4] 3929 	inc	a
   7B90 02            [ 7] 3930 	ld	(bc),a
                           3931 ;src/main.c:734: prota.y++;
   7B91 3C            [ 4] 3932 	inc	a
   7B92 02            [ 7] 3933 	ld	(bc),a
                           3934 ;src/main.c:735: prota.mover  = SI;
   7B93 21 EE 63      [10] 3935 	ld	hl,#(_prota + 0x0006)
   7B96 36 01         [10] 3936 	ld	(hl),#0x01
                           3937 ;src/main.c:736: prota.sprite = g_hero_down;
   7B98 21 92 3C      [10] 3938 	ld	hl,#_g_hero_down
   7B9B 22 EC 63      [16] 3939 	ld	((_prota + 0x0004)), hl
   7B9E C9            [10] 3940 	ret
                           3941 ;src/main.c:743: void intHandler() {
                           3942 ;	---------------------------------
                           3943 ; Function intHandler
                           3944 ; ---------------------------------
   7B9F                    3945 _intHandler::
                           3946 ;src/main.c:744: if (++i == 6) {
   7B9F 21 FB 63      [10] 3947 	ld	hl, #_i+0
   7BA2 34            [11] 3948 	inc	(hl)
   7BA3 3A FB 63      [13] 3949 	ld	a,(#_i + 0)
   7BA6 D6 06         [ 7] 3950 	sub	a, #0x06
   7BA8 C0            [11] 3951 	ret	NZ
                           3952 ;src/main.c:745: play();
   7BA9 CD 34 53      [17] 3953 	call	_play
                           3954 ;src/main.c:746: i=0;
   7BAC 21 FB 63      [10] 3955 	ld	hl,#_i + 0
   7BAF 36 00         [10] 3956 	ld	(hl), #0x00
   7BB1 C9            [10] 3957 	ret
                           3958 ;src/main.c:750: void inicializarCPC() {
                           3959 ;	---------------------------------
                           3960 ; Function inicializarCPC
                           3961 ; ---------------------------------
   7BB2                    3962 _inicializarCPC::
                           3963 ;src/main.c:751: cpct_disableFirmware();
   7BB2 CD DB 56      [17] 3964 	call	_cpct_disableFirmware
                           3965 ;src/main.c:752: cpct_setVideoMode(0);
   7BB5 2E 00         [ 7] 3966 	ld	l,#0x00
   7BB7 CD AF 56      [17] 3967 	call	_cpct_setVideoMode
                           3968 ;src/main.c:753: cpct_setBorder(HW_BLACK);
   7BBA 21 10 14      [10] 3969 	ld	hl,#0x1410
   7BBD E5            [11] 3970 	push	hl
   7BBE CD 12 54      [17] 3971 	call	_cpct_setPALColour
                           3972 ;src/main.c:754: cpct_setPalette(g_palette, 16);
   7BC1 21 10 00      [10] 3973 	ld	hl,#0x0010
   7BC4 E5            [11] 3974 	push	hl
   7BC5 21 60 3E      [10] 3975 	ld	hl,#_g_palette
   7BC8 E5            [11] 3976 	push	hl
   7BC9 CD EF 53      [17] 3977 	call	_cpct_setPalette
   7BCC C9            [10] 3978 	ret
                           3979 ;src/main.c:759: void inicializarJuego() {
                           3980 ;	---------------------------------
                           3981 ; Function inicializarJuego
                           3982 ; ---------------------------------
   7BCD                    3983 _inicializarJuego::
                           3984 ;src/main.c:761: num_mapa = 0;
   7BCD 21 C7 64      [10] 3985 	ld	hl,#_num_mapa + 0
   7BD0 36 00         [10] 3986 	ld	(hl), #0x00
                           3987 ;src/main.c:762: mapa = mapas[num_mapa];
   7BD2 21 E5 64      [10] 3988 	ld	hl, #_mapas + 0
   7BD5 7E            [ 7] 3989 	ld	a,(hl)
   7BD6 FD 21 C5 64   [14] 3990 	ld	iy,#_mapa
   7BDA FD 77 00      [19] 3991 	ld	0 (iy),a
   7BDD 23            [ 6] 3992 	inc	hl
   7BDE 7E            [ 7] 3993 	ld	a,(hl)
   7BDF 32 C6 64      [13] 3994 	ld	(#_mapa + 1),a
                           3995 ;src/main.c:763: cpct_etm_setTileset2x4(g_tileset);
   7BE2 21 E0 17      [10] 3996 	ld	hl,#_g_tileset
   7BE5 CD 03 56      [17] 3997 	call	_cpct_etm_setTileset2x4
                           3998 ;src/main.c:765: dibujarMapa();
   7BE8 CD CF 64      [17] 3999 	call	_dibujarMapa
                           4000 ;src/main.c:768: barraPuntuacionInicial();
   7BEB CD 40 51      [17] 4001 	call	_barraPuntuacionInicial
                           4002 ;src/main.c:771: prota.x = prota.px = 4;
   7BEE 21 EA 63      [10] 4003 	ld	hl,#(_prota + 0x0002)
   7BF1 36 04         [10] 4004 	ld	(hl),#0x04
   7BF3 21 E8 63      [10] 4005 	ld	hl,#_prota
   7BF6 36 04         [10] 4006 	ld	(hl),#0x04
                           4007 ;src/main.c:772: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7BF8 21 EB 63      [10] 4008 	ld	hl,#(_prota + 0x0003)
   7BFB 36 68         [10] 4009 	ld	(hl),#0x68
   7BFD 21 E9 63      [10] 4010 	ld	hl,#(_prota + 0x0001)
   7C00 36 68         [10] 4011 	ld	(hl),#0x68
                           4012 ;src/main.c:773: prota.mover  = NO;
   7C02 21 EE 63      [10] 4013 	ld	hl,#(_prota + 0x0006)
   7C05 36 00         [10] 4014 	ld	(hl),#0x00
                           4015 ;src/main.c:774: prota.mira=M_derecha;
   7C07 21 EF 63      [10] 4016 	ld	hl,#(_prota + 0x0007)
   7C0A 36 00         [10] 4017 	ld	(hl),#0x00
                           4018 ;src/main.c:775: prota.sprite = g_hero;
   7C0C 21 70 3E      [10] 4019 	ld	hl,#_g_hero
   7C0F 22 EC 63      [16] 4020 	ld	((_prota + 0x0004)), hl
                           4021 ;src/main.c:779: cu.x = cu.px = 0;
   7C12 21 F2 63      [10] 4022 	ld	hl,#(_cu + 0x0002)
   7C15 36 00         [10] 4023 	ld	(hl),#0x00
   7C17 21 F0 63      [10] 4024 	ld	hl,#_cu
   7C1A 36 00         [10] 4025 	ld	(hl),#0x00
                           4026 ;src/main.c:780: cu.y = cu.py = 0;
   7C1C 21 F3 63      [10] 4027 	ld	hl,#(_cu + 0x0003)
   7C1F 36 00         [10] 4028 	ld	(hl),#0x00
   7C21 21 F1 63      [10] 4029 	ld	hl,#(_cu + 0x0001)
   7C24 36 00         [10] 4030 	ld	(hl),#0x00
                           4031 ;src/main.c:781: cu.lanzado = NO;
   7C26 21 F6 63      [10] 4032 	ld	hl,#(_cu + 0x0006)
   7C29 36 00         [10] 4033 	ld	(hl),#0x00
                           4034 ;src/main.c:782: cu.mover = NO;
   7C2B 21 F9 63      [10] 4035 	ld	hl,#(_cu + 0x0009)
   7C2E 36 00         [10] 4036 	ld	(hl),#0x00
                           4037 ;src/main.c:783: cu.off_bound = NO;
   7C30 21 FA 63      [10] 4038 	ld	hl,#(_cu + 0x000a)
   7C33 36 00         [10] 4039 	ld	(hl),#0x00
                           4040 ;src/main.c:785: inicializarEnemy();
   7C35 CD 93 79      [17] 4041 	call	_inicializarEnemy
                           4042 ;src/main.c:787: dibujarProta();
   7C38 C3 1B 65      [10] 4043 	jp  _dibujarProta
                           4044 ;src/main.c:790: void main(void) {
                           4045 ;	---------------------------------
                           4046 ; Function main
                           4047 ; ---------------------------------
   7C3B                    4048 _main::
   7C3B DD E5         [15] 4049 	push	ix
   7C3D DD 21 00 00   [14] 4050 	ld	ix,#0
   7C41 DD 39         [15] 4051 	add	ix,sp
   7C43 21 FA FF      [10] 4052 	ld	hl,#-6
   7C46 39            [11] 4053 	add	hl,sp
   7C47 F9            [ 6] 4054 	ld	sp,hl
                           4055 ;src/main.c:795: inicializarCPC();
   7C48 CD B2 7B      [17] 4056 	call	_inicializarCPC
                           4057 ;src/main.c:797: menuInicio();
   7C4B CD 61 50      [17] 4058 	call	_menuInicio
                           4059 ;src/main.c:799: inicializarJuego();
   7C4E CD CD 7B      [17] 4060 	call	_inicializarJuego
                           4061 ;src/main.c:803: while (1) {
   7C51                    4062 00126$:
                           4063 ;src/main.c:806: actual = enemy;
                           4064 ;src/main.c:808: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7C51 21 00 01      [10] 4065 	ld	hl,#_g_tablatrans
   7C54 E5            [11] 4066 	push	hl
   7C55 2A C5 64      [16] 4067 	ld	hl,(_mapa)
   7C58 E5            [11] 4068 	push	hl
   7C59 21 E8 63      [10] 4069 	ld	hl,#_prota
   7C5C E5            [11] 4070 	push	hl
   7C5D 21 F0 63      [10] 4071 	ld	hl,#_cu
   7C60 E5            [11] 4072 	push	hl
   7C61 CD C9 65      [17] 4073 	call	_comprobarTeclado
   7C64 21 08 00      [10] 4074 	ld	hl,#8
   7C67 39            [11] 4075 	add	hl,sp
   7C68 F9            [ 6] 4076 	ld	sp,hl
                           4077 ;src/main.c:809: moverCuchillo(&cu, mapa);
   7C69 2A C5 64      [16] 4078 	ld	hl,(_mapa)
   7C6C E5            [11] 4079 	push	hl
   7C6D 21 F0 63      [10] 4080 	ld	hl,#_cu
   7C70 E5            [11] 4081 	push	hl
   7C71 CD 15 43      [17] 4082 	call	_moverCuchillo
   7C74 F1            [10] 4083 	pop	af
   7C75 F1            [10] 4084 	pop	af
                           4085 ;src/main.c:810: while(i){
   7C76 DD 36 FA 02   [19] 4086 	ld	-6 (ix),#0x02
   7C7A DD 36 FC 60   [19] 4087 	ld	-4 (ix),#<(_enemy)
   7C7E DD 36 FD 60   [19] 4088 	ld	-3 (ix),#>(_enemy)
   7C82                    4089 00105$:
   7C82 DD 7E FA      [19] 4090 	ld	a,-6 (ix)
   7C85 B7            [ 4] 4091 	or	a, a
   7C86 28 52         [12] 4092 	jr	Z,00107$
                           4093 ;src/main.c:812: --i;
   7C88 DD 35 FA      [23] 4094 	dec	-6 (ix)
                           4095 ;src/main.c:813: if(!actual->muerto){
   7C8B DD 7E FC      [19] 4096 	ld	a,-4 (ix)
   7C8E C6 08         [ 7] 4097 	add	a, #0x08
   7C90 DD 77 FE      [19] 4098 	ld	-2 (ix),a
   7C93 DD 7E FD      [19] 4099 	ld	a,-3 (ix)
   7C96 CE 00         [ 7] 4100 	adc	a, #0x00
   7C98 DD 77 FF      [19] 4101 	ld	-1 (ix),a
   7C9B DD 6E FE      [19] 4102 	ld	l,-2 (ix)
   7C9E DD 66 FF      [19] 4103 	ld	h,-1 (ix)
   7CA1 7E            [ 7] 4104 	ld	a,(hl)
   7CA2 B7            [ 4] 4105 	or	a, a
   7CA3 20 10         [12] 4106 	jr	NZ,00102$
                           4107 ;src/main.c:814: checkEnemyDead(cu.direccion, actual);
   7CA5 21 F7 63      [10] 4108 	ld	hl, #_cu + 7
   7CA8 46            [ 7] 4109 	ld	b,(hl)
   7CA9 D1            [10] 4110 	pop	de
   7CAA E1            [10] 4111 	pop	hl
   7CAB E5            [11] 4112 	push	hl
   7CAC D5            [11] 4113 	push	de
   7CAD E5            [11] 4114 	push	hl
   7CAE C5            [11] 4115 	push	bc
   7CAF 33            [ 6] 4116 	inc	sp
   7CB0 CD 2F 69      [17] 4117 	call	_checkEnemyDead
   7CB3 F1            [10] 4118 	pop	af
   7CB4 33            [ 6] 4119 	inc	sp
   7CB5                    4120 00102$:
                           4121 ;src/main.c:816: if(!actual->muerto){
   7CB5 DD 6E FE      [19] 4122 	ld	l,-2 (ix)
   7CB8 DD 66 FF      [19] 4123 	ld	h,-1 (ix)
   7CBB 7E            [ 7] 4124 	ld	a,(hl)
   7CBC B7            [ 4] 4125 	or	a, a
   7CBD 20 09         [12] 4126 	jr	NZ,00104$
                           4127 ;src/main.c:817: updateEnemy(actual);
   7CBF C1            [10] 4128 	pop	bc
   7CC0 E1            [10] 4129 	pop	hl
   7CC1 E5            [11] 4130 	push	hl
   7CC2 C5            [11] 4131 	push	bc
   7CC3 E5            [11] 4132 	push	hl
   7CC4 CD 37 78      [17] 4133 	call	_updateEnemy
   7CC7 F1            [10] 4134 	pop	af
   7CC8                    4135 00104$:
                           4136 ;src/main.c:819: ++actual;
   7CC8 DD 7E FC      [19] 4137 	ld	a,-4 (ix)
   7CCB C6 E2         [ 7] 4138 	add	a, #0xE2
   7CCD DD 77 FC      [19] 4139 	ld	-4 (ix),a
   7CD0 DD 7E FD      [19] 4140 	ld	a,-3 (ix)
   7CD3 CE 00         [ 7] 4141 	adc	a, #0x00
   7CD5 DD 77 FD      [19] 4142 	ld	-3 (ix),a
   7CD8 18 A8         [12] 4143 	jr	00105$
   7CDA                    4144 00107$:
                           4145 ;src/main.c:822: cpct_waitVSYNC();
   7CDA CD A7 56      [17] 4146 	call	_cpct_waitVSYNC
                           4147 ;src/main.c:825: if (prota.mover) {
   7CDD 01 EE 63      [10] 4148 	ld	bc,#_prota + 6
   7CE0 0A            [ 7] 4149 	ld	a,(bc)
   7CE1 B7            [ 4] 4150 	or	a, a
   7CE2 28 07         [12] 4151 	jr	Z,00109$
                           4152 ;src/main.c:826: redibujarProta();
   7CE4 C5            [11] 4153 	push	bc
   7CE5 CD B5 65      [17] 4154 	call	_redibujarProta
   7CE8 C1            [10] 4155 	pop	bc
                           4156 ;src/main.c:827: prota.mover = NO;
   7CE9 AF            [ 4] 4157 	xor	a, a
   7CEA 02            [ 7] 4158 	ld	(bc),a
   7CEB                    4159 00109$:
                           4160 ;src/main.c:829: if(cu.lanzado && cu.mover){
   7CEB 21 F6 63      [10] 4161 	ld	hl, #(_cu + 0x0006) + 0
   7CEE 4E            [ 7] 4162 	ld	c,(hl)
                           4163 ;src/main.c:830: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4164 ;src/main.c:829: if(cu.lanzado && cu.mover){
   7CEF 79            [ 4] 4165 	ld	a,c
   7CF0 B7            [ 4] 4166 	or	a, a
   7CF1 28 30         [12] 4167 	jr	Z,00114$
   7CF3 3A F9 63      [13] 4168 	ld	a, (#(_cu + 0x0009) + 0)
   7CF6 B7            [ 4] 4169 	or	a, a
   7CF7 28 2A         [12] 4170 	jr	Z,00114$
                           4171 ;src/main.c:830: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7CF9 21 F1 63      [10] 4172 	ld	hl, #(_cu + 0x0001) + 0
   7CFC 4E            [ 7] 4173 	ld	c,(hl)
   7CFD 21 F0 63      [10] 4174 	ld	hl, #_cu + 0
   7D00 46            [ 7] 4175 	ld	b,(hl)
   7D01 21 F8 63      [10] 4176 	ld	hl, #(_cu + 0x0008) + 0
   7D04 5E            [ 7] 4177 	ld	e,(hl)
   7D05 2A C5 64      [16] 4178 	ld	hl,(_mapa)
   7D08 E5            [11] 4179 	push	hl
   7D09 21 00 01      [10] 4180 	ld	hl,#_g_tablatrans
   7D0C E5            [11] 4181 	push	hl
   7D0D 21 F0 63      [10] 4182 	ld	hl,#_cu
   7D10 E5            [11] 4183 	push	hl
   7D11 79            [ 4] 4184 	ld	a,c
   7D12 F5            [11] 4185 	push	af
   7D13 33            [ 6] 4186 	inc	sp
   7D14 C5            [11] 4187 	push	bc
   7D15 33            [ 6] 4188 	inc	sp
   7D16 7B            [ 4] 4189 	ld	a,e
   7D17 F5            [11] 4190 	push	af
   7D18 33            [ 6] 4191 	inc	sp
   7D19 CD 25 40      [17] 4192 	call	_redibujarCuchillo
   7D1C 21 09 00      [10] 4193 	ld	hl,#9
   7D1F 39            [11] 4194 	add	hl,sp
   7D20 F9            [ 6] 4195 	ld	sp,hl
   7D21 18 28         [12] 4196 	jr	00115$
   7D23                    4197 00114$:
                           4198 ;src/main.c:831: }else if (cu.lanzado && !cu.mover){
   7D23 79            [ 4] 4199 	ld	a,c
   7D24 B7            [ 4] 4200 	or	a, a
   7D25 28 24         [12] 4201 	jr	Z,00115$
   7D27 3A F9 63      [13] 4202 	ld	a, (#(_cu + 0x0009) + 0)
   7D2A B7            [ 4] 4203 	or	a, a
   7D2B 20 1E         [12] 4204 	jr	NZ,00115$
                           4205 ;src/main.c:832: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7D2D 21 F1 63      [10] 4206 	ld	hl, #(_cu + 0x0001) + 0
   7D30 46            [ 7] 4207 	ld	b,(hl)
   7D31 21 F0 63      [10] 4208 	ld	hl, #_cu + 0
   7D34 4E            [ 7] 4209 	ld	c,(hl)
   7D35 21 F8 63      [10] 4210 	ld	hl, #(_cu + 0x0008) + 0
   7D38 56            [ 7] 4211 	ld	d,(hl)
   7D39 2A C5 64      [16] 4212 	ld	hl,(_mapa)
   7D3C E5            [11] 4213 	push	hl
   7D3D C5            [11] 4214 	push	bc
   7D3E D5            [11] 4215 	push	de
   7D3F 33            [ 6] 4216 	inc	sp
   7D40 CD 92 3F      [17] 4217 	call	_borrarCuchillo
   7D43 F1            [10] 4218 	pop	af
   7D44 F1            [10] 4219 	pop	af
   7D45 33            [ 6] 4220 	inc	sp
                           4221 ;src/main.c:833: cu.lanzado = NO;
   7D46 21 F6 63      [10] 4222 	ld	hl,#(_cu + 0x0006)
   7D49 36 00         [10] 4223 	ld	(hl),#0x00
   7D4B                    4224 00115$:
                           4225 ;src/main.c:837: actual = enemy;
   7D4B 01 60 60      [10] 4226 	ld	bc,#_enemy
                           4227 ;src/main.c:838: while(i){
   7D4E DD 36 FA 02   [19] 4228 	ld	-6 (ix),#0x02
   7D52                    4229 00122$:
   7D52 DD 7E FA      [19] 4230 	ld	a,-6 (ix)
   7D55 B7            [ 4] 4231 	or	a, a
   7D56 CA 12 7E      [10] 4232 	jp	Z,00124$
                           4233 ;src/main.c:840: --i;
   7D59 DD 35 FA      [23] 4234 	dec	-6 (ix)
                           4235 ;src/main.c:841: if(actual->mover){
   7D5C 21 06 00      [10] 4236 	ld	hl,#0x0006
   7D5F 09            [11] 4237 	add	hl,bc
   7D60 DD 75 FE      [19] 4238 	ld	-2 (ix),l
   7D63 DD 74 FF      [19] 4239 	ld	-1 (ix),h
   7D66 DD 6E FE      [19] 4240 	ld	l,-2 (ix)
   7D69 DD 66 FF      [19] 4241 	ld	h,-1 (ix)
   7D6C 7E            [ 7] 4242 	ld	a,(hl)
   7D6D B7            [ 4] 4243 	or	a, a
   7D6E 28 18         [12] 4244 	jr	Z,00118$
                           4245 ;src/main.c:842: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7D70 69            [ 4] 4246 	ld	l, c
   7D71 60            [ 4] 4247 	ld	h, b
   7D72 23            [ 6] 4248 	inc	hl
   7D73 23            [ 6] 4249 	inc	hl
   7D74 23            [ 6] 4250 	inc	hl
   7D75 5E            [ 7] 4251 	ld	e,(hl)
   7D76 69            [ 4] 4252 	ld	l, c
   7D77 60            [ 4] 4253 	ld	h, b
   7D78 23            [ 6] 4254 	inc	hl
   7D79 23            [ 6] 4255 	inc	hl
   7D7A 56            [ 7] 4256 	ld	d,(hl)
   7D7B C5            [11] 4257 	push	bc
   7D7C C5            [11] 4258 	push	bc
   7D7D 7B            [ 4] 4259 	ld	a,e
   7D7E F5            [11] 4260 	push	af
   7D7F 33            [ 6] 4261 	inc	sp
   7D80 D5            [11] 4262 	push	de
   7D81 33            [ 6] 4263 	inc	sp
   7D82 CD FE 68      [17] 4264 	call	_redibujarEnemigo
   7D85 F1            [10] 4265 	pop	af
   7D86 F1            [10] 4266 	pop	af
   7D87 C1            [10] 4267 	pop	bc
   7D88                    4268 00118$:
                           4269 ;src/main.c:844: if (actual->muerto && actual->muertes == 0){
   7D88 C5            [11] 4270 	push	bc
   7D89 FD E1         [14] 4271 	pop	iy
   7D8B FD 7E 08      [19] 4272 	ld	a,8 (iy)
   7D8E B7            [ 4] 4273 	or	a, a
   7D8F 28 78         [12] 4274 	jr	Z,00120$
   7D91 21 0A 00      [10] 4275 	ld	hl,#0x000A
   7D94 09            [11] 4276 	add	hl,bc
   7D95 EB            [ 4] 4277 	ex	de,hl
   7D96 1A            [ 7] 4278 	ld	a,(de)
   7D97 B7            [ 4] 4279 	or	a, a
   7D98 20 6F         [12] 4280 	jr	NZ,00120$
                           4281 ;src/main.c:845: borrarEnemigo((*actual).x, (*actual).y);
   7D9A 21 01 00      [10] 4282 	ld	hl,#0x0001
   7D9D 09            [11] 4283 	add	hl,bc
   7D9E DD 75 FC      [19] 4284 	ld	-4 (ix),l
   7DA1 DD 74 FD      [19] 4285 	ld	-3 (ix),h
   7DA4 DD 6E FC      [19] 4286 	ld	l,-4 (ix)
   7DA7 DD 66 FD      [19] 4287 	ld	h,-3 (ix)
   7DAA 7E            [ 7] 4288 	ld	a,(hl)
   7DAB F5            [11] 4289 	push	af
   7DAC 0A            [ 7] 4290 	ld	a,(bc)
   7DAD DD 77 FB      [19] 4291 	ld	-5 (ix),a
   7DB0 F1            [10] 4292 	pop	af
   7DB1 C5            [11] 4293 	push	bc
   7DB2 D5            [11] 4294 	push	de
   7DB3 F5            [11] 4295 	push	af
   7DB4 33            [ 6] 4296 	inc	sp
   7DB5 DD 7E FB      [19] 4297 	ld	a,-5 (ix)
   7DB8 F5            [11] 4298 	push	af
   7DB9 33            [ 6] 4299 	inc	sp
   7DBA CD 89 68      [17] 4300 	call	_borrarEnemigo
   7DBD F1            [10] 4301 	pop	af
   7DBE D1            [10] 4302 	pop	de
   7DBF C1            [10] 4303 	pop	bc
                           4304 ;src/main.c:846: dibujarExplosion(actual);
   7DC0 C5            [11] 4305 	push	bc
   7DC1 D5            [11] 4306 	push	de
   7DC2 C5            [11] 4307 	push	bc
   7DC3 CD D9 67      [17] 4308 	call	_dibujarExplosion
   7DC6 F1            [10] 4309 	pop	af
   7DC7 D1            [10] 4310 	pop	de
   7DC8 C1            [10] 4311 	pop	bc
                           4312 ;src/main.c:847: puntuacion_aux = puntuacion;
   7DC9 FD 21 C8 64   [14] 4313 	ld	iy,#_puntuacion
   7DCD FD 6E 00      [19] 4314 	ld	l,0 (iy)
   7DD0 26 00         [ 7] 4315 	ld	h,#0x00
                           4316 ;src/main.c:848: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7DD2 C5            [11] 4317 	push	bc
   7DD3 D5            [11] 4318 	push	de
   7DD4 E5            [11] 4319 	push	hl
   7DD5 CD 19 53      [17] 4320 	call	_aumentarPuntuacion
   7DD8 F1            [10] 4321 	pop	af
   7DD9 D1            [10] 4322 	pop	de
   7DDA C1            [10] 4323 	pop	bc
   7DDB FD 21 C8 64   [14] 4324 	ld	iy,#_puntuacion
   7DDF FD 75 00      [19] 4325 	ld	0 (iy),l
                           4326 ;src/main.c:849: modificarPuntuacion(puntuacion);
   7DE2 FD 21 C8 64   [14] 4327 	ld	iy,#_puntuacion
   7DE6 FD 6E 00      [19] 4328 	ld	l,0 (iy)
   7DE9 26 00         [ 7] 4329 	ld	h,#0x00
   7DEB C5            [11] 4330 	push	bc
   7DEC D5            [11] 4331 	push	de
   7DED E5            [11] 4332 	push	hl
   7DEE CD DC 51      [17] 4333 	call	_modificarPuntuacion
   7DF1 F1            [10] 4334 	pop	af
   7DF2 D1            [10] 4335 	pop	de
   7DF3 C1            [10] 4336 	pop	bc
                           4337 ;src/main.c:850: actual->mover = NO;
   7DF4 DD 6E FE      [19] 4338 	ld	l,-2 (ix)
   7DF7 DD 66 FF      [19] 4339 	ld	h,-1 (ix)
   7DFA 36 00         [10] 4340 	ld	(hl),#0x00
                           4341 ;src/main.c:851: actual->muertes++;
   7DFC 1A            [ 7] 4342 	ld	a,(de)
   7DFD 3C            [ 4] 4343 	inc	a
   7DFE 12            [ 7] 4344 	ld	(de),a
                           4345 ;src/main.c:852: actual->x = 0;
   7DFF AF            [ 4] 4346 	xor	a, a
   7E00 02            [ 7] 4347 	ld	(bc),a
                           4348 ;src/main.c:853: actual->y = 0;
   7E01 DD 6E FC      [19] 4349 	ld	l,-4 (ix)
   7E04 DD 66 FD      [19] 4350 	ld	h,-3 (ix)
   7E07 36 00         [10] 4351 	ld	(hl),#0x00
   7E09                    4352 00120$:
                           4353 ;src/main.c:855: ++actual;
   7E09 21 E2 00      [10] 4354 	ld	hl,#0x00E2
   7E0C 09            [11] 4355 	add	hl,bc
   7E0D 4D            [ 4] 4356 	ld	c,l
   7E0E 44            [ 4] 4357 	ld	b,h
   7E0F C3 52 7D      [10] 4358 	jp	00122$
   7E12                    4359 00124$:
                           4360 ;src/main.c:857: cpct_waitVSYNC();
   7E12 CD A7 56      [17] 4361 	call	_cpct_waitVSYNC
   7E15 C3 51 7C      [10] 4362 	jp	00126$
                           4363 	.area _CODE
                           4364 	.area _INITIALIZER
   64CA                    4365 __xinit__mapa:
   64CA 00 00              4366 	.dw #0x0000
   64CC                    4367 __xinit__num_mapa:
   64CC 00                 4368 	.db #0x00	; 0
   64CD                    4369 __xinit__puntuacion:
   64CD 00                 4370 	.db #0x00	; 0
   64CE                    4371 __xinit__vidas:
   64CE 05                 4372 	.db #0x05	; 5
                           4373 	.area _CABS (ABS)
