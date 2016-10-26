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
   444C                     129 _dummy_cpct_transparentMaskTable0M0_container::
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
   63FD 32                  192 	.db #0x32	; 50	'2'
   63FE 18                  193 	.db #0x18	; 24
   63FF                     194 _spawnY:
   63FF 2C                  195 	.db #0x2C	; 44
   6400 66                  196 	.db #0x66	; 102	'f'
   6401 9A                  197 	.db #0x9A	; 154
   6402 68                  198 	.db #0x68	; 104	'h'
   6403                     199 _patrolX:
   6403 00                  200 	.db #0x00	; 0
   6404 00                  201 	.db #0x00	; 0
   6405 00                  202 	.db #0x00	; 0
   6406 00                  203 	.db #0x00	; 0
   6407 00                  204 	.db #0x00	; 0
   6408 14                  205 	.db #0x14	; 20
   6409 47                  206 	.db #0x47	; 71	'G'
   640A 00                  207 	.db #0x00	; 0
   640B 00                  208 	.db #0x00	; 0
   640C 00                  209 	.db 0x00
   640D 00                  210 	.db #0x00	; 0
   640E 00                  211 	.db #0x00	; 0
   640F 00                  212 	.db #0x00	; 0
   6410 00                  213 	.db #0x00	; 0
   6411 00                  214 	.db 0x00
   6412 00                  215 	.db #0x00	; 0
   6413 00                  216 	.db #0x00	; 0
   6414 00                  217 	.db #0x00	; 0
   6415 00                  218 	.db #0x00	; 0
   6416 00                  219 	.db 0x00
   6417                     220 _patrolY:
   6417 00                  221 	.db #0x00	; 0
   6418 00                  222 	.db #0x00	; 0
   6419 00                  223 	.db #0x00	; 0
   641A 00                  224 	.db #0x00	; 0
   641B 00                  225 	.db 0x00
   641C 5A                  226 	.db #0x5A	; 90	'Z'
   641D 9C                  227 	.db #0x9C	; 156
   641E 00                  228 	.db #0x00	; 0
   641F 00                  229 	.db #0x00	; 0
   6420 00                  230 	.db 0x00
   6421 00                  231 	.db #0x00	; 0
   6422 00                  232 	.db #0x00	; 0
   6423 00                  233 	.db #0x00	; 0
   6424 00                  234 	.db #0x00	; 0
   6425 00                  235 	.db 0x00
   6426 00                  236 	.db #0x00	; 0
   6427 00                  237 	.db #0x00	; 0
   6428 00                  238 	.db #0x00	; 0
   6429 00                  239 	.db #0x00	; 0
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
   64EA C2 0E 7C      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64ED 21 00 02      [10]  380 	ld	hl,#0x0200
   64F0 CD 16 53      [17]  381 	call	_cpct_isKeyPressed
   64F3 7D            [ 4]  382 	ld	a,l
   64F4 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:149: moverDerecha();
   64F5 C2 33 7C      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64F8 21 00 01      [10]  387 	ld	hl,#0x0100
   64FB CD 16 53      [17]  388 	call	_cpct_isKeyPressed
   64FE 7D            [ 4]  389 	ld	a,l
   64FF B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:151: moverArriba();
   6500 C2 78 7C      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6503 21 00 04      [10]  394 	ld	hl,#0x0400
   6506 CD 16 53      [17]  395 	call	_cpct_isKeyPressed
   6509 7D            [ 4]  396 	ld	a,l
   650A B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:153: moverAbajo();
   650B C2 9C 7C      [10]  399 	jp	NZ,_moverAbajo
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
   6537 CD 6C 40      [17]  431 	call	_lanzarCuchillo
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
   67C0 DD 75 FE      [19]  892 	ld	-2 (ix),l
   67C3 DD 74 FF      [19]  893 	ld	-1 (ix),h
   67C6 DD 4E 05      [19]  894 	ld	c,5 (ix)
   67C9 06 00         [ 7]  895 	ld	b,#0x00
   67CB 79            [ 4]  896 	ld	a,c
   67CC C6 E8         [ 7]  897 	add	a,#0xE8
   67CE DD 77 FC      [19]  898 	ld	-4 (ix),a
   67D1 78            [ 4]  899 	ld	a,b
   67D2 CE FF         [ 7]  900 	adc	a,#0xFF
   67D4 DD 77 FD      [19]  901 	ld	-3 (ix),a
   67D7 E1            [10]  902 	pop	hl
   67D8 E5            [11]  903 	push	hl
   67D9 DD CB FD 7E   [20]  904 	bit	7, -3 (ix)
   67DD 28 04         [12]  905 	jr	Z,00105$
   67DF 21 EB FF      [10]  906 	ld	hl,#0xFFEB
   67E2 09            [11]  907 	add	hl,bc
   67E3                     908 00105$:
   67E3 CB 2C         [ 8]  909 	sra	h
   67E5 CB 1D         [ 8]  910 	rr	l
   67E7 CB 2C         [ 8]  911 	sra	h
   67E9 CB 1D         [ 8]  912 	rr	l
   67EB 45            [ 4]  913 	ld	b,l
   67EC DD 4E 04      [19]  914 	ld	c,4 (ix)
   67EF CB 39         [ 8]  915 	srl	c
   67F1 DD 6E FE      [19]  916 	ld	l,-2 (ix)
   67F4 DD 66 FF      [19]  917 	ld	h,-1 (ix)
   67F7 E5            [11]  918 	push	hl
   67F8 21 F0 C0      [10]  919 	ld	hl,#0xC0F0
   67FB E5            [11]  920 	push	hl
   67FC 3E 28         [ 7]  921 	ld	a,#0x28
   67FE F5            [11]  922 	push	af
   67FF 33            [ 6]  923 	inc	sp
   6800 D5            [11]  924 	push	de
   6801 C5            [11]  925 	push	bc
   6802 CD F7 53      [17]  926 	call	_cpct_etm_drawTileBox2x4
                            927 ;src/main.c:225: enemy->mover = NO;
   6805 21 76 5F      [10]  928 	ld	hl,#(_enemy + 0x0006)
   6808 36 00         [10]  929 	ld	(hl),#0x00
   680A DD F9         [10]  930 	ld	sp, ix
   680C DD E1         [14]  931 	pop	ix
   680E C9            [10]  932 	ret
                            933 ;src/main.c:228: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            934 ;	---------------------------------
                            935 ; Function redibujarEnemigo
                            936 ; ---------------------------------
   680F                     937 _redibujarEnemigo::
   680F DD E5         [15]  938 	push	ix
   6811 DD 21 00 00   [14]  939 	ld	ix,#0
   6815 DD 39         [15]  940 	add	ix,sp
                            941 ;src/main.c:229: borrarEnemigo(x, y);
   6817 DD 66 05      [19]  942 	ld	h,5 (ix)
   681A DD 6E 04      [19]  943 	ld	l,4 (ix)
   681D E5            [11]  944 	push	hl
   681E CD 99 67      [17]  945 	call	_borrarEnemigo
   6821 F1            [10]  946 	pop	af
                            947 ;src/main.c:230: enemy->px = enemy->x;
   6822 DD 4E 06      [19]  948 	ld	c,6 (ix)
   6825 DD 46 07      [19]  949 	ld	b,7 (ix)
   6828 59            [ 4]  950 	ld	e, c
   6829 50            [ 4]  951 	ld	d, b
   682A 13            [ 6]  952 	inc	de
   682B 13            [ 6]  953 	inc	de
   682C 0A            [ 7]  954 	ld	a,(bc)
   682D 12            [ 7]  955 	ld	(de),a
                            956 ;src/main.c:231: enemy->py = enemy->y;
   682E 59            [ 4]  957 	ld	e, c
   682F 50            [ 4]  958 	ld	d, b
   6830 13            [ 6]  959 	inc	de
   6831 13            [ 6]  960 	inc	de
   6832 13            [ 6]  961 	inc	de
   6833 69            [ 4]  962 	ld	l, c
   6834 60            [ 4]  963 	ld	h, b
   6835 23            [ 6]  964 	inc	hl
   6836 7E            [ 7]  965 	ld	a,(hl)
   6837 12            [ 7]  966 	ld	(de),a
                            967 ;src/main.c:232: dibujarEnemigo(enemy);
   6838 C5            [11]  968 	push	bc
   6839 CD B1 66      [17]  969 	call	_dibujarEnemigo
   683C F1            [10]  970 	pop	af
   683D DD E1         [14]  971 	pop	ix
   683F C9            [10]  972 	ret
                            973 ;src/main.c:235: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            974 ;	---------------------------------
                            975 ; Function checkEnemyCollision
                            976 ; ---------------------------------
   6840                     977 _checkEnemyCollision::
   6840 DD E5         [15]  978 	push	ix
   6842 DD 21 00 00   [14]  979 	ld	ix,#0
   6846 DD 39         [15]  980 	add	ix,sp
   6848 21 F7 FF      [10]  981 	ld	hl,#-9
   684B 39            [11]  982 	add	hl,sp
   684C F9            [ 6]  983 	ld	sp,hl
                            984 ;src/main.c:237: u8 colisiona = 1;
   684D DD 36 F7 01   [19]  985 	ld	-9 (ix),#0x01
                            986 ;src/main.c:239: switch (direction) {
   6851 3E 03         [ 7]  987 	ld	a,#0x03
   6853 DD 96 04      [19]  988 	sub	a, 4 (ix)
   6856 DA 33 6C      [10]  989 	jp	C,00165$
                            990 ;src/main.c:241: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6859 DD 4E 05      [19]  991 	ld	c,5 (ix)
   685C DD 46 06      [19]  992 	ld	b,6 (ix)
   685F 0A            [ 7]  993 	ld	a,(bc)
   6860 5F            [ 4]  994 	ld	e,a
   6861 21 01 00      [10]  995 	ld	hl,#0x0001
   6864 09            [11]  996 	add	hl,bc
   6865 DD 75 F8      [19]  997 	ld	-8 (ix),l
   6868 DD 74 F9      [19]  998 	ld	-7 (ix),h
   686B DD 6E F8      [19]  999 	ld	l,-8 (ix)
   686E DD 66 F9      [19] 1000 	ld	h,-7 (ix)
   6871 56            [ 7] 1001 	ld	d,(hl)
                           1002 ;src/main.c:254: enemy->muerto = SI;
   6872 21 08 00      [10] 1003 	ld	hl,#0x0008
   6875 09            [11] 1004 	add	hl,bc
   6876 DD 75 FA      [19] 1005 	ld	-6 (ix),l
   6879 DD 74 FB      [19] 1006 	ld	-5 (ix),h
                           1007 ;src/main.c:261: enemy->mira = M_izquierda;
   687C 21 07 00      [10] 1008 	ld	hl,#0x0007
   687F 09            [11] 1009 	add	hl,bc
   6880 DD 75 FC      [19] 1010 	ld	-4 (ix),l
   6883 DD 74 FD      [19] 1011 	ld	-3 (ix),h
                           1012 ;src/main.c:239: switch (direction) {
   6886 D5            [11] 1013 	push	de
   6887 DD 5E 04      [19] 1014 	ld	e,4 (ix)
   688A 16 00         [ 7] 1015 	ld	d,#0x00
   688C 21 94 68      [10] 1016 	ld	hl,#00268$
   688F 19            [11] 1017 	add	hl,de
   6890 19            [11] 1018 	add	hl,de
   6891 19            [11] 1019 	add	hl,de
   6892 D1            [10] 1020 	pop	de
   6893 E9            [ 4] 1021 	jp	(hl)
   6894                    1022 00268$:
   6894 C3 A0 68      [10] 1023 	jp	00101$
   6897 C3 88 69      [10] 1024 	jp	00117$
   689A C3 6C 6A      [10] 1025 	jp	00133$
   689D C3 4A 6B      [10] 1026 	jp	00149$
                           1027 ;src/main.c:240: case 0:
   68A0                    1028 00101$:
                           1029 ;src/main.c:241: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   68A0 7B            [ 4] 1030 	ld	a,e
   68A1 C6 05         [ 7] 1031 	add	a, #0x05
   68A3 C5            [11] 1032 	push	bc
   68A4 D5            [11] 1033 	push	de
   68A5 33            [ 6] 1034 	inc	sp
   68A6 F5            [11] 1035 	push	af
   68A7 33            [ 6] 1036 	inc	sp
   68A8 2A D5 63      [16] 1037 	ld	hl,(_mapa)
   68AB E5            [11] 1038 	push	hl
   68AC CD 2C 4A      [17] 1039 	call	_getTilePtr
   68AF F1            [10] 1040 	pop	af
   68B0 F1            [10] 1041 	pop	af
   68B1 C1            [10] 1042 	pop	bc
   68B2 5E            [ 7] 1043 	ld	e,(hl)
   68B3 3E 02         [ 7] 1044 	ld	a,#0x02
   68B5 93            [ 4] 1045 	sub	a, e
   68B6 DA 7D 69      [10] 1046 	jp	C,00113$
                           1047 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   68B9 DD 6E F8      [19] 1048 	ld	l,-8 (ix)
   68BC DD 66 F9      [19] 1049 	ld	h,-7 (ix)
   68BF 7E            [ 7] 1050 	ld	a,(hl)
   68C0 C6 0B         [ 7] 1051 	add	a, #0x0B
   68C2 57            [ 4] 1052 	ld	d,a
   68C3 0A            [ 7] 1053 	ld	a,(bc)
   68C4 C6 05         [ 7] 1054 	add	a, #0x05
   68C6 C5            [11] 1055 	push	bc
   68C7 D5            [11] 1056 	push	de
   68C8 33            [ 6] 1057 	inc	sp
   68C9 F5            [11] 1058 	push	af
   68CA 33            [ 6] 1059 	inc	sp
   68CB 2A D5 63      [16] 1060 	ld	hl,(_mapa)
   68CE E5            [11] 1061 	push	hl
   68CF CD 2C 4A      [17] 1062 	call	_getTilePtr
   68D2 F1            [10] 1063 	pop	af
   68D3 F1            [10] 1064 	pop	af
   68D4 C1            [10] 1065 	pop	bc
   68D5 5E            [ 7] 1066 	ld	e,(hl)
   68D6 3E 02         [ 7] 1067 	ld	a,#0x02
   68D8 93            [ 4] 1068 	sub	a, e
   68D9 DA 7D 69      [10] 1069 	jp	C,00113$
                           1070 ;src/main.c:243: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   68DC DD 6E F8      [19] 1071 	ld	l,-8 (ix)
   68DF DD 66 F9      [19] 1072 	ld	h,-7 (ix)
   68E2 7E            [ 7] 1073 	ld	a,(hl)
   68E3 C6 16         [ 7] 1074 	add	a, #0x16
   68E5 57            [ 4] 1075 	ld	d,a
   68E6 0A            [ 7] 1076 	ld	a,(bc)
   68E7 C6 05         [ 7] 1077 	add	a, #0x05
   68E9 C5            [11] 1078 	push	bc
   68EA D5            [11] 1079 	push	de
   68EB 33            [ 6] 1080 	inc	sp
   68EC F5            [11] 1081 	push	af
   68ED 33            [ 6] 1082 	inc	sp
   68EE 2A D5 63      [16] 1083 	ld	hl,(_mapa)
   68F1 E5            [11] 1084 	push	hl
   68F2 CD 2C 4A      [17] 1085 	call	_getTilePtr
   68F5 F1            [10] 1086 	pop	af
   68F6 F1            [10] 1087 	pop	af
   68F7 C1            [10] 1088 	pop	bc
   68F8 5E            [ 7] 1089 	ld	e,(hl)
   68F9 3E 02         [ 7] 1090 	ld	a,#0x02
   68FB 93            [ 4] 1091 	sub	a, e
   68FC DA 7D 69      [10] 1092 	jp	C,00113$
                           1093 ;src/main.c:245: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   68FF 21 01 63      [10] 1094 	ld	hl, #_cu + 1
   6902 5E            [ 7] 1095 	ld	e,(hl)
   6903 16 00         [ 7] 1096 	ld	d,#0x00
   6905 21 04 00      [10] 1097 	ld	hl,#0x0004
   6908 19            [11] 1098 	add	hl,de
   6909 DD 75 FE      [19] 1099 	ld	-2 (ix),l
   690C DD 74 FF      [19] 1100 	ld	-1 (ix),h
   690F DD 6E F8      [19] 1101 	ld	l,-8 (ix)
   6912 DD 66 F9      [19] 1102 	ld	h,-7 (ix)
   6915 6E            [ 7] 1103 	ld	l,(hl)
   6916 26 00         [ 7] 1104 	ld	h,#0x00
   6918 DD 7E FE      [19] 1105 	ld	a,-2 (ix)
   691B 95            [ 4] 1106 	sub	a, l
   691C DD 7E FF      [19] 1107 	ld	a,-1 (ix)
   691F 9C            [ 4] 1108 	sbc	a, h
   6920 E2 25 69      [10] 1109 	jp	PO, 00269$
   6923 EE 80         [ 7] 1110 	xor	a, #0x80
   6925                    1111 00269$:
   6925 FA 3A 69      [10] 1112 	jp	M,00108$
   6928 D5            [11] 1113 	push	de
   6929 11 16 00      [10] 1114 	ld	de,#0x0016
   692C 19            [11] 1115 	add	hl, de
   692D D1            [10] 1116 	pop	de
   692E 7D            [ 4] 1117 	ld	a,l
   692F 93            [ 4] 1118 	sub	a, e
   6930 7C            [ 4] 1119 	ld	a,h
   6931 9A            [ 4] 1120 	sbc	a, d
   6932 E2 37 69      [10] 1121 	jp	PO, 00270$
   6935 EE 80         [ 7] 1122 	xor	a, #0x80
   6937                    1123 00270$:
   6937 F2 41 69      [10] 1124 	jp	P,00109$
   693A                    1125 00108$:
                           1126 ;src/main.c:246: colisiona = 0;
   693A DD 36 F7 00   [19] 1127 	ld	-9 (ix),#0x00
   693E C3 33 6C      [10] 1128 	jp	00165$
   6941                    1129 00109$:
                           1130 ;src/main.c:249: if(cu.x > enemy->x){ //si el cu esta abajo
   6941 21 00 63      [10] 1131 	ld	hl, #_cu + 0
   6944 5E            [ 7] 1132 	ld	e,(hl)
   6945 0A            [ 7] 1133 	ld	a,(bc)
   6946 4F            [ 4] 1134 	ld	c,a
   6947 93            [ 4] 1135 	sub	a, e
   6948 30 2C         [12] 1136 	jr	NC,00106$
                           1137 ;src/main.c:250: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   694A 6B            [ 4] 1138 	ld	l,e
   694B 26 00         [ 7] 1139 	ld	h,#0x00
   694D 06 00         [ 7] 1140 	ld	b,#0x00
   694F 03            [ 6] 1141 	inc	bc
   6950 03            [ 6] 1142 	inc	bc
   6951 03            [ 6] 1143 	inc	bc
   6952 03            [ 6] 1144 	inc	bc
   6953 BF            [ 4] 1145 	cp	a, a
   6954 ED 42         [15] 1146 	sbc	hl, bc
   6956 3E 01         [ 7] 1147 	ld	a,#0x01
   6958 BD            [ 4] 1148 	cp	a, l
   6959 3E 00         [ 7] 1149 	ld	a,#0x00
   695B 9C            [ 4] 1150 	sbc	a, h
   695C E2 61 69      [10] 1151 	jp	PO, 00271$
   695F EE 80         [ 7] 1152 	xor	a, #0x80
   6961                    1153 00271$:
   6961 F2 6B 69      [10] 1154 	jp	P,00103$
                           1155 ;src/main.c:251: colisiona = 0;
   6964 DD 36 F7 00   [19] 1156 	ld	-9 (ix),#0x00
   6968 C3 33 6C      [10] 1157 	jp	00165$
   696B                    1158 00103$:
                           1159 ;src/main.c:254: enemy->muerto = SI;
   696B DD 6E FA      [19] 1160 	ld	l,-6 (ix)
   696E DD 66 FB      [19] 1161 	ld	h,-5 (ix)
   6971 36 01         [10] 1162 	ld	(hl),#0x01
   6973 C3 33 6C      [10] 1163 	jp	00165$
   6976                    1164 00106$:
                           1165 ;src/main.c:257: colisiona = 0;
   6976 DD 36 F7 00   [19] 1166 	ld	-9 (ix),#0x00
   697A C3 33 6C      [10] 1167 	jp	00165$
   697D                    1168 00113$:
                           1169 ;src/main.c:261: enemy->mira = M_izquierda;
   697D DD 6E FC      [19] 1170 	ld	l,-4 (ix)
   6980 DD 66 FD      [19] 1171 	ld	h,-3 (ix)
   6983 36 01         [10] 1172 	ld	(hl),#0x01
                           1173 ;src/main.c:263: break;
   6985 C3 33 6C      [10] 1174 	jp	00165$
                           1175 ;src/main.c:264: case 1:
   6988                    1176 00117$:
                           1177 ;src/main.c:265: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6988 1D            [ 4] 1178 	dec	e
   6989 C5            [11] 1179 	push	bc
   698A D5            [11] 1180 	push	de
   698B 2A D5 63      [16] 1181 	ld	hl,(_mapa)
   698E E5            [11] 1182 	push	hl
   698F CD 2C 4A      [17] 1183 	call	_getTilePtr
   6992 F1            [10] 1184 	pop	af
   6993 F1            [10] 1185 	pop	af
   6994 C1            [10] 1186 	pop	bc
   6995 5E            [ 7] 1187 	ld	e,(hl)
   6996 3E 02         [ 7] 1188 	ld	a,#0x02
   6998 93            [ 4] 1189 	sub	a, e
   6999 DA 61 6A      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   699C DD 6E F8      [19] 1192 	ld	l,-8 (ix)
   699F DD 66 F9      [19] 1193 	ld	h,-7 (ix)
   69A2 7E            [ 7] 1194 	ld	a,(hl)
   69A3 C6 0B         [ 7] 1195 	add	a, #0x0B
   69A5 57            [ 4] 1196 	ld	d,a
   69A6 0A            [ 7] 1197 	ld	a,(bc)
   69A7 C6 FF         [ 7] 1198 	add	a,#0xFF
   69A9 C5            [11] 1199 	push	bc
   69AA D5            [11] 1200 	push	de
   69AB 33            [ 6] 1201 	inc	sp
   69AC F5            [11] 1202 	push	af
   69AD 33            [ 6] 1203 	inc	sp
   69AE 2A D5 63      [16] 1204 	ld	hl,(_mapa)
   69B1 E5            [11] 1205 	push	hl
   69B2 CD 2C 4A      [17] 1206 	call	_getTilePtr
   69B5 F1            [10] 1207 	pop	af
   69B6 F1            [10] 1208 	pop	af
   69B7 C1            [10] 1209 	pop	bc
   69B8 5E            [ 7] 1210 	ld	e,(hl)
   69B9 3E 02         [ 7] 1211 	ld	a,#0x02
   69BB 93            [ 4] 1212 	sub	a, e
   69BC DA 61 6A      [10] 1213 	jp	C,00129$
                           1214 ;src/main.c:267: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   69BF DD 6E F8      [19] 1215 	ld	l,-8 (ix)
   69C2 DD 66 F9      [19] 1216 	ld	h,-7 (ix)
   69C5 7E            [ 7] 1217 	ld	a,(hl)
   69C6 C6 16         [ 7] 1218 	add	a, #0x16
   69C8 57            [ 4] 1219 	ld	d,a
   69C9 0A            [ 7] 1220 	ld	a,(bc)
   69CA C6 FF         [ 7] 1221 	add	a,#0xFF
   69CC C5            [11] 1222 	push	bc
   69CD D5            [11] 1223 	push	de
   69CE 33            [ 6] 1224 	inc	sp
   69CF F5            [11] 1225 	push	af
   69D0 33            [ 6] 1226 	inc	sp
   69D1 2A D5 63      [16] 1227 	ld	hl,(_mapa)
   69D4 E5            [11] 1228 	push	hl
   69D5 CD 2C 4A      [17] 1229 	call	_getTilePtr
   69D8 F1            [10] 1230 	pop	af
   69D9 F1            [10] 1231 	pop	af
   69DA C1            [10] 1232 	pop	bc
   69DB 5E            [ 7] 1233 	ld	e,(hl)
   69DC 3E 02         [ 7] 1234 	ld	a,#0x02
   69DE 93            [ 4] 1235 	sub	a, e
   69DF DA 61 6A      [10] 1236 	jp	C,00129$
                           1237 ;src/main.c:269: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69E2 21 01 63      [10] 1238 	ld	hl, #_cu + 1
   69E5 5E            [ 7] 1239 	ld	e,(hl)
   69E6 16 00         [ 7] 1240 	ld	d,#0x00
   69E8 21 04 00      [10] 1241 	ld	hl,#0x0004
   69EB 19            [11] 1242 	add	hl,de
   69EC DD 75 FE      [19] 1243 	ld	-2 (ix),l
   69EF DD 74 FF      [19] 1244 	ld	-1 (ix),h
   69F2 DD 6E F8      [19] 1245 	ld	l,-8 (ix)
   69F5 DD 66 F9      [19] 1246 	ld	h,-7 (ix)
   69F8 6E            [ 7] 1247 	ld	l,(hl)
   69F9 26 00         [ 7] 1248 	ld	h,#0x00
   69FB DD 7E FE      [19] 1249 	ld	a,-2 (ix)
   69FE 95            [ 4] 1250 	sub	a, l
   69FF DD 7E FF      [19] 1251 	ld	a,-1 (ix)
   6A02 9C            [ 4] 1252 	sbc	a, h
   6A03 E2 08 6A      [10] 1253 	jp	PO, 00272$
   6A06 EE 80         [ 7] 1254 	xor	a, #0x80
   6A08                    1255 00272$:
   6A08 FA 1D 6A      [10] 1256 	jp	M,00124$
   6A0B D5            [11] 1257 	push	de
   6A0C 11 16 00      [10] 1258 	ld	de,#0x0016
   6A0F 19            [11] 1259 	add	hl, de
   6A10 D1            [10] 1260 	pop	de
   6A11 7D            [ 4] 1261 	ld	a,l
   6A12 93            [ 4] 1262 	sub	a, e
   6A13 7C            [ 4] 1263 	ld	a,h
   6A14 9A            [ 4] 1264 	sbc	a, d
   6A15 E2 1A 6A      [10] 1265 	jp	PO, 00273$
   6A18 EE 80         [ 7] 1266 	xor	a, #0x80
   6A1A                    1267 00273$:
   6A1A F2 24 6A      [10] 1268 	jp	P,00125$
   6A1D                    1269 00124$:
                           1270 ;src/main.c:270: colisiona = 0;
   6A1D DD 36 F7 00   [19] 1271 	ld	-9 (ix),#0x00
   6A21 C3 33 6C      [10] 1272 	jp	00165$
   6A24                    1273 00125$:
                           1274 ;src/main.c:273: if(enemy->x > cu.x){ //si el cu esta abajo
   6A24 0A            [ 7] 1275 	ld	a,(bc)
   6A25 5F            [ 4] 1276 	ld	e,a
   6A26 21 00 63      [10] 1277 	ld	hl, #_cu + 0
   6A29 4E            [ 7] 1278 	ld	c,(hl)
   6A2A 79            [ 4] 1279 	ld	a,c
   6A2B 93            [ 4] 1280 	sub	a, e
   6A2C 30 2C         [12] 1281 	jr	NC,00122$
                           1282 ;src/main.c:274: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   6A2E 6B            [ 4] 1283 	ld	l,e
   6A2F 26 00         [ 7] 1284 	ld	h,#0x00
   6A31 06 00         [ 7] 1285 	ld	b,#0x00
   6A33 03            [ 6] 1286 	inc	bc
   6A34 03            [ 6] 1287 	inc	bc
   6A35 03            [ 6] 1288 	inc	bc
   6A36 03            [ 6] 1289 	inc	bc
   6A37 BF            [ 4] 1290 	cp	a, a
   6A38 ED 42         [15] 1291 	sbc	hl, bc
   6A3A 3E 01         [ 7] 1292 	ld	a,#0x01
   6A3C BD            [ 4] 1293 	cp	a, l
   6A3D 3E 00         [ 7] 1294 	ld	a,#0x00
   6A3F 9C            [ 4] 1295 	sbc	a, h
   6A40 E2 45 6A      [10] 1296 	jp	PO, 00274$
   6A43 EE 80         [ 7] 1297 	xor	a, #0x80
   6A45                    1298 00274$:
   6A45 F2 4F 6A      [10] 1299 	jp	P,00119$
                           1300 ;src/main.c:275: colisiona = 0;
   6A48 DD 36 F7 00   [19] 1301 	ld	-9 (ix),#0x00
   6A4C C3 33 6C      [10] 1302 	jp	00165$
   6A4F                    1303 00119$:
                           1304 ;src/main.c:278: enemy->muerto = SI;
   6A4F DD 6E FA      [19] 1305 	ld	l,-6 (ix)
   6A52 DD 66 FB      [19] 1306 	ld	h,-5 (ix)
   6A55 36 01         [10] 1307 	ld	(hl),#0x01
   6A57 C3 33 6C      [10] 1308 	jp	00165$
   6A5A                    1309 00122$:
                           1310 ;src/main.c:281: colisiona = 0;
   6A5A DD 36 F7 00   [19] 1311 	ld	-9 (ix),#0x00
   6A5E C3 33 6C      [10] 1312 	jp	00165$
   6A61                    1313 00129$:
                           1314 ;src/main.c:285: enemy->mira = M_derecha;
   6A61 DD 6E FC      [19] 1315 	ld	l,-4 (ix)
   6A64 DD 66 FD      [19] 1316 	ld	h,-3 (ix)
   6A67 36 00         [10] 1317 	ld	(hl),#0x00
                           1318 ;src/main.c:287: break;
   6A69 C3 33 6C      [10] 1319 	jp	00165$
                           1320 ;src/main.c:288: case 2:
   6A6C                    1321 00133$:
                           1322 ;src/main.c:289: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6A6C 15            [ 4] 1323 	dec	d
   6A6D 15            [ 4] 1324 	dec	d
   6A6E C5            [11] 1325 	push	bc
   6A6F D5            [11] 1326 	push	de
   6A70 2A D5 63      [16] 1327 	ld	hl,(_mapa)
   6A73 E5            [11] 1328 	push	hl
   6A74 CD 2C 4A      [17] 1329 	call	_getTilePtr
   6A77 F1            [10] 1330 	pop	af
   6A78 F1            [10] 1331 	pop	af
   6A79 C1            [10] 1332 	pop	bc
   6A7A 5E            [ 7] 1333 	ld	e,(hl)
   6A7B 3E 02         [ 7] 1334 	ld	a,#0x02
   6A7D 93            [ 4] 1335 	sub	a, e
   6A7E DA 42 6B      [10] 1336 	jp	C,00145$
                           1337 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6A81 DD 6E F8      [19] 1338 	ld	l,-8 (ix)
   6A84 DD 66 F9      [19] 1339 	ld	h,-7 (ix)
   6A87 56            [ 7] 1340 	ld	d,(hl)
   6A88 15            [ 4] 1341 	dec	d
   6A89 15            [ 4] 1342 	dec	d
   6A8A 0A            [ 7] 1343 	ld	a,(bc)
   6A8B C6 02         [ 7] 1344 	add	a, #0x02
   6A8D C5            [11] 1345 	push	bc
   6A8E D5            [11] 1346 	push	de
   6A8F 33            [ 6] 1347 	inc	sp
   6A90 F5            [11] 1348 	push	af
   6A91 33            [ 6] 1349 	inc	sp
   6A92 2A D5 63      [16] 1350 	ld	hl,(_mapa)
   6A95 E5            [11] 1351 	push	hl
   6A96 CD 2C 4A      [17] 1352 	call	_getTilePtr
   6A99 F1            [10] 1353 	pop	af
   6A9A F1            [10] 1354 	pop	af
   6A9B C1            [10] 1355 	pop	bc
   6A9C 5E            [ 7] 1356 	ld	e,(hl)
   6A9D 3E 02         [ 7] 1357 	ld	a,#0x02
   6A9F 93            [ 4] 1358 	sub	a, e
   6AA0 DA 42 6B      [10] 1359 	jp	C,00145$
                           1360 ;src/main.c:291: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6AA3 DD 6E F8      [19] 1361 	ld	l,-8 (ix)
   6AA6 DD 66 F9      [19] 1362 	ld	h,-7 (ix)
   6AA9 56            [ 7] 1363 	ld	d,(hl)
   6AAA 15            [ 4] 1364 	dec	d
   6AAB 15            [ 4] 1365 	dec	d
   6AAC 0A            [ 7] 1366 	ld	a,(bc)
   6AAD C6 04         [ 7] 1367 	add	a, #0x04
   6AAF C5            [11] 1368 	push	bc
   6AB0 D5            [11] 1369 	push	de
   6AB1 33            [ 6] 1370 	inc	sp
   6AB2 F5            [11] 1371 	push	af
   6AB3 33            [ 6] 1372 	inc	sp
   6AB4 2A D5 63      [16] 1373 	ld	hl,(_mapa)
   6AB7 E5            [11] 1374 	push	hl
   6AB8 CD 2C 4A      [17] 1375 	call	_getTilePtr
   6ABB F1            [10] 1376 	pop	af
   6ABC F1            [10] 1377 	pop	af
   6ABD C1            [10] 1378 	pop	bc
   6ABE 5E            [ 7] 1379 	ld	e,(hl)
   6ABF 3E 02         [ 7] 1380 	ld	a,#0x02
   6AC1 93            [ 4] 1381 	sub	a, e
   6AC2 DA 42 6B      [10] 1382 	jp	C,00145$
                           1383 ;src/main.c:293: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6AC5 21 00 63      [10] 1384 	ld	hl, #_cu + 0
   6AC8 5E            [ 7] 1385 	ld	e,(hl)
   6AC9 16 00         [ 7] 1386 	ld	d,#0x00
   6ACB 21 02 00      [10] 1387 	ld	hl,#0x0002
   6ACE 19            [11] 1388 	add	hl,de
   6ACF DD 75 FE      [19] 1389 	ld	-2 (ix),l
   6AD2 DD 74 FF      [19] 1390 	ld	-1 (ix),h
   6AD5 0A            [ 7] 1391 	ld	a,(bc)
   6AD6 6F            [ 4] 1392 	ld	l,a
   6AD7 26 00         [ 7] 1393 	ld	h,#0x00
   6AD9 DD 7E FE      [19] 1394 	ld	a,-2 (ix)
   6ADC 95            [ 4] 1395 	sub	a, l
   6ADD DD 7E FF      [19] 1396 	ld	a,-1 (ix)
   6AE0 9C            [ 4] 1397 	sbc	a, h
   6AE1 E2 E6 6A      [10] 1398 	jp	PO, 00275$
   6AE4 EE 80         [ 7] 1399 	xor	a, #0x80
   6AE6                    1400 00275$:
   6AE6 FA F9 6A      [10] 1401 	jp	M,00140$
   6AE9 23            [ 6] 1402 	inc	hl
   6AEA 23            [ 6] 1403 	inc	hl
   6AEB 23            [ 6] 1404 	inc	hl
   6AEC 23            [ 6] 1405 	inc	hl
   6AED 7D            [ 4] 1406 	ld	a,l
   6AEE 93            [ 4] 1407 	sub	a, e
   6AEF 7C            [ 4] 1408 	ld	a,h
   6AF0 9A            [ 4] 1409 	sbc	a, d
   6AF1 E2 F6 6A      [10] 1410 	jp	PO, 00276$
   6AF4 EE 80         [ 7] 1411 	xor	a, #0x80
   6AF6                    1412 00276$:
   6AF6 F2 FF 6A      [10] 1413 	jp	P,00141$
   6AF9                    1414 00140$:
                           1415 ;src/main.c:295: colisiona = 0;
   6AF9 DD 36 F7 00   [19] 1416 	ld	-9 (ix),#0x00
   6AFD 18 4B         [12] 1417 	jr	00149$
   6AFF                    1418 00141$:
                           1419 ;src/main.c:298: if(enemy->y>cu.y){
   6AFF DD 6E F8      [19] 1420 	ld	l,-8 (ix)
   6B02 DD 66 F9      [19] 1421 	ld	h,-7 (ix)
   6B05 5E            [ 7] 1422 	ld	e,(hl)
   6B06 21 01 63      [10] 1423 	ld	hl, #(_cu + 0x0001) + 0
   6B09 6E            [ 7] 1424 	ld	l,(hl)
   6B0A 7D            [ 4] 1425 	ld	a,l
   6B0B 93            [ 4] 1426 	sub	a, e
   6B0C 30 2E         [12] 1427 	jr	NC,00138$
                           1428 ;src/main.c:299: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6B0E 16 00         [ 7] 1429 	ld	d,#0x00
   6B10 26 00         [ 7] 1430 	ld	h,#0x00
   6B12 D5            [11] 1431 	push	de
   6B13 11 08 00      [10] 1432 	ld	de,#0x0008
   6B16 19            [11] 1433 	add	hl, de
   6B17 D1            [10] 1434 	pop	de
   6B18 7B            [ 4] 1435 	ld	a,e
   6B19 95            [ 4] 1436 	sub	a, l
   6B1A 5F            [ 4] 1437 	ld	e,a
   6B1B 7A            [ 4] 1438 	ld	a,d
   6B1C 9C            [ 4] 1439 	sbc	a, h
   6B1D 57            [ 4] 1440 	ld	d,a
   6B1E 3E 02         [ 7] 1441 	ld	a,#0x02
   6B20 BB            [ 4] 1442 	cp	a, e
   6B21 3E 00         [ 7] 1443 	ld	a,#0x00
   6B23 9A            [ 4] 1444 	sbc	a, d
   6B24 E2 29 6B      [10] 1445 	jp	PO, 00277$
   6B27 EE 80         [ 7] 1446 	xor	a, #0x80
   6B29                    1447 00277$:
   6B29 F2 32 6B      [10] 1448 	jp	P,00135$
                           1449 ;src/main.c:300: colisiona = 0;
   6B2C DD 36 F7 00   [19] 1450 	ld	-9 (ix),#0x00
   6B30 18 18         [12] 1451 	jr	00149$
   6B32                    1452 00135$:
                           1453 ;src/main.c:303: enemy->muerto = SI;
   6B32 DD 6E FA      [19] 1454 	ld	l,-6 (ix)
   6B35 DD 66 FB      [19] 1455 	ld	h,-5 (ix)
   6B38 36 01         [10] 1456 	ld	(hl),#0x01
   6B3A 18 0E         [12] 1457 	jr	00149$
   6B3C                    1458 00138$:
                           1459 ;src/main.c:307: colisiona = 0;
   6B3C DD 36 F7 00   [19] 1460 	ld	-9 (ix),#0x00
   6B40 18 08         [12] 1461 	jr	00149$
   6B42                    1462 00145$:
                           1463 ;src/main.c:313: enemy->mira = M_abajo;
   6B42 DD 6E FC      [19] 1464 	ld	l,-4 (ix)
   6B45 DD 66 FD      [19] 1465 	ld	h,-3 (ix)
   6B48 36 03         [10] 1466 	ld	(hl),#0x03
                           1467 ;src/main.c:316: case 3:
   6B4A                    1468 00149$:
                           1469 ;src/main.c:319: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6B4A DD 6E F8      [19] 1470 	ld	l,-8 (ix)
   6B4D DD 66 F9      [19] 1471 	ld	h,-7 (ix)
   6B50 7E            [ 7] 1472 	ld	a,(hl)
   6B51 C6 18         [ 7] 1473 	add	a, #0x18
   6B53 57            [ 4] 1474 	ld	d,a
   6B54 0A            [ 7] 1475 	ld	a,(bc)
   6B55 C5            [11] 1476 	push	bc
   6B56 D5            [11] 1477 	push	de
   6B57 33            [ 6] 1478 	inc	sp
   6B58 F5            [11] 1479 	push	af
   6B59 33            [ 6] 1480 	inc	sp
   6B5A 2A D5 63      [16] 1481 	ld	hl,(_mapa)
   6B5D E5            [11] 1482 	push	hl
   6B5E CD 2C 4A      [17] 1483 	call	_getTilePtr
   6B61 F1            [10] 1484 	pop	af
   6B62 F1            [10] 1485 	pop	af
   6B63 C1            [10] 1486 	pop	bc
   6B64 5E            [ 7] 1487 	ld	e,(hl)
   6B65 3E 02         [ 7] 1488 	ld	a,#0x02
   6B67 93            [ 4] 1489 	sub	a, e
   6B68 DA 2B 6C      [10] 1490 	jp	C,00161$
                           1491 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6B6B DD 6E F8      [19] 1492 	ld	l,-8 (ix)
   6B6E DD 66 F9      [19] 1493 	ld	h,-7 (ix)
   6B71 7E            [ 7] 1494 	ld	a,(hl)
   6B72 C6 18         [ 7] 1495 	add	a, #0x18
   6B74 57            [ 4] 1496 	ld	d,a
   6B75 0A            [ 7] 1497 	ld	a,(bc)
   6B76 C6 02         [ 7] 1498 	add	a, #0x02
   6B78 C5            [11] 1499 	push	bc
   6B79 D5            [11] 1500 	push	de
   6B7A 33            [ 6] 1501 	inc	sp
   6B7B F5            [11] 1502 	push	af
   6B7C 33            [ 6] 1503 	inc	sp
   6B7D 2A D5 63      [16] 1504 	ld	hl,(_mapa)
   6B80 E5            [11] 1505 	push	hl
   6B81 CD 2C 4A      [17] 1506 	call	_getTilePtr
   6B84 F1            [10] 1507 	pop	af
   6B85 F1            [10] 1508 	pop	af
   6B86 C1            [10] 1509 	pop	bc
   6B87 5E            [ 7] 1510 	ld	e,(hl)
   6B88 3E 02         [ 7] 1511 	ld	a,#0x02
   6B8A 93            [ 4] 1512 	sub	a, e
   6B8B DA 2B 6C      [10] 1513 	jp	C,00161$
                           1514 ;src/main.c:321: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6B8E DD 6E F8      [19] 1515 	ld	l,-8 (ix)
   6B91 DD 66 F9      [19] 1516 	ld	h,-7 (ix)
   6B94 7E            [ 7] 1517 	ld	a,(hl)
   6B95 C6 18         [ 7] 1518 	add	a, #0x18
   6B97 57            [ 4] 1519 	ld	d,a
   6B98 0A            [ 7] 1520 	ld	a,(bc)
   6B99 C6 04         [ 7] 1521 	add	a, #0x04
   6B9B C5            [11] 1522 	push	bc
   6B9C D5            [11] 1523 	push	de
   6B9D 33            [ 6] 1524 	inc	sp
   6B9E F5            [11] 1525 	push	af
   6B9F 33            [ 6] 1526 	inc	sp
   6BA0 2A D5 63      [16] 1527 	ld	hl,(_mapa)
   6BA3 E5            [11] 1528 	push	hl
   6BA4 CD 2C 4A      [17] 1529 	call	_getTilePtr
   6BA7 F1            [10] 1530 	pop	af
   6BA8 F1            [10] 1531 	pop	af
   6BA9 C1            [10] 1532 	pop	bc
   6BAA 5E            [ 7] 1533 	ld	e,(hl)
   6BAB 3E 02         [ 7] 1534 	ld	a,#0x02
   6BAD 93            [ 4] 1535 	sub	a, e
   6BAE 38 7B         [12] 1536 	jr	C,00161$
                           1537 ;src/main.c:323: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6BB0 21 00 63      [10] 1538 	ld	hl, #_cu + 0
   6BB3 5E            [ 7] 1539 	ld	e,(hl)
   6BB4 16 00         [ 7] 1540 	ld	d,#0x00
   6BB6 21 02 00      [10] 1541 	ld	hl,#0x0002
   6BB9 19            [11] 1542 	add	hl,de
   6BBA DD 75 FE      [19] 1543 	ld	-2 (ix),l
   6BBD DD 74 FF      [19] 1544 	ld	-1 (ix),h
   6BC0 0A            [ 7] 1545 	ld	a,(bc)
   6BC1 4F            [ 4] 1546 	ld	c,a
   6BC2 06 00         [ 7] 1547 	ld	b,#0x00
   6BC4 DD 7E FE      [19] 1548 	ld	a,-2 (ix)
   6BC7 91            [ 4] 1549 	sub	a, c
   6BC8 DD 7E FF      [19] 1550 	ld	a,-1 (ix)
   6BCB 98            [ 4] 1551 	sbc	a, b
   6BCC E2 D1 6B      [10] 1552 	jp	PO, 00278$
   6BCF EE 80         [ 7] 1553 	xor	a, #0x80
   6BD1                    1554 00278$:
   6BD1 FA E4 6B      [10] 1555 	jp	M,00156$
   6BD4 03            [ 6] 1556 	inc	bc
   6BD5 03            [ 6] 1557 	inc	bc
   6BD6 03            [ 6] 1558 	inc	bc
   6BD7 03            [ 6] 1559 	inc	bc
   6BD8 79            [ 4] 1560 	ld	a,c
   6BD9 93            [ 4] 1561 	sub	a, e
   6BDA 78            [ 4] 1562 	ld	a,b
   6BDB 9A            [ 4] 1563 	sbc	a, d
   6BDC E2 E1 6B      [10] 1564 	jp	PO, 00279$
   6BDF EE 80         [ 7] 1565 	xor	a, #0x80
   6BE1                    1566 00279$:
   6BE1 F2 EA 6B      [10] 1567 	jp	P,00157$
   6BE4                    1568 00156$:
                           1569 ;src/main.c:324: colisiona = 0;
   6BE4 DD 36 F7 00   [19] 1570 	ld	-9 (ix),#0x00
   6BE8 18 49         [12] 1571 	jr	00165$
   6BEA                    1572 00157$:
                           1573 ;src/main.c:327: if(cu.y > enemy->y){ //si el cu esta abajo
   6BEA 21 01 63      [10] 1574 	ld	hl, #(_cu + 0x0001) + 0
   6BED 4E            [ 7] 1575 	ld	c,(hl)
   6BEE DD 6E F8      [19] 1576 	ld	l,-8 (ix)
   6BF1 DD 66 F9      [19] 1577 	ld	h,-7 (ix)
   6BF4 5E            [ 7] 1578 	ld	e,(hl)
   6BF5 7B            [ 4] 1579 	ld	a,e
   6BF6 91            [ 4] 1580 	sub	a, c
   6BF7 30 2C         [12] 1581 	jr	NC,00154$
                           1582 ;src/main.c:328: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6BF9 06 00         [ 7] 1583 	ld	b,#0x00
   6BFB 16 00         [ 7] 1584 	ld	d,#0x00
   6BFD 21 16 00      [10] 1585 	ld	hl,#0x0016
   6C00 19            [11] 1586 	add	hl,de
   6C01 79            [ 4] 1587 	ld	a,c
   6C02 95            [ 4] 1588 	sub	a, l
   6C03 4F            [ 4] 1589 	ld	c,a
   6C04 78            [ 4] 1590 	ld	a,b
   6C05 9C            [ 4] 1591 	sbc	a, h
   6C06 47            [ 4] 1592 	ld	b,a
   6C07 3E 02         [ 7] 1593 	ld	a,#0x02
   6C09 B9            [ 4] 1594 	cp	a, c
   6C0A 3E 00         [ 7] 1595 	ld	a,#0x00
   6C0C 98            [ 4] 1596 	sbc	a, b
   6C0D E2 12 6C      [10] 1597 	jp	PO, 00280$
   6C10 EE 80         [ 7] 1598 	xor	a, #0x80
   6C12                    1599 00280$:
   6C12 F2 1B 6C      [10] 1600 	jp	P,00151$
                           1601 ;src/main.c:329: colisiona = 0;
   6C15 DD 36 F7 00   [19] 1602 	ld	-9 (ix),#0x00
   6C19 18 18         [12] 1603 	jr	00165$
   6C1B                    1604 00151$:
                           1605 ;src/main.c:332: enemy->muerto = SI;
   6C1B DD 6E FA      [19] 1606 	ld	l,-6 (ix)
   6C1E DD 66 FB      [19] 1607 	ld	h,-5 (ix)
   6C21 36 01         [10] 1608 	ld	(hl),#0x01
   6C23 18 0E         [12] 1609 	jr	00165$
   6C25                    1610 00154$:
                           1611 ;src/main.c:336: colisiona = 0;
   6C25 DD 36 F7 00   [19] 1612 	ld	-9 (ix),#0x00
   6C29 18 08         [12] 1613 	jr	00165$
   6C2B                    1614 00161$:
                           1615 ;src/main.c:340: enemy->mira = M_arriba;
   6C2B DD 6E FC      [19] 1616 	ld	l,-4 (ix)
   6C2E DD 66 FD      [19] 1617 	ld	h,-3 (ix)
   6C31 36 02         [10] 1618 	ld	(hl),#0x02
                           1619 ;src/main.c:343: }
   6C33                    1620 00165$:
                           1621 ;src/main.c:344: return colisiona;
   6C33 DD 6E F7      [19] 1622 	ld	l,-9 (ix)
   6C36 DD F9         [10] 1623 	ld	sp, ix
   6C38 DD E1         [14] 1624 	pop	ix
   6C3A C9            [10] 1625 	ret
                           1626 ;src/main.c:347: void moverEnemigoArriba(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoArriba
                           1629 ; ---------------------------------
   6C3B                    1630 _moverEnemigoArriba::
   6C3B DD E5         [15] 1631 	push	ix
   6C3D DD 21 00 00   [14] 1632 	ld	ix,#0
   6C41 DD 39         [15] 1633 	add	ix,sp
                           1634 ;src/main.c:348: enemy->y--;
   6C43 DD 4E 04      [19] 1635 	ld	c,4 (ix)
   6C46 DD 46 05      [19] 1636 	ld	b,5 (ix)
   6C49 69            [ 4] 1637 	ld	l, c
   6C4A 60            [ 4] 1638 	ld	h, b
   6C4B 23            [ 6] 1639 	inc	hl
   6C4C 5E            [ 7] 1640 	ld	e,(hl)
   6C4D 1D            [ 4] 1641 	dec	e
   6C4E 73            [ 7] 1642 	ld	(hl),e
                           1643 ;src/main.c:349: enemy->y--;
   6C4F 1D            [ 4] 1644 	dec	e
   6C50 73            [ 7] 1645 	ld	(hl),e
                           1646 ;src/main.c:350: enemy->mover = SI;
   6C51 21 06 00      [10] 1647 	ld	hl,#0x0006
   6C54 09            [11] 1648 	add	hl,bc
   6C55 36 01         [10] 1649 	ld	(hl),#0x01
   6C57 DD E1         [14] 1650 	pop	ix
   6C59 C9            [10] 1651 	ret
                           1652 ;src/main.c:353: void moverEnemigoAbajo(TEnemy *enemy){
                           1653 ;	---------------------------------
                           1654 ; Function moverEnemigoAbajo
                           1655 ; ---------------------------------
   6C5A                    1656 _moverEnemigoAbajo::
   6C5A DD E5         [15] 1657 	push	ix
   6C5C DD 21 00 00   [14] 1658 	ld	ix,#0
   6C60 DD 39         [15] 1659 	add	ix,sp
                           1660 ;src/main.c:354: enemy->y++;
   6C62 DD 4E 04      [19] 1661 	ld	c,4 (ix)
   6C65 DD 46 05      [19] 1662 	ld	b,5 (ix)
   6C68 59            [ 4] 1663 	ld	e, c
   6C69 50            [ 4] 1664 	ld	d, b
   6C6A 13            [ 6] 1665 	inc	de
   6C6B 1A            [ 7] 1666 	ld	a,(de)
   6C6C 3C            [ 4] 1667 	inc	a
   6C6D 12            [ 7] 1668 	ld	(de),a
                           1669 ;src/main.c:355: enemy->y++;
   6C6E 3C            [ 4] 1670 	inc	a
   6C6F 12            [ 7] 1671 	ld	(de),a
                           1672 ;src/main.c:356: enemy->mover = SI;
   6C70 21 06 00      [10] 1673 	ld	hl,#0x0006
   6C73 09            [11] 1674 	add	hl,bc
   6C74 36 01         [10] 1675 	ld	(hl),#0x01
   6C76 DD E1         [14] 1676 	pop	ix
   6C78 C9            [10] 1677 	ret
                           1678 ;src/main.c:359: void moverEnemigoDerecha(TEnemy *enemy){
                           1679 ;	---------------------------------
                           1680 ; Function moverEnemigoDerecha
                           1681 ; ---------------------------------
   6C79                    1682 _moverEnemigoDerecha::
                           1683 ;src/main.c:360: enemy->x++;
   6C79 D1            [10] 1684 	pop	de
   6C7A C1            [10] 1685 	pop	bc
   6C7B C5            [11] 1686 	push	bc
   6C7C D5            [11] 1687 	push	de
   6C7D 0A            [ 7] 1688 	ld	a,(bc)
   6C7E 3C            [ 4] 1689 	inc	a
   6C7F 02            [ 7] 1690 	ld	(bc),a
                           1691 ;src/main.c:361: enemy->x++;
   6C80 3C            [ 4] 1692 	inc	a
   6C81 02            [ 7] 1693 	ld	(bc),a
                           1694 ;src/main.c:362: enemy->mover = SI;
   6C82 21 06 00      [10] 1695 	ld	hl,#0x0006
   6C85 09            [11] 1696 	add	hl,bc
   6C86 36 01         [10] 1697 	ld	(hl),#0x01
   6C88 C9            [10] 1698 	ret
                           1699 ;src/main.c:365: void moverEnemigoIzquierda(TEnemy *enemy){
                           1700 ;	---------------------------------
                           1701 ; Function moverEnemigoIzquierda
                           1702 ; ---------------------------------
   6C89                    1703 _moverEnemigoIzquierda::
                           1704 ;src/main.c:366: enemy->x--;
   6C89 D1            [10] 1705 	pop	de
   6C8A C1            [10] 1706 	pop	bc
   6C8B C5            [11] 1707 	push	bc
   6C8C D5            [11] 1708 	push	de
   6C8D 0A            [ 7] 1709 	ld	a,(bc)
   6C8E C6 FF         [ 7] 1710 	add	a,#0xFF
   6C90 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:367: enemy->x--;
   6C91 C6 FF         [ 7] 1713 	add	a,#0xFF
   6C93 02            [ 7] 1714 	ld	(bc),a
                           1715 ;src/main.c:368: enemy->mover = SI;
   6C94 21 06 00      [10] 1716 	ld	hl,#0x0006
   6C97 09            [11] 1717 	add	hl,bc
   6C98 36 01         [10] 1718 	ld	(hl),#0x01
   6C9A C9            [10] 1719 	ret
                           1720 ;src/main.c:371: void moverEnemigoPatrol(TEnemy* enemy){
                           1721 ;	---------------------------------
                           1722 ; Function moverEnemigoPatrol
                           1723 ; ---------------------------------
   6C9B                    1724 _moverEnemigoPatrol::
   6C9B DD E5         [15] 1725 	push	ix
   6C9D DD 21 00 00   [14] 1726 	ld	ix,#0
   6CA1 DD 39         [15] 1727 	add	ix,sp
   6CA3 21 F3 FF      [10] 1728 	ld	hl,#-13
   6CA6 39            [11] 1729 	add	hl,sp
   6CA7 F9            [ 6] 1730 	ld	sp,hl
                           1731 ;src/main.c:373: if(!enemy->muerto){
   6CA8 DD 4E 04      [19] 1732 	ld	c,4 (ix)
   6CAB DD 46 05      [19] 1733 	ld	b,5 (ix)
   6CAE C5            [11] 1734 	push	bc
   6CAF FD E1         [14] 1735 	pop	iy
   6CB1 FD 7E 08      [19] 1736 	ld	a,8 (iy)
   6CB4 B7            [ 4] 1737 	or	a, a
   6CB5 C2 DF 6E      [10] 1738 	jp	NZ,00118$
                           1739 ;src/main.c:376: if (!enemy->reversePatrol) {
   6CB8 21 0C 00      [10] 1740 	ld	hl,#0x000C
   6CBB 09            [11] 1741 	add	hl,bc
   6CBC DD 75 FE      [19] 1742 	ld	-2 (ix),l
   6CBF DD 74 FF      [19] 1743 	ld	-1 (ix),h
   6CC2 DD 6E FE      [19] 1744 	ld	l,-2 (ix)
   6CC5 DD 66 FF      [19] 1745 	ld	h,-1 (ix)
   6CC8 7E            [ 7] 1746 	ld	a,(hl)
   6CC9 DD 77 FD      [19] 1747 	ld	-3 (ix),a
                           1748 ;src/main.c:377: if(enemy->iter < enemy->longitud_camino){
   6CCC 21 0E 00      [10] 1749 	ld	hl,#0x000E
   6CCF 09            [11] 1750 	add	hl,bc
   6CD0 DD 75 FB      [19] 1751 	ld	-5 (ix),l
   6CD3 DD 74 FC      [19] 1752 	ld	-4 (ix),h
   6CD6 DD 6E FB      [19] 1753 	ld	l,-5 (ix)
   6CD9 DD 66 FC      [19] 1754 	ld	h,-4 (ix)
   6CDC 5E            [ 7] 1755 	ld	e,(hl)
   6CDD 23            [ 6] 1756 	inc	hl
   6CDE 56            [ 7] 1757 	ld	d,(hl)
   6CDF 21 E1 00      [10] 1758 	ld	hl,#0x00E1
   6CE2 09            [11] 1759 	add	hl,bc
   6CE3 DD 75 F9      [19] 1760 	ld	-7 (ix),l
   6CE6 DD 74 FA      [19] 1761 	ld	-6 (ix),h
                           1762 ;src/main.c:380: enemy->mover = SI;
   6CE9 21 06 00      [10] 1763 	ld	hl,#0x0006
   6CEC 09            [11] 1764 	add	hl,bc
   6CED DD 75 F7      [19] 1765 	ld	-9 (ix),l
   6CF0 DD 74 F8      [19] 1766 	ld	-8 (ix),h
                           1767 ;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
   6CF3 21 19 00      [10] 1768 	ld	hl,#0x0019
   6CF6 09            [11] 1769 	add	hl,bc
   6CF7 DD 75 F5      [19] 1770 	ld	-11 (ix),l
   6CFA DD 74 F6      [19] 1771 	ld	-10 (ix),h
                           1772 ;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
   6CFD 21 01 00      [10] 1773 	ld	hl,#0x0001
   6D00 09            [11] 1774 	add	hl,bc
   6D01 E3            [19] 1775 	ex	(sp), hl
                           1776 ;src/main.c:376: if (!enemy->reversePatrol) {
   6D02 DD 7E FD      [19] 1777 	ld	a,-3 (ix)
   6D05 B7            [ 4] 1778 	or	a, a
   6D06 C2 DD 6D      [10] 1779 	jp	NZ,00114$
                           1780 ;src/main.c:377: if(enemy->iter < enemy->longitud_camino){
   6D09 DD 6E F9      [19] 1781 	ld	l,-7 (ix)
   6D0C DD 66 FA      [19] 1782 	ld	h,-6 (ix)
   6D0F 6E            [ 7] 1783 	ld	l,(hl)
   6D10 26 00         [ 7] 1784 	ld	h,#0x00
   6D12 7B            [ 4] 1785 	ld	a,e
   6D13 95            [ 4] 1786 	sub	a, l
   6D14 7A            [ 4] 1787 	ld	a,d
   6D15 9C            [ 4] 1788 	sbc	a, h
   6D16 E2 1B 6D      [10] 1789 	jp	PO, 00144$
   6D19 EE 80         [ 7] 1790 	xor	a, #0x80
   6D1B                    1791 00144$:
   6D1B F2 B8 6D      [10] 1792 	jp	P,00105$
                           1793 ;src/main.c:378: if(enemy->iter == 0){
   6D1E 7A            [ 4] 1794 	ld	a,d
   6D1F B3            [ 4] 1795 	or	a,e
   6D20 20 50         [12] 1796 	jr	NZ,00102$
                           1797 ;src/main.c:380: enemy->mover = SI;
   6D22 DD 6E F7      [19] 1798 	ld	l,-9 (ix)
   6D25 DD 66 F8      [19] 1799 	ld	h,-8 (ix)
   6D28 36 01         [10] 1800 	ld	(hl),#0x01
                           1801 ;src/main.c:381: enemy->iter = 2;
   6D2A DD 6E FB      [19] 1802 	ld	l,-5 (ix)
   6D2D DD 66 FC      [19] 1803 	ld	h,-4 (ix)
   6D30 36 02         [10] 1804 	ld	(hl),#0x02
   6D32 23            [ 6] 1805 	inc	hl
   6D33 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
   6D35 DD 6E FB      [19] 1808 	ld	l,-5 (ix)
   6D38 DD 66 FC      [19] 1809 	ld	h,-4 (ix)
   6D3B 5E            [ 7] 1810 	ld	e,(hl)
   6D3C 23            [ 6] 1811 	inc	hl
   6D3D 56            [ 7] 1812 	ld	d,(hl)
   6D3E DD 6E F5      [19] 1813 	ld	l,-11 (ix)
   6D41 DD 66 F6      [19] 1814 	ld	h,-10 (ix)
   6D44 19            [11] 1815 	add	hl,de
   6D45 7E            [ 7] 1816 	ld	a,(hl)
   6D46 02            [ 7] 1817 	ld	(bc),a
                           1818 ;src/main.c:383: ++enemy->iter;
   6D47 DD 6E FB      [19] 1819 	ld	l,-5 (ix)
   6D4A DD 66 FC      [19] 1820 	ld	h,-4 (ix)
   6D4D 4E            [ 7] 1821 	ld	c,(hl)
   6D4E 23            [ 6] 1822 	inc	hl
   6D4F 46            [ 7] 1823 	ld	b,(hl)
   6D50 03            [ 6] 1824 	inc	bc
   6D51 DD 6E FB      [19] 1825 	ld	l,-5 (ix)
   6D54 DD 66 FC      [19] 1826 	ld	h,-4 (ix)
   6D57 71            [ 7] 1827 	ld	(hl),c
   6D58 23            [ 6] 1828 	inc	hl
   6D59 70            [ 7] 1829 	ld	(hl),b
                           1830 ;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
   6D5A DD 6E F5      [19] 1831 	ld	l,-11 (ix)
   6D5D DD 66 F6      [19] 1832 	ld	h,-10 (ix)
   6D60 09            [11] 1833 	add	hl,bc
   6D61 5E            [ 7] 1834 	ld	e,(hl)
   6D62 E1            [10] 1835 	pop	hl
   6D63 E5            [11] 1836 	push	hl
   6D64 73            [ 7] 1837 	ld	(hl),e
                           1838 ;src/main.c:385: ++enemy->iter;
   6D65 03            [ 6] 1839 	inc	bc
   6D66 DD 6E FB      [19] 1840 	ld	l,-5 (ix)
   6D69 DD 66 FC      [19] 1841 	ld	h,-4 (ix)
   6D6C 71            [ 7] 1842 	ld	(hl),c
   6D6D 23            [ 6] 1843 	inc	hl
   6D6E 70            [ 7] 1844 	ld	(hl),b
   6D6F C3 DF 6E      [10] 1845 	jp	00118$
   6D72                    1846 00102$:
                           1847 ;src/main.c:388: enemy->mover = SI;
   6D72 DD 6E F7      [19] 1848 	ld	l,-9 (ix)
   6D75 DD 66 F8      [19] 1849 	ld	h,-8 (ix)
   6D78 36 01         [10] 1850 	ld	(hl),#0x01
                           1851 ;src/main.c:389: enemy->x = enemy->camino[enemy->iter];
   6D7A DD 6E FB      [19] 1852 	ld	l,-5 (ix)
   6D7D DD 66 FC      [19] 1853 	ld	h,-4 (ix)
   6D80 5E            [ 7] 1854 	ld	e,(hl)
   6D81 23            [ 6] 1855 	inc	hl
   6D82 56            [ 7] 1856 	ld	d,(hl)
   6D83 DD 6E F5      [19] 1857 	ld	l,-11 (ix)
   6D86 DD 66 F6      [19] 1858 	ld	h,-10 (ix)
   6D89 19            [11] 1859 	add	hl,de
   6D8A 7E            [ 7] 1860 	ld	a,(hl)
   6D8B 02            [ 7] 1861 	ld	(bc),a
                           1862 ;src/main.c:390: ++enemy->iter;
   6D8C DD 6E FB      [19] 1863 	ld	l,-5 (ix)
   6D8F DD 66 FC      [19] 1864 	ld	h,-4 (ix)
   6D92 5E            [ 7] 1865 	ld	e,(hl)
   6D93 23            [ 6] 1866 	inc	hl
   6D94 56            [ 7] 1867 	ld	d,(hl)
   6D95 13            [ 6] 1868 	inc	de
   6D96 DD 6E FB      [19] 1869 	ld	l,-5 (ix)
   6D99 DD 66 FC      [19] 1870 	ld	h,-4 (ix)
   6D9C 73            [ 7] 1871 	ld	(hl),e
   6D9D 23            [ 6] 1872 	inc	hl
   6D9E 72            [ 7] 1873 	ld	(hl),d
                           1874 ;src/main.c:391: enemy->y = enemy->camino[enemy->iter];
   6D9F DD 6E F5      [19] 1875 	ld	l,-11 (ix)
   6DA2 DD 66 F6      [19] 1876 	ld	h,-10 (ix)
   6DA5 19            [11] 1877 	add	hl,de
   6DA6 7E            [ 7] 1878 	ld	a,(hl)
   6DA7 E1            [10] 1879 	pop	hl
   6DA8 E5            [11] 1880 	push	hl
   6DA9 77            [ 7] 1881 	ld	(hl),a
                           1882 ;src/main.c:392: ++enemy->iter;
   6DAA 13            [ 6] 1883 	inc	de
   6DAB 4B            [ 4] 1884 	ld	c,e
   6DAC DD 6E FB      [19] 1885 	ld	l,-5 (ix)
   6DAF DD 66 FC      [19] 1886 	ld	h,-4 (ix)
   6DB2 71            [ 7] 1887 	ld	(hl),c
   6DB3 23            [ 6] 1888 	inc	hl
   6DB4 72            [ 7] 1889 	ld	(hl),d
   6DB5 C3 DF 6E      [10] 1890 	jp	00118$
   6DB8                    1891 00105$:
                           1892 ;src/main.c:397: enemy->mover = NO;
   6DB8 DD 6E F7      [19] 1893 	ld	l,-9 (ix)
   6DBB DD 66 F8      [19] 1894 	ld	h,-8 (ix)
   6DBE 36 00         [10] 1895 	ld	(hl),#0x00
                           1896 ;src/main.c:398: enemy->iter = enemy->longitud_camino;
   6DC0 DD 6E F9      [19] 1897 	ld	l,-7 (ix)
   6DC3 DD 66 FA      [19] 1898 	ld	h,-6 (ix)
   6DC6 4E            [ 7] 1899 	ld	c,(hl)
   6DC7 06 00         [ 7] 1900 	ld	b,#0x00
   6DC9 DD 6E FB      [19] 1901 	ld	l,-5 (ix)
   6DCC DD 66 FC      [19] 1902 	ld	h,-4 (ix)
   6DCF 71            [ 7] 1903 	ld	(hl),c
   6DD0 23            [ 6] 1904 	inc	hl
   6DD1 70            [ 7] 1905 	ld	(hl),b
                           1906 ;src/main.c:402: enemy->reversePatrol = 1;
   6DD2 DD 6E FE      [19] 1907 	ld	l,-2 (ix)
   6DD5 DD 66 FF      [19] 1908 	ld	h,-1 (ix)
   6DD8 36 01         [10] 1909 	ld	(hl),#0x01
   6DDA C3 DF 6E      [10] 1910 	jp	00118$
   6DDD                    1911 00114$:
                           1912 ;src/main.c:407: if(enemy->iter > 0){
   6DDD AF            [ 4] 1913 	xor	a, a
   6DDE BB            [ 4] 1914 	cp	a, e
   6DDF 9A            [ 4] 1915 	sbc	a, d
   6DE0 E2 E5 6D      [10] 1916 	jp	PO, 00145$
   6DE3 EE 80         [ 7] 1917 	xor	a, #0x80
   6DE5                    1918 00145$:
   6DE5 F2 C5 6E      [10] 1919 	jp	P,00111$
                           1920 ;src/main.c:408: if(enemy->iter == enemy->longitud_camino){
   6DE8 DD 6E F9      [19] 1921 	ld	l,-7 (ix)
   6DEB DD 66 FA      [19] 1922 	ld	h,-6 (ix)
   6DEE 6E            [ 7] 1923 	ld	l,(hl)
   6DEF DD 75 F9      [19] 1924 	ld	-7 (ix),l
   6DF2 DD 36 FA 00   [19] 1925 	ld	-6 (ix),#0x00
   6DF6 7B            [ 4] 1926 	ld	a,e
   6DF7 DD 96 F9      [19] 1927 	sub	a, -7 (ix)
   6DFA C2 81 6E      [10] 1928 	jp	NZ,00108$
   6DFD 7A            [ 4] 1929 	ld	a,d
   6DFE DD 96 FA      [19] 1930 	sub	a, -6 (ix)
   6E01 C2 81 6E      [10] 1931 	jp	NZ,00108$
                           1932 ;src/main.c:409: enemy->mover = SI;
   6E04 DD 6E F7      [19] 1933 	ld	l,-9 (ix)
   6E07 DD 66 F8      [19] 1934 	ld	h,-8 (ix)
   6E0A 36 01         [10] 1935 	ld	(hl),#0x01
                           1936 ;src/main.c:410: enemy->iter = enemy->iter - 1;
   6E0C DD 6E FB      [19] 1937 	ld	l,-5 (ix)
   6E0F DD 66 FC      [19] 1938 	ld	h,-4 (ix)
   6E12 5E            [ 7] 1939 	ld	e,(hl)
   6E13 23            [ 6] 1940 	inc	hl
   6E14 56            [ 7] 1941 	ld	d,(hl)
   6E15 7B            [ 4] 1942 	ld	a,e
   6E16 C6 FF         [ 7] 1943 	add	a,#0xFF
   6E18 DD 77 F9      [19] 1944 	ld	-7 (ix),a
   6E1B 7A            [ 4] 1945 	ld	a,d
   6E1C CE FF         [ 7] 1946 	adc	a,#0xFF
   6E1E DD 77 FA      [19] 1947 	ld	-6 (ix),a
   6E21 DD 6E FB      [19] 1948 	ld	l,-5 (ix)
   6E24 DD 66 FC      [19] 1949 	ld	h,-4 (ix)
   6E27 DD 7E F9      [19] 1950 	ld	a,-7 (ix)
   6E2A 77            [ 7] 1951 	ld	(hl),a
   6E2B 23            [ 6] 1952 	inc	hl
   6E2C DD 7E FA      [19] 1953 	ld	a,-6 (ix)
   6E2F 77            [ 7] 1954 	ld	(hl),a
                           1955 ;src/main.c:411: enemy->iter = enemy->iter - 2;
   6E30 DD 5E F9      [19] 1956 	ld	e,-7 (ix)
   6E33 DD 56 FA      [19] 1957 	ld	d,-6 (ix)
   6E36 1B            [ 6] 1958 	dec	de
   6E37 1B            [ 6] 1959 	dec	de
   6E38 DD 6E FB      [19] 1960 	ld	l,-5 (ix)
   6E3B DD 66 FC      [19] 1961 	ld	h,-4 (ix)
   6E3E 73            [ 7] 1962 	ld	(hl),e
   6E3F 23            [ 6] 1963 	inc	hl
   6E40 72            [ 7] 1964 	ld	(hl),d
                           1965 ;src/main.c:412: enemy->y = enemy->camino[enemy->iter];
   6E41 DD 6E F5      [19] 1966 	ld	l,-11 (ix)
   6E44 DD 66 F6      [19] 1967 	ld	h,-10 (ix)
   6E47 19            [11] 1968 	add	hl,de
   6E48 5E            [ 7] 1969 	ld	e,(hl)
   6E49 E1            [10] 1970 	pop	hl
   6E4A E5            [11] 1971 	push	hl
   6E4B 73            [ 7] 1972 	ld	(hl),e
                           1973 ;src/main.c:413: --enemy->iter;
   6E4C DD 7E F9      [19] 1974 	ld	a,-7 (ix)
   6E4F C6 FD         [ 7] 1975 	add	a,#0xFD
   6E51 5F            [ 4] 1976 	ld	e,a
   6E52 DD 7E FA      [19] 1977 	ld	a,-6 (ix)
   6E55 CE FF         [ 7] 1978 	adc	a,#0xFF
   6E57 57            [ 4] 1979 	ld	d,a
   6E58 DD 6E FB      [19] 1980 	ld	l,-5 (ix)
   6E5B DD 66 FC      [19] 1981 	ld	h,-4 (ix)
   6E5E 73            [ 7] 1982 	ld	(hl),e
   6E5F 23            [ 6] 1983 	inc	hl
   6E60 72            [ 7] 1984 	ld	(hl),d
                           1985 ;src/main.c:414: enemy->x = enemy->camino[enemy->iter];
   6E61 DD 6E F5      [19] 1986 	ld	l,-11 (ix)
   6E64 DD 66 F6      [19] 1987 	ld	h,-10 (ix)
   6E67 19            [11] 1988 	add	hl,de
   6E68 7E            [ 7] 1989 	ld	a,(hl)
   6E69 02            [ 7] 1990 	ld	(bc),a
                           1991 ;src/main.c:415: --enemy->iter;
   6E6A DD 7E F9      [19] 1992 	ld	a,-7 (ix)
   6E6D C6 FC         [ 7] 1993 	add	a,#0xFC
   6E6F 4F            [ 4] 1994 	ld	c,a
   6E70 DD 7E FA      [19] 1995 	ld	a,-6 (ix)
   6E73 CE FF         [ 7] 1996 	adc	a,#0xFF
   6E75 47            [ 4] 1997 	ld	b,a
   6E76 DD 6E FB      [19] 1998 	ld	l,-5 (ix)
   6E79 DD 66 FC      [19] 1999 	ld	h,-4 (ix)
   6E7C 71            [ 7] 2000 	ld	(hl),c
   6E7D 23            [ 6] 2001 	inc	hl
   6E7E 70            [ 7] 2002 	ld	(hl),b
   6E7F 18 5E         [12] 2003 	jr	00118$
   6E81                    2004 00108$:
                           2005 ;src/main.c:417: enemy->mover = SI;
   6E81 DD 6E F7      [19] 2006 	ld	l,-9 (ix)
   6E84 DD 66 F8      [19] 2007 	ld	h,-8 (ix)
   6E87 36 01         [10] 2008 	ld	(hl),#0x01
                           2009 ;src/main.c:418: enemy->y = enemy->camino[enemy->iter];
   6E89 DD 6E FB      [19] 2010 	ld	l,-5 (ix)
   6E8C DD 66 FC      [19] 2011 	ld	h,-4 (ix)
   6E8F 5E            [ 7] 2012 	ld	e,(hl)
   6E90 23            [ 6] 2013 	inc	hl
   6E91 56            [ 7] 2014 	ld	d,(hl)
   6E92 DD 6E F5      [19] 2015 	ld	l,-11 (ix)
   6E95 DD 66 F6      [19] 2016 	ld	h,-10 (ix)
   6E98 19            [11] 2017 	add	hl,de
   6E99 5E            [ 7] 2018 	ld	e,(hl)
   6E9A E1            [10] 2019 	pop	hl
   6E9B E5            [11] 2020 	push	hl
   6E9C 73            [ 7] 2021 	ld	(hl),e
                           2022 ;src/main.c:419: --enemy->iter;
   6E9D DD 6E FB      [19] 2023 	ld	l,-5 (ix)
   6EA0 DD 66 FC      [19] 2024 	ld	h,-4 (ix)
   6EA3 5E            [ 7] 2025 	ld	e,(hl)
   6EA4 23            [ 6] 2026 	inc	hl
   6EA5 56            [ 7] 2027 	ld	d,(hl)
   6EA6 1B            [ 6] 2028 	dec	de
   6EA7 DD 6E FB      [19] 2029 	ld	l,-5 (ix)
   6EAA DD 66 FC      [19] 2030 	ld	h,-4 (ix)
   6EAD 73            [ 7] 2031 	ld	(hl),e
   6EAE 23            [ 6] 2032 	inc	hl
   6EAF 72            [ 7] 2033 	ld	(hl),d
                           2034 ;src/main.c:420: enemy->x = enemy->camino[enemy->iter];
   6EB0 DD 6E F5      [19] 2035 	ld	l,-11 (ix)
   6EB3 DD 66 F6      [19] 2036 	ld	h,-10 (ix)
   6EB6 19            [11] 2037 	add	hl,de
   6EB7 7E            [ 7] 2038 	ld	a,(hl)
   6EB8 02            [ 7] 2039 	ld	(bc),a
                           2040 ;src/main.c:421: --enemy->iter;
   6EB9 1B            [ 6] 2041 	dec	de
   6EBA DD 6E FB      [19] 2042 	ld	l,-5 (ix)
   6EBD DD 66 FC      [19] 2043 	ld	h,-4 (ix)
   6EC0 73            [ 7] 2044 	ld	(hl),e
   6EC1 23            [ 6] 2045 	inc	hl
   6EC2 72            [ 7] 2046 	ld	(hl),d
   6EC3 18 1A         [12] 2047 	jr	00118$
   6EC5                    2048 00111$:
                           2049 ;src/main.c:426: enemy->mover = NO;
   6EC5 DD 6E F7      [19] 2050 	ld	l,-9 (ix)
   6EC8 DD 66 F8      [19] 2051 	ld	h,-8 (ix)
   6ECB 36 00         [10] 2052 	ld	(hl),#0x00
                           2053 ;src/main.c:427: enemy->iter = 0;
   6ECD DD 6E FB      [19] 2054 	ld	l,-5 (ix)
   6ED0 DD 66 FC      [19] 2055 	ld	h,-4 (ix)
   6ED3 AF            [ 4] 2056 	xor	a, a
   6ED4 77            [ 7] 2057 	ld	(hl), a
   6ED5 23            [ 6] 2058 	inc	hl
   6ED6 77            [ 7] 2059 	ld	(hl), a
                           2060 ;src/main.c:429: enemy->reversePatrol = 0;
   6ED7 DD 6E FE      [19] 2061 	ld	l,-2 (ix)
   6EDA DD 66 FF      [19] 2062 	ld	h,-1 (ix)
   6EDD 36 00         [10] 2063 	ld	(hl),#0x00
   6EDF                    2064 00118$:
   6EDF DD F9         [10] 2065 	ld	sp, ix
   6EE1 DD E1         [14] 2066 	pop	ix
   6EE3 C9            [10] 2067 	ret
                           2068 ;src/main.c:436: void lookFor(TEnemy* enemy){
                           2069 ;	---------------------------------
                           2070 ; Function lookFor
                           2071 ; ---------------------------------
   6EE4                    2072 _lookFor::
   6EE4 DD E5         [15] 2073 	push	ix
   6EE6 DD 21 00 00   [14] 2074 	ld	ix,#0
   6EEA DD 39         [15] 2075 	add	ix,sp
   6EEC 21 F9 FF      [10] 2076 	ld	hl,#-7
   6EEF 39            [11] 2077 	add	hl,sp
   6EF0 F9            [ 6] 2078 	ld	sp,hl
                           2079 ;src/main.c:445: i16 difx = abs((i16)(enemy->x - prota.x));
   6EF1 DD 5E 04      [19] 2080 	ld	e,4 (ix)
   6EF4 DD 56 05      [19] 2081 	ld	d,5 (ix)
   6EF7 1A            [ 7] 2082 	ld	a,(de)
   6EF8 4F            [ 4] 2083 	ld	c,a
   6EF9 06 00         [ 7] 2084 	ld	b,#0x00
   6EFB 21 F8 62      [10] 2085 	ld	hl,#_prota+0
   6EFE 6E            [ 7] 2086 	ld	l,(hl)
   6EFF 26 00         [ 7] 2087 	ld	h,#0x00
   6F01 79            [ 4] 2088 	ld	a,c
   6F02 95            [ 4] 2089 	sub	a, l
   6F03 4F            [ 4] 2090 	ld	c,a
   6F04 78            [ 4] 2091 	ld	a,b
   6F05 9C            [ 4] 2092 	sbc	a, h
   6F06 47            [ 4] 2093 	ld	b,a
   6F07 D5            [11] 2094 	push	de
   6F08 C5            [11] 2095 	push	bc
   6F09 CD 70 4A      [17] 2096 	call	_abs
   6F0C F1            [10] 2097 	pop	af
   6F0D D1            [10] 2098 	pop	de
   6F0E DD 75 FA      [19] 2099 	ld	-6 (ix),l
   6F11 DD 74 FB      [19] 2100 	ld	-5 (ix),h
                           2101 ;src/main.c:446: i16 dify = abs((i16)(enemy->y - prota.y));
   6F14 21 01 00      [10] 2102 	ld	hl,#0x0001
   6F17 19            [11] 2103 	add	hl,de
   6F18 DD 75 FC      [19] 2104 	ld	-4 (ix),l
   6F1B DD 74 FD      [19] 2105 	ld	-3 (ix),h
   6F1E DD 6E FC      [19] 2106 	ld	l,-4 (ix)
   6F21 DD 66 FD      [19] 2107 	ld	h,-3 (ix)
   6F24 4E            [ 7] 2108 	ld	c,(hl)
   6F25 06 00         [ 7] 2109 	ld	b,#0x00
   6F27 21 F9 62      [10] 2110 	ld	hl, #(_prota + 0x0001) + 0
   6F2A 6E            [ 7] 2111 	ld	l,(hl)
   6F2B 26 00         [ 7] 2112 	ld	h,#0x00
   6F2D 79            [ 4] 2113 	ld	a,c
   6F2E 95            [ 4] 2114 	sub	a, l
   6F2F 4F            [ 4] 2115 	ld	c,a
   6F30 78            [ 4] 2116 	ld	a,b
   6F31 9C            [ 4] 2117 	sbc	a, h
   6F32 47            [ 4] 2118 	ld	b,a
   6F33 D5            [11] 2119 	push	de
   6F34 C5            [11] 2120 	push	bc
   6F35 CD 70 4A      [17] 2121 	call	_abs
   6F38 F1            [10] 2122 	pop	af
   6F39 D1            [10] 2123 	pop	de
                           2124 ;src/main.c:448: dist = difx + dify; // manhattan
   6F3A DD 4E FA      [19] 2125 	ld	c,-6 (ix)
   6F3D 09            [11] 2126 	add	hl, bc
   6F3E DD 75 F9      [19] 2127 	ld	-7 (ix),l
                           2128 ;src/main.c:449: enemy->seen = NO;
   6F41 21 12 00      [10] 2129 	ld	hl,#0x0012
   6F44 19            [11] 2130 	add	hl,de
   6F45 DD 75 FE      [19] 2131 	ld	-2 (ix),l
   6F48 DD 74 FF      [19] 2132 	ld	-1 (ix),h
   6F4B DD 6E FE      [19] 2133 	ld	l,-2 (ix)
   6F4E DD 66 FF      [19] 2134 	ld	h,-1 (ix)
   6F51 36 00         [10] 2135 	ld	(hl),#0x00
                           2136 ;src/main.c:450: enemy->in_range = NO;
   6F53 21 11 00      [10] 2137 	ld	hl,#0x0011
   6F56 19            [11] 2138 	add	hl,de
   6F57 4D            [ 4] 2139 	ld	c,l
   6F58 44            [ 4] 2140 	ld	b,h
   6F59 AF            [ 4] 2141 	xor	a, a
   6F5A 02            [ 7] 2142 	ld	(bc),a
                           2143 ;src/main.c:451: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6F5B C5            [11] 2144 	push	bc
   6F5C D5            [11] 2145 	push	de
   6F5D 21 18 5A      [10] 2146 	ld	hl,#0x5A18
   6F60 E5            [11] 2147 	push	hl
   6F61 21 00 C0      [10] 2148 	ld	hl,#0xC000
   6F64 E5            [11] 2149 	push	hl
   6F65 CD 15 5F      [17] 2150 	call	_cpct_getScreenPtr
   6F68 D1            [10] 2151 	pop	de
   6F69 C1            [10] 2152 	pop	bc
                           2153 ;src/main.c:452: if(!enemy->seek){
   6F6A D5            [11] 2154 	push	de
   6F6B FD E1         [14] 2155 	pop	iy
   6F6D FD 7E 14      [19] 2156 	ld	a,20 (iy)
   6F70 B7            [ 4] 2157 	or	a, a
   6F71 C2 F7 6F      [10] 2158 	jp	NZ,00111$
                           2159 ;src/main.c:453: if (dist <= 10) {// te detectan los sensores de proximidad
   6F74 3E 0A         [ 7] 2160 	ld	a,#0x0A
   6F76 DD 96 F9      [19] 2161 	sub	a, -7 (ix)
   6F79 38 13         [12] 2162 	jr	C,00107$
                           2163 ;src/main.c:454: enemy->in_range = 1;
   6F7B 3E 01         [ 7] 2164 	ld	a,#0x01
   6F7D 02            [ 7] 2165 	ld	(bc),a
                           2166 ;src/main.c:455: enemy->engage = 1;
   6F7E 21 16 00      [10] 2167 	ld	hl,#0x0016
   6F81 19            [11] 2168 	add	hl,de
   6F82 36 01         [10] 2169 	ld	(hl),#0x01
                           2170 ;src/main.c:456: enemy->seen = SI;
   6F84 DD 6E FE      [19] 2171 	ld	l,-2 (ix)
   6F87 DD 66 FF      [19] 2172 	ld	h,-1 (ix)
   6F8A 36 01         [10] 2173 	ld	(hl),#0x01
   6F8C 18 69         [12] 2174 	jr	00111$
   6F8E                    2175 00107$:
                           2176 ;src/main.c:457: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6F8E 21 F8 62      [10] 2177 	ld	hl, #_prota + 0
   6F91 4E            [ 7] 2178 	ld	c,(hl)
   6F92 1A            [ 7] 2179 	ld	a,(de)
   6F93 5F            [ 4] 2180 	ld	e,a
   6F94 16 00         [ 7] 2181 	ld	d,#0x00
   6F96 7B            [ 4] 2182 	ld	a,e
   6F97 C6 E7         [ 7] 2183 	add	a,#0xE7
   6F99 6F            [ 4] 2184 	ld	l,a
   6F9A 7A            [ 4] 2185 	ld	a,d
   6F9B CE FF         [ 7] 2186 	adc	a,#0xFF
   6F9D 67            [ 4] 2187 	ld	h,a
   6F9E 06 00         [ 7] 2188 	ld	b,#0x00
   6FA0 7D            [ 4] 2189 	ld	a,l
   6FA1 91            [ 4] 2190 	sub	a, c
   6FA2 7C            [ 4] 2191 	ld	a,h
   6FA3 98            [ 4] 2192 	sbc	a, b
   6FA4 E2 A9 6F      [10] 2193 	jp	PO, 00137$
   6FA7 EE 80         [ 7] 2194 	xor	a, #0x80
   6FA9                    2195 00137$:
   6FA9 F2 F7 6F      [10] 2196 	jp	P,00111$
   6FAC 21 19 00      [10] 2197 	ld	hl,#0x0019
   6FAF 19            [11] 2198 	add	hl,de
   6FB0 79            [ 4] 2199 	ld	a,c
   6FB1 95            [ 4] 2200 	sub	a, l
   6FB2 78            [ 4] 2201 	ld	a,b
   6FB3 9C            [ 4] 2202 	sbc	a, h
   6FB4 E2 B9 6F      [10] 2203 	jp	PO, 00138$
   6FB7 EE 80         [ 7] 2204 	xor	a, #0x80
   6FB9                    2205 00138$:
   6FB9 F2 F7 6F      [10] 2206 	jp	P,00111$
                           2207 ;src/main.c:458: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6FBC 21 F9 62      [10] 2208 	ld	hl, #(_prota + 0x0001) + 0
   6FBF 4E            [ 7] 2209 	ld	c,(hl)
   6FC0 DD 6E FC      [19] 2210 	ld	l,-4 (ix)
   6FC3 DD 66 FD      [19] 2211 	ld	h,-3 (ix)
   6FC6 5E            [ 7] 2212 	ld	e,(hl)
   6FC7 16 00         [ 7] 2213 	ld	d,#0x00
   6FC9 7B            [ 4] 2214 	ld	a,e
   6FCA C6 CC         [ 7] 2215 	add	a,#0xCC
   6FCC 6F            [ 4] 2216 	ld	l,a
   6FCD 7A            [ 4] 2217 	ld	a,d
   6FCE CE FF         [ 7] 2218 	adc	a,#0xFF
   6FD0 67            [ 4] 2219 	ld	h,a
   6FD1 06 00         [ 7] 2220 	ld	b,#0x00
   6FD3 7D            [ 4] 2221 	ld	a,l
   6FD4 91            [ 4] 2222 	sub	a, c
   6FD5 7C            [ 4] 2223 	ld	a,h
   6FD6 98            [ 4] 2224 	sbc	a, b
   6FD7 E2 DC 6F      [10] 2225 	jp	PO, 00139$
   6FDA EE 80         [ 7] 2226 	xor	a, #0x80
   6FDC                    2227 00139$:
   6FDC F2 F7 6F      [10] 2228 	jp	P,00111$
   6FDF 21 34 00      [10] 2229 	ld	hl,#0x0034
   6FE2 19            [11] 2230 	add	hl,de
   6FE3 79            [ 4] 2231 	ld	a,c
   6FE4 95            [ 4] 2232 	sub	a, l
   6FE5 78            [ 4] 2233 	ld	a,b
   6FE6 9C            [ 4] 2234 	sbc	a, h
   6FE7 E2 EC 6F      [10] 2235 	jp	PO, 00140$
   6FEA EE 80         [ 7] 2236 	xor	a, #0x80
   6FEC                    2237 00140$:
   6FEC F2 F7 6F      [10] 2238 	jp	P,00111$
                           2239 ;src/main.c:459: enemy->seen = SI;
   6FEF DD 6E FE      [19] 2240 	ld	l,-2 (ix)
   6FF2 DD 66 FF      [19] 2241 	ld	h,-1 (ix)
   6FF5 36 01         [10] 2242 	ld	(hl),#0x01
   6FF7                    2243 00111$:
   6FF7 DD F9         [10] 2244 	ld	sp, ix
   6FF9 DD E1         [14] 2245 	pop	ix
   6FFB C9            [10] 2246 	ret
                           2247 ;src/main.c:465: void moverEnemigoSeek(TEnemy* actual){
                           2248 ;	---------------------------------
                           2249 ; Function moverEnemigoSeek
                           2250 ; ---------------------------------
   6FFC                    2251 _moverEnemigoSeek::
   6FFC DD E5         [15] 2252 	push	ix
   6FFE DD 21 00 00   [14] 2253 	ld	ix,#0
   7002 DD 39         [15] 2254 	add	ix,sp
   7004 21 F6 FF      [10] 2255 	ld	hl,#-10
   7007 39            [11] 2256 	add	hl,sp
   7008 F9            [ 6] 2257 	ld	sp,hl
                           2258 ;src/main.c:468: if(!actual->muerto){
   7009 DD 4E 04      [19] 2259 	ld	c,4 (ix)
   700C DD 46 05      [19] 2260 	ld	b,5 (ix)
   700F C5            [11] 2261 	push	bc
   7010 FD E1         [14] 2262 	pop	iy
   7012 FD 7E 08      [19] 2263 	ld	a, 8 (iy)
   7015 B7            [ 4] 2264 	or	a, a
   7016 C2 9C 71      [10] 2265 	jp	NZ,00114$
                           2266 ;src/main.c:471: if(actual->iter < actual->longitud_camino){
   7019 21 0E 00      [10] 2267 	ld	hl,#0x000E
   701C 09            [11] 2268 	add	hl,bc
   701D DD 75 FD      [19] 2269 	ld	-3 (ix),l
   7020 DD 74 FE      [19] 2270 	ld	-2 (ix),h
   7023 DD 6E FD      [19] 2271 	ld	l,-3 (ix)
   7026 DD 66 FE      [19] 2272 	ld	h,-2 (ix)
   7029 7E            [ 7] 2273 	ld	a,(hl)
   702A DD 77 FB      [19] 2274 	ld	-5 (ix),a
   702D 23            [ 6] 2275 	inc	hl
   702E 7E            [ 7] 2276 	ld	a,(hl)
   702F DD 77 FC      [19] 2277 	ld	-4 (ix),a
   7032 69            [ 4] 2278 	ld	l, c
   7033 60            [ 4] 2279 	ld	h, b
   7034 11 E1 00      [10] 2280 	ld	de, #0x00E1
   7037 19            [11] 2281 	add	hl, de
   7038 5E            [ 7] 2282 	ld	e,(hl)
   7039 16 00         [ 7] 2283 	ld	d,#0x00
                           2284 ;src/main.c:480: actual->y = actual->camino[actual->iter];
   703B 21 01 00      [10] 2285 	ld	hl,#0x0001
   703E 09            [11] 2286 	add	hl,bc
   703F DD 75 F9      [19] 2287 	ld	-7 (ix),l
   7042 DD 74 FA      [19] 2288 	ld	-6 (ix),h
                           2289 ;src/main.c:471: if(actual->iter < actual->longitud_camino){
   7045 DD 7E FB      [19] 2290 	ld	a,-5 (ix)
   7048 93            [ 4] 2291 	sub	a, e
   7049 DD 7E FC      [19] 2292 	ld	a,-4 (ix)
   704C 9A            [ 4] 2293 	sbc	a, d
   704D E2 52 70      [10] 2294 	jp	PO, 00136$
   7050 EE 80         [ 7] 2295 	xor	a, #0x80
   7052                    2296 00136$:
   7052 F2 E6 70      [10] 2297 	jp	P,00110$
                           2298 ;src/main.c:476: actual->mover = SI;
   7055 21 06 00      [10] 2299 	ld	hl,#0x0006
   7058 09            [11] 2300 	add	hl,bc
                           2301 ;src/main.c:478: actual->x = actual->camino[actual->iter];
   7059 79            [ 4] 2302 	ld	a,c
   705A C6 19         [ 7] 2303 	add	a, #0x19
   705C 5F            [ 4] 2304 	ld	e,a
   705D 78            [ 4] 2305 	ld	a,b
   705E CE 00         [ 7] 2306 	adc	a, #0x00
   7060 57            [ 4] 2307 	ld	d,a
                           2308 ;src/main.c:474: if(actual->iter == 0){
   7061 DD 7E FC      [19] 2309 	ld	a,-4 (ix)
   7064 DD B6 FB      [19] 2310 	or	a,-5 (ix)
   7067 20 44         [12] 2311 	jr	NZ,00102$
                           2312 ;src/main.c:476: actual->mover = SI;
   7069 36 01         [10] 2313 	ld	(hl),#0x01
                           2314 ;src/main.c:477: actual->iter = 2;
   706B DD 6E FD      [19] 2315 	ld	l,-3 (ix)
   706E DD 66 FE      [19] 2316 	ld	h,-2 (ix)
   7071 36 02         [10] 2317 	ld	(hl),#0x02
   7073 23            [ 6] 2318 	inc	hl
   7074 36 00         [10] 2319 	ld	(hl),#0x00
                           2320 ;src/main.c:478: actual->x = actual->camino[actual->iter];
   7076 DD 6E FD      [19] 2321 	ld	l,-3 (ix)
   7079 DD 66 FE      [19] 2322 	ld	h,-2 (ix)
   707C 7E            [ 7] 2323 	ld	a, (hl)
   707D 23            [ 6] 2324 	inc	hl
   707E 66            [ 7] 2325 	ld	h,(hl)
   707F 6F            [ 4] 2326 	ld	l,a
   7080 19            [11] 2327 	add	hl,de
   7081 7E            [ 7] 2328 	ld	a,(hl)
   7082 02            [ 7] 2329 	ld	(bc),a
                           2330 ;src/main.c:479: ++actual->iter;
   7083 DD 6E FD      [19] 2331 	ld	l,-3 (ix)
   7086 DD 66 FE      [19] 2332 	ld	h,-2 (ix)
   7089 4E            [ 7] 2333 	ld	c,(hl)
   708A 23            [ 6] 2334 	inc	hl
   708B 46            [ 7] 2335 	ld	b,(hl)
   708C 03            [ 6] 2336 	inc	bc
   708D DD 6E FD      [19] 2337 	ld	l,-3 (ix)
   7090 DD 66 FE      [19] 2338 	ld	h,-2 (ix)
   7093 71            [ 7] 2339 	ld	(hl),c
   7094 23            [ 6] 2340 	inc	hl
   7095 70            [ 7] 2341 	ld	(hl),b
                           2342 ;src/main.c:480: actual->y = actual->camino[actual->iter];
   7096 EB            [ 4] 2343 	ex	de,hl
   7097 09            [11] 2344 	add	hl,bc
   7098 5E            [ 7] 2345 	ld	e,(hl)
   7099 DD 6E F9      [19] 2346 	ld	l,-7 (ix)
   709C DD 66 FA      [19] 2347 	ld	h,-6 (ix)
   709F 73            [ 7] 2348 	ld	(hl),e
                           2349 ;src/main.c:481: ++actual->iter;
   70A0 03            [ 6] 2350 	inc	bc
   70A1 DD 6E FD      [19] 2351 	ld	l,-3 (ix)
   70A4 DD 66 FE      [19] 2352 	ld	h,-2 (ix)
   70A7 71            [ 7] 2353 	ld	(hl),c
   70A8 23            [ 6] 2354 	inc	hl
   70A9 70            [ 7] 2355 	ld	(hl),b
   70AA C3 9C 71      [10] 2356 	jp	00114$
   70AD                    2357 00102$:
                           2358 ;src/main.c:484: actual->mover = SI;
   70AD 36 01         [10] 2359 	ld	(hl),#0x01
                           2360 ;src/main.c:485: actual->x = actual->camino[actual->iter];
   70AF DD 6E FD      [19] 2361 	ld	l,-3 (ix)
   70B2 DD 66 FE      [19] 2362 	ld	h,-2 (ix)
   70B5 7E            [ 7] 2363 	ld	a, (hl)
   70B6 23            [ 6] 2364 	inc	hl
   70B7 66            [ 7] 2365 	ld	h,(hl)
   70B8 6F            [ 4] 2366 	ld	l,a
   70B9 19            [11] 2367 	add	hl,de
   70BA 7E            [ 7] 2368 	ld	a,(hl)
   70BB 02            [ 7] 2369 	ld	(bc),a
                           2370 ;src/main.c:486: ++actual->iter;
   70BC DD 6E FD      [19] 2371 	ld	l,-3 (ix)
   70BF DD 66 FE      [19] 2372 	ld	h,-2 (ix)
   70C2 4E            [ 7] 2373 	ld	c,(hl)
   70C3 23            [ 6] 2374 	inc	hl
   70C4 46            [ 7] 2375 	ld	b,(hl)
   70C5 03            [ 6] 2376 	inc	bc
   70C6 DD 6E FD      [19] 2377 	ld	l,-3 (ix)
   70C9 DD 66 FE      [19] 2378 	ld	h,-2 (ix)
   70CC 71            [ 7] 2379 	ld	(hl),c
   70CD 23            [ 6] 2380 	inc	hl
   70CE 70            [ 7] 2381 	ld	(hl),b
                           2382 ;src/main.c:487: actual->y = actual->camino[actual->iter];
   70CF EB            [ 4] 2383 	ex	de,hl
   70D0 09            [11] 2384 	add	hl,bc
   70D1 5E            [ 7] 2385 	ld	e,(hl)
   70D2 DD 6E F9      [19] 2386 	ld	l,-7 (ix)
   70D5 DD 66 FA      [19] 2387 	ld	h,-6 (ix)
   70D8 73            [ 7] 2388 	ld	(hl),e
                           2389 ;src/main.c:488: ++actual->iter;
   70D9 03            [ 6] 2390 	inc	bc
   70DA DD 6E FD      [19] 2391 	ld	l,-3 (ix)
   70DD DD 66 FE      [19] 2392 	ld	h,-2 (ix)
   70E0 71            [ 7] 2393 	ld	(hl),c
   70E1 23            [ 6] 2394 	inc	hl
   70E2 70            [ 7] 2395 	ld	(hl),b
   70E3 C3 9C 71      [10] 2396 	jp	00114$
   70E6                    2397 00110$:
                           2398 ;src/main.c:493: actual->seek = 0;
   70E6 21 14 00      [10] 2399 	ld	hl,#0x0014
   70E9 09            [11] 2400 	add	hl,bc
   70EA DD 75 FB      [19] 2401 	ld	-5 (ix),l
   70ED DD 74 FC      [19] 2402 	ld	-4 (ix),h
   70F0 DD 6E FB      [19] 2403 	ld	l,-5 (ix)
   70F3 DD 66 FC      [19] 2404 	ld	h,-4 (ix)
   70F6 36 00         [10] 2405 	ld	(hl),#0x00
                           2406 ;src/main.c:494: lookFor(actual);
   70F8 C5            [11] 2407 	push	bc
   70F9 C5            [11] 2408 	push	bc
   70FA CD E4 6E      [17] 2409 	call	_lookFor
   70FD F1            [10] 2410 	pop	af
   70FE C1            [10] 2411 	pop	bc
                           2412 ;src/main.c:495: if(!actual->seen){
   70FF 69            [ 4] 2413 	ld	l, c
   7100 60            [ 4] 2414 	ld	h, b
   7101 11 12 00      [10] 2415 	ld	de, #0x0012
   7104 19            [11] 2416 	add	hl, de
   7105 7E            [ 7] 2417 	ld	a,(hl)
   7106 DD 77 F8      [19] 2418 	ld	-8 (ix),a
                           2419 ;src/main.c:496: actual->patrolling = 1;
   7109 21 0B 00      [10] 2420 	ld	hl,#0x000B
   710C 09            [11] 2421 	add	hl,bc
   710D E3            [19] 2422 	ex	(sp), hl
                           2423 ;src/main.c:495: if(!actual->seen){
   710E DD 7E F8      [19] 2424 	ld	a,-8 (ix)
   7111 B7            [ 4] 2425 	or	a, a
   7112 20 38         [12] 2426 	jr	NZ,00107$
                           2427 ;src/main.c:496: actual->patrolling = 1;
   7114 E1            [10] 2428 	pop	hl
   7115 E5            [11] 2429 	push	hl
   7116 36 01         [10] 2430 	ld	(hl),#0x01
                           2431 ;src/main.c:497: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7118 C5            [11] 2432 	push	bc
   7119 FD E1         [14] 2433 	pop	iy
   711B FD 7E 18      [19] 2434 	ld	a,24 (iy)
   711E DD 77 F8      [19] 2435 	ld	-8 (ix),a
   7121 C5            [11] 2436 	push	bc
   7122 FD E1         [14] 2437 	pop	iy
   7124 FD 56 17      [19] 2438 	ld	d,23 (iy)
   7127 DD 6E F9      [19] 2439 	ld	l,-7 (ix)
   712A DD 66 FA      [19] 2440 	ld	h,-6 (ix)
   712D 5E            [ 7] 2441 	ld	e,(hl)
   712E 0A            [ 7] 2442 	ld	a,(bc)
   712F DD 77 FF      [19] 2443 	ld	-1 (ix),a
   7132 2A D5 63      [16] 2444 	ld	hl,(_mapa)
   7135 E5            [11] 2445 	push	hl
   7136 C5            [11] 2446 	push	bc
   7137 DD 7E F8      [19] 2447 	ld	a,-8 (ix)
   713A F5            [11] 2448 	push	af
   713B 33            [ 6] 2449 	inc	sp
   713C D5            [11] 2450 	push	de
   713D DD 7E FF      [19] 2451 	ld	a,-1 (ix)
   7140 F5            [11] 2452 	push	af
   7141 33            [ 6] 2453 	inc	sp
   7142 CD 82 48      [17] 2454 	call	_pathFinding
   7145 21 08 00      [10] 2455 	ld	hl,#8
   7148 39            [11] 2456 	add	hl,sp
   7149 F9            [ 6] 2457 	ld	sp,hl
   714A 18 46         [12] 2458 	jr	00108$
   714C                    2459 00107$:
                           2460 ;src/main.c:499: actual->patrolling = 0;
   714C E1            [10] 2461 	pop	hl
   714D E5            [11] 2462 	push	hl
   714E 36 00         [10] 2463 	ld	(hl),#0x00
                           2464 ;src/main.c:500: if(!actual->engage){
   7150 C5            [11] 2465 	push	bc
   7151 FD E1         [14] 2466 	pop	iy
   7153 FD 7E 16      [19] 2467 	ld	a,22 (iy)
   7156 B7            [ 4] 2468 	or	a, a
   7157 20 39         [12] 2469 	jr	NZ,00108$
                           2470 ;src/main.c:501: actual->seek = 1;
   7159 DD 6E FB      [19] 2471 	ld	l,-5 (ix)
   715C DD 66 FC      [19] 2472 	ld	h,-4 (ix)
   715F 36 01         [10] 2473 	ld	(hl),#0x01
                           2474 ;src/main.c:502: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7161 3A F9 62      [13] 2475 	ld	a,(#_prota + 1)
   7164 DD 77 FF      [19] 2476 	ld	-1 (ix),a
   7167 21 F8 62      [10] 2477 	ld	hl, #_prota + 0
   716A 5E            [ 7] 2478 	ld	e,(hl)
   716B DD 6E F9      [19] 2479 	ld	l,-7 (ix)
   716E DD 66 FA      [19] 2480 	ld	h,-6 (ix)
   7171 56            [ 7] 2481 	ld	d,(hl)
   7172 0A            [ 7] 2482 	ld	a,(bc)
   7173 DD 77 F6      [19] 2483 	ld	-10 (ix),a
   7176 2A D5 63      [16] 2484 	ld	hl,(_mapa)
   7179 E5            [11] 2485 	push	hl
   717A C5            [11] 2486 	push	bc
   717B DD 7E FF      [19] 2487 	ld	a,-1 (ix)
   717E F5            [11] 2488 	push	af
   717F 33            [ 6] 2489 	inc	sp
   7180 7B            [ 4] 2490 	ld	a,e
   7181 F5            [11] 2491 	push	af
   7182 33            [ 6] 2492 	inc	sp
   7183 D5            [11] 2493 	push	de
   7184 33            [ 6] 2494 	inc	sp
   7185 DD 7E F6      [19] 2495 	ld	a,-10 (ix)
   7188 F5            [11] 2496 	push	af
   7189 33            [ 6] 2497 	inc	sp
   718A CD 82 48      [17] 2498 	call	_pathFinding
   718D 21 08 00      [10] 2499 	ld	hl,#8
   7190 39            [11] 2500 	add	hl,sp
   7191 F9            [ 6] 2501 	ld	sp,hl
   7192                    2502 00108$:
                           2503 ;src/main.c:505: actual->iter = 0;
   7192 DD 6E FD      [19] 2504 	ld	l,-3 (ix)
   7195 DD 66 FE      [19] 2505 	ld	h,-2 (ix)
   7198 AF            [ 4] 2506 	xor	a, a
   7199 77            [ 7] 2507 	ld	(hl), a
   719A 23            [ 6] 2508 	inc	hl
   719B 77            [ 7] 2509 	ld	(hl), a
   719C                    2510 00114$:
   719C DD F9         [10] 2511 	ld	sp, ix
   719E DD E1         [14] 2512 	pop	ix
   71A0 C9            [10] 2513 	ret
                           2514 ;src/main.c:513: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2515 ;	---------------------------------
                           2516 ; Function engage
                           2517 ; ---------------------------------
   71A1                    2518 _engage::
   71A1 DD E5         [15] 2519 	push	ix
   71A3 DD 21 00 00   [14] 2520 	ld	ix,#0
   71A7 DD 39         [15] 2521 	add	ix,sp
   71A9 21 F1 FF      [10] 2522 	ld	hl,#-15
   71AC 39            [11] 2523 	add	hl,sp
   71AD F9            [ 6] 2524 	ld	sp,hl
                           2525 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71AE DD 7E 04      [19] 2526 	ld	a,4 (ix)
   71B1 DD 77 F4      [19] 2527 	ld	-12 (ix),a
   71B4 DD 7E 05      [19] 2528 	ld	a,5 (ix)
   71B7 DD 77 F5      [19] 2529 	ld	-11 (ix),a
   71BA DD 6E F4      [19] 2530 	ld	l,-12 (ix)
   71BD DD 66 F5      [19] 2531 	ld	h,-11 (ix)
   71C0 4E            [ 7] 2532 	ld	c,(hl)
   71C1 06 00         [ 7] 2533 	ld	b,#0x00
   71C3 21 F8 62      [10] 2534 	ld	hl,#_prota+0
   71C6 5E            [ 7] 2535 	ld	e,(hl)
   71C7 16 00         [ 7] 2536 	ld	d,#0x00
   71C9 79            [ 4] 2537 	ld	a,c
   71CA 93            [ 4] 2538 	sub	a, e
   71CB 4F            [ 4] 2539 	ld	c,a
   71CC 78            [ 4] 2540 	ld	a,b
   71CD 9A            [ 4] 2541 	sbc	a, d
   71CE 47            [ 4] 2542 	ld	b,a
   71CF C5            [11] 2543 	push	bc
   71D0 CD 70 4A      [17] 2544 	call	_abs
   71D3 F1            [10] 2545 	pop	af
   71D4 4D            [ 4] 2546 	ld	c,l
                           2547 ;src/main.c:515: u8 dify = abs(enemy->y - prota.y);
   71D5 DD 7E F4      [19] 2548 	ld	a,-12 (ix)
   71D8 C6 01         [ 7] 2549 	add	a, #0x01
   71DA DD 77 F6      [19] 2550 	ld	-10 (ix),a
   71DD DD 7E F5      [19] 2551 	ld	a,-11 (ix)
   71E0 CE 00         [ 7] 2552 	adc	a, #0x00
   71E2 DD 77 F7      [19] 2553 	ld	-9 (ix),a
   71E5 DD 6E F6      [19] 2554 	ld	l,-10 (ix)
   71E8 DD 66 F7      [19] 2555 	ld	h,-9 (ix)
   71EB 5E            [ 7] 2556 	ld	e,(hl)
   71EC 16 00         [ 7] 2557 	ld	d,#0x00
   71EE 21 F9 62      [10] 2558 	ld	hl, #_prota + 1
   71F1 6E            [ 7] 2559 	ld	l,(hl)
   71F2 26 00         [ 7] 2560 	ld	h,#0x00
   71F4 7B            [ 4] 2561 	ld	a,e
   71F5 95            [ 4] 2562 	sub	a, l
   71F6 5F            [ 4] 2563 	ld	e,a
   71F7 7A            [ 4] 2564 	ld	a,d
   71F8 9C            [ 4] 2565 	sbc	a, h
   71F9 57            [ 4] 2566 	ld	d,a
   71FA C5            [11] 2567 	push	bc
   71FB D5            [11] 2568 	push	de
   71FC CD 70 4A      [17] 2569 	call	_abs
   71FF F1            [10] 2570 	pop	af
   7200 C1            [10] 2571 	pop	bc
                           2572 ;src/main.c:516: u8 dist = difx + dify; // manhattan
   7201 09            [11] 2573 	add	hl, bc
   7202 DD 75 F1      [19] 2574 	ld	-15 (ix),l
                           2575 ;src/main.c:518: u8 movX = 0;
   7205 DD 36 F3 00   [19] 2576 	ld	-13 (ix),#0x00
                           2577 ;src/main.c:519: u8 movY = 0;
   7209 DD 36 F2 00   [19] 2578 	ld	-14 (ix),#0x00
                           2579 ;src/main.c:520: u8 distConstraint = 25;
   720D 0E 19         [ 7] 2580 	ld	c,#0x19
                           2581 ;src/main.c:521: enemy->mover = NO;
   720F DD 7E F4      [19] 2582 	ld	a,-12 (ix)
   7212 C6 06         [ 7] 2583 	add	a, #0x06
   7214 DD 77 F8      [19] 2584 	ld	-8 (ix),a
   7217 DD 7E F5      [19] 2585 	ld	a,-11 (ix)
   721A CE 00         [ 7] 2586 	adc	a, #0x00
   721C DD 77 F9      [19] 2587 	ld	-7 (ix),a
   721F DD 6E F8      [19] 2588 	ld	l,-8 (ix)
   7222 DD 66 F9      [19] 2589 	ld	h,-7 (ix)
   7225 36 00         [10] 2590 	ld	(hl),#0x00
                           2591 ;src/main.c:523: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7227 DD 6E F6      [19] 2592 	ld	l,-10 (ix)
   722A DD 66 F7      [19] 2593 	ld	h,-9 (ix)
   722D 7E            [ 7] 2594 	ld	a,(hl)
   722E DD 77 FA      [19] 2595 	ld	-6 (ix),a
                           2596 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7231 DD 6E F4      [19] 2597 	ld	l,-12 (ix)
   7234 DD 66 F5      [19] 2598 	ld	h,-11 (ix)
   7237 46            [ 7] 2599 	ld	b,(hl)
                           2600 ;src/main.c:536: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7238 78            [ 4] 2601 	ld	a,b
   7239 C6 04         [ 7] 2602 	add	a, #0x04
   723B DD 77 FB      [19] 2603 	ld	-5 (ix),a
                           2604 ;src/main.c:523: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   723E DD 7E 07      [19] 2605 	ld	a,7 (ix)
   7241 DD 96 FA      [19] 2606 	sub	a, -6 (ix)
   7244 28 38         [12] 2607 	jr	Z,00194$
   7246 DD 5E 07      [19] 2608 	ld	e,7 (ix)
   7249 16 00         [ 7] 2609 	ld	d,#0x00
   724B 21 01 00      [10] 2610 	ld	hl,#0x0001
   724E 19            [11] 2611 	add	hl,de
   724F DD 75 FC      [19] 2612 	ld	-4 (ix),l
   7252 DD 74 FD      [19] 2613 	ld	-3 (ix),h
   7255 DD 7E FA      [19] 2614 	ld	a,-6 (ix)
   7258 DD 77 FE      [19] 2615 	ld	-2 (ix),a
   725B DD 36 FF 00   [19] 2616 	ld	-1 (ix),#0x00
   725F DD 7E FE      [19] 2617 	ld	a,-2 (ix)
   7262 DD 96 FC      [19] 2618 	sub	a, -4 (ix)
   7265 20 08         [12] 2619 	jr	NZ,00422$
   7267 DD 7E FF      [19] 2620 	ld	a,-1 (ix)
   726A DD 96 FD      [19] 2621 	sub	a, -3 (ix)
   726D 28 0F         [12] 2622 	jr	Z,00194$
   726F                    2623 00422$:
   726F 1B            [ 6] 2624 	dec	de
   7270 DD 7E FE      [19] 2625 	ld	a,-2 (ix)
   7273 93            [ 4] 2626 	sub	a, e
   7274 C2 87 73      [10] 2627 	jp	NZ,00195$
   7277 DD 7E FF      [19] 2628 	ld	a,-1 (ix)
   727A 92            [ 4] 2629 	sub	a, d
   727B C2 87 73      [10] 2630 	jp	NZ,00195$
   727E                    2631 00194$:
                           2632 ;src/main.c:524: if (dx < enemy->x) { // izquierda
   727E DD 7E 06      [19] 2633 	ld	a,6 (ix)
   7281 90            [ 4] 2634 	sub	a, b
   7282 D2 04 73      [10] 2635 	jp	NC,00114$
                           2636 ;src/main.c:525: if (dist > 11) {
   7285 3E 0B         [ 7] 2637 	ld	a,#0x0B
   7287 DD 96 F1      [19] 2638 	sub	a, -15 (ix)
   728A D2 47 79      [10] 2639 	jp	NC,00199$
                           2640 ;src/main.c:526: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   728D DD 7E FA      [19] 2641 	ld	a,-6 (ix)
   7290 F5            [11] 2642 	push	af
   7291 33            [ 6] 2643 	inc	sp
   7292 C5            [11] 2644 	push	bc
   7293 33            [ 6] 2645 	inc	sp
   7294 2A D5 63      [16] 2646 	ld	hl,(_mapa)
   7297 E5            [11] 2647 	push	hl
   7298 CD 2C 4A      [17] 2648 	call	_getTilePtr
   729B F1            [10] 2649 	pop	af
   729C F1            [10] 2650 	pop	af
   729D 4E            [ 7] 2651 	ld	c,(hl)
   729E 3E 02         [ 7] 2652 	ld	a,#0x02
   72A0 91            [ 4] 2653 	sub	a, c
   72A1 DA 47 79      [10] 2654 	jp	C,00199$
                           2655 ;src/main.c:527: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   72A4 DD 6E F6      [19] 2656 	ld	l,-10 (ix)
   72A7 DD 66 F7      [19] 2657 	ld	h,-9 (ix)
   72AA 7E            [ 7] 2658 	ld	a,(hl)
   72AB C6 0B         [ 7] 2659 	add	a, #0x0B
   72AD 57            [ 4] 2660 	ld	d,a
   72AE DD 6E F4      [19] 2661 	ld	l,-12 (ix)
   72B1 DD 66 F5      [19] 2662 	ld	h,-11 (ix)
   72B4 46            [ 7] 2663 	ld	b,(hl)
   72B5 D5            [11] 2664 	push	de
   72B6 33            [ 6] 2665 	inc	sp
   72B7 C5            [11] 2666 	push	bc
   72B8 33            [ 6] 2667 	inc	sp
   72B9 2A D5 63      [16] 2668 	ld	hl,(_mapa)
   72BC E5            [11] 2669 	push	hl
   72BD CD 2C 4A      [17] 2670 	call	_getTilePtr
   72C0 F1            [10] 2671 	pop	af
   72C1 F1            [10] 2672 	pop	af
   72C2 4E            [ 7] 2673 	ld	c,(hl)
   72C3 3E 02         [ 7] 2674 	ld	a,#0x02
   72C5 91            [ 4] 2675 	sub	a, c
   72C6 DA 47 79      [10] 2676 	jp	C,00199$
                           2677 ;src/main.c:528: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   72C9 DD 6E F6      [19] 2678 	ld	l,-10 (ix)
   72CC DD 66 F7      [19] 2679 	ld	h,-9 (ix)
   72CF 7E            [ 7] 2680 	ld	a,(hl)
   72D0 C6 16         [ 7] 2681 	add	a, #0x16
   72D2 57            [ 4] 2682 	ld	d,a
   72D3 DD 6E F4      [19] 2683 	ld	l,-12 (ix)
   72D6 DD 66 F5      [19] 2684 	ld	h,-11 (ix)
   72D9 46            [ 7] 2685 	ld	b,(hl)
   72DA D5            [11] 2686 	push	de
   72DB 33            [ 6] 2687 	inc	sp
   72DC C5            [11] 2688 	push	bc
   72DD 33            [ 6] 2689 	inc	sp
   72DE 2A D5 63      [16] 2690 	ld	hl,(_mapa)
   72E1 E5            [11] 2691 	push	hl
   72E2 CD 2C 4A      [17] 2692 	call	_getTilePtr
   72E5 F1            [10] 2693 	pop	af
   72E6 F1            [10] 2694 	pop	af
   72E7 4E            [ 7] 2695 	ld	c,(hl)
   72E8 3E 02         [ 7] 2696 	ld	a,#0x02
   72EA 91            [ 4] 2697 	sub	a, c
   72EB DA 47 79      [10] 2698 	jp	C,00199$
                           2699 ;src/main.c:529: moverEnemigoIzquierda(enemy);
   72EE DD 6E F4      [19] 2700 	ld	l,-12 (ix)
   72F1 DD 66 F5      [19] 2701 	ld	h,-11 (ix)
   72F4 E5            [11] 2702 	push	hl
   72F5 CD 89 6C      [17] 2703 	call	_moverEnemigoIzquierda
   72F8 F1            [10] 2704 	pop	af
                           2705 ;src/main.c:531: enemy->mover = SI;
   72F9 DD 6E F8      [19] 2706 	ld	l,-8 (ix)
   72FC DD 66 F9      [19] 2707 	ld	h,-7 (ix)
   72FF 36 01         [10] 2708 	ld	(hl),#0x01
   7301 C3 47 79      [10] 2709 	jp	00199$
   7304                    2710 00114$:
                           2711 ;src/main.c:535: if (dist > G_ENEMY_W + 3) {
   7304 3E 07         [ 7] 2712 	ld	a,#0x07
   7306 DD 96 F1      [19] 2713 	sub	a, -15 (ix)
   7309 D2 47 79      [10] 2714 	jp	NC,00199$
                           2715 ;src/main.c:536: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   730C DD 66 FA      [19] 2716 	ld	h,-6 (ix)
   730F DD 6E FB      [19] 2717 	ld	l,-5 (ix)
   7312 E5            [11] 2718 	push	hl
   7313 2A D5 63      [16] 2719 	ld	hl,(_mapa)
   7316 E5            [11] 2720 	push	hl
   7317 CD 2C 4A      [17] 2721 	call	_getTilePtr
   731A F1            [10] 2722 	pop	af
   731B F1            [10] 2723 	pop	af
   731C 4E            [ 7] 2724 	ld	c,(hl)
   731D 3E 02         [ 7] 2725 	ld	a,#0x02
   731F 91            [ 4] 2726 	sub	a, c
   7320 DA 47 79      [10] 2727 	jp	C,00199$
                           2728 ;src/main.c:537: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7323 DD 6E F6      [19] 2729 	ld	l,-10 (ix)
   7326 DD 66 F7      [19] 2730 	ld	h,-9 (ix)
   7329 7E            [ 7] 2731 	ld	a,(hl)
   732A C6 0B         [ 7] 2732 	add	a, #0x0B
   732C 47            [ 4] 2733 	ld	b,a
   732D DD 6E F4      [19] 2734 	ld	l,-12 (ix)
   7330 DD 66 F5      [19] 2735 	ld	h,-11 (ix)
   7333 7E            [ 7] 2736 	ld	a,(hl)
   7334 C6 04         [ 7] 2737 	add	a, #0x04
   7336 C5            [11] 2738 	push	bc
   7337 33            [ 6] 2739 	inc	sp
   7338 F5            [11] 2740 	push	af
   7339 33            [ 6] 2741 	inc	sp
   733A 2A D5 63      [16] 2742 	ld	hl,(_mapa)
   733D E5            [11] 2743 	push	hl
   733E CD 2C 4A      [17] 2744 	call	_getTilePtr
   7341 F1            [10] 2745 	pop	af
   7342 F1            [10] 2746 	pop	af
   7343 4E            [ 7] 2747 	ld	c,(hl)
   7344 3E 02         [ 7] 2748 	ld	a,#0x02
   7346 91            [ 4] 2749 	sub	a, c
   7347 DA 47 79      [10] 2750 	jp	C,00199$
                           2751 ;src/main.c:538: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   734A DD 6E F6      [19] 2752 	ld	l,-10 (ix)
   734D DD 66 F7      [19] 2753 	ld	h,-9 (ix)
   7350 7E            [ 7] 2754 	ld	a,(hl)
   7351 C6 16         [ 7] 2755 	add	a, #0x16
   7353 47            [ 4] 2756 	ld	b,a
   7354 DD 6E F4      [19] 2757 	ld	l,-12 (ix)
   7357 DD 66 F5      [19] 2758 	ld	h,-11 (ix)
   735A 7E            [ 7] 2759 	ld	a,(hl)
   735B C6 04         [ 7] 2760 	add	a, #0x04
   735D C5            [11] 2761 	push	bc
   735E 33            [ 6] 2762 	inc	sp
   735F F5            [11] 2763 	push	af
   7360 33            [ 6] 2764 	inc	sp
   7361 2A D5 63      [16] 2765 	ld	hl,(_mapa)
   7364 E5            [11] 2766 	push	hl
   7365 CD 2C 4A      [17] 2767 	call	_getTilePtr
   7368 F1            [10] 2768 	pop	af
   7369 F1            [10] 2769 	pop	af
   736A 4E            [ 7] 2770 	ld	c,(hl)
   736B 3E 02         [ 7] 2771 	ld	a,#0x02
   736D 91            [ 4] 2772 	sub	a, c
   736E DA 47 79      [10] 2773 	jp	C,00199$
                           2774 ;src/main.c:539: moverEnemigoDerecha(enemy);
   7371 DD 6E F4      [19] 2775 	ld	l,-12 (ix)
   7374 DD 66 F5      [19] 2776 	ld	h,-11 (ix)
   7377 E5            [11] 2777 	push	hl
   7378 CD 79 6C      [17] 2778 	call	_moverEnemigoDerecha
   737B F1            [10] 2779 	pop	af
                           2780 ;src/main.c:541: enemy->mover = SI;
   737C DD 6E F8      [19] 2781 	ld	l,-8 (ix)
   737F DD 66 F9      [19] 2782 	ld	h,-7 (ix)
   7382 36 01         [10] 2783 	ld	(hl),#0x01
   7384 C3 47 79      [10] 2784 	jp	00199$
   7387                    2785 00195$:
                           2786 ;src/main.c:546: else if (enemy->x == dx) {
   7387 DD 7E 06      [19] 2787 	ld	a,6 (ix)
   738A 90            [ 4] 2788 	sub	a, b
   738B C2 A0 74      [10] 2789 	jp	NZ,00192$
                           2790 ;src/main.c:547: if (dy < enemy->y) {
   738E DD 7E 07      [19] 2791 	ld	a,7 (ix)
   7391 DD 96 FA      [19] 2792 	sub	a, -6 (ix)
   7394 D2 1A 74      [10] 2793 	jp	NC,00129$
                           2794 ;src/main.c:548: if (dist > G_HERO_H + 5) {
   7397 3E 1B         [ 7] 2795 	ld	a,#0x1B
   7399 DD 96 F1      [19] 2796 	sub	a, -15 (ix)
   739C D2 47 79      [10] 2797 	jp	NC,00199$
                           2798 ;src/main.c:549: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   739F DD 56 FA      [19] 2799 	ld	d,-6 (ix)
   73A2 15            [ 4] 2800 	dec	d
   73A3 15            [ 4] 2801 	dec	d
   73A4 D5            [11] 2802 	push	de
   73A5 33            [ 6] 2803 	inc	sp
   73A6 C5            [11] 2804 	push	bc
   73A7 33            [ 6] 2805 	inc	sp
   73A8 2A D5 63      [16] 2806 	ld	hl,(_mapa)
   73AB E5            [11] 2807 	push	hl
   73AC CD 2C 4A      [17] 2808 	call	_getTilePtr
   73AF F1            [10] 2809 	pop	af
   73B0 F1            [10] 2810 	pop	af
   73B1 4E            [ 7] 2811 	ld	c,(hl)
   73B2 3E 02         [ 7] 2812 	ld	a,#0x02
   73B4 91            [ 4] 2813 	sub	a, c
   73B5 DA 47 79      [10] 2814 	jp	C,00199$
                           2815 ;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73B8 DD 6E F6      [19] 2816 	ld	l,-10 (ix)
   73BB DD 66 F7      [19] 2817 	ld	h,-9 (ix)
   73BE 56            [ 7] 2818 	ld	d,(hl)
   73BF 15            [ 4] 2819 	dec	d
   73C0 15            [ 4] 2820 	dec	d
   73C1 DD 6E F4      [19] 2821 	ld	l,-12 (ix)
   73C4 DD 66 F5      [19] 2822 	ld	h,-11 (ix)
   73C7 46            [ 7] 2823 	ld	b,(hl)
   73C8 04            [ 4] 2824 	inc	b
   73C9 04            [ 4] 2825 	inc	b
   73CA D5            [11] 2826 	push	de
   73CB 33            [ 6] 2827 	inc	sp
   73CC C5            [11] 2828 	push	bc
   73CD 33            [ 6] 2829 	inc	sp
   73CE 2A D5 63      [16] 2830 	ld	hl,(_mapa)
   73D1 E5            [11] 2831 	push	hl
   73D2 CD 2C 4A      [17] 2832 	call	_getTilePtr
   73D5 F1            [10] 2833 	pop	af
   73D6 F1            [10] 2834 	pop	af
   73D7 4E            [ 7] 2835 	ld	c,(hl)
   73D8 3E 02         [ 7] 2836 	ld	a,#0x02
   73DA 91            [ 4] 2837 	sub	a, c
   73DB DA 47 79      [10] 2838 	jp	C,00199$
                           2839 ;src/main.c:551: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73DE DD 6E F6      [19] 2840 	ld	l,-10 (ix)
   73E1 DD 66 F7      [19] 2841 	ld	h,-9 (ix)
   73E4 46            [ 7] 2842 	ld	b,(hl)
   73E5 05            [ 4] 2843 	dec	b
   73E6 05            [ 4] 2844 	dec	b
   73E7 DD 6E F4      [19] 2845 	ld	l,-12 (ix)
   73EA DD 66 F5      [19] 2846 	ld	h,-11 (ix)
   73ED 7E            [ 7] 2847 	ld	a,(hl)
   73EE C6 04         [ 7] 2848 	add	a, #0x04
   73F0 C5            [11] 2849 	push	bc
   73F1 33            [ 6] 2850 	inc	sp
   73F2 F5            [11] 2851 	push	af
   73F3 33            [ 6] 2852 	inc	sp
   73F4 2A D5 63      [16] 2853 	ld	hl,(_mapa)
   73F7 E5            [11] 2854 	push	hl
   73F8 CD 2C 4A      [17] 2855 	call	_getTilePtr
   73FB F1            [10] 2856 	pop	af
   73FC F1            [10] 2857 	pop	af
   73FD 4E            [ 7] 2858 	ld	c,(hl)
   73FE 3E 02         [ 7] 2859 	ld	a,#0x02
   7400 91            [ 4] 2860 	sub	a, c
   7401 DA 47 79      [10] 2861 	jp	C,00199$
                           2862 ;src/main.c:552: moverEnemigoArriba(enemy);
   7404 DD 6E F4      [19] 2863 	ld	l,-12 (ix)
   7407 DD 66 F5      [19] 2864 	ld	h,-11 (ix)
   740A E5            [11] 2865 	push	hl
   740B CD 3B 6C      [17] 2866 	call	_moverEnemigoArriba
   740E F1            [10] 2867 	pop	af
                           2868 ;src/main.c:554: enemy->mover = SI;
   740F DD 6E F8      [19] 2869 	ld	l,-8 (ix)
   7412 DD 66 F9      [19] 2870 	ld	h,-7 (ix)
   7415 36 01         [10] 2871 	ld	(hl),#0x01
   7417 C3 47 79      [10] 2872 	jp	00199$
   741A                    2873 00129$:
                           2874 ;src/main.c:558: if(dist > G_ENEMY_H + 7) {
   741A 3E 1D         [ 7] 2875 	ld	a,#0x1D
   741C DD 96 F1      [19] 2876 	sub	a, -15 (ix)
   741F D2 47 79      [10] 2877 	jp	NC,00199$
                           2878 ;src/main.c:559: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7422 DD 7E FA      [19] 2879 	ld	a,-6 (ix)
   7425 C6 18         [ 7] 2880 	add	a, #0x18
   7427 57            [ 4] 2881 	ld	d,a
   7428 D5            [11] 2882 	push	de
   7429 33            [ 6] 2883 	inc	sp
   742A C5            [11] 2884 	push	bc
   742B 33            [ 6] 2885 	inc	sp
   742C 2A D5 63      [16] 2886 	ld	hl,(_mapa)
   742F E5            [11] 2887 	push	hl
   7430 CD 2C 4A      [17] 2888 	call	_getTilePtr
   7433 F1            [10] 2889 	pop	af
   7434 F1            [10] 2890 	pop	af
   7435 4E            [ 7] 2891 	ld	c,(hl)
   7436 3E 02         [ 7] 2892 	ld	a,#0x02
   7438 91            [ 4] 2893 	sub	a, c
   7439 DA 47 79      [10] 2894 	jp	C,00199$
                           2895 ;src/main.c:560: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   743C DD 6E F6      [19] 2896 	ld	l,-10 (ix)
   743F DD 66 F7      [19] 2897 	ld	h,-9 (ix)
   7442 7E            [ 7] 2898 	ld	a,(hl)
   7443 C6 18         [ 7] 2899 	add	a, #0x18
   7445 57            [ 4] 2900 	ld	d,a
   7446 DD 6E F4      [19] 2901 	ld	l,-12 (ix)
   7449 DD 66 F5      [19] 2902 	ld	h,-11 (ix)
   744C 46            [ 7] 2903 	ld	b,(hl)
   744D 04            [ 4] 2904 	inc	b
   744E 04            [ 4] 2905 	inc	b
   744F D5            [11] 2906 	push	de
   7450 33            [ 6] 2907 	inc	sp
   7451 C5            [11] 2908 	push	bc
   7452 33            [ 6] 2909 	inc	sp
   7453 2A D5 63      [16] 2910 	ld	hl,(_mapa)
   7456 E5            [11] 2911 	push	hl
   7457 CD 2C 4A      [17] 2912 	call	_getTilePtr
   745A F1            [10] 2913 	pop	af
   745B F1            [10] 2914 	pop	af
   745C 4E            [ 7] 2915 	ld	c,(hl)
   745D 3E 02         [ 7] 2916 	ld	a,#0x02
   745F 91            [ 4] 2917 	sub	a, c
   7460 DA 47 79      [10] 2918 	jp	C,00199$
                           2919 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7463 DD 6E F6      [19] 2920 	ld	l,-10 (ix)
   7466 DD 66 F7      [19] 2921 	ld	h,-9 (ix)
   7469 7E            [ 7] 2922 	ld	a,(hl)
   746A C6 18         [ 7] 2923 	add	a, #0x18
   746C 47            [ 4] 2924 	ld	b,a
   746D DD 6E F4      [19] 2925 	ld	l,-12 (ix)
   7470 DD 66 F5      [19] 2926 	ld	h,-11 (ix)
   7473 7E            [ 7] 2927 	ld	a,(hl)
   7474 C6 04         [ 7] 2928 	add	a, #0x04
   7476 C5            [11] 2929 	push	bc
   7477 33            [ 6] 2930 	inc	sp
   7478 F5            [11] 2931 	push	af
   7479 33            [ 6] 2932 	inc	sp
   747A 2A D5 63      [16] 2933 	ld	hl,(_mapa)
   747D E5            [11] 2934 	push	hl
   747E CD 2C 4A      [17] 2935 	call	_getTilePtr
   7481 F1            [10] 2936 	pop	af
   7482 F1            [10] 2937 	pop	af
   7483 4E            [ 7] 2938 	ld	c,(hl)
   7484 3E 02         [ 7] 2939 	ld	a,#0x02
   7486 91            [ 4] 2940 	sub	a, c
   7487 DA 47 79      [10] 2941 	jp	C,00199$
                           2942 ;src/main.c:562: moverEnemigoAbajo(enemy);
   748A DD 6E F4      [19] 2943 	ld	l,-12 (ix)
   748D DD 66 F5      [19] 2944 	ld	h,-11 (ix)
   7490 E5            [11] 2945 	push	hl
   7491 CD 5A 6C      [17] 2946 	call	_moverEnemigoAbajo
   7494 F1            [10] 2947 	pop	af
                           2948 ;src/main.c:564: enemy->mover = SI;
   7495 DD 6E F8      [19] 2949 	ld	l,-8 (ix)
   7498 DD 66 F9      [19] 2950 	ld	h,-7 (ix)
   749B 36 01         [10] 2951 	ld	(hl),#0x01
   749D C3 47 79      [10] 2952 	jp	00199$
   74A0                    2953 00192$:
                           2954 ;src/main.c:570: if (!prota.mover) distConstraint = 20; // ajuste en parado
   74A0 3A FE 62      [13] 2955 	ld	a, (#_prota + 6)
   74A3 B7            [ 4] 2956 	or	a, a
   74A4 20 02         [12] 2957 	jr	NZ,00132$
   74A6 0E 14         [ 7] 2958 	ld	c,#0x14
   74A8                    2959 00132$:
                           2960 ;src/main.c:572: if (dist > distConstraint) {
   74A8 79            [ 4] 2961 	ld	a,c
   74A9 DD 96 F1      [19] 2962 	sub	a, -15 (ix)
   74AC D2 47 79      [10] 2963 	jp	NC,00199$
                           2964 ;src/main.c:573: if (dx + 1 < enemy->x) {
   74AF DD 5E 06      [19] 2965 	ld	e,6 (ix)
   74B2 16 00         [ 7] 2966 	ld	d,#0x00
   74B4 13            [ 6] 2967 	inc	de
   74B5 DD 73 FE      [19] 2968 	ld	-2 (ix),e
   74B8 DD 72 FF      [19] 2969 	ld	-1 (ix),d
   74BB DD 70 FC      [19] 2970 	ld	-4 (ix),b
   74BE DD 36 FD 00   [19] 2971 	ld	-3 (ix),#0x00
   74C2 DD 7E FE      [19] 2972 	ld	a,-2 (ix)
   74C5 DD 96 FC      [19] 2973 	sub	a, -4 (ix)
   74C8 DD 7E FF      [19] 2974 	ld	a,-1 (ix)
   74CB DD 9E FD      [19] 2975 	sbc	a, -3 (ix)
   74CE E2 D3 74      [10] 2976 	jp	PO, 00427$
   74D1 EE 80         [ 7] 2977 	xor	a, #0x80
   74D3                    2978 00427$:
   74D3 F2 4F 75      [10] 2979 	jp	P,00144$
                           2980 ;src/main.c:574: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   74D6 DD 7E FA      [19] 2981 	ld	a,-6 (ix)
   74D9 F5            [11] 2982 	push	af
   74DA 33            [ 6] 2983 	inc	sp
   74DB C5            [11] 2984 	push	bc
   74DC 33            [ 6] 2985 	inc	sp
   74DD 2A D5 63      [16] 2986 	ld	hl,(_mapa)
   74E0 E5            [11] 2987 	push	hl
   74E1 CD 2C 4A      [17] 2988 	call	_getTilePtr
   74E4 F1            [10] 2989 	pop	af
   74E5 F1            [10] 2990 	pop	af
   74E6 4E            [ 7] 2991 	ld	c,(hl)
   74E7 3E 02         [ 7] 2992 	ld	a,#0x02
   74E9 91            [ 4] 2993 	sub	a, c
   74EA DA DC 75      [10] 2994 	jp	C,00145$
                           2995 ;src/main.c:575: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   74ED DD 6E F6      [19] 2996 	ld	l,-10 (ix)
   74F0 DD 66 F7      [19] 2997 	ld	h,-9 (ix)
   74F3 7E            [ 7] 2998 	ld	a,(hl)
   74F4 C6 0B         [ 7] 2999 	add	a, #0x0B
   74F6 DD 6E F4      [19] 3000 	ld	l,-12 (ix)
   74F9 DD 66 F5      [19] 3001 	ld	h,-11 (ix)
   74FC 46            [ 7] 3002 	ld	b,(hl)
   74FD F5            [11] 3003 	push	af
   74FE 33            [ 6] 3004 	inc	sp
   74FF C5            [11] 3005 	push	bc
   7500 33            [ 6] 3006 	inc	sp
   7501 2A D5 63      [16] 3007 	ld	hl,(_mapa)
   7504 E5            [11] 3008 	push	hl
   7505 CD 2C 4A      [17] 3009 	call	_getTilePtr
   7508 F1            [10] 3010 	pop	af
   7509 F1            [10] 3011 	pop	af
   750A 4E            [ 7] 3012 	ld	c,(hl)
   750B 3E 02         [ 7] 3013 	ld	a,#0x02
   750D 91            [ 4] 3014 	sub	a, c
   750E DA DC 75      [10] 3015 	jp	C,00145$
                           3016 ;src/main.c:576: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7511 DD 6E F6      [19] 3017 	ld	l,-10 (ix)
   7514 DD 66 F7      [19] 3018 	ld	h,-9 (ix)
   7517 7E            [ 7] 3019 	ld	a,(hl)
   7518 C6 16         [ 7] 3020 	add	a, #0x16
   751A DD 6E F4      [19] 3021 	ld	l,-12 (ix)
   751D DD 66 F5      [19] 3022 	ld	h,-11 (ix)
   7520 46            [ 7] 3023 	ld	b,(hl)
   7521 F5            [11] 3024 	push	af
   7522 33            [ 6] 3025 	inc	sp
   7523 C5            [11] 3026 	push	bc
   7524 33            [ 6] 3027 	inc	sp
   7525 2A D5 63      [16] 3028 	ld	hl,(_mapa)
   7528 E5            [11] 3029 	push	hl
   7529 CD 2C 4A      [17] 3030 	call	_getTilePtr
   752C F1            [10] 3031 	pop	af
   752D F1            [10] 3032 	pop	af
   752E 4E            [ 7] 3033 	ld	c,(hl)
   752F 3E 02         [ 7] 3034 	ld	a,#0x02
   7531 91            [ 4] 3035 	sub	a, c
   7532 DA DC 75      [10] 3036 	jp	C,00145$
                           3037 ;src/main.c:577: moverEnemigoIzquierda(enemy);
   7535 DD 6E F4      [19] 3038 	ld	l,-12 (ix)
   7538 DD 66 F5      [19] 3039 	ld	h,-11 (ix)
   753B E5            [11] 3040 	push	hl
   753C CD 89 6C      [17] 3041 	call	_moverEnemigoIzquierda
   753F F1            [10] 3042 	pop	af
                           3043 ;src/main.c:578: movX = 1;
   7540 DD 36 F3 01   [19] 3044 	ld	-13 (ix),#0x01
                           3045 ;src/main.c:579: enemy->mover = SI;
   7544 DD 6E F8      [19] 3046 	ld	l,-8 (ix)
   7547 DD 66 F9      [19] 3047 	ld	h,-7 (ix)
   754A 36 01         [10] 3048 	ld	(hl),#0x01
   754C C3 DC 75      [10] 3049 	jp	00145$
   754F                    3050 00144$:
                           3051 ;src/main.c:581: } else if (dx + 1 > enemy->x){
   754F DD 7E FC      [19] 3052 	ld	a,-4 (ix)
   7552 DD 96 FE      [19] 3053 	sub	a, -2 (ix)
   7555 DD 7E FD      [19] 3054 	ld	a,-3 (ix)
   7558 DD 9E FF      [19] 3055 	sbc	a, -1 (ix)
   755B E2 60 75      [10] 3056 	jp	PO, 00428$
   755E EE 80         [ 7] 3057 	xor	a, #0x80
   7560                    3058 00428$:
   7560 F2 DC 75      [10] 3059 	jp	P,00145$
                           3060 ;src/main.c:582: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7563 DD 66 FA      [19] 3061 	ld	h,-6 (ix)
   7566 DD 6E FB      [19] 3062 	ld	l,-5 (ix)
   7569 E5            [11] 3063 	push	hl
   756A 2A D5 63      [16] 3064 	ld	hl,(_mapa)
   756D E5            [11] 3065 	push	hl
   756E CD 2C 4A      [17] 3066 	call	_getTilePtr
   7571 F1            [10] 3067 	pop	af
   7572 F1            [10] 3068 	pop	af
   7573 4E            [ 7] 3069 	ld	c,(hl)
   7574 3E 02         [ 7] 3070 	ld	a,#0x02
   7576 91            [ 4] 3071 	sub	a, c
   7577 38 63         [12] 3072 	jr	C,00145$
                           3073 ;src/main.c:583: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7579 DD 6E F6      [19] 3074 	ld	l,-10 (ix)
   757C DD 66 F7      [19] 3075 	ld	h,-9 (ix)
   757F 7E            [ 7] 3076 	ld	a,(hl)
   7580 C6 0B         [ 7] 3077 	add	a, #0x0B
   7582 47            [ 4] 3078 	ld	b,a
   7583 DD 6E F4      [19] 3079 	ld	l,-12 (ix)
   7586 DD 66 F5      [19] 3080 	ld	h,-11 (ix)
   7589 7E            [ 7] 3081 	ld	a,(hl)
   758A C6 04         [ 7] 3082 	add	a, #0x04
   758C C5            [11] 3083 	push	bc
   758D 33            [ 6] 3084 	inc	sp
   758E F5            [11] 3085 	push	af
   758F 33            [ 6] 3086 	inc	sp
   7590 2A D5 63      [16] 3087 	ld	hl,(_mapa)
   7593 E5            [11] 3088 	push	hl
   7594 CD 2C 4A      [17] 3089 	call	_getTilePtr
   7597 F1            [10] 3090 	pop	af
   7598 F1            [10] 3091 	pop	af
   7599 4E            [ 7] 3092 	ld	c,(hl)
   759A 3E 02         [ 7] 3093 	ld	a,#0x02
   759C 91            [ 4] 3094 	sub	a, c
   759D 38 3D         [12] 3095 	jr	C,00145$
                           3096 ;src/main.c:584: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   759F DD 6E F6      [19] 3097 	ld	l,-10 (ix)
   75A2 DD 66 F7      [19] 3098 	ld	h,-9 (ix)
   75A5 7E            [ 7] 3099 	ld	a,(hl)
   75A6 C6 16         [ 7] 3100 	add	a, #0x16
   75A8 47            [ 4] 3101 	ld	b,a
   75A9 DD 6E F4      [19] 3102 	ld	l,-12 (ix)
   75AC DD 66 F5      [19] 3103 	ld	h,-11 (ix)
   75AF 7E            [ 7] 3104 	ld	a,(hl)
   75B0 C6 04         [ 7] 3105 	add	a, #0x04
   75B2 C5            [11] 3106 	push	bc
   75B3 33            [ 6] 3107 	inc	sp
   75B4 F5            [11] 3108 	push	af
   75B5 33            [ 6] 3109 	inc	sp
   75B6 2A D5 63      [16] 3110 	ld	hl,(_mapa)
   75B9 E5            [11] 3111 	push	hl
   75BA CD 2C 4A      [17] 3112 	call	_getTilePtr
   75BD F1            [10] 3113 	pop	af
   75BE F1            [10] 3114 	pop	af
   75BF 4E            [ 7] 3115 	ld	c,(hl)
   75C0 3E 02         [ 7] 3116 	ld	a,#0x02
   75C2 91            [ 4] 3117 	sub	a, c
   75C3 38 17         [12] 3118 	jr	C,00145$
                           3119 ;src/main.c:585: moverEnemigoDerecha(enemy);
   75C5 DD 6E F4      [19] 3120 	ld	l,-12 (ix)
   75C8 DD 66 F5      [19] 3121 	ld	h,-11 (ix)
   75CB E5            [11] 3122 	push	hl
   75CC CD 79 6C      [17] 3123 	call	_moverEnemigoDerecha
   75CF F1            [10] 3124 	pop	af
                           3125 ;src/main.c:586: movX = 1;
   75D0 DD 36 F3 01   [19] 3126 	ld	-13 (ix),#0x01
                           3127 ;src/main.c:587: enemy->mover = SI;
   75D4 DD 6E F8      [19] 3128 	ld	l,-8 (ix)
   75D7 DD 66 F9      [19] 3129 	ld	h,-7 (ix)
   75DA 36 01         [10] 3130 	ld	(hl),#0x01
   75DC                    3131 00145$:
                           3132 ;src/main.c:590: if (dy < enemy->y) {
   75DC DD 6E F6      [19] 3133 	ld	l,-10 (ix)
   75DF DD 66 F7      [19] 3134 	ld	h,-9 (ix)
   75E2 4E            [ 7] 3135 	ld	c,(hl)
                           3136 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75E3 DD 6E F4      [19] 3137 	ld	l,-12 (ix)
   75E6 DD 66 F5      [19] 3138 	ld	h,-11 (ix)
   75E9 46            [ 7] 3139 	ld	b,(hl)
                           3140 ;src/main.c:590: if (dy < enemy->y) {
   75EA DD 7E 07      [19] 3141 	ld	a,7 (ix)
   75ED 91            [ 4] 3142 	sub	a, c
   75EE D2 6E 76      [10] 3143 	jp	NC,00155$
                           3144 ;src/main.c:591: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75F1 51            [ 4] 3145 	ld	d,c
   75F2 15            [ 4] 3146 	dec	d
   75F3 15            [ 4] 3147 	dec	d
   75F4 D5            [11] 3148 	push	de
   75F5 33            [ 6] 3149 	inc	sp
   75F6 C5            [11] 3150 	push	bc
   75F7 33            [ 6] 3151 	inc	sp
   75F8 2A D5 63      [16] 3152 	ld	hl,(_mapa)
   75FB E5            [11] 3153 	push	hl
   75FC CD 2C 4A      [17] 3154 	call	_getTilePtr
   75FF F1            [10] 3155 	pop	af
   7600 F1            [10] 3156 	pop	af
   7601 4E            [ 7] 3157 	ld	c,(hl)
   7602 3E 02         [ 7] 3158 	ld	a,#0x02
   7604 91            [ 4] 3159 	sub	a, c
   7605 DA E8 76      [10] 3160 	jp	C,00156$
                           3161 ;src/main.c:592: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7608 DD 6E F6      [19] 3162 	ld	l,-10 (ix)
   760B DD 66 F7      [19] 3163 	ld	h,-9 (ix)
   760E 56            [ 7] 3164 	ld	d,(hl)
   760F 15            [ 4] 3165 	dec	d
   7610 15            [ 4] 3166 	dec	d
   7611 DD 6E F4      [19] 3167 	ld	l,-12 (ix)
   7614 DD 66 F5      [19] 3168 	ld	h,-11 (ix)
   7617 46            [ 7] 3169 	ld	b,(hl)
   7618 04            [ 4] 3170 	inc	b
   7619 04            [ 4] 3171 	inc	b
   761A D5            [11] 3172 	push	de
   761B 33            [ 6] 3173 	inc	sp
   761C C5            [11] 3174 	push	bc
   761D 33            [ 6] 3175 	inc	sp
   761E 2A D5 63      [16] 3176 	ld	hl,(_mapa)
   7621 E5            [11] 3177 	push	hl
   7622 CD 2C 4A      [17] 3178 	call	_getTilePtr
   7625 F1            [10] 3179 	pop	af
   7626 F1            [10] 3180 	pop	af
   7627 4E            [ 7] 3181 	ld	c,(hl)
   7628 3E 02         [ 7] 3182 	ld	a,#0x02
   762A 91            [ 4] 3183 	sub	a, c
   762B DA E8 76      [10] 3184 	jp	C,00156$
                           3185 ;src/main.c:593: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   762E DD 6E F6      [19] 3186 	ld	l,-10 (ix)
   7631 DD 66 F7      [19] 3187 	ld	h,-9 (ix)
   7634 46            [ 7] 3188 	ld	b,(hl)
   7635 05            [ 4] 3189 	dec	b
   7636 05            [ 4] 3190 	dec	b
   7637 DD 6E F4      [19] 3191 	ld	l,-12 (ix)
   763A DD 66 F5      [19] 3192 	ld	h,-11 (ix)
   763D 7E            [ 7] 3193 	ld	a,(hl)
   763E C6 04         [ 7] 3194 	add	a, #0x04
   7640 C5            [11] 3195 	push	bc
   7641 33            [ 6] 3196 	inc	sp
   7642 F5            [11] 3197 	push	af
   7643 33            [ 6] 3198 	inc	sp
   7644 2A D5 63      [16] 3199 	ld	hl,(_mapa)
   7647 E5            [11] 3200 	push	hl
   7648 CD 2C 4A      [17] 3201 	call	_getTilePtr
   764B F1            [10] 3202 	pop	af
   764C F1            [10] 3203 	pop	af
   764D 4E            [ 7] 3204 	ld	c,(hl)
   764E 3E 02         [ 7] 3205 	ld	a,#0x02
   7650 91            [ 4] 3206 	sub	a, c
   7651 DA E8 76      [10] 3207 	jp	C,00156$
                           3208 ;src/main.c:594: moverEnemigoArriba(enemy);
   7654 DD 6E F4      [19] 3209 	ld	l,-12 (ix)
   7657 DD 66 F5      [19] 3210 	ld	h,-11 (ix)
   765A E5            [11] 3211 	push	hl
   765B CD 3B 6C      [17] 3212 	call	_moverEnemigoArriba
   765E F1            [10] 3213 	pop	af
                           3214 ;src/main.c:595: movY = 1;
   765F DD 36 F2 01   [19] 3215 	ld	-14 (ix),#0x01
                           3216 ;src/main.c:596: enemy->mover = SI;
   7663 DD 6E F8      [19] 3217 	ld	l,-8 (ix)
   7666 DD 66 F9      [19] 3218 	ld	h,-7 (ix)
   7669 36 01         [10] 3219 	ld	(hl),#0x01
   766B C3 E8 76      [10] 3220 	jp	00156$
   766E                    3221 00155$:
                           3222 ;src/main.c:599: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   766E 79            [ 4] 3223 	ld	a,c
   766F C6 18         [ 7] 3224 	add	a, #0x18
   7671 57            [ 4] 3225 	ld	d,a
   7672 D5            [11] 3226 	push	de
   7673 33            [ 6] 3227 	inc	sp
   7674 C5            [11] 3228 	push	bc
   7675 33            [ 6] 3229 	inc	sp
   7676 2A D5 63      [16] 3230 	ld	hl,(_mapa)
   7679 E5            [11] 3231 	push	hl
   767A CD 2C 4A      [17] 3232 	call	_getTilePtr
   767D F1            [10] 3233 	pop	af
   767E F1            [10] 3234 	pop	af
   767F 4E            [ 7] 3235 	ld	c,(hl)
   7680 3E 02         [ 7] 3236 	ld	a,#0x02
   7682 91            [ 4] 3237 	sub	a, c
   7683 38 63         [12] 3238 	jr	C,00156$
                           3239 ;src/main.c:600: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7685 DD 6E F6      [19] 3240 	ld	l,-10 (ix)
   7688 DD 66 F7      [19] 3241 	ld	h,-9 (ix)
   768B 7E            [ 7] 3242 	ld	a,(hl)
   768C C6 18         [ 7] 3243 	add	a, #0x18
   768E 57            [ 4] 3244 	ld	d,a
   768F DD 6E F4      [19] 3245 	ld	l,-12 (ix)
   7692 DD 66 F5      [19] 3246 	ld	h,-11 (ix)
   7695 46            [ 7] 3247 	ld	b,(hl)
   7696 04            [ 4] 3248 	inc	b
   7697 04            [ 4] 3249 	inc	b
   7698 D5            [11] 3250 	push	de
   7699 33            [ 6] 3251 	inc	sp
   769A C5            [11] 3252 	push	bc
   769B 33            [ 6] 3253 	inc	sp
   769C 2A D5 63      [16] 3254 	ld	hl,(_mapa)
   769F E5            [11] 3255 	push	hl
   76A0 CD 2C 4A      [17] 3256 	call	_getTilePtr
   76A3 F1            [10] 3257 	pop	af
   76A4 F1            [10] 3258 	pop	af
   76A5 4E            [ 7] 3259 	ld	c,(hl)
   76A6 3E 02         [ 7] 3260 	ld	a,#0x02
   76A8 91            [ 4] 3261 	sub	a, c
   76A9 38 3D         [12] 3262 	jr	C,00156$
                           3263 ;src/main.c:601: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76AB DD 6E F6      [19] 3264 	ld	l,-10 (ix)
   76AE DD 66 F7      [19] 3265 	ld	h,-9 (ix)
   76B1 7E            [ 7] 3266 	ld	a,(hl)
   76B2 C6 18         [ 7] 3267 	add	a, #0x18
   76B4 47            [ 4] 3268 	ld	b,a
   76B5 DD 6E F4      [19] 3269 	ld	l,-12 (ix)
   76B8 DD 66 F5      [19] 3270 	ld	h,-11 (ix)
   76BB 7E            [ 7] 3271 	ld	a,(hl)
   76BC C6 04         [ 7] 3272 	add	a, #0x04
   76BE C5            [11] 3273 	push	bc
   76BF 33            [ 6] 3274 	inc	sp
   76C0 F5            [11] 3275 	push	af
   76C1 33            [ 6] 3276 	inc	sp
   76C2 2A D5 63      [16] 3277 	ld	hl,(_mapa)
   76C5 E5            [11] 3278 	push	hl
   76C6 CD 2C 4A      [17] 3279 	call	_getTilePtr
   76C9 F1            [10] 3280 	pop	af
   76CA F1            [10] 3281 	pop	af
   76CB 4E            [ 7] 3282 	ld	c,(hl)
   76CC 3E 02         [ 7] 3283 	ld	a,#0x02
   76CE 91            [ 4] 3284 	sub	a, c
   76CF 38 17         [12] 3285 	jr	C,00156$
                           3286 ;src/main.c:602: moverEnemigoAbajo(enemy);
   76D1 DD 6E F4      [19] 3287 	ld	l,-12 (ix)
   76D4 DD 66 F5      [19] 3288 	ld	h,-11 (ix)
   76D7 E5            [11] 3289 	push	hl
   76D8 CD 5A 6C      [17] 3290 	call	_moverEnemigoAbajo
   76DB F1            [10] 3291 	pop	af
                           3292 ;src/main.c:603: movY = 1;
   76DC DD 36 F2 01   [19] 3293 	ld	-14 (ix),#0x01
                           3294 ;src/main.c:604: enemy->mover = SI;
   76E0 DD 6E F8      [19] 3295 	ld	l,-8 (ix)
   76E3 DD 66 F9      [19] 3296 	ld	h,-7 (ix)
   76E6 36 01         [10] 3297 	ld	(hl),#0x01
   76E8                    3298 00156$:
                           3299 ;src/main.c:607: if (!enemy->mover) {
   76E8 DD 6E F8      [19] 3300 	ld	l,-8 (ix)
   76EB DD 66 F9      [19] 3301 	ld	h,-7 (ix)
   76EE 7E            [ 7] 3302 	ld	a,(hl)
   76EF B7            [ 4] 3303 	or	a, a
   76F0 C2 47 79      [10] 3304 	jp	NZ,00199$
                           3305 ;src/main.c:608: if (!movX) {
   76F3 DD 7E F3      [19] 3306 	ld	a,-13 (ix)
   76F6 B7            [ 4] 3307 	or	a, a
   76F7 C2 20 78      [10] 3308 	jp	NZ,00171$
                           3309 ;src/main.c:609: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76FA DD 6E F6      [19] 3310 	ld	l,-10 (ix)
   76FD DD 66 F7      [19] 3311 	ld	h,-9 (ix)
   7700 5E            [ 7] 3312 	ld	e,(hl)
                           3313 ;src/main.c:514: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7701 DD 6E F4      [19] 3314 	ld	l,-12 (ix)
   7704 DD 66 F5      [19] 3315 	ld	h,-11 (ix)
   7707 4E            [ 7] 3316 	ld	c,(hl)
                           3317 ;src/main.c:609: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7708 3E 70         [ 7] 3318 	ld	a,#0x70
   770A 93            [ 4] 3319 	sub	a, e
   770B D2 9B 77      [10] 3320 	jp	NC,00168$
                           3321 ;src/main.c:610: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   770E 7B            [ 4] 3322 	ld	a,e
   770F C6 18         [ 7] 3323 	add	a, #0x18
   7711 47            [ 4] 3324 	ld	b,a
   7712 C5            [11] 3325 	push	bc
   7713 2A D5 63      [16] 3326 	ld	hl,(_mapa)
   7716 E5            [11] 3327 	push	hl
   7717 CD 2C 4A      [17] 3328 	call	_getTilePtr
   771A F1            [10] 3329 	pop	af
   771B F1            [10] 3330 	pop	af
   771C 4E            [ 7] 3331 	ld	c,(hl)
   771D 3E 02         [ 7] 3332 	ld	a,#0x02
   771F 91            [ 4] 3333 	sub	a, c
   7720 38 63         [12] 3334 	jr	C,00158$
                           3335 ;src/main.c:611: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7722 DD 6E F6      [19] 3336 	ld	l,-10 (ix)
   7725 DD 66 F7      [19] 3337 	ld	h,-9 (ix)
   7728 7E            [ 7] 3338 	ld	a,(hl)
   7729 C6 18         [ 7] 3339 	add	a, #0x18
   772B 57            [ 4] 3340 	ld	d,a
   772C DD 6E F4      [19] 3341 	ld	l,-12 (ix)
   772F DD 66 F5      [19] 3342 	ld	h,-11 (ix)
   7732 4E            [ 7] 3343 	ld	c,(hl)
   7733 41            [ 4] 3344 	ld	b,c
   7734 04            [ 4] 3345 	inc	b
   7735 04            [ 4] 3346 	inc	b
   7736 D5            [11] 3347 	push	de
   7737 33            [ 6] 3348 	inc	sp
   7738 C5            [11] 3349 	push	bc
   7739 33            [ 6] 3350 	inc	sp
   773A 2A D5 63      [16] 3351 	ld	hl,(_mapa)
   773D E5            [11] 3352 	push	hl
   773E CD 2C 4A      [17] 3353 	call	_getTilePtr
   7741 F1            [10] 3354 	pop	af
   7742 F1            [10] 3355 	pop	af
   7743 4E            [ 7] 3356 	ld	c,(hl)
   7744 3E 02         [ 7] 3357 	ld	a,#0x02
   7746 91            [ 4] 3358 	sub	a, c
   7747 38 3C         [12] 3359 	jr	C,00158$
                           3360 ;src/main.c:612: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7749 DD 6E F6      [19] 3361 	ld	l,-10 (ix)
   774C DD 66 F7      [19] 3362 	ld	h,-9 (ix)
   774F 7E            [ 7] 3363 	ld	a,(hl)
   7750 C6 18         [ 7] 3364 	add	a, #0x18
   7752 47            [ 4] 3365 	ld	b,a
   7753 DD 6E F4      [19] 3366 	ld	l,-12 (ix)
   7756 DD 66 F5      [19] 3367 	ld	h,-11 (ix)
   7759 7E            [ 7] 3368 	ld	a,(hl)
   775A C6 04         [ 7] 3369 	add	a, #0x04
   775C C5            [11] 3370 	push	bc
   775D 33            [ 6] 3371 	inc	sp
   775E F5            [11] 3372 	push	af
   775F 33            [ 6] 3373 	inc	sp
   7760 2A D5 63      [16] 3374 	ld	hl,(_mapa)
   7763 E5            [11] 3375 	push	hl
   7764 CD 2C 4A      [17] 3376 	call	_getTilePtr
   7767 F1            [10] 3377 	pop	af
   7768 F1            [10] 3378 	pop	af
   7769 4E            [ 7] 3379 	ld	c,(hl)
   776A 3E 02         [ 7] 3380 	ld	a,#0x02
   776C 91            [ 4] 3381 	sub	a, c
   776D 38 16         [12] 3382 	jr	C,00158$
                           3383 ;src/main.c:613: moverEnemigoAbajo(enemy);
   776F DD 6E F4      [19] 3384 	ld	l,-12 (ix)
   7772 DD 66 F5      [19] 3385 	ld	h,-11 (ix)
   7775 E5            [11] 3386 	push	hl
   7776 CD 5A 6C      [17] 3387 	call	_moverEnemigoAbajo
   7779 F1            [10] 3388 	pop	af
                           3389 ;src/main.c:614: enemy->mover = SI;
   777A DD 6E F8      [19] 3390 	ld	l,-8 (ix)
   777D DD 66 F9      [19] 3391 	ld	h,-7 (ix)
   7780 36 01         [10] 3392 	ld	(hl),#0x01
   7782 C3 20 78      [10] 3393 	jp	00171$
   7785                    3394 00158$:
                           3395 ;src/main.c:616: moverEnemigoArriba(enemy);
   7785 DD 6E F4      [19] 3396 	ld	l,-12 (ix)
   7788 DD 66 F5      [19] 3397 	ld	h,-11 (ix)
   778B E5            [11] 3398 	push	hl
   778C CD 3B 6C      [17] 3399 	call	_moverEnemigoArriba
   778F F1            [10] 3400 	pop	af
                           3401 ;src/main.c:617: enemy->mover = SI;
   7790 DD 6E F8      [19] 3402 	ld	l,-8 (ix)
   7793 DD 66 F9      [19] 3403 	ld	h,-7 (ix)
   7796 36 01         [10] 3404 	ld	(hl),#0x01
   7798 C3 20 78      [10] 3405 	jp	00171$
   779B                    3406 00168$:
                           3407 ;src/main.c:620: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   779B 43            [ 4] 3408 	ld	b,e
   779C 05            [ 4] 3409 	dec	b
   779D 05            [ 4] 3410 	dec	b
   779E C5            [11] 3411 	push	bc
   779F 2A D5 63      [16] 3412 	ld	hl,(_mapa)
   77A2 E5            [11] 3413 	push	hl
   77A3 CD 2C 4A      [17] 3414 	call	_getTilePtr
   77A6 F1            [10] 3415 	pop	af
   77A7 F1            [10] 3416 	pop	af
   77A8 4E            [ 7] 3417 	ld	c,(hl)
   77A9 3E 02         [ 7] 3418 	ld	a,#0x02
   77AB 91            [ 4] 3419 	sub	a, c
   77AC 38 5F         [12] 3420 	jr	C,00163$
                           3421 ;src/main.c:621: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   77AE DD 6E F6      [19] 3422 	ld	l,-10 (ix)
   77B1 DD 66 F7      [19] 3423 	ld	h,-9 (ix)
   77B4 56            [ 7] 3424 	ld	d,(hl)
   77B5 15            [ 4] 3425 	dec	d
   77B6 15            [ 4] 3426 	dec	d
   77B7 DD 6E F4      [19] 3427 	ld	l,-12 (ix)
   77BA DD 66 F5      [19] 3428 	ld	h,-11 (ix)
   77BD 46            [ 7] 3429 	ld	b,(hl)
   77BE 04            [ 4] 3430 	inc	b
   77BF 04            [ 4] 3431 	inc	b
   77C0 D5            [11] 3432 	push	de
   77C1 33            [ 6] 3433 	inc	sp
   77C2 C5            [11] 3434 	push	bc
   77C3 33            [ 6] 3435 	inc	sp
   77C4 2A D5 63      [16] 3436 	ld	hl,(_mapa)
   77C7 E5            [11] 3437 	push	hl
   77C8 CD 2C 4A      [17] 3438 	call	_getTilePtr
   77CB F1            [10] 3439 	pop	af
   77CC F1            [10] 3440 	pop	af
   77CD 4E            [ 7] 3441 	ld	c,(hl)
   77CE 3E 02         [ 7] 3442 	ld	a,#0x02
   77D0 91            [ 4] 3443 	sub	a, c
   77D1 38 3A         [12] 3444 	jr	C,00163$
                           3445 ;src/main.c:622: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   77D3 DD 6E F6      [19] 3446 	ld	l,-10 (ix)
   77D6 DD 66 F7      [19] 3447 	ld	h,-9 (ix)
   77D9 46            [ 7] 3448 	ld	b,(hl)
   77DA 05            [ 4] 3449 	dec	b
   77DB 05            [ 4] 3450 	dec	b
   77DC DD 6E F4      [19] 3451 	ld	l,-12 (ix)
   77DF DD 66 F5      [19] 3452 	ld	h,-11 (ix)
   77E2 7E            [ 7] 3453 	ld	a,(hl)
   77E3 C6 04         [ 7] 3454 	add	a, #0x04
   77E5 C5            [11] 3455 	push	bc
   77E6 33            [ 6] 3456 	inc	sp
   77E7 F5            [11] 3457 	push	af
   77E8 33            [ 6] 3458 	inc	sp
   77E9 2A D5 63      [16] 3459 	ld	hl,(_mapa)
   77EC E5            [11] 3460 	push	hl
   77ED CD 2C 4A      [17] 3461 	call	_getTilePtr
   77F0 F1            [10] 3462 	pop	af
   77F1 F1            [10] 3463 	pop	af
   77F2 4E            [ 7] 3464 	ld	c,(hl)
   77F3 3E 02         [ 7] 3465 	ld	a,#0x02
   77F5 91            [ 4] 3466 	sub	a, c
   77F6 38 15         [12] 3467 	jr	C,00163$
                           3468 ;src/main.c:623: moverEnemigoArriba(enemy);
   77F8 DD 6E F4      [19] 3469 	ld	l,-12 (ix)
   77FB DD 66 F5      [19] 3470 	ld	h,-11 (ix)
   77FE E5            [11] 3471 	push	hl
   77FF CD 3B 6C      [17] 3472 	call	_moverEnemigoArriba
   7802 F1            [10] 3473 	pop	af
                           3474 ;src/main.c:624: enemy->mover = SI;
   7803 DD 6E F8      [19] 3475 	ld	l,-8 (ix)
   7806 DD 66 F9      [19] 3476 	ld	h,-7 (ix)
   7809 36 01         [10] 3477 	ld	(hl),#0x01
   780B 18 13         [12] 3478 	jr	00171$
   780D                    3479 00163$:
                           3480 ;src/main.c:626: moverEnemigoAbajo(enemy);
   780D DD 6E F4      [19] 3481 	ld	l,-12 (ix)
   7810 DD 66 F5      [19] 3482 	ld	h,-11 (ix)
   7813 E5            [11] 3483 	push	hl
   7814 CD 5A 6C      [17] 3484 	call	_moverEnemigoAbajo
   7817 F1            [10] 3485 	pop	af
                           3486 ;src/main.c:627: enemy->mover = SI;
   7818 DD 6E F8      [19] 3487 	ld	l,-8 (ix)
   781B DD 66 F9      [19] 3488 	ld	h,-7 (ix)
   781E 36 01         [10] 3489 	ld	(hl),#0x01
   7820                    3490 00171$:
                           3491 ;src/main.c:632: if (!movY) {
   7820 DD 7E F2      [19] 3492 	ld	a,-14 (ix)
   7823 B7            [ 4] 3493 	or	a, a
   7824 C2 47 79      [10] 3494 	jp	NZ,00199$
                           3495 ;src/main.c:633: if (enemy->x < ANCHO_PANTALLA/2) {
   7827 DD 6E F4      [19] 3496 	ld	l,-12 (ix)
   782A DD 66 F5      [19] 3497 	ld	h,-11 (ix)
   782D 4E            [ 7] 3498 	ld	c,(hl)
                           3499 ;src/main.c:515: u8 dify = abs(enemy->y - prota.y);
   782E DD 6E F6      [19] 3500 	ld	l,-10 (ix)
   7831 DD 66 F7      [19] 3501 	ld	h,-9 (ix)
   7834 46            [ 7] 3502 	ld	b,(hl)
                           3503 ;src/main.c:633: if (enemy->x < ANCHO_PANTALLA/2) {
   7835 79            [ 4] 3504 	ld	a,c
   7836 D6 28         [ 7] 3505 	sub	a, #0x28
   7838 D2 BD 78      [10] 3506 	jp	NC,00183$
                           3507 ;src/main.c:634: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   783B C5            [11] 3508 	push	bc
   783C 2A D5 63      [16] 3509 	ld	hl,(_mapa)
   783F E5            [11] 3510 	push	hl
   7840 CD 2C 4A      [17] 3511 	call	_getTilePtr
   7843 F1            [10] 3512 	pop	af
   7844 F1            [10] 3513 	pop	af
   7845 4E            [ 7] 3514 	ld	c,(hl)
   7846 3E 02         [ 7] 3515 	ld	a,#0x02
   7848 91            [ 4] 3516 	sub	a, c
   7849 38 5C         [12] 3517 	jr	C,00173$
                           3518 ;src/main.c:635: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   784B DD 6E F6      [19] 3519 	ld	l,-10 (ix)
   784E DD 66 F7      [19] 3520 	ld	h,-9 (ix)
   7851 7E            [ 7] 3521 	ld	a,(hl)
   7852 C6 0B         [ 7] 3522 	add	a, #0x0B
   7854 DD 6E F4      [19] 3523 	ld	l,-12 (ix)
   7857 DD 66 F5      [19] 3524 	ld	h,-11 (ix)
   785A 46            [ 7] 3525 	ld	b,(hl)
   785B F5            [11] 3526 	push	af
   785C 33            [ 6] 3527 	inc	sp
   785D C5            [11] 3528 	push	bc
   785E 33            [ 6] 3529 	inc	sp
   785F 2A D5 63      [16] 3530 	ld	hl,(_mapa)
   7862 E5            [11] 3531 	push	hl
   7863 CD 2C 4A      [17] 3532 	call	_getTilePtr
   7866 F1            [10] 3533 	pop	af
   7867 F1            [10] 3534 	pop	af
   7868 4E            [ 7] 3535 	ld	c,(hl)
   7869 3E 02         [ 7] 3536 	ld	a,#0x02
   786B 91            [ 4] 3537 	sub	a, c
   786C 38 39         [12] 3538 	jr	C,00173$
                           3539 ;src/main.c:636: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   786E DD 6E F6      [19] 3540 	ld	l,-10 (ix)
   7871 DD 66 F7      [19] 3541 	ld	h,-9 (ix)
   7874 7E            [ 7] 3542 	ld	a,(hl)
   7875 C6 16         [ 7] 3543 	add	a, #0x16
   7877 DD 6E F4      [19] 3544 	ld	l,-12 (ix)
   787A DD 66 F5      [19] 3545 	ld	h,-11 (ix)
   787D 46            [ 7] 3546 	ld	b,(hl)
   787E F5            [11] 3547 	push	af
   787F 33            [ 6] 3548 	inc	sp
   7880 C5            [11] 3549 	push	bc
   7881 33            [ 6] 3550 	inc	sp
   7882 2A D5 63      [16] 3551 	ld	hl,(_mapa)
   7885 E5            [11] 3552 	push	hl
   7886 CD 2C 4A      [17] 3553 	call	_getTilePtr
   7889 F1            [10] 3554 	pop	af
   788A F1            [10] 3555 	pop	af
   788B 4E            [ 7] 3556 	ld	c,(hl)
   788C 3E 02         [ 7] 3557 	ld	a,#0x02
   788E 91            [ 4] 3558 	sub	a, c
   788F 38 16         [12] 3559 	jr	C,00173$
                           3560 ;src/main.c:637: moverEnemigoIzquierda(enemy);
   7891 DD 6E F4      [19] 3561 	ld	l,-12 (ix)
   7894 DD 66 F5      [19] 3562 	ld	h,-11 (ix)
   7897 E5            [11] 3563 	push	hl
   7898 CD 89 6C      [17] 3564 	call	_moverEnemigoIzquierda
   789B F1            [10] 3565 	pop	af
                           3566 ;src/main.c:638: enemy->mover = SI;
   789C DD 6E F8      [19] 3567 	ld	l,-8 (ix)
   789F DD 66 F9      [19] 3568 	ld	h,-7 (ix)
   78A2 36 01         [10] 3569 	ld	(hl),#0x01
   78A4 C3 47 79      [10] 3570 	jp	00199$
   78A7                    3571 00173$:
                           3572 ;src/main.c:640: moverEnemigoDerecha(enemy);
   78A7 DD 6E F4      [19] 3573 	ld	l,-12 (ix)
   78AA DD 66 F5      [19] 3574 	ld	h,-11 (ix)
   78AD E5            [11] 3575 	push	hl
   78AE CD 79 6C      [17] 3576 	call	_moverEnemigoDerecha
   78B1 F1            [10] 3577 	pop	af
                           3578 ;src/main.c:641: enemy->mover = SI;
   78B2 DD 6E F8      [19] 3579 	ld	l,-8 (ix)
   78B5 DD 66 F9      [19] 3580 	ld	h,-7 (ix)
   78B8 36 01         [10] 3581 	ld	(hl),#0x01
   78BA C3 47 79      [10] 3582 	jp	00199$
   78BD                    3583 00183$:
                           3584 ;src/main.c:644: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   78BD 79            [ 4] 3585 	ld	a,c
   78BE C6 04         [ 7] 3586 	add	a, #0x04
   78C0 C5            [11] 3587 	push	bc
   78C1 33            [ 6] 3588 	inc	sp
   78C2 F5            [11] 3589 	push	af
   78C3 33            [ 6] 3590 	inc	sp
   78C4 2A D5 63      [16] 3591 	ld	hl,(_mapa)
   78C7 E5            [11] 3592 	push	hl
   78C8 CD 2C 4A      [17] 3593 	call	_getTilePtr
   78CB F1            [10] 3594 	pop	af
   78CC F1            [10] 3595 	pop	af
   78CD 4E            [ 7] 3596 	ld	c,(hl)
   78CE 3E 02         [ 7] 3597 	ld	a,#0x02
   78D0 91            [ 4] 3598 	sub	a, c
   78D1 38 61         [12] 3599 	jr	C,00178$
                           3600 ;src/main.c:645: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78D3 DD 6E F6      [19] 3601 	ld	l,-10 (ix)
   78D6 DD 66 F7      [19] 3602 	ld	h,-9 (ix)
   78D9 7E            [ 7] 3603 	ld	a,(hl)
   78DA C6 0B         [ 7] 3604 	add	a, #0x0B
   78DC 47            [ 4] 3605 	ld	b,a
   78DD DD 6E F4      [19] 3606 	ld	l,-12 (ix)
   78E0 DD 66 F5      [19] 3607 	ld	h,-11 (ix)
   78E3 7E            [ 7] 3608 	ld	a,(hl)
   78E4 C6 04         [ 7] 3609 	add	a, #0x04
   78E6 C5            [11] 3610 	push	bc
   78E7 33            [ 6] 3611 	inc	sp
   78E8 F5            [11] 3612 	push	af
   78E9 33            [ 6] 3613 	inc	sp
   78EA 2A D5 63      [16] 3614 	ld	hl,(_mapa)
   78ED E5            [11] 3615 	push	hl
   78EE CD 2C 4A      [17] 3616 	call	_getTilePtr
   78F1 F1            [10] 3617 	pop	af
   78F2 F1            [10] 3618 	pop	af
   78F3 4E            [ 7] 3619 	ld	c,(hl)
   78F4 3E 02         [ 7] 3620 	ld	a,#0x02
   78F6 91            [ 4] 3621 	sub	a, c
   78F7 38 3B         [12] 3622 	jr	C,00178$
                           3623 ;src/main.c:646: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78F9 DD 6E F6      [19] 3624 	ld	l,-10 (ix)
   78FC DD 66 F7      [19] 3625 	ld	h,-9 (ix)
   78FF 7E            [ 7] 3626 	ld	a,(hl)
   7900 C6 16         [ 7] 3627 	add	a, #0x16
   7902 47            [ 4] 3628 	ld	b,a
   7903 DD 6E F4      [19] 3629 	ld	l,-12 (ix)
   7906 DD 66 F5      [19] 3630 	ld	h,-11 (ix)
   7909 7E            [ 7] 3631 	ld	a,(hl)
   790A C6 04         [ 7] 3632 	add	a, #0x04
   790C C5            [11] 3633 	push	bc
   790D 33            [ 6] 3634 	inc	sp
   790E F5            [11] 3635 	push	af
   790F 33            [ 6] 3636 	inc	sp
   7910 2A D5 63      [16] 3637 	ld	hl,(_mapa)
   7913 E5            [11] 3638 	push	hl
   7914 CD 2C 4A      [17] 3639 	call	_getTilePtr
   7917 F1            [10] 3640 	pop	af
   7918 F1            [10] 3641 	pop	af
   7919 4E            [ 7] 3642 	ld	c,(hl)
   791A 3E 02         [ 7] 3643 	ld	a,#0x02
   791C 91            [ 4] 3644 	sub	a, c
   791D 38 15         [12] 3645 	jr	C,00178$
                           3646 ;src/main.c:647: moverEnemigoDerecha(enemy);
   791F DD 6E F4      [19] 3647 	ld	l,-12 (ix)
   7922 DD 66 F5      [19] 3648 	ld	h,-11 (ix)
   7925 E5            [11] 3649 	push	hl
   7926 CD 79 6C      [17] 3650 	call	_moverEnemigoDerecha
   7929 F1            [10] 3651 	pop	af
                           3652 ;src/main.c:648: enemy->mover = SI;
   792A DD 6E F8      [19] 3653 	ld	l,-8 (ix)
   792D DD 66 F9      [19] 3654 	ld	h,-7 (ix)
   7930 36 01         [10] 3655 	ld	(hl),#0x01
   7932 18 13         [12] 3656 	jr	00199$
   7934                    3657 00178$:
                           3658 ;src/main.c:651: moverEnemigoIzquierda(enemy);
   7934 DD 6E F4      [19] 3659 	ld	l,-12 (ix)
   7937 DD 66 F5      [19] 3660 	ld	h,-11 (ix)
   793A E5            [11] 3661 	push	hl
   793B CD 89 6C      [17] 3662 	call	_moverEnemigoIzquierda
   793E F1            [10] 3663 	pop	af
                           3664 ;src/main.c:652: enemy->mover = SI;
   793F DD 6E F8      [19] 3665 	ld	l,-8 (ix)
   7942 DD 66 F9      [19] 3666 	ld	h,-7 (ix)
   7945 36 01         [10] 3667 	ld	(hl),#0x01
   7947                    3668 00199$:
   7947 DD F9         [10] 3669 	ld	sp, ix
   7949 DD E1         [14] 3670 	pop	ix
   794B C9            [10] 3671 	ret
                           3672 ;src/main.c:661: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3673 ;	---------------------------------
                           3674 ; Function updateEnemy
                           3675 ; ---------------------------------
   794C                    3676 _updateEnemy::
   794C DD E5         [15] 3677 	push	ix
   794E DD 21 00 00   [14] 3678 	ld	ix,#0
   7952 DD 39         [15] 3679 	add	ix,sp
   7954 21 F4 FF      [10] 3680 	ld	hl,#-12
   7957 39            [11] 3681 	add	hl,sp
   7958 F9            [ 6] 3682 	ld	sp,hl
                           3683 ;src/main.c:668: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7959 DD 4E 04      [19] 3684 	ld	c,4 (ix)
   795C DD 46 05      [19] 3685 	ld	b,5 (ix)
   795F 21 16 00      [10] 3686 	ld	hl,#0x0016
   7962 09            [11] 3687 	add	hl,bc
   7963 DD 75 FC      [19] 3688 	ld	-4 (ix),l
   7966 DD 74 FD      [19] 3689 	ld	-3 (ix),h
   7969 DD 6E FC      [19] 3690 	ld	l,-4 (ix)
   796C DD 66 FD      [19] 3691 	ld	h,-3 (ix)
   796F 7E            [ 7] 3692 	ld	a,(hl)
   7970 B7            [ 4] 3693 	or	a, a
   7971 28 14         [12] 3694 	jr	Z,00115$
                           3695 ;src/main.c:669: engage(actual, prota.x, prota.y);
   7973 3A F9 62      [13] 3696 	ld	a, (#_prota + 1)
   7976 21 F8 62      [10] 3697 	ld	hl, #_prota + 0
   7979 56            [ 7] 3698 	ld	d,(hl)
   797A F5            [11] 3699 	push	af
   797B 33            [ 6] 3700 	inc	sp
   797C D5            [11] 3701 	push	de
   797D 33            [ 6] 3702 	inc	sp
   797E C5            [11] 3703 	push	bc
   797F CD A1 71      [17] 3704 	call	_engage
   7982 F1            [10] 3705 	pop	af
   7983 F1            [10] 3706 	pop	af
   7984 C3 AF 7A      [10] 3707 	jp	00117$
   7987                    3708 00115$:
                           3709 ;src/main.c:671: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7987 C5            [11] 3710 	push	bc
   7988 C5            [11] 3711 	push	bc
   7989 CD E4 6E      [17] 3712 	call	_lookFor
   798C F1            [10] 3713 	pop	af
   798D C1            [10] 3714 	pop	bc
                           3715 ;src/main.c:678: actual->patrolling = 0;
   798E 21 0B 00      [10] 3716 	ld	hl,#0x000B
   7991 09            [11] 3717 	add	hl,bc
   7992 DD 75 F8      [19] 3718 	ld	-8 (ix),l
   7995 DD 74 F9      [19] 3719 	ld	-7 (ix),h
                           3720 ;src/main.c:672: if (actual->patrolling) {
   7998 DD 6E F8      [19] 3721 	ld	l,-8 (ix)
   799B DD 66 F9      [19] 3722 	ld	h,-7 (ix)
   799E 6E            [ 7] 3723 	ld	l,(hl)
                           3724 ;src/main.c:675: if (actual->in_range) {
   799F 79            [ 4] 3725 	ld	a,c
   79A0 C6 11         [ 7] 3726 	add	a, #0x11
   79A2 5F            [ 4] 3727 	ld	e,a
   79A3 78            [ 4] 3728 	ld	a,b
   79A4 CE 00         [ 7] 3729 	adc	a, #0x00
   79A6 57            [ 4] 3730 	ld	d,a
                           3731 ;src/main.c:684: actual->seek = 1;
   79A7 79            [ 4] 3732 	ld	a,c
   79A8 C6 14         [ 7] 3733 	add	a, #0x14
   79AA DD 77 F6      [19] 3734 	ld	-10 (ix),a
   79AD 78            [ 4] 3735 	ld	a,b
   79AE CE 00         [ 7] 3736 	adc	a, #0x00
   79B0 DD 77 F7      [19] 3737 	ld	-9 (ix),a
                           3738 ;src/main.c:672: if (actual->patrolling) {
   79B3 7D            [ 4] 3739 	ld	a,l
   79B4 B7            [ 4] 3740 	or	a, a
   79B5 CA 77 7A      [10] 3741 	jp	Z,00112$
                           3742 ;src/main.c:674: moverEnemigoPatrol(actual);
   79B8 C5            [11] 3743 	push	bc
   79B9 D5            [11] 3744 	push	de
   79BA C5            [11] 3745 	push	bc
   79BB CD 9B 6C      [17] 3746 	call	_moverEnemigoPatrol
   79BE F1            [10] 3747 	pop	af
   79BF D1            [10] 3748 	pop	de
   79C0 C1            [10] 3749 	pop	bc
                           3750 ;src/main.c:675: if (actual->in_range) {
   79C1 1A            [ 7] 3751 	ld	a,(de)
   79C2 B7            [ 4] 3752 	or	a, a
   79C3 28 24         [12] 3753 	jr	Z,00104$
                           3754 ;src/main.c:677: engage(actual, prota.x, prota.y);
   79C5 3A F9 62      [13] 3755 	ld	a, (#_prota + 1)
   79C8 21 F8 62      [10] 3756 	ld	hl, #_prota + 0
   79CB 56            [ 7] 3757 	ld	d,(hl)
   79CC F5            [11] 3758 	push	af
   79CD 33            [ 6] 3759 	inc	sp
   79CE D5            [11] 3760 	push	de
   79CF 33            [ 6] 3761 	inc	sp
   79D0 C5            [11] 3762 	push	bc
   79D1 CD A1 71      [17] 3763 	call	_engage
   79D4 F1            [10] 3764 	pop	af
   79D5 F1            [10] 3765 	pop	af
                           3766 ;src/main.c:678: actual->patrolling = 0;
   79D6 DD 6E F8      [19] 3767 	ld	l,-8 (ix)
   79D9 DD 66 F9      [19] 3768 	ld	h,-7 (ix)
   79DC 36 00         [10] 3769 	ld	(hl),#0x00
                           3770 ;src/main.c:679: actual->engage = 1;
   79DE DD 6E FC      [19] 3771 	ld	l,-4 (ix)
   79E1 DD 66 FD      [19] 3772 	ld	h,-3 (ix)
   79E4 36 01         [10] 3773 	ld	(hl),#0x01
   79E6 C3 AF 7A      [10] 3774 	jp	00117$
   79E9                    3775 00104$:
                           3776 ;src/main.c:680: } else if (actual->seen) {
   79E9 21 12 00      [10] 3777 	ld	hl,#0x0012
   79EC 09            [11] 3778 	add	hl,bc
   79ED DD 75 FA      [19] 3779 	ld	-6 (ix),l
   79F0 DD 74 FB      [19] 3780 	ld	-5 (ix),h
   79F3 DD 6E FA      [19] 3781 	ld	l,-6 (ix)
   79F6 DD 66 FB      [19] 3782 	ld	h,-5 (ix)
   79F9 7E            [ 7] 3783 	ld	a,(hl)
   79FA B7            [ 4] 3784 	or	a, a
   79FB CA AF 7A      [10] 3785 	jp	Z,00117$
                           3786 ;src/main.c:681: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79FE 3A F9 62      [13] 3787 	ld	a,(#_prota + 1)
   7A01 DD 77 F4      [19] 3788 	ld	-12 (ix),a
   7A04 21 F8 62      [10] 3789 	ld	hl, #_prota + 0
   7A07 5E            [ 7] 3790 	ld	e,(hl)
   7A08 21 01 00      [10] 3791 	ld	hl,#0x0001
   7A0B 09            [11] 3792 	add	hl,bc
   7A0C DD 75 FE      [19] 3793 	ld	-2 (ix),l
   7A0F DD 74 FF      [19] 3794 	ld	-1 (ix),h
   7A12 DD 6E FE      [19] 3795 	ld	l,-2 (ix)
   7A15 DD 66 FF      [19] 3796 	ld	h,-1 (ix)
   7A18 56            [ 7] 3797 	ld	d,(hl)
   7A19 0A            [ 7] 3798 	ld	a,(bc)
   7A1A DD 77 F5      [19] 3799 	ld	-11 (ix),a
   7A1D C5            [11] 3800 	push	bc
   7A1E 2A D5 63      [16] 3801 	ld	hl,(_mapa)
   7A21 E5            [11] 3802 	push	hl
   7A22 C5            [11] 3803 	push	bc
   7A23 DD 7E F4      [19] 3804 	ld	a,-12 (ix)
   7A26 F5            [11] 3805 	push	af
   7A27 33            [ 6] 3806 	inc	sp
   7A28 7B            [ 4] 3807 	ld	a,e
   7A29 F5            [11] 3808 	push	af
   7A2A 33            [ 6] 3809 	inc	sp
   7A2B D5            [11] 3810 	push	de
   7A2C 33            [ 6] 3811 	inc	sp
   7A2D DD 7E F5      [19] 3812 	ld	a,-11 (ix)
   7A30 F5            [11] 3813 	push	af
   7A31 33            [ 6] 3814 	inc	sp
   7A32 CD 82 48      [17] 3815 	call	_pathFinding
   7A35 21 08 00      [10] 3816 	ld	hl,#8
   7A38 39            [11] 3817 	add	hl,sp
   7A39 F9            [ 6] 3818 	ld	sp,hl
   7A3A C1            [10] 3819 	pop	bc
                           3820 ;src/main.c:682: actual->p_seek_x = actual->x;
   7A3B 21 17 00      [10] 3821 	ld	hl,#0x0017
   7A3E 09            [11] 3822 	add	hl,bc
   7A3F EB            [ 4] 3823 	ex	de,hl
   7A40 0A            [ 7] 3824 	ld	a,(bc)
   7A41 12            [ 7] 3825 	ld	(de),a
                           3826 ;src/main.c:683: actual->p_seek_y = actual->y;
   7A42 21 18 00      [10] 3827 	ld	hl,#0x0018
   7A45 09            [11] 3828 	add	hl,bc
   7A46 EB            [ 4] 3829 	ex	de,hl
   7A47 DD 6E FE      [19] 3830 	ld	l,-2 (ix)
   7A4A DD 66 FF      [19] 3831 	ld	h,-1 (ix)
   7A4D 7E            [ 7] 3832 	ld	a,(hl)
   7A4E 12            [ 7] 3833 	ld	(de),a
                           3834 ;src/main.c:684: actual->seek = 1;
   7A4F DD 6E F6      [19] 3835 	ld	l,-10 (ix)
   7A52 DD 66 F7      [19] 3836 	ld	h,-9 (ix)
   7A55 36 01         [10] 3837 	ld	(hl),#0x01
                           3838 ;src/main.c:685: actual->iter=0;
   7A57 21 0E 00      [10] 3839 	ld	hl,#0x000E
   7A5A 09            [11] 3840 	add	hl,bc
   7A5B AF            [ 4] 3841 	xor	a, a
   7A5C 77            [ 7] 3842 	ld	(hl), a
   7A5D 23            [ 6] 3843 	inc	hl
   7A5E 77            [ 7] 3844 	ld	(hl), a
                           3845 ;src/main.c:686: actual->reversePatrol = NO;
   7A5F 21 0C 00      [10] 3846 	ld	hl,#0x000C
   7A62 09            [11] 3847 	add	hl,bc
   7A63 36 00         [10] 3848 	ld	(hl),#0x00
                           3849 ;src/main.c:687: actual->patrolling = 0;
   7A65 DD 6E F8      [19] 3850 	ld	l,-8 (ix)
   7A68 DD 66 F9      [19] 3851 	ld	h,-7 (ix)
   7A6B 36 00         [10] 3852 	ld	(hl),#0x00
                           3853 ;src/main.c:688: actual->seen = 0;
   7A6D DD 6E FA      [19] 3854 	ld	l,-6 (ix)
   7A70 DD 66 FB      [19] 3855 	ld	h,-5 (ix)
   7A73 36 00         [10] 3856 	ld	(hl),#0x00
   7A75 18 38         [12] 3857 	jr	00117$
   7A77                    3858 00112$:
                           3859 ;src/main.c:690: } else if (actual->seek) {
   7A77 DD 6E F6      [19] 3860 	ld	l,-10 (ix)
   7A7A DD 66 F7      [19] 3861 	ld	h,-9 (ix)
   7A7D 7E            [ 7] 3862 	ld	a,(hl)
   7A7E B7            [ 4] 3863 	or	a, a
   7A7F 28 2E         [12] 3864 	jr	Z,00117$
                           3865 ;src/main.c:691: moverEnemigoSeek(actual);
   7A81 C5            [11] 3866 	push	bc
   7A82 D5            [11] 3867 	push	de
   7A83 C5            [11] 3868 	push	bc
   7A84 CD FC 6F      [17] 3869 	call	_moverEnemigoSeek
   7A87 F1            [10] 3870 	pop	af
   7A88 D1            [10] 3871 	pop	de
   7A89 C1            [10] 3872 	pop	bc
                           3873 ;src/main.c:692: if (actual->in_range) {
   7A8A 1A            [ 7] 3874 	ld	a,(de)
   7A8B B7            [ 4] 3875 	or	a, a
   7A8C 28 21         [12] 3876 	jr	Z,00117$
                           3877 ;src/main.c:693: engage(actual, prota.x, prota.y);
   7A8E 3A F9 62      [13] 3878 	ld	a, (#_prota + 1)
   7A91 21 F8 62      [10] 3879 	ld	hl, #_prota + 0
   7A94 56            [ 7] 3880 	ld	d,(hl)
   7A95 F5            [11] 3881 	push	af
   7A96 33            [ 6] 3882 	inc	sp
   7A97 D5            [11] 3883 	push	de
   7A98 33            [ 6] 3884 	inc	sp
   7A99 C5            [11] 3885 	push	bc
   7A9A CD A1 71      [17] 3886 	call	_engage
   7A9D F1            [10] 3887 	pop	af
   7A9E F1            [10] 3888 	pop	af
                           3889 ;src/main.c:694: actual->seek = 0;
   7A9F DD 6E F6      [19] 3890 	ld	l,-10 (ix)
   7AA2 DD 66 F7      [19] 3891 	ld	h,-9 (ix)
   7AA5 36 00         [10] 3892 	ld	(hl),#0x00
                           3893 ;src/main.c:695: actual->engage = 1;
   7AA7 DD 6E FC      [19] 3894 	ld	l,-4 (ix)
   7AAA DD 66 FD      [19] 3895 	ld	h,-3 (ix)
   7AAD 36 01         [10] 3896 	ld	(hl),#0x01
                           3897 ;src/main.c:696: } else if (actual->seen) {
   7AAF                    3898 00117$:
   7AAF DD F9         [10] 3899 	ld	sp, ix
   7AB1 DD E1         [14] 3900 	pop	ix
   7AB3 C9            [10] 3901 	ret
                           3902 ;src/main.c:703: void inicializarEnemy() {
                           3903 ;	---------------------------------
                           3904 ; Function inicializarEnemy
                           3905 ; ---------------------------------
   7AB4                    3906 _inicializarEnemy::
   7AB4 DD E5         [15] 3907 	push	ix
   7AB6 DD 21 00 00   [14] 3908 	ld	ix,#0
   7ABA DD 39         [15] 3909 	add	ix,sp
   7ABC 21 F9 FF      [10] 3910 	ld	hl,#-7
   7ABF 39            [11] 3911 	add	hl,sp
   7AC0 F9            [ 6] 3912 	ld	sp,hl
                           3913 ;src/main.c:704: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7AC1 3A D7 63      [13] 3914 	ld	a,(#_num_mapa + 0)
   7AC4 C6 02         [ 7] 3915 	add	a, #0x02
   7AC6 DD 77 FF      [19] 3916 	ld	-1 (ix),a
                           3917 ;src/main.c:714: actual = enemy;
   7AC9 11 70 5F      [10] 3918 	ld	de,#_enemy+0
                           3919 ;src/main.c:715: while(i){
   7ACC                    3920 00101$:
   7ACC DD 7E FF      [19] 3921 	ld	a,-1 (ix)
   7ACF B7            [ 4] 3922 	or	a, a
   7AD0 CA C2 7B      [10] 3923 	jp	Z,00104$
                           3924 ;src/main.c:716: --i;
   7AD3 DD 35 FF      [23] 3925 	dec	-1 (ix)
                           3926 ;src/main.c:717: actual->x = actual->px = spawnX[i];
   7AD6 4B            [ 4] 3927 	ld	c, e
   7AD7 42            [ 4] 3928 	ld	b, d
   7AD8 03            [ 6] 3929 	inc	bc
   7AD9 03            [ 6] 3930 	inc	bc
   7ADA 3E FB         [ 7] 3931 	ld	a,#<(_spawnX)
   7ADC DD 86 FF      [19] 3932 	add	a, -1 (ix)
   7ADF DD 77 FD      [19] 3933 	ld	-3 (ix),a
   7AE2 3E 63         [ 7] 3934 	ld	a,#>(_spawnX)
   7AE4 CE 00         [ 7] 3935 	adc	a, #0x00
   7AE6 DD 77 FE      [19] 3936 	ld	-2 (ix),a
   7AE9 DD 6E FD      [19] 3937 	ld	l,-3 (ix)
   7AEC DD 66 FE      [19] 3938 	ld	h,-2 (ix)
   7AEF 7E            [ 7] 3939 	ld	a,(hl)
   7AF0 02            [ 7] 3940 	ld	(bc),a
   7AF1 12            [ 7] 3941 	ld	(de),a
                           3942 ;src/main.c:718: actual->y = actual->py = spawnY[i];
   7AF2 D5            [11] 3943 	push	de
   7AF3 FD E1         [14] 3944 	pop	iy
   7AF5 FD 23         [10] 3945 	inc	iy
   7AF7 4B            [ 4] 3946 	ld	c, e
   7AF8 42            [ 4] 3947 	ld	b, d
   7AF9 03            [ 6] 3948 	inc	bc
   7AFA 03            [ 6] 3949 	inc	bc
   7AFB 03            [ 6] 3950 	inc	bc
   7AFC 3E FF         [ 7] 3951 	ld	a,#<(_spawnY)
   7AFE DD 86 FF      [19] 3952 	add	a, -1 (ix)
   7B01 DD 77 FB      [19] 3953 	ld	-5 (ix),a
   7B04 3E 63         [ 7] 3954 	ld	a,#>(_spawnY)
   7B06 CE 00         [ 7] 3955 	adc	a, #0x00
   7B08 DD 77 FC      [19] 3956 	ld	-4 (ix),a
   7B0B DD 6E FB      [19] 3957 	ld	l,-5 (ix)
   7B0E DD 66 FC      [19] 3958 	ld	h,-4 (ix)
   7B11 7E            [ 7] 3959 	ld	a,(hl)
   7B12 02            [ 7] 3960 	ld	(bc),a
   7B13 FD 77 00      [19] 3961 	ld	0 (iy), a
                           3962 ;src/main.c:719: actual->mover  = NO;
   7B16 21 06 00      [10] 3963 	ld	hl,#0x0006
   7B19 19            [11] 3964 	add	hl,de
   7B1A 36 00         [10] 3965 	ld	(hl),#0x00
                           3966 ;src/main.c:720: actual->mira   = M_abajo;
   7B1C 21 07 00      [10] 3967 	ld	hl,#0x0007
   7B1F 19            [11] 3968 	add	hl,de
   7B20 36 03         [10] 3969 	ld	(hl),#0x03
                           3970 ;src/main.c:721: actual->sprite = g_enemy;
   7B22 21 04 00      [10] 3971 	ld	hl,#0x0004
   7B25 19            [11] 3972 	add	hl,de
   7B26 36 3A         [10] 3973 	ld	(hl),#<(_g_enemy)
   7B28 23            [ 6] 3974 	inc	hl
   7B29 36 3C         [10] 3975 	ld	(hl),#>(_g_enemy)
                           3976 ;src/main.c:722: actual->muerto = NO;
   7B2B 21 08 00      [10] 3977 	ld	hl,#0x0008
   7B2E 19            [11] 3978 	add	hl,de
   7B2F 36 00         [10] 3979 	ld	(hl),#0x00
                           3980 ;src/main.c:723: actual->muertes = 0;
   7B31 21 0A 00      [10] 3981 	ld	hl,#0x000A
   7B34 19            [11] 3982 	add	hl,de
   7B35 36 00         [10] 3983 	ld	(hl),#0x00
                           3984 ;src/main.c:724: actual->patrolling = SI;
   7B37 21 0B 00      [10] 3985 	ld	hl,#0x000B
   7B3A 19            [11] 3986 	add	hl,de
   7B3B 36 01         [10] 3987 	ld	(hl),#0x01
                           3988 ;src/main.c:725: actual->reversePatrol = NO;
   7B3D 21 0C 00      [10] 3989 	ld	hl,#0x000C
   7B40 19            [11] 3990 	add	hl,de
   7B41 36 00         [10] 3991 	ld	(hl),#0x00
                           3992 ;src/main.c:726: actual->iter = 0;
   7B43 21 0E 00      [10] 3993 	ld	hl,#0x000E
   7B46 19            [11] 3994 	add	hl,de
   7B47 AF            [ 4] 3995 	xor	a, a
   7B48 77            [ 7] 3996 	ld	(hl), a
   7B49 23            [ 6] 3997 	inc	hl
   7B4A 77            [ 7] 3998 	ld	(hl), a
                           3999 ;src/main.c:727: actual->lastIter = 0;
   7B4B 21 10 00      [10] 4000 	ld	hl,#0x0010
   7B4E 19            [11] 4001 	add	hl,de
   7B4F 36 00         [10] 4002 	ld	(hl),#0x00
                           4003 ;src/main.c:728: actual->seen = 0;
   7B51 21 12 00      [10] 4004 	ld	hl,#0x0012
   7B54 19            [11] 4005 	add	hl,de
   7B55 36 00         [10] 4006 	ld	(hl),#0x00
                           4007 ;src/main.c:729: actual->found = 0;
   7B57 21 13 00      [10] 4008 	ld	hl,#0x0013
   7B5A 19            [11] 4009 	add	hl,de
   7B5B 36 00         [10] 4010 	ld	(hl),#0x00
                           4011 ;src/main.c:730: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B5D 21 D7 63      [10] 4012 	ld	hl,#_num_mapa + 0
   7B60 4E            [ 7] 4013 	ld	c, (hl)
   7B61 0C            [ 4] 4014 	inc	c
   7B62 06 00         [ 7] 4015 	ld	b,#0x00
   7B64 69            [ 4] 4016 	ld	l, c
   7B65 60            [ 4] 4017 	ld	h, b
   7B66 29            [11] 4018 	add	hl, hl
   7B67 29            [11] 4019 	add	hl, hl
   7B68 09            [11] 4020 	add	hl, bc
   7B69 4D            [ 4] 4021 	ld	c,l
   7B6A 44            [ 4] 4022 	ld	b,h
   7B6B 21 17 64      [10] 4023 	ld	hl,#_patrolY
   7B6E 09            [11] 4024 	add	hl,bc
   7B6F 7D            [ 4] 4025 	ld	a,l
   7B70 DD 86 FF      [19] 4026 	add	a, -1 (ix)
   7B73 6F            [ 4] 4027 	ld	l,a
   7B74 7C            [ 4] 4028 	ld	a,h
   7B75 CE 00         [ 7] 4029 	adc	a, #0x00
   7B77 67            [ 4] 4030 	ld	h,a
   7B78 7E            [ 7] 4031 	ld	a,(hl)
   7B79 DD 77 FA      [19] 4032 	ld	-6 (ix),a
   7B7C 21 03 64      [10] 4033 	ld	hl,#_patrolX
   7B7F 09            [11] 4034 	add	hl,bc
   7B80 DD 4E FF      [19] 4035 	ld	c,-1 (ix)
   7B83 06 00         [ 7] 4036 	ld	b,#0x00
   7B85 09            [11] 4037 	add	hl,bc
   7B86 7E            [ 7] 4038 	ld	a,(hl)
   7B87 DD 77 F9      [19] 4039 	ld	-7 (ix),a
   7B8A DD 6E FB      [19] 4040 	ld	l,-5 (ix)
   7B8D DD 66 FC      [19] 4041 	ld	h,-4 (ix)
   7B90 4E            [ 7] 4042 	ld	c,(hl)
   7B91 DD 6E FD      [19] 4043 	ld	l,-3 (ix)
   7B94 DD 66 FE      [19] 4044 	ld	h,-2 (ix)
   7B97 46            [ 7] 4045 	ld	b,(hl)
   7B98 D5            [11] 4046 	push	de
   7B99 2A D5 63      [16] 4047 	ld	hl,(_mapa)
   7B9C E5            [11] 4048 	push	hl
   7B9D D5            [11] 4049 	push	de
   7B9E DD 66 FA      [19] 4050 	ld	h,-6 (ix)
   7BA1 DD 6E F9      [19] 4051 	ld	l,-7 (ix)
   7BA4 E5            [11] 4052 	push	hl
   7BA5 79            [ 4] 4053 	ld	a,c
   7BA6 F5            [11] 4054 	push	af
   7BA7 33            [ 6] 4055 	inc	sp
   7BA8 C5            [11] 4056 	push	bc
   7BA9 33            [ 6] 4057 	inc	sp
   7BAA CD 82 48      [17] 4058 	call	_pathFinding
   7BAD 21 08 00      [10] 4059 	ld	hl,#8
   7BB0 39            [11] 4060 	add	hl,sp
   7BB1 F9            [ 6] 4061 	ld	sp,hl
   7BB2 D1            [10] 4062 	pop	de
                           4063 ;src/main.c:753: dibujarEnemigo(actual);
   7BB3 D5            [11] 4064 	push	de
   7BB4 D5            [11] 4065 	push	de
   7BB5 CD B1 66      [17] 4066 	call	_dibujarEnemigo
   7BB8 F1            [10] 4067 	pop	af
   7BB9 D1            [10] 4068 	pop	de
                           4069 ;src/main.c:754: ++actual;
   7BBA 21 E2 00      [10] 4070 	ld	hl,#0x00E2
   7BBD 19            [11] 4071 	add	hl,de
   7BBE EB            [ 4] 4072 	ex	de,hl
   7BBF C3 CC 7A      [10] 4073 	jp	00101$
   7BC2                    4074 00104$:
   7BC2 DD F9         [10] 4075 	ld	sp, ix
   7BC4 DD E1         [14] 4076 	pop	ix
   7BC6 C9            [10] 4077 	ret
                           4078 ;src/main.c:758: void avanzarMapa() {
                           4079 ;	---------------------------------
                           4080 ; Function avanzarMapa
                           4081 ; ---------------------------------
   7BC7                    4082 _avanzarMapa::
                           4083 ;src/main.c:759: if(num_mapa < NUM_MAPAS -1) {
   7BC7 3A D7 63      [13] 4084 	ld	a,(#_num_mapa + 0)
   7BCA D6 02         [ 7] 4085 	sub	a, #0x02
   7BCC 30 34         [12] 4086 	jr	NC,00102$
                           4087 ;src/main.c:760: mapa = mapas[++num_mapa];
   7BCE 01 F5 63      [10] 4088 	ld	bc,#_mapas+0
   7BD1 21 D7 63      [10] 4089 	ld	hl, #_num_mapa+0
   7BD4 34            [11] 4090 	inc	(hl)
   7BD5 FD 21 D7 63   [14] 4091 	ld	iy,#_num_mapa
   7BD9 FD 6E 00      [19] 4092 	ld	l,0 (iy)
   7BDC 26 00         [ 7] 4093 	ld	h,#0x00
   7BDE 29            [11] 4094 	add	hl, hl
   7BDF 09            [11] 4095 	add	hl,bc
   7BE0 7E            [ 7] 4096 	ld	a,(hl)
   7BE1 FD 21 D5 63   [14] 4097 	ld	iy,#_mapa
   7BE5 FD 77 00      [19] 4098 	ld	0 (iy),a
   7BE8 23            [ 6] 4099 	inc	hl
   7BE9 7E            [ 7] 4100 	ld	a,(hl)
   7BEA 32 D6 63      [13] 4101 	ld	(#_mapa + 1),a
                           4102 ;src/main.c:761: prota.x = prota.px = 2;
   7BED 21 FA 62      [10] 4103 	ld	hl,#(_prota + 0x0002)
   7BF0 36 02         [10] 4104 	ld	(hl),#0x02
   7BF2 21 F8 62      [10] 4105 	ld	hl,#_prota
   7BF5 36 02         [10] 4106 	ld	(hl),#0x02
                           4107 ;src/main.c:762: prota.mover = SI;
   7BF7 21 FE 62      [10] 4108 	ld	hl,#(_prota + 0x0006)
   7BFA 36 01         [10] 4109 	ld	(hl),#0x01
                           4110 ;src/main.c:763: dibujarMapa();
   7BFC CD DF 63      [17] 4111 	call	_dibujarMapa
                           4112 ;src/main.c:764: inicializarEnemy();
   7BFF C3 B4 7A      [10] 4113 	jp  _inicializarEnemy
   7C02                    4114 00102$:
                           4115 ;src/main.c:767: menuFin(puntuacion);
   7C02 FD 21 D8 63   [14] 4116 	ld	iy,#_puntuacion
   7C06 FD 6E 00      [19] 4117 	ld	l,0 (iy)
   7C09 26 00         [ 7] 4118 	ld	h,#0x00
   7C0B C3 B0 4A      [10] 4119 	jp  _menuFin
                           4120 ;src/main.c:771: void moverIzquierda() {
                           4121 ;	---------------------------------
                           4122 ; Function moverIzquierda
                           4123 ; ---------------------------------
   7C0E                    4124 _moverIzquierda::
                           4125 ;src/main.c:772: prota.mira = M_izquierda;
   7C0E 01 F8 62      [10] 4126 	ld	bc,#_prota+0
   7C11 21 FF 62      [10] 4127 	ld	hl,#(_prota + 0x0007)
   7C14 36 01         [10] 4128 	ld	(hl),#0x01
                           4129 ;src/main.c:773: if (!checkCollision(M_izquierda)) {
   7C16 C5            [11] 4130 	push	bc
   7C17 3E 01         [ 7] 4131 	ld	a,#0x01
   7C19 F5            [11] 4132 	push	af
   7C1A 33            [ 6] 4133 	inc	sp
   7C1B CD 40 65      [17] 4134 	call	_checkCollision
   7C1E 33            [ 6] 4135 	inc	sp
   7C1F C1            [10] 4136 	pop	bc
   7C20 7D            [ 4] 4137 	ld	a,l
   7C21 B7            [ 4] 4138 	or	a, a
   7C22 C0            [11] 4139 	ret	NZ
                           4140 ;src/main.c:774: prota.x--;
   7C23 0A            [ 7] 4141 	ld	a,(bc)
   7C24 C6 FF         [ 7] 4142 	add	a,#0xFF
   7C26 02            [ 7] 4143 	ld	(bc),a
                           4144 ;src/main.c:775: prota.mover = SI;
   7C27 21 FE 62      [10] 4145 	ld	hl,#(_prota + 0x0006)
   7C2A 36 01         [10] 4146 	ld	(hl),#0x01
                           4147 ;src/main.c:776: prota.sprite = g_hero_left;
   7C2C 21 C6 3D      [10] 4148 	ld	hl,#_g_hero_left
   7C2F 22 FC 62      [16] 4149 	ld	((_prota + 0x0004)), hl
   7C32 C9            [10] 4150 	ret
                           4151 ;src/main.c:780: void moverDerecha() {
                           4152 ;	---------------------------------
                           4153 ; Function moverDerecha
                           4154 ; ---------------------------------
   7C33                    4155 _moverDerecha::
                           4156 ;src/main.c:781: prota.mira = M_derecha;
   7C33 21 FF 62      [10] 4157 	ld	hl,#(_prota + 0x0007)
   7C36 36 00         [10] 4158 	ld	(hl),#0x00
                           4159 ;src/main.c:782: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C38 AF            [ 4] 4160 	xor	a, a
   7C39 F5            [11] 4161 	push	af
   7C3A 33            [ 6] 4162 	inc	sp
   7C3B CD 40 65      [17] 4163 	call	_checkCollision
   7C3E 33            [ 6] 4164 	inc	sp
   7C3F 45            [ 4] 4165 	ld	b,l
   7C40 21 F8 62      [10] 4166 	ld	hl, #_prota + 0
   7C43 4E            [ 7] 4167 	ld	c,(hl)
   7C44 59            [ 4] 4168 	ld	e,c
   7C45 16 00         [ 7] 4169 	ld	d,#0x00
   7C47 21 07 00      [10] 4170 	ld	hl,#0x0007
   7C4A 19            [11] 4171 	add	hl,de
   7C4B 11 50 80      [10] 4172 	ld	de, #0x8050
   7C4E 29            [11] 4173 	add	hl, hl
   7C4F 3F            [ 4] 4174 	ccf
   7C50 CB 1C         [ 8] 4175 	rr	h
   7C52 CB 1D         [ 8] 4176 	rr	l
   7C54 ED 52         [15] 4177 	sbc	hl, de
   7C56 3E 00         [ 7] 4178 	ld	a,#0x00
   7C58 17            [ 4] 4179 	rla
   7C59 5F            [ 4] 4180 	ld	e,a
   7C5A 78            [ 4] 4181 	ld	a,b
   7C5B B7            [ 4] 4182 	or	a,a
   7C5C 20 14         [12] 4183 	jr	NZ,00104$
   7C5E B3            [ 4] 4184 	or	a,e
   7C5F 28 11         [12] 4185 	jr	Z,00104$
                           4186 ;src/main.c:783: prota.x++;
   7C61 0C            [ 4] 4187 	inc	c
   7C62 21 F8 62      [10] 4188 	ld	hl,#_prota
   7C65 71            [ 7] 4189 	ld	(hl),c
                           4190 ;src/main.c:784: prota.mover = SI;
   7C66 21 FE 62      [10] 4191 	ld	hl,#(_prota + 0x0006)
   7C69 36 01         [10] 4192 	ld	(hl),#0x01
                           4193 ;src/main.c:785: prota.sprite = g_hero;
   7C6B 21 70 3E      [10] 4194 	ld	hl,#_g_hero
   7C6E 22 FC 62      [16] 4195 	ld	((_prota + 0x0004)), hl
   7C71 C9            [10] 4196 	ret
   7C72                    4197 00104$:
                           4198 ;src/main.c:787: }else if( prota.x + G_HERO_W >= 80){
   7C72 7B            [ 4] 4199 	ld	a,e
   7C73 B7            [ 4] 4200 	or	a, a
   7C74 C0            [11] 4201 	ret	NZ
                           4202 ;src/main.c:788: avanzarMapa();
   7C75 C3 C7 7B      [10] 4203 	jp  _avanzarMapa
                           4204 ;src/main.c:792: void moverArriba() {
                           4205 ;	---------------------------------
                           4206 ; Function moverArriba
                           4207 ; ---------------------------------
   7C78                    4208 _moverArriba::
                           4209 ;src/main.c:793: prota.mira = M_arriba;
   7C78 21 FF 62      [10] 4210 	ld	hl,#(_prota + 0x0007)
   7C7B 36 02         [10] 4211 	ld	(hl),#0x02
                           4212 ;src/main.c:794: if (!checkCollision(M_arriba)) {
   7C7D 3E 02         [ 7] 4213 	ld	a,#0x02
   7C7F F5            [11] 4214 	push	af
   7C80 33            [ 6] 4215 	inc	sp
   7C81 CD 40 65      [17] 4216 	call	_checkCollision
   7C84 33            [ 6] 4217 	inc	sp
   7C85 7D            [ 4] 4218 	ld	a,l
   7C86 B7            [ 4] 4219 	or	a, a
   7C87 C0            [11] 4220 	ret	NZ
                           4221 ;src/main.c:795: prota.y--;
   7C88 21 F9 62      [10] 4222 	ld	hl,#_prota + 1
   7C8B 4E            [ 7] 4223 	ld	c,(hl)
   7C8C 0D            [ 4] 4224 	dec	c
   7C8D 71            [ 7] 4225 	ld	(hl),c
                           4226 ;src/main.c:796: prota.y--;
   7C8E 0D            [ 4] 4227 	dec	c
   7C8F 71            [ 7] 4228 	ld	(hl),c
                           4229 ;src/main.c:797: prota.mover  = SI;
   7C90 21 FE 62      [10] 4230 	ld	hl,#(_prota + 0x0006)
   7C93 36 01         [10] 4231 	ld	(hl),#0x01
                           4232 ;src/main.c:798: prota.sprite = g_hero_up;
   7C95 21 2C 3D      [10] 4233 	ld	hl,#_g_hero_up
   7C98 22 FC 62      [16] 4234 	ld	((_prota + 0x0004)), hl
   7C9B C9            [10] 4235 	ret
                           4236 ;src/main.c:802: void moverAbajo() {
                           4237 ;	---------------------------------
                           4238 ; Function moverAbajo
                           4239 ; ---------------------------------
   7C9C                    4240 _moverAbajo::
                           4241 ;src/main.c:803: prota.mira = M_abajo;
   7C9C 21 FF 62      [10] 4242 	ld	hl,#(_prota + 0x0007)
   7C9F 36 03         [10] 4243 	ld	(hl),#0x03
                           4244 ;src/main.c:804: if (!checkCollision(M_abajo) ) {
   7CA1 3E 03         [ 7] 4245 	ld	a,#0x03
   7CA3 F5            [11] 4246 	push	af
   7CA4 33            [ 6] 4247 	inc	sp
   7CA5 CD 40 65      [17] 4248 	call	_checkCollision
   7CA8 33            [ 6] 4249 	inc	sp
   7CA9 7D            [ 4] 4250 	ld	a,l
   7CAA B7            [ 4] 4251 	or	a, a
   7CAB C0            [11] 4252 	ret	NZ
                           4253 ;src/main.c:805: prota.y++;
   7CAC 01 F9 62      [10] 4254 	ld	bc,#_prota + 1
   7CAF 0A            [ 7] 4255 	ld	a,(bc)
   7CB0 3C            [ 4] 4256 	inc	a
   7CB1 02            [ 7] 4257 	ld	(bc),a
                           4258 ;src/main.c:806: prota.y++;
   7CB2 3C            [ 4] 4259 	inc	a
   7CB3 02            [ 7] 4260 	ld	(bc),a
                           4261 ;src/main.c:807: prota.mover  = SI;
   7CB4 21 FE 62      [10] 4262 	ld	hl,#(_prota + 0x0006)
   7CB7 36 01         [10] 4263 	ld	(hl),#0x01
                           4264 ;src/main.c:808: prota.sprite = g_hero_down;
   7CB9 21 92 3C      [10] 4265 	ld	hl,#_g_hero_down
   7CBC 22 FC 62      [16] 4266 	ld	((_prota + 0x0004)), hl
   7CBF C9            [10] 4267 	ret
                           4268 ;src/main.c:815: void intHandler() {
                           4269 ;	---------------------------------
                           4270 ; Function intHandler
                           4271 ; ---------------------------------
   7CC0                    4272 _intHandler::
                           4273 ;src/main.c:816: if (++i == 6) {
   7CC0 21 0B 63      [10] 4274 	ld	hl, #_i+0
   7CC3 34            [11] 4275 	inc	(hl)
   7CC4 3A 0B 63      [13] 4276 	ld	a,(#_i + 0)
   7CC7 D6 06         [ 7] 4277 	sub	a, #0x06
   7CC9 C0            [11] 4278 	ret	NZ
                           4279 ;src/main.c:817: play();
   7CCA CD 44 52      [17] 4280 	call	_play
                           4281 ;src/main.c:818: i=0;
   7CCD 21 0B 63      [10] 4282 	ld	hl,#_i + 0
   7CD0 36 00         [10] 4283 	ld	(hl), #0x00
   7CD2 C9            [10] 4284 	ret
                           4285 ;src/main.c:822: void inicializarCPC() {
                           4286 ;	---------------------------------
                           4287 ; Function inicializarCPC
                           4288 ; ---------------------------------
   7CD3                    4289 _inicializarCPC::
                           4290 ;src/main.c:823: cpct_disableFirmware();
   7CD3 CD EB 55      [17] 4291 	call	_cpct_disableFirmware
                           4292 ;src/main.c:824: cpct_setVideoMode(0);
   7CD6 2E 00         [ 7] 4293 	ld	l,#0x00
   7CD8 CD BF 55      [17] 4294 	call	_cpct_setVideoMode
                           4295 ;src/main.c:825: cpct_setBorder(HW_BLACK);
   7CDB 21 10 14      [10] 4296 	ld	hl,#0x1410
   7CDE E5            [11] 4297 	push	hl
   7CDF CD 22 53      [17] 4298 	call	_cpct_setPALColour
                           4299 ;src/main.c:826: cpct_setPalette(g_palette, 16);
   7CE2 21 10 00      [10] 4300 	ld	hl,#0x0010
   7CE5 E5            [11] 4301 	push	hl
   7CE6 21 60 3E      [10] 4302 	ld	hl,#_g_palette
   7CE9 E5            [11] 4303 	push	hl
   7CEA CD FF 52      [17] 4304 	call	_cpct_setPalette
   7CED C9            [10] 4305 	ret
                           4306 ;src/main.c:831: void inicializarJuego() {
                           4307 ;	---------------------------------
                           4308 ; Function inicializarJuego
                           4309 ; ---------------------------------
   7CEE                    4310 _inicializarJuego::
                           4311 ;src/main.c:833: num_mapa = 0;
   7CEE 21 D7 63      [10] 4312 	ld	hl,#_num_mapa + 0
   7CF1 36 00         [10] 4313 	ld	(hl), #0x00
                           4314 ;src/main.c:834: mapa = mapas[num_mapa];
   7CF3 21 F5 63      [10] 4315 	ld	hl, #_mapas + 0
   7CF6 7E            [ 7] 4316 	ld	a,(hl)
   7CF7 FD 21 D5 63   [14] 4317 	ld	iy,#_mapa
   7CFB FD 77 00      [19] 4318 	ld	0 (iy),a
   7CFE 23            [ 6] 4319 	inc	hl
   7CFF 7E            [ 7] 4320 	ld	a,(hl)
   7D00 32 D6 63      [13] 4321 	ld	(#_mapa + 1),a
                           4322 ;src/main.c:835: cpct_etm_setTileset2x4(g_tileset);
   7D03 21 E0 17      [10] 4323 	ld	hl,#_g_tileset
   7D06 CD 13 55      [17] 4324 	call	_cpct_etm_setTileset2x4
                           4325 ;src/main.c:837: dibujarMapa();
   7D09 CD DF 63      [17] 4326 	call	_dibujarMapa
                           4327 ;src/main.c:840: barraPuntuacionInicial();
   7D0C CD 50 50      [17] 4328 	call	_barraPuntuacionInicial
                           4329 ;src/main.c:843: prota.x = prota.px = 4;
   7D0F 21 FA 62      [10] 4330 	ld	hl,#(_prota + 0x0002)
   7D12 36 04         [10] 4331 	ld	(hl),#0x04
   7D14 21 F8 62      [10] 4332 	ld	hl,#_prota
   7D17 36 04         [10] 4333 	ld	(hl),#0x04
                           4334 ;src/main.c:844: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D19 21 FB 62      [10] 4335 	ld	hl,#(_prota + 0x0003)
   7D1C 36 68         [10] 4336 	ld	(hl),#0x68
   7D1E 21 F9 62      [10] 4337 	ld	hl,#(_prota + 0x0001)
   7D21 36 68         [10] 4338 	ld	(hl),#0x68
                           4339 ;src/main.c:845: prota.mover  = NO;
   7D23 21 FE 62      [10] 4340 	ld	hl,#(_prota + 0x0006)
   7D26 36 00         [10] 4341 	ld	(hl),#0x00
                           4342 ;src/main.c:846: prota.mira=M_derecha;
   7D28 21 FF 62      [10] 4343 	ld	hl,#(_prota + 0x0007)
   7D2B 36 00         [10] 4344 	ld	(hl),#0x00
                           4345 ;src/main.c:847: prota.sprite = g_hero;
   7D2D 21 70 3E      [10] 4346 	ld	hl,#_g_hero
   7D30 22 FC 62      [16] 4347 	ld	((_prota + 0x0004)), hl
                           4348 ;src/main.c:851: cu.x = cu.px = 0;
   7D33 21 02 63      [10] 4349 	ld	hl,#(_cu + 0x0002)
   7D36 36 00         [10] 4350 	ld	(hl),#0x00
   7D38 21 00 63      [10] 4351 	ld	hl,#_cu
   7D3B 36 00         [10] 4352 	ld	(hl),#0x00
                           4353 ;src/main.c:852: cu.y = cu.py = 0;
   7D3D 21 03 63      [10] 4354 	ld	hl,#(_cu + 0x0003)
   7D40 36 00         [10] 4355 	ld	(hl),#0x00
   7D42 21 01 63      [10] 4356 	ld	hl,#(_cu + 0x0001)
   7D45 36 00         [10] 4357 	ld	(hl),#0x00
                           4358 ;src/main.c:853: cu.lanzado = NO;
   7D47 21 06 63      [10] 4359 	ld	hl,#(_cu + 0x0006)
   7D4A 36 00         [10] 4360 	ld	(hl),#0x00
                           4361 ;src/main.c:854: cu.mover = NO;
   7D4C 21 09 63      [10] 4362 	ld	hl,#(_cu + 0x0009)
   7D4F 36 00         [10] 4363 	ld	(hl),#0x00
                           4364 ;src/main.c:855: cu.off_bound = NO;
   7D51 21 0A 63      [10] 4365 	ld	hl,#(_cu + 0x000a)
   7D54 36 00         [10] 4366 	ld	(hl),#0x00
                           4367 ;src/main.c:857: inicializarEnemy();
   7D56 CD B4 7A      [17] 4368 	call	_inicializarEnemy
                           4369 ;src/main.c:859: dibujarProta();
   7D59 C3 2B 64      [10] 4370 	jp  _dibujarProta
                           4371 ;src/main.c:862: void main(void) {
                           4372 ;	---------------------------------
                           4373 ; Function main
                           4374 ; ---------------------------------
   7D5C                    4375 _main::
   7D5C DD E5         [15] 4376 	push	ix
   7D5E DD 21 00 00   [14] 4377 	ld	ix,#0
   7D62 DD 39         [15] 4378 	add	ix,sp
   7D64 F5            [11] 4379 	push	af
   7D65 3B            [ 6] 4380 	dec	sp
                           4381 ;src/main.c:867: inicializarCPC();
   7D66 CD D3 7C      [17] 4382 	call	_inicializarCPC
                           4383 ;src/main.c:869: menuInicio();
   7D69 CD 71 4F      [17] 4384 	call	_menuInicio
                           4385 ;src/main.c:871: inicializarJuego();
   7D6C CD EE 7C      [17] 4386 	call	_inicializarJuego
                           4387 ;src/main.c:875: while (1) {
   7D6F                    4388 00119$:
                           4389 ;src/main.c:878: actual = enemy;
                           4390 ;src/main.c:880: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D6F 21 00 01      [10] 4391 	ld	hl,#_g_tablatrans
   7D72 E5            [11] 4392 	push	hl
   7D73 2A D5 63      [16] 4393 	ld	hl,(_mapa)
   7D76 E5            [11] 4394 	push	hl
   7D77 21 F8 62      [10] 4395 	ld	hl,#_prota
   7D7A E5            [11] 4396 	push	hl
   7D7B 21 00 63      [10] 4397 	ld	hl,#_cu
   7D7E E5            [11] 4398 	push	hl
   7D7F CD D9 64      [17] 4399 	call	_comprobarTeclado
   7D82 21 08 00      [10] 4400 	ld	hl,#8
   7D85 39            [11] 4401 	add	hl,sp
   7D86 F9            [ 6] 4402 	ld	sp,hl
                           4403 ;src/main.c:881: moverCuchillo(&cu, mapa);
   7D87 2A D5 63      [16] 4404 	ld	hl,(_mapa)
   7D8A E5            [11] 4405 	push	hl
   7D8B 21 00 63      [10] 4406 	ld	hl,#_cu
   7D8E E5            [11] 4407 	push	hl
   7D8F CD 15 43      [17] 4408 	call	_moverCuchillo
   7D92 F1            [10] 4409 	pop	af
   7D93 F1            [10] 4410 	pop	af
                           4411 ;src/main.c:882: while(i){
   7D94 DD 36 FD 02   [19] 4412 	ld	-3 (ix),#0x02
   7D98 DD 36 FE 70   [19] 4413 	ld	-2 (ix),#<(_enemy)
   7D9C DD 36 FF 5F   [19] 4414 	ld	-1 (ix),#>(_enemy)
   7DA0                    4415 00101$:
   7DA0 DD 7E FD      [19] 4416 	ld	a,-3 (ix)
   7DA3 B7            [ 4] 4417 	or	a, a
   7DA4 28 20         [12] 4418 	jr	Z,00103$
                           4419 ;src/main.c:883: --i;
   7DA6 DD 35 FD      [23] 4420 	dec	-3 (ix)
                           4421 ;src/main.c:884: updateEnemy(actual);
   7DA9 DD 6E FE      [19] 4422 	ld	l,-2 (ix)
   7DAC DD 66 FF      [19] 4423 	ld	h,-1 (ix)
   7DAF E5            [11] 4424 	push	hl
   7DB0 CD 4C 79      [17] 4425 	call	_updateEnemy
   7DB3 F1            [10] 4426 	pop	af
                           4427 ;src/main.c:885: ++actual;
   7DB4 DD 7E FE      [19] 4428 	ld	a,-2 (ix)
   7DB7 C6 E2         [ 7] 4429 	add	a, #0xE2
   7DB9 DD 77 FE      [19] 4430 	ld	-2 (ix),a
   7DBC DD 7E FF      [19] 4431 	ld	a,-1 (ix)
   7DBF CE 00         [ 7] 4432 	adc	a, #0x00
   7DC1 DD 77 FF      [19] 4433 	ld	-1 (ix),a
   7DC4 18 DA         [12] 4434 	jr	00101$
   7DC6                    4435 00103$:
                           4436 ;src/main.c:888: cpct_waitVSYNC();
   7DC6 CD B7 55      [17] 4437 	call	_cpct_waitVSYNC
                           4438 ;src/main.c:891: if (prota.mover) {
   7DC9 01 FE 62      [10] 4439 	ld	bc,#_prota + 6
   7DCC 0A            [ 7] 4440 	ld	a,(bc)
   7DCD B7            [ 4] 4441 	or	a, a
   7DCE 28 07         [12] 4442 	jr	Z,00105$
                           4443 ;src/main.c:892: redibujarProta();
   7DD0 C5            [11] 4444 	push	bc
   7DD1 CD C5 64      [17] 4445 	call	_redibujarProta
   7DD4 C1            [10] 4446 	pop	bc
                           4447 ;src/main.c:893: prota.mover = NO;
   7DD5 AF            [ 4] 4448 	xor	a, a
   7DD6 02            [ 7] 4449 	ld	(bc),a
   7DD7                    4450 00105$:
                           4451 ;src/main.c:895: if(cu.lanzado && cu.mover){
   7DD7 21 06 63      [10] 4452 	ld	hl, #(_cu + 0x0006) + 0
   7DDA 4E            [ 7] 4453 	ld	c,(hl)
                           4454 ;src/main.c:896: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4455 ;src/main.c:895: if(cu.lanzado && cu.mover){
   7DDB 79            [ 4] 4456 	ld	a,c
   7DDC B7            [ 4] 4457 	or	a, a
   7DDD 28 30         [12] 4458 	jr	Z,00110$
   7DDF 3A 09 63      [13] 4459 	ld	a, (#(_cu + 0x0009) + 0)
   7DE2 B7            [ 4] 4460 	or	a, a
   7DE3 28 2A         [12] 4461 	jr	Z,00110$
                           4462 ;src/main.c:896: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7DE5 21 01 63      [10] 4463 	ld	hl, #(_cu + 0x0001) + 0
   7DE8 4E            [ 7] 4464 	ld	c,(hl)
   7DE9 21 00 63      [10] 4465 	ld	hl, #_cu + 0
   7DEC 46            [ 7] 4466 	ld	b,(hl)
   7DED 21 08 63      [10] 4467 	ld	hl, #(_cu + 0x0008) + 0
   7DF0 5E            [ 7] 4468 	ld	e,(hl)
   7DF1 2A D5 63      [16] 4469 	ld	hl,(_mapa)
   7DF4 E5            [11] 4470 	push	hl
   7DF5 21 00 01      [10] 4471 	ld	hl,#_g_tablatrans
   7DF8 E5            [11] 4472 	push	hl
   7DF9 21 00 63      [10] 4473 	ld	hl,#_cu
   7DFC E5            [11] 4474 	push	hl
   7DFD 79            [ 4] 4475 	ld	a,c
   7DFE F5            [11] 4476 	push	af
   7DFF 33            [ 6] 4477 	inc	sp
   7E00 C5            [11] 4478 	push	bc
   7E01 33            [ 6] 4479 	inc	sp
   7E02 7B            [ 4] 4480 	ld	a,e
   7E03 F5            [11] 4481 	push	af
   7E04 33            [ 6] 4482 	inc	sp
   7E05 CD 25 40      [17] 4483 	call	_redibujarCuchillo
   7E08 21 09 00      [10] 4484 	ld	hl,#9
   7E0B 39            [11] 4485 	add	hl,sp
   7E0C F9            [ 6] 4486 	ld	sp,hl
   7E0D 18 28         [12] 4487 	jr	00111$
   7E0F                    4488 00110$:
                           4489 ;src/main.c:897: }else if (cu.lanzado && !cu.mover){
   7E0F 79            [ 4] 4490 	ld	a,c
   7E10 B7            [ 4] 4491 	or	a, a
   7E11 28 24         [12] 4492 	jr	Z,00111$
   7E13 3A 09 63      [13] 4493 	ld	a, (#(_cu + 0x0009) + 0)
   7E16 B7            [ 4] 4494 	or	a, a
   7E17 20 1E         [12] 4495 	jr	NZ,00111$
                           4496 ;src/main.c:898: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E19 21 01 63      [10] 4497 	ld	hl, #(_cu + 0x0001) + 0
   7E1C 46            [ 7] 4498 	ld	b,(hl)
   7E1D 21 00 63      [10] 4499 	ld	hl, #_cu + 0
   7E20 4E            [ 7] 4500 	ld	c,(hl)
   7E21 21 08 63      [10] 4501 	ld	hl, #(_cu + 0x0008) + 0
   7E24 56            [ 7] 4502 	ld	d,(hl)
   7E25 2A D5 63      [16] 4503 	ld	hl,(_mapa)
   7E28 E5            [11] 4504 	push	hl
   7E29 C5            [11] 4505 	push	bc
   7E2A D5            [11] 4506 	push	de
   7E2B 33            [ 6] 4507 	inc	sp
   7E2C CD 92 3F      [17] 4508 	call	_borrarCuchillo
   7E2F F1            [10] 4509 	pop	af
   7E30 F1            [10] 4510 	pop	af
   7E31 33            [ 6] 4511 	inc	sp
                           4512 ;src/main.c:899: cu.lanzado = NO;
   7E32 21 06 63      [10] 4513 	ld	hl,#(_cu + 0x0006)
   7E35 36 00         [10] 4514 	ld	(hl),#0x00
   7E37                    4515 00111$:
                           4516 ;src/main.c:903: actual = enemy;
   7E37 01 70 5F      [10] 4517 	ld	bc,#_enemy
                           4518 ;src/main.c:904: while(i){
   7E3A DD 36 FD 02   [19] 4519 	ld	-3 (ix),#0x02
   7E3E                    4520 00115$:
   7E3E DD 7E FD      [19] 4521 	ld	a,-3 (ix)
   7E41 B7            [ 4] 4522 	or	a, a
   7E42 28 2C         [12] 4523 	jr	Z,00117$
                           4524 ;src/main.c:906: --i;
   7E44 DD 35 FD      [23] 4525 	dec	-3 (ix)
                           4526 ;src/main.c:907: if(actual->mover){
   7E47 C5            [11] 4527 	push	bc
   7E48 FD E1         [14] 4528 	pop	iy
   7E4A FD 7E 06      [19] 4529 	ld	a,6 (iy)
   7E4D B7            [ 4] 4530 	or	a, a
   7E4E 28 18         [12] 4531 	jr	Z,00114$
                           4532 ;src/main.c:908: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7E50 69            [ 4] 4533 	ld	l, c
   7E51 60            [ 4] 4534 	ld	h, b
   7E52 23            [ 6] 4535 	inc	hl
   7E53 23            [ 6] 4536 	inc	hl
   7E54 23            [ 6] 4537 	inc	hl
   7E55 5E            [ 7] 4538 	ld	e,(hl)
   7E56 69            [ 4] 4539 	ld	l, c
   7E57 60            [ 4] 4540 	ld	h, b
   7E58 23            [ 6] 4541 	inc	hl
   7E59 23            [ 6] 4542 	inc	hl
   7E5A 56            [ 7] 4543 	ld	d,(hl)
   7E5B C5            [11] 4544 	push	bc
   7E5C C5            [11] 4545 	push	bc
   7E5D 7B            [ 4] 4546 	ld	a,e
   7E5E F5            [11] 4547 	push	af
   7E5F 33            [ 6] 4548 	inc	sp
   7E60 D5            [11] 4549 	push	de
   7E61 33            [ 6] 4550 	inc	sp
   7E62 CD 0F 68      [17] 4551 	call	_redibujarEnemigo
   7E65 F1            [10] 4552 	pop	af
   7E66 F1            [10] 4553 	pop	af
   7E67 C1            [10] 4554 	pop	bc
   7E68                    4555 00114$:
                           4556 ;src/main.c:921: ++actual;
   7E68 21 E2 00      [10] 4557 	ld	hl,#0x00E2
   7E6B 09            [11] 4558 	add	hl,bc
   7E6C 4D            [ 4] 4559 	ld	c,l
   7E6D 44            [ 4] 4560 	ld	b,h
   7E6E 18 CE         [12] 4561 	jr	00115$
   7E70                    4562 00117$:
                           4563 ;src/main.c:923: cpct_waitVSYNC();
   7E70 CD B7 55      [17] 4564 	call	_cpct_waitVSYNC
   7E73 C3 6F 7D      [10] 4565 	jp	00119$
                           4566 	.area _CODE
                           4567 	.area _INITIALIZER
   63DA                    4568 __xinit__mapa:
   63DA 00 00              4569 	.dw #0x0000
   63DC                    4570 __xinit__num_mapa:
   63DC 00                 4571 	.db #0x00	; 0
   63DD                    4572 __xinit__puntuacion:
   63DD 00                 4573 	.db #0x00	; 0
   63DE                    4574 __xinit__vidas:
   63DE 05                 4575 	.db #0x05	; 5
                           4576 	.area _CABS (ABS)
