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
                             30 	.globl _checkEnemyCollision
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
                             50 	.globl _barraPuntuacionInicial
                             51 	.globl _menuInicio
                             52 	.globl _menuFin
                             53 	.globl _cpct_etm_setTileset2x4
                             54 	.globl _cpct_etm_drawTileBox2x4
                             55 	.globl _cpct_getScreenPtr
                             56 	.globl _cpct_setPALColour
                             57 	.globl _cpct_setPalette
                             58 	.globl _cpct_waitVSYNC
                             59 	.globl _cpct_setVideoMode
                             60 	.globl _cpct_drawSpriteMaskedAlignedTable
                             61 	.globl _cpct_isAnyKeyPressed
                             62 	.globl _cpct_isKeyPressed
                             63 	.globl _cpct_scanKeyboard_if
                             64 	.globl _cpct_disableFirmware
                             65 	.globl _vidas
                             66 	.globl _puntuacion
                             67 	.globl _num_mapa
                             68 	.globl _mapa
                             69 	.globl _i
                             70 	.globl _cu
                             71 	.globl _prota
                             72 	.globl _enemy
                             73 	.globl _patrolY
                             74 	.globl _patrolX
                             75 	.globl _spawnY
                             76 	.globl _spawnX
                             77 	.globl _mapas
                             78 ;--------------------------------------------------------
                             79 ; special function registers
                             80 ;--------------------------------------------------------
                             81 ;--------------------------------------------------------
                             82 ; ram data
                             83 ;--------------------------------------------------------
                             84 	.area _DATA
   5F70                      85 _enemy::
   5F70                      86 	.ds 904
   62F8                      87 _prota::
   62F8                      88 	.ds 8
   6300                      89 _cu::
   6300                      90 	.ds 11
   630B                      91 _i::
   630B                      92 	.ds 1
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   63D5                      97 _mapa::
   63D5                      98 	.ds 2
   63D7                      99 _num_mapa::
   63D7                     100 	.ds 1
   63D8                     101 _puntuacion::
   63D8                     102 	.ds 1
   63D9                     103 _vidas::
   63D9                     104 	.ds 1
                            105 ;--------------------------------------------------------
                            106 ; absolute external ram data
                            107 ;--------------------------------------------------------
                            108 	.area _DABS (ABS)
                            109 ;--------------------------------------------------------
                            110 ; global & static initialisations
                            111 ;--------------------------------------------------------
                            112 	.area _HOME
                            113 	.area _GSINIT
                            114 	.area _GSFINAL
                            115 	.area _GSINIT
                            116 ;--------------------------------------------------------
                            117 ; Home
                            118 ;--------------------------------------------------------
                            119 	.area _HOME
                            120 	.area _HOME
                            121 ;--------------------------------------------------------
                            122 ; code
                            123 ;--------------------------------------------------------
                            124 	.area _CODE
                            125 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            126 ;	---------------------------------
                            127 ; Function dummy_cpct_transparentMaskTable0M0_container
                            128 ; ---------------------------------
   3F0A                     129 _dummy_cpct_transparentMaskTable0M0_container::
                            130 	.area _g_tablatrans_ (ABS) 
   0100                     131 	.org 0x0100 
   0100                     132 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   133 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   138 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   141 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            165 	.area _CSEG (REL, CON) 
                            166 ;src/main.c:112: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   63DF                     170 _dibujarMapa::
                            171 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   63DF 2A D5 63      [16]  172 	ld	hl,(_mapa)
   63E2 E5            [11]  173 	push	hl
   63E3 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   63E6 E5            [11]  175 	push	hl
   63E7 21 2C 28      [10]  176 	ld	hl,#0x282C
   63EA E5            [11]  177 	push	hl
   63EB 2E 00         [ 7]  178 	ld	l, #0x00
   63ED E5            [11]  179 	push	hl
   63EE AF            [ 4]  180 	xor	a, a
   63EF F5            [11]  181 	push	af
   63F0 33            [ 6]  182 	inc	sp
   63F1 CD F7 53      [17]  183 	call	_cpct_etm_drawTileBox2x4
   63F4 C9            [10]  184 	ret
   63F5                     185 _mapas:
   63F5 C0 10               186 	.dw _g_map1
   63F7 E0 09               187 	.dw _g_map2
   63F9 00 03               188 	.dw _g_map3
   63FB                     189 _spawnX:
   63FB 24                  190 	.db #0x24	; 36
   63FC 47                  191 	.db #0x47	; 71	'G'
   63FD 30                  192 	.db #0x30	; 48	'0'
   63FE 18                  193 	.db #0x18	; 24
   63FF                     194 _spawnY:
   63FF 2C                  195 	.db #0x2C	; 44
   6400 66                  196 	.db #0x66	; 102	'f'
   6401 9A                  197 	.db #0x9A	; 154
   6402 40                  198 	.db #0x40	; 64
   6403                     199 _patrolX:
   6403 00                  200 	.db #0x00	; 0
   6404 00                  201 	.db #0x00	; 0
   6405 00                  202 	.db #0x00	; 0
   6406 00                  203 	.db #0x00	; 0
   6407 00                  204 	.db #0x00	; 0
   6408 42                  205 	.db #0x42	; 66	'B'
   6409 33                  206 	.db #0x33	; 51	'3'
   640A 00                  207 	.db #0x00	; 0
   640B 00                  208 	.db #0x00	; 0
   640C 00                  209 	.db 0x00
   640D 34                  210 	.db #0x34	; 52	'4'
   640E 33                  211 	.db #0x33	; 51	'3'
   640F 14                  212 	.db #0x14	; 20
   6410 00                  213 	.db #0x00	; 0
   6411 00                  214 	.db 0x00
   6412 38                  215 	.db #0x38	; 56	'8'
   6413 3C                  216 	.db #0x3C	; 60
   6414 23                  217 	.db #0x23	; 35
   6415 18                  218 	.db #0x18	; 24
   6416 00                  219 	.db 0x00
   6417                     220 _patrolY:
   6417 00                  221 	.db #0x00	; 0
   6418 00                  222 	.db #0x00	; 0
   6419 00                  223 	.db #0x00	; 0
   641A 00                  224 	.db #0x00	; 0
   641B 00                  225 	.db 0x00
   641C 5E                  226 	.db #0x5E	; 94
   641D A6                  227 	.db #0xA6	; 166
   641E 00                  228 	.db #0x00	; 0
   641F 00                  229 	.db #0x00	; 0
   6420 00                  230 	.db 0x00
   6421 A0                  231 	.db #0xA0	; 160
   6422 66                  232 	.db #0x66	; 102	'f'
   6423 2C                  233 	.db #0x2C	; 44
   6424 00                  234 	.db #0x00	; 0
   6425 00                  235 	.db 0x00
   6426 AE                  236 	.db #0xAE	; 174
   6427 66                  237 	.db #0x66	; 102	'f'
   6428 22                  238 	.db #0x22	; 34
   6429 86                  239 	.db #0x86	; 134
   642A 00                  240 	.db 0x00
                            241 ;src/main.c:118: void dibujarProta() {
                            242 ;	---------------------------------
                            243 ; Function dibujarProta
                            244 ; ---------------------------------
   642B                     245 _dibujarProta::
                            246 ;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   642B 21 F9 62      [10]  247 	ld	hl, #_prota + 1
   642E 56            [ 7]  248 	ld	d,(hl)
   642F 21 F8 62      [10]  249 	ld	hl, #_prota + 0
   6432 46            [ 7]  250 	ld	b,(hl)
   6433 D5            [11]  251 	push	de
   6434 33            [ 6]  252 	inc	sp
   6435 C5            [11]  253 	push	bc
   6436 33            [ 6]  254 	inc	sp
   6437 21 00 C0      [10]  255 	ld	hl,#0xC000
   643A E5            [11]  256 	push	hl
   643B CD 15 5F      [17]  257 	call	_cpct_getScreenPtr
   643E EB            [ 4]  258 	ex	de,hl
                            259 ;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   643F ED 4B FC 62   [20]  260 	ld	bc, (#_prota + 4)
   6443 21 00 01      [10]  261 	ld	hl,#_g_tablatrans
   6446 E5            [11]  262 	push	hl
   6447 21 07 16      [10]  263 	ld	hl,#0x1607
   644A E5            [11]  264 	push	hl
   644B D5            [11]  265 	push	de
   644C C5            [11]  266 	push	bc
   644D CD 35 5F      [17]  267 	call	_cpct_drawSpriteMaskedAlignedTable
   6450 C9            [10]  268 	ret
                            269 ;src/main.c:123: void borrarProta() {
                            270 ;	---------------------------------
                            271 ; Function borrarProta
                            272 ; ---------------------------------
   6451                     273 _borrarProta::
   6451 DD E5         [15]  274 	push	ix
   6453 DD 21 00 00   [14]  275 	ld	ix,#0
   6457 DD 39         [15]  276 	add	ix,sp
   6459 F5            [11]  277 	push	af
   645A 3B            [ 6]  278 	dec	sp
                            279 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   645B 21 FA 62      [10]  280 	ld	hl, #_prota + 2
   645E 4E            [ 7]  281 	ld	c,(hl)
   645F 79            [ 4]  282 	ld	a,c
   6460 E6 01         [ 7]  283 	and	a, #0x01
   6462 47            [ 4]  284 	ld	b,a
   6463 04            [ 4]  285 	inc	b
   6464 04            [ 4]  286 	inc	b
   6465 04            [ 4]  287 	inc	b
   6466 04            [ 4]  288 	inc	b
                            289 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6467 21 FB 62      [10]  290 	ld	hl, #_prota + 3
   646A 5E            [ 7]  291 	ld	e,(hl)
   646B CB 4B         [ 8]  292 	bit	1, e
   646D 28 04         [12]  293 	jr	Z,00103$
   646F 3E 01         [ 7]  294 	ld	a,#0x01
   6471 18 02         [12]  295 	jr	00104$
   6473                     296 00103$:
   6473 3E 00         [ 7]  297 	ld	a,#0x00
   6475                     298 00104$:
   6475 C6 06         [ 7]  299 	add	a, #0x06
   6477 DD 77 FD      [19]  300 	ld	-3 (ix),a
                            301 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   647A FD 2A D5 63   [20]  302 	ld	iy,(_mapa)
   647E 16 00         [ 7]  303 	ld	d,#0x00
   6480 7B            [ 4]  304 	ld	a,e
   6481 C6 E8         [ 7]  305 	add	a,#0xE8
   6483 DD 77 FE      [19]  306 	ld	-2 (ix),a
   6486 7A            [ 4]  307 	ld	a,d
   6487 CE FF         [ 7]  308 	adc	a,#0xFF
   6489 DD 77 FF      [19]  309 	ld	-1 (ix),a
   648C DD 6E FE      [19]  310 	ld	l,-2 (ix)
   648F DD 66 FF      [19]  311 	ld	h,-1 (ix)
   6492 DD CB FF 7E   [20]  312 	bit	7, -1 (ix)
   6496 28 04         [12]  313 	jr	Z,00105$
   6498 21 EB FF      [10]  314 	ld	hl,#0xFFEB
   649B 19            [11]  315 	add	hl,de
   649C                     316 00105$:
   649C CB 2C         [ 8]  317 	sra	h
   649E CB 1D         [ 8]  318 	rr	l
   64A0 CB 2C         [ 8]  319 	sra	h
   64A2 CB 1D         [ 8]  320 	rr	l
   64A4 55            [ 4]  321 	ld	d,l
   64A5 CB 39         [ 8]  322 	srl	c
   64A7 FD E5         [15]  323 	push	iy
   64A9 21 F0 C0      [10]  324 	ld	hl,#0xC0F0
   64AC E5            [11]  325 	push	hl
   64AD 3E 28         [ 7]  326 	ld	a,#0x28
   64AF F5            [11]  327 	push	af
   64B0 33            [ 6]  328 	inc	sp
   64B1 DD 7E FD      [19]  329 	ld	a,-3 (ix)
   64B4 F5            [11]  330 	push	af
   64B5 33            [ 6]  331 	inc	sp
   64B6 C5            [11]  332 	push	bc
   64B7 33            [ 6]  333 	inc	sp
   64B8 D5            [11]  334 	push	de
   64B9 33            [ 6]  335 	inc	sp
   64BA 79            [ 4]  336 	ld	a,c
   64BB F5            [11]  337 	push	af
   64BC 33            [ 6]  338 	inc	sp
   64BD CD F7 53      [17]  339 	call	_cpct_etm_drawTileBox2x4
   64C0 DD F9         [10]  340 	ld	sp, ix
   64C2 DD E1         [14]  341 	pop	ix
   64C4 C9            [10]  342 	ret
                            343 ;src/main.c:135: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   64C5                     347 _redibujarProta::
                            348 ;src/main.c:136: borrarProta();
   64C5 CD 51 64      [17]  349 	call	_borrarProta
                            350 ;src/main.c:137: prota.px = prota.x;
   64C8 01 FA 62      [10]  351 	ld	bc,#_prota + 2
   64CB 3A F8 62      [13]  352 	ld	a, (#_prota + 0)
   64CE 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:138: prota.py = prota.y;
   64CF 01 FB 62      [10]  355 	ld	bc,#_prota + 3
   64D2 3A F9 62      [13]  356 	ld	a, (#_prota + 1)
   64D5 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:139: dibujarProta();
   64D6 C3 2B 64      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:142: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            361 ;	---------------------------------
                            362 ; Function comprobarTeclado
                            363 ; ---------------------------------
   64D9                     364 _comprobarTeclado::
                            365 ;src/main.c:143: cpct_scanKeyboard_if();
   64D9 CD 4F 55      [17]  366 	call	_cpct_scanKeyboard_if
                            367 ;src/main.c:145: if (cpct_isAnyKeyPressed()) {
   64DC CD 42 55      [17]  368 	call	_cpct_isAnyKeyPressed
   64DF 7D            [ 4]  369 	ld	a,l
   64E0 B7            [ 4]  370 	or	a, a
   64E1 C8            [11]  371 	ret	Z
                            372 ;src/main.c:146: if (cpct_isKeyPressed(Key_CursorLeft)){
   64E2 21 01 01      [10]  373 	ld	hl,#0x0101
   64E5 CD 16 53      [17]  374 	call	_cpct_isKeyPressed
   64E8 7D            [ 4]  375 	ld	a,l
   64E9 B7            [ 4]  376 	or	a, a
                            377 ;src/main.c:147: moverIzquierda();
   64EA C2 FE 7B      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64ED 21 00 02      [10]  380 	ld	hl,#0x0200
   64F0 CD 16 53      [17]  381 	call	_cpct_isKeyPressed
   64F3 7D            [ 4]  382 	ld	a,l
   64F4 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:149: moverDerecha();
   64F5 C2 23 7C      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64F8 21 00 01      [10]  387 	ld	hl,#0x0100
   64FB CD 16 53      [17]  388 	call	_cpct_isKeyPressed
   64FE 7D            [ 4]  389 	ld	a,l
   64FF B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:151: moverArriba();
   6500 C2 68 7C      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6503 21 00 04      [10]  394 	ld	hl,#0x0400
   6506 CD 16 53      [17]  395 	call	_cpct_isKeyPressed
   6509 7D            [ 4]  396 	ld	a,l
   650A B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:153: moverAbajo();
   650B C2 8C 7C      [10]  399 	jp	NZ,_moverAbajo
                            400 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_Space)){
   650E 21 05 80      [10]  401 	ld	hl,#0x8005
   6511 CD 16 53      [17]  402 	call	_cpct_isKeyPressed
   6514 7D            [ 4]  403 	ld	a,l
   6515 B7            [ 4]  404 	or	a, a
   6516 C8            [11]  405 	ret	Z
                            406 ;src/main.c:155: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6517 21 08 00      [10]  407 	ld	hl, #8
   651A 39            [11]  408 	add	hl, sp
   651B 4E            [ 7]  409 	ld	c, (hl)
   651C 23            [ 6]  410 	inc	hl
   651D 46            [ 7]  411 	ld	b, (hl)
   651E C5            [11]  412 	push	bc
   651F 21 08 00      [10]  413 	ld	hl, #8
   6522 39            [11]  414 	add	hl, sp
   6523 4E            [ 7]  415 	ld	c, (hl)
   6524 23            [ 6]  416 	inc	hl
   6525 46            [ 7]  417 	ld	b, (hl)
   6526 C5            [11]  418 	push	bc
   6527 21 08 00      [10]  419 	ld	hl, #8
   652A 39            [11]  420 	add	hl, sp
   652B 4E            [ 7]  421 	ld	c, (hl)
   652C 23            [ 6]  422 	inc	hl
   652D 46            [ 7]  423 	ld	b, (hl)
   652E C5            [11]  424 	push	bc
   652F 21 08 00      [10]  425 	ld	hl, #8
   6532 39            [11]  426 	add	hl, sp
   6533 4E            [ 7]  427 	ld	c, (hl)
   6534 23            [ 6]  428 	inc	hl
   6535 46            [ 7]  429 	ld	b, (hl)
   6536 C5            [11]  430 	push	bc
   6537 CD 4C 46      [17]  431 	call	_lanzarCuchillo
   653A 21 08 00      [10]  432 	ld	hl,#8
   653D 39            [11]  433 	add	hl,sp
   653E F9            [ 6]  434 	ld	sp,hl
   653F C9            [10]  435 	ret
                            436 ;src/main.c:160: u8 checkCollision(u8 direction) { // check optimization
                            437 ;	---------------------------------
                            438 ; Function checkCollision
                            439 ; ---------------------------------
   6540                     440 _checkCollision::
   6540 DD E5         [15]  441 	push	ix
   6542 DD 21 00 00   [14]  442 	ld	ix,#0
   6546 DD 39         [15]  443 	add	ix,sp
   6548 F5            [11]  444 	push	af
                            445 ;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6549 21 00 00      [10]  446 	ld	hl,#0x0000
   654C E3            [19]  447 	ex	(sp), hl
   654D 11 00 00      [10]  448 	ld	de,#0x0000
   6550 01 00 00      [10]  449 	ld	bc,#0x0000
                            450 ;src/main.c:163: switch (direction) {
   6553 3E 03         [ 7]  451 	ld	a,#0x03
   6555 DD 96 04      [19]  452 	sub	a, 4 (ix)
   6558 DA 90 66      [10]  453 	jp	C,00105$
   655B DD 5E 04      [19]  454 	ld	e,4 (ix)
   655E 16 00         [ 7]  455 	ld	d,#0x00
   6560 21 67 65      [10]  456 	ld	hl,#00124$
   6563 19            [11]  457 	add	hl,de
   6564 19            [11]  458 	add	hl,de
   6565 19            [11]  459 	add	hl,de
   6566 E9            [ 4]  460 	jp	(hl)
   6567                     461 00124$:
   6567 C3 73 65      [10]  462 	jp	00101$
   656A C3 C8 65      [10]  463 	jp	00102$
   656D C3 18 66      [10]  464 	jp	00103$
   6570 C3 55 66      [10]  465 	jp	00104$
                            466 ;src/main.c:164: case 0:
   6573                     467 00101$:
                            468 ;src/main.c:165: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   6573 21 F9 62      [10]  469 	ld	hl, #(_prota + 0x0001) + 0
   6576 4E            [ 7]  470 	ld	c,(hl)
   6577 3A F8 62      [13]  471 	ld	a, (#_prota + 0)
   657A C6 07         [ 7]  472 	add	a, #0x07
   657C 47            [ 4]  473 	ld	b,a
   657D 79            [ 4]  474 	ld	a,c
   657E F5            [11]  475 	push	af
   657F 33            [ 6]  476 	inc	sp
   6580 C5            [11]  477 	push	bc
   6581 33            [ 6]  478 	inc	sp
   6582 2A D5 63      [16]  479 	ld	hl,(_mapa)
   6585 E5            [11]  480 	push	hl
   6586 CD 2C 4A      [17]  481 	call	_getTilePtr
   6589 F1            [10]  482 	pop	af
   658A F1            [10]  483 	pop	af
   658B 33            [ 6]  484 	inc	sp
   658C 33            [ 6]  485 	inc	sp
   658D E5            [11]  486 	push	hl
                            487 ;src/main.c:166: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   658E 3A F9 62      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   6591 C6 14         [ 7]  489 	add	a, #0x14
   6593 4F            [ 4]  490 	ld	c,a
   6594 3A F8 62      [13]  491 	ld	a, (#_prota + 0)
   6597 C6 07         [ 7]  492 	add	a, #0x07
   6599 47            [ 4]  493 	ld	b,a
   659A 79            [ 4]  494 	ld	a,c
   659B F5            [11]  495 	push	af
   659C 33            [ 6]  496 	inc	sp
   659D C5            [11]  497 	push	bc
   659E 33            [ 6]  498 	inc	sp
   659F 2A D5 63      [16]  499 	ld	hl,(_mapa)
   65A2 E5            [11]  500 	push	hl
   65A3 CD 2C 4A      [17]  501 	call	_getTilePtr
   65A6 F1            [10]  502 	pop	af
   65A7 F1            [10]  503 	pop	af
   65A8 EB            [ 4]  504 	ex	de,hl
                            505 ;src/main.c:167: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   65A9 3A F9 62      [13]  506 	ld	a, (#(_prota + 0x0001) + 0)
   65AC C6 0B         [ 7]  507 	add	a, #0x0B
   65AE 47            [ 4]  508 	ld	b,a
   65AF 3A F8 62      [13]  509 	ld	a, (#_prota + 0)
   65B2 C6 07         [ 7]  510 	add	a, #0x07
   65B4 D5            [11]  511 	push	de
   65B5 C5            [11]  512 	push	bc
   65B6 33            [ 6]  513 	inc	sp
   65B7 F5            [11]  514 	push	af
   65B8 33            [ 6]  515 	inc	sp
   65B9 2A D5 63      [16]  516 	ld	hl,(_mapa)
   65BC E5            [11]  517 	push	hl
   65BD CD 2C 4A      [17]  518 	call	_getTilePtr
   65C0 F1            [10]  519 	pop	af
   65C1 F1            [10]  520 	pop	af
   65C2 4D            [ 4]  521 	ld	c,l
   65C3 44            [ 4]  522 	ld	b,h
   65C4 D1            [10]  523 	pop	de
                            524 ;src/main.c:168: break;
   65C5 C3 90 66      [10]  525 	jp	00105$
                            526 ;src/main.c:169: case 1:
   65C8                     527 00102$:
                            528 ;src/main.c:170: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   65C8 21 F9 62      [10]  529 	ld	hl, #(_prota + 0x0001) + 0
   65CB 56            [ 7]  530 	ld	d,(hl)
   65CC 21 F8 62      [10]  531 	ld	hl, #_prota + 0
   65CF 46            [ 7]  532 	ld	b,(hl)
   65D0 05            [ 4]  533 	dec	b
   65D1 D5            [11]  534 	push	de
   65D2 33            [ 6]  535 	inc	sp
   65D3 C5            [11]  536 	push	bc
   65D4 33            [ 6]  537 	inc	sp
   65D5 2A D5 63      [16]  538 	ld	hl,(_mapa)
   65D8 E5            [11]  539 	push	hl
   65D9 CD 2C 4A      [17]  540 	call	_getTilePtr
   65DC F1            [10]  541 	pop	af
   65DD F1            [10]  542 	pop	af
   65DE 33            [ 6]  543 	inc	sp
   65DF 33            [ 6]  544 	inc	sp
   65E0 E5            [11]  545 	push	hl
                            546 ;src/main.c:171: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   65E1 3A F9 62      [13]  547 	ld	a, (#(_prota + 0x0001) + 0)
   65E4 C6 14         [ 7]  548 	add	a, #0x14
   65E6 57            [ 4]  549 	ld	d,a
   65E7 21 F8 62      [10]  550 	ld	hl, #_prota + 0
   65EA 46            [ 7]  551 	ld	b,(hl)
   65EB 05            [ 4]  552 	dec	b
   65EC D5            [11]  553 	push	de
   65ED 33            [ 6]  554 	inc	sp
   65EE C5            [11]  555 	push	bc
   65EF 33            [ 6]  556 	inc	sp
   65F0 2A D5 63      [16]  557 	ld	hl,(_mapa)
   65F3 E5            [11]  558 	push	hl
   65F4 CD 2C 4A      [17]  559 	call	_getTilePtr
   65F7 F1            [10]  560 	pop	af
   65F8 F1            [10]  561 	pop	af
   65F9 EB            [ 4]  562 	ex	de,hl
                            563 ;src/main.c:172: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   65FA 3A F9 62      [13]  564 	ld	a, (#(_prota + 0x0001) + 0)
   65FD C6 0B         [ 7]  565 	add	a, #0x0B
   65FF 47            [ 4]  566 	ld	b,a
   6600 3A F8 62      [13]  567 	ld	a, (#_prota + 0)
   6603 C6 FF         [ 7]  568 	add	a,#0xFF
   6605 D5            [11]  569 	push	de
   6606 C5            [11]  570 	push	bc
   6607 33            [ 6]  571 	inc	sp
   6608 F5            [11]  572 	push	af
   6609 33            [ 6]  573 	inc	sp
   660A 2A D5 63      [16]  574 	ld	hl,(_mapa)
   660D E5            [11]  575 	push	hl
   660E CD 2C 4A      [17]  576 	call	_getTilePtr
   6611 F1            [10]  577 	pop	af
   6612 F1            [10]  578 	pop	af
   6613 4D            [ 4]  579 	ld	c,l
   6614 44            [ 4]  580 	ld	b,h
   6615 D1            [10]  581 	pop	de
                            582 ;src/main.c:173: break;
   6616 18 78         [12]  583 	jr	00105$
                            584 ;src/main.c:174: case 2:
   6618                     585 00103$:
                            586 ;src/main.c:175: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6618 3A F9 62      [13]  587 	ld	a, (#(_prota + 0x0001) + 0)
   661B C6 FE         [ 7]  588 	add	a,#0xFE
   661D 21 F8 62      [10]  589 	ld	hl, #_prota + 0
   6620 56            [ 7]  590 	ld	d,(hl)
   6621 C5            [11]  591 	push	bc
   6622 F5            [11]  592 	push	af
   6623 33            [ 6]  593 	inc	sp
   6624 D5            [11]  594 	push	de
   6625 33            [ 6]  595 	inc	sp
   6626 2A D5 63      [16]  596 	ld	hl,(_mapa)
   6629 E5            [11]  597 	push	hl
   662A CD 2C 4A      [17]  598 	call	_getTilePtr
   662D F1            [10]  599 	pop	af
   662E F1            [10]  600 	pop	af
   662F C1            [10]  601 	pop	bc
   6630 33            [ 6]  602 	inc	sp
   6631 33            [ 6]  603 	inc	sp
   6632 E5            [11]  604 	push	hl
                            605 ;src/main.c:176: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6633 21 F9 62      [10]  606 	ld	hl, #(_prota + 0x0001) + 0
   6636 56            [ 7]  607 	ld	d,(hl)
   6637 15            [ 4]  608 	dec	d
   6638 15            [ 4]  609 	dec	d
   6639 3A F8 62      [13]  610 	ld	a, (#_prota + 0)
   663C C6 03         [ 7]  611 	add	a, #0x03
   663E C5            [11]  612 	push	bc
   663F D5            [11]  613 	push	de
   6640 33            [ 6]  614 	inc	sp
   6641 F5            [11]  615 	push	af
   6642 33            [ 6]  616 	inc	sp
   6643 2A D5 63      [16]  617 	ld	hl,(_mapa)
   6646 E5            [11]  618 	push	hl
   6647 CD 2C 4A      [17]  619 	call	_getTilePtr
   664A F1            [10]  620 	pop	af
   664B F1            [10]  621 	pop	af
   664C EB            [ 4]  622 	ex	de,hl
   664D C1            [10]  623 	pop	bc
                            624 ;src/main.c:177: *waistTile = 0;
   664E 21 00 00      [10]  625 	ld	hl,#0x0000
   6651 36 00         [10]  626 	ld	(hl),#0x00
                            627 ;src/main.c:178: break;
   6653 18 3B         [12]  628 	jr	00105$
                            629 ;src/main.c:179: case 3:
   6655                     630 00104$:
                            631 ;src/main.c:180: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6655 3A F9 62      [13]  632 	ld	a, (#(_prota + 0x0001) + 0)
   6658 C6 16         [ 7]  633 	add	a, #0x16
   665A 21 F8 62      [10]  634 	ld	hl, #_prota + 0
   665D 56            [ 7]  635 	ld	d,(hl)
   665E C5            [11]  636 	push	bc
   665F F5            [11]  637 	push	af
   6660 33            [ 6]  638 	inc	sp
   6661 D5            [11]  639 	push	de
   6662 33            [ 6]  640 	inc	sp
   6663 2A D5 63      [16]  641 	ld	hl,(_mapa)
   6666 E5            [11]  642 	push	hl
   6667 CD 2C 4A      [17]  643 	call	_getTilePtr
   666A F1            [10]  644 	pop	af
   666B F1            [10]  645 	pop	af
   666C C1            [10]  646 	pop	bc
   666D 33            [ 6]  647 	inc	sp
   666E 33            [ 6]  648 	inc	sp
   666F E5            [11]  649 	push	hl
                            650 ;src/main.c:181: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6670 3A F9 62      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   6673 C6 16         [ 7]  652 	add	a, #0x16
   6675 57            [ 4]  653 	ld	d,a
   6676 3A F8 62      [13]  654 	ld	a, (#_prota + 0)
   6679 C6 03         [ 7]  655 	add	a, #0x03
   667B C5            [11]  656 	push	bc
   667C D5            [11]  657 	push	de
   667D 33            [ 6]  658 	inc	sp
   667E F5            [11]  659 	push	af
   667F 33            [ 6]  660 	inc	sp
   6680 2A D5 63      [16]  661 	ld	hl,(_mapa)
   6683 E5            [11]  662 	push	hl
   6684 CD 2C 4A      [17]  663 	call	_getTilePtr
   6687 F1            [10]  664 	pop	af
   6688 F1            [10]  665 	pop	af
   6689 EB            [ 4]  666 	ex	de,hl
   668A C1            [10]  667 	pop	bc
                            668 ;src/main.c:182: *waistTile = 0;
   668B 21 00 00      [10]  669 	ld	hl,#0x0000
   668E 36 00         [10]  670 	ld	(hl),#0x00
                            671 ;src/main.c:184: }
   6690                     672 00105$:
                            673 ;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6690 E1            [10]  674 	pop	hl
   6691 E5            [11]  675 	push	hl
   6692 6E            [ 7]  676 	ld	l,(hl)
   6693 3E 02         [ 7]  677 	ld	a,#0x02
   6695 95            [ 4]  678 	sub	a, l
   6696 38 0E         [12]  679 	jr	C,00106$
   6698 1A            [ 7]  680 	ld	a,(de)
   6699 5F            [ 4]  681 	ld	e,a
   669A 3E 02         [ 7]  682 	ld	a,#0x02
   669C 93            [ 4]  683 	sub	a, e
   669D 38 07         [12]  684 	jr	C,00106$
   669F 0A            [ 7]  685 	ld	a,(bc)
   66A0 4F            [ 4]  686 	ld	c,a
   66A1 3E 02         [ 7]  687 	ld	a,#0x02
   66A3 91            [ 4]  688 	sub	a, c
   66A4 30 04         [12]  689 	jr	NC,00107$
   66A6                     690 00106$:
                            691 ;src/main.c:187: return 1;
   66A6 2E 01         [ 7]  692 	ld	l,#0x01
   66A8 18 02         [12]  693 	jr	00110$
   66AA                     694 00107$:
                            695 ;src/main.c:189: return 0;
   66AA 2E 00         [ 7]  696 	ld	l,#0x00
   66AC                     697 00110$:
   66AC DD F9         [10]  698 	ld	sp, ix
   66AE DD E1         [14]  699 	pop	ix
   66B0 C9            [10]  700 	ret
                            701 ;src/main.c:192: void dibujarEnemigo(TEnemy *enemy) {
                            702 ;	---------------------------------
                            703 ; Function dibujarEnemigo
                            704 ; ---------------------------------
   66B1                     705 _dibujarEnemigo::
   66B1 DD E5         [15]  706 	push	ix
   66B3 DD 21 00 00   [14]  707 	ld	ix,#0
   66B7 DD 39         [15]  708 	add	ix,sp
                            709 ;src/main.c:193: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66B9 DD 4E 04      [19]  710 	ld	c,4 (ix)
   66BC DD 46 05      [19]  711 	ld	b,5 (ix)
   66BF 69            [ 4]  712 	ld	l, c
   66C0 60            [ 4]  713 	ld	h, b
   66C1 23            [ 6]  714 	inc	hl
   66C2 56            [ 7]  715 	ld	d,(hl)
   66C3 0A            [ 7]  716 	ld	a,(bc)
   66C4 C5            [11]  717 	push	bc
   66C5 D5            [11]  718 	push	de
   66C6 33            [ 6]  719 	inc	sp
   66C7 F5            [11]  720 	push	af
   66C8 33            [ 6]  721 	inc	sp
   66C9 21 00 C0      [10]  722 	ld	hl,#0xC000
   66CC E5            [11]  723 	push	hl
   66CD CD 15 5F      [17]  724 	call	_cpct_getScreenPtr
   66D0 EB            [ 4]  725 	ex	de,hl
                            726 ;src/main.c:194: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   66D1 E1            [10]  727 	pop	hl
   66D2 01 04 00      [10]  728 	ld	bc, #0x0004
   66D5 09            [11]  729 	add	hl, bc
   66D6 4E            [ 7]  730 	ld	c,(hl)
   66D7 23            [ 6]  731 	inc	hl
   66D8 46            [ 7]  732 	ld	b,(hl)
   66D9 21 00 01      [10]  733 	ld	hl,#_g_tablatrans
   66DC E5            [11]  734 	push	hl
   66DD 21 04 16      [10]  735 	ld	hl,#0x1604
   66E0 E5            [11]  736 	push	hl
   66E1 D5            [11]  737 	push	de
   66E2 C5            [11]  738 	push	bc
   66E3 CD 35 5F      [17]  739 	call	_cpct_drawSpriteMaskedAlignedTable
   66E6 DD E1         [14]  740 	pop	ix
   66E8 C9            [10]  741 	ret
                            742 ;src/main.c:197: void dibujarExplosion(TEnemy *enemy) {
                            743 ;	---------------------------------
                            744 ; Function dibujarExplosion
                            745 ; ---------------------------------
   66E9                     746 _dibujarExplosion::
   66E9 DD E5         [15]  747 	push	ix
   66EB DD 21 00 00   [14]  748 	ld	ix,#0
   66EF DD 39         [15]  749 	add	ix,sp
                            750 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66F1 DD 4E 04      [19]  751 	ld	c,4 (ix)
   66F4 DD 46 05      [19]  752 	ld	b,5 (ix)
   66F7 69            [ 4]  753 	ld	l, c
   66F8 60            [ 4]  754 	ld	h, b
   66F9 23            [ 6]  755 	inc	hl
   66FA 56            [ 7]  756 	ld	d,(hl)
   66FB 0A            [ 7]  757 	ld	a,(bc)
   66FC 47            [ 4]  758 	ld	b,a
   66FD D5            [11]  759 	push	de
   66FE 33            [ 6]  760 	inc	sp
   66FF C5            [11]  761 	push	bc
   6700 33            [ 6]  762 	inc	sp
   6701 21 00 C0      [10]  763 	ld	hl,#0xC000
   6704 E5            [11]  764 	push	hl
   6705 CD 15 5F      [17]  765 	call	_cpct_getScreenPtr
   6708 4D            [ 4]  766 	ld	c,l
   6709 44            [ 4]  767 	ld	b,h
                            768 ;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   670A 11 00 01      [10]  769 	ld	de,#_g_tablatrans+0
   670D D5            [11]  770 	push	de
   670E 21 04 16      [10]  771 	ld	hl,#0x1604
   6711 E5            [11]  772 	push	hl
   6712 C5            [11]  773 	push	bc
   6713 21 70 19      [10]  774 	ld	hl,#_g_explosion
   6716 E5            [11]  775 	push	hl
   6717 CD 35 5F      [17]  776 	call	_cpct_drawSpriteMaskedAlignedTable
   671A DD E1         [14]  777 	pop	ix
   671C C9            [10]  778 	ret
                            779 ;src/main.c:202: void borrarExplosion(TEnemy *enemy) {
                            780 ;	---------------------------------
                            781 ; Function borrarExplosion
                            782 ; ---------------------------------
   671D                     783 _borrarExplosion::
   671D DD E5         [15]  784 	push	ix
   671F DD 21 00 00   [14]  785 	ld	ix,#0
   6723 DD 39         [15]  786 	add	ix,sp
   6725 F5            [11]  787 	push	af
   6726 3B            [ 6]  788 	dec	sp
                            789 ;src/main.c:205: u8 w = 4 + (enemy->px & 1);
   6727 DD 5E 04      [19]  790 	ld	e,4 (ix)
   672A DD 56 05      [19]  791 	ld	d,5 (ix)
   672D 6B            [ 4]  792 	ld	l, e
   672E 62            [ 4]  793 	ld	h, d
   672F 23            [ 6]  794 	inc	hl
   6730 23            [ 6]  795 	inc	hl
   6731 4E            [ 7]  796 	ld	c,(hl)
   6732 79            [ 4]  797 	ld	a,c
   6733 E6 01         [ 7]  798 	and	a, #0x01
   6735 47            [ 4]  799 	ld	b,a
   6736 04            [ 4]  800 	inc	b
   6737 04            [ 4]  801 	inc	b
   6738 04            [ 4]  802 	inc	b
   6739 04            [ 4]  803 	inc	b
                            804 ;src/main.c:208: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   673A EB            [ 4]  805 	ex	de,hl
   673B 23            [ 6]  806 	inc	hl
   673C 23            [ 6]  807 	inc	hl
   673D 23            [ 6]  808 	inc	hl
   673E 5E            [ 7]  809 	ld	e,(hl)
   673F CB 4B         [ 8]  810 	bit	1, e
   6741 28 04         [12]  811 	jr	Z,00103$
   6743 3E 01         [ 7]  812 	ld	a,#0x01
   6745 18 02         [12]  813 	jr	00104$
   6747                     814 00103$:
   6747 3E 00         [ 7]  815 	ld	a,#0x00
   6749                     816 00104$:
   6749 C6 06         [ 7]  817 	add	a, #0x06
   674B DD 77 FD      [19]  818 	ld	-3 (ix),a
                            819 ;src/main.c:210: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   674E FD 2A D5 63   [20]  820 	ld	iy,(_mapa)
   6752 16 00         [ 7]  821 	ld	d,#0x00
   6754 7B            [ 4]  822 	ld	a,e
   6755 C6 E8         [ 7]  823 	add	a,#0xE8
   6757 DD 77 FE      [19]  824 	ld	-2 (ix),a
   675A 7A            [ 4]  825 	ld	a,d
   675B CE FF         [ 7]  826 	adc	a,#0xFF
   675D DD 77 FF      [19]  827 	ld	-1 (ix),a
   6760 DD 6E FE      [19]  828 	ld	l,-2 (ix)
   6763 DD 66 FF      [19]  829 	ld	h,-1 (ix)
   6766 DD CB FF 7E   [20]  830 	bit	7, -1 (ix)
   676A 28 04         [12]  831 	jr	Z,00105$
   676C 21 EB FF      [10]  832 	ld	hl,#0xFFEB
   676F 19            [11]  833 	add	hl,de
   6770                     834 00105$:
   6770 CB 2C         [ 8]  835 	sra	h
   6772 CB 1D         [ 8]  836 	rr	l
   6774 CB 2C         [ 8]  837 	sra	h
   6776 CB 1D         [ 8]  838 	rr	l
   6778 55            [ 4]  839 	ld	d,l
   6779 CB 39         [ 8]  840 	srl	c
   677B FD E5         [15]  841 	push	iy
   677D 21 F0 C0      [10]  842 	ld	hl,#0xC0F0
   6780 E5            [11]  843 	push	hl
   6781 3E 28         [ 7]  844 	ld	a,#0x28
   6783 F5            [11]  845 	push	af
   6784 33            [ 6]  846 	inc	sp
   6785 DD 7E FD      [19]  847 	ld	a,-3 (ix)
   6788 F5            [11]  848 	push	af
   6789 33            [ 6]  849 	inc	sp
   678A C5            [11]  850 	push	bc
   678B 33            [ 6]  851 	inc	sp
   678C D5            [11]  852 	push	de
   678D 33            [ 6]  853 	inc	sp
   678E 79            [ 4]  854 	ld	a,c
   678F F5            [11]  855 	push	af
   6790 33            [ 6]  856 	inc	sp
   6791 CD F7 53      [17]  857 	call	_cpct_etm_drawTileBox2x4
   6794 DD F9         [10]  858 	ld	sp, ix
   6796 DD E1         [14]  859 	pop	ix
   6798 C9            [10]  860 	ret
                            861 ;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
                            862 ;	---------------------------------
                            863 ; Function borrarEnemigo
                            864 ; ---------------------------------
   6799                     865 _borrarEnemigo::
   6799 DD E5         [15]  866 	push	ix
   679B DD 21 00 00   [14]  867 	ld	ix,#0
   679F DD 39         [15]  868 	add	ix,sp
   67A1 F5            [11]  869 	push	af
   67A2 F5            [11]  870 	push	af
                            871 ;src/main.c:218: u8 w = 4 + (x & 1);
   67A3 DD 7E 04      [19]  872 	ld	a,4 (ix)
   67A6 E6 01         [ 7]  873 	and	a, #0x01
   67A8 5F            [ 4]  874 	ld	e,a
   67A9 1C            [ 4]  875 	inc	e
   67AA 1C            [ 4]  876 	inc	e
   67AB 1C            [ 4]  877 	inc	e
   67AC 1C            [ 4]  878 	inc	e
                            879 ;src/main.c:221: u8 h = 6 + (y & 3 ? 1 : 0);
   67AD DD 7E 05      [19]  880 	ld	a,5 (ix)
   67B0 E6 03         [ 7]  881 	and	a, #0x03
   67B2 28 04         [12]  882 	jr	Z,00103$
   67B4 3E 01         [ 7]  883 	ld	a,#0x01
   67B6 18 02         [12]  884 	jr	00104$
   67B8                     885 00103$:
   67B8 3E 00         [ 7]  886 	ld	a,#0x00
   67BA                     887 00104$:
   67BA C6 06         [ 7]  888 	add	a, #0x06
   67BC 57            [ 4]  889 	ld	d,a
                            890 ;src/main.c:223: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   67BD 2A D5 63      [16]  891 	ld	hl,(_mapa)
   67C0 E3            [19]  892 	ex	(sp), hl
   67C1 DD 4E 05      [19]  893 	ld	c,5 (ix)
   67C4 06 00         [ 7]  894 	ld	b,#0x00
   67C6 79            [ 4]  895 	ld	a,c
   67C7 C6 E8         [ 7]  896 	add	a,#0xE8
   67C9 DD 77 FE      [19]  897 	ld	-2 (ix),a
   67CC 78            [ 4]  898 	ld	a,b
   67CD CE FF         [ 7]  899 	adc	a,#0xFF
   67CF DD 77 FF      [19]  900 	ld	-1 (ix),a
   67D2 DD 6E FE      [19]  901 	ld	l,-2 (ix)
   67D5 DD 66 FF      [19]  902 	ld	h,-1 (ix)
   67D8 DD CB FF 7E   [20]  903 	bit	7, -1 (ix)
   67DC 28 04         [12]  904 	jr	Z,00105$
   67DE 21 EB FF      [10]  905 	ld	hl,#0xFFEB
   67E1 09            [11]  906 	add	hl,bc
   67E2                     907 00105$:
   67E2 CB 2C         [ 8]  908 	sra	h
   67E4 CB 1D         [ 8]  909 	rr	l
   67E6 CB 2C         [ 8]  910 	sra	h
   67E8 CB 1D         [ 8]  911 	rr	l
   67EA 45            [ 4]  912 	ld	b,l
   67EB DD 4E 04      [19]  913 	ld	c,4 (ix)
   67EE CB 39         [ 8]  914 	srl	c
   67F0 E1            [10]  915 	pop	hl
   67F1 E5            [11]  916 	push	hl
   67F2 E5            [11]  917 	push	hl
   67F3 21 F0 C0      [10]  918 	ld	hl,#0xC0F0
   67F6 E5            [11]  919 	push	hl
   67F7 3E 28         [ 7]  920 	ld	a,#0x28
   67F9 F5            [11]  921 	push	af
   67FA 33            [ 6]  922 	inc	sp
   67FB D5            [11]  923 	push	de
   67FC C5            [11]  924 	push	bc
   67FD CD F7 53      [17]  925 	call	_cpct_etm_drawTileBox2x4
                            926 ;src/main.c:225: enemy->mover = NO;
   6800 21 76 5F      [10]  927 	ld	hl,#(_enemy + 0x0006)
   6803 36 00         [10]  928 	ld	(hl),#0x00
   6805 DD F9         [10]  929 	ld	sp, ix
   6807 DD E1         [14]  930 	pop	ix
   6809 C9            [10]  931 	ret
                            932 ;src/main.c:228: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            933 ;	---------------------------------
                            934 ; Function redibujarEnemigo
                            935 ; ---------------------------------
   680A                     936 _redibujarEnemigo::
   680A DD E5         [15]  937 	push	ix
   680C DD 21 00 00   [14]  938 	ld	ix,#0
   6810 DD 39         [15]  939 	add	ix,sp
                            940 ;src/main.c:229: borrarEnemigo(x, y);
   6812 DD 66 05      [19]  941 	ld	h,5 (ix)
   6815 DD 6E 04      [19]  942 	ld	l,4 (ix)
   6818 E5            [11]  943 	push	hl
   6819 CD 99 67      [17]  944 	call	_borrarEnemigo
   681C F1            [10]  945 	pop	af
                            946 ;src/main.c:230: enemy->px = enemy->x;
   681D DD 4E 06      [19]  947 	ld	c,6 (ix)
   6820 DD 46 07      [19]  948 	ld	b,7 (ix)
   6823 59            [ 4]  949 	ld	e, c
   6824 50            [ 4]  950 	ld	d, b
   6825 13            [ 6]  951 	inc	de
   6826 13            [ 6]  952 	inc	de
   6827 0A            [ 7]  953 	ld	a,(bc)
   6828 12            [ 7]  954 	ld	(de),a
                            955 ;src/main.c:231: enemy->py = enemy->y;
   6829 59            [ 4]  956 	ld	e, c
   682A 50            [ 4]  957 	ld	d, b
   682B 13            [ 6]  958 	inc	de
   682C 13            [ 6]  959 	inc	de
   682D 13            [ 6]  960 	inc	de
   682E 69            [ 4]  961 	ld	l, c
   682F 60            [ 4]  962 	ld	h, b
   6830 23            [ 6]  963 	inc	hl
   6831 7E            [ 7]  964 	ld	a,(hl)
   6832 12            [ 7]  965 	ld	(de),a
                            966 ;src/main.c:232: dibujarEnemigo(enemy);
   6833 C5            [11]  967 	push	bc
   6834 CD B1 66      [17]  968 	call	_dibujarEnemigo
   6837 F1            [10]  969 	pop	af
   6838 DD E1         [14]  970 	pop	ix
   683A C9            [10]  971 	ret
                            972 ;src/main.c:235: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            973 ;	---------------------------------
                            974 ; Function checkEnemyCollision
                            975 ; ---------------------------------
   683B                     976 _checkEnemyCollision::
   683B DD E5         [15]  977 	push	ix
   683D DD 21 00 00   [14]  978 	ld	ix,#0
   6841 DD 39         [15]  979 	add	ix,sp
   6843 21 F7 FF      [10]  980 	ld	hl,#-9
   6846 39            [11]  981 	add	hl,sp
   6847 F9            [ 6]  982 	ld	sp,hl
                            983 ;src/main.c:236: u8 colisiona = 1;
   6848 DD 36 F7 01   [19]  984 	ld	-9 (ix),#0x01
                            985 ;src/main.c:238: switch (direction) {
   684C 3E 03         [ 7]  986 	ld	a,#0x03
   684E DD 96 04      [19]  987 	sub	a, 4 (ix)
   6851 DA 2E 6C      [10]  988 	jp	C,00165$
                            989 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6854 DD 4E 05      [19]  990 	ld	c,5 (ix)
   6857 DD 46 06      [19]  991 	ld	b,6 (ix)
   685A 0A            [ 7]  992 	ld	a,(bc)
   685B 5F            [ 4]  993 	ld	e,a
   685C 21 01 00      [10]  994 	ld	hl,#0x0001
   685F 09            [11]  995 	add	hl,bc
   6860 DD 75 F8      [19]  996 	ld	-8 (ix),l
   6863 DD 74 F9      [19]  997 	ld	-7 (ix),h
   6866 DD 6E F8      [19]  998 	ld	l,-8 (ix)
   6869 DD 66 F9      [19]  999 	ld	h,-7 (ix)
   686C 56            [ 7] 1000 	ld	d,(hl)
                           1001 ;src/main.c:252: enemy->muerto = SI;
   686D 21 08 00      [10] 1002 	ld	hl,#0x0008
   6870 09            [11] 1003 	add	hl,bc
   6871 DD 75 FA      [19] 1004 	ld	-6 (ix),l
   6874 DD 74 FB      [19] 1005 	ld	-5 (ix),h
                           1006 ;src/main.c:259: enemy->mira = M_izquierda;
   6877 21 07 00      [10] 1007 	ld	hl,#0x0007
   687A 09            [11] 1008 	add	hl,bc
   687B DD 75 FC      [19] 1009 	ld	-4 (ix),l
   687E DD 74 FD      [19] 1010 	ld	-3 (ix),h
                           1011 ;src/main.c:238: switch (direction) {
   6881 D5            [11] 1012 	push	de
   6882 DD 5E 04      [19] 1013 	ld	e,4 (ix)
   6885 16 00         [ 7] 1014 	ld	d,#0x00
   6887 21 8F 68      [10] 1015 	ld	hl,#00268$
   688A 19            [11] 1016 	add	hl,de
   688B 19            [11] 1017 	add	hl,de
   688C 19            [11] 1018 	add	hl,de
   688D D1            [10] 1019 	pop	de
   688E E9            [ 4] 1020 	jp	(hl)
   688F                    1021 00268$:
   688F C3 9B 68      [10] 1022 	jp	00101$
   6892 C3 83 69      [10] 1023 	jp	00117$
   6895 C3 67 6A      [10] 1024 	jp	00133$
   6898 C3 45 6B      [10] 1025 	jp	00149$
                           1026 ;src/main.c:239: case 0:
   689B                    1027 00101$:
                           1028 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   689B 7B            [ 4] 1029 	ld	a,e
   689C C6 05         [ 7] 1030 	add	a, #0x05
   689E C5            [11] 1031 	push	bc
   689F D5            [11] 1032 	push	de
   68A0 33            [ 6] 1033 	inc	sp
   68A1 F5            [11] 1034 	push	af
   68A2 33            [ 6] 1035 	inc	sp
   68A3 2A D5 63      [16] 1036 	ld	hl,(_mapa)
   68A6 E5            [11] 1037 	push	hl
   68A7 CD 2C 4A      [17] 1038 	call	_getTilePtr
   68AA F1            [10] 1039 	pop	af
   68AB F1            [10] 1040 	pop	af
   68AC C1            [10] 1041 	pop	bc
   68AD 5E            [ 7] 1042 	ld	e,(hl)
   68AE 3E 02         [ 7] 1043 	ld	a,#0x02
   68B0 93            [ 4] 1044 	sub	a, e
   68B1 DA 78 69      [10] 1045 	jp	C,00113$
                           1046 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   68B4 DD 6E F8      [19] 1047 	ld	l,-8 (ix)
   68B7 DD 66 F9      [19] 1048 	ld	h,-7 (ix)
   68BA 7E            [ 7] 1049 	ld	a,(hl)
   68BB C6 0B         [ 7] 1050 	add	a, #0x0B
   68BD 57            [ 4] 1051 	ld	d,a
   68BE 0A            [ 7] 1052 	ld	a,(bc)
   68BF C6 05         [ 7] 1053 	add	a, #0x05
   68C1 C5            [11] 1054 	push	bc
   68C2 D5            [11] 1055 	push	de
   68C3 33            [ 6] 1056 	inc	sp
   68C4 F5            [11] 1057 	push	af
   68C5 33            [ 6] 1058 	inc	sp
   68C6 2A D5 63      [16] 1059 	ld	hl,(_mapa)
   68C9 E5            [11] 1060 	push	hl
   68CA CD 2C 4A      [17] 1061 	call	_getTilePtr
   68CD F1            [10] 1062 	pop	af
   68CE F1            [10] 1063 	pop	af
   68CF C1            [10] 1064 	pop	bc
   68D0 5E            [ 7] 1065 	ld	e,(hl)
   68D1 3E 02         [ 7] 1066 	ld	a,#0x02
   68D3 93            [ 4] 1067 	sub	a, e
   68D4 DA 78 69      [10] 1068 	jp	C,00113$
                           1069 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   68D7 DD 6E F8      [19] 1070 	ld	l,-8 (ix)
   68DA DD 66 F9      [19] 1071 	ld	h,-7 (ix)
   68DD 7E            [ 7] 1072 	ld	a,(hl)
   68DE C6 16         [ 7] 1073 	add	a, #0x16
   68E0 57            [ 4] 1074 	ld	d,a
   68E1 0A            [ 7] 1075 	ld	a,(bc)
   68E2 C6 05         [ 7] 1076 	add	a, #0x05
   68E4 C5            [11] 1077 	push	bc
   68E5 D5            [11] 1078 	push	de
   68E6 33            [ 6] 1079 	inc	sp
   68E7 F5            [11] 1080 	push	af
   68E8 33            [ 6] 1081 	inc	sp
   68E9 2A D5 63      [16] 1082 	ld	hl,(_mapa)
   68EC E5            [11] 1083 	push	hl
   68ED CD 2C 4A      [17] 1084 	call	_getTilePtr
   68F0 F1            [10] 1085 	pop	af
   68F1 F1            [10] 1086 	pop	af
   68F2 C1            [10] 1087 	pop	bc
   68F3 5E            [ 7] 1088 	ld	e,(hl)
   68F4 3E 02         [ 7] 1089 	ld	a,#0x02
   68F6 93            [ 4] 1090 	sub	a, e
   68F7 DA 78 69      [10] 1091 	jp	C,00113$
                           1092 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   68FA 21 01 63      [10] 1093 	ld	hl, #_cu + 1
   68FD 5E            [ 7] 1094 	ld	e,(hl)
   68FE 16 00         [ 7] 1095 	ld	d,#0x00
   6900 21 04 00      [10] 1096 	ld	hl,#0x0004
   6903 19            [11] 1097 	add	hl,de
   6904 DD 75 FE      [19] 1098 	ld	-2 (ix),l
   6907 DD 74 FF      [19] 1099 	ld	-1 (ix),h
   690A DD 6E F8      [19] 1100 	ld	l,-8 (ix)
   690D DD 66 F9      [19] 1101 	ld	h,-7 (ix)
   6910 6E            [ 7] 1102 	ld	l,(hl)
   6911 26 00         [ 7] 1103 	ld	h,#0x00
   6913 DD 7E FE      [19] 1104 	ld	a,-2 (ix)
   6916 95            [ 4] 1105 	sub	a, l
   6917 DD 7E FF      [19] 1106 	ld	a,-1 (ix)
   691A 9C            [ 4] 1107 	sbc	a, h
   691B E2 20 69      [10] 1108 	jp	PO, 00269$
   691E EE 80         [ 7] 1109 	xor	a, #0x80
   6920                    1110 00269$:
   6920 FA 35 69      [10] 1111 	jp	M,00108$
   6923 D5            [11] 1112 	push	de
   6924 11 16 00      [10] 1113 	ld	de,#0x0016
   6927 19            [11] 1114 	add	hl, de
   6928 D1            [10] 1115 	pop	de
   6929 7D            [ 4] 1116 	ld	a,l
   692A 93            [ 4] 1117 	sub	a, e
   692B 7C            [ 4] 1118 	ld	a,h
   692C 9A            [ 4] 1119 	sbc	a, d
   692D E2 32 69      [10] 1120 	jp	PO, 00270$
   6930 EE 80         [ 7] 1121 	xor	a, #0x80
   6932                    1122 00270$:
   6932 F2 3C 69      [10] 1123 	jp	P,00109$
   6935                    1124 00108$:
                           1125 ;src/main.c:245: colisiona = 0;
   6935 DD 36 F7 00   [19] 1126 	ld	-9 (ix),#0x00
   6939 C3 2E 6C      [10] 1127 	jp	00165$
   693C                    1128 00109$:
                           1129 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   693C 21 00 63      [10] 1130 	ld	hl, #_cu + 0
   693F 5E            [ 7] 1131 	ld	e,(hl)
   6940 0A            [ 7] 1132 	ld	a,(bc)
   6941 4F            [ 4] 1133 	ld	c,a
   6942 93            [ 4] 1134 	sub	a, e
   6943 30 2C         [12] 1135 	jr	NC,00106$
                           1136 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   6945 6B            [ 4] 1137 	ld	l,e
   6946 26 00         [ 7] 1138 	ld	h,#0x00
   6948 06 00         [ 7] 1139 	ld	b,#0x00
   694A 03            [ 6] 1140 	inc	bc
   694B 03            [ 6] 1141 	inc	bc
   694C 03            [ 6] 1142 	inc	bc
   694D 03            [ 6] 1143 	inc	bc
   694E BF            [ 4] 1144 	cp	a, a
   694F ED 42         [15] 1145 	sbc	hl, bc
   6951 3E 01         [ 7] 1146 	ld	a,#0x01
   6953 BD            [ 4] 1147 	cp	a, l
   6954 3E 00         [ 7] 1148 	ld	a,#0x00
   6956 9C            [ 4] 1149 	sbc	a, h
   6957 E2 5C 69      [10] 1150 	jp	PO, 00271$
   695A EE 80         [ 7] 1151 	xor	a, #0x80
   695C                    1152 00271$:
   695C F2 66 69      [10] 1153 	jp	P,00103$
                           1154 ;src/main.c:250: colisiona = 0;
   695F DD 36 F7 00   [19] 1155 	ld	-9 (ix),#0x00
   6963 C3 2E 6C      [10] 1156 	jp	00165$
   6966                    1157 00103$:
                           1158 ;src/main.c:252: enemy->muerto = SI;
   6966 DD 6E FA      [19] 1159 	ld	l,-6 (ix)
   6969 DD 66 FB      [19] 1160 	ld	h,-5 (ix)
   696C 36 01         [10] 1161 	ld	(hl),#0x01
   696E C3 2E 6C      [10] 1162 	jp	00165$
   6971                    1163 00106$:
                           1164 ;src/main.c:255: colisiona = 0;
   6971 DD 36 F7 00   [19] 1165 	ld	-9 (ix),#0x00
   6975 C3 2E 6C      [10] 1166 	jp	00165$
   6978                    1167 00113$:
                           1168 ;src/main.c:259: enemy->mira = M_izquierda;
   6978 DD 6E FC      [19] 1169 	ld	l,-4 (ix)
   697B DD 66 FD      [19] 1170 	ld	h,-3 (ix)
   697E 36 01         [10] 1171 	ld	(hl),#0x01
                           1172 ;src/main.c:261: break;
   6980 C3 2E 6C      [10] 1173 	jp	00165$
                           1174 ;src/main.c:262: case 1:
   6983                    1175 00117$:
                           1176 ;src/main.c:263: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6983 1D            [ 4] 1177 	dec	e
   6984 C5            [11] 1178 	push	bc
   6985 D5            [11] 1179 	push	de
   6986 2A D5 63      [16] 1180 	ld	hl,(_mapa)
   6989 E5            [11] 1181 	push	hl
   698A CD 2C 4A      [17] 1182 	call	_getTilePtr
   698D F1            [10] 1183 	pop	af
   698E F1            [10] 1184 	pop	af
   698F C1            [10] 1185 	pop	bc
   6990 5E            [ 7] 1186 	ld	e,(hl)
   6991 3E 02         [ 7] 1187 	ld	a,#0x02
   6993 93            [ 4] 1188 	sub	a, e
   6994 DA 5C 6A      [10] 1189 	jp	C,00129$
                           1190 ;src/main.c:264: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6997 DD 6E F8      [19] 1191 	ld	l,-8 (ix)
   699A DD 66 F9      [19] 1192 	ld	h,-7 (ix)
   699D 7E            [ 7] 1193 	ld	a,(hl)
   699E C6 0B         [ 7] 1194 	add	a, #0x0B
   69A0 57            [ 4] 1195 	ld	d,a
   69A1 0A            [ 7] 1196 	ld	a,(bc)
   69A2 C6 FF         [ 7] 1197 	add	a,#0xFF
   69A4 C5            [11] 1198 	push	bc
   69A5 D5            [11] 1199 	push	de
   69A6 33            [ 6] 1200 	inc	sp
   69A7 F5            [11] 1201 	push	af
   69A8 33            [ 6] 1202 	inc	sp
   69A9 2A D5 63      [16] 1203 	ld	hl,(_mapa)
   69AC E5            [11] 1204 	push	hl
   69AD CD 2C 4A      [17] 1205 	call	_getTilePtr
   69B0 F1            [10] 1206 	pop	af
   69B1 F1            [10] 1207 	pop	af
   69B2 C1            [10] 1208 	pop	bc
   69B3 5E            [ 7] 1209 	ld	e,(hl)
   69B4 3E 02         [ 7] 1210 	ld	a,#0x02
   69B6 93            [ 4] 1211 	sub	a, e
   69B7 DA 5C 6A      [10] 1212 	jp	C,00129$
                           1213 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   69BA DD 6E F8      [19] 1214 	ld	l,-8 (ix)
   69BD DD 66 F9      [19] 1215 	ld	h,-7 (ix)
   69C0 7E            [ 7] 1216 	ld	a,(hl)
   69C1 C6 16         [ 7] 1217 	add	a, #0x16
   69C3 57            [ 4] 1218 	ld	d,a
   69C4 0A            [ 7] 1219 	ld	a,(bc)
   69C5 C6 FF         [ 7] 1220 	add	a,#0xFF
   69C7 C5            [11] 1221 	push	bc
   69C8 D5            [11] 1222 	push	de
   69C9 33            [ 6] 1223 	inc	sp
   69CA F5            [11] 1224 	push	af
   69CB 33            [ 6] 1225 	inc	sp
   69CC 2A D5 63      [16] 1226 	ld	hl,(_mapa)
   69CF E5            [11] 1227 	push	hl
   69D0 CD 2C 4A      [17] 1228 	call	_getTilePtr
   69D3 F1            [10] 1229 	pop	af
   69D4 F1            [10] 1230 	pop	af
   69D5 C1            [10] 1231 	pop	bc
   69D6 5E            [ 7] 1232 	ld	e,(hl)
   69D7 3E 02         [ 7] 1233 	ld	a,#0x02
   69D9 93            [ 4] 1234 	sub	a, e
   69DA DA 5C 6A      [10] 1235 	jp	C,00129$
                           1236 ;src/main.c:267: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69DD 21 01 63      [10] 1237 	ld	hl, #_cu + 1
   69E0 5E            [ 7] 1238 	ld	e,(hl)
   69E1 16 00         [ 7] 1239 	ld	d,#0x00
   69E3 21 04 00      [10] 1240 	ld	hl,#0x0004
   69E6 19            [11] 1241 	add	hl,de
   69E7 DD 75 FE      [19] 1242 	ld	-2 (ix),l
   69EA DD 74 FF      [19] 1243 	ld	-1 (ix),h
   69ED DD 6E F8      [19] 1244 	ld	l,-8 (ix)
   69F0 DD 66 F9      [19] 1245 	ld	h,-7 (ix)
   69F3 6E            [ 7] 1246 	ld	l,(hl)
   69F4 26 00         [ 7] 1247 	ld	h,#0x00
   69F6 DD 7E FE      [19] 1248 	ld	a,-2 (ix)
   69F9 95            [ 4] 1249 	sub	a, l
   69FA DD 7E FF      [19] 1250 	ld	a,-1 (ix)
   69FD 9C            [ 4] 1251 	sbc	a, h
   69FE E2 03 6A      [10] 1252 	jp	PO, 00272$
   6A01 EE 80         [ 7] 1253 	xor	a, #0x80
   6A03                    1254 00272$:
   6A03 FA 18 6A      [10] 1255 	jp	M,00124$
   6A06 D5            [11] 1256 	push	de
   6A07 11 16 00      [10] 1257 	ld	de,#0x0016
   6A0A 19            [11] 1258 	add	hl, de
   6A0B D1            [10] 1259 	pop	de
   6A0C 7D            [ 4] 1260 	ld	a,l
   6A0D 93            [ 4] 1261 	sub	a, e
   6A0E 7C            [ 4] 1262 	ld	a,h
   6A0F 9A            [ 4] 1263 	sbc	a, d
   6A10 E2 15 6A      [10] 1264 	jp	PO, 00273$
   6A13 EE 80         [ 7] 1265 	xor	a, #0x80
   6A15                    1266 00273$:
   6A15 F2 1F 6A      [10] 1267 	jp	P,00125$
   6A18                    1268 00124$:
                           1269 ;src/main.c:268: colisiona = 0;
   6A18 DD 36 F7 00   [19] 1270 	ld	-9 (ix),#0x00
   6A1C C3 2E 6C      [10] 1271 	jp	00165$
   6A1F                    1272 00125$:
                           1273 ;src/main.c:271: if(enemy->x > cu.x){ //si el cu esta abajo
   6A1F 0A            [ 7] 1274 	ld	a,(bc)
   6A20 5F            [ 4] 1275 	ld	e,a
   6A21 21 00 63      [10] 1276 	ld	hl, #_cu + 0
   6A24 4E            [ 7] 1277 	ld	c,(hl)
   6A25 79            [ 4] 1278 	ld	a,c
   6A26 93            [ 4] 1279 	sub	a, e
   6A27 30 2C         [12] 1280 	jr	NC,00122$
                           1281 ;src/main.c:272: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   6A29 6B            [ 4] 1282 	ld	l,e
   6A2A 26 00         [ 7] 1283 	ld	h,#0x00
   6A2C 06 00         [ 7] 1284 	ld	b,#0x00
   6A2E 03            [ 6] 1285 	inc	bc
   6A2F 03            [ 6] 1286 	inc	bc
   6A30 03            [ 6] 1287 	inc	bc
   6A31 03            [ 6] 1288 	inc	bc
   6A32 BF            [ 4] 1289 	cp	a, a
   6A33 ED 42         [15] 1290 	sbc	hl, bc
   6A35 3E 01         [ 7] 1291 	ld	a,#0x01
   6A37 BD            [ 4] 1292 	cp	a, l
   6A38 3E 00         [ 7] 1293 	ld	a,#0x00
   6A3A 9C            [ 4] 1294 	sbc	a, h
   6A3B E2 40 6A      [10] 1295 	jp	PO, 00274$
   6A3E EE 80         [ 7] 1296 	xor	a, #0x80
   6A40                    1297 00274$:
   6A40 F2 4A 6A      [10] 1298 	jp	P,00119$
                           1299 ;src/main.c:273: colisiona = 0;
   6A43 DD 36 F7 00   [19] 1300 	ld	-9 (ix),#0x00
   6A47 C3 2E 6C      [10] 1301 	jp	00165$
   6A4A                    1302 00119$:
                           1303 ;src/main.c:275: enemy->muerto = SI;
   6A4A DD 6E FA      [19] 1304 	ld	l,-6 (ix)
   6A4D DD 66 FB      [19] 1305 	ld	h,-5 (ix)
   6A50 36 01         [10] 1306 	ld	(hl),#0x01
   6A52 C3 2E 6C      [10] 1307 	jp	00165$
   6A55                    1308 00122$:
                           1309 ;src/main.c:278: colisiona = 0;
   6A55 DD 36 F7 00   [19] 1310 	ld	-9 (ix),#0x00
   6A59 C3 2E 6C      [10] 1311 	jp	00165$
   6A5C                    1312 00129$:
                           1313 ;src/main.c:282: enemy->mira = M_derecha;
   6A5C DD 6E FC      [19] 1314 	ld	l,-4 (ix)
   6A5F DD 66 FD      [19] 1315 	ld	h,-3 (ix)
   6A62 36 00         [10] 1316 	ld	(hl),#0x00
                           1317 ;src/main.c:284: break;
   6A64 C3 2E 6C      [10] 1318 	jp	00165$
                           1319 ;src/main.c:285: case 2:
   6A67                    1320 00133$:
                           1321 ;src/main.c:286: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6A67 15            [ 4] 1322 	dec	d
   6A68 15            [ 4] 1323 	dec	d
   6A69 C5            [11] 1324 	push	bc
   6A6A D5            [11] 1325 	push	de
   6A6B 2A D5 63      [16] 1326 	ld	hl,(_mapa)
   6A6E E5            [11] 1327 	push	hl
   6A6F CD 2C 4A      [17] 1328 	call	_getTilePtr
   6A72 F1            [10] 1329 	pop	af
   6A73 F1            [10] 1330 	pop	af
   6A74 C1            [10] 1331 	pop	bc
   6A75 5E            [ 7] 1332 	ld	e,(hl)
   6A76 3E 02         [ 7] 1333 	ld	a,#0x02
   6A78 93            [ 4] 1334 	sub	a, e
   6A79 DA 3D 6B      [10] 1335 	jp	C,00145$
                           1336 ;src/main.c:287: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6A7C DD 6E F8      [19] 1337 	ld	l,-8 (ix)
   6A7F DD 66 F9      [19] 1338 	ld	h,-7 (ix)
   6A82 56            [ 7] 1339 	ld	d,(hl)
   6A83 15            [ 4] 1340 	dec	d
   6A84 15            [ 4] 1341 	dec	d
   6A85 0A            [ 7] 1342 	ld	a,(bc)
   6A86 C6 02         [ 7] 1343 	add	a, #0x02
   6A88 C5            [11] 1344 	push	bc
   6A89 D5            [11] 1345 	push	de
   6A8A 33            [ 6] 1346 	inc	sp
   6A8B F5            [11] 1347 	push	af
   6A8C 33            [ 6] 1348 	inc	sp
   6A8D 2A D5 63      [16] 1349 	ld	hl,(_mapa)
   6A90 E5            [11] 1350 	push	hl
   6A91 CD 2C 4A      [17] 1351 	call	_getTilePtr
   6A94 F1            [10] 1352 	pop	af
   6A95 F1            [10] 1353 	pop	af
   6A96 C1            [10] 1354 	pop	bc
   6A97 5E            [ 7] 1355 	ld	e,(hl)
   6A98 3E 02         [ 7] 1356 	ld	a,#0x02
   6A9A 93            [ 4] 1357 	sub	a, e
   6A9B DA 3D 6B      [10] 1358 	jp	C,00145$
                           1359 ;src/main.c:288: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6A9E DD 6E F8      [19] 1360 	ld	l,-8 (ix)
   6AA1 DD 66 F9      [19] 1361 	ld	h,-7 (ix)
   6AA4 56            [ 7] 1362 	ld	d,(hl)
   6AA5 15            [ 4] 1363 	dec	d
   6AA6 15            [ 4] 1364 	dec	d
   6AA7 0A            [ 7] 1365 	ld	a,(bc)
   6AA8 C6 04         [ 7] 1366 	add	a, #0x04
   6AAA C5            [11] 1367 	push	bc
   6AAB D5            [11] 1368 	push	de
   6AAC 33            [ 6] 1369 	inc	sp
   6AAD F5            [11] 1370 	push	af
   6AAE 33            [ 6] 1371 	inc	sp
   6AAF 2A D5 63      [16] 1372 	ld	hl,(_mapa)
   6AB2 E5            [11] 1373 	push	hl
   6AB3 CD 2C 4A      [17] 1374 	call	_getTilePtr
   6AB6 F1            [10] 1375 	pop	af
   6AB7 F1            [10] 1376 	pop	af
   6AB8 C1            [10] 1377 	pop	bc
   6AB9 5E            [ 7] 1378 	ld	e,(hl)
   6ABA 3E 02         [ 7] 1379 	ld	a,#0x02
   6ABC 93            [ 4] 1380 	sub	a, e
   6ABD DA 3D 6B      [10] 1381 	jp	C,00145$
                           1382 ;src/main.c:290: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6AC0 21 00 63      [10] 1383 	ld	hl, #_cu + 0
   6AC3 5E            [ 7] 1384 	ld	e,(hl)
   6AC4 16 00         [ 7] 1385 	ld	d,#0x00
   6AC6 21 02 00      [10] 1386 	ld	hl,#0x0002
   6AC9 19            [11] 1387 	add	hl,de
   6ACA DD 75 FE      [19] 1388 	ld	-2 (ix),l
   6ACD DD 74 FF      [19] 1389 	ld	-1 (ix),h
   6AD0 0A            [ 7] 1390 	ld	a,(bc)
   6AD1 6F            [ 4] 1391 	ld	l,a
   6AD2 26 00         [ 7] 1392 	ld	h,#0x00
   6AD4 DD 7E FE      [19] 1393 	ld	a,-2 (ix)
   6AD7 95            [ 4] 1394 	sub	a, l
   6AD8 DD 7E FF      [19] 1395 	ld	a,-1 (ix)
   6ADB 9C            [ 4] 1396 	sbc	a, h
   6ADC E2 E1 6A      [10] 1397 	jp	PO, 00275$
   6ADF EE 80         [ 7] 1398 	xor	a, #0x80
   6AE1                    1399 00275$:
   6AE1 FA F4 6A      [10] 1400 	jp	M,00140$
   6AE4 23            [ 6] 1401 	inc	hl
   6AE5 23            [ 6] 1402 	inc	hl
   6AE6 23            [ 6] 1403 	inc	hl
   6AE7 23            [ 6] 1404 	inc	hl
   6AE8 7D            [ 4] 1405 	ld	a,l
   6AE9 93            [ 4] 1406 	sub	a, e
   6AEA 7C            [ 4] 1407 	ld	a,h
   6AEB 9A            [ 4] 1408 	sbc	a, d
   6AEC E2 F1 6A      [10] 1409 	jp	PO, 00276$
   6AEF EE 80         [ 7] 1410 	xor	a, #0x80
   6AF1                    1411 00276$:
   6AF1 F2 FA 6A      [10] 1412 	jp	P,00141$
   6AF4                    1413 00140$:
                           1414 ;src/main.c:291: colisiona = 0;
   6AF4 DD 36 F7 00   [19] 1415 	ld	-9 (ix),#0x00
   6AF8 18 4B         [12] 1416 	jr	00149$
   6AFA                    1417 00141$:
                           1418 ;src/main.c:293: if(enemy->y>cu.y){
   6AFA DD 6E F8      [19] 1419 	ld	l,-8 (ix)
   6AFD DD 66 F9      [19] 1420 	ld	h,-7 (ix)
   6B00 5E            [ 7] 1421 	ld	e,(hl)
   6B01 21 01 63      [10] 1422 	ld	hl, #(_cu + 0x0001) + 0
   6B04 6E            [ 7] 1423 	ld	l,(hl)
   6B05 7D            [ 4] 1424 	ld	a,l
   6B06 93            [ 4] 1425 	sub	a, e
   6B07 30 2E         [12] 1426 	jr	NC,00138$
                           1427 ;src/main.c:294: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6B09 16 00         [ 7] 1428 	ld	d,#0x00
   6B0B 26 00         [ 7] 1429 	ld	h,#0x00
   6B0D D5            [11] 1430 	push	de
   6B0E 11 08 00      [10] 1431 	ld	de,#0x0008
   6B11 19            [11] 1432 	add	hl, de
   6B12 D1            [10] 1433 	pop	de
   6B13 7B            [ 4] 1434 	ld	a,e
   6B14 95            [ 4] 1435 	sub	a, l
   6B15 5F            [ 4] 1436 	ld	e,a
   6B16 7A            [ 4] 1437 	ld	a,d
   6B17 9C            [ 4] 1438 	sbc	a, h
   6B18 57            [ 4] 1439 	ld	d,a
   6B19 3E 02         [ 7] 1440 	ld	a,#0x02
   6B1B BB            [ 4] 1441 	cp	a, e
   6B1C 3E 00         [ 7] 1442 	ld	a,#0x00
   6B1E 9A            [ 4] 1443 	sbc	a, d
   6B1F E2 24 6B      [10] 1444 	jp	PO, 00277$
   6B22 EE 80         [ 7] 1445 	xor	a, #0x80
   6B24                    1446 00277$:
   6B24 F2 2D 6B      [10] 1447 	jp	P,00135$
                           1448 ;src/main.c:295: colisiona = 0;
   6B27 DD 36 F7 00   [19] 1449 	ld	-9 (ix),#0x00
   6B2B 18 18         [12] 1450 	jr	00149$
   6B2D                    1451 00135$:
                           1452 ;src/main.c:297: enemy->muerto = SI;
   6B2D DD 6E FA      [19] 1453 	ld	l,-6 (ix)
   6B30 DD 66 FB      [19] 1454 	ld	h,-5 (ix)
   6B33 36 01         [10] 1455 	ld	(hl),#0x01
   6B35 18 0E         [12] 1456 	jr	00149$
   6B37                    1457 00138$:
                           1458 ;src/main.c:300: colisiona = 0;
   6B37 DD 36 F7 00   [19] 1459 	ld	-9 (ix),#0x00
   6B3B 18 08         [12] 1460 	jr	00149$
   6B3D                    1461 00145$:
                           1462 ;src/main.c:304: enemy->mira = M_abajo;
   6B3D DD 6E FC      [19] 1463 	ld	l,-4 (ix)
   6B40 DD 66 FD      [19] 1464 	ld	h,-3 (ix)
   6B43 36 03         [10] 1465 	ld	(hl),#0x03
                           1466 ;src/main.c:306: case 3:
   6B45                    1467 00149$:
                           1468 ;src/main.c:307: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6B45 DD 6E F8      [19] 1469 	ld	l,-8 (ix)
   6B48 DD 66 F9      [19] 1470 	ld	h,-7 (ix)
   6B4B 7E            [ 7] 1471 	ld	a,(hl)
   6B4C C6 18         [ 7] 1472 	add	a, #0x18
   6B4E 57            [ 4] 1473 	ld	d,a
   6B4F 0A            [ 7] 1474 	ld	a,(bc)
   6B50 C5            [11] 1475 	push	bc
   6B51 D5            [11] 1476 	push	de
   6B52 33            [ 6] 1477 	inc	sp
   6B53 F5            [11] 1478 	push	af
   6B54 33            [ 6] 1479 	inc	sp
   6B55 2A D5 63      [16] 1480 	ld	hl,(_mapa)
   6B58 E5            [11] 1481 	push	hl
   6B59 CD 2C 4A      [17] 1482 	call	_getTilePtr
   6B5C F1            [10] 1483 	pop	af
   6B5D F1            [10] 1484 	pop	af
   6B5E C1            [10] 1485 	pop	bc
   6B5F 5E            [ 7] 1486 	ld	e,(hl)
   6B60 3E 02         [ 7] 1487 	ld	a,#0x02
   6B62 93            [ 4] 1488 	sub	a, e
   6B63 DA 26 6C      [10] 1489 	jp	C,00161$
                           1490 ;src/main.c:308: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6B66 DD 6E F8      [19] 1491 	ld	l,-8 (ix)
   6B69 DD 66 F9      [19] 1492 	ld	h,-7 (ix)
   6B6C 7E            [ 7] 1493 	ld	a,(hl)
   6B6D C6 18         [ 7] 1494 	add	a, #0x18
   6B6F 57            [ 4] 1495 	ld	d,a
   6B70 0A            [ 7] 1496 	ld	a,(bc)
   6B71 C6 02         [ 7] 1497 	add	a, #0x02
   6B73 C5            [11] 1498 	push	bc
   6B74 D5            [11] 1499 	push	de
   6B75 33            [ 6] 1500 	inc	sp
   6B76 F5            [11] 1501 	push	af
   6B77 33            [ 6] 1502 	inc	sp
   6B78 2A D5 63      [16] 1503 	ld	hl,(_mapa)
   6B7B E5            [11] 1504 	push	hl
   6B7C CD 2C 4A      [17] 1505 	call	_getTilePtr
   6B7F F1            [10] 1506 	pop	af
   6B80 F1            [10] 1507 	pop	af
   6B81 C1            [10] 1508 	pop	bc
   6B82 5E            [ 7] 1509 	ld	e,(hl)
   6B83 3E 02         [ 7] 1510 	ld	a,#0x02
   6B85 93            [ 4] 1511 	sub	a, e
   6B86 DA 26 6C      [10] 1512 	jp	C,00161$
                           1513 ;src/main.c:309: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6B89 DD 6E F8      [19] 1514 	ld	l,-8 (ix)
   6B8C DD 66 F9      [19] 1515 	ld	h,-7 (ix)
   6B8F 7E            [ 7] 1516 	ld	a,(hl)
   6B90 C6 18         [ 7] 1517 	add	a, #0x18
   6B92 57            [ 4] 1518 	ld	d,a
   6B93 0A            [ 7] 1519 	ld	a,(bc)
   6B94 C6 04         [ 7] 1520 	add	a, #0x04
   6B96 C5            [11] 1521 	push	bc
   6B97 D5            [11] 1522 	push	de
   6B98 33            [ 6] 1523 	inc	sp
   6B99 F5            [11] 1524 	push	af
   6B9A 33            [ 6] 1525 	inc	sp
   6B9B 2A D5 63      [16] 1526 	ld	hl,(_mapa)
   6B9E E5            [11] 1527 	push	hl
   6B9F CD 2C 4A      [17] 1528 	call	_getTilePtr
   6BA2 F1            [10] 1529 	pop	af
   6BA3 F1            [10] 1530 	pop	af
   6BA4 C1            [10] 1531 	pop	bc
   6BA5 5E            [ 7] 1532 	ld	e,(hl)
   6BA6 3E 02         [ 7] 1533 	ld	a,#0x02
   6BA8 93            [ 4] 1534 	sub	a, e
   6BA9 38 7B         [12] 1535 	jr	C,00161$
                           1536 ;src/main.c:311: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6BAB 21 00 63      [10] 1537 	ld	hl, #_cu + 0
   6BAE 5E            [ 7] 1538 	ld	e,(hl)
   6BAF 16 00         [ 7] 1539 	ld	d,#0x00
   6BB1 21 02 00      [10] 1540 	ld	hl,#0x0002
   6BB4 19            [11] 1541 	add	hl,de
   6BB5 DD 75 FE      [19] 1542 	ld	-2 (ix),l
   6BB8 DD 74 FF      [19] 1543 	ld	-1 (ix),h
   6BBB 0A            [ 7] 1544 	ld	a,(bc)
   6BBC 4F            [ 4] 1545 	ld	c,a
   6BBD 06 00         [ 7] 1546 	ld	b,#0x00
   6BBF DD 7E FE      [19] 1547 	ld	a,-2 (ix)
   6BC2 91            [ 4] 1548 	sub	a, c
   6BC3 DD 7E FF      [19] 1549 	ld	a,-1 (ix)
   6BC6 98            [ 4] 1550 	sbc	a, b
   6BC7 E2 CC 6B      [10] 1551 	jp	PO, 00278$
   6BCA EE 80         [ 7] 1552 	xor	a, #0x80
   6BCC                    1553 00278$:
   6BCC FA DF 6B      [10] 1554 	jp	M,00156$
   6BCF 03            [ 6] 1555 	inc	bc
   6BD0 03            [ 6] 1556 	inc	bc
   6BD1 03            [ 6] 1557 	inc	bc
   6BD2 03            [ 6] 1558 	inc	bc
   6BD3 79            [ 4] 1559 	ld	a,c
   6BD4 93            [ 4] 1560 	sub	a, e
   6BD5 78            [ 4] 1561 	ld	a,b
   6BD6 9A            [ 4] 1562 	sbc	a, d
   6BD7 E2 DC 6B      [10] 1563 	jp	PO, 00279$
   6BDA EE 80         [ 7] 1564 	xor	a, #0x80
   6BDC                    1565 00279$:
   6BDC F2 E5 6B      [10] 1566 	jp	P,00157$
   6BDF                    1567 00156$:
                           1568 ;src/main.c:312: colisiona = 0;
   6BDF DD 36 F7 00   [19] 1569 	ld	-9 (ix),#0x00
   6BE3 18 49         [12] 1570 	jr	00165$
   6BE5                    1571 00157$:
                           1572 ;src/main.c:315: if(cu.y > enemy->y){ //si el cu esta abajo
   6BE5 21 01 63      [10] 1573 	ld	hl, #(_cu + 0x0001) + 0
   6BE8 4E            [ 7] 1574 	ld	c,(hl)
   6BE9 DD 6E F8      [19] 1575 	ld	l,-8 (ix)
   6BEC DD 66 F9      [19] 1576 	ld	h,-7 (ix)
   6BEF 5E            [ 7] 1577 	ld	e,(hl)
   6BF0 7B            [ 4] 1578 	ld	a,e
   6BF1 91            [ 4] 1579 	sub	a, c
   6BF2 30 2C         [12] 1580 	jr	NC,00154$
                           1581 ;src/main.c:316: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6BF4 06 00         [ 7] 1582 	ld	b,#0x00
   6BF6 16 00         [ 7] 1583 	ld	d,#0x00
   6BF8 21 16 00      [10] 1584 	ld	hl,#0x0016
   6BFB 19            [11] 1585 	add	hl,de
   6BFC 79            [ 4] 1586 	ld	a,c
   6BFD 95            [ 4] 1587 	sub	a, l
   6BFE 4F            [ 4] 1588 	ld	c,a
   6BFF 78            [ 4] 1589 	ld	a,b
   6C00 9C            [ 4] 1590 	sbc	a, h
   6C01 47            [ 4] 1591 	ld	b,a
   6C02 3E 02         [ 7] 1592 	ld	a,#0x02
   6C04 B9            [ 4] 1593 	cp	a, c
   6C05 3E 00         [ 7] 1594 	ld	a,#0x00
   6C07 98            [ 4] 1595 	sbc	a, b
   6C08 E2 0D 6C      [10] 1596 	jp	PO, 00280$
   6C0B EE 80         [ 7] 1597 	xor	a, #0x80
   6C0D                    1598 00280$:
   6C0D F2 16 6C      [10] 1599 	jp	P,00151$
                           1600 ;src/main.c:317: colisiona = 0;
   6C10 DD 36 F7 00   [19] 1601 	ld	-9 (ix),#0x00
   6C14 18 18         [12] 1602 	jr	00165$
   6C16                    1603 00151$:
                           1604 ;src/main.c:319: enemy->muerto = SI;
   6C16 DD 6E FA      [19] 1605 	ld	l,-6 (ix)
   6C19 DD 66 FB      [19] 1606 	ld	h,-5 (ix)
   6C1C 36 01         [10] 1607 	ld	(hl),#0x01
   6C1E 18 0E         [12] 1608 	jr	00165$
   6C20                    1609 00154$:
                           1610 ;src/main.c:322: colisiona = 0;
   6C20 DD 36 F7 00   [19] 1611 	ld	-9 (ix),#0x00
   6C24 18 08         [12] 1612 	jr	00165$
   6C26                    1613 00161$:
                           1614 ;src/main.c:326: enemy->mira = M_arriba;
   6C26 DD 6E FC      [19] 1615 	ld	l,-4 (ix)
   6C29 DD 66 FD      [19] 1616 	ld	h,-3 (ix)
   6C2C 36 02         [10] 1617 	ld	(hl),#0x02
                           1618 ;src/main.c:329: }
   6C2E                    1619 00165$:
                           1620 ;src/main.c:330: return colisiona;
   6C2E DD 6E F7      [19] 1621 	ld	l,-9 (ix)
   6C31 DD F9         [10] 1622 	ld	sp, ix
   6C33 DD E1         [14] 1623 	pop	ix
   6C35 C9            [10] 1624 	ret
                           1625 ;src/main.c:333: void moverEnemigoArriba(TEnemy *enemy){
                           1626 ;	---------------------------------
                           1627 ; Function moverEnemigoArriba
                           1628 ; ---------------------------------
   6C36                    1629 _moverEnemigoArriba::
   6C36 DD E5         [15] 1630 	push	ix
   6C38 DD 21 00 00   [14] 1631 	ld	ix,#0
   6C3C DD 39         [15] 1632 	add	ix,sp
                           1633 ;src/main.c:334: enemy->y--;
   6C3E DD 4E 04      [19] 1634 	ld	c,4 (ix)
   6C41 DD 46 05      [19] 1635 	ld	b,5 (ix)
   6C44 69            [ 4] 1636 	ld	l, c
   6C45 60            [ 4] 1637 	ld	h, b
   6C46 23            [ 6] 1638 	inc	hl
   6C47 5E            [ 7] 1639 	ld	e,(hl)
   6C48 1D            [ 4] 1640 	dec	e
   6C49 73            [ 7] 1641 	ld	(hl),e
                           1642 ;src/main.c:335: enemy->y--;
   6C4A 1D            [ 4] 1643 	dec	e
   6C4B 73            [ 7] 1644 	ld	(hl),e
                           1645 ;src/main.c:336: enemy->mover = SI;
   6C4C 21 06 00      [10] 1646 	ld	hl,#0x0006
   6C4F 09            [11] 1647 	add	hl,bc
   6C50 36 01         [10] 1648 	ld	(hl),#0x01
   6C52 DD E1         [14] 1649 	pop	ix
   6C54 C9            [10] 1650 	ret
                           1651 ;src/main.c:339: void moverEnemigoAbajo(TEnemy *enemy){
                           1652 ;	---------------------------------
                           1653 ; Function moverEnemigoAbajo
                           1654 ; ---------------------------------
   6C55                    1655 _moverEnemigoAbajo::
   6C55 DD E5         [15] 1656 	push	ix
   6C57 DD 21 00 00   [14] 1657 	ld	ix,#0
   6C5B DD 39         [15] 1658 	add	ix,sp
                           1659 ;src/main.c:340: enemy->y++;
   6C5D DD 4E 04      [19] 1660 	ld	c,4 (ix)
   6C60 DD 46 05      [19] 1661 	ld	b,5 (ix)
   6C63 59            [ 4] 1662 	ld	e, c
   6C64 50            [ 4] 1663 	ld	d, b
   6C65 13            [ 6] 1664 	inc	de
   6C66 1A            [ 7] 1665 	ld	a,(de)
   6C67 3C            [ 4] 1666 	inc	a
   6C68 12            [ 7] 1667 	ld	(de),a
                           1668 ;src/main.c:341: enemy->y++;
   6C69 3C            [ 4] 1669 	inc	a
   6C6A 12            [ 7] 1670 	ld	(de),a
                           1671 ;src/main.c:342: enemy->mover = SI;
   6C6B 21 06 00      [10] 1672 	ld	hl,#0x0006
   6C6E 09            [11] 1673 	add	hl,bc
   6C6F 36 01         [10] 1674 	ld	(hl),#0x01
   6C71 DD E1         [14] 1675 	pop	ix
   6C73 C9            [10] 1676 	ret
                           1677 ;src/main.c:345: void moverEnemigoDerecha(TEnemy *enemy){
                           1678 ;	---------------------------------
                           1679 ; Function moverEnemigoDerecha
                           1680 ; ---------------------------------
   6C74                    1681 _moverEnemigoDerecha::
                           1682 ;src/main.c:346: enemy->x++;
   6C74 D1            [10] 1683 	pop	de
   6C75 C1            [10] 1684 	pop	bc
   6C76 C5            [11] 1685 	push	bc
   6C77 D5            [11] 1686 	push	de
   6C78 0A            [ 7] 1687 	ld	a,(bc)
   6C79 3C            [ 4] 1688 	inc	a
   6C7A 02            [ 7] 1689 	ld	(bc),a
                           1690 ;src/main.c:347: enemy->x++;
   6C7B 3C            [ 4] 1691 	inc	a
   6C7C 02            [ 7] 1692 	ld	(bc),a
                           1693 ;src/main.c:348: enemy->mover = SI;
   6C7D 21 06 00      [10] 1694 	ld	hl,#0x0006
   6C80 09            [11] 1695 	add	hl,bc
   6C81 36 01         [10] 1696 	ld	(hl),#0x01
   6C83 C9            [10] 1697 	ret
                           1698 ;src/main.c:351: void moverEnemigoIzquierda(TEnemy *enemy){
                           1699 ;	---------------------------------
                           1700 ; Function moverEnemigoIzquierda
                           1701 ; ---------------------------------
   6C84                    1702 _moverEnemigoIzquierda::
                           1703 ;src/main.c:352: enemy->x--;
   6C84 D1            [10] 1704 	pop	de
   6C85 C1            [10] 1705 	pop	bc
   6C86 C5            [11] 1706 	push	bc
   6C87 D5            [11] 1707 	push	de
   6C88 0A            [ 7] 1708 	ld	a,(bc)
   6C89 C6 FF         [ 7] 1709 	add	a,#0xFF
   6C8B 02            [ 7] 1710 	ld	(bc),a
                           1711 ;src/main.c:353: enemy->x--;
   6C8C C6 FF         [ 7] 1712 	add	a,#0xFF
   6C8E 02            [ 7] 1713 	ld	(bc),a
                           1714 ;src/main.c:354: enemy->mover = SI;
   6C8F 21 06 00      [10] 1715 	ld	hl,#0x0006
   6C92 09            [11] 1716 	add	hl,bc
   6C93 36 01         [10] 1717 	ld	(hl),#0x01
   6C95 C9            [10] 1718 	ret
                           1719 ;src/main.c:357: void moverEnemigoPatrol(TEnemy* enemy){
                           1720 ;	---------------------------------
                           1721 ; Function moverEnemigoPatrol
                           1722 ; ---------------------------------
   6C96                    1723 _moverEnemigoPatrol::
   6C96 DD E5         [15] 1724 	push	ix
   6C98 DD 21 00 00   [14] 1725 	ld	ix,#0
   6C9C DD 39         [15] 1726 	add	ix,sp
   6C9E 21 F3 FF      [10] 1727 	ld	hl,#-13
   6CA1 39            [11] 1728 	add	hl,sp
   6CA2 F9            [ 6] 1729 	ld	sp,hl
                           1730 ;src/main.c:359: if(!enemy->muerto){
   6CA3 DD 4E 04      [19] 1731 	ld	c,4 (ix)
   6CA6 DD 46 05      [19] 1732 	ld	b,5 (ix)
   6CA9 C5            [11] 1733 	push	bc
   6CAA FD E1         [14] 1734 	pop	iy
   6CAC FD 7E 08      [19] 1735 	ld	a,8 (iy)
   6CAF B7            [ 4] 1736 	or	a, a
   6CB0 C2 D2 6E      [10] 1737 	jp	NZ,00118$
                           1738 ;src/main.c:361: if (!enemy->reversePatrol) {
   6CB3 21 0C 00      [10] 1739 	ld	hl,#0x000C
   6CB6 09            [11] 1740 	add	hl,bc
   6CB7 DD 75 FA      [19] 1741 	ld	-6 (ix),l
   6CBA DD 74 FB      [19] 1742 	ld	-5 (ix),h
   6CBD DD 6E FA      [19] 1743 	ld	l,-6 (ix)
   6CC0 DD 66 FB      [19] 1744 	ld	h,-5 (ix)
   6CC3 7E            [ 7] 1745 	ld	a,(hl)
   6CC4 DD 77 F7      [19] 1746 	ld	-9 (ix),a
                           1747 ;src/main.c:362: if(enemy->iter < enemy->longitud_camino){
   6CC7 21 0E 00      [10] 1748 	ld	hl,#0x000E
   6CCA 09            [11] 1749 	add	hl,bc
   6CCB DD 75 FC      [19] 1750 	ld	-4 (ix),l
   6CCE DD 74 FD      [19] 1751 	ld	-3 (ix),h
   6CD1 DD 6E FC      [19] 1752 	ld	l,-4 (ix)
   6CD4 DD 66 FD      [19] 1753 	ld	h,-3 (ix)
   6CD7 5E            [ 7] 1754 	ld	e,(hl)
   6CD8 23            [ 6] 1755 	inc	hl
   6CD9 56            [ 7] 1756 	ld	d,(hl)
   6CDA 21 E1 00      [10] 1757 	ld	hl,#0x00E1
   6CDD 09            [11] 1758 	add	hl,bc
   6CDE DD 75 F8      [19] 1759 	ld	-8 (ix),l
   6CE1 DD 74 F9      [19] 1760 	ld	-7 (ix),h
                           1761 ;src/main.c:364: enemy->mover = SI;
   6CE4 21 06 00      [10] 1762 	ld	hl,#0x0006
   6CE7 09            [11] 1763 	add	hl,bc
   6CE8 E3            [19] 1764 	ex	(sp), hl
                           1765 ;src/main.c:366: enemy->x = enemy->camino[enemy->iter];
   6CE9 21 19 00      [10] 1766 	ld	hl,#0x0019
   6CEC 09            [11] 1767 	add	hl,bc
   6CED DD 75 F5      [19] 1768 	ld	-11 (ix),l
   6CF0 DD 74 F6      [19] 1769 	ld	-10 (ix),h
                           1770 ;src/main.c:368: enemy->y = enemy->camino[enemy->iter];
   6CF3 21 01 00      [10] 1771 	ld	hl,#0x0001
   6CF6 09            [11] 1772 	add	hl,bc
   6CF7 DD 75 FE      [19] 1773 	ld	-2 (ix),l
   6CFA DD 74 FF      [19] 1774 	ld	-1 (ix),h
                           1775 ;src/main.c:361: if (!enemy->reversePatrol) {
   6CFD DD 7E F7      [19] 1776 	ld	a,-9 (ix)
   6D00 B7            [ 4] 1777 	or	a, a
   6D01 C2 D4 6D      [10] 1778 	jp	NZ,00114$
                           1779 ;src/main.c:362: if(enemy->iter < enemy->longitud_camino){
   6D04 DD 6E F8      [19] 1780 	ld	l,-8 (ix)
   6D07 DD 66 F9      [19] 1781 	ld	h,-7 (ix)
   6D0A 6E            [ 7] 1782 	ld	l,(hl)
   6D0B 26 00         [ 7] 1783 	ld	h,#0x00
   6D0D 7B            [ 4] 1784 	ld	a,e
   6D0E 95            [ 4] 1785 	sub	a, l
   6D0F 7A            [ 4] 1786 	ld	a,d
   6D10 9C            [ 4] 1787 	sbc	a, h
   6D11 E2 16 6D      [10] 1788 	jp	PO, 00144$
   6D14 EE 80         [ 7] 1789 	xor	a, #0x80
   6D16                    1790 00144$:
   6D16 F2 B3 6D      [10] 1791 	jp	P,00105$
                           1792 ;src/main.c:363: if(enemy->iter == 0){
   6D19 7A            [ 4] 1793 	ld	a,d
   6D1A B3            [ 4] 1794 	or	a,e
   6D1B 20 50         [12] 1795 	jr	NZ,00102$
                           1796 ;src/main.c:364: enemy->mover = SI;
   6D1D E1            [10] 1797 	pop	hl
   6D1E E5            [11] 1798 	push	hl
   6D1F 36 01         [10] 1799 	ld	(hl),#0x01
                           1800 ;src/main.c:365: enemy->iter = 2;
   6D21 DD 6E FC      [19] 1801 	ld	l,-4 (ix)
   6D24 DD 66 FD      [19] 1802 	ld	h,-3 (ix)
   6D27 36 02         [10] 1803 	ld	(hl),#0x02
   6D29 23            [ 6] 1804 	inc	hl
   6D2A 36 00         [10] 1805 	ld	(hl),#0x00
                           1806 ;src/main.c:366: enemy->x = enemy->camino[enemy->iter];
   6D2C DD 6E FC      [19] 1807 	ld	l,-4 (ix)
   6D2F DD 66 FD      [19] 1808 	ld	h,-3 (ix)
   6D32 5E            [ 7] 1809 	ld	e,(hl)
   6D33 23            [ 6] 1810 	inc	hl
   6D34 56            [ 7] 1811 	ld	d,(hl)
   6D35 DD 6E F5      [19] 1812 	ld	l,-11 (ix)
   6D38 DD 66 F6      [19] 1813 	ld	h,-10 (ix)
   6D3B 19            [11] 1814 	add	hl,de
   6D3C 7E            [ 7] 1815 	ld	a,(hl)
   6D3D 02            [ 7] 1816 	ld	(bc),a
                           1817 ;src/main.c:367: ++enemy->iter;
   6D3E DD 6E FC      [19] 1818 	ld	l,-4 (ix)
   6D41 DD 66 FD      [19] 1819 	ld	h,-3 (ix)
   6D44 4E            [ 7] 1820 	ld	c,(hl)
   6D45 23            [ 6] 1821 	inc	hl
   6D46 46            [ 7] 1822 	ld	b,(hl)
   6D47 03            [ 6] 1823 	inc	bc
   6D48 DD 6E FC      [19] 1824 	ld	l,-4 (ix)
   6D4B DD 66 FD      [19] 1825 	ld	h,-3 (ix)
   6D4E 71            [ 7] 1826 	ld	(hl),c
   6D4F 23            [ 6] 1827 	inc	hl
   6D50 70            [ 7] 1828 	ld	(hl),b
                           1829 ;src/main.c:368: enemy->y = enemy->camino[enemy->iter];
   6D51 DD 6E F5      [19] 1830 	ld	l,-11 (ix)
   6D54 DD 66 F6      [19] 1831 	ld	h,-10 (ix)
   6D57 09            [11] 1832 	add	hl,bc
   6D58 5E            [ 7] 1833 	ld	e,(hl)
   6D59 DD 6E FE      [19] 1834 	ld	l,-2 (ix)
   6D5C DD 66 FF      [19] 1835 	ld	h,-1 (ix)
   6D5F 73            [ 7] 1836 	ld	(hl),e
                           1837 ;src/main.c:369: ++enemy->iter;
   6D60 03            [ 6] 1838 	inc	bc
   6D61 DD 6E FC      [19] 1839 	ld	l,-4 (ix)
   6D64 DD 66 FD      [19] 1840 	ld	h,-3 (ix)
   6D67 71            [ 7] 1841 	ld	(hl),c
   6D68 23            [ 6] 1842 	inc	hl
   6D69 70            [ 7] 1843 	ld	(hl),b
   6D6A C3 D2 6E      [10] 1844 	jp	00118$
   6D6D                    1845 00102$:
                           1846 ;src/main.c:371: enemy->mover = SI;
   6D6D E1            [10] 1847 	pop	hl
   6D6E E5            [11] 1848 	push	hl
   6D6F 36 01         [10] 1849 	ld	(hl),#0x01
                           1850 ;src/main.c:372: enemy->x = enemy->camino[enemy->iter];
   6D71 DD 6E FC      [19] 1851 	ld	l,-4 (ix)
   6D74 DD 66 FD      [19] 1852 	ld	h,-3 (ix)
   6D77 5E            [ 7] 1853 	ld	e,(hl)
   6D78 23            [ 6] 1854 	inc	hl
   6D79 56            [ 7] 1855 	ld	d,(hl)
   6D7A DD 6E F5      [19] 1856 	ld	l,-11 (ix)
   6D7D DD 66 F6      [19] 1857 	ld	h,-10 (ix)
   6D80 19            [11] 1858 	add	hl,de
   6D81 7E            [ 7] 1859 	ld	a,(hl)
   6D82 02            [ 7] 1860 	ld	(bc),a
                           1861 ;src/main.c:373: ++enemy->iter;
   6D83 DD 6E FC      [19] 1862 	ld	l,-4 (ix)
   6D86 DD 66 FD      [19] 1863 	ld	h,-3 (ix)
   6D89 5E            [ 7] 1864 	ld	e,(hl)
   6D8A 23            [ 6] 1865 	inc	hl
   6D8B 56            [ 7] 1866 	ld	d,(hl)
   6D8C 13            [ 6] 1867 	inc	de
   6D8D DD 6E FC      [19] 1868 	ld	l,-4 (ix)
   6D90 DD 66 FD      [19] 1869 	ld	h,-3 (ix)
   6D93 73            [ 7] 1870 	ld	(hl),e
   6D94 23            [ 6] 1871 	inc	hl
   6D95 72            [ 7] 1872 	ld	(hl),d
                           1873 ;src/main.c:374: enemy->y = enemy->camino[enemy->iter];
   6D96 DD 6E F5      [19] 1874 	ld	l,-11 (ix)
   6D99 DD 66 F6      [19] 1875 	ld	h,-10 (ix)
   6D9C 19            [11] 1876 	add	hl,de
   6D9D 7E            [ 7] 1877 	ld	a,(hl)
   6D9E DD 6E FE      [19] 1878 	ld	l,-2 (ix)
   6DA1 DD 66 FF      [19] 1879 	ld	h,-1 (ix)
   6DA4 77            [ 7] 1880 	ld	(hl),a
                           1881 ;src/main.c:375: ++enemy->iter;
   6DA5 13            [ 6] 1882 	inc	de
   6DA6 4B            [ 4] 1883 	ld	c,e
   6DA7 DD 6E FC      [19] 1884 	ld	l,-4 (ix)
   6DAA DD 66 FD      [19] 1885 	ld	h,-3 (ix)
   6DAD 71            [ 7] 1886 	ld	(hl),c
   6DAE 23            [ 6] 1887 	inc	hl
   6DAF 72            [ 7] 1888 	ld	(hl),d
   6DB0 C3 D2 6E      [10] 1889 	jp	00118$
   6DB3                    1890 00105$:
                           1891 ;src/main.c:379: enemy->mover = NO;
   6DB3 E1            [10] 1892 	pop	hl
   6DB4 E5            [11] 1893 	push	hl
   6DB5 36 00         [10] 1894 	ld	(hl),#0x00
                           1895 ;src/main.c:380: enemy->iter = enemy->longitud_camino;
   6DB7 DD 6E F8      [19] 1896 	ld	l,-8 (ix)
   6DBA DD 66 F9      [19] 1897 	ld	h,-7 (ix)
   6DBD 4E            [ 7] 1898 	ld	c,(hl)
   6DBE 06 00         [ 7] 1899 	ld	b,#0x00
   6DC0 DD 6E FC      [19] 1900 	ld	l,-4 (ix)
   6DC3 DD 66 FD      [19] 1901 	ld	h,-3 (ix)
   6DC6 71            [ 7] 1902 	ld	(hl),c
   6DC7 23            [ 6] 1903 	inc	hl
   6DC8 70            [ 7] 1904 	ld	(hl),b
                           1905 ;src/main.c:384: enemy->reversePatrol = 1;
   6DC9 DD 6E FA      [19] 1906 	ld	l,-6 (ix)
   6DCC DD 66 FB      [19] 1907 	ld	h,-5 (ix)
   6DCF 36 01         [10] 1908 	ld	(hl),#0x01
   6DD1 C3 D2 6E      [10] 1909 	jp	00118$
   6DD4                    1910 00114$:
                           1911 ;src/main.c:387: if(enemy->iter > 0){
   6DD4 AF            [ 4] 1912 	xor	a, a
   6DD5 BB            [ 4] 1913 	cp	a, e
   6DD6 9A            [ 4] 1914 	sbc	a, d
   6DD7 E2 DC 6D      [10] 1915 	jp	PO, 00145$
   6DDA EE 80         [ 7] 1916 	xor	a, #0x80
   6DDC                    1917 00145$:
   6DDC F2 BC 6E      [10] 1918 	jp	P,00111$
                           1919 ;src/main.c:388: if(enemy->iter == enemy->longitud_camino){
   6DDF DD 6E F8      [19] 1920 	ld	l,-8 (ix)
   6DE2 DD 66 F9      [19] 1921 	ld	h,-7 (ix)
   6DE5 6E            [ 7] 1922 	ld	l,(hl)
   6DE6 DD 75 F8      [19] 1923 	ld	-8 (ix),l
   6DE9 DD 36 F9 00   [19] 1924 	ld	-7 (ix),#0x00
   6DED 7B            [ 4] 1925 	ld	a,e
   6DEE DD 96 F8      [19] 1926 	sub	a, -8 (ix)
   6DF1 C2 78 6E      [10] 1927 	jp	NZ,00108$
   6DF4 7A            [ 4] 1928 	ld	a,d
   6DF5 DD 96 F9      [19] 1929 	sub	a, -7 (ix)
   6DF8 C2 78 6E      [10] 1930 	jp	NZ,00108$
                           1931 ;src/main.c:389: enemy->mover = SI;
   6DFB E1            [10] 1932 	pop	hl
   6DFC E5            [11] 1933 	push	hl
   6DFD 36 01         [10] 1934 	ld	(hl),#0x01
                           1935 ;src/main.c:390: enemy->iter = enemy->iter - 1;
   6DFF DD 6E FC      [19] 1936 	ld	l,-4 (ix)
   6E02 DD 66 FD      [19] 1937 	ld	h,-3 (ix)
   6E05 5E            [ 7] 1938 	ld	e,(hl)
   6E06 23            [ 6] 1939 	inc	hl
   6E07 56            [ 7] 1940 	ld	d,(hl)
   6E08 7B            [ 4] 1941 	ld	a,e
   6E09 C6 FF         [ 7] 1942 	add	a,#0xFF
   6E0B DD 77 F8      [19] 1943 	ld	-8 (ix),a
   6E0E 7A            [ 4] 1944 	ld	a,d
   6E0F CE FF         [ 7] 1945 	adc	a,#0xFF
   6E11 DD 77 F9      [19] 1946 	ld	-7 (ix),a
   6E14 DD 6E FC      [19] 1947 	ld	l,-4 (ix)
   6E17 DD 66 FD      [19] 1948 	ld	h,-3 (ix)
   6E1A DD 7E F8      [19] 1949 	ld	a,-8 (ix)
   6E1D 77            [ 7] 1950 	ld	(hl),a
   6E1E 23            [ 6] 1951 	inc	hl
   6E1F DD 7E F9      [19] 1952 	ld	a,-7 (ix)
   6E22 77            [ 7] 1953 	ld	(hl),a
                           1954 ;src/main.c:391: enemy->iter = enemy->iter - 2;
   6E23 DD 5E F8      [19] 1955 	ld	e,-8 (ix)
   6E26 DD 56 F9      [19] 1956 	ld	d,-7 (ix)
   6E29 1B            [ 6] 1957 	dec	de
   6E2A 1B            [ 6] 1958 	dec	de
   6E2B DD 6E FC      [19] 1959 	ld	l,-4 (ix)
   6E2E DD 66 FD      [19] 1960 	ld	h,-3 (ix)
   6E31 73            [ 7] 1961 	ld	(hl),e
   6E32 23            [ 6] 1962 	inc	hl
   6E33 72            [ 7] 1963 	ld	(hl),d
                           1964 ;src/main.c:392: enemy->y = enemy->camino[enemy->iter];
   6E34 DD 6E F5      [19] 1965 	ld	l,-11 (ix)
   6E37 DD 66 F6      [19] 1966 	ld	h,-10 (ix)
   6E3A 19            [11] 1967 	add	hl,de
   6E3B 5E            [ 7] 1968 	ld	e,(hl)
   6E3C DD 6E FE      [19] 1969 	ld	l,-2 (ix)
   6E3F DD 66 FF      [19] 1970 	ld	h,-1 (ix)
   6E42 73            [ 7] 1971 	ld	(hl),e
                           1972 ;src/main.c:393: --enemy->iter;
   6E43 DD 7E F8      [19] 1973 	ld	a,-8 (ix)
   6E46 C6 FD         [ 7] 1974 	add	a,#0xFD
   6E48 5F            [ 4] 1975 	ld	e,a
   6E49 DD 7E F9      [19] 1976 	ld	a,-7 (ix)
   6E4C CE FF         [ 7] 1977 	adc	a,#0xFF
   6E4E 57            [ 4] 1978 	ld	d,a
   6E4F DD 6E FC      [19] 1979 	ld	l,-4 (ix)
   6E52 DD 66 FD      [19] 1980 	ld	h,-3 (ix)
   6E55 73            [ 7] 1981 	ld	(hl),e
   6E56 23            [ 6] 1982 	inc	hl
   6E57 72            [ 7] 1983 	ld	(hl),d
                           1984 ;src/main.c:394: enemy->x = enemy->camino[enemy->iter];
   6E58 DD 6E F5      [19] 1985 	ld	l,-11 (ix)
   6E5B DD 66 F6      [19] 1986 	ld	h,-10 (ix)
   6E5E 19            [11] 1987 	add	hl,de
   6E5F 7E            [ 7] 1988 	ld	a,(hl)
   6E60 02            [ 7] 1989 	ld	(bc),a
                           1990 ;src/main.c:395: --enemy->iter;
   6E61 DD 7E F8      [19] 1991 	ld	a,-8 (ix)
   6E64 C6 FC         [ 7] 1992 	add	a,#0xFC
   6E66 4F            [ 4] 1993 	ld	c,a
   6E67 DD 7E F9      [19] 1994 	ld	a,-7 (ix)
   6E6A CE FF         [ 7] 1995 	adc	a,#0xFF
   6E6C 47            [ 4] 1996 	ld	b,a
   6E6D DD 6E FC      [19] 1997 	ld	l,-4 (ix)
   6E70 DD 66 FD      [19] 1998 	ld	h,-3 (ix)
   6E73 71            [ 7] 1999 	ld	(hl),c
   6E74 23            [ 6] 2000 	inc	hl
   6E75 70            [ 7] 2001 	ld	(hl),b
   6E76 18 5A         [12] 2002 	jr	00118$
   6E78                    2003 00108$:
                           2004 ;src/main.c:397: enemy->mover = SI;
   6E78 E1            [10] 2005 	pop	hl
   6E79 E5            [11] 2006 	push	hl
   6E7A 36 01         [10] 2007 	ld	(hl),#0x01
                           2008 ;src/main.c:398: enemy->y = enemy->camino[enemy->iter];
   6E7C DD 6E FC      [19] 2009 	ld	l,-4 (ix)
   6E7F DD 66 FD      [19] 2010 	ld	h,-3 (ix)
   6E82 5E            [ 7] 2011 	ld	e,(hl)
   6E83 23            [ 6] 2012 	inc	hl
   6E84 56            [ 7] 2013 	ld	d,(hl)
   6E85 DD 6E F5      [19] 2014 	ld	l,-11 (ix)
   6E88 DD 66 F6      [19] 2015 	ld	h,-10 (ix)
   6E8B 19            [11] 2016 	add	hl,de
   6E8C 5E            [ 7] 2017 	ld	e,(hl)
   6E8D DD 6E FE      [19] 2018 	ld	l,-2 (ix)
   6E90 DD 66 FF      [19] 2019 	ld	h,-1 (ix)
   6E93 73            [ 7] 2020 	ld	(hl),e
                           2021 ;src/main.c:399: --enemy->iter;
   6E94 DD 6E FC      [19] 2022 	ld	l,-4 (ix)
   6E97 DD 66 FD      [19] 2023 	ld	h,-3 (ix)
   6E9A 5E            [ 7] 2024 	ld	e,(hl)
   6E9B 23            [ 6] 2025 	inc	hl
   6E9C 56            [ 7] 2026 	ld	d,(hl)
   6E9D 1B            [ 6] 2027 	dec	de
   6E9E DD 6E FC      [19] 2028 	ld	l,-4 (ix)
   6EA1 DD 66 FD      [19] 2029 	ld	h,-3 (ix)
   6EA4 73            [ 7] 2030 	ld	(hl),e
   6EA5 23            [ 6] 2031 	inc	hl
   6EA6 72            [ 7] 2032 	ld	(hl),d
                           2033 ;src/main.c:400: enemy->x = enemy->camino[enemy->iter];
   6EA7 DD 6E F5      [19] 2034 	ld	l,-11 (ix)
   6EAA DD 66 F6      [19] 2035 	ld	h,-10 (ix)
   6EAD 19            [11] 2036 	add	hl,de
   6EAE 7E            [ 7] 2037 	ld	a,(hl)
   6EAF 02            [ 7] 2038 	ld	(bc),a
                           2039 ;src/main.c:401: --enemy->iter;
   6EB0 1B            [ 6] 2040 	dec	de
   6EB1 DD 6E FC      [19] 2041 	ld	l,-4 (ix)
   6EB4 DD 66 FD      [19] 2042 	ld	h,-3 (ix)
   6EB7 73            [ 7] 2043 	ld	(hl),e
   6EB8 23            [ 6] 2044 	inc	hl
   6EB9 72            [ 7] 2045 	ld	(hl),d
   6EBA 18 16         [12] 2046 	jr	00118$
   6EBC                    2047 00111$:
                           2048 ;src/main.c:405: enemy->mover = NO;
   6EBC E1            [10] 2049 	pop	hl
   6EBD E5            [11] 2050 	push	hl
   6EBE 36 00         [10] 2051 	ld	(hl),#0x00
                           2052 ;src/main.c:406: enemy->iter = 0;
   6EC0 DD 6E FC      [19] 2053 	ld	l,-4 (ix)
   6EC3 DD 66 FD      [19] 2054 	ld	h,-3 (ix)
   6EC6 AF            [ 4] 2055 	xor	a, a
   6EC7 77            [ 7] 2056 	ld	(hl), a
   6EC8 23            [ 6] 2057 	inc	hl
   6EC9 77            [ 7] 2058 	ld	(hl), a
                           2059 ;src/main.c:408: enemy->reversePatrol = 0;
   6ECA DD 6E FA      [19] 2060 	ld	l,-6 (ix)
   6ECD DD 66 FB      [19] 2061 	ld	h,-5 (ix)
   6ED0 36 00         [10] 2062 	ld	(hl),#0x00
   6ED2                    2063 00118$:
   6ED2 DD F9         [10] 2064 	ld	sp, ix
   6ED4 DD E1         [14] 2065 	pop	ix
   6ED6 C9            [10] 2066 	ret
                           2067 ;src/main.c:415: void lookFor(TEnemy* enemy){
                           2068 ;	---------------------------------
                           2069 ; Function lookFor
                           2070 ; ---------------------------------
   6ED7                    2071 _lookFor::
   6ED7 DD E5         [15] 2072 	push	ix
   6ED9 DD 21 00 00   [14] 2073 	ld	ix,#0
   6EDD DD 39         [15] 2074 	add	ix,sp
   6EDF 21 F9 FF      [10] 2075 	ld	hl,#-7
   6EE2 39            [11] 2076 	add	hl,sp
   6EE3 F9            [ 6] 2077 	ld	sp,hl
                           2078 ;src/main.c:421: i16 difx = abs((i16)(enemy->x - prota.x));
   6EE4 DD 5E 04      [19] 2079 	ld	e,4 (ix)
   6EE7 DD 56 05      [19] 2080 	ld	d,5 (ix)
   6EEA 1A            [ 7] 2081 	ld	a,(de)
   6EEB 4F            [ 4] 2082 	ld	c,a
   6EEC 06 00         [ 7] 2083 	ld	b,#0x00
   6EEE 21 F8 62      [10] 2084 	ld	hl,#_prota+0
   6EF1 6E            [ 7] 2085 	ld	l,(hl)
   6EF2 26 00         [ 7] 2086 	ld	h,#0x00
   6EF4 79            [ 4] 2087 	ld	a,c
   6EF5 95            [ 4] 2088 	sub	a, l
   6EF6 4F            [ 4] 2089 	ld	c,a
   6EF7 78            [ 4] 2090 	ld	a,b
   6EF8 9C            [ 4] 2091 	sbc	a, h
   6EF9 47            [ 4] 2092 	ld	b,a
   6EFA D5            [11] 2093 	push	de
   6EFB C5            [11] 2094 	push	bc
   6EFC CD 70 4A      [17] 2095 	call	_abs
   6EFF F1            [10] 2096 	pop	af
   6F00 D1            [10] 2097 	pop	de
   6F01 33            [ 6] 2098 	inc	sp
   6F02 33            [ 6] 2099 	inc	sp
   6F03 E5            [11] 2100 	push	hl
                           2101 ;src/main.c:422: i16 dify = abs((i16)(enemy->y - prota.y));
   6F04 21 01 00      [10] 2102 	ld	hl,#0x0001
   6F07 19            [11] 2103 	add	hl,de
   6F08 DD 75 FE      [19] 2104 	ld	-2 (ix),l
   6F0B DD 74 FF      [19] 2105 	ld	-1 (ix),h
   6F0E DD 6E FE      [19] 2106 	ld	l,-2 (ix)
   6F11 DD 66 FF      [19] 2107 	ld	h,-1 (ix)
   6F14 4E            [ 7] 2108 	ld	c,(hl)
   6F15 06 00         [ 7] 2109 	ld	b,#0x00
   6F17 21 F9 62      [10] 2110 	ld	hl, #(_prota + 0x0001) + 0
   6F1A 6E            [ 7] 2111 	ld	l,(hl)
   6F1B 26 00         [ 7] 2112 	ld	h,#0x00
   6F1D 79            [ 4] 2113 	ld	a,c
   6F1E 95            [ 4] 2114 	sub	a, l
   6F1F 4F            [ 4] 2115 	ld	c,a
   6F20 78            [ 4] 2116 	ld	a,b
   6F21 9C            [ 4] 2117 	sbc	a, h
   6F22 47            [ 4] 2118 	ld	b,a
   6F23 D5            [11] 2119 	push	de
   6F24 C5            [11] 2120 	push	bc
   6F25 CD 70 4A      [17] 2121 	call	_abs
   6F28 F1            [10] 2122 	pop	af
   6F29 D1            [10] 2123 	pop	de
                           2124 ;src/main.c:424: dist = difx + dify; // manhattan
   6F2A DD 4E F9      [19] 2125 	ld	c,-7 (ix)
   6F2D 09            [11] 2126 	add	hl, bc
   6F2E DD 75 FB      [19] 2127 	ld	-5 (ix),l
                           2128 ;src/main.c:425: enemy->seen = NO;
   6F31 21 12 00      [10] 2129 	ld	hl,#0x0012
   6F34 19            [11] 2130 	add	hl,de
   6F35 DD 75 FC      [19] 2131 	ld	-4 (ix),l
   6F38 DD 74 FD      [19] 2132 	ld	-3 (ix),h
   6F3B DD 6E FC      [19] 2133 	ld	l,-4 (ix)
   6F3E DD 66 FD      [19] 2134 	ld	h,-3 (ix)
   6F41 36 00         [10] 2135 	ld	(hl),#0x00
                           2136 ;src/main.c:426: enemy->in_range = NO;
   6F43 21 11 00      [10] 2137 	ld	hl,#0x0011
   6F46 19            [11] 2138 	add	hl,de
   6F47 4D            [ 4] 2139 	ld	c,l
   6F48 44            [ 4] 2140 	ld	b,h
   6F49 AF            [ 4] 2141 	xor	a, a
   6F4A 02            [ 7] 2142 	ld	(bc),a
                           2143 ;src/main.c:427: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6F4B C5            [11] 2144 	push	bc
   6F4C D5            [11] 2145 	push	de
   6F4D 21 18 5A      [10] 2146 	ld	hl,#0x5A18
   6F50 E5            [11] 2147 	push	hl
   6F51 21 00 C0      [10] 2148 	ld	hl,#0xC000
   6F54 E5            [11] 2149 	push	hl
   6F55 CD 15 5F      [17] 2150 	call	_cpct_getScreenPtr
   6F58 D1            [10] 2151 	pop	de
   6F59 C1            [10] 2152 	pop	bc
                           2153 ;src/main.c:428: if(!enemy->seek){
   6F5A D5            [11] 2154 	push	de
   6F5B FD E1         [14] 2155 	pop	iy
   6F5D FD 7E 14      [19] 2156 	ld	a,20 (iy)
   6F60 B7            [ 4] 2157 	or	a, a
   6F61 C2 E7 6F      [10] 2158 	jp	NZ,00111$
                           2159 ;src/main.c:429: if (dist <= 10) {// te detectan los sensores de proximidad
   6F64 3E 0A         [ 7] 2160 	ld	a,#0x0A
   6F66 DD 96 FB      [19] 2161 	sub	a, -5 (ix)
   6F69 38 13         [12] 2162 	jr	C,00107$
                           2163 ;src/main.c:430: enemy->in_range = 1;
   6F6B 3E 01         [ 7] 2164 	ld	a,#0x01
   6F6D 02            [ 7] 2165 	ld	(bc),a
                           2166 ;src/main.c:431: enemy->engage = 1;
   6F6E 21 16 00      [10] 2167 	ld	hl,#0x0016
   6F71 19            [11] 2168 	add	hl,de
   6F72 36 01         [10] 2169 	ld	(hl),#0x01
                           2170 ;src/main.c:432: enemy->seen = SI;
   6F74 DD 6E FC      [19] 2171 	ld	l,-4 (ix)
   6F77 DD 66 FD      [19] 2172 	ld	h,-3 (ix)
   6F7A 36 01         [10] 2173 	ld	(hl),#0x01
   6F7C 18 69         [12] 2174 	jr	00111$
   6F7E                    2175 00107$:
                           2176 ;src/main.c:433: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6F7E 21 F8 62      [10] 2177 	ld	hl, #_prota + 0
   6F81 4E            [ 7] 2178 	ld	c,(hl)
   6F82 1A            [ 7] 2179 	ld	a,(de)
   6F83 5F            [ 4] 2180 	ld	e,a
   6F84 16 00         [ 7] 2181 	ld	d,#0x00
   6F86 7B            [ 4] 2182 	ld	a,e
   6F87 C6 E7         [ 7] 2183 	add	a,#0xE7
   6F89 6F            [ 4] 2184 	ld	l,a
   6F8A 7A            [ 4] 2185 	ld	a,d
   6F8B CE FF         [ 7] 2186 	adc	a,#0xFF
   6F8D 67            [ 4] 2187 	ld	h,a
   6F8E 06 00         [ 7] 2188 	ld	b,#0x00
   6F90 7D            [ 4] 2189 	ld	a,l
   6F91 91            [ 4] 2190 	sub	a, c
   6F92 7C            [ 4] 2191 	ld	a,h
   6F93 98            [ 4] 2192 	sbc	a, b
   6F94 E2 99 6F      [10] 2193 	jp	PO, 00137$
   6F97 EE 80         [ 7] 2194 	xor	a, #0x80
   6F99                    2195 00137$:
   6F99 F2 E7 6F      [10] 2196 	jp	P,00111$
   6F9C 21 19 00      [10] 2197 	ld	hl,#0x0019
   6F9F 19            [11] 2198 	add	hl,de
   6FA0 79            [ 4] 2199 	ld	a,c
   6FA1 95            [ 4] 2200 	sub	a, l
   6FA2 78            [ 4] 2201 	ld	a,b
   6FA3 9C            [ 4] 2202 	sbc	a, h
   6FA4 E2 A9 6F      [10] 2203 	jp	PO, 00138$
   6FA7 EE 80         [ 7] 2204 	xor	a, #0x80
   6FA9                    2205 00138$:
   6FA9 F2 E7 6F      [10] 2206 	jp	P,00111$
                           2207 ;src/main.c:434: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6FAC 21 F9 62      [10] 2208 	ld	hl, #(_prota + 0x0001) + 0
   6FAF 4E            [ 7] 2209 	ld	c,(hl)
   6FB0 DD 6E FE      [19] 2210 	ld	l,-2 (ix)
   6FB3 DD 66 FF      [19] 2211 	ld	h,-1 (ix)
   6FB6 5E            [ 7] 2212 	ld	e,(hl)
   6FB7 16 00         [ 7] 2213 	ld	d,#0x00
   6FB9 7B            [ 4] 2214 	ld	a,e
   6FBA C6 CC         [ 7] 2215 	add	a,#0xCC
   6FBC 6F            [ 4] 2216 	ld	l,a
   6FBD 7A            [ 4] 2217 	ld	a,d
   6FBE CE FF         [ 7] 2218 	adc	a,#0xFF
   6FC0 67            [ 4] 2219 	ld	h,a
   6FC1 06 00         [ 7] 2220 	ld	b,#0x00
   6FC3 7D            [ 4] 2221 	ld	a,l
   6FC4 91            [ 4] 2222 	sub	a, c
   6FC5 7C            [ 4] 2223 	ld	a,h
   6FC6 98            [ 4] 2224 	sbc	a, b
   6FC7 E2 CC 6F      [10] 2225 	jp	PO, 00139$
   6FCA EE 80         [ 7] 2226 	xor	a, #0x80
   6FCC                    2227 00139$:
   6FCC F2 E7 6F      [10] 2228 	jp	P,00111$
   6FCF 21 34 00      [10] 2229 	ld	hl,#0x0034
   6FD2 19            [11] 2230 	add	hl,de
   6FD3 79            [ 4] 2231 	ld	a,c
   6FD4 95            [ 4] 2232 	sub	a, l
   6FD5 78            [ 4] 2233 	ld	a,b
   6FD6 9C            [ 4] 2234 	sbc	a, h
   6FD7 E2 DC 6F      [10] 2235 	jp	PO, 00140$
   6FDA EE 80         [ 7] 2236 	xor	a, #0x80
   6FDC                    2237 00140$:
   6FDC F2 E7 6F      [10] 2238 	jp	P,00111$
                           2239 ;src/main.c:435: enemy->seen = SI;
   6FDF DD 6E FC      [19] 2240 	ld	l,-4 (ix)
   6FE2 DD 66 FD      [19] 2241 	ld	h,-3 (ix)
   6FE5 36 01         [10] 2242 	ld	(hl),#0x01
   6FE7                    2243 00111$:
   6FE7 DD F9         [10] 2244 	ld	sp, ix
   6FE9 DD E1         [14] 2245 	pop	ix
   6FEB C9            [10] 2246 	ret
                           2247 ;src/main.c:440: void moverEnemigoSeek(TEnemy* actual){
                           2248 ;	---------------------------------
                           2249 ; Function moverEnemigoSeek
                           2250 ; ---------------------------------
   6FEC                    2251 _moverEnemigoSeek::
   6FEC DD E5         [15] 2252 	push	ix
   6FEE DD 21 00 00   [14] 2253 	ld	ix,#0
   6FF2 DD 39         [15] 2254 	add	ix,sp
   6FF4 21 F6 FF      [10] 2255 	ld	hl,#-10
   6FF7 39            [11] 2256 	add	hl,sp
   6FF8 F9            [ 6] 2257 	ld	sp,hl
                           2258 ;src/main.c:443: if(!actual->muerto){
   6FF9 DD 4E 04      [19] 2259 	ld	c,4 (ix)
   6FFC DD 46 05      [19] 2260 	ld	b,5 (ix)
   6FFF C5            [11] 2261 	push	bc
   7000 FD E1         [14] 2262 	pop	iy
   7002 FD 7E 08      [19] 2263 	ld	a, 8 (iy)
   7005 B7            [ 4] 2264 	or	a, a
   7006 C2 8C 71      [10] 2265 	jp	NZ,00114$
                           2266 ;src/main.c:445: if(actual->iter < actual->longitud_camino){
   7009 21 0E 00      [10] 2267 	ld	hl,#0x000E
   700C 09            [11] 2268 	add	hl,bc
   700D DD 75 F8      [19] 2269 	ld	-8 (ix),l
   7010 DD 74 F9      [19] 2270 	ld	-7 (ix),h
   7013 DD 6E F8      [19] 2271 	ld	l,-8 (ix)
   7016 DD 66 F9      [19] 2272 	ld	h,-7 (ix)
   7019 7E            [ 7] 2273 	ld	a,(hl)
   701A DD 77 F6      [19] 2274 	ld	-10 (ix),a
   701D 23            [ 6] 2275 	inc	hl
   701E 7E            [ 7] 2276 	ld	a,(hl)
   701F DD 77 F7      [19] 2277 	ld	-9 (ix),a
   7022 69            [ 4] 2278 	ld	l, c
   7023 60            [ 4] 2279 	ld	h, b
   7024 11 E1 00      [10] 2280 	ld	de, #0x00E1
   7027 19            [11] 2281 	add	hl, de
   7028 5E            [ 7] 2282 	ld	e,(hl)
   7029 16 00         [ 7] 2283 	ld	d,#0x00
                           2284 ;src/main.c:451: actual->y = actual->camino[actual->iter];
   702B 21 01 00      [10] 2285 	ld	hl,#0x0001
   702E 09            [11] 2286 	add	hl,bc
   702F DD 75 FB      [19] 2287 	ld	-5 (ix),l
   7032 DD 74 FC      [19] 2288 	ld	-4 (ix),h
                           2289 ;src/main.c:445: if(actual->iter < actual->longitud_camino){
   7035 DD 7E F6      [19] 2290 	ld	a,-10 (ix)
   7038 93            [ 4] 2291 	sub	a, e
   7039 DD 7E F7      [19] 2292 	ld	a,-9 (ix)
   703C 9A            [ 4] 2293 	sbc	a, d
   703D E2 42 70      [10] 2294 	jp	PO, 00136$
   7040 EE 80         [ 7] 2295 	xor	a, #0x80
   7042                    2296 00136$:
   7042 F2 D6 70      [10] 2297 	jp	P,00110$
                           2298 ;src/main.c:447: actual->mover = SI;
   7045 21 06 00      [10] 2299 	ld	hl,#0x0006
   7048 09            [11] 2300 	add	hl,bc
                           2301 ;src/main.c:449: actual->x = actual->camino[actual->iter];
   7049 79            [ 4] 2302 	ld	a,c
   704A C6 19         [ 7] 2303 	add	a, #0x19
   704C 5F            [ 4] 2304 	ld	e,a
   704D 78            [ 4] 2305 	ld	a,b
   704E CE 00         [ 7] 2306 	adc	a, #0x00
   7050 57            [ 4] 2307 	ld	d,a
                           2308 ;src/main.c:446: if(actual->iter == 0){
   7051 DD 7E F7      [19] 2309 	ld	a,-9 (ix)
   7054 DD B6 F6      [19] 2310 	or	a,-10 (ix)
   7057 20 44         [12] 2311 	jr	NZ,00102$
                           2312 ;src/main.c:447: actual->mover = SI;
   7059 36 01         [10] 2313 	ld	(hl),#0x01
                           2314 ;src/main.c:448: actual->iter = 2;
   705B DD 6E F8      [19] 2315 	ld	l,-8 (ix)
   705E DD 66 F9      [19] 2316 	ld	h,-7 (ix)
   7061 36 02         [10] 2317 	ld	(hl),#0x02
   7063 23            [ 6] 2318 	inc	hl
   7064 36 00         [10] 2319 	ld	(hl),#0x00
                           2320 ;src/main.c:449: actual->x = actual->camino[actual->iter];
   7066 DD 6E F8      [19] 2321 	ld	l,-8 (ix)
   7069 DD 66 F9      [19] 2322 	ld	h,-7 (ix)
   706C 7E            [ 7] 2323 	ld	a, (hl)
   706D 23            [ 6] 2324 	inc	hl
   706E 66            [ 7] 2325 	ld	h,(hl)
   706F 6F            [ 4] 2326 	ld	l,a
   7070 19            [11] 2327 	add	hl,de
   7071 7E            [ 7] 2328 	ld	a,(hl)
   7072 02            [ 7] 2329 	ld	(bc),a
                           2330 ;src/main.c:450: ++actual->iter;
   7073 DD 6E F8      [19] 2331 	ld	l,-8 (ix)
   7076 DD 66 F9      [19] 2332 	ld	h,-7 (ix)
   7079 4E            [ 7] 2333 	ld	c,(hl)
   707A 23            [ 6] 2334 	inc	hl
   707B 46            [ 7] 2335 	ld	b,(hl)
   707C 03            [ 6] 2336 	inc	bc
   707D DD 6E F8      [19] 2337 	ld	l,-8 (ix)
   7080 DD 66 F9      [19] 2338 	ld	h,-7 (ix)
   7083 71            [ 7] 2339 	ld	(hl),c
   7084 23            [ 6] 2340 	inc	hl
   7085 70            [ 7] 2341 	ld	(hl),b
                           2342 ;src/main.c:451: actual->y = actual->camino[actual->iter];
   7086 EB            [ 4] 2343 	ex	de,hl
   7087 09            [11] 2344 	add	hl,bc
   7088 5E            [ 7] 2345 	ld	e,(hl)
   7089 DD 6E FB      [19] 2346 	ld	l,-5 (ix)
   708C DD 66 FC      [19] 2347 	ld	h,-4 (ix)
   708F 73            [ 7] 2348 	ld	(hl),e
                           2349 ;src/main.c:452: ++actual->iter;
   7090 03            [ 6] 2350 	inc	bc
   7091 DD 6E F8      [19] 2351 	ld	l,-8 (ix)
   7094 DD 66 F9      [19] 2352 	ld	h,-7 (ix)
   7097 71            [ 7] 2353 	ld	(hl),c
   7098 23            [ 6] 2354 	inc	hl
   7099 70            [ 7] 2355 	ld	(hl),b
   709A C3 8C 71      [10] 2356 	jp	00114$
   709D                    2357 00102$:
                           2358 ;src/main.c:454: actual->mover = SI;
   709D 36 01         [10] 2359 	ld	(hl),#0x01
                           2360 ;src/main.c:455: actual->x = actual->camino[actual->iter];
   709F DD 6E F8      [19] 2361 	ld	l,-8 (ix)
   70A2 DD 66 F9      [19] 2362 	ld	h,-7 (ix)
   70A5 7E            [ 7] 2363 	ld	a, (hl)
   70A6 23            [ 6] 2364 	inc	hl
   70A7 66            [ 7] 2365 	ld	h,(hl)
   70A8 6F            [ 4] 2366 	ld	l,a
   70A9 19            [11] 2367 	add	hl,de
   70AA 7E            [ 7] 2368 	ld	a,(hl)
   70AB 02            [ 7] 2369 	ld	(bc),a
                           2370 ;src/main.c:456: ++actual->iter;
   70AC DD 6E F8      [19] 2371 	ld	l,-8 (ix)
   70AF DD 66 F9      [19] 2372 	ld	h,-7 (ix)
   70B2 4E            [ 7] 2373 	ld	c,(hl)
   70B3 23            [ 6] 2374 	inc	hl
   70B4 46            [ 7] 2375 	ld	b,(hl)
   70B5 03            [ 6] 2376 	inc	bc
   70B6 DD 6E F8      [19] 2377 	ld	l,-8 (ix)
   70B9 DD 66 F9      [19] 2378 	ld	h,-7 (ix)
   70BC 71            [ 7] 2379 	ld	(hl),c
   70BD 23            [ 6] 2380 	inc	hl
   70BE 70            [ 7] 2381 	ld	(hl),b
                           2382 ;src/main.c:457: actual->y = actual->camino[actual->iter];
   70BF EB            [ 4] 2383 	ex	de,hl
   70C0 09            [11] 2384 	add	hl,bc
   70C1 5E            [ 7] 2385 	ld	e,(hl)
   70C2 DD 6E FB      [19] 2386 	ld	l,-5 (ix)
   70C5 DD 66 FC      [19] 2387 	ld	h,-4 (ix)
   70C8 73            [ 7] 2388 	ld	(hl),e
                           2389 ;src/main.c:458: ++actual->iter;
   70C9 03            [ 6] 2390 	inc	bc
   70CA DD 6E F8      [19] 2391 	ld	l,-8 (ix)
   70CD DD 66 F9      [19] 2392 	ld	h,-7 (ix)
   70D0 71            [ 7] 2393 	ld	(hl),c
   70D1 23            [ 6] 2394 	inc	hl
   70D2 70            [ 7] 2395 	ld	(hl),b
   70D3 C3 8C 71      [10] 2396 	jp	00114$
   70D6                    2397 00110$:
                           2398 ;src/main.c:462: actual->seek = 0;
   70D6 21 14 00      [10] 2399 	ld	hl,#0x0014
   70D9 09            [11] 2400 	add	hl,bc
   70DA E3            [19] 2401 	ex	(sp), hl
   70DB E1            [10] 2402 	pop	hl
   70DC E5            [11] 2403 	push	hl
   70DD 36 00         [10] 2404 	ld	(hl),#0x00
                           2405 ;src/main.c:463: lookFor(actual);
   70DF C5            [11] 2406 	push	bc
   70E0 C5            [11] 2407 	push	bc
   70E1 CD D7 6E      [17] 2408 	call	_lookFor
   70E4 F1            [10] 2409 	pop	af
   70E5 C1            [10] 2410 	pop	bc
                           2411 ;src/main.c:464: if(!actual->seen){
   70E6 69            [ 4] 2412 	ld	l, c
   70E7 60            [ 4] 2413 	ld	h, b
   70E8 11 12 00      [10] 2414 	ld	de, #0x0012
   70EB 19            [11] 2415 	add	hl, de
   70EC 7E            [ 7] 2416 	ld	a,(hl)
   70ED DD 77 FA      [19] 2417 	ld	-6 (ix),a
                           2418 ;src/main.c:465: actual->patrolling = 1;
   70F0 21 0B 00      [10] 2419 	ld	hl,#0x000B
   70F3 09            [11] 2420 	add	hl,bc
   70F4 DD 75 FE      [19] 2421 	ld	-2 (ix),l
   70F7 DD 74 FF      [19] 2422 	ld	-1 (ix),h
                           2423 ;src/main.c:464: if(!actual->seen){
   70FA DD 7E FA      [19] 2424 	ld	a,-6 (ix)
   70FD B7            [ 4] 2425 	or	a, a
   70FE 20 3C         [12] 2426 	jr	NZ,00107$
                           2427 ;src/main.c:465: actual->patrolling = 1;
   7100 DD 6E FE      [19] 2428 	ld	l,-2 (ix)
   7103 DD 66 FF      [19] 2429 	ld	h,-1 (ix)
   7106 36 01         [10] 2430 	ld	(hl),#0x01
                           2431 ;src/main.c:466: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7108 C5            [11] 2432 	push	bc
   7109 FD E1         [14] 2433 	pop	iy
   710B FD 7E 18      [19] 2434 	ld	a,24 (iy)
   710E DD 77 FA      [19] 2435 	ld	-6 (ix),a
   7111 C5            [11] 2436 	push	bc
   7112 FD E1         [14] 2437 	pop	iy
   7114 FD 56 17      [19] 2438 	ld	d,23 (iy)
   7117 DD 6E FB      [19] 2439 	ld	l,-5 (ix)
   711A DD 66 FC      [19] 2440 	ld	h,-4 (ix)
   711D 5E            [ 7] 2441 	ld	e,(hl)
   711E 0A            [ 7] 2442 	ld	a,(bc)
   711F DD 77 FD      [19] 2443 	ld	-3 (ix),a
   7122 2A D5 63      [16] 2444 	ld	hl,(_mapa)
   7125 E5            [11] 2445 	push	hl
   7126 C5            [11] 2446 	push	bc
   7127 DD 7E FA      [19] 2447 	ld	a,-6 (ix)
   712A F5            [11] 2448 	push	af
   712B 33            [ 6] 2449 	inc	sp
   712C D5            [11] 2450 	push	de
   712D DD 7E FD      [19] 2451 	ld	a,-3 (ix)
   7130 F5            [11] 2452 	push	af
   7131 33            [ 6] 2453 	inc	sp
   7132 CD 40 43      [17] 2454 	call	_pathFinding
   7135 21 08 00      [10] 2455 	ld	hl,#8
   7138 39            [11] 2456 	add	hl,sp
   7139 F9            [ 6] 2457 	ld	sp,hl
   713A 18 46         [12] 2458 	jr	00108$
   713C                    2459 00107$:
                           2460 ;src/main.c:468: actual->patrolling = 0;
   713C DD 6E FE      [19] 2461 	ld	l,-2 (ix)
   713F DD 66 FF      [19] 2462 	ld	h,-1 (ix)
   7142 36 00         [10] 2463 	ld	(hl),#0x00
                           2464 ;src/main.c:469: if(!actual->engage){
   7144 C5            [11] 2465 	push	bc
   7145 FD E1         [14] 2466 	pop	iy
   7147 FD 7E 16      [19] 2467 	ld	a,22 (iy)
   714A B7            [ 4] 2468 	or	a, a
   714B 20 35         [12] 2469 	jr	NZ,00108$
                           2470 ;src/main.c:470: actual->seek = 1;
   714D E1            [10] 2471 	pop	hl
   714E E5            [11] 2472 	push	hl
   714F 36 01         [10] 2473 	ld	(hl),#0x01
                           2474 ;src/main.c:471: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7151 3A F9 62      [13] 2475 	ld	a,(#_prota + 1)
   7154 DD 77 FD      [19] 2476 	ld	-3 (ix),a
   7157 21 F8 62      [10] 2477 	ld	hl, #_prota + 0
   715A 5E            [ 7] 2478 	ld	e,(hl)
   715B DD 6E FB      [19] 2479 	ld	l,-5 (ix)
   715E DD 66 FC      [19] 2480 	ld	h,-4 (ix)
   7161 56            [ 7] 2481 	ld	d,(hl)
   7162 0A            [ 7] 2482 	ld	a,(bc)
   7163 DD 77 FE      [19] 2483 	ld	-2 (ix),a
   7166 2A D5 63      [16] 2484 	ld	hl,(_mapa)
   7169 E5            [11] 2485 	push	hl
   716A C5            [11] 2486 	push	bc
   716B DD 7E FD      [19] 2487 	ld	a,-3 (ix)
   716E F5            [11] 2488 	push	af
   716F 33            [ 6] 2489 	inc	sp
   7170 7B            [ 4] 2490 	ld	a,e
   7171 F5            [11] 2491 	push	af
   7172 33            [ 6] 2492 	inc	sp
   7173 D5            [11] 2493 	push	de
   7174 33            [ 6] 2494 	inc	sp
   7175 DD 7E FE      [19] 2495 	ld	a,-2 (ix)
   7178 F5            [11] 2496 	push	af
   7179 33            [ 6] 2497 	inc	sp
   717A CD 40 43      [17] 2498 	call	_pathFinding
   717D 21 08 00      [10] 2499 	ld	hl,#8
   7180 39            [11] 2500 	add	hl,sp
   7181 F9            [ 6] 2501 	ld	sp,hl
   7182                    2502 00108$:
                           2503 ;src/main.c:474: actual->iter = 0;
   7182 DD 6E F8      [19] 2504 	ld	l,-8 (ix)
   7185 DD 66 F9      [19] 2505 	ld	h,-7 (ix)
   7188 AF            [ 4] 2506 	xor	a, a
   7189 77            [ 7] 2507 	ld	(hl), a
   718A 23            [ 6] 2508 	inc	hl
   718B 77            [ 7] 2509 	ld	(hl), a
   718C                    2510 00114$:
   718C DD F9         [10] 2511 	ld	sp, ix
   718E DD E1         [14] 2512 	pop	ix
   7190 C9            [10] 2513 	ret
                           2514 ;src/main.c:481: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2515 ;	---------------------------------
                           2516 ; Function engage
                           2517 ; ---------------------------------
   7191                    2518 _engage::
   7191 DD E5         [15] 2519 	push	ix
   7193 DD 21 00 00   [14] 2520 	ld	ix,#0
   7197 DD 39         [15] 2521 	add	ix,sp
   7199 21 F1 FF      [10] 2522 	ld	hl,#-15
   719C 39            [11] 2523 	add	hl,sp
   719D F9            [ 6] 2524 	ld	sp,hl
                           2525 ;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   719E DD 7E 04      [19] 2526 	ld	a,4 (ix)
   71A1 DD 77 F4      [19] 2527 	ld	-12 (ix),a
   71A4 DD 7E 05      [19] 2528 	ld	a,5 (ix)
   71A7 DD 77 F5      [19] 2529 	ld	-11 (ix),a
   71AA DD 6E F4      [19] 2530 	ld	l,-12 (ix)
   71AD DD 66 F5      [19] 2531 	ld	h,-11 (ix)
   71B0 4E            [ 7] 2532 	ld	c,(hl)
   71B1 06 00         [ 7] 2533 	ld	b,#0x00
   71B3 21 F8 62      [10] 2534 	ld	hl,#_prota+0
   71B6 5E            [ 7] 2535 	ld	e,(hl)
   71B7 16 00         [ 7] 2536 	ld	d,#0x00
   71B9 79            [ 4] 2537 	ld	a,c
   71BA 93            [ 4] 2538 	sub	a, e
   71BB 4F            [ 4] 2539 	ld	c,a
   71BC 78            [ 4] 2540 	ld	a,b
   71BD 9A            [ 4] 2541 	sbc	a, d
   71BE 47            [ 4] 2542 	ld	b,a
   71BF C5            [11] 2543 	push	bc
   71C0 CD 70 4A      [17] 2544 	call	_abs
   71C3 F1            [10] 2545 	pop	af
   71C4 4D            [ 4] 2546 	ld	c,l
                           2547 ;src/main.c:483: u8 dify = abs(enemy->y - prota.y);
   71C5 DD 7E F4      [19] 2548 	ld	a,-12 (ix)
   71C8 C6 01         [ 7] 2549 	add	a, #0x01
   71CA DD 77 F6      [19] 2550 	ld	-10 (ix),a
   71CD DD 7E F5      [19] 2551 	ld	a,-11 (ix)
   71D0 CE 00         [ 7] 2552 	adc	a, #0x00
   71D2 DD 77 F7      [19] 2553 	ld	-9 (ix),a
   71D5 DD 6E F6      [19] 2554 	ld	l,-10 (ix)
   71D8 DD 66 F7      [19] 2555 	ld	h,-9 (ix)
   71DB 5E            [ 7] 2556 	ld	e,(hl)
   71DC 16 00         [ 7] 2557 	ld	d,#0x00
   71DE 21 F9 62      [10] 2558 	ld	hl, #_prota + 1
   71E1 6E            [ 7] 2559 	ld	l,(hl)
   71E2 26 00         [ 7] 2560 	ld	h,#0x00
   71E4 7B            [ 4] 2561 	ld	a,e
   71E5 95            [ 4] 2562 	sub	a, l
   71E6 5F            [ 4] 2563 	ld	e,a
   71E7 7A            [ 4] 2564 	ld	a,d
   71E8 9C            [ 4] 2565 	sbc	a, h
   71E9 57            [ 4] 2566 	ld	d,a
   71EA C5            [11] 2567 	push	bc
   71EB D5            [11] 2568 	push	de
   71EC CD 70 4A      [17] 2569 	call	_abs
   71EF F1            [10] 2570 	pop	af
   71F0 C1            [10] 2571 	pop	bc
                           2572 ;src/main.c:484: u8 dist = difx + dify; // manhattan
   71F1 09            [11] 2573 	add	hl, bc
   71F2 DD 75 F3      [19] 2574 	ld	-13 (ix),l
                           2575 ;src/main.c:486: u8 movX = 0;
   71F5 DD 36 F2 00   [19] 2576 	ld	-14 (ix),#0x00
                           2577 ;src/main.c:487: u8 movY = 0;
   71F9 DD 36 F1 00   [19] 2578 	ld	-15 (ix),#0x00
                           2579 ;src/main.c:488: u8 distConstraint = 25;
   71FD 0E 19         [ 7] 2580 	ld	c,#0x19
                           2581 ;src/main.c:489: enemy->mover = NO;
   71FF DD 7E F4      [19] 2582 	ld	a,-12 (ix)
   7202 C6 06         [ 7] 2583 	add	a, #0x06
   7204 DD 77 F8      [19] 2584 	ld	-8 (ix),a
   7207 DD 7E F5      [19] 2585 	ld	a,-11 (ix)
   720A CE 00         [ 7] 2586 	adc	a, #0x00
   720C DD 77 F9      [19] 2587 	ld	-7 (ix),a
   720F DD 6E F8      [19] 2588 	ld	l,-8 (ix)
   7212 DD 66 F9      [19] 2589 	ld	h,-7 (ix)
   7215 36 00         [10] 2590 	ld	(hl),#0x00
                           2591 ;src/main.c:491: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7217 DD 6E F6      [19] 2592 	ld	l,-10 (ix)
   721A DD 66 F7      [19] 2593 	ld	h,-9 (ix)
   721D 7E            [ 7] 2594 	ld	a,(hl)
   721E DD 77 FA      [19] 2595 	ld	-6 (ix),a
                           2596 ;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7221 DD 6E F4      [19] 2597 	ld	l,-12 (ix)
   7224 DD 66 F5      [19] 2598 	ld	h,-11 (ix)
   7227 46            [ 7] 2599 	ld	b,(hl)
                           2600 ;src/main.c:504: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7228 78            [ 4] 2601 	ld	a,b
   7229 C6 04         [ 7] 2602 	add	a, #0x04
   722B DD 77 FB      [19] 2603 	ld	-5 (ix),a
                           2604 ;src/main.c:491: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   722E DD 7E 07      [19] 2605 	ld	a,7 (ix)
   7231 DD 96 FA      [19] 2606 	sub	a, -6 (ix)
   7234 28 38         [12] 2607 	jr	Z,00194$
   7236 DD 5E 07      [19] 2608 	ld	e,7 (ix)
   7239 16 00         [ 7] 2609 	ld	d,#0x00
   723B 21 01 00      [10] 2610 	ld	hl,#0x0001
   723E 19            [11] 2611 	add	hl,de
   723F DD 75 FC      [19] 2612 	ld	-4 (ix),l
   7242 DD 74 FD      [19] 2613 	ld	-3 (ix),h
   7245 DD 7E FA      [19] 2614 	ld	a,-6 (ix)
   7248 DD 77 FE      [19] 2615 	ld	-2 (ix),a
   724B DD 36 FF 00   [19] 2616 	ld	-1 (ix),#0x00
   724F DD 7E FE      [19] 2617 	ld	a,-2 (ix)
   7252 DD 96 FC      [19] 2618 	sub	a, -4 (ix)
   7255 20 08         [12] 2619 	jr	NZ,00422$
   7257 DD 7E FF      [19] 2620 	ld	a,-1 (ix)
   725A DD 96 FD      [19] 2621 	sub	a, -3 (ix)
   725D 28 0F         [12] 2622 	jr	Z,00194$
   725F                    2623 00422$:
   725F 1B            [ 6] 2624 	dec	de
   7260 DD 7E FE      [19] 2625 	ld	a,-2 (ix)
   7263 93            [ 4] 2626 	sub	a, e
   7264 C2 77 73      [10] 2627 	jp	NZ,00195$
   7267 DD 7E FF      [19] 2628 	ld	a,-1 (ix)
   726A 92            [ 4] 2629 	sub	a, d
   726B C2 77 73      [10] 2630 	jp	NZ,00195$
   726E                    2631 00194$:
                           2632 ;src/main.c:492: if (dx < enemy->x) { // izquierda
   726E DD 7E 06      [19] 2633 	ld	a,6 (ix)
   7271 90            [ 4] 2634 	sub	a, b
   7272 D2 F4 72      [10] 2635 	jp	NC,00114$
                           2636 ;src/main.c:493: if (dist > 11) {
   7275 3E 0B         [ 7] 2637 	ld	a,#0x0B
   7277 DD 96 F3      [19] 2638 	sub	a, -13 (ix)
   727A D2 37 79      [10] 2639 	jp	NC,00199$
                           2640 ;src/main.c:494: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   727D DD 7E FA      [19] 2641 	ld	a,-6 (ix)
   7280 F5            [11] 2642 	push	af
   7281 33            [ 6] 2643 	inc	sp
   7282 C5            [11] 2644 	push	bc
   7283 33            [ 6] 2645 	inc	sp
   7284 2A D5 63      [16] 2646 	ld	hl,(_mapa)
   7287 E5            [11] 2647 	push	hl
   7288 CD 2C 4A      [17] 2648 	call	_getTilePtr
   728B F1            [10] 2649 	pop	af
   728C F1            [10] 2650 	pop	af
   728D 4E            [ 7] 2651 	ld	c,(hl)
   728E 3E 02         [ 7] 2652 	ld	a,#0x02
   7290 91            [ 4] 2653 	sub	a, c
   7291 DA 37 79      [10] 2654 	jp	C,00199$
                           2655 ;src/main.c:495: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7294 DD 6E F6      [19] 2656 	ld	l,-10 (ix)
   7297 DD 66 F7      [19] 2657 	ld	h,-9 (ix)
   729A 7E            [ 7] 2658 	ld	a,(hl)
   729B C6 0B         [ 7] 2659 	add	a, #0x0B
   729D 57            [ 4] 2660 	ld	d,a
   729E DD 6E F4      [19] 2661 	ld	l,-12 (ix)
   72A1 DD 66 F5      [19] 2662 	ld	h,-11 (ix)
   72A4 46            [ 7] 2663 	ld	b,(hl)
   72A5 D5            [11] 2664 	push	de
   72A6 33            [ 6] 2665 	inc	sp
   72A7 C5            [11] 2666 	push	bc
   72A8 33            [ 6] 2667 	inc	sp
   72A9 2A D5 63      [16] 2668 	ld	hl,(_mapa)
   72AC E5            [11] 2669 	push	hl
   72AD CD 2C 4A      [17] 2670 	call	_getTilePtr
   72B0 F1            [10] 2671 	pop	af
   72B1 F1            [10] 2672 	pop	af
   72B2 4E            [ 7] 2673 	ld	c,(hl)
   72B3 3E 02         [ 7] 2674 	ld	a,#0x02
   72B5 91            [ 4] 2675 	sub	a, c
   72B6 DA 37 79      [10] 2676 	jp	C,00199$
                           2677 ;src/main.c:496: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   72B9 DD 6E F6      [19] 2678 	ld	l,-10 (ix)
   72BC DD 66 F7      [19] 2679 	ld	h,-9 (ix)
   72BF 7E            [ 7] 2680 	ld	a,(hl)
   72C0 C6 16         [ 7] 2681 	add	a, #0x16
   72C2 57            [ 4] 2682 	ld	d,a
   72C3 DD 6E F4      [19] 2683 	ld	l,-12 (ix)
   72C6 DD 66 F5      [19] 2684 	ld	h,-11 (ix)
   72C9 46            [ 7] 2685 	ld	b,(hl)
   72CA D5            [11] 2686 	push	de
   72CB 33            [ 6] 2687 	inc	sp
   72CC C5            [11] 2688 	push	bc
   72CD 33            [ 6] 2689 	inc	sp
   72CE 2A D5 63      [16] 2690 	ld	hl,(_mapa)
   72D1 E5            [11] 2691 	push	hl
   72D2 CD 2C 4A      [17] 2692 	call	_getTilePtr
   72D5 F1            [10] 2693 	pop	af
   72D6 F1            [10] 2694 	pop	af
   72D7 4E            [ 7] 2695 	ld	c,(hl)
   72D8 3E 02         [ 7] 2696 	ld	a,#0x02
   72DA 91            [ 4] 2697 	sub	a, c
   72DB DA 37 79      [10] 2698 	jp	C,00199$
                           2699 ;src/main.c:497: moverEnemigoIzquierda(enemy);
   72DE DD 6E F4      [19] 2700 	ld	l,-12 (ix)
   72E1 DD 66 F5      [19] 2701 	ld	h,-11 (ix)
   72E4 E5            [11] 2702 	push	hl
   72E5 CD 84 6C      [17] 2703 	call	_moverEnemigoIzquierda
   72E8 F1            [10] 2704 	pop	af
                           2705 ;src/main.c:499: enemy->mover = SI;
   72E9 DD 6E F8      [19] 2706 	ld	l,-8 (ix)
   72EC DD 66 F9      [19] 2707 	ld	h,-7 (ix)
   72EF 36 01         [10] 2708 	ld	(hl),#0x01
   72F1 C3 37 79      [10] 2709 	jp	00199$
   72F4                    2710 00114$:
                           2711 ;src/main.c:503: if (dist > G_ENEMY_W + 3) {
   72F4 3E 07         [ 7] 2712 	ld	a,#0x07
   72F6 DD 96 F3      [19] 2713 	sub	a, -13 (ix)
   72F9 D2 37 79      [10] 2714 	jp	NC,00199$
                           2715 ;src/main.c:504: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   72FC DD 66 FA      [19] 2716 	ld	h,-6 (ix)
   72FF DD 6E FB      [19] 2717 	ld	l,-5 (ix)
   7302 E5            [11] 2718 	push	hl
   7303 2A D5 63      [16] 2719 	ld	hl,(_mapa)
   7306 E5            [11] 2720 	push	hl
   7307 CD 2C 4A      [17] 2721 	call	_getTilePtr
   730A F1            [10] 2722 	pop	af
   730B F1            [10] 2723 	pop	af
   730C 4E            [ 7] 2724 	ld	c,(hl)
   730D 3E 02         [ 7] 2725 	ld	a,#0x02
   730F 91            [ 4] 2726 	sub	a, c
   7310 DA 37 79      [10] 2727 	jp	C,00199$
                           2728 ;src/main.c:505: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7313 DD 6E F6      [19] 2729 	ld	l,-10 (ix)
   7316 DD 66 F7      [19] 2730 	ld	h,-9 (ix)
   7319 7E            [ 7] 2731 	ld	a,(hl)
   731A C6 0B         [ 7] 2732 	add	a, #0x0B
   731C 47            [ 4] 2733 	ld	b,a
   731D DD 6E F4      [19] 2734 	ld	l,-12 (ix)
   7320 DD 66 F5      [19] 2735 	ld	h,-11 (ix)
   7323 7E            [ 7] 2736 	ld	a,(hl)
   7324 C6 04         [ 7] 2737 	add	a, #0x04
   7326 C5            [11] 2738 	push	bc
   7327 33            [ 6] 2739 	inc	sp
   7328 F5            [11] 2740 	push	af
   7329 33            [ 6] 2741 	inc	sp
   732A 2A D5 63      [16] 2742 	ld	hl,(_mapa)
   732D E5            [11] 2743 	push	hl
   732E CD 2C 4A      [17] 2744 	call	_getTilePtr
   7331 F1            [10] 2745 	pop	af
   7332 F1            [10] 2746 	pop	af
   7333 4E            [ 7] 2747 	ld	c,(hl)
   7334 3E 02         [ 7] 2748 	ld	a,#0x02
   7336 91            [ 4] 2749 	sub	a, c
   7337 DA 37 79      [10] 2750 	jp	C,00199$
                           2751 ;src/main.c:506: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   733A DD 6E F6      [19] 2752 	ld	l,-10 (ix)
   733D DD 66 F7      [19] 2753 	ld	h,-9 (ix)
   7340 7E            [ 7] 2754 	ld	a,(hl)
   7341 C6 16         [ 7] 2755 	add	a, #0x16
   7343 47            [ 4] 2756 	ld	b,a
   7344 DD 6E F4      [19] 2757 	ld	l,-12 (ix)
   7347 DD 66 F5      [19] 2758 	ld	h,-11 (ix)
   734A 7E            [ 7] 2759 	ld	a,(hl)
   734B C6 04         [ 7] 2760 	add	a, #0x04
   734D C5            [11] 2761 	push	bc
   734E 33            [ 6] 2762 	inc	sp
   734F F5            [11] 2763 	push	af
   7350 33            [ 6] 2764 	inc	sp
   7351 2A D5 63      [16] 2765 	ld	hl,(_mapa)
   7354 E5            [11] 2766 	push	hl
   7355 CD 2C 4A      [17] 2767 	call	_getTilePtr
   7358 F1            [10] 2768 	pop	af
   7359 F1            [10] 2769 	pop	af
   735A 4E            [ 7] 2770 	ld	c,(hl)
   735B 3E 02         [ 7] 2771 	ld	a,#0x02
   735D 91            [ 4] 2772 	sub	a, c
   735E DA 37 79      [10] 2773 	jp	C,00199$
                           2774 ;src/main.c:507: moverEnemigoDerecha(enemy);
   7361 DD 6E F4      [19] 2775 	ld	l,-12 (ix)
   7364 DD 66 F5      [19] 2776 	ld	h,-11 (ix)
   7367 E5            [11] 2777 	push	hl
   7368 CD 74 6C      [17] 2778 	call	_moverEnemigoDerecha
   736B F1            [10] 2779 	pop	af
                           2780 ;src/main.c:509: enemy->mover = SI;
   736C DD 6E F8      [19] 2781 	ld	l,-8 (ix)
   736F DD 66 F9      [19] 2782 	ld	h,-7 (ix)
   7372 36 01         [10] 2783 	ld	(hl),#0x01
   7374 C3 37 79      [10] 2784 	jp	00199$
   7377                    2785 00195$:
                           2786 ;src/main.c:514: else if (enemy->x == dx) {
   7377 DD 7E 06      [19] 2787 	ld	a,6 (ix)
   737A 90            [ 4] 2788 	sub	a, b
   737B C2 90 74      [10] 2789 	jp	NZ,00192$
                           2790 ;src/main.c:515: if (dy < enemy->y) {
   737E DD 7E 07      [19] 2791 	ld	a,7 (ix)
   7381 DD 96 FA      [19] 2792 	sub	a, -6 (ix)
   7384 D2 0A 74      [10] 2793 	jp	NC,00129$
                           2794 ;src/main.c:516: if (dist > G_HERO_H + 5) {
   7387 3E 1B         [ 7] 2795 	ld	a,#0x1B
   7389 DD 96 F3      [19] 2796 	sub	a, -13 (ix)
   738C D2 37 79      [10] 2797 	jp	NC,00199$
                           2798 ;src/main.c:517: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   738F DD 56 FA      [19] 2799 	ld	d,-6 (ix)
   7392 15            [ 4] 2800 	dec	d
   7393 15            [ 4] 2801 	dec	d
   7394 D5            [11] 2802 	push	de
   7395 33            [ 6] 2803 	inc	sp
   7396 C5            [11] 2804 	push	bc
   7397 33            [ 6] 2805 	inc	sp
   7398 2A D5 63      [16] 2806 	ld	hl,(_mapa)
   739B E5            [11] 2807 	push	hl
   739C CD 2C 4A      [17] 2808 	call	_getTilePtr
   739F F1            [10] 2809 	pop	af
   73A0 F1            [10] 2810 	pop	af
   73A1 4E            [ 7] 2811 	ld	c,(hl)
   73A2 3E 02         [ 7] 2812 	ld	a,#0x02
   73A4 91            [ 4] 2813 	sub	a, c
   73A5 DA 37 79      [10] 2814 	jp	C,00199$
                           2815 ;src/main.c:518: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73A8 DD 6E F6      [19] 2816 	ld	l,-10 (ix)
   73AB DD 66 F7      [19] 2817 	ld	h,-9 (ix)
   73AE 56            [ 7] 2818 	ld	d,(hl)
   73AF 15            [ 4] 2819 	dec	d
   73B0 15            [ 4] 2820 	dec	d
   73B1 DD 6E F4      [19] 2821 	ld	l,-12 (ix)
   73B4 DD 66 F5      [19] 2822 	ld	h,-11 (ix)
   73B7 46            [ 7] 2823 	ld	b,(hl)
   73B8 04            [ 4] 2824 	inc	b
   73B9 04            [ 4] 2825 	inc	b
   73BA D5            [11] 2826 	push	de
   73BB 33            [ 6] 2827 	inc	sp
   73BC C5            [11] 2828 	push	bc
   73BD 33            [ 6] 2829 	inc	sp
   73BE 2A D5 63      [16] 2830 	ld	hl,(_mapa)
   73C1 E5            [11] 2831 	push	hl
   73C2 CD 2C 4A      [17] 2832 	call	_getTilePtr
   73C5 F1            [10] 2833 	pop	af
   73C6 F1            [10] 2834 	pop	af
   73C7 4E            [ 7] 2835 	ld	c,(hl)
   73C8 3E 02         [ 7] 2836 	ld	a,#0x02
   73CA 91            [ 4] 2837 	sub	a, c
   73CB DA 37 79      [10] 2838 	jp	C,00199$
                           2839 ;src/main.c:519: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73CE DD 6E F6      [19] 2840 	ld	l,-10 (ix)
   73D1 DD 66 F7      [19] 2841 	ld	h,-9 (ix)
   73D4 46            [ 7] 2842 	ld	b,(hl)
   73D5 05            [ 4] 2843 	dec	b
   73D6 05            [ 4] 2844 	dec	b
   73D7 DD 6E F4      [19] 2845 	ld	l,-12 (ix)
   73DA DD 66 F5      [19] 2846 	ld	h,-11 (ix)
   73DD 7E            [ 7] 2847 	ld	a,(hl)
   73DE C6 04         [ 7] 2848 	add	a, #0x04
   73E0 C5            [11] 2849 	push	bc
   73E1 33            [ 6] 2850 	inc	sp
   73E2 F5            [11] 2851 	push	af
   73E3 33            [ 6] 2852 	inc	sp
   73E4 2A D5 63      [16] 2853 	ld	hl,(_mapa)
   73E7 E5            [11] 2854 	push	hl
   73E8 CD 2C 4A      [17] 2855 	call	_getTilePtr
   73EB F1            [10] 2856 	pop	af
   73EC F1            [10] 2857 	pop	af
   73ED 4E            [ 7] 2858 	ld	c,(hl)
   73EE 3E 02         [ 7] 2859 	ld	a,#0x02
   73F0 91            [ 4] 2860 	sub	a, c
   73F1 DA 37 79      [10] 2861 	jp	C,00199$
                           2862 ;src/main.c:520: moverEnemigoArriba(enemy);
   73F4 DD 6E F4      [19] 2863 	ld	l,-12 (ix)
   73F7 DD 66 F5      [19] 2864 	ld	h,-11 (ix)
   73FA E5            [11] 2865 	push	hl
   73FB CD 36 6C      [17] 2866 	call	_moverEnemigoArriba
   73FE F1            [10] 2867 	pop	af
                           2868 ;src/main.c:522: enemy->mover = SI;
   73FF DD 6E F8      [19] 2869 	ld	l,-8 (ix)
   7402 DD 66 F9      [19] 2870 	ld	h,-7 (ix)
   7405 36 01         [10] 2871 	ld	(hl),#0x01
   7407 C3 37 79      [10] 2872 	jp	00199$
   740A                    2873 00129$:
                           2874 ;src/main.c:526: if(dist > G_ENEMY_H + 7) {
   740A 3E 1D         [ 7] 2875 	ld	a,#0x1D
   740C DD 96 F3      [19] 2876 	sub	a, -13 (ix)
   740F D2 37 79      [10] 2877 	jp	NC,00199$
                           2878 ;src/main.c:527: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7412 DD 7E FA      [19] 2879 	ld	a,-6 (ix)
   7415 C6 18         [ 7] 2880 	add	a, #0x18
   7417 57            [ 4] 2881 	ld	d,a
   7418 D5            [11] 2882 	push	de
   7419 33            [ 6] 2883 	inc	sp
   741A C5            [11] 2884 	push	bc
   741B 33            [ 6] 2885 	inc	sp
   741C 2A D5 63      [16] 2886 	ld	hl,(_mapa)
   741F E5            [11] 2887 	push	hl
   7420 CD 2C 4A      [17] 2888 	call	_getTilePtr
   7423 F1            [10] 2889 	pop	af
   7424 F1            [10] 2890 	pop	af
   7425 4E            [ 7] 2891 	ld	c,(hl)
   7426 3E 02         [ 7] 2892 	ld	a,#0x02
   7428 91            [ 4] 2893 	sub	a, c
   7429 DA 37 79      [10] 2894 	jp	C,00199$
                           2895 ;src/main.c:528: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   742C DD 6E F6      [19] 2896 	ld	l,-10 (ix)
   742F DD 66 F7      [19] 2897 	ld	h,-9 (ix)
   7432 7E            [ 7] 2898 	ld	a,(hl)
   7433 C6 18         [ 7] 2899 	add	a, #0x18
   7435 57            [ 4] 2900 	ld	d,a
   7436 DD 6E F4      [19] 2901 	ld	l,-12 (ix)
   7439 DD 66 F5      [19] 2902 	ld	h,-11 (ix)
   743C 46            [ 7] 2903 	ld	b,(hl)
   743D 04            [ 4] 2904 	inc	b
   743E 04            [ 4] 2905 	inc	b
   743F D5            [11] 2906 	push	de
   7440 33            [ 6] 2907 	inc	sp
   7441 C5            [11] 2908 	push	bc
   7442 33            [ 6] 2909 	inc	sp
   7443 2A D5 63      [16] 2910 	ld	hl,(_mapa)
   7446 E5            [11] 2911 	push	hl
   7447 CD 2C 4A      [17] 2912 	call	_getTilePtr
   744A F1            [10] 2913 	pop	af
   744B F1            [10] 2914 	pop	af
   744C 4E            [ 7] 2915 	ld	c,(hl)
   744D 3E 02         [ 7] 2916 	ld	a,#0x02
   744F 91            [ 4] 2917 	sub	a, c
   7450 DA 37 79      [10] 2918 	jp	C,00199$
                           2919 ;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7453 DD 6E F6      [19] 2920 	ld	l,-10 (ix)
   7456 DD 66 F7      [19] 2921 	ld	h,-9 (ix)
   7459 7E            [ 7] 2922 	ld	a,(hl)
   745A C6 18         [ 7] 2923 	add	a, #0x18
   745C 47            [ 4] 2924 	ld	b,a
   745D DD 6E F4      [19] 2925 	ld	l,-12 (ix)
   7460 DD 66 F5      [19] 2926 	ld	h,-11 (ix)
   7463 7E            [ 7] 2927 	ld	a,(hl)
   7464 C6 04         [ 7] 2928 	add	a, #0x04
   7466 C5            [11] 2929 	push	bc
   7467 33            [ 6] 2930 	inc	sp
   7468 F5            [11] 2931 	push	af
   7469 33            [ 6] 2932 	inc	sp
   746A 2A D5 63      [16] 2933 	ld	hl,(_mapa)
   746D E5            [11] 2934 	push	hl
   746E CD 2C 4A      [17] 2935 	call	_getTilePtr
   7471 F1            [10] 2936 	pop	af
   7472 F1            [10] 2937 	pop	af
   7473 4E            [ 7] 2938 	ld	c,(hl)
   7474 3E 02         [ 7] 2939 	ld	a,#0x02
   7476 91            [ 4] 2940 	sub	a, c
   7477 DA 37 79      [10] 2941 	jp	C,00199$
                           2942 ;src/main.c:530: moverEnemigoAbajo(enemy);
   747A DD 6E F4      [19] 2943 	ld	l,-12 (ix)
   747D DD 66 F5      [19] 2944 	ld	h,-11 (ix)
   7480 E5            [11] 2945 	push	hl
   7481 CD 55 6C      [17] 2946 	call	_moverEnemigoAbajo
   7484 F1            [10] 2947 	pop	af
                           2948 ;src/main.c:532: enemy->mover = SI;
   7485 DD 6E F8      [19] 2949 	ld	l,-8 (ix)
   7488 DD 66 F9      [19] 2950 	ld	h,-7 (ix)
   748B 36 01         [10] 2951 	ld	(hl),#0x01
   748D C3 37 79      [10] 2952 	jp	00199$
   7490                    2953 00192$:
                           2954 ;src/main.c:538: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7490 3A FE 62      [13] 2955 	ld	a, (#_prota + 6)
   7493 B7            [ 4] 2956 	or	a, a
   7494 20 02         [12] 2957 	jr	NZ,00132$
   7496 0E 14         [ 7] 2958 	ld	c,#0x14
   7498                    2959 00132$:
                           2960 ;src/main.c:540: if (dist > distConstraint) {
   7498 79            [ 4] 2961 	ld	a,c
   7499 DD 96 F3      [19] 2962 	sub	a, -13 (ix)
   749C D2 37 79      [10] 2963 	jp	NC,00199$
                           2964 ;src/main.c:541: if (dx + 1 < enemy->x) {
   749F DD 5E 06      [19] 2965 	ld	e,6 (ix)
   74A2 16 00         [ 7] 2966 	ld	d,#0x00
   74A4 13            [ 6] 2967 	inc	de
   74A5 DD 73 FE      [19] 2968 	ld	-2 (ix),e
   74A8 DD 72 FF      [19] 2969 	ld	-1 (ix),d
   74AB DD 70 FC      [19] 2970 	ld	-4 (ix),b
   74AE DD 36 FD 00   [19] 2971 	ld	-3 (ix),#0x00
   74B2 DD 7E FE      [19] 2972 	ld	a,-2 (ix)
   74B5 DD 96 FC      [19] 2973 	sub	a, -4 (ix)
   74B8 DD 7E FF      [19] 2974 	ld	a,-1 (ix)
   74BB DD 9E FD      [19] 2975 	sbc	a, -3 (ix)
   74BE E2 C3 74      [10] 2976 	jp	PO, 00427$
   74C1 EE 80         [ 7] 2977 	xor	a, #0x80
   74C3                    2978 00427$:
   74C3 F2 3F 75      [10] 2979 	jp	P,00144$
                           2980 ;src/main.c:542: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   74C6 DD 7E FA      [19] 2981 	ld	a,-6 (ix)
   74C9 F5            [11] 2982 	push	af
   74CA 33            [ 6] 2983 	inc	sp
   74CB C5            [11] 2984 	push	bc
   74CC 33            [ 6] 2985 	inc	sp
   74CD 2A D5 63      [16] 2986 	ld	hl,(_mapa)
   74D0 E5            [11] 2987 	push	hl
   74D1 CD 2C 4A      [17] 2988 	call	_getTilePtr
   74D4 F1            [10] 2989 	pop	af
   74D5 F1            [10] 2990 	pop	af
   74D6 4E            [ 7] 2991 	ld	c,(hl)
   74D7 3E 02         [ 7] 2992 	ld	a,#0x02
   74D9 91            [ 4] 2993 	sub	a, c
   74DA DA CC 75      [10] 2994 	jp	C,00145$
                           2995 ;src/main.c:543: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   74DD DD 6E F6      [19] 2996 	ld	l,-10 (ix)
   74E0 DD 66 F7      [19] 2997 	ld	h,-9 (ix)
   74E3 7E            [ 7] 2998 	ld	a,(hl)
   74E4 C6 0B         [ 7] 2999 	add	a, #0x0B
   74E6 DD 6E F4      [19] 3000 	ld	l,-12 (ix)
   74E9 DD 66 F5      [19] 3001 	ld	h,-11 (ix)
   74EC 46            [ 7] 3002 	ld	b,(hl)
   74ED F5            [11] 3003 	push	af
   74EE 33            [ 6] 3004 	inc	sp
   74EF C5            [11] 3005 	push	bc
   74F0 33            [ 6] 3006 	inc	sp
   74F1 2A D5 63      [16] 3007 	ld	hl,(_mapa)
   74F4 E5            [11] 3008 	push	hl
   74F5 CD 2C 4A      [17] 3009 	call	_getTilePtr
   74F8 F1            [10] 3010 	pop	af
   74F9 F1            [10] 3011 	pop	af
   74FA 4E            [ 7] 3012 	ld	c,(hl)
   74FB 3E 02         [ 7] 3013 	ld	a,#0x02
   74FD 91            [ 4] 3014 	sub	a, c
   74FE DA CC 75      [10] 3015 	jp	C,00145$
                           3016 ;src/main.c:544: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7501 DD 6E F6      [19] 3017 	ld	l,-10 (ix)
   7504 DD 66 F7      [19] 3018 	ld	h,-9 (ix)
   7507 7E            [ 7] 3019 	ld	a,(hl)
   7508 C6 16         [ 7] 3020 	add	a, #0x16
   750A DD 6E F4      [19] 3021 	ld	l,-12 (ix)
   750D DD 66 F5      [19] 3022 	ld	h,-11 (ix)
   7510 46            [ 7] 3023 	ld	b,(hl)
   7511 F5            [11] 3024 	push	af
   7512 33            [ 6] 3025 	inc	sp
   7513 C5            [11] 3026 	push	bc
   7514 33            [ 6] 3027 	inc	sp
   7515 2A D5 63      [16] 3028 	ld	hl,(_mapa)
   7518 E5            [11] 3029 	push	hl
   7519 CD 2C 4A      [17] 3030 	call	_getTilePtr
   751C F1            [10] 3031 	pop	af
   751D F1            [10] 3032 	pop	af
   751E 4E            [ 7] 3033 	ld	c,(hl)
   751F 3E 02         [ 7] 3034 	ld	a,#0x02
   7521 91            [ 4] 3035 	sub	a, c
   7522 DA CC 75      [10] 3036 	jp	C,00145$
                           3037 ;src/main.c:545: moverEnemigoIzquierda(enemy);
   7525 DD 6E F4      [19] 3038 	ld	l,-12 (ix)
   7528 DD 66 F5      [19] 3039 	ld	h,-11 (ix)
   752B E5            [11] 3040 	push	hl
   752C CD 84 6C      [17] 3041 	call	_moverEnemigoIzquierda
   752F F1            [10] 3042 	pop	af
                           3043 ;src/main.c:546: movX = 1;
   7530 DD 36 F2 01   [19] 3044 	ld	-14 (ix),#0x01
                           3045 ;src/main.c:547: enemy->mover = SI;
   7534 DD 6E F8      [19] 3046 	ld	l,-8 (ix)
   7537 DD 66 F9      [19] 3047 	ld	h,-7 (ix)
   753A 36 01         [10] 3048 	ld	(hl),#0x01
   753C C3 CC 75      [10] 3049 	jp	00145$
   753F                    3050 00144$:
                           3051 ;src/main.c:549: } else if (dx + 1 > enemy->x){
   753F DD 7E FC      [19] 3052 	ld	a,-4 (ix)
   7542 DD 96 FE      [19] 3053 	sub	a, -2 (ix)
   7545 DD 7E FD      [19] 3054 	ld	a,-3 (ix)
   7548 DD 9E FF      [19] 3055 	sbc	a, -1 (ix)
   754B E2 50 75      [10] 3056 	jp	PO, 00428$
   754E EE 80         [ 7] 3057 	xor	a, #0x80
   7550                    3058 00428$:
   7550 F2 CC 75      [10] 3059 	jp	P,00145$
                           3060 ;src/main.c:550: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7553 DD 66 FA      [19] 3061 	ld	h,-6 (ix)
   7556 DD 6E FB      [19] 3062 	ld	l,-5 (ix)
   7559 E5            [11] 3063 	push	hl
   755A 2A D5 63      [16] 3064 	ld	hl,(_mapa)
   755D E5            [11] 3065 	push	hl
   755E CD 2C 4A      [17] 3066 	call	_getTilePtr
   7561 F1            [10] 3067 	pop	af
   7562 F1            [10] 3068 	pop	af
   7563 4E            [ 7] 3069 	ld	c,(hl)
   7564 3E 02         [ 7] 3070 	ld	a,#0x02
   7566 91            [ 4] 3071 	sub	a, c
   7567 38 63         [12] 3072 	jr	C,00145$
                           3073 ;src/main.c:551: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7569 DD 6E F6      [19] 3074 	ld	l,-10 (ix)
   756C DD 66 F7      [19] 3075 	ld	h,-9 (ix)
   756F 7E            [ 7] 3076 	ld	a,(hl)
   7570 C6 0B         [ 7] 3077 	add	a, #0x0B
   7572 47            [ 4] 3078 	ld	b,a
   7573 DD 6E F4      [19] 3079 	ld	l,-12 (ix)
   7576 DD 66 F5      [19] 3080 	ld	h,-11 (ix)
   7579 7E            [ 7] 3081 	ld	a,(hl)
   757A C6 04         [ 7] 3082 	add	a, #0x04
   757C C5            [11] 3083 	push	bc
   757D 33            [ 6] 3084 	inc	sp
   757E F5            [11] 3085 	push	af
   757F 33            [ 6] 3086 	inc	sp
   7580 2A D5 63      [16] 3087 	ld	hl,(_mapa)
   7583 E5            [11] 3088 	push	hl
   7584 CD 2C 4A      [17] 3089 	call	_getTilePtr
   7587 F1            [10] 3090 	pop	af
   7588 F1            [10] 3091 	pop	af
   7589 4E            [ 7] 3092 	ld	c,(hl)
   758A 3E 02         [ 7] 3093 	ld	a,#0x02
   758C 91            [ 4] 3094 	sub	a, c
   758D 38 3D         [12] 3095 	jr	C,00145$
                           3096 ;src/main.c:552: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   758F DD 6E F6      [19] 3097 	ld	l,-10 (ix)
   7592 DD 66 F7      [19] 3098 	ld	h,-9 (ix)
   7595 7E            [ 7] 3099 	ld	a,(hl)
   7596 C6 16         [ 7] 3100 	add	a, #0x16
   7598 47            [ 4] 3101 	ld	b,a
   7599 DD 6E F4      [19] 3102 	ld	l,-12 (ix)
   759C DD 66 F5      [19] 3103 	ld	h,-11 (ix)
   759F 7E            [ 7] 3104 	ld	a,(hl)
   75A0 C6 04         [ 7] 3105 	add	a, #0x04
   75A2 C5            [11] 3106 	push	bc
   75A3 33            [ 6] 3107 	inc	sp
   75A4 F5            [11] 3108 	push	af
   75A5 33            [ 6] 3109 	inc	sp
   75A6 2A D5 63      [16] 3110 	ld	hl,(_mapa)
   75A9 E5            [11] 3111 	push	hl
   75AA CD 2C 4A      [17] 3112 	call	_getTilePtr
   75AD F1            [10] 3113 	pop	af
   75AE F1            [10] 3114 	pop	af
   75AF 4E            [ 7] 3115 	ld	c,(hl)
   75B0 3E 02         [ 7] 3116 	ld	a,#0x02
   75B2 91            [ 4] 3117 	sub	a, c
   75B3 38 17         [12] 3118 	jr	C,00145$
                           3119 ;src/main.c:553: moverEnemigoDerecha(enemy);
   75B5 DD 6E F4      [19] 3120 	ld	l,-12 (ix)
   75B8 DD 66 F5      [19] 3121 	ld	h,-11 (ix)
   75BB E5            [11] 3122 	push	hl
   75BC CD 74 6C      [17] 3123 	call	_moverEnemigoDerecha
   75BF F1            [10] 3124 	pop	af
                           3125 ;src/main.c:554: movX = 1;
   75C0 DD 36 F2 01   [19] 3126 	ld	-14 (ix),#0x01
                           3127 ;src/main.c:555: enemy->mover = SI;
   75C4 DD 6E F8      [19] 3128 	ld	l,-8 (ix)
   75C7 DD 66 F9      [19] 3129 	ld	h,-7 (ix)
   75CA 36 01         [10] 3130 	ld	(hl),#0x01
   75CC                    3131 00145$:
                           3132 ;src/main.c:558: if (dy < enemy->y) {
   75CC DD 6E F6      [19] 3133 	ld	l,-10 (ix)
   75CF DD 66 F7      [19] 3134 	ld	h,-9 (ix)
   75D2 4E            [ 7] 3135 	ld	c,(hl)
                           3136 ;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75D3 DD 6E F4      [19] 3137 	ld	l,-12 (ix)
   75D6 DD 66 F5      [19] 3138 	ld	h,-11 (ix)
   75D9 46            [ 7] 3139 	ld	b,(hl)
                           3140 ;src/main.c:558: if (dy < enemy->y) {
   75DA DD 7E 07      [19] 3141 	ld	a,7 (ix)
   75DD 91            [ 4] 3142 	sub	a, c
   75DE D2 5E 76      [10] 3143 	jp	NC,00155$
                           3144 ;src/main.c:559: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75E1 51            [ 4] 3145 	ld	d,c
   75E2 15            [ 4] 3146 	dec	d
   75E3 15            [ 4] 3147 	dec	d
   75E4 D5            [11] 3148 	push	de
   75E5 33            [ 6] 3149 	inc	sp
   75E6 C5            [11] 3150 	push	bc
   75E7 33            [ 6] 3151 	inc	sp
   75E8 2A D5 63      [16] 3152 	ld	hl,(_mapa)
   75EB E5            [11] 3153 	push	hl
   75EC CD 2C 4A      [17] 3154 	call	_getTilePtr
   75EF F1            [10] 3155 	pop	af
   75F0 F1            [10] 3156 	pop	af
   75F1 4E            [ 7] 3157 	ld	c,(hl)
   75F2 3E 02         [ 7] 3158 	ld	a,#0x02
   75F4 91            [ 4] 3159 	sub	a, c
   75F5 DA D8 76      [10] 3160 	jp	C,00156$
                           3161 ;src/main.c:560: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75F8 DD 6E F6      [19] 3162 	ld	l,-10 (ix)
   75FB DD 66 F7      [19] 3163 	ld	h,-9 (ix)
   75FE 56            [ 7] 3164 	ld	d,(hl)
   75FF 15            [ 4] 3165 	dec	d
   7600 15            [ 4] 3166 	dec	d
   7601 DD 6E F4      [19] 3167 	ld	l,-12 (ix)
   7604 DD 66 F5      [19] 3168 	ld	h,-11 (ix)
   7607 46            [ 7] 3169 	ld	b,(hl)
   7608 04            [ 4] 3170 	inc	b
   7609 04            [ 4] 3171 	inc	b
   760A D5            [11] 3172 	push	de
   760B 33            [ 6] 3173 	inc	sp
   760C C5            [11] 3174 	push	bc
   760D 33            [ 6] 3175 	inc	sp
   760E 2A D5 63      [16] 3176 	ld	hl,(_mapa)
   7611 E5            [11] 3177 	push	hl
   7612 CD 2C 4A      [17] 3178 	call	_getTilePtr
   7615 F1            [10] 3179 	pop	af
   7616 F1            [10] 3180 	pop	af
   7617 4E            [ 7] 3181 	ld	c,(hl)
   7618 3E 02         [ 7] 3182 	ld	a,#0x02
   761A 91            [ 4] 3183 	sub	a, c
   761B DA D8 76      [10] 3184 	jp	C,00156$
                           3185 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   761E DD 6E F6      [19] 3186 	ld	l,-10 (ix)
   7621 DD 66 F7      [19] 3187 	ld	h,-9 (ix)
   7624 46            [ 7] 3188 	ld	b,(hl)
   7625 05            [ 4] 3189 	dec	b
   7626 05            [ 4] 3190 	dec	b
   7627 DD 6E F4      [19] 3191 	ld	l,-12 (ix)
   762A DD 66 F5      [19] 3192 	ld	h,-11 (ix)
   762D 7E            [ 7] 3193 	ld	a,(hl)
   762E C6 04         [ 7] 3194 	add	a, #0x04
   7630 C5            [11] 3195 	push	bc
   7631 33            [ 6] 3196 	inc	sp
   7632 F5            [11] 3197 	push	af
   7633 33            [ 6] 3198 	inc	sp
   7634 2A D5 63      [16] 3199 	ld	hl,(_mapa)
   7637 E5            [11] 3200 	push	hl
   7638 CD 2C 4A      [17] 3201 	call	_getTilePtr
   763B F1            [10] 3202 	pop	af
   763C F1            [10] 3203 	pop	af
   763D 4E            [ 7] 3204 	ld	c,(hl)
   763E 3E 02         [ 7] 3205 	ld	a,#0x02
   7640 91            [ 4] 3206 	sub	a, c
   7641 DA D8 76      [10] 3207 	jp	C,00156$
                           3208 ;src/main.c:562: moverEnemigoArriba(enemy);
   7644 DD 6E F4      [19] 3209 	ld	l,-12 (ix)
   7647 DD 66 F5      [19] 3210 	ld	h,-11 (ix)
   764A E5            [11] 3211 	push	hl
   764B CD 36 6C      [17] 3212 	call	_moverEnemigoArriba
   764E F1            [10] 3213 	pop	af
                           3214 ;src/main.c:563: movY = 1;
   764F DD 36 F1 01   [19] 3215 	ld	-15 (ix),#0x01
                           3216 ;src/main.c:564: enemy->mover = SI;
   7653 DD 6E F8      [19] 3217 	ld	l,-8 (ix)
   7656 DD 66 F9      [19] 3218 	ld	h,-7 (ix)
   7659 36 01         [10] 3219 	ld	(hl),#0x01
   765B C3 D8 76      [10] 3220 	jp	00156$
   765E                    3221 00155$:
                           3222 ;src/main.c:567: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   765E 79            [ 4] 3223 	ld	a,c
   765F C6 18         [ 7] 3224 	add	a, #0x18
   7661 57            [ 4] 3225 	ld	d,a
   7662 D5            [11] 3226 	push	de
   7663 33            [ 6] 3227 	inc	sp
   7664 C5            [11] 3228 	push	bc
   7665 33            [ 6] 3229 	inc	sp
   7666 2A D5 63      [16] 3230 	ld	hl,(_mapa)
   7669 E5            [11] 3231 	push	hl
   766A CD 2C 4A      [17] 3232 	call	_getTilePtr
   766D F1            [10] 3233 	pop	af
   766E F1            [10] 3234 	pop	af
   766F 4E            [ 7] 3235 	ld	c,(hl)
   7670 3E 02         [ 7] 3236 	ld	a,#0x02
   7672 91            [ 4] 3237 	sub	a, c
   7673 38 63         [12] 3238 	jr	C,00156$
                           3239 ;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7675 DD 6E F6      [19] 3240 	ld	l,-10 (ix)
   7678 DD 66 F7      [19] 3241 	ld	h,-9 (ix)
   767B 7E            [ 7] 3242 	ld	a,(hl)
   767C C6 18         [ 7] 3243 	add	a, #0x18
   767E 57            [ 4] 3244 	ld	d,a
   767F DD 6E F4      [19] 3245 	ld	l,-12 (ix)
   7682 DD 66 F5      [19] 3246 	ld	h,-11 (ix)
   7685 46            [ 7] 3247 	ld	b,(hl)
   7686 04            [ 4] 3248 	inc	b
   7687 04            [ 4] 3249 	inc	b
   7688 D5            [11] 3250 	push	de
   7689 33            [ 6] 3251 	inc	sp
   768A C5            [11] 3252 	push	bc
   768B 33            [ 6] 3253 	inc	sp
   768C 2A D5 63      [16] 3254 	ld	hl,(_mapa)
   768F E5            [11] 3255 	push	hl
   7690 CD 2C 4A      [17] 3256 	call	_getTilePtr
   7693 F1            [10] 3257 	pop	af
   7694 F1            [10] 3258 	pop	af
   7695 4E            [ 7] 3259 	ld	c,(hl)
   7696 3E 02         [ 7] 3260 	ld	a,#0x02
   7698 91            [ 4] 3261 	sub	a, c
   7699 38 3D         [12] 3262 	jr	C,00156$
                           3263 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   769B DD 6E F6      [19] 3264 	ld	l,-10 (ix)
   769E DD 66 F7      [19] 3265 	ld	h,-9 (ix)
   76A1 7E            [ 7] 3266 	ld	a,(hl)
   76A2 C6 18         [ 7] 3267 	add	a, #0x18
   76A4 47            [ 4] 3268 	ld	b,a
   76A5 DD 6E F4      [19] 3269 	ld	l,-12 (ix)
   76A8 DD 66 F5      [19] 3270 	ld	h,-11 (ix)
   76AB 7E            [ 7] 3271 	ld	a,(hl)
   76AC C6 04         [ 7] 3272 	add	a, #0x04
   76AE C5            [11] 3273 	push	bc
   76AF 33            [ 6] 3274 	inc	sp
   76B0 F5            [11] 3275 	push	af
   76B1 33            [ 6] 3276 	inc	sp
   76B2 2A D5 63      [16] 3277 	ld	hl,(_mapa)
   76B5 E5            [11] 3278 	push	hl
   76B6 CD 2C 4A      [17] 3279 	call	_getTilePtr
   76B9 F1            [10] 3280 	pop	af
   76BA F1            [10] 3281 	pop	af
   76BB 4E            [ 7] 3282 	ld	c,(hl)
   76BC 3E 02         [ 7] 3283 	ld	a,#0x02
   76BE 91            [ 4] 3284 	sub	a, c
   76BF 38 17         [12] 3285 	jr	C,00156$
                           3286 ;src/main.c:570: moverEnemigoAbajo(enemy);
   76C1 DD 6E F4      [19] 3287 	ld	l,-12 (ix)
   76C4 DD 66 F5      [19] 3288 	ld	h,-11 (ix)
   76C7 E5            [11] 3289 	push	hl
   76C8 CD 55 6C      [17] 3290 	call	_moverEnemigoAbajo
   76CB F1            [10] 3291 	pop	af
                           3292 ;src/main.c:571: movY = 1;
   76CC DD 36 F1 01   [19] 3293 	ld	-15 (ix),#0x01
                           3294 ;src/main.c:572: enemy->mover = SI;
   76D0 DD 6E F8      [19] 3295 	ld	l,-8 (ix)
   76D3 DD 66 F9      [19] 3296 	ld	h,-7 (ix)
   76D6 36 01         [10] 3297 	ld	(hl),#0x01
   76D8                    3298 00156$:
                           3299 ;src/main.c:575: if (!enemy->mover) {
   76D8 DD 6E F8      [19] 3300 	ld	l,-8 (ix)
   76DB DD 66 F9      [19] 3301 	ld	h,-7 (ix)
   76DE 7E            [ 7] 3302 	ld	a,(hl)
   76DF B7            [ 4] 3303 	or	a, a
   76E0 C2 37 79      [10] 3304 	jp	NZ,00199$
                           3305 ;src/main.c:576: if (!movX) {
   76E3 DD 7E F2      [19] 3306 	ld	a,-14 (ix)
   76E6 B7            [ 4] 3307 	or	a, a
   76E7 C2 10 78      [10] 3308 	jp	NZ,00171$
                           3309 ;src/main.c:577: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76EA DD 6E F6      [19] 3310 	ld	l,-10 (ix)
   76ED DD 66 F7      [19] 3311 	ld	h,-9 (ix)
   76F0 5E            [ 7] 3312 	ld	e,(hl)
                           3313 ;src/main.c:482: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   76F1 DD 6E F4      [19] 3314 	ld	l,-12 (ix)
   76F4 DD 66 F5      [19] 3315 	ld	h,-11 (ix)
   76F7 4E            [ 7] 3316 	ld	c,(hl)
                           3317 ;src/main.c:577: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76F8 3E 70         [ 7] 3318 	ld	a,#0x70
   76FA 93            [ 4] 3319 	sub	a, e
   76FB D2 8B 77      [10] 3320 	jp	NC,00168$
                           3321 ;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   76FE 7B            [ 4] 3322 	ld	a,e
   76FF C6 18         [ 7] 3323 	add	a, #0x18
   7701 47            [ 4] 3324 	ld	b,a
   7702 C5            [11] 3325 	push	bc
   7703 2A D5 63      [16] 3326 	ld	hl,(_mapa)
   7706 E5            [11] 3327 	push	hl
   7707 CD 2C 4A      [17] 3328 	call	_getTilePtr
   770A F1            [10] 3329 	pop	af
   770B F1            [10] 3330 	pop	af
   770C 4E            [ 7] 3331 	ld	c,(hl)
   770D 3E 02         [ 7] 3332 	ld	a,#0x02
   770F 91            [ 4] 3333 	sub	a, c
   7710 38 63         [12] 3334 	jr	C,00158$
                           3335 ;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7712 DD 6E F6      [19] 3336 	ld	l,-10 (ix)
   7715 DD 66 F7      [19] 3337 	ld	h,-9 (ix)
   7718 7E            [ 7] 3338 	ld	a,(hl)
   7719 C6 18         [ 7] 3339 	add	a, #0x18
   771B 57            [ 4] 3340 	ld	d,a
   771C DD 6E F4      [19] 3341 	ld	l,-12 (ix)
   771F DD 66 F5      [19] 3342 	ld	h,-11 (ix)
   7722 4E            [ 7] 3343 	ld	c,(hl)
   7723 41            [ 4] 3344 	ld	b,c
   7724 04            [ 4] 3345 	inc	b
   7725 04            [ 4] 3346 	inc	b
   7726 D5            [11] 3347 	push	de
   7727 33            [ 6] 3348 	inc	sp
   7728 C5            [11] 3349 	push	bc
   7729 33            [ 6] 3350 	inc	sp
   772A 2A D5 63      [16] 3351 	ld	hl,(_mapa)
   772D E5            [11] 3352 	push	hl
   772E CD 2C 4A      [17] 3353 	call	_getTilePtr
   7731 F1            [10] 3354 	pop	af
   7732 F1            [10] 3355 	pop	af
   7733 4E            [ 7] 3356 	ld	c,(hl)
   7734 3E 02         [ 7] 3357 	ld	a,#0x02
   7736 91            [ 4] 3358 	sub	a, c
   7737 38 3C         [12] 3359 	jr	C,00158$
                           3360 ;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7739 DD 6E F6      [19] 3361 	ld	l,-10 (ix)
   773C DD 66 F7      [19] 3362 	ld	h,-9 (ix)
   773F 7E            [ 7] 3363 	ld	a,(hl)
   7740 C6 18         [ 7] 3364 	add	a, #0x18
   7742 47            [ 4] 3365 	ld	b,a
   7743 DD 6E F4      [19] 3366 	ld	l,-12 (ix)
   7746 DD 66 F5      [19] 3367 	ld	h,-11 (ix)
   7749 7E            [ 7] 3368 	ld	a,(hl)
   774A C6 04         [ 7] 3369 	add	a, #0x04
   774C C5            [11] 3370 	push	bc
   774D 33            [ 6] 3371 	inc	sp
   774E F5            [11] 3372 	push	af
   774F 33            [ 6] 3373 	inc	sp
   7750 2A D5 63      [16] 3374 	ld	hl,(_mapa)
   7753 E5            [11] 3375 	push	hl
   7754 CD 2C 4A      [17] 3376 	call	_getTilePtr
   7757 F1            [10] 3377 	pop	af
   7758 F1            [10] 3378 	pop	af
   7759 4E            [ 7] 3379 	ld	c,(hl)
   775A 3E 02         [ 7] 3380 	ld	a,#0x02
   775C 91            [ 4] 3381 	sub	a, c
   775D 38 16         [12] 3382 	jr	C,00158$
                           3383 ;src/main.c:581: moverEnemigoAbajo(enemy);
   775F DD 6E F4      [19] 3384 	ld	l,-12 (ix)
   7762 DD 66 F5      [19] 3385 	ld	h,-11 (ix)
   7765 E5            [11] 3386 	push	hl
   7766 CD 55 6C      [17] 3387 	call	_moverEnemigoAbajo
   7769 F1            [10] 3388 	pop	af
                           3389 ;src/main.c:582: enemy->mover = SI;
   776A DD 6E F8      [19] 3390 	ld	l,-8 (ix)
   776D DD 66 F9      [19] 3391 	ld	h,-7 (ix)
   7770 36 01         [10] 3392 	ld	(hl),#0x01
   7772 C3 10 78      [10] 3393 	jp	00171$
   7775                    3394 00158$:
                           3395 ;src/main.c:584: moverEnemigoArriba(enemy);
   7775 DD 6E F4      [19] 3396 	ld	l,-12 (ix)
   7778 DD 66 F5      [19] 3397 	ld	h,-11 (ix)
   777B E5            [11] 3398 	push	hl
   777C CD 36 6C      [17] 3399 	call	_moverEnemigoArriba
   777F F1            [10] 3400 	pop	af
                           3401 ;src/main.c:585: enemy->mover = SI;
   7780 DD 6E F8      [19] 3402 	ld	l,-8 (ix)
   7783 DD 66 F9      [19] 3403 	ld	h,-7 (ix)
   7786 36 01         [10] 3404 	ld	(hl),#0x01
   7788 C3 10 78      [10] 3405 	jp	00171$
   778B                    3406 00168$:
                           3407 ;src/main.c:588: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   778B 43            [ 4] 3408 	ld	b,e
   778C 05            [ 4] 3409 	dec	b
   778D 05            [ 4] 3410 	dec	b
   778E C5            [11] 3411 	push	bc
   778F 2A D5 63      [16] 3412 	ld	hl,(_mapa)
   7792 E5            [11] 3413 	push	hl
   7793 CD 2C 4A      [17] 3414 	call	_getTilePtr
   7796 F1            [10] 3415 	pop	af
   7797 F1            [10] 3416 	pop	af
   7798 4E            [ 7] 3417 	ld	c,(hl)
   7799 3E 02         [ 7] 3418 	ld	a,#0x02
   779B 91            [ 4] 3419 	sub	a, c
   779C 38 5F         [12] 3420 	jr	C,00163$
                           3421 ;src/main.c:589: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   779E DD 6E F6      [19] 3422 	ld	l,-10 (ix)
   77A1 DD 66 F7      [19] 3423 	ld	h,-9 (ix)
   77A4 56            [ 7] 3424 	ld	d,(hl)
   77A5 15            [ 4] 3425 	dec	d
   77A6 15            [ 4] 3426 	dec	d
   77A7 DD 6E F4      [19] 3427 	ld	l,-12 (ix)
   77AA DD 66 F5      [19] 3428 	ld	h,-11 (ix)
   77AD 46            [ 7] 3429 	ld	b,(hl)
   77AE 04            [ 4] 3430 	inc	b
   77AF 04            [ 4] 3431 	inc	b
   77B0 D5            [11] 3432 	push	de
   77B1 33            [ 6] 3433 	inc	sp
   77B2 C5            [11] 3434 	push	bc
   77B3 33            [ 6] 3435 	inc	sp
   77B4 2A D5 63      [16] 3436 	ld	hl,(_mapa)
   77B7 E5            [11] 3437 	push	hl
   77B8 CD 2C 4A      [17] 3438 	call	_getTilePtr
   77BB F1            [10] 3439 	pop	af
   77BC F1            [10] 3440 	pop	af
   77BD 4E            [ 7] 3441 	ld	c,(hl)
   77BE 3E 02         [ 7] 3442 	ld	a,#0x02
   77C0 91            [ 4] 3443 	sub	a, c
   77C1 38 3A         [12] 3444 	jr	C,00163$
                           3445 ;src/main.c:590: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   77C3 DD 6E F6      [19] 3446 	ld	l,-10 (ix)
   77C6 DD 66 F7      [19] 3447 	ld	h,-9 (ix)
   77C9 46            [ 7] 3448 	ld	b,(hl)
   77CA 05            [ 4] 3449 	dec	b
   77CB 05            [ 4] 3450 	dec	b
   77CC DD 6E F4      [19] 3451 	ld	l,-12 (ix)
   77CF DD 66 F5      [19] 3452 	ld	h,-11 (ix)
   77D2 7E            [ 7] 3453 	ld	a,(hl)
   77D3 C6 04         [ 7] 3454 	add	a, #0x04
   77D5 C5            [11] 3455 	push	bc
   77D6 33            [ 6] 3456 	inc	sp
   77D7 F5            [11] 3457 	push	af
   77D8 33            [ 6] 3458 	inc	sp
   77D9 2A D5 63      [16] 3459 	ld	hl,(_mapa)
   77DC E5            [11] 3460 	push	hl
   77DD CD 2C 4A      [17] 3461 	call	_getTilePtr
   77E0 F1            [10] 3462 	pop	af
   77E1 F1            [10] 3463 	pop	af
   77E2 4E            [ 7] 3464 	ld	c,(hl)
   77E3 3E 02         [ 7] 3465 	ld	a,#0x02
   77E5 91            [ 4] 3466 	sub	a, c
   77E6 38 15         [12] 3467 	jr	C,00163$
                           3468 ;src/main.c:591: moverEnemigoArriba(enemy);
   77E8 DD 6E F4      [19] 3469 	ld	l,-12 (ix)
   77EB DD 66 F5      [19] 3470 	ld	h,-11 (ix)
   77EE E5            [11] 3471 	push	hl
   77EF CD 36 6C      [17] 3472 	call	_moverEnemigoArriba
   77F2 F1            [10] 3473 	pop	af
                           3474 ;src/main.c:592: enemy->mover = SI;
   77F3 DD 6E F8      [19] 3475 	ld	l,-8 (ix)
   77F6 DD 66 F9      [19] 3476 	ld	h,-7 (ix)
   77F9 36 01         [10] 3477 	ld	(hl),#0x01
   77FB 18 13         [12] 3478 	jr	00171$
   77FD                    3479 00163$:
                           3480 ;src/main.c:594: moverEnemigoAbajo(enemy);
   77FD DD 6E F4      [19] 3481 	ld	l,-12 (ix)
   7800 DD 66 F5      [19] 3482 	ld	h,-11 (ix)
   7803 E5            [11] 3483 	push	hl
   7804 CD 55 6C      [17] 3484 	call	_moverEnemigoAbajo
   7807 F1            [10] 3485 	pop	af
                           3486 ;src/main.c:595: enemy->mover = SI;
   7808 DD 6E F8      [19] 3487 	ld	l,-8 (ix)
   780B DD 66 F9      [19] 3488 	ld	h,-7 (ix)
   780E 36 01         [10] 3489 	ld	(hl),#0x01
   7810                    3490 00171$:
                           3491 ;src/main.c:600: if (!movY) {
   7810 DD 7E F1      [19] 3492 	ld	a,-15 (ix)
   7813 B7            [ 4] 3493 	or	a, a
   7814 C2 37 79      [10] 3494 	jp	NZ,00199$
                           3495 ;src/main.c:601: if (enemy->x < ANCHO_PANTALLA/2) {
   7817 DD 6E F4      [19] 3496 	ld	l,-12 (ix)
   781A DD 66 F5      [19] 3497 	ld	h,-11 (ix)
   781D 4E            [ 7] 3498 	ld	c,(hl)
                           3499 ;src/main.c:483: u8 dify = abs(enemy->y - prota.y);
   781E DD 6E F6      [19] 3500 	ld	l,-10 (ix)
   7821 DD 66 F7      [19] 3501 	ld	h,-9 (ix)
   7824 46            [ 7] 3502 	ld	b,(hl)
                           3503 ;src/main.c:601: if (enemy->x < ANCHO_PANTALLA/2) {
   7825 79            [ 4] 3504 	ld	a,c
   7826 D6 28         [ 7] 3505 	sub	a, #0x28
   7828 D2 AD 78      [10] 3506 	jp	NC,00183$
                           3507 ;src/main.c:602: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   782B C5            [11] 3508 	push	bc
   782C 2A D5 63      [16] 3509 	ld	hl,(_mapa)
   782F E5            [11] 3510 	push	hl
   7830 CD 2C 4A      [17] 3511 	call	_getTilePtr
   7833 F1            [10] 3512 	pop	af
   7834 F1            [10] 3513 	pop	af
   7835 4E            [ 7] 3514 	ld	c,(hl)
   7836 3E 02         [ 7] 3515 	ld	a,#0x02
   7838 91            [ 4] 3516 	sub	a, c
   7839 38 5C         [12] 3517 	jr	C,00173$
                           3518 ;src/main.c:603: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   783B DD 6E F6      [19] 3519 	ld	l,-10 (ix)
   783E DD 66 F7      [19] 3520 	ld	h,-9 (ix)
   7841 7E            [ 7] 3521 	ld	a,(hl)
   7842 C6 0B         [ 7] 3522 	add	a, #0x0B
   7844 DD 6E F4      [19] 3523 	ld	l,-12 (ix)
   7847 DD 66 F5      [19] 3524 	ld	h,-11 (ix)
   784A 46            [ 7] 3525 	ld	b,(hl)
   784B F5            [11] 3526 	push	af
   784C 33            [ 6] 3527 	inc	sp
   784D C5            [11] 3528 	push	bc
   784E 33            [ 6] 3529 	inc	sp
   784F 2A D5 63      [16] 3530 	ld	hl,(_mapa)
   7852 E5            [11] 3531 	push	hl
   7853 CD 2C 4A      [17] 3532 	call	_getTilePtr
   7856 F1            [10] 3533 	pop	af
   7857 F1            [10] 3534 	pop	af
   7858 4E            [ 7] 3535 	ld	c,(hl)
   7859 3E 02         [ 7] 3536 	ld	a,#0x02
   785B 91            [ 4] 3537 	sub	a, c
   785C 38 39         [12] 3538 	jr	C,00173$
                           3539 ;src/main.c:604: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   785E DD 6E F6      [19] 3540 	ld	l,-10 (ix)
   7861 DD 66 F7      [19] 3541 	ld	h,-9 (ix)
   7864 7E            [ 7] 3542 	ld	a,(hl)
   7865 C6 16         [ 7] 3543 	add	a, #0x16
   7867 DD 6E F4      [19] 3544 	ld	l,-12 (ix)
   786A DD 66 F5      [19] 3545 	ld	h,-11 (ix)
   786D 46            [ 7] 3546 	ld	b,(hl)
   786E F5            [11] 3547 	push	af
   786F 33            [ 6] 3548 	inc	sp
   7870 C5            [11] 3549 	push	bc
   7871 33            [ 6] 3550 	inc	sp
   7872 2A D5 63      [16] 3551 	ld	hl,(_mapa)
   7875 E5            [11] 3552 	push	hl
   7876 CD 2C 4A      [17] 3553 	call	_getTilePtr
   7879 F1            [10] 3554 	pop	af
   787A F1            [10] 3555 	pop	af
   787B 4E            [ 7] 3556 	ld	c,(hl)
   787C 3E 02         [ 7] 3557 	ld	a,#0x02
   787E 91            [ 4] 3558 	sub	a, c
   787F 38 16         [12] 3559 	jr	C,00173$
                           3560 ;src/main.c:605: moverEnemigoIzquierda(enemy);
   7881 DD 6E F4      [19] 3561 	ld	l,-12 (ix)
   7884 DD 66 F5      [19] 3562 	ld	h,-11 (ix)
   7887 E5            [11] 3563 	push	hl
   7888 CD 84 6C      [17] 3564 	call	_moverEnemigoIzquierda
   788B F1            [10] 3565 	pop	af
                           3566 ;src/main.c:606: enemy->mover = SI;
   788C DD 6E F8      [19] 3567 	ld	l,-8 (ix)
   788F DD 66 F9      [19] 3568 	ld	h,-7 (ix)
   7892 36 01         [10] 3569 	ld	(hl),#0x01
   7894 C3 37 79      [10] 3570 	jp	00199$
   7897                    3571 00173$:
                           3572 ;src/main.c:608: moverEnemigoDerecha(enemy);
   7897 DD 6E F4      [19] 3573 	ld	l,-12 (ix)
   789A DD 66 F5      [19] 3574 	ld	h,-11 (ix)
   789D E5            [11] 3575 	push	hl
   789E CD 74 6C      [17] 3576 	call	_moverEnemigoDerecha
   78A1 F1            [10] 3577 	pop	af
                           3578 ;src/main.c:609: enemy->mover = SI;
   78A2 DD 6E F8      [19] 3579 	ld	l,-8 (ix)
   78A5 DD 66 F9      [19] 3580 	ld	h,-7 (ix)
   78A8 36 01         [10] 3581 	ld	(hl),#0x01
   78AA C3 37 79      [10] 3582 	jp	00199$
   78AD                    3583 00183$:
                           3584 ;src/main.c:612: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   78AD 79            [ 4] 3585 	ld	a,c
   78AE C6 04         [ 7] 3586 	add	a, #0x04
   78B0 C5            [11] 3587 	push	bc
   78B1 33            [ 6] 3588 	inc	sp
   78B2 F5            [11] 3589 	push	af
   78B3 33            [ 6] 3590 	inc	sp
   78B4 2A D5 63      [16] 3591 	ld	hl,(_mapa)
   78B7 E5            [11] 3592 	push	hl
   78B8 CD 2C 4A      [17] 3593 	call	_getTilePtr
   78BB F1            [10] 3594 	pop	af
   78BC F1            [10] 3595 	pop	af
   78BD 4E            [ 7] 3596 	ld	c,(hl)
   78BE 3E 02         [ 7] 3597 	ld	a,#0x02
   78C0 91            [ 4] 3598 	sub	a, c
   78C1 38 61         [12] 3599 	jr	C,00178$
                           3600 ;src/main.c:613: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78C3 DD 6E F6      [19] 3601 	ld	l,-10 (ix)
   78C6 DD 66 F7      [19] 3602 	ld	h,-9 (ix)
   78C9 7E            [ 7] 3603 	ld	a,(hl)
   78CA C6 0B         [ 7] 3604 	add	a, #0x0B
   78CC 47            [ 4] 3605 	ld	b,a
   78CD DD 6E F4      [19] 3606 	ld	l,-12 (ix)
   78D0 DD 66 F5      [19] 3607 	ld	h,-11 (ix)
   78D3 7E            [ 7] 3608 	ld	a,(hl)
   78D4 C6 04         [ 7] 3609 	add	a, #0x04
   78D6 C5            [11] 3610 	push	bc
   78D7 33            [ 6] 3611 	inc	sp
   78D8 F5            [11] 3612 	push	af
   78D9 33            [ 6] 3613 	inc	sp
   78DA 2A D5 63      [16] 3614 	ld	hl,(_mapa)
   78DD E5            [11] 3615 	push	hl
   78DE CD 2C 4A      [17] 3616 	call	_getTilePtr
   78E1 F1            [10] 3617 	pop	af
   78E2 F1            [10] 3618 	pop	af
   78E3 4E            [ 7] 3619 	ld	c,(hl)
   78E4 3E 02         [ 7] 3620 	ld	a,#0x02
   78E6 91            [ 4] 3621 	sub	a, c
   78E7 38 3B         [12] 3622 	jr	C,00178$
                           3623 ;src/main.c:614: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78E9 DD 6E F6      [19] 3624 	ld	l,-10 (ix)
   78EC DD 66 F7      [19] 3625 	ld	h,-9 (ix)
   78EF 7E            [ 7] 3626 	ld	a,(hl)
   78F0 C6 16         [ 7] 3627 	add	a, #0x16
   78F2 47            [ 4] 3628 	ld	b,a
   78F3 DD 6E F4      [19] 3629 	ld	l,-12 (ix)
   78F6 DD 66 F5      [19] 3630 	ld	h,-11 (ix)
   78F9 7E            [ 7] 3631 	ld	a,(hl)
   78FA C6 04         [ 7] 3632 	add	a, #0x04
   78FC C5            [11] 3633 	push	bc
   78FD 33            [ 6] 3634 	inc	sp
   78FE F5            [11] 3635 	push	af
   78FF 33            [ 6] 3636 	inc	sp
   7900 2A D5 63      [16] 3637 	ld	hl,(_mapa)
   7903 E5            [11] 3638 	push	hl
   7904 CD 2C 4A      [17] 3639 	call	_getTilePtr
   7907 F1            [10] 3640 	pop	af
   7908 F1            [10] 3641 	pop	af
   7909 4E            [ 7] 3642 	ld	c,(hl)
   790A 3E 02         [ 7] 3643 	ld	a,#0x02
   790C 91            [ 4] 3644 	sub	a, c
   790D 38 15         [12] 3645 	jr	C,00178$
                           3646 ;src/main.c:615: moverEnemigoDerecha(enemy);
   790F DD 6E F4      [19] 3647 	ld	l,-12 (ix)
   7912 DD 66 F5      [19] 3648 	ld	h,-11 (ix)
   7915 E5            [11] 3649 	push	hl
   7916 CD 74 6C      [17] 3650 	call	_moverEnemigoDerecha
   7919 F1            [10] 3651 	pop	af
                           3652 ;src/main.c:616: enemy->mover = SI;
   791A DD 6E F8      [19] 3653 	ld	l,-8 (ix)
   791D DD 66 F9      [19] 3654 	ld	h,-7 (ix)
   7920 36 01         [10] 3655 	ld	(hl),#0x01
   7922 18 13         [12] 3656 	jr	00199$
   7924                    3657 00178$:
                           3658 ;src/main.c:619: moverEnemigoIzquierda(enemy);
   7924 DD 6E F4      [19] 3659 	ld	l,-12 (ix)
   7927 DD 66 F5      [19] 3660 	ld	h,-11 (ix)
   792A E5            [11] 3661 	push	hl
   792B CD 84 6C      [17] 3662 	call	_moverEnemigoIzquierda
   792E F1            [10] 3663 	pop	af
                           3664 ;src/main.c:620: enemy->mover = SI;
   792F DD 6E F8      [19] 3665 	ld	l,-8 (ix)
   7932 DD 66 F9      [19] 3666 	ld	h,-7 (ix)
   7935 36 01         [10] 3667 	ld	(hl),#0x01
   7937                    3668 00199$:
   7937 DD F9         [10] 3669 	ld	sp, ix
   7939 DD E1         [14] 3670 	pop	ix
   793B C9            [10] 3671 	ret
                           3672 ;src/main.c:629: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3673 ;	---------------------------------
                           3674 ; Function updateEnemy
                           3675 ; ---------------------------------
   793C                    3676 _updateEnemy::
   793C DD E5         [15] 3677 	push	ix
   793E DD 21 00 00   [14] 3678 	ld	ix,#0
   7942 DD 39         [15] 3679 	add	ix,sp
   7944 21 F4 FF      [10] 3680 	ld	hl,#-12
   7947 39            [11] 3681 	add	hl,sp
   7948 F9            [ 6] 3682 	ld	sp,hl
                           3683 ;src/main.c:636: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7949 DD 4E 04      [19] 3684 	ld	c,4 (ix)
   794C DD 46 05      [19] 3685 	ld	b,5 (ix)
   794F 21 16 00      [10] 3686 	ld	hl,#0x0016
   7952 09            [11] 3687 	add	hl,bc
   7953 DD 75 F5      [19] 3688 	ld	-11 (ix),l
   7956 DD 74 F6      [19] 3689 	ld	-10 (ix),h
   7959 DD 6E F5      [19] 3690 	ld	l,-11 (ix)
   795C DD 66 F6      [19] 3691 	ld	h,-10 (ix)
   795F 7E            [ 7] 3692 	ld	a,(hl)
   7960 B7            [ 4] 3693 	or	a, a
   7961 28 14         [12] 3694 	jr	Z,00115$
                           3695 ;src/main.c:637: engage(actual, prota.x, prota.y);
   7963 3A F9 62      [13] 3696 	ld	a, (#_prota + 1)
   7966 21 F8 62      [10] 3697 	ld	hl, #_prota + 0
   7969 56            [ 7] 3698 	ld	d,(hl)
   796A F5            [11] 3699 	push	af
   796B 33            [ 6] 3700 	inc	sp
   796C D5            [11] 3701 	push	de
   796D 33            [ 6] 3702 	inc	sp
   796E C5            [11] 3703 	push	bc
   796F CD 91 71      [17] 3704 	call	_engage
   7972 F1            [10] 3705 	pop	af
   7973 F1            [10] 3706 	pop	af
   7974 C3 9F 7A      [10] 3707 	jp	00117$
   7977                    3708 00115$:
                           3709 ;src/main.c:639: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7977 C5            [11] 3710 	push	bc
   7978 C5            [11] 3711 	push	bc
   7979 CD D7 6E      [17] 3712 	call	_lookFor
   797C F1            [10] 3713 	pop	af
   797D C1            [10] 3714 	pop	bc
                           3715 ;src/main.c:645: actual->patrolling = 0;
   797E 21 0B 00      [10] 3716 	ld	hl,#0x000B
   7981 09            [11] 3717 	add	hl,bc
   7982 DD 75 FE      [19] 3718 	ld	-2 (ix),l
   7985 DD 74 FF      [19] 3719 	ld	-1 (ix),h
                           3720 ;src/main.c:640: if (actual->patrolling) {
   7988 DD 6E FE      [19] 3721 	ld	l,-2 (ix)
   798B DD 66 FF      [19] 3722 	ld	h,-1 (ix)
   798E 6E            [ 7] 3723 	ld	l,(hl)
                           3724 ;src/main.c:643: if (actual->in_range) {
   798F 79            [ 4] 3725 	ld	a,c
   7990 C6 11         [ 7] 3726 	add	a, #0x11
   7992 5F            [ 4] 3727 	ld	e,a
   7993 78            [ 4] 3728 	ld	a,b
   7994 CE 00         [ 7] 3729 	adc	a, #0x00
   7996 57            [ 4] 3730 	ld	d,a
                           3731 ;src/main.c:651: actual->seek = 1;
   7997 79            [ 4] 3732 	ld	a,c
   7998 C6 14         [ 7] 3733 	add	a, #0x14
   799A DD 77 F8      [19] 3734 	ld	-8 (ix),a
   799D 78            [ 4] 3735 	ld	a,b
   799E CE 00         [ 7] 3736 	adc	a, #0x00
   79A0 DD 77 F9      [19] 3737 	ld	-7 (ix),a
                           3738 ;src/main.c:640: if (actual->patrolling) {
   79A3 7D            [ 4] 3739 	ld	a,l
   79A4 B7            [ 4] 3740 	or	a, a
   79A5 CA 67 7A      [10] 3741 	jp	Z,00112$
                           3742 ;src/main.c:642: moverEnemigoPatrol(actual);
   79A8 C5            [11] 3743 	push	bc
   79A9 D5            [11] 3744 	push	de
   79AA C5            [11] 3745 	push	bc
   79AB CD 96 6C      [17] 3746 	call	_moverEnemigoPatrol
   79AE F1            [10] 3747 	pop	af
   79AF D1            [10] 3748 	pop	de
   79B0 C1            [10] 3749 	pop	bc
                           3750 ;src/main.c:643: if (actual->in_range) {
   79B1 1A            [ 7] 3751 	ld	a,(de)
   79B2 B7            [ 4] 3752 	or	a, a
   79B3 28 24         [12] 3753 	jr	Z,00104$
                           3754 ;src/main.c:644: engage(actual, prota.x, prota.y);
   79B5 3A F9 62      [13] 3755 	ld	a, (#_prota + 1)
   79B8 21 F8 62      [10] 3756 	ld	hl, #_prota + 0
   79BB 56            [ 7] 3757 	ld	d,(hl)
   79BC F5            [11] 3758 	push	af
   79BD 33            [ 6] 3759 	inc	sp
   79BE D5            [11] 3760 	push	de
   79BF 33            [ 6] 3761 	inc	sp
   79C0 C5            [11] 3762 	push	bc
   79C1 CD 91 71      [17] 3763 	call	_engage
   79C4 F1            [10] 3764 	pop	af
   79C5 F1            [10] 3765 	pop	af
                           3766 ;src/main.c:645: actual->patrolling = 0;
   79C6 DD 6E FE      [19] 3767 	ld	l,-2 (ix)
   79C9 DD 66 FF      [19] 3768 	ld	h,-1 (ix)
   79CC 36 00         [10] 3769 	ld	(hl),#0x00
                           3770 ;src/main.c:646: actual->engage = 1;
   79CE DD 6E F5      [19] 3771 	ld	l,-11 (ix)
   79D1 DD 66 F6      [19] 3772 	ld	h,-10 (ix)
   79D4 36 01         [10] 3773 	ld	(hl),#0x01
   79D6 C3 9F 7A      [10] 3774 	jp	00117$
   79D9                    3775 00104$:
                           3776 ;src/main.c:647: } else if (actual->seen) {
   79D9 21 12 00      [10] 3777 	ld	hl,#0x0012
   79DC 09            [11] 3778 	add	hl,bc
   79DD DD 75 FC      [19] 3779 	ld	-4 (ix),l
   79E0 DD 74 FD      [19] 3780 	ld	-3 (ix),h
   79E3 DD 6E FC      [19] 3781 	ld	l,-4 (ix)
   79E6 DD 66 FD      [19] 3782 	ld	h,-3 (ix)
   79E9 7E            [ 7] 3783 	ld	a,(hl)
   79EA B7            [ 4] 3784 	or	a, a
   79EB CA 9F 7A      [10] 3785 	jp	Z,00117$
                           3786 ;src/main.c:648: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79EE 3A F9 62      [13] 3787 	ld	a,(#_prota + 1)
   79F1 DD 77 F7      [19] 3788 	ld	-9 (ix),a
   79F4 21 F8 62      [10] 3789 	ld	hl, #_prota + 0
   79F7 5E            [ 7] 3790 	ld	e,(hl)
   79F8 21 01 00      [10] 3791 	ld	hl,#0x0001
   79FB 09            [11] 3792 	add	hl,bc
   79FC DD 75 FA      [19] 3793 	ld	-6 (ix),l
   79FF DD 74 FB      [19] 3794 	ld	-5 (ix),h
   7A02 DD 6E FA      [19] 3795 	ld	l,-6 (ix)
   7A05 DD 66 FB      [19] 3796 	ld	h,-5 (ix)
   7A08 56            [ 7] 3797 	ld	d,(hl)
   7A09 0A            [ 7] 3798 	ld	a,(bc)
   7A0A DD 77 F4      [19] 3799 	ld	-12 (ix),a
   7A0D C5            [11] 3800 	push	bc
   7A0E 2A D5 63      [16] 3801 	ld	hl,(_mapa)
   7A11 E5            [11] 3802 	push	hl
   7A12 C5            [11] 3803 	push	bc
   7A13 DD 7E F7      [19] 3804 	ld	a,-9 (ix)
   7A16 F5            [11] 3805 	push	af
   7A17 33            [ 6] 3806 	inc	sp
   7A18 7B            [ 4] 3807 	ld	a,e
   7A19 F5            [11] 3808 	push	af
   7A1A 33            [ 6] 3809 	inc	sp
   7A1B D5            [11] 3810 	push	de
   7A1C 33            [ 6] 3811 	inc	sp
   7A1D DD 7E F4      [19] 3812 	ld	a,-12 (ix)
   7A20 F5            [11] 3813 	push	af
   7A21 33            [ 6] 3814 	inc	sp
   7A22 CD 40 43      [17] 3815 	call	_pathFinding
   7A25 21 08 00      [10] 3816 	ld	hl,#8
   7A28 39            [11] 3817 	add	hl,sp
   7A29 F9            [ 6] 3818 	ld	sp,hl
   7A2A C1            [10] 3819 	pop	bc
                           3820 ;src/main.c:649: actual->p_seek_x = actual->x;
   7A2B 21 17 00      [10] 3821 	ld	hl,#0x0017
   7A2E 09            [11] 3822 	add	hl,bc
   7A2F EB            [ 4] 3823 	ex	de,hl
   7A30 0A            [ 7] 3824 	ld	a,(bc)
   7A31 12            [ 7] 3825 	ld	(de),a
                           3826 ;src/main.c:650: actual->p_seek_y = actual->y;
   7A32 21 18 00      [10] 3827 	ld	hl,#0x0018
   7A35 09            [11] 3828 	add	hl,bc
   7A36 EB            [ 4] 3829 	ex	de,hl
   7A37 DD 6E FA      [19] 3830 	ld	l,-6 (ix)
   7A3A DD 66 FB      [19] 3831 	ld	h,-5 (ix)
   7A3D 7E            [ 7] 3832 	ld	a,(hl)
   7A3E 12            [ 7] 3833 	ld	(de),a
                           3834 ;src/main.c:651: actual->seek = 1;
   7A3F DD 6E F8      [19] 3835 	ld	l,-8 (ix)
   7A42 DD 66 F9      [19] 3836 	ld	h,-7 (ix)
   7A45 36 01         [10] 3837 	ld	(hl),#0x01
                           3838 ;src/main.c:652: actual->iter=0;
   7A47 21 0E 00      [10] 3839 	ld	hl,#0x000E
   7A4A 09            [11] 3840 	add	hl,bc
   7A4B AF            [ 4] 3841 	xor	a, a
   7A4C 77            [ 7] 3842 	ld	(hl), a
   7A4D 23            [ 6] 3843 	inc	hl
   7A4E 77            [ 7] 3844 	ld	(hl), a
                           3845 ;src/main.c:653: actual->reversePatrol = NO;
   7A4F 21 0C 00      [10] 3846 	ld	hl,#0x000C
   7A52 09            [11] 3847 	add	hl,bc
   7A53 36 00         [10] 3848 	ld	(hl),#0x00
                           3849 ;src/main.c:654: actual->patrolling = 0;
   7A55 DD 6E FE      [19] 3850 	ld	l,-2 (ix)
   7A58 DD 66 FF      [19] 3851 	ld	h,-1 (ix)
   7A5B 36 00         [10] 3852 	ld	(hl),#0x00
                           3853 ;src/main.c:655: actual->seen = 0;
   7A5D DD 6E FC      [19] 3854 	ld	l,-4 (ix)
   7A60 DD 66 FD      [19] 3855 	ld	h,-3 (ix)
   7A63 36 00         [10] 3856 	ld	(hl),#0x00
   7A65 18 38         [12] 3857 	jr	00117$
   7A67                    3858 00112$:
                           3859 ;src/main.c:657: } else if (actual->seek) {
   7A67 DD 6E F8      [19] 3860 	ld	l,-8 (ix)
   7A6A DD 66 F9      [19] 3861 	ld	h,-7 (ix)
   7A6D 7E            [ 7] 3862 	ld	a,(hl)
   7A6E B7            [ 4] 3863 	or	a, a
   7A6F 28 2E         [12] 3864 	jr	Z,00117$
                           3865 ;src/main.c:658: moverEnemigoSeek(actual);
   7A71 C5            [11] 3866 	push	bc
   7A72 D5            [11] 3867 	push	de
   7A73 C5            [11] 3868 	push	bc
   7A74 CD EC 6F      [17] 3869 	call	_moverEnemigoSeek
   7A77 F1            [10] 3870 	pop	af
   7A78 D1            [10] 3871 	pop	de
   7A79 C1            [10] 3872 	pop	bc
                           3873 ;src/main.c:659: if (actual->in_range) {
   7A7A 1A            [ 7] 3874 	ld	a,(de)
   7A7B B7            [ 4] 3875 	or	a, a
   7A7C 28 21         [12] 3876 	jr	Z,00117$
                           3877 ;src/main.c:660: engage(actual, prota.x, prota.y);
   7A7E 3A F9 62      [13] 3878 	ld	a, (#_prota + 1)
   7A81 21 F8 62      [10] 3879 	ld	hl, #_prota + 0
   7A84 56            [ 7] 3880 	ld	d,(hl)
   7A85 F5            [11] 3881 	push	af
   7A86 33            [ 6] 3882 	inc	sp
   7A87 D5            [11] 3883 	push	de
   7A88 33            [ 6] 3884 	inc	sp
   7A89 C5            [11] 3885 	push	bc
   7A8A CD 91 71      [17] 3886 	call	_engage
   7A8D F1            [10] 3887 	pop	af
   7A8E F1            [10] 3888 	pop	af
                           3889 ;src/main.c:661: actual->seek = 0;
   7A8F DD 6E F8      [19] 3890 	ld	l,-8 (ix)
   7A92 DD 66 F9      [19] 3891 	ld	h,-7 (ix)
   7A95 36 00         [10] 3892 	ld	(hl),#0x00
                           3893 ;src/main.c:662: actual->engage = 1;
   7A97 DD 6E F5      [19] 3894 	ld	l,-11 (ix)
   7A9A DD 66 F6      [19] 3895 	ld	h,-10 (ix)
   7A9D 36 01         [10] 3896 	ld	(hl),#0x01
                           3897 ;src/main.c:663: } else if (actual->seen) {
   7A9F                    3898 00117$:
   7A9F DD F9         [10] 3899 	ld	sp, ix
   7AA1 DD E1         [14] 3900 	pop	ix
   7AA3 C9            [10] 3901 	ret
                           3902 ;src/main.c:670: void inicializarEnemy() {
                           3903 ;	---------------------------------
                           3904 ; Function inicializarEnemy
                           3905 ; ---------------------------------
   7AA4                    3906 _inicializarEnemy::
   7AA4 DD E5         [15] 3907 	push	ix
   7AA6 DD 21 00 00   [14] 3908 	ld	ix,#0
   7AAA DD 39         [15] 3909 	add	ix,sp
   7AAC 21 F9 FF      [10] 3910 	ld	hl,#-7
   7AAF 39            [11] 3911 	add	hl,sp
   7AB0 F9            [ 6] 3912 	ld	sp,hl
                           3913 ;src/main.c:671: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7AB1 3A D7 63      [13] 3914 	ld	a,(#_num_mapa + 0)
   7AB4 C6 02         [ 7] 3915 	add	a, #0x02
   7AB6 DD 77 FF      [19] 3916 	ld	-1 (ix),a
                           3917 ;src/main.c:681: actual = enemy;
   7AB9 11 70 5F      [10] 3918 	ld	de,#_enemy+0
                           3919 ;src/main.c:682: while(i){
   7ABC                    3920 00101$:
   7ABC DD 7E FF      [19] 3921 	ld	a,-1 (ix)
   7ABF B7            [ 4] 3922 	or	a, a
   7AC0 CA B2 7B      [10] 3923 	jp	Z,00104$
                           3924 ;src/main.c:683: --i;
   7AC3 DD 35 FF      [23] 3925 	dec	-1 (ix)
                           3926 ;src/main.c:684: actual->x = actual->px = spawnX[i];
   7AC6 4B            [ 4] 3927 	ld	c, e
   7AC7 42            [ 4] 3928 	ld	b, d
   7AC8 03            [ 6] 3929 	inc	bc
   7AC9 03            [ 6] 3930 	inc	bc
   7ACA 3E FB         [ 7] 3931 	ld	a,#<(_spawnX)
   7ACC DD 86 FF      [19] 3932 	add	a, -1 (ix)
   7ACF DD 77 FD      [19] 3933 	ld	-3 (ix),a
   7AD2 3E 63         [ 7] 3934 	ld	a,#>(_spawnX)
   7AD4 CE 00         [ 7] 3935 	adc	a, #0x00
   7AD6 DD 77 FE      [19] 3936 	ld	-2 (ix),a
   7AD9 DD 6E FD      [19] 3937 	ld	l,-3 (ix)
   7ADC DD 66 FE      [19] 3938 	ld	h,-2 (ix)
   7ADF 7E            [ 7] 3939 	ld	a,(hl)
   7AE0 02            [ 7] 3940 	ld	(bc),a
   7AE1 12            [ 7] 3941 	ld	(de),a
                           3942 ;src/main.c:685: actual->y = actual->py = spawnY[i];
   7AE2 D5            [11] 3943 	push	de
   7AE3 FD E1         [14] 3944 	pop	iy
   7AE5 FD 23         [10] 3945 	inc	iy
   7AE7 4B            [ 4] 3946 	ld	c, e
   7AE8 42            [ 4] 3947 	ld	b, d
   7AE9 03            [ 6] 3948 	inc	bc
   7AEA 03            [ 6] 3949 	inc	bc
   7AEB 03            [ 6] 3950 	inc	bc
   7AEC 3E FF         [ 7] 3951 	ld	a,#<(_spawnY)
   7AEE DD 86 FF      [19] 3952 	add	a, -1 (ix)
   7AF1 DD 77 FB      [19] 3953 	ld	-5 (ix),a
   7AF4 3E 63         [ 7] 3954 	ld	a,#>(_spawnY)
   7AF6 CE 00         [ 7] 3955 	adc	a, #0x00
   7AF8 DD 77 FC      [19] 3956 	ld	-4 (ix),a
   7AFB DD 6E FB      [19] 3957 	ld	l,-5 (ix)
   7AFE DD 66 FC      [19] 3958 	ld	h,-4 (ix)
   7B01 7E            [ 7] 3959 	ld	a,(hl)
   7B02 02            [ 7] 3960 	ld	(bc),a
   7B03 FD 77 00      [19] 3961 	ld	0 (iy), a
                           3962 ;src/main.c:686: actual->mover  = NO;
   7B06 21 06 00      [10] 3963 	ld	hl,#0x0006
   7B09 19            [11] 3964 	add	hl,de
   7B0A 36 00         [10] 3965 	ld	(hl),#0x00
                           3966 ;src/main.c:687: actual->mira   = M_abajo;
   7B0C 21 07 00      [10] 3967 	ld	hl,#0x0007
   7B0F 19            [11] 3968 	add	hl,de
   7B10 36 03         [10] 3969 	ld	(hl),#0x03
                           3970 ;src/main.c:688: actual->sprite = g_enemy;
   7B12 21 04 00      [10] 3971 	ld	hl,#0x0004
   7B15 19            [11] 3972 	add	hl,de
   7B16 36 3A         [10] 3973 	ld	(hl),#<(_g_enemy)
   7B18 23            [ 6] 3974 	inc	hl
   7B19 36 3C         [10] 3975 	ld	(hl),#>(_g_enemy)
                           3976 ;src/main.c:689: actual->muerto = NO;
   7B1B 21 08 00      [10] 3977 	ld	hl,#0x0008
   7B1E 19            [11] 3978 	add	hl,de
   7B1F 36 00         [10] 3979 	ld	(hl),#0x00
                           3980 ;src/main.c:690: actual->muertes = 0;
   7B21 21 0A 00      [10] 3981 	ld	hl,#0x000A
   7B24 19            [11] 3982 	add	hl,de
   7B25 36 00         [10] 3983 	ld	(hl),#0x00
                           3984 ;src/main.c:691: actual->patrolling = SI;
   7B27 21 0B 00      [10] 3985 	ld	hl,#0x000B
   7B2A 19            [11] 3986 	add	hl,de
   7B2B 36 01         [10] 3987 	ld	(hl),#0x01
                           3988 ;src/main.c:692: actual->reversePatrol = NO;
   7B2D 21 0C 00      [10] 3989 	ld	hl,#0x000C
   7B30 19            [11] 3990 	add	hl,de
   7B31 36 00         [10] 3991 	ld	(hl),#0x00
                           3992 ;src/main.c:693: actual->iter = 0;
   7B33 21 0E 00      [10] 3993 	ld	hl,#0x000E
   7B36 19            [11] 3994 	add	hl,de
   7B37 AF            [ 4] 3995 	xor	a, a
   7B38 77            [ 7] 3996 	ld	(hl), a
   7B39 23            [ 6] 3997 	inc	hl
   7B3A 77            [ 7] 3998 	ld	(hl), a
                           3999 ;src/main.c:694: actual->lastIter = 0;
   7B3B 21 10 00      [10] 4000 	ld	hl,#0x0010
   7B3E 19            [11] 4001 	add	hl,de
   7B3F 36 00         [10] 4002 	ld	(hl),#0x00
                           4003 ;src/main.c:695: actual->seen = 0;
   7B41 21 12 00      [10] 4004 	ld	hl,#0x0012
   7B44 19            [11] 4005 	add	hl,de
   7B45 36 00         [10] 4006 	ld	(hl),#0x00
                           4007 ;src/main.c:696: actual->found = 0;
   7B47 21 13 00      [10] 4008 	ld	hl,#0x0013
   7B4A 19            [11] 4009 	add	hl,de
   7B4B 36 00         [10] 4010 	ld	(hl),#0x00
                           4011 ;src/main.c:697: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B4D 21 D7 63      [10] 4012 	ld	hl,#_num_mapa + 0
   7B50 4E            [ 7] 4013 	ld	c, (hl)
   7B51 0C            [ 4] 4014 	inc	c
   7B52 06 00         [ 7] 4015 	ld	b,#0x00
   7B54 69            [ 4] 4016 	ld	l, c
   7B55 60            [ 4] 4017 	ld	h, b
   7B56 29            [11] 4018 	add	hl, hl
   7B57 29            [11] 4019 	add	hl, hl
   7B58 09            [11] 4020 	add	hl, bc
   7B59 4D            [ 4] 4021 	ld	c,l
   7B5A 44            [ 4] 4022 	ld	b,h
   7B5B 21 17 64      [10] 4023 	ld	hl,#_patrolY
   7B5E 09            [11] 4024 	add	hl,bc
   7B5F 7D            [ 4] 4025 	ld	a,l
   7B60 DD 86 FF      [19] 4026 	add	a, -1 (ix)
   7B63 6F            [ 4] 4027 	ld	l,a
   7B64 7C            [ 4] 4028 	ld	a,h
   7B65 CE 00         [ 7] 4029 	adc	a, #0x00
   7B67 67            [ 4] 4030 	ld	h,a
   7B68 7E            [ 7] 4031 	ld	a,(hl)
   7B69 DD 77 FA      [19] 4032 	ld	-6 (ix),a
   7B6C 21 03 64      [10] 4033 	ld	hl,#_patrolX
   7B6F 09            [11] 4034 	add	hl,bc
   7B70 DD 4E FF      [19] 4035 	ld	c,-1 (ix)
   7B73 06 00         [ 7] 4036 	ld	b,#0x00
   7B75 09            [11] 4037 	add	hl,bc
   7B76 7E            [ 7] 4038 	ld	a,(hl)
   7B77 DD 77 F9      [19] 4039 	ld	-7 (ix),a
   7B7A DD 6E FB      [19] 4040 	ld	l,-5 (ix)
   7B7D DD 66 FC      [19] 4041 	ld	h,-4 (ix)
   7B80 4E            [ 7] 4042 	ld	c,(hl)
   7B81 DD 6E FD      [19] 4043 	ld	l,-3 (ix)
   7B84 DD 66 FE      [19] 4044 	ld	h,-2 (ix)
   7B87 46            [ 7] 4045 	ld	b,(hl)
   7B88 D5            [11] 4046 	push	de
   7B89 2A D5 63      [16] 4047 	ld	hl,(_mapa)
   7B8C E5            [11] 4048 	push	hl
   7B8D D5            [11] 4049 	push	de
   7B8E DD 66 FA      [19] 4050 	ld	h,-6 (ix)
   7B91 DD 6E F9      [19] 4051 	ld	l,-7 (ix)
   7B94 E5            [11] 4052 	push	hl
   7B95 79            [ 4] 4053 	ld	a,c
   7B96 F5            [11] 4054 	push	af
   7B97 33            [ 6] 4055 	inc	sp
   7B98 C5            [11] 4056 	push	bc
   7B99 33            [ 6] 4057 	inc	sp
   7B9A CD 40 43      [17] 4058 	call	_pathFinding
   7B9D 21 08 00      [10] 4059 	ld	hl,#8
   7BA0 39            [11] 4060 	add	hl,sp
   7BA1 F9            [ 6] 4061 	ld	sp,hl
   7BA2 D1            [10] 4062 	pop	de
                           4063 ;src/main.c:718: dibujarEnemigo(actual);
   7BA3 D5            [11] 4064 	push	de
   7BA4 D5            [11] 4065 	push	de
   7BA5 CD B1 66      [17] 4066 	call	_dibujarEnemigo
   7BA8 F1            [10] 4067 	pop	af
   7BA9 D1            [10] 4068 	pop	de
                           4069 ;src/main.c:719: ++actual;
   7BAA 21 E2 00      [10] 4070 	ld	hl,#0x00E2
   7BAD 19            [11] 4071 	add	hl,de
   7BAE EB            [ 4] 4072 	ex	de,hl
   7BAF C3 BC 7A      [10] 4073 	jp	00101$
   7BB2                    4074 00104$:
   7BB2 DD F9         [10] 4075 	ld	sp, ix
   7BB4 DD E1         [14] 4076 	pop	ix
   7BB6 C9            [10] 4077 	ret
                           4078 ;src/main.c:723: void avanzarMapa() {
                           4079 ;	---------------------------------
                           4080 ; Function avanzarMapa
                           4081 ; ---------------------------------
   7BB7                    4082 _avanzarMapa::
                           4083 ;src/main.c:724: if(num_mapa < NUM_MAPAS -1) {
   7BB7 3A D7 63      [13] 4084 	ld	a,(#_num_mapa + 0)
   7BBA D6 02         [ 7] 4085 	sub	a, #0x02
   7BBC 30 34         [12] 4086 	jr	NC,00102$
                           4087 ;src/main.c:725: mapa = mapas[++num_mapa];
   7BBE 01 F5 63      [10] 4088 	ld	bc,#_mapas+0
   7BC1 21 D7 63      [10] 4089 	ld	hl, #_num_mapa+0
   7BC4 34            [11] 4090 	inc	(hl)
   7BC5 FD 21 D7 63   [14] 4091 	ld	iy,#_num_mapa
   7BC9 FD 6E 00      [19] 4092 	ld	l,0 (iy)
   7BCC 26 00         [ 7] 4093 	ld	h,#0x00
   7BCE 29            [11] 4094 	add	hl, hl
   7BCF 09            [11] 4095 	add	hl,bc
   7BD0 7E            [ 7] 4096 	ld	a,(hl)
   7BD1 FD 21 D5 63   [14] 4097 	ld	iy,#_mapa
   7BD5 FD 77 00      [19] 4098 	ld	0 (iy),a
   7BD8 23            [ 6] 4099 	inc	hl
   7BD9 7E            [ 7] 4100 	ld	a,(hl)
   7BDA 32 D6 63      [13] 4101 	ld	(#_mapa + 1),a
                           4102 ;src/main.c:726: prota.x = prota.px = 2;
   7BDD 21 FA 62      [10] 4103 	ld	hl,#(_prota + 0x0002)
   7BE0 36 02         [10] 4104 	ld	(hl),#0x02
   7BE2 21 F8 62      [10] 4105 	ld	hl,#_prota
   7BE5 36 02         [10] 4106 	ld	(hl),#0x02
                           4107 ;src/main.c:727: prota.mover = SI;
   7BE7 21 FE 62      [10] 4108 	ld	hl,#(_prota + 0x0006)
   7BEA 36 01         [10] 4109 	ld	(hl),#0x01
                           4110 ;src/main.c:728: dibujarMapa();
   7BEC CD DF 63      [17] 4111 	call	_dibujarMapa
                           4112 ;src/main.c:729: inicializarEnemy();
   7BEF C3 A4 7A      [10] 4113 	jp  _inicializarEnemy
   7BF2                    4114 00102$:
                           4115 ;src/main.c:732: menuFin(puntuacion);
   7BF2 FD 21 D8 63   [14] 4116 	ld	iy,#_puntuacion
   7BF6 FD 6E 00      [19] 4117 	ld	l,0 (iy)
   7BF9 26 00         [ 7] 4118 	ld	h,#0x00
   7BFB C3 B0 4A      [10] 4119 	jp  _menuFin
                           4120 ;src/main.c:736: void moverIzquierda() {
                           4121 ;	---------------------------------
                           4122 ; Function moverIzquierda
                           4123 ; ---------------------------------
   7BFE                    4124 _moverIzquierda::
                           4125 ;src/main.c:737: prota.mira = M_izquierda;
   7BFE 01 F8 62      [10] 4126 	ld	bc,#_prota+0
   7C01 21 FF 62      [10] 4127 	ld	hl,#(_prota + 0x0007)
   7C04 36 01         [10] 4128 	ld	(hl),#0x01
                           4129 ;src/main.c:738: if (!checkCollision(M_izquierda)) {
   7C06 C5            [11] 4130 	push	bc
   7C07 3E 01         [ 7] 4131 	ld	a,#0x01
   7C09 F5            [11] 4132 	push	af
   7C0A 33            [ 6] 4133 	inc	sp
   7C0B CD 40 65      [17] 4134 	call	_checkCollision
   7C0E 33            [ 6] 4135 	inc	sp
   7C0F C1            [10] 4136 	pop	bc
   7C10 7D            [ 4] 4137 	ld	a,l
   7C11 B7            [ 4] 4138 	or	a, a
   7C12 C0            [11] 4139 	ret	NZ
                           4140 ;src/main.c:739: prota.x--;
   7C13 0A            [ 7] 4141 	ld	a,(bc)
   7C14 C6 FF         [ 7] 4142 	add	a,#0xFF
   7C16 02            [ 7] 4143 	ld	(bc),a
                           4144 ;src/main.c:740: prota.mover = SI;
   7C17 21 FE 62      [10] 4145 	ld	hl,#(_prota + 0x0006)
   7C1A 36 01         [10] 4146 	ld	(hl),#0x01
                           4147 ;src/main.c:741: prota.sprite = g_hero_left;
   7C1C 21 C6 3D      [10] 4148 	ld	hl,#_g_hero_left
   7C1F 22 FC 62      [16] 4149 	ld	((_prota + 0x0004)), hl
   7C22 C9            [10] 4150 	ret
                           4151 ;src/main.c:745: void moverDerecha() {
                           4152 ;	---------------------------------
                           4153 ; Function moverDerecha
                           4154 ; ---------------------------------
   7C23                    4155 _moverDerecha::
                           4156 ;src/main.c:746: prota.mira = M_derecha;
   7C23 21 FF 62      [10] 4157 	ld	hl,#(_prota + 0x0007)
   7C26 36 00         [10] 4158 	ld	(hl),#0x00
                           4159 ;src/main.c:747: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C28 AF            [ 4] 4160 	xor	a, a
   7C29 F5            [11] 4161 	push	af
   7C2A 33            [ 6] 4162 	inc	sp
   7C2B CD 40 65      [17] 4163 	call	_checkCollision
   7C2E 33            [ 6] 4164 	inc	sp
   7C2F 45            [ 4] 4165 	ld	b,l
   7C30 21 F8 62      [10] 4166 	ld	hl, #_prota + 0
   7C33 4E            [ 7] 4167 	ld	c,(hl)
   7C34 59            [ 4] 4168 	ld	e,c
   7C35 16 00         [ 7] 4169 	ld	d,#0x00
   7C37 21 07 00      [10] 4170 	ld	hl,#0x0007
   7C3A 19            [11] 4171 	add	hl,de
   7C3B 11 50 80      [10] 4172 	ld	de, #0x8050
   7C3E 29            [11] 4173 	add	hl, hl
   7C3F 3F            [ 4] 4174 	ccf
   7C40 CB 1C         [ 8] 4175 	rr	h
   7C42 CB 1D         [ 8] 4176 	rr	l
   7C44 ED 52         [15] 4177 	sbc	hl, de
   7C46 3E 00         [ 7] 4178 	ld	a,#0x00
   7C48 17            [ 4] 4179 	rla
   7C49 5F            [ 4] 4180 	ld	e,a
   7C4A 78            [ 4] 4181 	ld	a,b
   7C4B B7            [ 4] 4182 	or	a,a
   7C4C 20 14         [12] 4183 	jr	NZ,00104$
   7C4E B3            [ 4] 4184 	or	a,e
   7C4F 28 11         [12] 4185 	jr	Z,00104$
                           4186 ;src/main.c:748: prota.x++;
   7C51 0C            [ 4] 4187 	inc	c
   7C52 21 F8 62      [10] 4188 	ld	hl,#_prota
   7C55 71            [ 7] 4189 	ld	(hl),c
                           4190 ;src/main.c:749: prota.mover = SI;
   7C56 21 FE 62      [10] 4191 	ld	hl,#(_prota + 0x0006)
   7C59 36 01         [10] 4192 	ld	(hl),#0x01
                           4193 ;src/main.c:750: prota.sprite = g_hero;
   7C5B 21 70 3E      [10] 4194 	ld	hl,#_g_hero
   7C5E 22 FC 62      [16] 4195 	ld	((_prota + 0x0004)), hl
   7C61 C9            [10] 4196 	ret
   7C62                    4197 00104$:
                           4198 ;src/main.c:752: }else if( prota.x + G_HERO_W >= 80){
   7C62 7B            [ 4] 4199 	ld	a,e
   7C63 B7            [ 4] 4200 	or	a, a
   7C64 C0            [11] 4201 	ret	NZ
                           4202 ;src/main.c:753: avanzarMapa();
   7C65 C3 B7 7B      [10] 4203 	jp  _avanzarMapa
                           4204 ;src/main.c:757: void moverArriba() {
                           4205 ;	---------------------------------
                           4206 ; Function moverArriba
                           4207 ; ---------------------------------
   7C68                    4208 _moverArriba::
                           4209 ;src/main.c:758: prota.mira = M_arriba;
   7C68 21 FF 62      [10] 4210 	ld	hl,#(_prota + 0x0007)
   7C6B 36 02         [10] 4211 	ld	(hl),#0x02
                           4212 ;src/main.c:759: if (!checkCollision(M_arriba)) {
   7C6D 3E 02         [ 7] 4213 	ld	a,#0x02
   7C6F F5            [11] 4214 	push	af
   7C70 33            [ 6] 4215 	inc	sp
   7C71 CD 40 65      [17] 4216 	call	_checkCollision
   7C74 33            [ 6] 4217 	inc	sp
   7C75 7D            [ 4] 4218 	ld	a,l
   7C76 B7            [ 4] 4219 	or	a, a
   7C77 C0            [11] 4220 	ret	NZ
                           4221 ;src/main.c:760: prota.y--;
   7C78 21 F9 62      [10] 4222 	ld	hl,#_prota + 1
   7C7B 4E            [ 7] 4223 	ld	c,(hl)
   7C7C 0D            [ 4] 4224 	dec	c
   7C7D 71            [ 7] 4225 	ld	(hl),c
                           4226 ;src/main.c:761: prota.y--;
   7C7E 0D            [ 4] 4227 	dec	c
   7C7F 71            [ 7] 4228 	ld	(hl),c
                           4229 ;src/main.c:762: prota.mover  = SI;
   7C80 21 FE 62      [10] 4230 	ld	hl,#(_prota + 0x0006)
   7C83 36 01         [10] 4231 	ld	(hl),#0x01
                           4232 ;src/main.c:763: prota.sprite = g_hero_up;
   7C85 21 2C 3D      [10] 4233 	ld	hl,#_g_hero_up
   7C88 22 FC 62      [16] 4234 	ld	((_prota + 0x0004)), hl
   7C8B C9            [10] 4235 	ret
                           4236 ;src/main.c:767: void moverAbajo() {
                           4237 ;	---------------------------------
                           4238 ; Function moverAbajo
                           4239 ; ---------------------------------
   7C8C                    4240 _moverAbajo::
                           4241 ;src/main.c:768: prota.mira = M_abajo;
   7C8C 21 FF 62      [10] 4242 	ld	hl,#(_prota + 0x0007)
   7C8F 36 03         [10] 4243 	ld	(hl),#0x03
                           4244 ;src/main.c:769: if (!checkCollision(M_abajo) ) {
   7C91 3E 03         [ 7] 4245 	ld	a,#0x03
   7C93 F5            [11] 4246 	push	af
   7C94 33            [ 6] 4247 	inc	sp
   7C95 CD 40 65      [17] 4248 	call	_checkCollision
   7C98 33            [ 6] 4249 	inc	sp
   7C99 7D            [ 4] 4250 	ld	a,l
   7C9A B7            [ 4] 4251 	or	a, a
   7C9B C0            [11] 4252 	ret	NZ
                           4253 ;src/main.c:770: prota.y++;
   7C9C 01 F9 62      [10] 4254 	ld	bc,#_prota + 1
   7C9F 0A            [ 7] 4255 	ld	a,(bc)
   7CA0 3C            [ 4] 4256 	inc	a
   7CA1 02            [ 7] 4257 	ld	(bc),a
                           4258 ;src/main.c:771: prota.y++;
   7CA2 3C            [ 4] 4259 	inc	a
   7CA3 02            [ 7] 4260 	ld	(bc),a
                           4261 ;src/main.c:772: prota.mover  = SI;
   7CA4 21 FE 62      [10] 4262 	ld	hl,#(_prota + 0x0006)
   7CA7 36 01         [10] 4263 	ld	(hl),#0x01
                           4264 ;src/main.c:773: prota.sprite = g_hero_down;
   7CA9 21 92 3C      [10] 4265 	ld	hl,#_g_hero_down
   7CAC 22 FC 62      [16] 4266 	ld	((_prota + 0x0004)), hl
   7CAF C9            [10] 4267 	ret
                           4268 ;src/main.c:780: void intHandler() {
                           4269 ;	---------------------------------
                           4270 ; Function intHandler
                           4271 ; ---------------------------------
   7CB0                    4272 _intHandler::
                           4273 ;src/main.c:781: if (++i == 6) {
   7CB0 21 0B 63      [10] 4274 	ld	hl, #_i+0
   7CB3 34            [11] 4275 	inc	(hl)
   7CB4 3A 0B 63      [13] 4276 	ld	a,(#_i + 0)
   7CB7 D6 06         [ 7] 4277 	sub	a, #0x06
   7CB9 C0            [11] 4278 	ret	NZ
                           4279 ;src/main.c:782: play();
   7CBA CD 44 52      [17] 4280 	call	_play
                           4281 ;src/main.c:783: i=0;
   7CBD 21 0B 63      [10] 4282 	ld	hl,#_i + 0
   7CC0 36 00         [10] 4283 	ld	(hl), #0x00
   7CC2 C9            [10] 4284 	ret
                           4285 ;src/main.c:787: void inicializarCPC() {
                           4286 ;	---------------------------------
                           4287 ; Function inicializarCPC
                           4288 ; ---------------------------------
   7CC3                    4289 _inicializarCPC::
                           4290 ;src/main.c:788: cpct_disableFirmware();
   7CC3 CD EB 55      [17] 4291 	call	_cpct_disableFirmware
                           4292 ;src/main.c:789: cpct_setVideoMode(0);
   7CC6 2E 00         [ 7] 4293 	ld	l,#0x00
   7CC8 CD BF 55      [17] 4294 	call	_cpct_setVideoMode
                           4295 ;src/main.c:790: cpct_setBorder(HW_BLACK);
   7CCB 21 10 14      [10] 4296 	ld	hl,#0x1410
   7CCE E5            [11] 4297 	push	hl
   7CCF CD 22 53      [17] 4298 	call	_cpct_setPALColour
                           4299 ;src/main.c:791: cpct_setPalette(g_palette, 16);
   7CD2 21 10 00      [10] 4300 	ld	hl,#0x0010
   7CD5 E5            [11] 4301 	push	hl
   7CD6 21 60 3E      [10] 4302 	ld	hl,#_g_palette
   7CD9 E5            [11] 4303 	push	hl
   7CDA CD FF 52      [17] 4304 	call	_cpct_setPalette
   7CDD C9            [10] 4305 	ret
                           4306 ;src/main.c:796: void inicializarJuego() {
                           4307 ;	---------------------------------
                           4308 ; Function inicializarJuego
                           4309 ; ---------------------------------
   7CDE                    4310 _inicializarJuego::
                           4311 ;src/main.c:798: num_mapa = 0;
   7CDE 21 D7 63      [10] 4312 	ld	hl,#_num_mapa + 0
   7CE1 36 00         [10] 4313 	ld	(hl), #0x00
                           4314 ;src/main.c:799: mapa = mapas[num_mapa];
   7CE3 21 F5 63      [10] 4315 	ld	hl, #_mapas + 0
   7CE6 7E            [ 7] 4316 	ld	a,(hl)
   7CE7 FD 21 D5 63   [14] 4317 	ld	iy,#_mapa
   7CEB FD 77 00      [19] 4318 	ld	0 (iy),a
   7CEE 23            [ 6] 4319 	inc	hl
   7CEF 7E            [ 7] 4320 	ld	a,(hl)
   7CF0 32 D6 63      [13] 4321 	ld	(#_mapa + 1),a
                           4322 ;src/main.c:800: cpct_etm_setTileset2x4(g_tileset);
   7CF3 21 E0 17      [10] 4323 	ld	hl,#_g_tileset
   7CF6 CD 13 55      [17] 4324 	call	_cpct_etm_setTileset2x4
                           4325 ;src/main.c:802: dibujarMapa();
   7CF9 CD DF 63      [17] 4326 	call	_dibujarMapa
                           4327 ;src/main.c:805: barraPuntuacionInicial();
   7CFC CD 50 50      [17] 4328 	call	_barraPuntuacionInicial
                           4329 ;src/main.c:808: prota.x = prota.px = 4;
   7CFF 21 FA 62      [10] 4330 	ld	hl,#(_prota + 0x0002)
   7D02 36 04         [10] 4331 	ld	(hl),#0x04
   7D04 21 F8 62      [10] 4332 	ld	hl,#_prota
   7D07 36 04         [10] 4333 	ld	(hl),#0x04
                           4334 ;src/main.c:809: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D09 21 FB 62      [10] 4335 	ld	hl,#(_prota + 0x0003)
   7D0C 36 68         [10] 4336 	ld	(hl),#0x68
   7D0E 21 F9 62      [10] 4337 	ld	hl,#(_prota + 0x0001)
   7D11 36 68         [10] 4338 	ld	(hl),#0x68
                           4339 ;src/main.c:810: prota.mover  = NO;
   7D13 21 FE 62      [10] 4340 	ld	hl,#(_prota + 0x0006)
   7D16 36 00         [10] 4341 	ld	(hl),#0x00
                           4342 ;src/main.c:811: prota.mira=M_derecha;
   7D18 21 FF 62      [10] 4343 	ld	hl,#(_prota + 0x0007)
   7D1B 36 00         [10] 4344 	ld	(hl),#0x00
                           4345 ;src/main.c:812: prota.sprite = g_hero;
   7D1D 21 70 3E      [10] 4346 	ld	hl,#_g_hero
   7D20 22 FC 62      [16] 4347 	ld	((_prota + 0x0004)), hl
                           4348 ;src/main.c:816: cu.x = cu.px = 0;
   7D23 21 02 63      [10] 4349 	ld	hl,#(_cu + 0x0002)
   7D26 36 00         [10] 4350 	ld	(hl),#0x00
   7D28 21 00 63      [10] 4351 	ld	hl,#_cu
   7D2B 36 00         [10] 4352 	ld	(hl),#0x00
                           4353 ;src/main.c:817: cu.y = cu.py = 0;
   7D2D 21 03 63      [10] 4354 	ld	hl,#(_cu + 0x0003)
   7D30 36 00         [10] 4355 	ld	(hl),#0x00
   7D32 21 01 63      [10] 4356 	ld	hl,#(_cu + 0x0001)
   7D35 36 00         [10] 4357 	ld	(hl),#0x00
                           4358 ;src/main.c:818: cu.lanzado = NO;
   7D37 21 06 63      [10] 4359 	ld	hl,#(_cu + 0x0006)
   7D3A 36 00         [10] 4360 	ld	(hl),#0x00
                           4361 ;src/main.c:819: cu.mover = NO;
   7D3C 21 09 63      [10] 4362 	ld	hl,#(_cu + 0x0009)
   7D3F 36 00         [10] 4363 	ld	(hl),#0x00
                           4364 ;src/main.c:820: cu.off_bound = NO;
   7D41 21 0A 63      [10] 4365 	ld	hl,#(_cu + 0x000a)
   7D44 36 00         [10] 4366 	ld	(hl),#0x00
                           4367 ;src/main.c:822: inicializarEnemy();
   7D46 CD A4 7A      [17] 4368 	call	_inicializarEnemy
                           4369 ;src/main.c:824: dibujarProta();
   7D49 C3 2B 64      [10] 4370 	jp  _dibujarProta
                           4371 ;src/main.c:827: void main(void) {
                           4372 ;	---------------------------------
                           4373 ; Function main
                           4374 ; ---------------------------------
   7D4C                    4375 _main::
   7D4C DD E5         [15] 4376 	push	ix
   7D4E DD 21 00 00   [14] 4377 	ld	ix,#0
   7D52 DD 39         [15] 4378 	add	ix,sp
   7D54 F5            [11] 4379 	push	af
   7D55 3B            [ 6] 4380 	dec	sp
                           4381 ;src/main.c:832: inicializarCPC();
   7D56 CD C3 7C      [17] 4382 	call	_inicializarCPC
                           4383 ;src/main.c:834: menuInicio();
   7D59 CD 71 4F      [17] 4384 	call	_menuInicio
                           4385 ;src/main.c:836: inicializarJuego();
   7D5C CD DE 7C      [17] 4386 	call	_inicializarJuego
                           4387 ;src/main.c:840: while (1) {
   7D5F                    4388 00119$:
                           4389 ;src/main.c:842: i = 2 + num_mapa;
   7D5F 21 D7 63      [10] 4390 	ld	hl,#_num_mapa + 0
   7D62 4E            [ 7] 4391 	ld	c, (hl)
   7D63 0C            [ 4] 4392 	inc	c
   7D64 0C            [ 4] 4393 	inc	c
                           4394 ;src/main.c:843: actual = enemy;
                           4395 ;src/main.c:845: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D65 C5            [11] 4396 	push	bc
   7D66 21 00 01      [10] 4397 	ld	hl,#_g_tablatrans
   7D69 E5            [11] 4398 	push	hl
   7D6A 2A D5 63      [16] 4399 	ld	hl,(_mapa)
   7D6D E5            [11] 4400 	push	hl
   7D6E 21 F8 62      [10] 4401 	ld	hl,#_prota
   7D71 E5            [11] 4402 	push	hl
   7D72 21 00 63      [10] 4403 	ld	hl,#_cu
   7D75 E5            [11] 4404 	push	hl
   7D76 CD D9 64      [17] 4405 	call	_comprobarTeclado
   7D79 21 08 00      [10] 4406 	ld	hl,#8
   7D7C 39            [11] 4407 	add	hl,sp
   7D7D F9            [ 6] 4408 	ld	sp,hl
   7D7E 2A D5 63      [16] 4409 	ld	hl,(_mapa)
   7D81 E5            [11] 4410 	push	hl
   7D82 21 00 63      [10] 4411 	ld	hl,#_cu
   7D85 E5            [11] 4412 	push	hl
   7D86 CD F5 48      [17] 4413 	call	_moverCuchillo
   7D89 F1            [10] 4414 	pop	af
   7D8A F1            [10] 4415 	pop	af
   7D8B C1            [10] 4416 	pop	bc
                           4417 ;src/main.c:847: while(i){
   7D8C DD 71 FD      [19] 4418 	ld	-3 (ix),c
   7D8F DD 36 FE 70   [19] 4419 	ld	-2 (ix),#<(_enemy)
   7D93 DD 36 FF 5F   [19] 4420 	ld	-1 (ix),#>(_enemy)
   7D97                    4421 00101$:
   7D97 DD 7E FD      [19] 4422 	ld	a,-3 (ix)
   7D9A B7            [ 4] 4423 	or	a, a
   7D9B 28 20         [12] 4424 	jr	Z,00103$
                           4425 ;src/main.c:848: --i;
   7D9D DD 35 FD      [23] 4426 	dec	-3 (ix)
                           4427 ;src/main.c:849: updateEnemy(actual);
   7DA0 DD 6E FE      [19] 4428 	ld	l,-2 (ix)
   7DA3 DD 66 FF      [19] 4429 	ld	h,-1 (ix)
   7DA6 E5            [11] 4430 	push	hl
   7DA7 CD 3C 79      [17] 4431 	call	_updateEnemy
   7DAA F1            [10] 4432 	pop	af
                           4433 ;src/main.c:850: ++actual;
   7DAB DD 7E FE      [19] 4434 	ld	a,-2 (ix)
   7DAE C6 E2         [ 7] 4435 	add	a, #0xE2
   7DB0 DD 77 FE      [19] 4436 	ld	-2 (ix),a
   7DB3 DD 7E FF      [19] 4437 	ld	a,-1 (ix)
   7DB6 CE 00         [ 7] 4438 	adc	a, #0x00
   7DB8 DD 77 FF      [19] 4439 	ld	-1 (ix),a
   7DBB 18 DA         [12] 4440 	jr	00101$
   7DBD                    4441 00103$:
                           4442 ;src/main.c:853: cpct_waitVSYNC();
   7DBD CD B7 55      [17] 4443 	call	_cpct_waitVSYNC
                           4444 ;src/main.c:856: if (prota.mover) {
   7DC0 01 FE 62      [10] 4445 	ld	bc,#_prota + 6
   7DC3 0A            [ 7] 4446 	ld	a,(bc)
   7DC4 B7            [ 4] 4447 	or	a, a
   7DC5 28 07         [12] 4448 	jr	Z,00105$
                           4449 ;src/main.c:857: redibujarProta();
   7DC7 C5            [11] 4450 	push	bc
   7DC8 CD C5 64      [17] 4451 	call	_redibujarProta
   7DCB C1            [10] 4452 	pop	bc
                           4453 ;src/main.c:858: prota.mover = NO;
   7DCC AF            [ 4] 4454 	xor	a, a
   7DCD 02            [ 7] 4455 	ld	(bc),a
   7DCE                    4456 00105$:
                           4457 ;src/main.c:860: if(cu.lanzado && cu.mover){
   7DCE 21 06 63      [10] 4458 	ld	hl, #(_cu + 0x0006) + 0
   7DD1 4E            [ 7] 4459 	ld	c,(hl)
                           4460 ;src/main.c:861: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4461 ;src/main.c:860: if(cu.lanzado && cu.mover){
   7DD2 79            [ 4] 4462 	ld	a,c
   7DD3 B7            [ 4] 4463 	or	a, a
   7DD4 28 30         [12] 4464 	jr	Z,00110$
   7DD6 3A 09 63      [13] 4465 	ld	a, (#(_cu + 0x0009) + 0)
   7DD9 B7            [ 4] 4466 	or	a, a
   7DDA 28 2A         [12] 4467 	jr	Z,00110$
                           4468 ;src/main.c:861: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7DDC 21 01 63      [10] 4469 	ld	hl, #(_cu + 0x0001) + 0
   7DDF 4E            [ 7] 4470 	ld	c,(hl)
   7DE0 21 00 63      [10] 4471 	ld	hl, #_cu + 0
   7DE3 46            [ 7] 4472 	ld	b,(hl)
   7DE4 21 08 63      [10] 4473 	ld	hl, #(_cu + 0x0008) + 0
   7DE7 5E            [ 7] 4474 	ld	e,(hl)
   7DE8 2A D5 63      [16] 4475 	ld	hl,(_mapa)
   7DEB E5            [11] 4476 	push	hl
   7DEC 21 00 01      [10] 4477 	ld	hl,#_g_tablatrans
   7DEF E5            [11] 4478 	push	hl
   7DF0 21 00 63      [10] 4479 	ld	hl,#_cu
   7DF3 E5            [11] 4480 	push	hl
   7DF4 79            [ 4] 4481 	ld	a,c
   7DF5 F5            [11] 4482 	push	af
   7DF6 33            [ 6] 4483 	inc	sp
   7DF7 C5            [11] 4484 	push	bc
   7DF8 33            [ 6] 4485 	inc	sp
   7DF9 7B            [ 4] 4486 	ld	a,e
   7DFA F5            [11] 4487 	push	af
   7DFB 33            [ 6] 4488 	inc	sp
   7DFC CD 05 46      [17] 4489 	call	_redibujarCuchillo
   7DFF 21 09 00      [10] 4490 	ld	hl,#9
   7E02 39            [11] 4491 	add	hl,sp
   7E03 F9            [ 6] 4492 	ld	sp,hl
   7E04 18 28         [12] 4493 	jr	00111$
   7E06                    4494 00110$:
                           4495 ;src/main.c:862: }else if (cu.lanzado && !cu.mover){
   7E06 79            [ 4] 4496 	ld	a,c
   7E07 B7            [ 4] 4497 	or	a, a
   7E08 28 24         [12] 4498 	jr	Z,00111$
   7E0A 3A 09 63      [13] 4499 	ld	a, (#(_cu + 0x0009) + 0)
   7E0D B7            [ 4] 4500 	or	a, a
   7E0E 20 1E         [12] 4501 	jr	NZ,00111$
                           4502 ;src/main.c:863: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E10 21 01 63      [10] 4503 	ld	hl, #(_cu + 0x0001) + 0
   7E13 46            [ 7] 4504 	ld	b,(hl)
   7E14 21 00 63      [10] 4505 	ld	hl, #_cu + 0
   7E17 4E            [ 7] 4506 	ld	c,(hl)
   7E18 21 08 63      [10] 4507 	ld	hl, #(_cu + 0x0008) + 0
   7E1B 56            [ 7] 4508 	ld	d,(hl)
   7E1C 2A D5 63      [16] 4509 	ld	hl,(_mapa)
   7E1F E5            [11] 4510 	push	hl
   7E20 C5            [11] 4511 	push	bc
   7E21 D5            [11] 4512 	push	de
   7E22 33            [ 6] 4513 	inc	sp
   7E23 CD 72 45      [17] 4514 	call	_borrarCuchillo
   7E26 F1            [10] 4515 	pop	af
   7E27 F1            [10] 4516 	pop	af
   7E28 33            [ 6] 4517 	inc	sp
                           4518 ;src/main.c:864: cu.lanzado = NO;
   7E29 21 06 63      [10] 4519 	ld	hl,#(_cu + 0x0006)
   7E2C 36 00         [10] 4520 	ld	(hl),#0x00
   7E2E                    4521 00111$:
                           4522 ;src/main.c:867: i = 2 + num_mapa;
   7E2E 3A D7 63      [13] 4523 	ld	a,(#_num_mapa + 0)
   7E31 C6 02         [ 7] 4524 	add	a, #0x02
   7E33 DD 77 FE      [19] 4525 	ld	-2 (ix),a
                           4526 ;src/main.c:868: actual = enemy;
   7E36 01 70 5F      [10] 4527 	ld	bc,#_enemy
                           4528 ;src/main.c:869: while(i){
   7E39                    4529 00115$:
   7E39 DD 7E FE      [19] 4530 	ld	a,-2 (ix)
   7E3C B7            [ 4] 4531 	or	a, a
   7E3D 28 2C         [12] 4532 	jr	Z,00117$
                           4533 ;src/main.c:871: --i;
   7E3F DD 35 FE      [23] 4534 	dec	-2 (ix)
                           4535 ;src/main.c:872: if(actual->mover){
   7E42 C5            [11] 4536 	push	bc
   7E43 FD E1         [14] 4537 	pop	iy
   7E45 FD 7E 06      [19] 4538 	ld	a,6 (iy)
   7E48 B7            [ 4] 4539 	or	a, a
   7E49 28 18         [12] 4540 	jr	Z,00114$
                           4541 ;src/main.c:873: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7E4B 69            [ 4] 4542 	ld	l, c
   7E4C 60            [ 4] 4543 	ld	h, b
   7E4D 23            [ 6] 4544 	inc	hl
   7E4E 23            [ 6] 4545 	inc	hl
   7E4F 23            [ 6] 4546 	inc	hl
   7E50 5E            [ 7] 4547 	ld	e,(hl)
   7E51 69            [ 4] 4548 	ld	l, c
   7E52 60            [ 4] 4549 	ld	h, b
   7E53 23            [ 6] 4550 	inc	hl
   7E54 23            [ 6] 4551 	inc	hl
   7E55 56            [ 7] 4552 	ld	d,(hl)
   7E56 C5            [11] 4553 	push	bc
   7E57 C5            [11] 4554 	push	bc
   7E58 7B            [ 4] 4555 	ld	a,e
   7E59 F5            [11] 4556 	push	af
   7E5A 33            [ 6] 4557 	inc	sp
   7E5B D5            [11] 4558 	push	de
   7E5C 33            [ 6] 4559 	inc	sp
   7E5D CD 0A 68      [17] 4560 	call	_redibujarEnemigo
   7E60 F1            [10] 4561 	pop	af
   7E61 F1            [10] 4562 	pop	af
   7E62 C1            [10] 4563 	pop	bc
   7E63                    4564 00114$:
                           4565 ;src/main.c:886: ++actual;
   7E63 21 E2 00      [10] 4566 	ld	hl,#0x00E2
   7E66 09            [11] 4567 	add	hl,bc
   7E67 4D            [ 4] 4568 	ld	c,l
   7E68 44            [ 4] 4569 	ld	b,h
   7E69 18 CE         [12] 4570 	jr	00115$
   7E6B                    4571 00117$:
                           4572 ;src/main.c:888: cpct_waitVSYNC();
   7E6B CD B7 55      [17] 4573 	call	_cpct_waitVSYNC
   7E6E C3 5F 7D      [10] 4574 	jp	00119$
                           4575 	.area _CODE
                           4576 	.area _INITIALIZER
   63DA                    4577 __xinit__mapa:
   63DA 00 00              4578 	.dw #0x0000
   63DC                    4579 __xinit__num_mapa:
   63DC 00                 4580 	.db #0x00	; 0
   63DD                    4581 __xinit__puntuacion:
   63DD 00                 4582 	.db #0x00	; 0
   63DE                    4583 __xinit__vidas:
   63DE 05                 4584 	.db #0x05	; 5
                           4585 	.area _CABS (ABS)
