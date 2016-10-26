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
   63FF 5A                  195 	.db #0x5A	; 90	'Z'
   6400 72                  196 	.db #0x72	; 114	'r'
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
   64EA C2 2A 7C      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:148: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64ED 21 00 02      [10]  380 	ld	hl,#0x0200
   64F0 CD 16 53      [17]  381 	call	_cpct_isKeyPressed
   64F3 7D            [ 4]  382 	ld	a,l
   64F4 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:149: moverDerecha();
   64F5 C2 4F 7C      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64F8 21 00 01      [10]  387 	ld	hl,#0x0100
   64FB CD 16 53      [17]  388 	call	_cpct_isKeyPressed
   64FE 7D            [ 4]  389 	ld	a,l
   64FF B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:151: moverArriba();
   6500 C2 94 7C      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6503 21 00 04      [10]  394 	ld	hl,#0x0400
   6506 CD 16 53      [17]  395 	call	_cpct_isKeyPressed
   6509 7D            [ 4]  396 	ld	a,l
   650A B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:153: moverAbajo();
   650B C2 B8 7C      [10]  399 	jp	NZ,_moverAbajo
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
                           2136 ;src/main.c:450: enemy->inRange = NO;
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
                           2163 ;src/main.c:454: enemy->inRange = 1;
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
   7004 21 F4 FF      [10] 2255 	ld	hl,#-12
   7007 39            [11] 2256 	add	hl,sp
   7008 F9            [ 6] 2257 	ld	sp,hl
                           2258 ;src/main.c:468: if(!actual->muerto){
   7009 DD 4E 04      [19] 2259 	ld	c,4 (ix)
   700C DD 46 05      [19] 2260 	ld	b,5 (ix)
   700F C5            [11] 2261 	push	bc
   7010 FD E1         [14] 2262 	pop	iy
   7012 FD 7E 08      [19] 2263 	ld	a, 8 (iy)
   7015 B7            [ 4] 2264 	or	a, a
   7016 C2 C0 71      [10] 2265 	jp	NZ,00116$
                           2266 ;src/main.c:471: if (!actual->reversePatrol) {
   7019 21 0C 00      [10] 2267 	ld	hl,#0x000C
   701C 09            [11] 2268 	add	hl,bc
   701D EB            [ 4] 2269 	ex	de,hl
   701E 1A            [ 7] 2270 	ld	a,(de)
   701F B7            [ 4] 2271 	or	a, a
   7020 C2 C0 71      [10] 2272 	jp	NZ,00116$
                           2273 ;src/main.c:472: if(actual->iter < actual->longitud_camino){
   7023 21 0E 00      [10] 2274 	ld	hl,#0x000E
   7026 09            [11] 2275 	add	hl,bc
   7027 DD 75 FC      [19] 2276 	ld	-4 (ix),l
   702A DD 74 FD      [19] 2277 	ld	-3 (ix),h
   702D DD 6E FC      [19] 2278 	ld	l,-4 (ix)
   7030 DD 66 FD      [19] 2279 	ld	h,-3 (ix)
   7033 7E            [ 7] 2280 	ld	a,(hl)
   7034 DD 77 FA      [19] 2281 	ld	-6 (ix),a
   7037 23            [ 6] 2282 	inc	hl
   7038 7E            [ 7] 2283 	ld	a,(hl)
   7039 DD 77 FB      [19] 2284 	ld	-5 (ix),a
   703C 69            [ 4] 2285 	ld	l, c
   703D 60            [ 4] 2286 	ld	h, b
   703E C5            [11] 2287 	push	bc
   703F 01 E1 00      [10] 2288 	ld	bc, #0x00E1
   7042 09            [11] 2289 	add	hl, bc
   7043 C1            [10] 2290 	pop	bc
   7044 6E            [ 7] 2291 	ld	l,(hl)
   7045 26 00         [ 7] 2292 	ld	h,#0x00
                           2293 ;src/main.c:481: actual->y = actual->camino[actual->iter];
   7047 79            [ 4] 2294 	ld	a,c
   7048 C6 01         [ 7] 2295 	add	a, #0x01
   704A DD 77 F8      [19] 2296 	ld	-8 (ix),a
   704D 78            [ 4] 2297 	ld	a,b
   704E CE 00         [ 7] 2298 	adc	a, #0x00
   7050 DD 77 F9      [19] 2299 	ld	-7 (ix),a
                           2300 ;src/main.c:472: if(actual->iter < actual->longitud_camino){
   7053 DD 7E FA      [19] 2301 	ld	a,-6 (ix)
   7056 95            [ 4] 2302 	sub	a, l
   7057 DD 7E FB      [19] 2303 	ld	a,-5 (ix)
   705A 9C            [ 4] 2304 	sbc	a, h
   705B E2 60 70      [10] 2305 	jp	PO, 00142$
   705E EE 80         [ 7] 2306 	xor	a, #0x80
   7060                    2307 00142$:
   7060 F2 F5 70      [10] 2308 	jp	P,00110$
                           2309 ;src/main.c:477: actual->mover = SI;
   7063 21 06 00      [10] 2310 	ld	hl,#0x0006
   7066 09            [11] 2311 	add	hl,bc
                           2312 ;src/main.c:479: actual->x = actual->camino[actual->iter];
   7067 79            [ 4] 2313 	ld	a,c
   7068 C6 19         [ 7] 2314 	add	a, #0x19
   706A 5F            [ 4] 2315 	ld	e,a
   706B 78            [ 4] 2316 	ld	a,b
   706C CE 00         [ 7] 2317 	adc	a, #0x00
   706E 57            [ 4] 2318 	ld	d,a
                           2319 ;src/main.c:475: if(actual->iter == 0){
   706F DD 7E FB      [19] 2320 	ld	a,-5 (ix)
   7072 DD B6 FA      [19] 2321 	or	a,-6 (ix)
   7075 20 45         [12] 2322 	jr	NZ,00102$
                           2323 ;src/main.c:477: actual->mover = SI;
   7077 36 01         [10] 2324 	ld	(hl),#0x01
                           2325 ;src/main.c:478: actual->iter = 2;
   7079 DD 6E FC      [19] 2326 	ld	l,-4 (ix)
   707C DD 66 FD      [19] 2327 	ld	h,-3 (ix)
   707F 36 02         [10] 2328 	ld	(hl),#0x02
   7081 23            [ 6] 2329 	inc	hl
   7082 36 00         [10] 2330 	ld	(hl),#0x00
                           2331 ;src/main.c:479: actual->x = actual->camino[actual->iter];
   7084 DD 6E FC      [19] 2332 	ld	l,-4 (ix)
   7087 DD 66 FD      [19] 2333 	ld	h,-3 (ix)
   708A 7E            [ 7] 2334 	ld	a, (hl)
   708B 23            [ 6] 2335 	inc	hl
   708C 66            [ 7] 2336 	ld	h,(hl)
   708D 6F            [ 4] 2337 	ld	l,a
   708E 19            [11] 2338 	add	hl,de
   708F 7E            [ 7] 2339 	ld	a,(hl)
   7090 02            [ 7] 2340 	ld	(bc),a
                           2341 ;src/main.c:480: ++actual->iter;
   7091 DD 6E FC      [19] 2342 	ld	l,-4 (ix)
   7094 DD 66 FD      [19] 2343 	ld	h,-3 (ix)
   7097 4E            [ 7] 2344 	ld	c,(hl)
   7098 23            [ 6] 2345 	inc	hl
   7099 46            [ 7] 2346 	ld	b,(hl)
   709A 03            [ 6] 2347 	inc	bc
   709B DD 6E FC      [19] 2348 	ld	l,-4 (ix)
   709E DD 66 FD      [19] 2349 	ld	h,-3 (ix)
   70A1 71            [ 7] 2350 	ld	(hl),c
   70A2 23            [ 6] 2351 	inc	hl
   70A3 70            [ 7] 2352 	ld	(hl),b
                           2353 ;src/main.c:481: actual->y = actual->camino[actual->iter];
   70A4 69            [ 4] 2354 	ld	l, c
   70A5 60            [ 4] 2355 	ld	h, b
   70A6 19            [11] 2356 	add	hl,de
   70A7 5E            [ 7] 2357 	ld	e,(hl)
   70A8 DD 6E F8      [19] 2358 	ld	l,-8 (ix)
   70AB DD 66 F9      [19] 2359 	ld	h,-7 (ix)
   70AE 73            [ 7] 2360 	ld	(hl),e
                           2361 ;src/main.c:482: ++actual->iter;
   70AF 03            [ 6] 2362 	inc	bc
   70B0 DD 6E FC      [19] 2363 	ld	l,-4 (ix)
   70B3 DD 66 FD      [19] 2364 	ld	h,-3 (ix)
   70B6 71            [ 7] 2365 	ld	(hl),c
   70B7 23            [ 6] 2366 	inc	hl
   70B8 70            [ 7] 2367 	ld	(hl),b
   70B9 C3 C0 71      [10] 2368 	jp	00116$
   70BC                    2369 00102$:
                           2370 ;src/main.c:485: actual->mover = SI;
   70BC 36 01         [10] 2371 	ld	(hl),#0x01
                           2372 ;src/main.c:486: actual->x = actual->camino[actual->iter];
   70BE DD 6E FC      [19] 2373 	ld	l,-4 (ix)
   70C1 DD 66 FD      [19] 2374 	ld	h,-3 (ix)
   70C4 7E            [ 7] 2375 	ld	a, (hl)
   70C5 23            [ 6] 2376 	inc	hl
   70C6 66            [ 7] 2377 	ld	h,(hl)
   70C7 6F            [ 4] 2378 	ld	l,a
   70C8 19            [11] 2379 	add	hl,de
   70C9 7E            [ 7] 2380 	ld	a,(hl)
   70CA 02            [ 7] 2381 	ld	(bc),a
                           2382 ;src/main.c:487: ++actual->iter;
   70CB DD 6E FC      [19] 2383 	ld	l,-4 (ix)
   70CE DD 66 FD      [19] 2384 	ld	h,-3 (ix)
   70D1 4E            [ 7] 2385 	ld	c,(hl)
   70D2 23            [ 6] 2386 	inc	hl
   70D3 46            [ 7] 2387 	ld	b,(hl)
   70D4 03            [ 6] 2388 	inc	bc
   70D5 DD 6E FC      [19] 2389 	ld	l,-4 (ix)
   70D8 DD 66 FD      [19] 2390 	ld	h,-3 (ix)
   70DB 71            [ 7] 2391 	ld	(hl),c
   70DC 23            [ 6] 2392 	inc	hl
   70DD 70            [ 7] 2393 	ld	(hl),b
                           2394 ;src/main.c:488: actual->y = actual->camino[actual->iter];
   70DE EB            [ 4] 2395 	ex	de,hl
   70DF 09            [11] 2396 	add	hl,bc
   70E0 5E            [ 7] 2397 	ld	e,(hl)
   70E1 DD 6E F8      [19] 2398 	ld	l,-8 (ix)
   70E4 DD 66 F9      [19] 2399 	ld	h,-7 (ix)
   70E7 73            [ 7] 2400 	ld	(hl),e
                           2401 ;src/main.c:489: ++actual->iter;
   70E8 03            [ 6] 2402 	inc	bc
   70E9 DD 6E FC      [19] 2403 	ld	l,-4 (ix)
   70EC DD 66 FD      [19] 2404 	ld	h,-3 (ix)
   70EF 71            [ 7] 2405 	ld	(hl),c
   70F0 23            [ 6] 2406 	inc	hl
   70F1 70            [ 7] 2407 	ld	(hl),b
   70F2 C3 C0 71      [10] 2408 	jp	00116$
   70F5                    2409 00110$:
                           2410 ;src/main.c:494: actual->seek = 0;
   70F5 21 14 00      [10] 2411 	ld	hl,#0x0014
   70F8 09            [11] 2412 	add	hl,bc
   70F9 DD 75 FA      [19] 2413 	ld	-6 (ix),l
   70FC DD 74 FB      [19] 2414 	ld	-5 (ix),h
   70FF DD 6E FA      [19] 2415 	ld	l,-6 (ix)
   7102 DD 66 FB      [19] 2416 	ld	h,-5 (ix)
   7105 36 00         [10] 2417 	ld	(hl),#0x00
                           2418 ;src/main.c:495: lookFor(actual);
   7107 C5            [11] 2419 	push	bc
   7108 D5            [11] 2420 	push	de
   7109 C5            [11] 2421 	push	bc
   710A CD E4 6E      [17] 2422 	call	_lookFor
   710D F1            [10] 2423 	pop	af
   710E D1            [10] 2424 	pop	de
   710F C1            [10] 2425 	pop	bc
                           2426 ;src/main.c:496: actual->reversePatrol = NO;
   7110 AF            [ 4] 2427 	xor	a, a
   7111 12            [ 7] 2428 	ld	(de),a
                           2429 ;src/main.c:497: if(!actual->seen){
   7112 C5            [11] 2430 	push	bc
   7113 FD E1         [14] 2431 	pop	iy
   7115 FD 6E 12      [19] 2432 	ld	l,18 (iy)
                           2433 ;src/main.c:498: actual->patrolling = 1;
   7118 79            [ 4] 2434 	ld	a,c
   7119 C6 0B         [ 7] 2435 	add	a, #0x0B
   711B DD 77 F6      [19] 2436 	ld	-10 (ix),a
   711E 78            [ 4] 2437 	ld	a,b
   711F CE 00         [ 7] 2438 	adc	a, #0x00
   7121 DD 77 F7      [19] 2439 	ld	-9 (ix),a
                           2440 ;src/main.c:499: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7124 79            [ 4] 2441 	ld	a,c
   7125 C6 18         [ 7] 2442 	add	a, #0x18
   7127 DD 77 F4      [19] 2443 	ld	-12 (ix),a
   712A 78            [ 4] 2444 	ld	a,b
   712B CE 00         [ 7] 2445 	adc	a, #0x00
   712D DD 77 F5      [19] 2446 	ld	-11 (ix),a
   7130 79            [ 4] 2447 	ld	a,c
   7131 C6 17         [ 7] 2448 	add	a, #0x17
   7133 5F            [ 4] 2449 	ld	e,a
   7134 78            [ 4] 2450 	ld	a,b
   7135 CE 00         [ 7] 2451 	adc	a, #0x00
   7137 57            [ 4] 2452 	ld	d,a
                           2453 ;src/main.c:497: if(!actual->seen){
   7138 7D            [ 4] 2454 	ld	a,l
   7139 B7            [ 4] 2455 	or	a, a
   713A 20 35         [12] 2456 	jr	NZ,00107$
                           2457 ;src/main.c:498: actual->patrolling = 1;
   713C DD 6E F6      [19] 2458 	ld	l,-10 (ix)
   713F DD 66 F7      [19] 2459 	ld	h,-9 (ix)
   7142 36 01         [10] 2460 	ld	(hl),#0x01
                           2461 ;src/main.c:499: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7144 E1            [10] 2462 	pop	hl
   7145 E5            [11] 2463 	push	hl
   7146 7E            [ 7] 2464 	ld	a,(hl)
   7147 DD 77 FF      [19] 2465 	ld	-1 (ix),a
   714A 1A            [ 7] 2466 	ld	a,(de)
   714B 57            [ 4] 2467 	ld	d,a
   714C DD 6E F8      [19] 2468 	ld	l,-8 (ix)
   714F DD 66 F9      [19] 2469 	ld	h,-7 (ix)
   7152 5E            [ 7] 2470 	ld	e,(hl)
   7153 0A            [ 7] 2471 	ld	a,(bc)
   7154 DD 77 FE      [19] 2472 	ld	-2 (ix),a
   7157 2A D5 63      [16] 2473 	ld	hl,(_mapa)
   715A E5            [11] 2474 	push	hl
   715B C5            [11] 2475 	push	bc
   715C DD 7E FF      [19] 2476 	ld	a,-1 (ix)
   715F F5            [11] 2477 	push	af
   7160 33            [ 6] 2478 	inc	sp
   7161 D5            [11] 2479 	push	de
   7162 DD 7E FE      [19] 2480 	ld	a,-2 (ix)
   7165 F5            [11] 2481 	push	af
   7166 33            [ 6] 2482 	inc	sp
   7167 CD 82 48      [17] 2483 	call	_pathFinding
   716A 21 08 00      [10] 2484 	ld	hl,#8
   716D 39            [11] 2485 	add	hl,sp
   716E F9            [ 6] 2486 	ld	sp,hl
   716F 18 45         [12] 2487 	jr	00108$
   7171                    2488 00107$:
                           2489 ;src/main.c:501: actual->patrolling = 0;
   7171 DD 6E F6      [19] 2490 	ld	l,-10 (ix)
   7174 DD 66 F7      [19] 2491 	ld	h,-9 (ix)
   7177 36 00         [10] 2492 	ld	(hl),#0x00
                           2493 ;src/main.c:502: if(!actual->engage){
   7179 C5            [11] 2494 	push	bc
   717A FD E1         [14] 2495 	pop	iy
   717C FD 7E 16      [19] 2496 	ld	a,22 (iy)
   717F B7            [ 4] 2497 	or	a, a
   7180 20 34         [12] 2498 	jr	NZ,00108$
                           2499 ;src/main.c:503: actual->seek = 1;
   7182 DD 6E FA      [19] 2500 	ld	l,-6 (ix)
   7185 DD 66 FB      [19] 2501 	ld	h,-5 (ix)
   7188 36 01         [10] 2502 	ld	(hl),#0x01
                           2503 ;src/main.c:504: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   718A E1            [10] 2504 	pop	hl
   718B E5            [11] 2505 	push	hl
   718C 7E            [ 7] 2506 	ld	a,(hl)
   718D DD 77 FE      [19] 2507 	ld	-2 (ix),a
   7190 1A            [ 7] 2508 	ld	a,(de)
   7191 DD 77 FF      [19] 2509 	ld	-1 (ix),a
   7194 DD 6E F8      [19] 2510 	ld	l,-8 (ix)
   7197 DD 66 F9      [19] 2511 	ld	h,-7 (ix)
   719A 5E            [ 7] 2512 	ld	e,(hl)
   719B 0A            [ 7] 2513 	ld	a,(bc)
   719C 57            [ 4] 2514 	ld	d,a
   719D 2A D5 63      [16] 2515 	ld	hl,(_mapa)
   71A0 E5            [11] 2516 	push	hl
   71A1 C5            [11] 2517 	push	bc
   71A2 DD 66 FE      [19] 2518 	ld	h,-2 (ix)
   71A5 DD 6E FF      [19] 2519 	ld	l,-1 (ix)
   71A8 E5            [11] 2520 	push	hl
   71A9 7B            [ 4] 2521 	ld	a,e
   71AA F5            [11] 2522 	push	af
   71AB 33            [ 6] 2523 	inc	sp
   71AC D5            [11] 2524 	push	de
   71AD 33            [ 6] 2525 	inc	sp
   71AE CD 82 48      [17] 2526 	call	_pathFinding
   71B1 21 08 00      [10] 2527 	ld	hl,#8
   71B4 39            [11] 2528 	add	hl,sp
   71B5 F9            [ 6] 2529 	ld	sp,hl
   71B6                    2530 00108$:
                           2531 ;src/main.c:508: actual->iter = 0;
   71B6 DD 6E FC      [19] 2532 	ld	l,-4 (ix)
   71B9 DD 66 FD      [19] 2533 	ld	h,-3 (ix)
   71BC AF            [ 4] 2534 	xor	a, a
   71BD 77            [ 7] 2535 	ld	(hl), a
   71BE 23            [ 6] 2536 	inc	hl
   71BF 77            [ 7] 2537 	ld	(hl), a
   71C0                    2538 00116$:
   71C0 DD F9         [10] 2539 	ld	sp, ix
   71C2 DD E1         [14] 2540 	pop	ix
   71C4 C9            [10] 2541 	ret
                           2542 ;src/main.c:517: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2543 ;	---------------------------------
                           2544 ; Function engage
                           2545 ; ---------------------------------
   71C5                    2546 _engage::
   71C5 DD E5         [15] 2547 	push	ix
   71C7 DD 21 00 00   [14] 2548 	ld	ix,#0
   71CB DD 39         [15] 2549 	add	ix,sp
   71CD 21 F1 FF      [10] 2550 	ld	hl,#-15
   71D0 39            [11] 2551 	add	hl,sp
   71D1 F9            [ 6] 2552 	ld	sp,hl
                           2553 ;src/main.c:518: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71D2 DD 7E 04      [19] 2554 	ld	a,4 (ix)
   71D5 DD 77 F4      [19] 2555 	ld	-12 (ix),a
   71D8 DD 7E 05      [19] 2556 	ld	a,5 (ix)
   71DB DD 77 F5      [19] 2557 	ld	-11 (ix),a
   71DE DD 6E F4      [19] 2558 	ld	l,-12 (ix)
   71E1 DD 66 F5      [19] 2559 	ld	h,-11 (ix)
   71E4 4E            [ 7] 2560 	ld	c,(hl)
   71E5 06 00         [ 7] 2561 	ld	b,#0x00
   71E7 21 F8 62      [10] 2562 	ld	hl,#_prota+0
   71EA 5E            [ 7] 2563 	ld	e,(hl)
   71EB 16 00         [ 7] 2564 	ld	d,#0x00
   71ED 79            [ 4] 2565 	ld	a,c
   71EE 93            [ 4] 2566 	sub	a, e
   71EF 4F            [ 4] 2567 	ld	c,a
   71F0 78            [ 4] 2568 	ld	a,b
   71F1 9A            [ 4] 2569 	sbc	a, d
   71F2 47            [ 4] 2570 	ld	b,a
   71F3 C5            [11] 2571 	push	bc
   71F4 CD 70 4A      [17] 2572 	call	_abs
   71F7 F1            [10] 2573 	pop	af
   71F8 4D            [ 4] 2574 	ld	c,l
                           2575 ;src/main.c:519: u8 dify = abs(enemy->y - prota.y);
   71F9 DD 7E F4      [19] 2576 	ld	a,-12 (ix)
   71FC C6 01         [ 7] 2577 	add	a, #0x01
   71FE DD 77 F6      [19] 2578 	ld	-10 (ix),a
   7201 DD 7E F5      [19] 2579 	ld	a,-11 (ix)
   7204 CE 00         [ 7] 2580 	adc	a, #0x00
   7206 DD 77 F7      [19] 2581 	ld	-9 (ix),a
   7209 DD 6E F6      [19] 2582 	ld	l,-10 (ix)
   720C DD 66 F7      [19] 2583 	ld	h,-9 (ix)
   720F 5E            [ 7] 2584 	ld	e,(hl)
   7210 16 00         [ 7] 2585 	ld	d,#0x00
   7212 21 F9 62      [10] 2586 	ld	hl, #_prota + 1
   7215 6E            [ 7] 2587 	ld	l,(hl)
   7216 26 00         [ 7] 2588 	ld	h,#0x00
   7218 7B            [ 4] 2589 	ld	a,e
   7219 95            [ 4] 2590 	sub	a, l
   721A 5F            [ 4] 2591 	ld	e,a
   721B 7A            [ 4] 2592 	ld	a,d
   721C 9C            [ 4] 2593 	sbc	a, h
   721D 57            [ 4] 2594 	ld	d,a
   721E C5            [11] 2595 	push	bc
   721F D5            [11] 2596 	push	de
   7220 CD 70 4A      [17] 2597 	call	_abs
   7223 F1            [10] 2598 	pop	af
   7224 C1            [10] 2599 	pop	bc
                           2600 ;src/main.c:520: u8 dist = difx + dify; // manhattan
   7225 09            [11] 2601 	add	hl, bc
   7226 DD 75 F3      [19] 2602 	ld	-13 (ix),l
                           2603 ;src/main.c:522: u8 movX = 0;
   7229 DD 36 F2 00   [19] 2604 	ld	-14 (ix),#0x00
                           2605 ;src/main.c:523: u8 movY = 0;
   722D DD 36 F1 00   [19] 2606 	ld	-15 (ix),#0x00
                           2607 ;src/main.c:524: u8 distConstraint = 25;
   7231 0E 19         [ 7] 2608 	ld	c,#0x19
                           2609 ;src/main.c:525: enemy->mover = NO;
   7233 DD 7E F4      [19] 2610 	ld	a,-12 (ix)
   7236 C6 06         [ 7] 2611 	add	a, #0x06
   7238 DD 77 F8      [19] 2612 	ld	-8 (ix),a
   723B DD 7E F5      [19] 2613 	ld	a,-11 (ix)
   723E CE 00         [ 7] 2614 	adc	a, #0x00
   7240 DD 77 F9      [19] 2615 	ld	-7 (ix),a
   7243 DD 6E F8      [19] 2616 	ld	l,-8 (ix)
   7246 DD 66 F9      [19] 2617 	ld	h,-7 (ix)
   7249 36 00         [10] 2618 	ld	(hl),#0x00
                           2619 ;src/main.c:527: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   724B DD 6E F6      [19] 2620 	ld	l,-10 (ix)
   724E DD 66 F7      [19] 2621 	ld	h,-9 (ix)
   7251 7E            [ 7] 2622 	ld	a,(hl)
   7252 DD 77 FA      [19] 2623 	ld	-6 (ix),a
                           2624 ;src/main.c:518: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7255 DD 6E F4      [19] 2625 	ld	l,-12 (ix)
   7258 DD 66 F5      [19] 2626 	ld	h,-11 (ix)
   725B 46            [ 7] 2627 	ld	b,(hl)
                           2628 ;src/main.c:540: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   725C 78            [ 4] 2629 	ld	a,b
   725D C6 04         [ 7] 2630 	add	a, #0x04
   725F DD 77 FB      [19] 2631 	ld	-5 (ix),a
                           2632 ;src/main.c:527: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7262 DD 7E 07      [19] 2633 	ld	a,7 (ix)
   7265 DD 96 FA      [19] 2634 	sub	a, -6 (ix)
   7268 28 38         [12] 2635 	jr	Z,00194$
   726A DD 5E 07      [19] 2636 	ld	e,7 (ix)
   726D 16 00         [ 7] 2637 	ld	d,#0x00
   726F 21 01 00      [10] 2638 	ld	hl,#0x0001
   7272 19            [11] 2639 	add	hl,de
   7273 DD 75 FC      [19] 2640 	ld	-4 (ix),l
   7276 DD 74 FD      [19] 2641 	ld	-3 (ix),h
   7279 DD 7E FA      [19] 2642 	ld	a,-6 (ix)
   727C DD 77 FE      [19] 2643 	ld	-2 (ix),a
   727F DD 36 FF 00   [19] 2644 	ld	-1 (ix),#0x00
   7283 DD 7E FE      [19] 2645 	ld	a,-2 (ix)
   7286 DD 96 FC      [19] 2646 	sub	a, -4 (ix)
   7289 20 08         [12] 2647 	jr	NZ,00422$
   728B DD 7E FF      [19] 2648 	ld	a,-1 (ix)
   728E DD 96 FD      [19] 2649 	sub	a, -3 (ix)
   7291 28 0F         [12] 2650 	jr	Z,00194$
   7293                    2651 00422$:
   7293 1B            [ 6] 2652 	dec	de
   7294 DD 7E FE      [19] 2653 	ld	a,-2 (ix)
   7297 93            [ 4] 2654 	sub	a, e
   7298 C2 AB 73      [10] 2655 	jp	NZ,00195$
   729B DD 7E FF      [19] 2656 	ld	a,-1 (ix)
   729E 92            [ 4] 2657 	sub	a, d
   729F C2 AB 73      [10] 2658 	jp	NZ,00195$
   72A2                    2659 00194$:
                           2660 ;src/main.c:528: if (dx < enemy->x) { // izquierda
   72A2 DD 7E 06      [19] 2661 	ld	a,6 (ix)
   72A5 90            [ 4] 2662 	sub	a, b
   72A6 D2 28 73      [10] 2663 	jp	NC,00114$
                           2664 ;src/main.c:529: if (dist > 11) {
   72A9 3E 0B         [ 7] 2665 	ld	a,#0x0B
   72AB DD 96 F3      [19] 2666 	sub	a, -13 (ix)
   72AE D2 6B 79      [10] 2667 	jp	NC,00199$
                           2668 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   72B1 DD 7E FA      [19] 2669 	ld	a,-6 (ix)
   72B4 F5            [11] 2670 	push	af
   72B5 33            [ 6] 2671 	inc	sp
   72B6 C5            [11] 2672 	push	bc
   72B7 33            [ 6] 2673 	inc	sp
   72B8 2A D5 63      [16] 2674 	ld	hl,(_mapa)
   72BB E5            [11] 2675 	push	hl
   72BC CD 2C 4A      [17] 2676 	call	_getTilePtr
   72BF F1            [10] 2677 	pop	af
   72C0 F1            [10] 2678 	pop	af
   72C1 4E            [ 7] 2679 	ld	c,(hl)
   72C2 3E 02         [ 7] 2680 	ld	a,#0x02
   72C4 91            [ 4] 2681 	sub	a, c
   72C5 DA 6B 79      [10] 2682 	jp	C,00199$
                           2683 ;src/main.c:531: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   72C8 DD 6E F6      [19] 2684 	ld	l,-10 (ix)
   72CB DD 66 F7      [19] 2685 	ld	h,-9 (ix)
   72CE 7E            [ 7] 2686 	ld	a,(hl)
   72CF C6 0B         [ 7] 2687 	add	a, #0x0B
   72D1 57            [ 4] 2688 	ld	d,a
   72D2 DD 6E F4      [19] 2689 	ld	l,-12 (ix)
   72D5 DD 66 F5      [19] 2690 	ld	h,-11 (ix)
   72D8 46            [ 7] 2691 	ld	b,(hl)
   72D9 D5            [11] 2692 	push	de
   72DA 33            [ 6] 2693 	inc	sp
   72DB C5            [11] 2694 	push	bc
   72DC 33            [ 6] 2695 	inc	sp
   72DD 2A D5 63      [16] 2696 	ld	hl,(_mapa)
   72E0 E5            [11] 2697 	push	hl
   72E1 CD 2C 4A      [17] 2698 	call	_getTilePtr
   72E4 F1            [10] 2699 	pop	af
   72E5 F1            [10] 2700 	pop	af
   72E6 4E            [ 7] 2701 	ld	c,(hl)
   72E7 3E 02         [ 7] 2702 	ld	a,#0x02
   72E9 91            [ 4] 2703 	sub	a, c
   72EA DA 6B 79      [10] 2704 	jp	C,00199$
                           2705 ;src/main.c:532: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   72ED DD 6E F6      [19] 2706 	ld	l,-10 (ix)
   72F0 DD 66 F7      [19] 2707 	ld	h,-9 (ix)
   72F3 7E            [ 7] 2708 	ld	a,(hl)
   72F4 C6 16         [ 7] 2709 	add	a, #0x16
   72F6 57            [ 4] 2710 	ld	d,a
   72F7 DD 6E F4      [19] 2711 	ld	l,-12 (ix)
   72FA DD 66 F5      [19] 2712 	ld	h,-11 (ix)
   72FD 46            [ 7] 2713 	ld	b,(hl)
   72FE D5            [11] 2714 	push	de
   72FF 33            [ 6] 2715 	inc	sp
   7300 C5            [11] 2716 	push	bc
   7301 33            [ 6] 2717 	inc	sp
   7302 2A D5 63      [16] 2718 	ld	hl,(_mapa)
   7305 E5            [11] 2719 	push	hl
   7306 CD 2C 4A      [17] 2720 	call	_getTilePtr
   7309 F1            [10] 2721 	pop	af
   730A F1            [10] 2722 	pop	af
   730B 4E            [ 7] 2723 	ld	c,(hl)
   730C 3E 02         [ 7] 2724 	ld	a,#0x02
   730E 91            [ 4] 2725 	sub	a, c
   730F DA 6B 79      [10] 2726 	jp	C,00199$
                           2727 ;src/main.c:533: moverEnemigoIzquierda(enemy);
   7312 DD 6E F4      [19] 2728 	ld	l,-12 (ix)
   7315 DD 66 F5      [19] 2729 	ld	h,-11 (ix)
   7318 E5            [11] 2730 	push	hl
   7319 CD 89 6C      [17] 2731 	call	_moverEnemigoIzquierda
   731C F1            [10] 2732 	pop	af
                           2733 ;src/main.c:535: enemy->mover = SI;
   731D DD 6E F8      [19] 2734 	ld	l,-8 (ix)
   7320 DD 66 F9      [19] 2735 	ld	h,-7 (ix)
   7323 36 01         [10] 2736 	ld	(hl),#0x01
   7325 C3 6B 79      [10] 2737 	jp	00199$
   7328                    2738 00114$:
                           2739 ;src/main.c:539: if (dist > G_ENEMY_W + 3) {
   7328 3E 07         [ 7] 2740 	ld	a,#0x07
   732A DD 96 F3      [19] 2741 	sub	a, -13 (ix)
   732D D2 6B 79      [10] 2742 	jp	NC,00199$
                           2743 ;src/main.c:540: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7330 DD 66 FA      [19] 2744 	ld	h,-6 (ix)
   7333 DD 6E FB      [19] 2745 	ld	l,-5 (ix)
   7336 E5            [11] 2746 	push	hl
   7337 2A D5 63      [16] 2747 	ld	hl,(_mapa)
   733A E5            [11] 2748 	push	hl
   733B CD 2C 4A      [17] 2749 	call	_getTilePtr
   733E F1            [10] 2750 	pop	af
   733F F1            [10] 2751 	pop	af
   7340 4E            [ 7] 2752 	ld	c,(hl)
   7341 3E 02         [ 7] 2753 	ld	a,#0x02
   7343 91            [ 4] 2754 	sub	a, c
   7344 DA 6B 79      [10] 2755 	jp	C,00199$
                           2756 ;src/main.c:541: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7347 DD 6E F6      [19] 2757 	ld	l,-10 (ix)
   734A DD 66 F7      [19] 2758 	ld	h,-9 (ix)
   734D 7E            [ 7] 2759 	ld	a,(hl)
   734E C6 0B         [ 7] 2760 	add	a, #0x0B
   7350 47            [ 4] 2761 	ld	b,a
   7351 DD 6E F4      [19] 2762 	ld	l,-12 (ix)
   7354 DD 66 F5      [19] 2763 	ld	h,-11 (ix)
   7357 7E            [ 7] 2764 	ld	a,(hl)
   7358 C6 04         [ 7] 2765 	add	a, #0x04
   735A C5            [11] 2766 	push	bc
   735B 33            [ 6] 2767 	inc	sp
   735C F5            [11] 2768 	push	af
   735D 33            [ 6] 2769 	inc	sp
   735E 2A D5 63      [16] 2770 	ld	hl,(_mapa)
   7361 E5            [11] 2771 	push	hl
   7362 CD 2C 4A      [17] 2772 	call	_getTilePtr
   7365 F1            [10] 2773 	pop	af
   7366 F1            [10] 2774 	pop	af
   7367 4E            [ 7] 2775 	ld	c,(hl)
   7368 3E 02         [ 7] 2776 	ld	a,#0x02
   736A 91            [ 4] 2777 	sub	a, c
   736B DA 6B 79      [10] 2778 	jp	C,00199$
                           2779 ;src/main.c:542: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   736E DD 6E F6      [19] 2780 	ld	l,-10 (ix)
   7371 DD 66 F7      [19] 2781 	ld	h,-9 (ix)
   7374 7E            [ 7] 2782 	ld	a,(hl)
   7375 C6 16         [ 7] 2783 	add	a, #0x16
   7377 47            [ 4] 2784 	ld	b,a
   7378 DD 6E F4      [19] 2785 	ld	l,-12 (ix)
   737B DD 66 F5      [19] 2786 	ld	h,-11 (ix)
   737E 7E            [ 7] 2787 	ld	a,(hl)
   737F C6 04         [ 7] 2788 	add	a, #0x04
   7381 C5            [11] 2789 	push	bc
   7382 33            [ 6] 2790 	inc	sp
   7383 F5            [11] 2791 	push	af
   7384 33            [ 6] 2792 	inc	sp
   7385 2A D5 63      [16] 2793 	ld	hl,(_mapa)
   7388 E5            [11] 2794 	push	hl
   7389 CD 2C 4A      [17] 2795 	call	_getTilePtr
   738C F1            [10] 2796 	pop	af
   738D F1            [10] 2797 	pop	af
   738E 4E            [ 7] 2798 	ld	c,(hl)
   738F 3E 02         [ 7] 2799 	ld	a,#0x02
   7391 91            [ 4] 2800 	sub	a, c
   7392 DA 6B 79      [10] 2801 	jp	C,00199$
                           2802 ;src/main.c:543: moverEnemigoDerecha(enemy);
   7395 DD 6E F4      [19] 2803 	ld	l,-12 (ix)
   7398 DD 66 F5      [19] 2804 	ld	h,-11 (ix)
   739B E5            [11] 2805 	push	hl
   739C CD 79 6C      [17] 2806 	call	_moverEnemigoDerecha
   739F F1            [10] 2807 	pop	af
                           2808 ;src/main.c:545: enemy->mover = SI;
   73A0 DD 6E F8      [19] 2809 	ld	l,-8 (ix)
   73A3 DD 66 F9      [19] 2810 	ld	h,-7 (ix)
   73A6 36 01         [10] 2811 	ld	(hl),#0x01
   73A8 C3 6B 79      [10] 2812 	jp	00199$
   73AB                    2813 00195$:
                           2814 ;src/main.c:550: else if (enemy->x == dx) {
   73AB DD 7E 06      [19] 2815 	ld	a,6 (ix)
   73AE 90            [ 4] 2816 	sub	a, b
   73AF C2 C4 74      [10] 2817 	jp	NZ,00192$
                           2818 ;src/main.c:551: if (dy < enemy->y) {
   73B2 DD 7E 07      [19] 2819 	ld	a,7 (ix)
   73B5 DD 96 FA      [19] 2820 	sub	a, -6 (ix)
   73B8 D2 3E 74      [10] 2821 	jp	NC,00129$
                           2822 ;src/main.c:552: if (dist > G_HERO_H + 5) {
   73BB 3E 1B         [ 7] 2823 	ld	a,#0x1B
   73BD DD 96 F3      [19] 2824 	sub	a, -13 (ix)
   73C0 D2 6B 79      [10] 2825 	jp	NC,00199$
                           2826 ;src/main.c:553: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   73C3 DD 56 FA      [19] 2827 	ld	d,-6 (ix)
   73C6 15            [ 4] 2828 	dec	d
   73C7 15            [ 4] 2829 	dec	d
   73C8 D5            [11] 2830 	push	de
   73C9 33            [ 6] 2831 	inc	sp
   73CA C5            [11] 2832 	push	bc
   73CB 33            [ 6] 2833 	inc	sp
   73CC 2A D5 63      [16] 2834 	ld	hl,(_mapa)
   73CF E5            [11] 2835 	push	hl
   73D0 CD 2C 4A      [17] 2836 	call	_getTilePtr
   73D3 F1            [10] 2837 	pop	af
   73D4 F1            [10] 2838 	pop	af
   73D5 4E            [ 7] 2839 	ld	c,(hl)
   73D6 3E 02         [ 7] 2840 	ld	a,#0x02
   73D8 91            [ 4] 2841 	sub	a, c
   73D9 DA 6B 79      [10] 2842 	jp	C,00199$
                           2843 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73DC DD 6E F6      [19] 2844 	ld	l,-10 (ix)
   73DF DD 66 F7      [19] 2845 	ld	h,-9 (ix)
   73E2 56            [ 7] 2846 	ld	d,(hl)
   73E3 15            [ 4] 2847 	dec	d
   73E4 15            [ 4] 2848 	dec	d
   73E5 DD 6E F4      [19] 2849 	ld	l,-12 (ix)
   73E8 DD 66 F5      [19] 2850 	ld	h,-11 (ix)
   73EB 46            [ 7] 2851 	ld	b,(hl)
   73EC 04            [ 4] 2852 	inc	b
   73ED 04            [ 4] 2853 	inc	b
   73EE D5            [11] 2854 	push	de
   73EF 33            [ 6] 2855 	inc	sp
   73F0 C5            [11] 2856 	push	bc
   73F1 33            [ 6] 2857 	inc	sp
   73F2 2A D5 63      [16] 2858 	ld	hl,(_mapa)
   73F5 E5            [11] 2859 	push	hl
   73F6 CD 2C 4A      [17] 2860 	call	_getTilePtr
   73F9 F1            [10] 2861 	pop	af
   73FA F1            [10] 2862 	pop	af
   73FB 4E            [ 7] 2863 	ld	c,(hl)
   73FC 3E 02         [ 7] 2864 	ld	a,#0x02
   73FE 91            [ 4] 2865 	sub	a, c
   73FF DA 6B 79      [10] 2866 	jp	C,00199$
                           2867 ;src/main.c:555: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7402 DD 6E F6      [19] 2868 	ld	l,-10 (ix)
   7405 DD 66 F7      [19] 2869 	ld	h,-9 (ix)
   7408 46            [ 7] 2870 	ld	b,(hl)
   7409 05            [ 4] 2871 	dec	b
   740A 05            [ 4] 2872 	dec	b
   740B DD 6E F4      [19] 2873 	ld	l,-12 (ix)
   740E DD 66 F5      [19] 2874 	ld	h,-11 (ix)
   7411 7E            [ 7] 2875 	ld	a,(hl)
   7412 C6 04         [ 7] 2876 	add	a, #0x04
   7414 C5            [11] 2877 	push	bc
   7415 33            [ 6] 2878 	inc	sp
   7416 F5            [11] 2879 	push	af
   7417 33            [ 6] 2880 	inc	sp
   7418 2A D5 63      [16] 2881 	ld	hl,(_mapa)
   741B E5            [11] 2882 	push	hl
   741C CD 2C 4A      [17] 2883 	call	_getTilePtr
   741F F1            [10] 2884 	pop	af
   7420 F1            [10] 2885 	pop	af
   7421 4E            [ 7] 2886 	ld	c,(hl)
   7422 3E 02         [ 7] 2887 	ld	a,#0x02
   7424 91            [ 4] 2888 	sub	a, c
   7425 DA 6B 79      [10] 2889 	jp	C,00199$
                           2890 ;src/main.c:556: moverEnemigoArriba(enemy);
   7428 DD 6E F4      [19] 2891 	ld	l,-12 (ix)
   742B DD 66 F5      [19] 2892 	ld	h,-11 (ix)
   742E E5            [11] 2893 	push	hl
   742F CD 3B 6C      [17] 2894 	call	_moverEnemigoArriba
   7432 F1            [10] 2895 	pop	af
                           2896 ;src/main.c:558: enemy->mover = SI;
   7433 DD 6E F8      [19] 2897 	ld	l,-8 (ix)
   7436 DD 66 F9      [19] 2898 	ld	h,-7 (ix)
   7439 36 01         [10] 2899 	ld	(hl),#0x01
   743B C3 6B 79      [10] 2900 	jp	00199$
   743E                    2901 00129$:
                           2902 ;src/main.c:562: if(dist > G_ENEMY_H + 7) {
   743E 3E 1D         [ 7] 2903 	ld	a,#0x1D
   7440 DD 96 F3      [19] 2904 	sub	a, -13 (ix)
   7443 D2 6B 79      [10] 2905 	jp	NC,00199$
                           2906 ;src/main.c:563: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7446 DD 7E FA      [19] 2907 	ld	a,-6 (ix)
   7449 C6 18         [ 7] 2908 	add	a, #0x18
   744B 57            [ 4] 2909 	ld	d,a
   744C D5            [11] 2910 	push	de
   744D 33            [ 6] 2911 	inc	sp
   744E C5            [11] 2912 	push	bc
   744F 33            [ 6] 2913 	inc	sp
   7450 2A D5 63      [16] 2914 	ld	hl,(_mapa)
   7453 E5            [11] 2915 	push	hl
   7454 CD 2C 4A      [17] 2916 	call	_getTilePtr
   7457 F1            [10] 2917 	pop	af
   7458 F1            [10] 2918 	pop	af
   7459 4E            [ 7] 2919 	ld	c,(hl)
   745A 3E 02         [ 7] 2920 	ld	a,#0x02
   745C 91            [ 4] 2921 	sub	a, c
   745D DA 6B 79      [10] 2922 	jp	C,00199$
                           2923 ;src/main.c:564: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7460 DD 6E F6      [19] 2924 	ld	l,-10 (ix)
   7463 DD 66 F7      [19] 2925 	ld	h,-9 (ix)
   7466 7E            [ 7] 2926 	ld	a,(hl)
   7467 C6 18         [ 7] 2927 	add	a, #0x18
   7469 57            [ 4] 2928 	ld	d,a
   746A DD 6E F4      [19] 2929 	ld	l,-12 (ix)
   746D DD 66 F5      [19] 2930 	ld	h,-11 (ix)
   7470 46            [ 7] 2931 	ld	b,(hl)
   7471 04            [ 4] 2932 	inc	b
   7472 04            [ 4] 2933 	inc	b
   7473 D5            [11] 2934 	push	de
   7474 33            [ 6] 2935 	inc	sp
   7475 C5            [11] 2936 	push	bc
   7476 33            [ 6] 2937 	inc	sp
   7477 2A D5 63      [16] 2938 	ld	hl,(_mapa)
   747A E5            [11] 2939 	push	hl
   747B CD 2C 4A      [17] 2940 	call	_getTilePtr
   747E F1            [10] 2941 	pop	af
   747F F1            [10] 2942 	pop	af
   7480 4E            [ 7] 2943 	ld	c,(hl)
   7481 3E 02         [ 7] 2944 	ld	a,#0x02
   7483 91            [ 4] 2945 	sub	a, c
   7484 DA 6B 79      [10] 2946 	jp	C,00199$
                           2947 ;src/main.c:565: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7487 DD 6E F6      [19] 2948 	ld	l,-10 (ix)
   748A DD 66 F7      [19] 2949 	ld	h,-9 (ix)
   748D 7E            [ 7] 2950 	ld	a,(hl)
   748E C6 18         [ 7] 2951 	add	a, #0x18
   7490 47            [ 4] 2952 	ld	b,a
   7491 DD 6E F4      [19] 2953 	ld	l,-12 (ix)
   7494 DD 66 F5      [19] 2954 	ld	h,-11 (ix)
   7497 7E            [ 7] 2955 	ld	a,(hl)
   7498 C6 04         [ 7] 2956 	add	a, #0x04
   749A C5            [11] 2957 	push	bc
   749B 33            [ 6] 2958 	inc	sp
   749C F5            [11] 2959 	push	af
   749D 33            [ 6] 2960 	inc	sp
   749E 2A D5 63      [16] 2961 	ld	hl,(_mapa)
   74A1 E5            [11] 2962 	push	hl
   74A2 CD 2C 4A      [17] 2963 	call	_getTilePtr
   74A5 F1            [10] 2964 	pop	af
   74A6 F1            [10] 2965 	pop	af
   74A7 4E            [ 7] 2966 	ld	c,(hl)
   74A8 3E 02         [ 7] 2967 	ld	a,#0x02
   74AA 91            [ 4] 2968 	sub	a, c
   74AB DA 6B 79      [10] 2969 	jp	C,00199$
                           2970 ;src/main.c:566: moverEnemigoAbajo(enemy);
   74AE DD 6E F4      [19] 2971 	ld	l,-12 (ix)
   74B1 DD 66 F5      [19] 2972 	ld	h,-11 (ix)
   74B4 E5            [11] 2973 	push	hl
   74B5 CD 5A 6C      [17] 2974 	call	_moverEnemigoAbajo
   74B8 F1            [10] 2975 	pop	af
                           2976 ;src/main.c:568: enemy->mover = SI;
   74B9 DD 6E F8      [19] 2977 	ld	l,-8 (ix)
   74BC DD 66 F9      [19] 2978 	ld	h,-7 (ix)
   74BF 36 01         [10] 2979 	ld	(hl),#0x01
   74C1 C3 6B 79      [10] 2980 	jp	00199$
   74C4                    2981 00192$:
                           2982 ;src/main.c:574: if (!prota.mover) distConstraint = 20; // ajuste en parado
   74C4 3A FE 62      [13] 2983 	ld	a, (#_prota + 6)
   74C7 B7            [ 4] 2984 	or	a, a
   74C8 20 02         [12] 2985 	jr	NZ,00132$
   74CA 0E 14         [ 7] 2986 	ld	c,#0x14
   74CC                    2987 00132$:
                           2988 ;src/main.c:576: if (dist > distConstraint) {
   74CC 79            [ 4] 2989 	ld	a,c
   74CD DD 96 F3      [19] 2990 	sub	a, -13 (ix)
   74D0 D2 6B 79      [10] 2991 	jp	NC,00199$
                           2992 ;src/main.c:577: if (dx + 1 < enemy->x) {
   74D3 DD 5E 06      [19] 2993 	ld	e,6 (ix)
   74D6 16 00         [ 7] 2994 	ld	d,#0x00
   74D8 13            [ 6] 2995 	inc	de
   74D9 DD 73 FE      [19] 2996 	ld	-2 (ix),e
   74DC DD 72 FF      [19] 2997 	ld	-1 (ix),d
   74DF DD 70 FC      [19] 2998 	ld	-4 (ix),b
   74E2 DD 36 FD 00   [19] 2999 	ld	-3 (ix),#0x00
   74E6 DD 7E FE      [19] 3000 	ld	a,-2 (ix)
   74E9 DD 96 FC      [19] 3001 	sub	a, -4 (ix)
   74EC DD 7E FF      [19] 3002 	ld	a,-1 (ix)
   74EF DD 9E FD      [19] 3003 	sbc	a, -3 (ix)
   74F2 E2 F7 74      [10] 3004 	jp	PO, 00427$
   74F5 EE 80         [ 7] 3005 	xor	a, #0x80
   74F7                    3006 00427$:
   74F7 F2 73 75      [10] 3007 	jp	P,00144$
                           3008 ;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   74FA DD 7E FA      [19] 3009 	ld	a,-6 (ix)
   74FD F5            [11] 3010 	push	af
   74FE 33            [ 6] 3011 	inc	sp
   74FF C5            [11] 3012 	push	bc
   7500 33            [ 6] 3013 	inc	sp
   7501 2A D5 63      [16] 3014 	ld	hl,(_mapa)
   7504 E5            [11] 3015 	push	hl
   7505 CD 2C 4A      [17] 3016 	call	_getTilePtr
   7508 F1            [10] 3017 	pop	af
   7509 F1            [10] 3018 	pop	af
   750A 4E            [ 7] 3019 	ld	c,(hl)
   750B 3E 02         [ 7] 3020 	ld	a,#0x02
   750D 91            [ 4] 3021 	sub	a, c
   750E DA 00 76      [10] 3022 	jp	C,00145$
                           3023 ;src/main.c:579: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7511 DD 6E F6      [19] 3024 	ld	l,-10 (ix)
   7514 DD 66 F7      [19] 3025 	ld	h,-9 (ix)
   7517 7E            [ 7] 3026 	ld	a,(hl)
   7518 C6 0B         [ 7] 3027 	add	a, #0x0B
   751A DD 6E F4      [19] 3028 	ld	l,-12 (ix)
   751D DD 66 F5      [19] 3029 	ld	h,-11 (ix)
   7520 46            [ 7] 3030 	ld	b,(hl)
   7521 F5            [11] 3031 	push	af
   7522 33            [ 6] 3032 	inc	sp
   7523 C5            [11] 3033 	push	bc
   7524 33            [ 6] 3034 	inc	sp
   7525 2A D5 63      [16] 3035 	ld	hl,(_mapa)
   7528 E5            [11] 3036 	push	hl
   7529 CD 2C 4A      [17] 3037 	call	_getTilePtr
   752C F1            [10] 3038 	pop	af
   752D F1            [10] 3039 	pop	af
   752E 4E            [ 7] 3040 	ld	c,(hl)
   752F 3E 02         [ 7] 3041 	ld	a,#0x02
   7531 91            [ 4] 3042 	sub	a, c
   7532 DA 00 76      [10] 3043 	jp	C,00145$
                           3044 ;src/main.c:580: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7535 DD 6E F6      [19] 3045 	ld	l,-10 (ix)
   7538 DD 66 F7      [19] 3046 	ld	h,-9 (ix)
   753B 7E            [ 7] 3047 	ld	a,(hl)
   753C C6 16         [ 7] 3048 	add	a, #0x16
   753E DD 6E F4      [19] 3049 	ld	l,-12 (ix)
   7541 DD 66 F5      [19] 3050 	ld	h,-11 (ix)
   7544 46            [ 7] 3051 	ld	b,(hl)
   7545 F5            [11] 3052 	push	af
   7546 33            [ 6] 3053 	inc	sp
   7547 C5            [11] 3054 	push	bc
   7548 33            [ 6] 3055 	inc	sp
   7549 2A D5 63      [16] 3056 	ld	hl,(_mapa)
   754C E5            [11] 3057 	push	hl
   754D CD 2C 4A      [17] 3058 	call	_getTilePtr
   7550 F1            [10] 3059 	pop	af
   7551 F1            [10] 3060 	pop	af
   7552 4E            [ 7] 3061 	ld	c,(hl)
   7553 3E 02         [ 7] 3062 	ld	a,#0x02
   7555 91            [ 4] 3063 	sub	a, c
   7556 DA 00 76      [10] 3064 	jp	C,00145$
                           3065 ;src/main.c:581: moverEnemigoIzquierda(enemy);
   7559 DD 6E F4      [19] 3066 	ld	l,-12 (ix)
   755C DD 66 F5      [19] 3067 	ld	h,-11 (ix)
   755F E5            [11] 3068 	push	hl
   7560 CD 89 6C      [17] 3069 	call	_moverEnemigoIzquierda
   7563 F1            [10] 3070 	pop	af
                           3071 ;src/main.c:582: movX = 1;
   7564 DD 36 F2 01   [19] 3072 	ld	-14 (ix),#0x01
                           3073 ;src/main.c:583: enemy->mover = SI;
   7568 DD 6E F8      [19] 3074 	ld	l,-8 (ix)
   756B DD 66 F9      [19] 3075 	ld	h,-7 (ix)
   756E 36 01         [10] 3076 	ld	(hl),#0x01
   7570 C3 00 76      [10] 3077 	jp	00145$
   7573                    3078 00144$:
                           3079 ;src/main.c:585: } else if (dx + 1 > enemy->x){
   7573 DD 7E FC      [19] 3080 	ld	a,-4 (ix)
   7576 DD 96 FE      [19] 3081 	sub	a, -2 (ix)
   7579 DD 7E FD      [19] 3082 	ld	a,-3 (ix)
   757C DD 9E FF      [19] 3083 	sbc	a, -1 (ix)
   757F E2 84 75      [10] 3084 	jp	PO, 00428$
   7582 EE 80         [ 7] 3085 	xor	a, #0x80
   7584                    3086 00428$:
   7584 F2 00 76      [10] 3087 	jp	P,00145$
                           3088 ;src/main.c:586: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7587 DD 66 FA      [19] 3089 	ld	h,-6 (ix)
   758A DD 6E FB      [19] 3090 	ld	l,-5 (ix)
   758D E5            [11] 3091 	push	hl
   758E 2A D5 63      [16] 3092 	ld	hl,(_mapa)
   7591 E5            [11] 3093 	push	hl
   7592 CD 2C 4A      [17] 3094 	call	_getTilePtr
   7595 F1            [10] 3095 	pop	af
   7596 F1            [10] 3096 	pop	af
   7597 4E            [ 7] 3097 	ld	c,(hl)
   7598 3E 02         [ 7] 3098 	ld	a,#0x02
   759A 91            [ 4] 3099 	sub	a, c
   759B 38 63         [12] 3100 	jr	C,00145$
                           3101 ;src/main.c:587: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   759D DD 6E F6      [19] 3102 	ld	l,-10 (ix)
   75A0 DD 66 F7      [19] 3103 	ld	h,-9 (ix)
   75A3 7E            [ 7] 3104 	ld	a,(hl)
   75A4 C6 0B         [ 7] 3105 	add	a, #0x0B
   75A6 47            [ 4] 3106 	ld	b,a
   75A7 DD 6E F4      [19] 3107 	ld	l,-12 (ix)
   75AA DD 66 F5      [19] 3108 	ld	h,-11 (ix)
   75AD 7E            [ 7] 3109 	ld	a,(hl)
   75AE C6 04         [ 7] 3110 	add	a, #0x04
   75B0 C5            [11] 3111 	push	bc
   75B1 33            [ 6] 3112 	inc	sp
   75B2 F5            [11] 3113 	push	af
   75B3 33            [ 6] 3114 	inc	sp
   75B4 2A D5 63      [16] 3115 	ld	hl,(_mapa)
   75B7 E5            [11] 3116 	push	hl
   75B8 CD 2C 4A      [17] 3117 	call	_getTilePtr
   75BB F1            [10] 3118 	pop	af
   75BC F1            [10] 3119 	pop	af
   75BD 4E            [ 7] 3120 	ld	c,(hl)
   75BE 3E 02         [ 7] 3121 	ld	a,#0x02
   75C0 91            [ 4] 3122 	sub	a, c
   75C1 38 3D         [12] 3123 	jr	C,00145$
                           3124 ;src/main.c:588: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   75C3 DD 6E F6      [19] 3125 	ld	l,-10 (ix)
   75C6 DD 66 F7      [19] 3126 	ld	h,-9 (ix)
   75C9 7E            [ 7] 3127 	ld	a,(hl)
   75CA C6 16         [ 7] 3128 	add	a, #0x16
   75CC 47            [ 4] 3129 	ld	b,a
   75CD DD 6E F4      [19] 3130 	ld	l,-12 (ix)
   75D0 DD 66 F5      [19] 3131 	ld	h,-11 (ix)
   75D3 7E            [ 7] 3132 	ld	a,(hl)
   75D4 C6 04         [ 7] 3133 	add	a, #0x04
   75D6 C5            [11] 3134 	push	bc
   75D7 33            [ 6] 3135 	inc	sp
   75D8 F5            [11] 3136 	push	af
   75D9 33            [ 6] 3137 	inc	sp
   75DA 2A D5 63      [16] 3138 	ld	hl,(_mapa)
   75DD E5            [11] 3139 	push	hl
   75DE CD 2C 4A      [17] 3140 	call	_getTilePtr
   75E1 F1            [10] 3141 	pop	af
   75E2 F1            [10] 3142 	pop	af
   75E3 4E            [ 7] 3143 	ld	c,(hl)
   75E4 3E 02         [ 7] 3144 	ld	a,#0x02
   75E6 91            [ 4] 3145 	sub	a, c
   75E7 38 17         [12] 3146 	jr	C,00145$
                           3147 ;src/main.c:589: moverEnemigoDerecha(enemy);
   75E9 DD 6E F4      [19] 3148 	ld	l,-12 (ix)
   75EC DD 66 F5      [19] 3149 	ld	h,-11 (ix)
   75EF E5            [11] 3150 	push	hl
   75F0 CD 79 6C      [17] 3151 	call	_moverEnemigoDerecha
   75F3 F1            [10] 3152 	pop	af
                           3153 ;src/main.c:590: movX = 1;
   75F4 DD 36 F2 01   [19] 3154 	ld	-14 (ix),#0x01
                           3155 ;src/main.c:591: enemy->mover = SI;
   75F8 DD 6E F8      [19] 3156 	ld	l,-8 (ix)
   75FB DD 66 F9      [19] 3157 	ld	h,-7 (ix)
   75FE 36 01         [10] 3158 	ld	(hl),#0x01
   7600                    3159 00145$:
                           3160 ;src/main.c:594: if (dy < enemy->y) {
   7600 DD 6E F6      [19] 3161 	ld	l,-10 (ix)
   7603 DD 66 F7      [19] 3162 	ld	h,-9 (ix)
   7606 4E            [ 7] 3163 	ld	c,(hl)
                           3164 ;src/main.c:518: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7607 DD 6E F4      [19] 3165 	ld	l,-12 (ix)
   760A DD 66 F5      [19] 3166 	ld	h,-11 (ix)
   760D 46            [ 7] 3167 	ld	b,(hl)
                           3168 ;src/main.c:594: if (dy < enemy->y) {
   760E DD 7E 07      [19] 3169 	ld	a,7 (ix)
   7611 91            [ 4] 3170 	sub	a, c
   7612 D2 92 76      [10] 3171 	jp	NC,00155$
                           3172 ;src/main.c:595: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7615 51            [ 4] 3173 	ld	d,c
   7616 15            [ 4] 3174 	dec	d
   7617 15            [ 4] 3175 	dec	d
   7618 D5            [11] 3176 	push	de
   7619 33            [ 6] 3177 	inc	sp
   761A C5            [11] 3178 	push	bc
   761B 33            [ 6] 3179 	inc	sp
   761C 2A D5 63      [16] 3180 	ld	hl,(_mapa)
   761F E5            [11] 3181 	push	hl
   7620 CD 2C 4A      [17] 3182 	call	_getTilePtr
   7623 F1            [10] 3183 	pop	af
   7624 F1            [10] 3184 	pop	af
   7625 4E            [ 7] 3185 	ld	c,(hl)
   7626 3E 02         [ 7] 3186 	ld	a,#0x02
   7628 91            [ 4] 3187 	sub	a, c
   7629 DA 0C 77      [10] 3188 	jp	C,00156$
                           3189 ;src/main.c:596: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   762C DD 6E F6      [19] 3190 	ld	l,-10 (ix)
   762F DD 66 F7      [19] 3191 	ld	h,-9 (ix)
   7632 56            [ 7] 3192 	ld	d,(hl)
   7633 15            [ 4] 3193 	dec	d
   7634 15            [ 4] 3194 	dec	d
   7635 DD 6E F4      [19] 3195 	ld	l,-12 (ix)
   7638 DD 66 F5      [19] 3196 	ld	h,-11 (ix)
   763B 46            [ 7] 3197 	ld	b,(hl)
   763C 04            [ 4] 3198 	inc	b
   763D 04            [ 4] 3199 	inc	b
   763E D5            [11] 3200 	push	de
   763F 33            [ 6] 3201 	inc	sp
   7640 C5            [11] 3202 	push	bc
   7641 33            [ 6] 3203 	inc	sp
   7642 2A D5 63      [16] 3204 	ld	hl,(_mapa)
   7645 E5            [11] 3205 	push	hl
   7646 CD 2C 4A      [17] 3206 	call	_getTilePtr
   7649 F1            [10] 3207 	pop	af
   764A F1            [10] 3208 	pop	af
   764B 4E            [ 7] 3209 	ld	c,(hl)
   764C 3E 02         [ 7] 3210 	ld	a,#0x02
   764E 91            [ 4] 3211 	sub	a, c
   764F DA 0C 77      [10] 3212 	jp	C,00156$
                           3213 ;src/main.c:597: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7652 DD 6E F6      [19] 3214 	ld	l,-10 (ix)
   7655 DD 66 F7      [19] 3215 	ld	h,-9 (ix)
   7658 46            [ 7] 3216 	ld	b,(hl)
   7659 05            [ 4] 3217 	dec	b
   765A 05            [ 4] 3218 	dec	b
   765B DD 6E F4      [19] 3219 	ld	l,-12 (ix)
   765E DD 66 F5      [19] 3220 	ld	h,-11 (ix)
   7661 7E            [ 7] 3221 	ld	a,(hl)
   7662 C6 04         [ 7] 3222 	add	a, #0x04
   7664 C5            [11] 3223 	push	bc
   7665 33            [ 6] 3224 	inc	sp
   7666 F5            [11] 3225 	push	af
   7667 33            [ 6] 3226 	inc	sp
   7668 2A D5 63      [16] 3227 	ld	hl,(_mapa)
   766B E5            [11] 3228 	push	hl
   766C CD 2C 4A      [17] 3229 	call	_getTilePtr
   766F F1            [10] 3230 	pop	af
   7670 F1            [10] 3231 	pop	af
   7671 4E            [ 7] 3232 	ld	c,(hl)
   7672 3E 02         [ 7] 3233 	ld	a,#0x02
   7674 91            [ 4] 3234 	sub	a, c
   7675 DA 0C 77      [10] 3235 	jp	C,00156$
                           3236 ;src/main.c:598: moverEnemigoArriba(enemy);
   7678 DD 6E F4      [19] 3237 	ld	l,-12 (ix)
   767B DD 66 F5      [19] 3238 	ld	h,-11 (ix)
   767E E5            [11] 3239 	push	hl
   767F CD 3B 6C      [17] 3240 	call	_moverEnemigoArriba
   7682 F1            [10] 3241 	pop	af
                           3242 ;src/main.c:599: movY = 1;
   7683 DD 36 F1 01   [19] 3243 	ld	-15 (ix),#0x01
                           3244 ;src/main.c:600: enemy->mover = SI;
   7687 DD 6E F8      [19] 3245 	ld	l,-8 (ix)
   768A DD 66 F9      [19] 3246 	ld	h,-7 (ix)
   768D 36 01         [10] 3247 	ld	(hl),#0x01
   768F C3 0C 77      [10] 3248 	jp	00156$
   7692                    3249 00155$:
                           3250 ;src/main.c:603: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7692 79            [ 4] 3251 	ld	a,c
   7693 C6 18         [ 7] 3252 	add	a, #0x18
   7695 57            [ 4] 3253 	ld	d,a
   7696 D5            [11] 3254 	push	de
   7697 33            [ 6] 3255 	inc	sp
   7698 C5            [11] 3256 	push	bc
   7699 33            [ 6] 3257 	inc	sp
   769A 2A D5 63      [16] 3258 	ld	hl,(_mapa)
   769D E5            [11] 3259 	push	hl
   769E CD 2C 4A      [17] 3260 	call	_getTilePtr
   76A1 F1            [10] 3261 	pop	af
   76A2 F1            [10] 3262 	pop	af
   76A3 4E            [ 7] 3263 	ld	c,(hl)
   76A4 3E 02         [ 7] 3264 	ld	a,#0x02
   76A6 91            [ 4] 3265 	sub	a, c
   76A7 38 63         [12] 3266 	jr	C,00156$
                           3267 ;src/main.c:604: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   76A9 DD 6E F6      [19] 3268 	ld	l,-10 (ix)
   76AC DD 66 F7      [19] 3269 	ld	h,-9 (ix)
   76AF 7E            [ 7] 3270 	ld	a,(hl)
   76B0 C6 18         [ 7] 3271 	add	a, #0x18
   76B2 57            [ 4] 3272 	ld	d,a
   76B3 DD 6E F4      [19] 3273 	ld	l,-12 (ix)
   76B6 DD 66 F5      [19] 3274 	ld	h,-11 (ix)
   76B9 46            [ 7] 3275 	ld	b,(hl)
   76BA 04            [ 4] 3276 	inc	b
   76BB 04            [ 4] 3277 	inc	b
   76BC D5            [11] 3278 	push	de
   76BD 33            [ 6] 3279 	inc	sp
   76BE C5            [11] 3280 	push	bc
   76BF 33            [ 6] 3281 	inc	sp
   76C0 2A D5 63      [16] 3282 	ld	hl,(_mapa)
   76C3 E5            [11] 3283 	push	hl
   76C4 CD 2C 4A      [17] 3284 	call	_getTilePtr
   76C7 F1            [10] 3285 	pop	af
   76C8 F1            [10] 3286 	pop	af
   76C9 4E            [ 7] 3287 	ld	c,(hl)
   76CA 3E 02         [ 7] 3288 	ld	a,#0x02
   76CC 91            [ 4] 3289 	sub	a, c
   76CD 38 3D         [12] 3290 	jr	C,00156$
                           3291 ;src/main.c:605: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76CF DD 6E F6      [19] 3292 	ld	l,-10 (ix)
   76D2 DD 66 F7      [19] 3293 	ld	h,-9 (ix)
   76D5 7E            [ 7] 3294 	ld	a,(hl)
   76D6 C6 18         [ 7] 3295 	add	a, #0x18
   76D8 47            [ 4] 3296 	ld	b,a
   76D9 DD 6E F4      [19] 3297 	ld	l,-12 (ix)
   76DC DD 66 F5      [19] 3298 	ld	h,-11 (ix)
   76DF 7E            [ 7] 3299 	ld	a,(hl)
   76E0 C6 04         [ 7] 3300 	add	a, #0x04
   76E2 C5            [11] 3301 	push	bc
   76E3 33            [ 6] 3302 	inc	sp
   76E4 F5            [11] 3303 	push	af
   76E5 33            [ 6] 3304 	inc	sp
   76E6 2A D5 63      [16] 3305 	ld	hl,(_mapa)
   76E9 E5            [11] 3306 	push	hl
   76EA CD 2C 4A      [17] 3307 	call	_getTilePtr
   76ED F1            [10] 3308 	pop	af
   76EE F1            [10] 3309 	pop	af
   76EF 4E            [ 7] 3310 	ld	c,(hl)
   76F0 3E 02         [ 7] 3311 	ld	a,#0x02
   76F2 91            [ 4] 3312 	sub	a, c
   76F3 38 17         [12] 3313 	jr	C,00156$
                           3314 ;src/main.c:606: moverEnemigoAbajo(enemy);
   76F5 DD 6E F4      [19] 3315 	ld	l,-12 (ix)
   76F8 DD 66 F5      [19] 3316 	ld	h,-11 (ix)
   76FB E5            [11] 3317 	push	hl
   76FC CD 5A 6C      [17] 3318 	call	_moverEnemigoAbajo
   76FF F1            [10] 3319 	pop	af
                           3320 ;src/main.c:607: movY = 1;
   7700 DD 36 F1 01   [19] 3321 	ld	-15 (ix),#0x01
                           3322 ;src/main.c:608: enemy->mover = SI;
   7704 DD 6E F8      [19] 3323 	ld	l,-8 (ix)
   7707 DD 66 F9      [19] 3324 	ld	h,-7 (ix)
   770A 36 01         [10] 3325 	ld	(hl),#0x01
   770C                    3326 00156$:
                           3327 ;src/main.c:611: if (!enemy->mover) {
   770C DD 6E F8      [19] 3328 	ld	l,-8 (ix)
   770F DD 66 F9      [19] 3329 	ld	h,-7 (ix)
   7712 7E            [ 7] 3330 	ld	a,(hl)
   7713 B7            [ 4] 3331 	or	a, a
   7714 C2 6B 79      [10] 3332 	jp	NZ,00199$
                           3333 ;src/main.c:612: if (!movX) {
   7717 DD 7E F2      [19] 3334 	ld	a,-14 (ix)
   771A B7            [ 4] 3335 	or	a, a
   771B C2 44 78      [10] 3336 	jp	NZ,00171$
                           3337 ;src/main.c:613: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   771E DD 6E F6      [19] 3338 	ld	l,-10 (ix)
   7721 DD 66 F7      [19] 3339 	ld	h,-9 (ix)
   7724 5E            [ 7] 3340 	ld	e,(hl)
                           3341 ;src/main.c:518: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7725 DD 6E F4      [19] 3342 	ld	l,-12 (ix)
   7728 DD 66 F5      [19] 3343 	ld	h,-11 (ix)
   772B 4E            [ 7] 3344 	ld	c,(hl)
                           3345 ;src/main.c:613: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   772C 3E 70         [ 7] 3346 	ld	a,#0x70
   772E 93            [ 4] 3347 	sub	a, e
   772F D2 BF 77      [10] 3348 	jp	NC,00168$
                           3349 ;src/main.c:614: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7732 7B            [ 4] 3350 	ld	a,e
   7733 C6 18         [ 7] 3351 	add	a, #0x18
   7735 47            [ 4] 3352 	ld	b,a
   7736 C5            [11] 3353 	push	bc
   7737 2A D5 63      [16] 3354 	ld	hl,(_mapa)
   773A E5            [11] 3355 	push	hl
   773B CD 2C 4A      [17] 3356 	call	_getTilePtr
   773E F1            [10] 3357 	pop	af
   773F F1            [10] 3358 	pop	af
   7740 4E            [ 7] 3359 	ld	c,(hl)
   7741 3E 02         [ 7] 3360 	ld	a,#0x02
   7743 91            [ 4] 3361 	sub	a, c
   7744 38 63         [12] 3362 	jr	C,00158$
                           3363 ;src/main.c:615: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7746 DD 6E F6      [19] 3364 	ld	l,-10 (ix)
   7749 DD 66 F7      [19] 3365 	ld	h,-9 (ix)
   774C 7E            [ 7] 3366 	ld	a,(hl)
   774D C6 18         [ 7] 3367 	add	a, #0x18
   774F 57            [ 4] 3368 	ld	d,a
   7750 DD 6E F4      [19] 3369 	ld	l,-12 (ix)
   7753 DD 66 F5      [19] 3370 	ld	h,-11 (ix)
   7756 4E            [ 7] 3371 	ld	c,(hl)
   7757 41            [ 4] 3372 	ld	b,c
   7758 04            [ 4] 3373 	inc	b
   7759 04            [ 4] 3374 	inc	b
   775A D5            [11] 3375 	push	de
   775B 33            [ 6] 3376 	inc	sp
   775C C5            [11] 3377 	push	bc
   775D 33            [ 6] 3378 	inc	sp
   775E 2A D5 63      [16] 3379 	ld	hl,(_mapa)
   7761 E5            [11] 3380 	push	hl
   7762 CD 2C 4A      [17] 3381 	call	_getTilePtr
   7765 F1            [10] 3382 	pop	af
   7766 F1            [10] 3383 	pop	af
   7767 4E            [ 7] 3384 	ld	c,(hl)
   7768 3E 02         [ 7] 3385 	ld	a,#0x02
   776A 91            [ 4] 3386 	sub	a, c
   776B 38 3C         [12] 3387 	jr	C,00158$
                           3388 ;src/main.c:616: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   776D DD 6E F6      [19] 3389 	ld	l,-10 (ix)
   7770 DD 66 F7      [19] 3390 	ld	h,-9 (ix)
   7773 7E            [ 7] 3391 	ld	a,(hl)
   7774 C6 18         [ 7] 3392 	add	a, #0x18
   7776 47            [ 4] 3393 	ld	b,a
   7777 DD 6E F4      [19] 3394 	ld	l,-12 (ix)
   777A DD 66 F5      [19] 3395 	ld	h,-11 (ix)
   777D 7E            [ 7] 3396 	ld	a,(hl)
   777E C6 04         [ 7] 3397 	add	a, #0x04
   7780 C5            [11] 3398 	push	bc
   7781 33            [ 6] 3399 	inc	sp
   7782 F5            [11] 3400 	push	af
   7783 33            [ 6] 3401 	inc	sp
   7784 2A D5 63      [16] 3402 	ld	hl,(_mapa)
   7787 E5            [11] 3403 	push	hl
   7788 CD 2C 4A      [17] 3404 	call	_getTilePtr
   778B F1            [10] 3405 	pop	af
   778C F1            [10] 3406 	pop	af
   778D 4E            [ 7] 3407 	ld	c,(hl)
   778E 3E 02         [ 7] 3408 	ld	a,#0x02
   7790 91            [ 4] 3409 	sub	a, c
   7791 38 16         [12] 3410 	jr	C,00158$
                           3411 ;src/main.c:617: moverEnemigoAbajo(enemy);
   7793 DD 6E F4      [19] 3412 	ld	l,-12 (ix)
   7796 DD 66 F5      [19] 3413 	ld	h,-11 (ix)
   7799 E5            [11] 3414 	push	hl
   779A CD 5A 6C      [17] 3415 	call	_moverEnemigoAbajo
   779D F1            [10] 3416 	pop	af
                           3417 ;src/main.c:618: enemy->mover = SI;
   779E DD 6E F8      [19] 3418 	ld	l,-8 (ix)
   77A1 DD 66 F9      [19] 3419 	ld	h,-7 (ix)
   77A4 36 01         [10] 3420 	ld	(hl),#0x01
   77A6 C3 44 78      [10] 3421 	jp	00171$
   77A9                    3422 00158$:
                           3423 ;src/main.c:620: moverEnemigoArriba(enemy);
   77A9 DD 6E F4      [19] 3424 	ld	l,-12 (ix)
   77AC DD 66 F5      [19] 3425 	ld	h,-11 (ix)
   77AF E5            [11] 3426 	push	hl
   77B0 CD 3B 6C      [17] 3427 	call	_moverEnemigoArriba
   77B3 F1            [10] 3428 	pop	af
                           3429 ;src/main.c:621: enemy->mover = SI;
   77B4 DD 6E F8      [19] 3430 	ld	l,-8 (ix)
   77B7 DD 66 F9      [19] 3431 	ld	h,-7 (ix)
   77BA 36 01         [10] 3432 	ld	(hl),#0x01
   77BC C3 44 78      [10] 3433 	jp	00171$
   77BF                    3434 00168$:
                           3435 ;src/main.c:624: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   77BF 43            [ 4] 3436 	ld	b,e
   77C0 05            [ 4] 3437 	dec	b
   77C1 05            [ 4] 3438 	dec	b
   77C2 C5            [11] 3439 	push	bc
   77C3 2A D5 63      [16] 3440 	ld	hl,(_mapa)
   77C6 E5            [11] 3441 	push	hl
   77C7 CD 2C 4A      [17] 3442 	call	_getTilePtr
   77CA F1            [10] 3443 	pop	af
   77CB F1            [10] 3444 	pop	af
   77CC 4E            [ 7] 3445 	ld	c,(hl)
   77CD 3E 02         [ 7] 3446 	ld	a,#0x02
   77CF 91            [ 4] 3447 	sub	a, c
   77D0 38 5F         [12] 3448 	jr	C,00163$
                           3449 ;src/main.c:625: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   77D2 DD 6E F6      [19] 3450 	ld	l,-10 (ix)
   77D5 DD 66 F7      [19] 3451 	ld	h,-9 (ix)
   77D8 56            [ 7] 3452 	ld	d,(hl)
   77D9 15            [ 4] 3453 	dec	d
   77DA 15            [ 4] 3454 	dec	d
   77DB DD 6E F4      [19] 3455 	ld	l,-12 (ix)
   77DE DD 66 F5      [19] 3456 	ld	h,-11 (ix)
   77E1 46            [ 7] 3457 	ld	b,(hl)
   77E2 04            [ 4] 3458 	inc	b
   77E3 04            [ 4] 3459 	inc	b
   77E4 D5            [11] 3460 	push	de
   77E5 33            [ 6] 3461 	inc	sp
   77E6 C5            [11] 3462 	push	bc
   77E7 33            [ 6] 3463 	inc	sp
   77E8 2A D5 63      [16] 3464 	ld	hl,(_mapa)
   77EB E5            [11] 3465 	push	hl
   77EC CD 2C 4A      [17] 3466 	call	_getTilePtr
   77EF F1            [10] 3467 	pop	af
   77F0 F1            [10] 3468 	pop	af
   77F1 4E            [ 7] 3469 	ld	c,(hl)
   77F2 3E 02         [ 7] 3470 	ld	a,#0x02
   77F4 91            [ 4] 3471 	sub	a, c
   77F5 38 3A         [12] 3472 	jr	C,00163$
                           3473 ;src/main.c:626: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   77F7 DD 6E F6      [19] 3474 	ld	l,-10 (ix)
   77FA DD 66 F7      [19] 3475 	ld	h,-9 (ix)
   77FD 46            [ 7] 3476 	ld	b,(hl)
   77FE 05            [ 4] 3477 	dec	b
   77FF 05            [ 4] 3478 	dec	b
   7800 DD 6E F4      [19] 3479 	ld	l,-12 (ix)
   7803 DD 66 F5      [19] 3480 	ld	h,-11 (ix)
   7806 7E            [ 7] 3481 	ld	a,(hl)
   7807 C6 04         [ 7] 3482 	add	a, #0x04
   7809 C5            [11] 3483 	push	bc
   780A 33            [ 6] 3484 	inc	sp
   780B F5            [11] 3485 	push	af
   780C 33            [ 6] 3486 	inc	sp
   780D 2A D5 63      [16] 3487 	ld	hl,(_mapa)
   7810 E5            [11] 3488 	push	hl
   7811 CD 2C 4A      [17] 3489 	call	_getTilePtr
   7814 F1            [10] 3490 	pop	af
   7815 F1            [10] 3491 	pop	af
   7816 4E            [ 7] 3492 	ld	c,(hl)
   7817 3E 02         [ 7] 3493 	ld	a,#0x02
   7819 91            [ 4] 3494 	sub	a, c
   781A 38 15         [12] 3495 	jr	C,00163$
                           3496 ;src/main.c:627: moverEnemigoArriba(enemy);
   781C DD 6E F4      [19] 3497 	ld	l,-12 (ix)
   781F DD 66 F5      [19] 3498 	ld	h,-11 (ix)
   7822 E5            [11] 3499 	push	hl
   7823 CD 3B 6C      [17] 3500 	call	_moverEnemigoArriba
   7826 F1            [10] 3501 	pop	af
                           3502 ;src/main.c:628: enemy->mover = SI;
   7827 DD 6E F8      [19] 3503 	ld	l,-8 (ix)
   782A DD 66 F9      [19] 3504 	ld	h,-7 (ix)
   782D 36 01         [10] 3505 	ld	(hl),#0x01
   782F 18 13         [12] 3506 	jr	00171$
   7831                    3507 00163$:
                           3508 ;src/main.c:630: moverEnemigoAbajo(enemy);
   7831 DD 6E F4      [19] 3509 	ld	l,-12 (ix)
   7834 DD 66 F5      [19] 3510 	ld	h,-11 (ix)
   7837 E5            [11] 3511 	push	hl
   7838 CD 5A 6C      [17] 3512 	call	_moverEnemigoAbajo
   783B F1            [10] 3513 	pop	af
                           3514 ;src/main.c:631: enemy->mover = SI;
   783C DD 6E F8      [19] 3515 	ld	l,-8 (ix)
   783F DD 66 F9      [19] 3516 	ld	h,-7 (ix)
   7842 36 01         [10] 3517 	ld	(hl),#0x01
   7844                    3518 00171$:
                           3519 ;src/main.c:636: if (!movY) {
   7844 DD 7E F1      [19] 3520 	ld	a,-15 (ix)
   7847 B7            [ 4] 3521 	or	a, a
   7848 C2 6B 79      [10] 3522 	jp	NZ,00199$
                           3523 ;src/main.c:637: if (enemy->x < ANCHO_PANTALLA/2) {
   784B DD 6E F4      [19] 3524 	ld	l,-12 (ix)
   784E DD 66 F5      [19] 3525 	ld	h,-11 (ix)
   7851 4E            [ 7] 3526 	ld	c,(hl)
                           3527 ;src/main.c:519: u8 dify = abs(enemy->y - prota.y);
   7852 DD 6E F6      [19] 3528 	ld	l,-10 (ix)
   7855 DD 66 F7      [19] 3529 	ld	h,-9 (ix)
   7858 46            [ 7] 3530 	ld	b,(hl)
                           3531 ;src/main.c:637: if (enemy->x < ANCHO_PANTALLA/2) {
   7859 79            [ 4] 3532 	ld	a,c
   785A D6 28         [ 7] 3533 	sub	a, #0x28
   785C D2 E1 78      [10] 3534 	jp	NC,00183$
                           3535 ;src/main.c:638: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   785F C5            [11] 3536 	push	bc
   7860 2A D5 63      [16] 3537 	ld	hl,(_mapa)
   7863 E5            [11] 3538 	push	hl
   7864 CD 2C 4A      [17] 3539 	call	_getTilePtr
   7867 F1            [10] 3540 	pop	af
   7868 F1            [10] 3541 	pop	af
   7869 4E            [ 7] 3542 	ld	c,(hl)
   786A 3E 02         [ 7] 3543 	ld	a,#0x02
   786C 91            [ 4] 3544 	sub	a, c
   786D 38 5C         [12] 3545 	jr	C,00173$
                           3546 ;src/main.c:639: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   786F DD 6E F6      [19] 3547 	ld	l,-10 (ix)
   7872 DD 66 F7      [19] 3548 	ld	h,-9 (ix)
   7875 7E            [ 7] 3549 	ld	a,(hl)
   7876 C6 0B         [ 7] 3550 	add	a, #0x0B
   7878 DD 6E F4      [19] 3551 	ld	l,-12 (ix)
   787B DD 66 F5      [19] 3552 	ld	h,-11 (ix)
   787E 46            [ 7] 3553 	ld	b,(hl)
   787F F5            [11] 3554 	push	af
   7880 33            [ 6] 3555 	inc	sp
   7881 C5            [11] 3556 	push	bc
   7882 33            [ 6] 3557 	inc	sp
   7883 2A D5 63      [16] 3558 	ld	hl,(_mapa)
   7886 E5            [11] 3559 	push	hl
   7887 CD 2C 4A      [17] 3560 	call	_getTilePtr
   788A F1            [10] 3561 	pop	af
   788B F1            [10] 3562 	pop	af
   788C 4E            [ 7] 3563 	ld	c,(hl)
   788D 3E 02         [ 7] 3564 	ld	a,#0x02
   788F 91            [ 4] 3565 	sub	a, c
   7890 38 39         [12] 3566 	jr	C,00173$
                           3567 ;src/main.c:640: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7892 DD 6E F6      [19] 3568 	ld	l,-10 (ix)
   7895 DD 66 F7      [19] 3569 	ld	h,-9 (ix)
   7898 7E            [ 7] 3570 	ld	a,(hl)
   7899 C6 16         [ 7] 3571 	add	a, #0x16
   789B DD 6E F4      [19] 3572 	ld	l,-12 (ix)
   789E DD 66 F5      [19] 3573 	ld	h,-11 (ix)
   78A1 46            [ 7] 3574 	ld	b,(hl)
   78A2 F5            [11] 3575 	push	af
   78A3 33            [ 6] 3576 	inc	sp
   78A4 C5            [11] 3577 	push	bc
   78A5 33            [ 6] 3578 	inc	sp
   78A6 2A D5 63      [16] 3579 	ld	hl,(_mapa)
   78A9 E5            [11] 3580 	push	hl
   78AA CD 2C 4A      [17] 3581 	call	_getTilePtr
   78AD F1            [10] 3582 	pop	af
   78AE F1            [10] 3583 	pop	af
   78AF 4E            [ 7] 3584 	ld	c,(hl)
   78B0 3E 02         [ 7] 3585 	ld	a,#0x02
   78B2 91            [ 4] 3586 	sub	a, c
   78B3 38 16         [12] 3587 	jr	C,00173$
                           3588 ;src/main.c:641: moverEnemigoIzquierda(enemy);
   78B5 DD 6E F4      [19] 3589 	ld	l,-12 (ix)
   78B8 DD 66 F5      [19] 3590 	ld	h,-11 (ix)
   78BB E5            [11] 3591 	push	hl
   78BC CD 89 6C      [17] 3592 	call	_moverEnemigoIzquierda
   78BF F1            [10] 3593 	pop	af
                           3594 ;src/main.c:642: enemy->mover = SI;
   78C0 DD 6E F8      [19] 3595 	ld	l,-8 (ix)
   78C3 DD 66 F9      [19] 3596 	ld	h,-7 (ix)
   78C6 36 01         [10] 3597 	ld	(hl),#0x01
   78C8 C3 6B 79      [10] 3598 	jp	00199$
   78CB                    3599 00173$:
                           3600 ;src/main.c:644: moverEnemigoDerecha(enemy);
   78CB DD 6E F4      [19] 3601 	ld	l,-12 (ix)
   78CE DD 66 F5      [19] 3602 	ld	h,-11 (ix)
   78D1 E5            [11] 3603 	push	hl
   78D2 CD 79 6C      [17] 3604 	call	_moverEnemigoDerecha
   78D5 F1            [10] 3605 	pop	af
                           3606 ;src/main.c:645: enemy->mover = SI;
   78D6 DD 6E F8      [19] 3607 	ld	l,-8 (ix)
   78D9 DD 66 F9      [19] 3608 	ld	h,-7 (ix)
   78DC 36 01         [10] 3609 	ld	(hl),#0x01
   78DE C3 6B 79      [10] 3610 	jp	00199$
   78E1                    3611 00183$:
                           3612 ;src/main.c:648: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   78E1 79            [ 4] 3613 	ld	a,c
   78E2 C6 04         [ 7] 3614 	add	a, #0x04
   78E4 C5            [11] 3615 	push	bc
   78E5 33            [ 6] 3616 	inc	sp
   78E6 F5            [11] 3617 	push	af
   78E7 33            [ 6] 3618 	inc	sp
   78E8 2A D5 63      [16] 3619 	ld	hl,(_mapa)
   78EB E5            [11] 3620 	push	hl
   78EC CD 2C 4A      [17] 3621 	call	_getTilePtr
   78EF F1            [10] 3622 	pop	af
   78F0 F1            [10] 3623 	pop	af
   78F1 4E            [ 7] 3624 	ld	c,(hl)
   78F2 3E 02         [ 7] 3625 	ld	a,#0x02
   78F4 91            [ 4] 3626 	sub	a, c
   78F5 38 61         [12] 3627 	jr	C,00178$
                           3628 ;src/main.c:649: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78F7 DD 6E F6      [19] 3629 	ld	l,-10 (ix)
   78FA DD 66 F7      [19] 3630 	ld	h,-9 (ix)
   78FD 7E            [ 7] 3631 	ld	a,(hl)
   78FE C6 0B         [ 7] 3632 	add	a, #0x0B
   7900 47            [ 4] 3633 	ld	b,a
   7901 DD 6E F4      [19] 3634 	ld	l,-12 (ix)
   7904 DD 66 F5      [19] 3635 	ld	h,-11 (ix)
   7907 7E            [ 7] 3636 	ld	a,(hl)
   7908 C6 04         [ 7] 3637 	add	a, #0x04
   790A C5            [11] 3638 	push	bc
   790B 33            [ 6] 3639 	inc	sp
   790C F5            [11] 3640 	push	af
   790D 33            [ 6] 3641 	inc	sp
   790E 2A D5 63      [16] 3642 	ld	hl,(_mapa)
   7911 E5            [11] 3643 	push	hl
   7912 CD 2C 4A      [17] 3644 	call	_getTilePtr
   7915 F1            [10] 3645 	pop	af
   7916 F1            [10] 3646 	pop	af
   7917 4E            [ 7] 3647 	ld	c,(hl)
   7918 3E 02         [ 7] 3648 	ld	a,#0x02
   791A 91            [ 4] 3649 	sub	a, c
   791B 38 3B         [12] 3650 	jr	C,00178$
                           3651 ;src/main.c:650: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   791D DD 6E F6      [19] 3652 	ld	l,-10 (ix)
   7920 DD 66 F7      [19] 3653 	ld	h,-9 (ix)
   7923 7E            [ 7] 3654 	ld	a,(hl)
   7924 C6 16         [ 7] 3655 	add	a, #0x16
   7926 47            [ 4] 3656 	ld	b,a
   7927 DD 6E F4      [19] 3657 	ld	l,-12 (ix)
   792A DD 66 F5      [19] 3658 	ld	h,-11 (ix)
   792D 7E            [ 7] 3659 	ld	a,(hl)
   792E C6 04         [ 7] 3660 	add	a, #0x04
   7930 C5            [11] 3661 	push	bc
   7931 33            [ 6] 3662 	inc	sp
   7932 F5            [11] 3663 	push	af
   7933 33            [ 6] 3664 	inc	sp
   7934 2A D5 63      [16] 3665 	ld	hl,(_mapa)
   7937 E5            [11] 3666 	push	hl
   7938 CD 2C 4A      [17] 3667 	call	_getTilePtr
   793B F1            [10] 3668 	pop	af
   793C F1            [10] 3669 	pop	af
   793D 4E            [ 7] 3670 	ld	c,(hl)
   793E 3E 02         [ 7] 3671 	ld	a,#0x02
   7940 91            [ 4] 3672 	sub	a, c
   7941 38 15         [12] 3673 	jr	C,00178$
                           3674 ;src/main.c:651: moverEnemigoDerecha(enemy);
   7943 DD 6E F4      [19] 3675 	ld	l,-12 (ix)
   7946 DD 66 F5      [19] 3676 	ld	h,-11 (ix)
   7949 E5            [11] 3677 	push	hl
   794A CD 79 6C      [17] 3678 	call	_moverEnemigoDerecha
   794D F1            [10] 3679 	pop	af
                           3680 ;src/main.c:652: enemy->mover = SI;
   794E DD 6E F8      [19] 3681 	ld	l,-8 (ix)
   7951 DD 66 F9      [19] 3682 	ld	h,-7 (ix)
   7954 36 01         [10] 3683 	ld	(hl),#0x01
   7956 18 13         [12] 3684 	jr	00199$
   7958                    3685 00178$:
                           3686 ;src/main.c:655: moverEnemigoIzquierda(enemy);
   7958 DD 6E F4      [19] 3687 	ld	l,-12 (ix)
   795B DD 66 F5      [19] 3688 	ld	h,-11 (ix)
   795E E5            [11] 3689 	push	hl
   795F CD 89 6C      [17] 3690 	call	_moverEnemigoIzquierda
   7962 F1            [10] 3691 	pop	af
                           3692 ;src/main.c:656: enemy->mover = SI;
   7963 DD 6E F8      [19] 3693 	ld	l,-8 (ix)
   7966 DD 66 F9      [19] 3694 	ld	h,-7 (ix)
   7969 36 01         [10] 3695 	ld	(hl),#0x01
   796B                    3696 00199$:
   796B DD F9         [10] 3697 	ld	sp, ix
   796D DD E1         [14] 3698 	pop	ix
   796F C9            [10] 3699 	ret
                           3700 ;src/main.c:665: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3701 ;	---------------------------------
                           3702 ; Function updateEnemy
                           3703 ; ---------------------------------
   7970                    3704 _updateEnemy::
   7970 DD E5         [15] 3705 	push	ix
   7972 DD 21 00 00   [14] 3706 	ld	ix,#0
   7976 DD 39         [15] 3707 	add	ix,sp
   7978 21 F4 FF      [10] 3708 	ld	hl,#-12
   797B 39            [11] 3709 	add	hl,sp
   797C F9            [ 6] 3710 	ld	sp,hl
                           3711 ;src/main.c:672: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   797D DD 4E 04      [19] 3712 	ld	c,4 (ix)
   7980 DD 46 05      [19] 3713 	ld	b,5 (ix)
   7983 21 16 00      [10] 3714 	ld	hl,#0x0016
   7986 09            [11] 3715 	add	hl,bc
   7987 DD 75 FC      [19] 3716 	ld	-4 (ix),l
   798A DD 74 FD      [19] 3717 	ld	-3 (ix),h
   798D DD 6E FC      [19] 3718 	ld	l,-4 (ix)
   7990 DD 66 FD      [19] 3719 	ld	h,-3 (ix)
   7993 7E            [ 7] 3720 	ld	a,(hl)
   7994 B7            [ 4] 3721 	or	a, a
   7995 28 14         [12] 3722 	jr	Z,00117$
                           3723 ;src/main.c:673: engage(actual, prota.x, prota.y);
   7997 3A F9 62      [13] 3724 	ld	a, (#_prota + 1)
   799A 21 F8 62      [10] 3725 	ld	hl, #_prota + 0
   799D 56            [ 7] 3726 	ld	d,(hl)
   799E F5            [11] 3727 	push	af
   799F 33            [ 6] 3728 	inc	sp
   79A0 D5            [11] 3729 	push	de
   79A1 33            [ 6] 3730 	inc	sp
   79A2 C5            [11] 3731 	push	bc
   79A3 CD C5 71      [17] 3732 	call	_engage
   79A6 F1            [10] 3733 	pop	af
   79A7 F1            [10] 3734 	pop	af
   79A8 C3 C5 7A      [10] 3735 	jp	00119$
   79AB                    3736 00117$:
                           3737 ;src/main.c:675: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   79AB C5            [11] 3738 	push	bc
   79AC C5            [11] 3739 	push	bc
   79AD CD E4 6E      [17] 3740 	call	_lookFor
   79B0 F1            [10] 3741 	pop	af
   79B1 C1            [10] 3742 	pop	bc
                           3743 ;src/main.c:681: actual->patrolling = 0;
   79B2 21 0B 00      [10] 3744 	ld	hl,#0x000B
   79B5 09            [11] 3745 	add	hl,bc
   79B6 DD 75 FE      [19] 3746 	ld	-2 (ix),l
   79B9 DD 74 FF      [19] 3747 	ld	-1 (ix),h
                           3748 ;src/main.c:676: if (actual->patrolling) {
   79BC DD 6E FE      [19] 3749 	ld	l,-2 (ix)
   79BF DD 66 FF      [19] 3750 	ld	h,-1 (ix)
   79C2 6E            [ 7] 3751 	ld	l,(hl)
                           3752 ;src/main.c:679: if (actual->inRange) {
   79C3 79            [ 4] 3753 	ld	a,c
   79C4 C6 11         [ 7] 3754 	add	a, #0x11
   79C6 5F            [ 4] 3755 	ld	e,a
   79C7 78            [ 4] 3756 	ld	a,b
   79C8 CE 00         [ 7] 3757 	adc	a, #0x00
   79CA 57            [ 4] 3758 	ld	d,a
                           3759 ;src/main.c:688: actual->seek = 1;
   79CB 79            [ 4] 3760 	ld	a,c
   79CC C6 14         [ 7] 3761 	add	a, #0x14
   79CE DD 77 FA      [19] 3762 	ld	-6 (ix),a
   79D1 78            [ 4] 3763 	ld	a,b
   79D2 CE 00         [ 7] 3764 	adc	a, #0x00
   79D4 DD 77 FB      [19] 3765 	ld	-5 (ix),a
                           3766 ;src/main.c:676: if (actual->patrolling) {
   79D7 7D            [ 4] 3767 	ld	a,l
   79D8 B7            [ 4] 3768 	or	a, a
   79D9 CA 8E 7A      [10] 3769 	jp	Z,00114$
                           3770 ;src/main.c:678: moverEnemigoPatrol(actual);
   79DC C5            [11] 3771 	push	bc
   79DD D5            [11] 3772 	push	de
   79DE C5            [11] 3773 	push	bc
   79DF CD 9B 6C      [17] 3774 	call	_moverEnemigoPatrol
   79E2 F1            [10] 3775 	pop	af
   79E3 D1            [10] 3776 	pop	de
   79E4 C1            [10] 3777 	pop	bc
                           3778 ;src/main.c:679: if (actual->inRange) {
   79E5 1A            [ 7] 3779 	ld	a,(de)
   79E6 B7            [ 4] 3780 	or	a, a
   79E7 28 24         [12] 3781 	jr	Z,00104$
                           3782 ;src/main.c:680: engage(actual, prota.x, prota.y);
   79E9 3A F9 62      [13] 3783 	ld	a, (#_prota + 1)
   79EC 21 F8 62      [10] 3784 	ld	hl, #_prota + 0
   79EF 56            [ 7] 3785 	ld	d,(hl)
   79F0 F5            [11] 3786 	push	af
   79F1 33            [ 6] 3787 	inc	sp
   79F2 D5            [11] 3788 	push	de
   79F3 33            [ 6] 3789 	inc	sp
   79F4 C5            [11] 3790 	push	bc
   79F5 CD C5 71      [17] 3791 	call	_engage
   79F8 F1            [10] 3792 	pop	af
   79F9 F1            [10] 3793 	pop	af
                           3794 ;src/main.c:681: actual->patrolling = 0;
   79FA DD 6E FE      [19] 3795 	ld	l,-2 (ix)
   79FD DD 66 FF      [19] 3796 	ld	h,-1 (ix)
   7A00 36 00         [10] 3797 	ld	(hl),#0x00
                           3798 ;src/main.c:682: actual->engage = 1;
   7A02 DD 6E FC      [19] 3799 	ld	l,-4 (ix)
   7A05 DD 66 FD      [19] 3800 	ld	h,-3 (ix)
   7A08 36 01         [10] 3801 	ld	(hl),#0x01
   7A0A C3 C5 7A      [10] 3802 	jp	00119$
   7A0D                    3803 00104$:
                           3804 ;src/main.c:683: } else if (actual->seen) {
   7A0D 21 12 00      [10] 3805 	ld	hl,#0x0012
   7A10 09            [11] 3806 	add	hl,bc
   7A11 DD 75 F8      [19] 3807 	ld	-8 (ix),l
   7A14 DD 74 F9      [19] 3808 	ld	-7 (ix),h
   7A17 DD 6E F8      [19] 3809 	ld	l,-8 (ix)
   7A1A DD 66 F9      [19] 3810 	ld	h,-7 (ix)
   7A1D 7E            [ 7] 3811 	ld	a,(hl)
   7A1E B7            [ 4] 3812 	or	a, a
   7A1F CA C5 7A      [10] 3813 	jp	Z,00119$
                           3814 ;src/main.c:685: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   7A22 3A F9 62      [13] 3815 	ld	a,(#_prota + 1)
   7A25 DD 77 F7      [19] 3816 	ld	-9 (ix),a
   7A28 21 F8 62      [10] 3817 	ld	hl, #_prota + 0
   7A2B 5E            [ 7] 3818 	ld	e,(hl)
   7A2C 21 01 00      [10] 3819 	ld	hl,#0x0001
   7A2F 09            [11] 3820 	add	hl,bc
   7A30 E3            [19] 3821 	ex	(sp), hl
   7A31 E1            [10] 3822 	pop	hl
   7A32 E5            [11] 3823 	push	hl
   7A33 56            [ 7] 3824 	ld	d,(hl)
   7A34 0A            [ 7] 3825 	ld	a,(bc)
   7A35 DD 77 F6      [19] 3826 	ld	-10 (ix),a
   7A38 C5            [11] 3827 	push	bc
   7A39 2A D5 63      [16] 3828 	ld	hl,(_mapa)
   7A3C E5            [11] 3829 	push	hl
   7A3D C5            [11] 3830 	push	bc
   7A3E DD 7E F7      [19] 3831 	ld	a,-9 (ix)
   7A41 F5            [11] 3832 	push	af
   7A42 33            [ 6] 3833 	inc	sp
   7A43 7B            [ 4] 3834 	ld	a,e
   7A44 F5            [11] 3835 	push	af
   7A45 33            [ 6] 3836 	inc	sp
   7A46 D5            [11] 3837 	push	de
   7A47 33            [ 6] 3838 	inc	sp
   7A48 DD 7E F6      [19] 3839 	ld	a,-10 (ix)
   7A4B F5            [11] 3840 	push	af
   7A4C 33            [ 6] 3841 	inc	sp
   7A4D CD 82 48      [17] 3842 	call	_pathFinding
   7A50 21 08 00      [10] 3843 	ld	hl,#8
   7A53 39            [11] 3844 	add	hl,sp
   7A54 F9            [ 6] 3845 	ld	sp,hl
   7A55 C1            [10] 3846 	pop	bc
                           3847 ;src/main.c:686: actual->p_seek_x = actual->x;
   7A56 21 17 00      [10] 3848 	ld	hl,#0x0017
   7A59 09            [11] 3849 	add	hl,bc
   7A5A EB            [ 4] 3850 	ex	de,hl
   7A5B 0A            [ 7] 3851 	ld	a,(bc)
   7A5C 12            [ 7] 3852 	ld	(de),a
                           3853 ;src/main.c:687: actual->p_seek_y = actual->y;
   7A5D 21 18 00      [10] 3854 	ld	hl,#0x0018
   7A60 09            [11] 3855 	add	hl,bc
   7A61 EB            [ 4] 3856 	ex	de,hl
   7A62 E1            [10] 3857 	pop	hl
   7A63 E5            [11] 3858 	push	hl
   7A64 7E            [ 7] 3859 	ld	a,(hl)
   7A65 12            [ 7] 3860 	ld	(de),a
                           3861 ;src/main.c:688: actual->seek = 1;
   7A66 DD 6E FA      [19] 3862 	ld	l,-6 (ix)
   7A69 DD 66 FB      [19] 3863 	ld	h,-5 (ix)
   7A6C 36 01         [10] 3864 	ld	(hl),#0x01
                           3865 ;src/main.c:689: actual->iter=0;
   7A6E 21 0E 00      [10] 3866 	ld	hl,#0x000E
   7A71 09            [11] 3867 	add	hl,bc
   7A72 AF            [ 4] 3868 	xor	a, a
   7A73 77            [ 7] 3869 	ld	(hl), a
   7A74 23            [ 6] 3870 	inc	hl
   7A75 77            [ 7] 3871 	ld	(hl), a
                           3872 ;src/main.c:690: actual->reversePatrol = NO;
   7A76 21 0C 00      [10] 3873 	ld	hl,#0x000C
   7A79 09            [11] 3874 	add	hl,bc
   7A7A 36 00         [10] 3875 	ld	(hl),#0x00
                           3876 ;src/main.c:691: actual->patrolling = 0;
   7A7C DD 6E FE      [19] 3877 	ld	l,-2 (ix)
   7A7F DD 66 FF      [19] 3878 	ld	h,-1 (ix)
   7A82 36 00         [10] 3879 	ld	(hl),#0x00
                           3880 ;src/main.c:692: actual->seen = 0;
   7A84 DD 6E F8      [19] 3881 	ld	l,-8 (ix)
   7A87 DD 66 F9      [19] 3882 	ld	h,-7 (ix)
   7A8A 36 00         [10] 3883 	ld	(hl),#0x00
   7A8C 18 37         [12] 3884 	jr	00119$
   7A8E                    3885 00114$:
                           3886 ;src/main.c:694: } else if (actual->seek) {
   7A8E DD 6E FA      [19] 3887 	ld	l,-6 (ix)
   7A91 DD 66 FB      [19] 3888 	ld	h,-5 (ix)
   7A94 7E            [ 7] 3889 	ld	a,(hl)
   7A95 B7            [ 4] 3890 	or	a, a
   7A96 28 2D         [12] 3891 	jr	Z,00119$
                           3892 ;src/main.c:696: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   7A98 C5            [11] 3893 	push	bc
   7A99 FD E1         [14] 3894 	pop	iy
   7A9B FD 7E 13      [19] 3895 	ld	a,19 (iy)
   7A9E B7            [ 4] 3896 	or	a, a
   7A9F 20 07         [12] 3897 	jr	NZ,00109$
                           3898 ;src/main.c:699: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   7AA1 C5            [11] 3899 	push	bc
   7AA2 CD FC 6F      [17] 3900 	call	_moverEnemigoSeek
   7AA5 F1            [10] 3901 	pop	af
   7AA6 18 1D         [12] 3902 	jr	00119$
   7AA8                    3903 00109$:
                           3904 ;src/main.c:700: } else if (actual->inRange) {
   7AA8 1A            [ 7] 3905 	ld	a,(de)
   7AA9 B7            [ 4] 3906 	or	a, a
   7AAA 28 19         [12] 3907 	jr	Z,00119$
                           3908 ;src/main.c:701: engage(actual, prota.x, prota.y);
   7AAC 3A F9 62      [13] 3909 	ld	a, (#_prota + 1)
   7AAF 21 F8 62      [10] 3910 	ld	hl, #_prota + 0
   7AB2 56            [ 7] 3911 	ld	d,(hl)
   7AB3 F5            [11] 3912 	push	af
   7AB4 33            [ 6] 3913 	inc	sp
   7AB5 D5            [11] 3914 	push	de
   7AB6 33            [ 6] 3915 	inc	sp
   7AB7 C5            [11] 3916 	push	bc
   7AB8 CD C5 71      [17] 3917 	call	_engage
   7ABB F1            [10] 3918 	pop	af
   7ABC F1            [10] 3919 	pop	af
                           3920 ;src/main.c:702: actual->engage = 1;
   7ABD DD 6E FC      [19] 3921 	ld	l,-4 (ix)
   7AC0 DD 66 FD      [19] 3922 	ld	h,-3 (ix)
   7AC3 36 01         [10] 3923 	ld	(hl),#0x01
   7AC5                    3924 00119$:
   7AC5 DD F9         [10] 3925 	ld	sp, ix
   7AC7 DD E1         [14] 3926 	pop	ix
   7AC9 C9            [10] 3927 	ret
                           3928 ;src/main.c:708: void inicializarEnemy() {
                           3929 ;	---------------------------------
                           3930 ; Function inicializarEnemy
                           3931 ; ---------------------------------
   7ACA                    3932 _inicializarEnemy::
   7ACA DD E5         [15] 3933 	push	ix
   7ACC DD 21 00 00   [14] 3934 	ld	ix,#0
   7AD0 DD 39         [15] 3935 	add	ix,sp
   7AD2 21 F9 FF      [10] 3936 	ld	hl,#-7
   7AD5 39            [11] 3937 	add	hl,sp
   7AD6 F9            [ 6] 3938 	ld	sp,hl
                           3939 ;src/main.c:719: actual = enemy;
   7AD7 01 70 5F      [10] 3940 	ld	bc,#_enemy+0
                           3941 ;src/main.c:720: while(i){
   7ADA DD 36 F9 02   [19] 3942 	ld	-7 (ix),#0x02
   7ADE                    3943 00103$:
   7ADE DD 7E F9      [19] 3944 	ld	a,-7 (ix)
   7AE1 B7            [ 4] 3945 	or	a, a
   7AE2 CA DE 7B      [10] 3946 	jp	Z,00106$
                           3947 ;src/main.c:721: --i;
   7AE5 DD 35 F9      [23] 3948 	dec	-7 (ix)
                           3949 ;src/main.c:722: actual->x = actual->px = spawnX[i];
   7AE8 59            [ 4] 3950 	ld	e, c
   7AE9 50            [ 4] 3951 	ld	d, b
   7AEA 13            [ 6] 3952 	inc	de
   7AEB 13            [ 6] 3953 	inc	de
   7AEC 3E FB         [ 7] 3954 	ld	a,#<(_spawnX)
   7AEE DD 86 F9      [19] 3955 	add	a, -7 (ix)
   7AF1 DD 77 FE      [19] 3956 	ld	-2 (ix),a
   7AF4 3E 63         [ 7] 3957 	ld	a,#>(_spawnX)
   7AF6 CE 00         [ 7] 3958 	adc	a, #0x00
   7AF8 DD 77 FF      [19] 3959 	ld	-1 (ix),a
   7AFB DD 6E FE      [19] 3960 	ld	l,-2 (ix)
   7AFE DD 66 FF      [19] 3961 	ld	h,-1 (ix)
   7B01 7E            [ 7] 3962 	ld	a,(hl)
   7B02 12            [ 7] 3963 	ld	(de),a
   7B03 02            [ 7] 3964 	ld	(bc),a
                           3965 ;src/main.c:723: actual->y = actual->py = spawnY[i];
   7B04 C5            [11] 3966 	push	bc
   7B05 FD E1         [14] 3967 	pop	iy
   7B07 FD 23         [10] 3968 	inc	iy
   7B09 59            [ 4] 3969 	ld	e, c
   7B0A 50            [ 4] 3970 	ld	d, b
   7B0B 13            [ 6] 3971 	inc	de
   7B0C 13            [ 6] 3972 	inc	de
   7B0D 13            [ 6] 3973 	inc	de
   7B0E 3E FF         [ 7] 3974 	ld	a,#<(_spawnY)
   7B10 DD 86 F9      [19] 3975 	add	a, -7 (ix)
   7B13 DD 77 FC      [19] 3976 	ld	-4 (ix),a
   7B16 3E 63         [ 7] 3977 	ld	a,#>(_spawnY)
   7B18 CE 00         [ 7] 3978 	adc	a, #0x00
   7B1A DD 77 FD      [19] 3979 	ld	-3 (ix),a
   7B1D DD 6E FC      [19] 3980 	ld	l,-4 (ix)
   7B20 DD 66 FD      [19] 3981 	ld	h,-3 (ix)
   7B23 7E            [ 7] 3982 	ld	a,(hl)
   7B24 12            [ 7] 3983 	ld	(de),a
   7B25 FD 77 00      [19] 3984 	ld	0 (iy), a
                           3985 ;src/main.c:724: actual->mover  = NO;
   7B28 21 06 00      [10] 3986 	ld	hl,#0x0006
   7B2B 09            [11] 3987 	add	hl,bc
   7B2C 36 00         [10] 3988 	ld	(hl),#0x00
                           3989 ;src/main.c:725: actual->mira   = M_abajo;
   7B2E 21 07 00      [10] 3990 	ld	hl,#0x0007
   7B31 09            [11] 3991 	add	hl,bc
   7B32 36 03         [10] 3992 	ld	(hl),#0x03
                           3993 ;src/main.c:726: actual->sprite = g_enemy;
   7B34 21 04 00      [10] 3994 	ld	hl,#0x0004
   7B37 09            [11] 3995 	add	hl,bc
   7B38 36 3A         [10] 3996 	ld	(hl),#<(_g_enemy)
   7B3A 23            [ 6] 3997 	inc	hl
   7B3B 36 3C         [10] 3998 	ld	(hl),#>(_g_enemy)
                           3999 ;src/main.c:727: actual->muerto = NO;
   7B3D 21 08 00      [10] 4000 	ld	hl,#0x0008
   7B40 09            [11] 4001 	add	hl,bc
   7B41 36 00         [10] 4002 	ld	(hl),#0x00
                           4003 ;src/main.c:728: actual->muertes = 0;
   7B43 21 0A 00      [10] 4004 	ld	hl,#0x000A
   7B46 09            [11] 4005 	add	hl,bc
   7B47 36 00         [10] 4006 	ld	(hl),#0x00
                           4007 ;src/main.c:729: actual->patrolling = SI;
   7B49 21 0B 00      [10] 4008 	ld	hl,#0x000B
   7B4C 09            [11] 4009 	add	hl,bc
   7B4D 36 01         [10] 4010 	ld	(hl),#0x01
                           4011 ;src/main.c:730: actual->reversePatrol = NO;
   7B4F 21 0C 00      [10] 4012 	ld	hl,#0x000C
   7B52 09            [11] 4013 	add	hl,bc
   7B53 36 00         [10] 4014 	ld	(hl),#0x00
                           4015 ;src/main.c:731: actual->iter = 0;
   7B55 21 0E 00      [10] 4016 	ld	hl,#0x000E
   7B58 09            [11] 4017 	add	hl,bc
   7B59 AF            [ 4] 4018 	xor	a, a
   7B5A 77            [ 7] 4019 	ld	(hl), a
   7B5B 23            [ 6] 4020 	inc	hl
   7B5C 77            [ 7] 4021 	ld	(hl), a
                           4022 ;src/main.c:732: actual->lastIter = 0;
   7B5D 21 10 00      [10] 4023 	ld	hl,#0x0010
   7B60 09            [11] 4024 	add	hl,bc
   7B61 36 00         [10] 4025 	ld	(hl),#0x00
                           4026 ;src/main.c:733: actual->seen = 0;
   7B63 21 12 00      [10] 4027 	ld	hl,#0x0012
   7B66 09            [11] 4028 	add	hl,bc
   7B67 36 00         [10] 4029 	ld	(hl),#0x00
                           4030 ;src/main.c:734: actual->found = 0;
   7B69 21 13 00      [10] 4031 	ld	hl,#0x0013
   7B6C 09            [11] 4032 	add	hl,bc
   7B6D 36 00         [10] 4033 	ld	(hl),#0x00
                           4034 ;src/main.c:735: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B6F 21 D7 63      [10] 4035 	ld	hl,#_num_mapa + 0
   7B72 5E            [ 7] 4036 	ld	e, (hl)
   7B73 1C            [ 4] 4037 	inc	e
   7B74 16 00         [ 7] 4038 	ld	d,#0x00
   7B76 6B            [ 4] 4039 	ld	l, e
   7B77 62            [ 4] 4040 	ld	h, d
   7B78 29            [11] 4041 	add	hl, hl
   7B79 29            [11] 4042 	add	hl, hl
   7B7A 19            [11] 4043 	add	hl, de
   7B7B EB            [ 4] 4044 	ex	de,hl
   7B7C 21 17 64      [10] 4045 	ld	hl,#_patrolY
   7B7F 19            [11] 4046 	add	hl,de
   7B80 DD 7E F9      [19] 4047 	ld	a,-7 (ix)
   7B83 85            [ 4] 4048 	add	a, l
   7B84 6F            [ 4] 4049 	ld	l,a
   7B85 3E 00         [ 7] 4050 	ld	a,#0x00
   7B87 8C            [ 4] 4051 	adc	a, h
   7B88 67            [ 4] 4052 	ld	h,a
   7B89 7E            [ 7] 4053 	ld	a,(hl)
   7B8A DD 77 FB      [19] 4054 	ld	-5 (ix),a
   7B8D 21 03 64      [10] 4055 	ld	hl,#_patrolX
   7B90 19            [11] 4056 	add	hl,de
   7B91 DD 5E F9      [19] 4057 	ld	e,-7 (ix)
   7B94 16 00         [ 7] 4058 	ld	d,#0x00
   7B96 19            [11] 4059 	add	hl,de
   7B97 7E            [ 7] 4060 	ld	a,(hl)
   7B98 DD 77 FA      [19] 4061 	ld	-6 (ix),a
   7B9B DD 6E FC      [19] 4062 	ld	l,-4 (ix)
   7B9E DD 66 FD      [19] 4063 	ld	h,-3 (ix)
   7BA1 5E            [ 7] 4064 	ld	e,(hl)
   7BA2 DD 6E FE      [19] 4065 	ld	l,-2 (ix)
   7BA5 DD 66 FF      [19] 4066 	ld	h,-1 (ix)
   7BA8 56            [ 7] 4067 	ld	d,(hl)
   7BA9 C5            [11] 4068 	push	bc
   7BAA 2A D5 63      [16] 4069 	ld	hl,(_mapa)
   7BAD E5            [11] 4070 	push	hl
   7BAE C5            [11] 4071 	push	bc
   7BAF DD 66 FB      [19] 4072 	ld	h,-5 (ix)
   7BB2 DD 6E FA      [19] 4073 	ld	l,-6 (ix)
   7BB5 E5            [11] 4074 	push	hl
   7BB6 7B            [ 4] 4075 	ld	a,e
   7BB7 F5            [11] 4076 	push	af
   7BB8 33            [ 6] 4077 	inc	sp
   7BB9 D5            [11] 4078 	push	de
   7BBA 33            [ 6] 4079 	inc	sp
   7BBB CD 82 48      [17] 4080 	call	_pathFinding
   7BBE 21 08 00      [10] 4081 	ld	hl,#8
   7BC1 39            [11] 4082 	add	hl,sp
   7BC2 F9            [ 6] 4083 	ld	sp,hl
   7BC3 C1            [10] 4084 	pop	bc
                           4085 ;src/main.c:758: if(actual->longitud_camino > 0){
   7BC4 69            [ 4] 4086 	ld	l, c
   7BC5 60            [ 4] 4087 	ld	h, b
   7BC6 11 E1 00      [10] 4088 	ld	de, #0x00E1
   7BC9 19            [11] 4089 	add	hl, de
   7BCA 7E            [ 7] 4090 	ld	a,(hl)
   7BCB B7            [ 4] 4091 	or	a, a
   7BCC 28 07         [12] 4092 	jr	Z,00102$
                           4093 ;src/main.c:759: dibujarEnemigo(actual);
   7BCE C5            [11] 4094 	push	bc
   7BCF C5            [11] 4095 	push	bc
   7BD0 CD B1 66      [17] 4096 	call	_dibujarEnemigo
   7BD3 F1            [10] 4097 	pop	af
   7BD4 C1            [10] 4098 	pop	bc
   7BD5                    4099 00102$:
                           4100 ;src/main.c:761: ++actual;
   7BD5 21 E2 00      [10] 4101 	ld	hl,#0x00E2
   7BD8 09            [11] 4102 	add	hl,bc
   7BD9 4D            [ 4] 4103 	ld	c,l
   7BDA 44            [ 4] 4104 	ld	b,h
   7BDB C3 DE 7A      [10] 4105 	jp	00103$
   7BDE                    4106 00106$:
   7BDE DD F9         [10] 4107 	ld	sp, ix
   7BE0 DD E1         [14] 4108 	pop	ix
   7BE2 C9            [10] 4109 	ret
                           4110 ;src/main.c:765: void avanzarMapa() {
                           4111 ;	---------------------------------
                           4112 ; Function avanzarMapa
                           4113 ; ---------------------------------
   7BE3                    4114 _avanzarMapa::
                           4115 ;src/main.c:766: if(num_mapa < NUM_MAPAS -1) {
   7BE3 3A D7 63      [13] 4116 	ld	a,(#_num_mapa + 0)
   7BE6 D6 02         [ 7] 4117 	sub	a, #0x02
   7BE8 30 34         [12] 4118 	jr	NC,00102$
                           4119 ;src/main.c:767: mapa = mapas[++num_mapa];
   7BEA 01 F5 63      [10] 4120 	ld	bc,#_mapas+0
   7BED 21 D7 63      [10] 4121 	ld	hl, #_num_mapa+0
   7BF0 34            [11] 4122 	inc	(hl)
   7BF1 FD 21 D7 63   [14] 4123 	ld	iy,#_num_mapa
   7BF5 FD 6E 00      [19] 4124 	ld	l,0 (iy)
   7BF8 26 00         [ 7] 4125 	ld	h,#0x00
   7BFA 29            [11] 4126 	add	hl, hl
   7BFB 09            [11] 4127 	add	hl,bc
   7BFC 7E            [ 7] 4128 	ld	a,(hl)
   7BFD FD 21 D5 63   [14] 4129 	ld	iy,#_mapa
   7C01 FD 77 00      [19] 4130 	ld	0 (iy),a
   7C04 23            [ 6] 4131 	inc	hl
   7C05 7E            [ 7] 4132 	ld	a,(hl)
   7C06 32 D6 63      [13] 4133 	ld	(#_mapa + 1),a
                           4134 ;src/main.c:768: prota.x = prota.px = 2;
   7C09 21 FA 62      [10] 4135 	ld	hl,#(_prota + 0x0002)
   7C0C 36 02         [10] 4136 	ld	(hl),#0x02
   7C0E 21 F8 62      [10] 4137 	ld	hl,#_prota
   7C11 36 02         [10] 4138 	ld	(hl),#0x02
                           4139 ;src/main.c:769: prota.mover = SI;
   7C13 21 FE 62      [10] 4140 	ld	hl,#(_prota + 0x0006)
   7C16 36 01         [10] 4141 	ld	(hl),#0x01
                           4142 ;src/main.c:770: dibujarMapa();
   7C18 CD DF 63      [17] 4143 	call	_dibujarMapa
                           4144 ;src/main.c:771: inicializarEnemy();
   7C1B C3 CA 7A      [10] 4145 	jp  _inicializarEnemy
   7C1E                    4146 00102$:
                           4147 ;src/main.c:774: menuFin(puntuacion);
   7C1E FD 21 D8 63   [14] 4148 	ld	iy,#_puntuacion
   7C22 FD 6E 00      [19] 4149 	ld	l,0 (iy)
   7C25 26 00         [ 7] 4150 	ld	h,#0x00
   7C27 C3 B0 4A      [10] 4151 	jp  _menuFin
                           4152 ;src/main.c:778: void moverIzquierda() {
                           4153 ;	---------------------------------
                           4154 ; Function moverIzquierda
                           4155 ; ---------------------------------
   7C2A                    4156 _moverIzquierda::
                           4157 ;src/main.c:779: prota.mira = M_izquierda;
   7C2A 01 F8 62      [10] 4158 	ld	bc,#_prota+0
   7C2D 21 FF 62      [10] 4159 	ld	hl,#(_prota + 0x0007)
   7C30 36 01         [10] 4160 	ld	(hl),#0x01
                           4161 ;src/main.c:780: if (!checkCollision(M_izquierda)) {
   7C32 C5            [11] 4162 	push	bc
   7C33 3E 01         [ 7] 4163 	ld	a,#0x01
   7C35 F5            [11] 4164 	push	af
   7C36 33            [ 6] 4165 	inc	sp
   7C37 CD 40 65      [17] 4166 	call	_checkCollision
   7C3A 33            [ 6] 4167 	inc	sp
   7C3B C1            [10] 4168 	pop	bc
   7C3C 7D            [ 4] 4169 	ld	a,l
   7C3D B7            [ 4] 4170 	or	a, a
   7C3E C0            [11] 4171 	ret	NZ
                           4172 ;src/main.c:781: prota.x--;
   7C3F 0A            [ 7] 4173 	ld	a,(bc)
   7C40 C6 FF         [ 7] 4174 	add	a,#0xFF
   7C42 02            [ 7] 4175 	ld	(bc),a
                           4176 ;src/main.c:782: prota.mover = SI;
   7C43 21 FE 62      [10] 4177 	ld	hl,#(_prota + 0x0006)
   7C46 36 01         [10] 4178 	ld	(hl),#0x01
                           4179 ;src/main.c:783: prota.sprite = g_hero_left;
   7C48 21 C6 3D      [10] 4180 	ld	hl,#_g_hero_left
   7C4B 22 FC 62      [16] 4181 	ld	((_prota + 0x0004)), hl
   7C4E C9            [10] 4182 	ret
                           4183 ;src/main.c:787: void moverDerecha() {
                           4184 ;	---------------------------------
                           4185 ; Function moverDerecha
                           4186 ; ---------------------------------
   7C4F                    4187 _moverDerecha::
                           4188 ;src/main.c:788: prota.mira = M_derecha;
   7C4F 21 FF 62      [10] 4189 	ld	hl,#(_prota + 0x0007)
   7C52 36 00         [10] 4190 	ld	(hl),#0x00
                           4191 ;src/main.c:789: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C54 AF            [ 4] 4192 	xor	a, a
   7C55 F5            [11] 4193 	push	af
   7C56 33            [ 6] 4194 	inc	sp
   7C57 CD 40 65      [17] 4195 	call	_checkCollision
   7C5A 33            [ 6] 4196 	inc	sp
   7C5B 45            [ 4] 4197 	ld	b,l
   7C5C 21 F8 62      [10] 4198 	ld	hl, #_prota + 0
   7C5F 4E            [ 7] 4199 	ld	c,(hl)
   7C60 59            [ 4] 4200 	ld	e,c
   7C61 16 00         [ 7] 4201 	ld	d,#0x00
   7C63 21 07 00      [10] 4202 	ld	hl,#0x0007
   7C66 19            [11] 4203 	add	hl,de
   7C67 11 50 80      [10] 4204 	ld	de, #0x8050
   7C6A 29            [11] 4205 	add	hl, hl
   7C6B 3F            [ 4] 4206 	ccf
   7C6C CB 1C         [ 8] 4207 	rr	h
   7C6E CB 1D         [ 8] 4208 	rr	l
   7C70 ED 52         [15] 4209 	sbc	hl, de
   7C72 3E 00         [ 7] 4210 	ld	a,#0x00
   7C74 17            [ 4] 4211 	rla
   7C75 5F            [ 4] 4212 	ld	e,a
   7C76 78            [ 4] 4213 	ld	a,b
   7C77 B7            [ 4] 4214 	or	a,a
   7C78 20 14         [12] 4215 	jr	NZ,00104$
   7C7A B3            [ 4] 4216 	or	a,e
   7C7B 28 11         [12] 4217 	jr	Z,00104$
                           4218 ;src/main.c:790: prota.x++;
   7C7D 0C            [ 4] 4219 	inc	c
   7C7E 21 F8 62      [10] 4220 	ld	hl,#_prota
   7C81 71            [ 7] 4221 	ld	(hl),c
                           4222 ;src/main.c:791: prota.mover = SI;
   7C82 21 FE 62      [10] 4223 	ld	hl,#(_prota + 0x0006)
   7C85 36 01         [10] 4224 	ld	(hl),#0x01
                           4225 ;src/main.c:792: prota.sprite = g_hero;
   7C87 21 70 3E      [10] 4226 	ld	hl,#_g_hero
   7C8A 22 FC 62      [16] 4227 	ld	((_prota + 0x0004)), hl
   7C8D C9            [10] 4228 	ret
   7C8E                    4229 00104$:
                           4230 ;src/main.c:794: }else if( prota.x + G_HERO_W >= 80){
   7C8E 7B            [ 4] 4231 	ld	a,e
   7C8F B7            [ 4] 4232 	or	a, a
   7C90 C0            [11] 4233 	ret	NZ
                           4234 ;src/main.c:795: avanzarMapa();
   7C91 C3 E3 7B      [10] 4235 	jp  _avanzarMapa
                           4236 ;src/main.c:799: void moverArriba() {
                           4237 ;	---------------------------------
                           4238 ; Function moverArriba
                           4239 ; ---------------------------------
   7C94                    4240 _moverArriba::
                           4241 ;src/main.c:800: prota.mira = M_arriba;
   7C94 21 FF 62      [10] 4242 	ld	hl,#(_prota + 0x0007)
   7C97 36 02         [10] 4243 	ld	(hl),#0x02
                           4244 ;src/main.c:801: if (!checkCollision(M_arriba)) {
   7C99 3E 02         [ 7] 4245 	ld	a,#0x02
   7C9B F5            [11] 4246 	push	af
   7C9C 33            [ 6] 4247 	inc	sp
   7C9D CD 40 65      [17] 4248 	call	_checkCollision
   7CA0 33            [ 6] 4249 	inc	sp
   7CA1 7D            [ 4] 4250 	ld	a,l
   7CA2 B7            [ 4] 4251 	or	a, a
   7CA3 C0            [11] 4252 	ret	NZ
                           4253 ;src/main.c:802: prota.y--;
   7CA4 21 F9 62      [10] 4254 	ld	hl,#_prota + 1
   7CA7 4E            [ 7] 4255 	ld	c,(hl)
   7CA8 0D            [ 4] 4256 	dec	c
   7CA9 71            [ 7] 4257 	ld	(hl),c
                           4258 ;src/main.c:803: prota.y--;
   7CAA 0D            [ 4] 4259 	dec	c
   7CAB 71            [ 7] 4260 	ld	(hl),c
                           4261 ;src/main.c:804: prota.mover  = SI;
   7CAC 21 FE 62      [10] 4262 	ld	hl,#(_prota + 0x0006)
   7CAF 36 01         [10] 4263 	ld	(hl),#0x01
                           4264 ;src/main.c:805: prota.sprite = g_hero_up;
   7CB1 21 2C 3D      [10] 4265 	ld	hl,#_g_hero_up
   7CB4 22 FC 62      [16] 4266 	ld	((_prota + 0x0004)), hl
   7CB7 C9            [10] 4267 	ret
                           4268 ;src/main.c:809: void moverAbajo() {
                           4269 ;	---------------------------------
                           4270 ; Function moverAbajo
                           4271 ; ---------------------------------
   7CB8                    4272 _moverAbajo::
                           4273 ;src/main.c:810: prota.mira = M_abajo;
   7CB8 21 FF 62      [10] 4274 	ld	hl,#(_prota + 0x0007)
   7CBB 36 03         [10] 4275 	ld	(hl),#0x03
                           4276 ;src/main.c:811: if (!checkCollision(M_abajo) ) {
   7CBD 3E 03         [ 7] 4277 	ld	a,#0x03
   7CBF F5            [11] 4278 	push	af
   7CC0 33            [ 6] 4279 	inc	sp
   7CC1 CD 40 65      [17] 4280 	call	_checkCollision
   7CC4 33            [ 6] 4281 	inc	sp
   7CC5 7D            [ 4] 4282 	ld	a,l
   7CC6 B7            [ 4] 4283 	or	a, a
   7CC7 C0            [11] 4284 	ret	NZ
                           4285 ;src/main.c:812: prota.y++;
   7CC8 01 F9 62      [10] 4286 	ld	bc,#_prota + 1
   7CCB 0A            [ 7] 4287 	ld	a,(bc)
   7CCC 3C            [ 4] 4288 	inc	a
   7CCD 02            [ 7] 4289 	ld	(bc),a
                           4290 ;src/main.c:813: prota.y++;
   7CCE 3C            [ 4] 4291 	inc	a
   7CCF 02            [ 7] 4292 	ld	(bc),a
                           4293 ;src/main.c:814: prota.mover  = SI;
   7CD0 21 FE 62      [10] 4294 	ld	hl,#(_prota + 0x0006)
   7CD3 36 01         [10] 4295 	ld	(hl),#0x01
                           4296 ;src/main.c:815: prota.sprite = g_hero_down;
   7CD5 21 92 3C      [10] 4297 	ld	hl,#_g_hero_down
   7CD8 22 FC 62      [16] 4298 	ld	((_prota + 0x0004)), hl
   7CDB C9            [10] 4299 	ret
                           4300 ;src/main.c:822: void intHandler() {
                           4301 ;	---------------------------------
                           4302 ; Function intHandler
                           4303 ; ---------------------------------
   7CDC                    4304 _intHandler::
                           4305 ;src/main.c:823: if (++i == 6) {
   7CDC 21 0B 63      [10] 4306 	ld	hl, #_i+0
   7CDF 34            [11] 4307 	inc	(hl)
   7CE0 3A 0B 63      [13] 4308 	ld	a,(#_i + 0)
   7CE3 D6 06         [ 7] 4309 	sub	a, #0x06
   7CE5 C0            [11] 4310 	ret	NZ
                           4311 ;src/main.c:824: play();
   7CE6 CD 44 52      [17] 4312 	call	_play
                           4313 ;src/main.c:825: i=0;
   7CE9 21 0B 63      [10] 4314 	ld	hl,#_i + 0
   7CEC 36 00         [10] 4315 	ld	(hl), #0x00
   7CEE C9            [10] 4316 	ret
                           4317 ;src/main.c:829: void inicializarCPC() {
                           4318 ;	---------------------------------
                           4319 ; Function inicializarCPC
                           4320 ; ---------------------------------
   7CEF                    4321 _inicializarCPC::
                           4322 ;src/main.c:830: cpct_disableFirmware();
   7CEF CD EB 55      [17] 4323 	call	_cpct_disableFirmware
                           4324 ;src/main.c:831: cpct_setVideoMode(0);
   7CF2 2E 00         [ 7] 4325 	ld	l,#0x00
   7CF4 CD BF 55      [17] 4326 	call	_cpct_setVideoMode
                           4327 ;src/main.c:832: cpct_setBorder(HW_BLACK);
   7CF7 21 10 14      [10] 4328 	ld	hl,#0x1410
   7CFA E5            [11] 4329 	push	hl
   7CFB CD 22 53      [17] 4330 	call	_cpct_setPALColour
                           4331 ;src/main.c:833: cpct_setPalette(g_palette, 16);
   7CFE 21 10 00      [10] 4332 	ld	hl,#0x0010
   7D01 E5            [11] 4333 	push	hl
   7D02 21 60 3E      [10] 4334 	ld	hl,#_g_palette
   7D05 E5            [11] 4335 	push	hl
   7D06 CD FF 52      [17] 4336 	call	_cpct_setPalette
   7D09 C9            [10] 4337 	ret
                           4338 ;src/main.c:838: void inicializarJuego() {
                           4339 ;	---------------------------------
                           4340 ; Function inicializarJuego
                           4341 ; ---------------------------------
   7D0A                    4342 _inicializarJuego::
                           4343 ;src/main.c:840: num_mapa = 0;
   7D0A 21 D7 63      [10] 4344 	ld	hl,#_num_mapa + 0
   7D0D 36 00         [10] 4345 	ld	(hl), #0x00
                           4346 ;src/main.c:841: mapa = mapas[num_mapa];
   7D0F 21 F5 63      [10] 4347 	ld	hl, #_mapas + 0
   7D12 7E            [ 7] 4348 	ld	a,(hl)
   7D13 FD 21 D5 63   [14] 4349 	ld	iy,#_mapa
   7D17 FD 77 00      [19] 4350 	ld	0 (iy),a
   7D1A 23            [ 6] 4351 	inc	hl
   7D1B 7E            [ 7] 4352 	ld	a,(hl)
   7D1C 32 D6 63      [13] 4353 	ld	(#_mapa + 1),a
                           4354 ;src/main.c:842: cpct_etm_setTileset2x4(g_tileset);
   7D1F 21 E0 17      [10] 4355 	ld	hl,#_g_tileset
   7D22 CD 13 55      [17] 4356 	call	_cpct_etm_setTileset2x4
                           4357 ;src/main.c:844: dibujarMapa();
   7D25 CD DF 63      [17] 4358 	call	_dibujarMapa
                           4359 ;src/main.c:847: barraPuntuacionInicial();
   7D28 CD 50 50      [17] 4360 	call	_barraPuntuacionInicial
                           4361 ;src/main.c:850: prota.x = prota.px = 4;
   7D2B 21 FA 62      [10] 4362 	ld	hl,#(_prota + 0x0002)
   7D2E 36 04         [10] 4363 	ld	(hl),#0x04
   7D30 21 F8 62      [10] 4364 	ld	hl,#_prota
   7D33 36 04         [10] 4365 	ld	(hl),#0x04
                           4366 ;src/main.c:851: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D35 21 FB 62      [10] 4367 	ld	hl,#(_prota + 0x0003)
   7D38 36 68         [10] 4368 	ld	(hl),#0x68
   7D3A 21 F9 62      [10] 4369 	ld	hl,#(_prota + 0x0001)
   7D3D 36 68         [10] 4370 	ld	(hl),#0x68
                           4371 ;src/main.c:852: prota.mover  = NO;
   7D3F 21 FE 62      [10] 4372 	ld	hl,#(_prota + 0x0006)
   7D42 36 00         [10] 4373 	ld	(hl),#0x00
                           4374 ;src/main.c:853: prota.mira=M_derecha;
   7D44 21 FF 62      [10] 4375 	ld	hl,#(_prota + 0x0007)
   7D47 36 00         [10] 4376 	ld	(hl),#0x00
                           4377 ;src/main.c:854: prota.sprite = g_hero;
   7D49 21 70 3E      [10] 4378 	ld	hl,#_g_hero
   7D4C 22 FC 62      [16] 4379 	ld	((_prota + 0x0004)), hl
                           4380 ;src/main.c:858: cu.x = cu.px = 0;
   7D4F 21 02 63      [10] 4381 	ld	hl,#(_cu + 0x0002)
   7D52 36 00         [10] 4382 	ld	(hl),#0x00
   7D54 21 00 63      [10] 4383 	ld	hl,#_cu
   7D57 36 00         [10] 4384 	ld	(hl),#0x00
                           4385 ;src/main.c:859: cu.y = cu.py = 0;
   7D59 21 03 63      [10] 4386 	ld	hl,#(_cu + 0x0003)
   7D5C 36 00         [10] 4387 	ld	(hl),#0x00
   7D5E 21 01 63      [10] 4388 	ld	hl,#(_cu + 0x0001)
   7D61 36 00         [10] 4389 	ld	(hl),#0x00
                           4390 ;src/main.c:860: cu.lanzado = NO;
   7D63 21 06 63      [10] 4391 	ld	hl,#(_cu + 0x0006)
   7D66 36 00         [10] 4392 	ld	(hl),#0x00
                           4393 ;src/main.c:861: cu.mover = NO;
   7D68 21 09 63      [10] 4394 	ld	hl,#(_cu + 0x0009)
   7D6B 36 00         [10] 4395 	ld	(hl),#0x00
                           4396 ;src/main.c:862: cu.off_bound = NO;
   7D6D 21 0A 63      [10] 4397 	ld	hl,#(_cu + 0x000a)
   7D70 36 00         [10] 4398 	ld	(hl),#0x00
                           4399 ;src/main.c:864: inicializarEnemy();
   7D72 CD CA 7A      [17] 4400 	call	_inicializarEnemy
                           4401 ;src/main.c:866: dibujarProta();
   7D75 C3 2B 64      [10] 4402 	jp  _dibujarProta
                           4403 ;src/main.c:869: void main(void) {
                           4404 ;	---------------------------------
                           4405 ; Function main
                           4406 ; ---------------------------------
   7D78                    4407 _main::
   7D78 DD E5         [15] 4408 	push	ix
   7D7A DD 21 00 00   [14] 4409 	ld	ix,#0
   7D7E DD 39         [15] 4410 	add	ix,sp
   7D80 F5            [11] 4411 	push	af
   7D81 3B            [ 6] 4412 	dec	sp
                           4413 ;src/main.c:874: inicializarCPC();
   7D82 CD EF 7C      [17] 4414 	call	_inicializarCPC
                           4415 ;src/main.c:876: menuInicio();
   7D85 CD 71 4F      [17] 4416 	call	_menuInicio
                           4417 ;src/main.c:878: inicializarJuego();
   7D88 CD 0A 7D      [17] 4418 	call	_inicializarJuego
                           4419 ;src/main.c:882: while (1) {
   7D8B                    4420 00119$:
                           4421 ;src/main.c:885: actual = enemy;
                           4422 ;src/main.c:887: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D8B 21 00 01      [10] 4423 	ld	hl,#_g_tablatrans
   7D8E E5            [11] 4424 	push	hl
   7D8F 2A D5 63      [16] 4425 	ld	hl,(_mapa)
   7D92 E5            [11] 4426 	push	hl
   7D93 21 F8 62      [10] 4427 	ld	hl,#_prota
   7D96 E5            [11] 4428 	push	hl
   7D97 21 00 63      [10] 4429 	ld	hl,#_cu
   7D9A E5            [11] 4430 	push	hl
   7D9B CD D9 64      [17] 4431 	call	_comprobarTeclado
   7D9E 21 08 00      [10] 4432 	ld	hl,#8
   7DA1 39            [11] 4433 	add	hl,sp
   7DA2 F9            [ 6] 4434 	ld	sp,hl
                           4435 ;src/main.c:888: moverCuchillo(&cu, mapa);
   7DA3 2A D5 63      [16] 4436 	ld	hl,(_mapa)
   7DA6 E5            [11] 4437 	push	hl
   7DA7 21 00 63      [10] 4438 	ld	hl,#_cu
   7DAA E5            [11] 4439 	push	hl
   7DAB CD 15 43      [17] 4440 	call	_moverCuchillo
   7DAE F1            [10] 4441 	pop	af
   7DAF F1            [10] 4442 	pop	af
                           4443 ;src/main.c:889: while(i){
   7DB0 DD 36 FD 02   [19] 4444 	ld	-3 (ix),#0x02
   7DB4 DD 36 FE 70   [19] 4445 	ld	-2 (ix),#<(_enemy)
   7DB8 DD 36 FF 5F   [19] 4446 	ld	-1 (ix),#>(_enemy)
   7DBC                    4447 00101$:
   7DBC DD 7E FD      [19] 4448 	ld	a,-3 (ix)
   7DBF B7            [ 4] 4449 	or	a, a
   7DC0 28 20         [12] 4450 	jr	Z,00103$
                           4451 ;src/main.c:890: --i;
   7DC2 DD 35 FD      [23] 4452 	dec	-3 (ix)
                           4453 ;src/main.c:891: updateEnemy(actual);
   7DC5 DD 6E FE      [19] 4454 	ld	l,-2 (ix)
   7DC8 DD 66 FF      [19] 4455 	ld	h,-1 (ix)
   7DCB E5            [11] 4456 	push	hl
   7DCC CD 70 79      [17] 4457 	call	_updateEnemy
   7DCF F1            [10] 4458 	pop	af
                           4459 ;src/main.c:892: ++actual;
   7DD0 DD 7E FE      [19] 4460 	ld	a,-2 (ix)
   7DD3 C6 E2         [ 7] 4461 	add	a, #0xE2
   7DD5 DD 77 FE      [19] 4462 	ld	-2 (ix),a
   7DD8 DD 7E FF      [19] 4463 	ld	a,-1 (ix)
   7DDB CE 00         [ 7] 4464 	adc	a, #0x00
   7DDD DD 77 FF      [19] 4465 	ld	-1 (ix),a
   7DE0 18 DA         [12] 4466 	jr	00101$
   7DE2                    4467 00103$:
                           4468 ;src/main.c:895: cpct_waitVSYNC();
   7DE2 CD B7 55      [17] 4469 	call	_cpct_waitVSYNC
                           4470 ;src/main.c:898: if (prota.mover) {
   7DE5 01 FE 62      [10] 4471 	ld	bc,#_prota + 6
   7DE8 0A            [ 7] 4472 	ld	a,(bc)
   7DE9 B7            [ 4] 4473 	or	a, a
   7DEA 28 07         [12] 4474 	jr	Z,00105$
                           4475 ;src/main.c:899: redibujarProta();
   7DEC C5            [11] 4476 	push	bc
   7DED CD C5 64      [17] 4477 	call	_redibujarProta
   7DF0 C1            [10] 4478 	pop	bc
                           4479 ;src/main.c:900: prota.mover = NO;
   7DF1 AF            [ 4] 4480 	xor	a, a
   7DF2 02            [ 7] 4481 	ld	(bc),a
   7DF3                    4482 00105$:
                           4483 ;src/main.c:902: if(cu.lanzado && cu.mover){
   7DF3 21 06 63      [10] 4484 	ld	hl, #(_cu + 0x0006) + 0
   7DF6 4E            [ 7] 4485 	ld	c,(hl)
                           4486 ;src/main.c:903: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4487 ;src/main.c:902: if(cu.lanzado && cu.mover){
   7DF7 79            [ 4] 4488 	ld	a,c
   7DF8 B7            [ 4] 4489 	or	a, a
   7DF9 28 30         [12] 4490 	jr	Z,00110$
   7DFB 3A 09 63      [13] 4491 	ld	a, (#(_cu + 0x0009) + 0)
   7DFE B7            [ 4] 4492 	or	a, a
   7DFF 28 2A         [12] 4493 	jr	Z,00110$
                           4494 ;src/main.c:903: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E01 21 01 63      [10] 4495 	ld	hl, #(_cu + 0x0001) + 0
   7E04 4E            [ 7] 4496 	ld	c,(hl)
   7E05 21 00 63      [10] 4497 	ld	hl, #_cu + 0
   7E08 46            [ 7] 4498 	ld	b,(hl)
   7E09 21 08 63      [10] 4499 	ld	hl, #(_cu + 0x0008) + 0
   7E0C 5E            [ 7] 4500 	ld	e,(hl)
   7E0D 2A D5 63      [16] 4501 	ld	hl,(_mapa)
   7E10 E5            [11] 4502 	push	hl
   7E11 21 00 01      [10] 4503 	ld	hl,#_g_tablatrans
   7E14 E5            [11] 4504 	push	hl
   7E15 21 00 63      [10] 4505 	ld	hl,#_cu
   7E18 E5            [11] 4506 	push	hl
   7E19 79            [ 4] 4507 	ld	a,c
   7E1A F5            [11] 4508 	push	af
   7E1B 33            [ 6] 4509 	inc	sp
   7E1C C5            [11] 4510 	push	bc
   7E1D 33            [ 6] 4511 	inc	sp
   7E1E 7B            [ 4] 4512 	ld	a,e
   7E1F F5            [11] 4513 	push	af
   7E20 33            [ 6] 4514 	inc	sp
   7E21 CD 25 40      [17] 4515 	call	_redibujarCuchillo
   7E24 21 09 00      [10] 4516 	ld	hl,#9
   7E27 39            [11] 4517 	add	hl,sp
   7E28 F9            [ 6] 4518 	ld	sp,hl
   7E29 18 28         [12] 4519 	jr	00111$
   7E2B                    4520 00110$:
                           4521 ;src/main.c:904: }else if (cu.lanzado && !cu.mover){
   7E2B 79            [ 4] 4522 	ld	a,c
   7E2C B7            [ 4] 4523 	or	a, a
   7E2D 28 24         [12] 4524 	jr	Z,00111$
   7E2F 3A 09 63      [13] 4525 	ld	a, (#(_cu + 0x0009) + 0)
   7E32 B7            [ 4] 4526 	or	a, a
   7E33 20 1E         [12] 4527 	jr	NZ,00111$
                           4528 ;src/main.c:905: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E35 21 01 63      [10] 4529 	ld	hl, #(_cu + 0x0001) + 0
   7E38 46            [ 7] 4530 	ld	b,(hl)
   7E39 21 00 63      [10] 4531 	ld	hl, #_cu + 0
   7E3C 4E            [ 7] 4532 	ld	c,(hl)
   7E3D 21 08 63      [10] 4533 	ld	hl, #(_cu + 0x0008) + 0
   7E40 56            [ 7] 4534 	ld	d,(hl)
   7E41 2A D5 63      [16] 4535 	ld	hl,(_mapa)
   7E44 E5            [11] 4536 	push	hl
   7E45 C5            [11] 4537 	push	bc
   7E46 D5            [11] 4538 	push	de
   7E47 33            [ 6] 4539 	inc	sp
   7E48 CD 92 3F      [17] 4540 	call	_borrarCuchillo
   7E4B F1            [10] 4541 	pop	af
   7E4C F1            [10] 4542 	pop	af
   7E4D 33            [ 6] 4543 	inc	sp
                           4544 ;src/main.c:906: cu.lanzado = NO;
   7E4E 21 06 63      [10] 4545 	ld	hl,#(_cu + 0x0006)
   7E51 36 00         [10] 4546 	ld	(hl),#0x00
   7E53                    4547 00111$:
                           4548 ;src/main.c:910: actual = enemy;
   7E53 01 70 5F      [10] 4549 	ld	bc,#_enemy
                           4550 ;src/main.c:911: while(i){
   7E56 DD 36 FD 02   [19] 4551 	ld	-3 (ix),#0x02
   7E5A                    4552 00115$:
   7E5A DD 7E FD      [19] 4553 	ld	a,-3 (ix)
   7E5D B7            [ 4] 4554 	or	a, a
   7E5E 28 2C         [12] 4555 	jr	Z,00117$
                           4556 ;src/main.c:913: --i;
   7E60 DD 35 FD      [23] 4557 	dec	-3 (ix)
                           4558 ;src/main.c:914: if(actual->mover){
   7E63 C5            [11] 4559 	push	bc
   7E64 FD E1         [14] 4560 	pop	iy
   7E66 FD 7E 06      [19] 4561 	ld	a,6 (iy)
   7E69 B7            [ 4] 4562 	or	a, a
   7E6A 28 18         [12] 4563 	jr	Z,00114$
                           4564 ;src/main.c:915: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7E6C 69            [ 4] 4565 	ld	l, c
   7E6D 60            [ 4] 4566 	ld	h, b
   7E6E 23            [ 6] 4567 	inc	hl
   7E6F 23            [ 6] 4568 	inc	hl
   7E70 23            [ 6] 4569 	inc	hl
   7E71 5E            [ 7] 4570 	ld	e,(hl)
   7E72 69            [ 4] 4571 	ld	l, c
   7E73 60            [ 4] 4572 	ld	h, b
   7E74 23            [ 6] 4573 	inc	hl
   7E75 23            [ 6] 4574 	inc	hl
   7E76 56            [ 7] 4575 	ld	d,(hl)
   7E77 C5            [11] 4576 	push	bc
   7E78 C5            [11] 4577 	push	bc
   7E79 7B            [ 4] 4578 	ld	a,e
   7E7A F5            [11] 4579 	push	af
   7E7B 33            [ 6] 4580 	inc	sp
   7E7C D5            [11] 4581 	push	de
   7E7D 33            [ 6] 4582 	inc	sp
   7E7E CD 0F 68      [17] 4583 	call	_redibujarEnemigo
   7E81 F1            [10] 4584 	pop	af
   7E82 F1            [10] 4585 	pop	af
   7E83 C1            [10] 4586 	pop	bc
   7E84                    4587 00114$:
                           4588 ;src/main.c:928: ++actual;
   7E84 21 E2 00      [10] 4589 	ld	hl,#0x00E2
   7E87 09            [11] 4590 	add	hl,bc
   7E88 4D            [ 4] 4591 	ld	c,l
   7E89 44            [ 4] 4592 	ld	b,h
   7E8A 18 CE         [12] 4593 	jr	00115$
   7E8C                    4594 00117$:
                           4595 ;src/main.c:930: cpct_waitVSYNC();
   7E8C CD B7 55      [17] 4596 	call	_cpct_waitVSYNC
   7E8F C3 8B 7D      [10] 4597 	jp	00119$
                           4598 	.area _CODE
                           4599 	.area _INITIALIZER
   63DA                    4600 __xinit__mapa:
   63DA 00 00              4601 	.dw #0x0000
   63DC                    4602 __xinit__num_mapa:
   63DC 00                 4603 	.db #0x00	; 0
   63DD                    4604 __xinit__puntuacion:
   63DD 00                 4605 	.db #0x00	; 0
   63DE                    4606 __xinit__vidas:
   63DE 05                 4607 	.db #0x05	; 5
                           4608 	.area _CABS (ABS)
